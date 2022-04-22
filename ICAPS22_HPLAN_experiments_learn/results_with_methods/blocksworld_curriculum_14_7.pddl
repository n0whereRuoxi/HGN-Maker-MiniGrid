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
      ?auto_304916 - BLOCK
    )
    :vars
    (
      ?auto_304917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304916 ?auto_304917 ) ( CLEAR ?auto_304916 ) ( HAND-EMPTY ) ( not ( = ?auto_304916 ?auto_304917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304916 ?auto_304917 )
      ( !PUTDOWN ?auto_304916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_304919 - BLOCK
    )
    :vars
    (
      ?auto_304920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304919 ?auto_304920 ) ( CLEAR ?auto_304919 ) ( HAND-EMPTY ) ( not ( = ?auto_304919 ?auto_304920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304919 ?auto_304920 )
      ( !PUTDOWN ?auto_304919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_304923 - BLOCK
      ?auto_304924 - BLOCK
    )
    :vars
    (
      ?auto_304925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304923 ) ( ON ?auto_304924 ?auto_304925 ) ( CLEAR ?auto_304924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304923 ) ( not ( = ?auto_304923 ?auto_304924 ) ) ( not ( = ?auto_304923 ?auto_304925 ) ) ( not ( = ?auto_304924 ?auto_304925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304924 ?auto_304925 )
      ( !STACK ?auto_304924 ?auto_304923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_304928 - BLOCK
      ?auto_304929 - BLOCK
    )
    :vars
    (
      ?auto_304930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304928 ) ( ON ?auto_304929 ?auto_304930 ) ( CLEAR ?auto_304929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304928 ) ( not ( = ?auto_304928 ?auto_304929 ) ) ( not ( = ?auto_304928 ?auto_304930 ) ) ( not ( = ?auto_304929 ?auto_304930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304929 ?auto_304930 )
      ( !STACK ?auto_304929 ?auto_304928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_304933 - BLOCK
      ?auto_304934 - BLOCK
    )
    :vars
    (
      ?auto_304935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304934 ?auto_304935 ) ( not ( = ?auto_304933 ?auto_304934 ) ) ( not ( = ?auto_304933 ?auto_304935 ) ) ( not ( = ?auto_304934 ?auto_304935 ) ) ( ON ?auto_304933 ?auto_304934 ) ( CLEAR ?auto_304933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304933 )
      ( MAKE-2PILE ?auto_304933 ?auto_304934 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_304938 - BLOCK
      ?auto_304939 - BLOCK
    )
    :vars
    (
      ?auto_304940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304939 ?auto_304940 ) ( not ( = ?auto_304938 ?auto_304939 ) ) ( not ( = ?auto_304938 ?auto_304940 ) ) ( not ( = ?auto_304939 ?auto_304940 ) ) ( ON ?auto_304938 ?auto_304939 ) ( CLEAR ?auto_304938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304938 )
      ( MAKE-2PILE ?auto_304938 ?auto_304939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_304944 - BLOCK
      ?auto_304945 - BLOCK
      ?auto_304946 - BLOCK
    )
    :vars
    (
      ?auto_304947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304945 ) ( ON ?auto_304946 ?auto_304947 ) ( CLEAR ?auto_304946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304944 ) ( ON ?auto_304945 ?auto_304944 ) ( not ( = ?auto_304944 ?auto_304945 ) ) ( not ( = ?auto_304944 ?auto_304946 ) ) ( not ( = ?auto_304944 ?auto_304947 ) ) ( not ( = ?auto_304945 ?auto_304946 ) ) ( not ( = ?auto_304945 ?auto_304947 ) ) ( not ( = ?auto_304946 ?auto_304947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304946 ?auto_304947 )
      ( !STACK ?auto_304946 ?auto_304945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_304951 - BLOCK
      ?auto_304952 - BLOCK
      ?auto_304953 - BLOCK
    )
    :vars
    (
      ?auto_304954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304952 ) ( ON ?auto_304953 ?auto_304954 ) ( CLEAR ?auto_304953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304951 ) ( ON ?auto_304952 ?auto_304951 ) ( not ( = ?auto_304951 ?auto_304952 ) ) ( not ( = ?auto_304951 ?auto_304953 ) ) ( not ( = ?auto_304951 ?auto_304954 ) ) ( not ( = ?auto_304952 ?auto_304953 ) ) ( not ( = ?auto_304952 ?auto_304954 ) ) ( not ( = ?auto_304953 ?auto_304954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304953 ?auto_304954 )
      ( !STACK ?auto_304953 ?auto_304952 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_304958 - BLOCK
      ?auto_304959 - BLOCK
      ?auto_304960 - BLOCK
    )
    :vars
    (
      ?auto_304961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304960 ?auto_304961 ) ( ON-TABLE ?auto_304958 ) ( not ( = ?auto_304958 ?auto_304959 ) ) ( not ( = ?auto_304958 ?auto_304960 ) ) ( not ( = ?auto_304958 ?auto_304961 ) ) ( not ( = ?auto_304959 ?auto_304960 ) ) ( not ( = ?auto_304959 ?auto_304961 ) ) ( not ( = ?auto_304960 ?auto_304961 ) ) ( CLEAR ?auto_304958 ) ( ON ?auto_304959 ?auto_304960 ) ( CLEAR ?auto_304959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_304958 ?auto_304959 )
      ( MAKE-3PILE ?auto_304958 ?auto_304959 ?auto_304960 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_304965 - BLOCK
      ?auto_304966 - BLOCK
      ?auto_304967 - BLOCK
    )
    :vars
    (
      ?auto_304968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304967 ?auto_304968 ) ( ON-TABLE ?auto_304965 ) ( not ( = ?auto_304965 ?auto_304966 ) ) ( not ( = ?auto_304965 ?auto_304967 ) ) ( not ( = ?auto_304965 ?auto_304968 ) ) ( not ( = ?auto_304966 ?auto_304967 ) ) ( not ( = ?auto_304966 ?auto_304968 ) ) ( not ( = ?auto_304967 ?auto_304968 ) ) ( CLEAR ?auto_304965 ) ( ON ?auto_304966 ?auto_304967 ) ( CLEAR ?auto_304966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_304965 ?auto_304966 )
      ( MAKE-3PILE ?auto_304965 ?auto_304966 ?auto_304967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_304972 - BLOCK
      ?auto_304973 - BLOCK
      ?auto_304974 - BLOCK
    )
    :vars
    (
      ?auto_304975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304974 ?auto_304975 ) ( not ( = ?auto_304972 ?auto_304973 ) ) ( not ( = ?auto_304972 ?auto_304974 ) ) ( not ( = ?auto_304972 ?auto_304975 ) ) ( not ( = ?auto_304973 ?auto_304974 ) ) ( not ( = ?auto_304973 ?auto_304975 ) ) ( not ( = ?auto_304974 ?auto_304975 ) ) ( ON ?auto_304973 ?auto_304974 ) ( ON ?auto_304972 ?auto_304973 ) ( CLEAR ?auto_304972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304972 )
      ( MAKE-3PILE ?auto_304972 ?auto_304973 ?auto_304974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_304979 - BLOCK
      ?auto_304980 - BLOCK
      ?auto_304981 - BLOCK
    )
    :vars
    (
      ?auto_304982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304981 ?auto_304982 ) ( not ( = ?auto_304979 ?auto_304980 ) ) ( not ( = ?auto_304979 ?auto_304981 ) ) ( not ( = ?auto_304979 ?auto_304982 ) ) ( not ( = ?auto_304980 ?auto_304981 ) ) ( not ( = ?auto_304980 ?auto_304982 ) ) ( not ( = ?auto_304981 ?auto_304982 ) ) ( ON ?auto_304980 ?auto_304981 ) ( ON ?auto_304979 ?auto_304980 ) ( CLEAR ?auto_304979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304979 )
      ( MAKE-3PILE ?auto_304979 ?auto_304980 ?auto_304981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_304987 - BLOCK
      ?auto_304988 - BLOCK
      ?auto_304989 - BLOCK
      ?auto_304990 - BLOCK
    )
    :vars
    (
      ?auto_304991 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304989 ) ( ON ?auto_304990 ?auto_304991 ) ( CLEAR ?auto_304990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304987 ) ( ON ?auto_304988 ?auto_304987 ) ( ON ?auto_304989 ?auto_304988 ) ( not ( = ?auto_304987 ?auto_304988 ) ) ( not ( = ?auto_304987 ?auto_304989 ) ) ( not ( = ?auto_304987 ?auto_304990 ) ) ( not ( = ?auto_304987 ?auto_304991 ) ) ( not ( = ?auto_304988 ?auto_304989 ) ) ( not ( = ?auto_304988 ?auto_304990 ) ) ( not ( = ?auto_304988 ?auto_304991 ) ) ( not ( = ?auto_304989 ?auto_304990 ) ) ( not ( = ?auto_304989 ?auto_304991 ) ) ( not ( = ?auto_304990 ?auto_304991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304990 ?auto_304991 )
      ( !STACK ?auto_304990 ?auto_304989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_304996 - BLOCK
      ?auto_304997 - BLOCK
      ?auto_304998 - BLOCK
      ?auto_304999 - BLOCK
    )
    :vars
    (
      ?auto_305000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304998 ) ( ON ?auto_304999 ?auto_305000 ) ( CLEAR ?auto_304999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304996 ) ( ON ?auto_304997 ?auto_304996 ) ( ON ?auto_304998 ?auto_304997 ) ( not ( = ?auto_304996 ?auto_304997 ) ) ( not ( = ?auto_304996 ?auto_304998 ) ) ( not ( = ?auto_304996 ?auto_304999 ) ) ( not ( = ?auto_304996 ?auto_305000 ) ) ( not ( = ?auto_304997 ?auto_304998 ) ) ( not ( = ?auto_304997 ?auto_304999 ) ) ( not ( = ?auto_304997 ?auto_305000 ) ) ( not ( = ?auto_304998 ?auto_304999 ) ) ( not ( = ?auto_304998 ?auto_305000 ) ) ( not ( = ?auto_304999 ?auto_305000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304999 ?auto_305000 )
      ( !STACK ?auto_304999 ?auto_304998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_305005 - BLOCK
      ?auto_305006 - BLOCK
      ?auto_305007 - BLOCK
      ?auto_305008 - BLOCK
    )
    :vars
    (
      ?auto_305009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305008 ?auto_305009 ) ( ON-TABLE ?auto_305005 ) ( ON ?auto_305006 ?auto_305005 ) ( not ( = ?auto_305005 ?auto_305006 ) ) ( not ( = ?auto_305005 ?auto_305007 ) ) ( not ( = ?auto_305005 ?auto_305008 ) ) ( not ( = ?auto_305005 ?auto_305009 ) ) ( not ( = ?auto_305006 ?auto_305007 ) ) ( not ( = ?auto_305006 ?auto_305008 ) ) ( not ( = ?auto_305006 ?auto_305009 ) ) ( not ( = ?auto_305007 ?auto_305008 ) ) ( not ( = ?auto_305007 ?auto_305009 ) ) ( not ( = ?auto_305008 ?auto_305009 ) ) ( CLEAR ?auto_305006 ) ( ON ?auto_305007 ?auto_305008 ) ( CLEAR ?auto_305007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305005 ?auto_305006 ?auto_305007 )
      ( MAKE-4PILE ?auto_305005 ?auto_305006 ?auto_305007 ?auto_305008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_305014 - BLOCK
      ?auto_305015 - BLOCK
      ?auto_305016 - BLOCK
      ?auto_305017 - BLOCK
    )
    :vars
    (
      ?auto_305018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305017 ?auto_305018 ) ( ON-TABLE ?auto_305014 ) ( ON ?auto_305015 ?auto_305014 ) ( not ( = ?auto_305014 ?auto_305015 ) ) ( not ( = ?auto_305014 ?auto_305016 ) ) ( not ( = ?auto_305014 ?auto_305017 ) ) ( not ( = ?auto_305014 ?auto_305018 ) ) ( not ( = ?auto_305015 ?auto_305016 ) ) ( not ( = ?auto_305015 ?auto_305017 ) ) ( not ( = ?auto_305015 ?auto_305018 ) ) ( not ( = ?auto_305016 ?auto_305017 ) ) ( not ( = ?auto_305016 ?auto_305018 ) ) ( not ( = ?auto_305017 ?auto_305018 ) ) ( CLEAR ?auto_305015 ) ( ON ?auto_305016 ?auto_305017 ) ( CLEAR ?auto_305016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305014 ?auto_305015 ?auto_305016 )
      ( MAKE-4PILE ?auto_305014 ?auto_305015 ?auto_305016 ?auto_305017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_305023 - BLOCK
      ?auto_305024 - BLOCK
      ?auto_305025 - BLOCK
      ?auto_305026 - BLOCK
    )
    :vars
    (
      ?auto_305027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305026 ?auto_305027 ) ( ON-TABLE ?auto_305023 ) ( not ( = ?auto_305023 ?auto_305024 ) ) ( not ( = ?auto_305023 ?auto_305025 ) ) ( not ( = ?auto_305023 ?auto_305026 ) ) ( not ( = ?auto_305023 ?auto_305027 ) ) ( not ( = ?auto_305024 ?auto_305025 ) ) ( not ( = ?auto_305024 ?auto_305026 ) ) ( not ( = ?auto_305024 ?auto_305027 ) ) ( not ( = ?auto_305025 ?auto_305026 ) ) ( not ( = ?auto_305025 ?auto_305027 ) ) ( not ( = ?auto_305026 ?auto_305027 ) ) ( ON ?auto_305025 ?auto_305026 ) ( CLEAR ?auto_305023 ) ( ON ?auto_305024 ?auto_305025 ) ( CLEAR ?auto_305024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305023 ?auto_305024 )
      ( MAKE-4PILE ?auto_305023 ?auto_305024 ?auto_305025 ?auto_305026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_305032 - BLOCK
      ?auto_305033 - BLOCK
      ?auto_305034 - BLOCK
      ?auto_305035 - BLOCK
    )
    :vars
    (
      ?auto_305036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305035 ?auto_305036 ) ( ON-TABLE ?auto_305032 ) ( not ( = ?auto_305032 ?auto_305033 ) ) ( not ( = ?auto_305032 ?auto_305034 ) ) ( not ( = ?auto_305032 ?auto_305035 ) ) ( not ( = ?auto_305032 ?auto_305036 ) ) ( not ( = ?auto_305033 ?auto_305034 ) ) ( not ( = ?auto_305033 ?auto_305035 ) ) ( not ( = ?auto_305033 ?auto_305036 ) ) ( not ( = ?auto_305034 ?auto_305035 ) ) ( not ( = ?auto_305034 ?auto_305036 ) ) ( not ( = ?auto_305035 ?auto_305036 ) ) ( ON ?auto_305034 ?auto_305035 ) ( CLEAR ?auto_305032 ) ( ON ?auto_305033 ?auto_305034 ) ( CLEAR ?auto_305033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305032 ?auto_305033 )
      ( MAKE-4PILE ?auto_305032 ?auto_305033 ?auto_305034 ?auto_305035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_305041 - BLOCK
      ?auto_305042 - BLOCK
      ?auto_305043 - BLOCK
      ?auto_305044 - BLOCK
    )
    :vars
    (
      ?auto_305045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305044 ?auto_305045 ) ( not ( = ?auto_305041 ?auto_305042 ) ) ( not ( = ?auto_305041 ?auto_305043 ) ) ( not ( = ?auto_305041 ?auto_305044 ) ) ( not ( = ?auto_305041 ?auto_305045 ) ) ( not ( = ?auto_305042 ?auto_305043 ) ) ( not ( = ?auto_305042 ?auto_305044 ) ) ( not ( = ?auto_305042 ?auto_305045 ) ) ( not ( = ?auto_305043 ?auto_305044 ) ) ( not ( = ?auto_305043 ?auto_305045 ) ) ( not ( = ?auto_305044 ?auto_305045 ) ) ( ON ?auto_305043 ?auto_305044 ) ( ON ?auto_305042 ?auto_305043 ) ( ON ?auto_305041 ?auto_305042 ) ( CLEAR ?auto_305041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305041 )
      ( MAKE-4PILE ?auto_305041 ?auto_305042 ?auto_305043 ?auto_305044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_305050 - BLOCK
      ?auto_305051 - BLOCK
      ?auto_305052 - BLOCK
      ?auto_305053 - BLOCK
    )
    :vars
    (
      ?auto_305054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305053 ?auto_305054 ) ( not ( = ?auto_305050 ?auto_305051 ) ) ( not ( = ?auto_305050 ?auto_305052 ) ) ( not ( = ?auto_305050 ?auto_305053 ) ) ( not ( = ?auto_305050 ?auto_305054 ) ) ( not ( = ?auto_305051 ?auto_305052 ) ) ( not ( = ?auto_305051 ?auto_305053 ) ) ( not ( = ?auto_305051 ?auto_305054 ) ) ( not ( = ?auto_305052 ?auto_305053 ) ) ( not ( = ?auto_305052 ?auto_305054 ) ) ( not ( = ?auto_305053 ?auto_305054 ) ) ( ON ?auto_305052 ?auto_305053 ) ( ON ?auto_305051 ?auto_305052 ) ( ON ?auto_305050 ?auto_305051 ) ( CLEAR ?auto_305050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305050 )
      ( MAKE-4PILE ?auto_305050 ?auto_305051 ?auto_305052 ?auto_305053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305060 - BLOCK
      ?auto_305061 - BLOCK
      ?auto_305062 - BLOCK
      ?auto_305063 - BLOCK
      ?auto_305064 - BLOCK
    )
    :vars
    (
      ?auto_305065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305063 ) ( ON ?auto_305064 ?auto_305065 ) ( CLEAR ?auto_305064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305060 ) ( ON ?auto_305061 ?auto_305060 ) ( ON ?auto_305062 ?auto_305061 ) ( ON ?auto_305063 ?auto_305062 ) ( not ( = ?auto_305060 ?auto_305061 ) ) ( not ( = ?auto_305060 ?auto_305062 ) ) ( not ( = ?auto_305060 ?auto_305063 ) ) ( not ( = ?auto_305060 ?auto_305064 ) ) ( not ( = ?auto_305060 ?auto_305065 ) ) ( not ( = ?auto_305061 ?auto_305062 ) ) ( not ( = ?auto_305061 ?auto_305063 ) ) ( not ( = ?auto_305061 ?auto_305064 ) ) ( not ( = ?auto_305061 ?auto_305065 ) ) ( not ( = ?auto_305062 ?auto_305063 ) ) ( not ( = ?auto_305062 ?auto_305064 ) ) ( not ( = ?auto_305062 ?auto_305065 ) ) ( not ( = ?auto_305063 ?auto_305064 ) ) ( not ( = ?auto_305063 ?auto_305065 ) ) ( not ( = ?auto_305064 ?auto_305065 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305064 ?auto_305065 )
      ( !STACK ?auto_305064 ?auto_305063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305071 - BLOCK
      ?auto_305072 - BLOCK
      ?auto_305073 - BLOCK
      ?auto_305074 - BLOCK
      ?auto_305075 - BLOCK
    )
    :vars
    (
      ?auto_305076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305074 ) ( ON ?auto_305075 ?auto_305076 ) ( CLEAR ?auto_305075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305071 ) ( ON ?auto_305072 ?auto_305071 ) ( ON ?auto_305073 ?auto_305072 ) ( ON ?auto_305074 ?auto_305073 ) ( not ( = ?auto_305071 ?auto_305072 ) ) ( not ( = ?auto_305071 ?auto_305073 ) ) ( not ( = ?auto_305071 ?auto_305074 ) ) ( not ( = ?auto_305071 ?auto_305075 ) ) ( not ( = ?auto_305071 ?auto_305076 ) ) ( not ( = ?auto_305072 ?auto_305073 ) ) ( not ( = ?auto_305072 ?auto_305074 ) ) ( not ( = ?auto_305072 ?auto_305075 ) ) ( not ( = ?auto_305072 ?auto_305076 ) ) ( not ( = ?auto_305073 ?auto_305074 ) ) ( not ( = ?auto_305073 ?auto_305075 ) ) ( not ( = ?auto_305073 ?auto_305076 ) ) ( not ( = ?auto_305074 ?auto_305075 ) ) ( not ( = ?auto_305074 ?auto_305076 ) ) ( not ( = ?auto_305075 ?auto_305076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305075 ?auto_305076 )
      ( !STACK ?auto_305075 ?auto_305074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305082 - BLOCK
      ?auto_305083 - BLOCK
      ?auto_305084 - BLOCK
      ?auto_305085 - BLOCK
      ?auto_305086 - BLOCK
    )
    :vars
    (
      ?auto_305087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305086 ?auto_305087 ) ( ON-TABLE ?auto_305082 ) ( ON ?auto_305083 ?auto_305082 ) ( ON ?auto_305084 ?auto_305083 ) ( not ( = ?auto_305082 ?auto_305083 ) ) ( not ( = ?auto_305082 ?auto_305084 ) ) ( not ( = ?auto_305082 ?auto_305085 ) ) ( not ( = ?auto_305082 ?auto_305086 ) ) ( not ( = ?auto_305082 ?auto_305087 ) ) ( not ( = ?auto_305083 ?auto_305084 ) ) ( not ( = ?auto_305083 ?auto_305085 ) ) ( not ( = ?auto_305083 ?auto_305086 ) ) ( not ( = ?auto_305083 ?auto_305087 ) ) ( not ( = ?auto_305084 ?auto_305085 ) ) ( not ( = ?auto_305084 ?auto_305086 ) ) ( not ( = ?auto_305084 ?auto_305087 ) ) ( not ( = ?auto_305085 ?auto_305086 ) ) ( not ( = ?auto_305085 ?auto_305087 ) ) ( not ( = ?auto_305086 ?auto_305087 ) ) ( CLEAR ?auto_305084 ) ( ON ?auto_305085 ?auto_305086 ) ( CLEAR ?auto_305085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305082 ?auto_305083 ?auto_305084 ?auto_305085 )
      ( MAKE-5PILE ?auto_305082 ?auto_305083 ?auto_305084 ?auto_305085 ?auto_305086 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305093 - BLOCK
      ?auto_305094 - BLOCK
      ?auto_305095 - BLOCK
      ?auto_305096 - BLOCK
      ?auto_305097 - BLOCK
    )
    :vars
    (
      ?auto_305098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305097 ?auto_305098 ) ( ON-TABLE ?auto_305093 ) ( ON ?auto_305094 ?auto_305093 ) ( ON ?auto_305095 ?auto_305094 ) ( not ( = ?auto_305093 ?auto_305094 ) ) ( not ( = ?auto_305093 ?auto_305095 ) ) ( not ( = ?auto_305093 ?auto_305096 ) ) ( not ( = ?auto_305093 ?auto_305097 ) ) ( not ( = ?auto_305093 ?auto_305098 ) ) ( not ( = ?auto_305094 ?auto_305095 ) ) ( not ( = ?auto_305094 ?auto_305096 ) ) ( not ( = ?auto_305094 ?auto_305097 ) ) ( not ( = ?auto_305094 ?auto_305098 ) ) ( not ( = ?auto_305095 ?auto_305096 ) ) ( not ( = ?auto_305095 ?auto_305097 ) ) ( not ( = ?auto_305095 ?auto_305098 ) ) ( not ( = ?auto_305096 ?auto_305097 ) ) ( not ( = ?auto_305096 ?auto_305098 ) ) ( not ( = ?auto_305097 ?auto_305098 ) ) ( CLEAR ?auto_305095 ) ( ON ?auto_305096 ?auto_305097 ) ( CLEAR ?auto_305096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305093 ?auto_305094 ?auto_305095 ?auto_305096 )
      ( MAKE-5PILE ?auto_305093 ?auto_305094 ?auto_305095 ?auto_305096 ?auto_305097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305104 - BLOCK
      ?auto_305105 - BLOCK
      ?auto_305106 - BLOCK
      ?auto_305107 - BLOCK
      ?auto_305108 - BLOCK
    )
    :vars
    (
      ?auto_305109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305108 ?auto_305109 ) ( ON-TABLE ?auto_305104 ) ( ON ?auto_305105 ?auto_305104 ) ( not ( = ?auto_305104 ?auto_305105 ) ) ( not ( = ?auto_305104 ?auto_305106 ) ) ( not ( = ?auto_305104 ?auto_305107 ) ) ( not ( = ?auto_305104 ?auto_305108 ) ) ( not ( = ?auto_305104 ?auto_305109 ) ) ( not ( = ?auto_305105 ?auto_305106 ) ) ( not ( = ?auto_305105 ?auto_305107 ) ) ( not ( = ?auto_305105 ?auto_305108 ) ) ( not ( = ?auto_305105 ?auto_305109 ) ) ( not ( = ?auto_305106 ?auto_305107 ) ) ( not ( = ?auto_305106 ?auto_305108 ) ) ( not ( = ?auto_305106 ?auto_305109 ) ) ( not ( = ?auto_305107 ?auto_305108 ) ) ( not ( = ?auto_305107 ?auto_305109 ) ) ( not ( = ?auto_305108 ?auto_305109 ) ) ( ON ?auto_305107 ?auto_305108 ) ( CLEAR ?auto_305105 ) ( ON ?auto_305106 ?auto_305107 ) ( CLEAR ?auto_305106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305104 ?auto_305105 ?auto_305106 )
      ( MAKE-5PILE ?auto_305104 ?auto_305105 ?auto_305106 ?auto_305107 ?auto_305108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305115 - BLOCK
      ?auto_305116 - BLOCK
      ?auto_305117 - BLOCK
      ?auto_305118 - BLOCK
      ?auto_305119 - BLOCK
    )
    :vars
    (
      ?auto_305120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305119 ?auto_305120 ) ( ON-TABLE ?auto_305115 ) ( ON ?auto_305116 ?auto_305115 ) ( not ( = ?auto_305115 ?auto_305116 ) ) ( not ( = ?auto_305115 ?auto_305117 ) ) ( not ( = ?auto_305115 ?auto_305118 ) ) ( not ( = ?auto_305115 ?auto_305119 ) ) ( not ( = ?auto_305115 ?auto_305120 ) ) ( not ( = ?auto_305116 ?auto_305117 ) ) ( not ( = ?auto_305116 ?auto_305118 ) ) ( not ( = ?auto_305116 ?auto_305119 ) ) ( not ( = ?auto_305116 ?auto_305120 ) ) ( not ( = ?auto_305117 ?auto_305118 ) ) ( not ( = ?auto_305117 ?auto_305119 ) ) ( not ( = ?auto_305117 ?auto_305120 ) ) ( not ( = ?auto_305118 ?auto_305119 ) ) ( not ( = ?auto_305118 ?auto_305120 ) ) ( not ( = ?auto_305119 ?auto_305120 ) ) ( ON ?auto_305118 ?auto_305119 ) ( CLEAR ?auto_305116 ) ( ON ?auto_305117 ?auto_305118 ) ( CLEAR ?auto_305117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305115 ?auto_305116 ?auto_305117 )
      ( MAKE-5PILE ?auto_305115 ?auto_305116 ?auto_305117 ?auto_305118 ?auto_305119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305126 - BLOCK
      ?auto_305127 - BLOCK
      ?auto_305128 - BLOCK
      ?auto_305129 - BLOCK
      ?auto_305130 - BLOCK
    )
    :vars
    (
      ?auto_305131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305130 ?auto_305131 ) ( ON-TABLE ?auto_305126 ) ( not ( = ?auto_305126 ?auto_305127 ) ) ( not ( = ?auto_305126 ?auto_305128 ) ) ( not ( = ?auto_305126 ?auto_305129 ) ) ( not ( = ?auto_305126 ?auto_305130 ) ) ( not ( = ?auto_305126 ?auto_305131 ) ) ( not ( = ?auto_305127 ?auto_305128 ) ) ( not ( = ?auto_305127 ?auto_305129 ) ) ( not ( = ?auto_305127 ?auto_305130 ) ) ( not ( = ?auto_305127 ?auto_305131 ) ) ( not ( = ?auto_305128 ?auto_305129 ) ) ( not ( = ?auto_305128 ?auto_305130 ) ) ( not ( = ?auto_305128 ?auto_305131 ) ) ( not ( = ?auto_305129 ?auto_305130 ) ) ( not ( = ?auto_305129 ?auto_305131 ) ) ( not ( = ?auto_305130 ?auto_305131 ) ) ( ON ?auto_305129 ?auto_305130 ) ( ON ?auto_305128 ?auto_305129 ) ( CLEAR ?auto_305126 ) ( ON ?auto_305127 ?auto_305128 ) ( CLEAR ?auto_305127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305126 ?auto_305127 )
      ( MAKE-5PILE ?auto_305126 ?auto_305127 ?auto_305128 ?auto_305129 ?auto_305130 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305137 - BLOCK
      ?auto_305138 - BLOCK
      ?auto_305139 - BLOCK
      ?auto_305140 - BLOCK
      ?auto_305141 - BLOCK
    )
    :vars
    (
      ?auto_305142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305141 ?auto_305142 ) ( ON-TABLE ?auto_305137 ) ( not ( = ?auto_305137 ?auto_305138 ) ) ( not ( = ?auto_305137 ?auto_305139 ) ) ( not ( = ?auto_305137 ?auto_305140 ) ) ( not ( = ?auto_305137 ?auto_305141 ) ) ( not ( = ?auto_305137 ?auto_305142 ) ) ( not ( = ?auto_305138 ?auto_305139 ) ) ( not ( = ?auto_305138 ?auto_305140 ) ) ( not ( = ?auto_305138 ?auto_305141 ) ) ( not ( = ?auto_305138 ?auto_305142 ) ) ( not ( = ?auto_305139 ?auto_305140 ) ) ( not ( = ?auto_305139 ?auto_305141 ) ) ( not ( = ?auto_305139 ?auto_305142 ) ) ( not ( = ?auto_305140 ?auto_305141 ) ) ( not ( = ?auto_305140 ?auto_305142 ) ) ( not ( = ?auto_305141 ?auto_305142 ) ) ( ON ?auto_305140 ?auto_305141 ) ( ON ?auto_305139 ?auto_305140 ) ( CLEAR ?auto_305137 ) ( ON ?auto_305138 ?auto_305139 ) ( CLEAR ?auto_305138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305137 ?auto_305138 )
      ( MAKE-5PILE ?auto_305137 ?auto_305138 ?auto_305139 ?auto_305140 ?auto_305141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305148 - BLOCK
      ?auto_305149 - BLOCK
      ?auto_305150 - BLOCK
      ?auto_305151 - BLOCK
      ?auto_305152 - BLOCK
    )
    :vars
    (
      ?auto_305153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305152 ?auto_305153 ) ( not ( = ?auto_305148 ?auto_305149 ) ) ( not ( = ?auto_305148 ?auto_305150 ) ) ( not ( = ?auto_305148 ?auto_305151 ) ) ( not ( = ?auto_305148 ?auto_305152 ) ) ( not ( = ?auto_305148 ?auto_305153 ) ) ( not ( = ?auto_305149 ?auto_305150 ) ) ( not ( = ?auto_305149 ?auto_305151 ) ) ( not ( = ?auto_305149 ?auto_305152 ) ) ( not ( = ?auto_305149 ?auto_305153 ) ) ( not ( = ?auto_305150 ?auto_305151 ) ) ( not ( = ?auto_305150 ?auto_305152 ) ) ( not ( = ?auto_305150 ?auto_305153 ) ) ( not ( = ?auto_305151 ?auto_305152 ) ) ( not ( = ?auto_305151 ?auto_305153 ) ) ( not ( = ?auto_305152 ?auto_305153 ) ) ( ON ?auto_305151 ?auto_305152 ) ( ON ?auto_305150 ?auto_305151 ) ( ON ?auto_305149 ?auto_305150 ) ( ON ?auto_305148 ?auto_305149 ) ( CLEAR ?auto_305148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305148 )
      ( MAKE-5PILE ?auto_305148 ?auto_305149 ?auto_305150 ?auto_305151 ?auto_305152 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_305159 - BLOCK
      ?auto_305160 - BLOCK
      ?auto_305161 - BLOCK
      ?auto_305162 - BLOCK
      ?auto_305163 - BLOCK
    )
    :vars
    (
      ?auto_305164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305163 ?auto_305164 ) ( not ( = ?auto_305159 ?auto_305160 ) ) ( not ( = ?auto_305159 ?auto_305161 ) ) ( not ( = ?auto_305159 ?auto_305162 ) ) ( not ( = ?auto_305159 ?auto_305163 ) ) ( not ( = ?auto_305159 ?auto_305164 ) ) ( not ( = ?auto_305160 ?auto_305161 ) ) ( not ( = ?auto_305160 ?auto_305162 ) ) ( not ( = ?auto_305160 ?auto_305163 ) ) ( not ( = ?auto_305160 ?auto_305164 ) ) ( not ( = ?auto_305161 ?auto_305162 ) ) ( not ( = ?auto_305161 ?auto_305163 ) ) ( not ( = ?auto_305161 ?auto_305164 ) ) ( not ( = ?auto_305162 ?auto_305163 ) ) ( not ( = ?auto_305162 ?auto_305164 ) ) ( not ( = ?auto_305163 ?auto_305164 ) ) ( ON ?auto_305162 ?auto_305163 ) ( ON ?auto_305161 ?auto_305162 ) ( ON ?auto_305160 ?auto_305161 ) ( ON ?auto_305159 ?auto_305160 ) ( CLEAR ?auto_305159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305159 )
      ( MAKE-5PILE ?auto_305159 ?auto_305160 ?auto_305161 ?auto_305162 ?auto_305163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305171 - BLOCK
      ?auto_305172 - BLOCK
      ?auto_305173 - BLOCK
      ?auto_305174 - BLOCK
      ?auto_305175 - BLOCK
      ?auto_305176 - BLOCK
    )
    :vars
    (
      ?auto_305177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305175 ) ( ON ?auto_305176 ?auto_305177 ) ( CLEAR ?auto_305176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305171 ) ( ON ?auto_305172 ?auto_305171 ) ( ON ?auto_305173 ?auto_305172 ) ( ON ?auto_305174 ?auto_305173 ) ( ON ?auto_305175 ?auto_305174 ) ( not ( = ?auto_305171 ?auto_305172 ) ) ( not ( = ?auto_305171 ?auto_305173 ) ) ( not ( = ?auto_305171 ?auto_305174 ) ) ( not ( = ?auto_305171 ?auto_305175 ) ) ( not ( = ?auto_305171 ?auto_305176 ) ) ( not ( = ?auto_305171 ?auto_305177 ) ) ( not ( = ?auto_305172 ?auto_305173 ) ) ( not ( = ?auto_305172 ?auto_305174 ) ) ( not ( = ?auto_305172 ?auto_305175 ) ) ( not ( = ?auto_305172 ?auto_305176 ) ) ( not ( = ?auto_305172 ?auto_305177 ) ) ( not ( = ?auto_305173 ?auto_305174 ) ) ( not ( = ?auto_305173 ?auto_305175 ) ) ( not ( = ?auto_305173 ?auto_305176 ) ) ( not ( = ?auto_305173 ?auto_305177 ) ) ( not ( = ?auto_305174 ?auto_305175 ) ) ( not ( = ?auto_305174 ?auto_305176 ) ) ( not ( = ?auto_305174 ?auto_305177 ) ) ( not ( = ?auto_305175 ?auto_305176 ) ) ( not ( = ?auto_305175 ?auto_305177 ) ) ( not ( = ?auto_305176 ?auto_305177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305176 ?auto_305177 )
      ( !STACK ?auto_305176 ?auto_305175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305184 - BLOCK
      ?auto_305185 - BLOCK
      ?auto_305186 - BLOCK
      ?auto_305187 - BLOCK
      ?auto_305188 - BLOCK
      ?auto_305189 - BLOCK
    )
    :vars
    (
      ?auto_305190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305188 ) ( ON ?auto_305189 ?auto_305190 ) ( CLEAR ?auto_305189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305184 ) ( ON ?auto_305185 ?auto_305184 ) ( ON ?auto_305186 ?auto_305185 ) ( ON ?auto_305187 ?auto_305186 ) ( ON ?auto_305188 ?auto_305187 ) ( not ( = ?auto_305184 ?auto_305185 ) ) ( not ( = ?auto_305184 ?auto_305186 ) ) ( not ( = ?auto_305184 ?auto_305187 ) ) ( not ( = ?auto_305184 ?auto_305188 ) ) ( not ( = ?auto_305184 ?auto_305189 ) ) ( not ( = ?auto_305184 ?auto_305190 ) ) ( not ( = ?auto_305185 ?auto_305186 ) ) ( not ( = ?auto_305185 ?auto_305187 ) ) ( not ( = ?auto_305185 ?auto_305188 ) ) ( not ( = ?auto_305185 ?auto_305189 ) ) ( not ( = ?auto_305185 ?auto_305190 ) ) ( not ( = ?auto_305186 ?auto_305187 ) ) ( not ( = ?auto_305186 ?auto_305188 ) ) ( not ( = ?auto_305186 ?auto_305189 ) ) ( not ( = ?auto_305186 ?auto_305190 ) ) ( not ( = ?auto_305187 ?auto_305188 ) ) ( not ( = ?auto_305187 ?auto_305189 ) ) ( not ( = ?auto_305187 ?auto_305190 ) ) ( not ( = ?auto_305188 ?auto_305189 ) ) ( not ( = ?auto_305188 ?auto_305190 ) ) ( not ( = ?auto_305189 ?auto_305190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305189 ?auto_305190 )
      ( !STACK ?auto_305189 ?auto_305188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305197 - BLOCK
      ?auto_305198 - BLOCK
      ?auto_305199 - BLOCK
      ?auto_305200 - BLOCK
      ?auto_305201 - BLOCK
      ?auto_305202 - BLOCK
    )
    :vars
    (
      ?auto_305203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305202 ?auto_305203 ) ( ON-TABLE ?auto_305197 ) ( ON ?auto_305198 ?auto_305197 ) ( ON ?auto_305199 ?auto_305198 ) ( ON ?auto_305200 ?auto_305199 ) ( not ( = ?auto_305197 ?auto_305198 ) ) ( not ( = ?auto_305197 ?auto_305199 ) ) ( not ( = ?auto_305197 ?auto_305200 ) ) ( not ( = ?auto_305197 ?auto_305201 ) ) ( not ( = ?auto_305197 ?auto_305202 ) ) ( not ( = ?auto_305197 ?auto_305203 ) ) ( not ( = ?auto_305198 ?auto_305199 ) ) ( not ( = ?auto_305198 ?auto_305200 ) ) ( not ( = ?auto_305198 ?auto_305201 ) ) ( not ( = ?auto_305198 ?auto_305202 ) ) ( not ( = ?auto_305198 ?auto_305203 ) ) ( not ( = ?auto_305199 ?auto_305200 ) ) ( not ( = ?auto_305199 ?auto_305201 ) ) ( not ( = ?auto_305199 ?auto_305202 ) ) ( not ( = ?auto_305199 ?auto_305203 ) ) ( not ( = ?auto_305200 ?auto_305201 ) ) ( not ( = ?auto_305200 ?auto_305202 ) ) ( not ( = ?auto_305200 ?auto_305203 ) ) ( not ( = ?auto_305201 ?auto_305202 ) ) ( not ( = ?auto_305201 ?auto_305203 ) ) ( not ( = ?auto_305202 ?auto_305203 ) ) ( CLEAR ?auto_305200 ) ( ON ?auto_305201 ?auto_305202 ) ( CLEAR ?auto_305201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305197 ?auto_305198 ?auto_305199 ?auto_305200 ?auto_305201 )
      ( MAKE-6PILE ?auto_305197 ?auto_305198 ?auto_305199 ?auto_305200 ?auto_305201 ?auto_305202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305210 - BLOCK
      ?auto_305211 - BLOCK
      ?auto_305212 - BLOCK
      ?auto_305213 - BLOCK
      ?auto_305214 - BLOCK
      ?auto_305215 - BLOCK
    )
    :vars
    (
      ?auto_305216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305215 ?auto_305216 ) ( ON-TABLE ?auto_305210 ) ( ON ?auto_305211 ?auto_305210 ) ( ON ?auto_305212 ?auto_305211 ) ( ON ?auto_305213 ?auto_305212 ) ( not ( = ?auto_305210 ?auto_305211 ) ) ( not ( = ?auto_305210 ?auto_305212 ) ) ( not ( = ?auto_305210 ?auto_305213 ) ) ( not ( = ?auto_305210 ?auto_305214 ) ) ( not ( = ?auto_305210 ?auto_305215 ) ) ( not ( = ?auto_305210 ?auto_305216 ) ) ( not ( = ?auto_305211 ?auto_305212 ) ) ( not ( = ?auto_305211 ?auto_305213 ) ) ( not ( = ?auto_305211 ?auto_305214 ) ) ( not ( = ?auto_305211 ?auto_305215 ) ) ( not ( = ?auto_305211 ?auto_305216 ) ) ( not ( = ?auto_305212 ?auto_305213 ) ) ( not ( = ?auto_305212 ?auto_305214 ) ) ( not ( = ?auto_305212 ?auto_305215 ) ) ( not ( = ?auto_305212 ?auto_305216 ) ) ( not ( = ?auto_305213 ?auto_305214 ) ) ( not ( = ?auto_305213 ?auto_305215 ) ) ( not ( = ?auto_305213 ?auto_305216 ) ) ( not ( = ?auto_305214 ?auto_305215 ) ) ( not ( = ?auto_305214 ?auto_305216 ) ) ( not ( = ?auto_305215 ?auto_305216 ) ) ( CLEAR ?auto_305213 ) ( ON ?auto_305214 ?auto_305215 ) ( CLEAR ?auto_305214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305210 ?auto_305211 ?auto_305212 ?auto_305213 ?auto_305214 )
      ( MAKE-6PILE ?auto_305210 ?auto_305211 ?auto_305212 ?auto_305213 ?auto_305214 ?auto_305215 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305223 - BLOCK
      ?auto_305224 - BLOCK
      ?auto_305225 - BLOCK
      ?auto_305226 - BLOCK
      ?auto_305227 - BLOCK
      ?auto_305228 - BLOCK
    )
    :vars
    (
      ?auto_305229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305228 ?auto_305229 ) ( ON-TABLE ?auto_305223 ) ( ON ?auto_305224 ?auto_305223 ) ( ON ?auto_305225 ?auto_305224 ) ( not ( = ?auto_305223 ?auto_305224 ) ) ( not ( = ?auto_305223 ?auto_305225 ) ) ( not ( = ?auto_305223 ?auto_305226 ) ) ( not ( = ?auto_305223 ?auto_305227 ) ) ( not ( = ?auto_305223 ?auto_305228 ) ) ( not ( = ?auto_305223 ?auto_305229 ) ) ( not ( = ?auto_305224 ?auto_305225 ) ) ( not ( = ?auto_305224 ?auto_305226 ) ) ( not ( = ?auto_305224 ?auto_305227 ) ) ( not ( = ?auto_305224 ?auto_305228 ) ) ( not ( = ?auto_305224 ?auto_305229 ) ) ( not ( = ?auto_305225 ?auto_305226 ) ) ( not ( = ?auto_305225 ?auto_305227 ) ) ( not ( = ?auto_305225 ?auto_305228 ) ) ( not ( = ?auto_305225 ?auto_305229 ) ) ( not ( = ?auto_305226 ?auto_305227 ) ) ( not ( = ?auto_305226 ?auto_305228 ) ) ( not ( = ?auto_305226 ?auto_305229 ) ) ( not ( = ?auto_305227 ?auto_305228 ) ) ( not ( = ?auto_305227 ?auto_305229 ) ) ( not ( = ?auto_305228 ?auto_305229 ) ) ( ON ?auto_305227 ?auto_305228 ) ( CLEAR ?auto_305225 ) ( ON ?auto_305226 ?auto_305227 ) ( CLEAR ?auto_305226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305223 ?auto_305224 ?auto_305225 ?auto_305226 )
      ( MAKE-6PILE ?auto_305223 ?auto_305224 ?auto_305225 ?auto_305226 ?auto_305227 ?auto_305228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305236 - BLOCK
      ?auto_305237 - BLOCK
      ?auto_305238 - BLOCK
      ?auto_305239 - BLOCK
      ?auto_305240 - BLOCK
      ?auto_305241 - BLOCK
    )
    :vars
    (
      ?auto_305242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305241 ?auto_305242 ) ( ON-TABLE ?auto_305236 ) ( ON ?auto_305237 ?auto_305236 ) ( ON ?auto_305238 ?auto_305237 ) ( not ( = ?auto_305236 ?auto_305237 ) ) ( not ( = ?auto_305236 ?auto_305238 ) ) ( not ( = ?auto_305236 ?auto_305239 ) ) ( not ( = ?auto_305236 ?auto_305240 ) ) ( not ( = ?auto_305236 ?auto_305241 ) ) ( not ( = ?auto_305236 ?auto_305242 ) ) ( not ( = ?auto_305237 ?auto_305238 ) ) ( not ( = ?auto_305237 ?auto_305239 ) ) ( not ( = ?auto_305237 ?auto_305240 ) ) ( not ( = ?auto_305237 ?auto_305241 ) ) ( not ( = ?auto_305237 ?auto_305242 ) ) ( not ( = ?auto_305238 ?auto_305239 ) ) ( not ( = ?auto_305238 ?auto_305240 ) ) ( not ( = ?auto_305238 ?auto_305241 ) ) ( not ( = ?auto_305238 ?auto_305242 ) ) ( not ( = ?auto_305239 ?auto_305240 ) ) ( not ( = ?auto_305239 ?auto_305241 ) ) ( not ( = ?auto_305239 ?auto_305242 ) ) ( not ( = ?auto_305240 ?auto_305241 ) ) ( not ( = ?auto_305240 ?auto_305242 ) ) ( not ( = ?auto_305241 ?auto_305242 ) ) ( ON ?auto_305240 ?auto_305241 ) ( CLEAR ?auto_305238 ) ( ON ?auto_305239 ?auto_305240 ) ( CLEAR ?auto_305239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305236 ?auto_305237 ?auto_305238 ?auto_305239 )
      ( MAKE-6PILE ?auto_305236 ?auto_305237 ?auto_305238 ?auto_305239 ?auto_305240 ?auto_305241 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305249 - BLOCK
      ?auto_305250 - BLOCK
      ?auto_305251 - BLOCK
      ?auto_305252 - BLOCK
      ?auto_305253 - BLOCK
      ?auto_305254 - BLOCK
    )
    :vars
    (
      ?auto_305255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305254 ?auto_305255 ) ( ON-TABLE ?auto_305249 ) ( ON ?auto_305250 ?auto_305249 ) ( not ( = ?auto_305249 ?auto_305250 ) ) ( not ( = ?auto_305249 ?auto_305251 ) ) ( not ( = ?auto_305249 ?auto_305252 ) ) ( not ( = ?auto_305249 ?auto_305253 ) ) ( not ( = ?auto_305249 ?auto_305254 ) ) ( not ( = ?auto_305249 ?auto_305255 ) ) ( not ( = ?auto_305250 ?auto_305251 ) ) ( not ( = ?auto_305250 ?auto_305252 ) ) ( not ( = ?auto_305250 ?auto_305253 ) ) ( not ( = ?auto_305250 ?auto_305254 ) ) ( not ( = ?auto_305250 ?auto_305255 ) ) ( not ( = ?auto_305251 ?auto_305252 ) ) ( not ( = ?auto_305251 ?auto_305253 ) ) ( not ( = ?auto_305251 ?auto_305254 ) ) ( not ( = ?auto_305251 ?auto_305255 ) ) ( not ( = ?auto_305252 ?auto_305253 ) ) ( not ( = ?auto_305252 ?auto_305254 ) ) ( not ( = ?auto_305252 ?auto_305255 ) ) ( not ( = ?auto_305253 ?auto_305254 ) ) ( not ( = ?auto_305253 ?auto_305255 ) ) ( not ( = ?auto_305254 ?auto_305255 ) ) ( ON ?auto_305253 ?auto_305254 ) ( ON ?auto_305252 ?auto_305253 ) ( CLEAR ?auto_305250 ) ( ON ?auto_305251 ?auto_305252 ) ( CLEAR ?auto_305251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305249 ?auto_305250 ?auto_305251 )
      ( MAKE-6PILE ?auto_305249 ?auto_305250 ?auto_305251 ?auto_305252 ?auto_305253 ?auto_305254 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305262 - BLOCK
      ?auto_305263 - BLOCK
      ?auto_305264 - BLOCK
      ?auto_305265 - BLOCK
      ?auto_305266 - BLOCK
      ?auto_305267 - BLOCK
    )
    :vars
    (
      ?auto_305268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305267 ?auto_305268 ) ( ON-TABLE ?auto_305262 ) ( ON ?auto_305263 ?auto_305262 ) ( not ( = ?auto_305262 ?auto_305263 ) ) ( not ( = ?auto_305262 ?auto_305264 ) ) ( not ( = ?auto_305262 ?auto_305265 ) ) ( not ( = ?auto_305262 ?auto_305266 ) ) ( not ( = ?auto_305262 ?auto_305267 ) ) ( not ( = ?auto_305262 ?auto_305268 ) ) ( not ( = ?auto_305263 ?auto_305264 ) ) ( not ( = ?auto_305263 ?auto_305265 ) ) ( not ( = ?auto_305263 ?auto_305266 ) ) ( not ( = ?auto_305263 ?auto_305267 ) ) ( not ( = ?auto_305263 ?auto_305268 ) ) ( not ( = ?auto_305264 ?auto_305265 ) ) ( not ( = ?auto_305264 ?auto_305266 ) ) ( not ( = ?auto_305264 ?auto_305267 ) ) ( not ( = ?auto_305264 ?auto_305268 ) ) ( not ( = ?auto_305265 ?auto_305266 ) ) ( not ( = ?auto_305265 ?auto_305267 ) ) ( not ( = ?auto_305265 ?auto_305268 ) ) ( not ( = ?auto_305266 ?auto_305267 ) ) ( not ( = ?auto_305266 ?auto_305268 ) ) ( not ( = ?auto_305267 ?auto_305268 ) ) ( ON ?auto_305266 ?auto_305267 ) ( ON ?auto_305265 ?auto_305266 ) ( CLEAR ?auto_305263 ) ( ON ?auto_305264 ?auto_305265 ) ( CLEAR ?auto_305264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305262 ?auto_305263 ?auto_305264 )
      ( MAKE-6PILE ?auto_305262 ?auto_305263 ?auto_305264 ?auto_305265 ?auto_305266 ?auto_305267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305275 - BLOCK
      ?auto_305276 - BLOCK
      ?auto_305277 - BLOCK
      ?auto_305278 - BLOCK
      ?auto_305279 - BLOCK
      ?auto_305280 - BLOCK
    )
    :vars
    (
      ?auto_305281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305280 ?auto_305281 ) ( ON-TABLE ?auto_305275 ) ( not ( = ?auto_305275 ?auto_305276 ) ) ( not ( = ?auto_305275 ?auto_305277 ) ) ( not ( = ?auto_305275 ?auto_305278 ) ) ( not ( = ?auto_305275 ?auto_305279 ) ) ( not ( = ?auto_305275 ?auto_305280 ) ) ( not ( = ?auto_305275 ?auto_305281 ) ) ( not ( = ?auto_305276 ?auto_305277 ) ) ( not ( = ?auto_305276 ?auto_305278 ) ) ( not ( = ?auto_305276 ?auto_305279 ) ) ( not ( = ?auto_305276 ?auto_305280 ) ) ( not ( = ?auto_305276 ?auto_305281 ) ) ( not ( = ?auto_305277 ?auto_305278 ) ) ( not ( = ?auto_305277 ?auto_305279 ) ) ( not ( = ?auto_305277 ?auto_305280 ) ) ( not ( = ?auto_305277 ?auto_305281 ) ) ( not ( = ?auto_305278 ?auto_305279 ) ) ( not ( = ?auto_305278 ?auto_305280 ) ) ( not ( = ?auto_305278 ?auto_305281 ) ) ( not ( = ?auto_305279 ?auto_305280 ) ) ( not ( = ?auto_305279 ?auto_305281 ) ) ( not ( = ?auto_305280 ?auto_305281 ) ) ( ON ?auto_305279 ?auto_305280 ) ( ON ?auto_305278 ?auto_305279 ) ( ON ?auto_305277 ?auto_305278 ) ( CLEAR ?auto_305275 ) ( ON ?auto_305276 ?auto_305277 ) ( CLEAR ?auto_305276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305275 ?auto_305276 )
      ( MAKE-6PILE ?auto_305275 ?auto_305276 ?auto_305277 ?auto_305278 ?auto_305279 ?auto_305280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305288 - BLOCK
      ?auto_305289 - BLOCK
      ?auto_305290 - BLOCK
      ?auto_305291 - BLOCK
      ?auto_305292 - BLOCK
      ?auto_305293 - BLOCK
    )
    :vars
    (
      ?auto_305294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305293 ?auto_305294 ) ( ON-TABLE ?auto_305288 ) ( not ( = ?auto_305288 ?auto_305289 ) ) ( not ( = ?auto_305288 ?auto_305290 ) ) ( not ( = ?auto_305288 ?auto_305291 ) ) ( not ( = ?auto_305288 ?auto_305292 ) ) ( not ( = ?auto_305288 ?auto_305293 ) ) ( not ( = ?auto_305288 ?auto_305294 ) ) ( not ( = ?auto_305289 ?auto_305290 ) ) ( not ( = ?auto_305289 ?auto_305291 ) ) ( not ( = ?auto_305289 ?auto_305292 ) ) ( not ( = ?auto_305289 ?auto_305293 ) ) ( not ( = ?auto_305289 ?auto_305294 ) ) ( not ( = ?auto_305290 ?auto_305291 ) ) ( not ( = ?auto_305290 ?auto_305292 ) ) ( not ( = ?auto_305290 ?auto_305293 ) ) ( not ( = ?auto_305290 ?auto_305294 ) ) ( not ( = ?auto_305291 ?auto_305292 ) ) ( not ( = ?auto_305291 ?auto_305293 ) ) ( not ( = ?auto_305291 ?auto_305294 ) ) ( not ( = ?auto_305292 ?auto_305293 ) ) ( not ( = ?auto_305292 ?auto_305294 ) ) ( not ( = ?auto_305293 ?auto_305294 ) ) ( ON ?auto_305292 ?auto_305293 ) ( ON ?auto_305291 ?auto_305292 ) ( ON ?auto_305290 ?auto_305291 ) ( CLEAR ?auto_305288 ) ( ON ?auto_305289 ?auto_305290 ) ( CLEAR ?auto_305289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305288 ?auto_305289 )
      ( MAKE-6PILE ?auto_305288 ?auto_305289 ?auto_305290 ?auto_305291 ?auto_305292 ?auto_305293 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305301 - BLOCK
      ?auto_305302 - BLOCK
      ?auto_305303 - BLOCK
      ?auto_305304 - BLOCK
      ?auto_305305 - BLOCK
      ?auto_305306 - BLOCK
    )
    :vars
    (
      ?auto_305307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305306 ?auto_305307 ) ( not ( = ?auto_305301 ?auto_305302 ) ) ( not ( = ?auto_305301 ?auto_305303 ) ) ( not ( = ?auto_305301 ?auto_305304 ) ) ( not ( = ?auto_305301 ?auto_305305 ) ) ( not ( = ?auto_305301 ?auto_305306 ) ) ( not ( = ?auto_305301 ?auto_305307 ) ) ( not ( = ?auto_305302 ?auto_305303 ) ) ( not ( = ?auto_305302 ?auto_305304 ) ) ( not ( = ?auto_305302 ?auto_305305 ) ) ( not ( = ?auto_305302 ?auto_305306 ) ) ( not ( = ?auto_305302 ?auto_305307 ) ) ( not ( = ?auto_305303 ?auto_305304 ) ) ( not ( = ?auto_305303 ?auto_305305 ) ) ( not ( = ?auto_305303 ?auto_305306 ) ) ( not ( = ?auto_305303 ?auto_305307 ) ) ( not ( = ?auto_305304 ?auto_305305 ) ) ( not ( = ?auto_305304 ?auto_305306 ) ) ( not ( = ?auto_305304 ?auto_305307 ) ) ( not ( = ?auto_305305 ?auto_305306 ) ) ( not ( = ?auto_305305 ?auto_305307 ) ) ( not ( = ?auto_305306 ?auto_305307 ) ) ( ON ?auto_305305 ?auto_305306 ) ( ON ?auto_305304 ?auto_305305 ) ( ON ?auto_305303 ?auto_305304 ) ( ON ?auto_305302 ?auto_305303 ) ( ON ?auto_305301 ?auto_305302 ) ( CLEAR ?auto_305301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305301 )
      ( MAKE-6PILE ?auto_305301 ?auto_305302 ?auto_305303 ?auto_305304 ?auto_305305 ?auto_305306 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_305314 - BLOCK
      ?auto_305315 - BLOCK
      ?auto_305316 - BLOCK
      ?auto_305317 - BLOCK
      ?auto_305318 - BLOCK
      ?auto_305319 - BLOCK
    )
    :vars
    (
      ?auto_305320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305319 ?auto_305320 ) ( not ( = ?auto_305314 ?auto_305315 ) ) ( not ( = ?auto_305314 ?auto_305316 ) ) ( not ( = ?auto_305314 ?auto_305317 ) ) ( not ( = ?auto_305314 ?auto_305318 ) ) ( not ( = ?auto_305314 ?auto_305319 ) ) ( not ( = ?auto_305314 ?auto_305320 ) ) ( not ( = ?auto_305315 ?auto_305316 ) ) ( not ( = ?auto_305315 ?auto_305317 ) ) ( not ( = ?auto_305315 ?auto_305318 ) ) ( not ( = ?auto_305315 ?auto_305319 ) ) ( not ( = ?auto_305315 ?auto_305320 ) ) ( not ( = ?auto_305316 ?auto_305317 ) ) ( not ( = ?auto_305316 ?auto_305318 ) ) ( not ( = ?auto_305316 ?auto_305319 ) ) ( not ( = ?auto_305316 ?auto_305320 ) ) ( not ( = ?auto_305317 ?auto_305318 ) ) ( not ( = ?auto_305317 ?auto_305319 ) ) ( not ( = ?auto_305317 ?auto_305320 ) ) ( not ( = ?auto_305318 ?auto_305319 ) ) ( not ( = ?auto_305318 ?auto_305320 ) ) ( not ( = ?auto_305319 ?auto_305320 ) ) ( ON ?auto_305318 ?auto_305319 ) ( ON ?auto_305317 ?auto_305318 ) ( ON ?auto_305316 ?auto_305317 ) ( ON ?auto_305315 ?auto_305316 ) ( ON ?auto_305314 ?auto_305315 ) ( CLEAR ?auto_305314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305314 )
      ( MAKE-6PILE ?auto_305314 ?auto_305315 ?auto_305316 ?auto_305317 ?auto_305318 ?auto_305319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305328 - BLOCK
      ?auto_305329 - BLOCK
      ?auto_305330 - BLOCK
      ?auto_305331 - BLOCK
      ?auto_305332 - BLOCK
      ?auto_305333 - BLOCK
      ?auto_305334 - BLOCK
    )
    :vars
    (
      ?auto_305335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305333 ) ( ON ?auto_305334 ?auto_305335 ) ( CLEAR ?auto_305334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305328 ) ( ON ?auto_305329 ?auto_305328 ) ( ON ?auto_305330 ?auto_305329 ) ( ON ?auto_305331 ?auto_305330 ) ( ON ?auto_305332 ?auto_305331 ) ( ON ?auto_305333 ?auto_305332 ) ( not ( = ?auto_305328 ?auto_305329 ) ) ( not ( = ?auto_305328 ?auto_305330 ) ) ( not ( = ?auto_305328 ?auto_305331 ) ) ( not ( = ?auto_305328 ?auto_305332 ) ) ( not ( = ?auto_305328 ?auto_305333 ) ) ( not ( = ?auto_305328 ?auto_305334 ) ) ( not ( = ?auto_305328 ?auto_305335 ) ) ( not ( = ?auto_305329 ?auto_305330 ) ) ( not ( = ?auto_305329 ?auto_305331 ) ) ( not ( = ?auto_305329 ?auto_305332 ) ) ( not ( = ?auto_305329 ?auto_305333 ) ) ( not ( = ?auto_305329 ?auto_305334 ) ) ( not ( = ?auto_305329 ?auto_305335 ) ) ( not ( = ?auto_305330 ?auto_305331 ) ) ( not ( = ?auto_305330 ?auto_305332 ) ) ( not ( = ?auto_305330 ?auto_305333 ) ) ( not ( = ?auto_305330 ?auto_305334 ) ) ( not ( = ?auto_305330 ?auto_305335 ) ) ( not ( = ?auto_305331 ?auto_305332 ) ) ( not ( = ?auto_305331 ?auto_305333 ) ) ( not ( = ?auto_305331 ?auto_305334 ) ) ( not ( = ?auto_305331 ?auto_305335 ) ) ( not ( = ?auto_305332 ?auto_305333 ) ) ( not ( = ?auto_305332 ?auto_305334 ) ) ( not ( = ?auto_305332 ?auto_305335 ) ) ( not ( = ?auto_305333 ?auto_305334 ) ) ( not ( = ?auto_305333 ?auto_305335 ) ) ( not ( = ?auto_305334 ?auto_305335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305334 ?auto_305335 )
      ( !STACK ?auto_305334 ?auto_305333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305343 - BLOCK
      ?auto_305344 - BLOCK
      ?auto_305345 - BLOCK
      ?auto_305346 - BLOCK
      ?auto_305347 - BLOCK
      ?auto_305348 - BLOCK
      ?auto_305349 - BLOCK
    )
    :vars
    (
      ?auto_305350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305348 ) ( ON ?auto_305349 ?auto_305350 ) ( CLEAR ?auto_305349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305343 ) ( ON ?auto_305344 ?auto_305343 ) ( ON ?auto_305345 ?auto_305344 ) ( ON ?auto_305346 ?auto_305345 ) ( ON ?auto_305347 ?auto_305346 ) ( ON ?auto_305348 ?auto_305347 ) ( not ( = ?auto_305343 ?auto_305344 ) ) ( not ( = ?auto_305343 ?auto_305345 ) ) ( not ( = ?auto_305343 ?auto_305346 ) ) ( not ( = ?auto_305343 ?auto_305347 ) ) ( not ( = ?auto_305343 ?auto_305348 ) ) ( not ( = ?auto_305343 ?auto_305349 ) ) ( not ( = ?auto_305343 ?auto_305350 ) ) ( not ( = ?auto_305344 ?auto_305345 ) ) ( not ( = ?auto_305344 ?auto_305346 ) ) ( not ( = ?auto_305344 ?auto_305347 ) ) ( not ( = ?auto_305344 ?auto_305348 ) ) ( not ( = ?auto_305344 ?auto_305349 ) ) ( not ( = ?auto_305344 ?auto_305350 ) ) ( not ( = ?auto_305345 ?auto_305346 ) ) ( not ( = ?auto_305345 ?auto_305347 ) ) ( not ( = ?auto_305345 ?auto_305348 ) ) ( not ( = ?auto_305345 ?auto_305349 ) ) ( not ( = ?auto_305345 ?auto_305350 ) ) ( not ( = ?auto_305346 ?auto_305347 ) ) ( not ( = ?auto_305346 ?auto_305348 ) ) ( not ( = ?auto_305346 ?auto_305349 ) ) ( not ( = ?auto_305346 ?auto_305350 ) ) ( not ( = ?auto_305347 ?auto_305348 ) ) ( not ( = ?auto_305347 ?auto_305349 ) ) ( not ( = ?auto_305347 ?auto_305350 ) ) ( not ( = ?auto_305348 ?auto_305349 ) ) ( not ( = ?auto_305348 ?auto_305350 ) ) ( not ( = ?auto_305349 ?auto_305350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305349 ?auto_305350 )
      ( !STACK ?auto_305349 ?auto_305348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305358 - BLOCK
      ?auto_305359 - BLOCK
      ?auto_305360 - BLOCK
      ?auto_305361 - BLOCK
      ?auto_305362 - BLOCK
      ?auto_305363 - BLOCK
      ?auto_305364 - BLOCK
    )
    :vars
    (
      ?auto_305365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305364 ?auto_305365 ) ( ON-TABLE ?auto_305358 ) ( ON ?auto_305359 ?auto_305358 ) ( ON ?auto_305360 ?auto_305359 ) ( ON ?auto_305361 ?auto_305360 ) ( ON ?auto_305362 ?auto_305361 ) ( not ( = ?auto_305358 ?auto_305359 ) ) ( not ( = ?auto_305358 ?auto_305360 ) ) ( not ( = ?auto_305358 ?auto_305361 ) ) ( not ( = ?auto_305358 ?auto_305362 ) ) ( not ( = ?auto_305358 ?auto_305363 ) ) ( not ( = ?auto_305358 ?auto_305364 ) ) ( not ( = ?auto_305358 ?auto_305365 ) ) ( not ( = ?auto_305359 ?auto_305360 ) ) ( not ( = ?auto_305359 ?auto_305361 ) ) ( not ( = ?auto_305359 ?auto_305362 ) ) ( not ( = ?auto_305359 ?auto_305363 ) ) ( not ( = ?auto_305359 ?auto_305364 ) ) ( not ( = ?auto_305359 ?auto_305365 ) ) ( not ( = ?auto_305360 ?auto_305361 ) ) ( not ( = ?auto_305360 ?auto_305362 ) ) ( not ( = ?auto_305360 ?auto_305363 ) ) ( not ( = ?auto_305360 ?auto_305364 ) ) ( not ( = ?auto_305360 ?auto_305365 ) ) ( not ( = ?auto_305361 ?auto_305362 ) ) ( not ( = ?auto_305361 ?auto_305363 ) ) ( not ( = ?auto_305361 ?auto_305364 ) ) ( not ( = ?auto_305361 ?auto_305365 ) ) ( not ( = ?auto_305362 ?auto_305363 ) ) ( not ( = ?auto_305362 ?auto_305364 ) ) ( not ( = ?auto_305362 ?auto_305365 ) ) ( not ( = ?auto_305363 ?auto_305364 ) ) ( not ( = ?auto_305363 ?auto_305365 ) ) ( not ( = ?auto_305364 ?auto_305365 ) ) ( CLEAR ?auto_305362 ) ( ON ?auto_305363 ?auto_305364 ) ( CLEAR ?auto_305363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_305358 ?auto_305359 ?auto_305360 ?auto_305361 ?auto_305362 ?auto_305363 )
      ( MAKE-7PILE ?auto_305358 ?auto_305359 ?auto_305360 ?auto_305361 ?auto_305362 ?auto_305363 ?auto_305364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305373 - BLOCK
      ?auto_305374 - BLOCK
      ?auto_305375 - BLOCK
      ?auto_305376 - BLOCK
      ?auto_305377 - BLOCK
      ?auto_305378 - BLOCK
      ?auto_305379 - BLOCK
    )
    :vars
    (
      ?auto_305380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305379 ?auto_305380 ) ( ON-TABLE ?auto_305373 ) ( ON ?auto_305374 ?auto_305373 ) ( ON ?auto_305375 ?auto_305374 ) ( ON ?auto_305376 ?auto_305375 ) ( ON ?auto_305377 ?auto_305376 ) ( not ( = ?auto_305373 ?auto_305374 ) ) ( not ( = ?auto_305373 ?auto_305375 ) ) ( not ( = ?auto_305373 ?auto_305376 ) ) ( not ( = ?auto_305373 ?auto_305377 ) ) ( not ( = ?auto_305373 ?auto_305378 ) ) ( not ( = ?auto_305373 ?auto_305379 ) ) ( not ( = ?auto_305373 ?auto_305380 ) ) ( not ( = ?auto_305374 ?auto_305375 ) ) ( not ( = ?auto_305374 ?auto_305376 ) ) ( not ( = ?auto_305374 ?auto_305377 ) ) ( not ( = ?auto_305374 ?auto_305378 ) ) ( not ( = ?auto_305374 ?auto_305379 ) ) ( not ( = ?auto_305374 ?auto_305380 ) ) ( not ( = ?auto_305375 ?auto_305376 ) ) ( not ( = ?auto_305375 ?auto_305377 ) ) ( not ( = ?auto_305375 ?auto_305378 ) ) ( not ( = ?auto_305375 ?auto_305379 ) ) ( not ( = ?auto_305375 ?auto_305380 ) ) ( not ( = ?auto_305376 ?auto_305377 ) ) ( not ( = ?auto_305376 ?auto_305378 ) ) ( not ( = ?auto_305376 ?auto_305379 ) ) ( not ( = ?auto_305376 ?auto_305380 ) ) ( not ( = ?auto_305377 ?auto_305378 ) ) ( not ( = ?auto_305377 ?auto_305379 ) ) ( not ( = ?auto_305377 ?auto_305380 ) ) ( not ( = ?auto_305378 ?auto_305379 ) ) ( not ( = ?auto_305378 ?auto_305380 ) ) ( not ( = ?auto_305379 ?auto_305380 ) ) ( CLEAR ?auto_305377 ) ( ON ?auto_305378 ?auto_305379 ) ( CLEAR ?auto_305378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_305373 ?auto_305374 ?auto_305375 ?auto_305376 ?auto_305377 ?auto_305378 )
      ( MAKE-7PILE ?auto_305373 ?auto_305374 ?auto_305375 ?auto_305376 ?auto_305377 ?auto_305378 ?auto_305379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305388 - BLOCK
      ?auto_305389 - BLOCK
      ?auto_305390 - BLOCK
      ?auto_305391 - BLOCK
      ?auto_305392 - BLOCK
      ?auto_305393 - BLOCK
      ?auto_305394 - BLOCK
    )
    :vars
    (
      ?auto_305395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305394 ?auto_305395 ) ( ON-TABLE ?auto_305388 ) ( ON ?auto_305389 ?auto_305388 ) ( ON ?auto_305390 ?auto_305389 ) ( ON ?auto_305391 ?auto_305390 ) ( not ( = ?auto_305388 ?auto_305389 ) ) ( not ( = ?auto_305388 ?auto_305390 ) ) ( not ( = ?auto_305388 ?auto_305391 ) ) ( not ( = ?auto_305388 ?auto_305392 ) ) ( not ( = ?auto_305388 ?auto_305393 ) ) ( not ( = ?auto_305388 ?auto_305394 ) ) ( not ( = ?auto_305388 ?auto_305395 ) ) ( not ( = ?auto_305389 ?auto_305390 ) ) ( not ( = ?auto_305389 ?auto_305391 ) ) ( not ( = ?auto_305389 ?auto_305392 ) ) ( not ( = ?auto_305389 ?auto_305393 ) ) ( not ( = ?auto_305389 ?auto_305394 ) ) ( not ( = ?auto_305389 ?auto_305395 ) ) ( not ( = ?auto_305390 ?auto_305391 ) ) ( not ( = ?auto_305390 ?auto_305392 ) ) ( not ( = ?auto_305390 ?auto_305393 ) ) ( not ( = ?auto_305390 ?auto_305394 ) ) ( not ( = ?auto_305390 ?auto_305395 ) ) ( not ( = ?auto_305391 ?auto_305392 ) ) ( not ( = ?auto_305391 ?auto_305393 ) ) ( not ( = ?auto_305391 ?auto_305394 ) ) ( not ( = ?auto_305391 ?auto_305395 ) ) ( not ( = ?auto_305392 ?auto_305393 ) ) ( not ( = ?auto_305392 ?auto_305394 ) ) ( not ( = ?auto_305392 ?auto_305395 ) ) ( not ( = ?auto_305393 ?auto_305394 ) ) ( not ( = ?auto_305393 ?auto_305395 ) ) ( not ( = ?auto_305394 ?auto_305395 ) ) ( ON ?auto_305393 ?auto_305394 ) ( CLEAR ?auto_305391 ) ( ON ?auto_305392 ?auto_305393 ) ( CLEAR ?auto_305392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305388 ?auto_305389 ?auto_305390 ?auto_305391 ?auto_305392 )
      ( MAKE-7PILE ?auto_305388 ?auto_305389 ?auto_305390 ?auto_305391 ?auto_305392 ?auto_305393 ?auto_305394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305403 - BLOCK
      ?auto_305404 - BLOCK
      ?auto_305405 - BLOCK
      ?auto_305406 - BLOCK
      ?auto_305407 - BLOCK
      ?auto_305408 - BLOCK
      ?auto_305409 - BLOCK
    )
    :vars
    (
      ?auto_305410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305409 ?auto_305410 ) ( ON-TABLE ?auto_305403 ) ( ON ?auto_305404 ?auto_305403 ) ( ON ?auto_305405 ?auto_305404 ) ( ON ?auto_305406 ?auto_305405 ) ( not ( = ?auto_305403 ?auto_305404 ) ) ( not ( = ?auto_305403 ?auto_305405 ) ) ( not ( = ?auto_305403 ?auto_305406 ) ) ( not ( = ?auto_305403 ?auto_305407 ) ) ( not ( = ?auto_305403 ?auto_305408 ) ) ( not ( = ?auto_305403 ?auto_305409 ) ) ( not ( = ?auto_305403 ?auto_305410 ) ) ( not ( = ?auto_305404 ?auto_305405 ) ) ( not ( = ?auto_305404 ?auto_305406 ) ) ( not ( = ?auto_305404 ?auto_305407 ) ) ( not ( = ?auto_305404 ?auto_305408 ) ) ( not ( = ?auto_305404 ?auto_305409 ) ) ( not ( = ?auto_305404 ?auto_305410 ) ) ( not ( = ?auto_305405 ?auto_305406 ) ) ( not ( = ?auto_305405 ?auto_305407 ) ) ( not ( = ?auto_305405 ?auto_305408 ) ) ( not ( = ?auto_305405 ?auto_305409 ) ) ( not ( = ?auto_305405 ?auto_305410 ) ) ( not ( = ?auto_305406 ?auto_305407 ) ) ( not ( = ?auto_305406 ?auto_305408 ) ) ( not ( = ?auto_305406 ?auto_305409 ) ) ( not ( = ?auto_305406 ?auto_305410 ) ) ( not ( = ?auto_305407 ?auto_305408 ) ) ( not ( = ?auto_305407 ?auto_305409 ) ) ( not ( = ?auto_305407 ?auto_305410 ) ) ( not ( = ?auto_305408 ?auto_305409 ) ) ( not ( = ?auto_305408 ?auto_305410 ) ) ( not ( = ?auto_305409 ?auto_305410 ) ) ( ON ?auto_305408 ?auto_305409 ) ( CLEAR ?auto_305406 ) ( ON ?auto_305407 ?auto_305408 ) ( CLEAR ?auto_305407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305403 ?auto_305404 ?auto_305405 ?auto_305406 ?auto_305407 )
      ( MAKE-7PILE ?auto_305403 ?auto_305404 ?auto_305405 ?auto_305406 ?auto_305407 ?auto_305408 ?auto_305409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305418 - BLOCK
      ?auto_305419 - BLOCK
      ?auto_305420 - BLOCK
      ?auto_305421 - BLOCK
      ?auto_305422 - BLOCK
      ?auto_305423 - BLOCK
      ?auto_305424 - BLOCK
    )
    :vars
    (
      ?auto_305425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305424 ?auto_305425 ) ( ON-TABLE ?auto_305418 ) ( ON ?auto_305419 ?auto_305418 ) ( ON ?auto_305420 ?auto_305419 ) ( not ( = ?auto_305418 ?auto_305419 ) ) ( not ( = ?auto_305418 ?auto_305420 ) ) ( not ( = ?auto_305418 ?auto_305421 ) ) ( not ( = ?auto_305418 ?auto_305422 ) ) ( not ( = ?auto_305418 ?auto_305423 ) ) ( not ( = ?auto_305418 ?auto_305424 ) ) ( not ( = ?auto_305418 ?auto_305425 ) ) ( not ( = ?auto_305419 ?auto_305420 ) ) ( not ( = ?auto_305419 ?auto_305421 ) ) ( not ( = ?auto_305419 ?auto_305422 ) ) ( not ( = ?auto_305419 ?auto_305423 ) ) ( not ( = ?auto_305419 ?auto_305424 ) ) ( not ( = ?auto_305419 ?auto_305425 ) ) ( not ( = ?auto_305420 ?auto_305421 ) ) ( not ( = ?auto_305420 ?auto_305422 ) ) ( not ( = ?auto_305420 ?auto_305423 ) ) ( not ( = ?auto_305420 ?auto_305424 ) ) ( not ( = ?auto_305420 ?auto_305425 ) ) ( not ( = ?auto_305421 ?auto_305422 ) ) ( not ( = ?auto_305421 ?auto_305423 ) ) ( not ( = ?auto_305421 ?auto_305424 ) ) ( not ( = ?auto_305421 ?auto_305425 ) ) ( not ( = ?auto_305422 ?auto_305423 ) ) ( not ( = ?auto_305422 ?auto_305424 ) ) ( not ( = ?auto_305422 ?auto_305425 ) ) ( not ( = ?auto_305423 ?auto_305424 ) ) ( not ( = ?auto_305423 ?auto_305425 ) ) ( not ( = ?auto_305424 ?auto_305425 ) ) ( ON ?auto_305423 ?auto_305424 ) ( ON ?auto_305422 ?auto_305423 ) ( CLEAR ?auto_305420 ) ( ON ?auto_305421 ?auto_305422 ) ( CLEAR ?auto_305421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305418 ?auto_305419 ?auto_305420 ?auto_305421 )
      ( MAKE-7PILE ?auto_305418 ?auto_305419 ?auto_305420 ?auto_305421 ?auto_305422 ?auto_305423 ?auto_305424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305433 - BLOCK
      ?auto_305434 - BLOCK
      ?auto_305435 - BLOCK
      ?auto_305436 - BLOCK
      ?auto_305437 - BLOCK
      ?auto_305438 - BLOCK
      ?auto_305439 - BLOCK
    )
    :vars
    (
      ?auto_305440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305439 ?auto_305440 ) ( ON-TABLE ?auto_305433 ) ( ON ?auto_305434 ?auto_305433 ) ( ON ?auto_305435 ?auto_305434 ) ( not ( = ?auto_305433 ?auto_305434 ) ) ( not ( = ?auto_305433 ?auto_305435 ) ) ( not ( = ?auto_305433 ?auto_305436 ) ) ( not ( = ?auto_305433 ?auto_305437 ) ) ( not ( = ?auto_305433 ?auto_305438 ) ) ( not ( = ?auto_305433 ?auto_305439 ) ) ( not ( = ?auto_305433 ?auto_305440 ) ) ( not ( = ?auto_305434 ?auto_305435 ) ) ( not ( = ?auto_305434 ?auto_305436 ) ) ( not ( = ?auto_305434 ?auto_305437 ) ) ( not ( = ?auto_305434 ?auto_305438 ) ) ( not ( = ?auto_305434 ?auto_305439 ) ) ( not ( = ?auto_305434 ?auto_305440 ) ) ( not ( = ?auto_305435 ?auto_305436 ) ) ( not ( = ?auto_305435 ?auto_305437 ) ) ( not ( = ?auto_305435 ?auto_305438 ) ) ( not ( = ?auto_305435 ?auto_305439 ) ) ( not ( = ?auto_305435 ?auto_305440 ) ) ( not ( = ?auto_305436 ?auto_305437 ) ) ( not ( = ?auto_305436 ?auto_305438 ) ) ( not ( = ?auto_305436 ?auto_305439 ) ) ( not ( = ?auto_305436 ?auto_305440 ) ) ( not ( = ?auto_305437 ?auto_305438 ) ) ( not ( = ?auto_305437 ?auto_305439 ) ) ( not ( = ?auto_305437 ?auto_305440 ) ) ( not ( = ?auto_305438 ?auto_305439 ) ) ( not ( = ?auto_305438 ?auto_305440 ) ) ( not ( = ?auto_305439 ?auto_305440 ) ) ( ON ?auto_305438 ?auto_305439 ) ( ON ?auto_305437 ?auto_305438 ) ( CLEAR ?auto_305435 ) ( ON ?auto_305436 ?auto_305437 ) ( CLEAR ?auto_305436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305433 ?auto_305434 ?auto_305435 ?auto_305436 )
      ( MAKE-7PILE ?auto_305433 ?auto_305434 ?auto_305435 ?auto_305436 ?auto_305437 ?auto_305438 ?auto_305439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305448 - BLOCK
      ?auto_305449 - BLOCK
      ?auto_305450 - BLOCK
      ?auto_305451 - BLOCK
      ?auto_305452 - BLOCK
      ?auto_305453 - BLOCK
      ?auto_305454 - BLOCK
    )
    :vars
    (
      ?auto_305455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305454 ?auto_305455 ) ( ON-TABLE ?auto_305448 ) ( ON ?auto_305449 ?auto_305448 ) ( not ( = ?auto_305448 ?auto_305449 ) ) ( not ( = ?auto_305448 ?auto_305450 ) ) ( not ( = ?auto_305448 ?auto_305451 ) ) ( not ( = ?auto_305448 ?auto_305452 ) ) ( not ( = ?auto_305448 ?auto_305453 ) ) ( not ( = ?auto_305448 ?auto_305454 ) ) ( not ( = ?auto_305448 ?auto_305455 ) ) ( not ( = ?auto_305449 ?auto_305450 ) ) ( not ( = ?auto_305449 ?auto_305451 ) ) ( not ( = ?auto_305449 ?auto_305452 ) ) ( not ( = ?auto_305449 ?auto_305453 ) ) ( not ( = ?auto_305449 ?auto_305454 ) ) ( not ( = ?auto_305449 ?auto_305455 ) ) ( not ( = ?auto_305450 ?auto_305451 ) ) ( not ( = ?auto_305450 ?auto_305452 ) ) ( not ( = ?auto_305450 ?auto_305453 ) ) ( not ( = ?auto_305450 ?auto_305454 ) ) ( not ( = ?auto_305450 ?auto_305455 ) ) ( not ( = ?auto_305451 ?auto_305452 ) ) ( not ( = ?auto_305451 ?auto_305453 ) ) ( not ( = ?auto_305451 ?auto_305454 ) ) ( not ( = ?auto_305451 ?auto_305455 ) ) ( not ( = ?auto_305452 ?auto_305453 ) ) ( not ( = ?auto_305452 ?auto_305454 ) ) ( not ( = ?auto_305452 ?auto_305455 ) ) ( not ( = ?auto_305453 ?auto_305454 ) ) ( not ( = ?auto_305453 ?auto_305455 ) ) ( not ( = ?auto_305454 ?auto_305455 ) ) ( ON ?auto_305453 ?auto_305454 ) ( ON ?auto_305452 ?auto_305453 ) ( ON ?auto_305451 ?auto_305452 ) ( CLEAR ?auto_305449 ) ( ON ?auto_305450 ?auto_305451 ) ( CLEAR ?auto_305450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305448 ?auto_305449 ?auto_305450 )
      ( MAKE-7PILE ?auto_305448 ?auto_305449 ?auto_305450 ?auto_305451 ?auto_305452 ?auto_305453 ?auto_305454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305463 - BLOCK
      ?auto_305464 - BLOCK
      ?auto_305465 - BLOCK
      ?auto_305466 - BLOCK
      ?auto_305467 - BLOCK
      ?auto_305468 - BLOCK
      ?auto_305469 - BLOCK
    )
    :vars
    (
      ?auto_305470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305469 ?auto_305470 ) ( ON-TABLE ?auto_305463 ) ( ON ?auto_305464 ?auto_305463 ) ( not ( = ?auto_305463 ?auto_305464 ) ) ( not ( = ?auto_305463 ?auto_305465 ) ) ( not ( = ?auto_305463 ?auto_305466 ) ) ( not ( = ?auto_305463 ?auto_305467 ) ) ( not ( = ?auto_305463 ?auto_305468 ) ) ( not ( = ?auto_305463 ?auto_305469 ) ) ( not ( = ?auto_305463 ?auto_305470 ) ) ( not ( = ?auto_305464 ?auto_305465 ) ) ( not ( = ?auto_305464 ?auto_305466 ) ) ( not ( = ?auto_305464 ?auto_305467 ) ) ( not ( = ?auto_305464 ?auto_305468 ) ) ( not ( = ?auto_305464 ?auto_305469 ) ) ( not ( = ?auto_305464 ?auto_305470 ) ) ( not ( = ?auto_305465 ?auto_305466 ) ) ( not ( = ?auto_305465 ?auto_305467 ) ) ( not ( = ?auto_305465 ?auto_305468 ) ) ( not ( = ?auto_305465 ?auto_305469 ) ) ( not ( = ?auto_305465 ?auto_305470 ) ) ( not ( = ?auto_305466 ?auto_305467 ) ) ( not ( = ?auto_305466 ?auto_305468 ) ) ( not ( = ?auto_305466 ?auto_305469 ) ) ( not ( = ?auto_305466 ?auto_305470 ) ) ( not ( = ?auto_305467 ?auto_305468 ) ) ( not ( = ?auto_305467 ?auto_305469 ) ) ( not ( = ?auto_305467 ?auto_305470 ) ) ( not ( = ?auto_305468 ?auto_305469 ) ) ( not ( = ?auto_305468 ?auto_305470 ) ) ( not ( = ?auto_305469 ?auto_305470 ) ) ( ON ?auto_305468 ?auto_305469 ) ( ON ?auto_305467 ?auto_305468 ) ( ON ?auto_305466 ?auto_305467 ) ( CLEAR ?auto_305464 ) ( ON ?auto_305465 ?auto_305466 ) ( CLEAR ?auto_305465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305463 ?auto_305464 ?auto_305465 )
      ( MAKE-7PILE ?auto_305463 ?auto_305464 ?auto_305465 ?auto_305466 ?auto_305467 ?auto_305468 ?auto_305469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305478 - BLOCK
      ?auto_305479 - BLOCK
      ?auto_305480 - BLOCK
      ?auto_305481 - BLOCK
      ?auto_305482 - BLOCK
      ?auto_305483 - BLOCK
      ?auto_305484 - BLOCK
    )
    :vars
    (
      ?auto_305485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305484 ?auto_305485 ) ( ON-TABLE ?auto_305478 ) ( not ( = ?auto_305478 ?auto_305479 ) ) ( not ( = ?auto_305478 ?auto_305480 ) ) ( not ( = ?auto_305478 ?auto_305481 ) ) ( not ( = ?auto_305478 ?auto_305482 ) ) ( not ( = ?auto_305478 ?auto_305483 ) ) ( not ( = ?auto_305478 ?auto_305484 ) ) ( not ( = ?auto_305478 ?auto_305485 ) ) ( not ( = ?auto_305479 ?auto_305480 ) ) ( not ( = ?auto_305479 ?auto_305481 ) ) ( not ( = ?auto_305479 ?auto_305482 ) ) ( not ( = ?auto_305479 ?auto_305483 ) ) ( not ( = ?auto_305479 ?auto_305484 ) ) ( not ( = ?auto_305479 ?auto_305485 ) ) ( not ( = ?auto_305480 ?auto_305481 ) ) ( not ( = ?auto_305480 ?auto_305482 ) ) ( not ( = ?auto_305480 ?auto_305483 ) ) ( not ( = ?auto_305480 ?auto_305484 ) ) ( not ( = ?auto_305480 ?auto_305485 ) ) ( not ( = ?auto_305481 ?auto_305482 ) ) ( not ( = ?auto_305481 ?auto_305483 ) ) ( not ( = ?auto_305481 ?auto_305484 ) ) ( not ( = ?auto_305481 ?auto_305485 ) ) ( not ( = ?auto_305482 ?auto_305483 ) ) ( not ( = ?auto_305482 ?auto_305484 ) ) ( not ( = ?auto_305482 ?auto_305485 ) ) ( not ( = ?auto_305483 ?auto_305484 ) ) ( not ( = ?auto_305483 ?auto_305485 ) ) ( not ( = ?auto_305484 ?auto_305485 ) ) ( ON ?auto_305483 ?auto_305484 ) ( ON ?auto_305482 ?auto_305483 ) ( ON ?auto_305481 ?auto_305482 ) ( ON ?auto_305480 ?auto_305481 ) ( CLEAR ?auto_305478 ) ( ON ?auto_305479 ?auto_305480 ) ( CLEAR ?auto_305479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305478 ?auto_305479 )
      ( MAKE-7PILE ?auto_305478 ?auto_305479 ?auto_305480 ?auto_305481 ?auto_305482 ?auto_305483 ?auto_305484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305493 - BLOCK
      ?auto_305494 - BLOCK
      ?auto_305495 - BLOCK
      ?auto_305496 - BLOCK
      ?auto_305497 - BLOCK
      ?auto_305498 - BLOCK
      ?auto_305499 - BLOCK
    )
    :vars
    (
      ?auto_305500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305499 ?auto_305500 ) ( ON-TABLE ?auto_305493 ) ( not ( = ?auto_305493 ?auto_305494 ) ) ( not ( = ?auto_305493 ?auto_305495 ) ) ( not ( = ?auto_305493 ?auto_305496 ) ) ( not ( = ?auto_305493 ?auto_305497 ) ) ( not ( = ?auto_305493 ?auto_305498 ) ) ( not ( = ?auto_305493 ?auto_305499 ) ) ( not ( = ?auto_305493 ?auto_305500 ) ) ( not ( = ?auto_305494 ?auto_305495 ) ) ( not ( = ?auto_305494 ?auto_305496 ) ) ( not ( = ?auto_305494 ?auto_305497 ) ) ( not ( = ?auto_305494 ?auto_305498 ) ) ( not ( = ?auto_305494 ?auto_305499 ) ) ( not ( = ?auto_305494 ?auto_305500 ) ) ( not ( = ?auto_305495 ?auto_305496 ) ) ( not ( = ?auto_305495 ?auto_305497 ) ) ( not ( = ?auto_305495 ?auto_305498 ) ) ( not ( = ?auto_305495 ?auto_305499 ) ) ( not ( = ?auto_305495 ?auto_305500 ) ) ( not ( = ?auto_305496 ?auto_305497 ) ) ( not ( = ?auto_305496 ?auto_305498 ) ) ( not ( = ?auto_305496 ?auto_305499 ) ) ( not ( = ?auto_305496 ?auto_305500 ) ) ( not ( = ?auto_305497 ?auto_305498 ) ) ( not ( = ?auto_305497 ?auto_305499 ) ) ( not ( = ?auto_305497 ?auto_305500 ) ) ( not ( = ?auto_305498 ?auto_305499 ) ) ( not ( = ?auto_305498 ?auto_305500 ) ) ( not ( = ?auto_305499 ?auto_305500 ) ) ( ON ?auto_305498 ?auto_305499 ) ( ON ?auto_305497 ?auto_305498 ) ( ON ?auto_305496 ?auto_305497 ) ( ON ?auto_305495 ?auto_305496 ) ( CLEAR ?auto_305493 ) ( ON ?auto_305494 ?auto_305495 ) ( CLEAR ?auto_305494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305493 ?auto_305494 )
      ( MAKE-7PILE ?auto_305493 ?auto_305494 ?auto_305495 ?auto_305496 ?auto_305497 ?auto_305498 ?auto_305499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305508 - BLOCK
      ?auto_305509 - BLOCK
      ?auto_305510 - BLOCK
      ?auto_305511 - BLOCK
      ?auto_305512 - BLOCK
      ?auto_305513 - BLOCK
      ?auto_305514 - BLOCK
    )
    :vars
    (
      ?auto_305515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305514 ?auto_305515 ) ( not ( = ?auto_305508 ?auto_305509 ) ) ( not ( = ?auto_305508 ?auto_305510 ) ) ( not ( = ?auto_305508 ?auto_305511 ) ) ( not ( = ?auto_305508 ?auto_305512 ) ) ( not ( = ?auto_305508 ?auto_305513 ) ) ( not ( = ?auto_305508 ?auto_305514 ) ) ( not ( = ?auto_305508 ?auto_305515 ) ) ( not ( = ?auto_305509 ?auto_305510 ) ) ( not ( = ?auto_305509 ?auto_305511 ) ) ( not ( = ?auto_305509 ?auto_305512 ) ) ( not ( = ?auto_305509 ?auto_305513 ) ) ( not ( = ?auto_305509 ?auto_305514 ) ) ( not ( = ?auto_305509 ?auto_305515 ) ) ( not ( = ?auto_305510 ?auto_305511 ) ) ( not ( = ?auto_305510 ?auto_305512 ) ) ( not ( = ?auto_305510 ?auto_305513 ) ) ( not ( = ?auto_305510 ?auto_305514 ) ) ( not ( = ?auto_305510 ?auto_305515 ) ) ( not ( = ?auto_305511 ?auto_305512 ) ) ( not ( = ?auto_305511 ?auto_305513 ) ) ( not ( = ?auto_305511 ?auto_305514 ) ) ( not ( = ?auto_305511 ?auto_305515 ) ) ( not ( = ?auto_305512 ?auto_305513 ) ) ( not ( = ?auto_305512 ?auto_305514 ) ) ( not ( = ?auto_305512 ?auto_305515 ) ) ( not ( = ?auto_305513 ?auto_305514 ) ) ( not ( = ?auto_305513 ?auto_305515 ) ) ( not ( = ?auto_305514 ?auto_305515 ) ) ( ON ?auto_305513 ?auto_305514 ) ( ON ?auto_305512 ?auto_305513 ) ( ON ?auto_305511 ?auto_305512 ) ( ON ?auto_305510 ?auto_305511 ) ( ON ?auto_305509 ?auto_305510 ) ( ON ?auto_305508 ?auto_305509 ) ( CLEAR ?auto_305508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305508 )
      ( MAKE-7PILE ?auto_305508 ?auto_305509 ?auto_305510 ?auto_305511 ?auto_305512 ?auto_305513 ?auto_305514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_305523 - BLOCK
      ?auto_305524 - BLOCK
      ?auto_305525 - BLOCK
      ?auto_305526 - BLOCK
      ?auto_305527 - BLOCK
      ?auto_305528 - BLOCK
      ?auto_305529 - BLOCK
    )
    :vars
    (
      ?auto_305530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305529 ?auto_305530 ) ( not ( = ?auto_305523 ?auto_305524 ) ) ( not ( = ?auto_305523 ?auto_305525 ) ) ( not ( = ?auto_305523 ?auto_305526 ) ) ( not ( = ?auto_305523 ?auto_305527 ) ) ( not ( = ?auto_305523 ?auto_305528 ) ) ( not ( = ?auto_305523 ?auto_305529 ) ) ( not ( = ?auto_305523 ?auto_305530 ) ) ( not ( = ?auto_305524 ?auto_305525 ) ) ( not ( = ?auto_305524 ?auto_305526 ) ) ( not ( = ?auto_305524 ?auto_305527 ) ) ( not ( = ?auto_305524 ?auto_305528 ) ) ( not ( = ?auto_305524 ?auto_305529 ) ) ( not ( = ?auto_305524 ?auto_305530 ) ) ( not ( = ?auto_305525 ?auto_305526 ) ) ( not ( = ?auto_305525 ?auto_305527 ) ) ( not ( = ?auto_305525 ?auto_305528 ) ) ( not ( = ?auto_305525 ?auto_305529 ) ) ( not ( = ?auto_305525 ?auto_305530 ) ) ( not ( = ?auto_305526 ?auto_305527 ) ) ( not ( = ?auto_305526 ?auto_305528 ) ) ( not ( = ?auto_305526 ?auto_305529 ) ) ( not ( = ?auto_305526 ?auto_305530 ) ) ( not ( = ?auto_305527 ?auto_305528 ) ) ( not ( = ?auto_305527 ?auto_305529 ) ) ( not ( = ?auto_305527 ?auto_305530 ) ) ( not ( = ?auto_305528 ?auto_305529 ) ) ( not ( = ?auto_305528 ?auto_305530 ) ) ( not ( = ?auto_305529 ?auto_305530 ) ) ( ON ?auto_305528 ?auto_305529 ) ( ON ?auto_305527 ?auto_305528 ) ( ON ?auto_305526 ?auto_305527 ) ( ON ?auto_305525 ?auto_305526 ) ( ON ?auto_305524 ?auto_305525 ) ( ON ?auto_305523 ?auto_305524 ) ( CLEAR ?auto_305523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305523 )
      ( MAKE-7PILE ?auto_305523 ?auto_305524 ?auto_305525 ?auto_305526 ?auto_305527 ?auto_305528 ?auto_305529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305539 - BLOCK
      ?auto_305540 - BLOCK
      ?auto_305541 - BLOCK
      ?auto_305542 - BLOCK
      ?auto_305543 - BLOCK
      ?auto_305544 - BLOCK
      ?auto_305545 - BLOCK
      ?auto_305546 - BLOCK
    )
    :vars
    (
      ?auto_305547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305545 ) ( ON ?auto_305546 ?auto_305547 ) ( CLEAR ?auto_305546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305539 ) ( ON ?auto_305540 ?auto_305539 ) ( ON ?auto_305541 ?auto_305540 ) ( ON ?auto_305542 ?auto_305541 ) ( ON ?auto_305543 ?auto_305542 ) ( ON ?auto_305544 ?auto_305543 ) ( ON ?auto_305545 ?auto_305544 ) ( not ( = ?auto_305539 ?auto_305540 ) ) ( not ( = ?auto_305539 ?auto_305541 ) ) ( not ( = ?auto_305539 ?auto_305542 ) ) ( not ( = ?auto_305539 ?auto_305543 ) ) ( not ( = ?auto_305539 ?auto_305544 ) ) ( not ( = ?auto_305539 ?auto_305545 ) ) ( not ( = ?auto_305539 ?auto_305546 ) ) ( not ( = ?auto_305539 ?auto_305547 ) ) ( not ( = ?auto_305540 ?auto_305541 ) ) ( not ( = ?auto_305540 ?auto_305542 ) ) ( not ( = ?auto_305540 ?auto_305543 ) ) ( not ( = ?auto_305540 ?auto_305544 ) ) ( not ( = ?auto_305540 ?auto_305545 ) ) ( not ( = ?auto_305540 ?auto_305546 ) ) ( not ( = ?auto_305540 ?auto_305547 ) ) ( not ( = ?auto_305541 ?auto_305542 ) ) ( not ( = ?auto_305541 ?auto_305543 ) ) ( not ( = ?auto_305541 ?auto_305544 ) ) ( not ( = ?auto_305541 ?auto_305545 ) ) ( not ( = ?auto_305541 ?auto_305546 ) ) ( not ( = ?auto_305541 ?auto_305547 ) ) ( not ( = ?auto_305542 ?auto_305543 ) ) ( not ( = ?auto_305542 ?auto_305544 ) ) ( not ( = ?auto_305542 ?auto_305545 ) ) ( not ( = ?auto_305542 ?auto_305546 ) ) ( not ( = ?auto_305542 ?auto_305547 ) ) ( not ( = ?auto_305543 ?auto_305544 ) ) ( not ( = ?auto_305543 ?auto_305545 ) ) ( not ( = ?auto_305543 ?auto_305546 ) ) ( not ( = ?auto_305543 ?auto_305547 ) ) ( not ( = ?auto_305544 ?auto_305545 ) ) ( not ( = ?auto_305544 ?auto_305546 ) ) ( not ( = ?auto_305544 ?auto_305547 ) ) ( not ( = ?auto_305545 ?auto_305546 ) ) ( not ( = ?auto_305545 ?auto_305547 ) ) ( not ( = ?auto_305546 ?auto_305547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305546 ?auto_305547 )
      ( !STACK ?auto_305546 ?auto_305545 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305556 - BLOCK
      ?auto_305557 - BLOCK
      ?auto_305558 - BLOCK
      ?auto_305559 - BLOCK
      ?auto_305560 - BLOCK
      ?auto_305561 - BLOCK
      ?auto_305562 - BLOCK
      ?auto_305563 - BLOCK
    )
    :vars
    (
      ?auto_305564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305562 ) ( ON ?auto_305563 ?auto_305564 ) ( CLEAR ?auto_305563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305556 ) ( ON ?auto_305557 ?auto_305556 ) ( ON ?auto_305558 ?auto_305557 ) ( ON ?auto_305559 ?auto_305558 ) ( ON ?auto_305560 ?auto_305559 ) ( ON ?auto_305561 ?auto_305560 ) ( ON ?auto_305562 ?auto_305561 ) ( not ( = ?auto_305556 ?auto_305557 ) ) ( not ( = ?auto_305556 ?auto_305558 ) ) ( not ( = ?auto_305556 ?auto_305559 ) ) ( not ( = ?auto_305556 ?auto_305560 ) ) ( not ( = ?auto_305556 ?auto_305561 ) ) ( not ( = ?auto_305556 ?auto_305562 ) ) ( not ( = ?auto_305556 ?auto_305563 ) ) ( not ( = ?auto_305556 ?auto_305564 ) ) ( not ( = ?auto_305557 ?auto_305558 ) ) ( not ( = ?auto_305557 ?auto_305559 ) ) ( not ( = ?auto_305557 ?auto_305560 ) ) ( not ( = ?auto_305557 ?auto_305561 ) ) ( not ( = ?auto_305557 ?auto_305562 ) ) ( not ( = ?auto_305557 ?auto_305563 ) ) ( not ( = ?auto_305557 ?auto_305564 ) ) ( not ( = ?auto_305558 ?auto_305559 ) ) ( not ( = ?auto_305558 ?auto_305560 ) ) ( not ( = ?auto_305558 ?auto_305561 ) ) ( not ( = ?auto_305558 ?auto_305562 ) ) ( not ( = ?auto_305558 ?auto_305563 ) ) ( not ( = ?auto_305558 ?auto_305564 ) ) ( not ( = ?auto_305559 ?auto_305560 ) ) ( not ( = ?auto_305559 ?auto_305561 ) ) ( not ( = ?auto_305559 ?auto_305562 ) ) ( not ( = ?auto_305559 ?auto_305563 ) ) ( not ( = ?auto_305559 ?auto_305564 ) ) ( not ( = ?auto_305560 ?auto_305561 ) ) ( not ( = ?auto_305560 ?auto_305562 ) ) ( not ( = ?auto_305560 ?auto_305563 ) ) ( not ( = ?auto_305560 ?auto_305564 ) ) ( not ( = ?auto_305561 ?auto_305562 ) ) ( not ( = ?auto_305561 ?auto_305563 ) ) ( not ( = ?auto_305561 ?auto_305564 ) ) ( not ( = ?auto_305562 ?auto_305563 ) ) ( not ( = ?auto_305562 ?auto_305564 ) ) ( not ( = ?auto_305563 ?auto_305564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305563 ?auto_305564 )
      ( !STACK ?auto_305563 ?auto_305562 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305573 - BLOCK
      ?auto_305574 - BLOCK
      ?auto_305575 - BLOCK
      ?auto_305576 - BLOCK
      ?auto_305577 - BLOCK
      ?auto_305578 - BLOCK
      ?auto_305579 - BLOCK
      ?auto_305580 - BLOCK
    )
    :vars
    (
      ?auto_305581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305580 ?auto_305581 ) ( ON-TABLE ?auto_305573 ) ( ON ?auto_305574 ?auto_305573 ) ( ON ?auto_305575 ?auto_305574 ) ( ON ?auto_305576 ?auto_305575 ) ( ON ?auto_305577 ?auto_305576 ) ( ON ?auto_305578 ?auto_305577 ) ( not ( = ?auto_305573 ?auto_305574 ) ) ( not ( = ?auto_305573 ?auto_305575 ) ) ( not ( = ?auto_305573 ?auto_305576 ) ) ( not ( = ?auto_305573 ?auto_305577 ) ) ( not ( = ?auto_305573 ?auto_305578 ) ) ( not ( = ?auto_305573 ?auto_305579 ) ) ( not ( = ?auto_305573 ?auto_305580 ) ) ( not ( = ?auto_305573 ?auto_305581 ) ) ( not ( = ?auto_305574 ?auto_305575 ) ) ( not ( = ?auto_305574 ?auto_305576 ) ) ( not ( = ?auto_305574 ?auto_305577 ) ) ( not ( = ?auto_305574 ?auto_305578 ) ) ( not ( = ?auto_305574 ?auto_305579 ) ) ( not ( = ?auto_305574 ?auto_305580 ) ) ( not ( = ?auto_305574 ?auto_305581 ) ) ( not ( = ?auto_305575 ?auto_305576 ) ) ( not ( = ?auto_305575 ?auto_305577 ) ) ( not ( = ?auto_305575 ?auto_305578 ) ) ( not ( = ?auto_305575 ?auto_305579 ) ) ( not ( = ?auto_305575 ?auto_305580 ) ) ( not ( = ?auto_305575 ?auto_305581 ) ) ( not ( = ?auto_305576 ?auto_305577 ) ) ( not ( = ?auto_305576 ?auto_305578 ) ) ( not ( = ?auto_305576 ?auto_305579 ) ) ( not ( = ?auto_305576 ?auto_305580 ) ) ( not ( = ?auto_305576 ?auto_305581 ) ) ( not ( = ?auto_305577 ?auto_305578 ) ) ( not ( = ?auto_305577 ?auto_305579 ) ) ( not ( = ?auto_305577 ?auto_305580 ) ) ( not ( = ?auto_305577 ?auto_305581 ) ) ( not ( = ?auto_305578 ?auto_305579 ) ) ( not ( = ?auto_305578 ?auto_305580 ) ) ( not ( = ?auto_305578 ?auto_305581 ) ) ( not ( = ?auto_305579 ?auto_305580 ) ) ( not ( = ?auto_305579 ?auto_305581 ) ) ( not ( = ?auto_305580 ?auto_305581 ) ) ( CLEAR ?auto_305578 ) ( ON ?auto_305579 ?auto_305580 ) ( CLEAR ?auto_305579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_305573 ?auto_305574 ?auto_305575 ?auto_305576 ?auto_305577 ?auto_305578 ?auto_305579 )
      ( MAKE-8PILE ?auto_305573 ?auto_305574 ?auto_305575 ?auto_305576 ?auto_305577 ?auto_305578 ?auto_305579 ?auto_305580 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305590 - BLOCK
      ?auto_305591 - BLOCK
      ?auto_305592 - BLOCK
      ?auto_305593 - BLOCK
      ?auto_305594 - BLOCK
      ?auto_305595 - BLOCK
      ?auto_305596 - BLOCK
      ?auto_305597 - BLOCK
    )
    :vars
    (
      ?auto_305598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305597 ?auto_305598 ) ( ON-TABLE ?auto_305590 ) ( ON ?auto_305591 ?auto_305590 ) ( ON ?auto_305592 ?auto_305591 ) ( ON ?auto_305593 ?auto_305592 ) ( ON ?auto_305594 ?auto_305593 ) ( ON ?auto_305595 ?auto_305594 ) ( not ( = ?auto_305590 ?auto_305591 ) ) ( not ( = ?auto_305590 ?auto_305592 ) ) ( not ( = ?auto_305590 ?auto_305593 ) ) ( not ( = ?auto_305590 ?auto_305594 ) ) ( not ( = ?auto_305590 ?auto_305595 ) ) ( not ( = ?auto_305590 ?auto_305596 ) ) ( not ( = ?auto_305590 ?auto_305597 ) ) ( not ( = ?auto_305590 ?auto_305598 ) ) ( not ( = ?auto_305591 ?auto_305592 ) ) ( not ( = ?auto_305591 ?auto_305593 ) ) ( not ( = ?auto_305591 ?auto_305594 ) ) ( not ( = ?auto_305591 ?auto_305595 ) ) ( not ( = ?auto_305591 ?auto_305596 ) ) ( not ( = ?auto_305591 ?auto_305597 ) ) ( not ( = ?auto_305591 ?auto_305598 ) ) ( not ( = ?auto_305592 ?auto_305593 ) ) ( not ( = ?auto_305592 ?auto_305594 ) ) ( not ( = ?auto_305592 ?auto_305595 ) ) ( not ( = ?auto_305592 ?auto_305596 ) ) ( not ( = ?auto_305592 ?auto_305597 ) ) ( not ( = ?auto_305592 ?auto_305598 ) ) ( not ( = ?auto_305593 ?auto_305594 ) ) ( not ( = ?auto_305593 ?auto_305595 ) ) ( not ( = ?auto_305593 ?auto_305596 ) ) ( not ( = ?auto_305593 ?auto_305597 ) ) ( not ( = ?auto_305593 ?auto_305598 ) ) ( not ( = ?auto_305594 ?auto_305595 ) ) ( not ( = ?auto_305594 ?auto_305596 ) ) ( not ( = ?auto_305594 ?auto_305597 ) ) ( not ( = ?auto_305594 ?auto_305598 ) ) ( not ( = ?auto_305595 ?auto_305596 ) ) ( not ( = ?auto_305595 ?auto_305597 ) ) ( not ( = ?auto_305595 ?auto_305598 ) ) ( not ( = ?auto_305596 ?auto_305597 ) ) ( not ( = ?auto_305596 ?auto_305598 ) ) ( not ( = ?auto_305597 ?auto_305598 ) ) ( CLEAR ?auto_305595 ) ( ON ?auto_305596 ?auto_305597 ) ( CLEAR ?auto_305596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_305590 ?auto_305591 ?auto_305592 ?auto_305593 ?auto_305594 ?auto_305595 ?auto_305596 )
      ( MAKE-8PILE ?auto_305590 ?auto_305591 ?auto_305592 ?auto_305593 ?auto_305594 ?auto_305595 ?auto_305596 ?auto_305597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305607 - BLOCK
      ?auto_305608 - BLOCK
      ?auto_305609 - BLOCK
      ?auto_305610 - BLOCK
      ?auto_305611 - BLOCK
      ?auto_305612 - BLOCK
      ?auto_305613 - BLOCK
      ?auto_305614 - BLOCK
    )
    :vars
    (
      ?auto_305615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305614 ?auto_305615 ) ( ON-TABLE ?auto_305607 ) ( ON ?auto_305608 ?auto_305607 ) ( ON ?auto_305609 ?auto_305608 ) ( ON ?auto_305610 ?auto_305609 ) ( ON ?auto_305611 ?auto_305610 ) ( not ( = ?auto_305607 ?auto_305608 ) ) ( not ( = ?auto_305607 ?auto_305609 ) ) ( not ( = ?auto_305607 ?auto_305610 ) ) ( not ( = ?auto_305607 ?auto_305611 ) ) ( not ( = ?auto_305607 ?auto_305612 ) ) ( not ( = ?auto_305607 ?auto_305613 ) ) ( not ( = ?auto_305607 ?auto_305614 ) ) ( not ( = ?auto_305607 ?auto_305615 ) ) ( not ( = ?auto_305608 ?auto_305609 ) ) ( not ( = ?auto_305608 ?auto_305610 ) ) ( not ( = ?auto_305608 ?auto_305611 ) ) ( not ( = ?auto_305608 ?auto_305612 ) ) ( not ( = ?auto_305608 ?auto_305613 ) ) ( not ( = ?auto_305608 ?auto_305614 ) ) ( not ( = ?auto_305608 ?auto_305615 ) ) ( not ( = ?auto_305609 ?auto_305610 ) ) ( not ( = ?auto_305609 ?auto_305611 ) ) ( not ( = ?auto_305609 ?auto_305612 ) ) ( not ( = ?auto_305609 ?auto_305613 ) ) ( not ( = ?auto_305609 ?auto_305614 ) ) ( not ( = ?auto_305609 ?auto_305615 ) ) ( not ( = ?auto_305610 ?auto_305611 ) ) ( not ( = ?auto_305610 ?auto_305612 ) ) ( not ( = ?auto_305610 ?auto_305613 ) ) ( not ( = ?auto_305610 ?auto_305614 ) ) ( not ( = ?auto_305610 ?auto_305615 ) ) ( not ( = ?auto_305611 ?auto_305612 ) ) ( not ( = ?auto_305611 ?auto_305613 ) ) ( not ( = ?auto_305611 ?auto_305614 ) ) ( not ( = ?auto_305611 ?auto_305615 ) ) ( not ( = ?auto_305612 ?auto_305613 ) ) ( not ( = ?auto_305612 ?auto_305614 ) ) ( not ( = ?auto_305612 ?auto_305615 ) ) ( not ( = ?auto_305613 ?auto_305614 ) ) ( not ( = ?auto_305613 ?auto_305615 ) ) ( not ( = ?auto_305614 ?auto_305615 ) ) ( ON ?auto_305613 ?auto_305614 ) ( CLEAR ?auto_305611 ) ( ON ?auto_305612 ?auto_305613 ) ( CLEAR ?auto_305612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_305607 ?auto_305608 ?auto_305609 ?auto_305610 ?auto_305611 ?auto_305612 )
      ( MAKE-8PILE ?auto_305607 ?auto_305608 ?auto_305609 ?auto_305610 ?auto_305611 ?auto_305612 ?auto_305613 ?auto_305614 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305624 - BLOCK
      ?auto_305625 - BLOCK
      ?auto_305626 - BLOCK
      ?auto_305627 - BLOCK
      ?auto_305628 - BLOCK
      ?auto_305629 - BLOCK
      ?auto_305630 - BLOCK
      ?auto_305631 - BLOCK
    )
    :vars
    (
      ?auto_305632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305631 ?auto_305632 ) ( ON-TABLE ?auto_305624 ) ( ON ?auto_305625 ?auto_305624 ) ( ON ?auto_305626 ?auto_305625 ) ( ON ?auto_305627 ?auto_305626 ) ( ON ?auto_305628 ?auto_305627 ) ( not ( = ?auto_305624 ?auto_305625 ) ) ( not ( = ?auto_305624 ?auto_305626 ) ) ( not ( = ?auto_305624 ?auto_305627 ) ) ( not ( = ?auto_305624 ?auto_305628 ) ) ( not ( = ?auto_305624 ?auto_305629 ) ) ( not ( = ?auto_305624 ?auto_305630 ) ) ( not ( = ?auto_305624 ?auto_305631 ) ) ( not ( = ?auto_305624 ?auto_305632 ) ) ( not ( = ?auto_305625 ?auto_305626 ) ) ( not ( = ?auto_305625 ?auto_305627 ) ) ( not ( = ?auto_305625 ?auto_305628 ) ) ( not ( = ?auto_305625 ?auto_305629 ) ) ( not ( = ?auto_305625 ?auto_305630 ) ) ( not ( = ?auto_305625 ?auto_305631 ) ) ( not ( = ?auto_305625 ?auto_305632 ) ) ( not ( = ?auto_305626 ?auto_305627 ) ) ( not ( = ?auto_305626 ?auto_305628 ) ) ( not ( = ?auto_305626 ?auto_305629 ) ) ( not ( = ?auto_305626 ?auto_305630 ) ) ( not ( = ?auto_305626 ?auto_305631 ) ) ( not ( = ?auto_305626 ?auto_305632 ) ) ( not ( = ?auto_305627 ?auto_305628 ) ) ( not ( = ?auto_305627 ?auto_305629 ) ) ( not ( = ?auto_305627 ?auto_305630 ) ) ( not ( = ?auto_305627 ?auto_305631 ) ) ( not ( = ?auto_305627 ?auto_305632 ) ) ( not ( = ?auto_305628 ?auto_305629 ) ) ( not ( = ?auto_305628 ?auto_305630 ) ) ( not ( = ?auto_305628 ?auto_305631 ) ) ( not ( = ?auto_305628 ?auto_305632 ) ) ( not ( = ?auto_305629 ?auto_305630 ) ) ( not ( = ?auto_305629 ?auto_305631 ) ) ( not ( = ?auto_305629 ?auto_305632 ) ) ( not ( = ?auto_305630 ?auto_305631 ) ) ( not ( = ?auto_305630 ?auto_305632 ) ) ( not ( = ?auto_305631 ?auto_305632 ) ) ( ON ?auto_305630 ?auto_305631 ) ( CLEAR ?auto_305628 ) ( ON ?auto_305629 ?auto_305630 ) ( CLEAR ?auto_305629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_305624 ?auto_305625 ?auto_305626 ?auto_305627 ?auto_305628 ?auto_305629 )
      ( MAKE-8PILE ?auto_305624 ?auto_305625 ?auto_305626 ?auto_305627 ?auto_305628 ?auto_305629 ?auto_305630 ?auto_305631 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305641 - BLOCK
      ?auto_305642 - BLOCK
      ?auto_305643 - BLOCK
      ?auto_305644 - BLOCK
      ?auto_305645 - BLOCK
      ?auto_305646 - BLOCK
      ?auto_305647 - BLOCK
      ?auto_305648 - BLOCK
    )
    :vars
    (
      ?auto_305649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305648 ?auto_305649 ) ( ON-TABLE ?auto_305641 ) ( ON ?auto_305642 ?auto_305641 ) ( ON ?auto_305643 ?auto_305642 ) ( ON ?auto_305644 ?auto_305643 ) ( not ( = ?auto_305641 ?auto_305642 ) ) ( not ( = ?auto_305641 ?auto_305643 ) ) ( not ( = ?auto_305641 ?auto_305644 ) ) ( not ( = ?auto_305641 ?auto_305645 ) ) ( not ( = ?auto_305641 ?auto_305646 ) ) ( not ( = ?auto_305641 ?auto_305647 ) ) ( not ( = ?auto_305641 ?auto_305648 ) ) ( not ( = ?auto_305641 ?auto_305649 ) ) ( not ( = ?auto_305642 ?auto_305643 ) ) ( not ( = ?auto_305642 ?auto_305644 ) ) ( not ( = ?auto_305642 ?auto_305645 ) ) ( not ( = ?auto_305642 ?auto_305646 ) ) ( not ( = ?auto_305642 ?auto_305647 ) ) ( not ( = ?auto_305642 ?auto_305648 ) ) ( not ( = ?auto_305642 ?auto_305649 ) ) ( not ( = ?auto_305643 ?auto_305644 ) ) ( not ( = ?auto_305643 ?auto_305645 ) ) ( not ( = ?auto_305643 ?auto_305646 ) ) ( not ( = ?auto_305643 ?auto_305647 ) ) ( not ( = ?auto_305643 ?auto_305648 ) ) ( not ( = ?auto_305643 ?auto_305649 ) ) ( not ( = ?auto_305644 ?auto_305645 ) ) ( not ( = ?auto_305644 ?auto_305646 ) ) ( not ( = ?auto_305644 ?auto_305647 ) ) ( not ( = ?auto_305644 ?auto_305648 ) ) ( not ( = ?auto_305644 ?auto_305649 ) ) ( not ( = ?auto_305645 ?auto_305646 ) ) ( not ( = ?auto_305645 ?auto_305647 ) ) ( not ( = ?auto_305645 ?auto_305648 ) ) ( not ( = ?auto_305645 ?auto_305649 ) ) ( not ( = ?auto_305646 ?auto_305647 ) ) ( not ( = ?auto_305646 ?auto_305648 ) ) ( not ( = ?auto_305646 ?auto_305649 ) ) ( not ( = ?auto_305647 ?auto_305648 ) ) ( not ( = ?auto_305647 ?auto_305649 ) ) ( not ( = ?auto_305648 ?auto_305649 ) ) ( ON ?auto_305647 ?auto_305648 ) ( ON ?auto_305646 ?auto_305647 ) ( CLEAR ?auto_305644 ) ( ON ?auto_305645 ?auto_305646 ) ( CLEAR ?auto_305645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305641 ?auto_305642 ?auto_305643 ?auto_305644 ?auto_305645 )
      ( MAKE-8PILE ?auto_305641 ?auto_305642 ?auto_305643 ?auto_305644 ?auto_305645 ?auto_305646 ?auto_305647 ?auto_305648 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305658 - BLOCK
      ?auto_305659 - BLOCK
      ?auto_305660 - BLOCK
      ?auto_305661 - BLOCK
      ?auto_305662 - BLOCK
      ?auto_305663 - BLOCK
      ?auto_305664 - BLOCK
      ?auto_305665 - BLOCK
    )
    :vars
    (
      ?auto_305666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305665 ?auto_305666 ) ( ON-TABLE ?auto_305658 ) ( ON ?auto_305659 ?auto_305658 ) ( ON ?auto_305660 ?auto_305659 ) ( ON ?auto_305661 ?auto_305660 ) ( not ( = ?auto_305658 ?auto_305659 ) ) ( not ( = ?auto_305658 ?auto_305660 ) ) ( not ( = ?auto_305658 ?auto_305661 ) ) ( not ( = ?auto_305658 ?auto_305662 ) ) ( not ( = ?auto_305658 ?auto_305663 ) ) ( not ( = ?auto_305658 ?auto_305664 ) ) ( not ( = ?auto_305658 ?auto_305665 ) ) ( not ( = ?auto_305658 ?auto_305666 ) ) ( not ( = ?auto_305659 ?auto_305660 ) ) ( not ( = ?auto_305659 ?auto_305661 ) ) ( not ( = ?auto_305659 ?auto_305662 ) ) ( not ( = ?auto_305659 ?auto_305663 ) ) ( not ( = ?auto_305659 ?auto_305664 ) ) ( not ( = ?auto_305659 ?auto_305665 ) ) ( not ( = ?auto_305659 ?auto_305666 ) ) ( not ( = ?auto_305660 ?auto_305661 ) ) ( not ( = ?auto_305660 ?auto_305662 ) ) ( not ( = ?auto_305660 ?auto_305663 ) ) ( not ( = ?auto_305660 ?auto_305664 ) ) ( not ( = ?auto_305660 ?auto_305665 ) ) ( not ( = ?auto_305660 ?auto_305666 ) ) ( not ( = ?auto_305661 ?auto_305662 ) ) ( not ( = ?auto_305661 ?auto_305663 ) ) ( not ( = ?auto_305661 ?auto_305664 ) ) ( not ( = ?auto_305661 ?auto_305665 ) ) ( not ( = ?auto_305661 ?auto_305666 ) ) ( not ( = ?auto_305662 ?auto_305663 ) ) ( not ( = ?auto_305662 ?auto_305664 ) ) ( not ( = ?auto_305662 ?auto_305665 ) ) ( not ( = ?auto_305662 ?auto_305666 ) ) ( not ( = ?auto_305663 ?auto_305664 ) ) ( not ( = ?auto_305663 ?auto_305665 ) ) ( not ( = ?auto_305663 ?auto_305666 ) ) ( not ( = ?auto_305664 ?auto_305665 ) ) ( not ( = ?auto_305664 ?auto_305666 ) ) ( not ( = ?auto_305665 ?auto_305666 ) ) ( ON ?auto_305664 ?auto_305665 ) ( ON ?auto_305663 ?auto_305664 ) ( CLEAR ?auto_305661 ) ( ON ?auto_305662 ?auto_305663 ) ( CLEAR ?auto_305662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305658 ?auto_305659 ?auto_305660 ?auto_305661 ?auto_305662 )
      ( MAKE-8PILE ?auto_305658 ?auto_305659 ?auto_305660 ?auto_305661 ?auto_305662 ?auto_305663 ?auto_305664 ?auto_305665 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305675 - BLOCK
      ?auto_305676 - BLOCK
      ?auto_305677 - BLOCK
      ?auto_305678 - BLOCK
      ?auto_305679 - BLOCK
      ?auto_305680 - BLOCK
      ?auto_305681 - BLOCK
      ?auto_305682 - BLOCK
    )
    :vars
    (
      ?auto_305683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305682 ?auto_305683 ) ( ON-TABLE ?auto_305675 ) ( ON ?auto_305676 ?auto_305675 ) ( ON ?auto_305677 ?auto_305676 ) ( not ( = ?auto_305675 ?auto_305676 ) ) ( not ( = ?auto_305675 ?auto_305677 ) ) ( not ( = ?auto_305675 ?auto_305678 ) ) ( not ( = ?auto_305675 ?auto_305679 ) ) ( not ( = ?auto_305675 ?auto_305680 ) ) ( not ( = ?auto_305675 ?auto_305681 ) ) ( not ( = ?auto_305675 ?auto_305682 ) ) ( not ( = ?auto_305675 ?auto_305683 ) ) ( not ( = ?auto_305676 ?auto_305677 ) ) ( not ( = ?auto_305676 ?auto_305678 ) ) ( not ( = ?auto_305676 ?auto_305679 ) ) ( not ( = ?auto_305676 ?auto_305680 ) ) ( not ( = ?auto_305676 ?auto_305681 ) ) ( not ( = ?auto_305676 ?auto_305682 ) ) ( not ( = ?auto_305676 ?auto_305683 ) ) ( not ( = ?auto_305677 ?auto_305678 ) ) ( not ( = ?auto_305677 ?auto_305679 ) ) ( not ( = ?auto_305677 ?auto_305680 ) ) ( not ( = ?auto_305677 ?auto_305681 ) ) ( not ( = ?auto_305677 ?auto_305682 ) ) ( not ( = ?auto_305677 ?auto_305683 ) ) ( not ( = ?auto_305678 ?auto_305679 ) ) ( not ( = ?auto_305678 ?auto_305680 ) ) ( not ( = ?auto_305678 ?auto_305681 ) ) ( not ( = ?auto_305678 ?auto_305682 ) ) ( not ( = ?auto_305678 ?auto_305683 ) ) ( not ( = ?auto_305679 ?auto_305680 ) ) ( not ( = ?auto_305679 ?auto_305681 ) ) ( not ( = ?auto_305679 ?auto_305682 ) ) ( not ( = ?auto_305679 ?auto_305683 ) ) ( not ( = ?auto_305680 ?auto_305681 ) ) ( not ( = ?auto_305680 ?auto_305682 ) ) ( not ( = ?auto_305680 ?auto_305683 ) ) ( not ( = ?auto_305681 ?auto_305682 ) ) ( not ( = ?auto_305681 ?auto_305683 ) ) ( not ( = ?auto_305682 ?auto_305683 ) ) ( ON ?auto_305681 ?auto_305682 ) ( ON ?auto_305680 ?auto_305681 ) ( ON ?auto_305679 ?auto_305680 ) ( CLEAR ?auto_305677 ) ( ON ?auto_305678 ?auto_305679 ) ( CLEAR ?auto_305678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305675 ?auto_305676 ?auto_305677 ?auto_305678 )
      ( MAKE-8PILE ?auto_305675 ?auto_305676 ?auto_305677 ?auto_305678 ?auto_305679 ?auto_305680 ?auto_305681 ?auto_305682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305692 - BLOCK
      ?auto_305693 - BLOCK
      ?auto_305694 - BLOCK
      ?auto_305695 - BLOCK
      ?auto_305696 - BLOCK
      ?auto_305697 - BLOCK
      ?auto_305698 - BLOCK
      ?auto_305699 - BLOCK
    )
    :vars
    (
      ?auto_305700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305699 ?auto_305700 ) ( ON-TABLE ?auto_305692 ) ( ON ?auto_305693 ?auto_305692 ) ( ON ?auto_305694 ?auto_305693 ) ( not ( = ?auto_305692 ?auto_305693 ) ) ( not ( = ?auto_305692 ?auto_305694 ) ) ( not ( = ?auto_305692 ?auto_305695 ) ) ( not ( = ?auto_305692 ?auto_305696 ) ) ( not ( = ?auto_305692 ?auto_305697 ) ) ( not ( = ?auto_305692 ?auto_305698 ) ) ( not ( = ?auto_305692 ?auto_305699 ) ) ( not ( = ?auto_305692 ?auto_305700 ) ) ( not ( = ?auto_305693 ?auto_305694 ) ) ( not ( = ?auto_305693 ?auto_305695 ) ) ( not ( = ?auto_305693 ?auto_305696 ) ) ( not ( = ?auto_305693 ?auto_305697 ) ) ( not ( = ?auto_305693 ?auto_305698 ) ) ( not ( = ?auto_305693 ?auto_305699 ) ) ( not ( = ?auto_305693 ?auto_305700 ) ) ( not ( = ?auto_305694 ?auto_305695 ) ) ( not ( = ?auto_305694 ?auto_305696 ) ) ( not ( = ?auto_305694 ?auto_305697 ) ) ( not ( = ?auto_305694 ?auto_305698 ) ) ( not ( = ?auto_305694 ?auto_305699 ) ) ( not ( = ?auto_305694 ?auto_305700 ) ) ( not ( = ?auto_305695 ?auto_305696 ) ) ( not ( = ?auto_305695 ?auto_305697 ) ) ( not ( = ?auto_305695 ?auto_305698 ) ) ( not ( = ?auto_305695 ?auto_305699 ) ) ( not ( = ?auto_305695 ?auto_305700 ) ) ( not ( = ?auto_305696 ?auto_305697 ) ) ( not ( = ?auto_305696 ?auto_305698 ) ) ( not ( = ?auto_305696 ?auto_305699 ) ) ( not ( = ?auto_305696 ?auto_305700 ) ) ( not ( = ?auto_305697 ?auto_305698 ) ) ( not ( = ?auto_305697 ?auto_305699 ) ) ( not ( = ?auto_305697 ?auto_305700 ) ) ( not ( = ?auto_305698 ?auto_305699 ) ) ( not ( = ?auto_305698 ?auto_305700 ) ) ( not ( = ?auto_305699 ?auto_305700 ) ) ( ON ?auto_305698 ?auto_305699 ) ( ON ?auto_305697 ?auto_305698 ) ( ON ?auto_305696 ?auto_305697 ) ( CLEAR ?auto_305694 ) ( ON ?auto_305695 ?auto_305696 ) ( CLEAR ?auto_305695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_305692 ?auto_305693 ?auto_305694 ?auto_305695 )
      ( MAKE-8PILE ?auto_305692 ?auto_305693 ?auto_305694 ?auto_305695 ?auto_305696 ?auto_305697 ?auto_305698 ?auto_305699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305709 - BLOCK
      ?auto_305710 - BLOCK
      ?auto_305711 - BLOCK
      ?auto_305712 - BLOCK
      ?auto_305713 - BLOCK
      ?auto_305714 - BLOCK
      ?auto_305715 - BLOCK
      ?auto_305716 - BLOCK
    )
    :vars
    (
      ?auto_305717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305716 ?auto_305717 ) ( ON-TABLE ?auto_305709 ) ( ON ?auto_305710 ?auto_305709 ) ( not ( = ?auto_305709 ?auto_305710 ) ) ( not ( = ?auto_305709 ?auto_305711 ) ) ( not ( = ?auto_305709 ?auto_305712 ) ) ( not ( = ?auto_305709 ?auto_305713 ) ) ( not ( = ?auto_305709 ?auto_305714 ) ) ( not ( = ?auto_305709 ?auto_305715 ) ) ( not ( = ?auto_305709 ?auto_305716 ) ) ( not ( = ?auto_305709 ?auto_305717 ) ) ( not ( = ?auto_305710 ?auto_305711 ) ) ( not ( = ?auto_305710 ?auto_305712 ) ) ( not ( = ?auto_305710 ?auto_305713 ) ) ( not ( = ?auto_305710 ?auto_305714 ) ) ( not ( = ?auto_305710 ?auto_305715 ) ) ( not ( = ?auto_305710 ?auto_305716 ) ) ( not ( = ?auto_305710 ?auto_305717 ) ) ( not ( = ?auto_305711 ?auto_305712 ) ) ( not ( = ?auto_305711 ?auto_305713 ) ) ( not ( = ?auto_305711 ?auto_305714 ) ) ( not ( = ?auto_305711 ?auto_305715 ) ) ( not ( = ?auto_305711 ?auto_305716 ) ) ( not ( = ?auto_305711 ?auto_305717 ) ) ( not ( = ?auto_305712 ?auto_305713 ) ) ( not ( = ?auto_305712 ?auto_305714 ) ) ( not ( = ?auto_305712 ?auto_305715 ) ) ( not ( = ?auto_305712 ?auto_305716 ) ) ( not ( = ?auto_305712 ?auto_305717 ) ) ( not ( = ?auto_305713 ?auto_305714 ) ) ( not ( = ?auto_305713 ?auto_305715 ) ) ( not ( = ?auto_305713 ?auto_305716 ) ) ( not ( = ?auto_305713 ?auto_305717 ) ) ( not ( = ?auto_305714 ?auto_305715 ) ) ( not ( = ?auto_305714 ?auto_305716 ) ) ( not ( = ?auto_305714 ?auto_305717 ) ) ( not ( = ?auto_305715 ?auto_305716 ) ) ( not ( = ?auto_305715 ?auto_305717 ) ) ( not ( = ?auto_305716 ?auto_305717 ) ) ( ON ?auto_305715 ?auto_305716 ) ( ON ?auto_305714 ?auto_305715 ) ( ON ?auto_305713 ?auto_305714 ) ( ON ?auto_305712 ?auto_305713 ) ( CLEAR ?auto_305710 ) ( ON ?auto_305711 ?auto_305712 ) ( CLEAR ?auto_305711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305709 ?auto_305710 ?auto_305711 )
      ( MAKE-8PILE ?auto_305709 ?auto_305710 ?auto_305711 ?auto_305712 ?auto_305713 ?auto_305714 ?auto_305715 ?auto_305716 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305726 - BLOCK
      ?auto_305727 - BLOCK
      ?auto_305728 - BLOCK
      ?auto_305729 - BLOCK
      ?auto_305730 - BLOCK
      ?auto_305731 - BLOCK
      ?auto_305732 - BLOCK
      ?auto_305733 - BLOCK
    )
    :vars
    (
      ?auto_305734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305733 ?auto_305734 ) ( ON-TABLE ?auto_305726 ) ( ON ?auto_305727 ?auto_305726 ) ( not ( = ?auto_305726 ?auto_305727 ) ) ( not ( = ?auto_305726 ?auto_305728 ) ) ( not ( = ?auto_305726 ?auto_305729 ) ) ( not ( = ?auto_305726 ?auto_305730 ) ) ( not ( = ?auto_305726 ?auto_305731 ) ) ( not ( = ?auto_305726 ?auto_305732 ) ) ( not ( = ?auto_305726 ?auto_305733 ) ) ( not ( = ?auto_305726 ?auto_305734 ) ) ( not ( = ?auto_305727 ?auto_305728 ) ) ( not ( = ?auto_305727 ?auto_305729 ) ) ( not ( = ?auto_305727 ?auto_305730 ) ) ( not ( = ?auto_305727 ?auto_305731 ) ) ( not ( = ?auto_305727 ?auto_305732 ) ) ( not ( = ?auto_305727 ?auto_305733 ) ) ( not ( = ?auto_305727 ?auto_305734 ) ) ( not ( = ?auto_305728 ?auto_305729 ) ) ( not ( = ?auto_305728 ?auto_305730 ) ) ( not ( = ?auto_305728 ?auto_305731 ) ) ( not ( = ?auto_305728 ?auto_305732 ) ) ( not ( = ?auto_305728 ?auto_305733 ) ) ( not ( = ?auto_305728 ?auto_305734 ) ) ( not ( = ?auto_305729 ?auto_305730 ) ) ( not ( = ?auto_305729 ?auto_305731 ) ) ( not ( = ?auto_305729 ?auto_305732 ) ) ( not ( = ?auto_305729 ?auto_305733 ) ) ( not ( = ?auto_305729 ?auto_305734 ) ) ( not ( = ?auto_305730 ?auto_305731 ) ) ( not ( = ?auto_305730 ?auto_305732 ) ) ( not ( = ?auto_305730 ?auto_305733 ) ) ( not ( = ?auto_305730 ?auto_305734 ) ) ( not ( = ?auto_305731 ?auto_305732 ) ) ( not ( = ?auto_305731 ?auto_305733 ) ) ( not ( = ?auto_305731 ?auto_305734 ) ) ( not ( = ?auto_305732 ?auto_305733 ) ) ( not ( = ?auto_305732 ?auto_305734 ) ) ( not ( = ?auto_305733 ?auto_305734 ) ) ( ON ?auto_305732 ?auto_305733 ) ( ON ?auto_305731 ?auto_305732 ) ( ON ?auto_305730 ?auto_305731 ) ( ON ?auto_305729 ?auto_305730 ) ( CLEAR ?auto_305727 ) ( ON ?auto_305728 ?auto_305729 ) ( CLEAR ?auto_305728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_305726 ?auto_305727 ?auto_305728 )
      ( MAKE-8PILE ?auto_305726 ?auto_305727 ?auto_305728 ?auto_305729 ?auto_305730 ?auto_305731 ?auto_305732 ?auto_305733 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305743 - BLOCK
      ?auto_305744 - BLOCK
      ?auto_305745 - BLOCK
      ?auto_305746 - BLOCK
      ?auto_305747 - BLOCK
      ?auto_305748 - BLOCK
      ?auto_305749 - BLOCK
      ?auto_305750 - BLOCK
    )
    :vars
    (
      ?auto_305751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305750 ?auto_305751 ) ( ON-TABLE ?auto_305743 ) ( not ( = ?auto_305743 ?auto_305744 ) ) ( not ( = ?auto_305743 ?auto_305745 ) ) ( not ( = ?auto_305743 ?auto_305746 ) ) ( not ( = ?auto_305743 ?auto_305747 ) ) ( not ( = ?auto_305743 ?auto_305748 ) ) ( not ( = ?auto_305743 ?auto_305749 ) ) ( not ( = ?auto_305743 ?auto_305750 ) ) ( not ( = ?auto_305743 ?auto_305751 ) ) ( not ( = ?auto_305744 ?auto_305745 ) ) ( not ( = ?auto_305744 ?auto_305746 ) ) ( not ( = ?auto_305744 ?auto_305747 ) ) ( not ( = ?auto_305744 ?auto_305748 ) ) ( not ( = ?auto_305744 ?auto_305749 ) ) ( not ( = ?auto_305744 ?auto_305750 ) ) ( not ( = ?auto_305744 ?auto_305751 ) ) ( not ( = ?auto_305745 ?auto_305746 ) ) ( not ( = ?auto_305745 ?auto_305747 ) ) ( not ( = ?auto_305745 ?auto_305748 ) ) ( not ( = ?auto_305745 ?auto_305749 ) ) ( not ( = ?auto_305745 ?auto_305750 ) ) ( not ( = ?auto_305745 ?auto_305751 ) ) ( not ( = ?auto_305746 ?auto_305747 ) ) ( not ( = ?auto_305746 ?auto_305748 ) ) ( not ( = ?auto_305746 ?auto_305749 ) ) ( not ( = ?auto_305746 ?auto_305750 ) ) ( not ( = ?auto_305746 ?auto_305751 ) ) ( not ( = ?auto_305747 ?auto_305748 ) ) ( not ( = ?auto_305747 ?auto_305749 ) ) ( not ( = ?auto_305747 ?auto_305750 ) ) ( not ( = ?auto_305747 ?auto_305751 ) ) ( not ( = ?auto_305748 ?auto_305749 ) ) ( not ( = ?auto_305748 ?auto_305750 ) ) ( not ( = ?auto_305748 ?auto_305751 ) ) ( not ( = ?auto_305749 ?auto_305750 ) ) ( not ( = ?auto_305749 ?auto_305751 ) ) ( not ( = ?auto_305750 ?auto_305751 ) ) ( ON ?auto_305749 ?auto_305750 ) ( ON ?auto_305748 ?auto_305749 ) ( ON ?auto_305747 ?auto_305748 ) ( ON ?auto_305746 ?auto_305747 ) ( ON ?auto_305745 ?auto_305746 ) ( CLEAR ?auto_305743 ) ( ON ?auto_305744 ?auto_305745 ) ( CLEAR ?auto_305744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305743 ?auto_305744 )
      ( MAKE-8PILE ?auto_305743 ?auto_305744 ?auto_305745 ?auto_305746 ?auto_305747 ?auto_305748 ?auto_305749 ?auto_305750 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305760 - BLOCK
      ?auto_305761 - BLOCK
      ?auto_305762 - BLOCK
      ?auto_305763 - BLOCK
      ?auto_305764 - BLOCK
      ?auto_305765 - BLOCK
      ?auto_305766 - BLOCK
      ?auto_305767 - BLOCK
    )
    :vars
    (
      ?auto_305768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305767 ?auto_305768 ) ( ON-TABLE ?auto_305760 ) ( not ( = ?auto_305760 ?auto_305761 ) ) ( not ( = ?auto_305760 ?auto_305762 ) ) ( not ( = ?auto_305760 ?auto_305763 ) ) ( not ( = ?auto_305760 ?auto_305764 ) ) ( not ( = ?auto_305760 ?auto_305765 ) ) ( not ( = ?auto_305760 ?auto_305766 ) ) ( not ( = ?auto_305760 ?auto_305767 ) ) ( not ( = ?auto_305760 ?auto_305768 ) ) ( not ( = ?auto_305761 ?auto_305762 ) ) ( not ( = ?auto_305761 ?auto_305763 ) ) ( not ( = ?auto_305761 ?auto_305764 ) ) ( not ( = ?auto_305761 ?auto_305765 ) ) ( not ( = ?auto_305761 ?auto_305766 ) ) ( not ( = ?auto_305761 ?auto_305767 ) ) ( not ( = ?auto_305761 ?auto_305768 ) ) ( not ( = ?auto_305762 ?auto_305763 ) ) ( not ( = ?auto_305762 ?auto_305764 ) ) ( not ( = ?auto_305762 ?auto_305765 ) ) ( not ( = ?auto_305762 ?auto_305766 ) ) ( not ( = ?auto_305762 ?auto_305767 ) ) ( not ( = ?auto_305762 ?auto_305768 ) ) ( not ( = ?auto_305763 ?auto_305764 ) ) ( not ( = ?auto_305763 ?auto_305765 ) ) ( not ( = ?auto_305763 ?auto_305766 ) ) ( not ( = ?auto_305763 ?auto_305767 ) ) ( not ( = ?auto_305763 ?auto_305768 ) ) ( not ( = ?auto_305764 ?auto_305765 ) ) ( not ( = ?auto_305764 ?auto_305766 ) ) ( not ( = ?auto_305764 ?auto_305767 ) ) ( not ( = ?auto_305764 ?auto_305768 ) ) ( not ( = ?auto_305765 ?auto_305766 ) ) ( not ( = ?auto_305765 ?auto_305767 ) ) ( not ( = ?auto_305765 ?auto_305768 ) ) ( not ( = ?auto_305766 ?auto_305767 ) ) ( not ( = ?auto_305766 ?auto_305768 ) ) ( not ( = ?auto_305767 ?auto_305768 ) ) ( ON ?auto_305766 ?auto_305767 ) ( ON ?auto_305765 ?auto_305766 ) ( ON ?auto_305764 ?auto_305765 ) ( ON ?auto_305763 ?auto_305764 ) ( ON ?auto_305762 ?auto_305763 ) ( CLEAR ?auto_305760 ) ( ON ?auto_305761 ?auto_305762 ) ( CLEAR ?auto_305761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_305760 ?auto_305761 )
      ( MAKE-8PILE ?auto_305760 ?auto_305761 ?auto_305762 ?auto_305763 ?auto_305764 ?auto_305765 ?auto_305766 ?auto_305767 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305777 - BLOCK
      ?auto_305778 - BLOCK
      ?auto_305779 - BLOCK
      ?auto_305780 - BLOCK
      ?auto_305781 - BLOCK
      ?auto_305782 - BLOCK
      ?auto_305783 - BLOCK
      ?auto_305784 - BLOCK
    )
    :vars
    (
      ?auto_305785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305784 ?auto_305785 ) ( not ( = ?auto_305777 ?auto_305778 ) ) ( not ( = ?auto_305777 ?auto_305779 ) ) ( not ( = ?auto_305777 ?auto_305780 ) ) ( not ( = ?auto_305777 ?auto_305781 ) ) ( not ( = ?auto_305777 ?auto_305782 ) ) ( not ( = ?auto_305777 ?auto_305783 ) ) ( not ( = ?auto_305777 ?auto_305784 ) ) ( not ( = ?auto_305777 ?auto_305785 ) ) ( not ( = ?auto_305778 ?auto_305779 ) ) ( not ( = ?auto_305778 ?auto_305780 ) ) ( not ( = ?auto_305778 ?auto_305781 ) ) ( not ( = ?auto_305778 ?auto_305782 ) ) ( not ( = ?auto_305778 ?auto_305783 ) ) ( not ( = ?auto_305778 ?auto_305784 ) ) ( not ( = ?auto_305778 ?auto_305785 ) ) ( not ( = ?auto_305779 ?auto_305780 ) ) ( not ( = ?auto_305779 ?auto_305781 ) ) ( not ( = ?auto_305779 ?auto_305782 ) ) ( not ( = ?auto_305779 ?auto_305783 ) ) ( not ( = ?auto_305779 ?auto_305784 ) ) ( not ( = ?auto_305779 ?auto_305785 ) ) ( not ( = ?auto_305780 ?auto_305781 ) ) ( not ( = ?auto_305780 ?auto_305782 ) ) ( not ( = ?auto_305780 ?auto_305783 ) ) ( not ( = ?auto_305780 ?auto_305784 ) ) ( not ( = ?auto_305780 ?auto_305785 ) ) ( not ( = ?auto_305781 ?auto_305782 ) ) ( not ( = ?auto_305781 ?auto_305783 ) ) ( not ( = ?auto_305781 ?auto_305784 ) ) ( not ( = ?auto_305781 ?auto_305785 ) ) ( not ( = ?auto_305782 ?auto_305783 ) ) ( not ( = ?auto_305782 ?auto_305784 ) ) ( not ( = ?auto_305782 ?auto_305785 ) ) ( not ( = ?auto_305783 ?auto_305784 ) ) ( not ( = ?auto_305783 ?auto_305785 ) ) ( not ( = ?auto_305784 ?auto_305785 ) ) ( ON ?auto_305783 ?auto_305784 ) ( ON ?auto_305782 ?auto_305783 ) ( ON ?auto_305781 ?auto_305782 ) ( ON ?auto_305780 ?auto_305781 ) ( ON ?auto_305779 ?auto_305780 ) ( ON ?auto_305778 ?auto_305779 ) ( ON ?auto_305777 ?auto_305778 ) ( CLEAR ?auto_305777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305777 )
      ( MAKE-8PILE ?auto_305777 ?auto_305778 ?auto_305779 ?auto_305780 ?auto_305781 ?auto_305782 ?auto_305783 ?auto_305784 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_305794 - BLOCK
      ?auto_305795 - BLOCK
      ?auto_305796 - BLOCK
      ?auto_305797 - BLOCK
      ?auto_305798 - BLOCK
      ?auto_305799 - BLOCK
      ?auto_305800 - BLOCK
      ?auto_305801 - BLOCK
    )
    :vars
    (
      ?auto_305802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305801 ?auto_305802 ) ( not ( = ?auto_305794 ?auto_305795 ) ) ( not ( = ?auto_305794 ?auto_305796 ) ) ( not ( = ?auto_305794 ?auto_305797 ) ) ( not ( = ?auto_305794 ?auto_305798 ) ) ( not ( = ?auto_305794 ?auto_305799 ) ) ( not ( = ?auto_305794 ?auto_305800 ) ) ( not ( = ?auto_305794 ?auto_305801 ) ) ( not ( = ?auto_305794 ?auto_305802 ) ) ( not ( = ?auto_305795 ?auto_305796 ) ) ( not ( = ?auto_305795 ?auto_305797 ) ) ( not ( = ?auto_305795 ?auto_305798 ) ) ( not ( = ?auto_305795 ?auto_305799 ) ) ( not ( = ?auto_305795 ?auto_305800 ) ) ( not ( = ?auto_305795 ?auto_305801 ) ) ( not ( = ?auto_305795 ?auto_305802 ) ) ( not ( = ?auto_305796 ?auto_305797 ) ) ( not ( = ?auto_305796 ?auto_305798 ) ) ( not ( = ?auto_305796 ?auto_305799 ) ) ( not ( = ?auto_305796 ?auto_305800 ) ) ( not ( = ?auto_305796 ?auto_305801 ) ) ( not ( = ?auto_305796 ?auto_305802 ) ) ( not ( = ?auto_305797 ?auto_305798 ) ) ( not ( = ?auto_305797 ?auto_305799 ) ) ( not ( = ?auto_305797 ?auto_305800 ) ) ( not ( = ?auto_305797 ?auto_305801 ) ) ( not ( = ?auto_305797 ?auto_305802 ) ) ( not ( = ?auto_305798 ?auto_305799 ) ) ( not ( = ?auto_305798 ?auto_305800 ) ) ( not ( = ?auto_305798 ?auto_305801 ) ) ( not ( = ?auto_305798 ?auto_305802 ) ) ( not ( = ?auto_305799 ?auto_305800 ) ) ( not ( = ?auto_305799 ?auto_305801 ) ) ( not ( = ?auto_305799 ?auto_305802 ) ) ( not ( = ?auto_305800 ?auto_305801 ) ) ( not ( = ?auto_305800 ?auto_305802 ) ) ( not ( = ?auto_305801 ?auto_305802 ) ) ( ON ?auto_305800 ?auto_305801 ) ( ON ?auto_305799 ?auto_305800 ) ( ON ?auto_305798 ?auto_305799 ) ( ON ?auto_305797 ?auto_305798 ) ( ON ?auto_305796 ?auto_305797 ) ( ON ?auto_305795 ?auto_305796 ) ( ON ?auto_305794 ?auto_305795 ) ( CLEAR ?auto_305794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_305794 )
      ( MAKE-8PILE ?auto_305794 ?auto_305795 ?auto_305796 ?auto_305797 ?auto_305798 ?auto_305799 ?auto_305800 ?auto_305801 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305812 - BLOCK
      ?auto_305813 - BLOCK
      ?auto_305814 - BLOCK
      ?auto_305815 - BLOCK
      ?auto_305816 - BLOCK
      ?auto_305817 - BLOCK
      ?auto_305818 - BLOCK
      ?auto_305819 - BLOCK
      ?auto_305820 - BLOCK
    )
    :vars
    (
      ?auto_305821 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305819 ) ( ON ?auto_305820 ?auto_305821 ) ( CLEAR ?auto_305820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305812 ) ( ON ?auto_305813 ?auto_305812 ) ( ON ?auto_305814 ?auto_305813 ) ( ON ?auto_305815 ?auto_305814 ) ( ON ?auto_305816 ?auto_305815 ) ( ON ?auto_305817 ?auto_305816 ) ( ON ?auto_305818 ?auto_305817 ) ( ON ?auto_305819 ?auto_305818 ) ( not ( = ?auto_305812 ?auto_305813 ) ) ( not ( = ?auto_305812 ?auto_305814 ) ) ( not ( = ?auto_305812 ?auto_305815 ) ) ( not ( = ?auto_305812 ?auto_305816 ) ) ( not ( = ?auto_305812 ?auto_305817 ) ) ( not ( = ?auto_305812 ?auto_305818 ) ) ( not ( = ?auto_305812 ?auto_305819 ) ) ( not ( = ?auto_305812 ?auto_305820 ) ) ( not ( = ?auto_305812 ?auto_305821 ) ) ( not ( = ?auto_305813 ?auto_305814 ) ) ( not ( = ?auto_305813 ?auto_305815 ) ) ( not ( = ?auto_305813 ?auto_305816 ) ) ( not ( = ?auto_305813 ?auto_305817 ) ) ( not ( = ?auto_305813 ?auto_305818 ) ) ( not ( = ?auto_305813 ?auto_305819 ) ) ( not ( = ?auto_305813 ?auto_305820 ) ) ( not ( = ?auto_305813 ?auto_305821 ) ) ( not ( = ?auto_305814 ?auto_305815 ) ) ( not ( = ?auto_305814 ?auto_305816 ) ) ( not ( = ?auto_305814 ?auto_305817 ) ) ( not ( = ?auto_305814 ?auto_305818 ) ) ( not ( = ?auto_305814 ?auto_305819 ) ) ( not ( = ?auto_305814 ?auto_305820 ) ) ( not ( = ?auto_305814 ?auto_305821 ) ) ( not ( = ?auto_305815 ?auto_305816 ) ) ( not ( = ?auto_305815 ?auto_305817 ) ) ( not ( = ?auto_305815 ?auto_305818 ) ) ( not ( = ?auto_305815 ?auto_305819 ) ) ( not ( = ?auto_305815 ?auto_305820 ) ) ( not ( = ?auto_305815 ?auto_305821 ) ) ( not ( = ?auto_305816 ?auto_305817 ) ) ( not ( = ?auto_305816 ?auto_305818 ) ) ( not ( = ?auto_305816 ?auto_305819 ) ) ( not ( = ?auto_305816 ?auto_305820 ) ) ( not ( = ?auto_305816 ?auto_305821 ) ) ( not ( = ?auto_305817 ?auto_305818 ) ) ( not ( = ?auto_305817 ?auto_305819 ) ) ( not ( = ?auto_305817 ?auto_305820 ) ) ( not ( = ?auto_305817 ?auto_305821 ) ) ( not ( = ?auto_305818 ?auto_305819 ) ) ( not ( = ?auto_305818 ?auto_305820 ) ) ( not ( = ?auto_305818 ?auto_305821 ) ) ( not ( = ?auto_305819 ?auto_305820 ) ) ( not ( = ?auto_305819 ?auto_305821 ) ) ( not ( = ?auto_305820 ?auto_305821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305820 ?auto_305821 )
      ( !STACK ?auto_305820 ?auto_305819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305831 - BLOCK
      ?auto_305832 - BLOCK
      ?auto_305833 - BLOCK
      ?auto_305834 - BLOCK
      ?auto_305835 - BLOCK
      ?auto_305836 - BLOCK
      ?auto_305837 - BLOCK
      ?auto_305838 - BLOCK
      ?auto_305839 - BLOCK
    )
    :vars
    (
      ?auto_305840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_305838 ) ( ON ?auto_305839 ?auto_305840 ) ( CLEAR ?auto_305839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_305831 ) ( ON ?auto_305832 ?auto_305831 ) ( ON ?auto_305833 ?auto_305832 ) ( ON ?auto_305834 ?auto_305833 ) ( ON ?auto_305835 ?auto_305834 ) ( ON ?auto_305836 ?auto_305835 ) ( ON ?auto_305837 ?auto_305836 ) ( ON ?auto_305838 ?auto_305837 ) ( not ( = ?auto_305831 ?auto_305832 ) ) ( not ( = ?auto_305831 ?auto_305833 ) ) ( not ( = ?auto_305831 ?auto_305834 ) ) ( not ( = ?auto_305831 ?auto_305835 ) ) ( not ( = ?auto_305831 ?auto_305836 ) ) ( not ( = ?auto_305831 ?auto_305837 ) ) ( not ( = ?auto_305831 ?auto_305838 ) ) ( not ( = ?auto_305831 ?auto_305839 ) ) ( not ( = ?auto_305831 ?auto_305840 ) ) ( not ( = ?auto_305832 ?auto_305833 ) ) ( not ( = ?auto_305832 ?auto_305834 ) ) ( not ( = ?auto_305832 ?auto_305835 ) ) ( not ( = ?auto_305832 ?auto_305836 ) ) ( not ( = ?auto_305832 ?auto_305837 ) ) ( not ( = ?auto_305832 ?auto_305838 ) ) ( not ( = ?auto_305832 ?auto_305839 ) ) ( not ( = ?auto_305832 ?auto_305840 ) ) ( not ( = ?auto_305833 ?auto_305834 ) ) ( not ( = ?auto_305833 ?auto_305835 ) ) ( not ( = ?auto_305833 ?auto_305836 ) ) ( not ( = ?auto_305833 ?auto_305837 ) ) ( not ( = ?auto_305833 ?auto_305838 ) ) ( not ( = ?auto_305833 ?auto_305839 ) ) ( not ( = ?auto_305833 ?auto_305840 ) ) ( not ( = ?auto_305834 ?auto_305835 ) ) ( not ( = ?auto_305834 ?auto_305836 ) ) ( not ( = ?auto_305834 ?auto_305837 ) ) ( not ( = ?auto_305834 ?auto_305838 ) ) ( not ( = ?auto_305834 ?auto_305839 ) ) ( not ( = ?auto_305834 ?auto_305840 ) ) ( not ( = ?auto_305835 ?auto_305836 ) ) ( not ( = ?auto_305835 ?auto_305837 ) ) ( not ( = ?auto_305835 ?auto_305838 ) ) ( not ( = ?auto_305835 ?auto_305839 ) ) ( not ( = ?auto_305835 ?auto_305840 ) ) ( not ( = ?auto_305836 ?auto_305837 ) ) ( not ( = ?auto_305836 ?auto_305838 ) ) ( not ( = ?auto_305836 ?auto_305839 ) ) ( not ( = ?auto_305836 ?auto_305840 ) ) ( not ( = ?auto_305837 ?auto_305838 ) ) ( not ( = ?auto_305837 ?auto_305839 ) ) ( not ( = ?auto_305837 ?auto_305840 ) ) ( not ( = ?auto_305838 ?auto_305839 ) ) ( not ( = ?auto_305838 ?auto_305840 ) ) ( not ( = ?auto_305839 ?auto_305840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_305839 ?auto_305840 )
      ( !STACK ?auto_305839 ?auto_305838 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305850 - BLOCK
      ?auto_305851 - BLOCK
      ?auto_305852 - BLOCK
      ?auto_305853 - BLOCK
      ?auto_305854 - BLOCK
      ?auto_305855 - BLOCK
      ?auto_305856 - BLOCK
      ?auto_305857 - BLOCK
      ?auto_305858 - BLOCK
    )
    :vars
    (
      ?auto_305859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305858 ?auto_305859 ) ( ON-TABLE ?auto_305850 ) ( ON ?auto_305851 ?auto_305850 ) ( ON ?auto_305852 ?auto_305851 ) ( ON ?auto_305853 ?auto_305852 ) ( ON ?auto_305854 ?auto_305853 ) ( ON ?auto_305855 ?auto_305854 ) ( ON ?auto_305856 ?auto_305855 ) ( not ( = ?auto_305850 ?auto_305851 ) ) ( not ( = ?auto_305850 ?auto_305852 ) ) ( not ( = ?auto_305850 ?auto_305853 ) ) ( not ( = ?auto_305850 ?auto_305854 ) ) ( not ( = ?auto_305850 ?auto_305855 ) ) ( not ( = ?auto_305850 ?auto_305856 ) ) ( not ( = ?auto_305850 ?auto_305857 ) ) ( not ( = ?auto_305850 ?auto_305858 ) ) ( not ( = ?auto_305850 ?auto_305859 ) ) ( not ( = ?auto_305851 ?auto_305852 ) ) ( not ( = ?auto_305851 ?auto_305853 ) ) ( not ( = ?auto_305851 ?auto_305854 ) ) ( not ( = ?auto_305851 ?auto_305855 ) ) ( not ( = ?auto_305851 ?auto_305856 ) ) ( not ( = ?auto_305851 ?auto_305857 ) ) ( not ( = ?auto_305851 ?auto_305858 ) ) ( not ( = ?auto_305851 ?auto_305859 ) ) ( not ( = ?auto_305852 ?auto_305853 ) ) ( not ( = ?auto_305852 ?auto_305854 ) ) ( not ( = ?auto_305852 ?auto_305855 ) ) ( not ( = ?auto_305852 ?auto_305856 ) ) ( not ( = ?auto_305852 ?auto_305857 ) ) ( not ( = ?auto_305852 ?auto_305858 ) ) ( not ( = ?auto_305852 ?auto_305859 ) ) ( not ( = ?auto_305853 ?auto_305854 ) ) ( not ( = ?auto_305853 ?auto_305855 ) ) ( not ( = ?auto_305853 ?auto_305856 ) ) ( not ( = ?auto_305853 ?auto_305857 ) ) ( not ( = ?auto_305853 ?auto_305858 ) ) ( not ( = ?auto_305853 ?auto_305859 ) ) ( not ( = ?auto_305854 ?auto_305855 ) ) ( not ( = ?auto_305854 ?auto_305856 ) ) ( not ( = ?auto_305854 ?auto_305857 ) ) ( not ( = ?auto_305854 ?auto_305858 ) ) ( not ( = ?auto_305854 ?auto_305859 ) ) ( not ( = ?auto_305855 ?auto_305856 ) ) ( not ( = ?auto_305855 ?auto_305857 ) ) ( not ( = ?auto_305855 ?auto_305858 ) ) ( not ( = ?auto_305855 ?auto_305859 ) ) ( not ( = ?auto_305856 ?auto_305857 ) ) ( not ( = ?auto_305856 ?auto_305858 ) ) ( not ( = ?auto_305856 ?auto_305859 ) ) ( not ( = ?auto_305857 ?auto_305858 ) ) ( not ( = ?auto_305857 ?auto_305859 ) ) ( not ( = ?auto_305858 ?auto_305859 ) ) ( CLEAR ?auto_305856 ) ( ON ?auto_305857 ?auto_305858 ) ( CLEAR ?auto_305857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_305850 ?auto_305851 ?auto_305852 ?auto_305853 ?auto_305854 ?auto_305855 ?auto_305856 ?auto_305857 )
      ( MAKE-9PILE ?auto_305850 ?auto_305851 ?auto_305852 ?auto_305853 ?auto_305854 ?auto_305855 ?auto_305856 ?auto_305857 ?auto_305858 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305869 - BLOCK
      ?auto_305870 - BLOCK
      ?auto_305871 - BLOCK
      ?auto_305872 - BLOCK
      ?auto_305873 - BLOCK
      ?auto_305874 - BLOCK
      ?auto_305875 - BLOCK
      ?auto_305876 - BLOCK
      ?auto_305877 - BLOCK
    )
    :vars
    (
      ?auto_305878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305877 ?auto_305878 ) ( ON-TABLE ?auto_305869 ) ( ON ?auto_305870 ?auto_305869 ) ( ON ?auto_305871 ?auto_305870 ) ( ON ?auto_305872 ?auto_305871 ) ( ON ?auto_305873 ?auto_305872 ) ( ON ?auto_305874 ?auto_305873 ) ( ON ?auto_305875 ?auto_305874 ) ( not ( = ?auto_305869 ?auto_305870 ) ) ( not ( = ?auto_305869 ?auto_305871 ) ) ( not ( = ?auto_305869 ?auto_305872 ) ) ( not ( = ?auto_305869 ?auto_305873 ) ) ( not ( = ?auto_305869 ?auto_305874 ) ) ( not ( = ?auto_305869 ?auto_305875 ) ) ( not ( = ?auto_305869 ?auto_305876 ) ) ( not ( = ?auto_305869 ?auto_305877 ) ) ( not ( = ?auto_305869 ?auto_305878 ) ) ( not ( = ?auto_305870 ?auto_305871 ) ) ( not ( = ?auto_305870 ?auto_305872 ) ) ( not ( = ?auto_305870 ?auto_305873 ) ) ( not ( = ?auto_305870 ?auto_305874 ) ) ( not ( = ?auto_305870 ?auto_305875 ) ) ( not ( = ?auto_305870 ?auto_305876 ) ) ( not ( = ?auto_305870 ?auto_305877 ) ) ( not ( = ?auto_305870 ?auto_305878 ) ) ( not ( = ?auto_305871 ?auto_305872 ) ) ( not ( = ?auto_305871 ?auto_305873 ) ) ( not ( = ?auto_305871 ?auto_305874 ) ) ( not ( = ?auto_305871 ?auto_305875 ) ) ( not ( = ?auto_305871 ?auto_305876 ) ) ( not ( = ?auto_305871 ?auto_305877 ) ) ( not ( = ?auto_305871 ?auto_305878 ) ) ( not ( = ?auto_305872 ?auto_305873 ) ) ( not ( = ?auto_305872 ?auto_305874 ) ) ( not ( = ?auto_305872 ?auto_305875 ) ) ( not ( = ?auto_305872 ?auto_305876 ) ) ( not ( = ?auto_305872 ?auto_305877 ) ) ( not ( = ?auto_305872 ?auto_305878 ) ) ( not ( = ?auto_305873 ?auto_305874 ) ) ( not ( = ?auto_305873 ?auto_305875 ) ) ( not ( = ?auto_305873 ?auto_305876 ) ) ( not ( = ?auto_305873 ?auto_305877 ) ) ( not ( = ?auto_305873 ?auto_305878 ) ) ( not ( = ?auto_305874 ?auto_305875 ) ) ( not ( = ?auto_305874 ?auto_305876 ) ) ( not ( = ?auto_305874 ?auto_305877 ) ) ( not ( = ?auto_305874 ?auto_305878 ) ) ( not ( = ?auto_305875 ?auto_305876 ) ) ( not ( = ?auto_305875 ?auto_305877 ) ) ( not ( = ?auto_305875 ?auto_305878 ) ) ( not ( = ?auto_305876 ?auto_305877 ) ) ( not ( = ?auto_305876 ?auto_305878 ) ) ( not ( = ?auto_305877 ?auto_305878 ) ) ( CLEAR ?auto_305875 ) ( ON ?auto_305876 ?auto_305877 ) ( CLEAR ?auto_305876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_305869 ?auto_305870 ?auto_305871 ?auto_305872 ?auto_305873 ?auto_305874 ?auto_305875 ?auto_305876 )
      ( MAKE-9PILE ?auto_305869 ?auto_305870 ?auto_305871 ?auto_305872 ?auto_305873 ?auto_305874 ?auto_305875 ?auto_305876 ?auto_305877 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305888 - BLOCK
      ?auto_305889 - BLOCK
      ?auto_305890 - BLOCK
      ?auto_305891 - BLOCK
      ?auto_305892 - BLOCK
      ?auto_305893 - BLOCK
      ?auto_305894 - BLOCK
      ?auto_305895 - BLOCK
      ?auto_305896 - BLOCK
    )
    :vars
    (
      ?auto_305897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305896 ?auto_305897 ) ( ON-TABLE ?auto_305888 ) ( ON ?auto_305889 ?auto_305888 ) ( ON ?auto_305890 ?auto_305889 ) ( ON ?auto_305891 ?auto_305890 ) ( ON ?auto_305892 ?auto_305891 ) ( ON ?auto_305893 ?auto_305892 ) ( not ( = ?auto_305888 ?auto_305889 ) ) ( not ( = ?auto_305888 ?auto_305890 ) ) ( not ( = ?auto_305888 ?auto_305891 ) ) ( not ( = ?auto_305888 ?auto_305892 ) ) ( not ( = ?auto_305888 ?auto_305893 ) ) ( not ( = ?auto_305888 ?auto_305894 ) ) ( not ( = ?auto_305888 ?auto_305895 ) ) ( not ( = ?auto_305888 ?auto_305896 ) ) ( not ( = ?auto_305888 ?auto_305897 ) ) ( not ( = ?auto_305889 ?auto_305890 ) ) ( not ( = ?auto_305889 ?auto_305891 ) ) ( not ( = ?auto_305889 ?auto_305892 ) ) ( not ( = ?auto_305889 ?auto_305893 ) ) ( not ( = ?auto_305889 ?auto_305894 ) ) ( not ( = ?auto_305889 ?auto_305895 ) ) ( not ( = ?auto_305889 ?auto_305896 ) ) ( not ( = ?auto_305889 ?auto_305897 ) ) ( not ( = ?auto_305890 ?auto_305891 ) ) ( not ( = ?auto_305890 ?auto_305892 ) ) ( not ( = ?auto_305890 ?auto_305893 ) ) ( not ( = ?auto_305890 ?auto_305894 ) ) ( not ( = ?auto_305890 ?auto_305895 ) ) ( not ( = ?auto_305890 ?auto_305896 ) ) ( not ( = ?auto_305890 ?auto_305897 ) ) ( not ( = ?auto_305891 ?auto_305892 ) ) ( not ( = ?auto_305891 ?auto_305893 ) ) ( not ( = ?auto_305891 ?auto_305894 ) ) ( not ( = ?auto_305891 ?auto_305895 ) ) ( not ( = ?auto_305891 ?auto_305896 ) ) ( not ( = ?auto_305891 ?auto_305897 ) ) ( not ( = ?auto_305892 ?auto_305893 ) ) ( not ( = ?auto_305892 ?auto_305894 ) ) ( not ( = ?auto_305892 ?auto_305895 ) ) ( not ( = ?auto_305892 ?auto_305896 ) ) ( not ( = ?auto_305892 ?auto_305897 ) ) ( not ( = ?auto_305893 ?auto_305894 ) ) ( not ( = ?auto_305893 ?auto_305895 ) ) ( not ( = ?auto_305893 ?auto_305896 ) ) ( not ( = ?auto_305893 ?auto_305897 ) ) ( not ( = ?auto_305894 ?auto_305895 ) ) ( not ( = ?auto_305894 ?auto_305896 ) ) ( not ( = ?auto_305894 ?auto_305897 ) ) ( not ( = ?auto_305895 ?auto_305896 ) ) ( not ( = ?auto_305895 ?auto_305897 ) ) ( not ( = ?auto_305896 ?auto_305897 ) ) ( ON ?auto_305895 ?auto_305896 ) ( CLEAR ?auto_305893 ) ( ON ?auto_305894 ?auto_305895 ) ( CLEAR ?auto_305894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_305888 ?auto_305889 ?auto_305890 ?auto_305891 ?auto_305892 ?auto_305893 ?auto_305894 )
      ( MAKE-9PILE ?auto_305888 ?auto_305889 ?auto_305890 ?auto_305891 ?auto_305892 ?auto_305893 ?auto_305894 ?auto_305895 ?auto_305896 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305907 - BLOCK
      ?auto_305908 - BLOCK
      ?auto_305909 - BLOCK
      ?auto_305910 - BLOCK
      ?auto_305911 - BLOCK
      ?auto_305912 - BLOCK
      ?auto_305913 - BLOCK
      ?auto_305914 - BLOCK
      ?auto_305915 - BLOCK
    )
    :vars
    (
      ?auto_305916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305915 ?auto_305916 ) ( ON-TABLE ?auto_305907 ) ( ON ?auto_305908 ?auto_305907 ) ( ON ?auto_305909 ?auto_305908 ) ( ON ?auto_305910 ?auto_305909 ) ( ON ?auto_305911 ?auto_305910 ) ( ON ?auto_305912 ?auto_305911 ) ( not ( = ?auto_305907 ?auto_305908 ) ) ( not ( = ?auto_305907 ?auto_305909 ) ) ( not ( = ?auto_305907 ?auto_305910 ) ) ( not ( = ?auto_305907 ?auto_305911 ) ) ( not ( = ?auto_305907 ?auto_305912 ) ) ( not ( = ?auto_305907 ?auto_305913 ) ) ( not ( = ?auto_305907 ?auto_305914 ) ) ( not ( = ?auto_305907 ?auto_305915 ) ) ( not ( = ?auto_305907 ?auto_305916 ) ) ( not ( = ?auto_305908 ?auto_305909 ) ) ( not ( = ?auto_305908 ?auto_305910 ) ) ( not ( = ?auto_305908 ?auto_305911 ) ) ( not ( = ?auto_305908 ?auto_305912 ) ) ( not ( = ?auto_305908 ?auto_305913 ) ) ( not ( = ?auto_305908 ?auto_305914 ) ) ( not ( = ?auto_305908 ?auto_305915 ) ) ( not ( = ?auto_305908 ?auto_305916 ) ) ( not ( = ?auto_305909 ?auto_305910 ) ) ( not ( = ?auto_305909 ?auto_305911 ) ) ( not ( = ?auto_305909 ?auto_305912 ) ) ( not ( = ?auto_305909 ?auto_305913 ) ) ( not ( = ?auto_305909 ?auto_305914 ) ) ( not ( = ?auto_305909 ?auto_305915 ) ) ( not ( = ?auto_305909 ?auto_305916 ) ) ( not ( = ?auto_305910 ?auto_305911 ) ) ( not ( = ?auto_305910 ?auto_305912 ) ) ( not ( = ?auto_305910 ?auto_305913 ) ) ( not ( = ?auto_305910 ?auto_305914 ) ) ( not ( = ?auto_305910 ?auto_305915 ) ) ( not ( = ?auto_305910 ?auto_305916 ) ) ( not ( = ?auto_305911 ?auto_305912 ) ) ( not ( = ?auto_305911 ?auto_305913 ) ) ( not ( = ?auto_305911 ?auto_305914 ) ) ( not ( = ?auto_305911 ?auto_305915 ) ) ( not ( = ?auto_305911 ?auto_305916 ) ) ( not ( = ?auto_305912 ?auto_305913 ) ) ( not ( = ?auto_305912 ?auto_305914 ) ) ( not ( = ?auto_305912 ?auto_305915 ) ) ( not ( = ?auto_305912 ?auto_305916 ) ) ( not ( = ?auto_305913 ?auto_305914 ) ) ( not ( = ?auto_305913 ?auto_305915 ) ) ( not ( = ?auto_305913 ?auto_305916 ) ) ( not ( = ?auto_305914 ?auto_305915 ) ) ( not ( = ?auto_305914 ?auto_305916 ) ) ( not ( = ?auto_305915 ?auto_305916 ) ) ( ON ?auto_305914 ?auto_305915 ) ( CLEAR ?auto_305912 ) ( ON ?auto_305913 ?auto_305914 ) ( CLEAR ?auto_305913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_305907 ?auto_305908 ?auto_305909 ?auto_305910 ?auto_305911 ?auto_305912 ?auto_305913 )
      ( MAKE-9PILE ?auto_305907 ?auto_305908 ?auto_305909 ?auto_305910 ?auto_305911 ?auto_305912 ?auto_305913 ?auto_305914 ?auto_305915 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305926 - BLOCK
      ?auto_305927 - BLOCK
      ?auto_305928 - BLOCK
      ?auto_305929 - BLOCK
      ?auto_305930 - BLOCK
      ?auto_305931 - BLOCK
      ?auto_305932 - BLOCK
      ?auto_305933 - BLOCK
      ?auto_305934 - BLOCK
    )
    :vars
    (
      ?auto_305935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305934 ?auto_305935 ) ( ON-TABLE ?auto_305926 ) ( ON ?auto_305927 ?auto_305926 ) ( ON ?auto_305928 ?auto_305927 ) ( ON ?auto_305929 ?auto_305928 ) ( ON ?auto_305930 ?auto_305929 ) ( not ( = ?auto_305926 ?auto_305927 ) ) ( not ( = ?auto_305926 ?auto_305928 ) ) ( not ( = ?auto_305926 ?auto_305929 ) ) ( not ( = ?auto_305926 ?auto_305930 ) ) ( not ( = ?auto_305926 ?auto_305931 ) ) ( not ( = ?auto_305926 ?auto_305932 ) ) ( not ( = ?auto_305926 ?auto_305933 ) ) ( not ( = ?auto_305926 ?auto_305934 ) ) ( not ( = ?auto_305926 ?auto_305935 ) ) ( not ( = ?auto_305927 ?auto_305928 ) ) ( not ( = ?auto_305927 ?auto_305929 ) ) ( not ( = ?auto_305927 ?auto_305930 ) ) ( not ( = ?auto_305927 ?auto_305931 ) ) ( not ( = ?auto_305927 ?auto_305932 ) ) ( not ( = ?auto_305927 ?auto_305933 ) ) ( not ( = ?auto_305927 ?auto_305934 ) ) ( not ( = ?auto_305927 ?auto_305935 ) ) ( not ( = ?auto_305928 ?auto_305929 ) ) ( not ( = ?auto_305928 ?auto_305930 ) ) ( not ( = ?auto_305928 ?auto_305931 ) ) ( not ( = ?auto_305928 ?auto_305932 ) ) ( not ( = ?auto_305928 ?auto_305933 ) ) ( not ( = ?auto_305928 ?auto_305934 ) ) ( not ( = ?auto_305928 ?auto_305935 ) ) ( not ( = ?auto_305929 ?auto_305930 ) ) ( not ( = ?auto_305929 ?auto_305931 ) ) ( not ( = ?auto_305929 ?auto_305932 ) ) ( not ( = ?auto_305929 ?auto_305933 ) ) ( not ( = ?auto_305929 ?auto_305934 ) ) ( not ( = ?auto_305929 ?auto_305935 ) ) ( not ( = ?auto_305930 ?auto_305931 ) ) ( not ( = ?auto_305930 ?auto_305932 ) ) ( not ( = ?auto_305930 ?auto_305933 ) ) ( not ( = ?auto_305930 ?auto_305934 ) ) ( not ( = ?auto_305930 ?auto_305935 ) ) ( not ( = ?auto_305931 ?auto_305932 ) ) ( not ( = ?auto_305931 ?auto_305933 ) ) ( not ( = ?auto_305931 ?auto_305934 ) ) ( not ( = ?auto_305931 ?auto_305935 ) ) ( not ( = ?auto_305932 ?auto_305933 ) ) ( not ( = ?auto_305932 ?auto_305934 ) ) ( not ( = ?auto_305932 ?auto_305935 ) ) ( not ( = ?auto_305933 ?auto_305934 ) ) ( not ( = ?auto_305933 ?auto_305935 ) ) ( not ( = ?auto_305934 ?auto_305935 ) ) ( ON ?auto_305933 ?auto_305934 ) ( ON ?auto_305932 ?auto_305933 ) ( CLEAR ?auto_305930 ) ( ON ?auto_305931 ?auto_305932 ) ( CLEAR ?auto_305931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_305926 ?auto_305927 ?auto_305928 ?auto_305929 ?auto_305930 ?auto_305931 )
      ( MAKE-9PILE ?auto_305926 ?auto_305927 ?auto_305928 ?auto_305929 ?auto_305930 ?auto_305931 ?auto_305932 ?auto_305933 ?auto_305934 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305945 - BLOCK
      ?auto_305946 - BLOCK
      ?auto_305947 - BLOCK
      ?auto_305948 - BLOCK
      ?auto_305949 - BLOCK
      ?auto_305950 - BLOCK
      ?auto_305951 - BLOCK
      ?auto_305952 - BLOCK
      ?auto_305953 - BLOCK
    )
    :vars
    (
      ?auto_305954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305953 ?auto_305954 ) ( ON-TABLE ?auto_305945 ) ( ON ?auto_305946 ?auto_305945 ) ( ON ?auto_305947 ?auto_305946 ) ( ON ?auto_305948 ?auto_305947 ) ( ON ?auto_305949 ?auto_305948 ) ( not ( = ?auto_305945 ?auto_305946 ) ) ( not ( = ?auto_305945 ?auto_305947 ) ) ( not ( = ?auto_305945 ?auto_305948 ) ) ( not ( = ?auto_305945 ?auto_305949 ) ) ( not ( = ?auto_305945 ?auto_305950 ) ) ( not ( = ?auto_305945 ?auto_305951 ) ) ( not ( = ?auto_305945 ?auto_305952 ) ) ( not ( = ?auto_305945 ?auto_305953 ) ) ( not ( = ?auto_305945 ?auto_305954 ) ) ( not ( = ?auto_305946 ?auto_305947 ) ) ( not ( = ?auto_305946 ?auto_305948 ) ) ( not ( = ?auto_305946 ?auto_305949 ) ) ( not ( = ?auto_305946 ?auto_305950 ) ) ( not ( = ?auto_305946 ?auto_305951 ) ) ( not ( = ?auto_305946 ?auto_305952 ) ) ( not ( = ?auto_305946 ?auto_305953 ) ) ( not ( = ?auto_305946 ?auto_305954 ) ) ( not ( = ?auto_305947 ?auto_305948 ) ) ( not ( = ?auto_305947 ?auto_305949 ) ) ( not ( = ?auto_305947 ?auto_305950 ) ) ( not ( = ?auto_305947 ?auto_305951 ) ) ( not ( = ?auto_305947 ?auto_305952 ) ) ( not ( = ?auto_305947 ?auto_305953 ) ) ( not ( = ?auto_305947 ?auto_305954 ) ) ( not ( = ?auto_305948 ?auto_305949 ) ) ( not ( = ?auto_305948 ?auto_305950 ) ) ( not ( = ?auto_305948 ?auto_305951 ) ) ( not ( = ?auto_305948 ?auto_305952 ) ) ( not ( = ?auto_305948 ?auto_305953 ) ) ( not ( = ?auto_305948 ?auto_305954 ) ) ( not ( = ?auto_305949 ?auto_305950 ) ) ( not ( = ?auto_305949 ?auto_305951 ) ) ( not ( = ?auto_305949 ?auto_305952 ) ) ( not ( = ?auto_305949 ?auto_305953 ) ) ( not ( = ?auto_305949 ?auto_305954 ) ) ( not ( = ?auto_305950 ?auto_305951 ) ) ( not ( = ?auto_305950 ?auto_305952 ) ) ( not ( = ?auto_305950 ?auto_305953 ) ) ( not ( = ?auto_305950 ?auto_305954 ) ) ( not ( = ?auto_305951 ?auto_305952 ) ) ( not ( = ?auto_305951 ?auto_305953 ) ) ( not ( = ?auto_305951 ?auto_305954 ) ) ( not ( = ?auto_305952 ?auto_305953 ) ) ( not ( = ?auto_305952 ?auto_305954 ) ) ( not ( = ?auto_305953 ?auto_305954 ) ) ( ON ?auto_305952 ?auto_305953 ) ( ON ?auto_305951 ?auto_305952 ) ( CLEAR ?auto_305949 ) ( ON ?auto_305950 ?auto_305951 ) ( CLEAR ?auto_305950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_305945 ?auto_305946 ?auto_305947 ?auto_305948 ?auto_305949 ?auto_305950 )
      ( MAKE-9PILE ?auto_305945 ?auto_305946 ?auto_305947 ?auto_305948 ?auto_305949 ?auto_305950 ?auto_305951 ?auto_305952 ?auto_305953 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305964 - BLOCK
      ?auto_305965 - BLOCK
      ?auto_305966 - BLOCK
      ?auto_305967 - BLOCK
      ?auto_305968 - BLOCK
      ?auto_305969 - BLOCK
      ?auto_305970 - BLOCK
      ?auto_305971 - BLOCK
      ?auto_305972 - BLOCK
    )
    :vars
    (
      ?auto_305973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305972 ?auto_305973 ) ( ON-TABLE ?auto_305964 ) ( ON ?auto_305965 ?auto_305964 ) ( ON ?auto_305966 ?auto_305965 ) ( ON ?auto_305967 ?auto_305966 ) ( not ( = ?auto_305964 ?auto_305965 ) ) ( not ( = ?auto_305964 ?auto_305966 ) ) ( not ( = ?auto_305964 ?auto_305967 ) ) ( not ( = ?auto_305964 ?auto_305968 ) ) ( not ( = ?auto_305964 ?auto_305969 ) ) ( not ( = ?auto_305964 ?auto_305970 ) ) ( not ( = ?auto_305964 ?auto_305971 ) ) ( not ( = ?auto_305964 ?auto_305972 ) ) ( not ( = ?auto_305964 ?auto_305973 ) ) ( not ( = ?auto_305965 ?auto_305966 ) ) ( not ( = ?auto_305965 ?auto_305967 ) ) ( not ( = ?auto_305965 ?auto_305968 ) ) ( not ( = ?auto_305965 ?auto_305969 ) ) ( not ( = ?auto_305965 ?auto_305970 ) ) ( not ( = ?auto_305965 ?auto_305971 ) ) ( not ( = ?auto_305965 ?auto_305972 ) ) ( not ( = ?auto_305965 ?auto_305973 ) ) ( not ( = ?auto_305966 ?auto_305967 ) ) ( not ( = ?auto_305966 ?auto_305968 ) ) ( not ( = ?auto_305966 ?auto_305969 ) ) ( not ( = ?auto_305966 ?auto_305970 ) ) ( not ( = ?auto_305966 ?auto_305971 ) ) ( not ( = ?auto_305966 ?auto_305972 ) ) ( not ( = ?auto_305966 ?auto_305973 ) ) ( not ( = ?auto_305967 ?auto_305968 ) ) ( not ( = ?auto_305967 ?auto_305969 ) ) ( not ( = ?auto_305967 ?auto_305970 ) ) ( not ( = ?auto_305967 ?auto_305971 ) ) ( not ( = ?auto_305967 ?auto_305972 ) ) ( not ( = ?auto_305967 ?auto_305973 ) ) ( not ( = ?auto_305968 ?auto_305969 ) ) ( not ( = ?auto_305968 ?auto_305970 ) ) ( not ( = ?auto_305968 ?auto_305971 ) ) ( not ( = ?auto_305968 ?auto_305972 ) ) ( not ( = ?auto_305968 ?auto_305973 ) ) ( not ( = ?auto_305969 ?auto_305970 ) ) ( not ( = ?auto_305969 ?auto_305971 ) ) ( not ( = ?auto_305969 ?auto_305972 ) ) ( not ( = ?auto_305969 ?auto_305973 ) ) ( not ( = ?auto_305970 ?auto_305971 ) ) ( not ( = ?auto_305970 ?auto_305972 ) ) ( not ( = ?auto_305970 ?auto_305973 ) ) ( not ( = ?auto_305971 ?auto_305972 ) ) ( not ( = ?auto_305971 ?auto_305973 ) ) ( not ( = ?auto_305972 ?auto_305973 ) ) ( ON ?auto_305971 ?auto_305972 ) ( ON ?auto_305970 ?auto_305971 ) ( ON ?auto_305969 ?auto_305970 ) ( CLEAR ?auto_305967 ) ( ON ?auto_305968 ?auto_305969 ) ( CLEAR ?auto_305968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305964 ?auto_305965 ?auto_305966 ?auto_305967 ?auto_305968 )
      ( MAKE-9PILE ?auto_305964 ?auto_305965 ?auto_305966 ?auto_305967 ?auto_305968 ?auto_305969 ?auto_305970 ?auto_305971 ?auto_305972 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_305983 - BLOCK
      ?auto_305984 - BLOCK
      ?auto_305985 - BLOCK
      ?auto_305986 - BLOCK
      ?auto_305987 - BLOCK
      ?auto_305988 - BLOCK
      ?auto_305989 - BLOCK
      ?auto_305990 - BLOCK
      ?auto_305991 - BLOCK
    )
    :vars
    (
      ?auto_305992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_305991 ?auto_305992 ) ( ON-TABLE ?auto_305983 ) ( ON ?auto_305984 ?auto_305983 ) ( ON ?auto_305985 ?auto_305984 ) ( ON ?auto_305986 ?auto_305985 ) ( not ( = ?auto_305983 ?auto_305984 ) ) ( not ( = ?auto_305983 ?auto_305985 ) ) ( not ( = ?auto_305983 ?auto_305986 ) ) ( not ( = ?auto_305983 ?auto_305987 ) ) ( not ( = ?auto_305983 ?auto_305988 ) ) ( not ( = ?auto_305983 ?auto_305989 ) ) ( not ( = ?auto_305983 ?auto_305990 ) ) ( not ( = ?auto_305983 ?auto_305991 ) ) ( not ( = ?auto_305983 ?auto_305992 ) ) ( not ( = ?auto_305984 ?auto_305985 ) ) ( not ( = ?auto_305984 ?auto_305986 ) ) ( not ( = ?auto_305984 ?auto_305987 ) ) ( not ( = ?auto_305984 ?auto_305988 ) ) ( not ( = ?auto_305984 ?auto_305989 ) ) ( not ( = ?auto_305984 ?auto_305990 ) ) ( not ( = ?auto_305984 ?auto_305991 ) ) ( not ( = ?auto_305984 ?auto_305992 ) ) ( not ( = ?auto_305985 ?auto_305986 ) ) ( not ( = ?auto_305985 ?auto_305987 ) ) ( not ( = ?auto_305985 ?auto_305988 ) ) ( not ( = ?auto_305985 ?auto_305989 ) ) ( not ( = ?auto_305985 ?auto_305990 ) ) ( not ( = ?auto_305985 ?auto_305991 ) ) ( not ( = ?auto_305985 ?auto_305992 ) ) ( not ( = ?auto_305986 ?auto_305987 ) ) ( not ( = ?auto_305986 ?auto_305988 ) ) ( not ( = ?auto_305986 ?auto_305989 ) ) ( not ( = ?auto_305986 ?auto_305990 ) ) ( not ( = ?auto_305986 ?auto_305991 ) ) ( not ( = ?auto_305986 ?auto_305992 ) ) ( not ( = ?auto_305987 ?auto_305988 ) ) ( not ( = ?auto_305987 ?auto_305989 ) ) ( not ( = ?auto_305987 ?auto_305990 ) ) ( not ( = ?auto_305987 ?auto_305991 ) ) ( not ( = ?auto_305987 ?auto_305992 ) ) ( not ( = ?auto_305988 ?auto_305989 ) ) ( not ( = ?auto_305988 ?auto_305990 ) ) ( not ( = ?auto_305988 ?auto_305991 ) ) ( not ( = ?auto_305988 ?auto_305992 ) ) ( not ( = ?auto_305989 ?auto_305990 ) ) ( not ( = ?auto_305989 ?auto_305991 ) ) ( not ( = ?auto_305989 ?auto_305992 ) ) ( not ( = ?auto_305990 ?auto_305991 ) ) ( not ( = ?auto_305990 ?auto_305992 ) ) ( not ( = ?auto_305991 ?auto_305992 ) ) ( ON ?auto_305990 ?auto_305991 ) ( ON ?auto_305989 ?auto_305990 ) ( ON ?auto_305988 ?auto_305989 ) ( CLEAR ?auto_305986 ) ( ON ?auto_305987 ?auto_305988 ) ( CLEAR ?auto_305987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_305983 ?auto_305984 ?auto_305985 ?auto_305986 ?auto_305987 )
      ( MAKE-9PILE ?auto_305983 ?auto_305984 ?auto_305985 ?auto_305986 ?auto_305987 ?auto_305988 ?auto_305989 ?auto_305990 ?auto_305991 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306002 - BLOCK
      ?auto_306003 - BLOCK
      ?auto_306004 - BLOCK
      ?auto_306005 - BLOCK
      ?auto_306006 - BLOCK
      ?auto_306007 - BLOCK
      ?auto_306008 - BLOCK
      ?auto_306009 - BLOCK
      ?auto_306010 - BLOCK
    )
    :vars
    (
      ?auto_306011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306010 ?auto_306011 ) ( ON-TABLE ?auto_306002 ) ( ON ?auto_306003 ?auto_306002 ) ( ON ?auto_306004 ?auto_306003 ) ( not ( = ?auto_306002 ?auto_306003 ) ) ( not ( = ?auto_306002 ?auto_306004 ) ) ( not ( = ?auto_306002 ?auto_306005 ) ) ( not ( = ?auto_306002 ?auto_306006 ) ) ( not ( = ?auto_306002 ?auto_306007 ) ) ( not ( = ?auto_306002 ?auto_306008 ) ) ( not ( = ?auto_306002 ?auto_306009 ) ) ( not ( = ?auto_306002 ?auto_306010 ) ) ( not ( = ?auto_306002 ?auto_306011 ) ) ( not ( = ?auto_306003 ?auto_306004 ) ) ( not ( = ?auto_306003 ?auto_306005 ) ) ( not ( = ?auto_306003 ?auto_306006 ) ) ( not ( = ?auto_306003 ?auto_306007 ) ) ( not ( = ?auto_306003 ?auto_306008 ) ) ( not ( = ?auto_306003 ?auto_306009 ) ) ( not ( = ?auto_306003 ?auto_306010 ) ) ( not ( = ?auto_306003 ?auto_306011 ) ) ( not ( = ?auto_306004 ?auto_306005 ) ) ( not ( = ?auto_306004 ?auto_306006 ) ) ( not ( = ?auto_306004 ?auto_306007 ) ) ( not ( = ?auto_306004 ?auto_306008 ) ) ( not ( = ?auto_306004 ?auto_306009 ) ) ( not ( = ?auto_306004 ?auto_306010 ) ) ( not ( = ?auto_306004 ?auto_306011 ) ) ( not ( = ?auto_306005 ?auto_306006 ) ) ( not ( = ?auto_306005 ?auto_306007 ) ) ( not ( = ?auto_306005 ?auto_306008 ) ) ( not ( = ?auto_306005 ?auto_306009 ) ) ( not ( = ?auto_306005 ?auto_306010 ) ) ( not ( = ?auto_306005 ?auto_306011 ) ) ( not ( = ?auto_306006 ?auto_306007 ) ) ( not ( = ?auto_306006 ?auto_306008 ) ) ( not ( = ?auto_306006 ?auto_306009 ) ) ( not ( = ?auto_306006 ?auto_306010 ) ) ( not ( = ?auto_306006 ?auto_306011 ) ) ( not ( = ?auto_306007 ?auto_306008 ) ) ( not ( = ?auto_306007 ?auto_306009 ) ) ( not ( = ?auto_306007 ?auto_306010 ) ) ( not ( = ?auto_306007 ?auto_306011 ) ) ( not ( = ?auto_306008 ?auto_306009 ) ) ( not ( = ?auto_306008 ?auto_306010 ) ) ( not ( = ?auto_306008 ?auto_306011 ) ) ( not ( = ?auto_306009 ?auto_306010 ) ) ( not ( = ?auto_306009 ?auto_306011 ) ) ( not ( = ?auto_306010 ?auto_306011 ) ) ( ON ?auto_306009 ?auto_306010 ) ( ON ?auto_306008 ?auto_306009 ) ( ON ?auto_306007 ?auto_306008 ) ( ON ?auto_306006 ?auto_306007 ) ( CLEAR ?auto_306004 ) ( ON ?auto_306005 ?auto_306006 ) ( CLEAR ?auto_306005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_306002 ?auto_306003 ?auto_306004 ?auto_306005 )
      ( MAKE-9PILE ?auto_306002 ?auto_306003 ?auto_306004 ?auto_306005 ?auto_306006 ?auto_306007 ?auto_306008 ?auto_306009 ?auto_306010 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306021 - BLOCK
      ?auto_306022 - BLOCK
      ?auto_306023 - BLOCK
      ?auto_306024 - BLOCK
      ?auto_306025 - BLOCK
      ?auto_306026 - BLOCK
      ?auto_306027 - BLOCK
      ?auto_306028 - BLOCK
      ?auto_306029 - BLOCK
    )
    :vars
    (
      ?auto_306030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306029 ?auto_306030 ) ( ON-TABLE ?auto_306021 ) ( ON ?auto_306022 ?auto_306021 ) ( ON ?auto_306023 ?auto_306022 ) ( not ( = ?auto_306021 ?auto_306022 ) ) ( not ( = ?auto_306021 ?auto_306023 ) ) ( not ( = ?auto_306021 ?auto_306024 ) ) ( not ( = ?auto_306021 ?auto_306025 ) ) ( not ( = ?auto_306021 ?auto_306026 ) ) ( not ( = ?auto_306021 ?auto_306027 ) ) ( not ( = ?auto_306021 ?auto_306028 ) ) ( not ( = ?auto_306021 ?auto_306029 ) ) ( not ( = ?auto_306021 ?auto_306030 ) ) ( not ( = ?auto_306022 ?auto_306023 ) ) ( not ( = ?auto_306022 ?auto_306024 ) ) ( not ( = ?auto_306022 ?auto_306025 ) ) ( not ( = ?auto_306022 ?auto_306026 ) ) ( not ( = ?auto_306022 ?auto_306027 ) ) ( not ( = ?auto_306022 ?auto_306028 ) ) ( not ( = ?auto_306022 ?auto_306029 ) ) ( not ( = ?auto_306022 ?auto_306030 ) ) ( not ( = ?auto_306023 ?auto_306024 ) ) ( not ( = ?auto_306023 ?auto_306025 ) ) ( not ( = ?auto_306023 ?auto_306026 ) ) ( not ( = ?auto_306023 ?auto_306027 ) ) ( not ( = ?auto_306023 ?auto_306028 ) ) ( not ( = ?auto_306023 ?auto_306029 ) ) ( not ( = ?auto_306023 ?auto_306030 ) ) ( not ( = ?auto_306024 ?auto_306025 ) ) ( not ( = ?auto_306024 ?auto_306026 ) ) ( not ( = ?auto_306024 ?auto_306027 ) ) ( not ( = ?auto_306024 ?auto_306028 ) ) ( not ( = ?auto_306024 ?auto_306029 ) ) ( not ( = ?auto_306024 ?auto_306030 ) ) ( not ( = ?auto_306025 ?auto_306026 ) ) ( not ( = ?auto_306025 ?auto_306027 ) ) ( not ( = ?auto_306025 ?auto_306028 ) ) ( not ( = ?auto_306025 ?auto_306029 ) ) ( not ( = ?auto_306025 ?auto_306030 ) ) ( not ( = ?auto_306026 ?auto_306027 ) ) ( not ( = ?auto_306026 ?auto_306028 ) ) ( not ( = ?auto_306026 ?auto_306029 ) ) ( not ( = ?auto_306026 ?auto_306030 ) ) ( not ( = ?auto_306027 ?auto_306028 ) ) ( not ( = ?auto_306027 ?auto_306029 ) ) ( not ( = ?auto_306027 ?auto_306030 ) ) ( not ( = ?auto_306028 ?auto_306029 ) ) ( not ( = ?auto_306028 ?auto_306030 ) ) ( not ( = ?auto_306029 ?auto_306030 ) ) ( ON ?auto_306028 ?auto_306029 ) ( ON ?auto_306027 ?auto_306028 ) ( ON ?auto_306026 ?auto_306027 ) ( ON ?auto_306025 ?auto_306026 ) ( CLEAR ?auto_306023 ) ( ON ?auto_306024 ?auto_306025 ) ( CLEAR ?auto_306024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_306021 ?auto_306022 ?auto_306023 ?auto_306024 )
      ( MAKE-9PILE ?auto_306021 ?auto_306022 ?auto_306023 ?auto_306024 ?auto_306025 ?auto_306026 ?auto_306027 ?auto_306028 ?auto_306029 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306040 - BLOCK
      ?auto_306041 - BLOCK
      ?auto_306042 - BLOCK
      ?auto_306043 - BLOCK
      ?auto_306044 - BLOCK
      ?auto_306045 - BLOCK
      ?auto_306046 - BLOCK
      ?auto_306047 - BLOCK
      ?auto_306048 - BLOCK
    )
    :vars
    (
      ?auto_306049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306048 ?auto_306049 ) ( ON-TABLE ?auto_306040 ) ( ON ?auto_306041 ?auto_306040 ) ( not ( = ?auto_306040 ?auto_306041 ) ) ( not ( = ?auto_306040 ?auto_306042 ) ) ( not ( = ?auto_306040 ?auto_306043 ) ) ( not ( = ?auto_306040 ?auto_306044 ) ) ( not ( = ?auto_306040 ?auto_306045 ) ) ( not ( = ?auto_306040 ?auto_306046 ) ) ( not ( = ?auto_306040 ?auto_306047 ) ) ( not ( = ?auto_306040 ?auto_306048 ) ) ( not ( = ?auto_306040 ?auto_306049 ) ) ( not ( = ?auto_306041 ?auto_306042 ) ) ( not ( = ?auto_306041 ?auto_306043 ) ) ( not ( = ?auto_306041 ?auto_306044 ) ) ( not ( = ?auto_306041 ?auto_306045 ) ) ( not ( = ?auto_306041 ?auto_306046 ) ) ( not ( = ?auto_306041 ?auto_306047 ) ) ( not ( = ?auto_306041 ?auto_306048 ) ) ( not ( = ?auto_306041 ?auto_306049 ) ) ( not ( = ?auto_306042 ?auto_306043 ) ) ( not ( = ?auto_306042 ?auto_306044 ) ) ( not ( = ?auto_306042 ?auto_306045 ) ) ( not ( = ?auto_306042 ?auto_306046 ) ) ( not ( = ?auto_306042 ?auto_306047 ) ) ( not ( = ?auto_306042 ?auto_306048 ) ) ( not ( = ?auto_306042 ?auto_306049 ) ) ( not ( = ?auto_306043 ?auto_306044 ) ) ( not ( = ?auto_306043 ?auto_306045 ) ) ( not ( = ?auto_306043 ?auto_306046 ) ) ( not ( = ?auto_306043 ?auto_306047 ) ) ( not ( = ?auto_306043 ?auto_306048 ) ) ( not ( = ?auto_306043 ?auto_306049 ) ) ( not ( = ?auto_306044 ?auto_306045 ) ) ( not ( = ?auto_306044 ?auto_306046 ) ) ( not ( = ?auto_306044 ?auto_306047 ) ) ( not ( = ?auto_306044 ?auto_306048 ) ) ( not ( = ?auto_306044 ?auto_306049 ) ) ( not ( = ?auto_306045 ?auto_306046 ) ) ( not ( = ?auto_306045 ?auto_306047 ) ) ( not ( = ?auto_306045 ?auto_306048 ) ) ( not ( = ?auto_306045 ?auto_306049 ) ) ( not ( = ?auto_306046 ?auto_306047 ) ) ( not ( = ?auto_306046 ?auto_306048 ) ) ( not ( = ?auto_306046 ?auto_306049 ) ) ( not ( = ?auto_306047 ?auto_306048 ) ) ( not ( = ?auto_306047 ?auto_306049 ) ) ( not ( = ?auto_306048 ?auto_306049 ) ) ( ON ?auto_306047 ?auto_306048 ) ( ON ?auto_306046 ?auto_306047 ) ( ON ?auto_306045 ?auto_306046 ) ( ON ?auto_306044 ?auto_306045 ) ( ON ?auto_306043 ?auto_306044 ) ( CLEAR ?auto_306041 ) ( ON ?auto_306042 ?auto_306043 ) ( CLEAR ?auto_306042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_306040 ?auto_306041 ?auto_306042 )
      ( MAKE-9PILE ?auto_306040 ?auto_306041 ?auto_306042 ?auto_306043 ?auto_306044 ?auto_306045 ?auto_306046 ?auto_306047 ?auto_306048 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306059 - BLOCK
      ?auto_306060 - BLOCK
      ?auto_306061 - BLOCK
      ?auto_306062 - BLOCK
      ?auto_306063 - BLOCK
      ?auto_306064 - BLOCK
      ?auto_306065 - BLOCK
      ?auto_306066 - BLOCK
      ?auto_306067 - BLOCK
    )
    :vars
    (
      ?auto_306068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306067 ?auto_306068 ) ( ON-TABLE ?auto_306059 ) ( ON ?auto_306060 ?auto_306059 ) ( not ( = ?auto_306059 ?auto_306060 ) ) ( not ( = ?auto_306059 ?auto_306061 ) ) ( not ( = ?auto_306059 ?auto_306062 ) ) ( not ( = ?auto_306059 ?auto_306063 ) ) ( not ( = ?auto_306059 ?auto_306064 ) ) ( not ( = ?auto_306059 ?auto_306065 ) ) ( not ( = ?auto_306059 ?auto_306066 ) ) ( not ( = ?auto_306059 ?auto_306067 ) ) ( not ( = ?auto_306059 ?auto_306068 ) ) ( not ( = ?auto_306060 ?auto_306061 ) ) ( not ( = ?auto_306060 ?auto_306062 ) ) ( not ( = ?auto_306060 ?auto_306063 ) ) ( not ( = ?auto_306060 ?auto_306064 ) ) ( not ( = ?auto_306060 ?auto_306065 ) ) ( not ( = ?auto_306060 ?auto_306066 ) ) ( not ( = ?auto_306060 ?auto_306067 ) ) ( not ( = ?auto_306060 ?auto_306068 ) ) ( not ( = ?auto_306061 ?auto_306062 ) ) ( not ( = ?auto_306061 ?auto_306063 ) ) ( not ( = ?auto_306061 ?auto_306064 ) ) ( not ( = ?auto_306061 ?auto_306065 ) ) ( not ( = ?auto_306061 ?auto_306066 ) ) ( not ( = ?auto_306061 ?auto_306067 ) ) ( not ( = ?auto_306061 ?auto_306068 ) ) ( not ( = ?auto_306062 ?auto_306063 ) ) ( not ( = ?auto_306062 ?auto_306064 ) ) ( not ( = ?auto_306062 ?auto_306065 ) ) ( not ( = ?auto_306062 ?auto_306066 ) ) ( not ( = ?auto_306062 ?auto_306067 ) ) ( not ( = ?auto_306062 ?auto_306068 ) ) ( not ( = ?auto_306063 ?auto_306064 ) ) ( not ( = ?auto_306063 ?auto_306065 ) ) ( not ( = ?auto_306063 ?auto_306066 ) ) ( not ( = ?auto_306063 ?auto_306067 ) ) ( not ( = ?auto_306063 ?auto_306068 ) ) ( not ( = ?auto_306064 ?auto_306065 ) ) ( not ( = ?auto_306064 ?auto_306066 ) ) ( not ( = ?auto_306064 ?auto_306067 ) ) ( not ( = ?auto_306064 ?auto_306068 ) ) ( not ( = ?auto_306065 ?auto_306066 ) ) ( not ( = ?auto_306065 ?auto_306067 ) ) ( not ( = ?auto_306065 ?auto_306068 ) ) ( not ( = ?auto_306066 ?auto_306067 ) ) ( not ( = ?auto_306066 ?auto_306068 ) ) ( not ( = ?auto_306067 ?auto_306068 ) ) ( ON ?auto_306066 ?auto_306067 ) ( ON ?auto_306065 ?auto_306066 ) ( ON ?auto_306064 ?auto_306065 ) ( ON ?auto_306063 ?auto_306064 ) ( ON ?auto_306062 ?auto_306063 ) ( CLEAR ?auto_306060 ) ( ON ?auto_306061 ?auto_306062 ) ( CLEAR ?auto_306061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_306059 ?auto_306060 ?auto_306061 )
      ( MAKE-9PILE ?auto_306059 ?auto_306060 ?auto_306061 ?auto_306062 ?auto_306063 ?auto_306064 ?auto_306065 ?auto_306066 ?auto_306067 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306078 - BLOCK
      ?auto_306079 - BLOCK
      ?auto_306080 - BLOCK
      ?auto_306081 - BLOCK
      ?auto_306082 - BLOCK
      ?auto_306083 - BLOCK
      ?auto_306084 - BLOCK
      ?auto_306085 - BLOCK
      ?auto_306086 - BLOCK
    )
    :vars
    (
      ?auto_306087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306086 ?auto_306087 ) ( ON-TABLE ?auto_306078 ) ( not ( = ?auto_306078 ?auto_306079 ) ) ( not ( = ?auto_306078 ?auto_306080 ) ) ( not ( = ?auto_306078 ?auto_306081 ) ) ( not ( = ?auto_306078 ?auto_306082 ) ) ( not ( = ?auto_306078 ?auto_306083 ) ) ( not ( = ?auto_306078 ?auto_306084 ) ) ( not ( = ?auto_306078 ?auto_306085 ) ) ( not ( = ?auto_306078 ?auto_306086 ) ) ( not ( = ?auto_306078 ?auto_306087 ) ) ( not ( = ?auto_306079 ?auto_306080 ) ) ( not ( = ?auto_306079 ?auto_306081 ) ) ( not ( = ?auto_306079 ?auto_306082 ) ) ( not ( = ?auto_306079 ?auto_306083 ) ) ( not ( = ?auto_306079 ?auto_306084 ) ) ( not ( = ?auto_306079 ?auto_306085 ) ) ( not ( = ?auto_306079 ?auto_306086 ) ) ( not ( = ?auto_306079 ?auto_306087 ) ) ( not ( = ?auto_306080 ?auto_306081 ) ) ( not ( = ?auto_306080 ?auto_306082 ) ) ( not ( = ?auto_306080 ?auto_306083 ) ) ( not ( = ?auto_306080 ?auto_306084 ) ) ( not ( = ?auto_306080 ?auto_306085 ) ) ( not ( = ?auto_306080 ?auto_306086 ) ) ( not ( = ?auto_306080 ?auto_306087 ) ) ( not ( = ?auto_306081 ?auto_306082 ) ) ( not ( = ?auto_306081 ?auto_306083 ) ) ( not ( = ?auto_306081 ?auto_306084 ) ) ( not ( = ?auto_306081 ?auto_306085 ) ) ( not ( = ?auto_306081 ?auto_306086 ) ) ( not ( = ?auto_306081 ?auto_306087 ) ) ( not ( = ?auto_306082 ?auto_306083 ) ) ( not ( = ?auto_306082 ?auto_306084 ) ) ( not ( = ?auto_306082 ?auto_306085 ) ) ( not ( = ?auto_306082 ?auto_306086 ) ) ( not ( = ?auto_306082 ?auto_306087 ) ) ( not ( = ?auto_306083 ?auto_306084 ) ) ( not ( = ?auto_306083 ?auto_306085 ) ) ( not ( = ?auto_306083 ?auto_306086 ) ) ( not ( = ?auto_306083 ?auto_306087 ) ) ( not ( = ?auto_306084 ?auto_306085 ) ) ( not ( = ?auto_306084 ?auto_306086 ) ) ( not ( = ?auto_306084 ?auto_306087 ) ) ( not ( = ?auto_306085 ?auto_306086 ) ) ( not ( = ?auto_306085 ?auto_306087 ) ) ( not ( = ?auto_306086 ?auto_306087 ) ) ( ON ?auto_306085 ?auto_306086 ) ( ON ?auto_306084 ?auto_306085 ) ( ON ?auto_306083 ?auto_306084 ) ( ON ?auto_306082 ?auto_306083 ) ( ON ?auto_306081 ?auto_306082 ) ( ON ?auto_306080 ?auto_306081 ) ( CLEAR ?auto_306078 ) ( ON ?auto_306079 ?auto_306080 ) ( CLEAR ?auto_306079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_306078 ?auto_306079 )
      ( MAKE-9PILE ?auto_306078 ?auto_306079 ?auto_306080 ?auto_306081 ?auto_306082 ?auto_306083 ?auto_306084 ?auto_306085 ?auto_306086 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306097 - BLOCK
      ?auto_306098 - BLOCK
      ?auto_306099 - BLOCK
      ?auto_306100 - BLOCK
      ?auto_306101 - BLOCK
      ?auto_306102 - BLOCK
      ?auto_306103 - BLOCK
      ?auto_306104 - BLOCK
      ?auto_306105 - BLOCK
    )
    :vars
    (
      ?auto_306106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306105 ?auto_306106 ) ( ON-TABLE ?auto_306097 ) ( not ( = ?auto_306097 ?auto_306098 ) ) ( not ( = ?auto_306097 ?auto_306099 ) ) ( not ( = ?auto_306097 ?auto_306100 ) ) ( not ( = ?auto_306097 ?auto_306101 ) ) ( not ( = ?auto_306097 ?auto_306102 ) ) ( not ( = ?auto_306097 ?auto_306103 ) ) ( not ( = ?auto_306097 ?auto_306104 ) ) ( not ( = ?auto_306097 ?auto_306105 ) ) ( not ( = ?auto_306097 ?auto_306106 ) ) ( not ( = ?auto_306098 ?auto_306099 ) ) ( not ( = ?auto_306098 ?auto_306100 ) ) ( not ( = ?auto_306098 ?auto_306101 ) ) ( not ( = ?auto_306098 ?auto_306102 ) ) ( not ( = ?auto_306098 ?auto_306103 ) ) ( not ( = ?auto_306098 ?auto_306104 ) ) ( not ( = ?auto_306098 ?auto_306105 ) ) ( not ( = ?auto_306098 ?auto_306106 ) ) ( not ( = ?auto_306099 ?auto_306100 ) ) ( not ( = ?auto_306099 ?auto_306101 ) ) ( not ( = ?auto_306099 ?auto_306102 ) ) ( not ( = ?auto_306099 ?auto_306103 ) ) ( not ( = ?auto_306099 ?auto_306104 ) ) ( not ( = ?auto_306099 ?auto_306105 ) ) ( not ( = ?auto_306099 ?auto_306106 ) ) ( not ( = ?auto_306100 ?auto_306101 ) ) ( not ( = ?auto_306100 ?auto_306102 ) ) ( not ( = ?auto_306100 ?auto_306103 ) ) ( not ( = ?auto_306100 ?auto_306104 ) ) ( not ( = ?auto_306100 ?auto_306105 ) ) ( not ( = ?auto_306100 ?auto_306106 ) ) ( not ( = ?auto_306101 ?auto_306102 ) ) ( not ( = ?auto_306101 ?auto_306103 ) ) ( not ( = ?auto_306101 ?auto_306104 ) ) ( not ( = ?auto_306101 ?auto_306105 ) ) ( not ( = ?auto_306101 ?auto_306106 ) ) ( not ( = ?auto_306102 ?auto_306103 ) ) ( not ( = ?auto_306102 ?auto_306104 ) ) ( not ( = ?auto_306102 ?auto_306105 ) ) ( not ( = ?auto_306102 ?auto_306106 ) ) ( not ( = ?auto_306103 ?auto_306104 ) ) ( not ( = ?auto_306103 ?auto_306105 ) ) ( not ( = ?auto_306103 ?auto_306106 ) ) ( not ( = ?auto_306104 ?auto_306105 ) ) ( not ( = ?auto_306104 ?auto_306106 ) ) ( not ( = ?auto_306105 ?auto_306106 ) ) ( ON ?auto_306104 ?auto_306105 ) ( ON ?auto_306103 ?auto_306104 ) ( ON ?auto_306102 ?auto_306103 ) ( ON ?auto_306101 ?auto_306102 ) ( ON ?auto_306100 ?auto_306101 ) ( ON ?auto_306099 ?auto_306100 ) ( CLEAR ?auto_306097 ) ( ON ?auto_306098 ?auto_306099 ) ( CLEAR ?auto_306098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_306097 ?auto_306098 )
      ( MAKE-9PILE ?auto_306097 ?auto_306098 ?auto_306099 ?auto_306100 ?auto_306101 ?auto_306102 ?auto_306103 ?auto_306104 ?auto_306105 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306116 - BLOCK
      ?auto_306117 - BLOCK
      ?auto_306118 - BLOCK
      ?auto_306119 - BLOCK
      ?auto_306120 - BLOCK
      ?auto_306121 - BLOCK
      ?auto_306122 - BLOCK
      ?auto_306123 - BLOCK
      ?auto_306124 - BLOCK
    )
    :vars
    (
      ?auto_306125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306124 ?auto_306125 ) ( not ( = ?auto_306116 ?auto_306117 ) ) ( not ( = ?auto_306116 ?auto_306118 ) ) ( not ( = ?auto_306116 ?auto_306119 ) ) ( not ( = ?auto_306116 ?auto_306120 ) ) ( not ( = ?auto_306116 ?auto_306121 ) ) ( not ( = ?auto_306116 ?auto_306122 ) ) ( not ( = ?auto_306116 ?auto_306123 ) ) ( not ( = ?auto_306116 ?auto_306124 ) ) ( not ( = ?auto_306116 ?auto_306125 ) ) ( not ( = ?auto_306117 ?auto_306118 ) ) ( not ( = ?auto_306117 ?auto_306119 ) ) ( not ( = ?auto_306117 ?auto_306120 ) ) ( not ( = ?auto_306117 ?auto_306121 ) ) ( not ( = ?auto_306117 ?auto_306122 ) ) ( not ( = ?auto_306117 ?auto_306123 ) ) ( not ( = ?auto_306117 ?auto_306124 ) ) ( not ( = ?auto_306117 ?auto_306125 ) ) ( not ( = ?auto_306118 ?auto_306119 ) ) ( not ( = ?auto_306118 ?auto_306120 ) ) ( not ( = ?auto_306118 ?auto_306121 ) ) ( not ( = ?auto_306118 ?auto_306122 ) ) ( not ( = ?auto_306118 ?auto_306123 ) ) ( not ( = ?auto_306118 ?auto_306124 ) ) ( not ( = ?auto_306118 ?auto_306125 ) ) ( not ( = ?auto_306119 ?auto_306120 ) ) ( not ( = ?auto_306119 ?auto_306121 ) ) ( not ( = ?auto_306119 ?auto_306122 ) ) ( not ( = ?auto_306119 ?auto_306123 ) ) ( not ( = ?auto_306119 ?auto_306124 ) ) ( not ( = ?auto_306119 ?auto_306125 ) ) ( not ( = ?auto_306120 ?auto_306121 ) ) ( not ( = ?auto_306120 ?auto_306122 ) ) ( not ( = ?auto_306120 ?auto_306123 ) ) ( not ( = ?auto_306120 ?auto_306124 ) ) ( not ( = ?auto_306120 ?auto_306125 ) ) ( not ( = ?auto_306121 ?auto_306122 ) ) ( not ( = ?auto_306121 ?auto_306123 ) ) ( not ( = ?auto_306121 ?auto_306124 ) ) ( not ( = ?auto_306121 ?auto_306125 ) ) ( not ( = ?auto_306122 ?auto_306123 ) ) ( not ( = ?auto_306122 ?auto_306124 ) ) ( not ( = ?auto_306122 ?auto_306125 ) ) ( not ( = ?auto_306123 ?auto_306124 ) ) ( not ( = ?auto_306123 ?auto_306125 ) ) ( not ( = ?auto_306124 ?auto_306125 ) ) ( ON ?auto_306123 ?auto_306124 ) ( ON ?auto_306122 ?auto_306123 ) ( ON ?auto_306121 ?auto_306122 ) ( ON ?auto_306120 ?auto_306121 ) ( ON ?auto_306119 ?auto_306120 ) ( ON ?auto_306118 ?auto_306119 ) ( ON ?auto_306117 ?auto_306118 ) ( ON ?auto_306116 ?auto_306117 ) ( CLEAR ?auto_306116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_306116 )
      ( MAKE-9PILE ?auto_306116 ?auto_306117 ?auto_306118 ?auto_306119 ?auto_306120 ?auto_306121 ?auto_306122 ?auto_306123 ?auto_306124 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_306135 - BLOCK
      ?auto_306136 - BLOCK
      ?auto_306137 - BLOCK
      ?auto_306138 - BLOCK
      ?auto_306139 - BLOCK
      ?auto_306140 - BLOCK
      ?auto_306141 - BLOCK
      ?auto_306142 - BLOCK
      ?auto_306143 - BLOCK
    )
    :vars
    (
      ?auto_306144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306143 ?auto_306144 ) ( not ( = ?auto_306135 ?auto_306136 ) ) ( not ( = ?auto_306135 ?auto_306137 ) ) ( not ( = ?auto_306135 ?auto_306138 ) ) ( not ( = ?auto_306135 ?auto_306139 ) ) ( not ( = ?auto_306135 ?auto_306140 ) ) ( not ( = ?auto_306135 ?auto_306141 ) ) ( not ( = ?auto_306135 ?auto_306142 ) ) ( not ( = ?auto_306135 ?auto_306143 ) ) ( not ( = ?auto_306135 ?auto_306144 ) ) ( not ( = ?auto_306136 ?auto_306137 ) ) ( not ( = ?auto_306136 ?auto_306138 ) ) ( not ( = ?auto_306136 ?auto_306139 ) ) ( not ( = ?auto_306136 ?auto_306140 ) ) ( not ( = ?auto_306136 ?auto_306141 ) ) ( not ( = ?auto_306136 ?auto_306142 ) ) ( not ( = ?auto_306136 ?auto_306143 ) ) ( not ( = ?auto_306136 ?auto_306144 ) ) ( not ( = ?auto_306137 ?auto_306138 ) ) ( not ( = ?auto_306137 ?auto_306139 ) ) ( not ( = ?auto_306137 ?auto_306140 ) ) ( not ( = ?auto_306137 ?auto_306141 ) ) ( not ( = ?auto_306137 ?auto_306142 ) ) ( not ( = ?auto_306137 ?auto_306143 ) ) ( not ( = ?auto_306137 ?auto_306144 ) ) ( not ( = ?auto_306138 ?auto_306139 ) ) ( not ( = ?auto_306138 ?auto_306140 ) ) ( not ( = ?auto_306138 ?auto_306141 ) ) ( not ( = ?auto_306138 ?auto_306142 ) ) ( not ( = ?auto_306138 ?auto_306143 ) ) ( not ( = ?auto_306138 ?auto_306144 ) ) ( not ( = ?auto_306139 ?auto_306140 ) ) ( not ( = ?auto_306139 ?auto_306141 ) ) ( not ( = ?auto_306139 ?auto_306142 ) ) ( not ( = ?auto_306139 ?auto_306143 ) ) ( not ( = ?auto_306139 ?auto_306144 ) ) ( not ( = ?auto_306140 ?auto_306141 ) ) ( not ( = ?auto_306140 ?auto_306142 ) ) ( not ( = ?auto_306140 ?auto_306143 ) ) ( not ( = ?auto_306140 ?auto_306144 ) ) ( not ( = ?auto_306141 ?auto_306142 ) ) ( not ( = ?auto_306141 ?auto_306143 ) ) ( not ( = ?auto_306141 ?auto_306144 ) ) ( not ( = ?auto_306142 ?auto_306143 ) ) ( not ( = ?auto_306142 ?auto_306144 ) ) ( not ( = ?auto_306143 ?auto_306144 ) ) ( ON ?auto_306142 ?auto_306143 ) ( ON ?auto_306141 ?auto_306142 ) ( ON ?auto_306140 ?auto_306141 ) ( ON ?auto_306139 ?auto_306140 ) ( ON ?auto_306138 ?auto_306139 ) ( ON ?auto_306137 ?auto_306138 ) ( ON ?auto_306136 ?auto_306137 ) ( ON ?auto_306135 ?auto_306136 ) ( CLEAR ?auto_306135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_306135 )
      ( MAKE-9PILE ?auto_306135 ?auto_306136 ?auto_306137 ?auto_306138 ?auto_306139 ?auto_306140 ?auto_306141 ?auto_306142 ?auto_306143 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306155 - BLOCK
      ?auto_306156 - BLOCK
      ?auto_306157 - BLOCK
      ?auto_306158 - BLOCK
      ?auto_306159 - BLOCK
      ?auto_306160 - BLOCK
      ?auto_306161 - BLOCK
      ?auto_306162 - BLOCK
      ?auto_306163 - BLOCK
      ?auto_306164 - BLOCK
    )
    :vars
    (
      ?auto_306165 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_306163 ) ( ON ?auto_306164 ?auto_306165 ) ( CLEAR ?auto_306164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_306155 ) ( ON ?auto_306156 ?auto_306155 ) ( ON ?auto_306157 ?auto_306156 ) ( ON ?auto_306158 ?auto_306157 ) ( ON ?auto_306159 ?auto_306158 ) ( ON ?auto_306160 ?auto_306159 ) ( ON ?auto_306161 ?auto_306160 ) ( ON ?auto_306162 ?auto_306161 ) ( ON ?auto_306163 ?auto_306162 ) ( not ( = ?auto_306155 ?auto_306156 ) ) ( not ( = ?auto_306155 ?auto_306157 ) ) ( not ( = ?auto_306155 ?auto_306158 ) ) ( not ( = ?auto_306155 ?auto_306159 ) ) ( not ( = ?auto_306155 ?auto_306160 ) ) ( not ( = ?auto_306155 ?auto_306161 ) ) ( not ( = ?auto_306155 ?auto_306162 ) ) ( not ( = ?auto_306155 ?auto_306163 ) ) ( not ( = ?auto_306155 ?auto_306164 ) ) ( not ( = ?auto_306155 ?auto_306165 ) ) ( not ( = ?auto_306156 ?auto_306157 ) ) ( not ( = ?auto_306156 ?auto_306158 ) ) ( not ( = ?auto_306156 ?auto_306159 ) ) ( not ( = ?auto_306156 ?auto_306160 ) ) ( not ( = ?auto_306156 ?auto_306161 ) ) ( not ( = ?auto_306156 ?auto_306162 ) ) ( not ( = ?auto_306156 ?auto_306163 ) ) ( not ( = ?auto_306156 ?auto_306164 ) ) ( not ( = ?auto_306156 ?auto_306165 ) ) ( not ( = ?auto_306157 ?auto_306158 ) ) ( not ( = ?auto_306157 ?auto_306159 ) ) ( not ( = ?auto_306157 ?auto_306160 ) ) ( not ( = ?auto_306157 ?auto_306161 ) ) ( not ( = ?auto_306157 ?auto_306162 ) ) ( not ( = ?auto_306157 ?auto_306163 ) ) ( not ( = ?auto_306157 ?auto_306164 ) ) ( not ( = ?auto_306157 ?auto_306165 ) ) ( not ( = ?auto_306158 ?auto_306159 ) ) ( not ( = ?auto_306158 ?auto_306160 ) ) ( not ( = ?auto_306158 ?auto_306161 ) ) ( not ( = ?auto_306158 ?auto_306162 ) ) ( not ( = ?auto_306158 ?auto_306163 ) ) ( not ( = ?auto_306158 ?auto_306164 ) ) ( not ( = ?auto_306158 ?auto_306165 ) ) ( not ( = ?auto_306159 ?auto_306160 ) ) ( not ( = ?auto_306159 ?auto_306161 ) ) ( not ( = ?auto_306159 ?auto_306162 ) ) ( not ( = ?auto_306159 ?auto_306163 ) ) ( not ( = ?auto_306159 ?auto_306164 ) ) ( not ( = ?auto_306159 ?auto_306165 ) ) ( not ( = ?auto_306160 ?auto_306161 ) ) ( not ( = ?auto_306160 ?auto_306162 ) ) ( not ( = ?auto_306160 ?auto_306163 ) ) ( not ( = ?auto_306160 ?auto_306164 ) ) ( not ( = ?auto_306160 ?auto_306165 ) ) ( not ( = ?auto_306161 ?auto_306162 ) ) ( not ( = ?auto_306161 ?auto_306163 ) ) ( not ( = ?auto_306161 ?auto_306164 ) ) ( not ( = ?auto_306161 ?auto_306165 ) ) ( not ( = ?auto_306162 ?auto_306163 ) ) ( not ( = ?auto_306162 ?auto_306164 ) ) ( not ( = ?auto_306162 ?auto_306165 ) ) ( not ( = ?auto_306163 ?auto_306164 ) ) ( not ( = ?auto_306163 ?auto_306165 ) ) ( not ( = ?auto_306164 ?auto_306165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_306164 ?auto_306165 )
      ( !STACK ?auto_306164 ?auto_306163 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306176 - BLOCK
      ?auto_306177 - BLOCK
      ?auto_306178 - BLOCK
      ?auto_306179 - BLOCK
      ?auto_306180 - BLOCK
      ?auto_306181 - BLOCK
      ?auto_306182 - BLOCK
      ?auto_306183 - BLOCK
      ?auto_306184 - BLOCK
      ?auto_306185 - BLOCK
    )
    :vars
    (
      ?auto_306186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_306184 ) ( ON ?auto_306185 ?auto_306186 ) ( CLEAR ?auto_306185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_306176 ) ( ON ?auto_306177 ?auto_306176 ) ( ON ?auto_306178 ?auto_306177 ) ( ON ?auto_306179 ?auto_306178 ) ( ON ?auto_306180 ?auto_306179 ) ( ON ?auto_306181 ?auto_306180 ) ( ON ?auto_306182 ?auto_306181 ) ( ON ?auto_306183 ?auto_306182 ) ( ON ?auto_306184 ?auto_306183 ) ( not ( = ?auto_306176 ?auto_306177 ) ) ( not ( = ?auto_306176 ?auto_306178 ) ) ( not ( = ?auto_306176 ?auto_306179 ) ) ( not ( = ?auto_306176 ?auto_306180 ) ) ( not ( = ?auto_306176 ?auto_306181 ) ) ( not ( = ?auto_306176 ?auto_306182 ) ) ( not ( = ?auto_306176 ?auto_306183 ) ) ( not ( = ?auto_306176 ?auto_306184 ) ) ( not ( = ?auto_306176 ?auto_306185 ) ) ( not ( = ?auto_306176 ?auto_306186 ) ) ( not ( = ?auto_306177 ?auto_306178 ) ) ( not ( = ?auto_306177 ?auto_306179 ) ) ( not ( = ?auto_306177 ?auto_306180 ) ) ( not ( = ?auto_306177 ?auto_306181 ) ) ( not ( = ?auto_306177 ?auto_306182 ) ) ( not ( = ?auto_306177 ?auto_306183 ) ) ( not ( = ?auto_306177 ?auto_306184 ) ) ( not ( = ?auto_306177 ?auto_306185 ) ) ( not ( = ?auto_306177 ?auto_306186 ) ) ( not ( = ?auto_306178 ?auto_306179 ) ) ( not ( = ?auto_306178 ?auto_306180 ) ) ( not ( = ?auto_306178 ?auto_306181 ) ) ( not ( = ?auto_306178 ?auto_306182 ) ) ( not ( = ?auto_306178 ?auto_306183 ) ) ( not ( = ?auto_306178 ?auto_306184 ) ) ( not ( = ?auto_306178 ?auto_306185 ) ) ( not ( = ?auto_306178 ?auto_306186 ) ) ( not ( = ?auto_306179 ?auto_306180 ) ) ( not ( = ?auto_306179 ?auto_306181 ) ) ( not ( = ?auto_306179 ?auto_306182 ) ) ( not ( = ?auto_306179 ?auto_306183 ) ) ( not ( = ?auto_306179 ?auto_306184 ) ) ( not ( = ?auto_306179 ?auto_306185 ) ) ( not ( = ?auto_306179 ?auto_306186 ) ) ( not ( = ?auto_306180 ?auto_306181 ) ) ( not ( = ?auto_306180 ?auto_306182 ) ) ( not ( = ?auto_306180 ?auto_306183 ) ) ( not ( = ?auto_306180 ?auto_306184 ) ) ( not ( = ?auto_306180 ?auto_306185 ) ) ( not ( = ?auto_306180 ?auto_306186 ) ) ( not ( = ?auto_306181 ?auto_306182 ) ) ( not ( = ?auto_306181 ?auto_306183 ) ) ( not ( = ?auto_306181 ?auto_306184 ) ) ( not ( = ?auto_306181 ?auto_306185 ) ) ( not ( = ?auto_306181 ?auto_306186 ) ) ( not ( = ?auto_306182 ?auto_306183 ) ) ( not ( = ?auto_306182 ?auto_306184 ) ) ( not ( = ?auto_306182 ?auto_306185 ) ) ( not ( = ?auto_306182 ?auto_306186 ) ) ( not ( = ?auto_306183 ?auto_306184 ) ) ( not ( = ?auto_306183 ?auto_306185 ) ) ( not ( = ?auto_306183 ?auto_306186 ) ) ( not ( = ?auto_306184 ?auto_306185 ) ) ( not ( = ?auto_306184 ?auto_306186 ) ) ( not ( = ?auto_306185 ?auto_306186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_306185 ?auto_306186 )
      ( !STACK ?auto_306185 ?auto_306184 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306197 - BLOCK
      ?auto_306198 - BLOCK
      ?auto_306199 - BLOCK
      ?auto_306200 - BLOCK
      ?auto_306201 - BLOCK
      ?auto_306202 - BLOCK
      ?auto_306203 - BLOCK
      ?auto_306204 - BLOCK
      ?auto_306205 - BLOCK
      ?auto_306206 - BLOCK
    )
    :vars
    (
      ?auto_306207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306206 ?auto_306207 ) ( ON-TABLE ?auto_306197 ) ( ON ?auto_306198 ?auto_306197 ) ( ON ?auto_306199 ?auto_306198 ) ( ON ?auto_306200 ?auto_306199 ) ( ON ?auto_306201 ?auto_306200 ) ( ON ?auto_306202 ?auto_306201 ) ( ON ?auto_306203 ?auto_306202 ) ( ON ?auto_306204 ?auto_306203 ) ( not ( = ?auto_306197 ?auto_306198 ) ) ( not ( = ?auto_306197 ?auto_306199 ) ) ( not ( = ?auto_306197 ?auto_306200 ) ) ( not ( = ?auto_306197 ?auto_306201 ) ) ( not ( = ?auto_306197 ?auto_306202 ) ) ( not ( = ?auto_306197 ?auto_306203 ) ) ( not ( = ?auto_306197 ?auto_306204 ) ) ( not ( = ?auto_306197 ?auto_306205 ) ) ( not ( = ?auto_306197 ?auto_306206 ) ) ( not ( = ?auto_306197 ?auto_306207 ) ) ( not ( = ?auto_306198 ?auto_306199 ) ) ( not ( = ?auto_306198 ?auto_306200 ) ) ( not ( = ?auto_306198 ?auto_306201 ) ) ( not ( = ?auto_306198 ?auto_306202 ) ) ( not ( = ?auto_306198 ?auto_306203 ) ) ( not ( = ?auto_306198 ?auto_306204 ) ) ( not ( = ?auto_306198 ?auto_306205 ) ) ( not ( = ?auto_306198 ?auto_306206 ) ) ( not ( = ?auto_306198 ?auto_306207 ) ) ( not ( = ?auto_306199 ?auto_306200 ) ) ( not ( = ?auto_306199 ?auto_306201 ) ) ( not ( = ?auto_306199 ?auto_306202 ) ) ( not ( = ?auto_306199 ?auto_306203 ) ) ( not ( = ?auto_306199 ?auto_306204 ) ) ( not ( = ?auto_306199 ?auto_306205 ) ) ( not ( = ?auto_306199 ?auto_306206 ) ) ( not ( = ?auto_306199 ?auto_306207 ) ) ( not ( = ?auto_306200 ?auto_306201 ) ) ( not ( = ?auto_306200 ?auto_306202 ) ) ( not ( = ?auto_306200 ?auto_306203 ) ) ( not ( = ?auto_306200 ?auto_306204 ) ) ( not ( = ?auto_306200 ?auto_306205 ) ) ( not ( = ?auto_306200 ?auto_306206 ) ) ( not ( = ?auto_306200 ?auto_306207 ) ) ( not ( = ?auto_306201 ?auto_306202 ) ) ( not ( = ?auto_306201 ?auto_306203 ) ) ( not ( = ?auto_306201 ?auto_306204 ) ) ( not ( = ?auto_306201 ?auto_306205 ) ) ( not ( = ?auto_306201 ?auto_306206 ) ) ( not ( = ?auto_306201 ?auto_306207 ) ) ( not ( = ?auto_306202 ?auto_306203 ) ) ( not ( = ?auto_306202 ?auto_306204 ) ) ( not ( = ?auto_306202 ?auto_306205 ) ) ( not ( = ?auto_306202 ?auto_306206 ) ) ( not ( = ?auto_306202 ?auto_306207 ) ) ( not ( = ?auto_306203 ?auto_306204 ) ) ( not ( = ?auto_306203 ?auto_306205 ) ) ( not ( = ?auto_306203 ?auto_306206 ) ) ( not ( = ?auto_306203 ?auto_306207 ) ) ( not ( = ?auto_306204 ?auto_306205 ) ) ( not ( = ?auto_306204 ?auto_306206 ) ) ( not ( = ?auto_306204 ?auto_306207 ) ) ( not ( = ?auto_306205 ?auto_306206 ) ) ( not ( = ?auto_306205 ?auto_306207 ) ) ( not ( = ?auto_306206 ?auto_306207 ) ) ( CLEAR ?auto_306204 ) ( ON ?auto_306205 ?auto_306206 ) ( CLEAR ?auto_306205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_306197 ?auto_306198 ?auto_306199 ?auto_306200 ?auto_306201 ?auto_306202 ?auto_306203 ?auto_306204 ?auto_306205 )
      ( MAKE-10PILE ?auto_306197 ?auto_306198 ?auto_306199 ?auto_306200 ?auto_306201 ?auto_306202 ?auto_306203 ?auto_306204 ?auto_306205 ?auto_306206 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306218 - BLOCK
      ?auto_306219 - BLOCK
      ?auto_306220 - BLOCK
      ?auto_306221 - BLOCK
      ?auto_306222 - BLOCK
      ?auto_306223 - BLOCK
      ?auto_306224 - BLOCK
      ?auto_306225 - BLOCK
      ?auto_306226 - BLOCK
      ?auto_306227 - BLOCK
    )
    :vars
    (
      ?auto_306228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306227 ?auto_306228 ) ( ON-TABLE ?auto_306218 ) ( ON ?auto_306219 ?auto_306218 ) ( ON ?auto_306220 ?auto_306219 ) ( ON ?auto_306221 ?auto_306220 ) ( ON ?auto_306222 ?auto_306221 ) ( ON ?auto_306223 ?auto_306222 ) ( ON ?auto_306224 ?auto_306223 ) ( ON ?auto_306225 ?auto_306224 ) ( not ( = ?auto_306218 ?auto_306219 ) ) ( not ( = ?auto_306218 ?auto_306220 ) ) ( not ( = ?auto_306218 ?auto_306221 ) ) ( not ( = ?auto_306218 ?auto_306222 ) ) ( not ( = ?auto_306218 ?auto_306223 ) ) ( not ( = ?auto_306218 ?auto_306224 ) ) ( not ( = ?auto_306218 ?auto_306225 ) ) ( not ( = ?auto_306218 ?auto_306226 ) ) ( not ( = ?auto_306218 ?auto_306227 ) ) ( not ( = ?auto_306218 ?auto_306228 ) ) ( not ( = ?auto_306219 ?auto_306220 ) ) ( not ( = ?auto_306219 ?auto_306221 ) ) ( not ( = ?auto_306219 ?auto_306222 ) ) ( not ( = ?auto_306219 ?auto_306223 ) ) ( not ( = ?auto_306219 ?auto_306224 ) ) ( not ( = ?auto_306219 ?auto_306225 ) ) ( not ( = ?auto_306219 ?auto_306226 ) ) ( not ( = ?auto_306219 ?auto_306227 ) ) ( not ( = ?auto_306219 ?auto_306228 ) ) ( not ( = ?auto_306220 ?auto_306221 ) ) ( not ( = ?auto_306220 ?auto_306222 ) ) ( not ( = ?auto_306220 ?auto_306223 ) ) ( not ( = ?auto_306220 ?auto_306224 ) ) ( not ( = ?auto_306220 ?auto_306225 ) ) ( not ( = ?auto_306220 ?auto_306226 ) ) ( not ( = ?auto_306220 ?auto_306227 ) ) ( not ( = ?auto_306220 ?auto_306228 ) ) ( not ( = ?auto_306221 ?auto_306222 ) ) ( not ( = ?auto_306221 ?auto_306223 ) ) ( not ( = ?auto_306221 ?auto_306224 ) ) ( not ( = ?auto_306221 ?auto_306225 ) ) ( not ( = ?auto_306221 ?auto_306226 ) ) ( not ( = ?auto_306221 ?auto_306227 ) ) ( not ( = ?auto_306221 ?auto_306228 ) ) ( not ( = ?auto_306222 ?auto_306223 ) ) ( not ( = ?auto_306222 ?auto_306224 ) ) ( not ( = ?auto_306222 ?auto_306225 ) ) ( not ( = ?auto_306222 ?auto_306226 ) ) ( not ( = ?auto_306222 ?auto_306227 ) ) ( not ( = ?auto_306222 ?auto_306228 ) ) ( not ( = ?auto_306223 ?auto_306224 ) ) ( not ( = ?auto_306223 ?auto_306225 ) ) ( not ( = ?auto_306223 ?auto_306226 ) ) ( not ( = ?auto_306223 ?auto_306227 ) ) ( not ( = ?auto_306223 ?auto_306228 ) ) ( not ( = ?auto_306224 ?auto_306225 ) ) ( not ( = ?auto_306224 ?auto_306226 ) ) ( not ( = ?auto_306224 ?auto_306227 ) ) ( not ( = ?auto_306224 ?auto_306228 ) ) ( not ( = ?auto_306225 ?auto_306226 ) ) ( not ( = ?auto_306225 ?auto_306227 ) ) ( not ( = ?auto_306225 ?auto_306228 ) ) ( not ( = ?auto_306226 ?auto_306227 ) ) ( not ( = ?auto_306226 ?auto_306228 ) ) ( not ( = ?auto_306227 ?auto_306228 ) ) ( CLEAR ?auto_306225 ) ( ON ?auto_306226 ?auto_306227 ) ( CLEAR ?auto_306226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_306218 ?auto_306219 ?auto_306220 ?auto_306221 ?auto_306222 ?auto_306223 ?auto_306224 ?auto_306225 ?auto_306226 )
      ( MAKE-10PILE ?auto_306218 ?auto_306219 ?auto_306220 ?auto_306221 ?auto_306222 ?auto_306223 ?auto_306224 ?auto_306225 ?auto_306226 ?auto_306227 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306239 - BLOCK
      ?auto_306240 - BLOCK
      ?auto_306241 - BLOCK
      ?auto_306242 - BLOCK
      ?auto_306243 - BLOCK
      ?auto_306244 - BLOCK
      ?auto_306245 - BLOCK
      ?auto_306246 - BLOCK
      ?auto_306247 - BLOCK
      ?auto_306248 - BLOCK
    )
    :vars
    (
      ?auto_306249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306248 ?auto_306249 ) ( ON-TABLE ?auto_306239 ) ( ON ?auto_306240 ?auto_306239 ) ( ON ?auto_306241 ?auto_306240 ) ( ON ?auto_306242 ?auto_306241 ) ( ON ?auto_306243 ?auto_306242 ) ( ON ?auto_306244 ?auto_306243 ) ( ON ?auto_306245 ?auto_306244 ) ( not ( = ?auto_306239 ?auto_306240 ) ) ( not ( = ?auto_306239 ?auto_306241 ) ) ( not ( = ?auto_306239 ?auto_306242 ) ) ( not ( = ?auto_306239 ?auto_306243 ) ) ( not ( = ?auto_306239 ?auto_306244 ) ) ( not ( = ?auto_306239 ?auto_306245 ) ) ( not ( = ?auto_306239 ?auto_306246 ) ) ( not ( = ?auto_306239 ?auto_306247 ) ) ( not ( = ?auto_306239 ?auto_306248 ) ) ( not ( = ?auto_306239 ?auto_306249 ) ) ( not ( = ?auto_306240 ?auto_306241 ) ) ( not ( = ?auto_306240 ?auto_306242 ) ) ( not ( = ?auto_306240 ?auto_306243 ) ) ( not ( = ?auto_306240 ?auto_306244 ) ) ( not ( = ?auto_306240 ?auto_306245 ) ) ( not ( = ?auto_306240 ?auto_306246 ) ) ( not ( = ?auto_306240 ?auto_306247 ) ) ( not ( = ?auto_306240 ?auto_306248 ) ) ( not ( = ?auto_306240 ?auto_306249 ) ) ( not ( = ?auto_306241 ?auto_306242 ) ) ( not ( = ?auto_306241 ?auto_306243 ) ) ( not ( = ?auto_306241 ?auto_306244 ) ) ( not ( = ?auto_306241 ?auto_306245 ) ) ( not ( = ?auto_306241 ?auto_306246 ) ) ( not ( = ?auto_306241 ?auto_306247 ) ) ( not ( = ?auto_306241 ?auto_306248 ) ) ( not ( = ?auto_306241 ?auto_306249 ) ) ( not ( = ?auto_306242 ?auto_306243 ) ) ( not ( = ?auto_306242 ?auto_306244 ) ) ( not ( = ?auto_306242 ?auto_306245 ) ) ( not ( = ?auto_306242 ?auto_306246 ) ) ( not ( = ?auto_306242 ?auto_306247 ) ) ( not ( = ?auto_306242 ?auto_306248 ) ) ( not ( = ?auto_306242 ?auto_306249 ) ) ( not ( = ?auto_306243 ?auto_306244 ) ) ( not ( = ?auto_306243 ?auto_306245 ) ) ( not ( = ?auto_306243 ?auto_306246 ) ) ( not ( = ?auto_306243 ?auto_306247 ) ) ( not ( = ?auto_306243 ?auto_306248 ) ) ( not ( = ?auto_306243 ?auto_306249 ) ) ( not ( = ?auto_306244 ?auto_306245 ) ) ( not ( = ?auto_306244 ?auto_306246 ) ) ( not ( = ?auto_306244 ?auto_306247 ) ) ( not ( = ?auto_306244 ?auto_306248 ) ) ( not ( = ?auto_306244 ?auto_306249 ) ) ( not ( = ?auto_306245 ?auto_306246 ) ) ( not ( = ?auto_306245 ?auto_306247 ) ) ( not ( = ?auto_306245 ?auto_306248 ) ) ( not ( = ?auto_306245 ?auto_306249 ) ) ( not ( = ?auto_306246 ?auto_306247 ) ) ( not ( = ?auto_306246 ?auto_306248 ) ) ( not ( = ?auto_306246 ?auto_306249 ) ) ( not ( = ?auto_306247 ?auto_306248 ) ) ( not ( = ?auto_306247 ?auto_306249 ) ) ( not ( = ?auto_306248 ?auto_306249 ) ) ( ON ?auto_306247 ?auto_306248 ) ( CLEAR ?auto_306245 ) ( ON ?auto_306246 ?auto_306247 ) ( CLEAR ?auto_306246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_306239 ?auto_306240 ?auto_306241 ?auto_306242 ?auto_306243 ?auto_306244 ?auto_306245 ?auto_306246 )
      ( MAKE-10PILE ?auto_306239 ?auto_306240 ?auto_306241 ?auto_306242 ?auto_306243 ?auto_306244 ?auto_306245 ?auto_306246 ?auto_306247 ?auto_306248 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306260 - BLOCK
      ?auto_306261 - BLOCK
      ?auto_306262 - BLOCK
      ?auto_306263 - BLOCK
      ?auto_306264 - BLOCK
      ?auto_306265 - BLOCK
      ?auto_306266 - BLOCK
      ?auto_306267 - BLOCK
      ?auto_306268 - BLOCK
      ?auto_306269 - BLOCK
    )
    :vars
    (
      ?auto_306270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306269 ?auto_306270 ) ( ON-TABLE ?auto_306260 ) ( ON ?auto_306261 ?auto_306260 ) ( ON ?auto_306262 ?auto_306261 ) ( ON ?auto_306263 ?auto_306262 ) ( ON ?auto_306264 ?auto_306263 ) ( ON ?auto_306265 ?auto_306264 ) ( ON ?auto_306266 ?auto_306265 ) ( not ( = ?auto_306260 ?auto_306261 ) ) ( not ( = ?auto_306260 ?auto_306262 ) ) ( not ( = ?auto_306260 ?auto_306263 ) ) ( not ( = ?auto_306260 ?auto_306264 ) ) ( not ( = ?auto_306260 ?auto_306265 ) ) ( not ( = ?auto_306260 ?auto_306266 ) ) ( not ( = ?auto_306260 ?auto_306267 ) ) ( not ( = ?auto_306260 ?auto_306268 ) ) ( not ( = ?auto_306260 ?auto_306269 ) ) ( not ( = ?auto_306260 ?auto_306270 ) ) ( not ( = ?auto_306261 ?auto_306262 ) ) ( not ( = ?auto_306261 ?auto_306263 ) ) ( not ( = ?auto_306261 ?auto_306264 ) ) ( not ( = ?auto_306261 ?auto_306265 ) ) ( not ( = ?auto_306261 ?auto_306266 ) ) ( not ( = ?auto_306261 ?auto_306267 ) ) ( not ( = ?auto_306261 ?auto_306268 ) ) ( not ( = ?auto_306261 ?auto_306269 ) ) ( not ( = ?auto_306261 ?auto_306270 ) ) ( not ( = ?auto_306262 ?auto_306263 ) ) ( not ( = ?auto_306262 ?auto_306264 ) ) ( not ( = ?auto_306262 ?auto_306265 ) ) ( not ( = ?auto_306262 ?auto_306266 ) ) ( not ( = ?auto_306262 ?auto_306267 ) ) ( not ( = ?auto_306262 ?auto_306268 ) ) ( not ( = ?auto_306262 ?auto_306269 ) ) ( not ( = ?auto_306262 ?auto_306270 ) ) ( not ( = ?auto_306263 ?auto_306264 ) ) ( not ( = ?auto_306263 ?auto_306265 ) ) ( not ( = ?auto_306263 ?auto_306266 ) ) ( not ( = ?auto_306263 ?auto_306267 ) ) ( not ( = ?auto_306263 ?auto_306268 ) ) ( not ( = ?auto_306263 ?auto_306269 ) ) ( not ( = ?auto_306263 ?auto_306270 ) ) ( not ( = ?auto_306264 ?auto_306265 ) ) ( not ( = ?auto_306264 ?auto_306266 ) ) ( not ( = ?auto_306264 ?auto_306267 ) ) ( not ( = ?auto_306264 ?auto_306268 ) ) ( not ( = ?auto_306264 ?auto_306269 ) ) ( not ( = ?auto_306264 ?auto_306270 ) ) ( not ( = ?auto_306265 ?auto_306266 ) ) ( not ( = ?auto_306265 ?auto_306267 ) ) ( not ( = ?auto_306265 ?auto_306268 ) ) ( not ( = ?auto_306265 ?auto_306269 ) ) ( not ( = ?auto_306265 ?auto_306270 ) ) ( not ( = ?auto_306266 ?auto_306267 ) ) ( not ( = ?auto_306266 ?auto_306268 ) ) ( not ( = ?auto_306266 ?auto_306269 ) ) ( not ( = ?auto_306266 ?auto_306270 ) ) ( not ( = ?auto_306267 ?auto_306268 ) ) ( not ( = ?auto_306267 ?auto_306269 ) ) ( not ( = ?auto_306267 ?auto_306270 ) ) ( not ( = ?auto_306268 ?auto_306269 ) ) ( not ( = ?auto_306268 ?auto_306270 ) ) ( not ( = ?auto_306269 ?auto_306270 ) ) ( ON ?auto_306268 ?auto_306269 ) ( CLEAR ?auto_306266 ) ( ON ?auto_306267 ?auto_306268 ) ( CLEAR ?auto_306267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_306260 ?auto_306261 ?auto_306262 ?auto_306263 ?auto_306264 ?auto_306265 ?auto_306266 ?auto_306267 )
      ( MAKE-10PILE ?auto_306260 ?auto_306261 ?auto_306262 ?auto_306263 ?auto_306264 ?auto_306265 ?auto_306266 ?auto_306267 ?auto_306268 ?auto_306269 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306281 - BLOCK
      ?auto_306282 - BLOCK
      ?auto_306283 - BLOCK
      ?auto_306284 - BLOCK
      ?auto_306285 - BLOCK
      ?auto_306286 - BLOCK
      ?auto_306287 - BLOCK
      ?auto_306288 - BLOCK
      ?auto_306289 - BLOCK
      ?auto_306290 - BLOCK
    )
    :vars
    (
      ?auto_306291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306290 ?auto_306291 ) ( ON-TABLE ?auto_306281 ) ( ON ?auto_306282 ?auto_306281 ) ( ON ?auto_306283 ?auto_306282 ) ( ON ?auto_306284 ?auto_306283 ) ( ON ?auto_306285 ?auto_306284 ) ( ON ?auto_306286 ?auto_306285 ) ( not ( = ?auto_306281 ?auto_306282 ) ) ( not ( = ?auto_306281 ?auto_306283 ) ) ( not ( = ?auto_306281 ?auto_306284 ) ) ( not ( = ?auto_306281 ?auto_306285 ) ) ( not ( = ?auto_306281 ?auto_306286 ) ) ( not ( = ?auto_306281 ?auto_306287 ) ) ( not ( = ?auto_306281 ?auto_306288 ) ) ( not ( = ?auto_306281 ?auto_306289 ) ) ( not ( = ?auto_306281 ?auto_306290 ) ) ( not ( = ?auto_306281 ?auto_306291 ) ) ( not ( = ?auto_306282 ?auto_306283 ) ) ( not ( = ?auto_306282 ?auto_306284 ) ) ( not ( = ?auto_306282 ?auto_306285 ) ) ( not ( = ?auto_306282 ?auto_306286 ) ) ( not ( = ?auto_306282 ?auto_306287 ) ) ( not ( = ?auto_306282 ?auto_306288 ) ) ( not ( = ?auto_306282 ?auto_306289 ) ) ( not ( = ?auto_306282 ?auto_306290 ) ) ( not ( = ?auto_306282 ?auto_306291 ) ) ( not ( = ?auto_306283 ?auto_306284 ) ) ( not ( = ?auto_306283 ?auto_306285 ) ) ( not ( = ?auto_306283 ?auto_306286 ) ) ( not ( = ?auto_306283 ?auto_306287 ) ) ( not ( = ?auto_306283 ?auto_306288 ) ) ( not ( = ?auto_306283 ?auto_306289 ) ) ( not ( = ?auto_306283 ?auto_306290 ) ) ( not ( = ?auto_306283 ?auto_306291 ) ) ( not ( = ?auto_306284 ?auto_306285 ) ) ( not ( = ?auto_306284 ?auto_306286 ) ) ( not ( = ?auto_306284 ?auto_306287 ) ) ( not ( = ?auto_306284 ?auto_306288 ) ) ( not ( = ?auto_306284 ?auto_306289 ) ) ( not ( = ?auto_306284 ?auto_306290 ) ) ( not ( = ?auto_306284 ?auto_306291 ) ) ( not ( = ?auto_306285 ?auto_306286 ) ) ( not ( = ?auto_306285 ?auto_306287 ) ) ( not ( = ?auto_306285 ?auto_306288 ) ) ( not ( = ?auto_306285 ?auto_306289 ) ) ( not ( = ?auto_306285 ?auto_306290 ) ) ( not ( = ?auto_306285 ?auto_306291 ) ) ( not ( = ?auto_306286 ?auto_306287 ) ) ( not ( = ?auto_306286 ?auto_306288 ) ) ( not ( = ?auto_306286 ?auto_306289 ) ) ( not ( = ?auto_306286 ?auto_306290 ) ) ( not ( = ?auto_306286 ?auto_306291 ) ) ( not ( = ?auto_306287 ?auto_306288 ) ) ( not ( = ?auto_306287 ?auto_306289 ) ) ( not ( = ?auto_306287 ?auto_306290 ) ) ( not ( = ?auto_306287 ?auto_306291 ) ) ( not ( = ?auto_306288 ?auto_306289 ) ) ( not ( = ?auto_306288 ?auto_306290 ) ) ( not ( = ?auto_306288 ?auto_306291 ) ) ( not ( = ?auto_306289 ?auto_306290 ) ) ( not ( = ?auto_306289 ?auto_306291 ) ) ( not ( = ?auto_306290 ?auto_306291 ) ) ( ON ?auto_306289 ?auto_306290 ) ( ON ?auto_306288 ?auto_306289 ) ( CLEAR ?auto_306286 ) ( ON ?auto_306287 ?auto_306288 ) ( CLEAR ?auto_306287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_306281 ?auto_306282 ?auto_306283 ?auto_306284 ?auto_306285 ?auto_306286 ?auto_306287 )
      ( MAKE-10PILE ?auto_306281 ?auto_306282 ?auto_306283 ?auto_306284 ?auto_306285 ?auto_306286 ?auto_306287 ?auto_306288 ?auto_306289 ?auto_306290 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306302 - BLOCK
      ?auto_306303 - BLOCK
      ?auto_306304 - BLOCK
      ?auto_306305 - BLOCK
      ?auto_306306 - BLOCK
      ?auto_306307 - BLOCK
      ?auto_306308 - BLOCK
      ?auto_306309 - BLOCK
      ?auto_306310 - BLOCK
      ?auto_306311 - BLOCK
    )
    :vars
    (
      ?auto_306312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306311 ?auto_306312 ) ( ON-TABLE ?auto_306302 ) ( ON ?auto_306303 ?auto_306302 ) ( ON ?auto_306304 ?auto_306303 ) ( ON ?auto_306305 ?auto_306304 ) ( ON ?auto_306306 ?auto_306305 ) ( ON ?auto_306307 ?auto_306306 ) ( not ( = ?auto_306302 ?auto_306303 ) ) ( not ( = ?auto_306302 ?auto_306304 ) ) ( not ( = ?auto_306302 ?auto_306305 ) ) ( not ( = ?auto_306302 ?auto_306306 ) ) ( not ( = ?auto_306302 ?auto_306307 ) ) ( not ( = ?auto_306302 ?auto_306308 ) ) ( not ( = ?auto_306302 ?auto_306309 ) ) ( not ( = ?auto_306302 ?auto_306310 ) ) ( not ( = ?auto_306302 ?auto_306311 ) ) ( not ( = ?auto_306302 ?auto_306312 ) ) ( not ( = ?auto_306303 ?auto_306304 ) ) ( not ( = ?auto_306303 ?auto_306305 ) ) ( not ( = ?auto_306303 ?auto_306306 ) ) ( not ( = ?auto_306303 ?auto_306307 ) ) ( not ( = ?auto_306303 ?auto_306308 ) ) ( not ( = ?auto_306303 ?auto_306309 ) ) ( not ( = ?auto_306303 ?auto_306310 ) ) ( not ( = ?auto_306303 ?auto_306311 ) ) ( not ( = ?auto_306303 ?auto_306312 ) ) ( not ( = ?auto_306304 ?auto_306305 ) ) ( not ( = ?auto_306304 ?auto_306306 ) ) ( not ( = ?auto_306304 ?auto_306307 ) ) ( not ( = ?auto_306304 ?auto_306308 ) ) ( not ( = ?auto_306304 ?auto_306309 ) ) ( not ( = ?auto_306304 ?auto_306310 ) ) ( not ( = ?auto_306304 ?auto_306311 ) ) ( not ( = ?auto_306304 ?auto_306312 ) ) ( not ( = ?auto_306305 ?auto_306306 ) ) ( not ( = ?auto_306305 ?auto_306307 ) ) ( not ( = ?auto_306305 ?auto_306308 ) ) ( not ( = ?auto_306305 ?auto_306309 ) ) ( not ( = ?auto_306305 ?auto_306310 ) ) ( not ( = ?auto_306305 ?auto_306311 ) ) ( not ( = ?auto_306305 ?auto_306312 ) ) ( not ( = ?auto_306306 ?auto_306307 ) ) ( not ( = ?auto_306306 ?auto_306308 ) ) ( not ( = ?auto_306306 ?auto_306309 ) ) ( not ( = ?auto_306306 ?auto_306310 ) ) ( not ( = ?auto_306306 ?auto_306311 ) ) ( not ( = ?auto_306306 ?auto_306312 ) ) ( not ( = ?auto_306307 ?auto_306308 ) ) ( not ( = ?auto_306307 ?auto_306309 ) ) ( not ( = ?auto_306307 ?auto_306310 ) ) ( not ( = ?auto_306307 ?auto_306311 ) ) ( not ( = ?auto_306307 ?auto_306312 ) ) ( not ( = ?auto_306308 ?auto_306309 ) ) ( not ( = ?auto_306308 ?auto_306310 ) ) ( not ( = ?auto_306308 ?auto_306311 ) ) ( not ( = ?auto_306308 ?auto_306312 ) ) ( not ( = ?auto_306309 ?auto_306310 ) ) ( not ( = ?auto_306309 ?auto_306311 ) ) ( not ( = ?auto_306309 ?auto_306312 ) ) ( not ( = ?auto_306310 ?auto_306311 ) ) ( not ( = ?auto_306310 ?auto_306312 ) ) ( not ( = ?auto_306311 ?auto_306312 ) ) ( ON ?auto_306310 ?auto_306311 ) ( ON ?auto_306309 ?auto_306310 ) ( CLEAR ?auto_306307 ) ( ON ?auto_306308 ?auto_306309 ) ( CLEAR ?auto_306308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_306302 ?auto_306303 ?auto_306304 ?auto_306305 ?auto_306306 ?auto_306307 ?auto_306308 )
      ( MAKE-10PILE ?auto_306302 ?auto_306303 ?auto_306304 ?auto_306305 ?auto_306306 ?auto_306307 ?auto_306308 ?auto_306309 ?auto_306310 ?auto_306311 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306323 - BLOCK
      ?auto_306324 - BLOCK
      ?auto_306325 - BLOCK
      ?auto_306326 - BLOCK
      ?auto_306327 - BLOCK
      ?auto_306328 - BLOCK
      ?auto_306329 - BLOCK
      ?auto_306330 - BLOCK
      ?auto_306331 - BLOCK
      ?auto_306332 - BLOCK
    )
    :vars
    (
      ?auto_306333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306332 ?auto_306333 ) ( ON-TABLE ?auto_306323 ) ( ON ?auto_306324 ?auto_306323 ) ( ON ?auto_306325 ?auto_306324 ) ( ON ?auto_306326 ?auto_306325 ) ( ON ?auto_306327 ?auto_306326 ) ( not ( = ?auto_306323 ?auto_306324 ) ) ( not ( = ?auto_306323 ?auto_306325 ) ) ( not ( = ?auto_306323 ?auto_306326 ) ) ( not ( = ?auto_306323 ?auto_306327 ) ) ( not ( = ?auto_306323 ?auto_306328 ) ) ( not ( = ?auto_306323 ?auto_306329 ) ) ( not ( = ?auto_306323 ?auto_306330 ) ) ( not ( = ?auto_306323 ?auto_306331 ) ) ( not ( = ?auto_306323 ?auto_306332 ) ) ( not ( = ?auto_306323 ?auto_306333 ) ) ( not ( = ?auto_306324 ?auto_306325 ) ) ( not ( = ?auto_306324 ?auto_306326 ) ) ( not ( = ?auto_306324 ?auto_306327 ) ) ( not ( = ?auto_306324 ?auto_306328 ) ) ( not ( = ?auto_306324 ?auto_306329 ) ) ( not ( = ?auto_306324 ?auto_306330 ) ) ( not ( = ?auto_306324 ?auto_306331 ) ) ( not ( = ?auto_306324 ?auto_306332 ) ) ( not ( = ?auto_306324 ?auto_306333 ) ) ( not ( = ?auto_306325 ?auto_306326 ) ) ( not ( = ?auto_306325 ?auto_306327 ) ) ( not ( = ?auto_306325 ?auto_306328 ) ) ( not ( = ?auto_306325 ?auto_306329 ) ) ( not ( = ?auto_306325 ?auto_306330 ) ) ( not ( = ?auto_306325 ?auto_306331 ) ) ( not ( = ?auto_306325 ?auto_306332 ) ) ( not ( = ?auto_306325 ?auto_306333 ) ) ( not ( = ?auto_306326 ?auto_306327 ) ) ( not ( = ?auto_306326 ?auto_306328 ) ) ( not ( = ?auto_306326 ?auto_306329 ) ) ( not ( = ?auto_306326 ?auto_306330 ) ) ( not ( = ?auto_306326 ?auto_306331 ) ) ( not ( = ?auto_306326 ?auto_306332 ) ) ( not ( = ?auto_306326 ?auto_306333 ) ) ( not ( = ?auto_306327 ?auto_306328 ) ) ( not ( = ?auto_306327 ?auto_306329 ) ) ( not ( = ?auto_306327 ?auto_306330 ) ) ( not ( = ?auto_306327 ?auto_306331 ) ) ( not ( = ?auto_306327 ?auto_306332 ) ) ( not ( = ?auto_306327 ?auto_306333 ) ) ( not ( = ?auto_306328 ?auto_306329 ) ) ( not ( = ?auto_306328 ?auto_306330 ) ) ( not ( = ?auto_306328 ?auto_306331 ) ) ( not ( = ?auto_306328 ?auto_306332 ) ) ( not ( = ?auto_306328 ?auto_306333 ) ) ( not ( = ?auto_306329 ?auto_306330 ) ) ( not ( = ?auto_306329 ?auto_306331 ) ) ( not ( = ?auto_306329 ?auto_306332 ) ) ( not ( = ?auto_306329 ?auto_306333 ) ) ( not ( = ?auto_306330 ?auto_306331 ) ) ( not ( = ?auto_306330 ?auto_306332 ) ) ( not ( = ?auto_306330 ?auto_306333 ) ) ( not ( = ?auto_306331 ?auto_306332 ) ) ( not ( = ?auto_306331 ?auto_306333 ) ) ( not ( = ?auto_306332 ?auto_306333 ) ) ( ON ?auto_306331 ?auto_306332 ) ( ON ?auto_306330 ?auto_306331 ) ( ON ?auto_306329 ?auto_306330 ) ( CLEAR ?auto_306327 ) ( ON ?auto_306328 ?auto_306329 ) ( CLEAR ?auto_306328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_306323 ?auto_306324 ?auto_306325 ?auto_306326 ?auto_306327 ?auto_306328 )
      ( MAKE-10PILE ?auto_306323 ?auto_306324 ?auto_306325 ?auto_306326 ?auto_306327 ?auto_306328 ?auto_306329 ?auto_306330 ?auto_306331 ?auto_306332 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306344 - BLOCK
      ?auto_306345 - BLOCK
      ?auto_306346 - BLOCK
      ?auto_306347 - BLOCK
      ?auto_306348 - BLOCK
      ?auto_306349 - BLOCK
      ?auto_306350 - BLOCK
      ?auto_306351 - BLOCK
      ?auto_306352 - BLOCK
      ?auto_306353 - BLOCK
    )
    :vars
    (
      ?auto_306354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306353 ?auto_306354 ) ( ON-TABLE ?auto_306344 ) ( ON ?auto_306345 ?auto_306344 ) ( ON ?auto_306346 ?auto_306345 ) ( ON ?auto_306347 ?auto_306346 ) ( ON ?auto_306348 ?auto_306347 ) ( not ( = ?auto_306344 ?auto_306345 ) ) ( not ( = ?auto_306344 ?auto_306346 ) ) ( not ( = ?auto_306344 ?auto_306347 ) ) ( not ( = ?auto_306344 ?auto_306348 ) ) ( not ( = ?auto_306344 ?auto_306349 ) ) ( not ( = ?auto_306344 ?auto_306350 ) ) ( not ( = ?auto_306344 ?auto_306351 ) ) ( not ( = ?auto_306344 ?auto_306352 ) ) ( not ( = ?auto_306344 ?auto_306353 ) ) ( not ( = ?auto_306344 ?auto_306354 ) ) ( not ( = ?auto_306345 ?auto_306346 ) ) ( not ( = ?auto_306345 ?auto_306347 ) ) ( not ( = ?auto_306345 ?auto_306348 ) ) ( not ( = ?auto_306345 ?auto_306349 ) ) ( not ( = ?auto_306345 ?auto_306350 ) ) ( not ( = ?auto_306345 ?auto_306351 ) ) ( not ( = ?auto_306345 ?auto_306352 ) ) ( not ( = ?auto_306345 ?auto_306353 ) ) ( not ( = ?auto_306345 ?auto_306354 ) ) ( not ( = ?auto_306346 ?auto_306347 ) ) ( not ( = ?auto_306346 ?auto_306348 ) ) ( not ( = ?auto_306346 ?auto_306349 ) ) ( not ( = ?auto_306346 ?auto_306350 ) ) ( not ( = ?auto_306346 ?auto_306351 ) ) ( not ( = ?auto_306346 ?auto_306352 ) ) ( not ( = ?auto_306346 ?auto_306353 ) ) ( not ( = ?auto_306346 ?auto_306354 ) ) ( not ( = ?auto_306347 ?auto_306348 ) ) ( not ( = ?auto_306347 ?auto_306349 ) ) ( not ( = ?auto_306347 ?auto_306350 ) ) ( not ( = ?auto_306347 ?auto_306351 ) ) ( not ( = ?auto_306347 ?auto_306352 ) ) ( not ( = ?auto_306347 ?auto_306353 ) ) ( not ( = ?auto_306347 ?auto_306354 ) ) ( not ( = ?auto_306348 ?auto_306349 ) ) ( not ( = ?auto_306348 ?auto_306350 ) ) ( not ( = ?auto_306348 ?auto_306351 ) ) ( not ( = ?auto_306348 ?auto_306352 ) ) ( not ( = ?auto_306348 ?auto_306353 ) ) ( not ( = ?auto_306348 ?auto_306354 ) ) ( not ( = ?auto_306349 ?auto_306350 ) ) ( not ( = ?auto_306349 ?auto_306351 ) ) ( not ( = ?auto_306349 ?auto_306352 ) ) ( not ( = ?auto_306349 ?auto_306353 ) ) ( not ( = ?auto_306349 ?auto_306354 ) ) ( not ( = ?auto_306350 ?auto_306351 ) ) ( not ( = ?auto_306350 ?auto_306352 ) ) ( not ( = ?auto_306350 ?auto_306353 ) ) ( not ( = ?auto_306350 ?auto_306354 ) ) ( not ( = ?auto_306351 ?auto_306352 ) ) ( not ( = ?auto_306351 ?auto_306353 ) ) ( not ( = ?auto_306351 ?auto_306354 ) ) ( not ( = ?auto_306352 ?auto_306353 ) ) ( not ( = ?auto_306352 ?auto_306354 ) ) ( not ( = ?auto_306353 ?auto_306354 ) ) ( ON ?auto_306352 ?auto_306353 ) ( ON ?auto_306351 ?auto_306352 ) ( ON ?auto_306350 ?auto_306351 ) ( CLEAR ?auto_306348 ) ( ON ?auto_306349 ?auto_306350 ) ( CLEAR ?auto_306349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_306344 ?auto_306345 ?auto_306346 ?auto_306347 ?auto_306348 ?auto_306349 )
      ( MAKE-10PILE ?auto_306344 ?auto_306345 ?auto_306346 ?auto_306347 ?auto_306348 ?auto_306349 ?auto_306350 ?auto_306351 ?auto_306352 ?auto_306353 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306365 - BLOCK
      ?auto_306366 - BLOCK
      ?auto_306367 - BLOCK
      ?auto_306368 - BLOCK
      ?auto_306369 - BLOCK
      ?auto_306370 - BLOCK
      ?auto_306371 - BLOCK
      ?auto_306372 - BLOCK
      ?auto_306373 - BLOCK
      ?auto_306374 - BLOCK
    )
    :vars
    (
      ?auto_306375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306374 ?auto_306375 ) ( ON-TABLE ?auto_306365 ) ( ON ?auto_306366 ?auto_306365 ) ( ON ?auto_306367 ?auto_306366 ) ( ON ?auto_306368 ?auto_306367 ) ( not ( = ?auto_306365 ?auto_306366 ) ) ( not ( = ?auto_306365 ?auto_306367 ) ) ( not ( = ?auto_306365 ?auto_306368 ) ) ( not ( = ?auto_306365 ?auto_306369 ) ) ( not ( = ?auto_306365 ?auto_306370 ) ) ( not ( = ?auto_306365 ?auto_306371 ) ) ( not ( = ?auto_306365 ?auto_306372 ) ) ( not ( = ?auto_306365 ?auto_306373 ) ) ( not ( = ?auto_306365 ?auto_306374 ) ) ( not ( = ?auto_306365 ?auto_306375 ) ) ( not ( = ?auto_306366 ?auto_306367 ) ) ( not ( = ?auto_306366 ?auto_306368 ) ) ( not ( = ?auto_306366 ?auto_306369 ) ) ( not ( = ?auto_306366 ?auto_306370 ) ) ( not ( = ?auto_306366 ?auto_306371 ) ) ( not ( = ?auto_306366 ?auto_306372 ) ) ( not ( = ?auto_306366 ?auto_306373 ) ) ( not ( = ?auto_306366 ?auto_306374 ) ) ( not ( = ?auto_306366 ?auto_306375 ) ) ( not ( = ?auto_306367 ?auto_306368 ) ) ( not ( = ?auto_306367 ?auto_306369 ) ) ( not ( = ?auto_306367 ?auto_306370 ) ) ( not ( = ?auto_306367 ?auto_306371 ) ) ( not ( = ?auto_306367 ?auto_306372 ) ) ( not ( = ?auto_306367 ?auto_306373 ) ) ( not ( = ?auto_306367 ?auto_306374 ) ) ( not ( = ?auto_306367 ?auto_306375 ) ) ( not ( = ?auto_306368 ?auto_306369 ) ) ( not ( = ?auto_306368 ?auto_306370 ) ) ( not ( = ?auto_306368 ?auto_306371 ) ) ( not ( = ?auto_306368 ?auto_306372 ) ) ( not ( = ?auto_306368 ?auto_306373 ) ) ( not ( = ?auto_306368 ?auto_306374 ) ) ( not ( = ?auto_306368 ?auto_306375 ) ) ( not ( = ?auto_306369 ?auto_306370 ) ) ( not ( = ?auto_306369 ?auto_306371 ) ) ( not ( = ?auto_306369 ?auto_306372 ) ) ( not ( = ?auto_306369 ?auto_306373 ) ) ( not ( = ?auto_306369 ?auto_306374 ) ) ( not ( = ?auto_306369 ?auto_306375 ) ) ( not ( = ?auto_306370 ?auto_306371 ) ) ( not ( = ?auto_306370 ?auto_306372 ) ) ( not ( = ?auto_306370 ?auto_306373 ) ) ( not ( = ?auto_306370 ?auto_306374 ) ) ( not ( = ?auto_306370 ?auto_306375 ) ) ( not ( = ?auto_306371 ?auto_306372 ) ) ( not ( = ?auto_306371 ?auto_306373 ) ) ( not ( = ?auto_306371 ?auto_306374 ) ) ( not ( = ?auto_306371 ?auto_306375 ) ) ( not ( = ?auto_306372 ?auto_306373 ) ) ( not ( = ?auto_306372 ?auto_306374 ) ) ( not ( = ?auto_306372 ?auto_306375 ) ) ( not ( = ?auto_306373 ?auto_306374 ) ) ( not ( = ?auto_306373 ?auto_306375 ) ) ( not ( = ?auto_306374 ?auto_306375 ) ) ( ON ?auto_306373 ?auto_306374 ) ( ON ?auto_306372 ?auto_306373 ) ( ON ?auto_306371 ?auto_306372 ) ( ON ?auto_306370 ?auto_306371 ) ( CLEAR ?auto_306368 ) ( ON ?auto_306369 ?auto_306370 ) ( CLEAR ?auto_306369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_306365 ?auto_306366 ?auto_306367 ?auto_306368 ?auto_306369 )
      ( MAKE-10PILE ?auto_306365 ?auto_306366 ?auto_306367 ?auto_306368 ?auto_306369 ?auto_306370 ?auto_306371 ?auto_306372 ?auto_306373 ?auto_306374 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306386 - BLOCK
      ?auto_306387 - BLOCK
      ?auto_306388 - BLOCK
      ?auto_306389 - BLOCK
      ?auto_306390 - BLOCK
      ?auto_306391 - BLOCK
      ?auto_306392 - BLOCK
      ?auto_306393 - BLOCK
      ?auto_306394 - BLOCK
      ?auto_306395 - BLOCK
    )
    :vars
    (
      ?auto_306396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306395 ?auto_306396 ) ( ON-TABLE ?auto_306386 ) ( ON ?auto_306387 ?auto_306386 ) ( ON ?auto_306388 ?auto_306387 ) ( ON ?auto_306389 ?auto_306388 ) ( not ( = ?auto_306386 ?auto_306387 ) ) ( not ( = ?auto_306386 ?auto_306388 ) ) ( not ( = ?auto_306386 ?auto_306389 ) ) ( not ( = ?auto_306386 ?auto_306390 ) ) ( not ( = ?auto_306386 ?auto_306391 ) ) ( not ( = ?auto_306386 ?auto_306392 ) ) ( not ( = ?auto_306386 ?auto_306393 ) ) ( not ( = ?auto_306386 ?auto_306394 ) ) ( not ( = ?auto_306386 ?auto_306395 ) ) ( not ( = ?auto_306386 ?auto_306396 ) ) ( not ( = ?auto_306387 ?auto_306388 ) ) ( not ( = ?auto_306387 ?auto_306389 ) ) ( not ( = ?auto_306387 ?auto_306390 ) ) ( not ( = ?auto_306387 ?auto_306391 ) ) ( not ( = ?auto_306387 ?auto_306392 ) ) ( not ( = ?auto_306387 ?auto_306393 ) ) ( not ( = ?auto_306387 ?auto_306394 ) ) ( not ( = ?auto_306387 ?auto_306395 ) ) ( not ( = ?auto_306387 ?auto_306396 ) ) ( not ( = ?auto_306388 ?auto_306389 ) ) ( not ( = ?auto_306388 ?auto_306390 ) ) ( not ( = ?auto_306388 ?auto_306391 ) ) ( not ( = ?auto_306388 ?auto_306392 ) ) ( not ( = ?auto_306388 ?auto_306393 ) ) ( not ( = ?auto_306388 ?auto_306394 ) ) ( not ( = ?auto_306388 ?auto_306395 ) ) ( not ( = ?auto_306388 ?auto_306396 ) ) ( not ( = ?auto_306389 ?auto_306390 ) ) ( not ( = ?auto_306389 ?auto_306391 ) ) ( not ( = ?auto_306389 ?auto_306392 ) ) ( not ( = ?auto_306389 ?auto_306393 ) ) ( not ( = ?auto_306389 ?auto_306394 ) ) ( not ( = ?auto_306389 ?auto_306395 ) ) ( not ( = ?auto_306389 ?auto_306396 ) ) ( not ( = ?auto_306390 ?auto_306391 ) ) ( not ( = ?auto_306390 ?auto_306392 ) ) ( not ( = ?auto_306390 ?auto_306393 ) ) ( not ( = ?auto_306390 ?auto_306394 ) ) ( not ( = ?auto_306390 ?auto_306395 ) ) ( not ( = ?auto_306390 ?auto_306396 ) ) ( not ( = ?auto_306391 ?auto_306392 ) ) ( not ( = ?auto_306391 ?auto_306393 ) ) ( not ( = ?auto_306391 ?auto_306394 ) ) ( not ( = ?auto_306391 ?auto_306395 ) ) ( not ( = ?auto_306391 ?auto_306396 ) ) ( not ( = ?auto_306392 ?auto_306393 ) ) ( not ( = ?auto_306392 ?auto_306394 ) ) ( not ( = ?auto_306392 ?auto_306395 ) ) ( not ( = ?auto_306392 ?auto_306396 ) ) ( not ( = ?auto_306393 ?auto_306394 ) ) ( not ( = ?auto_306393 ?auto_306395 ) ) ( not ( = ?auto_306393 ?auto_306396 ) ) ( not ( = ?auto_306394 ?auto_306395 ) ) ( not ( = ?auto_306394 ?auto_306396 ) ) ( not ( = ?auto_306395 ?auto_306396 ) ) ( ON ?auto_306394 ?auto_306395 ) ( ON ?auto_306393 ?auto_306394 ) ( ON ?auto_306392 ?auto_306393 ) ( ON ?auto_306391 ?auto_306392 ) ( CLEAR ?auto_306389 ) ( ON ?auto_306390 ?auto_306391 ) ( CLEAR ?auto_306390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_306386 ?auto_306387 ?auto_306388 ?auto_306389 ?auto_306390 )
      ( MAKE-10PILE ?auto_306386 ?auto_306387 ?auto_306388 ?auto_306389 ?auto_306390 ?auto_306391 ?auto_306392 ?auto_306393 ?auto_306394 ?auto_306395 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306407 - BLOCK
      ?auto_306408 - BLOCK
      ?auto_306409 - BLOCK
      ?auto_306410 - BLOCK
      ?auto_306411 - BLOCK
      ?auto_306412 - BLOCK
      ?auto_306413 - BLOCK
      ?auto_306414 - BLOCK
      ?auto_306415 - BLOCK
      ?auto_306416 - BLOCK
    )
    :vars
    (
      ?auto_306417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306416 ?auto_306417 ) ( ON-TABLE ?auto_306407 ) ( ON ?auto_306408 ?auto_306407 ) ( ON ?auto_306409 ?auto_306408 ) ( not ( = ?auto_306407 ?auto_306408 ) ) ( not ( = ?auto_306407 ?auto_306409 ) ) ( not ( = ?auto_306407 ?auto_306410 ) ) ( not ( = ?auto_306407 ?auto_306411 ) ) ( not ( = ?auto_306407 ?auto_306412 ) ) ( not ( = ?auto_306407 ?auto_306413 ) ) ( not ( = ?auto_306407 ?auto_306414 ) ) ( not ( = ?auto_306407 ?auto_306415 ) ) ( not ( = ?auto_306407 ?auto_306416 ) ) ( not ( = ?auto_306407 ?auto_306417 ) ) ( not ( = ?auto_306408 ?auto_306409 ) ) ( not ( = ?auto_306408 ?auto_306410 ) ) ( not ( = ?auto_306408 ?auto_306411 ) ) ( not ( = ?auto_306408 ?auto_306412 ) ) ( not ( = ?auto_306408 ?auto_306413 ) ) ( not ( = ?auto_306408 ?auto_306414 ) ) ( not ( = ?auto_306408 ?auto_306415 ) ) ( not ( = ?auto_306408 ?auto_306416 ) ) ( not ( = ?auto_306408 ?auto_306417 ) ) ( not ( = ?auto_306409 ?auto_306410 ) ) ( not ( = ?auto_306409 ?auto_306411 ) ) ( not ( = ?auto_306409 ?auto_306412 ) ) ( not ( = ?auto_306409 ?auto_306413 ) ) ( not ( = ?auto_306409 ?auto_306414 ) ) ( not ( = ?auto_306409 ?auto_306415 ) ) ( not ( = ?auto_306409 ?auto_306416 ) ) ( not ( = ?auto_306409 ?auto_306417 ) ) ( not ( = ?auto_306410 ?auto_306411 ) ) ( not ( = ?auto_306410 ?auto_306412 ) ) ( not ( = ?auto_306410 ?auto_306413 ) ) ( not ( = ?auto_306410 ?auto_306414 ) ) ( not ( = ?auto_306410 ?auto_306415 ) ) ( not ( = ?auto_306410 ?auto_306416 ) ) ( not ( = ?auto_306410 ?auto_306417 ) ) ( not ( = ?auto_306411 ?auto_306412 ) ) ( not ( = ?auto_306411 ?auto_306413 ) ) ( not ( = ?auto_306411 ?auto_306414 ) ) ( not ( = ?auto_306411 ?auto_306415 ) ) ( not ( = ?auto_306411 ?auto_306416 ) ) ( not ( = ?auto_306411 ?auto_306417 ) ) ( not ( = ?auto_306412 ?auto_306413 ) ) ( not ( = ?auto_306412 ?auto_306414 ) ) ( not ( = ?auto_306412 ?auto_306415 ) ) ( not ( = ?auto_306412 ?auto_306416 ) ) ( not ( = ?auto_306412 ?auto_306417 ) ) ( not ( = ?auto_306413 ?auto_306414 ) ) ( not ( = ?auto_306413 ?auto_306415 ) ) ( not ( = ?auto_306413 ?auto_306416 ) ) ( not ( = ?auto_306413 ?auto_306417 ) ) ( not ( = ?auto_306414 ?auto_306415 ) ) ( not ( = ?auto_306414 ?auto_306416 ) ) ( not ( = ?auto_306414 ?auto_306417 ) ) ( not ( = ?auto_306415 ?auto_306416 ) ) ( not ( = ?auto_306415 ?auto_306417 ) ) ( not ( = ?auto_306416 ?auto_306417 ) ) ( ON ?auto_306415 ?auto_306416 ) ( ON ?auto_306414 ?auto_306415 ) ( ON ?auto_306413 ?auto_306414 ) ( ON ?auto_306412 ?auto_306413 ) ( ON ?auto_306411 ?auto_306412 ) ( CLEAR ?auto_306409 ) ( ON ?auto_306410 ?auto_306411 ) ( CLEAR ?auto_306410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_306407 ?auto_306408 ?auto_306409 ?auto_306410 )
      ( MAKE-10PILE ?auto_306407 ?auto_306408 ?auto_306409 ?auto_306410 ?auto_306411 ?auto_306412 ?auto_306413 ?auto_306414 ?auto_306415 ?auto_306416 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306428 - BLOCK
      ?auto_306429 - BLOCK
      ?auto_306430 - BLOCK
      ?auto_306431 - BLOCK
      ?auto_306432 - BLOCK
      ?auto_306433 - BLOCK
      ?auto_306434 - BLOCK
      ?auto_306435 - BLOCK
      ?auto_306436 - BLOCK
      ?auto_306437 - BLOCK
    )
    :vars
    (
      ?auto_306438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306437 ?auto_306438 ) ( ON-TABLE ?auto_306428 ) ( ON ?auto_306429 ?auto_306428 ) ( ON ?auto_306430 ?auto_306429 ) ( not ( = ?auto_306428 ?auto_306429 ) ) ( not ( = ?auto_306428 ?auto_306430 ) ) ( not ( = ?auto_306428 ?auto_306431 ) ) ( not ( = ?auto_306428 ?auto_306432 ) ) ( not ( = ?auto_306428 ?auto_306433 ) ) ( not ( = ?auto_306428 ?auto_306434 ) ) ( not ( = ?auto_306428 ?auto_306435 ) ) ( not ( = ?auto_306428 ?auto_306436 ) ) ( not ( = ?auto_306428 ?auto_306437 ) ) ( not ( = ?auto_306428 ?auto_306438 ) ) ( not ( = ?auto_306429 ?auto_306430 ) ) ( not ( = ?auto_306429 ?auto_306431 ) ) ( not ( = ?auto_306429 ?auto_306432 ) ) ( not ( = ?auto_306429 ?auto_306433 ) ) ( not ( = ?auto_306429 ?auto_306434 ) ) ( not ( = ?auto_306429 ?auto_306435 ) ) ( not ( = ?auto_306429 ?auto_306436 ) ) ( not ( = ?auto_306429 ?auto_306437 ) ) ( not ( = ?auto_306429 ?auto_306438 ) ) ( not ( = ?auto_306430 ?auto_306431 ) ) ( not ( = ?auto_306430 ?auto_306432 ) ) ( not ( = ?auto_306430 ?auto_306433 ) ) ( not ( = ?auto_306430 ?auto_306434 ) ) ( not ( = ?auto_306430 ?auto_306435 ) ) ( not ( = ?auto_306430 ?auto_306436 ) ) ( not ( = ?auto_306430 ?auto_306437 ) ) ( not ( = ?auto_306430 ?auto_306438 ) ) ( not ( = ?auto_306431 ?auto_306432 ) ) ( not ( = ?auto_306431 ?auto_306433 ) ) ( not ( = ?auto_306431 ?auto_306434 ) ) ( not ( = ?auto_306431 ?auto_306435 ) ) ( not ( = ?auto_306431 ?auto_306436 ) ) ( not ( = ?auto_306431 ?auto_306437 ) ) ( not ( = ?auto_306431 ?auto_306438 ) ) ( not ( = ?auto_306432 ?auto_306433 ) ) ( not ( = ?auto_306432 ?auto_306434 ) ) ( not ( = ?auto_306432 ?auto_306435 ) ) ( not ( = ?auto_306432 ?auto_306436 ) ) ( not ( = ?auto_306432 ?auto_306437 ) ) ( not ( = ?auto_306432 ?auto_306438 ) ) ( not ( = ?auto_306433 ?auto_306434 ) ) ( not ( = ?auto_306433 ?auto_306435 ) ) ( not ( = ?auto_306433 ?auto_306436 ) ) ( not ( = ?auto_306433 ?auto_306437 ) ) ( not ( = ?auto_306433 ?auto_306438 ) ) ( not ( = ?auto_306434 ?auto_306435 ) ) ( not ( = ?auto_306434 ?auto_306436 ) ) ( not ( = ?auto_306434 ?auto_306437 ) ) ( not ( = ?auto_306434 ?auto_306438 ) ) ( not ( = ?auto_306435 ?auto_306436 ) ) ( not ( = ?auto_306435 ?auto_306437 ) ) ( not ( = ?auto_306435 ?auto_306438 ) ) ( not ( = ?auto_306436 ?auto_306437 ) ) ( not ( = ?auto_306436 ?auto_306438 ) ) ( not ( = ?auto_306437 ?auto_306438 ) ) ( ON ?auto_306436 ?auto_306437 ) ( ON ?auto_306435 ?auto_306436 ) ( ON ?auto_306434 ?auto_306435 ) ( ON ?auto_306433 ?auto_306434 ) ( ON ?auto_306432 ?auto_306433 ) ( CLEAR ?auto_306430 ) ( ON ?auto_306431 ?auto_306432 ) ( CLEAR ?auto_306431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_306428 ?auto_306429 ?auto_306430 ?auto_306431 )
      ( MAKE-10PILE ?auto_306428 ?auto_306429 ?auto_306430 ?auto_306431 ?auto_306432 ?auto_306433 ?auto_306434 ?auto_306435 ?auto_306436 ?auto_306437 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306449 - BLOCK
      ?auto_306450 - BLOCK
      ?auto_306451 - BLOCK
      ?auto_306452 - BLOCK
      ?auto_306453 - BLOCK
      ?auto_306454 - BLOCK
      ?auto_306455 - BLOCK
      ?auto_306456 - BLOCK
      ?auto_306457 - BLOCK
      ?auto_306458 - BLOCK
    )
    :vars
    (
      ?auto_306459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306458 ?auto_306459 ) ( ON-TABLE ?auto_306449 ) ( ON ?auto_306450 ?auto_306449 ) ( not ( = ?auto_306449 ?auto_306450 ) ) ( not ( = ?auto_306449 ?auto_306451 ) ) ( not ( = ?auto_306449 ?auto_306452 ) ) ( not ( = ?auto_306449 ?auto_306453 ) ) ( not ( = ?auto_306449 ?auto_306454 ) ) ( not ( = ?auto_306449 ?auto_306455 ) ) ( not ( = ?auto_306449 ?auto_306456 ) ) ( not ( = ?auto_306449 ?auto_306457 ) ) ( not ( = ?auto_306449 ?auto_306458 ) ) ( not ( = ?auto_306449 ?auto_306459 ) ) ( not ( = ?auto_306450 ?auto_306451 ) ) ( not ( = ?auto_306450 ?auto_306452 ) ) ( not ( = ?auto_306450 ?auto_306453 ) ) ( not ( = ?auto_306450 ?auto_306454 ) ) ( not ( = ?auto_306450 ?auto_306455 ) ) ( not ( = ?auto_306450 ?auto_306456 ) ) ( not ( = ?auto_306450 ?auto_306457 ) ) ( not ( = ?auto_306450 ?auto_306458 ) ) ( not ( = ?auto_306450 ?auto_306459 ) ) ( not ( = ?auto_306451 ?auto_306452 ) ) ( not ( = ?auto_306451 ?auto_306453 ) ) ( not ( = ?auto_306451 ?auto_306454 ) ) ( not ( = ?auto_306451 ?auto_306455 ) ) ( not ( = ?auto_306451 ?auto_306456 ) ) ( not ( = ?auto_306451 ?auto_306457 ) ) ( not ( = ?auto_306451 ?auto_306458 ) ) ( not ( = ?auto_306451 ?auto_306459 ) ) ( not ( = ?auto_306452 ?auto_306453 ) ) ( not ( = ?auto_306452 ?auto_306454 ) ) ( not ( = ?auto_306452 ?auto_306455 ) ) ( not ( = ?auto_306452 ?auto_306456 ) ) ( not ( = ?auto_306452 ?auto_306457 ) ) ( not ( = ?auto_306452 ?auto_306458 ) ) ( not ( = ?auto_306452 ?auto_306459 ) ) ( not ( = ?auto_306453 ?auto_306454 ) ) ( not ( = ?auto_306453 ?auto_306455 ) ) ( not ( = ?auto_306453 ?auto_306456 ) ) ( not ( = ?auto_306453 ?auto_306457 ) ) ( not ( = ?auto_306453 ?auto_306458 ) ) ( not ( = ?auto_306453 ?auto_306459 ) ) ( not ( = ?auto_306454 ?auto_306455 ) ) ( not ( = ?auto_306454 ?auto_306456 ) ) ( not ( = ?auto_306454 ?auto_306457 ) ) ( not ( = ?auto_306454 ?auto_306458 ) ) ( not ( = ?auto_306454 ?auto_306459 ) ) ( not ( = ?auto_306455 ?auto_306456 ) ) ( not ( = ?auto_306455 ?auto_306457 ) ) ( not ( = ?auto_306455 ?auto_306458 ) ) ( not ( = ?auto_306455 ?auto_306459 ) ) ( not ( = ?auto_306456 ?auto_306457 ) ) ( not ( = ?auto_306456 ?auto_306458 ) ) ( not ( = ?auto_306456 ?auto_306459 ) ) ( not ( = ?auto_306457 ?auto_306458 ) ) ( not ( = ?auto_306457 ?auto_306459 ) ) ( not ( = ?auto_306458 ?auto_306459 ) ) ( ON ?auto_306457 ?auto_306458 ) ( ON ?auto_306456 ?auto_306457 ) ( ON ?auto_306455 ?auto_306456 ) ( ON ?auto_306454 ?auto_306455 ) ( ON ?auto_306453 ?auto_306454 ) ( ON ?auto_306452 ?auto_306453 ) ( CLEAR ?auto_306450 ) ( ON ?auto_306451 ?auto_306452 ) ( CLEAR ?auto_306451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_306449 ?auto_306450 ?auto_306451 )
      ( MAKE-10PILE ?auto_306449 ?auto_306450 ?auto_306451 ?auto_306452 ?auto_306453 ?auto_306454 ?auto_306455 ?auto_306456 ?auto_306457 ?auto_306458 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306470 - BLOCK
      ?auto_306471 - BLOCK
      ?auto_306472 - BLOCK
      ?auto_306473 - BLOCK
      ?auto_306474 - BLOCK
      ?auto_306475 - BLOCK
      ?auto_306476 - BLOCK
      ?auto_306477 - BLOCK
      ?auto_306478 - BLOCK
      ?auto_306479 - BLOCK
    )
    :vars
    (
      ?auto_306480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306479 ?auto_306480 ) ( ON-TABLE ?auto_306470 ) ( ON ?auto_306471 ?auto_306470 ) ( not ( = ?auto_306470 ?auto_306471 ) ) ( not ( = ?auto_306470 ?auto_306472 ) ) ( not ( = ?auto_306470 ?auto_306473 ) ) ( not ( = ?auto_306470 ?auto_306474 ) ) ( not ( = ?auto_306470 ?auto_306475 ) ) ( not ( = ?auto_306470 ?auto_306476 ) ) ( not ( = ?auto_306470 ?auto_306477 ) ) ( not ( = ?auto_306470 ?auto_306478 ) ) ( not ( = ?auto_306470 ?auto_306479 ) ) ( not ( = ?auto_306470 ?auto_306480 ) ) ( not ( = ?auto_306471 ?auto_306472 ) ) ( not ( = ?auto_306471 ?auto_306473 ) ) ( not ( = ?auto_306471 ?auto_306474 ) ) ( not ( = ?auto_306471 ?auto_306475 ) ) ( not ( = ?auto_306471 ?auto_306476 ) ) ( not ( = ?auto_306471 ?auto_306477 ) ) ( not ( = ?auto_306471 ?auto_306478 ) ) ( not ( = ?auto_306471 ?auto_306479 ) ) ( not ( = ?auto_306471 ?auto_306480 ) ) ( not ( = ?auto_306472 ?auto_306473 ) ) ( not ( = ?auto_306472 ?auto_306474 ) ) ( not ( = ?auto_306472 ?auto_306475 ) ) ( not ( = ?auto_306472 ?auto_306476 ) ) ( not ( = ?auto_306472 ?auto_306477 ) ) ( not ( = ?auto_306472 ?auto_306478 ) ) ( not ( = ?auto_306472 ?auto_306479 ) ) ( not ( = ?auto_306472 ?auto_306480 ) ) ( not ( = ?auto_306473 ?auto_306474 ) ) ( not ( = ?auto_306473 ?auto_306475 ) ) ( not ( = ?auto_306473 ?auto_306476 ) ) ( not ( = ?auto_306473 ?auto_306477 ) ) ( not ( = ?auto_306473 ?auto_306478 ) ) ( not ( = ?auto_306473 ?auto_306479 ) ) ( not ( = ?auto_306473 ?auto_306480 ) ) ( not ( = ?auto_306474 ?auto_306475 ) ) ( not ( = ?auto_306474 ?auto_306476 ) ) ( not ( = ?auto_306474 ?auto_306477 ) ) ( not ( = ?auto_306474 ?auto_306478 ) ) ( not ( = ?auto_306474 ?auto_306479 ) ) ( not ( = ?auto_306474 ?auto_306480 ) ) ( not ( = ?auto_306475 ?auto_306476 ) ) ( not ( = ?auto_306475 ?auto_306477 ) ) ( not ( = ?auto_306475 ?auto_306478 ) ) ( not ( = ?auto_306475 ?auto_306479 ) ) ( not ( = ?auto_306475 ?auto_306480 ) ) ( not ( = ?auto_306476 ?auto_306477 ) ) ( not ( = ?auto_306476 ?auto_306478 ) ) ( not ( = ?auto_306476 ?auto_306479 ) ) ( not ( = ?auto_306476 ?auto_306480 ) ) ( not ( = ?auto_306477 ?auto_306478 ) ) ( not ( = ?auto_306477 ?auto_306479 ) ) ( not ( = ?auto_306477 ?auto_306480 ) ) ( not ( = ?auto_306478 ?auto_306479 ) ) ( not ( = ?auto_306478 ?auto_306480 ) ) ( not ( = ?auto_306479 ?auto_306480 ) ) ( ON ?auto_306478 ?auto_306479 ) ( ON ?auto_306477 ?auto_306478 ) ( ON ?auto_306476 ?auto_306477 ) ( ON ?auto_306475 ?auto_306476 ) ( ON ?auto_306474 ?auto_306475 ) ( ON ?auto_306473 ?auto_306474 ) ( CLEAR ?auto_306471 ) ( ON ?auto_306472 ?auto_306473 ) ( CLEAR ?auto_306472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_306470 ?auto_306471 ?auto_306472 )
      ( MAKE-10PILE ?auto_306470 ?auto_306471 ?auto_306472 ?auto_306473 ?auto_306474 ?auto_306475 ?auto_306476 ?auto_306477 ?auto_306478 ?auto_306479 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306491 - BLOCK
      ?auto_306492 - BLOCK
      ?auto_306493 - BLOCK
      ?auto_306494 - BLOCK
      ?auto_306495 - BLOCK
      ?auto_306496 - BLOCK
      ?auto_306497 - BLOCK
      ?auto_306498 - BLOCK
      ?auto_306499 - BLOCK
      ?auto_306500 - BLOCK
    )
    :vars
    (
      ?auto_306501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306500 ?auto_306501 ) ( ON-TABLE ?auto_306491 ) ( not ( = ?auto_306491 ?auto_306492 ) ) ( not ( = ?auto_306491 ?auto_306493 ) ) ( not ( = ?auto_306491 ?auto_306494 ) ) ( not ( = ?auto_306491 ?auto_306495 ) ) ( not ( = ?auto_306491 ?auto_306496 ) ) ( not ( = ?auto_306491 ?auto_306497 ) ) ( not ( = ?auto_306491 ?auto_306498 ) ) ( not ( = ?auto_306491 ?auto_306499 ) ) ( not ( = ?auto_306491 ?auto_306500 ) ) ( not ( = ?auto_306491 ?auto_306501 ) ) ( not ( = ?auto_306492 ?auto_306493 ) ) ( not ( = ?auto_306492 ?auto_306494 ) ) ( not ( = ?auto_306492 ?auto_306495 ) ) ( not ( = ?auto_306492 ?auto_306496 ) ) ( not ( = ?auto_306492 ?auto_306497 ) ) ( not ( = ?auto_306492 ?auto_306498 ) ) ( not ( = ?auto_306492 ?auto_306499 ) ) ( not ( = ?auto_306492 ?auto_306500 ) ) ( not ( = ?auto_306492 ?auto_306501 ) ) ( not ( = ?auto_306493 ?auto_306494 ) ) ( not ( = ?auto_306493 ?auto_306495 ) ) ( not ( = ?auto_306493 ?auto_306496 ) ) ( not ( = ?auto_306493 ?auto_306497 ) ) ( not ( = ?auto_306493 ?auto_306498 ) ) ( not ( = ?auto_306493 ?auto_306499 ) ) ( not ( = ?auto_306493 ?auto_306500 ) ) ( not ( = ?auto_306493 ?auto_306501 ) ) ( not ( = ?auto_306494 ?auto_306495 ) ) ( not ( = ?auto_306494 ?auto_306496 ) ) ( not ( = ?auto_306494 ?auto_306497 ) ) ( not ( = ?auto_306494 ?auto_306498 ) ) ( not ( = ?auto_306494 ?auto_306499 ) ) ( not ( = ?auto_306494 ?auto_306500 ) ) ( not ( = ?auto_306494 ?auto_306501 ) ) ( not ( = ?auto_306495 ?auto_306496 ) ) ( not ( = ?auto_306495 ?auto_306497 ) ) ( not ( = ?auto_306495 ?auto_306498 ) ) ( not ( = ?auto_306495 ?auto_306499 ) ) ( not ( = ?auto_306495 ?auto_306500 ) ) ( not ( = ?auto_306495 ?auto_306501 ) ) ( not ( = ?auto_306496 ?auto_306497 ) ) ( not ( = ?auto_306496 ?auto_306498 ) ) ( not ( = ?auto_306496 ?auto_306499 ) ) ( not ( = ?auto_306496 ?auto_306500 ) ) ( not ( = ?auto_306496 ?auto_306501 ) ) ( not ( = ?auto_306497 ?auto_306498 ) ) ( not ( = ?auto_306497 ?auto_306499 ) ) ( not ( = ?auto_306497 ?auto_306500 ) ) ( not ( = ?auto_306497 ?auto_306501 ) ) ( not ( = ?auto_306498 ?auto_306499 ) ) ( not ( = ?auto_306498 ?auto_306500 ) ) ( not ( = ?auto_306498 ?auto_306501 ) ) ( not ( = ?auto_306499 ?auto_306500 ) ) ( not ( = ?auto_306499 ?auto_306501 ) ) ( not ( = ?auto_306500 ?auto_306501 ) ) ( ON ?auto_306499 ?auto_306500 ) ( ON ?auto_306498 ?auto_306499 ) ( ON ?auto_306497 ?auto_306498 ) ( ON ?auto_306496 ?auto_306497 ) ( ON ?auto_306495 ?auto_306496 ) ( ON ?auto_306494 ?auto_306495 ) ( ON ?auto_306493 ?auto_306494 ) ( CLEAR ?auto_306491 ) ( ON ?auto_306492 ?auto_306493 ) ( CLEAR ?auto_306492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_306491 ?auto_306492 )
      ( MAKE-10PILE ?auto_306491 ?auto_306492 ?auto_306493 ?auto_306494 ?auto_306495 ?auto_306496 ?auto_306497 ?auto_306498 ?auto_306499 ?auto_306500 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306512 - BLOCK
      ?auto_306513 - BLOCK
      ?auto_306514 - BLOCK
      ?auto_306515 - BLOCK
      ?auto_306516 - BLOCK
      ?auto_306517 - BLOCK
      ?auto_306518 - BLOCK
      ?auto_306519 - BLOCK
      ?auto_306520 - BLOCK
      ?auto_306521 - BLOCK
    )
    :vars
    (
      ?auto_306522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306521 ?auto_306522 ) ( ON-TABLE ?auto_306512 ) ( not ( = ?auto_306512 ?auto_306513 ) ) ( not ( = ?auto_306512 ?auto_306514 ) ) ( not ( = ?auto_306512 ?auto_306515 ) ) ( not ( = ?auto_306512 ?auto_306516 ) ) ( not ( = ?auto_306512 ?auto_306517 ) ) ( not ( = ?auto_306512 ?auto_306518 ) ) ( not ( = ?auto_306512 ?auto_306519 ) ) ( not ( = ?auto_306512 ?auto_306520 ) ) ( not ( = ?auto_306512 ?auto_306521 ) ) ( not ( = ?auto_306512 ?auto_306522 ) ) ( not ( = ?auto_306513 ?auto_306514 ) ) ( not ( = ?auto_306513 ?auto_306515 ) ) ( not ( = ?auto_306513 ?auto_306516 ) ) ( not ( = ?auto_306513 ?auto_306517 ) ) ( not ( = ?auto_306513 ?auto_306518 ) ) ( not ( = ?auto_306513 ?auto_306519 ) ) ( not ( = ?auto_306513 ?auto_306520 ) ) ( not ( = ?auto_306513 ?auto_306521 ) ) ( not ( = ?auto_306513 ?auto_306522 ) ) ( not ( = ?auto_306514 ?auto_306515 ) ) ( not ( = ?auto_306514 ?auto_306516 ) ) ( not ( = ?auto_306514 ?auto_306517 ) ) ( not ( = ?auto_306514 ?auto_306518 ) ) ( not ( = ?auto_306514 ?auto_306519 ) ) ( not ( = ?auto_306514 ?auto_306520 ) ) ( not ( = ?auto_306514 ?auto_306521 ) ) ( not ( = ?auto_306514 ?auto_306522 ) ) ( not ( = ?auto_306515 ?auto_306516 ) ) ( not ( = ?auto_306515 ?auto_306517 ) ) ( not ( = ?auto_306515 ?auto_306518 ) ) ( not ( = ?auto_306515 ?auto_306519 ) ) ( not ( = ?auto_306515 ?auto_306520 ) ) ( not ( = ?auto_306515 ?auto_306521 ) ) ( not ( = ?auto_306515 ?auto_306522 ) ) ( not ( = ?auto_306516 ?auto_306517 ) ) ( not ( = ?auto_306516 ?auto_306518 ) ) ( not ( = ?auto_306516 ?auto_306519 ) ) ( not ( = ?auto_306516 ?auto_306520 ) ) ( not ( = ?auto_306516 ?auto_306521 ) ) ( not ( = ?auto_306516 ?auto_306522 ) ) ( not ( = ?auto_306517 ?auto_306518 ) ) ( not ( = ?auto_306517 ?auto_306519 ) ) ( not ( = ?auto_306517 ?auto_306520 ) ) ( not ( = ?auto_306517 ?auto_306521 ) ) ( not ( = ?auto_306517 ?auto_306522 ) ) ( not ( = ?auto_306518 ?auto_306519 ) ) ( not ( = ?auto_306518 ?auto_306520 ) ) ( not ( = ?auto_306518 ?auto_306521 ) ) ( not ( = ?auto_306518 ?auto_306522 ) ) ( not ( = ?auto_306519 ?auto_306520 ) ) ( not ( = ?auto_306519 ?auto_306521 ) ) ( not ( = ?auto_306519 ?auto_306522 ) ) ( not ( = ?auto_306520 ?auto_306521 ) ) ( not ( = ?auto_306520 ?auto_306522 ) ) ( not ( = ?auto_306521 ?auto_306522 ) ) ( ON ?auto_306520 ?auto_306521 ) ( ON ?auto_306519 ?auto_306520 ) ( ON ?auto_306518 ?auto_306519 ) ( ON ?auto_306517 ?auto_306518 ) ( ON ?auto_306516 ?auto_306517 ) ( ON ?auto_306515 ?auto_306516 ) ( ON ?auto_306514 ?auto_306515 ) ( CLEAR ?auto_306512 ) ( ON ?auto_306513 ?auto_306514 ) ( CLEAR ?auto_306513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_306512 ?auto_306513 )
      ( MAKE-10PILE ?auto_306512 ?auto_306513 ?auto_306514 ?auto_306515 ?auto_306516 ?auto_306517 ?auto_306518 ?auto_306519 ?auto_306520 ?auto_306521 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306533 - BLOCK
      ?auto_306534 - BLOCK
      ?auto_306535 - BLOCK
      ?auto_306536 - BLOCK
      ?auto_306537 - BLOCK
      ?auto_306538 - BLOCK
      ?auto_306539 - BLOCK
      ?auto_306540 - BLOCK
      ?auto_306541 - BLOCK
      ?auto_306542 - BLOCK
    )
    :vars
    (
      ?auto_306543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306542 ?auto_306543 ) ( not ( = ?auto_306533 ?auto_306534 ) ) ( not ( = ?auto_306533 ?auto_306535 ) ) ( not ( = ?auto_306533 ?auto_306536 ) ) ( not ( = ?auto_306533 ?auto_306537 ) ) ( not ( = ?auto_306533 ?auto_306538 ) ) ( not ( = ?auto_306533 ?auto_306539 ) ) ( not ( = ?auto_306533 ?auto_306540 ) ) ( not ( = ?auto_306533 ?auto_306541 ) ) ( not ( = ?auto_306533 ?auto_306542 ) ) ( not ( = ?auto_306533 ?auto_306543 ) ) ( not ( = ?auto_306534 ?auto_306535 ) ) ( not ( = ?auto_306534 ?auto_306536 ) ) ( not ( = ?auto_306534 ?auto_306537 ) ) ( not ( = ?auto_306534 ?auto_306538 ) ) ( not ( = ?auto_306534 ?auto_306539 ) ) ( not ( = ?auto_306534 ?auto_306540 ) ) ( not ( = ?auto_306534 ?auto_306541 ) ) ( not ( = ?auto_306534 ?auto_306542 ) ) ( not ( = ?auto_306534 ?auto_306543 ) ) ( not ( = ?auto_306535 ?auto_306536 ) ) ( not ( = ?auto_306535 ?auto_306537 ) ) ( not ( = ?auto_306535 ?auto_306538 ) ) ( not ( = ?auto_306535 ?auto_306539 ) ) ( not ( = ?auto_306535 ?auto_306540 ) ) ( not ( = ?auto_306535 ?auto_306541 ) ) ( not ( = ?auto_306535 ?auto_306542 ) ) ( not ( = ?auto_306535 ?auto_306543 ) ) ( not ( = ?auto_306536 ?auto_306537 ) ) ( not ( = ?auto_306536 ?auto_306538 ) ) ( not ( = ?auto_306536 ?auto_306539 ) ) ( not ( = ?auto_306536 ?auto_306540 ) ) ( not ( = ?auto_306536 ?auto_306541 ) ) ( not ( = ?auto_306536 ?auto_306542 ) ) ( not ( = ?auto_306536 ?auto_306543 ) ) ( not ( = ?auto_306537 ?auto_306538 ) ) ( not ( = ?auto_306537 ?auto_306539 ) ) ( not ( = ?auto_306537 ?auto_306540 ) ) ( not ( = ?auto_306537 ?auto_306541 ) ) ( not ( = ?auto_306537 ?auto_306542 ) ) ( not ( = ?auto_306537 ?auto_306543 ) ) ( not ( = ?auto_306538 ?auto_306539 ) ) ( not ( = ?auto_306538 ?auto_306540 ) ) ( not ( = ?auto_306538 ?auto_306541 ) ) ( not ( = ?auto_306538 ?auto_306542 ) ) ( not ( = ?auto_306538 ?auto_306543 ) ) ( not ( = ?auto_306539 ?auto_306540 ) ) ( not ( = ?auto_306539 ?auto_306541 ) ) ( not ( = ?auto_306539 ?auto_306542 ) ) ( not ( = ?auto_306539 ?auto_306543 ) ) ( not ( = ?auto_306540 ?auto_306541 ) ) ( not ( = ?auto_306540 ?auto_306542 ) ) ( not ( = ?auto_306540 ?auto_306543 ) ) ( not ( = ?auto_306541 ?auto_306542 ) ) ( not ( = ?auto_306541 ?auto_306543 ) ) ( not ( = ?auto_306542 ?auto_306543 ) ) ( ON ?auto_306541 ?auto_306542 ) ( ON ?auto_306540 ?auto_306541 ) ( ON ?auto_306539 ?auto_306540 ) ( ON ?auto_306538 ?auto_306539 ) ( ON ?auto_306537 ?auto_306538 ) ( ON ?auto_306536 ?auto_306537 ) ( ON ?auto_306535 ?auto_306536 ) ( ON ?auto_306534 ?auto_306535 ) ( ON ?auto_306533 ?auto_306534 ) ( CLEAR ?auto_306533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_306533 )
      ( MAKE-10PILE ?auto_306533 ?auto_306534 ?auto_306535 ?auto_306536 ?auto_306537 ?auto_306538 ?auto_306539 ?auto_306540 ?auto_306541 ?auto_306542 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_306554 - BLOCK
      ?auto_306555 - BLOCK
      ?auto_306556 - BLOCK
      ?auto_306557 - BLOCK
      ?auto_306558 - BLOCK
      ?auto_306559 - BLOCK
      ?auto_306560 - BLOCK
      ?auto_306561 - BLOCK
      ?auto_306562 - BLOCK
      ?auto_306563 - BLOCK
    )
    :vars
    (
      ?auto_306564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306563 ?auto_306564 ) ( not ( = ?auto_306554 ?auto_306555 ) ) ( not ( = ?auto_306554 ?auto_306556 ) ) ( not ( = ?auto_306554 ?auto_306557 ) ) ( not ( = ?auto_306554 ?auto_306558 ) ) ( not ( = ?auto_306554 ?auto_306559 ) ) ( not ( = ?auto_306554 ?auto_306560 ) ) ( not ( = ?auto_306554 ?auto_306561 ) ) ( not ( = ?auto_306554 ?auto_306562 ) ) ( not ( = ?auto_306554 ?auto_306563 ) ) ( not ( = ?auto_306554 ?auto_306564 ) ) ( not ( = ?auto_306555 ?auto_306556 ) ) ( not ( = ?auto_306555 ?auto_306557 ) ) ( not ( = ?auto_306555 ?auto_306558 ) ) ( not ( = ?auto_306555 ?auto_306559 ) ) ( not ( = ?auto_306555 ?auto_306560 ) ) ( not ( = ?auto_306555 ?auto_306561 ) ) ( not ( = ?auto_306555 ?auto_306562 ) ) ( not ( = ?auto_306555 ?auto_306563 ) ) ( not ( = ?auto_306555 ?auto_306564 ) ) ( not ( = ?auto_306556 ?auto_306557 ) ) ( not ( = ?auto_306556 ?auto_306558 ) ) ( not ( = ?auto_306556 ?auto_306559 ) ) ( not ( = ?auto_306556 ?auto_306560 ) ) ( not ( = ?auto_306556 ?auto_306561 ) ) ( not ( = ?auto_306556 ?auto_306562 ) ) ( not ( = ?auto_306556 ?auto_306563 ) ) ( not ( = ?auto_306556 ?auto_306564 ) ) ( not ( = ?auto_306557 ?auto_306558 ) ) ( not ( = ?auto_306557 ?auto_306559 ) ) ( not ( = ?auto_306557 ?auto_306560 ) ) ( not ( = ?auto_306557 ?auto_306561 ) ) ( not ( = ?auto_306557 ?auto_306562 ) ) ( not ( = ?auto_306557 ?auto_306563 ) ) ( not ( = ?auto_306557 ?auto_306564 ) ) ( not ( = ?auto_306558 ?auto_306559 ) ) ( not ( = ?auto_306558 ?auto_306560 ) ) ( not ( = ?auto_306558 ?auto_306561 ) ) ( not ( = ?auto_306558 ?auto_306562 ) ) ( not ( = ?auto_306558 ?auto_306563 ) ) ( not ( = ?auto_306558 ?auto_306564 ) ) ( not ( = ?auto_306559 ?auto_306560 ) ) ( not ( = ?auto_306559 ?auto_306561 ) ) ( not ( = ?auto_306559 ?auto_306562 ) ) ( not ( = ?auto_306559 ?auto_306563 ) ) ( not ( = ?auto_306559 ?auto_306564 ) ) ( not ( = ?auto_306560 ?auto_306561 ) ) ( not ( = ?auto_306560 ?auto_306562 ) ) ( not ( = ?auto_306560 ?auto_306563 ) ) ( not ( = ?auto_306560 ?auto_306564 ) ) ( not ( = ?auto_306561 ?auto_306562 ) ) ( not ( = ?auto_306561 ?auto_306563 ) ) ( not ( = ?auto_306561 ?auto_306564 ) ) ( not ( = ?auto_306562 ?auto_306563 ) ) ( not ( = ?auto_306562 ?auto_306564 ) ) ( not ( = ?auto_306563 ?auto_306564 ) ) ( ON ?auto_306562 ?auto_306563 ) ( ON ?auto_306561 ?auto_306562 ) ( ON ?auto_306560 ?auto_306561 ) ( ON ?auto_306559 ?auto_306560 ) ( ON ?auto_306558 ?auto_306559 ) ( ON ?auto_306557 ?auto_306558 ) ( ON ?auto_306556 ?auto_306557 ) ( ON ?auto_306555 ?auto_306556 ) ( ON ?auto_306554 ?auto_306555 ) ( CLEAR ?auto_306554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_306554 )
      ( MAKE-10PILE ?auto_306554 ?auto_306555 ?auto_306556 ?auto_306557 ?auto_306558 ?auto_306559 ?auto_306560 ?auto_306561 ?auto_306562 ?auto_306563 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306576 - BLOCK
      ?auto_306577 - BLOCK
      ?auto_306578 - BLOCK
      ?auto_306579 - BLOCK
      ?auto_306580 - BLOCK
      ?auto_306581 - BLOCK
      ?auto_306582 - BLOCK
      ?auto_306583 - BLOCK
      ?auto_306584 - BLOCK
      ?auto_306585 - BLOCK
      ?auto_306586 - BLOCK
    )
    :vars
    (
      ?auto_306587 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_306585 ) ( ON ?auto_306586 ?auto_306587 ) ( CLEAR ?auto_306586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_306576 ) ( ON ?auto_306577 ?auto_306576 ) ( ON ?auto_306578 ?auto_306577 ) ( ON ?auto_306579 ?auto_306578 ) ( ON ?auto_306580 ?auto_306579 ) ( ON ?auto_306581 ?auto_306580 ) ( ON ?auto_306582 ?auto_306581 ) ( ON ?auto_306583 ?auto_306582 ) ( ON ?auto_306584 ?auto_306583 ) ( ON ?auto_306585 ?auto_306584 ) ( not ( = ?auto_306576 ?auto_306577 ) ) ( not ( = ?auto_306576 ?auto_306578 ) ) ( not ( = ?auto_306576 ?auto_306579 ) ) ( not ( = ?auto_306576 ?auto_306580 ) ) ( not ( = ?auto_306576 ?auto_306581 ) ) ( not ( = ?auto_306576 ?auto_306582 ) ) ( not ( = ?auto_306576 ?auto_306583 ) ) ( not ( = ?auto_306576 ?auto_306584 ) ) ( not ( = ?auto_306576 ?auto_306585 ) ) ( not ( = ?auto_306576 ?auto_306586 ) ) ( not ( = ?auto_306576 ?auto_306587 ) ) ( not ( = ?auto_306577 ?auto_306578 ) ) ( not ( = ?auto_306577 ?auto_306579 ) ) ( not ( = ?auto_306577 ?auto_306580 ) ) ( not ( = ?auto_306577 ?auto_306581 ) ) ( not ( = ?auto_306577 ?auto_306582 ) ) ( not ( = ?auto_306577 ?auto_306583 ) ) ( not ( = ?auto_306577 ?auto_306584 ) ) ( not ( = ?auto_306577 ?auto_306585 ) ) ( not ( = ?auto_306577 ?auto_306586 ) ) ( not ( = ?auto_306577 ?auto_306587 ) ) ( not ( = ?auto_306578 ?auto_306579 ) ) ( not ( = ?auto_306578 ?auto_306580 ) ) ( not ( = ?auto_306578 ?auto_306581 ) ) ( not ( = ?auto_306578 ?auto_306582 ) ) ( not ( = ?auto_306578 ?auto_306583 ) ) ( not ( = ?auto_306578 ?auto_306584 ) ) ( not ( = ?auto_306578 ?auto_306585 ) ) ( not ( = ?auto_306578 ?auto_306586 ) ) ( not ( = ?auto_306578 ?auto_306587 ) ) ( not ( = ?auto_306579 ?auto_306580 ) ) ( not ( = ?auto_306579 ?auto_306581 ) ) ( not ( = ?auto_306579 ?auto_306582 ) ) ( not ( = ?auto_306579 ?auto_306583 ) ) ( not ( = ?auto_306579 ?auto_306584 ) ) ( not ( = ?auto_306579 ?auto_306585 ) ) ( not ( = ?auto_306579 ?auto_306586 ) ) ( not ( = ?auto_306579 ?auto_306587 ) ) ( not ( = ?auto_306580 ?auto_306581 ) ) ( not ( = ?auto_306580 ?auto_306582 ) ) ( not ( = ?auto_306580 ?auto_306583 ) ) ( not ( = ?auto_306580 ?auto_306584 ) ) ( not ( = ?auto_306580 ?auto_306585 ) ) ( not ( = ?auto_306580 ?auto_306586 ) ) ( not ( = ?auto_306580 ?auto_306587 ) ) ( not ( = ?auto_306581 ?auto_306582 ) ) ( not ( = ?auto_306581 ?auto_306583 ) ) ( not ( = ?auto_306581 ?auto_306584 ) ) ( not ( = ?auto_306581 ?auto_306585 ) ) ( not ( = ?auto_306581 ?auto_306586 ) ) ( not ( = ?auto_306581 ?auto_306587 ) ) ( not ( = ?auto_306582 ?auto_306583 ) ) ( not ( = ?auto_306582 ?auto_306584 ) ) ( not ( = ?auto_306582 ?auto_306585 ) ) ( not ( = ?auto_306582 ?auto_306586 ) ) ( not ( = ?auto_306582 ?auto_306587 ) ) ( not ( = ?auto_306583 ?auto_306584 ) ) ( not ( = ?auto_306583 ?auto_306585 ) ) ( not ( = ?auto_306583 ?auto_306586 ) ) ( not ( = ?auto_306583 ?auto_306587 ) ) ( not ( = ?auto_306584 ?auto_306585 ) ) ( not ( = ?auto_306584 ?auto_306586 ) ) ( not ( = ?auto_306584 ?auto_306587 ) ) ( not ( = ?auto_306585 ?auto_306586 ) ) ( not ( = ?auto_306585 ?auto_306587 ) ) ( not ( = ?auto_306586 ?auto_306587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_306586 ?auto_306587 )
      ( !STACK ?auto_306586 ?auto_306585 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306599 - BLOCK
      ?auto_306600 - BLOCK
      ?auto_306601 - BLOCK
      ?auto_306602 - BLOCK
      ?auto_306603 - BLOCK
      ?auto_306604 - BLOCK
      ?auto_306605 - BLOCK
      ?auto_306606 - BLOCK
      ?auto_306607 - BLOCK
      ?auto_306608 - BLOCK
      ?auto_306609 - BLOCK
    )
    :vars
    (
      ?auto_306610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_306608 ) ( ON ?auto_306609 ?auto_306610 ) ( CLEAR ?auto_306609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_306599 ) ( ON ?auto_306600 ?auto_306599 ) ( ON ?auto_306601 ?auto_306600 ) ( ON ?auto_306602 ?auto_306601 ) ( ON ?auto_306603 ?auto_306602 ) ( ON ?auto_306604 ?auto_306603 ) ( ON ?auto_306605 ?auto_306604 ) ( ON ?auto_306606 ?auto_306605 ) ( ON ?auto_306607 ?auto_306606 ) ( ON ?auto_306608 ?auto_306607 ) ( not ( = ?auto_306599 ?auto_306600 ) ) ( not ( = ?auto_306599 ?auto_306601 ) ) ( not ( = ?auto_306599 ?auto_306602 ) ) ( not ( = ?auto_306599 ?auto_306603 ) ) ( not ( = ?auto_306599 ?auto_306604 ) ) ( not ( = ?auto_306599 ?auto_306605 ) ) ( not ( = ?auto_306599 ?auto_306606 ) ) ( not ( = ?auto_306599 ?auto_306607 ) ) ( not ( = ?auto_306599 ?auto_306608 ) ) ( not ( = ?auto_306599 ?auto_306609 ) ) ( not ( = ?auto_306599 ?auto_306610 ) ) ( not ( = ?auto_306600 ?auto_306601 ) ) ( not ( = ?auto_306600 ?auto_306602 ) ) ( not ( = ?auto_306600 ?auto_306603 ) ) ( not ( = ?auto_306600 ?auto_306604 ) ) ( not ( = ?auto_306600 ?auto_306605 ) ) ( not ( = ?auto_306600 ?auto_306606 ) ) ( not ( = ?auto_306600 ?auto_306607 ) ) ( not ( = ?auto_306600 ?auto_306608 ) ) ( not ( = ?auto_306600 ?auto_306609 ) ) ( not ( = ?auto_306600 ?auto_306610 ) ) ( not ( = ?auto_306601 ?auto_306602 ) ) ( not ( = ?auto_306601 ?auto_306603 ) ) ( not ( = ?auto_306601 ?auto_306604 ) ) ( not ( = ?auto_306601 ?auto_306605 ) ) ( not ( = ?auto_306601 ?auto_306606 ) ) ( not ( = ?auto_306601 ?auto_306607 ) ) ( not ( = ?auto_306601 ?auto_306608 ) ) ( not ( = ?auto_306601 ?auto_306609 ) ) ( not ( = ?auto_306601 ?auto_306610 ) ) ( not ( = ?auto_306602 ?auto_306603 ) ) ( not ( = ?auto_306602 ?auto_306604 ) ) ( not ( = ?auto_306602 ?auto_306605 ) ) ( not ( = ?auto_306602 ?auto_306606 ) ) ( not ( = ?auto_306602 ?auto_306607 ) ) ( not ( = ?auto_306602 ?auto_306608 ) ) ( not ( = ?auto_306602 ?auto_306609 ) ) ( not ( = ?auto_306602 ?auto_306610 ) ) ( not ( = ?auto_306603 ?auto_306604 ) ) ( not ( = ?auto_306603 ?auto_306605 ) ) ( not ( = ?auto_306603 ?auto_306606 ) ) ( not ( = ?auto_306603 ?auto_306607 ) ) ( not ( = ?auto_306603 ?auto_306608 ) ) ( not ( = ?auto_306603 ?auto_306609 ) ) ( not ( = ?auto_306603 ?auto_306610 ) ) ( not ( = ?auto_306604 ?auto_306605 ) ) ( not ( = ?auto_306604 ?auto_306606 ) ) ( not ( = ?auto_306604 ?auto_306607 ) ) ( not ( = ?auto_306604 ?auto_306608 ) ) ( not ( = ?auto_306604 ?auto_306609 ) ) ( not ( = ?auto_306604 ?auto_306610 ) ) ( not ( = ?auto_306605 ?auto_306606 ) ) ( not ( = ?auto_306605 ?auto_306607 ) ) ( not ( = ?auto_306605 ?auto_306608 ) ) ( not ( = ?auto_306605 ?auto_306609 ) ) ( not ( = ?auto_306605 ?auto_306610 ) ) ( not ( = ?auto_306606 ?auto_306607 ) ) ( not ( = ?auto_306606 ?auto_306608 ) ) ( not ( = ?auto_306606 ?auto_306609 ) ) ( not ( = ?auto_306606 ?auto_306610 ) ) ( not ( = ?auto_306607 ?auto_306608 ) ) ( not ( = ?auto_306607 ?auto_306609 ) ) ( not ( = ?auto_306607 ?auto_306610 ) ) ( not ( = ?auto_306608 ?auto_306609 ) ) ( not ( = ?auto_306608 ?auto_306610 ) ) ( not ( = ?auto_306609 ?auto_306610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_306609 ?auto_306610 )
      ( !STACK ?auto_306609 ?auto_306608 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306622 - BLOCK
      ?auto_306623 - BLOCK
      ?auto_306624 - BLOCK
      ?auto_306625 - BLOCK
      ?auto_306626 - BLOCK
      ?auto_306627 - BLOCK
      ?auto_306628 - BLOCK
      ?auto_306629 - BLOCK
      ?auto_306630 - BLOCK
      ?auto_306631 - BLOCK
      ?auto_306632 - BLOCK
    )
    :vars
    (
      ?auto_306633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306632 ?auto_306633 ) ( ON-TABLE ?auto_306622 ) ( ON ?auto_306623 ?auto_306622 ) ( ON ?auto_306624 ?auto_306623 ) ( ON ?auto_306625 ?auto_306624 ) ( ON ?auto_306626 ?auto_306625 ) ( ON ?auto_306627 ?auto_306626 ) ( ON ?auto_306628 ?auto_306627 ) ( ON ?auto_306629 ?auto_306628 ) ( ON ?auto_306630 ?auto_306629 ) ( not ( = ?auto_306622 ?auto_306623 ) ) ( not ( = ?auto_306622 ?auto_306624 ) ) ( not ( = ?auto_306622 ?auto_306625 ) ) ( not ( = ?auto_306622 ?auto_306626 ) ) ( not ( = ?auto_306622 ?auto_306627 ) ) ( not ( = ?auto_306622 ?auto_306628 ) ) ( not ( = ?auto_306622 ?auto_306629 ) ) ( not ( = ?auto_306622 ?auto_306630 ) ) ( not ( = ?auto_306622 ?auto_306631 ) ) ( not ( = ?auto_306622 ?auto_306632 ) ) ( not ( = ?auto_306622 ?auto_306633 ) ) ( not ( = ?auto_306623 ?auto_306624 ) ) ( not ( = ?auto_306623 ?auto_306625 ) ) ( not ( = ?auto_306623 ?auto_306626 ) ) ( not ( = ?auto_306623 ?auto_306627 ) ) ( not ( = ?auto_306623 ?auto_306628 ) ) ( not ( = ?auto_306623 ?auto_306629 ) ) ( not ( = ?auto_306623 ?auto_306630 ) ) ( not ( = ?auto_306623 ?auto_306631 ) ) ( not ( = ?auto_306623 ?auto_306632 ) ) ( not ( = ?auto_306623 ?auto_306633 ) ) ( not ( = ?auto_306624 ?auto_306625 ) ) ( not ( = ?auto_306624 ?auto_306626 ) ) ( not ( = ?auto_306624 ?auto_306627 ) ) ( not ( = ?auto_306624 ?auto_306628 ) ) ( not ( = ?auto_306624 ?auto_306629 ) ) ( not ( = ?auto_306624 ?auto_306630 ) ) ( not ( = ?auto_306624 ?auto_306631 ) ) ( not ( = ?auto_306624 ?auto_306632 ) ) ( not ( = ?auto_306624 ?auto_306633 ) ) ( not ( = ?auto_306625 ?auto_306626 ) ) ( not ( = ?auto_306625 ?auto_306627 ) ) ( not ( = ?auto_306625 ?auto_306628 ) ) ( not ( = ?auto_306625 ?auto_306629 ) ) ( not ( = ?auto_306625 ?auto_306630 ) ) ( not ( = ?auto_306625 ?auto_306631 ) ) ( not ( = ?auto_306625 ?auto_306632 ) ) ( not ( = ?auto_306625 ?auto_306633 ) ) ( not ( = ?auto_306626 ?auto_306627 ) ) ( not ( = ?auto_306626 ?auto_306628 ) ) ( not ( = ?auto_306626 ?auto_306629 ) ) ( not ( = ?auto_306626 ?auto_306630 ) ) ( not ( = ?auto_306626 ?auto_306631 ) ) ( not ( = ?auto_306626 ?auto_306632 ) ) ( not ( = ?auto_306626 ?auto_306633 ) ) ( not ( = ?auto_306627 ?auto_306628 ) ) ( not ( = ?auto_306627 ?auto_306629 ) ) ( not ( = ?auto_306627 ?auto_306630 ) ) ( not ( = ?auto_306627 ?auto_306631 ) ) ( not ( = ?auto_306627 ?auto_306632 ) ) ( not ( = ?auto_306627 ?auto_306633 ) ) ( not ( = ?auto_306628 ?auto_306629 ) ) ( not ( = ?auto_306628 ?auto_306630 ) ) ( not ( = ?auto_306628 ?auto_306631 ) ) ( not ( = ?auto_306628 ?auto_306632 ) ) ( not ( = ?auto_306628 ?auto_306633 ) ) ( not ( = ?auto_306629 ?auto_306630 ) ) ( not ( = ?auto_306629 ?auto_306631 ) ) ( not ( = ?auto_306629 ?auto_306632 ) ) ( not ( = ?auto_306629 ?auto_306633 ) ) ( not ( = ?auto_306630 ?auto_306631 ) ) ( not ( = ?auto_306630 ?auto_306632 ) ) ( not ( = ?auto_306630 ?auto_306633 ) ) ( not ( = ?auto_306631 ?auto_306632 ) ) ( not ( = ?auto_306631 ?auto_306633 ) ) ( not ( = ?auto_306632 ?auto_306633 ) ) ( CLEAR ?auto_306630 ) ( ON ?auto_306631 ?auto_306632 ) ( CLEAR ?auto_306631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_306622 ?auto_306623 ?auto_306624 ?auto_306625 ?auto_306626 ?auto_306627 ?auto_306628 ?auto_306629 ?auto_306630 ?auto_306631 )
      ( MAKE-11PILE ?auto_306622 ?auto_306623 ?auto_306624 ?auto_306625 ?auto_306626 ?auto_306627 ?auto_306628 ?auto_306629 ?auto_306630 ?auto_306631 ?auto_306632 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306645 - BLOCK
      ?auto_306646 - BLOCK
      ?auto_306647 - BLOCK
      ?auto_306648 - BLOCK
      ?auto_306649 - BLOCK
      ?auto_306650 - BLOCK
      ?auto_306651 - BLOCK
      ?auto_306652 - BLOCK
      ?auto_306653 - BLOCK
      ?auto_306654 - BLOCK
      ?auto_306655 - BLOCK
    )
    :vars
    (
      ?auto_306656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306655 ?auto_306656 ) ( ON-TABLE ?auto_306645 ) ( ON ?auto_306646 ?auto_306645 ) ( ON ?auto_306647 ?auto_306646 ) ( ON ?auto_306648 ?auto_306647 ) ( ON ?auto_306649 ?auto_306648 ) ( ON ?auto_306650 ?auto_306649 ) ( ON ?auto_306651 ?auto_306650 ) ( ON ?auto_306652 ?auto_306651 ) ( ON ?auto_306653 ?auto_306652 ) ( not ( = ?auto_306645 ?auto_306646 ) ) ( not ( = ?auto_306645 ?auto_306647 ) ) ( not ( = ?auto_306645 ?auto_306648 ) ) ( not ( = ?auto_306645 ?auto_306649 ) ) ( not ( = ?auto_306645 ?auto_306650 ) ) ( not ( = ?auto_306645 ?auto_306651 ) ) ( not ( = ?auto_306645 ?auto_306652 ) ) ( not ( = ?auto_306645 ?auto_306653 ) ) ( not ( = ?auto_306645 ?auto_306654 ) ) ( not ( = ?auto_306645 ?auto_306655 ) ) ( not ( = ?auto_306645 ?auto_306656 ) ) ( not ( = ?auto_306646 ?auto_306647 ) ) ( not ( = ?auto_306646 ?auto_306648 ) ) ( not ( = ?auto_306646 ?auto_306649 ) ) ( not ( = ?auto_306646 ?auto_306650 ) ) ( not ( = ?auto_306646 ?auto_306651 ) ) ( not ( = ?auto_306646 ?auto_306652 ) ) ( not ( = ?auto_306646 ?auto_306653 ) ) ( not ( = ?auto_306646 ?auto_306654 ) ) ( not ( = ?auto_306646 ?auto_306655 ) ) ( not ( = ?auto_306646 ?auto_306656 ) ) ( not ( = ?auto_306647 ?auto_306648 ) ) ( not ( = ?auto_306647 ?auto_306649 ) ) ( not ( = ?auto_306647 ?auto_306650 ) ) ( not ( = ?auto_306647 ?auto_306651 ) ) ( not ( = ?auto_306647 ?auto_306652 ) ) ( not ( = ?auto_306647 ?auto_306653 ) ) ( not ( = ?auto_306647 ?auto_306654 ) ) ( not ( = ?auto_306647 ?auto_306655 ) ) ( not ( = ?auto_306647 ?auto_306656 ) ) ( not ( = ?auto_306648 ?auto_306649 ) ) ( not ( = ?auto_306648 ?auto_306650 ) ) ( not ( = ?auto_306648 ?auto_306651 ) ) ( not ( = ?auto_306648 ?auto_306652 ) ) ( not ( = ?auto_306648 ?auto_306653 ) ) ( not ( = ?auto_306648 ?auto_306654 ) ) ( not ( = ?auto_306648 ?auto_306655 ) ) ( not ( = ?auto_306648 ?auto_306656 ) ) ( not ( = ?auto_306649 ?auto_306650 ) ) ( not ( = ?auto_306649 ?auto_306651 ) ) ( not ( = ?auto_306649 ?auto_306652 ) ) ( not ( = ?auto_306649 ?auto_306653 ) ) ( not ( = ?auto_306649 ?auto_306654 ) ) ( not ( = ?auto_306649 ?auto_306655 ) ) ( not ( = ?auto_306649 ?auto_306656 ) ) ( not ( = ?auto_306650 ?auto_306651 ) ) ( not ( = ?auto_306650 ?auto_306652 ) ) ( not ( = ?auto_306650 ?auto_306653 ) ) ( not ( = ?auto_306650 ?auto_306654 ) ) ( not ( = ?auto_306650 ?auto_306655 ) ) ( not ( = ?auto_306650 ?auto_306656 ) ) ( not ( = ?auto_306651 ?auto_306652 ) ) ( not ( = ?auto_306651 ?auto_306653 ) ) ( not ( = ?auto_306651 ?auto_306654 ) ) ( not ( = ?auto_306651 ?auto_306655 ) ) ( not ( = ?auto_306651 ?auto_306656 ) ) ( not ( = ?auto_306652 ?auto_306653 ) ) ( not ( = ?auto_306652 ?auto_306654 ) ) ( not ( = ?auto_306652 ?auto_306655 ) ) ( not ( = ?auto_306652 ?auto_306656 ) ) ( not ( = ?auto_306653 ?auto_306654 ) ) ( not ( = ?auto_306653 ?auto_306655 ) ) ( not ( = ?auto_306653 ?auto_306656 ) ) ( not ( = ?auto_306654 ?auto_306655 ) ) ( not ( = ?auto_306654 ?auto_306656 ) ) ( not ( = ?auto_306655 ?auto_306656 ) ) ( CLEAR ?auto_306653 ) ( ON ?auto_306654 ?auto_306655 ) ( CLEAR ?auto_306654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_306645 ?auto_306646 ?auto_306647 ?auto_306648 ?auto_306649 ?auto_306650 ?auto_306651 ?auto_306652 ?auto_306653 ?auto_306654 )
      ( MAKE-11PILE ?auto_306645 ?auto_306646 ?auto_306647 ?auto_306648 ?auto_306649 ?auto_306650 ?auto_306651 ?auto_306652 ?auto_306653 ?auto_306654 ?auto_306655 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306668 - BLOCK
      ?auto_306669 - BLOCK
      ?auto_306670 - BLOCK
      ?auto_306671 - BLOCK
      ?auto_306672 - BLOCK
      ?auto_306673 - BLOCK
      ?auto_306674 - BLOCK
      ?auto_306675 - BLOCK
      ?auto_306676 - BLOCK
      ?auto_306677 - BLOCK
      ?auto_306678 - BLOCK
    )
    :vars
    (
      ?auto_306679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306678 ?auto_306679 ) ( ON-TABLE ?auto_306668 ) ( ON ?auto_306669 ?auto_306668 ) ( ON ?auto_306670 ?auto_306669 ) ( ON ?auto_306671 ?auto_306670 ) ( ON ?auto_306672 ?auto_306671 ) ( ON ?auto_306673 ?auto_306672 ) ( ON ?auto_306674 ?auto_306673 ) ( ON ?auto_306675 ?auto_306674 ) ( not ( = ?auto_306668 ?auto_306669 ) ) ( not ( = ?auto_306668 ?auto_306670 ) ) ( not ( = ?auto_306668 ?auto_306671 ) ) ( not ( = ?auto_306668 ?auto_306672 ) ) ( not ( = ?auto_306668 ?auto_306673 ) ) ( not ( = ?auto_306668 ?auto_306674 ) ) ( not ( = ?auto_306668 ?auto_306675 ) ) ( not ( = ?auto_306668 ?auto_306676 ) ) ( not ( = ?auto_306668 ?auto_306677 ) ) ( not ( = ?auto_306668 ?auto_306678 ) ) ( not ( = ?auto_306668 ?auto_306679 ) ) ( not ( = ?auto_306669 ?auto_306670 ) ) ( not ( = ?auto_306669 ?auto_306671 ) ) ( not ( = ?auto_306669 ?auto_306672 ) ) ( not ( = ?auto_306669 ?auto_306673 ) ) ( not ( = ?auto_306669 ?auto_306674 ) ) ( not ( = ?auto_306669 ?auto_306675 ) ) ( not ( = ?auto_306669 ?auto_306676 ) ) ( not ( = ?auto_306669 ?auto_306677 ) ) ( not ( = ?auto_306669 ?auto_306678 ) ) ( not ( = ?auto_306669 ?auto_306679 ) ) ( not ( = ?auto_306670 ?auto_306671 ) ) ( not ( = ?auto_306670 ?auto_306672 ) ) ( not ( = ?auto_306670 ?auto_306673 ) ) ( not ( = ?auto_306670 ?auto_306674 ) ) ( not ( = ?auto_306670 ?auto_306675 ) ) ( not ( = ?auto_306670 ?auto_306676 ) ) ( not ( = ?auto_306670 ?auto_306677 ) ) ( not ( = ?auto_306670 ?auto_306678 ) ) ( not ( = ?auto_306670 ?auto_306679 ) ) ( not ( = ?auto_306671 ?auto_306672 ) ) ( not ( = ?auto_306671 ?auto_306673 ) ) ( not ( = ?auto_306671 ?auto_306674 ) ) ( not ( = ?auto_306671 ?auto_306675 ) ) ( not ( = ?auto_306671 ?auto_306676 ) ) ( not ( = ?auto_306671 ?auto_306677 ) ) ( not ( = ?auto_306671 ?auto_306678 ) ) ( not ( = ?auto_306671 ?auto_306679 ) ) ( not ( = ?auto_306672 ?auto_306673 ) ) ( not ( = ?auto_306672 ?auto_306674 ) ) ( not ( = ?auto_306672 ?auto_306675 ) ) ( not ( = ?auto_306672 ?auto_306676 ) ) ( not ( = ?auto_306672 ?auto_306677 ) ) ( not ( = ?auto_306672 ?auto_306678 ) ) ( not ( = ?auto_306672 ?auto_306679 ) ) ( not ( = ?auto_306673 ?auto_306674 ) ) ( not ( = ?auto_306673 ?auto_306675 ) ) ( not ( = ?auto_306673 ?auto_306676 ) ) ( not ( = ?auto_306673 ?auto_306677 ) ) ( not ( = ?auto_306673 ?auto_306678 ) ) ( not ( = ?auto_306673 ?auto_306679 ) ) ( not ( = ?auto_306674 ?auto_306675 ) ) ( not ( = ?auto_306674 ?auto_306676 ) ) ( not ( = ?auto_306674 ?auto_306677 ) ) ( not ( = ?auto_306674 ?auto_306678 ) ) ( not ( = ?auto_306674 ?auto_306679 ) ) ( not ( = ?auto_306675 ?auto_306676 ) ) ( not ( = ?auto_306675 ?auto_306677 ) ) ( not ( = ?auto_306675 ?auto_306678 ) ) ( not ( = ?auto_306675 ?auto_306679 ) ) ( not ( = ?auto_306676 ?auto_306677 ) ) ( not ( = ?auto_306676 ?auto_306678 ) ) ( not ( = ?auto_306676 ?auto_306679 ) ) ( not ( = ?auto_306677 ?auto_306678 ) ) ( not ( = ?auto_306677 ?auto_306679 ) ) ( not ( = ?auto_306678 ?auto_306679 ) ) ( ON ?auto_306677 ?auto_306678 ) ( CLEAR ?auto_306675 ) ( ON ?auto_306676 ?auto_306677 ) ( CLEAR ?auto_306676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_306668 ?auto_306669 ?auto_306670 ?auto_306671 ?auto_306672 ?auto_306673 ?auto_306674 ?auto_306675 ?auto_306676 )
      ( MAKE-11PILE ?auto_306668 ?auto_306669 ?auto_306670 ?auto_306671 ?auto_306672 ?auto_306673 ?auto_306674 ?auto_306675 ?auto_306676 ?auto_306677 ?auto_306678 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306691 - BLOCK
      ?auto_306692 - BLOCK
      ?auto_306693 - BLOCK
      ?auto_306694 - BLOCK
      ?auto_306695 - BLOCK
      ?auto_306696 - BLOCK
      ?auto_306697 - BLOCK
      ?auto_306698 - BLOCK
      ?auto_306699 - BLOCK
      ?auto_306700 - BLOCK
      ?auto_306701 - BLOCK
    )
    :vars
    (
      ?auto_306702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306701 ?auto_306702 ) ( ON-TABLE ?auto_306691 ) ( ON ?auto_306692 ?auto_306691 ) ( ON ?auto_306693 ?auto_306692 ) ( ON ?auto_306694 ?auto_306693 ) ( ON ?auto_306695 ?auto_306694 ) ( ON ?auto_306696 ?auto_306695 ) ( ON ?auto_306697 ?auto_306696 ) ( ON ?auto_306698 ?auto_306697 ) ( not ( = ?auto_306691 ?auto_306692 ) ) ( not ( = ?auto_306691 ?auto_306693 ) ) ( not ( = ?auto_306691 ?auto_306694 ) ) ( not ( = ?auto_306691 ?auto_306695 ) ) ( not ( = ?auto_306691 ?auto_306696 ) ) ( not ( = ?auto_306691 ?auto_306697 ) ) ( not ( = ?auto_306691 ?auto_306698 ) ) ( not ( = ?auto_306691 ?auto_306699 ) ) ( not ( = ?auto_306691 ?auto_306700 ) ) ( not ( = ?auto_306691 ?auto_306701 ) ) ( not ( = ?auto_306691 ?auto_306702 ) ) ( not ( = ?auto_306692 ?auto_306693 ) ) ( not ( = ?auto_306692 ?auto_306694 ) ) ( not ( = ?auto_306692 ?auto_306695 ) ) ( not ( = ?auto_306692 ?auto_306696 ) ) ( not ( = ?auto_306692 ?auto_306697 ) ) ( not ( = ?auto_306692 ?auto_306698 ) ) ( not ( = ?auto_306692 ?auto_306699 ) ) ( not ( = ?auto_306692 ?auto_306700 ) ) ( not ( = ?auto_306692 ?auto_306701 ) ) ( not ( = ?auto_306692 ?auto_306702 ) ) ( not ( = ?auto_306693 ?auto_306694 ) ) ( not ( = ?auto_306693 ?auto_306695 ) ) ( not ( = ?auto_306693 ?auto_306696 ) ) ( not ( = ?auto_306693 ?auto_306697 ) ) ( not ( = ?auto_306693 ?auto_306698 ) ) ( not ( = ?auto_306693 ?auto_306699 ) ) ( not ( = ?auto_306693 ?auto_306700 ) ) ( not ( = ?auto_306693 ?auto_306701 ) ) ( not ( = ?auto_306693 ?auto_306702 ) ) ( not ( = ?auto_306694 ?auto_306695 ) ) ( not ( = ?auto_306694 ?auto_306696 ) ) ( not ( = ?auto_306694 ?auto_306697 ) ) ( not ( = ?auto_306694 ?auto_306698 ) ) ( not ( = ?auto_306694 ?auto_306699 ) ) ( not ( = ?auto_306694 ?auto_306700 ) ) ( not ( = ?auto_306694 ?auto_306701 ) ) ( not ( = ?auto_306694 ?auto_306702 ) ) ( not ( = ?auto_306695 ?auto_306696 ) ) ( not ( = ?auto_306695 ?auto_306697 ) ) ( not ( = ?auto_306695 ?auto_306698 ) ) ( not ( = ?auto_306695 ?auto_306699 ) ) ( not ( = ?auto_306695 ?auto_306700 ) ) ( not ( = ?auto_306695 ?auto_306701 ) ) ( not ( = ?auto_306695 ?auto_306702 ) ) ( not ( = ?auto_306696 ?auto_306697 ) ) ( not ( = ?auto_306696 ?auto_306698 ) ) ( not ( = ?auto_306696 ?auto_306699 ) ) ( not ( = ?auto_306696 ?auto_306700 ) ) ( not ( = ?auto_306696 ?auto_306701 ) ) ( not ( = ?auto_306696 ?auto_306702 ) ) ( not ( = ?auto_306697 ?auto_306698 ) ) ( not ( = ?auto_306697 ?auto_306699 ) ) ( not ( = ?auto_306697 ?auto_306700 ) ) ( not ( = ?auto_306697 ?auto_306701 ) ) ( not ( = ?auto_306697 ?auto_306702 ) ) ( not ( = ?auto_306698 ?auto_306699 ) ) ( not ( = ?auto_306698 ?auto_306700 ) ) ( not ( = ?auto_306698 ?auto_306701 ) ) ( not ( = ?auto_306698 ?auto_306702 ) ) ( not ( = ?auto_306699 ?auto_306700 ) ) ( not ( = ?auto_306699 ?auto_306701 ) ) ( not ( = ?auto_306699 ?auto_306702 ) ) ( not ( = ?auto_306700 ?auto_306701 ) ) ( not ( = ?auto_306700 ?auto_306702 ) ) ( not ( = ?auto_306701 ?auto_306702 ) ) ( ON ?auto_306700 ?auto_306701 ) ( CLEAR ?auto_306698 ) ( ON ?auto_306699 ?auto_306700 ) ( CLEAR ?auto_306699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_306691 ?auto_306692 ?auto_306693 ?auto_306694 ?auto_306695 ?auto_306696 ?auto_306697 ?auto_306698 ?auto_306699 )
      ( MAKE-11PILE ?auto_306691 ?auto_306692 ?auto_306693 ?auto_306694 ?auto_306695 ?auto_306696 ?auto_306697 ?auto_306698 ?auto_306699 ?auto_306700 ?auto_306701 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306714 - BLOCK
      ?auto_306715 - BLOCK
      ?auto_306716 - BLOCK
      ?auto_306717 - BLOCK
      ?auto_306718 - BLOCK
      ?auto_306719 - BLOCK
      ?auto_306720 - BLOCK
      ?auto_306721 - BLOCK
      ?auto_306722 - BLOCK
      ?auto_306723 - BLOCK
      ?auto_306724 - BLOCK
    )
    :vars
    (
      ?auto_306725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306724 ?auto_306725 ) ( ON-TABLE ?auto_306714 ) ( ON ?auto_306715 ?auto_306714 ) ( ON ?auto_306716 ?auto_306715 ) ( ON ?auto_306717 ?auto_306716 ) ( ON ?auto_306718 ?auto_306717 ) ( ON ?auto_306719 ?auto_306718 ) ( ON ?auto_306720 ?auto_306719 ) ( not ( = ?auto_306714 ?auto_306715 ) ) ( not ( = ?auto_306714 ?auto_306716 ) ) ( not ( = ?auto_306714 ?auto_306717 ) ) ( not ( = ?auto_306714 ?auto_306718 ) ) ( not ( = ?auto_306714 ?auto_306719 ) ) ( not ( = ?auto_306714 ?auto_306720 ) ) ( not ( = ?auto_306714 ?auto_306721 ) ) ( not ( = ?auto_306714 ?auto_306722 ) ) ( not ( = ?auto_306714 ?auto_306723 ) ) ( not ( = ?auto_306714 ?auto_306724 ) ) ( not ( = ?auto_306714 ?auto_306725 ) ) ( not ( = ?auto_306715 ?auto_306716 ) ) ( not ( = ?auto_306715 ?auto_306717 ) ) ( not ( = ?auto_306715 ?auto_306718 ) ) ( not ( = ?auto_306715 ?auto_306719 ) ) ( not ( = ?auto_306715 ?auto_306720 ) ) ( not ( = ?auto_306715 ?auto_306721 ) ) ( not ( = ?auto_306715 ?auto_306722 ) ) ( not ( = ?auto_306715 ?auto_306723 ) ) ( not ( = ?auto_306715 ?auto_306724 ) ) ( not ( = ?auto_306715 ?auto_306725 ) ) ( not ( = ?auto_306716 ?auto_306717 ) ) ( not ( = ?auto_306716 ?auto_306718 ) ) ( not ( = ?auto_306716 ?auto_306719 ) ) ( not ( = ?auto_306716 ?auto_306720 ) ) ( not ( = ?auto_306716 ?auto_306721 ) ) ( not ( = ?auto_306716 ?auto_306722 ) ) ( not ( = ?auto_306716 ?auto_306723 ) ) ( not ( = ?auto_306716 ?auto_306724 ) ) ( not ( = ?auto_306716 ?auto_306725 ) ) ( not ( = ?auto_306717 ?auto_306718 ) ) ( not ( = ?auto_306717 ?auto_306719 ) ) ( not ( = ?auto_306717 ?auto_306720 ) ) ( not ( = ?auto_306717 ?auto_306721 ) ) ( not ( = ?auto_306717 ?auto_306722 ) ) ( not ( = ?auto_306717 ?auto_306723 ) ) ( not ( = ?auto_306717 ?auto_306724 ) ) ( not ( = ?auto_306717 ?auto_306725 ) ) ( not ( = ?auto_306718 ?auto_306719 ) ) ( not ( = ?auto_306718 ?auto_306720 ) ) ( not ( = ?auto_306718 ?auto_306721 ) ) ( not ( = ?auto_306718 ?auto_306722 ) ) ( not ( = ?auto_306718 ?auto_306723 ) ) ( not ( = ?auto_306718 ?auto_306724 ) ) ( not ( = ?auto_306718 ?auto_306725 ) ) ( not ( = ?auto_306719 ?auto_306720 ) ) ( not ( = ?auto_306719 ?auto_306721 ) ) ( not ( = ?auto_306719 ?auto_306722 ) ) ( not ( = ?auto_306719 ?auto_306723 ) ) ( not ( = ?auto_306719 ?auto_306724 ) ) ( not ( = ?auto_306719 ?auto_306725 ) ) ( not ( = ?auto_306720 ?auto_306721 ) ) ( not ( = ?auto_306720 ?auto_306722 ) ) ( not ( = ?auto_306720 ?auto_306723 ) ) ( not ( = ?auto_306720 ?auto_306724 ) ) ( not ( = ?auto_306720 ?auto_306725 ) ) ( not ( = ?auto_306721 ?auto_306722 ) ) ( not ( = ?auto_306721 ?auto_306723 ) ) ( not ( = ?auto_306721 ?auto_306724 ) ) ( not ( = ?auto_306721 ?auto_306725 ) ) ( not ( = ?auto_306722 ?auto_306723 ) ) ( not ( = ?auto_306722 ?auto_306724 ) ) ( not ( = ?auto_306722 ?auto_306725 ) ) ( not ( = ?auto_306723 ?auto_306724 ) ) ( not ( = ?auto_306723 ?auto_306725 ) ) ( not ( = ?auto_306724 ?auto_306725 ) ) ( ON ?auto_306723 ?auto_306724 ) ( ON ?auto_306722 ?auto_306723 ) ( CLEAR ?auto_306720 ) ( ON ?auto_306721 ?auto_306722 ) ( CLEAR ?auto_306721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_306714 ?auto_306715 ?auto_306716 ?auto_306717 ?auto_306718 ?auto_306719 ?auto_306720 ?auto_306721 )
      ( MAKE-11PILE ?auto_306714 ?auto_306715 ?auto_306716 ?auto_306717 ?auto_306718 ?auto_306719 ?auto_306720 ?auto_306721 ?auto_306722 ?auto_306723 ?auto_306724 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306737 - BLOCK
      ?auto_306738 - BLOCK
      ?auto_306739 - BLOCK
      ?auto_306740 - BLOCK
      ?auto_306741 - BLOCK
      ?auto_306742 - BLOCK
      ?auto_306743 - BLOCK
      ?auto_306744 - BLOCK
      ?auto_306745 - BLOCK
      ?auto_306746 - BLOCK
      ?auto_306747 - BLOCK
    )
    :vars
    (
      ?auto_306748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306747 ?auto_306748 ) ( ON-TABLE ?auto_306737 ) ( ON ?auto_306738 ?auto_306737 ) ( ON ?auto_306739 ?auto_306738 ) ( ON ?auto_306740 ?auto_306739 ) ( ON ?auto_306741 ?auto_306740 ) ( ON ?auto_306742 ?auto_306741 ) ( ON ?auto_306743 ?auto_306742 ) ( not ( = ?auto_306737 ?auto_306738 ) ) ( not ( = ?auto_306737 ?auto_306739 ) ) ( not ( = ?auto_306737 ?auto_306740 ) ) ( not ( = ?auto_306737 ?auto_306741 ) ) ( not ( = ?auto_306737 ?auto_306742 ) ) ( not ( = ?auto_306737 ?auto_306743 ) ) ( not ( = ?auto_306737 ?auto_306744 ) ) ( not ( = ?auto_306737 ?auto_306745 ) ) ( not ( = ?auto_306737 ?auto_306746 ) ) ( not ( = ?auto_306737 ?auto_306747 ) ) ( not ( = ?auto_306737 ?auto_306748 ) ) ( not ( = ?auto_306738 ?auto_306739 ) ) ( not ( = ?auto_306738 ?auto_306740 ) ) ( not ( = ?auto_306738 ?auto_306741 ) ) ( not ( = ?auto_306738 ?auto_306742 ) ) ( not ( = ?auto_306738 ?auto_306743 ) ) ( not ( = ?auto_306738 ?auto_306744 ) ) ( not ( = ?auto_306738 ?auto_306745 ) ) ( not ( = ?auto_306738 ?auto_306746 ) ) ( not ( = ?auto_306738 ?auto_306747 ) ) ( not ( = ?auto_306738 ?auto_306748 ) ) ( not ( = ?auto_306739 ?auto_306740 ) ) ( not ( = ?auto_306739 ?auto_306741 ) ) ( not ( = ?auto_306739 ?auto_306742 ) ) ( not ( = ?auto_306739 ?auto_306743 ) ) ( not ( = ?auto_306739 ?auto_306744 ) ) ( not ( = ?auto_306739 ?auto_306745 ) ) ( not ( = ?auto_306739 ?auto_306746 ) ) ( not ( = ?auto_306739 ?auto_306747 ) ) ( not ( = ?auto_306739 ?auto_306748 ) ) ( not ( = ?auto_306740 ?auto_306741 ) ) ( not ( = ?auto_306740 ?auto_306742 ) ) ( not ( = ?auto_306740 ?auto_306743 ) ) ( not ( = ?auto_306740 ?auto_306744 ) ) ( not ( = ?auto_306740 ?auto_306745 ) ) ( not ( = ?auto_306740 ?auto_306746 ) ) ( not ( = ?auto_306740 ?auto_306747 ) ) ( not ( = ?auto_306740 ?auto_306748 ) ) ( not ( = ?auto_306741 ?auto_306742 ) ) ( not ( = ?auto_306741 ?auto_306743 ) ) ( not ( = ?auto_306741 ?auto_306744 ) ) ( not ( = ?auto_306741 ?auto_306745 ) ) ( not ( = ?auto_306741 ?auto_306746 ) ) ( not ( = ?auto_306741 ?auto_306747 ) ) ( not ( = ?auto_306741 ?auto_306748 ) ) ( not ( = ?auto_306742 ?auto_306743 ) ) ( not ( = ?auto_306742 ?auto_306744 ) ) ( not ( = ?auto_306742 ?auto_306745 ) ) ( not ( = ?auto_306742 ?auto_306746 ) ) ( not ( = ?auto_306742 ?auto_306747 ) ) ( not ( = ?auto_306742 ?auto_306748 ) ) ( not ( = ?auto_306743 ?auto_306744 ) ) ( not ( = ?auto_306743 ?auto_306745 ) ) ( not ( = ?auto_306743 ?auto_306746 ) ) ( not ( = ?auto_306743 ?auto_306747 ) ) ( not ( = ?auto_306743 ?auto_306748 ) ) ( not ( = ?auto_306744 ?auto_306745 ) ) ( not ( = ?auto_306744 ?auto_306746 ) ) ( not ( = ?auto_306744 ?auto_306747 ) ) ( not ( = ?auto_306744 ?auto_306748 ) ) ( not ( = ?auto_306745 ?auto_306746 ) ) ( not ( = ?auto_306745 ?auto_306747 ) ) ( not ( = ?auto_306745 ?auto_306748 ) ) ( not ( = ?auto_306746 ?auto_306747 ) ) ( not ( = ?auto_306746 ?auto_306748 ) ) ( not ( = ?auto_306747 ?auto_306748 ) ) ( ON ?auto_306746 ?auto_306747 ) ( ON ?auto_306745 ?auto_306746 ) ( CLEAR ?auto_306743 ) ( ON ?auto_306744 ?auto_306745 ) ( CLEAR ?auto_306744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_306737 ?auto_306738 ?auto_306739 ?auto_306740 ?auto_306741 ?auto_306742 ?auto_306743 ?auto_306744 )
      ( MAKE-11PILE ?auto_306737 ?auto_306738 ?auto_306739 ?auto_306740 ?auto_306741 ?auto_306742 ?auto_306743 ?auto_306744 ?auto_306745 ?auto_306746 ?auto_306747 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306760 - BLOCK
      ?auto_306761 - BLOCK
      ?auto_306762 - BLOCK
      ?auto_306763 - BLOCK
      ?auto_306764 - BLOCK
      ?auto_306765 - BLOCK
      ?auto_306766 - BLOCK
      ?auto_306767 - BLOCK
      ?auto_306768 - BLOCK
      ?auto_306769 - BLOCK
      ?auto_306770 - BLOCK
    )
    :vars
    (
      ?auto_306771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306770 ?auto_306771 ) ( ON-TABLE ?auto_306760 ) ( ON ?auto_306761 ?auto_306760 ) ( ON ?auto_306762 ?auto_306761 ) ( ON ?auto_306763 ?auto_306762 ) ( ON ?auto_306764 ?auto_306763 ) ( ON ?auto_306765 ?auto_306764 ) ( not ( = ?auto_306760 ?auto_306761 ) ) ( not ( = ?auto_306760 ?auto_306762 ) ) ( not ( = ?auto_306760 ?auto_306763 ) ) ( not ( = ?auto_306760 ?auto_306764 ) ) ( not ( = ?auto_306760 ?auto_306765 ) ) ( not ( = ?auto_306760 ?auto_306766 ) ) ( not ( = ?auto_306760 ?auto_306767 ) ) ( not ( = ?auto_306760 ?auto_306768 ) ) ( not ( = ?auto_306760 ?auto_306769 ) ) ( not ( = ?auto_306760 ?auto_306770 ) ) ( not ( = ?auto_306760 ?auto_306771 ) ) ( not ( = ?auto_306761 ?auto_306762 ) ) ( not ( = ?auto_306761 ?auto_306763 ) ) ( not ( = ?auto_306761 ?auto_306764 ) ) ( not ( = ?auto_306761 ?auto_306765 ) ) ( not ( = ?auto_306761 ?auto_306766 ) ) ( not ( = ?auto_306761 ?auto_306767 ) ) ( not ( = ?auto_306761 ?auto_306768 ) ) ( not ( = ?auto_306761 ?auto_306769 ) ) ( not ( = ?auto_306761 ?auto_306770 ) ) ( not ( = ?auto_306761 ?auto_306771 ) ) ( not ( = ?auto_306762 ?auto_306763 ) ) ( not ( = ?auto_306762 ?auto_306764 ) ) ( not ( = ?auto_306762 ?auto_306765 ) ) ( not ( = ?auto_306762 ?auto_306766 ) ) ( not ( = ?auto_306762 ?auto_306767 ) ) ( not ( = ?auto_306762 ?auto_306768 ) ) ( not ( = ?auto_306762 ?auto_306769 ) ) ( not ( = ?auto_306762 ?auto_306770 ) ) ( not ( = ?auto_306762 ?auto_306771 ) ) ( not ( = ?auto_306763 ?auto_306764 ) ) ( not ( = ?auto_306763 ?auto_306765 ) ) ( not ( = ?auto_306763 ?auto_306766 ) ) ( not ( = ?auto_306763 ?auto_306767 ) ) ( not ( = ?auto_306763 ?auto_306768 ) ) ( not ( = ?auto_306763 ?auto_306769 ) ) ( not ( = ?auto_306763 ?auto_306770 ) ) ( not ( = ?auto_306763 ?auto_306771 ) ) ( not ( = ?auto_306764 ?auto_306765 ) ) ( not ( = ?auto_306764 ?auto_306766 ) ) ( not ( = ?auto_306764 ?auto_306767 ) ) ( not ( = ?auto_306764 ?auto_306768 ) ) ( not ( = ?auto_306764 ?auto_306769 ) ) ( not ( = ?auto_306764 ?auto_306770 ) ) ( not ( = ?auto_306764 ?auto_306771 ) ) ( not ( = ?auto_306765 ?auto_306766 ) ) ( not ( = ?auto_306765 ?auto_306767 ) ) ( not ( = ?auto_306765 ?auto_306768 ) ) ( not ( = ?auto_306765 ?auto_306769 ) ) ( not ( = ?auto_306765 ?auto_306770 ) ) ( not ( = ?auto_306765 ?auto_306771 ) ) ( not ( = ?auto_306766 ?auto_306767 ) ) ( not ( = ?auto_306766 ?auto_306768 ) ) ( not ( = ?auto_306766 ?auto_306769 ) ) ( not ( = ?auto_306766 ?auto_306770 ) ) ( not ( = ?auto_306766 ?auto_306771 ) ) ( not ( = ?auto_306767 ?auto_306768 ) ) ( not ( = ?auto_306767 ?auto_306769 ) ) ( not ( = ?auto_306767 ?auto_306770 ) ) ( not ( = ?auto_306767 ?auto_306771 ) ) ( not ( = ?auto_306768 ?auto_306769 ) ) ( not ( = ?auto_306768 ?auto_306770 ) ) ( not ( = ?auto_306768 ?auto_306771 ) ) ( not ( = ?auto_306769 ?auto_306770 ) ) ( not ( = ?auto_306769 ?auto_306771 ) ) ( not ( = ?auto_306770 ?auto_306771 ) ) ( ON ?auto_306769 ?auto_306770 ) ( ON ?auto_306768 ?auto_306769 ) ( ON ?auto_306767 ?auto_306768 ) ( CLEAR ?auto_306765 ) ( ON ?auto_306766 ?auto_306767 ) ( CLEAR ?auto_306766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_306760 ?auto_306761 ?auto_306762 ?auto_306763 ?auto_306764 ?auto_306765 ?auto_306766 )
      ( MAKE-11PILE ?auto_306760 ?auto_306761 ?auto_306762 ?auto_306763 ?auto_306764 ?auto_306765 ?auto_306766 ?auto_306767 ?auto_306768 ?auto_306769 ?auto_306770 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306783 - BLOCK
      ?auto_306784 - BLOCK
      ?auto_306785 - BLOCK
      ?auto_306786 - BLOCK
      ?auto_306787 - BLOCK
      ?auto_306788 - BLOCK
      ?auto_306789 - BLOCK
      ?auto_306790 - BLOCK
      ?auto_306791 - BLOCK
      ?auto_306792 - BLOCK
      ?auto_306793 - BLOCK
    )
    :vars
    (
      ?auto_306794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306793 ?auto_306794 ) ( ON-TABLE ?auto_306783 ) ( ON ?auto_306784 ?auto_306783 ) ( ON ?auto_306785 ?auto_306784 ) ( ON ?auto_306786 ?auto_306785 ) ( ON ?auto_306787 ?auto_306786 ) ( ON ?auto_306788 ?auto_306787 ) ( not ( = ?auto_306783 ?auto_306784 ) ) ( not ( = ?auto_306783 ?auto_306785 ) ) ( not ( = ?auto_306783 ?auto_306786 ) ) ( not ( = ?auto_306783 ?auto_306787 ) ) ( not ( = ?auto_306783 ?auto_306788 ) ) ( not ( = ?auto_306783 ?auto_306789 ) ) ( not ( = ?auto_306783 ?auto_306790 ) ) ( not ( = ?auto_306783 ?auto_306791 ) ) ( not ( = ?auto_306783 ?auto_306792 ) ) ( not ( = ?auto_306783 ?auto_306793 ) ) ( not ( = ?auto_306783 ?auto_306794 ) ) ( not ( = ?auto_306784 ?auto_306785 ) ) ( not ( = ?auto_306784 ?auto_306786 ) ) ( not ( = ?auto_306784 ?auto_306787 ) ) ( not ( = ?auto_306784 ?auto_306788 ) ) ( not ( = ?auto_306784 ?auto_306789 ) ) ( not ( = ?auto_306784 ?auto_306790 ) ) ( not ( = ?auto_306784 ?auto_306791 ) ) ( not ( = ?auto_306784 ?auto_306792 ) ) ( not ( = ?auto_306784 ?auto_306793 ) ) ( not ( = ?auto_306784 ?auto_306794 ) ) ( not ( = ?auto_306785 ?auto_306786 ) ) ( not ( = ?auto_306785 ?auto_306787 ) ) ( not ( = ?auto_306785 ?auto_306788 ) ) ( not ( = ?auto_306785 ?auto_306789 ) ) ( not ( = ?auto_306785 ?auto_306790 ) ) ( not ( = ?auto_306785 ?auto_306791 ) ) ( not ( = ?auto_306785 ?auto_306792 ) ) ( not ( = ?auto_306785 ?auto_306793 ) ) ( not ( = ?auto_306785 ?auto_306794 ) ) ( not ( = ?auto_306786 ?auto_306787 ) ) ( not ( = ?auto_306786 ?auto_306788 ) ) ( not ( = ?auto_306786 ?auto_306789 ) ) ( not ( = ?auto_306786 ?auto_306790 ) ) ( not ( = ?auto_306786 ?auto_306791 ) ) ( not ( = ?auto_306786 ?auto_306792 ) ) ( not ( = ?auto_306786 ?auto_306793 ) ) ( not ( = ?auto_306786 ?auto_306794 ) ) ( not ( = ?auto_306787 ?auto_306788 ) ) ( not ( = ?auto_306787 ?auto_306789 ) ) ( not ( = ?auto_306787 ?auto_306790 ) ) ( not ( = ?auto_306787 ?auto_306791 ) ) ( not ( = ?auto_306787 ?auto_306792 ) ) ( not ( = ?auto_306787 ?auto_306793 ) ) ( not ( = ?auto_306787 ?auto_306794 ) ) ( not ( = ?auto_306788 ?auto_306789 ) ) ( not ( = ?auto_306788 ?auto_306790 ) ) ( not ( = ?auto_306788 ?auto_306791 ) ) ( not ( = ?auto_306788 ?auto_306792 ) ) ( not ( = ?auto_306788 ?auto_306793 ) ) ( not ( = ?auto_306788 ?auto_306794 ) ) ( not ( = ?auto_306789 ?auto_306790 ) ) ( not ( = ?auto_306789 ?auto_306791 ) ) ( not ( = ?auto_306789 ?auto_306792 ) ) ( not ( = ?auto_306789 ?auto_306793 ) ) ( not ( = ?auto_306789 ?auto_306794 ) ) ( not ( = ?auto_306790 ?auto_306791 ) ) ( not ( = ?auto_306790 ?auto_306792 ) ) ( not ( = ?auto_306790 ?auto_306793 ) ) ( not ( = ?auto_306790 ?auto_306794 ) ) ( not ( = ?auto_306791 ?auto_306792 ) ) ( not ( = ?auto_306791 ?auto_306793 ) ) ( not ( = ?auto_306791 ?auto_306794 ) ) ( not ( = ?auto_306792 ?auto_306793 ) ) ( not ( = ?auto_306792 ?auto_306794 ) ) ( not ( = ?auto_306793 ?auto_306794 ) ) ( ON ?auto_306792 ?auto_306793 ) ( ON ?auto_306791 ?auto_306792 ) ( ON ?auto_306790 ?auto_306791 ) ( CLEAR ?auto_306788 ) ( ON ?auto_306789 ?auto_306790 ) ( CLEAR ?auto_306789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_306783 ?auto_306784 ?auto_306785 ?auto_306786 ?auto_306787 ?auto_306788 ?auto_306789 )
      ( MAKE-11PILE ?auto_306783 ?auto_306784 ?auto_306785 ?auto_306786 ?auto_306787 ?auto_306788 ?auto_306789 ?auto_306790 ?auto_306791 ?auto_306792 ?auto_306793 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306806 - BLOCK
      ?auto_306807 - BLOCK
      ?auto_306808 - BLOCK
      ?auto_306809 - BLOCK
      ?auto_306810 - BLOCK
      ?auto_306811 - BLOCK
      ?auto_306812 - BLOCK
      ?auto_306813 - BLOCK
      ?auto_306814 - BLOCK
      ?auto_306815 - BLOCK
      ?auto_306816 - BLOCK
    )
    :vars
    (
      ?auto_306817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306816 ?auto_306817 ) ( ON-TABLE ?auto_306806 ) ( ON ?auto_306807 ?auto_306806 ) ( ON ?auto_306808 ?auto_306807 ) ( ON ?auto_306809 ?auto_306808 ) ( ON ?auto_306810 ?auto_306809 ) ( not ( = ?auto_306806 ?auto_306807 ) ) ( not ( = ?auto_306806 ?auto_306808 ) ) ( not ( = ?auto_306806 ?auto_306809 ) ) ( not ( = ?auto_306806 ?auto_306810 ) ) ( not ( = ?auto_306806 ?auto_306811 ) ) ( not ( = ?auto_306806 ?auto_306812 ) ) ( not ( = ?auto_306806 ?auto_306813 ) ) ( not ( = ?auto_306806 ?auto_306814 ) ) ( not ( = ?auto_306806 ?auto_306815 ) ) ( not ( = ?auto_306806 ?auto_306816 ) ) ( not ( = ?auto_306806 ?auto_306817 ) ) ( not ( = ?auto_306807 ?auto_306808 ) ) ( not ( = ?auto_306807 ?auto_306809 ) ) ( not ( = ?auto_306807 ?auto_306810 ) ) ( not ( = ?auto_306807 ?auto_306811 ) ) ( not ( = ?auto_306807 ?auto_306812 ) ) ( not ( = ?auto_306807 ?auto_306813 ) ) ( not ( = ?auto_306807 ?auto_306814 ) ) ( not ( = ?auto_306807 ?auto_306815 ) ) ( not ( = ?auto_306807 ?auto_306816 ) ) ( not ( = ?auto_306807 ?auto_306817 ) ) ( not ( = ?auto_306808 ?auto_306809 ) ) ( not ( = ?auto_306808 ?auto_306810 ) ) ( not ( = ?auto_306808 ?auto_306811 ) ) ( not ( = ?auto_306808 ?auto_306812 ) ) ( not ( = ?auto_306808 ?auto_306813 ) ) ( not ( = ?auto_306808 ?auto_306814 ) ) ( not ( = ?auto_306808 ?auto_306815 ) ) ( not ( = ?auto_306808 ?auto_306816 ) ) ( not ( = ?auto_306808 ?auto_306817 ) ) ( not ( = ?auto_306809 ?auto_306810 ) ) ( not ( = ?auto_306809 ?auto_306811 ) ) ( not ( = ?auto_306809 ?auto_306812 ) ) ( not ( = ?auto_306809 ?auto_306813 ) ) ( not ( = ?auto_306809 ?auto_306814 ) ) ( not ( = ?auto_306809 ?auto_306815 ) ) ( not ( = ?auto_306809 ?auto_306816 ) ) ( not ( = ?auto_306809 ?auto_306817 ) ) ( not ( = ?auto_306810 ?auto_306811 ) ) ( not ( = ?auto_306810 ?auto_306812 ) ) ( not ( = ?auto_306810 ?auto_306813 ) ) ( not ( = ?auto_306810 ?auto_306814 ) ) ( not ( = ?auto_306810 ?auto_306815 ) ) ( not ( = ?auto_306810 ?auto_306816 ) ) ( not ( = ?auto_306810 ?auto_306817 ) ) ( not ( = ?auto_306811 ?auto_306812 ) ) ( not ( = ?auto_306811 ?auto_306813 ) ) ( not ( = ?auto_306811 ?auto_306814 ) ) ( not ( = ?auto_306811 ?auto_306815 ) ) ( not ( = ?auto_306811 ?auto_306816 ) ) ( not ( = ?auto_306811 ?auto_306817 ) ) ( not ( = ?auto_306812 ?auto_306813 ) ) ( not ( = ?auto_306812 ?auto_306814 ) ) ( not ( = ?auto_306812 ?auto_306815 ) ) ( not ( = ?auto_306812 ?auto_306816 ) ) ( not ( = ?auto_306812 ?auto_306817 ) ) ( not ( = ?auto_306813 ?auto_306814 ) ) ( not ( = ?auto_306813 ?auto_306815 ) ) ( not ( = ?auto_306813 ?auto_306816 ) ) ( not ( = ?auto_306813 ?auto_306817 ) ) ( not ( = ?auto_306814 ?auto_306815 ) ) ( not ( = ?auto_306814 ?auto_306816 ) ) ( not ( = ?auto_306814 ?auto_306817 ) ) ( not ( = ?auto_306815 ?auto_306816 ) ) ( not ( = ?auto_306815 ?auto_306817 ) ) ( not ( = ?auto_306816 ?auto_306817 ) ) ( ON ?auto_306815 ?auto_306816 ) ( ON ?auto_306814 ?auto_306815 ) ( ON ?auto_306813 ?auto_306814 ) ( ON ?auto_306812 ?auto_306813 ) ( CLEAR ?auto_306810 ) ( ON ?auto_306811 ?auto_306812 ) ( CLEAR ?auto_306811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_306806 ?auto_306807 ?auto_306808 ?auto_306809 ?auto_306810 ?auto_306811 )
      ( MAKE-11PILE ?auto_306806 ?auto_306807 ?auto_306808 ?auto_306809 ?auto_306810 ?auto_306811 ?auto_306812 ?auto_306813 ?auto_306814 ?auto_306815 ?auto_306816 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306829 - BLOCK
      ?auto_306830 - BLOCK
      ?auto_306831 - BLOCK
      ?auto_306832 - BLOCK
      ?auto_306833 - BLOCK
      ?auto_306834 - BLOCK
      ?auto_306835 - BLOCK
      ?auto_306836 - BLOCK
      ?auto_306837 - BLOCK
      ?auto_306838 - BLOCK
      ?auto_306839 - BLOCK
    )
    :vars
    (
      ?auto_306840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306839 ?auto_306840 ) ( ON-TABLE ?auto_306829 ) ( ON ?auto_306830 ?auto_306829 ) ( ON ?auto_306831 ?auto_306830 ) ( ON ?auto_306832 ?auto_306831 ) ( ON ?auto_306833 ?auto_306832 ) ( not ( = ?auto_306829 ?auto_306830 ) ) ( not ( = ?auto_306829 ?auto_306831 ) ) ( not ( = ?auto_306829 ?auto_306832 ) ) ( not ( = ?auto_306829 ?auto_306833 ) ) ( not ( = ?auto_306829 ?auto_306834 ) ) ( not ( = ?auto_306829 ?auto_306835 ) ) ( not ( = ?auto_306829 ?auto_306836 ) ) ( not ( = ?auto_306829 ?auto_306837 ) ) ( not ( = ?auto_306829 ?auto_306838 ) ) ( not ( = ?auto_306829 ?auto_306839 ) ) ( not ( = ?auto_306829 ?auto_306840 ) ) ( not ( = ?auto_306830 ?auto_306831 ) ) ( not ( = ?auto_306830 ?auto_306832 ) ) ( not ( = ?auto_306830 ?auto_306833 ) ) ( not ( = ?auto_306830 ?auto_306834 ) ) ( not ( = ?auto_306830 ?auto_306835 ) ) ( not ( = ?auto_306830 ?auto_306836 ) ) ( not ( = ?auto_306830 ?auto_306837 ) ) ( not ( = ?auto_306830 ?auto_306838 ) ) ( not ( = ?auto_306830 ?auto_306839 ) ) ( not ( = ?auto_306830 ?auto_306840 ) ) ( not ( = ?auto_306831 ?auto_306832 ) ) ( not ( = ?auto_306831 ?auto_306833 ) ) ( not ( = ?auto_306831 ?auto_306834 ) ) ( not ( = ?auto_306831 ?auto_306835 ) ) ( not ( = ?auto_306831 ?auto_306836 ) ) ( not ( = ?auto_306831 ?auto_306837 ) ) ( not ( = ?auto_306831 ?auto_306838 ) ) ( not ( = ?auto_306831 ?auto_306839 ) ) ( not ( = ?auto_306831 ?auto_306840 ) ) ( not ( = ?auto_306832 ?auto_306833 ) ) ( not ( = ?auto_306832 ?auto_306834 ) ) ( not ( = ?auto_306832 ?auto_306835 ) ) ( not ( = ?auto_306832 ?auto_306836 ) ) ( not ( = ?auto_306832 ?auto_306837 ) ) ( not ( = ?auto_306832 ?auto_306838 ) ) ( not ( = ?auto_306832 ?auto_306839 ) ) ( not ( = ?auto_306832 ?auto_306840 ) ) ( not ( = ?auto_306833 ?auto_306834 ) ) ( not ( = ?auto_306833 ?auto_306835 ) ) ( not ( = ?auto_306833 ?auto_306836 ) ) ( not ( = ?auto_306833 ?auto_306837 ) ) ( not ( = ?auto_306833 ?auto_306838 ) ) ( not ( = ?auto_306833 ?auto_306839 ) ) ( not ( = ?auto_306833 ?auto_306840 ) ) ( not ( = ?auto_306834 ?auto_306835 ) ) ( not ( = ?auto_306834 ?auto_306836 ) ) ( not ( = ?auto_306834 ?auto_306837 ) ) ( not ( = ?auto_306834 ?auto_306838 ) ) ( not ( = ?auto_306834 ?auto_306839 ) ) ( not ( = ?auto_306834 ?auto_306840 ) ) ( not ( = ?auto_306835 ?auto_306836 ) ) ( not ( = ?auto_306835 ?auto_306837 ) ) ( not ( = ?auto_306835 ?auto_306838 ) ) ( not ( = ?auto_306835 ?auto_306839 ) ) ( not ( = ?auto_306835 ?auto_306840 ) ) ( not ( = ?auto_306836 ?auto_306837 ) ) ( not ( = ?auto_306836 ?auto_306838 ) ) ( not ( = ?auto_306836 ?auto_306839 ) ) ( not ( = ?auto_306836 ?auto_306840 ) ) ( not ( = ?auto_306837 ?auto_306838 ) ) ( not ( = ?auto_306837 ?auto_306839 ) ) ( not ( = ?auto_306837 ?auto_306840 ) ) ( not ( = ?auto_306838 ?auto_306839 ) ) ( not ( = ?auto_306838 ?auto_306840 ) ) ( not ( = ?auto_306839 ?auto_306840 ) ) ( ON ?auto_306838 ?auto_306839 ) ( ON ?auto_306837 ?auto_306838 ) ( ON ?auto_306836 ?auto_306837 ) ( ON ?auto_306835 ?auto_306836 ) ( CLEAR ?auto_306833 ) ( ON ?auto_306834 ?auto_306835 ) ( CLEAR ?auto_306834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_306829 ?auto_306830 ?auto_306831 ?auto_306832 ?auto_306833 ?auto_306834 )
      ( MAKE-11PILE ?auto_306829 ?auto_306830 ?auto_306831 ?auto_306832 ?auto_306833 ?auto_306834 ?auto_306835 ?auto_306836 ?auto_306837 ?auto_306838 ?auto_306839 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306852 - BLOCK
      ?auto_306853 - BLOCK
      ?auto_306854 - BLOCK
      ?auto_306855 - BLOCK
      ?auto_306856 - BLOCK
      ?auto_306857 - BLOCK
      ?auto_306858 - BLOCK
      ?auto_306859 - BLOCK
      ?auto_306860 - BLOCK
      ?auto_306861 - BLOCK
      ?auto_306862 - BLOCK
    )
    :vars
    (
      ?auto_306863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306862 ?auto_306863 ) ( ON-TABLE ?auto_306852 ) ( ON ?auto_306853 ?auto_306852 ) ( ON ?auto_306854 ?auto_306853 ) ( ON ?auto_306855 ?auto_306854 ) ( not ( = ?auto_306852 ?auto_306853 ) ) ( not ( = ?auto_306852 ?auto_306854 ) ) ( not ( = ?auto_306852 ?auto_306855 ) ) ( not ( = ?auto_306852 ?auto_306856 ) ) ( not ( = ?auto_306852 ?auto_306857 ) ) ( not ( = ?auto_306852 ?auto_306858 ) ) ( not ( = ?auto_306852 ?auto_306859 ) ) ( not ( = ?auto_306852 ?auto_306860 ) ) ( not ( = ?auto_306852 ?auto_306861 ) ) ( not ( = ?auto_306852 ?auto_306862 ) ) ( not ( = ?auto_306852 ?auto_306863 ) ) ( not ( = ?auto_306853 ?auto_306854 ) ) ( not ( = ?auto_306853 ?auto_306855 ) ) ( not ( = ?auto_306853 ?auto_306856 ) ) ( not ( = ?auto_306853 ?auto_306857 ) ) ( not ( = ?auto_306853 ?auto_306858 ) ) ( not ( = ?auto_306853 ?auto_306859 ) ) ( not ( = ?auto_306853 ?auto_306860 ) ) ( not ( = ?auto_306853 ?auto_306861 ) ) ( not ( = ?auto_306853 ?auto_306862 ) ) ( not ( = ?auto_306853 ?auto_306863 ) ) ( not ( = ?auto_306854 ?auto_306855 ) ) ( not ( = ?auto_306854 ?auto_306856 ) ) ( not ( = ?auto_306854 ?auto_306857 ) ) ( not ( = ?auto_306854 ?auto_306858 ) ) ( not ( = ?auto_306854 ?auto_306859 ) ) ( not ( = ?auto_306854 ?auto_306860 ) ) ( not ( = ?auto_306854 ?auto_306861 ) ) ( not ( = ?auto_306854 ?auto_306862 ) ) ( not ( = ?auto_306854 ?auto_306863 ) ) ( not ( = ?auto_306855 ?auto_306856 ) ) ( not ( = ?auto_306855 ?auto_306857 ) ) ( not ( = ?auto_306855 ?auto_306858 ) ) ( not ( = ?auto_306855 ?auto_306859 ) ) ( not ( = ?auto_306855 ?auto_306860 ) ) ( not ( = ?auto_306855 ?auto_306861 ) ) ( not ( = ?auto_306855 ?auto_306862 ) ) ( not ( = ?auto_306855 ?auto_306863 ) ) ( not ( = ?auto_306856 ?auto_306857 ) ) ( not ( = ?auto_306856 ?auto_306858 ) ) ( not ( = ?auto_306856 ?auto_306859 ) ) ( not ( = ?auto_306856 ?auto_306860 ) ) ( not ( = ?auto_306856 ?auto_306861 ) ) ( not ( = ?auto_306856 ?auto_306862 ) ) ( not ( = ?auto_306856 ?auto_306863 ) ) ( not ( = ?auto_306857 ?auto_306858 ) ) ( not ( = ?auto_306857 ?auto_306859 ) ) ( not ( = ?auto_306857 ?auto_306860 ) ) ( not ( = ?auto_306857 ?auto_306861 ) ) ( not ( = ?auto_306857 ?auto_306862 ) ) ( not ( = ?auto_306857 ?auto_306863 ) ) ( not ( = ?auto_306858 ?auto_306859 ) ) ( not ( = ?auto_306858 ?auto_306860 ) ) ( not ( = ?auto_306858 ?auto_306861 ) ) ( not ( = ?auto_306858 ?auto_306862 ) ) ( not ( = ?auto_306858 ?auto_306863 ) ) ( not ( = ?auto_306859 ?auto_306860 ) ) ( not ( = ?auto_306859 ?auto_306861 ) ) ( not ( = ?auto_306859 ?auto_306862 ) ) ( not ( = ?auto_306859 ?auto_306863 ) ) ( not ( = ?auto_306860 ?auto_306861 ) ) ( not ( = ?auto_306860 ?auto_306862 ) ) ( not ( = ?auto_306860 ?auto_306863 ) ) ( not ( = ?auto_306861 ?auto_306862 ) ) ( not ( = ?auto_306861 ?auto_306863 ) ) ( not ( = ?auto_306862 ?auto_306863 ) ) ( ON ?auto_306861 ?auto_306862 ) ( ON ?auto_306860 ?auto_306861 ) ( ON ?auto_306859 ?auto_306860 ) ( ON ?auto_306858 ?auto_306859 ) ( ON ?auto_306857 ?auto_306858 ) ( CLEAR ?auto_306855 ) ( ON ?auto_306856 ?auto_306857 ) ( CLEAR ?auto_306856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_306852 ?auto_306853 ?auto_306854 ?auto_306855 ?auto_306856 )
      ( MAKE-11PILE ?auto_306852 ?auto_306853 ?auto_306854 ?auto_306855 ?auto_306856 ?auto_306857 ?auto_306858 ?auto_306859 ?auto_306860 ?auto_306861 ?auto_306862 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306875 - BLOCK
      ?auto_306876 - BLOCK
      ?auto_306877 - BLOCK
      ?auto_306878 - BLOCK
      ?auto_306879 - BLOCK
      ?auto_306880 - BLOCK
      ?auto_306881 - BLOCK
      ?auto_306882 - BLOCK
      ?auto_306883 - BLOCK
      ?auto_306884 - BLOCK
      ?auto_306885 - BLOCK
    )
    :vars
    (
      ?auto_306886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306885 ?auto_306886 ) ( ON-TABLE ?auto_306875 ) ( ON ?auto_306876 ?auto_306875 ) ( ON ?auto_306877 ?auto_306876 ) ( ON ?auto_306878 ?auto_306877 ) ( not ( = ?auto_306875 ?auto_306876 ) ) ( not ( = ?auto_306875 ?auto_306877 ) ) ( not ( = ?auto_306875 ?auto_306878 ) ) ( not ( = ?auto_306875 ?auto_306879 ) ) ( not ( = ?auto_306875 ?auto_306880 ) ) ( not ( = ?auto_306875 ?auto_306881 ) ) ( not ( = ?auto_306875 ?auto_306882 ) ) ( not ( = ?auto_306875 ?auto_306883 ) ) ( not ( = ?auto_306875 ?auto_306884 ) ) ( not ( = ?auto_306875 ?auto_306885 ) ) ( not ( = ?auto_306875 ?auto_306886 ) ) ( not ( = ?auto_306876 ?auto_306877 ) ) ( not ( = ?auto_306876 ?auto_306878 ) ) ( not ( = ?auto_306876 ?auto_306879 ) ) ( not ( = ?auto_306876 ?auto_306880 ) ) ( not ( = ?auto_306876 ?auto_306881 ) ) ( not ( = ?auto_306876 ?auto_306882 ) ) ( not ( = ?auto_306876 ?auto_306883 ) ) ( not ( = ?auto_306876 ?auto_306884 ) ) ( not ( = ?auto_306876 ?auto_306885 ) ) ( not ( = ?auto_306876 ?auto_306886 ) ) ( not ( = ?auto_306877 ?auto_306878 ) ) ( not ( = ?auto_306877 ?auto_306879 ) ) ( not ( = ?auto_306877 ?auto_306880 ) ) ( not ( = ?auto_306877 ?auto_306881 ) ) ( not ( = ?auto_306877 ?auto_306882 ) ) ( not ( = ?auto_306877 ?auto_306883 ) ) ( not ( = ?auto_306877 ?auto_306884 ) ) ( not ( = ?auto_306877 ?auto_306885 ) ) ( not ( = ?auto_306877 ?auto_306886 ) ) ( not ( = ?auto_306878 ?auto_306879 ) ) ( not ( = ?auto_306878 ?auto_306880 ) ) ( not ( = ?auto_306878 ?auto_306881 ) ) ( not ( = ?auto_306878 ?auto_306882 ) ) ( not ( = ?auto_306878 ?auto_306883 ) ) ( not ( = ?auto_306878 ?auto_306884 ) ) ( not ( = ?auto_306878 ?auto_306885 ) ) ( not ( = ?auto_306878 ?auto_306886 ) ) ( not ( = ?auto_306879 ?auto_306880 ) ) ( not ( = ?auto_306879 ?auto_306881 ) ) ( not ( = ?auto_306879 ?auto_306882 ) ) ( not ( = ?auto_306879 ?auto_306883 ) ) ( not ( = ?auto_306879 ?auto_306884 ) ) ( not ( = ?auto_306879 ?auto_306885 ) ) ( not ( = ?auto_306879 ?auto_306886 ) ) ( not ( = ?auto_306880 ?auto_306881 ) ) ( not ( = ?auto_306880 ?auto_306882 ) ) ( not ( = ?auto_306880 ?auto_306883 ) ) ( not ( = ?auto_306880 ?auto_306884 ) ) ( not ( = ?auto_306880 ?auto_306885 ) ) ( not ( = ?auto_306880 ?auto_306886 ) ) ( not ( = ?auto_306881 ?auto_306882 ) ) ( not ( = ?auto_306881 ?auto_306883 ) ) ( not ( = ?auto_306881 ?auto_306884 ) ) ( not ( = ?auto_306881 ?auto_306885 ) ) ( not ( = ?auto_306881 ?auto_306886 ) ) ( not ( = ?auto_306882 ?auto_306883 ) ) ( not ( = ?auto_306882 ?auto_306884 ) ) ( not ( = ?auto_306882 ?auto_306885 ) ) ( not ( = ?auto_306882 ?auto_306886 ) ) ( not ( = ?auto_306883 ?auto_306884 ) ) ( not ( = ?auto_306883 ?auto_306885 ) ) ( not ( = ?auto_306883 ?auto_306886 ) ) ( not ( = ?auto_306884 ?auto_306885 ) ) ( not ( = ?auto_306884 ?auto_306886 ) ) ( not ( = ?auto_306885 ?auto_306886 ) ) ( ON ?auto_306884 ?auto_306885 ) ( ON ?auto_306883 ?auto_306884 ) ( ON ?auto_306882 ?auto_306883 ) ( ON ?auto_306881 ?auto_306882 ) ( ON ?auto_306880 ?auto_306881 ) ( CLEAR ?auto_306878 ) ( ON ?auto_306879 ?auto_306880 ) ( CLEAR ?auto_306879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_306875 ?auto_306876 ?auto_306877 ?auto_306878 ?auto_306879 )
      ( MAKE-11PILE ?auto_306875 ?auto_306876 ?auto_306877 ?auto_306878 ?auto_306879 ?auto_306880 ?auto_306881 ?auto_306882 ?auto_306883 ?auto_306884 ?auto_306885 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306898 - BLOCK
      ?auto_306899 - BLOCK
      ?auto_306900 - BLOCK
      ?auto_306901 - BLOCK
      ?auto_306902 - BLOCK
      ?auto_306903 - BLOCK
      ?auto_306904 - BLOCK
      ?auto_306905 - BLOCK
      ?auto_306906 - BLOCK
      ?auto_306907 - BLOCK
      ?auto_306908 - BLOCK
    )
    :vars
    (
      ?auto_306909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306908 ?auto_306909 ) ( ON-TABLE ?auto_306898 ) ( ON ?auto_306899 ?auto_306898 ) ( ON ?auto_306900 ?auto_306899 ) ( not ( = ?auto_306898 ?auto_306899 ) ) ( not ( = ?auto_306898 ?auto_306900 ) ) ( not ( = ?auto_306898 ?auto_306901 ) ) ( not ( = ?auto_306898 ?auto_306902 ) ) ( not ( = ?auto_306898 ?auto_306903 ) ) ( not ( = ?auto_306898 ?auto_306904 ) ) ( not ( = ?auto_306898 ?auto_306905 ) ) ( not ( = ?auto_306898 ?auto_306906 ) ) ( not ( = ?auto_306898 ?auto_306907 ) ) ( not ( = ?auto_306898 ?auto_306908 ) ) ( not ( = ?auto_306898 ?auto_306909 ) ) ( not ( = ?auto_306899 ?auto_306900 ) ) ( not ( = ?auto_306899 ?auto_306901 ) ) ( not ( = ?auto_306899 ?auto_306902 ) ) ( not ( = ?auto_306899 ?auto_306903 ) ) ( not ( = ?auto_306899 ?auto_306904 ) ) ( not ( = ?auto_306899 ?auto_306905 ) ) ( not ( = ?auto_306899 ?auto_306906 ) ) ( not ( = ?auto_306899 ?auto_306907 ) ) ( not ( = ?auto_306899 ?auto_306908 ) ) ( not ( = ?auto_306899 ?auto_306909 ) ) ( not ( = ?auto_306900 ?auto_306901 ) ) ( not ( = ?auto_306900 ?auto_306902 ) ) ( not ( = ?auto_306900 ?auto_306903 ) ) ( not ( = ?auto_306900 ?auto_306904 ) ) ( not ( = ?auto_306900 ?auto_306905 ) ) ( not ( = ?auto_306900 ?auto_306906 ) ) ( not ( = ?auto_306900 ?auto_306907 ) ) ( not ( = ?auto_306900 ?auto_306908 ) ) ( not ( = ?auto_306900 ?auto_306909 ) ) ( not ( = ?auto_306901 ?auto_306902 ) ) ( not ( = ?auto_306901 ?auto_306903 ) ) ( not ( = ?auto_306901 ?auto_306904 ) ) ( not ( = ?auto_306901 ?auto_306905 ) ) ( not ( = ?auto_306901 ?auto_306906 ) ) ( not ( = ?auto_306901 ?auto_306907 ) ) ( not ( = ?auto_306901 ?auto_306908 ) ) ( not ( = ?auto_306901 ?auto_306909 ) ) ( not ( = ?auto_306902 ?auto_306903 ) ) ( not ( = ?auto_306902 ?auto_306904 ) ) ( not ( = ?auto_306902 ?auto_306905 ) ) ( not ( = ?auto_306902 ?auto_306906 ) ) ( not ( = ?auto_306902 ?auto_306907 ) ) ( not ( = ?auto_306902 ?auto_306908 ) ) ( not ( = ?auto_306902 ?auto_306909 ) ) ( not ( = ?auto_306903 ?auto_306904 ) ) ( not ( = ?auto_306903 ?auto_306905 ) ) ( not ( = ?auto_306903 ?auto_306906 ) ) ( not ( = ?auto_306903 ?auto_306907 ) ) ( not ( = ?auto_306903 ?auto_306908 ) ) ( not ( = ?auto_306903 ?auto_306909 ) ) ( not ( = ?auto_306904 ?auto_306905 ) ) ( not ( = ?auto_306904 ?auto_306906 ) ) ( not ( = ?auto_306904 ?auto_306907 ) ) ( not ( = ?auto_306904 ?auto_306908 ) ) ( not ( = ?auto_306904 ?auto_306909 ) ) ( not ( = ?auto_306905 ?auto_306906 ) ) ( not ( = ?auto_306905 ?auto_306907 ) ) ( not ( = ?auto_306905 ?auto_306908 ) ) ( not ( = ?auto_306905 ?auto_306909 ) ) ( not ( = ?auto_306906 ?auto_306907 ) ) ( not ( = ?auto_306906 ?auto_306908 ) ) ( not ( = ?auto_306906 ?auto_306909 ) ) ( not ( = ?auto_306907 ?auto_306908 ) ) ( not ( = ?auto_306907 ?auto_306909 ) ) ( not ( = ?auto_306908 ?auto_306909 ) ) ( ON ?auto_306907 ?auto_306908 ) ( ON ?auto_306906 ?auto_306907 ) ( ON ?auto_306905 ?auto_306906 ) ( ON ?auto_306904 ?auto_306905 ) ( ON ?auto_306903 ?auto_306904 ) ( ON ?auto_306902 ?auto_306903 ) ( CLEAR ?auto_306900 ) ( ON ?auto_306901 ?auto_306902 ) ( CLEAR ?auto_306901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_306898 ?auto_306899 ?auto_306900 ?auto_306901 )
      ( MAKE-11PILE ?auto_306898 ?auto_306899 ?auto_306900 ?auto_306901 ?auto_306902 ?auto_306903 ?auto_306904 ?auto_306905 ?auto_306906 ?auto_306907 ?auto_306908 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306921 - BLOCK
      ?auto_306922 - BLOCK
      ?auto_306923 - BLOCK
      ?auto_306924 - BLOCK
      ?auto_306925 - BLOCK
      ?auto_306926 - BLOCK
      ?auto_306927 - BLOCK
      ?auto_306928 - BLOCK
      ?auto_306929 - BLOCK
      ?auto_306930 - BLOCK
      ?auto_306931 - BLOCK
    )
    :vars
    (
      ?auto_306932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306931 ?auto_306932 ) ( ON-TABLE ?auto_306921 ) ( ON ?auto_306922 ?auto_306921 ) ( ON ?auto_306923 ?auto_306922 ) ( not ( = ?auto_306921 ?auto_306922 ) ) ( not ( = ?auto_306921 ?auto_306923 ) ) ( not ( = ?auto_306921 ?auto_306924 ) ) ( not ( = ?auto_306921 ?auto_306925 ) ) ( not ( = ?auto_306921 ?auto_306926 ) ) ( not ( = ?auto_306921 ?auto_306927 ) ) ( not ( = ?auto_306921 ?auto_306928 ) ) ( not ( = ?auto_306921 ?auto_306929 ) ) ( not ( = ?auto_306921 ?auto_306930 ) ) ( not ( = ?auto_306921 ?auto_306931 ) ) ( not ( = ?auto_306921 ?auto_306932 ) ) ( not ( = ?auto_306922 ?auto_306923 ) ) ( not ( = ?auto_306922 ?auto_306924 ) ) ( not ( = ?auto_306922 ?auto_306925 ) ) ( not ( = ?auto_306922 ?auto_306926 ) ) ( not ( = ?auto_306922 ?auto_306927 ) ) ( not ( = ?auto_306922 ?auto_306928 ) ) ( not ( = ?auto_306922 ?auto_306929 ) ) ( not ( = ?auto_306922 ?auto_306930 ) ) ( not ( = ?auto_306922 ?auto_306931 ) ) ( not ( = ?auto_306922 ?auto_306932 ) ) ( not ( = ?auto_306923 ?auto_306924 ) ) ( not ( = ?auto_306923 ?auto_306925 ) ) ( not ( = ?auto_306923 ?auto_306926 ) ) ( not ( = ?auto_306923 ?auto_306927 ) ) ( not ( = ?auto_306923 ?auto_306928 ) ) ( not ( = ?auto_306923 ?auto_306929 ) ) ( not ( = ?auto_306923 ?auto_306930 ) ) ( not ( = ?auto_306923 ?auto_306931 ) ) ( not ( = ?auto_306923 ?auto_306932 ) ) ( not ( = ?auto_306924 ?auto_306925 ) ) ( not ( = ?auto_306924 ?auto_306926 ) ) ( not ( = ?auto_306924 ?auto_306927 ) ) ( not ( = ?auto_306924 ?auto_306928 ) ) ( not ( = ?auto_306924 ?auto_306929 ) ) ( not ( = ?auto_306924 ?auto_306930 ) ) ( not ( = ?auto_306924 ?auto_306931 ) ) ( not ( = ?auto_306924 ?auto_306932 ) ) ( not ( = ?auto_306925 ?auto_306926 ) ) ( not ( = ?auto_306925 ?auto_306927 ) ) ( not ( = ?auto_306925 ?auto_306928 ) ) ( not ( = ?auto_306925 ?auto_306929 ) ) ( not ( = ?auto_306925 ?auto_306930 ) ) ( not ( = ?auto_306925 ?auto_306931 ) ) ( not ( = ?auto_306925 ?auto_306932 ) ) ( not ( = ?auto_306926 ?auto_306927 ) ) ( not ( = ?auto_306926 ?auto_306928 ) ) ( not ( = ?auto_306926 ?auto_306929 ) ) ( not ( = ?auto_306926 ?auto_306930 ) ) ( not ( = ?auto_306926 ?auto_306931 ) ) ( not ( = ?auto_306926 ?auto_306932 ) ) ( not ( = ?auto_306927 ?auto_306928 ) ) ( not ( = ?auto_306927 ?auto_306929 ) ) ( not ( = ?auto_306927 ?auto_306930 ) ) ( not ( = ?auto_306927 ?auto_306931 ) ) ( not ( = ?auto_306927 ?auto_306932 ) ) ( not ( = ?auto_306928 ?auto_306929 ) ) ( not ( = ?auto_306928 ?auto_306930 ) ) ( not ( = ?auto_306928 ?auto_306931 ) ) ( not ( = ?auto_306928 ?auto_306932 ) ) ( not ( = ?auto_306929 ?auto_306930 ) ) ( not ( = ?auto_306929 ?auto_306931 ) ) ( not ( = ?auto_306929 ?auto_306932 ) ) ( not ( = ?auto_306930 ?auto_306931 ) ) ( not ( = ?auto_306930 ?auto_306932 ) ) ( not ( = ?auto_306931 ?auto_306932 ) ) ( ON ?auto_306930 ?auto_306931 ) ( ON ?auto_306929 ?auto_306930 ) ( ON ?auto_306928 ?auto_306929 ) ( ON ?auto_306927 ?auto_306928 ) ( ON ?auto_306926 ?auto_306927 ) ( ON ?auto_306925 ?auto_306926 ) ( CLEAR ?auto_306923 ) ( ON ?auto_306924 ?auto_306925 ) ( CLEAR ?auto_306924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_306921 ?auto_306922 ?auto_306923 ?auto_306924 )
      ( MAKE-11PILE ?auto_306921 ?auto_306922 ?auto_306923 ?auto_306924 ?auto_306925 ?auto_306926 ?auto_306927 ?auto_306928 ?auto_306929 ?auto_306930 ?auto_306931 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306944 - BLOCK
      ?auto_306945 - BLOCK
      ?auto_306946 - BLOCK
      ?auto_306947 - BLOCK
      ?auto_306948 - BLOCK
      ?auto_306949 - BLOCK
      ?auto_306950 - BLOCK
      ?auto_306951 - BLOCK
      ?auto_306952 - BLOCK
      ?auto_306953 - BLOCK
      ?auto_306954 - BLOCK
    )
    :vars
    (
      ?auto_306955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306954 ?auto_306955 ) ( ON-TABLE ?auto_306944 ) ( ON ?auto_306945 ?auto_306944 ) ( not ( = ?auto_306944 ?auto_306945 ) ) ( not ( = ?auto_306944 ?auto_306946 ) ) ( not ( = ?auto_306944 ?auto_306947 ) ) ( not ( = ?auto_306944 ?auto_306948 ) ) ( not ( = ?auto_306944 ?auto_306949 ) ) ( not ( = ?auto_306944 ?auto_306950 ) ) ( not ( = ?auto_306944 ?auto_306951 ) ) ( not ( = ?auto_306944 ?auto_306952 ) ) ( not ( = ?auto_306944 ?auto_306953 ) ) ( not ( = ?auto_306944 ?auto_306954 ) ) ( not ( = ?auto_306944 ?auto_306955 ) ) ( not ( = ?auto_306945 ?auto_306946 ) ) ( not ( = ?auto_306945 ?auto_306947 ) ) ( not ( = ?auto_306945 ?auto_306948 ) ) ( not ( = ?auto_306945 ?auto_306949 ) ) ( not ( = ?auto_306945 ?auto_306950 ) ) ( not ( = ?auto_306945 ?auto_306951 ) ) ( not ( = ?auto_306945 ?auto_306952 ) ) ( not ( = ?auto_306945 ?auto_306953 ) ) ( not ( = ?auto_306945 ?auto_306954 ) ) ( not ( = ?auto_306945 ?auto_306955 ) ) ( not ( = ?auto_306946 ?auto_306947 ) ) ( not ( = ?auto_306946 ?auto_306948 ) ) ( not ( = ?auto_306946 ?auto_306949 ) ) ( not ( = ?auto_306946 ?auto_306950 ) ) ( not ( = ?auto_306946 ?auto_306951 ) ) ( not ( = ?auto_306946 ?auto_306952 ) ) ( not ( = ?auto_306946 ?auto_306953 ) ) ( not ( = ?auto_306946 ?auto_306954 ) ) ( not ( = ?auto_306946 ?auto_306955 ) ) ( not ( = ?auto_306947 ?auto_306948 ) ) ( not ( = ?auto_306947 ?auto_306949 ) ) ( not ( = ?auto_306947 ?auto_306950 ) ) ( not ( = ?auto_306947 ?auto_306951 ) ) ( not ( = ?auto_306947 ?auto_306952 ) ) ( not ( = ?auto_306947 ?auto_306953 ) ) ( not ( = ?auto_306947 ?auto_306954 ) ) ( not ( = ?auto_306947 ?auto_306955 ) ) ( not ( = ?auto_306948 ?auto_306949 ) ) ( not ( = ?auto_306948 ?auto_306950 ) ) ( not ( = ?auto_306948 ?auto_306951 ) ) ( not ( = ?auto_306948 ?auto_306952 ) ) ( not ( = ?auto_306948 ?auto_306953 ) ) ( not ( = ?auto_306948 ?auto_306954 ) ) ( not ( = ?auto_306948 ?auto_306955 ) ) ( not ( = ?auto_306949 ?auto_306950 ) ) ( not ( = ?auto_306949 ?auto_306951 ) ) ( not ( = ?auto_306949 ?auto_306952 ) ) ( not ( = ?auto_306949 ?auto_306953 ) ) ( not ( = ?auto_306949 ?auto_306954 ) ) ( not ( = ?auto_306949 ?auto_306955 ) ) ( not ( = ?auto_306950 ?auto_306951 ) ) ( not ( = ?auto_306950 ?auto_306952 ) ) ( not ( = ?auto_306950 ?auto_306953 ) ) ( not ( = ?auto_306950 ?auto_306954 ) ) ( not ( = ?auto_306950 ?auto_306955 ) ) ( not ( = ?auto_306951 ?auto_306952 ) ) ( not ( = ?auto_306951 ?auto_306953 ) ) ( not ( = ?auto_306951 ?auto_306954 ) ) ( not ( = ?auto_306951 ?auto_306955 ) ) ( not ( = ?auto_306952 ?auto_306953 ) ) ( not ( = ?auto_306952 ?auto_306954 ) ) ( not ( = ?auto_306952 ?auto_306955 ) ) ( not ( = ?auto_306953 ?auto_306954 ) ) ( not ( = ?auto_306953 ?auto_306955 ) ) ( not ( = ?auto_306954 ?auto_306955 ) ) ( ON ?auto_306953 ?auto_306954 ) ( ON ?auto_306952 ?auto_306953 ) ( ON ?auto_306951 ?auto_306952 ) ( ON ?auto_306950 ?auto_306951 ) ( ON ?auto_306949 ?auto_306950 ) ( ON ?auto_306948 ?auto_306949 ) ( ON ?auto_306947 ?auto_306948 ) ( CLEAR ?auto_306945 ) ( ON ?auto_306946 ?auto_306947 ) ( CLEAR ?auto_306946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_306944 ?auto_306945 ?auto_306946 )
      ( MAKE-11PILE ?auto_306944 ?auto_306945 ?auto_306946 ?auto_306947 ?auto_306948 ?auto_306949 ?auto_306950 ?auto_306951 ?auto_306952 ?auto_306953 ?auto_306954 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306967 - BLOCK
      ?auto_306968 - BLOCK
      ?auto_306969 - BLOCK
      ?auto_306970 - BLOCK
      ?auto_306971 - BLOCK
      ?auto_306972 - BLOCK
      ?auto_306973 - BLOCK
      ?auto_306974 - BLOCK
      ?auto_306975 - BLOCK
      ?auto_306976 - BLOCK
      ?auto_306977 - BLOCK
    )
    :vars
    (
      ?auto_306978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_306977 ?auto_306978 ) ( ON-TABLE ?auto_306967 ) ( ON ?auto_306968 ?auto_306967 ) ( not ( = ?auto_306967 ?auto_306968 ) ) ( not ( = ?auto_306967 ?auto_306969 ) ) ( not ( = ?auto_306967 ?auto_306970 ) ) ( not ( = ?auto_306967 ?auto_306971 ) ) ( not ( = ?auto_306967 ?auto_306972 ) ) ( not ( = ?auto_306967 ?auto_306973 ) ) ( not ( = ?auto_306967 ?auto_306974 ) ) ( not ( = ?auto_306967 ?auto_306975 ) ) ( not ( = ?auto_306967 ?auto_306976 ) ) ( not ( = ?auto_306967 ?auto_306977 ) ) ( not ( = ?auto_306967 ?auto_306978 ) ) ( not ( = ?auto_306968 ?auto_306969 ) ) ( not ( = ?auto_306968 ?auto_306970 ) ) ( not ( = ?auto_306968 ?auto_306971 ) ) ( not ( = ?auto_306968 ?auto_306972 ) ) ( not ( = ?auto_306968 ?auto_306973 ) ) ( not ( = ?auto_306968 ?auto_306974 ) ) ( not ( = ?auto_306968 ?auto_306975 ) ) ( not ( = ?auto_306968 ?auto_306976 ) ) ( not ( = ?auto_306968 ?auto_306977 ) ) ( not ( = ?auto_306968 ?auto_306978 ) ) ( not ( = ?auto_306969 ?auto_306970 ) ) ( not ( = ?auto_306969 ?auto_306971 ) ) ( not ( = ?auto_306969 ?auto_306972 ) ) ( not ( = ?auto_306969 ?auto_306973 ) ) ( not ( = ?auto_306969 ?auto_306974 ) ) ( not ( = ?auto_306969 ?auto_306975 ) ) ( not ( = ?auto_306969 ?auto_306976 ) ) ( not ( = ?auto_306969 ?auto_306977 ) ) ( not ( = ?auto_306969 ?auto_306978 ) ) ( not ( = ?auto_306970 ?auto_306971 ) ) ( not ( = ?auto_306970 ?auto_306972 ) ) ( not ( = ?auto_306970 ?auto_306973 ) ) ( not ( = ?auto_306970 ?auto_306974 ) ) ( not ( = ?auto_306970 ?auto_306975 ) ) ( not ( = ?auto_306970 ?auto_306976 ) ) ( not ( = ?auto_306970 ?auto_306977 ) ) ( not ( = ?auto_306970 ?auto_306978 ) ) ( not ( = ?auto_306971 ?auto_306972 ) ) ( not ( = ?auto_306971 ?auto_306973 ) ) ( not ( = ?auto_306971 ?auto_306974 ) ) ( not ( = ?auto_306971 ?auto_306975 ) ) ( not ( = ?auto_306971 ?auto_306976 ) ) ( not ( = ?auto_306971 ?auto_306977 ) ) ( not ( = ?auto_306971 ?auto_306978 ) ) ( not ( = ?auto_306972 ?auto_306973 ) ) ( not ( = ?auto_306972 ?auto_306974 ) ) ( not ( = ?auto_306972 ?auto_306975 ) ) ( not ( = ?auto_306972 ?auto_306976 ) ) ( not ( = ?auto_306972 ?auto_306977 ) ) ( not ( = ?auto_306972 ?auto_306978 ) ) ( not ( = ?auto_306973 ?auto_306974 ) ) ( not ( = ?auto_306973 ?auto_306975 ) ) ( not ( = ?auto_306973 ?auto_306976 ) ) ( not ( = ?auto_306973 ?auto_306977 ) ) ( not ( = ?auto_306973 ?auto_306978 ) ) ( not ( = ?auto_306974 ?auto_306975 ) ) ( not ( = ?auto_306974 ?auto_306976 ) ) ( not ( = ?auto_306974 ?auto_306977 ) ) ( not ( = ?auto_306974 ?auto_306978 ) ) ( not ( = ?auto_306975 ?auto_306976 ) ) ( not ( = ?auto_306975 ?auto_306977 ) ) ( not ( = ?auto_306975 ?auto_306978 ) ) ( not ( = ?auto_306976 ?auto_306977 ) ) ( not ( = ?auto_306976 ?auto_306978 ) ) ( not ( = ?auto_306977 ?auto_306978 ) ) ( ON ?auto_306976 ?auto_306977 ) ( ON ?auto_306975 ?auto_306976 ) ( ON ?auto_306974 ?auto_306975 ) ( ON ?auto_306973 ?auto_306974 ) ( ON ?auto_306972 ?auto_306973 ) ( ON ?auto_306971 ?auto_306972 ) ( ON ?auto_306970 ?auto_306971 ) ( CLEAR ?auto_306968 ) ( ON ?auto_306969 ?auto_306970 ) ( CLEAR ?auto_306969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_306967 ?auto_306968 ?auto_306969 )
      ( MAKE-11PILE ?auto_306967 ?auto_306968 ?auto_306969 ?auto_306970 ?auto_306971 ?auto_306972 ?auto_306973 ?auto_306974 ?auto_306975 ?auto_306976 ?auto_306977 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_306990 - BLOCK
      ?auto_306991 - BLOCK
      ?auto_306992 - BLOCK
      ?auto_306993 - BLOCK
      ?auto_306994 - BLOCK
      ?auto_306995 - BLOCK
      ?auto_306996 - BLOCK
      ?auto_306997 - BLOCK
      ?auto_306998 - BLOCK
      ?auto_306999 - BLOCK
      ?auto_307000 - BLOCK
    )
    :vars
    (
      ?auto_307001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307000 ?auto_307001 ) ( ON-TABLE ?auto_306990 ) ( not ( = ?auto_306990 ?auto_306991 ) ) ( not ( = ?auto_306990 ?auto_306992 ) ) ( not ( = ?auto_306990 ?auto_306993 ) ) ( not ( = ?auto_306990 ?auto_306994 ) ) ( not ( = ?auto_306990 ?auto_306995 ) ) ( not ( = ?auto_306990 ?auto_306996 ) ) ( not ( = ?auto_306990 ?auto_306997 ) ) ( not ( = ?auto_306990 ?auto_306998 ) ) ( not ( = ?auto_306990 ?auto_306999 ) ) ( not ( = ?auto_306990 ?auto_307000 ) ) ( not ( = ?auto_306990 ?auto_307001 ) ) ( not ( = ?auto_306991 ?auto_306992 ) ) ( not ( = ?auto_306991 ?auto_306993 ) ) ( not ( = ?auto_306991 ?auto_306994 ) ) ( not ( = ?auto_306991 ?auto_306995 ) ) ( not ( = ?auto_306991 ?auto_306996 ) ) ( not ( = ?auto_306991 ?auto_306997 ) ) ( not ( = ?auto_306991 ?auto_306998 ) ) ( not ( = ?auto_306991 ?auto_306999 ) ) ( not ( = ?auto_306991 ?auto_307000 ) ) ( not ( = ?auto_306991 ?auto_307001 ) ) ( not ( = ?auto_306992 ?auto_306993 ) ) ( not ( = ?auto_306992 ?auto_306994 ) ) ( not ( = ?auto_306992 ?auto_306995 ) ) ( not ( = ?auto_306992 ?auto_306996 ) ) ( not ( = ?auto_306992 ?auto_306997 ) ) ( not ( = ?auto_306992 ?auto_306998 ) ) ( not ( = ?auto_306992 ?auto_306999 ) ) ( not ( = ?auto_306992 ?auto_307000 ) ) ( not ( = ?auto_306992 ?auto_307001 ) ) ( not ( = ?auto_306993 ?auto_306994 ) ) ( not ( = ?auto_306993 ?auto_306995 ) ) ( not ( = ?auto_306993 ?auto_306996 ) ) ( not ( = ?auto_306993 ?auto_306997 ) ) ( not ( = ?auto_306993 ?auto_306998 ) ) ( not ( = ?auto_306993 ?auto_306999 ) ) ( not ( = ?auto_306993 ?auto_307000 ) ) ( not ( = ?auto_306993 ?auto_307001 ) ) ( not ( = ?auto_306994 ?auto_306995 ) ) ( not ( = ?auto_306994 ?auto_306996 ) ) ( not ( = ?auto_306994 ?auto_306997 ) ) ( not ( = ?auto_306994 ?auto_306998 ) ) ( not ( = ?auto_306994 ?auto_306999 ) ) ( not ( = ?auto_306994 ?auto_307000 ) ) ( not ( = ?auto_306994 ?auto_307001 ) ) ( not ( = ?auto_306995 ?auto_306996 ) ) ( not ( = ?auto_306995 ?auto_306997 ) ) ( not ( = ?auto_306995 ?auto_306998 ) ) ( not ( = ?auto_306995 ?auto_306999 ) ) ( not ( = ?auto_306995 ?auto_307000 ) ) ( not ( = ?auto_306995 ?auto_307001 ) ) ( not ( = ?auto_306996 ?auto_306997 ) ) ( not ( = ?auto_306996 ?auto_306998 ) ) ( not ( = ?auto_306996 ?auto_306999 ) ) ( not ( = ?auto_306996 ?auto_307000 ) ) ( not ( = ?auto_306996 ?auto_307001 ) ) ( not ( = ?auto_306997 ?auto_306998 ) ) ( not ( = ?auto_306997 ?auto_306999 ) ) ( not ( = ?auto_306997 ?auto_307000 ) ) ( not ( = ?auto_306997 ?auto_307001 ) ) ( not ( = ?auto_306998 ?auto_306999 ) ) ( not ( = ?auto_306998 ?auto_307000 ) ) ( not ( = ?auto_306998 ?auto_307001 ) ) ( not ( = ?auto_306999 ?auto_307000 ) ) ( not ( = ?auto_306999 ?auto_307001 ) ) ( not ( = ?auto_307000 ?auto_307001 ) ) ( ON ?auto_306999 ?auto_307000 ) ( ON ?auto_306998 ?auto_306999 ) ( ON ?auto_306997 ?auto_306998 ) ( ON ?auto_306996 ?auto_306997 ) ( ON ?auto_306995 ?auto_306996 ) ( ON ?auto_306994 ?auto_306995 ) ( ON ?auto_306993 ?auto_306994 ) ( ON ?auto_306992 ?auto_306993 ) ( CLEAR ?auto_306990 ) ( ON ?auto_306991 ?auto_306992 ) ( CLEAR ?auto_306991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_306990 ?auto_306991 )
      ( MAKE-11PILE ?auto_306990 ?auto_306991 ?auto_306992 ?auto_306993 ?auto_306994 ?auto_306995 ?auto_306996 ?auto_306997 ?auto_306998 ?auto_306999 ?auto_307000 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_307013 - BLOCK
      ?auto_307014 - BLOCK
      ?auto_307015 - BLOCK
      ?auto_307016 - BLOCK
      ?auto_307017 - BLOCK
      ?auto_307018 - BLOCK
      ?auto_307019 - BLOCK
      ?auto_307020 - BLOCK
      ?auto_307021 - BLOCK
      ?auto_307022 - BLOCK
      ?auto_307023 - BLOCK
    )
    :vars
    (
      ?auto_307024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307023 ?auto_307024 ) ( ON-TABLE ?auto_307013 ) ( not ( = ?auto_307013 ?auto_307014 ) ) ( not ( = ?auto_307013 ?auto_307015 ) ) ( not ( = ?auto_307013 ?auto_307016 ) ) ( not ( = ?auto_307013 ?auto_307017 ) ) ( not ( = ?auto_307013 ?auto_307018 ) ) ( not ( = ?auto_307013 ?auto_307019 ) ) ( not ( = ?auto_307013 ?auto_307020 ) ) ( not ( = ?auto_307013 ?auto_307021 ) ) ( not ( = ?auto_307013 ?auto_307022 ) ) ( not ( = ?auto_307013 ?auto_307023 ) ) ( not ( = ?auto_307013 ?auto_307024 ) ) ( not ( = ?auto_307014 ?auto_307015 ) ) ( not ( = ?auto_307014 ?auto_307016 ) ) ( not ( = ?auto_307014 ?auto_307017 ) ) ( not ( = ?auto_307014 ?auto_307018 ) ) ( not ( = ?auto_307014 ?auto_307019 ) ) ( not ( = ?auto_307014 ?auto_307020 ) ) ( not ( = ?auto_307014 ?auto_307021 ) ) ( not ( = ?auto_307014 ?auto_307022 ) ) ( not ( = ?auto_307014 ?auto_307023 ) ) ( not ( = ?auto_307014 ?auto_307024 ) ) ( not ( = ?auto_307015 ?auto_307016 ) ) ( not ( = ?auto_307015 ?auto_307017 ) ) ( not ( = ?auto_307015 ?auto_307018 ) ) ( not ( = ?auto_307015 ?auto_307019 ) ) ( not ( = ?auto_307015 ?auto_307020 ) ) ( not ( = ?auto_307015 ?auto_307021 ) ) ( not ( = ?auto_307015 ?auto_307022 ) ) ( not ( = ?auto_307015 ?auto_307023 ) ) ( not ( = ?auto_307015 ?auto_307024 ) ) ( not ( = ?auto_307016 ?auto_307017 ) ) ( not ( = ?auto_307016 ?auto_307018 ) ) ( not ( = ?auto_307016 ?auto_307019 ) ) ( not ( = ?auto_307016 ?auto_307020 ) ) ( not ( = ?auto_307016 ?auto_307021 ) ) ( not ( = ?auto_307016 ?auto_307022 ) ) ( not ( = ?auto_307016 ?auto_307023 ) ) ( not ( = ?auto_307016 ?auto_307024 ) ) ( not ( = ?auto_307017 ?auto_307018 ) ) ( not ( = ?auto_307017 ?auto_307019 ) ) ( not ( = ?auto_307017 ?auto_307020 ) ) ( not ( = ?auto_307017 ?auto_307021 ) ) ( not ( = ?auto_307017 ?auto_307022 ) ) ( not ( = ?auto_307017 ?auto_307023 ) ) ( not ( = ?auto_307017 ?auto_307024 ) ) ( not ( = ?auto_307018 ?auto_307019 ) ) ( not ( = ?auto_307018 ?auto_307020 ) ) ( not ( = ?auto_307018 ?auto_307021 ) ) ( not ( = ?auto_307018 ?auto_307022 ) ) ( not ( = ?auto_307018 ?auto_307023 ) ) ( not ( = ?auto_307018 ?auto_307024 ) ) ( not ( = ?auto_307019 ?auto_307020 ) ) ( not ( = ?auto_307019 ?auto_307021 ) ) ( not ( = ?auto_307019 ?auto_307022 ) ) ( not ( = ?auto_307019 ?auto_307023 ) ) ( not ( = ?auto_307019 ?auto_307024 ) ) ( not ( = ?auto_307020 ?auto_307021 ) ) ( not ( = ?auto_307020 ?auto_307022 ) ) ( not ( = ?auto_307020 ?auto_307023 ) ) ( not ( = ?auto_307020 ?auto_307024 ) ) ( not ( = ?auto_307021 ?auto_307022 ) ) ( not ( = ?auto_307021 ?auto_307023 ) ) ( not ( = ?auto_307021 ?auto_307024 ) ) ( not ( = ?auto_307022 ?auto_307023 ) ) ( not ( = ?auto_307022 ?auto_307024 ) ) ( not ( = ?auto_307023 ?auto_307024 ) ) ( ON ?auto_307022 ?auto_307023 ) ( ON ?auto_307021 ?auto_307022 ) ( ON ?auto_307020 ?auto_307021 ) ( ON ?auto_307019 ?auto_307020 ) ( ON ?auto_307018 ?auto_307019 ) ( ON ?auto_307017 ?auto_307018 ) ( ON ?auto_307016 ?auto_307017 ) ( ON ?auto_307015 ?auto_307016 ) ( CLEAR ?auto_307013 ) ( ON ?auto_307014 ?auto_307015 ) ( CLEAR ?auto_307014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_307013 ?auto_307014 )
      ( MAKE-11PILE ?auto_307013 ?auto_307014 ?auto_307015 ?auto_307016 ?auto_307017 ?auto_307018 ?auto_307019 ?auto_307020 ?auto_307021 ?auto_307022 ?auto_307023 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_307036 - BLOCK
      ?auto_307037 - BLOCK
      ?auto_307038 - BLOCK
      ?auto_307039 - BLOCK
      ?auto_307040 - BLOCK
      ?auto_307041 - BLOCK
      ?auto_307042 - BLOCK
      ?auto_307043 - BLOCK
      ?auto_307044 - BLOCK
      ?auto_307045 - BLOCK
      ?auto_307046 - BLOCK
    )
    :vars
    (
      ?auto_307047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307046 ?auto_307047 ) ( not ( = ?auto_307036 ?auto_307037 ) ) ( not ( = ?auto_307036 ?auto_307038 ) ) ( not ( = ?auto_307036 ?auto_307039 ) ) ( not ( = ?auto_307036 ?auto_307040 ) ) ( not ( = ?auto_307036 ?auto_307041 ) ) ( not ( = ?auto_307036 ?auto_307042 ) ) ( not ( = ?auto_307036 ?auto_307043 ) ) ( not ( = ?auto_307036 ?auto_307044 ) ) ( not ( = ?auto_307036 ?auto_307045 ) ) ( not ( = ?auto_307036 ?auto_307046 ) ) ( not ( = ?auto_307036 ?auto_307047 ) ) ( not ( = ?auto_307037 ?auto_307038 ) ) ( not ( = ?auto_307037 ?auto_307039 ) ) ( not ( = ?auto_307037 ?auto_307040 ) ) ( not ( = ?auto_307037 ?auto_307041 ) ) ( not ( = ?auto_307037 ?auto_307042 ) ) ( not ( = ?auto_307037 ?auto_307043 ) ) ( not ( = ?auto_307037 ?auto_307044 ) ) ( not ( = ?auto_307037 ?auto_307045 ) ) ( not ( = ?auto_307037 ?auto_307046 ) ) ( not ( = ?auto_307037 ?auto_307047 ) ) ( not ( = ?auto_307038 ?auto_307039 ) ) ( not ( = ?auto_307038 ?auto_307040 ) ) ( not ( = ?auto_307038 ?auto_307041 ) ) ( not ( = ?auto_307038 ?auto_307042 ) ) ( not ( = ?auto_307038 ?auto_307043 ) ) ( not ( = ?auto_307038 ?auto_307044 ) ) ( not ( = ?auto_307038 ?auto_307045 ) ) ( not ( = ?auto_307038 ?auto_307046 ) ) ( not ( = ?auto_307038 ?auto_307047 ) ) ( not ( = ?auto_307039 ?auto_307040 ) ) ( not ( = ?auto_307039 ?auto_307041 ) ) ( not ( = ?auto_307039 ?auto_307042 ) ) ( not ( = ?auto_307039 ?auto_307043 ) ) ( not ( = ?auto_307039 ?auto_307044 ) ) ( not ( = ?auto_307039 ?auto_307045 ) ) ( not ( = ?auto_307039 ?auto_307046 ) ) ( not ( = ?auto_307039 ?auto_307047 ) ) ( not ( = ?auto_307040 ?auto_307041 ) ) ( not ( = ?auto_307040 ?auto_307042 ) ) ( not ( = ?auto_307040 ?auto_307043 ) ) ( not ( = ?auto_307040 ?auto_307044 ) ) ( not ( = ?auto_307040 ?auto_307045 ) ) ( not ( = ?auto_307040 ?auto_307046 ) ) ( not ( = ?auto_307040 ?auto_307047 ) ) ( not ( = ?auto_307041 ?auto_307042 ) ) ( not ( = ?auto_307041 ?auto_307043 ) ) ( not ( = ?auto_307041 ?auto_307044 ) ) ( not ( = ?auto_307041 ?auto_307045 ) ) ( not ( = ?auto_307041 ?auto_307046 ) ) ( not ( = ?auto_307041 ?auto_307047 ) ) ( not ( = ?auto_307042 ?auto_307043 ) ) ( not ( = ?auto_307042 ?auto_307044 ) ) ( not ( = ?auto_307042 ?auto_307045 ) ) ( not ( = ?auto_307042 ?auto_307046 ) ) ( not ( = ?auto_307042 ?auto_307047 ) ) ( not ( = ?auto_307043 ?auto_307044 ) ) ( not ( = ?auto_307043 ?auto_307045 ) ) ( not ( = ?auto_307043 ?auto_307046 ) ) ( not ( = ?auto_307043 ?auto_307047 ) ) ( not ( = ?auto_307044 ?auto_307045 ) ) ( not ( = ?auto_307044 ?auto_307046 ) ) ( not ( = ?auto_307044 ?auto_307047 ) ) ( not ( = ?auto_307045 ?auto_307046 ) ) ( not ( = ?auto_307045 ?auto_307047 ) ) ( not ( = ?auto_307046 ?auto_307047 ) ) ( ON ?auto_307045 ?auto_307046 ) ( ON ?auto_307044 ?auto_307045 ) ( ON ?auto_307043 ?auto_307044 ) ( ON ?auto_307042 ?auto_307043 ) ( ON ?auto_307041 ?auto_307042 ) ( ON ?auto_307040 ?auto_307041 ) ( ON ?auto_307039 ?auto_307040 ) ( ON ?auto_307038 ?auto_307039 ) ( ON ?auto_307037 ?auto_307038 ) ( ON ?auto_307036 ?auto_307037 ) ( CLEAR ?auto_307036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_307036 )
      ( MAKE-11PILE ?auto_307036 ?auto_307037 ?auto_307038 ?auto_307039 ?auto_307040 ?auto_307041 ?auto_307042 ?auto_307043 ?auto_307044 ?auto_307045 ?auto_307046 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_307059 - BLOCK
      ?auto_307060 - BLOCK
      ?auto_307061 - BLOCK
      ?auto_307062 - BLOCK
      ?auto_307063 - BLOCK
      ?auto_307064 - BLOCK
      ?auto_307065 - BLOCK
      ?auto_307066 - BLOCK
      ?auto_307067 - BLOCK
      ?auto_307068 - BLOCK
      ?auto_307069 - BLOCK
    )
    :vars
    (
      ?auto_307070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307069 ?auto_307070 ) ( not ( = ?auto_307059 ?auto_307060 ) ) ( not ( = ?auto_307059 ?auto_307061 ) ) ( not ( = ?auto_307059 ?auto_307062 ) ) ( not ( = ?auto_307059 ?auto_307063 ) ) ( not ( = ?auto_307059 ?auto_307064 ) ) ( not ( = ?auto_307059 ?auto_307065 ) ) ( not ( = ?auto_307059 ?auto_307066 ) ) ( not ( = ?auto_307059 ?auto_307067 ) ) ( not ( = ?auto_307059 ?auto_307068 ) ) ( not ( = ?auto_307059 ?auto_307069 ) ) ( not ( = ?auto_307059 ?auto_307070 ) ) ( not ( = ?auto_307060 ?auto_307061 ) ) ( not ( = ?auto_307060 ?auto_307062 ) ) ( not ( = ?auto_307060 ?auto_307063 ) ) ( not ( = ?auto_307060 ?auto_307064 ) ) ( not ( = ?auto_307060 ?auto_307065 ) ) ( not ( = ?auto_307060 ?auto_307066 ) ) ( not ( = ?auto_307060 ?auto_307067 ) ) ( not ( = ?auto_307060 ?auto_307068 ) ) ( not ( = ?auto_307060 ?auto_307069 ) ) ( not ( = ?auto_307060 ?auto_307070 ) ) ( not ( = ?auto_307061 ?auto_307062 ) ) ( not ( = ?auto_307061 ?auto_307063 ) ) ( not ( = ?auto_307061 ?auto_307064 ) ) ( not ( = ?auto_307061 ?auto_307065 ) ) ( not ( = ?auto_307061 ?auto_307066 ) ) ( not ( = ?auto_307061 ?auto_307067 ) ) ( not ( = ?auto_307061 ?auto_307068 ) ) ( not ( = ?auto_307061 ?auto_307069 ) ) ( not ( = ?auto_307061 ?auto_307070 ) ) ( not ( = ?auto_307062 ?auto_307063 ) ) ( not ( = ?auto_307062 ?auto_307064 ) ) ( not ( = ?auto_307062 ?auto_307065 ) ) ( not ( = ?auto_307062 ?auto_307066 ) ) ( not ( = ?auto_307062 ?auto_307067 ) ) ( not ( = ?auto_307062 ?auto_307068 ) ) ( not ( = ?auto_307062 ?auto_307069 ) ) ( not ( = ?auto_307062 ?auto_307070 ) ) ( not ( = ?auto_307063 ?auto_307064 ) ) ( not ( = ?auto_307063 ?auto_307065 ) ) ( not ( = ?auto_307063 ?auto_307066 ) ) ( not ( = ?auto_307063 ?auto_307067 ) ) ( not ( = ?auto_307063 ?auto_307068 ) ) ( not ( = ?auto_307063 ?auto_307069 ) ) ( not ( = ?auto_307063 ?auto_307070 ) ) ( not ( = ?auto_307064 ?auto_307065 ) ) ( not ( = ?auto_307064 ?auto_307066 ) ) ( not ( = ?auto_307064 ?auto_307067 ) ) ( not ( = ?auto_307064 ?auto_307068 ) ) ( not ( = ?auto_307064 ?auto_307069 ) ) ( not ( = ?auto_307064 ?auto_307070 ) ) ( not ( = ?auto_307065 ?auto_307066 ) ) ( not ( = ?auto_307065 ?auto_307067 ) ) ( not ( = ?auto_307065 ?auto_307068 ) ) ( not ( = ?auto_307065 ?auto_307069 ) ) ( not ( = ?auto_307065 ?auto_307070 ) ) ( not ( = ?auto_307066 ?auto_307067 ) ) ( not ( = ?auto_307066 ?auto_307068 ) ) ( not ( = ?auto_307066 ?auto_307069 ) ) ( not ( = ?auto_307066 ?auto_307070 ) ) ( not ( = ?auto_307067 ?auto_307068 ) ) ( not ( = ?auto_307067 ?auto_307069 ) ) ( not ( = ?auto_307067 ?auto_307070 ) ) ( not ( = ?auto_307068 ?auto_307069 ) ) ( not ( = ?auto_307068 ?auto_307070 ) ) ( not ( = ?auto_307069 ?auto_307070 ) ) ( ON ?auto_307068 ?auto_307069 ) ( ON ?auto_307067 ?auto_307068 ) ( ON ?auto_307066 ?auto_307067 ) ( ON ?auto_307065 ?auto_307066 ) ( ON ?auto_307064 ?auto_307065 ) ( ON ?auto_307063 ?auto_307064 ) ( ON ?auto_307062 ?auto_307063 ) ( ON ?auto_307061 ?auto_307062 ) ( ON ?auto_307060 ?auto_307061 ) ( ON ?auto_307059 ?auto_307060 ) ( CLEAR ?auto_307059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_307059 )
      ( MAKE-11PILE ?auto_307059 ?auto_307060 ?auto_307061 ?auto_307062 ?auto_307063 ?auto_307064 ?auto_307065 ?auto_307066 ?auto_307067 ?auto_307068 ?auto_307069 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307083 - BLOCK
      ?auto_307084 - BLOCK
      ?auto_307085 - BLOCK
      ?auto_307086 - BLOCK
      ?auto_307087 - BLOCK
      ?auto_307088 - BLOCK
      ?auto_307089 - BLOCK
      ?auto_307090 - BLOCK
      ?auto_307091 - BLOCK
      ?auto_307092 - BLOCK
      ?auto_307093 - BLOCK
      ?auto_307094 - BLOCK
    )
    :vars
    (
      ?auto_307095 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_307093 ) ( ON ?auto_307094 ?auto_307095 ) ( CLEAR ?auto_307094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_307083 ) ( ON ?auto_307084 ?auto_307083 ) ( ON ?auto_307085 ?auto_307084 ) ( ON ?auto_307086 ?auto_307085 ) ( ON ?auto_307087 ?auto_307086 ) ( ON ?auto_307088 ?auto_307087 ) ( ON ?auto_307089 ?auto_307088 ) ( ON ?auto_307090 ?auto_307089 ) ( ON ?auto_307091 ?auto_307090 ) ( ON ?auto_307092 ?auto_307091 ) ( ON ?auto_307093 ?auto_307092 ) ( not ( = ?auto_307083 ?auto_307084 ) ) ( not ( = ?auto_307083 ?auto_307085 ) ) ( not ( = ?auto_307083 ?auto_307086 ) ) ( not ( = ?auto_307083 ?auto_307087 ) ) ( not ( = ?auto_307083 ?auto_307088 ) ) ( not ( = ?auto_307083 ?auto_307089 ) ) ( not ( = ?auto_307083 ?auto_307090 ) ) ( not ( = ?auto_307083 ?auto_307091 ) ) ( not ( = ?auto_307083 ?auto_307092 ) ) ( not ( = ?auto_307083 ?auto_307093 ) ) ( not ( = ?auto_307083 ?auto_307094 ) ) ( not ( = ?auto_307083 ?auto_307095 ) ) ( not ( = ?auto_307084 ?auto_307085 ) ) ( not ( = ?auto_307084 ?auto_307086 ) ) ( not ( = ?auto_307084 ?auto_307087 ) ) ( not ( = ?auto_307084 ?auto_307088 ) ) ( not ( = ?auto_307084 ?auto_307089 ) ) ( not ( = ?auto_307084 ?auto_307090 ) ) ( not ( = ?auto_307084 ?auto_307091 ) ) ( not ( = ?auto_307084 ?auto_307092 ) ) ( not ( = ?auto_307084 ?auto_307093 ) ) ( not ( = ?auto_307084 ?auto_307094 ) ) ( not ( = ?auto_307084 ?auto_307095 ) ) ( not ( = ?auto_307085 ?auto_307086 ) ) ( not ( = ?auto_307085 ?auto_307087 ) ) ( not ( = ?auto_307085 ?auto_307088 ) ) ( not ( = ?auto_307085 ?auto_307089 ) ) ( not ( = ?auto_307085 ?auto_307090 ) ) ( not ( = ?auto_307085 ?auto_307091 ) ) ( not ( = ?auto_307085 ?auto_307092 ) ) ( not ( = ?auto_307085 ?auto_307093 ) ) ( not ( = ?auto_307085 ?auto_307094 ) ) ( not ( = ?auto_307085 ?auto_307095 ) ) ( not ( = ?auto_307086 ?auto_307087 ) ) ( not ( = ?auto_307086 ?auto_307088 ) ) ( not ( = ?auto_307086 ?auto_307089 ) ) ( not ( = ?auto_307086 ?auto_307090 ) ) ( not ( = ?auto_307086 ?auto_307091 ) ) ( not ( = ?auto_307086 ?auto_307092 ) ) ( not ( = ?auto_307086 ?auto_307093 ) ) ( not ( = ?auto_307086 ?auto_307094 ) ) ( not ( = ?auto_307086 ?auto_307095 ) ) ( not ( = ?auto_307087 ?auto_307088 ) ) ( not ( = ?auto_307087 ?auto_307089 ) ) ( not ( = ?auto_307087 ?auto_307090 ) ) ( not ( = ?auto_307087 ?auto_307091 ) ) ( not ( = ?auto_307087 ?auto_307092 ) ) ( not ( = ?auto_307087 ?auto_307093 ) ) ( not ( = ?auto_307087 ?auto_307094 ) ) ( not ( = ?auto_307087 ?auto_307095 ) ) ( not ( = ?auto_307088 ?auto_307089 ) ) ( not ( = ?auto_307088 ?auto_307090 ) ) ( not ( = ?auto_307088 ?auto_307091 ) ) ( not ( = ?auto_307088 ?auto_307092 ) ) ( not ( = ?auto_307088 ?auto_307093 ) ) ( not ( = ?auto_307088 ?auto_307094 ) ) ( not ( = ?auto_307088 ?auto_307095 ) ) ( not ( = ?auto_307089 ?auto_307090 ) ) ( not ( = ?auto_307089 ?auto_307091 ) ) ( not ( = ?auto_307089 ?auto_307092 ) ) ( not ( = ?auto_307089 ?auto_307093 ) ) ( not ( = ?auto_307089 ?auto_307094 ) ) ( not ( = ?auto_307089 ?auto_307095 ) ) ( not ( = ?auto_307090 ?auto_307091 ) ) ( not ( = ?auto_307090 ?auto_307092 ) ) ( not ( = ?auto_307090 ?auto_307093 ) ) ( not ( = ?auto_307090 ?auto_307094 ) ) ( not ( = ?auto_307090 ?auto_307095 ) ) ( not ( = ?auto_307091 ?auto_307092 ) ) ( not ( = ?auto_307091 ?auto_307093 ) ) ( not ( = ?auto_307091 ?auto_307094 ) ) ( not ( = ?auto_307091 ?auto_307095 ) ) ( not ( = ?auto_307092 ?auto_307093 ) ) ( not ( = ?auto_307092 ?auto_307094 ) ) ( not ( = ?auto_307092 ?auto_307095 ) ) ( not ( = ?auto_307093 ?auto_307094 ) ) ( not ( = ?auto_307093 ?auto_307095 ) ) ( not ( = ?auto_307094 ?auto_307095 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_307094 ?auto_307095 )
      ( !STACK ?auto_307094 ?auto_307093 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307108 - BLOCK
      ?auto_307109 - BLOCK
      ?auto_307110 - BLOCK
      ?auto_307111 - BLOCK
      ?auto_307112 - BLOCK
      ?auto_307113 - BLOCK
      ?auto_307114 - BLOCK
      ?auto_307115 - BLOCK
      ?auto_307116 - BLOCK
      ?auto_307117 - BLOCK
      ?auto_307118 - BLOCK
      ?auto_307119 - BLOCK
    )
    :vars
    (
      ?auto_307120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_307118 ) ( ON ?auto_307119 ?auto_307120 ) ( CLEAR ?auto_307119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_307108 ) ( ON ?auto_307109 ?auto_307108 ) ( ON ?auto_307110 ?auto_307109 ) ( ON ?auto_307111 ?auto_307110 ) ( ON ?auto_307112 ?auto_307111 ) ( ON ?auto_307113 ?auto_307112 ) ( ON ?auto_307114 ?auto_307113 ) ( ON ?auto_307115 ?auto_307114 ) ( ON ?auto_307116 ?auto_307115 ) ( ON ?auto_307117 ?auto_307116 ) ( ON ?auto_307118 ?auto_307117 ) ( not ( = ?auto_307108 ?auto_307109 ) ) ( not ( = ?auto_307108 ?auto_307110 ) ) ( not ( = ?auto_307108 ?auto_307111 ) ) ( not ( = ?auto_307108 ?auto_307112 ) ) ( not ( = ?auto_307108 ?auto_307113 ) ) ( not ( = ?auto_307108 ?auto_307114 ) ) ( not ( = ?auto_307108 ?auto_307115 ) ) ( not ( = ?auto_307108 ?auto_307116 ) ) ( not ( = ?auto_307108 ?auto_307117 ) ) ( not ( = ?auto_307108 ?auto_307118 ) ) ( not ( = ?auto_307108 ?auto_307119 ) ) ( not ( = ?auto_307108 ?auto_307120 ) ) ( not ( = ?auto_307109 ?auto_307110 ) ) ( not ( = ?auto_307109 ?auto_307111 ) ) ( not ( = ?auto_307109 ?auto_307112 ) ) ( not ( = ?auto_307109 ?auto_307113 ) ) ( not ( = ?auto_307109 ?auto_307114 ) ) ( not ( = ?auto_307109 ?auto_307115 ) ) ( not ( = ?auto_307109 ?auto_307116 ) ) ( not ( = ?auto_307109 ?auto_307117 ) ) ( not ( = ?auto_307109 ?auto_307118 ) ) ( not ( = ?auto_307109 ?auto_307119 ) ) ( not ( = ?auto_307109 ?auto_307120 ) ) ( not ( = ?auto_307110 ?auto_307111 ) ) ( not ( = ?auto_307110 ?auto_307112 ) ) ( not ( = ?auto_307110 ?auto_307113 ) ) ( not ( = ?auto_307110 ?auto_307114 ) ) ( not ( = ?auto_307110 ?auto_307115 ) ) ( not ( = ?auto_307110 ?auto_307116 ) ) ( not ( = ?auto_307110 ?auto_307117 ) ) ( not ( = ?auto_307110 ?auto_307118 ) ) ( not ( = ?auto_307110 ?auto_307119 ) ) ( not ( = ?auto_307110 ?auto_307120 ) ) ( not ( = ?auto_307111 ?auto_307112 ) ) ( not ( = ?auto_307111 ?auto_307113 ) ) ( not ( = ?auto_307111 ?auto_307114 ) ) ( not ( = ?auto_307111 ?auto_307115 ) ) ( not ( = ?auto_307111 ?auto_307116 ) ) ( not ( = ?auto_307111 ?auto_307117 ) ) ( not ( = ?auto_307111 ?auto_307118 ) ) ( not ( = ?auto_307111 ?auto_307119 ) ) ( not ( = ?auto_307111 ?auto_307120 ) ) ( not ( = ?auto_307112 ?auto_307113 ) ) ( not ( = ?auto_307112 ?auto_307114 ) ) ( not ( = ?auto_307112 ?auto_307115 ) ) ( not ( = ?auto_307112 ?auto_307116 ) ) ( not ( = ?auto_307112 ?auto_307117 ) ) ( not ( = ?auto_307112 ?auto_307118 ) ) ( not ( = ?auto_307112 ?auto_307119 ) ) ( not ( = ?auto_307112 ?auto_307120 ) ) ( not ( = ?auto_307113 ?auto_307114 ) ) ( not ( = ?auto_307113 ?auto_307115 ) ) ( not ( = ?auto_307113 ?auto_307116 ) ) ( not ( = ?auto_307113 ?auto_307117 ) ) ( not ( = ?auto_307113 ?auto_307118 ) ) ( not ( = ?auto_307113 ?auto_307119 ) ) ( not ( = ?auto_307113 ?auto_307120 ) ) ( not ( = ?auto_307114 ?auto_307115 ) ) ( not ( = ?auto_307114 ?auto_307116 ) ) ( not ( = ?auto_307114 ?auto_307117 ) ) ( not ( = ?auto_307114 ?auto_307118 ) ) ( not ( = ?auto_307114 ?auto_307119 ) ) ( not ( = ?auto_307114 ?auto_307120 ) ) ( not ( = ?auto_307115 ?auto_307116 ) ) ( not ( = ?auto_307115 ?auto_307117 ) ) ( not ( = ?auto_307115 ?auto_307118 ) ) ( not ( = ?auto_307115 ?auto_307119 ) ) ( not ( = ?auto_307115 ?auto_307120 ) ) ( not ( = ?auto_307116 ?auto_307117 ) ) ( not ( = ?auto_307116 ?auto_307118 ) ) ( not ( = ?auto_307116 ?auto_307119 ) ) ( not ( = ?auto_307116 ?auto_307120 ) ) ( not ( = ?auto_307117 ?auto_307118 ) ) ( not ( = ?auto_307117 ?auto_307119 ) ) ( not ( = ?auto_307117 ?auto_307120 ) ) ( not ( = ?auto_307118 ?auto_307119 ) ) ( not ( = ?auto_307118 ?auto_307120 ) ) ( not ( = ?auto_307119 ?auto_307120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_307119 ?auto_307120 )
      ( !STACK ?auto_307119 ?auto_307118 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307133 - BLOCK
      ?auto_307134 - BLOCK
      ?auto_307135 - BLOCK
      ?auto_307136 - BLOCK
      ?auto_307137 - BLOCK
      ?auto_307138 - BLOCK
      ?auto_307139 - BLOCK
      ?auto_307140 - BLOCK
      ?auto_307141 - BLOCK
      ?auto_307142 - BLOCK
      ?auto_307143 - BLOCK
      ?auto_307144 - BLOCK
    )
    :vars
    (
      ?auto_307145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307144 ?auto_307145 ) ( ON-TABLE ?auto_307133 ) ( ON ?auto_307134 ?auto_307133 ) ( ON ?auto_307135 ?auto_307134 ) ( ON ?auto_307136 ?auto_307135 ) ( ON ?auto_307137 ?auto_307136 ) ( ON ?auto_307138 ?auto_307137 ) ( ON ?auto_307139 ?auto_307138 ) ( ON ?auto_307140 ?auto_307139 ) ( ON ?auto_307141 ?auto_307140 ) ( ON ?auto_307142 ?auto_307141 ) ( not ( = ?auto_307133 ?auto_307134 ) ) ( not ( = ?auto_307133 ?auto_307135 ) ) ( not ( = ?auto_307133 ?auto_307136 ) ) ( not ( = ?auto_307133 ?auto_307137 ) ) ( not ( = ?auto_307133 ?auto_307138 ) ) ( not ( = ?auto_307133 ?auto_307139 ) ) ( not ( = ?auto_307133 ?auto_307140 ) ) ( not ( = ?auto_307133 ?auto_307141 ) ) ( not ( = ?auto_307133 ?auto_307142 ) ) ( not ( = ?auto_307133 ?auto_307143 ) ) ( not ( = ?auto_307133 ?auto_307144 ) ) ( not ( = ?auto_307133 ?auto_307145 ) ) ( not ( = ?auto_307134 ?auto_307135 ) ) ( not ( = ?auto_307134 ?auto_307136 ) ) ( not ( = ?auto_307134 ?auto_307137 ) ) ( not ( = ?auto_307134 ?auto_307138 ) ) ( not ( = ?auto_307134 ?auto_307139 ) ) ( not ( = ?auto_307134 ?auto_307140 ) ) ( not ( = ?auto_307134 ?auto_307141 ) ) ( not ( = ?auto_307134 ?auto_307142 ) ) ( not ( = ?auto_307134 ?auto_307143 ) ) ( not ( = ?auto_307134 ?auto_307144 ) ) ( not ( = ?auto_307134 ?auto_307145 ) ) ( not ( = ?auto_307135 ?auto_307136 ) ) ( not ( = ?auto_307135 ?auto_307137 ) ) ( not ( = ?auto_307135 ?auto_307138 ) ) ( not ( = ?auto_307135 ?auto_307139 ) ) ( not ( = ?auto_307135 ?auto_307140 ) ) ( not ( = ?auto_307135 ?auto_307141 ) ) ( not ( = ?auto_307135 ?auto_307142 ) ) ( not ( = ?auto_307135 ?auto_307143 ) ) ( not ( = ?auto_307135 ?auto_307144 ) ) ( not ( = ?auto_307135 ?auto_307145 ) ) ( not ( = ?auto_307136 ?auto_307137 ) ) ( not ( = ?auto_307136 ?auto_307138 ) ) ( not ( = ?auto_307136 ?auto_307139 ) ) ( not ( = ?auto_307136 ?auto_307140 ) ) ( not ( = ?auto_307136 ?auto_307141 ) ) ( not ( = ?auto_307136 ?auto_307142 ) ) ( not ( = ?auto_307136 ?auto_307143 ) ) ( not ( = ?auto_307136 ?auto_307144 ) ) ( not ( = ?auto_307136 ?auto_307145 ) ) ( not ( = ?auto_307137 ?auto_307138 ) ) ( not ( = ?auto_307137 ?auto_307139 ) ) ( not ( = ?auto_307137 ?auto_307140 ) ) ( not ( = ?auto_307137 ?auto_307141 ) ) ( not ( = ?auto_307137 ?auto_307142 ) ) ( not ( = ?auto_307137 ?auto_307143 ) ) ( not ( = ?auto_307137 ?auto_307144 ) ) ( not ( = ?auto_307137 ?auto_307145 ) ) ( not ( = ?auto_307138 ?auto_307139 ) ) ( not ( = ?auto_307138 ?auto_307140 ) ) ( not ( = ?auto_307138 ?auto_307141 ) ) ( not ( = ?auto_307138 ?auto_307142 ) ) ( not ( = ?auto_307138 ?auto_307143 ) ) ( not ( = ?auto_307138 ?auto_307144 ) ) ( not ( = ?auto_307138 ?auto_307145 ) ) ( not ( = ?auto_307139 ?auto_307140 ) ) ( not ( = ?auto_307139 ?auto_307141 ) ) ( not ( = ?auto_307139 ?auto_307142 ) ) ( not ( = ?auto_307139 ?auto_307143 ) ) ( not ( = ?auto_307139 ?auto_307144 ) ) ( not ( = ?auto_307139 ?auto_307145 ) ) ( not ( = ?auto_307140 ?auto_307141 ) ) ( not ( = ?auto_307140 ?auto_307142 ) ) ( not ( = ?auto_307140 ?auto_307143 ) ) ( not ( = ?auto_307140 ?auto_307144 ) ) ( not ( = ?auto_307140 ?auto_307145 ) ) ( not ( = ?auto_307141 ?auto_307142 ) ) ( not ( = ?auto_307141 ?auto_307143 ) ) ( not ( = ?auto_307141 ?auto_307144 ) ) ( not ( = ?auto_307141 ?auto_307145 ) ) ( not ( = ?auto_307142 ?auto_307143 ) ) ( not ( = ?auto_307142 ?auto_307144 ) ) ( not ( = ?auto_307142 ?auto_307145 ) ) ( not ( = ?auto_307143 ?auto_307144 ) ) ( not ( = ?auto_307143 ?auto_307145 ) ) ( not ( = ?auto_307144 ?auto_307145 ) ) ( CLEAR ?auto_307142 ) ( ON ?auto_307143 ?auto_307144 ) ( CLEAR ?auto_307143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_307133 ?auto_307134 ?auto_307135 ?auto_307136 ?auto_307137 ?auto_307138 ?auto_307139 ?auto_307140 ?auto_307141 ?auto_307142 ?auto_307143 )
      ( MAKE-12PILE ?auto_307133 ?auto_307134 ?auto_307135 ?auto_307136 ?auto_307137 ?auto_307138 ?auto_307139 ?auto_307140 ?auto_307141 ?auto_307142 ?auto_307143 ?auto_307144 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307158 - BLOCK
      ?auto_307159 - BLOCK
      ?auto_307160 - BLOCK
      ?auto_307161 - BLOCK
      ?auto_307162 - BLOCK
      ?auto_307163 - BLOCK
      ?auto_307164 - BLOCK
      ?auto_307165 - BLOCK
      ?auto_307166 - BLOCK
      ?auto_307167 - BLOCK
      ?auto_307168 - BLOCK
      ?auto_307169 - BLOCK
    )
    :vars
    (
      ?auto_307170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307169 ?auto_307170 ) ( ON-TABLE ?auto_307158 ) ( ON ?auto_307159 ?auto_307158 ) ( ON ?auto_307160 ?auto_307159 ) ( ON ?auto_307161 ?auto_307160 ) ( ON ?auto_307162 ?auto_307161 ) ( ON ?auto_307163 ?auto_307162 ) ( ON ?auto_307164 ?auto_307163 ) ( ON ?auto_307165 ?auto_307164 ) ( ON ?auto_307166 ?auto_307165 ) ( ON ?auto_307167 ?auto_307166 ) ( not ( = ?auto_307158 ?auto_307159 ) ) ( not ( = ?auto_307158 ?auto_307160 ) ) ( not ( = ?auto_307158 ?auto_307161 ) ) ( not ( = ?auto_307158 ?auto_307162 ) ) ( not ( = ?auto_307158 ?auto_307163 ) ) ( not ( = ?auto_307158 ?auto_307164 ) ) ( not ( = ?auto_307158 ?auto_307165 ) ) ( not ( = ?auto_307158 ?auto_307166 ) ) ( not ( = ?auto_307158 ?auto_307167 ) ) ( not ( = ?auto_307158 ?auto_307168 ) ) ( not ( = ?auto_307158 ?auto_307169 ) ) ( not ( = ?auto_307158 ?auto_307170 ) ) ( not ( = ?auto_307159 ?auto_307160 ) ) ( not ( = ?auto_307159 ?auto_307161 ) ) ( not ( = ?auto_307159 ?auto_307162 ) ) ( not ( = ?auto_307159 ?auto_307163 ) ) ( not ( = ?auto_307159 ?auto_307164 ) ) ( not ( = ?auto_307159 ?auto_307165 ) ) ( not ( = ?auto_307159 ?auto_307166 ) ) ( not ( = ?auto_307159 ?auto_307167 ) ) ( not ( = ?auto_307159 ?auto_307168 ) ) ( not ( = ?auto_307159 ?auto_307169 ) ) ( not ( = ?auto_307159 ?auto_307170 ) ) ( not ( = ?auto_307160 ?auto_307161 ) ) ( not ( = ?auto_307160 ?auto_307162 ) ) ( not ( = ?auto_307160 ?auto_307163 ) ) ( not ( = ?auto_307160 ?auto_307164 ) ) ( not ( = ?auto_307160 ?auto_307165 ) ) ( not ( = ?auto_307160 ?auto_307166 ) ) ( not ( = ?auto_307160 ?auto_307167 ) ) ( not ( = ?auto_307160 ?auto_307168 ) ) ( not ( = ?auto_307160 ?auto_307169 ) ) ( not ( = ?auto_307160 ?auto_307170 ) ) ( not ( = ?auto_307161 ?auto_307162 ) ) ( not ( = ?auto_307161 ?auto_307163 ) ) ( not ( = ?auto_307161 ?auto_307164 ) ) ( not ( = ?auto_307161 ?auto_307165 ) ) ( not ( = ?auto_307161 ?auto_307166 ) ) ( not ( = ?auto_307161 ?auto_307167 ) ) ( not ( = ?auto_307161 ?auto_307168 ) ) ( not ( = ?auto_307161 ?auto_307169 ) ) ( not ( = ?auto_307161 ?auto_307170 ) ) ( not ( = ?auto_307162 ?auto_307163 ) ) ( not ( = ?auto_307162 ?auto_307164 ) ) ( not ( = ?auto_307162 ?auto_307165 ) ) ( not ( = ?auto_307162 ?auto_307166 ) ) ( not ( = ?auto_307162 ?auto_307167 ) ) ( not ( = ?auto_307162 ?auto_307168 ) ) ( not ( = ?auto_307162 ?auto_307169 ) ) ( not ( = ?auto_307162 ?auto_307170 ) ) ( not ( = ?auto_307163 ?auto_307164 ) ) ( not ( = ?auto_307163 ?auto_307165 ) ) ( not ( = ?auto_307163 ?auto_307166 ) ) ( not ( = ?auto_307163 ?auto_307167 ) ) ( not ( = ?auto_307163 ?auto_307168 ) ) ( not ( = ?auto_307163 ?auto_307169 ) ) ( not ( = ?auto_307163 ?auto_307170 ) ) ( not ( = ?auto_307164 ?auto_307165 ) ) ( not ( = ?auto_307164 ?auto_307166 ) ) ( not ( = ?auto_307164 ?auto_307167 ) ) ( not ( = ?auto_307164 ?auto_307168 ) ) ( not ( = ?auto_307164 ?auto_307169 ) ) ( not ( = ?auto_307164 ?auto_307170 ) ) ( not ( = ?auto_307165 ?auto_307166 ) ) ( not ( = ?auto_307165 ?auto_307167 ) ) ( not ( = ?auto_307165 ?auto_307168 ) ) ( not ( = ?auto_307165 ?auto_307169 ) ) ( not ( = ?auto_307165 ?auto_307170 ) ) ( not ( = ?auto_307166 ?auto_307167 ) ) ( not ( = ?auto_307166 ?auto_307168 ) ) ( not ( = ?auto_307166 ?auto_307169 ) ) ( not ( = ?auto_307166 ?auto_307170 ) ) ( not ( = ?auto_307167 ?auto_307168 ) ) ( not ( = ?auto_307167 ?auto_307169 ) ) ( not ( = ?auto_307167 ?auto_307170 ) ) ( not ( = ?auto_307168 ?auto_307169 ) ) ( not ( = ?auto_307168 ?auto_307170 ) ) ( not ( = ?auto_307169 ?auto_307170 ) ) ( CLEAR ?auto_307167 ) ( ON ?auto_307168 ?auto_307169 ) ( CLEAR ?auto_307168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_307158 ?auto_307159 ?auto_307160 ?auto_307161 ?auto_307162 ?auto_307163 ?auto_307164 ?auto_307165 ?auto_307166 ?auto_307167 ?auto_307168 )
      ( MAKE-12PILE ?auto_307158 ?auto_307159 ?auto_307160 ?auto_307161 ?auto_307162 ?auto_307163 ?auto_307164 ?auto_307165 ?auto_307166 ?auto_307167 ?auto_307168 ?auto_307169 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307183 - BLOCK
      ?auto_307184 - BLOCK
      ?auto_307185 - BLOCK
      ?auto_307186 - BLOCK
      ?auto_307187 - BLOCK
      ?auto_307188 - BLOCK
      ?auto_307189 - BLOCK
      ?auto_307190 - BLOCK
      ?auto_307191 - BLOCK
      ?auto_307192 - BLOCK
      ?auto_307193 - BLOCK
      ?auto_307194 - BLOCK
    )
    :vars
    (
      ?auto_307195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307194 ?auto_307195 ) ( ON-TABLE ?auto_307183 ) ( ON ?auto_307184 ?auto_307183 ) ( ON ?auto_307185 ?auto_307184 ) ( ON ?auto_307186 ?auto_307185 ) ( ON ?auto_307187 ?auto_307186 ) ( ON ?auto_307188 ?auto_307187 ) ( ON ?auto_307189 ?auto_307188 ) ( ON ?auto_307190 ?auto_307189 ) ( ON ?auto_307191 ?auto_307190 ) ( not ( = ?auto_307183 ?auto_307184 ) ) ( not ( = ?auto_307183 ?auto_307185 ) ) ( not ( = ?auto_307183 ?auto_307186 ) ) ( not ( = ?auto_307183 ?auto_307187 ) ) ( not ( = ?auto_307183 ?auto_307188 ) ) ( not ( = ?auto_307183 ?auto_307189 ) ) ( not ( = ?auto_307183 ?auto_307190 ) ) ( not ( = ?auto_307183 ?auto_307191 ) ) ( not ( = ?auto_307183 ?auto_307192 ) ) ( not ( = ?auto_307183 ?auto_307193 ) ) ( not ( = ?auto_307183 ?auto_307194 ) ) ( not ( = ?auto_307183 ?auto_307195 ) ) ( not ( = ?auto_307184 ?auto_307185 ) ) ( not ( = ?auto_307184 ?auto_307186 ) ) ( not ( = ?auto_307184 ?auto_307187 ) ) ( not ( = ?auto_307184 ?auto_307188 ) ) ( not ( = ?auto_307184 ?auto_307189 ) ) ( not ( = ?auto_307184 ?auto_307190 ) ) ( not ( = ?auto_307184 ?auto_307191 ) ) ( not ( = ?auto_307184 ?auto_307192 ) ) ( not ( = ?auto_307184 ?auto_307193 ) ) ( not ( = ?auto_307184 ?auto_307194 ) ) ( not ( = ?auto_307184 ?auto_307195 ) ) ( not ( = ?auto_307185 ?auto_307186 ) ) ( not ( = ?auto_307185 ?auto_307187 ) ) ( not ( = ?auto_307185 ?auto_307188 ) ) ( not ( = ?auto_307185 ?auto_307189 ) ) ( not ( = ?auto_307185 ?auto_307190 ) ) ( not ( = ?auto_307185 ?auto_307191 ) ) ( not ( = ?auto_307185 ?auto_307192 ) ) ( not ( = ?auto_307185 ?auto_307193 ) ) ( not ( = ?auto_307185 ?auto_307194 ) ) ( not ( = ?auto_307185 ?auto_307195 ) ) ( not ( = ?auto_307186 ?auto_307187 ) ) ( not ( = ?auto_307186 ?auto_307188 ) ) ( not ( = ?auto_307186 ?auto_307189 ) ) ( not ( = ?auto_307186 ?auto_307190 ) ) ( not ( = ?auto_307186 ?auto_307191 ) ) ( not ( = ?auto_307186 ?auto_307192 ) ) ( not ( = ?auto_307186 ?auto_307193 ) ) ( not ( = ?auto_307186 ?auto_307194 ) ) ( not ( = ?auto_307186 ?auto_307195 ) ) ( not ( = ?auto_307187 ?auto_307188 ) ) ( not ( = ?auto_307187 ?auto_307189 ) ) ( not ( = ?auto_307187 ?auto_307190 ) ) ( not ( = ?auto_307187 ?auto_307191 ) ) ( not ( = ?auto_307187 ?auto_307192 ) ) ( not ( = ?auto_307187 ?auto_307193 ) ) ( not ( = ?auto_307187 ?auto_307194 ) ) ( not ( = ?auto_307187 ?auto_307195 ) ) ( not ( = ?auto_307188 ?auto_307189 ) ) ( not ( = ?auto_307188 ?auto_307190 ) ) ( not ( = ?auto_307188 ?auto_307191 ) ) ( not ( = ?auto_307188 ?auto_307192 ) ) ( not ( = ?auto_307188 ?auto_307193 ) ) ( not ( = ?auto_307188 ?auto_307194 ) ) ( not ( = ?auto_307188 ?auto_307195 ) ) ( not ( = ?auto_307189 ?auto_307190 ) ) ( not ( = ?auto_307189 ?auto_307191 ) ) ( not ( = ?auto_307189 ?auto_307192 ) ) ( not ( = ?auto_307189 ?auto_307193 ) ) ( not ( = ?auto_307189 ?auto_307194 ) ) ( not ( = ?auto_307189 ?auto_307195 ) ) ( not ( = ?auto_307190 ?auto_307191 ) ) ( not ( = ?auto_307190 ?auto_307192 ) ) ( not ( = ?auto_307190 ?auto_307193 ) ) ( not ( = ?auto_307190 ?auto_307194 ) ) ( not ( = ?auto_307190 ?auto_307195 ) ) ( not ( = ?auto_307191 ?auto_307192 ) ) ( not ( = ?auto_307191 ?auto_307193 ) ) ( not ( = ?auto_307191 ?auto_307194 ) ) ( not ( = ?auto_307191 ?auto_307195 ) ) ( not ( = ?auto_307192 ?auto_307193 ) ) ( not ( = ?auto_307192 ?auto_307194 ) ) ( not ( = ?auto_307192 ?auto_307195 ) ) ( not ( = ?auto_307193 ?auto_307194 ) ) ( not ( = ?auto_307193 ?auto_307195 ) ) ( not ( = ?auto_307194 ?auto_307195 ) ) ( ON ?auto_307193 ?auto_307194 ) ( CLEAR ?auto_307191 ) ( ON ?auto_307192 ?auto_307193 ) ( CLEAR ?auto_307192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_307183 ?auto_307184 ?auto_307185 ?auto_307186 ?auto_307187 ?auto_307188 ?auto_307189 ?auto_307190 ?auto_307191 ?auto_307192 )
      ( MAKE-12PILE ?auto_307183 ?auto_307184 ?auto_307185 ?auto_307186 ?auto_307187 ?auto_307188 ?auto_307189 ?auto_307190 ?auto_307191 ?auto_307192 ?auto_307193 ?auto_307194 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307208 - BLOCK
      ?auto_307209 - BLOCK
      ?auto_307210 - BLOCK
      ?auto_307211 - BLOCK
      ?auto_307212 - BLOCK
      ?auto_307213 - BLOCK
      ?auto_307214 - BLOCK
      ?auto_307215 - BLOCK
      ?auto_307216 - BLOCK
      ?auto_307217 - BLOCK
      ?auto_307218 - BLOCK
      ?auto_307219 - BLOCK
    )
    :vars
    (
      ?auto_307220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307219 ?auto_307220 ) ( ON-TABLE ?auto_307208 ) ( ON ?auto_307209 ?auto_307208 ) ( ON ?auto_307210 ?auto_307209 ) ( ON ?auto_307211 ?auto_307210 ) ( ON ?auto_307212 ?auto_307211 ) ( ON ?auto_307213 ?auto_307212 ) ( ON ?auto_307214 ?auto_307213 ) ( ON ?auto_307215 ?auto_307214 ) ( ON ?auto_307216 ?auto_307215 ) ( not ( = ?auto_307208 ?auto_307209 ) ) ( not ( = ?auto_307208 ?auto_307210 ) ) ( not ( = ?auto_307208 ?auto_307211 ) ) ( not ( = ?auto_307208 ?auto_307212 ) ) ( not ( = ?auto_307208 ?auto_307213 ) ) ( not ( = ?auto_307208 ?auto_307214 ) ) ( not ( = ?auto_307208 ?auto_307215 ) ) ( not ( = ?auto_307208 ?auto_307216 ) ) ( not ( = ?auto_307208 ?auto_307217 ) ) ( not ( = ?auto_307208 ?auto_307218 ) ) ( not ( = ?auto_307208 ?auto_307219 ) ) ( not ( = ?auto_307208 ?auto_307220 ) ) ( not ( = ?auto_307209 ?auto_307210 ) ) ( not ( = ?auto_307209 ?auto_307211 ) ) ( not ( = ?auto_307209 ?auto_307212 ) ) ( not ( = ?auto_307209 ?auto_307213 ) ) ( not ( = ?auto_307209 ?auto_307214 ) ) ( not ( = ?auto_307209 ?auto_307215 ) ) ( not ( = ?auto_307209 ?auto_307216 ) ) ( not ( = ?auto_307209 ?auto_307217 ) ) ( not ( = ?auto_307209 ?auto_307218 ) ) ( not ( = ?auto_307209 ?auto_307219 ) ) ( not ( = ?auto_307209 ?auto_307220 ) ) ( not ( = ?auto_307210 ?auto_307211 ) ) ( not ( = ?auto_307210 ?auto_307212 ) ) ( not ( = ?auto_307210 ?auto_307213 ) ) ( not ( = ?auto_307210 ?auto_307214 ) ) ( not ( = ?auto_307210 ?auto_307215 ) ) ( not ( = ?auto_307210 ?auto_307216 ) ) ( not ( = ?auto_307210 ?auto_307217 ) ) ( not ( = ?auto_307210 ?auto_307218 ) ) ( not ( = ?auto_307210 ?auto_307219 ) ) ( not ( = ?auto_307210 ?auto_307220 ) ) ( not ( = ?auto_307211 ?auto_307212 ) ) ( not ( = ?auto_307211 ?auto_307213 ) ) ( not ( = ?auto_307211 ?auto_307214 ) ) ( not ( = ?auto_307211 ?auto_307215 ) ) ( not ( = ?auto_307211 ?auto_307216 ) ) ( not ( = ?auto_307211 ?auto_307217 ) ) ( not ( = ?auto_307211 ?auto_307218 ) ) ( not ( = ?auto_307211 ?auto_307219 ) ) ( not ( = ?auto_307211 ?auto_307220 ) ) ( not ( = ?auto_307212 ?auto_307213 ) ) ( not ( = ?auto_307212 ?auto_307214 ) ) ( not ( = ?auto_307212 ?auto_307215 ) ) ( not ( = ?auto_307212 ?auto_307216 ) ) ( not ( = ?auto_307212 ?auto_307217 ) ) ( not ( = ?auto_307212 ?auto_307218 ) ) ( not ( = ?auto_307212 ?auto_307219 ) ) ( not ( = ?auto_307212 ?auto_307220 ) ) ( not ( = ?auto_307213 ?auto_307214 ) ) ( not ( = ?auto_307213 ?auto_307215 ) ) ( not ( = ?auto_307213 ?auto_307216 ) ) ( not ( = ?auto_307213 ?auto_307217 ) ) ( not ( = ?auto_307213 ?auto_307218 ) ) ( not ( = ?auto_307213 ?auto_307219 ) ) ( not ( = ?auto_307213 ?auto_307220 ) ) ( not ( = ?auto_307214 ?auto_307215 ) ) ( not ( = ?auto_307214 ?auto_307216 ) ) ( not ( = ?auto_307214 ?auto_307217 ) ) ( not ( = ?auto_307214 ?auto_307218 ) ) ( not ( = ?auto_307214 ?auto_307219 ) ) ( not ( = ?auto_307214 ?auto_307220 ) ) ( not ( = ?auto_307215 ?auto_307216 ) ) ( not ( = ?auto_307215 ?auto_307217 ) ) ( not ( = ?auto_307215 ?auto_307218 ) ) ( not ( = ?auto_307215 ?auto_307219 ) ) ( not ( = ?auto_307215 ?auto_307220 ) ) ( not ( = ?auto_307216 ?auto_307217 ) ) ( not ( = ?auto_307216 ?auto_307218 ) ) ( not ( = ?auto_307216 ?auto_307219 ) ) ( not ( = ?auto_307216 ?auto_307220 ) ) ( not ( = ?auto_307217 ?auto_307218 ) ) ( not ( = ?auto_307217 ?auto_307219 ) ) ( not ( = ?auto_307217 ?auto_307220 ) ) ( not ( = ?auto_307218 ?auto_307219 ) ) ( not ( = ?auto_307218 ?auto_307220 ) ) ( not ( = ?auto_307219 ?auto_307220 ) ) ( ON ?auto_307218 ?auto_307219 ) ( CLEAR ?auto_307216 ) ( ON ?auto_307217 ?auto_307218 ) ( CLEAR ?auto_307217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_307208 ?auto_307209 ?auto_307210 ?auto_307211 ?auto_307212 ?auto_307213 ?auto_307214 ?auto_307215 ?auto_307216 ?auto_307217 )
      ( MAKE-12PILE ?auto_307208 ?auto_307209 ?auto_307210 ?auto_307211 ?auto_307212 ?auto_307213 ?auto_307214 ?auto_307215 ?auto_307216 ?auto_307217 ?auto_307218 ?auto_307219 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307233 - BLOCK
      ?auto_307234 - BLOCK
      ?auto_307235 - BLOCK
      ?auto_307236 - BLOCK
      ?auto_307237 - BLOCK
      ?auto_307238 - BLOCK
      ?auto_307239 - BLOCK
      ?auto_307240 - BLOCK
      ?auto_307241 - BLOCK
      ?auto_307242 - BLOCK
      ?auto_307243 - BLOCK
      ?auto_307244 - BLOCK
    )
    :vars
    (
      ?auto_307245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307244 ?auto_307245 ) ( ON-TABLE ?auto_307233 ) ( ON ?auto_307234 ?auto_307233 ) ( ON ?auto_307235 ?auto_307234 ) ( ON ?auto_307236 ?auto_307235 ) ( ON ?auto_307237 ?auto_307236 ) ( ON ?auto_307238 ?auto_307237 ) ( ON ?auto_307239 ?auto_307238 ) ( ON ?auto_307240 ?auto_307239 ) ( not ( = ?auto_307233 ?auto_307234 ) ) ( not ( = ?auto_307233 ?auto_307235 ) ) ( not ( = ?auto_307233 ?auto_307236 ) ) ( not ( = ?auto_307233 ?auto_307237 ) ) ( not ( = ?auto_307233 ?auto_307238 ) ) ( not ( = ?auto_307233 ?auto_307239 ) ) ( not ( = ?auto_307233 ?auto_307240 ) ) ( not ( = ?auto_307233 ?auto_307241 ) ) ( not ( = ?auto_307233 ?auto_307242 ) ) ( not ( = ?auto_307233 ?auto_307243 ) ) ( not ( = ?auto_307233 ?auto_307244 ) ) ( not ( = ?auto_307233 ?auto_307245 ) ) ( not ( = ?auto_307234 ?auto_307235 ) ) ( not ( = ?auto_307234 ?auto_307236 ) ) ( not ( = ?auto_307234 ?auto_307237 ) ) ( not ( = ?auto_307234 ?auto_307238 ) ) ( not ( = ?auto_307234 ?auto_307239 ) ) ( not ( = ?auto_307234 ?auto_307240 ) ) ( not ( = ?auto_307234 ?auto_307241 ) ) ( not ( = ?auto_307234 ?auto_307242 ) ) ( not ( = ?auto_307234 ?auto_307243 ) ) ( not ( = ?auto_307234 ?auto_307244 ) ) ( not ( = ?auto_307234 ?auto_307245 ) ) ( not ( = ?auto_307235 ?auto_307236 ) ) ( not ( = ?auto_307235 ?auto_307237 ) ) ( not ( = ?auto_307235 ?auto_307238 ) ) ( not ( = ?auto_307235 ?auto_307239 ) ) ( not ( = ?auto_307235 ?auto_307240 ) ) ( not ( = ?auto_307235 ?auto_307241 ) ) ( not ( = ?auto_307235 ?auto_307242 ) ) ( not ( = ?auto_307235 ?auto_307243 ) ) ( not ( = ?auto_307235 ?auto_307244 ) ) ( not ( = ?auto_307235 ?auto_307245 ) ) ( not ( = ?auto_307236 ?auto_307237 ) ) ( not ( = ?auto_307236 ?auto_307238 ) ) ( not ( = ?auto_307236 ?auto_307239 ) ) ( not ( = ?auto_307236 ?auto_307240 ) ) ( not ( = ?auto_307236 ?auto_307241 ) ) ( not ( = ?auto_307236 ?auto_307242 ) ) ( not ( = ?auto_307236 ?auto_307243 ) ) ( not ( = ?auto_307236 ?auto_307244 ) ) ( not ( = ?auto_307236 ?auto_307245 ) ) ( not ( = ?auto_307237 ?auto_307238 ) ) ( not ( = ?auto_307237 ?auto_307239 ) ) ( not ( = ?auto_307237 ?auto_307240 ) ) ( not ( = ?auto_307237 ?auto_307241 ) ) ( not ( = ?auto_307237 ?auto_307242 ) ) ( not ( = ?auto_307237 ?auto_307243 ) ) ( not ( = ?auto_307237 ?auto_307244 ) ) ( not ( = ?auto_307237 ?auto_307245 ) ) ( not ( = ?auto_307238 ?auto_307239 ) ) ( not ( = ?auto_307238 ?auto_307240 ) ) ( not ( = ?auto_307238 ?auto_307241 ) ) ( not ( = ?auto_307238 ?auto_307242 ) ) ( not ( = ?auto_307238 ?auto_307243 ) ) ( not ( = ?auto_307238 ?auto_307244 ) ) ( not ( = ?auto_307238 ?auto_307245 ) ) ( not ( = ?auto_307239 ?auto_307240 ) ) ( not ( = ?auto_307239 ?auto_307241 ) ) ( not ( = ?auto_307239 ?auto_307242 ) ) ( not ( = ?auto_307239 ?auto_307243 ) ) ( not ( = ?auto_307239 ?auto_307244 ) ) ( not ( = ?auto_307239 ?auto_307245 ) ) ( not ( = ?auto_307240 ?auto_307241 ) ) ( not ( = ?auto_307240 ?auto_307242 ) ) ( not ( = ?auto_307240 ?auto_307243 ) ) ( not ( = ?auto_307240 ?auto_307244 ) ) ( not ( = ?auto_307240 ?auto_307245 ) ) ( not ( = ?auto_307241 ?auto_307242 ) ) ( not ( = ?auto_307241 ?auto_307243 ) ) ( not ( = ?auto_307241 ?auto_307244 ) ) ( not ( = ?auto_307241 ?auto_307245 ) ) ( not ( = ?auto_307242 ?auto_307243 ) ) ( not ( = ?auto_307242 ?auto_307244 ) ) ( not ( = ?auto_307242 ?auto_307245 ) ) ( not ( = ?auto_307243 ?auto_307244 ) ) ( not ( = ?auto_307243 ?auto_307245 ) ) ( not ( = ?auto_307244 ?auto_307245 ) ) ( ON ?auto_307243 ?auto_307244 ) ( ON ?auto_307242 ?auto_307243 ) ( CLEAR ?auto_307240 ) ( ON ?auto_307241 ?auto_307242 ) ( CLEAR ?auto_307241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_307233 ?auto_307234 ?auto_307235 ?auto_307236 ?auto_307237 ?auto_307238 ?auto_307239 ?auto_307240 ?auto_307241 )
      ( MAKE-12PILE ?auto_307233 ?auto_307234 ?auto_307235 ?auto_307236 ?auto_307237 ?auto_307238 ?auto_307239 ?auto_307240 ?auto_307241 ?auto_307242 ?auto_307243 ?auto_307244 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307258 - BLOCK
      ?auto_307259 - BLOCK
      ?auto_307260 - BLOCK
      ?auto_307261 - BLOCK
      ?auto_307262 - BLOCK
      ?auto_307263 - BLOCK
      ?auto_307264 - BLOCK
      ?auto_307265 - BLOCK
      ?auto_307266 - BLOCK
      ?auto_307267 - BLOCK
      ?auto_307268 - BLOCK
      ?auto_307269 - BLOCK
    )
    :vars
    (
      ?auto_307270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307269 ?auto_307270 ) ( ON-TABLE ?auto_307258 ) ( ON ?auto_307259 ?auto_307258 ) ( ON ?auto_307260 ?auto_307259 ) ( ON ?auto_307261 ?auto_307260 ) ( ON ?auto_307262 ?auto_307261 ) ( ON ?auto_307263 ?auto_307262 ) ( ON ?auto_307264 ?auto_307263 ) ( ON ?auto_307265 ?auto_307264 ) ( not ( = ?auto_307258 ?auto_307259 ) ) ( not ( = ?auto_307258 ?auto_307260 ) ) ( not ( = ?auto_307258 ?auto_307261 ) ) ( not ( = ?auto_307258 ?auto_307262 ) ) ( not ( = ?auto_307258 ?auto_307263 ) ) ( not ( = ?auto_307258 ?auto_307264 ) ) ( not ( = ?auto_307258 ?auto_307265 ) ) ( not ( = ?auto_307258 ?auto_307266 ) ) ( not ( = ?auto_307258 ?auto_307267 ) ) ( not ( = ?auto_307258 ?auto_307268 ) ) ( not ( = ?auto_307258 ?auto_307269 ) ) ( not ( = ?auto_307258 ?auto_307270 ) ) ( not ( = ?auto_307259 ?auto_307260 ) ) ( not ( = ?auto_307259 ?auto_307261 ) ) ( not ( = ?auto_307259 ?auto_307262 ) ) ( not ( = ?auto_307259 ?auto_307263 ) ) ( not ( = ?auto_307259 ?auto_307264 ) ) ( not ( = ?auto_307259 ?auto_307265 ) ) ( not ( = ?auto_307259 ?auto_307266 ) ) ( not ( = ?auto_307259 ?auto_307267 ) ) ( not ( = ?auto_307259 ?auto_307268 ) ) ( not ( = ?auto_307259 ?auto_307269 ) ) ( not ( = ?auto_307259 ?auto_307270 ) ) ( not ( = ?auto_307260 ?auto_307261 ) ) ( not ( = ?auto_307260 ?auto_307262 ) ) ( not ( = ?auto_307260 ?auto_307263 ) ) ( not ( = ?auto_307260 ?auto_307264 ) ) ( not ( = ?auto_307260 ?auto_307265 ) ) ( not ( = ?auto_307260 ?auto_307266 ) ) ( not ( = ?auto_307260 ?auto_307267 ) ) ( not ( = ?auto_307260 ?auto_307268 ) ) ( not ( = ?auto_307260 ?auto_307269 ) ) ( not ( = ?auto_307260 ?auto_307270 ) ) ( not ( = ?auto_307261 ?auto_307262 ) ) ( not ( = ?auto_307261 ?auto_307263 ) ) ( not ( = ?auto_307261 ?auto_307264 ) ) ( not ( = ?auto_307261 ?auto_307265 ) ) ( not ( = ?auto_307261 ?auto_307266 ) ) ( not ( = ?auto_307261 ?auto_307267 ) ) ( not ( = ?auto_307261 ?auto_307268 ) ) ( not ( = ?auto_307261 ?auto_307269 ) ) ( not ( = ?auto_307261 ?auto_307270 ) ) ( not ( = ?auto_307262 ?auto_307263 ) ) ( not ( = ?auto_307262 ?auto_307264 ) ) ( not ( = ?auto_307262 ?auto_307265 ) ) ( not ( = ?auto_307262 ?auto_307266 ) ) ( not ( = ?auto_307262 ?auto_307267 ) ) ( not ( = ?auto_307262 ?auto_307268 ) ) ( not ( = ?auto_307262 ?auto_307269 ) ) ( not ( = ?auto_307262 ?auto_307270 ) ) ( not ( = ?auto_307263 ?auto_307264 ) ) ( not ( = ?auto_307263 ?auto_307265 ) ) ( not ( = ?auto_307263 ?auto_307266 ) ) ( not ( = ?auto_307263 ?auto_307267 ) ) ( not ( = ?auto_307263 ?auto_307268 ) ) ( not ( = ?auto_307263 ?auto_307269 ) ) ( not ( = ?auto_307263 ?auto_307270 ) ) ( not ( = ?auto_307264 ?auto_307265 ) ) ( not ( = ?auto_307264 ?auto_307266 ) ) ( not ( = ?auto_307264 ?auto_307267 ) ) ( not ( = ?auto_307264 ?auto_307268 ) ) ( not ( = ?auto_307264 ?auto_307269 ) ) ( not ( = ?auto_307264 ?auto_307270 ) ) ( not ( = ?auto_307265 ?auto_307266 ) ) ( not ( = ?auto_307265 ?auto_307267 ) ) ( not ( = ?auto_307265 ?auto_307268 ) ) ( not ( = ?auto_307265 ?auto_307269 ) ) ( not ( = ?auto_307265 ?auto_307270 ) ) ( not ( = ?auto_307266 ?auto_307267 ) ) ( not ( = ?auto_307266 ?auto_307268 ) ) ( not ( = ?auto_307266 ?auto_307269 ) ) ( not ( = ?auto_307266 ?auto_307270 ) ) ( not ( = ?auto_307267 ?auto_307268 ) ) ( not ( = ?auto_307267 ?auto_307269 ) ) ( not ( = ?auto_307267 ?auto_307270 ) ) ( not ( = ?auto_307268 ?auto_307269 ) ) ( not ( = ?auto_307268 ?auto_307270 ) ) ( not ( = ?auto_307269 ?auto_307270 ) ) ( ON ?auto_307268 ?auto_307269 ) ( ON ?auto_307267 ?auto_307268 ) ( CLEAR ?auto_307265 ) ( ON ?auto_307266 ?auto_307267 ) ( CLEAR ?auto_307266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_307258 ?auto_307259 ?auto_307260 ?auto_307261 ?auto_307262 ?auto_307263 ?auto_307264 ?auto_307265 ?auto_307266 )
      ( MAKE-12PILE ?auto_307258 ?auto_307259 ?auto_307260 ?auto_307261 ?auto_307262 ?auto_307263 ?auto_307264 ?auto_307265 ?auto_307266 ?auto_307267 ?auto_307268 ?auto_307269 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307283 - BLOCK
      ?auto_307284 - BLOCK
      ?auto_307285 - BLOCK
      ?auto_307286 - BLOCK
      ?auto_307287 - BLOCK
      ?auto_307288 - BLOCK
      ?auto_307289 - BLOCK
      ?auto_307290 - BLOCK
      ?auto_307291 - BLOCK
      ?auto_307292 - BLOCK
      ?auto_307293 - BLOCK
      ?auto_307294 - BLOCK
    )
    :vars
    (
      ?auto_307295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307294 ?auto_307295 ) ( ON-TABLE ?auto_307283 ) ( ON ?auto_307284 ?auto_307283 ) ( ON ?auto_307285 ?auto_307284 ) ( ON ?auto_307286 ?auto_307285 ) ( ON ?auto_307287 ?auto_307286 ) ( ON ?auto_307288 ?auto_307287 ) ( ON ?auto_307289 ?auto_307288 ) ( not ( = ?auto_307283 ?auto_307284 ) ) ( not ( = ?auto_307283 ?auto_307285 ) ) ( not ( = ?auto_307283 ?auto_307286 ) ) ( not ( = ?auto_307283 ?auto_307287 ) ) ( not ( = ?auto_307283 ?auto_307288 ) ) ( not ( = ?auto_307283 ?auto_307289 ) ) ( not ( = ?auto_307283 ?auto_307290 ) ) ( not ( = ?auto_307283 ?auto_307291 ) ) ( not ( = ?auto_307283 ?auto_307292 ) ) ( not ( = ?auto_307283 ?auto_307293 ) ) ( not ( = ?auto_307283 ?auto_307294 ) ) ( not ( = ?auto_307283 ?auto_307295 ) ) ( not ( = ?auto_307284 ?auto_307285 ) ) ( not ( = ?auto_307284 ?auto_307286 ) ) ( not ( = ?auto_307284 ?auto_307287 ) ) ( not ( = ?auto_307284 ?auto_307288 ) ) ( not ( = ?auto_307284 ?auto_307289 ) ) ( not ( = ?auto_307284 ?auto_307290 ) ) ( not ( = ?auto_307284 ?auto_307291 ) ) ( not ( = ?auto_307284 ?auto_307292 ) ) ( not ( = ?auto_307284 ?auto_307293 ) ) ( not ( = ?auto_307284 ?auto_307294 ) ) ( not ( = ?auto_307284 ?auto_307295 ) ) ( not ( = ?auto_307285 ?auto_307286 ) ) ( not ( = ?auto_307285 ?auto_307287 ) ) ( not ( = ?auto_307285 ?auto_307288 ) ) ( not ( = ?auto_307285 ?auto_307289 ) ) ( not ( = ?auto_307285 ?auto_307290 ) ) ( not ( = ?auto_307285 ?auto_307291 ) ) ( not ( = ?auto_307285 ?auto_307292 ) ) ( not ( = ?auto_307285 ?auto_307293 ) ) ( not ( = ?auto_307285 ?auto_307294 ) ) ( not ( = ?auto_307285 ?auto_307295 ) ) ( not ( = ?auto_307286 ?auto_307287 ) ) ( not ( = ?auto_307286 ?auto_307288 ) ) ( not ( = ?auto_307286 ?auto_307289 ) ) ( not ( = ?auto_307286 ?auto_307290 ) ) ( not ( = ?auto_307286 ?auto_307291 ) ) ( not ( = ?auto_307286 ?auto_307292 ) ) ( not ( = ?auto_307286 ?auto_307293 ) ) ( not ( = ?auto_307286 ?auto_307294 ) ) ( not ( = ?auto_307286 ?auto_307295 ) ) ( not ( = ?auto_307287 ?auto_307288 ) ) ( not ( = ?auto_307287 ?auto_307289 ) ) ( not ( = ?auto_307287 ?auto_307290 ) ) ( not ( = ?auto_307287 ?auto_307291 ) ) ( not ( = ?auto_307287 ?auto_307292 ) ) ( not ( = ?auto_307287 ?auto_307293 ) ) ( not ( = ?auto_307287 ?auto_307294 ) ) ( not ( = ?auto_307287 ?auto_307295 ) ) ( not ( = ?auto_307288 ?auto_307289 ) ) ( not ( = ?auto_307288 ?auto_307290 ) ) ( not ( = ?auto_307288 ?auto_307291 ) ) ( not ( = ?auto_307288 ?auto_307292 ) ) ( not ( = ?auto_307288 ?auto_307293 ) ) ( not ( = ?auto_307288 ?auto_307294 ) ) ( not ( = ?auto_307288 ?auto_307295 ) ) ( not ( = ?auto_307289 ?auto_307290 ) ) ( not ( = ?auto_307289 ?auto_307291 ) ) ( not ( = ?auto_307289 ?auto_307292 ) ) ( not ( = ?auto_307289 ?auto_307293 ) ) ( not ( = ?auto_307289 ?auto_307294 ) ) ( not ( = ?auto_307289 ?auto_307295 ) ) ( not ( = ?auto_307290 ?auto_307291 ) ) ( not ( = ?auto_307290 ?auto_307292 ) ) ( not ( = ?auto_307290 ?auto_307293 ) ) ( not ( = ?auto_307290 ?auto_307294 ) ) ( not ( = ?auto_307290 ?auto_307295 ) ) ( not ( = ?auto_307291 ?auto_307292 ) ) ( not ( = ?auto_307291 ?auto_307293 ) ) ( not ( = ?auto_307291 ?auto_307294 ) ) ( not ( = ?auto_307291 ?auto_307295 ) ) ( not ( = ?auto_307292 ?auto_307293 ) ) ( not ( = ?auto_307292 ?auto_307294 ) ) ( not ( = ?auto_307292 ?auto_307295 ) ) ( not ( = ?auto_307293 ?auto_307294 ) ) ( not ( = ?auto_307293 ?auto_307295 ) ) ( not ( = ?auto_307294 ?auto_307295 ) ) ( ON ?auto_307293 ?auto_307294 ) ( ON ?auto_307292 ?auto_307293 ) ( ON ?auto_307291 ?auto_307292 ) ( CLEAR ?auto_307289 ) ( ON ?auto_307290 ?auto_307291 ) ( CLEAR ?auto_307290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_307283 ?auto_307284 ?auto_307285 ?auto_307286 ?auto_307287 ?auto_307288 ?auto_307289 ?auto_307290 )
      ( MAKE-12PILE ?auto_307283 ?auto_307284 ?auto_307285 ?auto_307286 ?auto_307287 ?auto_307288 ?auto_307289 ?auto_307290 ?auto_307291 ?auto_307292 ?auto_307293 ?auto_307294 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307308 - BLOCK
      ?auto_307309 - BLOCK
      ?auto_307310 - BLOCK
      ?auto_307311 - BLOCK
      ?auto_307312 - BLOCK
      ?auto_307313 - BLOCK
      ?auto_307314 - BLOCK
      ?auto_307315 - BLOCK
      ?auto_307316 - BLOCK
      ?auto_307317 - BLOCK
      ?auto_307318 - BLOCK
      ?auto_307319 - BLOCK
    )
    :vars
    (
      ?auto_307320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307319 ?auto_307320 ) ( ON-TABLE ?auto_307308 ) ( ON ?auto_307309 ?auto_307308 ) ( ON ?auto_307310 ?auto_307309 ) ( ON ?auto_307311 ?auto_307310 ) ( ON ?auto_307312 ?auto_307311 ) ( ON ?auto_307313 ?auto_307312 ) ( ON ?auto_307314 ?auto_307313 ) ( not ( = ?auto_307308 ?auto_307309 ) ) ( not ( = ?auto_307308 ?auto_307310 ) ) ( not ( = ?auto_307308 ?auto_307311 ) ) ( not ( = ?auto_307308 ?auto_307312 ) ) ( not ( = ?auto_307308 ?auto_307313 ) ) ( not ( = ?auto_307308 ?auto_307314 ) ) ( not ( = ?auto_307308 ?auto_307315 ) ) ( not ( = ?auto_307308 ?auto_307316 ) ) ( not ( = ?auto_307308 ?auto_307317 ) ) ( not ( = ?auto_307308 ?auto_307318 ) ) ( not ( = ?auto_307308 ?auto_307319 ) ) ( not ( = ?auto_307308 ?auto_307320 ) ) ( not ( = ?auto_307309 ?auto_307310 ) ) ( not ( = ?auto_307309 ?auto_307311 ) ) ( not ( = ?auto_307309 ?auto_307312 ) ) ( not ( = ?auto_307309 ?auto_307313 ) ) ( not ( = ?auto_307309 ?auto_307314 ) ) ( not ( = ?auto_307309 ?auto_307315 ) ) ( not ( = ?auto_307309 ?auto_307316 ) ) ( not ( = ?auto_307309 ?auto_307317 ) ) ( not ( = ?auto_307309 ?auto_307318 ) ) ( not ( = ?auto_307309 ?auto_307319 ) ) ( not ( = ?auto_307309 ?auto_307320 ) ) ( not ( = ?auto_307310 ?auto_307311 ) ) ( not ( = ?auto_307310 ?auto_307312 ) ) ( not ( = ?auto_307310 ?auto_307313 ) ) ( not ( = ?auto_307310 ?auto_307314 ) ) ( not ( = ?auto_307310 ?auto_307315 ) ) ( not ( = ?auto_307310 ?auto_307316 ) ) ( not ( = ?auto_307310 ?auto_307317 ) ) ( not ( = ?auto_307310 ?auto_307318 ) ) ( not ( = ?auto_307310 ?auto_307319 ) ) ( not ( = ?auto_307310 ?auto_307320 ) ) ( not ( = ?auto_307311 ?auto_307312 ) ) ( not ( = ?auto_307311 ?auto_307313 ) ) ( not ( = ?auto_307311 ?auto_307314 ) ) ( not ( = ?auto_307311 ?auto_307315 ) ) ( not ( = ?auto_307311 ?auto_307316 ) ) ( not ( = ?auto_307311 ?auto_307317 ) ) ( not ( = ?auto_307311 ?auto_307318 ) ) ( not ( = ?auto_307311 ?auto_307319 ) ) ( not ( = ?auto_307311 ?auto_307320 ) ) ( not ( = ?auto_307312 ?auto_307313 ) ) ( not ( = ?auto_307312 ?auto_307314 ) ) ( not ( = ?auto_307312 ?auto_307315 ) ) ( not ( = ?auto_307312 ?auto_307316 ) ) ( not ( = ?auto_307312 ?auto_307317 ) ) ( not ( = ?auto_307312 ?auto_307318 ) ) ( not ( = ?auto_307312 ?auto_307319 ) ) ( not ( = ?auto_307312 ?auto_307320 ) ) ( not ( = ?auto_307313 ?auto_307314 ) ) ( not ( = ?auto_307313 ?auto_307315 ) ) ( not ( = ?auto_307313 ?auto_307316 ) ) ( not ( = ?auto_307313 ?auto_307317 ) ) ( not ( = ?auto_307313 ?auto_307318 ) ) ( not ( = ?auto_307313 ?auto_307319 ) ) ( not ( = ?auto_307313 ?auto_307320 ) ) ( not ( = ?auto_307314 ?auto_307315 ) ) ( not ( = ?auto_307314 ?auto_307316 ) ) ( not ( = ?auto_307314 ?auto_307317 ) ) ( not ( = ?auto_307314 ?auto_307318 ) ) ( not ( = ?auto_307314 ?auto_307319 ) ) ( not ( = ?auto_307314 ?auto_307320 ) ) ( not ( = ?auto_307315 ?auto_307316 ) ) ( not ( = ?auto_307315 ?auto_307317 ) ) ( not ( = ?auto_307315 ?auto_307318 ) ) ( not ( = ?auto_307315 ?auto_307319 ) ) ( not ( = ?auto_307315 ?auto_307320 ) ) ( not ( = ?auto_307316 ?auto_307317 ) ) ( not ( = ?auto_307316 ?auto_307318 ) ) ( not ( = ?auto_307316 ?auto_307319 ) ) ( not ( = ?auto_307316 ?auto_307320 ) ) ( not ( = ?auto_307317 ?auto_307318 ) ) ( not ( = ?auto_307317 ?auto_307319 ) ) ( not ( = ?auto_307317 ?auto_307320 ) ) ( not ( = ?auto_307318 ?auto_307319 ) ) ( not ( = ?auto_307318 ?auto_307320 ) ) ( not ( = ?auto_307319 ?auto_307320 ) ) ( ON ?auto_307318 ?auto_307319 ) ( ON ?auto_307317 ?auto_307318 ) ( ON ?auto_307316 ?auto_307317 ) ( CLEAR ?auto_307314 ) ( ON ?auto_307315 ?auto_307316 ) ( CLEAR ?auto_307315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_307308 ?auto_307309 ?auto_307310 ?auto_307311 ?auto_307312 ?auto_307313 ?auto_307314 ?auto_307315 )
      ( MAKE-12PILE ?auto_307308 ?auto_307309 ?auto_307310 ?auto_307311 ?auto_307312 ?auto_307313 ?auto_307314 ?auto_307315 ?auto_307316 ?auto_307317 ?auto_307318 ?auto_307319 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307333 - BLOCK
      ?auto_307334 - BLOCK
      ?auto_307335 - BLOCK
      ?auto_307336 - BLOCK
      ?auto_307337 - BLOCK
      ?auto_307338 - BLOCK
      ?auto_307339 - BLOCK
      ?auto_307340 - BLOCK
      ?auto_307341 - BLOCK
      ?auto_307342 - BLOCK
      ?auto_307343 - BLOCK
      ?auto_307344 - BLOCK
    )
    :vars
    (
      ?auto_307345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307344 ?auto_307345 ) ( ON-TABLE ?auto_307333 ) ( ON ?auto_307334 ?auto_307333 ) ( ON ?auto_307335 ?auto_307334 ) ( ON ?auto_307336 ?auto_307335 ) ( ON ?auto_307337 ?auto_307336 ) ( ON ?auto_307338 ?auto_307337 ) ( not ( = ?auto_307333 ?auto_307334 ) ) ( not ( = ?auto_307333 ?auto_307335 ) ) ( not ( = ?auto_307333 ?auto_307336 ) ) ( not ( = ?auto_307333 ?auto_307337 ) ) ( not ( = ?auto_307333 ?auto_307338 ) ) ( not ( = ?auto_307333 ?auto_307339 ) ) ( not ( = ?auto_307333 ?auto_307340 ) ) ( not ( = ?auto_307333 ?auto_307341 ) ) ( not ( = ?auto_307333 ?auto_307342 ) ) ( not ( = ?auto_307333 ?auto_307343 ) ) ( not ( = ?auto_307333 ?auto_307344 ) ) ( not ( = ?auto_307333 ?auto_307345 ) ) ( not ( = ?auto_307334 ?auto_307335 ) ) ( not ( = ?auto_307334 ?auto_307336 ) ) ( not ( = ?auto_307334 ?auto_307337 ) ) ( not ( = ?auto_307334 ?auto_307338 ) ) ( not ( = ?auto_307334 ?auto_307339 ) ) ( not ( = ?auto_307334 ?auto_307340 ) ) ( not ( = ?auto_307334 ?auto_307341 ) ) ( not ( = ?auto_307334 ?auto_307342 ) ) ( not ( = ?auto_307334 ?auto_307343 ) ) ( not ( = ?auto_307334 ?auto_307344 ) ) ( not ( = ?auto_307334 ?auto_307345 ) ) ( not ( = ?auto_307335 ?auto_307336 ) ) ( not ( = ?auto_307335 ?auto_307337 ) ) ( not ( = ?auto_307335 ?auto_307338 ) ) ( not ( = ?auto_307335 ?auto_307339 ) ) ( not ( = ?auto_307335 ?auto_307340 ) ) ( not ( = ?auto_307335 ?auto_307341 ) ) ( not ( = ?auto_307335 ?auto_307342 ) ) ( not ( = ?auto_307335 ?auto_307343 ) ) ( not ( = ?auto_307335 ?auto_307344 ) ) ( not ( = ?auto_307335 ?auto_307345 ) ) ( not ( = ?auto_307336 ?auto_307337 ) ) ( not ( = ?auto_307336 ?auto_307338 ) ) ( not ( = ?auto_307336 ?auto_307339 ) ) ( not ( = ?auto_307336 ?auto_307340 ) ) ( not ( = ?auto_307336 ?auto_307341 ) ) ( not ( = ?auto_307336 ?auto_307342 ) ) ( not ( = ?auto_307336 ?auto_307343 ) ) ( not ( = ?auto_307336 ?auto_307344 ) ) ( not ( = ?auto_307336 ?auto_307345 ) ) ( not ( = ?auto_307337 ?auto_307338 ) ) ( not ( = ?auto_307337 ?auto_307339 ) ) ( not ( = ?auto_307337 ?auto_307340 ) ) ( not ( = ?auto_307337 ?auto_307341 ) ) ( not ( = ?auto_307337 ?auto_307342 ) ) ( not ( = ?auto_307337 ?auto_307343 ) ) ( not ( = ?auto_307337 ?auto_307344 ) ) ( not ( = ?auto_307337 ?auto_307345 ) ) ( not ( = ?auto_307338 ?auto_307339 ) ) ( not ( = ?auto_307338 ?auto_307340 ) ) ( not ( = ?auto_307338 ?auto_307341 ) ) ( not ( = ?auto_307338 ?auto_307342 ) ) ( not ( = ?auto_307338 ?auto_307343 ) ) ( not ( = ?auto_307338 ?auto_307344 ) ) ( not ( = ?auto_307338 ?auto_307345 ) ) ( not ( = ?auto_307339 ?auto_307340 ) ) ( not ( = ?auto_307339 ?auto_307341 ) ) ( not ( = ?auto_307339 ?auto_307342 ) ) ( not ( = ?auto_307339 ?auto_307343 ) ) ( not ( = ?auto_307339 ?auto_307344 ) ) ( not ( = ?auto_307339 ?auto_307345 ) ) ( not ( = ?auto_307340 ?auto_307341 ) ) ( not ( = ?auto_307340 ?auto_307342 ) ) ( not ( = ?auto_307340 ?auto_307343 ) ) ( not ( = ?auto_307340 ?auto_307344 ) ) ( not ( = ?auto_307340 ?auto_307345 ) ) ( not ( = ?auto_307341 ?auto_307342 ) ) ( not ( = ?auto_307341 ?auto_307343 ) ) ( not ( = ?auto_307341 ?auto_307344 ) ) ( not ( = ?auto_307341 ?auto_307345 ) ) ( not ( = ?auto_307342 ?auto_307343 ) ) ( not ( = ?auto_307342 ?auto_307344 ) ) ( not ( = ?auto_307342 ?auto_307345 ) ) ( not ( = ?auto_307343 ?auto_307344 ) ) ( not ( = ?auto_307343 ?auto_307345 ) ) ( not ( = ?auto_307344 ?auto_307345 ) ) ( ON ?auto_307343 ?auto_307344 ) ( ON ?auto_307342 ?auto_307343 ) ( ON ?auto_307341 ?auto_307342 ) ( ON ?auto_307340 ?auto_307341 ) ( CLEAR ?auto_307338 ) ( ON ?auto_307339 ?auto_307340 ) ( CLEAR ?auto_307339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_307333 ?auto_307334 ?auto_307335 ?auto_307336 ?auto_307337 ?auto_307338 ?auto_307339 )
      ( MAKE-12PILE ?auto_307333 ?auto_307334 ?auto_307335 ?auto_307336 ?auto_307337 ?auto_307338 ?auto_307339 ?auto_307340 ?auto_307341 ?auto_307342 ?auto_307343 ?auto_307344 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307358 - BLOCK
      ?auto_307359 - BLOCK
      ?auto_307360 - BLOCK
      ?auto_307361 - BLOCK
      ?auto_307362 - BLOCK
      ?auto_307363 - BLOCK
      ?auto_307364 - BLOCK
      ?auto_307365 - BLOCK
      ?auto_307366 - BLOCK
      ?auto_307367 - BLOCK
      ?auto_307368 - BLOCK
      ?auto_307369 - BLOCK
    )
    :vars
    (
      ?auto_307370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307369 ?auto_307370 ) ( ON-TABLE ?auto_307358 ) ( ON ?auto_307359 ?auto_307358 ) ( ON ?auto_307360 ?auto_307359 ) ( ON ?auto_307361 ?auto_307360 ) ( ON ?auto_307362 ?auto_307361 ) ( ON ?auto_307363 ?auto_307362 ) ( not ( = ?auto_307358 ?auto_307359 ) ) ( not ( = ?auto_307358 ?auto_307360 ) ) ( not ( = ?auto_307358 ?auto_307361 ) ) ( not ( = ?auto_307358 ?auto_307362 ) ) ( not ( = ?auto_307358 ?auto_307363 ) ) ( not ( = ?auto_307358 ?auto_307364 ) ) ( not ( = ?auto_307358 ?auto_307365 ) ) ( not ( = ?auto_307358 ?auto_307366 ) ) ( not ( = ?auto_307358 ?auto_307367 ) ) ( not ( = ?auto_307358 ?auto_307368 ) ) ( not ( = ?auto_307358 ?auto_307369 ) ) ( not ( = ?auto_307358 ?auto_307370 ) ) ( not ( = ?auto_307359 ?auto_307360 ) ) ( not ( = ?auto_307359 ?auto_307361 ) ) ( not ( = ?auto_307359 ?auto_307362 ) ) ( not ( = ?auto_307359 ?auto_307363 ) ) ( not ( = ?auto_307359 ?auto_307364 ) ) ( not ( = ?auto_307359 ?auto_307365 ) ) ( not ( = ?auto_307359 ?auto_307366 ) ) ( not ( = ?auto_307359 ?auto_307367 ) ) ( not ( = ?auto_307359 ?auto_307368 ) ) ( not ( = ?auto_307359 ?auto_307369 ) ) ( not ( = ?auto_307359 ?auto_307370 ) ) ( not ( = ?auto_307360 ?auto_307361 ) ) ( not ( = ?auto_307360 ?auto_307362 ) ) ( not ( = ?auto_307360 ?auto_307363 ) ) ( not ( = ?auto_307360 ?auto_307364 ) ) ( not ( = ?auto_307360 ?auto_307365 ) ) ( not ( = ?auto_307360 ?auto_307366 ) ) ( not ( = ?auto_307360 ?auto_307367 ) ) ( not ( = ?auto_307360 ?auto_307368 ) ) ( not ( = ?auto_307360 ?auto_307369 ) ) ( not ( = ?auto_307360 ?auto_307370 ) ) ( not ( = ?auto_307361 ?auto_307362 ) ) ( not ( = ?auto_307361 ?auto_307363 ) ) ( not ( = ?auto_307361 ?auto_307364 ) ) ( not ( = ?auto_307361 ?auto_307365 ) ) ( not ( = ?auto_307361 ?auto_307366 ) ) ( not ( = ?auto_307361 ?auto_307367 ) ) ( not ( = ?auto_307361 ?auto_307368 ) ) ( not ( = ?auto_307361 ?auto_307369 ) ) ( not ( = ?auto_307361 ?auto_307370 ) ) ( not ( = ?auto_307362 ?auto_307363 ) ) ( not ( = ?auto_307362 ?auto_307364 ) ) ( not ( = ?auto_307362 ?auto_307365 ) ) ( not ( = ?auto_307362 ?auto_307366 ) ) ( not ( = ?auto_307362 ?auto_307367 ) ) ( not ( = ?auto_307362 ?auto_307368 ) ) ( not ( = ?auto_307362 ?auto_307369 ) ) ( not ( = ?auto_307362 ?auto_307370 ) ) ( not ( = ?auto_307363 ?auto_307364 ) ) ( not ( = ?auto_307363 ?auto_307365 ) ) ( not ( = ?auto_307363 ?auto_307366 ) ) ( not ( = ?auto_307363 ?auto_307367 ) ) ( not ( = ?auto_307363 ?auto_307368 ) ) ( not ( = ?auto_307363 ?auto_307369 ) ) ( not ( = ?auto_307363 ?auto_307370 ) ) ( not ( = ?auto_307364 ?auto_307365 ) ) ( not ( = ?auto_307364 ?auto_307366 ) ) ( not ( = ?auto_307364 ?auto_307367 ) ) ( not ( = ?auto_307364 ?auto_307368 ) ) ( not ( = ?auto_307364 ?auto_307369 ) ) ( not ( = ?auto_307364 ?auto_307370 ) ) ( not ( = ?auto_307365 ?auto_307366 ) ) ( not ( = ?auto_307365 ?auto_307367 ) ) ( not ( = ?auto_307365 ?auto_307368 ) ) ( not ( = ?auto_307365 ?auto_307369 ) ) ( not ( = ?auto_307365 ?auto_307370 ) ) ( not ( = ?auto_307366 ?auto_307367 ) ) ( not ( = ?auto_307366 ?auto_307368 ) ) ( not ( = ?auto_307366 ?auto_307369 ) ) ( not ( = ?auto_307366 ?auto_307370 ) ) ( not ( = ?auto_307367 ?auto_307368 ) ) ( not ( = ?auto_307367 ?auto_307369 ) ) ( not ( = ?auto_307367 ?auto_307370 ) ) ( not ( = ?auto_307368 ?auto_307369 ) ) ( not ( = ?auto_307368 ?auto_307370 ) ) ( not ( = ?auto_307369 ?auto_307370 ) ) ( ON ?auto_307368 ?auto_307369 ) ( ON ?auto_307367 ?auto_307368 ) ( ON ?auto_307366 ?auto_307367 ) ( ON ?auto_307365 ?auto_307366 ) ( CLEAR ?auto_307363 ) ( ON ?auto_307364 ?auto_307365 ) ( CLEAR ?auto_307364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_307358 ?auto_307359 ?auto_307360 ?auto_307361 ?auto_307362 ?auto_307363 ?auto_307364 )
      ( MAKE-12PILE ?auto_307358 ?auto_307359 ?auto_307360 ?auto_307361 ?auto_307362 ?auto_307363 ?auto_307364 ?auto_307365 ?auto_307366 ?auto_307367 ?auto_307368 ?auto_307369 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307383 - BLOCK
      ?auto_307384 - BLOCK
      ?auto_307385 - BLOCK
      ?auto_307386 - BLOCK
      ?auto_307387 - BLOCK
      ?auto_307388 - BLOCK
      ?auto_307389 - BLOCK
      ?auto_307390 - BLOCK
      ?auto_307391 - BLOCK
      ?auto_307392 - BLOCK
      ?auto_307393 - BLOCK
      ?auto_307394 - BLOCK
    )
    :vars
    (
      ?auto_307395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307394 ?auto_307395 ) ( ON-TABLE ?auto_307383 ) ( ON ?auto_307384 ?auto_307383 ) ( ON ?auto_307385 ?auto_307384 ) ( ON ?auto_307386 ?auto_307385 ) ( ON ?auto_307387 ?auto_307386 ) ( not ( = ?auto_307383 ?auto_307384 ) ) ( not ( = ?auto_307383 ?auto_307385 ) ) ( not ( = ?auto_307383 ?auto_307386 ) ) ( not ( = ?auto_307383 ?auto_307387 ) ) ( not ( = ?auto_307383 ?auto_307388 ) ) ( not ( = ?auto_307383 ?auto_307389 ) ) ( not ( = ?auto_307383 ?auto_307390 ) ) ( not ( = ?auto_307383 ?auto_307391 ) ) ( not ( = ?auto_307383 ?auto_307392 ) ) ( not ( = ?auto_307383 ?auto_307393 ) ) ( not ( = ?auto_307383 ?auto_307394 ) ) ( not ( = ?auto_307383 ?auto_307395 ) ) ( not ( = ?auto_307384 ?auto_307385 ) ) ( not ( = ?auto_307384 ?auto_307386 ) ) ( not ( = ?auto_307384 ?auto_307387 ) ) ( not ( = ?auto_307384 ?auto_307388 ) ) ( not ( = ?auto_307384 ?auto_307389 ) ) ( not ( = ?auto_307384 ?auto_307390 ) ) ( not ( = ?auto_307384 ?auto_307391 ) ) ( not ( = ?auto_307384 ?auto_307392 ) ) ( not ( = ?auto_307384 ?auto_307393 ) ) ( not ( = ?auto_307384 ?auto_307394 ) ) ( not ( = ?auto_307384 ?auto_307395 ) ) ( not ( = ?auto_307385 ?auto_307386 ) ) ( not ( = ?auto_307385 ?auto_307387 ) ) ( not ( = ?auto_307385 ?auto_307388 ) ) ( not ( = ?auto_307385 ?auto_307389 ) ) ( not ( = ?auto_307385 ?auto_307390 ) ) ( not ( = ?auto_307385 ?auto_307391 ) ) ( not ( = ?auto_307385 ?auto_307392 ) ) ( not ( = ?auto_307385 ?auto_307393 ) ) ( not ( = ?auto_307385 ?auto_307394 ) ) ( not ( = ?auto_307385 ?auto_307395 ) ) ( not ( = ?auto_307386 ?auto_307387 ) ) ( not ( = ?auto_307386 ?auto_307388 ) ) ( not ( = ?auto_307386 ?auto_307389 ) ) ( not ( = ?auto_307386 ?auto_307390 ) ) ( not ( = ?auto_307386 ?auto_307391 ) ) ( not ( = ?auto_307386 ?auto_307392 ) ) ( not ( = ?auto_307386 ?auto_307393 ) ) ( not ( = ?auto_307386 ?auto_307394 ) ) ( not ( = ?auto_307386 ?auto_307395 ) ) ( not ( = ?auto_307387 ?auto_307388 ) ) ( not ( = ?auto_307387 ?auto_307389 ) ) ( not ( = ?auto_307387 ?auto_307390 ) ) ( not ( = ?auto_307387 ?auto_307391 ) ) ( not ( = ?auto_307387 ?auto_307392 ) ) ( not ( = ?auto_307387 ?auto_307393 ) ) ( not ( = ?auto_307387 ?auto_307394 ) ) ( not ( = ?auto_307387 ?auto_307395 ) ) ( not ( = ?auto_307388 ?auto_307389 ) ) ( not ( = ?auto_307388 ?auto_307390 ) ) ( not ( = ?auto_307388 ?auto_307391 ) ) ( not ( = ?auto_307388 ?auto_307392 ) ) ( not ( = ?auto_307388 ?auto_307393 ) ) ( not ( = ?auto_307388 ?auto_307394 ) ) ( not ( = ?auto_307388 ?auto_307395 ) ) ( not ( = ?auto_307389 ?auto_307390 ) ) ( not ( = ?auto_307389 ?auto_307391 ) ) ( not ( = ?auto_307389 ?auto_307392 ) ) ( not ( = ?auto_307389 ?auto_307393 ) ) ( not ( = ?auto_307389 ?auto_307394 ) ) ( not ( = ?auto_307389 ?auto_307395 ) ) ( not ( = ?auto_307390 ?auto_307391 ) ) ( not ( = ?auto_307390 ?auto_307392 ) ) ( not ( = ?auto_307390 ?auto_307393 ) ) ( not ( = ?auto_307390 ?auto_307394 ) ) ( not ( = ?auto_307390 ?auto_307395 ) ) ( not ( = ?auto_307391 ?auto_307392 ) ) ( not ( = ?auto_307391 ?auto_307393 ) ) ( not ( = ?auto_307391 ?auto_307394 ) ) ( not ( = ?auto_307391 ?auto_307395 ) ) ( not ( = ?auto_307392 ?auto_307393 ) ) ( not ( = ?auto_307392 ?auto_307394 ) ) ( not ( = ?auto_307392 ?auto_307395 ) ) ( not ( = ?auto_307393 ?auto_307394 ) ) ( not ( = ?auto_307393 ?auto_307395 ) ) ( not ( = ?auto_307394 ?auto_307395 ) ) ( ON ?auto_307393 ?auto_307394 ) ( ON ?auto_307392 ?auto_307393 ) ( ON ?auto_307391 ?auto_307392 ) ( ON ?auto_307390 ?auto_307391 ) ( ON ?auto_307389 ?auto_307390 ) ( CLEAR ?auto_307387 ) ( ON ?auto_307388 ?auto_307389 ) ( CLEAR ?auto_307388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_307383 ?auto_307384 ?auto_307385 ?auto_307386 ?auto_307387 ?auto_307388 )
      ( MAKE-12PILE ?auto_307383 ?auto_307384 ?auto_307385 ?auto_307386 ?auto_307387 ?auto_307388 ?auto_307389 ?auto_307390 ?auto_307391 ?auto_307392 ?auto_307393 ?auto_307394 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307408 - BLOCK
      ?auto_307409 - BLOCK
      ?auto_307410 - BLOCK
      ?auto_307411 - BLOCK
      ?auto_307412 - BLOCK
      ?auto_307413 - BLOCK
      ?auto_307414 - BLOCK
      ?auto_307415 - BLOCK
      ?auto_307416 - BLOCK
      ?auto_307417 - BLOCK
      ?auto_307418 - BLOCK
      ?auto_307419 - BLOCK
    )
    :vars
    (
      ?auto_307420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307419 ?auto_307420 ) ( ON-TABLE ?auto_307408 ) ( ON ?auto_307409 ?auto_307408 ) ( ON ?auto_307410 ?auto_307409 ) ( ON ?auto_307411 ?auto_307410 ) ( ON ?auto_307412 ?auto_307411 ) ( not ( = ?auto_307408 ?auto_307409 ) ) ( not ( = ?auto_307408 ?auto_307410 ) ) ( not ( = ?auto_307408 ?auto_307411 ) ) ( not ( = ?auto_307408 ?auto_307412 ) ) ( not ( = ?auto_307408 ?auto_307413 ) ) ( not ( = ?auto_307408 ?auto_307414 ) ) ( not ( = ?auto_307408 ?auto_307415 ) ) ( not ( = ?auto_307408 ?auto_307416 ) ) ( not ( = ?auto_307408 ?auto_307417 ) ) ( not ( = ?auto_307408 ?auto_307418 ) ) ( not ( = ?auto_307408 ?auto_307419 ) ) ( not ( = ?auto_307408 ?auto_307420 ) ) ( not ( = ?auto_307409 ?auto_307410 ) ) ( not ( = ?auto_307409 ?auto_307411 ) ) ( not ( = ?auto_307409 ?auto_307412 ) ) ( not ( = ?auto_307409 ?auto_307413 ) ) ( not ( = ?auto_307409 ?auto_307414 ) ) ( not ( = ?auto_307409 ?auto_307415 ) ) ( not ( = ?auto_307409 ?auto_307416 ) ) ( not ( = ?auto_307409 ?auto_307417 ) ) ( not ( = ?auto_307409 ?auto_307418 ) ) ( not ( = ?auto_307409 ?auto_307419 ) ) ( not ( = ?auto_307409 ?auto_307420 ) ) ( not ( = ?auto_307410 ?auto_307411 ) ) ( not ( = ?auto_307410 ?auto_307412 ) ) ( not ( = ?auto_307410 ?auto_307413 ) ) ( not ( = ?auto_307410 ?auto_307414 ) ) ( not ( = ?auto_307410 ?auto_307415 ) ) ( not ( = ?auto_307410 ?auto_307416 ) ) ( not ( = ?auto_307410 ?auto_307417 ) ) ( not ( = ?auto_307410 ?auto_307418 ) ) ( not ( = ?auto_307410 ?auto_307419 ) ) ( not ( = ?auto_307410 ?auto_307420 ) ) ( not ( = ?auto_307411 ?auto_307412 ) ) ( not ( = ?auto_307411 ?auto_307413 ) ) ( not ( = ?auto_307411 ?auto_307414 ) ) ( not ( = ?auto_307411 ?auto_307415 ) ) ( not ( = ?auto_307411 ?auto_307416 ) ) ( not ( = ?auto_307411 ?auto_307417 ) ) ( not ( = ?auto_307411 ?auto_307418 ) ) ( not ( = ?auto_307411 ?auto_307419 ) ) ( not ( = ?auto_307411 ?auto_307420 ) ) ( not ( = ?auto_307412 ?auto_307413 ) ) ( not ( = ?auto_307412 ?auto_307414 ) ) ( not ( = ?auto_307412 ?auto_307415 ) ) ( not ( = ?auto_307412 ?auto_307416 ) ) ( not ( = ?auto_307412 ?auto_307417 ) ) ( not ( = ?auto_307412 ?auto_307418 ) ) ( not ( = ?auto_307412 ?auto_307419 ) ) ( not ( = ?auto_307412 ?auto_307420 ) ) ( not ( = ?auto_307413 ?auto_307414 ) ) ( not ( = ?auto_307413 ?auto_307415 ) ) ( not ( = ?auto_307413 ?auto_307416 ) ) ( not ( = ?auto_307413 ?auto_307417 ) ) ( not ( = ?auto_307413 ?auto_307418 ) ) ( not ( = ?auto_307413 ?auto_307419 ) ) ( not ( = ?auto_307413 ?auto_307420 ) ) ( not ( = ?auto_307414 ?auto_307415 ) ) ( not ( = ?auto_307414 ?auto_307416 ) ) ( not ( = ?auto_307414 ?auto_307417 ) ) ( not ( = ?auto_307414 ?auto_307418 ) ) ( not ( = ?auto_307414 ?auto_307419 ) ) ( not ( = ?auto_307414 ?auto_307420 ) ) ( not ( = ?auto_307415 ?auto_307416 ) ) ( not ( = ?auto_307415 ?auto_307417 ) ) ( not ( = ?auto_307415 ?auto_307418 ) ) ( not ( = ?auto_307415 ?auto_307419 ) ) ( not ( = ?auto_307415 ?auto_307420 ) ) ( not ( = ?auto_307416 ?auto_307417 ) ) ( not ( = ?auto_307416 ?auto_307418 ) ) ( not ( = ?auto_307416 ?auto_307419 ) ) ( not ( = ?auto_307416 ?auto_307420 ) ) ( not ( = ?auto_307417 ?auto_307418 ) ) ( not ( = ?auto_307417 ?auto_307419 ) ) ( not ( = ?auto_307417 ?auto_307420 ) ) ( not ( = ?auto_307418 ?auto_307419 ) ) ( not ( = ?auto_307418 ?auto_307420 ) ) ( not ( = ?auto_307419 ?auto_307420 ) ) ( ON ?auto_307418 ?auto_307419 ) ( ON ?auto_307417 ?auto_307418 ) ( ON ?auto_307416 ?auto_307417 ) ( ON ?auto_307415 ?auto_307416 ) ( ON ?auto_307414 ?auto_307415 ) ( CLEAR ?auto_307412 ) ( ON ?auto_307413 ?auto_307414 ) ( CLEAR ?auto_307413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_307408 ?auto_307409 ?auto_307410 ?auto_307411 ?auto_307412 ?auto_307413 )
      ( MAKE-12PILE ?auto_307408 ?auto_307409 ?auto_307410 ?auto_307411 ?auto_307412 ?auto_307413 ?auto_307414 ?auto_307415 ?auto_307416 ?auto_307417 ?auto_307418 ?auto_307419 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307433 - BLOCK
      ?auto_307434 - BLOCK
      ?auto_307435 - BLOCK
      ?auto_307436 - BLOCK
      ?auto_307437 - BLOCK
      ?auto_307438 - BLOCK
      ?auto_307439 - BLOCK
      ?auto_307440 - BLOCK
      ?auto_307441 - BLOCK
      ?auto_307442 - BLOCK
      ?auto_307443 - BLOCK
      ?auto_307444 - BLOCK
    )
    :vars
    (
      ?auto_307445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307444 ?auto_307445 ) ( ON-TABLE ?auto_307433 ) ( ON ?auto_307434 ?auto_307433 ) ( ON ?auto_307435 ?auto_307434 ) ( ON ?auto_307436 ?auto_307435 ) ( not ( = ?auto_307433 ?auto_307434 ) ) ( not ( = ?auto_307433 ?auto_307435 ) ) ( not ( = ?auto_307433 ?auto_307436 ) ) ( not ( = ?auto_307433 ?auto_307437 ) ) ( not ( = ?auto_307433 ?auto_307438 ) ) ( not ( = ?auto_307433 ?auto_307439 ) ) ( not ( = ?auto_307433 ?auto_307440 ) ) ( not ( = ?auto_307433 ?auto_307441 ) ) ( not ( = ?auto_307433 ?auto_307442 ) ) ( not ( = ?auto_307433 ?auto_307443 ) ) ( not ( = ?auto_307433 ?auto_307444 ) ) ( not ( = ?auto_307433 ?auto_307445 ) ) ( not ( = ?auto_307434 ?auto_307435 ) ) ( not ( = ?auto_307434 ?auto_307436 ) ) ( not ( = ?auto_307434 ?auto_307437 ) ) ( not ( = ?auto_307434 ?auto_307438 ) ) ( not ( = ?auto_307434 ?auto_307439 ) ) ( not ( = ?auto_307434 ?auto_307440 ) ) ( not ( = ?auto_307434 ?auto_307441 ) ) ( not ( = ?auto_307434 ?auto_307442 ) ) ( not ( = ?auto_307434 ?auto_307443 ) ) ( not ( = ?auto_307434 ?auto_307444 ) ) ( not ( = ?auto_307434 ?auto_307445 ) ) ( not ( = ?auto_307435 ?auto_307436 ) ) ( not ( = ?auto_307435 ?auto_307437 ) ) ( not ( = ?auto_307435 ?auto_307438 ) ) ( not ( = ?auto_307435 ?auto_307439 ) ) ( not ( = ?auto_307435 ?auto_307440 ) ) ( not ( = ?auto_307435 ?auto_307441 ) ) ( not ( = ?auto_307435 ?auto_307442 ) ) ( not ( = ?auto_307435 ?auto_307443 ) ) ( not ( = ?auto_307435 ?auto_307444 ) ) ( not ( = ?auto_307435 ?auto_307445 ) ) ( not ( = ?auto_307436 ?auto_307437 ) ) ( not ( = ?auto_307436 ?auto_307438 ) ) ( not ( = ?auto_307436 ?auto_307439 ) ) ( not ( = ?auto_307436 ?auto_307440 ) ) ( not ( = ?auto_307436 ?auto_307441 ) ) ( not ( = ?auto_307436 ?auto_307442 ) ) ( not ( = ?auto_307436 ?auto_307443 ) ) ( not ( = ?auto_307436 ?auto_307444 ) ) ( not ( = ?auto_307436 ?auto_307445 ) ) ( not ( = ?auto_307437 ?auto_307438 ) ) ( not ( = ?auto_307437 ?auto_307439 ) ) ( not ( = ?auto_307437 ?auto_307440 ) ) ( not ( = ?auto_307437 ?auto_307441 ) ) ( not ( = ?auto_307437 ?auto_307442 ) ) ( not ( = ?auto_307437 ?auto_307443 ) ) ( not ( = ?auto_307437 ?auto_307444 ) ) ( not ( = ?auto_307437 ?auto_307445 ) ) ( not ( = ?auto_307438 ?auto_307439 ) ) ( not ( = ?auto_307438 ?auto_307440 ) ) ( not ( = ?auto_307438 ?auto_307441 ) ) ( not ( = ?auto_307438 ?auto_307442 ) ) ( not ( = ?auto_307438 ?auto_307443 ) ) ( not ( = ?auto_307438 ?auto_307444 ) ) ( not ( = ?auto_307438 ?auto_307445 ) ) ( not ( = ?auto_307439 ?auto_307440 ) ) ( not ( = ?auto_307439 ?auto_307441 ) ) ( not ( = ?auto_307439 ?auto_307442 ) ) ( not ( = ?auto_307439 ?auto_307443 ) ) ( not ( = ?auto_307439 ?auto_307444 ) ) ( not ( = ?auto_307439 ?auto_307445 ) ) ( not ( = ?auto_307440 ?auto_307441 ) ) ( not ( = ?auto_307440 ?auto_307442 ) ) ( not ( = ?auto_307440 ?auto_307443 ) ) ( not ( = ?auto_307440 ?auto_307444 ) ) ( not ( = ?auto_307440 ?auto_307445 ) ) ( not ( = ?auto_307441 ?auto_307442 ) ) ( not ( = ?auto_307441 ?auto_307443 ) ) ( not ( = ?auto_307441 ?auto_307444 ) ) ( not ( = ?auto_307441 ?auto_307445 ) ) ( not ( = ?auto_307442 ?auto_307443 ) ) ( not ( = ?auto_307442 ?auto_307444 ) ) ( not ( = ?auto_307442 ?auto_307445 ) ) ( not ( = ?auto_307443 ?auto_307444 ) ) ( not ( = ?auto_307443 ?auto_307445 ) ) ( not ( = ?auto_307444 ?auto_307445 ) ) ( ON ?auto_307443 ?auto_307444 ) ( ON ?auto_307442 ?auto_307443 ) ( ON ?auto_307441 ?auto_307442 ) ( ON ?auto_307440 ?auto_307441 ) ( ON ?auto_307439 ?auto_307440 ) ( ON ?auto_307438 ?auto_307439 ) ( CLEAR ?auto_307436 ) ( ON ?auto_307437 ?auto_307438 ) ( CLEAR ?auto_307437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_307433 ?auto_307434 ?auto_307435 ?auto_307436 ?auto_307437 )
      ( MAKE-12PILE ?auto_307433 ?auto_307434 ?auto_307435 ?auto_307436 ?auto_307437 ?auto_307438 ?auto_307439 ?auto_307440 ?auto_307441 ?auto_307442 ?auto_307443 ?auto_307444 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307458 - BLOCK
      ?auto_307459 - BLOCK
      ?auto_307460 - BLOCK
      ?auto_307461 - BLOCK
      ?auto_307462 - BLOCK
      ?auto_307463 - BLOCK
      ?auto_307464 - BLOCK
      ?auto_307465 - BLOCK
      ?auto_307466 - BLOCK
      ?auto_307467 - BLOCK
      ?auto_307468 - BLOCK
      ?auto_307469 - BLOCK
    )
    :vars
    (
      ?auto_307470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307469 ?auto_307470 ) ( ON-TABLE ?auto_307458 ) ( ON ?auto_307459 ?auto_307458 ) ( ON ?auto_307460 ?auto_307459 ) ( ON ?auto_307461 ?auto_307460 ) ( not ( = ?auto_307458 ?auto_307459 ) ) ( not ( = ?auto_307458 ?auto_307460 ) ) ( not ( = ?auto_307458 ?auto_307461 ) ) ( not ( = ?auto_307458 ?auto_307462 ) ) ( not ( = ?auto_307458 ?auto_307463 ) ) ( not ( = ?auto_307458 ?auto_307464 ) ) ( not ( = ?auto_307458 ?auto_307465 ) ) ( not ( = ?auto_307458 ?auto_307466 ) ) ( not ( = ?auto_307458 ?auto_307467 ) ) ( not ( = ?auto_307458 ?auto_307468 ) ) ( not ( = ?auto_307458 ?auto_307469 ) ) ( not ( = ?auto_307458 ?auto_307470 ) ) ( not ( = ?auto_307459 ?auto_307460 ) ) ( not ( = ?auto_307459 ?auto_307461 ) ) ( not ( = ?auto_307459 ?auto_307462 ) ) ( not ( = ?auto_307459 ?auto_307463 ) ) ( not ( = ?auto_307459 ?auto_307464 ) ) ( not ( = ?auto_307459 ?auto_307465 ) ) ( not ( = ?auto_307459 ?auto_307466 ) ) ( not ( = ?auto_307459 ?auto_307467 ) ) ( not ( = ?auto_307459 ?auto_307468 ) ) ( not ( = ?auto_307459 ?auto_307469 ) ) ( not ( = ?auto_307459 ?auto_307470 ) ) ( not ( = ?auto_307460 ?auto_307461 ) ) ( not ( = ?auto_307460 ?auto_307462 ) ) ( not ( = ?auto_307460 ?auto_307463 ) ) ( not ( = ?auto_307460 ?auto_307464 ) ) ( not ( = ?auto_307460 ?auto_307465 ) ) ( not ( = ?auto_307460 ?auto_307466 ) ) ( not ( = ?auto_307460 ?auto_307467 ) ) ( not ( = ?auto_307460 ?auto_307468 ) ) ( not ( = ?auto_307460 ?auto_307469 ) ) ( not ( = ?auto_307460 ?auto_307470 ) ) ( not ( = ?auto_307461 ?auto_307462 ) ) ( not ( = ?auto_307461 ?auto_307463 ) ) ( not ( = ?auto_307461 ?auto_307464 ) ) ( not ( = ?auto_307461 ?auto_307465 ) ) ( not ( = ?auto_307461 ?auto_307466 ) ) ( not ( = ?auto_307461 ?auto_307467 ) ) ( not ( = ?auto_307461 ?auto_307468 ) ) ( not ( = ?auto_307461 ?auto_307469 ) ) ( not ( = ?auto_307461 ?auto_307470 ) ) ( not ( = ?auto_307462 ?auto_307463 ) ) ( not ( = ?auto_307462 ?auto_307464 ) ) ( not ( = ?auto_307462 ?auto_307465 ) ) ( not ( = ?auto_307462 ?auto_307466 ) ) ( not ( = ?auto_307462 ?auto_307467 ) ) ( not ( = ?auto_307462 ?auto_307468 ) ) ( not ( = ?auto_307462 ?auto_307469 ) ) ( not ( = ?auto_307462 ?auto_307470 ) ) ( not ( = ?auto_307463 ?auto_307464 ) ) ( not ( = ?auto_307463 ?auto_307465 ) ) ( not ( = ?auto_307463 ?auto_307466 ) ) ( not ( = ?auto_307463 ?auto_307467 ) ) ( not ( = ?auto_307463 ?auto_307468 ) ) ( not ( = ?auto_307463 ?auto_307469 ) ) ( not ( = ?auto_307463 ?auto_307470 ) ) ( not ( = ?auto_307464 ?auto_307465 ) ) ( not ( = ?auto_307464 ?auto_307466 ) ) ( not ( = ?auto_307464 ?auto_307467 ) ) ( not ( = ?auto_307464 ?auto_307468 ) ) ( not ( = ?auto_307464 ?auto_307469 ) ) ( not ( = ?auto_307464 ?auto_307470 ) ) ( not ( = ?auto_307465 ?auto_307466 ) ) ( not ( = ?auto_307465 ?auto_307467 ) ) ( not ( = ?auto_307465 ?auto_307468 ) ) ( not ( = ?auto_307465 ?auto_307469 ) ) ( not ( = ?auto_307465 ?auto_307470 ) ) ( not ( = ?auto_307466 ?auto_307467 ) ) ( not ( = ?auto_307466 ?auto_307468 ) ) ( not ( = ?auto_307466 ?auto_307469 ) ) ( not ( = ?auto_307466 ?auto_307470 ) ) ( not ( = ?auto_307467 ?auto_307468 ) ) ( not ( = ?auto_307467 ?auto_307469 ) ) ( not ( = ?auto_307467 ?auto_307470 ) ) ( not ( = ?auto_307468 ?auto_307469 ) ) ( not ( = ?auto_307468 ?auto_307470 ) ) ( not ( = ?auto_307469 ?auto_307470 ) ) ( ON ?auto_307468 ?auto_307469 ) ( ON ?auto_307467 ?auto_307468 ) ( ON ?auto_307466 ?auto_307467 ) ( ON ?auto_307465 ?auto_307466 ) ( ON ?auto_307464 ?auto_307465 ) ( ON ?auto_307463 ?auto_307464 ) ( CLEAR ?auto_307461 ) ( ON ?auto_307462 ?auto_307463 ) ( CLEAR ?auto_307462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_307458 ?auto_307459 ?auto_307460 ?auto_307461 ?auto_307462 )
      ( MAKE-12PILE ?auto_307458 ?auto_307459 ?auto_307460 ?auto_307461 ?auto_307462 ?auto_307463 ?auto_307464 ?auto_307465 ?auto_307466 ?auto_307467 ?auto_307468 ?auto_307469 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307483 - BLOCK
      ?auto_307484 - BLOCK
      ?auto_307485 - BLOCK
      ?auto_307486 - BLOCK
      ?auto_307487 - BLOCK
      ?auto_307488 - BLOCK
      ?auto_307489 - BLOCK
      ?auto_307490 - BLOCK
      ?auto_307491 - BLOCK
      ?auto_307492 - BLOCK
      ?auto_307493 - BLOCK
      ?auto_307494 - BLOCK
    )
    :vars
    (
      ?auto_307495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307494 ?auto_307495 ) ( ON-TABLE ?auto_307483 ) ( ON ?auto_307484 ?auto_307483 ) ( ON ?auto_307485 ?auto_307484 ) ( not ( = ?auto_307483 ?auto_307484 ) ) ( not ( = ?auto_307483 ?auto_307485 ) ) ( not ( = ?auto_307483 ?auto_307486 ) ) ( not ( = ?auto_307483 ?auto_307487 ) ) ( not ( = ?auto_307483 ?auto_307488 ) ) ( not ( = ?auto_307483 ?auto_307489 ) ) ( not ( = ?auto_307483 ?auto_307490 ) ) ( not ( = ?auto_307483 ?auto_307491 ) ) ( not ( = ?auto_307483 ?auto_307492 ) ) ( not ( = ?auto_307483 ?auto_307493 ) ) ( not ( = ?auto_307483 ?auto_307494 ) ) ( not ( = ?auto_307483 ?auto_307495 ) ) ( not ( = ?auto_307484 ?auto_307485 ) ) ( not ( = ?auto_307484 ?auto_307486 ) ) ( not ( = ?auto_307484 ?auto_307487 ) ) ( not ( = ?auto_307484 ?auto_307488 ) ) ( not ( = ?auto_307484 ?auto_307489 ) ) ( not ( = ?auto_307484 ?auto_307490 ) ) ( not ( = ?auto_307484 ?auto_307491 ) ) ( not ( = ?auto_307484 ?auto_307492 ) ) ( not ( = ?auto_307484 ?auto_307493 ) ) ( not ( = ?auto_307484 ?auto_307494 ) ) ( not ( = ?auto_307484 ?auto_307495 ) ) ( not ( = ?auto_307485 ?auto_307486 ) ) ( not ( = ?auto_307485 ?auto_307487 ) ) ( not ( = ?auto_307485 ?auto_307488 ) ) ( not ( = ?auto_307485 ?auto_307489 ) ) ( not ( = ?auto_307485 ?auto_307490 ) ) ( not ( = ?auto_307485 ?auto_307491 ) ) ( not ( = ?auto_307485 ?auto_307492 ) ) ( not ( = ?auto_307485 ?auto_307493 ) ) ( not ( = ?auto_307485 ?auto_307494 ) ) ( not ( = ?auto_307485 ?auto_307495 ) ) ( not ( = ?auto_307486 ?auto_307487 ) ) ( not ( = ?auto_307486 ?auto_307488 ) ) ( not ( = ?auto_307486 ?auto_307489 ) ) ( not ( = ?auto_307486 ?auto_307490 ) ) ( not ( = ?auto_307486 ?auto_307491 ) ) ( not ( = ?auto_307486 ?auto_307492 ) ) ( not ( = ?auto_307486 ?auto_307493 ) ) ( not ( = ?auto_307486 ?auto_307494 ) ) ( not ( = ?auto_307486 ?auto_307495 ) ) ( not ( = ?auto_307487 ?auto_307488 ) ) ( not ( = ?auto_307487 ?auto_307489 ) ) ( not ( = ?auto_307487 ?auto_307490 ) ) ( not ( = ?auto_307487 ?auto_307491 ) ) ( not ( = ?auto_307487 ?auto_307492 ) ) ( not ( = ?auto_307487 ?auto_307493 ) ) ( not ( = ?auto_307487 ?auto_307494 ) ) ( not ( = ?auto_307487 ?auto_307495 ) ) ( not ( = ?auto_307488 ?auto_307489 ) ) ( not ( = ?auto_307488 ?auto_307490 ) ) ( not ( = ?auto_307488 ?auto_307491 ) ) ( not ( = ?auto_307488 ?auto_307492 ) ) ( not ( = ?auto_307488 ?auto_307493 ) ) ( not ( = ?auto_307488 ?auto_307494 ) ) ( not ( = ?auto_307488 ?auto_307495 ) ) ( not ( = ?auto_307489 ?auto_307490 ) ) ( not ( = ?auto_307489 ?auto_307491 ) ) ( not ( = ?auto_307489 ?auto_307492 ) ) ( not ( = ?auto_307489 ?auto_307493 ) ) ( not ( = ?auto_307489 ?auto_307494 ) ) ( not ( = ?auto_307489 ?auto_307495 ) ) ( not ( = ?auto_307490 ?auto_307491 ) ) ( not ( = ?auto_307490 ?auto_307492 ) ) ( not ( = ?auto_307490 ?auto_307493 ) ) ( not ( = ?auto_307490 ?auto_307494 ) ) ( not ( = ?auto_307490 ?auto_307495 ) ) ( not ( = ?auto_307491 ?auto_307492 ) ) ( not ( = ?auto_307491 ?auto_307493 ) ) ( not ( = ?auto_307491 ?auto_307494 ) ) ( not ( = ?auto_307491 ?auto_307495 ) ) ( not ( = ?auto_307492 ?auto_307493 ) ) ( not ( = ?auto_307492 ?auto_307494 ) ) ( not ( = ?auto_307492 ?auto_307495 ) ) ( not ( = ?auto_307493 ?auto_307494 ) ) ( not ( = ?auto_307493 ?auto_307495 ) ) ( not ( = ?auto_307494 ?auto_307495 ) ) ( ON ?auto_307493 ?auto_307494 ) ( ON ?auto_307492 ?auto_307493 ) ( ON ?auto_307491 ?auto_307492 ) ( ON ?auto_307490 ?auto_307491 ) ( ON ?auto_307489 ?auto_307490 ) ( ON ?auto_307488 ?auto_307489 ) ( ON ?auto_307487 ?auto_307488 ) ( CLEAR ?auto_307485 ) ( ON ?auto_307486 ?auto_307487 ) ( CLEAR ?auto_307486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_307483 ?auto_307484 ?auto_307485 ?auto_307486 )
      ( MAKE-12PILE ?auto_307483 ?auto_307484 ?auto_307485 ?auto_307486 ?auto_307487 ?auto_307488 ?auto_307489 ?auto_307490 ?auto_307491 ?auto_307492 ?auto_307493 ?auto_307494 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307508 - BLOCK
      ?auto_307509 - BLOCK
      ?auto_307510 - BLOCK
      ?auto_307511 - BLOCK
      ?auto_307512 - BLOCK
      ?auto_307513 - BLOCK
      ?auto_307514 - BLOCK
      ?auto_307515 - BLOCK
      ?auto_307516 - BLOCK
      ?auto_307517 - BLOCK
      ?auto_307518 - BLOCK
      ?auto_307519 - BLOCK
    )
    :vars
    (
      ?auto_307520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307519 ?auto_307520 ) ( ON-TABLE ?auto_307508 ) ( ON ?auto_307509 ?auto_307508 ) ( ON ?auto_307510 ?auto_307509 ) ( not ( = ?auto_307508 ?auto_307509 ) ) ( not ( = ?auto_307508 ?auto_307510 ) ) ( not ( = ?auto_307508 ?auto_307511 ) ) ( not ( = ?auto_307508 ?auto_307512 ) ) ( not ( = ?auto_307508 ?auto_307513 ) ) ( not ( = ?auto_307508 ?auto_307514 ) ) ( not ( = ?auto_307508 ?auto_307515 ) ) ( not ( = ?auto_307508 ?auto_307516 ) ) ( not ( = ?auto_307508 ?auto_307517 ) ) ( not ( = ?auto_307508 ?auto_307518 ) ) ( not ( = ?auto_307508 ?auto_307519 ) ) ( not ( = ?auto_307508 ?auto_307520 ) ) ( not ( = ?auto_307509 ?auto_307510 ) ) ( not ( = ?auto_307509 ?auto_307511 ) ) ( not ( = ?auto_307509 ?auto_307512 ) ) ( not ( = ?auto_307509 ?auto_307513 ) ) ( not ( = ?auto_307509 ?auto_307514 ) ) ( not ( = ?auto_307509 ?auto_307515 ) ) ( not ( = ?auto_307509 ?auto_307516 ) ) ( not ( = ?auto_307509 ?auto_307517 ) ) ( not ( = ?auto_307509 ?auto_307518 ) ) ( not ( = ?auto_307509 ?auto_307519 ) ) ( not ( = ?auto_307509 ?auto_307520 ) ) ( not ( = ?auto_307510 ?auto_307511 ) ) ( not ( = ?auto_307510 ?auto_307512 ) ) ( not ( = ?auto_307510 ?auto_307513 ) ) ( not ( = ?auto_307510 ?auto_307514 ) ) ( not ( = ?auto_307510 ?auto_307515 ) ) ( not ( = ?auto_307510 ?auto_307516 ) ) ( not ( = ?auto_307510 ?auto_307517 ) ) ( not ( = ?auto_307510 ?auto_307518 ) ) ( not ( = ?auto_307510 ?auto_307519 ) ) ( not ( = ?auto_307510 ?auto_307520 ) ) ( not ( = ?auto_307511 ?auto_307512 ) ) ( not ( = ?auto_307511 ?auto_307513 ) ) ( not ( = ?auto_307511 ?auto_307514 ) ) ( not ( = ?auto_307511 ?auto_307515 ) ) ( not ( = ?auto_307511 ?auto_307516 ) ) ( not ( = ?auto_307511 ?auto_307517 ) ) ( not ( = ?auto_307511 ?auto_307518 ) ) ( not ( = ?auto_307511 ?auto_307519 ) ) ( not ( = ?auto_307511 ?auto_307520 ) ) ( not ( = ?auto_307512 ?auto_307513 ) ) ( not ( = ?auto_307512 ?auto_307514 ) ) ( not ( = ?auto_307512 ?auto_307515 ) ) ( not ( = ?auto_307512 ?auto_307516 ) ) ( not ( = ?auto_307512 ?auto_307517 ) ) ( not ( = ?auto_307512 ?auto_307518 ) ) ( not ( = ?auto_307512 ?auto_307519 ) ) ( not ( = ?auto_307512 ?auto_307520 ) ) ( not ( = ?auto_307513 ?auto_307514 ) ) ( not ( = ?auto_307513 ?auto_307515 ) ) ( not ( = ?auto_307513 ?auto_307516 ) ) ( not ( = ?auto_307513 ?auto_307517 ) ) ( not ( = ?auto_307513 ?auto_307518 ) ) ( not ( = ?auto_307513 ?auto_307519 ) ) ( not ( = ?auto_307513 ?auto_307520 ) ) ( not ( = ?auto_307514 ?auto_307515 ) ) ( not ( = ?auto_307514 ?auto_307516 ) ) ( not ( = ?auto_307514 ?auto_307517 ) ) ( not ( = ?auto_307514 ?auto_307518 ) ) ( not ( = ?auto_307514 ?auto_307519 ) ) ( not ( = ?auto_307514 ?auto_307520 ) ) ( not ( = ?auto_307515 ?auto_307516 ) ) ( not ( = ?auto_307515 ?auto_307517 ) ) ( not ( = ?auto_307515 ?auto_307518 ) ) ( not ( = ?auto_307515 ?auto_307519 ) ) ( not ( = ?auto_307515 ?auto_307520 ) ) ( not ( = ?auto_307516 ?auto_307517 ) ) ( not ( = ?auto_307516 ?auto_307518 ) ) ( not ( = ?auto_307516 ?auto_307519 ) ) ( not ( = ?auto_307516 ?auto_307520 ) ) ( not ( = ?auto_307517 ?auto_307518 ) ) ( not ( = ?auto_307517 ?auto_307519 ) ) ( not ( = ?auto_307517 ?auto_307520 ) ) ( not ( = ?auto_307518 ?auto_307519 ) ) ( not ( = ?auto_307518 ?auto_307520 ) ) ( not ( = ?auto_307519 ?auto_307520 ) ) ( ON ?auto_307518 ?auto_307519 ) ( ON ?auto_307517 ?auto_307518 ) ( ON ?auto_307516 ?auto_307517 ) ( ON ?auto_307515 ?auto_307516 ) ( ON ?auto_307514 ?auto_307515 ) ( ON ?auto_307513 ?auto_307514 ) ( ON ?auto_307512 ?auto_307513 ) ( CLEAR ?auto_307510 ) ( ON ?auto_307511 ?auto_307512 ) ( CLEAR ?auto_307511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_307508 ?auto_307509 ?auto_307510 ?auto_307511 )
      ( MAKE-12PILE ?auto_307508 ?auto_307509 ?auto_307510 ?auto_307511 ?auto_307512 ?auto_307513 ?auto_307514 ?auto_307515 ?auto_307516 ?auto_307517 ?auto_307518 ?auto_307519 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307533 - BLOCK
      ?auto_307534 - BLOCK
      ?auto_307535 - BLOCK
      ?auto_307536 - BLOCK
      ?auto_307537 - BLOCK
      ?auto_307538 - BLOCK
      ?auto_307539 - BLOCK
      ?auto_307540 - BLOCK
      ?auto_307541 - BLOCK
      ?auto_307542 - BLOCK
      ?auto_307543 - BLOCK
      ?auto_307544 - BLOCK
    )
    :vars
    (
      ?auto_307545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307544 ?auto_307545 ) ( ON-TABLE ?auto_307533 ) ( ON ?auto_307534 ?auto_307533 ) ( not ( = ?auto_307533 ?auto_307534 ) ) ( not ( = ?auto_307533 ?auto_307535 ) ) ( not ( = ?auto_307533 ?auto_307536 ) ) ( not ( = ?auto_307533 ?auto_307537 ) ) ( not ( = ?auto_307533 ?auto_307538 ) ) ( not ( = ?auto_307533 ?auto_307539 ) ) ( not ( = ?auto_307533 ?auto_307540 ) ) ( not ( = ?auto_307533 ?auto_307541 ) ) ( not ( = ?auto_307533 ?auto_307542 ) ) ( not ( = ?auto_307533 ?auto_307543 ) ) ( not ( = ?auto_307533 ?auto_307544 ) ) ( not ( = ?auto_307533 ?auto_307545 ) ) ( not ( = ?auto_307534 ?auto_307535 ) ) ( not ( = ?auto_307534 ?auto_307536 ) ) ( not ( = ?auto_307534 ?auto_307537 ) ) ( not ( = ?auto_307534 ?auto_307538 ) ) ( not ( = ?auto_307534 ?auto_307539 ) ) ( not ( = ?auto_307534 ?auto_307540 ) ) ( not ( = ?auto_307534 ?auto_307541 ) ) ( not ( = ?auto_307534 ?auto_307542 ) ) ( not ( = ?auto_307534 ?auto_307543 ) ) ( not ( = ?auto_307534 ?auto_307544 ) ) ( not ( = ?auto_307534 ?auto_307545 ) ) ( not ( = ?auto_307535 ?auto_307536 ) ) ( not ( = ?auto_307535 ?auto_307537 ) ) ( not ( = ?auto_307535 ?auto_307538 ) ) ( not ( = ?auto_307535 ?auto_307539 ) ) ( not ( = ?auto_307535 ?auto_307540 ) ) ( not ( = ?auto_307535 ?auto_307541 ) ) ( not ( = ?auto_307535 ?auto_307542 ) ) ( not ( = ?auto_307535 ?auto_307543 ) ) ( not ( = ?auto_307535 ?auto_307544 ) ) ( not ( = ?auto_307535 ?auto_307545 ) ) ( not ( = ?auto_307536 ?auto_307537 ) ) ( not ( = ?auto_307536 ?auto_307538 ) ) ( not ( = ?auto_307536 ?auto_307539 ) ) ( not ( = ?auto_307536 ?auto_307540 ) ) ( not ( = ?auto_307536 ?auto_307541 ) ) ( not ( = ?auto_307536 ?auto_307542 ) ) ( not ( = ?auto_307536 ?auto_307543 ) ) ( not ( = ?auto_307536 ?auto_307544 ) ) ( not ( = ?auto_307536 ?auto_307545 ) ) ( not ( = ?auto_307537 ?auto_307538 ) ) ( not ( = ?auto_307537 ?auto_307539 ) ) ( not ( = ?auto_307537 ?auto_307540 ) ) ( not ( = ?auto_307537 ?auto_307541 ) ) ( not ( = ?auto_307537 ?auto_307542 ) ) ( not ( = ?auto_307537 ?auto_307543 ) ) ( not ( = ?auto_307537 ?auto_307544 ) ) ( not ( = ?auto_307537 ?auto_307545 ) ) ( not ( = ?auto_307538 ?auto_307539 ) ) ( not ( = ?auto_307538 ?auto_307540 ) ) ( not ( = ?auto_307538 ?auto_307541 ) ) ( not ( = ?auto_307538 ?auto_307542 ) ) ( not ( = ?auto_307538 ?auto_307543 ) ) ( not ( = ?auto_307538 ?auto_307544 ) ) ( not ( = ?auto_307538 ?auto_307545 ) ) ( not ( = ?auto_307539 ?auto_307540 ) ) ( not ( = ?auto_307539 ?auto_307541 ) ) ( not ( = ?auto_307539 ?auto_307542 ) ) ( not ( = ?auto_307539 ?auto_307543 ) ) ( not ( = ?auto_307539 ?auto_307544 ) ) ( not ( = ?auto_307539 ?auto_307545 ) ) ( not ( = ?auto_307540 ?auto_307541 ) ) ( not ( = ?auto_307540 ?auto_307542 ) ) ( not ( = ?auto_307540 ?auto_307543 ) ) ( not ( = ?auto_307540 ?auto_307544 ) ) ( not ( = ?auto_307540 ?auto_307545 ) ) ( not ( = ?auto_307541 ?auto_307542 ) ) ( not ( = ?auto_307541 ?auto_307543 ) ) ( not ( = ?auto_307541 ?auto_307544 ) ) ( not ( = ?auto_307541 ?auto_307545 ) ) ( not ( = ?auto_307542 ?auto_307543 ) ) ( not ( = ?auto_307542 ?auto_307544 ) ) ( not ( = ?auto_307542 ?auto_307545 ) ) ( not ( = ?auto_307543 ?auto_307544 ) ) ( not ( = ?auto_307543 ?auto_307545 ) ) ( not ( = ?auto_307544 ?auto_307545 ) ) ( ON ?auto_307543 ?auto_307544 ) ( ON ?auto_307542 ?auto_307543 ) ( ON ?auto_307541 ?auto_307542 ) ( ON ?auto_307540 ?auto_307541 ) ( ON ?auto_307539 ?auto_307540 ) ( ON ?auto_307538 ?auto_307539 ) ( ON ?auto_307537 ?auto_307538 ) ( ON ?auto_307536 ?auto_307537 ) ( CLEAR ?auto_307534 ) ( ON ?auto_307535 ?auto_307536 ) ( CLEAR ?auto_307535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_307533 ?auto_307534 ?auto_307535 )
      ( MAKE-12PILE ?auto_307533 ?auto_307534 ?auto_307535 ?auto_307536 ?auto_307537 ?auto_307538 ?auto_307539 ?auto_307540 ?auto_307541 ?auto_307542 ?auto_307543 ?auto_307544 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307558 - BLOCK
      ?auto_307559 - BLOCK
      ?auto_307560 - BLOCK
      ?auto_307561 - BLOCK
      ?auto_307562 - BLOCK
      ?auto_307563 - BLOCK
      ?auto_307564 - BLOCK
      ?auto_307565 - BLOCK
      ?auto_307566 - BLOCK
      ?auto_307567 - BLOCK
      ?auto_307568 - BLOCK
      ?auto_307569 - BLOCK
    )
    :vars
    (
      ?auto_307570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307569 ?auto_307570 ) ( ON-TABLE ?auto_307558 ) ( ON ?auto_307559 ?auto_307558 ) ( not ( = ?auto_307558 ?auto_307559 ) ) ( not ( = ?auto_307558 ?auto_307560 ) ) ( not ( = ?auto_307558 ?auto_307561 ) ) ( not ( = ?auto_307558 ?auto_307562 ) ) ( not ( = ?auto_307558 ?auto_307563 ) ) ( not ( = ?auto_307558 ?auto_307564 ) ) ( not ( = ?auto_307558 ?auto_307565 ) ) ( not ( = ?auto_307558 ?auto_307566 ) ) ( not ( = ?auto_307558 ?auto_307567 ) ) ( not ( = ?auto_307558 ?auto_307568 ) ) ( not ( = ?auto_307558 ?auto_307569 ) ) ( not ( = ?auto_307558 ?auto_307570 ) ) ( not ( = ?auto_307559 ?auto_307560 ) ) ( not ( = ?auto_307559 ?auto_307561 ) ) ( not ( = ?auto_307559 ?auto_307562 ) ) ( not ( = ?auto_307559 ?auto_307563 ) ) ( not ( = ?auto_307559 ?auto_307564 ) ) ( not ( = ?auto_307559 ?auto_307565 ) ) ( not ( = ?auto_307559 ?auto_307566 ) ) ( not ( = ?auto_307559 ?auto_307567 ) ) ( not ( = ?auto_307559 ?auto_307568 ) ) ( not ( = ?auto_307559 ?auto_307569 ) ) ( not ( = ?auto_307559 ?auto_307570 ) ) ( not ( = ?auto_307560 ?auto_307561 ) ) ( not ( = ?auto_307560 ?auto_307562 ) ) ( not ( = ?auto_307560 ?auto_307563 ) ) ( not ( = ?auto_307560 ?auto_307564 ) ) ( not ( = ?auto_307560 ?auto_307565 ) ) ( not ( = ?auto_307560 ?auto_307566 ) ) ( not ( = ?auto_307560 ?auto_307567 ) ) ( not ( = ?auto_307560 ?auto_307568 ) ) ( not ( = ?auto_307560 ?auto_307569 ) ) ( not ( = ?auto_307560 ?auto_307570 ) ) ( not ( = ?auto_307561 ?auto_307562 ) ) ( not ( = ?auto_307561 ?auto_307563 ) ) ( not ( = ?auto_307561 ?auto_307564 ) ) ( not ( = ?auto_307561 ?auto_307565 ) ) ( not ( = ?auto_307561 ?auto_307566 ) ) ( not ( = ?auto_307561 ?auto_307567 ) ) ( not ( = ?auto_307561 ?auto_307568 ) ) ( not ( = ?auto_307561 ?auto_307569 ) ) ( not ( = ?auto_307561 ?auto_307570 ) ) ( not ( = ?auto_307562 ?auto_307563 ) ) ( not ( = ?auto_307562 ?auto_307564 ) ) ( not ( = ?auto_307562 ?auto_307565 ) ) ( not ( = ?auto_307562 ?auto_307566 ) ) ( not ( = ?auto_307562 ?auto_307567 ) ) ( not ( = ?auto_307562 ?auto_307568 ) ) ( not ( = ?auto_307562 ?auto_307569 ) ) ( not ( = ?auto_307562 ?auto_307570 ) ) ( not ( = ?auto_307563 ?auto_307564 ) ) ( not ( = ?auto_307563 ?auto_307565 ) ) ( not ( = ?auto_307563 ?auto_307566 ) ) ( not ( = ?auto_307563 ?auto_307567 ) ) ( not ( = ?auto_307563 ?auto_307568 ) ) ( not ( = ?auto_307563 ?auto_307569 ) ) ( not ( = ?auto_307563 ?auto_307570 ) ) ( not ( = ?auto_307564 ?auto_307565 ) ) ( not ( = ?auto_307564 ?auto_307566 ) ) ( not ( = ?auto_307564 ?auto_307567 ) ) ( not ( = ?auto_307564 ?auto_307568 ) ) ( not ( = ?auto_307564 ?auto_307569 ) ) ( not ( = ?auto_307564 ?auto_307570 ) ) ( not ( = ?auto_307565 ?auto_307566 ) ) ( not ( = ?auto_307565 ?auto_307567 ) ) ( not ( = ?auto_307565 ?auto_307568 ) ) ( not ( = ?auto_307565 ?auto_307569 ) ) ( not ( = ?auto_307565 ?auto_307570 ) ) ( not ( = ?auto_307566 ?auto_307567 ) ) ( not ( = ?auto_307566 ?auto_307568 ) ) ( not ( = ?auto_307566 ?auto_307569 ) ) ( not ( = ?auto_307566 ?auto_307570 ) ) ( not ( = ?auto_307567 ?auto_307568 ) ) ( not ( = ?auto_307567 ?auto_307569 ) ) ( not ( = ?auto_307567 ?auto_307570 ) ) ( not ( = ?auto_307568 ?auto_307569 ) ) ( not ( = ?auto_307568 ?auto_307570 ) ) ( not ( = ?auto_307569 ?auto_307570 ) ) ( ON ?auto_307568 ?auto_307569 ) ( ON ?auto_307567 ?auto_307568 ) ( ON ?auto_307566 ?auto_307567 ) ( ON ?auto_307565 ?auto_307566 ) ( ON ?auto_307564 ?auto_307565 ) ( ON ?auto_307563 ?auto_307564 ) ( ON ?auto_307562 ?auto_307563 ) ( ON ?auto_307561 ?auto_307562 ) ( CLEAR ?auto_307559 ) ( ON ?auto_307560 ?auto_307561 ) ( CLEAR ?auto_307560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_307558 ?auto_307559 ?auto_307560 )
      ( MAKE-12PILE ?auto_307558 ?auto_307559 ?auto_307560 ?auto_307561 ?auto_307562 ?auto_307563 ?auto_307564 ?auto_307565 ?auto_307566 ?auto_307567 ?auto_307568 ?auto_307569 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307583 - BLOCK
      ?auto_307584 - BLOCK
      ?auto_307585 - BLOCK
      ?auto_307586 - BLOCK
      ?auto_307587 - BLOCK
      ?auto_307588 - BLOCK
      ?auto_307589 - BLOCK
      ?auto_307590 - BLOCK
      ?auto_307591 - BLOCK
      ?auto_307592 - BLOCK
      ?auto_307593 - BLOCK
      ?auto_307594 - BLOCK
    )
    :vars
    (
      ?auto_307595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307594 ?auto_307595 ) ( ON-TABLE ?auto_307583 ) ( not ( = ?auto_307583 ?auto_307584 ) ) ( not ( = ?auto_307583 ?auto_307585 ) ) ( not ( = ?auto_307583 ?auto_307586 ) ) ( not ( = ?auto_307583 ?auto_307587 ) ) ( not ( = ?auto_307583 ?auto_307588 ) ) ( not ( = ?auto_307583 ?auto_307589 ) ) ( not ( = ?auto_307583 ?auto_307590 ) ) ( not ( = ?auto_307583 ?auto_307591 ) ) ( not ( = ?auto_307583 ?auto_307592 ) ) ( not ( = ?auto_307583 ?auto_307593 ) ) ( not ( = ?auto_307583 ?auto_307594 ) ) ( not ( = ?auto_307583 ?auto_307595 ) ) ( not ( = ?auto_307584 ?auto_307585 ) ) ( not ( = ?auto_307584 ?auto_307586 ) ) ( not ( = ?auto_307584 ?auto_307587 ) ) ( not ( = ?auto_307584 ?auto_307588 ) ) ( not ( = ?auto_307584 ?auto_307589 ) ) ( not ( = ?auto_307584 ?auto_307590 ) ) ( not ( = ?auto_307584 ?auto_307591 ) ) ( not ( = ?auto_307584 ?auto_307592 ) ) ( not ( = ?auto_307584 ?auto_307593 ) ) ( not ( = ?auto_307584 ?auto_307594 ) ) ( not ( = ?auto_307584 ?auto_307595 ) ) ( not ( = ?auto_307585 ?auto_307586 ) ) ( not ( = ?auto_307585 ?auto_307587 ) ) ( not ( = ?auto_307585 ?auto_307588 ) ) ( not ( = ?auto_307585 ?auto_307589 ) ) ( not ( = ?auto_307585 ?auto_307590 ) ) ( not ( = ?auto_307585 ?auto_307591 ) ) ( not ( = ?auto_307585 ?auto_307592 ) ) ( not ( = ?auto_307585 ?auto_307593 ) ) ( not ( = ?auto_307585 ?auto_307594 ) ) ( not ( = ?auto_307585 ?auto_307595 ) ) ( not ( = ?auto_307586 ?auto_307587 ) ) ( not ( = ?auto_307586 ?auto_307588 ) ) ( not ( = ?auto_307586 ?auto_307589 ) ) ( not ( = ?auto_307586 ?auto_307590 ) ) ( not ( = ?auto_307586 ?auto_307591 ) ) ( not ( = ?auto_307586 ?auto_307592 ) ) ( not ( = ?auto_307586 ?auto_307593 ) ) ( not ( = ?auto_307586 ?auto_307594 ) ) ( not ( = ?auto_307586 ?auto_307595 ) ) ( not ( = ?auto_307587 ?auto_307588 ) ) ( not ( = ?auto_307587 ?auto_307589 ) ) ( not ( = ?auto_307587 ?auto_307590 ) ) ( not ( = ?auto_307587 ?auto_307591 ) ) ( not ( = ?auto_307587 ?auto_307592 ) ) ( not ( = ?auto_307587 ?auto_307593 ) ) ( not ( = ?auto_307587 ?auto_307594 ) ) ( not ( = ?auto_307587 ?auto_307595 ) ) ( not ( = ?auto_307588 ?auto_307589 ) ) ( not ( = ?auto_307588 ?auto_307590 ) ) ( not ( = ?auto_307588 ?auto_307591 ) ) ( not ( = ?auto_307588 ?auto_307592 ) ) ( not ( = ?auto_307588 ?auto_307593 ) ) ( not ( = ?auto_307588 ?auto_307594 ) ) ( not ( = ?auto_307588 ?auto_307595 ) ) ( not ( = ?auto_307589 ?auto_307590 ) ) ( not ( = ?auto_307589 ?auto_307591 ) ) ( not ( = ?auto_307589 ?auto_307592 ) ) ( not ( = ?auto_307589 ?auto_307593 ) ) ( not ( = ?auto_307589 ?auto_307594 ) ) ( not ( = ?auto_307589 ?auto_307595 ) ) ( not ( = ?auto_307590 ?auto_307591 ) ) ( not ( = ?auto_307590 ?auto_307592 ) ) ( not ( = ?auto_307590 ?auto_307593 ) ) ( not ( = ?auto_307590 ?auto_307594 ) ) ( not ( = ?auto_307590 ?auto_307595 ) ) ( not ( = ?auto_307591 ?auto_307592 ) ) ( not ( = ?auto_307591 ?auto_307593 ) ) ( not ( = ?auto_307591 ?auto_307594 ) ) ( not ( = ?auto_307591 ?auto_307595 ) ) ( not ( = ?auto_307592 ?auto_307593 ) ) ( not ( = ?auto_307592 ?auto_307594 ) ) ( not ( = ?auto_307592 ?auto_307595 ) ) ( not ( = ?auto_307593 ?auto_307594 ) ) ( not ( = ?auto_307593 ?auto_307595 ) ) ( not ( = ?auto_307594 ?auto_307595 ) ) ( ON ?auto_307593 ?auto_307594 ) ( ON ?auto_307592 ?auto_307593 ) ( ON ?auto_307591 ?auto_307592 ) ( ON ?auto_307590 ?auto_307591 ) ( ON ?auto_307589 ?auto_307590 ) ( ON ?auto_307588 ?auto_307589 ) ( ON ?auto_307587 ?auto_307588 ) ( ON ?auto_307586 ?auto_307587 ) ( ON ?auto_307585 ?auto_307586 ) ( CLEAR ?auto_307583 ) ( ON ?auto_307584 ?auto_307585 ) ( CLEAR ?auto_307584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_307583 ?auto_307584 )
      ( MAKE-12PILE ?auto_307583 ?auto_307584 ?auto_307585 ?auto_307586 ?auto_307587 ?auto_307588 ?auto_307589 ?auto_307590 ?auto_307591 ?auto_307592 ?auto_307593 ?auto_307594 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307608 - BLOCK
      ?auto_307609 - BLOCK
      ?auto_307610 - BLOCK
      ?auto_307611 - BLOCK
      ?auto_307612 - BLOCK
      ?auto_307613 - BLOCK
      ?auto_307614 - BLOCK
      ?auto_307615 - BLOCK
      ?auto_307616 - BLOCK
      ?auto_307617 - BLOCK
      ?auto_307618 - BLOCK
      ?auto_307619 - BLOCK
    )
    :vars
    (
      ?auto_307620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307619 ?auto_307620 ) ( ON-TABLE ?auto_307608 ) ( not ( = ?auto_307608 ?auto_307609 ) ) ( not ( = ?auto_307608 ?auto_307610 ) ) ( not ( = ?auto_307608 ?auto_307611 ) ) ( not ( = ?auto_307608 ?auto_307612 ) ) ( not ( = ?auto_307608 ?auto_307613 ) ) ( not ( = ?auto_307608 ?auto_307614 ) ) ( not ( = ?auto_307608 ?auto_307615 ) ) ( not ( = ?auto_307608 ?auto_307616 ) ) ( not ( = ?auto_307608 ?auto_307617 ) ) ( not ( = ?auto_307608 ?auto_307618 ) ) ( not ( = ?auto_307608 ?auto_307619 ) ) ( not ( = ?auto_307608 ?auto_307620 ) ) ( not ( = ?auto_307609 ?auto_307610 ) ) ( not ( = ?auto_307609 ?auto_307611 ) ) ( not ( = ?auto_307609 ?auto_307612 ) ) ( not ( = ?auto_307609 ?auto_307613 ) ) ( not ( = ?auto_307609 ?auto_307614 ) ) ( not ( = ?auto_307609 ?auto_307615 ) ) ( not ( = ?auto_307609 ?auto_307616 ) ) ( not ( = ?auto_307609 ?auto_307617 ) ) ( not ( = ?auto_307609 ?auto_307618 ) ) ( not ( = ?auto_307609 ?auto_307619 ) ) ( not ( = ?auto_307609 ?auto_307620 ) ) ( not ( = ?auto_307610 ?auto_307611 ) ) ( not ( = ?auto_307610 ?auto_307612 ) ) ( not ( = ?auto_307610 ?auto_307613 ) ) ( not ( = ?auto_307610 ?auto_307614 ) ) ( not ( = ?auto_307610 ?auto_307615 ) ) ( not ( = ?auto_307610 ?auto_307616 ) ) ( not ( = ?auto_307610 ?auto_307617 ) ) ( not ( = ?auto_307610 ?auto_307618 ) ) ( not ( = ?auto_307610 ?auto_307619 ) ) ( not ( = ?auto_307610 ?auto_307620 ) ) ( not ( = ?auto_307611 ?auto_307612 ) ) ( not ( = ?auto_307611 ?auto_307613 ) ) ( not ( = ?auto_307611 ?auto_307614 ) ) ( not ( = ?auto_307611 ?auto_307615 ) ) ( not ( = ?auto_307611 ?auto_307616 ) ) ( not ( = ?auto_307611 ?auto_307617 ) ) ( not ( = ?auto_307611 ?auto_307618 ) ) ( not ( = ?auto_307611 ?auto_307619 ) ) ( not ( = ?auto_307611 ?auto_307620 ) ) ( not ( = ?auto_307612 ?auto_307613 ) ) ( not ( = ?auto_307612 ?auto_307614 ) ) ( not ( = ?auto_307612 ?auto_307615 ) ) ( not ( = ?auto_307612 ?auto_307616 ) ) ( not ( = ?auto_307612 ?auto_307617 ) ) ( not ( = ?auto_307612 ?auto_307618 ) ) ( not ( = ?auto_307612 ?auto_307619 ) ) ( not ( = ?auto_307612 ?auto_307620 ) ) ( not ( = ?auto_307613 ?auto_307614 ) ) ( not ( = ?auto_307613 ?auto_307615 ) ) ( not ( = ?auto_307613 ?auto_307616 ) ) ( not ( = ?auto_307613 ?auto_307617 ) ) ( not ( = ?auto_307613 ?auto_307618 ) ) ( not ( = ?auto_307613 ?auto_307619 ) ) ( not ( = ?auto_307613 ?auto_307620 ) ) ( not ( = ?auto_307614 ?auto_307615 ) ) ( not ( = ?auto_307614 ?auto_307616 ) ) ( not ( = ?auto_307614 ?auto_307617 ) ) ( not ( = ?auto_307614 ?auto_307618 ) ) ( not ( = ?auto_307614 ?auto_307619 ) ) ( not ( = ?auto_307614 ?auto_307620 ) ) ( not ( = ?auto_307615 ?auto_307616 ) ) ( not ( = ?auto_307615 ?auto_307617 ) ) ( not ( = ?auto_307615 ?auto_307618 ) ) ( not ( = ?auto_307615 ?auto_307619 ) ) ( not ( = ?auto_307615 ?auto_307620 ) ) ( not ( = ?auto_307616 ?auto_307617 ) ) ( not ( = ?auto_307616 ?auto_307618 ) ) ( not ( = ?auto_307616 ?auto_307619 ) ) ( not ( = ?auto_307616 ?auto_307620 ) ) ( not ( = ?auto_307617 ?auto_307618 ) ) ( not ( = ?auto_307617 ?auto_307619 ) ) ( not ( = ?auto_307617 ?auto_307620 ) ) ( not ( = ?auto_307618 ?auto_307619 ) ) ( not ( = ?auto_307618 ?auto_307620 ) ) ( not ( = ?auto_307619 ?auto_307620 ) ) ( ON ?auto_307618 ?auto_307619 ) ( ON ?auto_307617 ?auto_307618 ) ( ON ?auto_307616 ?auto_307617 ) ( ON ?auto_307615 ?auto_307616 ) ( ON ?auto_307614 ?auto_307615 ) ( ON ?auto_307613 ?auto_307614 ) ( ON ?auto_307612 ?auto_307613 ) ( ON ?auto_307611 ?auto_307612 ) ( ON ?auto_307610 ?auto_307611 ) ( CLEAR ?auto_307608 ) ( ON ?auto_307609 ?auto_307610 ) ( CLEAR ?auto_307609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_307608 ?auto_307609 )
      ( MAKE-12PILE ?auto_307608 ?auto_307609 ?auto_307610 ?auto_307611 ?auto_307612 ?auto_307613 ?auto_307614 ?auto_307615 ?auto_307616 ?auto_307617 ?auto_307618 ?auto_307619 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307633 - BLOCK
      ?auto_307634 - BLOCK
      ?auto_307635 - BLOCK
      ?auto_307636 - BLOCK
      ?auto_307637 - BLOCK
      ?auto_307638 - BLOCK
      ?auto_307639 - BLOCK
      ?auto_307640 - BLOCK
      ?auto_307641 - BLOCK
      ?auto_307642 - BLOCK
      ?auto_307643 - BLOCK
      ?auto_307644 - BLOCK
    )
    :vars
    (
      ?auto_307645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307644 ?auto_307645 ) ( not ( = ?auto_307633 ?auto_307634 ) ) ( not ( = ?auto_307633 ?auto_307635 ) ) ( not ( = ?auto_307633 ?auto_307636 ) ) ( not ( = ?auto_307633 ?auto_307637 ) ) ( not ( = ?auto_307633 ?auto_307638 ) ) ( not ( = ?auto_307633 ?auto_307639 ) ) ( not ( = ?auto_307633 ?auto_307640 ) ) ( not ( = ?auto_307633 ?auto_307641 ) ) ( not ( = ?auto_307633 ?auto_307642 ) ) ( not ( = ?auto_307633 ?auto_307643 ) ) ( not ( = ?auto_307633 ?auto_307644 ) ) ( not ( = ?auto_307633 ?auto_307645 ) ) ( not ( = ?auto_307634 ?auto_307635 ) ) ( not ( = ?auto_307634 ?auto_307636 ) ) ( not ( = ?auto_307634 ?auto_307637 ) ) ( not ( = ?auto_307634 ?auto_307638 ) ) ( not ( = ?auto_307634 ?auto_307639 ) ) ( not ( = ?auto_307634 ?auto_307640 ) ) ( not ( = ?auto_307634 ?auto_307641 ) ) ( not ( = ?auto_307634 ?auto_307642 ) ) ( not ( = ?auto_307634 ?auto_307643 ) ) ( not ( = ?auto_307634 ?auto_307644 ) ) ( not ( = ?auto_307634 ?auto_307645 ) ) ( not ( = ?auto_307635 ?auto_307636 ) ) ( not ( = ?auto_307635 ?auto_307637 ) ) ( not ( = ?auto_307635 ?auto_307638 ) ) ( not ( = ?auto_307635 ?auto_307639 ) ) ( not ( = ?auto_307635 ?auto_307640 ) ) ( not ( = ?auto_307635 ?auto_307641 ) ) ( not ( = ?auto_307635 ?auto_307642 ) ) ( not ( = ?auto_307635 ?auto_307643 ) ) ( not ( = ?auto_307635 ?auto_307644 ) ) ( not ( = ?auto_307635 ?auto_307645 ) ) ( not ( = ?auto_307636 ?auto_307637 ) ) ( not ( = ?auto_307636 ?auto_307638 ) ) ( not ( = ?auto_307636 ?auto_307639 ) ) ( not ( = ?auto_307636 ?auto_307640 ) ) ( not ( = ?auto_307636 ?auto_307641 ) ) ( not ( = ?auto_307636 ?auto_307642 ) ) ( not ( = ?auto_307636 ?auto_307643 ) ) ( not ( = ?auto_307636 ?auto_307644 ) ) ( not ( = ?auto_307636 ?auto_307645 ) ) ( not ( = ?auto_307637 ?auto_307638 ) ) ( not ( = ?auto_307637 ?auto_307639 ) ) ( not ( = ?auto_307637 ?auto_307640 ) ) ( not ( = ?auto_307637 ?auto_307641 ) ) ( not ( = ?auto_307637 ?auto_307642 ) ) ( not ( = ?auto_307637 ?auto_307643 ) ) ( not ( = ?auto_307637 ?auto_307644 ) ) ( not ( = ?auto_307637 ?auto_307645 ) ) ( not ( = ?auto_307638 ?auto_307639 ) ) ( not ( = ?auto_307638 ?auto_307640 ) ) ( not ( = ?auto_307638 ?auto_307641 ) ) ( not ( = ?auto_307638 ?auto_307642 ) ) ( not ( = ?auto_307638 ?auto_307643 ) ) ( not ( = ?auto_307638 ?auto_307644 ) ) ( not ( = ?auto_307638 ?auto_307645 ) ) ( not ( = ?auto_307639 ?auto_307640 ) ) ( not ( = ?auto_307639 ?auto_307641 ) ) ( not ( = ?auto_307639 ?auto_307642 ) ) ( not ( = ?auto_307639 ?auto_307643 ) ) ( not ( = ?auto_307639 ?auto_307644 ) ) ( not ( = ?auto_307639 ?auto_307645 ) ) ( not ( = ?auto_307640 ?auto_307641 ) ) ( not ( = ?auto_307640 ?auto_307642 ) ) ( not ( = ?auto_307640 ?auto_307643 ) ) ( not ( = ?auto_307640 ?auto_307644 ) ) ( not ( = ?auto_307640 ?auto_307645 ) ) ( not ( = ?auto_307641 ?auto_307642 ) ) ( not ( = ?auto_307641 ?auto_307643 ) ) ( not ( = ?auto_307641 ?auto_307644 ) ) ( not ( = ?auto_307641 ?auto_307645 ) ) ( not ( = ?auto_307642 ?auto_307643 ) ) ( not ( = ?auto_307642 ?auto_307644 ) ) ( not ( = ?auto_307642 ?auto_307645 ) ) ( not ( = ?auto_307643 ?auto_307644 ) ) ( not ( = ?auto_307643 ?auto_307645 ) ) ( not ( = ?auto_307644 ?auto_307645 ) ) ( ON ?auto_307643 ?auto_307644 ) ( ON ?auto_307642 ?auto_307643 ) ( ON ?auto_307641 ?auto_307642 ) ( ON ?auto_307640 ?auto_307641 ) ( ON ?auto_307639 ?auto_307640 ) ( ON ?auto_307638 ?auto_307639 ) ( ON ?auto_307637 ?auto_307638 ) ( ON ?auto_307636 ?auto_307637 ) ( ON ?auto_307635 ?auto_307636 ) ( ON ?auto_307634 ?auto_307635 ) ( ON ?auto_307633 ?auto_307634 ) ( CLEAR ?auto_307633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_307633 )
      ( MAKE-12PILE ?auto_307633 ?auto_307634 ?auto_307635 ?auto_307636 ?auto_307637 ?auto_307638 ?auto_307639 ?auto_307640 ?auto_307641 ?auto_307642 ?auto_307643 ?auto_307644 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_307658 - BLOCK
      ?auto_307659 - BLOCK
      ?auto_307660 - BLOCK
      ?auto_307661 - BLOCK
      ?auto_307662 - BLOCK
      ?auto_307663 - BLOCK
      ?auto_307664 - BLOCK
      ?auto_307665 - BLOCK
      ?auto_307666 - BLOCK
      ?auto_307667 - BLOCK
      ?auto_307668 - BLOCK
      ?auto_307669 - BLOCK
    )
    :vars
    (
      ?auto_307670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307669 ?auto_307670 ) ( not ( = ?auto_307658 ?auto_307659 ) ) ( not ( = ?auto_307658 ?auto_307660 ) ) ( not ( = ?auto_307658 ?auto_307661 ) ) ( not ( = ?auto_307658 ?auto_307662 ) ) ( not ( = ?auto_307658 ?auto_307663 ) ) ( not ( = ?auto_307658 ?auto_307664 ) ) ( not ( = ?auto_307658 ?auto_307665 ) ) ( not ( = ?auto_307658 ?auto_307666 ) ) ( not ( = ?auto_307658 ?auto_307667 ) ) ( not ( = ?auto_307658 ?auto_307668 ) ) ( not ( = ?auto_307658 ?auto_307669 ) ) ( not ( = ?auto_307658 ?auto_307670 ) ) ( not ( = ?auto_307659 ?auto_307660 ) ) ( not ( = ?auto_307659 ?auto_307661 ) ) ( not ( = ?auto_307659 ?auto_307662 ) ) ( not ( = ?auto_307659 ?auto_307663 ) ) ( not ( = ?auto_307659 ?auto_307664 ) ) ( not ( = ?auto_307659 ?auto_307665 ) ) ( not ( = ?auto_307659 ?auto_307666 ) ) ( not ( = ?auto_307659 ?auto_307667 ) ) ( not ( = ?auto_307659 ?auto_307668 ) ) ( not ( = ?auto_307659 ?auto_307669 ) ) ( not ( = ?auto_307659 ?auto_307670 ) ) ( not ( = ?auto_307660 ?auto_307661 ) ) ( not ( = ?auto_307660 ?auto_307662 ) ) ( not ( = ?auto_307660 ?auto_307663 ) ) ( not ( = ?auto_307660 ?auto_307664 ) ) ( not ( = ?auto_307660 ?auto_307665 ) ) ( not ( = ?auto_307660 ?auto_307666 ) ) ( not ( = ?auto_307660 ?auto_307667 ) ) ( not ( = ?auto_307660 ?auto_307668 ) ) ( not ( = ?auto_307660 ?auto_307669 ) ) ( not ( = ?auto_307660 ?auto_307670 ) ) ( not ( = ?auto_307661 ?auto_307662 ) ) ( not ( = ?auto_307661 ?auto_307663 ) ) ( not ( = ?auto_307661 ?auto_307664 ) ) ( not ( = ?auto_307661 ?auto_307665 ) ) ( not ( = ?auto_307661 ?auto_307666 ) ) ( not ( = ?auto_307661 ?auto_307667 ) ) ( not ( = ?auto_307661 ?auto_307668 ) ) ( not ( = ?auto_307661 ?auto_307669 ) ) ( not ( = ?auto_307661 ?auto_307670 ) ) ( not ( = ?auto_307662 ?auto_307663 ) ) ( not ( = ?auto_307662 ?auto_307664 ) ) ( not ( = ?auto_307662 ?auto_307665 ) ) ( not ( = ?auto_307662 ?auto_307666 ) ) ( not ( = ?auto_307662 ?auto_307667 ) ) ( not ( = ?auto_307662 ?auto_307668 ) ) ( not ( = ?auto_307662 ?auto_307669 ) ) ( not ( = ?auto_307662 ?auto_307670 ) ) ( not ( = ?auto_307663 ?auto_307664 ) ) ( not ( = ?auto_307663 ?auto_307665 ) ) ( not ( = ?auto_307663 ?auto_307666 ) ) ( not ( = ?auto_307663 ?auto_307667 ) ) ( not ( = ?auto_307663 ?auto_307668 ) ) ( not ( = ?auto_307663 ?auto_307669 ) ) ( not ( = ?auto_307663 ?auto_307670 ) ) ( not ( = ?auto_307664 ?auto_307665 ) ) ( not ( = ?auto_307664 ?auto_307666 ) ) ( not ( = ?auto_307664 ?auto_307667 ) ) ( not ( = ?auto_307664 ?auto_307668 ) ) ( not ( = ?auto_307664 ?auto_307669 ) ) ( not ( = ?auto_307664 ?auto_307670 ) ) ( not ( = ?auto_307665 ?auto_307666 ) ) ( not ( = ?auto_307665 ?auto_307667 ) ) ( not ( = ?auto_307665 ?auto_307668 ) ) ( not ( = ?auto_307665 ?auto_307669 ) ) ( not ( = ?auto_307665 ?auto_307670 ) ) ( not ( = ?auto_307666 ?auto_307667 ) ) ( not ( = ?auto_307666 ?auto_307668 ) ) ( not ( = ?auto_307666 ?auto_307669 ) ) ( not ( = ?auto_307666 ?auto_307670 ) ) ( not ( = ?auto_307667 ?auto_307668 ) ) ( not ( = ?auto_307667 ?auto_307669 ) ) ( not ( = ?auto_307667 ?auto_307670 ) ) ( not ( = ?auto_307668 ?auto_307669 ) ) ( not ( = ?auto_307668 ?auto_307670 ) ) ( not ( = ?auto_307669 ?auto_307670 ) ) ( ON ?auto_307668 ?auto_307669 ) ( ON ?auto_307667 ?auto_307668 ) ( ON ?auto_307666 ?auto_307667 ) ( ON ?auto_307665 ?auto_307666 ) ( ON ?auto_307664 ?auto_307665 ) ( ON ?auto_307663 ?auto_307664 ) ( ON ?auto_307662 ?auto_307663 ) ( ON ?auto_307661 ?auto_307662 ) ( ON ?auto_307660 ?auto_307661 ) ( ON ?auto_307659 ?auto_307660 ) ( ON ?auto_307658 ?auto_307659 ) ( CLEAR ?auto_307658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_307658 )
      ( MAKE-12PILE ?auto_307658 ?auto_307659 ?auto_307660 ?auto_307661 ?auto_307662 ?auto_307663 ?auto_307664 ?auto_307665 ?auto_307666 ?auto_307667 ?auto_307668 ?auto_307669 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307684 - BLOCK
      ?auto_307685 - BLOCK
      ?auto_307686 - BLOCK
      ?auto_307687 - BLOCK
      ?auto_307688 - BLOCK
      ?auto_307689 - BLOCK
      ?auto_307690 - BLOCK
      ?auto_307691 - BLOCK
      ?auto_307692 - BLOCK
      ?auto_307693 - BLOCK
      ?auto_307694 - BLOCK
      ?auto_307695 - BLOCK
      ?auto_307696 - BLOCK
    )
    :vars
    (
      ?auto_307697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_307695 ) ( ON ?auto_307696 ?auto_307697 ) ( CLEAR ?auto_307696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_307684 ) ( ON ?auto_307685 ?auto_307684 ) ( ON ?auto_307686 ?auto_307685 ) ( ON ?auto_307687 ?auto_307686 ) ( ON ?auto_307688 ?auto_307687 ) ( ON ?auto_307689 ?auto_307688 ) ( ON ?auto_307690 ?auto_307689 ) ( ON ?auto_307691 ?auto_307690 ) ( ON ?auto_307692 ?auto_307691 ) ( ON ?auto_307693 ?auto_307692 ) ( ON ?auto_307694 ?auto_307693 ) ( ON ?auto_307695 ?auto_307694 ) ( not ( = ?auto_307684 ?auto_307685 ) ) ( not ( = ?auto_307684 ?auto_307686 ) ) ( not ( = ?auto_307684 ?auto_307687 ) ) ( not ( = ?auto_307684 ?auto_307688 ) ) ( not ( = ?auto_307684 ?auto_307689 ) ) ( not ( = ?auto_307684 ?auto_307690 ) ) ( not ( = ?auto_307684 ?auto_307691 ) ) ( not ( = ?auto_307684 ?auto_307692 ) ) ( not ( = ?auto_307684 ?auto_307693 ) ) ( not ( = ?auto_307684 ?auto_307694 ) ) ( not ( = ?auto_307684 ?auto_307695 ) ) ( not ( = ?auto_307684 ?auto_307696 ) ) ( not ( = ?auto_307684 ?auto_307697 ) ) ( not ( = ?auto_307685 ?auto_307686 ) ) ( not ( = ?auto_307685 ?auto_307687 ) ) ( not ( = ?auto_307685 ?auto_307688 ) ) ( not ( = ?auto_307685 ?auto_307689 ) ) ( not ( = ?auto_307685 ?auto_307690 ) ) ( not ( = ?auto_307685 ?auto_307691 ) ) ( not ( = ?auto_307685 ?auto_307692 ) ) ( not ( = ?auto_307685 ?auto_307693 ) ) ( not ( = ?auto_307685 ?auto_307694 ) ) ( not ( = ?auto_307685 ?auto_307695 ) ) ( not ( = ?auto_307685 ?auto_307696 ) ) ( not ( = ?auto_307685 ?auto_307697 ) ) ( not ( = ?auto_307686 ?auto_307687 ) ) ( not ( = ?auto_307686 ?auto_307688 ) ) ( not ( = ?auto_307686 ?auto_307689 ) ) ( not ( = ?auto_307686 ?auto_307690 ) ) ( not ( = ?auto_307686 ?auto_307691 ) ) ( not ( = ?auto_307686 ?auto_307692 ) ) ( not ( = ?auto_307686 ?auto_307693 ) ) ( not ( = ?auto_307686 ?auto_307694 ) ) ( not ( = ?auto_307686 ?auto_307695 ) ) ( not ( = ?auto_307686 ?auto_307696 ) ) ( not ( = ?auto_307686 ?auto_307697 ) ) ( not ( = ?auto_307687 ?auto_307688 ) ) ( not ( = ?auto_307687 ?auto_307689 ) ) ( not ( = ?auto_307687 ?auto_307690 ) ) ( not ( = ?auto_307687 ?auto_307691 ) ) ( not ( = ?auto_307687 ?auto_307692 ) ) ( not ( = ?auto_307687 ?auto_307693 ) ) ( not ( = ?auto_307687 ?auto_307694 ) ) ( not ( = ?auto_307687 ?auto_307695 ) ) ( not ( = ?auto_307687 ?auto_307696 ) ) ( not ( = ?auto_307687 ?auto_307697 ) ) ( not ( = ?auto_307688 ?auto_307689 ) ) ( not ( = ?auto_307688 ?auto_307690 ) ) ( not ( = ?auto_307688 ?auto_307691 ) ) ( not ( = ?auto_307688 ?auto_307692 ) ) ( not ( = ?auto_307688 ?auto_307693 ) ) ( not ( = ?auto_307688 ?auto_307694 ) ) ( not ( = ?auto_307688 ?auto_307695 ) ) ( not ( = ?auto_307688 ?auto_307696 ) ) ( not ( = ?auto_307688 ?auto_307697 ) ) ( not ( = ?auto_307689 ?auto_307690 ) ) ( not ( = ?auto_307689 ?auto_307691 ) ) ( not ( = ?auto_307689 ?auto_307692 ) ) ( not ( = ?auto_307689 ?auto_307693 ) ) ( not ( = ?auto_307689 ?auto_307694 ) ) ( not ( = ?auto_307689 ?auto_307695 ) ) ( not ( = ?auto_307689 ?auto_307696 ) ) ( not ( = ?auto_307689 ?auto_307697 ) ) ( not ( = ?auto_307690 ?auto_307691 ) ) ( not ( = ?auto_307690 ?auto_307692 ) ) ( not ( = ?auto_307690 ?auto_307693 ) ) ( not ( = ?auto_307690 ?auto_307694 ) ) ( not ( = ?auto_307690 ?auto_307695 ) ) ( not ( = ?auto_307690 ?auto_307696 ) ) ( not ( = ?auto_307690 ?auto_307697 ) ) ( not ( = ?auto_307691 ?auto_307692 ) ) ( not ( = ?auto_307691 ?auto_307693 ) ) ( not ( = ?auto_307691 ?auto_307694 ) ) ( not ( = ?auto_307691 ?auto_307695 ) ) ( not ( = ?auto_307691 ?auto_307696 ) ) ( not ( = ?auto_307691 ?auto_307697 ) ) ( not ( = ?auto_307692 ?auto_307693 ) ) ( not ( = ?auto_307692 ?auto_307694 ) ) ( not ( = ?auto_307692 ?auto_307695 ) ) ( not ( = ?auto_307692 ?auto_307696 ) ) ( not ( = ?auto_307692 ?auto_307697 ) ) ( not ( = ?auto_307693 ?auto_307694 ) ) ( not ( = ?auto_307693 ?auto_307695 ) ) ( not ( = ?auto_307693 ?auto_307696 ) ) ( not ( = ?auto_307693 ?auto_307697 ) ) ( not ( = ?auto_307694 ?auto_307695 ) ) ( not ( = ?auto_307694 ?auto_307696 ) ) ( not ( = ?auto_307694 ?auto_307697 ) ) ( not ( = ?auto_307695 ?auto_307696 ) ) ( not ( = ?auto_307695 ?auto_307697 ) ) ( not ( = ?auto_307696 ?auto_307697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_307696 ?auto_307697 )
      ( !STACK ?auto_307696 ?auto_307695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307711 - BLOCK
      ?auto_307712 - BLOCK
      ?auto_307713 - BLOCK
      ?auto_307714 - BLOCK
      ?auto_307715 - BLOCK
      ?auto_307716 - BLOCK
      ?auto_307717 - BLOCK
      ?auto_307718 - BLOCK
      ?auto_307719 - BLOCK
      ?auto_307720 - BLOCK
      ?auto_307721 - BLOCK
      ?auto_307722 - BLOCK
      ?auto_307723 - BLOCK
    )
    :vars
    (
      ?auto_307724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_307722 ) ( ON ?auto_307723 ?auto_307724 ) ( CLEAR ?auto_307723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_307711 ) ( ON ?auto_307712 ?auto_307711 ) ( ON ?auto_307713 ?auto_307712 ) ( ON ?auto_307714 ?auto_307713 ) ( ON ?auto_307715 ?auto_307714 ) ( ON ?auto_307716 ?auto_307715 ) ( ON ?auto_307717 ?auto_307716 ) ( ON ?auto_307718 ?auto_307717 ) ( ON ?auto_307719 ?auto_307718 ) ( ON ?auto_307720 ?auto_307719 ) ( ON ?auto_307721 ?auto_307720 ) ( ON ?auto_307722 ?auto_307721 ) ( not ( = ?auto_307711 ?auto_307712 ) ) ( not ( = ?auto_307711 ?auto_307713 ) ) ( not ( = ?auto_307711 ?auto_307714 ) ) ( not ( = ?auto_307711 ?auto_307715 ) ) ( not ( = ?auto_307711 ?auto_307716 ) ) ( not ( = ?auto_307711 ?auto_307717 ) ) ( not ( = ?auto_307711 ?auto_307718 ) ) ( not ( = ?auto_307711 ?auto_307719 ) ) ( not ( = ?auto_307711 ?auto_307720 ) ) ( not ( = ?auto_307711 ?auto_307721 ) ) ( not ( = ?auto_307711 ?auto_307722 ) ) ( not ( = ?auto_307711 ?auto_307723 ) ) ( not ( = ?auto_307711 ?auto_307724 ) ) ( not ( = ?auto_307712 ?auto_307713 ) ) ( not ( = ?auto_307712 ?auto_307714 ) ) ( not ( = ?auto_307712 ?auto_307715 ) ) ( not ( = ?auto_307712 ?auto_307716 ) ) ( not ( = ?auto_307712 ?auto_307717 ) ) ( not ( = ?auto_307712 ?auto_307718 ) ) ( not ( = ?auto_307712 ?auto_307719 ) ) ( not ( = ?auto_307712 ?auto_307720 ) ) ( not ( = ?auto_307712 ?auto_307721 ) ) ( not ( = ?auto_307712 ?auto_307722 ) ) ( not ( = ?auto_307712 ?auto_307723 ) ) ( not ( = ?auto_307712 ?auto_307724 ) ) ( not ( = ?auto_307713 ?auto_307714 ) ) ( not ( = ?auto_307713 ?auto_307715 ) ) ( not ( = ?auto_307713 ?auto_307716 ) ) ( not ( = ?auto_307713 ?auto_307717 ) ) ( not ( = ?auto_307713 ?auto_307718 ) ) ( not ( = ?auto_307713 ?auto_307719 ) ) ( not ( = ?auto_307713 ?auto_307720 ) ) ( not ( = ?auto_307713 ?auto_307721 ) ) ( not ( = ?auto_307713 ?auto_307722 ) ) ( not ( = ?auto_307713 ?auto_307723 ) ) ( not ( = ?auto_307713 ?auto_307724 ) ) ( not ( = ?auto_307714 ?auto_307715 ) ) ( not ( = ?auto_307714 ?auto_307716 ) ) ( not ( = ?auto_307714 ?auto_307717 ) ) ( not ( = ?auto_307714 ?auto_307718 ) ) ( not ( = ?auto_307714 ?auto_307719 ) ) ( not ( = ?auto_307714 ?auto_307720 ) ) ( not ( = ?auto_307714 ?auto_307721 ) ) ( not ( = ?auto_307714 ?auto_307722 ) ) ( not ( = ?auto_307714 ?auto_307723 ) ) ( not ( = ?auto_307714 ?auto_307724 ) ) ( not ( = ?auto_307715 ?auto_307716 ) ) ( not ( = ?auto_307715 ?auto_307717 ) ) ( not ( = ?auto_307715 ?auto_307718 ) ) ( not ( = ?auto_307715 ?auto_307719 ) ) ( not ( = ?auto_307715 ?auto_307720 ) ) ( not ( = ?auto_307715 ?auto_307721 ) ) ( not ( = ?auto_307715 ?auto_307722 ) ) ( not ( = ?auto_307715 ?auto_307723 ) ) ( not ( = ?auto_307715 ?auto_307724 ) ) ( not ( = ?auto_307716 ?auto_307717 ) ) ( not ( = ?auto_307716 ?auto_307718 ) ) ( not ( = ?auto_307716 ?auto_307719 ) ) ( not ( = ?auto_307716 ?auto_307720 ) ) ( not ( = ?auto_307716 ?auto_307721 ) ) ( not ( = ?auto_307716 ?auto_307722 ) ) ( not ( = ?auto_307716 ?auto_307723 ) ) ( not ( = ?auto_307716 ?auto_307724 ) ) ( not ( = ?auto_307717 ?auto_307718 ) ) ( not ( = ?auto_307717 ?auto_307719 ) ) ( not ( = ?auto_307717 ?auto_307720 ) ) ( not ( = ?auto_307717 ?auto_307721 ) ) ( not ( = ?auto_307717 ?auto_307722 ) ) ( not ( = ?auto_307717 ?auto_307723 ) ) ( not ( = ?auto_307717 ?auto_307724 ) ) ( not ( = ?auto_307718 ?auto_307719 ) ) ( not ( = ?auto_307718 ?auto_307720 ) ) ( not ( = ?auto_307718 ?auto_307721 ) ) ( not ( = ?auto_307718 ?auto_307722 ) ) ( not ( = ?auto_307718 ?auto_307723 ) ) ( not ( = ?auto_307718 ?auto_307724 ) ) ( not ( = ?auto_307719 ?auto_307720 ) ) ( not ( = ?auto_307719 ?auto_307721 ) ) ( not ( = ?auto_307719 ?auto_307722 ) ) ( not ( = ?auto_307719 ?auto_307723 ) ) ( not ( = ?auto_307719 ?auto_307724 ) ) ( not ( = ?auto_307720 ?auto_307721 ) ) ( not ( = ?auto_307720 ?auto_307722 ) ) ( not ( = ?auto_307720 ?auto_307723 ) ) ( not ( = ?auto_307720 ?auto_307724 ) ) ( not ( = ?auto_307721 ?auto_307722 ) ) ( not ( = ?auto_307721 ?auto_307723 ) ) ( not ( = ?auto_307721 ?auto_307724 ) ) ( not ( = ?auto_307722 ?auto_307723 ) ) ( not ( = ?auto_307722 ?auto_307724 ) ) ( not ( = ?auto_307723 ?auto_307724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_307723 ?auto_307724 )
      ( !STACK ?auto_307723 ?auto_307722 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307738 - BLOCK
      ?auto_307739 - BLOCK
      ?auto_307740 - BLOCK
      ?auto_307741 - BLOCK
      ?auto_307742 - BLOCK
      ?auto_307743 - BLOCK
      ?auto_307744 - BLOCK
      ?auto_307745 - BLOCK
      ?auto_307746 - BLOCK
      ?auto_307747 - BLOCK
      ?auto_307748 - BLOCK
      ?auto_307749 - BLOCK
      ?auto_307750 - BLOCK
    )
    :vars
    (
      ?auto_307751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307750 ?auto_307751 ) ( ON-TABLE ?auto_307738 ) ( ON ?auto_307739 ?auto_307738 ) ( ON ?auto_307740 ?auto_307739 ) ( ON ?auto_307741 ?auto_307740 ) ( ON ?auto_307742 ?auto_307741 ) ( ON ?auto_307743 ?auto_307742 ) ( ON ?auto_307744 ?auto_307743 ) ( ON ?auto_307745 ?auto_307744 ) ( ON ?auto_307746 ?auto_307745 ) ( ON ?auto_307747 ?auto_307746 ) ( ON ?auto_307748 ?auto_307747 ) ( not ( = ?auto_307738 ?auto_307739 ) ) ( not ( = ?auto_307738 ?auto_307740 ) ) ( not ( = ?auto_307738 ?auto_307741 ) ) ( not ( = ?auto_307738 ?auto_307742 ) ) ( not ( = ?auto_307738 ?auto_307743 ) ) ( not ( = ?auto_307738 ?auto_307744 ) ) ( not ( = ?auto_307738 ?auto_307745 ) ) ( not ( = ?auto_307738 ?auto_307746 ) ) ( not ( = ?auto_307738 ?auto_307747 ) ) ( not ( = ?auto_307738 ?auto_307748 ) ) ( not ( = ?auto_307738 ?auto_307749 ) ) ( not ( = ?auto_307738 ?auto_307750 ) ) ( not ( = ?auto_307738 ?auto_307751 ) ) ( not ( = ?auto_307739 ?auto_307740 ) ) ( not ( = ?auto_307739 ?auto_307741 ) ) ( not ( = ?auto_307739 ?auto_307742 ) ) ( not ( = ?auto_307739 ?auto_307743 ) ) ( not ( = ?auto_307739 ?auto_307744 ) ) ( not ( = ?auto_307739 ?auto_307745 ) ) ( not ( = ?auto_307739 ?auto_307746 ) ) ( not ( = ?auto_307739 ?auto_307747 ) ) ( not ( = ?auto_307739 ?auto_307748 ) ) ( not ( = ?auto_307739 ?auto_307749 ) ) ( not ( = ?auto_307739 ?auto_307750 ) ) ( not ( = ?auto_307739 ?auto_307751 ) ) ( not ( = ?auto_307740 ?auto_307741 ) ) ( not ( = ?auto_307740 ?auto_307742 ) ) ( not ( = ?auto_307740 ?auto_307743 ) ) ( not ( = ?auto_307740 ?auto_307744 ) ) ( not ( = ?auto_307740 ?auto_307745 ) ) ( not ( = ?auto_307740 ?auto_307746 ) ) ( not ( = ?auto_307740 ?auto_307747 ) ) ( not ( = ?auto_307740 ?auto_307748 ) ) ( not ( = ?auto_307740 ?auto_307749 ) ) ( not ( = ?auto_307740 ?auto_307750 ) ) ( not ( = ?auto_307740 ?auto_307751 ) ) ( not ( = ?auto_307741 ?auto_307742 ) ) ( not ( = ?auto_307741 ?auto_307743 ) ) ( not ( = ?auto_307741 ?auto_307744 ) ) ( not ( = ?auto_307741 ?auto_307745 ) ) ( not ( = ?auto_307741 ?auto_307746 ) ) ( not ( = ?auto_307741 ?auto_307747 ) ) ( not ( = ?auto_307741 ?auto_307748 ) ) ( not ( = ?auto_307741 ?auto_307749 ) ) ( not ( = ?auto_307741 ?auto_307750 ) ) ( not ( = ?auto_307741 ?auto_307751 ) ) ( not ( = ?auto_307742 ?auto_307743 ) ) ( not ( = ?auto_307742 ?auto_307744 ) ) ( not ( = ?auto_307742 ?auto_307745 ) ) ( not ( = ?auto_307742 ?auto_307746 ) ) ( not ( = ?auto_307742 ?auto_307747 ) ) ( not ( = ?auto_307742 ?auto_307748 ) ) ( not ( = ?auto_307742 ?auto_307749 ) ) ( not ( = ?auto_307742 ?auto_307750 ) ) ( not ( = ?auto_307742 ?auto_307751 ) ) ( not ( = ?auto_307743 ?auto_307744 ) ) ( not ( = ?auto_307743 ?auto_307745 ) ) ( not ( = ?auto_307743 ?auto_307746 ) ) ( not ( = ?auto_307743 ?auto_307747 ) ) ( not ( = ?auto_307743 ?auto_307748 ) ) ( not ( = ?auto_307743 ?auto_307749 ) ) ( not ( = ?auto_307743 ?auto_307750 ) ) ( not ( = ?auto_307743 ?auto_307751 ) ) ( not ( = ?auto_307744 ?auto_307745 ) ) ( not ( = ?auto_307744 ?auto_307746 ) ) ( not ( = ?auto_307744 ?auto_307747 ) ) ( not ( = ?auto_307744 ?auto_307748 ) ) ( not ( = ?auto_307744 ?auto_307749 ) ) ( not ( = ?auto_307744 ?auto_307750 ) ) ( not ( = ?auto_307744 ?auto_307751 ) ) ( not ( = ?auto_307745 ?auto_307746 ) ) ( not ( = ?auto_307745 ?auto_307747 ) ) ( not ( = ?auto_307745 ?auto_307748 ) ) ( not ( = ?auto_307745 ?auto_307749 ) ) ( not ( = ?auto_307745 ?auto_307750 ) ) ( not ( = ?auto_307745 ?auto_307751 ) ) ( not ( = ?auto_307746 ?auto_307747 ) ) ( not ( = ?auto_307746 ?auto_307748 ) ) ( not ( = ?auto_307746 ?auto_307749 ) ) ( not ( = ?auto_307746 ?auto_307750 ) ) ( not ( = ?auto_307746 ?auto_307751 ) ) ( not ( = ?auto_307747 ?auto_307748 ) ) ( not ( = ?auto_307747 ?auto_307749 ) ) ( not ( = ?auto_307747 ?auto_307750 ) ) ( not ( = ?auto_307747 ?auto_307751 ) ) ( not ( = ?auto_307748 ?auto_307749 ) ) ( not ( = ?auto_307748 ?auto_307750 ) ) ( not ( = ?auto_307748 ?auto_307751 ) ) ( not ( = ?auto_307749 ?auto_307750 ) ) ( not ( = ?auto_307749 ?auto_307751 ) ) ( not ( = ?auto_307750 ?auto_307751 ) ) ( CLEAR ?auto_307748 ) ( ON ?auto_307749 ?auto_307750 ) ( CLEAR ?auto_307749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_307738 ?auto_307739 ?auto_307740 ?auto_307741 ?auto_307742 ?auto_307743 ?auto_307744 ?auto_307745 ?auto_307746 ?auto_307747 ?auto_307748 ?auto_307749 )
      ( MAKE-13PILE ?auto_307738 ?auto_307739 ?auto_307740 ?auto_307741 ?auto_307742 ?auto_307743 ?auto_307744 ?auto_307745 ?auto_307746 ?auto_307747 ?auto_307748 ?auto_307749 ?auto_307750 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307765 - BLOCK
      ?auto_307766 - BLOCK
      ?auto_307767 - BLOCK
      ?auto_307768 - BLOCK
      ?auto_307769 - BLOCK
      ?auto_307770 - BLOCK
      ?auto_307771 - BLOCK
      ?auto_307772 - BLOCK
      ?auto_307773 - BLOCK
      ?auto_307774 - BLOCK
      ?auto_307775 - BLOCK
      ?auto_307776 - BLOCK
      ?auto_307777 - BLOCK
    )
    :vars
    (
      ?auto_307778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307777 ?auto_307778 ) ( ON-TABLE ?auto_307765 ) ( ON ?auto_307766 ?auto_307765 ) ( ON ?auto_307767 ?auto_307766 ) ( ON ?auto_307768 ?auto_307767 ) ( ON ?auto_307769 ?auto_307768 ) ( ON ?auto_307770 ?auto_307769 ) ( ON ?auto_307771 ?auto_307770 ) ( ON ?auto_307772 ?auto_307771 ) ( ON ?auto_307773 ?auto_307772 ) ( ON ?auto_307774 ?auto_307773 ) ( ON ?auto_307775 ?auto_307774 ) ( not ( = ?auto_307765 ?auto_307766 ) ) ( not ( = ?auto_307765 ?auto_307767 ) ) ( not ( = ?auto_307765 ?auto_307768 ) ) ( not ( = ?auto_307765 ?auto_307769 ) ) ( not ( = ?auto_307765 ?auto_307770 ) ) ( not ( = ?auto_307765 ?auto_307771 ) ) ( not ( = ?auto_307765 ?auto_307772 ) ) ( not ( = ?auto_307765 ?auto_307773 ) ) ( not ( = ?auto_307765 ?auto_307774 ) ) ( not ( = ?auto_307765 ?auto_307775 ) ) ( not ( = ?auto_307765 ?auto_307776 ) ) ( not ( = ?auto_307765 ?auto_307777 ) ) ( not ( = ?auto_307765 ?auto_307778 ) ) ( not ( = ?auto_307766 ?auto_307767 ) ) ( not ( = ?auto_307766 ?auto_307768 ) ) ( not ( = ?auto_307766 ?auto_307769 ) ) ( not ( = ?auto_307766 ?auto_307770 ) ) ( not ( = ?auto_307766 ?auto_307771 ) ) ( not ( = ?auto_307766 ?auto_307772 ) ) ( not ( = ?auto_307766 ?auto_307773 ) ) ( not ( = ?auto_307766 ?auto_307774 ) ) ( not ( = ?auto_307766 ?auto_307775 ) ) ( not ( = ?auto_307766 ?auto_307776 ) ) ( not ( = ?auto_307766 ?auto_307777 ) ) ( not ( = ?auto_307766 ?auto_307778 ) ) ( not ( = ?auto_307767 ?auto_307768 ) ) ( not ( = ?auto_307767 ?auto_307769 ) ) ( not ( = ?auto_307767 ?auto_307770 ) ) ( not ( = ?auto_307767 ?auto_307771 ) ) ( not ( = ?auto_307767 ?auto_307772 ) ) ( not ( = ?auto_307767 ?auto_307773 ) ) ( not ( = ?auto_307767 ?auto_307774 ) ) ( not ( = ?auto_307767 ?auto_307775 ) ) ( not ( = ?auto_307767 ?auto_307776 ) ) ( not ( = ?auto_307767 ?auto_307777 ) ) ( not ( = ?auto_307767 ?auto_307778 ) ) ( not ( = ?auto_307768 ?auto_307769 ) ) ( not ( = ?auto_307768 ?auto_307770 ) ) ( not ( = ?auto_307768 ?auto_307771 ) ) ( not ( = ?auto_307768 ?auto_307772 ) ) ( not ( = ?auto_307768 ?auto_307773 ) ) ( not ( = ?auto_307768 ?auto_307774 ) ) ( not ( = ?auto_307768 ?auto_307775 ) ) ( not ( = ?auto_307768 ?auto_307776 ) ) ( not ( = ?auto_307768 ?auto_307777 ) ) ( not ( = ?auto_307768 ?auto_307778 ) ) ( not ( = ?auto_307769 ?auto_307770 ) ) ( not ( = ?auto_307769 ?auto_307771 ) ) ( not ( = ?auto_307769 ?auto_307772 ) ) ( not ( = ?auto_307769 ?auto_307773 ) ) ( not ( = ?auto_307769 ?auto_307774 ) ) ( not ( = ?auto_307769 ?auto_307775 ) ) ( not ( = ?auto_307769 ?auto_307776 ) ) ( not ( = ?auto_307769 ?auto_307777 ) ) ( not ( = ?auto_307769 ?auto_307778 ) ) ( not ( = ?auto_307770 ?auto_307771 ) ) ( not ( = ?auto_307770 ?auto_307772 ) ) ( not ( = ?auto_307770 ?auto_307773 ) ) ( not ( = ?auto_307770 ?auto_307774 ) ) ( not ( = ?auto_307770 ?auto_307775 ) ) ( not ( = ?auto_307770 ?auto_307776 ) ) ( not ( = ?auto_307770 ?auto_307777 ) ) ( not ( = ?auto_307770 ?auto_307778 ) ) ( not ( = ?auto_307771 ?auto_307772 ) ) ( not ( = ?auto_307771 ?auto_307773 ) ) ( not ( = ?auto_307771 ?auto_307774 ) ) ( not ( = ?auto_307771 ?auto_307775 ) ) ( not ( = ?auto_307771 ?auto_307776 ) ) ( not ( = ?auto_307771 ?auto_307777 ) ) ( not ( = ?auto_307771 ?auto_307778 ) ) ( not ( = ?auto_307772 ?auto_307773 ) ) ( not ( = ?auto_307772 ?auto_307774 ) ) ( not ( = ?auto_307772 ?auto_307775 ) ) ( not ( = ?auto_307772 ?auto_307776 ) ) ( not ( = ?auto_307772 ?auto_307777 ) ) ( not ( = ?auto_307772 ?auto_307778 ) ) ( not ( = ?auto_307773 ?auto_307774 ) ) ( not ( = ?auto_307773 ?auto_307775 ) ) ( not ( = ?auto_307773 ?auto_307776 ) ) ( not ( = ?auto_307773 ?auto_307777 ) ) ( not ( = ?auto_307773 ?auto_307778 ) ) ( not ( = ?auto_307774 ?auto_307775 ) ) ( not ( = ?auto_307774 ?auto_307776 ) ) ( not ( = ?auto_307774 ?auto_307777 ) ) ( not ( = ?auto_307774 ?auto_307778 ) ) ( not ( = ?auto_307775 ?auto_307776 ) ) ( not ( = ?auto_307775 ?auto_307777 ) ) ( not ( = ?auto_307775 ?auto_307778 ) ) ( not ( = ?auto_307776 ?auto_307777 ) ) ( not ( = ?auto_307776 ?auto_307778 ) ) ( not ( = ?auto_307777 ?auto_307778 ) ) ( CLEAR ?auto_307775 ) ( ON ?auto_307776 ?auto_307777 ) ( CLEAR ?auto_307776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_307765 ?auto_307766 ?auto_307767 ?auto_307768 ?auto_307769 ?auto_307770 ?auto_307771 ?auto_307772 ?auto_307773 ?auto_307774 ?auto_307775 ?auto_307776 )
      ( MAKE-13PILE ?auto_307765 ?auto_307766 ?auto_307767 ?auto_307768 ?auto_307769 ?auto_307770 ?auto_307771 ?auto_307772 ?auto_307773 ?auto_307774 ?auto_307775 ?auto_307776 ?auto_307777 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307792 - BLOCK
      ?auto_307793 - BLOCK
      ?auto_307794 - BLOCK
      ?auto_307795 - BLOCK
      ?auto_307796 - BLOCK
      ?auto_307797 - BLOCK
      ?auto_307798 - BLOCK
      ?auto_307799 - BLOCK
      ?auto_307800 - BLOCK
      ?auto_307801 - BLOCK
      ?auto_307802 - BLOCK
      ?auto_307803 - BLOCK
      ?auto_307804 - BLOCK
    )
    :vars
    (
      ?auto_307805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307804 ?auto_307805 ) ( ON-TABLE ?auto_307792 ) ( ON ?auto_307793 ?auto_307792 ) ( ON ?auto_307794 ?auto_307793 ) ( ON ?auto_307795 ?auto_307794 ) ( ON ?auto_307796 ?auto_307795 ) ( ON ?auto_307797 ?auto_307796 ) ( ON ?auto_307798 ?auto_307797 ) ( ON ?auto_307799 ?auto_307798 ) ( ON ?auto_307800 ?auto_307799 ) ( ON ?auto_307801 ?auto_307800 ) ( not ( = ?auto_307792 ?auto_307793 ) ) ( not ( = ?auto_307792 ?auto_307794 ) ) ( not ( = ?auto_307792 ?auto_307795 ) ) ( not ( = ?auto_307792 ?auto_307796 ) ) ( not ( = ?auto_307792 ?auto_307797 ) ) ( not ( = ?auto_307792 ?auto_307798 ) ) ( not ( = ?auto_307792 ?auto_307799 ) ) ( not ( = ?auto_307792 ?auto_307800 ) ) ( not ( = ?auto_307792 ?auto_307801 ) ) ( not ( = ?auto_307792 ?auto_307802 ) ) ( not ( = ?auto_307792 ?auto_307803 ) ) ( not ( = ?auto_307792 ?auto_307804 ) ) ( not ( = ?auto_307792 ?auto_307805 ) ) ( not ( = ?auto_307793 ?auto_307794 ) ) ( not ( = ?auto_307793 ?auto_307795 ) ) ( not ( = ?auto_307793 ?auto_307796 ) ) ( not ( = ?auto_307793 ?auto_307797 ) ) ( not ( = ?auto_307793 ?auto_307798 ) ) ( not ( = ?auto_307793 ?auto_307799 ) ) ( not ( = ?auto_307793 ?auto_307800 ) ) ( not ( = ?auto_307793 ?auto_307801 ) ) ( not ( = ?auto_307793 ?auto_307802 ) ) ( not ( = ?auto_307793 ?auto_307803 ) ) ( not ( = ?auto_307793 ?auto_307804 ) ) ( not ( = ?auto_307793 ?auto_307805 ) ) ( not ( = ?auto_307794 ?auto_307795 ) ) ( not ( = ?auto_307794 ?auto_307796 ) ) ( not ( = ?auto_307794 ?auto_307797 ) ) ( not ( = ?auto_307794 ?auto_307798 ) ) ( not ( = ?auto_307794 ?auto_307799 ) ) ( not ( = ?auto_307794 ?auto_307800 ) ) ( not ( = ?auto_307794 ?auto_307801 ) ) ( not ( = ?auto_307794 ?auto_307802 ) ) ( not ( = ?auto_307794 ?auto_307803 ) ) ( not ( = ?auto_307794 ?auto_307804 ) ) ( not ( = ?auto_307794 ?auto_307805 ) ) ( not ( = ?auto_307795 ?auto_307796 ) ) ( not ( = ?auto_307795 ?auto_307797 ) ) ( not ( = ?auto_307795 ?auto_307798 ) ) ( not ( = ?auto_307795 ?auto_307799 ) ) ( not ( = ?auto_307795 ?auto_307800 ) ) ( not ( = ?auto_307795 ?auto_307801 ) ) ( not ( = ?auto_307795 ?auto_307802 ) ) ( not ( = ?auto_307795 ?auto_307803 ) ) ( not ( = ?auto_307795 ?auto_307804 ) ) ( not ( = ?auto_307795 ?auto_307805 ) ) ( not ( = ?auto_307796 ?auto_307797 ) ) ( not ( = ?auto_307796 ?auto_307798 ) ) ( not ( = ?auto_307796 ?auto_307799 ) ) ( not ( = ?auto_307796 ?auto_307800 ) ) ( not ( = ?auto_307796 ?auto_307801 ) ) ( not ( = ?auto_307796 ?auto_307802 ) ) ( not ( = ?auto_307796 ?auto_307803 ) ) ( not ( = ?auto_307796 ?auto_307804 ) ) ( not ( = ?auto_307796 ?auto_307805 ) ) ( not ( = ?auto_307797 ?auto_307798 ) ) ( not ( = ?auto_307797 ?auto_307799 ) ) ( not ( = ?auto_307797 ?auto_307800 ) ) ( not ( = ?auto_307797 ?auto_307801 ) ) ( not ( = ?auto_307797 ?auto_307802 ) ) ( not ( = ?auto_307797 ?auto_307803 ) ) ( not ( = ?auto_307797 ?auto_307804 ) ) ( not ( = ?auto_307797 ?auto_307805 ) ) ( not ( = ?auto_307798 ?auto_307799 ) ) ( not ( = ?auto_307798 ?auto_307800 ) ) ( not ( = ?auto_307798 ?auto_307801 ) ) ( not ( = ?auto_307798 ?auto_307802 ) ) ( not ( = ?auto_307798 ?auto_307803 ) ) ( not ( = ?auto_307798 ?auto_307804 ) ) ( not ( = ?auto_307798 ?auto_307805 ) ) ( not ( = ?auto_307799 ?auto_307800 ) ) ( not ( = ?auto_307799 ?auto_307801 ) ) ( not ( = ?auto_307799 ?auto_307802 ) ) ( not ( = ?auto_307799 ?auto_307803 ) ) ( not ( = ?auto_307799 ?auto_307804 ) ) ( not ( = ?auto_307799 ?auto_307805 ) ) ( not ( = ?auto_307800 ?auto_307801 ) ) ( not ( = ?auto_307800 ?auto_307802 ) ) ( not ( = ?auto_307800 ?auto_307803 ) ) ( not ( = ?auto_307800 ?auto_307804 ) ) ( not ( = ?auto_307800 ?auto_307805 ) ) ( not ( = ?auto_307801 ?auto_307802 ) ) ( not ( = ?auto_307801 ?auto_307803 ) ) ( not ( = ?auto_307801 ?auto_307804 ) ) ( not ( = ?auto_307801 ?auto_307805 ) ) ( not ( = ?auto_307802 ?auto_307803 ) ) ( not ( = ?auto_307802 ?auto_307804 ) ) ( not ( = ?auto_307802 ?auto_307805 ) ) ( not ( = ?auto_307803 ?auto_307804 ) ) ( not ( = ?auto_307803 ?auto_307805 ) ) ( not ( = ?auto_307804 ?auto_307805 ) ) ( ON ?auto_307803 ?auto_307804 ) ( CLEAR ?auto_307801 ) ( ON ?auto_307802 ?auto_307803 ) ( CLEAR ?auto_307802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_307792 ?auto_307793 ?auto_307794 ?auto_307795 ?auto_307796 ?auto_307797 ?auto_307798 ?auto_307799 ?auto_307800 ?auto_307801 ?auto_307802 )
      ( MAKE-13PILE ?auto_307792 ?auto_307793 ?auto_307794 ?auto_307795 ?auto_307796 ?auto_307797 ?auto_307798 ?auto_307799 ?auto_307800 ?auto_307801 ?auto_307802 ?auto_307803 ?auto_307804 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307819 - BLOCK
      ?auto_307820 - BLOCK
      ?auto_307821 - BLOCK
      ?auto_307822 - BLOCK
      ?auto_307823 - BLOCK
      ?auto_307824 - BLOCK
      ?auto_307825 - BLOCK
      ?auto_307826 - BLOCK
      ?auto_307827 - BLOCK
      ?auto_307828 - BLOCK
      ?auto_307829 - BLOCK
      ?auto_307830 - BLOCK
      ?auto_307831 - BLOCK
    )
    :vars
    (
      ?auto_307832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307831 ?auto_307832 ) ( ON-TABLE ?auto_307819 ) ( ON ?auto_307820 ?auto_307819 ) ( ON ?auto_307821 ?auto_307820 ) ( ON ?auto_307822 ?auto_307821 ) ( ON ?auto_307823 ?auto_307822 ) ( ON ?auto_307824 ?auto_307823 ) ( ON ?auto_307825 ?auto_307824 ) ( ON ?auto_307826 ?auto_307825 ) ( ON ?auto_307827 ?auto_307826 ) ( ON ?auto_307828 ?auto_307827 ) ( not ( = ?auto_307819 ?auto_307820 ) ) ( not ( = ?auto_307819 ?auto_307821 ) ) ( not ( = ?auto_307819 ?auto_307822 ) ) ( not ( = ?auto_307819 ?auto_307823 ) ) ( not ( = ?auto_307819 ?auto_307824 ) ) ( not ( = ?auto_307819 ?auto_307825 ) ) ( not ( = ?auto_307819 ?auto_307826 ) ) ( not ( = ?auto_307819 ?auto_307827 ) ) ( not ( = ?auto_307819 ?auto_307828 ) ) ( not ( = ?auto_307819 ?auto_307829 ) ) ( not ( = ?auto_307819 ?auto_307830 ) ) ( not ( = ?auto_307819 ?auto_307831 ) ) ( not ( = ?auto_307819 ?auto_307832 ) ) ( not ( = ?auto_307820 ?auto_307821 ) ) ( not ( = ?auto_307820 ?auto_307822 ) ) ( not ( = ?auto_307820 ?auto_307823 ) ) ( not ( = ?auto_307820 ?auto_307824 ) ) ( not ( = ?auto_307820 ?auto_307825 ) ) ( not ( = ?auto_307820 ?auto_307826 ) ) ( not ( = ?auto_307820 ?auto_307827 ) ) ( not ( = ?auto_307820 ?auto_307828 ) ) ( not ( = ?auto_307820 ?auto_307829 ) ) ( not ( = ?auto_307820 ?auto_307830 ) ) ( not ( = ?auto_307820 ?auto_307831 ) ) ( not ( = ?auto_307820 ?auto_307832 ) ) ( not ( = ?auto_307821 ?auto_307822 ) ) ( not ( = ?auto_307821 ?auto_307823 ) ) ( not ( = ?auto_307821 ?auto_307824 ) ) ( not ( = ?auto_307821 ?auto_307825 ) ) ( not ( = ?auto_307821 ?auto_307826 ) ) ( not ( = ?auto_307821 ?auto_307827 ) ) ( not ( = ?auto_307821 ?auto_307828 ) ) ( not ( = ?auto_307821 ?auto_307829 ) ) ( not ( = ?auto_307821 ?auto_307830 ) ) ( not ( = ?auto_307821 ?auto_307831 ) ) ( not ( = ?auto_307821 ?auto_307832 ) ) ( not ( = ?auto_307822 ?auto_307823 ) ) ( not ( = ?auto_307822 ?auto_307824 ) ) ( not ( = ?auto_307822 ?auto_307825 ) ) ( not ( = ?auto_307822 ?auto_307826 ) ) ( not ( = ?auto_307822 ?auto_307827 ) ) ( not ( = ?auto_307822 ?auto_307828 ) ) ( not ( = ?auto_307822 ?auto_307829 ) ) ( not ( = ?auto_307822 ?auto_307830 ) ) ( not ( = ?auto_307822 ?auto_307831 ) ) ( not ( = ?auto_307822 ?auto_307832 ) ) ( not ( = ?auto_307823 ?auto_307824 ) ) ( not ( = ?auto_307823 ?auto_307825 ) ) ( not ( = ?auto_307823 ?auto_307826 ) ) ( not ( = ?auto_307823 ?auto_307827 ) ) ( not ( = ?auto_307823 ?auto_307828 ) ) ( not ( = ?auto_307823 ?auto_307829 ) ) ( not ( = ?auto_307823 ?auto_307830 ) ) ( not ( = ?auto_307823 ?auto_307831 ) ) ( not ( = ?auto_307823 ?auto_307832 ) ) ( not ( = ?auto_307824 ?auto_307825 ) ) ( not ( = ?auto_307824 ?auto_307826 ) ) ( not ( = ?auto_307824 ?auto_307827 ) ) ( not ( = ?auto_307824 ?auto_307828 ) ) ( not ( = ?auto_307824 ?auto_307829 ) ) ( not ( = ?auto_307824 ?auto_307830 ) ) ( not ( = ?auto_307824 ?auto_307831 ) ) ( not ( = ?auto_307824 ?auto_307832 ) ) ( not ( = ?auto_307825 ?auto_307826 ) ) ( not ( = ?auto_307825 ?auto_307827 ) ) ( not ( = ?auto_307825 ?auto_307828 ) ) ( not ( = ?auto_307825 ?auto_307829 ) ) ( not ( = ?auto_307825 ?auto_307830 ) ) ( not ( = ?auto_307825 ?auto_307831 ) ) ( not ( = ?auto_307825 ?auto_307832 ) ) ( not ( = ?auto_307826 ?auto_307827 ) ) ( not ( = ?auto_307826 ?auto_307828 ) ) ( not ( = ?auto_307826 ?auto_307829 ) ) ( not ( = ?auto_307826 ?auto_307830 ) ) ( not ( = ?auto_307826 ?auto_307831 ) ) ( not ( = ?auto_307826 ?auto_307832 ) ) ( not ( = ?auto_307827 ?auto_307828 ) ) ( not ( = ?auto_307827 ?auto_307829 ) ) ( not ( = ?auto_307827 ?auto_307830 ) ) ( not ( = ?auto_307827 ?auto_307831 ) ) ( not ( = ?auto_307827 ?auto_307832 ) ) ( not ( = ?auto_307828 ?auto_307829 ) ) ( not ( = ?auto_307828 ?auto_307830 ) ) ( not ( = ?auto_307828 ?auto_307831 ) ) ( not ( = ?auto_307828 ?auto_307832 ) ) ( not ( = ?auto_307829 ?auto_307830 ) ) ( not ( = ?auto_307829 ?auto_307831 ) ) ( not ( = ?auto_307829 ?auto_307832 ) ) ( not ( = ?auto_307830 ?auto_307831 ) ) ( not ( = ?auto_307830 ?auto_307832 ) ) ( not ( = ?auto_307831 ?auto_307832 ) ) ( ON ?auto_307830 ?auto_307831 ) ( CLEAR ?auto_307828 ) ( ON ?auto_307829 ?auto_307830 ) ( CLEAR ?auto_307829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_307819 ?auto_307820 ?auto_307821 ?auto_307822 ?auto_307823 ?auto_307824 ?auto_307825 ?auto_307826 ?auto_307827 ?auto_307828 ?auto_307829 )
      ( MAKE-13PILE ?auto_307819 ?auto_307820 ?auto_307821 ?auto_307822 ?auto_307823 ?auto_307824 ?auto_307825 ?auto_307826 ?auto_307827 ?auto_307828 ?auto_307829 ?auto_307830 ?auto_307831 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307846 - BLOCK
      ?auto_307847 - BLOCK
      ?auto_307848 - BLOCK
      ?auto_307849 - BLOCK
      ?auto_307850 - BLOCK
      ?auto_307851 - BLOCK
      ?auto_307852 - BLOCK
      ?auto_307853 - BLOCK
      ?auto_307854 - BLOCK
      ?auto_307855 - BLOCK
      ?auto_307856 - BLOCK
      ?auto_307857 - BLOCK
      ?auto_307858 - BLOCK
    )
    :vars
    (
      ?auto_307859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307858 ?auto_307859 ) ( ON-TABLE ?auto_307846 ) ( ON ?auto_307847 ?auto_307846 ) ( ON ?auto_307848 ?auto_307847 ) ( ON ?auto_307849 ?auto_307848 ) ( ON ?auto_307850 ?auto_307849 ) ( ON ?auto_307851 ?auto_307850 ) ( ON ?auto_307852 ?auto_307851 ) ( ON ?auto_307853 ?auto_307852 ) ( ON ?auto_307854 ?auto_307853 ) ( not ( = ?auto_307846 ?auto_307847 ) ) ( not ( = ?auto_307846 ?auto_307848 ) ) ( not ( = ?auto_307846 ?auto_307849 ) ) ( not ( = ?auto_307846 ?auto_307850 ) ) ( not ( = ?auto_307846 ?auto_307851 ) ) ( not ( = ?auto_307846 ?auto_307852 ) ) ( not ( = ?auto_307846 ?auto_307853 ) ) ( not ( = ?auto_307846 ?auto_307854 ) ) ( not ( = ?auto_307846 ?auto_307855 ) ) ( not ( = ?auto_307846 ?auto_307856 ) ) ( not ( = ?auto_307846 ?auto_307857 ) ) ( not ( = ?auto_307846 ?auto_307858 ) ) ( not ( = ?auto_307846 ?auto_307859 ) ) ( not ( = ?auto_307847 ?auto_307848 ) ) ( not ( = ?auto_307847 ?auto_307849 ) ) ( not ( = ?auto_307847 ?auto_307850 ) ) ( not ( = ?auto_307847 ?auto_307851 ) ) ( not ( = ?auto_307847 ?auto_307852 ) ) ( not ( = ?auto_307847 ?auto_307853 ) ) ( not ( = ?auto_307847 ?auto_307854 ) ) ( not ( = ?auto_307847 ?auto_307855 ) ) ( not ( = ?auto_307847 ?auto_307856 ) ) ( not ( = ?auto_307847 ?auto_307857 ) ) ( not ( = ?auto_307847 ?auto_307858 ) ) ( not ( = ?auto_307847 ?auto_307859 ) ) ( not ( = ?auto_307848 ?auto_307849 ) ) ( not ( = ?auto_307848 ?auto_307850 ) ) ( not ( = ?auto_307848 ?auto_307851 ) ) ( not ( = ?auto_307848 ?auto_307852 ) ) ( not ( = ?auto_307848 ?auto_307853 ) ) ( not ( = ?auto_307848 ?auto_307854 ) ) ( not ( = ?auto_307848 ?auto_307855 ) ) ( not ( = ?auto_307848 ?auto_307856 ) ) ( not ( = ?auto_307848 ?auto_307857 ) ) ( not ( = ?auto_307848 ?auto_307858 ) ) ( not ( = ?auto_307848 ?auto_307859 ) ) ( not ( = ?auto_307849 ?auto_307850 ) ) ( not ( = ?auto_307849 ?auto_307851 ) ) ( not ( = ?auto_307849 ?auto_307852 ) ) ( not ( = ?auto_307849 ?auto_307853 ) ) ( not ( = ?auto_307849 ?auto_307854 ) ) ( not ( = ?auto_307849 ?auto_307855 ) ) ( not ( = ?auto_307849 ?auto_307856 ) ) ( not ( = ?auto_307849 ?auto_307857 ) ) ( not ( = ?auto_307849 ?auto_307858 ) ) ( not ( = ?auto_307849 ?auto_307859 ) ) ( not ( = ?auto_307850 ?auto_307851 ) ) ( not ( = ?auto_307850 ?auto_307852 ) ) ( not ( = ?auto_307850 ?auto_307853 ) ) ( not ( = ?auto_307850 ?auto_307854 ) ) ( not ( = ?auto_307850 ?auto_307855 ) ) ( not ( = ?auto_307850 ?auto_307856 ) ) ( not ( = ?auto_307850 ?auto_307857 ) ) ( not ( = ?auto_307850 ?auto_307858 ) ) ( not ( = ?auto_307850 ?auto_307859 ) ) ( not ( = ?auto_307851 ?auto_307852 ) ) ( not ( = ?auto_307851 ?auto_307853 ) ) ( not ( = ?auto_307851 ?auto_307854 ) ) ( not ( = ?auto_307851 ?auto_307855 ) ) ( not ( = ?auto_307851 ?auto_307856 ) ) ( not ( = ?auto_307851 ?auto_307857 ) ) ( not ( = ?auto_307851 ?auto_307858 ) ) ( not ( = ?auto_307851 ?auto_307859 ) ) ( not ( = ?auto_307852 ?auto_307853 ) ) ( not ( = ?auto_307852 ?auto_307854 ) ) ( not ( = ?auto_307852 ?auto_307855 ) ) ( not ( = ?auto_307852 ?auto_307856 ) ) ( not ( = ?auto_307852 ?auto_307857 ) ) ( not ( = ?auto_307852 ?auto_307858 ) ) ( not ( = ?auto_307852 ?auto_307859 ) ) ( not ( = ?auto_307853 ?auto_307854 ) ) ( not ( = ?auto_307853 ?auto_307855 ) ) ( not ( = ?auto_307853 ?auto_307856 ) ) ( not ( = ?auto_307853 ?auto_307857 ) ) ( not ( = ?auto_307853 ?auto_307858 ) ) ( not ( = ?auto_307853 ?auto_307859 ) ) ( not ( = ?auto_307854 ?auto_307855 ) ) ( not ( = ?auto_307854 ?auto_307856 ) ) ( not ( = ?auto_307854 ?auto_307857 ) ) ( not ( = ?auto_307854 ?auto_307858 ) ) ( not ( = ?auto_307854 ?auto_307859 ) ) ( not ( = ?auto_307855 ?auto_307856 ) ) ( not ( = ?auto_307855 ?auto_307857 ) ) ( not ( = ?auto_307855 ?auto_307858 ) ) ( not ( = ?auto_307855 ?auto_307859 ) ) ( not ( = ?auto_307856 ?auto_307857 ) ) ( not ( = ?auto_307856 ?auto_307858 ) ) ( not ( = ?auto_307856 ?auto_307859 ) ) ( not ( = ?auto_307857 ?auto_307858 ) ) ( not ( = ?auto_307857 ?auto_307859 ) ) ( not ( = ?auto_307858 ?auto_307859 ) ) ( ON ?auto_307857 ?auto_307858 ) ( ON ?auto_307856 ?auto_307857 ) ( CLEAR ?auto_307854 ) ( ON ?auto_307855 ?auto_307856 ) ( CLEAR ?auto_307855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_307846 ?auto_307847 ?auto_307848 ?auto_307849 ?auto_307850 ?auto_307851 ?auto_307852 ?auto_307853 ?auto_307854 ?auto_307855 )
      ( MAKE-13PILE ?auto_307846 ?auto_307847 ?auto_307848 ?auto_307849 ?auto_307850 ?auto_307851 ?auto_307852 ?auto_307853 ?auto_307854 ?auto_307855 ?auto_307856 ?auto_307857 ?auto_307858 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307873 - BLOCK
      ?auto_307874 - BLOCK
      ?auto_307875 - BLOCK
      ?auto_307876 - BLOCK
      ?auto_307877 - BLOCK
      ?auto_307878 - BLOCK
      ?auto_307879 - BLOCK
      ?auto_307880 - BLOCK
      ?auto_307881 - BLOCK
      ?auto_307882 - BLOCK
      ?auto_307883 - BLOCK
      ?auto_307884 - BLOCK
      ?auto_307885 - BLOCK
    )
    :vars
    (
      ?auto_307886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307885 ?auto_307886 ) ( ON-TABLE ?auto_307873 ) ( ON ?auto_307874 ?auto_307873 ) ( ON ?auto_307875 ?auto_307874 ) ( ON ?auto_307876 ?auto_307875 ) ( ON ?auto_307877 ?auto_307876 ) ( ON ?auto_307878 ?auto_307877 ) ( ON ?auto_307879 ?auto_307878 ) ( ON ?auto_307880 ?auto_307879 ) ( ON ?auto_307881 ?auto_307880 ) ( not ( = ?auto_307873 ?auto_307874 ) ) ( not ( = ?auto_307873 ?auto_307875 ) ) ( not ( = ?auto_307873 ?auto_307876 ) ) ( not ( = ?auto_307873 ?auto_307877 ) ) ( not ( = ?auto_307873 ?auto_307878 ) ) ( not ( = ?auto_307873 ?auto_307879 ) ) ( not ( = ?auto_307873 ?auto_307880 ) ) ( not ( = ?auto_307873 ?auto_307881 ) ) ( not ( = ?auto_307873 ?auto_307882 ) ) ( not ( = ?auto_307873 ?auto_307883 ) ) ( not ( = ?auto_307873 ?auto_307884 ) ) ( not ( = ?auto_307873 ?auto_307885 ) ) ( not ( = ?auto_307873 ?auto_307886 ) ) ( not ( = ?auto_307874 ?auto_307875 ) ) ( not ( = ?auto_307874 ?auto_307876 ) ) ( not ( = ?auto_307874 ?auto_307877 ) ) ( not ( = ?auto_307874 ?auto_307878 ) ) ( not ( = ?auto_307874 ?auto_307879 ) ) ( not ( = ?auto_307874 ?auto_307880 ) ) ( not ( = ?auto_307874 ?auto_307881 ) ) ( not ( = ?auto_307874 ?auto_307882 ) ) ( not ( = ?auto_307874 ?auto_307883 ) ) ( not ( = ?auto_307874 ?auto_307884 ) ) ( not ( = ?auto_307874 ?auto_307885 ) ) ( not ( = ?auto_307874 ?auto_307886 ) ) ( not ( = ?auto_307875 ?auto_307876 ) ) ( not ( = ?auto_307875 ?auto_307877 ) ) ( not ( = ?auto_307875 ?auto_307878 ) ) ( not ( = ?auto_307875 ?auto_307879 ) ) ( not ( = ?auto_307875 ?auto_307880 ) ) ( not ( = ?auto_307875 ?auto_307881 ) ) ( not ( = ?auto_307875 ?auto_307882 ) ) ( not ( = ?auto_307875 ?auto_307883 ) ) ( not ( = ?auto_307875 ?auto_307884 ) ) ( not ( = ?auto_307875 ?auto_307885 ) ) ( not ( = ?auto_307875 ?auto_307886 ) ) ( not ( = ?auto_307876 ?auto_307877 ) ) ( not ( = ?auto_307876 ?auto_307878 ) ) ( not ( = ?auto_307876 ?auto_307879 ) ) ( not ( = ?auto_307876 ?auto_307880 ) ) ( not ( = ?auto_307876 ?auto_307881 ) ) ( not ( = ?auto_307876 ?auto_307882 ) ) ( not ( = ?auto_307876 ?auto_307883 ) ) ( not ( = ?auto_307876 ?auto_307884 ) ) ( not ( = ?auto_307876 ?auto_307885 ) ) ( not ( = ?auto_307876 ?auto_307886 ) ) ( not ( = ?auto_307877 ?auto_307878 ) ) ( not ( = ?auto_307877 ?auto_307879 ) ) ( not ( = ?auto_307877 ?auto_307880 ) ) ( not ( = ?auto_307877 ?auto_307881 ) ) ( not ( = ?auto_307877 ?auto_307882 ) ) ( not ( = ?auto_307877 ?auto_307883 ) ) ( not ( = ?auto_307877 ?auto_307884 ) ) ( not ( = ?auto_307877 ?auto_307885 ) ) ( not ( = ?auto_307877 ?auto_307886 ) ) ( not ( = ?auto_307878 ?auto_307879 ) ) ( not ( = ?auto_307878 ?auto_307880 ) ) ( not ( = ?auto_307878 ?auto_307881 ) ) ( not ( = ?auto_307878 ?auto_307882 ) ) ( not ( = ?auto_307878 ?auto_307883 ) ) ( not ( = ?auto_307878 ?auto_307884 ) ) ( not ( = ?auto_307878 ?auto_307885 ) ) ( not ( = ?auto_307878 ?auto_307886 ) ) ( not ( = ?auto_307879 ?auto_307880 ) ) ( not ( = ?auto_307879 ?auto_307881 ) ) ( not ( = ?auto_307879 ?auto_307882 ) ) ( not ( = ?auto_307879 ?auto_307883 ) ) ( not ( = ?auto_307879 ?auto_307884 ) ) ( not ( = ?auto_307879 ?auto_307885 ) ) ( not ( = ?auto_307879 ?auto_307886 ) ) ( not ( = ?auto_307880 ?auto_307881 ) ) ( not ( = ?auto_307880 ?auto_307882 ) ) ( not ( = ?auto_307880 ?auto_307883 ) ) ( not ( = ?auto_307880 ?auto_307884 ) ) ( not ( = ?auto_307880 ?auto_307885 ) ) ( not ( = ?auto_307880 ?auto_307886 ) ) ( not ( = ?auto_307881 ?auto_307882 ) ) ( not ( = ?auto_307881 ?auto_307883 ) ) ( not ( = ?auto_307881 ?auto_307884 ) ) ( not ( = ?auto_307881 ?auto_307885 ) ) ( not ( = ?auto_307881 ?auto_307886 ) ) ( not ( = ?auto_307882 ?auto_307883 ) ) ( not ( = ?auto_307882 ?auto_307884 ) ) ( not ( = ?auto_307882 ?auto_307885 ) ) ( not ( = ?auto_307882 ?auto_307886 ) ) ( not ( = ?auto_307883 ?auto_307884 ) ) ( not ( = ?auto_307883 ?auto_307885 ) ) ( not ( = ?auto_307883 ?auto_307886 ) ) ( not ( = ?auto_307884 ?auto_307885 ) ) ( not ( = ?auto_307884 ?auto_307886 ) ) ( not ( = ?auto_307885 ?auto_307886 ) ) ( ON ?auto_307884 ?auto_307885 ) ( ON ?auto_307883 ?auto_307884 ) ( CLEAR ?auto_307881 ) ( ON ?auto_307882 ?auto_307883 ) ( CLEAR ?auto_307882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_307873 ?auto_307874 ?auto_307875 ?auto_307876 ?auto_307877 ?auto_307878 ?auto_307879 ?auto_307880 ?auto_307881 ?auto_307882 )
      ( MAKE-13PILE ?auto_307873 ?auto_307874 ?auto_307875 ?auto_307876 ?auto_307877 ?auto_307878 ?auto_307879 ?auto_307880 ?auto_307881 ?auto_307882 ?auto_307883 ?auto_307884 ?auto_307885 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307900 - BLOCK
      ?auto_307901 - BLOCK
      ?auto_307902 - BLOCK
      ?auto_307903 - BLOCK
      ?auto_307904 - BLOCK
      ?auto_307905 - BLOCK
      ?auto_307906 - BLOCK
      ?auto_307907 - BLOCK
      ?auto_307908 - BLOCK
      ?auto_307909 - BLOCK
      ?auto_307910 - BLOCK
      ?auto_307911 - BLOCK
      ?auto_307912 - BLOCK
    )
    :vars
    (
      ?auto_307913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307912 ?auto_307913 ) ( ON-TABLE ?auto_307900 ) ( ON ?auto_307901 ?auto_307900 ) ( ON ?auto_307902 ?auto_307901 ) ( ON ?auto_307903 ?auto_307902 ) ( ON ?auto_307904 ?auto_307903 ) ( ON ?auto_307905 ?auto_307904 ) ( ON ?auto_307906 ?auto_307905 ) ( ON ?auto_307907 ?auto_307906 ) ( not ( = ?auto_307900 ?auto_307901 ) ) ( not ( = ?auto_307900 ?auto_307902 ) ) ( not ( = ?auto_307900 ?auto_307903 ) ) ( not ( = ?auto_307900 ?auto_307904 ) ) ( not ( = ?auto_307900 ?auto_307905 ) ) ( not ( = ?auto_307900 ?auto_307906 ) ) ( not ( = ?auto_307900 ?auto_307907 ) ) ( not ( = ?auto_307900 ?auto_307908 ) ) ( not ( = ?auto_307900 ?auto_307909 ) ) ( not ( = ?auto_307900 ?auto_307910 ) ) ( not ( = ?auto_307900 ?auto_307911 ) ) ( not ( = ?auto_307900 ?auto_307912 ) ) ( not ( = ?auto_307900 ?auto_307913 ) ) ( not ( = ?auto_307901 ?auto_307902 ) ) ( not ( = ?auto_307901 ?auto_307903 ) ) ( not ( = ?auto_307901 ?auto_307904 ) ) ( not ( = ?auto_307901 ?auto_307905 ) ) ( not ( = ?auto_307901 ?auto_307906 ) ) ( not ( = ?auto_307901 ?auto_307907 ) ) ( not ( = ?auto_307901 ?auto_307908 ) ) ( not ( = ?auto_307901 ?auto_307909 ) ) ( not ( = ?auto_307901 ?auto_307910 ) ) ( not ( = ?auto_307901 ?auto_307911 ) ) ( not ( = ?auto_307901 ?auto_307912 ) ) ( not ( = ?auto_307901 ?auto_307913 ) ) ( not ( = ?auto_307902 ?auto_307903 ) ) ( not ( = ?auto_307902 ?auto_307904 ) ) ( not ( = ?auto_307902 ?auto_307905 ) ) ( not ( = ?auto_307902 ?auto_307906 ) ) ( not ( = ?auto_307902 ?auto_307907 ) ) ( not ( = ?auto_307902 ?auto_307908 ) ) ( not ( = ?auto_307902 ?auto_307909 ) ) ( not ( = ?auto_307902 ?auto_307910 ) ) ( not ( = ?auto_307902 ?auto_307911 ) ) ( not ( = ?auto_307902 ?auto_307912 ) ) ( not ( = ?auto_307902 ?auto_307913 ) ) ( not ( = ?auto_307903 ?auto_307904 ) ) ( not ( = ?auto_307903 ?auto_307905 ) ) ( not ( = ?auto_307903 ?auto_307906 ) ) ( not ( = ?auto_307903 ?auto_307907 ) ) ( not ( = ?auto_307903 ?auto_307908 ) ) ( not ( = ?auto_307903 ?auto_307909 ) ) ( not ( = ?auto_307903 ?auto_307910 ) ) ( not ( = ?auto_307903 ?auto_307911 ) ) ( not ( = ?auto_307903 ?auto_307912 ) ) ( not ( = ?auto_307903 ?auto_307913 ) ) ( not ( = ?auto_307904 ?auto_307905 ) ) ( not ( = ?auto_307904 ?auto_307906 ) ) ( not ( = ?auto_307904 ?auto_307907 ) ) ( not ( = ?auto_307904 ?auto_307908 ) ) ( not ( = ?auto_307904 ?auto_307909 ) ) ( not ( = ?auto_307904 ?auto_307910 ) ) ( not ( = ?auto_307904 ?auto_307911 ) ) ( not ( = ?auto_307904 ?auto_307912 ) ) ( not ( = ?auto_307904 ?auto_307913 ) ) ( not ( = ?auto_307905 ?auto_307906 ) ) ( not ( = ?auto_307905 ?auto_307907 ) ) ( not ( = ?auto_307905 ?auto_307908 ) ) ( not ( = ?auto_307905 ?auto_307909 ) ) ( not ( = ?auto_307905 ?auto_307910 ) ) ( not ( = ?auto_307905 ?auto_307911 ) ) ( not ( = ?auto_307905 ?auto_307912 ) ) ( not ( = ?auto_307905 ?auto_307913 ) ) ( not ( = ?auto_307906 ?auto_307907 ) ) ( not ( = ?auto_307906 ?auto_307908 ) ) ( not ( = ?auto_307906 ?auto_307909 ) ) ( not ( = ?auto_307906 ?auto_307910 ) ) ( not ( = ?auto_307906 ?auto_307911 ) ) ( not ( = ?auto_307906 ?auto_307912 ) ) ( not ( = ?auto_307906 ?auto_307913 ) ) ( not ( = ?auto_307907 ?auto_307908 ) ) ( not ( = ?auto_307907 ?auto_307909 ) ) ( not ( = ?auto_307907 ?auto_307910 ) ) ( not ( = ?auto_307907 ?auto_307911 ) ) ( not ( = ?auto_307907 ?auto_307912 ) ) ( not ( = ?auto_307907 ?auto_307913 ) ) ( not ( = ?auto_307908 ?auto_307909 ) ) ( not ( = ?auto_307908 ?auto_307910 ) ) ( not ( = ?auto_307908 ?auto_307911 ) ) ( not ( = ?auto_307908 ?auto_307912 ) ) ( not ( = ?auto_307908 ?auto_307913 ) ) ( not ( = ?auto_307909 ?auto_307910 ) ) ( not ( = ?auto_307909 ?auto_307911 ) ) ( not ( = ?auto_307909 ?auto_307912 ) ) ( not ( = ?auto_307909 ?auto_307913 ) ) ( not ( = ?auto_307910 ?auto_307911 ) ) ( not ( = ?auto_307910 ?auto_307912 ) ) ( not ( = ?auto_307910 ?auto_307913 ) ) ( not ( = ?auto_307911 ?auto_307912 ) ) ( not ( = ?auto_307911 ?auto_307913 ) ) ( not ( = ?auto_307912 ?auto_307913 ) ) ( ON ?auto_307911 ?auto_307912 ) ( ON ?auto_307910 ?auto_307911 ) ( ON ?auto_307909 ?auto_307910 ) ( CLEAR ?auto_307907 ) ( ON ?auto_307908 ?auto_307909 ) ( CLEAR ?auto_307908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_307900 ?auto_307901 ?auto_307902 ?auto_307903 ?auto_307904 ?auto_307905 ?auto_307906 ?auto_307907 ?auto_307908 )
      ( MAKE-13PILE ?auto_307900 ?auto_307901 ?auto_307902 ?auto_307903 ?auto_307904 ?auto_307905 ?auto_307906 ?auto_307907 ?auto_307908 ?auto_307909 ?auto_307910 ?auto_307911 ?auto_307912 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307927 - BLOCK
      ?auto_307928 - BLOCK
      ?auto_307929 - BLOCK
      ?auto_307930 - BLOCK
      ?auto_307931 - BLOCK
      ?auto_307932 - BLOCK
      ?auto_307933 - BLOCK
      ?auto_307934 - BLOCK
      ?auto_307935 - BLOCK
      ?auto_307936 - BLOCK
      ?auto_307937 - BLOCK
      ?auto_307938 - BLOCK
      ?auto_307939 - BLOCK
    )
    :vars
    (
      ?auto_307940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307939 ?auto_307940 ) ( ON-TABLE ?auto_307927 ) ( ON ?auto_307928 ?auto_307927 ) ( ON ?auto_307929 ?auto_307928 ) ( ON ?auto_307930 ?auto_307929 ) ( ON ?auto_307931 ?auto_307930 ) ( ON ?auto_307932 ?auto_307931 ) ( ON ?auto_307933 ?auto_307932 ) ( ON ?auto_307934 ?auto_307933 ) ( not ( = ?auto_307927 ?auto_307928 ) ) ( not ( = ?auto_307927 ?auto_307929 ) ) ( not ( = ?auto_307927 ?auto_307930 ) ) ( not ( = ?auto_307927 ?auto_307931 ) ) ( not ( = ?auto_307927 ?auto_307932 ) ) ( not ( = ?auto_307927 ?auto_307933 ) ) ( not ( = ?auto_307927 ?auto_307934 ) ) ( not ( = ?auto_307927 ?auto_307935 ) ) ( not ( = ?auto_307927 ?auto_307936 ) ) ( not ( = ?auto_307927 ?auto_307937 ) ) ( not ( = ?auto_307927 ?auto_307938 ) ) ( not ( = ?auto_307927 ?auto_307939 ) ) ( not ( = ?auto_307927 ?auto_307940 ) ) ( not ( = ?auto_307928 ?auto_307929 ) ) ( not ( = ?auto_307928 ?auto_307930 ) ) ( not ( = ?auto_307928 ?auto_307931 ) ) ( not ( = ?auto_307928 ?auto_307932 ) ) ( not ( = ?auto_307928 ?auto_307933 ) ) ( not ( = ?auto_307928 ?auto_307934 ) ) ( not ( = ?auto_307928 ?auto_307935 ) ) ( not ( = ?auto_307928 ?auto_307936 ) ) ( not ( = ?auto_307928 ?auto_307937 ) ) ( not ( = ?auto_307928 ?auto_307938 ) ) ( not ( = ?auto_307928 ?auto_307939 ) ) ( not ( = ?auto_307928 ?auto_307940 ) ) ( not ( = ?auto_307929 ?auto_307930 ) ) ( not ( = ?auto_307929 ?auto_307931 ) ) ( not ( = ?auto_307929 ?auto_307932 ) ) ( not ( = ?auto_307929 ?auto_307933 ) ) ( not ( = ?auto_307929 ?auto_307934 ) ) ( not ( = ?auto_307929 ?auto_307935 ) ) ( not ( = ?auto_307929 ?auto_307936 ) ) ( not ( = ?auto_307929 ?auto_307937 ) ) ( not ( = ?auto_307929 ?auto_307938 ) ) ( not ( = ?auto_307929 ?auto_307939 ) ) ( not ( = ?auto_307929 ?auto_307940 ) ) ( not ( = ?auto_307930 ?auto_307931 ) ) ( not ( = ?auto_307930 ?auto_307932 ) ) ( not ( = ?auto_307930 ?auto_307933 ) ) ( not ( = ?auto_307930 ?auto_307934 ) ) ( not ( = ?auto_307930 ?auto_307935 ) ) ( not ( = ?auto_307930 ?auto_307936 ) ) ( not ( = ?auto_307930 ?auto_307937 ) ) ( not ( = ?auto_307930 ?auto_307938 ) ) ( not ( = ?auto_307930 ?auto_307939 ) ) ( not ( = ?auto_307930 ?auto_307940 ) ) ( not ( = ?auto_307931 ?auto_307932 ) ) ( not ( = ?auto_307931 ?auto_307933 ) ) ( not ( = ?auto_307931 ?auto_307934 ) ) ( not ( = ?auto_307931 ?auto_307935 ) ) ( not ( = ?auto_307931 ?auto_307936 ) ) ( not ( = ?auto_307931 ?auto_307937 ) ) ( not ( = ?auto_307931 ?auto_307938 ) ) ( not ( = ?auto_307931 ?auto_307939 ) ) ( not ( = ?auto_307931 ?auto_307940 ) ) ( not ( = ?auto_307932 ?auto_307933 ) ) ( not ( = ?auto_307932 ?auto_307934 ) ) ( not ( = ?auto_307932 ?auto_307935 ) ) ( not ( = ?auto_307932 ?auto_307936 ) ) ( not ( = ?auto_307932 ?auto_307937 ) ) ( not ( = ?auto_307932 ?auto_307938 ) ) ( not ( = ?auto_307932 ?auto_307939 ) ) ( not ( = ?auto_307932 ?auto_307940 ) ) ( not ( = ?auto_307933 ?auto_307934 ) ) ( not ( = ?auto_307933 ?auto_307935 ) ) ( not ( = ?auto_307933 ?auto_307936 ) ) ( not ( = ?auto_307933 ?auto_307937 ) ) ( not ( = ?auto_307933 ?auto_307938 ) ) ( not ( = ?auto_307933 ?auto_307939 ) ) ( not ( = ?auto_307933 ?auto_307940 ) ) ( not ( = ?auto_307934 ?auto_307935 ) ) ( not ( = ?auto_307934 ?auto_307936 ) ) ( not ( = ?auto_307934 ?auto_307937 ) ) ( not ( = ?auto_307934 ?auto_307938 ) ) ( not ( = ?auto_307934 ?auto_307939 ) ) ( not ( = ?auto_307934 ?auto_307940 ) ) ( not ( = ?auto_307935 ?auto_307936 ) ) ( not ( = ?auto_307935 ?auto_307937 ) ) ( not ( = ?auto_307935 ?auto_307938 ) ) ( not ( = ?auto_307935 ?auto_307939 ) ) ( not ( = ?auto_307935 ?auto_307940 ) ) ( not ( = ?auto_307936 ?auto_307937 ) ) ( not ( = ?auto_307936 ?auto_307938 ) ) ( not ( = ?auto_307936 ?auto_307939 ) ) ( not ( = ?auto_307936 ?auto_307940 ) ) ( not ( = ?auto_307937 ?auto_307938 ) ) ( not ( = ?auto_307937 ?auto_307939 ) ) ( not ( = ?auto_307937 ?auto_307940 ) ) ( not ( = ?auto_307938 ?auto_307939 ) ) ( not ( = ?auto_307938 ?auto_307940 ) ) ( not ( = ?auto_307939 ?auto_307940 ) ) ( ON ?auto_307938 ?auto_307939 ) ( ON ?auto_307937 ?auto_307938 ) ( ON ?auto_307936 ?auto_307937 ) ( CLEAR ?auto_307934 ) ( ON ?auto_307935 ?auto_307936 ) ( CLEAR ?auto_307935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_307927 ?auto_307928 ?auto_307929 ?auto_307930 ?auto_307931 ?auto_307932 ?auto_307933 ?auto_307934 ?auto_307935 )
      ( MAKE-13PILE ?auto_307927 ?auto_307928 ?auto_307929 ?auto_307930 ?auto_307931 ?auto_307932 ?auto_307933 ?auto_307934 ?auto_307935 ?auto_307936 ?auto_307937 ?auto_307938 ?auto_307939 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307954 - BLOCK
      ?auto_307955 - BLOCK
      ?auto_307956 - BLOCK
      ?auto_307957 - BLOCK
      ?auto_307958 - BLOCK
      ?auto_307959 - BLOCK
      ?auto_307960 - BLOCK
      ?auto_307961 - BLOCK
      ?auto_307962 - BLOCK
      ?auto_307963 - BLOCK
      ?auto_307964 - BLOCK
      ?auto_307965 - BLOCK
      ?auto_307966 - BLOCK
    )
    :vars
    (
      ?auto_307967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307966 ?auto_307967 ) ( ON-TABLE ?auto_307954 ) ( ON ?auto_307955 ?auto_307954 ) ( ON ?auto_307956 ?auto_307955 ) ( ON ?auto_307957 ?auto_307956 ) ( ON ?auto_307958 ?auto_307957 ) ( ON ?auto_307959 ?auto_307958 ) ( ON ?auto_307960 ?auto_307959 ) ( not ( = ?auto_307954 ?auto_307955 ) ) ( not ( = ?auto_307954 ?auto_307956 ) ) ( not ( = ?auto_307954 ?auto_307957 ) ) ( not ( = ?auto_307954 ?auto_307958 ) ) ( not ( = ?auto_307954 ?auto_307959 ) ) ( not ( = ?auto_307954 ?auto_307960 ) ) ( not ( = ?auto_307954 ?auto_307961 ) ) ( not ( = ?auto_307954 ?auto_307962 ) ) ( not ( = ?auto_307954 ?auto_307963 ) ) ( not ( = ?auto_307954 ?auto_307964 ) ) ( not ( = ?auto_307954 ?auto_307965 ) ) ( not ( = ?auto_307954 ?auto_307966 ) ) ( not ( = ?auto_307954 ?auto_307967 ) ) ( not ( = ?auto_307955 ?auto_307956 ) ) ( not ( = ?auto_307955 ?auto_307957 ) ) ( not ( = ?auto_307955 ?auto_307958 ) ) ( not ( = ?auto_307955 ?auto_307959 ) ) ( not ( = ?auto_307955 ?auto_307960 ) ) ( not ( = ?auto_307955 ?auto_307961 ) ) ( not ( = ?auto_307955 ?auto_307962 ) ) ( not ( = ?auto_307955 ?auto_307963 ) ) ( not ( = ?auto_307955 ?auto_307964 ) ) ( not ( = ?auto_307955 ?auto_307965 ) ) ( not ( = ?auto_307955 ?auto_307966 ) ) ( not ( = ?auto_307955 ?auto_307967 ) ) ( not ( = ?auto_307956 ?auto_307957 ) ) ( not ( = ?auto_307956 ?auto_307958 ) ) ( not ( = ?auto_307956 ?auto_307959 ) ) ( not ( = ?auto_307956 ?auto_307960 ) ) ( not ( = ?auto_307956 ?auto_307961 ) ) ( not ( = ?auto_307956 ?auto_307962 ) ) ( not ( = ?auto_307956 ?auto_307963 ) ) ( not ( = ?auto_307956 ?auto_307964 ) ) ( not ( = ?auto_307956 ?auto_307965 ) ) ( not ( = ?auto_307956 ?auto_307966 ) ) ( not ( = ?auto_307956 ?auto_307967 ) ) ( not ( = ?auto_307957 ?auto_307958 ) ) ( not ( = ?auto_307957 ?auto_307959 ) ) ( not ( = ?auto_307957 ?auto_307960 ) ) ( not ( = ?auto_307957 ?auto_307961 ) ) ( not ( = ?auto_307957 ?auto_307962 ) ) ( not ( = ?auto_307957 ?auto_307963 ) ) ( not ( = ?auto_307957 ?auto_307964 ) ) ( not ( = ?auto_307957 ?auto_307965 ) ) ( not ( = ?auto_307957 ?auto_307966 ) ) ( not ( = ?auto_307957 ?auto_307967 ) ) ( not ( = ?auto_307958 ?auto_307959 ) ) ( not ( = ?auto_307958 ?auto_307960 ) ) ( not ( = ?auto_307958 ?auto_307961 ) ) ( not ( = ?auto_307958 ?auto_307962 ) ) ( not ( = ?auto_307958 ?auto_307963 ) ) ( not ( = ?auto_307958 ?auto_307964 ) ) ( not ( = ?auto_307958 ?auto_307965 ) ) ( not ( = ?auto_307958 ?auto_307966 ) ) ( not ( = ?auto_307958 ?auto_307967 ) ) ( not ( = ?auto_307959 ?auto_307960 ) ) ( not ( = ?auto_307959 ?auto_307961 ) ) ( not ( = ?auto_307959 ?auto_307962 ) ) ( not ( = ?auto_307959 ?auto_307963 ) ) ( not ( = ?auto_307959 ?auto_307964 ) ) ( not ( = ?auto_307959 ?auto_307965 ) ) ( not ( = ?auto_307959 ?auto_307966 ) ) ( not ( = ?auto_307959 ?auto_307967 ) ) ( not ( = ?auto_307960 ?auto_307961 ) ) ( not ( = ?auto_307960 ?auto_307962 ) ) ( not ( = ?auto_307960 ?auto_307963 ) ) ( not ( = ?auto_307960 ?auto_307964 ) ) ( not ( = ?auto_307960 ?auto_307965 ) ) ( not ( = ?auto_307960 ?auto_307966 ) ) ( not ( = ?auto_307960 ?auto_307967 ) ) ( not ( = ?auto_307961 ?auto_307962 ) ) ( not ( = ?auto_307961 ?auto_307963 ) ) ( not ( = ?auto_307961 ?auto_307964 ) ) ( not ( = ?auto_307961 ?auto_307965 ) ) ( not ( = ?auto_307961 ?auto_307966 ) ) ( not ( = ?auto_307961 ?auto_307967 ) ) ( not ( = ?auto_307962 ?auto_307963 ) ) ( not ( = ?auto_307962 ?auto_307964 ) ) ( not ( = ?auto_307962 ?auto_307965 ) ) ( not ( = ?auto_307962 ?auto_307966 ) ) ( not ( = ?auto_307962 ?auto_307967 ) ) ( not ( = ?auto_307963 ?auto_307964 ) ) ( not ( = ?auto_307963 ?auto_307965 ) ) ( not ( = ?auto_307963 ?auto_307966 ) ) ( not ( = ?auto_307963 ?auto_307967 ) ) ( not ( = ?auto_307964 ?auto_307965 ) ) ( not ( = ?auto_307964 ?auto_307966 ) ) ( not ( = ?auto_307964 ?auto_307967 ) ) ( not ( = ?auto_307965 ?auto_307966 ) ) ( not ( = ?auto_307965 ?auto_307967 ) ) ( not ( = ?auto_307966 ?auto_307967 ) ) ( ON ?auto_307965 ?auto_307966 ) ( ON ?auto_307964 ?auto_307965 ) ( ON ?auto_307963 ?auto_307964 ) ( ON ?auto_307962 ?auto_307963 ) ( CLEAR ?auto_307960 ) ( ON ?auto_307961 ?auto_307962 ) ( CLEAR ?auto_307961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_307954 ?auto_307955 ?auto_307956 ?auto_307957 ?auto_307958 ?auto_307959 ?auto_307960 ?auto_307961 )
      ( MAKE-13PILE ?auto_307954 ?auto_307955 ?auto_307956 ?auto_307957 ?auto_307958 ?auto_307959 ?auto_307960 ?auto_307961 ?auto_307962 ?auto_307963 ?auto_307964 ?auto_307965 ?auto_307966 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_307981 - BLOCK
      ?auto_307982 - BLOCK
      ?auto_307983 - BLOCK
      ?auto_307984 - BLOCK
      ?auto_307985 - BLOCK
      ?auto_307986 - BLOCK
      ?auto_307987 - BLOCK
      ?auto_307988 - BLOCK
      ?auto_307989 - BLOCK
      ?auto_307990 - BLOCK
      ?auto_307991 - BLOCK
      ?auto_307992 - BLOCK
      ?auto_307993 - BLOCK
    )
    :vars
    (
      ?auto_307994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307993 ?auto_307994 ) ( ON-TABLE ?auto_307981 ) ( ON ?auto_307982 ?auto_307981 ) ( ON ?auto_307983 ?auto_307982 ) ( ON ?auto_307984 ?auto_307983 ) ( ON ?auto_307985 ?auto_307984 ) ( ON ?auto_307986 ?auto_307985 ) ( ON ?auto_307987 ?auto_307986 ) ( not ( = ?auto_307981 ?auto_307982 ) ) ( not ( = ?auto_307981 ?auto_307983 ) ) ( not ( = ?auto_307981 ?auto_307984 ) ) ( not ( = ?auto_307981 ?auto_307985 ) ) ( not ( = ?auto_307981 ?auto_307986 ) ) ( not ( = ?auto_307981 ?auto_307987 ) ) ( not ( = ?auto_307981 ?auto_307988 ) ) ( not ( = ?auto_307981 ?auto_307989 ) ) ( not ( = ?auto_307981 ?auto_307990 ) ) ( not ( = ?auto_307981 ?auto_307991 ) ) ( not ( = ?auto_307981 ?auto_307992 ) ) ( not ( = ?auto_307981 ?auto_307993 ) ) ( not ( = ?auto_307981 ?auto_307994 ) ) ( not ( = ?auto_307982 ?auto_307983 ) ) ( not ( = ?auto_307982 ?auto_307984 ) ) ( not ( = ?auto_307982 ?auto_307985 ) ) ( not ( = ?auto_307982 ?auto_307986 ) ) ( not ( = ?auto_307982 ?auto_307987 ) ) ( not ( = ?auto_307982 ?auto_307988 ) ) ( not ( = ?auto_307982 ?auto_307989 ) ) ( not ( = ?auto_307982 ?auto_307990 ) ) ( not ( = ?auto_307982 ?auto_307991 ) ) ( not ( = ?auto_307982 ?auto_307992 ) ) ( not ( = ?auto_307982 ?auto_307993 ) ) ( not ( = ?auto_307982 ?auto_307994 ) ) ( not ( = ?auto_307983 ?auto_307984 ) ) ( not ( = ?auto_307983 ?auto_307985 ) ) ( not ( = ?auto_307983 ?auto_307986 ) ) ( not ( = ?auto_307983 ?auto_307987 ) ) ( not ( = ?auto_307983 ?auto_307988 ) ) ( not ( = ?auto_307983 ?auto_307989 ) ) ( not ( = ?auto_307983 ?auto_307990 ) ) ( not ( = ?auto_307983 ?auto_307991 ) ) ( not ( = ?auto_307983 ?auto_307992 ) ) ( not ( = ?auto_307983 ?auto_307993 ) ) ( not ( = ?auto_307983 ?auto_307994 ) ) ( not ( = ?auto_307984 ?auto_307985 ) ) ( not ( = ?auto_307984 ?auto_307986 ) ) ( not ( = ?auto_307984 ?auto_307987 ) ) ( not ( = ?auto_307984 ?auto_307988 ) ) ( not ( = ?auto_307984 ?auto_307989 ) ) ( not ( = ?auto_307984 ?auto_307990 ) ) ( not ( = ?auto_307984 ?auto_307991 ) ) ( not ( = ?auto_307984 ?auto_307992 ) ) ( not ( = ?auto_307984 ?auto_307993 ) ) ( not ( = ?auto_307984 ?auto_307994 ) ) ( not ( = ?auto_307985 ?auto_307986 ) ) ( not ( = ?auto_307985 ?auto_307987 ) ) ( not ( = ?auto_307985 ?auto_307988 ) ) ( not ( = ?auto_307985 ?auto_307989 ) ) ( not ( = ?auto_307985 ?auto_307990 ) ) ( not ( = ?auto_307985 ?auto_307991 ) ) ( not ( = ?auto_307985 ?auto_307992 ) ) ( not ( = ?auto_307985 ?auto_307993 ) ) ( not ( = ?auto_307985 ?auto_307994 ) ) ( not ( = ?auto_307986 ?auto_307987 ) ) ( not ( = ?auto_307986 ?auto_307988 ) ) ( not ( = ?auto_307986 ?auto_307989 ) ) ( not ( = ?auto_307986 ?auto_307990 ) ) ( not ( = ?auto_307986 ?auto_307991 ) ) ( not ( = ?auto_307986 ?auto_307992 ) ) ( not ( = ?auto_307986 ?auto_307993 ) ) ( not ( = ?auto_307986 ?auto_307994 ) ) ( not ( = ?auto_307987 ?auto_307988 ) ) ( not ( = ?auto_307987 ?auto_307989 ) ) ( not ( = ?auto_307987 ?auto_307990 ) ) ( not ( = ?auto_307987 ?auto_307991 ) ) ( not ( = ?auto_307987 ?auto_307992 ) ) ( not ( = ?auto_307987 ?auto_307993 ) ) ( not ( = ?auto_307987 ?auto_307994 ) ) ( not ( = ?auto_307988 ?auto_307989 ) ) ( not ( = ?auto_307988 ?auto_307990 ) ) ( not ( = ?auto_307988 ?auto_307991 ) ) ( not ( = ?auto_307988 ?auto_307992 ) ) ( not ( = ?auto_307988 ?auto_307993 ) ) ( not ( = ?auto_307988 ?auto_307994 ) ) ( not ( = ?auto_307989 ?auto_307990 ) ) ( not ( = ?auto_307989 ?auto_307991 ) ) ( not ( = ?auto_307989 ?auto_307992 ) ) ( not ( = ?auto_307989 ?auto_307993 ) ) ( not ( = ?auto_307989 ?auto_307994 ) ) ( not ( = ?auto_307990 ?auto_307991 ) ) ( not ( = ?auto_307990 ?auto_307992 ) ) ( not ( = ?auto_307990 ?auto_307993 ) ) ( not ( = ?auto_307990 ?auto_307994 ) ) ( not ( = ?auto_307991 ?auto_307992 ) ) ( not ( = ?auto_307991 ?auto_307993 ) ) ( not ( = ?auto_307991 ?auto_307994 ) ) ( not ( = ?auto_307992 ?auto_307993 ) ) ( not ( = ?auto_307992 ?auto_307994 ) ) ( not ( = ?auto_307993 ?auto_307994 ) ) ( ON ?auto_307992 ?auto_307993 ) ( ON ?auto_307991 ?auto_307992 ) ( ON ?auto_307990 ?auto_307991 ) ( ON ?auto_307989 ?auto_307990 ) ( CLEAR ?auto_307987 ) ( ON ?auto_307988 ?auto_307989 ) ( CLEAR ?auto_307988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_307981 ?auto_307982 ?auto_307983 ?auto_307984 ?auto_307985 ?auto_307986 ?auto_307987 ?auto_307988 )
      ( MAKE-13PILE ?auto_307981 ?auto_307982 ?auto_307983 ?auto_307984 ?auto_307985 ?auto_307986 ?auto_307987 ?auto_307988 ?auto_307989 ?auto_307990 ?auto_307991 ?auto_307992 ?auto_307993 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308008 - BLOCK
      ?auto_308009 - BLOCK
      ?auto_308010 - BLOCK
      ?auto_308011 - BLOCK
      ?auto_308012 - BLOCK
      ?auto_308013 - BLOCK
      ?auto_308014 - BLOCK
      ?auto_308015 - BLOCK
      ?auto_308016 - BLOCK
      ?auto_308017 - BLOCK
      ?auto_308018 - BLOCK
      ?auto_308019 - BLOCK
      ?auto_308020 - BLOCK
    )
    :vars
    (
      ?auto_308021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308020 ?auto_308021 ) ( ON-TABLE ?auto_308008 ) ( ON ?auto_308009 ?auto_308008 ) ( ON ?auto_308010 ?auto_308009 ) ( ON ?auto_308011 ?auto_308010 ) ( ON ?auto_308012 ?auto_308011 ) ( ON ?auto_308013 ?auto_308012 ) ( not ( = ?auto_308008 ?auto_308009 ) ) ( not ( = ?auto_308008 ?auto_308010 ) ) ( not ( = ?auto_308008 ?auto_308011 ) ) ( not ( = ?auto_308008 ?auto_308012 ) ) ( not ( = ?auto_308008 ?auto_308013 ) ) ( not ( = ?auto_308008 ?auto_308014 ) ) ( not ( = ?auto_308008 ?auto_308015 ) ) ( not ( = ?auto_308008 ?auto_308016 ) ) ( not ( = ?auto_308008 ?auto_308017 ) ) ( not ( = ?auto_308008 ?auto_308018 ) ) ( not ( = ?auto_308008 ?auto_308019 ) ) ( not ( = ?auto_308008 ?auto_308020 ) ) ( not ( = ?auto_308008 ?auto_308021 ) ) ( not ( = ?auto_308009 ?auto_308010 ) ) ( not ( = ?auto_308009 ?auto_308011 ) ) ( not ( = ?auto_308009 ?auto_308012 ) ) ( not ( = ?auto_308009 ?auto_308013 ) ) ( not ( = ?auto_308009 ?auto_308014 ) ) ( not ( = ?auto_308009 ?auto_308015 ) ) ( not ( = ?auto_308009 ?auto_308016 ) ) ( not ( = ?auto_308009 ?auto_308017 ) ) ( not ( = ?auto_308009 ?auto_308018 ) ) ( not ( = ?auto_308009 ?auto_308019 ) ) ( not ( = ?auto_308009 ?auto_308020 ) ) ( not ( = ?auto_308009 ?auto_308021 ) ) ( not ( = ?auto_308010 ?auto_308011 ) ) ( not ( = ?auto_308010 ?auto_308012 ) ) ( not ( = ?auto_308010 ?auto_308013 ) ) ( not ( = ?auto_308010 ?auto_308014 ) ) ( not ( = ?auto_308010 ?auto_308015 ) ) ( not ( = ?auto_308010 ?auto_308016 ) ) ( not ( = ?auto_308010 ?auto_308017 ) ) ( not ( = ?auto_308010 ?auto_308018 ) ) ( not ( = ?auto_308010 ?auto_308019 ) ) ( not ( = ?auto_308010 ?auto_308020 ) ) ( not ( = ?auto_308010 ?auto_308021 ) ) ( not ( = ?auto_308011 ?auto_308012 ) ) ( not ( = ?auto_308011 ?auto_308013 ) ) ( not ( = ?auto_308011 ?auto_308014 ) ) ( not ( = ?auto_308011 ?auto_308015 ) ) ( not ( = ?auto_308011 ?auto_308016 ) ) ( not ( = ?auto_308011 ?auto_308017 ) ) ( not ( = ?auto_308011 ?auto_308018 ) ) ( not ( = ?auto_308011 ?auto_308019 ) ) ( not ( = ?auto_308011 ?auto_308020 ) ) ( not ( = ?auto_308011 ?auto_308021 ) ) ( not ( = ?auto_308012 ?auto_308013 ) ) ( not ( = ?auto_308012 ?auto_308014 ) ) ( not ( = ?auto_308012 ?auto_308015 ) ) ( not ( = ?auto_308012 ?auto_308016 ) ) ( not ( = ?auto_308012 ?auto_308017 ) ) ( not ( = ?auto_308012 ?auto_308018 ) ) ( not ( = ?auto_308012 ?auto_308019 ) ) ( not ( = ?auto_308012 ?auto_308020 ) ) ( not ( = ?auto_308012 ?auto_308021 ) ) ( not ( = ?auto_308013 ?auto_308014 ) ) ( not ( = ?auto_308013 ?auto_308015 ) ) ( not ( = ?auto_308013 ?auto_308016 ) ) ( not ( = ?auto_308013 ?auto_308017 ) ) ( not ( = ?auto_308013 ?auto_308018 ) ) ( not ( = ?auto_308013 ?auto_308019 ) ) ( not ( = ?auto_308013 ?auto_308020 ) ) ( not ( = ?auto_308013 ?auto_308021 ) ) ( not ( = ?auto_308014 ?auto_308015 ) ) ( not ( = ?auto_308014 ?auto_308016 ) ) ( not ( = ?auto_308014 ?auto_308017 ) ) ( not ( = ?auto_308014 ?auto_308018 ) ) ( not ( = ?auto_308014 ?auto_308019 ) ) ( not ( = ?auto_308014 ?auto_308020 ) ) ( not ( = ?auto_308014 ?auto_308021 ) ) ( not ( = ?auto_308015 ?auto_308016 ) ) ( not ( = ?auto_308015 ?auto_308017 ) ) ( not ( = ?auto_308015 ?auto_308018 ) ) ( not ( = ?auto_308015 ?auto_308019 ) ) ( not ( = ?auto_308015 ?auto_308020 ) ) ( not ( = ?auto_308015 ?auto_308021 ) ) ( not ( = ?auto_308016 ?auto_308017 ) ) ( not ( = ?auto_308016 ?auto_308018 ) ) ( not ( = ?auto_308016 ?auto_308019 ) ) ( not ( = ?auto_308016 ?auto_308020 ) ) ( not ( = ?auto_308016 ?auto_308021 ) ) ( not ( = ?auto_308017 ?auto_308018 ) ) ( not ( = ?auto_308017 ?auto_308019 ) ) ( not ( = ?auto_308017 ?auto_308020 ) ) ( not ( = ?auto_308017 ?auto_308021 ) ) ( not ( = ?auto_308018 ?auto_308019 ) ) ( not ( = ?auto_308018 ?auto_308020 ) ) ( not ( = ?auto_308018 ?auto_308021 ) ) ( not ( = ?auto_308019 ?auto_308020 ) ) ( not ( = ?auto_308019 ?auto_308021 ) ) ( not ( = ?auto_308020 ?auto_308021 ) ) ( ON ?auto_308019 ?auto_308020 ) ( ON ?auto_308018 ?auto_308019 ) ( ON ?auto_308017 ?auto_308018 ) ( ON ?auto_308016 ?auto_308017 ) ( ON ?auto_308015 ?auto_308016 ) ( CLEAR ?auto_308013 ) ( ON ?auto_308014 ?auto_308015 ) ( CLEAR ?auto_308014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_308008 ?auto_308009 ?auto_308010 ?auto_308011 ?auto_308012 ?auto_308013 ?auto_308014 )
      ( MAKE-13PILE ?auto_308008 ?auto_308009 ?auto_308010 ?auto_308011 ?auto_308012 ?auto_308013 ?auto_308014 ?auto_308015 ?auto_308016 ?auto_308017 ?auto_308018 ?auto_308019 ?auto_308020 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308035 - BLOCK
      ?auto_308036 - BLOCK
      ?auto_308037 - BLOCK
      ?auto_308038 - BLOCK
      ?auto_308039 - BLOCK
      ?auto_308040 - BLOCK
      ?auto_308041 - BLOCK
      ?auto_308042 - BLOCK
      ?auto_308043 - BLOCK
      ?auto_308044 - BLOCK
      ?auto_308045 - BLOCK
      ?auto_308046 - BLOCK
      ?auto_308047 - BLOCK
    )
    :vars
    (
      ?auto_308048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308047 ?auto_308048 ) ( ON-TABLE ?auto_308035 ) ( ON ?auto_308036 ?auto_308035 ) ( ON ?auto_308037 ?auto_308036 ) ( ON ?auto_308038 ?auto_308037 ) ( ON ?auto_308039 ?auto_308038 ) ( ON ?auto_308040 ?auto_308039 ) ( not ( = ?auto_308035 ?auto_308036 ) ) ( not ( = ?auto_308035 ?auto_308037 ) ) ( not ( = ?auto_308035 ?auto_308038 ) ) ( not ( = ?auto_308035 ?auto_308039 ) ) ( not ( = ?auto_308035 ?auto_308040 ) ) ( not ( = ?auto_308035 ?auto_308041 ) ) ( not ( = ?auto_308035 ?auto_308042 ) ) ( not ( = ?auto_308035 ?auto_308043 ) ) ( not ( = ?auto_308035 ?auto_308044 ) ) ( not ( = ?auto_308035 ?auto_308045 ) ) ( not ( = ?auto_308035 ?auto_308046 ) ) ( not ( = ?auto_308035 ?auto_308047 ) ) ( not ( = ?auto_308035 ?auto_308048 ) ) ( not ( = ?auto_308036 ?auto_308037 ) ) ( not ( = ?auto_308036 ?auto_308038 ) ) ( not ( = ?auto_308036 ?auto_308039 ) ) ( not ( = ?auto_308036 ?auto_308040 ) ) ( not ( = ?auto_308036 ?auto_308041 ) ) ( not ( = ?auto_308036 ?auto_308042 ) ) ( not ( = ?auto_308036 ?auto_308043 ) ) ( not ( = ?auto_308036 ?auto_308044 ) ) ( not ( = ?auto_308036 ?auto_308045 ) ) ( not ( = ?auto_308036 ?auto_308046 ) ) ( not ( = ?auto_308036 ?auto_308047 ) ) ( not ( = ?auto_308036 ?auto_308048 ) ) ( not ( = ?auto_308037 ?auto_308038 ) ) ( not ( = ?auto_308037 ?auto_308039 ) ) ( not ( = ?auto_308037 ?auto_308040 ) ) ( not ( = ?auto_308037 ?auto_308041 ) ) ( not ( = ?auto_308037 ?auto_308042 ) ) ( not ( = ?auto_308037 ?auto_308043 ) ) ( not ( = ?auto_308037 ?auto_308044 ) ) ( not ( = ?auto_308037 ?auto_308045 ) ) ( not ( = ?auto_308037 ?auto_308046 ) ) ( not ( = ?auto_308037 ?auto_308047 ) ) ( not ( = ?auto_308037 ?auto_308048 ) ) ( not ( = ?auto_308038 ?auto_308039 ) ) ( not ( = ?auto_308038 ?auto_308040 ) ) ( not ( = ?auto_308038 ?auto_308041 ) ) ( not ( = ?auto_308038 ?auto_308042 ) ) ( not ( = ?auto_308038 ?auto_308043 ) ) ( not ( = ?auto_308038 ?auto_308044 ) ) ( not ( = ?auto_308038 ?auto_308045 ) ) ( not ( = ?auto_308038 ?auto_308046 ) ) ( not ( = ?auto_308038 ?auto_308047 ) ) ( not ( = ?auto_308038 ?auto_308048 ) ) ( not ( = ?auto_308039 ?auto_308040 ) ) ( not ( = ?auto_308039 ?auto_308041 ) ) ( not ( = ?auto_308039 ?auto_308042 ) ) ( not ( = ?auto_308039 ?auto_308043 ) ) ( not ( = ?auto_308039 ?auto_308044 ) ) ( not ( = ?auto_308039 ?auto_308045 ) ) ( not ( = ?auto_308039 ?auto_308046 ) ) ( not ( = ?auto_308039 ?auto_308047 ) ) ( not ( = ?auto_308039 ?auto_308048 ) ) ( not ( = ?auto_308040 ?auto_308041 ) ) ( not ( = ?auto_308040 ?auto_308042 ) ) ( not ( = ?auto_308040 ?auto_308043 ) ) ( not ( = ?auto_308040 ?auto_308044 ) ) ( not ( = ?auto_308040 ?auto_308045 ) ) ( not ( = ?auto_308040 ?auto_308046 ) ) ( not ( = ?auto_308040 ?auto_308047 ) ) ( not ( = ?auto_308040 ?auto_308048 ) ) ( not ( = ?auto_308041 ?auto_308042 ) ) ( not ( = ?auto_308041 ?auto_308043 ) ) ( not ( = ?auto_308041 ?auto_308044 ) ) ( not ( = ?auto_308041 ?auto_308045 ) ) ( not ( = ?auto_308041 ?auto_308046 ) ) ( not ( = ?auto_308041 ?auto_308047 ) ) ( not ( = ?auto_308041 ?auto_308048 ) ) ( not ( = ?auto_308042 ?auto_308043 ) ) ( not ( = ?auto_308042 ?auto_308044 ) ) ( not ( = ?auto_308042 ?auto_308045 ) ) ( not ( = ?auto_308042 ?auto_308046 ) ) ( not ( = ?auto_308042 ?auto_308047 ) ) ( not ( = ?auto_308042 ?auto_308048 ) ) ( not ( = ?auto_308043 ?auto_308044 ) ) ( not ( = ?auto_308043 ?auto_308045 ) ) ( not ( = ?auto_308043 ?auto_308046 ) ) ( not ( = ?auto_308043 ?auto_308047 ) ) ( not ( = ?auto_308043 ?auto_308048 ) ) ( not ( = ?auto_308044 ?auto_308045 ) ) ( not ( = ?auto_308044 ?auto_308046 ) ) ( not ( = ?auto_308044 ?auto_308047 ) ) ( not ( = ?auto_308044 ?auto_308048 ) ) ( not ( = ?auto_308045 ?auto_308046 ) ) ( not ( = ?auto_308045 ?auto_308047 ) ) ( not ( = ?auto_308045 ?auto_308048 ) ) ( not ( = ?auto_308046 ?auto_308047 ) ) ( not ( = ?auto_308046 ?auto_308048 ) ) ( not ( = ?auto_308047 ?auto_308048 ) ) ( ON ?auto_308046 ?auto_308047 ) ( ON ?auto_308045 ?auto_308046 ) ( ON ?auto_308044 ?auto_308045 ) ( ON ?auto_308043 ?auto_308044 ) ( ON ?auto_308042 ?auto_308043 ) ( CLEAR ?auto_308040 ) ( ON ?auto_308041 ?auto_308042 ) ( CLEAR ?auto_308041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_308035 ?auto_308036 ?auto_308037 ?auto_308038 ?auto_308039 ?auto_308040 ?auto_308041 )
      ( MAKE-13PILE ?auto_308035 ?auto_308036 ?auto_308037 ?auto_308038 ?auto_308039 ?auto_308040 ?auto_308041 ?auto_308042 ?auto_308043 ?auto_308044 ?auto_308045 ?auto_308046 ?auto_308047 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308062 - BLOCK
      ?auto_308063 - BLOCK
      ?auto_308064 - BLOCK
      ?auto_308065 - BLOCK
      ?auto_308066 - BLOCK
      ?auto_308067 - BLOCK
      ?auto_308068 - BLOCK
      ?auto_308069 - BLOCK
      ?auto_308070 - BLOCK
      ?auto_308071 - BLOCK
      ?auto_308072 - BLOCK
      ?auto_308073 - BLOCK
      ?auto_308074 - BLOCK
    )
    :vars
    (
      ?auto_308075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308074 ?auto_308075 ) ( ON-TABLE ?auto_308062 ) ( ON ?auto_308063 ?auto_308062 ) ( ON ?auto_308064 ?auto_308063 ) ( ON ?auto_308065 ?auto_308064 ) ( ON ?auto_308066 ?auto_308065 ) ( not ( = ?auto_308062 ?auto_308063 ) ) ( not ( = ?auto_308062 ?auto_308064 ) ) ( not ( = ?auto_308062 ?auto_308065 ) ) ( not ( = ?auto_308062 ?auto_308066 ) ) ( not ( = ?auto_308062 ?auto_308067 ) ) ( not ( = ?auto_308062 ?auto_308068 ) ) ( not ( = ?auto_308062 ?auto_308069 ) ) ( not ( = ?auto_308062 ?auto_308070 ) ) ( not ( = ?auto_308062 ?auto_308071 ) ) ( not ( = ?auto_308062 ?auto_308072 ) ) ( not ( = ?auto_308062 ?auto_308073 ) ) ( not ( = ?auto_308062 ?auto_308074 ) ) ( not ( = ?auto_308062 ?auto_308075 ) ) ( not ( = ?auto_308063 ?auto_308064 ) ) ( not ( = ?auto_308063 ?auto_308065 ) ) ( not ( = ?auto_308063 ?auto_308066 ) ) ( not ( = ?auto_308063 ?auto_308067 ) ) ( not ( = ?auto_308063 ?auto_308068 ) ) ( not ( = ?auto_308063 ?auto_308069 ) ) ( not ( = ?auto_308063 ?auto_308070 ) ) ( not ( = ?auto_308063 ?auto_308071 ) ) ( not ( = ?auto_308063 ?auto_308072 ) ) ( not ( = ?auto_308063 ?auto_308073 ) ) ( not ( = ?auto_308063 ?auto_308074 ) ) ( not ( = ?auto_308063 ?auto_308075 ) ) ( not ( = ?auto_308064 ?auto_308065 ) ) ( not ( = ?auto_308064 ?auto_308066 ) ) ( not ( = ?auto_308064 ?auto_308067 ) ) ( not ( = ?auto_308064 ?auto_308068 ) ) ( not ( = ?auto_308064 ?auto_308069 ) ) ( not ( = ?auto_308064 ?auto_308070 ) ) ( not ( = ?auto_308064 ?auto_308071 ) ) ( not ( = ?auto_308064 ?auto_308072 ) ) ( not ( = ?auto_308064 ?auto_308073 ) ) ( not ( = ?auto_308064 ?auto_308074 ) ) ( not ( = ?auto_308064 ?auto_308075 ) ) ( not ( = ?auto_308065 ?auto_308066 ) ) ( not ( = ?auto_308065 ?auto_308067 ) ) ( not ( = ?auto_308065 ?auto_308068 ) ) ( not ( = ?auto_308065 ?auto_308069 ) ) ( not ( = ?auto_308065 ?auto_308070 ) ) ( not ( = ?auto_308065 ?auto_308071 ) ) ( not ( = ?auto_308065 ?auto_308072 ) ) ( not ( = ?auto_308065 ?auto_308073 ) ) ( not ( = ?auto_308065 ?auto_308074 ) ) ( not ( = ?auto_308065 ?auto_308075 ) ) ( not ( = ?auto_308066 ?auto_308067 ) ) ( not ( = ?auto_308066 ?auto_308068 ) ) ( not ( = ?auto_308066 ?auto_308069 ) ) ( not ( = ?auto_308066 ?auto_308070 ) ) ( not ( = ?auto_308066 ?auto_308071 ) ) ( not ( = ?auto_308066 ?auto_308072 ) ) ( not ( = ?auto_308066 ?auto_308073 ) ) ( not ( = ?auto_308066 ?auto_308074 ) ) ( not ( = ?auto_308066 ?auto_308075 ) ) ( not ( = ?auto_308067 ?auto_308068 ) ) ( not ( = ?auto_308067 ?auto_308069 ) ) ( not ( = ?auto_308067 ?auto_308070 ) ) ( not ( = ?auto_308067 ?auto_308071 ) ) ( not ( = ?auto_308067 ?auto_308072 ) ) ( not ( = ?auto_308067 ?auto_308073 ) ) ( not ( = ?auto_308067 ?auto_308074 ) ) ( not ( = ?auto_308067 ?auto_308075 ) ) ( not ( = ?auto_308068 ?auto_308069 ) ) ( not ( = ?auto_308068 ?auto_308070 ) ) ( not ( = ?auto_308068 ?auto_308071 ) ) ( not ( = ?auto_308068 ?auto_308072 ) ) ( not ( = ?auto_308068 ?auto_308073 ) ) ( not ( = ?auto_308068 ?auto_308074 ) ) ( not ( = ?auto_308068 ?auto_308075 ) ) ( not ( = ?auto_308069 ?auto_308070 ) ) ( not ( = ?auto_308069 ?auto_308071 ) ) ( not ( = ?auto_308069 ?auto_308072 ) ) ( not ( = ?auto_308069 ?auto_308073 ) ) ( not ( = ?auto_308069 ?auto_308074 ) ) ( not ( = ?auto_308069 ?auto_308075 ) ) ( not ( = ?auto_308070 ?auto_308071 ) ) ( not ( = ?auto_308070 ?auto_308072 ) ) ( not ( = ?auto_308070 ?auto_308073 ) ) ( not ( = ?auto_308070 ?auto_308074 ) ) ( not ( = ?auto_308070 ?auto_308075 ) ) ( not ( = ?auto_308071 ?auto_308072 ) ) ( not ( = ?auto_308071 ?auto_308073 ) ) ( not ( = ?auto_308071 ?auto_308074 ) ) ( not ( = ?auto_308071 ?auto_308075 ) ) ( not ( = ?auto_308072 ?auto_308073 ) ) ( not ( = ?auto_308072 ?auto_308074 ) ) ( not ( = ?auto_308072 ?auto_308075 ) ) ( not ( = ?auto_308073 ?auto_308074 ) ) ( not ( = ?auto_308073 ?auto_308075 ) ) ( not ( = ?auto_308074 ?auto_308075 ) ) ( ON ?auto_308073 ?auto_308074 ) ( ON ?auto_308072 ?auto_308073 ) ( ON ?auto_308071 ?auto_308072 ) ( ON ?auto_308070 ?auto_308071 ) ( ON ?auto_308069 ?auto_308070 ) ( ON ?auto_308068 ?auto_308069 ) ( CLEAR ?auto_308066 ) ( ON ?auto_308067 ?auto_308068 ) ( CLEAR ?auto_308067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_308062 ?auto_308063 ?auto_308064 ?auto_308065 ?auto_308066 ?auto_308067 )
      ( MAKE-13PILE ?auto_308062 ?auto_308063 ?auto_308064 ?auto_308065 ?auto_308066 ?auto_308067 ?auto_308068 ?auto_308069 ?auto_308070 ?auto_308071 ?auto_308072 ?auto_308073 ?auto_308074 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308089 - BLOCK
      ?auto_308090 - BLOCK
      ?auto_308091 - BLOCK
      ?auto_308092 - BLOCK
      ?auto_308093 - BLOCK
      ?auto_308094 - BLOCK
      ?auto_308095 - BLOCK
      ?auto_308096 - BLOCK
      ?auto_308097 - BLOCK
      ?auto_308098 - BLOCK
      ?auto_308099 - BLOCK
      ?auto_308100 - BLOCK
      ?auto_308101 - BLOCK
    )
    :vars
    (
      ?auto_308102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308101 ?auto_308102 ) ( ON-TABLE ?auto_308089 ) ( ON ?auto_308090 ?auto_308089 ) ( ON ?auto_308091 ?auto_308090 ) ( ON ?auto_308092 ?auto_308091 ) ( ON ?auto_308093 ?auto_308092 ) ( not ( = ?auto_308089 ?auto_308090 ) ) ( not ( = ?auto_308089 ?auto_308091 ) ) ( not ( = ?auto_308089 ?auto_308092 ) ) ( not ( = ?auto_308089 ?auto_308093 ) ) ( not ( = ?auto_308089 ?auto_308094 ) ) ( not ( = ?auto_308089 ?auto_308095 ) ) ( not ( = ?auto_308089 ?auto_308096 ) ) ( not ( = ?auto_308089 ?auto_308097 ) ) ( not ( = ?auto_308089 ?auto_308098 ) ) ( not ( = ?auto_308089 ?auto_308099 ) ) ( not ( = ?auto_308089 ?auto_308100 ) ) ( not ( = ?auto_308089 ?auto_308101 ) ) ( not ( = ?auto_308089 ?auto_308102 ) ) ( not ( = ?auto_308090 ?auto_308091 ) ) ( not ( = ?auto_308090 ?auto_308092 ) ) ( not ( = ?auto_308090 ?auto_308093 ) ) ( not ( = ?auto_308090 ?auto_308094 ) ) ( not ( = ?auto_308090 ?auto_308095 ) ) ( not ( = ?auto_308090 ?auto_308096 ) ) ( not ( = ?auto_308090 ?auto_308097 ) ) ( not ( = ?auto_308090 ?auto_308098 ) ) ( not ( = ?auto_308090 ?auto_308099 ) ) ( not ( = ?auto_308090 ?auto_308100 ) ) ( not ( = ?auto_308090 ?auto_308101 ) ) ( not ( = ?auto_308090 ?auto_308102 ) ) ( not ( = ?auto_308091 ?auto_308092 ) ) ( not ( = ?auto_308091 ?auto_308093 ) ) ( not ( = ?auto_308091 ?auto_308094 ) ) ( not ( = ?auto_308091 ?auto_308095 ) ) ( not ( = ?auto_308091 ?auto_308096 ) ) ( not ( = ?auto_308091 ?auto_308097 ) ) ( not ( = ?auto_308091 ?auto_308098 ) ) ( not ( = ?auto_308091 ?auto_308099 ) ) ( not ( = ?auto_308091 ?auto_308100 ) ) ( not ( = ?auto_308091 ?auto_308101 ) ) ( not ( = ?auto_308091 ?auto_308102 ) ) ( not ( = ?auto_308092 ?auto_308093 ) ) ( not ( = ?auto_308092 ?auto_308094 ) ) ( not ( = ?auto_308092 ?auto_308095 ) ) ( not ( = ?auto_308092 ?auto_308096 ) ) ( not ( = ?auto_308092 ?auto_308097 ) ) ( not ( = ?auto_308092 ?auto_308098 ) ) ( not ( = ?auto_308092 ?auto_308099 ) ) ( not ( = ?auto_308092 ?auto_308100 ) ) ( not ( = ?auto_308092 ?auto_308101 ) ) ( not ( = ?auto_308092 ?auto_308102 ) ) ( not ( = ?auto_308093 ?auto_308094 ) ) ( not ( = ?auto_308093 ?auto_308095 ) ) ( not ( = ?auto_308093 ?auto_308096 ) ) ( not ( = ?auto_308093 ?auto_308097 ) ) ( not ( = ?auto_308093 ?auto_308098 ) ) ( not ( = ?auto_308093 ?auto_308099 ) ) ( not ( = ?auto_308093 ?auto_308100 ) ) ( not ( = ?auto_308093 ?auto_308101 ) ) ( not ( = ?auto_308093 ?auto_308102 ) ) ( not ( = ?auto_308094 ?auto_308095 ) ) ( not ( = ?auto_308094 ?auto_308096 ) ) ( not ( = ?auto_308094 ?auto_308097 ) ) ( not ( = ?auto_308094 ?auto_308098 ) ) ( not ( = ?auto_308094 ?auto_308099 ) ) ( not ( = ?auto_308094 ?auto_308100 ) ) ( not ( = ?auto_308094 ?auto_308101 ) ) ( not ( = ?auto_308094 ?auto_308102 ) ) ( not ( = ?auto_308095 ?auto_308096 ) ) ( not ( = ?auto_308095 ?auto_308097 ) ) ( not ( = ?auto_308095 ?auto_308098 ) ) ( not ( = ?auto_308095 ?auto_308099 ) ) ( not ( = ?auto_308095 ?auto_308100 ) ) ( not ( = ?auto_308095 ?auto_308101 ) ) ( not ( = ?auto_308095 ?auto_308102 ) ) ( not ( = ?auto_308096 ?auto_308097 ) ) ( not ( = ?auto_308096 ?auto_308098 ) ) ( not ( = ?auto_308096 ?auto_308099 ) ) ( not ( = ?auto_308096 ?auto_308100 ) ) ( not ( = ?auto_308096 ?auto_308101 ) ) ( not ( = ?auto_308096 ?auto_308102 ) ) ( not ( = ?auto_308097 ?auto_308098 ) ) ( not ( = ?auto_308097 ?auto_308099 ) ) ( not ( = ?auto_308097 ?auto_308100 ) ) ( not ( = ?auto_308097 ?auto_308101 ) ) ( not ( = ?auto_308097 ?auto_308102 ) ) ( not ( = ?auto_308098 ?auto_308099 ) ) ( not ( = ?auto_308098 ?auto_308100 ) ) ( not ( = ?auto_308098 ?auto_308101 ) ) ( not ( = ?auto_308098 ?auto_308102 ) ) ( not ( = ?auto_308099 ?auto_308100 ) ) ( not ( = ?auto_308099 ?auto_308101 ) ) ( not ( = ?auto_308099 ?auto_308102 ) ) ( not ( = ?auto_308100 ?auto_308101 ) ) ( not ( = ?auto_308100 ?auto_308102 ) ) ( not ( = ?auto_308101 ?auto_308102 ) ) ( ON ?auto_308100 ?auto_308101 ) ( ON ?auto_308099 ?auto_308100 ) ( ON ?auto_308098 ?auto_308099 ) ( ON ?auto_308097 ?auto_308098 ) ( ON ?auto_308096 ?auto_308097 ) ( ON ?auto_308095 ?auto_308096 ) ( CLEAR ?auto_308093 ) ( ON ?auto_308094 ?auto_308095 ) ( CLEAR ?auto_308094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_308089 ?auto_308090 ?auto_308091 ?auto_308092 ?auto_308093 ?auto_308094 )
      ( MAKE-13PILE ?auto_308089 ?auto_308090 ?auto_308091 ?auto_308092 ?auto_308093 ?auto_308094 ?auto_308095 ?auto_308096 ?auto_308097 ?auto_308098 ?auto_308099 ?auto_308100 ?auto_308101 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308116 - BLOCK
      ?auto_308117 - BLOCK
      ?auto_308118 - BLOCK
      ?auto_308119 - BLOCK
      ?auto_308120 - BLOCK
      ?auto_308121 - BLOCK
      ?auto_308122 - BLOCK
      ?auto_308123 - BLOCK
      ?auto_308124 - BLOCK
      ?auto_308125 - BLOCK
      ?auto_308126 - BLOCK
      ?auto_308127 - BLOCK
      ?auto_308128 - BLOCK
    )
    :vars
    (
      ?auto_308129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308128 ?auto_308129 ) ( ON-TABLE ?auto_308116 ) ( ON ?auto_308117 ?auto_308116 ) ( ON ?auto_308118 ?auto_308117 ) ( ON ?auto_308119 ?auto_308118 ) ( not ( = ?auto_308116 ?auto_308117 ) ) ( not ( = ?auto_308116 ?auto_308118 ) ) ( not ( = ?auto_308116 ?auto_308119 ) ) ( not ( = ?auto_308116 ?auto_308120 ) ) ( not ( = ?auto_308116 ?auto_308121 ) ) ( not ( = ?auto_308116 ?auto_308122 ) ) ( not ( = ?auto_308116 ?auto_308123 ) ) ( not ( = ?auto_308116 ?auto_308124 ) ) ( not ( = ?auto_308116 ?auto_308125 ) ) ( not ( = ?auto_308116 ?auto_308126 ) ) ( not ( = ?auto_308116 ?auto_308127 ) ) ( not ( = ?auto_308116 ?auto_308128 ) ) ( not ( = ?auto_308116 ?auto_308129 ) ) ( not ( = ?auto_308117 ?auto_308118 ) ) ( not ( = ?auto_308117 ?auto_308119 ) ) ( not ( = ?auto_308117 ?auto_308120 ) ) ( not ( = ?auto_308117 ?auto_308121 ) ) ( not ( = ?auto_308117 ?auto_308122 ) ) ( not ( = ?auto_308117 ?auto_308123 ) ) ( not ( = ?auto_308117 ?auto_308124 ) ) ( not ( = ?auto_308117 ?auto_308125 ) ) ( not ( = ?auto_308117 ?auto_308126 ) ) ( not ( = ?auto_308117 ?auto_308127 ) ) ( not ( = ?auto_308117 ?auto_308128 ) ) ( not ( = ?auto_308117 ?auto_308129 ) ) ( not ( = ?auto_308118 ?auto_308119 ) ) ( not ( = ?auto_308118 ?auto_308120 ) ) ( not ( = ?auto_308118 ?auto_308121 ) ) ( not ( = ?auto_308118 ?auto_308122 ) ) ( not ( = ?auto_308118 ?auto_308123 ) ) ( not ( = ?auto_308118 ?auto_308124 ) ) ( not ( = ?auto_308118 ?auto_308125 ) ) ( not ( = ?auto_308118 ?auto_308126 ) ) ( not ( = ?auto_308118 ?auto_308127 ) ) ( not ( = ?auto_308118 ?auto_308128 ) ) ( not ( = ?auto_308118 ?auto_308129 ) ) ( not ( = ?auto_308119 ?auto_308120 ) ) ( not ( = ?auto_308119 ?auto_308121 ) ) ( not ( = ?auto_308119 ?auto_308122 ) ) ( not ( = ?auto_308119 ?auto_308123 ) ) ( not ( = ?auto_308119 ?auto_308124 ) ) ( not ( = ?auto_308119 ?auto_308125 ) ) ( not ( = ?auto_308119 ?auto_308126 ) ) ( not ( = ?auto_308119 ?auto_308127 ) ) ( not ( = ?auto_308119 ?auto_308128 ) ) ( not ( = ?auto_308119 ?auto_308129 ) ) ( not ( = ?auto_308120 ?auto_308121 ) ) ( not ( = ?auto_308120 ?auto_308122 ) ) ( not ( = ?auto_308120 ?auto_308123 ) ) ( not ( = ?auto_308120 ?auto_308124 ) ) ( not ( = ?auto_308120 ?auto_308125 ) ) ( not ( = ?auto_308120 ?auto_308126 ) ) ( not ( = ?auto_308120 ?auto_308127 ) ) ( not ( = ?auto_308120 ?auto_308128 ) ) ( not ( = ?auto_308120 ?auto_308129 ) ) ( not ( = ?auto_308121 ?auto_308122 ) ) ( not ( = ?auto_308121 ?auto_308123 ) ) ( not ( = ?auto_308121 ?auto_308124 ) ) ( not ( = ?auto_308121 ?auto_308125 ) ) ( not ( = ?auto_308121 ?auto_308126 ) ) ( not ( = ?auto_308121 ?auto_308127 ) ) ( not ( = ?auto_308121 ?auto_308128 ) ) ( not ( = ?auto_308121 ?auto_308129 ) ) ( not ( = ?auto_308122 ?auto_308123 ) ) ( not ( = ?auto_308122 ?auto_308124 ) ) ( not ( = ?auto_308122 ?auto_308125 ) ) ( not ( = ?auto_308122 ?auto_308126 ) ) ( not ( = ?auto_308122 ?auto_308127 ) ) ( not ( = ?auto_308122 ?auto_308128 ) ) ( not ( = ?auto_308122 ?auto_308129 ) ) ( not ( = ?auto_308123 ?auto_308124 ) ) ( not ( = ?auto_308123 ?auto_308125 ) ) ( not ( = ?auto_308123 ?auto_308126 ) ) ( not ( = ?auto_308123 ?auto_308127 ) ) ( not ( = ?auto_308123 ?auto_308128 ) ) ( not ( = ?auto_308123 ?auto_308129 ) ) ( not ( = ?auto_308124 ?auto_308125 ) ) ( not ( = ?auto_308124 ?auto_308126 ) ) ( not ( = ?auto_308124 ?auto_308127 ) ) ( not ( = ?auto_308124 ?auto_308128 ) ) ( not ( = ?auto_308124 ?auto_308129 ) ) ( not ( = ?auto_308125 ?auto_308126 ) ) ( not ( = ?auto_308125 ?auto_308127 ) ) ( not ( = ?auto_308125 ?auto_308128 ) ) ( not ( = ?auto_308125 ?auto_308129 ) ) ( not ( = ?auto_308126 ?auto_308127 ) ) ( not ( = ?auto_308126 ?auto_308128 ) ) ( not ( = ?auto_308126 ?auto_308129 ) ) ( not ( = ?auto_308127 ?auto_308128 ) ) ( not ( = ?auto_308127 ?auto_308129 ) ) ( not ( = ?auto_308128 ?auto_308129 ) ) ( ON ?auto_308127 ?auto_308128 ) ( ON ?auto_308126 ?auto_308127 ) ( ON ?auto_308125 ?auto_308126 ) ( ON ?auto_308124 ?auto_308125 ) ( ON ?auto_308123 ?auto_308124 ) ( ON ?auto_308122 ?auto_308123 ) ( ON ?auto_308121 ?auto_308122 ) ( CLEAR ?auto_308119 ) ( ON ?auto_308120 ?auto_308121 ) ( CLEAR ?auto_308120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_308116 ?auto_308117 ?auto_308118 ?auto_308119 ?auto_308120 )
      ( MAKE-13PILE ?auto_308116 ?auto_308117 ?auto_308118 ?auto_308119 ?auto_308120 ?auto_308121 ?auto_308122 ?auto_308123 ?auto_308124 ?auto_308125 ?auto_308126 ?auto_308127 ?auto_308128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308143 - BLOCK
      ?auto_308144 - BLOCK
      ?auto_308145 - BLOCK
      ?auto_308146 - BLOCK
      ?auto_308147 - BLOCK
      ?auto_308148 - BLOCK
      ?auto_308149 - BLOCK
      ?auto_308150 - BLOCK
      ?auto_308151 - BLOCK
      ?auto_308152 - BLOCK
      ?auto_308153 - BLOCK
      ?auto_308154 - BLOCK
      ?auto_308155 - BLOCK
    )
    :vars
    (
      ?auto_308156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308155 ?auto_308156 ) ( ON-TABLE ?auto_308143 ) ( ON ?auto_308144 ?auto_308143 ) ( ON ?auto_308145 ?auto_308144 ) ( ON ?auto_308146 ?auto_308145 ) ( not ( = ?auto_308143 ?auto_308144 ) ) ( not ( = ?auto_308143 ?auto_308145 ) ) ( not ( = ?auto_308143 ?auto_308146 ) ) ( not ( = ?auto_308143 ?auto_308147 ) ) ( not ( = ?auto_308143 ?auto_308148 ) ) ( not ( = ?auto_308143 ?auto_308149 ) ) ( not ( = ?auto_308143 ?auto_308150 ) ) ( not ( = ?auto_308143 ?auto_308151 ) ) ( not ( = ?auto_308143 ?auto_308152 ) ) ( not ( = ?auto_308143 ?auto_308153 ) ) ( not ( = ?auto_308143 ?auto_308154 ) ) ( not ( = ?auto_308143 ?auto_308155 ) ) ( not ( = ?auto_308143 ?auto_308156 ) ) ( not ( = ?auto_308144 ?auto_308145 ) ) ( not ( = ?auto_308144 ?auto_308146 ) ) ( not ( = ?auto_308144 ?auto_308147 ) ) ( not ( = ?auto_308144 ?auto_308148 ) ) ( not ( = ?auto_308144 ?auto_308149 ) ) ( not ( = ?auto_308144 ?auto_308150 ) ) ( not ( = ?auto_308144 ?auto_308151 ) ) ( not ( = ?auto_308144 ?auto_308152 ) ) ( not ( = ?auto_308144 ?auto_308153 ) ) ( not ( = ?auto_308144 ?auto_308154 ) ) ( not ( = ?auto_308144 ?auto_308155 ) ) ( not ( = ?auto_308144 ?auto_308156 ) ) ( not ( = ?auto_308145 ?auto_308146 ) ) ( not ( = ?auto_308145 ?auto_308147 ) ) ( not ( = ?auto_308145 ?auto_308148 ) ) ( not ( = ?auto_308145 ?auto_308149 ) ) ( not ( = ?auto_308145 ?auto_308150 ) ) ( not ( = ?auto_308145 ?auto_308151 ) ) ( not ( = ?auto_308145 ?auto_308152 ) ) ( not ( = ?auto_308145 ?auto_308153 ) ) ( not ( = ?auto_308145 ?auto_308154 ) ) ( not ( = ?auto_308145 ?auto_308155 ) ) ( not ( = ?auto_308145 ?auto_308156 ) ) ( not ( = ?auto_308146 ?auto_308147 ) ) ( not ( = ?auto_308146 ?auto_308148 ) ) ( not ( = ?auto_308146 ?auto_308149 ) ) ( not ( = ?auto_308146 ?auto_308150 ) ) ( not ( = ?auto_308146 ?auto_308151 ) ) ( not ( = ?auto_308146 ?auto_308152 ) ) ( not ( = ?auto_308146 ?auto_308153 ) ) ( not ( = ?auto_308146 ?auto_308154 ) ) ( not ( = ?auto_308146 ?auto_308155 ) ) ( not ( = ?auto_308146 ?auto_308156 ) ) ( not ( = ?auto_308147 ?auto_308148 ) ) ( not ( = ?auto_308147 ?auto_308149 ) ) ( not ( = ?auto_308147 ?auto_308150 ) ) ( not ( = ?auto_308147 ?auto_308151 ) ) ( not ( = ?auto_308147 ?auto_308152 ) ) ( not ( = ?auto_308147 ?auto_308153 ) ) ( not ( = ?auto_308147 ?auto_308154 ) ) ( not ( = ?auto_308147 ?auto_308155 ) ) ( not ( = ?auto_308147 ?auto_308156 ) ) ( not ( = ?auto_308148 ?auto_308149 ) ) ( not ( = ?auto_308148 ?auto_308150 ) ) ( not ( = ?auto_308148 ?auto_308151 ) ) ( not ( = ?auto_308148 ?auto_308152 ) ) ( not ( = ?auto_308148 ?auto_308153 ) ) ( not ( = ?auto_308148 ?auto_308154 ) ) ( not ( = ?auto_308148 ?auto_308155 ) ) ( not ( = ?auto_308148 ?auto_308156 ) ) ( not ( = ?auto_308149 ?auto_308150 ) ) ( not ( = ?auto_308149 ?auto_308151 ) ) ( not ( = ?auto_308149 ?auto_308152 ) ) ( not ( = ?auto_308149 ?auto_308153 ) ) ( not ( = ?auto_308149 ?auto_308154 ) ) ( not ( = ?auto_308149 ?auto_308155 ) ) ( not ( = ?auto_308149 ?auto_308156 ) ) ( not ( = ?auto_308150 ?auto_308151 ) ) ( not ( = ?auto_308150 ?auto_308152 ) ) ( not ( = ?auto_308150 ?auto_308153 ) ) ( not ( = ?auto_308150 ?auto_308154 ) ) ( not ( = ?auto_308150 ?auto_308155 ) ) ( not ( = ?auto_308150 ?auto_308156 ) ) ( not ( = ?auto_308151 ?auto_308152 ) ) ( not ( = ?auto_308151 ?auto_308153 ) ) ( not ( = ?auto_308151 ?auto_308154 ) ) ( not ( = ?auto_308151 ?auto_308155 ) ) ( not ( = ?auto_308151 ?auto_308156 ) ) ( not ( = ?auto_308152 ?auto_308153 ) ) ( not ( = ?auto_308152 ?auto_308154 ) ) ( not ( = ?auto_308152 ?auto_308155 ) ) ( not ( = ?auto_308152 ?auto_308156 ) ) ( not ( = ?auto_308153 ?auto_308154 ) ) ( not ( = ?auto_308153 ?auto_308155 ) ) ( not ( = ?auto_308153 ?auto_308156 ) ) ( not ( = ?auto_308154 ?auto_308155 ) ) ( not ( = ?auto_308154 ?auto_308156 ) ) ( not ( = ?auto_308155 ?auto_308156 ) ) ( ON ?auto_308154 ?auto_308155 ) ( ON ?auto_308153 ?auto_308154 ) ( ON ?auto_308152 ?auto_308153 ) ( ON ?auto_308151 ?auto_308152 ) ( ON ?auto_308150 ?auto_308151 ) ( ON ?auto_308149 ?auto_308150 ) ( ON ?auto_308148 ?auto_308149 ) ( CLEAR ?auto_308146 ) ( ON ?auto_308147 ?auto_308148 ) ( CLEAR ?auto_308147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_308143 ?auto_308144 ?auto_308145 ?auto_308146 ?auto_308147 )
      ( MAKE-13PILE ?auto_308143 ?auto_308144 ?auto_308145 ?auto_308146 ?auto_308147 ?auto_308148 ?auto_308149 ?auto_308150 ?auto_308151 ?auto_308152 ?auto_308153 ?auto_308154 ?auto_308155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308170 - BLOCK
      ?auto_308171 - BLOCK
      ?auto_308172 - BLOCK
      ?auto_308173 - BLOCK
      ?auto_308174 - BLOCK
      ?auto_308175 - BLOCK
      ?auto_308176 - BLOCK
      ?auto_308177 - BLOCK
      ?auto_308178 - BLOCK
      ?auto_308179 - BLOCK
      ?auto_308180 - BLOCK
      ?auto_308181 - BLOCK
      ?auto_308182 - BLOCK
    )
    :vars
    (
      ?auto_308183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308182 ?auto_308183 ) ( ON-TABLE ?auto_308170 ) ( ON ?auto_308171 ?auto_308170 ) ( ON ?auto_308172 ?auto_308171 ) ( not ( = ?auto_308170 ?auto_308171 ) ) ( not ( = ?auto_308170 ?auto_308172 ) ) ( not ( = ?auto_308170 ?auto_308173 ) ) ( not ( = ?auto_308170 ?auto_308174 ) ) ( not ( = ?auto_308170 ?auto_308175 ) ) ( not ( = ?auto_308170 ?auto_308176 ) ) ( not ( = ?auto_308170 ?auto_308177 ) ) ( not ( = ?auto_308170 ?auto_308178 ) ) ( not ( = ?auto_308170 ?auto_308179 ) ) ( not ( = ?auto_308170 ?auto_308180 ) ) ( not ( = ?auto_308170 ?auto_308181 ) ) ( not ( = ?auto_308170 ?auto_308182 ) ) ( not ( = ?auto_308170 ?auto_308183 ) ) ( not ( = ?auto_308171 ?auto_308172 ) ) ( not ( = ?auto_308171 ?auto_308173 ) ) ( not ( = ?auto_308171 ?auto_308174 ) ) ( not ( = ?auto_308171 ?auto_308175 ) ) ( not ( = ?auto_308171 ?auto_308176 ) ) ( not ( = ?auto_308171 ?auto_308177 ) ) ( not ( = ?auto_308171 ?auto_308178 ) ) ( not ( = ?auto_308171 ?auto_308179 ) ) ( not ( = ?auto_308171 ?auto_308180 ) ) ( not ( = ?auto_308171 ?auto_308181 ) ) ( not ( = ?auto_308171 ?auto_308182 ) ) ( not ( = ?auto_308171 ?auto_308183 ) ) ( not ( = ?auto_308172 ?auto_308173 ) ) ( not ( = ?auto_308172 ?auto_308174 ) ) ( not ( = ?auto_308172 ?auto_308175 ) ) ( not ( = ?auto_308172 ?auto_308176 ) ) ( not ( = ?auto_308172 ?auto_308177 ) ) ( not ( = ?auto_308172 ?auto_308178 ) ) ( not ( = ?auto_308172 ?auto_308179 ) ) ( not ( = ?auto_308172 ?auto_308180 ) ) ( not ( = ?auto_308172 ?auto_308181 ) ) ( not ( = ?auto_308172 ?auto_308182 ) ) ( not ( = ?auto_308172 ?auto_308183 ) ) ( not ( = ?auto_308173 ?auto_308174 ) ) ( not ( = ?auto_308173 ?auto_308175 ) ) ( not ( = ?auto_308173 ?auto_308176 ) ) ( not ( = ?auto_308173 ?auto_308177 ) ) ( not ( = ?auto_308173 ?auto_308178 ) ) ( not ( = ?auto_308173 ?auto_308179 ) ) ( not ( = ?auto_308173 ?auto_308180 ) ) ( not ( = ?auto_308173 ?auto_308181 ) ) ( not ( = ?auto_308173 ?auto_308182 ) ) ( not ( = ?auto_308173 ?auto_308183 ) ) ( not ( = ?auto_308174 ?auto_308175 ) ) ( not ( = ?auto_308174 ?auto_308176 ) ) ( not ( = ?auto_308174 ?auto_308177 ) ) ( not ( = ?auto_308174 ?auto_308178 ) ) ( not ( = ?auto_308174 ?auto_308179 ) ) ( not ( = ?auto_308174 ?auto_308180 ) ) ( not ( = ?auto_308174 ?auto_308181 ) ) ( not ( = ?auto_308174 ?auto_308182 ) ) ( not ( = ?auto_308174 ?auto_308183 ) ) ( not ( = ?auto_308175 ?auto_308176 ) ) ( not ( = ?auto_308175 ?auto_308177 ) ) ( not ( = ?auto_308175 ?auto_308178 ) ) ( not ( = ?auto_308175 ?auto_308179 ) ) ( not ( = ?auto_308175 ?auto_308180 ) ) ( not ( = ?auto_308175 ?auto_308181 ) ) ( not ( = ?auto_308175 ?auto_308182 ) ) ( not ( = ?auto_308175 ?auto_308183 ) ) ( not ( = ?auto_308176 ?auto_308177 ) ) ( not ( = ?auto_308176 ?auto_308178 ) ) ( not ( = ?auto_308176 ?auto_308179 ) ) ( not ( = ?auto_308176 ?auto_308180 ) ) ( not ( = ?auto_308176 ?auto_308181 ) ) ( not ( = ?auto_308176 ?auto_308182 ) ) ( not ( = ?auto_308176 ?auto_308183 ) ) ( not ( = ?auto_308177 ?auto_308178 ) ) ( not ( = ?auto_308177 ?auto_308179 ) ) ( not ( = ?auto_308177 ?auto_308180 ) ) ( not ( = ?auto_308177 ?auto_308181 ) ) ( not ( = ?auto_308177 ?auto_308182 ) ) ( not ( = ?auto_308177 ?auto_308183 ) ) ( not ( = ?auto_308178 ?auto_308179 ) ) ( not ( = ?auto_308178 ?auto_308180 ) ) ( not ( = ?auto_308178 ?auto_308181 ) ) ( not ( = ?auto_308178 ?auto_308182 ) ) ( not ( = ?auto_308178 ?auto_308183 ) ) ( not ( = ?auto_308179 ?auto_308180 ) ) ( not ( = ?auto_308179 ?auto_308181 ) ) ( not ( = ?auto_308179 ?auto_308182 ) ) ( not ( = ?auto_308179 ?auto_308183 ) ) ( not ( = ?auto_308180 ?auto_308181 ) ) ( not ( = ?auto_308180 ?auto_308182 ) ) ( not ( = ?auto_308180 ?auto_308183 ) ) ( not ( = ?auto_308181 ?auto_308182 ) ) ( not ( = ?auto_308181 ?auto_308183 ) ) ( not ( = ?auto_308182 ?auto_308183 ) ) ( ON ?auto_308181 ?auto_308182 ) ( ON ?auto_308180 ?auto_308181 ) ( ON ?auto_308179 ?auto_308180 ) ( ON ?auto_308178 ?auto_308179 ) ( ON ?auto_308177 ?auto_308178 ) ( ON ?auto_308176 ?auto_308177 ) ( ON ?auto_308175 ?auto_308176 ) ( ON ?auto_308174 ?auto_308175 ) ( CLEAR ?auto_308172 ) ( ON ?auto_308173 ?auto_308174 ) ( CLEAR ?auto_308173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_308170 ?auto_308171 ?auto_308172 ?auto_308173 )
      ( MAKE-13PILE ?auto_308170 ?auto_308171 ?auto_308172 ?auto_308173 ?auto_308174 ?auto_308175 ?auto_308176 ?auto_308177 ?auto_308178 ?auto_308179 ?auto_308180 ?auto_308181 ?auto_308182 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308197 - BLOCK
      ?auto_308198 - BLOCK
      ?auto_308199 - BLOCK
      ?auto_308200 - BLOCK
      ?auto_308201 - BLOCK
      ?auto_308202 - BLOCK
      ?auto_308203 - BLOCK
      ?auto_308204 - BLOCK
      ?auto_308205 - BLOCK
      ?auto_308206 - BLOCK
      ?auto_308207 - BLOCK
      ?auto_308208 - BLOCK
      ?auto_308209 - BLOCK
    )
    :vars
    (
      ?auto_308210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308209 ?auto_308210 ) ( ON-TABLE ?auto_308197 ) ( ON ?auto_308198 ?auto_308197 ) ( ON ?auto_308199 ?auto_308198 ) ( not ( = ?auto_308197 ?auto_308198 ) ) ( not ( = ?auto_308197 ?auto_308199 ) ) ( not ( = ?auto_308197 ?auto_308200 ) ) ( not ( = ?auto_308197 ?auto_308201 ) ) ( not ( = ?auto_308197 ?auto_308202 ) ) ( not ( = ?auto_308197 ?auto_308203 ) ) ( not ( = ?auto_308197 ?auto_308204 ) ) ( not ( = ?auto_308197 ?auto_308205 ) ) ( not ( = ?auto_308197 ?auto_308206 ) ) ( not ( = ?auto_308197 ?auto_308207 ) ) ( not ( = ?auto_308197 ?auto_308208 ) ) ( not ( = ?auto_308197 ?auto_308209 ) ) ( not ( = ?auto_308197 ?auto_308210 ) ) ( not ( = ?auto_308198 ?auto_308199 ) ) ( not ( = ?auto_308198 ?auto_308200 ) ) ( not ( = ?auto_308198 ?auto_308201 ) ) ( not ( = ?auto_308198 ?auto_308202 ) ) ( not ( = ?auto_308198 ?auto_308203 ) ) ( not ( = ?auto_308198 ?auto_308204 ) ) ( not ( = ?auto_308198 ?auto_308205 ) ) ( not ( = ?auto_308198 ?auto_308206 ) ) ( not ( = ?auto_308198 ?auto_308207 ) ) ( not ( = ?auto_308198 ?auto_308208 ) ) ( not ( = ?auto_308198 ?auto_308209 ) ) ( not ( = ?auto_308198 ?auto_308210 ) ) ( not ( = ?auto_308199 ?auto_308200 ) ) ( not ( = ?auto_308199 ?auto_308201 ) ) ( not ( = ?auto_308199 ?auto_308202 ) ) ( not ( = ?auto_308199 ?auto_308203 ) ) ( not ( = ?auto_308199 ?auto_308204 ) ) ( not ( = ?auto_308199 ?auto_308205 ) ) ( not ( = ?auto_308199 ?auto_308206 ) ) ( not ( = ?auto_308199 ?auto_308207 ) ) ( not ( = ?auto_308199 ?auto_308208 ) ) ( not ( = ?auto_308199 ?auto_308209 ) ) ( not ( = ?auto_308199 ?auto_308210 ) ) ( not ( = ?auto_308200 ?auto_308201 ) ) ( not ( = ?auto_308200 ?auto_308202 ) ) ( not ( = ?auto_308200 ?auto_308203 ) ) ( not ( = ?auto_308200 ?auto_308204 ) ) ( not ( = ?auto_308200 ?auto_308205 ) ) ( not ( = ?auto_308200 ?auto_308206 ) ) ( not ( = ?auto_308200 ?auto_308207 ) ) ( not ( = ?auto_308200 ?auto_308208 ) ) ( not ( = ?auto_308200 ?auto_308209 ) ) ( not ( = ?auto_308200 ?auto_308210 ) ) ( not ( = ?auto_308201 ?auto_308202 ) ) ( not ( = ?auto_308201 ?auto_308203 ) ) ( not ( = ?auto_308201 ?auto_308204 ) ) ( not ( = ?auto_308201 ?auto_308205 ) ) ( not ( = ?auto_308201 ?auto_308206 ) ) ( not ( = ?auto_308201 ?auto_308207 ) ) ( not ( = ?auto_308201 ?auto_308208 ) ) ( not ( = ?auto_308201 ?auto_308209 ) ) ( not ( = ?auto_308201 ?auto_308210 ) ) ( not ( = ?auto_308202 ?auto_308203 ) ) ( not ( = ?auto_308202 ?auto_308204 ) ) ( not ( = ?auto_308202 ?auto_308205 ) ) ( not ( = ?auto_308202 ?auto_308206 ) ) ( not ( = ?auto_308202 ?auto_308207 ) ) ( not ( = ?auto_308202 ?auto_308208 ) ) ( not ( = ?auto_308202 ?auto_308209 ) ) ( not ( = ?auto_308202 ?auto_308210 ) ) ( not ( = ?auto_308203 ?auto_308204 ) ) ( not ( = ?auto_308203 ?auto_308205 ) ) ( not ( = ?auto_308203 ?auto_308206 ) ) ( not ( = ?auto_308203 ?auto_308207 ) ) ( not ( = ?auto_308203 ?auto_308208 ) ) ( not ( = ?auto_308203 ?auto_308209 ) ) ( not ( = ?auto_308203 ?auto_308210 ) ) ( not ( = ?auto_308204 ?auto_308205 ) ) ( not ( = ?auto_308204 ?auto_308206 ) ) ( not ( = ?auto_308204 ?auto_308207 ) ) ( not ( = ?auto_308204 ?auto_308208 ) ) ( not ( = ?auto_308204 ?auto_308209 ) ) ( not ( = ?auto_308204 ?auto_308210 ) ) ( not ( = ?auto_308205 ?auto_308206 ) ) ( not ( = ?auto_308205 ?auto_308207 ) ) ( not ( = ?auto_308205 ?auto_308208 ) ) ( not ( = ?auto_308205 ?auto_308209 ) ) ( not ( = ?auto_308205 ?auto_308210 ) ) ( not ( = ?auto_308206 ?auto_308207 ) ) ( not ( = ?auto_308206 ?auto_308208 ) ) ( not ( = ?auto_308206 ?auto_308209 ) ) ( not ( = ?auto_308206 ?auto_308210 ) ) ( not ( = ?auto_308207 ?auto_308208 ) ) ( not ( = ?auto_308207 ?auto_308209 ) ) ( not ( = ?auto_308207 ?auto_308210 ) ) ( not ( = ?auto_308208 ?auto_308209 ) ) ( not ( = ?auto_308208 ?auto_308210 ) ) ( not ( = ?auto_308209 ?auto_308210 ) ) ( ON ?auto_308208 ?auto_308209 ) ( ON ?auto_308207 ?auto_308208 ) ( ON ?auto_308206 ?auto_308207 ) ( ON ?auto_308205 ?auto_308206 ) ( ON ?auto_308204 ?auto_308205 ) ( ON ?auto_308203 ?auto_308204 ) ( ON ?auto_308202 ?auto_308203 ) ( ON ?auto_308201 ?auto_308202 ) ( CLEAR ?auto_308199 ) ( ON ?auto_308200 ?auto_308201 ) ( CLEAR ?auto_308200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_308197 ?auto_308198 ?auto_308199 ?auto_308200 )
      ( MAKE-13PILE ?auto_308197 ?auto_308198 ?auto_308199 ?auto_308200 ?auto_308201 ?auto_308202 ?auto_308203 ?auto_308204 ?auto_308205 ?auto_308206 ?auto_308207 ?auto_308208 ?auto_308209 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308224 - BLOCK
      ?auto_308225 - BLOCK
      ?auto_308226 - BLOCK
      ?auto_308227 - BLOCK
      ?auto_308228 - BLOCK
      ?auto_308229 - BLOCK
      ?auto_308230 - BLOCK
      ?auto_308231 - BLOCK
      ?auto_308232 - BLOCK
      ?auto_308233 - BLOCK
      ?auto_308234 - BLOCK
      ?auto_308235 - BLOCK
      ?auto_308236 - BLOCK
    )
    :vars
    (
      ?auto_308237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308236 ?auto_308237 ) ( ON-TABLE ?auto_308224 ) ( ON ?auto_308225 ?auto_308224 ) ( not ( = ?auto_308224 ?auto_308225 ) ) ( not ( = ?auto_308224 ?auto_308226 ) ) ( not ( = ?auto_308224 ?auto_308227 ) ) ( not ( = ?auto_308224 ?auto_308228 ) ) ( not ( = ?auto_308224 ?auto_308229 ) ) ( not ( = ?auto_308224 ?auto_308230 ) ) ( not ( = ?auto_308224 ?auto_308231 ) ) ( not ( = ?auto_308224 ?auto_308232 ) ) ( not ( = ?auto_308224 ?auto_308233 ) ) ( not ( = ?auto_308224 ?auto_308234 ) ) ( not ( = ?auto_308224 ?auto_308235 ) ) ( not ( = ?auto_308224 ?auto_308236 ) ) ( not ( = ?auto_308224 ?auto_308237 ) ) ( not ( = ?auto_308225 ?auto_308226 ) ) ( not ( = ?auto_308225 ?auto_308227 ) ) ( not ( = ?auto_308225 ?auto_308228 ) ) ( not ( = ?auto_308225 ?auto_308229 ) ) ( not ( = ?auto_308225 ?auto_308230 ) ) ( not ( = ?auto_308225 ?auto_308231 ) ) ( not ( = ?auto_308225 ?auto_308232 ) ) ( not ( = ?auto_308225 ?auto_308233 ) ) ( not ( = ?auto_308225 ?auto_308234 ) ) ( not ( = ?auto_308225 ?auto_308235 ) ) ( not ( = ?auto_308225 ?auto_308236 ) ) ( not ( = ?auto_308225 ?auto_308237 ) ) ( not ( = ?auto_308226 ?auto_308227 ) ) ( not ( = ?auto_308226 ?auto_308228 ) ) ( not ( = ?auto_308226 ?auto_308229 ) ) ( not ( = ?auto_308226 ?auto_308230 ) ) ( not ( = ?auto_308226 ?auto_308231 ) ) ( not ( = ?auto_308226 ?auto_308232 ) ) ( not ( = ?auto_308226 ?auto_308233 ) ) ( not ( = ?auto_308226 ?auto_308234 ) ) ( not ( = ?auto_308226 ?auto_308235 ) ) ( not ( = ?auto_308226 ?auto_308236 ) ) ( not ( = ?auto_308226 ?auto_308237 ) ) ( not ( = ?auto_308227 ?auto_308228 ) ) ( not ( = ?auto_308227 ?auto_308229 ) ) ( not ( = ?auto_308227 ?auto_308230 ) ) ( not ( = ?auto_308227 ?auto_308231 ) ) ( not ( = ?auto_308227 ?auto_308232 ) ) ( not ( = ?auto_308227 ?auto_308233 ) ) ( not ( = ?auto_308227 ?auto_308234 ) ) ( not ( = ?auto_308227 ?auto_308235 ) ) ( not ( = ?auto_308227 ?auto_308236 ) ) ( not ( = ?auto_308227 ?auto_308237 ) ) ( not ( = ?auto_308228 ?auto_308229 ) ) ( not ( = ?auto_308228 ?auto_308230 ) ) ( not ( = ?auto_308228 ?auto_308231 ) ) ( not ( = ?auto_308228 ?auto_308232 ) ) ( not ( = ?auto_308228 ?auto_308233 ) ) ( not ( = ?auto_308228 ?auto_308234 ) ) ( not ( = ?auto_308228 ?auto_308235 ) ) ( not ( = ?auto_308228 ?auto_308236 ) ) ( not ( = ?auto_308228 ?auto_308237 ) ) ( not ( = ?auto_308229 ?auto_308230 ) ) ( not ( = ?auto_308229 ?auto_308231 ) ) ( not ( = ?auto_308229 ?auto_308232 ) ) ( not ( = ?auto_308229 ?auto_308233 ) ) ( not ( = ?auto_308229 ?auto_308234 ) ) ( not ( = ?auto_308229 ?auto_308235 ) ) ( not ( = ?auto_308229 ?auto_308236 ) ) ( not ( = ?auto_308229 ?auto_308237 ) ) ( not ( = ?auto_308230 ?auto_308231 ) ) ( not ( = ?auto_308230 ?auto_308232 ) ) ( not ( = ?auto_308230 ?auto_308233 ) ) ( not ( = ?auto_308230 ?auto_308234 ) ) ( not ( = ?auto_308230 ?auto_308235 ) ) ( not ( = ?auto_308230 ?auto_308236 ) ) ( not ( = ?auto_308230 ?auto_308237 ) ) ( not ( = ?auto_308231 ?auto_308232 ) ) ( not ( = ?auto_308231 ?auto_308233 ) ) ( not ( = ?auto_308231 ?auto_308234 ) ) ( not ( = ?auto_308231 ?auto_308235 ) ) ( not ( = ?auto_308231 ?auto_308236 ) ) ( not ( = ?auto_308231 ?auto_308237 ) ) ( not ( = ?auto_308232 ?auto_308233 ) ) ( not ( = ?auto_308232 ?auto_308234 ) ) ( not ( = ?auto_308232 ?auto_308235 ) ) ( not ( = ?auto_308232 ?auto_308236 ) ) ( not ( = ?auto_308232 ?auto_308237 ) ) ( not ( = ?auto_308233 ?auto_308234 ) ) ( not ( = ?auto_308233 ?auto_308235 ) ) ( not ( = ?auto_308233 ?auto_308236 ) ) ( not ( = ?auto_308233 ?auto_308237 ) ) ( not ( = ?auto_308234 ?auto_308235 ) ) ( not ( = ?auto_308234 ?auto_308236 ) ) ( not ( = ?auto_308234 ?auto_308237 ) ) ( not ( = ?auto_308235 ?auto_308236 ) ) ( not ( = ?auto_308235 ?auto_308237 ) ) ( not ( = ?auto_308236 ?auto_308237 ) ) ( ON ?auto_308235 ?auto_308236 ) ( ON ?auto_308234 ?auto_308235 ) ( ON ?auto_308233 ?auto_308234 ) ( ON ?auto_308232 ?auto_308233 ) ( ON ?auto_308231 ?auto_308232 ) ( ON ?auto_308230 ?auto_308231 ) ( ON ?auto_308229 ?auto_308230 ) ( ON ?auto_308228 ?auto_308229 ) ( ON ?auto_308227 ?auto_308228 ) ( CLEAR ?auto_308225 ) ( ON ?auto_308226 ?auto_308227 ) ( CLEAR ?auto_308226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_308224 ?auto_308225 ?auto_308226 )
      ( MAKE-13PILE ?auto_308224 ?auto_308225 ?auto_308226 ?auto_308227 ?auto_308228 ?auto_308229 ?auto_308230 ?auto_308231 ?auto_308232 ?auto_308233 ?auto_308234 ?auto_308235 ?auto_308236 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308251 - BLOCK
      ?auto_308252 - BLOCK
      ?auto_308253 - BLOCK
      ?auto_308254 - BLOCK
      ?auto_308255 - BLOCK
      ?auto_308256 - BLOCK
      ?auto_308257 - BLOCK
      ?auto_308258 - BLOCK
      ?auto_308259 - BLOCK
      ?auto_308260 - BLOCK
      ?auto_308261 - BLOCK
      ?auto_308262 - BLOCK
      ?auto_308263 - BLOCK
    )
    :vars
    (
      ?auto_308264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308263 ?auto_308264 ) ( ON-TABLE ?auto_308251 ) ( ON ?auto_308252 ?auto_308251 ) ( not ( = ?auto_308251 ?auto_308252 ) ) ( not ( = ?auto_308251 ?auto_308253 ) ) ( not ( = ?auto_308251 ?auto_308254 ) ) ( not ( = ?auto_308251 ?auto_308255 ) ) ( not ( = ?auto_308251 ?auto_308256 ) ) ( not ( = ?auto_308251 ?auto_308257 ) ) ( not ( = ?auto_308251 ?auto_308258 ) ) ( not ( = ?auto_308251 ?auto_308259 ) ) ( not ( = ?auto_308251 ?auto_308260 ) ) ( not ( = ?auto_308251 ?auto_308261 ) ) ( not ( = ?auto_308251 ?auto_308262 ) ) ( not ( = ?auto_308251 ?auto_308263 ) ) ( not ( = ?auto_308251 ?auto_308264 ) ) ( not ( = ?auto_308252 ?auto_308253 ) ) ( not ( = ?auto_308252 ?auto_308254 ) ) ( not ( = ?auto_308252 ?auto_308255 ) ) ( not ( = ?auto_308252 ?auto_308256 ) ) ( not ( = ?auto_308252 ?auto_308257 ) ) ( not ( = ?auto_308252 ?auto_308258 ) ) ( not ( = ?auto_308252 ?auto_308259 ) ) ( not ( = ?auto_308252 ?auto_308260 ) ) ( not ( = ?auto_308252 ?auto_308261 ) ) ( not ( = ?auto_308252 ?auto_308262 ) ) ( not ( = ?auto_308252 ?auto_308263 ) ) ( not ( = ?auto_308252 ?auto_308264 ) ) ( not ( = ?auto_308253 ?auto_308254 ) ) ( not ( = ?auto_308253 ?auto_308255 ) ) ( not ( = ?auto_308253 ?auto_308256 ) ) ( not ( = ?auto_308253 ?auto_308257 ) ) ( not ( = ?auto_308253 ?auto_308258 ) ) ( not ( = ?auto_308253 ?auto_308259 ) ) ( not ( = ?auto_308253 ?auto_308260 ) ) ( not ( = ?auto_308253 ?auto_308261 ) ) ( not ( = ?auto_308253 ?auto_308262 ) ) ( not ( = ?auto_308253 ?auto_308263 ) ) ( not ( = ?auto_308253 ?auto_308264 ) ) ( not ( = ?auto_308254 ?auto_308255 ) ) ( not ( = ?auto_308254 ?auto_308256 ) ) ( not ( = ?auto_308254 ?auto_308257 ) ) ( not ( = ?auto_308254 ?auto_308258 ) ) ( not ( = ?auto_308254 ?auto_308259 ) ) ( not ( = ?auto_308254 ?auto_308260 ) ) ( not ( = ?auto_308254 ?auto_308261 ) ) ( not ( = ?auto_308254 ?auto_308262 ) ) ( not ( = ?auto_308254 ?auto_308263 ) ) ( not ( = ?auto_308254 ?auto_308264 ) ) ( not ( = ?auto_308255 ?auto_308256 ) ) ( not ( = ?auto_308255 ?auto_308257 ) ) ( not ( = ?auto_308255 ?auto_308258 ) ) ( not ( = ?auto_308255 ?auto_308259 ) ) ( not ( = ?auto_308255 ?auto_308260 ) ) ( not ( = ?auto_308255 ?auto_308261 ) ) ( not ( = ?auto_308255 ?auto_308262 ) ) ( not ( = ?auto_308255 ?auto_308263 ) ) ( not ( = ?auto_308255 ?auto_308264 ) ) ( not ( = ?auto_308256 ?auto_308257 ) ) ( not ( = ?auto_308256 ?auto_308258 ) ) ( not ( = ?auto_308256 ?auto_308259 ) ) ( not ( = ?auto_308256 ?auto_308260 ) ) ( not ( = ?auto_308256 ?auto_308261 ) ) ( not ( = ?auto_308256 ?auto_308262 ) ) ( not ( = ?auto_308256 ?auto_308263 ) ) ( not ( = ?auto_308256 ?auto_308264 ) ) ( not ( = ?auto_308257 ?auto_308258 ) ) ( not ( = ?auto_308257 ?auto_308259 ) ) ( not ( = ?auto_308257 ?auto_308260 ) ) ( not ( = ?auto_308257 ?auto_308261 ) ) ( not ( = ?auto_308257 ?auto_308262 ) ) ( not ( = ?auto_308257 ?auto_308263 ) ) ( not ( = ?auto_308257 ?auto_308264 ) ) ( not ( = ?auto_308258 ?auto_308259 ) ) ( not ( = ?auto_308258 ?auto_308260 ) ) ( not ( = ?auto_308258 ?auto_308261 ) ) ( not ( = ?auto_308258 ?auto_308262 ) ) ( not ( = ?auto_308258 ?auto_308263 ) ) ( not ( = ?auto_308258 ?auto_308264 ) ) ( not ( = ?auto_308259 ?auto_308260 ) ) ( not ( = ?auto_308259 ?auto_308261 ) ) ( not ( = ?auto_308259 ?auto_308262 ) ) ( not ( = ?auto_308259 ?auto_308263 ) ) ( not ( = ?auto_308259 ?auto_308264 ) ) ( not ( = ?auto_308260 ?auto_308261 ) ) ( not ( = ?auto_308260 ?auto_308262 ) ) ( not ( = ?auto_308260 ?auto_308263 ) ) ( not ( = ?auto_308260 ?auto_308264 ) ) ( not ( = ?auto_308261 ?auto_308262 ) ) ( not ( = ?auto_308261 ?auto_308263 ) ) ( not ( = ?auto_308261 ?auto_308264 ) ) ( not ( = ?auto_308262 ?auto_308263 ) ) ( not ( = ?auto_308262 ?auto_308264 ) ) ( not ( = ?auto_308263 ?auto_308264 ) ) ( ON ?auto_308262 ?auto_308263 ) ( ON ?auto_308261 ?auto_308262 ) ( ON ?auto_308260 ?auto_308261 ) ( ON ?auto_308259 ?auto_308260 ) ( ON ?auto_308258 ?auto_308259 ) ( ON ?auto_308257 ?auto_308258 ) ( ON ?auto_308256 ?auto_308257 ) ( ON ?auto_308255 ?auto_308256 ) ( ON ?auto_308254 ?auto_308255 ) ( CLEAR ?auto_308252 ) ( ON ?auto_308253 ?auto_308254 ) ( CLEAR ?auto_308253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_308251 ?auto_308252 ?auto_308253 )
      ( MAKE-13PILE ?auto_308251 ?auto_308252 ?auto_308253 ?auto_308254 ?auto_308255 ?auto_308256 ?auto_308257 ?auto_308258 ?auto_308259 ?auto_308260 ?auto_308261 ?auto_308262 ?auto_308263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308278 - BLOCK
      ?auto_308279 - BLOCK
      ?auto_308280 - BLOCK
      ?auto_308281 - BLOCK
      ?auto_308282 - BLOCK
      ?auto_308283 - BLOCK
      ?auto_308284 - BLOCK
      ?auto_308285 - BLOCK
      ?auto_308286 - BLOCK
      ?auto_308287 - BLOCK
      ?auto_308288 - BLOCK
      ?auto_308289 - BLOCK
      ?auto_308290 - BLOCK
    )
    :vars
    (
      ?auto_308291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308290 ?auto_308291 ) ( ON-TABLE ?auto_308278 ) ( not ( = ?auto_308278 ?auto_308279 ) ) ( not ( = ?auto_308278 ?auto_308280 ) ) ( not ( = ?auto_308278 ?auto_308281 ) ) ( not ( = ?auto_308278 ?auto_308282 ) ) ( not ( = ?auto_308278 ?auto_308283 ) ) ( not ( = ?auto_308278 ?auto_308284 ) ) ( not ( = ?auto_308278 ?auto_308285 ) ) ( not ( = ?auto_308278 ?auto_308286 ) ) ( not ( = ?auto_308278 ?auto_308287 ) ) ( not ( = ?auto_308278 ?auto_308288 ) ) ( not ( = ?auto_308278 ?auto_308289 ) ) ( not ( = ?auto_308278 ?auto_308290 ) ) ( not ( = ?auto_308278 ?auto_308291 ) ) ( not ( = ?auto_308279 ?auto_308280 ) ) ( not ( = ?auto_308279 ?auto_308281 ) ) ( not ( = ?auto_308279 ?auto_308282 ) ) ( not ( = ?auto_308279 ?auto_308283 ) ) ( not ( = ?auto_308279 ?auto_308284 ) ) ( not ( = ?auto_308279 ?auto_308285 ) ) ( not ( = ?auto_308279 ?auto_308286 ) ) ( not ( = ?auto_308279 ?auto_308287 ) ) ( not ( = ?auto_308279 ?auto_308288 ) ) ( not ( = ?auto_308279 ?auto_308289 ) ) ( not ( = ?auto_308279 ?auto_308290 ) ) ( not ( = ?auto_308279 ?auto_308291 ) ) ( not ( = ?auto_308280 ?auto_308281 ) ) ( not ( = ?auto_308280 ?auto_308282 ) ) ( not ( = ?auto_308280 ?auto_308283 ) ) ( not ( = ?auto_308280 ?auto_308284 ) ) ( not ( = ?auto_308280 ?auto_308285 ) ) ( not ( = ?auto_308280 ?auto_308286 ) ) ( not ( = ?auto_308280 ?auto_308287 ) ) ( not ( = ?auto_308280 ?auto_308288 ) ) ( not ( = ?auto_308280 ?auto_308289 ) ) ( not ( = ?auto_308280 ?auto_308290 ) ) ( not ( = ?auto_308280 ?auto_308291 ) ) ( not ( = ?auto_308281 ?auto_308282 ) ) ( not ( = ?auto_308281 ?auto_308283 ) ) ( not ( = ?auto_308281 ?auto_308284 ) ) ( not ( = ?auto_308281 ?auto_308285 ) ) ( not ( = ?auto_308281 ?auto_308286 ) ) ( not ( = ?auto_308281 ?auto_308287 ) ) ( not ( = ?auto_308281 ?auto_308288 ) ) ( not ( = ?auto_308281 ?auto_308289 ) ) ( not ( = ?auto_308281 ?auto_308290 ) ) ( not ( = ?auto_308281 ?auto_308291 ) ) ( not ( = ?auto_308282 ?auto_308283 ) ) ( not ( = ?auto_308282 ?auto_308284 ) ) ( not ( = ?auto_308282 ?auto_308285 ) ) ( not ( = ?auto_308282 ?auto_308286 ) ) ( not ( = ?auto_308282 ?auto_308287 ) ) ( not ( = ?auto_308282 ?auto_308288 ) ) ( not ( = ?auto_308282 ?auto_308289 ) ) ( not ( = ?auto_308282 ?auto_308290 ) ) ( not ( = ?auto_308282 ?auto_308291 ) ) ( not ( = ?auto_308283 ?auto_308284 ) ) ( not ( = ?auto_308283 ?auto_308285 ) ) ( not ( = ?auto_308283 ?auto_308286 ) ) ( not ( = ?auto_308283 ?auto_308287 ) ) ( not ( = ?auto_308283 ?auto_308288 ) ) ( not ( = ?auto_308283 ?auto_308289 ) ) ( not ( = ?auto_308283 ?auto_308290 ) ) ( not ( = ?auto_308283 ?auto_308291 ) ) ( not ( = ?auto_308284 ?auto_308285 ) ) ( not ( = ?auto_308284 ?auto_308286 ) ) ( not ( = ?auto_308284 ?auto_308287 ) ) ( not ( = ?auto_308284 ?auto_308288 ) ) ( not ( = ?auto_308284 ?auto_308289 ) ) ( not ( = ?auto_308284 ?auto_308290 ) ) ( not ( = ?auto_308284 ?auto_308291 ) ) ( not ( = ?auto_308285 ?auto_308286 ) ) ( not ( = ?auto_308285 ?auto_308287 ) ) ( not ( = ?auto_308285 ?auto_308288 ) ) ( not ( = ?auto_308285 ?auto_308289 ) ) ( not ( = ?auto_308285 ?auto_308290 ) ) ( not ( = ?auto_308285 ?auto_308291 ) ) ( not ( = ?auto_308286 ?auto_308287 ) ) ( not ( = ?auto_308286 ?auto_308288 ) ) ( not ( = ?auto_308286 ?auto_308289 ) ) ( not ( = ?auto_308286 ?auto_308290 ) ) ( not ( = ?auto_308286 ?auto_308291 ) ) ( not ( = ?auto_308287 ?auto_308288 ) ) ( not ( = ?auto_308287 ?auto_308289 ) ) ( not ( = ?auto_308287 ?auto_308290 ) ) ( not ( = ?auto_308287 ?auto_308291 ) ) ( not ( = ?auto_308288 ?auto_308289 ) ) ( not ( = ?auto_308288 ?auto_308290 ) ) ( not ( = ?auto_308288 ?auto_308291 ) ) ( not ( = ?auto_308289 ?auto_308290 ) ) ( not ( = ?auto_308289 ?auto_308291 ) ) ( not ( = ?auto_308290 ?auto_308291 ) ) ( ON ?auto_308289 ?auto_308290 ) ( ON ?auto_308288 ?auto_308289 ) ( ON ?auto_308287 ?auto_308288 ) ( ON ?auto_308286 ?auto_308287 ) ( ON ?auto_308285 ?auto_308286 ) ( ON ?auto_308284 ?auto_308285 ) ( ON ?auto_308283 ?auto_308284 ) ( ON ?auto_308282 ?auto_308283 ) ( ON ?auto_308281 ?auto_308282 ) ( ON ?auto_308280 ?auto_308281 ) ( CLEAR ?auto_308278 ) ( ON ?auto_308279 ?auto_308280 ) ( CLEAR ?auto_308279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_308278 ?auto_308279 )
      ( MAKE-13PILE ?auto_308278 ?auto_308279 ?auto_308280 ?auto_308281 ?auto_308282 ?auto_308283 ?auto_308284 ?auto_308285 ?auto_308286 ?auto_308287 ?auto_308288 ?auto_308289 ?auto_308290 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308305 - BLOCK
      ?auto_308306 - BLOCK
      ?auto_308307 - BLOCK
      ?auto_308308 - BLOCK
      ?auto_308309 - BLOCK
      ?auto_308310 - BLOCK
      ?auto_308311 - BLOCK
      ?auto_308312 - BLOCK
      ?auto_308313 - BLOCK
      ?auto_308314 - BLOCK
      ?auto_308315 - BLOCK
      ?auto_308316 - BLOCK
      ?auto_308317 - BLOCK
    )
    :vars
    (
      ?auto_308318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308317 ?auto_308318 ) ( ON-TABLE ?auto_308305 ) ( not ( = ?auto_308305 ?auto_308306 ) ) ( not ( = ?auto_308305 ?auto_308307 ) ) ( not ( = ?auto_308305 ?auto_308308 ) ) ( not ( = ?auto_308305 ?auto_308309 ) ) ( not ( = ?auto_308305 ?auto_308310 ) ) ( not ( = ?auto_308305 ?auto_308311 ) ) ( not ( = ?auto_308305 ?auto_308312 ) ) ( not ( = ?auto_308305 ?auto_308313 ) ) ( not ( = ?auto_308305 ?auto_308314 ) ) ( not ( = ?auto_308305 ?auto_308315 ) ) ( not ( = ?auto_308305 ?auto_308316 ) ) ( not ( = ?auto_308305 ?auto_308317 ) ) ( not ( = ?auto_308305 ?auto_308318 ) ) ( not ( = ?auto_308306 ?auto_308307 ) ) ( not ( = ?auto_308306 ?auto_308308 ) ) ( not ( = ?auto_308306 ?auto_308309 ) ) ( not ( = ?auto_308306 ?auto_308310 ) ) ( not ( = ?auto_308306 ?auto_308311 ) ) ( not ( = ?auto_308306 ?auto_308312 ) ) ( not ( = ?auto_308306 ?auto_308313 ) ) ( not ( = ?auto_308306 ?auto_308314 ) ) ( not ( = ?auto_308306 ?auto_308315 ) ) ( not ( = ?auto_308306 ?auto_308316 ) ) ( not ( = ?auto_308306 ?auto_308317 ) ) ( not ( = ?auto_308306 ?auto_308318 ) ) ( not ( = ?auto_308307 ?auto_308308 ) ) ( not ( = ?auto_308307 ?auto_308309 ) ) ( not ( = ?auto_308307 ?auto_308310 ) ) ( not ( = ?auto_308307 ?auto_308311 ) ) ( not ( = ?auto_308307 ?auto_308312 ) ) ( not ( = ?auto_308307 ?auto_308313 ) ) ( not ( = ?auto_308307 ?auto_308314 ) ) ( not ( = ?auto_308307 ?auto_308315 ) ) ( not ( = ?auto_308307 ?auto_308316 ) ) ( not ( = ?auto_308307 ?auto_308317 ) ) ( not ( = ?auto_308307 ?auto_308318 ) ) ( not ( = ?auto_308308 ?auto_308309 ) ) ( not ( = ?auto_308308 ?auto_308310 ) ) ( not ( = ?auto_308308 ?auto_308311 ) ) ( not ( = ?auto_308308 ?auto_308312 ) ) ( not ( = ?auto_308308 ?auto_308313 ) ) ( not ( = ?auto_308308 ?auto_308314 ) ) ( not ( = ?auto_308308 ?auto_308315 ) ) ( not ( = ?auto_308308 ?auto_308316 ) ) ( not ( = ?auto_308308 ?auto_308317 ) ) ( not ( = ?auto_308308 ?auto_308318 ) ) ( not ( = ?auto_308309 ?auto_308310 ) ) ( not ( = ?auto_308309 ?auto_308311 ) ) ( not ( = ?auto_308309 ?auto_308312 ) ) ( not ( = ?auto_308309 ?auto_308313 ) ) ( not ( = ?auto_308309 ?auto_308314 ) ) ( not ( = ?auto_308309 ?auto_308315 ) ) ( not ( = ?auto_308309 ?auto_308316 ) ) ( not ( = ?auto_308309 ?auto_308317 ) ) ( not ( = ?auto_308309 ?auto_308318 ) ) ( not ( = ?auto_308310 ?auto_308311 ) ) ( not ( = ?auto_308310 ?auto_308312 ) ) ( not ( = ?auto_308310 ?auto_308313 ) ) ( not ( = ?auto_308310 ?auto_308314 ) ) ( not ( = ?auto_308310 ?auto_308315 ) ) ( not ( = ?auto_308310 ?auto_308316 ) ) ( not ( = ?auto_308310 ?auto_308317 ) ) ( not ( = ?auto_308310 ?auto_308318 ) ) ( not ( = ?auto_308311 ?auto_308312 ) ) ( not ( = ?auto_308311 ?auto_308313 ) ) ( not ( = ?auto_308311 ?auto_308314 ) ) ( not ( = ?auto_308311 ?auto_308315 ) ) ( not ( = ?auto_308311 ?auto_308316 ) ) ( not ( = ?auto_308311 ?auto_308317 ) ) ( not ( = ?auto_308311 ?auto_308318 ) ) ( not ( = ?auto_308312 ?auto_308313 ) ) ( not ( = ?auto_308312 ?auto_308314 ) ) ( not ( = ?auto_308312 ?auto_308315 ) ) ( not ( = ?auto_308312 ?auto_308316 ) ) ( not ( = ?auto_308312 ?auto_308317 ) ) ( not ( = ?auto_308312 ?auto_308318 ) ) ( not ( = ?auto_308313 ?auto_308314 ) ) ( not ( = ?auto_308313 ?auto_308315 ) ) ( not ( = ?auto_308313 ?auto_308316 ) ) ( not ( = ?auto_308313 ?auto_308317 ) ) ( not ( = ?auto_308313 ?auto_308318 ) ) ( not ( = ?auto_308314 ?auto_308315 ) ) ( not ( = ?auto_308314 ?auto_308316 ) ) ( not ( = ?auto_308314 ?auto_308317 ) ) ( not ( = ?auto_308314 ?auto_308318 ) ) ( not ( = ?auto_308315 ?auto_308316 ) ) ( not ( = ?auto_308315 ?auto_308317 ) ) ( not ( = ?auto_308315 ?auto_308318 ) ) ( not ( = ?auto_308316 ?auto_308317 ) ) ( not ( = ?auto_308316 ?auto_308318 ) ) ( not ( = ?auto_308317 ?auto_308318 ) ) ( ON ?auto_308316 ?auto_308317 ) ( ON ?auto_308315 ?auto_308316 ) ( ON ?auto_308314 ?auto_308315 ) ( ON ?auto_308313 ?auto_308314 ) ( ON ?auto_308312 ?auto_308313 ) ( ON ?auto_308311 ?auto_308312 ) ( ON ?auto_308310 ?auto_308311 ) ( ON ?auto_308309 ?auto_308310 ) ( ON ?auto_308308 ?auto_308309 ) ( ON ?auto_308307 ?auto_308308 ) ( CLEAR ?auto_308305 ) ( ON ?auto_308306 ?auto_308307 ) ( CLEAR ?auto_308306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_308305 ?auto_308306 )
      ( MAKE-13PILE ?auto_308305 ?auto_308306 ?auto_308307 ?auto_308308 ?auto_308309 ?auto_308310 ?auto_308311 ?auto_308312 ?auto_308313 ?auto_308314 ?auto_308315 ?auto_308316 ?auto_308317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308332 - BLOCK
      ?auto_308333 - BLOCK
      ?auto_308334 - BLOCK
      ?auto_308335 - BLOCK
      ?auto_308336 - BLOCK
      ?auto_308337 - BLOCK
      ?auto_308338 - BLOCK
      ?auto_308339 - BLOCK
      ?auto_308340 - BLOCK
      ?auto_308341 - BLOCK
      ?auto_308342 - BLOCK
      ?auto_308343 - BLOCK
      ?auto_308344 - BLOCK
    )
    :vars
    (
      ?auto_308345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308344 ?auto_308345 ) ( not ( = ?auto_308332 ?auto_308333 ) ) ( not ( = ?auto_308332 ?auto_308334 ) ) ( not ( = ?auto_308332 ?auto_308335 ) ) ( not ( = ?auto_308332 ?auto_308336 ) ) ( not ( = ?auto_308332 ?auto_308337 ) ) ( not ( = ?auto_308332 ?auto_308338 ) ) ( not ( = ?auto_308332 ?auto_308339 ) ) ( not ( = ?auto_308332 ?auto_308340 ) ) ( not ( = ?auto_308332 ?auto_308341 ) ) ( not ( = ?auto_308332 ?auto_308342 ) ) ( not ( = ?auto_308332 ?auto_308343 ) ) ( not ( = ?auto_308332 ?auto_308344 ) ) ( not ( = ?auto_308332 ?auto_308345 ) ) ( not ( = ?auto_308333 ?auto_308334 ) ) ( not ( = ?auto_308333 ?auto_308335 ) ) ( not ( = ?auto_308333 ?auto_308336 ) ) ( not ( = ?auto_308333 ?auto_308337 ) ) ( not ( = ?auto_308333 ?auto_308338 ) ) ( not ( = ?auto_308333 ?auto_308339 ) ) ( not ( = ?auto_308333 ?auto_308340 ) ) ( not ( = ?auto_308333 ?auto_308341 ) ) ( not ( = ?auto_308333 ?auto_308342 ) ) ( not ( = ?auto_308333 ?auto_308343 ) ) ( not ( = ?auto_308333 ?auto_308344 ) ) ( not ( = ?auto_308333 ?auto_308345 ) ) ( not ( = ?auto_308334 ?auto_308335 ) ) ( not ( = ?auto_308334 ?auto_308336 ) ) ( not ( = ?auto_308334 ?auto_308337 ) ) ( not ( = ?auto_308334 ?auto_308338 ) ) ( not ( = ?auto_308334 ?auto_308339 ) ) ( not ( = ?auto_308334 ?auto_308340 ) ) ( not ( = ?auto_308334 ?auto_308341 ) ) ( not ( = ?auto_308334 ?auto_308342 ) ) ( not ( = ?auto_308334 ?auto_308343 ) ) ( not ( = ?auto_308334 ?auto_308344 ) ) ( not ( = ?auto_308334 ?auto_308345 ) ) ( not ( = ?auto_308335 ?auto_308336 ) ) ( not ( = ?auto_308335 ?auto_308337 ) ) ( not ( = ?auto_308335 ?auto_308338 ) ) ( not ( = ?auto_308335 ?auto_308339 ) ) ( not ( = ?auto_308335 ?auto_308340 ) ) ( not ( = ?auto_308335 ?auto_308341 ) ) ( not ( = ?auto_308335 ?auto_308342 ) ) ( not ( = ?auto_308335 ?auto_308343 ) ) ( not ( = ?auto_308335 ?auto_308344 ) ) ( not ( = ?auto_308335 ?auto_308345 ) ) ( not ( = ?auto_308336 ?auto_308337 ) ) ( not ( = ?auto_308336 ?auto_308338 ) ) ( not ( = ?auto_308336 ?auto_308339 ) ) ( not ( = ?auto_308336 ?auto_308340 ) ) ( not ( = ?auto_308336 ?auto_308341 ) ) ( not ( = ?auto_308336 ?auto_308342 ) ) ( not ( = ?auto_308336 ?auto_308343 ) ) ( not ( = ?auto_308336 ?auto_308344 ) ) ( not ( = ?auto_308336 ?auto_308345 ) ) ( not ( = ?auto_308337 ?auto_308338 ) ) ( not ( = ?auto_308337 ?auto_308339 ) ) ( not ( = ?auto_308337 ?auto_308340 ) ) ( not ( = ?auto_308337 ?auto_308341 ) ) ( not ( = ?auto_308337 ?auto_308342 ) ) ( not ( = ?auto_308337 ?auto_308343 ) ) ( not ( = ?auto_308337 ?auto_308344 ) ) ( not ( = ?auto_308337 ?auto_308345 ) ) ( not ( = ?auto_308338 ?auto_308339 ) ) ( not ( = ?auto_308338 ?auto_308340 ) ) ( not ( = ?auto_308338 ?auto_308341 ) ) ( not ( = ?auto_308338 ?auto_308342 ) ) ( not ( = ?auto_308338 ?auto_308343 ) ) ( not ( = ?auto_308338 ?auto_308344 ) ) ( not ( = ?auto_308338 ?auto_308345 ) ) ( not ( = ?auto_308339 ?auto_308340 ) ) ( not ( = ?auto_308339 ?auto_308341 ) ) ( not ( = ?auto_308339 ?auto_308342 ) ) ( not ( = ?auto_308339 ?auto_308343 ) ) ( not ( = ?auto_308339 ?auto_308344 ) ) ( not ( = ?auto_308339 ?auto_308345 ) ) ( not ( = ?auto_308340 ?auto_308341 ) ) ( not ( = ?auto_308340 ?auto_308342 ) ) ( not ( = ?auto_308340 ?auto_308343 ) ) ( not ( = ?auto_308340 ?auto_308344 ) ) ( not ( = ?auto_308340 ?auto_308345 ) ) ( not ( = ?auto_308341 ?auto_308342 ) ) ( not ( = ?auto_308341 ?auto_308343 ) ) ( not ( = ?auto_308341 ?auto_308344 ) ) ( not ( = ?auto_308341 ?auto_308345 ) ) ( not ( = ?auto_308342 ?auto_308343 ) ) ( not ( = ?auto_308342 ?auto_308344 ) ) ( not ( = ?auto_308342 ?auto_308345 ) ) ( not ( = ?auto_308343 ?auto_308344 ) ) ( not ( = ?auto_308343 ?auto_308345 ) ) ( not ( = ?auto_308344 ?auto_308345 ) ) ( ON ?auto_308343 ?auto_308344 ) ( ON ?auto_308342 ?auto_308343 ) ( ON ?auto_308341 ?auto_308342 ) ( ON ?auto_308340 ?auto_308341 ) ( ON ?auto_308339 ?auto_308340 ) ( ON ?auto_308338 ?auto_308339 ) ( ON ?auto_308337 ?auto_308338 ) ( ON ?auto_308336 ?auto_308337 ) ( ON ?auto_308335 ?auto_308336 ) ( ON ?auto_308334 ?auto_308335 ) ( ON ?auto_308333 ?auto_308334 ) ( ON ?auto_308332 ?auto_308333 ) ( CLEAR ?auto_308332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_308332 )
      ( MAKE-13PILE ?auto_308332 ?auto_308333 ?auto_308334 ?auto_308335 ?auto_308336 ?auto_308337 ?auto_308338 ?auto_308339 ?auto_308340 ?auto_308341 ?auto_308342 ?auto_308343 ?auto_308344 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_308359 - BLOCK
      ?auto_308360 - BLOCK
      ?auto_308361 - BLOCK
      ?auto_308362 - BLOCK
      ?auto_308363 - BLOCK
      ?auto_308364 - BLOCK
      ?auto_308365 - BLOCK
      ?auto_308366 - BLOCK
      ?auto_308367 - BLOCK
      ?auto_308368 - BLOCK
      ?auto_308369 - BLOCK
      ?auto_308370 - BLOCK
      ?auto_308371 - BLOCK
    )
    :vars
    (
      ?auto_308372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308371 ?auto_308372 ) ( not ( = ?auto_308359 ?auto_308360 ) ) ( not ( = ?auto_308359 ?auto_308361 ) ) ( not ( = ?auto_308359 ?auto_308362 ) ) ( not ( = ?auto_308359 ?auto_308363 ) ) ( not ( = ?auto_308359 ?auto_308364 ) ) ( not ( = ?auto_308359 ?auto_308365 ) ) ( not ( = ?auto_308359 ?auto_308366 ) ) ( not ( = ?auto_308359 ?auto_308367 ) ) ( not ( = ?auto_308359 ?auto_308368 ) ) ( not ( = ?auto_308359 ?auto_308369 ) ) ( not ( = ?auto_308359 ?auto_308370 ) ) ( not ( = ?auto_308359 ?auto_308371 ) ) ( not ( = ?auto_308359 ?auto_308372 ) ) ( not ( = ?auto_308360 ?auto_308361 ) ) ( not ( = ?auto_308360 ?auto_308362 ) ) ( not ( = ?auto_308360 ?auto_308363 ) ) ( not ( = ?auto_308360 ?auto_308364 ) ) ( not ( = ?auto_308360 ?auto_308365 ) ) ( not ( = ?auto_308360 ?auto_308366 ) ) ( not ( = ?auto_308360 ?auto_308367 ) ) ( not ( = ?auto_308360 ?auto_308368 ) ) ( not ( = ?auto_308360 ?auto_308369 ) ) ( not ( = ?auto_308360 ?auto_308370 ) ) ( not ( = ?auto_308360 ?auto_308371 ) ) ( not ( = ?auto_308360 ?auto_308372 ) ) ( not ( = ?auto_308361 ?auto_308362 ) ) ( not ( = ?auto_308361 ?auto_308363 ) ) ( not ( = ?auto_308361 ?auto_308364 ) ) ( not ( = ?auto_308361 ?auto_308365 ) ) ( not ( = ?auto_308361 ?auto_308366 ) ) ( not ( = ?auto_308361 ?auto_308367 ) ) ( not ( = ?auto_308361 ?auto_308368 ) ) ( not ( = ?auto_308361 ?auto_308369 ) ) ( not ( = ?auto_308361 ?auto_308370 ) ) ( not ( = ?auto_308361 ?auto_308371 ) ) ( not ( = ?auto_308361 ?auto_308372 ) ) ( not ( = ?auto_308362 ?auto_308363 ) ) ( not ( = ?auto_308362 ?auto_308364 ) ) ( not ( = ?auto_308362 ?auto_308365 ) ) ( not ( = ?auto_308362 ?auto_308366 ) ) ( not ( = ?auto_308362 ?auto_308367 ) ) ( not ( = ?auto_308362 ?auto_308368 ) ) ( not ( = ?auto_308362 ?auto_308369 ) ) ( not ( = ?auto_308362 ?auto_308370 ) ) ( not ( = ?auto_308362 ?auto_308371 ) ) ( not ( = ?auto_308362 ?auto_308372 ) ) ( not ( = ?auto_308363 ?auto_308364 ) ) ( not ( = ?auto_308363 ?auto_308365 ) ) ( not ( = ?auto_308363 ?auto_308366 ) ) ( not ( = ?auto_308363 ?auto_308367 ) ) ( not ( = ?auto_308363 ?auto_308368 ) ) ( not ( = ?auto_308363 ?auto_308369 ) ) ( not ( = ?auto_308363 ?auto_308370 ) ) ( not ( = ?auto_308363 ?auto_308371 ) ) ( not ( = ?auto_308363 ?auto_308372 ) ) ( not ( = ?auto_308364 ?auto_308365 ) ) ( not ( = ?auto_308364 ?auto_308366 ) ) ( not ( = ?auto_308364 ?auto_308367 ) ) ( not ( = ?auto_308364 ?auto_308368 ) ) ( not ( = ?auto_308364 ?auto_308369 ) ) ( not ( = ?auto_308364 ?auto_308370 ) ) ( not ( = ?auto_308364 ?auto_308371 ) ) ( not ( = ?auto_308364 ?auto_308372 ) ) ( not ( = ?auto_308365 ?auto_308366 ) ) ( not ( = ?auto_308365 ?auto_308367 ) ) ( not ( = ?auto_308365 ?auto_308368 ) ) ( not ( = ?auto_308365 ?auto_308369 ) ) ( not ( = ?auto_308365 ?auto_308370 ) ) ( not ( = ?auto_308365 ?auto_308371 ) ) ( not ( = ?auto_308365 ?auto_308372 ) ) ( not ( = ?auto_308366 ?auto_308367 ) ) ( not ( = ?auto_308366 ?auto_308368 ) ) ( not ( = ?auto_308366 ?auto_308369 ) ) ( not ( = ?auto_308366 ?auto_308370 ) ) ( not ( = ?auto_308366 ?auto_308371 ) ) ( not ( = ?auto_308366 ?auto_308372 ) ) ( not ( = ?auto_308367 ?auto_308368 ) ) ( not ( = ?auto_308367 ?auto_308369 ) ) ( not ( = ?auto_308367 ?auto_308370 ) ) ( not ( = ?auto_308367 ?auto_308371 ) ) ( not ( = ?auto_308367 ?auto_308372 ) ) ( not ( = ?auto_308368 ?auto_308369 ) ) ( not ( = ?auto_308368 ?auto_308370 ) ) ( not ( = ?auto_308368 ?auto_308371 ) ) ( not ( = ?auto_308368 ?auto_308372 ) ) ( not ( = ?auto_308369 ?auto_308370 ) ) ( not ( = ?auto_308369 ?auto_308371 ) ) ( not ( = ?auto_308369 ?auto_308372 ) ) ( not ( = ?auto_308370 ?auto_308371 ) ) ( not ( = ?auto_308370 ?auto_308372 ) ) ( not ( = ?auto_308371 ?auto_308372 ) ) ( ON ?auto_308370 ?auto_308371 ) ( ON ?auto_308369 ?auto_308370 ) ( ON ?auto_308368 ?auto_308369 ) ( ON ?auto_308367 ?auto_308368 ) ( ON ?auto_308366 ?auto_308367 ) ( ON ?auto_308365 ?auto_308366 ) ( ON ?auto_308364 ?auto_308365 ) ( ON ?auto_308363 ?auto_308364 ) ( ON ?auto_308362 ?auto_308363 ) ( ON ?auto_308361 ?auto_308362 ) ( ON ?auto_308360 ?auto_308361 ) ( ON ?auto_308359 ?auto_308360 ) ( CLEAR ?auto_308359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_308359 )
      ( MAKE-13PILE ?auto_308359 ?auto_308360 ?auto_308361 ?auto_308362 ?auto_308363 ?auto_308364 ?auto_308365 ?auto_308366 ?auto_308367 ?auto_308368 ?auto_308369 ?auto_308370 ?auto_308371 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308387 - BLOCK
      ?auto_308388 - BLOCK
      ?auto_308389 - BLOCK
      ?auto_308390 - BLOCK
      ?auto_308391 - BLOCK
      ?auto_308392 - BLOCK
      ?auto_308393 - BLOCK
      ?auto_308394 - BLOCK
      ?auto_308395 - BLOCK
      ?auto_308396 - BLOCK
      ?auto_308397 - BLOCK
      ?auto_308398 - BLOCK
      ?auto_308399 - BLOCK
      ?auto_308400 - BLOCK
    )
    :vars
    (
      ?auto_308401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_308399 ) ( ON ?auto_308400 ?auto_308401 ) ( CLEAR ?auto_308400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_308387 ) ( ON ?auto_308388 ?auto_308387 ) ( ON ?auto_308389 ?auto_308388 ) ( ON ?auto_308390 ?auto_308389 ) ( ON ?auto_308391 ?auto_308390 ) ( ON ?auto_308392 ?auto_308391 ) ( ON ?auto_308393 ?auto_308392 ) ( ON ?auto_308394 ?auto_308393 ) ( ON ?auto_308395 ?auto_308394 ) ( ON ?auto_308396 ?auto_308395 ) ( ON ?auto_308397 ?auto_308396 ) ( ON ?auto_308398 ?auto_308397 ) ( ON ?auto_308399 ?auto_308398 ) ( not ( = ?auto_308387 ?auto_308388 ) ) ( not ( = ?auto_308387 ?auto_308389 ) ) ( not ( = ?auto_308387 ?auto_308390 ) ) ( not ( = ?auto_308387 ?auto_308391 ) ) ( not ( = ?auto_308387 ?auto_308392 ) ) ( not ( = ?auto_308387 ?auto_308393 ) ) ( not ( = ?auto_308387 ?auto_308394 ) ) ( not ( = ?auto_308387 ?auto_308395 ) ) ( not ( = ?auto_308387 ?auto_308396 ) ) ( not ( = ?auto_308387 ?auto_308397 ) ) ( not ( = ?auto_308387 ?auto_308398 ) ) ( not ( = ?auto_308387 ?auto_308399 ) ) ( not ( = ?auto_308387 ?auto_308400 ) ) ( not ( = ?auto_308387 ?auto_308401 ) ) ( not ( = ?auto_308388 ?auto_308389 ) ) ( not ( = ?auto_308388 ?auto_308390 ) ) ( not ( = ?auto_308388 ?auto_308391 ) ) ( not ( = ?auto_308388 ?auto_308392 ) ) ( not ( = ?auto_308388 ?auto_308393 ) ) ( not ( = ?auto_308388 ?auto_308394 ) ) ( not ( = ?auto_308388 ?auto_308395 ) ) ( not ( = ?auto_308388 ?auto_308396 ) ) ( not ( = ?auto_308388 ?auto_308397 ) ) ( not ( = ?auto_308388 ?auto_308398 ) ) ( not ( = ?auto_308388 ?auto_308399 ) ) ( not ( = ?auto_308388 ?auto_308400 ) ) ( not ( = ?auto_308388 ?auto_308401 ) ) ( not ( = ?auto_308389 ?auto_308390 ) ) ( not ( = ?auto_308389 ?auto_308391 ) ) ( not ( = ?auto_308389 ?auto_308392 ) ) ( not ( = ?auto_308389 ?auto_308393 ) ) ( not ( = ?auto_308389 ?auto_308394 ) ) ( not ( = ?auto_308389 ?auto_308395 ) ) ( not ( = ?auto_308389 ?auto_308396 ) ) ( not ( = ?auto_308389 ?auto_308397 ) ) ( not ( = ?auto_308389 ?auto_308398 ) ) ( not ( = ?auto_308389 ?auto_308399 ) ) ( not ( = ?auto_308389 ?auto_308400 ) ) ( not ( = ?auto_308389 ?auto_308401 ) ) ( not ( = ?auto_308390 ?auto_308391 ) ) ( not ( = ?auto_308390 ?auto_308392 ) ) ( not ( = ?auto_308390 ?auto_308393 ) ) ( not ( = ?auto_308390 ?auto_308394 ) ) ( not ( = ?auto_308390 ?auto_308395 ) ) ( not ( = ?auto_308390 ?auto_308396 ) ) ( not ( = ?auto_308390 ?auto_308397 ) ) ( not ( = ?auto_308390 ?auto_308398 ) ) ( not ( = ?auto_308390 ?auto_308399 ) ) ( not ( = ?auto_308390 ?auto_308400 ) ) ( not ( = ?auto_308390 ?auto_308401 ) ) ( not ( = ?auto_308391 ?auto_308392 ) ) ( not ( = ?auto_308391 ?auto_308393 ) ) ( not ( = ?auto_308391 ?auto_308394 ) ) ( not ( = ?auto_308391 ?auto_308395 ) ) ( not ( = ?auto_308391 ?auto_308396 ) ) ( not ( = ?auto_308391 ?auto_308397 ) ) ( not ( = ?auto_308391 ?auto_308398 ) ) ( not ( = ?auto_308391 ?auto_308399 ) ) ( not ( = ?auto_308391 ?auto_308400 ) ) ( not ( = ?auto_308391 ?auto_308401 ) ) ( not ( = ?auto_308392 ?auto_308393 ) ) ( not ( = ?auto_308392 ?auto_308394 ) ) ( not ( = ?auto_308392 ?auto_308395 ) ) ( not ( = ?auto_308392 ?auto_308396 ) ) ( not ( = ?auto_308392 ?auto_308397 ) ) ( not ( = ?auto_308392 ?auto_308398 ) ) ( not ( = ?auto_308392 ?auto_308399 ) ) ( not ( = ?auto_308392 ?auto_308400 ) ) ( not ( = ?auto_308392 ?auto_308401 ) ) ( not ( = ?auto_308393 ?auto_308394 ) ) ( not ( = ?auto_308393 ?auto_308395 ) ) ( not ( = ?auto_308393 ?auto_308396 ) ) ( not ( = ?auto_308393 ?auto_308397 ) ) ( not ( = ?auto_308393 ?auto_308398 ) ) ( not ( = ?auto_308393 ?auto_308399 ) ) ( not ( = ?auto_308393 ?auto_308400 ) ) ( not ( = ?auto_308393 ?auto_308401 ) ) ( not ( = ?auto_308394 ?auto_308395 ) ) ( not ( = ?auto_308394 ?auto_308396 ) ) ( not ( = ?auto_308394 ?auto_308397 ) ) ( not ( = ?auto_308394 ?auto_308398 ) ) ( not ( = ?auto_308394 ?auto_308399 ) ) ( not ( = ?auto_308394 ?auto_308400 ) ) ( not ( = ?auto_308394 ?auto_308401 ) ) ( not ( = ?auto_308395 ?auto_308396 ) ) ( not ( = ?auto_308395 ?auto_308397 ) ) ( not ( = ?auto_308395 ?auto_308398 ) ) ( not ( = ?auto_308395 ?auto_308399 ) ) ( not ( = ?auto_308395 ?auto_308400 ) ) ( not ( = ?auto_308395 ?auto_308401 ) ) ( not ( = ?auto_308396 ?auto_308397 ) ) ( not ( = ?auto_308396 ?auto_308398 ) ) ( not ( = ?auto_308396 ?auto_308399 ) ) ( not ( = ?auto_308396 ?auto_308400 ) ) ( not ( = ?auto_308396 ?auto_308401 ) ) ( not ( = ?auto_308397 ?auto_308398 ) ) ( not ( = ?auto_308397 ?auto_308399 ) ) ( not ( = ?auto_308397 ?auto_308400 ) ) ( not ( = ?auto_308397 ?auto_308401 ) ) ( not ( = ?auto_308398 ?auto_308399 ) ) ( not ( = ?auto_308398 ?auto_308400 ) ) ( not ( = ?auto_308398 ?auto_308401 ) ) ( not ( = ?auto_308399 ?auto_308400 ) ) ( not ( = ?auto_308399 ?auto_308401 ) ) ( not ( = ?auto_308400 ?auto_308401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_308400 ?auto_308401 )
      ( !STACK ?auto_308400 ?auto_308399 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308416 - BLOCK
      ?auto_308417 - BLOCK
      ?auto_308418 - BLOCK
      ?auto_308419 - BLOCK
      ?auto_308420 - BLOCK
      ?auto_308421 - BLOCK
      ?auto_308422 - BLOCK
      ?auto_308423 - BLOCK
      ?auto_308424 - BLOCK
      ?auto_308425 - BLOCK
      ?auto_308426 - BLOCK
      ?auto_308427 - BLOCK
      ?auto_308428 - BLOCK
      ?auto_308429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_308428 ) ( ON-TABLE ?auto_308429 ) ( CLEAR ?auto_308429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_308416 ) ( ON ?auto_308417 ?auto_308416 ) ( ON ?auto_308418 ?auto_308417 ) ( ON ?auto_308419 ?auto_308418 ) ( ON ?auto_308420 ?auto_308419 ) ( ON ?auto_308421 ?auto_308420 ) ( ON ?auto_308422 ?auto_308421 ) ( ON ?auto_308423 ?auto_308422 ) ( ON ?auto_308424 ?auto_308423 ) ( ON ?auto_308425 ?auto_308424 ) ( ON ?auto_308426 ?auto_308425 ) ( ON ?auto_308427 ?auto_308426 ) ( ON ?auto_308428 ?auto_308427 ) ( not ( = ?auto_308416 ?auto_308417 ) ) ( not ( = ?auto_308416 ?auto_308418 ) ) ( not ( = ?auto_308416 ?auto_308419 ) ) ( not ( = ?auto_308416 ?auto_308420 ) ) ( not ( = ?auto_308416 ?auto_308421 ) ) ( not ( = ?auto_308416 ?auto_308422 ) ) ( not ( = ?auto_308416 ?auto_308423 ) ) ( not ( = ?auto_308416 ?auto_308424 ) ) ( not ( = ?auto_308416 ?auto_308425 ) ) ( not ( = ?auto_308416 ?auto_308426 ) ) ( not ( = ?auto_308416 ?auto_308427 ) ) ( not ( = ?auto_308416 ?auto_308428 ) ) ( not ( = ?auto_308416 ?auto_308429 ) ) ( not ( = ?auto_308417 ?auto_308418 ) ) ( not ( = ?auto_308417 ?auto_308419 ) ) ( not ( = ?auto_308417 ?auto_308420 ) ) ( not ( = ?auto_308417 ?auto_308421 ) ) ( not ( = ?auto_308417 ?auto_308422 ) ) ( not ( = ?auto_308417 ?auto_308423 ) ) ( not ( = ?auto_308417 ?auto_308424 ) ) ( not ( = ?auto_308417 ?auto_308425 ) ) ( not ( = ?auto_308417 ?auto_308426 ) ) ( not ( = ?auto_308417 ?auto_308427 ) ) ( not ( = ?auto_308417 ?auto_308428 ) ) ( not ( = ?auto_308417 ?auto_308429 ) ) ( not ( = ?auto_308418 ?auto_308419 ) ) ( not ( = ?auto_308418 ?auto_308420 ) ) ( not ( = ?auto_308418 ?auto_308421 ) ) ( not ( = ?auto_308418 ?auto_308422 ) ) ( not ( = ?auto_308418 ?auto_308423 ) ) ( not ( = ?auto_308418 ?auto_308424 ) ) ( not ( = ?auto_308418 ?auto_308425 ) ) ( not ( = ?auto_308418 ?auto_308426 ) ) ( not ( = ?auto_308418 ?auto_308427 ) ) ( not ( = ?auto_308418 ?auto_308428 ) ) ( not ( = ?auto_308418 ?auto_308429 ) ) ( not ( = ?auto_308419 ?auto_308420 ) ) ( not ( = ?auto_308419 ?auto_308421 ) ) ( not ( = ?auto_308419 ?auto_308422 ) ) ( not ( = ?auto_308419 ?auto_308423 ) ) ( not ( = ?auto_308419 ?auto_308424 ) ) ( not ( = ?auto_308419 ?auto_308425 ) ) ( not ( = ?auto_308419 ?auto_308426 ) ) ( not ( = ?auto_308419 ?auto_308427 ) ) ( not ( = ?auto_308419 ?auto_308428 ) ) ( not ( = ?auto_308419 ?auto_308429 ) ) ( not ( = ?auto_308420 ?auto_308421 ) ) ( not ( = ?auto_308420 ?auto_308422 ) ) ( not ( = ?auto_308420 ?auto_308423 ) ) ( not ( = ?auto_308420 ?auto_308424 ) ) ( not ( = ?auto_308420 ?auto_308425 ) ) ( not ( = ?auto_308420 ?auto_308426 ) ) ( not ( = ?auto_308420 ?auto_308427 ) ) ( not ( = ?auto_308420 ?auto_308428 ) ) ( not ( = ?auto_308420 ?auto_308429 ) ) ( not ( = ?auto_308421 ?auto_308422 ) ) ( not ( = ?auto_308421 ?auto_308423 ) ) ( not ( = ?auto_308421 ?auto_308424 ) ) ( not ( = ?auto_308421 ?auto_308425 ) ) ( not ( = ?auto_308421 ?auto_308426 ) ) ( not ( = ?auto_308421 ?auto_308427 ) ) ( not ( = ?auto_308421 ?auto_308428 ) ) ( not ( = ?auto_308421 ?auto_308429 ) ) ( not ( = ?auto_308422 ?auto_308423 ) ) ( not ( = ?auto_308422 ?auto_308424 ) ) ( not ( = ?auto_308422 ?auto_308425 ) ) ( not ( = ?auto_308422 ?auto_308426 ) ) ( not ( = ?auto_308422 ?auto_308427 ) ) ( not ( = ?auto_308422 ?auto_308428 ) ) ( not ( = ?auto_308422 ?auto_308429 ) ) ( not ( = ?auto_308423 ?auto_308424 ) ) ( not ( = ?auto_308423 ?auto_308425 ) ) ( not ( = ?auto_308423 ?auto_308426 ) ) ( not ( = ?auto_308423 ?auto_308427 ) ) ( not ( = ?auto_308423 ?auto_308428 ) ) ( not ( = ?auto_308423 ?auto_308429 ) ) ( not ( = ?auto_308424 ?auto_308425 ) ) ( not ( = ?auto_308424 ?auto_308426 ) ) ( not ( = ?auto_308424 ?auto_308427 ) ) ( not ( = ?auto_308424 ?auto_308428 ) ) ( not ( = ?auto_308424 ?auto_308429 ) ) ( not ( = ?auto_308425 ?auto_308426 ) ) ( not ( = ?auto_308425 ?auto_308427 ) ) ( not ( = ?auto_308425 ?auto_308428 ) ) ( not ( = ?auto_308425 ?auto_308429 ) ) ( not ( = ?auto_308426 ?auto_308427 ) ) ( not ( = ?auto_308426 ?auto_308428 ) ) ( not ( = ?auto_308426 ?auto_308429 ) ) ( not ( = ?auto_308427 ?auto_308428 ) ) ( not ( = ?auto_308427 ?auto_308429 ) ) ( not ( = ?auto_308428 ?auto_308429 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_308429 )
      ( !STACK ?auto_308429 ?auto_308428 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308444 - BLOCK
      ?auto_308445 - BLOCK
      ?auto_308446 - BLOCK
      ?auto_308447 - BLOCK
      ?auto_308448 - BLOCK
      ?auto_308449 - BLOCK
      ?auto_308450 - BLOCK
      ?auto_308451 - BLOCK
      ?auto_308452 - BLOCK
      ?auto_308453 - BLOCK
      ?auto_308454 - BLOCK
      ?auto_308455 - BLOCK
      ?auto_308456 - BLOCK
      ?auto_308457 - BLOCK
    )
    :vars
    (
      ?auto_308458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308457 ?auto_308458 ) ( ON-TABLE ?auto_308444 ) ( ON ?auto_308445 ?auto_308444 ) ( ON ?auto_308446 ?auto_308445 ) ( ON ?auto_308447 ?auto_308446 ) ( ON ?auto_308448 ?auto_308447 ) ( ON ?auto_308449 ?auto_308448 ) ( ON ?auto_308450 ?auto_308449 ) ( ON ?auto_308451 ?auto_308450 ) ( ON ?auto_308452 ?auto_308451 ) ( ON ?auto_308453 ?auto_308452 ) ( ON ?auto_308454 ?auto_308453 ) ( ON ?auto_308455 ?auto_308454 ) ( not ( = ?auto_308444 ?auto_308445 ) ) ( not ( = ?auto_308444 ?auto_308446 ) ) ( not ( = ?auto_308444 ?auto_308447 ) ) ( not ( = ?auto_308444 ?auto_308448 ) ) ( not ( = ?auto_308444 ?auto_308449 ) ) ( not ( = ?auto_308444 ?auto_308450 ) ) ( not ( = ?auto_308444 ?auto_308451 ) ) ( not ( = ?auto_308444 ?auto_308452 ) ) ( not ( = ?auto_308444 ?auto_308453 ) ) ( not ( = ?auto_308444 ?auto_308454 ) ) ( not ( = ?auto_308444 ?auto_308455 ) ) ( not ( = ?auto_308444 ?auto_308456 ) ) ( not ( = ?auto_308444 ?auto_308457 ) ) ( not ( = ?auto_308444 ?auto_308458 ) ) ( not ( = ?auto_308445 ?auto_308446 ) ) ( not ( = ?auto_308445 ?auto_308447 ) ) ( not ( = ?auto_308445 ?auto_308448 ) ) ( not ( = ?auto_308445 ?auto_308449 ) ) ( not ( = ?auto_308445 ?auto_308450 ) ) ( not ( = ?auto_308445 ?auto_308451 ) ) ( not ( = ?auto_308445 ?auto_308452 ) ) ( not ( = ?auto_308445 ?auto_308453 ) ) ( not ( = ?auto_308445 ?auto_308454 ) ) ( not ( = ?auto_308445 ?auto_308455 ) ) ( not ( = ?auto_308445 ?auto_308456 ) ) ( not ( = ?auto_308445 ?auto_308457 ) ) ( not ( = ?auto_308445 ?auto_308458 ) ) ( not ( = ?auto_308446 ?auto_308447 ) ) ( not ( = ?auto_308446 ?auto_308448 ) ) ( not ( = ?auto_308446 ?auto_308449 ) ) ( not ( = ?auto_308446 ?auto_308450 ) ) ( not ( = ?auto_308446 ?auto_308451 ) ) ( not ( = ?auto_308446 ?auto_308452 ) ) ( not ( = ?auto_308446 ?auto_308453 ) ) ( not ( = ?auto_308446 ?auto_308454 ) ) ( not ( = ?auto_308446 ?auto_308455 ) ) ( not ( = ?auto_308446 ?auto_308456 ) ) ( not ( = ?auto_308446 ?auto_308457 ) ) ( not ( = ?auto_308446 ?auto_308458 ) ) ( not ( = ?auto_308447 ?auto_308448 ) ) ( not ( = ?auto_308447 ?auto_308449 ) ) ( not ( = ?auto_308447 ?auto_308450 ) ) ( not ( = ?auto_308447 ?auto_308451 ) ) ( not ( = ?auto_308447 ?auto_308452 ) ) ( not ( = ?auto_308447 ?auto_308453 ) ) ( not ( = ?auto_308447 ?auto_308454 ) ) ( not ( = ?auto_308447 ?auto_308455 ) ) ( not ( = ?auto_308447 ?auto_308456 ) ) ( not ( = ?auto_308447 ?auto_308457 ) ) ( not ( = ?auto_308447 ?auto_308458 ) ) ( not ( = ?auto_308448 ?auto_308449 ) ) ( not ( = ?auto_308448 ?auto_308450 ) ) ( not ( = ?auto_308448 ?auto_308451 ) ) ( not ( = ?auto_308448 ?auto_308452 ) ) ( not ( = ?auto_308448 ?auto_308453 ) ) ( not ( = ?auto_308448 ?auto_308454 ) ) ( not ( = ?auto_308448 ?auto_308455 ) ) ( not ( = ?auto_308448 ?auto_308456 ) ) ( not ( = ?auto_308448 ?auto_308457 ) ) ( not ( = ?auto_308448 ?auto_308458 ) ) ( not ( = ?auto_308449 ?auto_308450 ) ) ( not ( = ?auto_308449 ?auto_308451 ) ) ( not ( = ?auto_308449 ?auto_308452 ) ) ( not ( = ?auto_308449 ?auto_308453 ) ) ( not ( = ?auto_308449 ?auto_308454 ) ) ( not ( = ?auto_308449 ?auto_308455 ) ) ( not ( = ?auto_308449 ?auto_308456 ) ) ( not ( = ?auto_308449 ?auto_308457 ) ) ( not ( = ?auto_308449 ?auto_308458 ) ) ( not ( = ?auto_308450 ?auto_308451 ) ) ( not ( = ?auto_308450 ?auto_308452 ) ) ( not ( = ?auto_308450 ?auto_308453 ) ) ( not ( = ?auto_308450 ?auto_308454 ) ) ( not ( = ?auto_308450 ?auto_308455 ) ) ( not ( = ?auto_308450 ?auto_308456 ) ) ( not ( = ?auto_308450 ?auto_308457 ) ) ( not ( = ?auto_308450 ?auto_308458 ) ) ( not ( = ?auto_308451 ?auto_308452 ) ) ( not ( = ?auto_308451 ?auto_308453 ) ) ( not ( = ?auto_308451 ?auto_308454 ) ) ( not ( = ?auto_308451 ?auto_308455 ) ) ( not ( = ?auto_308451 ?auto_308456 ) ) ( not ( = ?auto_308451 ?auto_308457 ) ) ( not ( = ?auto_308451 ?auto_308458 ) ) ( not ( = ?auto_308452 ?auto_308453 ) ) ( not ( = ?auto_308452 ?auto_308454 ) ) ( not ( = ?auto_308452 ?auto_308455 ) ) ( not ( = ?auto_308452 ?auto_308456 ) ) ( not ( = ?auto_308452 ?auto_308457 ) ) ( not ( = ?auto_308452 ?auto_308458 ) ) ( not ( = ?auto_308453 ?auto_308454 ) ) ( not ( = ?auto_308453 ?auto_308455 ) ) ( not ( = ?auto_308453 ?auto_308456 ) ) ( not ( = ?auto_308453 ?auto_308457 ) ) ( not ( = ?auto_308453 ?auto_308458 ) ) ( not ( = ?auto_308454 ?auto_308455 ) ) ( not ( = ?auto_308454 ?auto_308456 ) ) ( not ( = ?auto_308454 ?auto_308457 ) ) ( not ( = ?auto_308454 ?auto_308458 ) ) ( not ( = ?auto_308455 ?auto_308456 ) ) ( not ( = ?auto_308455 ?auto_308457 ) ) ( not ( = ?auto_308455 ?auto_308458 ) ) ( not ( = ?auto_308456 ?auto_308457 ) ) ( not ( = ?auto_308456 ?auto_308458 ) ) ( not ( = ?auto_308457 ?auto_308458 ) ) ( CLEAR ?auto_308455 ) ( ON ?auto_308456 ?auto_308457 ) ( CLEAR ?auto_308456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_308444 ?auto_308445 ?auto_308446 ?auto_308447 ?auto_308448 ?auto_308449 ?auto_308450 ?auto_308451 ?auto_308452 ?auto_308453 ?auto_308454 ?auto_308455 ?auto_308456 )
      ( MAKE-14PILE ?auto_308444 ?auto_308445 ?auto_308446 ?auto_308447 ?auto_308448 ?auto_308449 ?auto_308450 ?auto_308451 ?auto_308452 ?auto_308453 ?auto_308454 ?auto_308455 ?auto_308456 ?auto_308457 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308473 - BLOCK
      ?auto_308474 - BLOCK
      ?auto_308475 - BLOCK
      ?auto_308476 - BLOCK
      ?auto_308477 - BLOCK
      ?auto_308478 - BLOCK
      ?auto_308479 - BLOCK
      ?auto_308480 - BLOCK
      ?auto_308481 - BLOCK
      ?auto_308482 - BLOCK
      ?auto_308483 - BLOCK
      ?auto_308484 - BLOCK
      ?auto_308485 - BLOCK
      ?auto_308486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308486 ) ( ON-TABLE ?auto_308473 ) ( ON ?auto_308474 ?auto_308473 ) ( ON ?auto_308475 ?auto_308474 ) ( ON ?auto_308476 ?auto_308475 ) ( ON ?auto_308477 ?auto_308476 ) ( ON ?auto_308478 ?auto_308477 ) ( ON ?auto_308479 ?auto_308478 ) ( ON ?auto_308480 ?auto_308479 ) ( ON ?auto_308481 ?auto_308480 ) ( ON ?auto_308482 ?auto_308481 ) ( ON ?auto_308483 ?auto_308482 ) ( ON ?auto_308484 ?auto_308483 ) ( not ( = ?auto_308473 ?auto_308474 ) ) ( not ( = ?auto_308473 ?auto_308475 ) ) ( not ( = ?auto_308473 ?auto_308476 ) ) ( not ( = ?auto_308473 ?auto_308477 ) ) ( not ( = ?auto_308473 ?auto_308478 ) ) ( not ( = ?auto_308473 ?auto_308479 ) ) ( not ( = ?auto_308473 ?auto_308480 ) ) ( not ( = ?auto_308473 ?auto_308481 ) ) ( not ( = ?auto_308473 ?auto_308482 ) ) ( not ( = ?auto_308473 ?auto_308483 ) ) ( not ( = ?auto_308473 ?auto_308484 ) ) ( not ( = ?auto_308473 ?auto_308485 ) ) ( not ( = ?auto_308473 ?auto_308486 ) ) ( not ( = ?auto_308474 ?auto_308475 ) ) ( not ( = ?auto_308474 ?auto_308476 ) ) ( not ( = ?auto_308474 ?auto_308477 ) ) ( not ( = ?auto_308474 ?auto_308478 ) ) ( not ( = ?auto_308474 ?auto_308479 ) ) ( not ( = ?auto_308474 ?auto_308480 ) ) ( not ( = ?auto_308474 ?auto_308481 ) ) ( not ( = ?auto_308474 ?auto_308482 ) ) ( not ( = ?auto_308474 ?auto_308483 ) ) ( not ( = ?auto_308474 ?auto_308484 ) ) ( not ( = ?auto_308474 ?auto_308485 ) ) ( not ( = ?auto_308474 ?auto_308486 ) ) ( not ( = ?auto_308475 ?auto_308476 ) ) ( not ( = ?auto_308475 ?auto_308477 ) ) ( not ( = ?auto_308475 ?auto_308478 ) ) ( not ( = ?auto_308475 ?auto_308479 ) ) ( not ( = ?auto_308475 ?auto_308480 ) ) ( not ( = ?auto_308475 ?auto_308481 ) ) ( not ( = ?auto_308475 ?auto_308482 ) ) ( not ( = ?auto_308475 ?auto_308483 ) ) ( not ( = ?auto_308475 ?auto_308484 ) ) ( not ( = ?auto_308475 ?auto_308485 ) ) ( not ( = ?auto_308475 ?auto_308486 ) ) ( not ( = ?auto_308476 ?auto_308477 ) ) ( not ( = ?auto_308476 ?auto_308478 ) ) ( not ( = ?auto_308476 ?auto_308479 ) ) ( not ( = ?auto_308476 ?auto_308480 ) ) ( not ( = ?auto_308476 ?auto_308481 ) ) ( not ( = ?auto_308476 ?auto_308482 ) ) ( not ( = ?auto_308476 ?auto_308483 ) ) ( not ( = ?auto_308476 ?auto_308484 ) ) ( not ( = ?auto_308476 ?auto_308485 ) ) ( not ( = ?auto_308476 ?auto_308486 ) ) ( not ( = ?auto_308477 ?auto_308478 ) ) ( not ( = ?auto_308477 ?auto_308479 ) ) ( not ( = ?auto_308477 ?auto_308480 ) ) ( not ( = ?auto_308477 ?auto_308481 ) ) ( not ( = ?auto_308477 ?auto_308482 ) ) ( not ( = ?auto_308477 ?auto_308483 ) ) ( not ( = ?auto_308477 ?auto_308484 ) ) ( not ( = ?auto_308477 ?auto_308485 ) ) ( not ( = ?auto_308477 ?auto_308486 ) ) ( not ( = ?auto_308478 ?auto_308479 ) ) ( not ( = ?auto_308478 ?auto_308480 ) ) ( not ( = ?auto_308478 ?auto_308481 ) ) ( not ( = ?auto_308478 ?auto_308482 ) ) ( not ( = ?auto_308478 ?auto_308483 ) ) ( not ( = ?auto_308478 ?auto_308484 ) ) ( not ( = ?auto_308478 ?auto_308485 ) ) ( not ( = ?auto_308478 ?auto_308486 ) ) ( not ( = ?auto_308479 ?auto_308480 ) ) ( not ( = ?auto_308479 ?auto_308481 ) ) ( not ( = ?auto_308479 ?auto_308482 ) ) ( not ( = ?auto_308479 ?auto_308483 ) ) ( not ( = ?auto_308479 ?auto_308484 ) ) ( not ( = ?auto_308479 ?auto_308485 ) ) ( not ( = ?auto_308479 ?auto_308486 ) ) ( not ( = ?auto_308480 ?auto_308481 ) ) ( not ( = ?auto_308480 ?auto_308482 ) ) ( not ( = ?auto_308480 ?auto_308483 ) ) ( not ( = ?auto_308480 ?auto_308484 ) ) ( not ( = ?auto_308480 ?auto_308485 ) ) ( not ( = ?auto_308480 ?auto_308486 ) ) ( not ( = ?auto_308481 ?auto_308482 ) ) ( not ( = ?auto_308481 ?auto_308483 ) ) ( not ( = ?auto_308481 ?auto_308484 ) ) ( not ( = ?auto_308481 ?auto_308485 ) ) ( not ( = ?auto_308481 ?auto_308486 ) ) ( not ( = ?auto_308482 ?auto_308483 ) ) ( not ( = ?auto_308482 ?auto_308484 ) ) ( not ( = ?auto_308482 ?auto_308485 ) ) ( not ( = ?auto_308482 ?auto_308486 ) ) ( not ( = ?auto_308483 ?auto_308484 ) ) ( not ( = ?auto_308483 ?auto_308485 ) ) ( not ( = ?auto_308483 ?auto_308486 ) ) ( not ( = ?auto_308484 ?auto_308485 ) ) ( not ( = ?auto_308484 ?auto_308486 ) ) ( not ( = ?auto_308485 ?auto_308486 ) ) ( CLEAR ?auto_308484 ) ( ON ?auto_308485 ?auto_308486 ) ( CLEAR ?auto_308485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_308473 ?auto_308474 ?auto_308475 ?auto_308476 ?auto_308477 ?auto_308478 ?auto_308479 ?auto_308480 ?auto_308481 ?auto_308482 ?auto_308483 ?auto_308484 ?auto_308485 )
      ( MAKE-14PILE ?auto_308473 ?auto_308474 ?auto_308475 ?auto_308476 ?auto_308477 ?auto_308478 ?auto_308479 ?auto_308480 ?auto_308481 ?auto_308482 ?auto_308483 ?auto_308484 ?auto_308485 ?auto_308486 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308501 - BLOCK
      ?auto_308502 - BLOCK
      ?auto_308503 - BLOCK
      ?auto_308504 - BLOCK
      ?auto_308505 - BLOCK
      ?auto_308506 - BLOCK
      ?auto_308507 - BLOCK
      ?auto_308508 - BLOCK
      ?auto_308509 - BLOCK
      ?auto_308510 - BLOCK
      ?auto_308511 - BLOCK
      ?auto_308512 - BLOCK
      ?auto_308513 - BLOCK
      ?auto_308514 - BLOCK
    )
    :vars
    (
      ?auto_308515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308514 ?auto_308515 ) ( ON-TABLE ?auto_308501 ) ( ON ?auto_308502 ?auto_308501 ) ( ON ?auto_308503 ?auto_308502 ) ( ON ?auto_308504 ?auto_308503 ) ( ON ?auto_308505 ?auto_308504 ) ( ON ?auto_308506 ?auto_308505 ) ( ON ?auto_308507 ?auto_308506 ) ( ON ?auto_308508 ?auto_308507 ) ( ON ?auto_308509 ?auto_308508 ) ( ON ?auto_308510 ?auto_308509 ) ( ON ?auto_308511 ?auto_308510 ) ( not ( = ?auto_308501 ?auto_308502 ) ) ( not ( = ?auto_308501 ?auto_308503 ) ) ( not ( = ?auto_308501 ?auto_308504 ) ) ( not ( = ?auto_308501 ?auto_308505 ) ) ( not ( = ?auto_308501 ?auto_308506 ) ) ( not ( = ?auto_308501 ?auto_308507 ) ) ( not ( = ?auto_308501 ?auto_308508 ) ) ( not ( = ?auto_308501 ?auto_308509 ) ) ( not ( = ?auto_308501 ?auto_308510 ) ) ( not ( = ?auto_308501 ?auto_308511 ) ) ( not ( = ?auto_308501 ?auto_308512 ) ) ( not ( = ?auto_308501 ?auto_308513 ) ) ( not ( = ?auto_308501 ?auto_308514 ) ) ( not ( = ?auto_308501 ?auto_308515 ) ) ( not ( = ?auto_308502 ?auto_308503 ) ) ( not ( = ?auto_308502 ?auto_308504 ) ) ( not ( = ?auto_308502 ?auto_308505 ) ) ( not ( = ?auto_308502 ?auto_308506 ) ) ( not ( = ?auto_308502 ?auto_308507 ) ) ( not ( = ?auto_308502 ?auto_308508 ) ) ( not ( = ?auto_308502 ?auto_308509 ) ) ( not ( = ?auto_308502 ?auto_308510 ) ) ( not ( = ?auto_308502 ?auto_308511 ) ) ( not ( = ?auto_308502 ?auto_308512 ) ) ( not ( = ?auto_308502 ?auto_308513 ) ) ( not ( = ?auto_308502 ?auto_308514 ) ) ( not ( = ?auto_308502 ?auto_308515 ) ) ( not ( = ?auto_308503 ?auto_308504 ) ) ( not ( = ?auto_308503 ?auto_308505 ) ) ( not ( = ?auto_308503 ?auto_308506 ) ) ( not ( = ?auto_308503 ?auto_308507 ) ) ( not ( = ?auto_308503 ?auto_308508 ) ) ( not ( = ?auto_308503 ?auto_308509 ) ) ( not ( = ?auto_308503 ?auto_308510 ) ) ( not ( = ?auto_308503 ?auto_308511 ) ) ( not ( = ?auto_308503 ?auto_308512 ) ) ( not ( = ?auto_308503 ?auto_308513 ) ) ( not ( = ?auto_308503 ?auto_308514 ) ) ( not ( = ?auto_308503 ?auto_308515 ) ) ( not ( = ?auto_308504 ?auto_308505 ) ) ( not ( = ?auto_308504 ?auto_308506 ) ) ( not ( = ?auto_308504 ?auto_308507 ) ) ( not ( = ?auto_308504 ?auto_308508 ) ) ( not ( = ?auto_308504 ?auto_308509 ) ) ( not ( = ?auto_308504 ?auto_308510 ) ) ( not ( = ?auto_308504 ?auto_308511 ) ) ( not ( = ?auto_308504 ?auto_308512 ) ) ( not ( = ?auto_308504 ?auto_308513 ) ) ( not ( = ?auto_308504 ?auto_308514 ) ) ( not ( = ?auto_308504 ?auto_308515 ) ) ( not ( = ?auto_308505 ?auto_308506 ) ) ( not ( = ?auto_308505 ?auto_308507 ) ) ( not ( = ?auto_308505 ?auto_308508 ) ) ( not ( = ?auto_308505 ?auto_308509 ) ) ( not ( = ?auto_308505 ?auto_308510 ) ) ( not ( = ?auto_308505 ?auto_308511 ) ) ( not ( = ?auto_308505 ?auto_308512 ) ) ( not ( = ?auto_308505 ?auto_308513 ) ) ( not ( = ?auto_308505 ?auto_308514 ) ) ( not ( = ?auto_308505 ?auto_308515 ) ) ( not ( = ?auto_308506 ?auto_308507 ) ) ( not ( = ?auto_308506 ?auto_308508 ) ) ( not ( = ?auto_308506 ?auto_308509 ) ) ( not ( = ?auto_308506 ?auto_308510 ) ) ( not ( = ?auto_308506 ?auto_308511 ) ) ( not ( = ?auto_308506 ?auto_308512 ) ) ( not ( = ?auto_308506 ?auto_308513 ) ) ( not ( = ?auto_308506 ?auto_308514 ) ) ( not ( = ?auto_308506 ?auto_308515 ) ) ( not ( = ?auto_308507 ?auto_308508 ) ) ( not ( = ?auto_308507 ?auto_308509 ) ) ( not ( = ?auto_308507 ?auto_308510 ) ) ( not ( = ?auto_308507 ?auto_308511 ) ) ( not ( = ?auto_308507 ?auto_308512 ) ) ( not ( = ?auto_308507 ?auto_308513 ) ) ( not ( = ?auto_308507 ?auto_308514 ) ) ( not ( = ?auto_308507 ?auto_308515 ) ) ( not ( = ?auto_308508 ?auto_308509 ) ) ( not ( = ?auto_308508 ?auto_308510 ) ) ( not ( = ?auto_308508 ?auto_308511 ) ) ( not ( = ?auto_308508 ?auto_308512 ) ) ( not ( = ?auto_308508 ?auto_308513 ) ) ( not ( = ?auto_308508 ?auto_308514 ) ) ( not ( = ?auto_308508 ?auto_308515 ) ) ( not ( = ?auto_308509 ?auto_308510 ) ) ( not ( = ?auto_308509 ?auto_308511 ) ) ( not ( = ?auto_308509 ?auto_308512 ) ) ( not ( = ?auto_308509 ?auto_308513 ) ) ( not ( = ?auto_308509 ?auto_308514 ) ) ( not ( = ?auto_308509 ?auto_308515 ) ) ( not ( = ?auto_308510 ?auto_308511 ) ) ( not ( = ?auto_308510 ?auto_308512 ) ) ( not ( = ?auto_308510 ?auto_308513 ) ) ( not ( = ?auto_308510 ?auto_308514 ) ) ( not ( = ?auto_308510 ?auto_308515 ) ) ( not ( = ?auto_308511 ?auto_308512 ) ) ( not ( = ?auto_308511 ?auto_308513 ) ) ( not ( = ?auto_308511 ?auto_308514 ) ) ( not ( = ?auto_308511 ?auto_308515 ) ) ( not ( = ?auto_308512 ?auto_308513 ) ) ( not ( = ?auto_308512 ?auto_308514 ) ) ( not ( = ?auto_308512 ?auto_308515 ) ) ( not ( = ?auto_308513 ?auto_308514 ) ) ( not ( = ?auto_308513 ?auto_308515 ) ) ( not ( = ?auto_308514 ?auto_308515 ) ) ( ON ?auto_308513 ?auto_308514 ) ( CLEAR ?auto_308511 ) ( ON ?auto_308512 ?auto_308513 ) ( CLEAR ?auto_308512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_308501 ?auto_308502 ?auto_308503 ?auto_308504 ?auto_308505 ?auto_308506 ?auto_308507 ?auto_308508 ?auto_308509 ?auto_308510 ?auto_308511 ?auto_308512 )
      ( MAKE-14PILE ?auto_308501 ?auto_308502 ?auto_308503 ?auto_308504 ?auto_308505 ?auto_308506 ?auto_308507 ?auto_308508 ?auto_308509 ?auto_308510 ?auto_308511 ?auto_308512 ?auto_308513 ?auto_308514 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308530 - BLOCK
      ?auto_308531 - BLOCK
      ?auto_308532 - BLOCK
      ?auto_308533 - BLOCK
      ?auto_308534 - BLOCK
      ?auto_308535 - BLOCK
      ?auto_308536 - BLOCK
      ?auto_308537 - BLOCK
      ?auto_308538 - BLOCK
      ?auto_308539 - BLOCK
      ?auto_308540 - BLOCK
      ?auto_308541 - BLOCK
      ?auto_308542 - BLOCK
      ?auto_308543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308543 ) ( ON-TABLE ?auto_308530 ) ( ON ?auto_308531 ?auto_308530 ) ( ON ?auto_308532 ?auto_308531 ) ( ON ?auto_308533 ?auto_308532 ) ( ON ?auto_308534 ?auto_308533 ) ( ON ?auto_308535 ?auto_308534 ) ( ON ?auto_308536 ?auto_308535 ) ( ON ?auto_308537 ?auto_308536 ) ( ON ?auto_308538 ?auto_308537 ) ( ON ?auto_308539 ?auto_308538 ) ( ON ?auto_308540 ?auto_308539 ) ( not ( = ?auto_308530 ?auto_308531 ) ) ( not ( = ?auto_308530 ?auto_308532 ) ) ( not ( = ?auto_308530 ?auto_308533 ) ) ( not ( = ?auto_308530 ?auto_308534 ) ) ( not ( = ?auto_308530 ?auto_308535 ) ) ( not ( = ?auto_308530 ?auto_308536 ) ) ( not ( = ?auto_308530 ?auto_308537 ) ) ( not ( = ?auto_308530 ?auto_308538 ) ) ( not ( = ?auto_308530 ?auto_308539 ) ) ( not ( = ?auto_308530 ?auto_308540 ) ) ( not ( = ?auto_308530 ?auto_308541 ) ) ( not ( = ?auto_308530 ?auto_308542 ) ) ( not ( = ?auto_308530 ?auto_308543 ) ) ( not ( = ?auto_308531 ?auto_308532 ) ) ( not ( = ?auto_308531 ?auto_308533 ) ) ( not ( = ?auto_308531 ?auto_308534 ) ) ( not ( = ?auto_308531 ?auto_308535 ) ) ( not ( = ?auto_308531 ?auto_308536 ) ) ( not ( = ?auto_308531 ?auto_308537 ) ) ( not ( = ?auto_308531 ?auto_308538 ) ) ( not ( = ?auto_308531 ?auto_308539 ) ) ( not ( = ?auto_308531 ?auto_308540 ) ) ( not ( = ?auto_308531 ?auto_308541 ) ) ( not ( = ?auto_308531 ?auto_308542 ) ) ( not ( = ?auto_308531 ?auto_308543 ) ) ( not ( = ?auto_308532 ?auto_308533 ) ) ( not ( = ?auto_308532 ?auto_308534 ) ) ( not ( = ?auto_308532 ?auto_308535 ) ) ( not ( = ?auto_308532 ?auto_308536 ) ) ( not ( = ?auto_308532 ?auto_308537 ) ) ( not ( = ?auto_308532 ?auto_308538 ) ) ( not ( = ?auto_308532 ?auto_308539 ) ) ( not ( = ?auto_308532 ?auto_308540 ) ) ( not ( = ?auto_308532 ?auto_308541 ) ) ( not ( = ?auto_308532 ?auto_308542 ) ) ( not ( = ?auto_308532 ?auto_308543 ) ) ( not ( = ?auto_308533 ?auto_308534 ) ) ( not ( = ?auto_308533 ?auto_308535 ) ) ( not ( = ?auto_308533 ?auto_308536 ) ) ( not ( = ?auto_308533 ?auto_308537 ) ) ( not ( = ?auto_308533 ?auto_308538 ) ) ( not ( = ?auto_308533 ?auto_308539 ) ) ( not ( = ?auto_308533 ?auto_308540 ) ) ( not ( = ?auto_308533 ?auto_308541 ) ) ( not ( = ?auto_308533 ?auto_308542 ) ) ( not ( = ?auto_308533 ?auto_308543 ) ) ( not ( = ?auto_308534 ?auto_308535 ) ) ( not ( = ?auto_308534 ?auto_308536 ) ) ( not ( = ?auto_308534 ?auto_308537 ) ) ( not ( = ?auto_308534 ?auto_308538 ) ) ( not ( = ?auto_308534 ?auto_308539 ) ) ( not ( = ?auto_308534 ?auto_308540 ) ) ( not ( = ?auto_308534 ?auto_308541 ) ) ( not ( = ?auto_308534 ?auto_308542 ) ) ( not ( = ?auto_308534 ?auto_308543 ) ) ( not ( = ?auto_308535 ?auto_308536 ) ) ( not ( = ?auto_308535 ?auto_308537 ) ) ( not ( = ?auto_308535 ?auto_308538 ) ) ( not ( = ?auto_308535 ?auto_308539 ) ) ( not ( = ?auto_308535 ?auto_308540 ) ) ( not ( = ?auto_308535 ?auto_308541 ) ) ( not ( = ?auto_308535 ?auto_308542 ) ) ( not ( = ?auto_308535 ?auto_308543 ) ) ( not ( = ?auto_308536 ?auto_308537 ) ) ( not ( = ?auto_308536 ?auto_308538 ) ) ( not ( = ?auto_308536 ?auto_308539 ) ) ( not ( = ?auto_308536 ?auto_308540 ) ) ( not ( = ?auto_308536 ?auto_308541 ) ) ( not ( = ?auto_308536 ?auto_308542 ) ) ( not ( = ?auto_308536 ?auto_308543 ) ) ( not ( = ?auto_308537 ?auto_308538 ) ) ( not ( = ?auto_308537 ?auto_308539 ) ) ( not ( = ?auto_308537 ?auto_308540 ) ) ( not ( = ?auto_308537 ?auto_308541 ) ) ( not ( = ?auto_308537 ?auto_308542 ) ) ( not ( = ?auto_308537 ?auto_308543 ) ) ( not ( = ?auto_308538 ?auto_308539 ) ) ( not ( = ?auto_308538 ?auto_308540 ) ) ( not ( = ?auto_308538 ?auto_308541 ) ) ( not ( = ?auto_308538 ?auto_308542 ) ) ( not ( = ?auto_308538 ?auto_308543 ) ) ( not ( = ?auto_308539 ?auto_308540 ) ) ( not ( = ?auto_308539 ?auto_308541 ) ) ( not ( = ?auto_308539 ?auto_308542 ) ) ( not ( = ?auto_308539 ?auto_308543 ) ) ( not ( = ?auto_308540 ?auto_308541 ) ) ( not ( = ?auto_308540 ?auto_308542 ) ) ( not ( = ?auto_308540 ?auto_308543 ) ) ( not ( = ?auto_308541 ?auto_308542 ) ) ( not ( = ?auto_308541 ?auto_308543 ) ) ( not ( = ?auto_308542 ?auto_308543 ) ) ( ON ?auto_308542 ?auto_308543 ) ( CLEAR ?auto_308540 ) ( ON ?auto_308541 ?auto_308542 ) ( CLEAR ?auto_308541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_308530 ?auto_308531 ?auto_308532 ?auto_308533 ?auto_308534 ?auto_308535 ?auto_308536 ?auto_308537 ?auto_308538 ?auto_308539 ?auto_308540 ?auto_308541 )
      ( MAKE-14PILE ?auto_308530 ?auto_308531 ?auto_308532 ?auto_308533 ?auto_308534 ?auto_308535 ?auto_308536 ?auto_308537 ?auto_308538 ?auto_308539 ?auto_308540 ?auto_308541 ?auto_308542 ?auto_308543 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308558 - BLOCK
      ?auto_308559 - BLOCK
      ?auto_308560 - BLOCK
      ?auto_308561 - BLOCK
      ?auto_308562 - BLOCK
      ?auto_308563 - BLOCK
      ?auto_308564 - BLOCK
      ?auto_308565 - BLOCK
      ?auto_308566 - BLOCK
      ?auto_308567 - BLOCK
      ?auto_308568 - BLOCK
      ?auto_308569 - BLOCK
      ?auto_308570 - BLOCK
      ?auto_308571 - BLOCK
    )
    :vars
    (
      ?auto_308572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308571 ?auto_308572 ) ( ON-TABLE ?auto_308558 ) ( ON ?auto_308559 ?auto_308558 ) ( ON ?auto_308560 ?auto_308559 ) ( ON ?auto_308561 ?auto_308560 ) ( ON ?auto_308562 ?auto_308561 ) ( ON ?auto_308563 ?auto_308562 ) ( ON ?auto_308564 ?auto_308563 ) ( ON ?auto_308565 ?auto_308564 ) ( ON ?auto_308566 ?auto_308565 ) ( ON ?auto_308567 ?auto_308566 ) ( not ( = ?auto_308558 ?auto_308559 ) ) ( not ( = ?auto_308558 ?auto_308560 ) ) ( not ( = ?auto_308558 ?auto_308561 ) ) ( not ( = ?auto_308558 ?auto_308562 ) ) ( not ( = ?auto_308558 ?auto_308563 ) ) ( not ( = ?auto_308558 ?auto_308564 ) ) ( not ( = ?auto_308558 ?auto_308565 ) ) ( not ( = ?auto_308558 ?auto_308566 ) ) ( not ( = ?auto_308558 ?auto_308567 ) ) ( not ( = ?auto_308558 ?auto_308568 ) ) ( not ( = ?auto_308558 ?auto_308569 ) ) ( not ( = ?auto_308558 ?auto_308570 ) ) ( not ( = ?auto_308558 ?auto_308571 ) ) ( not ( = ?auto_308558 ?auto_308572 ) ) ( not ( = ?auto_308559 ?auto_308560 ) ) ( not ( = ?auto_308559 ?auto_308561 ) ) ( not ( = ?auto_308559 ?auto_308562 ) ) ( not ( = ?auto_308559 ?auto_308563 ) ) ( not ( = ?auto_308559 ?auto_308564 ) ) ( not ( = ?auto_308559 ?auto_308565 ) ) ( not ( = ?auto_308559 ?auto_308566 ) ) ( not ( = ?auto_308559 ?auto_308567 ) ) ( not ( = ?auto_308559 ?auto_308568 ) ) ( not ( = ?auto_308559 ?auto_308569 ) ) ( not ( = ?auto_308559 ?auto_308570 ) ) ( not ( = ?auto_308559 ?auto_308571 ) ) ( not ( = ?auto_308559 ?auto_308572 ) ) ( not ( = ?auto_308560 ?auto_308561 ) ) ( not ( = ?auto_308560 ?auto_308562 ) ) ( not ( = ?auto_308560 ?auto_308563 ) ) ( not ( = ?auto_308560 ?auto_308564 ) ) ( not ( = ?auto_308560 ?auto_308565 ) ) ( not ( = ?auto_308560 ?auto_308566 ) ) ( not ( = ?auto_308560 ?auto_308567 ) ) ( not ( = ?auto_308560 ?auto_308568 ) ) ( not ( = ?auto_308560 ?auto_308569 ) ) ( not ( = ?auto_308560 ?auto_308570 ) ) ( not ( = ?auto_308560 ?auto_308571 ) ) ( not ( = ?auto_308560 ?auto_308572 ) ) ( not ( = ?auto_308561 ?auto_308562 ) ) ( not ( = ?auto_308561 ?auto_308563 ) ) ( not ( = ?auto_308561 ?auto_308564 ) ) ( not ( = ?auto_308561 ?auto_308565 ) ) ( not ( = ?auto_308561 ?auto_308566 ) ) ( not ( = ?auto_308561 ?auto_308567 ) ) ( not ( = ?auto_308561 ?auto_308568 ) ) ( not ( = ?auto_308561 ?auto_308569 ) ) ( not ( = ?auto_308561 ?auto_308570 ) ) ( not ( = ?auto_308561 ?auto_308571 ) ) ( not ( = ?auto_308561 ?auto_308572 ) ) ( not ( = ?auto_308562 ?auto_308563 ) ) ( not ( = ?auto_308562 ?auto_308564 ) ) ( not ( = ?auto_308562 ?auto_308565 ) ) ( not ( = ?auto_308562 ?auto_308566 ) ) ( not ( = ?auto_308562 ?auto_308567 ) ) ( not ( = ?auto_308562 ?auto_308568 ) ) ( not ( = ?auto_308562 ?auto_308569 ) ) ( not ( = ?auto_308562 ?auto_308570 ) ) ( not ( = ?auto_308562 ?auto_308571 ) ) ( not ( = ?auto_308562 ?auto_308572 ) ) ( not ( = ?auto_308563 ?auto_308564 ) ) ( not ( = ?auto_308563 ?auto_308565 ) ) ( not ( = ?auto_308563 ?auto_308566 ) ) ( not ( = ?auto_308563 ?auto_308567 ) ) ( not ( = ?auto_308563 ?auto_308568 ) ) ( not ( = ?auto_308563 ?auto_308569 ) ) ( not ( = ?auto_308563 ?auto_308570 ) ) ( not ( = ?auto_308563 ?auto_308571 ) ) ( not ( = ?auto_308563 ?auto_308572 ) ) ( not ( = ?auto_308564 ?auto_308565 ) ) ( not ( = ?auto_308564 ?auto_308566 ) ) ( not ( = ?auto_308564 ?auto_308567 ) ) ( not ( = ?auto_308564 ?auto_308568 ) ) ( not ( = ?auto_308564 ?auto_308569 ) ) ( not ( = ?auto_308564 ?auto_308570 ) ) ( not ( = ?auto_308564 ?auto_308571 ) ) ( not ( = ?auto_308564 ?auto_308572 ) ) ( not ( = ?auto_308565 ?auto_308566 ) ) ( not ( = ?auto_308565 ?auto_308567 ) ) ( not ( = ?auto_308565 ?auto_308568 ) ) ( not ( = ?auto_308565 ?auto_308569 ) ) ( not ( = ?auto_308565 ?auto_308570 ) ) ( not ( = ?auto_308565 ?auto_308571 ) ) ( not ( = ?auto_308565 ?auto_308572 ) ) ( not ( = ?auto_308566 ?auto_308567 ) ) ( not ( = ?auto_308566 ?auto_308568 ) ) ( not ( = ?auto_308566 ?auto_308569 ) ) ( not ( = ?auto_308566 ?auto_308570 ) ) ( not ( = ?auto_308566 ?auto_308571 ) ) ( not ( = ?auto_308566 ?auto_308572 ) ) ( not ( = ?auto_308567 ?auto_308568 ) ) ( not ( = ?auto_308567 ?auto_308569 ) ) ( not ( = ?auto_308567 ?auto_308570 ) ) ( not ( = ?auto_308567 ?auto_308571 ) ) ( not ( = ?auto_308567 ?auto_308572 ) ) ( not ( = ?auto_308568 ?auto_308569 ) ) ( not ( = ?auto_308568 ?auto_308570 ) ) ( not ( = ?auto_308568 ?auto_308571 ) ) ( not ( = ?auto_308568 ?auto_308572 ) ) ( not ( = ?auto_308569 ?auto_308570 ) ) ( not ( = ?auto_308569 ?auto_308571 ) ) ( not ( = ?auto_308569 ?auto_308572 ) ) ( not ( = ?auto_308570 ?auto_308571 ) ) ( not ( = ?auto_308570 ?auto_308572 ) ) ( not ( = ?auto_308571 ?auto_308572 ) ) ( ON ?auto_308570 ?auto_308571 ) ( ON ?auto_308569 ?auto_308570 ) ( CLEAR ?auto_308567 ) ( ON ?auto_308568 ?auto_308569 ) ( CLEAR ?auto_308568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_308558 ?auto_308559 ?auto_308560 ?auto_308561 ?auto_308562 ?auto_308563 ?auto_308564 ?auto_308565 ?auto_308566 ?auto_308567 ?auto_308568 )
      ( MAKE-14PILE ?auto_308558 ?auto_308559 ?auto_308560 ?auto_308561 ?auto_308562 ?auto_308563 ?auto_308564 ?auto_308565 ?auto_308566 ?auto_308567 ?auto_308568 ?auto_308569 ?auto_308570 ?auto_308571 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308587 - BLOCK
      ?auto_308588 - BLOCK
      ?auto_308589 - BLOCK
      ?auto_308590 - BLOCK
      ?auto_308591 - BLOCK
      ?auto_308592 - BLOCK
      ?auto_308593 - BLOCK
      ?auto_308594 - BLOCK
      ?auto_308595 - BLOCK
      ?auto_308596 - BLOCK
      ?auto_308597 - BLOCK
      ?auto_308598 - BLOCK
      ?auto_308599 - BLOCK
      ?auto_308600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308600 ) ( ON-TABLE ?auto_308587 ) ( ON ?auto_308588 ?auto_308587 ) ( ON ?auto_308589 ?auto_308588 ) ( ON ?auto_308590 ?auto_308589 ) ( ON ?auto_308591 ?auto_308590 ) ( ON ?auto_308592 ?auto_308591 ) ( ON ?auto_308593 ?auto_308592 ) ( ON ?auto_308594 ?auto_308593 ) ( ON ?auto_308595 ?auto_308594 ) ( ON ?auto_308596 ?auto_308595 ) ( not ( = ?auto_308587 ?auto_308588 ) ) ( not ( = ?auto_308587 ?auto_308589 ) ) ( not ( = ?auto_308587 ?auto_308590 ) ) ( not ( = ?auto_308587 ?auto_308591 ) ) ( not ( = ?auto_308587 ?auto_308592 ) ) ( not ( = ?auto_308587 ?auto_308593 ) ) ( not ( = ?auto_308587 ?auto_308594 ) ) ( not ( = ?auto_308587 ?auto_308595 ) ) ( not ( = ?auto_308587 ?auto_308596 ) ) ( not ( = ?auto_308587 ?auto_308597 ) ) ( not ( = ?auto_308587 ?auto_308598 ) ) ( not ( = ?auto_308587 ?auto_308599 ) ) ( not ( = ?auto_308587 ?auto_308600 ) ) ( not ( = ?auto_308588 ?auto_308589 ) ) ( not ( = ?auto_308588 ?auto_308590 ) ) ( not ( = ?auto_308588 ?auto_308591 ) ) ( not ( = ?auto_308588 ?auto_308592 ) ) ( not ( = ?auto_308588 ?auto_308593 ) ) ( not ( = ?auto_308588 ?auto_308594 ) ) ( not ( = ?auto_308588 ?auto_308595 ) ) ( not ( = ?auto_308588 ?auto_308596 ) ) ( not ( = ?auto_308588 ?auto_308597 ) ) ( not ( = ?auto_308588 ?auto_308598 ) ) ( not ( = ?auto_308588 ?auto_308599 ) ) ( not ( = ?auto_308588 ?auto_308600 ) ) ( not ( = ?auto_308589 ?auto_308590 ) ) ( not ( = ?auto_308589 ?auto_308591 ) ) ( not ( = ?auto_308589 ?auto_308592 ) ) ( not ( = ?auto_308589 ?auto_308593 ) ) ( not ( = ?auto_308589 ?auto_308594 ) ) ( not ( = ?auto_308589 ?auto_308595 ) ) ( not ( = ?auto_308589 ?auto_308596 ) ) ( not ( = ?auto_308589 ?auto_308597 ) ) ( not ( = ?auto_308589 ?auto_308598 ) ) ( not ( = ?auto_308589 ?auto_308599 ) ) ( not ( = ?auto_308589 ?auto_308600 ) ) ( not ( = ?auto_308590 ?auto_308591 ) ) ( not ( = ?auto_308590 ?auto_308592 ) ) ( not ( = ?auto_308590 ?auto_308593 ) ) ( not ( = ?auto_308590 ?auto_308594 ) ) ( not ( = ?auto_308590 ?auto_308595 ) ) ( not ( = ?auto_308590 ?auto_308596 ) ) ( not ( = ?auto_308590 ?auto_308597 ) ) ( not ( = ?auto_308590 ?auto_308598 ) ) ( not ( = ?auto_308590 ?auto_308599 ) ) ( not ( = ?auto_308590 ?auto_308600 ) ) ( not ( = ?auto_308591 ?auto_308592 ) ) ( not ( = ?auto_308591 ?auto_308593 ) ) ( not ( = ?auto_308591 ?auto_308594 ) ) ( not ( = ?auto_308591 ?auto_308595 ) ) ( not ( = ?auto_308591 ?auto_308596 ) ) ( not ( = ?auto_308591 ?auto_308597 ) ) ( not ( = ?auto_308591 ?auto_308598 ) ) ( not ( = ?auto_308591 ?auto_308599 ) ) ( not ( = ?auto_308591 ?auto_308600 ) ) ( not ( = ?auto_308592 ?auto_308593 ) ) ( not ( = ?auto_308592 ?auto_308594 ) ) ( not ( = ?auto_308592 ?auto_308595 ) ) ( not ( = ?auto_308592 ?auto_308596 ) ) ( not ( = ?auto_308592 ?auto_308597 ) ) ( not ( = ?auto_308592 ?auto_308598 ) ) ( not ( = ?auto_308592 ?auto_308599 ) ) ( not ( = ?auto_308592 ?auto_308600 ) ) ( not ( = ?auto_308593 ?auto_308594 ) ) ( not ( = ?auto_308593 ?auto_308595 ) ) ( not ( = ?auto_308593 ?auto_308596 ) ) ( not ( = ?auto_308593 ?auto_308597 ) ) ( not ( = ?auto_308593 ?auto_308598 ) ) ( not ( = ?auto_308593 ?auto_308599 ) ) ( not ( = ?auto_308593 ?auto_308600 ) ) ( not ( = ?auto_308594 ?auto_308595 ) ) ( not ( = ?auto_308594 ?auto_308596 ) ) ( not ( = ?auto_308594 ?auto_308597 ) ) ( not ( = ?auto_308594 ?auto_308598 ) ) ( not ( = ?auto_308594 ?auto_308599 ) ) ( not ( = ?auto_308594 ?auto_308600 ) ) ( not ( = ?auto_308595 ?auto_308596 ) ) ( not ( = ?auto_308595 ?auto_308597 ) ) ( not ( = ?auto_308595 ?auto_308598 ) ) ( not ( = ?auto_308595 ?auto_308599 ) ) ( not ( = ?auto_308595 ?auto_308600 ) ) ( not ( = ?auto_308596 ?auto_308597 ) ) ( not ( = ?auto_308596 ?auto_308598 ) ) ( not ( = ?auto_308596 ?auto_308599 ) ) ( not ( = ?auto_308596 ?auto_308600 ) ) ( not ( = ?auto_308597 ?auto_308598 ) ) ( not ( = ?auto_308597 ?auto_308599 ) ) ( not ( = ?auto_308597 ?auto_308600 ) ) ( not ( = ?auto_308598 ?auto_308599 ) ) ( not ( = ?auto_308598 ?auto_308600 ) ) ( not ( = ?auto_308599 ?auto_308600 ) ) ( ON ?auto_308599 ?auto_308600 ) ( ON ?auto_308598 ?auto_308599 ) ( CLEAR ?auto_308596 ) ( ON ?auto_308597 ?auto_308598 ) ( CLEAR ?auto_308597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_308587 ?auto_308588 ?auto_308589 ?auto_308590 ?auto_308591 ?auto_308592 ?auto_308593 ?auto_308594 ?auto_308595 ?auto_308596 ?auto_308597 )
      ( MAKE-14PILE ?auto_308587 ?auto_308588 ?auto_308589 ?auto_308590 ?auto_308591 ?auto_308592 ?auto_308593 ?auto_308594 ?auto_308595 ?auto_308596 ?auto_308597 ?auto_308598 ?auto_308599 ?auto_308600 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308615 - BLOCK
      ?auto_308616 - BLOCK
      ?auto_308617 - BLOCK
      ?auto_308618 - BLOCK
      ?auto_308619 - BLOCK
      ?auto_308620 - BLOCK
      ?auto_308621 - BLOCK
      ?auto_308622 - BLOCK
      ?auto_308623 - BLOCK
      ?auto_308624 - BLOCK
      ?auto_308625 - BLOCK
      ?auto_308626 - BLOCK
      ?auto_308627 - BLOCK
      ?auto_308628 - BLOCK
    )
    :vars
    (
      ?auto_308629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308628 ?auto_308629 ) ( ON-TABLE ?auto_308615 ) ( ON ?auto_308616 ?auto_308615 ) ( ON ?auto_308617 ?auto_308616 ) ( ON ?auto_308618 ?auto_308617 ) ( ON ?auto_308619 ?auto_308618 ) ( ON ?auto_308620 ?auto_308619 ) ( ON ?auto_308621 ?auto_308620 ) ( ON ?auto_308622 ?auto_308621 ) ( ON ?auto_308623 ?auto_308622 ) ( not ( = ?auto_308615 ?auto_308616 ) ) ( not ( = ?auto_308615 ?auto_308617 ) ) ( not ( = ?auto_308615 ?auto_308618 ) ) ( not ( = ?auto_308615 ?auto_308619 ) ) ( not ( = ?auto_308615 ?auto_308620 ) ) ( not ( = ?auto_308615 ?auto_308621 ) ) ( not ( = ?auto_308615 ?auto_308622 ) ) ( not ( = ?auto_308615 ?auto_308623 ) ) ( not ( = ?auto_308615 ?auto_308624 ) ) ( not ( = ?auto_308615 ?auto_308625 ) ) ( not ( = ?auto_308615 ?auto_308626 ) ) ( not ( = ?auto_308615 ?auto_308627 ) ) ( not ( = ?auto_308615 ?auto_308628 ) ) ( not ( = ?auto_308615 ?auto_308629 ) ) ( not ( = ?auto_308616 ?auto_308617 ) ) ( not ( = ?auto_308616 ?auto_308618 ) ) ( not ( = ?auto_308616 ?auto_308619 ) ) ( not ( = ?auto_308616 ?auto_308620 ) ) ( not ( = ?auto_308616 ?auto_308621 ) ) ( not ( = ?auto_308616 ?auto_308622 ) ) ( not ( = ?auto_308616 ?auto_308623 ) ) ( not ( = ?auto_308616 ?auto_308624 ) ) ( not ( = ?auto_308616 ?auto_308625 ) ) ( not ( = ?auto_308616 ?auto_308626 ) ) ( not ( = ?auto_308616 ?auto_308627 ) ) ( not ( = ?auto_308616 ?auto_308628 ) ) ( not ( = ?auto_308616 ?auto_308629 ) ) ( not ( = ?auto_308617 ?auto_308618 ) ) ( not ( = ?auto_308617 ?auto_308619 ) ) ( not ( = ?auto_308617 ?auto_308620 ) ) ( not ( = ?auto_308617 ?auto_308621 ) ) ( not ( = ?auto_308617 ?auto_308622 ) ) ( not ( = ?auto_308617 ?auto_308623 ) ) ( not ( = ?auto_308617 ?auto_308624 ) ) ( not ( = ?auto_308617 ?auto_308625 ) ) ( not ( = ?auto_308617 ?auto_308626 ) ) ( not ( = ?auto_308617 ?auto_308627 ) ) ( not ( = ?auto_308617 ?auto_308628 ) ) ( not ( = ?auto_308617 ?auto_308629 ) ) ( not ( = ?auto_308618 ?auto_308619 ) ) ( not ( = ?auto_308618 ?auto_308620 ) ) ( not ( = ?auto_308618 ?auto_308621 ) ) ( not ( = ?auto_308618 ?auto_308622 ) ) ( not ( = ?auto_308618 ?auto_308623 ) ) ( not ( = ?auto_308618 ?auto_308624 ) ) ( not ( = ?auto_308618 ?auto_308625 ) ) ( not ( = ?auto_308618 ?auto_308626 ) ) ( not ( = ?auto_308618 ?auto_308627 ) ) ( not ( = ?auto_308618 ?auto_308628 ) ) ( not ( = ?auto_308618 ?auto_308629 ) ) ( not ( = ?auto_308619 ?auto_308620 ) ) ( not ( = ?auto_308619 ?auto_308621 ) ) ( not ( = ?auto_308619 ?auto_308622 ) ) ( not ( = ?auto_308619 ?auto_308623 ) ) ( not ( = ?auto_308619 ?auto_308624 ) ) ( not ( = ?auto_308619 ?auto_308625 ) ) ( not ( = ?auto_308619 ?auto_308626 ) ) ( not ( = ?auto_308619 ?auto_308627 ) ) ( not ( = ?auto_308619 ?auto_308628 ) ) ( not ( = ?auto_308619 ?auto_308629 ) ) ( not ( = ?auto_308620 ?auto_308621 ) ) ( not ( = ?auto_308620 ?auto_308622 ) ) ( not ( = ?auto_308620 ?auto_308623 ) ) ( not ( = ?auto_308620 ?auto_308624 ) ) ( not ( = ?auto_308620 ?auto_308625 ) ) ( not ( = ?auto_308620 ?auto_308626 ) ) ( not ( = ?auto_308620 ?auto_308627 ) ) ( not ( = ?auto_308620 ?auto_308628 ) ) ( not ( = ?auto_308620 ?auto_308629 ) ) ( not ( = ?auto_308621 ?auto_308622 ) ) ( not ( = ?auto_308621 ?auto_308623 ) ) ( not ( = ?auto_308621 ?auto_308624 ) ) ( not ( = ?auto_308621 ?auto_308625 ) ) ( not ( = ?auto_308621 ?auto_308626 ) ) ( not ( = ?auto_308621 ?auto_308627 ) ) ( not ( = ?auto_308621 ?auto_308628 ) ) ( not ( = ?auto_308621 ?auto_308629 ) ) ( not ( = ?auto_308622 ?auto_308623 ) ) ( not ( = ?auto_308622 ?auto_308624 ) ) ( not ( = ?auto_308622 ?auto_308625 ) ) ( not ( = ?auto_308622 ?auto_308626 ) ) ( not ( = ?auto_308622 ?auto_308627 ) ) ( not ( = ?auto_308622 ?auto_308628 ) ) ( not ( = ?auto_308622 ?auto_308629 ) ) ( not ( = ?auto_308623 ?auto_308624 ) ) ( not ( = ?auto_308623 ?auto_308625 ) ) ( not ( = ?auto_308623 ?auto_308626 ) ) ( not ( = ?auto_308623 ?auto_308627 ) ) ( not ( = ?auto_308623 ?auto_308628 ) ) ( not ( = ?auto_308623 ?auto_308629 ) ) ( not ( = ?auto_308624 ?auto_308625 ) ) ( not ( = ?auto_308624 ?auto_308626 ) ) ( not ( = ?auto_308624 ?auto_308627 ) ) ( not ( = ?auto_308624 ?auto_308628 ) ) ( not ( = ?auto_308624 ?auto_308629 ) ) ( not ( = ?auto_308625 ?auto_308626 ) ) ( not ( = ?auto_308625 ?auto_308627 ) ) ( not ( = ?auto_308625 ?auto_308628 ) ) ( not ( = ?auto_308625 ?auto_308629 ) ) ( not ( = ?auto_308626 ?auto_308627 ) ) ( not ( = ?auto_308626 ?auto_308628 ) ) ( not ( = ?auto_308626 ?auto_308629 ) ) ( not ( = ?auto_308627 ?auto_308628 ) ) ( not ( = ?auto_308627 ?auto_308629 ) ) ( not ( = ?auto_308628 ?auto_308629 ) ) ( ON ?auto_308627 ?auto_308628 ) ( ON ?auto_308626 ?auto_308627 ) ( ON ?auto_308625 ?auto_308626 ) ( CLEAR ?auto_308623 ) ( ON ?auto_308624 ?auto_308625 ) ( CLEAR ?auto_308624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_308615 ?auto_308616 ?auto_308617 ?auto_308618 ?auto_308619 ?auto_308620 ?auto_308621 ?auto_308622 ?auto_308623 ?auto_308624 )
      ( MAKE-14PILE ?auto_308615 ?auto_308616 ?auto_308617 ?auto_308618 ?auto_308619 ?auto_308620 ?auto_308621 ?auto_308622 ?auto_308623 ?auto_308624 ?auto_308625 ?auto_308626 ?auto_308627 ?auto_308628 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308644 - BLOCK
      ?auto_308645 - BLOCK
      ?auto_308646 - BLOCK
      ?auto_308647 - BLOCK
      ?auto_308648 - BLOCK
      ?auto_308649 - BLOCK
      ?auto_308650 - BLOCK
      ?auto_308651 - BLOCK
      ?auto_308652 - BLOCK
      ?auto_308653 - BLOCK
      ?auto_308654 - BLOCK
      ?auto_308655 - BLOCK
      ?auto_308656 - BLOCK
      ?auto_308657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308657 ) ( ON-TABLE ?auto_308644 ) ( ON ?auto_308645 ?auto_308644 ) ( ON ?auto_308646 ?auto_308645 ) ( ON ?auto_308647 ?auto_308646 ) ( ON ?auto_308648 ?auto_308647 ) ( ON ?auto_308649 ?auto_308648 ) ( ON ?auto_308650 ?auto_308649 ) ( ON ?auto_308651 ?auto_308650 ) ( ON ?auto_308652 ?auto_308651 ) ( not ( = ?auto_308644 ?auto_308645 ) ) ( not ( = ?auto_308644 ?auto_308646 ) ) ( not ( = ?auto_308644 ?auto_308647 ) ) ( not ( = ?auto_308644 ?auto_308648 ) ) ( not ( = ?auto_308644 ?auto_308649 ) ) ( not ( = ?auto_308644 ?auto_308650 ) ) ( not ( = ?auto_308644 ?auto_308651 ) ) ( not ( = ?auto_308644 ?auto_308652 ) ) ( not ( = ?auto_308644 ?auto_308653 ) ) ( not ( = ?auto_308644 ?auto_308654 ) ) ( not ( = ?auto_308644 ?auto_308655 ) ) ( not ( = ?auto_308644 ?auto_308656 ) ) ( not ( = ?auto_308644 ?auto_308657 ) ) ( not ( = ?auto_308645 ?auto_308646 ) ) ( not ( = ?auto_308645 ?auto_308647 ) ) ( not ( = ?auto_308645 ?auto_308648 ) ) ( not ( = ?auto_308645 ?auto_308649 ) ) ( not ( = ?auto_308645 ?auto_308650 ) ) ( not ( = ?auto_308645 ?auto_308651 ) ) ( not ( = ?auto_308645 ?auto_308652 ) ) ( not ( = ?auto_308645 ?auto_308653 ) ) ( not ( = ?auto_308645 ?auto_308654 ) ) ( not ( = ?auto_308645 ?auto_308655 ) ) ( not ( = ?auto_308645 ?auto_308656 ) ) ( not ( = ?auto_308645 ?auto_308657 ) ) ( not ( = ?auto_308646 ?auto_308647 ) ) ( not ( = ?auto_308646 ?auto_308648 ) ) ( not ( = ?auto_308646 ?auto_308649 ) ) ( not ( = ?auto_308646 ?auto_308650 ) ) ( not ( = ?auto_308646 ?auto_308651 ) ) ( not ( = ?auto_308646 ?auto_308652 ) ) ( not ( = ?auto_308646 ?auto_308653 ) ) ( not ( = ?auto_308646 ?auto_308654 ) ) ( not ( = ?auto_308646 ?auto_308655 ) ) ( not ( = ?auto_308646 ?auto_308656 ) ) ( not ( = ?auto_308646 ?auto_308657 ) ) ( not ( = ?auto_308647 ?auto_308648 ) ) ( not ( = ?auto_308647 ?auto_308649 ) ) ( not ( = ?auto_308647 ?auto_308650 ) ) ( not ( = ?auto_308647 ?auto_308651 ) ) ( not ( = ?auto_308647 ?auto_308652 ) ) ( not ( = ?auto_308647 ?auto_308653 ) ) ( not ( = ?auto_308647 ?auto_308654 ) ) ( not ( = ?auto_308647 ?auto_308655 ) ) ( not ( = ?auto_308647 ?auto_308656 ) ) ( not ( = ?auto_308647 ?auto_308657 ) ) ( not ( = ?auto_308648 ?auto_308649 ) ) ( not ( = ?auto_308648 ?auto_308650 ) ) ( not ( = ?auto_308648 ?auto_308651 ) ) ( not ( = ?auto_308648 ?auto_308652 ) ) ( not ( = ?auto_308648 ?auto_308653 ) ) ( not ( = ?auto_308648 ?auto_308654 ) ) ( not ( = ?auto_308648 ?auto_308655 ) ) ( not ( = ?auto_308648 ?auto_308656 ) ) ( not ( = ?auto_308648 ?auto_308657 ) ) ( not ( = ?auto_308649 ?auto_308650 ) ) ( not ( = ?auto_308649 ?auto_308651 ) ) ( not ( = ?auto_308649 ?auto_308652 ) ) ( not ( = ?auto_308649 ?auto_308653 ) ) ( not ( = ?auto_308649 ?auto_308654 ) ) ( not ( = ?auto_308649 ?auto_308655 ) ) ( not ( = ?auto_308649 ?auto_308656 ) ) ( not ( = ?auto_308649 ?auto_308657 ) ) ( not ( = ?auto_308650 ?auto_308651 ) ) ( not ( = ?auto_308650 ?auto_308652 ) ) ( not ( = ?auto_308650 ?auto_308653 ) ) ( not ( = ?auto_308650 ?auto_308654 ) ) ( not ( = ?auto_308650 ?auto_308655 ) ) ( not ( = ?auto_308650 ?auto_308656 ) ) ( not ( = ?auto_308650 ?auto_308657 ) ) ( not ( = ?auto_308651 ?auto_308652 ) ) ( not ( = ?auto_308651 ?auto_308653 ) ) ( not ( = ?auto_308651 ?auto_308654 ) ) ( not ( = ?auto_308651 ?auto_308655 ) ) ( not ( = ?auto_308651 ?auto_308656 ) ) ( not ( = ?auto_308651 ?auto_308657 ) ) ( not ( = ?auto_308652 ?auto_308653 ) ) ( not ( = ?auto_308652 ?auto_308654 ) ) ( not ( = ?auto_308652 ?auto_308655 ) ) ( not ( = ?auto_308652 ?auto_308656 ) ) ( not ( = ?auto_308652 ?auto_308657 ) ) ( not ( = ?auto_308653 ?auto_308654 ) ) ( not ( = ?auto_308653 ?auto_308655 ) ) ( not ( = ?auto_308653 ?auto_308656 ) ) ( not ( = ?auto_308653 ?auto_308657 ) ) ( not ( = ?auto_308654 ?auto_308655 ) ) ( not ( = ?auto_308654 ?auto_308656 ) ) ( not ( = ?auto_308654 ?auto_308657 ) ) ( not ( = ?auto_308655 ?auto_308656 ) ) ( not ( = ?auto_308655 ?auto_308657 ) ) ( not ( = ?auto_308656 ?auto_308657 ) ) ( ON ?auto_308656 ?auto_308657 ) ( ON ?auto_308655 ?auto_308656 ) ( ON ?auto_308654 ?auto_308655 ) ( CLEAR ?auto_308652 ) ( ON ?auto_308653 ?auto_308654 ) ( CLEAR ?auto_308653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_308644 ?auto_308645 ?auto_308646 ?auto_308647 ?auto_308648 ?auto_308649 ?auto_308650 ?auto_308651 ?auto_308652 ?auto_308653 )
      ( MAKE-14PILE ?auto_308644 ?auto_308645 ?auto_308646 ?auto_308647 ?auto_308648 ?auto_308649 ?auto_308650 ?auto_308651 ?auto_308652 ?auto_308653 ?auto_308654 ?auto_308655 ?auto_308656 ?auto_308657 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308672 - BLOCK
      ?auto_308673 - BLOCK
      ?auto_308674 - BLOCK
      ?auto_308675 - BLOCK
      ?auto_308676 - BLOCK
      ?auto_308677 - BLOCK
      ?auto_308678 - BLOCK
      ?auto_308679 - BLOCK
      ?auto_308680 - BLOCK
      ?auto_308681 - BLOCK
      ?auto_308682 - BLOCK
      ?auto_308683 - BLOCK
      ?auto_308684 - BLOCK
      ?auto_308685 - BLOCK
    )
    :vars
    (
      ?auto_308686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308685 ?auto_308686 ) ( ON-TABLE ?auto_308672 ) ( ON ?auto_308673 ?auto_308672 ) ( ON ?auto_308674 ?auto_308673 ) ( ON ?auto_308675 ?auto_308674 ) ( ON ?auto_308676 ?auto_308675 ) ( ON ?auto_308677 ?auto_308676 ) ( ON ?auto_308678 ?auto_308677 ) ( ON ?auto_308679 ?auto_308678 ) ( not ( = ?auto_308672 ?auto_308673 ) ) ( not ( = ?auto_308672 ?auto_308674 ) ) ( not ( = ?auto_308672 ?auto_308675 ) ) ( not ( = ?auto_308672 ?auto_308676 ) ) ( not ( = ?auto_308672 ?auto_308677 ) ) ( not ( = ?auto_308672 ?auto_308678 ) ) ( not ( = ?auto_308672 ?auto_308679 ) ) ( not ( = ?auto_308672 ?auto_308680 ) ) ( not ( = ?auto_308672 ?auto_308681 ) ) ( not ( = ?auto_308672 ?auto_308682 ) ) ( not ( = ?auto_308672 ?auto_308683 ) ) ( not ( = ?auto_308672 ?auto_308684 ) ) ( not ( = ?auto_308672 ?auto_308685 ) ) ( not ( = ?auto_308672 ?auto_308686 ) ) ( not ( = ?auto_308673 ?auto_308674 ) ) ( not ( = ?auto_308673 ?auto_308675 ) ) ( not ( = ?auto_308673 ?auto_308676 ) ) ( not ( = ?auto_308673 ?auto_308677 ) ) ( not ( = ?auto_308673 ?auto_308678 ) ) ( not ( = ?auto_308673 ?auto_308679 ) ) ( not ( = ?auto_308673 ?auto_308680 ) ) ( not ( = ?auto_308673 ?auto_308681 ) ) ( not ( = ?auto_308673 ?auto_308682 ) ) ( not ( = ?auto_308673 ?auto_308683 ) ) ( not ( = ?auto_308673 ?auto_308684 ) ) ( not ( = ?auto_308673 ?auto_308685 ) ) ( not ( = ?auto_308673 ?auto_308686 ) ) ( not ( = ?auto_308674 ?auto_308675 ) ) ( not ( = ?auto_308674 ?auto_308676 ) ) ( not ( = ?auto_308674 ?auto_308677 ) ) ( not ( = ?auto_308674 ?auto_308678 ) ) ( not ( = ?auto_308674 ?auto_308679 ) ) ( not ( = ?auto_308674 ?auto_308680 ) ) ( not ( = ?auto_308674 ?auto_308681 ) ) ( not ( = ?auto_308674 ?auto_308682 ) ) ( not ( = ?auto_308674 ?auto_308683 ) ) ( not ( = ?auto_308674 ?auto_308684 ) ) ( not ( = ?auto_308674 ?auto_308685 ) ) ( not ( = ?auto_308674 ?auto_308686 ) ) ( not ( = ?auto_308675 ?auto_308676 ) ) ( not ( = ?auto_308675 ?auto_308677 ) ) ( not ( = ?auto_308675 ?auto_308678 ) ) ( not ( = ?auto_308675 ?auto_308679 ) ) ( not ( = ?auto_308675 ?auto_308680 ) ) ( not ( = ?auto_308675 ?auto_308681 ) ) ( not ( = ?auto_308675 ?auto_308682 ) ) ( not ( = ?auto_308675 ?auto_308683 ) ) ( not ( = ?auto_308675 ?auto_308684 ) ) ( not ( = ?auto_308675 ?auto_308685 ) ) ( not ( = ?auto_308675 ?auto_308686 ) ) ( not ( = ?auto_308676 ?auto_308677 ) ) ( not ( = ?auto_308676 ?auto_308678 ) ) ( not ( = ?auto_308676 ?auto_308679 ) ) ( not ( = ?auto_308676 ?auto_308680 ) ) ( not ( = ?auto_308676 ?auto_308681 ) ) ( not ( = ?auto_308676 ?auto_308682 ) ) ( not ( = ?auto_308676 ?auto_308683 ) ) ( not ( = ?auto_308676 ?auto_308684 ) ) ( not ( = ?auto_308676 ?auto_308685 ) ) ( not ( = ?auto_308676 ?auto_308686 ) ) ( not ( = ?auto_308677 ?auto_308678 ) ) ( not ( = ?auto_308677 ?auto_308679 ) ) ( not ( = ?auto_308677 ?auto_308680 ) ) ( not ( = ?auto_308677 ?auto_308681 ) ) ( not ( = ?auto_308677 ?auto_308682 ) ) ( not ( = ?auto_308677 ?auto_308683 ) ) ( not ( = ?auto_308677 ?auto_308684 ) ) ( not ( = ?auto_308677 ?auto_308685 ) ) ( not ( = ?auto_308677 ?auto_308686 ) ) ( not ( = ?auto_308678 ?auto_308679 ) ) ( not ( = ?auto_308678 ?auto_308680 ) ) ( not ( = ?auto_308678 ?auto_308681 ) ) ( not ( = ?auto_308678 ?auto_308682 ) ) ( not ( = ?auto_308678 ?auto_308683 ) ) ( not ( = ?auto_308678 ?auto_308684 ) ) ( not ( = ?auto_308678 ?auto_308685 ) ) ( not ( = ?auto_308678 ?auto_308686 ) ) ( not ( = ?auto_308679 ?auto_308680 ) ) ( not ( = ?auto_308679 ?auto_308681 ) ) ( not ( = ?auto_308679 ?auto_308682 ) ) ( not ( = ?auto_308679 ?auto_308683 ) ) ( not ( = ?auto_308679 ?auto_308684 ) ) ( not ( = ?auto_308679 ?auto_308685 ) ) ( not ( = ?auto_308679 ?auto_308686 ) ) ( not ( = ?auto_308680 ?auto_308681 ) ) ( not ( = ?auto_308680 ?auto_308682 ) ) ( not ( = ?auto_308680 ?auto_308683 ) ) ( not ( = ?auto_308680 ?auto_308684 ) ) ( not ( = ?auto_308680 ?auto_308685 ) ) ( not ( = ?auto_308680 ?auto_308686 ) ) ( not ( = ?auto_308681 ?auto_308682 ) ) ( not ( = ?auto_308681 ?auto_308683 ) ) ( not ( = ?auto_308681 ?auto_308684 ) ) ( not ( = ?auto_308681 ?auto_308685 ) ) ( not ( = ?auto_308681 ?auto_308686 ) ) ( not ( = ?auto_308682 ?auto_308683 ) ) ( not ( = ?auto_308682 ?auto_308684 ) ) ( not ( = ?auto_308682 ?auto_308685 ) ) ( not ( = ?auto_308682 ?auto_308686 ) ) ( not ( = ?auto_308683 ?auto_308684 ) ) ( not ( = ?auto_308683 ?auto_308685 ) ) ( not ( = ?auto_308683 ?auto_308686 ) ) ( not ( = ?auto_308684 ?auto_308685 ) ) ( not ( = ?auto_308684 ?auto_308686 ) ) ( not ( = ?auto_308685 ?auto_308686 ) ) ( ON ?auto_308684 ?auto_308685 ) ( ON ?auto_308683 ?auto_308684 ) ( ON ?auto_308682 ?auto_308683 ) ( ON ?auto_308681 ?auto_308682 ) ( CLEAR ?auto_308679 ) ( ON ?auto_308680 ?auto_308681 ) ( CLEAR ?auto_308680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_308672 ?auto_308673 ?auto_308674 ?auto_308675 ?auto_308676 ?auto_308677 ?auto_308678 ?auto_308679 ?auto_308680 )
      ( MAKE-14PILE ?auto_308672 ?auto_308673 ?auto_308674 ?auto_308675 ?auto_308676 ?auto_308677 ?auto_308678 ?auto_308679 ?auto_308680 ?auto_308681 ?auto_308682 ?auto_308683 ?auto_308684 ?auto_308685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308701 - BLOCK
      ?auto_308702 - BLOCK
      ?auto_308703 - BLOCK
      ?auto_308704 - BLOCK
      ?auto_308705 - BLOCK
      ?auto_308706 - BLOCK
      ?auto_308707 - BLOCK
      ?auto_308708 - BLOCK
      ?auto_308709 - BLOCK
      ?auto_308710 - BLOCK
      ?auto_308711 - BLOCK
      ?auto_308712 - BLOCK
      ?auto_308713 - BLOCK
      ?auto_308714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308714 ) ( ON-TABLE ?auto_308701 ) ( ON ?auto_308702 ?auto_308701 ) ( ON ?auto_308703 ?auto_308702 ) ( ON ?auto_308704 ?auto_308703 ) ( ON ?auto_308705 ?auto_308704 ) ( ON ?auto_308706 ?auto_308705 ) ( ON ?auto_308707 ?auto_308706 ) ( ON ?auto_308708 ?auto_308707 ) ( not ( = ?auto_308701 ?auto_308702 ) ) ( not ( = ?auto_308701 ?auto_308703 ) ) ( not ( = ?auto_308701 ?auto_308704 ) ) ( not ( = ?auto_308701 ?auto_308705 ) ) ( not ( = ?auto_308701 ?auto_308706 ) ) ( not ( = ?auto_308701 ?auto_308707 ) ) ( not ( = ?auto_308701 ?auto_308708 ) ) ( not ( = ?auto_308701 ?auto_308709 ) ) ( not ( = ?auto_308701 ?auto_308710 ) ) ( not ( = ?auto_308701 ?auto_308711 ) ) ( not ( = ?auto_308701 ?auto_308712 ) ) ( not ( = ?auto_308701 ?auto_308713 ) ) ( not ( = ?auto_308701 ?auto_308714 ) ) ( not ( = ?auto_308702 ?auto_308703 ) ) ( not ( = ?auto_308702 ?auto_308704 ) ) ( not ( = ?auto_308702 ?auto_308705 ) ) ( not ( = ?auto_308702 ?auto_308706 ) ) ( not ( = ?auto_308702 ?auto_308707 ) ) ( not ( = ?auto_308702 ?auto_308708 ) ) ( not ( = ?auto_308702 ?auto_308709 ) ) ( not ( = ?auto_308702 ?auto_308710 ) ) ( not ( = ?auto_308702 ?auto_308711 ) ) ( not ( = ?auto_308702 ?auto_308712 ) ) ( not ( = ?auto_308702 ?auto_308713 ) ) ( not ( = ?auto_308702 ?auto_308714 ) ) ( not ( = ?auto_308703 ?auto_308704 ) ) ( not ( = ?auto_308703 ?auto_308705 ) ) ( not ( = ?auto_308703 ?auto_308706 ) ) ( not ( = ?auto_308703 ?auto_308707 ) ) ( not ( = ?auto_308703 ?auto_308708 ) ) ( not ( = ?auto_308703 ?auto_308709 ) ) ( not ( = ?auto_308703 ?auto_308710 ) ) ( not ( = ?auto_308703 ?auto_308711 ) ) ( not ( = ?auto_308703 ?auto_308712 ) ) ( not ( = ?auto_308703 ?auto_308713 ) ) ( not ( = ?auto_308703 ?auto_308714 ) ) ( not ( = ?auto_308704 ?auto_308705 ) ) ( not ( = ?auto_308704 ?auto_308706 ) ) ( not ( = ?auto_308704 ?auto_308707 ) ) ( not ( = ?auto_308704 ?auto_308708 ) ) ( not ( = ?auto_308704 ?auto_308709 ) ) ( not ( = ?auto_308704 ?auto_308710 ) ) ( not ( = ?auto_308704 ?auto_308711 ) ) ( not ( = ?auto_308704 ?auto_308712 ) ) ( not ( = ?auto_308704 ?auto_308713 ) ) ( not ( = ?auto_308704 ?auto_308714 ) ) ( not ( = ?auto_308705 ?auto_308706 ) ) ( not ( = ?auto_308705 ?auto_308707 ) ) ( not ( = ?auto_308705 ?auto_308708 ) ) ( not ( = ?auto_308705 ?auto_308709 ) ) ( not ( = ?auto_308705 ?auto_308710 ) ) ( not ( = ?auto_308705 ?auto_308711 ) ) ( not ( = ?auto_308705 ?auto_308712 ) ) ( not ( = ?auto_308705 ?auto_308713 ) ) ( not ( = ?auto_308705 ?auto_308714 ) ) ( not ( = ?auto_308706 ?auto_308707 ) ) ( not ( = ?auto_308706 ?auto_308708 ) ) ( not ( = ?auto_308706 ?auto_308709 ) ) ( not ( = ?auto_308706 ?auto_308710 ) ) ( not ( = ?auto_308706 ?auto_308711 ) ) ( not ( = ?auto_308706 ?auto_308712 ) ) ( not ( = ?auto_308706 ?auto_308713 ) ) ( not ( = ?auto_308706 ?auto_308714 ) ) ( not ( = ?auto_308707 ?auto_308708 ) ) ( not ( = ?auto_308707 ?auto_308709 ) ) ( not ( = ?auto_308707 ?auto_308710 ) ) ( not ( = ?auto_308707 ?auto_308711 ) ) ( not ( = ?auto_308707 ?auto_308712 ) ) ( not ( = ?auto_308707 ?auto_308713 ) ) ( not ( = ?auto_308707 ?auto_308714 ) ) ( not ( = ?auto_308708 ?auto_308709 ) ) ( not ( = ?auto_308708 ?auto_308710 ) ) ( not ( = ?auto_308708 ?auto_308711 ) ) ( not ( = ?auto_308708 ?auto_308712 ) ) ( not ( = ?auto_308708 ?auto_308713 ) ) ( not ( = ?auto_308708 ?auto_308714 ) ) ( not ( = ?auto_308709 ?auto_308710 ) ) ( not ( = ?auto_308709 ?auto_308711 ) ) ( not ( = ?auto_308709 ?auto_308712 ) ) ( not ( = ?auto_308709 ?auto_308713 ) ) ( not ( = ?auto_308709 ?auto_308714 ) ) ( not ( = ?auto_308710 ?auto_308711 ) ) ( not ( = ?auto_308710 ?auto_308712 ) ) ( not ( = ?auto_308710 ?auto_308713 ) ) ( not ( = ?auto_308710 ?auto_308714 ) ) ( not ( = ?auto_308711 ?auto_308712 ) ) ( not ( = ?auto_308711 ?auto_308713 ) ) ( not ( = ?auto_308711 ?auto_308714 ) ) ( not ( = ?auto_308712 ?auto_308713 ) ) ( not ( = ?auto_308712 ?auto_308714 ) ) ( not ( = ?auto_308713 ?auto_308714 ) ) ( ON ?auto_308713 ?auto_308714 ) ( ON ?auto_308712 ?auto_308713 ) ( ON ?auto_308711 ?auto_308712 ) ( ON ?auto_308710 ?auto_308711 ) ( CLEAR ?auto_308708 ) ( ON ?auto_308709 ?auto_308710 ) ( CLEAR ?auto_308709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_308701 ?auto_308702 ?auto_308703 ?auto_308704 ?auto_308705 ?auto_308706 ?auto_308707 ?auto_308708 ?auto_308709 )
      ( MAKE-14PILE ?auto_308701 ?auto_308702 ?auto_308703 ?auto_308704 ?auto_308705 ?auto_308706 ?auto_308707 ?auto_308708 ?auto_308709 ?auto_308710 ?auto_308711 ?auto_308712 ?auto_308713 ?auto_308714 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308729 - BLOCK
      ?auto_308730 - BLOCK
      ?auto_308731 - BLOCK
      ?auto_308732 - BLOCK
      ?auto_308733 - BLOCK
      ?auto_308734 - BLOCK
      ?auto_308735 - BLOCK
      ?auto_308736 - BLOCK
      ?auto_308737 - BLOCK
      ?auto_308738 - BLOCK
      ?auto_308739 - BLOCK
      ?auto_308740 - BLOCK
      ?auto_308741 - BLOCK
      ?auto_308742 - BLOCK
    )
    :vars
    (
      ?auto_308743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308742 ?auto_308743 ) ( ON-TABLE ?auto_308729 ) ( ON ?auto_308730 ?auto_308729 ) ( ON ?auto_308731 ?auto_308730 ) ( ON ?auto_308732 ?auto_308731 ) ( ON ?auto_308733 ?auto_308732 ) ( ON ?auto_308734 ?auto_308733 ) ( ON ?auto_308735 ?auto_308734 ) ( not ( = ?auto_308729 ?auto_308730 ) ) ( not ( = ?auto_308729 ?auto_308731 ) ) ( not ( = ?auto_308729 ?auto_308732 ) ) ( not ( = ?auto_308729 ?auto_308733 ) ) ( not ( = ?auto_308729 ?auto_308734 ) ) ( not ( = ?auto_308729 ?auto_308735 ) ) ( not ( = ?auto_308729 ?auto_308736 ) ) ( not ( = ?auto_308729 ?auto_308737 ) ) ( not ( = ?auto_308729 ?auto_308738 ) ) ( not ( = ?auto_308729 ?auto_308739 ) ) ( not ( = ?auto_308729 ?auto_308740 ) ) ( not ( = ?auto_308729 ?auto_308741 ) ) ( not ( = ?auto_308729 ?auto_308742 ) ) ( not ( = ?auto_308729 ?auto_308743 ) ) ( not ( = ?auto_308730 ?auto_308731 ) ) ( not ( = ?auto_308730 ?auto_308732 ) ) ( not ( = ?auto_308730 ?auto_308733 ) ) ( not ( = ?auto_308730 ?auto_308734 ) ) ( not ( = ?auto_308730 ?auto_308735 ) ) ( not ( = ?auto_308730 ?auto_308736 ) ) ( not ( = ?auto_308730 ?auto_308737 ) ) ( not ( = ?auto_308730 ?auto_308738 ) ) ( not ( = ?auto_308730 ?auto_308739 ) ) ( not ( = ?auto_308730 ?auto_308740 ) ) ( not ( = ?auto_308730 ?auto_308741 ) ) ( not ( = ?auto_308730 ?auto_308742 ) ) ( not ( = ?auto_308730 ?auto_308743 ) ) ( not ( = ?auto_308731 ?auto_308732 ) ) ( not ( = ?auto_308731 ?auto_308733 ) ) ( not ( = ?auto_308731 ?auto_308734 ) ) ( not ( = ?auto_308731 ?auto_308735 ) ) ( not ( = ?auto_308731 ?auto_308736 ) ) ( not ( = ?auto_308731 ?auto_308737 ) ) ( not ( = ?auto_308731 ?auto_308738 ) ) ( not ( = ?auto_308731 ?auto_308739 ) ) ( not ( = ?auto_308731 ?auto_308740 ) ) ( not ( = ?auto_308731 ?auto_308741 ) ) ( not ( = ?auto_308731 ?auto_308742 ) ) ( not ( = ?auto_308731 ?auto_308743 ) ) ( not ( = ?auto_308732 ?auto_308733 ) ) ( not ( = ?auto_308732 ?auto_308734 ) ) ( not ( = ?auto_308732 ?auto_308735 ) ) ( not ( = ?auto_308732 ?auto_308736 ) ) ( not ( = ?auto_308732 ?auto_308737 ) ) ( not ( = ?auto_308732 ?auto_308738 ) ) ( not ( = ?auto_308732 ?auto_308739 ) ) ( not ( = ?auto_308732 ?auto_308740 ) ) ( not ( = ?auto_308732 ?auto_308741 ) ) ( not ( = ?auto_308732 ?auto_308742 ) ) ( not ( = ?auto_308732 ?auto_308743 ) ) ( not ( = ?auto_308733 ?auto_308734 ) ) ( not ( = ?auto_308733 ?auto_308735 ) ) ( not ( = ?auto_308733 ?auto_308736 ) ) ( not ( = ?auto_308733 ?auto_308737 ) ) ( not ( = ?auto_308733 ?auto_308738 ) ) ( not ( = ?auto_308733 ?auto_308739 ) ) ( not ( = ?auto_308733 ?auto_308740 ) ) ( not ( = ?auto_308733 ?auto_308741 ) ) ( not ( = ?auto_308733 ?auto_308742 ) ) ( not ( = ?auto_308733 ?auto_308743 ) ) ( not ( = ?auto_308734 ?auto_308735 ) ) ( not ( = ?auto_308734 ?auto_308736 ) ) ( not ( = ?auto_308734 ?auto_308737 ) ) ( not ( = ?auto_308734 ?auto_308738 ) ) ( not ( = ?auto_308734 ?auto_308739 ) ) ( not ( = ?auto_308734 ?auto_308740 ) ) ( not ( = ?auto_308734 ?auto_308741 ) ) ( not ( = ?auto_308734 ?auto_308742 ) ) ( not ( = ?auto_308734 ?auto_308743 ) ) ( not ( = ?auto_308735 ?auto_308736 ) ) ( not ( = ?auto_308735 ?auto_308737 ) ) ( not ( = ?auto_308735 ?auto_308738 ) ) ( not ( = ?auto_308735 ?auto_308739 ) ) ( not ( = ?auto_308735 ?auto_308740 ) ) ( not ( = ?auto_308735 ?auto_308741 ) ) ( not ( = ?auto_308735 ?auto_308742 ) ) ( not ( = ?auto_308735 ?auto_308743 ) ) ( not ( = ?auto_308736 ?auto_308737 ) ) ( not ( = ?auto_308736 ?auto_308738 ) ) ( not ( = ?auto_308736 ?auto_308739 ) ) ( not ( = ?auto_308736 ?auto_308740 ) ) ( not ( = ?auto_308736 ?auto_308741 ) ) ( not ( = ?auto_308736 ?auto_308742 ) ) ( not ( = ?auto_308736 ?auto_308743 ) ) ( not ( = ?auto_308737 ?auto_308738 ) ) ( not ( = ?auto_308737 ?auto_308739 ) ) ( not ( = ?auto_308737 ?auto_308740 ) ) ( not ( = ?auto_308737 ?auto_308741 ) ) ( not ( = ?auto_308737 ?auto_308742 ) ) ( not ( = ?auto_308737 ?auto_308743 ) ) ( not ( = ?auto_308738 ?auto_308739 ) ) ( not ( = ?auto_308738 ?auto_308740 ) ) ( not ( = ?auto_308738 ?auto_308741 ) ) ( not ( = ?auto_308738 ?auto_308742 ) ) ( not ( = ?auto_308738 ?auto_308743 ) ) ( not ( = ?auto_308739 ?auto_308740 ) ) ( not ( = ?auto_308739 ?auto_308741 ) ) ( not ( = ?auto_308739 ?auto_308742 ) ) ( not ( = ?auto_308739 ?auto_308743 ) ) ( not ( = ?auto_308740 ?auto_308741 ) ) ( not ( = ?auto_308740 ?auto_308742 ) ) ( not ( = ?auto_308740 ?auto_308743 ) ) ( not ( = ?auto_308741 ?auto_308742 ) ) ( not ( = ?auto_308741 ?auto_308743 ) ) ( not ( = ?auto_308742 ?auto_308743 ) ) ( ON ?auto_308741 ?auto_308742 ) ( ON ?auto_308740 ?auto_308741 ) ( ON ?auto_308739 ?auto_308740 ) ( ON ?auto_308738 ?auto_308739 ) ( ON ?auto_308737 ?auto_308738 ) ( CLEAR ?auto_308735 ) ( ON ?auto_308736 ?auto_308737 ) ( CLEAR ?auto_308736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_308729 ?auto_308730 ?auto_308731 ?auto_308732 ?auto_308733 ?auto_308734 ?auto_308735 ?auto_308736 )
      ( MAKE-14PILE ?auto_308729 ?auto_308730 ?auto_308731 ?auto_308732 ?auto_308733 ?auto_308734 ?auto_308735 ?auto_308736 ?auto_308737 ?auto_308738 ?auto_308739 ?auto_308740 ?auto_308741 ?auto_308742 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308758 - BLOCK
      ?auto_308759 - BLOCK
      ?auto_308760 - BLOCK
      ?auto_308761 - BLOCK
      ?auto_308762 - BLOCK
      ?auto_308763 - BLOCK
      ?auto_308764 - BLOCK
      ?auto_308765 - BLOCK
      ?auto_308766 - BLOCK
      ?auto_308767 - BLOCK
      ?auto_308768 - BLOCK
      ?auto_308769 - BLOCK
      ?auto_308770 - BLOCK
      ?auto_308771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308771 ) ( ON-TABLE ?auto_308758 ) ( ON ?auto_308759 ?auto_308758 ) ( ON ?auto_308760 ?auto_308759 ) ( ON ?auto_308761 ?auto_308760 ) ( ON ?auto_308762 ?auto_308761 ) ( ON ?auto_308763 ?auto_308762 ) ( ON ?auto_308764 ?auto_308763 ) ( not ( = ?auto_308758 ?auto_308759 ) ) ( not ( = ?auto_308758 ?auto_308760 ) ) ( not ( = ?auto_308758 ?auto_308761 ) ) ( not ( = ?auto_308758 ?auto_308762 ) ) ( not ( = ?auto_308758 ?auto_308763 ) ) ( not ( = ?auto_308758 ?auto_308764 ) ) ( not ( = ?auto_308758 ?auto_308765 ) ) ( not ( = ?auto_308758 ?auto_308766 ) ) ( not ( = ?auto_308758 ?auto_308767 ) ) ( not ( = ?auto_308758 ?auto_308768 ) ) ( not ( = ?auto_308758 ?auto_308769 ) ) ( not ( = ?auto_308758 ?auto_308770 ) ) ( not ( = ?auto_308758 ?auto_308771 ) ) ( not ( = ?auto_308759 ?auto_308760 ) ) ( not ( = ?auto_308759 ?auto_308761 ) ) ( not ( = ?auto_308759 ?auto_308762 ) ) ( not ( = ?auto_308759 ?auto_308763 ) ) ( not ( = ?auto_308759 ?auto_308764 ) ) ( not ( = ?auto_308759 ?auto_308765 ) ) ( not ( = ?auto_308759 ?auto_308766 ) ) ( not ( = ?auto_308759 ?auto_308767 ) ) ( not ( = ?auto_308759 ?auto_308768 ) ) ( not ( = ?auto_308759 ?auto_308769 ) ) ( not ( = ?auto_308759 ?auto_308770 ) ) ( not ( = ?auto_308759 ?auto_308771 ) ) ( not ( = ?auto_308760 ?auto_308761 ) ) ( not ( = ?auto_308760 ?auto_308762 ) ) ( not ( = ?auto_308760 ?auto_308763 ) ) ( not ( = ?auto_308760 ?auto_308764 ) ) ( not ( = ?auto_308760 ?auto_308765 ) ) ( not ( = ?auto_308760 ?auto_308766 ) ) ( not ( = ?auto_308760 ?auto_308767 ) ) ( not ( = ?auto_308760 ?auto_308768 ) ) ( not ( = ?auto_308760 ?auto_308769 ) ) ( not ( = ?auto_308760 ?auto_308770 ) ) ( not ( = ?auto_308760 ?auto_308771 ) ) ( not ( = ?auto_308761 ?auto_308762 ) ) ( not ( = ?auto_308761 ?auto_308763 ) ) ( not ( = ?auto_308761 ?auto_308764 ) ) ( not ( = ?auto_308761 ?auto_308765 ) ) ( not ( = ?auto_308761 ?auto_308766 ) ) ( not ( = ?auto_308761 ?auto_308767 ) ) ( not ( = ?auto_308761 ?auto_308768 ) ) ( not ( = ?auto_308761 ?auto_308769 ) ) ( not ( = ?auto_308761 ?auto_308770 ) ) ( not ( = ?auto_308761 ?auto_308771 ) ) ( not ( = ?auto_308762 ?auto_308763 ) ) ( not ( = ?auto_308762 ?auto_308764 ) ) ( not ( = ?auto_308762 ?auto_308765 ) ) ( not ( = ?auto_308762 ?auto_308766 ) ) ( not ( = ?auto_308762 ?auto_308767 ) ) ( not ( = ?auto_308762 ?auto_308768 ) ) ( not ( = ?auto_308762 ?auto_308769 ) ) ( not ( = ?auto_308762 ?auto_308770 ) ) ( not ( = ?auto_308762 ?auto_308771 ) ) ( not ( = ?auto_308763 ?auto_308764 ) ) ( not ( = ?auto_308763 ?auto_308765 ) ) ( not ( = ?auto_308763 ?auto_308766 ) ) ( not ( = ?auto_308763 ?auto_308767 ) ) ( not ( = ?auto_308763 ?auto_308768 ) ) ( not ( = ?auto_308763 ?auto_308769 ) ) ( not ( = ?auto_308763 ?auto_308770 ) ) ( not ( = ?auto_308763 ?auto_308771 ) ) ( not ( = ?auto_308764 ?auto_308765 ) ) ( not ( = ?auto_308764 ?auto_308766 ) ) ( not ( = ?auto_308764 ?auto_308767 ) ) ( not ( = ?auto_308764 ?auto_308768 ) ) ( not ( = ?auto_308764 ?auto_308769 ) ) ( not ( = ?auto_308764 ?auto_308770 ) ) ( not ( = ?auto_308764 ?auto_308771 ) ) ( not ( = ?auto_308765 ?auto_308766 ) ) ( not ( = ?auto_308765 ?auto_308767 ) ) ( not ( = ?auto_308765 ?auto_308768 ) ) ( not ( = ?auto_308765 ?auto_308769 ) ) ( not ( = ?auto_308765 ?auto_308770 ) ) ( not ( = ?auto_308765 ?auto_308771 ) ) ( not ( = ?auto_308766 ?auto_308767 ) ) ( not ( = ?auto_308766 ?auto_308768 ) ) ( not ( = ?auto_308766 ?auto_308769 ) ) ( not ( = ?auto_308766 ?auto_308770 ) ) ( not ( = ?auto_308766 ?auto_308771 ) ) ( not ( = ?auto_308767 ?auto_308768 ) ) ( not ( = ?auto_308767 ?auto_308769 ) ) ( not ( = ?auto_308767 ?auto_308770 ) ) ( not ( = ?auto_308767 ?auto_308771 ) ) ( not ( = ?auto_308768 ?auto_308769 ) ) ( not ( = ?auto_308768 ?auto_308770 ) ) ( not ( = ?auto_308768 ?auto_308771 ) ) ( not ( = ?auto_308769 ?auto_308770 ) ) ( not ( = ?auto_308769 ?auto_308771 ) ) ( not ( = ?auto_308770 ?auto_308771 ) ) ( ON ?auto_308770 ?auto_308771 ) ( ON ?auto_308769 ?auto_308770 ) ( ON ?auto_308768 ?auto_308769 ) ( ON ?auto_308767 ?auto_308768 ) ( ON ?auto_308766 ?auto_308767 ) ( CLEAR ?auto_308764 ) ( ON ?auto_308765 ?auto_308766 ) ( CLEAR ?auto_308765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_308758 ?auto_308759 ?auto_308760 ?auto_308761 ?auto_308762 ?auto_308763 ?auto_308764 ?auto_308765 )
      ( MAKE-14PILE ?auto_308758 ?auto_308759 ?auto_308760 ?auto_308761 ?auto_308762 ?auto_308763 ?auto_308764 ?auto_308765 ?auto_308766 ?auto_308767 ?auto_308768 ?auto_308769 ?auto_308770 ?auto_308771 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308786 - BLOCK
      ?auto_308787 - BLOCK
      ?auto_308788 - BLOCK
      ?auto_308789 - BLOCK
      ?auto_308790 - BLOCK
      ?auto_308791 - BLOCK
      ?auto_308792 - BLOCK
      ?auto_308793 - BLOCK
      ?auto_308794 - BLOCK
      ?auto_308795 - BLOCK
      ?auto_308796 - BLOCK
      ?auto_308797 - BLOCK
      ?auto_308798 - BLOCK
      ?auto_308799 - BLOCK
    )
    :vars
    (
      ?auto_308800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308799 ?auto_308800 ) ( ON-TABLE ?auto_308786 ) ( ON ?auto_308787 ?auto_308786 ) ( ON ?auto_308788 ?auto_308787 ) ( ON ?auto_308789 ?auto_308788 ) ( ON ?auto_308790 ?auto_308789 ) ( ON ?auto_308791 ?auto_308790 ) ( not ( = ?auto_308786 ?auto_308787 ) ) ( not ( = ?auto_308786 ?auto_308788 ) ) ( not ( = ?auto_308786 ?auto_308789 ) ) ( not ( = ?auto_308786 ?auto_308790 ) ) ( not ( = ?auto_308786 ?auto_308791 ) ) ( not ( = ?auto_308786 ?auto_308792 ) ) ( not ( = ?auto_308786 ?auto_308793 ) ) ( not ( = ?auto_308786 ?auto_308794 ) ) ( not ( = ?auto_308786 ?auto_308795 ) ) ( not ( = ?auto_308786 ?auto_308796 ) ) ( not ( = ?auto_308786 ?auto_308797 ) ) ( not ( = ?auto_308786 ?auto_308798 ) ) ( not ( = ?auto_308786 ?auto_308799 ) ) ( not ( = ?auto_308786 ?auto_308800 ) ) ( not ( = ?auto_308787 ?auto_308788 ) ) ( not ( = ?auto_308787 ?auto_308789 ) ) ( not ( = ?auto_308787 ?auto_308790 ) ) ( not ( = ?auto_308787 ?auto_308791 ) ) ( not ( = ?auto_308787 ?auto_308792 ) ) ( not ( = ?auto_308787 ?auto_308793 ) ) ( not ( = ?auto_308787 ?auto_308794 ) ) ( not ( = ?auto_308787 ?auto_308795 ) ) ( not ( = ?auto_308787 ?auto_308796 ) ) ( not ( = ?auto_308787 ?auto_308797 ) ) ( not ( = ?auto_308787 ?auto_308798 ) ) ( not ( = ?auto_308787 ?auto_308799 ) ) ( not ( = ?auto_308787 ?auto_308800 ) ) ( not ( = ?auto_308788 ?auto_308789 ) ) ( not ( = ?auto_308788 ?auto_308790 ) ) ( not ( = ?auto_308788 ?auto_308791 ) ) ( not ( = ?auto_308788 ?auto_308792 ) ) ( not ( = ?auto_308788 ?auto_308793 ) ) ( not ( = ?auto_308788 ?auto_308794 ) ) ( not ( = ?auto_308788 ?auto_308795 ) ) ( not ( = ?auto_308788 ?auto_308796 ) ) ( not ( = ?auto_308788 ?auto_308797 ) ) ( not ( = ?auto_308788 ?auto_308798 ) ) ( not ( = ?auto_308788 ?auto_308799 ) ) ( not ( = ?auto_308788 ?auto_308800 ) ) ( not ( = ?auto_308789 ?auto_308790 ) ) ( not ( = ?auto_308789 ?auto_308791 ) ) ( not ( = ?auto_308789 ?auto_308792 ) ) ( not ( = ?auto_308789 ?auto_308793 ) ) ( not ( = ?auto_308789 ?auto_308794 ) ) ( not ( = ?auto_308789 ?auto_308795 ) ) ( not ( = ?auto_308789 ?auto_308796 ) ) ( not ( = ?auto_308789 ?auto_308797 ) ) ( not ( = ?auto_308789 ?auto_308798 ) ) ( not ( = ?auto_308789 ?auto_308799 ) ) ( not ( = ?auto_308789 ?auto_308800 ) ) ( not ( = ?auto_308790 ?auto_308791 ) ) ( not ( = ?auto_308790 ?auto_308792 ) ) ( not ( = ?auto_308790 ?auto_308793 ) ) ( not ( = ?auto_308790 ?auto_308794 ) ) ( not ( = ?auto_308790 ?auto_308795 ) ) ( not ( = ?auto_308790 ?auto_308796 ) ) ( not ( = ?auto_308790 ?auto_308797 ) ) ( not ( = ?auto_308790 ?auto_308798 ) ) ( not ( = ?auto_308790 ?auto_308799 ) ) ( not ( = ?auto_308790 ?auto_308800 ) ) ( not ( = ?auto_308791 ?auto_308792 ) ) ( not ( = ?auto_308791 ?auto_308793 ) ) ( not ( = ?auto_308791 ?auto_308794 ) ) ( not ( = ?auto_308791 ?auto_308795 ) ) ( not ( = ?auto_308791 ?auto_308796 ) ) ( not ( = ?auto_308791 ?auto_308797 ) ) ( not ( = ?auto_308791 ?auto_308798 ) ) ( not ( = ?auto_308791 ?auto_308799 ) ) ( not ( = ?auto_308791 ?auto_308800 ) ) ( not ( = ?auto_308792 ?auto_308793 ) ) ( not ( = ?auto_308792 ?auto_308794 ) ) ( not ( = ?auto_308792 ?auto_308795 ) ) ( not ( = ?auto_308792 ?auto_308796 ) ) ( not ( = ?auto_308792 ?auto_308797 ) ) ( not ( = ?auto_308792 ?auto_308798 ) ) ( not ( = ?auto_308792 ?auto_308799 ) ) ( not ( = ?auto_308792 ?auto_308800 ) ) ( not ( = ?auto_308793 ?auto_308794 ) ) ( not ( = ?auto_308793 ?auto_308795 ) ) ( not ( = ?auto_308793 ?auto_308796 ) ) ( not ( = ?auto_308793 ?auto_308797 ) ) ( not ( = ?auto_308793 ?auto_308798 ) ) ( not ( = ?auto_308793 ?auto_308799 ) ) ( not ( = ?auto_308793 ?auto_308800 ) ) ( not ( = ?auto_308794 ?auto_308795 ) ) ( not ( = ?auto_308794 ?auto_308796 ) ) ( not ( = ?auto_308794 ?auto_308797 ) ) ( not ( = ?auto_308794 ?auto_308798 ) ) ( not ( = ?auto_308794 ?auto_308799 ) ) ( not ( = ?auto_308794 ?auto_308800 ) ) ( not ( = ?auto_308795 ?auto_308796 ) ) ( not ( = ?auto_308795 ?auto_308797 ) ) ( not ( = ?auto_308795 ?auto_308798 ) ) ( not ( = ?auto_308795 ?auto_308799 ) ) ( not ( = ?auto_308795 ?auto_308800 ) ) ( not ( = ?auto_308796 ?auto_308797 ) ) ( not ( = ?auto_308796 ?auto_308798 ) ) ( not ( = ?auto_308796 ?auto_308799 ) ) ( not ( = ?auto_308796 ?auto_308800 ) ) ( not ( = ?auto_308797 ?auto_308798 ) ) ( not ( = ?auto_308797 ?auto_308799 ) ) ( not ( = ?auto_308797 ?auto_308800 ) ) ( not ( = ?auto_308798 ?auto_308799 ) ) ( not ( = ?auto_308798 ?auto_308800 ) ) ( not ( = ?auto_308799 ?auto_308800 ) ) ( ON ?auto_308798 ?auto_308799 ) ( ON ?auto_308797 ?auto_308798 ) ( ON ?auto_308796 ?auto_308797 ) ( ON ?auto_308795 ?auto_308796 ) ( ON ?auto_308794 ?auto_308795 ) ( ON ?auto_308793 ?auto_308794 ) ( CLEAR ?auto_308791 ) ( ON ?auto_308792 ?auto_308793 ) ( CLEAR ?auto_308792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_308786 ?auto_308787 ?auto_308788 ?auto_308789 ?auto_308790 ?auto_308791 ?auto_308792 )
      ( MAKE-14PILE ?auto_308786 ?auto_308787 ?auto_308788 ?auto_308789 ?auto_308790 ?auto_308791 ?auto_308792 ?auto_308793 ?auto_308794 ?auto_308795 ?auto_308796 ?auto_308797 ?auto_308798 ?auto_308799 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308815 - BLOCK
      ?auto_308816 - BLOCK
      ?auto_308817 - BLOCK
      ?auto_308818 - BLOCK
      ?auto_308819 - BLOCK
      ?auto_308820 - BLOCK
      ?auto_308821 - BLOCK
      ?auto_308822 - BLOCK
      ?auto_308823 - BLOCK
      ?auto_308824 - BLOCK
      ?auto_308825 - BLOCK
      ?auto_308826 - BLOCK
      ?auto_308827 - BLOCK
      ?auto_308828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308828 ) ( ON-TABLE ?auto_308815 ) ( ON ?auto_308816 ?auto_308815 ) ( ON ?auto_308817 ?auto_308816 ) ( ON ?auto_308818 ?auto_308817 ) ( ON ?auto_308819 ?auto_308818 ) ( ON ?auto_308820 ?auto_308819 ) ( not ( = ?auto_308815 ?auto_308816 ) ) ( not ( = ?auto_308815 ?auto_308817 ) ) ( not ( = ?auto_308815 ?auto_308818 ) ) ( not ( = ?auto_308815 ?auto_308819 ) ) ( not ( = ?auto_308815 ?auto_308820 ) ) ( not ( = ?auto_308815 ?auto_308821 ) ) ( not ( = ?auto_308815 ?auto_308822 ) ) ( not ( = ?auto_308815 ?auto_308823 ) ) ( not ( = ?auto_308815 ?auto_308824 ) ) ( not ( = ?auto_308815 ?auto_308825 ) ) ( not ( = ?auto_308815 ?auto_308826 ) ) ( not ( = ?auto_308815 ?auto_308827 ) ) ( not ( = ?auto_308815 ?auto_308828 ) ) ( not ( = ?auto_308816 ?auto_308817 ) ) ( not ( = ?auto_308816 ?auto_308818 ) ) ( not ( = ?auto_308816 ?auto_308819 ) ) ( not ( = ?auto_308816 ?auto_308820 ) ) ( not ( = ?auto_308816 ?auto_308821 ) ) ( not ( = ?auto_308816 ?auto_308822 ) ) ( not ( = ?auto_308816 ?auto_308823 ) ) ( not ( = ?auto_308816 ?auto_308824 ) ) ( not ( = ?auto_308816 ?auto_308825 ) ) ( not ( = ?auto_308816 ?auto_308826 ) ) ( not ( = ?auto_308816 ?auto_308827 ) ) ( not ( = ?auto_308816 ?auto_308828 ) ) ( not ( = ?auto_308817 ?auto_308818 ) ) ( not ( = ?auto_308817 ?auto_308819 ) ) ( not ( = ?auto_308817 ?auto_308820 ) ) ( not ( = ?auto_308817 ?auto_308821 ) ) ( not ( = ?auto_308817 ?auto_308822 ) ) ( not ( = ?auto_308817 ?auto_308823 ) ) ( not ( = ?auto_308817 ?auto_308824 ) ) ( not ( = ?auto_308817 ?auto_308825 ) ) ( not ( = ?auto_308817 ?auto_308826 ) ) ( not ( = ?auto_308817 ?auto_308827 ) ) ( not ( = ?auto_308817 ?auto_308828 ) ) ( not ( = ?auto_308818 ?auto_308819 ) ) ( not ( = ?auto_308818 ?auto_308820 ) ) ( not ( = ?auto_308818 ?auto_308821 ) ) ( not ( = ?auto_308818 ?auto_308822 ) ) ( not ( = ?auto_308818 ?auto_308823 ) ) ( not ( = ?auto_308818 ?auto_308824 ) ) ( not ( = ?auto_308818 ?auto_308825 ) ) ( not ( = ?auto_308818 ?auto_308826 ) ) ( not ( = ?auto_308818 ?auto_308827 ) ) ( not ( = ?auto_308818 ?auto_308828 ) ) ( not ( = ?auto_308819 ?auto_308820 ) ) ( not ( = ?auto_308819 ?auto_308821 ) ) ( not ( = ?auto_308819 ?auto_308822 ) ) ( not ( = ?auto_308819 ?auto_308823 ) ) ( not ( = ?auto_308819 ?auto_308824 ) ) ( not ( = ?auto_308819 ?auto_308825 ) ) ( not ( = ?auto_308819 ?auto_308826 ) ) ( not ( = ?auto_308819 ?auto_308827 ) ) ( not ( = ?auto_308819 ?auto_308828 ) ) ( not ( = ?auto_308820 ?auto_308821 ) ) ( not ( = ?auto_308820 ?auto_308822 ) ) ( not ( = ?auto_308820 ?auto_308823 ) ) ( not ( = ?auto_308820 ?auto_308824 ) ) ( not ( = ?auto_308820 ?auto_308825 ) ) ( not ( = ?auto_308820 ?auto_308826 ) ) ( not ( = ?auto_308820 ?auto_308827 ) ) ( not ( = ?auto_308820 ?auto_308828 ) ) ( not ( = ?auto_308821 ?auto_308822 ) ) ( not ( = ?auto_308821 ?auto_308823 ) ) ( not ( = ?auto_308821 ?auto_308824 ) ) ( not ( = ?auto_308821 ?auto_308825 ) ) ( not ( = ?auto_308821 ?auto_308826 ) ) ( not ( = ?auto_308821 ?auto_308827 ) ) ( not ( = ?auto_308821 ?auto_308828 ) ) ( not ( = ?auto_308822 ?auto_308823 ) ) ( not ( = ?auto_308822 ?auto_308824 ) ) ( not ( = ?auto_308822 ?auto_308825 ) ) ( not ( = ?auto_308822 ?auto_308826 ) ) ( not ( = ?auto_308822 ?auto_308827 ) ) ( not ( = ?auto_308822 ?auto_308828 ) ) ( not ( = ?auto_308823 ?auto_308824 ) ) ( not ( = ?auto_308823 ?auto_308825 ) ) ( not ( = ?auto_308823 ?auto_308826 ) ) ( not ( = ?auto_308823 ?auto_308827 ) ) ( not ( = ?auto_308823 ?auto_308828 ) ) ( not ( = ?auto_308824 ?auto_308825 ) ) ( not ( = ?auto_308824 ?auto_308826 ) ) ( not ( = ?auto_308824 ?auto_308827 ) ) ( not ( = ?auto_308824 ?auto_308828 ) ) ( not ( = ?auto_308825 ?auto_308826 ) ) ( not ( = ?auto_308825 ?auto_308827 ) ) ( not ( = ?auto_308825 ?auto_308828 ) ) ( not ( = ?auto_308826 ?auto_308827 ) ) ( not ( = ?auto_308826 ?auto_308828 ) ) ( not ( = ?auto_308827 ?auto_308828 ) ) ( ON ?auto_308827 ?auto_308828 ) ( ON ?auto_308826 ?auto_308827 ) ( ON ?auto_308825 ?auto_308826 ) ( ON ?auto_308824 ?auto_308825 ) ( ON ?auto_308823 ?auto_308824 ) ( ON ?auto_308822 ?auto_308823 ) ( CLEAR ?auto_308820 ) ( ON ?auto_308821 ?auto_308822 ) ( CLEAR ?auto_308821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_308815 ?auto_308816 ?auto_308817 ?auto_308818 ?auto_308819 ?auto_308820 ?auto_308821 )
      ( MAKE-14PILE ?auto_308815 ?auto_308816 ?auto_308817 ?auto_308818 ?auto_308819 ?auto_308820 ?auto_308821 ?auto_308822 ?auto_308823 ?auto_308824 ?auto_308825 ?auto_308826 ?auto_308827 ?auto_308828 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308843 - BLOCK
      ?auto_308844 - BLOCK
      ?auto_308845 - BLOCK
      ?auto_308846 - BLOCK
      ?auto_308847 - BLOCK
      ?auto_308848 - BLOCK
      ?auto_308849 - BLOCK
      ?auto_308850 - BLOCK
      ?auto_308851 - BLOCK
      ?auto_308852 - BLOCK
      ?auto_308853 - BLOCK
      ?auto_308854 - BLOCK
      ?auto_308855 - BLOCK
      ?auto_308856 - BLOCK
    )
    :vars
    (
      ?auto_308857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308856 ?auto_308857 ) ( ON-TABLE ?auto_308843 ) ( ON ?auto_308844 ?auto_308843 ) ( ON ?auto_308845 ?auto_308844 ) ( ON ?auto_308846 ?auto_308845 ) ( ON ?auto_308847 ?auto_308846 ) ( not ( = ?auto_308843 ?auto_308844 ) ) ( not ( = ?auto_308843 ?auto_308845 ) ) ( not ( = ?auto_308843 ?auto_308846 ) ) ( not ( = ?auto_308843 ?auto_308847 ) ) ( not ( = ?auto_308843 ?auto_308848 ) ) ( not ( = ?auto_308843 ?auto_308849 ) ) ( not ( = ?auto_308843 ?auto_308850 ) ) ( not ( = ?auto_308843 ?auto_308851 ) ) ( not ( = ?auto_308843 ?auto_308852 ) ) ( not ( = ?auto_308843 ?auto_308853 ) ) ( not ( = ?auto_308843 ?auto_308854 ) ) ( not ( = ?auto_308843 ?auto_308855 ) ) ( not ( = ?auto_308843 ?auto_308856 ) ) ( not ( = ?auto_308843 ?auto_308857 ) ) ( not ( = ?auto_308844 ?auto_308845 ) ) ( not ( = ?auto_308844 ?auto_308846 ) ) ( not ( = ?auto_308844 ?auto_308847 ) ) ( not ( = ?auto_308844 ?auto_308848 ) ) ( not ( = ?auto_308844 ?auto_308849 ) ) ( not ( = ?auto_308844 ?auto_308850 ) ) ( not ( = ?auto_308844 ?auto_308851 ) ) ( not ( = ?auto_308844 ?auto_308852 ) ) ( not ( = ?auto_308844 ?auto_308853 ) ) ( not ( = ?auto_308844 ?auto_308854 ) ) ( not ( = ?auto_308844 ?auto_308855 ) ) ( not ( = ?auto_308844 ?auto_308856 ) ) ( not ( = ?auto_308844 ?auto_308857 ) ) ( not ( = ?auto_308845 ?auto_308846 ) ) ( not ( = ?auto_308845 ?auto_308847 ) ) ( not ( = ?auto_308845 ?auto_308848 ) ) ( not ( = ?auto_308845 ?auto_308849 ) ) ( not ( = ?auto_308845 ?auto_308850 ) ) ( not ( = ?auto_308845 ?auto_308851 ) ) ( not ( = ?auto_308845 ?auto_308852 ) ) ( not ( = ?auto_308845 ?auto_308853 ) ) ( not ( = ?auto_308845 ?auto_308854 ) ) ( not ( = ?auto_308845 ?auto_308855 ) ) ( not ( = ?auto_308845 ?auto_308856 ) ) ( not ( = ?auto_308845 ?auto_308857 ) ) ( not ( = ?auto_308846 ?auto_308847 ) ) ( not ( = ?auto_308846 ?auto_308848 ) ) ( not ( = ?auto_308846 ?auto_308849 ) ) ( not ( = ?auto_308846 ?auto_308850 ) ) ( not ( = ?auto_308846 ?auto_308851 ) ) ( not ( = ?auto_308846 ?auto_308852 ) ) ( not ( = ?auto_308846 ?auto_308853 ) ) ( not ( = ?auto_308846 ?auto_308854 ) ) ( not ( = ?auto_308846 ?auto_308855 ) ) ( not ( = ?auto_308846 ?auto_308856 ) ) ( not ( = ?auto_308846 ?auto_308857 ) ) ( not ( = ?auto_308847 ?auto_308848 ) ) ( not ( = ?auto_308847 ?auto_308849 ) ) ( not ( = ?auto_308847 ?auto_308850 ) ) ( not ( = ?auto_308847 ?auto_308851 ) ) ( not ( = ?auto_308847 ?auto_308852 ) ) ( not ( = ?auto_308847 ?auto_308853 ) ) ( not ( = ?auto_308847 ?auto_308854 ) ) ( not ( = ?auto_308847 ?auto_308855 ) ) ( not ( = ?auto_308847 ?auto_308856 ) ) ( not ( = ?auto_308847 ?auto_308857 ) ) ( not ( = ?auto_308848 ?auto_308849 ) ) ( not ( = ?auto_308848 ?auto_308850 ) ) ( not ( = ?auto_308848 ?auto_308851 ) ) ( not ( = ?auto_308848 ?auto_308852 ) ) ( not ( = ?auto_308848 ?auto_308853 ) ) ( not ( = ?auto_308848 ?auto_308854 ) ) ( not ( = ?auto_308848 ?auto_308855 ) ) ( not ( = ?auto_308848 ?auto_308856 ) ) ( not ( = ?auto_308848 ?auto_308857 ) ) ( not ( = ?auto_308849 ?auto_308850 ) ) ( not ( = ?auto_308849 ?auto_308851 ) ) ( not ( = ?auto_308849 ?auto_308852 ) ) ( not ( = ?auto_308849 ?auto_308853 ) ) ( not ( = ?auto_308849 ?auto_308854 ) ) ( not ( = ?auto_308849 ?auto_308855 ) ) ( not ( = ?auto_308849 ?auto_308856 ) ) ( not ( = ?auto_308849 ?auto_308857 ) ) ( not ( = ?auto_308850 ?auto_308851 ) ) ( not ( = ?auto_308850 ?auto_308852 ) ) ( not ( = ?auto_308850 ?auto_308853 ) ) ( not ( = ?auto_308850 ?auto_308854 ) ) ( not ( = ?auto_308850 ?auto_308855 ) ) ( not ( = ?auto_308850 ?auto_308856 ) ) ( not ( = ?auto_308850 ?auto_308857 ) ) ( not ( = ?auto_308851 ?auto_308852 ) ) ( not ( = ?auto_308851 ?auto_308853 ) ) ( not ( = ?auto_308851 ?auto_308854 ) ) ( not ( = ?auto_308851 ?auto_308855 ) ) ( not ( = ?auto_308851 ?auto_308856 ) ) ( not ( = ?auto_308851 ?auto_308857 ) ) ( not ( = ?auto_308852 ?auto_308853 ) ) ( not ( = ?auto_308852 ?auto_308854 ) ) ( not ( = ?auto_308852 ?auto_308855 ) ) ( not ( = ?auto_308852 ?auto_308856 ) ) ( not ( = ?auto_308852 ?auto_308857 ) ) ( not ( = ?auto_308853 ?auto_308854 ) ) ( not ( = ?auto_308853 ?auto_308855 ) ) ( not ( = ?auto_308853 ?auto_308856 ) ) ( not ( = ?auto_308853 ?auto_308857 ) ) ( not ( = ?auto_308854 ?auto_308855 ) ) ( not ( = ?auto_308854 ?auto_308856 ) ) ( not ( = ?auto_308854 ?auto_308857 ) ) ( not ( = ?auto_308855 ?auto_308856 ) ) ( not ( = ?auto_308855 ?auto_308857 ) ) ( not ( = ?auto_308856 ?auto_308857 ) ) ( ON ?auto_308855 ?auto_308856 ) ( ON ?auto_308854 ?auto_308855 ) ( ON ?auto_308853 ?auto_308854 ) ( ON ?auto_308852 ?auto_308853 ) ( ON ?auto_308851 ?auto_308852 ) ( ON ?auto_308850 ?auto_308851 ) ( ON ?auto_308849 ?auto_308850 ) ( CLEAR ?auto_308847 ) ( ON ?auto_308848 ?auto_308849 ) ( CLEAR ?auto_308848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_308843 ?auto_308844 ?auto_308845 ?auto_308846 ?auto_308847 ?auto_308848 )
      ( MAKE-14PILE ?auto_308843 ?auto_308844 ?auto_308845 ?auto_308846 ?auto_308847 ?auto_308848 ?auto_308849 ?auto_308850 ?auto_308851 ?auto_308852 ?auto_308853 ?auto_308854 ?auto_308855 ?auto_308856 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308872 - BLOCK
      ?auto_308873 - BLOCK
      ?auto_308874 - BLOCK
      ?auto_308875 - BLOCK
      ?auto_308876 - BLOCK
      ?auto_308877 - BLOCK
      ?auto_308878 - BLOCK
      ?auto_308879 - BLOCK
      ?auto_308880 - BLOCK
      ?auto_308881 - BLOCK
      ?auto_308882 - BLOCK
      ?auto_308883 - BLOCK
      ?auto_308884 - BLOCK
      ?auto_308885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308885 ) ( ON-TABLE ?auto_308872 ) ( ON ?auto_308873 ?auto_308872 ) ( ON ?auto_308874 ?auto_308873 ) ( ON ?auto_308875 ?auto_308874 ) ( ON ?auto_308876 ?auto_308875 ) ( not ( = ?auto_308872 ?auto_308873 ) ) ( not ( = ?auto_308872 ?auto_308874 ) ) ( not ( = ?auto_308872 ?auto_308875 ) ) ( not ( = ?auto_308872 ?auto_308876 ) ) ( not ( = ?auto_308872 ?auto_308877 ) ) ( not ( = ?auto_308872 ?auto_308878 ) ) ( not ( = ?auto_308872 ?auto_308879 ) ) ( not ( = ?auto_308872 ?auto_308880 ) ) ( not ( = ?auto_308872 ?auto_308881 ) ) ( not ( = ?auto_308872 ?auto_308882 ) ) ( not ( = ?auto_308872 ?auto_308883 ) ) ( not ( = ?auto_308872 ?auto_308884 ) ) ( not ( = ?auto_308872 ?auto_308885 ) ) ( not ( = ?auto_308873 ?auto_308874 ) ) ( not ( = ?auto_308873 ?auto_308875 ) ) ( not ( = ?auto_308873 ?auto_308876 ) ) ( not ( = ?auto_308873 ?auto_308877 ) ) ( not ( = ?auto_308873 ?auto_308878 ) ) ( not ( = ?auto_308873 ?auto_308879 ) ) ( not ( = ?auto_308873 ?auto_308880 ) ) ( not ( = ?auto_308873 ?auto_308881 ) ) ( not ( = ?auto_308873 ?auto_308882 ) ) ( not ( = ?auto_308873 ?auto_308883 ) ) ( not ( = ?auto_308873 ?auto_308884 ) ) ( not ( = ?auto_308873 ?auto_308885 ) ) ( not ( = ?auto_308874 ?auto_308875 ) ) ( not ( = ?auto_308874 ?auto_308876 ) ) ( not ( = ?auto_308874 ?auto_308877 ) ) ( not ( = ?auto_308874 ?auto_308878 ) ) ( not ( = ?auto_308874 ?auto_308879 ) ) ( not ( = ?auto_308874 ?auto_308880 ) ) ( not ( = ?auto_308874 ?auto_308881 ) ) ( not ( = ?auto_308874 ?auto_308882 ) ) ( not ( = ?auto_308874 ?auto_308883 ) ) ( not ( = ?auto_308874 ?auto_308884 ) ) ( not ( = ?auto_308874 ?auto_308885 ) ) ( not ( = ?auto_308875 ?auto_308876 ) ) ( not ( = ?auto_308875 ?auto_308877 ) ) ( not ( = ?auto_308875 ?auto_308878 ) ) ( not ( = ?auto_308875 ?auto_308879 ) ) ( not ( = ?auto_308875 ?auto_308880 ) ) ( not ( = ?auto_308875 ?auto_308881 ) ) ( not ( = ?auto_308875 ?auto_308882 ) ) ( not ( = ?auto_308875 ?auto_308883 ) ) ( not ( = ?auto_308875 ?auto_308884 ) ) ( not ( = ?auto_308875 ?auto_308885 ) ) ( not ( = ?auto_308876 ?auto_308877 ) ) ( not ( = ?auto_308876 ?auto_308878 ) ) ( not ( = ?auto_308876 ?auto_308879 ) ) ( not ( = ?auto_308876 ?auto_308880 ) ) ( not ( = ?auto_308876 ?auto_308881 ) ) ( not ( = ?auto_308876 ?auto_308882 ) ) ( not ( = ?auto_308876 ?auto_308883 ) ) ( not ( = ?auto_308876 ?auto_308884 ) ) ( not ( = ?auto_308876 ?auto_308885 ) ) ( not ( = ?auto_308877 ?auto_308878 ) ) ( not ( = ?auto_308877 ?auto_308879 ) ) ( not ( = ?auto_308877 ?auto_308880 ) ) ( not ( = ?auto_308877 ?auto_308881 ) ) ( not ( = ?auto_308877 ?auto_308882 ) ) ( not ( = ?auto_308877 ?auto_308883 ) ) ( not ( = ?auto_308877 ?auto_308884 ) ) ( not ( = ?auto_308877 ?auto_308885 ) ) ( not ( = ?auto_308878 ?auto_308879 ) ) ( not ( = ?auto_308878 ?auto_308880 ) ) ( not ( = ?auto_308878 ?auto_308881 ) ) ( not ( = ?auto_308878 ?auto_308882 ) ) ( not ( = ?auto_308878 ?auto_308883 ) ) ( not ( = ?auto_308878 ?auto_308884 ) ) ( not ( = ?auto_308878 ?auto_308885 ) ) ( not ( = ?auto_308879 ?auto_308880 ) ) ( not ( = ?auto_308879 ?auto_308881 ) ) ( not ( = ?auto_308879 ?auto_308882 ) ) ( not ( = ?auto_308879 ?auto_308883 ) ) ( not ( = ?auto_308879 ?auto_308884 ) ) ( not ( = ?auto_308879 ?auto_308885 ) ) ( not ( = ?auto_308880 ?auto_308881 ) ) ( not ( = ?auto_308880 ?auto_308882 ) ) ( not ( = ?auto_308880 ?auto_308883 ) ) ( not ( = ?auto_308880 ?auto_308884 ) ) ( not ( = ?auto_308880 ?auto_308885 ) ) ( not ( = ?auto_308881 ?auto_308882 ) ) ( not ( = ?auto_308881 ?auto_308883 ) ) ( not ( = ?auto_308881 ?auto_308884 ) ) ( not ( = ?auto_308881 ?auto_308885 ) ) ( not ( = ?auto_308882 ?auto_308883 ) ) ( not ( = ?auto_308882 ?auto_308884 ) ) ( not ( = ?auto_308882 ?auto_308885 ) ) ( not ( = ?auto_308883 ?auto_308884 ) ) ( not ( = ?auto_308883 ?auto_308885 ) ) ( not ( = ?auto_308884 ?auto_308885 ) ) ( ON ?auto_308884 ?auto_308885 ) ( ON ?auto_308883 ?auto_308884 ) ( ON ?auto_308882 ?auto_308883 ) ( ON ?auto_308881 ?auto_308882 ) ( ON ?auto_308880 ?auto_308881 ) ( ON ?auto_308879 ?auto_308880 ) ( ON ?auto_308878 ?auto_308879 ) ( CLEAR ?auto_308876 ) ( ON ?auto_308877 ?auto_308878 ) ( CLEAR ?auto_308877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_308872 ?auto_308873 ?auto_308874 ?auto_308875 ?auto_308876 ?auto_308877 )
      ( MAKE-14PILE ?auto_308872 ?auto_308873 ?auto_308874 ?auto_308875 ?auto_308876 ?auto_308877 ?auto_308878 ?auto_308879 ?auto_308880 ?auto_308881 ?auto_308882 ?auto_308883 ?auto_308884 ?auto_308885 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308900 - BLOCK
      ?auto_308901 - BLOCK
      ?auto_308902 - BLOCK
      ?auto_308903 - BLOCK
      ?auto_308904 - BLOCK
      ?auto_308905 - BLOCK
      ?auto_308906 - BLOCK
      ?auto_308907 - BLOCK
      ?auto_308908 - BLOCK
      ?auto_308909 - BLOCK
      ?auto_308910 - BLOCK
      ?auto_308911 - BLOCK
      ?auto_308912 - BLOCK
      ?auto_308913 - BLOCK
    )
    :vars
    (
      ?auto_308914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308913 ?auto_308914 ) ( ON-TABLE ?auto_308900 ) ( ON ?auto_308901 ?auto_308900 ) ( ON ?auto_308902 ?auto_308901 ) ( ON ?auto_308903 ?auto_308902 ) ( not ( = ?auto_308900 ?auto_308901 ) ) ( not ( = ?auto_308900 ?auto_308902 ) ) ( not ( = ?auto_308900 ?auto_308903 ) ) ( not ( = ?auto_308900 ?auto_308904 ) ) ( not ( = ?auto_308900 ?auto_308905 ) ) ( not ( = ?auto_308900 ?auto_308906 ) ) ( not ( = ?auto_308900 ?auto_308907 ) ) ( not ( = ?auto_308900 ?auto_308908 ) ) ( not ( = ?auto_308900 ?auto_308909 ) ) ( not ( = ?auto_308900 ?auto_308910 ) ) ( not ( = ?auto_308900 ?auto_308911 ) ) ( not ( = ?auto_308900 ?auto_308912 ) ) ( not ( = ?auto_308900 ?auto_308913 ) ) ( not ( = ?auto_308900 ?auto_308914 ) ) ( not ( = ?auto_308901 ?auto_308902 ) ) ( not ( = ?auto_308901 ?auto_308903 ) ) ( not ( = ?auto_308901 ?auto_308904 ) ) ( not ( = ?auto_308901 ?auto_308905 ) ) ( not ( = ?auto_308901 ?auto_308906 ) ) ( not ( = ?auto_308901 ?auto_308907 ) ) ( not ( = ?auto_308901 ?auto_308908 ) ) ( not ( = ?auto_308901 ?auto_308909 ) ) ( not ( = ?auto_308901 ?auto_308910 ) ) ( not ( = ?auto_308901 ?auto_308911 ) ) ( not ( = ?auto_308901 ?auto_308912 ) ) ( not ( = ?auto_308901 ?auto_308913 ) ) ( not ( = ?auto_308901 ?auto_308914 ) ) ( not ( = ?auto_308902 ?auto_308903 ) ) ( not ( = ?auto_308902 ?auto_308904 ) ) ( not ( = ?auto_308902 ?auto_308905 ) ) ( not ( = ?auto_308902 ?auto_308906 ) ) ( not ( = ?auto_308902 ?auto_308907 ) ) ( not ( = ?auto_308902 ?auto_308908 ) ) ( not ( = ?auto_308902 ?auto_308909 ) ) ( not ( = ?auto_308902 ?auto_308910 ) ) ( not ( = ?auto_308902 ?auto_308911 ) ) ( not ( = ?auto_308902 ?auto_308912 ) ) ( not ( = ?auto_308902 ?auto_308913 ) ) ( not ( = ?auto_308902 ?auto_308914 ) ) ( not ( = ?auto_308903 ?auto_308904 ) ) ( not ( = ?auto_308903 ?auto_308905 ) ) ( not ( = ?auto_308903 ?auto_308906 ) ) ( not ( = ?auto_308903 ?auto_308907 ) ) ( not ( = ?auto_308903 ?auto_308908 ) ) ( not ( = ?auto_308903 ?auto_308909 ) ) ( not ( = ?auto_308903 ?auto_308910 ) ) ( not ( = ?auto_308903 ?auto_308911 ) ) ( not ( = ?auto_308903 ?auto_308912 ) ) ( not ( = ?auto_308903 ?auto_308913 ) ) ( not ( = ?auto_308903 ?auto_308914 ) ) ( not ( = ?auto_308904 ?auto_308905 ) ) ( not ( = ?auto_308904 ?auto_308906 ) ) ( not ( = ?auto_308904 ?auto_308907 ) ) ( not ( = ?auto_308904 ?auto_308908 ) ) ( not ( = ?auto_308904 ?auto_308909 ) ) ( not ( = ?auto_308904 ?auto_308910 ) ) ( not ( = ?auto_308904 ?auto_308911 ) ) ( not ( = ?auto_308904 ?auto_308912 ) ) ( not ( = ?auto_308904 ?auto_308913 ) ) ( not ( = ?auto_308904 ?auto_308914 ) ) ( not ( = ?auto_308905 ?auto_308906 ) ) ( not ( = ?auto_308905 ?auto_308907 ) ) ( not ( = ?auto_308905 ?auto_308908 ) ) ( not ( = ?auto_308905 ?auto_308909 ) ) ( not ( = ?auto_308905 ?auto_308910 ) ) ( not ( = ?auto_308905 ?auto_308911 ) ) ( not ( = ?auto_308905 ?auto_308912 ) ) ( not ( = ?auto_308905 ?auto_308913 ) ) ( not ( = ?auto_308905 ?auto_308914 ) ) ( not ( = ?auto_308906 ?auto_308907 ) ) ( not ( = ?auto_308906 ?auto_308908 ) ) ( not ( = ?auto_308906 ?auto_308909 ) ) ( not ( = ?auto_308906 ?auto_308910 ) ) ( not ( = ?auto_308906 ?auto_308911 ) ) ( not ( = ?auto_308906 ?auto_308912 ) ) ( not ( = ?auto_308906 ?auto_308913 ) ) ( not ( = ?auto_308906 ?auto_308914 ) ) ( not ( = ?auto_308907 ?auto_308908 ) ) ( not ( = ?auto_308907 ?auto_308909 ) ) ( not ( = ?auto_308907 ?auto_308910 ) ) ( not ( = ?auto_308907 ?auto_308911 ) ) ( not ( = ?auto_308907 ?auto_308912 ) ) ( not ( = ?auto_308907 ?auto_308913 ) ) ( not ( = ?auto_308907 ?auto_308914 ) ) ( not ( = ?auto_308908 ?auto_308909 ) ) ( not ( = ?auto_308908 ?auto_308910 ) ) ( not ( = ?auto_308908 ?auto_308911 ) ) ( not ( = ?auto_308908 ?auto_308912 ) ) ( not ( = ?auto_308908 ?auto_308913 ) ) ( not ( = ?auto_308908 ?auto_308914 ) ) ( not ( = ?auto_308909 ?auto_308910 ) ) ( not ( = ?auto_308909 ?auto_308911 ) ) ( not ( = ?auto_308909 ?auto_308912 ) ) ( not ( = ?auto_308909 ?auto_308913 ) ) ( not ( = ?auto_308909 ?auto_308914 ) ) ( not ( = ?auto_308910 ?auto_308911 ) ) ( not ( = ?auto_308910 ?auto_308912 ) ) ( not ( = ?auto_308910 ?auto_308913 ) ) ( not ( = ?auto_308910 ?auto_308914 ) ) ( not ( = ?auto_308911 ?auto_308912 ) ) ( not ( = ?auto_308911 ?auto_308913 ) ) ( not ( = ?auto_308911 ?auto_308914 ) ) ( not ( = ?auto_308912 ?auto_308913 ) ) ( not ( = ?auto_308912 ?auto_308914 ) ) ( not ( = ?auto_308913 ?auto_308914 ) ) ( ON ?auto_308912 ?auto_308913 ) ( ON ?auto_308911 ?auto_308912 ) ( ON ?auto_308910 ?auto_308911 ) ( ON ?auto_308909 ?auto_308910 ) ( ON ?auto_308908 ?auto_308909 ) ( ON ?auto_308907 ?auto_308908 ) ( ON ?auto_308906 ?auto_308907 ) ( ON ?auto_308905 ?auto_308906 ) ( CLEAR ?auto_308903 ) ( ON ?auto_308904 ?auto_308905 ) ( CLEAR ?auto_308904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_308900 ?auto_308901 ?auto_308902 ?auto_308903 ?auto_308904 )
      ( MAKE-14PILE ?auto_308900 ?auto_308901 ?auto_308902 ?auto_308903 ?auto_308904 ?auto_308905 ?auto_308906 ?auto_308907 ?auto_308908 ?auto_308909 ?auto_308910 ?auto_308911 ?auto_308912 ?auto_308913 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308929 - BLOCK
      ?auto_308930 - BLOCK
      ?auto_308931 - BLOCK
      ?auto_308932 - BLOCK
      ?auto_308933 - BLOCK
      ?auto_308934 - BLOCK
      ?auto_308935 - BLOCK
      ?auto_308936 - BLOCK
      ?auto_308937 - BLOCK
      ?auto_308938 - BLOCK
      ?auto_308939 - BLOCK
      ?auto_308940 - BLOCK
      ?auto_308941 - BLOCK
      ?auto_308942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308942 ) ( ON-TABLE ?auto_308929 ) ( ON ?auto_308930 ?auto_308929 ) ( ON ?auto_308931 ?auto_308930 ) ( ON ?auto_308932 ?auto_308931 ) ( not ( = ?auto_308929 ?auto_308930 ) ) ( not ( = ?auto_308929 ?auto_308931 ) ) ( not ( = ?auto_308929 ?auto_308932 ) ) ( not ( = ?auto_308929 ?auto_308933 ) ) ( not ( = ?auto_308929 ?auto_308934 ) ) ( not ( = ?auto_308929 ?auto_308935 ) ) ( not ( = ?auto_308929 ?auto_308936 ) ) ( not ( = ?auto_308929 ?auto_308937 ) ) ( not ( = ?auto_308929 ?auto_308938 ) ) ( not ( = ?auto_308929 ?auto_308939 ) ) ( not ( = ?auto_308929 ?auto_308940 ) ) ( not ( = ?auto_308929 ?auto_308941 ) ) ( not ( = ?auto_308929 ?auto_308942 ) ) ( not ( = ?auto_308930 ?auto_308931 ) ) ( not ( = ?auto_308930 ?auto_308932 ) ) ( not ( = ?auto_308930 ?auto_308933 ) ) ( not ( = ?auto_308930 ?auto_308934 ) ) ( not ( = ?auto_308930 ?auto_308935 ) ) ( not ( = ?auto_308930 ?auto_308936 ) ) ( not ( = ?auto_308930 ?auto_308937 ) ) ( not ( = ?auto_308930 ?auto_308938 ) ) ( not ( = ?auto_308930 ?auto_308939 ) ) ( not ( = ?auto_308930 ?auto_308940 ) ) ( not ( = ?auto_308930 ?auto_308941 ) ) ( not ( = ?auto_308930 ?auto_308942 ) ) ( not ( = ?auto_308931 ?auto_308932 ) ) ( not ( = ?auto_308931 ?auto_308933 ) ) ( not ( = ?auto_308931 ?auto_308934 ) ) ( not ( = ?auto_308931 ?auto_308935 ) ) ( not ( = ?auto_308931 ?auto_308936 ) ) ( not ( = ?auto_308931 ?auto_308937 ) ) ( not ( = ?auto_308931 ?auto_308938 ) ) ( not ( = ?auto_308931 ?auto_308939 ) ) ( not ( = ?auto_308931 ?auto_308940 ) ) ( not ( = ?auto_308931 ?auto_308941 ) ) ( not ( = ?auto_308931 ?auto_308942 ) ) ( not ( = ?auto_308932 ?auto_308933 ) ) ( not ( = ?auto_308932 ?auto_308934 ) ) ( not ( = ?auto_308932 ?auto_308935 ) ) ( not ( = ?auto_308932 ?auto_308936 ) ) ( not ( = ?auto_308932 ?auto_308937 ) ) ( not ( = ?auto_308932 ?auto_308938 ) ) ( not ( = ?auto_308932 ?auto_308939 ) ) ( not ( = ?auto_308932 ?auto_308940 ) ) ( not ( = ?auto_308932 ?auto_308941 ) ) ( not ( = ?auto_308932 ?auto_308942 ) ) ( not ( = ?auto_308933 ?auto_308934 ) ) ( not ( = ?auto_308933 ?auto_308935 ) ) ( not ( = ?auto_308933 ?auto_308936 ) ) ( not ( = ?auto_308933 ?auto_308937 ) ) ( not ( = ?auto_308933 ?auto_308938 ) ) ( not ( = ?auto_308933 ?auto_308939 ) ) ( not ( = ?auto_308933 ?auto_308940 ) ) ( not ( = ?auto_308933 ?auto_308941 ) ) ( not ( = ?auto_308933 ?auto_308942 ) ) ( not ( = ?auto_308934 ?auto_308935 ) ) ( not ( = ?auto_308934 ?auto_308936 ) ) ( not ( = ?auto_308934 ?auto_308937 ) ) ( not ( = ?auto_308934 ?auto_308938 ) ) ( not ( = ?auto_308934 ?auto_308939 ) ) ( not ( = ?auto_308934 ?auto_308940 ) ) ( not ( = ?auto_308934 ?auto_308941 ) ) ( not ( = ?auto_308934 ?auto_308942 ) ) ( not ( = ?auto_308935 ?auto_308936 ) ) ( not ( = ?auto_308935 ?auto_308937 ) ) ( not ( = ?auto_308935 ?auto_308938 ) ) ( not ( = ?auto_308935 ?auto_308939 ) ) ( not ( = ?auto_308935 ?auto_308940 ) ) ( not ( = ?auto_308935 ?auto_308941 ) ) ( not ( = ?auto_308935 ?auto_308942 ) ) ( not ( = ?auto_308936 ?auto_308937 ) ) ( not ( = ?auto_308936 ?auto_308938 ) ) ( not ( = ?auto_308936 ?auto_308939 ) ) ( not ( = ?auto_308936 ?auto_308940 ) ) ( not ( = ?auto_308936 ?auto_308941 ) ) ( not ( = ?auto_308936 ?auto_308942 ) ) ( not ( = ?auto_308937 ?auto_308938 ) ) ( not ( = ?auto_308937 ?auto_308939 ) ) ( not ( = ?auto_308937 ?auto_308940 ) ) ( not ( = ?auto_308937 ?auto_308941 ) ) ( not ( = ?auto_308937 ?auto_308942 ) ) ( not ( = ?auto_308938 ?auto_308939 ) ) ( not ( = ?auto_308938 ?auto_308940 ) ) ( not ( = ?auto_308938 ?auto_308941 ) ) ( not ( = ?auto_308938 ?auto_308942 ) ) ( not ( = ?auto_308939 ?auto_308940 ) ) ( not ( = ?auto_308939 ?auto_308941 ) ) ( not ( = ?auto_308939 ?auto_308942 ) ) ( not ( = ?auto_308940 ?auto_308941 ) ) ( not ( = ?auto_308940 ?auto_308942 ) ) ( not ( = ?auto_308941 ?auto_308942 ) ) ( ON ?auto_308941 ?auto_308942 ) ( ON ?auto_308940 ?auto_308941 ) ( ON ?auto_308939 ?auto_308940 ) ( ON ?auto_308938 ?auto_308939 ) ( ON ?auto_308937 ?auto_308938 ) ( ON ?auto_308936 ?auto_308937 ) ( ON ?auto_308935 ?auto_308936 ) ( ON ?auto_308934 ?auto_308935 ) ( CLEAR ?auto_308932 ) ( ON ?auto_308933 ?auto_308934 ) ( CLEAR ?auto_308933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_308929 ?auto_308930 ?auto_308931 ?auto_308932 ?auto_308933 )
      ( MAKE-14PILE ?auto_308929 ?auto_308930 ?auto_308931 ?auto_308932 ?auto_308933 ?auto_308934 ?auto_308935 ?auto_308936 ?auto_308937 ?auto_308938 ?auto_308939 ?auto_308940 ?auto_308941 ?auto_308942 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308957 - BLOCK
      ?auto_308958 - BLOCK
      ?auto_308959 - BLOCK
      ?auto_308960 - BLOCK
      ?auto_308961 - BLOCK
      ?auto_308962 - BLOCK
      ?auto_308963 - BLOCK
      ?auto_308964 - BLOCK
      ?auto_308965 - BLOCK
      ?auto_308966 - BLOCK
      ?auto_308967 - BLOCK
      ?auto_308968 - BLOCK
      ?auto_308969 - BLOCK
      ?auto_308970 - BLOCK
    )
    :vars
    (
      ?auto_308971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_308970 ?auto_308971 ) ( ON-TABLE ?auto_308957 ) ( ON ?auto_308958 ?auto_308957 ) ( ON ?auto_308959 ?auto_308958 ) ( not ( = ?auto_308957 ?auto_308958 ) ) ( not ( = ?auto_308957 ?auto_308959 ) ) ( not ( = ?auto_308957 ?auto_308960 ) ) ( not ( = ?auto_308957 ?auto_308961 ) ) ( not ( = ?auto_308957 ?auto_308962 ) ) ( not ( = ?auto_308957 ?auto_308963 ) ) ( not ( = ?auto_308957 ?auto_308964 ) ) ( not ( = ?auto_308957 ?auto_308965 ) ) ( not ( = ?auto_308957 ?auto_308966 ) ) ( not ( = ?auto_308957 ?auto_308967 ) ) ( not ( = ?auto_308957 ?auto_308968 ) ) ( not ( = ?auto_308957 ?auto_308969 ) ) ( not ( = ?auto_308957 ?auto_308970 ) ) ( not ( = ?auto_308957 ?auto_308971 ) ) ( not ( = ?auto_308958 ?auto_308959 ) ) ( not ( = ?auto_308958 ?auto_308960 ) ) ( not ( = ?auto_308958 ?auto_308961 ) ) ( not ( = ?auto_308958 ?auto_308962 ) ) ( not ( = ?auto_308958 ?auto_308963 ) ) ( not ( = ?auto_308958 ?auto_308964 ) ) ( not ( = ?auto_308958 ?auto_308965 ) ) ( not ( = ?auto_308958 ?auto_308966 ) ) ( not ( = ?auto_308958 ?auto_308967 ) ) ( not ( = ?auto_308958 ?auto_308968 ) ) ( not ( = ?auto_308958 ?auto_308969 ) ) ( not ( = ?auto_308958 ?auto_308970 ) ) ( not ( = ?auto_308958 ?auto_308971 ) ) ( not ( = ?auto_308959 ?auto_308960 ) ) ( not ( = ?auto_308959 ?auto_308961 ) ) ( not ( = ?auto_308959 ?auto_308962 ) ) ( not ( = ?auto_308959 ?auto_308963 ) ) ( not ( = ?auto_308959 ?auto_308964 ) ) ( not ( = ?auto_308959 ?auto_308965 ) ) ( not ( = ?auto_308959 ?auto_308966 ) ) ( not ( = ?auto_308959 ?auto_308967 ) ) ( not ( = ?auto_308959 ?auto_308968 ) ) ( not ( = ?auto_308959 ?auto_308969 ) ) ( not ( = ?auto_308959 ?auto_308970 ) ) ( not ( = ?auto_308959 ?auto_308971 ) ) ( not ( = ?auto_308960 ?auto_308961 ) ) ( not ( = ?auto_308960 ?auto_308962 ) ) ( not ( = ?auto_308960 ?auto_308963 ) ) ( not ( = ?auto_308960 ?auto_308964 ) ) ( not ( = ?auto_308960 ?auto_308965 ) ) ( not ( = ?auto_308960 ?auto_308966 ) ) ( not ( = ?auto_308960 ?auto_308967 ) ) ( not ( = ?auto_308960 ?auto_308968 ) ) ( not ( = ?auto_308960 ?auto_308969 ) ) ( not ( = ?auto_308960 ?auto_308970 ) ) ( not ( = ?auto_308960 ?auto_308971 ) ) ( not ( = ?auto_308961 ?auto_308962 ) ) ( not ( = ?auto_308961 ?auto_308963 ) ) ( not ( = ?auto_308961 ?auto_308964 ) ) ( not ( = ?auto_308961 ?auto_308965 ) ) ( not ( = ?auto_308961 ?auto_308966 ) ) ( not ( = ?auto_308961 ?auto_308967 ) ) ( not ( = ?auto_308961 ?auto_308968 ) ) ( not ( = ?auto_308961 ?auto_308969 ) ) ( not ( = ?auto_308961 ?auto_308970 ) ) ( not ( = ?auto_308961 ?auto_308971 ) ) ( not ( = ?auto_308962 ?auto_308963 ) ) ( not ( = ?auto_308962 ?auto_308964 ) ) ( not ( = ?auto_308962 ?auto_308965 ) ) ( not ( = ?auto_308962 ?auto_308966 ) ) ( not ( = ?auto_308962 ?auto_308967 ) ) ( not ( = ?auto_308962 ?auto_308968 ) ) ( not ( = ?auto_308962 ?auto_308969 ) ) ( not ( = ?auto_308962 ?auto_308970 ) ) ( not ( = ?auto_308962 ?auto_308971 ) ) ( not ( = ?auto_308963 ?auto_308964 ) ) ( not ( = ?auto_308963 ?auto_308965 ) ) ( not ( = ?auto_308963 ?auto_308966 ) ) ( not ( = ?auto_308963 ?auto_308967 ) ) ( not ( = ?auto_308963 ?auto_308968 ) ) ( not ( = ?auto_308963 ?auto_308969 ) ) ( not ( = ?auto_308963 ?auto_308970 ) ) ( not ( = ?auto_308963 ?auto_308971 ) ) ( not ( = ?auto_308964 ?auto_308965 ) ) ( not ( = ?auto_308964 ?auto_308966 ) ) ( not ( = ?auto_308964 ?auto_308967 ) ) ( not ( = ?auto_308964 ?auto_308968 ) ) ( not ( = ?auto_308964 ?auto_308969 ) ) ( not ( = ?auto_308964 ?auto_308970 ) ) ( not ( = ?auto_308964 ?auto_308971 ) ) ( not ( = ?auto_308965 ?auto_308966 ) ) ( not ( = ?auto_308965 ?auto_308967 ) ) ( not ( = ?auto_308965 ?auto_308968 ) ) ( not ( = ?auto_308965 ?auto_308969 ) ) ( not ( = ?auto_308965 ?auto_308970 ) ) ( not ( = ?auto_308965 ?auto_308971 ) ) ( not ( = ?auto_308966 ?auto_308967 ) ) ( not ( = ?auto_308966 ?auto_308968 ) ) ( not ( = ?auto_308966 ?auto_308969 ) ) ( not ( = ?auto_308966 ?auto_308970 ) ) ( not ( = ?auto_308966 ?auto_308971 ) ) ( not ( = ?auto_308967 ?auto_308968 ) ) ( not ( = ?auto_308967 ?auto_308969 ) ) ( not ( = ?auto_308967 ?auto_308970 ) ) ( not ( = ?auto_308967 ?auto_308971 ) ) ( not ( = ?auto_308968 ?auto_308969 ) ) ( not ( = ?auto_308968 ?auto_308970 ) ) ( not ( = ?auto_308968 ?auto_308971 ) ) ( not ( = ?auto_308969 ?auto_308970 ) ) ( not ( = ?auto_308969 ?auto_308971 ) ) ( not ( = ?auto_308970 ?auto_308971 ) ) ( ON ?auto_308969 ?auto_308970 ) ( ON ?auto_308968 ?auto_308969 ) ( ON ?auto_308967 ?auto_308968 ) ( ON ?auto_308966 ?auto_308967 ) ( ON ?auto_308965 ?auto_308966 ) ( ON ?auto_308964 ?auto_308965 ) ( ON ?auto_308963 ?auto_308964 ) ( ON ?auto_308962 ?auto_308963 ) ( ON ?auto_308961 ?auto_308962 ) ( CLEAR ?auto_308959 ) ( ON ?auto_308960 ?auto_308961 ) ( CLEAR ?auto_308960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_308957 ?auto_308958 ?auto_308959 ?auto_308960 )
      ( MAKE-14PILE ?auto_308957 ?auto_308958 ?auto_308959 ?auto_308960 ?auto_308961 ?auto_308962 ?auto_308963 ?auto_308964 ?auto_308965 ?auto_308966 ?auto_308967 ?auto_308968 ?auto_308969 ?auto_308970 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_308986 - BLOCK
      ?auto_308987 - BLOCK
      ?auto_308988 - BLOCK
      ?auto_308989 - BLOCK
      ?auto_308990 - BLOCK
      ?auto_308991 - BLOCK
      ?auto_308992 - BLOCK
      ?auto_308993 - BLOCK
      ?auto_308994 - BLOCK
      ?auto_308995 - BLOCK
      ?auto_308996 - BLOCK
      ?auto_308997 - BLOCK
      ?auto_308998 - BLOCK
      ?auto_308999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_308999 ) ( ON-TABLE ?auto_308986 ) ( ON ?auto_308987 ?auto_308986 ) ( ON ?auto_308988 ?auto_308987 ) ( not ( = ?auto_308986 ?auto_308987 ) ) ( not ( = ?auto_308986 ?auto_308988 ) ) ( not ( = ?auto_308986 ?auto_308989 ) ) ( not ( = ?auto_308986 ?auto_308990 ) ) ( not ( = ?auto_308986 ?auto_308991 ) ) ( not ( = ?auto_308986 ?auto_308992 ) ) ( not ( = ?auto_308986 ?auto_308993 ) ) ( not ( = ?auto_308986 ?auto_308994 ) ) ( not ( = ?auto_308986 ?auto_308995 ) ) ( not ( = ?auto_308986 ?auto_308996 ) ) ( not ( = ?auto_308986 ?auto_308997 ) ) ( not ( = ?auto_308986 ?auto_308998 ) ) ( not ( = ?auto_308986 ?auto_308999 ) ) ( not ( = ?auto_308987 ?auto_308988 ) ) ( not ( = ?auto_308987 ?auto_308989 ) ) ( not ( = ?auto_308987 ?auto_308990 ) ) ( not ( = ?auto_308987 ?auto_308991 ) ) ( not ( = ?auto_308987 ?auto_308992 ) ) ( not ( = ?auto_308987 ?auto_308993 ) ) ( not ( = ?auto_308987 ?auto_308994 ) ) ( not ( = ?auto_308987 ?auto_308995 ) ) ( not ( = ?auto_308987 ?auto_308996 ) ) ( not ( = ?auto_308987 ?auto_308997 ) ) ( not ( = ?auto_308987 ?auto_308998 ) ) ( not ( = ?auto_308987 ?auto_308999 ) ) ( not ( = ?auto_308988 ?auto_308989 ) ) ( not ( = ?auto_308988 ?auto_308990 ) ) ( not ( = ?auto_308988 ?auto_308991 ) ) ( not ( = ?auto_308988 ?auto_308992 ) ) ( not ( = ?auto_308988 ?auto_308993 ) ) ( not ( = ?auto_308988 ?auto_308994 ) ) ( not ( = ?auto_308988 ?auto_308995 ) ) ( not ( = ?auto_308988 ?auto_308996 ) ) ( not ( = ?auto_308988 ?auto_308997 ) ) ( not ( = ?auto_308988 ?auto_308998 ) ) ( not ( = ?auto_308988 ?auto_308999 ) ) ( not ( = ?auto_308989 ?auto_308990 ) ) ( not ( = ?auto_308989 ?auto_308991 ) ) ( not ( = ?auto_308989 ?auto_308992 ) ) ( not ( = ?auto_308989 ?auto_308993 ) ) ( not ( = ?auto_308989 ?auto_308994 ) ) ( not ( = ?auto_308989 ?auto_308995 ) ) ( not ( = ?auto_308989 ?auto_308996 ) ) ( not ( = ?auto_308989 ?auto_308997 ) ) ( not ( = ?auto_308989 ?auto_308998 ) ) ( not ( = ?auto_308989 ?auto_308999 ) ) ( not ( = ?auto_308990 ?auto_308991 ) ) ( not ( = ?auto_308990 ?auto_308992 ) ) ( not ( = ?auto_308990 ?auto_308993 ) ) ( not ( = ?auto_308990 ?auto_308994 ) ) ( not ( = ?auto_308990 ?auto_308995 ) ) ( not ( = ?auto_308990 ?auto_308996 ) ) ( not ( = ?auto_308990 ?auto_308997 ) ) ( not ( = ?auto_308990 ?auto_308998 ) ) ( not ( = ?auto_308990 ?auto_308999 ) ) ( not ( = ?auto_308991 ?auto_308992 ) ) ( not ( = ?auto_308991 ?auto_308993 ) ) ( not ( = ?auto_308991 ?auto_308994 ) ) ( not ( = ?auto_308991 ?auto_308995 ) ) ( not ( = ?auto_308991 ?auto_308996 ) ) ( not ( = ?auto_308991 ?auto_308997 ) ) ( not ( = ?auto_308991 ?auto_308998 ) ) ( not ( = ?auto_308991 ?auto_308999 ) ) ( not ( = ?auto_308992 ?auto_308993 ) ) ( not ( = ?auto_308992 ?auto_308994 ) ) ( not ( = ?auto_308992 ?auto_308995 ) ) ( not ( = ?auto_308992 ?auto_308996 ) ) ( not ( = ?auto_308992 ?auto_308997 ) ) ( not ( = ?auto_308992 ?auto_308998 ) ) ( not ( = ?auto_308992 ?auto_308999 ) ) ( not ( = ?auto_308993 ?auto_308994 ) ) ( not ( = ?auto_308993 ?auto_308995 ) ) ( not ( = ?auto_308993 ?auto_308996 ) ) ( not ( = ?auto_308993 ?auto_308997 ) ) ( not ( = ?auto_308993 ?auto_308998 ) ) ( not ( = ?auto_308993 ?auto_308999 ) ) ( not ( = ?auto_308994 ?auto_308995 ) ) ( not ( = ?auto_308994 ?auto_308996 ) ) ( not ( = ?auto_308994 ?auto_308997 ) ) ( not ( = ?auto_308994 ?auto_308998 ) ) ( not ( = ?auto_308994 ?auto_308999 ) ) ( not ( = ?auto_308995 ?auto_308996 ) ) ( not ( = ?auto_308995 ?auto_308997 ) ) ( not ( = ?auto_308995 ?auto_308998 ) ) ( not ( = ?auto_308995 ?auto_308999 ) ) ( not ( = ?auto_308996 ?auto_308997 ) ) ( not ( = ?auto_308996 ?auto_308998 ) ) ( not ( = ?auto_308996 ?auto_308999 ) ) ( not ( = ?auto_308997 ?auto_308998 ) ) ( not ( = ?auto_308997 ?auto_308999 ) ) ( not ( = ?auto_308998 ?auto_308999 ) ) ( ON ?auto_308998 ?auto_308999 ) ( ON ?auto_308997 ?auto_308998 ) ( ON ?auto_308996 ?auto_308997 ) ( ON ?auto_308995 ?auto_308996 ) ( ON ?auto_308994 ?auto_308995 ) ( ON ?auto_308993 ?auto_308994 ) ( ON ?auto_308992 ?auto_308993 ) ( ON ?auto_308991 ?auto_308992 ) ( ON ?auto_308990 ?auto_308991 ) ( CLEAR ?auto_308988 ) ( ON ?auto_308989 ?auto_308990 ) ( CLEAR ?auto_308989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_308986 ?auto_308987 ?auto_308988 ?auto_308989 )
      ( MAKE-14PILE ?auto_308986 ?auto_308987 ?auto_308988 ?auto_308989 ?auto_308990 ?auto_308991 ?auto_308992 ?auto_308993 ?auto_308994 ?auto_308995 ?auto_308996 ?auto_308997 ?auto_308998 ?auto_308999 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309014 - BLOCK
      ?auto_309015 - BLOCK
      ?auto_309016 - BLOCK
      ?auto_309017 - BLOCK
      ?auto_309018 - BLOCK
      ?auto_309019 - BLOCK
      ?auto_309020 - BLOCK
      ?auto_309021 - BLOCK
      ?auto_309022 - BLOCK
      ?auto_309023 - BLOCK
      ?auto_309024 - BLOCK
      ?auto_309025 - BLOCK
      ?auto_309026 - BLOCK
      ?auto_309027 - BLOCK
    )
    :vars
    (
      ?auto_309028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309027 ?auto_309028 ) ( ON-TABLE ?auto_309014 ) ( ON ?auto_309015 ?auto_309014 ) ( not ( = ?auto_309014 ?auto_309015 ) ) ( not ( = ?auto_309014 ?auto_309016 ) ) ( not ( = ?auto_309014 ?auto_309017 ) ) ( not ( = ?auto_309014 ?auto_309018 ) ) ( not ( = ?auto_309014 ?auto_309019 ) ) ( not ( = ?auto_309014 ?auto_309020 ) ) ( not ( = ?auto_309014 ?auto_309021 ) ) ( not ( = ?auto_309014 ?auto_309022 ) ) ( not ( = ?auto_309014 ?auto_309023 ) ) ( not ( = ?auto_309014 ?auto_309024 ) ) ( not ( = ?auto_309014 ?auto_309025 ) ) ( not ( = ?auto_309014 ?auto_309026 ) ) ( not ( = ?auto_309014 ?auto_309027 ) ) ( not ( = ?auto_309014 ?auto_309028 ) ) ( not ( = ?auto_309015 ?auto_309016 ) ) ( not ( = ?auto_309015 ?auto_309017 ) ) ( not ( = ?auto_309015 ?auto_309018 ) ) ( not ( = ?auto_309015 ?auto_309019 ) ) ( not ( = ?auto_309015 ?auto_309020 ) ) ( not ( = ?auto_309015 ?auto_309021 ) ) ( not ( = ?auto_309015 ?auto_309022 ) ) ( not ( = ?auto_309015 ?auto_309023 ) ) ( not ( = ?auto_309015 ?auto_309024 ) ) ( not ( = ?auto_309015 ?auto_309025 ) ) ( not ( = ?auto_309015 ?auto_309026 ) ) ( not ( = ?auto_309015 ?auto_309027 ) ) ( not ( = ?auto_309015 ?auto_309028 ) ) ( not ( = ?auto_309016 ?auto_309017 ) ) ( not ( = ?auto_309016 ?auto_309018 ) ) ( not ( = ?auto_309016 ?auto_309019 ) ) ( not ( = ?auto_309016 ?auto_309020 ) ) ( not ( = ?auto_309016 ?auto_309021 ) ) ( not ( = ?auto_309016 ?auto_309022 ) ) ( not ( = ?auto_309016 ?auto_309023 ) ) ( not ( = ?auto_309016 ?auto_309024 ) ) ( not ( = ?auto_309016 ?auto_309025 ) ) ( not ( = ?auto_309016 ?auto_309026 ) ) ( not ( = ?auto_309016 ?auto_309027 ) ) ( not ( = ?auto_309016 ?auto_309028 ) ) ( not ( = ?auto_309017 ?auto_309018 ) ) ( not ( = ?auto_309017 ?auto_309019 ) ) ( not ( = ?auto_309017 ?auto_309020 ) ) ( not ( = ?auto_309017 ?auto_309021 ) ) ( not ( = ?auto_309017 ?auto_309022 ) ) ( not ( = ?auto_309017 ?auto_309023 ) ) ( not ( = ?auto_309017 ?auto_309024 ) ) ( not ( = ?auto_309017 ?auto_309025 ) ) ( not ( = ?auto_309017 ?auto_309026 ) ) ( not ( = ?auto_309017 ?auto_309027 ) ) ( not ( = ?auto_309017 ?auto_309028 ) ) ( not ( = ?auto_309018 ?auto_309019 ) ) ( not ( = ?auto_309018 ?auto_309020 ) ) ( not ( = ?auto_309018 ?auto_309021 ) ) ( not ( = ?auto_309018 ?auto_309022 ) ) ( not ( = ?auto_309018 ?auto_309023 ) ) ( not ( = ?auto_309018 ?auto_309024 ) ) ( not ( = ?auto_309018 ?auto_309025 ) ) ( not ( = ?auto_309018 ?auto_309026 ) ) ( not ( = ?auto_309018 ?auto_309027 ) ) ( not ( = ?auto_309018 ?auto_309028 ) ) ( not ( = ?auto_309019 ?auto_309020 ) ) ( not ( = ?auto_309019 ?auto_309021 ) ) ( not ( = ?auto_309019 ?auto_309022 ) ) ( not ( = ?auto_309019 ?auto_309023 ) ) ( not ( = ?auto_309019 ?auto_309024 ) ) ( not ( = ?auto_309019 ?auto_309025 ) ) ( not ( = ?auto_309019 ?auto_309026 ) ) ( not ( = ?auto_309019 ?auto_309027 ) ) ( not ( = ?auto_309019 ?auto_309028 ) ) ( not ( = ?auto_309020 ?auto_309021 ) ) ( not ( = ?auto_309020 ?auto_309022 ) ) ( not ( = ?auto_309020 ?auto_309023 ) ) ( not ( = ?auto_309020 ?auto_309024 ) ) ( not ( = ?auto_309020 ?auto_309025 ) ) ( not ( = ?auto_309020 ?auto_309026 ) ) ( not ( = ?auto_309020 ?auto_309027 ) ) ( not ( = ?auto_309020 ?auto_309028 ) ) ( not ( = ?auto_309021 ?auto_309022 ) ) ( not ( = ?auto_309021 ?auto_309023 ) ) ( not ( = ?auto_309021 ?auto_309024 ) ) ( not ( = ?auto_309021 ?auto_309025 ) ) ( not ( = ?auto_309021 ?auto_309026 ) ) ( not ( = ?auto_309021 ?auto_309027 ) ) ( not ( = ?auto_309021 ?auto_309028 ) ) ( not ( = ?auto_309022 ?auto_309023 ) ) ( not ( = ?auto_309022 ?auto_309024 ) ) ( not ( = ?auto_309022 ?auto_309025 ) ) ( not ( = ?auto_309022 ?auto_309026 ) ) ( not ( = ?auto_309022 ?auto_309027 ) ) ( not ( = ?auto_309022 ?auto_309028 ) ) ( not ( = ?auto_309023 ?auto_309024 ) ) ( not ( = ?auto_309023 ?auto_309025 ) ) ( not ( = ?auto_309023 ?auto_309026 ) ) ( not ( = ?auto_309023 ?auto_309027 ) ) ( not ( = ?auto_309023 ?auto_309028 ) ) ( not ( = ?auto_309024 ?auto_309025 ) ) ( not ( = ?auto_309024 ?auto_309026 ) ) ( not ( = ?auto_309024 ?auto_309027 ) ) ( not ( = ?auto_309024 ?auto_309028 ) ) ( not ( = ?auto_309025 ?auto_309026 ) ) ( not ( = ?auto_309025 ?auto_309027 ) ) ( not ( = ?auto_309025 ?auto_309028 ) ) ( not ( = ?auto_309026 ?auto_309027 ) ) ( not ( = ?auto_309026 ?auto_309028 ) ) ( not ( = ?auto_309027 ?auto_309028 ) ) ( ON ?auto_309026 ?auto_309027 ) ( ON ?auto_309025 ?auto_309026 ) ( ON ?auto_309024 ?auto_309025 ) ( ON ?auto_309023 ?auto_309024 ) ( ON ?auto_309022 ?auto_309023 ) ( ON ?auto_309021 ?auto_309022 ) ( ON ?auto_309020 ?auto_309021 ) ( ON ?auto_309019 ?auto_309020 ) ( ON ?auto_309018 ?auto_309019 ) ( ON ?auto_309017 ?auto_309018 ) ( CLEAR ?auto_309015 ) ( ON ?auto_309016 ?auto_309017 ) ( CLEAR ?auto_309016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309014 ?auto_309015 ?auto_309016 )
      ( MAKE-14PILE ?auto_309014 ?auto_309015 ?auto_309016 ?auto_309017 ?auto_309018 ?auto_309019 ?auto_309020 ?auto_309021 ?auto_309022 ?auto_309023 ?auto_309024 ?auto_309025 ?auto_309026 ?auto_309027 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309043 - BLOCK
      ?auto_309044 - BLOCK
      ?auto_309045 - BLOCK
      ?auto_309046 - BLOCK
      ?auto_309047 - BLOCK
      ?auto_309048 - BLOCK
      ?auto_309049 - BLOCK
      ?auto_309050 - BLOCK
      ?auto_309051 - BLOCK
      ?auto_309052 - BLOCK
      ?auto_309053 - BLOCK
      ?auto_309054 - BLOCK
      ?auto_309055 - BLOCK
      ?auto_309056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_309056 ) ( ON-TABLE ?auto_309043 ) ( ON ?auto_309044 ?auto_309043 ) ( not ( = ?auto_309043 ?auto_309044 ) ) ( not ( = ?auto_309043 ?auto_309045 ) ) ( not ( = ?auto_309043 ?auto_309046 ) ) ( not ( = ?auto_309043 ?auto_309047 ) ) ( not ( = ?auto_309043 ?auto_309048 ) ) ( not ( = ?auto_309043 ?auto_309049 ) ) ( not ( = ?auto_309043 ?auto_309050 ) ) ( not ( = ?auto_309043 ?auto_309051 ) ) ( not ( = ?auto_309043 ?auto_309052 ) ) ( not ( = ?auto_309043 ?auto_309053 ) ) ( not ( = ?auto_309043 ?auto_309054 ) ) ( not ( = ?auto_309043 ?auto_309055 ) ) ( not ( = ?auto_309043 ?auto_309056 ) ) ( not ( = ?auto_309044 ?auto_309045 ) ) ( not ( = ?auto_309044 ?auto_309046 ) ) ( not ( = ?auto_309044 ?auto_309047 ) ) ( not ( = ?auto_309044 ?auto_309048 ) ) ( not ( = ?auto_309044 ?auto_309049 ) ) ( not ( = ?auto_309044 ?auto_309050 ) ) ( not ( = ?auto_309044 ?auto_309051 ) ) ( not ( = ?auto_309044 ?auto_309052 ) ) ( not ( = ?auto_309044 ?auto_309053 ) ) ( not ( = ?auto_309044 ?auto_309054 ) ) ( not ( = ?auto_309044 ?auto_309055 ) ) ( not ( = ?auto_309044 ?auto_309056 ) ) ( not ( = ?auto_309045 ?auto_309046 ) ) ( not ( = ?auto_309045 ?auto_309047 ) ) ( not ( = ?auto_309045 ?auto_309048 ) ) ( not ( = ?auto_309045 ?auto_309049 ) ) ( not ( = ?auto_309045 ?auto_309050 ) ) ( not ( = ?auto_309045 ?auto_309051 ) ) ( not ( = ?auto_309045 ?auto_309052 ) ) ( not ( = ?auto_309045 ?auto_309053 ) ) ( not ( = ?auto_309045 ?auto_309054 ) ) ( not ( = ?auto_309045 ?auto_309055 ) ) ( not ( = ?auto_309045 ?auto_309056 ) ) ( not ( = ?auto_309046 ?auto_309047 ) ) ( not ( = ?auto_309046 ?auto_309048 ) ) ( not ( = ?auto_309046 ?auto_309049 ) ) ( not ( = ?auto_309046 ?auto_309050 ) ) ( not ( = ?auto_309046 ?auto_309051 ) ) ( not ( = ?auto_309046 ?auto_309052 ) ) ( not ( = ?auto_309046 ?auto_309053 ) ) ( not ( = ?auto_309046 ?auto_309054 ) ) ( not ( = ?auto_309046 ?auto_309055 ) ) ( not ( = ?auto_309046 ?auto_309056 ) ) ( not ( = ?auto_309047 ?auto_309048 ) ) ( not ( = ?auto_309047 ?auto_309049 ) ) ( not ( = ?auto_309047 ?auto_309050 ) ) ( not ( = ?auto_309047 ?auto_309051 ) ) ( not ( = ?auto_309047 ?auto_309052 ) ) ( not ( = ?auto_309047 ?auto_309053 ) ) ( not ( = ?auto_309047 ?auto_309054 ) ) ( not ( = ?auto_309047 ?auto_309055 ) ) ( not ( = ?auto_309047 ?auto_309056 ) ) ( not ( = ?auto_309048 ?auto_309049 ) ) ( not ( = ?auto_309048 ?auto_309050 ) ) ( not ( = ?auto_309048 ?auto_309051 ) ) ( not ( = ?auto_309048 ?auto_309052 ) ) ( not ( = ?auto_309048 ?auto_309053 ) ) ( not ( = ?auto_309048 ?auto_309054 ) ) ( not ( = ?auto_309048 ?auto_309055 ) ) ( not ( = ?auto_309048 ?auto_309056 ) ) ( not ( = ?auto_309049 ?auto_309050 ) ) ( not ( = ?auto_309049 ?auto_309051 ) ) ( not ( = ?auto_309049 ?auto_309052 ) ) ( not ( = ?auto_309049 ?auto_309053 ) ) ( not ( = ?auto_309049 ?auto_309054 ) ) ( not ( = ?auto_309049 ?auto_309055 ) ) ( not ( = ?auto_309049 ?auto_309056 ) ) ( not ( = ?auto_309050 ?auto_309051 ) ) ( not ( = ?auto_309050 ?auto_309052 ) ) ( not ( = ?auto_309050 ?auto_309053 ) ) ( not ( = ?auto_309050 ?auto_309054 ) ) ( not ( = ?auto_309050 ?auto_309055 ) ) ( not ( = ?auto_309050 ?auto_309056 ) ) ( not ( = ?auto_309051 ?auto_309052 ) ) ( not ( = ?auto_309051 ?auto_309053 ) ) ( not ( = ?auto_309051 ?auto_309054 ) ) ( not ( = ?auto_309051 ?auto_309055 ) ) ( not ( = ?auto_309051 ?auto_309056 ) ) ( not ( = ?auto_309052 ?auto_309053 ) ) ( not ( = ?auto_309052 ?auto_309054 ) ) ( not ( = ?auto_309052 ?auto_309055 ) ) ( not ( = ?auto_309052 ?auto_309056 ) ) ( not ( = ?auto_309053 ?auto_309054 ) ) ( not ( = ?auto_309053 ?auto_309055 ) ) ( not ( = ?auto_309053 ?auto_309056 ) ) ( not ( = ?auto_309054 ?auto_309055 ) ) ( not ( = ?auto_309054 ?auto_309056 ) ) ( not ( = ?auto_309055 ?auto_309056 ) ) ( ON ?auto_309055 ?auto_309056 ) ( ON ?auto_309054 ?auto_309055 ) ( ON ?auto_309053 ?auto_309054 ) ( ON ?auto_309052 ?auto_309053 ) ( ON ?auto_309051 ?auto_309052 ) ( ON ?auto_309050 ?auto_309051 ) ( ON ?auto_309049 ?auto_309050 ) ( ON ?auto_309048 ?auto_309049 ) ( ON ?auto_309047 ?auto_309048 ) ( ON ?auto_309046 ?auto_309047 ) ( CLEAR ?auto_309044 ) ( ON ?auto_309045 ?auto_309046 ) ( CLEAR ?auto_309045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_309043 ?auto_309044 ?auto_309045 )
      ( MAKE-14PILE ?auto_309043 ?auto_309044 ?auto_309045 ?auto_309046 ?auto_309047 ?auto_309048 ?auto_309049 ?auto_309050 ?auto_309051 ?auto_309052 ?auto_309053 ?auto_309054 ?auto_309055 ?auto_309056 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309071 - BLOCK
      ?auto_309072 - BLOCK
      ?auto_309073 - BLOCK
      ?auto_309074 - BLOCK
      ?auto_309075 - BLOCK
      ?auto_309076 - BLOCK
      ?auto_309077 - BLOCK
      ?auto_309078 - BLOCK
      ?auto_309079 - BLOCK
      ?auto_309080 - BLOCK
      ?auto_309081 - BLOCK
      ?auto_309082 - BLOCK
      ?auto_309083 - BLOCK
      ?auto_309084 - BLOCK
    )
    :vars
    (
      ?auto_309085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309084 ?auto_309085 ) ( ON-TABLE ?auto_309071 ) ( not ( = ?auto_309071 ?auto_309072 ) ) ( not ( = ?auto_309071 ?auto_309073 ) ) ( not ( = ?auto_309071 ?auto_309074 ) ) ( not ( = ?auto_309071 ?auto_309075 ) ) ( not ( = ?auto_309071 ?auto_309076 ) ) ( not ( = ?auto_309071 ?auto_309077 ) ) ( not ( = ?auto_309071 ?auto_309078 ) ) ( not ( = ?auto_309071 ?auto_309079 ) ) ( not ( = ?auto_309071 ?auto_309080 ) ) ( not ( = ?auto_309071 ?auto_309081 ) ) ( not ( = ?auto_309071 ?auto_309082 ) ) ( not ( = ?auto_309071 ?auto_309083 ) ) ( not ( = ?auto_309071 ?auto_309084 ) ) ( not ( = ?auto_309071 ?auto_309085 ) ) ( not ( = ?auto_309072 ?auto_309073 ) ) ( not ( = ?auto_309072 ?auto_309074 ) ) ( not ( = ?auto_309072 ?auto_309075 ) ) ( not ( = ?auto_309072 ?auto_309076 ) ) ( not ( = ?auto_309072 ?auto_309077 ) ) ( not ( = ?auto_309072 ?auto_309078 ) ) ( not ( = ?auto_309072 ?auto_309079 ) ) ( not ( = ?auto_309072 ?auto_309080 ) ) ( not ( = ?auto_309072 ?auto_309081 ) ) ( not ( = ?auto_309072 ?auto_309082 ) ) ( not ( = ?auto_309072 ?auto_309083 ) ) ( not ( = ?auto_309072 ?auto_309084 ) ) ( not ( = ?auto_309072 ?auto_309085 ) ) ( not ( = ?auto_309073 ?auto_309074 ) ) ( not ( = ?auto_309073 ?auto_309075 ) ) ( not ( = ?auto_309073 ?auto_309076 ) ) ( not ( = ?auto_309073 ?auto_309077 ) ) ( not ( = ?auto_309073 ?auto_309078 ) ) ( not ( = ?auto_309073 ?auto_309079 ) ) ( not ( = ?auto_309073 ?auto_309080 ) ) ( not ( = ?auto_309073 ?auto_309081 ) ) ( not ( = ?auto_309073 ?auto_309082 ) ) ( not ( = ?auto_309073 ?auto_309083 ) ) ( not ( = ?auto_309073 ?auto_309084 ) ) ( not ( = ?auto_309073 ?auto_309085 ) ) ( not ( = ?auto_309074 ?auto_309075 ) ) ( not ( = ?auto_309074 ?auto_309076 ) ) ( not ( = ?auto_309074 ?auto_309077 ) ) ( not ( = ?auto_309074 ?auto_309078 ) ) ( not ( = ?auto_309074 ?auto_309079 ) ) ( not ( = ?auto_309074 ?auto_309080 ) ) ( not ( = ?auto_309074 ?auto_309081 ) ) ( not ( = ?auto_309074 ?auto_309082 ) ) ( not ( = ?auto_309074 ?auto_309083 ) ) ( not ( = ?auto_309074 ?auto_309084 ) ) ( not ( = ?auto_309074 ?auto_309085 ) ) ( not ( = ?auto_309075 ?auto_309076 ) ) ( not ( = ?auto_309075 ?auto_309077 ) ) ( not ( = ?auto_309075 ?auto_309078 ) ) ( not ( = ?auto_309075 ?auto_309079 ) ) ( not ( = ?auto_309075 ?auto_309080 ) ) ( not ( = ?auto_309075 ?auto_309081 ) ) ( not ( = ?auto_309075 ?auto_309082 ) ) ( not ( = ?auto_309075 ?auto_309083 ) ) ( not ( = ?auto_309075 ?auto_309084 ) ) ( not ( = ?auto_309075 ?auto_309085 ) ) ( not ( = ?auto_309076 ?auto_309077 ) ) ( not ( = ?auto_309076 ?auto_309078 ) ) ( not ( = ?auto_309076 ?auto_309079 ) ) ( not ( = ?auto_309076 ?auto_309080 ) ) ( not ( = ?auto_309076 ?auto_309081 ) ) ( not ( = ?auto_309076 ?auto_309082 ) ) ( not ( = ?auto_309076 ?auto_309083 ) ) ( not ( = ?auto_309076 ?auto_309084 ) ) ( not ( = ?auto_309076 ?auto_309085 ) ) ( not ( = ?auto_309077 ?auto_309078 ) ) ( not ( = ?auto_309077 ?auto_309079 ) ) ( not ( = ?auto_309077 ?auto_309080 ) ) ( not ( = ?auto_309077 ?auto_309081 ) ) ( not ( = ?auto_309077 ?auto_309082 ) ) ( not ( = ?auto_309077 ?auto_309083 ) ) ( not ( = ?auto_309077 ?auto_309084 ) ) ( not ( = ?auto_309077 ?auto_309085 ) ) ( not ( = ?auto_309078 ?auto_309079 ) ) ( not ( = ?auto_309078 ?auto_309080 ) ) ( not ( = ?auto_309078 ?auto_309081 ) ) ( not ( = ?auto_309078 ?auto_309082 ) ) ( not ( = ?auto_309078 ?auto_309083 ) ) ( not ( = ?auto_309078 ?auto_309084 ) ) ( not ( = ?auto_309078 ?auto_309085 ) ) ( not ( = ?auto_309079 ?auto_309080 ) ) ( not ( = ?auto_309079 ?auto_309081 ) ) ( not ( = ?auto_309079 ?auto_309082 ) ) ( not ( = ?auto_309079 ?auto_309083 ) ) ( not ( = ?auto_309079 ?auto_309084 ) ) ( not ( = ?auto_309079 ?auto_309085 ) ) ( not ( = ?auto_309080 ?auto_309081 ) ) ( not ( = ?auto_309080 ?auto_309082 ) ) ( not ( = ?auto_309080 ?auto_309083 ) ) ( not ( = ?auto_309080 ?auto_309084 ) ) ( not ( = ?auto_309080 ?auto_309085 ) ) ( not ( = ?auto_309081 ?auto_309082 ) ) ( not ( = ?auto_309081 ?auto_309083 ) ) ( not ( = ?auto_309081 ?auto_309084 ) ) ( not ( = ?auto_309081 ?auto_309085 ) ) ( not ( = ?auto_309082 ?auto_309083 ) ) ( not ( = ?auto_309082 ?auto_309084 ) ) ( not ( = ?auto_309082 ?auto_309085 ) ) ( not ( = ?auto_309083 ?auto_309084 ) ) ( not ( = ?auto_309083 ?auto_309085 ) ) ( not ( = ?auto_309084 ?auto_309085 ) ) ( ON ?auto_309083 ?auto_309084 ) ( ON ?auto_309082 ?auto_309083 ) ( ON ?auto_309081 ?auto_309082 ) ( ON ?auto_309080 ?auto_309081 ) ( ON ?auto_309079 ?auto_309080 ) ( ON ?auto_309078 ?auto_309079 ) ( ON ?auto_309077 ?auto_309078 ) ( ON ?auto_309076 ?auto_309077 ) ( ON ?auto_309075 ?auto_309076 ) ( ON ?auto_309074 ?auto_309075 ) ( ON ?auto_309073 ?auto_309074 ) ( CLEAR ?auto_309071 ) ( ON ?auto_309072 ?auto_309073 ) ( CLEAR ?auto_309072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309071 ?auto_309072 )
      ( MAKE-14PILE ?auto_309071 ?auto_309072 ?auto_309073 ?auto_309074 ?auto_309075 ?auto_309076 ?auto_309077 ?auto_309078 ?auto_309079 ?auto_309080 ?auto_309081 ?auto_309082 ?auto_309083 ?auto_309084 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309100 - BLOCK
      ?auto_309101 - BLOCK
      ?auto_309102 - BLOCK
      ?auto_309103 - BLOCK
      ?auto_309104 - BLOCK
      ?auto_309105 - BLOCK
      ?auto_309106 - BLOCK
      ?auto_309107 - BLOCK
      ?auto_309108 - BLOCK
      ?auto_309109 - BLOCK
      ?auto_309110 - BLOCK
      ?auto_309111 - BLOCK
      ?auto_309112 - BLOCK
      ?auto_309113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_309113 ) ( ON-TABLE ?auto_309100 ) ( not ( = ?auto_309100 ?auto_309101 ) ) ( not ( = ?auto_309100 ?auto_309102 ) ) ( not ( = ?auto_309100 ?auto_309103 ) ) ( not ( = ?auto_309100 ?auto_309104 ) ) ( not ( = ?auto_309100 ?auto_309105 ) ) ( not ( = ?auto_309100 ?auto_309106 ) ) ( not ( = ?auto_309100 ?auto_309107 ) ) ( not ( = ?auto_309100 ?auto_309108 ) ) ( not ( = ?auto_309100 ?auto_309109 ) ) ( not ( = ?auto_309100 ?auto_309110 ) ) ( not ( = ?auto_309100 ?auto_309111 ) ) ( not ( = ?auto_309100 ?auto_309112 ) ) ( not ( = ?auto_309100 ?auto_309113 ) ) ( not ( = ?auto_309101 ?auto_309102 ) ) ( not ( = ?auto_309101 ?auto_309103 ) ) ( not ( = ?auto_309101 ?auto_309104 ) ) ( not ( = ?auto_309101 ?auto_309105 ) ) ( not ( = ?auto_309101 ?auto_309106 ) ) ( not ( = ?auto_309101 ?auto_309107 ) ) ( not ( = ?auto_309101 ?auto_309108 ) ) ( not ( = ?auto_309101 ?auto_309109 ) ) ( not ( = ?auto_309101 ?auto_309110 ) ) ( not ( = ?auto_309101 ?auto_309111 ) ) ( not ( = ?auto_309101 ?auto_309112 ) ) ( not ( = ?auto_309101 ?auto_309113 ) ) ( not ( = ?auto_309102 ?auto_309103 ) ) ( not ( = ?auto_309102 ?auto_309104 ) ) ( not ( = ?auto_309102 ?auto_309105 ) ) ( not ( = ?auto_309102 ?auto_309106 ) ) ( not ( = ?auto_309102 ?auto_309107 ) ) ( not ( = ?auto_309102 ?auto_309108 ) ) ( not ( = ?auto_309102 ?auto_309109 ) ) ( not ( = ?auto_309102 ?auto_309110 ) ) ( not ( = ?auto_309102 ?auto_309111 ) ) ( not ( = ?auto_309102 ?auto_309112 ) ) ( not ( = ?auto_309102 ?auto_309113 ) ) ( not ( = ?auto_309103 ?auto_309104 ) ) ( not ( = ?auto_309103 ?auto_309105 ) ) ( not ( = ?auto_309103 ?auto_309106 ) ) ( not ( = ?auto_309103 ?auto_309107 ) ) ( not ( = ?auto_309103 ?auto_309108 ) ) ( not ( = ?auto_309103 ?auto_309109 ) ) ( not ( = ?auto_309103 ?auto_309110 ) ) ( not ( = ?auto_309103 ?auto_309111 ) ) ( not ( = ?auto_309103 ?auto_309112 ) ) ( not ( = ?auto_309103 ?auto_309113 ) ) ( not ( = ?auto_309104 ?auto_309105 ) ) ( not ( = ?auto_309104 ?auto_309106 ) ) ( not ( = ?auto_309104 ?auto_309107 ) ) ( not ( = ?auto_309104 ?auto_309108 ) ) ( not ( = ?auto_309104 ?auto_309109 ) ) ( not ( = ?auto_309104 ?auto_309110 ) ) ( not ( = ?auto_309104 ?auto_309111 ) ) ( not ( = ?auto_309104 ?auto_309112 ) ) ( not ( = ?auto_309104 ?auto_309113 ) ) ( not ( = ?auto_309105 ?auto_309106 ) ) ( not ( = ?auto_309105 ?auto_309107 ) ) ( not ( = ?auto_309105 ?auto_309108 ) ) ( not ( = ?auto_309105 ?auto_309109 ) ) ( not ( = ?auto_309105 ?auto_309110 ) ) ( not ( = ?auto_309105 ?auto_309111 ) ) ( not ( = ?auto_309105 ?auto_309112 ) ) ( not ( = ?auto_309105 ?auto_309113 ) ) ( not ( = ?auto_309106 ?auto_309107 ) ) ( not ( = ?auto_309106 ?auto_309108 ) ) ( not ( = ?auto_309106 ?auto_309109 ) ) ( not ( = ?auto_309106 ?auto_309110 ) ) ( not ( = ?auto_309106 ?auto_309111 ) ) ( not ( = ?auto_309106 ?auto_309112 ) ) ( not ( = ?auto_309106 ?auto_309113 ) ) ( not ( = ?auto_309107 ?auto_309108 ) ) ( not ( = ?auto_309107 ?auto_309109 ) ) ( not ( = ?auto_309107 ?auto_309110 ) ) ( not ( = ?auto_309107 ?auto_309111 ) ) ( not ( = ?auto_309107 ?auto_309112 ) ) ( not ( = ?auto_309107 ?auto_309113 ) ) ( not ( = ?auto_309108 ?auto_309109 ) ) ( not ( = ?auto_309108 ?auto_309110 ) ) ( not ( = ?auto_309108 ?auto_309111 ) ) ( not ( = ?auto_309108 ?auto_309112 ) ) ( not ( = ?auto_309108 ?auto_309113 ) ) ( not ( = ?auto_309109 ?auto_309110 ) ) ( not ( = ?auto_309109 ?auto_309111 ) ) ( not ( = ?auto_309109 ?auto_309112 ) ) ( not ( = ?auto_309109 ?auto_309113 ) ) ( not ( = ?auto_309110 ?auto_309111 ) ) ( not ( = ?auto_309110 ?auto_309112 ) ) ( not ( = ?auto_309110 ?auto_309113 ) ) ( not ( = ?auto_309111 ?auto_309112 ) ) ( not ( = ?auto_309111 ?auto_309113 ) ) ( not ( = ?auto_309112 ?auto_309113 ) ) ( ON ?auto_309112 ?auto_309113 ) ( ON ?auto_309111 ?auto_309112 ) ( ON ?auto_309110 ?auto_309111 ) ( ON ?auto_309109 ?auto_309110 ) ( ON ?auto_309108 ?auto_309109 ) ( ON ?auto_309107 ?auto_309108 ) ( ON ?auto_309106 ?auto_309107 ) ( ON ?auto_309105 ?auto_309106 ) ( ON ?auto_309104 ?auto_309105 ) ( ON ?auto_309103 ?auto_309104 ) ( ON ?auto_309102 ?auto_309103 ) ( CLEAR ?auto_309100 ) ( ON ?auto_309101 ?auto_309102 ) ( CLEAR ?auto_309101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_309100 ?auto_309101 )
      ( MAKE-14PILE ?auto_309100 ?auto_309101 ?auto_309102 ?auto_309103 ?auto_309104 ?auto_309105 ?auto_309106 ?auto_309107 ?auto_309108 ?auto_309109 ?auto_309110 ?auto_309111 ?auto_309112 ?auto_309113 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309128 - BLOCK
      ?auto_309129 - BLOCK
      ?auto_309130 - BLOCK
      ?auto_309131 - BLOCK
      ?auto_309132 - BLOCK
      ?auto_309133 - BLOCK
      ?auto_309134 - BLOCK
      ?auto_309135 - BLOCK
      ?auto_309136 - BLOCK
      ?auto_309137 - BLOCK
      ?auto_309138 - BLOCK
      ?auto_309139 - BLOCK
      ?auto_309140 - BLOCK
      ?auto_309141 - BLOCK
    )
    :vars
    (
      ?auto_309142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309141 ?auto_309142 ) ( not ( = ?auto_309128 ?auto_309129 ) ) ( not ( = ?auto_309128 ?auto_309130 ) ) ( not ( = ?auto_309128 ?auto_309131 ) ) ( not ( = ?auto_309128 ?auto_309132 ) ) ( not ( = ?auto_309128 ?auto_309133 ) ) ( not ( = ?auto_309128 ?auto_309134 ) ) ( not ( = ?auto_309128 ?auto_309135 ) ) ( not ( = ?auto_309128 ?auto_309136 ) ) ( not ( = ?auto_309128 ?auto_309137 ) ) ( not ( = ?auto_309128 ?auto_309138 ) ) ( not ( = ?auto_309128 ?auto_309139 ) ) ( not ( = ?auto_309128 ?auto_309140 ) ) ( not ( = ?auto_309128 ?auto_309141 ) ) ( not ( = ?auto_309128 ?auto_309142 ) ) ( not ( = ?auto_309129 ?auto_309130 ) ) ( not ( = ?auto_309129 ?auto_309131 ) ) ( not ( = ?auto_309129 ?auto_309132 ) ) ( not ( = ?auto_309129 ?auto_309133 ) ) ( not ( = ?auto_309129 ?auto_309134 ) ) ( not ( = ?auto_309129 ?auto_309135 ) ) ( not ( = ?auto_309129 ?auto_309136 ) ) ( not ( = ?auto_309129 ?auto_309137 ) ) ( not ( = ?auto_309129 ?auto_309138 ) ) ( not ( = ?auto_309129 ?auto_309139 ) ) ( not ( = ?auto_309129 ?auto_309140 ) ) ( not ( = ?auto_309129 ?auto_309141 ) ) ( not ( = ?auto_309129 ?auto_309142 ) ) ( not ( = ?auto_309130 ?auto_309131 ) ) ( not ( = ?auto_309130 ?auto_309132 ) ) ( not ( = ?auto_309130 ?auto_309133 ) ) ( not ( = ?auto_309130 ?auto_309134 ) ) ( not ( = ?auto_309130 ?auto_309135 ) ) ( not ( = ?auto_309130 ?auto_309136 ) ) ( not ( = ?auto_309130 ?auto_309137 ) ) ( not ( = ?auto_309130 ?auto_309138 ) ) ( not ( = ?auto_309130 ?auto_309139 ) ) ( not ( = ?auto_309130 ?auto_309140 ) ) ( not ( = ?auto_309130 ?auto_309141 ) ) ( not ( = ?auto_309130 ?auto_309142 ) ) ( not ( = ?auto_309131 ?auto_309132 ) ) ( not ( = ?auto_309131 ?auto_309133 ) ) ( not ( = ?auto_309131 ?auto_309134 ) ) ( not ( = ?auto_309131 ?auto_309135 ) ) ( not ( = ?auto_309131 ?auto_309136 ) ) ( not ( = ?auto_309131 ?auto_309137 ) ) ( not ( = ?auto_309131 ?auto_309138 ) ) ( not ( = ?auto_309131 ?auto_309139 ) ) ( not ( = ?auto_309131 ?auto_309140 ) ) ( not ( = ?auto_309131 ?auto_309141 ) ) ( not ( = ?auto_309131 ?auto_309142 ) ) ( not ( = ?auto_309132 ?auto_309133 ) ) ( not ( = ?auto_309132 ?auto_309134 ) ) ( not ( = ?auto_309132 ?auto_309135 ) ) ( not ( = ?auto_309132 ?auto_309136 ) ) ( not ( = ?auto_309132 ?auto_309137 ) ) ( not ( = ?auto_309132 ?auto_309138 ) ) ( not ( = ?auto_309132 ?auto_309139 ) ) ( not ( = ?auto_309132 ?auto_309140 ) ) ( not ( = ?auto_309132 ?auto_309141 ) ) ( not ( = ?auto_309132 ?auto_309142 ) ) ( not ( = ?auto_309133 ?auto_309134 ) ) ( not ( = ?auto_309133 ?auto_309135 ) ) ( not ( = ?auto_309133 ?auto_309136 ) ) ( not ( = ?auto_309133 ?auto_309137 ) ) ( not ( = ?auto_309133 ?auto_309138 ) ) ( not ( = ?auto_309133 ?auto_309139 ) ) ( not ( = ?auto_309133 ?auto_309140 ) ) ( not ( = ?auto_309133 ?auto_309141 ) ) ( not ( = ?auto_309133 ?auto_309142 ) ) ( not ( = ?auto_309134 ?auto_309135 ) ) ( not ( = ?auto_309134 ?auto_309136 ) ) ( not ( = ?auto_309134 ?auto_309137 ) ) ( not ( = ?auto_309134 ?auto_309138 ) ) ( not ( = ?auto_309134 ?auto_309139 ) ) ( not ( = ?auto_309134 ?auto_309140 ) ) ( not ( = ?auto_309134 ?auto_309141 ) ) ( not ( = ?auto_309134 ?auto_309142 ) ) ( not ( = ?auto_309135 ?auto_309136 ) ) ( not ( = ?auto_309135 ?auto_309137 ) ) ( not ( = ?auto_309135 ?auto_309138 ) ) ( not ( = ?auto_309135 ?auto_309139 ) ) ( not ( = ?auto_309135 ?auto_309140 ) ) ( not ( = ?auto_309135 ?auto_309141 ) ) ( not ( = ?auto_309135 ?auto_309142 ) ) ( not ( = ?auto_309136 ?auto_309137 ) ) ( not ( = ?auto_309136 ?auto_309138 ) ) ( not ( = ?auto_309136 ?auto_309139 ) ) ( not ( = ?auto_309136 ?auto_309140 ) ) ( not ( = ?auto_309136 ?auto_309141 ) ) ( not ( = ?auto_309136 ?auto_309142 ) ) ( not ( = ?auto_309137 ?auto_309138 ) ) ( not ( = ?auto_309137 ?auto_309139 ) ) ( not ( = ?auto_309137 ?auto_309140 ) ) ( not ( = ?auto_309137 ?auto_309141 ) ) ( not ( = ?auto_309137 ?auto_309142 ) ) ( not ( = ?auto_309138 ?auto_309139 ) ) ( not ( = ?auto_309138 ?auto_309140 ) ) ( not ( = ?auto_309138 ?auto_309141 ) ) ( not ( = ?auto_309138 ?auto_309142 ) ) ( not ( = ?auto_309139 ?auto_309140 ) ) ( not ( = ?auto_309139 ?auto_309141 ) ) ( not ( = ?auto_309139 ?auto_309142 ) ) ( not ( = ?auto_309140 ?auto_309141 ) ) ( not ( = ?auto_309140 ?auto_309142 ) ) ( not ( = ?auto_309141 ?auto_309142 ) ) ( ON ?auto_309140 ?auto_309141 ) ( ON ?auto_309139 ?auto_309140 ) ( ON ?auto_309138 ?auto_309139 ) ( ON ?auto_309137 ?auto_309138 ) ( ON ?auto_309136 ?auto_309137 ) ( ON ?auto_309135 ?auto_309136 ) ( ON ?auto_309134 ?auto_309135 ) ( ON ?auto_309133 ?auto_309134 ) ( ON ?auto_309132 ?auto_309133 ) ( ON ?auto_309131 ?auto_309132 ) ( ON ?auto_309130 ?auto_309131 ) ( ON ?auto_309129 ?auto_309130 ) ( ON ?auto_309128 ?auto_309129 ) ( CLEAR ?auto_309128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309128 )
      ( MAKE-14PILE ?auto_309128 ?auto_309129 ?auto_309130 ?auto_309131 ?auto_309132 ?auto_309133 ?auto_309134 ?auto_309135 ?auto_309136 ?auto_309137 ?auto_309138 ?auto_309139 ?auto_309140 ?auto_309141 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309157 - BLOCK
      ?auto_309158 - BLOCK
      ?auto_309159 - BLOCK
      ?auto_309160 - BLOCK
      ?auto_309161 - BLOCK
      ?auto_309162 - BLOCK
      ?auto_309163 - BLOCK
      ?auto_309164 - BLOCK
      ?auto_309165 - BLOCK
      ?auto_309166 - BLOCK
      ?auto_309167 - BLOCK
      ?auto_309168 - BLOCK
      ?auto_309169 - BLOCK
      ?auto_309170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_309170 ) ( not ( = ?auto_309157 ?auto_309158 ) ) ( not ( = ?auto_309157 ?auto_309159 ) ) ( not ( = ?auto_309157 ?auto_309160 ) ) ( not ( = ?auto_309157 ?auto_309161 ) ) ( not ( = ?auto_309157 ?auto_309162 ) ) ( not ( = ?auto_309157 ?auto_309163 ) ) ( not ( = ?auto_309157 ?auto_309164 ) ) ( not ( = ?auto_309157 ?auto_309165 ) ) ( not ( = ?auto_309157 ?auto_309166 ) ) ( not ( = ?auto_309157 ?auto_309167 ) ) ( not ( = ?auto_309157 ?auto_309168 ) ) ( not ( = ?auto_309157 ?auto_309169 ) ) ( not ( = ?auto_309157 ?auto_309170 ) ) ( not ( = ?auto_309158 ?auto_309159 ) ) ( not ( = ?auto_309158 ?auto_309160 ) ) ( not ( = ?auto_309158 ?auto_309161 ) ) ( not ( = ?auto_309158 ?auto_309162 ) ) ( not ( = ?auto_309158 ?auto_309163 ) ) ( not ( = ?auto_309158 ?auto_309164 ) ) ( not ( = ?auto_309158 ?auto_309165 ) ) ( not ( = ?auto_309158 ?auto_309166 ) ) ( not ( = ?auto_309158 ?auto_309167 ) ) ( not ( = ?auto_309158 ?auto_309168 ) ) ( not ( = ?auto_309158 ?auto_309169 ) ) ( not ( = ?auto_309158 ?auto_309170 ) ) ( not ( = ?auto_309159 ?auto_309160 ) ) ( not ( = ?auto_309159 ?auto_309161 ) ) ( not ( = ?auto_309159 ?auto_309162 ) ) ( not ( = ?auto_309159 ?auto_309163 ) ) ( not ( = ?auto_309159 ?auto_309164 ) ) ( not ( = ?auto_309159 ?auto_309165 ) ) ( not ( = ?auto_309159 ?auto_309166 ) ) ( not ( = ?auto_309159 ?auto_309167 ) ) ( not ( = ?auto_309159 ?auto_309168 ) ) ( not ( = ?auto_309159 ?auto_309169 ) ) ( not ( = ?auto_309159 ?auto_309170 ) ) ( not ( = ?auto_309160 ?auto_309161 ) ) ( not ( = ?auto_309160 ?auto_309162 ) ) ( not ( = ?auto_309160 ?auto_309163 ) ) ( not ( = ?auto_309160 ?auto_309164 ) ) ( not ( = ?auto_309160 ?auto_309165 ) ) ( not ( = ?auto_309160 ?auto_309166 ) ) ( not ( = ?auto_309160 ?auto_309167 ) ) ( not ( = ?auto_309160 ?auto_309168 ) ) ( not ( = ?auto_309160 ?auto_309169 ) ) ( not ( = ?auto_309160 ?auto_309170 ) ) ( not ( = ?auto_309161 ?auto_309162 ) ) ( not ( = ?auto_309161 ?auto_309163 ) ) ( not ( = ?auto_309161 ?auto_309164 ) ) ( not ( = ?auto_309161 ?auto_309165 ) ) ( not ( = ?auto_309161 ?auto_309166 ) ) ( not ( = ?auto_309161 ?auto_309167 ) ) ( not ( = ?auto_309161 ?auto_309168 ) ) ( not ( = ?auto_309161 ?auto_309169 ) ) ( not ( = ?auto_309161 ?auto_309170 ) ) ( not ( = ?auto_309162 ?auto_309163 ) ) ( not ( = ?auto_309162 ?auto_309164 ) ) ( not ( = ?auto_309162 ?auto_309165 ) ) ( not ( = ?auto_309162 ?auto_309166 ) ) ( not ( = ?auto_309162 ?auto_309167 ) ) ( not ( = ?auto_309162 ?auto_309168 ) ) ( not ( = ?auto_309162 ?auto_309169 ) ) ( not ( = ?auto_309162 ?auto_309170 ) ) ( not ( = ?auto_309163 ?auto_309164 ) ) ( not ( = ?auto_309163 ?auto_309165 ) ) ( not ( = ?auto_309163 ?auto_309166 ) ) ( not ( = ?auto_309163 ?auto_309167 ) ) ( not ( = ?auto_309163 ?auto_309168 ) ) ( not ( = ?auto_309163 ?auto_309169 ) ) ( not ( = ?auto_309163 ?auto_309170 ) ) ( not ( = ?auto_309164 ?auto_309165 ) ) ( not ( = ?auto_309164 ?auto_309166 ) ) ( not ( = ?auto_309164 ?auto_309167 ) ) ( not ( = ?auto_309164 ?auto_309168 ) ) ( not ( = ?auto_309164 ?auto_309169 ) ) ( not ( = ?auto_309164 ?auto_309170 ) ) ( not ( = ?auto_309165 ?auto_309166 ) ) ( not ( = ?auto_309165 ?auto_309167 ) ) ( not ( = ?auto_309165 ?auto_309168 ) ) ( not ( = ?auto_309165 ?auto_309169 ) ) ( not ( = ?auto_309165 ?auto_309170 ) ) ( not ( = ?auto_309166 ?auto_309167 ) ) ( not ( = ?auto_309166 ?auto_309168 ) ) ( not ( = ?auto_309166 ?auto_309169 ) ) ( not ( = ?auto_309166 ?auto_309170 ) ) ( not ( = ?auto_309167 ?auto_309168 ) ) ( not ( = ?auto_309167 ?auto_309169 ) ) ( not ( = ?auto_309167 ?auto_309170 ) ) ( not ( = ?auto_309168 ?auto_309169 ) ) ( not ( = ?auto_309168 ?auto_309170 ) ) ( not ( = ?auto_309169 ?auto_309170 ) ) ( ON ?auto_309169 ?auto_309170 ) ( ON ?auto_309168 ?auto_309169 ) ( ON ?auto_309167 ?auto_309168 ) ( ON ?auto_309166 ?auto_309167 ) ( ON ?auto_309165 ?auto_309166 ) ( ON ?auto_309164 ?auto_309165 ) ( ON ?auto_309163 ?auto_309164 ) ( ON ?auto_309162 ?auto_309163 ) ( ON ?auto_309161 ?auto_309162 ) ( ON ?auto_309160 ?auto_309161 ) ( ON ?auto_309159 ?auto_309160 ) ( ON ?auto_309158 ?auto_309159 ) ( ON ?auto_309157 ?auto_309158 ) ( CLEAR ?auto_309157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309157 )
      ( MAKE-14PILE ?auto_309157 ?auto_309158 ?auto_309159 ?auto_309160 ?auto_309161 ?auto_309162 ?auto_309163 ?auto_309164 ?auto_309165 ?auto_309166 ?auto_309167 ?auto_309168 ?auto_309169 ?auto_309170 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_309185 - BLOCK
      ?auto_309186 - BLOCK
      ?auto_309187 - BLOCK
      ?auto_309188 - BLOCK
      ?auto_309189 - BLOCK
      ?auto_309190 - BLOCK
      ?auto_309191 - BLOCK
      ?auto_309192 - BLOCK
      ?auto_309193 - BLOCK
      ?auto_309194 - BLOCK
      ?auto_309195 - BLOCK
      ?auto_309196 - BLOCK
      ?auto_309197 - BLOCK
      ?auto_309198 - BLOCK
    )
    :vars
    (
      ?auto_309199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_309185 ?auto_309186 ) ) ( not ( = ?auto_309185 ?auto_309187 ) ) ( not ( = ?auto_309185 ?auto_309188 ) ) ( not ( = ?auto_309185 ?auto_309189 ) ) ( not ( = ?auto_309185 ?auto_309190 ) ) ( not ( = ?auto_309185 ?auto_309191 ) ) ( not ( = ?auto_309185 ?auto_309192 ) ) ( not ( = ?auto_309185 ?auto_309193 ) ) ( not ( = ?auto_309185 ?auto_309194 ) ) ( not ( = ?auto_309185 ?auto_309195 ) ) ( not ( = ?auto_309185 ?auto_309196 ) ) ( not ( = ?auto_309185 ?auto_309197 ) ) ( not ( = ?auto_309185 ?auto_309198 ) ) ( not ( = ?auto_309186 ?auto_309187 ) ) ( not ( = ?auto_309186 ?auto_309188 ) ) ( not ( = ?auto_309186 ?auto_309189 ) ) ( not ( = ?auto_309186 ?auto_309190 ) ) ( not ( = ?auto_309186 ?auto_309191 ) ) ( not ( = ?auto_309186 ?auto_309192 ) ) ( not ( = ?auto_309186 ?auto_309193 ) ) ( not ( = ?auto_309186 ?auto_309194 ) ) ( not ( = ?auto_309186 ?auto_309195 ) ) ( not ( = ?auto_309186 ?auto_309196 ) ) ( not ( = ?auto_309186 ?auto_309197 ) ) ( not ( = ?auto_309186 ?auto_309198 ) ) ( not ( = ?auto_309187 ?auto_309188 ) ) ( not ( = ?auto_309187 ?auto_309189 ) ) ( not ( = ?auto_309187 ?auto_309190 ) ) ( not ( = ?auto_309187 ?auto_309191 ) ) ( not ( = ?auto_309187 ?auto_309192 ) ) ( not ( = ?auto_309187 ?auto_309193 ) ) ( not ( = ?auto_309187 ?auto_309194 ) ) ( not ( = ?auto_309187 ?auto_309195 ) ) ( not ( = ?auto_309187 ?auto_309196 ) ) ( not ( = ?auto_309187 ?auto_309197 ) ) ( not ( = ?auto_309187 ?auto_309198 ) ) ( not ( = ?auto_309188 ?auto_309189 ) ) ( not ( = ?auto_309188 ?auto_309190 ) ) ( not ( = ?auto_309188 ?auto_309191 ) ) ( not ( = ?auto_309188 ?auto_309192 ) ) ( not ( = ?auto_309188 ?auto_309193 ) ) ( not ( = ?auto_309188 ?auto_309194 ) ) ( not ( = ?auto_309188 ?auto_309195 ) ) ( not ( = ?auto_309188 ?auto_309196 ) ) ( not ( = ?auto_309188 ?auto_309197 ) ) ( not ( = ?auto_309188 ?auto_309198 ) ) ( not ( = ?auto_309189 ?auto_309190 ) ) ( not ( = ?auto_309189 ?auto_309191 ) ) ( not ( = ?auto_309189 ?auto_309192 ) ) ( not ( = ?auto_309189 ?auto_309193 ) ) ( not ( = ?auto_309189 ?auto_309194 ) ) ( not ( = ?auto_309189 ?auto_309195 ) ) ( not ( = ?auto_309189 ?auto_309196 ) ) ( not ( = ?auto_309189 ?auto_309197 ) ) ( not ( = ?auto_309189 ?auto_309198 ) ) ( not ( = ?auto_309190 ?auto_309191 ) ) ( not ( = ?auto_309190 ?auto_309192 ) ) ( not ( = ?auto_309190 ?auto_309193 ) ) ( not ( = ?auto_309190 ?auto_309194 ) ) ( not ( = ?auto_309190 ?auto_309195 ) ) ( not ( = ?auto_309190 ?auto_309196 ) ) ( not ( = ?auto_309190 ?auto_309197 ) ) ( not ( = ?auto_309190 ?auto_309198 ) ) ( not ( = ?auto_309191 ?auto_309192 ) ) ( not ( = ?auto_309191 ?auto_309193 ) ) ( not ( = ?auto_309191 ?auto_309194 ) ) ( not ( = ?auto_309191 ?auto_309195 ) ) ( not ( = ?auto_309191 ?auto_309196 ) ) ( not ( = ?auto_309191 ?auto_309197 ) ) ( not ( = ?auto_309191 ?auto_309198 ) ) ( not ( = ?auto_309192 ?auto_309193 ) ) ( not ( = ?auto_309192 ?auto_309194 ) ) ( not ( = ?auto_309192 ?auto_309195 ) ) ( not ( = ?auto_309192 ?auto_309196 ) ) ( not ( = ?auto_309192 ?auto_309197 ) ) ( not ( = ?auto_309192 ?auto_309198 ) ) ( not ( = ?auto_309193 ?auto_309194 ) ) ( not ( = ?auto_309193 ?auto_309195 ) ) ( not ( = ?auto_309193 ?auto_309196 ) ) ( not ( = ?auto_309193 ?auto_309197 ) ) ( not ( = ?auto_309193 ?auto_309198 ) ) ( not ( = ?auto_309194 ?auto_309195 ) ) ( not ( = ?auto_309194 ?auto_309196 ) ) ( not ( = ?auto_309194 ?auto_309197 ) ) ( not ( = ?auto_309194 ?auto_309198 ) ) ( not ( = ?auto_309195 ?auto_309196 ) ) ( not ( = ?auto_309195 ?auto_309197 ) ) ( not ( = ?auto_309195 ?auto_309198 ) ) ( not ( = ?auto_309196 ?auto_309197 ) ) ( not ( = ?auto_309196 ?auto_309198 ) ) ( not ( = ?auto_309197 ?auto_309198 ) ) ( ON ?auto_309185 ?auto_309199 ) ( not ( = ?auto_309198 ?auto_309199 ) ) ( not ( = ?auto_309197 ?auto_309199 ) ) ( not ( = ?auto_309196 ?auto_309199 ) ) ( not ( = ?auto_309195 ?auto_309199 ) ) ( not ( = ?auto_309194 ?auto_309199 ) ) ( not ( = ?auto_309193 ?auto_309199 ) ) ( not ( = ?auto_309192 ?auto_309199 ) ) ( not ( = ?auto_309191 ?auto_309199 ) ) ( not ( = ?auto_309190 ?auto_309199 ) ) ( not ( = ?auto_309189 ?auto_309199 ) ) ( not ( = ?auto_309188 ?auto_309199 ) ) ( not ( = ?auto_309187 ?auto_309199 ) ) ( not ( = ?auto_309186 ?auto_309199 ) ) ( not ( = ?auto_309185 ?auto_309199 ) ) ( ON ?auto_309186 ?auto_309185 ) ( ON ?auto_309187 ?auto_309186 ) ( ON ?auto_309188 ?auto_309187 ) ( ON ?auto_309189 ?auto_309188 ) ( ON ?auto_309190 ?auto_309189 ) ( ON ?auto_309191 ?auto_309190 ) ( ON ?auto_309192 ?auto_309191 ) ( ON ?auto_309193 ?auto_309192 ) ( ON ?auto_309194 ?auto_309193 ) ( ON ?auto_309195 ?auto_309194 ) ( ON ?auto_309196 ?auto_309195 ) ( ON ?auto_309197 ?auto_309196 ) ( ON ?auto_309198 ?auto_309197 ) ( CLEAR ?auto_309198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_309198 ?auto_309197 ?auto_309196 ?auto_309195 ?auto_309194 ?auto_309193 ?auto_309192 ?auto_309191 ?auto_309190 ?auto_309189 ?auto_309188 ?auto_309187 ?auto_309186 ?auto_309185 )
      ( MAKE-14PILE ?auto_309185 ?auto_309186 ?auto_309187 ?auto_309188 ?auto_309189 ?auto_309190 ?auto_309191 ?auto_309192 ?auto_309193 ?auto_309194 ?auto_309195 ?auto_309196 ?auto_309197 ?auto_309198 ) )
  )

)

