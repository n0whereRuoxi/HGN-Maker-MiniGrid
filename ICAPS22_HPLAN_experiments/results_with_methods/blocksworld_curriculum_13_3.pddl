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
      ?auto_215897 - BLOCK
    )
    :vars
    (
      ?auto_215898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215897 ?auto_215898 ) ( CLEAR ?auto_215897 ) ( HAND-EMPTY ) ( not ( = ?auto_215897 ?auto_215898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215897 ?auto_215898 )
      ( !PUTDOWN ?auto_215897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_215900 - BLOCK
    )
    :vars
    (
      ?auto_215901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215900 ?auto_215901 ) ( CLEAR ?auto_215900 ) ( HAND-EMPTY ) ( not ( = ?auto_215900 ?auto_215901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215900 ?auto_215901 )
      ( !PUTDOWN ?auto_215900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_215904 - BLOCK
      ?auto_215905 - BLOCK
    )
    :vars
    (
      ?auto_215906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215904 ) ( ON ?auto_215905 ?auto_215906 ) ( CLEAR ?auto_215905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215904 ) ( not ( = ?auto_215904 ?auto_215905 ) ) ( not ( = ?auto_215904 ?auto_215906 ) ) ( not ( = ?auto_215905 ?auto_215906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215905 ?auto_215906 )
      ( !STACK ?auto_215905 ?auto_215904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_215909 - BLOCK
      ?auto_215910 - BLOCK
    )
    :vars
    (
      ?auto_215911 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215909 ) ( ON ?auto_215910 ?auto_215911 ) ( CLEAR ?auto_215910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215909 ) ( not ( = ?auto_215909 ?auto_215910 ) ) ( not ( = ?auto_215909 ?auto_215911 ) ) ( not ( = ?auto_215910 ?auto_215911 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215910 ?auto_215911 )
      ( !STACK ?auto_215910 ?auto_215909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_215914 - BLOCK
      ?auto_215915 - BLOCK
    )
    :vars
    (
      ?auto_215916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215915 ?auto_215916 ) ( not ( = ?auto_215914 ?auto_215915 ) ) ( not ( = ?auto_215914 ?auto_215916 ) ) ( not ( = ?auto_215915 ?auto_215916 ) ) ( ON ?auto_215914 ?auto_215915 ) ( CLEAR ?auto_215914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215914 )
      ( MAKE-2PILE ?auto_215914 ?auto_215915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_215919 - BLOCK
      ?auto_215920 - BLOCK
    )
    :vars
    (
      ?auto_215921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215920 ?auto_215921 ) ( not ( = ?auto_215919 ?auto_215920 ) ) ( not ( = ?auto_215919 ?auto_215921 ) ) ( not ( = ?auto_215920 ?auto_215921 ) ) ( ON ?auto_215919 ?auto_215920 ) ( CLEAR ?auto_215919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215919 )
      ( MAKE-2PILE ?auto_215919 ?auto_215920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215925 - BLOCK
      ?auto_215926 - BLOCK
      ?auto_215927 - BLOCK
    )
    :vars
    (
      ?auto_215928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215926 ) ( ON ?auto_215927 ?auto_215928 ) ( CLEAR ?auto_215927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215925 ) ( ON ?auto_215926 ?auto_215925 ) ( not ( = ?auto_215925 ?auto_215926 ) ) ( not ( = ?auto_215925 ?auto_215927 ) ) ( not ( = ?auto_215925 ?auto_215928 ) ) ( not ( = ?auto_215926 ?auto_215927 ) ) ( not ( = ?auto_215926 ?auto_215928 ) ) ( not ( = ?auto_215927 ?auto_215928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215927 ?auto_215928 )
      ( !STACK ?auto_215927 ?auto_215926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215932 - BLOCK
      ?auto_215933 - BLOCK
      ?auto_215934 - BLOCK
    )
    :vars
    (
      ?auto_215935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215933 ) ( ON ?auto_215934 ?auto_215935 ) ( CLEAR ?auto_215934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215932 ) ( ON ?auto_215933 ?auto_215932 ) ( not ( = ?auto_215932 ?auto_215933 ) ) ( not ( = ?auto_215932 ?auto_215934 ) ) ( not ( = ?auto_215932 ?auto_215935 ) ) ( not ( = ?auto_215933 ?auto_215934 ) ) ( not ( = ?auto_215933 ?auto_215935 ) ) ( not ( = ?auto_215934 ?auto_215935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215934 ?auto_215935 )
      ( !STACK ?auto_215934 ?auto_215933 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215939 - BLOCK
      ?auto_215940 - BLOCK
      ?auto_215941 - BLOCK
    )
    :vars
    (
      ?auto_215942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215941 ?auto_215942 ) ( ON-TABLE ?auto_215939 ) ( not ( = ?auto_215939 ?auto_215940 ) ) ( not ( = ?auto_215939 ?auto_215941 ) ) ( not ( = ?auto_215939 ?auto_215942 ) ) ( not ( = ?auto_215940 ?auto_215941 ) ) ( not ( = ?auto_215940 ?auto_215942 ) ) ( not ( = ?auto_215941 ?auto_215942 ) ) ( CLEAR ?auto_215939 ) ( ON ?auto_215940 ?auto_215941 ) ( CLEAR ?auto_215940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215939 ?auto_215940 )
      ( MAKE-3PILE ?auto_215939 ?auto_215940 ?auto_215941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215946 - BLOCK
      ?auto_215947 - BLOCK
      ?auto_215948 - BLOCK
    )
    :vars
    (
      ?auto_215949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215948 ?auto_215949 ) ( ON-TABLE ?auto_215946 ) ( not ( = ?auto_215946 ?auto_215947 ) ) ( not ( = ?auto_215946 ?auto_215948 ) ) ( not ( = ?auto_215946 ?auto_215949 ) ) ( not ( = ?auto_215947 ?auto_215948 ) ) ( not ( = ?auto_215947 ?auto_215949 ) ) ( not ( = ?auto_215948 ?auto_215949 ) ) ( CLEAR ?auto_215946 ) ( ON ?auto_215947 ?auto_215948 ) ( CLEAR ?auto_215947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_215946 ?auto_215947 )
      ( MAKE-3PILE ?auto_215946 ?auto_215947 ?auto_215948 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215953 - BLOCK
      ?auto_215954 - BLOCK
      ?auto_215955 - BLOCK
    )
    :vars
    (
      ?auto_215956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215955 ?auto_215956 ) ( not ( = ?auto_215953 ?auto_215954 ) ) ( not ( = ?auto_215953 ?auto_215955 ) ) ( not ( = ?auto_215953 ?auto_215956 ) ) ( not ( = ?auto_215954 ?auto_215955 ) ) ( not ( = ?auto_215954 ?auto_215956 ) ) ( not ( = ?auto_215955 ?auto_215956 ) ) ( ON ?auto_215954 ?auto_215955 ) ( ON ?auto_215953 ?auto_215954 ) ( CLEAR ?auto_215953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215953 )
      ( MAKE-3PILE ?auto_215953 ?auto_215954 ?auto_215955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_215960 - BLOCK
      ?auto_215961 - BLOCK
      ?auto_215962 - BLOCK
    )
    :vars
    (
      ?auto_215963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215962 ?auto_215963 ) ( not ( = ?auto_215960 ?auto_215961 ) ) ( not ( = ?auto_215960 ?auto_215962 ) ) ( not ( = ?auto_215960 ?auto_215963 ) ) ( not ( = ?auto_215961 ?auto_215962 ) ) ( not ( = ?auto_215961 ?auto_215963 ) ) ( not ( = ?auto_215962 ?auto_215963 ) ) ( ON ?auto_215961 ?auto_215962 ) ( ON ?auto_215960 ?auto_215961 ) ( CLEAR ?auto_215960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_215960 )
      ( MAKE-3PILE ?auto_215960 ?auto_215961 ?auto_215962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215968 - BLOCK
      ?auto_215969 - BLOCK
      ?auto_215970 - BLOCK
      ?auto_215971 - BLOCK
    )
    :vars
    (
      ?auto_215972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215970 ) ( ON ?auto_215971 ?auto_215972 ) ( CLEAR ?auto_215971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215968 ) ( ON ?auto_215969 ?auto_215968 ) ( ON ?auto_215970 ?auto_215969 ) ( not ( = ?auto_215968 ?auto_215969 ) ) ( not ( = ?auto_215968 ?auto_215970 ) ) ( not ( = ?auto_215968 ?auto_215971 ) ) ( not ( = ?auto_215968 ?auto_215972 ) ) ( not ( = ?auto_215969 ?auto_215970 ) ) ( not ( = ?auto_215969 ?auto_215971 ) ) ( not ( = ?auto_215969 ?auto_215972 ) ) ( not ( = ?auto_215970 ?auto_215971 ) ) ( not ( = ?auto_215970 ?auto_215972 ) ) ( not ( = ?auto_215971 ?auto_215972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215971 ?auto_215972 )
      ( !STACK ?auto_215971 ?auto_215970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215977 - BLOCK
      ?auto_215978 - BLOCK
      ?auto_215979 - BLOCK
      ?auto_215980 - BLOCK
    )
    :vars
    (
      ?auto_215981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_215979 ) ( ON ?auto_215980 ?auto_215981 ) ( CLEAR ?auto_215980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_215977 ) ( ON ?auto_215978 ?auto_215977 ) ( ON ?auto_215979 ?auto_215978 ) ( not ( = ?auto_215977 ?auto_215978 ) ) ( not ( = ?auto_215977 ?auto_215979 ) ) ( not ( = ?auto_215977 ?auto_215980 ) ) ( not ( = ?auto_215977 ?auto_215981 ) ) ( not ( = ?auto_215978 ?auto_215979 ) ) ( not ( = ?auto_215978 ?auto_215980 ) ) ( not ( = ?auto_215978 ?auto_215981 ) ) ( not ( = ?auto_215979 ?auto_215980 ) ) ( not ( = ?auto_215979 ?auto_215981 ) ) ( not ( = ?auto_215980 ?auto_215981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_215980 ?auto_215981 )
      ( !STACK ?auto_215980 ?auto_215979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215986 - BLOCK
      ?auto_215987 - BLOCK
      ?auto_215988 - BLOCK
      ?auto_215989 - BLOCK
    )
    :vars
    (
      ?auto_215990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215989 ?auto_215990 ) ( ON-TABLE ?auto_215986 ) ( ON ?auto_215987 ?auto_215986 ) ( not ( = ?auto_215986 ?auto_215987 ) ) ( not ( = ?auto_215986 ?auto_215988 ) ) ( not ( = ?auto_215986 ?auto_215989 ) ) ( not ( = ?auto_215986 ?auto_215990 ) ) ( not ( = ?auto_215987 ?auto_215988 ) ) ( not ( = ?auto_215987 ?auto_215989 ) ) ( not ( = ?auto_215987 ?auto_215990 ) ) ( not ( = ?auto_215988 ?auto_215989 ) ) ( not ( = ?auto_215988 ?auto_215990 ) ) ( not ( = ?auto_215989 ?auto_215990 ) ) ( CLEAR ?auto_215987 ) ( ON ?auto_215988 ?auto_215989 ) ( CLEAR ?auto_215988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215986 ?auto_215987 ?auto_215988 )
      ( MAKE-4PILE ?auto_215986 ?auto_215987 ?auto_215988 ?auto_215989 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_215995 - BLOCK
      ?auto_215996 - BLOCK
      ?auto_215997 - BLOCK
      ?auto_215998 - BLOCK
    )
    :vars
    (
      ?auto_215999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_215998 ?auto_215999 ) ( ON-TABLE ?auto_215995 ) ( ON ?auto_215996 ?auto_215995 ) ( not ( = ?auto_215995 ?auto_215996 ) ) ( not ( = ?auto_215995 ?auto_215997 ) ) ( not ( = ?auto_215995 ?auto_215998 ) ) ( not ( = ?auto_215995 ?auto_215999 ) ) ( not ( = ?auto_215996 ?auto_215997 ) ) ( not ( = ?auto_215996 ?auto_215998 ) ) ( not ( = ?auto_215996 ?auto_215999 ) ) ( not ( = ?auto_215997 ?auto_215998 ) ) ( not ( = ?auto_215997 ?auto_215999 ) ) ( not ( = ?auto_215998 ?auto_215999 ) ) ( CLEAR ?auto_215996 ) ( ON ?auto_215997 ?auto_215998 ) ( CLEAR ?auto_215997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_215995 ?auto_215996 ?auto_215997 )
      ( MAKE-4PILE ?auto_215995 ?auto_215996 ?auto_215997 ?auto_215998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_216004 - BLOCK
      ?auto_216005 - BLOCK
      ?auto_216006 - BLOCK
      ?auto_216007 - BLOCK
    )
    :vars
    (
      ?auto_216008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216007 ?auto_216008 ) ( ON-TABLE ?auto_216004 ) ( not ( = ?auto_216004 ?auto_216005 ) ) ( not ( = ?auto_216004 ?auto_216006 ) ) ( not ( = ?auto_216004 ?auto_216007 ) ) ( not ( = ?auto_216004 ?auto_216008 ) ) ( not ( = ?auto_216005 ?auto_216006 ) ) ( not ( = ?auto_216005 ?auto_216007 ) ) ( not ( = ?auto_216005 ?auto_216008 ) ) ( not ( = ?auto_216006 ?auto_216007 ) ) ( not ( = ?auto_216006 ?auto_216008 ) ) ( not ( = ?auto_216007 ?auto_216008 ) ) ( ON ?auto_216006 ?auto_216007 ) ( CLEAR ?auto_216004 ) ( ON ?auto_216005 ?auto_216006 ) ( CLEAR ?auto_216005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216004 ?auto_216005 )
      ( MAKE-4PILE ?auto_216004 ?auto_216005 ?auto_216006 ?auto_216007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_216013 - BLOCK
      ?auto_216014 - BLOCK
      ?auto_216015 - BLOCK
      ?auto_216016 - BLOCK
    )
    :vars
    (
      ?auto_216017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216016 ?auto_216017 ) ( ON-TABLE ?auto_216013 ) ( not ( = ?auto_216013 ?auto_216014 ) ) ( not ( = ?auto_216013 ?auto_216015 ) ) ( not ( = ?auto_216013 ?auto_216016 ) ) ( not ( = ?auto_216013 ?auto_216017 ) ) ( not ( = ?auto_216014 ?auto_216015 ) ) ( not ( = ?auto_216014 ?auto_216016 ) ) ( not ( = ?auto_216014 ?auto_216017 ) ) ( not ( = ?auto_216015 ?auto_216016 ) ) ( not ( = ?auto_216015 ?auto_216017 ) ) ( not ( = ?auto_216016 ?auto_216017 ) ) ( ON ?auto_216015 ?auto_216016 ) ( CLEAR ?auto_216013 ) ( ON ?auto_216014 ?auto_216015 ) ( CLEAR ?auto_216014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216013 ?auto_216014 )
      ( MAKE-4PILE ?auto_216013 ?auto_216014 ?auto_216015 ?auto_216016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_216022 - BLOCK
      ?auto_216023 - BLOCK
      ?auto_216024 - BLOCK
      ?auto_216025 - BLOCK
    )
    :vars
    (
      ?auto_216026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216025 ?auto_216026 ) ( not ( = ?auto_216022 ?auto_216023 ) ) ( not ( = ?auto_216022 ?auto_216024 ) ) ( not ( = ?auto_216022 ?auto_216025 ) ) ( not ( = ?auto_216022 ?auto_216026 ) ) ( not ( = ?auto_216023 ?auto_216024 ) ) ( not ( = ?auto_216023 ?auto_216025 ) ) ( not ( = ?auto_216023 ?auto_216026 ) ) ( not ( = ?auto_216024 ?auto_216025 ) ) ( not ( = ?auto_216024 ?auto_216026 ) ) ( not ( = ?auto_216025 ?auto_216026 ) ) ( ON ?auto_216024 ?auto_216025 ) ( ON ?auto_216023 ?auto_216024 ) ( ON ?auto_216022 ?auto_216023 ) ( CLEAR ?auto_216022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216022 )
      ( MAKE-4PILE ?auto_216022 ?auto_216023 ?auto_216024 ?auto_216025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_216031 - BLOCK
      ?auto_216032 - BLOCK
      ?auto_216033 - BLOCK
      ?auto_216034 - BLOCK
    )
    :vars
    (
      ?auto_216035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216034 ?auto_216035 ) ( not ( = ?auto_216031 ?auto_216032 ) ) ( not ( = ?auto_216031 ?auto_216033 ) ) ( not ( = ?auto_216031 ?auto_216034 ) ) ( not ( = ?auto_216031 ?auto_216035 ) ) ( not ( = ?auto_216032 ?auto_216033 ) ) ( not ( = ?auto_216032 ?auto_216034 ) ) ( not ( = ?auto_216032 ?auto_216035 ) ) ( not ( = ?auto_216033 ?auto_216034 ) ) ( not ( = ?auto_216033 ?auto_216035 ) ) ( not ( = ?auto_216034 ?auto_216035 ) ) ( ON ?auto_216033 ?auto_216034 ) ( ON ?auto_216032 ?auto_216033 ) ( ON ?auto_216031 ?auto_216032 ) ( CLEAR ?auto_216031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216031 )
      ( MAKE-4PILE ?auto_216031 ?auto_216032 ?auto_216033 ?auto_216034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216041 - BLOCK
      ?auto_216042 - BLOCK
      ?auto_216043 - BLOCK
      ?auto_216044 - BLOCK
      ?auto_216045 - BLOCK
    )
    :vars
    (
      ?auto_216046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216044 ) ( ON ?auto_216045 ?auto_216046 ) ( CLEAR ?auto_216045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216041 ) ( ON ?auto_216042 ?auto_216041 ) ( ON ?auto_216043 ?auto_216042 ) ( ON ?auto_216044 ?auto_216043 ) ( not ( = ?auto_216041 ?auto_216042 ) ) ( not ( = ?auto_216041 ?auto_216043 ) ) ( not ( = ?auto_216041 ?auto_216044 ) ) ( not ( = ?auto_216041 ?auto_216045 ) ) ( not ( = ?auto_216041 ?auto_216046 ) ) ( not ( = ?auto_216042 ?auto_216043 ) ) ( not ( = ?auto_216042 ?auto_216044 ) ) ( not ( = ?auto_216042 ?auto_216045 ) ) ( not ( = ?auto_216042 ?auto_216046 ) ) ( not ( = ?auto_216043 ?auto_216044 ) ) ( not ( = ?auto_216043 ?auto_216045 ) ) ( not ( = ?auto_216043 ?auto_216046 ) ) ( not ( = ?auto_216044 ?auto_216045 ) ) ( not ( = ?auto_216044 ?auto_216046 ) ) ( not ( = ?auto_216045 ?auto_216046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216045 ?auto_216046 )
      ( !STACK ?auto_216045 ?auto_216044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216052 - BLOCK
      ?auto_216053 - BLOCK
      ?auto_216054 - BLOCK
      ?auto_216055 - BLOCK
      ?auto_216056 - BLOCK
    )
    :vars
    (
      ?auto_216057 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216055 ) ( ON ?auto_216056 ?auto_216057 ) ( CLEAR ?auto_216056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216052 ) ( ON ?auto_216053 ?auto_216052 ) ( ON ?auto_216054 ?auto_216053 ) ( ON ?auto_216055 ?auto_216054 ) ( not ( = ?auto_216052 ?auto_216053 ) ) ( not ( = ?auto_216052 ?auto_216054 ) ) ( not ( = ?auto_216052 ?auto_216055 ) ) ( not ( = ?auto_216052 ?auto_216056 ) ) ( not ( = ?auto_216052 ?auto_216057 ) ) ( not ( = ?auto_216053 ?auto_216054 ) ) ( not ( = ?auto_216053 ?auto_216055 ) ) ( not ( = ?auto_216053 ?auto_216056 ) ) ( not ( = ?auto_216053 ?auto_216057 ) ) ( not ( = ?auto_216054 ?auto_216055 ) ) ( not ( = ?auto_216054 ?auto_216056 ) ) ( not ( = ?auto_216054 ?auto_216057 ) ) ( not ( = ?auto_216055 ?auto_216056 ) ) ( not ( = ?auto_216055 ?auto_216057 ) ) ( not ( = ?auto_216056 ?auto_216057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216056 ?auto_216057 )
      ( !STACK ?auto_216056 ?auto_216055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216063 - BLOCK
      ?auto_216064 - BLOCK
      ?auto_216065 - BLOCK
      ?auto_216066 - BLOCK
      ?auto_216067 - BLOCK
    )
    :vars
    (
      ?auto_216068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216067 ?auto_216068 ) ( ON-TABLE ?auto_216063 ) ( ON ?auto_216064 ?auto_216063 ) ( ON ?auto_216065 ?auto_216064 ) ( not ( = ?auto_216063 ?auto_216064 ) ) ( not ( = ?auto_216063 ?auto_216065 ) ) ( not ( = ?auto_216063 ?auto_216066 ) ) ( not ( = ?auto_216063 ?auto_216067 ) ) ( not ( = ?auto_216063 ?auto_216068 ) ) ( not ( = ?auto_216064 ?auto_216065 ) ) ( not ( = ?auto_216064 ?auto_216066 ) ) ( not ( = ?auto_216064 ?auto_216067 ) ) ( not ( = ?auto_216064 ?auto_216068 ) ) ( not ( = ?auto_216065 ?auto_216066 ) ) ( not ( = ?auto_216065 ?auto_216067 ) ) ( not ( = ?auto_216065 ?auto_216068 ) ) ( not ( = ?auto_216066 ?auto_216067 ) ) ( not ( = ?auto_216066 ?auto_216068 ) ) ( not ( = ?auto_216067 ?auto_216068 ) ) ( CLEAR ?auto_216065 ) ( ON ?auto_216066 ?auto_216067 ) ( CLEAR ?auto_216066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216063 ?auto_216064 ?auto_216065 ?auto_216066 )
      ( MAKE-5PILE ?auto_216063 ?auto_216064 ?auto_216065 ?auto_216066 ?auto_216067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216074 - BLOCK
      ?auto_216075 - BLOCK
      ?auto_216076 - BLOCK
      ?auto_216077 - BLOCK
      ?auto_216078 - BLOCK
    )
    :vars
    (
      ?auto_216079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216078 ?auto_216079 ) ( ON-TABLE ?auto_216074 ) ( ON ?auto_216075 ?auto_216074 ) ( ON ?auto_216076 ?auto_216075 ) ( not ( = ?auto_216074 ?auto_216075 ) ) ( not ( = ?auto_216074 ?auto_216076 ) ) ( not ( = ?auto_216074 ?auto_216077 ) ) ( not ( = ?auto_216074 ?auto_216078 ) ) ( not ( = ?auto_216074 ?auto_216079 ) ) ( not ( = ?auto_216075 ?auto_216076 ) ) ( not ( = ?auto_216075 ?auto_216077 ) ) ( not ( = ?auto_216075 ?auto_216078 ) ) ( not ( = ?auto_216075 ?auto_216079 ) ) ( not ( = ?auto_216076 ?auto_216077 ) ) ( not ( = ?auto_216076 ?auto_216078 ) ) ( not ( = ?auto_216076 ?auto_216079 ) ) ( not ( = ?auto_216077 ?auto_216078 ) ) ( not ( = ?auto_216077 ?auto_216079 ) ) ( not ( = ?auto_216078 ?auto_216079 ) ) ( CLEAR ?auto_216076 ) ( ON ?auto_216077 ?auto_216078 ) ( CLEAR ?auto_216077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216074 ?auto_216075 ?auto_216076 ?auto_216077 )
      ( MAKE-5PILE ?auto_216074 ?auto_216075 ?auto_216076 ?auto_216077 ?auto_216078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216085 - BLOCK
      ?auto_216086 - BLOCK
      ?auto_216087 - BLOCK
      ?auto_216088 - BLOCK
      ?auto_216089 - BLOCK
    )
    :vars
    (
      ?auto_216090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216089 ?auto_216090 ) ( ON-TABLE ?auto_216085 ) ( ON ?auto_216086 ?auto_216085 ) ( not ( = ?auto_216085 ?auto_216086 ) ) ( not ( = ?auto_216085 ?auto_216087 ) ) ( not ( = ?auto_216085 ?auto_216088 ) ) ( not ( = ?auto_216085 ?auto_216089 ) ) ( not ( = ?auto_216085 ?auto_216090 ) ) ( not ( = ?auto_216086 ?auto_216087 ) ) ( not ( = ?auto_216086 ?auto_216088 ) ) ( not ( = ?auto_216086 ?auto_216089 ) ) ( not ( = ?auto_216086 ?auto_216090 ) ) ( not ( = ?auto_216087 ?auto_216088 ) ) ( not ( = ?auto_216087 ?auto_216089 ) ) ( not ( = ?auto_216087 ?auto_216090 ) ) ( not ( = ?auto_216088 ?auto_216089 ) ) ( not ( = ?auto_216088 ?auto_216090 ) ) ( not ( = ?auto_216089 ?auto_216090 ) ) ( ON ?auto_216088 ?auto_216089 ) ( CLEAR ?auto_216086 ) ( ON ?auto_216087 ?auto_216088 ) ( CLEAR ?auto_216087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216085 ?auto_216086 ?auto_216087 )
      ( MAKE-5PILE ?auto_216085 ?auto_216086 ?auto_216087 ?auto_216088 ?auto_216089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216096 - BLOCK
      ?auto_216097 - BLOCK
      ?auto_216098 - BLOCK
      ?auto_216099 - BLOCK
      ?auto_216100 - BLOCK
    )
    :vars
    (
      ?auto_216101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216100 ?auto_216101 ) ( ON-TABLE ?auto_216096 ) ( ON ?auto_216097 ?auto_216096 ) ( not ( = ?auto_216096 ?auto_216097 ) ) ( not ( = ?auto_216096 ?auto_216098 ) ) ( not ( = ?auto_216096 ?auto_216099 ) ) ( not ( = ?auto_216096 ?auto_216100 ) ) ( not ( = ?auto_216096 ?auto_216101 ) ) ( not ( = ?auto_216097 ?auto_216098 ) ) ( not ( = ?auto_216097 ?auto_216099 ) ) ( not ( = ?auto_216097 ?auto_216100 ) ) ( not ( = ?auto_216097 ?auto_216101 ) ) ( not ( = ?auto_216098 ?auto_216099 ) ) ( not ( = ?auto_216098 ?auto_216100 ) ) ( not ( = ?auto_216098 ?auto_216101 ) ) ( not ( = ?auto_216099 ?auto_216100 ) ) ( not ( = ?auto_216099 ?auto_216101 ) ) ( not ( = ?auto_216100 ?auto_216101 ) ) ( ON ?auto_216099 ?auto_216100 ) ( CLEAR ?auto_216097 ) ( ON ?auto_216098 ?auto_216099 ) ( CLEAR ?auto_216098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216096 ?auto_216097 ?auto_216098 )
      ( MAKE-5PILE ?auto_216096 ?auto_216097 ?auto_216098 ?auto_216099 ?auto_216100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216107 - BLOCK
      ?auto_216108 - BLOCK
      ?auto_216109 - BLOCK
      ?auto_216110 - BLOCK
      ?auto_216111 - BLOCK
    )
    :vars
    (
      ?auto_216112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216111 ?auto_216112 ) ( ON-TABLE ?auto_216107 ) ( not ( = ?auto_216107 ?auto_216108 ) ) ( not ( = ?auto_216107 ?auto_216109 ) ) ( not ( = ?auto_216107 ?auto_216110 ) ) ( not ( = ?auto_216107 ?auto_216111 ) ) ( not ( = ?auto_216107 ?auto_216112 ) ) ( not ( = ?auto_216108 ?auto_216109 ) ) ( not ( = ?auto_216108 ?auto_216110 ) ) ( not ( = ?auto_216108 ?auto_216111 ) ) ( not ( = ?auto_216108 ?auto_216112 ) ) ( not ( = ?auto_216109 ?auto_216110 ) ) ( not ( = ?auto_216109 ?auto_216111 ) ) ( not ( = ?auto_216109 ?auto_216112 ) ) ( not ( = ?auto_216110 ?auto_216111 ) ) ( not ( = ?auto_216110 ?auto_216112 ) ) ( not ( = ?auto_216111 ?auto_216112 ) ) ( ON ?auto_216110 ?auto_216111 ) ( ON ?auto_216109 ?auto_216110 ) ( CLEAR ?auto_216107 ) ( ON ?auto_216108 ?auto_216109 ) ( CLEAR ?auto_216108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216107 ?auto_216108 )
      ( MAKE-5PILE ?auto_216107 ?auto_216108 ?auto_216109 ?auto_216110 ?auto_216111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216118 - BLOCK
      ?auto_216119 - BLOCK
      ?auto_216120 - BLOCK
      ?auto_216121 - BLOCK
      ?auto_216122 - BLOCK
    )
    :vars
    (
      ?auto_216123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216122 ?auto_216123 ) ( ON-TABLE ?auto_216118 ) ( not ( = ?auto_216118 ?auto_216119 ) ) ( not ( = ?auto_216118 ?auto_216120 ) ) ( not ( = ?auto_216118 ?auto_216121 ) ) ( not ( = ?auto_216118 ?auto_216122 ) ) ( not ( = ?auto_216118 ?auto_216123 ) ) ( not ( = ?auto_216119 ?auto_216120 ) ) ( not ( = ?auto_216119 ?auto_216121 ) ) ( not ( = ?auto_216119 ?auto_216122 ) ) ( not ( = ?auto_216119 ?auto_216123 ) ) ( not ( = ?auto_216120 ?auto_216121 ) ) ( not ( = ?auto_216120 ?auto_216122 ) ) ( not ( = ?auto_216120 ?auto_216123 ) ) ( not ( = ?auto_216121 ?auto_216122 ) ) ( not ( = ?auto_216121 ?auto_216123 ) ) ( not ( = ?auto_216122 ?auto_216123 ) ) ( ON ?auto_216121 ?auto_216122 ) ( ON ?auto_216120 ?auto_216121 ) ( CLEAR ?auto_216118 ) ( ON ?auto_216119 ?auto_216120 ) ( CLEAR ?auto_216119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216118 ?auto_216119 )
      ( MAKE-5PILE ?auto_216118 ?auto_216119 ?auto_216120 ?auto_216121 ?auto_216122 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216129 - BLOCK
      ?auto_216130 - BLOCK
      ?auto_216131 - BLOCK
      ?auto_216132 - BLOCK
      ?auto_216133 - BLOCK
    )
    :vars
    (
      ?auto_216134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216133 ?auto_216134 ) ( not ( = ?auto_216129 ?auto_216130 ) ) ( not ( = ?auto_216129 ?auto_216131 ) ) ( not ( = ?auto_216129 ?auto_216132 ) ) ( not ( = ?auto_216129 ?auto_216133 ) ) ( not ( = ?auto_216129 ?auto_216134 ) ) ( not ( = ?auto_216130 ?auto_216131 ) ) ( not ( = ?auto_216130 ?auto_216132 ) ) ( not ( = ?auto_216130 ?auto_216133 ) ) ( not ( = ?auto_216130 ?auto_216134 ) ) ( not ( = ?auto_216131 ?auto_216132 ) ) ( not ( = ?auto_216131 ?auto_216133 ) ) ( not ( = ?auto_216131 ?auto_216134 ) ) ( not ( = ?auto_216132 ?auto_216133 ) ) ( not ( = ?auto_216132 ?auto_216134 ) ) ( not ( = ?auto_216133 ?auto_216134 ) ) ( ON ?auto_216132 ?auto_216133 ) ( ON ?auto_216131 ?auto_216132 ) ( ON ?auto_216130 ?auto_216131 ) ( ON ?auto_216129 ?auto_216130 ) ( CLEAR ?auto_216129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216129 )
      ( MAKE-5PILE ?auto_216129 ?auto_216130 ?auto_216131 ?auto_216132 ?auto_216133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_216140 - BLOCK
      ?auto_216141 - BLOCK
      ?auto_216142 - BLOCK
      ?auto_216143 - BLOCK
      ?auto_216144 - BLOCK
    )
    :vars
    (
      ?auto_216145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216144 ?auto_216145 ) ( not ( = ?auto_216140 ?auto_216141 ) ) ( not ( = ?auto_216140 ?auto_216142 ) ) ( not ( = ?auto_216140 ?auto_216143 ) ) ( not ( = ?auto_216140 ?auto_216144 ) ) ( not ( = ?auto_216140 ?auto_216145 ) ) ( not ( = ?auto_216141 ?auto_216142 ) ) ( not ( = ?auto_216141 ?auto_216143 ) ) ( not ( = ?auto_216141 ?auto_216144 ) ) ( not ( = ?auto_216141 ?auto_216145 ) ) ( not ( = ?auto_216142 ?auto_216143 ) ) ( not ( = ?auto_216142 ?auto_216144 ) ) ( not ( = ?auto_216142 ?auto_216145 ) ) ( not ( = ?auto_216143 ?auto_216144 ) ) ( not ( = ?auto_216143 ?auto_216145 ) ) ( not ( = ?auto_216144 ?auto_216145 ) ) ( ON ?auto_216143 ?auto_216144 ) ( ON ?auto_216142 ?auto_216143 ) ( ON ?auto_216141 ?auto_216142 ) ( ON ?auto_216140 ?auto_216141 ) ( CLEAR ?auto_216140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216140 )
      ( MAKE-5PILE ?auto_216140 ?auto_216141 ?auto_216142 ?auto_216143 ?auto_216144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216152 - BLOCK
      ?auto_216153 - BLOCK
      ?auto_216154 - BLOCK
      ?auto_216155 - BLOCK
      ?auto_216156 - BLOCK
      ?auto_216157 - BLOCK
    )
    :vars
    (
      ?auto_216158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216156 ) ( ON ?auto_216157 ?auto_216158 ) ( CLEAR ?auto_216157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216152 ) ( ON ?auto_216153 ?auto_216152 ) ( ON ?auto_216154 ?auto_216153 ) ( ON ?auto_216155 ?auto_216154 ) ( ON ?auto_216156 ?auto_216155 ) ( not ( = ?auto_216152 ?auto_216153 ) ) ( not ( = ?auto_216152 ?auto_216154 ) ) ( not ( = ?auto_216152 ?auto_216155 ) ) ( not ( = ?auto_216152 ?auto_216156 ) ) ( not ( = ?auto_216152 ?auto_216157 ) ) ( not ( = ?auto_216152 ?auto_216158 ) ) ( not ( = ?auto_216153 ?auto_216154 ) ) ( not ( = ?auto_216153 ?auto_216155 ) ) ( not ( = ?auto_216153 ?auto_216156 ) ) ( not ( = ?auto_216153 ?auto_216157 ) ) ( not ( = ?auto_216153 ?auto_216158 ) ) ( not ( = ?auto_216154 ?auto_216155 ) ) ( not ( = ?auto_216154 ?auto_216156 ) ) ( not ( = ?auto_216154 ?auto_216157 ) ) ( not ( = ?auto_216154 ?auto_216158 ) ) ( not ( = ?auto_216155 ?auto_216156 ) ) ( not ( = ?auto_216155 ?auto_216157 ) ) ( not ( = ?auto_216155 ?auto_216158 ) ) ( not ( = ?auto_216156 ?auto_216157 ) ) ( not ( = ?auto_216156 ?auto_216158 ) ) ( not ( = ?auto_216157 ?auto_216158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216157 ?auto_216158 )
      ( !STACK ?auto_216157 ?auto_216156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216165 - BLOCK
      ?auto_216166 - BLOCK
      ?auto_216167 - BLOCK
      ?auto_216168 - BLOCK
      ?auto_216169 - BLOCK
      ?auto_216170 - BLOCK
    )
    :vars
    (
      ?auto_216171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216169 ) ( ON ?auto_216170 ?auto_216171 ) ( CLEAR ?auto_216170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216165 ) ( ON ?auto_216166 ?auto_216165 ) ( ON ?auto_216167 ?auto_216166 ) ( ON ?auto_216168 ?auto_216167 ) ( ON ?auto_216169 ?auto_216168 ) ( not ( = ?auto_216165 ?auto_216166 ) ) ( not ( = ?auto_216165 ?auto_216167 ) ) ( not ( = ?auto_216165 ?auto_216168 ) ) ( not ( = ?auto_216165 ?auto_216169 ) ) ( not ( = ?auto_216165 ?auto_216170 ) ) ( not ( = ?auto_216165 ?auto_216171 ) ) ( not ( = ?auto_216166 ?auto_216167 ) ) ( not ( = ?auto_216166 ?auto_216168 ) ) ( not ( = ?auto_216166 ?auto_216169 ) ) ( not ( = ?auto_216166 ?auto_216170 ) ) ( not ( = ?auto_216166 ?auto_216171 ) ) ( not ( = ?auto_216167 ?auto_216168 ) ) ( not ( = ?auto_216167 ?auto_216169 ) ) ( not ( = ?auto_216167 ?auto_216170 ) ) ( not ( = ?auto_216167 ?auto_216171 ) ) ( not ( = ?auto_216168 ?auto_216169 ) ) ( not ( = ?auto_216168 ?auto_216170 ) ) ( not ( = ?auto_216168 ?auto_216171 ) ) ( not ( = ?auto_216169 ?auto_216170 ) ) ( not ( = ?auto_216169 ?auto_216171 ) ) ( not ( = ?auto_216170 ?auto_216171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216170 ?auto_216171 )
      ( !STACK ?auto_216170 ?auto_216169 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216178 - BLOCK
      ?auto_216179 - BLOCK
      ?auto_216180 - BLOCK
      ?auto_216181 - BLOCK
      ?auto_216182 - BLOCK
      ?auto_216183 - BLOCK
    )
    :vars
    (
      ?auto_216184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216183 ?auto_216184 ) ( ON-TABLE ?auto_216178 ) ( ON ?auto_216179 ?auto_216178 ) ( ON ?auto_216180 ?auto_216179 ) ( ON ?auto_216181 ?auto_216180 ) ( not ( = ?auto_216178 ?auto_216179 ) ) ( not ( = ?auto_216178 ?auto_216180 ) ) ( not ( = ?auto_216178 ?auto_216181 ) ) ( not ( = ?auto_216178 ?auto_216182 ) ) ( not ( = ?auto_216178 ?auto_216183 ) ) ( not ( = ?auto_216178 ?auto_216184 ) ) ( not ( = ?auto_216179 ?auto_216180 ) ) ( not ( = ?auto_216179 ?auto_216181 ) ) ( not ( = ?auto_216179 ?auto_216182 ) ) ( not ( = ?auto_216179 ?auto_216183 ) ) ( not ( = ?auto_216179 ?auto_216184 ) ) ( not ( = ?auto_216180 ?auto_216181 ) ) ( not ( = ?auto_216180 ?auto_216182 ) ) ( not ( = ?auto_216180 ?auto_216183 ) ) ( not ( = ?auto_216180 ?auto_216184 ) ) ( not ( = ?auto_216181 ?auto_216182 ) ) ( not ( = ?auto_216181 ?auto_216183 ) ) ( not ( = ?auto_216181 ?auto_216184 ) ) ( not ( = ?auto_216182 ?auto_216183 ) ) ( not ( = ?auto_216182 ?auto_216184 ) ) ( not ( = ?auto_216183 ?auto_216184 ) ) ( CLEAR ?auto_216181 ) ( ON ?auto_216182 ?auto_216183 ) ( CLEAR ?auto_216182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216178 ?auto_216179 ?auto_216180 ?auto_216181 ?auto_216182 )
      ( MAKE-6PILE ?auto_216178 ?auto_216179 ?auto_216180 ?auto_216181 ?auto_216182 ?auto_216183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216191 - BLOCK
      ?auto_216192 - BLOCK
      ?auto_216193 - BLOCK
      ?auto_216194 - BLOCK
      ?auto_216195 - BLOCK
      ?auto_216196 - BLOCK
    )
    :vars
    (
      ?auto_216197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216196 ?auto_216197 ) ( ON-TABLE ?auto_216191 ) ( ON ?auto_216192 ?auto_216191 ) ( ON ?auto_216193 ?auto_216192 ) ( ON ?auto_216194 ?auto_216193 ) ( not ( = ?auto_216191 ?auto_216192 ) ) ( not ( = ?auto_216191 ?auto_216193 ) ) ( not ( = ?auto_216191 ?auto_216194 ) ) ( not ( = ?auto_216191 ?auto_216195 ) ) ( not ( = ?auto_216191 ?auto_216196 ) ) ( not ( = ?auto_216191 ?auto_216197 ) ) ( not ( = ?auto_216192 ?auto_216193 ) ) ( not ( = ?auto_216192 ?auto_216194 ) ) ( not ( = ?auto_216192 ?auto_216195 ) ) ( not ( = ?auto_216192 ?auto_216196 ) ) ( not ( = ?auto_216192 ?auto_216197 ) ) ( not ( = ?auto_216193 ?auto_216194 ) ) ( not ( = ?auto_216193 ?auto_216195 ) ) ( not ( = ?auto_216193 ?auto_216196 ) ) ( not ( = ?auto_216193 ?auto_216197 ) ) ( not ( = ?auto_216194 ?auto_216195 ) ) ( not ( = ?auto_216194 ?auto_216196 ) ) ( not ( = ?auto_216194 ?auto_216197 ) ) ( not ( = ?auto_216195 ?auto_216196 ) ) ( not ( = ?auto_216195 ?auto_216197 ) ) ( not ( = ?auto_216196 ?auto_216197 ) ) ( CLEAR ?auto_216194 ) ( ON ?auto_216195 ?auto_216196 ) ( CLEAR ?auto_216195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216191 ?auto_216192 ?auto_216193 ?auto_216194 ?auto_216195 )
      ( MAKE-6PILE ?auto_216191 ?auto_216192 ?auto_216193 ?auto_216194 ?auto_216195 ?auto_216196 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216204 - BLOCK
      ?auto_216205 - BLOCK
      ?auto_216206 - BLOCK
      ?auto_216207 - BLOCK
      ?auto_216208 - BLOCK
      ?auto_216209 - BLOCK
    )
    :vars
    (
      ?auto_216210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216209 ?auto_216210 ) ( ON-TABLE ?auto_216204 ) ( ON ?auto_216205 ?auto_216204 ) ( ON ?auto_216206 ?auto_216205 ) ( not ( = ?auto_216204 ?auto_216205 ) ) ( not ( = ?auto_216204 ?auto_216206 ) ) ( not ( = ?auto_216204 ?auto_216207 ) ) ( not ( = ?auto_216204 ?auto_216208 ) ) ( not ( = ?auto_216204 ?auto_216209 ) ) ( not ( = ?auto_216204 ?auto_216210 ) ) ( not ( = ?auto_216205 ?auto_216206 ) ) ( not ( = ?auto_216205 ?auto_216207 ) ) ( not ( = ?auto_216205 ?auto_216208 ) ) ( not ( = ?auto_216205 ?auto_216209 ) ) ( not ( = ?auto_216205 ?auto_216210 ) ) ( not ( = ?auto_216206 ?auto_216207 ) ) ( not ( = ?auto_216206 ?auto_216208 ) ) ( not ( = ?auto_216206 ?auto_216209 ) ) ( not ( = ?auto_216206 ?auto_216210 ) ) ( not ( = ?auto_216207 ?auto_216208 ) ) ( not ( = ?auto_216207 ?auto_216209 ) ) ( not ( = ?auto_216207 ?auto_216210 ) ) ( not ( = ?auto_216208 ?auto_216209 ) ) ( not ( = ?auto_216208 ?auto_216210 ) ) ( not ( = ?auto_216209 ?auto_216210 ) ) ( ON ?auto_216208 ?auto_216209 ) ( CLEAR ?auto_216206 ) ( ON ?auto_216207 ?auto_216208 ) ( CLEAR ?auto_216207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216204 ?auto_216205 ?auto_216206 ?auto_216207 )
      ( MAKE-6PILE ?auto_216204 ?auto_216205 ?auto_216206 ?auto_216207 ?auto_216208 ?auto_216209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216217 - BLOCK
      ?auto_216218 - BLOCK
      ?auto_216219 - BLOCK
      ?auto_216220 - BLOCK
      ?auto_216221 - BLOCK
      ?auto_216222 - BLOCK
    )
    :vars
    (
      ?auto_216223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216222 ?auto_216223 ) ( ON-TABLE ?auto_216217 ) ( ON ?auto_216218 ?auto_216217 ) ( ON ?auto_216219 ?auto_216218 ) ( not ( = ?auto_216217 ?auto_216218 ) ) ( not ( = ?auto_216217 ?auto_216219 ) ) ( not ( = ?auto_216217 ?auto_216220 ) ) ( not ( = ?auto_216217 ?auto_216221 ) ) ( not ( = ?auto_216217 ?auto_216222 ) ) ( not ( = ?auto_216217 ?auto_216223 ) ) ( not ( = ?auto_216218 ?auto_216219 ) ) ( not ( = ?auto_216218 ?auto_216220 ) ) ( not ( = ?auto_216218 ?auto_216221 ) ) ( not ( = ?auto_216218 ?auto_216222 ) ) ( not ( = ?auto_216218 ?auto_216223 ) ) ( not ( = ?auto_216219 ?auto_216220 ) ) ( not ( = ?auto_216219 ?auto_216221 ) ) ( not ( = ?auto_216219 ?auto_216222 ) ) ( not ( = ?auto_216219 ?auto_216223 ) ) ( not ( = ?auto_216220 ?auto_216221 ) ) ( not ( = ?auto_216220 ?auto_216222 ) ) ( not ( = ?auto_216220 ?auto_216223 ) ) ( not ( = ?auto_216221 ?auto_216222 ) ) ( not ( = ?auto_216221 ?auto_216223 ) ) ( not ( = ?auto_216222 ?auto_216223 ) ) ( ON ?auto_216221 ?auto_216222 ) ( CLEAR ?auto_216219 ) ( ON ?auto_216220 ?auto_216221 ) ( CLEAR ?auto_216220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216217 ?auto_216218 ?auto_216219 ?auto_216220 )
      ( MAKE-6PILE ?auto_216217 ?auto_216218 ?auto_216219 ?auto_216220 ?auto_216221 ?auto_216222 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216230 - BLOCK
      ?auto_216231 - BLOCK
      ?auto_216232 - BLOCK
      ?auto_216233 - BLOCK
      ?auto_216234 - BLOCK
      ?auto_216235 - BLOCK
    )
    :vars
    (
      ?auto_216236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216235 ?auto_216236 ) ( ON-TABLE ?auto_216230 ) ( ON ?auto_216231 ?auto_216230 ) ( not ( = ?auto_216230 ?auto_216231 ) ) ( not ( = ?auto_216230 ?auto_216232 ) ) ( not ( = ?auto_216230 ?auto_216233 ) ) ( not ( = ?auto_216230 ?auto_216234 ) ) ( not ( = ?auto_216230 ?auto_216235 ) ) ( not ( = ?auto_216230 ?auto_216236 ) ) ( not ( = ?auto_216231 ?auto_216232 ) ) ( not ( = ?auto_216231 ?auto_216233 ) ) ( not ( = ?auto_216231 ?auto_216234 ) ) ( not ( = ?auto_216231 ?auto_216235 ) ) ( not ( = ?auto_216231 ?auto_216236 ) ) ( not ( = ?auto_216232 ?auto_216233 ) ) ( not ( = ?auto_216232 ?auto_216234 ) ) ( not ( = ?auto_216232 ?auto_216235 ) ) ( not ( = ?auto_216232 ?auto_216236 ) ) ( not ( = ?auto_216233 ?auto_216234 ) ) ( not ( = ?auto_216233 ?auto_216235 ) ) ( not ( = ?auto_216233 ?auto_216236 ) ) ( not ( = ?auto_216234 ?auto_216235 ) ) ( not ( = ?auto_216234 ?auto_216236 ) ) ( not ( = ?auto_216235 ?auto_216236 ) ) ( ON ?auto_216234 ?auto_216235 ) ( ON ?auto_216233 ?auto_216234 ) ( CLEAR ?auto_216231 ) ( ON ?auto_216232 ?auto_216233 ) ( CLEAR ?auto_216232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216230 ?auto_216231 ?auto_216232 )
      ( MAKE-6PILE ?auto_216230 ?auto_216231 ?auto_216232 ?auto_216233 ?auto_216234 ?auto_216235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216243 - BLOCK
      ?auto_216244 - BLOCK
      ?auto_216245 - BLOCK
      ?auto_216246 - BLOCK
      ?auto_216247 - BLOCK
      ?auto_216248 - BLOCK
    )
    :vars
    (
      ?auto_216249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216248 ?auto_216249 ) ( ON-TABLE ?auto_216243 ) ( ON ?auto_216244 ?auto_216243 ) ( not ( = ?auto_216243 ?auto_216244 ) ) ( not ( = ?auto_216243 ?auto_216245 ) ) ( not ( = ?auto_216243 ?auto_216246 ) ) ( not ( = ?auto_216243 ?auto_216247 ) ) ( not ( = ?auto_216243 ?auto_216248 ) ) ( not ( = ?auto_216243 ?auto_216249 ) ) ( not ( = ?auto_216244 ?auto_216245 ) ) ( not ( = ?auto_216244 ?auto_216246 ) ) ( not ( = ?auto_216244 ?auto_216247 ) ) ( not ( = ?auto_216244 ?auto_216248 ) ) ( not ( = ?auto_216244 ?auto_216249 ) ) ( not ( = ?auto_216245 ?auto_216246 ) ) ( not ( = ?auto_216245 ?auto_216247 ) ) ( not ( = ?auto_216245 ?auto_216248 ) ) ( not ( = ?auto_216245 ?auto_216249 ) ) ( not ( = ?auto_216246 ?auto_216247 ) ) ( not ( = ?auto_216246 ?auto_216248 ) ) ( not ( = ?auto_216246 ?auto_216249 ) ) ( not ( = ?auto_216247 ?auto_216248 ) ) ( not ( = ?auto_216247 ?auto_216249 ) ) ( not ( = ?auto_216248 ?auto_216249 ) ) ( ON ?auto_216247 ?auto_216248 ) ( ON ?auto_216246 ?auto_216247 ) ( CLEAR ?auto_216244 ) ( ON ?auto_216245 ?auto_216246 ) ( CLEAR ?auto_216245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216243 ?auto_216244 ?auto_216245 )
      ( MAKE-6PILE ?auto_216243 ?auto_216244 ?auto_216245 ?auto_216246 ?auto_216247 ?auto_216248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216256 - BLOCK
      ?auto_216257 - BLOCK
      ?auto_216258 - BLOCK
      ?auto_216259 - BLOCK
      ?auto_216260 - BLOCK
      ?auto_216261 - BLOCK
    )
    :vars
    (
      ?auto_216262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216261 ?auto_216262 ) ( ON-TABLE ?auto_216256 ) ( not ( = ?auto_216256 ?auto_216257 ) ) ( not ( = ?auto_216256 ?auto_216258 ) ) ( not ( = ?auto_216256 ?auto_216259 ) ) ( not ( = ?auto_216256 ?auto_216260 ) ) ( not ( = ?auto_216256 ?auto_216261 ) ) ( not ( = ?auto_216256 ?auto_216262 ) ) ( not ( = ?auto_216257 ?auto_216258 ) ) ( not ( = ?auto_216257 ?auto_216259 ) ) ( not ( = ?auto_216257 ?auto_216260 ) ) ( not ( = ?auto_216257 ?auto_216261 ) ) ( not ( = ?auto_216257 ?auto_216262 ) ) ( not ( = ?auto_216258 ?auto_216259 ) ) ( not ( = ?auto_216258 ?auto_216260 ) ) ( not ( = ?auto_216258 ?auto_216261 ) ) ( not ( = ?auto_216258 ?auto_216262 ) ) ( not ( = ?auto_216259 ?auto_216260 ) ) ( not ( = ?auto_216259 ?auto_216261 ) ) ( not ( = ?auto_216259 ?auto_216262 ) ) ( not ( = ?auto_216260 ?auto_216261 ) ) ( not ( = ?auto_216260 ?auto_216262 ) ) ( not ( = ?auto_216261 ?auto_216262 ) ) ( ON ?auto_216260 ?auto_216261 ) ( ON ?auto_216259 ?auto_216260 ) ( ON ?auto_216258 ?auto_216259 ) ( CLEAR ?auto_216256 ) ( ON ?auto_216257 ?auto_216258 ) ( CLEAR ?auto_216257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216256 ?auto_216257 )
      ( MAKE-6PILE ?auto_216256 ?auto_216257 ?auto_216258 ?auto_216259 ?auto_216260 ?auto_216261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216269 - BLOCK
      ?auto_216270 - BLOCK
      ?auto_216271 - BLOCK
      ?auto_216272 - BLOCK
      ?auto_216273 - BLOCK
      ?auto_216274 - BLOCK
    )
    :vars
    (
      ?auto_216275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216274 ?auto_216275 ) ( ON-TABLE ?auto_216269 ) ( not ( = ?auto_216269 ?auto_216270 ) ) ( not ( = ?auto_216269 ?auto_216271 ) ) ( not ( = ?auto_216269 ?auto_216272 ) ) ( not ( = ?auto_216269 ?auto_216273 ) ) ( not ( = ?auto_216269 ?auto_216274 ) ) ( not ( = ?auto_216269 ?auto_216275 ) ) ( not ( = ?auto_216270 ?auto_216271 ) ) ( not ( = ?auto_216270 ?auto_216272 ) ) ( not ( = ?auto_216270 ?auto_216273 ) ) ( not ( = ?auto_216270 ?auto_216274 ) ) ( not ( = ?auto_216270 ?auto_216275 ) ) ( not ( = ?auto_216271 ?auto_216272 ) ) ( not ( = ?auto_216271 ?auto_216273 ) ) ( not ( = ?auto_216271 ?auto_216274 ) ) ( not ( = ?auto_216271 ?auto_216275 ) ) ( not ( = ?auto_216272 ?auto_216273 ) ) ( not ( = ?auto_216272 ?auto_216274 ) ) ( not ( = ?auto_216272 ?auto_216275 ) ) ( not ( = ?auto_216273 ?auto_216274 ) ) ( not ( = ?auto_216273 ?auto_216275 ) ) ( not ( = ?auto_216274 ?auto_216275 ) ) ( ON ?auto_216273 ?auto_216274 ) ( ON ?auto_216272 ?auto_216273 ) ( ON ?auto_216271 ?auto_216272 ) ( CLEAR ?auto_216269 ) ( ON ?auto_216270 ?auto_216271 ) ( CLEAR ?auto_216270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216269 ?auto_216270 )
      ( MAKE-6PILE ?auto_216269 ?auto_216270 ?auto_216271 ?auto_216272 ?auto_216273 ?auto_216274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216282 - BLOCK
      ?auto_216283 - BLOCK
      ?auto_216284 - BLOCK
      ?auto_216285 - BLOCK
      ?auto_216286 - BLOCK
      ?auto_216287 - BLOCK
    )
    :vars
    (
      ?auto_216288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216287 ?auto_216288 ) ( not ( = ?auto_216282 ?auto_216283 ) ) ( not ( = ?auto_216282 ?auto_216284 ) ) ( not ( = ?auto_216282 ?auto_216285 ) ) ( not ( = ?auto_216282 ?auto_216286 ) ) ( not ( = ?auto_216282 ?auto_216287 ) ) ( not ( = ?auto_216282 ?auto_216288 ) ) ( not ( = ?auto_216283 ?auto_216284 ) ) ( not ( = ?auto_216283 ?auto_216285 ) ) ( not ( = ?auto_216283 ?auto_216286 ) ) ( not ( = ?auto_216283 ?auto_216287 ) ) ( not ( = ?auto_216283 ?auto_216288 ) ) ( not ( = ?auto_216284 ?auto_216285 ) ) ( not ( = ?auto_216284 ?auto_216286 ) ) ( not ( = ?auto_216284 ?auto_216287 ) ) ( not ( = ?auto_216284 ?auto_216288 ) ) ( not ( = ?auto_216285 ?auto_216286 ) ) ( not ( = ?auto_216285 ?auto_216287 ) ) ( not ( = ?auto_216285 ?auto_216288 ) ) ( not ( = ?auto_216286 ?auto_216287 ) ) ( not ( = ?auto_216286 ?auto_216288 ) ) ( not ( = ?auto_216287 ?auto_216288 ) ) ( ON ?auto_216286 ?auto_216287 ) ( ON ?auto_216285 ?auto_216286 ) ( ON ?auto_216284 ?auto_216285 ) ( ON ?auto_216283 ?auto_216284 ) ( ON ?auto_216282 ?auto_216283 ) ( CLEAR ?auto_216282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216282 )
      ( MAKE-6PILE ?auto_216282 ?auto_216283 ?auto_216284 ?auto_216285 ?auto_216286 ?auto_216287 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_216295 - BLOCK
      ?auto_216296 - BLOCK
      ?auto_216297 - BLOCK
      ?auto_216298 - BLOCK
      ?auto_216299 - BLOCK
      ?auto_216300 - BLOCK
    )
    :vars
    (
      ?auto_216301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216300 ?auto_216301 ) ( not ( = ?auto_216295 ?auto_216296 ) ) ( not ( = ?auto_216295 ?auto_216297 ) ) ( not ( = ?auto_216295 ?auto_216298 ) ) ( not ( = ?auto_216295 ?auto_216299 ) ) ( not ( = ?auto_216295 ?auto_216300 ) ) ( not ( = ?auto_216295 ?auto_216301 ) ) ( not ( = ?auto_216296 ?auto_216297 ) ) ( not ( = ?auto_216296 ?auto_216298 ) ) ( not ( = ?auto_216296 ?auto_216299 ) ) ( not ( = ?auto_216296 ?auto_216300 ) ) ( not ( = ?auto_216296 ?auto_216301 ) ) ( not ( = ?auto_216297 ?auto_216298 ) ) ( not ( = ?auto_216297 ?auto_216299 ) ) ( not ( = ?auto_216297 ?auto_216300 ) ) ( not ( = ?auto_216297 ?auto_216301 ) ) ( not ( = ?auto_216298 ?auto_216299 ) ) ( not ( = ?auto_216298 ?auto_216300 ) ) ( not ( = ?auto_216298 ?auto_216301 ) ) ( not ( = ?auto_216299 ?auto_216300 ) ) ( not ( = ?auto_216299 ?auto_216301 ) ) ( not ( = ?auto_216300 ?auto_216301 ) ) ( ON ?auto_216299 ?auto_216300 ) ( ON ?auto_216298 ?auto_216299 ) ( ON ?auto_216297 ?auto_216298 ) ( ON ?auto_216296 ?auto_216297 ) ( ON ?auto_216295 ?auto_216296 ) ( CLEAR ?auto_216295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216295 )
      ( MAKE-6PILE ?auto_216295 ?auto_216296 ?auto_216297 ?auto_216298 ?auto_216299 ?auto_216300 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216309 - BLOCK
      ?auto_216310 - BLOCK
      ?auto_216311 - BLOCK
      ?auto_216312 - BLOCK
      ?auto_216313 - BLOCK
      ?auto_216314 - BLOCK
      ?auto_216315 - BLOCK
    )
    :vars
    (
      ?auto_216316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216314 ) ( ON ?auto_216315 ?auto_216316 ) ( CLEAR ?auto_216315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216309 ) ( ON ?auto_216310 ?auto_216309 ) ( ON ?auto_216311 ?auto_216310 ) ( ON ?auto_216312 ?auto_216311 ) ( ON ?auto_216313 ?auto_216312 ) ( ON ?auto_216314 ?auto_216313 ) ( not ( = ?auto_216309 ?auto_216310 ) ) ( not ( = ?auto_216309 ?auto_216311 ) ) ( not ( = ?auto_216309 ?auto_216312 ) ) ( not ( = ?auto_216309 ?auto_216313 ) ) ( not ( = ?auto_216309 ?auto_216314 ) ) ( not ( = ?auto_216309 ?auto_216315 ) ) ( not ( = ?auto_216309 ?auto_216316 ) ) ( not ( = ?auto_216310 ?auto_216311 ) ) ( not ( = ?auto_216310 ?auto_216312 ) ) ( not ( = ?auto_216310 ?auto_216313 ) ) ( not ( = ?auto_216310 ?auto_216314 ) ) ( not ( = ?auto_216310 ?auto_216315 ) ) ( not ( = ?auto_216310 ?auto_216316 ) ) ( not ( = ?auto_216311 ?auto_216312 ) ) ( not ( = ?auto_216311 ?auto_216313 ) ) ( not ( = ?auto_216311 ?auto_216314 ) ) ( not ( = ?auto_216311 ?auto_216315 ) ) ( not ( = ?auto_216311 ?auto_216316 ) ) ( not ( = ?auto_216312 ?auto_216313 ) ) ( not ( = ?auto_216312 ?auto_216314 ) ) ( not ( = ?auto_216312 ?auto_216315 ) ) ( not ( = ?auto_216312 ?auto_216316 ) ) ( not ( = ?auto_216313 ?auto_216314 ) ) ( not ( = ?auto_216313 ?auto_216315 ) ) ( not ( = ?auto_216313 ?auto_216316 ) ) ( not ( = ?auto_216314 ?auto_216315 ) ) ( not ( = ?auto_216314 ?auto_216316 ) ) ( not ( = ?auto_216315 ?auto_216316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216315 ?auto_216316 )
      ( !STACK ?auto_216315 ?auto_216314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216324 - BLOCK
      ?auto_216325 - BLOCK
      ?auto_216326 - BLOCK
      ?auto_216327 - BLOCK
      ?auto_216328 - BLOCK
      ?auto_216329 - BLOCK
      ?auto_216330 - BLOCK
    )
    :vars
    (
      ?auto_216331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216329 ) ( ON ?auto_216330 ?auto_216331 ) ( CLEAR ?auto_216330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216324 ) ( ON ?auto_216325 ?auto_216324 ) ( ON ?auto_216326 ?auto_216325 ) ( ON ?auto_216327 ?auto_216326 ) ( ON ?auto_216328 ?auto_216327 ) ( ON ?auto_216329 ?auto_216328 ) ( not ( = ?auto_216324 ?auto_216325 ) ) ( not ( = ?auto_216324 ?auto_216326 ) ) ( not ( = ?auto_216324 ?auto_216327 ) ) ( not ( = ?auto_216324 ?auto_216328 ) ) ( not ( = ?auto_216324 ?auto_216329 ) ) ( not ( = ?auto_216324 ?auto_216330 ) ) ( not ( = ?auto_216324 ?auto_216331 ) ) ( not ( = ?auto_216325 ?auto_216326 ) ) ( not ( = ?auto_216325 ?auto_216327 ) ) ( not ( = ?auto_216325 ?auto_216328 ) ) ( not ( = ?auto_216325 ?auto_216329 ) ) ( not ( = ?auto_216325 ?auto_216330 ) ) ( not ( = ?auto_216325 ?auto_216331 ) ) ( not ( = ?auto_216326 ?auto_216327 ) ) ( not ( = ?auto_216326 ?auto_216328 ) ) ( not ( = ?auto_216326 ?auto_216329 ) ) ( not ( = ?auto_216326 ?auto_216330 ) ) ( not ( = ?auto_216326 ?auto_216331 ) ) ( not ( = ?auto_216327 ?auto_216328 ) ) ( not ( = ?auto_216327 ?auto_216329 ) ) ( not ( = ?auto_216327 ?auto_216330 ) ) ( not ( = ?auto_216327 ?auto_216331 ) ) ( not ( = ?auto_216328 ?auto_216329 ) ) ( not ( = ?auto_216328 ?auto_216330 ) ) ( not ( = ?auto_216328 ?auto_216331 ) ) ( not ( = ?auto_216329 ?auto_216330 ) ) ( not ( = ?auto_216329 ?auto_216331 ) ) ( not ( = ?auto_216330 ?auto_216331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216330 ?auto_216331 )
      ( !STACK ?auto_216330 ?auto_216329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216339 - BLOCK
      ?auto_216340 - BLOCK
      ?auto_216341 - BLOCK
      ?auto_216342 - BLOCK
      ?auto_216343 - BLOCK
      ?auto_216344 - BLOCK
      ?auto_216345 - BLOCK
    )
    :vars
    (
      ?auto_216346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216345 ?auto_216346 ) ( ON-TABLE ?auto_216339 ) ( ON ?auto_216340 ?auto_216339 ) ( ON ?auto_216341 ?auto_216340 ) ( ON ?auto_216342 ?auto_216341 ) ( ON ?auto_216343 ?auto_216342 ) ( not ( = ?auto_216339 ?auto_216340 ) ) ( not ( = ?auto_216339 ?auto_216341 ) ) ( not ( = ?auto_216339 ?auto_216342 ) ) ( not ( = ?auto_216339 ?auto_216343 ) ) ( not ( = ?auto_216339 ?auto_216344 ) ) ( not ( = ?auto_216339 ?auto_216345 ) ) ( not ( = ?auto_216339 ?auto_216346 ) ) ( not ( = ?auto_216340 ?auto_216341 ) ) ( not ( = ?auto_216340 ?auto_216342 ) ) ( not ( = ?auto_216340 ?auto_216343 ) ) ( not ( = ?auto_216340 ?auto_216344 ) ) ( not ( = ?auto_216340 ?auto_216345 ) ) ( not ( = ?auto_216340 ?auto_216346 ) ) ( not ( = ?auto_216341 ?auto_216342 ) ) ( not ( = ?auto_216341 ?auto_216343 ) ) ( not ( = ?auto_216341 ?auto_216344 ) ) ( not ( = ?auto_216341 ?auto_216345 ) ) ( not ( = ?auto_216341 ?auto_216346 ) ) ( not ( = ?auto_216342 ?auto_216343 ) ) ( not ( = ?auto_216342 ?auto_216344 ) ) ( not ( = ?auto_216342 ?auto_216345 ) ) ( not ( = ?auto_216342 ?auto_216346 ) ) ( not ( = ?auto_216343 ?auto_216344 ) ) ( not ( = ?auto_216343 ?auto_216345 ) ) ( not ( = ?auto_216343 ?auto_216346 ) ) ( not ( = ?auto_216344 ?auto_216345 ) ) ( not ( = ?auto_216344 ?auto_216346 ) ) ( not ( = ?auto_216345 ?auto_216346 ) ) ( CLEAR ?auto_216343 ) ( ON ?auto_216344 ?auto_216345 ) ( CLEAR ?auto_216344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216339 ?auto_216340 ?auto_216341 ?auto_216342 ?auto_216343 ?auto_216344 )
      ( MAKE-7PILE ?auto_216339 ?auto_216340 ?auto_216341 ?auto_216342 ?auto_216343 ?auto_216344 ?auto_216345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216354 - BLOCK
      ?auto_216355 - BLOCK
      ?auto_216356 - BLOCK
      ?auto_216357 - BLOCK
      ?auto_216358 - BLOCK
      ?auto_216359 - BLOCK
      ?auto_216360 - BLOCK
    )
    :vars
    (
      ?auto_216361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216360 ?auto_216361 ) ( ON-TABLE ?auto_216354 ) ( ON ?auto_216355 ?auto_216354 ) ( ON ?auto_216356 ?auto_216355 ) ( ON ?auto_216357 ?auto_216356 ) ( ON ?auto_216358 ?auto_216357 ) ( not ( = ?auto_216354 ?auto_216355 ) ) ( not ( = ?auto_216354 ?auto_216356 ) ) ( not ( = ?auto_216354 ?auto_216357 ) ) ( not ( = ?auto_216354 ?auto_216358 ) ) ( not ( = ?auto_216354 ?auto_216359 ) ) ( not ( = ?auto_216354 ?auto_216360 ) ) ( not ( = ?auto_216354 ?auto_216361 ) ) ( not ( = ?auto_216355 ?auto_216356 ) ) ( not ( = ?auto_216355 ?auto_216357 ) ) ( not ( = ?auto_216355 ?auto_216358 ) ) ( not ( = ?auto_216355 ?auto_216359 ) ) ( not ( = ?auto_216355 ?auto_216360 ) ) ( not ( = ?auto_216355 ?auto_216361 ) ) ( not ( = ?auto_216356 ?auto_216357 ) ) ( not ( = ?auto_216356 ?auto_216358 ) ) ( not ( = ?auto_216356 ?auto_216359 ) ) ( not ( = ?auto_216356 ?auto_216360 ) ) ( not ( = ?auto_216356 ?auto_216361 ) ) ( not ( = ?auto_216357 ?auto_216358 ) ) ( not ( = ?auto_216357 ?auto_216359 ) ) ( not ( = ?auto_216357 ?auto_216360 ) ) ( not ( = ?auto_216357 ?auto_216361 ) ) ( not ( = ?auto_216358 ?auto_216359 ) ) ( not ( = ?auto_216358 ?auto_216360 ) ) ( not ( = ?auto_216358 ?auto_216361 ) ) ( not ( = ?auto_216359 ?auto_216360 ) ) ( not ( = ?auto_216359 ?auto_216361 ) ) ( not ( = ?auto_216360 ?auto_216361 ) ) ( CLEAR ?auto_216358 ) ( ON ?auto_216359 ?auto_216360 ) ( CLEAR ?auto_216359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216354 ?auto_216355 ?auto_216356 ?auto_216357 ?auto_216358 ?auto_216359 )
      ( MAKE-7PILE ?auto_216354 ?auto_216355 ?auto_216356 ?auto_216357 ?auto_216358 ?auto_216359 ?auto_216360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216369 - BLOCK
      ?auto_216370 - BLOCK
      ?auto_216371 - BLOCK
      ?auto_216372 - BLOCK
      ?auto_216373 - BLOCK
      ?auto_216374 - BLOCK
      ?auto_216375 - BLOCK
    )
    :vars
    (
      ?auto_216376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216375 ?auto_216376 ) ( ON-TABLE ?auto_216369 ) ( ON ?auto_216370 ?auto_216369 ) ( ON ?auto_216371 ?auto_216370 ) ( ON ?auto_216372 ?auto_216371 ) ( not ( = ?auto_216369 ?auto_216370 ) ) ( not ( = ?auto_216369 ?auto_216371 ) ) ( not ( = ?auto_216369 ?auto_216372 ) ) ( not ( = ?auto_216369 ?auto_216373 ) ) ( not ( = ?auto_216369 ?auto_216374 ) ) ( not ( = ?auto_216369 ?auto_216375 ) ) ( not ( = ?auto_216369 ?auto_216376 ) ) ( not ( = ?auto_216370 ?auto_216371 ) ) ( not ( = ?auto_216370 ?auto_216372 ) ) ( not ( = ?auto_216370 ?auto_216373 ) ) ( not ( = ?auto_216370 ?auto_216374 ) ) ( not ( = ?auto_216370 ?auto_216375 ) ) ( not ( = ?auto_216370 ?auto_216376 ) ) ( not ( = ?auto_216371 ?auto_216372 ) ) ( not ( = ?auto_216371 ?auto_216373 ) ) ( not ( = ?auto_216371 ?auto_216374 ) ) ( not ( = ?auto_216371 ?auto_216375 ) ) ( not ( = ?auto_216371 ?auto_216376 ) ) ( not ( = ?auto_216372 ?auto_216373 ) ) ( not ( = ?auto_216372 ?auto_216374 ) ) ( not ( = ?auto_216372 ?auto_216375 ) ) ( not ( = ?auto_216372 ?auto_216376 ) ) ( not ( = ?auto_216373 ?auto_216374 ) ) ( not ( = ?auto_216373 ?auto_216375 ) ) ( not ( = ?auto_216373 ?auto_216376 ) ) ( not ( = ?auto_216374 ?auto_216375 ) ) ( not ( = ?auto_216374 ?auto_216376 ) ) ( not ( = ?auto_216375 ?auto_216376 ) ) ( ON ?auto_216374 ?auto_216375 ) ( CLEAR ?auto_216372 ) ( ON ?auto_216373 ?auto_216374 ) ( CLEAR ?auto_216373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216369 ?auto_216370 ?auto_216371 ?auto_216372 ?auto_216373 )
      ( MAKE-7PILE ?auto_216369 ?auto_216370 ?auto_216371 ?auto_216372 ?auto_216373 ?auto_216374 ?auto_216375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216384 - BLOCK
      ?auto_216385 - BLOCK
      ?auto_216386 - BLOCK
      ?auto_216387 - BLOCK
      ?auto_216388 - BLOCK
      ?auto_216389 - BLOCK
      ?auto_216390 - BLOCK
    )
    :vars
    (
      ?auto_216391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216390 ?auto_216391 ) ( ON-TABLE ?auto_216384 ) ( ON ?auto_216385 ?auto_216384 ) ( ON ?auto_216386 ?auto_216385 ) ( ON ?auto_216387 ?auto_216386 ) ( not ( = ?auto_216384 ?auto_216385 ) ) ( not ( = ?auto_216384 ?auto_216386 ) ) ( not ( = ?auto_216384 ?auto_216387 ) ) ( not ( = ?auto_216384 ?auto_216388 ) ) ( not ( = ?auto_216384 ?auto_216389 ) ) ( not ( = ?auto_216384 ?auto_216390 ) ) ( not ( = ?auto_216384 ?auto_216391 ) ) ( not ( = ?auto_216385 ?auto_216386 ) ) ( not ( = ?auto_216385 ?auto_216387 ) ) ( not ( = ?auto_216385 ?auto_216388 ) ) ( not ( = ?auto_216385 ?auto_216389 ) ) ( not ( = ?auto_216385 ?auto_216390 ) ) ( not ( = ?auto_216385 ?auto_216391 ) ) ( not ( = ?auto_216386 ?auto_216387 ) ) ( not ( = ?auto_216386 ?auto_216388 ) ) ( not ( = ?auto_216386 ?auto_216389 ) ) ( not ( = ?auto_216386 ?auto_216390 ) ) ( not ( = ?auto_216386 ?auto_216391 ) ) ( not ( = ?auto_216387 ?auto_216388 ) ) ( not ( = ?auto_216387 ?auto_216389 ) ) ( not ( = ?auto_216387 ?auto_216390 ) ) ( not ( = ?auto_216387 ?auto_216391 ) ) ( not ( = ?auto_216388 ?auto_216389 ) ) ( not ( = ?auto_216388 ?auto_216390 ) ) ( not ( = ?auto_216388 ?auto_216391 ) ) ( not ( = ?auto_216389 ?auto_216390 ) ) ( not ( = ?auto_216389 ?auto_216391 ) ) ( not ( = ?auto_216390 ?auto_216391 ) ) ( ON ?auto_216389 ?auto_216390 ) ( CLEAR ?auto_216387 ) ( ON ?auto_216388 ?auto_216389 ) ( CLEAR ?auto_216388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216384 ?auto_216385 ?auto_216386 ?auto_216387 ?auto_216388 )
      ( MAKE-7PILE ?auto_216384 ?auto_216385 ?auto_216386 ?auto_216387 ?auto_216388 ?auto_216389 ?auto_216390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216399 - BLOCK
      ?auto_216400 - BLOCK
      ?auto_216401 - BLOCK
      ?auto_216402 - BLOCK
      ?auto_216403 - BLOCK
      ?auto_216404 - BLOCK
      ?auto_216405 - BLOCK
    )
    :vars
    (
      ?auto_216406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216405 ?auto_216406 ) ( ON-TABLE ?auto_216399 ) ( ON ?auto_216400 ?auto_216399 ) ( ON ?auto_216401 ?auto_216400 ) ( not ( = ?auto_216399 ?auto_216400 ) ) ( not ( = ?auto_216399 ?auto_216401 ) ) ( not ( = ?auto_216399 ?auto_216402 ) ) ( not ( = ?auto_216399 ?auto_216403 ) ) ( not ( = ?auto_216399 ?auto_216404 ) ) ( not ( = ?auto_216399 ?auto_216405 ) ) ( not ( = ?auto_216399 ?auto_216406 ) ) ( not ( = ?auto_216400 ?auto_216401 ) ) ( not ( = ?auto_216400 ?auto_216402 ) ) ( not ( = ?auto_216400 ?auto_216403 ) ) ( not ( = ?auto_216400 ?auto_216404 ) ) ( not ( = ?auto_216400 ?auto_216405 ) ) ( not ( = ?auto_216400 ?auto_216406 ) ) ( not ( = ?auto_216401 ?auto_216402 ) ) ( not ( = ?auto_216401 ?auto_216403 ) ) ( not ( = ?auto_216401 ?auto_216404 ) ) ( not ( = ?auto_216401 ?auto_216405 ) ) ( not ( = ?auto_216401 ?auto_216406 ) ) ( not ( = ?auto_216402 ?auto_216403 ) ) ( not ( = ?auto_216402 ?auto_216404 ) ) ( not ( = ?auto_216402 ?auto_216405 ) ) ( not ( = ?auto_216402 ?auto_216406 ) ) ( not ( = ?auto_216403 ?auto_216404 ) ) ( not ( = ?auto_216403 ?auto_216405 ) ) ( not ( = ?auto_216403 ?auto_216406 ) ) ( not ( = ?auto_216404 ?auto_216405 ) ) ( not ( = ?auto_216404 ?auto_216406 ) ) ( not ( = ?auto_216405 ?auto_216406 ) ) ( ON ?auto_216404 ?auto_216405 ) ( ON ?auto_216403 ?auto_216404 ) ( CLEAR ?auto_216401 ) ( ON ?auto_216402 ?auto_216403 ) ( CLEAR ?auto_216402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216399 ?auto_216400 ?auto_216401 ?auto_216402 )
      ( MAKE-7PILE ?auto_216399 ?auto_216400 ?auto_216401 ?auto_216402 ?auto_216403 ?auto_216404 ?auto_216405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216414 - BLOCK
      ?auto_216415 - BLOCK
      ?auto_216416 - BLOCK
      ?auto_216417 - BLOCK
      ?auto_216418 - BLOCK
      ?auto_216419 - BLOCK
      ?auto_216420 - BLOCK
    )
    :vars
    (
      ?auto_216421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216420 ?auto_216421 ) ( ON-TABLE ?auto_216414 ) ( ON ?auto_216415 ?auto_216414 ) ( ON ?auto_216416 ?auto_216415 ) ( not ( = ?auto_216414 ?auto_216415 ) ) ( not ( = ?auto_216414 ?auto_216416 ) ) ( not ( = ?auto_216414 ?auto_216417 ) ) ( not ( = ?auto_216414 ?auto_216418 ) ) ( not ( = ?auto_216414 ?auto_216419 ) ) ( not ( = ?auto_216414 ?auto_216420 ) ) ( not ( = ?auto_216414 ?auto_216421 ) ) ( not ( = ?auto_216415 ?auto_216416 ) ) ( not ( = ?auto_216415 ?auto_216417 ) ) ( not ( = ?auto_216415 ?auto_216418 ) ) ( not ( = ?auto_216415 ?auto_216419 ) ) ( not ( = ?auto_216415 ?auto_216420 ) ) ( not ( = ?auto_216415 ?auto_216421 ) ) ( not ( = ?auto_216416 ?auto_216417 ) ) ( not ( = ?auto_216416 ?auto_216418 ) ) ( not ( = ?auto_216416 ?auto_216419 ) ) ( not ( = ?auto_216416 ?auto_216420 ) ) ( not ( = ?auto_216416 ?auto_216421 ) ) ( not ( = ?auto_216417 ?auto_216418 ) ) ( not ( = ?auto_216417 ?auto_216419 ) ) ( not ( = ?auto_216417 ?auto_216420 ) ) ( not ( = ?auto_216417 ?auto_216421 ) ) ( not ( = ?auto_216418 ?auto_216419 ) ) ( not ( = ?auto_216418 ?auto_216420 ) ) ( not ( = ?auto_216418 ?auto_216421 ) ) ( not ( = ?auto_216419 ?auto_216420 ) ) ( not ( = ?auto_216419 ?auto_216421 ) ) ( not ( = ?auto_216420 ?auto_216421 ) ) ( ON ?auto_216419 ?auto_216420 ) ( ON ?auto_216418 ?auto_216419 ) ( CLEAR ?auto_216416 ) ( ON ?auto_216417 ?auto_216418 ) ( CLEAR ?auto_216417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216414 ?auto_216415 ?auto_216416 ?auto_216417 )
      ( MAKE-7PILE ?auto_216414 ?auto_216415 ?auto_216416 ?auto_216417 ?auto_216418 ?auto_216419 ?auto_216420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216429 - BLOCK
      ?auto_216430 - BLOCK
      ?auto_216431 - BLOCK
      ?auto_216432 - BLOCK
      ?auto_216433 - BLOCK
      ?auto_216434 - BLOCK
      ?auto_216435 - BLOCK
    )
    :vars
    (
      ?auto_216436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216435 ?auto_216436 ) ( ON-TABLE ?auto_216429 ) ( ON ?auto_216430 ?auto_216429 ) ( not ( = ?auto_216429 ?auto_216430 ) ) ( not ( = ?auto_216429 ?auto_216431 ) ) ( not ( = ?auto_216429 ?auto_216432 ) ) ( not ( = ?auto_216429 ?auto_216433 ) ) ( not ( = ?auto_216429 ?auto_216434 ) ) ( not ( = ?auto_216429 ?auto_216435 ) ) ( not ( = ?auto_216429 ?auto_216436 ) ) ( not ( = ?auto_216430 ?auto_216431 ) ) ( not ( = ?auto_216430 ?auto_216432 ) ) ( not ( = ?auto_216430 ?auto_216433 ) ) ( not ( = ?auto_216430 ?auto_216434 ) ) ( not ( = ?auto_216430 ?auto_216435 ) ) ( not ( = ?auto_216430 ?auto_216436 ) ) ( not ( = ?auto_216431 ?auto_216432 ) ) ( not ( = ?auto_216431 ?auto_216433 ) ) ( not ( = ?auto_216431 ?auto_216434 ) ) ( not ( = ?auto_216431 ?auto_216435 ) ) ( not ( = ?auto_216431 ?auto_216436 ) ) ( not ( = ?auto_216432 ?auto_216433 ) ) ( not ( = ?auto_216432 ?auto_216434 ) ) ( not ( = ?auto_216432 ?auto_216435 ) ) ( not ( = ?auto_216432 ?auto_216436 ) ) ( not ( = ?auto_216433 ?auto_216434 ) ) ( not ( = ?auto_216433 ?auto_216435 ) ) ( not ( = ?auto_216433 ?auto_216436 ) ) ( not ( = ?auto_216434 ?auto_216435 ) ) ( not ( = ?auto_216434 ?auto_216436 ) ) ( not ( = ?auto_216435 ?auto_216436 ) ) ( ON ?auto_216434 ?auto_216435 ) ( ON ?auto_216433 ?auto_216434 ) ( ON ?auto_216432 ?auto_216433 ) ( CLEAR ?auto_216430 ) ( ON ?auto_216431 ?auto_216432 ) ( CLEAR ?auto_216431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216429 ?auto_216430 ?auto_216431 )
      ( MAKE-7PILE ?auto_216429 ?auto_216430 ?auto_216431 ?auto_216432 ?auto_216433 ?auto_216434 ?auto_216435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216444 - BLOCK
      ?auto_216445 - BLOCK
      ?auto_216446 - BLOCK
      ?auto_216447 - BLOCK
      ?auto_216448 - BLOCK
      ?auto_216449 - BLOCK
      ?auto_216450 - BLOCK
    )
    :vars
    (
      ?auto_216451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216450 ?auto_216451 ) ( ON-TABLE ?auto_216444 ) ( ON ?auto_216445 ?auto_216444 ) ( not ( = ?auto_216444 ?auto_216445 ) ) ( not ( = ?auto_216444 ?auto_216446 ) ) ( not ( = ?auto_216444 ?auto_216447 ) ) ( not ( = ?auto_216444 ?auto_216448 ) ) ( not ( = ?auto_216444 ?auto_216449 ) ) ( not ( = ?auto_216444 ?auto_216450 ) ) ( not ( = ?auto_216444 ?auto_216451 ) ) ( not ( = ?auto_216445 ?auto_216446 ) ) ( not ( = ?auto_216445 ?auto_216447 ) ) ( not ( = ?auto_216445 ?auto_216448 ) ) ( not ( = ?auto_216445 ?auto_216449 ) ) ( not ( = ?auto_216445 ?auto_216450 ) ) ( not ( = ?auto_216445 ?auto_216451 ) ) ( not ( = ?auto_216446 ?auto_216447 ) ) ( not ( = ?auto_216446 ?auto_216448 ) ) ( not ( = ?auto_216446 ?auto_216449 ) ) ( not ( = ?auto_216446 ?auto_216450 ) ) ( not ( = ?auto_216446 ?auto_216451 ) ) ( not ( = ?auto_216447 ?auto_216448 ) ) ( not ( = ?auto_216447 ?auto_216449 ) ) ( not ( = ?auto_216447 ?auto_216450 ) ) ( not ( = ?auto_216447 ?auto_216451 ) ) ( not ( = ?auto_216448 ?auto_216449 ) ) ( not ( = ?auto_216448 ?auto_216450 ) ) ( not ( = ?auto_216448 ?auto_216451 ) ) ( not ( = ?auto_216449 ?auto_216450 ) ) ( not ( = ?auto_216449 ?auto_216451 ) ) ( not ( = ?auto_216450 ?auto_216451 ) ) ( ON ?auto_216449 ?auto_216450 ) ( ON ?auto_216448 ?auto_216449 ) ( ON ?auto_216447 ?auto_216448 ) ( CLEAR ?auto_216445 ) ( ON ?auto_216446 ?auto_216447 ) ( CLEAR ?auto_216446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216444 ?auto_216445 ?auto_216446 )
      ( MAKE-7PILE ?auto_216444 ?auto_216445 ?auto_216446 ?auto_216447 ?auto_216448 ?auto_216449 ?auto_216450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216459 - BLOCK
      ?auto_216460 - BLOCK
      ?auto_216461 - BLOCK
      ?auto_216462 - BLOCK
      ?auto_216463 - BLOCK
      ?auto_216464 - BLOCK
      ?auto_216465 - BLOCK
    )
    :vars
    (
      ?auto_216466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216465 ?auto_216466 ) ( ON-TABLE ?auto_216459 ) ( not ( = ?auto_216459 ?auto_216460 ) ) ( not ( = ?auto_216459 ?auto_216461 ) ) ( not ( = ?auto_216459 ?auto_216462 ) ) ( not ( = ?auto_216459 ?auto_216463 ) ) ( not ( = ?auto_216459 ?auto_216464 ) ) ( not ( = ?auto_216459 ?auto_216465 ) ) ( not ( = ?auto_216459 ?auto_216466 ) ) ( not ( = ?auto_216460 ?auto_216461 ) ) ( not ( = ?auto_216460 ?auto_216462 ) ) ( not ( = ?auto_216460 ?auto_216463 ) ) ( not ( = ?auto_216460 ?auto_216464 ) ) ( not ( = ?auto_216460 ?auto_216465 ) ) ( not ( = ?auto_216460 ?auto_216466 ) ) ( not ( = ?auto_216461 ?auto_216462 ) ) ( not ( = ?auto_216461 ?auto_216463 ) ) ( not ( = ?auto_216461 ?auto_216464 ) ) ( not ( = ?auto_216461 ?auto_216465 ) ) ( not ( = ?auto_216461 ?auto_216466 ) ) ( not ( = ?auto_216462 ?auto_216463 ) ) ( not ( = ?auto_216462 ?auto_216464 ) ) ( not ( = ?auto_216462 ?auto_216465 ) ) ( not ( = ?auto_216462 ?auto_216466 ) ) ( not ( = ?auto_216463 ?auto_216464 ) ) ( not ( = ?auto_216463 ?auto_216465 ) ) ( not ( = ?auto_216463 ?auto_216466 ) ) ( not ( = ?auto_216464 ?auto_216465 ) ) ( not ( = ?auto_216464 ?auto_216466 ) ) ( not ( = ?auto_216465 ?auto_216466 ) ) ( ON ?auto_216464 ?auto_216465 ) ( ON ?auto_216463 ?auto_216464 ) ( ON ?auto_216462 ?auto_216463 ) ( ON ?auto_216461 ?auto_216462 ) ( CLEAR ?auto_216459 ) ( ON ?auto_216460 ?auto_216461 ) ( CLEAR ?auto_216460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216459 ?auto_216460 )
      ( MAKE-7PILE ?auto_216459 ?auto_216460 ?auto_216461 ?auto_216462 ?auto_216463 ?auto_216464 ?auto_216465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216474 - BLOCK
      ?auto_216475 - BLOCK
      ?auto_216476 - BLOCK
      ?auto_216477 - BLOCK
      ?auto_216478 - BLOCK
      ?auto_216479 - BLOCK
      ?auto_216480 - BLOCK
    )
    :vars
    (
      ?auto_216481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216480 ?auto_216481 ) ( ON-TABLE ?auto_216474 ) ( not ( = ?auto_216474 ?auto_216475 ) ) ( not ( = ?auto_216474 ?auto_216476 ) ) ( not ( = ?auto_216474 ?auto_216477 ) ) ( not ( = ?auto_216474 ?auto_216478 ) ) ( not ( = ?auto_216474 ?auto_216479 ) ) ( not ( = ?auto_216474 ?auto_216480 ) ) ( not ( = ?auto_216474 ?auto_216481 ) ) ( not ( = ?auto_216475 ?auto_216476 ) ) ( not ( = ?auto_216475 ?auto_216477 ) ) ( not ( = ?auto_216475 ?auto_216478 ) ) ( not ( = ?auto_216475 ?auto_216479 ) ) ( not ( = ?auto_216475 ?auto_216480 ) ) ( not ( = ?auto_216475 ?auto_216481 ) ) ( not ( = ?auto_216476 ?auto_216477 ) ) ( not ( = ?auto_216476 ?auto_216478 ) ) ( not ( = ?auto_216476 ?auto_216479 ) ) ( not ( = ?auto_216476 ?auto_216480 ) ) ( not ( = ?auto_216476 ?auto_216481 ) ) ( not ( = ?auto_216477 ?auto_216478 ) ) ( not ( = ?auto_216477 ?auto_216479 ) ) ( not ( = ?auto_216477 ?auto_216480 ) ) ( not ( = ?auto_216477 ?auto_216481 ) ) ( not ( = ?auto_216478 ?auto_216479 ) ) ( not ( = ?auto_216478 ?auto_216480 ) ) ( not ( = ?auto_216478 ?auto_216481 ) ) ( not ( = ?auto_216479 ?auto_216480 ) ) ( not ( = ?auto_216479 ?auto_216481 ) ) ( not ( = ?auto_216480 ?auto_216481 ) ) ( ON ?auto_216479 ?auto_216480 ) ( ON ?auto_216478 ?auto_216479 ) ( ON ?auto_216477 ?auto_216478 ) ( ON ?auto_216476 ?auto_216477 ) ( CLEAR ?auto_216474 ) ( ON ?auto_216475 ?auto_216476 ) ( CLEAR ?auto_216475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216474 ?auto_216475 )
      ( MAKE-7PILE ?auto_216474 ?auto_216475 ?auto_216476 ?auto_216477 ?auto_216478 ?auto_216479 ?auto_216480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216489 - BLOCK
      ?auto_216490 - BLOCK
      ?auto_216491 - BLOCK
      ?auto_216492 - BLOCK
      ?auto_216493 - BLOCK
      ?auto_216494 - BLOCK
      ?auto_216495 - BLOCK
    )
    :vars
    (
      ?auto_216496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216495 ?auto_216496 ) ( not ( = ?auto_216489 ?auto_216490 ) ) ( not ( = ?auto_216489 ?auto_216491 ) ) ( not ( = ?auto_216489 ?auto_216492 ) ) ( not ( = ?auto_216489 ?auto_216493 ) ) ( not ( = ?auto_216489 ?auto_216494 ) ) ( not ( = ?auto_216489 ?auto_216495 ) ) ( not ( = ?auto_216489 ?auto_216496 ) ) ( not ( = ?auto_216490 ?auto_216491 ) ) ( not ( = ?auto_216490 ?auto_216492 ) ) ( not ( = ?auto_216490 ?auto_216493 ) ) ( not ( = ?auto_216490 ?auto_216494 ) ) ( not ( = ?auto_216490 ?auto_216495 ) ) ( not ( = ?auto_216490 ?auto_216496 ) ) ( not ( = ?auto_216491 ?auto_216492 ) ) ( not ( = ?auto_216491 ?auto_216493 ) ) ( not ( = ?auto_216491 ?auto_216494 ) ) ( not ( = ?auto_216491 ?auto_216495 ) ) ( not ( = ?auto_216491 ?auto_216496 ) ) ( not ( = ?auto_216492 ?auto_216493 ) ) ( not ( = ?auto_216492 ?auto_216494 ) ) ( not ( = ?auto_216492 ?auto_216495 ) ) ( not ( = ?auto_216492 ?auto_216496 ) ) ( not ( = ?auto_216493 ?auto_216494 ) ) ( not ( = ?auto_216493 ?auto_216495 ) ) ( not ( = ?auto_216493 ?auto_216496 ) ) ( not ( = ?auto_216494 ?auto_216495 ) ) ( not ( = ?auto_216494 ?auto_216496 ) ) ( not ( = ?auto_216495 ?auto_216496 ) ) ( ON ?auto_216494 ?auto_216495 ) ( ON ?auto_216493 ?auto_216494 ) ( ON ?auto_216492 ?auto_216493 ) ( ON ?auto_216491 ?auto_216492 ) ( ON ?auto_216490 ?auto_216491 ) ( ON ?auto_216489 ?auto_216490 ) ( CLEAR ?auto_216489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216489 )
      ( MAKE-7PILE ?auto_216489 ?auto_216490 ?auto_216491 ?auto_216492 ?auto_216493 ?auto_216494 ?auto_216495 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_216504 - BLOCK
      ?auto_216505 - BLOCK
      ?auto_216506 - BLOCK
      ?auto_216507 - BLOCK
      ?auto_216508 - BLOCK
      ?auto_216509 - BLOCK
      ?auto_216510 - BLOCK
    )
    :vars
    (
      ?auto_216511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216510 ?auto_216511 ) ( not ( = ?auto_216504 ?auto_216505 ) ) ( not ( = ?auto_216504 ?auto_216506 ) ) ( not ( = ?auto_216504 ?auto_216507 ) ) ( not ( = ?auto_216504 ?auto_216508 ) ) ( not ( = ?auto_216504 ?auto_216509 ) ) ( not ( = ?auto_216504 ?auto_216510 ) ) ( not ( = ?auto_216504 ?auto_216511 ) ) ( not ( = ?auto_216505 ?auto_216506 ) ) ( not ( = ?auto_216505 ?auto_216507 ) ) ( not ( = ?auto_216505 ?auto_216508 ) ) ( not ( = ?auto_216505 ?auto_216509 ) ) ( not ( = ?auto_216505 ?auto_216510 ) ) ( not ( = ?auto_216505 ?auto_216511 ) ) ( not ( = ?auto_216506 ?auto_216507 ) ) ( not ( = ?auto_216506 ?auto_216508 ) ) ( not ( = ?auto_216506 ?auto_216509 ) ) ( not ( = ?auto_216506 ?auto_216510 ) ) ( not ( = ?auto_216506 ?auto_216511 ) ) ( not ( = ?auto_216507 ?auto_216508 ) ) ( not ( = ?auto_216507 ?auto_216509 ) ) ( not ( = ?auto_216507 ?auto_216510 ) ) ( not ( = ?auto_216507 ?auto_216511 ) ) ( not ( = ?auto_216508 ?auto_216509 ) ) ( not ( = ?auto_216508 ?auto_216510 ) ) ( not ( = ?auto_216508 ?auto_216511 ) ) ( not ( = ?auto_216509 ?auto_216510 ) ) ( not ( = ?auto_216509 ?auto_216511 ) ) ( not ( = ?auto_216510 ?auto_216511 ) ) ( ON ?auto_216509 ?auto_216510 ) ( ON ?auto_216508 ?auto_216509 ) ( ON ?auto_216507 ?auto_216508 ) ( ON ?auto_216506 ?auto_216507 ) ( ON ?auto_216505 ?auto_216506 ) ( ON ?auto_216504 ?auto_216505 ) ( CLEAR ?auto_216504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216504 )
      ( MAKE-7PILE ?auto_216504 ?auto_216505 ?auto_216506 ?auto_216507 ?auto_216508 ?auto_216509 ?auto_216510 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216520 - BLOCK
      ?auto_216521 - BLOCK
      ?auto_216522 - BLOCK
      ?auto_216523 - BLOCK
      ?auto_216524 - BLOCK
      ?auto_216525 - BLOCK
      ?auto_216526 - BLOCK
      ?auto_216527 - BLOCK
    )
    :vars
    (
      ?auto_216528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216526 ) ( ON ?auto_216527 ?auto_216528 ) ( CLEAR ?auto_216527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216520 ) ( ON ?auto_216521 ?auto_216520 ) ( ON ?auto_216522 ?auto_216521 ) ( ON ?auto_216523 ?auto_216522 ) ( ON ?auto_216524 ?auto_216523 ) ( ON ?auto_216525 ?auto_216524 ) ( ON ?auto_216526 ?auto_216525 ) ( not ( = ?auto_216520 ?auto_216521 ) ) ( not ( = ?auto_216520 ?auto_216522 ) ) ( not ( = ?auto_216520 ?auto_216523 ) ) ( not ( = ?auto_216520 ?auto_216524 ) ) ( not ( = ?auto_216520 ?auto_216525 ) ) ( not ( = ?auto_216520 ?auto_216526 ) ) ( not ( = ?auto_216520 ?auto_216527 ) ) ( not ( = ?auto_216520 ?auto_216528 ) ) ( not ( = ?auto_216521 ?auto_216522 ) ) ( not ( = ?auto_216521 ?auto_216523 ) ) ( not ( = ?auto_216521 ?auto_216524 ) ) ( not ( = ?auto_216521 ?auto_216525 ) ) ( not ( = ?auto_216521 ?auto_216526 ) ) ( not ( = ?auto_216521 ?auto_216527 ) ) ( not ( = ?auto_216521 ?auto_216528 ) ) ( not ( = ?auto_216522 ?auto_216523 ) ) ( not ( = ?auto_216522 ?auto_216524 ) ) ( not ( = ?auto_216522 ?auto_216525 ) ) ( not ( = ?auto_216522 ?auto_216526 ) ) ( not ( = ?auto_216522 ?auto_216527 ) ) ( not ( = ?auto_216522 ?auto_216528 ) ) ( not ( = ?auto_216523 ?auto_216524 ) ) ( not ( = ?auto_216523 ?auto_216525 ) ) ( not ( = ?auto_216523 ?auto_216526 ) ) ( not ( = ?auto_216523 ?auto_216527 ) ) ( not ( = ?auto_216523 ?auto_216528 ) ) ( not ( = ?auto_216524 ?auto_216525 ) ) ( not ( = ?auto_216524 ?auto_216526 ) ) ( not ( = ?auto_216524 ?auto_216527 ) ) ( not ( = ?auto_216524 ?auto_216528 ) ) ( not ( = ?auto_216525 ?auto_216526 ) ) ( not ( = ?auto_216525 ?auto_216527 ) ) ( not ( = ?auto_216525 ?auto_216528 ) ) ( not ( = ?auto_216526 ?auto_216527 ) ) ( not ( = ?auto_216526 ?auto_216528 ) ) ( not ( = ?auto_216527 ?auto_216528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216527 ?auto_216528 )
      ( !STACK ?auto_216527 ?auto_216526 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216537 - BLOCK
      ?auto_216538 - BLOCK
      ?auto_216539 - BLOCK
      ?auto_216540 - BLOCK
      ?auto_216541 - BLOCK
      ?auto_216542 - BLOCK
      ?auto_216543 - BLOCK
      ?auto_216544 - BLOCK
    )
    :vars
    (
      ?auto_216545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216543 ) ( ON ?auto_216544 ?auto_216545 ) ( CLEAR ?auto_216544 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216537 ) ( ON ?auto_216538 ?auto_216537 ) ( ON ?auto_216539 ?auto_216538 ) ( ON ?auto_216540 ?auto_216539 ) ( ON ?auto_216541 ?auto_216540 ) ( ON ?auto_216542 ?auto_216541 ) ( ON ?auto_216543 ?auto_216542 ) ( not ( = ?auto_216537 ?auto_216538 ) ) ( not ( = ?auto_216537 ?auto_216539 ) ) ( not ( = ?auto_216537 ?auto_216540 ) ) ( not ( = ?auto_216537 ?auto_216541 ) ) ( not ( = ?auto_216537 ?auto_216542 ) ) ( not ( = ?auto_216537 ?auto_216543 ) ) ( not ( = ?auto_216537 ?auto_216544 ) ) ( not ( = ?auto_216537 ?auto_216545 ) ) ( not ( = ?auto_216538 ?auto_216539 ) ) ( not ( = ?auto_216538 ?auto_216540 ) ) ( not ( = ?auto_216538 ?auto_216541 ) ) ( not ( = ?auto_216538 ?auto_216542 ) ) ( not ( = ?auto_216538 ?auto_216543 ) ) ( not ( = ?auto_216538 ?auto_216544 ) ) ( not ( = ?auto_216538 ?auto_216545 ) ) ( not ( = ?auto_216539 ?auto_216540 ) ) ( not ( = ?auto_216539 ?auto_216541 ) ) ( not ( = ?auto_216539 ?auto_216542 ) ) ( not ( = ?auto_216539 ?auto_216543 ) ) ( not ( = ?auto_216539 ?auto_216544 ) ) ( not ( = ?auto_216539 ?auto_216545 ) ) ( not ( = ?auto_216540 ?auto_216541 ) ) ( not ( = ?auto_216540 ?auto_216542 ) ) ( not ( = ?auto_216540 ?auto_216543 ) ) ( not ( = ?auto_216540 ?auto_216544 ) ) ( not ( = ?auto_216540 ?auto_216545 ) ) ( not ( = ?auto_216541 ?auto_216542 ) ) ( not ( = ?auto_216541 ?auto_216543 ) ) ( not ( = ?auto_216541 ?auto_216544 ) ) ( not ( = ?auto_216541 ?auto_216545 ) ) ( not ( = ?auto_216542 ?auto_216543 ) ) ( not ( = ?auto_216542 ?auto_216544 ) ) ( not ( = ?auto_216542 ?auto_216545 ) ) ( not ( = ?auto_216543 ?auto_216544 ) ) ( not ( = ?auto_216543 ?auto_216545 ) ) ( not ( = ?auto_216544 ?auto_216545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216544 ?auto_216545 )
      ( !STACK ?auto_216544 ?auto_216543 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216554 - BLOCK
      ?auto_216555 - BLOCK
      ?auto_216556 - BLOCK
      ?auto_216557 - BLOCK
      ?auto_216558 - BLOCK
      ?auto_216559 - BLOCK
      ?auto_216560 - BLOCK
      ?auto_216561 - BLOCK
    )
    :vars
    (
      ?auto_216562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216561 ?auto_216562 ) ( ON-TABLE ?auto_216554 ) ( ON ?auto_216555 ?auto_216554 ) ( ON ?auto_216556 ?auto_216555 ) ( ON ?auto_216557 ?auto_216556 ) ( ON ?auto_216558 ?auto_216557 ) ( ON ?auto_216559 ?auto_216558 ) ( not ( = ?auto_216554 ?auto_216555 ) ) ( not ( = ?auto_216554 ?auto_216556 ) ) ( not ( = ?auto_216554 ?auto_216557 ) ) ( not ( = ?auto_216554 ?auto_216558 ) ) ( not ( = ?auto_216554 ?auto_216559 ) ) ( not ( = ?auto_216554 ?auto_216560 ) ) ( not ( = ?auto_216554 ?auto_216561 ) ) ( not ( = ?auto_216554 ?auto_216562 ) ) ( not ( = ?auto_216555 ?auto_216556 ) ) ( not ( = ?auto_216555 ?auto_216557 ) ) ( not ( = ?auto_216555 ?auto_216558 ) ) ( not ( = ?auto_216555 ?auto_216559 ) ) ( not ( = ?auto_216555 ?auto_216560 ) ) ( not ( = ?auto_216555 ?auto_216561 ) ) ( not ( = ?auto_216555 ?auto_216562 ) ) ( not ( = ?auto_216556 ?auto_216557 ) ) ( not ( = ?auto_216556 ?auto_216558 ) ) ( not ( = ?auto_216556 ?auto_216559 ) ) ( not ( = ?auto_216556 ?auto_216560 ) ) ( not ( = ?auto_216556 ?auto_216561 ) ) ( not ( = ?auto_216556 ?auto_216562 ) ) ( not ( = ?auto_216557 ?auto_216558 ) ) ( not ( = ?auto_216557 ?auto_216559 ) ) ( not ( = ?auto_216557 ?auto_216560 ) ) ( not ( = ?auto_216557 ?auto_216561 ) ) ( not ( = ?auto_216557 ?auto_216562 ) ) ( not ( = ?auto_216558 ?auto_216559 ) ) ( not ( = ?auto_216558 ?auto_216560 ) ) ( not ( = ?auto_216558 ?auto_216561 ) ) ( not ( = ?auto_216558 ?auto_216562 ) ) ( not ( = ?auto_216559 ?auto_216560 ) ) ( not ( = ?auto_216559 ?auto_216561 ) ) ( not ( = ?auto_216559 ?auto_216562 ) ) ( not ( = ?auto_216560 ?auto_216561 ) ) ( not ( = ?auto_216560 ?auto_216562 ) ) ( not ( = ?auto_216561 ?auto_216562 ) ) ( CLEAR ?auto_216559 ) ( ON ?auto_216560 ?auto_216561 ) ( CLEAR ?auto_216560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216554 ?auto_216555 ?auto_216556 ?auto_216557 ?auto_216558 ?auto_216559 ?auto_216560 )
      ( MAKE-8PILE ?auto_216554 ?auto_216555 ?auto_216556 ?auto_216557 ?auto_216558 ?auto_216559 ?auto_216560 ?auto_216561 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216571 - BLOCK
      ?auto_216572 - BLOCK
      ?auto_216573 - BLOCK
      ?auto_216574 - BLOCK
      ?auto_216575 - BLOCK
      ?auto_216576 - BLOCK
      ?auto_216577 - BLOCK
      ?auto_216578 - BLOCK
    )
    :vars
    (
      ?auto_216579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216578 ?auto_216579 ) ( ON-TABLE ?auto_216571 ) ( ON ?auto_216572 ?auto_216571 ) ( ON ?auto_216573 ?auto_216572 ) ( ON ?auto_216574 ?auto_216573 ) ( ON ?auto_216575 ?auto_216574 ) ( ON ?auto_216576 ?auto_216575 ) ( not ( = ?auto_216571 ?auto_216572 ) ) ( not ( = ?auto_216571 ?auto_216573 ) ) ( not ( = ?auto_216571 ?auto_216574 ) ) ( not ( = ?auto_216571 ?auto_216575 ) ) ( not ( = ?auto_216571 ?auto_216576 ) ) ( not ( = ?auto_216571 ?auto_216577 ) ) ( not ( = ?auto_216571 ?auto_216578 ) ) ( not ( = ?auto_216571 ?auto_216579 ) ) ( not ( = ?auto_216572 ?auto_216573 ) ) ( not ( = ?auto_216572 ?auto_216574 ) ) ( not ( = ?auto_216572 ?auto_216575 ) ) ( not ( = ?auto_216572 ?auto_216576 ) ) ( not ( = ?auto_216572 ?auto_216577 ) ) ( not ( = ?auto_216572 ?auto_216578 ) ) ( not ( = ?auto_216572 ?auto_216579 ) ) ( not ( = ?auto_216573 ?auto_216574 ) ) ( not ( = ?auto_216573 ?auto_216575 ) ) ( not ( = ?auto_216573 ?auto_216576 ) ) ( not ( = ?auto_216573 ?auto_216577 ) ) ( not ( = ?auto_216573 ?auto_216578 ) ) ( not ( = ?auto_216573 ?auto_216579 ) ) ( not ( = ?auto_216574 ?auto_216575 ) ) ( not ( = ?auto_216574 ?auto_216576 ) ) ( not ( = ?auto_216574 ?auto_216577 ) ) ( not ( = ?auto_216574 ?auto_216578 ) ) ( not ( = ?auto_216574 ?auto_216579 ) ) ( not ( = ?auto_216575 ?auto_216576 ) ) ( not ( = ?auto_216575 ?auto_216577 ) ) ( not ( = ?auto_216575 ?auto_216578 ) ) ( not ( = ?auto_216575 ?auto_216579 ) ) ( not ( = ?auto_216576 ?auto_216577 ) ) ( not ( = ?auto_216576 ?auto_216578 ) ) ( not ( = ?auto_216576 ?auto_216579 ) ) ( not ( = ?auto_216577 ?auto_216578 ) ) ( not ( = ?auto_216577 ?auto_216579 ) ) ( not ( = ?auto_216578 ?auto_216579 ) ) ( CLEAR ?auto_216576 ) ( ON ?auto_216577 ?auto_216578 ) ( CLEAR ?auto_216577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216571 ?auto_216572 ?auto_216573 ?auto_216574 ?auto_216575 ?auto_216576 ?auto_216577 )
      ( MAKE-8PILE ?auto_216571 ?auto_216572 ?auto_216573 ?auto_216574 ?auto_216575 ?auto_216576 ?auto_216577 ?auto_216578 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216588 - BLOCK
      ?auto_216589 - BLOCK
      ?auto_216590 - BLOCK
      ?auto_216591 - BLOCK
      ?auto_216592 - BLOCK
      ?auto_216593 - BLOCK
      ?auto_216594 - BLOCK
      ?auto_216595 - BLOCK
    )
    :vars
    (
      ?auto_216596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216595 ?auto_216596 ) ( ON-TABLE ?auto_216588 ) ( ON ?auto_216589 ?auto_216588 ) ( ON ?auto_216590 ?auto_216589 ) ( ON ?auto_216591 ?auto_216590 ) ( ON ?auto_216592 ?auto_216591 ) ( not ( = ?auto_216588 ?auto_216589 ) ) ( not ( = ?auto_216588 ?auto_216590 ) ) ( not ( = ?auto_216588 ?auto_216591 ) ) ( not ( = ?auto_216588 ?auto_216592 ) ) ( not ( = ?auto_216588 ?auto_216593 ) ) ( not ( = ?auto_216588 ?auto_216594 ) ) ( not ( = ?auto_216588 ?auto_216595 ) ) ( not ( = ?auto_216588 ?auto_216596 ) ) ( not ( = ?auto_216589 ?auto_216590 ) ) ( not ( = ?auto_216589 ?auto_216591 ) ) ( not ( = ?auto_216589 ?auto_216592 ) ) ( not ( = ?auto_216589 ?auto_216593 ) ) ( not ( = ?auto_216589 ?auto_216594 ) ) ( not ( = ?auto_216589 ?auto_216595 ) ) ( not ( = ?auto_216589 ?auto_216596 ) ) ( not ( = ?auto_216590 ?auto_216591 ) ) ( not ( = ?auto_216590 ?auto_216592 ) ) ( not ( = ?auto_216590 ?auto_216593 ) ) ( not ( = ?auto_216590 ?auto_216594 ) ) ( not ( = ?auto_216590 ?auto_216595 ) ) ( not ( = ?auto_216590 ?auto_216596 ) ) ( not ( = ?auto_216591 ?auto_216592 ) ) ( not ( = ?auto_216591 ?auto_216593 ) ) ( not ( = ?auto_216591 ?auto_216594 ) ) ( not ( = ?auto_216591 ?auto_216595 ) ) ( not ( = ?auto_216591 ?auto_216596 ) ) ( not ( = ?auto_216592 ?auto_216593 ) ) ( not ( = ?auto_216592 ?auto_216594 ) ) ( not ( = ?auto_216592 ?auto_216595 ) ) ( not ( = ?auto_216592 ?auto_216596 ) ) ( not ( = ?auto_216593 ?auto_216594 ) ) ( not ( = ?auto_216593 ?auto_216595 ) ) ( not ( = ?auto_216593 ?auto_216596 ) ) ( not ( = ?auto_216594 ?auto_216595 ) ) ( not ( = ?auto_216594 ?auto_216596 ) ) ( not ( = ?auto_216595 ?auto_216596 ) ) ( ON ?auto_216594 ?auto_216595 ) ( CLEAR ?auto_216592 ) ( ON ?auto_216593 ?auto_216594 ) ( CLEAR ?auto_216593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216588 ?auto_216589 ?auto_216590 ?auto_216591 ?auto_216592 ?auto_216593 )
      ( MAKE-8PILE ?auto_216588 ?auto_216589 ?auto_216590 ?auto_216591 ?auto_216592 ?auto_216593 ?auto_216594 ?auto_216595 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216605 - BLOCK
      ?auto_216606 - BLOCK
      ?auto_216607 - BLOCK
      ?auto_216608 - BLOCK
      ?auto_216609 - BLOCK
      ?auto_216610 - BLOCK
      ?auto_216611 - BLOCK
      ?auto_216612 - BLOCK
    )
    :vars
    (
      ?auto_216613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216612 ?auto_216613 ) ( ON-TABLE ?auto_216605 ) ( ON ?auto_216606 ?auto_216605 ) ( ON ?auto_216607 ?auto_216606 ) ( ON ?auto_216608 ?auto_216607 ) ( ON ?auto_216609 ?auto_216608 ) ( not ( = ?auto_216605 ?auto_216606 ) ) ( not ( = ?auto_216605 ?auto_216607 ) ) ( not ( = ?auto_216605 ?auto_216608 ) ) ( not ( = ?auto_216605 ?auto_216609 ) ) ( not ( = ?auto_216605 ?auto_216610 ) ) ( not ( = ?auto_216605 ?auto_216611 ) ) ( not ( = ?auto_216605 ?auto_216612 ) ) ( not ( = ?auto_216605 ?auto_216613 ) ) ( not ( = ?auto_216606 ?auto_216607 ) ) ( not ( = ?auto_216606 ?auto_216608 ) ) ( not ( = ?auto_216606 ?auto_216609 ) ) ( not ( = ?auto_216606 ?auto_216610 ) ) ( not ( = ?auto_216606 ?auto_216611 ) ) ( not ( = ?auto_216606 ?auto_216612 ) ) ( not ( = ?auto_216606 ?auto_216613 ) ) ( not ( = ?auto_216607 ?auto_216608 ) ) ( not ( = ?auto_216607 ?auto_216609 ) ) ( not ( = ?auto_216607 ?auto_216610 ) ) ( not ( = ?auto_216607 ?auto_216611 ) ) ( not ( = ?auto_216607 ?auto_216612 ) ) ( not ( = ?auto_216607 ?auto_216613 ) ) ( not ( = ?auto_216608 ?auto_216609 ) ) ( not ( = ?auto_216608 ?auto_216610 ) ) ( not ( = ?auto_216608 ?auto_216611 ) ) ( not ( = ?auto_216608 ?auto_216612 ) ) ( not ( = ?auto_216608 ?auto_216613 ) ) ( not ( = ?auto_216609 ?auto_216610 ) ) ( not ( = ?auto_216609 ?auto_216611 ) ) ( not ( = ?auto_216609 ?auto_216612 ) ) ( not ( = ?auto_216609 ?auto_216613 ) ) ( not ( = ?auto_216610 ?auto_216611 ) ) ( not ( = ?auto_216610 ?auto_216612 ) ) ( not ( = ?auto_216610 ?auto_216613 ) ) ( not ( = ?auto_216611 ?auto_216612 ) ) ( not ( = ?auto_216611 ?auto_216613 ) ) ( not ( = ?auto_216612 ?auto_216613 ) ) ( ON ?auto_216611 ?auto_216612 ) ( CLEAR ?auto_216609 ) ( ON ?auto_216610 ?auto_216611 ) ( CLEAR ?auto_216610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216605 ?auto_216606 ?auto_216607 ?auto_216608 ?auto_216609 ?auto_216610 )
      ( MAKE-8PILE ?auto_216605 ?auto_216606 ?auto_216607 ?auto_216608 ?auto_216609 ?auto_216610 ?auto_216611 ?auto_216612 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216622 - BLOCK
      ?auto_216623 - BLOCK
      ?auto_216624 - BLOCK
      ?auto_216625 - BLOCK
      ?auto_216626 - BLOCK
      ?auto_216627 - BLOCK
      ?auto_216628 - BLOCK
      ?auto_216629 - BLOCK
    )
    :vars
    (
      ?auto_216630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216629 ?auto_216630 ) ( ON-TABLE ?auto_216622 ) ( ON ?auto_216623 ?auto_216622 ) ( ON ?auto_216624 ?auto_216623 ) ( ON ?auto_216625 ?auto_216624 ) ( not ( = ?auto_216622 ?auto_216623 ) ) ( not ( = ?auto_216622 ?auto_216624 ) ) ( not ( = ?auto_216622 ?auto_216625 ) ) ( not ( = ?auto_216622 ?auto_216626 ) ) ( not ( = ?auto_216622 ?auto_216627 ) ) ( not ( = ?auto_216622 ?auto_216628 ) ) ( not ( = ?auto_216622 ?auto_216629 ) ) ( not ( = ?auto_216622 ?auto_216630 ) ) ( not ( = ?auto_216623 ?auto_216624 ) ) ( not ( = ?auto_216623 ?auto_216625 ) ) ( not ( = ?auto_216623 ?auto_216626 ) ) ( not ( = ?auto_216623 ?auto_216627 ) ) ( not ( = ?auto_216623 ?auto_216628 ) ) ( not ( = ?auto_216623 ?auto_216629 ) ) ( not ( = ?auto_216623 ?auto_216630 ) ) ( not ( = ?auto_216624 ?auto_216625 ) ) ( not ( = ?auto_216624 ?auto_216626 ) ) ( not ( = ?auto_216624 ?auto_216627 ) ) ( not ( = ?auto_216624 ?auto_216628 ) ) ( not ( = ?auto_216624 ?auto_216629 ) ) ( not ( = ?auto_216624 ?auto_216630 ) ) ( not ( = ?auto_216625 ?auto_216626 ) ) ( not ( = ?auto_216625 ?auto_216627 ) ) ( not ( = ?auto_216625 ?auto_216628 ) ) ( not ( = ?auto_216625 ?auto_216629 ) ) ( not ( = ?auto_216625 ?auto_216630 ) ) ( not ( = ?auto_216626 ?auto_216627 ) ) ( not ( = ?auto_216626 ?auto_216628 ) ) ( not ( = ?auto_216626 ?auto_216629 ) ) ( not ( = ?auto_216626 ?auto_216630 ) ) ( not ( = ?auto_216627 ?auto_216628 ) ) ( not ( = ?auto_216627 ?auto_216629 ) ) ( not ( = ?auto_216627 ?auto_216630 ) ) ( not ( = ?auto_216628 ?auto_216629 ) ) ( not ( = ?auto_216628 ?auto_216630 ) ) ( not ( = ?auto_216629 ?auto_216630 ) ) ( ON ?auto_216628 ?auto_216629 ) ( ON ?auto_216627 ?auto_216628 ) ( CLEAR ?auto_216625 ) ( ON ?auto_216626 ?auto_216627 ) ( CLEAR ?auto_216626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216622 ?auto_216623 ?auto_216624 ?auto_216625 ?auto_216626 )
      ( MAKE-8PILE ?auto_216622 ?auto_216623 ?auto_216624 ?auto_216625 ?auto_216626 ?auto_216627 ?auto_216628 ?auto_216629 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216639 - BLOCK
      ?auto_216640 - BLOCK
      ?auto_216641 - BLOCK
      ?auto_216642 - BLOCK
      ?auto_216643 - BLOCK
      ?auto_216644 - BLOCK
      ?auto_216645 - BLOCK
      ?auto_216646 - BLOCK
    )
    :vars
    (
      ?auto_216647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216646 ?auto_216647 ) ( ON-TABLE ?auto_216639 ) ( ON ?auto_216640 ?auto_216639 ) ( ON ?auto_216641 ?auto_216640 ) ( ON ?auto_216642 ?auto_216641 ) ( not ( = ?auto_216639 ?auto_216640 ) ) ( not ( = ?auto_216639 ?auto_216641 ) ) ( not ( = ?auto_216639 ?auto_216642 ) ) ( not ( = ?auto_216639 ?auto_216643 ) ) ( not ( = ?auto_216639 ?auto_216644 ) ) ( not ( = ?auto_216639 ?auto_216645 ) ) ( not ( = ?auto_216639 ?auto_216646 ) ) ( not ( = ?auto_216639 ?auto_216647 ) ) ( not ( = ?auto_216640 ?auto_216641 ) ) ( not ( = ?auto_216640 ?auto_216642 ) ) ( not ( = ?auto_216640 ?auto_216643 ) ) ( not ( = ?auto_216640 ?auto_216644 ) ) ( not ( = ?auto_216640 ?auto_216645 ) ) ( not ( = ?auto_216640 ?auto_216646 ) ) ( not ( = ?auto_216640 ?auto_216647 ) ) ( not ( = ?auto_216641 ?auto_216642 ) ) ( not ( = ?auto_216641 ?auto_216643 ) ) ( not ( = ?auto_216641 ?auto_216644 ) ) ( not ( = ?auto_216641 ?auto_216645 ) ) ( not ( = ?auto_216641 ?auto_216646 ) ) ( not ( = ?auto_216641 ?auto_216647 ) ) ( not ( = ?auto_216642 ?auto_216643 ) ) ( not ( = ?auto_216642 ?auto_216644 ) ) ( not ( = ?auto_216642 ?auto_216645 ) ) ( not ( = ?auto_216642 ?auto_216646 ) ) ( not ( = ?auto_216642 ?auto_216647 ) ) ( not ( = ?auto_216643 ?auto_216644 ) ) ( not ( = ?auto_216643 ?auto_216645 ) ) ( not ( = ?auto_216643 ?auto_216646 ) ) ( not ( = ?auto_216643 ?auto_216647 ) ) ( not ( = ?auto_216644 ?auto_216645 ) ) ( not ( = ?auto_216644 ?auto_216646 ) ) ( not ( = ?auto_216644 ?auto_216647 ) ) ( not ( = ?auto_216645 ?auto_216646 ) ) ( not ( = ?auto_216645 ?auto_216647 ) ) ( not ( = ?auto_216646 ?auto_216647 ) ) ( ON ?auto_216645 ?auto_216646 ) ( ON ?auto_216644 ?auto_216645 ) ( CLEAR ?auto_216642 ) ( ON ?auto_216643 ?auto_216644 ) ( CLEAR ?auto_216643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216639 ?auto_216640 ?auto_216641 ?auto_216642 ?auto_216643 )
      ( MAKE-8PILE ?auto_216639 ?auto_216640 ?auto_216641 ?auto_216642 ?auto_216643 ?auto_216644 ?auto_216645 ?auto_216646 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216656 - BLOCK
      ?auto_216657 - BLOCK
      ?auto_216658 - BLOCK
      ?auto_216659 - BLOCK
      ?auto_216660 - BLOCK
      ?auto_216661 - BLOCK
      ?auto_216662 - BLOCK
      ?auto_216663 - BLOCK
    )
    :vars
    (
      ?auto_216664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216663 ?auto_216664 ) ( ON-TABLE ?auto_216656 ) ( ON ?auto_216657 ?auto_216656 ) ( ON ?auto_216658 ?auto_216657 ) ( not ( = ?auto_216656 ?auto_216657 ) ) ( not ( = ?auto_216656 ?auto_216658 ) ) ( not ( = ?auto_216656 ?auto_216659 ) ) ( not ( = ?auto_216656 ?auto_216660 ) ) ( not ( = ?auto_216656 ?auto_216661 ) ) ( not ( = ?auto_216656 ?auto_216662 ) ) ( not ( = ?auto_216656 ?auto_216663 ) ) ( not ( = ?auto_216656 ?auto_216664 ) ) ( not ( = ?auto_216657 ?auto_216658 ) ) ( not ( = ?auto_216657 ?auto_216659 ) ) ( not ( = ?auto_216657 ?auto_216660 ) ) ( not ( = ?auto_216657 ?auto_216661 ) ) ( not ( = ?auto_216657 ?auto_216662 ) ) ( not ( = ?auto_216657 ?auto_216663 ) ) ( not ( = ?auto_216657 ?auto_216664 ) ) ( not ( = ?auto_216658 ?auto_216659 ) ) ( not ( = ?auto_216658 ?auto_216660 ) ) ( not ( = ?auto_216658 ?auto_216661 ) ) ( not ( = ?auto_216658 ?auto_216662 ) ) ( not ( = ?auto_216658 ?auto_216663 ) ) ( not ( = ?auto_216658 ?auto_216664 ) ) ( not ( = ?auto_216659 ?auto_216660 ) ) ( not ( = ?auto_216659 ?auto_216661 ) ) ( not ( = ?auto_216659 ?auto_216662 ) ) ( not ( = ?auto_216659 ?auto_216663 ) ) ( not ( = ?auto_216659 ?auto_216664 ) ) ( not ( = ?auto_216660 ?auto_216661 ) ) ( not ( = ?auto_216660 ?auto_216662 ) ) ( not ( = ?auto_216660 ?auto_216663 ) ) ( not ( = ?auto_216660 ?auto_216664 ) ) ( not ( = ?auto_216661 ?auto_216662 ) ) ( not ( = ?auto_216661 ?auto_216663 ) ) ( not ( = ?auto_216661 ?auto_216664 ) ) ( not ( = ?auto_216662 ?auto_216663 ) ) ( not ( = ?auto_216662 ?auto_216664 ) ) ( not ( = ?auto_216663 ?auto_216664 ) ) ( ON ?auto_216662 ?auto_216663 ) ( ON ?auto_216661 ?auto_216662 ) ( ON ?auto_216660 ?auto_216661 ) ( CLEAR ?auto_216658 ) ( ON ?auto_216659 ?auto_216660 ) ( CLEAR ?auto_216659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216656 ?auto_216657 ?auto_216658 ?auto_216659 )
      ( MAKE-8PILE ?auto_216656 ?auto_216657 ?auto_216658 ?auto_216659 ?auto_216660 ?auto_216661 ?auto_216662 ?auto_216663 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216673 - BLOCK
      ?auto_216674 - BLOCK
      ?auto_216675 - BLOCK
      ?auto_216676 - BLOCK
      ?auto_216677 - BLOCK
      ?auto_216678 - BLOCK
      ?auto_216679 - BLOCK
      ?auto_216680 - BLOCK
    )
    :vars
    (
      ?auto_216681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216680 ?auto_216681 ) ( ON-TABLE ?auto_216673 ) ( ON ?auto_216674 ?auto_216673 ) ( ON ?auto_216675 ?auto_216674 ) ( not ( = ?auto_216673 ?auto_216674 ) ) ( not ( = ?auto_216673 ?auto_216675 ) ) ( not ( = ?auto_216673 ?auto_216676 ) ) ( not ( = ?auto_216673 ?auto_216677 ) ) ( not ( = ?auto_216673 ?auto_216678 ) ) ( not ( = ?auto_216673 ?auto_216679 ) ) ( not ( = ?auto_216673 ?auto_216680 ) ) ( not ( = ?auto_216673 ?auto_216681 ) ) ( not ( = ?auto_216674 ?auto_216675 ) ) ( not ( = ?auto_216674 ?auto_216676 ) ) ( not ( = ?auto_216674 ?auto_216677 ) ) ( not ( = ?auto_216674 ?auto_216678 ) ) ( not ( = ?auto_216674 ?auto_216679 ) ) ( not ( = ?auto_216674 ?auto_216680 ) ) ( not ( = ?auto_216674 ?auto_216681 ) ) ( not ( = ?auto_216675 ?auto_216676 ) ) ( not ( = ?auto_216675 ?auto_216677 ) ) ( not ( = ?auto_216675 ?auto_216678 ) ) ( not ( = ?auto_216675 ?auto_216679 ) ) ( not ( = ?auto_216675 ?auto_216680 ) ) ( not ( = ?auto_216675 ?auto_216681 ) ) ( not ( = ?auto_216676 ?auto_216677 ) ) ( not ( = ?auto_216676 ?auto_216678 ) ) ( not ( = ?auto_216676 ?auto_216679 ) ) ( not ( = ?auto_216676 ?auto_216680 ) ) ( not ( = ?auto_216676 ?auto_216681 ) ) ( not ( = ?auto_216677 ?auto_216678 ) ) ( not ( = ?auto_216677 ?auto_216679 ) ) ( not ( = ?auto_216677 ?auto_216680 ) ) ( not ( = ?auto_216677 ?auto_216681 ) ) ( not ( = ?auto_216678 ?auto_216679 ) ) ( not ( = ?auto_216678 ?auto_216680 ) ) ( not ( = ?auto_216678 ?auto_216681 ) ) ( not ( = ?auto_216679 ?auto_216680 ) ) ( not ( = ?auto_216679 ?auto_216681 ) ) ( not ( = ?auto_216680 ?auto_216681 ) ) ( ON ?auto_216679 ?auto_216680 ) ( ON ?auto_216678 ?auto_216679 ) ( ON ?auto_216677 ?auto_216678 ) ( CLEAR ?auto_216675 ) ( ON ?auto_216676 ?auto_216677 ) ( CLEAR ?auto_216676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216673 ?auto_216674 ?auto_216675 ?auto_216676 )
      ( MAKE-8PILE ?auto_216673 ?auto_216674 ?auto_216675 ?auto_216676 ?auto_216677 ?auto_216678 ?auto_216679 ?auto_216680 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216690 - BLOCK
      ?auto_216691 - BLOCK
      ?auto_216692 - BLOCK
      ?auto_216693 - BLOCK
      ?auto_216694 - BLOCK
      ?auto_216695 - BLOCK
      ?auto_216696 - BLOCK
      ?auto_216697 - BLOCK
    )
    :vars
    (
      ?auto_216698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216697 ?auto_216698 ) ( ON-TABLE ?auto_216690 ) ( ON ?auto_216691 ?auto_216690 ) ( not ( = ?auto_216690 ?auto_216691 ) ) ( not ( = ?auto_216690 ?auto_216692 ) ) ( not ( = ?auto_216690 ?auto_216693 ) ) ( not ( = ?auto_216690 ?auto_216694 ) ) ( not ( = ?auto_216690 ?auto_216695 ) ) ( not ( = ?auto_216690 ?auto_216696 ) ) ( not ( = ?auto_216690 ?auto_216697 ) ) ( not ( = ?auto_216690 ?auto_216698 ) ) ( not ( = ?auto_216691 ?auto_216692 ) ) ( not ( = ?auto_216691 ?auto_216693 ) ) ( not ( = ?auto_216691 ?auto_216694 ) ) ( not ( = ?auto_216691 ?auto_216695 ) ) ( not ( = ?auto_216691 ?auto_216696 ) ) ( not ( = ?auto_216691 ?auto_216697 ) ) ( not ( = ?auto_216691 ?auto_216698 ) ) ( not ( = ?auto_216692 ?auto_216693 ) ) ( not ( = ?auto_216692 ?auto_216694 ) ) ( not ( = ?auto_216692 ?auto_216695 ) ) ( not ( = ?auto_216692 ?auto_216696 ) ) ( not ( = ?auto_216692 ?auto_216697 ) ) ( not ( = ?auto_216692 ?auto_216698 ) ) ( not ( = ?auto_216693 ?auto_216694 ) ) ( not ( = ?auto_216693 ?auto_216695 ) ) ( not ( = ?auto_216693 ?auto_216696 ) ) ( not ( = ?auto_216693 ?auto_216697 ) ) ( not ( = ?auto_216693 ?auto_216698 ) ) ( not ( = ?auto_216694 ?auto_216695 ) ) ( not ( = ?auto_216694 ?auto_216696 ) ) ( not ( = ?auto_216694 ?auto_216697 ) ) ( not ( = ?auto_216694 ?auto_216698 ) ) ( not ( = ?auto_216695 ?auto_216696 ) ) ( not ( = ?auto_216695 ?auto_216697 ) ) ( not ( = ?auto_216695 ?auto_216698 ) ) ( not ( = ?auto_216696 ?auto_216697 ) ) ( not ( = ?auto_216696 ?auto_216698 ) ) ( not ( = ?auto_216697 ?auto_216698 ) ) ( ON ?auto_216696 ?auto_216697 ) ( ON ?auto_216695 ?auto_216696 ) ( ON ?auto_216694 ?auto_216695 ) ( ON ?auto_216693 ?auto_216694 ) ( CLEAR ?auto_216691 ) ( ON ?auto_216692 ?auto_216693 ) ( CLEAR ?auto_216692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216690 ?auto_216691 ?auto_216692 )
      ( MAKE-8PILE ?auto_216690 ?auto_216691 ?auto_216692 ?auto_216693 ?auto_216694 ?auto_216695 ?auto_216696 ?auto_216697 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216707 - BLOCK
      ?auto_216708 - BLOCK
      ?auto_216709 - BLOCK
      ?auto_216710 - BLOCK
      ?auto_216711 - BLOCK
      ?auto_216712 - BLOCK
      ?auto_216713 - BLOCK
      ?auto_216714 - BLOCK
    )
    :vars
    (
      ?auto_216715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216714 ?auto_216715 ) ( ON-TABLE ?auto_216707 ) ( ON ?auto_216708 ?auto_216707 ) ( not ( = ?auto_216707 ?auto_216708 ) ) ( not ( = ?auto_216707 ?auto_216709 ) ) ( not ( = ?auto_216707 ?auto_216710 ) ) ( not ( = ?auto_216707 ?auto_216711 ) ) ( not ( = ?auto_216707 ?auto_216712 ) ) ( not ( = ?auto_216707 ?auto_216713 ) ) ( not ( = ?auto_216707 ?auto_216714 ) ) ( not ( = ?auto_216707 ?auto_216715 ) ) ( not ( = ?auto_216708 ?auto_216709 ) ) ( not ( = ?auto_216708 ?auto_216710 ) ) ( not ( = ?auto_216708 ?auto_216711 ) ) ( not ( = ?auto_216708 ?auto_216712 ) ) ( not ( = ?auto_216708 ?auto_216713 ) ) ( not ( = ?auto_216708 ?auto_216714 ) ) ( not ( = ?auto_216708 ?auto_216715 ) ) ( not ( = ?auto_216709 ?auto_216710 ) ) ( not ( = ?auto_216709 ?auto_216711 ) ) ( not ( = ?auto_216709 ?auto_216712 ) ) ( not ( = ?auto_216709 ?auto_216713 ) ) ( not ( = ?auto_216709 ?auto_216714 ) ) ( not ( = ?auto_216709 ?auto_216715 ) ) ( not ( = ?auto_216710 ?auto_216711 ) ) ( not ( = ?auto_216710 ?auto_216712 ) ) ( not ( = ?auto_216710 ?auto_216713 ) ) ( not ( = ?auto_216710 ?auto_216714 ) ) ( not ( = ?auto_216710 ?auto_216715 ) ) ( not ( = ?auto_216711 ?auto_216712 ) ) ( not ( = ?auto_216711 ?auto_216713 ) ) ( not ( = ?auto_216711 ?auto_216714 ) ) ( not ( = ?auto_216711 ?auto_216715 ) ) ( not ( = ?auto_216712 ?auto_216713 ) ) ( not ( = ?auto_216712 ?auto_216714 ) ) ( not ( = ?auto_216712 ?auto_216715 ) ) ( not ( = ?auto_216713 ?auto_216714 ) ) ( not ( = ?auto_216713 ?auto_216715 ) ) ( not ( = ?auto_216714 ?auto_216715 ) ) ( ON ?auto_216713 ?auto_216714 ) ( ON ?auto_216712 ?auto_216713 ) ( ON ?auto_216711 ?auto_216712 ) ( ON ?auto_216710 ?auto_216711 ) ( CLEAR ?auto_216708 ) ( ON ?auto_216709 ?auto_216710 ) ( CLEAR ?auto_216709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_216707 ?auto_216708 ?auto_216709 )
      ( MAKE-8PILE ?auto_216707 ?auto_216708 ?auto_216709 ?auto_216710 ?auto_216711 ?auto_216712 ?auto_216713 ?auto_216714 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216724 - BLOCK
      ?auto_216725 - BLOCK
      ?auto_216726 - BLOCK
      ?auto_216727 - BLOCK
      ?auto_216728 - BLOCK
      ?auto_216729 - BLOCK
      ?auto_216730 - BLOCK
      ?auto_216731 - BLOCK
    )
    :vars
    (
      ?auto_216732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216731 ?auto_216732 ) ( ON-TABLE ?auto_216724 ) ( not ( = ?auto_216724 ?auto_216725 ) ) ( not ( = ?auto_216724 ?auto_216726 ) ) ( not ( = ?auto_216724 ?auto_216727 ) ) ( not ( = ?auto_216724 ?auto_216728 ) ) ( not ( = ?auto_216724 ?auto_216729 ) ) ( not ( = ?auto_216724 ?auto_216730 ) ) ( not ( = ?auto_216724 ?auto_216731 ) ) ( not ( = ?auto_216724 ?auto_216732 ) ) ( not ( = ?auto_216725 ?auto_216726 ) ) ( not ( = ?auto_216725 ?auto_216727 ) ) ( not ( = ?auto_216725 ?auto_216728 ) ) ( not ( = ?auto_216725 ?auto_216729 ) ) ( not ( = ?auto_216725 ?auto_216730 ) ) ( not ( = ?auto_216725 ?auto_216731 ) ) ( not ( = ?auto_216725 ?auto_216732 ) ) ( not ( = ?auto_216726 ?auto_216727 ) ) ( not ( = ?auto_216726 ?auto_216728 ) ) ( not ( = ?auto_216726 ?auto_216729 ) ) ( not ( = ?auto_216726 ?auto_216730 ) ) ( not ( = ?auto_216726 ?auto_216731 ) ) ( not ( = ?auto_216726 ?auto_216732 ) ) ( not ( = ?auto_216727 ?auto_216728 ) ) ( not ( = ?auto_216727 ?auto_216729 ) ) ( not ( = ?auto_216727 ?auto_216730 ) ) ( not ( = ?auto_216727 ?auto_216731 ) ) ( not ( = ?auto_216727 ?auto_216732 ) ) ( not ( = ?auto_216728 ?auto_216729 ) ) ( not ( = ?auto_216728 ?auto_216730 ) ) ( not ( = ?auto_216728 ?auto_216731 ) ) ( not ( = ?auto_216728 ?auto_216732 ) ) ( not ( = ?auto_216729 ?auto_216730 ) ) ( not ( = ?auto_216729 ?auto_216731 ) ) ( not ( = ?auto_216729 ?auto_216732 ) ) ( not ( = ?auto_216730 ?auto_216731 ) ) ( not ( = ?auto_216730 ?auto_216732 ) ) ( not ( = ?auto_216731 ?auto_216732 ) ) ( ON ?auto_216730 ?auto_216731 ) ( ON ?auto_216729 ?auto_216730 ) ( ON ?auto_216728 ?auto_216729 ) ( ON ?auto_216727 ?auto_216728 ) ( ON ?auto_216726 ?auto_216727 ) ( CLEAR ?auto_216724 ) ( ON ?auto_216725 ?auto_216726 ) ( CLEAR ?auto_216725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216724 ?auto_216725 )
      ( MAKE-8PILE ?auto_216724 ?auto_216725 ?auto_216726 ?auto_216727 ?auto_216728 ?auto_216729 ?auto_216730 ?auto_216731 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216741 - BLOCK
      ?auto_216742 - BLOCK
      ?auto_216743 - BLOCK
      ?auto_216744 - BLOCK
      ?auto_216745 - BLOCK
      ?auto_216746 - BLOCK
      ?auto_216747 - BLOCK
      ?auto_216748 - BLOCK
    )
    :vars
    (
      ?auto_216749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216748 ?auto_216749 ) ( ON-TABLE ?auto_216741 ) ( not ( = ?auto_216741 ?auto_216742 ) ) ( not ( = ?auto_216741 ?auto_216743 ) ) ( not ( = ?auto_216741 ?auto_216744 ) ) ( not ( = ?auto_216741 ?auto_216745 ) ) ( not ( = ?auto_216741 ?auto_216746 ) ) ( not ( = ?auto_216741 ?auto_216747 ) ) ( not ( = ?auto_216741 ?auto_216748 ) ) ( not ( = ?auto_216741 ?auto_216749 ) ) ( not ( = ?auto_216742 ?auto_216743 ) ) ( not ( = ?auto_216742 ?auto_216744 ) ) ( not ( = ?auto_216742 ?auto_216745 ) ) ( not ( = ?auto_216742 ?auto_216746 ) ) ( not ( = ?auto_216742 ?auto_216747 ) ) ( not ( = ?auto_216742 ?auto_216748 ) ) ( not ( = ?auto_216742 ?auto_216749 ) ) ( not ( = ?auto_216743 ?auto_216744 ) ) ( not ( = ?auto_216743 ?auto_216745 ) ) ( not ( = ?auto_216743 ?auto_216746 ) ) ( not ( = ?auto_216743 ?auto_216747 ) ) ( not ( = ?auto_216743 ?auto_216748 ) ) ( not ( = ?auto_216743 ?auto_216749 ) ) ( not ( = ?auto_216744 ?auto_216745 ) ) ( not ( = ?auto_216744 ?auto_216746 ) ) ( not ( = ?auto_216744 ?auto_216747 ) ) ( not ( = ?auto_216744 ?auto_216748 ) ) ( not ( = ?auto_216744 ?auto_216749 ) ) ( not ( = ?auto_216745 ?auto_216746 ) ) ( not ( = ?auto_216745 ?auto_216747 ) ) ( not ( = ?auto_216745 ?auto_216748 ) ) ( not ( = ?auto_216745 ?auto_216749 ) ) ( not ( = ?auto_216746 ?auto_216747 ) ) ( not ( = ?auto_216746 ?auto_216748 ) ) ( not ( = ?auto_216746 ?auto_216749 ) ) ( not ( = ?auto_216747 ?auto_216748 ) ) ( not ( = ?auto_216747 ?auto_216749 ) ) ( not ( = ?auto_216748 ?auto_216749 ) ) ( ON ?auto_216747 ?auto_216748 ) ( ON ?auto_216746 ?auto_216747 ) ( ON ?auto_216745 ?auto_216746 ) ( ON ?auto_216744 ?auto_216745 ) ( ON ?auto_216743 ?auto_216744 ) ( CLEAR ?auto_216741 ) ( ON ?auto_216742 ?auto_216743 ) ( CLEAR ?auto_216742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_216741 ?auto_216742 )
      ( MAKE-8PILE ?auto_216741 ?auto_216742 ?auto_216743 ?auto_216744 ?auto_216745 ?auto_216746 ?auto_216747 ?auto_216748 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216758 - BLOCK
      ?auto_216759 - BLOCK
      ?auto_216760 - BLOCK
      ?auto_216761 - BLOCK
      ?auto_216762 - BLOCK
      ?auto_216763 - BLOCK
      ?auto_216764 - BLOCK
      ?auto_216765 - BLOCK
    )
    :vars
    (
      ?auto_216766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216765 ?auto_216766 ) ( not ( = ?auto_216758 ?auto_216759 ) ) ( not ( = ?auto_216758 ?auto_216760 ) ) ( not ( = ?auto_216758 ?auto_216761 ) ) ( not ( = ?auto_216758 ?auto_216762 ) ) ( not ( = ?auto_216758 ?auto_216763 ) ) ( not ( = ?auto_216758 ?auto_216764 ) ) ( not ( = ?auto_216758 ?auto_216765 ) ) ( not ( = ?auto_216758 ?auto_216766 ) ) ( not ( = ?auto_216759 ?auto_216760 ) ) ( not ( = ?auto_216759 ?auto_216761 ) ) ( not ( = ?auto_216759 ?auto_216762 ) ) ( not ( = ?auto_216759 ?auto_216763 ) ) ( not ( = ?auto_216759 ?auto_216764 ) ) ( not ( = ?auto_216759 ?auto_216765 ) ) ( not ( = ?auto_216759 ?auto_216766 ) ) ( not ( = ?auto_216760 ?auto_216761 ) ) ( not ( = ?auto_216760 ?auto_216762 ) ) ( not ( = ?auto_216760 ?auto_216763 ) ) ( not ( = ?auto_216760 ?auto_216764 ) ) ( not ( = ?auto_216760 ?auto_216765 ) ) ( not ( = ?auto_216760 ?auto_216766 ) ) ( not ( = ?auto_216761 ?auto_216762 ) ) ( not ( = ?auto_216761 ?auto_216763 ) ) ( not ( = ?auto_216761 ?auto_216764 ) ) ( not ( = ?auto_216761 ?auto_216765 ) ) ( not ( = ?auto_216761 ?auto_216766 ) ) ( not ( = ?auto_216762 ?auto_216763 ) ) ( not ( = ?auto_216762 ?auto_216764 ) ) ( not ( = ?auto_216762 ?auto_216765 ) ) ( not ( = ?auto_216762 ?auto_216766 ) ) ( not ( = ?auto_216763 ?auto_216764 ) ) ( not ( = ?auto_216763 ?auto_216765 ) ) ( not ( = ?auto_216763 ?auto_216766 ) ) ( not ( = ?auto_216764 ?auto_216765 ) ) ( not ( = ?auto_216764 ?auto_216766 ) ) ( not ( = ?auto_216765 ?auto_216766 ) ) ( ON ?auto_216764 ?auto_216765 ) ( ON ?auto_216763 ?auto_216764 ) ( ON ?auto_216762 ?auto_216763 ) ( ON ?auto_216761 ?auto_216762 ) ( ON ?auto_216760 ?auto_216761 ) ( ON ?auto_216759 ?auto_216760 ) ( ON ?auto_216758 ?auto_216759 ) ( CLEAR ?auto_216758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216758 )
      ( MAKE-8PILE ?auto_216758 ?auto_216759 ?auto_216760 ?auto_216761 ?auto_216762 ?auto_216763 ?auto_216764 ?auto_216765 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_216775 - BLOCK
      ?auto_216776 - BLOCK
      ?auto_216777 - BLOCK
      ?auto_216778 - BLOCK
      ?auto_216779 - BLOCK
      ?auto_216780 - BLOCK
      ?auto_216781 - BLOCK
      ?auto_216782 - BLOCK
    )
    :vars
    (
      ?auto_216783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216782 ?auto_216783 ) ( not ( = ?auto_216775 ?auto_216776 ) ) ( not ( = ?auto_216775 ?auto_216777 ) ) ( not ( = ?auto_216775 ?auto_216778 ) ) ( not ( = ?auto_216775 ?auto_216779 ) ) ( not ( = ?auto_216775 ?auto_216780 ) ) ( not ( = ?auto_216775 ?auto_216781 ) ) ( not ( = ?auto_216775 ?auto_216782 ) ) ( not ( = ?auto_216775 ?auto_216783 ) ) ( not ( = ?auto_216776 ?auto_216777 ) ) ( not ( = ?auto_216776 ?auto_216778 ) ) ( not ( = ?auto_216776 ?auto_216779 ) ) ( not ( = ?auto_216776 ?auto_216780 ) ) ( not ( = ?auto_216776 ?auto_216781 ) ) ( not ( = ?auto_216776 ?auto_216782 ) ) ( not ( = ?auto_216776 ?auto_216783 ) ) ( not ( = ?auto_216777 ?auto_216778 ) ) ( not ( = ?auto_216777 ?auto_216779 ) ) ( not ( = ?auto_216777 ?auto_216780 ) ) ( not ( = ?auto_216777 ?auto_216781 ) ) ( not ( = ?auto_216777 ?auto_216782 ) ) ( not ( = ?auto_216777 ?auto_216783 ) ) ( not ( = ?auto_216778 ?auto_216779 ) ) ( not ( = ?auto_216778 ?auto_216780 ) ) ( not ( = ?auto_216778 ?auto_216781 ) ) ( not ( = ?auto_216778 ?auto_216782 ) ) ( not ( = ?auto_216778 ?auto_216783 ) ) ( not ( = ?auto_216779 ?auto_216780 ) ) ( not ( = ?auto_216779 ?auto_216781 ) ) ( not ( = ?auto_216779 ?auto_216782 ) ) ( not ( = ?auto_216779 ?auto_216783 ) ) ( not ( = ?auto_216780 ?auto_216781 ) ) ( not ( = ?auto_216780 ?auto_216782 ) ) ( not ( = ?auto_216780 ?auto_216783 ) ) ( not ( = ?auto_216781 ?auto_216782 ) ) ( not ( = ?auto_216781 ?auto_216783 ) ) ( not ( = ?auto_216782 ?auto_216783 ) ) ( ON ?auto_216781 ?auto_216782 ) ( ON ?auto_216780 ?auto_216781 ) ( ON ?auto_216779 ?auto_216780 ) ( ON ?auto_216778 ?auto_216779 ) ( ON ?auto_216777 ?auto_216778 ) ( ON ?auto_216776 ?auto_216777 ) ( ON ?auto_216775 ?auto_216776 ) ( CLEAR ?auto_216775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_216775 )
      ( MAKE-8PILE ?auto_216775 ?auto_216776 ?auto_216777 ?auto_216778 ?auto_216779 ?auto_216780 ?auto_216781 ?auto_216782 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216793 - BLOCK
      ?auto_216794 - BLOCK
      ?auto_216795 - BLOCK
      ?auto_216796 - BLOCK
      ?auto_216797 - BLOCK
      ?auto_216798 - BLOCK
      ?auto_216799 - BLOCK
      ?auto_216800 - BLOCK
      ?auto_216801 - BLOCK
    )
    :vars
    (
      ?auto_216802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216800 ) ( ON ?auto_216801 ?auto_216802 ) ( CLEAR ?auto_216801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216793 ) ( ON ?auto_216794 ?auto_216793 ) ( ON ?auto_216795 ?auto_216794 ) ( ON ?auto_216796 ?auto_216795 ) ( ON ?auto_216797 ?auto_216796 ) ( ON ?auto_216798 ?auto_216797 ) ( ON ?auto_216799 ?auto_216798 ) ( ON ?auto_216800 ?auto_216799 ) ( not ( = ?auto_216793 ?auto_216794 ) ) ( not ( = ?auto_216793 ?auto_216795 ) ) ( not ( = ?auto_216793 ?auto_216796 ) ) ( not ( = ?auto_216793 ?auto_216797 ) ) ( not ( = ?auto_216793 ?auto_216798 ) ) ( not ( = ?auto_216793 ?auto_216799 ) ) ( not ( = ?auto_216793 ?auto_216800 ) ) ( not ( = ?auto_216793 ?auto_216801 ) ) ( not ( = ?auto_216793 ?auto_216802 ) ) ( not ( = ?auto_216794 ?auto_216795 ) ) ( not ( = ?auto_216794 ?auto_216796 ) ) ( not ( = ?auto_216794 ?auto_216797 ) ) ( not ( = ?auto_216794 ?auto_216798 ) ) ( not ( = ?auto_216794 ?auto_216799 ) ) ( not ( = ?auto_216794 ?auto_216800 ) ) ( not ( = ?auto_216794 ?auto_216801 ) ) ( not ( = ?auto_216794 ?auto_216802 ) ) ( not ( = ?auto_216795 ?auto_216796 ) ) ( not ( = ?auto_216795 ?auto_216797 ) ) ( not ( = ?auto_216795 ?auto_216798 ) ) ( not ( = ?auto_216795 ?auto_216799 ) ) ( not ( = ?auto_216795 ?auto_216800 ) ) ( not ( = ?auto_216795 ?auto_216801 ) ) ( not ( = ?auto_216795 ?auto_216802 ) ) ( not ( = ?auto_216796 ?auto_216797 ) ) ( not ( = ?auto_216796 ?auto_216798 ) ) ( not ( = ?auto_216796 ?auto_216799 ) ) ( not ( = ?auto_216796 ?auto_216800 ) ) ( not ( = ?auto_216796 ?auto_216801 ) ) ( not ( = ?auto_216796 ?auto_216802 ) ) ( not ( = ?auto_216797 ?auto_216798 ) ) ( not ( = ?auto_216797 ?auto_216799 ) ) ( not ( = ?auto_216797 ?auto_216800 ) ) ( not ( = ?auto_216797 ?auto_216801 ) ) ( not ( = ?auto_216797 ?auto_216802 ) ) ( not ( = ?auto_216798 ?auto_216799 ) ) ( not ( = ?auto_216798 ?auto_216800 ) ) ( not ( = ?auto_216798 ?auto_216801 ) ) ( not ( = ?auto_216798 ?auto_216802 ) ) ( not ( = ?auto_216799 ?auto_216800 ) ) ( not ( = ?auto_216799 ?auto_216801 ) ) ( not ( = ?auto_216799 ?auto_216802 ) ) ( not ( = ?auto_216800 ?auto_216801 ) ) ( not ( = ?auto_216800 ?auto_216802 ) ) ( not ( = ?auto_216801 ?auto_216802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216801 ?auto_216802 )
      ( !STACK ?auto_216801 ?auto_216800 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216812 - BLOCK
      ?auto_216813 - BLOCK
      ?auto_216814 - BLOCK
      ?auto_216815 - BLOCK
      ?auto_216816 - BLOCK
      ?auto_216817 - BLOCK
      ?auto_216818 - BLOCK
      ?auto_216819 - BLOCK
      ?auto_216820 - BLOCK
    )
    :vars
    (
      ?auto_216821 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_216819 ) ( ON ?auto_216820 ?auto_216821 ) ( CLEAR ?auto_216820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_216812 ) ( ON ?auto_216813 ?auto_216812 ) ( ON ?auto_216814 ?auto_216813 ) ( ON ?auto_216815 ?auto_216814 ) ( ON ?auto_216816 ?auto_216815 ) ( ON ?auto_216817 ?auto_216816 ) ( ON ?auto_216818 ?auto_216817 ) ( ON ?auto_216819 ?auto_216818 ) ( not ( = ?auto_216812 ?auto_216813 ) ) ( not ( = ?auto_216812 ?auto_216814 ) ) ( not ( = ?auto_216812 ?auto_216815 ) ) ( not ( = ?auto_216812 ?auto_216816 ) ) ( not ( = ?auto_216812 ?auto_216817 ) ) ( not ( = ?auto_216812 ?auto_216818 ) ) ( not ( = ?auto_216812 ?auto_216819 ) ) ( not ( = ?auto_216812 ?auto_216820 ) ) ( not ( = ?auto_216812 ?auto_216821 ) ) ( not ( = ?auto_216813 ?auto_216814 ) ) ( not ( = ?auto_216813 ?auto_216815 ) ) ( not ( = ?auto_216813 ?auto_216816 ) ) ( not ( = ?auto_216813 ?auto_216817 ) ) ( not ( = ?auto_216813 ?auto_216818 ) ) ( not ( = ?auto_216813 ?auto_216819 ) ) ( not ( = ?auto_216813 ?auto_216820 ) ) ( not ( = ?auto_216813 ?auto_216821 ) ) ( not ( = ?auto_216814 ?auto_216815 ) ) ( not ( = ?auto_216814 ?auto_216816 ) ) ( not ( = ?auto_216814 ?auto_216817 ) ) ( not ( = ?auto_216814 ?auto_216818 ) ) ( not ( = ?auto_216814 ?auto_216819 ) ) ( not ( = ?auto_216814 ?auto_216820 ) ) ( not ( = ?auto_216814 ?auto_216821 ) ) ( not ( = ?auto_216815 ?auto_216816 ) ) ( not ( = ?auto_216815 ?auto_216817 ) ) ( not ( = ?auto_216815 ?auto_216818 ) ) ( not ( = ?auto_216815 ?auto_216819 ) ) ( not ( = ?auto_216815 ?auto_216820 ) ) ( not ( = ?auto_216815 ?auto_216821 ) ) ( not ( = ?auto_216816 ?auto_216817 ) ) ( not ( = ?auto_216816 ?auto_216818 ) ) ( not ( = ?auto_216816 ?auto_216819 ) ) ( not ( = ?auto_216816 ?auto_216820 ) ) ( not ( = ?auto_216816 ?auto_216821 ) ) ( not ( = ?auto_216817 ?auto_216818 ) ) ( not ( = ?auto_216817 ?auto_216819 ) ) ( not ( = ?auto_216817 ?auto_216820 ) ) ( not ( = ?auto_216817 ?auto_216821 ) ) ( not ( = ?auto_216818 ?auto_216819 ) ) ( not ( = ?auto_216818 ?auto_216820 ) ) ( not ( = ?auto_216818 ?auto_216821 ) ) ( not ( = ?auto_216819 ?auto_216820 ) ) ( not ( = ?auto_216819 ?auto_216821 ) ) ( not ( = ?auto_216820 ?auto_216821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_216820 ?auto_216821 )
      ( !STACK ?auto_216820 ?auto_216819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216831 - BLOCK
      ?auto_216832 - BLOCK
      ?auto_216833 - BLOCK
      ?auto_216834 - BLOCK
      ?auto_216835 - BLOCK
      ?auto_216836 - BLOCK
      ?auto_216837 - BLOCK
      ?auto_216838 - BLOCK
      ?auto_216839 - BLOCK
    )
    :vars
    (
      ?auto_216840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216839 ?auto_216840 ) ( ON-TABLE ?auto_216831 ) ( ON ?auto_216832 ?auto_216831 ) ( ON ?auto_216833 ?auto_216832 ) ( ON ?auto_216834 ?auto_216833 ) ( ON ?auto_216835 ?auto_216834 ) ( ON ?auto_216836 ?auto_216835 ) ( ON ?auto_216837 ?auto_216836 ) ( not ( = ?auto_216831 ?auto_216832 ) ) ( not ( = ?auto_216831 ?auto_216833 ) ) ( not ( = ?auto_216831 ?auto_216834 ) ) ( not ( = ?auto_216831 ?auto_216835 ) ) ( not ( = ?auto_216831 ?auto_216836 ) ) ( not ( = ?auto_216831 ?auto_216837 ) ) ( not ( = ?auto_216831 ?auto_216838 ) ) ( not ( = ?auto_216831 ?auto_216839 ) ) ( not ( = ?auto_216831 ?auto_216840 ) ) ( not ( = ?auto_216832 ?auto_216833 ) ) ( not ( = ?auto_216832 ?auto_216834 ) ) ( not ( = ?auto_216832 ?auto_216835 ) ) ( not ( = ?auto_216832 ?auto_216836 ) ) ( not ( = ?auto_216832 ?auto_216837 ) ) ( not ( = ?auto_216832 ?auto_216838 ) ) ( not ( = ?auto_216832 ?auto_216839 ) ) ( not ( = ?auto_216832 ?auto_216840 ) ) ( not ( = ?auto_216833 ?auto_216834 ) ) ( not ( = ?auto_216833 ?auto_216835 ) ) ( not ( = ?auto_216833 ?auto_216836 ) ) ( not ( = ?auto_216833 ?auto_216837 ) ) ( not ( = ?auto_216833 ?auto_216838 ) ) ( not ( = ?auto_216833 ?auto_216839 ) ) ( not ( = ?auto_216833 ?auto_216840 ) ) ( not ( = ?auto_216834 ?auto_216835 ) ) ( not ( = ?auto_216834 ?auto_216836 ) ) ( not ( = ?auto_216834 ?auto_216837 ) ) ( not ( = ?auto_216834 ?auto_216838 ) ) ( not ( = ?auto_216834 ?auto_216839 ) ) ( not ( = ?auto_216834 ?auto_216840 ) ) ( not ( = ?auto_216835 ?auto_216836 ) ) ( not ( = ?auto_216835 ?auto_216837 ) ) ( not ( = ?auto_216835 ?auto_216838 ) ) ( not ( = ?auto_216835 ?auto_216839 ) ) ( not ( = ?auto_216835 ?auto_216840 ) ) ( not ( = ?auto_216836 ?auto_216837 ) ) ( not ( = ?auto_216836 ?auto_216838 ) ) ( not ( = ?auto_216836 ?auto_216839 ) ) ( not ( = ?auto_216836 ?auto_216840 ) ) ( not ( = ?auto_216837 ?auto_216838 ) ) ( not ( = ?auto_216837 ?auto_216839 ) ) ( not ( = ?auto_216837 ?auto_216840 ) ) ( not ( = ?auto_216838 ?auto_216839 ) ) ( not ( = ?auto_216838 ?auto_216840 ) ) ( not ( = ?auto_216839 ?auto_216840 ) ) ( CLEAR ?auto_216837 ) ( ON ?auto_216838 ?auto_216839 ) ( CLEAR ?auto_216838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216831 ?auto_216832 ?auto_216833 ?auto_216834 ?auto_216835 ?auto_216836 ?auto_216837 ?auto_216838 )
      ( MAKE-9PILE ?auto_216831 ?auto_216832 ?auto_216833 ?auto_216834 ?auto_216835 ?auto_216836 ?auto_216837 ?auto_216838 ?auto_216839 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216850 - BLOCK
      ?auto_216851 - BLOCK
      ?auto_216852 - BLOCK
      ?auto_216853 - BLOCK
      ?auto_216854 - BLOCK
      ?auto_216855 - BLOCK
      ?auto_216856 - BLOCK
      ?auto_216857 - BLOCK
      ?auto_216858 - BLOCK
    )
    :vars
    (
      ?auto_216859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216858 ?auto_216859 ) ( ON-TABLE ?auto_216850 ) ( ON ?auto_216851 ?auto_216850 ) ( ON ?auto_216852 ?auto_216851 ) ( ON ?auto_216853 ?auto_216852 ) ( ON ?auto_216854 ?auto_216853 ) ( ON ?auto_216855 ?auto_216854 ) ( ON ?auto_216856 ?auto_216855 ) ( not ( = ?auto_216850 ?auto_216851 ) ) ( not ( = ?auto_216850 ?auto_216852 ) ) ( not ( = ?auto_216850 ?auto_216853 ) ) ( not ( = ?auto_216850 ?auto_216854 ) ) ( not ( = ?auto_216850 ?auto_216855 ) ) ( not ( = ?auto_216850 ?auto_216856 ) ) ( not ( = ?auto_216850 ?auto_216857 ) ) ( not ( = ?auto_216850 ?auto_216858 ) ) ( not ( = ?auto_216850 ?auto_216859 ) ) ( not ( = ?auto_216851 ?auto_216852 ) ) ( not ( = ?auto_216851 ?auto_216853 ) ) ( not ( = ?auto_216851 ?auto_216854 ) ) ( not ( = ?auto_216851 ?auto_216855 ) ) ( not ( = ?auto_216851 ?auto_216856 ) ) ( not ( = ?auto_216851 ?auto_216857 ) ) ( not ( = ?auto_216851 ?auto_216858 ) ) ( not ( = ?auto_216851 ?auto_216859 ) ) ( not ( = ?auto_216852 ?auto_216853 ) ) ( not ( = ?auto_216852 ?auto_216854 ) ) ( not ( = ?auto_216852 ?auto_216855 ) ) ( not ( = ?auto_216852 ?auto_216856 ) ) ( not ( = ?auto_216852 ?auto_216857 ) ) ( not ( = ?auto_216852 ?auto_216858 ) ) ( not ( = ?auto_216852 ?auto_216859 ) ) ( not ( = ?auto_216853 ?auto_216854 ) ) ( not ( = ?auto_216853 ?auto_216855 ) ) ( not ( = ?auto_216853 ?auto_216856 ) ) ( not ( = ?auto_216853 ?auto_216857 ) ) ( not ( = ?auto_216853 ?auto_216858 ) ) ( not ( = ?auto_216853 ?auto_216859 ) ) ( not ( = ?auto_216854 ?auto_216855 ) ) ( not ( = ?auto_216854 ?auto_216856 ) ) ( not ( = ?auto_216854 ?auto_216857 ) ) ( not ( = ?auto_216854 ?auto_216858 ) ) ( not ( = ?auto_216854 ?auto_216859 ) ) ( not ( = ?auto_216855 ?auto_216856 ) ) ( not ( = ?auto_216855 ?auto_216857 ) ) ( not ( = ?auto_216855 ?auto_216858 ) ) ( not ( = ?auto_216855 ?auto_216859 ) ) ( not ( = ?auto_216856 ?auto_216857 ) ) ( not ( = ?auto_216856 ?auto_216858 ) ) ( not ( = ?auto_216856 ?auto_216859 ) ) ( not ( = ?auto_216857 ?auto_216858 ) ) ( not ( = ?auto_216857 ?auto_216859 ) ) ( not ( = ?auto_216858 ?auto_216859 ) ) ( CLEAR ?auto_216856 ) ( ON ?auto_216857 ?auto_216858 ) ( CLEAR ?auto_216857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_216850 ?auto_216851 ?auto_216852 ?auto_216853 ?auto_216854 ?auto_216855 ?auto_216856 ?auto_216857 )
      ( MAKE-9PILE ?auto_216850 ?auto_216851 ?auto_216852 ?auto_216853 ?auto_216854 ?auto_216855 ?auto_216856 ?auto_216857 ?auto_216858 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216869 - BLOCK
      ?auto_216870 - BLOCK
      ?auto_216871 - BLOCK
      ?auto_216872 - BLOCK
      ?auto_216873 - BLOCK
      ?auto_216874 - BLOCK
      ?auto_216875 - BLOCK
      ?auto_216876 - BLOCK
      ?auto_216877 - BLOCK
    )
    :vars
    (
      ?auto_216878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216877 ?auto_216878 ) ( ON-TABLE ?auto_216869 ) ( ON ?auto_216870 ?auto_216869 ) ( ON ?auto_216871 ?auto_216870 ) ( ON ?auto_216872 ?auto_216871 ) ( ON ?auto_216873 ?auto_216872 ) ( ON ?auto_216874 ?auto_216873 ) ( not ( = ?auto_216869 ?auto_216870 ) ) ( not ( = ?auto_216869 ?auto_216871 ) ) ( not ( = ?auto_216869 ?auto_216872 ) ) ( not ( = ?auto_216869 ?auto_216873 ) ) ( not ( = ?auto_216869 ?auto_216874 ) ) ( not ( = ?auto_216869 ?auto_216875 ) ) ( not ( = ?auto_216869 ?auto_216876 ) ) ( not ( = ?auto_216869 ?auto_216877 ) ) ( not ( = ?auto_216869 ?auto_216878 ) ) ( not ( = ?auto_216870 ?auto_216871 ) ) ( not ( = ?auto_216870 ?auto_216872 ) ) ( not ( = ?auto_216870 ?auto_216873 ) ) ( not ( = ?auto_216870 ?auto_216874 ) ) ( not ( = ?auto_216870 ?auto_216875 ) ) ( not ( = ?auto_216870 ?auto_216876 ) ) ( not ( = ?auto_216870 ?auto_216877 ) ) ( not ( = ?auto_216870 ?auto_216878 ) ) ( not ( = ?auto_216871 ?auto_216872 ) ) ( not ( = ?auto_216871 ?auto_216873 ) ) ( not ( = ?auto_216871 ?auto_216874 ) ) ( not ( = ?auto_216871 ?auto_216875 ) ) ( not ( = ?auto_216871 ?auto_216876 ) ) ( not ( = ?auto_216871 ?auto_216877 ) ) ( not ( = ?auto_216871 ?auto_216878 ) ) ( not ( = ?auto_216872 ?auto_216873 ) ) ( not ( = ?auto_216872 ?auto_216874 ) ) ( not ( = ?auto_216872 ?auto_216875 ) ) ( not ( = ?auto_216872 ?auto_216876 ) ) ( not ( = ?auto_216872 ?auto_216877 ) ) ( not ( = ?auto_216872 ?auto_216878 ) ) ( not ( = ?auto_216873 ?auto_216874 ) ) ( not ( = ?auto_216873 ?auto_216875 ) ) ( not ( = ?auto_216873 ?auto_216876 ) ) ( not ( = ?auto_216873 ?auto_216877 ) ) ( not ( = ?auto_216873 ?auto_216878 ) ) ( not ( = ?auto_216874 ?auto_216875 ) ) ( not ( = ?auto_216874 ?auto_216876 ) ) ( not ( = ?auto_216874 ?auto_216877 ) ) ( not ( = ?auto_216874 ?auto_216878 ) ) ( not ( = ?auto_216875 ?auto_216876 ) ) ( not ( = ?auto_216875 ?auto_216877 ) ) ( not ( = ?auto_216875 ?auto_216878 ) ) ( not ( = ?auto_216876 ?auto_216877 ) ) ( not ( = ?auto_216876 ?auto_216878 ) ) ( not ( = ?auto_216877 ?auto_216878 ) ) ( ON ?auto_216876 ?auto_216877 ) ( CLEAR ?auto_216874 ) ( ON ?auto_216875 ?auto_216876 ) ( CLEAR ?auto_216875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216869 ?auto_216870 ?auto_216871 ?auto_216872 ?auto_216873 ?auto_216874 ?auto_216875 )
      ( MAKE-9PILE ?auto_216869 ?auto_216870 ?auto_216871 ?auto_216872 ?auto_216873 ?auto_216874 ?auto_216875 ?auto_216876 ?auto_216877 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216888 - BLOCK
      ?auto_216889 - BLOCK
      ?auto_216890 - BLOCK
      ?auto_216891 - BLOCK
      ?auto_216892 - BLOCK
      ?auto_216893 - BLOCK
      ?auto_216894 - BLOCK
      ?auto_216895 - BLOCK
      ?auto_216896 - BLOCK
    )
    :vars
    (
      ?auto_216897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216896 ?auto_216897 ) ( ON-TABLE ?auto_216888 ) ( ON ?auto_216889 ?auto_216888 ) ( ON ?auto_216890 ?auto_216889 ) ( ON ?auto_216891 ?auto_216890 ) ( ON ?auto_216892 ?auto_216891 ) ( ON ?auto_216893 ?auto_216892 ) ( not ( = ?auto_216888 ?auto_216889 ) ) ( not ( = ?auto_216888 ?auto_216890 ) ) ( not ( = ?auto_216888 ?auto_216891 ) ) ( not ( = ?auto_216888 ?auto_216892 ) ) ( not ( = ?auto_216888 ?auto_216893 ) ) ( not ( = ?auto_216888 ?auto_216894 ) ) ( not ( = ?auto_216888 ?auto_216895 ) ) ( not ( = ?auto_216888 ?auto_216896 ) ) ( not ( = ?auto_216888 ?auto_216897 ) ) ( not ( = ?auto_216889 ?auto_216890 ) ) ( not ( = ?auto_216889 ?auto_216891 ) ) ( not ( = ?auto_216889 ?auto_216892 ) ) ( not ( = ?auto_216889 ?auto_216893 ) ) ( not ( = ?auto_216889 ?auto_216894 ) ) ( not ( = ?auto_216889 ?auto_216895 ) ) ( not ( = ?auto_216889 ?auto_216896 ) ) ( not ( = ?auto_216889 ?auto_216897 ) ) ( not ( = ?auto_216890 ?auto_216891 ) ) ( not ( = ?auto_216890 ?auto_216892 ) ) ( not ( = ?auto_216890 ?auto_216893 ) ) ( not ( = ?auto_216890 ?auto_216894 ) ) ( not ( = ?auto_216890 ?auto_216895 ) ) ( not ( = ?auto_216890 ?auto_216896 ) ) ( not ( = ?auto_216890 ?auto_216897 ) ) ( not ( = ?auto_216891 ?auto_216892 ) ) ( not ( = ?auto_216891 ?auto_216893 ) ) ( not ( = ?auto_216891 ?auto_216894 ) ) ( not ( = ?auto_216891 ?auto_216895 ) ) ( not ( = ?auto_216891 ?auto_216896 ) ) ( not ( = ?auto_216891 ?auto_216897 ) ) ( not ( = ?auto_216892 ?auto_216893 ) ) ( not ( = ?auto_216892 ?auto_216894 ) ) ( not ( = ?auto_216892 ?auto_216895 ) ) ( not ( = ?auto_216892 ?auto_216896 ) ) ( not ( = ?auto_216892 ?auto_216897 ) ) ( not ( = ?auto_216893 ?auto_216894 ) ) ( not ( = ?auto_216893 ?auto_216895 ) ) ( not ( = ?auto_216893 ?auto_216896 ) ) ( not ( = ?auto_216893 ?auto_216897 ) ) ( not ( = ?auto_216894 ?auto_216895 ) ) ( not ( = ?auto_216894 ?auto_216896 ) ) ( not ( = ?auto_216894 ?auto_216897 ) ) ( not ( = ?auto_216895 ?auto_216896 ) ) ( not ( = ?auto_216895 ?auto_216897 ) ) ( not ( = ?auto_216896 ?auto_216897 ) ) ( ON ?auto_216895 ?auto_216896 ) ( CLEAR ?auto_216893 ) ( ON ?auto_216894 ?auto_216895 ) ( CLEAR ?auto_216894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_216888 ?auto_216889 ?auto_216890 ?auto_216891 ?auto_216892 ?auto_216893 ?auto_216894 )
      ( MAKE-9PILE ?auto_216888 ?auto_216889 ?auto_216890 ?auto_216891 ?auto_216892 ?auto_216893 ?auto_216894 ?auto_216895 ?auto_216896 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216907 - BLOCK
      ?auto_216908 - BLOCK
      ?auto_216909 - BLOCK
      ?auto_216910 - BLOCK
      ?auto_216911 - BLOCK
      ?auto_216912 - BLOCK
      ?auto_216913 - BLOCK
      ?auto_216914 - BLOCK
      ?auto_216915 - BLOCK
    )
    :vars
    (
      ?auto_216916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216915 ?auto_216916 ) ( ON-TABLE ?auto_216907 ) ( ON ?auto_216908 ?auto_216907 ) ( ON ?auto_216909 ?auto_216908 ) ( ON ?auto_216910 ?auto_216909 ) ( ON ?auto_216911 ?auto_216910 ) ( not ( = ?auto_216907 ?auto_216908 ) ) ( not ( = ?auto_216907 ?auto_216909 ) ) ( not ( = ?auto_216907 ?auto_216910 ) ) ( not ( = ?auto_216907 ?auto_216911 ) ) ( not ( = ?auto_216907 ?auto_216912 ) ) ( not ( = ?auto_216907 ?auto_216913 ) ) ( not ( = ?auto_216907 ?auto_216914 ) ) ( not ( = ?auto_216907 ?auto_216915 ) ) ( not ( = ?auto_216907 ?auto_216916 ) ) ( not ( = ?auto_216908 ?auto_216909 ) ) ( not ( = ?auto_216908 ?auto_216910 ) ) ( not ( = ?auto_216908 ?auto_216911 ) ) ( not ( = ?auto_216908 ?auto_216912 ) ) ( not ( = ?auto_216908 ?auto_216913 ) ) ( not ( = ?auto_216908 ?auto_216914 ) ) ( not ( = ?auto_216908 ?auto_216915 ) ) ( not ( = ?auto_216908 ?auto_216916 ) ) ( not ( = ?auto_216909 ?auto_216910 ) ) ( not ( = ?auto_216909 ?auto_216911 ) ) ( not ( = ?auto_216909 ?auto_216912 ) ) ( not ( = ?auto_216909 ?auto_216913 ) ) ( not ( = ?auto_216909 ?auto_216914 ) ) ( not ( = ?auto_216909 ?auto_216915 ) ) ( not ( = ?auto_216909 ?auto_216916 ) ) ( not ( = ?auto_216910 ?auto_216911 ) ) ( not ( = ?auto_216910 ?auto_216912 ) ) ( not ( = ?auto_216910 ?auto_216913 ) ) ( not ( = ?auto_216910 ?auto_216914 ) ) ( not ( = ?auto_216910 ?auto_216915 ) ) ( not ( = ?auto_216910 ?auto_216916 ) ) ( not ( = ?auto_216911 ?auto_216912 ) ) ( not ( = ?auto_216911 ?auto_216913 ) ) ( not ( = ?auto_216911 ?auto_216914 ) ) ( not ( = ?auto_216911 ?auto_216915 ) ) ( not ( = ?auto_216911 ?auto_216916 ) ) ( not ( = ?auto_216912 ?auto_216913 ) ) ( not ( = ?auto_216912 ?auto_216914 ) ) ( not ( = ?auto_216912 ?auto_216915 ) ) ( not ( = ?auto_216912 ?auto_216916 ) ) ( not ( = ?auto_216913 ?auto_216914 ) ) ( not ( = ?auto_216913 ?auto_216915 ) ) ( not ( = ?auto_216913 ?auto_216916 ) ) ( not ( = ?auto_216914 ?auto_216915 ) ) ( not ( = ?auto_216914 ?auto_216916 ) ) ( not ( = ?auto_216915 ?auto_216916 ) ) ( ON ?auto_216914 ?auto_216915 ) ( ON ?auto_216913 ?auto_216914 ) ( CLEAR ?auto_216911 ) ( ON ?auto_216912 ?auto_216913 ) ( CLEAR ?auto_216912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216907 ?auto_216908 ?auto_216909 ?auto_216910 ?auto_216911 ?auto_216912 )
      ( MAKE-9PILE ?auto_216907 ?auto_216908 ?auto_216909 ?auto_216910 ?auto_216911 ?auto_216912 ?auto_216913 ?auto_216914 ?auto_216915 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216926 - BLOCK
      ?auto_216927 - BLOCK
      ?auto_216928 - BLOCK
      ?auto_216929 - BLOCK
      ?auto_216930 - BLOCK
      ?auto_216931 - BLOCK
      ?auto_216932 - BLOCK
      ?auto_216933 - BLOCK
      ?auto_216934 - BLOCK
    )
    :vars
    (
      ?auto_216935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216934 ?auto_216935 ) ( ON-TABLE ?auto_216926 ) ( ON ?auto_216927 ?auto_216926 ) ( ON ?auto_216928 ?auto_216927 ) ( ON ?auto_216929 ?auto_216928 ) ( ON ?auto_216930 ?auto_216929 ) ( not ( = ?auto_216926 ?auto_216927 ) ) ( not ( = ?auto_216926 ?auto_216928 ) ) ( not ( = ?auto_216926 ?auto_216929 ) ) ( not ( = ?auto_216926 ?auto_216930 ) ) ( not ( = ?auto_216926 ?auto_216931 ) ) ( not ( = ?auto_216926 ?auto_216932 ) ) ( not ( = ?auto_216926 ?auto_216933 ) ) ( not ( = ?auto_216926 ?auto_216934 ) ) ( not ( = ?auto_216926 ?auto_216935 ) ) ( not ( = ?auto_216927 ?auto_216928 ) ) ( not ( = ?auto_216927 ?auto_216929 ) ) ( not ( = ?auto_216927 ?auto_216930 ) ) ( not ( = ?auto_216927 ?auto_216931 ) ) ( not ( = ?auto_216927 ?auto_216932 ) ) ( not ( = ?auto_216927 ?auto_216933 ) ) ( not ( = ?auto_216927 ?auto_216934 ) ) ( not ( = ?auto_216927 ?auto_216935 ) ) ( not ( = ?auto_216928 ?auto_216929 ) ) ( not ( = ?auto_216928 ?auto_216930 ) ) ( not ( = ?auto_216928 ?auto_216931 ) ) ( not ( = ?auto_216928 ?auto_216932 ) ) ( not ( = ?auto_216928 ?auto_216933 ) ) ( not ( = ?auto_216928 ?auto_216934 ) ) ( not ( = ?auto_216928 ?auto_216935 ) ) ( not ( = ?auto_216929 ?auto_216930 ) ) ( not ( = ?auto_216929 ?auto_216931 ) ) ( not ( = ?auto_216929 ?auto_216932 ) ) ( not ( = ?auto_216929 ?auto_216933 ) ) ( not ( = ?auto_216929 ?auto_216934 ) ) ( not ( = ?auto_216929 ?auto_216935 ) ) ( not ( = ?auto_216930 ?auto_216931 ) ) ( not ( = ?auto_216930 ?auto_216932 ) ) ( not ( = ?auto_216930 ?auto_216933 ) ) ( not ( = ?auto_216930 ?auto_216934 ) ) ( not ( = ?auto_216930 ?auto_216935 ) ) ( not ( = ?auto_216931 ?auto_216932 ) ) ( not ( = ?auto_216931 ?auto_216933 ) ) ( not ( = ?auto_216931 ?auto_216934 ) ) ( not ( = ?auto_216931 ?auto_216935 ) ) ( not ( = ?auto_216932 ?auto_216933 ) ) ( not ( = ?auto_216932 ?auto_216934 ) ) ( not ( = ?auto_216932 ?auto_216935 ) ) ( not ( = ?auto_216933 ?auto_216934 ) ) ( not ( = ?auto_216933 ?auto_216935 ) ) ( not ( = ?auto_216934 ?auto_216935 ) ) ( ON ?auto_216933 ?auto_216934 ) ( ON ?auto_216932 ?auto_216933 ) ( CLEAR ?auto_216930 ) ( ON ?auto_216931 ?auto_216932 ) ( CLEAR ?auto_216931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_216926 ?auto_216927 ?auto_216928 ?auto_216929 ?auto_216930 ?auto_216931 )
      ( MAKE-9PILE ?auto_216926 ?auto_216927 ?auto_216928 ?auto_216929 ?auto_216930 ?auto_216931 ?auto_216932 ?auto_216933 ?auto_216934 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216945 - BLOCK
      ?auto_216946 - BLOCK
      ?auto_216947 - BLOCK
      ?auto_216948 - BLOCK
      ?auto_216949 - BLOCK
      ?auto_216950 - BLOCK
      ?auto_216951 - BLOCK
      ?auto_216952 - BLOCK
      ?auto_216953 - BLOCK
    )
    :vars
    (
      ?auto_216954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216953 ?auto_216954 ) ( ON-TABLE ?auto_216945 ) ( ON ?auto_216946 ?auto_216945 ) ( ON ?auto_216947 ?auto_216946 ) ( ON ?auto_216948 ?auto_216947 ) ( not ( = ?auto_216945 ?auto_216946 ) ) ( not ( = ?auto_216945 ?auto_216947 ) ) ( not ( = ?auto_216945 ?auto_216948 ) ) ( not ( = ?auto_216945 ?auto_216949 ) ) ( not ( = ?auto_216945 ?auto_216950 ) ) ( not ( = ?auto_216945 ?auto_216951 ) ) ( not ( = ?auto_216945 ?auto_216952 ) ) ( not ( = ?auto_216945 ?auto_216953 ) ) ( not ( = ?auto_216945 ?auto_216954 ) ) ( not ( = ?auto_216946 ?auto_216947 ) ) ( not ( = ?auto_216946 ?auto_216948 ) ) ( not ( = ?auto_216946 ?auto_216949 ) ) ( not ( = ?auto_216946 ?auto_216950 ) ) ( not ( = ?auto_216946 ?auto_216951 ) ) ( not ( = ?auto_216946 ?auto_216952 ) ) ( not ( = ?auto_216946 ?auto_216953 ) ) ( not ( = ?auto_216946 ?auto_216954 ) ) ( not ( = ?auto_216947 ?auto_216948 ) ) ( not ( = ?auto_216947 ?auto_216949 ) ) ( not ( = ?auto_216947 ?auto_216950 ) ) ( not ( = ?auto_216947 ?auto_216951 ) ) ( not ( = ?auto_216947 ?auto_216952 ) ) ( not ( = ?auto_216947 ?auto_216953 ) ) ( not ( = ?auto_216947 ?auto_216954 ) ) ( not ( = ?auto_216948 ?auto_216949 ) ) ( not ( = ?auto_216948 ?auto_216950 ) ) ( not ( = ?auto_216948 ?auto_216951 ) ) ( not ( = ?auto_216948 ?auto_216952 ) ) ( not ( = ?auto_216948 ?auto_216953 ) ) ( not ( = ?auto_216948 ?auto_216954 ) ) ( not ( = ?auto_216949 ?auto_216950 ) ) ( not ( = ?auto_216949 ?auto_216951 ) ) ( not ( = ?auto_216949 ?auto_216952 ) ) ( not ( = ?auto_216949 ?auto_216953 ) ) ( not ( = ?auto_216949 ?auto_216954 ) ) ( not ( = ?auto_216950 ?auto_216951 ) ) ( not ( = ?auto_216950 ?auto_216952 ) ) ( not ( = ?auto_216950 ?auto_216953 ) ) ( not ( = ?auto_216950 ?auto_216954 ) ) ( not ( = ?auto_216951 ?auto_216952 ) ) ( not ( = ?auto_216951 ?auto_216953 ) ) ( not ( = ?auto_216951 ?auto_216954 ) ) ( not ( = ?auto_216952 ?auto_216953 ) ) ( not ( = ?auto_216952 ?auto_216954 ) ) ( not ( = ?auto_216953 ?auto_216954 ) ) ( ON ?auto_216952 ?auto_216953 ) ( ON ?auto_216951 ?auto_216952 ) ( ON ?auto_216950 ?auto_216951 ) ( CLEAR ?auto_216948 ) ( ON ?auto_216949 ?auto_216950 ) ( CLEAR ?auto_216949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216945 ?auto_216946 ?auto_216947 ?auto_216948 ?auto_216949 )
      ( MAKE-9PILE ?auto_216945 ?auto_216946 ?auto_216947 ?auto_216948 ?auto_216949 ?auto_216950 ?auto_216951 ?auto_216952 ?auto_216953 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216964 - BLOCK
      ?auto_216965 - BLOCK
      ?auto_216966 - BLOCK
      ?auto_216967 - BLOCK
      ?auto_216968 - BLOCK
      ?auto_216969 - BLOCK
      ?auto_216970 - BLOCK
      ?auto_216971 - BLOCK
      ?auto_216972 - BLOCK
    )
    :vars
    (
      ?auto_216973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216972 ?auto_216973 ) ( ON-TABLE ?auto_216964 ) ( ON ?auto_216965 ?auto_216964 ) ( ON ?auto_216966 ?auto_216965 ) ( ON ?auto_216967 ?auto_216966 ) ( not ( = ?auto_216964 ?auto_216965 ) ) ( not ( = ?auto_216964 ?auto_216966 ) ) ( not ( = ?auto_216964 ?auto_216967 ) ) ( not ( = ?auto_216964 ?auto_216968 ) ) ( not ( = ?auto_216964 ?auto_216969 ) ) ( not ( = ?auto_216964 ?auto_216970 ) ) ( not ( = ?auto_216964 ?auto_216971 ) ) ( not ( = ?auto_216964 ?auto_216972 ) ) ( not ( = ?auto_216964 ?auto_216973 ) ) ( not ( = ?auto_216965 ?auto_216966 ) ) ( not ( = ?auto_216965 ?auto_216967 ) ) ( not ( = ?auto_216965 ?auto_216968 ) ) ( not ( = ?auto_216965 ?auto_216969 ) ) ( not ( = ?auto_216965 ?auto_216970 ) ) ( not ( = ?auto_216965 ?auto_216971 ) ) ( not ( = ?auto_216965 ?auto_216972 ) ) ( not ( = ?auto_216965 ?auto_216973 ) ) ( not ( = ?auto_216966 ?auto_216967 ) ) ( not ( = ?auto_216966 ?auto_216968 ) ) ( not ( = ?auto_216966 ?auto_216969 ) ) ( not ( = ?auto_216966 ?auto_216970 ) ) ( not ( = ?auto_216966 ?auto_216971 ) ) ( not ( = ?auto_216966 ?auto_216972 ) ) ( not ( = ?auto_216966 ?auto_216973 ) ) ( not ( = ?auto_216967 ?auto_216968 ) ) ( not ( = ?auto_216967 ?auto_216969 ) ) ( not ( = ?auto_216967 ?auto_216970 ) ) ( not ( = ?auto_216967 ?auto_216971 ) ) ( not ( = ?auto_216967 ?auto_216972 ) ) ( not ( = ?auto_216967 ?auto_216973 ) ) ( not ( = ?auto_216968 ?auto_216969 ) ) ( not ( = ?auto_216968 ?auto_216970 ) ) ( not ( = ?auto_216968 ?auto_216971 ) ) ( not ( = ?auto_216968 ?auto_216972 ) ) ( not ( = ?auto_216968 ?auto_216973 ) ) ( not ( = ?auto_216969 ?auto_216970 ) ) ( not ( = ?auto_216969 ?auto_216971 ) ) ( not ( = ?auto_216969 ?auto_216972 ) ) ( not ( = ?auto_216969 ?auto_216973 ) ) ( not ( = ?auto_216970 ?auto_216971 ) ) ( not ( = ?auto_216970 ?auto_216972 ) ) ( not ( = ?auto_216970 ?auto_216973 ) ) ( not ( = ?auto_216971 ?auto_216972 ) ) ( not ( = ?auto_216971 ?auto_216973 ) ) ( not ( = ?auto_216972 ?auto_216973 ) ) ( ON ?auto_216971 ?auto_216972 ) ( ON ?auto_216970 ?auto_216971 ) ( ON ?auto_216969 ?auto_216970 ) ( CLEAR ?auto_216967 ) ( ON ?auto_216968 ?auto_216969 ) ( CLEAR ?auto_216968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_216964 ?auto_216965 ?auto_216966 ?auto_216967 ?auto_216968 )
      ( MAKE-9PILE ?auto_216964 ?auto_216965 ?auto_216966 ?auto_216967 ?auto_216968 ?auto_216969 ?auto_216970 ?auto_216971 ?auto_216972 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_216983 - BLOCK
      ?auto_216984 - BLOCK
      ?auto_216985 - BLOCK
      ?auto_216986 - BLOCK
      ?auto_216987 - BLOCK
      ?auto_216988 - BLOCK
      ?auto_216989 - BLOCK
      ?auto_216990 - BLOCK
      ?auto_216991 - BLOCK
    )
    :vars
    (
      ?auto_216992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_216991 ?auto_216992 ) ( ON-TABLE ?auto_216983 ) ( ON ?auto_216984 ?auto_216983 ) ( ON ?auto_216985 ?auto_216984 ) ( not ( = ?auto_216983 ?auto_216984 ) ) ( not ( = ?auto_216983 ?auto_216985 ) ) ( not ( = ?auto_216983 ?auto_216986 ) ) ( not ( = ?auto_216983 ?auto_216987 ) ) ( not ( = ?auto_216983 ?auto_216988 ) ) ( not ( = ?auto_216983 ?auto_216989 ) ) ( not ( = ?auto_216983 ?auto_216990 ) ) ( not ( = ?auto_216983 ?auto_216991 ) ) ( not ( = ?auto_216983 ?auto_216992 ) ) ( not ( = ?auto_216984 ?auto_216985 ) ) ( not ( = ?auto_216984 ?auto_216986 ) ) ( not ( = ?auto_216984 ?auto_216987 ) ) ( not ( = ?auto_216984 ?auto_216988 ) ) ( not ( = ?auto_216984 ?auto_216989 ) ) ( not ( = ?auto_216984 ?auto_216990 ) ) ( not ( = ?auto_216984 ?auto_216991 ) ) ( not ( = ?auto_216984 ?auto_216992 ) ) ( not ( = ?auto_216985 ?auto_216986 ) ) ( not ( = ?auto_216985 ?auto_216987 ) ) ( not ( = ?auto_216985 ?auto_216988 ) ) ( not ( = ?auto_216985 ?auto_216989 ) ) ( not ( = ?auto_216985 ?auto_216990 ) ) ( not ( = ?auto_216985 ?auto_216991 ) ) ( not ( = ?auto_216985 ?auto_216992 ) ) ( not ( = ?auto_216986 ?auto_216987 ) ) ( not ( = ?auto_216986 ?auto_216988 ) ) ( not ( = ?auto_216986 ?auto_216989 ) ) ( not ( = ?auto_216986 ?auto_216990 ) ) ( not ( = ?auto_216986 ?auto_216991 ) ) ( not ( = ?auto_216986 ?auto_216992 ) ) ( not ( = ?auto_216987 ?auto_216988 ) ) ( not ( = ?auto_216987 ?auto_216989 ) ) ( not ( = ?auto_216987 ?auto_216990 ) ) ( not ( = ?auto_216987 ?auto_216991 ) ) ( not ( = ?auto_216987 ?auto_216992 ) ) ( not ( = ?auto_216988 ?auto_216989 ) ) ( not ( = ?auto_216988 ?auto_216990 ) ) ( not ( = ?auto_216988 ?auto_216991 ) ) ( not ( = ?auto_216988 ?auto_216992 ) ) ( not ( = ?auto_216989 ?auto_216990 ) ) ( not ( = ?auto_216989 ?auto_216991 ) ) ( not ( = ?auto_216989 ?auto_216992 ) ) ( not ( = ?auto_216990 ?auto_216991 ) ) ( not ( = ?auto_216990 ?auto_216992 ) ) ( not ( = ?auto_216991 ?auto_216992 ) ) ( ON ?auto_216990 ?auto_216991 ) ( ON ?auto_216989 ?auto_216990 ) ( ON ?auto_216988 ?auto_216989 ) ( ON ?auto_216987 ?auto_216988 ) ( CLEAR ?auto_216985 ) ( ON ?auto_216986 ?auto_216987 ) ( CLEAR ?auto_216986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_216983 ?auto_216984 ?auto_216985 ?auto_216986 )
      ( MAKE-9PILE ?auto_216983 ?auto_216984 ?auto_216985 ?auto_216986 ?auto_216987 ?auto_216988 ?auto_216989 ?auto_216990 ?auto_216991 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217002 - BLOCK
      ?auto_217003 - BLOCK
      ?auto_217004 - BLOCK
      ?auto_217005 - BLOCK
      ?auto_217006 - BLOCK
      ?auto_217007 - BLOCK
      ?auto_217008 - BLOCK
      ?auto_217009 - BLOCK
      ?auto_217010 - BLOCK
    )
    :vars
    (
      ?auto_217011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217010 ?auto_217011 ) ( ON-TABLE ?auto_217002 ) ( ON ?auto_217003 ?auto_217002 ) ( ON ?auto_217004 ?auto_217003 ) ( not ( = ?auto_217002 ?auto_217003 ) ) ( not ( = ?auto_217002 ?auto_217004 ) ) ( not ( = ?auto_217002 ?auto_217005 ) ) ( not ( = ?auto_217002 ?auto_217006 ) ) ( not ( = ?auto_217002 ?auto_217007 ) ) ( not ( = ?auto_217002 ?auto_217008 ) ) ( not ( = ?auto_217002 ?auto_217009 ) ) ( not ( = ?auto_217002 ?auto_217010 ) ) ( not ( = ?auto_217002 ?auto_217011 ) ) ( not ( = ?auto_217003 ?auto_217004 ) ) ( not ( = ?auto_217003 ?auto_217005 ) ) ( not ( = ?auto_217003 ?auto_217006 ) ) ( not ( = ?auto_217003 ?auto_217007 ) ) ( not ( = ?auto_217003 ?auto_217008 ) ) ( not ( = ?auto_217003 ?auto_217009 ) ) ( not ( = ?auto_217003 ?auto_217010 ) ) ( not ( = ?auto_217003 ?auto_217011 ) ) ( not ( = ?auto_217004 ?auto_217005 ) ) ( not ( = ?auto_217004 ?auto_217006 ) ) ( not ( = ?auto_217004 ?auto_217007 ) ) ( not ( = ?auto_217004 ?auto_217008 ) ) ( not ( = ?auto_217004 ?auto_217009 ) ) ( not ( = ?auto_217004 ?auto_217010 ) ) ( not ( = ?auto_217004 ?auto_217011 ) ) ( not ( = ?auto_217005 ?auto_217006 ) ) ( not ( = ?auto_217005 ?auto_217007 ) ) ( not ( = ?auto_217005 ?auto_217008 ) ) ( not ( = ?auto_217005 ?auto_217009 ) ) ( not ( = ?auto_217005 ?auto_217010 ) ) ( not ( = ?auto_217005 ?auto_217011 ) ) ( not ( = ?auto_217006 ?auto_217007 ) ) ( not ( = ?auto_217006 ?auto_217008 ) ) ( not ( = ?auto_217006 ?auto_217009 ) ) ( not ( = ?auto_217006 ?auto_217010 ) ) ( not ( = ?auto_217006 ?auto_217011 ) ) ( not ( = ?auto_217007 ?auto_217008 ) ) ( not ( = ?auto_217007 ?auto_217009 ) ) ( not ( = ?auto_217007 ?auto_217010 ) ) ( not ( = ?auto_217007 ?auto_217011 ) ) ( not ( = ?auto_217008 ?auto_217009 ) ) ( not ( = ?auto_217008 ?auto_217010 ) ) ( not ( = ?auto_217008 ?auto_217011 ) ) ( not ( = ?auto_217009 ?auto_217010 ) ) ( not ( = ?auto_217009 ?auto_217011 ) ) ( not ( = ?auto_217010 ?auto_217011 ) ) ( ON ?auto_217009 ?auto_217010 ) ( ON ?auto_217008 ?auto_217009 ) ( ON ?auto_217007 ?auto_217008 ) ( ON ?auto_217006 ?auto_217007 ) ( CLEAR ?auto_217004 ) ( ON ?auto_217005 ?auto_217006 ) ( CLEAR ?auto_217005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217002 ?auto_217003 ?auto_217004 ?auto_217005 )
      ( MAKE-9PILE ?auto_217002 ?auto_217003 ?auto_217004 ?auto_217005 ?auto_217006 ?auto_217007 ?auto_217008 ?auto_217009 ?auto_217010 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217021 - BLOCK
      ?auto_217022 - BLOCK
      ?auto_217023 - BLOCK
      ?auto_217024 - BLOCK
      ?auto_217025 - BLOCK
      ?auto_217026 - BLOCK
      ?auto_217027 - BLOCK
      ?auto_217028 - BLOCK
      ?auto_217029 - BLOCK
    )
    :vars
    (
      ?auto_217030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217029 ?auto_217030 ) ( ON-TABLE ?auto_217021 ) ( ON ?auto_217022 ?auto_217021 ) ( not ( = ?auto_217021 ?auto_217022 ) ) ( not ( = ?auto_217021 ?auto_217023 ) ) ( not ( = ?auto_217021 ?auto_217024 ) ) ( not ( = ?auto_217021 ?auto_217025 ) ) ( not ( = ?auto_217021 ?auto_217026 ) ) ( not ( = ?auto_217021 ?auto_217027 ) ) ( not ( = ?auto_217021 ?auto_217028 ) ) ( not ( = ?auto_217021 ?auto_217029 ) ) ( not ( = ?auto_217021 ?auto_217030 ) ) ( not ( = ?auto_217022 ?auto_217023 ) ) ( not ( = ?auto_217022 ?auto_217024 ) ) ( not ( = ?auto_217022 ?auto_217025 ) ) ( not ( = ?auto_217022 ?auto_217026 ) ) ( not ( = ?auto_217022 ?auto_217027 ) ) ( not ( = ?auto_217022 ?auto_217028 ) ) ( not ( = ?auto_217022 ?auto_217029 ) ) ( not ( = ?auto_217022 ?auto_217030 ) ) ( not ( = ?auto_217023 ?auto_217024 ) ) ( not ( = ?auto_217023 ?auto_217025 ) ) ( not ( = ?auto_217023 ?auto_217026 ) ) ( not ( = ?auto_217023 ?auto_217027 ) ) ( not ( = ?auto_217023 ?auto_217028 ) ) ( not ( = ?auto_217023 ?auto_217029 ) ) ( not ( = ?auto_217023 ?auto_217030 ) ) ( not ( = ?auto_217024 ?auto_217025 ) ) ( not ( = ?auto_217024 ?auto_217026 ) ) ( not ( = ?auto_217024 ?auto_217027 ) ) ( not ( = ?auto_217024 ?auto_217028 ) ) ( not ( = ?auto_217024 ?auto_217029 ) ) ( not ( = ?auto_217024 ?auto_217030 ) ) ( not ( = ?auto_217025 ?auto_217026 ) ) ( not ( = ?auto_217025 ?auto_217027 ) ) ( not ( = ?auto_217025 ?auto_217028 ) ) ( not ( = ?auto_217025 ?auto_217029 ) ) ( not ( = ?auto_217025 ?auto_217030 ) ) ( not ( = ?auto_217026 ?auto_217027 ) ) ( not ( = ?auto_217026 ?auto_217028 ) ) ( not ( = ?auto_217026 ?auto_217029 ) ) ( not ( = ?auto_217026 ?auto_217030 ) ) ( not ( = ?auto_217027 ?auto_217028 ) ) ( not ( = ?auto_217027 ?auto_217029 ) ) ( not ( = ?auto_217027 ?auto_217030 ) ) ( not ( = ?auto_217028 ?auto_217029 ) ) ( not ( = ?auto_217028 ?auto_217030 ) ) ( not ( = ?auto_217029 ?auto_217030 ) ) ( ON ?auto_217028 ?auto_217029 ) ( ON ?auto_217027 ?auto_217028 ) ( ON ?auto_217026 ?auto_217027 ) ( ON ?auto_217025 ?auto_217026 ) ( ON ?auto_217024 ?auto_217025 ) ( CLEAR ?auto_217022 ) ( ON ?auto_217023 ?auto_217024 ) ( CLEAR ?auto_217023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217021 ?auto_217022 ?auto_217023 )
      ( MAKE-9PILE ?auto_217021 ?auto_217022 ?auto_217023 ?auto_217024 ?auto_217025 ?auto_217026 ?auto_217027 ?auto_217028 ?auto_217029 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217040 - BLOCK
      ?auto_217041 - BLOCK
      ?auto_217042 - BLOCK
      ?auto_217043 - BLOCK
      ?auto_217044 - BLOCK
      ?auto_217045 - BLOCK
      ?auto_217046 - BLOCK
      ?auto_217047 - BLOCK
      ?auto_217048 - BLOCK
    )
    :vars
    (
      ?auto_217049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217048 ?auto_217049 ) ( ON-TABLE ?auto_217040 ) ( ON ?auto_217041 ?auto_217040 ) ( not ( = ?auto_217040 ?auto_217041 ) ) ( not ( = ?auto_217040 ?auto_217042 ) ) ( not ( = ?auto_217040 ?auto_217043 ) ) ( not ( = ?auto_217040 ?auto_217044 ) ) ( not ( = ?auto_217040 ?auto_217045 ) ) ( not ( = ?auto_217040 ?auto_217046 ) ) ( not ( = ?auto_217040 ?auto_217047 ) ) ( not ( = ?auto_217040 ?auto_217048 ) ) ( not ( = ?auto_217040 ?auto_217049 ) ) ( not ( = ?auto_217041 ?auto_217042 ) ) ( not ( = ?auto_217041 ?auto_217043 ) ) ( not ( = ?auto_217041 ?auto_217044 ) ) ( not ( = ?auto_217041 ?auto_217045 ) ) ( not ( = ?auto_217041 ?auto_217046 ) ) ( not ( = ?auto_217041 ?auto_217047 ) ) ( not ( = ?auto_217041 ?auto_217048 ) ) ( not ( = ?auto_217041 ?auto_217049 ) ) ( not ( = ?auto_217042 ?auto_217043 ) ) ( not ( = ?auto_217042 ?auto_217044 ) ) ( not ( = ?auto_217042 ?auto_217045 ) ) ( not ( = ?auto_217042 ?auto_217046 ) ) ( not ( = ?auto_217042 ?auto_217047 ) ) ( not ( = ?auto_217042 ?auto_217048 ) ) ( not ( = ?auto_217042 ?auto_217049 ) ) ( not ( = ?auto_217043 ?auto_217044 ) ) ( not ( = ?auto_217043 ?auto_217045 ) ) ( not ( = ?auto_217043 ?auto_217046 ) ) ( not ( = ?auto_217043 ?auto_217047 ) ) ( not ( = ?auto_217043 ?auto_217048 ) ) ( not ( = ?auto_217043 ?auto_217049 ) ) ( not ( = ?auto_217044 ?auto_217045 ) ) ( not ( = ?auto_217044 ?auto_217046 ) ) ( not ( = ?auto_217044 ?auto_217047 ) ) ( not ( = ?auto_217044 ?auto_217048 ) ) ( not ( = ?auto_217044 ?auto_217049 ) ) ( not ( = ?auto_217045 ?auto_217046 ) ) ( not ( = ?auto_217045 ?auto_217047 ) ) ( not ( = ?auto_217045 ?auto_217048 ) ) ( not ( = ?auto_217045 ?auto_217049 ) ) ( not ( = ?auto_217046 ?auto_217047 ) ) ( not ( = ?auto_217046 ?auto_217048 ) ) ( not ( = ?auto_217046 ?auto_217049 ) ) ( not ( = ?auto_217047 ?auto_217048 ) ) ( not ( = ?auto_217047 ?auto_217049 ) ) ( not ( = ?auto_217048 ?auto_217049 ) ) ( ON ?auto_217047 ?auto_217048 ) ( ON ?auto_217046 ?auto_217047 ) ( ON ?auto_217045 ?auto_217046 ) ( ON ?auto_217044 ?auto_217045 ) ( ON ?auto_217043 ?auto_217044 ) ( CLEAR ?auto_217041 ) ( ON ?auto_217042 ?auto_217043 ) ( CLEAR ?auto_217042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217040 ?auto_217041 ?auto_217042 )
      ( MAKE-9PILE ?auto_217040 ?auto_217041 ?auto_217042 ?auto_217043 ?auto_217044 ?auto_217045 ?auto_217046 ?auto_217047 ?auto_217048 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217059 - BLOCK
      ?auto_217060 - BLOCK
      ?auto_217061 - BLOCK
      ?auto_217062 - BLOCK
      ?auto_217063 - BLOCK
      ?auto_217064 - BLOCK
      ?auto_217065 - BLOCK
      ?auto_217066 - BLOCK
      ?auto_217067 - BLOCK
    )
    :vars
    (
      ?auto_217068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217067 ?auto_217068 ) ( ON-TABLE ?auto_217059 ) ( not ( = ?auto_217059 ?auto_217060 ) ) ( not ( = ?auto_217059 ?auto_217061 ) ) ( not ( = ?auto_217059 ?auto_217062 ) ) ( not ( = ?auto_217059 ?auto_217063 ) ) ( not ( = ?auto_217059 ?auto_217064 ) ) ( not ( = ?auto_217059 ?auto_217065 ) ) ( not ( = ?auto_217059 ?auto_217066 ) ) ( not ( = ?auto_217059 ?auto_217067 ) ) ( not ( = ?auto_217059 ?auto_217068 ) ) ( not ( = ?auto_217060 ?auto_217061 ) ) ( not ( = ?auto_217060 ?auto_217062 ) ) ( not ( = ?auto_217060 ?auto_217063 ) ) ( not ( = ?auto_217060 ?auto_217064 ) ) ( not ( = ?auto_217060 ?auto_217065 ) ) ( not ( = ?auto_217060 ?auto_217066 ) ) ( not ( = ?auto_217060 ?auto_217067 ) ) ( not ( = ?auto_217060 ?auto_217068 ) ) ( not ( = ?auto_217061 ?auto_217062 ) ) ( not ( = ?auto_217061 ?auto_217063 ) ) ( not ( = ?auto_217061 ?auto_217064 ) ) ( not ( = ?auto_217061 ?auto_217065 ) ) ( not ( = ?auto_217061 ?auto_217066 ) ) ( not ( = ?auto_217061 ?auto_217067 ) ) ( not ( = ?auto_217061 ?auto_217068 ) ) ( not ( = ?auto_217062 ?auto_217063 ) ) ( not ( = ?auto_217062 ?auto_217064 ) ) ( not ( = ?auto_217062 ?auto_217065 ) ) ( not ( = ?auto_217062 ?auto_217066 ) ) ( not ( = ?auto_217062 ?auto_217067 ) ) ( not ( = ?auto_217062 ?auto_217068 ) ) ( not ( = ?auto_217063 ?auto_217064 ) ) ( not ( = ?auto_217063 ?auto_217065 ) ) ( not ( = ?auto_217063 ?auto_217066 ) ) ( not ( = ?auto_217063 ?auto_217067 ) ) ( not ( = ?auto_217063 ?auto_217068 ) ) ( not ( = ?auto_217064 ?auto_217065 ) ) ( not ( = ?auto_217064 ?auto_217066 ) ) ( not ( = ?auto_217064 ?auto_217067 ) ) ( not ( = ?auto_217064 ?auto_217068 ) ) ( not ( = ?auto_217065 ?auto_217066 ) ) ( not ( = ?auto_217065 ?auto_217067 ) ) ( not ( = ?auto_217065 ?auto_217068 ) ) ( not ( = ?auto_217066 ?auto_217067 ) ) ( not ( = ?auto_217066 ?auto_217068 ) ) ( not ( = ?auto_217067 ?auto_217068 ) ) ( ON ?auto_217066 ?auto_217067 ) ( ON ?auto_217065 ?auto_217066 ) ( ON ?auto_217064 ?auto_217065 ) ( ON ?auto_217063 ?auto_217064 ) ( ON ?auto_217062 ?auto_217063 ) ( ON ?auto_217061 ?auto_217062 ) ( CLEAR ?auto_217059 ) ( ON ?auto_217060 ?auto_217061 ) ( CLEAR ?auto_217060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217059 ?auto_217060 )
      ( MAKE-9PILE ?auto_217059 ?auto_217060 ?auto_217061 ?auto_217062 ?auto_217063 ?auto_217064 ?auto_217065 ?auto_217066 ?auto_217067 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217078 - BLOCK
      ?auto_217079 - BLOCK
      ?auto_217080 - BLOCK
      ?auto_217081 - BLOCK
      ?auto_217082 - BLOCK
      ?auto_217083 - BLOCK
      ?auto_217084 - BLOCK
      ?auto_217085 - BLOCK
      ?auto_217086 - BLOCK
    )
    :vars
    (
      ?auto_217087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217086 ?auto_217087 ) ( ON-TABLE ?auto_217078 ) ( not ( = ?auto_217078 ?auto_217079 ) ) ( not ( = ?auto_217078 ?auto_217080 ) ) ( not ( = ?auto_217078 ?auto_217081 ) ) ( not ( = ?auto_217078 ?auto_217082 ) ) ( not ( = ?auto_217078 ?auto_217083 ) ) ( not ( = ?auto_217078 ?auto_217084 ) ) ( not ( = ?auto_217078 ?auto_217085 ) ) ( not ( = ?auto_217078 ?auto_217086 ) ) ( not ( = ?auto_217078 ?auto_217087 ) ) ( not ( = ?auto_217079 ?auto_217080 ) ) ( not ( = ?auto_217079 ?auto_217081 ) ) ( not ( = ?auto_217079 ?auto_217082 ) ) ( not ( = ?auto_217079 ?auto_217083 ) ) ( not ( = ?auto_217079 ?auto_217084 ) ) ( not ( = ?auto_217079 ?auto_217085 ) ) ( not ( = ?auto_217079 ?auto_217086 ) ) ( not ( = ?auto_217079 ?auto_217087 ) ) ( not ( = ?auto_217080 ?auto_217081 ) ) ( not ( = ?auto_217080 ?auto_217082 ) ) ( not ( = ?auto_217080 ?auto_217083 ) ) ( not ( = ?auto_217080 ?auto_217084 ) ) ( not ( = ?auto_217080 ?auto_217085 ) ) ( not ( = ?auto_217080 ?auto_217086 ) ) ( not ( = ?auto_217080 ?auto_217087 ) ) ( not ( = ?auto_217081 ?auto_217082 ) ) ( not ( = ?auto_217081 ?auto_217083 ) ) ( not ( = ?auto_217081 ?auto_217084 ) ) ( not ( = ?auto_217081 ?auto_217085 ) ) ( not ( = ?auto_217081 ?auto_217086 ) ) ( not ( = ?auto_217081 ?auto_217087 ) ) ( not ( = ?auto_217082 ?auto_217083 ) ) ( not ( = ?auto_217082 ?auto_217084 ) ) ( not ( = ?auto_217082 ?auto_217085 ) ) ( not ( = ?auto_217082 ?auto_217086 ) ) ( not ( = ?auto_217082 ?auto_217087 ) ) ( not ( = ?auto_217083 ?auto_217084 ) ) ( not ( = ?auto_217083 ?auto_217085 ) ) ( not ( = ?auto_217083 ?auto_217086 ) ) ( not ( = ?auto_217083 ?auto_217087 ) ) ( not ( = ?auto_217084 ?auto_217085 ) ) ( not ( = ?auto_217084 ?auto_217086 ) ) ( not ( = ?auto_217084 ?auto_217087 ) ) ( not ( = ?auto_217085 ?auto_217086 ) ) ( not ( = ?auto_217085 ?auto_217087 ) ) ( not ( = ?auto_217086 ?auto_217087 ) ) ( ON ?auto_217085 ?auto_217086 ) ( ON ?auto_217084 ?auto_217085 ) ( ON ?auto_217083 ?auto_217084 ) ( ON ?auto_217082 ?auto_217083 ) ( ON ?auto_217081 ?auto_217082 ) ( ON ?auto_217080 ?auto_217081 ) ( CLEAR ?auto_217078 ) ( ON ?auto_217079 ?auto_217080 ) ( CLEAR ?auto_217079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217078 ?auto_217079 )
      ( MAKE-9PILE ?auto_217078 ?auto_217079 ?auto_217080 ?auto_217081 ?auto_217082 ?auto_217083 ?auto_217084 ?auto_217085 ?auto_217086 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217097 - BLOCK
      ?auto_217098 - BLOCK
      ?auto_217099 - BLOCK
      ?auto_217100 - BLOCK
      ?auto_217101 - BLOCK
      ?auto_217102 - BLOCK
      ?auto_217103 - BLOCK
      ?auto_217104 - BLOCK
      ?auto_217105 - BLOCK
    )
    :vars
    (
      ?auto_217106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217105 ?auto_217106 ) ( not ( = ?auto_217097 ?auto_217098 ) ) ( not ( = ?auto_217097 ?auto_217099 ) ) ( not ( = ?auto_217097 ?auto_217100 ) ) ( not ( = ?auto_217097 ?auto_217101 ) ) ( not ( = ?auto_217097 ?auto_217102 ) ) ( not ( = ?auto_217097 ?auto_217103 ) ) ( not ( = ?auto_217097 ?auto_217104 ) ) ( not ( = ?auto_217097 ?auto_217105 ) ) ( not ( = ?auto_217097 ?auto_217106 ) ) ( not ( = ?auto_217098 ?auto_217099 ) ) ( not ( = ?auto_217098 ?auto_217100 ) ) ( not ( = ?auto_217098 ?auto_217101 ) ) ( not ( = ?auto_217098 ?auto_217102 ) ) ( not ( = ?auto_217098 ?auto_217103 ) ) ( not ( = ?auto_217098 ?auto_217104 ) ) ( not ( = ?auto_217098 ?auto_217105 ) ) ( not ( = ?auto_217098 ?auto_217106 ) ) ( not ( = ?auto_217099 ?auto_217100 ) ) ( not ( = ?auto_217099 ?auto_217101 ) ) ( not ( = ?auto_217099 ?auto_217102 ) ) ( not ( = ?auto_217099 ?auto_217103 ) ) ( not ( = ?auto_217099 ?auto_217104 ) ) ( not ( = ?auto_217099 ?auto_217105 ) ) ( not ( = ?auto_217099 ?auto_217106 ) ) ( not ( = ?auto_217100 ?auto_217101 ) ) ( not ( = ?auto_217100 ?auto_217102 ) ) ( not ( = ?auto_217100 ?auto_217103 ) ) ( not ( = ?auto_217100 ?auto_217104 ) ) ( not ( = ?auto_217100 ?auto_217105 ) ) ( not ( = ?auto_217100 ?auto_217106 ) ) ( not ( = ?auto_217101 ?auto_217102 ) ) ( not ( = ?auto_217101 ?auto_217103 ) ) ( not ( = ?auto_217101 ?auto_217104 ) ) ( not ( = ?auto_217101 ?auto_217105 ) ) ( not ( = ?auto_217101 ?auto_217106 ) ) ( not ( = ?auto_217102 ?auto_217103 ) ) ( not ( = ?auto_217102 ?auto_217104 ) ) ( not ( = ?auto_217102 ?auto_217105 ) ) ( not ( = ?auto_217102 ?auto_217106 ) ) ( not ( = ?auto_217103 ?auto_217104 ) ) ( not ( = ?auto_217103 ?auto_217105 ) ) ( not ( = ?auto_217103 ?auto_217106 ) ) ( not ( = ?auto_217104 ?auto_217105 ) ) ( not ( = ?auto_217104 ?auto_217106 ) ) ( not ( = ?auto_217105 ?auto_217106 ) ) ( ON ?auto_217104 ?auto_217105 ) ( ON ?auto_217103 ?auto_217104 ) ( ON ?auto_217102 ?auto_217103 ) ( ON ?auto_217101 ?auto_217102 ) ( ON ?auto_217100 ?auto_217101 ) ( ON ?auto_217099 ?auto_217100 ) ( ON ?auto_217098 ?auto_217099 ) ( ON ?auto_217097 ?auto_217098 ) ( CLEAR ?auto_217097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217097 )
      ( MAKE-9PILE ?auto_217097 ?auto_217098 ?auto_217099 ?auto_217100 ?auto_217101 ?auto_217102 ?auto_217103 ?auto_217104 ?auto_217105 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_217116 - BLOCK
      ?auto_217117 - BLOCK
      ?auto_217118 - BLOCK
      ?auto_217119 - BLOCK
      ?auto_217120 - BLOCK
      ?auto_217121 - BLOCK
      ?auto_217122 - BLOCK
      ?auto_217123 - BLOCK
      ?auto_217124 - BLOCK
    )
    :vars
    (
      ?auto_217125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217124 ?auto_217125 ) ( not ( = ?auto_217116 ?auto_217117 ) ) ( not ( = ?auto_217116 ?auto_217118 ) ) ( not ( = ?auto_217116 ?auto_217119 ) ) ( not ( = ?auto_217116 ?auto_217120 ) ) ( not ( = ?auto_217116 ?auto_217121 ) ) ( not ( = ?auto_217116 ?auto_217122 ) ) ( not ( = ?auto_217116 ?auto_217123 ) ) ( not ( = ?auto_217116 ?auto_217124 ) ) ( not ( = ?auto_217116 ?auto_217125 ) ) ( not ( = ?auto_217117 ?auto_217118 ) ) ( not ( = ?auto_217117 ?auto_217119 ) ) ( not ( = ?auto_217117 ?auto_217120 ) ) ( not ( = ?auto_217117 ?auto_217121 ) ) ( not ( = ?auto_217117 ?auto_217122 ) ) ( not ( = ?auto_217117 ?auto_217123 ) ) ( not ( = ?auto_217117 ?auto_217124 ) ) ( not ( = ?auto_217117 ?auto_217125 ) ) ( not ( = ?auto_217118 ?auto_217119 ) ) ( not ( = ?auto_217118 ?auto_217120 ) ) ( not ( = ?auto_217118 ?auto_217121 ) ) ( not ( = ?auto_217118 ?auto_217122 ) ) ( not ( = ?auto_217118 ?auto_217123 ) ) ( not ( = ?auto_217118 ?auto_217124 ) ) ( not ( = ?auto_217118 ?auto_217125 ) ) ( not ( = ?auto_217119 ?auto_217120 ) ) ( not ( = ?auto_217119 ?auto_217121 ) ) ( not ( = ?auto_217119 ?auto_217122 ) ) ( not ( = ?auto_217119 ?auto_217123 ) ) ( not ( = ?auto_217119 ?auto_217124 ) ) ( not ( = ?auto_217119 ?auto_217125 ) ) ( not ( = ?auto_217120 ?auto_217121 ) ) ( not ( = ?auto_217120 ?auto_217122 ) ) ( not ( = ?auto_217120 ?auto_217123 ) ) ( not ( = ?auto_217120 ?auto_217124 ) ) ( not ( = ?auto_217120 ?auto_217125 ) ) ( not ( = ?auto_217121 ?auto_217122 ) ) ( not ( = ?auto_217121 ?auto_217123 ) ) ( not ( = ?auto_217121 ?auto_217124 ) ) ( not ( = ?auto_217121 ?auto_217125 ) ) ( not ( = ?auto_217122 ?auto_217123 ) ) ( not ( = ?auto_217122 ?auto_217124 ) ) ( not ( = ?auto_217122 ?auto_217125 ) ) ( not ( = ?auto_217123 ?auto_217124 ) ) ( not ( = ?auto_217123 ?auto_217125 ) ) ( not ( = ?auto_217124 ?auto_217125 ) ) ( ON ?auto_217123 ?auto_217124 ) ( ON ?auto_217122 ?auto_217123 ) ( ON ?auto_217121 ?auto_217122 ) ( ON ?auto_217120 ?auto_217121 ) ( ON ?auto_217119 ?auto_217120 ) ( ON ?auto_217118 ?auto_217119 ) ( ON ?auto_217117 ?auto_217118 ) ( ON ?auto_217116 ?auto_217117 ) ( CLEAR ?auto_217116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217116 )
      ( MAKE-9PILE ?auto_217116 ?auto_217117 ?auto_217118 ?auto_217119 ?auto_217120 ?auto_217121 ?auto_217122 ?auto_217123 ?auto_217124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217136 - BLOCK
      ?auto_217137 - BLOCK
      ?auto_217138 - BLOCK
      ?auto_217139 - BLOCK
      ?auto_217140 - BLOCK
      ?auto_217141 - BLOCK
      ?auto_217142 - BLOCK
      ?auto_217143 - BLOCK
      ?auto_217144 - BLOCK
      ?auto_217145 - BLOCK
    )
    :vars
    (
      ?auto_217146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_217144 ) ( ON ?auto_217145 ?auto_217146 ) ( CLEAR ?auto_217145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_217136 ) ( ON ?auto_217137 ?auto_217136 ) ( ON ?auto_217138 ?auto_217137 ) ( ON ?auto_217139 ?auto_217138 ) ( ON ?auto_217140 ?auto_217139 ) ( ON ?auto_217141 ?auto_217140 ) ( ON ?auto_217142 ?auto_217141 ) ( ON ?auto_217143 ?auto_217142 ) ( ON ?auto_217144 ?auto_217143 ) ( not ( = ?auto_217136 ?auto_217137 ) ) ( not ( = ?auto_217136 ?auto_217138 ) ) ( not ( = ?auto_217136 ?auto_217139 ) ) ( not ( = ?auto_217136 ?auto_217140 ) ) ( not ( = ?auto_217136 ?auto_217141 ) ) ( not ( = ?auto_217136 ?auto_217142 ) ) ( not ( = ?auto_217136 ?auto_217143 ) ) ( not ( = ?auto_217136 ?auto_217144 ) ) ( not ( = ?auto_217136 ?auto_217145 ) ) ( not ( = ?auto_217136 ?auto_217146 ) ) ( not ( = ?auto_217137 ?auto_217138 ) ) ( not ( = ?auto_217137 ?auto_217139 ) ) ( not ( = ?auto_217137 ?auto_217140 ) ) ( not ( = ?auto_217137 ?auto_217141 ) ) ( not ( = ?auto_217137 ?auto_217142 ) ) ( not ( = ?auto_217137 ?auto_217143 ) ) ( not ( = ?auto_217137 ?auto_217144 ) ) ( not ( = ?auto_217137 ?auto_217145 ) ) ( not ( = ?auto_217137 ?auto_217146 ) ) ( not ( = ?auto_217138 ?auto_217139 ) ) ( not ( = ?auto_217138 ?auto_217140 ) ) ( not ( = ?auto_217138 ?auto_217141 ) ) ( not ( = ?auto_217138 ?auto_217142 ) ) ( not ( = ?auto_217138 ?auto_217143 ) ) ( not ( = ?auto_217138 ?auto_217144 ) ) ( not ( = ?auto_217138 ?auto_217145 ) ) ( not ( = ?auto_217138 ?auto_217146 ) ) ( not ( = ?auto_217139 ?auto_217140 ) ) ( not ( = ?auto_217139 ?auto_217141 ) ) ( not ( = ?auto_217139 ?auto_217142 ) ) ( not ( = ?auto_217139 ?auto_217143 ) ) ( not ( = ?auto_217139 ?auto_217144 ) ) ( not ( = ?auto_217139 ?auto_217145 ) ) ( not ( = ?auto_217139 ?auto_217146 ) ) ( not ( = ?auto_217140 ?auto_217141 ) ) ( not ( = ?auto_217140 ?auto_217142 ) ) ( not ( = ?auto_217140 ?auto_217143 ) ) ( not ( = ?auto_217140 ?auto_217144 ) ) ( not ( = ?auto_217140 ?auto_217145 ) ) ( not ( = ?auto_217140 ?auto_217146 ) ) ( not ( = ?auto_217141 ?auto_217142 ) ) ( not ( = ?auto_217141 ?auto_217143 ) ) ( not ( = ?auto_217141 ?auto_217144 ) ) ( not ( = ?auto_217141 ?auto_217145 ) ) ( not ( = ?auto_217141 ?auto_217146 ) ) ( not ( = ?auto_217142 ?auto_217143 ) ) ( not ( = ?auto_217142 ?auto_217144 ) ) ( not ( = ?auto_217142 ?auto_217145 ) ) ( not ( = ?auto_217142 ?auto_217146 ) ) ( not ( = ?auto_217143 ?auto_217144 ) ) ( not ( = ?auto_217143 ?auto_217145 ) ) ( not ( = ?auto_217143 ?auto_217146 ) ) ( not ( = ?auto_217144 ?auto_217145 ) ) ( not ( = ?auto_217144 ?auto_217146 ) ) ( not ( = ?auto_217145 ?auto_217146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_217145 ?auto_217146 )
      ( !STACK ?auto_217145 ?auto_217144 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217157 - BLOCK
      ?auto_217158 - BLOCK
      ?auto_217159 - BLOCK
      ?auto_217160 - BLOCK
      ?auto_217161 - BLOCK
      ?auto_217162 - BLOCK
      ?auto_217163 - BLOCK
      ?auto_217164 - BLOCK
      ?auto_217165 - BLOCK
      ?auto_217166 - BLOCK
    )
    :vars
    (
      ?auto_217167 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_217165 ) ( ON ?auto_217166 ?auto_217167 ) ( CLEAR ?auto_217166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_217157 ) ( ON ?auto_217158 ?auto_217157 ) ( ON ?auto_217159 ?auto_217158 ) ( ON ?auto_217160 ?auto_217159 ) ( ON ?auto_217161 ?auto_217160 ) ( ON ?auto_217162 ?auto_217161 ) ( ON ?auto_217163 ?auto_217162 ) ( ON ?auto_217164 ?auto_217163 ) ( ON ?auto_217165 ?auto_217164 ) ( not ( = ?auto_217157 ?auto_217158 ) ) ( not ( = ?auto_217157 ?auto_217159 ) ) ( not ( = ?auto_217157 ?auto_217160 ) ) ( not ( = ?auto_217157 ?auto_217161 ) ) ( not ( = ?auto_217157 ?auto_217162 ) ) ( not ( = ?auto_217157 ?auto_217163 ) ) ( not ( = ?auto_217157 ?auto_217164 ) ) ( not ( = ?auto_217157 ?auto_217165 ) ) ( not ( = ?auto_217157 ?auto_217166 ) ) ( not ( = ?auto_217157 ?auto_217167 ) ) ( not ( = ?auto_217158 ?auto_217159 ) ) ( not ( = ?auto_217158 ?auto_217160 ) ) ( not ( = ?auto_217158 ?auto_217161 ) ) ( not ( = ?auto_217158 ?auto_217162 ) ) ( not ( = ?auto_217158 ?auto_217163 ) ) ( not ( = ?auto_217158 ?auto_217164 ) ) ( not ( = ?auto_217158 ?auto_217165 ) ) ( not ( = ?auto_217158 ?auto_217166 ) ) ( not ( = ?auto_217158 ?auto_217167 ) ) ( not ( = ?auto_217159 ?auto_217160 ) ) ( not ( = ?auto_217159 ?auto_217161 ) ) ( not ( = ?auto_217159 ?auto_217162 ) ) ( not ( = ?auto_217159 ?auto_217163 ) ) ( not ( = ?auto_217159 ?auto_217164 ) ) ( not ( = ?auto_217159 ?auto_217165 ) ) ( not ( = ?auto_217159 ?auto_217166 ) ) ( not ( = ?auto_217159 ?auto_217167 ) ) ( not ( = ?auto_217160 ?auto_217161 ) ) ( not ( = ?auto_217160 ?auto_217162 ) ) ( not ( = ?auto_217160 ?auto_217163 ) ) ( not ( = ?auto_217160 ?auto_217164 ) ) ( not ( = ?auto_217160 ?auto_217165 ) ) ( not ( = ?auto_217160 ?auto_217166 ) ) ( not ( = ?auto_217160 ?auto_217167 ) ) ( not ( = ?auto_217161 ?auto_217162 ) ) ( not ( = ?auto_217161 ?auto_217163 ) ) ( not ( = ?auto_217161 ?auto_217164 ) ) ( not ( = ?auto_217161 ?auto_217165 ) ) ( not ( = ?auto_217161 ?auto_217166 ) ) ( not ( = ?auto_217161 ?auto_217167 ) ) ( not ( = ?auto_217162 ?auto_217163 ) ) ( not ( = ?auto_217162 ?auto_217164 ) ) ( not ( = ?auto_217162 ?auto_217165 ) ) ( not ( = ?auto_217162 ?auto_217166 ) ) ( not ( = ?auto_217162 ?auto_217167 ) ) ( not ( = ?auto_217163 ?auto_217164 ) ) ( not ( = ?auto_217163 ?auto_217165 ) ) ( not ( = ?auto_217163 ?auto_217166 ) ) ( not ( = ?auto_217163 ?auto_217167 ) ) ( not ( = ?auto_217164 ?auto_217165 ) ) ( not ( = ?auto_217164 ?auto_217166 ) ) ( not ( = ?auto_217164 ?auto_217167 ) ) ( not ( = ?auto_217165 ?auto_217166 ) ) ( not ( = ?auto_217165 ?auto_217167 ) ) ( not ( = ?auto_217166 ?auto_217167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_217166 ?auto_217167 )
      ( !STACK ?auto_217166 ?auto_217165 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217178 - BLOCK
      ?auto_217179 - BLOCK
      ?auto_217180 - BLOCK
      ?auto_217181 - BLOCK
      ?auto_217182 - BLOCK
      ?auto_217183 - BLOCK
      ?auto_217184 - BLOCK
      ?auto_217185 - BLOCK
      ?auto_217186 - BLOCK
      ?auto_217187 - BLOCK
    )
    :vars
    (
      ?auto_217188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217187 ?auto_217188 ) ( ON-TABLE ?auto_217178 ) ( ON ?auto_217179 ?auto_217178 ) ( ON ?auto_217180 ?auto_217179 ) ( ON ?auto_217181 ?auto_217180 ) ( ON ?auto_217182 ?auto_217181 ) ( ON ?auto_217183 ?auto_217182 ) ( ON ?auto_217184 ?auto_217183 ) ( ON ?auto_217185 ?auto_217184 ) ( not ( = ?auto_217178 ?auto_217179 ) ) ( not ( = ?auto_217178 ?auto_217180 ) ) ( not ( = ?auto_217178 ?auto_217181 ) ) ( not ( = ?auto_217178 ?auto_217182 ) ) ( not ( = ?auto_217178 ?auto_217183 ) ) ( not ( = ?auto_217178 ?auto_217184 ) ) ( not ( = ?auto_217178 ?auto_217185 ) ) ( not ( = ?auto_217178 ?auto_217186 ) ) ( not ( = ?auto_217178 ?auto_217187 ) ) ( not ( = ?auto_217178 ?auto_217188 ) ) ( not ( = ?auto_217179 ?auto_217180 ) ) ( not ( = ?auto_217179 ?auto_217181 ) ) ( not ( = ?auto_217179 ?auto_217182 ) ) ( not ( = ?auto_217179 ?auto_217183 ) ) ( not ( = ?auto_217179 ?auto_217184 ) ) ( not ( = ?auto_217179 ?auto_217185 ) ) ( not ( = ?auto_217179 ?auto_217186 ) ) ( not ( = ?auto_217179 ?auto_217187 ) ) ( not ( = ?auto_217179 ?auto_217188 ) ) ( not ( = ?auto_217180 ?auto_217181 ) ) ( not ( = ?auto_217180 ?auto_217182 ) ) ( not ( = ?auto_217180 ?auto_217183 ) ) ( not ( = ?auto_217180 ?auto_217184 ) ) ( not ( = ?auto_217180 ?auto_217185 ) ) ( not ( = ?auto_217180 ?auto_217186 ) ) ( not ( = ?auto_217180 ?auto_217187 ) ) ( not ( = ?auto_217180 ?auto_217188 ) ) ( not ( = ?auto_217181 ?auto_217182 ) ) ( not ( = ?auto_217181 ?auto_217183 ) ) ( not ( = ?auto_217181 ?auto_217184 ) ) ( not ( = ?auto_217181 ?auto_217185 ) ) ( not ( = ?auto_217181 ?auto_217186 ) ) ( not ( = ?auto_217181 ?auto_217187 ) ) ( not ( = ?auto_217181 ?auto_217188 ) ) ( not ( = ?auto_217182 ?auto_217183 ) ) ( not ( = ?auto_217182 ?auto_217184 ) ) ( not ( = ?auto_217182 ?auto_217185 ) ) ( not ( = ?auto_217182 ?auto_217186 ) ) ( not ( = ?auto_217182 ?auto_217187 ) ) ( not ( = ?auto_217182 ?auto_217188 ) ) ( not ( = ?auto_217183 ?auto_217184 ) ) ( not ( = ?auto_217183 ?auto_217185 ) ) ( not ( = ?auto_217183 ?auto_217186 ) ) ( not ( = ?auto_217183 ?auto_217187 ) ) ( not ( = ?auto_217183 ?auto_217188 ) ) ( not ( = ?auto_217184 ?auto_217185 ) ) ( not ( = ?auto_217184 ?auto_217186 ) ) ( not ( = ?auto_217184 ?auto_217187 ) ) ( not ( = ?auto_217184 ?auto_217188 ) ) ( not ( = ?auto_217185 ?auto_217186 ) ) ( not ( = ?auto_217185 ?auto_217187 ) ) ( not ( = ?auto_217185 ?auto_217188 ) ) ( not ( = ?auto_217186 ?auto_217187 ) ) ( not ( = ?auto_217186 ?auto_217188 ) ) ( not ( = ?auto_217187 ?auto_217188 ) ) ( CLEAR ?auto_217185 ) ( ON ?auto_217186 ?auto_217187 ) ( CLEAR ?auto_217186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_217178 ?auto_217179 ?auto_217180 ?auto_217181 ?auto_217182 ?auto_217183 ?auto_217184 ?auto_217185 ?auto_217186 )
      ( MAKE-10PILE ?auto_217178 ?auto_217179 ?auto_217180 ?auto_217181 ?auto_217182 ?auto_217183 ?auto_217184 ?auto_217185 ?auto_217186 ?auto_217187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217199 - BLOCK
      ?auto_217200 - BLOCK
      ?auto_217201 - BLOCK
      ?auto_217202 - BLOCK
      ?auto_217203 - BLOCK
      ?auto_217204 - BLOCK
      ?auto_217205 - BLOCK
      ?auto_217206 - BLOCK
      ?auto_217207 - BLOCK
      ?auto_217208 - BLOCK
    )
    :vars
    (
      ?auto_217209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217208 ?auto_217209 ) ( ON-TABLE ?auto_217199 ) ( ON ?auto_217200 ?auto_217199 ) ( ON ?auto_217201 ?auto_217200 ) ( ON ?auto_217202 ?auto_217201 ) ( ON ?auto_217203 ?auto_217202 ) ( ON ?auto_217204 ?auto_217203 ) ( ON ?auto_217205 ?auto_217204 ) ( ON ?auto_217206 ?auto_217205 ) ( not ( = ?auto_217199 ?auto_217200 ) ) ( not ( = ?auto_217199 ?auto_217201 ) ) ( not ( = ?auto_217199 ?auto_217202 ) ) ( not ( = ?auto_217199 ?auto_217203 ) ) ( not ( = ?auto_217199 ?auto_217204 ) ) ( not ( = ?auto_217199 ?auto_217205 ) ) ( not ( = ?auto_217199 ?auto_217206 ) ) ( not ( = ?auto_217199 ?auto_217207 ) ) ( not ( = ?auto_217199 ?auto_217208 ) ) ( not ( = ?auto_217199 ?auto_217209 ) ) ( not ( = ?auto_217200 ?auto_217201 ) ) ( not ( = ?auto_217200 ?auto_217202 ) ) ( not ( = ?auto_217200 ?auto_217203 ) ) ( not ( = ?auto_217200 ?auto_217204 ) ) ( not ( = ?auto_217200 ?auto_217205 ) ) ( not ( = ?auto_217200 ?auto_217206 ) ) ( not ( = ?auto_217200 ?auto_217207 ) ) ( not ( = ?auto_217200 ?auto_217208 ) ) ( not ( = ?auto_217200 ?auto_217209 ) ) ( not ( = ?auto_217201 ?auto_217202 ) ) ( not ( = ?auto_217201 ?auto_217203 ) ) ( not ( = ?auto_217201 ?auto_217204 ) ) ( not ( = ?auto_217201 ?auto_217205 ) ) ( not ( = ?auto_217201 ?auto_217206 ) ) ( not ( = ?auto_217201 ?auto_217207 ) ) ( not ( = ?auto_217201 ?auto_217208 ) ) ( not ( = ?auto_217201 ?auto_217209 ) ) ( not ( = ?auto_217202 ?auto_217203 ) ) ( not ( = ?auto_217202 ?auto_217204 ) ) ( not ( = ?auto_217202 ?auto_217205 ) ) ( not ( = ?auto_217202 ?auto_217206 ) ) ( not ( = ?auto_217202 ?auto_217207 ) ) ( not ( = ?auto_217202 ?auto_217208 ) ) ( not ( = ?auto_217202 ?auto_217209 ) ) ( not ( = ?auto_217203 ?auto_217204 ) ) ( not ( = ?auto_217203 ?auto_217205 ) ) ( not ( = ?auto_217203 ?auto_217206 ) ) ( not ( = ?auto_217203 ?auto_217207 ) ) ( not ( = ?auto_217203 ?auto_217208 ) ) ( not ( = ?auto_217203 ?auto_217209 ) ) ( not ( = ?auto_217204 ?auto_217205 ) ) ( not ( = ?auto_217204 ?auto_217206 ) ) ( not ( = ?auto_217204 ?auto_217207 ) ) ( not ( = ?auto_217204 ?auto_217208 ) ) ( not ( = ?auto_217204 ?auto_217209 ) ) ( not ( = ?auto_217205 ?auto_217206 ) ) ( not ( = ?auto_217205 ?auto_217207 ) ) ( not ( = ?auto_217205 ?auto_217208 ) ) ( not ( = ?auto_217205 ?auto_217209 ) ) ( not ( = ?auto_217206 ?auto_217207 ) ) ( not ( = ?auto_217206 ?auto_217208 ) ) ( not ( = ?auto_217206 ?auto_217209 ) ) ( not ( = ?auto_217207 ?auto_217208 ) ) ( not ( = ?auto_217207 ?auto_217209 ) ) ( not ( = ?auto_217208 ?auto_217209 ) ) ( CLEAR ?auto_217206 ) ( ON ?auto_217207 ?auto_217208 ) ( CLEAR ?auto_217207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_217199 ?auto_217200 ?auto_217201 ?auto_217202 ?auto_217203 ?auto_217204 ?auto_217205 ?auto_217206 ?auto_217207 )
      ( MAKE-10PILE ?auto_217199 ?auto_217200 ?auto_217201 ?auto_217202 ?auto_217203 ?auto_217204 ?auto_217205 ?auto_217206 ?auto_217207 ?auto_217208 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217220 - BLOCK
      ?auto_217221 - BLOCK
      ?auto_217222 - BLOCK
      ?auto_217223 - BLOCK
      ?auto_217224 - BLOCK
      ?auto_217225 - BLOCK
      ?auto_217226 - BLOCK
      ?auto_217227 - BLOCK
      ?auto_217228 - BLOCK
      ?auto_217229 - BLOCK
    )
    :vars
    (
      ?auto_217230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217229 ?auto_217230 ) ( ON-TABLE ?auto_217220 ) ( ON ?auto_217221 ?auto_217220 ) ( ON ?auto_217222 ?auto_217221 ) ( ON ?auto_217223 ?auto_217222 ) ( ON ?auto_217224 ?auto_217223 ) ( ON ?auto_217225 ?auto_217224 ) ( ON ?auto_217226 ?auto_217225 ) ( not ( = ?auto_217220 ?auto_217221 ) ) ( not ( = ?auto_217220 ?auto_217222 ) ) ( not ( = ?auto_217220 ?auto_217223 ) ) ( not ( = ?auto_217220 ?auto_217224 ) ) ( not ( = ?auto_217220 ?auto_217225 ) ) ( not ( = ?auto_217220 ?auto_217226 ) ) ( not ( = ?auto_217220 ?auto_217227 ) ) ( not ( = ?auto_217220 ?auto_217228 ) ) ( not ( = ?auto_217220 ?auto_217229 ) ) ( not ( = ?auto_217220 ?auto_217230 ) ) ( not ( = ?auto_217221 ?auto_217222 ) ) ( not ( = ?auto_217221 ?auto_217223 ) ) ( not ( = ?auto_217221 ?auto_217224 ) ) ( not ( = ?auto_217221 ?auto_217225 ) ) ( not ( = ?auto_217221 ?auto_217226 ) ) ( not ( = ?auto_217221 ?auto_217227 ) ) ( not ( = ?auto_217221 ?auto_217228 ) ) ( not ( = ?auto_217221 ?auto_217229 ) ) ( not ( = ?auto_217221 ?auto_217230 ) ) ( not ( = ?auto_217222 ?auto_217223 ) ) ( not ( = ?auto_217222 ?auto_217224 ) ) ( not ( = ?auto_217222 ?auto_217225 ) ) ( not ( = ?auto_217222 ?auto_217226 ) ) ( not ( = ?auto_217222 ?auto_217227 ) ) ( not ( = ?auto_217222 ?auto_217228 ) ) ( not ( = ?auto_217222 ?auto_217229 ) ) ( not ( = ?auto_217222 ?auto_217230 ) ) ( not ( = ?auto_217223 ?auto_217224 ) ) ( not ( = ?auto_217223 ?auto_217225 ) ) ( not ( = ?auto_217223 ?auto_217226 ) ) ( not ( = ?auto_217223 ?auto_217227 ) ) ( not ( = ?auto_217223 ?auto_217228 ) ) ( not ( = ?auto_217223 ?auto_217229 ) ) ( not ( = ?auto_217223 ?auto_217230 ) ) ( not ( = ?auto_217224 ?auto_217225 ) ) ( not ( = ?auto_217224 ?auto_217226 ) ) ( not ( = ?auto_217224 ?auto_217227 ) ) ( not ( = ?auto_217224 ?auto_217228 ) ) ( not ( = ?auto_217224 ?auto_217229 ) ) ( not ( = ?auto_217224 ?auto_217230 ) ) ( not ( = ?auto_217225 ?auto_217226 ) ) ( not ( = ?auto_217225 ?auto_217227 ) ) ( not ( = ?auto_217225 ?auto_217228 ) ) ( not ( = ?auto_217225 ?auto_217229 ) ) ( not ( = ?auto_217225 ?auto_217230 ) ) ( not ( = ?auto_217226 ?auto_217227 ) ) ( not ( = ?auto_217226 ?auto_217228 ) ) ( not ( = ?auto_217226 ?auto_217229 ) ) ( not ( = ?auto_217226 ?auto_217230 ) ) ( not ( = ?auto_217227 ?auto_217228 ) ) ( not ( = ?auto_217227 ?auto_217229 ) ) ( not ( = ?auto_217227 ?auto_217230 ) ) ( not ( = ?auto_217228 ?auto_217229 ) ) ( not ( = ?auto_217228 ?auto_217230 ) ) ( not ( = ?auto_217229 ?auto_217230 ) ) ( ON ?auto_217228 ?auto_217229 ) ( CLEAR ?auto_217226 ) ( ON ?auto_217227 ?auto_217228 ) ( CLEAR ?auto_217227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217220 ?auto_217221 ?auto_217222 ?auto_217223 ?auto_217224 ?auto_217225 ?auto_217226 ?auto_217227 )
      ( MAKE-10PILE ?auto_217220 ?auto_217221 ?auto_217222 ?auto_217223 ?auto_217224 ?auto_217225 ?auto_217226 ?auto_217227 ?auto_217228 ?auto_217229 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217241 - BLOCK
      ?auto_217242 - BLOCK
      ?auto_217243 - BLOCK
      ?auto_217244 - BLOCK
      ?auto_217245 - BLOCK
      ?auto_217246 - BLOCK
      ?auto_217247 - BLOCK
      ?auto_217248 - BLOCK
      ?auto_217249 - BLOCK
      ?auto_217250 - BLOCK
    )
    :vars
    (
      ?auto_217251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217250 ?auto_217251 ) ( ON-TABLE ?auto_217241 ) ( ON ?auto_217242 ?auto_217241 ) ( ON ?auto_217243 ?auto_217242 ) ( ON ?auto_217244 ?auto_217243 ) ( ON ?auto_217245 ?auto_217244 ) ( ON ?auto_217246 ?auto_217245 ) ( ON ?auto_217247 ?auto_217246 ) ( not ( = ?auto_217241 ?auto_217242 ) ) ( not ( = ?auto_217241 ?auto_217243 ) ) ( not ( = ?auto_217241 ?auto_217244 ) ) ( not ( = ?auto_217241 ?auto_217245 ) ) ( not ( = ?auto_217241 ?auto_217246 ) ) ( not ( = ?auto_217241 ?auto_217247 ) ) ( not ( = ?auto_217241 ?auto_217248 ) ) ( not ( = ?auto_217241 ?auto_217249 ) ) ( not ( = ?auto_217241 ?auto_217250 ) ) ( not ( = ?auto_217241 ?auto_217251 ) ) ( not ( = ?auto_217242 ?auto_217243 ) ) ( not ( = ?auto_217242 ?auto_217244 ) ) ( not ( = ?auto_217242 ?auto_217245 ) ) ( not ( = ?auto_217242 ?auto_217246 ) ) ( not ( = ?auto_217242 ?auto_217247 ) ) ( not ( = ?auto_217242 ?auto_217248 ) ) ( not ( = ?auto_217242 ?auto_217249 ) ) ( not ( = ?auto_217242 ?auto_217250 ) ) ( not ( = ?auto_217242 ?auto_217251 ) ) ( not ( = ?auto_217243 ?auto_217244 ) ) ( not ( = ?auto_217243 ?auto_217245 ) ) ( not ( = ?auto_217243 ?auto_217246 ) ) ( not ( = ?auto_217243 ?auto_217247 ) ) ( not ( = ?auto_217243 ?auto_217248 ) ) ( not ( = ?auto_217243 ?auto_217249 ) ) ( not ( = ?auto_217243 ?auto_217250 ) ) ( not ( = ?auto_217243 ?auto_217251 ) ) ( not ( = ?auto_217244 ?auto_217245 ) ) ( not ( = ?auto_217244 ?auto_217246 ) ) ( not ( = ?auto_217244 ?auto_217247 ) ) ( not ( = ?auto_217244 ?auto_217248 ) ) ( not ( = ?auto_217244 ?auto_217249 ) ) ( not ( = ?auto_217244 ?auto_217250 ) ) ( not ( = ?auto_217244 ?auto_217251 ) ) ( not ( = ?auto_217245 ?auto_217246 ) ) ( not ( = ?auto_217245 ?auto_217247 ) ) ( not ( = ?auto_217245 ?auto_217248 ) ) ( not ( = ?auto_217245 ?auto_217249 ) ) ( not ( = ?auto_217245 ?auto_217250 ) ) ( not ( = ?auto_217245 ?auto_217251 ) ) ( not ( = ?auto_217246 ?auto_217247 ) ) ( not ( = ?auto_217246 ?auto_217248 ) ) ( not ( = ?auto_217246 ?auto_217249 ) ) ( not ( = ?auto_217246 ?auto_217250 ) ) ( not ( = ?auto_217246 ?auto_217251 ) ) ( not ( = ?auto_217247 ?auto_217248 ) ) ( not ( = ?auto_217247 ?auto_217249 ) ) ( not ( = ?auto_217247 ?auto_217250 ) ) ( not ( = ?auto_217247 ?auto_217251 ) ) ( not ( = ?auto_217248 ?auto_217249 ) ) ( not ( = ?auto_217248 ?auto_217250 ) ) ( not ( = ?auto_217248 ?auto_217251 ) ) ( not ( = ?auto_217249 ?auto_217250 ) ) ( not ( = ?auto_217249 ?auto_217251 ) ) ( not ( = ?auto_217250 ?auto_217251 ) ) ( ON ?auto_217249 ?auto_217250 ) ( CLEAR ?auto_217247 ) ( ON ?auto_217248 ?auto_217249 ) ( CLEAR ?auto_217248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217241 ?auto_217242 ?auto_217243 ?auto_217244 ?auto_217245 ?auto_217246 ?auto_217247 ?auto_217248 )
      ( MAKE-10PILE ?auto_217241 ?auto_217242 ?auto_217243 ?auto_217244 ?auto_217245 ?auto_217246 ?auto_217247 ?auto_217248 ?auto_217249 ?auto_217250 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217262 - BLOCK
      ?auto_217263 - BLOCK
      ?auto_217264 - BLOCK
      ?auto_217265 - BLOCK
      ?auto_217266 - BLOCK
      ?auto_217267 - BLOCK
      ?auto_217268 - BLOCK
      ?auto_217269 - BLOCK
      ?auto_217270 - BLOCK
      ?auto_217271 - BLOCK
    )
    :vars
    (
      ?auto_217272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217271 ?auto_217272 ) ( ON-TABLE ?auto_217262 ) ( ON ?auto_217263 ?auto_217262 ) ( ON ?auto_217264 ?auto_217263 ) ( ON ?auto_217265 ?auto_217264 ) ( ON ?auto_217266 ?auto_217265 ) ( ON ?auto_217267 ?auto_217266 ) ( not ( = ?auto_217262 ?auto_217263 ) ) ( not ( = ?auto_217262 ?auto_217264 ) ) ( not ( = ?auto_217262 ?auto_217265 ) ) ( not ( = ?auto_217262 ?auto_217266 ) ) ( not ( = ?auto_217262 ?auto_217267 ) ) ( not ( = ?auto_217262 ?auto_217268 ) ) ( not ( = ?auto_217262 ?auto_217269 ) ) ( not ( = ?auto_217262 ?auto_217270 ) ) ( not ( = ?auto_217262 ?auto_217271 ) ) ( not ( = ?auto_217262 ?auto_217272 ) ) ( not ( = ?auto_217263 ?auto_217264 ) ) ( not ( = ?auto_217263 ?auto_217265 ) ) ( not ( = ?auto_217263 ?auto_217266 ) ) ( not ( = ?auto_217263 ?auto_217267 ) ) ( not ( = ?auto_217263 ?auto_217268 ) ) ( not ( = ?auto_217263 ?auto_217269 ) ) ( not ( = ?auto_217263 ?auto_217270 ) ) ( not ( = ?auto_217263 ?auto_217271 ) ) ( not ( = ?auto_217263 ?auto_217272 ) ) ( not ( = ?auto_217264 ?auto_217265 ) ) ( not ( = ?auto_217264 ?auto_217266 ) ) ( not ( = ?auto_217264 ?auto_217267 ) ) ( not ( = ?auto_217264 ?auto_217268 ) ) ( not ( = ?auto_217264 ?auto_217269 ) ) ( not ( = ?auto_217264 ?auto_217270 ) ) ( not ( = ?auto_217264 ?auto_217271 ) ) ( not ( = ?auto_217264 ?auto_217272 ) ) ( not ( = ?auto_217265 ?auto_217266 ) ) ( not ( = ?auto_217265 ?auto_217267 ) ) ( not ( = ?auto_217265 ?auto_217268 ) ) ( not ( = ?auto_217265 ?auto_217269 ) ) ( not ( = ?auto_217265 ?auto_217270 ) ) ( not ( = ?auto_217265 ?auto_217271 ) ) ( not ( = ?auto_217265 ?auto_217272 ) ) ( not ( = ?auto_217266 ?auto_217267 ) ) ( not ( = ?auto_217266 ?auto_217268 ) ) ( not ( = ?auto_217266 ?auto_217269 ) ) ( not ( = ?auto_217266 ?auto_217270 ) ) ( not ( = ?auto_217266 ?auto_217271 ) ) ( not ( = ?auto_217266 ?auto_217272 ) ) ( not ( = ?auto_217267 ?auto_217268 ) ) ( not ( = ?auto_217267 ?auto_217269 ) ) ( not ( = ?auto_217267 ?auto_217270 ) ) ( not ( = ?auto_217267 ?auto_217271 ) ) ( not ( = ?auto_217267 ?auto_217272 ) ) ( not ( = ?auto_217268 ?auto_217269 ) ) ( not ( = ?auto_217268 ?auto_217270 ) ) ( not ( = ?auto_217268 ?auto_217271 ) ) ( not ( = ?auto_217268 ?auto_217272 ) ) ( not ( = ?auto_217269 ?auto_217270 ) ) ( not ( = ?auto_217269 ?auto_217271 ) ) ( not ( = ?auto_217269 ?auto_217272 ) ) ( not ( = ?auto_217270 ?auto_217271 ) ) ( not ( = ?auto_217270 ?auto_217272 ) ) ( not ( = ?auto_217271 ?auto_217272 ) ) ( ON ?auto_217270 ?auto_217271 ) ( ON ?auto_217269 ?auto_217270 ) ( CLEAR ?auto_217267 ) ( ON ?auto_217268 ?auto_217269 ) ( CLEAR ?auto_217268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217262 ?auto_217263 ?auto_217264 ?auto_217265 ?auto_217266 ?auto_217267 ?auto_217268 )
      ( MAKE-10PILE ?auto_217262 ?auto_217263 ?auto_217264 ?auto_217265 ?auto_217266 ?auto_217267 ?auto_217268 ?auto_217269 ?auto_217270 ?auto_217271 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217283 - BLOCK
      ?auto_217284 - BLOCK
      ?auto_217285 - BLOCK
      ?auto_217286 - BLOCK
      ?auto_217287 - BLOCK
      ?auto_217288 - BLOCK
      ?auto_217289 - BLOCK
      ?auto_217290 - BLOCK
      ?auto_217291 - BLOCK
      ?auto_217292 - BLOCK
    )
    :vars
    (
      ?auto_217293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217292 ?auto_217293 ) ( ON-TABLE ?auto_217283 ) ( ON ?auto_217284 ?auto_217283 ) ( ON ?auto_217285 ?auto_217284 ) ( ON ?auto_217286 ?auto_217285 ) ( ON ?auto_217287 ?auto_217286 ) ( ON ?auto_217288 ?auto_217287 ) ( not ( = ?auto_217283 ?auto_217284 ) ) ( not ( = ?auto_217283 ?auto_217285 ) ) ( not ( = ?auto_217283 ?auto_217286 ) ) ( not ( = ?auto_217283 ?auto_217287 ) ) ( not ( = ?auto_217283 ?auto_217288 ) ) ( not ( = ?auto_217283 ?auto_217289 ) ) ( not ( = ?auto_217283 ?auto_217290 ) ) ( not ( = ?auto_217283 ?auto_217291 ) ) ( not ( = ?auto_217283 ?auto_217292 ) ) ( not ( = ?auto_217283 ?auto_217293 ) ) ( not ( = ?auto_217284 ?auto_217285 ) ) ( not ( = ?auto_217284 ?auto_217286 ) ) ( not ( = ?auto_217284 ?auto_217287 ) ) ( not ( = ?auto_217284 ?auto_217288 ) ) ( not ( = ?auto_217284 ?auto_217289 ) ) ( not ( = ?auto_217284 ?auto_217290 ) ) ( not ( = ?auto_217284 ?auto_217291 ) ) ( not ( = ?auto_217284 ?auto_217292 ) ) ( not ( = ?auto_217284 ?auto_217293 ) ) ( not ( = ?auto_217285 ?auto_217286 ) ) ( not ( = ?auto_217285 ?auto_217287 ) ) ( not ( = ?auto_217285 ?auto_217288 ) ) ( not ( = ?auto_217285 ?auto_217289 ) ) ( not ( = ?auto_217285 ?auto_217290 ) ) ( not ( = ?auto_217285 ?auto_217291 ) ) ( not ( = ?auto_217285 ?auto_217292 ) ) ( not ( = ?auto_217285 ?auto_217293 ) ) ( not ( = ?auto_217286 ?auto_217287 ) ) ( not ( = ?auto_217286 ?auto_217288 ) ) ( not ( = ?auto_217286 ?auto_217289 ) ) ( not ( = ?auto_217286 ?auto_217290 ) ) ( not ( = ?auto_217286 ?auto_217291 ) ) ( not ( = ?auto_217286 ?auto_217292 ) ) ( not ( = ?auto_217286 ?auto_217293 ) ) ( not ( = ?auto_217287 ?auto_217288 ) ) ( not ( = ?auto_217287 ?auto_217289 ) ) ( not ( = ?auto_217287 ?auto_217290 ) ) ( not ( = ?auto_217287 ?auto_217291 ) ) ( not ( = ?auto_217287 ?auto_217292 ) ) ( not ( = ?auto_217287 ?auto_217293 ) ) ( not ( = ?auto_217288 ?auto_217289 ) ) ( not ( = ?auto_217288 ?auto_217290 ) ) ( not ( = ?auto_217288 ?auto_217291 ) ) ( not ( = ?auto_217288 ?auto_217292 ) ) ( not ( = ?auto_217288 ?auto_217293 ) ) ( not ( = ?auto_217289 ?auto_217290 ) ) ( not ( = ?auto_217289 ?auto_217291 ) ) ( not ( = ?auto_217289 ?auto_217292 ) ) ( not ( = ?auto_217289 ?auto_217293 ) ) ( not ( = ?auto_217290 ?auto_217291 ) ) ( not ( = ?auto_217290 ?auto_217292 ) ) ( not ( = ?auto_217290 ?auto_217293 ) ) ( not ( = ?auto_217291 ?auto_217292 ) ) ( not ( = ?auto_217291 ?auto_217293 ) ) ( not ( = ?auto_217292 ?auto_217293 ) ) ( ON ?auto_217291 ?auto_217292 ) ( ON ?auto_217290 ?auto_217291 ) ( CLEAR ?auto_217288 ) ( ON ?auto_217289 ?auto_217290 ) ( CLEAR ?auto_217289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217283 ?auto_217284 ?auto_217285 ?auto_217286 ?auto_217287 ?auto_217288 ?auto_217289 )
      ( MAKE-10PILE ?auto_217283 ?auto_217284 ?auto_217285 ?auto_217286 ?auto_217287 ?auto_217288 ?auto_217289 ?auto_217290 ?auto_217291 ?auto_217292 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217304 - BLOCK
      ?auto_217305 - BLOCK
      ?auto_217306 - BLOCK
      ?auto_217307 - BLOCK
      ?auto_217308 - BLOCK
      ?auto_217309 - BLOCK
      ?auto_217310 - BLOCK
      ?auto_217311 - BLOCK
      ?auto_217312 - BLOCK
      ?auto_217313 - BLOCK
    )
    :vars
    (
      ?auto_217314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217313 ?auto_217314 ) ( ON-TABLE ?auto_217304 ) ( ON ?auto_217305 ?auto_217304 ) ( ON ?auto_217306 ?auto_217305 ) ( ON ?auto_217307 ?auto_217306 ) ( ON ?auto_217308 ?auto_217307 ) ( not ( = ?auto_217304 ?auto_217305 ) ) ( not ( = ?auto_217304 ?auto_217306 ) ) ( not ( = ?auto_217304 ?auto_217307 ) ) ( not ( = ?auto_217304 ?auto_217308 ) ) ( not ( = ?auto_217304 ?auto_217309 ) ) ( not ( = ?auto_217304 ?auto_217310 ) ) ( not ( = ?auto_217304 ?auto_217311 ) ) ( not ( = ?auto_217304 ?auto_217312 ) ) ( not ( = ?auto_217304 ?auto_217313 ) ) ( not ( = ?auto_217304 ?auto_217314 ) ) ( not ( = ?auto_217305 ?auto_217306 ) ) ( not ( = ?auto_217305 ?auto_217307 ) ) ( not ( = ?auto_217305 ?auto_217308 ) ) ( not ( = ?auto_217305 ?auto_217309 ) ) ( not ( = ?auto_217305 ?auto_217310 ) ) ( not ( = ?auto_217305 ?auto_217311 ) ) ( not ( = ?auto_217305 ?auto_217312 ) ) ( not ( = ?auto_217305 ?auto_217313 ) ) ( not ( = ?auto_217305 ?auto_217314 ) ) ( not ( = ?auto_217306 ?auto_217307 ) ) ( not ( = ?auto_217306 ?auto_217308 ) ) ( not ( = ?auto_217306 ?auto_217309 ) ) ( not ( = ?auto_217306 ?auto_217310 ) ) ( not ( = ?auto_217306 ?auto_217311 ) ) ( not ( = ?auto_217306 ?auto_217312 ) ) ( not ( = ?auto_217306 ?auto_217313 ) ) ( not ( = ?auto_217306 ?auto_217314 ) ) ( not ( = ?auto_217307 ?auto_217308 ) ) ( not ( = ?auto_217307 ?auto_217309 ) ) ( not ( = ?auto_217307 ?auto_217310 ) ) ( not ( = ?auto_217307 ?auto_217311 ) ) ( not ( = ?auto_217307 ?auto_217312 ) ) ( not ( = ?auto_217307 ?auto_217313 ) ) ( not ( = ?auto_217307 ?auto_217314 ) ) ( not ( = ?auto_217308 ?auto_217309 ) ) ( not ( = ?auto_217308 ?auto_217310 ) ) ( not ( = ?auto_217308 ?auto_217311 ) ) ( not ( = ?auto_217308 ?auto_217312 ) ) ( not ( = ?auto_217308 ?auto_217313 ) ) ( not ( = ?auto_217308 ?auto_217314 ) ) ( not ( = ?auto_217309 ?auto_217310 ) ) ( not ( = ?auto_217309 ?auto_217311 ) ) ( not ( = ?auto_217309 ?auto_217312 ) ) ( not ( = ?auto_217309 ?auto_217313 ) ) ( not ( = ?auto_217309 ?auto_217314 ) ) ( not ( = ?auto_217310 ?auto_217311 ) ) ( not ( = ?auto_217310 ?auto_217312 ) ) ( not ( = ?auto_217310 ?auto_217313 ) ) ( not ( = ?auto_217310 ?auto_217314 ) ) ( not ( = ?auto_217311 ?auto_217312 ) ) ( not ( = ?auto_217311 ?auto_217313 ) ) ( not ( = ?auto_217311 ?auto_217314 ) ) ( not ( = ?auto_217312 ?auto_217313 ) ) ( not ( = ?auto_217312 ?auto_217314 ) ) ( not ( = ?auto_217313 ?auto_217314 ) ) ( ON ?auto_217312 ?auto_217313 ) ( ON ?auto_217311 ?auto_217312 ) ( ON ?auto_217310 ?auto_217311 ) ( CLEAR ?auto_217308 ) ( ON ?auto_217309 ?auto_217310 ) ( CLEAR ?auto_217309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217304 ?auto_217305 ?auto_217306 ?auto_217307 ?auto_217308 ?auto_217309 )
      ( MAKE-10PILE ?auto_217304 ?auto_217305 ?auto_217306 ?auto_217307 ?auto_217308 ?auto_217309 ?auto_217310 ?auto_217311 ?auto_217312 ?auto_217313 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217325 - BLOCK
      ?auto_217326 - BLOCK
      ?auto_217327 - BLOCK
      ?auto_217328 - BLOCK
      ?auto_217329 - BLOCK
      ?auto_217330 - BLOCK
      ?auto_217331 - BLOCK
      ?auto_217332 - BLOCK
      ?auto_217333 - BLOCK
      ?auto_217334 - BLOCK
    )
    :vars
    (
      ?auto_217335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217334 ?auto_217335 ) ( ON-TABLE ?auto_217325 ) ( ON ?auto_217326 ?auto_217325 ) ( ON ?auto_217327 ?auto_217326 ) ( ON ?auto_217328 ?auto_217327 ) ( ON ?auto_217329 ?auto_217328 ) ( not ( = ?auto_217325 ?auto_217326 ) ) ( not ( = ?auto_217325 ?auto_217327 ) ) ( not ( = ?auto_217325 ?auto_217328 ) ) ( not ( = ?auto_217325 ?auto_217329 ) ) ( not ( = ?auto_217325 ?auto_217330 ) ) ( not ( = ?auto_217325 ?auto_217331 ) ) ( not ( = ?auto_217325 ?auto_217332 ) ) ( not ( = ?auto_217325 ?auto_217333 ) ) ( not ( = ?auto_217325 ?auto_217334 ) ) ( not ( = ?auto_217325 ?auto_217335 ) ) ( not ( = ?auto_217326 ?auto_217327 ) ) ( not ( = ?auto_217326 ?auto_217328 ) ) ( not ( = ?auto_217326 ?auto_217329 ) ) ( not ( = ?auto_217326 ?auto_217330 ) ) ( not ( = ?auto_217326 ?auto_217331 ) ) ( not ( = ?auto_217326 ?auto_217332 ) ) ( not ( = ?auto_217326 ?auto_217333 ) ) ( not ( = ?auto_217326 ?auto_217334 ) ) ( not ( = ?auto_217326 ?auto_217335 ) ) ( not ( = ?auto_217327 ?auto_217328 ) ) ( not ( = ?auto_217327 ?auto_217329 ) ) ( not ( = ?auto_217327 ?auto_217330 ) ) ( not ( = ?auto_217327 ?auto_217331 ) ) ( not ( = ?auto_217327 ?auto_217332 ) ) ( not ( = ?auto_217327 ?auto_217333 ) ) ( not ( = ?auto_217327 ?auto_217334 ) ) ( not ( = ?auto_217327 ?auto_217335 ) ) ( not ( = ?auto_217328 ?auto_217329 ) ) ( not ( = ?auto_217328 ?auto_217330 ) ) ( not ( = ?auto_217328 ?auto_217331 ) ) ( not ( = ?auto_217328 ?auto_217332 ) ) ( not ( = ?auto_217328 ?auto_217333 ) ) ( not ( = ?auto_217328 ?auto_217334 ) ) ( not ( = ?auto_217328 ?auto_217335 ) ) ( not ( = ?auto_217329 ?auto_217330 ) ) ( not ( = ?auto_217329 ?auto_217331 ) ) ( not ( = ?auto_217329 ?auto_217332 ) ) ( not ( = ?auto_217329 ?auto_217333 ) ) ( not ( = ?auto_217329 ?auto_217334 ) ) ( not ( = ?auto_217329 ?auto_217335 ) ) ( not ( = ?auto_217330 ?auto_217331 ) ) ( not ( = ?auto_217330 ?auto_217332 ) ) ( not ( = ?auto_217330 ?auto_217333 ) ) ( not ( = ?auto_217330 ?auto_217334 ) ) ( not ( = ?auto_217330 ?auto_217335 ) ) ( not ( = ?auto_217331 ?auto_217332 ) ) ( not ( = ?auto_217331 ?auto_217333 ) ) ( not ( = ?auto_217331 ?auto_217334 ) ) ( not ( = ?auto_217331 ?auto_217335 ) ) ( not ( = ?auto_217332 ?auto_217333 ) ) ( not ( = ?auto_217332 ?auto_217334 ) ) ( not ( = ?auto_217332 ?auto_217335 ) ) ( not ( = ?auto_217333 ?auto_217334 ) ) ( not ( = ?auto_217333 ?auto_217335 ) ) ( not ( = ?auto_217334 ?auto_217335 ) ) ( ON ?auto_217333 ?auto_217334 ) ( ON ?auto_217332 ?auto_217333 ) ( ON ?auto_217331 ?auto_217332 ) ( CLEAR ?auto_217329 ) ( ON ?auto_217330 ?auto_217331 ) ( CLEAR ?auto_217330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217325 ?auto_217326 ?auto_217327 ?auto_217328 ?auto_217329 ?auto_217330 )
      ( MAKE-10PILE ?auto_217325 ?auto_217326 ?auto_217327 ?auto_217328 ?auto_217329 ?auto_217330 ?auto_217331 ?auto_217332 ?auto_217333 ?auto_217334 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217346 - BLOCK
      ?auto_217347 - BLOCK
      ?auto_217348 - BLOCK
      ?auto_217349 - BLOCK
      ?auto_217350 - BLOCK
      ?auto_217351 - BLOCK
      ?auto_217352 - BLOCK
      ?auto_217353 - BLOCK
      ?auto_217354 - BLOCK
      ?auto_217355 - BLOCK
    )
    :vars
    (
      ?auto_217356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217355 ?auto_217356 ) ( ON-TABLE ?auto_217346 ) ( ON ?auto_217347 ?auto_217346 ) ( ON ?auto_217348 ?auto_217347 ) ( ON ?auto_217349 ?auto_217348 ) ( not ( = ?auto_217346 ?auto_217347 ) ) ( not ( = ?auto_217346 ?auto_217348 ) ) ( not ( = ?auto_217346 ?auto_217349 ) ) ( not ( = ?auto_217346 ?auto_217350 ) ) ( not ( = ?auto_217346 ?auto_217351 ) ) ( not ( = ?auto_217346 ?auto_217352 ) ) ( not ( = ?auto_217346 ?auto_217353 ) ) ( not ( = ?auto_217346 ?auto_217354 ) ) ( not ( = ?auto_217346 ?auto_217355 ) ) ( not ( = ?auto_217346 ?auto_217356 ) ) ( not ( = ?auto_217347 ?auto_217348 ) ) ( not ( = ?auto_217347 ?auto_217349 ) ) ( not ( = ?auto_217347 ?auto_217350 ) ) ( not ( = ?auto_217347 ?auto_217351 ) ) ( not ( = ?auto_217347 ?auto_217352 ) ) ( not ( = ?auto_217347 ?auto_217353 ) ) ( not ( = ?auto_217347 ?auto_217354 ) ) ( not ( = ?auto_217347 ?auto_217355 ) ) ( not ( = ?auto_217347 ?auto_217356 ) ) ( not ( = ?auto_217348 ?auto_217349 ) ) ( not ( = ?auto_217348 ?auto_217350 ) ) ( not ( = ?auto_217348 ?auto_217351 ) ) ( not ( = ?auto_217348 ?auto_217352 ) ) ( not ( = ?auto_217348 ?auto_217353 ) ) ( not ( = ?auto_217348 ?auto_217354 ) ) ( not ( = ?auto_217348 ?auto_217355 ) ) ( not ( = ?auto_217348 ?auto_217356 ) ) ( not ( = ?auto_217349 ?auto_217350 ) ) ( not ( = ?auto_217349 ?auto_217351 ) ) ( not ( = ?auto_217349 ?auto_217352 ) ) ( not ( = ?auto_217349 ?auto_217353 ) ) ( not ( = ?auto_217349 ?auto_217354 ) ) ( not ( = ?auto_217349 ?auto_217355 ) ) ( not ( = ?auto_217349 ?auto_217356 ) ) ( not ( = ?auto_217350 ?auto_217351 ) ) ( not ( = ?auto_217350 ?auto_217352 ) ) ( not ( = ?auto_217350 ?auto_217353 ) ) ( not ( = ?auto_217350 ?auto_217354 ) ) ( not ( = ?auto_217350 ?auto_217355 ) ) ( not ( = ?auto_217350 ?auto_217356 ) ) ( not ( = ?auto_217351 ?auto_217352 ) ) ( not ( = ?auto_217351 ?auto_217353 ) ) ( not ( = ?auto_217351 ?auto_217354 ) ) ( not ( = ?auto_217351 ?auto_217355 ) ) ( not ( = ?auto_217351 ?auto_217356 ) ) ( not ( = ?auto_217352 ?auto_217353 ) ) ( not ( = ?auto_217352 ?auto_217354 ) ) ( not ( = ?auto_217352 ?auto_217355 ) ) ( not ( = ?auto_217352 ?auto_217356 ) ) ( not ( = ?auto_217353 ?auto_217354 ) ) ( not ( = ?auto_217353 ?auto_217355 ) ) ( not ( = ?auto_217353 ?auto_217356 ) ) ( not ( = ?auto_217354 ?auto_217355 ) ) ( not ( = ?auto_217354 ?auto_217356 ) ) ( not ( = ?auto_217355 ?auto_217356 ) ) ( ON ?auto_217354 ?auto_217355 ) ( ON ?auto_217353 ?auto_217354 ) ( ON ?auto_217352 ?auto_217353 ) ( ON ?auto_217351 ?auto_217352 ) ( CLEAR ?auto_217349 ) ( ON ?auto_217350 ?auto_217351 ) ( CLEAR ?auto_217350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217346 ?auto_217347 ?auto_217348 ?auto_217349 ?auto_217350 )
      ( MAKE-10PILE ?auto_217346 ?auto_217347 ?auto_217348 ?auto_217349 ?auto_217350 ?auto_217351 ?auto_217352 ?auto_217353 ?auto_217354 ?auto_217355 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217367 - BLOCK
      ?auto_217368 - BLOCK
      ?auto_217369 - BLOCK
      ?auto_217370 - BLOCK
      ?auto_217371 - BLOCK
      ?auto_217372 - BLOCK
      ?auto_217373 - BLOCK
      ?auto_217374 - BLOCK
      ?auto_217375 - BLOCK
      ?auto_217376 - BLOCK
    )
    :vars
    (
      ?auto_217377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217376 ?auto_217377 ) ( ON-TABLE ?auto_217367 ) ( ON ?auto_217368 ?auto_217367 ) ( ON ?auto_217369 ?auto_217368 ) ( ON ?auto_217370 ?auto_217369 ) ( not ( = ?auto_217367 ?auto_217368 ) ) ( not ( = ?auto_217367 ?auto_217369 ) ) ( not ( = ?auto_217367 ?auto_217370 ) ) ( not ( = ?auto_217367 ?auto_217371 ) ) ( not ( = ?auto_217367 ?auto_217372 ) ) ( not ( = ?auto_217367 ?auto_217373 ) ) ( not ( = ?auto_217367 ?auto_217374 ) ) ( not ( = ?auto_217367 ?auto_217375 ) ) ( not ( = ?auto_217367 ?auto_217376 ) ) ( not ( = ?auto_217367 ?auto_217377 ) ) ( not ( = ?auto_217368 ?auto_217369 ) ) ( not ( = ?auto_217368 ?auto_217370 ) ) ( not ( = ?auto_217368 ?auto_217371 ) ) ( not ( = ?auto_217368 ?auto_217372 ) ) ( not ( = ?auto_217368 ?auto_217373 ) ) ( not ( = ?auto_217368 ?auto_217374 ) ) ( not ( = ?auto_217368 ?auto_217375 ) ) ( not ( = ?auto_217368 ?auto_217376 ) ) ( not ( = ?auto_217368 ?auto_217377 ) ) ( not ( = ?auto_217369 ?auto_217370 ) ) ( not ( = ?auto_217369 ?auto_217371 ) ) ( not ( = ?auto_217369 ?auto_217372 ) ) ( not ( = ?auto_217369 ?auto_217373 ) ) ( not ( = ?auto_217369 ?auto_217374 ) ) ( not ( = ?auto_217369 ?auto_217375 ) ) ( not ( = ?auto_217369 ?auto_217376 ) ) ( not ( = ?auto_217369 ?auto_217377 ) ) ( not ( = ?auto_217370 ?auto_217371 ) ) ( not ( = ?auto_217370 ?auto_217372 ) ) ( not ( = ?auto_217370 ?auto_217373 ) ) ( not ( = ?auto_217370 ?auto_217374 ) ) ( not ( = ?auto_217370 ?auto_217375 ) ) ( not ( = ?auto_217370 ?auto_217376 ) ) ( not ( = ?auto_217370 ?auto_217377 ) ) ( not ( = ?auto_217371 ?auto_217372 ) ) ( not ( = ?auto_217371 ?auto_217373 ) ) ( not ( = ?auto_217371 ?auto_217374 ) ) ( not ( = ?auto_217371 ?auto_217375 ) ) ( not ( = ?auto_217371 ?auto_217376 ) ) ( not ( = ?auto_217371 ?auto_217377 ) ) ( not ( = ?auto_217372 ?auto_217373 ) ) ( not ( = ?auto_217372 ?auto_217374 ) ) ( not ( = ?auto_217372 ?auto_217375 ) ) ( not ( = ?auto_217372 ?auto_217376 ) ) ( not ( = ?auto_217372 ?auto_217377 ) ) ( not ( = ?auto_217373 ?auto_217374 ) ) ( not ( = ?auto_217373 ?auto_217375 ) ) ( not ( = ?auto_217373 ?auto_217376 ) ) ( not ( = ?auto_217373 ?auto_217377 ) ) ( not ( = ?auto_217374 ?auto_217375 ) ) ( not ( = ?auto_217374 ?auto_217376 ) ) ( not ( = ?auto_217374 ?auto_217377 ) ) ( not ( = ?auto_217375 ?auto_217376 ) ) ( not ( = ?auto_217375 ?auto_217377 ) ) ( not ( = ?auto_217376 ?auto_217377 ) ) ( ON ?auto_217375 ?auto_217376 ) ( ON ?auto_217374 ?auto_217375 ) ( ON ?auto_217373 ?auto_217374 ) ( ON ?auto_217372 ?auto_217373 ) ( CLEAR ?auto_217370 ) ( ON ?auto_217371 ?auto_217372 ) ( CLEAR ?auto_217371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217367 ?auto_217368 ?auto_217369 ?auto_217370 ?auto_217371 )
      ( MAKE-10PILE ?auto_217367 ?auto_217368 ?auto_217369 ?auto_217370 ?auto_217371 ?auto_217372 ?auto_217373 ?auto_217374 ?auto_217375 ?auto_217376 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217388 - BLOCK
      ?auto_217389 - BLOCK
      ?auto_217390 - BLOCK
      ?auto_217391 - BLOCK
      ?auto_217392 - BLOCK
      ?auto_217393 - BLOCK
      ?auto_217394 - BLOCK
      ?auto_217395 - BLOCK
      ?auto_217396 - BLOCK
      ?auto_217397 - BLOCK
    )
    :vars
    (
      ?auto_217398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217397 ?auto_217398 ) ( ON-TABLE ?auto_217388 ) ( ON ?auto_217389 ?auto_217388 ) ( ON ?auto_217390 ?auto_217389 ) ( not ( = ?auto_217388 ?auto_217389 ) ) ( not ( = ?auto_217388 ?auto_217390 ) ) ( not ( = ?auto_217388 ?auto_217391 ) ) ( not ( = ?auto_217388 ?auto_217392 ) ) ( not ( = ?auto_217388 ?auto_217393 ) ) ( not ( = ?auto_217388 ?auto_217394 ) ) ( not ( = ?auto_217388 ?auto_217395 ) ) ( not ( = ?auto_217388 ?auto_217396 ) ) ( not ( = ?auto_217388 ?auto_217397 ) ) ( not ( = ?auto_217388 ?auto_217398 ) ) ( not ( = ?auto_217389 ?auto_217390 ) ) ( not ( = ?auto_217389 ?auto_217391 ) ) ( not ( = ?auto_217389 ?auto_217392 ) ) ( not ( = ?auto_217389 ?auto_217393 ) ) ( not ( = ?auto_217389 ?auto_217394 ) ) ( not ( = ?auto_217389 ?auto_217395 ) ) ( not ( = ?auto_217389 ?auto_217396 ) ) ( not ( = ?auto_217389 ?auto_217397 ) ) ( not ( = ?auto_217389 ?auto_217398 ) ) ( not ( = ?auto_217390 ?auto_217391 ) ) ( not ( = ?auto_217390 ?auto_217392 ) ) ( not ( = ?auto_217390 ?auto_217393 ) ) ( not ( = ?auto_217390 ?auto_217394 ) ) ( not ( = ?auto_217390 ?auto_217395 ) ) ( not ( = ?auto_217390 ?auto_217396 ) ) ( not ( = ?auto_217390 ?auto_217397 ) ) ( not ( = ?auto_217390 ?auto_217398 ) ) ( not ( = ?auto_217391 ?auto_217392 ) ) ( not ( = ?auto_217391 ?auto_217393 ) ) ( not ( = ?auto_217391 ?auto_217394 ) ) ( not ( = ?auto_217391 ?auto_217395 ) ) ( not ( = ?auto_217391 ?auto_217396 ) ) ( not ( = ?auto_217391 ?auto_217397 ) ) ( not ( = ?auto_217391 ?auto_217398 ) ) ( not ( = ?auto_217392 ?auto_217393 ) ) ( not ( = ?auto_217392 ?auto_217394 ) ) ( not ( = ?auto_217392 ?auto_217395 ) ) ( not ( = ?auto_217392 ?auto_217396 ) ) ( not ( = ?auto_217392 ?auto_217397 ) ) ( not ( = ?auto_217392 ?auto_217398 ) ) ( not ( = ?auto_217393 ?auto_217394 ) ) ( not ( = ?auto_217393 ?auto_217395 ) ) ( not ( = ?auto_217393 ?auto_217396 ) ) ( not ( = ?auto_217393 ?auto_217397 ) ) ( not ( = ?auto_217393 ?auto_217398 ) ) ( not ( = ?auto_217394 ?auto_217395 ) ) ( not ( = ?auto_217394 ?auto_217396 ) ) ( not ( = ?auto_217394 ?auto_217397 ) ) ( not ( = ?auto_217394 ?auto_217398 ) ) ( not ( = ?auto_217395 ?auto_217396 ) ) ( not ( = ?auto_217395 ?auto_217397 ) ) ( not ( = ?auto_217395 ?auto_217398 ) ) ( not ( = ?auto_217396 ?auto_217397 ) ) ( not ( = ?auto_217396 ?auto_217398 ) ) ( not ( = ?auto_217397 ?auto_217398 ) ) ( ON ?auto_217396 ?auto_217397 ) ( ON ?auto_217395 ?auto_217396 ) ( ON ?auto_217394 ?auto_217395 ) ( ON ?auto_217393 ?auto_217394 ) ( ON ?auto_217392 ?auto_217393 ) ( CLEAR ?auto_217390 ) ( ON ?auto_217391 ?auto_217392 ) ( CLEAR ?auto_217391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217388 ?auto_217389 ?auto_217390 ?auto_217391 )
      ( MAKE-10PILE ?auto_217388 ?auto_217389 ?auto_217390 ?auto_217391 ?auto_217392 ?auto_217393 ?auto_217394 ?auto_217395 ?auto_217396 ?auto_217397 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217409 - BLOCK
      ?auto_217410 - BLOCK
      ?auto_217411 - BLOCK
      ?auto_217412 - BLOCK
      ?auto_217413 - BLOCK
      ?auto_217414 - BLOCK
      ?auto_217415 - BLOCK
      ?auto_217416 - BLOCK
      ?auto_217417 - BLOCK
      ?auto_217418 - BLOCK
    )
    :vars
    (
      ?auto_217419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217418 ?auto_217419 ) ( ON-TABLE ?auto_217409 ) ( ON ?auto_217410 ?auto_217409 ) ( ON ?auto_217411 ?auto_217410 ) ( not ( = ?auto_217409 ?auto_217410 ) ) ( not ( = ?auto_217409 ?auto_217411 ) ) ( not ( = ?auto_217409 ?auto_217412 ) ) ( not ( = ?auto_217409 ?auto_217413 ) ) ( not ( = ?auto_217409 ?auto_217414 ) ) ( not ( = ?auto_217409 ?auto_217415 ) ) ( not ( = ?auto_217409 ?auto_217416 ) ) ( not ( = ?auto_217409 ?auto_217417 ) ) ( not ( = ?auto_217409 ?auto_217418 ) ) ( not ( = ?auto_217409 ?auto_217419 ) ) ( not ( = ?auto_217410 ?auto_217411 ) ) ( not ( = ?auto_217410 ?auto_217412 ) ) ( not ( = ?auto_217410 ?auto_217413 ) ) ( not ( = ?auto_217410 ?auto_217414 ) ) ( not ( = ?auto_217410 ?auto_217415 ) ) ( not ( = ?auto_217410 ?auto_217416 ) ) ( not ( = ?auto_217410 ?auto_217417 ) ) ( not ( = ?auto_217410 ?auto_217418 ) ) ( not ( = ?auto_217410 ?auto_217419 ) ) ( not ( = ?auto_217411 ?auto_217412 ) ) ( not ( = ?auto_217411 ?auto_217413 ) ) ( not ( = ?auto_217411 ?auto_217414 ) ) ( not ( = ?auto_217411 ?auto_217415 ) ) ( not ( = ?auto_217411 ?auto_217416 ) ) ( not ( = ?auto_217411 ?auto_217417 ) ) ( not ( = ?auto_217411 ?auto_217418 ) ) ( not ( = ?auto_217411 ?auto_217419 ) ) ( not ( = ?auto_217412 ?auto_217413 ) ) ( not ( = ?auto_217412 ?auto_217414 ) ) ( not ( = ?auto_217412 ?auto_217415 ) ) ( not ( = ?auto_217412 ?auto_217416 ) ) ( not ( = ?auto_217412 ?auto_217417 ) ) ( not ( = ?auto_217412 ?auto_217418 ) ) ( not ( = ?auto_217412 ?auto_217419 ) ) ( not ( = ?auto_217413 ?auto_217414 ) ) ( not ( = ?auto_217413 ?auto_217415 ) ) ( not ( = ?auto_217413 ?auto_217416 ) ) ( not ( = ?auto_217413 ?auto_217417 ) ) ( not ( = ?auto_217413 ?auto_217418 ) ) ( not ( = ?auto_217413 ?auto_217419 ) ) ( not ( = ?auto_217414 ?auto_217415 ) ) ( not ( = ?auto_217414 ?auto_217416 ) ) ( not ( = ?auto_217414 ?auto_217417 ) ) ( not ( = ?auto_217414 ?auto_217418 ) ) ( not ( = ?auto_217414 ?auto_217419 ) ) ( not ( = ?auto_217415 ?auto_217416 ) ) ( not ( = ?auto_217415 ?auto_217417 ) ) ( not ( = ?auto_217415 ?auto_217418 ) ) ( not ( = ?auto_217415 ?auto_217419 ) ) ( not ( = ?auto_217416 ?auto_217417 ) ) ( not ( = ?auto_217416 ?auto_217418 ) ) ( not ( = ?auto_217416 ?auto_217419 ) ) ( not ( = ?auto_217417 ?auto_217418 ) ) ( not ( = ?auto_217417 ?auto_217419 ) ) ( not ( = ?auto_217418 ?auto_217419 ) ) ( ON ?auto_217417 ?auto_217418 ) ( ON ?auto_217416 ?auto_217417 ) ( ON ?auto_217415 ?auto_217416 ) ( ON ?auto_217414 ?auto_217415 ) ( ON ?auto_217413 ?auto_217414 ) ( CLEAR ?auto_217411 ) ( ON ?auto_217412 ?auto_217413 ) ( CLEAR ?auto_217412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217409 ?auto_217410 ?auto_217411 ?auto_217412 )
      ( MAKE-10PILE ?auto_217409 ?auto_217410 ?auto_217411 ?auto_217412 ?auto_217413 ?auto_217414 ?auto_217415 ?auto_217416 ?auto_217417 ?auto_217418 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217430 - BLOCK
      ?auto_217431 - BLOCK
      ?auto_217432 - BLOCK
      ?auto_217433 - BLOCK
      ?auto_217434 - BLOCK
      ?auto_217435 - BLOCK
      ?auto_217436 - BLOCK
      ?auto_217437 - BLOCK
      ?auto_217438 - BLOCK
      ?auto_217439 - BLOCK
    )
    :vars
    (
      ?auto_217440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217439 ?auto_217440 ) ( ON-TABLE ?auto_217430 ) ( ON ?auto_217431 ?auto_217430 ) ( not ( = ?auto_217430 ?auto_217431 ) ) ( not ( = ?auto_217430 ?auto_217432 ) ) ( not ( = ?auto_217430 ?auto_217433 ) ) ( not ( = ?auto_217430 ?auto_217434 ) ) ( not ( = ?auto_217430 ?auto_217435 ) ) ( not ( = ?auto_217430 ?auto_217436 ) ) ( not ( = ?auto_217430 ?auto_217437 ) ) ( not ( = ?auto_217430 ?auto_217438 ) ) ( not ( = ?auto_217430 ?auto_217439 ) ) ( not ( = ?auto_217430 ?auto_217440 ) ) ( not ( = ?auto_217431 ?auto_217432 ) ) ( not ( = ?auto_217431 ?auto_217433 ) ) ( not ( = ?auto_217431 ?auto_217434 ) ) ( not ( = ?auto_217431 ?auto_217435 ) ) ( not ( = ?auto_217431 ?auto_217436 ) ) ( not ( = ?auto_217431 ?auto_217437 ) ) ( not ( = ?auto_217431 ?auto_217438 ) ) ( not ( = ?auto_217431 ?auto_217439 ) ) ( not ( = ?auto_217431 ?auto_217440 ) ) ( not ( = ?auto_217432 ?auto_217433 ) ) ( not ( = ?auto_217432 ?auto_217434 ) ) ( not ( = ?auto_217432 ?auto_217435 ) ) ( not ( = ?auto_217432 ?auto_217436 ) ) ( not ( = ?auto_217432 ?auto_217437 ) ) ( not ( = ?auto_217432 ?auto_217438 ) ) ( not ( = ?auto_217432 ?auto_217439 ) ) ( not ( = ?auto_217432 ?auto_217440 ) ) ( not ( = ?auto_217433 ?auto_217434 ) ) ( not ( = ?auto_217433 ?auto_217435 ) ) ( not ( = ?auto_217433 ?auto_217436 ) ) ( not ( = ?auto_217433 ?auto_217437 ) ) ( not ( = ?auto_217433 ?auto_217438 ) ) ( not ( = ?auto_217433 ?auto_217439 ) ) ( not ( = ?auto_217433 ?auto_217440 ) ) ( not ( = ?auto_217434 ?auto_217435 ) ) ( not ( = ?auto_217434 ?auto_217436 ) ) ( not ( = ?auto_217434 ?auto_217437 ) ) ( not ( = ?auto_217434 ?auto_217438 ) ) ( not ( = ?auto_217434 ?auto_217439 ) ) ( not ( = ?auto_217434 ?auto_217440 ) ) ( not ( = ?auto_217435 ?auto_217436 ) ) ( not ( = ?auto_217435 ?auto_217437 ) ) ( not ( = ?auto_217435 ?auto_217438 ) ) ( not ( = ?auto_217435 ?auto_217439 ) ) ( not ( = ?auto_217435 ?auto_217440 ) ) ( not ( = ?auto_217436 ?auto_217437 ) ) ( not ( = ?auto_217436 ?auto_217438 ) ) ( not ( = ?auto_217436 ?auto_217439 ) ) ( not ( = ?auto_217436 ?auto_217440 ) ) ( not ( = ?auto_217437 ?auto_217438 ) ) ( not ( = ?auto_217437 ?auto_217439 ) ) ( not ( = ?auto_217437 ?auto_217440 ) ) ( not ( = ?auto_217438 ?auto_217439 ) ) ( not ( = ?auto_217438 ?auto_217440 ) ) ( not ( = ?auto_217439 ?auto_217440 ) ) ( ON ?auto_217438 ?auto_217439 ) ( ON ?auto_217437 ?auto_217438 ) ( ON ?auto_217436 ?auto_217437 ) ( ON ?auto_217435 ?auto_217436 ) ( ON ?auto_217434 ?auto_217435 ) ( ON ?auto_217433 ?auto_217434 ) ( CLEAR ?auto_217431 ) ( ON ?auto_217432 ?auto_217433 ) ( CLEAR ?auto_217432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217430 ?auto_217431 ?auto_217432 )
      ( MAKE-10PILE ?auto_217430 ?auto_217431 ?auto_217432 ?auto_217433 ?auto_217434 ?auto_217435 ?auto_217436 ?auto_217437 ?auto_217438 ?auto_217439 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217451 - BLOCK
      ?auto_217452 - BLOCK
      ?auto_217453 - BLOCK
      ?auto_217454 - BLOCK
      ?auto_217455 - BLOCK
      ?auto_217456 - BLOCK
      ?auto_217457 - BLOCK
      ?auto_217458 - BLOCK
      ?auto_217459 - BLOCK
      ?auto_217460 - BLOCK
    )
    :vars
    (
      ?auto_217461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217460 ?auto_217461 ) ( ON-TABLE ?auto_217451 ) ( ON ?auto_217452 ?auto_217451 ) ( not ( = ?auto_217451 ?auto_217452 ) ) ( not ( = ?auto_217451 ?auto_217453 ) ) ( not ( = ?auto_217451 ?auto_217454 ) ) ( not ( = ?auto_217451 ?auto_217455 ) ) ( not ( = ?auto_217451 ?auto_217456 ) ) ( not ( = ?auto_217451 ?auto_217457 ) ) ( not ( = ?auto_217451 ?auto_217458 ) ) ( not ( = ?auto_217451 ?auto_217459 ) ) ( not ( = ?auto_217451 ?auto_217460 ) ) ( not ( = ?auto_217451 ?auto_217461 ) ) ( not ( = ?auto_217452 ?auto_217453 ) ) ( not ( = ?auto_217452 ?auto_217454 ) ) ( not ( = ?auto_217452 ?auto_217455 ) ) ( not ( = ?auto_217452 ?auto_217456 ) ) ( not ( = ?auto_217452 ?auto_217457 ) ) ( not ( = ?auto_217452 ?auto_217458 ) ) ( not ( = ?auto_217452 ?auto_217459 ) ) ( not ( = ?auto_217452 ?auto_217460 ) ) ( not ( = ?auto_217452 ?auto_217461 ) ) ( not ( = ?auto_217453 ?auto_217454 ) ) ( not ( = ?auto_217453 ?auto_217455 ) ) ( not ( = ?auto_217453 ?auto_217456 ) ) ( not ( = ?auto_217453 ?auto_217457 ) ) ( not ( = ?auto_217453 ?auto_217458 ) ) ( not ( = ?auto_217453 ?auto_217459 ) ) ( not ( = ?auto_217453 ?auto_217460 ) ) ( not ( = ?auto_217453 ?auto_217461 ) ) ( not ( = ?auto_217454 ?auto_217455 ) ) ( not ( = ?auto_217454 ?auto_217456 ) ) ( not ( = ?auto_217454 ?auto_217457 ) ) ( not ( = ?auto_217454 ?auto_217458 ) ) ( not ( = ?auto_217454 ?auto_217459 ) ) ( not ( = ?auto_217454 ?auto_217460 ) ) ( not ( = ?auto_217454 ?auto_217461 ) ) ( not ( = ?auto_217455 ?auto_217456 ) ) ( not ( = ?auto_217455 ?auto_217457 ) ) ( not ( = ?auto_217455 ?auto_217458 ) ) ( not ( = ?auto_217455 ?auto_217459 ) ) ( not ( = ?auto_217455 ?auto_217460 ) ) ( not ( = ?auto_217455 ?auto_217461 ) ) ( not ( = ?auto_217456 ?auto_217457 ) ) ( not ( = ?auto_217456 ?auto_217458 ) ) ( not ( = ?auto_217456 ?auto_217459 ) ) ( not ( = ?auto_217456 ?auto_217460 ) ) ( not ( = ?auto_217456 ?auto_217461 ) ) ( not ( = ?auto_217457 ?auto_217458 ) ) ( not ( = ?auto_217457 ?auto_217459 ) ) ( not ( = ?auto_217457 ?auto_217460 ) ) ( not ( = ?auto_217457 ?auto_217461 ) ) ( not ( = ?auto_217458 ?auto_217459 ) ) ( not ( = ?auto_217458 ?auto_217460 ) ) ( not ( = ?auto_217458 ?auto_217461 ) ) ( not ( = ?auto_217459 ?auto_217460 ) ) ( not ( = ?auto_217459 ?auto_217461 ) ) ( not ( = ?auto_217460 ?auto_217461 ) ) ( ON ?auto_217459 ?auto_217460 ) ( ON ?auto_217458 ?auto_217459 ) ( ON ?auto_217457 ?auto_217458 ) ( ON ?auto_217456 ?auto_217457 ) ( ON ?auto_217455 ?auto_217456 ) ( ON ?auto_217454 ?auto_217455 ) ( CLEAR ?auto_217452 ) ( ON ?auto_217453 ?auto_217454 ) ( CLEAR ?auto_217453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217451 ?auto_217452 ?auto_217453 )
      ( MAKE-10PILE ?auto_217451 ?auto_217452 ?auto_217453 ?auto_217454 ?auto_217455 ?auto_217456 ?auto_217457 ?auto_217458 ?auto_217459 ?auto_217460 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217472 - BLOCK
      ?auto_217473 - BLOCK
      ?auto_217474 - BLOCK
      ?auto_217475 - BLOCK
      ?auto_217476 - BLOCK
      ?auto_217477 - BLOCK
      ?auto_217478 - BLOCK
      ?auto_217479 - BLOCK
      ?auto_217480 - BLOCK
      ?auto_217481 - BLOCK
    )
    :vars
    (
      ?auto_217482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217481 ?auto_217482 ) ( ON-TABLE ?auto_217472 ) ( not ( = ?auto_217472 ?auto_217473 ) ) ( not ( = ?auto_217472 ?auto_217474 ) ) ( not ( = ?auto_217472 ?auto_217475 ) ) ( not ( = ?auto_217472 ?auto_217476 ) ) ( not ( = ?auto_217472 ?auto_217477 ) ) ( not ( = ?auto_217472 ?auto_217478 ) ) ( not ( = ?auto_217472 ?auto_217479 ) ) ( not ( = ?auto_217472 ?auto_217480 ) ) ( not ( = ?auto_217472 ?auto_217481 ) ) ( not ( = ?auto_217472 ?auto_217482 ) ) ( not ( = ?auto_217473 ?auto_217474 ) ) ( not ( = ?auto_217473 ?auto_217475 ) ) ( not ( = ?auto_217473 ?auto_217476 ) ) ( not ( = ?auto_217473 ?auto_217477 ) ) ( not ( = ?auto_217473 ?auto_217478 ) ) ( not ( = ?auto_217473 ?auto_217479 ) ) ( not ( = ?auto_217473 ?auto_217480 ) ) ( not ( = ?auto_217473 ?auto_217481 ) ) ( not ( = ?auto_217473 ?auto_217482 ) ) ( not ( = ?auto_217474 ?auto_217475 ) ) ( not ( = ?auto_217474 ?auto_217476 ) ) ( not ( = ?auto_217474 ?auto_217477 ) ) ( not ( = ?auto_217474 ?auto_217478 ) ) ( not ( = ?auto_217474 ?auto_217479 ) ) ( not ( = ?auto_217474 ?auto_217480 ) ) ( not ( = ?auto_217474 ?auto_217481 ) ) ( not ( = ?auto_217474 ?auto_217482 ) ) ( not ( = ?auto_217475 ?auto_217476 ) ) ( not ( = ?auto_217475 ?auto_217477 ) ) ( not ( = ?auto_217475 ?auto_217478 ) ) ( not ( = ?auto_217475 ?auto_217479 ) ) ( not ( = ?auto_217475 ?auto_217480 ) ) ( not ( = ?auto_217475 ?auto_217481 ) ) ( not ( = ?auto_217475 ?auto_217482 ) ) ( not ( = ?auto_217476 ?auto_217477 ) ) ( not ( = ?auto_217476 ?auto_217478 ) ) ( not ( = ?auto_217476 ?auto_217479 ) ) ( not ( = ?auto_217476 ?auto_217480 ) ) ( not ( = ?auto_217476 ?auto_217481 ) ) ( not ( = ?auto_217476 ?auto_217482 ) ) ( not ( = ?auto_217477 ?auto_217478 ) ) ( not ( = ?auto_217477 ?auto_217479 ) ) ( not ( = ?auto_217477 ?auto_217480 ) ) ( not ( = ?auto_217477 ?auto_217481 ) ) ( not ( = ?auto_217477 ?auto_217482 ) ) ( not ( = ?auto_217478 ?auto_217479 ) ) ( not ( = ?auto_217478 ?auto_217480 ) ) ( not ( = ?auto_217478 ?auto_217481 ) ) ( not ( = ?auto_217478 ?auto_217482 ) ) ( not ( = ?auto_217479 ?auto_217480 ) ) ( not ( = ?auto_217479 ?auto_217481 ) ) ( not ( = ?auto_217479 ?auto_217482 ) ) ( not ( = ?auto_217480 ?auto_217481 ) ) ( not ( = ?auto_217480 ?auto_217482 ) ) ( not ( = ?auto_217481 ?auto_217482 ) ) ( ON ?auto_217480 ?auto_217481 ) ( ON ?auto_217479 ?auto_217480 ) ( ON ?auto_217478 ?auto_217479 ) ( ON ?auto_217477 ?auto_217478 ) ( ON ?auto_217476 ?auto_217477 ) ( ON ?auto_217475 ?auto_217476 ) ( ON ?auto_217474 ?auto_217475 ) ( CLEAR ?auto_217472 ) ( ON ?auto_217473 ?auto_217474 ) ( CLEAR ?auto_217473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217472 ?auto_217473 )
      ( MAKE-10PILE ?auto_217472 ?auto_217473 ?auto_217474 ?auto_217475 ?auto_217476 ?auto_217477 ?auto_217478 ?auto_217479 ?auto_217480 ?auto_217481 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217493 - BLOCK
      ?auto_217494 - BLOCK
      ?auto_217495 - BLOCK
      ?auto_217496 - BLOCK
      ?auto_217497 - BLOCK
      ?auto_217498 - BLOCK
      ?auto_217499 - BLOCK
      ?auto_217500 - BLOCK
      ?auto_217501 - BLOCK
      ?auto_217502 - BLOCK
    )
    :vars
    (
      ?auto_217503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217502 ?auto_217503 ) ( ON-TABLE ?auto_217493 ) ( not ( = ?auto_217493 ?auto_217494 ) ) ( not ( = ?auto_217493 ?auto_217495 ) ) ( not ( = ?auto_217493 ?auto_217496 ) ) ( not ( = ?auto_217493 ?auto_217497 ) ) ( not ( = ?auto_217493 ?auto_217498 ) ) ( not ( = ?auto_217493 ?auto_217499 ) ) ( not ( = ?auto_217493 ?auto_217500 ) ) ( not ( = ?auto_217493 ?auto_217501 ) ) ( not ( = ?auto_217493 ?auto_217502 ) ) ( not ( = ?auto_217493 ?auto_217503 ) ) ( not ( = ?auto_217494 ?auto_217495 ) ) ( not ( = ?auto_217494 ?auto_217496 ) ) ( not ( = ?auto_217494 ?auto_217497 ) ) ( not ( = ?auto_217494 ?auto_217498 ) ) ( not ( = ?auto_217494 ?auto_217499 ) ) ( not ( = ?auto_217494 ?auto_217500 ) ) ( not ( = ?auto_217494 ?auto_217501 ) ) ( not ( = ?auto_217494 ?auto_217502 ) ) ( not ( = ?auto_217494 ?auto_217503 ) ) ( not ( = ?auto_217495 ?auto_217496 ) ) ( not ( = ?auto_217495 ?auto_217497 ) ) ( not ( = ?auto_217495 ?auto_217498 ) ) ( not ( = ?auto_217495 ?auto_217499 ) ) ( not ( = ?auto_217495 ?auto_217500 ) ) ( not ( = ?auto_217495 ?auto_217501 ) ) ( not ( = ?auto_217495 ?auto_217502 ) ) ( not ( = ?auto_217495 ?auto_217503 ) ) ( not ( = ?auto_217496 ?auto_217497 ) ) ( not ( = ?auto_217496 ?auto_217498 ) ) ( not ( = ?auto_217496 ?auto_217499 ) ) ( not ( = ?auto_217496 ?auto_217500 ) ) ( not ( = ?auto_217496 ?auto_217501 ) ) ( not ( = ?auto_217496 ?auto_217502 ) ) ( not ( = ?auto_217496 ?auto_217503 ) ) ( not ( = ?auto_217497 ?auto_217498 ) ) ( not ( = ?auto_217497 ?auto_217499 ) ) ( not ( = ?auto_217497 ?auto_217500 ) ) ( not ( = ?auto_217497 ?auto_217501 ) ) ( not ( = ?auto_217497 ?auto_217502 ) ) ( not ( = ?auto_217497 ?auto_217503 ) ) ( not ( = ?auto_217498 ?auto_217499 ) ) ( not ( = ?auto_217498 ?auto_217500 ) ) ( not ( = ?auto_217498 ?auto_217501 ) ) ( not ( = ?auto_217498 ?auto_217502 ) ) ( not ( = ?auto_217498 ?auto_217503 ) ) ( not ( = ?auto_217499 ?auto_217500 ) ) ( not ( = ?auto_217499 ?auto_217501 ) ) ( not ( = ?auto_217499 ?auto_217502 ) ) ( not ( = ?auto_217499 ?auto_217503 ) ) ( not ( = ?auto_217500 ?auto_217501 ) ) ( not ( = ?auto_217500 ?auto_217502 ) ) ( not ( = ?auto_217500 ?auto_217503 ) ) ( not ( = ?auto_217501 ?auto_217502 ) ) ( not ( = ?auto_217501 ?auto_217503 ) ) ( not ( = ?auto_217502 ?auto_217503 ) ) ( ON ?auto_217501 ?auto_217502 ) ( ON ?auto_217500 ?auto_217501 ) ( ON ?auto_217499 ?auto_217500 ) ( ON ?auto_217498 ?auto_217499 ) ( ON ?auto_217497 ?auto_217498 ) ( ON ?auto_217496 ?auto_217497 ) ( ON ?auto_217495 ?auto_217496 ) ( CLEAR ?auto_217493 ) ( ON ?auto_217494 ?auto_217495 ) ( CLEAR ?auto_217494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217493 ?auto_217494 )
      ( MAKE-10PILE ?auto_217493 ?auto_217494 ?auto_217495 ?auto_217496 ?auto_217497 ?auto_217498 ?auto_217499 ?auto_217500 ?auto_217501 ?auto_217502 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217514 - BLOCK
      ?auto_217515 - BLOCK
      ?auto_217516 - BLOCK
      ?auto_217517 - BLOCK
      ?auto_217518 - BLOCK
      ?auto_217519 - BLOCK
      ?auto_217520 - BLOCK
      ?auto_217521 - BLOCK
      ?auto_217522 - BLOCK
      ?auto_217523 - BLOCK
    )
    :vars
    (
      ?auto_217524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217523 ?auto_217524 ) ( not ( = ?auto_217514 ?auto_217515 ) ) ( not ( = ?auto_217514 ?auto_217516 ) ) ( not ( = ?auto_217514 ?auto_217517 ) ) ( not ( = ?auto_217514 ?auto_217518 ) ) ( not ( = ?auto_217514 ?auto_217519 ) ) ( not ( = ?auto_217514 ?auto_217520 ) ) ( not ( = ?auto_217514 ?auto_217521 ) ) ( not ( = ?auto_217514 ?auto_217522 ) ) ( not ( = ?auto_217514 ?auto_217523 ) ) ( not ( = ?auto_217514 ?auto_217524 ) ) ( not ( = ?auto_217515 ?auto_217516 ) ) ( not ( = ?auto_217515 ?auto_217517 ) ) ( not ( = ?auto_217515 ?auto_217518 ) ) ( not ( = ?auto_217515 ?auto_217519 ) ) ( not ( = ?auto_217515 ?auto_217520 ) ) ( not ( = ?auto_217515 ?auto_217521 ) ) ( not ( = ?auto_217515 ?auto_217522 ) ) ( not ( = ?auto_217515 ?auto_217523 ) ) ( not ( = ?auto_217515 ?auto_217524 ) ) ( not ( = ?auto_217516 ?auto_217517 ) ) ( not ( = ?auto_217516 ?auto_217518 ) ) ( not ( = ?auto_217516 ?auto_217519 ) ) ( not ( = ?auto_217516 ?auto_217520 ) ) ( not ( = ?auto_217516 ?auto_217521 ) ) ( not ( = ?auto_217516 ?auto_217522 ) ) ( not ( = ?auto_217516 ?auto_217523 ) ) ( not ( = ?auto_217516 ?auto_217524 ) ) ( not ( = ?auto_217517 ?auto_217518 ) ) ( not ( = ?auto_217517 ?auto_217519 ) ) ( not ( = ?auto_217517 ?auto_217520 ) ) ( not ( = ?auto_217517 ?auto_217521 ) ) ( not ( = ?auto_217517 ?auto_217522 ) ) ( not ( = ?auto_217517 ?auto_217523 ) ) ( not ( = ?auto_217517 ?auto_217524 ) ) ( not ( = ?auto_217518 ?auto_217519 ) ) ( not ( = ?auto_217518 ?auto_217520 ) ) ( not ( = ?auto_217518 ?auto_217521 ) ) ( not ( = ?auto_217518 ?auto_217522 ) ) ( not ( = ?auto_217518 ?auto_217523 ) ) ( not ( = ?auto_217518 ?auto_217524 ) ) ( not ( = ?auto_217519 ?auto_217520 ) ) ( not ( = ?auto_217519 ?auto_217521 ) ) ( not ( = ?auto_217519 ?auto_217522 ) ) ( not ( = ?auto_217519 ?auto_217523 ) ) ( not ( = ?auto_217519 ?auto_217524 ) ) ( not ( = ?auto_217520 ?auto_217521 ) ) ( not ( = ?auto_217520 ?auto_217522 ) ) ( not ( = ?auto_217520 ?auto_217523 ) ) ( not ( = ?auto_217520 ?auto_217524 ) ) ( not ( = ?auto_217521 ?auto_217522 ) ) ( not ( = ?auto_217521 ?auto_217523 ) ) ( not ( = ?auto_217521 ?auto_217524 ) ) ( not ( = ?auto_217522 ?auto_217523 ) ) ( not ( = ?auto_217522 ?auto_217524 ) ) ( not ( = ?auto_217523 ?auto_217524 ) ) ( ON ?auto_217522 ?auto_217523 ) ( ON ?auto_217521 ?auto_217522 ) ( ON ?auto_217520 ?auto_217521 ) ( ON ?auto_217519 ?auto_217520 ) ( ON ?auto_217518 ?auto_217519 ) ( ON ?auto_217517 ?auto_217518 ) ( ON ?auto_217516 ?auto_217517 ) ( ON ?auto_217515 ?auto_217516 ) ( ON ?auto_217514 ?auto_217515 ) ( CLEAR ?auto_217514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217514 )
      ( MAKE-10PILE ?auto_217514 ?auto_217515 ?auto_217516 ?auto_217517 ?auto_217518 ?auto_217519 ?auto_217520 ?auto_217521 ?auto_217522 ?auto_217523 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_217535 - BLOCK
      ?auto_217536 - BLOCK
      ?auto_217537 - BLOCK
      ?auto_217538 - BLOCK
      ?auto_217539 - BLOCK
      ?auto_217540 - BLOCK
      ?auto_217541 - BLOCK
      ?auto_217542 - BLOCK
      ?auto_217543 - BLOCK
      ?auto_217544 - BLOCK
    )
    :vars
    (
      ?auto_217545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217544 ?auto_217545 ) ( not ( = ?auto_217535 ?auto_217536 ) ) ( not ( = ?auto_217535 ?auto_217537 ) ) ( not ( = ?auto_217535 ?auto_217538 ) ) ( not ( = ?auto_217535 ?auto_217539 ) ) ( not ( = ?auto_217535 ?auto_217540 ) ) ( not ( = ?auto_217535 ?auto_217541 ) ) ( not ( = ?auto_217535 ?auto_217542 ) ) ( not ( = ?auto_217535 ?auto_217543 ) ) ( not ( = ?auto_217535 ?auto_217544 ) ) ( not ( = ?auto_217535 ?auto_217545 ) ) ( not ( = ?auto_217536 ?auto_217537 ) ) ( not ( = ?auto_217536 ?auto_217538 ) ) ( not ( = ?auto_217536 ?auto_217539 ) ) ( not ( = ?auto_217536 ?auto_217540 ) ) ( not ( = ?auto_217536 ?auto_217541 ) ) ( not ( = ?auto_217536 ?auto_217542 ) ) ( not ( = ?auto_217536 ?auto_217543 ) ) ( not ( = ?auto_217536 ?auto_217544 ) ) ( not ( = ?auto_217536 ?auto_217545 ) ) ( not ( = ?auto_217537 ?auto_217538 ) ) ( not ( = ?auto_217537 ?auto_217539 ) ) ( not ( = ?auto_217537 ?auto_217540 ) ) ( not ( = ?auto_217537 ?auto_217541 ) ) ( not ( = ?auto_217537 ?auto_217542 ) ) ( not ( = ?auto_217537 ?auto_217543 ) ) ( not ( = ?auto_217537 ?auto_217544 ) ) ( not ( = ?auto_217537 ?auto_217545 ) ) ( not ( = ?auto_217538 ?auto_217539 ) ) ( not ( = ?auto_217538 ?auto_217540 ) ) ( not ( = ?auto_217538 ?auto_217541 ) ) ( not ( = ?auto_217538 ?auto_217542 ) ) ( not ( = ?auto_217538 ?auto_217543 ) ) ( not ( = ?auto_217538 ?auto_217544 ) ) ( not ( = ?auto_217538 ?auto_217545 ) ) ( not ( = ?auto_217539 ?auto_217540 ) ) ( not ( = ?auto_217539 ?auto_217541 ) ) ( not ( = ?auto_217539 ?auto_217542 ) ) ( not ( = ?auto_217539 ?auto_217543 ) ) ( not ( = ?auto_217539 ?auto_217544 ) ) ( not ( = ?auto_217539 ?auto_217545 ) ) ( not ( = ?auto_217540 ?auto_217541 ) ) ( not ( = ?auto_217540 ?auto_217542 ) ) ( not ( = ?auto_217540 ?auto_217543 ) ) ( not ( = ?auto_217540 ?auto_217544 ) ) ( not ( = ?auto_217540 ?auto_217545 ) ) ( not ( = ?auto_217541 ?auto_217542 ) ) ( not ( = ?auto_217541 ?auto_217543 ) ) ( not ( = ?auto_217541 ?auto_217544 ) ) ( not ( = ?auto_217541 ?auto_217545 ) ) ( not ( = ?auto_217542 ?auto_217543 ) ) ( not ( = ?auto_217542 ?auto_217544 ) ) ( not ( = ?auto_217542 ?auto_217545 ) ) ( not ( = ?auto_217543 ?auto_217544 ) ) ( not ( = ?auto_217543 ?auto_217545 ) ) ( not ( = ?auto_217544 ?auto_217545 ) ) ( ON ?auto_217543 ?auto_217544 ) ( ON ?auto_217542 ?auto_217543 ) ( ON ?auto_217541 ?auto_217542 ) ( ON ?auto_217540 ?auto_217541 ) ( ON ?auto_217539 ?auto_217540 ) ( ON ?auto_217538 ?auto_217539 ) ( ON ?auto_217537 ?auto_217538 ) ( ON ?auto_217536 ?auto_217537 ) ( ON ?auto_217535 ?auto_217536 ) ( CLEAR ?auto_217535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217535 )
      ( MAKE-10PILE ?auto_217535 ?auto_217536 ?auto_217537 ?auto_217538 ?auto_217539 ?auto_217540 ?auto_217541 ?auto_217542 ?auto_217543 ?auto_217544 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217557 - BLOCK
      ?auto_217558 - BLOCK
      ?auto_217559 - BLOCK
      ?auto_217560 - BLOCK
      ?auto_217561 - BLOCK
      ?auto_217562 - BLOCK
      ?auto_217563 - BLOCK
      ?auto_217564 - BLOCK
      ?auto_217565 - BLOCK
      ?auto_217566 - BLOCK
      ?auto_217567 - BLOCK
    )
    :vars
    (
      ?auto_217568 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_217566 ) ( ON ?auto_217567 ?auto_217568 ) ( CLEAR ?auto_217567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_217557 ) ( ON ?auto_217558 ?auto_217557 ) ( ON ?auto_217559 ?auto_217558 ) ( ON ?auto_217560 ?auto_217559 ) ( ON ?auto_217561 ?auto_217560 ) ( ON ?auto_217562 ?auto_217561 ) ( ON ?auto_217563 ?auto_217562 ) ( ON ?auto_217564 ?auto_217563 ) ( ON ?auto_217565 ?auto_217564 ) ( ON ?auto_217566 ?auto_217565 ) ( not ( = ?auto_217557 ?auto_217558 ) ) ( not ( = ?auto_217557 ?auto_217559 ) ) ( not ( = ?auto_217557 ?auto_217560 ) ) ( not ( = ?auto_217557 ?auto_217561 ) ) ( not ( = ?auto_217557 ?auto_217562 ) ) ( not ( = ?auto_217557 ?auto_217563 ) ) ( not ( = ?auto_217557 ?auto_217564 ) ) ( not ( = ?auto_217557 ?auto_217565 ) ) ( not ( = ?auto_217557 ?auto_217566 ) ) ( not ( = ?auto_217557 ?auto_217567 ) ) ( not ( = ?auto_217557 ?auto_217568 ) ) ( not ( = ?auto_217558 ?auto_217559 ) ) ( not ( = ?auto_217558 ?auto_217560 ) ) ( not ( = ?auto_217558 ?auto_217561 ) ) ( not ( = ?auto_217558 ?auto_217562 ) ) ( not ( = ?auto_217558 ?auto_217563 ) ) ( not ( = ?auto_217558 ?auto_217564 ) ) ( not ( = ?auto_217558 ?auto_217565 ) ) ( not ( = ?auto_217558 ?auto_217566 ) ) ( not ( = ?auto_217558 ?auto_217567 ) ) ( not ( = ?auto_217558 ?auto_217568 ) ) ( not ( = ?auto_217559 ?auto_217560 ) ) ( not ( = ?auto_217559 ?auto_217561 ) ) ( not ( = ?auto_217559 ?auto_217562 ) ) ( not ( = ?auto_217559 ?auto_217563 ) ) ( not ( = ?auto_217559 ?auto_217564 ) ) ( not ( = ?auto_217559 ?auto_217565 ) ) ( not ( = ?auto_217559 ?auto_217566 ) ) ( not ( = ?auto_217559 ?auto_217567 ) ) ( not ( = ?auto_217559 ?auto_217568 ) ) ( not ( = ?auto_217560 ?auto_217561 ) ) ( not ( = ?auto_217560 ?auto_217562 ) ) ( not ( = ?auto_217560 ?auto_217563 ) ) ( not ( = ?auto_217560 ?auto_217564 ) ) ( not ( = ?auto_217560 ?auto_217565 ) ) ( not ( = ?auto_217560 ?auto_217566 ) ) ( not ( = ?auto_217560 ?auto_217567 ) ) ( not ( = ?auto_217560 ?auto_217568 ) ) ( not ( = ?auto_217561 ?auto_217562 ) ) ( not ( = ?auto_217561 ?auto_217563 ) ) ( not ( = ?auto_217561 ?auto_217564 ) ) ( not ( = ?auto_217561 ?auto_217565 ) ) ( not ( = ?auto_217561 ?auto_217566 ) ) ( not ( = ?auto_217561 ?auto_217567 ) ) ( not ( = ?auto_217561 ?auto_217568 ) ) ( not ( = ?auto_217562 ?auto_217563 ) ) ( not ( = ?auto_217562 ?auto_217564 ) ) ( not ( = ?auto_217562 ?auto_217565 ) ) ( not ( = ?auto_217562 ?auto_217566 ) ) ( not ( = ?auto_217562 ?auto_217567 ) ) ( not ( = ?auto_217562 ?auto_217568 ) ) ( not ( = ?auto_217563 ?auto_217564 ) ) ( not ( = ?auto_217563 ?auto_217565 ) ) ( not ( = ?auto_217563 ?auto_217566 ) ) ( not ( = ?auto_217563 ?auto_217567 ) ) ( not ( = ?auto_217563 ?auto_217568 ) ) ( not ( = ?auto_217564 ?auto_217565 ) ) ( not ( = ?auto_217564 ?auto_217566 ) ) ( not ( = ?auto_217564 ?auto_217567 ) ) ( not ( = ?auto_217564 ?auto_217568 ) ) ( not ( = ?auto_217565 ?auto_217566 ) ) ( not ( = ?auto_217565 ?auto_217567 ) ) ( not ( = ?auto_217565 ?auto_217568 ) ) ( not ( = ?auto_217566 ?auto_217567 ) ) ( not ( = ?auto_217566 ?auto_217568 ) ) ( not ( = ?auto_217567 ?auto_217568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_217567 ?auto_217568 )
      ( !STACK ?auto_217567 ?auto_217566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217580 - BLOCK
      ?auto_217581 - BLOCK
      ?auto_217582 - BLOCK
      ?auto_217583 - BLOCK
      ?auto_217584 - BLOCK
      ?auto_217585 - BLOCK
      ?auto_217586 - BLOCK
      ?auto_217587 - BLOCK
      ?auto_217588 - BLOCK
      ?auto_217589 - BLOCK
      ?auto_217590 - BLOCK
    )
    :vars
    (
      ?auto_217591 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_217589 ) ( ON ?auto_217590 ?auto_217591 ) ( CLEAR ?auto_217590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_217580 ) ( ON ?auto_217581 ?auto_217580 ) ( ON ?auto_217582 ?auto_217581 ) ( ON ?auto_217583 ?auto_217582 ) ( ON ?auto_217584 ?auto_217583 ) ( ON ?auto_217585 ?auto_217584 ) ( ON ?auto_217586 ?auto_217585 ) ( ON ?auto_217587 ?auto_217586 ) ( ON ?auto_217588 ?auto_217587 ) ( ON ?auto_217589 ?auto_217588 ) ( not ( = ?auto_217580 ?auto_217581 ) ) ( not ( = ?auto_217580 ?auto_217582 ) ) ( not ( = ?auto_217580 ?auto_217583 ) ) ( not ( = ?auto_217580 ?auto_217584 ) ) ( not ( = ?auto_217580 ?auto_217585 ) ) ( not ( = ?auto_217580 ?auto_217586 ) ) ( not ( = ?auto_217580 ?auto_217587 ) ) ( not ( = ?auto_217580 ?auto_217588 ) ) ( not ( = ?auto_217580 ?auto_217589 ) ) ( not ( = ?auto_217580 ?auto_217590 ) ) ( not ( = ?auto_217580 ?auto_217591 ) ) ( not ( = ?auto_217581 ?auto_217582 ) ) ( not ( = ?auto_217581 ?auto_217583 ) ) ( not ( = ?auto_217581 ?auto_217584 ) ) ( not ( = ?auto_217581 ?auto_217585 ) ) ( not ( = ?auto_217581 ?auto_217586 ) ) ( not ( = ?auto_217581 ?auto_217587 ) ) ( not ( = ?auto_217581 ?auto_217588 ) ) ( not ( = ?auto_217581 ?auto_217589 ) ) ( not ( = ?auto_217581 ?auto_217590 ) ) ( not ( = ?auto_217581 ?auto_217591 ) ) ( not ( = ?auto_217582 ?auto_217583 ) ) ( not ( = ?auto_217582 ?auto_217584 ) ) ( not ( = ?auto_217582 ?auto_217585 ) ) ( not ( = ?auto_217582 ?auto_217586 ) ) ( not ( = ?auto_217582 ?auto_217587 ) ) ( not ( = ?auto_217582 ?auto_217588 ) ) ( not ( = ?auto_217582 ?auto_217589 ) ) ( not ( = ?auto_217582 ?auto_217590 ) ) ( not ( = ?auto_217582 ?auto_217591 ) ) ( not ( = ?auto_217583 ?auto_217584 ) ) ( not ( = ?auto_217583 ?auto_217585 ) ) ( not ( = ?auto_217583 ?auto_217586 ) ) ( not ( = ?auto_217583 ?auto_217587 ) ) ( not ( = ?auto_217583 ?auto_217588 ) ) ( not ( = ?auto_217583 ?auto_217589 ) ) ( not ( = ?auto_217583 ?auto_217590 ) ) ( not ( = ?auto_217583 ?auto_217591 ) ) ( not ( = ?auto_217584 ?auto_217585 ) ) ( not ( = ?auto_217584 ?auto_217586 ) ) ( not ( = ?auto_217584 ?auto_217587 ) ) ( not ( = ?auto_217584 ?auto_217588 ) ) ( not ( = ?auto_217584 ?auto_217589 ) ) ( not ( = ?auto_217584 ?auto_217590 ) ) ( not ( = ?auto_217584 ?auto_217591 ) ) ( not ( = ?auto_217585 ?auto_217586 ) ) ( not ( = ?auto_217585 ?auto_217587 ) ) ( not ( = ?auto_217585 ?auto_217588 ) ) ( not ( = ?auto_217585 ?auto_217589 ) ) ( not ( = ?auto_217585 ?auto_217590 ) ) ( not ( = ?auto_217585 ?auto_217591 ) ) ( not ( = ?auto_217586 ?auto_217587 ) ) ( not ( = ?auto_217586 ?auto_217588 ) ) ( not ( = ?auto_217586 ?auto_217589 ) ) ( not ( = ?auto_217586 ?auto_217590 ) ) ( not ( = ?auto_217586 ?auto_217591 ) ) ( not ( = ?auto_217587 ?auto_217588 ) ) ( not ( = ?auto_217587 ?auto_217589 ) ) ( not ( = ?auto_217587 ?auto_217590 ) ) ( not ( = ?auto_217587 ?auto_217591 ) ) ( not ( = ?auto_217588 ?auto_217589 ) ) ( not ( = ?auto_217588 ?auto_217590 ) ) ( not ( = ?auto_217588 ?auto_217591 ) ) ( not ( = ?auto_217589 ?auto_217590 ) ) ( not ( = ?auto_217589 ?auto_217591 ) ) ( not ( = ?auto_217590 ?auto_217591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_217590 ?auto_217591 )
      ( !STACK ?auto_217590 ?auto_217589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217603 - BLOCK
      ?auto_217604 - BLOCK
      ?auto_217605 - BLOCK
      ?auto_217606 - BLOCK
      ?auto_217607 - BLOCK
      ?auto_217608 - BLOCK
      ?auto_217609 - BLOCK
      ?auto_217610 - BLOCK
      ?auto_217611 - BLOCK
      ?auto_217612 - BLOCK
      ?auto_217613 - BLOCK
    )
    :vars
    (
      ?auto_217614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217613 ?auto_217614 ) ( ON-TABLE ?auto_217603 ) ( ON ?auto_217604 ?auto_217603 ) ( ON ?auto_217605 ?auto_217604 ) ( ON ?auto_217606 ?auto_217605 ) ( ON ?auto_217607 ?auto_217606 ) ( ON ?auto_217608 ?auto_217607 ) ( ON ?auto_217609 ?auto_217608 ) ( ON ?auto_217610 ?auto_217609 ) ( ON ?auto_217611 ?auto_217610 ) ( not ( = ?auto_217603 ?auto_217604 ) ) ( not ( = ?auto_217603 ?auto_217605 ) ) ( not ( = ?auto_217603 ?auto_217606 ) ) ( not ( = ?auto_217603 ?auto_217607 ) ) ( not ( = ?auto_217603 ?auto_217608 ) ) ( not ( = ?auto_217603 ?auto_217609 ) ) ( not ( = ?auto_217603 ?auto_217610 ) ) ( not ( = ?auto_217603 ?auto_217611 ) ) ( not ( = ?auto_217603 ?auto_217612 ) ) ( not ( = ?auto_217603 ?auto_217613 ) ) ( not ( = ?auto_217603 ?auto_217614 ) ) ( not ( = ?auto_217604 ?auto_217605 ) ) ( not ( = ?auto_217604 ?auto_217606 ) ) ( not ( = ?auto_217604 ?auto_217607 ) ) ( not ( = ?auto_217604 ?auto_217608 ) ) ( not ( = ?auto_217604 ?auto_217609 ) ) ( not ( = ?auto_217604 ?auto_217610 ) ) ( not ( = ?auto_217604 ?auto_217611 ) ) ( not ( = ?auto_217604 ?auto_217612 ) ) ( not ( = ?auto_217604 ?auto_217613 ) ) ( not ( = ?auto_217604 ?auto_217614 ) ) ( not ( = ?auto_217605 ?auto_217606 ) ) ( not ( = ?auto_217605 ?auto_217607 ) ) ( not ( = ?auto_217605 ?auto_217608 ) ) ( not ( = ?auto_217605 ?auto_217609 ) ) ( not ( = ?auto_217605 ?auto_217610 ) ) ( not ( = ?auto_217605 ?auto_217611 ) ) ( not ( = ?auto_217605 ?auto_217612 ) ) ( not ( = ?auto_217605 ?auto_217613 ) ) ( not ( = ?auto_217605 ?auto_217614 ) ) ( not ( = ?auto_217606 ?auto_217607 ) ) ( not ( = ?auto_217606 ?auto_217608 ) ) ( not ( = ?auto_217606 ?auto_217609 ) ) ( not ( = ?auto_217606 ?auto_217610 ) ) ( not ( = ?auto_217606 ?auto_217611 ) ) ( not ( = ?auto_217606 ?auto_217612 ) ) ( not ( = ?auto_217606 ?auto_217613 ) ) ( not ( = ?auto_217606 ?auto_217614 ) ) ( not ( = ?auto_217607 ?auto_217608 ) ) ( not ( = ?auto_217607 ?auto_217609 ) ) ( not ( = ?auto_217607 ?auto_217610 ) ) ( not ( = ?auto_217607 ?auto_217611 ) ) ( not ( = ?auto_217607 ?auto_217612 ) ) ( not ( = ?auto_217607 ?auto_217613 ) ) ( not ( = ?auto_217607 ?auto_217614 ) ) ( not ( = ?auto_217608 ?auto_217609 ) ) ( not ( = ?auto_217608 ?auto_217610 ) ) ( not ( = ?auto_217608 ?auto_217611 ) ) ( not ( = ?auto_217608 ?auto_217612 ) ) ( not ( = ?auto_217608 ?auto_217613 ) ) ( not ( = ?auto_217608 ?auto_217614 ) ) ( not ( = ?auto_217609 ?auto_217610 ) ) ( not ( = ?auto_217609 ?auto_217611 ) ) ( not ( = ?auto_217609 ?auto_217612 ) ) ( not ( = ?auto_217609 ?auto_217613 ) ) ( not ( = ?auto_217609 ?auto_217614 ) ) ( not ( = ?auto_217610 ?auto_217611 ) ) ( not ( = ?auto_217610 ?auto_217612 ) ) ( not ( = ?auto_217610 ?auto_217613 ) ) ( not ( = ?auto_217610 ?auto_217614 ) ) ( not ( = ?auto_217611 ?auto_217612 ) ) ( not ( = ?auto_217611 ?auto_217613 ) ) ( not ( = ?auto_217611 ?auto_217614 ) ) ( not ( = ?auto_217612 ?auto_217613 ) ) ( not ( = ?auto_217612 ?auto_217614 ) ) ( not ( = ?auto_217613 ?auto_217614 ) ) ( CLEAR ?auto_217611 ) ( ON ?auto_217612 ?auto_217613 ) ( CLEAR ?auto_217612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_217603 ?auto_217604 ?auto_217605 ?auto_217606 ?auto_217607 ?auto_217608 ?auto_217609 ?auto_217610 ?auto_217611 ?auto_217612 )
      ( MAKE-11PILE ?auto_217603 ?auto_217604 ?auto_217605 ?auto_217606 ?auto_217607 ?auto_217608 ?auto_217609 ?auto_217610 ?auto_217611 ?auto_217612 ?auto_217613 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217626 - BLOCK
      ?auto_217627 - BLOCK
      ?auto_217628 - BLOCK
      ?auto_217629 - BLOCK
      ?auto_217630 - BLOCK
      ?auto_217631 - BLOCK
      ?auto_217632 - BLOCK
      ?auto_217633 - BLOCK
      ?auto_217634 - BLOCK
      ?auto_217635 - BLOCK
      ?auto_217636 - BLOCK
    )
    :vars
    (
      ?auto_217637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217636 ?auto_217637 ) ( ON-TABLE ?auto_217626 ) ( ON ?auto_217627 ?auto_217626 ) ( ON ?auto_217628 ?auto_217627 ) ( ON ?auto_217629 ?auto_217628 ) ( ON ?auto_217630 ?auto_217629 ) ( ON ?auto_217631 ?auto_217630 ) ( ON ?auto_217632 ?auto_217631 ) ( ON ?auto_217633 ?auto_217632 ) ( ON ?auto_217634 ?auto_217633 ) ( not ( = ?auto_217626 ?auto_217627 ) ) ( not ( = ?auto_217626 ?auto_217628 ) ) ( not ( = ?auto_217626 ?auto_217629 ) ) ( not ( = ?auto_217626 ?auto_217630 ) ) ( not ( = ?auto_217626 ?auto_217631 ) ) ( not ( = ?auto_217626 ?auto_217632 ) ) ( not ( = ?auto_217626 ?auto_217633 ) ) ( not ( = ?auto_217626 ?auto_217634 ) ) ( not ( = ?auto_217626 ?auto_217635 ) ) ( not ( = ?auto_217626 ?auto_217636 ) ) ( not ( = ?auto_217626 ?auto_217637 ) ) ( not ( = ?auto_217627 ?auto_217628 ) ) ( not ( = ?auto_217627 ?auto_217629 ) ) ( not ( = ?auto_217627 ?auto_217630 ) ) ( not ( = ?auto_217627 ?auto_217631 ) ) ( not ( = ?auto_217627 ?auto_217632 ) ) ( not ( = ?auto_217627 ?auto_217633 ) ) ( not ( = ?auto_217627 ?auto_217634 ) ) ( not ( = ?auto_217627 ?auto_217635 ) ) ( not ( = ?auto_217627 ?auto_217636 ) ) ( not ( = ?auto_217627 ?auto_217637 ) ) ( not ( = ?auto_217628 ?auto_217629 ) ) ( not ( = ?auto_217628 ?auto_217630 ) ) ( not ( = ?auto_217628 ?auto_217631 ) ) ( not ( = ?auto_217628 ?auto_217632 ) ) ( not ( = ?auto_217628 ?auto_217633 ) ) ( not ( = ?auto_217628 ?auto_217634 ) ) ( not ( = ?auto_217628 ?auto_217635 ) ) ( not ( = ?auto_217628 ?auto_217636 ) ) ( not ( = ?auto_217628 ?auto_217637 ) ) ( not ( = ?auto_217629 ?auto_217630 ) ) ( not ( = ?auto_217629 ?auto_217631 ) ) ( not ( = ?auto_217629 ?auto_217632 ) ) ( not ( = ?auto_217629 ?auto_217633 ) ) ( not ( = ?auto_217629 ?auto_217634 ) ) ( not ( = ?auto_217629 ?auto_217635 ) ) ( not ( = ?auto_217629 ?auto_217636 ) ) ( not ( = ?auto_217629 ?auto_217637 ) ) ( not ( = ?auto_217630 ?auto_217631 ) ) ( not ( = ?auto_217630 ?auto_217632 ) ) ( not ( = ?auto_217630 ?auto_217633 ) ) ( not ( = ?auto_217630 ?auto_217634 ) ) ( not ( = ?auto_217630 ?auto_217635 ) ) ( not ( = ?auto_217630 ?auto_217636 ) ) ( not ( = ?auto_217630 ?auto_217637 ) ) ( not ( = ?auto_217631 ?auto_217632 ) ) ( not ( = ?auto_217631 ?auto_217633 ) ) ( not ( = ?auto_217631 ?auto_217634 ) ) ( not ( = ?auto_217631 ?auto_217635 ) ) ( not ( = ?auto_217631 ?auto_217636 ) ) ( not ( = ?auto_217631 ?auto_217637 ) ) ( not ( = ?auto_217632 ?auto_217633 ) ) ( not ( = ?auto_217632 ?auto_217634 ) ) ( not ( = ?auto_217632 ?auto_217635 ) ) ( not ( = ?auto_217632 ?auto_217636 ) ) ( not ( = ?auto_217632 ?auto_217637 ) ) ( not ( = ?auto_217633 ?auto_217634 ) ) ( not ( = ?auto_217633 ?auto_217635 ) ) ( not ( = ?auto_217633 ?auto_217636 ) ) ( not ( = ?auto_217633 ?auto_217637 ) ) ( not ( = ?auto_217634 ?auto_217635 ) ) ( not ( = ?auto_217634 ?auto_217636 ) ) ( not ( = ?auto_217634 ?auto_217637 ) ) ( not ( = ?auto_217635 ?auto_217636 ) ) ( not ( = ?auto_217635 ?auto_217637 ) ) ( not ( = ?auto_217636 ?auto_217637 ) ) ( CLEAR ?auto_217634 ) ( ON ?auto_217635 ?auto_217636 ) ( CLEAR ?auto_217635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_217626 ?auto_217627 ?auto_217628 ?auto_217629 ?auto_217630 ?auto_217631 ?auto_217632 ?auto_217633 ?auto_217634 ?auto_217635 )
      ( MAKE-11PILE ?auto_217626 ?auto_217627 ?auto_217628 ?auto_217629 ?auto_217630 ?auto_217631 ?auto_217632 ?auto_217633 ?auto_217634 ?auto_217635 ?auto_217636 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217649 - BLOCK
      ?auto_217650 - BLOCK
      ?auto_217651 - BLOCK
      ?auto_217652 - BLOCK
      ?auto_217653 - BLOCK
      ?auto_217654 - BLOCK
      ?auto_217655 - BLOCK
      ?auto_217656 - BLOCK
      ?auto_217657 - BLOCK
      ?auto_217658 - BLOCK
      ?auto_217659 - BLOCK
    )
    :vars
    (
      ?auto_217660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217659 ?auto_217660 ) ( ON-TABLE ?auto_217649 ) ( ON ?auto_217650 ?auto_217649 ) ( ON ?auto_217651 ?auto_217650 ) ( ON ?auto_217652 ?auto_217651 ) ( ON ?auto_217653 ?auto_217652 ) ( ON ?auto_217654 ?auto_217653 ) ( ON ?auto_217655 ?auto_217654 ) ( ON ?auto_217656 ?auto_217655 ) ( not ( = ?auto_217649 ?auto_217650 ) ) ( not ( = ?auto_217649 ?auto_217651 ) ) ( not ( = ?auto_217649 ?auto_217652 ) ) ( not ( = ?auto_217649 ?auto_217653 ) ) ( not ( = ?auto_217649 ?auto_217654 ) ) ( not ( = ?auto_217649 ?auto_217655 ) ) ( not ( = ?auto_217649 ?auto_217656 ) ) ( not ( = ?auto_217649 ?auto_217657 ) ) ( not ( = ?auto_217649 ?auto_217658 ) ) ( not ( = ?auto_217649 ?auto_217659 ) ) ( not ( = ?auto_217649 ?auto_217660 ) ) ( not ( = ?auto_217650 ?auto_217651 ) ) ( not ( = ?auto_217650 ?auto_217652 ) ) ( not ( = ?auto_217650 ?auto_217653 ) ) ( not ( = ?auto_217650 ?auto_217654 ) ) ( not ( = ?auto_217650 ?auto_217655 ) ) ( not ( = ?auto_217650 ?auto_217656 ) ) ( not ( = ?auto_217650 ?auto_217657 ) ) ( not ( = ?auto_217650 ?auto_217658 ) ) ( not ( = ?auto_217650 ?auto_217659 ) ) ( not ( = ?auto_217650 ?auto_217660 ) ) ( not ( = ?auto_217651 ?auto_217652 ) ) ( not ( = ?auto_217651 ?auto_217653 ) ) ( not ( = ?auto_217651 ?auto_217654 ) ) ( not ( = ?auto_217651 ?auto_217655 ) ) ( not ( = ?auto_217651 ?auto_217656 ) ) ( not ( = ?auto_217651 ?auto_217657 ) ) ( not ( = ?auto_217651 ?auto_217658 ) ) ( not ( = ?auto_217651 ?auto_217659 ) ) ( not ( = ?auto_217651 ?auto_217660 ) ) ( not ( = ?auto_217652 ?auto_217653 ) ) ( not ( = ?auto_217652 ?auto_217654 ) ) ( not ( = ?auto_217652 ?auto_217655 ) ) ( not ( = ?auto_217652 ?auto_217656 ) ) ( not ( = ?auto_217652 ?auto_217657 ) ) ( not ( = ?auto_217652 ?auto_217658 ) ) ( not ( = ?auto_217652 ?auto_217659 ) ) ( not ( = ?auto_217652 ?auto_217660 ) ) ( not ( = ?auto_217653 ?auto_217654 ) ) ( not ( = ?auto_217653 ?auto_217655 ) ) ( not ( = ?auto_217653 ?auto_217656 ) ) ( not ( = ?auto_217653 ?auto_217657 ) ) ( not ( = ?auto_217653 ?auto_217658 ) ) ( not ( = ?auto_217653 ?auto_217659 ) ) ( not ( = ?auto_217653 ?auto_217660 ) ) ( not ( = ?auto_217654 ?auto_217655 ) ) ( not ( = ?auto_217654 ?auto_217656 ) ) ( not ( = ?auto_217654 ?auto_217657 ) ) ( not ( = ?auto_217654 ?auto_217658 ) ) ( not ( = ?auto_217654 ?auto_217659 ) ) ( not ( = ?auto_217654 ?auto_217660 ) ) ( not ( = ?auto_217655 ?auto_217656 ) ) ( not ( = ?auto_217655 ?auto_217657 ) ) ( not ( = ?auto_217655 ?auto_217658 ) ) ( not ( = ?auto_217655 ?auto_217659 ) ) ( not ( = ?auto_217655 ?auto_217660 ) ) ( not ( = ?auto_217656 ?auto_217657 ) ) ( not ( = ?auto_217656 ?auto_217658 ) ) ( not ( = ?auto_217656 ?auto_217659 ) ) ( not ( = ?auto_217656 ?auto_217660 ) ) ( not ( = ?auto_217657 ?auto_217658 ) ) ( not ( = ?auto_217657 ?auto_217659 ) ) ( not ( = ?auto_217657 ?auto_217660 ) ) ( not ( = ?auto_217658 ?auto_217659 ) ) ( not ( = ?auto_217658 ?auto_217660 ) ) ( not ( = ?auto_217659 ?auto_217660 ) ) ( ON ?auto_217658 ?auto_217659 ) ( CLEAR ?auto_217656 ) ( ON ?auto_217657 ?auto_217658 ) ( CLEAR ?auto_217657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_217649 ?auto_217650 ?auto_217651 ?auto_217652 ?auto_217653 ?auto_217654 ?auto_217655 ?auto_217656 ?auto_217657 )
      ( MAKE-11PILE ?auto_217649 ?auto_217650 ?auto_217651 ?auto_217652 ?auto_217653 ?auto_217654 ?auto_217655 ?auto_217656 ?auto_217657 ?auto_217658 ?auto_217659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217672 - BLOCK
      ?auto_217673 - BLOCK
      ?auto_217674 - BLOCK
      ?auto_217675 - BLOCK
      ?auto_217676 - BLOCK
      ?auto_217677 - BLOCK
      ?auto_217678 - BLOCK
      ?auto_217679 - BLOCK
      ?auto_217680 - BLOCK
      ?auto_217681 - BLOCK
      ?auto_217682 - BLOCK
    )
    :vars
    (
      ?auto_217683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217682 ?auto_217683 ) ( ON-TABLE ?auto_217672 ) ( ON ?auto_217673 ?auto_217672 ) ( ON ?auto_217674 ?auto_217673 ) ( ON ?auto_217675 ?auto_217674 ) ( ON ?auto_217676 ?auto_217675 ) ( ON ?auto_217677 ?auto_217676 ) ( ON ?auto_217678 ?auto_217677 ) ( ON ?auto_217679 ?auto_217678 ) ( not ( = ?auto_217672 ?auto_217673 ) ) ( not ( = ?auto_217672 ?auto_217674 ) ) ( not ( = ?auto_217672 ?auto_217675 ) ) ( not ( = ?auto_217672 ?auto_217676 ) ) ( not ( = ?auto_217672 ?auto_217677 ) ) ( not ( = ?auto_217672 ?auto_217678 ) ) ( not ( = ?auto_217672 ?auto_217679 ) ) ( not ( = ?auto_217672 ?auto_217680 ) ) ( not ( = ?auto_217672 ?auto_217681 ) ) ( not ( = ?auto_217672 ?auto_217682 ) ) ( not ( = ?auto_217672 ?auto_217683 ) ) ( not ( = ?auto_217673 ?auto_217674 ) ) ( not ( = ?auto_217673 ?auto_217675 ) ) ( not ( = ?auto_217673 ?auto_217676 ) ) ( not ( = ?auto_217673 ?auto_217677 ) ) ( not ( = ?auto_217673 ?auto_217678 ) ) ( not ( = ?auto_217673 ?auto_217679 ) ) ( not ( = ?auto_217673 ?auto_217680 ) ) ( not ( = ?auto_217673 ?auto_217681 ) ) ( not ( = ?auto_217673 ?auto_217682 ) ) ( not ( = ?auto_217673 ?auto_217683 ) ) ( not ( = ?auto_217674 ?auto_217675 ) ) ( not ( = ?auto_217674 ?auto_217676 ) ) ( not ( = ?auto_217674 ?auto_217677 ) ) ( not ( = ?auto_217674 ?auto_217678 ) ) ( not ( = ?auto_217674 ?auto_217679 ) ) ( not ( = ?auto_217674 ?auto_217680 ) ) ( not ( = ?auto_217674 ?auto_217681 ) ) ( not ( = ?auto_217674 ?auto_217682 ) ) ( not ( = ?auto_217674 ?auto_217683 ) ) ( not ( = ?auto_217675 ?auto_217676 ) ) ( not ( = ?auto_217675 ?auto_217677 ) ) ( not ( = ?auto_217675 ?auto_217678 ) ) ( not ( = ?auto_217675 ?auto_217679 ) ) ( not ( = ?auto_217675 ?auto_217680 ) ) ( not ( = ?auto_217675 ?auto_217681 ) ) ( not ( = ?auto_217675 ?auto_217682 ) ) ( not ( = ?auto_217675 ?auto_217683 ) ) ( not ( = ?auto_217676 ?auto_217677 ) ) ( not ( = ?auto_217676 ?auto_217678 ) ) ( not ( = ?auto_217676 ?auto_217679 ) ) ( not ( = ?auto_217676 ?auto_217680 ) ) ( not ( = ?auto_217676 ?auto_217681 ) ) ( not ( = ?auto_217676 ?auto_217682 ) ) ( not ( = ?auto_217676 ?auto_217683 ) ) ( not ( = ?auto_217677 ?auto_217678 ) ) ( not ( = ?auto_217677 ?auto_217679 ) ) ( not ( = ?auto_217677 ?auto_217680 ) ) ( not ( = ?auto_217677 ?auto_217681 ) ) ( not ( = ?auto_217677 ?auto_217682 ) ) ( not ( = ?auto_217677 ?auto_217683 ) ) ( not ( = ?auto_217678 ?auto_217679 ) ) ( not ( = ?auto_217678 ?auto_217680 ) ) ( not ( = ?auto_217678 ?auto_217681 ) ) ( not ( = ?auto_217678 ?auto_217682 ) ) ( not ( = ?auto_217678 ?auto_217683 ) ) ( not ( = ?auto_217679 ?auto_217680 ) ) ( not ( = ?auto_217679 ?auto_217681 ) ) ( not ( = ?auto_217679 ?auto_217682 ) ) ( not ( = ?auto_217679 ?auto_217683 ) ) ( not ( = ?auto_217680 ?auto_217681 ) ) ( not ( = ?auto_217680 ?auto_217682 ) ) ( not ( = ?auto_217680 ?auto_217683 ) ) ( not ( = ?auto_217681 ?auto_217682 ) ) ( not ( = ?auto_217681 ?auto_217683 ) ) ( not ( = ?auto_217682 ?auto_217683 ) ) ( ON ?auto_217681 ?auto_217682 ) ( CLEAR ?auto_217679 ) ( ON ?auto_217680 ?auto_217681 ) ( CLEAR ?auto_217680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_217672 ?auto_217673 ?auto_217674 ?auto_217675 ?auto_217676 ?auto_217677 ?auto_217678 ?auto_217679 ?auto_217680 )
      ( MAKE-11PILE ?auto_217672 ?auto_217673 ?auto_217674 ?auto_217675 ?auto_217676 ?auto_217677 ?auto_217678 ?auto_217679 ?auto_217680 ?auto_217681 ?auto_217682 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217695 - BLOCK
      ?auto_217696 - BLOCK
      ?auto_217697 - BLOCK
      ?auto_217698 - BLOCK
      ?auto_217699 - BLOCK
      ?auto_217700 - BLOCK
      ?auto_217701 - BLOCK
      ?auto_217702 - BLOCK
      ?auto_217703 - BLOCK
      ?auto_217704 - BLOCK
      ?auto_217705 - BLOCK
    )
    :vars
    (
      ?auto_217706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217705 ?auto_217706 ) ( ON-TABLE ?auto_217695 ) ( ON ?auto_217696 ?auto_217695 ) ( ON ?auto_217697 ?auto_217696 ) ( ON ?auto_217698 ?auto_217697 ) ( ON ?auto_217699 ?auto_217698 ) ( ON ?auto_217700 ?auto_217699 ) ( ON ?auto_217701 ?auto_217700 ) ( not ( = ?auto_217695 ?auto_217696 ) ) ( not ( = ?auto_217695 ?auto_217697 ) ) ( not ( = ?auto_217695 ?auto_217698 ) ) ( not ( = ?auto_217695 ?auto_217699 ) ) ( not ( = ?auto_217695 ?auto_217700 ) ) ( not ( = ?auto_217695 ?auto_217701 ) ) ( not ( = ?auto_217695 ?auto_217702 ) ) ( not ( = ?auto_217695 ?auto_217703 ) ) ( not ( = ?auto_217695 ?auto_217704 ) ) ( not ( = ?auto_217695 ?auto_217705 ) ) ( not ( = ?auto_217695 ?auto_217706 ) ) ( not ( = ?auto_217696 ?auto_217697 ) ) ( not ( = ?auto_217696 ?auto_217698 ) ) ( not ( = ?auto_217696 ?auto_217699 ) ) ( not ( = ?auto_217696 ?auto_217700 ) ) ( not ( = ?auto_217696 ?auto_217701 ) ) ( not ( = ?auto_217696 ?auto_217702 ) ) ( not ( = ?auto_217696 ?auto_217703 ) ) ( not ( = ?auto_217696 ?auto_217704 ) ) ( not ( = ?auto_217696 ?auto_217705 ) ) ( not ( = ?auto_217696 ?auto_217706 ) ) ( not ( = ?auto_217697 ?auto_217698 ) ) ( not ( = ?auto_217697 ?auto_217699 ) ) ( not ( = ?auto_217697 ?auto_217700 ) ) ( not ( = ?auto_217697 ?auto_217701 ) ) ( not ( = ?auto_217697 ?auto_217702 ) ) ( not ( = ?auto_217697 ?auto_217703 ) ) ( not ( = ?auto_217697 ?auto_217704 ) ) ( not ( = ?auto_217697 ?auto_217705 ) ) ( not ( = ?auto_217697 ?auto_217706 ) ) ( not ( = ?auto_217698 ?auto_217699 ) ) ( not ( = ?auto_217698 ?auto_217700 ) ) ( not ( = ?auto_217698 ?auto_217701 ) ) ( not ( = ?auto_217698 ?auto_217702 ) ) ( not ( = ?auto_217698 ?auto_217703 ) ) ( not ( = ?auto_217698 ?auto_217704 ) ) ( not ( = ?auto_217698 ?auto_217705 ) ) ( not ( = ?auto_217698 ?auto_217706 ) ) ( not ( = ?auto_217699 ?auto_217700 ) ) ( not ( = ?auto_217699 ?auto_217701 ) ) ( not ( = ?auto_217699 ?auto_217702 ) ) ( not ( = ?auto_217699 ?auto_217703 ) ) ( not ( = ?auto_217699 ?auto_217704 ) ) ( not ( = ?auto_217699 ?auto_217705 ) ) ( not ( = ?auto_217699 ?auto_217706 ) ) ( not ( = ?auto_217700 ?auto_217701 ) ) ( not ( = ?auto_217700 ?auto_217702 ) ) ( not ( = ?auto_217700 ?auto_217703 ) ) ( not ( = ?auto_217700 ?auto_217704 ) ) ( not ( = ?auto_217700 ?auto_217705 ) ) ( not ( = ?auto_217700 ?auto_217706 ) ) ( not ( = ?auto_217701 ?auto_217702 ) ) ( not ( = ?auto_217701 ?auto_217703 ) ) ( not ( = ?auto_217701 ?auto_217704 ) ) ( not ( = ?auto_217701 ?auto_217705 ) ) ( not ( = ?auto_217701 ?auto_217706 ) ) ( not ( = ?auto_217702 ?auto_217703 ) ) ( not ( = ?auto_217702 ?auto_217704 ) ) ( not ( = ?auto_217702 ?auto_217705 ) ) ( not ( = ?auto_217702 ?auto_217706 ) ) ( not ( = ?auto_217703 ?auto_217704 ) ) ( not ( = ?auto_217703 ?auto_217705 ) ) ( not ( = ?auto_217703 ?auto_217706 ) ) ( not ( = ?auto_217704 ?auto_217705 ) ) ( not ( = ?auto_217704 ?auto_217706 ) ) ( not ( = ?auto_217705 ?auto_217706 ) ) ( ON ?auto_217704 ?auto_217705 ) ( ON ?auto_217703 ?auto_217704 ) ( CLEAR ?auto_217701 ) ( ON ?auto_217702 ?auto_217703 ) ( CLEAR ?auto_217702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217695 ?auto_217696 ?auto_217697 ?auto_217698 ?auto_217699 ?auto_217700 ?auto_217701 ?auto_217702 )
      ( MAKE-11PILE ?auto_217695 ?auto_217696 ?auto_217697 ?auto_217698 ?auto_217699 ?auto_217700 ?auto_217701 ?auto_217702 ?auto_217703 ?auto_217704 ?auto_217705 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217718 - BLOCK
      ?auto_217719 - BLOCK
      ?auto_217720 - BLOCK
      ?auto_217721 - BLOCK
      ?auto_217722 - BLOCK
      ?auto_217723 - BLOCK
      ?auto_217724 - BLOCK
      ?auto_217725 - BLOCK
      ?auto_217726 - BLOCK
      ?auto_217727 - BLOCK
      ?auto_217728 - BLOCK
    )
    :vars
    (
      ?auto_217729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217728 ?auto_217729 ) ( ON-TABLE ?auto_217718 ) ( ON ?auto_217719 ?auto_217718 ) ( ON ?auto_217720 ?auto_217719 ) ( ON ?auto_217721 ?auto_217720 ) ( ON ?auto_217722 ?auto_217721 ) ( ON ?auto_217723 ?auto_217722 ) ( ON ?auto_217724 ?auto_217723 ) ( not ( = ?auto_217718 ?auto_217719 ) ) ( not ( = ?auto_217718 ?auto_217720 ) ) ( not ( = ?auto_217718 ?auto_217721 ) ) ( not ( = ?auto_217718 ?auto_217722 ) ) ( not ( = ?auto_217718 ?auto_217723 ) ) ( not ( = ?auto_217718 ?auto_217724 ) ) ( not ( = ?auto_217718 ?auto_217725 ) ) ( not ( = ?auto_217718 ?auto_217726 ) ) ( not ( = ?auto_217718 ?auto_217727 ) ) ( not ( = ?auto_217718 ?auto_217728 ) ) ( not ( = ?auto_217718 ?auto_217729 ) ) ( not ( = ?auto_217719 ?auto_217720 ) ) ( not ( = ?auto_217719 ?auto_217721 ) ) ( not ( = ?auto_217719 ?auto_217722 ) ) ( not ( = ?auto_217719 ?auto_217723 ) ) ( not ( = ?auto_217719 ?auto_217724 ) ) ( not ( = ?auto_217719 ?auto_217725 ) ) ( not ( = ?auto_217719 ?auto_217726 ) ) ( not ( = ?auto_217719 ?auto_217727 ) ) ( not ( = ?auto_217719 ?auto_217728 ) ) ( not ( = ?auto_217719 ?auto_217729 ) ) ( not ( = ?auto_217720 ?auto_217721 ) ) ( not ( = ?auto_217720 ?auto_217722 ) ) ( not ( = ?auto_217720 ?auto_217723 ) ) ( not ( = ?auto_217720 ?auto_217724 ) ) ( not ( = ?auto_217720 ?auto_217725 ) ) ( not ( = ?auto_217720 ?auto_217726 ) ) ( not ( = ?auto_217720 ?auto_217727 ) ) ( not ( = ?auto_217720 ?auto_217728 ) ) ( not ( = ?auto_217720 ?auto_217729 ) ) ( not ( = ?auto_217721 ?auto_217722 ) ) ( not ( = ?auto_217721 ?auto_217723 ) ) ( not ( = ?auto_217721 ?auto_217724 ) ) ( not ( = ?auto_217721 ?auto_217725 ) ) ( not ( = ?auto_217721 ?auto_217726 ) ) ( not ( = ?auto_217721 ?auto_217727 ) ) ( not ( = ?auto_217721 ?auto_217728 ) ) ( not ( = ?auto_217721 ?auto_217729 ) ) ( not ( = ?auto_217722 ?auto_217723 ) ) ( not ( = ?auto_217722 ?auto_217724 ) ) ( not ( = ?auto_217722 ?auto_217725 ) ) ( not ( = ?auto_217722 ?auto_217726 ) ) ( not ( = ?auto_217722 ?auto_217727 ) ) ( not ( = ?auto_217722 ?auto_217728 ) ) ( not ( = ?auto_217722 ?auto_217729 ) ) ( not ( = ?auto_217723 ?auto_217724 ) ) ( not ( = ?auto_217723 ?auto_217725 ) ) ( not ( = ?auto_217723 ?auto_217726 ) ) ( not ( = ?auto_217723 ?auto_217727 ) ) ( not ( = ?auto_217723 ?auto_217728 ) ) ( not ( = ?auto_217723 ?auto_217729 ) ) ( not ( = ?auto_217724 ?auto_217725 ) ) ( not ( = ?auto_217724 ?auto_217726 ) ) ( not ( = ?auto_217724 ?auto_217727 ) ) ( not ( = ?auto_217724 ?auto_217728 ) ) ( not ( = ?auto_217724 ?auto_217729 ) ) ( not ( = ?auto_217725 ?auto_217726 ) ) ( not ( = ?auto_217725 ?auto_217727 ) ) ( not ( = ?auto_217725 ?auto_217728 ) ) ( not ( = ?auto_217725 ?auto_217729 ) ) ( not ( = ?auto_217726 ?auto_217727 ) ) ( not ( = ?auto_217726 ?auto_217728 ) ) ( not ( = ?auto_217726 ?auto_217729 ) ) ( not ( = ?auto_217727 ?auto_217728 ) ) ( not ( = ?auto_217727 ?auto_217729 ) ) ( not ( = ?auto_217728 ?auto_217729 ) ) ( ON ?auto_217727 ?auto_217728 ) ( ON ?auto_217726 ?auto_217727 ) ( CLEAR ?auto_217724 ) ( ON ?auto_217725 ?auto_217726 ) ( CLEAR ?auto_217725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_217718 ?auto_217719 ?auto_217720 ?auto_217721 ?auto_217722 ?auto_217723 ?auto_217724 ?auto_217725 )
      ( MAKE-11PILE ?auto_217718 ?auto_217719 ?auto_217720 ?auto_217721 ?auto_217722 ?auto_217723 ?auto_217724 ?auto_217725 ?auto_217726 ?auto_217727 ?auto_217728 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217741 - BLOCK
      ?auto_217742 - BLOCK
      ?auto_217743 - BLOCK
      ?auto_217744 - BLOCK
      ?auto_217745 - BLOCK
      ?auto_217746 - BLOCK
      ?auto_217747 - BLOCK
      ?auto_217748 - BLOCK
      ?auto_217749 - BLOCK
      ?auto_217750 - BLOCK
      ?auto_217751 - BLOCK
    )
    :vars
    (
      ?auto_217752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217751 ?auto_217752 ) ( ON-TABLE ?auto_217741 ) ( ON ?auto_217742 ?auto_217741 ) ( ON ?auto_217743 ?auto_217742 ) ( ON ?auto_217744 ?auto_217743 ) ( ON ?auto_217745 ?auto_217744 ) ( ON ?auto_217746 ?auto_217745 ) ( not ( = ?auto_217741 ?auto_217742 ) ) ( not ( = ?auto_217741 ?auto_217743 ) ) ( not ( = ?auto_217741 ?auto_217744 ) ) ( not ( = ?auto_217741 ?auto_217745 ) ) ( not ( = ?auto_217741 ?auto_217746 ) ) ( not ( = ?auto_217741 ?auto_217747 ) ) ( not ( = ?auto_217741 ?auto_217748 ) ) ( not ( = ?auto_217741 ?auto_217749 ) ) ( not ( = ?auto_217741 ?auto_217750 ) ) ( not ( = ?auto_217741 ?auto_217751 ) ) ( not ( = ?auto_217741 ?auto_217752 ) ) ( not ( = ?auto_217742 ?auto_217743 ) ) ( not ( = ?auto_217742 ?auto_217744 ) ) ( not ( = ?auto_217742 ?auto_217745 ) ) ( not ( = ?auto_217742 ?auto_217746 ) ) ( not ( = ?auto_217742 ?auto_217747 ) ) ( not ( = ?auto_217742 ?auto_217748 ) ) ( not ( = ?auto_217742 ?auto_217749 ) ) ( not ( = ?auto_217742 ?auto_217750 ) ) ( not ( = ?auto_217742 ?auto_217751 ) ) ( not ( = ?auto_217742 ?auto_217752 ) ) ( not ( = ?auto_217743 ?auto_217744 ) ) ( not ( = ?auto_217743 ?auto_217745 ) ) ( not ( = ?auto_217743 ?auto_217746 ) ) ( not ( = ?auto_217743 ?auto_217747 ) ) ( not ( = ?auto_217743 ?auto_217748 ) ) ( not ( = ?auto_217743 ?auto_217749 ) ) ( not ( = ?auto_217743 ?auto_217750 ) ) ( not ( = ?auto_217743 ?auto_217751 ) ) ( not ( = ?auto_217743 ?auto_217752 ) ) ( not ( = ?auto_217744 ?auto_217745 ) ) ( not ( = ?auto_217744 ?auto_217746 ) ) ( not ( = ?auto_217744 ?auto_217747 ) ) ( not ( = ?auto_217744 ?auto_217748 ) ) ( not ( = ?auto_217744 ?auto_217749 ) ) ( not ( = ?auto_217744 ?auto_217750 ) ) ( not ( = ?auto_217744 ?auto_217751 ) ) ( not ( = ?auto_217744 ?auto_217752 ) ) ( not ( = ?auto_217745 ?auto_217746 ) ) ( not ( = ?auto_217745 ?auto_217747 ) ) ( not ( = ?auto_217745 ?auto_217748 ) ) ( not ( = ?auto_217745 ?auto_217749 ) ) ( not ( = ?auto_217745 ?auto_217750 ) ) ( not ( = ?auto_217745 ?auto_217751 ) ) ( not ( = ?auto_217745 ?auto_217752 ) ) ( not ( = ?auto_217746 ?auto_217747 ) ) ( not ( = ?auto_217746 ?auto_217748 ) ) ( not ( = ?auto_217746 ?auto_217749 ) ) ( not ( = ?auto_217746 ?auto_217750 ) ) ( not ( = ?auto_217746 ?auto_217751 ) ) ( not ( = ?auto_217746 ?auto_217752 ) ) ( not ( = ?auto_217747 ?auto_217748 ) ) ( not ( = ?auto_217747 ?auto_217749 ) ) ( not ( = ?auto_217747 ?auto_217750 ) ) ( not ( = ?auto_217747 ?auto_217751 ) ) ( not ( = ?auto_217747 ?auto_217752 ) ) ( not ( = ?auto_217748 ?auto_217749 ) ) ( not ( = ?auto_217748 ?auto_217750 ) ) ( not ( = ?auto_217748 ?auto_217751 ) ) ( not ( = ?auto_217748 ?auto_217752 ) ) ( not ( = ?auto_217749 ?auto_217750 ) ) ( not ( = ?auto_217749 ?auto_217751 ) ) ( not ( = ?auto_217749 ?auto_217752 ) ) ( not ( = ?auto_217750 ?auto_217751 ) ) ( not ( = ?auto_217750 ?auto_217752 ) ) ( not ( = ?auto_217751 ?auto_217752 ) ) ( ON ?auto_217750 ?auto_217751 ) ( ON ?auto_217749 ?auto_217750 ) ( ON ?auto_217748 ?auto_217749 ) ( CLEAR ?auto_217746 ) ( ON ?auto_217747 ?auto_217748 ) ( CLEAR ?auto_217747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217741 ?auto_217742 ?auto_217743 ?auto_217744 ?auto_217745 ?auto_217746 ?auto_217747 )
      ( MAKE-11PILE ?auto_217741 ?auto_217742 ?auto_217743 ?auto_217744 ?auto_217745 ?auto_217746 ?auto_217747 ?auto_217748 ?auto_217749 ?auto_217750 ?auto_217751 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217764 - BLOCK
      ?auto_217765 - BLOCK
      ?auto_217766 - BLOCK
      ?auto_217767 - BLOCK
      ?auto_217768 - BLOCK
      ?auto_217769 - BLOCK
      ?auto_217770 - BLOCK
      ?auto_217771 - BLOCK
      ?auto_217772 - BLOCK
      ?auto_217773 - BLOCK
      ?auto_217774 - BLOCK
    )
    :vars
    (
      ?auto_217775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217774 ?auto_217775 ) ( ON-TABLE ?auto_217764 ) ( ON ?auto_217765 ?auto_217764 ) ( ON ?auto_217766 ?auto_217765 ) ( ON ?auto_217767 ?auto_217766 ) ( ON ?auto_217768 ?auto_217767 ) ( ON ?auto_217769 ?auto_217768 ) ( not ( = ?auto_217764 ?auto_217765 ) ) ( not ( = ?auto_217764 ?auto_217766 ) ) ( not ( = ?auto_217764 ?auto_217767 ) ) ( not ( = ?auto_217764 ?auto_217768 ) ) ( not ( = ?auto_217764 ?auto_217769 ) ) ( not ( = ?auto_217764 ?auto_217770 ) ) ( not ( = ?auto_217764 ?auto_217771 ) ) ( not ( = ?auto_217764 ?auto_217772 ) ) ( not ( = ?auto_217764 ?auto_217773 ) ) ( not ( = ?auto_217764 ?auto_217774 ) ) ( not ( = ?auto_217764 ?auto_217775 ) ) ( not ( = ?auto_217765 ?auto_217766 ) ) ( not ( = ?auto_217765 ?auto_217767 ) ) ( not ( = ?auto_217765 ?auto_217768 ) ) ( not ( = ?auto_217765 ?auto_217769 ) ) ( not ( = ?auto_217765 ?auto_217770 ) ) ( not ( = ?auto_217765 ?auto_217771 ) ) ( not ( = ?auto_217765 ?auto_217772 ) ) ( not ( = ?auto_217765 ?auto_217773 ) ) ( not ( = ?auto_217765 ?auto_217774 ) ) ( not ( = ?auto_217765 ?auto_217775 ) ) ( not ( = ?auto_217766 ?auto_217767 ) ) ( not ( = ?auto_217766 ?auto_217768 ) ) ( not ( = ?auto_217766 ?auto_217769 ) ) ( not ( = ?auto_217766 ?auto_217770 ) ) ( not ( = ?auto_217766 ?auto_217771 ) ) ( not ( = ?auto_217766 ?auto_217772 ) ) ( not ( = ?auto_217766 ?auto_217773 ) ) ( not ( = ?auto_217766 ?auto_217774 ) ) ( not ( = ?auto_217766 ?auto_217775 ) ) ( not ( = ?auto_217767 ?auto_217768 ) ) ( not ( = ?auto_217767 ?auto_217769 ) ) ( not ( = ?auto_217767 ?auto_217770 ) ) ( not ( = ?auto_217767 ?auto_217771 ) ) ( not ( = ?auto_217767 ?auto_217772 ) ) ( not ( = ?auto_217767 ?auto_217773 ) ) ( not ( = ?auto_217767 ?auto_217774 ) ) ( not ( = ?auto_217767 ?auto_217775 ) ) ( not ( = ?auto_217768 ?auto_217769 ) ) ( not ( = ?auto_217768 ?auto_217770 ) ) ( not ( = ?auto_217768 ?auto_217771 ) ) ( not ( = ?auto_217768 ?auto_217772 ) ) ( not ( = ?auto_217768 ?auto_217773 ) ) ( not ( = ?auto_217768 ?auto_217774 ) ) ( not ( = ?auto_217768 ?auto_217775 ) ) ( not ( = ?auto_217769 ?auto_217770 ) ) ( not ( = ?auto_217769 ?auto_217771 ) ) ( not ( = ?auto_217769 ?auto_217772 ) ) ( not ( = ?auto_217769 ?auto_217773 ) ) ( not ( = ?auto_217769 ?auto_217774 ) ) ( not ( = ?auto_217769 ?auto_217775 ) ) ( not ( = ?auto_217770 ?auto_217771 ) ) ( not ( = ?auto_217770 ?auto_217772 ) ) ( not ( = ?auto_217770 ?auto_217773 ) ) ( not ( = ?auto_217770 ?auto_217774 ) ) ( not ( = ?auto_217770 ?auto_217775 ) ) ( not ( = ?auto_217771 ?auto_217772 ) ) ( not ( = ?auto_217771 ?auto_217773 ) ) ( not ( = ?auto_217771 ?auto_217774 ) ) ( not ( = ?auto_217771 ?auto_217775 ) ) ( not ( = ?auto_217772 ?auto_217773 ) ) ( not ( = ?auto_217772 ?auto_217774 ) ) ( not ( = ?auto_217772 ?auto_217775 ) ) ( not ( = ?auto_217773 ?auto_217774 ) ) ( not ( = ?auto_217773 ?auto_217775 ) ) ( not ( = ?auto_217774 ?auto_217775 ) ) ( ON ?auto_217773 ?auto_217774 ) ( ON ?auto_217772 ?auto_217773 ) ( ON ?auto_217771 ?auto_217772 ) ( CLEAR ?auto_217769 ) ( ON ?auto_217770 ?auto_217771 ) ( CLEAR ?auto_217770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_217764 ?auto_217765 ?auto_217766 ?auto_217767 ?auto_217768 ?auto_217769 ?auto_217770 )
      ( MAKE-11PILE ?auto_217764 ?auto_217765 ?auto_217766 ?auto_217767 ?auto_217768 ?auto_217769 ?auto_217770 ?auto_217771 ?auto_217772 ?auto_217773 ?auto_217774 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217787 - BLOCK
      ?auto_217788 - BLOCK
      ?auto_217789 - BLOCK
      ?auto_217790 - BLOCK
      ?auto_217791 - BLOCK
      ?auto_217792 - BLOCK
      ?auto_217793 - BLOCK
      ?auto_217794 - BLOCK
      ?auto_217795 - BLOCK
      ?auto_217796 - BLOCK
      ?auto_217797 - BLOCK
    )
    :vars
    (
      ?auto_217798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217797 ?auto_217798 ) ( ON-TABLE ?auto_217787 ) ( ON ?auto_217788 ?auto_217787 ) ( ON ?auto_217789 ?auto_217788 ) ( ON ?auto_217790 ?auto_217789 ) ( ON ?auto_217791 ?auto_217790 ) ( not ( = ?auto_217787 ?auto_217788 ) ) ( not ( = ?auto_217787 ?auto_217789 ) ) ( not ( = ?auto_217787 ?auto_217790 ) ) ( not ( = ?auto_217787 ?auto_217791 ) ) ( not ( = ?auto_217787 ?auto_217792 ) ) ( not ( = ?auto_217787 ?auto_217793 ) ) ( not ( = ?auto_217787 ?auto_217794 ) ) ( not ( = ?auto_217787 ?auto_217795 ) ) ( not ( = ?auto_217787 ?auto_217796 ) ) ( not ( = ?auto_217787 ?auto_217797 ) ) ( not ( = ?auto_217787 ?auto_217798 ) ) ( not ( = ?auto_217788 ?auto_217789 ) ) ( not ( = ?auto_217788 ?auto_217790 ) ) ( not ( = ?auto_217788 ?auto_217791 ) ) ( not ( = ?auto_217788 ?auto_217792 ) ) ( not ( = ?auto_217788 ?auto_217793 ) ) ( not ( = ?auto_217788 ?auto_217794 ) ) ( not ( = ?auto_217788 ?auto_217795 ) ) ( not ( = ?auto_217788 ?auto_217796 ) ) ( not ( = ?auto_217788 ?auto_217797 ) ) ( not ( = ?auto_217788 ?auto_217798 ) ) ( not ( = ?auto_217789 ?auto_217790 ) ) ( not ( = ?auto_217789 ?auto_217791 ) ) ( not ( = ?auto_217789 ?auto_217792 ) ) ( not ( = ?auto_217789 ?auto_217793 ) ) ( not ( = ?auto_217789 ?auto_217794 ) ) ( not ( = ?auto_217789 ?auto_217795 ) ) ( not ( = ?auto_217789 ?auto_217796 ) ) ( not ( = ?auto_217789 ?auto_217797 ) ) ( not ( = ?auto_217789 ?auto_217798 ) ) ( not ( = ?auto_217790 ?auto_217791 ) ) ( not ( = ?auto_217790 ?auto_217792 ) ) ( not ( = ?auto_217790 ?auto_217793 ) ) ( not ( = ?auto_217790 ?auto_217794 ) ) ( not ( = ?auto_217790 ?auto_217795 ) ) ( not ( = ?auto_217790 ?auto_217796 ) ) ( not ( = ?auto_217790 ?auto_217797 ) ) ( not ( = ?auto_217790 ?auto_217798 ) ) ( not ( = ?auto_217791 ?auto_217792 ) ) ( not ( = ?auto_217791 ?auto_217793 ) ) ( not ( = ?auto_217791 ?auto_217794 ) ) ( not ( = ?auto_217791 ?auto_217795 ) ) ( not ( = ?auto_217791 ?auto_217796 ) ) ( not ( = ?auto_217791 ?auto_217797 ) ) ( not ( = ?auto_217791 ?auto_217798 ) ) ( not ( = ?auto_217792 ?auto_217793 ) ) ( not ( = ?auto_217792 ?auto_217794 ) ) ( not ( = ?auto_217792 ?auto_217795 ) ) ( not ( = ?auto_217792 ?auto_217796 ) ) ( not ( = ?auto_217792 ?auto_217797 ) ) ( not ( = ?auto_217792 ?auto_217798 ) ) ( not ( = ?auto_217793 ?auto_217794 ) ) ( not ( = ?auto_217793 ?auto_217795 ) ) ( not ( = ?auto_217793 ?auto_217796 ) ) ( not ( = ?auto_217793 ?auto_217797 ) ) ( not ( = ?auto_217793 ?auto_217798 ) ) ( not ( = ?auto_217794 ?auto_217795 ) ) ( not ( = ?auto_217794 ?auto_217796 ) ) ( not ( = ?auto_217794 ?auto_217797 ) ) ( not ( = ?auto_217794 ?auto_217798 ) ) ( not ( = ?auto_217795 ?auto_217796 ) ) ( not ( = ?auto_217795 ?auto_217797 ) ) ( not ( = ?auto_217795 ?auto_217798 ) ) ( not ( = ?auto_217796 ?auto_217797 ) ) ( not ( = ?auto_217796 ?auto_217798 ) ) ( not ( = ?auto_217797 ?auto_217798 ) ) ( ON ?auto_217796 ?auto_217797 ) ( ON ?auto_217795 ?auto_217796 ) ( ON ?auto_217794 ?auto_217795 ) ( ON ?auto_217793 ?auto_217794 ) ( CLEAR ?auto_217791 ) ( ON ?auto_217792 ?auto_217793 ) ( CLEAR ?auto_217792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217787 ?auto_217788 ?auto_217789 ?auto_217790 ?auto_217791 ?auto_217792 )
      ( MAKE-11PILE ?auto_217787 ?auto_217788 ?auto_217789 ?auto_217790 ?auto_217791 ?auto_217792 ?auto_217793 ?auto_217794 ?auto_217795 ?auto_217796 ?auto_217797 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217810 - BLOCK
      ?auto_217811 - BLOCK
      ?auto_217812 - BLOCK
      ?auto_217813 - BLOCK
      ?auto_217814 - BLOCK
      ?auto_217815 - BLOCK
      ?auto_217816 - BLOCK
      ?auto_217817 - BLOCK
      ?auto_217818 - BLOCK
      ?auto_217819 - BLOCK
      ?auto_217820 - BLOCK
    )
    :vars
    (
      ?auto_217821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217820 ?auto_217821 ) ( ON-TABLE ?auto_217810 ) ( ON ?auto_217811 ?auto_217810 ) ( ON ?auto_217812 ?auto_217811 ) ( ON ?auto_217813 ?auto_217812 ) ( ON ?auto_217814 ?auto_217813 ) ( not ( = ?auto_217810 ?auto_217811 ) ) ( not ( = ?auto_217810 ?auto_217812 ) ) ( not ( = ?auto_217810 ?auto_217813 ) ) ( not ( = ?auto_217810 ?auto_217814 ) ) ( not ( = ?auto_217810 ?auto_217815 ) ) ( not ( = ?auto_217810 ?auto_217816 ) ) ( not ( = ?auto_217810 ?auto_217817 ) ) ( not ( = ?auto_217810 ?auto_217818 ) ) ( not ( = ?auto_217810 ?auto_217819 ) ) ( not ( = ?auto_217810 ?auto_217820 ) ) ( not ( = ?auto_217810 ?auto_217821 ) ) ( not ( = ?auto_217811 ?auto_217812 ) ) ( not ( = ?auto_217811 ?auto_217813 ) ) ( not ( = ?auto_217811 ?auto_217814 ) ) ( not ( = ?auto_217811 ?auto_217815 ) ) ( not ( = ?auto_217811 ?auto_217816 ) ) ( not ( = ?auto_217811 ?auto_217817 ) ) ( not ( = ?auto_217811 ?auto_217818 ) ) ( not ( = ?auto_217811 ?auto_217819 ) ) ( not ( = ?auto_217811 ?auto_217820 ) ) ( not ( = ?auto_217811 ?auto_217821 ) ) ( not ( = ?auto_217812 ?auto_217813 ) ) ( not ( = ?auto_217812 ?auto_217814 ) ) ( not ( = ?auto_217812 ?auto_217815 ) ) ( not ( = ?auto_217812 ?auto_217816 ) ) ( not ( = ?auto_217812 ?auto_217817 ) ) ( not ( = ?auto_217812 ?auto_217818 ) ) ( not ( = ?auto_217812 ?auto_217819 ) ) ( not ( = ?auto_217812 ?auto_217820 ) ) ( not ( = ?auto_217812 ?auto_217821 ) ) ( not ( = ?auto_217813 ?auto_217814 ) ) ( not ( = ?auto_217813 ?auto_217815 ) ) ( not ( = ?auto_217813 ?auto_217816 ) ) ( not ( = ?auto_217813 ?auto_217817 ) ) ( not ( = ?auto_217813 ?auto_217818 ) ) ( not ( = ?auto_217813 ?auto_217819 ) ) ( not ( = ?auto_217813 ?auto_217820 ) ) ( not ( = ?auto_217813 ?auto_217821 ) ) ( not ( = ?auto_217814 ?auto_217815 ) ) ( not ( = ?auto_217814 ?auto_217816 ) ) ( not ( = ?auto_217814 ?auto_217817 ) ) ( not ( = ?auto_217814 ?auto_217818 ) ) ( not ( = ?auto_217814 ?auto_217819 ) ) ( not ( = ?auto_217814 ?auto_217820 ) ) ( not ( = ?auto_217814 ?auto_217821 ) ) ( not ( = ?auto_217815 ?auto_217816 ) ) ( not ( = ?auto_217815 ?auto_217817 ) ) ( not ( = ?auto_217815 ?auto_217818 ) ) ( not ( = ?auto_217815 ?auto_217819 ) ) ( not ( = ?auto_217815 ?auto_217820 ) ) ( not ( = ?auto_217815 ?auto_217821 ) ) ( not ( = ?auto_217816 ?auto_217817 ) ) ( not ( = ?auto_217816 ?auto_217818 ) ) ( not ( = ?auto_217816 ?auto_217819 ) ) ( not ( = ?auto_217816 ?auto_217820 ) ) ( not ( = ?auto_217816 ?auto_217821 ) ) ( not ( = ?auto_217817 ?auto_217818 ) ) ( not ( = ?auto_217817 ?auto_217819 ) ) ( not ( = ?auto_217817 ?auto_217820 ) ) ( not ( = ?auto_217817 ?auto_217821 ) ) ( not ( = ?auto_217818 ?auto_217819 ) ) ( not ( = ?auto_217818 ?auto_217820 ) ) ( not ( = ?auto_217818 ?auto_217821 ) ) ( not ( = ?auto_217819 ?auto_217820 ) ) ( not ( = ?auto_217819 ?auto_217821 ) ) ( not ( = ?auto_217820 ?auto_217821 ) ) ( ON ?auto_217819 ?auto_217820 ) ( ON ?auto_217818 ?auto_217819 ) ( ON ?auto_217817 ?auto_217818 ) ( ON ?auto_217816 ?auto_217817 ) ( CLEAR ?auto_217814 ) ( ON ?auto_217815 ?auto_217816 ) ( CLEAR ?auto_217815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_217810 ?auto_217811 ?auto_217812 ?auto_217813 ?auto_217814 ?auto_217815 )
      ( MAKE-11PILE ?auto_217810 ?auto_217811 ?auto_217812 ?auto_217813 ?auto_217814 ?auto_217815 ?auto_217816 ?auto_217817 ?auto_217818 ?auto_217819 ?auto_217820 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217833 - BLOCK
      ?auto_217834 - BLOCK
      ?auto_217835 - BLOCK
      ?auto_217836 - BLOCK
      ?auto_217837 - BLOCK
      ?auto_217838 - BLOCK
      ?auto_217839 - BLOCK
      ?auto_217840 - BLOCK
      ?auto_217841 - BLOCK
      ?auto_217842 - BLOCK
      ?auto_217843 - BLOCK
    )
    :vars
    (
      ?auto_217844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217843 ?auto_217844 ) ( ON-TABLE ?auto_217833 ) ( ON ?auto_217834 ?auto_217833 ) ( ON ?auto_217835 ?auto_217834 ) ( ON ?auto_217836 ?auto_217835 ) ( not ( = ?auto_217833 ?auto_217834 ) ) ( not ( = ?auto_217833 ?auto_217835 ) ) ( not ( = ?auto_217833 ?auto_217836 ) ) ( not ( = ?auto_217833 ?auto_217837 ) ) ( not ( = ?auto_217833 ?auto_217838 ) ) ( not ( = ?auto_217833 ?auto_217839 ) ) ( not ( = ?auto_217833 ?auto_217840 ) ) ( not ( = ?auto_217833 ?auto_217841 ) ) ( not ( = ?auto_217833 ?auto_217842 ) ) ( not ( = ?auto_217833 ?auto_217843 ) ) ( not ( = ?auto_217833 ?auto_217844 ) ) ( not ( = ?auto_217834 ?auto_217835 ) ) ( not ( = ?auto_217834 ?auto_217836 ) ) ( not ( = ?auto_217834 ?auto_217837 ) ) ( not ( = ?auto_217834 ?auto_217838 ) ) ( not ( = ?auto_217834 ?auto_217839 ) ) ( not ( = ?auto_217834 ?auto_217840 ) ) ( not ( = ?auto_217834 ?auto_217841 ) ) ( not ( = ?auto_217834 ?auto_217842 ) ) ( not ( = ?auto_217834 ?auto_217843 ) ) ( not ( = ?auto_217834 ?auto_217844 ) ) ( not ( = ?auto_217835 ?auto_217836 ) ) ( not ( = ?auto_217835 ?auto_217837 ) ) ( not ( = ?auto_217835 ?auto_217838 ) ) ( not ( = ?auto_217835 ?auto_217839 ) ) ( not ( = ?auto_217835 ?auto_217840 ) ) ( not ( = ?auto_217835 ?auto_217841 ) ) ( not ( = ?auto_217835 ?auto_217842 ) ) ( not ( = ?auto_217835 ?auto_217843 ) ) ( not ( = ?auto_217835 ?auto_217844 ) ) ( not ( = ?auto_217836 ?auto_217837 ) ) ( not ( = ?auto_217836 ?auto_217838 ) ) ( not ( = ?auto_217836 ?auto_217839 ) ) ( not ( = ?auto_217836 ?auto_217840 ) ) ( not ( = ?auto_217836 ?auto_217841 ) ) ( not ( = ?auto_217836 ?auto_217842 ) ) ( not ( = ?auto_217836 ?auto_217843 ) ) ( not ( = ?auto_217836 ?auto_217844 ) ) ( not ( = ?auto_217837 ?auto_217838 ) ) ( not ( = ?auto_217837 ?auto_217839 ) ) ( not ( = ?auto_217837 ?auto_217840 ) ) ( not ( = ?auto_217837 ?auto_217841 ) ) ( not ( = ?auto_217837 ?auto_217842 ) ) ( not ( = ?auto_217837 ?auto_217843 ) ) ( not ( = ?auto_217837 ?auto_217844 ) ) ( not ( = ?auto_217838 ?auto_217839 ) ) ( not ( = ?auto_217838 ?auto_217840 ) ) ( not ( = ?auto_217838 ?auto_217841 ) ) ( not ( = ?auto_217838 ?auto_217842 ) ) ( not ( = ?auto_217838 ?auto_217843 ) ) ( not ( = ?auto_217838 ?auto_217844 ) ) ( not ( = ?auto_217839 ?auto_217840 ) ) ( not ( = ?auto_217839 ?auto_217841 ) ) ( not ( = ?auto_217839 ?auto_217842 ) ) ( not ( = ?auto_217839 ?auto_217843 ) ) ( not ( = ?auto_217839 ?auto_217844 ) ) ( not ( = ?auto_217840 ?auto_217841 ) ) ( not ( = ?auto_217840 ?auto_217842 ) ) ( not ( = ?auto_217840 ?auto_217843 ) ) ( not ( = ?auto_217840 ?auto_217844 ) ) ( not ( = ?auto_217841 ?auto_217842 ) ) ( not ( = ?auto_217841 ?auto_217843 ) ) ( not ( = ?auto_217841 ?auto_217844 ) ) ( not ( = ?auto_217842 ?auto_217843 ) ) ( not ( = ?auto_217842 ?auto_217844 ) ) ( not ( = ?auto_217843 ?auto_217844 ) ) ( ON ?auto_217842 ?auto_217843 ) ( ON ?auto_217841 ?auto_217842 ) ( ON ?auto_217840 ?auto_217841 ) ( ON ?auto_217839 ?auto_217840 ) ( ON ?auto_217838 ?auto_217839 ) ( CLEAR ?auto_217836 ) ( ON ?auto_217837 ?auto_217838 ) ( CLEAR ?auto_217837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217833 ?auto_217834 ?auto_217835 ?auto_217836 ?auto_217837 )
      ( MAKE-11PILE ?auto_217833 ?auto_217834 ?auto_217835 ?auto_217836 ?auto_217837 ?auto_217838 ?auto_217839 ?auto_217840 ?auto_217841 ?auto_217842 ?auto_217843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217856 - BLOCK
      ?auto_217857 - BLOCK
      ?auto_217858 - BLOCK
      ?auto_217859 - BLOCK
      ?auto_217860 - BLOCK
      ?auto_217861 - BLOCK
      ?auto_217862 - BLOCK
      ?auto_217863 - BLOCK
      ?auto_217864 - BLOCK
      ?auto_217865 - BLOCK
      ?auto_217866 - BLOCK
    )
    :vars
    (
      ?auto_217867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217866 ?auto_217867 ) ( ON-TABLE ?auto_217856 ) ( ON ?auto_217857 ?auto_217856 ) ( ON ?auto_217858 ?auto_217857 ) ( ON ?auto_217859 ?auto_217858 ) ( not ( = ?auto_217856 ?auto_217857 ) ) ( not ( = ?auto_217856 ?auto_217858 ) ) ( not ( = ?auto_217856 ?auto_217859 ) ) ( not ( = ?auto_217856 ?auto_217860 ) ) ( not ( = ?auto_217856 ?auto_217861 ) ) ( not ( = ?auto_217856 ?auto_217862 ) ) ( not ( = ?auto_217856 ?auto_217863 ) ) ( not ( = ?auto_217856 ?auto_217864 ) ) ( not ( = ?auto_217856 ?auto_217865 ) ) ( not ( = ?auto_217856 ?auto_217866 ) ) ( not ( = ?auto_217856 ?auto_217867 ) ) ( not ( = ?auto_217857 ?auto_217858 ) ) ( not ( = ?auto_217857 ?auto_217859 ) ) ( not ( = ?auto_217857 ?auto_217860 ) ) ( not ( = ?auto_217857 ?auto_217861 ) ) ( not ( = ?auto_217857 ?auto_217862 ) ) ( not ( = ?auto_217857 ?auto_217863 ) ) ( not ( = ?auto_217857 ?auto_217864 ) ) ( not ( = ?auto_217857 ?auto_217865 ) ) ( not ( = ?auto_217857 ?auto_217866 ) ) ( not ( = ?auto_217857 ?auto_217867 ) ) ( not ( = ?auto_217858 ?auto_217859 ) ) ( not ( = ?auto_217858 ?auto_217860 ) ) ( not ( = ?auto_217858 ?auto_217861 ) ) ( not ( = ?auto_217858 ?auto_217862 ) ) ( not ( = ?auto_217858 ?auto_217863 ) ) ( not ( = ?auto_217858 ?auto_217864 ) ) ( not ( = ?auto_217858 ?auto_217865 ) ) ( not ( = ?auto_217858 ?auto_217866 ) ) ( not ( = ?auto_217858 ?auto_217867 ) ) ( not ( = ?auto_217859 ?auto_217860 ) ) ( not ( = ?auto_217859 ?auto_217861 ) ) ( not ( = ?auto_217859 ?auto_217862 ) ) ( not ( = ?auto_217859 ?auto_217863 ) ) ( not ( = ?auto_217859 ?auto_217864 ) ) ( not ( = ?auto_217859 ?auto_217865 ) ) ( not ( = ?auto_217859 ?auto_217866 ) ) ( not ( = ?auto_217859 ?auto_217867 ) ) ( not ( = ?auto_217860 ?auto_217861 ) ) ( not ( = ?auto_217860 ?auto_217862 ) ) ( not ( = ?auto_217860 ?auto_217863 ) ) ( not ( = ?auto_217860 ?auto_217864 ) ) ( not ( = ?auto_217860 ?auto_217865 ) ) ( not ( = ?auto_217860 ?auto_217866 ) ) ( not ( = ?auto_217860 ?auto_217867 ) ) ( not ( = ?auto_217861 ?auto_217862 ) ) ( not ( = ?auto_217861 ?auto_217863 ) ) ( not ( = ?auto_217861 ?auto_217864 ) ) ( not ( = ?auto_217861 ?auto_217865 ) ) ( not ( = ?auto_217861 ?auto_217866 ) ) ( not ( = ?auto_217861 ?auto_217867 ) ) ( not ( = ?auto_217862 ?auto_217863 ) ) ( not ( = ?auto_217862 ?auto_217864 ) ) ( not ( = ?auto_217862 ?auto_217865 ) ) ( not ( = ?auto_217862 ?auto_217866 ) ) ( not ( = ?auto_217862 ?auto_217867 ) ) ( not ( = ?auto_217863 ?auto_217864 ) ) ( not ( = ?auto_217863 ?auto_217865 ) ) ( not ( = ?auto_217863 ?auto_217866 ) ) ( not ( = ?auto_217863 ?auto_217867 ) ) ( not ( = ?auto_217864 ?auto_217865 ) ) ( not ( = ?auto_217864 ?auto_217866 ) ) ( not ( = ?auto_217864 ?auto_217867 ) ) ( not ( = ?auto_217865 ?auto_217866 ) ) ( not ( = ?auto_217865 ?auto_217867 ) ) ( not ( = ?auto_217866 ?auto_217867 ) ) ( ON ?auto_217865 ?auto_217866 ) ( ON ?auto_217864 ?auto_217865 ) ( ON ?auto_217863 ?auto_217864 ) ( ON ?auto_217862 ?auto_217863 ) ( ON ?auto_217861 ?auto_217862 ) ( CLEAR ?auto_217859 ) ( ON ?auto_217860 ?auto_217861 ) ( CLEAR ?auto_217860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_217856 ?auto_217857 ?auto_217858 ?auto_217859 ?auto_217860 )
      ( MAKE-11PILE ?auto_217856 ?auto_217857 ?auto_217858 ?auto_217859 ?auto_217860 ?auto_217861 ?auto_217862 ?auto_217863 ?auto_217864 ?auto_217865 ?auto_217866 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217879 - BLOCK
      ?auto_217880 - BLOCK
      ?auto_217881 - BLOCK
      ?auto_217882 - BLOCK
      ?auto_217883 - BLOCK
      ?auto_217884 - BLOCK
      ?auto_217885 - BLOCK
      ?auto_217886 - BLOCK
      ?auto_217887 - BLOCK
      ?auto_217888 - BLOCK
      ?auto_217889 - BLOCK
    )
    :vars
    (
      ?auto_217890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217889 ?auto_217890 ) ( ON-TABLE ?auto_217879 ) ( ON ?auto_217880 ?auto_217879 ) ( ON ?auto_217881 ?auto_217880 ) ( not ( = ?auto_217879 ?auto_217880 ) ) ( not ( = ?auto_217879 ?auto_217881 ) ) ( not ( = ?auto_217879 ?auto_217882 ) ) ( not ( = ?auto_217879 ?auto_217883 ) ) ( not ( = ?auto_217879 ?auto_217884 ) ) ( not ( = ?auto_217879 ?auto_217885 ) ) ( not ( = ?auto_217879 ?auto_217886 ) ) ( not ( = ?auto_217879 ?auto_217887 ) ) ( not ( = ?auto_217879 ?auto_217888 ) ) ( not ( = ?auto_217879 ?auto_217889 ) ) ( not ( = ?auto_217879 ?auto_217890 ) ) ( not ( = ?auto_217880 ?auto_217881 ) ) ( not ( = ?auto_217880 ?auto_217882 ) ) ( not ( = ?auto_217880 ?auto_217883 ) ) ( not ( = ?auto_217880 ?auto_217884 ) ) ( not ( = ?auto_217880 ?auto_217885 ) ) ( not ( = ?auto_217880 ?auto_217886 ) ) ( not ( = ?auto_217880 ?auto_217887 ) ) ( not ( = ?auto_217880 ?auto_217888 ) ) ( not ( = ?auto_217880 ?auto_217889 ) ) ( not ( = ?auto_217880 ?auto_217890 ) ) ( not ( = ?auto_217881 ?auto_217882 ) ) ( not ( = ?auto_217881 ?auto_217883 ) ) ( not ( = ?auto_217881 ?auto_217884 ) ) ( not ( = ?auto_217881 ?auto_217885 ) ) ( not ( = ?auto_217881 ?auto_217886 ) ) ( not ( = ?auto_217881 ?auto_217887 ) ) ( not ( = ?auto_217881 ?auto_217888 ) ) ( not ( = ?auto_217881 ?auto_217889 ) ) ( not ( = ?auto_217881 ?auto_217890 ) ) ( not ( = ?auto_217882 ?auto_217883 ) ) ( not ( = ?auto_217882 ?auto_217884 ) ) ( not ( = ?auto_217882 ?auto_217885 ) ) ( not ( = ?auto_217882 ?auto_217886 ) ) ( not ( = ?auto_217882 ?auto_217887 ) ) ( not ( = ?auto_217882 ?auto_217888 ) ) ( not ( = ?auto_217882 ?auto_217889 ) ) ( not ( = ?auto_217882 ?auto_217890 ) ) ( not ( = ?auto_217883 ?auto_217884 ) ) ( not ( = ?auto_217883 ?auto_217885 ) ) ( not ( = ?auto_217883 ?auto_217886 ) ) ( not ( = ?auto_217883 ?auto_217887 ) ) ( not ( = ?auto_217883 ?auto_217888 ) ) ( not ( = ?auto_217883 ?auto_217889 ) ) ( not ( = ?auto_217883 ?auto_217890 ) ) ( not ( = ?auto_217884 ?auto_217885 ) ) ( not ( = ?auto_217884 ?auto_217886 ) ) ( not ( = ?auto_217884 ?auto_217887 ) ) ( not ( = ?auto_217884 ?auto_217888 ) ) ( not ( = ?auto_217884 ?auto_217889 ) ) ( not ( = ?auto_217884 ?auto_217890 ) ) ( not ( = ?auto_217885 ?auto_217886 ) ) ( not ( = ?auto_217885 ?auto_217887 ) ) ( not ( = ?auto_217885 ?auto_217888 ) ) ( not ( = ?auto_217885 ?auto_217889 ) ) ( not ( = ?auto_217885 ?auto_217890 ) ) ( not ( = ?auto_217886 ?auto_217887 ) ) ( not ( = ?auto_217886 ?auto_217888 ) ) ( not ( = ?auto_217886 ?auto_217889 ) ) ( not ( = ?auto_217886 ?auto_217890 ) ) ( not ( = ?auto_217887 ?auto_217888 ) ) ( not ( = ?auto_217887 ?auto_217889 ) ) ( not ( = ?auto_217887 ?auto_217890 ) ) ( not ( = ?auto_217888 ?auto_217889 ) ) ( not ( = ?auto_217888 ?auto_217890 ) ) ( not ( = ?auto_217889 ?auto_217890 ) ) ( ON ?auto_217888 ?auto_217889 ) ( ON ?auto_217887 ?auto_217888 ) ( ON ?auto_217886 ?auto_217887 ) ( ON ?auto_217885 ?auto_217886 ) ( ON ?auto_217884 ?auto_217885 ) ( ON ?auto_217883 ?auto_217884 ) ( CLEAR ?auto_217881 ) ( ON ?auto_217882 ?auto_217883 ) ( CLEAR ?auto_217882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217879 ?auto_217880 ?auto_217881 ?auto_217882 )
      ( MAKE-11PILE ?auto_217879 ?auto_217880 ?auto_217881 ?auto_217882 ?auto_217883 ?auto_217884 ?auto_217885 ?auto_217886 ?auto_217887 ?auto_217888 ?auto_217889 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217902 - BLOCK
      ?auto_217903 - BLOCK
      ?auto_217904 - BLOCK
      ?auto_217905 - BLOCK
      ?auto_217906 - BLOCK
      ?auto_217907 - BLOCK
      ?auto_217908 - BLOCK
      ?auto_217909 - BLOCK
      ?auto_217910 - BLOCK
      ?auto_217911 - BLOCK
      ?auto_217912 - BLOCK
    )
    :vars
    (
      ?auto_217913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217912 ?auto_217913 ) ( ON-TABLE ?auto_217902 ) ( ON ?auto_217903 ?auto_217902 ) ( ON ?auto_217904 ?auto_217903 ) ( not ( = ?auto_217902 ?auto_217903 ) ) ( not ( = ?auto_217902 ?auto_217904 ) ) ( not ( = ?auto_217902 ?auto_217905 ) ) ( not ( = ?auto_217902 ?auto_217906 ) ) ( not ( = ?auto_217902 ?auto_217907 ) ) ( not ( = ?auto_217902 ?auto_217908 ) ) ( not ( = ?auto_217902 ?auto_217909 ) ) ( not ( = ?auto_217902 ?auto_217910 ) ) ( not ( = ?auto_217902 ?auto_217911 ) ) ( not ( = ?auto_217902 ?auto_217912 ) ) ( not ( = ?auto_217902 ?auto_217913 ) ) ( not ( = ?auto_217903 ?auto_217904 ) ) ( not ( = ?auto_217903 ?auto_217905 ) ) ( not ( = ?auto_217903 ?auto_217906 ) ) ( not ( = ?auto_217903 ?auto_217907 ) ) ( not ( = ?auto_217903 ?auto_217908 ) ) ( not ( = ?auto_217903 ?auto_217909 ) ) ( not ( = ?auto_217903 ?auto_217910 ) ) ( not ( = ?auto_217903 ?auto_217911 ) ) ( not ( = ?auto_217903 ?auto_217912 ) ) ( not ( = ?auto_217903 ?auto_217913 ) ) ( not ( = ?auto_217904 ?auto_217905 ) ) ( not ( = ?auto_217904 ?auto_217906 ) ) ( not ( = ?auto_217904 ?auto_217907 ) ) ( not ( = ?auto_217904 ?auto_217908 ) ) ( not ( = ?auto_217904 ?auto_217909 ) ) ( not ( = ?auto_217904 ?auto_217910 ) ) ( not ( = ?auto_217904 ?auto_217911 ) ) ( not ( = ?auto_217904 ?auto_217912 ) ) ( not ( = ?auto_217904 ?auto_217913 ) ) ( not ( = ?auto_217905 ?auto_217906 ) ) ( not ( = ?auto_217905 ?auto_217907 ) ) ( not ( = ?auto_217905 ?auto_217908 ) ) ( not ( = ?auto_217905 ?auto_217909 ) ) ( not ( = ?auto_217905 ?auto_217910 ) ) ( not ( = ?auto_217905 ?auto_217911 ) ) ( not ( = ?auto_217905 ?auto_217912 ) ) ( not ( = ?auto_217905 ?auto_217913 ) ) ( not ( = ?auto_217906 ?auto_217907 ) ) ( not ( = ?auto_217906 ?auto_217908 ) ) ( not ( = ?auto_217906 ?auto_217909 ) ) ( not ( = ?auto_217906 ?auto_217910 ) ) ( not ( = ?auto_217906 ?auto_217911 ) ) ( not ( = ?auto_217906 ?auto_217912 ) ) ( not ( = ?auto_217906 ?auto_217913 ) ) ( not ( = ?auto_217907 ?auto_217908 ) ) ( not ( = ?auto_217907 ?auto_217909 ) ) ( not ( = ?auto_217907 ?auto_217910 ) ) ( not ( = ?auto_217907 ?auto_217911 ) ) ( not ( = ?auto_217907 ?auto_217912 ) ) ( not ( = ?auto_217907 ?auto_217913 ) ) ( not ( = ?auto_217908 ?auto_217909 ) ) ( not ( = ?auto_217908 ?auto_217910 ) ) ( not ( = ?auto_217908 ?auto_217911 ) ) ( not ( = ?auto_217908 ?auto_217912 ) ) ( not ( = ?auto_217908 ?auto_217913 ) ) ( not ( = ?auto_217909 ?auto_217910 ) ) ( not ( = ?auto_217909 ?auto_217911 ) ) ( not ( = ?auto_217909 ?auto_217912 ) ) ( not ( = ?auto_217909 ?auto_217913 ) ) ( not ( = ?auto_217910 ?auto_217911 ) ) ( not ( = ?auto_217910 ?auto_217912 ) ) ( not ( = ?auto_217910 ?auto_217913 ) ) ( not ( = ?auto_217911 ?auto_217912 ) ) ( not ( = ?auto_217911 ?auto_217913 ) ) ( not ( = ?auto_217912 ?auto_217913 ) ) ( ON ?auto_217911 ?auto_217912 ) ( ON ?auto_217910 ?auto_217911 ) ( ON ?auto_217909 ?auto_217910 ) ( ON ?auto_217908 ?auto_217909 ) ( ON ?auto_217907 ?auto_217908 ) ( ON ?auto_217906 ?auto_217907 ) ( CLEAR ?auto_217904 ) ( ON ?auto_217905 ?auto_217906 ) ( CLEAR ?auto_217905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_217902 ?auto_217903 ?auto_217904 ?auto_217905 )
      ( MAKE-11PILE ?auto_217902 ?auto_217903 ?auto_217904 ?auto_217905 ?auto_217906 ?auto_217907 ?auto_217908 ?auto_217909 ?auto_217910 ?auto_217911 ?auto_217912 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217925 - BLOCK
      ?auto_217926 - BLOCK
      ?auto_217927 - BLOCK
      ?auto_217928 - BLOCK
      ?auto_217929 - BLOCK
      ?auto_217930 - BLOCK
      ?auto_217931 - BLOCK
      ?auto_217932 - BLOCK
      ?auto_217933 - BLOCK
      ?auto_217934 - BLOCK
      ?auto_217935 - BLOCK
    )
    :vars
    (
      ?auto_217936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217935 ?auto_217936 ) ( ON-TABLE ?auto_217925 ) ( ON ?auto_217926 ?auto_217925 ) ( not ( = ?auto_217925 ?auto_217926 ) ) ( not ( = ?auto_217925 ?auto_217927 ) ) ( not ( = ?auto_217925 ?auto_217928 ) ) ( not ( = ?auto_217925 ?auto_217929 ) ) ( not ( = ?auto_217925 ?auto_217930 ) ) ( not ( = ?auto_217925 ?auto_217931 ) ) ( not ( = ?auto_217925 ?auto_217932 ) ) ( not ( = ?auto_217925 ?auto_217933 ) ) ( not ( = ?auto_217925 ?auto_217934 ) ) ( not ( = ?auto_217925 ?auto_217935 ) ) ( not ( = ?auto_217925 ?auto_217936 ) ) ( not ( = ?auto_217926 ?auto_217927 ) ) ( not ( = ?auto_217926 ?auto_217928 ) ) ( not ( = ?auto_217926 ?auto_217929 ) ) ( not ( = ?auto_217926 ?auto_217930 ) ) ( not ( = ?auto_217926 ?auto_217931 ) ) ( not ( = ?auto_217926 ?auto_217932 ) ) ( not ( = ?auto_217926 ?auto_217933 ) ) ( not ( = ?auto_217926 ?auto_217934 ) ) ( not ( = ?auto_217926 ?auto_217935 ) ) ( not ( = ?auto_217926 ?auto_217936 ) ) ( not ( = ?auto_217927 ?auto_217928 ) ) ( not ( = ?auto_217927 ?auto_217929 ) ) ( not ( = ?auto_217927 ?auto_217930 ) ) ( not ( = ?auto_217927 ?auto_217931 ) ) ( not ( = ?auto_217927 ?auto_217932 ) ) ( not ( = ?auto_217927 ?auto_217933 ) ) ( not ( = ?auto_217927 ?auto_217934 ) ) ( not ( = ?auto_217927 ?auto_217935 ) ) ( not ( = ?auto_217927 ?auto_217936 ) ) ( not ( = ?auto_217928 ?auto_217929 ) ) ( not ( = ?auto_217928 ?auto_217930 ) ) ( not ( = ?auto_217928 ?auto_217931 ) ) ( not ( = ?auto_217928 ?auto_217932 ) ) ( not ( = ?auto_217928 ?auto_217933 ) ) ( not ( = ?auto_217928 ?auto_217934 ) ) ( not ( = ?auto_217928 ?auto_217935 ) ) ( not ( = ?auto_217928 ?auto_217936 ) ) ( not ( = ?auto_217929 ?auto_217930 ) ) ( not ( = ?auto_217929 ?auto_217931 ) ) ( not ( = ?auto_217929 ?auto_217932 ) ) ( not ( = ?auto_217929 ?auto_217933 ) ) ( not ( = ?auto_217929 ?auto_217934 ) ) ( not ( = ?auto_217929 ?auto_217935 ) ) ( not ( = ?auto_217929 ?auto_217936 ) ) ( not ( = ?auto_217930 ?auto_217931 ) ) ( not ( = ?auto_217930 ?auto_217932 ) ) ( not ( = ?auto_217930 ?auto_217933 ) ) ( not ( = ?auto_217930 ?auto_217934 ) ) ( not ( = ?auto_217930 ?auto_217935 ) ) ( not ( = ?auto_217930 ?auto_217936 ) ) ( not ( = ?auto_217931 ?auto_217932 ) ) ( not ( = ?auto_217931 ?auto_217933 ) ) ( not ( = ?auto_217931 ?auto_217934 ) ) ( not ( = ?auto_217931 ?auto_217935 ) ) ( not ( = ?auto_217931 ?auto_217936 ) ) ( not ( = ?auto_217932 ?auto_217933 ) ) ( not ( = ?auto_217932 ?auto_217934 ) ) ( not ( = ?auto_217932 ?auto_217935 ) ) ( not ( = ?auto_217932 ?auto_217936 ) ) ( not ( = ?auto_217933 ?auto_217934 ) ) ( not ( = ?auto_217933 ?auto_217935 ) ) ( not ( = ?auto_217933 ?auto_217936 ) ) ( not ( = ?auto_217934 ?auto_217935 ) ) ( not ( = ?auto_217934 ?auto_217936 ) ) ( not ( = ?auto_217935 ?auto_217936 ) ) ( ON ?auto_217934 ?auto_217935 ) ( ON ?auto_217933 ?auto_217934 ) ( ON ?auto_217932 ?auto_217933 ) ( ON ?auto_217931 ?auto_217932 ) ( ON ?auto_217930 ?auto_217931 ) ( ON ?auto_217929 ?auto_217930 ) ( ON ?auto_217928 ?auto_217929 ) ( CLEAR ?auto_217926 ) ( ON ?auto_217927 ?auto_217928 ) ( CLEAR ?auto_217927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217925 ?auto_217926 ?auto_217927 )
      ( MAKE-11PILE ?auto_217925 ?auto_217926 ?auto_217927 ?auto_217928 ?auto_217929 ?auto_217930 ?auto_217931 ?auto_217932 ?auto_217933 ?auto_217934 ?auto_217935 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217948 - BLOCK
      ?auto_217949 - BLOCK
      ?auto_217950 - BLOCK
      ?auto_217951 - BLOCK
      ?auto_217952 - BLOCK
      ?auto_217953 - BLOCK
      ?auto_217954 - BLOCK
      ?auto_217955 - BLOCK
      ?auto_217956 - BLOCK
      ?auto_217957 - BLOCK
      ?auto_217958 - BLOCK
    )
    :vars
    (
      ?auto_217959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217958 ?auto_217959 ) ( ON-TABLE ?auto_217948 ) ( ON ?auto_217949 ?auto_217948 ) ( not ( = ?auto_217948 ?auto_217949 ) ) ( not ( = ?auto_217948 ?auto_217950 ) ) ( not ( = ?auto_217948 ?auto_217951 ) ) ( not ( = ?auto_217948 ?auto_217952 ) ) ( not ( = ?auto_217948 ?auto_217953 ) ) ( not ( = ?auto_217948 ?auto_217954 ) ) ( not ( = ?auto_217948 ?auto_217955 ) ) ( not ( = ?auto_217948 ?auto_217956 ) ) ( not ( = ?auto_217948 ?auto_217957 ) ) ( not ( = ?auto_217948 ?auto_217958 ) ) ( not ( = ?auto_217948 ?auto_217959 ) ) ( not ( = ?auto_217949 ?auto_217950 ) ) ( not ( = ?auto_217949 ?auto_217951 ) ) ( not ( = ?auto_217949 ?auto_217952 ) ) ( not ( = ?auto_217949 ?auto_217953 ) ) ( not ( = ?auto_217949 ?auto_217954 ) ) ( not ( = ?auto_217949 ?auto_217955 ) ) ( not ( = ?auto_217949 ?auto_217956 ) ) ( not ( = ?auto_217949 ?auto_217957 ) ) ( not ( = ?auto_217949 ?auto_217958 ) ) ( not ( = ?auto_217949 ?auto_217959 ) ) ( not ( = ?auto_217950 ?auto_217951 ) ) ( not ( = ?auto_217950 ?auto_217952 ) ) ( not ( = ?auto_217950 ?auto_217953 ) ) ( not ( = ?auto_217950 ?auto_217954 ) ) ( not ( = ?auto_217950 ?auto_217955 ) ) ( not ( = ?auto_217950 ?auto_217956 ) ) ( not ( = ?auto_217950 ?auto_217957 ) ) ( not ( = ?auto_217950 ?auto_217958 ) ) ( not ( = ?auto_217950 ?auto_217959 ) ) ( not ( = ?auto_217951 ?auto_217952 ) ) ( not ( = ?auto_217951 ?auto_217953 ) ) ( not ( = ?auto_217951 ?auto_217954 ) ) ( not ( = ?auto_217951 ?auto_217955 ) ) ( not ( = ?auto_217951 ?auto_217956 ) ) ( not ( = ?auto_217951 ?auto_217957 ) ) ( not ( = ?auto_217951 ?auto_217958 ) ) ( not ( = ?auto_217951 ?auto_217959 ) ) ( not ( = ?auto_217952 ?auto_217953 ) ) ( not ( = ?auto_217952 ?auto_217954 ) ) ( not ( = ?auto_217952 ?auto_217955 ) ) ( not ( = ?auto_217952 ?auto_217956 ) ) ( not ( = ?auto_217952 ?auto_217957 ) ) ( not ( = ?auto_217952 ?auto_217958 ) ) ( not ( = ?auto_217952 ?auto_217959 ) ) ( not ( = ?auto_217953 ?auto_217954 ) ) ( not ( = ?auto_217953 ?auto_217955 ) ) ( not ( = ?auto_217953 ?auto_217956 ) ) ( not ( = ?auto_217953 ?auto_217957 ) ) ( not ( = ?auto_217953 ?auto_217958 ) ) ( not ( = ?auto_217953 ?auto_217959 ) ) ( not ( = ?auto_217954 ?auto_217955 ) ) ( not ( = ?auto_217954 ?auto_217956 ) ) ( not ( = ?auto_217954 ?auto_217957 ) ) ( not ( = ?auto_217954 ?auto_217958 ) ) ( not ( = ?auto_217954 ?auto_217959 ) ) ( not ( = ?auto_217955 ?auto_217956 ) ) ( not ( = ?auto_217955 ?auto_217957 ) ) ( not ( = ?auto_217955 ?auto_217958 ) ) ( not ( = ?auto_217955 ?auto_217959 ) ) ( not ( = ?auto_217956 ?auto_217957 ) ) ( not ( = ?auto_217956 ?auto_217958 ) ) ( not ( = ?auto_217956 ?auto_217959 ) ) ( not ( = ?auto_217957 ?auto_217958 ) ) ( not ( = ?auto_217957 ?auto_217959 ) ) ( not ( = ?auto_217958 ?auto_217959 ) ) ( ON ?auto_217957 ?auto_217958 ) ( ON ?auto_217956 ?auto_217957 ) ( ON ?auto_217955 ?auto_217956 ) ( ON ?auto_217954 ?auto_217955 ) ( ON ?auto_217953 ?auto_217954 ) ( ON ?auto_217952 ?auto_217953 ) ( ON ?auto_217951 ?auto_217952 ) ( CLEAR ?auto_217949 ) ( ON ?auto_217950 ?auto_217951 ) ( CLEAR ?auto_217950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_217948 ?auto_217949 ?auto_217950 )
      ( MAKE-11PILE ?auto_217948 ?auto_217949 ?auto_217950 ?auto_217951 ?auto_217952 ?auto_217953 ?auto_217954 ?auto_217955 ?auto_217956 ?auto_217957 ?auto_217958 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217971 - BLOCK
      ?auto_217972 - BLOCK
      ?auto_217973 - BLOCK
      ?auto_217974 - BLOCK
      ?auto_217975 - BLOCK
      ?auto_217976 - BLOCK
      ?auto_217977 - BLOCK
      ?auto_217978 - BLOCK
      ?auto_217979 - BLOCK
      ?auto_217980 - BLOCK
      ?auto_217981 - BLOCK
    )
    :vars
    (
      ?auto_217982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_217981 ?auto_217982 ) ( ON-TABLE ?auto_217971 ) ( not ( = ?auto_217971 ?auto_217972 ) ) ( not ( = ?auto_217971 ?auto_217973 ) ) ( not ( = ?auto_217971 ?auto_217974 ) ) ( not ( = ?auto_217971 ?auto_217975 ) ) ( not ( = ?auto_217971 ?auto_217976 ) ) ( not ( = ?auto_217971 ?auto_217977 ) ) ( not ( = ?auto_217971 ?auto_217978 ) ) ( not ( = ?auto_217971 ?auto_217979 ) ) ( not ( = ?auto_217971 ?auto_217980 ) ) ( not ( = ?auto_217971 ?auto_217981 ) ) ( not ( = ?auto_217971 ?auto_217982 ) ) ( not ( = ?auto_217972 ?auto_217973 ) ) ( not ( = ?auto_217972 ?auto_217974 ) ) ( not ( = ?auto_217972 ?auto_217975 ) ) ( not ( = ?auto_217972 ?auto_217976 ) ) ( not ( = ?auto_217972 ?auto_217977 ) ) ( not ( = ?auto_217972 ?auto_217978 ) ) ( not ( = ?auto_217972 ?auto_217979 ) ) ( not ( = ?auto_217972 ?auto_217980 ) ) ( not ( = ?auto_217972 ?auto_217981 ) ) ( not ( = ?auto_217972 ?auto_217982 ) ) ( not ( = ?auto_217973 ?auto_217974 ) ) ( not ( = ?auto_217973 ?auto_217975 ) ) ( not ( = ?auto_217973 ?auto_217976 ) ) ( not ( = ?auto_217973 ?auto_217977 ) ) ( not ( = ?auto_217973 ?auto_217978 ) ) ( not ( = ?auto_217973 ?auto_217979 ) ) ( not ( = ?auto_217973 ?auto_217980 ) ) ( not ( = ?auto_217973 ?auto_217981 ) ) ( not ( = ?auto_217973 ?auto_217982 ) ) ( not ( = ?auto_217974 ?auto_217975 ) ) ( not ( = ?auto_217974 ?auto_217976 ) ) ( not ( = ?auto_217974 ?auto_217977 ) ) ( not ( = ?auto_217974 ?auto_217978 ) ) ( not ( = ?auto_217974 ?auto_217979 ) ) ( not ( = ?auto_217974 ?auto_217980 ) ) ( not ( = ?auto_217974 ?auto_217981 ) ) ( not ( = ?auto_217974 ?auto_217982 ) ) ( not ( = ?auto_217975 ?auto_217976 ) ) ( not ( = ?auto_217975 ?auto_217977 ) ) ( not ( = ?auto_217975 ?auto_217978 ) ) ( not ( = ?auto_217975 ?auto_217979 ) ) ( not ( = ?auto_217975 ?auto_217980 ) ) ( not ( = ?auto_217975 ?auto_217981 ) ) ( not ( = ?auto_217975 ?auto_217982 ) ) ( not ( = ?auto_217976 ?auto_217977 ) ) ( not ( = ?auto_217976 ?auto_217978 ) ) ( not ( = ?auto_217976 ?auto_217979 ) ) ( not ( = ?auto_217976 ?auto_217980 ) ) ( not ( = ?auto_217976 ?auto_217981 ) ) ( not ( = ?auto_217976 ?auto_217982 ) ) ( not ( = ?auto_217977 ?auto_217978 ) ) ( not ( = ?auto_217977 ?auto_217979 ) ) ( not ( = ?auto_217977 ?auto_217980 ) ) ( not ( = ?auto_217977 ?auto_217981 ) ) ( not ( = ?auto_217977 ?auto_217982 ) ) ( not ( = ?auto_217978 ?auto_217979 ) ) ( not ( = ?auto_217978 ?auto_217980 ) ) ( not ( = ?auto_217978 ?auto_217981 ) ) ( not ( = ?auto_217978 ?auto_217982 ) ) ( not ( = ?auto_217979 ?auto_217980 ) ) ( not ( = ?auto_217979 ?auto_217981 ) ) ( not ( = ?auto_217979 ?auto_217982 ) ) ( not ( = ?auto_217980 ?auto_217981 ) ) ( not ( = ?auto_217980 ?auto_217982 ) ) ( not ( = ?auto_217981 ?auto_217982 ) ) ( ON ?auto_217980 ?auto_217981 ) ( ON ?auto_217979 ?auto_217980 ) ( ON ?auto_217978 ?auto_217979 ) ( ON ?auto_217977 ?auto_217978 ) ( ON ?auto_217976 ?auto_217977 ) ( ON ?auto_217975 ?auto_217976 ) ( ON ?auto_217974 ?auto_217975 ) ( ON ?auto_217973 ?auto_217974 ) ( CLEAR ?auto_217971 ) ( ON ?auto_217972 ?auto_217973 ) ( CLEAR ?auto_217972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217971 ?auto_217972 )
      ( MAKE-11PILE ?auto_217971 ?auto_217972 ?auto_217973 ?auto_217974 ?auto_217975 ?auto_217976 ?auto_217977 ?auto_217978 ?auto_217979 ?auto_217980 ?auto_217981 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_217994 - BLOCK
      ?auto_217995 - BLOCK
      ?auto_217996 - BLOCK
      ?auto_217997 - BLOCK
      ?auto_217998 - BLOCK
      ?auto_217999 - BLOCK
      ?auto_218000 - BLOCK
      ?auto_218001 - BLOCK
      ?auto_218002 - BLOCK
      ?auto_218003 - BLOCK
      ?auto_218004 - BLOCK
    )
    :vars
    (
      ?auto_218005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218004 ?auto_218005 ) ( ON-TABLE ?auto_217994 ) ( not ( = ?auto_217994 ?auto_217995 ) ) ( not ( = ?auto_217994 ?auto_217996 ) ) ( not ( = ?auto_217994 ?auto_217997 ) ) ( not ( = ?auto_217994 ?auto_217998 ) ) ( not ( = ?auto_217994 ?auto_217999 ) ) ( not ( = ?auto_217994 ?auto_218000 ) ) ( not ( = ?auto_217994 ?auto_218001 ) ) ( not ( = ?auto_217994 ?auto_218002 ) ) ( not ( = ?auto_217994 ?auto_218003 ) ) ( not ( = ?auto_217994 ?auto_218004 ) ) ( not ( = ?auto_217994 ?auto_218005 ) ) ( not ( = ?auto_217995 ?auto_217996 ) ) ( not ( = ?auto_217995 ?auto_217997 ) ) ( not ( = ?auto_217995 ?auto_217998 ) ) ( not ( = ?auto_217995 ?auto_217999 ) ) ( not ( = ?auto_217995 ?auto_218000 ) ) ( not ( = ?auto_217995 ?auto_218001 ) ) ( not ( = ?auto_217995 ?auto_218002 ) ) ( not ( = ?auto_217995 ?auto_218003 ) ) ( not ( = ?auto_217995 ?auto_218004 ) ) ( not ( = ?auto_217995 ?auto_218005 ) ) ( not ( = ?auto_217996 ?auto_217997 ) ) ( not ( = ?auto_217996 ?auto_217998 ) ) ( not ( = ?auto_217996 ?auto_217999 ) ) ( not ( = ?auto_217996 ?auto_218000 ) ) ( not ( = ?auto_217996 ?auto_218001 ) ) ( not ( = ?auto_217996 ?auto_218002 ) ) ( not ( = ?auto_217996 ?auto_218003 ) ) ( not ( = ?auto_217996 ?auto_218004 ) ) ( not ( = ?auto_217996 ?auto_218005 ) ) ( not ( = ?auto_217997 ?auto_217998 ) ) ( not ( = ?auto_217997 ?auto_217999 ) ) ( not ( = ?auto_217997 ?auto_218000 ) ) ( not ( = ?auto_217997 ?auto_218001 ) ) ( not ( = ?auto_217997 ?auto_218002 ) ) ( not ( = ?auto_217997 ?auto_218003 ) ) ( not ( = ?auto_217997 ?auto_218004 ) ) ( not ( = ?auto_217997 ?auto_218005 ) ) ( not ( = ?auto_217998 ?auto_217999 ) ) ( not ( = ?auto_217998 ?auto_218000 ) ) ( not ( = ?auto_217998 ?auto_218001 ) ) ( not ( = ?auto_217998 ?auto_218002 ) ) ( not ( = ?auto_217998 ?auto_218003 ) ) ( not ( = ?auto_217998 ?auto_218004 ) ) ( not ( = ?auto_217998 ?auto_218005 ) ) ( not ( = ?auto_217999 ?auto_218000 ) ) ( not ( = ?auto_217999 ?auto_218001 ) ) ( not ( = ?auto_217999 ?auto_218002 ) ) ( not ( = ?auto_217999 ?auto_218003 ) ) ( not ( = ?auto_217999 ?auto_218004 ) ) ( not ( = ?auto_217999 ?auto_218005 ) ) ( not ( = ?auto_218000 ?auto_218001 ) ) ( not ( = ?auto_218000 ?auto_218002 ) ) ( not ( = ?auto_218000 ?auto_218003 ) ) ( not ( = ?auto_218000 ?auto_218004 ) ) ( not ( = ?auto_218000 ?auto_218005 ) ) ( not ( = ?auto_218001 ?auto_218002 ) ) ( not ( = ?auto_218001 ?auto_218003 ) ) ( not ( = ?auto_218001 ?auto_218004 ) ) ( not ( = ?auto_218001 ?auto_218005 ) ) ( not ( = ?auto_218002 ?auto_218003 ) ) ( not ( = ?auto_218002 ?auto_218004 ) ) ( not ( = ?auto_218002 ?auto_218005 ) ) ( not ( = ?auto_218003 ?auto_218004 ) ) ( not ( = ?auto_218003 ?auto_218005 ) ) ( not ( = ?auto_218004 ?auto_218005 ) ) ( ON ?auto_218003 ?auto_218004 ) ( ON ?auto_218002 ?auto_218003 ) ( ON ?auto_218001 ?auto_218002 ) ( ON ?auto_218000 ?auto_218001 ) ( ON ?auto_217999 ?auto_218000 ) ( ON ?auto_217998 ?auto_217999 ) ( ON ?auto_217997 ?auto_217998 ) ( ON ?auto_217996 ?auto_217997 ) ( CLEAR ?auto_217994 ) ( ON ?auto_217995 ?auto_217996 ) ( CLEAR ?auto_217995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_217994 ?auto_217995 )
      ( MAKE-11PILE ?auto_217994 ?auto_217995 ?auto_217996 ?auto_217997 ?auto_217998 ?auto_217999 ?auto_218000 ?auto_218001 ?auto_218002 ?auto_218003 ?auto_218004 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_218017 - BLOCK
      ?auto_218018 - BLOCK
      ?auto_218019 - BLOCK
      ?auto_218020 - BLOCK
      ?auto_218021 - BLOCK
      ?auto_218022 - BLOCK
      ?auto_218023 - BLOCK
      ?auto_218024 - BLOCK
      ?auto_218025 - BLOCK
      ?auto_218026 - BLOCK
      ?auto_218027 - BLOCK
    )
    :vars
    (
      ?auto_218028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218027 ?auto_218028 ) ( not ( = ?auto_218017 ?auto_218018 ) ) ( not ( = ?auto_218017 ?auto_218019 ) ) ( not ( = ?auto_218017 ?auto_218020 ) ) ( not ( = ?auto_218017 ?auto_218021 ) ) ( not ( = ?auto_218017 ?auto_218022 ) ) ( not ( = ?auto_218017 ?auto_218023 ) ) ( not ( = ?auto_218017 ?auto_218024 ) ) ( not ( = ?auto_218017 ?auto_218025 ) ) ( not ( = ?auto_218017 ?auto_218026 ) ) ( not ( = ?auto_218017 ?auto_218027 ) ) ( not ( = ?auto_218017 ?auto_218028 ) ) ( not ( = ?auto_218018 ?auto_218019 ) ) ( not ( = ?auto_218018 ?auto_218020 ) ) ( not ( = ?auto_218018 ?auto_218021 ) ) ( not ( = ?auto_218018 ?auto_218022 ) ) ( not ( = ?auto_218018 ?auto_218023 ) ) ( not ( = ?auto_218018 ?auto_218024 ) ) ( not ( = ?auto_218018 ?auto_218025 ) ) ( not ( = ?auto_218018 ?auto_218026 ) ) ( not ( = ?auto_218018 ?auto_218027 ) ) ( not ( = ?auto_218018 ?auto_218028 ) ) ( not ( = ?auto_218019 ?auto_218020 ) ) ( not ( = ?auto_218019 ?auto_218021 ) ) ( not ( = ?auto_218019 ?auto_218022 ) ) ( not ( = ?auto_218019 ?auto_218023 ) ) ( not ( = ?auto_218019 ?auto_218024 ) ) ( not ( = ?auto_218019 ?auto_218025 ) ) ( not ( = ?auto_218019 ?auto_218026 ) ) ( not ( = ?auto_218019 ?auto_218027 ) ) ( not ( = ?auto_218019 ?auto_218028 ) ) ( not ( = ?auto_218020 ?auto_218021 ) ) ( not ( = ?auto_218020 ?auto_218022 ) ) ( not ( = ?auto_218020 ?auto_218023 ) ) ( not ( = ?auto_218020 ?auto_218024 ) ) ( not ( = ?auto_218020 ?auto_218025 ) ) ( not ( = ?auto_218020 ?auto_218026 ) ) ( not ( = ?auto_218020 ?auto_218027 ) ) ( not ( = ?auto_218020 ?auto_218028 ) ) ( not ( = ?auto_218021 ?auto_218022 ) ) ( not ( = ?auto_218021 ?auto_218023 ) ) ( not ( = ?auto_218021 ?auto_218024 ) ) ( not ( = ?auto_218021 ?auto_218025 ) ) ( not ( = ?auto_218021 ?auto_218026 ) ) ( not ( = ?auto_218021 ?auto_218027 ) ) ( not ( = ?auto_218021 ?auto_218028 ) ) ( not ( = ?auto_218022 ?auto_218023 ) ) ( not ( = ?auto_218022 ?auto_218024 ) ) ( not ( = ?auto_218022 ?auto_218025 ) ) ( not ( = ?auto_218022 ?auto_218026 ) ) ( not ( = ?auto_218022 ?auto_218027 ) ) ( not ( = ?auto_218022 ?auto_218028 ) ) ( not ( = ?auto_218023 ?auto_218024 ) ) ( not ( = ?auto_218023 ?auto_218025 ) ) ( not ( = ?auto_218023 ?auto_218026 ) ) ( not ( = ?auto_218023 ?auto_218027 ) ) ( not ( = ?auto_218023 ?auto_218028 ) ) ( not ( = ?auto_218024 ?auto_218025 ) ) ( not ( = ?auto_218024 ?auto_218026 ) ) ( not ( = ?auto_218024 ?auto_218027 ) ) ( not ( = ?auto_218024 ?auto_218028 ) ) ( not ( = ?auto_218025 ?auto_218026 ) ) ( not ( = ?auto_218025 ?auto_218027 ) ) ( not ( = ?auto_218025 ?auto_218028 ) ) ( not ( = ?auto_218026 ?auto_218027 ) ) ( not ( = ?auto_218026 ?auto_218028 ) ) ( not ( = ?auto_218027 ?auto_218028 ) ) ( ON ?auto_218026 ?auto_218027 ) ( ON ?auto_218025 ?auto_218026 ) ( ON ?auto_218024 ?auto_218025 ) ( ON ?auto_218023 ?auto_218024 ) ( ON ?auto_218022 ?auto_218023 ) ( ON ?auto_218021 ?auto_218022 ) ( ON ?auto_218020 ?auto_218021 ) ( ON ?auto_218019 ?auto_218020 ) ( ON ?auto_218018 ?auto_218019 ) ( ON ?auto_218017 ?auto_218018 ) ( CLEAR ?auto_218017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_218017 )
      ( MAKE-11PILE ?auto_218017 ?auto_218018 ?auto_218019 ?auto_218020 ?auto_218021 ?auto_218022 ?auto_218023 ?auto_218024 ?auto_218025 ?auto_218026 ?auto_218027 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_218040 - BLOCK
      ?auto_218041 - BLOCK
      ?auto_218042 - BLOCK
      ?auto_218043 - BLOCK
      ?auto_218044 - BLOCK
      ?auto_218045 - BLOCK
      ?auto_218046 - BLOCK
      ?auto_218047 - BLOCK
      ?auto_218048 - BLOCK
      ?auto_218049 - BLOCK
      ?auto_218050 - BLOCK
    )
    :vars
    (
      ?auto_218051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218050 ?auto_218051 ) ( not ( = ?auto_218040 ?auto_218041 ) ) ( not ( = ?auto_218040 ?auto_218042 ) ) ( not ( = ?auto_218040 ?auto_218043 ) ) ( not ( = ?auto_218040 ?auto_218044 ) ) ( not ( = ?auto_218040 ?auto_218045 ) ) ( not ( = ?auto_218040 ?auto_218046 ) ) ( not ( = ?auto_218040 ?auto_218047 ) ) ( not ( = ?auto_218040 ?auto_218048 ) ) ( not ( = ?auto_218040 ?auto_218049 ) ) ( not ( = ?auto_218040 ?auto_218050 ) ) ( not ( = ?auto_218040 ?auto_218051 ) ) ( not ( = ?auto_218041 ?auto_218042 ) ) ( not ( = ?auto_218041 ?auto_218043 ) ) ( not ( = ?auto_218041 ?auto_218044 ) ) ( not ( = ?auto_218041 ?auto_218045 ) ) ( not ( = ?auto_218041 ?auto_218046 ) ) ( not ( = ?auto_218041 ?auto_218047 ) ) ( not ( = ?auto_218041 ?auto_218048 ) ) ( not ( = ?auto_218041 ?auto_218049 ) ) ( not ( = ?auto_218041 ?auto_218050 ) ) ( not ( = ?auto_218041 ?auto_218051 ) ) ( not ( = ?auto_218042 ?auto_218043 ) ) ( not ( = ?auto_218042 ?auto_218044 ) ) ( not ( = ?auto_218042 ?auto_218045 ) ) ( not ( = ?auto_218042 ?auto_218046 ) ) ( not ( = ?auto_218042 ?auto_218047 ) ) ( not ( = ?auto_218042 ?auto_218048 ) ) ( not ( = ?auto_218042 ?auto_218049 ) ) ( not ( = ?auto_218042 ?auto_218050 ) ) ( not ( = ?auto_218042 ?auto_218051 ) ) ( not ( = ?auto_218043 ?auto_218044 ) ) ( not ( = ?auto_218043 ?auto_218045 ) ) ( not ( = ?auto_218043 ?auto_218046 ) ) ( not ( = ?auto_218043 ?auto_218047 ) ) ( not ( = ?auto_218043 ?auto_218048 ) ) ( not ( = ?auto_218043 ?auto_218049 ) ) ( not ( = ?auto_218043 ?auto_218050 ) ) ( not ( = ?auto_218043 ?auto_218051 ) ) ( not ( = ?auto_218044 ?auto_218045 ) ) ( not ( = ?auto_218044 ?auto_218046 ) ) ( not ( = ?auto_218044 ?auto_218047 ) ) ( not ( = ?auto_218044 ?auto_218048 ) ) ( not ( = ?auto_218044 ?auto_218049 ) ) ( not ( = ?auto_218044 ?auto_218050 ) ) ( not ( = ?auto_218044 ?auto_218051 ) ) ( not ( = ?auto_218045 ?auto_218046 ) ) ( not ( = ?auto_218045 ?auto_218047 ) ) ( not ( = ?auto_218045 ?auto_218048 ) ) ( not ( = ?auto_218045 ?auto_218049 ) ) ( not ( = ?auto_218045 ?auto_218050 ) ) ( not ( = ?auto_218045 ?auto_218051 ) ) ( not ( = ?auto_218046 ?auto_218047 ) ) ( not ( = ?auto_218046 ?auto_218048 ) ) ( not ( = ?auto_218046 ?auto_218049 ) ) ( not ( = ?auto_218046 ?auto_218050 ) ) ( not ( = ?auto_218046 ?auto_218051 ) ) ( not ( = ?auto_218047 ?auto_218048 ) ) ( not ( = ?auto_218047 ?auto_218049 ) ) ( not ( = ?auto_218047 ?auto_218050 ) ) ( not ( = ?auto_218047 ?auto_218051 ) ) ( not ( = ?auto_218048 ?auto_218049 ) ) ( not ( = ?auto_218048 ?auto_218050 ) ) ( not ( = ?auto_218048 ?auto_218051 ) ) ( not ( = ?auto_218049 ?auto_218050 ) ) ( not ( = ?auto_218049 ?auto_218051 ) ) ( not ( = ?auto_218050 ?auto_218051 ) ) ( ON ?auto_218049 ?auto_218050 ) ( ON ?auto_218048 ?auto_218049 ) ( ON ?auto_218047 ?auto_218048 ) ( ON ?auto_218046 ?auto_218047 ) ( ON ?auto_218045 ?auto_218046 ) ( ON ?auto_218044 ?auto_218045 ) ( ON ?auto_218043 ?auto_218044 ) ( ON ?auto_218042 ?auto_218043 ) ( ON ?auto_218041 ?auto_218042 ) ( ON ?auto_218040 ?auto_218041 ) ( CLEAR ?auto_218040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_218040 )
      ( MAKE-11PILE ?auto_218040 ?auto_218041 ?auto_218042 ?auto_218043 ?auto_218044 ?auto_218045 ?auto_218046 ?auto_218047 ?auto_218048 ?auto_218049 ?auto_218050 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218064 - BLOCK
      ?auto_218065 - BLOCK
      ?auto_218066 - BLOCK
      ?auto_218067 - BLOCK
      ?auto_218068 - BLOCK
      ?auto_218069 - BLOCK
      ?auto_218070 - BLOCK
      ?auto_218071 - BLOCK
      ?auto_218072 - BLOCK
      ?auto_218073 - BLOCK
      ?auto_218074 - BLOCK
      ?auto_218075 - BLOCK
    )
    :vars
    (
      ?auto_218076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_218074 ) ( ON ?auto_218075 ?auto_218076 ) ( CLEAR ?auto_218075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_218064 ) ( ON ?auto_218065 ?auto_218064 ) ( ON ?auto_218066 ?auto_218065 ) ( ON ?auto_218067 ?auto_218066 ) ( ON ?auto_218068 ?auto_218067 ) ( ON ?auto_218069 ?auto_218068 ) ( ON ?auto_218070 ?auto_218069 ) ( ON ?auto_218071 ?auto_218070 ) ( ON ?auto_218072 ?auto_218071 ) ( ON ?auto_218073 ?auto_218072 ) ( ON ?auto_218074 ?auto_218073 ) ( not ( = ?auto_218064 ?auto_218065 ) ) ( not ( = ?auto_218064 ?auto_218066 ) ) ( not ( = ?auto_218064 ?auto_218067 ) ) ( not ( = ?auto_218064 ?auto_218068 ) ) ( not ( = ?auto_218064 ?auto_218069 ) ) ( not ( = ?auto_218064 ?auto_218070 ) ) ( not ( = ?auto_218064 ?auto_218071 ) ) ( not ( = ?auto_218064 ?auto_218072 ) ) ( not ( = ?auto_218064 ?auto_218073 ) ) ( not ( = ?auto_218064 ?auto_218074 ) ) ( not ( = ?auto_218064 ?auto_218075 ) ) ( not ( = ?auto_218064 ?auto_218076 ) ) ( not ( = ?auto_218065 ?auto_218066 ) ) ( not ( = ?auto_218065 ?auto_218067 ) ) ( not ( = ?auto_218065 ?auto_218068 ) ) ( not ( = ?auto_218065 ?auto_218069 ) ) ( not ( = ?auto_218065 ?auto_218070 ) ) ( not ( = ?auto_218065 ?auto_218071 ) ) ( not ( = ?auto_218065 ?auto_218072 ) ) ( not ( = ?auto_218065 ?auto_218073 ) ) ( not ( = ?auto_218065 ?auto_218074 ) ) ( not ( = ?auto_218065 ?auto_218075 ) ) ( not ( = ?auto_218065 ?auto_218076 ) ) ( not ( = ?auto_218066 ?auto_218067 ) ) ( not ( = ?auto_218066 ?auto_218068 ) ) ( not ( = ?auto_218066 ?auto_218069 ) ) ( not ( = ?auto_218066 ?auto_218070 ) ) ( not ( = ?auto_218066 ?auto_218071 ) ) ( not ( = ?auto_218066 ?auto_218072 ) ) ( not ( = ?auto_218066 ?auto_218073 ) ) ( not ( = ?auto_218066 ?auto_218074 ) ) ( not ( = ?auto_218066 ?auto_218075 ) ) ( not ( = ?auto_218066 ?auto_218076 ) ) ( not ( = ?auto_218067 ?auto_218068 ) ) ( not ( = ?auto_218067 ?auto_218069 ) ) ( not ( = ?auto_218067 ?auto_218070 ) ) ( not ( = ?auto_218067 ?auto_218071 ) ) ( not ( = ?auto_218067 ?auto_218072 ) ) ( not ( = ?auto_218067 ?auto_218073 ) ) ( not ( = ?auto_218067 ?auto_218074 ) ) ( not ( = ?auto_218067 ?auto_218075 ) ) ( not ( = ?auto_218067 ?auto_218076 ) ) ( not ( = ?auto_218068 ?auto_218069 ) ) ( not ( = ?auto_218068 ?auto_218070 ) ) ( not ( = ?auto_218068 ?auto_218071 ) ) ( not ( = ?auto_218068 ?auto_218072 ) ) ( not ( = ?auto_218068 ?auto_218073 ) ) ( not ( = ?auto_218068 ?auto_218074 ) ) ( not ( = ?auto_218068 ?auto_218075 ) ) ( not ( = ?auto_218068 ?auto_218076 ) ) ( not ( = ?auto_218069 ?auto_218070 ) ) ( not ( = ?auto_218069 ?auto_218071 ) ) ( not ( = ?auto_218069 ?auto_218072 ) ) ( not ( = ?auto_218069 ?auto_218073 ) ) ( not ( = ?auto_218069 ?auto_218074 ) ) ( not ( = ?auto_218069 ?auto_218075 ) ) ( not ( = ?auto_218069 ?auto_218076 ) ) ( not ( = ?auto_218070 ?auto_218071 ) ) ( not ( = ?auto_218070 ?auto_218072 ) ) ( not ( = ?auto_218070 ?auto_218073 ) ) ( not ( = ?auto_218070 ?auto_218074 ) ) ( not ( = ?auto_218070 ?auto_218075 ) ) ( not ( = ?auto_218070 ?auto_218076 ) ) ( not ( = ?auto_218071 ?auto_218072 ) ) ( not ( = ?auto_218071 ?auto_218073 ) ) ( not ( = ?auto_218071 ?auto_218074 ) ) ( not ( = ?auto_218071 ?auto_218075 ) ) ( not ( = ?auto_218071 ?auto_218076 ) ) ( not ( = ?auto_218072 ?auto_218073 ) ) ( not ( = ?auto_218072 ?auto_218074 ) ) ( not ( = ?auto_218072 ?auto_218075 ) ) ( not ( = ?auto_218072 ?auto_218076 ) ) ( not ( = ?auto_218073 ?auto_218074 ) ) ( not ( = ?auto_218073 ?auto_218075 ) ) ( not ( = ?auto_218073 ?auto_218076 ) ) ( not ( = ?auto_218074 ?auto_218075 ) ) ( not ( = ?auto_218074 ?auto_218076 ) ) ( not ( = ?auto_218075 ?auto_218076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_218075 ?auto_218076 )
      ( !STACK ?auto_218075 ?auto_218074 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218089 - BLOCK
      ?auto_218090 - BLOCK
      ?auto_218091 - BLOCK
      ?auto_218092 - BLOCK
      ?auto_218093 - BLOCK
      ?auto_218094 - BLOCK
      ?auto_218095 - BLOCK
      ?auto_218096 - BLOCK
      ?auto_218097 - BLOCK
      ?auto_218098 - BLOCK
      ?auto_218099 - BLOCK
      ?auto_218100 - BLOCK
    )
    :vars
    (
      ?auto_218101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_218099 ) ( ON ?auto_218100 ?auto_218101 ) ( CLEAR ?auto_218100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_218089 ) ( ON ?auto_218090 ?auto_218089 ) ( ON ?auto_218091 ?auto_218090 ) ( ON ?auto_218092 ?auto_218091 ) ( ON ?auto_218093 ?auto_218092 ) ( ON ?auto_218094 ?auto_218093 ) ( ON ?auto_218095 ?auto_218094 ) ( ON ?auto_218096 ?auto_218095 ) ( ON ?auto_218097 ?auto_218096 ) ( ON ?auto_218098 ?auto_218097 ) ( ON ?auto_218099 ?auto_218098 ) ( not ( = ?auto_218089 ?auto_218090 ) ) ( not ( = ?auto_218089 ?auto_218091 ) ) ( not ( = ?auto_218089 ?auto_218092 ) ) ( not ( = ?auto_218089 ?auto_218093 ) ) ( not ( = ?auto_218089 ?auto_218094 ) ) ( not ( = ?auto_218089 ?auto_218095 ) ) ( not ( = ?auto_218089 ?auto_218096 ) ) ( not ( = ?auto_218089 ?auto_218097 ) ) ( not ( = ?auto_218089 ?auto_218098 ) ) ( not ( = ?auto_218089 ?auto_218099 ) ) ( not ( = ?auto_218089 ?auto_218100 ) ) ( not ( = ?auto_218089 ?auto_218101 ) ) ( not ( = ?auto_218090 ?auto_218091 ) ) ( not ( = ?auto_218090 ?auto_218092 ) ) ( not ( = ?auto_218090 ?auto_218093 ) ) ( not ( = ?auto_218090 ?auto_218094 ) ) ( not ( = ?auto_218090 ?auto_218095 ) ) ( not ( = ?auto_218090 ?auto_218096 ) ) ( not ( = ?auto_218090 ?auto_218097 ) ) ( not ( = ?auto_218090 ?auto_218098 ) ) ( not ( = ?auto_218090 ?auto_218099 ) ) ( not ( = ?auto_218090 ?auto_218100 ) ) ( not ( = ?auto_218090 ?auto_218101 ) ) ( not ( = ?auto_218091 ?auto_218092 ) ) ( not ( = ?auto_218091 ?auto_218093 ) ) ( not ( = ?auto_218091 ?auto_218094 ) ) ( not ( = ?auto_218091 ?auto_218095 ) ) ( not ( = ?auto_218091 ?auto_218096 ) ) ( not ( = ?auto_218091 ?auto_218097 ) ) ( not ( = ?auto_218091 ?auto_218098 ) ) ( not ( = ?auto_218091 ?auto_218099 ) ) ( not ( = ?auto_218091 ?auto_218100 ) ) ( not ( = ?auto_218091 ?auto_218101 ) ) ( not ( = ?auto_218092 ?auto_218093 ) ) ( not ( = ?auto_218092 ?auto_218094 ) ) ( not ( = ?auto_218092 ?auto_218095 ) ) ( not ( = ?auto_218092 ?auto_218096 ) ) ( not ( = ?auto_218092 ?auto_218097 ) ) ( not ( = ?auto_218092 ?auto_218098 ) ) ( not ( = ?auto_218092 ?auto_218099 ) ) ( not ( = ?auto_218092 ?auto_218100 ) ) ( not ( = ?auto_218092 ?auto_218101 ) ) ( not ( = ?auto_218093 ?auto_218094 ) ) ( not ( = ?auto_218093 ?auto_218095 ) ) ( not ( = ?auto_218093 ?auto_218096 ) ) ( not ( = ?auto_218093 ?auto_218097 ) ) ( not ( = ?auto_218093 ?auto_218098 ) ) ( not ( = ?auto_218093 ?auto_218099 ) ) ( not ( = ?auto_218093 ?auto_218100 ) ) ( not ( = ?auto_218093 ?auto_218101 ) ) ( not ( = ?auto_218094 ?auto_218095 ) ) ( not ( = ?auto_218094 ?auto_218096 ) ) ( not ( = ?auto_218094 ?auto_218097 ) ) ( not ( = ?auto_218094 ?auto_218098 ) ) ( not ( = ?auto_218094 ?auto_218099 ) ) ( not ( = ?auto_218094 ?auto_218100 ) ) ( not ( = ?auto_218094 ?auto_218101 ) ) ( not ( = ?auto_218095 ?auto_218096 ) ) ( not ( = ?auto_218095 ?auto_218097 ) ) ( not ( = ?auto_218095 ?auto_218098 ) ) ( not ( = ?auto_218095 ?auto_218099 ) ) ( not ( = ?auto_218095 ?auto_218100 ) ) ( not ( = ?auto_218095 ?auto_218101 ) ) ( not ( = ?auto_218096 ?auto_218097 ) ) ( not ( = ?auto_218096 ?auto_218098 ) ) ( not ( = ?auto_218096 ?auto_218099 ) ) ( not ( = ?auto_218096 ?auto_218100 ) ) ( not ( = ?auto_218096 ?auto_218101 ) ) ( not ( = ?auto_218097 ?auto_218098 ) ) ( not ( = ?auto_218097 ?auto_218099 ) ) ( not ( = ?auto_218097 ?auto_218100 ) ) ( not ( = ?auto_218097 ?auto_218101 ) ) ( not ( = ?auto_218098 ?auto_218099 ) ) ( not ( = ?auto_218098 ?auto_218100 ) ) ( not ( = ?auto_218098 ?auto_218101 ) ) ( not ( = ?auto_218099 ?auto_218100 ) ) ( not ( = ?auto_218099 ?auto_218101 ) ) ( not ( = ?auto_218100 ?auto_218101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_218100 ?auto_218101 )
      ( !STACK ?auto_218100 ?auto_218099 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218114 - BLOCK
      ?auto_218115 - BLOCK
      ?auto_218116 - BLOCK
      ?auto_218117 - BLOCK
      ?auto_218118 - BLOCK
      ?auto_218119 - BLOCK
      ?auto_218120 - BLOCK
      ?auto_218121 - BLOCK
      ?auto_218122 - BLOCK
      ?auto_218123 - BLOCK
      ?auto_218124 - BLOCK
      ?auto_218125 - BLOCK
    )
    :vars
    (
      ?auto_218126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218125 ?auto_218126 ) ( ON-TABLE ?auto_218114 ) ( ON ?auto_218115 ?auto_218114 ) ( ON ?auto_218116 ?auto_218115 ) ( ON ?auto_218117 ?auto_218116 ) ( ON ?auto_218118 ?auto_218117 ) ( ON ?auto_218119 ?auto_218118 ) ( ON ?auto_218120 ?auto_218119 ) ( ON ?auto_218121 ?auto_218120 ) ( ON ?auto_218122 ?auto_218121 ) ( ON ?auto_218123 ?auto_218122 ) ( not ( = ?auto_218114 ?auto_218115 ) ) ( not ( = ?auto_218114 ?auto_218116 ) ) ( not ( = ?auto_218114 ?auto_218117 ) ) ( not ( = ?auto_218114 ?auto_218118 ) ) ( not ( = ?auto_218114 ?auto_218119 ) ) ( not ( = ?auto_218114 ?auto_218120 ) ) ( not ( = ?auto_218114 ?auto_218121 ) ) ( not ( = ?auto_218114 ?auto_218122 ) ) ( not ( = ?auto_218114 ?auto_218123 ) ) ( not ( = ?auto_218114 ?auto_218124 ) ) ( not ( = ?auto_218114 ?auto_218125 ) ) ( not ( = ?auto_218114 ?auto_218126 ) ) ( not ( = ?auto_218115 ?auto_218116 ) ) ( not ( = ?auto_218115 ?auto_218117 ) ) ( not ( = ?auto_218115 ?auto_218118 ) ) ( not ( = ?auto_218115 ?auto_218119 ) ) ( not ( = ?auto_218115 ?auto_218120 ) ) ( not ( = ?auto_218115 ?auto_218121 ) ) ( not ( = ?auto_218115 ?auto_218122 ) ) ( not ( = ?auto_218115 ?auto_218123 ) ) ( not ( = ?auto_218115 ?auto_218124 ) ) ( not ( = ?auto_218115 ?auto_218125 ) ) ( not ( = ?auto_218115 ?auto_218126 ) ) ( not ( = ?auto_218116 ?auto_218117 ) ) ( not ( = ?auto_218116 ?auto_218118 ) ) ( not ( = ?auto_218116 ?auto_218119 ) ) ( not ( = ?auto_218116 ?auto_218120 ) ) ( not ( = ?auto_218116 ?auto_218121 ) ) ( not ( = ?auto_218116 ?auto_218122 ) ) ( not ( = ?auto_218116 ?auto_218123 ) ) ( not ( = ?auto_218116 ?auto_218124 ) ) ( not ( = ?auto_218116 ?auto_218125 ) ) ( not ( = ?auto_218116 ?auto_218126 ) ) ( not ( = ?auto_218117 ?auto_218118 ) ) ( not ( = ?auto_218117 ?auto_218119 ) ) ( not ( = ?auto_218117 ?auto_218120 ) ) ( not ( = ?auto_218117 ?auto_218121 ) ) ( not ( = ?auto_218117 ?auto_218122 ) ) ( not ( = ?auto_218117 ?auto_218123 ) ) ( not ( = ?auto_218117 ?auto_218124 ) ) ( not ( = ?auto_218117 ?auto_218125 ) ) ( not ( = ?auto_218117 ?auto_218126 ) ) ( not ( = ?auto_218118 ?auto_218119 ) ) ( not ( = ?auto_218118 ?auto_218120 ) ) ( not ( = ?auto_218118 ?auto_218121 ) ) ( not ( = ?auto_218118 ?auto_218122 ) ) ( not ( = ?auto_218118 ?auto_218123 ) ) ( not ( = ?auto_218118 ?auto_218124 ) ) ( not ( = ?auto_218118 ?auto_218125 ) ) ( not ( = ?auto_218118 ?auto_218126 ) ) ( not ( = ?auto_218119 ?auto_218120 ) ) ( not ( = ?auto_218119 ?auto_218121 ) ) ( not ( = ?auto_218119 ?auto_218122 ) ) ( not ( = ?auto_218119 ?auto_218123 ) ) ( not ( = ?auto_218119 ?auto_218124 ) ) ( not ( = ?auto_218119 ?auto_218125 ) ) ( not ( = ?auto_218119 ?auto_218126 ) ) ( not ( = ?auto_218120 ?auto_218121 ) ) ( not ( = ?auto_218120 ?auto_218122 ) ) ( not ( = ?auto_218120 ?auto_218123 ) ) ( not ( = ?auto_218120 ?auto_218124 ) ) ( not ( = ?auto_218120 ?auto_218125 ) ) ( not ( = ?auto_218120 ?auto_218126 ) ) ( not ( = ?auto_218121 ?auto_218122 ) ) ( not ( = ?auto_218121 ?auto_218123 ) ) ( not ( = ?auto_218121 ?auto_218124 ) ) ( not ( = ?auto_218121 ?auto_218125 ) ) ( not ( = ?auto_218121 ?auto_218126 ) ) ( not ( = ?auto_218122 ?auto_218123 ) ) ( not ( = ?auto_218122 ?auto_218124 ) ) ( not ( = ?auto_218122 ?auto_218125 ) ) ( not ( = ?auto_218122 ?auto_218126 ) ) ( not ( = ?auto_218123 ?auto_218124 ) ) ( not ( = ?auto_218123 ?auto_218125 ) ) ( not ( = ?auto_218123 ?auto_218126 ) ) ( not ( = ?auto_218124 ?auto_218125 ) ) ( not ( = ?auto_218124 ?auto_218126 ) ) ( not ( = ?auto_218125 ?auto_218126 ) ) ( CLEAR ?auto_218123 ) ( ON ?auto_218124 ?auto_218125 ) ( CLEAR ?auto_218124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_218114 ?auto_218115 ?auto_218116 ?auto_218117 ?auto_218118 ?auto_218119 ?auto_218120 ?auto_218121 ?auto_218122 ?auto_218123 ?auto_218124 )
      ( MAKE-12PILE ?auto_218114 ?auto_218115 ?auto_218116 ?auto_218117 ?auto_218118 ?auto_218119 ?auto_218120 ?auto_218121 ?auto_218122 ?auto_218123 ?auto_218124 ?auto_218125 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218139 - BLOCK
      ?auto_218140 - BLOCK
      ?auto_218141 - BLOCK
      ?auto_218142 - BLOCK
      ?auto_218143 - BLOCK
      ?auto_218144 - BLOCK
      ?auto_218145 - BLOCK
      ?auto_218146 - BLOCK
      ?auto_218147 - BLOCK
      ?auto_218148 - BLOCK
      ?auto_218149 - BLOCK
      ?auto_218150 - BLOCK
    )
    :vars
    (
      ?auto_218151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218150 ?auto_218151 ) ( ON-TABLE ?auto_218139 ) ( ON ?auto_218140 ?auto_218139 ) ( ON ?auto_218141 ?auto_218140 ) ( ON ?auto_218142 ?auto_218141 ) ( ON ?auto_218143 ?auto_218142 ) ( ON ?auto_218144 ?auto_218143 ) ( ON ?auto_218145 ?auto_218144 ) ( ON ?auto_218146 ?auto_218145 ) ( ON ?auto_218147 ?auto_218146 ) ( ON ?auto_218148 ?auto_218147 ) ( not ( = ?auto_218139 ?auto_218140 ) ) ( not ( = ?auto_218139 ?auto_218141 ) ) ( not ( = ?auto_218139 ?auto_218142 ) ) ( not ( = ?auto_218139 ?auto_218143 ) ) ( not ( = ?auto_218139 ?auto_218144 ) ) ( not ( = ?auto_218139 ?auto_218145 ) ) ( not ( = ?auto_218139 ?auto_218146 ) ) ( not ( = ?auto_218139 ?auto_218147 ) ) ( not ( = ?auto_218139 ?auto_218148 ) ) ( not ( = ?auto_218139 ?auto_218149 ) ) ( not ( = ?auto_218139 ?auto_218150 ) ) ( not ( = ?auto_218139 ?auto_218151 ) ) ( not ( = ?auto_218140 ?auto_218141 ) ) ( not ( = ?auto_218140 ?auto_218142 ) ) ( not ( = ?auto_218140 ?auto_218143 ) ) ( not ( = ?auto_218140 ?auto_218144 ) ) ( not ( = ?auto_218140 ?auto_218145 ) ) ( not ( = ?auto_218140 ?auto_218146 ) ) ( not ( = ?auto_218140 ?auto_218147 ) ) ( not ( = ?auto_218140 ?auto_218148 ) ) ( not ( = ?auto_218140 ?auto_218149 ) ) ( not ( = ?auto_218140 ?auto_218150 ) ) ( not ( = ?auto_218140 ?auto_218151 ) ) ( not ( = ?auto_218141 ?auto_218142 ) ) ( not ( = ?auto_218141 ?auto_218143 ) ) ( not ( = ?auto_218141 ?auto_218144 ) ) ( not ( = ?auto_218141 ?auto_218145 ) ) ( not ( = ?auto_218141 ?auto_218146 ) ) ( not ( = ?auto_218141 ?auto_218147 ) ) ( not ( = ?auto_218141 ?auto_218148 ) ) ( not ( = ?auto_218141 ?auto_218149 ) ) ( not ( = ?auto_218141 ?auto_218150 ) ) ( not ( = ?auto_218141 ?auto_218151 ) ) ( not ( = ?auto_218142 ?auto_218143 ) ) ( not ( = ?auto_218142 ?auto_218144 ) ) ( not ( = ?auto_218142 ?auto_218145 ) ) ( not ( = ?auto_218142 ?auto_218146 ) ) ( not ( = ?auto_218142 ?auto_218147 ) ) ( not ( = ?auto_218142 ?auto_218148 ) ) ( not ( = ?auto_218142 ?auto_218149 ) ) ( not ( = ?auto_218142 ?auto_218150 ) ) ( not ( = ?auto_218142 ?auto_218151 ) ) ( not ( = ?auto_218143 ?auto_218144 ) ) ( not ( = ?auto_218143 ?auto_218145 ) ) ( not ( = ?auto_218143 ?auto_218146 ) ) ( not ( = ?auto_218143 ?auto_218147 ) ) ( not ( = ?auto_218143 ?auto_218148 ) ) ( not ( = ?auto_218143 ?auto_218149 ) ) ( not ( = ?auto_218143 ?auto_218150 ) ) ( not ( = ?auto_218143 ?auto_218151 ) ) ( not ( = ?auto_218144 ?auto_218145 ) ) ( not ( = ?auto_218144 ?auto_218146 ) ) ( not ( = ?auto_218144 ?auto_218147 ) ) ( not ( = ?auto_218144 ?auto_218148 ) ) ( not ( = ?auto_218144 ?auto_218149 ) ) ( not ( = ?auto_218144 ?auto_218150 ) ) ( not ( = ?auto_218144 ?auto_218151 ) ) ( not ( = ?auto_218145 ?auto_218146 ) ) ( not ( = ?auto_218145 ?auto_218147 ) ) ( not ( = ?auto_218145 ?auto_218148 ) ) ( not ( = ?auto_218145 ?auto_218149 ) ) ( not ( = ?auto_218145 ?auto_218150 ) ) ( not ( = ?auto_218145 ?auto_218151 ) ) ( not ( = ?auto_218146 ?auto_218147 ) ) ( not ( = ?auto_218146 ?auto_218148 ) ) ( not ( = ?auto_218146 ?auto_218149 ) ) ( not ( = ?auto_218146 ?auto_218150 ) ) ( not ( = ?auto_218146 ?auto_218151 ) ) ( not ( = ?auto_218147 ?auto_218148 ) ) ( not ( = ?auto_218147 ?auto_218149 ) ) ( not ( = ?auto_218147 ?auto_218150 ) ) ( not ( = ?auto_218147 ?auto_218151 ) ) ( not ( = ?auto_218148 ?auto_218149 ) ) ( not ( = ?auto_218148 ?auto_218150 ) ) ( not ( = ?auto_218148 ?auto_218151 ) ) ( not ( = ?auto_218149 ?auto_218150 ) ) ( not ( = ?auto_218149 ?auto_218151 ) ) ( not ( = ?auto_218150 ?auto_218151 ) ) ( CLEAR ?auto_218148 ) ( ON ?auto_218149 ?auto_218150 ) ( CLEAR ?auto_218149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_218139 ?auto_218140 ?auto_218141 ?auto_218142 ?auto_218143 ?auto_218144 ?auto_218145 ?auto_218146 ?auto_218147 ?auto_218148 ?auto_218149 )
      ( MAKE-12PILE ?auto_218139 ?auto_218140 ?auto_218141 ?auto_218142 ?auto_218143 ?auto_218144 ?auto_218145 ?auto_218146 ?auto_218147 ?auto_218148 ?auto_218149 ?auto_218150 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218164 - BLOCK
      ?auto_218165 - BLOCK
      ?auto_218166 - BLOCK
      ?auto_218167 - BLOCK
      ?auto_218168 - BLOCK
      ?auto_218169 - BLOCK
      ?auto_218170 - BLOCK
      ?auto_218171 - BLOCK
      ?auto_218172 - BLOCK
      ?auto_218173 - BLOCK
      ?auto_218174 - BLOCK
      ?auto_218175 - BLOCK
    )
    :vars
    (
      ?auto_218176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218175 ?auto_218176 ) ( ON-TABLE ?auto_218164 ) ( ON ?auto_218165 ?auto_218164 ) ( ON ?auto_218166 ?auto_218165 ) ( ON ?auto_218167 ?auto_218166 ) ( ON ?auto_218168 ?auto_218167 ) ( ON ?auto_218169 ?auto_218168 ) ( ON ?auto_218170 ?auto_218169 ) ( ON ?auto_218171 ?auto_218170 ) ( ON ?auto_218172 ?auto_218171 ) ( not ( = ?auto_218164 ?auto_218165 ) ) ( not ( = ?auto_218164 ?auto_218166 ) ) ( not ( = ?auto_218164 ?auto_218167 ) ) ( not ( = ?auto_218164 ?auto_218168 ) ) ( not ( = ?auto_218164 ?auto_218169 ) ) ( not ( = ?auto_218164 ?auto_218170 ) ) ( not ( = ?auto_218164 ?auto_218171 ) ) ( not ( = ?auto_218164 ?auto_218172 ) ) ( not ( = ?auto_218164 ?auto_218173 ) ) ( not ( = ?auto_218164 ?auto_218174 ) ) ( not ( = ?auto_218164 ?auto_218175 ) ) ( not ( = ?auto_218164 ?auto_218176 ) ) ( not ( = ?auto_218165 ?auto_218166 ) ) ( not ( = ?auto_218165 ?auto_218167 ) ) ( not ( = ?auto_218165 ?auto_218168 ) ) ( not ( = ?auto_218165 ?auto_218169 ) ) ( not ( = ?auto_218165 ?auto_218170 ) ) ( not ( = ?auto_218165 ?auto_218171 ) ) ( not ( = ?auto_218165 ?auto_218172 ) ) ( not ( = ?auto_218165 ?auto_218173 ) ) ( not ( = ?auto_218165 ?auto_218174 ) ) ( not ( = ?auto_218165 ?auto_218175 ) ) ( not ( = ?auto_218165 ?auto_218176 ) ) ( not ( = ?auto_218166 ?auto_218167 ) ) ( not ( = ?auto_218166 ?auto_218168 ) ) ( not ( = ?auto_218166 ?auto_218169 ) ) ( not ( = ?auto_218166 ?auto_218170 ) ) ( not ( = ?auto_218166 ?auto_218171 ) ) ( not ( = ?auto_218166 ?auto_218172 ) ) ( not ( = ?auto_218166 ?auto_218173 ) ) ( not ( = ?auto_218166 ?auto_218174 ) ) ( not ( = ?auto_218166 ?auto_218175 ) ) ( not ( = ?auto_218166 ?auto_218176 ) ) ( not ( = ?auto_218167 ?auto_218168 ) ) ( not ( = ?auto_218167 ?auto_218169 ) ) ( not ( = ?auto_218167 ?auto_218170 ) ) ( not ( = ?auto_218167 ?auto_218171 ) ) ( not ( = ?auto_218167 ?auto_218172 ) ) ( not ( = ?auto_218167 ?auto_218173 ) ) ( not ( = ?auto_218167 ?auto_218174 ) ) ( not ( = ?auto_218167 ?auto_218175 ) ) ( not ( = ?auto_218167 ?auto_218176 ) ) ( not ( = ?auto_218168 ?auto_218169 ) ) ( not ( = ?auto_218168 ?auto_218170 ) ) ( not ( = ?auto_218168 ?auto_218171 ) ) ( not ( = ?auto_218168 ?auto_218172 ) ) ( not ( = ?auto_218168 ?auto_218173 ) ) ( not ( = ?auto_218168 ?auto_218174 ) ) ( not ( = ?auto_218168 ?auto_218175 ) ) ( not ( = ?auto_218168 ?auto_218176 ) ) ( not ( = ?auto_218169 ?auto_218170 ) ) ( not ( = ?auto_218169 ?auto_218171 ) ) ( not ( = ?auto_218169 ?auto_218172 ) ) ( not ( = ?auto_218169 ?auto_218173 ) ) ( not ( = ?auto_218169 ?auto_218174 ) ) ( not ( = ?auto_218169 ?auto_218175 ) ) ( not ( = ?auto_218169 ?auto_218176 ) ) ( not ( = ?auto_218170 ?auto_218171 ) ) ( not ( = ?auto_218170 ?auto_218172 ) ) ( not ( = ?auto_218170 ?auto_218173 ) ) ( not ( = ?auto_218170 ?auto_218174 ) ) ( not ( = ?auto_218170 ?auto_218175 ) ) ( not ( = ?auto_218170 ?auto_218176 ) ) ( not ( = ?auto_218171 ?auto_218172 ) ) ( not ( = ?auto_218171 ?auto_218173 ) ) ( not ( = ?auto_218171 ?auto_218174 ) ) ( not ( = ?auto_218171 ?auto_218175 ) ) ( not ( = ?auto_218171 ?auto_218176 ) ) ( not ( = ?auto_218172 ?auto_218173 ) ) ( not ( = ?auto_218172 ?auto_218174 ) ) ( not ( = ?auto_218172 ?auto_218175 ) ) ( not ( = ?auto_218172 ?auto_218176 ) ) ( not ( = ?auto_218173 ?auto_218174 ) ) ( not ( = ?auto_218173 ?auto_218175 ) ) ( not ( = ?auto_218173 ?auto_218176 ) ) ( not ( = ?auto_218174 ?auto_218175 ) ) ( not ( = ?auto_218174 ?auto_218176 ) ) ( not ( = ?auto_218175 ?auto_218176 ) ) ( ON ?auto_218174 ?auto_218175 ) ( CLEAR ?auto_218172 ) ( ON ?auto_218173 ?auto_218174 ) ( CLEAR ?auto_218173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_218164 ?auto_218165 ?auto_218166 ?auto_218167 ?auto_218168 ?auto_218169 ?auto_218170 ?auto_218171 ?auto_218172 ?auto_218173 )
      ( MAKE-12PILE ?auto_218164 ?auto_218165 ?auto_218166 ?auto_218167 ?auto_218168 ?auto_218169 ?auto_218170 ?auto_218171 ?auto_218172 ?auto_218173 ?auto_218174 ?auto_218175 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218189 - BLOCK
      ?auto_218190 - BLOCK
      ?auto_218191 - BLOCK
      ?auto_218192 - BLOCK
      ?auto_218193 - BLOCK
      ?auto_218194 - BLOCK
      ?auto_218195 - BLOCK
      ?auto_218196 - BLOCK
      ?auto_218197 - BLOCK
      ?auto_218198 - BLOCK
      ?auto_218199 - BLOCK
      ?auto_218200 - BLOCK
    )
    :vars
    (
      ?auto_218201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218200 ?auto_218201 ) ( ON-TABLE ?auto_218189 ) ( ON ?auto_218190 ?auto_218189 ) ( ON ?auto_218191 ?auto_218190 ) ( ON ?auto_218192 ?auto_218191 ) ( ON ?auto_218193 ?auto_218192 ) ( ON ?auto_218194 ?auto_218193 ) ( ON ?auto_218195 ?auto_218194 ) ( ON ?auto_218196 ?auto_218195 ) ( ON ?auto_218197 ?auto_218196 ) ( not ( = ?auto_218189 ?auto_218190 ) ) ( not ( = ?auto_218189 ?auto_218191 ) ) ( not ( = ?auto_218189 ?auto_218192 ) ) ( not ( = ?auto_218189 ?auto_218193 ) ) ( not ( = ?auto_218189 ?auto_218194 ) ) ( not ( = ?auto_218189 ?auto_218195 ) ) ( not ( = ?auto_218189 ?auto_218196 ) ) ( not ( = ?auto_218189 ?auto_218197 ) ) ( not ( = ?auto_218189 ?auto_218198 ) ) ( not ( = ?auto_218189 ?auto_218199 ) ) ( not ( = ?auto_218189 ?auto_218200 ) ) ( not ( = ?auto_218189 ?auto_218201 ) ) ( not ( = ?auto_218190 ?auto_218191 ) ) ( not ( = ?auto_218190 ?auto_218192 ) ) ( not ( = ?auto_218190 ?auto_218193 ) ) ( not ( = ?auto_218190 ?auto_218194 ) ) ( not ( = ?auto_218190 ?auto_218195 ) ) ( not ( = ?auto_218190 ?auto_218196 ) ) ( not ( = ?auto_218190 ?auto_218197 ) ) ( not ( = ?auto_218190 ?auto_218198 ) ) ( not ( = ?auto_218190 ?auto_218199 ) ) ( not ( = ?auto_218190 ?auto_218200 ) ) ( not ( = ?auto_218190 ?auto_218201 ) ) ( not ( = ?auto_218191 ?auto_218192 ) ) ( not ( = ?auto_218191 ?auto_218193 ) ) ( not ( = ?auto_218191 ?auto_218194 ) ) ( not ( = ?auto_218191 ?auto_218195 ) ) ( not ( = ?auto_218191 ?auto_218196 ) ) ( not ( = ?auto_218191 ?auto_218197 ) ) ( not ( = ?auto_218191 ?auto_218198 ) ) ( not ( = ?auto_218191 ?auto_218199 ) ) ( not ( = ?auto_218191 ?auto_218200 ) ) ( not ( = ?auto_218191 ?auto_218201 ) ) ( not ( = ?auto_218192 ?auto_218193 ) ) ( not ( = ?auto_218192 ?auto_218194 ) ) ( not ( = ?auto_218192 ?auto_218195 ) ) ( not ( = ?auto_218192 ?auto_218196 ) ) ( not ( = ?auto_218192 ?auto_218197 ) ) ( not ( = ?auto_218192 ?auto_218198 ) ) ( not ( = ?auto_218192 ?auto_218199 ) ) ( not ( = ?auto_218192 ?auto_218200 ) ) ( not ( = ?auto_218192 ?auto_218201 ) ) ( not ( = ?auto_218193 ?auto_218194 ) ) ( not ( = ?auto_218193 ?auto_218195 ) ) ( not ( = ?auto_218193 ?auto_218196 ) ) ( not ( = ?auto_218193 ?auto_218197 ) ) ( not ( = ?auto_218193 ?auto_218198 ) ) ( not ( = ?auto_218193 ?auto_218199 ) ) ( not ( = ?auto_218193 ?auto_218200 ) ) ( not ( = ?auto_218193 ?auto_218201 ) ) ( not ( = ?auto_218194 ?auto_218195 ) ) ( not ( = ?auto_218194 ?auto_218196 ) ) ( not ( = ?auto_218194 ?auto_218197 ) ) ( not ( = ?auto_218194 ?auto_218198 ) ) ( not ( = ?auto_218194 ?auto_218199 ) ) ( not ( = ?auto_218194 ?auto_218200 ) ) ( not ( = ?auto_218194 ?auto_218201 ) ) ( not ( = ?auto_218195 ?auto_218196 ) ) ( not ( = ?auto_218195 ?auto_218197 ) ) ( not ( = ?auto_218195 ?auto_218198 ) ) ( not ( = ?auto_218195 ?auto_218199 ) ) ( not ( = ?auto_218195 ?auto_218200 ) ) ( not ( = ?auto_218195 ?auto_218201 ) ) ( not ( = ?auto_218196 ?auto_218197 ) ) ( not ( = ?auto_218196 ?auto_218198 ) ) ( not ( = ?auto_218196 ?auto_218199 ) ) ( not ( = ?auto_218196 ?auto_218200 ) ) ( not ( = ?auto_218196 ?auto_218201 ) ) ( not ( = ?auto_218197 ?auto_218198 ) ) ( not ( = ?auto_218197 ?auto_218199 ) ) ( not ( = ?auto_218197 ?auto_218200 ) ) ( not ( = ?auto_218197 ?auto_218201 ) ) ( not ( = ?auto_218198 ?auto_218199 ) ) ( not ( = ?auto_218198 ?auto_218200 ) ) ( not ( = ?auto_218198 ?auto_218201 ) ) ( not ( = ?auto_218199 ?auto_218200 ) ) ( not ( = ?auto_218199 ?auto_218201 ) ) ( not ( = ?auto_218200 ?auto_218201 ) ) ( ON ?auto_218199 ?auto_218200 ) ( CLEAR ?auto_218197 ) ( ON ?auto_218198 ?auto_218199 ) ( CLEAR ?auto_218198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_218189 ?auto_218190 ?auto_218191 ?auto_218192 ?auto_218193 ?auto_218194 ?auto_218195 ?auto_218196 ?auto_218197 ?auto_218198 )
      ( MAKE-12PILE ?auto_218189 ?auto_218190 ?auto_218191 ?auto_218192 ?auto_218193 ?auto_218194 ?auto_218195 ?auto_218196 ?auto_218197 ?auto_218198 ?auto_218199 ?auto_218200 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218214 - BLOCK
      ?auto_218215 - BLOCK
      ?auto_218216 - BLOCK
      ?auto_218217 - BLOCK
      ?auto_218218 - BLOCK
      ?auto_218219 - BLOCK
      ?auto_218220 - BLOCK
      ?auto_218221 - BLOCK
      ?auto_218222 - BLOCK
      ?auto_218223 - BLOCK
      ?auto_218224 - BLOCK
      ?auto_218225 - BLOCK
    )
    :vars
    (
      ?auto_218226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218225 ?auto_218226 ) ( ON-TABLE ?auto_218214 ) ( ON ?auto_218215 ?auto_218214 ) ( ON ?auto_218216 ?auto_218215 ) ( ON ?auto_218217 ?auto_218216 ) ( ON ?auto_218218 ?auto_218217 ) ( ON ?auto_218219 ?auto_218218 ) ( ON ?auto_218220 ?auto_218219 ) ( ON ?auto_218221 ?auto_218220 ) ( not ( = ?auto_218214 ?auto_218215 ) ) ( not ( = ?auto_218214 ?auto_218216 ) ) ( not ( = ?auto_218214 ?auto_218217 ) ) ( not ( = ?auto_218214 ?auto_218218 ) ) ( not ( = ?auto_218214 ?auto_218219 ) ) ( not ( = ?auto_218214 ?auto_218220 ) ) ( not ( = ?auto_218214 ?auto_218221 ) ) ( not ( = ?auto_218214 ?auto_218222 ) ) ( not ( = ?auto_218214 ?auto_218223 ) ) ( not ( = ?auto_218214 ?auto_218224 ) ) ( not ( = ?auto_218214 ?auto_218225 ) ) ( not ( = ?auto_218214 ?auto_218226 ) ) ( not ( = ?auto_218215 ?auto_218216 ) ) ( not ( = ?auto_218215 ?auto_218217 ) ) ( not ( = ?auto_218215 ?auto_218218 ) ) ( not ( = ?auto_218215 ?auto_218219 ) ) ( not ( = ?auto_218215 ?auto_218220 ) ) ( not ( = ?auto_218215 ?auto_218221 ) ) ( not ( = ?auto_218215 ?auto_218222 ) ) ( not ( = ?auto_218215 ?auto_218223 ) ) ( not ( = ?auto_218215 ?auto_218224 ) ) ( not ( = ?auto_218215 ?auto_218225 ) ) ( not ( = ?auto_218215 ?auto_218226 ) ) ( not ( = ?auto_218216 ?auto_218217 ) ) ( not ( = ?auto_218216 ?auto_218218 ) ) ( not ( = ?auto_218216 ?auto_218219 ) ) ( not ( = ?auto_218216 ?auto_218220 ) ) ( not ( = ?auto_218216 ?auto_218221 ) ) ( not ( = ?auto_218216 ?auto_218222 ) ) ( not ( = ?auto_218216 ?auto_218223 ) ) ( not ( = ?auto_218216 ?auto_218224 ) ) ( not ( = ?auto_218216 ?auto_218225 ) ) ( not ( = ?auto_218216 ?auto_218226 ) ) ( not ( = ?auto_218217 ?auto_218218 ) ) ( not ( = ?auto_218217 ?auto_218219 ) ) ( not ( = ?auto_218217 ?auto_218220 ) ) ( not ( = ?auto_218217 ?auto_218221 ) ) ( not ( = ?auto_218217 ?auto_218222 ) ) ( not ( = ?auto_218217 ?auto_218223 ) ) ( not ( = ?auto_218217 ?auto_218224 ) ) ( not ( = ?auto_218217 ?auto_218225 ) ) ( not ( = ?auto_218217 ?auto_218226 ) ) ( not ( = ?auto_218218 ?auto_218219 ) ) ( not ( = ?auto_218218 ?auto_218220 ) ) ( not ( = ?auto_218218 ?auto_218221 ) ) ( not ( = ?auto_218218 ?auto_218222 ) ) ( not ( = ?auto_218218 ?auto_218223 ) ) ( not ( = ?auto_218218 ?auto_218224 ) ) ( not ( = ?auto_218218 ?auto_218225 ) ) ( not ( = ?auto_218218 ?auto_218226 ) ) ( not ( = ?auto_218219 ?auto_218220 ) ) ( not ( = ?auto_218219 ?auto_218221 ) ) ( not ( = ?auto_218219 ?auto_218222 ) ) ( not ( = ?auto_218219 ?auto_218223 ) ) ( not ( = ?auto_218219 ?auto_218224 ) ) ( not ( = ?auto_218219 ?auto_218225 ) ) ( not ( = ?auto_218219 ?auto_218226 ) ) ( not ( = ?auto_218220 ?auto_218221 ) ) ( not ( = ?auto_218220 ?auto_218222 ) ) ( not ( = ?auto_218220 ?auto_218223 ) ) ( not ( = ?auto_218220 ?auto_218224 ) ) ( not ( = ?auto_218220 ?auto_218225 ) ) ( not ( = ?auto_218220 ?auto_218226 ) ) ( not ( = ?auto_218221 ?auto_218222 ) ) ( not ( = ?auto_218221 ?auto_218223 ) ) ( not ( = ?auto_218221 ?auto_218224 ) ) ( not ( = ?auto_218221 ?auto_218225 ) ) ( not ( = ?auto_218221 ?auto_218226 ) ) ( not ( = ?auto_218222 ?auto_218223 ) ) ( not ( = ?auto_218222 ?auto_218224 ) ) ( not ( = ?auto_218222 ?auto_218225 ) ) ( not ( = ?auto_218222 ?auto_218226 ) ) ( not ( = ?auto_218223 ?auto_218224 ) ) ( not ( = ?auto_218223 ?auto_218225 ) ) ( not ( = ?auto_218223 ?auto_218226 ) ) ( not ( = ?auto_218224 ?auto_218225 ) ) ( not ( = ?auto_218224 ?auto_218226 ) ) ( not ( = ?auto_218225 ?auto_218226 ) ) ( ON ?auto_218224 ?auto_218225 ) ( ON ?auto_218223 ?auto_218224 ) ( CLEAR ?auto_218221 ) ( ON ?auto_218222 ?auto_218223 ) ( CLEAR ?auto_218222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_218214 ?auto_218215 ?auto_218216 ?auto_218217 ?auto_218218 ?auto_218219 ?auto_218220 ?auto_218221 ?auto_218222 )
      ( MAKE-12PILE ?auto_218214 ?auto_218215 ?auto_218216 ?auto_218217 ?auto_218218 ?auto_218219 ?auto_218220 ?auto_218221 ?auto_218222 ?auto_218223 ?auto_218224 ?auto_218225 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218239 - BLOCK
      ?auto_218240 - BLOCK
      ?auto_218241 - BLOCK
      ?auto_218242 - BLOCK
      ?auto_218243 - BLOCK
      ?auto_218244 - BLOCK
      ?auto_218245 - BLOCK
      ?auto_218246 - BLOCK
      ?auto_218247 - BLOCK
      ?auto_218248 - BLOCK
      ?auto_218249 - BLOCK
      ?auto_218250 - BLOCK
    )
    :vars
    (
      ?auto_218251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218250 ?auto_218251 ) ( ON-TABLE ?auto_218239 ) ( ON ?auto_218240 ?auto_218239 ) ( ON ?auto_218241 ?auto_218240 ) ( ON ?auto_218242 ?auto_218241 ) ( ON ?auto_218243 ?auto_218242 ) ( ON ?auto_218244 ?auto_218243 ) ( ON ?auto_218245 ?auto_218244 ) ( ON ?auto_218246 ?auto_218245 ) ( not ( = ?auto_218239 ?auto_218240 ) ) ( not ( = ?auto_218239 ?auto_218241 ) ) ( not ( = ?auto_218239 ?auto_218242 ) ) ( not ( = ?auto_218239 ?auto_218243 ) ) ( not ( = ?auto_218239 ?auto_218244 ) ) ( not ( = ?auto_218239 ?auto_218245 ) ) ( not ( = ?auto_218239 ?auto_218246 ) ) ( not ( = ?auto_218239 ?auto_218247 ) ) ( not ( = ?auto_218239 ?auto_218248 ) ) ( not ( = ?auto_218239 ?auto_218249 ) ) ( not ( = ?auto_218239 ?auto_218250 ) ) ( not ( = ?auto_218239 ?auto_218251 ) ) ( not ( = ?auto_218240 ?auto_218241 ) ) ( not ( = ?auto_218240 ?auto_218242 ) ) ( not ( = ?auto_218240 ?auto_218243 ) ) ( not ( = ?auto_218240 ?auto_218244 ) ) ( not ( = ?auto_218240 ?auto_218245 ) ) ( not ( = ?auto_218240 ?auto_218246 ) ) ( not ( = ?auto_218240 ?auto_218247 ) ) ( not ( = ?auto_218240 ?auto_218248 ) ) ( not ( = ?auto_218240 ?auto_218249 ) ) ( not ( = ?auto_218240 ?auto_218250 ) ) ( not ( = ?auto_218240 ?auto_218251 ) ) ( not ( = ?auto_218241 ?auto_218242 ) ) ( not ( = ?auto_218241 ?auto_218243 ) ) ( not ( = ?auto_218241 ?auto_218244 ) ) ( not ( = ?auto_218241 ?auto_218245 ) ) ( not ( = ?auto_218241 ?auto_218246 ) ) ( not ( = ?auto_218241 ?auto_218247 ) ) ( not ( = ?auto_218241 ?auto_218248 ) ) ( not ( = ?auto_218241 ?auto_218249 ) ) ( not ( = ?auto_218241 ?auto_218250 ) ) ( not ( = ?auto_218241 ?auto_218251 ) ) ( not ( = ?auto_218242 ?auto_218243 ) ) ( not ( = ?auto_218242 ?auto_218244 ) ) ( not ( = ?auto_218242 ?auto_218245 ) ) ( not ( = ?auto_218242 ?auto_218246 ) ) ( not ( = ?auto_218242 ?auto_218247 ) ) ( not ( = ?auto_218242 ?auto_218248 ) ) ( not ( = ?auto_218242 ?auto_218249 ) ) ( not ( = ?auto_218242 ?auto_218250 ) ) ( not ( = ?auto_218242 ?auto_218251 ) ) ( not ( = ?auto_218243 ?auto_218244 ) ) ( not ( = ?auto_218243 ?auto_218245 ) ) ( not ( = ?auto_218243 ?auto_218246 ) ) ( not ( = ?auto_218243 ?auto_218247 ) ) ( not ( = ?auto_218243 ?auto_218248 ) ) ( not ( = ?auto_218243 ?auto_218249 ) ) ( not ( = ?auto_218243 ?auto_218250 ) ) ( not ( = ?auto_218243 ?auto_218251 ) ) ( not ( = ?auto_218244 ?auto_218245 ) ) ( not ( = ?auto_218244 ?auto_218246 ) ) ( not ( = ?auto_218244 ?auto_218247 ) ) ( not ( = ?auto_218244 ?auto_218248 ) ) ( not ( = ?auto_218244 ?auto_218249 ) ) ( not ( = ?auto_218244 ?auto_218250 ) ) ( not ( = ?auto_218244 ?auto_218251 ) ) ( not ( = ?auto_218245 ?auto_218246 ) ) ( not ( = ?auto_218245 ?auto_218247 ) ) ( not ( = ?auto_218245 ?auto_218248 ) ) ( not ( = ?auto_218245 ?auto_218249 ) ) ( not ( = ?auto_218245 ?auto_218250 ) ) ( not ( = ?auto_218245 ?auto_218251 ) ) ( not ( = ?auto_218246 ?auto_218247 ) ) ( not ( = ?auto_218246 ?auto_218248 ) ) ( not ( = ?auto_218246 ?auto_218249 ) ) ( not ( = ?auto_218246 ?auto_218250 ) ) ( not ( = ?auto_218246 ?auto_218251 ) ) ( not ( = ?auto_218247 ?auto_218248 ) ) ( not ( = ?auto_218247 ?auto_218249 ) ) ( not ( = ?auto_218247 ?auto_218250 ) ) ( not ( = ?auto_218247 ?auto_218251 ) ) ( not ( = ?auto_218248 ?auto_218249 ) ) ( not ( = ?auto_218248 ?auto_218250 ) ) ( not ( = ?auto_218248 ?auto_218251 ) ) ( not ( = ?auto_218249 ?auto_218250 ) ) ( not ( = ?auto_218249 ?auto_218251 ) ) ( not ( = ?auto_218250 ?auto_218251 ) ) ( ON ?auto_218249 ?auto_218250 ) ( ON ?auto_218248 ?auto_218249 ) ( CLEAR ?auto_218246 ) ( ON ?auto_218247 ?auto_218248 ) ( CLEAR ?auto_218247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_218239 ?auto_218240 ?auto_218241 ?auto_218242 ?auto_218243 ?auto_218244 ?auto_218245 ?auto_218246 ?auto_218247 )
      ( MAKE-12PILE ?auto_218239 ?auto_218240 ?auto_218241 ?auto_218242 ?auto_218243 ?auto_218244 ?auto_218245 ?auto_218246 ?auto_218247 ?auto_218248 ?auto_218249 ?auto_218250 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218264 - BLOCK
      ?auto_218265 - BLOCK
      ?auto_218266 - BLOCK
      ?auto_218267 - BLOCK
      ?auto_218268 - BLOCK
      ?auto_218269 - BLOCK
      ?auto_218270 - BLOCK
      ?auto_218271 - BLOCK
      ?auto_218272 - BLOCK
      ?auto_218273 - BLOCK
      ?auto_218274 - BLOCK
      ?auto_218275 - BLOCK
    )
    :vars
    (
      ?auto_218276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218275 ?auto_218276 ) ( ON-TABLE ?auto_218264 ) ( ON ?auto_218265 ?auto_218264 ) ( ON ?auto_218266 ?auto_218265 ) ( ON ?auto_218267 ?auto_218266 ) ( ON ?auto_218268 ?auto_218267 ) ( ON ?auto_218269 ?auto_218268 ) ( ON ?auto_218270 ?auto_218269 ) ( not ( = ?auto_218264 ?auto_218265 ) ) ( not ( = ?auto_218264 ?auto_218266 ) ) ( not ( = ?auto_218264 ?auto_218267 ) ) ( not ( = ?auto_218264 ?auto_218268 ) ) ( not ( = ?auto_218264 ?auto_218269 ) ) ( not ( = ?auto_218264 ?auto_218270 ) ) ( not ( = ?auto_218264 ?auto_218271 ) ) ( not ( = ?auto_218264 ?auto_218272 ) ) ( not ( = ?auto_218264 ?auto_218273 ) ) ( not ( = ?auto_218264 ?auto_218274 ) ) ( not ( = ?auto_218264 ?auto_218275 ) ) ( not ( = ?auto_218264 ?auto_218276 ) ) ( not ( = ?auto_218265 ?auto_218266 ) ) ( not ( = ?auto_218265 ?auto_218267 ) ) ( not ( = ?auto_218265 ?auto_218268 ) ) ( not ( = ?auto_218265 ?auto_218269 ) ) ( not ( = ?auto_218265 ?auto_218270 ) ) ( not ( = ?auto_218265 ?auto_218271 ) ) ( not ( = ?auto_218265 ?auto_218272 ) ) ( not ( = ?auto_218265 ?auto_218273 ) ) ( not ( = ?auto_218265 ?auto_218274 ) ) ( not ( = ?auto_218265 ?auto_218275 ) ) ( not ( = ?auto_218265 ?auto_218276 ) ) ( not ( = ?auto_218266 ?auto_218267 ) ) ( not ( = ?auto_218266 ?auto_218268 ) ) ( not ( = ?auto_218266 ?auto_218269 ) ) ( not ( = ?auto_218266 ?auto_218270 ) ) ( not ( = ?auto_218266 ?auto_218271 ) ) ( not ( = ?auto_218266 ?auto_218272 ) ) ( not ( = ?auto_218266 ?auto_218273 ) ) ( not ( = ?auto_218266 ?auto_218274 ) ) ( not ( = ?auto_218266 ?auto_218275 ) ) ( not ( = ?auto_218266 ?auto_218276 ) ) ( not ( = ?auto_218267 ?auto_218268 ) ) ( not ( = ?auto_218267 ?auto_218269 ) ) ( not ( = ?auto_218267 ?auto_218270 ) ) ( not ( = ?auto_218267 ?auto_218271 ) ) ( not ( = ?auto_218267 ?auto_218272 ) ) ( not ( = ?auto_218267 ?auto_218273 ) ) ( not ( = ?auto_218267 ?auto_218274 ) ) ( not ( = ?auto_218267 ?auto_218275 ) ) ( not ( = ?auto_218267 ?auto_218276 ) ) ( not ( = ?auto_218268 ?auto_218269 ) ) ( not ( = ?auto_218268 ?auto_218270 ) ) ( not ( = ?auto_218268 ?auto_218271 ) ) ( not ( = ?auto_218268 ?auto_218272 ) ) ( not ( = ?auto_218268 ?auto_218273 ) ) ( not ( = ?auto_218268 ?auto_218274 ) ) ( not ( = ?auto_218268 ?auto_218275 ) ) ( not ( = ?auto_218268 ?auto_218276 ) ) ( not ( = ?auto_218269 ?auto_218270 ) ) ( not ( = ?auto_218269 ?auto_218271 ) ) ( not ( = ?auto_218269 ?auto_218272 ) ) ( not ( = ?auto_218269 ?auto_218273 ) ) ( not ( = ?auto_218269 ?auto_218274 ) ) ( not ( = ?auto_218269 ?auto_218275 ) ) ( not ( = ?auto_218269 ?auto_218276 ) ) ( not ( = ?auto_218270 ?auto_218271 ) ) ( not ( = ?auto_218270 ?auto_218272 ) ) ( not ( = ?auto_218270 ?auto_218273 ) ) ( not ( = ?auto_218270 ?auto_218274 ) ) ( not ( = ?auto_218270 ?auto_218275 ) ) ( not ( = ?auto_218270 ?auto_218276 ) ) ( not ( = ?auto_218271 ?auto_218272 ) ) ( not ( = ?auto_218271 ?auto_218273 ) ) ( not ( = ?auto_218271 ?auto_218274 ) ) ( not ( = ?auto_218271 ?auto_218275 ) ) ( not ( = ?auto_218271 ?auto_218276 ) ) ( not ( = ?auto_218272 ?auto_218273 ) ) ( not ( = ?auto_218272 ?auto_218274 ) ) ( not ( = ?auto_218272 ?auto_218275 ) ) ( not ( = ?auto_218272 ?auto_218276 ) ) ( not ( = ?auto_218273 ?auto_218274 ) ) ( not ( = ?auto_218273 ?auto_218275 ) ) ( not ( = ?auto_218273 ?auto_218276 ) ) ( not ( = ?auto_218274 ?auto_218275 ) ) ( not ( = ?auto_218274 ?auto_218276 ) ) ( not ( = ?auto_218275 ?auto_218276 ) ) ( ON ?auto_218274 ?auto_218275 ) ( ON ?auto_218273 ?auto_218274 ) ( ON ?auto_218272 ?auto_218273 ) ( CLEAR ?auto_218270 ) ( ON ?auto_218271 ?auto_218272 ) ( CLEAR ?auto_218271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_218264 ?auto_218265 ?auto_218266 ?auto_218267 ?auto_218268 ?auto_218269 ?auto_218270 ?auto_218271 )
      ( MAKE-12PILE ?auto_218264 ?auto_218265 ?auto_218266 ?auto_218267 ?auto_218268 ?auto_218269 ?auto_218270 ?auto_218271 ?auto_218272 ?auto_218273 ?auto_218274 ?auto_218275 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218289 - BLOCK
      ?auto_218290 - BLOCK
      ?auto_218291 - BLOCK
      ?auto_218292 - BLOCK
      ?auto_218293 - BLOCK
      ?auto_218294 - BLOCK
      ?auto_218295 - BLOCK
      ?auto_218296 - BLOCK
      ?auto_218297 - BLOCK
      ?auto_218298 - BLOCK
      ?auto_218299 - BLOCK
      ?auto_218300 - BLOCK
    )
    :vars
    (
      ?auto_218301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218300 ?auto_218301 ) ( ON-TABLE ?auto_218289 ) ( ON ?auto_218290 ?auto_218289 ) ( ON ?auto_218291 ?auto_218290 ) ( ON ?auto_218292 ?auto_218291 ) ( ON ?auto_218293 ?auto_218292 ) ( ON ?auto_218294 ?auto_218293 ) ( ON ?auto_218295 ?auto_218294 ) ( not ( = ?auto_218289 ?auto_218290 ) ) ( not ( = ?auto_218289 ?auto_218291 ) ) ( not ( = ?auto_218289 ?auto_218292 ) ) ( not ( = ?auto_218289 ?auto_218293 ) ) ( not ( = ?auto_218289 ?auto_218294 ) ) ( not ( = ?auto_218289 ?auto_218295 ) ) ( not ( = ?auto_218289 ?auto_218296 ) ) ( not ( = ?auto_218289 ?auto_218297 ) ) ( not ( = ?auto_218289 ?auto_218298 ) ) ( not ( = ?auto_218289 ?auto_218299 ) ) ( not ( = ?auto_218289 ?auto_218300 ) ) ( not ( = ?auto_218289 ?auto_218301 ) ) ( not ( = ?auto_218290 ?auto_218291 ) ) ( not ( = ?auto_218290 ?auto_218292 ) ) ( not ( = ?auto_218290 ?auto_218293 ) ) ( not ( = ?auto_218290 ?auto_218294 ) ) ( not ( = ?auto_218290 ?auto_218295 ) ) ( not ( = ?auto_218290 ?auto_218296 ) ) ( not ( = ?auto_218290 ?auto_218297 ) ) ( not ( = ?auto_218290 ?auto_218298 ) ) ( not ( = ?auto_218290 ?auto_218299 ) ) ( not ( = ?auto_218290 ?auto_218300 ) ) ( not ( = ?auto_218290 ?auto_218301 ) ) ( not ( = ?auto_218291 ?auto_218292 ) ) ( not ( = ?auto_218291 ?auto_218293 ) ) ( not ( = ?auto_218291 ?auto_218294 ) ) ( not ( = ?auto_218291 ?auto_218295 ) ) ( not ( = ?auto_218291 ?auto_218296 ) ) ( not ( = ?auto_218291 ?auto_218297 ) ) ( not ( = ?auto_218291 ?auto_218298 ) ) ( not ( = ?auto_218291 ?auto_218299 ) ) ( not ( = ?auto_218291 ?auto_218300 ) ) ( not ( = ?auto_218291 ?auto_218301 ) ) ( not ( = ?auto_218292 ?auto_218293 ) ) ( not ( = ?auto_218292 ?auto_218294 ) ) ( not ( = ?auto_218292 ?auto_218295 ) ) ( not ( = ?auto_218292 ?auto_218296 ) ) ( not ( = ?auto_218292 ?auto_218297 ) ) ( not ( = ?auto_218292 ?auto_218298 ) ) ( not ( = ?auto_218292 ?auto_218299 ) ) ( not ( = ?auto_218292 ?auto_218300 ) ) ( not ( = ?auto_218292 ?auto_218301 ) ) ( not ( = ?auto_218293 ?auto_218294 ) ) ( not ( = ?auto_218293 ?auto_218295 ) ) ( not ( = ?auto_218293 ?auto_218296 ) ) ( not ( = ?auto_218293 ?auto_218297 ) ) ( not ( = ?auto_218293 ?auto_218298 ) ) ( not ( = ?auto_218293 ?auto_218299 ) ) ( not ( = ?auto_218293 ?auto_218300 ) ) ( not ( = ?auto_218293 ?auto_218301 ) ) ( not ( = ?auto_218294 ?auto_218295 ) ) ( not ( = ?auto_218294 ?auto_218296 ) ) ( not ( = ?auto_218294 ?auto_218297 ) ) ( not ( = ?auto_218294 ?auto_218298 ) ) ( not ( = ?auto_218294 ?auto_218299 ) ) ( not ( = ?auto_218294 ?auto_218300 ) ) ( not ( = ?auto_218294 ?auto_218301 ) ) ( not ( = ?auto_218295 ?auto_218296 ) ) ( not ( = ?auto_218295 ?auto_218297 ) ) ( not ( = ?auto_218295 ?auto_218298 ) ) ( not ( = ?auto_218295 ?auto_218299 ) ) ( not ( = ?auto_218295 ?auto_218300 ) ) ( not ( = ?auto_218295 ?auto_218301 ) ) ( not ( = ?auto_218296 ?auto_218297 ) ) ( not ( = ?auto_218296 ?auto_218298 ) ) ( not ( = ?auto_218296 ?auto_218299 ) ) ( not ( = ?auto_218296 ?auto_218300 ) ) ( not ( = ?auto_218296 ?auto_218301 ) ) ( not ( = ?auto_218297 ?auto_218298 ) ) ( not ( = ?auto_218297 ?auto_218299 ) ) ( not ( = ?auto_218297 ?auto_218300 ) ) ( not ( = ?auto_218297 ?auto_218301 ) ) ( not ( = ?auto_218298 ?auto_218299 ) ) ( not ( = ?auto_218298 ?auto_218300 ) ) ( not ( = ?auto_218298 ?auto_218301 ) ) ( not ( = ?auto_218299 ?auto_218300 ) ) ( not ( = ?auto_218299 ?auto_218301 ) ) ( not ( = ?auto_218300 ?auto_218301 ) ) ( ON ?auto_218299 ?auto_218300 ) ( ON ?auto_218298 ?auto_218299 ) ( ON ?auto_218297 ?auto_218298 ) ( CLEAR ?auto_218295 ) ( ON ?auto_218296 ?auto_218297 ) ( CLEAR ?auto_218296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_218289 ?auto_218290 ?auto_218291 ?auto_218292 ?auto_218293 ?auto_218294 ?auto_218295 ?auto_218296 )
      ( MAKE-12PILE ?auto_218289 ?auto_218290 ?auto_218291 ?auto_218292 ?auto_218293 ?auto_218294 ?auto_218295 ?auto_218296 ?auto_218297 ?auto_218298 ?auto_218299 ?auto_218300 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218314 - BLOCK
      ?auto_218315 - BLOCK
      ?auto_218316 - BLOCK
      ?auto_218317 - BLOCK
      ?auto_218318 - BLOCK
      ?auto_218319 - BLOCK
      ?auto_218320 - BLOCK
      ?auto_218321 - BLOCK
      ?auto_218322 - BLOCK
      ?auto_218323 - BLOCK
      ?auto_218324 - BLOCK
      ?auto_218325 - BLOCK
    )
    :vars
    (
      ?auto_218326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218325 ?auto_218326 ) ( ON-TABLE ?auto_218314 ) ( ON ?auto_218315 ?auto_218314 ) ( ON ?auto_218316 ?auto_218315 ) ( ON ?auto_218317 ?auto_218316 ) ( ON ?auto_218318 ?auto_218317 ) ( ON ?auto_218319 ?auto_218318 ) ( not ( = ?auto_218314 ?auto_218315 ) ) ( not ( = ?auto_218314 ?auto_218316 ) ) ( not ( = ?auto_218314 ?auto_218317 ) ) ( not ( = ?auto_218314 ?auto_218318 ) ) ( not ( = ?auto_218314 ?auto_218319 ) ) ( not ( = ?auto_218314 ?auto_218320 ) ) ( not ( = ?auto_218314 ?auto_218321 ) ) ( not ( = ?auto_218314 ?auto_218322 ) ) ( not ( = ?auto_218314 ?auto_218323 ) ) ( not ( = ?auto_218314 ?auto_218324 ) ) ( not ( = ?auto_218314 ?auto_218325 ) ) ( not ( = ?auto_218314 ?auto_218326 ) ) ( not ( = ?auto_218315 ?auto_218316 ) ) ( not ( = ?auto_218315 ?auto_218317 ) ) ( not ( = ?auto_218315 ?auto_218318 ) ) ( not ( = ?auto_218315 ?auto_218319 ) ) ( not ( = ?auto_218315 ?auto_218320 ) ) ( not ( = ?auto_218315 ?auto_218321 ) ) ( not ( = ?auto_218315 ?auto_218322 ) ) ( not ( = ?auto_218315 ?auto_218323 ) ) ( not ( = ?auto_218315 ?auto_218324 ) ) ( not ( = ?auto_218315 ?auto_218325 ) ) ( not ( = ?auto_218315 ?auto_218326 ) ) ( not ( = ?auto_218316 ?auto_218317 ) ) ( not ( = ?auto_218316 ?auto_218318 ) ) ( not ( = ?auto_218316 ?auto_218319 ) ) ( not ( = ?auto_218316 ?auto_218320 ) ) ( not ( = ?auto_218316 ?auto_218321 ) ) ( not ( = ?auto_218316 ?auto_218322 ) ) ( not ( = ?auto_218316 ?auto_218323 ) ) ( not ( = ?auto_218316 ?auto_218324 ) ) ( not ( = ?auto_218316 ?auto_218325 ) ) ( not ( = ?auto_218316 ?auto_218326 ) ) ( not ( = ?auto_218317 ?auto_218318 ) ) ( not ( = ?auto_218317 ?auto_218319 ) ) ( not ( = ?auto_218317 ?auto_218320 ) ) ( not ( = ?auto_218317 ?auto_218321 ) ) ( not ( = ?auto_218317 ?auto_218322 ) ) ( not ( = ?auto_218317 ?auto_218323 ) ) ( not ( = ?auto_218317 ?auto_218324 ) ) ( not ( = ?auto_218317 ?auto_218325 ) ) ( not ( = ?auto_218317 ?auto_218326 ) ) ( not ( = ?auto_218318 ?auto_218319 ) ) ( not ( = ?auto_218318 ?auto_218320 ) ) ( not ( = ?auto_218318 ?auto_218321 ) ) ( not ( = ?auto_218318 ?auto_218322 ) ) ( not ( = ?auto_218318 ?auto_218323 ) ) ( not ( = ?auto_218318 ?auto_218324 ) ) ( not ( = ?auto_218318 ?auto_218325 ) ) ( not ( = ?auto_218318 ?auto_218326 ) ) ( not ( = ?auto_218319 ?auto_218320 ) ) ( not ( = ?auto_218319 ?auto_218321 ) ) ( not ( = ?auto_218319 ?auto_218322 ) ) ( not ( = ?auto_218319 ?auto_218323 ) ) ( not ( = ?auto_218319 ?auto_218324 ) ) ( not ( = ?auto_218319 ?auto_218325 ) ) ( not ( = ?auto_218319 ?auto_218326 ) ) ( not ( = ?auto_218320 ?auto_218321 ) ) ( not ( = ?auto_218320 ?auto_218322 ) ) ( not ( = ?auto_218320 ?auto_218323 ) ) ( not ( = ?auto_218320 ?auto_218324 ) ) ( not ( = ?auto_218320 ?auto_218325 ) ) ( not ( = ?auto_218320 ?auto_218326 ) ) ( not ( = ?auto_218321 ?auto_218322 ) ) ( not ( = ?auto_218321 ?auto_218323 ) ) ( not ( = ?auto_218321 ?auto_218324 ) ) ( not ( = ?auto_218321 ?auto_218325 ) ) ( not ( = ?auto_218321 ?auto_218326 ) ) ( not ( = ?auto_218322 ?auto_218323 ) ) ( not ( = ?auto_218322 ?auto_218324 ) ) ( not ( = ?auto_218322 ?auto_218325 ) ) ( not ( = ?auto_218322 ?auto_218326 ) ) ( not ( = ?auto_218323 ?auto_218324 ) ) ( not ( = ?auto_218323 ?auto_218325 ) ) ( not ( = ?auto_218323 ?auto_218326 ) ) ( not ( = ?auto_218324 ?auto_218325 ) ) ( not ( = ?auto_218324 ?auto_218326 ) ) ( not ( = ?auto_218325 ?auto_218326 ) ) ( ON ?auto_218324 ?auto_218325 ) ( ON ?auto_218323 ?auto_218324 ) ( ON ?auto_218322 ?auto_218323 ) ( ON ?auto_218321 ?auto_218322 ) ( CLEAR ?auto_218319 ) ( ON ?auto_218320 ?auto_218321 ) ( CLEAR ?auto_218320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_218314 ?auto_218315 ?auto_218316 ?auto_218317 ?auto_218318 ?auto_218319 ?auto_218320 )
      ( MAKE-12PILE ?auto_218314 ?auto_218315 ?auto_218316 ?auto_218317 ?auto_218318 ?auto_218319 ?auto_218320 ?auto_218321 ?auto_218322 ?auto_218323 ?auto_218324 ?auto_218325 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218339 - BLOCK
      ?auto_218340 - BLOCK
      ?auto_218341 - BLOCK
      ?auto_218342 - BLOCK
      ?auto_218343 - BLOCK
      ?auto_218344 - BLOCK
      ?auto_218345 - BLOCK
      ?auto_218346 - BLOCK
      ?auto_218347 - BLOCK
      ?auto_218348 - BLOCK
      ?auto_218349 - BLOCK
      ?auto_218350 - BLOCK
    )
    :vars
    (
      ?auto_218351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218350 ?auto_218351 ) ( ON-TABLE ?auto_218339 ) ( ON ?auto_218340 ?auto_218339 ) ( ON ?auto_218341 ?auto_218340 ) ( ON ?auto_218342 ?auto_218341 ) ( ON ?auto_218343 ?auto_218342 ) ( ON ?auto_218344 ?auto_218343 ) ( not ( = ?auto_218339 ?auto_218340 ) ) ( not ( = ?auto_218339 ?auto_218341 ) ) ( not ( = ?auto_218339 ?auto_218342 ) ) ( not ( = ?auto_218339 ?auto_218343 ) ) ( not ( = ?auto_218339 ?auto_218344 ) ) ( not ( = ?auto_218339 ?auto_218345 ) ) ( not ( = ?auto_218339 ?auto_218346 ) ) ( not ( = ?auto_218339 ?auto_218347 ) ) ( not ( = ?auto_218339 ?auto_218348 ) ) ( not ( = ?auto_218339 ?auto_218349 ) ) ( not ( = ?auto_218339 ?auto_218350 ) ) ( not ( = ?auto_218339 ?auto_218351 ) ) ( not ( = ?auto_218340 ?auto_218341 ) ) ( not ( = ?auto_218340 ?auto_218342 ) ) ( not ( = ?auto_218340 ?auto_218343 ) ) ( not ( = ?auto_218340 ?auto_218344 ) ) ( not ( = ?auto_218340 ?auto_218345 ) ) ( not ( = ?auto_218340 ?auto_218346 ) ) ( not ( = ?auto_218340 ?auto_218347 ) ) ( not ( = ?auto_218340 ?auto_218348 ) ) ( not ( = ?auto_218340 ?auto_218349 ) ) ( not ( = ?auto_218340 ?auto_218350 ) ) ( not ( = ?auto_218340 ?auto_218351 ) ) ( not ( = ?auto_218341 ?auto_218342 ) ) ( not ( = ?auto_218341 ?auto_218343 ) ) ( not ( = ?auto_218341 ?auto_218344 ) ) ( not ( = ?auto_218341 ?auto_218345 ) ) ( not ( = ?auto_218341 ?auto_218346 ) ) ( not ( = ?auto_218341 ?auto_218347 ) ) ( not ( = ?auto_218341 ?auto_218348 ) ) ( not ( = ?auto_218341 ?auto_218349 ) ) ( not ( = ?auto_218341 ?auto_218350 ) ) ( not ( = ?auto_218341 ?auto_218351 ) ) ( not ( = ?auto_218342 ?auto_218343 ) ) ( not ( = ?auto_218342 ?auto_218344 ) ) ( not ( = ?auto_218342 ?auto_218345 ) ) ( not ( = ?auto_218342 ?auto_218346 ) ) ( not ( = ?auto_218342 ?auto_218347 ) ) ( not ( = ?auto_218342 ?auto_218348 ) ) ( not ( = ?auto_218342 ?auto_218349 ) ) ( not ( = ?auto_218342 ?auto_218350 ) ) ( not ( = ?auto_218342 ?auto_218351 ) ) ( not ( = ?auto_218343 ?auto_218344 ) ) ( not ( = ?auto_218343 ?auto_218345 ) ) ( not ( = ?auto_218343 ?auto_218346 ) ) ( not ( = ?auto_218343 ?auto_218347 ) ) ( not ( = ?auto_218343 ?auto_218348 ) ) ( not ( = ?auto_218343 ?auto_218349 ) ) ( not ( = ?auto_218343 ?auto_218350 ) ) ( not ( = ?auto_218343 ?auto_218351 ) ) ( not ( = ?auto_218344 ?auto_218345 ) ) ( not ( = ?auto_218344 ?auto_218346 ) ) ( not ( = ?auto_218344 ?auto_218347 ) ) ( not ( = ?auto_218344 ?auto_218348 ) ) ( not ( = ?auto_218344 ?auto_218349 ) ) ( not ( = ?auto_218344 ?auto_218350 ) ) ( not ( = ?auto_218344 ?auto_218351 ) ) ( not ( = ?auto_218345 ?auto_218346 ) ) ( not ( = ?auto_218345 ?auto_218347 ) ) ( not ( = ?auto_218345 ?auto_218348 ) ) ( not ( = ?auto_218345 ?auto_218349 ) ) ( not ( = ?auto_218345 ?auto_218350 ) ) ( not ( = ?auto_218345 ?auto_218351 ) ) ( not ( = ?auto_218346 ?auto_218347 ) ) ( not ( = ?auto_218346 ?auto_218348 ) ) ( not ( = ?auto_218346 ?auto_218349 ) ) ( not ( = ?auto_218346 ?auto_218350 ) ) ( not ( = ?auto_218346 ?auto_218351 ) ) ( not ( = ?auto_218347 ?auto_218348 ) ) ( not ( = ?auto_218347 ?auto_218349 ) ) ( not ( = ?auto_218347 ?auto_218350 ) ) ( not ( = ?auto_218347 ?auto_218351 ) ) ( not ( = ?auto_218348 ?auto_218349 ) ) ( not ( = ?auto_218348 ?auto_218350 ) ) ( not ( = ?auto_218348 ?auto_218351 ) ) ( not ( = ?auto_218349 ?auto_218350 ) ) ( not ( = ?auto_218349 ?auto_218351 ) ) ( not ( = ?auto_218350 ?auto_218351 ) ) ( ON ?auto_218349 ?auto_218350 ) ( ON ?auto_218348 ?auto_218349 ) ( ON ?auto_218347 ?auto_218348 ) ( ON ?auto_218346 ?auto_218347 ) ( CLEAR ?auto_218344 ) ( ON ?auto_218345 ?auto_218346 ) ( CLEAR ?auto_218345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_218339 ?auto_218340 ?auto_218341 ?auto_218342 ?auto_218343 ?auto_218344 ?auto_218345 )
      ( MAKE-12PILE ?auto_218339 ?auto_218340 ?auto_218341 ?auto_218342 ?auto_218343 ?auto_218344 ?auto_218345 ?auto_218346 ?auto_218347 ?auto_218348 ?auto_218349 ?auto_218350 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218364 - BLOCK
      ?auto_218365 - BLOCK
      ?auto_218366 - BLOCK
      ?auto_218367 - BLOCK
      ?auto_218368 - BLOCK
      ?auto_218369 - BLOCK
      ?auto_218370 - BLOCK
      ?auto_218371 - BLOCK
      ?auto_218372 - BLOCK
      ?auto_218373 - BLOCK
      ?auto_218374 - BLOCK
      ?auto_218375 - BLOCK
    )
    :vars
    (
      ?auto_218376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218375 ?auto_218376 ) ( ON-TABLE ?auto_218364 ) ( ON ?auto_218365 ?auto_218364 ) ( ON ?auto_218366 ?auto_218365 ) ( ON ?auto_218367 ?auto_218366 ) ( ON ?auto_218368 ?auto_218367 ) ( not ( = ?auto_218364 ?auto_218365 ) ) ( not ( = ?auto_218364 ?auto_218366 ) ) ( not ( = ?auto_218364 ?auto_218367 ) ) ( not ( = ?auto_218364 ?auto_218368 ) ) ( not ( = ?auto_218364 ?auto_218369 ) ) ( not ( = ?auto_218364 ?auto_218370 ) ) ( not ( = ?auto_218364 ?auto_218371 ) ) ( not ( = ?auto_218364 ?auto_218372 ) ) ( not ( = ?auto_218364 ?auto_218373 ) ) ( not ( = ?auto_218364 ?auto_218374 ) ) ( not ( = ?auto_218364 ?auto_218375 ) ) ( not ( = ?auto_218364 ?auto_218376 ) ) ( not ( = ?auto_218365 ?auto_218366 ) ) ( not ( = ?auto_218365 ?auto_218367 ) ) ( not ( = ?auto_218365 ?auto_218368 ) ) ( not ( = ?auto_218365 ?auto_218369 ) ) ( not ( = ?auto_218365 ?auto_218370 ) ) ( not ( = ?auto_218365 ?auto_218371 ) ) ( not ( = ?auto_218365 ?auto_218372 ) ) ( not ( = ?auto_218365 ?auto_218373 ) ) ( not ( = ?auto_218365 ?auto_218374 ) ) ( not ( = ?auto_218365 ?auto_218375 ) ) ( not ( = ?auto_218365 ?auto_218376 ) ) ( not ( = ?auto_218366 ?auto_218367 ) ) ( not ( = ?auto_218366 ?auto_218368 ) ) ( not ( = ?auto_218366 ?auto_218369 ) ) ( not ( = ?auto_218366 ?auto_218370 ) ) ( not ( = ?auto_218366 ?auto_218371 ) ) ( not ( = ?auto_218366 ?auto_218372 ) ) ( not ( = ?auto_218366 ?auto_218373 ) ) ( not ( = ?auto_218366 ?auto_218374 ) ) ( not ( = ?auto_218366 ?auto_218375 ) ) ( not ( = ?auto_218366 ?auto_218376 ) ) ( not ( = ?auto_218367 ?auto_218368 ) ) ( not ( = ?auto_218367 ?auto_218369 ) ) ( not ( = ?auto_218367 ?auto_218370 ) ) ( not ( = ?auto_218367 ?auto_218371 ) ) ( not ( = ?auto_218367 ?auto_218372 ) ) ( not ( = ?auto_218367 ?auto_218373 ) ) ( not ( = ?auto_218367 ?auto_218374 ) ) ( not ( = ?auto_218367 ?auto_218375 ) ) ( not ( = ?auto_218367 ?auto_218376 ) ) ( not ( = ?auto_218368 ?auto_218369 ) ) ( not ( = ?auto_218368 ?auto_218370 ) ) ( not ( = ?auto_218368 ?auto_218371 ) ) ( not ( = ?auto_218368 ?auto_218372 ) ) ( not ( = ?auto_218368 ?auto_218373 ) ) ( not ( = ?auto_218368 ?auto_218374 ) ) ( not ( = ?auto_218368 ?auto_218375 ) ) ( not ( = ?auto_218368 ?auto_218376 ) ) ( not ( = ?auto_218369 ?auto_218370 ) ) ( not ( = ?auto_218369 ?auto_218371 ) ) ( not ( = ?auto_218369 ?auto_218372 ) ) ( not ( = ?auto_218369 ?auto_218373 ) ) ( not ( = ?auto_218369 ?auto_218374 ) ) ( not ( = ?auto_218369 ?auto_218375 ) ) ( not ( = ?auto_218369 ?auto_218376 ) ) ( not ( = ?auto_218370 ?auto_218371 ) ) ( not ( = ?auto_218370 ?auto_218372 ) ) ( not ( = ?auto_218370 ?auto_218373 ) ) ( not ( = ?auto_218370 ?auto_218374 ) ) ( not ( = ?auto_218370 ?auto_218375 ) ) ( not ( = ?auto_218370 ?auto_218376 ) ) ( not ( = ?auto_218371 ?auto_218372 ) ) ( not ( = ?auto_218371 ?auto_218373 ) ) ( not ( = ?auto_218371 ?auto_218374 ) ) ( not ( = ?auto_218371 ?auto_218375 ) ) ( not ( = ?auto_218371 ?auto_218376 ) ) ( not ( = ?auto_218372 ?auto_218373 ) ) ( not ( = ?auto_218372 ?auto_218374 ) ) ( not ( = ?auto_218372 ?auto_218375 ) ) ( not ( = ?auto_218372 ?auto_218376 ) ) ( not ( = ?auto_218373 ?auto_218374 ) ) ( not ( = ?auto_218373 ?auto_218375 ) ) ( not ( = ?auto_218373 ?auto_218376 ) ) ( not ( = ?auto_218374 ?auto_218375 ) ) ( not ( = ?auto_218374 ?auto_218376 ) ) ( not ( = ?auto_218375 ?auto_218376 ) ) ( ON ?auto_218374 ?auto_218375 ) ( ON ?auto_218373 ?auto_218374 ) ( ON ?auto_218372 ?auto_218373 ) ( ON ?auto_218371 ?auto_218372 ) ( ON ?auto_218370 ?auto_218371 ) ( CLEAR ?auto_218368 ) ( ON ?auto_218369 ?auto_218370 ) ( CLEAR ?auto_218369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_218364 ?auto_218365 ?auto_218366 ?auto_218367 ?auto_218368 ?auto_218369 )
      ( MAKE-12PILE ?auto_218364 ?auto_218365 ?auto_218366 ?auto_218367 ?auto_218368 ?auto_218369 ?auto_218370 ?auto_218371 ?auto_218372 ?auto_218373 ?auto_218374 ?auto_218375 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218389 - BLOCK
      ?auto_218390 - BLOCK
      ?auto_218391 - BLOCK
      ?auto_218392 - BLOCK
      ?auto_218393 - BLOCK
      ?auto_218394 - BLOCK
      ?auto_218395 - BLOCK
      ?auto_218396 - BLOCK
      ?auto_218397 - BLOCK
      ?auto_218398 - BLOCK
      ?auto_218399 - BLOCK
      ?auto_218400 - BLOCK
    )
    :vars
    (
      ?auto_218401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218400 ?auto_218401 ) ( ON-TABLE ?auto_218389 ) ( ON ?auto_218390 ?auto_218389 ) ( ON ?auto_218391 ?auto_218390 ) ( ON ?auto_218392 ?auto_218391 ) ( ON ?auto_218393 ?auto_218392 ) ( not ( = ?auto_218389 ?auto_218390 ) ) ( not ( = ?auto_218389 ?auto_218391 ) ) ( not ( = ?auto_218389 ?auto_218392 ) ) ( not ( = ?auto_218389 ?auto_218393 ) ) ( not ( = ?auto_218389 ?auto_218394 ) ) ( not ( = ?auto_218389 ?auto_218395 ) ) ( not ( = ?auto_218389 ?auto_218396 ) ) ( not ( = ?auto_218389 ?auto_218397 ) ) ( not ( = ?auto_218389 ?auto_218398 ) ) ( not ( = ?auto_218389 ?auto_218399 ) ) ( not ( = ?auto_218389 ?auto_218400 ) ) ( not ( = ?auto_218389 ?auto_218401 ) ) ( not ( = ?auto_218390 ?auto_218391 ) ) ( not ( = ?auto_218390 ?auto_218392 ) ) ( not ( = ?auto_218390 ?auto_218393 ) ) ( not ( = ?auto_218390 ?auto_218394 ) ) ( not ( = ?auto_218390 ?auto_218395 ) ) ( not ( = ?auto_218390 ?auto_218396 ) ) ( not ( = ?auto_218390 ?auto_218397 ) ) ( not ( = ?auto_218390 ?auto_218398 ) ) ( not ( = ?auto_218390 ?auto_218399 ) ) ( not ( = ?auto_218390 ?auto_218400 ) ) ( not ( = ?auto_218390 ?auto_218401 ) ) ( not ( = ?auto_218391 ?auto_218392 ) ) ( not ( = ?auto_218391 ?auto_218393 ) ) ( not ( = ?auto_218391 ?auto_218394 ) ) ( not ( = ?auto_218391 ?auto_218395 ) ) ( not ( = ?auto_218391 ?auto_218396 ) ) ( not ( = ?auto_218391 ?auto_218397 ) ) ( not ( = ?auto_218391 ?auto_218398 ) ) ( not ( = ?auto_218391 ?auto_218399 ) ) ( not ( = ?auto_218391 ?auto_218400 ) ) ( not ( = ?auto_218391 ?auto_218401 ) ) ( not ( = ?auto_218392 ?auto_218393 ) ) ( not ( = ?auto_218392 ?auto_218394 ) ) ( not ( = ?auto_218392 ?auto_218395 ) ) ( not ( = ?auto_218392 ?auto_218396 ) ) ( not ( = ?auto_218392 ?auto_218397 ) ) ( not ( = ?auto_218392 ?auto_218398 ) ) ( not ( = ?auto_218392 ?auto_218399 ) ) ( not ( = ?auto_218392 ?auto_218400 ) ) ( not ( = ?auto_218392 ?auto_218401 ) ) ( not ( = ?auto_218393 ?auto_218394 ) ) ( not ( = ?auto_218393 ?auto_218395 ) ) ( not ( = ?auto_218393 ?auto_218396 ) ) ( not ( = ?auto_218393 ?auto_218397 ) ) ( not ( = ?auto_218393 ?auto_218398 ) ) ( not ( = ?auto_218393 ?auto_218399 ) ) ( not ( = ?auto_218393 ?auto_218400 ) ) ( not ( = ?auto_218393 ?auto_218401 ) ) ( not ( = ?auto_218394 ?auto_218395 ) ) ( not ( = ?auto_218394 ?auto_218396 ) ) ( not ( = ?auto_218394 ?auto_218397 ) ) ( not ( = ?auto_218394 ?auto_218398 ) ) ( not ( = ?auto_218394 ?auto_218399 ) ) ( not ( = ?auto_218394 ?auto_218400 ) ) ( not ( = ?auto_218394 ?auto_218401 ) ) ( not ( = ?auto_218395 ?auto_218396 ) ) ( not ( = ?auto_218395 ?auto_218397 ) ) ( not ( = ?auto_218395 ?auto_218398 ) ) ( not ( = ?auto_218395 ?auto_218399 ) ) ( not ( = ?auto_218395 ?auto_218400 ) ) ( not ( = ?auto_218395 ?auto_218401 ) ) ( not ( = ?auto_218396 ?auto_218397 ) ) ( not ( = ?auto_218396 ?auto_218398 ) ) ( not ( = ?auto_218396 ?auto_218399 ) ) ( not ( = ?auto_218396 ?auto_218400 ) ) ( not ( = ?auto_218396 ?auto_218401 ) ) ( not ( = ?auto_218397 ?auto_218398 ) ) ( not ( = ?auto_218397 ?auto_218399 ) ) ( not ( = ?auto_218397 ?auto_218400 ) ) ( not ( = ?auto_218397 ?auto_218401 ) ) ( not ( = ?auto_218398 ?auto_218399 ) ) ( not ( = ?auto_218398 ?auto_218400 ) ) ( not ( = ?auto_218398 ?auto_218401 ) ) ( not ( = ?auto_218399 ?auto_218400 ) ) ( not ( = ?auto_218399 ?auto_218401 ) ) ( not ( = ?auto_218400 ?auto_218401 ) ) ( ON ?auto_218399 ?auto_218400 ) ( ON ?auto_218398 ?auto_218399 ) ( ON ?auto_218397 ?auto_218398 ) ( ON ?auto_218396 ?auto_218397 ) ( ON ?auto_218395 ?auto_218396 ) ( CLEAR ?auto_218393 ) ( ON ?auto_218394 ?auto_218395 ) ( CLEAR ?auto_218394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_218389 ?auto_218390 ?auto_218391 ?auto_218392 ?auto_218393 ?auto_218394 )
      ( MAKE-12PILE ?auto_218389 ?auto_218390 ?auto_218391 ?auto_218392 ?auto_218393 ?auto_218394 ?auto_218395 ?auto_218396 ?auto_218397 ?auto_218398 ?auto_218399 ?auto_218400 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218414 - BLOCK
      ?auto_218415 - BLOCK
      ?auto_218416 - BLOCK
      ?auto_218417 - BLOCK
      ?auto_218418 - BLOCK
      ?auto_218419 - BLOCK
      ?auto_218420 - BLOCK
      ?auto_218421 - BLOCK
      ?auto_218422 - BLOCK
      ?auto_218423 - BLOCK
      ?auto_218424 - BLOCK
      ?auto_218425 - BLOCK
    )
    :vars
    (
      ?auto_218426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218425 ?auto_218426 ) ( ON-TABLE ?auto_218414 ) ( ON ?auto_218415 ?auto_218414 ) ( ON ?auto_218416 ?auto_218415 ) ( ON ?auto_218417 ?auto_218416 ) ( not ( = ?auto_218414 ?auto_218415 ) ) ( not ( = ?auto_218414 ?auto_218416 ) ) ( not ( = ?auto_218414 ?auto_218417 ) ) ( not ( = ?auto_218414 ?auto_218418 ) ) ( not ( = ?auto_218414 ?auto_218419 ) ) ( not ( = ?auto_218414 ?auto_218420 ) ) ( not ( = ?auto_218414 ?auto_218421 ) ) ( not ( = ?auto_218414 ?auto_218422 ) ) ( not ( = ?auto_218414 ?auto_218423 ) ) ( not ( = ?auto_218414 ?auto_218424 ) ) ( not ( = ?auto_218414 ?auto_218425 ) ) ( not ( = ?auto_218414 ?auto_218426 ) ) ( not ( = ?auto_218415 ?auto_218416 ) ) ( not ( = ?auto_218415 ?auto_218417 ) ) ( not ( = ?auto_218415 ?auto_218418 ) ) ( not ( = ?auto_218415 ?auto_218419 ) ) ( not ( = ?auto_218415 ?auto_218420 ) ) ( not ( = ?auto_218415 ?auto_218421 ) ) ( not ( = ?auto_218415 ?auto_218422 ) ) ( not ( = ?auto_218415 ?auto_218423 ) ) ( not ( = ?auto_218415 ?auto_218424 ) ) ( not ( = ?auto_218415 ?auto_218425 ) ) ( not ( = ?auto_218415 ?auto_218426 ) ) ( not ( = ?auto_218416 ?auto_218417 ) ) ( not ( = ?auto_218416 ?auto_218418 ) ) ( not ( = ?auto_218416 ?auto_218419 ) ) ( not ( = ?auto_218416 ?auto_218420 ) ) ( not ( = ?auto_218416 ?auto_218421 ) ) ( not ( = ?auto_218416 ?auto_218422 ) ) ( not ( = ?auto_218416 ?auto_218423 ) ) ( not ( = ?auto_218416 ?auto_218424 ) ) ( not ( = ?auto_218416 ?auto_218425 ) ) ( not ( = ?auto_218416 ?auto_218426 ) ) ( not ( = ?auto_218417 ?auto_218418 ) ) ( not ( = ?auto_218417 ?auto_218419 ) ) ( not ( = ?auto_218417 ?auto_218420 ) ) ( not ( = ?auto_218417 ?auto_218421 ) ) ( not ( = ?auto_218417 ?auto_218422 ) ) ( not ( = ?auto_218417 ?auto_218423 ) ) ( not ( = ?auto_218417 ?auto_218424 ) ) ( not ( = ?auto_218417 ?auto_218425 ) ) ( not ( = ?auto_218417 ?auto_218426 ) ) ( not ( = ?auto_218418 ?auto_218419 ) ) ( not ( = ?auto_218418 ?auto_218420 ) ) ( not ( = ?auto_218418 ?auto_218421 ) ) ( not ( = ?auto_218418 ?auto_218422 ) ) ( not ( = ?auto_218418 ?auto_218423 ) ) ( not ( = ?auto_218418 ?auto_218424 ) ) ( not ( = ?auto_218418 ?auto_218425 ) ) ( not ( = ?auto_218418 ?auto_218426 ) ) ( not ( = ?auto_218419 ?auto_218420 ) ) ( not ( = ?auto_218419 ?auto_218421 ) ) ( not ( = ?auto_218419 ?auto_218422 ) ) ( not ( = ?auto_218419 ?auto_218423 ) ) ( not ( = ?auto_218419 ?auto_218424 ) ) ( not ( = ?auto_218419 ?auto_218425 ) ) ( not ( = ?auto_218419 ?auto_218426 ) ) ( not ( = ?auto_218420 ?auto_218421 ) ) ( not ( = ?auto_218420 ?auto_218422 ) ) ( not ( = ?auto_218420 ?auto_218423 ) ) ( not ( = ?auto_218420 ?auto_218424 ) ) ( not ( = ?auto_218420 ?auto_218425 ) ) ( not ( = ?auto_218420 ?auto_218426 ) ) ( not ( = ?auto_218421 ?auto_218422 ) ) ( not ( = ?auto_218421 ?auto_218423 ) ) ( not ( = ?auto_218421 ?auto_218424 ) ) ( not ( = ?auto_218421 ?auto_218425 ) ) ( not ( = ?auto_218421 ?auto_218426 ) ) ( not ( = ?auto_218422 ?auto_218423 ) ) ( not ( = ?auto_218422 ?auto_218424 ) ) ( not ( = ?auto_218422 ?auto_218425 ) ) ( not ( = ?auto_218422 ?auto_218426 ) ) ( not ( = ?auto_218423 ?auto_218424 ) ) ( not ( = ?auto_218423 ?auto_218425 ) ) ( not ( = ?auto_218423 ?auto_218426 ) ) ( not ( = ?auto_218424 ?auto_218425 ) ) ( not ( = ?auto_218424 ?auto_218426 ) ) ( not ( = ?auto_218425 ?auto_218426 ) ) ( ON ?auto_218424 ?auto_218425 ) ( ON ?auto_218423 ?auto_218424 ) ( ON ?auto_218422 ?auto_218423 ) ( ON ?auto_218421 ?auto_218422 ) ( ON ?auto_218420 ?auto_218421 ) ( ON ?auto_218419 ?auto_218420 ) ( CLEAR ?auto_218417 ) ( ON ?auto_218418 ?auto_218419 ) ( CLEAR ?auto_218418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_218414 ?auto_218415 ?auto_218416 ?auto_218417 ?auto_218418 )
      ( MAKE-12PILE ?auto_218414 ?auto_218415 ?auto_218416 ?auto_218417 ?auto_218418 ?auto_218419 ?auto_218420 ?auto_218421 ?auto_218422 ?auto_218423 ?auto_218424 ?auto_218425 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218439 - BLOCK
      ?auto_218440 - BLOCK
      ?auto_218441 - BLOCK
      ?auto_218442 - BLOCK
      ?auto_218443 - BLOCK
      ?auto_218444 - BLOCK
      ?auto_218445 - BLOCK
      ?auto_218446 - BLOCK
      ?auto_218447 - BLOCK
      ?auto_218448 - BLOCK
      ?auto_218449 - BLOCK
      ?auto_218450 - BLOCK
    )
    :vars
    (
      ?auto_218451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218450 ?auto_218451 ) ( ON-TABLE ?auto_218439 ) ( ON ?auto_218440 ?auto_218439 ) ( ON ?auto_218441 ?auto_218440 ) ( ON ?auto_218442 ?auto_218441 ) ( not ( = ?auto_218439 ?auto_218440 ) ) ( not ( = ?auto_218439 ?auto_218441 ) ) ( not ( = ?auto_218439 ?auto_218442 ) ) ( not ( = ?auto_218439 ?auto_218443 ) ) ( not ( = ?auto_218439 ?auto_218444 ) ) ( not ( = ?auto_218439 ?auto_218445 ) ) ( not ( = ?auto_218439 ?auto_218446 ) ) ( not ( = ?auto_218439 ?auto_218447 ) ) ( not ( = ?auto_218439 ?auto_218448 ) ) ( not ( = ?auto_218439 ?auto_218449 ) ) ( not ( = ?auto_218439 ?auto_218450 ) ) ( not ( = ?auto_218439 ?auto_218451 ) ) ( not ( = ?auto_218440 ?auto_218441 ) ) ( not ( = ?auto_218440 ?auto_218442 ) ) ( not ( = ?auto_218440 ?auto_218443 ) ) ( not ( = ?auto_218440 ?auto_218444 ) ) ( not ( = ?auto_218440 ?auto_218445 ) ) ( not ( = ?auto_218440 ?auto_218446 ) ) ( not ( = ?auto_218440 ?auto_218447 ) ) ( not ( = ?auto_218440 ?auto_218448 ) ) ( not ( = ?auto_218440 ?auto_218449 ) ) ( not ( = ?auto_218440 ?auto_218450 ) ) ( not ( = ?auto_218440 ?auto_218451 ) ) ( not ( = ?auto_218441 ?auto_218442 ) ) ( not ( = ?auto_218441 ?auto_218443 ) ) ( not ( = ?auto_218441 ?auto_218444 ) ) ( not ( = ?auto_218441 ?auto_218445 ) ) ( not ( = ?auto_218441 ?auto_218446 ) ) ( not ( = ?auto_218441 ?auto_218447 ) ) ( not ( = ?auto_218441 ?auto_218448 ) ) ( not ( = ?auto_218441 ?auto_218449 ) ) ( not ( = ?auto_218441 ?auto_218450 ) ) ( not ( = ?auto_218441 ?auto_218451 ) ) ( not ( = ?auto_218442 ?auto_218443 ) ) ( not ( = ?auto_218442 ?auto_218444 ) ) ( not ( = ?auto_218442 ?auto_218445 ) ) ( not ( = ?auto_218442 ?auto_218446 ) ) ( not ( = ?auto_218442 ?auto_218447 ) ) ( not ( = ?auto_218442 ?auto_218448 ) ) ( not ( = ?auto_218442 ?auto_218449 ) ) ( not ( = ?auto_218442 ?auto_218450 ) ) ( not ( = ?auto_218442 ?auto_218451 ) ) ( not ( = ?auto_218443 ?auto_218444 ) ) ( not ( = ?auto_218443 ?auto_218445 ) ) ( not ( = ?auto_218443 ?auto_218446 ) ) ( not ( = ?auto_218443 ?auto_218447 ) ) ( not ( = ?auto_218443 ?auto_218448 ) ) ( not ( = ?auto_218443 ?auto_218449 ) ) ( not ( = ?auto_218443 ?auto_218450 ) ) ( not ( = ?auto_218443 ?auto_218451 ) ) ( not ( = ?auto_218444 ?auto_218445 ) ) ( not ( = ?auto_218444 ?auto_218446 ) ) ( not ( = ?auto_218444 ?auto_218447 ) ) ( not ( = ?auto_218444 ?auto_218448 ) ) ( not ( = ?auto_218444 ?auto_218449 ) ) ( not ( = ?auto_218444 ?auto_218450 ) ) ( not ( = ?auto_218444 ?auto_218451 ) ) ( not ( = ?auto_218445 ?auto_218446 ) ) ( not ( = ?auto_218445 ?auto_218447 ) ) ( not ( = ?auto_218445 ?auto_218448 ) ) ( not ( = ?auto_218445 ?auto_218449 ) ) ( not ( = ?auto_218445 ?auto_218450 ) ) ( not ( = ?auto_218445 ?auto_218451 ) ) ( not ( = ?auto_218446 ?auto_218447 ) ) ( not ( = ?auto_218446 ?auto_218448 ) ) ( not ( = ?auto_218446 ?auto_218449 ) ) ( not ( = ?auto_218446 ?auto_218450 ) ) ( not ( = ?auto_218446 ?auto_218451 ) ) ( not ( = ?auto_218447 ?auto_218448 ) ) ( not ( = ?auto_218447 ?auto_218449 ) ) ( not ( = ?auto_218447 ?auto_218450 ) ) ( not ( = ?auto_218447 ?auto_218451 ) ) ( not ( = ?auto_218448 ?auto_218449 ) ) ( not ( = ?auto_218448 ?auto_218450 ) ) ( not ( = ?auto_218448 ?auto_218451 ) ) ( not ( = ?auto_218449 ?auto_218450 ) ) ( not ( = ?auto_218449 ?auto_218451 ) ) ( not ( = ?auto_218450 ?auto_218451 ) ) ( ON ?auto_218449 ?auto_218450 ) ( ON ?auto_218448 ?auto_218449 ) ( ON ?auto_218447 ?auto_218448 ) ( ON ?auto_218446 ?auto_218447 ) ( ON ?auto_218445 ?auto_218446 ) ( ON ?auto_218444 ?auto_218445 ) ( CLEAR ?auto_218442 ) ( ON ?auto_218443 ?auto_218444 ) ( CLEAR ?auto_218443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_218439 ?auto_218440 ?auto_218441 ?auto_218442 ?auto_218443 )
      ( MAKE-12PILE ?auto_218439 ?auto_218440 ?auto_218441 ?auto_218442 ?auto_218443 ?auto_218444 ?auto_218445 ?auto_218446 ?auto_218447 ?auto_218448 ?auto_218449 ?auto_218450 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218464 - BLOCK
      ?auto_218465 - BLOCK
      ?auto_218466 - BLOCK
      ?auto_218467 - BLOCK
      ?auto_218468 - BLOCK
      ?auto_218469 - BLOCK
      ?auto_218470 - BLOCK
      ?auto_218471 - BLOCK
      ?auto_218472 - BLOCK
      ?auto_218473 - BLOCK
      ?auto_218474 - BLOCK
      ?auto_218475 - BLOCK
    )
    :vars
    (
      ?auto_218476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218475 ?auto_218476 ) ( ON-TABLE ?auto_218464 ) ( ON ?auto_218465 ?auto_218464 ) ( ON ?auto_218466 ?auto_218465 ) ( not ( = ?auto_218464 ?auto_218465 ) ) ( not ( = ?auto_218464 ?auto_218466 ) ) ( not ( = ?auto_218464 ?auto_218467 ) ) ( not ( = ?auto_218464 ?auto_218468 ) ) ( not ( = ?auto_218464 ?auto_218469 ) ) ( not ( = ?auto_218464 ?auto_218470 ) ) ( not ( = ?auto_218464 ?auto_218471 ) ) ( not ( = ?auto_218464 ?auto_218472 ) ) ( not ( = ?auto_218464 ?auto_218473 ) ) ( not ( = ?auto_218464 ?auto_218474 ) ) ( not ( = ?auto_218464 ?auto_218475 ) ) ( not ( = ?auto_218464 ?auto_218476 ) ) ( not ( = ?auto_218465 ?auto_218466 ) ) ( not ( = ?auto_218465 ?auto_218467 ) ) ( not ( = ?auto_218465 ?auto_218468 ) ) ( not ( = ?auto_218465 ?auto_218469 ) ) ( not ( = ?auto_218465 ?auto_218470 ) ) ( not ( = ?auto_218465 ?auto_218471 ) ) ( not ( = ?auto_218465 ?auto_218472 ) ) ( not ( = ?auto_218465 ?auto_218473 ) ) ( not ( = ?auto_218465 ?auto_218474 ) ) ( not ( = ?auto_218465 ?auto_218475 ) ) ( not ( = ?auto_218465 ?auto_218476 ) ) ( not ( = ?auto_218466 ?auto_218467 ) ) ( not ( = ?auto_218466 ?auto_218468 ) ) ( not ( = ?auto_218466 ?auto_218469 ) ) ( not ( = ?auto_218466 ?auto_218470 ) ) ( not ( = ?auto_218466 ?auto_218471 ) ) ( not ( = ?auto_218466 ?auto_218472 ) ) ( not ( = ?auto_218466 ?auto_218473 ) ) ( not ( = ?auto_218466 ?auto_218474 ) ) ( not ( = ?auto_218466 ?auto_218475 ) ) ( not ( = ?auto_218466 ?auto_218476 ) ) ( not ( = ?auto_218467 ?auto_218468 ) ) ( not ( = ?auto_218467 ?auto_218469 ) ) ( not ( = ?auto_218467 ?auto_218470 ) ) ( not ( = ?auto_218467 ?auto_218471 ) ) ( not ( = ?auto_218467 ?auto_218472 ) ) ( not ( = ?auto_218467 ?auto_218473 ) ) ( not ( = ?auto_218467 ?auto_218474 ) ) ( not ( = ?auto_218467 ?auto_218475 ) ) ( not ( = ?auto_218467 ?auto_218476 ) ) ( not ( = ?auto_218468 ?auto_218469 ) ) ( not ( = ?auto_218468 ?auto_218470 ) ) ( not ( = ?auto_218468 ?auto_218471 ) ) ( not ( = ?auto_218468 ?auto_218472 ) ) ( not ( = ?auto_218468 ?auto_218473 ) ) ( not ( = ?auto_218468 ?auto_218474 ) ) ( not ( = ?auto_218468 ?auto_218475 ) ) ( not ( = ?auto_218468 ?auto_218476 ) ) ( not ( = ?auto_218469 ?auto_218470 ) ) ( not ( = ?auto_218469 ?auto_218471 ) ) ( not ( = ?auto_218469 ?auto_218472 ) ) ( not ( = ?auto_218469 ?auto_218473 ) ) ( not ( = ?auto_218469 ?auto_218474 ) ) ( not ( = ?auto_218469 ?auto_218475 ) ) ( not ( = ?auto_218469 ?auto_218476 ) ) ( not ( = ?auto_218470 ?auto_218471 ) ) ( not ( = ?auto_218470 ?auto_218472 ) ) ( not ( = ?auto_218470 ?auto_218473 ) ) ( not ( = ?auto_218470 ?auto_218474 ) ) ( not ( = ?auto_218470 ?auto_218475 ) ) ( not ( = ?auto_218470 ?auto_218476 ) ) ( not ( = ?auto_218471 ?auto_218472 ) ) ( not ( = ?auto_218471 ?auto_218473 ) ) ( not ( = ?auto_218471 ?auto_218474 ) ) ( not ( = ?auto_218471 ?auto_218475 ) ) ( not ( = ?auto_218471 ?auto_218476 ) ) ( not ( = ?auto_218472 ?auto_218473 ) ) ( not ( = ?auto_218472 ?auto_218474 ) ) ( not ( = ?auto_218472 ?auto_218475 ) ) ( not ( = ?auto_218472 ?auto_218476 ) ) ( not ( = ?auto_218473 ?auto_218474 ) ) ( not ( = ?auto_218473 ?auto_218475 ) ) ( not ( = ?auto_218473 ?auto_218476 ) ) ( not ( = ?auto_218474 ?auto_218475 ) ) ( not ( = ?auto_218474 ?auto_218476 ) ) ( not ( = ?auto_218475 ?auto_218476 ) ) ( ON ?auto_218474 ?auto_218475 ) ( ON ?auto_218473 ?auto_218474 ) ( ON ?auto_218472 ?auto_218473 ) ( ON ?auto_218471 ?auto_218472 ) ( ON ?auto_218470 ?auto_218471 ) ( ON ?auto_218469 ?auto_218470 ) ( ON ?auto_218468 ?auto_218469 ) ( CLEAR ?auto_218466 ) ( ON ?auto_218467 ?auto_218468 ) ( CLEAR ?auto_218467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_218464 ?auto_218465 ?auto_218466 ?auto_218467 )
      ( MAKE-12PILE ?auto_218464 ?auto_218465 ?auto_218466 ?auto_218467 ?auto_218468 ?auto_218469 ?auto_218470 ?auto_218471 ?auto_218472 ?auto_218473 ?auto_218474 ?auto_218475 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218489 - BLOCK
      ?auto_218490 - BLOCK
      ?auto_218491 - BLOCK
      ?auto_218492 - BLOCK
      ?auto_218493 - BLOCK
      ?auto_218494 - BLOCK
      ?auto_218495 - BLOCK
      ?auto_218496 - BLOCK
      ?auto_218497 - BLOCK
      ?auto_218498 - BLOCK
      ?auto_218499 - BLOCK
      ?auto_218500 - BLOCK
    )
    :vars
    (
      ?auto_218501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218500 ?auto_218501 ) ( ON-TABLE ?auto_218489 ) ( ON ?auto_218490 ?auto_218489 ) ( ON ?auto_218491 ?auto_218490 ) ( not ( = ?auto_218489 ?auto_218490 ) ) ( not ( = ?auto_218489 ?auto_218491 ) ) ( not ( = ?auto_218489 ?auto_218492 ) ) ( not ( = ?auto_218489 ?auto_218493 ) ) ( not ( = ?auto_218489 ?auto_218494 ) ) ( not ( = ?auto_218489 ?auto_218495 ) ) ( not ( = ?auto_218489 ?auto_218496 ) ) ( not ( = ?auto_218489 ?auto_218497 ) ) ( not ( = ?auto_218489 ?auto_218498 ) ) ( not ( = ?auto_218489 ?auto_218499 ) ) ( not ( = ?auto_218489 ?auto_218500 ) ) ( not ( = ?auto_218489 ?auto_218501 ) ) ( not ( = ?auto_218490 ?auto_218491 ) ) ( not ( = ?auto_218490 ?auto_218492 ) ) ( not ( = ?auto_218490 ?auto_218493 ) ) ( not ( = ?auto_218490 ?auto_218494 ) ) ( not ( = ?auto_218490 ?auto_218495 ) ) ( not ( = ?auto_218490 ?auto_218496 ) ) ( not ( = ?auto_218490 ?auto_218497 ) ) ( not ( = ?auto_218490 ?auto_218498 ) ) ( not ( = ?auto_218490 ?auto_218499 ) ) ( not ( = ?auto_218490 ?auto_218500 ) ) ( not ( = ?auto_218490 ?auto_218501 ) ) ( not ( = ?auto_218491 ?auto_218492 ) ) ( not ( = ?auto_218491 ?auto_218493 ) ) ( not ( = ?auto_218491 ?auto_218494 ) ) ( not ( = ?auto_218491 ?auto_218495 ) ) ( not ( = ?auto_218491 ?auto_218496 ) ) ( not ( = ?auto_218491 ?auto_218497 ) ) ( not ( = ?auto_218491 ?auto_218498 ) ) ( not ( = ?auto_218491 ?auto_218499 ) ) ( not ( = ?auto_218491 ?auto_218500 ) ) ( not ( = ?auto_218491 ?auto_218501 ) ) ( not ( = ?auto_218492 ?auto_218493 ) ) ( not ( = ?auto_218492 ?auto_218494 ) ) ( not ( = ?auto_218492 ?auto_218495 ) ) ( not ( = ?auto_218492 ?auto_218496 ) ) ( not ( = ?auto_218492 ?auto_218497 ) ) ( not ( = ?auto_218492 ?auto_218498 ) ) ( not ( = ?auto_218492 ?auto_218499 ) ) ( not ( = ?auto_218492 ?auto_218500 ) ) ( not ( = ?auto_218492 ?auto_218501 ) ) ( not ( = ?auto_218493 ?auto_218494 ) ) ( not ( = ?auto_218493 ?auto_218495 ) ) ( not ( = ?auto_218493 ?auto_218496 ) ) ( not ( = ?auto_218493 ?auto_218497 ) ) ( not ( = ?auto_218493 ?auto_218498 ) ) ( not ( = ?auto_218493 ?auto_218499 ) ) ( not ( = ?auto_218493 ?auto_218500 ) ) ( not ( = ?auto_218493 ?auto_218501 ) ) ( not ( = ?auto_218494 ?auto_218495 ) ) ( not ( = ?auto_218494 ?auto_218496 ) ) ( not ( = ?auto_218494 ?auto_218497 ) ) ( not ( = ?auto_218494 ?auto_218498 ) ) ( not ( = ?auto_218494 ?auto_218499 ) ) ( not ( = ?auto_218494 ?auto_218500 ) ) ( not ( = ?auto_218494 ?auto_218501 ) ) ( not ( = ?auto_218495 ?auto_218496 ) ) ( not ( = ?auto_218495 ?auto_218497 ) ) ( not ( = ?auto_218495 ?auto_218498 ) ) ( not ( = ?auto_218495 ?auto_218499 ) ) ( not ( = ?auto_218495 ?auto_218500 ) ) ( not ( = ?auto_218495 ?auto_218501 ) ) ( not ( = ?auto_218496 ?auto_218497 ) ) ( not ( = ?auto_218496 ?auto_218498 ) ) ( not ( = ?auto_218496 ?auto_218499 ) ) ( not ( = ?auto_218496 ?auto_218500 ) ) ( not ( = ?auto_218496 ?auto_218501 ) ) ( not ( = ?auto_218497 ?auto_218498 ) ) ( not ( = ?auto_218497 ?auto_218499 ) ) ( not ( = ?auto_218497 ?auto_218500 ) ) ( not ( = ?auto_218497 ?auto_218501 ) ) ( not ( = ?auto_218498 ?auto_218499 ) ) ( not ( = ?auto_218498 ?auto_218500 ) ) ( not ( = ?auto_218498 ?auto_218501 ) ) ( not ( = ?auto_218499 ?auto_218500 ) ) ( not ( = ?auto_218499 ?auto_218501 ) ) ( not ( = ?auto_218500 ?auto_218501 ) ) ( ON ?auto_218499 ?auto_218500 ) ( ON ?auto_218498 ?auto_218499 ) ( ON ?auto_218497 ?auto_218498 ) ( ON ?auto_218496 ?auto_218497 ) ( ON ?auto_218495 ?auto_218496 ) ( ON ?auto_218494 ?auto_218495 ) ( ON ?auto_218493 ?auto_218494 ) ( CLEAR ?auto_218491 ) ( ON ?auto_218492 ?auto_218493 ) ( CLEAR ?auto_218492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_218489 ?auto_218490 ?auto_218491 ?auto_218492 )
      ( MAKE-12PILE ?auto_218489 ?auto_218490 ?auto_218491 ?auto_218492 ?auto_218493 ?auto_218494 ?auto_218495 ?auto_218496 ?auto_218497 ?auto_218498 ?auto_218499 ?auto_218500 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218514 - BLOCK
      ?auto_218515 - BLOCK
      ?auto_218516 - BLOCK
      ?auto_218517 - BLOCK
      ?auto_218518 - BLOCK
      ?auto_218519 - BLOCK
      ?auto_218520 - BLOCK
      ?auto_218521 - BLOCK
      ?auto_218522 - BLOCK
      ?auto_218523 - BLOCK
      ?auto_218524 - BLOCK
      ?auto_218525 - BLOCK
    )
    :vars
    (
      ?auto_218526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218525 ?auto_218526 ) ( ON-TABLE ?auto_218514 ) ( ON ?auto_218515 ?auto_218514 ) ( not ( = ?auto_218514 ?auto_218515 ) ) ( not ( = ?auto_218514 ?auto_218516 ) ) ( not ( = ?auto_218514 ?auto_218517 ) ) ( not ( = ?auto_218514 ?auto_218518 ) ) ( not ( = ?auto_218514 ?auto_218519 ) ) ( not ( = ?auto_218514 ?auto_218520 ) ) ( not ( = ?auto_218514 ?auto_218521 ) ) ( not ( = ?auto_218514 ?auto_218522 ) ) ( not ( = ?auto_218514 ?auto_218523 ) ) ( not ( = ?auto_218514 ?auto_218524 ) ) ( not ( = ?auto_218514 ?auto_218525 ) ) ( not ( = ?auto_218514 ?auto_218526 ) ) ( not ( = ?auto_218515 ?auto_218516 ) ) ( not ( = ?auto_218515 ?auto_218517 ) ) ( not ( = ?auto_218515 ?auto_218518 ) ) ( not ( = ?auto_218515 ?auto_218519 ) ) ( not ( = ?auto_218515 ?auto_218520 ) ) ( not ( = ?auto_218515 ?auto_218521 ) ) ( not ( = ?auto_218515 ?auto_218522 ) ) ( not ( = ?auto_218515 ?auto_218523 ) ) ( not ( = ?auto_218515 ?auto_218524 ) ) ( not ( = ?auto_218515 ?auto_218525 ) ) ( not ( = ?auto_218515 ?auto_218526 ) ) ( not ( = ?auto_218516 ?auto_218517 ) ) ( not ( = ?auto_218516 ?auto_218518 ) ) ( not ( = ?auto_218516 ?auto_218519 ) ) ( not ( = ?auto_218516 ?auto_218520 ) ) ( not ( = ?auto_218516 ?auto_218521 ) ) ( not ( = ?auto_218516 ?auto_218522 ) ) ( not ( = ?auto_218516 ?auto_218523 ) ) ( not ( = ?auto_218516 ?auto_218524 ) ) ( not ( = ?auto_218516 ?auto_218525 ) ) ( not ( = ?auto_218516 ?auto_218526 ) ) ( not ( = ?auto_218517 ?auto_218518 ) ) ( not ( = ?auto_218517 ?auto_218519 ) ) ( not ( = ?auto_218517 ?auto_218520 ) ) ( not ( = ?auto_218517 ?auto_218521 ) ) ( not ( = ?auto_218517 ?auto_218522 ) ) ( not ( = ?auto_218517 ?auto_218523 ) ) ( not ( = ?auto_218517 ?auto_218524 ) ) ( not ( = ?auto_218517 ?auto_218525 ) ) ( not ( = ?auto_218517 ?auto_218526 ) ) ( not ( = ?auto_218518 ?auto_218519 ) ) ( not ( = ?auto_218518 ?auto_218520 ) ) ( not ( = ?auto_218518 ?auto_218521 ) ) ( not ( = ?auto_218518 ?auto_218522 ) ) ( not ( = ?auto_218518 ?auto_218523 ) ) ( not ( = ?auto_218518 ?auto_218524 ) ) ( not ( = ?auto_218518 ?auto_218525 ) ) ( not ( = ?auto_218518 ?auto_218526 ) ) ( not ( = ?auto_218519 ?auto_218520 ) ) ( not ( = ?auto_218519 ?auto_218521 ) ) ( not ( = ?auto_218519 ?auto_218522 ) ) ( not ( = ?auto_218519 ?auto_218523 ) ) ( not ( = ?auto_218519 ?auto_218524 ) ) ( not ( = ?auto_218519 ?auto_218525 ) ) ( not ( = ?auto_218519 ?auto_218526 ) ) ( not ( = ?auto_218520 ?auto_218521 ) ) ( not ( = ?auto_218520 ?auto_218522 ) ) ( not ( = ?auto_218520 ?auto_218523 ) ) ( not ( = ?auto_218520 ?auto_218524 ) ) ( not ( = ?auto_218520 ?auto_218525 ) ) ( not ( = ?auto_218520 ?auto_218526 ) ) ( not ( = ?auto_218521 ?auto_218522 ) ) ( not ( = ?auto_218521 ?auto_218523 ) ) ( not ( = ?auto_218521 ?auto_218524 ) ) ( not ( = ?auto_218521 ?auto_218525 ) ) ( not ( = ?auto_218521 ?auto_218526 ) ) ( not ( = ?auto_218522 ?auto_218523 ) ) ( not ( = ?auto_218522 ?auto_218524 ) ) ( not ( = ?auto_218522 ?auto_218525 ) ) ( not ( = ?auto_218522 ?auto_218526 ) ) ( not ( = ?auto_218523 ?auto_218524 ) ) ( not ( = ?auto_218523 ?auto_218525 ) ) ( not ( = ?auto_218523 ?auto_218526 ) ) ( not ( = ?auto_218524 ?auto_218525 ) ) ( not ( = ?auto_218524 ?auto_218526 ) ) ( not ( = ?auto_218525 ?auto_218526 ) ) ( ON ?auto_218524 ?auto_218525 ) ( ON ?auto_218523 ?auto_218524 ) ( ON ?auto_218522 ?auto_218523 ) ( ON ?auto_218521 ?auto_218522 ) ( ON ?auto_218520 ?auto_218521 ) ( ON ?auto_218519 ?auto_218520 ) ( ON ?auto_218518 ?auto_218519 ) ( ON ?auto_218517 ?auto_218518 ) ( CLEAR ?auto_218515 ) ( ON ?auto_218516 ?auto_218517 ) ( CLEAR ?auto_218516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_218514 ?auto_218515 ?auto_218516 )
      ( MAKE-12PILE ?auto_218514 ?auto_218515 ?auto_218516 ?auto_218517 ?auto_218518 ?auto_218519 ?auto_218520 ?auto_218521 ?auto_218522 ?auto_218523 ?auto_218524 ?auto_218525 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218539 - BLOCK
      ?auto_218540 - BLOCK
      ?auto_218541 - BLOCK
      ?auto_218542 - BLOCK
      ?auto_218543 - BLOCK
      ?auto_218544 - BLOCK
      ?auto_218545 - BLOCK
      ?auto_218546 - BLOCK
      ?auto_218547 - BLOCK
      ?auto_218548 - BLOCK
      ?auto_218549 - BLOCK
      ?auto_218550 - BLOCK
    )
    :vars
    (
      ?auto_218551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218550 ?auto_218551 ) ( ON-TABLE ?auto_218539 ) ( ON ?auto_218540 ?auto_218539 ) ( not ( = ?auto_218539 ?auto_218540 ) ) ( not ( = ?auto_218539 ?auto_218541 ) ) ( not ( = ?auto_218539 ?auto_218542 ) ) ( not ( = ?auto_218539 ?auto_218543 ) ) ( not ( = ?auto_218539 ?auto_218544 ) ) ( not ( = ?auto_218539 ?auto_218545 ) ) ( not ( = ?auto_218539 ?auto_218546 ) ) ( not ( = ?auto_218539 ?auto_218547 ) ) ( not ( = ?auto_218539 ?auto_218548 ) ) ( not ( = ?auto_218539 ?auto_218549 ) ) ( not ( = ?auto_218539 ?auto_218550 ) ) ( not ( = ?auto_218539 ?auto_218551 ) ) ( not ( = ?auto_218540 ?auto_218541 ) ) ( not ( = ?auto_218540 ?auto_218542 ) ) ( not ( = ?auto_218540 ?auto_218543 ) ) ( not ( = ?auto_218540 ?auto_218544 ) ) ( not ( = ?auto_218540 ?auto_218545 ) ) ( not ( = ?auto_218540 ?auto_218546 ) ) ( not ( = ?auto_218540 ?auto_218547 ) ) ( not ( = ?auto_218540 ?auto_218548 ) ) ( not ( = ?auto_218540 ?auto_218549 ) ) ( not ( = ?auto_218540 ?auto_218550 ) ) ( not ( = ?auto_218540 ?auto_218551 ) ) ( not ( = ?auto_218541 ?auto_218542 ) ) ( not ( = ?auto_218541 ?auto_218543 ) ) ( not ( = ?auto_218541 ?auto_218544 ) ) ( not ( = ?auto_218541 ?auto_218545 ) ) ( not ( = ?auto_218541 ?auto_218546 ) ) ( not ( = ?auto_218541 ?auto_218547 ) ) ( not ( = ?auto_218541 ?auto_218548 ) ) ( not ( = ?auto_218541 ?auto_218549 ) ) ( not ( = ?auto_218541 ?auto_218550 ) ) ( not ( = ?auto_218541 ?auto_218551 ) ) ( not ( = ?auto_218542 ?auto_218543 ) ) ( not ( = ?auto_218542 ?auto_218544 ) ) ( not ( = ?auto_218542 ?auto_218545 ) ) ( not ( = ?auto_218542 ?auto_218546 ) ) ( not ( = ?auto_218542 ?auto_218547 ) ) ( not ( = ?auto_218542 ?auto_218548 ) ) ( not ( = ?auto_218542 ?auto_218549 ) ) ( not ( = ?auto_218542 ?auto_218550 ) ) ( not ( = ?auto_218542 ?auto_218551 ) ) ( not ( = ?auto_218543 ?auto_218544 ) ) ( not ( = ?auto_218543 ?auto_218545 ) ) ( not ( = ?auto_218543 ?auto_218546 ) ) ( not ( = ?auto_218543 ?auto_218547 ) ) ( not ( = ?auto_218543 ?auto_218548 ) ) ( not ( = ?auto_218543 ?auto_218549 ) ) ( not ( = ?auto_218543 ?auto_218550 ) ) ( not ( = ?auto_218543 ?auto_218551 ) ) ( not ( = ?auto_218544 ?auto_218545 ) ) ( not ( = ?auto_218544 ?auto_218546 ) ) ( not ( = ?auto_218544 ?auto_218547 ) ) ( not ( = ?auto_218544 ?auto_218548 ) ) ( not ( = ?auto_218544 ?auto_218549 ) ) ( not ( = ?auto_218544 ?auto_218550 ) ) ( not ( = ?auto_218544 ?auto_218551 ) ) ( not ( = ?auto_218545 ?auto_218546 ) ) ( not ( = ?auto_218545 ?auto_218547 ) ) ( not ( = ?auto_218545 ?auto_218548 ) ) ( not ( = ?auto_218545 ?auto_218549 ) ) ( not ( = ?auto_218545 ?auto_218550 ) ) ( not ( = ?auto_218545 ?auto_218551 ) ) ( not ( = ?auto_218546 ?auto_218547 ) ) ( not ( = ?auto_218546 ?auto_218548 ) ) ( not ( = ?auto_218546 ?auto_218549 ) ) ( not ( = ?auto_218546 ?auto_218550 ) ) ( not ( = ?auto_218546 ?auto_218551 ) ) ( not ( = ?auto_218547 ?auto_218548 ) ) ( not ( = ?auto_218547 ?auto_218549 ) ) ( not ( = ?auto_218547 ?auto_218550 ) ) ( not ( = ?auto_218547 ?auto_218551 ) ) ( not ( = ?auto_218548 ?auto_218549 ) ) ( not ( = ?auto_218548 ?auto_218550 ) ) ( not ( = ?auto_218548 ?auto_218551 ) ) ( not ( = ?auto_218549 ?auto_218550 ) ) ( not ( = ?auto_218549 ?auto_218551 ) ) ( not ( = ?auto_218550 ?auto_218551 ) ) ( ON ?auto_218549 ?auto_218550 ) ( ON ?auto_218548 ?auto_218549 ) ( ON ?auto_218547 ?auto_218548 ) ( ON ?auto_218546 ?auto_218547 ) ( ON ?auto_218545 ?auto_218546 ) ( ON ?auto_218544 ?auto_218545 ) ( ON ?auto_218543 ?auto_218544 ) ( ON ?auto_218542 ?auto_218543 ) ( CLEAR ?auto_218540 ) ( ON ?auto_218541 ?auto_218542 ) ( CLEAR ?auto_218541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_218539 ?auto_218540 ?auto_218541 )
      ( MAKE-12PILE ?auto_218539 ?auto_218540 ?auto_218541 ?auto_218542 ?auto_218543 ?auto_218544 ?auto_218545 ?auto_218546 ?auto_218547 ?auto_218548 ?auto_218549 ?auto_218550 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218564 - BLOCK
      ?auto_218565 - BLOCK
      ?auto_218566 - BLOCK
      ?auto_218567 - BLOCK
      ?auto_218568 - BLOCK
      ?auto_218569 - BLOCK
      ?auto_218570 - BLOCK
      ?auto_218571 - BLOCK
      ?auto_218572 - BLOCK
      ?auto_218573 - BLOCK
      ?auto_218574 - BLOCK
      ?auto_218575 - BLOCK
    )
    :vars
    (
      ?auto_218576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218575 ?auto_218576 ) ( ON-TABLE ?auto_218564 ) ( not ( = ?auto_218564 ?auto_218565 ) ) ( not ( = ?auto_218564 ?auto_218566 ) ) ( not ( = ?auto_218564 ?auto_218567 ) ) ( not ( = ?auto_218564 ?auto_218568 ) ) ( not ( = ?auto_218564 ?auto_218569 ) ) ( not ( = ?auto_218564 ?auto_218570 ) ) ( not ( = ?auto_218564 ?auto_218571 ) ) ( not ( = ?auto_218564 ?auto_218572 ) ) ( not ( = ?auto_218564 ?auto_218573 ) ) ( not ( = ?auto_218564 ?auto_218574 ) ) ( not ( = ?auto_218564 ?auto_218575 ) ) ( not ( = ?auto_218564 ?auto_218576 ) ) ( not ( = ?auto_218565 ?auto_218566 ) ) ( not ( = ?auto_218565 ?auto_218567 ) ) ( not ( = ?auto_218565 ?auto_218568 ) ) ( not ( = ?auto_218565 ?auto_218569 ) ) ( not ( = ?auto_218565 ?auto_218570 ) ) ( not ( = ?auto_218565 ?auto_218571 ) ) ( not ( = ?auto_218565 ?auto_218572 ) ) ( not ( = ?auto_218565 ?auto_218573 ) ) ( not ( = ?auto_218565 ?auto_218574 ) ) ( not ( = ?auto_218565 ?auto_218575 ) ) ( not ( = ?auto_218565 ?auto_218576 ) ) ( not ( = ?auto_218566 ?auto_218567 ) ) ( not ( = ?auto_218566 ?auto_218568 ) ) ( not ( = ?auto_218566 ?auto_218569 ) ) ( not ( = ?auto_218566 ?auto_218570 ) ) ( not ( = ?auto_218566 ?auto_218571 ) ) ( not ( = ?auto_218566 ?auto_218572 ) ) ( not ( = ?auto_218566 ?auto_218573 ) ) ( not ( = ?auto_218566 ?auto_218574 ) ) ( not ( = ?auto_218566 ?auto_218575 ) ) ( not ( = ?auto_218566 ?auto_218576 ) ) ( not ( = ?auto_218567 ?auto_218568 ) ) ( not ( = ?auto_218567 ?auto_218569 ) ) ( not ( = ?auto_218567 ?auto_218570 ) ) ( not ( = ?auto_218567 ?auto_218571 ) ) ( not ( = ?auto_218567 ?auto_218572 ) ) ( not ( = ?auto_218567 ?auto_218573 ) ) ( not ( = ?auto_218567 ?auto_218574 ) ) ( not ( = ?auto_218567 ?auto_218575 ) ) ( not ( = ?auto_218567 ?auto_218576 ) ) ( not ( = ?auto_218568 ?auto_218569 ) ) ( not ( = ?auto_218568 ?auto_218570 ) ) ( not ( = ?auto_218568 ?auto_218571 ) ) ( not ( = ?auto_218568 ?auto_218572 ) ) ( not ( = ?auto_218568 ?auto_218573 ) ) ( not ( = ?auto_218568 ?auto_218574 ) ) ( not ( = ?auto_218568 ?auto_218575 ) ) ( not ( = ?auto_218568 ?auto_218576 ) ) ( not ( = ?auto_218569 ?auto_218570 ) ) ( not ( = ?auto_218569 ?auto_218571 ) ) ( not ( = ?auto_218569 ?auto_218572 ) ) ( not ( = ?auto_218569 ?auto_218573 ) ) ( not ( = ?auto_218569 ?auto_218574 ) ) ( not ( = ?auto_218569 ?auto_218575 ) ) ( not ( = ?auto_218569 ?auto_218576 ) ) ( not ( = ?auto_218570 ?auto_218571 ) ) ( not ( = ?auto_218570 ?auto_218572 ) ) ( not ( = ?auto_218570 ?auto_218573 ) ) ( not ( = ?auto_218570 ?auto_218574 ) ) ( not ( = ?auto_218570 ?auto_218575 ) ) ( not ( = ?auto_218570 ?auto_218576 ) ) ( not ( = ?auto_218571 ?auto_218572 ) ) ( not ( = ?auto_218571 ?auto_218573 ) ) ( not ( = ?auto_218571 ?auto_218574 ) ) ( not ( = ?auto_218571 ?auto_218575 ) ) ( not ( = ?auto_218571 ?auto_218576 ) ) ( not ( = ?auto_218572 ?auto_218573 ) ) ( not ( = ?auto_218572 ?auto_218574 ) ) ( not ( = ?auto_218572 ?auto_218575 ) ) ( not ( = ?auto_218572 ?auto_218576 ) ) ( not ( = ?auto_218573 ?auto_218574 ) ) ( not ( = ?auto_218573 ?auto_218575 ) ) ( not ( = ?auto_218573 ?auto_218576 ) ) ( not ( = ?auto_218574 ?auto_218575 ) ) ( not ( = ?auto_218574 ?auto_218576 ) ) ( not ( = ?auto_218575 ?auto_218576 ) ) ( ON ?auto_218574 ?auto_218575 ) ( ON ?auto_218573 ?auto_218574 ) ( ON ?auto_218572 ?auto_218573 ) ( ON ?auto_218571 ?auto_218572 ) ( ON ?auto_218570 ?auto_218571 ) ( ON ?auto_218569 ?auto_218570 ) ( ON ?auto_218568 ?auto_218569 ) ( ON ?auto_218567 ?auto_218568 ) ( ON ?auto_218566 ?auto_218567 ) ( CLEAR ?auto_218564 ) ( ON ?auto_218565 ?auto_218566 ) ( CLEAR ?auto_218565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_218564 ?auto_218565 )
      ( MAKE-12PILE ?auto_218564 ?auto_218565 ?auto_218566 ?auto_218567 ?auto_218568 ?auto_218569 ?auto_218570 ?auto_218571 ?auto_218572 ?auto_218573 ?auto_218574 ?auto_218575 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218589 - BLOCK
      ?auto_218590 - BLOCK
      ?auto_218591 - BLOCK
      ?auto_218592 - BLOCK
      ?auto_218593 - BLOCK
      ?auto_218594 - BLOCK
      ?auto_218595 - BLOCK
      ?auto_218596 - BLOCK
      ?auto_218597 - BLOCK
      ?auto_218598 - BLOCK
      ?auto_218599 - BLOCK
      ?auto_218600 - BLOCK
    )
    :vars
    (
      ?auto_218601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218600 ?auto_218601 ) ( ON-TABLE ?auto_218589 ) ( not ( = ?auto_218589 ?auto_218590 ) ) ( not ( = ?auto_218589 ?auto_218591 ) ) ( not ( = ?auto_218589 ?auto_218592 ) ) ( not ( = ?auto_218589 ?auto_218593 ) ) ( not ( = ?auto_218589 ?auto_218594 ) ) ( not ( = ?auto_218589 ?auto_218595 ) ) ( not ( = ?auto_218589 ?auto_218596 ) ) ( not ( = ?auto_218589 ?auto_218597 ) ) ( not ( = ?auto_218589 ?auto_218598 ) ) ( not ( = ?auto_218589 ?auto_218599 ) ) ( not ( = ?auto_218589 ?auto_218600 ) ) ( not ( = ?auto_218589 ?auto_218601 ) ) ( not ( = ?auto_218590 ?auto_218591 ) ) ( not ( = ?auto_218590 ?auto_218592 ) ) ( not ( = ?auto_218590 ?auto_218593 ) ) ( not ( = ?auto_218590 ?auto_218594 ) ) ( not ( = ?auto_218590 ?auto_218595 ) ) ( not ( = ?auto_218590 ?auto_218596 ) ) ( not ( = ?auto_218590 ?auto_218597 ) ) ( not ( = ?auto_218590 ?auto_218598 ) ) ( not ( = ?auto_218590 ?auto_218599 ) ) ( not ( = ?auto_218590 ?auto_218600 ) ) ( not ( = ?auto_218590 ?auto_218601 ) ) ( not ( = ?auto_218591 ?auto_218592 ) ) ( not ( = ?auto_218591 ?auto_218593 ) ) ( not ( = ?auto_218591 ?auto_218594 ) ) ( not ( = ?auto_218591 ?auto_218595 ) ) ( not ( = ?auto_218591 ?auto_218596 ) ) ( not ( = ?auto_218591 ?auto_218597 ) ) ( not ( = ?auto_218591 ?auto_218598 ) ) ( not ( = ?auto_218591 ?auto_218599 ) ) ( not ( = ?auto_218591 ?auto_218600 ) ) ( not ( = ?auto_218591 ?auto_218601 ) ) ( not ( = ?auto_218592 ?auto_218593 ) ) ( not ( = ?auto_218592 ?auto_218594 ) ) ( not ( = ?auto_218592 ?auto_218595 ) ) ( not ( = ?auto_218592 ?auto_218596 ) ) ( not ( = ?auto_218592 ?auto_218597 ) ) ( not ( = ?auto_218592 ?auto_218598 ) ) ( not ( = ?auto_218592 ?auto_218599 ) ) ( not ( = ?auto_218592 ?auto_218600 ) ) ( not ( = ?auto_218592 ?auto_218601 ) ) ( not ( = ?auto_218593 ?auto_218594 ) ) ( not ( = ?auto_218593 ?auto_218595 ) ) ( not ( = ?auto_218593 ?auto_218596 ) ) ( not ( = ?auto_218593 ?auto_218597 ) ) ( not ( = ?auto_218593 ?auto_218598 ) ) ( not ( = ?auto_218593 ?auto_218599 ) ) ( not ( = ?auto_218593 ?auto_218600 ) ) ( not ( = ?auto_218593 ?auto_218601 ) ) ( not ( = ?auto_218594 ?auto_218595 ) ) ( not ( = ?auto_218594 ?auto_218596 ) ) ( not ( = ?auto_218594 ?auto_218597 ) ) ( not ( = ?auto_218594 ?auto_218598 ) ) ( not ( = ?auto_218594 ?auto_218599 ) ) ( not ( = ?auto_218594 ?auto_218600 ) ) ( not ( = ?auto_218594 ?auto_218601 ) ) ( not ( = ?auto_218595 ?auto_218596 ) ) ( not ( = ?auto_218595 ?auto_218597 ) ) ( not ( = ?auto_218595 ?auto_218598 ) ) ( not ( = ?auto_218595 ?auto_218599 ) ) ( not ( = ?auto_218595 ?auto_218600 ) ) ( not ( = ?auto_218595 ?auto_218601 ) ) ( not ( = ?auto_218596 ?auto_218597 ) ) ( not ( = ?auto_218596 ?auto_218598 ) ) ( not ( = ?auto_218596 ?auto_218599 ) ) ( not ( = ?auto_218596 ?auto_218600 ) ) ( not ( = ?auto_218596 ?auto_218601 ) ) ( not ( = ?auto_218597 ?auto_218598 ) ) ( not ( = ?auto_218597 ?auto_218599 ) ) ( not ( = ?auto_218597 ?auto_218600 ) ) ( not ( = ?auto_218597 ?auto_218601 ) ) ( not ( = ?auto_218598 ?auto_218599 ) ) ( not ( = ?auto_218598 ?auto_218600 ) ) ( not ( = ?auto_218598 ?auto_218601 ) ) ( not ( = ?auto_218599 ?auto_218600 ) ) ( not ( = ?auto_218599 ?auto_218601 ) ) ( not ( = ?auto_218600 ?auto_218601 ) ) ( ON ?auto_218599 ?auto_218600 ) ( ON ?auto_218598 ?auto_218599 ) ( ON ?auto_218597 ?auto_218598 ) ( ON ?auto_218596 ?auto_218597 ) ( ON ?auto_218595 ?auto_218596 ) ( ON ?auto_218594 ?auto_218595 ) ( ON ?auto_218593 ?auto_218594 ) ( ON ?auto_218592 ?auto_218593 ) ( ON ?auto_218591 ?auto_218592 ) ( CLEAR ?auto_218589 ) ( ON ?auto_218590 ?auto_218591 ) ( CLEAR ?auto_218590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_218589 ?auto_218590 )
      ( MAKE-12PILE ?auto_218589 ?auto_218590 ?auto_218591 ?auto_218592 ?auto_218593 ?auto_218594 ?auto_218595 ?auto_218596 ?auto_218597 ?auto_218598 ?auto_218599 ?auto_218600 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218614 - BLOCK
      ?auto_218615 - BLOCK
      ?auto_218616 - BLOCK
      ?auto_218617 - BLOCK
      ?auto_218618 - BLOCK
      ?auto_218619 - BLOCK
      ?auto_218620 - BLOCK
      ?auto_218621 - BLOCK
      ?auto_218622 - BLOCK
      ?auto_218623 - BLOCK
      ?auto_218624 - BLOCK
      ?auto_218625 - BLOCK
    )
    :vars
    (
      ?auto_218626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218625 ?auto_218626 ) ( not ( = ?auto_218614 ?auto_218615 ) ) ( not ( = ?auto_218614 ?auto_218616 ) ) ( not ( = ?auto_218614 ?auto_218617 ) ) ( not ( = ?auto_218614 ?auto_218618 ) ) ( not ( = ?auto_218614 ?auto_218619 ) ) ( not ( = ?auto_218614 ?auto_218620 ) ) ( not ( = ?auto_218614 ?auto_218621 ) ) ( not ( = ?auto_218614 ?auto_218622 ) ) ( not ( = ?auto_218614 ?auto_218623 ) ) ( not ( = ?auto_218614 ?auto_218624 ) ) ( not ( = ?auto_218614 ?auto_218625 ) ) ( not ( = ?auto_218614 ?auto_218626 ) ) ( not ( = ?auto_218615 ?auto_218616 ) ) ( not ( = ?auto_218615 ?auto_218617 ) ) ( not ( = ?auto_218615 ?auto_218618 ) ) ( not ( = ?auto_218615 ?auto_218619 ) ) ( not ( = ?auto_218615 ?auto_218620 ) ) ( not ( = ?auto_218615 ?auto_218621 ) ) ( not ( = ?auto_218615 ?auto_218622 ) ) ( not ( = ?auto_218615 ?auto_218623 ) ) ( not ( = ?auto_218615 ?auto_218624 ) ) ( not ( = ?auto_218615 ?auto_218625 ) ) ( not ( = ?auto_218615 ?auto_218626 ) ) ( not ( = ?auto_218616 ?auto_218617 ) ) ( not ( = ?auto_218616 ?auto_218618 ) ) ( not ( = ?auto_218616 ?auto_218619 ) ) ( not ( = ?auto_218616 ?auto_218620 ) ) ( not ( = ?auto_218616 ?auto_218621 ) ) ( not ( = ?auto_218616 ?auto_218622 ) ) ( not ( = ?auto_218616 ?auto_218623 ) ) ( not ( = ?auto_218616 ?auto_218624 ) ) ( not ( = ?auto_218616 ?auto_218625 ) ) ( not ( = ?auto_218616 ?auto_218626 ) ) ( not ( = ?auto_218617 ?auto_218618 ) ) ( not ( = ?auto_218617 ?auto_218619 ) ) ( not ( = ?auto_218617 ?auto_218620 ) ) ( not ( = ?auto_218617 ?auto_218621 ) ) ( not ( = ?auto_218617 ?auto_218622 ) ) ( not ( = ?auto_218617 ?auto_218623 ) ) ( not ( = ?auto_218617 ?auto_218624 ) ) ( not ( = ?auto_218617 ?auto_218625 ) ) ( not ( = ?auto_218617 ?auto_218626 ) ) ( not ( = ?auto_218618 ?auto_218619 ) ) ( not ( = ?auto_218618 ?auto_218620 ) ) ( not ( = ?auto_218618 ?auto_218621 ) ) ( not ( = ?auto_218618 ?auto_218622 ) ) ( not ( = ?auto_218618 ?auto_218623 ) ) ( not ( = ?auto_218618 ?auto_218624 ) ) ( not ( = ?auto_218618 ?auto_218625 ) ) ( not ( = ?auto_218618 ?auto_218626 ) ) ( not ( = ?auto_218619 ?auto_218620 ) ) ( not ( = ?auto_218619 ?auto_218621 ) ) ( not ( = ?auto_218619 ?auto_218622 ) ) ( not ( = ?auto_218619 ?auto_218623 ) ) ( not ( = ?auto_218619 ?auto_218624 ) ) ( not ( = ?auto_218619 ?auto_218625 ) ) ( not ( = ?auto_218619 ?auto_218626 ) ) ( not ( = ?auto_218620 ?auto_218621 ) ) ( not ( = ?auto_218620 ?auto_218622 ) ) ( not ( = ?auto_218620 ?auto_218623 ) ) ( not ( = ?auto_218620 ?auto_218624 ) ) ( not ( = ?auto_218620 ?auto_218625 ) ) ( not ( = ?auto_218620 ?auto_218626 ) ) ( not ( = ?auto_218621 ?auto_218622 ) ) ( not ( = ?auto_218621 ?auto_218623 ) ) ( not ( = ?auto_218621 ?auto_218624 ) ) ( not ( = ?auto_218621 ?auto_218625 ) ) ( not ( = ?auto_218621 ?auto_218626 ) ) ( not ( = ?auto_218622 ?auto_218623 ) ) ( not ( = ?auto_218622 ?auto_218624 ) ) ( not ( = ?auto_218622 ?auto_218625 ) ) ( not ( = ?auto_218622 ?auto_218626 ) ) ( not ( = ?auto_218623 ?auto_218624 ) ) ( not ( = ?auto_218623 ?auto_218625 ) ) ( not ( = ?auto_218623 ?auto_218626 ) ) ( not ( = ?auto_218624 ?auto_218625 ) ) ( not ( = ?auto_218624 ?auto_218626 ) ) ( not ( = ?auto_218625 ?auto_218626 ) ) ( ON ?auto_218624 ?auto_218625 ) ( ON ?auto_218623 ?auto_218624 ) ( ON ?auto_218622 ?auto_218623 ) ( ON ?auto_218621 ?auto_218622 ) ( ON ?auto_218620 ?auto_218621 ) ( ON ?auto_218619 ?auto_218620 ) ( ON ?auto_218618 ?auto_218619 ) ( ON ?auto_218617 ?auto_218618 ) ( ON ?auto_218616 ?auto_218617 ) ( ON ?auto_218615 ?auto_218616 ) ( ON ?auto_218614 ?auto_218615 ) ( CLEAR ?auto_218614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_218614 )
      ( MAKE-12PILE ?auto_218614 ?auto_218615 ?auto_218616 ?auto_218617 ?auto_218618 ?auto_218619 ?auto_218620 ?auto_218621 ?auto_218622 ?auto_218623 ?auto_218624 ?auto_218625 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_218639 - BLOCK
      ?auto_218640 - BLOCK
      ?auto_218641 - BLOCK
      ?auto_218642 - BLOCK
      ?auto_218643 - BLOCK
      ?auto_218644 - BLOCK
      ?auto_218645 - BLOCK
      ?auto_218646 - BLOCK
      ?auto_218647 - BLOCK
      ?auto_218648 - BLOCK
      ?auto_218649 - BLOCK
      ?auto_218650 - BLOCK
    )
    :vars
    (
      ?auto_218651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218650 ?auto_218651 ) ( not ( = ?auto_218639 ?auto_218640 ) ) ( not ( = ?auto_218639 ?auto_218641 ) ) ( not ( = ?auto_218639 ?auto_218642 ) ) ( not ( = ?auto_218639 ?auto_218643 ) ) ( not ( = ?auto_218639 ?auto_218644 ) ) ( not ( = ?auto_218639 ?auto_218645 ) ) ( not ( = ?auto_218639 ?auto_218646 ) ) ( not ( = ?auto_218639 ?auto_218647 ) ) ( not ( = ?auto_218639 ?auto_218648 ) ) ( not ( = ?auto_218639 ?auto_218649 ) ) ( not ( = ?auto_218639 ?auto_218650 ) ) ( not ( = ?auto_218639 ?auto_218651 ) ) ( not ( = ?auto_218640 ?auto_218641 ) ) ( not ( = ?auto_218640 ?auto_218642 ) ) ( not ( = ?auto_218640 ?auto_218643 ) ) ( not ( = ?auto_218640 ?auto_218644 ) ) ( not ( = ?auto_218640 ?auto_218645 ) ) ( not ( = ?auto_218640 ?auto_218646 ) ) ( not ( = ?auto_218640 ?auto_218647 ) ) ( not ( = ?auto_218640 ?auto_218648 ) ) ( not ( = ?auto_218640 ?auto_218649 ) ) ( not ( = ?auto_218640 ?auto_218650 ) ) ( not ( = ?auto_218640 ?auto_218651 ) ) ( not ( = ?auto_218641 ?auto_218642 ) ) ( not ( = ?auto_218641 ?auto_218643 ) ) ( not ( = ?auto_218641 ?auto_218644 ) ) ( not ( = ?auto_218641 ?auto_218645 ) ) ( not ( = ?auto_218641 ?auto_218646 ) ) ( not ( = ?auto_218641 ?auto_218647 ) ) ( not ( = ?auto_218641 ?auto_218648 ) ) ( not ( = ?auto_218641 ?auto_218649 ) ) ( not ( = ?auto_218641 ?auto_218650 ) ) ( not ( = ?auto_218641 ?auto_218651 ) ) ( not ( = ?auto_218642 ?auto_218643 ) ) ( not ( = ?auto_218642 ?auto_218644 ) ) ( not ( = ?auto_218642 ?auto_218645 ) ) ( not ( = ?auto_218642 ?auto_218646 ) ) ( not ( = ?auto_218642 ?auto_218647 ) ) ( not ( = ?auto_218642 ?auto_218648 ) ) ( not ( = ?auto_218642 ?auto_218649 ) ) ( not ( = ?auto_218642 ?auto_218650 ) ) ( not ( = ?auto_218642 ?auto_218651 ) ) ( not ( = ?auto_218643 ?auto_218644 ) ) ( not ( = ?auto_218643 ?auto_218645 ) ) ( not ( = ?auto_218643 ?auto_218646 ) ) ( not ( = ?auto_218643 ?auto_218647 ) ) ( not ( = ?auto_218643 ?auto_218648 ) ) ( not ( = ?auto_218643 ?auto_218649 ) ) ( not ( = ?auto_218643 ?auto_218650 ) ) ( not ( = ?auto_218643 ?auto_218651 ) ) ( not ( = ?auto_218644 ?auto_218645 ) ) ( not ( = ?auto_218644 ?auto_218646 ) ) ( not ( = ?auto_218644 ?auto_218647 ) ) ( not ( = ?auto_218644 ?auto_218648 ) ) ( not ( = ?auto_218644 ?auto_218649 ) ) ( not ( = ?auto_218644 ?auto_218650 ) ) ( not ( = ?auto_218644 ?auto_218651 ) ) ( not ( = ?auto_218645 ?auto_218646 ) ) ( not ( = ?auto_218645 ?auto_218647 ) ) ( not ( = ?auto_218645 ?auto_218648 ) ) ( not ( = ?auto_218645 ?auto_218649 ) ) ( not ( = ?auto_218645 ?auto_218650 ) ) ( not ( = ?auto_218645 ?auto_218651 ) ) ( not ( = ?auto_218646 ?auto_218647 ) ) ( not ( = ?auto_218646 ?auto_218648 ) ) ( not ( = ?auto_218646 ?auto_218649 ) ) ( not ( = ?auto_218646 ?auto_218650 ) ) ( not ( = ?auto_218646 ?auto_218651 ) ) ( not ( = ?auto_218647 ?auto_218648 ) ) ( not ( = ?auto_218647 ?auto_218649 ) ) ( not ( = ?auto_218647 ?auto_218650 ) ) ( not ( = ?auto_218647 ?auto_218651 ) ) ( not ( = ?auto_218648 ?auto_218649 ) ) ( not ( = ?auto_218648 ?auto_218650 ) ) ( not ( = ?auto_218648 ?auto_218651 ) ) ( not ( = ?auto_218649 ?auto_218650 ) ) ( not ( = ?auto_218649 ?auto_218651 ) ) ( not ( = ?auto_218650 ?auto_218651 ) ) ( ON ?auto_218649 ?auto_218650 ) ( ON ?auto_218648 ?auto_218649 ) ( ON ?auto_218647 ?auto_218648 ) ( ON ?auto_218646 ?auto_218647 ) ( ON ?auto_218645 ?auto_218646 ) ( ON ?auto_218644 ?auto_218645 ) ( ON ?auto_218643 ?auto_218644 ) ( ON ?auto_218642 ?auto_218643 ) ( ON ?auto_218641 ?auto_218642 ) ( ON ?auto_218640 ?auto_218641 ) ( ON ?auto_218639 ?auto_218640 ) ( CLEAR ?auto_218639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_218639 )
      ( MAKE-12PILE ?auto_218639 ?auto_218640 ?auto_218641 ?auto_218642 ?auto_218643 ?auto_218644 ?auto_218645 ?auto_218646 ?auto_218647 ?auto_218648 ?auto_218649 ?auto_218650 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218665 - BLOCK
      ?auto_218666 - BLOCK
      ?auto_218667 - BLOCK
      ?auto_218668 - BLOCK
      ?auto_218669 - BLOCK
      ?auto_218670 - BLOCK
      ?auto_218671 - BLOCK
      ?auto_218672 - BLOCK
      ?auto_218673 - BLOCK
      ?auto_218674 - BLOCK
      ?auto_218675 - BLOCK
      ?auto_218676 - BLOCK
      ?auto_218677 - BLOCK
    )
    :vars
    (
      ?auto_218678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_218676 ) ( ON ?auto_218677 ?auto_218678 ) ( CLEAR ?auto_218677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_218665 ) ( ON ?auto_218666 ?auto_218665 ) ( ON ?auto_218667 ?auto_218666 ) ( ON ?auto_218668 ?auto_218667 ) ( ON ?auto_218669 ?auto_218668 ) ( ON ?auto_218670 ?auto_218669 ) ( ON ?auto_218671 ?auto_218670 ) ( ON ?auto_218672 ?auto_218671 ) ( ON ?auto_218673 ?auto_218672 ) ( ON ?auto_218674 ?auto_218673 ) ( ON ?auto_218675 ?auto_218674 ) ( ON ?auto_218676 ?auto_218675 ) ( not ( = ?auto_218665 ?auto_218666 ) ) ( not ( = ?auto_218665 ?auto_218667 ) ) ( not ( = ?auto_218665 ?auto_218668 ) ) ( not ( = ?auto_218665 ?auto_218669 ) ) ( not ( = ?auto_218665 ?auto_218670 ) ) ( not ( = ?auto_218665 ?auto_218671 ) ) ( not ( = ?auto_218665 ?auto_218672 ) ) ( not ( = ?auto_218665 ?auto_218673 ) ) ( not ( = ?auto_218665 ?auto_218674 ) ) ( not ( = ?auto_218665 ?auto_218675 ) ) ( not ( = ?auto_218665 ?auto_218676 ) ) ( not ( = ?auto_218665 ?auto_218677 ) ) ( not ( = ?auto_218665 ?auto_218678 ) ) ( not ( = ?auto_218666 ?auto_218667 ) ) ( not ( = ?auto_218666 ?auto_218668 ) ) ( not ( = ?auto_218666 ?auto_218669 ) ) ( not ( = ?auto_218666 ?auto_218670 ) ) ( not ( = ?auto_218666 ?auto_218671 ) ) ( not ( = ?auto_218666 ?auto_218672 ) ) ( not ( = ?auto_218666 ?auto_218673 ) ) ( not ( = ?auto_218666 ?auto_218674 ) ) ( not ( = ?auto_218666 ?auto_218675 ) ) ( not ( = ?auto_218666 ?auto_218676 ) ) ( not ( = ?auto_218666 ?auto_218677 ) ) ( not ( = ?auto_218666 ?auto_218678 ) ) ( not ( = ?auto_218667 ?auto_218668 ) ) ( not ( = ?auto_218667 ?auto_218669 ) ) ( not ( = ?auto_218667 ?auto_218670 ) ) ( not ( = ?auto_218667 ?auto_218671 ) ) ( not ( = ?auto_218667 ?auto_218672 ) ) ( not ( = ?auto_218667 ?auto_218673 ) ) ( not ( = ?auto_218667 ?auto_218674 ) ) ( not ( = ?auto_218667 ?auto_218675 ) ) ( not ( = ?auto_218667 ?auto_218676 ) ) ( not ( = ?auto_218667 ?auto_218677 ) ) ( not ( = ?auto_218667 ?auto_218678 ) ) ( not ( = ?auto_218668 ?auto_218669 ) ) ( not ( = ?auto_218668 ?auto_218670 ) ) ( not ( = ?auto_218668 ?auto_218671 ) ) ( not ( = ?auto_218668 ?auto_218672 ) ) ( not ( = ?auto_218668 ?auto_218673 ) ) ( not ( = ?auto_218668 ?auto_218674 ) ) ( not ( = ?auto_218668 ?auto_218675 ) ) ( not ( = ?auto_218668 ?auto_218676 ) ) ( not ( = ?auto_218668 ?auto_218677 ) ) ( not ( = ?auto_218668 ?auto_218678 ) ) ( not ( = ?auto_218669 ?auto_218670 ) ) ( not ( = ?auto_218669 ?auto_218671 ) ) ( not ( = ?auto_218669 ?auto_218672 ) ) ( not ( = ?auto_218669 ?auto_218673 ) ) ( not ( = ?auto_218669 ?auto_218674 ) ) ( not ( = ?auto_218669 ?auto_218675 ) ) ( not ( = ?auto_218669 ?auto_218676 ) ) ( not ( = ?auto_218669 ?auto_218677 ) ) ( not ( = ?auto_218669 ?auto_218678 ) ) ( not ( = ?auto_218670 ?auto_218671 ) ) ( not ( = ?auto_218670 ?auto_218672 ) ) ( not ( = ?auto_218670 ?auto_218673 ) ) ( not ( = ?auto_218670 ?auto_218674 ) ) ( not ( = ?auto_218670 ?auto_218675 ) ) ( not ( = ?auto_218670 ?auto_218676 ) ) ( not ( = ?auto_218670 ?auto_218677 ) ) ( not ( = ?auto_218670 ?auto_218678 ) ) ( not ( = ?auto_218671 ?auto_218672 ) ) ( not ( = ?auto_218671 ?auto_218673 ) ) ( not ( = ?auto_218671 ?auto_218674 ) ) ( not ( = ?auto_218671 ?auto_218675 ) ) ( not ( = ?auto_218671 ?auto_218676 ) ) ( not ( = ?auto_218671 ?auto_218677 ) ) ( not ( = ?auto_218671 ?auto_218678 ) ) ( not ( = ?auto_218672 ?auto_218673 ) ) ( not ( = ?auto_218672 ?auto_218674 ) ) ( not ( = ?auto_218672 ?auto_218675 ) ) ( not ( = ?auto_218672 ?auto_218676 ) ) ( not ( = ?auto_218672 ?auto_218677 ) ) ( not ( = ?auto_218672 ?auto_218678 ) ) ( not ( = ?auto_218673 ?auto_218674 ) ) ( not ( = ?auto_218673 ?auto_218675 ) ) ( not ( = ?auto_218673 ?auto_218676 ) ) ( not ( = ?auto_218673 ?auto_218677 ) ) ( not ( = ?auto_218673 ?auto_218678 ) ) ( not ( = ?auto_218674 ?auto_218675 ) ) ( not ( = ?auto_218674 ?auto_218676 ) ) ( not ( = ?auto_218674 ?auto_218677 ) ) ( not ( = ?auto_218674 ?auto_218678 ) ) ( not ( = ?auto_218675 ?auto_218676 ) ) ( not ( = ?auto_218675 ?auto_218677 ) ) ( not ( = ?auto_218675 ?auto_218678 ) ) ( not ( = ?auto_218676 ?auto_218677 ) ) ( not ( = ?auto_218676 ?auto_218678 ) ) ( not ( = ?auto_218677 ?auto_218678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_218677 ?auto_218678 )
      ( !STACK ?auto_218677 ?auto_218676 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218692 - BLOCK
      ?auto_218693 - BLOCK
      ?auto_218694 - BLOCK
      ?auto_218695 - BLOCK
      ?auto_218696 - BLOCK
      ?auto_218697 - BLOCK
      ?auto_218698 - BLOCK
      ?auto_218699 - BLOCK
      ?auto_218700 - BLOCK
      ?auto_218701 - BLOCK
      ?auto_218702 - BLOCK
      ?auto_218703 - BLOCK
      ?auto_218704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_218703 ) ( ON-TABLE ?auto_218704 ) ( CLEAR ?auto_218704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_218692 ) ( ON ?auto_218693 ?auto_218692 ) ( ON ?auto_218694 ?auto_218693 ) ( ON ?auto_218695 ?auto_218694 ) ( ON ?auto_218696 ?auto_218695 ) ( ON ?auto_218697 ?auto_218696 ) ( ON ?auto_218698 ?auto_218697 ) ( ON ?auto_218699 ?auto_218698 ) ( ON ?auto_218700 ?auto_218699 ) ( ON ?auto_218701 ?auto_218700 ) ( ON ?auto_218702 ?auto_218701 ) ( ON ?auto_218703 ?auto_218702 ) ( not ( = ?auto_218692 ?auto_218693 ) ) ( not ( = ?auto_218692 ?auto_218694 ) ) ( not ( = ?auto_218692 ?auto_218695 ) ) ( not ( = ?auto_218692 ?auto_218696 ) ) ( not ( = ?auto_218692 ?auto_218697 ) ) ( not ( = ?auto_218692 ?auto_218698 ) ) ( not ( = ?auto_218692 ?auto_218699 ) ) ( not ( = ?auto_218692 ?auto_218700 ) ) ( not ( = ?auto_218692 ?auto_218701 ) ) ( not ( = ?auto_218692 ?auto_218702 ) ) ( not ( = ?auto_218692 ?auto_218703 ) ) ( not ( = ?auto_218692 ?auto_218704 ) ) ( not ( = ?auto_218693 ?auto_218694 ) ) ( not ( = ?auto_218693 ?auto_218695 ) ) ( not ( = ?auto_218693 ?auto_218696 ) ) ( not ( = ?auto_218693 ?auto_218697 ) ) ( not ( = ?auto_218693 ?auto_218698 ) ) ( not ( = ?auto_218693 ?auto_218699 ) ) ( not ( = ?auto_218693 ?auto_218700 ) ) ( not ( = ?auto_218693 ?auto_218701 ) ) ( not ( = ?auto_218693 ?auto_218702 ) ) ( not ( = ?auto_218693 ?auto_218703 ) ) ( not ( = ?auto_218693 ?auto_218704 ) ) ( not ( = ?auto_218694 ?auto_218695 ) ) ( not ( = ?auto_218694 ?auto_218696 ) ) ( not ( = ?auto_218694 ?auto_218697 ) ) ( not ( = ?auto_218694 ?auto_218698 ) ) ( not ( = ?auto_218694 ?auto_218699 ) ) ( not ( = ?auto_218694 ?auto_218700 ) ) ( not ( = ?auto_218694 ?auto_218701 ) ) ( not ( = ?auto_218694 ?auto_218702 ) ) ( not ( = ?auto_218694 ?auto_218703 ) ) ( not ( = ?auto_218694 ?auto_218704 ) ) ( not ( = ?auto_218695 ?auto_218696 ) ) ( not ( = ?auto_218695 ?auto_218697 ) ) ( not ( = ?auto_218695 ?auto_218698 ) ) ( not ( = ?auto_218695 ?auto_218699 ) ) ( not ( = ?auto_218695 ?auto_218700 ) ) ( not ( = ?auto_218695 ?auto_218701 ) ) ( not ( = ?auto_218695 ?auto_218702 ) ) ( not ( = ?auto_218695 ?auto_218703 ) ) ( not ( = ?auto_218695 ?auto_218704 ) ) ( not ( = ?auto_218696 ?auto_218697 ) ) ( not ( = ?auto_218696 ?auto_218698 ) ) ( not ( = ?auto_218696 ?auto_218699 ) ) ( not ( = ?auto_218696 ?auto_218700 ) ) ( not ( = ?auto_218696 ?auto_218701 ) ) ( not ( = ?auto_218696 ?auto_218702 ) ) ( not ( = ?auto_218696 ?auto_218703 ) ) ( not ( = ?auto_218696 ?auto_218704 ) ) ( not ( = ?auto_218697 ?auto_218698 ) ) ( not ( = ?auto_218697 ?auto_218699 ) ) ( not ( = ?auto_218697 ?auto_218700 ) ) ( not ( = ?auto_218697 ?auto_218701 ) ) ( not ( = ?auto_218697 ?auto_218702 ) ) ( not ( = ?auto_218697 ?auto_218703 ) ) ( not ( = ?auto_218697 ?auto_218704 ) ) ( not ( = ?auto_218698 ?auto_218699 ) ) ( not ( = ?auto_218698 ?auto_218700 ) ) ( not ( = ?auto_218698 ?auto_218701 ) ) ( not ( = ?auto_218698 ?auto_218702 ) ) ( not ( = ?auto_218698 ?auto_218703 ) ) ( not ( = ?auto_218698 ?auto_218704 ) ) ( not ( = ?auto_218699 ?auto_218700 ) ) ( not ( = ?auto_218699 ?auto_218701 ) ) ( not ( = ?auto_218699 ?auto_218702 ) ) ( not ( = ?auto_218699 ?auto_218703 ) ) ( not ( = ?auto_218699 ?auto_218704 ) ) ( not ( = ?auto_218700 ?auto_218701 ) ) ( not ( = ?auto_218700 ?auto_218702 ) ) ( not ( = ?auto_218700 ?auto_218703 ) ) ( not ( = ?auto_218700 ?auto_218704 ) ) ( not ( = ?auto_218701 ?auto_218702 ) ) ( not ( = ?auto_218701 ?auto_218703 ) ) ( not ( = ?auto_218701 ?auto_218704 ) ) ( not ( = ?auto_218702 ?auto_218703 ) ) ( not ( = ?auto_218702 ?auto_218704 ) ) ( not ( = ?auto_218703 ?auto_218704 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_218704 )
      ( !STACK ?auto_218704 ?auto_218703 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218718 - BLOCK
      ?auto_218719 - BLOCK
      ?auto_218720 - BLOCK
      ?auto_218721 - BLOCK
      ?auto_218722 - BLOCK
      ?auto_218723 - BLOCK
      ?auto_218724 - BLOCK
      ?auto_218725 - BLOCK
      ?auto_218726 - BLOCK
      ?auto_218727 - BLOCK
      ?auto_218728 - BLOCK
      ?auto_218729 - BLOCK
      ?auto_218730 - BLOCK
    )
    :vars
    (
      ?auto_218731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218730 ?auto_218731 ) ( ON-TABLE ?auto_218718 ) ( ON ?auto_218719 ?auto_218718 ) ( ON ?auto_218720 ?auto_218719 ) ( ON ?auto_218721 ?auto_218720 ) ( ON ?auto_218722 ?auto_218721 ) ( ON ?auto_218723 ?auto_218722 ) ( ON ?auto_218724 ?auto_218723 ) ( ON ?auto_218725 ?auto_218724 ) ( ON ?auto_218726 ?auto_218725 ) ( ON ?auto_218727 ?auto_218726 ) ( ON ?auto_218728 ?auto_218727 ) ( not ( = ?auto_218718 ?auto_218719 ) ) ( not ( = ?auto_218718 ?auto_218720 ) ) ( not ( = ?auto_218718 ?auto_218721 ) ) ( not ( = ?auto_218718 ?auto_218722 ) ) ( not ( = ?auto_218718 ?auto_218723 ) ) ( not ( = ?auto_218718 ?auto_218724 ) ) ( not ( = ?auto_218718 ?auto_218725 ) ) ( not ( = ?auto_218718 ?auto_218726 ) ) ( not ( = ?auto_218718 ?auto_218727 ) ) ( not ( = ?auto_218718 ?auto_218728 ) ) ( not ( = ?auto_218718 ?auto_218729 ) ) ( not ( = ?auto_218718 ?auto_218730 ) ) ( not ( = ?auto_218718 ?auto_218731 ) ) ( not ( = ?auto_218719 ?auto_218720 ) ) ( not ( = ?auto_218719 ?auto_218721 ) ) ( not ( = ?auto_218719 ?auto_218722 ) ) ( not ( = ?auto_218719 ?auto_218723 ) ) ( not ( = ?auto_218719 ?auto_218724 ) ) ( not ( = ?auto_218719 ?auto_218725 ) ) ( not ( = ?auto_218719 ?auto_218726 ) ) ( not ( = ?auto_218719 ?auto_218727 ) ) ( not ( = ?auto_218719 ?auto_218728 ) ) ( not ( = ?auto_218719 ?auto_218729 ) ) ( not ( = ?auto_218719 ?auto_218730 ) ) ( not ( = ?auto_218719 ?auto_218731 ) ) ( not ( = ?auto_218720 ?auto_218721 ) ) ( not ( = ?auto_218720 ?auto_218722 ) ) ( not ( = ?auto_218720 ?auto_218723 ) ) ( not ( = ?auto_218720 ?auto_218724 ) ) ( not ( = ?auto_218720 ?auto_218725 ) ) ( not ( = ?auto_218720 ?auto_218726 ) ) ( not ( = ?auto_218720 ?auto_218727 ) ) ( not ( = ?auto_218720 ?auto_218728 ) ) ( not ( = ?auto_218720 ?auto_218729 ) ) ( not ( = ?auto_218720 ?auto_218730 ) ) ( not ( = ?auto_218720 ?auto_218731 ) ) ( not ( = ?auto_218721 ?auto_218722 ) ) ( not ( = ?auto_218721 ?auto_218723 ) ) ( not ( = ?auto_218721 ?auto_218724 ) ) ( not ( = ?auto_218721 ?auto_218725 ) ) ( not ( = ?auto_218721 ?auto_218726 ) ) ( not ( = ?auto_218721 ?auto_218727 ) ) ( not ( = ?auto_218721 ?auto_218728 ) ) ( not ( = ?auto_218721 ?auto_218729 ) ) ( not ( = ?auto_218721 ?auto_218730 ) ) ( not ( = ?auto_218721 ?auto_218731 ) ) ( not ( = ?auto_218722 ?auto_218723 ) ) ( not ( = ?auto_218722 ?auto_218724 ) ) ( not ( = ?auto_218722 ?auto_218725 ) ) ( not ( = ?auto_218722 ?auto_218726 ) ) ( not ( = ?auto_218722 ?auto_218727 ) ) ( not ( = ?auto_218722 ?auto_218728 ) ) ( not ( = ?auto_218722 ?auto_218729 ) ) ( not ( = ?auto_218722 ?auto_218730 ) ) ( not ( = ?auto_218722 ?auto_218731 ) ) ( not ( = ?auto_218723 ?auto_218724 ) ) ( not ( = ?auto_218723 ?auto_218725 ) ) ( not ( = ?auto_218723 ?auto_218726 ) ) ( not ( = ?auto_218723 ?auto_218727 ) ) ( not ( = ?auto_218723 ?auto_218728 ) ) ( not ( = ?auto_218723 ?auto_218729 ) ) ( not ( = ?auto_218723 ?auto_218730 ) ) ( not ( = ?auto_218723 ?auto_218731 ) ) ( not ( = ?auto_218724 ?auto_218725 ) ) ( not ( = ?auto_218724 ?auto_218726 ) ) ( not ( = ?auto_218724 ?auto_218727 ) ) ( not ( = ?auto_218724 ?auto_218728 ) ) ( not ( = ?auto_218724 ?auto_218729 ) ) ( not ( = ?auto_218724 ?auto_218730 ) ) ( not ( = ?auto_218724 ?auto_218731 ) ) ( not ( = ?auto_218725 ?auto_218726 ) ) ( not ( = ?auto_218725 ?auto_218727 ) ) ( not ( = ?auto_218725 ?auto_218728 ) ) ( not ( = ?auto_218725 ?auto_218729 ) ) ( not ( = ?auto_218725 ?auto_218730 ) ) ( not ( = ?auto_218725 ?auto_218731 ) ) ( not ( = ?auto_218726 ?auto_218727 ) ) ( not ( = ?auto_218726 ?auto_218728 ) ) ( not ( = ?auto_218726 ?auto_218729 ) ) ( not ( = ?auto_218726 ?auto_218730 ) ) ( not ( = ?auto_218726 ?auto_218731 ) ) ( not ( = ?auto_218727 ?auto_218728 ) ) ( not ( = ?auto_218727 ?auto_218729 ) ) ( not ( = ?auto_218727 ?auto_218730 ) ) ( not ( = ?auto_218727 ?auto_218731 ) ) ( not ( = ?auto_218728 ?auto_218729 ) ) ( not ( = ?auto_218728 ?auto_218730 ) ) ( not ( = ?auto_218728 ?auto_218731 ) ) ( not ( = ?auto_218729 ?auto_218730 ) ) ( not ( = ?auto_218729 ?auto_218731 ) ) ( not ( = ?auto_218730 ?auto_218731 ) ) ( CLEAR ?auto_218728 ) ( ON ?auto_218729 ?auto_218730 ) ( CLEAR ?auto_218729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_218718 ?auto_218719 ?auto_218720 ?auto_218721 ?auto_218722 ?auto_218723 ?auto_218724 ?auto_218725 ?auto_218726 ?auto_218727 ?auto_218728 ?auto_218729 )
      ( MAKE-13PILE ?auto_218718 ?auto_218719 ?auto_218720 ?auto_218721 ?auto_218722 ?auto_218723 ?auto_218724 ?auto_218725 ?auto_218726 ?auto_218727 ?auto_218728 ?auto_218729 ?auto_218730 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218745 - BLOCK
      ?auto_218746 - BLOCK
      ?auto_218747 - BLOCK
      ?auto_218748 - BLOCK
      ?auto_218749 - BLOCK
      ?auto_218750 - BLOCK
      ?auto_218751 - BLOCK
      ?auto_218752 - BLOCK
      ?auto_218753 - BLOCK
      ?auto_218754 - BLOCK
      ?auto_218755 - BLOCK
      ?auto_218756 - BLOCK
      ?auto_218757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_218757 ) ( ON-TABLE ?auto_218745 ) ( ON ?auto_218746 ?auto_218745 ) ( ON ?auto_218747 ?auto_218746 ) ( ON ?auto_218748 ?auto_218747 ) ( ON ?auto_218749 ?auto_218748 ) ( ON ?auto_218750 ?auto_218749 ) ( ON ?auto_218751 ?auto_218750 ) ( ON ?auto_218752 ?auto_218751 ) ( ON ?auto_218753 ?auto_218752 ) ( ON ?auto_218754 ?auto_218753 ) ( ON ?auto_218755 ?auto_218754 ) ( not ( = ?auto_218745 ?auto_218746 ) ) ( not ( = ?auto_218745 ?auto_218747 ) ) ( not ( = ?auto_218745 ?auto_218748 ) ) ( not ( = ?auto_218745 ?auto_218749 ) ) ( not ( = ?auto_218745 ?auto_218750 ) ) ( not ( = ?auto_218745 ?auto_218751 ) ) ( not ( = ?auto_218745 ?auto_218752 ) ) ( not ( = ?auto_218745 ?auto_218753 ) ) ( not ( = ?auto_218745 ?auto_218754 ) ) ( not ( = ?auto_218745 ?auto_218755 ) ) ( not ( = ?auto_218745 ?auto_218756 ) ) ( not ( = ?auto_218745 ?auto_218757 ) ) ( not ( = ?auto_218746 ?auto_218747 ) ) ( not ( = ?auto_218746 ?auto_218748 ) ) ( not ( = ?auto_218746 ?auto_218749 ) ) ( not ( = ?auto_218746 ?auto_218750 ) ) ( not ( = ?auto_218746 ?auto_218751 ) ) ( not ( = ?auto_218746 ?auto_218752 ) ) ( not ( = ?auto_218746 ?auto_218753 ) ) ( not ( = ?auto_218746 ?auto_218754 ) ) ( not ( = ?auto_218746 ?auto_218755 ) ) ( not ( = ?auto_218746 ?auto_218756 ) ) ( not ( = ?auto_218746 ?auto_218757 ) ) ( not ( = ?auto_218747 ?auto_218748 ) ) ( not ( = ?auto_218747 ?auto_218749 ) ) ( not ( = ?auto_218747 ?auto_218750 ) ) ( not ( = ?auto_218747 ?auto_218751 ) ) ( not ( = ?auto_218747 ?auto_218752 ) ) ( not ( = ?auto_218747 ?auto_218753 ) ) ( not ( = ?auto_218747 ?auto_218754 ) ) ( not ( = ?auto_218747 ?auto_218755 ) ) ( not ( = ?auto_218747 ?auto_218756 ) ) ( not ( = ?auto_218747 ?auto_218757 ) ) ( not ( = ?auto_218748 ?auto_218749 ) ) ( not ( = ?auto_218748 ?auto_218750 ) ) ( not ( = ?auto_218748 ?auto_218751 ) ) ( not ( = ?auto_218748 ?auto_218752 ) ) ( not ( = ?auto_218748 ?auto_218753 ) ) ( not ( = ?auto_218748 ?auto_218754 ) ) ( not ( = ?auto_218748 ?auto_218755 ) ) ( not ( = ?auto_218748 ?auto_218756 ) ) ( not ( = ?auto_218748 ?auto_218757 ) ) ( not ( = ?auto_218749 ?auto_218750 ) ) ( not ( = ?auto_218749 ?auto_218751 ) ) ( not ( = ?auto_218749 ?auto_218752 ) ) ( not ( = ?auto_218749 ?auto_218753 ) ) ( not ( = ?auto_218749 ?auto_218754 ) ) ( not ( = ?auto_218749 ?auto_218755 ) ) ( not ( = ?auto_218749 ?auto_218756 ) ) ( not ( = ?auto_218749 ?auto_218757 ) ) ( not ( = ?auto_218750 ?auto_218751 ) ) ( not ( = ?auto_218750 ?auto_218752 ) ) ( not ( = ?auto_218750 ?auto_218753 ) ) ( not ( = ?auto_218750 ?auto_218754 ) ) ( not ( = ?auto_218750 ?auto_218755 ) ) ( not ( = ?auto_218750 ?auto_218756 ) ) ( not ( = ?auto_218750 ?auto_218757 ) ) ( not ( = ?auto_218751 ?auto_218752 ) ) ( not ( = ?auto_218751 ?auto_218753 ) ) ( not ( = ?auto_218751 ?auto_218754 ) ) ( not ( = ?auto_218751 ?auto_218755 ) ) ( not ( = ?auto_218751 ?auto_218756 ) ) ( not ( = ?auto_218751 ?auto_218757 ) ) ( not ( = ?auto_218752 ?auto_218753 ) ) ( not ( = ?auto_218752 ?auto_218754 ) ) ( not ( = ?auto_218752 ?auto_218755 ) ) ( not ( = ?auto_218752 ?auto_218756 ) ) ( not ( = ?auto_218752 ?auto_218757 ) ) ( not ( = ?auto_218753 ?auto_218754 ) ) ( not ( = ?auto_218753 ?auto_218755 ) ) ( not ( = ?auto_218753 ?auto_218756 ) ) ( not ( = ?auto_218753 ?auto_218757 ) ) ( not ( = ?auto_218754 ?auto_218755 ) ) ( not ( = ?auto_218754 ?auto_218756 ) ) ( not ( = ?auto_218754 ?auto_218757 ) ) ( not ( = ?auto_218755 ?auto_218756 ) ) ( not ( = ?auto_218755 ?auto_218757 ) ) ( not ( = ?auto_218756 ?auto_218757 ) ) ( CLEAR ?auto_218755 ) ( ON ?auto_218756 ?auto_218757 ) ( CLEAR ?auto_218756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_218745 ?auto_218746 ?auto_218747 ?auto_218748 ?auto_218749 ?auto_218750 ?auto_218751 ?auto_218752 ?auto_218753 ?auto_218754 ?auto_218755 ?auto_218756 )
      ( MAKE-13PILE ?auto_218745 ?auto_218746 ?auto_218747 ?auto_218748 ?auto_218749 ?auto_218750 ?auto_218751 ?auto_218752 ?auto_218753 ?auto_218754 ?auto_218755 ?auto_218756 ?auto_218757 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218771 - BLOCK
      ?auto_218772 - BLOCK
      ?auto_218773 - BLOCK
      ?auto_218774 - BLOCK
      ?auto_218775 - BLOCK
      ?auto_218776 - BLOCK
      ?auto_218777 - BLOCK
      ?auto_218778 - BLOCK
      ?auto_218779 - BLOCK
      ?auto_218780 - BLOCK
      ?auto_218781 - BLOCK
      ?auto_218782 - BLOCK
      ?auto_218783 - BLOCK
    )
    :vars
    (
      ?auto_218784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218783 ?auto_218784 ) ( ON-TABLE ?auto_218771 ) ( ON ?auto_218772 ?auto_218771 ) ( ON ?auto_218773 ?auto_218772 ) ( ON ?auto_218774 ?auto_218773 ) ( ON ?auto_218775 ?auto_218774 ) ( ON ?auto_218776 ?auto_218775 ) ( ON ?auto_218777 ?auto_218776 ) ( ON ?auto_218778 ?auto_218777 ) ( ON ?auto_218779 ?auto_218778 ) ( ON ?auto_218780 ?auto_218779 ) ( not ( = ?auto_218771 ?auto_218772 ) ) ( not ( = ?auto_218771 ?auto_218773 ) ) ( not ( = ?auto_218771 ?auto_218774 ) ) ( not ( = ?auto_218771 ?auto_218775 ) ) ( not ( = ?auto_218771 ?auto_218776 ) ) ( not ( = ?auto_218771 ?auto_218777 ) ) ( not ( = ?auto_218771 ?auto_218778 ) ) ( not ( = ?auto_218771 ?auto_218779 ) ) ( not ( = ?auto_218771 ?auto_218780 ) ) ( not ( = ?auto_218771 ?auto_218781 ) ) ( not ( = ?auto_218771 ?auto_218782 ) ) ( not ( = ?auto_218771 ?auto_218783 ) ) ( not ( = ?auto_218771 ?auto_218784 ) ) ( not ( = ?auto_218772 ?auto_218773 ) ) ( not ( = ?auto_218772 ?auto_218774 ) ) ( not ( = ?auto_218772 ?auto_218775 ) ) ( not ( = ?auto_218772 ?auto_218776 ) ) ( not ( = ?auto_218772 ?auto_218777 ) ) ( not ( = ?auto_218772 ?auto_218778 ) ) ( not ( = ?auto_218772 ?auto_218779 ) ) ( not ( = ?auto_218772 ?auto_218780 ) ) ( not ( = ?auto_218772 ?auto_218781 ) ) ( not ( = ?auto_218772 ?auto_218782 ) ) ( not ( = ?auto_218772 ?auto_218783 ) ) ( not ( = ?auto_218772 ?auto_218784 ) ) ( not ( = ?auto_218773 ?auto_218774 ) ) ( not ( = ?auto_218773 ?auto_218775 ) ) ( not ( = ?auto_218773 ?auto_218776 ) ) ( not ( = ?auto_218773 ?auto_218777 ) ) ( not ( = ?auto_218773 ?auto_218778 ) ) ( not ( = ?auto_218773 ?auto_218779 ) ) ( not ( = ?auto_218773 ?auto_218780 ) ) ( not ( = ?auto_218773 ?auto_218781 ) ) ( not ( = ?auto_218773 ?auto_218782 ) ) ( not ( = ?auto_218773 ?auto_218783 ) ) ( not ( = ?auto_218773 ?auto_218784 ) ) ( not ( = ?auto_218774 ?auto_218775 ) ) ( not ( = ?auto_218774 ?auto_218776 ) ) ( not ( = ?auto_218774 ?auto_218777 ) ) ( not ( = ?auto_218774 ?auto_218778 ) ) ( not ( = ?auto_218774 ?auto_218779 ) ) ( not ( = ?auto_218774 ?auto_218780 ) ) ( not ( = ?auto_218774 ?auto_218781 ) ) ( not ( = ?auto_218774 ?auto_218782 ) ) ( not ( = ?auto_218774 ?auto_218783 ) ) ( not ( = ?auto_218774 ?auto_218784 ) ) ( not ( = ?auto_218775 ?auto_218776 ) ) ( not ( = ?auto_218775 ?auto_218777 ) ) ( not ( = ?auto_218775 ?auto_218778 ) ) ( not ( = ?auto_218775 ?auto_218779 ) ) ( not ( = ?auto_218775 ?auto_218780 ) ) ( not ( = ?auto_218775 ?auto_218781 ) ) ( not ( = ?auto_218775 ?auto_218782 ) ) ( not ( = ?auto_218775 ?auto_218783 ) ) ( not ( = ?auto_218775 ?auto_218784 ) ) ( not ( = ?auto_218776 ?auto_218777 ) ) ( not ( = ?auto_218776 ?auto_218778 ) ) ( not ( = ?auto_218776 ?auto_218779 ) ) ( not ( = ?auto_218776 ?auto_218780 ) ) ( not ( = ?auto_218776 ?auto_218781 ) ) ( not ( = ?auto_218776 ?auto_218782 ) ) ( not ( = ?auto_218776 ?auto_218783 ) ) ( not ( = ?auto_218776 ?auto_218784 ) ) ( not ( = ?auto_218777 ?auto_218778 ) ) ( not ( = ?auto_218777 ?auto_218779 ) ) ( not ( = ?auto_218777 ?auto_218780 ) ) ( not ( = ?auto_218777 ?auto_218781 ) ) ( not ( = ?auto_218777 ?auto_218782 ) ) ( not ( = ?auto_218777 ?auto_218783 ) ) ( not ( = ?auto_218777 ?auto_218784 ) ) ( not ( = ?auto_218778 ?auto_218779 ) ) ( not ( = ?auto_218778 ?auto_218780 ) ) ( not ( = ?auto_218778 ?auto_218781 ) ) ( not ( = ?auto_218778 ?auto_218782 ) ) ( not ( = ?auto_218778 ?auto_218783 ) ) ( not ( = ?auto_218778 ?auto_218784 ) ) ( not ( = ?auto_218779 ?auto_218780 ) ) ( not ( = ?auto_218779 ?auto_218781 ) ) ( not ( = ?auto_218779 ?auto_218782 ) ) ( not ( = ?auto_218779 ?auto_218783 ) ) ( not ( = ?auto_218779 ?auto_218784 ) ) ( not ( = ?auto_218780 ?auto_218781 ) ) ( not ( = ?auto_218780 ?auto_218782 ) ) ( not ( = ?auto_218780 ?auto_218783 ) ) ( not ( = ?auto_218780 ?auto_218784 ) ) ( not ( = ?auto_218781 ?auto_218782 ) ) ( not ( = ?auto_218781 ?auto_218783 ) ) ( not ( = ?auto_218781 ?auto_218784 ) ) ( not ( = ?auto_218782 ?auto_218783 ) ) ( not ( = ?auto_218782 ?auto_218784 ) ) ( not ( = ?auto_218783 ?auto_218784 ) ) ( ON ?auto_218782 ?auto_218783 ) ( CLEAR ?auto_218780 ) ( ON ?auto_218781 ?auto_218782 ) ( CLEAR ?auto_218781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_218771 ?auto_218772 ?auto_218773 ?auto_218774 ?auto_218775 ?auto_218776 ?auto_218777 ?auto_218778 ?auto_218779 ?auto_218780 ?auto_218781 )
      ( MAKE-13PILE ?auto_218771 ?auto_218772 ?auto_218773 ?auto_218774 ?auto_218775 ?auto_218776 ?auto_218777 ?auto_218778 ?auto_218779 ?auto_218780 ?auto_218781 ?auto_218782 ?auto_218783 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218798 - BLOCK
      ?auto_218799 - BLOCK
      ?auto_218800 - BLOCK
      ?auto_218801 - BLOCK
      ?auto_218802 - BLOCK
      ?auto_218803 - BLOCK
      ?auto_218804 - BLOCK
      ?auto_218805 - BLOCK
      ?auto_218806 - BLOCK
      ?auto_218807 - BLOCK
      ?auto_218808 - BLOCK
      ?auto_218809 - BLOCK
      ?auto_218810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_218810 ) ( ON-TABLE ?auto_218798 ) ( ON ?auto_218799 ?auto_218798 ) ( ON ?auto_218800 ?auto_218799 ) ( ON ?auto_218801 ?auto_218800 ) ( ON ?auto_218802 ?auto_218801 ) ( ON ?auto_218803 ?auto_218802 ) ( ON ?auto_218804 ?auto_218803 ) ( ON ?auto_218805 ?auto_218804 ) ( ON ?auto_218806 ?auto_218805 ) ( ON ?auto_218807 ?auto_218806 ) ( not ( = ?auto_218798 ?auto_218799 ) ) ( not ( = ?auto_218798 ?auto_218800 ) ) ( not ( = ?auto_218798 ?auto_218801 ) ) ( not ( = ?auto_218798 ?auto_218802 ) ) ( not ( = ?auto_218798 ?auto_218803 ) ) ( not ( = ?auto_218798 ?auto_218804 ) ) ( not ( = ?auto_218798 ?auto_218805 ) ) ( not ( = ?auto_218798 ?auto_218806 ) ) ( not ( = ?auto_218798 ?auto_218807 ) ) ( not ( = ?auto_218798 ?auto_218808 ) ) ( not ( = ?auto_218798 ?auto_218809 ) ) ( not ( = ?auto_218798 ?auto_218810 ) ) ( not ( = ?auto_218799 ?auto_218800 ) ) ( not ( = ?auto_218799 ?auto_218801 ) ) ( not ( = ?auto_218799 ?auto_218802 ) ) ( not ( = ?auto_218799 ?auto_218803 ) ) ( not ( = ?auto_218799 ?auto_218804 ) ) ( not ( = ?auto_218799 ?auto_218805 ) ) ( not ( = ?auto_218799 ?auto_218806 ) ) ( not ( = ?auto_218799 ?auto_218807 ) ) ( not ( = ?auto_218799 ?auto_218808 ) ) ( not ( = ?auto_218799 ?auto_218809 ) ) ( not ( = ?auto_218799 ?auto_218810 ) ) ( not ( = ?auto_218800 ?auto_218801 ) ) ( not ( = ?auto_218800 ?auto_218802 ) ) ( not ( = ?auto_218800 ?auto_218803 ) ) ( not ( = ?auto_218800 ?auto_218804 ) ) ( not ( = ?auto_218800 ?auto_218805 ) ) ( not ( = ?auto_218800 ?auto_218806 ) ) ( not ( = ?auto_218800 ?auto_218807 ) ) ( not ( = ?auto_218800 ?auto_218808 ) ) ( not ( = ?auto_218800 ?auto_218809 ) ) ( not ( = ?auto_218800 ?auto_218810 ) ) ( not ( = ?auto_218801 ?auto_218802 ) ) ( not ( = ?auto_218801 ?auto_218803 ) ) ( not ( = ?auto_218801 ?auto_218804 ) ) ( not ( = ?auto_218801 ?auto_218805 ) ) ( not ( = ?auto_218801 ?auto_218806 ) ) ( not ( = ?auto_218801 ?auto_218807 ) ) ( not ( = ?auto_218801 ?auto_218808 ) ) ( not ( = ?auto_218801 ?auto_218809 ) ) ( not ( = ?auto_218801 ?auto_218810 ) ) ( not ( = ?auto_218802 ?auto_218803 ) ) ( not ( = ?auto_218802 ?auto_218804 ) ) ( not ( = ?auto_218802 ?auto_218805 ) ) ( not ( = ?auto_218802 ?auto_218806 ) ) ( not ( = ?auto_218802 ?auto_218807 ) ) ( not ( = ?auto_218802 ?auto_218808 ) ) ( not ( = ?auto_218802 ?auto_218809 ) ) ( not ( = ?auto_218802 ?auto_218810 ) ) ( not ( = ?auto_218803 ?auto_218804 ) ) ( not ( = ?auto_218803 ?auto_218805 ) ) ( not ( = ?auto_218803 ?auto_218806 ) ) ( not ( = ?auto_218803 ?auto_218807 ) ) ( not ( = ?auto_218803 ?auto_218808 ) ) ( not ( = ?auto_218803 ?auto_218809 ) ) ( not ( = ?auto_218803 ?auto_218810 ) ) ( not ( = ?auto_218804 ?auto_218805 ) ) ( not ( = ?auto_218804 ?auto_218806 ) ) ( not ( = ?auto_218804 ?auto_218807 ) ) ( not ( = ?auto_218804 ?auto_218808 ) ) ( not ( = ?auto_218804 ?auto_218809 ) ) ( not ( = ?auto_218804 ?auto_218810 ) ) ( not ( = ?auto_218805 ?auto_218806 ) ) ( not ( = ?auto_218805 ?auto_218807 ) ) ( not ( = ?auto_218805 ?auto_218808 ) ) ( not ( = ?auto_218805 ?auto_218809 ) ) ( not ( = ?auto_218805 ?auto_218810 ) ) ( not ( = ?auto_218806 ?auto_218807 ) ) ( not ( = ?auto_218806 ?auto_218808 ) ) ( not ( = ?auto_218806 ?auto_218809 ) ) ( not ( = ?auto_218806 ?auto_218810 ) ) ( not ( = ?auto_218807 ?auto_218808 ) ) ( not ( = ?auto_218807 ?auto_218809 ) ) ( not ( = ?auto_218807 ?auto_218810 ) ) ( not ( = ?auto_218808 ?auto_218809 ) ) ( not ( = ?auto_218808 ?auto_218810 ) ) ( not ( = ?auto_218809 ?auto_218810 ) ) ( ON ?auto_218809 ?auto_218810 ) ( CLEAR ?auto_218807 ) ( ON ?auto_218808 ?auto_218809 ) ( CLEAR ?auto_218808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_218798 ?auto_218799 ?auto_218800 ?auto_218801 ?auto_218802 ?auto_218803 ?auto_218804 ?auto_218805 ?auto_218806 ?auto_218807 ?auto_218808 )
      ( MAKE-13PILE ?auto_218798 ?auto_218799 ?auto_218800 ?auto_218801 ?auto_218802 ?auto_218803 ?auto_218804 ?auto_218805 ?auto_218806 ?auto_218807 ?auto_218808 ?auto_218809 ?auto_218810 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218824 - BLOCK
      ?auto_218825 - BLOCK
      ?auto_218826 - BLOCK
      ?auto_218827 - BLOCK
      ?auto_218828 - BLOCK
      ?auto_218829 - BLOCK
      ?auto_218830 - BLOCK
      ?auto_218831 - BLOCK
      ?auto_218832 - BLOCK
      ?auto_218833 - BLOCK
      ?auto_218834 - BLOCK
      ?auto_218835 - BLOCK
      ?auto_218836 - BLOCK
    )
    :vars
    (
      ?auto_218837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218836 ?auto_218837 ) ( ON-TABLE ?auto_218824 ) ( ON ?auto_218825 ?auto_218824 ) ( ON ?auto_218826 ?auto_218825 ) ( ON ?auto_218827 ?auto_218826 ) ( ON ?auto_218828 ?auto_218827 ) ( ON ?auto_218829 ?auto_218828 ) ( ON ?auto_218830 ?auto_218829 ) ( ON ?auto_218831 ?auto_218830 ) ( ON ?auto_218832 ?auto_218831 ) ( not ( = ?auto_218824 ?auto_218825 ) ) ( not ( = ?auto_218824 ?auto_218826 ) ) ( not ( = ?auto_218824 ?auto_218827 ) ) ( not ( = ?auto_218824 ?auto_218828 ) ) ( not ( = ?auto_218824 ?auto_218829 ) ) ( not ( = ?auto_218824 ?auto_218830 ) ) ( not ( = ?auto_218824 ?auto_218831 ) ) ( not ( = ?auto_218824 ?auto_218832 ) ) ( not ( = ?auto_218824 ?auto_218833 ) ) ( not ( = ?auto_218824 ?auto_218834 ) ) ( not ( = ?auto_218824 ?auto_218835 ) ) ( not ( = ?auto_218824 ?auto_218836 ) ) ( not ( = ?auto_218824 ?auto_218837 ) ) ( not ( = ?auto_218825 ?auto_218826 ) ) ( not ( = ?auto_218825 ?auto_218827 ) ) ( not ( = ?auto_218825 ?auto_218828 ) ) ( not ( = ?auto_218825 ?auto_218829 ) ) ( not ( = ?auto_218825 ?auto_218830 ) ) ( not ( = ?auto_218825 ?auto_218831 ) ) ( not ( = ?auto_218825 ?auto_218832 ) ) ( not ( = ?auto_218825 ?auto_218833 ) ) ( not ( = ?auto_218825 ?auto_218834 ) ) ( not ( = ?auto_218825 ?auto_218835 ) ) ( not ( = ?auto_218825 ?auto_218836 ) ) ( not ( = ?auto_218825 ?auto_218837 ) ) ( not ( = ?auto_218826 ?auto_218827 ) ) ( not ( = ?auto_218826 ?auto_218828 ) ) ( not ( = ?auto_218826 ?auto_218829 ) ) ( not ( = ?auto_218826 ?auto_218830 ) ) ( not ( = ?auto_218826 ?auto_218831 ) ) ( not ( = ?auto_218826 ?auto_218832 ) ) ( not ( = ?auto_218826 ?auto_218833 ) ) ( not ( = ?auto_218826 ?auto_218834 ) ) ( not ( = ?auto_218826 ?auto_218835 ) ) ( not ( = ?auto_218826 ?auto_218836 ) ) ( not ( = ?auto_218826 ?auto_218837 ) ) ( not ( = ?auto_218827 ?auto_218828 ) ) ( not ( = ?auto_218827 ?auto_218829 ) ) ( not ( = ?auto_218827 ?auto_218830 ) ) ( not ( = ?auto_218827 ?auto_218831 ) ) ( not ( = ?auto_218827 ?auto_218832 ) ) ( not ( = ?auto_218827 ?auto_218833 ) ) ( not ( = ?auto_218827 ?auto_218834 ) ) ( not ( = ?auto_218827 ?auto_218835 ) ) ( not ( = ?auto_218827 ?auto_218836 ) ) ( not ( = ?auto_218827 ?auto_218837 ) ) ( not ( = ?auto_218828 ?auto_218829 ) ) ( not ( = ?auto_218828 ?auto_218830 ) ) ( not ( = ?auto_218828 ?auto_218831 ) ) ( not ( = ?auto_218828 ?auto_218832 ) ) ( not ( = ?auto_218828 ?auto_218833 ) ) ( not ( = ?auto_218828 ?auto_218834 ) ) ( not ( = ?auto_218828 ?auto_218835 ) ) ( not ( = ?auto_218828 ?auto_218836 ) ) ( not ( = ?auto_218828 ?auto_218837 ) ) ( not ( = ?auto_218829 ?auto_218830 ) ) ( not ( = ?auto_218829 ?auto_218831 ) ) ( not ( = ?auto_218829 ?auto_218832 ) ) ( not ( = ?auto_218829 ?auto_218833 ) ) ( not ( = ?auto_218829 ?auto_218834 ) ) ( not ( = ?auto_218829 ?auto_218835 ) ) ( not ( = ?auto_218829 ?auto_218836 ) ) ( not ( = ?auto_218829 ?auto_218837 ) ) ( not ( = ?auto_218830 ?auto_218831 ) ) ( not ( = ?auto_218830 ?auto_218832 ) ) ( not ( = ?auto_218830 ?auto_218833 ) ) ( not ( = ?auto_218830 ?auto_218834 ) ) ( not ( = ?auto_218830 ?auto_218835 ) ) ( not ( = ?auto_218830 ?auto_218836 ) ) ( not ( = ?auto_218830 ?auto_218837 ) ) ( not ( = ?auto_218831 ?auto_218832 ) ) ( not ( = ?auto_218831 ?auto_218833 ) ) ( not ( = ?auto_218831 ?auto_218834 ) ) ( not ( = ?auto_218831 ?auto_218835 ) ) ( not ( = ?auto_218831 ?auto_218836 ) ) ( not ( = ?auto_218831 ?auto_218837 ) ) ( not ( = ?auto_218832 ?auto_218833 ) ) ( not ( = ?auto_218832 ?auto_218834 ) ) ( not ( = ?auto_218832 ?auto_218835 ) ) ( not ( = ?auto_218832 ?auto_218836 ) ) ( not ( = ?auto_218832 ?auto_218837 ) ) ( not ( = ?auto_218833 ?auto_218834 ) ) ( not ( = ?auto_218833 ?auto_218835 ) ) ( not ( = ?auto_218833 ?auto_218836 ) ) ( not ( = ?auto_218833 ?auto_218837 ) ) ( not ( = ?auto_218834 ?auto_218835 ) ) ( not ( = ?auto_218834 ?auto_218836 ) ) ( not ( = ?auto_218834 ?auto_218837 ) ) ( not ( = ?auto_218835 ?auto_218836 ) ) ( not ( = ?auto_218835 ?auto_218837 ) ) ( not ( = ?auto_218836 ?auto_218837 ) ) ( ON ?auto_218835 ?auto_218836 ) ( ON ?auto_218834 ?auto_218835 ) ( CLEAR ?auto_218832 ) ( ON ?auto_218833 ?auto_218834 ) ( CLEAR ?auto_218833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_218824 ?auto_218825 ?auto_218826 ?auto_218827 ?auto_218828 ?auto_218829 ?auto_218830 ?auto_218831 ?auto_218832 ?auto_218833 )
      ( MAKE-13PILE ?auto_218824 ?auto_218825 ?auto_218826 ?auto_218827 ?auto_218828 ?auto_218829 ?auto_218830 ?auto_218831 ?auto_218832 ?auto_218833 ?auto_218834 ?auto_218835 ?auto_218836 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218851 - BLOCK
      ?auto_218852 - BLOCK
      ?auto_218853 - BLOCK
      ?auto_218854 - BLOCK
      ?auto_218855 - BLOCK
      ?auto_218856 - BLOCK
      ?auto_218857 - BLOCK
      ?auto_218858 - BLOCK
      ?auto_218859 - BLOCK
      ?auto_218860 - BLOCK
      ?auto_218861 - BLOCK
      ?auto_218862 - BLOCK
      ?auto_218863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_218863 ) ( ON-TABLE ?auto_218851 ) ( ON ?auto_218852 ?auto_218851 ) ( ON ?auto_218853 ?auto_218852 ) ( ON ?auto_218854 ?auto_218853 ) ( ON ?auto_218855 ?auto_218854 ) ( ON ?auto_218856 ?auto_218855 ) ( ON ?auto_218857 ?auto_218856 ) ( ON ?auto_218858 ?auto_218857 ) ( ON ?auto_218859 ?auto_218858 ) ( not ( = ?auto_218851 ?auto_218852 ) ) ( not ( = ?auto_218851 ?auto_218853 ) ) ( not ( = ?auto_218851 ?auto_218854 ) ) ( not ( = ?auto_218851 ?auto_218855 ) ) ( not ( = ?auto_218851 ?auto_218856 ) ) ( not ( = ?auto_218851 ?auto_218857 ) ) ( not ( = ?auto_218851 ?auto_218858 ) ) ( not ( = ?auto_218851 ?auto_218859 ) ) ( not ( = ?auto_218851 ?auto_218860 ) ) ( not ( = ?auto_218851 ?auto_218861 ) ) ( not ( = ?auto_218851 ?auto_218862 ) ) ( not ( = ?auto_218851 ?auto_218863 ) ) ( not ( = ?auto_218852 ?auto_218853 ) ) ( not ( = ?auto_218852 ?auto_218854 ) ) ( not ( = ?auto_218852 ?auto_218855 ) ) ( not ( = ?auto_218852 ?auto_218856 ) ) ( not ( = ?auto_218852 ?auto_218857 ) ) ( not ( = ?auto_218852 ?auto_218858 ) ) ( not ( = ?auto_218852 ?auto_218859 ) ) ( not ( = ?auto_218852 ?auto_218860 ) ) ( not ( = ?auto_218852 ?auto_218861 ) ) ( not ( = ?auto_218852 ?auto_218862 ) ) ( not ( = ?auto_218852 ?auto_218863 ) ) ( not ( = ?auto_218853 ?auto_218854 ) ) ( not ( = ?auto_218853 ?auto_218855 ) ) ( not ( = ?auto_218853 ?auto_218856 ) ) ( not ( = ?auto_218853 ?auto_218857 ) ) ( not ( = ?auto_218853 ?auto_218858 ) ) ( not ( = ?auto_218853 ?auto_218859 ) ) ( not ( = ?auto_218853 ?auto_218860 ) ) ( not ( = ?auto_218853 ?auto_218861 ) ) ( not ( = ?auto_218853 ?auto_218862 ) ) ( not ( = ?auto_218853 ?auto_218863 ) ) ( not ( = ?auto_218854 ?auto_218855 ) ) ( not ( = ?auto_218854 ?auto_218856 ) ) ( not ( = ?auto_218854 ?auto_218857 ) ) ( not ( = ?auto_218854 ?auto_218858 ) ) ( not ( = ?auto_218854 ?auto_218859 ) ) ( not ( = ?auto_218854 ?auto_218860 ) ) ( not ( = ?auto_218854 ?auto_218861 ) ) ( not ( = ?auto_218854 ?auto_218862 ) ) ( not ( = ?auto_218854 ?auto_218863 ) ) ( not ( = ?auto_218855 ?auto_218856 ) ) ( not ( = ?auto_218855 ?auto_218857 ) ) ( not ( = ?auto_218855 ?auto_218858 ) ) ( not ( = ?auto_218855 ?auto_218859 ) ) ( not ( = ?auto_218855 ?auto_218860 ) ) ( not ( = ?auto_218855 ?auto_218861 ) ) ( not ( = ?auto_218855 ?auto_218862 ) ) ( not ( = ?auto_218855 ?auto_218863 ) ) ( not ( = ?auto_218856 ?auto_218857 ) ) ( not ( = ?auto_218856 ?auto_218858 ) ) ( not ( = ?auto_218856 ?auto_218859 ) ) ( not ( = ?auto_218856 ?auto_218860 ) ) ( not ( = ?auto_218856 ?auto_218861 ) ) ( not ( = ?auto_218856 ?auto_218862 ) ) ( not ( = ?auto_218856 ?auto_218863 ) ) ( not ( = ?auto_218857 ?auto_218858 ) ) ( not ( = ?auto_218857 ?auto_218859 ) ) ( not ( = ?auto_218857 ?auto_218860 ) ) ( not ( = ?auto_218857 ?auto_218861 ) ) ( not ( = ?auto_218857 ?auto_218862 ) ) ( not ( = ?auto_218857 ?auto_218863 ) ) ( not ( = ?auto_218858 ?auto_218859 ) ) ( not ( = ?auto_218858 ?auto_218860 ) ) ( not ( = ?auto_218858 ?auto_218861 ) ) ( not ( = ?auto_218858 ?auto_218862 ) ) ( not ( = ?auto_218858 ?auto_218863 ) ) ( not ( = ?auto_218859 ?auto_218860 ) ) ( not ( = ?auto_218859 ?auto_218861 ) ) ( not ( = ?auto_218859 ?auto_218862 ) ) ( not ( = ?auto_218859 ?auto_218863 ) ) ( not ( = ?auto_218860 ?auto_218861 ) ) ( not ( = ?auto_218860 ?auto_218862 ) ) ( not ( = ?auto_218860 ?auto_218863 ) ) ( not ( = ?auto_218861 ?auto_218862 ) ) ( not ( = ?auto_218861 ?auto_218863 ) ) ( not ( = ?auto_218862 ?auto_218863 ) ) ( ON ?auto_218862 ?auto_218863 ) ( ON ?auto_218861 ?auto_218862 ) ( CLEAR ?auto_218859 ) ( ON ?auto_218860 ?auto_218861 ) ( CLEAR ?auto_218860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_218851 ?auto_218852 ?auto_218853 ?auto_218854 ?auto_218855 ?auto_218856 ?auto_218857 ?auto_218858 ?auto_218859 ?auto_218860 )
      ( MAKE-13PILE ?auto_218851 ?auto_218852 ?auto_218853 ?auto_218854 ?auto_218855 ?auto_218856 ?auto_218857 ?auto_218858 ?auto_218859 ?auto_218860 ?auto_218861 ?auto_218862 ?auto_218863 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218877 - BLOCK
      ?auto_218878 - BLOCK
      ?auto_218879 - BLOCK
      ?auto_218880 - BLOCK
      ?auto_218881 - BLOCK
      ?auto_218882 - BLOCK
      ?auto_218883 - BLOCK
      ?auto_218884 - BLOCK
      ?auto_218885 - BLOCK
      ?auto_218886 - BLOCK
      ?auto_218887 - BLOCK
      ?auto_218888 - BLOCK
      ?auto_218889 - BLOCK
    )
    :vars
    (
      ?auto_218890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218889 ?auto_218890 ) ( ON-TABLE ?auto_218877 ) ( ON ?auto_218878 ?auto_218877 ) ( ON ?auto_218879 ?auto_218878 ) ( ON ?auto_218880 ?auto_218879 ) ( ON ?auto_218881 ?auto_218880 ) ( ON ?auto_218882 ?auto_218881 ) ( ON ?auto_218883 ?auto_218882 ) ( ON ?auto_218884 ?auto_218883 ) ( not ( = ?auto_218877 ?auto_218878 ) ) ( not ( = ?auto_218877 ?auto_218879 ) ) ( not ( = ?auto_218877 ?auto_218880 ) ) ( not ( = ?auto_218877 ?auto_218881 ) ) ( not ( = ?auto_218877 ?auto_218882 ) ) ( not ( = ?auto_218877 ?auto_218883 ) ) ( not ( = ?auto_218877 ?auto_218884 ) ) ( not ( = ?auto_218877 ?auto_218885 ) ) ( not ( = ?auto_218877 ?auto_218886 ) ) ( not ( = ?auto_218877 ?auto_218887 ) ) ( not ( = ?auto_218877 ?auto_218888 ) ) ( not ( = ?auto_218877 ?auto_218889 ) ) ( not ( = ?auto_218877 ?auto_218890 ) ) ( not ( = ?auto_218878 ?auto_218879 ) ) ( not ( = ?auto_218878 ?auto_218880 ) ) ( not ( = ?auto_218878 ?auto_218881 ) ) ( not ( = ?auto_218878 ?auto_218882 ) ) ( not ( = ?auto_218878 ?auto_218883 ) ) ( not ( = ?auto_218878 ?auto_218884 ) ) ( not ( = ?auto_218878 ?auto_218885 ) ) ( not ( = ?auto_218878 ?auto_218886 ) ) ( not ( = ?auto_218878 ?auto_218887 ) ) ( not ( = ?auto_218878 ?auto_218888 ) ) ( not ( = ?auto_218878 ?auto_218889 ) ) ( not ( = ?auto_218878 ?auto_218890 ) ) ( not ( = ?auto_218879 ?auto_218880 ) ) ( not ( = ?auto_218879 ?auto_218881 ) ) ( not ( = ?auto_218879 ?auto_218882 ) ) ( not ( = ?auto_218879 ?auto_218883 ) ) ( not ( = ?auto_218879 ?auto_218884 ) ) ( not ( = ?auto_218879 ?auto_218885 ) ) ( not ( = ?auto_218879 ?auto_218886 ) ) ( not ( = ?auto_218879 ?auto_218887 ) ) ( not ( = ?auto_218879 ?auto_218888 ) ) ( not ( = ?auto_218879 ?auto_218889 ) ) ( not ( = ?auto_218879 ?auto_218890 ) ) ( not ( = ?auto_218880 ?auto_218881 ) ) ( not ( = ?auto_218880 ?auto_218882 ) ) ( not ( = ?auto_218880 ?auto_218883 ) ) ( not ( = ?auto_218880 ?auto_218884 ) ) ( not ( = ?auto_218880 ?auto_218885 ) ) ( not ( = ?auto_218880 ?auto_218886 ) ) ( not ( = ?auto_218880 ?auto_218887 ) ) ( not ( = ?auto_218880 ?auto_218888 ) ) ( not ( = ?auto_218880 ?auto_218889 ) ) ( not ( = ?auto_218880 ?auto_218890 ) ) ( not ( = ?auto_218881 ?auto_218882 ) ) ( not ( = ?auto_218881 ?auto_218883 ) ) ( not ( = ?auto_218881 ?auto_218884 ) ) ( not ( = ?auto_218881 ?auto_218885 ) ) ( not ( = ?auto_218881 ?auto_218886 ) ) ( not ( = ?auto_218881 ?auto_218887 ) ) ( not ( = ?auto_218881 ?auto_218888 ) ) ( not ( = ?auto_218881 ?auto_218889 ) ) ( not ( = ?auto_218881 ?auto_218890 ) ) ( not ( = ?auto_218882 ?auto_218883 ) ) ( not ( = ?auto_218882 ?auto_218884 ) ) ( not ( = ?auto_218882 ?auto_218885 ) ) ( not ( = ?auto_218882 ?auto_218886 ) ) ( not ( = ?auto_218882 ?auto_218887 ) ) ( not ( = ?auto_218882 ?auto_218888 ) ) ( not ( = ?auto_218882 ?auto_218889 ) ) ( not ( = ?auto_218882 ?auto_218890 ) ) ( not ( = ?auto_218883 ?auto_218884 ) ) ( not ( = ?auto_218883 ?auto_218885 ) ) ( not ( = ?auto_218883 ?auto_218886 ) ) ( not ( = ?auto_218883 ?auto_218887 ) ) ( not ( = ?auto_218883 ?auto_218888 ) ) ( not ( = ?auto_218883 ?auto_218889 ) ) ( not ( = ?auto_218883 ?auto_218890 ) ) ( not ( = ?auto_218884 ?auto_218885 ) ) ( not ( = ?auto_218884 ?auto_218886 ) ) ( not ( = ?auto_218884 ?auto_218887 ) ) ( not ( = ?auto_218884 ?auto_218888 ) ) ( not ( = ?auto_218884 ?auto_218889 ) ) ( not ( = ?auto_218884 ?auto_218890 ) ) ( not ( = ?auto_218885 ?auto_218886 ) ) ( not ( = ?auto_218885 ?auto_218887 ) ) ( not ( = ?auto_218885 ?auto_218888 ) ) ( not ( = ?auto_218885 ?auto_218889 ) ) ( not ( = ?auto_218885 ?auto_218890 ) ) ( not ( = ?auto_218886 ?auto_218887 ) ) ( not ( = ?auto_218886 ?auto_218888 ) ) ( not ( = ?auto_218886 ?auto_218889 ) ) ( not ( = ?auto_218886 ?auto_218890 ) ) ( not ( = ?auto_218887 ?auto_218888 ) ) ( not ( = ?auto_218887 ?auto_218889 ) ) ( not ( = ?auto_218887 ?auto_218890 ) ) ( not ( = ?auto_218888 ?auto_218889 ) ) ( not ( = ?auto_218888 ?auto_218890 ) ) ( not ( = ?auto_218889 ?auto_218890 ) ) ( ON ?auto_218888 ?auto_218889 ) ( ON ?auto_218887 ?auto_218888 ) ( ON ?auto_218886 ?auto_218887 ) ( CLEAR ?auto_218884 ) ( ON ?auto_218885 ?auto_218886 ) ( CLEAR ?auto_218885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_218877 ?auto_218878 ?auto_218879 ?auto_218880 ?auto_218881 ?auto_218882 ?auto_218883 ?auto_218884 ?auto_218885 )
      ( MAKE-13PILE ?auto_218877 ?auto_218878 ?auto_218879 ?auto_218880 ?auto_218881 ?auto_218882 ?auto_218883 ?auto_218884 ?auto_218885 ?auto_218886 ?auto_218887 ?auto_218888 ?auto_218889 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218904 - BLOCK
      ?auto_218905 - BLOCK
      ?auto_218906 - BLOCK
      ?auto_218907 - BLOCK
      ?auto_218908 - BLOCK
      ?auto_218909 - BLOCK
      ?auto_218910 - BLOCK
      ?auto_218911 - BLOCK
      ?auto_218912 - BLOCK
      ?auto_218913 - BLOCK
      ?auto_218914 - BLOCK
      ?auto_218915 - BLOCK
      ?auto_218916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_218916 ) ( ON-TABLE ?auto_218904 ) ( ON ?auto_218905 ?auto_218904 ) ( ON ?auto_218906 ?auto_218905 ) ( ON ?auto_218907 ?auto_218906 ) ( ON ?auto_218908 ?auto_218907 ) ( ON ?auto_218909 ?auto_218908 ) ( ON ?auto_218910 ?auto_218909 ) ( ON ?auto_218911 ?auto_218910 ) ( not ( = ?auto_218904 ?auto_218905 ) ) ( not ( = ?auto_218904 ?auto_218906 ) ) ( not ( = ?auto_218904 ?auto_218907 ) ) ( not ( = ?auto_218904 ?auto_218908 ) ) ( not ( = ?auto_218904 ?auto_218909 ) ) ( not ( = ?auto_218904 ?auto_218910 ) ) ( not ( = ?auto_218904 ?auto_218911 ) ) ( not ( = ?auto_218904 ?auto_218912 ) ) ( not ( = ?auto_218904 ?auto_218913 ) ) ( not ( = ?auto_218904 ?auto_218914 ) ) ( not ( = ?auto_218904 ?auto_218915 ) ) ( not ( = ?auto_218904 ?auto_218916 ) ) ( not ( = ?auto_218905 ?auto_218906 ) ) ( not ( = ?auto_218905 ?auto_218907 ) ) ( not ( = ?auto_218905 ?auto_218908 ) ) ( not ( = ?auto_218905 ?auto_218909 ) ) ( not ( = ?auto_218905 ?auto_218910 ) ) ( not ( = ?auto_218905 ?auto_218911 ) ) ( not ( = ?auto_218905 ?auto_218912 ) ) ( not ( = ?auto_218905 ?auto_218913 ) ) ( not ( = ?auto_218905 ?auto_218914 ) ) ( not ( = ?auto_218905 ?auto_218915 ) ) ( not ( = ?auto_218905 ?auto_218916 ) ) ( not ( = ?auto_218906 ?auto_218907 ) ) ( not ( = ?auto_218906 ?auto_218908 ) ) ( not ( = ?auto_218906 ?auto_218909 ) ) ( not ( = ?auto_218906 ?auto_218910 ) ) ( not ( = ?auto_218906 ?auto_218911 ) ) ( not ( = ?auto_218906 ?auto_218912 ) ) ( not ( = ?auto_218906 ?auto_218913 ) ) ( not ( = ?auto_218906 ?auto_218914 ) ) ( not ( = ?auto_218906 ?auto_218915 ) ) ( not ( = ?auto_218906 ?auto_218916 ) ) ( not ( = ?auto_218907 ?auto_218908 ) ) ( not ( = ?auto_218907 ?auto_218909 ) ) ( not ( = ?auto_218907 ?auto_218910 ) ) ( not ( = ?auto_218907 ?auto_218911 ) ) ( not ( = ?auto_218907 ?auto_218912 ) ) ( not ( = ?auto_218907 ?auto_218913 ) ) ( not ( = ?auto_218907 ?auto_218914 ) ) ( not ( = ?auto_218907 ?auto_218915 ) ) ( not ( = ?auto_218907 ?auto_218916 ) ) ( not ( = ?auto_218908 ?auto_218909 ) ) ( not ( = ?auto_218908 ?auto_218910 ) ) ( not ( = ?auto_218908 ?auto_218911 ) ) ( not ( = ?auto_218908 ?auto_218912 ) ) ( not ( = ?auto_218908 ?auto_218913 ) ) ( not ( = ?auto_218908 ?auto_218914 ) ) ( not ( = ?auto_218908 ?auto_218915 ) ) ( not ( = ?auto_218908 ?auto_218916 ) ) ( not ( = ?auto_218909 ?auto_218910 ) ) ( not ( = ?auto_218909 ?auto_218911 ) ) ( not ( = ?auto_218909 ?auto_218912 ) ) ( not ( = ?auto_218909 ?auto_218913 ) ) ( not ( = ?auto_218909 ?auto_218914 ) ) ( not ( = ?auto_218909 ?auto_218915 ) ) ( not ( = ?auto_218909 ?auto_218916 ) ) ( not ( = ?auto_218910 ?auto_218911 ) ) ( not ( = ?auto_218910 ?auto_218912 ) ) ( not ( = ?auto_218910 ?auto_218913 ) ) ( not ( = ?auto_218910 ?auto_218914 ) ) ( not ( = ?auto_218910 ?auto_218915 ) ) ( not ( = ?auto_218910 ?auto_218916 ) ) ( not ( = ?auto_218911 ?auto_218912 ) ) ( not ( = ?auto_218911 ?auto_218913 ) ) ( not ( = ?auto_218911 ?auto_218914 ) ) ( not ( = ?auto_218911 ?auto_218915 ) ) ( not ( = ?auto_218911 ?auto_218916 ) ) ( not ( = ?auto_218912 ?auto_218913 ) ) ( not ( = ?auto_218912 ?auto_218914 ) ) ( not ( = ?auto_218912 ?auto_218915 ) ) ( not ( = ?auto_218912 ?auto_218916 ) ) ( not ( = ?auto_218913 ?auto_218914 ) ) ( not ( = ?auto_218913 ?auto_218915 ) ) ( not ( = ?auto_218913 ?auto_218916 ) ) ( not ( = ?auto_218914 ?auto_218915 ) ) ( not ( = ?auto_218914 ?auto_218916 ) ) ( not ( = ?auto_218915 ?auto_218916 ) ) ( ON ?auto_218915 ?auto_218916 ) ( ON ?auto_218914 ?auto_218915 ) ( ON ?auto_218913 ?auto_218914 ) ( CLEAR ?auto_218911 ) ( ON ?auto_218912 ?auto_218913 ) ( CLEAR ?auto_218912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_218904 ?auto_218905 ?auto_218906 ?auto_218907 ?auto_218908 ?auto_218909 ?auto_218910 ?auto_218911 ?auto_218912 )
      ( MAKE-13PILE ?auto_218904 ?auto_218905 ?auto_218906 ?auto_218907 ?auto_218908 ?auto_218909 ?auto_218910 ?auto_218911 ?auto_218912 ?auto_218913 ?auto_218914 ?auto_218915 ?auto_218916 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218930 - BLOCK
      ?auto_218931 - BLOCK
      ?auto_218932 - BLOCK
      ?auto_218933 - BLOCK
      ?auto_218934 - BLOCK
      ?auto_218935 - BLOCK
      ?auto_218936 - BLOCK
      ?auto_218937 - BLOCK
      ?auto_218938 - BLOCK
      ?auto_218939 - BLOCK
      ?auto_218940 - BLOCK
      ?auto_218941 - BLOCK
      ?auto_218942 - BLOCK
    )
    :vars
    (
      ?auto_218943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218942 ?auto_218943 ) ( ON-TABLE ?auto_218930 ) ( ON ?auto_218931 ?auto_218930 ) ( ON ?auto_218932 ?auto_218931 ) ( ON ?auto_218933 ?auto_218932 ) ( ON ?auto_218934 ?auto_218933 ) ( ON ?auto_218935 ?auto_218934 ) ( ON ?auto_218936 ?auto_218935 ) ( not ( = ?auto_218930 ?auto_218931 ) ) ( not ( = ?auto_218930 ?auto_218932 ) ) ( not ( = ?auto_218930 ?auto_218933 ) ) ( not ( = ?auto_218930 ?auto_218934 ) ) ( not ( = ?auto_218930 ?auto_218935 ) ) ( not ( = ?auto_218930 ?auto_218936 ) ) ( not ( = ?auto_218930 ?auto_218937 ) ) ( not ( = ?auto_218930 ?auto_218938 ) ) ( not ( = ?auto_218930 ?auto_218939 ) ) ( not ( = ?auto_218930 ?auto_218940 ) ) ( not ( = ?auto_218930 ?auto_218941 ) ) ( not ( = ?auto_218930 ?auto_218942 ) ) ( not ( = ?auto_218930 ?auto_218943 ) ) ( not ( = ?auto_218931 ?auto_218932 ) ) ( not ( = ?auto_218931 ?auto_218933 ) ) ( not ( = ?auto_218931 ?auto_218934 ) ) ( not ( = ?auto_218931 ?auto_218935 ) ) ( not ( = ?auto_218931 ?auto_218936 ) ) ( not ( = ?auto_218931 ?auto_218937 ) ) ( not ( = ?auto_218931 ?auto_218938 ) ) ( not ( = ?auto_218931 ?auto_218939 ) ) ( not ( = ?auto_218931 ?auto_218940 ) ) ( not ( = ?auto_218931 ?auto_218941 ) ) ( not ( = ?auto_218931 ?auto_218942 ) ) ( not ( = ?auto_218931 ?auto_218943 ) ) ( not ( = ?auto_218932 ?auto_218933 ) ) ( not ( = ?auto_218932 ?auto_218934 ) ) ( not ( = ?auto_218932 ?auto_218935 ) ) ( not ( = ?auto_218932 ?auto_218936 ) ) ( not ( = ?auto_218932 ?auto_218937 ) ) ( not ( = ?auto_218932 ?auto_218938 ) ) ( not ( = ?auto_218932 ?auto_218939 ) ) ( not ( = ?auto_218932 ?auto_218940 ) ) ( not ( = ?auto_218932 ?auto_218941 ) ) ( not ( = ?auto_218932 ?auto_218942 ) ) ( not ( = ?auto_218932 ?auto_218943 ) ) ( not ( = ?auto_218933 ?auto_218934 ) ) ( not ( = ?auto_218933 ?auto_218935 ) ) ( not ( = ?auto_218933 ?auto_218936 ) ) ( not ( = ?auto_218933 ?auto_218937 ) ) ( not ( = ?auto_218933 ?auto_218938 ) ) ( not ( = ?auto_218933 ?auto_218939 ) ) ( not ( = ?auto_218933 ?auto_218940 ) ) ( not ( = ?auto_218933 ?auto_218941 ) ) ( not ( = ?auto_218933 ?auto_218942 ) ) ( not ( = ?auto_218933 ?auto_218943 ) ) ( not ( = ?auto_218934 ?auto_218935 ) ) ( not ( = ?auto_218934 ?auto_218936 ) ) ( not ( = ?auto_218934 ?auto_218937 ) ) ( not ( = ?auto_218934 ?auto_218938 ) ) ( not ( = ?auto_218934 ?auto_218939 ) ) ( not ( = ?auto_218934 ?auto_218940 ) ) ( not ( = ?auto_218934 ?auto_218941 ) ) ( not ( = ?auto_218934 ?auto_218942 ) ) ( not ( = ?auto_218934 ?auto_218943 ) ) ( not ( = ?auto_218935 ?auto_218936 ) ) ( not ( = ?auto_218935 ?auto_218937 ) ) ( not ( = ?auto_218935 ?auto_218938 ) ) ( not ( = ?auto_218935 ?auto_218939 ) ) ( not ( = ?auto_218935 ?auto_218940 ) ) ( not ( = ?auto_218935 ?auto_218941 ) ) ( not ( = ?auto_218935 ?auto_218942 ) ) ( not ( = ?auto_218935 ?auto_218943 ) ) ( not ( = ?auto_218936 ?auto_218937 ) ) ( not ( = ?auto_218936 ?auto_218938 ) ) ( not ( = ?auto_218936 ?auto_218939 ) ) ( not ( = ?auto_218936 ?auto_218940 ) ) ( not ( = ?auto_218936 ?auto_218941 ) ) ( not ( = ?auto_218936 ?auto_218942 ) ) ( not ( = ?auto_218936 ?auto_218943 ) ) ( not ( = ?auto_218937 ?auto_218938 ) ) ( not ( = ?auto_218937 ?auto_218939 ) ) ( not ( = ?auto_218937 ?auto_218940 ) ) ( not ( = ?auto_218937 ?auto_218941 ) ) ( not ( = ?auto_218937 ?auto_218942 ) ) ( not ( = ?auto_218937 ?auto_218943 ) ) ( not ( = ?auto_218938 ?auto_218939 ) ) ( not ( = ?auto_218938 ?auto_218940 ) ) ( not ( = ?auto_218938 ?auto_218941 ) ) ( not ( = ?auto_218938 ?auto_218942 ) ) ( not ( = ?auto_218938 ?auto_218943 ) ) ( not ( = ?auto_218939 ?auto_218940 ) ) ( not ( = ?auto_218939 ?auto_218941 ) ) ( not ( = ?auto_218939 ?auto_218942 ) ) ( not ( = ?auto_218939 ?auto_218943 ) ) ( not ( = ?auto_218940 ?auto_218941 ) ) ( not ( = ?auto_218940 ?auto_218942 ) ) ( not ( = ?auto_218940 ?auto_218943 ) ) ( not ( = ?auto_218941 ?auto_218942 ) ) ( not ( = ?auto_218941 ?auto_218943 ) ) ( not ( = ?auto_218942 ?auto_218943 ) ) ( ON ?auto_218941 ?auto_218942 ) ( ON ?auto_218940 ?auto_218941 ) ( ON ?auto_218939 ?auto_218940 ) ( ON ?auto_218938 ?auto_218939 ) ( CLEAR ?auto_218936 ) ( ON ?auto_218937 ?auto_218938 ) ( CLEAR ?auto_218937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_218930 ?auto_218931 ?auto_218932 ?auto_218933 ?auto_218934 ?auto_218935 ?auto_218936 ?auto_218937 )
      ( MAKE-13PILE ?auto_218930 ?auto_218931 ?auto_218932 ?auto_218933 ?auto_218934 ?auto_218935 ?auto_218936 ?auto_218937 ?auto_218938 ?auto_218939 ?auto_218940 ?auto_218941 ?auto_218942 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218957 - BLOCK
      ?auto_218958 - BLOCK
      ?auto_218959 - BLOCK
      ?auto_218960 - BLOCK
      ?auto_218961 - BLOCK
      ?auto_218962 - BLOCK
      ?auto_218963 - BLOCK
      ?auto_218964 - BLOCK
      ?auto_218965 - BLOCK
      ?auto_218966 - BLOCK
      ?auto_218967 - BLOCK
      ?auto_218968 - BLOCK
      ?auto_218969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_218969 ) ( ON-TABLE ?auto_218957 ) ( ON ?auto_218958 ?auto_218957 ) ( ON ?auto_218959 ?auto_218958 ) ( ON ?auto_218960 ?auto_218959 ) ( ON ?auto_218961 ?auto_218960 ) ( ON ?auto_218962 ?auto_218961 ) ( ON ?auto_218963 ?auto_218962 ) ( not ( = ?auto_218957 ?auto_218958 ) ) ( not ( = ?auto_218957 ?auto_218959 ) ) ( not ( = ?auto_218957 ?auto_218960 ) ) ( not ( = ?auto_218957 ?auto_218961 ) ) ( not ( = ?auto_218957 ?auto_218962 ) ) ( not ( = ?auto_218957 ?auto_218963 ) ) ( not ( = ?auto_218957 ?auto_218964 ) ) ( not ( = ?auto_218957 ?auto_218965 ) ) ( not ( = ?auto_218957 ?auto_218966 ) ) ( not ( = ?auto_218957 ?auto_218967 ) ) ( not ( = ?auto_218957 ?auto_218968 ) ) ( not ( = ?auto_218957 ?auto_218969 ) ) ( not ( = ?auto_218958 ?auto_218959 ) ) ( not ( = ?auto_218958 ?auto_218960 ) ) ( not ( = ?auto_218958 ?auto_218961 ) ) ( not ( = ?auto_218958 ?auto_218962 ) ) ( not ( = ?auto_218958 ?auto_218963 ) ) ( not ( = ?auto_218958 ?auto_218964 ) ) ( not ( = ?auto_218958 ?auto_218965 ) ) ( not ( = ?auto_218958 ?auto_218966 ) ) ( not ( = ?auto_218958 ?auto_218967 ) ) ( not ( = ?auto_218958 ?auto_218968 ) ) ( not ( = ?auto_218958 ?auto_218969 ) ) ( not ( = ?auto_218959 ?auto_218960 ) ) ( not ( = ?auto_218959 ?auto_218961 ) ) ( not ( = ?auto_218959 ?auto_218962 ) ) ( not ( = ?auto_218959 ?auto_218963 ) ) ( not ( = ?auto_218959 ?auto_218964 ) ) ( not ( = ?auto_218959 ?auto_218965 ) ) ( not ( = ?auto_218959 ?auto_218966 ) ) ( not ( = ?auto_218959 ?auto_218967 ) ) ( not ( = ?auto_218959 ?auto_218968 ) ) ( not ( = ?auto_218959 ?auto_218969 ) ) ( not ( = ?auto_218960 ?auto_218961 ) ) ( not ( = ?auto_218960 ?auto_218962 ) ) ( not ( = ?auto_218960 ?auto_218963 ) ) ( not ( = ?auto_218960 ?auto_218964 ) ) ( not ( = ?auto_218960 ?auto_218965 ) ) ( not ( = ?auto_218960 ?auto_218966 ) ) ( not ( = ?auto_218960 ?auto_218967 ) ) ( not ( = ?auto_218960 ?auto_218968 ) ) ( not ( = ?auto_218960 ?auto_218969 ) ) ( not ( = ?auto_218961 ?auto_218962 ) ) ( not ( = ?auto_218961 ?auto_218963 ) ) ( not ( = ?auto_218961 ?auto_218964 ) ) ( not ( = ?auto_218961 ?auto_218965 ) ) ( not ( = ?auto_218961 ?auto_218966 ) ) ( not ( = ?auto_218961 ?auto_218967 ) ) ( not ( = ?auto_218961 ?auto_218968 ) ) ( not ( = ?auto_218961 ?auto_218969 ) ) ( not ( = ?auto_218962 ?auto_218963 ) ) ( not ( = ?auto_218962 ?auto_218964 ) ) ( not ( = ?auto_218962 ?auto_218965 ) ) ( not ( = ?auto_218962 ?auto_218966 ) ) ( not ( = ?auto_218962 ?auto_218967 ) ) ( not ( = ?auto_218962 ?auto_218968 ) ) ( not ( = ?auto_218962 ?auto_218969 ) ) ( not ( = ?auto_218963 ?auto_218964 ) ) ( not ( = ?auto_218963 ?auto_218965 ) ) ( not ( = ?auto_218963 ?auto_218966 ) ) ( not ( = ?auto_218963 ?auto_218967 ) ) ( not ( = ?auto_218963 ?auto_218968 ) ) ( not ( = ?auto_218963 ?auto_218969 ) ) ( not ( = ?auto_218964 ?auto_218965 ) ) ( not ( = ?auto_218964 ?auto_218966 ) ) ( not ( = ?auto_218964 ?auto_218967 ) ) ( not ( = ?auto_218964 ?auto_218968 ) ) ( not ( = ?auto_218964 ?auto_218969 ) ) ( not ( = ?auto_218965 ?auto_218966 ) ) ( not ( = ?auto_218965 ?auto_218967 ) ) ( not ( = ?auto_218965 ?auto_218968 ) ) ( not ( = ?auto_218965 ?auto_218969 ) ) ( not ( = ?auto_218966 ?auto_218967 ) ) ( not ( = ?auto_218966 ?auto_218968 ) ) ( not ( = ?auto_218966 ?auto_218969 ) ) ( not ( = ?auto_218967 ?auto_218968 ) ) ( not ( = ?auto_218967 ?auto_218969 ) ) ( not ( = ?auto_218968 ?auto_218969 ) ) ( ON ?auto_218968 ?auto_218969 ) ( ON ?auto_218967 ?auto_218968 ) ( ON ?auto_218966 ?auto_218967 ) ( ON ?auto_218965 ?auto_218966 ) ( CLEAR ?auto_218963 ) ( ON ?auto_218964 ?auto_218965 ) ( CLEAR ?auto_218964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_218957 ?auto_218958 ?auto_218959 ?auto_218960 ?auto_218961 ?auto_218962 ?auto_218963 ?auto_218964 )
      ( MAKE-13PILE ?auto_218957 ?auto_218958 ?auto_218959 ?auto_218960 ?auto_218961 ?auto_218962 ?auto_218963 ?auto_218964 ?auto_218965 ?auto_218966 ?auto_218967 ?auto_218968 ?auto_218969 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_218983 - BLOCK
      ?auto_218984 - BLOCK
      ?auto_218985 - BLOCK
      ?auto_218986 - BLOCK
      ?auto_218987 - BLOCK
      ?auto_218988 - BLOCK
      ?auto_218989 - BLOCK
      ?auto_218990 - BLOCK
      ?auto_218991 - BLOCK
      ?auto_218992 - BLOCK
      ?auto_218993 - BLOCK
      ?auto_218994 - BLOCK
      ?auto_218995 - BLOCK
    )
    :vars
    (
      ?auto_218996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_218995 ?auto_218996 ) ( ON-TABLE ?auto_218983 ) ( ON ?auto_218984 ?auto_218983 ) ( ON ?auto_218985 ?auto_218984 ) ( ON ?auto_218986 ?auto_218985 ) ( ON ?auto_218987 ?auto_218986 ) ( ON ?auto_218988 ?auto_218987 ) ( not ( = ?auto_218983 ?auto_218984 ) ) ( not ( = ?auto_218983 ?auto_218985 ) ) ( not ( = ?auto_218983 ?auto_218986 ) ) ( not ( = ?auto_218983 ?auto_218987 ) ) ( not ( = ?auto_218983 ?auto_218988 ) ) ( not ( = ?auto_218983 ?auto_218989 ) ) ( not ( = ?auto_218983 ?auto_218990 ) ) ( not ( = ?auto_218983 ?auto_218991 ) ) ( not ( = ?auto_218983 ?auto_218992 ) ) ( not ( = ?auto_218983 ?auto_218993 ) ) ( not ( = ?auto_218983 ?auto_218994 ) ) ( not ( = ?auto_218983 ?auto_218995 ) ) ( not ( = ?auto_218983 ?auto_218996 ) ) ( not ( = ?auto_218984 ?auto_218985 ) ) ( not ( = ?auto_218984 ?auto_218986 ) ) ( not ( = ?auto_218984 ?auto_218987 ) ) ( not ( = ?auto_218984 ?auto_218988 ) ) ( not ( = ?auto_218984 ?auto_218989 ) ) ( not ( = ?auto_218984 ?auto_218990 ) ) ( not ( = ?auto_218984 ?auto_218991 ) ) ( not ( = ?auto_218984 ?auto_218992 ) ) ( not ( = ?auto_218984 ?auto_218993 ) ) ( not ( = ?auto_218984 ?auto_218994 ) ) ( not ( = ?auto_218984 ?auto_218995 ) ) ( not ( = ?auto_218984 ?auto_218996 ) ) ( not ( = ?auto_218985 ?auto_218986 ) ) ( not ( = ?auto_218985 ?auto_218987 ) ) ( not ( = ?auto_218985 ?auto_218988 ) ) ( not ( = ?auto_218985 ?auto_218989 ) ) ( not ( = ?auto_218985 ?auto_218990 ) ) ( not ( = ?auto_218985 ?auto_218991 ) ) ( not ( = ?auto_218985 ?auto_218992 ) ) ( not ( = ?auto_218985 ?auto_218993 ) ) ( not ( = ?auto_218985 ?auto_218994 ) ) ( not ( = ?auto_218985 ?auto_218995 ) ) ( not ( = ?auto_218985 ?auto_218996 ) ) ( not ( = ?auto_218986 ?auto_218987 ) ) ( not ( = ?auto_218986 ?auto_218988 ) ) ( not ( = ?auto_218986 ?auto_218989 ) ) ( not ( = ?auto_218986 ?auto_218990 ) ) ( not ( = ?auto_218986 ?auto_218991 ) ) ( not ( = ?auto_218986 ?auto_218992 ) ) ( not ( = ?auto_218986 ?auto_218993 ) ) ( not ( = ?auto_218986 ?auto_218994 ) ) ( not ( = ?auto_218986 ?auto_218995 ) ) ( not ( = ?auto_218986 ?auto_218996 ) ) ( not ( = ?auto_218987 ?auto_218988 ) ) ( not ( = ?auto_218987 ?auto_218989 ) ) ( not ( = ?auto_218987 ?auto_218990 ) ) ( not ( = ?auto_218987 ?auto_218991 ) ) ( not ( = ?auto_218987 ?auto_218992 ) ) ( not ( = ?auto_218987 ?auto_218993 ) ) ( not ( = ?auto_218987 ?auto_218994 ) ) ( not ( = ?auto_218987 ?auto_218995 ) ) ( not ( = ?auto_218987 ?auto_218996 ) ) ( not ( = ?auto_218988 ?auto_218989 ) ) ( not ( = ?auto_218988 ?auto_218990 ) ) ( not ( = ?auto_218988 ?auto_218991 ) ) ( not ( = ?auto_218988 ?auto_218992 ) ) ( not ( = ?auto_218988 ?auto_218993 ) ) ( not ( = ?auto_218988 ?auto_218994 ) ) ( not ( = ?auto_218988 ?auto_218995 ) ) ( not ( = ?auto_218988 ?auto_218996 ) ) ( not ( = ?auto_218989 ?auto_218990 ) ) ( not ( = ?auto_218989 ?auto_218991 ) ) ( not ( = ?auto_218989 ?auto_218992 ) ) ( not ( = ?auto_218989 ?auto_218993 ) ) ( not ( = ?auto_218989 ?auto_218994 ) ) ( not ( = ?auto_218989 ?auto_218995 ) ) ( not ( = ?auto_218989 ?auto_218996 ) ) ( not ( = ?auto_218990 ?auto_218991 ) ) ( not ( = ?auto_218990 ?auto_218992 ) ) ( not ( = ?auto_218990 ?auto_218993 ) ) ( not ( = ?auto_218990 ?auto_218994 ) ) ( not ( = ?auto_218990 ?auto_218995 ) ) ( not ( = ?auto_218990 ?auto_218996 ) ) ( not ( = ?auto_218991 ?auto_218992 ) ) ( not ( = ?auto_218991 ?auto_218993 ) ) ( not ( = ?auto_218991 ?auto_218994 ) ) ( not ( = ?auto_218991 ?auto_218995 ) ) ( not ( = ?auto_218991 ?auto_218996 ) ) ( not ( = ?auto_218992 ?auto_218993 ) ) ( not ( = ?auto_218992 ?auto_218994 ) ) ( not ( = ?auto_218992 ?auto_218995 ) ) ( not ( = ?auto_218992 ?auto_218996 ) ) ( not ( = ?auto_218993 ?auto_218994 ) ) ( not ( = ?auto_218993 ?auto_218995 ) ) ( not ( = ?auto_218993 ?auto_218996 ) ) ( not ( = ?auto_218994 ?auto_218995 ) ) ( not ( = ?auto_218994 ?auto_218996 ) ) ( not ( = ?auto_218995 ?auto_218996 ) ) ( ON ?auto_218994 ?auto_218995 ) ( ON ?auto_218993 ?auto_218994 ) ( ON ?auto_218992 ?auto_218993 ) ( ON ?auto_218991 ?auto_218992 ) ( ON ?auto_218990 ?auto_218991 ) ( CLEAR ?auto_218988 ) ( ON ?auto_218989 ?auto_218990 ) ( CLEAR ?auto_218989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_218983 ?auto_218984 ?auto_218985 ?auto_218986 ?auto_218987 ?auto_218988 ?auto_218989 )
      ( MAKE-13PILE ?auto_218983 ?auto_218984 ?auto_218985 ?auto_218986 ?auto_218987 ?auto_218988 ?auto_218989 ?auto_218990 ?auto_218991 ?auto_218992 ?auto_218993 ?auto_218994 ?auto_218995 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219010 - BLOCK
      ?auto_219011 - BLOCK
      ?auto_219012 - BLOCK
      ?auto_219013 - BLOCK
      ?auto_219014 - BLOCK
      ?auto_219015 - BLOCK
      ?auto_219016 - BLOCK
      ?auto_219017 - BLOCK
      ?auto_219018 - BLOCK
      ?auto_219019 - BLOCK
      ?auto_219020 - BLOCK
      ?auto_219021 - BLOCK
      ?auto_219022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219022 ) ( ON-TABLE ?auto_219010 ) ( ON ?auto_219011 ?auto_219010 ) ( ON ?auto_219012 ?auto_219011 ) ( ON ?auto_219013 ?auto_219012 ) ( ON ?auto_219014 ?auto_219013 ) ( ON ?auto_219015 ?auto_219014 ) ( not ( = ?auto_219010 ?auto_219011 ) ) ( not ( = ?auto_219010 ?auto_219012 ) ) ( not ( = ?auto_219010 ?auto_219013 ) ) ( not ( = ?auto_219010 ?auto_219014 ) ) ( not ( = ?auto_219010 ?auto_219015 ) ) ( not ( = ?auto_219010 ?auto_219016 ) ) ( not ( = ?auto_219010 ?auto_219017 ) ) ( not ( = ?auto_219010 ?auto_219018 ) ) ( not ( = ?auto_219010 ?auto_219019 ) ) ( not ( = ?auto_219010 ?auto_219020 ) ) ( not ( = ?auto_219010 ?auto_219021 ) ) ( not ( = ?auto_219010 ?auto_219022 ) ) ( not ( = ?auto_219011 ?auto_219012 ) ) ( not ( = ?auto_219011 ?auto_219013 ) ) ( not ( = ?auto_219011 ?auto_219014 ) ) ( not ( = ?auto_219011 ?auto_219015 ) ) ( not ( = ?auto_219011 ?auto_219016 ) ) ( not ( = ?auto_219011 ?auto_219017 ) ) ( not ( = ?auto_219011 ?auto_219018 ) ) ( not ( = ?auto_219011 ?auto_219019 ) ) ( not ( = ?auto_219011 ?auto_219020 ) ) ( not ( = ?auto_219011 ?auto_219021 ) ) ( not ( = ?auto_219011 ?auto_219022 ) ) ( not ( = ?auto_219012 ?auto_219013 ) ) ( not ( = ?auto_219012 ?auto_219014 ) ) ( not ( = ?auto_219012 ?auto_219015 ) ) ( not ( = ?auto_219012 ?auto_219016 ) ) ( not ( = ?auto_219012 ?auto_219017 ) ) ( not ( = ?auto_219012 ?auto_219018 ) ) ( not ( = ?auto_219012 ?auto_219019 ) ) ( not ( = ?auto_219012 ?auto_219020 ) ) ( not ( = ?auto_219012 ?auto_219021 ) ) ( not ( = ?auto_219012 ?auto_219022 ) ) ( not ( = ?auto_219013 ?auto_219014 ) ) ( not ( = ?auto_219013 ?auto_219015 ) ) ( not ( = ?auto_219013 ?auto_219016 ) ) ( not ( = ?auto_219013 ?auto_219017 ) ) ( not ( = ?auto_219013 ?auto_219018 ) ) ( not ( = ?auto_219013 ?auto_219019 ) ) ( not ( = ?auto_219013 ?auto_219020 ) ) ( not ( = ?auto_219013 ?auto_219021 ) ) ( not ( = ?auto_219013 ?auto_219022 ) ) ( not ( = ?auto_219014 ?auto_219015 ) ) ( not ( = ?auto_219014 ?auto_219016 ) ) ( not ( = ?auto_219014 ?auto_219017 ) ) ( not ( = ?auto_219014 ?auto_219018 ) ) ( not ( = ?auto_219014 ?auto_219019 ) ) ( not ( = ?auto_219014 ?auto_219020 ) ) ( not ( = ?auto_219014 ?auto_219021 ) ) ( not ( = ?auto_219014 ?auto_219022 ) ) ( not ( = ?auto_219015 ?auto_219016 ) ) ( not ( = ?auto_219015 ?auto_219017 ) ) ( not ( = ?auto_219015 ?auto_219018 ) ) ( not ( = ?auto_219015 ?auto_219019 ) ) ( not ( = ?auto_219015 ?auto_219020 ) ) ( not ( = ?auto_219015 ?auto_219021 ) ) ( not ( = ?auto_219015 ?auto_219022 ) ) ( not ( = ?auto_219016 ?auto_219017 ) ) ( not ( = ?auto_219016 ?auto_219018 ) ) ( not ( = ?auto_219016 ?auto_219019 ) ) ( not ( = ?auto_219016 ?auto_219020 ) ) ( not ( = ?auto_219016 ?auto_219021 ) ) ( not ( = ?auto_219016 ?auto_219022 ) ) ( not ( = ?auto_219017 ?auto_219018 ) ) ( not ( = ?auto_219017 ?auto_219019 ) ) ( not ( = ?auto_219017 ?auto_219020 ) ) ( not ( = ?auto_219017 ?auto_219021 ) ) ( not ( = ?auto_219017 ?auto_219022 ) ) ( not ( = ?auto_219018 ?auto_219019 ) ) ( not ( = ?auto_219018 ?auto_219020 ) ) ( not ( = ?auto_219018 ?auto_219021 ) ) ( not ( = ?auto_219018 ?auto_219022 ) ) ( not ( = ?auto_219019 ?auto_219020 ) ) ( not ( = ?auto_219019 ?auto_219021 ) ) ( not ( = ?auto_219019 ?auto_219022 ) ) ( not ( = ?auto_219020 ?auto_219021 ) ) ( not ( = ?auto_219020 ?auto_219022 ) ) ( not ( = ?auto_219021 ?auto_219022 ) ) ( ON ?auto_219021 ?auto_219022 ) ( ON ?auto_219020 ?auto_219021 ) ( ON ?auto_219019 ?auto_219020 ) ( ON ?auto_219018 ?auto_219019 ) ( ON ?auto_219017 ?auto_219018 ) ( CLEAR ?auto_219015 ) ( ON ?auto_219016 ?auto_219017 ) ( CLEAR ?auto_219016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_219010 ?auto_219011 ?auto_219012 ?auto_219013 ?auto_219014 ?auto_219015 ?auto_219016 )
      ( MAKE-13PILE ?auto_219010 ?auto_219011 ?auto_219012 ?auto_219013 ?auto_219014 ?auto_219015 ?auto_219016 ?auto_219017 ?auto_219018 ?auto_219019 ?auto_219020 ?auto_219021 ?auto_219022 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219036 - BLOCK
      ?auto_219037 - BLOCK
      ?auto_219038 - BLOCK
      ?auto_219039 - BLOCK
      ?auto_219040 - BLOCK
      ?auto_219041 - BLOCK
      ?auto_219042 - BLOCK
      ?auto_219043 - BLOCK
      ?auto_219044 - BLOCK
      ?auto_219045 - BLOCK
      ?auto_219046 - BLOCK
      ?auto_219047 - BLOCK
      ?auto_219048 - BLOCK
    )
    :vars
    (
      ?auto_219049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219048 ?auto_219049 ) ( ON-TABLE ?auto_219036 ) ( ON ?auto_219037 ?auto_219036 ) ( ON ?auto_219038 ?auto_219037 ) ( ON ?auto_219039 ?auto_219038 ) ( ON ?auto_219040 ?auto_219039 ) ( not ( = ?auto_219036 ?auto_219037 ) ) ( not ( = ?auto_219036 ?auto_219038 ) ) ( not ( = ?auto_219036 ?auto_219039 ) ) ( not ( = ?auto_219036 ?auto_219040 ) ) ( not ( = ?auto_219036 ?auto_219041 ) ) ( not ( = ?auto_219036 ?auto_219042 ) ) ( not ( = ?auto_219036 ?auto_219043 ) ) ( not ( = ?auto_219036 ?auto_219044 ) ) ( not ( = ?auto_219036 ?auto_219045 ) ) ( not ( = ?auto_219036 ?auto_219046 ) ) ( not ( = ?auto_219036 ?auto_219047 ) ) ( not ( = ?auto_219036 ?auto_219048 ) ) ( not ( = ?auto_219036 ?auto_219049 ) ) ( not ( = ?auto_219037 ?auto_219038 ) ) ( not ( = ?auto_219037 ?auto_219039 ) ) ( not ( = ?auto_219037 ?auto_219040 ) ) ( not ( = ?auto_219037 ?auto_219041 ) ) ( not ( = ?auto_219037 ?auto_219042 ) ) ( not ( = ?auto_219037 ?auto_219043 ) ) ( not ( = ?auto_219037 ?auto_219044 ) ) ( not ( = ?auto_219037 ?auto_219045 ) ) ( not ( = ?auto_219037 ?auto_219046 ) ) ( not ( = ?auto_219037 ?auto_219047 ) ) ( not ( = ?auto_219037 ?auto_219048 ) ) ( not ( = ?auto_219037 ?auto_219049 ) ) ( not ( = ?auto_219038 ?auto_219039 ) ) ( not ( = ?auto_219038 ?auto_219040 ) ) ( not ( = ?auto_219038 ?auto_219041 ) ) ( not ( = ?auto_219038 ?auto_219042 ) ) ( not ( = ?auto_219038 ?auto_219043 ) ) ( not ( = ?auto_219038 ?auto_219044 ) ) ( not ( = ?auto_219038 ?auto_219045 ) ) ( not ( = ?auto_219038 ?auto_219046 ) ) ( not ( = ?auto_219038 ?auto_219047 ) ) ( not ( = ?auto_219038 ?auto_219048 ) ) ( not ( = ?auto_219038 ?auto_219049 ) ) ( not ( = ?auto_219039 ?auto_219040 ) ) ( not ( = ?auto_219039 ?auto_219041 ) ) ( not ( = ?auto_219039 ?auto_219042 ) ) ( not ( = ?auto_219039 ?auto_219043 ) ) ( not ( = ?auto_219039 ?auto_219044 ) ) ( not ( = ?auto_219039 ?auto_219045 ) ) ( not ( = ?auto_219039 ?auto_219046 ) ) ( not ( = ?auto_219039 ?auto_219047 ) ) ( not ( = ?auto_219039 ?auto_219048 ) ) ( not ( = ?auto_219039 ?auto_219049 ) ) ( not ( = ?auto_219040 ?auto_219041 ) ) ( not ( = ?auto_219040 ?auto_219042 ) ) ( not ( = ?auto_219040 ?auto_219043 ) ) ( not ( = ?auto_219040 ?auto_219044 ) ) ( not ( = ?auto_219040 ?auto_219045 ) ) ( not ( = ?auto_219040 ?auto_219046 ) ) ( not ( = ?auto_219040 ?auto_219047 ) ) ( not ( = ?auto_219040 ?auto_219048 ) ) ( not ( = ?auto_219040 ?auto_219049 ) ) ( not ( = ?auto_219041 ?auto_219042 ) ) ( not ( = ?auto_219041 ?auto_219043 ) ) ( not ( = ?auto_219041 ?auto_219044 ) ) ( not ( = ?auto_219041 ?auto_219045 ) ) ( not ( = ?auto_219041 ?auto_219046 ) ) ( not ( = ?auto_219041 ?auto_219047 ) ) ( not ( = ?auto_219041 ?auto_219048 ) ) ( not ( = ?auto_219041 ?auto_219049 ) ) ( not ( = ?auto_219042 ?auto_219043 ) ) ( not ( = ?auto_219042 ?auto_219044 ) ) ( not ( = ?auto_219042 ?auto_219045 ) ) ( not ( = ?auto_219042 ?auto_219046 ) ) ( not ( = ?auto_219042 ?auto_219047 ) ) ( not ( = ?auto_219042 ?auto_219048 ) ) ( not ( = ?auto_219042 ?auto_219049 ) ) ( not ( = ?auto_219043 ?auto_219044 ) ) ( not ( = ?auto_219043 ?auto_219045 ) ) ( not ( = ?auto_219043 ?auto_219046 ) ) ( not ( = ?auto_219043 ?auto_219047 ) ) ( not ( = ?auto_219043 ?auto_219048 ) ) ( not ( = ?auto_219043 ?auto_219049 ) ) ( not ( = ?auto_219044 ?auto_219045 ) ) ( not ( = ?auto_219044 ?auto_219046 ) ) ( not ( = ?auto_219044 ?auto_219047 ) ) ( not ( = ?auto_219044 ?auto_219048 ) ) ( not ( = ?auto_219044 ?auto_219049 ) ) ( not ( = ?auto_219045 ?auto_219046 ) ) ( not ( = ?auto_219045 ?auto_219047 ) ) ( not ( = ?auto_219045 ?auto_219048 ) ) ( not ( = ?auto_219045 ?auto_219049 ) ) ( not ( = ?auto_219046 ?auto_219047 ) ) ( not ( = ?auto_219046 ?auto_219048 ) ) ( not ( = ?auto_219046 ?auto_219049 ) ) ( not ( = ?auto_219047 ?auto_219048 ) ) ( not ( = ?auto_219047 ?auto_219049 ) ) ( not ( = ?auto_219048 ?auto_219049 ) ) ( ON ?auto_219047 ?auto_219048 ) ( ON ?auto_219046 ?auto_219047 ) ( ON ?auto_219045 ?auto_219046 ) ( ON ?auto_219044 ?auto_219045 ) ( ON ?auto_219043 ?auto_219044 ) ( ON ?auto_219042 ?auto_219043 ) ( CLEAR ?auto_219040 ) ( ON ?auto_219041 ?auto_219042 ) ( CLEAR ?auto_219041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_219036 ?auto_219037 ?auto_219038 ?auto_219039 ?auto_219040 ?auto_219041 )
      ( MAKE-13PILE ?auto_219036 ?auto_219037 ?auto_219038 ?auto_219039 ?auto_219040 ?auto_219041 ?auto_219042 ?auto_219043 ?auto_219044 ?auto_219045 ?auto_219046 ?auto_219047 ?auto_219048 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219063 - BLOCK
      ?auto_219064 - BLOCK
      ?auto_219065 - BLOCK
      ?auto_219066 - BLOCK
      ?auto_219067 - BLOCK
      ?auto_219068 - BLOCK
      ?auto_219069 - BLOCK
      ?auto_219070 - BLOCK
      ?auto_219071 - BLOCK
      ?auto_219072 - BLOCK
      ?auto_219073 - BLOCK
      ?auto_219074 - BLOCK
      ?auto_219075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219075 ) ( ON-TABLE ?auto_219063 ) ( ON ?auto_219064 ?auto_219063 ) ( ON ?auto_219065 ?auto_219064 ) ( ON ?auto_219066 ?auto_219065 ) ( ON ?auto_219067 ?auto_219066 ) ( not ( = ?auto_219063 ?auto_219064 ) ) ( not ( = ?auto_219063 ?auto_219065 ) ) ( not ( = ?auto_219063 ?auto_219066 ) ) ( not ( = ?auto_219063 ?auto_219067 ) ) ( not ( = ?auto_219063 ?auto_219068 ) ) ( not ( = ?auto_219063 ?auto_219069 ) ) ( not ( = ?auto_219063 ?auto_219070 ) ) ( not ( = ?auto_219063 ?auto_219071 ) ) ( not ( = ?auto_219063 ?auto_219072 ) ) ( not ( = ?auto_219063 ?auto_219073 ) ) ( not ( = ?auto_219063 ?auto_219074 ) ) ( not ( = ?auto_219063 ?auto_219075 ) ) ( not ( = ?auto_219064 ?auto_219065 ) ) ( not ( = ?auto_219064 ?auto_219066 ) ) ( not ( = ?auto_219064 ?auto_219067 ) ) ( not ( = ?auto_219064 ?auto_219068 ) ) ( not ( = ?auto_219064 ?auto_219069 ) ) ( not ( = ?auto_219064 ?auto_219070 ) ) ( not ( = ?auto_219064 ?auto_219071 ) ) ( not ( = ?auto_219064 ?auto_219072 ) ) ( not ( = ?auto_219064 ?auto_219073 ) ) ( not ( = ?auto_219064 ?auto_219074 ) ) ( not ( = ?auto_219064 ?auto_219075 ) ) ( not ( = ?auto_219065 ?auto_219066 ) ) ( not ( = ?auto_219065 ?auto_219067 ) ) ( not ( = ?auto_219065 ?auto_219068 ) ) ( not ( = ?auto_219065 ?auto_219069 ) ) ( not ( = ?auto_219065 ?auto_219070 ) ) ( not ( = ?auto_219065 ?auto_219071 ) ) ( not ( = ?auto_219065 ?auto_219072 ) ) ( not ( = ?auto_219065 ?auto_219073 ) ) ( not ( = ?auto_219065 ?auto_219074 ) ) ( not ( = ?auto_219065 ?auto_219075 ) ) ( not ( = ?auto_219066 ?auto_219067 ) ) ( not ( = ?auto_219066 ?auto_219068 ) ) ( not ( = ?auto_219066 ?auto_219069 ) ) ( not ( = ?auto_219066 ?auto_219070 ) ) ( not ( = ?auto_219066 ?auto_219071 ) ) ( not ( = ?auto_219066 ?auto_219072 ) ) ( not ( = ?auto_219066 ?auto_219073 ) ) ( not ( = ?auto_219066 ?auto_219074 ) ) ( not ( = ?auto_219066 ?auto_219075 ) ) ( not ( = ?auto_219067 ?auto_219068 ) ) ( not ( = ?auto_219067 ?auto_219069 ) ) ( not ( = ?auto_219067 ?auto_219070 ) ) ( not ( = ?auto_219067 ?auto_219071 ) ) ( not ( = ?auto_219067 ?auto_219072 ) ) ( not ( = ?auto_219067 ?auto_219073 ) ) ( not ( = ?auto_219067 ?auto_219074 ) ) ( not ( = ?auto_219067 ?auto_219075 ) ) ( not ( = ?auto_219068 ?auto_219069 ) ) ( not ( = ?auto_219068 ?auto_219070 ) ) ( not ( = ?auto_219068 ?auto_219071 ) ) ( not ( = ?auto_219068 ?auto_219072 ) ) ( not ( = ?auto_219068 ?auto_219073 ) ) ( not ( = ?auto_219068 ?auto_219074 ) ) ( not ( = ?auto_219068 ?auto_219075 ) ) ( not ( = ?auto_219069 ?auto_219070 ) ) ( not ( = ?auto_219069 ?auto_219071 ) ) ( not ( = ?auto_219069 ?auto_219072 ) ) ( not ( = ?auto_219069 ?auto_219073 ) ) ( not ( = ?auto_219069 ?auto_219074 ) ) ( not ( = ?auto_219069 ?auto_219075 ) ) ( not ( = ?auto_219070 ?auto_219071 ) ) ( not ( = ?auto_219070 ?auto_219072 ) ) ( not ( = ?auto_219070 ?auto_219073 ) ) ( not ( = ?auto_219070 ?auto_219074 ) ) ( not ( = ?auto_219070 ?auto_219075 ) ) ( not ( = ?auto_219071 ?auto_219072 ) ) ( not ( = ?auto_219071 ?auto_219073 ) ) ( not ( = ?auto_219071 ?auto_219074 ) ) ( not ( = ?auto_219071 ?auto_219075 ) ) ( not ( = ?auto_219072 ?auto_219073 ) ) ( not ( = ?auto_219072 ?auto_219074 ) ) ( not ( = ?auto_219072 ?auto_219075 ) ) ( not ( = ?auto_219073 ?auto_219074 ) ) ( not ( = ?auto_219073 ?auto_219075 ) ) ( not ( = ?auto_219074 ?auto_219075 ) ) ( ON ?auto_219074 ?auto_219075 ) ( ON ?auto_219073 ?auto_219074 ) ( ON ?auto_219072 ?auto_219073 ) ( ON ?auto_219071 ?auto_219072 ) ( ON ?auto_219070 ?auto_219071 ) ( ON ?auto_219069 ?auto_219070 ) ( CLEAR ?auto_219067 ) ( ON ?auto_219068 ?auto_219069 ) ( CLEAR ?auto_219068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_219063 ?auto_219064 ?auto_219065 ?auto_219066 ?auto_219067 ?auto_219068 )
      ( MAKE-13PILE ?auto_219063 ?auto_219064 ?auto_219065 ?auto_219066 ?auto_219067 ?auto_219068 ?auto_219069 ?auto_219070 ?auto_219071 ?auto_219072 ?auto_219073 ?auto_219074 ?auto_219075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219089 - BLOCK
      ?auto_219090 - BLOCK
      ?auto_219091 - BLOCK
      ?auto_219092 - BLOCK
      ?auto_219093 - BLOCK
      ?auto_219094 - BLOCK
      ?auto_219095 - BLOCK
      ?auto_219096 - BLOCK
      ?auto_219097 - BLOCK
      ?auto_219098 - BLOCK
      ?auto_219099 - BLOCK
      ?auto_219100 - BLOCK
      ?auto_219101 - BLOCK
    )
    :vars
    (
      ?auto_219102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219101 ?auto_219102 ) ( ON-TABLE ?auto_219089 ) ( ON ?auto_219090 ?auto_219089 ) ( ON ?auto_219091 ?auto_219090 ) ( ON ?auto_219092 ?auto_219091 ) ( not ( = ?auto_219089 ?auto_219090 ) ) ( not ( = ?auto_219089 ?auto_219091 ) ) ( not ( = ?auto_219089 ?auto_219092 ) ) ( not ( = ?auto_219089 ?auto_219093 ) ) ( not ( = ?auto_219089 ?auto_219094 ) ) ( not ( = ?auto_219089 ?auto_219095 ) ) ( not ( = ?auto_219089 ?auto_219096 ) ) ( not ( = ?auto_219089 ?auto_219097 ) ) ( not ( = ?auto_219089 ?auto_219098 ) ) ( not ( = ?auto_219089 ?auto_219099 ) ) ( not ( = ?auto_219089 ?auto_219100 ) ) ( not ( = ?auto_219089 ?auto_219101 ) ) ( not ( = ?auto_219089 ?auto_219102 ) ) ( not ( = ?auto_219090 ?auto_219091 ) ) ( not ( = ?auto_219090 ?auto_219092 ) ) ( not ( = ?auto_219090 ?auto_219093 ) ) ( not ( = ?auto_219090 ?auto_219094 ) ) ( not ( = ?auto_219090 ?auto_219095 ) ) ( not ( = ?auto_219090 ?auto_219096 ) ) ( not ( = ?auto_219090 ?auto_219097 ) ) ( not ( = ?auto_219090 ?auto_219098 ) ) ( not ( = ?auto_219090 ?auto_219099 ) ) ( not ( = ?auto_219090 ?auto_219100 ) ) ( not ( = ?auto_219090 ?auto_219101 ) ) ( not ( = ?auto_219090 ?auto_219102 ) ) ( not ( = ?auto_219091 ?auto_219092 ) ) ( not ( = ?auto_219091 ?auto_219093 ) ) ( not ( = ?auto_219091 ?auto_219094 ) ) ( not ( = ?auto_219091 ?auto_219095 ) ) ( not ( = ?auto_219091 ?auto_219096 ) ) ( not ( = ?auto_219091 ?auto_219097 ) ) ( not ( = ?auto_219091 ?auto_219098 ) ) ( not ( = ?auto_219091 ?auto_219099 ) ) ( not ( = ?auto_219091 ?auto_219100 ) ) ( not ( = ?auto_219091 ?auto_219101 ) ) ( not ( = ?auto_219091 ?auto_219102 ) ) ( not ( = ?auto_219092 ?auto_219093 ) ) ( not ( = ?auto_219092 ?auto_219094 ) ) ( not ( = ?auto_219092 ?auto_219095 ) ) ( not ( = ?auto_219092 ?auto_219096 ) ) ( not ( = ?auto_219092 ?auto_219097 ) ) ( not ( = ?auto_219092 ?auto_219098 ) ) ( not ( = ?auto_219092 ?auto_219099 ) ) ( not ( = ?auto_219092 ?auto_219100 ) ) ( not ( = ?auto_219092 ?auto_219101 ) ) ( not ( = ?auto_219092 ?auto_219102 ) ) ( not ( = ?auto_219093 ?auto_219094 ) ) ( not ( = ?auto_219093 ?auto_219095 ) ) ( not ( = ?auto_219093 ?auto_219096 ) ) ( not ( = ?auto_219093 ?auto_219097 ) ) ( not ( = ?auto_219093 ?auto_219098 ) ) ( not ( = ?auto_219093 ?auto_219099 ) ) ( not ( = ?auto_219093 ?auto_219100 ) ) ( not ( = ?auto_219093 ?auto_219101 ) ) ( not ( = ?auto_219093 ?auto_219102 ) ) ( not ( = ?auto_219094 ?auto_219095 ) ) ( not ( = ?auto_219094 ?auto_219096 ) ) ( not ( = ?auto_219094 ?auto_219097 ) ) ( not ( = ?auto_219094 ?auto_219098 ) ) ( not ( = ?auto_219094 ?auto_219099 ) ) ( not ( = ?auto_219094 ?auto_219100 ) ) ( not ( = ?auto_219094 ?auto_219101 ) ) ( not ( = ?auto_219094 ?auto_219102 ) ) ( not ( = ?auto_219095 ?auto_219096 ) ) ( not ( = ?auto_219095 ?auto_219097 ) ) ( not ( = ?auto_219095 ?auto_219098 ) ) ( not ( = ?auto_219095 ?auto_219099 ) ) ( not ( = ?auto_219095 ?auto_219100 ) ) ( not ( = ?auto_219095 ?auto_219101 ) ) ( not ( = ?auto_219095 ?auto_219102 ) ) ( not ( = ?auto_219096 ?auto_219097 ) ) ( not ( = ?auto_219096 ?auto_219098 ) ) ( not ( = ?auto_219096 ?auto_219099 ) ) ( not ( = ?auto_219096 ?auto_219100 ) ) ( not ( = ?auto_219096 ?auto_219101 ) ) ( not ( = ?auto_219096 ?auto_219102 ) ) ( not ( = ?auto_219097 ?auto_219098 ) ) ( not ( = ?auto_219097 ?auto_219099 ) ) ( not ( = ?auto_219097 ?auto_219100 ) ) ( not ( = ?auto_219097 ?auto_219101 ) ) ( not ( = ?auto_219097 ?auto_219102 ) ) ( not ( = ?auto_219098 ?auto_219099 ) ) ( not ( = ?auto_219098 ?auto_219100 ) ) ( not ( = ?auto_219098 ?auto_219101 ) ) ( not ( = ?auto_219098 ?auto_219102 ) ) ( not ( = ?auto_219099 ?auto_219100 ) ) ( not ( = ?auto_219099 ?auto_219101 ) ) ( not ( = ?auto_219099 ?auto_219102 ) ) ( not ( = ?auto_219100 ?auto_219101 ) ) ( not ( = ?auto_219100 ?auto_219102 ) ) ( not ( = ?auto_219101 ?auto_219102 ) ) ( ON ?auto_219100 ?auto_219101 ) ( ON ?auto_219099 ?auto_219100 ) ( ON ?auto_219098 ?auto_219099 ) ( ON ?auto_219097 ?auto_219098 ) ( ON ?auto_219096 ?auto_219097 ) ( ON ?auto_219095 ?auto_219096 ) ( ON ?auto_219094 ?auto_219095 ) ( CLEAR ?auto_219092 ) ( ON ?auto_219093 ?auto_219094 ) ( CLEAR ?auto_219093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_219089 ?auto_219090 ?auto_219091 ?auto_219092 ?auto_219093 )
      ( MAKE-13PILE ?auto_219089 ?auto_219090 ?auto_219091 ?auto_219092 ?auto_219093 ?auto_219094 ?auto_219095 ?auto_219096 ?auto_219097 ?auto_219098 ?auto_219099 ?auto_219100 ?auto_219101 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219116 - BLOCK
      ?auto_219117 - BLOCK
      ?auto_219118 - BLOCK
      ?auto_219119 - BLOCK
      ?auto_219120 - BLOCK
      ?auto_219121 - BLOCK
      ?auto_219122 - BLOCK
      ?auto_219123 - BLOCK
      ?auto_219124 - BLOCK
      ?auto_219125 - BLOCK
      ?auto_219126 - BLOCK
      ?auto_219127 - BLOCK
      ?auto_219128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219128 ) ( ON-TABLE ?auto_219116 ) ( ON ?auto_219117 ?auto_219116 ) ( ON ?auto_219118 ?auto_219117 ) ( ON ?auto_219119 ?auto_219118 ) ( not ( = ?auto_219116 ?auto_219117 ) ) ( not ( = ?auto_219116 ?auto_219118 ) ) ( not ( = ?auto_219116 ?auto_219119 ) ) ( not ( = ?auto_219116 ?auto_219120 ) ) ( not ( = ?auto_219116 ?auto_219121 ) ) ( not ( = ?auto_219116 ?auto_219122 ) ) ( not ( = ?auto_219116 ?auto_219123 ) ) ( not ( = ?auto_219116 ?auto_219124 ) ) ( not ( = ?auto_219116 ?auto_219125 ) ) ( not ( = ?auto_219116 ?auto_219126 ) ) ( not ( = ?auto_219116 ?auto_219127 ) ) ( not ( = ?auto_219116 ?auto_219128 ) ) ( not ( = ?auto_219117 ?auto_219118 ) ) ( not ( = ?auto_219117 ?auto_219119 ) ) ( not ( = ?auto_219117 ?auto_219120 ) ) ( not ( = ?auto_219117 ?auto_219121 ) ) ( not ( = ?auto_219117 ?auto_219122 ) ) ( not ( = ?auto_219117 ?auto_219123 ) ) ( not ( = ?auto_219117 ?auto_219124 ) ) ( not ( = ?auto_219117 ?auto_219125 ) ) ( not ( = ?auto_219117 ?auto_219126 ) ) ( not ( = ?auto_219117 ?auto_219127 ) ) ( not ( = ?auto_219117 ?auto_219128 ) ) ( not ( = ?auto_219118 ?auto_219119 ) ) ( not ( = ?auto_219118 ?auto_219120 ) ) ( not ( = ?auto_219118 ?auto_219121 ) ) ( not ( = ?auto_219118 ?auto_219122 ) ) ( not ( = ?auto_219118 ?auto_219123 ) ) ( not ( = ?auto_219118 ?auto_219124 ) ) ( not ( = ?auto_219118 ?auto_219125 ) ) ( not ( = ?auto_219118 ?auto_219126 ) ) ( not ( = ?auto_219118 ?auto_219127 ) ) ( not ( = ?auto_219118 ?auto_219128 ) ) ( not ( = ?auto_219119 ?auto_219120 ) ) ( not ( = ?auto_219119 ?auto_219121 ) ) ( not ( = ?auto_219119 ?auto_219122 ) ) ( not ( = ?auto_219119 ?auto_219123 ) ) ( not ( = ?auto_219119 ?auto_219124 ) ) ( not ( = ?auto_219119 ?auto_219125 ) ) ( not ( = ?auto_219119 ?auto_219126 ) ) ( not ( = ?auto_219119 ?auto_219127 ) ) ( not ( = ?auto_219119 ?auto_219128 ) ) ( not ( = ?auto_219120 ?auto_219121 ) ) ( not ( = ?auto_219120 ?auto_219122 ) ) ( not ( = ?auto_219120 ?auto_219123 ) ) ( not ( = ?auto_219120 ?auto_219124 ) ) ( not ( = ?auto_219120 ?auto_219125 ) ) ( not ( = ?auto_219120 ?auto_219126 ) ) ( not ( = ?auto_219120 ?auto_219127 ) ) ( not ( = ?auto_219120 ?auto_219128 ) ) ( not ( = ?auto_219121 ?auto_219122 ) ) ( not ( = ?auto_219121 ?auto_219123 ) ) ( not ( = ?auto_219121 ?auto_219124 ) ) ( not ( = ?auto_219121 ?auto_219125 ) ) ( not ( = ?auto_219121 ?auto_219126 ) ) ( not ( = ?auto_219121 ?auto_219127 ) ) ( not ( = ?auto_219121 ?auto_219128 ) ) ( not ( = ?auto_219122 ?auto_219123 ) ) ( not ( = ?auto_219122 ?auto_219124 ) ) ( not ( = ?auto_219122 ?auto_219125 ) ) ( not ( = ?auto_219122 ?auto_219126 ) ) ( not ( = ?auto_219122 ?auto_219127 ) ) ( not ( = ?auto_219122 ?auto_219128 ) ) ( not ( = ?auto_219123 ?auto_219124 ) ) ( not ( = ?auto_219123 ?auto_219125 ) ) ( not ( = ?auto_219123 ?auto_219126 ) ) ( not ( = ?auto_219123 ?auto_219127 ) ) ( not ( = ?auto_219123 ?auto_219128 ) ) ( not ( = ?auto_219124 ?auto_219125 ) ) ( not ( = ?auto_219124 ?auto_219126 ) ) ( not ( = ?auto_219124 ?auto_219127 ) ) ( not ( = ?auto_219124 ?auto_219128 ) ) ( not ( = ?auto_219125 ?auto_219126 ) ) ( not ( = ?auto_219125 ?auto_219127 ) ) ( not ( = ?auto_219125 ?auto_219128 ) ) ( not ( = ?auto_219126 ?auto_219127 ) ) ( not ( = ?auto_219126 ?auto_219128 ) ) ( not ( = ?auto_219127 ?auto_219128 ) ) ( ON ?auto_219127 ?auto_219128 ) ( ON ?auto_219126 ?auto_219127 ) ( ON ?auto_219125 ?auto_219126 ) ( ON ?auto_219124 ?auto_219125 ) ( ON ?auto_219123 ?auto_219124 ) ( ON ?auto_219122 ?auto_219123 ) ( ON ?auto_219121 ?auto_219122 ) ( CLEAR ?auto_219119 ) ( ON ?auto_219120 ?auto_219121 ) ( CLEAR ?auto_219120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_219116 ?auto_219117 ?auto_219118 ?auto_219119 ?auto_219120 )
      ( MAKE-13PILE ?auto_219116 ?auto_219117 ?auto_219118 ?auto_219119 ?auto_219120 ?auto_219121 ?auto_219122 ?auto_219123 ?auto_219124 ?auto_219125 ?auto_219126 ?auto_219127 ?auto_219128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219142 - BLOCK
      ?auto_219143 - BLOCK
      ?auto_219144 - BLOCK
      ?auto_219145 - BLOCK
      ?auto_219146 - BLOCK
      ?auto_219147 - BLOCK
      ?auto_219148 - BLOCK
      ?auto_219149 - BLOCK
      ?auto_219150 - BLOCK
      ?auto_219151 - BLOCK
      ?auto_219152 - BLOCK
      ?auto_219153 - BLOCK
      ?auto_219154 - BLOCK
    )
    :vars
    (
      ?auto_219155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219154 ?auto_219155 ) ( ON-TABLE ?auto_219142 ) ( ON ?auto_219143 ?auto_219142 ) ( ON ?auto_219144 ?auto_219143 ) ( not ( = ?auto_219142 ?auto_219143 ) ) ( not ( = ?auto_219142 ?auto_219144 ) ) ( not ( = ?auto_219142 ?auto_219145 ) ) ( not ( = ?auto_219142 ?auto_219146 ) ) ( not ( = ?auto_219142 ?auto_219147 ) ) ( not ( = ?auto_219142 ?auto_219148 ) ) ( not ( = ?auto_219142 ?auto_219149 ) ) ( not ( = ?auto_219142 ?auto_219150 ) ) ( not ( = ?auto_219142 ?auto_219151 ) ) ( not ( = ?auto_219142 ?auto_219152 ) ) ( not ( = ?auto_219142 ?auto_219153 ) ) ( not ( = ?auto_219142 ?auto_219154 ) ) ( not ( = ?auto_219142 ?auto_219155 ) ) ( not ( = ?auto_219143 ?auto_219144 ) ) ( not ( = ?auto_219143 ?auto_219145 ) ) ( not ( = ?auto_219143 ?auto_219146 ) ) ( not ( = ?auto_219143 ?auto_219147 ) ) ( not ( = ?auto_219143 ?auto_219148 ) ) ( not ( = ?auto_219143 ?auto_219149 ) ) ( not ( = ?auto_219143 ?auto_219150 ) ) ( not ( = ?auto_219143 ?auto_219151 ) ) ( not ( = ?auto_219143 ?auto_219152 ) ) ( not ( = ?auto_219143 ?auto_219153 ) ) ( not ( = ?auto_219143 ?auto_219154 ) ) ( not ( = ?auto_219143 ?auto_219155 ) ) ( not ( = ?auto_219144 ?auto_219145 ) ) ( not ( = ?auto_219144 ?auto_219146 ) ) ( not ( = ?auto_219144 ?auto_219147 ) ) ( not ( = ?auto_219144 ?auto_219148 ) ) ( not ( = ?auto_219144 ?auto_219149 ) ) ( not ( = ?auto_219144 ?auto_219150 ) ) ( not ( = ?auto_219144 ?auto_219151 ) ) ( not ( = ?auto_219144 ?auto_219152 ) ) ( not ( = ?auto_219144 ?auto_219153 ) ) ( not ( = ?auto_219144 ?auto_219154 ) ) ( not ( = ?auto_219144 ?auto_219155 ) ) ( not ( = ?auto_219145 ?auto_219146 ) ) ( not ( = ?auto_219145 ?auto_219147 ) ) ( not ( = ?auto_219145 ?auto_219148 ) ) ( not ( = ?auto_219145 ?auto_219149 ) ) ( not ( = ?auto_219145 ?auto_219150 ) ) ( not ( = ?auto_219145 ?auto_219151 ) ) ( not ( = ?auto_219145 ?auto_219152 ) ) ( not ( = ?auto_219145 ?auto_219153 ) ) ( not ( = ?auto_219145 ?auto_219154 ) ) ( not ( = ?auto_219145 ?auto_219155 ) ) ( not ( = ?auto_219146 ?auto_219147 ) ) ( not ( = ?auto_219146 ?auto_219148 ) ) ( not ( = ?auto_219146 ?auto_219149 ) ) ( not ( = ?auto_219146 ?auto_219150 ) ) ( not ( = ?auto_219146 ?auto_219151 ) ) ( not ( = ?auto_219146 ?auto_219152 ) ) ( not ( = ?auto_219146 ?auto_219153 ) ) ( not ( = ?auto_219146 ?auto_219154 ) ) ( not ( = ?auto_219146 ?auto_219155 ) ) ( not ( = ?auto_219147 ?auto_219148 ) ) ( not ( = ?auto_219147 ?auto_219149 ) ) ( not ( = ?auto_219147 ?auto_219150 ) ) ( not ( = ?auto_219147 ?auto_219151 ) ) ( not ( = ?auto_219147 ?auto_219152 ) ) ( not ( = ?auto_219147 ?auto_219153 ) ) ( not ( = ?auto_219147 ?auto_219154 ) ) ( not ( = ?auto_219147 ?auto_219155 ) ) ( not ( = ?auto_219148 ?auto_219149 ) ) ( not ( = ?auto_219148 ?auto_219150 ) ) ( not ( = ?auto_219148 ?auto_219151 ) ) ( not ( = ?auto_219148 ?auto_219152 ) ) ( not ( = ?auto_219148 ?auto_219153 ) ) ( not ( = ?auto_219148 ?auto_219154 ) ) ( not ( = ?auto_219148 ?auto_219155 ) ) ( not ( = ?auto_219149 ?auto_219150 ) ) ( not ( = ?auto_219149 ?auto_219151 ) ) ( not ( = ?auto_219149 ?auto_219152 ) ) ( not ( = ?auto_219149 ?auto_219153 ) ) ( not ( = ?auto_219149 ?auto_219154 ) ) ( not ( = ?auto_219149 ?auto_219155 ) ) ( not ( = ?auto_219150 ?auto_219151 ) ) ( not ( = ?auto_219150 ?auto_219152 ) ) ( not ( = ?auto_219150 ?auto_219153 ) ) ( not ( = ?auto_219150 ?auto_219154 ) ) ( not ( = ?auto_219150 ?auto_219155 ) ) ( not ( = ?auto_219151 ?auto_219152 ) ) ( not ( = ?auto_219151 ?auto_219153 ) ) ( not ( = ?auto_219151 ?auto_219154 ) ) ( not ( = ?auto_219151 ?auto_219155 ) ) ( not ( = ?auto_219152 ?auto_219153 ) ) ( not ( = ?auto_219152 ?auto_219154 ) ) ( not ( = ?auto_219152 ?auto_219155 ) ) ( not ( = ?auto_219153 ?auto_219154 ) ) ( not ( = ?auto_219153 ?auto_219155 ) ) ( not ( = ?auto_219154 ?auto_219155 ) ) ( ON ?auto_219153 ?auto_219154 ) ( ON ?auto_219152 ?auto_219153 ) ( ON ?auto_219151 ?auto_219152 ) ( ON ?auto_219150 ?auto_219151 ) ( ON ?auto_219149 ?auto_219150 ) ( ON ?auto_219148 ?auto_219149 ) ( ON ?auto_219147 ?auto_219148 ) ( ON ?auto_219146 ?auto_219147 ) ( CLEAR ?auto_219144 ) ( ON ?auto_219145 ?auto_219146 ) ( CLEAR ?auto_219145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219142 ?auto_219143 ?auto_219144 ?auto_219145 )
      ( MAKE-13PILE ?auto_219142 ?auto_219143 ?auto_219144 ?auto_219145 ?auto_219146 ?auto_219147 ?auto_219148 ?auto_219149 ?auto_219150 ?auto_219151 ?auto_219152 ?auto_219153 ?auto_219154 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219169 - BLOCK
      ?auto_219170 - BLOCK
      ?auto_219171 - BLOCK
      ?auto_219172 - BLOCK
      ?auto_219173 - BLOCK
      ?auto_219174 - BLOCK
      ?auto_219175 - BLOCK
      ?auto_219176 - BLOCK
      ?auto_219177 - BLOCK
      ?auto_219178 - BLOCK
      ?auto_219179 - BLOCK
      ?auto_219180 - BLOCK
      ?auto_219181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219181 ) ( ON-TABLE ?auto_219169 ) ( ON ?auto_219170 ?auto_219169 ) ( ON ?auto_219171 ?auto_219170 ) ( not ( = ?auto_219169 ?auto_219170 ) ) ( not ( = ?auto_219169 ?auto_219171 ) ) ( not ( = ?auto_219169 ?auto_219172 ) ) ( not ( = ?auto_219169 ?auto_219173 ) ) ( not ( = ?auto_219169 ?auto_219174 ) ) ( not ( = ?auto_219169 ?auto_219175 ) ) ( not ( = ?auto_219169 ?auto_219176 ) ) ( not ( = ?auto_219169 ?auto_219177 ) ) ( not ( = ?auto_219169 ?auto_219178 ) ) ( not ( = ?auto_219169 ?auto_219179 ) ) ( not ( = ?auto_219169 ?auto_219180 ) ) ( not ( = ?auto_219169 ?auto_219181 ) ) ( not ( = ?auto_219170 ?auto_219171 ) ) ( not ( = ?auto_219170 ?auto_219172 ) ) ( not ( = ?auto_219170 ?auto_219173 ) ) ( not ( = ?auto_219170 ?auto_219174 ) ) ( not ( = ?auto_219170 ?auto_219175 ) ) ( not ( = ?auto_219170 ?auto_219176 ) ) ( not ( = ?auto_219170 ?auto_219177 ) ) ( not ( = ?auto_219170 ?auto_219178 ) ) ( not ( = ?auto_219170 ?auto_219179 ) ) ( not ( = ?auto_219170 ?auto_219180 ) ) ( not ( = ?auto_219170 ?auto_219181 ) ) ( not ( = ?auto_219171 ?auto_219172 ) ) ( not ( = ?auto_219171 ?auto_219173 ) ) ( not ( = ?auto_219171 ?auto_219174 ) ) ( not ( = ?auto_219171 ?auto_219175 ) ) ( not ( = ?auto_219171 ?auto_219176 ) ) ( not ( = ?auto_219171 ?auto_219177 ) ) ( not ( = ?auto_219171 ?auto_219178 ) ) ( not ( = ?auto_219171 ?auto_219179 ) ) ( not ( = ?auto_219171 ?auto_219180 ) ) ( not ( = ?auto_219171 ?auto_219181 ) ) ( not ( = ?auto_219172 ?auto_219173 ) ) ( not ( = ?auto_219172 ?auto_219174 ) ) ( not ( = ?auto_219172 ?auto_219175 ) ) ( not ( = ?auto_219172 ?auto_219176 ) ) ( not ( = ?auto_219172 ?auto_219177 ) ) ( not ( = ?auto_219172 ?auto_219178 ) ) ( not ( = ?auto_219172 ?auto_219179 ) ) ( not ( = ?auto_219172 ?auto_219180 ) ) ( not ( = ?auto_219172 ?auto_219181 ) ) ( not ( = ?auto_219173 ?auto_219174 ) ) ( not ( = ?auto_219173 ?auto_219175 ) ) ( not ( = ?auto_219173 ?auto_219176 ) ) ( not ( = ?auto_219173 ?auto_219177 ) ) ( not ( = ?auto_219173 ?auto_219178 ) ) ( not ( = ?auto_219173 ?auto_219179 ) ) ( not ( = ?auto_219173 ?auto_219180 ) ) ( not ( = ?auto_219173 ?auto_219181 ) ) ( not ( = ?auto_219174 ?auto_219175 ) ) ( not ( = ?auto_219174 ?auto_219176 ) ) ( not ( = ?auto_219174 ?auto_219177 ) ) ( not ( = ?auto_219174 ?auto_219178 ) ) ( not ( = ?auto_219174 ?auto_219179 ) ) ( not ( = ?auto_219174 ?auto_219180 ) ) ( not ( = ?auto_219174 ?auto_219181 ) ) ( not ( = ?auto_219175 ?auto_219176 ) ) ( not ( = ?auto_219175 ?auto_219177 ) ) ( not ( = ?auto_219175 ?auto_219178 ) ) ( not ( = ?auto_219175 ?auto_219179 ) ) ( not ( = ?auto_219175 ?auto_219180 ) ) ( not ( = ?auto_219175 ?auto_219181 ) ) ( not ( = ?auto_219176 ?auto_219177 ) ) ( not ( = ?auto_219176 ?auto_219178 ) ) ( not ( = ?auto_219176 ?auto_219179 ) ) ( not ( = ?auto_219176 ?auto_219180 ) ) ( not ( = ?auto_219176 ?auto_219181 ) ) ( not ( = ?auto_219177 ?auto_219178 ) ) ( not ( = ?auto_219177 ?auto_219179 ) ) ( not ( = ?auto_219177 ?auto_219180 ) ) ( not ( = ?auto_219177 ?auto_219181 ) ) ( not ( = ?auto_219178 ?auto_219179 ) ) ( not ( = ?auto_219178 ?auto_219180 ) ) ( not ( = ?auto_219178 ?auto_219181 ) ) ( not ( = ?auto_219179 ?auto_219180 ) ) ( not ( = ?auto_219179 ?auto_219181 ) ) ( not ( = ?auto_219180 ?auto_219181 ) ) ( ON ?auto_219180 ?auto_219181 ) ( ON ?auto_219179 ?auto_219180 ) ( ON ?auto_219178 ?auto_219179 ) ( ON ?auto_219177 ?auto_219178 ) ( ON ?auto_219176 ?auto_219177 ) ( ON ?auto_219175 ?auto_219176 ) ( ON ?auto_219174 ?auto_219175 ) ( ON ?auto_219173 ?auto_219174 ) ( CLEAR ?auto_219171 ) ( ON ?auto_219172 ?auto_219173 ) ( CLEAR ?auto_219172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_219169 ?auto_219170 ?auto_219171 ?auto_219172 )
      ( MAKE-13PILE ?auto_219169 ?auto_219170 ?auto_219171 ?auto_219172 ?auto_219173 ?auto_219174 ?auto_219175 ?auto_219176 ?auto_219177 ?auto_219178 ?auto_219179 ?auto_219180 ?auto_219181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219195 - BLOCK
      ?auto_219196 - BLOCK
      ?auto_219197 - BLOCK
      ?auto_219198 - BLOCK
      ?auto_219199 - BLOCK
      ?auto_219200 - BLOCK
      ?auto_219201 - BLOCK
      ?auto_219202 - BLOCK
      ?auto_219203 - BLOCK
      ?auto_219204 - BLOCK
      ?auto_219205 - BLOCK
      ?auto_219206 - BLOCK
      ?auto_219207 - BLOCK
    )
    :vars
    (
      ?auto_219208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219207 ?auto_219208 ) ( ON-TABLE ?auto_219195 ) ( ON ?auto_219196 ?auto_219195 ) ( not ( = ?auto_219195 ?auto_219196 ) ) ( not ( = ?auto_219195 ?auto_219197 ) ) ( not ( = ?auto_219195 ?auto_219198 ) ) ( not ( = ?auto_219195 ?auto_219199 ) ) ( not ( = ?auto_219195 ?auto_219200 ) ) ( not ( = ?auto_219195 ?auto_219201 ) ) ( not ( = ?auto_219195 ?auto_219202 ) ) ( not ( = ?auto_219195 ?auto_219203 ) ) ( not ( = ?auto_219195 ?auto_219204 ) ) ( not ( = ?auto_219195 ?auto_219205 ) ) ( not ( = ?auto_219195 ?auto_219206 ) ) ( not ( = ?auto_219195 ?auto_219207 ) ) ( not ( = ?auto_219195 ?auto_219208 ) ) ( not ( = ?auto_219196 ?auto_219197 ) ) ( not ( = ?auto_219196 ?auto_219198 ) ) ( not ( = ?auto_219196 ?auto_219199 ) ) ( not ( = ?auto_219196 ?auto_219200 ) ) ( not ( = ?auto_219196 ?auto_219201 ) ) ( not ( = ?auto_219196 ?auto_219202 ) ) ( not ( = ?auto_219196 ?auto_219203 ) ) ( not ( = ?auto_219196 ?auto_219204 ) ) ( not ( = ?auto_219196 ?auto_219205 ) ) ( not ( = ?auto_219196 ?auto_219206 ) ) ( not ( = ?auto_219196 ?auto_219207 ) ) ( not ( = ?auto_219196 ?auto_219208 ) ) ( not ( = ?auto_219197 ?auto_219198 ) ) ( not ( = ?auto_219197 ?auto_219199 ) ) ( not ( = ?auto_219197 ?auto_219200 ) ) ( not ( = ?auto_219197 ?auto_219201 ) ) ( not ( = ?auto_219197 ?auto_219202 ) ) ( not ( = ?auto_219197 ?auto_219203 ) ) ( not ( = ?auto_219197 ?auto_219204 ) ) ( not ( = ?auto_219197 ?auto_219205 ) ) ( not ( = ?auto_219197 ?auto_219206 ) ) ( not ( = ?auto_219197 ?auto_219207 ) ) ( not ( = ?auto_219197 ?auto_219208 ) ) ( not ( = ?auto_219198 ?auto_219199 ) ) ( not ( = ?auto_219198 ?auto_219200 ) ) ( not ( = ?auto_219198 ?auto_219201 ) ) ( not ( = ?auto_219198 ?auto_219202 ) ) ( not ( = ?auto_219198 ?auto_219203 ) ) ( not ( = ?auto_219198 ?auto_219204 ) ) ( not ( = ?auto_219198 ?auto_219205 ) ) ( not ( = ?auto_219198 ?auto_219206 ) ) ( not ( = ?auto_219198 ?auto_219207 ) ) ( not ( = ?auto_219198 ?auto_219208 ) ) ( not ( = ?auto_219199 ?auto_219200 ) ) ( not ( = ?auto_219199 ?auto_219201 ) ) ( not ( = ?auto_219199 ?auto_219202 ) ) ( not ( = ?auto_219199 ?auto_219203 ) ) ( not ( = ?auto_219199 ?auto_219204 ) ) ( not ( = ?auto_219199 ?auto_219205 ) ) ( not ( = ?auto_219199 ?auto_219206 ) ) ( not ( = ?auto_219199 ?auto_219207 ) ) ( not ( = ?auto_219199 ?auto_219208 ) ) ( not ( = ?auto_219200 ?auto_219201 ) ) ( not ( = ?auto_219200 ?auto_219202 ) ) ( not ( = ?auto_219200 ?auto_219203 ) ) ( not ( = ?auto_219200 ?auto_219204 ) ) ( not ( = ?auto_219200 ?auto_219205 ) ) ( not ( = ?auto_219200 ?auto_219206 ) ) ( not ( = ?auto_219200 ?auto_219207 ) ) ( not ( = ?auto_219200 ?auto_219208 ) ) ( not ( = ?auto_219201 ?auto_219202 ) ) ( not ( = ?auto_219201 ?auto_219203 ) ) ( not ( = ?auto_219201 ?auto_219204 ) ) ( not ( = ?auto_219201 ?auto_219205 ) ) ( not ( = ?auto_219201 ?auto_219206 ) ) ( not ( = ?auto_219201 ?auto_219207 ) ) ( not ( = ?auto_219201 ?auto_219208 ) ) ( not ( = ?auto_219202 ?auto_219203 ) ) ( not ( = ?auto_219202 ?auto_219204 ) ) ( not ( = ?auto_219202 ?auto_219205 ) ) ( not ( = ?auto_219202 ?auto_219206 ) ) ( not ( = ?auto_219202 ?auto_219207 ) ) ( not ( = ?auto_219202 ?auto_219208 ) ) ( not ( = ?auto_219203 ?auto_219204 ) ) ( not ( = ?auto_219203 ?auto_219205 ) ) ( not ( = ?auto_219203 ?auto_219206 ) ) ( not ( = ?auto_219203 ?auto_219207 ) ) ( not ( = ?auto_219203 ?auto_219208 ) ) ( not ( = ?auto_219204 ?auto_219205 ) ) ( not ( = ?auto_219204 ?auto_219206 ) ) ( not ( = ?auto_219204 ?auto_219207 ) ) ( not ( = ?auto_219204 ?auto_219208 ) ) ( not ( = ?auto_219205 ?auto_219206 ) ) ( not ( = ?auto_219205 ?auto_219207 ) ) ( not ( = ?auto_219205 ?auto_219208 ) ) ( not ( = ?auto_219206 ?auto_219207 ) ) ( not ( = ?auto_219206 ?auto_219208 ) ) ( not ( = ?auto_219207 ?auto_219208 ) ) ( ON ?auto_219206 ?auto_219207 ) ( ON ?auto_219205 ?auto_219206 ) ( ON ?auto_219204 ?auto_219205 ) ( ON ?auto_219203 ?auto_219204 ) ( ON ?auto_219202 ?auto_219203 ) ( ON ?auto_219201 ?auto_219202 ) ( ON ?auto_219200 ?auto_219201 ) ( ON ?auto_219199 ?auto_219200 ) ( ON ?auto_219198 ?auto_219199 ) ( CLEAR ?auto_219196 ) ( ON ?auto_219197 ?auto_219198 ) ( CLEAR ?auto_219197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219195 ?auto_219196 ?auto_219197 )
      ( MAKE-13PILE ?auto_219195 ?auto_219196 ?auto_219197 ?auto_219198 ?auto_219199 ?auto_219200 ?auto_219201 ?auto_219202 ?auto_219203 ?auto_219204 ?auto_219205 ?auto_219206 ?auto_219207 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219222 - BLOCK
      ?auto_219223 - BLOCK
      ?auto_219224 - BLOCK
      ?auto_219225 - BLOCK
      ?auto_219226 - BLOCK
      ?auto_219227 - BLOCK
      ?auto_219228 - BLOCK
      ?auto_219229 - BLOCK
      ?auto_219230 - BLOCK
      ?auto_219231 - BLOCK
      ?auto_219232 - BLOCK
      ?auto_219233 - BLOCK
      ?auto_219234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219234 ) ( ON-TABLE ?auto_219222 ) ( ON ?auto_219223 ?auto_219222 ) ( not ( = ?auto_219222 ?auto_219223 ) ) ( not ( = ?auto_219222 ?auto_219224 ) ) ( not ( = ?auto_219222 ?auto_219225 ) ) ( not ( = ?auto_219222 ?auto_219226 ) ) ( not ( = ?auto_219222 ?auto_219227 ) ) ( not ( = ?auto_219222 ?auto_219228 ) ) ( not ( = ?auto_219222 ?auto_219229 ) ) ( not ( = ?auto_219222 ?auto_219230 ) ) ( not ( = ?auto_219222 ?auto_219231 ) ) ( not ( = ?auto_219222 ?auto_219232 ) ) ( not ( = ?auto_219222 ?auto_219233 ) ) ( not ( = ?auto_219222 ?auto_219234 ) ) ( not ( = ?auto_219223 ?auto_219224 ) ) ( not ( = ?auto_219223 ?auto_219225 ) ) ( not ( = ?auto_219223 ?auto_219226 ) ) ( not ( = ?auto_219223 ?auto_219227 ) ) ( not ( = ?auto_219223 ?auto_219228 ) ) ( not ( = ?auto_219223 ?auto_219229 ) ) ( not ( = ?auto_219223 ?auto_219230 ) ) ( not ( = ?auto_219223 ?auto_219231 ) ) ( not ( = ?auto_219223 ?auto_219232 ) ) ( not ( = ?auto_219223 ?auto_219233 ) ) ( not ( = ?auto_219223 ?auto_219234 ) ) ( not ( = ?auto_219224 ?auto_219225 ) ) ( not ( = ?auto_219224 ?auto_219226 ) ) ( not ( = ?auto_219224 ?auto_219227 ) ) ( not ( = ?auto_219224 ?auto_219228 ) ) ( not ( = ?auto_219224 ?auto_219229 ) ) ( not ( = ?auto_219224 ?auto_219230 ) ) ( not ( = ?auto_219224 ?auto_219231 ) ) ( not ( = ?auto_219224 ?auto_219232 ) ) ( not ( = ?auto_219224 ?auto_219233 ) ) ( not ( = ?auto_219224 ?auto_219234 ) ) ( not ( = ?auto_219225 ?auto_219226 ) ) ( not ( = ?auto_219225 ?auto_219227 ) ) ( not ( = ?auto_219225 ?auto_219228 ) ) ( not ( = ?auto_219225 ?auto_219229 ) ) ( not ( = ?auto_219225 ?auto_219230 ) ) ( not ( = ?auto_219225 ?auto_219231 ) ) ( not ( = ?auto_219225 ?auto_219232 ) ) ( not ( = ?auto_219225 ?auto_219233 ) ) ( not ( = ?auto_219225 ?auto_219234 ) ) ( not ( = ?auto_219226 ?auto_219227 ) ) ( not ( = ?auto_219226 ?auto_219228 ) ) ( not ( = ?auto_219226 ?auto_219229 ) ) ( not ( = ?auto_219226 ?auto_219230 ) ) ( not ( = ?auto_219226 ?auto_219231 ) ) ( not ( = ?auto_219226 ?auto_219232 ) ) ( not ( = ?auto_219226 ?auto_219233 ) ) ( not ( = ?auto_219226 ?auto_219234 ) ) ( not ( = ?auto_219227 ?auto_219228 ) ) ( not ( = ?auto_219227 ?auto_219229 ) ) ( not ( = ?auto_219227 ?auto_219230 ) ) ( not ( = ?auto_219227 ?auto_219231 ) ) ( not ( = ?auto_219227 ?auto_219232 ) ) ( not ( = ?auto_219227 ?auto_219233 ) ) ( not ( = ?auto_219227 ?auto_219234 ) ) ( not ( = ?auto_219228 ?auto_219229 ) ) ( not ( = ?auto_219228 ?auto_219230 ) ) ( not ( = ?auto_219228 ?auto_219231 ) ) ( not ( = ?auto_219228 ?auto_219232 ) ) ( not ( = ?auto_219228 ?auto_219233 ) ) ( not ( = ?auto_219228 ?auto_219234 ) ) ( not ( = ?auto_219229 ?auto_219230 ) ) ( not ( = ?auto_219229 ?auto_219231 ) ) ( not ( = ?auto_219229 ?auto_219232 ) ) ( not ( = ?auto_219229 ?auto_219233 ) ) ( not ( = ?auto_219229 ?auto_219234 ) ) ( not ( = ?auto_219230 ?auto_219231 ) ) ( not ( = ?auto_219230 ?auto_219232 ) ) ( not ( = ?auto_219230 ?auto_219233 ) ) ( not ( = ?auto_219230 ?auto_219234 ) ) ( not ( = ?auto_219231 ?auto_219232 ) ) ( not ( = ?auto_219231 ?auto_219233 ) ) ( not ( = ?auto_219231 ?auto_219234 ) ) ( not ( = ?auto_219232 ?auto_219233 ) ) ( not ( = ?auto_219232 ?auto_219234 ) ) ( not ( = ?auto_219233 ?auto_219234 ) ) ( ON ?auto_219233 ?auto_219234 ) ( ON ?auto_219232 ?auto_219233 ) ( ON ?auto_219231 ?auto_219232 ) ( ON ?auto_219230 ?auto_219231 ) ( ON ?auto_219229 ?auto_219230 ) ( ON ?auto_219228 ?auto_219229 ) ( ON ?auto_219227 ?auto_219228 ) ( ON ?auto_219226 ?auto_219227 ) ( ON ?auto_219225 ?auto_219226 ) ( CLEAR ?auto_219223 ) ( ON ?auto_219224 ?auto_219225 ) ( CLEAR ?auto_219224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_219222 ?auto_219223 ?auto_219224 )
      ( MAKE-13PILE ?auto_219222 ?auto_219223 ?auto_219224 ?auto_219225 ?auto_219226 ?auto_219227 ?auto_219228 ?auto_219229 ?auto_219230 ?auto_219231 ?auto_219232 ?auto_219233 ?auto_219234 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219248 - BLOCK
      ?auto_219249 - BLOCK
      ?auto_219250 - BLOCK
      ?auto_219251 - BLOCK
      ?auto_219252 - BLOCK
      ?auto_219253 - BLOCK
      ?auto_219254 - BLOCK
      ?auto_219255 - BLOCK
      ?auto_219256 - BLOCK
      ?auto_219257 - BLOCK
      ?auto_219258 - BLOCK
      ?auto_219259 - BLOCK
      ?auto_219260 - BLOCK
    )
    :vars
    (
      ?auto_219261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219260 ?auto_219261 ) ( ON-TABLE ?auto_219248 ) ( not ( = ?auto_219248 ?auto_219249 ) ) ( not ( = ?auto_219248 ?auto_219250 ) ) ( not ( = ?auto_219248 ?auto_219251 ) ) ( not ( = ?auto_219248 ?auto_219252 ) ) ( not ( = ?auto_219248 ?auto_219253 ) ) ( not ( = ?auto_219248 ?auto_219254 ) ) ( not ( = ?auto_219248 ?auto_219255 ) ) ( not ( = ?auto_219248 ?auto_219256 ) ) ( not ( = ?auto_219248 ?auto_219257 ) ) ( not ( = ?auto_219248 ?auto_219258 ) ) ( not ( = ?auto_219248 ?auto_219259 ) ) ( not ( = ?auto_219248 ?auto_219260 ) ) ( not ( = ?auto_219248 ?auto_219261 ) ) ( not ( = ?auto_219249 ?auto_219250 ) ) ( not ( = ?auto_219249 ?auto_219251 ) ) ( not ( = ?auto_219249 ?auto_219252 ) ) ( not ( = ?auto_219249 ?auto_219253 ) ) ( not ( = ?auto_219249 ?auto_219254 ) ) ( not ( = ?auto_219249 ?auto_219255 ) ) ( not ( = ?auto_219249 ?auto_219256 ) ) ( not ( = ?auto_219249 ?auto_219257 ) ) ( not ( = ?auto_219249 ?auto_219258 ) ) ( not ( = ?auto_219249 ?auto_219259 ) ) ( not ( = ?auto_219249 ?auto_219260 ) ) ( not ( = ?auto_219249 ?auto_219261 ) ) ( not ( = ?auto_219250 ?auto_219251 ) ) ( not ( = ?auto_219250 ?auto_219252 ) ) ( not ( = ?auto_219250 ?auto_219253 ) ) ( not ( = ?auto_219250 ?auto_219254 ) ) ( not ( = ?auto_219250 ?auto_219255 ) ) ( not ( = ?auto_219250 ?auto_219256 ) ) ( not ( = ?auto_219250 ?auto_219257 ) ) ( not ( = ?auto_219250 ?auto_219258 ) ) ( not ( = ?auto_219250 ?auto_219259 ) ) ( not ( = ?auto_219250 ?auto_219260 ) ) ( not ( = ?auto_219250 ?auto_219261 ) ) ( not ( = ?auto_219251 ?auto_219252 ) ) ( not ( = ?auto_219251 ?auto_219253 ) ) ( not ( = ?auto_219251 ?auto_219254 ) ) ( not ( = ?auto_219251 ?auto_219255 ) ) ( not ( = ?auto_219251 ?auto_219256 ) ) ( not ( = ?auto_219251 ?auto_219257 ) ) ( not ( = ?auto_219251 ?auto_219258 ) ) ( not ( = ?auto_219251 ?auto_219259 ) ) ( not ( = ?auto_219251 ?auto_219260 ) ) ( not ( = ?auto_219251 ?auto_219261 ) ) ( not ( = ?auto_219252 ?auto_219253 ) ) ( not ( = ?auto_219252 ?auto_219254 ) ) ( not ( = ?auto_219252 ?auto_219255 ) ) ( not ( = ?auto_219252 ?auto_219256 ) ) ( not ( = ?auto_219252 ?auto_219257 ) ) ( not ( = ?auto_219252 ?auto_219258 ) ) ( not ( = ?auto_219252 ?auto_219259 ) ) ( not ( = ?auto_219252 ?auto_219260 ) ) ( not ( = ?auto_219252 ?auto_219261 ) ) ( not ( = ?auto_219253 ?auto_219254 ) ) ( not ( = ?auto_219253 ?auto_219255 ) ) ( not ( = ?auto_219253 ?auto_219256 ) ) ( not ( = ?auto_219253 ?auto_219257 ) ) ( not ( = ?auto_219253 ?auto_219258 ) ) ( not ( = ?auto_219253 ?auto_219259 ) ) ( not ( = ?auto_219253 ?auto_219260 ) ) ( not ( = ?auto_219253 ?auto_219261 ) ) ( not ( = ?auto_219254 ?auto_219255 ) ) ( not ( = ?auto_219254 ?auto_219256 ) ) ( not ( = ?auto_219254 ?auto_219257 ) ) ( not ( = ?auto_219254 ?auto_219258 ) ) ( not ( = ?auto_219254 ?auto_219259 ) ) ( not ( = ?auto_219254 ?auto_219260 ) ) ( not ( = ?auto_219254 ?auto_219261 ) ) ( not ( = ?auto_219255 ?auto_219256 ) ) ( not ( = ?auto_219255 ?auto_219257 ) ) ( not ( = ?auto_219255 ?auto_219258 ) ) ( not ( = ?auto_219255 ?auto_219259 ) ) ( not ( = ?auto_219255 ?auto_219260 ) ) ( not ( = ?auto_219255 ?auto_219261 ) ) ( not ( = ?auto_219256 ?auto_219257 ) ) ( not ( = ?auto_219256 ?auto_219258 ) ) ( not ( = ?auto_219256 ?auto_219259 ) ) ( not ( = ?auto_219256 ?auto_219260 ) ) ( not ( = ?auto_219256 ?auto_219261 ) ) ( not ( = ?auto_219257 ?auto_219258 ) ) ( not ( = ?auto_219257 ?auto_219259 ) ) ( not ( = ?auto_219257 ?auto_219260 ) ) ( not ( = ?auto_219257 ?auto_219261 ) ) ( not ( = ?auto_219258 ?auto_219259 ) ) ( not ( = ?auto_219258 ?auto_219260 ) ) ( not ( = ?auto_219258 ?auto_219261 ) ) ( not ( = ?auto_219259 ?auto_219260 ) ) ( not ( = ?auto_219259 ?auto_219261 ) ) ( not ( = ?auto_219260 ?auto_219261 ) ) ( ON ?auto_219259 ?auto_219260 ) ( ON ?auto_219258 ?auto_219259 ) ( ON ?auto_219257 ?auto_219258 ) ( ON ?auto_219256 ?auto_219257 ) ( ON ?auto_219255 ?auto_219256 ) ( ON ?auto_219254 ?auto_219255 ) ( ON ?auto_219253 ?auto_219254 ) ( ON ?auto_219252 ?auto_219253 ) ( ON ?auto_219251 ?auto_219252 ) ( ON ?auto_219250 ?auto_219251 ) ( CLEAR ?auto_219248 ) ( ON ?auto_219249 ?auto_219250 ) ( CLEAR ?auto_219249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219248 ?auto_219249 )
      ( MAKE-13PILE ?auto_219248 ?auto_219249 ?auto_219250 ?auto_219251 ?auto_219252 ?auto_219253 ?auto_219254 ?auto_219255 ?auto_219256 ?auto_219257 ?auto_219258 ?auto_219259 ?auto_219260 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219275 - BLOCK
      ?auto_219276 - BLOCK
      ?auto_219277 - BLOCK
      ?auto_219278 - BLOCK
      ?auto_219279 - BLOCK
      ?auto_219280 - BLOCK
      ?auto_219281 - BLOCK
      ?auto_219282 - BLOCK
      ?auto_219283 - BLOCK
      ?auto_219284 - BLOCK
      ?auto_219285 - BLOCK
      ?auto_219286 - BLOCK
      ?auto_219287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219287 ) ( ON-TABLE ?auto_219275 ) ( not ( = ?auto_219275 ?auto_219276 ) ) ( not ( = ?auto_219275 ?auto_219277 ) ) ( not ( = ?auto_219275 ?auto_219278 ) ) ( not ( = ?auto_219275 ?auto_219279 ) ) ( not ( = ?auto_219275 ?auto_219280 ) ) ( not ( = ?auto_219275 ?auto_219281 ) ) ( not ( = ?auto_219275 ?auto_219282 ) ) ( not ( = ?auto_219275 ?auto_219283 ) ) ( not ( = ?auto_219275 ?auto_219284 ) ) ( not ( = ?auto_219275 ?auto_219285 ) ) ( not ( = ?auto_219275 ?auto_219286 ) ) ( not ( = ?auto_219275 ?auto_219287 ) ) ( not ( = ?auto_219276 ?auto_219277 ) ) ( not ( = ?auto_219276 ?auto_219278 ) ) ( not ( = ?auto_219276 ?auto_219279 ) ) ( not ( = ?auto_219276 ?auto_219280 ) ) ( not ( = ?auto_219276 ?auto_219281 ) ) ( not ( = ?auto_219276 ?auto_219282 ) ) ( not ( = ?auto_219276 ?auto_219283 ) ) ( not ( = ?auto_219276 ?auto_219284 ) ) ( not ( = ?auto_219276 ?auto_219285 ) ) ( not ( = ?auto_219276 ?auto_219286 ) ) ( not ( = ?auto_219276 ?auto_219287 ) ) ( not ( = ?auto_219277 ?auto_219278 ) ) ( not ( = ?auto_219277 ?auto_219279 ) ) ( not ( = ?auto_219277 ?auto_219280 ) ) ( not ( = ?auto_219277 ?auto_219281 ) ) ( not ( = ?auto_219277 ?auto_219282 ) ) ( not ( = ?auto_219277 ?auto_219283 ) ) ( not ( = ?auto_219277 ?auto_219284 ) ) ( not ( = ?auto_219277 ?auto_219285 ) ) ( not ( = ?auto_219277 ?auto_219286 ) ) ( not ( = ?auto_219277 ?auto_219287 ) ) ( not ( = ?auto_219278 ?auto_219279 ) ) ( not ( = ?auto_219278 ?auto_219280 ) ) ( not ( = ?auto_219278 ?auto_219281 ) ) ( not ( = ?auto_219278 ?auto_219282 ) ) ( not ( = ?auto_219278 ?auto_219283 ) ) ( not ( = ?auto_219278 ?auto_219284 ) ) ( not ( = ?auto_219278 ?auto_219285 ) ) ( not ( = ?auto_219278 ?auto_219286 ) ) ( not ( = ?auto_219278 ?auto_219287 ) ) ( not ( = ?auto_219279 ?auto_219280 ) ) ( not ( = ?auto_219279 ?auto_219281 ) ) ( not ( = ?auto_219279 ?auto_219282 ) ) ( not ( = ?auto_219279 ?auto_219283 ) ) ( not ( = ?auto_219279 ?auto_219284 ) ) ( not ( = ?auto_219279 ?auto_219285 ) ) ( not ( = ?auto_219279 ?auto_219286 ) ) ( not ( = ?auto_219279 ?auto_219287 ) ) ( not ( = ?auto_219280 ?auto_219281 ) ) ( not ( = ?auto_219280 ?auto_219282 ) ) ( not ( = ?auto_219280 ?auto_219283 ) ) ( not ( = ?auto_219280 ?auto_219284 ) ) ( not ( = ?auto_219280 ?auto_219285 ) ) ( not ( = ?auto_219280 ?auto_219286 ) ) ( not ( = ?auto_219280 ?auto_219287 ) ) ( not ( = ?auto_219281 ?auto_219282 ) ) ( not ( = ?auto_219281 ?auto_219283 ) ) ( not ( = ?auto_219281 ?auto_219284 ) ) ( not ( = ?auto_219281 ?auto_219285 ) ) ( not ( = ?auto_219281 ?auto_219286 ) ) ( not ( = ?auto_219281 ?auto_219287 ) ) ( not ( = ?auto_219282 ?auto_219283 ) ) ( not ( = ?auto_219282 ?auto_219284 ) ) ( not ( = ?auto_219282 ?auto_219285 ) ) ( not ( = ?auto_219282 ?auto_219286 ) ) ( not ( = ?auto_219282 ?auto_219287 ) ) ( not ( = ?auto_219283 ?auto_219284 ) ) ( not ( = ?auto_219283 ?auto_219285 ) ) ( not ( = ?auto_219283 ?auto_219286 ) ) ( not ( = ?auto_219283 ?auto_219287 ) ) ( not ( = ?auto_219284 ?auto_219285 ) ) ( not ( = ?auto_219284 ?auto_219286 ) ) ( not ( = ?auto_219284 ?auto_219287 ) ) ( not ( = ?auto_219285 ?auto_219286 ) ) ( not ( = ?auto_219285 ?auto_219287 ) ) ( not ( = ?auto_219286 ?auto_219287 ) ) ( ON ?auto_219286 ?auto_219287 ) ( ON ?auto_219285 ?auto_219286 ) ( ON ?auto_219284 ?auto_219285 ) ( ON ?auto_219283 ?auto_219284 ) ( ON ?auto_219282 ?auto_219283 ) ( ON ?auto_219281 ?auto_219282 ) ( ON ?auto_219280 ?auto_219281 ) ( ON ?auto_219279 ?auto_219280 ) ( ON ?auto_219278 ?auto_219279 ) ( ON ?auto_219277 ?auto_219278 ) ( CLEAR ?auto_219275 ) ( ON ?auto_219276 ?auto_219277 ) ( CLEAR ?auto_219276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_219275 ?auto_219276 )
      ( MAKE-13PILE ?auto_219275 ?auto_219276 ?auto_219277 ?auto_219278 ?auto_219279 ?auto_219280 ?auto_219281 ?auto_219282 ?auto_219283 ?auto_219284 ?auto_219285 ?auto_219286 ?auto_219287 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219301 - BLOCK
      ?auto_219302 - BLOCK
      ?auto_219303 - BLOCK
      ?auto_219304 - BLOCK
      ?auto_219305 - BLOCK
      ?auto_219306 - BLOCK
      ?auto_219307 - BLOCK
      ?auto_219308 - BLOCK
      ?auto_219309 - BLOCK
      ?auto_219310 - BLOCK
      ?auto_219311 - BLOCK
      ?auto_219312 - BLOCK
      ?auto_219313 - BLOCK
    )
    :vars
    (
      ?auto_219314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_219313 ?auto_219314 ) ( not ( = ?auto_219301 ?auto_219302 ) ) ( not ( = ?auto_219301 ?auto_219303 ) ) ( not ( = ?auto_219301 ?auto_219304 ) ) ( not ( = ?auto_219301 ?auto_219305 ) ) ( not ( = ?auto_219301 ?auto_219306 ) ) ( not ( = ?auto_219301 ?auto_219307 ) ) ( not ( = ?auto_219301 ?auto_219308 ) ) ( not ( = ?auto_219301 ?auto_219309 ) ) ( not ( = ?auto_219301 ?auto_219310 ) ) ( not ( = ?auto_219301 ?auto_219311 ) ) ( not ( = ?auto_219301 ?auto_219312 ) ) ( not ( = ?auto_219301 ?auto_219313 ) ) ( not ( = ?auto_219301 ?auto_219314 ) ) ( not ( = ?auto_219302 ?auto_219303 ) ) ( not ( = ?auto_219302 ?auto_219304 ) ) ( not ( = ?auto_219302 ?auto_219305 ) ) ( not ( = ?auto_219302 ?auto_219306 ) ) ( not ( = ?auto_219302 ?auto_219307 ) ) ( not ( = ?auto_219302 ?auto_219308 ) ) ( not ( = ?auto_219302 ?auto_219309 ) ) ( not ( = ?auto_219302 ?auto_219310 ) ) ( not ( = ?auto_219302 ?auto_219311 ) ) ( not ( = ?auto_219302 ?auto_219312 ) ) ( not ( = ?auto_219302 ?auto_219313 ) ) ( not ( = ?auto_219302 ?auto_219314 ) ) ( not ( = ?auto_219303 ?auto_219304 ) ) ( not ( = ?auto_219303 ?auto_219305 ) ) ( not ( = ?auto_219303 ?auto_219306 ) ) ( not ( = ?auto_219303 ?auto_219307 ) ) ( not ( = ?auto_219303 ?auto_219308 ) ) ( not ( = ?auto_219303 ?auto_219309 ) ) ( not ( = ?auto_219303 ?auto_219310 ) ) ( not ( = ?auto_219303 ?auto_219311 ) ) ( not ( = ?auto_219303 ?auto_219312 ) ) ( not ( = ?auto_219303 ?auto_219313 ) ) ( not ( = ?auto_219303 ?auto_219314 ) ) ( not ( = ?auto_219304 ?auto_219305 ) ) ( not ( = ?auto_219304 ?auto_219306 ) ) ( not ( = ?auto_219304 ?auto_219307 ) ) ( not ( = ?auto_219304 ?auto_219308 ) ) ( not ( = ?auto_219304 ?auto_219309 ) ) ( not ( = ?auto_219304 ?auto_219310 ) ) ( not ( = ?auto_219304 ?auto_219311 ) ) ( not ( = ?auto_219304 ?auto_219312 ) ) ( not ( = ?auto_219304 ?auto_219313 ) ) ( not ( = ?auto_219304 ?auto_219314 ) ) ( not ( = ?auto_219305 ?auto_219306 ) ) ( not ( = ?auto_219305 ?auto_219307 ) ) ( not ( = ?auto_219305 ?auto_219308 ) ) ( not ( = ?auto_219305 ?auto_219309 ) ) ( not ( = ?auto_219305 ?auto_219310 ) ) ( not ( = ?auto_219305 ?auto_219311 ) ) ( not ( = ?auto_219305 ?auto_219312 ) ) ( not ( = ?auto_219305 ?auto_219313 ) ) ( not ( = ?auto_219305 ?auto_219314 ) ) ( not ( = ?auto_219306 ?auto_219307 ) ) ( not ( = ?auto_219306 ?auto_219308 ) ) ( not ( = ?auto_219306 ?auto_219309 ) ) ( not ( = ?auto_219306 ?auto_219310 ) ) ( not ( = ?auto_219306 ?auto_219311 ) ) ( not ( = ?auto_219306 ?auto_219312 ) ) ( not ( = ?auto_219306 ?auto_219313 ) ) ( not ( = ?auto_219306 ?auto_219314 ) ) ( not ( = ?auto_219307 ?auto_219308 ) ) ( not ( = ?auto_219307 ?auto_219309 ) ) ( not ( = ?auto_219307 ?auto_219310 ) ) ( not ( = ?auto_219307 ?auto_219311 ) ) ( not ( = ?auto_219307 ?auto_219312 ) ) ( not ( = ?auto_219307 ?auto_219313 ) ) ( not ( = ?auto_219307 ?auto_219314 ) ) ( not ( = ?auto_219308 ?auto_219309 ) ) ( not ( = ?auto_219308 ?auto_219310 ) ) ( not ( = ?auto_219308 ?auto_219311 ) ) ( not ( = ?auto_219308 ?auto_219312 ) ) ( not ( = ?auto_219308 ?auto_219313 ) ) ( not ( = ?auto_219308 ?auto_219314 ) ) ( not ( = ?auto_219309 ?auto_219310 ) ) ( not ( = ?auto_219309 ?auto_219311 ) ) ( not ( = ?auto_219309 ?auto_219312 ) ) ( not ( = ?auto_219309 ?auto_219313 ) ) ( not ( = ?auto_219309 ?auto_219314 ) ) ( not ( = ?auto_219310 ?auto_219311 ) ) ( not ( = ?auto_219310 ?auto_219312 ) ) ( not ( = ?auto_219310 ?auto_219313 ) ) ( not ( = ?auto_219310 ?auto_219314 ) ) ( not ( = ?auto_219311 ?auto_219312 ) ) ( not ( = ?auto_219311 ?auto_219313 ) ) ( not ( = ?auto_219311 ?auto_219314 ) ) ( not ( = ?auto_219312 ?auto_219313 ) ) ( not ( = ?auto_219312 ?auto_219314 ) ) ( not ( = ?auto_219313 ?auto_219314 ) ) ( ON ?auto_219312 ?auto_219313 ) ( ON ?auto_219311 ?auto_219312 ) ( ON ?auto_219310 ?auto_219311 ) ( ON ?auto_219309 ?auto_219310 ) ( ON ?auto_219308 ?auto_219309 ) ( ON ?auto_219307 ?auto_219308 ) ( ON ?auto_219306 ?auto_219307 ) ( ON ?auto_219305 ?auto_219306 ) ( ON ?auto_219304 ?auto_219305 ) ( ON ?auto_219303 ?auto_219304 ) ( ON ?auto_219302 ?auto_219303 ) ( ON ?auto_219301 ?auto_219302 ) ( CLEAR ?auto_219301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219301 )
      ( MAKE-13PILE ?auto_219301 ?auto_219302 ?auto_219303 ?auto_219304 ?auto_219305 ?auto_219306 ?auto_219307 ?auto_219308 ?auto_219309 ?auto_219310 ?auto_219311 ?auto_219312 ?auto_219313 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219328 - BLOCK
      ?auto_219329 - BLOCK
      ?auto_219330 - BLOCK
      ?auto_219331 - BLOCK
      ?auto_219332 - BLOCK
      ?auto_219333 - BLOCK
      ?auto_219334 - BLOCK
      ?auto_219335 - BLOCK
      ?auto_219336 - BLOCK
      ?auto_219337 - BLOCK
      ?auto_219338 - BLOCK
      ?auto_219339 - BLOCK
      ?auto_219340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_219340 ) ( not ( = ?auto_219328 ?auto_219329 ) ) ( not ( = ?auto_219328 ?auto_219330 ) ) ( not ( = ?auto_219328 ?auto_219331 ) ) ( not ( = ?auto_219328 ?auto_219332 ) ) ( not ( = ?auto_219328 ?auto_219333 ) ) ( not ( = ?auto_219328 ?auto_219334 ) ) ( not ( = ?auto_219328 ?auto_219335 ) ) ( not ( = ?auto_219328 ?auto_219336 ) ) ( not ( = ?auto_219328 ?auto_219337 ) ) ( not ( = ?auto_219328 ?auto_219338 ) ) ( not ( = ?auto_219328 ?auto_219339 ) ) ( not ( = ?auto_219328 ?auto_219340 ) ) ( not ( = ?auto_219329 ?auto_219330 ) ) ( not ( = ?auto_219329 ?auto_219331 ) ) ( not ( = ?auto_219329 ?auto_219332 ) ) ( not ( = ?auto_219329 ?auto_219333 ) ) ( not ( = ?auto_219329 ?auto_219334 ) ) ( not ( = ?auto_219329 ?auto_219335 ) ) ( not ( = ?auto_219329 ?auto_219336 ) ) ( not ( = ?auto_219329 ?auto_219337 ) ) ( not ( = ?auto_219329 ?auto_219338 ) ) ( not ( = ?auto_219329 ?auto_219339 ) ) ( not ( = ?auto_219329 ?auto_219340 ) ) ( not ( = ?auto_219330 ?auto_219331 ) ) ( not ( = ?auto_219330 ?auto_219332 ) ) ( not ( = ?auto_219330 ?auto_219333 ) ) ( not ( = ?auto_219330 ?auto_219334 ) ) ( not ( = ?auto_219330 ?auto_219335 ) ) ( not ( = ?auto_219330 ?auto_219336 ) ) ( not ( = ?auto_219330 ?auto_219337 ) ) ( not ( = ?auto_219330 ?auto_219338 ) ) ( not ( = ?auto_219330 ?auto_219339 ) ) ( not ( = ?auto_219330 ?auto_219340 ) ) ( not ( = ?auto_219331 ?auto_219332 ) ) ( not ( = ?auto_219331 ?auto_219333 ) ) ( not ( = ?auto_219331 ?auto_219334 ) ) ( not ( = ?auto_219331 ?auto_219335 ) ) ( not ( = ?auto_219331 ?auto_219336 ) ) ( not ( = ?auto_219331 ?auto_219337 ) ) ( not ( = ?auto_219331 ?auto_219338 ) ) ( not ( = ?auto_219331 ?auto_219339 ) ) ( not ( = ?auto_219331 ?auto_219340 ) ) ( not ( = ?auto_219332 ?auto_219333 ) ) ( not ( = ?auto_219332 ?auto_219334 ) ) ( not ( = ?auto_219332 ?auto_219335 ) ) ( not ( = ?auto_219332 ?auto_219336 ) ) ( not ( = ?auto_219332 ?auto_219337 ) ) ( not ( = ?auto_219332 ?auto_219338 ) ) ( not ( = ?auto_219332 ?auto_219339 ) ) ( not ( = ?auto_219332 ?auto_219340 ) ) ( not ( = ?auto_219333 ?auto_219334 ) ) ( not ( = ?auto_219333 ?auto_219335 ) ) ( not ( = ?auto_219333 ?auto_219336 ) ) ( not ( = ?auto_219333 ?auto_219337 ) ) ( not ( = ?auto_219333 ?auto_219338 ) ) ( not ( = ?auto_219333 ?auto_219339 ) ) ( not ( = ?auto_219333 ?auto_219340 ) ) ( not ( = ?auto_219334 ?auto_219335 ) ) ( not ( = ?auto_219334 ?auto_219336 ) ) ( not ( = ?auto_219334 ?auto_219337 ) ) ( not ( = ?auto_219334 ?auto_219338 ) ) ( not ( = ?auto_219334 ?auto_219339 ) ) ( not ( = ?auto_219334 ?auto_219340 ) ) ( not ( = ?auto_219335 ?auto_219336 ) ) ( not ( = ?auto_219335 ?auto_219337 ) ) ( not ( = ?auto_219335 ?auto_219338 ) ) ( not ( = ?auto_219335 ?auto_219339 ) ) ( not ( = ?auto_219335 ?auto_219340 ) ) ( not ( = ?auto_219336 ?auto_219337 ) ) ( not ( = ?auto_219336 ?auto_219338 ) ) ( not ( = ?auto_219336 ?auto_219339 ) ) ( not ( = ?auto_219336 ?auto_219340 ) ) ( not ( = ?auto_219337 ?auto_219338 ) ) ( not ( = ?auto_219337 ?auto_219339 ) ) ( not ( = ?auto_219337 ?auto_219340 ) ) ( not ( = ?auto_219338 ?auto_219339 ) ) ( not ( = ?auto_219338 ?auto_219340 ) ) ( not ( = ?auto_219339 ?auto_219340 ) ) ( ON ?auto_219339 ?auto_219340 ) ( ON ?auto_219338 ?auto_219339 ) ( ON ?auto_219337 ?auto_219338 ) ( ON ?auto_219336 ?auto_219337 ) ( ON ?auto_219335 ?auto_219336 ) ( ON ?auto_219334 ?auto_219335 ) ( ON ?auto_219333 ?auto_219334 ) ( ON ?auto_219332 ?auto_219333 ) ( ON ?auto_219331 ?auto_219332 ) ( ON ?auto_219330 ?auto_219331 ) ( ON ?auto_219329 ?auto_219330 ) ( ON ?auto_219328 ?auto_219329 ) ( CLEAR ?auto_219328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_219328 )
      ( MAKE-13PILE ?auto_219328 ?auto_219329 ?auto_219330 ?auto_219331 ?auto_219332 ?auto_219333 ?auto_219334 ?auto_219335 ?auto_219336 ?auto_219337 ?auto_219338 ?auto_219339 ?auto_219340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_219354 - BLOCK
      ?auto_219355 - BLOCK
      ?auto_219356 - BLOCK
      ?auto_219357 - BLOCK
      ?auto_219358 - BLOCK
      ?auto_219359 - BLOCK
      ?auto_219360 - BLOCK
      ?auto_219361 - BLOCK
      ?auto_219362 - BLOCK
      ?auto_219363 - BLOCK
      ?auto_219364 - BLOCK
      ?auto_219365 - BLOCK
      ?auto_219366 - BLOCK
    )
    :vars
    (
      ?auto_219367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_219354 ?auto_219355 ) ) ( not ( = ?auto_219354 ?auto_219356 ) ) ( not ( = ?auto_219354 ?auto_219357 ) ) ( not ( = ?auto_219354 ?auto_219358 ) ) ( not ( = ?auto_219354 ?auto_219359 ) ) ( not ( = ?auto_219354 ?auto_219360 ) ) ( not ( = ?auto_219354 ?auto_219361 ) ) ( not ( = ?auto_219354 ?auto_219362 ) ) ( not ( = ?auto_219354 ?auto_219363 ) ) ( not ( = ?auto_219354 ?auto_219364 ) ) ( not ( = ?auto_219354 ?auto_219365 ) ) ( not ( = ?auto_219354 ?auto_219366 ) ) ( not ( = ?auto_219355 ?auto_219356 ) ) ( not ( = ?auto_219355 ?auto_219357 ) ) ( not ( = ?auto_219355 ?auto_219358 ) ) ( not ( = ?auto_219355 ?auto_219359 ) ) ( not ( = ?auto_219355 ?auto_219360 ) ) ( not ( = ?auto_219355 ?auto_219361 ) ) ( not ( = ?auto_219355 ?auto_219362 ) ) ( not ( = ?auto_219355 ?auto_219363 ) ) ( not ( = ?auto_219355 ?auto_219364 ) ) ( not ( = ?auto_219355 ?auto_219365 ) ) ( not ( = ?auto_219355 ?auto_219366 ) ) ( not ( = ?auto_219356 ?auto_219357 ) ) ( not ( = ?auto_219356 ?auto_219358 ) ) ( not ( = ?auto_219356 ?auto_219359 ) ) ( not ( = ?auto_219356 ?auto_219360 ) ) ( not ( = ?auto_219356 ?auto_219361 ) ) ( not ( = ?auto_219356 ?auto_219362 ) ) ( not ( = ?auto_219356 ?auto_219363 ) ) ( not ( = ?auto_219356 ?auto_219364 ) ) ( not ( = ?auto_219356 ?auto_219365 ) ) ( not ( = ?auto_219356 ?auto_219366 ) ) ( not ( = ?auto_219357 ?auto_219358 ) ) ( not ( = ?auto_219357 ?auto_219359 ) ) ( not ( = ?auto_219357 ?auto_219360 ) ) ( not ( = ?auto_219357 ?auto_219361 ) ) ( not ( = ?auto_219357 ?auto_219362 ) ) ( not ( = ?auto_219357 ?auto_219363 ) ) ( not ( = ?auto_219357 ?auto_219364 ) ) ( not ( = ?auto_219357 ?auto_219365 ) ) ( not ( = ?auto_219357 ?auto_219366 ) ) ( not ( = ?auto_219358 ?auto_219359 ) ) ( not ( = ?auto_219358 ?auto_219360 ) ) ( not ( = ?auto_219358 ?auto_219361 ) ) ( not ( = ?auto_219358 ?auto_219362 ) ) ( not ( = ?auto_219358 ?auto_219363 ) ) ( not ( = ?auto_219358 ?auto_219364 ) ) ( not ( = ?auto_219358 ?auto_219365 ) ) ( not ( = ?auto_219358 ?auto_219366 ) ) ( not ( = ?auto_219359 ?auto_219360 ) ) ( not ( = ?auto_219359 ?auto_219361 ) ) ( not ( = ?auto_219359 ?auto_219362 ) ) ( not ( = ?auto_219359 ?auto_219363 ) ) ( not ( = ?auto_219359 ?auto_219364 ) ) ( not ( = ?auto_219359 ?auto_219365 ) ) ( not ( = ?auto_219359 ?auto_219366 ) ) ( not ( = ?auto_219360 ?auto_219361 ) ) ( not ( = ?auto_219360 ?auto_219362 ) ) ( not ( = ?auto_219360 ?auto_219363 ) ) ( not ( = ?auto_219360 ?auto_219364 ) ) ( not ( = ?auto_219360 ?auto_219365 ) ) ( not ( = ?auto_219360 ?auto_219366 ) ) ( not ( = ?auto_219361 ?auto_219362 ) ) ( not ( = ?auto_219361 ?auto_219363 ) ) ( not ( = ?auto_219361 ?auto_219364 ) ) ( not ( = ?auto_219361 ?auto_219365 ) ) ( not ( = ?auto_219361 ?auto_219366 ) ) ( not ( = ?auto_219362 ?auto_219363 ) ) ( not ( = ?auto_219362 ?auto_219364 ) ) ( not ( = ?auto_219362 ?auto_219365 ) ) ( not ( = ?auto_219362 ?auto_219366 ) ) ( not ( = ?auto_219363 ?auto_219364 ) ) ( not ( = ?auto_219363 ?auto_219365 ) ) ( not ( = ?auto_219363 ?auto_219366 ) ) ( not ( = ?auto_219364 ?auto_219365 ) ) ( not ( = ?auto_219364 ?auto_219366 ) ) ( not ( = ?auto_219365 ?auto_219366 ) ) ( ON ?auto_219354 ?auto_219367 ) ( not ( = ?auto_219366 ?auto_219367 ) ) ( not ( = ?auto_219365 ?auto_219367 ) ) ( not ( = ?auto_219364 ?auto_219367 ) ) ( not ( = ?auto_219363 ?auto_219367 ) ) ( not ( = ?auto_219362 ?auto_219367 ) ) ( not ( = ?auto_219361 ?auto_219367 ) ) ( not ( = ?auto_219360 ?auto_219367 ) ) ( not ( = ?auto_219359 ?auto_219367 ) ) ( not ( = ?auto_219358 ?auto_219367 ) ) ( not ( = ?auto_219357 ?auto_219367 ) ) ( not ( = ?auto_219356 ?auto_219367 ) ) ( not ( = ?auto_219355 ?auto_219367 ) ) ( not ( = ?auto_219354 ?auto_219367 ) ) ( ON ?auto_219355 ?auto_219354 ) ( ON ?auto_219356 ?auto_219355 ) ( ON ?auto_219357 ?auto_219356 ) ( ON ?auto_219358 ?auto_219357 ) ( ON ?auto_219359 ?auto_219358 ) ( ON ?auto_219360 ?auto_219359 ) ( ON ?auto_219361 ?auto_219360 ) ( ON ?auto_219362 ?auto_219361 ) ( ON ?auto_219363 ?auto_219362 ) ( ON ?auto_219364 ?auto_219363 ) ( ON ?auto_219365 ?auto_219364 ) ( ON ?auto_219366 ?auto_219365 ) ( CLEAR ?auto_219366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_219366 ?auto_219365 ?auto_219364 ?auto_219363 ?auto_219362 ?auto_219361 ?auto_219360 ?auto_219359 ?auto_219358 ?auto_219357 ?auto_219356 ?auto_219355 ?auto_219354 )
      ( MAKE-13PILE ?auto_219354 ?auto_219355 ?auto_219356 ?auto_219357 ?auto_219358 ?auto_219359 ?auto_219360 ?auto_219361 ?auto_219362 ?auto_219363 ?auto_219364 ?auto_219365 ?auto_219366 ) )
  )

)

