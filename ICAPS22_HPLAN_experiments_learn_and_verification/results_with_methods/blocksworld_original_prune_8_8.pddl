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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146896 - BLOCK
      ?auto_146897 - BLOCK
      ?auto_146898 - BLOCK
      ?auto_146899 - BLOCK
      ?auto_146900 - BLOCK
      ?auto_146901 - BLOCK
      ?auto_146902 - BLOCK
      ?auto_146903 - BLOCK
    )
    :vars
    (
      ?auto_146904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146904 ?auto_146903 ) ( CLEAR ?auto_146904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146896 ) ( ON ?auto_146897 ?auto_146896 ) ( ON ?auto_146898 ?auto_146897 ) ( ON ?auto_146899 ?auto_146898 ) ( ON ?auto_146900 ?auto_146899 ) ( ON ?auto_146901 ?auto_146900 ) ( ON ?auto_146902 ?auto_146901 ) ( ON ?auto_146903 ?auto_146902 ) ( not ( = ?auto_146896 ?auto_146897 ) ) ( not ( = ?auto_146896 ?auto_146898 ) ) ( not ( = ?auto_146896 ?auto_146899 ) ) ( not ( = ?auto_146896 ?auto_146900 ) ) ( not ( = ?auto_146896 ?auto_146901 ) ) ( not ( = ?auto_146896 ?auto_146902 ) ) ( not ( = ?auto_146896 ?auto_146903 ) ) ( not ( = ?auto_146896 ?auto_146904 ) ) ( not ( = ?auto_146897 ?auto_146898 ) ) ( not ( = ?auto_146897 ?auto_146899 ) ) ( not ( = ?auto_146897 ?auto_146900 ) ) ( not ( = ?auto_146897 ?auto_146901 ) ) ( not ( = ?auto_146897 ?auto_146902 ) ) ( not ( = ?auto_146897 ?auto_146903 ) ) ( not ( = ?auto_146897 ?auto_146904 ) ) ( not ( = ?auto_146898 ?auto_146899 ) ) ( not ( = ?auto_146898 ?auto_146900 ) ) ( not ( = ?auto_146898 ?auto_146901 ) ) ( not ( = ?auto_146898 ?auto_146902 ) ) ( not ( = ?auto_146898 ?auto_146903 ) ) ( not ( = ?auto_146898 ?auto_146904 ) ) ( not ( = ?auto_146899 ?auto_146900 ) ) ( not ( = ?auto_146899 ?auto_146901 ) ) ( not ( = ?auto_146899 ?auto_146902 ) ) ( not ( = ?auto_146899 ?auto_146903 ) ) ( not ( = ?auto_146899 ?auto_146904 ) ) ( not ( = ?auto_146900 ?auto_146901 ) ) ( not ( = ?auto_146900 ?auto_146902 ) ) ( not ( = ?auto_146900 ?auto_146903 ) ) ( not ( = ?auto_146900 ?auto_146904 ) ) ( not ( = ?auto_146901 ?auto_146902 ) ) ( not ( = ?auto_146901 ?auto_146903 ) ) ( not ( = ?auto_146901 ?auto_146904 ) ) ( not ( = ?auto_146902 ?auto_146903 ) ) ( not ( = ?auto_146902 ?auto_146904 ) ) ( not ( = ?auto_146903 ?auto_146904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146904 ?auto_146903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146906 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_146906 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_146906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146907 - BLOCK
    )
    :vars
    (
      ?auto_146908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146907 ?auto_146908 ) ( CLEAR ?auto_146907 ) ( HAND-EMPTY ) ( not ( = ?auto_146907 ?auto_146908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146907 ?auto_146908 )
      ( MAKE-1PILE ?auto_146907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146916 - BLOCK
      ?auto_146917 - BLOCK
      ?auto_146918 - BLOCK
      ?auto_146919 - BLOCK
      ?auto_146920 - BLOCK
      ?auto_146921 - BLOCK
      ?auto_146922 - BLOCK
    )
    :vars
    (
      ?auto_146923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146923 ?auto_146922 ) ( CLEAR ?auto_146923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146916 ) ( ON ?auto_146917 ?auto_146916 ) ( ON ?auto_146918 ?auto_146917 ) ( ON ?auto_146919 ?auto_146918 ) ( ON ?auto_146920 ?auto_146919 ) ( ON ?auto_146921 ?auto_146920 ) ( ON ?auto_146922 ?auto_146921 ) ( not ( = ?auto_146916 ?auto_146917 ) ) ( not ( = ?auto_146916 ?auto_146918 ) ) ( not ( = ?auto_146916 ?auto_146919 ) ) ( not ( = ?auto_146916 ?auto_146920 ) ) ( not ( = ?auto_146916 ?auto_146921 ) ) ( not ( = ?auto_146916 ?auto_146922 ) ) ( not ( = ?auto_146916 ?auto_146923 ) ) ( not ( = ?auto_146917 ?auto_146918 ) ) ( not ( = ?auto_146917 ?auto_146919 ) ) ( not ( = ?auto_146917 ?auto_146920 ) ) ( not ( = ?auto_146917 ?auto_146921 ) ) ( not ( = ?auto_146917 ?auto_146922 ) ) ( not ( = ?auto_146917 ?auto_146923 ) ) ( not ( = ?auto_146918 ?auto_146919 ) ) ( not ( = ?auto_146918 ?auto_146920 ) ) ( not ( = ?auto_146918 ?auto_146921 ) ) ( not ( = ?auto_146918 ?auto_146922 ) ) ( not ( = ?auto_146918 ?auto_146923 ) ) ( not ( = ?auto_146919 ?auto_146920 ) ) ( not ( = ?auto_146919 ?auto_146921 ) ) ( not ( = ?auto_146919 ?auto_146922 ) ) ( not ( = ?auto_146919 ?auto_146923 ) ) ( not ( = ?auto_146920 ?auto_146921 ) ) ( not ( = ?auto_146920 ?auto_146922 ) ) ( not ( = ?auto_146920 ?auto_146923 ) ) ( not ( = ?auto_146921 ?auto_146922 ) ) ( not ( = ?auto_146921 ?auto_146923 ) ) ( not ( = ?auto_146922 ?auto_146923 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146923 ?auto_146922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146924 - BLOCK
      ?auto_146925 - BLOCK
      ?auto_146926 - BLOCK
      ?auto_146927 - BLOCK
      ?auto_146928 - BLOCK
      ?auto_146929 - BLOCK
      ?auto_146930 - BLOCK
    )
    :vars
    (
      ?auto_146931 - BLOCK
      ?auto_146932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146931 ?auto_146930 ) ( CLEAR ?auto_146931 ) ( ON-TABLE ?auto_146924 ) ( ON ?auto_146925 ?auto_146924 ) ( ON ?auto_146926 ?auto_146925 ) ( ON ?auto_146927 ?auto_146926 ) ( ON ?auto_146928 ?auto_146927 ) ( ON ?auto_146929 ?auto_146928 ) ( ON ?auto_146930 ?auto_146929 ) ( not ( = ?auto_146924 ?auto_146925 ) ) ( not ( = ?auto_146924 ?auto_146926 ) ) ( not ( = ?auto_146924 ?auto_146927 ) ) ( not ( = ?auto_146924 ?auto_146928 ) ) ( not ( = ?auto_146924 ?auto_146929 ) ) ( not ( = ?auto_146924 ?auto_146930 ) ) ( not ( = ?auto_146924 ?auto_146931 ) ) ( not ( = ?auto_146925 ?auto_146926 ) ) ( not ( = ?auto_146925 ?auto_146927 ) ) ( not ( = ?auto_146925 ?auto_146928 ) ) ( not ( = ?auto_146925 ?auto_146929 ) ) ( not ( = ?auto_146925 ?auto_146930 ) ) ( not ( = ?auto_146925 ?auto_146931 ) ) ( not ( = ?auto_146926 ?auto_146927 ) ) ( not ( = ?auto_146926 ?auto_146928 ) ) ( not ( = ?auto_146926 ?auto_146929 ) ) ( not ( = ?auto_146926 ?auto_146930 ) ) ( not ( = ?auto_146926 ?auto_146931 ) ) ( not ( = ?auto_146927 ?auto_146928 ) ) ( not ( = ?auto_146927 ?auto_146929 ) ) ( not ( = ?auto_146927 ?auto_146930 ) ) ( not ( = ?auto_146927 ?auto_146931 ) ) ( not ( = ?auto_146928 ?auto_146929 ) ) ( not ( = ?auto_146928 ?auto_146930 ) ) ( not ( = ?auto_146928 ?auto_146931 ) ) ( not ( = ?auto_146929 ?auto_146930 ) ) ( not ( = ?auto_146929 ?auto_146931 ) ) ( not ( = ?auto_146930 ?auto_146931 ) ) ( HOLDING ?auto_146932 ) ( not ( = ?auto_146924 ?auto_146932 ) ) ( not ( = ?auto_146925 ?auto_146932 ) ) ( not ( = ?auto_146926 ?auto_146932 ) ) ( not ( = ?auto_146927 ?auto_146932 ) ) ( not ( = ?auto_146928 ?auto_146932 ) ) ( not ( = ?auto_146929 ?auto_146932 ) ) ( not ( = ?auto_146930 ?auto_146932 ) ) ( not ( = ?auto_146931 ?auto_146932 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_146932 )
      ( MAKE-7PILE ?auto_146924 ?auto_146925 ?auto_146926 ?auto_146927 ?auto_146928 ?auto_146929 ?auto_146930 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146933 - BLOCK
      ?auto_146934 - BLOCK
      ?auto_146935 - BLOCK
      ?auto_146936 - BLOCK
      ?auto_146937 - BLOCK
      ?auto_146938 - BLOCK
      ?auto_146939 - BLOCK
    )
    :vars
    (
      ?auto_146940 - BLOCK
      ?auto_146941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146940 ?auto_146939 ) ( ON-TABLE ?auto_146933 ) ( ON ?auto_146934 ?auto_146933 ) ( ON ?auto_146935 ?auto_146934 ) ( ON ?auto_146936 ?auto_146935 ) ( ON ?auto_146937 ?auto_146936 ) ( ON ?auto_146938 ?auto_146937 ) ( ON ?auto_146939 ?auto_146938 ) ( not ( = ?auto_146933 ?auto_146934 ) ) ( not ( = ?auto_146933 ?auto_146935 ) ) ( not ( = ?auto_146933 ?auto_146936 ) ) ( not ( = ?auto_146933 ?auto_146937 ) ) ( not ( = ?auto_146933 ?auto_146938 ) ) ( not ( = ?auto_146933 ?auto_146939 ) ) ( not ( = ?auto_146933 ?auto_146940 ) ) ( not ( = ?auto_146934 ?auto_146935 ) ) ( not ( = ?auto_146934 ?auto_146936 ) ) ( not ( = ?auto_146934 ?auto_146937 ) ) ( not ( = ?auto_146934 ?auto_146938 ) ) ( not ( = ?auto_146934 ?auto_146939 ) ) ( not ( = ?auto_146934 ?auto_146940 ) ) ( not ( = ?auto_146935 ?auto_146936 ) ) ( not ( = ?auto_146935 ?auto_146937 ) ) ( not ( = ?auto_146935 ?auto_146938 ) ) ( not ( = ?auto_146935 ?auto_146939 ) ) ( not ( = ?auto_146935 ?auto_146940 ) ) ( not ( = ?auto_146936 ?auto_146937 ) ) ( not ( = ?auto_146936 ?auto_146938 ) ) ( not ( = ?auto_146936 ?auto_146939 ) ) ( not ( = ?auto_146936 ?auto_146940 ) ) ( not ( = ?auto_146937 ?auto_146938 ) ) ( not ( = ?auto_146937 ?auto_146939 ) ) ( not ( = ?auto_146937 ?auto_146940 ) ) ( not ( = ?auto_146938 ?auto_146939 ) ) ( not ( = ?auto_146938 ?auto_146940 ) ) ( not ( = ?auto_146939 ?auto_146940 ) ) ( not ( = ?auto_146933 ?auto_146941 ) ) ( not ( = ?auto_146934 ?auto_146941 ) ) ( not ( = ?auto_146935 ?auto_146941 ) ) ( not ( = ?auto_146936 ?auto_146941 ) ) ( not ( = ?auto_146937 ?auto_146941 ) ) ( not ( = ?auto_146938 ?auto_146941 ) ) ( not ( = ?auto_146939 ?auto_146941 ) ) ( not ( = ?auto_146940 ?auto_146941 ) ) ( ON ?auto_146941 ?auto_146940 ) ( CLEAR ?auto_146941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146933 ?auto_146934 ?auto_146935 ?auto_146936 ?auto_146937 ?auto_146938 ?auto_146939 ?auto_146940 )
      ( MAKE-7PILE ?auto_146933 ?auto_146934 ?auto_146935 ?auto_146936 ?auto_146937 ?auto_146938 ?auto_146939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146944 - BLOCK
      ?auto_146945 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_146945 ) ( CLEAR ?auto_146944 ) ( ON-TABLE ?auto_146944 ) ( not ( = ?auto_146944 ?auto_146945 ) ) )
    :subtasks
    ( ( !STACK ?auto_146945 ?auto_146944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146946 - BLOCK
      ?auto_146947 - BLOCK
    )
    :vars
    (
      ?auto_146948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146946 ) ( ON-TABLE ?auto_146946 ) ( not ( = ?auto_146946 ?auto_146947 ) ) ( ON ?auto_146947 ?auto_146948 ) ( CLEAR ?auto_146947 ) ( HAND-EMPTY ) ( not ( = ?auto_146946 ?auto_146948 ) ) ( not ( = ?auto_146947 ?auto_146948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146947 ?auto_146948 )
      ( MAKE-2PILE ?auto_146946 ?auto_146947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146949 - BLOCK
      ?auto_146950 - BLOCK
    )
    :vars
    (
      ?auto_146951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146949 ?auto_146950 ) ) ( ON ?auto_146950 ?auto_146951 ) ( CLEAR ?auto_146950 ) ( not ( = ?auto_146949 ?auto_146951 ) ) ( not ( = ?auto_146950 ?auto_146951 ) ) ( HOLDING ?auto_146949 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146949 )
      ( MAKE-2PILE ?auto_146949 ?auto_146950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146952 - BLOCK
      ?auto_146953 - BLOCK
    )
    :vars
    (
      ?auto_146954 - BLOCK
      ?auto_146959 - BLOCK
      ?auto_146960 - BLOCK
      ?auto_146957 - BLOCK
      ?auto_146955 - BLOCK
      ?auto_146956 - BLOCK
      ?auto_146958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146952 ?auto_146953 ) ) ( ON ?auto_146953 ?auto_146954 ) ( not ( = ?auto_146952 ?auto_146954 ) ) ( not ( = ?auto_146953 ?auto_146954 ) ) ( ON ?auto_146952 ?auto_146953 ) ( CLEAR ?auto_146952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146959 ) ( ON ?auto_146960 ?auto_146959 ) ( ON ?auto_146957 ?auto_146960 ) ( ON ?auto_146955 ?auto_146957 ) ( ON ?auto_146956 ?auto_146955 ) ( ON ?auto_146958 ?auto_146956 ) ( ON ?auto_146954 ?auto_146958 ) ( not ( = ?auto_146959 ?auto_146960 ) ) ( not ( = ?auto_146959 ?auto_146957 ) ) ( not ( = ?auto_146959 ?auto_146955 ) ) ( not ( = ?auto_146959 ?auto_146956 ) ) ( not ( = ?auto_146959 ?auto_146958 ) ) ( not ( = ?auto_146959 ?auto_146954 ) ) ( not ( = ?auto_146959 ?auto_146953 ) ) ( not ( = ?auto_146959 ?auto_146952 ) ) ( not ( = ?auto_146960 ?auto_146957 ) ) ( not ( = ?auto_146960 ?auto_146955 ) ) ( not ( = ?auto_146960 ?auto_146956 ) ) ( not ( = ?auto_146960 ?auto_146958 ) ) ( not ( = ?auto_146960 ?auto_146954 ) ) ( not ( = ?auto_146960 ?auto_146953 ) ) ( not ( = ?auto_146960 ?auto_146952 ) ) ( not ( = ?auto_146957 ?auto_146955 ) ) ( not ( = ?auto_146957 ?auto_146956 ) ) ( not ( = ?auto_146957 ?auto_146958 ) ) ( not ( = ?auto_146957 ?auto_146954 ) ) ( not ( = ?auto_146957 ?auto_146953 ) ) ( not ( = ?auto_146957 ?auto_146952 ) ) ( not ( = ?auto_146955 ?auto_146956 ) ) ( not ( = ?auto_146955 ?auto_146958 ) ) ( not ( = ?auto_146955 ?auto_146954 ) ) ( not ( = ?auto_146955 ?auto_146953 ) ) ( not ( = ?auto_146955 ?auto_146952 ) ) ( not ( = ?auto_146956 ?auto_146958 ) ) ( not ( = ?auto_146956 ?auto_146954 ) ) ( not ( = ?auto_146956 ?auto_146953 ) ) ( not ( = ?auto_146956 ?auto_146952 ) ) ( not ( = ?auto_146958 ?auto_146954 ) ) ( not ( = ?auto_146958 ?auto_146953 ) ) ( not ( = ?auto_146958 ?auto_146952 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146959 ?auto_146960 ?auto_146957 ?auto_146955 ?auto_146956 ?auto_146958 ?auto_146954 ?auto_146953 )
      ( MAKE-2PILE ?auto_146952 ?auto_146953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146967 - BLOCK
      ?auto_146968 - BLOCK
      ?auto_146969 - BLOCK
      ?auto_146970 - BLOCK
      ?auto_146971 - BLOCK
      ?auto_146972 - BLOCK
    )
    :vars
    (
      ?auto_146973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146973 ?auto_146972 ) ( CLEAR ?auto_146973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146967 ) ( ON ?auto_146968 ?auto_146967 ) ( ON ?auto_146969 ?auto_146968 ) ( ON ?auto_146970 ?auto_146969 ) ( ON ?auto_146971 ?auto_146970 ) ( ON ?auto_146972 ?auto_146971 ) ( not ( = ?auto_146967 ?auto_146968 ) ) ( not ( = ?auto_146967 ?auto_146969 ) ) ( not ( = ?auto_146967 ?auto_146970 ) ) ( not ( = ?auto_146967 ?auto_146971 ) ) ( not ( = ?auto_146967 ?auto_146972 ) ) ( not ( = ?auto_146967 ?auto_146973 ) ) ( not ( = ?auto_146968 ?auto_146969 ) ) ( not ( = ?auto_146968 ?auto_146970 ) ) ( not ( = ?auto_146968 ?auto_146971 ) ) ( not ( = ?auto_146968 ?auto_146972 ) ) ( not ( = ?auto_146968 ?auto_146973 ) ) ( not ( = ?auto_146969 ?auto_146970 ) ) ( not ( = ?auto_146969 ?auto_146971 ) ) ( not ( = ?auto_146969 ?auto_146972 ) ) ( not ( = ?auto_146969 ?auto_146973 ) ) ( not ( = ?auto_146970 ?auto_146971 ) ) ( not ( = ?auto_146970 ?auto_146972 ) ) ( not ( = ?auto_146970 ?auto_146973 ) ) ( not ( = ?auto_146971 ?auto_146972 ) ) ( not ( = ?auto_146971 ?auto_146973 ) ) ( not ( = ?auto_146972 ?auto_146973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146973 ?auto_146972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146974 - BLOCK
      ?auto_146975 - BLOCK
      ?auto_146976 - BLOCK
      ?auto_146977 - BLOCK
      ?auto_146978 - BLOCK
      ?auto_146979 - BLOCK
    )
    :vars
    (
      ?auto_146980 - BLOCK
      ?auto_146981 - BLOCK
      ?auto_146982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146980 ?auto_146979 ) ( CLEAR ?auto_146980 ) ( ON-TABLE ?auto_146974 ) ( ON ?auto_146975 ?auto_146974 ) ( ON ?auto_146976 ?auto_146975 ) ( ON ?auto_146977 ?auto_146976 ) ( ON ?auto_146978 ?auto_146977 ) ( ON ?auto_146979 ?auto_146978 ) ( not ( = ?auto_146974 ?auto_146975 ) ) ( not ( = ?auto_146974 ?auto_146976 ) ) ( not ( = ?auto_146974 ?auto_146977 ) ) ( not ( = ?auto_146974 ?auto_146978 ) ) ( not ( = ?auto_146974 ?auto_146979 ) ) ( not ( = ?auto_146974 ?auto_146980 ) ) ( not ( = ?auto_146975 ?auto_146976 ) ) ( not ( = ?auto_146975 ?auto_146977 ) ) ( not ( = ?auto_146975 ?auto_146978 ) ) ( not ( = ?auto_146975 ?auto_146979 ) ) ( not ( = ?auto_146975 ?auto_146980 ) ) ( not ( = ?auto_146976 ?auto_146977 ) ) ( not ( = ?auto_146976 ?auto_146978 ) ) ( not ( = ?auto_146976 ?auto_146979 ) ) ( not ( = ?auto_146976 ?auto_146980 ) ) ( not ( = ?auto_146977 ?auto_146978 ) ) ( not ( = ?auto_146977 ?auto_146979 ) ) ( not ( = ?auto_146977 ?auto_146980 ) ) ( not ( = ?auto_146978 ?auto_146979 ) ) ( not ( = ?auto_146978 ?auto_146980 ) ) ( not ( = ?auto_146979 ?auto_146980 ) ) ( HOLDING ?auto_146981 ) ( CLEAR ?auto_146982 ) ( not ( = ?auto_146974 ?auto_146981 ) ) ( not ( = ?auto_146974 ?auto_146982 ) ) ( not ( = ?auto_146975 ?auto_146981 ) ) ( not ( = ?auto_146975 ?auto_146982 ) ) ( not ( = ?auto_146976 ?auto_146981 ) ) ( not ( = ?auto_146976 ?auto_146982 ) ) ( not ( = ?auto_146977 ?auto_146981 ) ) ( not ( = ?auto_146977 ?auto_146982 ) ) ( not ( = ?auto_146978 ?auto_146981 ) ) ( not ( = ?auto_146978 ?auto_146982 ) ) ( not ( = ?auto_146979 ?auto_146981 ) ) ( not ( = ?auto_146979 ?auto_146982 ) ) ( not ( = ?auto_146980 ?auto_146981 ) ) ( not ( = ?auto_146980 ?auto_146982 ) ) ( not ( = ?auto_146981 ?auto_146982 ) ) )
    :subtasks
    ( ( !STACK ?auto_146981 ?auto_146982 )
      ( MAKE-6PILE ?auto_146974 ?auto_146975 ?auto_146976 ?auto_146977 ?auto_146978 ?auto_146979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148314 - BLOCK
      ?auto_148315 - BLOCK
      ?auto_148316 - BLOCK
      ?auto_148317 - BLOCK
      ?auto_148318 - BLOCK
      ?auto_148319 - BLOCK
    )
    :vars
    (
      ?auto_148320 - BLOCK
      ?auto_148321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148320 ?auto_148319 ) ( ON-TABLE ?auto_148314 ) ( ON ?auto_148315 ?auto_148314 ) ( ON ?auto_148316 ?auto_148315 ) ( ON ?auto_148317 ?auto_148316 ) ( ON ?auto_148318 ?auto_148317 ) ( ON ?auto_148319 ?auto_148318 ) ( not ( = ?auto_148314 ?auto_148315 ) ) ( not ( = ?auto_148314 ?auto_148316 ) ) ( not ( = ?auto_148314 ?auto_148317 ) ) ( not ( = ?auto_148314 ?auto_148318 ) ) ( not ( = ?auto_148314 ?auto_148319 ) ) ( not ( = ?auto_148314 ?auto_148320 ) ) ( not ( = ?auto_148315 ?auto_148316 ) ) ( not ( = ?auto_148315 ?auto_148317 ) ) ( not ( = ?auto_148315 ?auto_148318 ) ) ( not ( = ?auto_148315 ?auto_148319 ) ) ( not ( = ?auto_148315 ?auto_148320 ) ) ( not ( = ?auto_148316 ?auto_148317 ) ) ( not ( = ?auto_148316 ?auto_148318 ) ) ( not ( = ?auto_148316 ?auto_148319 ) ) ( not ( = ?auto_148316 ?auto_148320 ) ) ( not ( = ?auto_148317 ?auto_148318 ) ) ( not ( = ?auto_148317 ?auto_148319 ) ) ( not ( = ?auto_148317 ?auto_148320 ) ) ( not ( = ?auto_148318 ?auto_148319 ) ) ( not ( = ?auto_148318 ?auto_148320 ) ) ( not ( = ?auto_148319 ?auto_148320 ) ) ( not ( = ?auto_148314 ?auto_148321 ) ) ( not ( = ?auto_148315 ?auto_148321 ) ) ( not ( = ?auto_148316 ?auto_148321 ) ) ( not ( = ?auto_148317 ?auto_148321 ) ) ( not ( = ?auto_148318 ?auto_148321 ) ) ( not ( = ?auto_148319 ?auto_148321 ) ) ( not ( = ?auto_148320 ?auto_148321 ) ) ( ON ?auto_148321 ?auto_148320 ) ( CLEAR ?auto_148321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148314 ?auto_148315 ?auto_148316 ?auto_148317 ?auto_148318 ?auto_148319 ?auto_148320 )
      ( MAKE-6PILE ?auto_148314 ?auto_148315 ?auto_148316 ?auto_148317 ?auto_148318 ?auto_148319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146992 - BLOCK
      ?auto_146993 - BLOCK
      ?auto_146994 - BLOCK
      ?auto_146995 - BLOCK
      ?auto_146996 - BLOCK
      ?auto_146997 - BLOCK
    )
    :vars
    (
      ?auto_146999 - BLOCK
      ?auto_146998 - BLOCK
      ?auto_147000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146999 ?auto_146997 ) ( ON-TABLE ?auto_146992 ) ( ON ?auto_146993 ?auto_146992 ) ( ON ?auto_146994 ?auto_146993 ) ( ON ?auto_146995 ?auto_146994 ) ( ON ?auto_146996 ?auto_146995 ) ( ON ?auto_146997 ?auto_146996 ) ( not ( = ?auto_146992 ?auto_146993 ) ) ( not ( = ?auto_146992 ?auto_146994 ) ) ( not ( = ?auto_146992 ?auto_146995 ) ) ( not ( = ?auto_146992 ?auto_146996 ) ) ( not ( = ?auto_146992 ?auto_146997 ) ) ( not ( = ?auto_146992 ?auto_146999 ) ) ( not ( = ?auto_146993 ?auto_146994 ) ) ( not ( = ?auto_146993 ?auto_146995 ) ) ( not ( = ?auto_146993 ?auto_146996 ) ) ( not ( = ?auto_146993 ?auto_146997 ) ) ( not ( = ?auto_146993 ?auto_146999 ) ) ( not ( = ?auto_146994 ?auto_146995 ) ) ( not ( = ?auto_146994 ?auto_146996 ) ) ( not ( = ?auto_146994 ?auto_146997 ) ) ( not ( = ?auto_146994 ?auto_146999 ) ) ( not ( = ?auto_146995 ?auto_146996 ) ) ( not ( = ?auto_146995 ?auto_146997 ) ) ( not ( = ?auto_146995 ?auto_146999 ) ) ( not ( = ?auto_146996 ?auto_146997 ) ) ( not ( = ?auto_146996 ?auto_146999 ) ) ( not ( = ?auto_146997 ?auto_146999 ) ) ( not ( = ?auto_146992 ?auto_146998 ) ) ( not ( = ?auto_146992 ?auto_147000 ) ) ( not ( = ?auto_146993 ?auto_146998 ) ) ( not ( = ?auto_146993 ?auto_147000 ) ) ( not ( = ?auto_146994 ?auto_146998 ) ) ( not ( = ?auto_146994 ?auto_147000 ) ) ( not ( = ?auto_146995 ?auto_146998 ) ) ( not ( = ?auto_146995 ?auto_147000 ) ) ( not ( = ?auto_146996 ?auto_146998 ) ) ( not ( = ?auto_146996 ?auto_147000 ) ) ( not ( = ?auto_146997 ?auto_146998 ) ) ( not ( = ?auto_146997 ?auto_147000 ) ) ( not ( = ?auto_146999 ?auto_146998 ) ) ( not ( = ?auto_146999 ?auto_147000 ) ) ( not ( = ?auto_146998 ?auto_147000 ) ) ( ON ?auto_146998 ?auto_146999 ) ( CLEAR ?auto_146998 ) ( HOLDING ?auto_147000 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147000 )
      ( MAKE-6PILE ?auto_146992 ?auto_146993 ?auto_146994 ?auto_146995 ?auto_146996 ?auto_146997 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147001 - BLOCK
      ?auto_147002 - BLOCK
      ?auto_147003 - BLOCK
      ?auto_147004 - BLOCK
      ?auto_147005 - BLOCK
      ?auto_147006 - BLOCK
    )
    :vars
    (
      ?auto_147007 - BLOCK
      ?auto_147009 - BLOCK
      ?auto_147008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147007 ?auto_147006 ) ( ON-TABLE ?auto_147001 ) ( ON ?auto_147002 ?auto_147001 ) ( ON ?auto_147003 ?auto_147002 ) ( ON ?auto_147004 ?auto_147003 ) ( ON ?auto_147005 ?auto_147004 ) ( ON ?auto_147006 ?auto_147005 ) ( not ( = ?auto_147001 ?auto_147002 ) ) ( not ( = ?auto_147001 ?auto_147003 ) ) ( not ( = ?auto_147001 ?auto_147004 ) ) ( not ( = ?auto_147001 ?auto_147005 ) ) ( not ( = ?auto_147001 ?auto_147006 ) ) ( not ( = ?auto_147001 ?auto_147007 ) ) ( not ( = ?auto_147002 ?auto_147003 ) ) ( not ( = ?auto_147002 ?auto_147004 ) ) ( not ( = ?auto_147002 ?auto_147005 ) ) ( not ( = ?auto_147002 ?auto_147006 ) ) ( not ( = ?auto_147002 ?auto_147007 ) ) ( not ( = ?auto_147003 ?auto_147004 ) ) ( not ( = ?auto_147003 ?auto_147005 ) ) ( not ( = ?auto_147003 ?auto_147006 ) ) ( not ( = ?auto_147003 ?auto_147007 ) ) ( not ( = ?auto_147004 ?auto_147005 ) ) ( not ( = ?auto_147004 ?auto_147006 ) ) ( not ( = ?auto_147004 ?auto_147007 ) ) ( not ( = ?auto_147005 ?auto_147006 ) ) ( not ( = ?auto_147005 ?auto_147007 ) ) ( not ( = ?auto_147006 ?auto_147007 ) ) ( not ( = ?auto_147001 ?auto_147009 ) ) ( not ( = ?auto_147001 ?auto_147008 ) ) ( not ( = ?auto_147002 ?auto_147009 ) ) ( not ( = ?auto_147002 ?auto_147008 ) ) ( not ( = ?auto_147003 ?auto_147009 ) ) ( not ( = ?auto_147003 ?auto_147008 ) ) ( not ( = ?auto_147004 ?auto_147009 ) ) ( not ( = ?auto_147004 ?auto_147008 ) ) ( not ( = ?auto_147005 ?auto_147009 ) ) ( not ( = ?auto_147005 ?auto_147008 ) ) ( not ( = ?auto_147006 ?auto_147009 ) ) ( not ( = ?auto_147006 ?auto_147008 ) ) ( not ( = ?auto_147007 ?auto_147009 ) ) ( not ( = ?auto_147007 ?auto_147008 ) ) ( not ( = ?auto_147009 ?auto_147008 ) ) ( ON ?auto_147009 ?auto_147007 ) ( ON ?auto_147008 ?auto_147009 ) ( CLEAR ?auto_147008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147001 ?auto_147002 ?auto_147003 ?auto_147004 ?auto_147005 ?auto_147006 ?auto_147007 ?auto_147009 )
      ( MAKE-6PILE ?auto_147001 ?auto_147002 ?auto_147003 ?auto_147004 ?auto_147005 ?auto_147006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147013 - BLOCK
      ?auto_147014 - BLOCK
      ?auto_147015 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147015 ) ( CLEAR ?auto_147014 ) ( ON-TABLE ?auto_147013 ) ( ON ?auto_147014 ?auto_147013 ) ( not ( = ?auto_147013 ?auto_147014 ) ) ( not ( = ?auto_147013 ?auto_147015 ) ) ( not ( = ?auto_147014 ?auto_147015 ) ) )
    :subtasks
    ( ( !STACK ?auto_147015 ?auto_147014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147016 - BLOCK
      ?auto_147017 - BLOCK
      ?auto_147018 - BLOCK
    )
    :vars
    (
      ?auto_147019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147017 ) ( ON-TABLE ?auto_147016 ) ( ON ?auto_147017 ?auto_147016 ) ( not ( = ?auto_147016 ?auto_147017 ) ) ( not ( = ?auto_147016 ?auto_147018 ) ) ( not ( = ?auto_147017 ?auto_147018 ) ) ( ON ?auto_147018 ?auto_147019 ) ( CLEAR ?auto_147018 ) ( HAND-EMPTY ) ( not ( = ?auto_147016 ?auto_147019 ) ) ( not ( = ?auto_147017 ?auto_147019 ) ) ( not ( = ?auto_147018 ?auto_147019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147018 ?auto_147019 )
      ( MAKE-3PILE ?auto_147016 ?auto_147017 ?auto_147018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147020 - BLOCK
      ?auto_147021 - BLOCK
      ?auto_147022 - BLOCK
    )
    :vars
    (
      ?auto_147023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147020 ) ( not ( = ?auto_147020 ?auto_147021 ) ) ( not ( = ?auto_147020 ?auto_147022 ) ) ( not ( = ?auto_147021 ?auto_147022 ) ) ( ON ?auto_147022 ?auto_147023 ) ( CLEAR ?auto_147022 ) ( not ( = ?auto_147020 ?auto_147023 ) ) ( not ( = ?auto_147021 ?auto_147023 ) ) ( not ( = ?auto_147022 ?auto_147023 ) ) ( HOLDING ?auto_147021 ) ( CLEAR ?auto_147020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147020 ?auto_147021 )
      ( MAKE-3PILE ?auto_147020 ?auto_147021 ?auto_147022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147024 - BLOCK
      ?auto_147025 - BLOCK
      ?auto_147026 - BLOCK
    )
    :vars
    (
      ?auto_147027 - BLOCK
      ?auto_147028 - BLOCK
      ?auto_147030 - BLOCK
      ?auto_147031 - BLOCK
      ?auto_147029 - BLOCK
      ?auto_147032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147024 ) ( not ( = ?auto_147024 ?auto_147025 ) ) ( not ( = ?auto_147024 ?auto_147026 ) ) ( not ( = ?auto_147025 ?auto_147026 ) ) ( ON ?auto_147026 ?auto_147027 ) ( not ( = ?auto_147024 ?auto_147027 ) ) ( not ( = ?auto_147025 ?auto_147027 ) ) ( not ( = ?auto_147026 ?auto_147027 ) ) ( CLEAR ?auto_147024 ) ( ON ?auto_147025 ?auto_147026 ) ( CLEAR ?auto_147025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147028 ) ( ON ?auto_147030 ?auto_147028 ) ( ON ?auto_147031 ?auto_147030 ) ( ON ?auto_147029 ?auto_147031 ) ( ON ?auto_147032 ?auto_147029 ) ( ON ?auto_147027 ?auto_147032 ) ( not ( = ?auto_147028 ?auto_147030 ) ) ( not ( = ?auto_147028 ?auto_147031 ) ) ( not ( = ?auto_147028 ?auto_147029 ) ) ( not ( = ?auto_147028 ?auto_147032 ) ) ( not ( = ?auto_147028 ?auto_147027 ) ) ( not ( = ?auto_147028 ?auto_147026 ) ) ( not ( = ?auto_147028 ?auto_147025 ) ) ( not ( = ?auto_147030 ?auto_147031 ) ) ( not ( = ?auto_147030 ?auto_147029 ) ) ( not ( = ?auto_147030 ?auto_147032 ) ) ( not ( = ?auto_147030 ?auto_147027 ) ) ( not ( = ?auto_147030 ?auto_147026 ) ) ( not ( = ?auto_147030 ?auto_147025 ) ) ( not ( = ?auto_147031 ?auto_147029 ) ) ( not ( = ?auto_147031 ?auto_147032 ) ) ( not ( = ?auto_147031 ?auto_147027 ) ) ( not ( = ?auto_147031 ?auto_147026 ) ) ( not ( = ?auto_147031 ?auto_147025 ) ) ( not ( = ?auto_147029 ?auto_147032 ) ) ( not ( = ?auto_147029 ?auto_147027 ) ) ( not ( = ?auto_147029 ?auto_147026 ) ) ( not ( = ?auto_147029 ?auto_147025 ) ) ( not ( = ?auto_147032 ?auto_147027 ) ) ( not ( = ?auto_147032 ?auto_147026 ) ) ( not ( = ?auto_147032 ?auto_147025 ) ) ( not ( = ?auto_147024 ?auto_147028 ) ) ( not ( = ?auto_147024 ?auto_147030 ) ) ( not ( = ?auto_147024 ?auto_147031 ) ) ( not ( = ?auto_147024 ?auto_147029 ) ) ( not ( = ?auto_147024 ?auto_147032 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147028 ?auto_147030 ?auto_147031 ?auto_147029 ?auto_147032 ?auto_147027 ?auto_147026 )
      ( MAKE-3PILE ?auto_147024 ?auto_147025 ?auto_147026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147033 - BLOCK
      ?auto_147034 - BLOCK
      ?auto_147035 - BLOCK
    )
    :vars
    (
      ?auto_147036 - BLOCK
      ?auto_147039 - BLOCK
      ?auto_147041 - BLOCK
      ?auto_147038 - BLOCK
      ?auto_147037 - BLOCK
      ?auto_147040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147033 ?auto_147034 ) ) ( not ( = ?auto_147033 ?auto_147035 ) ) ( not ( = ?auto_147034 ?auto_147035 ) ) ( ON ?auto_147035 ?auto_147036 ) ( not ( = ?auto_147033 ?auto_147036 ) ) ( not ( = ?auto_147034 ?auto_147036 ) ) ( not ( = ?auto_147035 ?auto_147036 ) ) ( ON ?auto_147034 ?auto_147035 ) ( CLEAR ?auto_147034 ) ( ON-TABLE ?auto_147039 ) ( ON ?auto_147041 ?auto_147039 ) ( ON ?auto_147038 ?auto_147041 ) ( ON ?auto_147037 ?auto_147038 ) ( ON ?auto_147040 ?auto_147037 ) ( ON ?auto_147036 ?auto_147040 ) ( not ( = ?auto_147039 ?auto_147041 ) ) ( not ( = ?auto_147039 ?auto_147038 ) ) ( not ( = ?auto_147039 ?auto_147037 ) ) ( not ( = ?auto_147039 ?auto_147040 ) ) ( not ( = ?auto_147039 ?auto_147036 ) ) ( not ( = ?auto_147039 ?auto_147035 ) ) ( not ( = ?auto_147039 ?auto_147034 ) ) ( not ( = ?auto_147041 ?auto_147038 ) ) ( not ( = ?auto_147041 ?auto_147037 ) ) ( not ( = ?auto_147041 ?auto_147040 ) ) ( not ( = ?auto_147041 ?auto_147036 ) ) ( not ( = ?auto_147041 ?auto_147035 ) ) ( not ( = ?auto_147041 ?auto_147034 ) ) ( not ( = ?auto_147038 ?auto_147037 ) ) ( not ( = ?auto_147038 ?auto_147040 ) ) ( not ( = ?auto_147038 ?auto_147036 ) ) ( not ( = ?auto_147038 ?auto_147035 ) ) ( not ( = ?auto_147038 ?auto_147034 ) ) ( not ( = ?auto_147037 ?auto_147040 ) ) ( not ( = ?auto_147037 ?auto_147036 ) ) ( not ( = ?auto_147037 ?auto_147035 ) ) ( not ( = ?auto_147037 ?auto_147034 ) ) ( not ( = ?auto_147040 ?auto_147036 ) ) ( not ( = ?auto_147040 ?auto_147035 ) ) ( not ( = ?auto_147040 ?auto_147034 ) ) ( not ( = ?auto_147033 ?auto_147039 ) ) ( not ( = ?auto_147033 ?auto_147041 ) ) ( not ( = ?auto_147033 ?auto_147038 ) ) ( not ( = ?auto_147033 ?auto_147037 ) ) ( not ( = ?auto_147033 ?auto_147040 ) ) ( HOLDING ?auto_147033 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147033 )
      ( MAKE-3PILE ?auto_147033 ?auto_147034 ?auto_147035 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147042 - BLOCK
      ?auto_147043 - BLOCK
      ?auto_147044 - BLOCK
    )
    :vars
    (
      ?auto_147050 - BLOCK
      ?auto_147047 - BLOCK
      ?auto_147046 - BLOCK
      ?auto_147045 - BLOCK
      ?auto_147049 - BLOCK
      ?auto_147048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147042 ?auto_147043 ) ) ( not ( = ?auto_147042 ?auto_147044 ) ) ( not ( = ?auto_147043 ?auto_147044 ) ) ( ON ?auto_147044 ?auto_147050 ) ( not ( = ?auto_147042 ?auto_147050 ) ) ( not ( = ?auto_147043 ?auto_147050 ) ) ( not ( = ?auto_147044 ?auto_147050 ) ) ( ON ?auto_147043 ?auto_147044 ) ( ON-TABLE ?auto_147047 ) ( ON ?auto_147046 ?auto_147047 ) ( ON ?auto_147045 ?auto_147046 ) ( ON ?auto_147049 ?auto_147045 ) ( ON ?auto_147048 ?auto_147049 ) ( ON ?auto_147050 ?auto_147048 ) ( not ( = ?auto_147047 ?auto_147046 ) ) ( not ( = ?auto_147047 ?auto_147045 ) ) ( not ( = ?auto_147047 ?auto_147049 ) ) ( not ( = ?auto_147047 ?auto_147048 ) ) ( not ( = ?auto_147047 ?auto_147050 ) ) ( not ( = ?auto_147047 ?auto_147044 ) ) ( not ( = ?auto_147047 ?auto_147043 ) ) ( not ( = ?auto_147046 ?auto_147045 ) ) ( not ( = ?auto_147046 ?auto_147049 ) ) ( not ( = ?auto_147046 ?auto_147048 ) ) ( not ( = ?auto_147046 ?auto_147050 ) ) ( not ( = ?auto_147046 ?auto_147044 ) ) ( not ( = ?auto_147046 ?auto_147043 ) ) ( not ( = ?auto_147045 ?auto_147049 ) ) ( not ( = ?auto_147045 ?auto_147048 ) ) ( not ( = ?auto_147045 ?auto_147050 ) ) ( not ( = ?auto_147045 ?auto_147044 ) ) ( not ( = ?auto_147045 ?auto_147043 ) ) ( not ( = ?auto_147049 ?auto_147048 ) ) ( not ( = ?auto_147049 ?auto_147050 ) ) ( not ( = ?auto_147049 ?auto_147044 ) ) ( not ( = ?auto_147049 ?auto_147043 ) ) ( not ( = ?auto_147048 ?auto_147050 ) ) ( not ( = ?auto_147048 ?auto_147044 ) ) ( not ( = ?auto_147048 ?auto_147043 ) ) ( not ( = ?auto_147042 ?auto_147047 ) ) ( not ( = ?auto_147042 ?auto_147046 ) ) ( not ( = ?auto_147042 ?auto_147045 ) ) ( not ( = ?auto_147042 ?auto_147049 ) ) ( not ( = ?auto_147042 ?auto_147048 ) ) ( ON ?auto_147042 ?auto_147043 ) ( CLEAR ?auto_147042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147047 ?auto_147046 ?auto_147045 ?auto_147049 ?auto_147048 ?auto_147050 ?auto_147044 ?auto_147043 )
      ( MAKE-3PILE ?auto_147042 ?auto_147043 ?auto_147044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147056 - BLOCK
      ?auto_147057 - BLOCK
      ?auto_147058 - BLOCK
      ?auto_147059 - BLOCK
      ?auto_147060 - BLOCK
    )
    :vars
    (
      ?auto_147061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147061 ?auto_147060 ) ( CLEAR ?auto_147061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147056 ) ( ON ?auto_147057 ?auto_147056 ) ( ON ?auto_147058 ?auto_147057 ) ( ON ?auto_147059 ?auto_147058 ) ( ON ?auto_147060 ?auto_147059 ) ( not ( = ?auto_147056 ?auto_147057 ) ) ( not ( = ?auto_147056 ?auto_147058 ) ) ( not ( = ?auto_147056 ?auto_147059 ) ) ( not ( = ?auto_147056 ?auto_147060 ) ) ( not ( = ?auto_147056 ?auto_147061 ) ) ( not ( = ?auto_147057 ?auto_147058 ) ) ( not ( = ?auto_147057 ?auto_147059 ) ) ( not ( = ?auto_147057 ?auto_147060 ) ) ( not ( = ?auto_147057 ?auto_147061 ) ) ( not ( = ?auto_147058 ?auto_147059 ) ) ( not ( = ?auto_147058 ?auto_147060 ) ) ( not ( = ?auto_147058 ?auto_147061 ) ) ( not ( = ?auto_147059 ?auto_147060 ) ) ( not ( = ?auto_147059 ?auto_147061 ) ) ( not ( = ?auto_147060 ?auto_147061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147061 ?auto_147060 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147062 - BLOCK
      ?auto_147063 - BLOCK
      ?auto_147064 - BLOCK
      ?auto_147065 - BLOCK
      ?auto_147066 - BLOCK
    )
    :vars
    (
      ?auto_147067 - BLOCK
      ?auto_147068 - BLOCK
      ?auto_147069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147067 ?auto_147066 ) ( CLEAR ?auto_147067 ) ( ON-TABLE ?auto_147062 ) ( ON ?auto_147063 ?auto_147062 ) ( ON ?auto_147064 ?auto_147063 ) ( ON ?auto_147065 ?auto_147064 ) ( ON ?auto_147066 ?auto_147065 ) ( not ( = ?auto_147062 ?auto_147063 ) ) ( not ( = ?auto_147062 ?auto_147064 ) ) ( not ( = ?auto_147062 ?auto_147065 ) ) ( not ( = ?auto_147062 ?auto_147066 ) ) ( not ( = ?auto_147062 ?auto_147067 ) ) ( not ( = ?auto_147063 ?auto_147064 ) ) ( not ( = ?auto_147063 ?auto_147065 ) ) ( not ( = ?auto_147063 ?auto_147066 ) ) ( not ( = ?auto_147063 ?auto_147067 ) ) ( not ( = ?auto_147064 ?auto_147065 ) ) ( not ( = ?auto_147064 ?auto_147066 ) ) ( not ( = ?auto_147064 ?auto_147067 ) ) ( not ( = ?auto_147065 ?auto_147066 ) ) ( not ( = ?auto_147065 ?auto_147067 ) ) ( not ( = ?auto_147066 ?auto_147067 ) ) ( HOLDING ?auto_147068 ) ( CLEAR ?auto_147069 ) ( not ( = ?auto_147062 ?auto_147068 ) ) ( not ( = ?auto_147062 ?auto_147069 ) ) ( not ( = ?auto_147063 ?auto_147068 ) ) ( not ( = ?auto_147063 ?auto_147069 ) ) ( not ( = ?auto_147064 ?auto_147068 ) ) ( not ( = ?auto_147064 ?auto_147069 ) ) ( not ( = ?auto_147065 ?auto_147068 ) ) ( not ( = ?auto_147065 ?auto_147069 ) ) ( not ( = ?auto_147066 ?auto_147068 ) ) ( not ( = ?auto_147066 ?auto_147069 ) ) ( not ( = ?auto_147067 ?auto_147068 ) ) ( not ( = ?auto_147067 ?auto_147069 ) ) ( not ( = ?auto_147068 ?auto_147069 ) ) )
    :subtasks
    ( ( !STACK ?auto_147068 ?auto_147069 )
      ( MAKE-5PILE ?auto_147062 ?auto_147063 ?auto_147064 ?auto_147065 ?auto_147066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147070 - BLOCK
      ?auto_147071 - BLOCK
      ?auto_147072 - BLOCK
      ?auto_147073 - BLOCK
      ?auto_147074 - BLOCK
    )
    :vars
    (
      ?auto_147077 - BLOCK
      ?auto_147075 - BLOCK
      ?auto_147076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147077 ?auto_147074 ) ( ON-TABLE ?auto_147070 ) ( ON ?auto_147071 ?auto_147070 ) ( ON ?auto_147072 ?auto_147071 ) ( ON ?auto_147073 ?auto_147072 ) ( ON ?auto_147074 ?auto_147073 ) ( not ( = ?auto_147070 ?auto_147071 ) ) ( not ( = ?auto_147070 ?auto_147072 ) ) ( not ( = ?auto_147070 ?auto_147073 ) ) ( not ( = ?auto_147070 ?auto_147074 ) ) ( not ( = ?auto_147070 ?auto_147077 ) ) ( not ( = ?auto_147071 ?auto_147072 ) ) ( not ( = ?auto_147071 ?auto_147073 ) ) ( not ( = ?auto_147071 ?auto_147074 ) ) ( not ( = ?auto_147071 ?auto_147077 ) ) ( not ( = ?auto_147072 ?auto_147073 ) ) ( not ( = ?auto_147072 ?auto_147074 ) ) ( not ( = ?auto_147072 ?auto_147077 ) ) ( not ( = ?auto_147073 ?auto_147074 ) ) ( not ( = ?auto_147073 ?auto_147077 ) ) ( not ( = ?auto_147074 ?auto_147077 ) ) ( CLEAR ?auto_147075 ) ( not ( = ?auto_147070 ?auto_147076 ) ) ( not ( = ?auto_147070 ?auto_147075 ) ) ( not ( = ?auto_147071 ?auto_147076 ) ) ( not ( = ?auto_147071 ?auto_147075 ) ) ( not ( = ?auto_147072 ?auto_147076 ) ) ( not ( = ?auto_147072 ?auto_147075 ) ) ( not ( = ?auto_147073 ?auto_147076 ) ) ( not ( = ?auto_147073 ?auto_147075 ) ) ( not ( = ?auto_147074 ?auto_147076 ) ) ( not ( = ?auto_147074 ?auto_147075 ) ) ( not ( = ?auto_147077 ?auto_147076 ) ) ( not ( = ?auto_147077 ?auto_147075 ) ) ( not ( = ?auto_147076 ?auto_147075 ) ) ( ON ?auto_147076 ?auto_147077 ) ( CLEAR ?auto_147076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147070 ?auto_147071 ?auto_147072 ?auto_147073 ?auto_147074 ?auto_147077 )
      ( MAKE-5PILE ?auto_147070 ?auto_147071 ?auto_147072 ?auto_147073 ?auto_147074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147078 - BLOCK
      ?auto_147079 - BLOCK
      ?auto_147080 - BLOCK
      ?auto_147081 - BLOCK
      ?auto_147082 - BLOCK
    )
    :vars
    (
      ?auto_147083 - BLOCK
      ?auto_147084 - BLOCK
      ?auto_147085 - BLOCK
      ?auto_147086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147083 ?auto_147082 ) ( ON-TABLE ?auto_147078 ) ( ON ?auto_147079 ?auto_147078 ) ( ON ?auto_147080 ?auto_147079 ) ( ON ?auto_147081 ?auto_147080 ) ( ON ?auto_147082 ?auto_147081 ) ( not ( = ?auto_147078 ?auto_147079 ) ) ( not ( = ?auto_147078 ?auto_147080 ) ) ( not ( = ?auto_147078 ?auto_147081 ) ) ( not ( = ?auto_147078 ?auto_147082 ) ) ( not ( = ?auto_147078 ?auto_147083 ) ) ( not ( = ?auto_147079 ?auto_147080 ) ) ( not ( = ?auto_147079 ?auto_147081 ) ) ( not ( = ?auto_147079 ?auto_147082 ) ) ( not ( = ?auto_147079 ?auto_147083 ) ) ( not ( = ?auto_147080 ?auto_147081 ) ) ( not ( = ?auto_147080 ?auto_147082 ) ) ( not ( = ?auto_147080 ?auto_147083 ) ) ( not ( = ?auto_147081 ?auto_147082 ) ) ( not ( = ?auto_147081 ?auto_147083 ) ) ( not ( = ?auto_147082 ?auto_147083 ) ) ( not ( = ?auto_147078 ?auto_147084 ) ) ( not ( = ?auto_147078 ?auto_147085 ) ) ( not ( = ?auto_147079 ?auto_147084 ) ) ( not ( = ?auto_147079 ?auto_147085 ) ) ( not ( = ?auto_147080 ?auto_147084 ) ) ( not ( = ?auto_147080 ?auto_147085 ) ) ( not ( = ?auto_147081 ?auto_147084 ) ) ( not ( = ?auto_147081 ?auto_147085 ) ) ( not ( = ?auto_147082 ?auto_147084 ) ) ( not ( = ?auto_147082 ?auto_147085 ) ) ( not ( = ?auto_147083 ?auto_147084 ) ) ( not ( = ?auto_147083 ?auto_147085 ) ) ( not ( = ?auto_147084 ?auto_147085 ) ) ( ON ?auto_147084 ?auto_147083 ) ( CLEAR ?auto_147084 ) ( HOLDING ?auto_147085 ) ( CLEAR ?auto_147086 ) ( ON-TABLE ?auto_147086 ) ( not ( = ?auto_147086 ?auto_147085 ) ) ( not ( = ?auto_147078 ?auto_147086 ) ) ( not ( = ?auto_147079 ?auto_147086 ) ) ( not ( = ?auto_147080 ?auto_147086 ) ) ( not ( = ?auto_147081 ?auto_147086 ) ) ( not ( = ?auto_147082 ?auto_147086 ) ) ( not ( = ?auto_147083 ?auto_147086 ) ) ( not ( = ?auto_147084 ?auto_147086 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147086 ?auto_147085 )
      ( MAKE-5PILE ?auto_147078 ?auto_147079 ?auto_147080 ?auto_147081 ?auto_147082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148606 - BLOCK
      ?auto_148607 - BLOCK
      ?auto_148608 - BLOCK
      ?auto_148609 - BLOCK
      ?auto_148610 - BLOCK
    )
    :vars
    (
      ?auto_148612 - BLOCK
      ?auto_148611 - BLOCK
      ?auto_148613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148612 ?auto_148610 ) ( ON-TABLE ?auto_148606 ) ( ON ?auto_148607 ?auto_148606 ) ( ON ?auto_148608 ?auto_148607 ) ( ON ?auto_148609 ?auto_148608 ) ( ON ?auto_148610 ?auto_148609 ) ( not ( = ?auto_148606 ?auto_148607 ) ) ( not ( = ?auto_148606 ?auto_148608 ) ) ( not ( = ?auto_148606 ?auto_148609 ) ) ( not ( = ?auto_148606 ?auto_148610 ) ) ( not ( = ?auto_148606 ?auto_148612 ) ) ( not ( = ?auto_148607 ?auto_148608 ) ) ( not ( = ?auto_148607 ?auto_148609 ) ) ( not ( = ?auto_148607 ?auto_148610 ) ) ( not ( = ?auto_148607 ?auto_148612 ) ) ( not ( = ?auto_148608 ?auto_148609 ) ) ( not ( = ?auto_148608 ?auto_148610 ) ) ( not ( = ?auto_148608 ?auto_148612 ) ) ( not ( = ?auto_148609 ?auto_148610 ) ) ( not ( = ?auto_148609 ?auto_148612 ) ) ( not ( = ?auto_148610 ?auto_148612 ) ) ( not ( = ?auto_148606 ?auto_148611 ) ) ( not ( = ?auto_148606 ?auto_148613 ) ) ( not ( = ?auto_148607 ?auto_148611 ) ) ( not ( = ?auto_148607 ?auto_148613 ) ) ( not ( = ?auto_148608 ?auto_148611 ) ) ( not ( = ?auto_148608 ?auto_148613 ) ) ( not ( = ?auto_148609 ?auto_148611 ) ) ( not ( = ?auto_148609 ?auto_148613 ) ) ( not ( = ?auto_148610 ?auto_148611 ) ) ( not ( = ?auto_148610 ?auto_148613 ) ) ( not ( = ?auto_148612 ?auto_148611 ) ) ( not ( = ?auto_148612 ?auto_148613 ) ) ( not ( = ?auto_148611 ?auto_148613 ) ) ( ON ?auto_148611 ?auto_148612 ) ( ON ?auto_148613 ?auto_148611 ) ( CLEAR ?auto_148613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148606 ?auto_148607 ?auto_148608 ?auto_148609 ?auto_148610 ?auto_148612 ?auto_148611 )
      ( MAKE-5PILE ?auto_148606 ?auto_148607 ?auto_148608 ?auto_148609 ?auto_148610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147096 - BLOCK
      ?auto_147097 - BLOCK
      ?auto_147098 - BLOCK
      ?auto_147099 - BLOCK
      ?auto_147100 - BLOCK
    )
    :vars
    (
      ?auto_147104 - BLOCK
      ?auto_147103 - BLOCK
      ?auto_147101 - BLOCK
      ?auto_147102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147104 ?auto_147100 ) ( ON-TABLE ?auto_147096 ) ( ON ?auto_147097 ?auto_147096 ) ( ON ?auto_147098 ?auto_147097 ) ( ON ?auto_147099 ?auto_147098 ) ( ON ?auto_147100 ?auto_147099 ) ( not ( = ?auto_147096 ?auto_147097 ) ) ( not ( = ?auto_147096 ?auto_147098 ) ) ( not ( = ?auto_147096 ?auto_147099 ) ) ( not ( = ?auto_147096 ?auto_147100 ) ) ( not ( = ?auto_147096 ?auto_147104 ) ) ( not ( = ?auto_147097 ?auto_147098 ) ) ( not ( = ?auto_147097 ?auto_147099 ) ) ( not ( = ?auto_147097 ?auto_147100 ) ) ( not ( = ?auto_147097 ?auto_147104 ) ) ( not ( = ?auto_147098 ?auto_147099 ) ) ( not ( = ?auto_147098 ?auto_147100 ) ) ( not ( = ?auto_147098 ?auto_147104 ) ) ( not ( = ?auto_147099 ?auto_147100 ) ) ( not ( = ?auto_147099 ?auto_147104 ) ) ( not ( = ?auto_147100 ?auto_147104 ) ) ( not ( = ?auto_147096 ?auto_147103 ) ) ( not ( = ?auto_147096 ?auto_147101 ) ) ( not ( = ?auto_147097 ?auto_147103 ) ) ( not ( = ?auto_147097 ?auto_147101 ) ) ( not ( = ?auto_147098 ?auto_147103 ) ) ( not ( = ?auto_147098 ?auto_147101 ) ) ( not ( = ?auto_147099 ?auto_147103 ) ) ( not ( = ?auto_147099 ?auto_147101 ) ) ( not ( = ?auto_147100 ?auto_147103 ) ) ( not ( = ?auto_147100 ?auto_147101 ) ) ( not ( = ?auto_147104 ?auto_147103 ) ) ( not ( = ?auto_147104 ?auto_147101 ) ) ( not ( = ?auto_147103 ?auto_147101 ) ) ( ON ?auto_147103 ?auto_147104 ) ( not ( = ?auto_147102 ?auto_147101 ) ) ( not ( = ?auto_147096 ?auto_147102 ) ) ( not ( = ?auto_147097 ?auto_147102 ) ) ( not ( = ?auto_147098 ?auto_147102 ) ) ( not ( = ?auto_147099 ?auto_147102 ) ) ( not ( = ?auto_147100 ?auto_147102 ) ) ( not ( = ?auto_147104 ?auto_147102 ) ) ( not ( = ?auto_147103 ?auto_147102 ) ) ( ON ?auto_147101 ?auto_147103 ) ( CLEAR ?auto_147101 ) ( HOLDING ?auto_147102 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147102 )
      ( MAKE-5PILE ?auto_147096 ?auto_147097 ?auto_147098 ?auto_147099 ?auto_147100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147105 - BLOCK
      ?auto_147106 - BLOCK
      ?auto_147107 - BLOCK
      ?auto_147108 - BLOCK
      ?auto_147109 - BLOCK
    )
    :vars
    (
      ?auto_147110 - BLOCK
      ?auto_147111 - BLOCK
      ?auto_147113 - BLOCK
      ?auto_147112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147110 ?auto_147109 ) ( ON-TABLE ?auto_147105 ) ( ON ?auto_147106 ?auto_147105 ) ( ON ?auto_147107 ?auto_147106 ) ( ON ?auto_147108 ?auto_147107 ) ( ON ?auto_147109 ?auto_147108 ) ( not ( = ?auto_147105 ?auto_147106 ) ) ( not ( = ?auto_147105 ?auto_147107 ) ) ( not ( = ?auto_147105 ?auto_147108 ) ) ( not ( = ?auto_147105 ?auto_147109 ) ) ( not ( = ?auto_147105 ?auto_147110 ) ) ( not ( = ?auto_147106 ?auto_147107 ) ) ( not ( = ?auto_147106 ?auto_147108 ) ) ( not ( = ?auto_147106 ?auto_147109 ) ) ( not ( = ?auto_147106 ?auto_147110 ) ) ( not ( = ?auto_147107 ?auto_147108 ) ) ( not ( = ?auto_147107 ?auto_147109 ) ) ( not ( = ?auto_147107 ?auto_147110 ) ) ( not ( = ?auto_147108 ?auto_147109 ) ) ( not ( = ?auto_147108 ?auto_147110 ) ) ( not ( = ?auto_147109 ?auto_147110 ) ) ( not ( = ?auto_147105 ?auto_147111 ) ) ( not ( = ?auto_147105 ?auto_147113 ) ) ( not ( = ?auto_147106 ?auto_147111 ) ) ( not ( = ?auto_147106 ?auto_147113 ) ) ( not ( = ?auto_147107 ?auto_147111 ) ) ( not ( = ?auto_147107 ?auto_147113 ) ) ( not ( = ?auto_147108 ?auto_147111 ) ) ( not ( = ?auto_147108 ?auto_147113 ) ) ( not ( = ?auto_147109 ?auto_147111 ) ) ( not ( = ?auto_147109 ?auto_147113 ) ) ( not ( = ?auto_147110 ?auto_147111 ) ) ( not ( = ?auto_147110 ?auto_147113 ) ) ( not ( = ?auto_147111 ?auto_147113 ) ) ( ON ?auto_147111 ?auto_147110 ) ( not ( = ?auto_147112 ?auto_147113 ) ) ( not ( = ?auto_147105 ?auto_147112 ) ) ( not ( = ?auto_147106 ?auto_147112 ) ) ( not ( = ?auto_147107 ?auto_147112 ) ) ( not ( = ?auto_147108 ?auto_147112 ) ) ( not ( = ?auto_147109 ?auto_147112 ) ) ( not ( = ?auto_147110 ?auto_147112 ) ) ( not ( = ?auto_147111 ?auto_147112 ) ) ( ON ?auto_147113 ?auto_147111 ) ( ON ?auto_147112 ?auto_147113 ) ( CLEAR ?auto_147112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147105 ?auto_147106 ?auto_147107 ?auto_147108 ?auto_147109 ?auto_147110 ?auto_147111 ?auto_147113 )
      ( MAKE-5PILE ?auto_147105 ?auto_147106 ?auto_147107 ?auto_147108 ?auto_147109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147118 - BLOCK
      ?auto_147119 - BLOCK
      ?auto_147120 - BLOCK
      ?auto_147121 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147121 ) ( CLEAR ?auto_147120 ) ( ON-TABLE ?auto_147118 ) ( ON ?auto_147119 ?auto_147118 ) ( ON ?auto_147120 ?auto_147119 ) ( not ( = ?auto_147118 ?auto_147119 ) ) ( not ( = ?auto_147118 ?auto_147120 ) ) ( not ( = ?auto_147118 ?auto_147121 ) ) ( not ( = ?auto_147119 ?auto_147120 ) ) ( not ( = ?auto_147119 ?auto_147121 ) ) ( not ( = ?auto_147120 ?auto_147121 ) ) )
    :subtasks
    ( ( !STACK ?auto_147121 ?auto_147120 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147122 - BLOCK
      ?auto_147123 - BLOCK
      ?auto_147124 - BLOCK
      ?auto_147125 - BLOCK
    )
    :vars
    (
      ?auto_147126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147124 ) ( ON-TABLE ?auto_147122 ) ( ON ?auto_147123 ?auto_147122 ) ( ON ?auto_147124 ?auto_147123 ) ( not ( = ?auto_147122 ?auto_147123 ) ) ( not ( = ?auto_147122 ?auto_147124 ) ) ( not ( = ?auto_147122 ?auto_147125 ) ) ( not ( = ?auto_147123 ?auto_147124 ) ) ( not ( = ?auto_147123 ?auto_147125 ) ) ( not ( = ?auto_147124 ?auto_147125 ) ) ( ON ?auto_147125 ?auto_147126 ) ( CLEAR ?auto_147125 ) ( HAND-EMPTY ) ( not ( = ?auto_147122 ?auto_147126 ) ) ( not ( = ?auto_147123 ?auto_147126 ) ) ( not ( = ?auto_147124 ?auto_147126 ) ) ( not ( = ?auto_147125 ?auto_147126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147125 ?auto_147126 )
      ( MAKE-4PILE ?auto_147122 ?auto_147123 ?auto_147124 ?auto_147125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147127 - BLOCK
      ?auto_147128 - BLOCK
      ?auto_147129 - BLOCK
      ?auto_147130 - BLOCK
    )
    :vars
    (
      ?auto_147131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147127 ) ( ON ?auto_147128 ?auto_147127 ) ( not ( = ?auto_147127 ?auto_147128 ) ) ( not ( = ?auto_147127 ?auto_147129 ) ) ( not ( = ?auto_147127 ?auto_147130 ) ) ( not ( = ?auto_147128 ?auto_147129 ) ) ( not ( = ?auto_147128 ?auto_147130 ) ) ( not ( = ?auto_147129 ?auto_147130 ) ) ( ON ?auto_147130 ?auto_147131 ) ( CLEAR ?auto_147130 ) ( not ( = ?auto_147127 ?auto_147131 ) ) ( not ( = ?auto_147128 ?auto_147131 ) ) ( not ( = ?auto_147129 ?auto_147131 ) ) ( not ( = ?auto_147130 ?auto_147131 ) ) ( HOLDING ?auto_147129 ) ( CLEAR ?auto_147128 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147127 ?auto_147128 ?auto_147129 )
      ( MAKE-4PILE ?auto_147127 ?auto_147128 ?auto_147129 ?auto_147130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147132 - BLOCK
      ?auto_147133 - BLOCK
      ?auto_147134 - BLOCK
      ?auto_147135 - BLOCK
    )
    :vars
    (
      ?auto_147136 - BLOCK
      ?auto_147139 - BLOCK
      ?auto_147140 - BLOCK
      ?auto_147138 - BLOCK
      ?auto_147137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147132 ) ( ON ?auto_147133 ?auto_147132 ) ( not ( = ?auto_147132 ?auto_147133 ) ) ( not ( = ?auto_147132 ?auto_147134 ) ) ( not ( = ?auto_147132 ?auto_147135 ) ) ( not ( = ?auto_147133 ?auto_147134 ) ) ( not ( = ?auto_147133 ?auto_147135 ) ) ( not ( = ?auto_147134 ?auto_147135 ) ) ( ON ?auto_147135 ?auto_147136 ) ( not ( = ?auto_147132 ?auto_147136 ) ) ( not ( = ?auto_147133 ?auto_147136 ) ) ( not ( = ?auto_147134 ?auto_147136 ) ) ( not ( = ?auto_147135 ?auto_147136 ) ) ( CLEAR ?auto_147133 ) ( ON ?auto_147134 ?auto_147135 ) ( CLEAR ?auto_147134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147139 ) ( ON ?auto_147140 ?auto_147139 ) ( ON ?auto_147138 ?auto_147140 ) ( ON ?auto_147137 ?auto_147138 ) ( ON ?auto_147136 ?auto_147137 ) ( not ( = ?auto_147139 ?auto_147140 ) ) ( not ( = ?auto_147139 ?auto_147138 ) ) ( not ( = ?auto_147139 ?auto_147137 ) ) ( not ( = ?auto_147139 ?auto_147136 ) ) ( not ( = ?auto_147139 ?auto_147135 ) ) ( not ( = ?auto_147139 ?auto_147134 ) ) ( not ( = ?auto_147140 ?auto_147138 ) ) ( not ( = ?auto_147140 ?auto_147137 ) ) ( not ( = ?auto_147140 ?auto_147136 ) ) ( not ( = ?auto_147140 ?auto_147135 ) ) ( not ( = ?auto_147140 ?auto_147134 ) ) ( not ( = ?auto_147138 ?auto_147137 ) ) ( not ( = ?auto_147138 ?auto_147136 ) ) ( not ( = ?auto_147138 ?auto_147135 ) ) ( not ( = ?auto_147138 ?auto_147134 ) ) ( not ( = ?auto_147137 ?auto_147136 ) ) ( not ( = ?auto_147137 ?auto_147135 ) ) ( not ( = ?auto_147137 ?auto_147134 ) ) ( not ( = ?auto_147132 ?auto_147139 ) ) ( not ( = ?auto_147132 ?auto_147140 ) ) ( not ( = ?auto_147132 ?auto_147138 ) ) ( not ( = ?auto_147132 ?auto_147137 ) ) ( not ( = ?auto_147133 ?auto_147139 ) ) ( not ( = ?auto_147133 ?auto_147140 ) ) ( not ( = ?auto_147133 ?auto_147138 ) ) ( not ( = ?auto_147133 ?auto_147137 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147139 ?auto_147140 ?auto_147138 ?auto_147137 ?auto_147136 ?auto_147135 )
      ( MAKE-4PILE ?auto_147132 ?auto_147133 ?auto_147134 ?auto_147135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147141 - BLOCK
      ?auto_147142 - BLOCK
      ?auto_147143 - BLOCK
      ?auto_147144 - BLOCK
    )
    :vars
    (
      ?auto_147147 - BLOCK
      ?auto_147145 - BLOCK
      ?auto_147146 - BLOCK
      ?auto_147148 - BLOCK
      ?auto_147149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147141 ) ( not ( = ?auto_147141 ?auto_147142 ) ) ( not ( = ?auto_147141 ?auto_147143 ) ) ( not ( = ?auto_147141 ?auto_147144 ) ) ( not ( = ?auto_147142 ?auto_147143 ) ) ( not ( = ?auto_147142 ?auto_147144 ) ) ( not ( = ?auto_147143 ?auto_147144 ) ) ( ON ?auto_147144 ?auto_147147 ) ( not ( = ?auto_147141 ?auto_147147 ) ) ( not ( = ?auto_147142 ?auto_147147 ) ) ( not ( = ?auto_147143 ?auto_147147 ) ) ( not ( = ?auto_147144 ?auto_147147 ) ) ( ON ?auto_147143 ?auto_147144 ) ( CLEAR ?auto_147143 ) ( ON-TABLE ?auto_147145 ) ( ON ?auto_147146 ?auto_147145 ) ( ON ?auto_147148 ?auto_147146 ) ( ON ?auto_147149 ?auto_147148 ) ( ON ?auto_147147 ?auto_147149 ) ( not ( = ?auto_147145 ?auto_147146 ) ) ( not ( = ?auto_147145 ?auto_147148 ) ) ( not ( = ?auto_147145 ?auto_147149 ) ) ( not ( = ?auto_147145 ?auto_147147 ) ) ( not ( = ?auto_147145 ?auto_147144 ) ) ( not ( = ?auto_147145 ?auto_147143 ) ) ( not ( = ?auto_147146 ?auto_147148 ) ) ( not ( = ?auto_147146 ?auto_147149 ) ) ( not ( = ?auto_147146 ?auto_147147 ) ) ( not ( = ?auto_147146 ?auto_147144 ) ) ( not ( = ?auto_147146 ?auto_147143 ) ) ( not ( = ?auto_147148 ?auto_147149 ) ) ( not ( = ?auto_147148 ?auto_147147 ) ) ( not ( = ?auto_147148 ?auto_147144 ) ) ( not ( = ?auto_147148 ?auto_147143 ) ) ( not ( = ?auto_147149 ?auto_147147 ) ) ( not ( = ?auto_147149 ?auto_147144 ) ) ( not ( = ?auto_147149 ?auto_147143 ) ) ( not ( = ?auto_147141 ?auto_147145 ) ) ( not ( = ?auto_147141 ?auto_147146 ) ) ( not ( = ?auto_147141 ?auto_147148 ) ) ( not ( = ?auto_147141 ?auto_147149 ) ) ( not ( = ?auto_147142 ?auto_147145 ) ) ( not ( = ?auto_147142 ?auto_147146 ) ) ( not ( = ?auto_147142 ?auto_147148 ) ) ( not ( = ?auto_147142 ?auto_147149 ) ) ( HOLDING ?auto_147142 ) ( CLEAR ?auto_147141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147141 ?auto_147142 )
      ( MAKE-4PILE ?auto_147141 ?auto_147142 ?auto_147143 ?auto_147144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147150 - BLOCK
      ?auto_147151 - BLOCK
      ?auto_147152 - BLOCK
      ?auto_147153 - BLOCK
    )
    :vars
    (
      ?auto_147157 - BLOCK
      ?auto_147156 - BLOCK
      ?auto_147155 - BLOCK
      ?auto_147154 - BLOCK
      ?auto_147158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147150 ) ( not ( = ?auto_147150 ?auto_147151 ) ) ( not ( = ?auto_147150 ?auto_147152 ) ) ( not ( = ?auto_147150 ?auto_147153 ) ) ( not ( = ?auto_147151 ?auto_147152 ) ) ( not ( = ?auto_147151 ?auto_147153 ) ) ( not ( = ?auto_147152 ?auto_147153 ) ) ( ON ?auto_147153 ?auto_147157 ) ( not ( = ?auto_147150 ?auto_147157 ) ) ( not ( = ?auto_147151 ?auto_147157 ) ) ( not ( = ?auto_147152 ?auto_147157 ) ) ( not ( = ?auto_147153 ?auto_147157 ) ) ( ON ?auto_147152 ?auto_147153 ) ( ON-TABLE ?auto_147156 ) ( ON ?auto_147155 ?auto_147156 ) ( ON ?auto_147154 ?auto_147155 ) ( ON ?auto_147158 ?auto_147154 ) ( ON ?auto_147157 ?auto_147158 ) ( not ( = ?auto_147156 ?auto_147155 ) ) ( not ( = ?auto_147156 ?auto_147154 ) ) ( not ( = ?auto_147156 ?auto_147158 ) ) ( not ( = ?auto_147156 ?auto_147157 ) ) ( not ( = ?auto_147156 ?auto_147153 ) ) ( not ( = ?auto_147156 ?auto_147152 ) ) ( not ( = ?auto_147155 ?auto_147154 ) ) ( not ( = ?auto_147155 ?auto_147158 ) ) ( not ( = ?auto_147155 ?auto_147157 ) ) ( not ( = ?auto_147155 ?auto_147153 ) ) ( not ( = ?auto_147155 ?auto_147152 ) ) ( not ( = ?auto_147154 ?auto_147158 ) ) ( not ( = ?auto_147154 ?auto_147157 ) ) ( not ( = ?auto_147154 ?auto_147153 ) ) ( not ( = ?auto_147154 ?auto_147152 ) ) ( not ( = ?auto_147158 ?auto_147157 ) ) ( not ( = ?auto_147158 ?auto_147153 ) ) ( not ( = ?auto_147158 ?auto_147152 ) ) ( not ( = ?auto_147150 ?auto_147156 ) ) ( not ( = ?auto_147150 ?auto_147155 ) ) ( not ( = ?auto_147150 ?auto_147154 ) ) ( not ( = ?auto_147150 ?auto_147158 ) ) ( not ( = ?auto_147151 ?auto_147156 ) ) ( not ( = ?auto_147151 ?auto_147155 ) ) ( not ( = ?auto_147151 ?auto_147154 ) ) ( not ( = ?auto_147151 ?auto_147158 ) ) ( CLEAR ?auto_147150 ) ( ON ?auto_147151 ?auto_147152 ) ( CLEAR ?auto_147151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147156 ?auto_147155 ?auto_147154 ?auto_147158 ?auto_147157 ?auto_147153 ?auto_147152 )
      ( MAKE-4PILE ?auto_147150 ?auto_147151 ?auto_147152 ?auto_147153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147159 - BLOCK
      ?auto_147160 - BLOCK
      ?auto_147161 - BLOCK
      ?auto_147162 - BLOCK
    )
    :vars
    (
      ?auto_147166 - BLOCK
      ?auto_147164 - BLOCK
      ?auto_147167 - BLOCK
      ?auto_147163 - BLOCK
      ?auto_147165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147159 ?auto_147160 ) ) ( not ( = ?auto_147159 ?auto_147161 ) ) ( not ( = ?auto_147159 ?auto_147162 ) ) ( not ( = ?auto_147160 ?auto_147161 ) ) ( not ( = ?auto_147160 ?auto_147162 ) ) ( not ( = ?auto_147161 ?auto_147162 ) ) ( ON ?auto_147162 ?auto_147166 ) ( not ( = ?auto_147159 ?auto_147166 ) ) ( not ( = ?auto_147160 ?auto_147166 ) ) ( not ( = ?auto_147161 ?auto_147166 ) ) ( not ( = ?auto_147162 ?auto_147166 ) ) ( ON ?auto_147161 ?auto_147162 ) ( ON-TABLE ?auto_147164 ) ( ON ?auto_147167 ?auto_147164 ) ( ON ?auto_147163 ?auto_147167 ) ( ON ?auto_147165 ?auto_147163 ) ( ON ?auto_147166 ?auto_147165 ) ( not ( = ?auto_147164 ?auto_147167 ) ) ( not ( = ?auto_147164 ?auto_147163 ) ) ( not ( = ?auto_147164 ?auto_147165 ) ) ( not ( = ?auto_147164 ?auto_147166 ) ) ( not ( = ?auto_147164 ?auto_147162 ) ) ( not ( = ?auto_147164 ?auto_147161 ) ) ( not ( = ?auto_147167 ?auto_147163 ) ) ( not ( = ?auto_147167 ?auto_147165 ) ) ( not ( = ?auto_147167 ?auto_147166 ) ) ( not ( = ?auto_147167 ?auto_147162 ) ) ( not ( = ?auto_147167 ?auto_147161 ) ) ( not ( = ?auto_147163 ?auto_147165 ) ) ( not ( = ?auto_147163 ?auto_147166 ) ) ( not ( = ?auto_147163 ?auto_147162 ) ) ( not ( = ?auto_147163 ?auto_147161 ) ) ( not ( = ?auto_147165 ?auto_147166 ) ) ( not ( = ?auto_147165 ?auto_147162 ) ) ( not ( = ?auto_147165 ?auto_147161 ) ) ( not ( = ?auto_147159 ?auto_147164 ) ) ( not ( = ?auto_147159 ?auto_147167 ) ) ( not ( = ?auto_147159 ?auto_147163 ) ) ( not ( = ?auto_147159 ?auto_147165 ) ) ( not ( = ?auto_147160 ?auto_147164 ) ) ( not ( = ?auto_147160 ?auto_147167 ) ) ( not ( = ?auto_147160 ?auto_147163 ) ) ( not ( = ?auto_147160 ?auto_147165 ) ) ( ON ?auto_147160 ?auto_147161 ) ( CLEAR ?auto_147160 ) ( HOLDING ?auto_147159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147159 )
      ( MAKE-4PILE ?auto_147159 ?auto_147160 ?auto_147161 ?auto_147162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147168 - BLOCK
      ?auto_147169 - BLOCK
      ?auto_147170 - BLOCK
      ?auto_147171 - BLOCK
    )
    :vars
    (
      ?auto_147174 - BLOCK
      ?auto_147176 - BLOCK
      ?auto_147172 - BLOCK
      ?auto_147175 - BLOCK
      ?auto_147173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147168 ?auto_147169 ) ) ( not ( = ?auto_147168 ?auto_147170 ) ) ( not ( = ?auto_147168 ?auto_147171 ) ) ( not ( = ?auto_147169 ?auto_147170 ) ) ( not ( = ?auto_147169 ?auto_147171 ) ) ( not ( = ?auto_147170 ?auto_147171 ) ) ( ON ?auto_147171 ?auto_147174 ) ( not ( = ?auto_147168 ?auto_147174 ) ) ( not ( = ?auto_147169 ?auto_147174 ) ) ( not ( = ?auto_147170 ?auto_147174 ) ) ( not ( = ?auto_147171 ?auto_147174 ) ) ( ON ?auto_147170 ?auto_147171 ) ( ON-TABLE ?auto_147176 ) ( ON ?auto_147172 ?auto_147176 ) ( ON ?auto_147175 ?auto_147172 ) ( ON ?auto_147173 ?auto_147175 ) ( ON ?auto_147174 ?auto_147173 ) ( not ( = ?auto_147176 ?auto_147172 ) ) ( not ( = ?auto_147176 ?auto_147175 ) ) ( not ( = ?auto_147176 ?auto_147173 ) ) ( not ( = ?auto_147176 ?auto_147174 ) ) ( not ( = ?auto_147176 ?auto_147171 ) ) ( not ( = ?auto_147176 ?auto_147170 ) ) ( not ( = ?auto_147172 ?auto_147175 ) ) ( not ( = ?auto_147172 ?auto_147173 ) ) ( not ( = ?auto_147172 ?auto_147174 ) ) ( not ( = ?auto_147172 ?auto_147171 ) ) ( not ( = ?auto_147172 ?auto_147170 ) ) ( not ( = ?auto_147175 ?auto_147173 ) ) ( not ( = ?auto_147175 ?auto_147174 ) ) ( not ( = ?auto_147175 ?auto_147171 ) ) ( not ( = ?auto_147175 ?auto_147170 ) ) ( not ( = ?auto_147173 ?auto_147174 ) ) ( not ( = ?auto_147173 ?auto_147171 ) ) ( not ( = ?auto_147173 ?auto_147170 ) ) ( not ( = ?auto_147168 ?auto_147176 ) ) ( not ( = ?auto_147168 ?auto_147172 ) ) ( not ( = ?auto_147168 ?auto_147175 ) ) ( not ( = ?auto_147168 ?auto_147173 ) ) ( not ( = ?auto_147169 ?auto_147176 ) ) ( not ( = ?auto_147169 ?auto_147172 ) ) ( not ( = ?auto_147169 ?auto_147175 ) ) ( not ( = ?auto_147169 ?auto_147173 ) ) ( ON ?auto_147169 ?auto_147170 ) ( ON ?auto_147168 ?auto_147169 ) ( CLEAR ?auto_147168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147176 ?auto_147172 ?auto_147175 ?auto_147173 ?auto_147174 ?auto_147171 ?auto_147170 ?auto_147169 )
      ( MAKE-4PILE ?auto_147168 ?auto_147169 ?auto_147170 ?auto_147171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147181 - BLOCK
      ?auto_147182 - BLOCK
      ?auto_147183 - BLOCK
      ?auto_147184 - BLOCK
    )
    :vars
    (
      ?auto_147185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147185 ?auto_147184 ) ( CLEAR ?auto_147185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147181 ) ( ON ?auto_147182 ?auto_147181 ) ( ON ?auto_147183 ?auto_147182 ) ( ON ?auto_147184 ?auto_147183 ) ( not ( = ?auto_147181 ?auto_147182 ) ) ( not ( = ?auto_147181 ?auto_147183 ) ) ( not ( = ?auto_147181 ?auto_147184 ) ) ( not ( = ?auto_147181 ?auto_147185 ) ) ( not ( = ?auto_147182 ?auto_147183 ) ) ( not ( = ?auto_147182 ?auto_147184 ) ) ( not ( = ?auto_147182 ?auto_147185 ) ) ( not ( = ?auto_147183 ?auto_147184 ) ) ( not ( = ?auto_147183 ?auto_147185 ) ) ( not ( = ?auto_147184 ?auto_147185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147185 ?auto_147184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147186 - BLOCK
      ?auto_147187 - BLOCK
      ?auto_147188 - BLOCK
      ?auto_147189 - BLOCK
    )
    :vars
    (
      ?auto_147190 - BLOCK
      ?auto_147191 - BLOCK
      ?auto_147192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147190 ?auto_147189 ) ( CLEAR ?auto_147190 ) ( ON-TABLE ?auto_147186 ) ( ON ?auto_147187 ?auto_147186 ) ( ON ?auto_147188 ?auto_147187 ) ( ON ?auto_147189 ?auto_147188 ) ( not ( = ?auto_147186 ?auto_147187 ) ) ( not ( = ?auto_147186 ?auto_147188 ) ) ( not ( = ?auto_147186 ?auto_147189 ) ) ( not ( = ?auto_147186 ?auto_147190 ) ) ( not ( = ?auto_147187 ?auto_147188 ) ) ( not ( = ?auto_147187 ?auto_147189 ) ) ( not ( = ?auto_147187 ?auto_147190 ) ) ( not ( = ?auto_147188 ?auto_147189 ) ) ( not ( = ?auto_147188 ?auto_147190 ) ) ( not ( = ?auto_147189 ?auto_147190 ) ) ( HOLDING ?auto_147191 ) ( CLEAR ?auto_147192 ) ( not ( = ?auto_147186 ?auto_147191 ) ) ( not ( = ?auto_147186 ?auto_147192 ) ) ( not ( = ?auto_147187 ?auto_147191 ) ) ( not ( = ?auto_147187 ?auto_147192 ) ) ( not ( = ?auto_147188 ?auto_147191 ) ) ( not ( = ?auto_147188 ?auto_147192 ) ) ( not ( = ?auto_147189 ?auto_147191 ) ) ( not ( = ?auto_147189 ?auto_147192 ) ) ( not ( = ?auto_147190 ?auto_147191 ) ) ( not ( = ?auto_147190 ?auto_147192 ) ) ( not ( = ?auto_147191 ?auto_147192 ) ) )
    :subtasks
    ( ( !STACK ?auto_147191 ?auto_147192 )
      ( MAKE-4PILE ?auto_147186 ?auto_147187 ?auto_147188 ?auto_147189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147193 - BLOCK
      ?auto_147194 - BLOCK
      ?auto_147195 - BLOCK
      ?auto_147196 - BLOCK
    )
    :vars
    (
      ?auto_147198 - BLOCK
      ?auto_147199 - BLOCK
      ?auto_147197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147198 ?auto_147196 ) ( ON-TABLE ?auto_147193 ) ( ON ?auto_147194 ?auto_147193 ) ( ON ?auto_147195 ?auto_147194 ) ( ON ?auto_147196 ?auto_147195 ) ( not ( = ?auto_147193 ?auto_147194 ) ) ( not ( = ?auto_147193 ?auto_147195 ) ) ( not ( = ?auto_147193 ?auto_147196 ) ) ( not ( = ?auto_147193 ?auto_147198 ) ) ( not ( = ?auto_147194 ?auto_147195 ) ) ( not ( = ?auto_147194 ?auto_147196 ) ) ( not ( = ?auto_147194 ?auto_147198 ) ) ( not ( = ?auto_147195 ?auto_147196 ) ) ( not ( = ?auto_147195 ?auto_147198 ) ) ( not ( = ?auto_147196 ?auto_147198 ) ) ( CLEAR ?auto_147199 ) ( not ( = ?auto_147193 ?auto_147197 ) ) ( not ( = ?auto_147193 ?auto_147199 ) ) ( not ( = ?auto_147194 ?auto_147197 ) ) ( not ( = ?auto_147194 ?auto_147199 ) ) ( not ( = ?auto_147195 ?auto_147197 ) ) ( not ( = ?auto_147195 ?auto_147199 ) ) ( not ( = ?auto_147196 ?auto_147197 ) ) ( not ( = ?auto_147196 ?auto_147199 ) ) ( not ( = ?auto_147198 ?auto_147197 ) ) ( not ( = ?auto_147198 ?auto_147199 ) ) ( not ( = ?auto_147197 ?auto_147199 ) ) ( ON ?auto_147197 ?auto_147198 ) ( CLEAR ?auto_147197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147193 ?auto_147194 ?auto_147195 ?auto_147196 ?auto_147198 )
      ( MAKE-4PILE ?auto_147193 ?auto_147194 ?auto_147195 ?auto_147196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147200 - BLOCK
      ?auto_147201 - BLOCK
      ?auto_147202 - BLOCK
      ?auto_147203 - BLOCK
    )
    :vars
    (
      ?auto_147204 - BLOCK
      ?auto_147206 - BLOCK
      ?auto_147205 - BLOCK
      ?auto_147208 - BLOCK
      ?auto_147207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147204 ?auto_147203 ) ( ON-TABLE ?auto_147200 ) ( ON ?auto_147201 ?auto_147200 ) ( ON ?auto_147202 ?auto_147201 ) ( ON ?auto_147203 ?auto_147202 ) ( not ( = ?auto_147200 ?auto_147201 ) ) ( not ( = ?auto_147200 ?auto_147202 ) ) ( not ( = ?auto_147200 ?auto_147203 ) ) ( not ( = ?auto_147200 ?auto_147204 ) ) ( not ( = ?auto_147201 ?auto_147202 ) ) ( not ( = ?auto_147201 ?auto_147203 ) ) ( not ( = ?auto_147201 ?auto_147204 ) ) ( not ( = ?auto_147202 ?auto_147203 ) ) ( not ( = ?auto_147202 ?auto_147204 ) ) ( not ( = ?auto_147203 ?auto_147204 ) ) ( not ( = ?auto_147200 ?auto_147206 ) ) ( not ( = ?auto_147200 ?auto_147205 ) ) ( not ( = ?auto_147201 ?auto_147206 ) ) ( not ( = ?auto_147201 ?auto_147205 ) ) ( not ( = ?auto_147202 ?auto_147206 ) ) ( not ( = ?auto_147202 ?auto_147205 ) ) ( not ( = ?auto_147203 ?auto_147206 ) ) ( not ( = ?auto_147203 ?auto_147205 ) ) ( not ( = ?auto_147204 ?auto_147206 ) ) ( not ( = ?auto_147204 ?auto_147205 ) ) ( not ( = ?auto_147206 ?auto_147205 ) ) ( ON ?auto_147206 ?auto_147204 ) ( CLEAR ?auto_147206 ) ( HOLDING ?auto_147205 ) ( CLEAR ?auto_147208 ) ( ON-TABLE ?auto_147207 ) ( ON ?auto_147208 ?auto_147207 ) ( not ( = ?auto_147207 ?auto_147208 ) ) ( not ( = ?auto_147207 ?auto_147205 ) ) ( not ( = ?auto_147208 ?auto_147205 ) ) ( not ( = ?auto_147200 ?auto_147208 ) ) ( not ( = ?auto_147200 ?auto_147207 ) ) ( not ( = ?auto_147201 ?auto_147208 ) ) ( not ( = ?auto_147201 ?auto_147207 ) ) ( not ( = ?auto_147202 ?auto_147208 ) ) ( not ( = ?auto_147202 ?auto_147207 ) ) ( not ( = ?auto_147203 ?auto_147208 ) ) ( not ( = ?auto_147203 ?auto_147207 ) ) ( not ( = ?auto_147204 ?auto_147208 ) ) ( not ( = ?auto_147204 ?auto_147207 ) ) ( not ( = ?auto_147206 ?auto_147208 ) ) ( not ( = ?auto_147206 ?auto_147207 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147207 ?auto_147208 ?auto_147205 )
      ( MAKE-4PILE ?auto_147200 ?auto_147201 ?auto_147202 ?auto_147203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147209 - BLOCK
      ?auto_147210 - BLOCK
      ?auto_147211 - BLOCK
      ?auto_147212 - BLOCK
    )
    :vars
    (
      ?auto_147217 - BLOCK
      ?auto_147214 - BLOCK
      ?auto_147216 - BLOCK
      ?auto_147213 - BLOCK
      ?auto_147215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147217 ?auto_147212 ) ( ON-TABLE ?auto_147209 ) ( ON ?auto_147210 ?auto_147209 ) ( ON ?auto_147211 ?auto_147210 ) ( ON ?auto_147212 ?auto_147211 ) ( not ( = ?auto_147209 ?auto_147210 ) ) ( not ( = ?auto_147209 ?auto_147211 ) ) ( not ( = ?auto_147209 ?auto_147212 ) ) ( not ( = ?auto_147209 ?auto_147217 ) ) ( not ( = ?auto_147210 ?auto_147211 ) ) ( not ( = ?auto_147210 ?auto_147212 ) ) ( not ( = ?auto_147210 ?auto_147217 ) ) ( not ( = ?auto_147211 ?auto_147212 ) ) ( not ( = ?auto_147211 ?auto_147217 ) ) ( not ( = ?auto_147212 ?auto_147217 ) ) ( not ( = ?auto_147209 ?auto_147214 ) ) ( not ( = ?auto_147209 ?auto_147216 ) ) ( not ( = ?auto_147210 ?auto_147214 ) ) ( not ( = ?auto_147210 ?auto_147216 ) ) ( not ( = ?auto_147211 ?auto_147214 ) ) ( not ( = ?auto_147211 ?auto_147216 ) ) ( not ( = ?auto_147212 ?auto_147214 ) ) ( not ( = ?auto_147212 ?auto_147216 ) ) ( not ( = ?auto_147217 ?auto_147214 ) ) ( not ( = ?auto_147217 ?auto_147216 ) ) ( not ( = ?auto_147214 ?auto_147216 ) ) ( ON ?auto_147214 ?auto_147217 ) ( CLEAR ?auto_147213 ) ( ON-TABLE ?auto_147215 ) ( ON ?auto_147213 ?auto_147215 ) ( not ( = ?auto_147215 ?auto_147213 ) ) ( not ( = ?auto_147215 ?auto_147216 ) ) ( not ( = ?auto_147213 ?auto_147216 ) ) ( not ( = ?auto_147209 ?auto_147213 ) ) ( not ( = ?auto_147209 ?auto_147215 ) ) ( not ( = ?auto_147210 ?auto_147213 ) ) ( not ( = ?auto_147210 ?auto_147215 ) ) ( not ( = ?auto_147211 ?auto_147213 ) ) ( not ( = ?auto_147211 ?auto_147215 ) ) ( not ( = ?auto_147212 ?auto_147213 ) ) ( not ( = ?auto_147212 ?auto_147215 ) ) ( not ( = ?auto_147217 ?auto_147213 ) ) ( not ( = ?auto_147217 ?auto_147215 ) ) ( not ( = ?auto_147214 ?auto_147213 ) ) ( not ( = ?auto_147214 ?auto_147215 ) ) ( ON ?auto_147216 ?auto_147214 ) ( CLEAR ?auto_147216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147209 ?auto_147210 ?auto_147211 ?auto_147212 ?auto_147217 ?auto_147214 )
      ( MAKE-4PILE ?auto_147209 ?auto_147210 ?auto_147211 ?auto_147212 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147218 - BLOCK
      ?auto_147219 - BLOCK
      ?auto_147220 - BLOCK
      ?auto_147221 - BLOCK
    )
    :vars
    (
      ?auto_147225 - BLOCK
      ?auto_147222 - BLOCK
      ?auto_147226 - BLOCK
      ?auto_147223 - BLOCK
      ?auto_147224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147225 ?auto_147221 ) ( ON-TABLE ?auto_147218 ) ( ON ?auto_147219 ?auto_147218 ) ( ON ?auto_147220 ?auto_147219 ) ( ON ?auto_147221 ?auto_147220 ) ( not ( = ?auto_147218 ?auto_147219 ) ) ( not ( = ?auto_147218 ?auto_147220 ) ) ( not ( = ?auto_147218 ?auto_147221 ) ) ( not ( = ?auto_147218 ?auto_147225 ) ) ( not ( = ?auto_147219 ?auto_147220 ) ) ( not ( = ?auto_147219 ?auto_147221 ) ) ( not ( = ?auto_147219 ?auto_147225 ) ) ( not ( = ?auto_147220 ?auto_147221 ) ) ( not ( = ?auto_147220 ?auto_147225 ) ) ( not ( = ?auto_147221 ?auto_147225 ) ) ( not ( = ?auto_147218 ?auto_147222 ) ) ( not ( = ?auto_147218 ?auto_147226 ) ) ( not ( = ?auto_147219 ?auto_147222 ) ) ( not ( = ?auto_147219 ?auto_147226 ) ) ( not ( = ?auto_147220 ?auto_147222 ) ) ( not ( = ?auto_147220 ?auto_147226 ) ) ( not ( = ?auto_147221 ?auto_147222 ) ) ( not ( = ?auto_147221 ?auto_147226 ) ) ( not ( = ?auto_147225 ?auto_147222 ) ) ( not ( = ?auto_147225 ?auto_147226 ) ) ( not ( = ?auto_147222 ?auto_147226 ) ) ( ON ?auto_147222 ?auto_147225 ) ( ON-TABLE ?auto_147223 ) ( not ( = ?auto_147223 ?auto_147224 ) ) ( not ( = ?auto_147223 ?auto_147226 ) ) ( not ( = ?auto_147224 ?auto_147226 ) ) ( not ( = ?auto_147218 ?auto_147224 ) ) ( not ( = ?auto_147218 ?auto_147223 ) ) ( not ( = ?auto_147219 ?auto_147224 ) ) ( not ( = ?auto_147219 ?auto_147223 ) ) ( not ( = ?auto_147220 ?auto_147224 ) ) ( not ( = ?auto_147220 ?auto_147223 ) ) ( not ( = ?auto_147221 ?auto_147224 ) ) ( not ( = ?auto_147221 ?auto_147223 ) ) ( not ( = ?auto_147225 ?auto_147224 ) ) ( not ( = ?auto_147225 ?auto_147223 ) ) ( not ( = ?auto_147222 ?auto_147224 ) ) ( not ( = ?auto_147222 ?auto_147223 ) ) ( ON ?auto_147226 ?auto_147222 ) ( CLEAR ?auto_147226 ) ( HOLDING ?auto_147224 ) ( CLEAR ?auto_147223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147223 ?auto_147224 )
      ( MAKE-4PILE ?auto_147218 ?auto_147219 ?auto_147220 ?auto_147221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148920 - BLOCK
      ?auto_148921 - BLOCK
      ?auto_148922 - BLOCK
      ?auto_148923 - BLOCK
    )
    :vars
    (
      ?auto_148927 - BLOCK
      ?auto_148925 - BLOCK
      ?auto_148926 - BLOCK
      ?auto_148924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148927 ?auto_148923 ) ( ON-TABLE ?auto_148920 ) ( ON ?auto_148921 ?auto_148920 ) ( ON ?auto_148922 ?auto_148921 ) ( ON ?auto_148923 ?auto_148922 ) ( not ( = ?auto_148920 ?auto_148921 ) ) ( not ( = ?auto_148920 ?auto_148922 ) ) ( not ( = ?auto_148920 ?auto_148923 ) ) ( not ( = ?auto_148920 ?auto_148927 ) ) ( not ( = ?auto_148921 ?auto_148922 ) ) ( not ( = ?auto_148921 ?auto_148923 ) ) ( not ( = ?auto_148921 ?auto_148927 ) ) ( not ( = ?auto_148922 ?auto_148923 ) ) ( not ( = ?auto_148922 ?auto_148927 ) ) ( not ( = ?auto_148923 ?auto_148927 ) ) ( not ( = ?auto_148920 ?auto_148925 ) ) ( not ( = ?auto_148920 ?auto_148926 ) ) ( not ( = ?auto_148921 ?auto_148925 ) ) ( not ( = ?auto_148921 ?auto_148926 ) ) ( not ( = ?auto_148922 ?auto_148925 ) ) ( not ( = ?auto_148922 ?auto_148926 ) ) ( not ( = ?auto_148923 ?auto_148925 ) ) ( not ( = ?auto_148923 ?auto_148926 ) ) ( not ( = ?auto_148927 ?auto_148925 ) ) ( not ( = ?auto_148927 ?auto_148926 ) ) ( not ( = ?auto_148925 ?auto_148926 ) ) ( ON ?auto_148925 ?auto_148927 ) ( not ( = ?auto_148924 ?auto_148926 ) ) ( not ( = ?auto_148920 ?auto_148924 ) ) ( not ( = ?auto_148921 ?auto_148924 ) ) ( not ( = ?auto_148922 ?auto_148924 ) ) ( not ( = ?auto_148923 ?auto_148924 ) ) ( not ( = ?auto_148927 ?auto_148924 ) ) ( not ( = ?auto_148925 ?auto_148924 ) ) ( ON ?auto_148926 ?auto_148925 ) ( ON ?auto_148924 ?auto_148926 ) ( CLEAR ?auto_148924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148920 ?auto_148921 ?auto_148922 ?auto_148923 ?auto_148927 ?auto_148925 ?auto_148926 )
      ( MAKE-4PILE ?auto_148920 ?auto_148921 ?auto_148922 ?auto_148923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147236 - BLOCK
      ?auto_147237 - BLOCK
      ?auto_147238 - BLOCK
      ?auto_147239 - BLOCK
    )
    :vars
    (
      ?auto_147242 - BLOCK
      ?auto_147244 - BLOCK
      ?auto_147243 - BLOCK
      ?auto_147241 - BLOCK
      ?auto_147240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147242 ?auto_147239 ) ( ON-TABLE ?auto_147236 ) ( ON ?auto_147237 ?auto_147236 ) ( ON ?auto_147238 ?auto_147237 ) ( ON ?auto_147239 ?auto_147238 ) ( not ( = ?auto_147236 ?auto_147237 ) ) ( not ( = ?auto_147236 ?auto_147238 ) ) ( not ( = ?auto_147236 ?auto_147239 ) ) ( not ( = ?auto_147236 ?auto_147242 ) ) ( not ( = ?auto_147237 ?auto_147238 ) ) ( not ( = ?auto_147237 ?auto_147239 ) ) ( not ( = ?auto_147237 ?auto_147242 ) ) ( not ( = ?auto_147238 ?auto_147239 ) ) ( not ( = ?auto_147238 ?auto_147242 ) ) ( not ( = ?auto_147239 ?auto_147242 ) ) ( not ( = ?auto_147236 ?auto_147244 ) ) ( not ( = ?auto_147236 ?auto_147243 ) ) ( not ( = ?auto_147237 ?auto_147244 ) ) ( not ( = ?auto_147237 ?auto_147243 ) ) ( not ( = ?auto_147238 ?auto_147244 ) ) ( not ( = ?auto_147238 ?auto_147243 ) ) ( not ( = ?auto_147239 ?auto_147244 ) ) ( not ( = ?auto_147239 ?auto_147243 ) ) ( not ( = ?auto_147242 ?auto_147244 ) ) ( not ( = ?auto_147242 ?auto_147243 ) ) ( not ( = ?auto_147244 ?auto_147243 ) ) ( ON ?auto_147244 ?auto_147242 ) ( not ( = ?auto_147241 ?auto_147240 ) ) ( not ( = ?auto_147241 ?auto_147243 ) ) ( not ( = ?auto_147240 ?auto_147243 ) ) ( not ( = ?auto_147236 ?auto_147240 ) ) ( not ( = ?auto_147236 ?auto_147241 ) ) ( not ( = ?auto_147237 ?auto_147240 ) ) ( not ( = ?auto_147237 ?auto_147241 ) ) ( not ( = ?auto_147238 ?auto_147240 ) ) ( not ( = ?auto_147238 ?auto_147241 ) ) ( not ( = ?auto_147239 ?auto_147240 ) ) ( not ( = ?auto_147239 ?auto_147241 ) ) ( not ( = ?auto_147242 ?auto_147240 ) ) ( not ( = ?auto_147242 ?auto_147241 ) ) ( not ( = ?auto_147244 ?auto_147240 ) ) ( not ( = ?auto_147244 ?auto_147241 ) ) ( ON ?auto_147243 ?auto_147244 ) ( ON ?auto_147240 ?auto_147243 ) ( CLEAR ?auto_147240 ) ( HOLDING ?auto_147241 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147241 )
      ( MAKE-4PILE ?auto_147236 ?auto_147237 ?auto_147238 ?auto_147239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147245 - BLOCK
      ?auto_147246 - BLOCK
      ?auto_147247 - BLOCK
      ?auto_147248 - BLOCK
    )
    :vars
    (
      ?auto_147251 - BLOCK
      ?auto_147252 - BLOCK
      ?auto_147249 - BLOCK
      ?auto_147250 - BLOCK
      ?auto_147253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147251 ?auto_147248 ) ( ON-TABLE ?auto_147245 ) ( ON ?auto_147246 ?auto_147245 ) ( ON ?auto_147247 ?auto_147246 ) ( ON ?auto_147248 ?auto_147247 ) ( not ( = ?auto_147245 ?auto_147246 ) ) ( not ( = ?auto_147245 ?auto_147247 ) ) ( not ( = ?auto_147245 ?auto_147248 ) ) ( not ( = ?auto_147245 ?auto_147251 ) ) ( not ( = ?auto_147246 ?auto_147247 ) ) ( not ( = ?auto_147246 ?auto_147248 ) ) ( not ( = ?auto_147246 ?auto_147251 ) ) ( not ( = ?auto_147247 ?auto_147248 ) ) ( not ( = ?auto_147247 ?auto_147251 ) ) ( not ( = ?auto_147248 ?auto_147251 ) ) ( not ( = ?auto_147245 ?auto_147252 ) ) ( not ( = ?auto_147245 ?auto_147249 ) ) ( not ( = ?auto_147246 ?auto_147252 ) ) ( not ( = ?auto_147246 ?auto_147249 ) ) ( not ( = ?auto_147247 ?auto_147252 ) ) ( not ( = ?auto_147247 ?auto_147249 ) ) ( not ( = ?auto_147248 ?auto_147252 ) ) ( not ( = ?auto_147248 ?auto_147249 ) ) ( not ( = ?auto_147251 ?auto_147252 ) ) ( not ( = ?auto_147251 ?auto_147249 ) ) ( not ( = ?auto_147252 ?auto_147249 ) ) ( ON ?auto_147252 ?auto_147251 ) ( not ( = ?auto_147250 ?auto_147253 ) ) ( not ( = ?auto_147250 ?auto_147249 ) ) ( not ( = ?auto_147253 ?auto_147249 ) ) ( not ( = ?auto_147245 ?auto_147253 ) ) ( not ( = ?auto_147245 ?auto_147250 ) ) ( not ( = ?auto_147246 ?auto_147253 ) ) ( not ( = ?auto_147246 ?auto_147250 ) ) ( not ( = ?auto_147247 ?auto_147253 ) ) ( not ( = ?auto_147247 ?auto_147250 ) ) ( not ( = ?auto_147248 ?auto_147253 ) ) ( not ( = ?auto_147248 ?auto_147250 ) ) ( not ( = ?auto_147251 ?auto_147253 ) ) ( not ( = ?auto_147251 ?auto_147250 ) ) ( not ( = ?auto_147252 ?auto_147253 ) ) ( not ( = ?auto_147252 ?auto_147250 ) ) ( ON ?auto_147249 ?auto_147252 ) ( ON ?auto_147253 ?auto_147249 ) ( ON ?auto_147250 ?auto_147253 ) ( CLEAR ?auto_147250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147245 ?auto_147246 ?auto_147247 ?auto_147248 ?auto_147251 ?auto_147252 ?auto_147249 ?auto_147253 )
      ( MAKE-4PILE ?auto_147245 ?auto_147246 ?auto_147247 ?auto_147248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147259 - BLOCK
      ?auto_147260 - BLOCK
      ?auto_147261 - BLOCK
      ?auto_147262 - BLOCK
      ?auto_147263 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147263 ) ( CLEAR ?auto_147262 ) ( ON-TABLE ?auto_147259 ) ( ON ?auto_147260 ?auto_147259 ) ( ON ?auto_147261 ?auto_147260 ) ( ON ?auto_147262 ?auto_147261 ) ( not ( = ?auto_147259 ?auto_147260 ) ) ( not ( = ?auto_147259 ?auto_147261 ) ) ( not ( = ?auto_147259 ?auto_147262 ) ) ( not ( = ?auto_147259 ?auto_147263 ) ) ( not ( = ?auto_147260 ?auto_147261 ) ) ( not ( = ?auto_147260 ?auto_147262 ) ) ( not ( = ?auto_147260 ?auto_147263 ) ) ( not ( = ?auto_147261 ?auto_147262 ) ) ( not ( = ?auto_147261 ?auto_147263 ) ) ( not ( = ?auto_147262 ?auto_147263 ) ) )
    :subtasks
    ( ( !STACK ?auto_147263 ?auto_147262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147264 - BLOCK
      ?auto_147265 - BLOCK
      ?auto_147266 - BLOCK
      ?auto_147267 - BLOCK
      ?auto_147268 - BLOCK
    )
    :vars
    (
      ?auto_147269 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147267 ) ( ON-TABLE ?auto_147264 ) ( ON ?auto_147265 ?auto_147264 ) ( ON ?auto_147266 ?auto_147265 ) ( ON ?auto_147267 ?auto_147266 ) ( not ( = ?auto_147264 ?auto_147265 ) ) ( not ( = ?auto_147264 ?auto_147266 ) ) ( not ( = ?auto_147264 ?auto_147267 ) ) ( not ( = ?auto_147264 ?auto_147268 ) ) ( not ( = ?auto_147265 ?auto_147266 ) ) ( not ( = ?auto_147265 ?auto_147267 ) ) ( not ( = ?auto_147265 ?auto_147268 ) ) ( not ( = ?auto_147266 ?auto_147267 ) ) ( not ( = ?auto_147266 ?auto_147268 ) ) ( not ( = ?auto_147267 ?auto_147268 ) ) ( ON ?auto_147268 ?auto_147269 ) ( CLEAR ?auto_147268 ) ( HAND-EMPTY ) ( not ( = ?auto_147264 ?auto_147269 ) ) ( not ( = ?auto_147265 ?auto_147269 ) ) ( not ( = ?auto_147266 ?auto_147269 ) ) ( not ( = ?auto_147267 ?auto_147269 ) ) ( not ( = ?auto_147268 ?auto_147269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147268 ?auto_147269 )
      ( MAKE-5PILE ?auto_147264 ?auto_147265 ?auto_147266 ?auto_147267 ?auto_147268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147270 - BLOCK
      ?auto_147271 - BLOCK
      ?auto_147272 - BLOCK
      ?auto_147273 - BLOCK
      ?auto_147274 - BLOCK
    )
    :vars
    (
      ?auto_147275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147270 ) ( ON ?auto_147271 ?auto_147270 ) ( ON ?auto_147272 ?auto_147271 ) ( not ( = ?auto_147270 ?auto_147271 ) ) ( not ( = ?auto_147270 ?auto_147272 ) ) ( not ( = ?auto_147270 ?auto_147273 ) ) ( not ( = ?auto_147270 ?auto_147274 ) ) ( not ( = ?auto_147271 ?auto_147272 ) ) ( not ( = ?auto_147271 ?auto_147273 ) ) ( not ( = ?auto_147271 ?auto_147274 ) ) ( not ( = ?auto_147272 ?auto_147273 ) ) ( not ( = ?auto_147272 ?auto_147274 ) ) ( not ( = ?auto_147273 ?auto_147274 ) ) ( ON ?auto_147274 ?auto_147275 ) ( CLEAR ?auto_147274 ) ( not ( = ?auto_147270 ?auto_147275 ) ) ( not ( = ?auto_147271 ?auto_147275 ) ) ( not ( = ?auto_147272 ?auto_147275 ) ) ( not ( = ?auto_147273 ?auto_147275 ) ) ( not ( = ?auto_147274 ?auto_147275 ) ) ( HOLDING ?auto_147273 ) ( CLEAR ?auto_147272 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147270 ?auto_147271 ?auto_147272 ?auto_147273 )
      ( MAKE-5PILE ?auto_147270 ?auto_147271 ?auto_147272 ?auto_147273 ?auto_147274 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147276 - BLOCK
      ?auto_147277 - BLOCK
      ?auto_147278 - BLOCK
      ?auto_147279 - BLOCK
      ?auto_147280 - BLOCK
    )
    :vars
    (
      ?auto_147281 - BLOCK
      ?auto_147282 - BLOCK
      ?auto_147284 - BLOCK
      ?auto_147283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147276 ) ( ON ?auto_147277 ?auto_147276 ) ( ON ?auto_147278 ?auto_147277 ) ( not ( = ?auto_147276 ?auto_147277 ) ) ( not ( = ?auto_147276 ?auto_147278 ) ) ( not ( = ?auto_147276 ?auto_147279 ) ) ( not ( = ?auto_147276 ?auto_147280 ) ) ( not ( = ?auto_147277 ?auto_147278 ) ) ( not ( = ?auto_147277 ?auto_147279 ) ) ( not ( = ?auto_147277 ?auto_147280 ) ) ( not ( = ?auto_147278 ?auto_147279 ) ) ( not ( = ?auto_147278 ?auto_147280 ) ) ( not ( = ?auto_147279 ?auto_147280 ) ) ( ON ?auto_147280 ?auto_147281 ) ( not ( = ?auto_147276 ?auto_147281 ) ) ( not ( = ?auto_147277 ?auto_147281 ) ) ( not ( = ?auto_147278 ?auto_147281 ) ) ( not ( = ?auto_147279 ?auto_147281 ) ) ( not ( = ?auto_147280 ?auto_147281 ) ) ( CLEAR ?auto_147278 ) ( ON ?auto_147279 ?auto_147280 ) ( CLEAR ?auto_147279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147282 ) ( ON ?auto_147284 ?auto_147282 ) ( ON ?auto_147283 ?auto_147284 ) ( ON ?auto_147281 ?auto_147283 ) ( not ( = ?auto_147282 ?auto_147284 ) ) ( not ( = ?auto_147282 ?auto_147283 ) ) ( not ( = ?auto_147282 ?auto_147281 ) ) ( not ( = ?auto_147282 ?auto_147280 ) ) ( not ( = ?auto_147282 ?auto_147279 ) ) ( not ( = ?auto_147284 ?auto_147283 ) ) ( not ( = ?auto_147284 ?auto_147281 ) ) ( not ( = ?auto_147284 ?auto_147280 ) ) ( not ( = ?auto_147284 ?auto_147279 ) ) ( not ( = ?auto_147283 ?auto_147281 ) ) ( not ( = ?auto_147283 ?auto_147280 ) ) ( not ( = ?auto_147283 ?auto_147279 ) ) ( not ( = ?auto_147276 ?auto_147282 ) ) ( not ( = ?auto_147276 ?auto_147284 ) ) ( not ( = ?auto_147276 ?auto_147283 ) ) ( not ( = ?auto_147277 ?auto_147282 ) ) ( not ( = ?auto_147277 ?auto_147284 ) ) ( not ( = ?auto_147277 ?auto_147283 ) ) ( not ( = ?auto_147278 ?auto_147282 ) ) ( not ( = ?auto_147278 ?auto_147284 ) ) ( not ( = ?auto_147278 ?auto_147283 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147282 ?auto_147284 ?auto_147283 ?auto_147281 ?auto_147280 )
      ( MAKE-5PILE ?auto_147276 ?auto_147277 ?auto_147278 ?auto_147279 ?auto_147280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147285 - BLOCK
      ?auto_147286 - BLOCK
      ?auto_147287 - BLOCK
      ?auto_147288 - BLOCK
      ?auto_147289 - BLOCK
    )
    :vars
    (
      ?auto_147293 - BLOCK
      ?auto_147290 - BLOCK
      ?auto_147292 - BLOCK
      ?auto_147291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147285 ) ( ON ?auto_147286 ?auto_147285 ) ( not ( = ?auto_147285 ?auto_147286 ) ) ( not ( = ?auto_147285 ?auto_147287 ) ) ( not ( = ?auto_147285 ?auto_147288 ) ) ( not ( = ?auto_147285 ?auto_147289 ) ) ( not ( = ?auto_147286 ?auto_147287 ) ) ( not ( = ?auto_147286 ?auto_147288 ) ) ( not ( = ?auto_147286 ?auto_147289 ) ) ( not ( = ?auto_147287 ?auto_147288 ) ) ( not ( = ?auto_147287 ?auto_147289 ) ) ( not ( = ?auto_147288 ?auto_147289 ) ) ( ON ?auto_147289 ?auto_147293 ) ( not ( = ?auto_147285 ?auto_147293 ) ) ( not ( = ?auto_147286 ?auto_147293 ) ) ( not ( = ?auto_147287 ?auto_147293 ) ) ( not ( = ?auto_147288 ?auto_147293 ) ) ( not ( = ?auto_147289 ?auto_147293 ) ) ( ON ?auto_147288 ?auto_147289 ) ( CLEAR ?auto_147288 ) ( ON-TABLE ?auto_147290 ) ( ON ?auto_147292 ?auto_147290 ) ( ON ?auto_147291 ?auto_147292 ) ( ON ?auto_147293 ?auto_147291 ) ( not ( = ?auto_147290 ?auto_147292 ) ) ( not ( = ?auto_147290 ?auto_147291 ) ) ( not ( = ?auto_147290 ?auto_147293 ) ) ( not ( = ?auto_147290 ?auto_147289 ) ) ( not ( = ?auto_147290 ?auto_147288 ) ) ( not ( = ?auto_147292 ?auto_147291 ) ) ( not ( = ?auto_147292 ?auto_147293 ) ) ( not ( = ?auto_147292 ?auto_147289 ) ) ( not ( = ?auto_147292 ?auto_147288 ) ) ( not ( = ?auto_147291 ?auto_147293 ) ) ( not ( = ?auto_147291 ?auto_147289 ) ) ( not ( = ?auto_147291 ?auto_147288 ) ) ( not ( = ?auto_147285 ?auto_147290 ) ) ( not ( = ?auto_147285 ?auto_147292 ) ) ( not ( = ?auto_147285 ?auto_147291 ) ) ( not ( = ?auto_147286 ?auto_147290 ) ) ( not ( = ?auto_147286 ?auto_147292 ) ) ( not ( = ?auto_147286 ?auto_147291 ) ) ( not ( = ?auto_147287 ?auto_147290 ) ) ( not ( = ?auto_147287 ?auto_147292 ) ) ( not ( = ?auto_147287 ?auto_147291 ) ) ( HOLDING ?auto_147287 ) ( CLEAR ?auto_147286 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147285 ?auto_147286 ?auto_147287 )
      ( MAKE-5PILE ?auto_147285 ?auto_147286 ?auto_147287 ?auto_147288 ?auto_147289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147294 - BLOCK
      ?auto_147295 - BLOCK
      ?auto_147296 - BLOCK
      ?auto_147297 - BLOCK
      ?auto_147298 - BLOCK
    )
    :vars
    (
      ?auto_147300 - BLOCK
      ?auto_147301 - BLOCK
      ?auto_147302 - BLOCK
      ?auto_147299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147294 ) ( ON ?auto_147295 ?auto_147294 ) ( not ( = ?auto_147294 ?auto_147295 ) ) ( not ( = ?auto_147294 ?auto_147296 ) ) ( not ( = ?auto_147294 ?auto_147297 ) ) ( not ( = ?auto_147294 ?auto_147298 ) ) ( not ( = ?auto_147295 ?auto_147296 ) ) ( not ( = ?auto_147295 ?auto_147297 ) ) ( not ( = ?auto_147295 ?auto_147298 ) ) ( not ( = ?auto_147296 ?auto_147297 ) ) ( not ( = ?auto_147296 ?auto_147298 ) ) ( not ( = ?auto_147297 ?auto_147298 ) ) ( ON ?auto_147298 ?auto_147300 ) ( not ( = ?auto_147294 ?auto_147300 ) ) ( not ( = ?auto_147295 ?auto_147300 ) ) ( not ( = ?auto_147296 ?auto_147300 ) ) ( not ( = ?auto_147297 ?auto_147300 ) ) ( not ( = ?auto_147298 ?auto_147300 ) ) ( ON ?auto_147297 ?auto_147298 ) ( ON-TABLE ?auto_147301 ) ( ON ?auto_147302 ?auto_147301 ) ( ON ?auto_147299 ?auto_147302 ) ( ON ?auto_147300 ?auto_147299 ) ( not ( = ?auto_147301 ?auto_147302 ) ) ( not ( = ?auto_147301 ?auto_147299 ) ) ( not ( = ?auto_147301 ?auto_147300 ) ) ( not ( = ?auto_147301 ?auto_147298 ) ) ( not ( = ?auto_147301 ?auto_147297 ) ) ( not ( = ?auto_147302 ?auto_147299 ) ) ( not ( = ?auto_147302 ?auto_147300 ) ) ( not ( = ?auto_147302 ?auto_147298 ) ) ( not ( = ?auto_147302 ?auto_147297 ) ) ( not ( = ?auto_147299 ?auto_147300 ) ) ( not ( = ?auto_147299 ?auto_147298 ) ) ( not ( = ?auto_147299 ?auto_147297 ) ) ( not ( = ?auto_147294 ?auto_147301 ) ) ( not ( = ?auto_147294 ?auto_147302 ) ) ( not ( = ?auto_147294 ?auto_147299 ) ) ( not ( = ?auto_147295 ?auto_147301 ) ) ( not ( = ?auto_147295 ?auto_147302 ) ) ( not ( = ?auto_147295 ?auto_147299 ) ) ( not ( = ?auto_147296 ?auto_147301 ) ) ( not ( = ?auto_147296 ?auto_147302 ) ) ( not ( = ?auto_147296 ?auto_147299 ) ) ( CLEAR ?auto_147295 ) ( ON ?auto_147296 ?auto_147297 ) ( CLEAR ?auto_147296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147301 ?auto_147302 ?auto_147299 ?auto_147300 ?auto_147298 ?auto_147297 )
      ( MAKE-5PILE ?auto_147294 ?auto_147295 ?auto_147296 ?auto_147297 ?auto_147298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147303 - BLOCK
      ?auto_147304 - BLOCK
      ?auto_147305 - BLOCK
      ?auto_147306 - BLOCK
      ?auto_147307 - BLOCK
    )
    :vars
    (
      ?auto_147308 - BLOCK
      ?auto_147309 - BLOCK
      ?auto_147311 - BLOCK
      ?auto_147310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147303 ) ( not ( = ?auto_147303 ?auto_147304 ) ) ( not ( = ?auto_147303 ?auto_147305 ) ) ( not ( = ?auto_147303 ?auto_147306 ) ) ( not ( = ?auto_147303 ?auto_147307 ) ) ( not ( = ?auto_147304 ?auto_147305 ) ) ( not ( = ?auto_147304 ?auto_147306 ) ) ( not ( = ?auto_147304 ?auto_147307 ) ) ( not ( = ?auto_147305 ?auto_147306 ) ) ( not ( = ?auto_147305 ?auto_147307 ) ) ( not ( = ?auto_147306 ?auto_147307 ) ) ( ON ?auto_147307 ?auto_147308 ) ( not ( = ?auto_147303 ?auto_147308 ) ) ( not ( = ?auto_147304 ?auto_147308 ) ) ( not ( = ?auto_147305 ?auto_147308 ) ) ( not ( = ?auto_147306 ?auto_147308 ) ) ( not ( = ?auto_147307 ?auto_147308 ) ) ( ON ?auto_147306 ?auto_147307 ) ( ON-TABLE ?auto_147309 ) ( ON ?auto_147311 ?auto_147309 ) ( ON ?auto_147310 ?auto_147311 ) ( ON ?auto_147308 ?auto_147310 ) ( not ( = ?auto_147309 ?auto_147311 ) ) ( not ( = ?auto_147309 ?auto_147310 ) ) ( not ( = ?auto_147309 ?auto_147308 ) ) ( not ( = ?auto_147309 ?auto_147307 ) ) ( not ( = ?auto_147309 ?auto_147306 ) ) ( not ( = ?auto_147311 ?auto_147310 ) ) ( not ( = ?auto_147311 ?auto_147308 ) ) ( not ( = ?auto_147311 ?auto_147307 ) ) ( not ( = ?auto_147311 ?auto_147306 ) ) ( not ( = ?auto_147310 ?auto_147308 ) ) ( not ( = ?auto_147310 ?auto_147307 ) ) ( not ( = ?auto_147310 ?auto_147306 ) ) ( not ( = ?auto_147303 ?auto_147309 ) ) ( not ( = ?auto_147303 ?auto_147311 ) ) ( not ( = ?auto_147303 ?auto_147310 ) ) ( not ( = ?auto_147304 ?auto_147309 ) ) ( not ( = ?auto_147304 ?auto_147311 ) ) ( not ( = ?auto_147304 ?auto_147310 ) ) ( not ( = ?auto_147305 ?auto_147309 ) ) ( not ( = ?auto_147305 ?auto_147311 ) ) ( not ( = ?auto_147305 ?auto_147310 ) ) ( ON ?auto_147305 ?auto_147306 ) ( CLEAR ?auto_147305 ) ( HOLDING ?auto_147304 ) ( CLEAR ?auto_147303 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147303 ?auto_147304 )
      ( MAKE-5PILE ?auto_147303 ?auto_147304 ?auto_147305 ?auto_147306 ?auto_147307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147312 - BLOCK
      ?auto_147313 - BLOCK
      ?auto_147314 - BLOCK
      ?auto_147315 - BLOCK
      ?auto_147316 - BLOCK
    )
    :vars
    (
      ?auto_147317 - BLOCK
      ?auto_147318 - BLOCK
      ?auto_147319 - BLOCK
      ?auto_147320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147312 ) ( not ( = ?auto_147312 ?auto_147313 ) ) ( not ( = ?auto_147312 ?auto_147314 ) ) ( not ( = ?auto_147312 ?auto_147315 ) ) ( not ( = ?auto_147312 ?auto_147316 ) ) ( not ( = ?auto_147313 ?auto_147314 ) ) ( not ( = ?auto_147313 ?auto_147315 ) ) ( not ( = ?auto_147313 ?auto_147316 ) ) ( not ( = ?auto_147314 ?auto_147315 ) ) ( not ( = ?auto_147314 ?auto_147316 ) ) ( not ( = ?auto_147315 ?auto_147316 ) ) ( ON ?auto_147316 ?auto_147317 ) ( not ( = ?auto_147312 ?auto_147317 ) ) ( not ( = ?auto_147313 ?auto_147317 ) ) ( not ( = ?auto_147314 ?auto_147317 ) ) ( not ( = ?auto_147315 ?auto_147317 ) ) ( not ( = ?auto_147316 ?auto_147317 ) ) ( ON ?auto_147315 ?auto_147316 ) ( ON-TABLE ?auto_147318 ) ( ON ?auto_147319 ?auto_147318 ) ( ON ?auto_147320 ?auto_147319 ) ( ON ?auto_147317 ?auto_147320 ) ( not ( = ?auto_147318 ?auto_147319 ) ) ( not ( = ?auto_147318 ?auto_147320 ) ) ( not ( = ?auto_147318 ?auto_147317 ) ) ( not ( = ?auto_147318 ?auto_147316 ) ) ( not ( = ?auto_147318 ?auto_147315 ) ) ( not ( = ?auto_147319 ?auto_147320 ) ) ( not ( = ?auto_147319 ?auto_147317 ) ) ( not ( = ?auto_147319 ?auto_147316 ) ) ( not ( = ?auto_147319 ?auto_147315 ) ) ( not ( = ?auto_147320 ?auto_147317 ) ) ( not ( = ?auto_147320 ?auto_147316 ) ) ( not ( = ?auto_147320 ?auto_147315 ) ) ( not ( = ?auto_147312 ?auto_147318 ) ) ( not ( = ?auto_147312 ?auto_147319 ) ) ( not ( = ?auto_147312 ?auto_147320 ) ) ( not ( = ?auto_147313 ?auto_147318 ) ) ( not ( = ?auto_147313 ?auto_147319 ) ) ( not ( = ?auto_147313 ?auto_147320 ) ) ( not ( = ?auto_147314 ?auto_147318 ) ) ( not ( = ?auto_147314 ?auto_147319 ) ) ( not ( = ?auto_147314 ?auto_147320 ) ) ( ON ?auto_147314 ?auto_147315 ) ( CLEAR ?auto_147312 ) ( ON ?auto_147313 ?auto_147314 ) ( CLEAR ?auto_147313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147318 ?auto_147319 ?auto_147320 ?auto_147317 ?auto_147316 ?auto_147315 ?auto_147314 )
      ( MAKE-5PILE ?auto_147312 ?auto_147313 ?auto_147314 ?auto_147315 ?auto_147316 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147321 - BLOCK
      ?auto_147322 - BLOCK
      ?auto_147323 - BLOCK
      ?auto_147324 - BLOCK
      ?auto_147325 - BLOCK
    )
    :vars
    (
      ?auto_147328 - BLOCK
      ?auto_147326 - BLOCK
      ?auto_147329 - BLOCK
      ?auto_147327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147321 ?auto_147322 ) ) ( not ( = ?auto_147321 ?auto_147323 ) ) ( not ( = ?auto_147321 ?auto_147324 ) ) ( not ( = ?auto_147321 ?auto_147325 ) ) ( not ( = ?auto_147322 ?auto_147323 ) ) ( not ( = ?auto_147322 ?auto_147324 ) ) ( not ( = ?auto_147322 ?auto_147325 ) ) ( not ( = ?auto_147323 ?auto_147324 ) ) ( not ( = ?auto_147323 ?auto_147325 ) ) ( not ( = ?auto_147324 ?auto_147325 ) ) ( ON ?auto_147325 ?auto_147328 ) ( not ( = ?auto_147321 ?auto_147328 ) ) ( not ( = ?auto_147322 ?auto_147328 ) ) ( not ( = ?auto_147323 ?auto_147328 ) ) ( not ( = ?auto_147324 ?auto_147328 ) ) ( not ( = ?auto_147325 ?auto_147328 ) ) ( ON ?auto_147324 ?auto_147325 ) ( ON-TABLE ?auto_147326 ) ( ON ?auto_147329 ?auto_147326 ) ( ON ?auto_147327 ?auto_147329 ) ( ON ?auto_147328 ?auto_147327 ) ( not ( = ?auto_147326 ?auto_147329 ) ) ( not ( = ?auto_147326 ?auto_147327 ) ) ( not ( = ?auto_147326 ?auto_147328 ) ) ( not ( = ?auto_147326 ?auto_147325 ) ) ( not ( = ?auto_147326 ?auto_147324 ) ) ( not ( = ?auto_147329 ?auto_147327 ) ) ( not ( = ?auto_147329 ?auto_147328 ) ) ( not ( = ?auto_147329 ?auto_147325 ) ) ( not ( = ?auto_147329 ?auto_147324 ) ) ( not ( = ?auto_147327 ?auto_147328 ) ) ( not ( = ?auto_147327 ?auto_147325 ) ) ( not ( = ?auto_147327 ?auto_147324 ) ) ( not ( = ?auto_147321 ?auto_147326 ) ) ( not ( = ?auto_147321 ?auto_147329 ) ) ( not ( = ?auto_147321 ?auto_147327 ) ) ( not ( = ?auto_147322 ?auto_147326 ) ) ( not ( = ?auto_147322 ?auto_147329 ) ) ( not ( = ?auto_147322 ?auto_147327 ) ) ( not ( = ?auto_147323 ?auto_147326 ) ) ( not ( = ?auto_147323 ?auto_147329 ) ) ( not ( = ?auto_147323 ?auto_147327 ) ) ( ON ?auto_147323 ?auto_147324 ) ( ON ?auto_147322 ?auto_147323 ) ( CLEAR ?auto_147322 ) ( HOLDING ?auto_147321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147321 )
      ( MAKE-5PILE ?auto_147321 ?auto_147322 ?auto_147323 ?auto_147324 ?auto_147325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147330 - BLOCK
      ?auto_147331 - BLOCK
      ?auto_147332 - BLOCK
      ?auto_147333 - BLOCK
      ?auto_147334 - BLOCK
    )
    :vars
    (
      ?auto_147338 - BLOCK
      ?auto_147337 - BLOCK
      ?auto_147335 - BLOCK
      ?auto_147336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147330 ?auto_147331 ) ) ( not ( = ?auto_147330 ?auto_147332 ) ) ( not ( = ?auto_147330 ?auto_147333 ) ) ( not ( = ?auto_147330 ?auto_147334 ) ) ( not ( = ?auto_147331 ?auto_147332 ) ) ( not ( = ?auto_147331 ?auto_147333 ) ) ( not ( = ?auto_147331 ?auto_147334 ) ) ( not ( = ?auto_147332 ?auto_147333 ) ) ( not ( = ?auto_147332 ?auto_147334 ) ) ( not ( = ?auto_147333 ?auto_147334 ) ) ( ON ?auto_147334 ?auto_147338 ) ( not ( = ?auto_147330 ?auto_147338 ) ) ( not ( = ?auto_147331 ?auto_147338 ) ) ( not ( = ?auto_147332 ?auto_147338 ) ) ( not ( = ?auto_147333 ?auto_147338 ) ) ( not ( = ?auto_147334 ?auto_147338 ) ) ( ON ?auto_147333 ?auto_147334 ) ( ON-TABLE ?auto_147337 ) ( ON ?auto_147335 ?auto_147337 ) ( ON ?auto_147336 ?auto_147335 ) ( ON ?auto_147338 ?auto_147336 ) ( not ( = ?auto_147337 ?auto_147335 ) ) ( not ( = ?auto_147337 ?auto_147336 ) ) ( not ( = ?auto_147337 ?auto_147338 ) ) ( not ( = ?auto_147337 ?auto_147334 ) ) ( not ( = ?auto_147337 ?auto_147333 ) ) ( not ( = ?auto_147335 ?auto_147336 ) ) ( not ( = ?auto_147335 ?auto_147338 ) ) ( not ( = ?auto_147335 ?auto_147334 ) ) ( not ( = ?auto_147335 ?auto_147333 ) ) ( not ( = ?auto_147336 ?auto_147338 ) ) ( not ( = ?auto_147336 ?auto_147334 ) ) ( not ( = ?auto_147336 ?auto_147333 ) ) ( not ( = ?auto_147330 ?auto_147337 ) ) ( not ( = ?auto_147330 ?auto_147335 ) ) ( not ( = ?auto_147330 ?auto_147336 ) ) ( not ( = ?auto_147331 ?auto_147337 ) ) ( not ( = ?auto_147331 ?auto_147335 ) ) ( not ( = ?auto_147331 ?auto_147336 ) ) ( not ( = ?auto_147332 ?auto_147337 ) ) ( not ( = ?auto_147332 ?auto_147335 ) ) ( not ( = ?auto_147332 ?auto_147336 ) ) ( ON ?auto_147332 ?auto_147333 ) ( ON ?auto_147331 ?auto_147332 ) ( ON ?auto_147330 ?auto_147331 ) ( CLEAR ?auto_147330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147337 ?auto_147335 ?auto_147336 ?auto_147338 ?auto_147334 ?auto_147333 ?auto_147332 ?auto_147331 )
      ( MAKE-5PILE ?auto_147330 ?auto_147331 ?auto_147332 ?auto_147333 ?auto_147334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147342 - BLOCK
      ?auto_147343 - BLOCK
      ?auto_147344 - BLOCK
    )
    :vars
    (
      ?auto_147345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147345 ?auto_147344 ) ( CLEAR ?auto_147345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147342 ) ( ON ?auto_147343 ?auto_147342 ) ( ON ?auto_147344 ?auto_147343 ) ( not ( = ?auto_147342 ?auto_147343 ) ) ( not ( = ?auto_147342 ?auto_147344 ) ) ( not ( = ?auto_147342 ?auto_147345 ) ) ( not ( = ?auto_147343 ?auto_147344 ) ) ( not ( = ?auto_147343 ?auto_147345 ) ) ( not ( = ?auto_147344 ?auto_147345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147345 ?auto_147344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147346 - BLOCK
      ?auto_147347 - BLOCK
      ?auto_147348 - BLOCK
    )
    :vars
    (
      ?auto_147349 - BLOCK
      ?auto_147350 - BLOCK
      ?auto_147351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147349 ?auto_147348 ) ( CLEAR ?auto_147349 ) ( ON-TABLE ?auto_147346 ) ( ON ?auto_147347 ?auto_147346 ) ( ON ?auto_147348 ?auto_147347 ) ( not ( = ?auto_147346 ?auto_147347 ) ) ( not ( = ?auto_147346 ?auto_147348 ) ) ( not ( = ?auto_147346 ?auto_147349 ) ) ( not ( = ?auto_147347 ?auto_147348 ) ) ( not ( = ?auto_147347 ?auto_147349 ) ) ( not ( = ?auto_147348 ?auto_147349 ) ) ( HOLDING ?auto_147350 ) ( CLEAR ?auto_147351 ) ( not ( = ?auto_147346 ?auto_147350 ) ) ( not ( = ?auto_147346 ?auto_147351 ) ) ( not ( = ?auto_147347 ?auto_147350 ) ) ( not ( = ?auto_147347 ?auto_147351 ) ) ( not ( = ?auto_147348 ?auto_147350 ) ) ( not ( = ?auto_147348 ?auto_147351 ) ) ( not ( = ?auto_147349 ?auto_147350 ) ) ( not ( = ?auto_147349 ?auto_147351 ) ) ( not ( = ?auto_147350 ?auto_147351 ) ) )
    :subtasks
    ( ( !STACK ?auto_147350 ?auto_147351 )
      ( MAKE-3PILE ?auto_147346 ?auto_147347 ?auto_147348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147352 - BLOCK
      ?auto_147353 - BLOCK
      ?auto_147354 - BLOCK
    )
    :vars
    (
      ?auto_147356 - BLOCK
      ?auto_147355 - BLOCK
      ?auto_147357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147356 ?auto_147354 ) ( ON-TABLE ?auto_147352 ) ( ON ?auto_147353 ?auto_147352 ) ( ON ?auto_147354 ?auto_147353 ) ( not ( = ?auto_147352 ?auto_147353 ) ) ( not ( = ?auto_147352 ?auto_147354 ) ) ( not ( = ?auto_147352 ?auto_147356 ) ) ( not ( = ?auto_147353 ?auto_147354 ) ) ( not ( = ?auto_147353 ?auto_147356 ) ) ( not ( = ?auto_147354 ?auto_147356 ) ) ( CLEAR ?auto_147355 ) ( not ( = ?auto_147352 ?auto_147357 ) ) ( not ( = ?auto_147352 ?auto_147355 ) ) ( not ( = ?auto_147353 ?auto_147357 ) ) ( not ( = ?auto_147353 ?auto_147355 ) ) ( not ( = ?auto_147354 ?auto_147357 ) ) ( not ( = ?auto_147354 ?auto_147355 ) ) ( not ( = ?auto_147356 ?auto_147357 ) ) ( not ( = ?auto_147356 ?auto_147355 ) ) ( not ( = ?auto_147357 ?auto_147355 ) ) ( ON ?auto_147357 ?auto_147356 ) ( CLEAR ?auto_147357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147352 ?auto_147353 ?auto_147354 ?auto_147356 )
      ( MAKE-3PILE ?auto_147352 ?auto_147353 ?auto_147354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147358 - BLOCK
      ?auto_147359 - BLOCK
      ?auto_147360 - BLOCK
    )
    :vars
    (
      ?auto_147361 - BLOCK
      ?auto_147362 - BLOCK
      ?auto_147363 - BLOCK
      ?auto_147365 - BLOCK
      ?auto_147366 - BLOCK
      ?auto_147364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147361 ?auto_147360 ) ( ON-TABLE ?auto_147358 ) ( ON ?auto_147359 ?auto_147358 ) ( ON ?auto_147360 ?auto_147359 ) ( not ( = ?auto_147358 ?auto_147359 ) ) ( not ( = ?auto_147358 ?auto_147360 ) ) ( not ( = ?auto_147358 ?auto_147361 ) ) ( not ( = ?auto_147359 ?auto_147360 ) ) ( not ( = ?auto_147359 ?auto_147361 ) ) ( not ( = ?auto_147360 ?auto_147361 ) ) ( not ( = ?auto_147358 ?auto_147362 ) ) ( not ( = ?auto_147358 ?auto_147363 ) ) ( not ( = ?auto_147359 ?auto_147362 ) ) ( not ( = ?auto_147359 ?auto_147363 ) ) ( not ( = ?auto_147360 ?auto_147362 ) ) ( not ( = ?auto_147360 ?auto_147363 ) ) ( not ( = ?auto_147361 ?auto_147362 ) ) ( not ( = ?auto_147361 ?auto_147363 ) ) ( not ( = ?auto_147362 ?auto_147363 ) ) ( ON ?auto_147362 ?auto_147361 ) ( CLEAR ?auto_147362 ) ( HOLDING ?auto_147363 ) ( CLEAR ?auto_147365 ) ( ON-TABLE ?auto_147366 ) ( ON ?auto_147364 ?auto_147366 ) ( ON ?auto_147365 ?auto_147364 ) ( not ( = ?auto_147366 ?auto_147364 ) ) ( not ( = ?auto_147366 ?auto_147365 ) ) ( not ( = ?auto_147366 ?auto_147363 ) ) ( not ( = ?auto_147364 ?auto_147365 ) ) ( not ( = ?auto_147364 ?auto_147363 ) ) ( not ( = ?auto_147365 ?auto_147363 ) ) ( not ( = ?auto_147358 ?auto_147365 ) ) ( not ( = ?auto_147358 ?auto_147366 ) ) ( not ( = ?auto_147358 ?auto_147364 ) ) ( not ( = ?auto_147359 ?auto_147365 ) ) ( not ( = ?auto_147359 ?auto_147366 ) ) ( not ( = ?auto_147359 ?auto_147364 ) ) ( not ( = ?auto_147360 ?auto_147365 ) ) ( not ( = ?auto_147360 ?auto_147366 ) ) ( not ( = ?auto_147360 ?auto_147364 ) ) ( not ( = ?auto_147361 ?auto_147365 ) ) ( not ( = ?auto_147361 ?auto_147366 ) ) ( not ( = ?auto_147361 ?auto_147364 ) ) ( not ( = ?auto_147362 ?auto_147365 ) ) ( not ( = ?auto_147362 ?auto_147366 ) ) ( not ( = ?auto_147362 ?auto_147364 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147366 ?auto_147364 ?auto_147365 ?auto_147363 )
      ( MAKE-3PILE ?auto_147358 ?auto_147359 ?auto_147360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147367 - BLOCK
      ?auto_147368 - BLOCK
      ?auto_147369 - BLOCK
    )
    :vars
    (
      ?auto_147371 - BLOCK
      ?auto_147373 - BLOCK
      ?auto_147370 - BLOCK
      ?auto_147374 - BLOCK
      ?auto_147372 - BLOCK
      ?auto_147375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147371 ?auto_147369 ) ( ON-TABLE ?auto_147367 ) ( ON ?auto_147368 ?auto_147367 ) ( ON ?auto_147369 ?auto_147368 ) ( not ( = ?auto_147367 ?auto_147368 ) ) ( not ( = ?auto_147367 ?auto_147369 ) ) ( not ( = ?auto_147367 ?auto_147371 ) ) ( not ( = ?auto_147368 ?auto_147369 ) ) ( not ( = ?auto_147368 ?auto_147371 ) ) ( not ( = ?auto_147369 ?auto_147371 ) ) ( not ( = ?auto_147367 ?auto_147373 ) ) ( not ( = ?auto_147367 ?auto_147370 ) ) ( not ( = ?auto_147368 ?auto_147373 ) ) ( not ( = ?auto_147368 ?auto_147370 ) ) ( not ( = ?auto_147369 ?auto_147373 ) ) ( not ( = ?auto_147369 ?auto_147370 ) ) ( not ( = ?auto_147371 ?auto_147373 ) ) ( not ( = ?auto_147371 ?auto_147370 ) ) ( not ( = ?auto_147373 ?auto_147370 ) ) ( ON ?auto_147373 ?auto_147371 ) ( CLEAR ?auto_147374 ) ( ON-TABLE ?auto_147372 ) ( ON ?auto_147375 ?auto_147372 ) ( ON ?auto_147374 ?auto_147375 ) ( not ( = ?auto_147372 ?auto_147375 ) ) ( not ( = ?auto_147372 ?auto_147374 ) ) ( not ( = ?auto_147372 ?auto_147370 ) ) ( not ( = ?auto_147375 ?auto_147374 ) ) ( not ( = ?auto_147375 ?auto_147370 ) ) ( not ( = ?auto_147374 ?auto_147370 ) ) ( not ( = ?auto_147367 ?auto_147374 ) ) ( not ( = ?auto_147367 ?auto_147372 ) ) ( not ( = ?auto_147367 ?auto_147375 ) ) ( not ( = ?auto_147368 ?auto_147374 ) ) ( not ( = ?auto_147368 ?auto_147372 ) ) ( not ( = ?auto_147368 ?auto_147375 ) ) ( not ( = ?auto_147369 ?auto_147374 ) ) ( not ( = ?auto_147369 ?auto_147372 ) ) ( not ( = ?auto_147369 ?auto_147375 ) ) ( not ( = ?auto_147371 ?auto_147374 ) ) ( not ( = ?auto_147371 ?auto_147372 ) ) ( not ( = ?auto_147371 ?auto_147375 ) ) ( not ( = ?auto_147373 ?auto_147374 ) ) ( not ( = ?auto_147373 ?auto_147372 ) ) ( not ( = ?auto_147373 ?auto_147375 ) ) ( ON ?auto_147370 ?auto_147373 ) ( CLEAR ?auto_147370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147367 ?auto_147368 ?auto_147369 ?auto_147371 ?auto_147373 )
      ( MAKE-3PILE ?auto_147367 ?auto_147368 ?auto_147369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147376 - BLOCK
      ?auto_147377 - BLOCK
      ?auto_147378 - BLOCK
    )
    :vars
    (
      ?auto_147381 - BLOCK
      ?auto_147383 - BLOCK
      ?auto_147380 - BLOCK
      ?auto_147379 - BLOCK
      ?auto_147384 - BLOCK
      ?auto_147382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147381 ?auto_147378 ) ( ON-TABLE ?auto_147376 ) ( ON ?auto_147377 ?auto_147376 ) ( ON ?auto_147378 ?auto_147377 ) ( not ( = ?auto_147376 ?auto_147377 ) ) ( not ( = ?auto_147376 ?auto_147378 ) ) ( not ( = ?auto_147376 ?auto_147381 ) ) ( not ( = ?auto_147377 ?auto_147378 ) ) ( not ( = ?auto_147377 ?auto_147381 ) ) ( not ( = ?auto_147378 ?auto_147381 ) ) ( not ( = ?auto_147376 ?auto_147383 ) ) ( not ( = ?auto_147376 ?auto_147380 ) ) ( not ( = ?auto_147377 ?auto_147383 ) ) ( not ( = ?auto_147377 ?auto_147380 ) ) ( not ( = ?auto_147378 ?auto_147383 ) ) ( not ( = ?auto_147378 ?auto_147380 ) ) ( not ( = ?auto_147381 ?auto_147383 ) ) ( not ( = ?auto_147381 ?auto_147380 ) ) ( not ( = ?auto_147383 ?auto_147380 ) ) ( ON ?auto_147383 ?auto_147381 ) ( ON-TABLE ?auto_147379 ) ( ON ?auto_147384 ?auto_147379 ) ( not ( = ?auto_147379 ?auto_147384 ) ) ( not ( = ?auto_147379 ?auto_147382 ) ) ( not ( = ?auto_147379 ?auto_147380 ) ) ( not ( = ?auto_147384 ?auto_147382 ) ) ( not ( = ?auto_147384 ?auto_147380 ) ) ( not ( = ?auto_147382 ?auto_147380 ) ) ( not ( = ?auto_147376 ?auto_147382 ) ) ( not ( = ?auto_147376 ?auto_147379 ) ) ( not ( = ?auto_147376 ?auto_147384 ) ) ( not ( = ?auto_147377 ?auto_147382 ) ) ( not ( = ?auto_147377 ?auto_147379 ) ) ( not ( = ?auto_147377 ?auto_147384 ) ) ( not ( = ?auto_147378 ?auto_147382 ) ) ( not ( = ?auto_147378 ?auto_147379 ) ) ( not ( = ?auto_147378 ?auto_147384 ) ) ( not ( = ?auto_147381 ?auto_147382 ) ) ( not ( = ?auto_147381 ?auto_147379 ) ) ( not ( = ?auto_147381 ?auto_147384 ) ) ( not ( = ?auto_147383 ?auto_147382 ) ) ( not ( = ?auto_147383 ?auto_147379 ) ) ( not ( = ?auto_147383 ?auto_147384 ) ) ( ON ?auto_147380 ?auto_147383 ) ( CLEAR ?auto_147380 ) ( HOLDING ?auto_147382 ) ( CLEAR ?auto_147384 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147379 ?auto_147384 ?auto_147382 )
      ( MAKE-3PILE ?auto_147376 ?auto_147377 ?auto_147378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147385 - BLOCK
      ?auto_147386 - BLOCK
      ?auto_147387 - BLOCK
    )
    :vars
    (
      ?auto_147393 - BLOCK
      ?auto_147388 - BLOCK
      ?auto_147389 - BLOCK
      ?auto_147392 - BLOCK
      ?auto_147390 - BLOCK
      ?auto_147391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147393 ?auto_147387 ) ( ON-TABLE ?auto_147385 ) ( ON ?auto_147386 ?auto_147385 ) ( ON ?auto_147387 ?auto_147386 ) ( not ( = ?auto_147385 ?auto_147386 ) ) ( not ( = ?auto_147385 ?auto_147387 ) ) ( not ( = ?auto_147385 ?auto_147393 ) ) ( not ( = ?auto_147386 ?auto_147387 ) ) ( not ( = ?auto_147386 ?auto_147393 ) ) ( not ( = ?auto_147387 ?auto_147393 ) ) ( not ( = ?auto_147385 ?auto_147388 ) ) ( not ( = ?auto_147385 ?auto_147389 ) ) ( not ( = ?auto_147386 ?auto_147388 ) ) ( not ( = ?auto_147386 ?auto_147389 ) ) ( not ( = ?auto_147387 ?auto_147388 ) ) ( not ( = ?auto_147387 ?auto_147389 ) ) ( not ( = ?auto_147393 ?auto_147388 ) ) ( not ( = ?auto_147393 ?auto_147389 ) ) ( not ( = ?auto_147388 ?auto_147389 ) ) ( ON ?auto_147388 ?auto_147393 ) ( ON-TABLE ?auto_147392 ) ( ON ?auto_147390 ?auto_147392 ) ( not ( = ?auto_147392 ?auto_147390 ) ) ( not ( = ?auto_147392 ?auto_147391 ) ) ( not ( = ?auto_147392 ?auto_147389 ) ) ( not ( = ?auto_147390 ?auto_147391 ) ) ( not ( = ?auto_147390 ?auto_147389 ) ) ( not ( = ?auto_147391 ?auto_147389 ) ) ( not ( = ?auto_147385 ?auto_147391 ) ) ( not ( = ?auto_147385 ?auto_147392 ) ) ( not ( = ?auto_147385 ?auto_147390 ) ) ( not ( = ?auto_147386 ?auto_147391 ) ) ( not ( = ?auto_147386 ?auto_147392 ) ) ( not ( = ?auto_147386 ?auto_147390 ) ) ( not ( = ?auto_147387 ?auto_147391 ) ) ( not ( = ?auto_147387 ?auto_147392 ) ) ( not ( = ?auto_147387 ?auto_147390 ) ) ( not ( = ?auto_147393 ?auto_147391 ) ) ( not ( = ?auto_147393 ?auto_147392 ) ) ( not ( = ?auto_147393 ?auto_147390 ) ) ( not ( = ?auto_147388 ?auto_147391 ) ) ( not ( = ?auto_147388 ?auto_147392 ) ) ( not ( = ?auto_147388 ?auto_147390 ) ) ( ON ?auto_147389 ?auto_147388 ) ( CLEAR ?auto_147390 ) ( ON ?auto_147391 ?auto_147389 ) ( CLEAR ?auto_147391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147385 ?auto_147386 ?auto_147387 ?auto_147393 ?auto_147388 ?auto_147389 )
      ( MAKE-3PILE ?auto_147385 ?auto_147386 ?auto_147387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147394 - BLOCK
      ?auto_147395 - BLOCK
      ?auto_147396 - BLOCK
    )
    :vars
    (
      ?auto_147399 - BLOCK
      ?auto_147397 - BLOCK
      ?auto_147401 - BLOCK
      ?auto_147400 - BLOCK
      ?auto_147398 - BLOCK
      ?auto_147402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147399 ?auto_147396 ) ( ON-TABLE ?auto_147394 ) ( ON ?auto_147395 ?auto_147394 ) ( ON ?auto_147396 ?auto_147395 ) ( not ( = ?auto_147394 ?auto_147395 ) ) ( not ( = ?auto_147394 ?auto_147396 ) ) ( not ( = ?auto_147394 ?auto_147399 ) ) ( not ( = ?auto_147395 ?auto_147396 ) ) ( not ( = ?auto_147395 ?auto_147399 ) ) ( not ( = ?auto_147396 ?auto_147399 ) ) ( not ( = ?auto_147394 ?auto_147397 ) ) ( not ( = ?auto_147394 ?auto_147401 ) ) ( not ( = ?auto_147395 ?auto_147397 ) ) ( not ( = ?auto_147395 ?auto_147401 ) ) ( not ( = ?auto_147396 ?auto_147397 ) ) ( not ( = ?auto_147396 ?auto_147401 ) ) ( not ( = ?auto_147399 ?auto_147397 ) ) ( not ( = ?auto_147399 ?auto_147401 ) ) ( not ( = ?auto_147397 ?auto_147401 ) ) ( ON ?auto_147397 ?auto_147399 ) ( ON-TABLE ?auto_147400 ) ( not ( = ?auto_147400 ?auto_147398 ) ) ( not ( = ?auto_147400 ?auto_147402 ) ) ( not ( = ?auto_147400 ?auto_147401 ) ) ( not ( = ?auto_147398 ?auto_147402 ) ) ( not ( = ?auto_147398 ?auto_147401 ) ) ( not ( = ?auto_147402 ?auto_147401 ) ) ( not ( = ?auto_147394 ?auto_147402 ) ) ( not ( = ?auto_147394 ?auto_147400 ) ) ( not ( = ?auto_147394 ?auto_147398 ) ) ( not ( = ?auto_147395 ?auto_147402 ) ) ( not ( = ?auto_147395 ?auto_147400 ) ) ( not ( = ?auto_147395 ?auto_147398 ) ) ( not ( = ?auto_147396 ?auto_147402 ) ) ( not ( = ?auto_147396 ?auto_147400 ) ) ( not ( = ?auto_147396 ?auto_147398 ) ) ( not ( = ?auto_147399 ?auto_147402 ) ) ( not ( = ?auto_147399 ?auto_147400 ) ) ( not ( = ?auto_147399 ?auto_147398 ) ) ( not ( = ?auto_147397 ?auto_147402 ) ) ( not ( = ?auto_147397 ?auto_147400 ) ) ( not ( = ?auto_147397 ?auto_147398 ) ) ( ON ?auto_147401 ?auto_147397 ) ( ON ?auto_147402 ?auto_147401 ) ( CLEAR ?auto_147402 ) ( HOLDING ?auto_147398 ) ( CLEAR ?auto_147400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147400 ?auto_147398 )
      ( MAKE-3PILE ?auto_147394 ?auto_147395 ?auto_147396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149261 - BLOCK
      ?auto_149262 - BLOCK
      ?auto_149263 - BLOCK
    )
    :vars
    (
      ?auto_149267 - BLOCK
      ?auto_149268 - BLOCK
      ?auto_149265 - BLOCK
      ?auto_149266 - BLOCK
      ?auto_149264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149267 ?auto_149263 ) ( ON-TABLE ?auto_149261 ) ( ON ?auto_149262 ?auto_149261 ) ( ON ?auto_149263 ?auto_149262 ) ( not ( = ?auto_149261 ?auto_149262 ) ) ( not ( = ?auto_149261 ?auto_149263 ) ) ( not ( = ?auto_149261 ?auto_149267 ) ) ( not ( = ?auto_149262 ?auto_149263 ) ) ( not ( = ?auto_149262 ?auto_149267 ) ) ( not ( = ?auto_149263 ?auto_149267 ) ) ( not ( = ?auto_149261 ?auto_149268 ) ) ( not ( = ?auto_149261 ?auto_149265 ) ) ( not ( = ?auto_149262 ?auto_149268 ) ) ( not ( = ?auto_149262 ?auto_149265 ) ) ( not ( = ?auto_149263 ?auto_149268 ) ) ( not ( = ?auto_149263 ?auto_149265 ) ) ( not ( = ?auto_149267 ?auto_149268 ) ) ( not ( = ?auto_149267 ?auto_149265 ) ) ( not ( = ?auto_149268 ?auto_149265 ) ) ( ON ?auto_149268 ?auto_149267 ) ( not ( = ?auto_149266 ?auto_149264 ) ) ( not ( = ?auto_149266 ?auto_149265 ) ) ( not ( = ?auto_149264 ?auto_149265 ) ) ( not ( = ?auto_149261 ?auto_149264 ) ) ( not ( = ?auto_149261 ?auto_149266 ) ) ( not ( = ?auto_149262 ?auto_149264 ) ) ( not ( = ?auto_149262 ?auto_149266 ) ) ( not ( = ?auto_149263 ?auto_149264 ) ) ( not ( = ?auto_149263 ?auto_149266 ) ) ( not ( = ?auto_149267 ?auto_149264 ) ) ( not ( = ?auto_149267 ?auto_149266 ) ) ( not ( = ?auto_149268 ?auto_149264 ) ) ( not ( = ?auto_149268 ?auto_149266 ) ) ( ON ?auto_149265 ?auto_149268 ) ( ON ?auto_149264 ?auto_149265 ) ( ON ?auto_149266 ?auto_149264 ) ( CLEAR ?auto_149266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149261 ?auto_149262 ?auto_149263 ?auto_149267 ?auto_149268 ?auto_149265 ?auto_149264 )
      ( MAKE-3PILE ?auto_149261 ?auto_149262 ?auto_149263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147412 - BLOCK
      ?auto_147413 - BLOCK
      ?auto_147414 - BLOCK
    )
    :vars
    (
      ?auto_147416 - BLOCK
      ?auto_147419 - BLOCK
      ?auto_147418 - BLOCK
      ?auto_147420 - BLOCK
      ?auto_147417 - BLOCK
      ?auto_147415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147416 ?auto_147414 ) ( ON-TABLE ?auto_147412 ) ( ON ?auto_147413 ?auto_147412 ) ( ON ?auto_147414 ?auto_147413 ) ( not ( = ?auto_147412 ?auto_147413 ) ) ( not ( = ?auto_147412 ?auto_147414 ) ) ( not ( = ?auto_147412 ?auto_147416 ) ) ( not ( = ?auto_147413 ?auto_147414 ) ) ( not ( = ?auto_147413 ?auto_147416 ) ) ( not ( = ?auto_147414 ?auto_147416 ) ) ( not ( = ?auto_147412 ?auto_147419 ) ) ( not ( = ?auto_147412 ?auto_147418 ) ) ( not ( = ?auto_147413 ?auto_147419 ) ) ( not ( = ?auto_147413 ?auto_147418 ) ) ( not ( = ?auto_147414 ?auto_147419 ) ) ( not ( = ?auto_147414 ?auto_147418 ) ) ( not ( = ?auto_147416 ?auto_147419 ) ) ( not ( = ?auto_147416 ?auto_147418 ) ) ( not ( = ?auto_147419 ?auto_147418 ) ) ( ON ?auto_147419 ?auto_147416 ) ( not ( = ?auto_147420 ?auto_147417 ) ) ( not ( = ?auto_147420 ?auto_147415 ) ) ( not ( = ?auto_147420 ?auto_147418 ) ) ( not ( = ?auto_147417 ?auto_147415 ) ) ( not ( = ?auto_147417 ?auto_147418 ) ) ( not ( = ?auto_147415 ?auto_147418 ) ) ( not ( = ?auto_147412 ?auto_147415 ) ) ( not ( = ?auto_147412 ?auto_147420 ) ) ( not ( = ?auto_147412 ?auto_147417 ) ) ( not ( = ?auto_147413 ?auto_147415 ) ) ( not ( = ?auto_147413 ?auto_147420 ) ) ( not ( = ?auto_147413 ?auto_147417 ) ) ( not ( = ?auto_147414 ?auto_147415 ) ) ( not ( = ?auto_147414 ?auto_147420 ) ) ( not ( = ?auto_147414 ?auto_147417 ) ) ( not ( = ?auto_147416 ?auto_147415 ) ) ( not ( = ?auto_147416 ?auto_147420 ) ) ( not ( = ?auto_147416 ?auto_147417 ) ) ( not ( = ?auto_147419 ?auto_147415 ) ) ( not ( = ?auto_147419 ?auto_147420 ) ) ( not ( = ?auto_147419 ?auto_147417 ) ) ( ON ?auto_147418 ?auto_147419 ) ( ON ?auto_147415 ?auto_147418 ) ( ON ?auto_147417 ?auto_147415 ) ( CLEAR ?auto_147417 ) ( HOLDING ?auto_147420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147420 )
      ( MAKE-3PILE ?auto_147412 ?auto_147413 ?auto_147414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147421 - BLOCK
      ?auto_147422 - BLOCK
      ?auto_147423 - BLOCK
    )
    :vars
    (
      ?auto_147425 - BLOCK
      ?auto_147429 - BLOCK
      ?auto_147428 - BLOCK
      ?auto_147427 - BLOCK
      ?auto_147424 - BLOCK
      ?auto_147426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147425 ?auto_147423 ) ( ON-TABLE ?auto_147421 ) ( ON ?auto_147422 ?auto_147421 ) ( ON ?auto_147423 ?auto_147422 ) ( not ( = ?auto_147421 ?auto_147422 ) ) ( not ( = ?auto_147421 ?auto_147423 ) ) ( not ( = ?auto_147421 ?auto_147425 ) ) ( not ( = ?auto_147422 ?auto_147423 ) ) ( not ( = ?auto_147422 ?auto_147425 ) ) ( not ( = ?auto_147423 ?auto_147425 ) ) ( not ( = ?auto_147421 ?auto_147429 ) ) ( not ( = ?auto_147421 ?auto_147428 ) ) ( not ( = ?auto_147422 ?auto_147429 ) ) ( not ( = ?auto_147422 ?auto_147428 ) ) ( not ( = ?auto_147423 ?auto_147429 ) ) ( not ( = ?auto_147423 ?auto_147428 ) ) ( not ( = ?auto_147425 ?auto_147429 ) ) ( not ( = ?auto_147425 ?auto_147428 ) ) ( not ( = ?auto_147429 ?auto_147428 ) ) ( ON ?auto_147429 ?auto_147425 ) ( not ( = ?auto_147427 ?auto_147424 ) ) ( not ( = ?auto_147427 ?auto_147426 ) ) ( not ( = ?auto_147427 ?auto_147428 ) ) ( not ( = ?auto_147424 ?auto_147426 ) ) ( not ( = ?auto_147424 ?auto_147428 ) ) ( not ( = ?auto_147426 ?auto_147428 ) ) ( not ( = ?auto_147421 ?auto_147426 ) ) ( not ( = ?auto_147421 ?auto_147427 ) ) ( not ( = ?auto_147421 ?auto_147424 ) ) ( not ( = ?auto_147422 ?auto_147426 ) ) ( not ( = ?auto_147422 ?auto_147427 ) ) ( not ( = ?auto_147422 ?auto_147424 ) ) ( not ( = ?auto_147423 ?auto_147426 ) ) ( not ( = ?auto_147423 ?auto_147427 ) ) ( not ( = ?auto_147423 ?auto_147424 ) ) ( not ( = ?auto_147425 ?auto_147426 ) ) ( not ( = ?auto_147425 ?auto_147427 ) ) ( not ( = ?auto_147425 ?auto_147424 ) ) ( not ( = ?auto_147429 ?auto_147426 ) ) ( not ( = ?auto_147429 ?auto_147427 ) ) ( not ( = ?auto_147429 ?auto_147424 ) ) ( ON ?auto_147428 ?auto_147429 ) ( ON ?auto_147426 ?auto_147428 ) ( ON ?auto_147424 ?auto_147426 ) ( ON ?auto_147427 ?auto_147424 ) ( CLEAR ?auto_147427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147421 ?auto_147422 ?auto_147423 ?auto_147425 ?auto_147429 ?auto_147428 ?auto_147426 ?auto_147424 )
      ( MAKE-3PILE ?auto_147421 ?auto_147422 ?auto_147423 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147436 - BLOCK
      ?auto_147437 - BLOCK
      ?auto_147438 - BLOCK
      ?auto_147439 - BLOCK
      ?auto_147440 - BLOCK
      ?auto_147441 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147441 ) ( CLEAR ?auto_147440 ) ( ON-TABLE ?auto_147436 ) ( ON ?auto_147437 ?auto_147436 ) ( ON ?auto_147438 ?auto_147437 ) ( ON ?auto_147439 ?auto_147438 ) ( ON ?auto_147440 ?auto_147439 ) ( not ( = ?auto_147436 ?auto_147437 ) ) ( not ( = ?auto_147436 ?auto_147438 ) ) ( not ( = ?auto_147436 ?auto_147439 ) ) ( not ( = ?auto_147436 ?auto_147440 ) ) ( not ( = ?auto_147436 ?auto_147441 ) ) ( not ( = ?auto_147437 ?auto_147438 ) ) ( not ( = ?auto_147437 ?auto_147439 ) ) ( not ( = ?auto_147437 ?auto_147440 ) ) ( not ( = ?auto_147437 ?auto_147441 ) ) ( not ( = ?auto_147438 ?auto_147439 ) ) ( not ( = ?auto_147438 ?auto_147440 ) ) ( not ( = ?auto_147438 ?auto_147441 ) ) ( not ( = ?auto_147439 ?auto_147440 ) ) ( not ( = ?auto_147439 ?auto_147441 ) ) ( not ( = ?auto_147440 ?auto_147441 ) ) )
    :subtasks
    ( ( !STACK ?auto_147441 ?auto_147440 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147442 - BLOCK
      ?auto_147443 - BLOCK
      ?auto_147444 - BLOCK
      ?auto_147445 - BLOCK
      ?auto_147446 - BLOCK
      ?auto_147447 - BLOCK
    )
    :vars
    (
      ?auto_147448 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147446 ) ( ON-TABLE ?auto_147442 ) ( ON ?auto_147443 ?auto_147442 ) ( ON ?auto_147444 ?auto_147443 ) ( ON ?auto_147445 ?auto_147444 ) ( ON ?auto_147446 ?auto_147445 ) ( not ( = ?auto_147442 ?auto_147443 ) ) ( not ( = ?auto_147442 ?auto_147444 ) ) ( not ( = ?auto_147442 ?auto_147445 ) ) ( not ( = ?auto_147442 ?auto_147446 ) ) ( not ( = ?auto_147442 ?auto_147447 ) ) ( not ( = ?auto_147443 ?auto_147444 ) ) ( not ( = ?auto_147443 ?auto_147445 ) ) ( not ( = ?auto_147443 ?auto_147446 ) ) ( not ( = ?auto_147443 ?auto_147447 ) ) ( not ( = ?auto_147444 ?auto_147445 ) ) ( not ( = ?auto_147444 ?auto_147446 ) ) ( not ( = ?auto_147444 ?auto_147447 ) ) ( not ( = ?auto_147445 ?auto_147446 ) ) ( not ( = ?auto_147445 ?auto_147447 ) ) ( not ( = ?auto_147446 ?auto_147447 ) ) ( ON ?auto_147447 ?auto_147448 ) ( CLEAR ?auto_147447 ) ( HAND-EMPTY ) ( not ( = ?auto_147442 ?auto_147448 ) ) ( not ( = ?auto_147443 ?auto_147448 ) ) ( not ( = ?auto_147444 ?auto_147448 ) ) ( not ( = ?auto_147445 ?auto_147448 ) ) ( not ( = ?auto_147446 ?auto_147448 ) ) ( not ( = ?auto_147447 ?auto_147448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147447 ?auto_147448 )
      ( MAKE-6PILE ?auto_147442 ?auto_147443 ?auto_147444 ?auto_147445 ?auto_147446 ?auto_147447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147449 - BLOCK
      ?auto_147450 - BLOCK
      ?auto_147451 - BLOCK
      ?auto_147452 - BLOCK
      ?auto_147453 - BLOCK
      ?auto_147454 - BLOCK
    )
    :vars
    (
      ?auto_147455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147449 ) ( ON ?auto_147450 ?auto_147449 ) ( ON ?auto_147451 ?auto_147450 ) ( ON ?auto_147452 ?auto_147451 ) ( not ( = ?auto_147449 ?auto_147450 ) ) ( not ( = ?auto_147449 ?auto_147451 ) ) ( not ( = ?auto_147449 ?auto_147452 ) ) ( not ( = ?auto_147449 ?auto_147453 ) ) ( not ( = ?auto_147449 ?auto_147454 ) ) ( not ( = ?auto_147450 ?auto_147451 ) ) ( not ( = ?auto_147450 ?auto_147452 ) ) ( not ( = ?auto_147450 ?auto_147453 ) ) ( not ( = ?auto_147450 ?auto_147454 ) ) ( not ( = ?auto_147451 ?auto_147452 ) ) ( not ( = ?auto_147451 ?auto_147453 ) ) ( not ( = ?auto_147451 ?auto_147454 ) ) ( not ( = ?auto_147452 ?auto_147453 ) ) ( not ( = ?auto_147452 ?auto_147454 ) ) ( not ( = ?auto_147453 ?auto_147454 ) ) ( ON ?auto_147454 ?auto_147455 ) ( CLEAR ?auto_147454 ) ( not ( = ?auto_147449 ?auto_147455 ) ) ( not ( = ?auto_147450 ?auto_147455 ) ) ( not ( = ?auto_147451 ?auto_147455 ) ) ( not ( = ?auto_147452 ?auto_147455 ) ) ( not ( = ?auto_147453 ?auto_147455 ) ) ( not ( = ?auto_147454 ?auto_147455 ) ) ( HOLDING ?auto_147453 ) ( CLEAR ?auto_147452 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147449 ?auto_147450 ?auto_147451 ?auto_147452 ?auto_147453 )
      ( MAKE-6PILE ?auto_147449 ?auto_147450 ?auto_147451 ?auto_147452 ?auto_147453 ?auto_147454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147456 - BLOCK
      ?auto_147457 - BLOCK
      ?auto_147458 - BLOCK
      ?auto_147459 - BLOCK
      ?auto_147460 - BLOCK
      ?auto_147461 - BLOCK
    )
    :vars
    (
      ?auto_147462 - BLOCK
      ?auto_147463 - BLOCK
      ?auto_147464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147456 ) ( ON ?auto_147457 ?auto_147456 ) ( ON ?auto_147458 ?auto_147457 ) ( ON ?auto_147459 ?auto_147458 ) ( not ( = ?auto_147456 ?auto_147457 ) ) ( not ( = ?auto_147456 ?auto_147458 ) ) ( not ( = ?auto_147456 ?auto_147459 ) ) ( not ( = ?auto_147456 ?auto_147460 ) ) ( not ( = ?auto_147456 ?auto_147461 ) ) ( not ( = ?auto_147457 ?auto_147458 ) ) ( not ( = ?auto_147457 ?auto_147459 ) ) ( not ( = ?auto_147457 ?auto_147460 ) ) ( not ( = ?auto_147457 ?auto_147461 ) ) ( not ( = ?auto_147458 ?auto_147459 ) ) ( not ( = ?auto_147458 ?auto_147460 ) ) ( not ( = ?auto_147458 ?auto_147461 ) ) ( not ( = ?auto_147459 ?auto_147460 ) ) ( not ( = ?auto_147459 ?auto_147461 ) ) ( not ( = ?auto_147460 ?auto_147461 ) ) ( ON ?auto_147461 ?auto_147462 ) ( not ( = ?auto_147456 ?auto_147462 ) ) ( not ( = ?auto_147457 ?auto_147462 ) ) ( not ( = ?auto_147458 ?auto_147462 ) ) ( not ( = ?auto_147459 ?auto_147462 ) ) ( not ( = ?auto_147460 ?auto_147462 ) ) ( not ( = ?auto_147461 ?auto_147462 ) ) ( CLEAR ?auto_147459 ) ( ON ?auto_147460 ?auto_147461 ) ( CLEAR ?auto_147460 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147463 ) ( ON ?auto_147464 ?auto_147463 ) ( ON ?auto_147462 ?auto_147464 ) ( not ( = ?auto_147463 ?auto_147464 ) ) ( not ( = ?auto_147463 ?auto_147462 ) ) ( not ( = ?auto_147463 ?auto_147461 ) ) ( not ( = ?auto_147463 ?auto_147460 ) ) ( not ( = ?auto_147464 ?auto_147462 ) ) ( not ( = ?auto_147464 ?auto_147461 ) ) ( not ( = ?auto_147464 ?auto_147460 ) ) ( not ( = ?auto_147456 ?auto_147463 ) ) ( not ( = ?auto_147456 ?auto_147464 ) ) ( not ( = ?auto_147457 ?auto_147463 ) ) ( not ( = ?auto_147457 ?auto_147464 ) ) ( not ( = ?auto_147458 ?auto_147463 ) ) ( not ( = ?auto_147458 ?auto_147464 ) ) ( not ( = ?auto_147459 ?auto_147463 ) ) ( not ( = ?auto_147459 ?auto_147464 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147463 ?auto_147464 ?auto_147462 ?auto_147461 )
      ( MAKE-6PILE ?auto_147456 ?auto_147457 ?auto_147458 ?auto_147459 ?auto_147460 ?auto_147461 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147465 - BLOCK
      ?auto_147466 - BLOCK
      ?auto_147467 - BLOCK
      ?auto_147468 - BLOCK
      ?auto_147469 - BLOCK
      ?auto_147470 - BLOCK
    )
    :vars
    (
      ?auto_147472 - BLOCK
      ?auto_147473 - BLOCK
      ?auto_147471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147465 ) ( ON ?auto_147466 ?auto_147465 ) ( ON ?auto_147467 ?auto_147466 ) ( not ( = ?auto_147465 ?auto_147466 ) ) ( not ( = ?auto_147465 ?auto_147467 ) ) ( not ( = ?auto_147465 ?auto_147468 ) ) ( not ( = ?auto_147465 ?auto_147469 ) ) ( not ( = ?auto_147465 ?auto_147470 ) ) ( not ( = ?auto_147466 ?auto_147467 ) ) ( not ( = ?auto_147466 ?auto_147468 ) ) ( not ( = ?auto_147466 ?auto_147469 ) ) ( not ( = ?auto_147466 ?auto_147470 ) ) ( not ( = ?auto_147467 ?auto_147468 ) ) ( not ( = ?auto_147467 ?auto_147469 ) ) ( not ( = ?auto_147467 ?auto_147470 ) ) ( not ( = ?auto_147468 ?auto_147469 ) ) ( not ( = ?auto_147468 ?auto_147470 ) ) ( not ( = ?auto_147469 ?auto_147470 ) ) ( ON ?auto_147470 ?auto_147472 ) ( not ( = ?auto_147465 ?auto_147472 ) ) ( not ( = ?auto_147466 ?auto_147472 ) ) ( not ( = ?auto_147467 ?auto_147472 ) ) ( not ( = ?auto_147468 ?auto_147472 ) ) ( not ( = ?auto_147469 ?auto_147472 ) ) ( not ( = ?auto_147470 ?auto_147472 ) ) ( ON ?auto_147469 ?auto_147470 ) ( CLEAR ?auto_147469 ) ( ON-TABLE ?auto_147473 ) ( ON ?auto_147471 ?auto_147473 ) ( ON ?auto_147472 ?auto_147471 ) ( not ( = ?auto_147473 ?auto_147471 ) ) ( not ( = ?auto_147473 ?auto_147472 ) ) ( not ( = ?auto_147473 ?auto_147470 ) ) ( not ( = ?auto_147473 ?auto_147469 ) ) ( not ( = ?auto_147471 ?auto_147472 ) ) ( not ( = ?auto_147471 ?auto_147470 ) ) ( not ( = ?auto_147471 ?auto_147469 ) ) ( not ( = ?auto_147465 ?auto_147473 ) ) ( not ( = ?auto_147465 ?auto_147471 ) ) ( not ( = ?auto_147466 ?auto_147473 ) ) ( not ( = ?auto_147466 ?auto_147471 ) ) ( not ( = ?auto_147467 ?auto_147473 ) ) ( not ( = ?auto_147467 ?auto_147471 ) ) ( not ( = ?auto_147468 ?auto_147473 ) ) ( not ( = ?auto_147468 ?auto_147471 ) ) ( HOLDING ?auto_147468 ) ( CLEAR ?auto_147467 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147465 ?auto_147466 ?auto_147467 ?auto_147468 )
      ( MAKE-6PILE ?auto_147465 ?auto_147466 ?auto_147467 ?auto_147468 ?auto_147469 ?auto_147470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147474 - BLOCK
      ?auto_147475 - BLOCK
      ?auto_147476 - BLOCK
      ?auto_147477 - BLOCK
      ?auto_147478 - BLOCK
      ?auto_147479 - BLOCK
    )
    :vars
    (
      ?auto_147480 - BLOCK
      ?auto_147482 - BLOCK
      ?auto_147481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147474 ) ( ON ?auto_147475 ?auto_147474 ) ( ON ?auto_147476 ?auto_147475 ) ( not ( = ?auto_147474 ?auto_147475 ) ) ( not ( = ?auto_147474 ?auto_147476 ) ) ( not ( = ?auto_147474 ?auto_147477 ) ) ( not ( = ?auto_147474 ?auto_147478 ) ) ( not ( = ?auto_147474 ?auto_147479 ) ) ( not ( = ?auto_147475 ?auto_147476 ) ) ( not ( = ?auto_147475 ?auto_147477 ) ) ( not ( = ?auto_147475 ?auto_147478 ) ) ( not ( = ?auto_147475 ?auto_147479 ) ) ( not ( = ?auto_147476 ?auto_147477 ) ) ( not ( = ?auto_147476 ?auto_147478 ) ) ( not ( = ?auto_147476 ?auto_147479 ) ) ( not ( = ?auto_147477 ?auto_147478 ) ) ( not ( = ?auto_147477 ?auto_147479 ) ) ( not ( = ?auto_147478 ?auto_147479 ) ) ( ON ?auto_147479 ?auto_147480 ) ( not ( = ?auto_147474 ?auto_147480 ) ) ( not ( = ?auto_147475 ?auto_147480 ) ) ( not ( = ?auto_147476 ?auto_147480 ) ) ( not ( = ?auto_147477 ?auto_147480 ) ) ( not ( = ?auto_147478 ?auto_147480 ) ) ( not ( = ?auto_147479 ?auto_147480 ) ) ( ON ?auto_147478 ?auto_147479 ) ( ON-TABLE ?auto_147482 ) ( ON ?auto_147481 ?auto_147482 ) ( ON ?auto_147480 ?auto_147481 ) ( not ( = ?auto_147482 ?auto_147481 ) ) ( not ( = ?auto_147482 ?auto_147480 ) ) ( not ( = ?auto_147482 ?auto_147479 ) ) ( not ( = ?auto_147482 ?auto_147478 ) ) ( not ( = ?auto_147481 ?auto_147480 ) ) ( not ( = ?auto_147481 ?auto_147479 ) ) ( not ( = ?auto_147481 ?auto_147478 ) ) ( not ( = ?auto_147474 ?auto_147482 ) ) ( not ( = ?auto_147474 ?auto_147481 ) ) ( not ( = ?auto_147475 ?auto_147482 ) ) ( not ( = ?auto_147475 ?auto_147481 ) ) ( not ( = ?auto_147476 ?auto_147482 ) ) ( not ( = ?auto_147476 ?auto_147481 ) ) ( not ( = ?auto_147477 ?auto_147482 ) ) ( not ( = ?auto_147477 ?auto_147481 ) ) ( CLEAR ?auto_147476 ) ( ON ?auto_147477 ?auto_147478 ) ( CLEAR ?auto_147477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147482 ?auto_147481 ?auto_147480 ?auto_147479 ?auto_147478 )
      ( MAKE-6PILE ?auto_147474 ?auto_147475 ?auto_147476 ?auto_147477 ?auto_147478 ?auto_147479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147483 - BLOCK
      ?auto_147484 - BLOCK
      ?auto_147485 - BLOCK
      ?auto_147486 - BLOCK
      ?auto_147487 - BLOCK
      ?auto_147488 - BLOCK
    )
    :vars
    (
      ?auto_147489 - BLOCK
      ?auto_147491 - BLOCK
      ?auto_147490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147483 ) ( ON ?auto_147484 ?auto_147483 ) ( not ( = ?auto_147483 ?auto_147484 ) ) ( not ( = ?auto_147483 ?auto_147485 ) ) ( not ( = ?auto_147483 ?auto_147486 ) ) ( not ( = ?auto_147483 ?auto_147487 ) ) ( not ( = ?auto_147483 ?auto_147488 ) ) ( not ( = ?auto_147484 ?auto_147485 ) ) ( not ( = ?auto_147484 ?auto_147486 ) ) ( not ( = ?auto_147484 ?auto_147487 ) ) ( not ( = ?auto_147484 ?auto_147488 ) ) ( not ( = ?auto_147485 ?auto_147486 ) ) ( not ( = ?auto_147485 ?auto_147487 ) ) ( not ( = ?auto_147485 ?auto_147488 ) ) ( not ( = ?auto_147486 ?auto_147487 ) ) ( not ( = ?auto_147486 ?auto_147488 ) ) ( not ( = ?auto_147487 ?auto_147488 ) ) ( ON ?auto_147488 ?auto_147489 ) ( not ( = ?auto_147483 ?auto_147489 ) ) ( not ( = ?auto_147484 ?auto_147489 ) ) ( not ( = ?auto_147485 ?auto_147489 ) ) ( not ( = ?auto_147486 ?auto_147489 ) ) ( not ( = ?auto_147487 ?auto_147489 ) ) ( not ( = ?auto_147488 ?auto_147489 ) ) ( ON ?auto_147487 ?auto_147488 ) ( ON-TABLE ?auto_147491 ) ( ON ?auto_147490 ?auto_147491 ) ( ON ?auto_147489 ?auto_147490 ) ( not ( = ?auto_147491 ?auto_147490 ) ) ( not ( = ?auto_147491 ?auto_147489 ) ) ( not ( = ?auto_147491 ?auto_147488 ) ) ( not ( = ?auto_147491 ?auto_147487 ) ) ( not ( = ?auto_147490 ?auto_147489 ) ) ( not ( = ?auto_147490 ?auto_147488 ) ) ( not ( = ?auto_147490 ?auto_147487 ) ) ( not ( = ?auto_147483 ?auto_147491 ) ) ( not ( = ?auto_147483 ?auto_147490 ) ) ( not ( = ?auto_147484 ?auto_147491 ) ) ( not ( = ?auto_147484 ?auto_147490 ) ) ( not ( = ?auto_147485 ?auto_147491 ) ) ( not ( = ?auto_147485 ?auto_147490 ) ) ( not ( = ?auto_147486 ?auto_147491 ) ) ( not ( = ?auto_147486 ?auto_147490 ) ) ( ON ?auto_147486 ?auto_147487 ) ( CLEAR ?auto_147486 ) ( HOLDING ?auto_147485 ) ( CLEAR ?auto_147484 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147483 ?auto_147484 ?auto_147485 )
      ( MAKE-6PILE ?auto_147483 ?auto_147484 ?auto_147485 ?auto_147486 ?auto_147487 ?auto_147488 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147492 - BLOCK
      ?auto_147493 - BLOCK
      ?auto_147494 - BLOCK
      ?auto_147495 - BLOCK
      ?auto_147496 - BLOCK
      ?auto_147497 - BLOCK
    )
    :vars
    (
      ?auto_147498 - BLOCK
      ?auto_147499 - BLOCK
      ?auto_147500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147492 ) ( ON ?auto_147493 ?auto_147492 ) ( not ( = ?auto_147492 ?auto_147493 ) ) ( not ( = ?auto_147492 ?auto_147494 ) ) ( not ( = ?auto_147492 ?auto_147495 ) ) ( not ( = ?auto_147492 ?auto_147496 ) ) ( not ( = ?auto_147492 ?auto_147497 ) ) ( not ( = ?auto_147493 ?auto_147494 ) ) ( not ( = ?auto_147493 ?auto_147495 ) ) ( not ( = ?auto_147493 ?auto_147496 ) ) ( not ( = ?auto_147493 ?auto_147497 ) ) ( not ( = ?auto_147494 ?auto_147495 ) ) ( not ( = ?auto_147494 ?auto_147496 ) ) ( not ( = ?auto_147494 ?auto_147497 ) ) ( not ( = ?auto_147495 ?auto_147496 ) ) ( not ( = ?auto_147495 ?auto_147497 ) ) ( not ( = ?auto_147496 ?auto_147497 ) ) ( ON ?auto_147497 ?auto_147498 ) ( not ( = ?auto_147492 ?auto_147498 ) ) ( not ( = ?auto_147493 ?auto_147498 ) ) ( not ( = ?auto_147494 ?auto_147498 ) ) ( not ( = ?auto_147495 ?auto_147498 ) ) ( not ( = ?auto_147496 ?auto_147498 ) ) ( not ( = ?auto_147497 ?auto_147498 ) ) ( ON ?auto_147496 ?auto_147497 ) ( ON-TABLE ?auto_147499 ) ( ON ?auto_147500 ?auto_147499 ) ( ON ?auto_147498 ?auto_147500 ) ( not ( = ?auto_147499 ?auto_147500 ) ) ( not ( = ?auto_147499 ?auto_147498 ) ) ( not ( = ?auto_147499 ?auto_147497 ) ) ( not ( = ?auto_147499 ?auto_147496 ) ) ( not ( = ?auto_147500 ?auto_147498 ) ) ( not ( = ?auto_147500 ?auto_147497 ) ) ( not ( = ?auto_147500 ?auto_147496 ) ) ( not ( = ?auto_147492 ?auto_147499 ) ) ( not ( = ?auto_147492 ?auto_147500 ) ) ( not ( = ?auto_147493 ?auto_147499 ) ) ( not ( = ?auto_147493 ?auto_147500 ) ) ( not ( = ?auto_147494 ?auto_147499 ) ) ( not ( = ?auto_147494 ?auto_147500 ) ) ( not ( = ?auto_147495 ?auto_147499 ) ) ( not ( = ?auto_147495 ?auto_147500 ) ) ( ON ?auto_147495 ?auto_147496 ) ( CLEAR ?auto_147493 ) ( ON ?auto_147494 ?auto_147495 ) ( CLEAR ?auto_147494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147499 ?auto_147500 ?auto_147498 ?auto_147497 ?auto_147496 ?auto_147495 )
      ( MAKE-6PILE ?auto_147492 ?auto_147493 ?auto_147494 ?auto_147495 ?auto_147496 ?auto_147497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147501 - BLOCK
      ?auto_147502 - BLOCK
      ?auto_147503 - BLOCK
      ?auto_147504 - BLOCK
      ?auto_147505 - BLOCK
      ?auto_147506 - BLOCK
    )
    :vars
    (
      ?auto_147509 - BLOCK
      ?auto_147508 - BLOCK
      ?auto_147507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147501 ) ( not ( = ?auto_147501 ?auto_147502 ) ) ( not ( = ?auto_147501 ?auto_147503 ) ) ( not ( = ?auto_147501 ?auto_147504 ) ) ( not ( = ?auto_147501 ?auto_147505 ) ) ( not ( = ?auto_147501 ?auto_147506 ) ) ( not ( = ?auto_147502 ?auto_147503 ) ) ( not ( = ?auto_147502 ?auto_147504 ) ) ( not ( = ?auto_147502 ?auto_147505 ) ) ( not ( = ?auto_147502 ?auto_147506 ) ) ( not ( = ?auto_147503 ?auto_147504 ) ) ( not ( = ?auto_147503 ?auto_147505 ) ) ( not ( = ?auto_147503 ?auto_147506 ) ) ( not ( = ?auto_147504 ?auto_147505 ) ) ( not ( = ?auto_147504 ?auto_147506 ) ) ( not ( = ?auto_147505 ?auto_147506 ) ) ( ON ?auto_147506 ?auto_147509 ) ( not ( = ?auto_147501 ?auto_147509 ) ) ( not ( = ?auto_147502 ?auto_147509 ) ) ( not ( = ?auto_147503 ?auto_147509 ) ) ( not ( = ?auto_147504 ?auto_147509 ) ) ( not ( = ?auto_147505 ?auto_147509 ) ) ( not ( = ?auto_147506 ?auto_147509 ) ) ( ON ?auto_147505 ?auto_147506 ) ( ON-TABLE ?auto_147508 ) ( ON ?auto_147507 ?auto_147508 ) ( ON ?auto_147509 ?auto_147507 ) ( not ( = ?auto_147508 ?auto_147507 ) ) ( not ( = ?auto_147508 ?auto_147509 ) ) ( not ( = ?auto_147508 ?auto_147506 ) ) ( not ( = ?auto_147508 ?auto_147505 ) ) ( not ( = ?auto_147507 ?auto_147509 ) ) ( not ( = ?auto_147507 ?auto_147506 ) ) ( not ( = ?auto_147507 ?auto_147505 ) ) ( not ( = ?auto_147501 ?auto_147508 ) ) ( not ( = ?auto_147501 ?auto_147507 ) ) ( not ( = ?auto_147502 ?auto_147508 ) ) ( not ( = ?auto_147502 ?auto_147507 ) ) ( not ( = ?auto_147503 ?auto_147508 ) ) ( not ( = ?auto_147503 ?auto_147507 ) ) ( not ( = ?auto_147504 ?auto_147508 ) ) ( not ( = ?auto_147504 ?auto_147507 ) ) ( ON ?auto_147504 ?auto_147505 ) ( ON ?auto_147503 ?auto_147504 ) ( CLEAR ?auto_147503 ) ( HOLDING ?auto_147502 ) ( CLEAR ?auto_147501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147501 ?auto_147502 )
      ( MAKE-6PILE ?auto_147501 ?auto_147502 ?auto_147503 ?auto_147504 ?auto_147505 ?auto_147506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147510 - BLOCK
      ?auto_147511 - BLOCK
      ?auto_147512 - BLOCK
      ?auto_147513 - BLOCK
      ?auto_147514 - BLOCK
      ?auto_147515 - BLOCK
    )
    :vars
    (
      ?auto_147518 - BLOCK
      ?auto_147517 - BLOCK
      ?auto_147516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147510 ) ( not ( = ?auto_147510 ?auto_147511 ) ) ( not ( = ?auto_147510 ?auto_147512 ) ) ( not ( = ?auto_147510 ?auto_147513 ) ) ( not ( = ?auto_147510 ?auto_147514 ) ) ( not ( = ?auto_147510 ?auto_147515 ) ) ( not ( = ?auto_147511 ?auto_147512 ) ) ( not ( = ?auto_147511 ?auto_147513 ) ) ( not ( = ?auto_147511 ?auto_147514 ) ) ( not ( = ?auto_147511 ?auto_147515 ) ) ( not ( = ?auto_147512 ?auto_147513 ) ) ( not ( = ?auto_147512 ?auto_147514 ) ) ( not ( = ?auto_147512 ?auto_147515 ) ) ( not ( = ?auto_147513 ?auto_147514 ) ) ( not ( = ?auto_147513 ?auto_147515 ) ) ( not ( = ?auto_147514 ?auto_147515 ) ) ( ON ?auto_147515 ?auto_147518 ) ( not ( = ?auto_147510 ?auto_147518 ) ) ( not ( = ?auto_147511 ?auto_147518 ) ) ( not ( = ?auto_147512 ?auto_147518 ) ) ( not ( = ?auto_147513 ?auto_147518 ) ) ( not ( = ?auto_147514 ?auto_147518 ) ) ( not ( = ?auto_147515 ?auto_147518 ) ) ( ON ?auto_147514 ?auto_147515 ) ( ON-TABLE ?auto_147517 ) ( ON ?auto_147516 ?auto_147517 ) ( ON ?auto_147518 ?auto_147516 ) ( not ( = ?auto_147517 ?auto_147516 ) ) ( not ( = ?auto_147517 ?auto_147518 ) ) ( not ( = ?auto_147517 ?auto_147515 ) ) ( not ( = ?auto_147517 ?auto_147514 ) ) ( not ( = ?auto_147516 ?auto_147518 ) ) ( not ( = ?auto_147516 ?auto_147515 ) ) ( not ( = ?auto_147516 ?auto_147514 ) ) ( not ( = ?auto_147510 ?auto_147517 ) ) ( not ( = ?auto_147510 ?auto_147516 ) ) ( not ( = ?auto_147511 ?auto_147517 ) ) ( not ( = ?auto_147511 ?auto_147516 ) ) ( not ( = ?auto_147512 ?auto_147517 ) ) ( not ( = ?auto_147512 ?auto_147516 ) ) ( not ( = ?auto_147513 ?auto_147517 ) ) ( not ( = ?auto_147513 ?auto_147516 ) ) ( ON ?auto_147513 ?auto_147514 ) ( ON ?auto_147512 ?auto_147513 ) ( CLEAR ?auto_147510 ) ( ON ?auto_147511 ?auto_147512 ) ( CLEAR ?auto_147511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147517 ?auto_147516 ?auto_147518 ?auto_147515 ?auto_147514 ?auto_147513 ?auto_147512 )
      ( MAKE-6PILE ?auto_147510 ?auto_147511 ?auto_147512 ?auto_147513 ?auto_147514 ?auto_147515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147519 - BLOCK
      ?auto_147520 - BLOCK
      ?auto_147521 - BLOCK
      ?auto_147522 - BLOCK
      ?auto_147523 - BLOCK
      ?auto_147524 - BLOCK
    )
    :vars
    (
      ?auto_147525 - BLOCK
      ?auto_147526 - BLOCK
      ?auto_147527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147519 ?auto_147520 ) ) ( not ( = ?auto_147519 ?auto_147521 ) ) ( not ( = ?auto_147519 ?auto_147522 ) ) ( not ( = ?auto_147519 ?auto_147523 ) ) ( not ( = ?auto_147519 ?auto_147524 ) ) ( not ( = ?auto_147520 ?auto_147521 ) ) ( not ( = ?auto_147520 ?auto_147522 ) ) ( not ( = ?auto_147520 ?auto_147523 ) ) ( not ( = ?auto_147520 ?auto_147524 ) ) ( not ( = ?auto_147521 ?auto_147522 ) ) ( not ( = ?auto_147521 ?auto_147523 ) ) ( not ( = ?auto_147521 ?auto_147524 ) ) ( not ( = ?auto_147522 ?auto_147523 ) ) ( not ( = ?auto_147522 ?auto_147524 ) ) ( not ( = ?auto_147523 ?auto_147524 ) ) ( ON ?auto_147524 ?auto_147525 ) ( not ( = ?auto_147519 ?auto_147525 ) ) ( not ( = ?auto_147520 ?auto_147525 ) ) ( not ( = ?auto_147521 ?auto_147525 ) ) ( not ( = ?auto_147522 ?auto_147525 ) ) ( not ( = ?auto_147523 ?auto_147525 ) ) ( not ( = ?auto_147524 ?auto_147525 ) ) ( ON ?auto_147523 ?auto_147524 ) ( ON-TABLE ?auto_147526 ) ( ON ?auto_147527 ?auto_147526 ) ( ON ?auto_147525 ?auto_147527 ) ( not ( = ?auto_147526 ?auto_147527 ) ) ( not ( = ?auto_147526 ?auto_147525 ) ) ( not ( = ?auto_147526 ?auto_147524 ) ) ( not ( = ?auto_147526 ?auto_147523 ) ) ( not ( = ?auto_147527 ?auto_147525 ) ) ( not ( = ?auto_147527 ?auto_147524 ) ) ( not ( = ?auto_147527 ?auto_147523 ) ) ( not ( = ?auto_147519 ?auto_147526 ) ) ( not ( = ?auto_147519 ?auto_147527 ) ) ( not ( = ?auto_147520 ?auto_147526 ) ) ( not ( = ?auto_147520 ?auto_147527 ) ) ( not ( = ?auto_147521 ?auto_147526 ) ) ( not ( = ?auto_147521 ?auto_147527 ) ) ( not ( = ?auto_147522 ?auto_147526 ) ) ( not ( = ?auto_147522 ?auto_147527 ) ) ( ON ?auto_147522 ?auto_147523 ) ( ON ?auto_147521 ?auto_147522 ) ( ON ?auto_147520 ?auto_147521 ) ( CLEAR ?auto_147520 ) ( HOLDING ?auto_147519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147519 )
      ( MAKE-6PILE ?auto_147519 ?auto_147520 ?auto_147521 ?auto_147522 ?auto_147523 ?auto_147524 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147528 - BLOCK
      ?auto_147529 - BLOCK
      ?auto_147530 - BLOCK
      ?auto_147531 - BLOCK
      ?auto_147532 - BLOCK
      ?auto_147533 - BLOCK
    )
    :vars
    (
      ?auto_147536 - BLOCK
      ?auto_147535 - BLOCK
      ?auto_147534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147528 ?auto_147529 ) ) ( not ( = ?auto_147528 ?auto_147530 ) ) ( not ( = ?auto_147528 ?auto_147531 ) ) ( not ( = ?auto_147528 ?auto_147532 ) ) ( not ( = ?auto_147528 ?auto_147533 ) ) ( not ( = ?auto_147529 ?auto_147530 ) ) ( not ( = ?auto_147529 ?auto_147531 ) ) ( not ( = ?auto_147529 ?auto_147532 ) ) ( not ( = ?auto_147529 ?auto_147533 ) ) ( not ( = ?auto_147530 ?auto_147531 ) ) ( not ( = ?auto_147530 ?auto_147532 ) ) ( not ( = ?auto_147530 ?auto_147533 ) ) ( not ( = ?auto_147531 ?auto_147532 ) ) ( not ( = ?auto_147531 ?auto_147533 ) ) ( not ( = ?auto_147532 ?auto_147533 ) ) ( ON ?auto_147533 ?auto_147536 ) ( not ( = ?auto_147528 ?auto_147536 ) ) ( not ( = ?auto_147529 ?auto_147536 ) ) ( not ( = ?auto_147530 ?auto_147536 ) ) ( not ( = ?auto_147531 ?auto_147536 ) ) ( not ( = ?auto_147532 ?auto_147536 ) ) ( not ( = ?auto_147533 ?auto_147536 ) ) ( ON ?auto_147532 ?auto_147533 ) ( ON-TABLE ?auto_147535 ) ( ON ?auto_147534 ?auto_147535 ) ( ON ?auto_147536 ?auto_147534 ) ( not ( = ?auto_147535 ?auto_147534 ) ) ( not ( = ?auto_147535 ?auto_147536 ) ) ( not ( = ?auto_147535 ?auto_147533 ) ) ( not ( = ?auto_147535 ?auto_147532 ) ) ( not ( = ?auto_147534 ?auto_147536 ) ) ( not ( = ?auto_147534 ?auto_147533 ) ) ( not ( = ?auto_147534 ?auto_147532 ) ) ( not ( = ?auto_147528 ?auto_147535 ) ) ( not ( = ?auto_147528 ?auto_147534 ) ) ( not ( = ?auto_147529 ?auto_147535 ) ) ( not ( = ?auto_147529 ?auto_147534 ) ) ( not ( = ?auto_147530 ?auto_147535 ) ) ( not ( = ?auto_147530 ?auto_147534 ) ) ( not ( = ?auto_147531 ?auto_147535 ) ) ( not ( = ?auto_147531 ?auto_147534 ) ) ( ON ?auto_147531 ?auto_147532 ) ( ON ?auto_147530 ?auto_147531 ) ( ON ?auto_147529 ?auto_147530 ) ( ON ?auto_147528 ?auto_147529 ) ( CLEAR ?auto_147528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147535 ?auto_147534 ?auto_147536 ?auto_147533 ?auto_147532 ?auto_147531 ?auto_147530 ?auto_147529 )
      ( MAKE-6PILE ?auto_147528 ?auto_147529 ?auto_147530 ?auto_147531 ?auto_147532 ?auto_147533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147539 - BLOCK
      ?auto_147540 - BLOCK
    )
    :vars
    (
      ?auto_147541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147541 ?auto_147540 ) ( CLEAR ?auto_147541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147539 ) ( ON ?auto_147540 ?auto_147539 ) ( not ( = ?auto_147539 ?auto_147540 ) ) ( not ( = ?auto_147539 ?auto_147541 ) ) ( not ( = ?auto_147540 ?auto_147541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147541 ?auto_147540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147542 - BLOCK
      ?auto_147543 - BLOCK
    )
    :vars
    (
      ?auto_147544 - BLOCK
      ?auto_147545 - BLOCK
      ?auto_147546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147544 ?auto_147543 ) ( CLEAR ?auto_147544 ) ( ON-TABLE ?auto_147542 ) ( ON ?auto_147543 ?auto_147542 ) ( not ( = ?auto_147542 ?auto_147543 ) ) ( not ( = ?auto_147542 ?auto_147544 ) ) ( not ( = ?auto_147543 ?auto_147544 ) ) ( HOLDING ?auto_147545 ) ( CLEAR ?auto_147546 ) ( not ( = ?auto_147542 ?auto_147545 ) ) ( not ( = ?auto_147542 ?auto_147546 ) ) ( not ( = ?auto_147543 ?auto_147545 ) ) ( not ( = ?auto_147543 ?auto_147546 ) ) ( not ( = ?auto_147544 ?auto_147545 ) ) ( not ( = ?auto_147544 ?auto_147546 ) ) ( not ( = ?auto_147545 ?auto_147546 ) ) )
    :subtasks
    ( ( !STACK ?auto_147545 ?auto_147546 )
      ( MAKE-2PILE ?auto_147542 ?auto_147543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147547 - BLOCK
      ?auto_147548 - BLOCK
    )
    :vars
    (
      ?auto_147550 - BLOCK
      ?auto_147549 - BLOCK
      ?auto_147551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147550 ?auto_147548 ) ( ON-TABLE ?auto_147547 ) ( ON ?auto_147548 ?auto_147547 ) ( not ( = ?auto_147547 ?auto_147548 ) ) ( not ( = ?auto_147547 ?auto_147550 ) ) ( not ( = ?auto_147548 ?auto_147550 ) ) ( CLEAR ?auto_147549 ) ( not ( = ?auto_147547 ?auto_147551 ) ) ( not ( = ?auto_147547 ?auto_147549 ) ) ( not ( = ?auto_147548 ?auto_147551 ) ) ( not ( = ?auto_147548 ?auto_147549 ) ) ( not ( = ?auto_147550 ?auto_147551 ) ) ( not ( = ?auto_147550 ?auto_147549 ) ) ( not ( = ?auto_147551 ?auto_147549 ) ) ( ON ?auto_147551 ?auto_147550 ) ( CLEAR ?auto_147551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147547 ?auto_147548 ?auto_147550 )
      ( MAKE-2PILE ?auto_147547 ?auto_147548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147552 - BLOCK
      ?auto_147553 - BLOCK
    )
    :vars
    (
      ?auto_147556 - BLOCK
      ?auto_147554 - BLOCK
      ?auto_147555 - BLOCK
      ?auto_147560 - BLOCK
      ?auto_147559 - BLOCK
      ?auto_147557 - BLOCK
      ?auto_147558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147556 ?auto_147553 ) ( ON-TABLE ?auto_147552 ) ( ON ?auto_147553 ?auto_147552 ) ( not ( = ?auto_147552 ?auto_147553 ) ) ( not ( = ?auto_147552 ?auto_147556 ) ) ( not ( = ?auto_147553 ?auto_147556 ) ) ( not ( = ?auto_147552 ?auto_147554 ) ) ( not ( = ?auto_147552 ?auto_147555 ) ) ( not ( = ?auto_147553 ?auto_147554 ) ) ( not ( = ?auto_147553 ?auto_147555 ) ) ( not ( = ?auto_147556 ?auto_147554 ) ) ( not ( = ?auto_147556 ?auto_147555 ) ) ( not ( = ?auto_147554 ?auto_147555 ) ) ( ON ?auto_147554 ?auto_147556 ) ( CLEAR ?auto_147554 ) ( HOLDING ?auto_147555 ) ( CLEAR ?auto_147560 ) ( ON-TABLE ?auto_147559 ) ( ON ?auto_147557 ?auto_147559 ) ( ON ?auto_147558 ?auto_147557 ) ( ON ?auto_147560 ?auto_147558 ) ( not ( = ?auto_147559 ?auto_147557 ) ) ( not ( = ?auto_147559 ?auto_147558 ) ) ( not ( = ?auto_147559 ?auto_147560 ) ) ( not ( = ?auto_147559 ?auto_147555 ) ) ( not ( = ?auto_147557 ?auto_147558 ) ) ( not ( = ?auto_147557 ?auto_147560 ) ) ( not ( = ?auto_147557 ?auto_147555 ) ) ( not ( = ?auto_147558 ?auto_147560 ) ) ( not ( = ?auto_147558 ?auto_147555 ) ) ( not ( = ?auto_147560 ?auto_147555 ) ) ( not ( = ?auto_147552 ?auto_147560 ) ) ( not ( = ?auto_147552 ?auto_147559 ) ) ( not ( = ?auto_147552 ?auto_147557 ) ) ( not ( = ?auto_147552 ?auto_147558 ) ) ( not ( = ?auto_147553 ?auto_147560 ) ) ( not ( = ?auto_147553 ?auto_147559 ) ) ( not ( = ?auto_147553 ?auto_147557 ) ) ( not ( = ?auto_147553 ?auto_147558 ) ) ( not ( = ?auto_147556 ?auto_147560 ) ) ( not ( = ?auto_147556 ?auto_147559 ) ) ( not ( = ?auto_147556 ?auto_147557 ) ) ( not ( = ?auto_147556 ?auto_147558 ) ) ( not ( = ?auto_147554 ?auto_147560 ) ) ( not ( = ?auto_147554 ?auto_147559 ) ) ( not ( = ?auto_147554 ?auto_147557 ) ) ( not ( = ?auto_147554 ?auto_147558 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147559 ?auto_147557 ?auto_147558 ?auto_147560 ?auto_147555 )
      ( MAKE-2PILE ?auto_147552 ?auto_147553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147561 - BLOCK
      ?auto_147562 - BLOCK
    )
    :vars
    (
      ?auto_147566 - BLOCK
      ?auto_147569 - BLOCK
      ?auto_147568 - BLOCK
      ?auto_147567 - BLOCK
      ?auto_147563 - BLOCK
      ?auto_147564 - BLOCK
      ?auto_147565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147566 ?auto_147562 ) ( ON-TABLE ?auto_147561 ) ( ON ?auto_147562 ?auto_147561 ) ( not ( = ?auto_147561 ?auto_147562 ) ) ( not ( = ?auto_147561 ?auto_147566 ) ) ( not ( = ?auto_147562 ?auto_147566 ) ) ( not ( = ?auto_147561 ?auto_147569 ) ) ( not ( = ?auto_147561 ?auto_147568 ) ) ( not ( = ?auto_147562 ?auto_147569 ) ) ( not ( = ?auto_147562 ?auto_147568 ) ) ( not ( = ?auto_147566 ?auto_147569 ) ) ( not ( = ?auto_147566 ?auto_147568 ) ) ( not ( = ?auto_147569 ?auto_147568 ) ) ( ON ?auto_147569 ?auto_147566 ) ( CLEAR ?auto_147567 ) ( ON-TABLE ?auto_147563 ) ( ON ?auto_147564 ?auto_147563 ) ( ON ?auto_147565 ?auto_147564 ) ( ON ?auto_147567 ?auto_147565 ) ( not ( = ?auto_147563 ?auto_147564 ) ) ( not ( = ?auto_147563 ?auto_147565 ) ) ( not ( = ?auto_147563 ?auto_147567 ) ) ( not ( = ?auto_147563 ?auto_147568 ) ) ( not ( = ?auto_147564 ?auto_147565 ) ) ( not ( = ?auto_147564 ?auto_147567 ) ) ( not ( = ?auto_147564 ?auto_147568 ) ) ( not ( = ?auto_147565 ?auto_147567 ) ) ( not ( = ?auto_147565 ?auto_147568 ) ) ( not ( = ?auto_147567 ?auto_147568 ) ) ( not ( = ?auto_147561 ?auto_147567 ) ) ( not ( = ?auto_147561 ?auto_147563 ) ) ( not ( = ?auto_147561 ?auto_147564 ) ) ( not ( = ?auto_147561 ?auto_147565 ) ) ( not ( = ?auto_147562 ?auto_147567 ) ) ( not ( = ?auto_147562 ?auto_147563 ) ) ( not ( = ?auto_147562 ?auto_147564 ) ) ( not ( = ?auto_147562 ?auto_147565 ) ) ( not ( = ?auto_147566 ?auto_147567 ) ) ( not ( = ?auto_147566 ?auto_147563 ) ) ( not ( = ?auto_147566 ?auto_147564 ) ) ( not ( = ?auto_147566 ?auto_147565 ) ) ( not ( = ?auto_147569 ?auto_147567 ) ) ( not ( = ?auto_147569 ?auto_147563 ) ) ( not ( = ?auto_147569 ?auto_147564 ) ) ( not ( = ?auto_147569 ?auto_147565 ) ) ( ON ?auto_147568 ?auto_147569 ) ( CLEAR ?auto_147568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147561 ?auto_147562 ?auto_147566 ?auto_147569 )
      ( MAKE-2PILE ?auto_147561 ?auto_147562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147570 - BLOCK
      ?auto_147571 - BLOCK
    )
    :vars
    (
      ?auto_147576 - BLOCK
      ?auto_147577 - BLOCK
      ?auto_147578 - BLOCK
      ?auto_147572 - BLOCK
      ?auto_147573 - BLOCK
      ?auto_147574 - BLOCK
      ?auto_147575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147576 ?auto_147571 ) ( ON-TABLE ?auto_147570 ) ( ON ?auto_147571 ?auto_147570 ) ( not ( = ?auto_147570 ?auto_147571 ) ) ( not ( = ?auto_147570 ?auto_147576 ) ) ( not ( = ?auto_147571 ?auto_147576 ) ) ( not ( = ?auto_147570 ?auto_147577 ) ) ( not ( = ?auto_147570 ?auto_147578 ) ) ( not ( = ?auto_147571 ?auto_147577 ) ) ( not ( = ?auto_147571 ?auto_147578 ) ) ( not ( = ?auto_147576 ?auto_147577 ) ) ( not ( = ?auto_147576 ?auto_147578 ) ) ( not ( = ?auto_147577 ?auto_147578 ) ) ( ON ?auto_147577 ?auto_147576 ) ( ON-TABLE ?auto_147572 ) ( ON ?auto_147573 ?auto_147572 ) ( ON ?auto_147574 ?auto_147573 ) ( not ( = ?auto_147572 ?auto_147573 ) ) ( not ( = ?auto_147572 ?auto_147574 ) ) ( not ( = ?auto_147572 ?auto_147575 ) ) ( not ( = ?auto_147572 ?auto_147578 ) ) ( not ( = ?auto_147573 ?auto_147574 ) ) ( not ( = ?auto_147573 ?auto_147575 ) ) ( not ( = ?auto_147573 ?auto_147578 ) ) ( not ( = ?auto_147574 ?auto_147575 ) ) ( not ( = ?auto_147574 ?auto_147578 ) ) ( not ( = ?auto_147575 ?auto_147578 ) ) ( not ( = ?auto_147570 ?auto_147575 ) ) ( not ( = ?auto_147570 ?auto_147572 ) ) ( not ( = ?auto_147570 ?auto_147573 ) ) ( not ( = ?auto_147570 ?auto_147574 ) ) ( not ( = ?auto_147571 ?auto_147575 ) ) ( not ( = ?auto_147571 ?auto_147572 ) ) ( not ( = ?auto_147571 ?auto_147573 ) ) ( not ( = ?auto_147571 ?auto_147574 ) ) ( not ( = ?auto_147576 ?auto_147575 ) ) ( not ( = ?auto_147576 ?auto_147572 ) ) ( not ( = ?auto_147576 ?auto_147573 ) ) ( not ( = ?auto_147576 ?auto_147574 ) ) ( not ( = ?auto_147577 ?auto_147575 ) ) ( not ( = ?auto_147577 ?auto_147572 ) ) ( not ( = ?auto_147577 ?auto_147573 ) ) ( not ( = ?auto_147577 ?auto_147574 ) ) ( ON ?auto_147578 ?auto_147577 ) ( CLEAR ?auto_147578 ) ( HOLDING ?auto_147575 ) ( CLEAR ?auto_147574 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147572 ?auto_147573 ?auto_147574 ?auto_147575 )
      ( MAKE-2PILE ?auto_147570 ?auto_147571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147579 - BLOCK
      ?auto_147580 - BLOCK
    )
    :vars
    (
      ?auto_147581 - BLOCK
      ?auto_147583 - BLOCK
      ?auto_147582 - BLOCK
      ?auto_147587 - BLOCK
      ?auto_147584 - BLOCK
      ?auto_147585 - BLOCK
      ?auto_147586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147581 ?auto_147580 ) ( ON-TABLE ?auto_147579 ) ( ON ?auto_147580 ?auto_147579 ) ( not ( = ?auto_147579 ?auto_147580 ) ) ( not ( = ?auto_147579 ?auto_147581 ) ) ( not ( = ?auto_147580 ?auto_147581 ) ) ( not ( = ?auto_147579 ?auto_147583 ) ) ( not ( = ?auto_147579 ?auto_147582 ) ) ( not ( = ?auto_147580 ?auto_147583 ) ) ( not ( = ?auto_147580 ?auto_147582 ) ) ( not ( = ?auto_147581 ?auto_147583 ) ) ( not ( = ?auto_147581 ?auto_147582 ) ) ( not ( = ?auto_147583 ?auto_147582 ) ) ( ON ?auto_147583 ?auto_147581 ) ( ON-TABLE ?auto_147587 ) ( ON ?auto_147584 ?auto_147587 ) ( ON ?auto_147585 ?auto_147584 ) ( not ( = ?auto_147587 ?auto_147584 ) ) ( not ( = ?auto_147587 ?auto_147585 ) ) ( not ( = ?auto_147587 ?auto_147586 ) ) ( not ( = ?auto_147587 ?auto_147582 ) ) ( not ( = ?auto_147584 ?auto_147585 ) ) ( not ( = ?auto_147584 ?auto_147586 ) ) ( not ( = ?auto_147584 ?auto_147582 ) ) ( not ( = ?auto_147585 ?auto_147586 ) ) ( not ( = ?auto_147585 ?auto_147582 ) ) ( not ( = ?auto_147586 ?auto_147582 ) ) ( not ( = ?auto_147579 ?auto_147586 ) ) ( not ( = ?auto_147579 ?auto_147587 ) ) ( not ( = ?auto_147579 ?auto_147584 ) ) ( not ( = ?auto_147579 ?auto_147585 ) ) ( not ( = ?auto_147580 ?auto_147586 ) ) ( not ( = ?auto_147580 ?auto_147587 ) ) ( not ( = ?auto_147580 ?auto_147584 ) ) ( not ( = ?auto_147580 ?auto_147585 ) ) ( not ( = ?auto_147581 ?auto_147586 ) ) ( not ( = ?auto_147581 ?auto_147587 ) ) ( not ( = ?auto_147581 ?auto_147584 ) ) ( not ( = ?auto_147581 ?auto_147585 ) ) ( not ( = ?auto_147583 ?auto_147586 ) ) ( not ( = ?auto_147583 ?auto_147587 ) ) ( not ( = ?auto_147583 ?auto_147584 ) ) ( not ( = ?auto_147583 ?auto_147585 ) ) ( ON ?auto_147582 ?auto_147583 ) ( CLEAR ?auto_147585 ) ( ON ?auto_147586 ?auto_147582 ) ( CLEAR ?auto_147586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147579 ?auto_147580 ?auto_147581 ?auto_147583 ?auto_147582 )
      ( MAKE-2PILE ?auto_147579 ?auto_147580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147588 - BLOCK
      ?auto_147589 - BLOCK
    )
    :vars
    (
      ?auto_147592 - BLOCK
      ?auto_147594 - BLOCK
      ?auto_147593 - BLOCK
      ?auto_147591 - BLOCK
      ?auto_147590 - BLOCK
      ?auto_147595 - BLOCK
      ?auto_147596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147592 ?auto_147589 ) ( ON-TABLE ?auto_147588 ) ( ON ?auto_147589 ?auto_147588 ) ( not ( = ?auto_147588 ?auto_147589 ) ) ( not ( = ?auto_147588 ?auto_147592 ) ) ( not ( = ?auto_147589 ?auto_147592 ) ) ( not ( = ?auto_147588 ?auto_147594 ) ) ( not ( = ?auto_147588 ?auto_147593 ) ) ( not ( = ?auto_147589 ?auto_147594 ) ) ( not ( = ?auto_147589 ?auto_147593 ) ) ( not ( = ?auto_147592 ?auto_147594 ) ) ( not ( = ?auto_147592 ?auto_147593 ) ) ( not ( = ?auto_147594 ?auto_147593 ) ) ( ON ?auto_147594 ?auto_147592 ) ( ON-TABLE ?auto_147591 ) ( ON ?auto_147590 ?auto_147591 ) ( not ( = ?auto_147591 ?auto_147590 ) ) ( not ( = ?auto_147591 ?auto_147595 ) ) ( not ( = ?auto_147591 ?auto_147596 ) ) ( not ( = ?auto_147591 ?auto_147593 ) ) ( not ( = ?auto_147590 ?auto_147595 ) ) ( not ( = ?auto_147590 ?auto_147596 ) ) ( not ( = ?auto_147590 ?auto_147593 ) ) ( not ( = ?auto_147595 ?auto_147596 ) ) ( not ( = ?auto_147595 ?auto_147593 ) ) ( not ( = ?auto_147596 ?auto_147593 ) ) ( not ( = ?auto_147588 ?auto_147596 ) ) ( not ( = ?auto_147588 ?auto_147591 ) ) ( not ( = ?auto_147588 ?auto_147590 ) ) ( not ( = ?auto_147588 ?auto_147595 ) ) ( not ( = ?auto_147589 ?auto_147596 ) ) ( not ( = ?auto_147589 ?auto_147591 ) ) ( not ( = ?auto_147589 ?auto_147590 ) ) ( not ( = ?auto_147589 ?auto_147595 ) ) ( not ( = ?auto_147592 ?auto_147596 ) ) ( not ( = ?auto_147592 ?auto_147591 ) ) ( not ( = ?auto_147592 ?auto_147590 ) ) ( not ( = ?auto_147592 ?auto_147595 ) ) ( not ( = ?auto_147594 ?auto_147596 ) ) ( not ( = ?auto_147594 ?auto_147591 ) ) ( not ( = ?auto_147594 ?auto_147590 ) ) ( not ( = ?auto_147594 ?auto_147595 ) ) ( ON ?auto_147593 ?auto_147594 ) ( ON ?auto_147596 ?auto_147593 ) ( CLEAR ?auto_147596 ) ( HOLDING ?auto_147595 ) ( CLEAR ?auto_147590 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147591 ?auto_147590 ?auto_147595 )
      ( MAKE-2PILE ?auto_147588 ?auto_147589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147597 - BLOCK
      ?auto_147598 - BLOCK
    )
    :vars
    (
      ?auto_147604 - BLOCK
      ?auto_147603 - BLOCK
      ?auto_147600 - BLOCK
      ?auto_147605 - BLOCK
      ?auto_147602 - BLOCK
      ?auto_147601 - BLOCK
      ?auto_147599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147604 ?auto_147598 ) ( ON-TABLE ?auto_147597 ) ( ON ?auto_147598 ?auto_147597 ) ( not ( = ?auto_147597 ?auto_147598 ) ) ( not ( = ?auto_147597 ?auto_147604 ) ) ( not ( = ?auto_147598 ?auto_147604 ) ) ( not ( = ?auto_147597 ?auto_147603 ) ) ( not ( = ?auto_147597 ?auto_147600 ) ) ( not ( = ?auto_147598 ?auto_147603 ) ) ( not ( = ?auto_147598 ?auto_147600 ) ) ( not ( = ?auto_147604 ?auto_147603 ) ) ( not ( = ?auto_147604 ?auto_147600 ) ) ( not ( = ?auto_147603 ?auto_147600 ) ) ( ON ?auto_147603 ?auto_147604 ) ( ON-TABLE ?auto_147605 ) ( ON ?auto_147602 ?auto_147605 ) ( not ( = ?auto_147605 ?auto_147602 ) ) ( not ( = ?auto_147605 ?auto_147601 ) ) ( not ( = ?auto_147605 ?auto_147599 ) ) ( not ( = ?auto_147605 ?auto_147600 ) ) ( not ( = ?auto_147602 ?auto_147601 ) ) ( not ( = ?auto_147602 ?auto_147599 ) ) ( not ( = ?auto_147602 ?auto_147600 ) ) ( not ( = ?auto_147601 ?auto_147599 ) ) ( not ( = ?auto_147601 ?auto_147600 ) ) ( not ( = ?auto_147599 ?auto_147600 ) ) ( not ( = ?auto_147597 ?auto_147599 ) ) ( not ( = ?auto_147597 ?auto_147605 ) ) ( not ( = ?auto_147597 ?auto_147602 ) ) ( not ( = ?auto_147597 ?auto_147601 ) ) ( not ( = ?auto_147598 ?auto_147599 ) ) ( not ( = ?auto_147598 ?auto_147605 ) ) ( not ( = ?auto_147598 ?auto_147602 ) ) ( not ( = ?auto_147598 ?auto_147601 ) ) ( not ( = ?auto_147604 ?auto_147599 ) ) ( not ( = ?auto_147604 ?auto_147605 ) ) ( not ( = ?auto_147604 ?auto_147602 ) ) ( not ( = ?auto_147604 ?auto_147601 ) ) ( not ( = ?auto_147603 ?auto_147599 ) ) ( not ( = ?auto_147603 ?auto_147605 ) ) ( not ( = ?auto_147603 ?auto_147602 ) ) ( not ( = ?auto_147603 ?auto_147601 ) ) ( ON ?auto_147600 ?auto_147603 ) ( ON ?auto_147599 ?auto_147600 ) ( CLEAR ?auto_147602 ) ( ON ?auto_147601 ?auto_147599 ) ( CLEAR ?auto_147601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147597 ?auto_147598 ?auto_147604 ?auto_147603 ?auto_147600 ?auto_147599 )
      ( MAKE-2PILE ?auto_147597 ?auto_147598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147606 - BLOCK
      ?auto_147607 - BLOCK
    )
    :vars
    (
      ?auto_147609 - BLOCK
      ?auto_147610 - BLOCK
      ?auto_147613 - BLOCK
      ?auto_147614 - BLOCK
      ?auto_147611 - BLOCK
      ?auto_147612 - BLOCK
      ?auto_147608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147609 ?auto_147607 ) ( ON-TABLE ?auto_147606 ) ( ON ?auto_147607 ?auto_147606 ) ( not ( = ?auto_147606 ?auto_147607 ) ) ( not ( = ?auto_147606 ?auto_147609 ) ) ( not ( = ?auto_147607 ?auto_147609 ) ) ( not ( = ?auto_147606 ?auto_147610 ) ) ( not ( = ?auto_147606 ?auto_147613 ) ) ( not ( = ?auto_147607 ?auto_147610 ) ) ( not ( = ?auto_147607 ?auto_147613 ) ) ( not ( = ?auto_147609 ?auto_147610 ) ) ( not ( = ?auto_147609 ?auto_147613 ) ) ( not ( = ?auto_147610 ?auto_147613 ) ) ( ON ?auto_147610 ?auto_147609 ) ( ON-TABLE ?auto_147614 ) ( not ( = ?auto_147614 ?auto_147611 ) ) ( not ( = ?auto_147614 ?auto_147612 ) ) ( not ( = ?auto_147614 ?auto_147608 ) ) ( not ( = ?auto_147614 ?auto_147613 ) ) ( not ( = ?auto_147611 ?auto_147612 ) ) ( not ( = ?auto_147611 ?auto_147608 ) ) ( not ( = ?auto_147611 ?auto_147613 ) ) ( not ( = ?auto_147612 ?auto_147608 ) ) ( not ( = ?auto_147612 ?auto_147613 ) ) ( not ( = ?auto_147608 ?auto_147613 ) ) ( not ( = ?auto_147606 ?auto_147608 ) ) ( not ( = ?auto_147606 ?auto_147614 ) ) ( not ( = ?auto_147606 ?auto_147611 ) ) ( not ( = ?auto_147606 ?auto_147612 ) ) ( not ( = ?auto_147607 ?auto_147608 ) ) ( not ( = ?auto_147607 ?auto_147614 ) ) ( not ( = ?auto_147607 ?auto_147611 ) ) ( not ( = ?auto_147607 ?auto_147612 ) ) ( not ( = ?auto_147609 ?auto_147608 ) ) ( not ( = ?auto_147609 ?auto_147614 ) ) ( not ( = ?auto_147609 ?auto_147611 ) ) ( not ( = ?auto_147609 ?auto_147612 ) ) ( not ( = ?auto_147610 ?auto_147608 ) ) ( not ( = ?auto_147610 ?auto_147614 ) ) ( not ( = ?auto_147610 ?auto_147611 ) ) ( not ( = ?auto_147610 ?auto_147612 ) ) ( ON ?auto_147613 ?auto_147610 ) ( ON ?auto_147608 ?auto_147613 ) ( ON ?auto_147612 ?auto_147608 ) ( CLEAR ?auto_147612 ) ( HOLDING ?auto_147611 ) ( CLEAR ?auto_147614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147614 ?auto_147611 )
      ( MAKE-2PILE ?auto_147606 ?auto_147607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149633 - BLOCK
      ?auto_149634 - BLOCK
    )
    :vars
    (
      ?auto_149635 - BLOCK
      ?auto_149639 - BLOCK
      ?auto_149636 - BLOCK
      ?auto_149638 - BLOCK
      ?auto_149637 - BLOCK
      ?auto_149640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149635 ?auto_149634 ) ( ON-TABLE ?auto_149633 ) ( ON ?auto_149634 ?auto_149633 ) ( not ( = ?auto_149633 ?auto_149634 ) ) ( not ( = ?auto_149633 ?auto_149635 ) ) ( not ( = ?auto_149634 ?auto_149635 ) ) ( not ( = ?auto_149633 ?auto_149639 ) ) ( not ( = ?auto_149633 ?auto_149636 ) ) ( not ( = ?auto_149634 ?auto_149639 ) ) ( not ( = ?auto_149634 ?auto_149636 ) ) ( not ( = ?auto_149635 ?auto_149639 ) ) ( not ( = ?auto_149635 ?auto_149636 ) ) ( not ( = ?auto_149639 ?auto_149636 ) ) ( ON ?auto_149639 ?auto_149635 ) ( not ( = ?auto_149638 ?auto_149637 ) ) ( not ( = ?auto_149638 ?auto_149640 ) ) ( not ( = ?auto_149638 ?auto_149636 ) ) ( not ( = ?auto_149637 ?auto_149640 ) ) ( not ( = ?auto_149637 ?auto_149636 ) ) ( not ( = ?auto_149640 ?auto_149636 ) ) ( not ( = ?auto_149633 ?auto_149640 ) ) ( not ( = ?auto_149633 ?auto_149638 ) ) ( not ( = ?auto_149633 ?auto_149637 ) ) ( not ( = ?auto_149634 ?auto_149640 ) ) ( not ( = ?auto_149634 ?auto_149638 ) ) ( not ( = ?auto_149634 ?auto_149637 ) ) ( not ( = ?auto_149635 ?auto_149640 ) ) ( not ( = ?auto_149635 ?auto_149638 ) ) ( not ( = ?auto_149635 ?auto_149637 ) ) ( not ( = ?auto_149639 ?auto_149640 ) ) ( not ( = ?auto_149639 ?auto_149638 ) ) ( not ( = ?auto_149639 ?auto_149637 ) ) ( ON ?auto_149636 ?auto_149639 ) ( ON ?auto_149640 ?auto_149636 ) ( ON ?auto_149637 ?auto_149640 ) ( ON ?auto_149638 ?auto_149637 ) ( CLEAR ?auto_149638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149633 ?auto_149634 ?auto_149635 ?auto_149639 ?auto_149636 ?auto_149640 ?auto_149637 )
      ( MAKE-2PILE ?auto_149633 ?auto_149634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147624 - BLOCK
      ?auto_147625 - BLOCK
    )
    :vars
    (
      ?auto_147627 - BLOCK
      ?auto_147632 - BLOCK
      ?auto_147630 - BLOCK
      ?auto_147629 - BLOCK
      ?auto_147631 - BLOCK
      ?auto_147628 - BLOCK
      ?auto_147626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147627 ?auto_147625 ) ( ON-TABLE ?auto_147624 ) ( ON ?auto_147625 ?auto_147624 ) ( not ( = ?auto_147624 ?auto_147625 ) ) ( not ( = ?auto_147624 ?auto_147627 ) ) ( not ( = ?auto_147625 ?auto_147627 ) ) ( not ( = ?auto_147624 ?auto_147632 ) ) ( not ( = ?auto_147624 ?auto_147630 ) ) ( not ( = ?auto_147625 ?auto_147632 ) ) ( not ( = ?auto_147625 ?auto_147630 ) ) ( not ( = ?auto_147627 ?auto_147632 ) ) ( not ( = ?auto_147627 ?auto_147630 ) ) ( not ( = ?auto_147632 ?auto_147630 ) ) ( ON ?auto_147632 ?auto_147627 ) ( not ( = ?auto_147629 ?auto_147631 ) ) ( not ( = ?auto_147629 ?auto_147628 ) ) ( not ( = ?auto_147629 ?auto_147626 ) ) ( not ( = ?auto_147629 ?auto_147630 ) ) ( not ( = ?auto_147631 ?auto_147628 ) ) ( not ( = ?auto_147631 ?auto_147626 ) ) ( not ( = ?auto_147631 ?auto_147630 ) ) ( not ( = ?auto_147628 ?auto_147626 ) ) ( not ( = ?auto_147628 ?auto_147630 ) ) ( not ( = ?auto_147626 ?auto_147630 ) ) ( not ( = ?auto_147624 ?auto_147626 ) ) ( not ( = ?auto_147624 ?auto_147629 ) ) ( not ( = ?auto_147624 ?auto_147631 ) ) ( not ( = ?auto_147624 ?auto_147628 ) ) ( not ( = ?auto_147625 ?auto_147626 ) ) ( not ( = ?auto_147625 ?auto_147629 ) ) ( not ( = ?auto_147625 ?auto_147631 ) ) ( not ( = ?auto_147625 ?auto_147628 ) ) ( not ( = ?auto_147627 ?auto_147626 ) ) ( not ( = ?auto_147627 ?auto_147629 ) ) ( not ( = ?auto_147627 ?auto_147631 ) ) ( not ( = ?auto_147627 ?auto_147628 ) ) ( not ( = ?auto_147632 ?auto_147626 ) ) ( not ( = ?auto_147632 ?auto_147629 ) ) ( not ( = ?auto_147632 ?auto_147631 ) ) ( not ( = ?auto_147632 ?auto_147628 ) ) ( ON ?auto_147630 ?auto_147632 ) ( ON ?auto_147626 ?auto_147630 ) ( ON ?auto_147628 ?auto_147626 ) ( ON ?auto_147631 ?auto_147628 ) ( CLEAR ?auto_147631 ) ( HOLDING ?auto_147629 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147629 )
      ( MAKE-2PILE ?auto_147624 ?auto_147625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147633 - BLOCK
      ?auto_147634 - BLOCK
    )
    :vars
    (
      ?auto_147636 - BLOCK
      ?auto_147640 - BLOCK
      ?auto_147637 - BLOCK
      ?auto_147639 - BLOCK
      ?auto_147641 - BLOCK
      ?auto_147635 - BLOCK
      ?auto_147638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147636 ?auto_147634 ) ( ON-TABLE ?auto_147633 ) ( ON ?auto_147634 ?auto_147633 ) ( not ( = ?auto_147633 ?auto_147634 ) ) ( not ( = ?auto_147633 ?auto_147636 ) ) ( not ( = ?auto_147634 ?auto_147636 ) ) ( not ( = ?auto_147633 ?auto_147640 ) ) ( not ( = ?auto_147633 ?auto_147637 ) ) ( not ( = ?auto_147634 ?auto_147640 ) ) ( not ( = ?auto_147634 ?auto_147637 ) ) ( not ( = ?auto_147636 ?auto_147640 ) ) ( not ( = ?auto_147636 ?auto_147637 ) ) ( not ( = ?auto_147640 ?auto_147637 ) ) ( ON ?auto_147640 ?auto_147636 ) ( not ( = ?auto_147639 ?auto_147641 ) ) ( not ( = ?auto_147639 ?auto_147635 ) ) ( not ( = ?auto_147639 ?auto_147638 ) ) ( not ( = ?auto_147639 ?auto_147637 ) ) ( not ( = ?auto_147641 ?auto_147635 ) ) ( not ( = ?auto_147641 ?auto_147638 ) ) ( not ( = ?auto_147641 ?auto_147637 ) ) ( not ( = ?auto_147635 ?auto_147638 ) ) ( not ( = ?auto_147635 ?auto_147637 ) ) ( not ( = ?auto_147638 ?auto_147637 ) ) ( not ( = ?auto_147633 ?auto_147638 ) ) ( not ( = ?auto_147633 ?auto_147639 ) ) ( not ( = ?auto_147633 ?auto_147641 ) ) ( not ( = ?auto_147633 ?auto_147635 ) ) ( not ( = ?auto_147634 ?auto_147638 ) ) ( not ( = ?auto_147634 ?auto_147639 ) ) ( not ( = ?auto_147634 ?auto_147641 ) ) ( not ( = ?auto_147634 ?auto_147635 ) ) ( not ( = ?auto_147636 ?auto_147638 ) ) ( not ( = ?auto_147636 ?auto_147639 ) ) ( not ( = ?auto_147636 ?auto_147641 ) ) ( not ( = ?auto_147636 ?auto_147635 ) ) ( not ( = ?auto_147640 ?auto_147638 ) ) ( not ( = ?auto_147640 ?auto_147639 ) ) ( not ( = ?auto_147640 ?auto_147641 ) ) ( not ( = ?auto_147640 ?auto_147635 ) ) ( ON ?auto_147637 ?auto_147640 ) ( ON ?auto_147638 ?auto_147637 ) ( ON ?auto_147635 ?auto_147638 ) ( ON ?auto_147641 ?auto_147635 ) ( ON ?auto_147639 ?auto_147641 ) ( CLEAR ?auto_147639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147633 ?auto_147634 ?auto_147636 ?auto_147640 ?auto_147637 ?auto_147638 ?auto_147635 ?auto_147641 )
      ( MAKE-2PILE ?auto_147633 ?auto_147634 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147649 - BLOCK
      ?auto_147650 - BLOCK
      ?auto_147651 - BLOCK
      ?auto_147652 - BLOCK
      ?auto_147653 - BLOCK
      ?auto_147654 - BLOCK
      ?auto_147655 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147655 ) ( CLEAR ?auto_147654 ) ( ON-TABLE ?auto_147649 ) ( ON ?auto_147650 ?auto_147649 ) ( ON ?auto_147651 ?auto_147650 ) ( ON ?auto_147652 ?auto_147651 ) ( ON ?auto_147653 ?auto_147652 ) ( ON ?auto_147654 ?auto_147653 ) ( not ( = ?auto_147649 ?auto_147650 ) ) ( not ( = ?auto_147649 ?auto_147651 ) ) ( not ( = ?auto_147649 ?auto_147652 ) ) ( not ( = ?auto_147649 ?auto_147653 ) ) ( not ( = ?auto_147649 ?auto_147654 ) ) ( not ( = ?auto_147649 ?auto_147655 ) ) ( not ( = ?auto_147650 ?auto_147651 ) ) ( not ( = ?auto_147650 ?auto_147652 ) ) ( not ( = ?auto_147650 ?auto_147653 ) ) ( not ( = ?auto_147650 ?auto_147654 ) ) ( not ( = ?auto_147650 ?auto_147655 ) ) ( not ( = ?auto_147651 ?auto_147652 ) ) ( not ( = ?auto_147651 ?auto_147653 ) ) ( not ( = ?auto_147651 ?auto_147654 ) ) ( not ( = ?auto_147651 ?auto_147655 ) ) ( not ( = ?auto_147652 ?auto_147653 ) ) ( not ( = ?auto_147652 ?auto_147654 ) ) ( not ( = ?auto_147652 ?auto_147655 ) ) ( not ( = ?auto_147653 ?auto_147654 ) ) ( not ( = ?auto_147653 ?auto_147655 ) ) ( not ( = ?auto_147654 ?auto_147655 ) ) )
    :subtasks
    ( ( !STACK ?auto_147655 ?auto_147654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147656 - BLOCK
      ?auto_147657 - BLOCK
      ?auto_147658 - BLOCK
      ?auto_147659 - BLOCK
      ?auto_147660 - BLOCK
      ?auto_147661 - BLOCK
      ?auto_147662 - BLOCK
    )
    :vars
    (
      ?auto_147663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147661 ) ( ON-TABLE ?auto_147656 ) ( ON ?auto_147657 ?auto_147656 ) ( ON ?auto_147658 ?auto_147657 ) ( ON ?auto_147659 ?auto_147658 ) ( ON ?auto_147660 ?auto_147659 ) ( ON ?auto_147661 ?auto_147660 ) ( not ( = ?auto_147656 ?auto_147657 ) ) ( not ( = ?auto_147656 ?auto_147658 ) ) ( not ( = ?auto_147656 ?auto_147659 ) ) ( not ( = ?auto_147656 ?auto_147660 ) ) ( not ( = ?auto_147656 ?auto_147661 ) ) ( not ( = ?auto_147656 ?auto_147662 ) ) ( not ( = ?auto_147657 ?auto_147658 ) ) ( not ( = ?auto_147657 ?auto_147659 ) ) ( not ( = ?auto_147657 ?auto_147660 ) ) ( not ( = ?auto_147657 ?auto_147661 ) ) ( not ( = ?auto_147657 ?auto_147662 ) ) ( not ( = ?auto_147658 ?auto_147659 ) ) ( not ( = ?auto_147658 ?auto_147660 ) ) ( not ( = ?auto_147658 ?auto_147661 ) ) ( not ( = ?auto_147658 ?auto_147662 ) ) ( not ( = ?auto_147659 ?auto_147660 ) ) ( not ( = ?auto_147659 ?auto_147661 ) ) ( not ( = ?auto_147659 ?auto_147662 ) ) ( not ( = ?auto_147660 ?auto_147661 ) ) ( not ( = ?auto_147660 ?auto_147662 ) ) ( not ( = ?auto_147661 ?auto_147662 ) ) ( ON ?auto_147662 ?auto_147663 ) ( CLEAR ?auto_147662 ) ( HAND-EMPTY ) ( not ( = ?auto_147656 ?auto_147663 ) ) ( not ( = ?auto_147657 ?auto_147663 ) ) ( not ( = ?auto_147658 ?auto_147663 ) ) ( not ( = ?auto_147659 ?auto_147663 ) ) ( not ( = ?auto_147660 ?auto_147663 ) ) ( not ( = ?auto_147661 ?auto_147663 ) ) ( not ( = ?auto_147662 ?auto_147663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147662 ?auto_147663 )
      ( MAKE-7PILE ?auto_147656 ?auto_147657 ?auto_147658 ?auto_147659 ?auto_147660 ?auto_147661 ?auto_147662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147664 - BLOCK
      ?auto_147665 - BLOCK
      ?auto_147666 - BLOCK
      ?auto_147667 - BLOCK
      ?auto_147668 - BLOCK
      ?auto_147669 - BLOCK
      ?auto_147670 - BLOCK
    )
    :vars
    (
      ?auto_147671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147664 ) ( ON ?auto_147665 ?auto_147664 ) ( ON ?auto_147666 ?auto_147665 ) ( ON ?auto_147667 ?auto_147666 ) ( ON ?auto_147668 ?auto_147667 ) ( not ( = ?auto_147664 ?auto_147665 ) ) ( not ( = ?auto_147664 ?auto_147666 ) ) ( not ( = ?auto_147664 ?auto_147667 ) ) ( not ( = ?auto_147664 ?auto_147668 ) ) ( not ( = ?auto_147664 ?auto_147669 ) ) ( not ( = ?auto_147664 ?auto_147670 ) ) ( not ( = ?auto_147665 ?auto_147666 ) ) ( not ( = ?auto_147665 ?auto_147667 ) ) ( not ( = ?auto_147665 ?auto_147668 ) ) ( not ( = ?auto_147665 ?auto_147669 ) ) ( not ( = ?auto_147665 ?auto_147670 ) ) ( not ( = ?auto_147666 ?auto_147667 ) ) ( not ( = ?auto_147666 ?auto_147668 ) ) ( not ( = ?auto_147666 ?auto_147669 ) ) ( not ( = ?auto_147666 ?auto_147670 ) ) ( not ( = ?auto_147667 ?auto_147668 ) ) ( not ( = ?auto_147667 ?auto_147669 ) ) ( not ( = ?auto_147667 ?auto_147670 ) ) ( not ( = ?auto_147668 ?auto_147669 ) ) ( not ( = ?auto_147668 ?auto_147670 ) ) ( not ( = ?auto_147669 ?auto_147670 ) ) ( ON ?auto_147670 ?auto_147671 ) ( CLEAR ?auto_147670 ) ( not ( = ?auto_147664 ?auto_147671 ) ) ( not ( = ?auto_147665 ?auto_147671 ) ) ( not ( = ?auto_147666 ?auto_147671 ) ) ( not ( = ?auto_147667 ?auto_147671 ) ) ( not ( = ?auto_147668 ?auto_147671 ) ) ( not ( = ?auto_147669 ?auto_147671 ) ) ( not ( = ?auto_147670 ?auto_147671 ) ) ( HOLDING ?auto_147669 ) ( CLEAR ?auto_147668 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147664 ?auto_147665 ?auto_147666 ?auto_147667 ?auto_147668 ?auto_147669 )
      ( MAKE-7PILE ?auto_147664 ?auto_147665 ?auto_147666 ?auto_147667 ?auto_147668 ?auto_147669 ?auto_147670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147672 - BLOCK
      ?auto_147673 - BLOCK
      ?auto_147674 - BLOCK
      ?auto_147675 - BLOCK
      ?auto_147676 - BLOCK
      ?auto_147677 - BLOCK
      ?auto_147678 - BLOCK
    )
    :vars
    (
      ?auto_147679 - BLOCK
      ?auto_147680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147672 ) ( ON ?auto_147673 ?auto_147672 ) ( ON ?auto_147674 ?auto_147673 ) ( ON ?auto_147675 ?auto_147674 ) ( ON ?auto_147676 ?auto_147675 ) ( not ( = ?auto_147672 ?auto_147673 ) ) ( not ( = ?auto_147672 ?auto_147674 ) ) ( not ( = ?auto_147672 ?auto_147675 ) ) ( not ( = ?auto_147672 ?auto_147676 ) ) ( not ( = ?auto_147672 ?auto_147677 ) ) ( not ( = ?auto_147672 ?auto_147678 ) ) ( not ( = ?auto_147673 ?auto_147674 ) ) ( not ( = ?auto_147673 ?auto_147675 ) ) ( not ( = ?auto_147673 ?auto_147676 ) ) ( not ( = ?auto_147673 ?auto_147677 ) ) ( not ( = ?auto_147673 ?auto_147678 ) ) ( not ( = ?auto_147674 ?auto_147675 ) ) ( not ( = ?auto_147674 ?auto_147676 ) ) ( not ( = ?auto_147674 ?auto_147677 ) ) ( not ( = ?auto_147674 ?auto_147678 ) ) ( not ( = ?auto_147675 ?auto_147676 ) ) ( not ( = ?auto_147675 ?auto_147677 ) ) ( not ( = ?auto_147675 ?auto_147678 ) ) ( not ( = ?auto_147676 ?auto_147677 ) ) ( not ( = ?auto_147676 ?auto_147678 ) ) ( not ( = ?auto_147677 ?auto_147678 ) ) ( ON ?auto_147678 ?auto_147679 ) ( not ( = ?auto_147672 ?auto_147679 ) ) ( not ( = ?auto_147673 ?auto_147679 ) ) ( not ( = ?auto_147674 ?auto_147679 ) ) ( not ( = ?auto_147675 ?auto_147679 ) ) ( not ( = ?auto_147676 ?auto_147679 ) ) ( not ( = ?auto_147677 ?auto_147679 ) ) ( not ( = ?auto_147678 ?auto_147679 ) ) ( CLEAR ?auto_147676 ) ( ON ?auto_147677 ?auto_147678 ) ( CLEAR ?auto_147677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147680 ) ( ON ?auto_147679 ?auto_147680 ) ( not ( = ?auto_147680 ?auto_147679 ) ) ( not ( = ?auto_147680 ?auto_147678 ) ) ( not ( = ?auto_147680 ?auto_147677 ) ) ( not ( = ?auto_147672 ?auto_147680 ) ) ( not ( = ?auto_147673 ?auto_147680 ) ) ( not ( = ?auto_147674 ?auto_147680 ) ) ( not ( = ?auto_147675 ?auto_147680 ) ) ( not ( = ?auto_147676 ?auto_147680 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147680 ?auto_147679 ?auto_147678 )
      ( MAKE-7PILE ?auto_147672 ?auto_147673 ?auto_147674 ?auto_147675 ?auto_147676 ?auto_147677 ?auto_147678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147681 - BLOCK
      ?auto_147682 - BLOCK
      ?auto_147683 - BLOCK
      ?auto_147684 - BLOCK
      ?auto_147685 - BLOCK
      ?auto_147686 - BLOCK
      ?auto_147687 - BLOCK
    )
    :vars
    (
      ?auto_147689 - BLOCK
      ?auto_147688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147681 ) ( ON ?auto_147682 ?auto_147681 ) ( ON ?auto_147683 ?auto_147682 ) ( ON ?auto_147684 ?auto_147683 ) ( not ( = ?auto_147681 ?auto_147682 ) ) ( not ( = ?auto_147681 ?auto_147683 ) ) ( not ( = ?auto_147681 ?auto_147684 ) ) ( not ( = ?auto_147681 ?auto_147685 ) ) ( not ( = ?auto_147681 ?auto_147686 ) ) ( not ( = ?auto_147681 ?auto_147687 ) ) ( not ( = ?auto_147682 ?auto_147683 ) ) ( not ( = ?auto_147682 ?auto_147684 ) ) ( not ( = ?auto_147682 ?auto_147685 ) ) ( not ( = ?auto_147682 ?auto_147686 ) ) ( not ( = ?auto_147682 ?auto_147687 ) ) ( not ( = ?auto_147683 ?auto_147684 ) ) ( not ( = ?auto_147683 ?auto_147685 ) ) ( not ( = ?auto_147683 ?auto_147686 ) ) ( not ( = ?auto_147683 ?auto_147687 ) ) ( not ( = ?auto_147684 ?auto_147685 ) ) ( not ( = ?auto_147684 ?auto_147686 ) ) ( not ( = ?auto_147684 ?auto_147687 ) ) ( not ( = ?auto_147685 ?auto_147686 ) ) ( not ( = ?auto_147685 ?auto_147687 ) ) ( not ( = ?auto_147686 ?auto_147687 ) ) ( ON ?auto_147687 ?auto_147689 ) ( not ( = ?auto_147681 ?auto_147689 ) ) ( not ( = ?auto_147682 ?auto_147689 ) ) ( not ( = ?auto_147683 ?auto_147689 ) ) ( not ( = ?auto_147684 ?auto_147689 ) ) ( not ( = ?auto_147685 ?auto_147689 ) ) ( not ( = ?auto_147686 ?auto_147689 ) ) ( not ( = ?auto_147687 ?auto_147689 ) ) ( ON ?auto_147686 ?auto_147687 ) ( CLEAR ?auto_147686 ) ( ON-TABLE ?auto_147688 ) ( ON ?auto_147689 ?auto_147688 ) ( not ( = ?auto_147688 ?auto_147689 ) ) ( not ( = ?auto_147688 ?auto_147687 ) ) ( not ( = ?auto_147688 ?auto_147686 ) ) ( not ( = ?auto_147681 ?auto_147688 ) ) ( not ( = ?auto_147682 ?auto_147688 ) ) ( not ( = ?auto_147683 ?auto_147688 ) ) ( not ( = ?auto_147684 ?auto_147688 ) ) ( not ( = ?auto_147685 ?auto_147688 ) ) ( HOLDING ?auto_147685 ) ( CLEAR ?auto_147684 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147681 ?auto_147682 ?auto_147683 ?auto_147684 ?auto_147685 )
      ( MAKE-7PILE ?auto_147681 ?auto_147682 ?auto_147683 ?auto_147684 ?auto_147685 ?auto_147686 ?auto_147687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147690 - BLOCK
      ?auto_147691 - BLOCK
      ?auto_147692 - BLOCK
      ?auto_147693 - BLOCK
      ?auto_147694 - BLOCK
      ?auto_147695 - BLOCK
      ?auto_147696 - BLOCK
    )
    :vars
    (
      ?auto_147698 - BLOCK
      ?auto_147697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147690 ) ( ON ?auto_147691 ?auto_147690 ) ( ON ?auto_147692 ?auto_147691 ) ( ON ?auto_147693 ?auto_147692 ) ( not ( = ?auto_147690 ?auto_147691 ) ) ( not ( = ?auto_147690 ?auto_147692 ) ) ( not ( = ?auto_147690 ?auto_147693 ) ) ( not ( = ?auto_147690 ?auto_147694 ) ) ( not ( = ?auto_147690 ?auto_147695 ) ) ( not ( = ?auto_147690 ?auto_147696 ) ) ( not ( = ?auto_147691 ?auto_147692 ) ) ( not ( = ?auto_147691 ?auto_147693 ) ) ( not ( = ?auto_147691 ?auto_147694 ) ) ( not ( = ?auto_147691 ?auto_147695 ) ) ( not ( = ?auto_147691 ?auto_147696 ) ) ( not ( = ?auto_147692 ?auto_147693 ) ) ( not ( = ?auto_147692 ?auto_147694 ) ) ( not ( = ?auto_147692 ?auto_147695 ) ) ( not ( = ?auto_147692 ?auto_147696 ) ) ( not ( = ?auto_147693 ?auto_147694 ) ) ( not ( = ?auto_147693 ?auto_147695 ) ) ( not ( = ?auto_147693 ?auto_147696 ) ) ( not ( = ?auto_147694 ?auto_147695 ) ) ( not ( = ?auto_147694 ?auto_147696 ) ) ( not ( = ?auto_147695 ?auto_147696 ) ) ( ON ?auto_147696 ?auto_147698 ) ( not ( = ?auto_147690 ?auto_147698 ) ) ( not ( = ?auto_147691 ?auto_147698 ) ) ( not ( = ?auto_147692 ?auto_147698 ) ) ( not ( = ?auto_147693 ?auto_147698 ) ) ( not ( = ?auto_147694 ?auto_147698 ) ) ( not ( = ?auto_147695 ?auto_147698 ) ) ( not ( = ?auto_147696 ?auto_147698 ) ) ( ON ?auto_147695 ?auto_147696 ) ( ON-TABLE ?auto_147697 ) ( ON ?auto_147698 ?auto_147697 ) ( not ( = ?auto_147697 ?auto_147698 ) ) ( not ( = ?auto_147697 ?auto_147696 ) ) ( not ( = ?auto_147697 ?auto_147695 ) ) ( not ( = ?auto_147690 ?auto_147697 ) ) ( not ( = ?auto_147691 ?auto_147697 ) ) ( not ( = ?auto_147692 ?auto_147697 ) ) ( not ( = ?auto_147693 ?auto_147697 ) ) ( not ( = ?auto_147694 ?auto_147697 ) ) ( CLEAR ?auto_147693 ) ( ON ?auto_147694 ?auto_147695 ) ( CLEAR ?auto_147694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147697 ?auto_147698 ?auto_147696 ?auto_147695 )
      ( MAKE-7PILE ?auto_147690 ?auto_147691 ?auto_147692 ?auto_147693 ?auto_147694 ?auto_147695 ?auto_147696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147699 - BLOCK
      ?auto_147700 - BLOCK
      ?auto_147701 - BLOCK
      ?auto_147702 - BLOCK
      ?auto_147703 - BLOCK
      ?auto_147704 - BLOCK
      ?auto_147705 - BLOCK
    )
    :vars
    (
      ?auto_147707 - BLOCK
      ?auto_147706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147699 ) ( ON ?auto_147700 ?auto_147699 ) ( ON ?auto_147701 ?auto_147700 ) ( not ( = ?auto_147699 ?auto_147700 ) ) ( not ( = ?auto_147699 ?auto_147701 ) ) ( not ( = ?auto_147699 ?auto_147702 ) ) ( not ( = ?auto_147699 ?auto_147703 ) ) ( not ( = ?auto_147699 ?auto_147704 ) ) ( not ( = ?auto_147699 ?auto_147705 ) ) ( not ( = ?auto_147700 ?auto_147701 ) ) ( not ( = ?auto_147700 ?auto_147702 ) ) ( not ( = ?auto_147700 ?auto_147703 ) ) ( not ( = ?auto_147700 ?auto_147704 ) ) ( not ( = ?auto_147700 ?auto_147705 ) ) ( not ( = ?auto_147701 ?auto_147702 ) ) ( not ( = ?auto_147701 ?auto_147703 ) ) ( not ( = ?auto_147701 ?auto_147704 ) ) ( not ( = ?auto_147701 ?auto_147705 ) ) ( not ( = ?auto_147702 ?auto_147703 ) ) ( not ( = ?auto_147702 ?auto_147704 ) ) ( not ( = ?auto_147702 ?auto_147705 ) ) ( not ( = ?auto_147703 ?auto_147704 ) ) ( not ( = ?auto_147703 ?auto_147705 ) ) ( not ( = ?auto_147704 ?auto_147705 ) ) ( ON ?auto_147705 ?auto_147707 ) ( not ( = ?auto_147699 ?auto_147707 ) ) ( not ( = ?auto_147700 ?auto_147707 ) ) ( not ( = ?auto_147701 ?auto_147707 ) ) ( not ( = ?auto_147702 ?auto_147707 ) ) ( not ( = ?auto_147703 ?auto_147707 ) ) ( not ( = ?auto_147704 ?auto_147707 ) ) ( not ( = ?auto_147705 ?auto_147707 ) ) ( ON ?auto_147704 ?auto_147705 ) ( ON-TABLE ?auto_147706 ) ( ON ?auto_147707 ?auto_147706 ) ( not ( = ?auto_147706 ?auto_147707 ) ) ( not ( = ?auto_147706 ?auto_147705 ) ) ( not ( = ?auto_147706 ?auto_147704 ) ) ( not ( = ?auto_147699 ?auto_147706 ) ) ( not ( = ?auto_147700 ?auto_147706 ) ) ( not ( = ?auto_147701 ?auto_147706 ) ) ( not ( = ?auto_147702 ?auto_147706 ) ) ( not ( = ?auto_147703 ?auto_147706 ) ) ( ON ?auto_147703 ?auto_147704 ) ( CLEAR ?auto_147703 ) ( HOLDING ?auto_147702 ) ( CLEAR ?auto_147701 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147699 ?auto_147700 ?auto_147701 ?auto_147702 )
      ( MAKE-7PILE ?auto_147699 ?auto_147700 ?auto_147701 ?auto_147702 ?auto_147703 ?auto_147704 ?auto_147705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147708 - BLOCK
      ?auto_147709 - BLOCK
      ?auto_147710 - BLOCK
      ?auto_147711 - BLOCK
      ?auto_147712 - BLOCK
      ?auto_147713 - BLOCK
      ?auto_147714 - BLOCK
    )
    :vars
    (
      ?auto_147715 - BLOCK
      ?auto_147716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147708 ) ( ON ?auto_147709 ?auto_147708 ) ( ON ?auto_147710 ?auto_147709 ) ( not ( = ?auto_147708 ?auto_147709 ) ) ( not ( = ?auto_147708 ?auto_147710 ) ) ( not ( = ?auto_147708 ?auto_147711 ) ) ( not ( = ?auto_147708 ?auto_147712 ) ) ( not ( = ?auto_147708 ?auto_147713 ) ) ( not ( = ?auto_147708 ?auto_147714 ) ) ( not ( = ?auto_147709 ?auto_147710 ) ) ( not ( = ?auto_147709 ?auto_147711 ) ) ( not ( = ?auto_147709 ?auto_147712 ) ) ( not ( = ?auto_147709 ?auto_147713 ) ) ( not ( = ?auto_147709 ?auto_147714 ) ) ( not ( = ?auto_147710 ?auto_147711 ) ) ( not ( = ?auto_147710 ?auto_147712 ) ) ( not ( = ?auto_147710 ?auto_147713 ) ) ( not ( = ?auto_147710 ?auto_147714 ) ) ( not ( = ?auto_147711 ?auto_147712 ) ) ( not ( = ?auto_147711 ?auto_147713 ) ) ( not ( = ?auto_147711 ?auto_147714 ) ) ( not ( = ?auto_147712 ?auto_147713 ) ) ( not ( = ?auto_147712 ?auto_147714 ) ) ( not ( = ?auto_147713 ?auto_147714 ) ) ( ON ?auto_147714 ?auto_147715 ) ( not ( = ?auto_147708 ?auto_147715 ) ) ( not ( = ?auto_147709 ?auto_147715 ) ) ( not ( = ?auto_147710 ?auto_147715 ) ) ( not ( = ?auto_147711 ?auto_147715 ) ) ( not ( = ?auto_147712 ?auto_147715 ) ) ( not ( = ?auto_147713 ?auto_147715 ) ) ( not ( = ?auto_147714 ?auto_147715 ) ) ( ON ?auto_147713 ?auto_147714 ) ( ON-TABLE ?auto_147716 ) ( ON ?auto_147715 ?auto_147716 ) ( not ( = ?auto_147716 ?auto_147715 ) ) ( not ( = ?auto_147716 ?auto_147714 ) ) ( not ( = ?auto_147716 ?auto_147713 ) ) ( not ( = ?auto_147708 ?auto_147716 ) ) ( not ( = ?auto_147709 ?auto_147716 ) ) ( not ( = ?auto_147710 ?auto_147716 ) ) ( not ( = ?auto_147711 ?auto_147716 ) ) ( not ( = ?auto_147712 ?auto_147716 ) ) ( ON ?auto_147712 ?auto_147713 ) ( CLEAR ?auto_147710 ) ( ON ?auto_147711 ?auto_147712 ) ( CLEAR ?auto_147711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147716 ?auto_147715 ?auto_147714 ?auto_147713 ?auto_147712 )
      ( MAKE-7PILE ?auto_147708 ?auto_147709 ?auto_147710 ?auto_147711 ?auto_147712 ?auto_147713 ?auto_147714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147717 - BLOCK
      ?auto_147718 - BLOCK
      ?auto_147719 - BLOCK
      ?auto_147720 - BLOCK
      ?auto_147721 - BLOCK
      ?auto_147722 - BLOCK
      ?auto_147723 - BLOCK
    )
    :vars
    (
      ?auto_147724 - BLOCK
      ?auto_147725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147717 ) ( ON ?auto_147718 ?auto_147717 ) ( not ( = ?auto_147717 ?auto_147718 ) ) ( not ( = ?auto_147717 ?auto_147719 ) ) ( not ( = ?auto_147717 ?auto_147720 ) ) ( not ( = ?auto_147717 ?auto_147721 ) ) ( not ( = ?auto_147717 ?auto_147722 ) ) ( not ( = ?auto_147717 ?auto_147723 ) ) ( not ( = ?auto_147718 ?auto_147719 ) ) ( not ( = ?auto_147718 ?auto_147720 ) ) ( not ( = ?auto_147718 ?auto_147721 ) ) ( not ( = ?auto_147718 ?auto_147722 ) ) ( not ( = ?auto_147718 ?auto_147723 ) ) ( not ( = ?auto_147719 ?auto_147720 ) ) ( not ( = ?auto_147719 ?auto_147721 ) ) ( not ( = ?auto_147719 ?auto_147722 ) ) ( not ( = ?auto_147719 ?auto_147723 ) ) ( not ( = ?auto_147720 ?auto_147721 ) ) ( not ( = ?auto_147720 ?auto_147722 ) ) ( not ( = ?auto_147720 ?auto_147723 ) ) ( not ( = ?auto_147721 ?auto_147722 ) ) ( not ( = ?auto_147721 ?auto_147723 ) ) ( not ( = ?auto_147722 ?auto_147723 ) ) ( ON ?auto_147723 ?auto_147724 ) ( not ( = ?auto_147717 ?auto_147724 ) ) ( not ( = ?auto_147718 ?auto_147724 ) ) ( not ( = ?auto_147719 ?auto_147724 ) ) ( not ( = ?auto_147720 ?auto_147724 ) ) ( not ( = ?auto_147721 ?auto_147724 ) ) ( not ( = ?auto_147722 ?auto_147724 ) ) ( not ( = ?auto_147723 ?auto_147724 ) ) ( ON ?auto_147722 ?auto_147723 ) ( ON-TABLE ?auto_147725 ) ( ON ?auto_147724 ?auto_147725 ) ( not ( = ?auto_147725 ?auto_147724 ) ) ( not ( = ?auto_147725 ?auto_147723 ) ) ( not ( = ?auto_147725 ?auto_147722 ) ) ( not ( = ?auto_147717 ?auto_147725 ) ) ( not ( = ?auto_147718 ?auto_147725 ) ) ( not ( = ?auto_147719 ?auto_147725 ) ) ( not ( = ?auto_147720 ?auto_147725 ) ) ( not ( = ?auto_147721 ?auto_147725 ) ) ( ON ?auto_147721 ?auto_147722 ) ( ON ?auto_147720 ?auto_147721 ) ( CLEAR ?auto_147720 ) ( HOLDING ?auto_147719 ) ( CLEAR ?auto_147718 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147717 ?auto_147718 ?auto_147719 )
      ( MAKE-7PILE ?auto_147717 ?auto_147718 ?auto_147719 ?auto_147720 ?auto_147721 ?auto_147722 ?auto_147723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147726 - BLOCK
      ?auto_147727 - BLOCK
      ?auto_147728 - BLOCK
      ?auto_147729 - BLOCK
      ?auto_147730 - BLOCK
      ?auto_147731 - BLOCK
      ?auto_147732 - BLOCK
    )
    :vars
    (
      ?auto_147734 - BLOCK
      ?auto_147733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147726 ) ( ON ?auto_147727 ?auto_147726 ) ( not ( = ?auto_147726 ?auto_147727 ) ) ( not ( = ?auto_147726 ?auto_147728 ) ) ( not ( = ?auto_147726 ?auto_147729 ) ) ( not ( = ?auto_147726 ?auto_147730 ) ) ( not ( = ?auto_147726 ?auto_147731 ) ) ( not ( = ?auto_147726 ?auto_147732 ) ) ( not ( = ?auto_147727 ?auto_147728 ) ) ( not ( = ?auto_147727 ?auto_147729 ) ) ( not ( = ?auto_147727 ?auto_147730 ) ) ( not ( = ?auto_147727 ?auto_147731 ) ) ( not ( = ?auto_147727 ?auto_147732 ) ) ( not ( = ?auto_147728 ?auto_147729 ) ) ( not ( = ?auto_147728 ?auto_147730 ) ) ( not ( = ?auto_147728 ?auto_147731 ) ) ( not ( = ?auto_147728 ?auto_147732 ) ) ( not ( = ?auto_147729 ?auto_147730 ) ) ( not ( = ?auto_147729 ?auto_147731 ) ) ( not ( = ?auto_147729 ?auto_147732 ) ) ( not ( = ?auto_147730 ?auto_147731 ) ) ( not ( = ?auto_147730 ?auto_147732 ) ) ( not ( = ?auto_147731 ?auto_147732 ) ) ( ON ?auto_147732 ?auto_147734 ) ( not ( = ?auto_147726 ?auto_147734 ) ) ( not ( = ?auto_147727 ?auto_147734 ) ) ( not ( = ?auto_147728 ?auto_147734 ) ) ( not ( = ?auto_147729 ?auto_147734 ) ) ( not ( = ?auto_147730 ?auto_147734 ) ) ( not ( = ?auto_147731 ?auto_147734 ) ) ( not ( = ?auto_147732 ?auto_147734 ) ) ( ON ?auto_147731 ?auto_147732 ) ( ON-TABLE ?auto_147733 ) ( ON ?auto_147734 ?auto_147733 ) ( not ( = ?auto_147733 ?auto_147734 ) ) ( not ( = ?auto_147733 ?auto_147732 ) ) ( not ( = ?auto_147733 ?auto_147731 ) ) ( not ( = ?auto_147726 ?auto_147733 ) ) ( not ( = ?auto_147727 ?auto_147733 ) ) ( not ( = ?auto_147728 ?auto_147733 ) ) ( not ( = ?auto_147729 ?auto_147733 ) ) ( not ( = ?auto_147730 ?auto_147733 ) ) ( ON ?auto_147730 ?auto_147731 ) ( ON ?auto_147729 ?auto_147730 ) ( CLEAR ?auto_147727 ) ( ON ?auto_147728 ?auto_147729 ) ( CLEAR ?auto_147728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147733 ?auto_147734 ?auto_147732 ?auto_147731 ?auto_147730 ?auto_147729 )
      ( MAKE-7PILE ?auto_147726 ?auto_147727 ?auto_147728 ?auto_147729 ?auto_147730 ?auto_147731 ?auto_147732 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147735 - BLOCK
      ?auto_147736 - BLOCK
      ?auto_147737 - BLOCK
      ?auto_147738 - BLOCK
      ?auto_147739 - BLOCK
      ?auto_147740 - BLOCK
      ?auto_147741 - BLOCK
    )
    :vars
    (
      ?auto_147743 - BLOCK
      ?auto_147742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147735 ) ( not ( = ?auto_147735 ?auto_147736 ) ) ( not ( = ?auto_147735 ?auto_147737 ) ) ( not ( = ?auto_147735 ?auto_147738 ) ) ( not ( = ?auto_147735 ?auto_147739 ) ) ( not ( = ?auto_147735 ?auto_147740 ) ) ( not ( = ?auto_147735 ?auto_147741 ) ) ( not ( = ?auto_147736 ?auto_147737 ) ) ( not ( = ?auto_147736 ?auto_147738 ) ) ( not ( = ?auto_147736 ?auto_147739 ) ) ( not ( = ?auto_147736 ?auto_147740 ) ) ( not ( = ?auto_147736 ?auto_147741 ) ) ( not ( = ?auto_147737 ?auto_147738 ) ) ( not ( = ?auto_147737 ?auto_147739 ) ) ( not ( = ?auto_147737 ?auto_147740 ) ) ( not ( = ?auto_147737 ?auto_147741 ) ) ( not ( = ?auto_147738 ?auto_147739 ) ) ( not ( = ?auto_147738 ?auto_147740 ) ) ( not ( = ?auto_147738 ?auto_147741 ) ) ( not ( = ?auto_147739 ?auto_147740 ) ) ( not ( = ?auto_147739 ?auto_147741 ) ) ( not ( = ?auto_147740 ?auto_147741 ) ) ( ON ?auto_147741 ?auto_147743 ) ( not ( = ?auto_147735 ?auto_147743 ) ) ( not ( = ?auto_147736 ?auto_147743 ) ) ( not ( = ?auto_147737 ?auto_147743 ) ) ( not ( = ?auto_147738 ?auto_147743 ) ) ( not ( = ?auto_147739 ?auto_147743 ) ) ( not ( = ?auto_147740 ?auto_147743 ) ) ( not ( = ?auto_147741 ?auto_147743 ) ) ( ON ?auto_147740 ?auto_147741 ) ( ON-TABLE ?auto_147742 ) ( ON ?auto_147743 ?auto_147742 ) ( not ( = ?auto_147742 ?auto_147743 ) ) ( not ( = ?auto_147742 ?auto_147741 ) ) ( not ( = ?auto_147742 ?auto_147740 ) ) ( not ( = ?auto_147735 ?auto_147742 ) ) ( not ( = ?auto_147736 ?auto_147742 ) ) ( not ( = ?auto_147737 ?auto_147742 ) ) ( not ( = ?auto_147738 ?auto_147742 ) ) ( not ( = ?auto_147739 ?auto_147742 ) ) ( ON ?auto_147739 ?auto_147740 ) ( ON ?auto_147738 ?auto_147739 ) ( ON ?auto_147737 ?auto_147738 ) ( CLEAR ?auto_147737 ) ( HOLDING ?auto_147736 ) ( CLEAR ?auto_147735 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147735 ?auto_147736 )
      ( MAKE-7PILE ?auto_147735 ?auto_147736 ?auto_147737 ?auto_147738 ?auto_147739 ?auto_147740 ?auto_147741 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147744 - BLOCK
      ?auto_147745 - BLOCK
      ?auto_147746 - BLOCK
      ?auto_147747 - BLOCK
      ?auto_147748 - BLOCK
      ?auto_147749 - BLOCK
      ?auto_147750 - BLOCK
    )
    :vars
    (
      ?auto_147752 - BLOCK
      ?auto_147751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147744 ) ( not ( = ?auto_147744 ?auto_147745 ) ) ( not ( = ?auto_147744 ?auto_147746 ) ) ( not ( = ?auto_147744 ?auto_147747 ) ) ( not ( = ?auto_147744 ?auto_147748 ) ) ( not ( = ?auto_147744 ?auto_147749 ) ) ( not ( = ?auto_147744 ?auto_147750 ) ) ( not ( = ?auto_147745 ?auto_147746 ) ) ( not ( = ?auto_147745 ?auto_147747 ) ) ( not ( = ?auto_147745 ?auto_147748 ) ) ( not ( = ?auto_147745 ?auto_147749 ) ) ( not ( = ?auto_147745 ?auto_147750 ) ) ( not ( = ?auto_147746 ?auto_147747 ) ) ( not ( = ?auto_147746 ?auto_147748 ) ) ( not ( = ?auto_147746 ?auto_147749 ) ) ( not ( = ?auto_147746 ?auto_147750 ) ) ( not ( = ?auto_147747 ?auto_147748 ) ) ( not ( = ?auto_147747 ?auto_147749 ) ) ( not ( = ?auto_147747 ?auto_147750 ) ) ( not ( = ?auto_147748 ?auto_147749 ) ) ( not ( = ?auto_147748 ?auto_147750 ) ) ( not ( = ?auto_147749 ?auto_147750 ) ) ( ON ?auto_147750 ?auto_147752 ) ( not ( = ?auto_147744 ?auto_147752 ) ) ( not ( = ?auto_147745 ?auto_147752 ) ) ( not ( = ?auto_147746 ?auto_147752 ) ) ( not ( = ?auto_147747 ?auto_147752 ) ) ( not ( = ?auto_147748 ?auto_147752 ) ) ( not ( = ?auto_147749 ?auto_147752 ) ) ( not ( = ?auto_147750 ?auto_147752 ) ) ( ON ?auto_147749 ?auto_147750 ) ( ON-TABLE ?auto_147751 ) ( ON ?auto_147752 ?auto_147751 ) ( not ( = ?auto_147751 ?auto_147752 ) ) ( not ( = ?auto_147751 ?auto_147750 ) ) ( not ( = ?auto_147751 ?auto_147749 ) ) ( not ( = ?auto_147744 ?auto_147751 ) ) ( not ( = ?auto_147745 ?auto_147751 ) ) ( not ( = ?auto_147746 ?auto_147751 ) ) ( not ( = ?auto_147747 ?auto_147751 ) ) ( not ( = ?auto_147748 ?auto_147751 ) ) ( ON ?auto_147748 ?auto_147749 ) ( ON ?auto_147747 ?auto_147748 ) ( ON ?auto_147746 ?auto_147747 ) ( CLEAR ?auto_147744 ) ( ON ?auto_147745 ?auto_147746 ) ( CLEAR ?auto_147745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147751 ?auto_147752 ?auto_147750 ?auto_147749 ?auto_147748 ?auto_147747 ?auto_147746 )
      ( MAKE-7PILE ?auto_147744 ?auto_147745 ?auto_147746 ?auto_147747 ?auto_147748 ?auto_147749 ?auto_147750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147753 - BLOCK
      ?auto_147754 - BLOCK
      ?auto_147755 - BLOCK
      ?auto_147756 - BLOCK
      ?auto_147757 - BLOCK
      ?auto_147758 - BLOCK
      ?auto_147759 - BLOCK
    )
    :vars
    (
      ?auto_147761 - BLOCK
      ?auto_147760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147753 ?auto_147754 ) ) ( not ( = ?auto_147753 ?auto_147755 ) ) ( not ( = ?auto_147753 ?auto_147756 ) ) ( not ( = ?auto_147753 ?auto_147757 ) ) ( not ( = ?auto_147753 ?auto_147758 ) ) ( not ( = ?auto_147753 ?auto_147759 ) ) ( not ( = ?auto_147754 ?auto_147755 ) ) ( not ( = ?auto_147754 ?auto_147756 ) ) ( not ( = ?auto_147754 ?auto_147757 ) ) ( not ( = ?auto_147754 ?auto_147758 ) ) ( not ( = ?auto_147754 ?auto_147759 ) ) ( not ( = ?auto_147755 ?auto_147756 ) ) ( not ( = ?auto_147755 ?auto_147757 ) ) ( not ( = ?auto_147755 ?auto_147758 ) ) ( not ( = ?auto_147755 ?auto_147759 ) ) ( not ( = ?auto_147756 ?auto_147757 ) ) ( not ( = ?auto_147756 ?auto_147758 ) ) ( not ( = ?auto_147756 ?auto_147759 ) ) ( not ( = ?auto_147757 ?auto_147758 ) ) ( not ( = ?auto_147757 ?auto_147759 ) ) ( not ( = ?auto_147758 ?auto_147759 ) ) ( ON ?auto_147759 ?auto_147761 ) ( not ( = ?auto_147753 ?auto_147761 ) ) ( not ( = ?auto_147754 ?auto_147761 ) ) ( not ( = ?auto_147755 ?auto_147761 ) ) ( not ( = ?auto_147756 ?auto_147761 ) ) ( not ( = ?auto_147757 ?auto_147761 ) ) ( not ( = ?auto_147758 ?auto_147761 ) ) ( not ( = ?auto_147759 ?auto_147761 ) ) ( ON ?auto_147758 ?auto_147759 ) ( ON-TABLE ?auto_147760 ) ( ON ?auto_147761 ?auto_147760 ) ( not ( = ?auto_147760 ?auto_147761 ) ) ( not ( = ?auto_147760 ?auto_147759 ) ) ( not ( = ?auto_147760 ?auto_147758 ) ) ( not ( = ?auto_147753 ?auto_147760 ) ) ( not ( = ?auto_147754 ?auto_147760 ) ) ( not ( = ?auto_147755 ?auto_147760 ) ) ( not ( = ?auto_147756 ?auto_147760 ) ) ( not ( = ?auto_147757 ?auto_147760 ) ) ( ON ?auto_147757 ?auto_147758 ) ( ON ?auto_147756 ?auto_147757 ) ( ON ?auto_147755 ?auto_147756 ) ( ON ?auto_147754 ?auto_147755 ) ( CLEAR ?auto_147754 ) ( HOLDING ?auto_147753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147753 )
      ( MAKE-7PILE ?auto_147753 ?auto_147754 ?auto_147755 ?auto_147756 ?auto_147757 ?auto_147758 ?auto_147759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_147762 - BLOCK
      ?auto_147763 - BLOCK
      ?auto_147764 - BLOCK
      ?auto_147765 - BLOCK
      ?auto_147766 - BLOCK
      ?auto_147767 - BLOCK
      ?auto_147768 - BLOCK
    )
    :vars
    (
      ?auto_147770 - BLOCK
      ?auto_147769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147762 ?auto_147763 ) ) ( not ( = ?auto_147762 ?auto_147764 ) ) ( not ( = ?auto_147762 ?auto_147765 ) ) ( not ( = ?auto_147762 ?auto_147766 ) ) ( not ( = ?auto_147762 ?auto_147767 ) ) ( not ( = ?auto_147762 ?auto_147768 ) ) ( not ( = ?auto_147763 ?auto_147764 ) ) ( not ( = ?auto_147763 ?auto_147765 ) ) ( not ( = ?auto_147763 ?auto_147766 ) ) ( not ( = ?auto_147763 ?auto_147767 ) ) ( not ( = ?auto_147763 ?auto_147768 ) ) ( not ( = ?auto_147764 ?auto_147765 ) ) ( not ( = ?auto_147764 ?auto_147766 ) ) ( not ( = ?auto_147764 ?auto_147767 ) ) ( not ( = ?auto_147764 ?auto_147768 ) ) ( not ( = ?auto_147765 ?auto_147766 ) ) ( not ( = ?auto_147765 ?auto_147767 ) ) ( not ( = ?auto_147765 ?auto_147768 ) ) ( not ( = ?auto_147766 ?auto_147767 ) ) ( not ( = ?auto_147766 ?auto_147768 ) ) ( not ( = ?auto_147767 ?auto_147768 ) ) ( ON ?auto_147768 ?auto_147770 ) ( not ( = ?auto_147762 ?auto_147770 ) ) ( not ( = ?auto_147763 ?auto_147770 ) ) ( not ( = ?auto_147764 ?auto_147770 ) ) ( not ( = ?auto_147765 ?auto_147770 ) ) ( not ( = ?auto_147766 ?auto_147770 ) ) ( not ( = ?auto_147767 ?auto_147770 ) ) ( not ( = ?auto_147768 ?auto_147770 ) ) ( ON ?auto_147767 ?auto_147768 ) ( ON-TABLE ?auto_147769 ) ( ON ?auto_147770 ?auto_147769 ) ( not ( = ?auto_147769 ?auto_147770 ) ) ( not ( = ?auto_147769 ?auto_147768 ) ) ( not ( = ?auto_147769 ?auto_147767 ) ) ( not ( = ?auto_147762 ?auto_147769 ) ) ( not ( = ?auto_147763 ?auto_147769 ) ) ( not ( = ?auto_147764 ?auto_147769 ) ) ( not ( = ?auto_147765 ?auto_147769 ) ) ( not ( = ?auto_147766 ?auto_147769 ) ) ( ON ?auto_147766 ?auto_147767 ) ( ON ?auto_147765 ?auto_147766 ) ( ON ?auto_147764 ?auto_147765 ) ( ON ?auto_147763 ?auto_147764 ) ( ON ?auto_147762 ?auto_147763 ) ( CLEAR ?auto_147762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147769 ?auto_147770 ?auto_147768 ?auto_147767 ?auto_147766 ?auto_147765 ?auto_147764 ?auto_147763 )
      ( MAKE-7PILE ?auto_147762 ?auto_147763 ?auto_147764 ?auto_147765 ?auto_147766 ?auto_147767 ?auto_147768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147772 - BLOCK
    )
    :vars
    (
      ?auto_147773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147773 ?auto_147772 ) ( CLEAR ?auto_147773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147772 ) ( not ( = ?auto_147772 ?auto_147773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147773 ?auto_147772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147774 - BLOCK
    )
    :vars
    (
      ?auto_147775 - BLOCK
      ?auto_147776 - BLOCK
      ?auto_147777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147775 ?auto_147774 ) ( CLEAR ?auto_147775 ) ( ON-TABLE ?auto_147774 ) ( not ( = ?auto_147774 ?auto_147775 ) ) ( HOLDING ?auto_147776 ) ( CLEAR ?auto_147777 ) ( not ( = ?auto_147774 ?auto_147776 ) ) ( not ( = ?auto_147774 ?auto_147777 ) ) ( not ( = ?auto_147775 ?auto_147776 ) ) ( not ( = ?auto_147775 ?auto_147777 ) ) ( not ( = ?auto_147776 ?auto_147777 ) ) )
    :subtasks
    ( ( !STACK ?auto_147776 ?auto_147777 )
      ( MAKE-1PILE ?auto_147774 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147778 - BLOCK
    )
    :vars
    (
      ?auto_147781 - BLOCK
      ?auto_147779 - BLOCK
      ?auto_147780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147781 ?auto_147778 ) ( ON-TABLE ?auto_147778 ) ( not ( = ?auto_147778 ?auto_147781 ) ) ( CLEAR ?auto_147779 ) ( not ( = ?auto_147778 ?auto_147780 ) ) ( not ( = ?auto_147778 ?auto_147779 ) ) ( not ( = ?auto_147781 ?auto_147780 ) ) ( not ( = ?auto_147781 ?auto_147779 ) ) ( not ( = ?auto_147780 ?auto_147779 ) ) ( ON ?auto_147780 ?auto_147781 ) ( CLEAR ?auto_147780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147778 ?auto_147781 )
      ( MAKE-1PILE ?auto_147778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147782 - BLOCK
    )
    :vars
    (
      ?auto_147783 - BLOCK
      ?auto_147784 - BLOCK
      ?auto_147785 - BLOCK
      ?auto_147787 - BLOCK
      ?auto_147789 - BLOCK
      ?auto_147790 - BLOCK
      ?auto_147788 - BLOCK
      ?auto_147786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147783 ?auto_147782 ) ( ON-TABLE ?auto_147782 ) ( not ( = ?auto_147782 ?auto_147783 ) ) ( not ( = ?auto_147782 ?auto_147784 ) ) ( not ( = ?auto_147782 ?auto_147785 ) ) ( not ( = ?auto_147783 ?auto_147784 ) ) ( not ( = ?auto_147783 ?auto_147785 ) ) ( not ( = ?auto_147784 ?auto_147785 ) ) ( ON ?auto_147784 ?auto_147783 ) ( CLEAR ?auto_147784 ) ( HOLDING ?auto_147785 ) ( CLEAR ?auto_147787 ) ( ON-TABLE ?auto_147789 ) ( ON ?auto_147790 ?auto_147789 ) ( ON ?auto_147788 ?auto_147790 ) ( ON ?auto_147786 ?auto_147788 ) ( ON ?auto_147787 ?auto_147786 ) ( not ( = ?auto_147789 ?auto_147790 ) ) ( not ( = ?auto_147789 ?auto_147788 ) ) ( not ( = ?auto_147789 ?auto_147786 ) ) ( not ( = ?auto_147789 ?auto_147787 ) ) ( not ( = ?auto_147789 ?auto_147785 ) ) ( not ( = ?auto_147790 ?auto_147788 ) ) ( not ( = ?auto_147790 ?auto_147786 ) ) ( not ( = ?auto_147790 ?auto_147787 ) ) ( not ( = ?auto_147790 ?auto_147785 ) ) ( not ( = ?auto_147788 ?auto_147786 ) ) ( not ( = ?auto_147788 ?auto_147787 ) ) ( not ( = ?auto_147788 ?auto_147785 ) ) ( not ( = ?auto_147786 ?auto_147787 ) ) ( not ( = ?auto_147786 ?auto_147785 ) ) ( not ( = ?auto_147787 ?auto_147785 ) ) ( not ( = ?auto_147782 ?auto_147787 ) ) ( not ( = ?auto_147782 ?auto_147789 ) ) ( not ( = ?auto_147782 ?auto_147790 ) ) ( not ( = ?auto_147782 ?auto_147788 ) ) ( not ( = ?auto_147782 ?auto_147786 ) ) ( not ( = ?auto_147783 ?auto_147787 ) ) ( not ( = ?auto_147783 ?auto_147789 ) ) ( not ( = ?auto_147783 ?auto_147790 ) ) ( not ( = ?auto_147783 ?auto_147788 ) ) ( not ( = ?auto_147783 ?auto_147786 ) ) ( not ( = ?auto_147784 ?auto_147787 ) ) ( not ( = ?auto_147784 ?auto_147789 ) ) ( not ( = ?auto_147784 ?auto_147790 ) ) ( not ( = ?auto_147784 ?auto_147788 ) ) ( not ( = ?auto_147784 ?auto_147786 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147789 ?auto_147790 ?auto_147788 ?auto_147786 ?auto_147787 ?auto_147785 )
      ( MAKE-1PILE ?auto_147782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147791 - BLOCK
    )
    :vars
    (
      ?auto_147795 - BLOCK
      ?auto_147794 - BLOCK
      ?auto_147793 - BLOCK
      ?auto_147797 - BLOCK
      ?auto_147798 - BLOCK
      ?auto_147792 - BLOCK
      ?auto_147799 - BLOCK
      ?auto_147796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147795 ?auto_147791 ) ( ON-TABLE ?auto_147791 ) ( not ( = ?auto_147791 ?auto_147795 ) ) ( not ( = ?auto_147791 ?auto_147794 ) ) ( not ( = ?auto_147791 ?auto_147793 ) ) ( not ( = ?auto_147795 ?auto_147794 ) ) ( not ( = ?auto_147795 ?auto_147793 ) ) ( not ( = ?auto_147794 ?auto_147793 ) ) ( ON ?auto_147794 ?auto_147795 ) ( CLEAR ?auto_147797 ) ( ON-TABLE ?auto_147798 ) ( ON ?auto_147792 ?auto_147798 ) ( ON ?auto_147799 ?auto_147792 ) ( ON ?auto_147796 ?auto_147799 ) ( ON ?auto_147797 ?auto_147796 ) ( not ( = ?auto_147798 ?auto_147792 ) ) ( not ( = ?auto_147798 ?auto_147799 ) ) ( not ( = ?auto_147798 ?auto_147796 ) ) ( not ( = ?auto_147798 ?auto_147797 ) ) ( not ( = ?auto_147798 ?auto_147793 ) ) ( not ( = ?auto_147792 ?auto_147799 ) ) ( not ( = ?auto_147792 ?auto_147796 ) ) ( not ( = ?auto_147792 ?auto_147797 ) ) ( not ( = ?auto_147792 ?auto_147793 ) ) ( not ( = ?auto_147799 ?auto_147796 ) ) ( not ( = ?auto_147799 ?auto_147797 ) ) ( not ( = ?auto_147799 ?auto_147793 ) ) ( not ( = ?auto_147796 ?auto_147797 ) ) ( not ( = ?auto_147796 ?auto_147793 ) ) ( not ( = ?auto_147797 ?auto_147793 ) ) ( not ( = ?auto_147791 ?auto_147797 ) ) ( not ( = ?auto_147791 ?auto_147798 ) ) ( not ( = ?auto_147791 ?auto_147792 ) ) ( not ( = ?auto_147791 ?auto_147799 ) ) ( not ( = ?auto_147791 ?auto_147796 ) ) ( not ( = ?auto_147795 ?auto_147797 ) ) ( not ( = ?auto_147795 ?auto_147798 ) ) ( not ( = ?auto_147795 ?auto_147792 ) ) ( not ( = ?auto_147795 ?auto_147799 ) ) ( not ( = ?auto_147795 ?auto_147796 ) ) ( not ( = ?auto_147794 ?auto_147797 ) ) ( not ( = ?auto_147794 ?auto_147798 ) ) ( not ( = ?auto_147794 ?auto_147792 ) ) ( not ( = ?auto_147794 ?auto_147799 ) ) ( not ( = ?auto_147794 ?auto_147796 ) ) ( ON ?auto_147793 ?auto_147794 ) ( CLEAR ?auto_147793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147791 ?auto_147795 ?auto_147794 )
      ( MAKE-1PILE ?auto_147791 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147800 - BLOCK
    )
    :vars
    (
      ?auto_147805 - BLOCK
      ?auto_147807 - BLOCK
      ?auto_147808 - BLOCK
      ?auto_147803 - BLOCK
      ?auto_147802 - BLOCK
      ?auto_147804 - BLOCK
      ?auto_147806 - BLOCK
      ?auto_147801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147805 ?auto_147800 ) ( ON-TABLE ?auto_147800 ) ( not ( = ?auto_147800 ?auto_147805 ) ) ( not ( = ?auto_147800 ?auto_147807 ) ) ( not ( = ?auto_147800 ?auto_147808 ) ) ( not ( = ?auto_147805 ?auto_147807 ) ) ( not ( = ?auto_147805 ?auto_147808 ) ) ( not ( = ?auto_147807 ?auto_147808 ) ) ( ON ?auto_147807 ?auto_147805 ) ( ON-TABLE ?auto_147803 ) ( ON ?auto_147802 ?auto_147803 ) ( ON ?auto_147804 ?auto_147802 ) ( ON ?auto_147806 ?auto_147804 ) ( not ( = ?auto_147803 ?auto_147802 ) ) ( not ( = ?auto_147803 ?auto_147804 ) ) ( not ( = ?auto_147803 ?auto_147806 ) ) ( not ( = ?auto_147803 ?auto_147801 ) ) ( not ( = ?auto_147803 ?auto_147808 ) ) ( not ( = ?auto_147802 ?auto_147804 ) ) ( not ( = ?auto_147802 ?auto_147806 ) ) ( not ( = ?auto_147802 ?auto_147801 ) ) ( not ( = ?auto_147802 ?auto_147808 ) ) ( not ( = ?auto_147804 ?auto_147806 ) ) ( not ( = ?auto_147804 ?auto_147801 ) ) ( not ( = ?auto_147804 ?auto_147808 ) ) ( not ( = ?auto_147806 ?auto_147801 ) ) ( not ( = ?auto_147806 ?auto_147808 ) ) ( not ( = ?auto_147801 ?auto_147808 ) ) ( not ( = ?auto_147800 ?auto_147801 ) ) ( not ( = ?auto_147800 ?auto_147803 ) ) ( not ( = ?auto_147800 ?auto_147802 ) ) ( not ( = ?auto_147800 ?auto_147804 ) ) ( not ( = ?auto_147800 ?auto_147806 ) ) ( not ( = ?auto_147805 ?auto_147801 ) ) ( not ( = ?auto_147805 ?auto_147803 ) ) ( not ( = ?auto_147805 ?auto_147802 ) ) ( not ( = ?auto_147805 ?auto_147804 ) ) ( not ( = ?auto_147805 ?auto_147806 ) ) ( not ( = ?auto_147807 ?auto_147801 ) ) ( not ( = ?auto_147807 ?auto_147803 ) ) ( not ( = ?auto_147807 ?auto_147802 ) ) ( not ( = ?auto_147807 ?auto_147804 ) ) ( not ( = ?auto_147807 ?auto_147806 ) ) ( ON ?auto_147808 ?auto_147807 ) ( CLEAR ?auto_147808 ) ( HOLDING ?auto_147801 ) ( CLEAR ?auto_147806 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147803 ?auto_147802 ?auto_147804 ?auto_147806 ?auto_147801 )
      ( MAKE-1PILE ?auto_147800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147809 - BLOCK
    )
    :vars
    (
      ?auto_147810 - BLOCK
      ?auto_147811 - BLOCK
      ?auto_147814 - BLOCK
      ?auto_147816 - BLOCK
      ?auto_147817 - BLOCK
      ?auto_147815 - BLOCK
      ?auto_147813 - BLOCK
      ?auto_147812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147810 ?auto_147809 ) ( ON-TABLE ?auto_147809 ) ( not ( = ?auto_147809 ?auto_147810 ) ) ( not ( = ?auto_147809 ?auto_147811 ) ) ( not ( = ?auto_147809 ?auto_147814 ) ) ( not ( = ?auto_147810 ?auto_147811 ) ) ( not ( = ?auto_147810 ?auto_147814 ) ) ( not ( = ?auto_147811 ?auto_147814 ) ) ( ON ?auto_147811 ?auto_147810 ) ( ON-TABLE ?auto_147816 ) ( ON ?auto_147817 ?auto_147816 ) ( ON ?auto_147815 ?auto_147817 ) ( ON ?auto_147813 ?auto_147815 ) ( not ( = ?auto_147816 ?auto_147817 ) ) ( not ( = ?auto_147816 ?auto_147815 ) ) ( not ( = ?auto_147816 ?auto_147813 ) ) ( not ( = ?auto_147816 ?auto_147812 ) ) ( not ( = ?auto_147816 ?auto_147814 ) ) ( not ( = ?auto_147817 ?auto_147815 ) ) ( not ( = ?auto_147817 ?auto_147813 ) ) ( not ( = ?auto_147817 ?auto_147812 ) ) ( not ( = ?auto_147817 ?auto_147814 ) ) ( not ( = ?auto_147815 ?auto_147813 ) ) ( not ( = ?auto_147815 ?auto_147812 ) ) ( not ( = ?auto_147815 ?auto_147814 ) ) ( not ( = ?auto_147813 ?auto_147812 ) ) ( not ( = ?auto_147813 ?auto_147814 ) ) ( not ( = ?auto_147812 ?auto_147814 ) ) ( not ( = ?auto_147809 ?auto_147812 ) ) ( not ( = ?auto_147809 ?auto_147816 ) ) ( not ( = ?auto_147809 ?auto_147817 ) ) ( not ( = ?auto_147809 ?auto_147815 ) ) ( not ( = ?auto_147809 ?auto_147813 ) ) ( not ( = ?auto_147810 ?auto_147812 ) ) ( not ( = ?auto_147810 ?auto_147816 ) ) ( not ( = ?auto_147810 ?auto_147817 ) ) ( not ( = ?auto_147810 ?auto_147815 ) ) ( not ( = ?auto_147810 ?auto_147813 ) ) ( not ( = ?auto_147811 ?auto_147812 ) ) ( not ( = ?auto_147811 ?auto_147816 ) ) ( not ( = ?auto_147811 ?auto_147817 ) ) ( not ( = ?auto_147811 ?auto_147815 ) ) ( not ( = ?auto_147811 ?auto_147813 ) ) ( ON ?auto_147814 ?auto_147811 ) ( CLEAR ?auto_147813 ) ( ON ?auto_147812 ?auto_147814 ) ( CLEAR ?auto_147812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147809 ?auto_147810 ?auto_147811 ?auto_147814 )
      ( MAKE-1PILE ?auto_147809 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147818 - BLOCK
    )
    :vars
    (
      ?auto_147823 - BLOCK
      ?auto_147822 - BLOCK
      ?auto_147826 - BLOCK
      ?auto_147820 - BLOCK
      ?auto_147821 - BLOCK
      ?auto_147825 - BLOCK
      ?auto_147819 - BLOCK
      ?auto_147824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147823 ?auto_147818 ) ( ON-TABLE ?auto_147818 ) ( not ( = ?auto_147818 ?auto_147823 ) ) ( not ( = ?auto_147818 ?auto_147822 ) ) ( not ( = ?auto_147818 ?auto_147826 ) ) ( not ( = ?auto_147823 ?auto_147822 ) ) ( not ( = ?auto_147823 ?auto_147826 ) ) ( not ( = ?auto_147822 ?auto_147826 ) ) ( ON ?auto_147822 ?auto_147823 ) ( ON-TABLE ?auto_147820 ) ( ON ?auto_147821 ?auto_147820 ) ( ON ?auto_147825 ?auto_147821 ) ( not ( = ?auto_147820 ?auto_147821 ) ) ( not ( = ?auto_147820 ?auto_147825 ) ) ( not ( = ?auto_147820 ?auto_147819 ) ) ( not ( = ?auto_147820 ?auto_147824 ) ) ( not ( = ?auto_147820 ?auto_147826 ) ) ( not ( = ?auto_147821 ?auto_147825 ) ) ( not ( = ?auto_147821 ?auto_147819 ) ) ( not ( = ?auto_147821 ?auto_147824 ) ) ( not ( = ?auto_147821 ?auto_147826 ) ) ( not ( = ?auto_147825 ?auto_147819 ) ) ( not ( = ?auto_147825 ?auto_147824 ) ) ( not ( = ?auto_147825 ?auto_147826 ) ) ( not ( = ?auto_147819 ?auto_147824 ) ) ( not ( = ?auto_147819 ?auto_147826 ) ) ( not ( = ?auto_147824 ?auto_147826 ) ) ( not ( = ?auto_147818 ?auto_147824 ) ) ( not ( = ?auto_147818 ?auto_147820 ) ) ( not ( = ?auto_147818 ?auto_147821 ) ) ( not ( = ?auto_147818 ?auto_147825 ) ) ( not ( = ?auto_147818 ?auto_147819 ) ) ( not ( = ?auto_147823 ?auto_147824 ) ) ( not ( = ?auto_147823 ?auto_147820 ) ) ( not ( = ?auto_147823 ?auto_147821 ) ) ( not ( = ?auto_147823 ?auto_147825 ) ) ( not ( = ?auto_147823 ?auto_147819 ) ) ( not ( = ?auto_147822 ?auto_147824 ) ) ( not ( = ?auto_147822 ?auto_147820 ) ) ( not ( = ?auto_147822 ?auto_147821 ) ) ( not ( = ?auto_147822 ?auto_147825 ) ) ( not ( = ?auto_147822 ?auto_147819 ) ) ( ON ?auto_147826 ?auto_147822 ) ( ON ?auto_147824 ?auto_147826 ) ( CLEAR ?auto_147824 ) ( HOLDING ?auto_147819 ) ( CLEAR ?auto_147825 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147820 ?auto_147821 ?auto_147825 ?auto_147819 )
      ( MAKE-1PILE ?auto_147818 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147827 - BLOCK
    )
    :vars
    (
      ?auto_147833 - BLOCK
      ?auto_147832 - BLOCK
      ?auto_147829 - BLOCK
      ?auto_147835 - BLOCK
      ?auto_147831 - BLOCK
      ?auto_147834 - BLOCK
      ?auto_147828 - BLOCK
      ?auto_147830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147833 ?auto_147827 ) ( ON-TABLE ?auto_147827 ) ( not ( = ?auto_147827 ?auto_147833 ) ) ( not ( = ?auto_147827 ?auto_147832 ) ) ( not ( = ?auto_147827 ?auto_147829 ) ) ( not ( = ?auto_147833 ?auto_147832 ) ) ( not ( = ?auto_147833 ?auto_147829 ) ) ( not ( = ?auto_147832 ?auto_147829 ) ) ( ON ?auto_147832 ?auto_147833 ) ( ON-TABLE ?auto_147835 ) ( ON ?auto_147831 ?auto_147835 ) ( ON ?auto_147834 ?auto_147831 ) ( not ( = ?auto_147835 ?auto_147831 ) ) ( not ( = ?auto_147835 ?auto_147834 ) ) ( not ( = ?auto_147835 ?auto_147828 ) ) ( not ( = ?auto_147835 ?auto_147830 ) ) ( not ( = ?auto_147835 ?auto_147829 ) ) ( not ( = ?auto_147831 ?auto_147834 ) ) ( not ( = ?auto_147831 ?auto_147828 ) ) ( not ( = ?auto_147831 ?auto_147830 ) ) ( not ( = ?auto_147831 ?auto_147829 ) ) ( not ( = ?auto_147834 ?auto_147828 ) ) ( not ( = ?auto_147834 ?auto_147830 ) ) ( not ( = ?auto_147834 ?auto_147829 ) ) ( not ( = ?auto_147828 ?auto_147830 ) ) ( not ( = ?auto_147828 ?auto_147829 ) ) ( not ( = ?auto_147830 ?auto_147829 ) ) ( not ( = ?auto_147827 ?auto_147830 ) ) ( not ( = ?auto_147827 ?auto_147835 ) ) ( not ( = ?auto_147827 ?auto_147831 ) ) ( not ( = ?auto_147827 ?auto_147834 ) ) ( not ( = ?auto_147827 ?auto_147828 ) ) ( not ( = ?auto_147833 ?auto_147830 ) ) ( not ( = ?auto_147833 ?auto_147835 ) ) ( not ( = ?auto_147833 ?auto_147831 ) ) ( not ( = ?auto_147833 ?auto_147834 ) ) ( not ( = ?auto_147833 ?auto_147828 ) ) ( not ( = ?auto_147832 ?auto_147830 ) ) ( not ( = ?auto_147832 ?auto_147835 ) ) ( not ( = ?auto_147832 ?auto_147831 ) ) ( not ( = ?auto_147832 ?auto_147834 ) ) ( not ( = ?auto_147832 ?auto_147828 ) ) ( ON ?auto_147829 ?auto_147832 ) ( ON ?auto_147830 ?auto_147829 ) ( CLEAR ?auto_147834 ) ( ON ?auto_147828 ?auto_147830 ) ( CLEAR ?auto_147828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147827 ?auto_147833 ?auto_147832 ?auto_147829 ?auto_147830 )
      ( MAKE-1PILE ?auto_147827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147836 - BLOCK
    )
    :vars
    (
      ?auto_147837 - BLOCK
      ?auto_147839 - BLOCK
      ?auto_147838 - BLOCK
      ?auto_147844 - BLOCK
      ?auto_147843 - BLOCK
      ?auto_147842 - BLOCK
      ?auto_147841 - BLOCK
      ?auto_147840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147837 ?auto_147836 ) ( ON-TABLE ?auto_147836 ) ( not ( = ?auto_147836 ?auto_147837 ) ) ( not ( = ?auto_147836 ?auto_147839 ) ) ( not ( = ?auto_147836 ?auto_147838 ) ) ( not ( = ?auto_147837 ?auto_147839 ) ) ( not ( = ?auto_147837 ?auto_147838 ) ) ( not ( = ?auto_147839 ?auto_147838 ) ) ( ON ?auto_147839 ?auto_147837 ) ( ON-TABLE ?auto_147844 ) ( ON ?auto_147843 ?auto_147844 ) ( not ( = ?auto_147844 ?auto_147843 ) ) ( not ( = ?auto_147844 ?auto_147842 ) ) ( not ( = ?auto_147844 ?auto_147841 ) ) ( not ( = ?auto_147844 ?auto_147840 ) ) ( not ( = ?auto_147844 ?auto_147838 ) ) ( not ( = ?auto_147843 ?auto_147842 ) ) ( not ( = ?auto_147843 ?auto_147841 ) ) ( not ( = ?auto_147843 ?auto_147840 ) ) ( not ( = ?auto_147843 ?auto_147838 ) ) ( not ( = ?auto_147842 ?auto_147841 ) ) ( not ( = ?auto_147842 ?auto_147840 ) ) ( not ( = ?auto_147842 ?auto_147838 ) ) ( not ( = ?auto_147841 ?auto_147840 ) ) ( not ( = ?auto_147841 ?auto_147838 ) ) ( not ( = ?auto_147840 ?auto_147838 ) ) ( not ( = ?auto_147836 ?auto_147840 ) ) ( not ( = ?auto_147836 ?auto_147844 ) ) ( not ( = ?auto_147836 ?auto_147843 ) ) ( not ( = ?auto_147836 ?auto_147842 ) ) ( not ( = ?auto_147836 ?auto_147841 ) ) ( not ( = ?auto_147837 ?auto_147840 ) ) ( not ( = ?auto_147837 ?auto_147844 ) ) ( not ( = ?auto_147837 ?auto_147843 ) ) ( not ( = ?auto_147837 ?auto_147842 ) ) ( not ( = ?auto_147837 ?auto_147841 ) ) ( not ( = ?auto_147839 ?auto_147840 ) ) ( not ( = ?auto_147839 ?auto_147844 ) ) ( not ( = ?auto_147839 ?auto_147843 ) ) ( not ( = ?auto_147839 ?auto_147842 ) ) ( not ( = ?auto_147839 ?auto_147841 ) ) ( ON ?auto_147838 ?auto_147839 ) ( ON ?auto_147840 ?auto_147838 ) ( ON ?auto_147841 ?auto_147840 ) ( CLEAR ?auto_147841 ) ( HOLDING ?auto_147842 ) ( CLEAR ?auto_147843 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147844 ?auto_147843 ?auto_147842 )
      ( MAKE-1PILE ?auto_147836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147845 - BLOCK
    )
    :vars
    (
      ?auto_147853 - BLOCK
      ?auto_147851 - BLOCK
      ?auto_147846 - BLOCK
      ?auto_147850 - BLOCK
      ?auto_147852 - BLOCK
      ?auto_147847 - BLOCK
      ?auto_147848 - BLOCK
      ?auto_147849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147853 ?auto_147845 ) ( ON-TABLE ?auto_147845 ) ( not ( = ?auto_147845 ?auto_147853 ) ) ( not ( = ?auto_147845 ?auto_147851 ) ) ( not ( = ?auto_147845 ?auto_147846 ) ) ( not ( = ?auto_147853 ?auto_147851 ) ) ( not ( = ?auto_147853 ?auto_147846 ) ) ( not ( = ?auto_147851 ?auto_147846 ) ) ( ON ?auto_147851 ?auto_147853 ) ( ON-TABLE ?auto_147850 ) ( ON ?auto_147852 ?auto_147850 ) ( not ( = ?auto_147850 ?auto_147852 ) ) ( not ( = ?auto_147850 ?auto_147847 ) ) ( not ( = ?auto_147850 ?auto_147848 ) ) ( not ( = ?auto_147850 ?auto_147849 ) ) ( not ( = ?auto_147850 ?auto_147846 ) ) ( not ( = ?auto_147852 ?auto_147847 ) ) ( not ( = ?auto_147852 ?auto_147848 ) ) ( not ( = ?auto_147852 ?auto_147849 ) ) ( not ( = ?auto_147852 ?auto_147846 ) ) ( not ( = ?auto_147847 ?auto_147848 ) ) ( not ( = ?auto_147847 ?auto_147849 ) ) ( not ( = ?auto_147847 ?auto_147846 ) ) ( not ( = ?auto_147848 ?auto_147849 ) ) ( not ( = ?auto_147848 ?auto_147846 ) ) ( not ( = ?auto_147849 ?auto_147846 ) ) ( not ( = ?auto_147845 ?auto_147849 ) ) ( not ( = ?auto_147845 ?auto_147850 ) ) ( not ( = ?auto_147845 ?auto_147852 ) ) ( not ( = ?auto_147845 ?auto_147847 ) ) ( not ( = ?auto_147845 ?auto_147848 ) ) ( not ( = ?auto_147853 ?auto_147849 ) ) ( not ( = ?auto_147853 ?auto_147850 ) ) ( not ( = ?auto_147853 ?auto_147852 ) ) ( not ( = ?auto_147853 ?auto_147847 ) ) ( not ( = ?auto_147853 ?auto_147848 ) ) ( not ( = ?auto_147851 ?auto_147849 ) ) ( not ( = ?auto_147851 ?auto_147850 ) ) ( not ( = ?auto_147851 ?auto_147852 ) ) ( not ( = ?auto_147851 ?auto_147847 ) ) ( not ( = ?auto_147851 ?auto_147848 ) ) ( ON ?auto_147846 ?auto_147851 ) ( ON ?auto_147849 ?auto_147846 ) ( ON ?auto_147848 ?auto_147849 ) ( CLEAR ?auto_147852 ) ( ON ?auto_147847 ?auto_147848 ) ( CLEAR ?auto_147847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147845 ?auto_147853 ?auto_147851 ?auto_147846 ?auto_147849 ?auto_147848 )
      ( MAKE-1PILE ?auto_147845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147854 - BLOCK
    )
    :vars
    (
      ?auto_147862 - BLOCK
      ?auto_147861 - BLOCK
      ?auto_147860 - BLOCK
      ?auto_147859 - BLOCK
      ?auto_147855 - BLOCK
      ?auto_147858 - BLOCK
      ?auto_147856 - BLOCK
      ?auto_147857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147862 ?auto_147854 ) ( ON-TABLE ?auto_147854 ) ( not ( = ?auto_147854 ?auto_147862 ) ) ( not ( = ?auto_147854 ?auto_147861 ) ) ( not ( = ?auto_147854 ?auto_147860 ) ) ( not ( = ?auto_147862 ?auto_147861 ) ) ( not ( = ?auto_147862 ?auto_147860 ) ) ( not ( = ?auto_147861 ?auto_147860 ) ) ( ON ?auto_147861 ?auto_147862 ) ( ON-TABLE ?auto_147859 ) ( not ( = ?auto_147859 ?auto_147855 ) ) ( not ( = ?auto_147859 ?auto_147858 ) ) ( not ( = ?auto_147859 ?auto_147856 ) ) ( not ( = ?auto_147859 ?auto_147857 ) ) ( not ( = ?auto_147859 ?auto_147860 ) ) ( not ( = ?auto_147855 ?auto_147858 ) ) ( not ( = ?auto_147855 ?auto_147856 ) ) ( not ( = ?auto_147855 ?auto_147857 ) ) ( not ( = ?auto_147855 ?auto_147860 ) ) ( not ( = ?auto_147858 ?auto_147856 ) ) ( not ( = ?auto_147858 ?auto_147857 ) ) ( not ( = ?auto_147858 ?auto_147860 ) ) ( not ( = ?auto_147856 ?auto_147857 ) ) ( not ( = ?auto_147856 ?auto_147860 ) ) ( not ( = ?auto_147857 ?auto_147860 ) ) ( not ( = ?auto_147854 ?auto_147857 ) ) ( not ( = ?auto_147854 ?auto_147859 ) ) ( not ( = ?auto_147854 ?auto_147855 ) ) ( not ( = ?auto_147854 ?auto_147858 ) ) ( not ( = ?auto_147854 ?auto_147856 ) ) ( not ( = ?auto_147862 ?auto_147857 ) ) ( not ( = ?auto_147862 ?auto_147859 ) ) ( not ( = ?auto_147862 ?auto_147855 ) ) ( not ( = ?auto_147862 ?auto_147858 ) ) ( not ( = ?auto_147862 ?auto_147856 ) ) ( not ( = ?auto_147861 ?auto_147857 ) ) ( not ( = ?auto_147861 ?auto_147859 ) ) ( not ( = ?auto_147861 ?auto_147855 ) ) ( not ( = ?auto_147861 ?auto_147858 ) ) ( not ( = ?auto_147861 ?auto_147856 ) ) ( ON ?auto_147860 ?auto_147861 ) ( ON ?auto_147857 ?auto_147860 ) ( ON ?auto_147856 ?auto_147857 ) ( ON ?auto_147858 ?auto_147856 ) ( CLEAR ?auto_147858 ) ( HOLDING ?auto_147855 ) ( CLEAR ?auto_147859 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147859 ?auto_147855 )
      ( MAKE-1PILE ?auto_147854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150033 - BLOCK
    )
    :vars
    (
      ?auto_150037 - BLOCK
      ?auto_150038 - BLOCK
      ?auto_150035 - BLOCK
      ?auto_150034 - BLOCK
      ?auto_150036 - BLOCK
      ?auto_150039 - BLOCK
      ?auto_150040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150037 ?auto_150033 ) ( ON-TABLE ?auto_150033 ) ( not ( = ?auto_150033 ?auto_150037 ) ) ( not ( = ?auto_150033 ?auto_150038 ) ) ( not ( = ?auto_150033 ?auto_150035 ) ) ( not ( = ?auto_150037 ?auto_150038 ) ) ( not ( = ?auto_150037 ?auto_150035 ) ) ( not ( = ?auto_150038 ?auto_150035 ) ) ( ON ?auto_150038 ?auto_150037 ) ( not ( = ?auto_150034 ?auto_150036 ) ) ( not ( = ?auto_150034 ?auto_150039 ) ) ( not ( = ?auto_150034 ?auto_150040 ) ) ( not ( = ?auto_150034 ?auto_150035 ) ) ( not ( = ?auto_150036 ?auto_150039 ) ) ( not ( = ?auto_150036 ?auto_150040 ) ) ( not ( = ?auto_150036 ?auto_150035 ) ) ( not ( = ?auto_150039 ?auto_150040 ) ) ( not ( = ?auto_150039 ?auto_150035 ) ) ( not ( = ?auto_150040 ?auto_150035 ) ) ( not ( = ?auto_150033 ?auto_150040 ) ) ( not ( = ?auto_150033 ?auto_150034 ) ) ( not ( = ?auto_150033 ?auto_150036 ) ) ( not ( = ?auto_150033 ?auto_150039 ) ) ( not ( = ?auto_150037 ?auto_150040 ) ) ( not ( = ?auto_150037 ?auto_150034 ) ) ( not ( = ?auto_150037 ?auto_150036 ) ) ( not ( = ?auto_150037 ?auto_150039 ) ) ( not ( = ?auto_150038 ?auto_150040 ) ) ( not ( = ?auto_150038 ?auto_150034 ) ) ( not ( = ?auto_150038 ?auto_150036 ) ) ( not ( = ?auto_150038 ?auto_150039 ) ) ( ON ?auto_150035 ?auto_150038 ) ( ON ?auto_150040 ?auto_150035 ) ( ON ?auto_150039 ?auto_150040 ) ( ON ?auto_150036 ?auto_150039 ) ( ON ?auto_150034 ?auto_150036 ) ( CLEAR ?auto_150034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150033 ?auto_150037 ?auto_150038 ?auto_150035 ?auto_150040 ?auto_150039 ?auto_150036 )
      ( MAKE-1PILE ?auto_150033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147872 - BLOCK
    )
    :vars
    (
      ?auto_147875 - BLOCK
      ?auto_147874 - BLOCK
      ?auto_147877 - BLOCK
      ?auto_147876 - BLOCK
      ?auto_147880 - BLOCK
      ?auto_147878 - BLOCK
      ?auto_147879 - BLOCK
      ?auto_147873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147875 ?auto_147872 ) ( ON-TABLE ?auto_147872 ) ( not ( = ?auto_147872 ?auto_147875 ) ) ( not ( = ?auto_147872 ?auto_147874 ) ) ( not ( = ?auto_147872 ?auto_147877 ) ) ( not ( = ?auto_147875 ?auto_147874 ) ) ( not ( = ?auto_147875 ?auto_147877 ) ) ( not ( = ?auto_147874 ?auto_147877 ) ) ( ON ?auto_147874 ?auto_147875 ) ( not ( = ?auto_147876 ?auto_147880 ) ) ( not ( = ?auto_147876 ?auto_147878 ) ) ( not ( = ?auto_147876 ?auto_147879 ) ) ( not ( = ?auto_147876 ?auto_147873 ) ) ( not ( = ?auto_147876 ?auto_147877 ) ) ( not ( = ?auto_147880 ?auto_147878 ) ) ( not ( = ?auto_147880 ?auto_147879 ) ) ( not ( = ?auto_147880 ?auto_147873 ) ) ( not ( = ?auto_147880 ?auto_147877 ) ) ( not ( = ?auto_147878 ?auto_147879 ) ) ( not ( = ?auto_147878 ?auto_147873 ) ) ( not ( = ?auto_147878 ?auto_147877 ) ) ( not ( = ?auto_147879 ?auto_147873 ) ) ( not ( = ?auto_147879 ?auto_147877 ) ) ( not ( = ?auto_147873 ?auto_147877 ) ) ( not ( = ?auto_147872 ?auto_147873 ) ) ( not ( = ?auto_147872 ?auto_147876 ) ) ( not ( = ?auto_147872 ?auto_147880 ) ) ( not ( = ?auto_147872 ?auto_147878 ) ) ( not ( = ?auto_147872 ?auto_147879 ) ) ( not ( = ?auto_147875 ?auto_147873 ) ) ( not ( = ?auto_147875 ?auto_147876 ) ) ( not ( = ?auto_147875 ?auto_147880 ) ) ( not ( = ?auto_147875 ?auto_147878 ) ) ( not ( = ?auto_147875 ?auto_147879 ) ) ( not ( = ?auto_147874 ?auto_147873 ) ) ( not ( = ?auto_147874 ?auto_147876 ) ) ( not ( = ?auto_147874 ?auto_147880 ) ) ( not ( = ?auto_147874 ?auto_147878 ) ) ( not ( = ?auto_147874 ?auto_147879 ) ) ( ON ?auto_147877 ?auto_147874 ) ( ON ?auto_147873 ?auto_147877 ) ( ON ?auto_147879 ?auto_147873 ) ( ON ?auto_147878 ?auto_147879 ) ( ON ?auto_147880 ?auto_147878 ) ( CLEAR ?auto_147880 ) ( HOLDING ?auto_147876 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147876 )
      ( MAKE-1PILE ?auto_147872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147881 - BLOCK
    )
    :vars
    (
      ?auto_147888 - BLOCK
      ?auto_147889 - BLOCK
      ?auto_147882 - BLOCK
      ?auto_147886 - BLOCK
      ?auto_147884 - BLOCK
      ?auto_147885 - BLOCK
      ?auto_147883 - BLOCK
      ?auto_147887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147888 ?auto_147881 ) ( ON-TABLE ?auto_147881 ) ( not ( = ?auto_147881 ?auto_147888 ) ) ( not ( = ?auto_147881 ?auto_147889 ) ) ( not ( = ?auto_147881 ?auto_147882 ) ) ( not ( = ?auto_147888 ?auto_147889 ) ) ( not ( = ?auto_147888 ?auto_147882 ) ) ( not ( = ?auto_147889 ?auto_147882 ) ) ( ON ?auto_147889 ?auto_147888 ) ( not ( = ?auto_147886 ?auto_147884 ) ) ( not ( = ?auto_147886 ?auto_147885 ) ) ( not ( = ?auto_147886 ?auto_147883 ) ) ( not ( = ?auto_147886 ?auto_147887 ) ) ( not ( = ?auto_147886 ?auto_147882 ) ) ( not ( = ?auto_147884 ?auto_147885 ) ) ( not ( = ?auto_147884 ?auto_147883 ) ) ( not ( = ?auto_147884 ?auto_147887 ) ) ( not ( = ?auto_147884 ?auto_147882 ) ) ( not ( = ?auto_147885 ?auto_147883 ) ) ( not ( = ?auto_147885 ?auto_147887 ) ) ( not ( = ?auto_147885 ?auto_147882 ) ) ( not ( = ?auto_147883 ?auto_147887 ) ) ( not ( = ?auto_147883 ?auto_147882 ) ) ( not ( = ?auto_147887 ?auto_147882 ) ) ( not ( = ?auto_147881 ?auto_147887 ) ) ( not ( = ?auto_147881 ?auto_147886 ) ) ( not ( = ?auto_147881 ?auto_147884 ) ) ( not ( = ?auto_147881 ?auto_147885 ) ) ( not ( = ?auto_147881 ?auto_147883 ) ) ( not ( = ?auto_147888 ?auto_147887 ) ) ( not ( = ?auto_147888 ?auto_147886 ) ) ( not ( = ?auto_147888 ?auto_147884 ) ) ( not ( = ?auto_147888 ?auto_147885 ) ) ( not ( = ?auto_147888 ?auto_147883 ) ) ( not ( = ?auto_147889 ?auto_147887 ) ) ( not ( = ?auto_147889 ?auto_147886 ) ) ( not ( = ?auto_147889 ?auto_147884 ) ) ( not ( = ?auto_147889 ?auto_147885 ) ) ( not ( = ?auto_147889 ?auto_147883 ) ) ( ON ?auto_147882 ?auto_147889 ) ( ON ?auto_147887 ?auto_147882 ) ( ON ?auto_147883 ?auto_147887 ) ( ON ?auto_147885 ?auto_147883 ) ( ON ?auto_147884 ?auto_147885 ) ( ON ?auto_147886 ?auto_147884 ) ( CLEAR ?auto_147886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147881 ?auto_147888 ?auto_147889 ?auto_147882 ?auto_147887 ?auto_147883 ?auto_147885 ?auto_147884 )
      ( MAKE-1PILE ?auto_147881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147898 - BLOCK
      ?auto_147899 - BLOCK
      ?auto_147900 - BLOCK
      ?auto_147901 - BLOCK
      ?auto_147902 - BLOCK
      ?auto_147903 - BLOCK
      ?auto_147904 - BLOCK
      ?auto_147905 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147905 ) ( CLEAR ?auto_147904 ) ( ON-TABLE ?auto_147898 ) ( ON ?auto_147899 ?auto_147898 ) ( ON ?auto_147900 ?auto_147899 ) ( ON ?auto_147901 ?auto_147900 ) ( ON ?auto_147902 ?auto_147901 ) ( ON ?auto_147903 ?auto_147902 ) ( ON ?auto_147904 ?auto_147903 ) ( not ( = ?auto_147898 ?auto_147899 ) ) ( not ( = ?auto_147898 ?auto_147900 ) ) ( not ( = ?auto_147898 ?auto_147901 ) ) ( not ( = ?auto_147898 ?auto_147902 ) ) ( not ( = ?auto_147898 ?auto_147903 ) ) ( not ( = ?auto_147898 ?auto_147904 ) ) ( not ( = ?auto_147898 ?auto_147905 ) ) ( not ( = ?auto_147899 ?auto_147900 ) ) ( not ( = ?auto_147899 ?auto_147901 ) ) ( not ( = ?auto_147899 ?auto_147902 ) ) ( not ( = ?auto_147899 ?auto_147903 ) ) ( not ( = ?auto_147899 ?auto_147904 ) ) ( not ( = ?auto_147899 ?auto_147905 ) ) ( not ( = ?auto_147900 ?auto_147901 ) ) ( not ( = ?auto_147900 ?auto_147902 ) ) ( not ( = ?auto_147900 ?auto_147903 ) ) ( not ( = ?auto_147900 ?auto_147904 ) ) ( not ( = ?auto_147900 ?auto_147905 ) ) ( not ( = ?auto_147901 ?auto_147902 ) ) ( not ( = ?auto_147901 ?auto_147903 ) ) ( not ( = ?auto_147901 ?auto_147904 ) ) ( not ( = ?auto_147901 ?auto_147905 ) ) ( not ( = ?auto_147902 ?auto_147903 ) ) ( not ( = ?auto_147902 ?auto_147904 ) ) ( not ( = ?auto_147902 ?auto_147905 ) ) ( not ( = ?auto_147903 ?auto_147904 ) ) ( not ( = ?auto_147903 ?auto_147905 ) ) ( not ( = ?auto_147904 ?auto_147905 ) ) )
    :subtasks
    ( ( !STACK ?auto_147905 ?auto_147904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147906 - BLOCK
      ?auto_147907 - BLOCK
      ?auto_147908 - BLOCK
      ?auto_147909 - BLOCK
      ?auto_147910 - BLOCK
      ?auto_147911 - BLOCK
      ?auto_147912 - BLOCK
      ?auto_147913 - BLOCK
    )
    :vars
    (
      ?auto_147914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147912 ) ( ON-TABLE ?auto_147906 ) ( ON ?auto_147907 ?auto_147906 ) ( ON ?auto_147908 ?auto_147907 ) ( ON ?auto_147909 ?auto_147908 ) ( ON ?auto_147910 ?auto_147909 ) ( ON ?auto_147911 ?auto_147910 ) ( ON ?auto_147912 ?auto_147911 ) ( not ( = ?auto_147906 ?auto_147907 ) ) ( not ( = ?auto_147906 ?auto_147908 ) ) ( not ( = ?auto_147906 ?auto_147909 ) ) ( not ( = ?auto_147906 ?auto_147910 ) ) ( not ( = ?auto_147906 ?auto_147911 ) ) ( not ( = ?auto_147906 ?auto_147912 ) ) ( not ( = ?auto_147906 ?auto_147913 ) ) ( not ( = ?auto_147907 ?auto_147908 ) ) ( not ( = ?auto_147907 ?auto_147909 ) ) ( not ( = ?auto_147907 ?auto_147910 ) ) ( not ( = ?auto_147907 ?auto_147911 ) ) ( not ( = ?auto_147907 ?auto_147912 ) ) ( not ( = ?auto_147907 ?auto_147913 ) ) ( not ( = ?auto_147908 ?auto_147909 ) ) ( not ( = ?auto_147908 ?auto_147910 ) ) ( not ( = ?auto_147908 ?auto_147911 ) ) ( not ( = ?auto_147908 ?auto_147912 ) ) ( not ( = ?auto_147908 ?auto_147913 ) ) ( not ( = ?auto_147909 ?auto_147910 ) ) ( not ( = ?auto_147909 ?auto_147911 ) ) ( not ( = ?auto_147909 ?auto_147912 ) ) ( not ( = ?auto_147909 ?auto_147913 ) ) ( not ( = ?auto_147910 ?auto_147911 ) ) ( not ( = ?auto_147910 ?auto_147912 ) ) ( not ( = ?auto_147910 ?auto_147913 ) ) ( not ( = ?auto_147911 ?auto_147912 ) ) ( not ( = ?auto_147911 ?auto_147913 ) ) ( not ( = ?auto_147912 ?auto_147913 ) ) ( ON ?auto_147913 ?auto_147914 ) ( CLEAR ?auto_147913 ) ( HAND-EMPTY ) ( not ( = ?auto_147906 ?auto_147914 ) ) ( not ( = ?auto_147907 ?auto_147914 ) ) ( not ( = ?auto_147908 ?auto_147914 ) ) ( not ( = ?auto_147909 ?auto_147914 ) ) ( not ( = ?auto_147910 ?auto_147914 ) ) ( not ( = ?auto_147911 ?auto_147914 ) ) ( not ( = ?auto_147912 ?auto_147914 ) ) ( not ( = ?auto_147913 ?auto_147914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147913 ?auto_147914 )
      ( MAKE-8PILE ?auto_147906 ?auto_147907 ?auto_147908 ?auto_147909 ?auto_147910 ?auto_147911 ?auto_147912 ?auto_147913 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147915 - BLOCK
      ?auto_147916 - BLOCK
      ?auto_147917 - BLOCK
      ?auto_147918 - BLOCK
      ?auto_147919 - BLOCK
      ?auto_147920 - BLOCK
      ?auto_147921 - BLOCK
      ?auto_147922 - BLOCK
    )
    :vars
    (
      ?auto_147923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147915 ) ( ON ?auto_147916 ?auto_147915 ) ( ON ?auto_147917 ?auto_147916 ) ( ON ?auto_147918 ?auto_147917 ) ( ON ?auto_147919 ?auto_147918 ) ( ON ?auto_147920 ?auto_147919 ) ( not ( = ?auto_147915 ?auto_147916 ) ) ( not ( = ?auto_147915 ?auto_147917 ) ) ( not ( = ?auto_147915 ?auto_147918 ) ) ( not ( = ?auto_147915 ?auto_147919 ) ) ( not ( = ?auto_147915 ?auto_147920 ) ) ( not ( = ?auto_147915 ?auto_147921 ) ) ( not ( = ?auto_147915 ?auto_147922 ) ) ( not ( = ?auto_147916 ?auto_147917 ) ) ( not ( = ?auto_147916 ?auto_147918 ) ) ( not ( = ?auto_147916 ?auto_147919 ) ) ( not ( = ?auto_147916 ?auto_147920 ) ) ( not ( = ?auto_147916 ?auto_147921 ) ) ( not ( = ?auto_147916 ?auto_147922 ) ) ( not ( = ?auto_147917 ?auto_147918 ) ) ( not ( = ?auto_147917 ?auto_147919 ) ) ( not ( = ?auto_147917 ?auto_147920 ) ) ( not ( = ?auto_147917 ?auto_147921 ) ) ( not ( = ?auto_147917 ?auto_147922 ) ) ( not ( = ?auto_147918 ?auto_147919 ) ) ( not ( = ?auto_147918 ?auto_147920 ) ) ( not ( = ?auto_147918 ?auto_147921 ) ) ( not ( = ?auto_147918 ?auto_147922 ) ) ( not ( = ?auto_147919 ?auto_147920 ) ) ( not ( = ?auto_147919 ?auto_147921 ) ) ( not ( = ?auto_147919 ?auto_147922 ) ) ( not ( = ?auto_147920 ?auto_147921 ) ) ( not ( = ?auto_147920 ?auto_147922 ) ) ( not ( = ?auto_147921 ?auto_147922 ) ) ( ON ?auto_147922 ?auto_147923 ) ( CLEAR ?auto_147922 ) ( not ( = ?auto_147915 ?auto_147923 ) ) ( not ( = ?auto_147916 ?auto_147923 ) ) ( not ( = ?auto_147917 ?auto_147923 ) ) ( not ( = ?auto_147918 ?auto_147923 ) ) ( not ( = ?auto_147919 ?auto_147923 ) ) ( not ( = ?auto_147920 ?auto_147923 ) ) ( not ( = ?auto_147921 ?auto_147923 ) ) ( not ( = ?auto_147922 ?auto_147923 ) ) ( HOLDING ?auto_147921 ) ( CLEAR ?auto_147920 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147915 ?auto_147916 ?auto_147917 ?auto_147918 ?auto_147919 ?auto_147920 ?auto_147921 )
      ( MAKE-8PILE ?auto_147915 ?auto_147916 ?auto_147917 ?auto_147918 ?auto_147919 ?auto_147920 ?auto_147921 ?auto_147922 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147924 - BLOCK
      ?auto_147925 - BLOCK
      ?auto_147926 - BLOCK
      ?auto_147927 - BLOCK
      ?auto_147928 - BLOCK
      ?auto_147929 - BLOCK
      ?auto_147930 - BLOCK
      ?auto_147931 - BLOCK
    )
    :vars
    (
      ?auto_147932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147924 ) ( ON ?auto_147925 ?auto_147924 ) ( ON ?auto_147926 ?auto_147925 ) ( ON ?auto_147927 ?auto_147926 ) ( ON ?auto_147928 ?auto_147927 ) ( ON ?auto_147929 ?auto_147928 ) ( not ( = ?auto_147924 ?auto_147925 ) ) ( not ( = ?auto_147924 ?auto_147926 ) ) ( not ( = ?auto_147924 ?auto_147927 ) ) ( not ( = ?auto_147924 ?auto_147928 ) ) ( not ( = ?auto_147924 ?auto_147929 ) ) ( not ( = ?auto_147924 ?auto_147930 ) ) ( not ( = ?auto_147924 ?auto_147931 ) ) ( not ( = ?auto_147925 ?auto_147926 ) ) ( not ( = ?auto_147925 ?auto_147927 ) ) ( not ( = ?auto_147925 ?auto_147928 ) ) ( not ( = ?auto_147925 ?auto_147929 ) ) ( not ( = ?auto_147925 ?auto_147930 ) ) ( not ( = ?auto_147925 ?auto_147931 ) ) ( not ( = ?auto_147926 ?auto_147927 ) ) ( not ( = ?auto_147926 ?auto_147928 ) ) ( not ( = ?auto_147926 ?auto_147929 ) ) ( not ( = ?auto_147926 ?auto_147930 ) ) ( not ( = ?auto_147926 ?auto_147931 ) ) ( not ( = ?auto_147927 ?auto_147928 ) ) ( not ( = ?auto_147927 ?auto_147929 ) ) ( not ( = ?auto_147927 ?auto_147930 ) ) ( not ( = ?auto_147927 ?auto_147931 ) ) ( not ( = ?auto_147928 ?auto_147929 ) ) ( not ( = ?auto_147928 ?auto_147930 ) ) ( not ( = ?auto_147928 ?auto_147931 ) ) ( not ( = ?auto_147929 ?auto_147930 ) ) ( not ( = ?auto_147929 ?auto_147931 ) ) ( not ( = ?auto_147930 ?auto_147931 ) ) ( ON ?auto_147931 ?auto_147932 ) ( not ( = ?auto_147924 ?auto_147932 ) ) ( not ( = ?auto_147925 ?auto_147932 ) ) ( not ( = ?auto_147926 ?auto_147932 ) ) ( not ( = ?auto_147927 ?auto_147932 ) ) ( not ( = ?auto_147928 ?auto_147932 ) ) ( not ( = ?auto_147929 ?auto_147932 ) ) ( not ( = ?auto_147930 ?auto_147932 ) ) ( not ( = ?auto_147931 ?auto_147932 ) ) ( CLEAR ?auto_147929 ) ( ON ?auto_147930 ?auto_147931 ) ( CLEAR ?auto_147930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147932 ?auto_147931 )
      ( MAKE-8PILE ?auto_147924 ?auto_147925 ?auto_147926 ?auto_147927 ?auto_147928 ?auto_147929 ?auto_147930 ?auto_147931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147933 - BLOCK
      ?auto_147934 - BLOCK
      ?auto_147935 - BLOCK
      ?auto_147936 - BLOCK
      ?auto_147937 - BLOCK
      ?auto_147938 - BLOCK
      ?auto_147939 - BLOCK
      ?auto_147940 - BLOCK
    )
    :vars
    (
      ?auto_147941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147933 ) ( ON ?auto_147934 ?auto_147933 ) ( ON ?auto_147935 ?auto_147934 ) ( ON ?auto_147936 ?auto_147935 ) ( ON ?auto_147937 ?auto_147936 ) ( not ( = ?auto_147933 ?auto_147934 ) ) ( not ( = ?auto_147933 ?auto_147935 ) ) ( not ( = ?auto_147933 ?auto_147936 ) ) ( not ( = ?auto_147933 ?auto_147937 ) ) ( not ( = ?auto_147933 ?auto_147938 ) ) ( not ( = ?auto_147933 ?auto_147939 ) ) ( not ( = ?auto_147933 ?auto_147940 ) ) ( not ( = ?auto_147934 ?auto_147935 ) ) ( not ( = ?auto_147934 ?auto_147936 ) ) ( not ( = ?auto_147934 ?auto_147937 ) ) ( not ( = ?auto_147934 ?auto_147938 ) ) ( not ( = ?auto_147934 ?auto_147939 ) ) ( not ( = ?auto_147934 ?auto_147940 ) ) ( not ( = ?auto_147935 ?auto_147936 ) ) ( not ( = ?auto_147935 ?auto_147937 ) ) ( not ( = ?auto_147935 ?auto_147938 ) ) ( not ( = ?auto_147935 ?auto_147939 ) ) ( not ( = ?auto_147935 ?auto_147940 ) ) ( not ( = ?auto_147936 ?auto_147937 ) ) ( not ( = ?auto_147936 ?auto_147938 ) ) ( not ( = ?auto_147936 ?auto_147939 ) ) ( not ( = ?auto_147936 ?auto_147940 ) ) ( not ( = ?auto_147937 ?auto_147938 ) ) ( not ( = ?auto_147937 ?auto_147939 ) ) ( not ( = ?auto_147937 ?auto_147940 ) ) ( not ( = ?auto_147938 ?auto_147939 ) ) ( not ( = ?auto_147938 ?auto_147940 ) ) ( not ( = ?auto_147939 ?auto_147940 ) ) ( ON ?auto_147940 ?auto_147941 ) ( not ( = ?auto_147933 ?auto_147941 ) ) ( not ( = ?auto_147934 ?auto_147941 ) ) ( not ( = ?auto_147935 ?auto_147941 ) ) ( not ( = ?auto_147936 ?auto_147941 ) ) ( not ( = ?auto_147937 ?auto_147941 ) ) ( not ( = ?auto_147938 ?auto_147941 ) ) ( not ( = ?auto_147939 ?auto_147941 ) ) ( not ( = ?auto_147940 ?auto_147941 ) ) ( ON ?auto_147939 ?auto_147940 ) ( CLEAR ?auto_147939 ) ( ON-TABLE ?auto_147941 ) ( HOLDING ?auto_147938 ) ( CLEAR ?auto_147937 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147933 ?auto_147934 ?auto_147935 ?auto_147936 ?auto_147937 ?auto_147938 )
      ( MAKE-8PILE ?auto_147933 ?auto_147934 ?auto_147935 ?auto_147936 ?auto_147937 ?auto_147938 ?auto_147939 ?auto_147940 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147942 - BLOCK
      ?auto_147943 - BLOCK
      ?auto_147944 - BLOCK
      ?auto_147945 - BLOCK
      ?auto_147946 - BLOCK
      ?auto_147947 - BLOCK
      ?auto_147948 - BLOCK
      ?auto_147949 - BLOCK
    )
    :vars
    (
      ?auto_147950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147942 ) ( ON ?auto_147943 ?auto_147942 ) ( ON ?auto_147944 ?auto_147943 ) ( ON ?auto_147945 ?auto_147944 ) ( ON ?auto_147946 ?auto_147945 ) ( not ( = ?auto_147942 ?auto_147943 ) ) ( not ( = ?auto_147942 ?auto_147944 ) ) ( not ( = ?auto_147942 ?auto_147945 ) ) ( not ( = ?auto_147942 ?auto_147946 ) ) ( not ( = ?auto_147942 ?auto_147947 ) ) ( not ( = ?auto_147942 ?auto_147948 ) ) ( not ( = ?auto_147942 ?auto_147949 ) ) ( not ( = ?auto_147943 ?auto_147944 ) ) ( not ( = ?auto_147943 ?auto_147945 ) ) ( not ( = ?auto_147943 ?auto_147946 ) ) ( not ( = ?auto_147943 ?auto_147947 ) ) ( not ( = ?auto_147943 ?auto_147948 ) ) ( not ( = ?auto_147943 ?auto_147949 ) ) ( not ( = ?auto_147944 ?auto_147945 ) ) ( not ( = ?auto_147944 ?auto_147946 ) ) ( not ( = ?auto_147944 ?auto_147947 ) ) ( not ( = ?auto_147944 ?auto_147948 ) ) ( not ( = ?auto_147944 ?auto_147949 ) ) ( not ( = ?auto_147945 ?auto_147946 ) ) ( not ( = ?auto_147945 ?auto_147947 ) ) ( not ( = ?auto_147945 ?auto_147948 ) ) ( not ( = ?auto_147945 ?auto_147949 ) ) ( not ( = ?auto_147946 ?auto_147947 ) ) ( not ( = ?auto_147946 ?auto_147948 ) ) ( not ( = ?auto_147946 ?auto_147949 ) ) ( not ( = ?auto_147947 ?auto_147948 ) ) ( not ( = ?auto_147947 ?auto_147949 ) ) ( not ( = ?auto_147948 ?auto_147949 ) ) ( ON ?auto_147949 ?auto_147950 ) ( not ( = ?auto_147942 ?auto_147950 ) ) ( not ( = ?auto_147943 ?auto_147950 ) ) ( not ( = ?auto_147944 ?auto_147950 ) ) ( not ( = ?auto_147945 ?auto_147950 ) ) ( not ( = ?auto_147946 ?auto_147950 ) ) ( not ( = ?auto_147947 ?auto_147950 ) ) ( not ( = ?auto_147948 ?auto_147950 ) ) ( not ( = ?auto_147949 ?auto_147950 ) ) ( ON ?auto_147948 ?auto_147949 ) ( ON-TABLE ?auto_147950 ) ( CLEAR ?auto_147946 ) ( ON ?auto_147947 ?auto_147948 ) ( CLEAR ?auto_147947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147950 ?auto_147949 ?auto_147948 )
      ( MAKE-8PILE ?auto_147942 ?auto_147943 ?auto_147944 ?auto_147945 ?auto_147946 ?auto_147947 ?auto_147948 ?auto_147949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147951 - BLOCK
      ?auto_147952 - BLOCK
      ?auto_147953 - BLOCK
      ?auto_147954 - BLOCK
      ?auto_147955 - BLOCK
      ?auto_147956 - BLOCK
      ?auto_147957 - BLOCK
      ?auto_147958 - BLOCK
    )
    :vars
    (
      ?auto_147959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147951 ) ( ON ?auto_147952 ?auto_147951 ) ( ON ?auto_147953 ?auto_147952 ) ( ON ?auto_147954 ?auto_147953 ) ( not ( = ?auto_147951 ?auto_147952 ) ) ( not ( = ?auto_147951 ?auto_147953 ) ) ( not ( = ?auto_147951 ?auto_147954 ) ) ( not ( = ?auto_147951 ?auto_147955 ) ) ( not ( = ?auto_147951 ?auto_147956 ) ) ( not ( = ?auto_147951 ?auto_147957 ) ) ( not ( = ?auto_147951 ?auto_147958 ) ) ( not ( = ?auto_147952 ?auto_147953 ) ) ( not ( = ?auto_147952 ?auto_147954 ) ) ( not ( = ?auto_147952 ?auto_147955 ) ) ( not ( = ?auto_147952 ?auto_147956 ) ) ( not ( = ?auto_147952 ?auto_147957 ) ) ( not ( = ?auto_147952 ?auto_147958 ) ) ( not ( = ?auto_147953 ?auto_147954 ) ) ( not ( = ?auto_147953 ?auto_147955 ) ) ( not ( = ?auto_147953 ?auto_147956 ) ) ( not ( = ?auto_147953 ?auto_147957 ) ) ( not ( = ?auto_147953 ?auto_147958 ) ) ( not ( = ?auto_147954 ?auto_147955 ) ) ( not ( = ?auto_147954 ?auto_147956 ) ) ( not ( = ?auto_147954 ?auto_147957 ) ) ( not ( = ?auto_147954 ?auto_147958 ) ) ( not ( = ?auto_147955 ?auto_147956 ) ) ( not ( = ?auto_147955 ?auto_147957 ) ) ( not ( = ?auto_147955 ?auto_147958 ) ) ( not ( = ?auto_147956 ?auto_147957 ) ) ( not ( = ?auto_147956 ?auto_147958 ) ) ( not ( = ?auto_147957 ?auto_147958 ) ) ( ON ?auto_147958 ?auto_147959 ) ( not ( = ?auto_147951 ?auto_147959 ) ) ( not ( = ?auto_147952 ?auto_147959 ) ) ( not ( = ?auto_147953 ?auto_147959 ) ) ( not ( = ?auto_147954 ?auto_147959 ) ) ( not ( = ?auto_147955 ?auto_147959 ) ) ( not ( = ?auto_147956 ?auto_147959 ) ) ( not ( = ?auto_147957 ?auto_147959 ) ) ( not ( = ?auto_147958 ?auto_147959 ) ) ( ON ?auto_147957 ?auto_147958 ) ( ON-TABLE ?auto_147959 ) ( ON ?auto_147956 ?auto_147957 ) ( CLEAR ?auto_147956 ) ( HOLDING ?auto_147955 ) ( CLEAR ?auto_147954 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147951 ?auto_147952 ?auto_147953 ?auto_147954 ?auto_147955 )
      ( MAKE-8PILE ?auto_147951 ?auto_147952 ?auto_147953 ?auto_147954 ?auto_147955 ?auto_147956 ?auto_147957 ?auto_147958 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147960 - BLOCK
      ?auto_147961 - BLOCK
      ?auto_147962 - BLOCK
      ?auto_147963 - BLOCK
      ?auto_147964 - BLOCK
      ?auto_147965 - BLOCK
      ?auto_147966 - BLOCK
      ?auto_147967 - BLOCK
    )
    :vars
    (
      ?auto_147968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147960 ) ( ON ?auto_147961 ?auto_147960 ) ( ON ?auto_147962 ?auto_147961 ) ( ON ?auto_147963 ?auto_147962 ) ( not ( = ?auto_147960 ?auto_147961 ) ) ( not ( = ?auto_147960 ?auto_147962 ) ) ( not ( = ?auto_147960 ?auto_147963 ) ) ( not ( = ?auto_147960 ?auto_147964 ) ) ( not ( = ?auto_147960 ?auto_147965 ) ) ( not ( = ?auto_147960 ?auto_147966 ) ) ( not ( = ?auto_147960 ?auto_147967 ) ) ( not ( = ?auto_147961 ?auto_147962 ) ) ( not ( = ?auto_147961 ?auto_147963 ) ) ( not ( = ?auto_147961 ?auto_147964 ) ) ( not ( = ?auto_147961 ?auto_147965 ) ) ( not ( = ?auto_147961 ?auto_147966 ) ) ( not ( = ?auto_147961 ?auto_147967 ) ) ( not ( = ?auto_147962 ?auto_147963 ) ) ( not ( = ?auto_147962 ?auto_147964 ) ) ( not ( = ?auto_147962 ?auto_147965 ) ) ( not ( = ?auto_147962 ?auto_147966 ) ) ( not ( = ?auto_147962 ?auto_147967 ) ) ( not ( = ?auto_147963 ?auto_147964 ) ) ( not ( = ?auto_147963 ?auto_147965 ) ) ( not ( = ?auto_147963 ?auto_147966 ) ) ( not ( = ?auto_147963 ?auto_147967 ) ) ( not ( = ?auto_147964 ?auto_147965 ) ) ( not ( = ?auto_147964 ?auto_147966 ) ) ( not ( = ?auto_147964 ?auto_147967 ) ) ( not ( = ?auto_147965 ?auto_147966 ) ) ( not ( = ?auto_147965 ?auto_147967 ) ) ( not ( = ?auto_147966 ?auto_147967 ) ) ( ON ?auto_147967 ?auto_147968 ) ( not ( = ?auto_147960 ?auto_147968 ) ) ( not ( = ?auto_147961 ?auto_147968 ) ) ( not ( = ?auto_147962 ?auto_147968 ) ) ( not ( = ?auto_147963 ?auto_147968 ) ) ( not ( = ?auto_147964 ?auto_147968 ) ) ( not ( = ?auto_147965 ?auto_147968 ) ) ( not ( = ?auto_147966 ?auto_147968 ) ) ( not ( = ?auto_147967 ?auto_147968 ) ) ( ON ?auto_147966 ?auto_147967 ) ( ON-TABLE ?auto_147968 ) ( ON ?auto_147965 ?auto_147966 ) ( CLEAR ?auto_147963 ) ( ON ?auto_147964 ?auto_147965 ) ( CLEAR ?auto_147964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147968 ?auto_147967 ?auto_147966 ?auto_147965 )
      ( MAKE-8PILE ?auto_147960 ?auto_147961 ?auto_147962 ?auto_147963 ?auto_147964 ?auto_147965 ?auto_147966 ?auto_147967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147969 - BLOCK
      ?auto_147970 - BLOCK
      ?auto_147971 - BLOCK
      ?auto_147972 - BLOCK
      ?auto_147973 - BLOCK
      ?auto_147974 - BLOCK
      ?auto_147975 - BLOCK
      ?auto_147976 - BLOCK
    )
    :vars
    (
      ?auto_147977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147969 ) ( ON ?auto_147970 ?auto_147969 ) ( ON ?auto_147971 ?auto_147970 ) ( not ( = ?auto_147969 ?auto_147970 ) ) ( not ( = ?auto_147969 ?auto_147971 ) ) ( not ( = ?auto_147969 ?auto_147972 ) ) ( not ( = ?auto_147969 ?auto_147973 ) ) ( not ( = ?auto_147969 ?auto_147974 ) ) ( not ( = ?auto_147969 ?auto_147975 ) ) ( not ( = ?auto_147969 ?auto_147976 ) ) ( not ( = ?auto_147970 ?auto_147971 ) ) ( not ( = ?auto_147970 ?auto_147972 ) ) ( not ( = ?auto_147970 ?auto_147973 ) ) ( not ( = ?auto_147970 ?auto_147974 ) ) ( not ( = ?auto_147970 ?auto_147975 ) ) ( not ( = ?auto_147970 ?auto_147976 ) ) ( not ( = ?auto_147971 ?auto_147972 ) ) ( not ( = ?auto_147971 ?auto_147973 ) ) ( not ( = ?auto_147971 ?auto_147974 ) ) ( not ( = ?auto_147971 ?auto_147975 ) ) ( not ( = ?auto_147971 ?auto_147976 ) ) ( not ( = ?auto_147972 ?auto_147973 ) ) ( not ( = ?auto_147972 ?auto_147974 ) ) ( not ( = ?auto_147972 ?auto_147975 ) ) ( not ( = ?auto_147972 ?auto_147976 ) ) ( not ( = ?auto_147973 ?auto_147974 ) ) ( not ( = ?auto_147973 ?auto_147975 ) ) ( not ( = ?auto_147973 ?auto_147976 ) ) ( not ( = ?auto_147974 ?auto_147975 ) ) ( not ( = ?auto_147974 ?auto_147976 ) ) ( not ( = ?auto_147975 ?auto_147976 ) ) ( ON ?auto_147976 ?auto_147977 ) ( not ( = ?auto_147969 ?auto_147977 ) ) ( not ( = ?auto_147970 ?auto_147977 ) ) ( not ( = ?auto_147971 ?auto_147977 ) ) ( not ( = ?auto_147972 ?auto_147977 ) ) ( not ( = ?auto_147973 ?auto_147977 ) ) ( not ( = ?auto_147974 ?auto_147977 ) ) ( not ( = ?auto_147975 ?auto_147977 ) ) ( not ( = ?auto_147976 ?auto_147977 ) ) ( ON ?auto_147975 ?auto_147976 ) ( ON-TABLE ?auto_147977 ) ( ON ?auto_147974 ?auto_147975 ) ( ON ?auto_147973 ?auto_147974 ) ( CLEAR ?auto_147973 ) ( HOLDING ?auto_147972 ) ( CLEAR ?auto_147971 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147969 ?auto_147970 ?auto_147971 ?auto_147972 )
      ( MAKE-8PILE ?auto_147969 ?auto_147970 ?auto_147971 ?auto_147972 ?auto_147973 ?auto_147974 ?auto_147975 ?auto_147976 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147978 - BLOCK
      ?auto_147979 - BLOCK
      ?auto_147980 - BLOCK
      ?auto_147981 - BLOCK
      ?auto_147982 - BLOCK
      ?auto_147983 - BLOCK
      ?auto_147984 - BLOCK
      ?auto_147985 - BLOCK
    )
    :vars
    (
      ?auto_147986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147978 ) ( ON ?auto_147979 ?auto_147978 ) ( ON ?auto_147980 ?auto_147979 ) ( not ( = ?auto_147978 ?auto_147979 ) ) ( not ( = ?auto_147978 ?auto_147980 ) ) ( not ( = ?auto_147978 ?auto_147981 ) ) ( not ( = ?auto_147978 ?auto_147982 ) ) ( not ( = ?auto_147978 ?auto_147983 ) ) ( not ( = ?auto_147978 ?auto_147984 ) ) ( not ( = ?auto_147978 ?auto_147985 ) ) ( not ( = ?auto_147979 ?auto_147980 ) ) ( not ( = ?auto_147979 ?auto_147981 ) ) ( not ( = ?auto_147979 ?auto_147982 ) ) ( not ( = ?auto_147979 ?auto_147983 ) ) ( not ( = ?auto_147979 ?auto_147984 ) ) ( not ( = ?auto_147979 ?auto_147985 ) ) ( not ( = ?auto_147980 ?auto_147981 ) ) ( not ( = ?auto_147980 ?auto_147982 ) ) ( not ( = ?auto_147980 ?auto_147983 ) ) ( not ( = ?auto_147980 ?auto_147984 ) ) ( not ( = ?auto_147980 ?auto_147985 ) ) ( not ( = ?auto_147981 ?auto_147982 ) ) ( not ( = ?auto_147981 ?auto_147983 ) ) ( not ( = ?auto_147981 ?auto_147984 ) ) ( not ( = ?auto_147981 ?auto_147985 ) ) ( not ( = ?auto_147982 ?auto_147983 ) ) ( not ( = ?auto_147982 ?auto_147984 ) ) ( not ( = ?auto_147982 ?auto_147985 ) ) ( not ( = ?auto_147983 ?auto_147984 ) ) ( not ( = ?auto_147983 ?auto_147985 ) ) ( not ( = ?auto_147984 ?auto_147985 ) ) ( ON ?auto_147985 ?auto_147986 ) ( not ( = ?auto_147978 ?auto_147986 ) ) ( not ( = ?auto_147979 ?auto_147986 ) ) ( not ( = ?auto_147980 ?auto_147986 ) ) ( not ( = ?auto_147981 ?auto_147986 ) ) ( not ( = ?auto_147982 ?auto_147986 ) ) ( not ( = ?auto_147983 ?auto_147986 ) ) ( not ( = ?auto_147984 ?auto_147986 ) ) ( not ( = ?auto_147985 ?auto_147986 ) ) ( ON ?auto_147984 ?auto_147985 ) ( ON-TABLE ?auto_147986 ) ( ON ?auto_147983 ?auto_147984 ) ( ON ?auto_147982 ?auto_147983 ) ( CLEAR ?auto_147980 ) ( ON ?auto_147981 ?auto_147982 ) ( CLEAR ?auto_147981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147986 ?auto_147985 ?auto_147984 ?auto_147983 ?auto_147982 )
      ( MAKE-8PILE ?auto_147978 ?auto_147979 ?auto_147980 ?auto_147981 ?auto_147982 ?auto_147983 ?auto_147984 ?auto_147985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147987 - BLOCK
      ?auto_147988 - BLOCK
      ?auto_147989 - BLOCK
      ?auto_147990 - BLOCK
      ?auto_147991 - BLOCK
      ?auto_147992 - BLOCK
      ?auto_147993 - BLOCK
      ?auto_147994 - BLOCK
    )
    :vars
    (
      ?auto_147995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147987 ) ( ON ?auto_147988 ?auto_147987 ) ( not ( = ?auto_147987 ?auto_147988 ) ) ( not ( = ?auto_147987 ?auto_147989 ) ) ( not ( = ?auto_147987 ?auto_147990 ) ) ( not ( = ?auto_147987 ?auto_147991 ) ) ( not ( = ?auto_147987 ?auto_147992 ) ) ( not ( = ?auto_147987 ?auto_147993 ) ) ( not ( = ?auto_147987 ?auto_147994 ) ) ( not ( = ?auto_147988 ?auto_147989 ) ) ( not ( = ?auto_147988 ?auto_147990 ) ) ( not ( = ?auto_147988 ?auto_147991 ) ) ( not ( = ?auto_147988 ?auto_147992 ) ) ( not ( = ?auto_147988 ?auto_147993 ) ) ( not ( = ?auto_147988 ?auto_147994 ) ) ( not ( = ?auto_147989 ?auto_147990 ) ) ( not ( = ?auto_147989 ?auto_147991 ) ) ( not ( = ?auto_147989 ?auto_147992 ) ) ( not ( = ?auto_147989 ?auto_147993 ) ) ( not ( = ?auto_147989 ?auto_147994 ) ) ( not ( = ?auto_147990 ?auto_147991 ) ) ( not ( = ?auto_147990 ?auto_147992 ) ) ( not ( = ?auto_147990 ?auto_147993 ) ) ( not ( = ?auto_147990 ?auto_147994 ) ) ( not ( = ?auto_147991 ?auto_147992 ) ) ( not ( = ?auto_147991 ?auto_147993 ) ) ( not ( = ?auto_147991 ?auto_147994 ) ) ( not ( = ?auto_147992 ?auto_147993 ) ) ( not ( = ?auto_147992 ?auto_147994 ) ) ( not ( = ?auto_147993 ?auto_147994 ) ) ( ON ?auto_147994 ?auto_147995 ) ( not ( = ?auto_147987 ?auto_147995 ) ) ( not ( = ?auto_147988 ?auto_147995 ) ) ( not ( = ?auto_147989 ?auto_147995 ) ) ( not ( = ?auto_147990 ?auto_147995 ) ) ( not ( = ?auto_147991 ?auto_147995 ) ) ( not ( = ?auto_147992 ?auto_147995 ) ) ( not ( = ?auto_147993 ?auto_147995 ) ) ( not ( = ?auto_147994 ?auto_147995 ) ) ( ON ?auto_147993 ?auto_147994 ) ( ON-TABLE ?auto_147995 ) ( ON ?auto_147992 ?auto_147993 ) ( ON ?auto_147991 ?auto_147992 ) ( ON ?auto_147990 ?auto_147991 ) ( CLEAR ?auto_147990 ) ( HOLDING ?auto_147989 ) ( CLEAR ?auto_147988 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147987 ?auto_147988 ?auto_147989 )
      ( MAKE-8PILE ?auto_147987 ?auto_147988 ?auto_147989 ?auto_147990 ?auto_147991 ?auto_147992 ?auto_147993 ?auto_147994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_147996 - BLOCK
      ?auto_147997 - BLOCK
      ?auto_147998 - BLOCK
      ?auto_147999 - BLOCK
      ?auto_148000 - BLOCK
      ?auto_148001 - BLOCK
      ?auto_148002 - BLOCK
      ?auto_148003 - BLOCK
    )
    :vars
    (
      ?auto_148004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147996 ) ( ON ?auto_147997 ?auto_147996 ) ( not ( = ?auto_147996 ?auto_147997 ) ) ( not ( = ?auto_147996 ?auto_147998 ) ) ( not ( = ?auto_147996 ?auto_147999 ) ) ( not ( = ?auto_147996 ?auto_148000 ) ) ( not ( = ?auto_147996 ?auto_148001 ) ) ( not ( = ?auto_147996 ?auto_148002 ) ) ( not ( = ?auto_147996 ?auto_148003 ) ) ( not ( = ?auto_147997 ?auto_147998 ) ) ( not ( = ?auto_147997 ?auto_147999 ) ) ( not ( = ?auto_147997 ?auto_148000 ) ) ( not ( = ?auto_147997 ?auto_148001 ) ) ( not ( = ?auto_147997 ?auto_148002 ) ) ( not ( = ?auto_147997 ?auto_148003 ) ) ( not ( = ?auto_147998 ?auto_147999 ) ) ( not ( = ?auto_147998 ?auto_148000 ) ) ( not ( = ?auto_147998 ?auto_148001 ) ) ( not ( = ?auto_147998 ?auto_148002 ) ) ( not ( = ?auto_147998 ?auto_148003 ) ) ( not ( = ?auto_147999 ?auto_148000 ) ) ( not ( = ?auto_147999 ?auto_148001 ) ) ( not ( = ?auto_147999 ?auto_148002 ) ) ( not ( = ?auto_147999 ?auto_148003 ) ) ( not ( = ?auto_148000 ?auto_148001 ) ) ( not ( = ?auto_148000 ?auto_148002 ) ) ( not ( = ?auto_148000 ?auto_148003 ) ) ( not ( = ?auto_148001 ?auto_148002 ) ) ( not ( = ?auto_148001 ?auto_148003 ) ) ( not ( = ?auto_148002 ?auto_148003 ) ) ( ON ?auto_148003 ?auto_148004 ) ( not ( = ?auto_147996 ?auto_148004 ) ) ( not ( = ?auto_147997 ?auto_148004 ) ) ( not ( = ?auto_147998 ?auto_148004 ) ) ( not ( = ?auto_147999 ?auto_148004 ) ) ( not ( = ?auto_148000 ?auto_148004 ) ) ( not ( = ?auto_148001 ?auto_148004 ) ) ( not ( = ?auto_148002 ?auto_148004 ) ) ( not ( = ?auto_148003 ?auto_148004 ) ) ( ON ?auto_148002 ?auto_148003 ) ( ON-TABLE ?auto_148004 ) ( ON ?auto_148001 ?auto_148002 ) ( ON ?auto_148000 ?auto_148001 ) ( ON ?auto_147999 ?auto_148000 ) ( CLEAR ?auto_147997 ) ( ON ?auto_147998 ?auto_147999 ) ( CLEAR ?auto_147998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148004 ?auto_148003 ?auto_148002 ?auto_148001 ?auto_148000 ?auto_147999 )
      ( MAKE-8PILE ?auto_147996 ?auto_147997 ?auto_147998 ?auto_147999 ?auto_148000 ?auto_148001 ?auto_148002 ?auto_148003 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148005 - BLOCK
      ?auto_148006 - BLOCK
      ?auto_148007 - BLOCK
      ?auto_148008 - BLOCK
      ?auto_148009 - BLOCK
      ?auto_148010 - BLOCK
      ?auto_148011 - BLOCK
      ?auto_148012 - BLOCK
    )
    :vars
    (
      ?auto_148013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148005 ) ( not ( = ?auto_148005 ?auto_148006 ) ) ( not ( = ?auto_148005 ?auto_148007 ) ) ( not ( = ?auto_148005 ?auto_148008 ) ) ( not ( = ?auto_148005 ?auto_148009 ) ) ( not ( = ?auto_148005 ?auto_148010 ) ) ( not ( = ?auto_148005 ?auto_148011 ) ) ( not ( = ?auto_148005 ?auto_148012 ) ) ( not ( = ?auto_148006 ?auto_148007 ) ) ( not ( = ?auto_148006 ?auto_148008 ) ) ( not ( = ?auto_148006 ?auto_148009 ) ) ( not ( = ?auto_148006 ?auto_148010 ) ) ( not ( = ?auto_148006 ?auto_148011 ) ) ( not ( = ?auto_148006 ?auto_148012 ) ) ( not ( = ?auto_148007 ?auto_148008 ) ) ( not ( = ?auto_148007 ?auto_148009 ) ) ( not ( = ?auto_148007 ?auto_148010 ) ) ( not ( = ?auto_148007 ?auto_148011 ) ) ( not ( = ?auto_148007 ?auto_148012 ) ) ( not ( = ?auto_148008 ?auto_148009 ) ) ( not ( = ?auto_148008 ?auto_148010 ) ) ( not ( = ?auto_148008 ?auto_148011 ) ) ( not ( = ?auto_148008 ?auto_148012 ) ) ( not ( = ?auto_148009 ?auto_148010 ) ) ( not ( = ?auto_148009 ?auto_148011 ) ) ( not ( = ?auto_148009 ?auto_148012 ) ) ( not ( = ?auto_148010 ?auto_148011 ) ) ( not ( = ?auto_148010 ?auto_148012 ) ) ( not ( = ?auto_148011 ?auto_148012 ) ) ( ON ?auto_148012 ?auto_148013 ) ( not ( = ?auto_148005 ?auto_148013 ) ) ( not ( = ?auto_148006 ?auto_148013 ) ) ( not ( = ?auto_148007 ?auto_148013 ) ) ( not ( = ?auto_148008 ?auto_148013 ) ) ( not ( = ?auto_148009 ?auto_148013 ) ) ( not ( = ?auto_148010 ?auto_148013 ) ) ( not ( = ?auto_148011 ?auto_148013 ) ) ( not ( = ?auto_148012 ?auto_148013 ) ) ( ON ?auto_148011 ?auto_148012 ) ( ON-TABLE ?auto_148013 ) ( ON ?auto_148010 ?auto_148011 ) ( ON ?auto_148009 ?auto_148010 ) ( ON ?auto_148008 ?auto_148009 ) ( ON ?auto_148007 ?auto_148008 ) ( CLEAR ?auto_148007 ) ( HOLDING ?auto_148006 ) ( CLEAR ?auto_148005 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148005 ?auto_148006 )
      ( MAKE-8PILE ?auto_148005 ?auto_148006 ?auto_148007 ?auto_148008 ?auto_148009 ?auto_148010 ?auto_148011 ?auto_148012 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148014 - BLOCK
      ?auto_148015 - BLOCK
      ?auto_148016 - BLOCK
      ?auto_148017 - BLOCK
      ?auto_148018 - BLOCK
      ?auto_148019 - BLOCK
      ?auto_148020 - BLOCK
      ?auto_148021 - BLOCK
    )
    :vars
    (
      ?auto_148022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148014 ) ( not ( = ?auto_148014 ?auto_148015 ) ) ( not ( = ?auto_148014 ?auto_148016 ) ) ( not ( = ?auto_148014 ?auto_148017 ) ) ( not ( = ?auto_148014 ?auto_148018 ) ) ( not ( = ?auto_148014 ?auto_148019 ) ) ( not ( = ?auto_148014 ?auto_148020 ) ) ( not ( = ?auto_148014 ?auto_148021 ) ) ( not ( = ?auto_148015 ?auto_148016 ) ) ( not ( = ?auto_148015 ?auto_148017 ) ) ( not ( = ?auto_148015 ?auto_148018 ) ) ( not ( = ?auto_148015 ?auto_148019 ) ) ( not ( = ?auto_148015 ?auto_148020 ) ) ( not ( = ?auto_148015 ?auto_148021 ) ) ( not ( = ?auto_148016 ?auto_148017 ) ) ( not ( = ?auto_148016 ?auto_148018 ) ) ( not ( = ?auto_148016 ?auto_148019 ) ) ( not ( = ?auto_148016 ?auto_148020 ) ) ( not ( = ?auto_148016 ?auto_148021 ) ) ( not ( = ?auto_148017 ?auto_148018 ) ) ( not ( = ?auto_148017 ?auto_148019 ) ) ( not ( = ?auto_148017 ?auto_148020 ) ) ( not ( = ?auto_148017 ?auto_148021 ) ) ( not ( = ?auto_148018 ?auto_148019 ) ) ( not ( = ?auto_148018 ?auto_148020 ) ) ( not ( = ?auto_148018 ?auto_148021 ) ) ( not ( = ?auto_148019 ?auto_148020 ) ) ( not ( = ?auto_148019 ?auto_148021 ) ) ( not ( = ?auto_148020 ?auto_148021 ) ) ( ON ?auto_148021 ?auto_148022 ) ( not ( = ?auto_148014 ?auto_148022 ) ) ( not ( = ?auto_148015 ?auto_148022 ) ) ( not ( = ?auto_148016 ?auto_148022 ) ) ( not ( = ?auto_148017 ?auto_148022 ) ) ( not ( = ?auto_148018 ?auto_148022 ) ) ( not ( = ?auto_148019 ?auto_148022 ) ) ( not ( = ?auto_148020 ?auto_148022 ) ) ( not ( = ?auto_148021 ?auto_148022 ) ) ( ON ?auto_148020 ?auto_148021 ) ( ON-TABLE ?auto_148022 ) ( ON ?auto_148019 ?auto_148020 ) ( ON ?auto_148018 ?auto_148019 ) ( ON ?auto_148017 ?auto_148018 ) ( ON ?auto_148016 ?auto_148017 ) ( CLEAR ?auto_148014 ) ( ON ?auto_148015 ?auto_148016 ) ( CLEAR ?auto_148015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148022 ?auto_148021 ?auto_148020 ?auto_148019 ?auto_148018 ?auto_148017 ?auto_148016 )
      ( MAKE-8PILE ?auto_148014 ?auto_148015 ?auto_148016 ?auto_148017 ?auto_148018 ?auto_148019 ?auto_148020 ?auto_148021 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148023 - BLOCK
      ?auto_148024 - BLOCK
      ?auto_148025 - BLOCK
      ?auto_148026 - BLOCK
      ?auto_148027 - BLOCK
      ?auto_148028 - BLOCK
      ?auto_148029 - BLOCK
      ?auto_148030 - BLOCK
    )
    :vars
    (
      ?auto_148031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148023 ?auto_148024 ) ) ( not ( = ?auto_148023 ?auto_148025 ) ) ( not ( = ?auto_148023 ?auto_148026 ) ) ( not ( = ?auto_148023 ?auto_148027 ) ) ( not ( = ?auto_148023 ?auto_148028 ) ) ( not ( = ?auto_148023 ?auto_148029 ) ) ( not ( = ?auto_148023 ?auto_148030 ) ) ( not ( = ?auto_148024 ?auto_148025 ) ) ( not ( = ?auto_148024 ?auto_148026 ) ) ( not ( = ?auto_148024 ?auto_148027 ) ) ( not ( = ?auto_148024 ?auto_148028 ) ) ( not ( = ?auto_148024 ?auto_148029 ) ) ( not ( = ?auto_148024 ?auto_148030 ) ) ( not ( = ?auto_148025 ?auto_148026 ) ) ( not ( = ?auto_148025 ?auto_148027 ) ) ( not ( = ?auto_148025 ?auto_148028 ) ) ( not ( = ?auto_148025 ?auto_148029 ) ) ( not ( = ?auto_148025 ?auto_148030 ) ) ( not ( = ?auto_148026 ?auto_148027 ) ) ( not ( = ?auto_148026 ?auto_148028 ) ) ( not ( = ?auto_148026 ?auto_148029 ) ) ( not ( = ?auto_148026 ?auto_148030 ) ) ( not ( = ?auto_148027 ?auto_148028 ) ) ( not ( = ?auto_148027 ?auto_148029 ) ) ( not ( = ?auto_148027 ?auto_148030 ) ) ( not ( = ?auto_148028 ?auto_148029 ) ) ( not ( = ?auto_148028 ?auto_148030 ) ) ( not ( = ?auto_148029 ?auto_148030 ) ) ( ON ?auto_148030 ?auto_148031 ) ( not ( = ?auto_148023 ?auto_148031 ) ) ( not ( = ?auto_148024 ?auto_148031 ) ) ( not ( = ?auto_148025 ?auto_148031 ) ) ( not ( = ?auto_148026 ?auto_148031 ) ) ( not ( = ?auto_148027 ?auto_148031 ) ) ( not ( = ?auto_148028 ?auto_148031 ) ) ( not ( = ?auto_148029 ?auto_148031 ) ) ( not ( = ?auto_148030 ?auto_148031 ) ) ( ON ?auto_148029 ?auto_148030 ) ( ON-TABLE ?auto_148031 ) ( ON ?auto_148028 ?auto_148029 ) ( ON ?auto_148027 ?auto_148028 ) ( ON ?auto_148026 ?auto_148027 ) ( ON ?auto_148025 ?auto_148026 ) ( ON ?auto_148024 ?auto_148025 ) ( CLEAR ?auto_148024 ) ( HOLDING ?auto_148023 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148023 )
      ( MAKE-8PILE ?auto_148023 ?auto_148024 ?auto_148025 ?auto_148026 ?auto_148027 ?auto_148028 ?auto_148029 ?auto_148030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148032 - BLOCK
      ?auto_148033 - BLOCK
      ?auto_148034 - BLOCK
      ?auto_148035 - BLOCK
      ?auto_148036 - BLOCK
      ?auto_148037 - BLOCK
      ?auto_148038 - BLOCK
      ?auto_148039 - BLOCK
    )
    :vars
    (
      ?auto_148040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148032 ?auto_148033 ) ) ( not ( = ?auto_148032 ?auto_148034 ) ) ( not ( = ?auto_148032 ?auto_148035 ) ) ( not ( = ?auto_148032 ?auto_148036 ) ) ( not ( = ?auto_148032 ?auto_148037 ) ) ( not ( = ?auto_148032 ?auto_148038 ) ) ( not ( = ?auto_148032 ?auto_148039 ) ) ( not ( = ?auto_148033 ?auto_148034 ) ) ( not ( = ?auto_148033 ?auto_148035 ) ) ( not ( = ?auto_148033 ?auto_148036 ) ) ( not ( = ?auto_148033 ?auto_148037 ) ) ( not ( = ?auto_148033 ?auto_148038 ) ) ( not ( = ?auto_148033 ?auto_148039 ) ) ( not ( = ?auto_148034 ?auto_148035 ) ) ( not ( = ?auto_148034 ?auto_148036 ) ) ( not ( = ?auto_148034 ?auto_148037 ) ) ( not ( = ?auto_148034 ?auto_148038 ) ) ( not ( = ?auto_148034 ?auto_148039 ) ) ( not ( = ?auto_148035 ?auto_148036 ) ) ( not ( = ?auto_148035 ?auto_148037 ) ) ( not ( = ?auto_148035 ?auto_148038 ) ) ( not ( = ?auto_148035 ?auto_148039 ) ) ( not ( = ?auto_148036 ?auto_148037 ) ) ( not ( = ?auto_148036 ?auto_148038 ) ) ( not ( = ?auto_148036 ?auto_148039 ) ) ( not ( = ?auto_148037 ?auto_148038 ) ) ( not ( = ?auto_148037 ?auto_148039 ) ) ( not ( = ?auto_148038 ?auto_148039 ) ) ( ON ?auto_148039 ?auto_148040 ) ( not ( = ?auto_148032 ?auto_148040 ) ) ( not ( = ?auto_148033 ?auto_148040 ) ) ( not ( = ?auto_148034 ?auto_148040 ) ) ( not ( = ?auto_148035 ?auto_148040 ) ) ( not ( = ?auto_148036 ?auto_148040 ) ) ( not ( = ?auto_148037 ?auto_148040 ) ) ( not ( = ?auto_148038 ?auto_148040 ) ) ( not ( = ?auto_148039 ?auto_148040 ) ) ( ON ?auto_148038 ?auto_148039 ) ( ON-TABLE ?auto_148040 ) ( ON ?auto_148037 ?auto_148038 ) ( ON ?auto_148036 ?auto_148037 ) ( ON ?auto_148035 ?auto_148036 ) ( ON ?auto_148034 ?auto_148035 ) ( ON ?auto_148033 ?auto_148034 ) ( ON ?auto_148032 ?auto_148033 ) ( CLEAR ?auto_148032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148040 ?auto_148039 ?auto_148038 ?auto_148037 ?auto_148036 ?auto_148035 ?auto_148034 ?auto_148033 )
      ( MAKE-8PILE ?auto_148032 ?auto_148033 ?auto_148034 ?auto_148035 ?auto_148036 ?auto_148037 ?auto_148038 ?auto_148039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148177 - BLOCK
    )
    :vars
    (
      ?auto_148178 - BLOCK
      ?auto_148179 - BLOCK
      ?auto_148180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148177 ?auto_148178 ) ( CLEAR ?auto_148177 ) ( not ( = ?auto_148177 ?auto_148178 ) ) ( HOLDING ?auto_148179 ) ( CLEAR ?auto_148180 ) ( not ( = ?auto_148177 ?auto_148179 ) ) ( not ( = ?auto_148177 ?auto_148180 ) ) ( not ( = ?auto_148178 ?auto_148179 ) ) ( not ( = ?auto_148178 ?auto_148180 ) ) ( not ( = ?auto_148179 ?auto_148180 ) ) )
    :subtasks
    ( ( !STACK ?auto_148179 ?auto_148180 )
      ( MAKE-1PILE ?auto_148177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148181 - BLOCK
    )
    :vars
    (
      ?auto_148184 - BLOCK
      ?auto_148183 - BLOCK
      ?auto_148182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148181 ?auto_148184 ) ( not ( = ?auto_148181 ?auto_148184 ) ) ( CLEAR ?auto_148183 ) ( not ( = ?auto_148181 ?auto_148182 ) ) ( not ( = ?auto_148181 ?auto_148183 ) ) ( not ( = ?auto_148184 ?auto_148182 ) ) ( not ( = ?auto_148184 ?auto_148183 ) ) ( not ( = ?auto_148182 ?auto_148183 ) ) ( ON ?auto_148182 ?auto_148181 ) ( CLEAR ?auto_148182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148184 ?auto_148181 )
      ( MAKE-1PILE ?auto_148181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148185 - BLOCK
    )
    :vars
    (
      ?auto_148188 - BLOCK
      ?auto_148186 - BLOCK
      ?auto_148187 - BLOCK
      ?auto_148190 - BLOCK
      ?auto_148192 - BLOCK
      ?auto_148193 - BLOCK
      ?auto_148191 - BLOCK
      ?auto_148189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148185 ?auto_148188 ) ( not ( = ?auto_148185 ?auto_148188 ) ) ( not ( = ?auto_148185 ?auto_148186 ) ) ( not ( = ?auto_148185 ?auto_148187 ) ) ( not ( = ?auto_148188 ?auto_148186 ) ) ( not ( = ?auto_148188 ?auto_148187 ) ) ( not ( = ?auto_148186 ?auto_148187 ) ) ( ON ?auto_148186 ?auto_148185 ) ( CLEAR ?auto_148186 ) ( ON-TABLE ?auto_148188 ) ( HOLDING ?auto_148187 ) ( CLEAR ?auto_148190 ) ( ON-TABLE ?auto_148192 ) ( ON ?auto_148193 ?auto_148192 ) ( ON ?auto_148191 ?auto_148193 ) ( ON ?auto_148189 ?auto_148191 ) ( ON ?auto_148190 ?auto_148189 ) ( not ( = ?auto_148192 ?auto_148193 ) ) ( not ( = ?auto_148192 ?auto_148191 ) ) ( not ( = ?auto_148192 ?auto_148189 ) ) ( not ( = ?auto_148192 ?auto_148190 ) ) ( not ( = ?auto_148192 ?auto_148187 ) ) ( not ( = ?auto_148193 ?auto_148191 ) ) ( not ( = ?auto_148193 ?auto_148189 ) ) ( not ( = ?auto_148193 ?auto_148190 ) ) ( not ( = ?auto_148193 ?auto_148187 ) ) ( not ( = ?auto_148191 ?auto_148189 ) ) ( not ( = ?auto_148191 ?auto_148190 ) ) ( not ( = ?auto_148191 ?auto_148187 ) ) ( not ( = ?auto_148189 ?auto_148190 ) ) ( not ( = ?auto_148189 ?auto_148187 ) ) ( not ( = ?auto_148190 ?auto_148187 ) ) ( not ( = ?auto_148185 ?auto_148190 ) ) ( not ( = ?auto_148185 ?auto_148192 ) ) ( not ( = ?auto_148185 ?auto_148193 ) ) ( not ( = ?auto_148185 ?auto_148191 ) ) ( not ( = ?auto_148185 ?auto_148189 ) ) ( not ( = ?auto_148188 ?auto_148190 ) ) ( not ( = ?auto_148188 ?auto_148192 ) ) ( not ( = ?auto_148188 ?auto_148193 ) ) ( not ( = ?auto_148188 ?auto_148191 ) ) ( not ( = ?auto_148188 ?auto_148189 ) ) ( not ( = ?auto_148186 ?auto_148190 ) ) ( not ( = ?auto_148186 ?auto_148192 ) ) ( not ( = ?auto_148186 ?auto_148193 ) ) ( not ( = ?auto_148186 ?auto_148191 ) ) ( not ( = ?auto_148186 ?auto_148189 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148192 ?auto_148193 ?auto_148191 ?auto_148189 ?auto_148190 ?auto_148187 )
      ( MAKE-1PILE ?auto_148185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148194 - BLOCK
    )
    :vars
    (
      ?auto_148199 - BLOCK
      ?auto_148197 - BLOCK
      ?auto_148195 - BLOCK
      ?auto_148201 - BLOCK
      ?auto_148198 - BLOCK
      ?auto_148202 - BLOCK
      ?auto_148196 - BLOCK
      ?auto_148200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148194 ?auto_148199 ) ( not ( = ?auto_148194 ?auto_148199 ) ) ( not ( = ?auto_148194 ?auto_148197 ) ) ( not ( = ?auto_148194 ?auto_148195 ) ) ( not ( = ?auto_148199 ?auto_148197 ) ) ( not ( = ?auto_148199 ?auto_148195 ) ) ( not ( = ?auto_148197 ?auto_148195 ) ) ( ON ?auto_148197 ?auto_148194 ) ( ON-TABLE ?auto_148199 ) ( CLEAR ?auto_148201 ) ( ON-TABLE ?auto_148198 ) ( ON ?auto_148202 ?auto_148198 ) ( ON ?auto_148196 ?auto_148202 ) ( ON ?auto_148200 ?auto_148196 ) ( ON ?auto_148201 ?auto_148200 ) ( not ( = ?auto_148198 ?auto_148202 ) ) ( not ( = ?auto_148198 ?auto_148196 ) ) ( not ( = ?auto_148198 ?auto_148200 ) ) ( not ( = ?auto_148198 ?auto_148201 ) ) ( not ( = ?auto_148198 ?auto_148195 ) ) ( not ( = ?auto_148202 ?auto_148196 ) ) ( not ( = ?auto_148202 ?auto_148200 ) ) ( not ( = ?auto_148202 ?auto_148201 ) ) ( not ( = ?auto_148202 ?auto_148195 ) ) ( not ( = ?auto_148196 ?auto_148200 ) ) ( not ( = ?auto_148196 ?auto_148201 ) ) ( not ( = ?auto_148196 ?auto_148195 ) ) ( not ( = ?auto_148200 ?auto_148201 ) ) ( not ( = ?auto_148200 ?auto_148195 ) ) ( not ( = ?auto_148201 ?auto_148195 ) ) ( not ( = ?auto_148194 ?auto_148201 ) ) ( not ( = ?auto_148194 ?auto_148198 ) ) ( not ( = ?auto_148194 ?auto_148202 ) ) ( not ( = ?auto_148194 ?auto_148196 ) ) ( not ( = ?auto_148194 ?auto_148200 ) ) ( not ( = ?auto_148199 ?auto_148201 ) ) ( not ( = ?auto_148199 ?auto_148198 ) ) ( not ( = ?auto_148199 ?auto_148202 ) ) ( not ( = ?auto_148199 ?auto_148196 ) ) ( not ( = ?auto_148199 ?auto_148200 ) ) ( not ( = ?auto_148197 ?auto_148201 ) ) ( not ( = ?auto_148197 ?auto_148198 ) ) ( not ( = ?auto_148197 ?auto_148202 ) ) ( not ( = ?auto_148197 ?auto_148196 ) ) ( not ( = ?auto_148197 ?auto_148200 ) ) ( ON ?auto_148195 ?auto_148197 ) ( CLEAR ?auto_148195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148199 ?auto_148194 ?auto_148197 )
      ( MAKE-1PILE ?auto_148194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148203 - BLOCK
    )
    :vars
    (
      ?auto_148209 - BLOCK
      ?auto_148206 - BLOCK
      ?auto_148210 - BLOCK
      ?auto_148204 - BLOCK
      ?auto_148211 - BLOCK
      ?auto_148208 - BLOCK
      ?auto_148205 - BLOCK
      ?auto_148207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148203 ?auto_148209 ) ( not ( = ?auto_148203 ?auto_148209 ) ) ( not ( = ?auto_148203 ?auto_148206 ) ) ( not ( = ?auto_148203 ?auto_148210 ) ) ( not ( = ?auto_148209 ?auto_148206 ) ) ( not ( = ?auto_148209 ?auto_148210 ) ) ( not ( = ?auto_148206 ?auto_148210 ) ) ( ON ?auto_148206 ?auto_148203 ) ( ON-TABLE ?auto_148209 ) ( ON-TABLE ?auto_148204 ) ( ON ?auto_148211 ?auto_148204 ) ( ON ?auto_148208 ?auto_148211 ) ( ON ?auto_148205 ?auto_148208 ) ( not ( = ?auto_148204 ?auto_148211 ) ) ( not ( = ?auto_148204 ?auto_148208 ) ) ( not ( = ?auto_148204 ?auto_148205 ) ) ( not ( = ?auto_148204 ?auto_148207 ) ) ( not ( = ?auto_148204 ?auto_148210 ) ) ( not ( = ?auto_148211 ?auto_148208 ) ) ( not ( = ?auto_148211 ?auto_148205 ) ) ( not ( = ?auto_148211 ?auto_148207 ) ) ( not ( = ?auto_148211 ?auto_148210 ) ) ( not ( = ?auto_148208 ?auto_148205 ) ) ( not ( = ?auto_148208 ?auto_148207 ) ) ( not ( = ?auto_148208 ?auto_148210 ) ) ( not ( = ?auto_148205 ?auto_148207 ) ) ( not ( = ?auto_148205 ?auto_148210 ) ) ( not ( = ?auto_148207 ?auto_148210 ) ) ( not ( = ?auto_148203 ?auto_148207 ) ) ( not ( = ?auto_148203 ?auto_148204 ) ) ( not ( = ?auto_148203 ?auto_148211 ) ) ( not ( = ?auto_148203 ?auto_148208 ) ) ( not ( = ?auto_148203 ?auto_148205 ) ) ( not ( = ?auto_148209 ?auto_148207 ) ) ( not ( = ?auto_148209 ?auto_148204 ) ) ( not ( = ?auto_148209 ?auto_148211 ) ) ( not ( = ?auto_148209 ?auto_148208 ) ) ( not ( = ?auto_148209 ?auto_148205 ) ) ( not ( = ?auto_148206 ?auto_148207 ) ) ( not ( = ?auto_148206 ?auto_148204 ) ) ( not ( = ?auto_148206 ?auto_148211 ) ) ( not ( = ?auto_148206 ?auto_148208 ) ) ( not ( = ?auto_148206 ?auto_148205 ) ) ( ON ?auto_148210 ?auto_148206 ) ( CLEAR ?auto_148210 ) ( HOLDING ?auto_148207 ) ( CLEAR ?auto_148205 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148204 ?auto_148211 ?auto_148208 ?auto_148205 ?auto_148207 )
      ( MAKE-1PILE ?auto_148203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148212 - BLOCK
    )
    :vars
    (
      ?auto_148214 - BLOCK
      ?auto_148215 - BLOCK
      ?auto_148218 - BLOCK
      ?auto_148213 - BLOCK
      ?auto_148217 - BLOCK
      ?auto_148219 - BLOCK
      ?auto_148216 - BLOCK
      ?auto_148220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148212 ?auto_148214 ) ( not ( = ?auto_148212 ?auto_148214 ) ) ( not ( = ?auto_148212 ?auto_148215 ) ) ( not ( = ?auto_148212 ?auto_148218 ) ) ( not ( = ?auto_148214 ?auto_148215 ) ) ( not ( = ?auto_148214 ?auto_148218 ) ) ( not ( = ?auto_148215 ?auto_148218 ) ) ( ON ?auto_148215 ?auto_148212 ) ( ON-TABLE ?auto_148214 ) ( ON-TABLE ?auto_148213 ) ( ON ?auto_148217 ?auto_148213 ) ( ON ?auto_148219 ?auto_148217 ) ( ON ?auto_148216 ?auto_148219 ) ( not ( = ?auto_148213 ?auto_148217 ) ) ( not ( = ?auto_148213 ?auto_148219 ) ) ( not ( = ?auto_148213 ?auto_148216 ) ) ( not ( = ?auto_148213 ?auto_148220 ) ) ( not ( = ?auto_148213 ?auto_148218 ) ) ( not ( = ?auto_148217 ?auto_148219 ) ) ( not ( = ?auto_148217 ?auto_148216 ) ) ( not ( = ?auto_148217 ?auto_148220 ) ) ( not ( = ?auto_148217 ?auto_148218 ) ) ( not ( = ?auto_148219 ?auto_148216 ) ) ( not ( = ?auto_148219 ?auto_148220 ) ) ( not ( = ?auto_148219 ?auto_148218 ) ) ( not ( = ?auto_148216 ?auto_148220 ) ) ( not ( = ?auto_148216 ?auto_148218 ) ) ( not ( = ?auto_148220 ?auto_148218 ) ) ( not ( = ?auto_148212 ?auto_148220 ) ) ( not ( = ?auto_148212 ?auto_148213 ) ) ( not ( = ?auto_148212 ?auto_148217 ) ) ( not ( = ?auto_148212 ?auto_148219 ) ) ( not ( = ?auto_148212 ?auto_148216 ) ) ( not ( = ?auto_148214 ?auto_148220 ) ) ( not ( = ?auto_148214 ?auto_148213 ) ) ( not ( = ?auto_148214 ?auto_148217 ) ) ( not ( = ?auto_148214 ?auto_148219 ) ) ( not ( = ?auto_148214 ?auto_148216 ) ) ( not ( = ?auto_148215 ?auto_148220 ) ) ( not ( = ?auto_148215 ?auto_148213 ) ) ( not ( = ?auto_148215 ?auto_148217 ) ) ( not ( = ?auto_148215 ?auto_148219 ) ) ( not ( = ?auto_148215 ?auto_148216 ) ) ( ON ?auto_148218 ?auto_148215 ) ( CLEAR ?auto_148216 ) ( ON ?auto_148220 ?auto_148218 ) ( CLEAR ?auto_148220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148214 ?auto_148212 ?auto_148215 ?auto_148218 )
      ( MAKE-1PILE ?auto_148212 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148221 - BLOCK
    )
    :vars
    (
      ?auto_148224 - BLOCK
      ?auto_148223 - BLOCK
      ?auto_148222 - BLOCK
      ?auto_148228 - BLOCK
      ?auto_148226 - BLOCK
      ?auto_148229 - BLOCK
      ?auto_148225 - BLOCK
      ?auto_148227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148221 ?auto_148224 ) ( not ( = ?auto_148221 ?auto_148224 ) ) ( not ( = ?auto_148221 ?auto_148223 ) ) ( not ( = ?auto_148221 ?auto_148222 ) ) ( not ( = ?auto_148224 ?auto_148223 ) ) ( not ( = ?auto_148224 ?auto_148222 ) ) ( not ( = ?auto_148223 ?auto_148222 ) ) ( ON ?auto_148223 ?auto_148221 ) ( ON-TABLE ?auto_148224 ) ( ON-TABLE ?auto_148228 ) ( ON ?auto_148226 ?auto_148228 ) ( ON ?auto_148229 ?auto_148226 ) ( not ( = ?auto_148228 ?auto_148226 ) ) ( not ( = ?auto_148228 ?auto_148229 ) ) ( not ( = ?auto_148228 ?auto_148225 ) ) ( not ( = ?auto_148228 ?auto_148227 ) ) ( not ( = ?auto_148228 ?auto_148222 ) ) ( not ( = ?auto_148226 ?auto_148229 ) ) ( not ( = ?auto_148226 ?auto_148225 ) ) ( not ( = ?auto_148226 ?auto_148227 ) ) ( not ( = ?auto_148226 ?auto_148222 ) ) ( not ( = ?auto_148229 ?auto_148225 ) ) ( not ( = ?auto_148229 ?auto_148227 ) ) ( not ( = ?auto_148229 ?auto_148222 ) ) ( not ( = ?auto_148225 ?auto_148227 ) ) ( not ( = ?auto_148225 ?auto_148222 ) ) ( not ( = ?auto_148227 ?auto_148222 ) ) ( not ( = ?auto_148221 ?auto_148227 ) ) ( not ( = ?auto_148221 ?auto_148228 ) ) ( not ( = ?auto_148221 ?auto_148226 ) ) ( not ( = ?auto_148221 ?auto_148229 ) ) ( not ( = ?auto_148221 ?auto_148225 ) ) ( not ( = ?auto_148224 ?auto_148227 ) ) ( not ( = ?auto_148224 ?auto_148228 ) ) ( not ( = ?auto_148224 ?auto_148226 ) ) ( not ( = ?auto_148224 ?auto_148229 ) ) ( not ( = ?auto_148224 ?auto_148225 ) ) ( not ( = ?auto_148223 ?auto_148227 ) ) ( not ( = ?auto_148223 ?auto_148228 ) ) ( not ( = ?auto_148223 ?auto_148226 ) ) ( not ( = ?auto_148223 ?auto_148229 ) ) ( not ( = ?auto_148223 ?auto_148225 ) ) ( ON ?auto_148222 ?auto_148223 ) ( ON ?auto_148227 ?auto_148222 ) ( CLEAR ?auto_148227 ) ( HOLDING ?auto_148225 ) ( CLEAR ?auto_148229 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148228 ?auto_148226 ?auto_148229 ?auto_148225 )
      ( MAKE-1PILE ?auto_148221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148230 - BLOCK
    )
    :vars
    (
      ?auto_148238 - BLOCK
      ?auto_148237 - BLOCK
      ?auto_148232 - BLOCK
      ?auto_148234 - BLOCK
      ?auto_148235 - BLOCK
      ?auto_148231 - BLOCK
      ?auto_148233 - BLOCK
      ?auto_148236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148230 ?auto_148238 ) ( not ( = ?auto_148230 ?auto_148238 ) ) ( not ( = ?auto_148230 ?auto_148237 ) ) ( not ( = ?auto_148230 ?auto_148232 ) ) ( not ( = ?auto_148238 ?auto_148237 ) ) ( not ( = ?auto_148238 ?auto_148232 ) ) ( not ( = ?auto_148237 ?auto_148232 ) ) ( ON ?auto_148237 ?auto_148230 ) ( ON-TABLE ?auto_148238 ) ( ON-TABLE ?auto_148234 ) ( ON ?auto_148235 ?auto_148234 ) ( ON ?auto_148231 ?auto_148235 ) ( not ( = ?auto_148234 ?auto_148235 ) ) ( not ( = ?auto_148234 ?auto_148231 ) ) ( not ( = ?auto_148234 ?auto_148233 ) ) ( not ( = ?auto_148234 ?auto_148236 ) ) ( not ( = ?auto_148234 ?auto_148232 ) ) ( not ( = ?auto_148235 ?auto_148231 ) ) ( not ( = ?auto_148235 ?auto_148233 ) ) ( not ( = ?auto_148235 ?auto_148236 ) ) ( not ( = ?auto_148235 ?auto_148232 ) ) ( not ( = ?auto_148231 ?auto_148233 ) ) ( not ( = ?auto_148231 ?auto_148236 ) ) ( not ( = ?auto_148231 ?auto_148232 ) ) ( not ( = ?auto_148233 ?auto_148236 ) ) ( not ( = ?auto_148233 ?auto_148232 ) ) ( not ( = ?auto_148236 ?auto_148232 ) ) ( not ( = ?auto_148230 ?auto_148236 ) ) ( not ( = ?auto_148230 ?auto_148234 ) ) ( not ( = ?auto_148230 ?auto_148235 ) ) ( not ( = ?auto_148230 ?auto_148231 ) ) ( not ( = ?auto_148230 ?auto_148233 ) ) ( not ( = ?auto_148238 ?auto_148236 ) ) ( not ( = ?auto_148238 ?auto_148234 ) ) ( not ( = ?auto_148238 ?auto_148235 ) ) ( not ( = ?auto_148238 ?auto_148231 ) ) ( not ( = ?auto_148238 ?auto_148233 ) ) ( not ( = ?auto_148237 ?auto_148236 ) ) ( not ( = ?auto_148237 ?auto_148234 ) ) ( not ( = ?auto_148237 ?auto_148235 ) ) ( not ( = ?auto_148237 ?auto_148231 ) ) ( not ( = ?auto_148237 ?auto_148233 ) ) ( ON ?auto_148232 ?auto_148237 ) ( ON ?auto_148236 ?auto_148232 ) ( CLEAR ?auto_148231 ) ( ON ?auto_148233 ?auto_148236 ) ( CLEAR ?auto_148233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148238 ?auto_148230 ?auto_148237 ?auto_148232 ?auto_148236 )
      ( MAKE-1PILE ?auto_148230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148239 - BLOCK
    )
    :vars
    (
      ?auto_148240 - BLOCK
      ?auto_148245 - BLOCK
      ?auto_148246 - BLOCK
      ?auto_148242 - BLOCK
      ?auto_148243 - BLOCK
      ?auto_148241 - BLOCK
      ?auto_148244 - BLOCK
      ?auto_148247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148239 ?auto_148240 ) ( not ( = ?auto_148239 ?auto_148240 ) ) ( not ( = ?auto_148239 ?auto_148245 ) ) ( not ( = ?auto_148239 ?auto_148246 ) ) ( not ( = ?auto_148240 ?auto_148245 ) ) ( not ( = ?auto_148240 ?auto_148246 ) ) ( not ( = ?auto_148245 ?auto_148246 ) ) ( ON ?auto_148245 ?auto_148239 ) ( ON-TABLE ?auto_148240 ) ( ON-TABLE ?auto_148242 ) ( ON ?auto_148243 ?auto_148242 ) ( not ( = ?auto_148242 ?auto_148243 ) ) ( not ( = ?auto_148242 ?auto_148241 ) ) ( not ( = ?auto_148242 ?auto_148244 ) ) ( not ( = ?auto_148242 ?auto_148247 ) ) ( not ( = ?auto_148242 ?auto_148246 ) ) ( not ( = ?auto_148243 ?auto_148241 ) ) ( not ( = ?auto_148243 ?auto_148244 ) ) ( not ( = ?auto_148243 ?auto_148247 ) ) ( not ( = ?auto_148243 ?auto_148246 ) ) ( not ( = ?auto_148241 ?auto_148244 ) ) ( not ( = ?auto_148241 ?auto_148247 ) ) ( not ( = ?auto_148241 ?auto_148246 ) ) ( not ( = ?auto_148244 ?auto_148247 ) ) ( not ( = ?auto_148244 ?auto_148246 ) ) ( not ( = ?auto_148247 ?auto_148246 ) ) ( not ( = ?auto_148239 ?auto_148247 ) ) ( not ( = ?auto_148239 ?auto_148242 ) ) ( not ( = ?auto_148239 ?auto_148243 ) ) ( not ( = ?auto_148239 ?auto_148241 ) ) ( not ( = ?auto_148239 ?auto_148244 ) ) ( not ( = ?auto_148240 ?auto_148247 ) ) ( not ( = ?auto_148240 ?auto_148242 ) ) ( not ( = ?auto_148240 ?auto_148243 ) ) ( not ( = ?auto_148240 ?auto_148241 ) ) ( not ( = ?auto_148240 ?auto_148244 ) ) ( not ( = ?auto_148245 ?auto_148247 ) ) ( not ( = ?auto_148245 ?auto_148242 ) ) ( not ( = ?auto_148245 ?auto_148243 ) ) ( not ( = ?auto_148245 ?auto_148241 ) ) ( not ( = ?auto_148245 ?auto_148244 ) ) ( ON ?auto_148246 ?auto_148245 ) ( ON ?auto_148247 ?auto_148246 ) ( ON ?auto_148244 ?auto_148247 ) ( CLEAR ?auto_148244 ) ( HOLDING ?auto_148241 ) ( CLEAR ?auto_148243 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148242 ?auto_148243 ?auto_148241 )
      ( MAKE-1PILE ?auto_148239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148248 - BLOCK
    )
    :vars
    (
      ?auto_148256 - BLOCK
      ?auto_148251 - BLOCK
      ?auto_148255 - BLOCK
      ?auto_148249 - BLOCK
      ?auto_148252 - BLOCK
      ?auto_148253 - BLOCK
      ?auto_148254 - BLOCK
      ?auto_148250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148248 ?auto_148256 ) ( not ( = ?auto_148248 ?auto_148256 ) ) ( not ( = ?auto_148248 ?auto_148251 ) ) ( not ( = ?auto_148248 ?auto_148255 ) ) ( not ( = ?auto_148256 ?auto_148251 ) ) ( not ( = ?auto_148256 ?auto_148255 ) ) ( not ( = ?auto_148251 ?auto_148255 ) ) ( ON ?auto_148251 ?auto_148248 ) ( ON-TABLE ?auto_148256 ) ( ON-TABLE ?auto_148249 ) ( ON ?auto_148252 ?auto_148249 ) ( not ( = ?auto_148249 ?auto_148252 ) ) ( not ( = ?auto_148249 ?auto_148253 ) ) ( not ( = ?auto_148249 ?auto_148254 ) ) ( not ( = ?auto_148249 ?auto_148250 ) ) ( not ( = ?auto_148249 ?auto_148255 ) ) ( not ( = ?auto_148252 ?auto_148253 ) ) ( not ( = ?auto_148252 ?auto_148254 ) ) ( not ( = ?auto_148252 ?auto_148250 ) ) ( not ( = ?auto_148252 ?auto_148255 ) ) ( not ( = ?auto_148253 ?auto_148254 ) ) ( not ( = ?auto_148253 ?auto_148250 ) ) ( not ( = ?auto_148253 ?auto_148255 ) ) ( not ( = ?auto_148254 ?auto_148250 ) ) ( not ( = ?auto_148254 ?auto_148255 ) ) ( not ( = ?auto_148250 ?auto_148255 ) ) ( not ( = ?auto_148248 ?auto_148250 ) ) ( not ( = ?auto_148248 ?auto_148249 ) ) ( not ( = ?auto_148248 ?auto_148252 ) ) ( not ( = ?auto_148248 ?auto_148253 ) ) ( not ( = ?auto_148248 ?auto_148254 ) ) ( not ( = ?auto_148256 ?auto_148250 ) ) ( not ( = ?auto_148256 ?auto_148249 ) ) ( not ( = ?auto_148256 ?auto_148252 ) ) ( not ( = ?auto_148256 ?auto_148253 ) ) ( not ( = ?auto_148256 ?auto_148254 ) ) ( not ( = ?auto_148251 ?auto_148250 ) ) ( not ( = ?auto_148251 ?auto_148249 ) ) ( not ( = ?auto_148251 ?auto_148252 ) ) ( not ( = ?auto_148251 ?auto_148253 ) ) ( not ( = ?auto_148251 ?auto_148254 ) ) ( ON ?auto_148255 ?auto_148251 ) ( ON ?auto_148250 ?auto_148255 ) ( ON ?auto_148254 ?auto_148250 ) ( CLEAR ?auto_148252 ) ( ON ?auto_148253 ?auto_148254 ) ( CLEAR ?auto_148253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148256 ?auto_148248 ?auto_148251 ?auto_148255 ?auto_148250 ?auto_148254 )
      ( MAKE-1PILE ?auto_148248 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148257 - BLOCK
    )
    :vars
    (
      ?auto_148259 - BLOCK
      ?auto_148263 - BLOCK
      ?auto_148258 - BLOCK
      ?auto_148265 - BLOCK
      ?auto_148262 - BLOCK
      ?auto_148261 - BLOCK
      ?auto_148260 - BLOCK
      ?auto_148264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148257 ?auto_148259 ) ( not ( = ?auto_148257 ?auto_148259 ) ) ( not ( = ?auto_148257 ?auto_148263 ) ) ( not ( = ?auto_148257 ?auto_148258 ) ) ( not ( = ?auto_148259 ?auto_148263 ) ) ( not ( = ?auto_148259 ?auto_148258 ) ) ( not ( = ?auto_148263 ?auto_148258 ) ) ( ON ?auto_148263 ?auto_148257 ) ( ON-TABLE ?auto_148259 ) ( ON-TABLE ?auto_148265 ) ( not ( = ?auto_148265 ?auto_148262 ) ) ( not ( = ?auto_148265 ?auto_148261 ) ) ( not ( = ?auto_148265 ?auto_148260 ) ) ( not ( = ?auto_148265 ?auto_148264 ) ) ( not ( = ?auto_148265 ?auto_148258 ) ) ( not ( = ?auto_148262 ?auto_148261 ) ) ( not ( = ?auto_148262 ?auto_148260 ) ) ( not ( = ?auto_148262 ?auto_148264 ) ) ( not ( = ?auto_148262 ?auto_148258 ) ) ( not ( = ?auto_148261 ?auto_148260 ) ) ( not ( = ?auto_148261 ?auto_148264 ) ) ( not ( = ?auto_148261 ?auto_148258 ) ) ( not ( = ?auto_148260 ?auto_148264 ) ) ( not ( = ?auto_148260 ?auto_148258 ) ) ( not ( = ?auto_148264 ?auto_148258 ) ) ( not ( = ?auto_148257 ?auto_148264 ) ) ( not ( = ?auto_148257 ?auto_148265 ) ) ( not ( = ?auto_148257 ?auto_148262 ) ) ( not ( = ?auto_148257 ?auto_148261 ) ) ( not ( = ?auto_148257 ?auto_148260 ) ) ( not ( = ?auto_148259 ?auto_148264 ) ) ( not ( = ?auto_148259 ?auto_148265 ) ) ( not ( = ?auto_148259 ?auto_148262 ) ) ( not ( = ?auto_148259 ?auto_148261 ) ) ( not ( = ?auto_148259 ?auto_148260 ) ) ( not ( = ?auto_148263 ?auto_148264 ) ) ( not ( = ?auto_148263 ?auto_148265 ) ) ( not ( = ?auto_148263 ?auto_148262 ) ) ( not ( = ?auto_148263 ?auto_148261 ) ) ( not ( = ?auto_148263 ?auto_148260 ) ) ( ON ?auto_148258 ?auto_148263 ) ( ON ?auto_148264 ?auto_148258 ) ( ON ?auto_148260 ?auto_148264 ) ( ON ?auto_148261 ?auto_148260 ) ( CLEAR ?auto_148261 ) ( HOLDING ?auto_148262 ) ( CLEAR ?auto_148265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148265 ?auto_148262 )
      ( MAKE-1PILE ?auto_148257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148266 - BLOCK
    )
    :vars
    (
      ?auto_148274 - BLOCK
      ?auto_148269 - BLOCK
      ?auto_148273 - BLOCK
      ?auto_148267 - BLOCK
      ?auto_148272 - BLOCK
      ?auto_148271 - BLOCK
      ?auto_148268 - BLOCK
      ?auto_148270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148266 ?auto_148274 ) ( not ( = ?auto_148266 ?auto_148274 ) ) ( not ( = ?auto_148266 ?auto_148269 ) ) ( not ( = ?auto_148266 ?auto_148273 ) ) ( not ( = ?auto_148274 ?auto_148269 ) ) ( not ( = ?auto_148274 ?auto_148273 ) ) ( not ( = ?auto_148269 ?auto_148273 ) ) ( ON ?auto_148269 ?auto_148266 ) ( ON-TABLE ?auto_148274 ) ( ON-TABLE ?auto_148267 ) ( not ( = ?auto_148267 ?auto_148272 ) ) ( not ( = ?auto_148267 ?auto_148271 ) ) ( not ( = ?auto_148267 ?auto_148268 ) ) ( not ( = ?auto_148267 ?auto_148270 ) ) ( not ( = ?auto_148267 ?auto_148273 ) ) ( not ( = ?auto_148272 ?auto_148271 ) ) ( not ( = ?auto_148272 ?auto_148268 ) ) ( not ( = ?auto_148272 ?auto_148270 ) ) ( not ( = ?auto_148272 ?auto_148273 ) ) ( not ( = ?auto_148271 ?auto_148268 ) ) ( not ( = ?auto_148271 ?auto_148270 ) ) ( not ( = ?auto_148271 ?auto_148273 ) ) ( not ( = ?auto_148268 ?auto_148270 ) ) ( not ( = ?auto_148268 ?auto_148273 ) ) ( not ( = ?auto_148270 ?auto_148273 ) ) ( not ( = ?auto_148266 ?auto_148270 ) ) ( not ( = ?auto_148266 ?auto_148267 ) ) ( not ( = ?auto_148266 ?auto_148272 ) ) ( not ( = ?auto_148266 ?auto_148271 ) ) ( not ( = ?auto_148266 ?auto_148268 ) ) ( not ( = ?auto_148274 ?auto_148270 ) ) ( not ( = ?auto_148274 ?auto_148267 ) ) ( not ( = ?auto_148274 ?auto_148272 ) ) ( not ( = ?auto_148274 ?auto_148271 ) ) ( not ( = ?auto_148274 ?auto_148268 ) ) ( not ( = ?auto_148269 ?auto_148270 ) ) ( not ( = ?auto_148269 ?auto_148267 ) ) ( not ( = ?auto_148269 ?auto_148272 ) ) ( not ( = ?auto_148269 ?auto_148271 ) ) ( not ( = ?auto_148269 ?auto_148268 ) ) ( ON ?auto_148273 ?auto_148269 ) ( ON ?auto_148270 ?auto_148273 ) ( ON ?auto_148268 ?auto_148270 ) ( ON ?auto_148271 ?auto_148268 ) ( CLEAR ?auto_148267 ) ( ON ?auto_148272 ?auto_148271 ) ( CLEAR ?auto_148272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148274 ?auto_148266 ?auto_148269 ?auto_148273 ?auto_148270 ?auto_148268 ?auto_148271 )
      ( MAKE-1PILE ?auto_148266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148275 - BLOCK
    )
    :vars
    (
      ?auto_148277 - BLOCK
      ?auto_148282 - BLOCK
      ?auto_148279 - BLOCK
      ?auto_148281 - BLOCK
      ?auto_148280 - BLOCK
      ?auto_148278 - BLOCK
      ?auto_148276 - BLOCK
      ?auto_148283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148275 ?auto_148277 ) ( not ( = ?auto_148275 ?auto_148277 ) ) ( not ( = ?auto_148275 ?auto_148282 ) ) ( not ( = ?auto_148275 ?auto_148279 ) ) ( not ( = ?auto_148277 ?auto_148282 ) ) ( not ( = ?auto_148277 ?auto_148279 ) ) ( not ( = ?auto_148282 ?auto_148279 ) ) ( ON ?auto_148282 ?auto_148275 ) ( ON-TABLE ?auto_148277 ) ( not ( = ?auto_148281 ?auto_148280 ) ) ( not ( = ?auto_148281 ?auto_148278 ) ) ( not ( = ?auto_148281 ?auto_148276 ) ) ( not ( = ?auto_148281 ?auto_148283 ) ) ( not ( = ?auto_148281 ?auto_148279 ) ) ( not ( = ?auto_148280 ?auto_148278 ) ) ( not ( = ?auto_148280 ?auto_148276 ) ) ( not ( = ?auto_148280 ?auto_148283 ) ) ( not ( = ?auto_148280 ?auto_148279 ) ) ( not ( = ?auto_148278 ?auto_148276 ) ) ( not ( = ?auto_148278 ?auto_148283 ) ) ( not ( = ?auto_148278 ?auto_148279 ) ) ( not ( = ?auto_148276 ?auto_148283 ) ) ( not ( = ?auto_148276 ?auto_148279 ) ) ( not ( = ?auto_148283 ?auto_148279 ) ) ( not ( = ?auto_148275 ?auto_148283 ) ) ( not ( = ?auto_148275 ?auto_148281 ) ) ( not ( = ?auto_148275 ?auto_148280 ) ) ( not ( = ?auto_148275 ?auto_148278 ) ) ( not ( = ?auto_148275 ?auto_148276 ) ) ( not ( = ?auto_148277 ?auto_148283 ) ) ( not ( = ?auto_148277 ?auto_148281 ) ) ( not ( = ?auto_148277 ?auto_148280 ) ) ( not ( = ?auto_148277 ?auto_148278 ) ) ( not ( = ?auto_148277 ?auto_148276 ) ) ( not ( = ?auto_148282 ?auto_148283 ) ) ( not ( = ?auto_148282 ?auto_148281 ) ) ( not ( = ?auto_148282 ?auto_148280 ) ) ( not ( = ?auto_148282 ?auto_148278 ) ) ( not ( = ?auto_148282 ?auto_148276 ) ) ( ON ?auto_148279 ?auto_148282 ) ( ON ?auto_148283 ?auto_148279 ) ( ON ?auto_148276 ?auto_148283 ) ( ON ?auto_148278 ?auto_148276 ) ( ON ?auto_148280 ?auto_148278 ) ( CLEAR ?auto_148280 ) ( HOLDING ?auto_148281 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148281 )
      ( MAKE-1PILE ?auto_148275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148284 - BLOCK
    )
    :vars
    (
      ?auto_148285 - BLOCK
      ?auto_148289 - BLOCK
      ?auto_148286 - BLOCK
      ?auto_148287 - BLOCK
      ?auto_148288 - BLOCK
      ?auto_148292 - BLOCK
      ?auto_148291 - BLOCK
      ?auto_148290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148284 ?auto_148285 ) ( not ( = ?auto_148284 ?auto_148285 ) ) ( not ( = ?auto_148284 ?auto_148289 ) ) ( not ( = ?auto_148284 ?auto_148286 ) ) ( not ( = ?auto_148285 ?auto_148289 ) ) ( not ( = ?auto_148285 ?auto_148286 ) ) ( not ( = ?auto_148289 ?auto_148286 ) ) ( ON ?auto_148289 ?auto_148284 ) ( ON-TABLE ?auto_148285 ) ( not ( = ?auto_148287 ?auto_148288 ) ) ( not ( = ?auto_148287 ?auto_148292 ) ) ( not ( = ?auto_148287 ?auto_148291 ) ) ( not ( = ?auto_148287 ?auto_148290 ) ) ( not ( = ?auto_148287 ?auto_148286 ) ) ( not ( = ?auto_148288 ?auto_148292 ) ) ( not ( = ?auto_148288 ?auto_148291 ) ) ( not ( = ?auto_148288 ?auto_148290 ) ) ( not ( = ?auto_148288 ?auto_148286 ) ) ( not ( = ?auto_148292 ?auto_148291 ) ) ( not ( = ?auto_148292 ?auto_148290 ) ) ( not ( = ?auto_148292 ?auto_148286 ) ) ( not ( = ?auto_148291 ?auto_148290 ) ) ( not ( = ?auto_148291 ?auto_148286 ) ) ( not ( = ?auto_148290 ?auto_148286 ) ) ( not ( = ?auto_148284 ?auto_148290 ) ) ( not ( = ?auto_148284 ?auto_148287 ) ) ( not ( = ?auto_148284 ?auto_148288 ) ) ( not ( = ?auto_148284 ?auto_148292 ) ) ( not ( = ?auto_148284 ?auto_148291 ) ) ( not ( = ?auto_148285 ?auto_148290 ) ) ( not ( = ?auto_148285 ?auto_148287 ) ) ( not ( = ?auto_148285 ?auto_148288 ) ) ( not ( = ?auto_148285 ?auto_148292 ) ) ( not ( = ?auto_148285 ?auto_148291 ) ) ( not ( = ?auto_148289 ?auto_148290 ) ) ( not ( = ?auto_148289 ?auto_148287 ) ) ( not ( = ?auto_148289 ?auto_148288 ) ) ( not ( = ?auto_148289 ?auto_148292 ) ) ( not ( = ?auto_148289 ?auto_148291 ) ) ( ON ?auto_148286 ?auto_148289 ) ( ON ?auto_148290 ?auto_148286 ) ( ON ?auto_148291 ?auto_148290 ) ( ON ?auto_148292 ?auto_148291 ) ( ON ?auto_148288 ?auto_148292 ) ( ON ?auto_148287 ?auto_148288 ) ( CLEAR ?auto_148287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148285 ?auto_148284 ?auto_148289 ?auto_148286 ?auto_148290 ?auto_148291 ?auto_148292 ?auto_148288 )
      ( MAKE-1PILE ?auto_148284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148306 - BLOCK
      ?auto_148307 - BLOCK
      ?auto_148308 - BLOCK
      ?auto_148309 - BLOCK
      ?auto_148310 - BLOCK
      ?auto_148311 - BLOCK
    )
    :vars
    (
      ?auto_148312 - BLOCK
      ?auto_148313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148312 ?auto_148311 ) ( CLEAR ?auto_148312 ) ( ON-TABLE ?auto_148306 ) ( ON ?auto_148307 ?auto_148306 ) ( ON ?auto_148308 ?auto_148307 ) ( ON ?auto_148309 ?auto_148308 ) ( ON ?auto_148310 ?auto_148309 ) ( ON ?auto_148311 ?auto_148310 ) ( not ( = ?auto_148306 ?auto_148307 ) ) ( not ( = ?auto_148306 ?auto_148308 ) ) ( not ( = ?auto_148306 ?auto_148309 ) ) ( not ( = ?auto_148306 ?auto_148310 ) ) ( not ( = ?auto_148306 ?auto_148311 ) ) ( not ( = ?auto_148306 ?auto_148312 ) ) ( not ( = ?auto_148307 ?auto_148308 ) ) ( not ( = ?auto_148307 ?auto_148309 ) ) ( not ( = ?auto_148307 ?auto_148310 ) ) ( not ( = ?auto_148307 ?auto_148311 ) ) ( not ( = ?auto_148307 ?auto_148312 ) ) ( not ( = ?auto_148308 ?auto_148309 ) ) ( not ( = ?auto_148308 ?auto_148310 ) ) ( not ( = ?auto_148308 ?auto_148311 ) ) ( not ( = ?auto_148308 ?auto_148312 ) ) ( not ( = ?auto_148309 ?auto_148310 ) ) ( not ( = ?auto_148309 ?auto_148311 ) ) ( not ( = ?auto_148309 ?auto_148312 ) ) ( not ( = ?auto_148310 ?auto_148311 ) ) ( not ( = ?auto_148310 ?auto_148312 ) ) ( not ( = ?auto_148311 ?auto_148312 ) ) ( HOLDING ?auto_148313 ) ( not ( = ?auto_148306 ?auto_148313 ) ) ( not ( = ?auto_148307 ?auto_148313 ) ) ( not ( = ?auto_148308 ?auto_148313 ) ) ( not ( = ?auto_148309 ?auto_148313 ) ) ( not ( = ?auto_148310 ?auto_148313 ) ) ( not ( = ?auto_148311 ?auto_148313 ) ) ( not ( = ?auto_148312 ?auto_148313 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_148313 )
      ( MAKE-6PILE ?auto_148306 ?auto_148307 ?auto_148308 ?auto_148309 ?auto_148310 ?auto_148311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148431 - BLOCK
      ?auto_148432 - BLOCK
    )
    :vars
    (
      ?auto_148433 - BLOCK
      ?auto_148436 - BLOCK
      ?auto_148438 - BLOCK
      ?auto_148435 - BLOCK
      ?auto_148437 - BLOCK
      ?auto_148434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148431 ?auto_148432 ) ) ( ON ?auto_148432 ?auto_148433 ) ( not ( = ?auto_148431 ?auto_148433 ) ) ( not ( = ?auto_148432 ?auto_148433 ) ) ( ON ?auto_148431 ?auto_148432 ) ( CLEAR ?auto_148431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148436 ) ( ON ?auto_148438 ?auto_148436 ) ( ON ?auto_148435 ?auto_148438 ) ( ON ?auto_148437 ?auto_148435 ) ( ON ?auto_148434 ?auto_148437 ) ( ON ?auto_148433 ?auto_148434 ) ( not ( = ?auto_148436 ?auto_148438 ) ) ( not ( = ?auto_148436 ?auto_148435 ) ) ( not ( = ?auto_148436 ?auto_148437 ) ) ( not ( = ?auto_148436 ?auto_148434 ) ) ( not ( = ?auto_148436 ?auto_148433 ) ) ( not ( = ?auto_148436 ?auto_148432 ) ) ( not ( = ?auto_148436 ?auto_148431 ) ) ( not ( = ?auto_148438 ?auto_148435 ) ) ( not ( = ?auto_148438 ?auto_148437 ) ) ( not ( = ?auto_148438 ?auto_148434 ) ) ( not ( = ?auto_148438 ?auto_148433 ) ) ( not ( = ?auto_148438 ?auto_148432 ) ) ( not ( = ?auto_148438 ?auto_148431 ) ) ( not ( = ?auto_148435 ?auto_148437 ) ) ( not ( = ?auto_148435 ?auto_148434 ) ) ( not ( = ?auto_148435 ?auto_148433 ) ) ( not ( = ?auto_148435 ?auto_148432 ) ) ( not ( = ?auto_148435 ?auto_148431 ) ) ( not ( = ?auto_148437 ?auto_148434 ) ) ( not ( = ?auto_148437 ?auto_148433 ) ) ( not ( = ?auto_148437 ?auto_148432 ) ) ( not ( = ?auto_148437 ?auto_148431 ) ) ( not ( = ?auto_148434 ?auto_148433 ) ) ( not ( = ?auto_148434 ?auto_148432 ) ) ( not ( = ?auto_148434 ?auto_148431 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148436 ?auto_148438 ?auto_148435 ?auto_148437 ?auto_148434 ?auto_148433 ?auto_148432 )
      ( MAKE-2PILE ?auto_148431 ?auto_148432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148441 - BLOCK
      ?auto_148442 - BLOCK
    )
    :vars
    (
      ?auto_148443 - BLOCK
      ?auto_148444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148441 ?auto_148442 ) ) ( ON ?auto_148442 ?auto_148443 ) ( CLEAR ?auto_148442 ) ( not ( = ?auto_148441 ?auto_148443 ) ) ( not ( = ?auto_148442 ?auto_148443 ) ) ( ON ?auto_148441 ?auto_148444 ) ( CLEAR ?auto_148441 ) ( HAND-EMPTY ) ( not ( = ?auto_148441 ?auto_148444 ) ) ( not ( = ?auto_148442 ?auto_148444 ) ) ( not ( = ?auto_148443 ?auto_148444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148441 ?auto_148444 )
      ( MAKE-2PILE ?auto_148441 ?auto_148442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148445 - BLOCK
      ?auto_148446 - BLOCK
    )
    :vars
    (
      ?auto_148448 - BLOCK
      ?auto_148447 - BLOCK
      ?auto_148449 - BLOCK
      ?auto_148450 - BLOCK
      ?auto_148452 - BLOCK
      ?auto_148451 - BLOCK
      ?auto_148453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148445 ?auto_148446 ) ) ( not ( = ?auto_148445 ?auto_148448 ) ) ( not ( = ?auto_148446 ?auto_148448 ) ) ( ON ?auto_148445 ?auto_148447 ) ( CLEAR ?auto_148445 ) ( not ( = ?auto_148445 ?auto_148447 ) ) ( not ( = ?auto_148446 ?auto_148447 ) ) ( not ( = ?auto_148448 ?auto_148447 ) ) ( HOLDING ?auto_148446 ) ( CLEAR ?auto_148448 ) ( ON-TABLE ?auto_148449 ) ( ON ?auto_148450 ?auto_148449 ) ( ON ?auto_148452 ?auto_148450 ) ( ON ?auto_148451 ?auto_148452 ) ( ON ?auto_148453 ?auto_148451 ) ( ON ?auto_148448 ?auto_148453 ) ( not ( = ?auto_148449 ?auto_148450 ) ) ( not ( = ?auto_148449 ?auto_148452 ) ) ( not ( = ?auto_148449 ?auto_148451 ) ) ( not ( = ?auto_148449 ?auto_148453 ) ) ( not ( = ?auto_148449 ?auto_148448 ) ) ( not ( = ?auto_148449 ?auto_148446 ) ) ( not ( = ?auto_148450 ?auto_148452 ) ) ( not ( = ?auto_148450 ?auto_148451 ) ) ( not ( = ?auto_148450 ?auto_148453 ) ) ( not ( = ?auto_148450 ?auto_148448 ) ) ( not ( = ?auto_148450 ?auto_148446 ) ) ( not ( = ?auto_148452 ?auto_148451 ) ) ( not ( = ?auto_148452 ?auto_148453 ) ) ( not ( = ?auto_148452 ?auto_148448 ) ) ( not ( = ?auto_148452 ?auto_148446 ) ) ( not ( = ?auto_148451 ?auto_148453 ) ) ( not ( = ?auto_148451 ?auto_148448 ) ) ( not ( = ?auto_148451 ?auto_148446 ) ) ( not ( = ?auto_148453 ?auto_148448 ) ) ( not ( = ?auto_148453 ?auto_148446 ) ) ( not ( = ?auto_148445 ?auto_148449 ) ) ( not ( = ?auto_148445 ?auto_148450 ) ) ( not ( = ?auto_148445 ?auto_148452 ) ) ( not ( = ?auto_148445 ?auto_148451 ) ) ( not ( = ?auto_148445 ?auto_148453 ) ) ( not ( = ?auto_148447 ?auto_148449 ) ) ( not ( = ?auto_148447 ?auto_148450 ) ) ( not ( = ?auto_148447 ?auto_148452 ) ) ( not ( = ?auto_148447 ?auto_148451 ) ) ( not ( = ?auto_148447 ?auto_148453 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148449 ?auto_148450 ?auto_148452 ?auto_148451 ?auto_148453 ?auto_148448 ?auto_148446 )
      ( MAKE-2PILE ?auto_148445 ?auto_148446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148454 - BLOCK
      ?auto_148455 - BLOCK
    )
    :vars
    (
      ?auto_148458 - BLOCK
      ?auto_148457 - BLOCK
      ?auto_148456 - BLOCK
      ?auto_148459 - BLOCK
      ?auto_148462 - BLOCK
      ?auto_148460 - BLOCK
      ?auto_148461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148454 ?auto_148455 ) ) ( not ( = ?auto_148454 ?auto_148458 ) ) ( not ( = ?auto_148455 ?auto_148458 ) ) ( ON ?auto_148454 ?auto_148457 ) ( not ( = ?auto_148454 ?auto_148457 ) ) ( not ( = ?auto_148455 ?auto_148457 ) ) ( not ( = ?auto_148458 ?auto_148457 ) ) ( CLEAR ?auto_148458 ) ( ON-TABLE ?auto_148456 ) ( ON ?auto_148459 ?auto_148456 ) ( ON ?auto_148462 ?auto_148459 ) ( ON ?auto_148460 ?auto_148462 ) ( ON ?auto_148461 ?auto_148460 ) ( ON ?auto_148458 ?auto_148461 ) ( not ( = ?auto_148456 ?auto_148459 ) ) ( not ( = ?auto_148456 ?auto_148462 ) ) ( not ( = ?auto_148456 ?auto_148460 ) ) ( not ( = ?auto_148456 ?auto_148461 ) ) ( not ( = ?auto_148456 ?auto_148458 ) ) ( not ( = ?auto_148456 ?auto_148455 ) ) ( not ( = ?auto_148459 ?auto_148462 ) ) ( not ( = ?auto_148459 ?auto_148460 ) ) ( not ( = ?auto_148459 ?auto_148461 ) ) ( not ( = ?auto_148459 ?auto_148458 ) ) ( not ( = ?auto_148459 ?auto_148455 ) ) ( not ( = ?auto_148462 ?auto_148460 ) ) ( not ( = ?auto_148462 ?auto_148461 ) ) ( not ( = ?auto_148462 ?auto_148458 ) ) ( not ( = ?auto_148462 ?auto_148455 ) ) ( not ( = ?auto_148460 ?auto_148461 ) ) ( not ( = ?auto_148460 ?auto_148458 ) ) ( not ( = ?auto_148460 ?auto_148455 ) ) ( not ( = ?auto_148461 ?auto_148458 ) ) ( not ( = ?auto_148461 ?auto_148455 ) ) ( not ( = ?auto_148454 ?auto_148456 ) ) ( not ( = ?auto_148454 ?auto_148459 ) ) ( not ( = ?auto_148454 ?auto_148462 ) ) ( not ( = ?auto_148454 ?auto_148460 ) ) ( not ( = ?auto_148454 ?auto_148461 ) ) ( not ( = ?auto_148457 ?auto_148456 ) ) ( not ( = ?auto_148457 ?auto_148459 ) ) ( not ( = ?auto_148457 ?auto_148462 ) ) ( not ( = ?auto_148457 ?auto_148460 ) ) ( not ( = ?auto_148457 ?auto_148461 ) ) ( ON ?auto_148455 ?auto_148454 ) ( CLEAR ?auto_148455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148457 ?auto_148454 )
      ( MAKE-2PILE ?auto_148454 ?auto_148455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148463 - BLOCK
      ?auto_148464 - BLOCK
    )
    :vars
    (
      ?auto_148467 - BLOCK
      ?auto_148470 - BLOCK
      ?auto_148465 - BLOCK
      ?auto_148471 - BLOCK
      ?auto_148466 - BLOCK
      ?auto_148469 - BLOCK
      ?auto_148468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148463 ?auto_148464 ) ) ( not ( = ?auto_148463 ?auto_148467 ) ) ( not ( = ?auto_148464 ?auto_148467 ) ) ( ON ?auto_148463 ?auto_148470 ) ( not ( = ?auto_148463 ?auto_148470 ) ) ( not ( = ?auto_148464 ?auto_148470 ) ) ( not ( = ?auto_148467 ?auto_148470 ) ) ( ON-TABLE ?auto_148465 ) ( ON ?auto_148471 ?auto_148465 ) ( ON ?auto_148466 ?auto_148471 ) ( ON ?auto_148469 ?auto_148466 ) ( ON ?auto_148468 ?auto_148469 ) ( not ( = ?auto_148465 ?auto_148471 ) ) ( not ( = ?auto_148465 ?auto_148466 ) ) ( not ( = ?auto_148465 ?auto_148469 ) ) ( not ( = ?auto_148465 ?auto_148468 ) ) ( not ( = ?auto_148465 ?auto_148467 ) ) ( not ( = ?auto_148465 ?auto_148464 ) ) ( not ( = ?auto_148471 ?auto_148466 ) ) ( not ( = ?auto_148471 ?auto_148469 ) ) ( not ( = ?auto_148471 ?auto_148468 ) ) ( not ( = ?auto_148471 ?auto_148467 ) ) ( not ( = ?auto_148471 ?auto_148464 ) ) ( not ( = ?auto_148466 ?auto_148469 ) ) ( not ( = ?auto_148466 ?auto_148468 ) ) ( not ( = ?auto_148466 ?auto_148467 ) ) ( not ( = ?auto_148466 ?auto_148464 ) ) ( not ( = ?auto_148469 ?auto_148468 ) ) ( not ( = ?auto_148469 ?auto_148467 ) ) ( not ( = ?auto_148469 ?auto_148464 ) ) ( not ( = ?auto_148468 ?auto_148467 ) ) ( not ( = ?auto_148468 ?auto_148464 ) ) ( not ( = ?auto_148463 ?auto_148465 ) ) ( not ( = ?auto_148463 ?auto_148471 ) ) ( not ( = ?auto_148463 ?auto_148466 ) ) ( not ( = ?auto_148463 ?auto_148469 ) ) ( not ( = ?auto_148463 ?auto_148468 ) ) ( not ( = ?auto_148470 ?auto_148465 ) ) ( not ( = ?auto_148470 ?auto_148471 ) ) ( not ( = ?auto_148470 ?auto_148466 ) ) ( not ( = ?auto_148470 ?auto_148469 ) ) ( not ( = ?auto_148470 ?auto_148468 ) ) ( ON ?auto_148464 ?auto_148463 ) ( CLEAR ?auto_148464 ) ( ON-TABLE ?auto_148470 ) ( HOLDING ?auto_148467 ) ( CLEAR ?auto_148468 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148465 ?auto_148471 ?auto_148466 ?auto_148469 ?auto_148468 ?auto_148467 )
      ( MAKE-2PILE ?auto_148463 ?auto_148464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148472 - BLOCK
      ?auto_148473 - BLOCK
    )
    :vars
    (
      ?auto_148478 - BLOCK
      ?auto_148479 - BLOCK
      ?auto_148477 - BLOCK
      ?auto_148480 - BLOCK
      ?auto_148476 - BLOCK
      ?auto_148475 - BLOCK
      ?auto_148474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148472 ?auto_148473 ) ) ( not ( = ?auto_148472 ?auto_148478 ) ) ( not ( = ?auto_148473 ?auto_148478 ) ) ( ON ?auto_148472 ?auto_148479 ) ( not ( = ?auto_148472 ?auto_148479 ) ) ( not ( = ?auto_148473 ?auto_148479 ) ) ( not ( = ?auto_148478 ?auto_148479 ) ) ( ON-TABLE ?auto_148477 ) ( ON ?auto_148480 ?auto_148477 ) ( ON ?auto_148476 ?auto_148480 ) ( ON ?auto_148475 ?auto_148476 ) ( ON ?auto_148474 ?auto_148475 ) ( not ( = ?auto_148477 ?auto_148480 ) ) ( not ( = ?auto_148477 ?auto_148476 ) ) ( not ( = ?auto_148477 ?auto_148475 ) ) ( not ( = ?auto_148477 ?auto_148474 ) ) ( not ( = ?auto_148477 ?auto_148478 ) ) ( not ( = ?auto_148477 ?auto_148473 ) ) ( not ( = ?auto_148480 ?auto_148476 ) ) ( not ( = ?auto_148480 ?auto_148475 ) ) ( not ( = ?auto_148480 ?auto_148474 ) ) ( not ( = ?auto_148480 ?auto_148478 ) ) ( not ( = ?auto_148480 ?auto_148473 ) ) ( not ( = ?auto_148476 ?auto_148475 ) ) ( not ( = ?auto_148476 ?auto_148474 ) ) ( not ( = ?auto_148476 ?auto_148478 ) ) ( not ( = ?auto_148476 ?auto_148473 ) ) ( not ( = ?auto_148475 ?auto_148474 ) ) ( not ( = ?auto_148475 ?auto_148478 ) ) ( not ( = ?auto_148475 ?auto_148473 ) ) ( not ( = ?auto_148474 ?auto_148478 ) ) ( not ( = ?auto_148474 ?auto_148473 ) ) ( not ( = ?auto_148472 ?auto_148477 ) ) ( not ( = ?auto_148472 ?auto_148480 ) ) ( not ( = ?auto_148472 ?auto_148476 ) ) ( not ( = ?auto_148472 ?auto_148475 ) ) ( not ( = ?auto_148472 ?auto_148474 ) ) ( not ( = ?auto_148479 ?auto_148477 ) ) ( not ( = ?auto_148479 ?auto_148480 ) ) ( not ( = ?auto_148479 ?auto_148476 ) ) ( not ( = ?auto_148479 ?auto_148475 ) ) ( not ( = ?auto_148479 ?auto_148474 ) ) ( ON ?auto_148473 ?auto_148472 ) ( ON-TABLE ?auto_148479 ) ( CLEAR ?auto_148474 ) ( ON ?auto_148478 ?auto_148473 ) ( CLEAR ?auto_148478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148479 ?auto_148472 ?auto_148473 )
      ( MAKE-2PILE ?auto_148472 ?auto_148473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148481 - BLOCK
      ?auto_148482 - BLOCK
    )
    :vars
    (
      ?auto_148487 - BLOCK
      ?auto_148486 - BLOCK
      ?auto_148484 - BLOCK
      ?auto_148483 - BLOCK
      ?auto_148489 - BLOCK
      ?auto_148488 - BLOCK
      ?auto_148485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148481 ?auto_148482 ) ) ( not ( = ?auto_148481 ?auto_148487 ) ) ( not ( = ?auto_148482 ?auto_148487 ) ) ( ON ?auto_148481 ?auto_148486 ) ( not ( = ?auto_148481 ?auto_148486 ) ) ( not ( = ?auto_148482 ?auto_148486 ) ) ( not ( = ?auto_148487 ?auto_148486 ) ) ( ON-TABLE ?auto_148484 ) ( ON ?auto_148483 ?auto_148484 ) ( ON ?auto_148489 ?auto_148483 ) ( ON ?auto_148488 ?auto_148489 ) ( not ( = ?auto_148484 ?auto_148483 ) ) ( not ( = ?auto_148484 ?auto_148489 ) ) ( not ( = ?auto_148484 ?auto_148488 ) ) ( not ( = ?auto_148484 ?auto_148485 ) ) ( not ( = ?auto_148484 ?auto_148487 ) ) ( not ( = ?auto_148484 ?auto_148482 ) ) ( not ( = ?auto_148483 ?auto_148489 ) ) ( not ( = ?auto_148483 ?auto_148488 ) ) ( not ( = ?auto_148483 ?auto_148485 ) ) ( not ( = ?auto_148483 ?auto_148487 ) ) ( not ( = ?auto_148483 ?auto_148482 ) ) ( not ( = ?auto_148489 ?auto_148488 ) ) ( not ( = ?auto_148489 ?auto_148485 ) ) ( not ( = ?auto_148489 ?auto_148487 ) ) ( not ( = ?auto_148489 ?auto_148482 ) ) ( not ( = ?auto_148488 ?auto_148485 ) ) ( not ( = ?auto_148488 ?auto_148487 ) ) ( not ( = ?auto_148488 ?auto_148482 ) ) ( not ( = ?auto_148485 ?auto_148487 ) ) ( not ( = ?auto_148485 ?auto_148482 ) ) ( not ( = ?auto_148481 ?auto_148484 ) ) ( not ( = ?auto_148481 ?auto_148483 ) ) ( not ( = ?auto_148481 ?auto_148489 ) ) ( not ( = ?auto_148481 ?auto_148488 ) ) ( not ( = ?auto_148481 ?auto_148485 ) ) ( not ( = ?auto_148486 ?auto_148484 ) ) ( not ( = ?auto_148486 ?auto_148483 ) ) ( not ( = ?auto_148486 ?auto_148489 ) ) ( not ( = ?auto_148486 ?auto_148488 ) ) ( not ( = ?auto_148486 ?auto_148485 ) ) ( ON ?auto_148482 ?auto_148481 ) ( ON-TABLE ?auto_148486 ) ( ON ?auto_148487 ?auto_148482 ) ( CLEAR ?auto_148487 ) ( HOLDING ?auto_148485 ) ( CLEAR ?auto_148488 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148484 ?auto_148483 ?auto_148489 ?auto_148488 ?auto_148485 )
      ( MAKE-2PILE ?auto_148481 ?auto_148482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148490 - BLOCK
      ?auto_148491 - BLOCK
    )
    :vars
    (
      ?auto_148498 - BLOCK
      ?auto_148495 - BLOCK
      ?auto_148496 - BLOCK
      ?auto_148492 - BLOCK
      ?auto_148497 - BLOCK
      ?auto_148493 - BLOCK
      ?auto_148494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148490 ?auto_148491 ) ) ( not ( = ?auto_148490 ?auto_148498 ) ) ( not ( = ?auto_148491 ?auto_148498 ) ) ( ON ?auto_148490 ?auto_148495 ) ( not ( = ?auto_148490 ?auto_148495 ) ) ( not ( = ?auto_148491 ?auto_148495 ) ) ( not ( = ?auto_148498 ?auto_148495 ) ) ( ON-TABLE ?auto_148496 ) ( ON ?auto_148492 ?auto_148496 ) ( ON ?auto_148497 ?auto_148492 ) ( ON ?auto_148493 ?auto_148497 ) ( not ( = ?auto_148496 ?auto_148492 ) ) ( not ( = ?auto_148496 ?auto_148497 ) ) ( not ( = ?auto_148496 ?auto_148493 ) ) ( not ( = ?auto_148496 ?auto_148494 ) ) ( not ( = ?auto_148496 ?auto_148498 ) ) ( not ( = ?auto_148496 ?auto_148491 ) ) ( not ( = ?auto_148492 ?auto_148497 ) ) ( not ( = ?auto_148492 ?auto_148493 ) ) ( not ( = ?auto_148492 ?auto_148494 ) ) ( not ( = ?auto_148492 ?auto_148498 ) ) ( not ( = ?auto_148492 ?auto_148491 ) ) ( not ( = ?auto_148497 ?auto_148493 ) ) ( not ( = ?auto_148497 ?auto_148494 ) ) ( not ( = ?auto_148497 ?auto_148498 ) ) ( not ( = ?auto_148497 ?auto_148491 ) ) ( not ( = ?auto_148493 ?auto_148494 ) ) ( not ( = ?auto_148493 ?auto_148498 ) ) ( not ( = ?auto_148493 ?auto_148491 ) ) ( not ( = ?auto_148494 ?auto_148498 ) ) ( not ( = ?auto_148494 ?auto_148491 ) ) ( not ( = ?auto_148490 ?auto_148496 ) ) ( not ( = ?auto_148490 ?auto_148492 ) ) ( not ( = ?auto_148490 ?auto_148497 ) ) ( not ( = ?auto_148490 ?auto_148493 ) ) ( not ( = ?auto_148490 ?auto_148494 ) ) ( not ( = ?auto_148495 ?auto_148496 ) ) ( not ( = ?auto_148495 ?auto_148492 ) ) ( not ( = ?auto_148495 ?auto_148497 ) ) ( not ( = ?auto_148495 ?auto_148493 ) ) ( not ( = ?auto_148495 ?auto_148494 ) ) ( ON ?auto_148491 ?auto_148490 ) ( ON-TABLE ?auto_148495 ) ( ON ?auto_148498 ?auto_148491 ) ( CLEAR ?auto_148493 ) ( ON ?auto_148494 ?auto_148498 ) ( CLEAR ?auto_148494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148495 ?auto_148490 ?auto_148491 ?auto_148498 )
      ( MAKE-2PILE ?auto_148490 ?auto_148491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148499 - BLOCK
      ?auto_148500 - BLOCK
    )
    :vars
    (
      ?auto_148501 - BLOCK
      ?auto_148507 - BLOCK
      ?auto_148505 - BLOCK
      ?auto_148504 - BLOCK
      ?auto_148502 - BLOCK
      ?auto_148506 - BLOCK
      ?auto_148503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148499 ?auto_148500 ) ) ( not ( = ?auto_148499 ?auto_148501 ) ) ( not ( = ?auto_148500 ?auto_148501 ) ) ( ON ?auto_148499 ?auto_148507 ) ( not ( = ?auto_148499 ?auto_148507 ) ) ( not ( = ?auto_148500 ?auto_148507 ) ) ( not ( = ?auto_148501 ?auto_148507 ) ) ( ON-TABLE ?auto_148505 ) ( ON ?auto_148504 ?auto_148505 ) ( ON ?auto_148502 ?auto_148504 ) ( not ( = ?auto_148505 ?auto_148504 ) ) ( not ( = ?auto_148505 ?auto_148502 ) ) ( not ( = ?auto_148505 ?auto_148506 ) ) ( not ( = ?auto_148505 ?auto_148503 ) ) ( not ( = ?auto_148505 ?auto_148501 ) ) ( not ( = ?auto_148505 ?auto_148500 ) ) ( not ( = ?auto_148504 ?auto_148502 ) ) ( not ( = ?auto_148504 ?auto_148506 ) ) ( not ( = ?auto_148504 ?auto_148503 ) ) ( not ( = ?auto_148504 ?auto_148501 ) ) ( not ( = ?auto_148504 ?auto_148500 ) ) ( not ( = ?auto_148502 ?auto_148506 ) ) ( not ( = ?auto_148502 ?auto_148503 ) ) ( not ( = ?auto_148502 ?auto_148501 ) ) ( not ( = ?auto_148502 ?auto_148500 ) ) ( not ( = ?auto_148506 ?auto_148503 ) ) ( not ( = ?auto_148506 ?auto_148501 ) ) ( not ( = ?auto_148506 ?auto_148500 ) ) ( not ( = ?auto_148503 ?auto_148501 ) ) ( not ( = ?auto_148503 ?auto_148500 ) ) ( not ( = ?auto_148499 ?auto_148505 ) ) ( not ( = ?auto_148499 ?auto_148504 ) ) ( not ( = ?auto_148499 ?auto_148502 ) ) ( not ( = ?auto_148499 ?auto_148506 ) ) ( not ( = ?auto_148499 ?auto_148503 ) ) ( not ( = ?auto_148507 ?auto_148505 ) ) ( not ( = ?auto_148507 ?auto_148504 ) ) ( not ( = ?auto_148507 ?auto_148502 ) ) ( not ( = ?auto_148507 ?auto_148506 ) ) ( not ( = ?auto_148507 ?auto_148503 ) ) ( ON ?auto_148500 ?auto_148499 ) ( ON-TABLE ?auto_148507 ) ( ON ?auto_148501 ?auto_148500 ) ( ON ?auto_148503 ?auto_148501 ) ( CLEAR ?auto_148503 ) ( HOLDING ?auto_148506 ) ( CLEAR ?auto_148502 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148505 ?auto_148504 ?auto_148502 ?auto_148506 )
      ( MAKE-2PILE ?auto_148499 ?auto_148500 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148508 - BLOCK
      ?auto_148509 - BLOCK
    )
    :vars
    (
      ?auto_148511 - BLOCK
      ?auto_148514 - BLOCK
      ?auto_148515 - BLOCK
      ?auto_148516 - BLOCK
      ?auto_148513 - BLOCK
      ?auto_148512 - BLOCK
      ?auto_148510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148508 ?auto_148509 ) ) ( not ( = ?auto_148508 ?auto_148511 ) ) ( not ( = ?auto_148509 ?auto_148511 ) ) ( ON ?auto_148508 ?auto_148514 ) ( not ( = ?auto_148508 ?auto_148514 ) ) ( not ( = ?auto_148509 ?auto_148514 ) ) ( not ( = ?auto_148511 ?auto_148514 ) ) ( ON-TABLE ?auto_148515 ) ( ON ?auto_148516 ?auto_148515 ) ( ON ?auto_148513 ?auto_148516 ) ( not ( = ?auto_148515 ?auto_148516 ) ) ( not ( = ?auto_148515 ?auto_148513 ) ) ( not ( = ?auto_148515 ?auto_148512 ) ) ( not ( = ?auto_148515 ?auto_148510 ) ) ( not ( = ?auto_148515 ?auto_148511 ) ) ( not ( = ?auto_148515 ?auto_148509 ) ) ( not ( = ?auto_148516 ?auto_148513 ) ) ( not ( = ?auto_148516 ?auto_148512 ) ) ( not ( = ?auto_148516 ?auto_148510 ) ) ( not ( = ?auto_148516 ?auto_148511 ) ) ( not ( = ?auto_148516 ?auto_148509 ) ) ( not ( = ?auto_148513 ?auto_148512 ) ) ( not ( = ?auto_148513 ?auto_148510 ) ) ( not ( = ?auto_148513 ?auto_148511 ) ) ( not ( = ?auto_148513 ?auto_148509 ) ) ( not ( = ?auto_148512 ?auto_148510 ) ) ( not ( = ?auto_148512 ?auto_148511 ) ) ( not ( = ?auto_148512 ?auto_148509 ) ) ( not ( = ?auto_148510 ?auto_148511 ) ) ( not ( = ?auto_148510 ?auto_148509 ) ) ( not ( = ?auto_148508 ?auto_148515 ) ) ( not ( = ?auto_148508 ?auto_148516 ) ) ( not ( = ?auto_148508 ?auto_148513 ) ) ( not ( = ?auto_148508 ?auto_148512 ) ) ( not ( = ?auto_148508 ?auto_148510 ) ) ( not ( = ?auto_148514 ?auto_148515 ) ) ( not ( = ?auto_148514 ?auto_148516 ) ) ( not ( = ?auto_148514 ?auto_148513 ) ) ( not ( = ?auto_148514 ?auto_148512 ) ) ( not ( = ?auto_148514 ?auto_148510 ) ) ( ON ?auto_148509 ?auto_148508 ) ( ON-TABLE ?auto_148514 ) ( ON ?auto_148511 ?auto_148509 ) ( ON ?auto_148510 ?auto_148511 ) ( CLEAR ?auto_148513 ) ( ON ?auto_148512 ?auto_148510 ) ( CLEAR ?auto_148512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148514 ?auto_148508 ?auto_148509 ?auto_148511 ?auto_148510 )
      ( MAKE-2PILE ?auto_148508 ?auto_148509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148517 - BLOCK
      ?auto_148518 - BLOCK
    )
    :vars
    (
      ?auto_148521 - BLOCK
      ?auto_148524 - BLOCK
      ?auto_148525 - BLOCK
      ?auto_148519 - BLOCK
      ?auto_148522 - BLOCK
      ?auto_148520 - BLOCK
      ?auto_148523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148517 ?auto_148518 ) ) ( not ( = ?auto_148517 ?auto_148521 ) ) ( not ( = ?auto_148518 ?auto_148521 ) ) ( ON ?auto_148517 ?auto_148524 ) ( not ( = ?auto_148517 ?auto_148524 ) ) ( not ( = ?auto_148518 ?auto_148524 ) ) ( not ( = ?auto_148521 ?auto_148524 ) ) ( ON-TABLE ?auto_148525 ) ( ON ?auto_148519 ?auto_148525 ) ( not ( = ?auto_148525 ?auto_148519 ) ) ( not ( = ?auto_148525 ?auto_148522 ) ) ( not ( = ?auto_148525 ?auto_148520 ) ) ( not ( = ?auto_148525 ?auto_148523 ) ) ( not ( = ?auto_148525 ?auto_148521 ) ) ( not ( = ?auto_148525 ?auto_148518 ) ) ( not ( = ?auto_148519 ?auto_148522 ) ) ( not ( = ?auto_148519 ?auto_148520 ) ) ( not ( = ?auto_148519 ?auto_148523 ) ) ( not ( = ?auto_148519 ?auto_148521 ) ) ( not ( = ?auto_148519 ?auto_148518 ) ) ( not ( = ?auto_148522 ?auto_148520 ) ) ( not ( = ?auto_148522 ?auto_148523 ) ) ( not ( = ?auto_148522 ?auto_148521 ) ) ( not ( = ?auto_148522 ?auto_148518 ) ) ( not ( = ?auto_148520 ?auto_148523 ) ) ( not ( = ?auto_148520 ?auto_148521 ) ) ( not ( = ?auto_148520 ?auto_148518 ) ) ( not ( = ?auto_148523 ?auto_148521 ) ) ( not ( = ?auto_148523 ?auto_148518 ) ) ( not ( = ?auto_148517 ?auto_148525 ) ) ( not ( = ?auto_148517 ?auto_148519 ) ) ( not ( = ?auto_148517 ?auto_148522 ) ) ( not ( = ?auto_148517 ?auto_148520 ) ) ( not ( = ?auto_148517 ?auto_148523 ) ) ( not ( = ?auto_148524 ?auto_148525 ) ) ( not ( = ?auto_148524 ?auto_148519 ) ) ( not ( = ?auto_148524 ?auto_148522 ) ) ( not ( = ?auto_148524 ?auto_148520 ) ) ( not ( = ?auto_148524 ?auto_148523 ) ) ( ON ?auto_148518 ?auto_148517 ) ( ON-TABLE ?auto_148524 ) ( ON ?auto_148521 ?auto_148518 ) ( ON ?auto_148523 ?auto_148521 ) ( ON ?auto_148520 ?auto_148523 ) ( CLEAR ?auto_148520 ) ( HOLDING ?auto_148522 ) ( CLEAR ?auto_148519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148525 ?auto_148519 ?auto_148522 )
      ( MAKE-2PILE ?auto_148517 ?auto_148518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148526 - BLOCK
      ?auto_148527 - BLOCK
    )
    :vars
    (
      ?auto_148530 - BLOCK
      ?auto_148529 - BLOCK
      ?auto_148534 - BLOCK
      ?auto_148533 - BLOCK
      ?auto_148528 - BLOCK
      ?auto_148532 - BLOCK
      ?auto_148531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148526 ?auto_148527 ) ) ( not ( = ?auto_148526 ?auto_148530 ) ) ( not ( = ?auto_148527 ?auto_148530 ) ) ( ON ?auto_148526 ?auto_148529 ) ( not ( = ?auto_148526 ?auto_148529 ) ) ( not ( = ?auto_148527 ?auto_148529 ) ) ( not ( = ?auto_148530 ?auto_148529 ) ) ( ON-TABLE ?auto_148534 ) ( ON ?auto_148533 ?auto_148534 ) ( not ( = ?auto_148534 ?auto_148533 ) ) ( not ( = ?auto_148534 ?auto_148528 ) ) ( not ( = ?auto_148534 ?auto_148532 ) ) ( not ( = ?auto_148534 ?auto_148531 ) ) ( not ( = ?auto_148534 ?auto_148530 ) ) ( not ( = ?auto_148534 ?auto_148527 ) ) ( not ( = ?auto_148533 ?auto_148528 ) ) ( not ( = ?auto_148533 ?auto_148532 ) ) ( not ( = ?auto_148533 ?auto_148531 ) ) ( not ( = ?auto_148533 ?auto_148530 ) ) ( not ( = ?auto_148533 ?auto_148527 ) ) ( not ( = ?auto_148528 ?auto_148532 ) ) ( not ( = ?auto_148528 ?auto_148531 ) ) ( not ( = ?auto_148528 ?auto_148530 ) ) ( not ( = ?auto_148528 ?auto_148527 ) ) ( not ( = ?auto_148532 ?auto_148531 ) ) ( not ( = ?auto_148532 ?auto_148530 ) ) ( not ( = ?auto_148532 ?auto_148527 ) ) ( not ( = ?auto_148531 ?auto_148530 ) ) ( not ( = ?auto_148531 ?auto_148527 ) ) ( not ( = ?auto_148526 ?auto_148534 ) ) ( not ( = ?auto_148526 ?auto_148533 ) ) ( not ( = ?auto_148526 ?auto_148528 ) ) ( not ( = ?auto_148526 ?auto_148532 ) ) ( not ( = ?auto_148526 ?auto_148531 ) ) ( not ( = ?auto_148529 ?auto_148534 ) ) ( not ( = ?auto_148529 ?auto_148533 ) ) ( not ( = ?auto_148529 ?auto_148528 ) ) ( not ( = ?auto_148529 ?auto_148532 ) ) ( not ( = ?auto_148529 ?auto_148531 ) ) ( ON ?auto_148527 ?auto_148526 ) ( ON-TABLE ?auto_148529 ) ( ON ?auto_148530 ?auto_148527 ) ( ON ?auto_148531 ?auto_148530 ) ( ON ?auto_148532 ?auto_148531 ) ( CLEAR ?auto_148533 ) ( ON ?auto_148528 ?auto_148532 ) ( CLEAR ?auto_148528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148529 ?auto_148526 ?auto_148527 ?auto_148530 ?auto_148531 ?auto_148532 )
      ( MAKE-2PILE ?auto_148526 ?auto_148527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148535 - BLOCK
      ?auto_148536 - BLOCK
    )
    :vars
    (
      ?auto_148539 - BLOCK
      ?auto_148542 - BLOCK
      ?auto_148540 - BLOCK
      ?auto_148541 - BLOCK
      ?auto_148538 - BLOCK
      ?auto_148543 - BLOCK
      ?auto_148537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148535 ?auto_148536 ) ) ( not ( = ?auto_148535 ?auto_148539 ) ) ( not ( = ?auto_148536 ?auto_148539 ) ) ( ON ?auto_148535 ?auto_148542 ) ( not ( = ?auto_148535 ?auto_148542 ) ) ( not ( = ?auto_148536 ?auto_148542 ) ) ( not ( = ?auto_148539 ?auto_148542 ) ) ( ON-TABLE ?auto_148540 ) ( not ( = ?auto_148540 ?auto_148541 ) ) ( not ( = ?auto_148540 ?auto_148538 ) ) ( not ( = ?auto_148540 ?auto_148543 ) ) ( not ( = ?auto_148540 ?auto_148537 ) ) ( not ( = ?auto_148540 ?auto_148539 ) ) ( not ( = ?auto_148540 ?auto_148536 ) ) ( not ( = ?auto_148541 ?auto_148538 ) ) ( not ( = ?auto_148541 ?auto_148543 ) ) ( not ( = ?auto_148541 ?auto_148537 ) ) ( not ( = ?auto_148541 ?auto_148539 ) ) ( not ( = ?auto_148541 ?auto_148536 ) ) ( not ( = ?auto_148538 ?auto_148543 ) ) ( not ( = ?auto_148538 ?auto_148537 ) ) ( not ( = ?auto_148538 ?auto_148539 ) ) ( not ( = ?auto_148538 ?auto_148536 ) ) ( not ( = ?auto_148543 ?auto_148537 ) ) ( not ( = ?auto_148543 ?auto_148539 ) ) ( not ( = ?auto_148543 ?auto_148536 ) ) ( not ( = ?auto_148537 ?auto_148539 ) ) ( not ( = ?auto_148537 ?auto_148536 ) ) ( not ( = ?auto_148535 ?auto_148540 ) ) ( not ( = ?auto_148535 ?auto_148541 ) ) ( not ( = ?auto_148535 ?auto_148538 ) ) ( not ( = ?auto_148535 ?auto_148543 ) ) ( not ( = ?auto_148535 ?auto_148537 ) ) ( not ( = ?auto_148542 ?auto_148540 ) ) ( not ( = ?auto_148542 ?auto_148541 ) ) ( not ( = ?auto_148542 ?auto_148538 ) ) ( not ( = ?auto_148542 ?auto_148543 ) ) ( not ( = ?auto_148542 ?auto_148537 ) ) ( ON ?auto_148536 ?auto_148535 ) ( ON-TABLE ?auto_148542 ) ( ON ?auto_148539 ?auto_148536 ) ( ON ?auto_148537 ?auto_148539 ) ( ON ?auto_148543 ?auto_148537 ) ( ON ?auto_148538 ?auto_148543 ) ( CLEAR ?auto_148538 ) ( HOLDING ?auto_148541 ) ( CLEAR ?auto_148540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148540 ?auto_148541 )
      ( MAKE-2PILE ?auto_148535 ?auto_148536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148544 - BLOCK
      ?auto_148545 - BLOCK
    )
    :vars
    (
      ?auto_148549 - BLOCK
      ?auto_148547 - BLOCK
      ?auto_148546 - BLOCK
      ?auto_148552 - BLOCK
      ?auto_148548 - BLOCK
      ?auto_148550 - BLOCK
      ?auto_148551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148544 ?auto_148545 ) ) ( not ( = ?auto_148544 ?auto_148549 ) ) ( not ( = ?auto_148545 ?auto_148549 ) ) ( ON ?auto_148544 ?auto_148547 ) ( not ( = ?auto_148544 ?auto_148547 ) ) ( not ( = ?auto_148545 ?auto_148547 ) ) ( not ( = ?auto_148549 ?auto_148547 ) ) ( ON-TABLE ?auto_148546 ) ( not ( = ?auto_148546 ?auto_148552 ) ) ( not ( = ?auto_148546 ?auto_148548 ) ) ( not ( = ?auto_148546 ?auto_148550 ) ) ( not ( = ?auto_148546 ?auto_148551 ) ) ( not ( = ?auto_148546 ?auto_148549 ) ) ( not ( = ?auto_148546 ?auto_148545 ) ) ( not ( = ?auto_148552 ?auto_148548 ) ) ( not ( = ?auto_148552 ?auto_148550 ) ) ( not ( = ?auto_148552 ?auto_148551 ) ) ( not ( = ?auto_148552 ?auto_148549 ) ) ( not ( = ?auto_148552 ?auto_148545 ) ) ( not ( = ?auto_148548 ?auto_148550 ) ) ( not ( = ?auto_148548 ?auto_148551 ) ) ( not ( = ?auto_148548 ?auto_148549 ) ) ( not ( = ?auto_148548 ?auto_148545 ) ) ( not ( = ?auto_148550 ?auto_148551 ) ) ( not ( = ?auto_148550 ?auto_148549 ) ) ( not ( = ?auto_148550 ?auto_148545 ) ) ( not ( = ?auto_148551 ?auto_148549 ) ) ( not ( = ?auto_148551 ?auto_148545 ) ) ( not ( = ?auto_148544 ?auto_148546 ) ) ( not ( = ?auto_148544 ?auto_148552 ) ) ( not ( = ?auto_148544 ?auto_148548 ) ) ( not ( = ?auto_148544 ?auto_148550 ) ) ( not ( = ?auto_148544 ?auto_148551 ) ) ( not ( = ?auto_148547 ?auto_148546 ) ) ( not ( = ?auto_148547 ?auto_148552 ) ) ( not ( = ?auto_148547 ?auto_148548 ) ) ( not ( = ?auto_148547 ?auto_148550 ) ) ( not ( = ?auto_148547 ?auto_148551 ) ) ( ON ?auto_148545 ?auto_148544 ) ( ON-TABLE ?auto_148547 ) ( ON ?auto_148549 ?auto_148545 ) ( ON ?auto_148551 ?auto_148549 ) ( ON ?auto_148550 ?auto_148551 ) ( ON ?auto_148548 ?auto_148550 ) ( CLEAR ?auto_148546 ) ( ON ?auto_148552 ?auto_148548 ) ( CLEAR ?auto_148552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148547 ?auto_148544 ?auto_148545 ?auto_148549 ?auto_148551 ?auto_148550 ?auto_148548 )
      ( MAKE-2PILE ?auto_148544 ?auto_148545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148553 - BLOCK
      ?auto_148554 - BLOCK
    )
    :vars
    (
      ?auto_148561 - BLOCK
      ?auto_148560 - BLOCK
      ?auto_148555 - BLOCK
      ?auto_148558 - BLOCK
      ?auto_148556 - BLOCK
      ?auto_148559 - BLOCK
      ?auto_148557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148553 ?auto_148554 ) ) ( not ( = ?auto_148553 ?auto_148561 ) ) ( not ( = ?auto_148554 ?auto_148561 ) ) ( ON ?auto_148553 ?auto_148560 ) ( not ( = ?auto_148553 ?auto_148560 ) ) ( not ( = ?auto_148554 ?auto_148560 ) ) ( not ( = ?auto_148561 ?auto_148560 ) ) ( not ( = ?auto_148555 ?auto_148558 ) ) ( not ( = ?auto_148555 ?auto_148556 ) ) ( not ( = ?auto_148555 ?auto_148559 ) ) ( not ( = ?auto_148555 ?auto_148557 ) ) ( not ( = ?auto_148555 ?auto_148561 ) ) ( not ( = ?auto_148555 ?auto_148554 ) ) ( not ( = ?auto_148558 ?auto_148556 ) ) ( not ( = ?auto_148558 ?auto_148559 ) ) ( not ( = ?auto_148558 ?auto_148557 ) ) ( not ( = ?auto_148558 ?auto_148561 ) ) ( not ( = ?auto_148558 ?auto_148554 ) ) ( not ( = ?auto_148556 ?auto_148559 ) ) ( not ( = ?auto_148556 ?auto_148557 ) ) ( not ( = ?auto_148556 ?auto_148561 ) ) ( not ( = ?auto_148556 ?auto_148554 ) ) ( not ( = ?auto_148559 ?auto_148557 ) ) ( not ( = ?auto_148559 ?auto_148561 ) ) ( not ( = ?auto_148559 ?auto_148554 ) ) ( not ( = ?auto_148557 ?auto_148561 ) ) ( not ( = ?auto_148557 ?auto_148554 ) ) ( not ( = ?auto_148553 ?auto_148555 ) ) ( not ( = ?auto_148553 ?auto_148558 ) ) ( not ( = ?auto_148553 ?auto_148556 ) ) ( not ( = ?auto_148553 ?auto_148559 ) ) ( not ( = ?auto_148553 ?auto_148557 ) ) ( not ( = ?auto_148560 ?auto_148555 ) ) ( not ( = ?auto_148560 ?auto_148558 ) ) ( not ( = ?auto_148560 ?auto_148556 ) ) ( not ( = ?auto_148560 ?auto_148559 ) ) ( not ( = ?auto_148560 ?auto_148557 ) ) ( ON ?auto_148554 ?auto_148553 ) ( ON-TABLE ?auto_148560 ) ( ON ?auto_148561 ?auto_148554 ) ( ON ?auto_148557 ?auto_148561 ) ( ON ?auto_148559 ?auto_148557 ) ( ON ?auto_148556 ?auto_148559 ) ( ON ?auto_148558 ?auto_148556 ) ( CLEAR ?auto_148558 ) ( HOLDING ?auto_148555 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148555 )
      ( MAKE-2PILE ?auto_148553 ?auto_148554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148562 - BLOCK
      ?auto_148563 - BLOCK
    )
    :vars
    (
      ?auto_148569 - BLOCK
      ?auto_148568 - BLOCK
      ?auto_148567 - BLOCK
      ?auto_148564 - BLOCK
      ?auto_148566 - BLOCK
      ?auto_148565 - BLOCK
      ?auto_148570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148562 ?auto_148563 ) ) ( not ( = ?auto_148562 ?auto_148569 ) ) ( not ( = ?auto_148563 ?auto_148569 ) ) ( ON ?auto_148562 ?auto_148568 ) ( not ( = ?auto_148562 ?auto_148568 ) ) ( not ( = ?auto_148563 ?auto_148568 ) ) ( not ( = ?auto_148569 ?auto_148568 ) ) ( not ( = ?auto_148567 ?auto_148564 ) ) ( not ( = ?auto_148567 ?auto_148566 ) ) ( not ( = ?auto_148567 ?auto_148565 ) ) ( not ( = ?auto_148567 ?auto_148570 ) ) ( not ( = ?auto_148567 ?auto_148569 ) ) ( not ( = ?auto_148567 ?auto_148563 ) ) ( not ( = ?auto_148564 ?auto_148566 ) ) ( not ( = ?auto_148564 ?auto_148565 ) ) ( not ( = ?auto_148564 ?auto_148570 ) ) ( not ( = ?auto_148564 ?auto_148569 ) ) ( not ( = ?auto_148564 ?auto_148563 ) ) ( not ( = ?auto_148566 ?auto_148565 ) ) ( not ( = ?auto_148566 ?auto_148570 ) ) ( not ( = ?auto_148566 ?auto_148569 ) ) ( not ( = ?auto_148566 ?auto_148563 ) ) ( not ( = ?auto_148565 ?auto_148570 ) ) ( not ( = ?auto_148565 ?auto_148569 ) ) ( not ( = ?auto_148565 ?auto_148563 ) ) ( not ( = ?auto_148570 ?auto_148569 ) ) ( not ( = ?auto_148570 ?auto_148563 ) ) ( not ( = ?auto_148562 ?auto_148567 ) ) ( not ( = ?auto_148562 ?auto_148564 ) ) ( not ( = ?auto_148562 ?auto_148566 ) ) ( not ( = ?auto_148562 ?auto_148565 ) ) ( not ( = ?auto_148562 ?auto_148570 ) ) ( not ( = ?auto_148568 ?auto_148567 ) ) ( not ( = ?auto_148568 ?auto_148564 ) ) ( not ( = ?auto_148568 ?auto_148566 ) ) ( not ( = ?auto_148568 ?auto_148565 ) ) ( not ( = ?auto_148568 ?auto_148570 ) ) ( ON ?auto_148563 ?auto_148562 ) ( ON-TABLE ?auto_148568 ) ( ON ?auto_148569 ?auto_148563 ) ( ON ?auto_148570 ?auto_148569 ) ( ON ?auto_148565 ?auto_148570 ) ( ON ?auto_148566 ?auto_148565 ) ( ON ?auto_148564 ?auto_148566 ) ( ON ?auto_148567 ?auto_148564 ) ( CLEAR ?auto_148567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148568 ?auto_148562 ?auto_148563 ?auto_148569 ?auto_148570 ?auto_148565 ?auto_148566 ?auto_148564 )
      ( MAKE-2PILE ?auto_148562 ?auto_148563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148598 - BLOCK
      ?auto_148599 - BLOCK
      ?auto_148600 - BLOCK
      ?auto_148601 - BLOCK
      ?auto_148602 - BLOCK
    )
    :vars
    (
      ?auto_148604 - BLOCK
      ?auto_148603 - BLOCK
      ?auto_148605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148604 ?auto_148602 ) ( ON-TABLE ?auto_148598 ) ( ON ?auto_148599 ?auto_148598 ) ( ON ?auto_148600 ?auto_148599 ) ( ON ?auto_148601 ?auto_148600 ) ( ON ?auto_148602 ?auto_148601 ) ( not ( = ?auto_148598 ?auto_148599 ) ) ( not ( = ?auto_148598 ?auto_148600 ) ) ( not ( = ?auto_148598 ?auto_148601 ) ) ( not ( = ?auto_148598 ?auto_148602 ) ) ( not ( = ?auto_148598 ?auto_148604 ) ) ( not ( = ?auto_148599 ?auto_148600 ) ) ( not ( = ?auto_148599 ?auto_148601 ) ) ( not ( = ?auto_148599 ?auto_148602 ) ) ( not ( = ?auto_148599 ?auto_148604 ) ) ( not ( = ?auto_148600 ?auto_148601 ) ) ( not ( = ?auto_148600 ?auto_148602 ) ) ( not ( = ?auto_148600 ?auto_148604 ) ) ( not ( = ?auto_148601 ?auto_148602 ) ) ( not ( = ?auto_148601 ?auto_148604 ) ) ( not ( = ?auto_148602 ?auto_148604 ) ) ( not ( = ?auto_148598 ?auto_148603 ) ) ( not ( = ?auto_148598 ?auto_148605 ) ) ( not ( = ?auto_148599 ?auto_148603 ) ) ( not ( = ?auto_148599 ?auto_148605 ) ) ( not ( = ?auto_148600 ?auto_148603 ) ) ( not ( = ?auto_148600 ?auto_148605 ) ) ( not ( = ?auto_148601 ?auto_148603 ) ) ( not ( = ?auto_148601 ?auto_148605 ) ) ( not ( = ?auto_148602 ?auto_148603 ) ) ( not ( = ?auto_148602 ?auto_148605 ) ) ( not ( = ?auto_148604 ?auto_148603 ) ) ( not ( = ?auto_148604 ?auto_148605 ) ) ( not ( = ?auto_148603 ?auto_148605 ) ) ( ON ?auto_148603 ?auto_148604 ) ( CLEAR ?auto_148603 ) ( HOLDING ?auto_148605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148605 )
      ( MAKE-5PILE ?auto_148598 ?auto_148599 ?auto_148600 ?auto_148601 ?auto_148602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148711 - BLOCK
      ?auto_148712 - BLOCK
      ?auto_148713 - BLOCK
    )
    :vars
    (
      ?auto_148714 - BLOCK
      ?auto_148715 - BLOCK
      ?auto_148718 - BLOCK
      ?auto_148717 - BLOCK
      ?auto_148716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148711 ) ( not ( = ?auto_148711 ?auto_148712 ) ) ( not ( = ?auto_148711 ?auto_148713 ) ) ( not ( = ?auto_148712 ?auto_148713 ) ) ( ON ?auto_148713 ?auto_148714 ) ( not ( = ?auto_148711 ?auto_148714 ) ) ( not ( = ?auto_148712 ?auto_148714 ) ) ( not ( = ?auto_148713 ?auto_148714 ) ) ( CLEAR ?auto_148711 ) ( ON ?auto_148712 ?auto_148713 ) ( CLEAR ?auto_148712 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148715 ) ( ON ?auto_148718 ?auto_148715 ) ( ON ?auto_148717 ?auto_148718 ) ( ON ?auto_148716 ?auto_148717 ) ( ON ?auto_148714 ?auto_148716 ) ( not ( = ?auto_148715 ?auto_148718 ) ) ( not ( = ?auto_148715 ?auto_148717 ) ) ( not ( = ?auto_148715 ?auto_148716 ) ) ( not ( = ?auto_148715 ?auto_148714 ) ) ( not ( = ?auto_148715 ?auto_148713 ) ) ( not ( = ?auto_148715 ?auto_148712 ) ) ( not ( = ?auto_148718 ?auto_148717 ) ) ( not ( = ?auto_148718 ?auto_148716 ) ) ( not ( = ?auto_148718 ?auto_148714 ) ) ( not ( = ?auto_148718 ?auto_148713 ) ) ( not ( = ?auto_148718 ?auto_148712 ) ) ( not ( = ?auto_148717 ?auto_148716 ) ) ( not ( = ?auto_148717 ?auto_148714 ) ) ( not ( = ?auto_148717 ?auto_148713 ) ) ( not ( = ?auto_148717 ?auto_148712 ) ) ( not ( = ?auto_148716 ?auto_148714 ) ) ( not ( = ?auto_148716 ?auto_148713 ) ) ( not ( = ?auto_148716 ?auto_148712 ) ) ( not ( = ?auto_148711 ?auto_148715 ) ) ( not ( = ?auto_148711 ?auto_148718 ) ) ( not ( = ?auto_148711 ?auto_148717 ) ) ( not ( = ?auto_148711 ?auto_148716 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148715 ?auto_148718 ?auto_148717 ?auto_148716 ?auto_148714 ?auto_148713 )
      ( MAKE-3PILE ?auto_148711 ?auto_148712 ?auto_148713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148719 - BLOCK
      ?auto_148720 - BLOCK
      ?auto_148721 - BLOCK
    )
    :vars
    (
      ?auto_148722 - BLOCK
      ?auto_148724 - BLOCK
      ?auto_148725 - BLOCK
      ?auto_148723 - BLOCK
      ?auto_148726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148719 ?auto_148720 ) ) ( not ( = ?auto_148719 ?auto_148721 ) ) ( not ( = ?auto_148720 ?auto_148721 ) ) ( ON ?auto_148721 ?auto_148722 ) ( not ( = ?auto_148719 ?auto_148722 ) ) ( not ( = ?auto_148720 ?auto_148722 ) ) ( not ( = ?auto_148721 ?auto_148722 ) ) ( ON ?auto_148720 ?auto_148721 ) ( CLEAR ?auto_148720 ) ( ON-TABLE ?auto_148724 ) ( ON ?auto_148725 ?auto_148724 ) ( ON ?auto_148723 ?auto_148725 ) ( ON ?auto_148726 ?auto_148723 ) ( ON ?auto_148722 ?auto_148726 ) ( not ( = ?auto_148724 ?auto_148725 ) ) ( not ( = ?auto_148724 ?auto_148723 ) ) ( not ( = ?auto_148724 ?auto_148726 ) ) ( not ( = ?auto_148724 ?auto_148722 ) ) ( not ( = ?auto_148724 ?auto_148721 ) ) ( not ( = ?auto_148724 ?auto_148720 ) ) ( not ( = ?auto_148725 ?auto_148723 ) ) ( not ( = ?auto_148725 ?auto_148726 ) ) ( not ( = ?auto_148725 ?auto_148722 ) ) ( not ( = ?auto_148725 ?auto_148721 ) ) ( not ( = ?auto_148725 ?auto_148720 ) ) ( not ( = ?auto_148723 ?auto_148726 ) ) ( not ( = ?auto_148723 ?auto_148722 ) ) ( not ( = ?auto_148723 ?auto_148721 ) ) ( not ( = ?auto_148723 ?auto_148720 ) ) ( not ( = ?auto_148726 ?auto_148722 ) ) ( not ( = ?auto_148726 ?auto_148721 ) ) ( not ( = ?auto_148726 ?auto_148720 ) ) ( not ( = ?auto_148719 ?auto_148724 ) ) ( not ( = ?auto_148719 ?auto_148725 ) ) ( not ( = ?auto_148719 ?auto_148723 ) ) ( not ( = ?auto_148719 ?auto_148726 ) ) ( HOLDING ?auto_148719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148719 )
      ( MAKE-3PILE ?auto_148719 ?auto_148720 ?auto_148721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148727 - BLOCK
      ?auto_148728 - BLOCK
      ?auto_148729 - BLOCK
    )
    :vars
    (
      ?auto_148732 - BLOCK
      ?auto_148731 - BLOCK
      ?auto_148730 - BLOCK
      ?auto_148734 - BLOCK
      ?auto_148733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148727 ?auto_148728 ) ) ( not ( = ?auto_148727 ?auto_148729 ) ) ( not ( = ?auto_148728 ?auto_148729 ) ) ( ON ?auto_148729 ?auto_148732 ) ( not ( = ?auto_148727 ?auto_148732 ) ) ( not ( = ?auto_148728 ?auto_148732 ) ) ( not ( = ?auto_148729 ?auto_148732 ) ) ( ON ?auto_148728 ?auto_148729 ) ( ON-TABLE ?auto_148731 ) ( ON ?auto_148730 ?auto_148731 ) ( ON ?auto_148734 ?auto_148730 ) ( ON ?auto_148733 ?auto_148734 ) ( ON ?auto_148732 ?auto_148733 ) ( not ( = ?auto_148731 ?auto_148730 ) ) ( not ( = ?auto_148731 ?auto_148734 ) ) ( not ( = ?auto_148731 ?auto_148733 ) ) ( not ( = ?auto_148731 ?auto_148732 ) ) ( not ( = ?auto_148731 ?auto_148729 ) ) ( not ( = ?auto_148731 ?auto_148728 ) ) ( not ( = ?auto_148730 ?auto_148734 ) ) ( not ( = ?auto_148730 ?auto_148733 ) ) ( not ( = ?auto_148730 ?auto_148732 ) ) ( not ( = ?auto_148730 ?auto_148729 ) ) ( not ( = ?auto_148730 ?auto_148728 ) ) ( not ( = ?auto_148734 ?auto_148733 ) ) ( not ( = ?auto_148734 ?auto_148732 ) ) ( not ( = ?auto_148734 ?auto_148729 ) ) ( not ( = ?auto_148734 ?auto_148728 ) ) ( not ( = ?auto_148733 ?auto_148732 ) ) ( not ( = ?auto_148733 ?auto_148729 ) ) ( not ( = ?auto_148733 ?auto_148728 ) ) ( not ( = ?auto_148727 ?auto_148731 ) ) ( not ( = ?auto_148727 ?auto_148730 ) ) ( not ( = ?auto_148727 ?auto_148734 ) ) ( not ( = ?auto_148727 ?auto_148733 ) ) ( ON ?auto_148727 ?auto_148728 ) ( CLEAR ?auto_148727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148731 ?auto_148730 ?auto_148734 ?auto_148733 ?auto_148732 ?auto_148729 ?auto_148728 )
      ( MAKE-3PILE ?auto_148727 ?auto_148728 ?auto_148729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148738 - BLOCK
      ?auto_148739 - BLOCK
      ?auto_148740 - BLOCK
    )
    :vars
    (
      ?auto_148741 - BLOCK
      ?auto_148744 - BLOCK
      ?auto_148742 - BLOCK
      ?auto_148745 - BLOCK
      ?auto_148743 - BLOCK
      ?auto_148746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148738 ?auto_148739 ) ) ( not ( = ?auto_148738 ?auto_148740 ) ) ( not ( = ?auto_148739 ?auto_148740 ) ) ( ON ?auto_148740 ?auto_148741 ) ( not ( = ?auto_148738 ?auto_148741 ) ) ( not ( = ?auto_148739 ?auto_148741 ) ) ( not ( = ?auto_148740 ?auto_148741 ) ) ( ON ?auto_148739 ?auto_148740 ) ( CLEAR ?auto_148739 ) ( ON-TABLE ?auto_148744 ) ( ON ?auto_148742 ?auto_148744 ) ( ON ?auto_148745 ?auto_148742 ) ( ON ?auto_148743 ?auto_148745 ) ( ON ?auto_148741 ?auto_148743 ) ( not ( = ?auto_148744 ?auto_148742 ) ) ( not ( = ?auto_148744 ?auto_148745 ) ) ( not ( = ?auto_148744 ?auto_148743 ) ) ( not ( = ?auto_148744 ?auto_148741 ) ) ( not ( = ?auto_148744 ?auto_148740 ) ) ( not ( = ?auto_148744 ?auto_148739 ) ) ( not ( = ?auto_148742 ?auto_148745 ) ) ( not ( = ?auto_148742 ?auto_148743 ) ) ( not ( = ?auto_148742 ?auto_148741 ) ) ( not ( = ?auto_148742 ?auto_148740 ) ) ( not ( = ?auto_148742 ?auto_148739 ) ) ( not ( = ?auto_148745 ?auto_148743 ) ) ( not ( = ?auto_148745 ?auto_148741 ) ) ( not ( = ?auto_148745 ?auto_148740 ) ) ( not ( = ?auto_148745 ?auto_148739 ) ) ( not ( = ?auto_148743 ?auto_148741 ) ) ( not ( = ?auto_148743 ?auto_148740 ) ) ( not ( = ?auto_148743 ?auto_148739 ) ) ( not ( = ?auto_148738 ?auto_148744 ) ) ( not ( = ?auto_148738 ?auto_148742 ) ) ( not ( = ?auto_148738 ?auto_148745 ) ) ( not ( = ?auto_148738 ?auto_148743 ) ) ( ON ?auto_148738 ?auto_148746 ) ( CLEAR ?auto_148738 ) ( HAND-EMPTY ) ( not ( = ?auto_148738 ?auto_148746 ) ) ( not ( = ?auto_148739 ?auto_148746 ) ) ( not ( = ?auto_148740 ?auto_148746 ) ) ( not ( = ?auto_148741 ?auto_148746 ) ) ( not ( = ?auto_148744 ?auto_148746 ) ) ( not ( = ?auto_148742 ?auto_148746 ) ) ( not ( = ?auto_148745 ?auto_148746 ) ) ( not ( = ?auto_148743 ?auto_148746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148738 ?auto_148746 )
      ( MAKE-3PILE ?auto_148738 ?auto_148739 ?auto_148740 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148747 - BLOCK
      ?auto_148748 - BLOCK
      ?auto_148749 - BLOCK
    )
    :vars
    (
      ?auto_148752 - BLOCK
      ?auto_148754 - BLOCK
      ?auto_148751 - BLOCK
      ?auto_148750 - BLOCK
      ?auto_148753 - BLOCK
      ?auto_148755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148747 ?auto_148748 ) ) ( not ( = ?auto_148747 ?auto_148749 ) ) ( not ( = ?auto_148748 ?auto_148749 ) ) ( ON ?auto_148749 ?auto_148752 ) ( not ( = ?auto_148747 ?auto_148752 ) ) ( not ( = ?auto_148748 ?auto_148752 ) ) ( not ( = ?auto_148749 ?auto_148752 ) ) ( ON-TABLE ?auto_148754 ) ( ON ?auto_148751 ?auto_148754 ) ( ON ?auto_148750 ?auto_148751 ) ( ON ?auto_148753 ?auto_148750 ) ( ON ?auto_148752 ?auto_148753 ) ( not ( = ?auto_148754 ?auto_148751 ) ) ( not ( = ?auto_148754 ?auto_148750 ) ) ( not ( = ?auto_148754 ?auto_148753 ) ) ( not ( = ?auto_148754 ?auto_148752 ) ) ( not ( = ?auto_148754 ?auto_148749 ) ) ( not ( = ?auto_148754 ?auto_148748 ) ) ( not ( = ?auto_148751 ?auto_148750 ) ) ( not ( = ?auto_148751 ?auto_148753 ) ) ( not ( = ?auto_148751 ?auto_148752 ) ) ( not ( = ?auto_148751 ?auto_148749 ) ) ( not ( = ?auto_148751 ?auto_148748 ) ) ( not ( = ?auto_148750 ?auto_148753 ) ) ( not ( = ?auto_148750 ?auto_148752 ) ) ( not ( = ?auto_148750 ?auto_148749 ) ) ( not ( = ?auto_148750 ?auto_148748 ) ) ( not ( = ?auto_148753 ?auto_148752 ) ) ( not ( = ?auto_148753 ?auto_148749 ) ) ( not ( = ?auto_148753 ?auto_148748 ) ) ( not ( = ?auto_148747 ?auto_148754 ) ) ( not ( = ?auto_148747 ?auto_148751 ) ) ( not ( = ?auto_148747 ?auto_148750 ) ) ( not ( = ?auto_148747 ?auto_148753 ) ) ( ON ?auto_148747 ?auto_148755 ) ( CLEAR ?auto_148747 ) ( not ( = ?auto_148747 ?auto_148755 ) ) ( not ( = ?auto_148748 ?auto_148755 ) ) ( not ( = ?auto_148749 ?auto_148755 ) ) ( not ( = ?auto_148752 ?auto_148755 ) ) ( not ( = ?auto_148754 ?auto_148755 ) ) ( not ( = ?auto_148751 ?auto_148755 ) ) ( not ( = ?auto_148750 ?auto_148755 ) ) ( not ( = ?auto_148753 ?auto_148755 ) ) ( HOLDING ?auto_148748 ) ( CLEAR ?auto_148749 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148754 ?auto_148751 ?auto_148750 ?auto_148753 ?auto_148752 ?auto_148749 ?auto_148748 )
      ( MAKE-3PILE ?auto_148747 ?auto_148748 ?auto_148749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148756 - BLOCK
      ?auto_148757 - BLOCK
      ?auto_148758 - BLOCK
    )
    :vars
    (
      ?auto_148760 - BLOCK
      ?auto_148763 - BLOCK
      ?auto_148759 - BLOCK
      ?auto_148764 - BLOCK
      ?auto_148762 - BLOCK
      ?auto_148761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148756 ?auto_148757 ) ) ( not ( = ?auto_148756 ?auto_148758 ) ) ( not ( = ?auto_148757 ?auto_148758 ) ) ( ON ?auto_148758 ?auto_148760 ) ( not ( = ?auto_148756 ?auto_148760 ) ) ( not ( = ?auto_148757 ?auto_148760 ) ) ( not ( = ?auto_148758 ?auto_148760 ) ) ( ON-TABLE ?auto_148763 ) ( ON ?auto_148759 ?auto_148763 ) ( ON ?auto_148764 ?auto_148759 ) ( ON ?auto_148762 ?auto_148764 ) ( ON ?auto_148760 ?auto_148762 ) ( not ( = ?auto_148763 ?auto_148759 ) ) ( not ( = ?auto_148763 ?auto_148764 ) ) ( not ( = ?auto_148763 ?auto_148762 ) ) ( not ( = ?auto_148763 ?auto_148760 ) ) ( not ( = ?auto_148763 ?auto_148758 ) ) ( not ( = ?auto_148763 ?auto_148757 ) ) ( not ( = ?auto_148759 ?auto_148764 ) ) ( not ( = ?auto_148759 ?auto_148762 ) ) ( not ( = ?auto_148759 ?auto_148760 ) ) ( not ( = ?auto_148759 ?auto_148758 ) ) ( not ( = ?auto_148759 ?auto_148757 ) ) ( not ( = ?auto_148764 ?auto_148762 ) ) ( not ( = ?auto_148764 ?auto_148760 ) ) ( not ( = ?auto_148764 ?auto_148758 ) ) ( not ( = ?auto_148764 ?auto_148757 ) ) ( not ( = ?auto_148762 ?auto_148760 ) ) ( not ( = ?auto_148762 ?auto_148758 ) ) ( not ( = ?auto_148762 ?auto_148757 ) ) ( not ( = ?auto_148756 ?auto_148763 ) ) ( not ( = ?auto_148756 ?auto_148759 ) ) ( not ( = ?auto_148756 ?auto_148764 ) ) ( not ( = ?auto_148756 ?auto_148762 ) ) ( ON ?auto_148756 ?auto_148761 ) ( not ( = ?auto_148756 ?auto_148761 ) ) ( not ( = ?auto_148757 ?auto_148761 ) ) ( not ( = ?auto_148758 ?auto_148761 ) ) ( not ( = ?auto_148760 ?auto_148761 ) ) ( not ( = ?auto_148763 ?auto_148761 ) ) ( not ( = ?auto_148759 ?auto_148761 ) ) ( not ( = ?auto_148764 ?auto_148761 ) ) ( not ( = ?auto_148762 ?auto_148761 ) ) ( CLEAR ?auto_148758 ) ( ON ?auto_148757 ?auto_148756 ) ( CLEAR ?auto_148757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148761 ?auto_148756 )
      ( MAKE-3PILE ?auto_148756 ?auto_148757 ?auto_148758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148765 - BLOCK
      ?auto_148766 - BLOCK
      ?auto_148767 - BLOCK
    )
    :vars
    (
      ?auto_148770 - BLOCK
      ?auto_148768 - BLOCK
      ?auto_148773 - BLOCK
      ?auto_148769 - BLOCK
      ?auto_148771 - BLOCK
      ?auto_148772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148765 ?auto_148766 ) ) ( not ( = ?auto_148765 ?auto_148767 ) ) ( not ( = ?auto_148766 ?auto_148767 ) ) ( not ( = ?auto_148765 ?auto_148770 ) ) ( not ( = ?auto_148766 ?auto_148770 ) ) ( not ( = ?auto_148767 ?auto_148770 ) ) ( ON-TABLE ?auto_148768 ) ( ON ?auto_148773 ?auto_148768 ) ( ON ?auto_148769 ?auto_148773 ) ( ON ?auto_148771 ?auto_148769 ) ( ON ?auto_148770 ?auto_148771 ) ( not ( = ?auto_148768 ?auto_148773 ) ) ( not ( = ?auto_148768 ?auto_148769 ) ) ( not ( = ?auto_148768 ?auto_148771 ) ) ( not ( = ?auto_148768 ?auto_148770 ) ) ( not ( = ?auto_148768 ?auto_148767 ) ) ( not ( = ?auto_148768 ?auto_148766 ) ) ( not ( = ?auto_148773 ?auto_148769 ) ) ( not ( = ?auto_148773 ?auto_148771 ) ) ( not ( = ?auto_148773 ?auto_148770 ) ) ( not ( = ?auto_148773 ?auto_148767 ) ) ( not ( = ?auto_148773 ?auto_148766 ) ) ( not ( = ?auto_148769 ?auto_148771 ) ) ( not ( = ?auto_148769 ?auto_148770 ) ) ( not ( = ?auto_148769 ?auto_148767 ) ) ( not ( = ?auto_148769 ?auto_148766 ) ) ( not ( = ?auto_148771 ?auto_148770 ) ) ( not ( = ?auto_148771 ?auto_148767 ) ) ( not ( = ?auto_148771 ?auto_148766 ) ) ( not ( = ?auto_148765 ?auto_148768 ) ) ( not ( = ?auto_148765 ?auto_148773 ) ) ( not ( = ?auto_148765 ?auto_148769 ) ) ( not ( = ?auto_148765 ?auto_148771 ) ) ( ON ?auto_148765 ?auto_148772 ) ( not ( = ?auto_148765 ?auto_148772 ) ) ( not ( = ?auto_148766 ?auto_148772 ) ) ( not ( = ?auto_148767 ?auto_148772 ) ) ( not ( = ?auto_148770 ?auto_148772 ) ) ( not ( = ?auto_148768 ?auto_148772 ) ) ( not ( = ?auto_148773 ?auto_148772 ) ) ( not ( = ?auto_148769 ?auto_148772 ) ) ( not ( = ?auto_148771 ?auto_148772 ) ) ( ON ?auto_148766 ?auto_148765 ) ( CLEAR ?auto_148766 ) ( ON-TABLE ?auto_148772 ) ( HOLDING ?auto_148767 ) ( CLEAR ?auto_148770 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148768 ?auto_148773 ?auto_148769 ?auto_148771 ?auto_148770 ?auto_148767 )
      ( MAKE-3PILE ?auto_148765 ?auto_148766 ?auto_148767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148774 - BLOCK
      ?auto_148775 - BLOCK
      ?auto_148776 - BLOCK
    )
    :vars
    (
      ?auto_148777 - BLOCK
      ?auto_148782 - BLOCK
      ?auto_148778 - BLOCK
      ?auto_148781 - BLOCK
      ?auto_148779 - BLOCK
      ?auto_148780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148774 ?auto_148775 ) ) ( not ( = ?auto_148774 ?auto_148776 ) ) ( not ( = ?auto_148775 ?auto_148776 ) ) ( not ( = ?auto_148774 ?auto_148777 ) ) ( not ( = ?auto_148775 ?auto_148777 ) ) ( not ( = ?auto_148776 ?auto_148777 ) ) ( ON-TABLE ?auto_148782 ) ( ON ?auto_148778 ?auto_148782 ) ( ON ?auto_148781 ?auto_148778 ) ( ON ?auto_148779 ?auto_148781 ) ( ON ?auto_148777 ?auto_148779 ) ( not ( = ?auto_148782 ?auto_148778 ) ) ( not ( = ?auto_148782 ?auto_148781 ) ) ( not ( = ?auto_148782 ?auto_148779 ) ) ( not ( = ?auto_148782 ?auto_148777 ) ) ( not ( = ?auto_148782 ?auto_148776 ) ) ( not ( = ?auto_148782 ?auto_148775 ) ) ( not ( = ?auto_148778 ?auto_148781 ) ) ( not ( = ?auto_148778 ?auto_148779 ) ) ( not ( = ?auto_148778 ?auto_148777 ) ) ( not ( = ?auto_148778 ?auto_148776 ) ) ( not ( = ?auto_148778 ?auto_148775 ) ) ( not ( = ?auto_148781 ?auto_148779 ) ) ( not ( = ?auto_148781 ?auto_148777 ) ) ( not ( = ?auto_148781 ?auto_148776 ) ) ( not ( = ?auto_148781 ?auto_148775 ) ) ( not ( = ?auto_148779 ?auto_148777 ) ) ( not ( = ?auto_148779 ?auto_148776 ) ) ( not ( = ?auto_148779 ?auto_148775 ) ) ( not ( = ?auto_148774 ?auto_148782 ) ) ( not ( = ?auto_148774 ?auto_148778 ) ) ( not ( = ?auto_148774 ?auto_148781 ) ) ( not ( = ?auto_148774 ?auto_148779 ) ) ( ON ?auto_148774 ?auto_148780 ) ( not ( = ?auto_148774 ?auto_148780 ) ) ( not ( = ?auto_148775 ?auto_148780 ) ) ( not ( = ?auto_148776 ?auto_148780 ) ) ( not ( = ?auto_148777 ?auto_148780 ) ) ( not ( = ?auto_148782 ?auto_148780 ) ) ( not ( = ?auto_148778 ?auto_148780 ) ) ( not ( = ?auto_148781 ?auto_148780 ) ) ( not ( = ?auto_148779 ?auto_148780 ) ) ( ON ?auto_148775 ?auto_148774 ) ( ON-TABLE ?auto_148780 ) ( CLEAR ?auto_148777 ) ( ON ?auto_148776 ?auto_148775 ) ( CLEAR ?auto_148776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148780 ?auto_148774 ?auto_148775 )
      ( MAKE-3PILE ?auto_148774 ?auto_148775 ?auto_148776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148783 - BLOCK
      ?auto_148784 - BLOCK
      ?auto_148785 - BLOCK
    )
    :vars
    (
      ?auto_148787 - BLOCK
      ?auto_148788 - BLOCK
      ?auto_148789 - BLOCK
      ?auto_148786 - BLOCK
      ?auto_148791 - BLOCK
      ?auto_148790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148783 ?auto_148784 ) ) ( not ( = ?auto_148783 ?auto_148785 ) ) ( not ( = ?auto_148784 ?auto_148785 ) ) ( not ( = ?auto_148783 ?auto_148787 ) ) ( not ( = ?auto_148784 ?auto_148787 ) ) ( not ( = ?auto_148785 ?auto_148787 ) ) ( ON-TABLE ?auto_148788 ) ( ON ?auto_148789 ?auto_148788 ) ( ON ?auto_148786 ?auto_148789 ) ( ON ?auto_148791 ?auto_148786 ) ( not ( = ?auto_148788 ?auto_148789 ) ) ( not ( = ?auto_148788 ?auto_148786 ) ) ( not ( = ?auto_148788 ?auto_148791 ) ) ( not ( = ?auto_148788 ?auto_148787 ) ) ( not ( = ?auto_148788 ?auto_148785 ) ) ( not ( = ?auto_148788 ?auto_148784 ) ) ( not ( = ?auto_148789 ?auto_148786 ) ) ( not ( = ?auto_148789 ?auto_148791 ) ) ( not ( = ?auto_148789 ?auto_148787 ) ) ( not ( = ?auto_148789 ?auto_148785 ) ) ( not ( = ?auto_148789 ?auto_148784 ) ) ( not ( = ?auto_148786 ?auto_148791 ) ) ( not ( = ?auto_148786 ?auto_148787 ) ) ( not ( = ?auto_148786 ?auto_148785 ) ) ( not ( = ?auto_148786 ?auto_148784 ) ) ( not ( = ?auto_148791 ?auto_148787 ) ) ( not ( = ?auto_148791 ?auto_148785 ) ) ( not ( = ?auto_148791 ?auto_148784 ) ) ( not ( = ?auto_148783 ?auto_148788 ) ) ( not ( = ?auto_148783 ?auto_148789 ) ) ( not ( = ?auto_148783 ?auto_148786 ) ) ( not ( = ?auto_148783 ?auto_148791 ) ) ( ON ?auto_148783 ?auto_148790 ) ( not ( = ?auto_148783 ?auto_148790 ) ) ( not ( = ?auto_148784 ?auto_148790 ) ) ( not ( = ?auto_148785 ?auto_148790 ) ) ( not ( = ?auto_148787 ?auto_148790 ) ) ( not ( = ?auto_148788 ?auto_148790 ) ) ( not ( = ?auto_148789 ?auto_148790 ) ) ( not ( = ?auto_148786 ?auto_148790 ) ) ( not ( = ?auto_148791 ?auto_148790 ) ) ( ON ?auto_148784 ?auto_148783 ) ( ON-TABLE ?auto_148790 ) ( ON ?auto_148785 ?auto_148784 ) ( CLEAR ?auto_148785 ) ( HOLDING ?auto_148787 ) ( CLEAR ?auto_148791 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148788 ?auto_148789 ?auto_148786 ?auto_148791 ?auto_148787 )
      ( MAKE-3PILE ?auto_148783 ?auto_148784 ?auto_148785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148792 - BLOCK
      ?auto_148793 - BLOCK
      ?auto_148794 - BLOCK
    )
    :vars
    (
      ?auto_148799 - BLOCK
      ?auto_148795 - BLOCK
      ?auto_148796 - BLOCK
      ?auto_148797 - BLOCK
      ?auto_148798 - BLOCK
      ?auto_148800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148792 ?auto_148793 ) ) ( not ( = ?auto_148792 ?auto_148794 ) ) ( not ( = ?auto_148793 ?auto_148794 ) ) ( not ( = ?auto_148792 ?auto_148799 ) ) ( not ( = ?auto_148793 ?auto_148799 ) ) ( not ( = ?auto_148794 ?auto_148799 ) ) ( ON-TABLE ?auto_148795 ) ( ON ?auto_148796 ?auto_148795 ) ( ON ?auto_148797 ?auto_148796 ) ( ON ?auto_148798 ?auto_148797 ) ( not ( = ?auto_148795 ?auto_148796 ) ) ( not ( = ?auto_148795 ?auto_148797 ) ) ( not ( = ?auto_148795 ?auto_148798 ) ) ( not ( = ?auto_148795 ?auto_148799 ) ) ( not ( = ?auto_148795 ?auto_148794 ) ) ( not ( = ?auto_148795 ?auto_148793 ) ) ( not ( = ?auto_148796 ?auto_148797 ) ) ( not ( = ?auto_148796 ?auto_148798 ) ) ( not ( = ?auto_148796 ?auto_148799 ) ) ( not ( = ?auto_148796 ?auto_148794 ) ) ( not ( = ?auto_148796 ?auto_148793 ) ) ( not ( = ?auto_148797 ?auto_148798 ) ) ( not ( = ?auto_148797 ?auto_148799 ) ) ( not ( = ?auto_148797 ?auto_148794 ) ) ( not ( = ?auto_148797 ?auto_148793 ) ) ( not ( = ?auto_148798 ?auto_148799 ) ) ( not ( = ?auto_148798 ?auto_148794 ) ) ( not ( = ?auto_148798 ?auto_148793 ) ) ( not ( = ?auto_148792 ?auto_148795 ) ) ( not ( = ?auto_148792 ?auto_148796 ) ) ( not ( = ?auto_148792 ?auto_148797 ) ) ( not ( = ?auto_148792 ?auto_148798 ) ) ( ON ?auto_148792 ?auto_148800 ) ( not ( = ?auto_148792 ?auto_148800 ) ) ( not ( = ?auto_148793 ?auto_148800 ) ) ( not ( = ?auto_148794 ?auto_148800 ) ) ( not ( = ?auto_148799 ?auto_148800 ) ) ( not ( = ?auto_148795 ?auto_148800 ) ) ( not ( = ?auto_148796 ?auto_148800 ) ) ( not ( = ?auto_148797 ?auto_148800 ) ) ( not ( = ?auto_148798 ?auto_148800 ) ) ( ON ?auto_148793 ?auto_148792 ) ( ON-TABLE ?auto_148800 ) ( ON ?auto_148794 ?auto_148793 ) ( CLEAR ?auto_148798 ) ( ON ?auto_148799 ?auto_148794 ) ( CLEAR ?auto_148799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148800 ?auto_148792 ?auto_148793 ?auto_148794 )
      ( MAKE-3PILE ?auto_148792 ?auto_148793 ?auto_148794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148801 - BLOCK
      ?auto_148802 - BLOCK
      ?auto_148803 - BLOCK
    )
    :vars
    (
      ?auto_148804 - BLOCK
      ?auto_148805 - BLOCK
      ?auto_148809 - BLOCK
      ?auto_148806 - BLOCK
      ?auto_148807 - BLOCK
      ?auto_148808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148801 ?auto_148802 ) ) ( not ( = ?auto_148801 ?auto_148803 ) ) ( not ( = ?auto_148802 ?auto_148803 ) ) ( not ( = ?auto_148801 ?auto_148804 ) ) ( not ( = ?auto_148802 ?auto_148804 ) ) ( not ( = ?auto_148803 ?auto_148804 ) ) ( ON-TABLE ?auto_148805 ) ( ON ?auto_148809 ?auto_148805 ) ( ON ?auto_148806 ?auto_148809 ) ( not ( = ?auto_148805 ?auto_148809 ) ) ( not ( = ?auto_148805 ?auto_148806 ) ) ( not ( = ?auto_148805 ?auto_148807 ) ) ( not ( = ?auto_148805 ?auto_148804 ) ) ( not ( = ?auto_148805 ?auto_148803 ) ) ( not ( = ?auto_148805 ?auto_148802 ) ) ( not ( = ?auto_148809 ?auto_148806 ) ) ( not ( = ?auto_148809 ?auto_148807 ) ) ( not ( = ?auto_148809 ?auto_148804 ) ) ( not ( = ?auto_148809 ?auto_148803 ) ) ( not ( = ?auto_148809 ?auto_148802 ) ) ( not ( = ?auto_148806 ?auto_148807 ) ) ( not ( = ?auto_148806 ?auto_148804 ) ) ( not ( = ?auto_148806 ?auto_148803 ) ) ( not ( = ?auto_148806 ?auto_148802 ) ) ( not ( = ?auto_148807 ?auto_148804 ) ) ( not ( = ?auto_148807 ?auto_148803 ) ) ( not ( = ?auto_148807 ?auto_148802 ) ) ( not ( = ?auto_148801 ?auto_148805 ) ) ( not ( = ?auto_148801 ?auto_148809 ) ) ( not ( = ?auto_148801 ?auto_148806 ) ) ( not ( = ?auto_148801 ?auto_148807 ) ) ( ON ?auto_148801 ?auto_148808 ) ( not ( = ?auto_148801 ?auto_148808 ) ) ( not ( = ?auto_148802 ?auto_148808 ) ) ( not ( = ?auto_148803 ?auto_148808 ) ) ( not ( = ?auto_148804 ?auto_148808 ) ) ( not ( = ?auto_148805 ?auto_148808 ) ) ( not ( = ?auto_148809 ?auto_148808 ) ) ( not ( = ?auto_148806 ?auto_148808 ) ) ( not ( = ?auto_148807 ?auto_148808 ) ) ( ON ?auto_148802 ?auto_148801 ) ( ON-TABLE ?auto_148808 ) ( ON ?auto_148803 ?auto_148802 ) ( ON ?auto_148804 ?auto_148803 ) ( CLEAR ?auto_148804 ) ( HOLDING ?auto_148807 ) ( CLEAR ?auto_148806 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148805 ?auto_148809 ?auto_148806 ?auto_148807 )
      ( MAKE-3PILE ?auto_148801 ?auto_148802 ?auto_148803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148810 - BLOCK
      ?auto_148811 - BLOCK
      ?auto_148812 - BLOCK
    )
    :vars
    (
      ?auto_148815 - BLOCK
      ?auto_148814 - BLOCK
      ?auto_148816 - BLOCK
      ?auto_148817 - BLOCK
      ?auto_148813 - BLOCK
      ?auto_148818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148810 ?auto_148811 ) ) ( not ( = ?auto_148810 ?auto_148812 ) ) ( not ( = ?auto_148811 ?auto_148812 ) ) ( not ( = ?auto_148810 ?auto_148815 ) ) ( not ( = ?auto_148811 ?auto_148815 ) ) ( not ( = ?auto_148812 ?auto_148815 ) ) ( ON-TABLE ?auto_148814 ) ( ON ?auto_148816 ?auto_148814 ) ( ON ?auto_148817 ?auto_148816 ) ( not ( = ?auto_148814 ?auto_148816 ) ) ( not ( = ?auto_148814 ?auto_148817 ) ) ( not ( = ?auto_148814 ?auto_148813 ) ) ( not ( = ?auto_148814 ?auto_148815 ) ) ( not ( = ?auto_148814 ?auto_148812 ) ) ( not ( = ?auto_148814 ?auto_148811 ) ) ( not ( = ?auto_148816 ?auto_148817 ) ) ( not ( = ?auto_148816 ?auto_148813 ) ) ( not ( = ?auto_148816 ?auto_148815 ) ) ( not ( = ?auto_148816 ?auto_148812 ) ) ( not ( = ?auto_148816 ?auto_148811 ) ) ( not ( = ?auto_148817 ?auto_148813 ) ) ( not ( = ?auto_148817 ?auto_148815 ) ) ( not ( = ?auto_148817 ?auto_148812 ) ) ( not ( = ?auto_148817 ?auto_148811 ) ) ( not ( = ?auto_148813 ?auto_148815 ) ) ( not ( = ?auto_148813 ?auto_148812 ) ) ( not ( = ?auto_148813 ?auto_148811 ) ) ( not ( = ?auto_148810 ?auto_148814 ) ) ( not ( = ?auto_148810 ?auto_148816 ) ) ( not ( = ?auto_148810 ?auto_148817 ) ) ( not ( = ?auto_148810 ?auto_148813 ) ) ( ON ?auto_148810 ?auto_148818 ) ( not ( = ?auto_148810 ?auto_148818 ) ) ( not ( = ?auto_148811 ?auto_148818 ) ) ( not ( = ?auto_148812 ?auto_148818 ) ) ( not ( = ?auto_148815 ?auto_148818 ) ) ( not ( = ?auto_148814 ?auto_148818 ) ) ( not ( = ?auto_148816 ?auto_148818 ) ) ( not ( = ?auto_148817 ?auto_148818 ) ) ( not ( = ?auto_148813 ?auto_148818 ) ) ( ON ?auto_148811 ?auto_148810 ) ( ON-TABLE ?auto_148818 ) ( ON ?auto_148812 ?auto_148811 ) ( ON ?auto_148815 ?auto_148812 ) ( CLEAR ?auto_148817 ) ( ON ?auto_148813 ?auto_148815 ) ( CLEAR ?auto_148813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148818 ?auto_148810 ?auto_148811 ?auto_148812 ?auto_148815 )
      ( MAKE-3PILE ?auto_148810 ?auto_148811 ?auto_148812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148819 - BLOCK
      ?auto_148820 - BLOCK
      ?auto_148821 - BLOCK
    )
    :vars
    (
      ?auto_148824 - BLOCK
      ?auto_148827 - BLOCK
      ?auto_148823 - BLOCK
      ?auto_148826 - BLOCK
      ?auto_148825 - BLOCK
      ?auto_148822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148819 ?auto_148820 ) ) ( not ( = ?auto_148819 ?auto_148821 ) ) ( not ( = ?auto_148820 ?auto_148821 ) ) ( not ( = ?auto_148819 ?auto_148824 ) ) ( not ( = ?auto_148820 ?auto_148824 ) ) ( not ( = ?auto_148821 ?auto_148824 ) ) ( ON-TABLE ?auto_148827 ) ( ON ?auto_148823 ?auto_148827 ) ( not ( = ?auto_148827 ?auto_148823 ) ) ( not ( = ?auto_148827 ?auto_148826 ) ) ( not ( = ?auto_148827 ?auto_148825 ) ) ( not ( = ?auto_148827 ?auto_148824 ) ) ( not ( = ?auto_148827 ?auto_148821 ) ) ( not ( = ?auto_148827 ?auto_148820 ) ) ( not ( = ?auto_148823 ?auto_148826 ) ) ( not ( = ?auto_148823 ?auto_148825 ) ) ( not ( = ?auto_148823 ?auto_148824 ) ) ( not ( = ?auto_148823 ?auto_148821 ) ) ( not ( = ?auto_148823 ?auto_148820 ) ) ( not ( = ?auto_148826 ?auto_148825 ) ) ( not ( = ?auto_148826 ?auto_148824 ) ) ( not ( = ?auto_148826 ?auto_148821 ) ) ( not ( = ?auto_148826 ?auto_148820 ) ) ( not ( = ?auto_148825 ?auto_148824 ) ) ( not ( = ?auto_148825 ?auto_148821 ) ) ( not ( = ?auto_148825 ?auto_148820 ) ) ( not ( = ?auto_148819 ?auto_148827 ) ) ( not ( = ?auto_148819 ?auto_148823 ) ) ( not ( = ?auto_148819 ?auto_148826 ) ) ( not ( = ?auto_148819 ?auto_148825 ) ) ( ON ?auto_148819 ?auto_148822 ) ( not ( = ?auto_148819 ?auto_148822 ) ) ( not ( = ?auto_148820 ?auto_148822 ) ) ( not ( = ?auto_148821 ?auto_148822 ) ) ( not ( = ?auto_148824 ?auto_148822 ) ) ( not ( = ?auto_148827 ?auto_148822 ) ) ( not ( = ?auto_148823 ?auto_148822 ) ) ( not ( = ?auto_148826 ?auto_148822 ) ) ( not ( = ?auto_148825 ?auto_148822 ) ) ( ON ?auto_148820 ?auto_148819 ) ( ON-TABLE ?auto_148822 ) ( ON ?auto_148821 ?auto_148820 ) ( ON ?auto_148824 ?auto_148821 ) ( ON ?auto_148825 ?auto_148824 ) ( CLEAR ?auto_148825 ) ( HOLDING ?auto_148826 ) ( CLEAR ?auto_148823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148827 ?auto_148823 ?auto_148826 )
      ( MAKE-3PILE ?auto_148819 ?auto_148820 ?auto_148821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148828 - BLOCK
      ?auto_148829 - BLOCK
      ?auto_148830 - BLOCK
    )
    :vars
    (
      ?auto_148833 - BLOCK
      ?auto_148834 - BLOCK
      ?auto_148831 - BLOCK
      ?auto_148832 - BLOCK
      ?auto_148836 - BLOCK
      ?auto_148835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148828 ?auto_148829 ) ) ( not ( = ?auto_148828 ?auto_148830 ) ) ( not ( = ?auto_148829 ?auto_148830 ) ) ( not ( = ?auto_148828 ?auto_148833 ) ) ( not ( = ?auto_148829 ?auto_148833 ) ) ( not ( = ?auto_148830 ?auto_148833 ) ) ( ON-TABLE ?auto_148834 ) ( ON ?auto_148831 ?auto_148834 ) ( not ( = ?auto_148834 ?auto_148831 ) ) ( not ( = ?auto_148834 ?auto_148832 ) ) ( not ( = ?auto_148834 ?auto_148836 ) ) ( not ( = ?auto_148834 ?auto_148833 ) ) ( not ( = ?auto_148834 ?auto_148830 ) ) ( not ( = ?auto_148834 ?auto_148829 ) ) ( not ( = ?auto_148831 ?auto_148832 ) ) ( not ( = ?auto_148831 ?auto_148836 ) ) ( not ( = ?auto_148831 ?auto_148833 ) ) ( not ( = ?auto_148831 ?auto_148830 ) ) ( not ( = ?auto_148831 ?auto_148829 ) ) ( not ( = ?auto_148832 ?auto_148836 ) ) ( not ( = ?auto_148832 ?auto_148833 ) ) ( not ( = ?auto_148832 ?auto_148830 ) ) ( not ( = ?auto_148832 ?auto_148829 ) ) ( not ( = ?auto_148836 ?auto_148833 ) ) ( not ( = ?auto_148836 ?auto_148830 ) ) ( not ( = ?auto_148836 ?auto_148829 ) ) ( not ( = ?auto_148828 ?auto_148834 ) ) ( not ( = ?auto_148828 ?auto_148831 ) ) ( not ( = ?auto_148828 ?auto_148832 ) ) ( not ( = ?auto_148828 ?auto_148836 ) ) ( ON ?auto_148828 ?auto_148835 ) ( not ( = ?auto_148828 ?auto_148835 ) ) ( not ( = ?auto_148829 ?auto_148835 ) ) ( not ( = ?auto_148830 ?auto_148835 ) ) ( not ( = ?auto_148833 ?auto_148835 ) ) ( not ( = ?auto_148834 ?auto_148835 ) ) ( not ( = ?auto_148831 ?auto_148835 ) ) ( not ( = ?auto_148832 ?auto_148835 ) ) ( not ( = ?auto_148836 ?auto_148835 ) ) ( ON ?auto_148829 ?auto_148828 ) ( ON-TABLE ?auto_148835 ) ( ON ?auto_148830 ?auto_148829 ) ( ON ?auto_148833 ?auto_148830 ) ( ON ?auto_148836 ?auto_148833 ) ( CLEAR ?auto_148831 ) ( ON ?auto_148832 ?auto_148836 ) ( CLEAR ?auto_148832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148835 ?auto_148828 ?auto_148829 ?auto_148830 ?auto_148833 ?auto_148836 )
      ( MAKE-3PILE ?auto_148828 ?auto_148829 ?auto_148830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148837 - BLOCK
      ?auto_148838 - BLOCK
      ?auto_148839 - BLOCK
    )
    :vars
    (
      ?auto_148844 - BLOCK
      ?auto_148842 - BLOCK
      ?auto_148843 - BLOCK
      ?auto_148845 - BLOCK
      ?auto_148840 - BLOCK
      ?auto_148841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148837 ?auto_148838 ) ) ( not ( = ?auto_148837 ?auto_148839 ) ) ( not ( = ?auto_148838 ?auto_148839 ) ) ( not ( = ?auto_148837 ?auto_148844 ) ) ( not ( = ?auto_148838 ?auto_148844 ) ) ( not ( = ?auto_148839 ?auto_148844 ) ) ( ON-TABLE ?auto_148842 ) ( not ( = ?auto_148842 ?auto_148843 ) ) ( not ( = ?auto_148842 ?auto_148845 ) ) ( not ( = ?auto_148842 ?auto_148840 ) ) ( not ( = ?auto_148842 ?auto_148844 ) ) ( not ( = ?auto_148842 ?auto_148839 ) ) ( not ( = ?auto_148842 ?auto_148838 ) ) ( not ( = ?auto_148843 ?auto_148845 ) ) ( not ( = ?auto_148843 ?auto_148840 ) ) ( not ( = ?auto_148843 ?auto_148844 ) ) ( not ( = ?auto_148843 ?auto_148839 ) ) ( not ( = ?auto_148843 ?auto_148838 ) ) ( not ( = ?auto_148845 ?auto_148840 ) ) ( not ( = ?auto_148845 ?auto_148844 ) ) ( not ( = ?auto_148845 ?auto_148839 ) ) ( not ( = ?auto_148845 ?auto_148838 ) ) ( not ( = ?auto_148840 ?auto_148844 ) ) ( not ( = ?auto_148840 ?auto_148839 ) ) ( not ( = ?auto_148840 ?auto_148838 ) ) ( not ( = ?auto_148837 ?auto_148842 ) ) ( not ( = ?auto_148837 ?auto_148843 ) ) ( not ( = ?auto_148837 ?auto_148845 ) ) ( not ( = ?auto_148837 ?auto_148840 ) ) ( ON ?auto_148837 ?auto_148841 ) ( not ( = ?auto_148837 ?auto_148841 ) ) ( not ( = ?auto_148838 ?auto_148841 ) ) ( not ( = ?auto_148839 ?auto_148841 ) ) ( not ( = ?auto_148844 ?auto_148841 ) ) ( not ( = ?auto_148842 ?auto_148841 ) ) ( not ( = ?auto_148843 ?auto_148841 ) ) ( not ( = ?auto_148845 ?auto_148841 ) ) ( not ( = ?auto_148840 ?auto_148841 ) ) ( ON ?auto_148838 ?auto_148837 ) ( ON-TABLE ?auto_148841 ) ( ON ?auto_148839 ?auto_148838 ) ( ON ?auto_148844 ?auto_148839 ) ( ON ?auto_148840 ?auto_148844 ) ( ON ?auto_148845 ?auto_148840 ) ( CLEAR ?auto_148845 ) ( HOLDING ?auto_148843 ) ( CLEAR ?auto_148842 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148842 ?auto_148843 )
      ( MAKE-3PILE ?auto_148837 ?auto_148838 ?auto_148839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148846 - BLOCK
      ?auto_148847 - BLOCK
      ?auto_148848 - BLOCK
    )
    :vars
    (
      ?auto_148850 - BLOCK
      ?auto_148852 - BLOCK
      ?auto_148849 - BLOCK
      ?auto_148853 - BLOCK
      ?auto_148854 - BLOCK
      ?auto_148851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148846 ?auto_148847 ) ) ( not ( = ?auto_148846 ?auto_148848 ) ) ( not ( = ?auto_148847 ?auto_148848 ) ) ( not ( = ?auto_148846 ?auto_148850 ) ) ( not ( = ?auto_148847 ?auto_148850 ) ) ( not ( = ?auto_148848 ?auto_148850 ) ) ( ON-TABLE ?auto_148852 ) ( not ( = ?auto_148852 ?auto_148849 ) ) ( not ( = ?auto_148852 ?auto_148853 ) ) ( not ( = ?auto_148852 ?auto_148854 ) ) ( not ( = ?auto_148852 ?auto_148850 ) ) ( not ( = ?auto_148852 ?auto_148848 ) ) ( not ( = ?auto_148852 ?auto_148847 ) ) ( not ( = ?auto_148849 ?auto_148853 ) ) ( not ( = ?auto_148849 ?auto_148854 ) ) ( not ( = ?auto_148849 ?auto_148850 ) ) ( not ( = ?auto_148849 ?auto_148848 ) ) ( not ( = ?auto_148849 ?auto_148847 ) ) ( not ( = ?auto_148853 ?auto_148854 ) ) ( not ( = ?auto_148853 ?auto_148850 ) ) ( not ( = ?auto_148853 ?auto_148848 ) ) ( not ( = ?auto_148853 ?auto_148847 ) ) ( not ( = ?auto_148854 ?auto_148850 ) ) ( not ( = ?auto_148854 ?auto_148848 ) ) ( not ( = ?auto_148854 ?auto_148847 ) ) ( not ( = ?auto_148846 ?auto_148852 ) ) ( not ( = ?auto_148846 ?auto_148849 ) ) ( not ( = ?auto_148846 ?auto_148853 ) ) ( not ( = ?auto_148846 ?auto_148854 ) ) ( ON ?auto_148846 ?auto_148851 ) ( not ( = ?auto_148846 ?auto_148851 ) ) ( not ( = ?auto_148847 ?auto_148851 ) ) ( not ( = ?auto_148848 ?auto_148851 ) ) ( not ( = ?auto_148850 ?auto_148851 ) ) ( not ( = ?auto_148852 ?auto_148851 ) ) ( not ( = ?auto_148849 ?auto_148851 ) ) ( not ( = ?auto_148853 ?auto_148851 ) ) ( not ( = ?auto_148854 ?auto_148851 ) ) ( ON ?auto_148847 ?auto_148846 ) ( ON-TABLE ?auto_148851 ) ( ON ?auto_148848 ?auto_148847 ) ( ON ?auto_148850 ?auto_148848 ) ( ON ?auto_148854 ?auto_148850 ) ( ON ?auto_148853 ?auto_148854 ) ( CLEAR ?auto_148852 ) ( ON ?auto_148849 ?auto_148853 ) ( CLEAR ?auto_148849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148851 ?auto_148846 ?auto_148847 ?auto_148848 ?auto_148850 ?auto_148854 ?auto_148853 )
      ( MAKE-3PILE ?auto_148846 ?auto_148847 ?auto_148848 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148855 - BLOCK
      ?auto_148856 - BLOCK
      ?auto_148857 - BLOCK
    )
    :vars
    (
      ?auto_148862 - BLOCK
      ?auto_148861 - BLOCK
      ?auto_148860 - BLOCK
      ?auto_148863 - BLOCK
      ?auto_148859 - BLOCK
      ?auto_148858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148855 ?auto_148856 ) ) ( not ( = ?auto_148855 ?auto_148857 ) ) ( not ( = ?auto_148856 ?auto_148857 ) ) ( not ( = ?auto_148855 ?auto_148862 ) ) ( not ( = ?auto_148856 ?auto_148862 ) ) ( not ( = ?auto_148857 ?auto_148862 ) ) ( not ( = ?auto_148861 ?auto_148860 ) ) ( not ( = ?auto_148861 ?auto_148863 ) ) ( not ( = ?auto_148861 ?auto_148859 ) ) ( not ( = ?auto_148861 ?auto_148862 ) ) ( not ( = ?auto_148861 ?auto_148857 ) ) ( not ( = ?auto_148861 ?auto_148856 ) ) ( not ( = ?auto_148860 ?auto_148863 ) ) ( not ( = ?auto_148860 ?auto_148859 ) ) ( not ( = ?auto_148860 ?auto_148862 ) ) ( not ( = ?auto_148860 ?auto_148857 ) ) ( not ( = ?auto_148860 ?auto_148856 ) ) ( not ( = ?auto_148863 ?auto_148859 ) ) ( not ( = ?auto_148863 ?auto_148862 ) ) ( not ( = ?auto_148863 ?auto_148857 ) ) ( not ( = ?auto_148863 ?auto_148856 ) ) ( not ( = ?auto_148859 ?auto_148862 ) ) ( not ( = ?auto_148859 ?auto_148857 ) ) ( not ( = ?auto_148859 ?auto_148856 ) ) ( not ( = ?auto_148855 ?auto_148861 ) ) ( not ( = ?auto_148855 ?auto_148860 ) ) ( not ( = ?auto_148855 ?auto_148863 ) ) ( not ( = ?auto_148855 ?auto_148859 ) ) ( ON ?auto_148855 ?auto_148858 ) ( not ( = ?auto_148855 ?auto_148858 ) ) ( not ( = ?auto_148856 ?auto_148858 ) ) ( not ( = ?auto_148857 ?auto_148858 ) ) ( not ( = ?auto_148862 ?auto_148858 ) ) ( not ( = ?auto_148861 ?auto_148858 ) ) ( not ( = ?auto_148860 ?auto_148858 ) ) ( not ( = ?auto_148863 ?auto_148858 ) ) ( not ( = ?auto_148859 ?auto_148858 ) ) ( ON ?auto_148856 ?auto_148855 ) ( ON-TABLE ?auto_148858 ) ( ON ?auto_148857 ?auto_148856 ) ( ON ?auto_148862 ?auto_148857 ) ( ON ?auto_148859 ?auto_148862 ) ( ON ?auto_148863 ?auto_148859 ) ( ON ?auto_148860 ?auto_148863 ) ( CLEAR ?auto_148860 ) ( HOLDING ?auto_148861 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148861 )
      ( MAKE-3PILE ?auto_148855 ?auto_148856 ?auto_148857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148864 - BLOCK
      ?auto_148865 - BLOCK
      ?auto_148866 - BLOCK
    )
    :vars
    (
      ?auto_148872 - BLOCK
      ?auto_148869 - BLOCK
      ?auto_148871 - BLOCK
      ?auto_148867 - BLOCK
      ?auto_148868 - BLOCK
      ?auto_148870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148864 ?auto_148865 ) ) ( not ( = ?auto_148864 ?auto_148866 ) ) ( not ( = ?auto_148865 ?auto_148866 ) ) ( not ( = ?auto_148864 ?auto_148872 ) ) ( not ( = ?auto_148865 ?auto_148872 ) ) ( not ( = ?auto_148866 ?auto_148872 ) ) ( not ( = ?auto_148869 ?auto_148871 ) ) ( not ( = ?auto_148869 ?auto_148867 ) ) ( not ( = ?auto_148869 ?auto_148868 ) ) ( not ( = ?auto_148869 ?auto_148872 ) ) ( not ( = ?auto_148869 ?auto_148866 ) ) ( not ( = ?auto_148869 ?auto_148865 ) ) ( not ( = ?auto_148871 ?auto_148867 ) ) ( not ( = ?auto_148871 ?auto_148868 ) ) ( not ( = ?auto_148871 ?auto_148872 ) ) ( not ( = ?auto_148871 ?auto_148866 ) ) ( not ( = ?auto_148871 ?auto_148865 ) ) ( not ( = ?auto_148867 ?auto_148868 ) ) ( not ( = ?auto_148867 ?auto_148872 ) ) ( not ( = ?auto_148867 ?auto_148866 ) ) ( not ( = ?auto_148867 ?auto_148865 ) ) ( not ( = ?auto_148868 ?auto_148872 ) ) ( not ( = ?auto_148868 ?auto_148866 ) ) ( not ( = ?auto_148868 ?auto_148865 ) ) ( not ( = ?auto_148864 ?auto_148869 ) ) ( not ( = ?auto_148864 ?auto_148871 ) ) ( not ( = ?auto_148864 ?auto_148867 ) ) ( not ( = ?auto_148864 ?auto_148868 ) ) ( ON ?auto_148864 ?auto_148870 ) ( not ( = ?auto_148864 ?auto_148870 ) ) ( not ( = ?auto_148865 ?auto_148870 ) ) ( not ( = ?auto_148866 ?auto_148870 ) ) ( not ( = ?auto_148872 ?auto_148870 ) ) ( not ( = ?auto_148869 ?auto_148870 ) ) ( not ( = ?auto_148871 ?auto_148870 ) ) ( not ( = ?auto_148867 ?auto_148870 ) ) ( not ( = ?auto_148868 ?auto_148870 ) ) ( ON ?auto_148865 ?auto_148864 ) ( ON-TABLE ?auto_148870 ) ( ON ?auto_148866 ?auto_148865 ) ( ON ?auto_148872 ?auto_148866 ) ( ON ?auto_148868 ?auto_148872 ) ( ON ?auto_148867 ?auto_148868 ) ( ON ?auto_148871 ?auto_148867 ) ( ON ?auto_148869 ?auto_148871 ) ( CLEAR ?auto_148869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148870 ?auto_148864 ?auto_148865 ?auto_148866 ?auto_148872 ?auto_148868 ?auto_148867 ?auto_148871 )
      ( MAKE-3PILE ?auto_148864 ?auto_148865 ?auto_148866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148896 - BLOCK
      ?auto_148897 - BLOCK
      ?auto_148898 - BLOCK
      ?auto_148899 - BLOCK
    )
    :vars
    (
      ?auto_148901 - BLOCK
      ?auto_148902 - BLOCK
      ?auto_148900 - BLOCK
      ?auto_148903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148901 ?auto_148899 ) ( ON-TABLE ?auto_148896 ) ( ON ?auto_148897 ?auto_148896 ) ( ON ?auto_148898 ?auto_148897 ) ( ON ?auto_148899 ?auto_148898 ) ( not ( = ?auto_148896 ?auto_148897 ) ) ( not ( = ?auto_148896 ?auto_148898 ) ) ( not ( = ?auto_148896 ?auto_148899 ) ) ( not ( = ?auto_148896 ?auto_148901 ) ) ( not ( = ?auto_148897 ?auto_148898 ) ) ( not ( = ?auto_148897 ?auto_148899 ) ) ( not ( = ?auto_148897 ?auto_148901 ) ) ( not ( = ?auto_148898 ?auto_148899 ) ) ( not ( = ?auto_148898 ?auto_148901 ) ) ( not ( = ?auto_148899 ?auto_148901 ) ) ( not ( = ?auto_148896 ?auto_148902 ) ) ( not ( = ?auto_148896 ?auto_148900 ) ) ( not ( = ?auto_148897 ?auto_148902 ) ) ( not ( = ?auto_148897 ?auto_148900 ) ) ( not ( = ?auto_148898 ?auto_148902 ) ) ( not ( = ?auto_148898 ?auto_148900 ) ) ( not ( = ?auto_148899 ?auto_148902 ) ) ( not ( = ?auto_148899 ?auto_148900 ) ) ( not ( = ?auto_148901 ?auto_148902 ) ) ( not ( = ?auto_148901 ?auto_148900 ) ) ( not ( = ?auto_148902 ?auto_148900 ) ) ( ON ?auto_148902 ?auto_148901 ) ( CLEAR ?auto_148902 ) ( HOLDING ?auto_148900 ) ( CLEAR ?auto_148903 ) ( ON-TABLE ?auto_148903 ) ( not ( = ?auto_148903 ?auto_148900 ) ) ( not ( = ?auto_148896 ?auto_148903 ) ) ( not ( = ?auto_148897 ?auto_148903 ) ) ( not ( = ?auto_148898 ?auto_148903 ) ) ( not ( = ?auto_148899 ?auto_148903 ) ) ( not ( = ?auto_148901 ?auto_148903 ) ) ( not ( = ?auto_148902 ?auto_148903 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148903 ?auto_148900 )
      ( MAKE-4PILE ?auto_148896 ?auto_148897 ?auto_148898 ?auto_148899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148904 - BLOCK
      ?auto_148905 - BLOCK
      ?auto_148906 - BLOCK
      ?auto_148907 - BLOCK
    )
    :vars
    (
      ?auto_148911 - BLOCK
      ?auto_148909 - BLOCK
      ?auto_148910 - BLOCK
      ?auto_148908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148911 ?auto_148907 ) ( ON-TABLE ?auto_148904 ) ( ON ?auto_148905 ?auto_148904 ) ( ON ?auto_148906 ?auto_148905 ) ( ON ?auto_148907 ?auto_148906 ) ( not ( = ?auto_148904 ?auto_148905 ) ) ( not ( = ?auto_148904 ?auto_148906 ) ) ( not ( = ?auto_148904 ?auto_148907 ) ) ( not ( = ?auto_148904 ?auto_148911 ) ) ( not ( = ?auto_148905 ?auto_148906 ) ) ( not ( = ?auto_148905 ?auto_148907 ) ) ( not ( = ?auto_148905 ?auto_148911 ) ) ( not ( = ?auto_148906 ?auto_148907 ) ) ( not ( = ?auto_148906 ?auto_148911 ) ) ( not ( = ?auto_148907 ?auto_148911 ) ) ( not ( = ?auto_148904 ?auto_148909 ) ) ( not ( = ?auto_148904 ?auto_148910 ) ) ( not ( = ?auto_148905 ?auto_148909 ) ) ( not ( = ?auto_148905 ?auto_148910 ) ) ( not ( = ?auto_148906 ?auto_148909 ) ) ( not ( = ?auto_148906 ?auto_148910 ) ) ( not ( = ?auto_148907 ?auto_148909 ) ) ( not ( = ?auto_148907 ?auto_148910 ) ) ( not ( = ?auto_148911 ?auto_148909 ) ) ( not ( = ?auto_148911 ?auto_148910 ) ) ( not ( = ?auto_148909 ?auto_148910 ) ) ( ON ?auto_148909 ?auto_148911 ) ( CLEAR ?auto_148908 ) ( ON-TABLE ?auto_148908 ) ( not ( = ?auto_148908 ?auto_148910 ) ) ( not ( = ?auto_148904 ?auto_148908 ) ) ( not ( = ?auto_148905 ?auto_148908 ) ) ( not ( = ?auto_148906 ?auto_148908 ) ) ( not ( = ?auto_148907 ?auto_148908 ) ) ( not ( = ?auto_148911 ?auto_148908 ) ) ( not ( = ?auto_148909 ?auto_148908 ) ) ( ON ?auto_148910 ?auto_148909 ) ( CLEAR ?auto_148910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148904 ?auto_148905 ?auto_148906 ?auto_148907 ?auto_148911 ?auto_148909 )
      ( MAKE-4PILE ?auto_148904 ?auto_148905 ?auto_148906 ?auto_148907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148912 - BLOCK
      ?auto_148913 - BLOCK
      ?auto_148914 - BLOCK
      ?auto_148915 - BLOCK
    )
    :vars
    (
      ?auto_148919 - BLOCK
      ?auto_148916 - BLOCK
      ?auto_148918 - BLOCK
      ?auto_148917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148919 ?auto_148915 ) ( ON-TABLE ?auto_148912 ) ( ON ?auto_148913 ?auto_148912 ) ( ON ?auto_148914 ?auto_148913 ) ( ON ?auto_148915 ?auto_148914 ) ( not ( = ?auto_148912 ?auto_148913 ) ) ( not ( = ?auto_148912 ?auto_148914 ) ) ( not ( = ?auto_148912 ?auto_148915 ) ) ( not ( = ?auto_148912 ?auto_148919 ) ) ( not ( = ?auto_148913 ?auto_148914 ) ) ( not ( = ?auto_148913 ?auto_148915 ) ) ( not ( = ?auto_148913 ?auto_148919 ) ) ( not ( = ?auto_148914 ?auto_148915 ) ) ( not ( = ?auto_148914 ?auto_148919 ) ) ( not ( = ?auto_148915 ?auto_148919 ) ) ( not ( = ?auto_148912 ?auto_148916 ) ) ( not ( = ?auto_148912 ?auto_148918 ) ) ( not ( = ?auto_148913 ?auto_148916 ) ) ( not ( = ?auto_148913 ?auto_148918 ) ) ( not ( = ?auto_148914 ?auto_148916 ) ) ( not ( = ?auto_148914 ?auto_148918 ) ) ( not ( = ?auto_148915 ?auto_148916 ) ) ( not ( = ?auto_148915 ?auto_148918 ) ) ( not ( = ?auto_148919 ?auto_148916 ) ) ( not ( = ?auto_148919 ?auto_148918 ) ) ( not ( = ?auto_148916 ?auto_148918 ) ) ( ON ?auto_148916 ?auto_148919 ) ( not ( = ?auto_148917 ?auto_148918 ) ) ( not ( = ?auto_148912 ?auto_148917 ) ) ( not ( = ?auto_148913 ?auto_148917 ) ) ( not ( = ?auto_148914 ?auto_148917 ) ) ( not ( = ?auto_148915 ?auto_148917 ) ) ( not ( = ?auto_148919 ?auto_148917 ) ) ( not ( = ?auto_148916 ?auto_148917 ) ) ( ON ?auto_148918 ?auto_148916 ) ( CLEAR ?auto_148918 ) ( HOLDING ?auto_148917 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148917 )
      ( MAKE-4PILE ?auto_148912 ?auto_148913 ?auto_148914 ?auto_148915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148932 - BLOCK
      ?auto_148933 - BLOCK
      ?auto_148934 - BLOCK
      ?auto_148935 - BLOCK
    )
    :vars
    (
      ?auto_148939 - BLOCK
      ?auto_148938 - BLOCK
      ?auto_148937 - BLOCK
      ?auto_148936 - BLOCK
      ?auto_148940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148939 ?auto_148935 ) ( ON-TABLE ?auto_148932 ) ( ON ?auto_148933 ?auto_148932 ) ( ON ?auto_148934 ?auto_148933 ) ( ON ?auto_148935 ?auto_148934 ) ( not ( = ?auto_148932 ?auto_148933 ) ) ( not ( = ?auto_148932 ?auto_148934 ) ) ( not ( = ?auto_148932 ?auto_148935 ) ) ( not ( = ?auto_148932 ?auto_148939 ) ) ( not ( = ?auto_148933 ?auto_148934 ) ) ( not ( = ?auto_148933 ?auto_148935 ) ) ( not ( = ?auto_148933 ?auto_148939 ) ) ( not ( = ?auto_148934 ?auto_148935 ) ) ( not ( = ?auto_148934 ?auto_148939 ) ) ( not ( = ?auto_148935 ?auto_148939 ) ) ( not ( = ?auto_148932 ?auto_148938 ) ) ( not ( = ?auto_148932 ?auto_148937 ) ) ( not ( = ?auto_148933 ?auto_148938 ) ) ( not ( = ?auto_148933 ?auto_148937 ) ) ( not ( = ?auto_148934 ?auto_148938 ) ) ( not ( = ?auto_148934 ?auto_148937 ) ) ( not ( = ?auto_148935 ?auto_148938 ) ) ( not ( = ?auto_148935 ?auto_148937 ) ) ( not ( = ?auto_148939 ?auto_148938 ) ) ( not ( = ?auto_148939 ?auto_148937 ) ) ( not ( = ?auto_148938 ?auto_148937 ) ) ( ON ?auto_148938 ?auto_148939 ) ( not ( = ?auto_148936 ?auto_148937 ) ) ( not ( = ?auto_148932 ?auto_148936 ) ) ( not ( = ?auto_148933 ?auto_148936 ) ) ( not ( = ?auto_148934 ?auto_148936 ) ) ( not ( = ?auto_148935 ?auto_148936 ) ) ( not ( = ?auto_148939 ?auto_148936 ) ) ( not ( = ?auto_148938 ?auto_148936 ) ) ( ON ?auto_148937 ?auto_148938 ) ( CLEAR ?auto_148937 ) ( ON ?auto_148936 ?auto_148940 ) ( CLEAR ?auto_148936 ) ( HAND-EMPTY ) ( not ( = ?auto_148932 ?auto_148940 ) ) ( not ( = ?auto_148933 ?auto_148940 ) ) ( not ( = ?auto_148934 ?auto_148940 ) ) ( not ( = ?auto_148935 ?auto_148940 ) ) ( not ( = ?auto_148939 ?auto_148940 ) ) ( not ( = ?auto_148938 ?auto_148940 ) ) ( not ( = ?auto_148937 ?auto_148940 ) ) ( not ( = ?auto_148936 ?auto_148940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148936 ?auto_148940 )
      ( MAKE-4PILE ?auto_148932 ?auto_148933 ?auto_148934 ?auto_148935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148941 - BLOCK
      ?auto_148942 - BLOCK
      ?auto_148943 - BLOCK
      ?auto_148944 - BLOCK
    )
    :vars
    (
      ?auto_148948 - BLOCK
      ?auto_148946 - BLOCK
      ?auto_148947 - BLOCK
      ?auto_148949 - BLOCK
      ?auto_148945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148948 ?auto_148944 ) ( ON-TABLE ?auto_148941 ) ( ON ?auto_148942 ?auto_148941 ) ( ON ?auto_148943 ?auto_148942 ) ( ON ?auto_148944 ?auto_148943 ) ( not ( = ?auto_148941 ?auto_148942 ) ) ( not ( = ?auto_148941 ?auto_148943 ) ) ( not ( = ?auto_148941 ?auto_148944 ) ) ( not ( = ?auto_148941 ?auto_148948 ) ) ( not ( = ?auto_148942 ?auto_148943 ) ) ( not ( = ?auto_148942 ?auto_148944 ) ) ( not ( = ?auto_148942 ?auto_148948 ) ) ( not ( = ?auto_148943 ?auto_148944 ) ) ( not ( = ?auto_148943 ?auto_148948 ) ) ( not ( = ?auto_148944 ?auto_148948 ) ) ( not ( = ?auto_148941 ?auto_148946 ) ) ( not ( = ?auto_148941 ?auto_148947 ) ) ( not ( = ?auto_148942 ?auto_148946 ) ) ( not ( = ?auto_148942 ?auto_148947 ) ) ( not ( = ?auto_148943 ?auto_148946 ) ) ( not ( = ?auto_148943 ?auto_148947 ) ) ( not ( = ?auto_148944 ?auto_148946 ) ) ( not ( = ?auto_148944 ?auto_148947 ) ) ( not ( = ?auto_148948 ?auto_148946 ) ) ( not ( = ?auto_148948 ?auto_148947 ) ) ( not ( = ?auto_148946 ?auto_148947 ) ) ( ON ?auto_148946 ?auto_148948 ) ( not ( = ?auto_148949 ?auto_148947 ) ) ( not ( = ?auto_148941 ?auto_148949 ) ) ( not ( = ?auto_148942 ?auto_148949 ) ) ( not ( = ?auto_148943 ?auto_148949 ) ) ( not ( = ?auto_148944 ?auto_148949 ) ) ( not ( = ?auto_148948 ?auto_148949 ) ) ( not ( = ?auto_148946 ?auto_148949 ) ) ( ON ?auto_148949 ?auto_148945 ) ( CLEAR ?auto_148949 ) ( not ( = ?auto_148941 ?auto_148945 ) ) ( not ( = ?auto_148942 ?auto_148945 ) ) ( not ( = ?auto_148943 ?auto_148945 ) ) ( not ( = ?auto_148944 ?auto_148945 ) ) ( not ( = ?auto_148948 ?auto_148945 ) ) ( not ( = ?auto_148946 ?auto_148945 ) ) ( not ( = ?auto_148947 ?auto_148945 ) ) ( not ( = ?auto_148949 ?auto_148945 ) ) ( HOLDING ?auto_148947 ) ( CLEAR ?auto_148946 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148941 ?auto_148942 ?auto_148943 ?auto_148944 ?auto_148948 ?auto_148946 ?auto_148947 )
      ( MAKE-4PILE ?auto_148941 ?auto_148942 ?auto_148943 ?auto_148944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149023 - BLOCK
      ?auto_149024 - BLOCK
      ?auto_149025 - BLOCK
      ?auto_149026 - BLOCK
    )
    :vars
    (
      ?auto_149027 - BLOCK
      ?auto_149028 - BLOCK
      ?auto_149029 - BLOCK
      ?auto_149030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149023 ) ( ON ?auto_149024 ?auto_149023 ) ( not ( = ?auto_149023 ?auto_149024 ) ) ( not ( = ?auto_149023 ?auto_149025 ) ) ( not ( = ?auto_149023 ?auto_149026 ) ) ( not ( = ?auto_149024 ?auto_149025 ) ) ( not ( = ?auto_149024 ?auto_149026 ) ) ( not ( = ?auto_149025 ?auto_149026 ) ) ( ON ?auto_149026 ?auto_149027 ) ( not ( = ?auto_149023 ?auto_149027 ) ) ( not ( = ?auto_149024 ?auto_149027 ) ) ( not ( = ?auto_149025 ?auto_149027 ) ) ( not ( = ?auto_149026 ?auto_149027 ) ) ( CLEAR ?auto_149024 ) ( ON ?auto_149025 ?auto_149026 ) ( CLEAR ?auto_149025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149028 ) ( ON ?auto_149029 ?auto_149028 ) ( ON ?auto_149030 ?auto_149029 ) ( ON ?auto_149027 ?auto_149030 ) ( not ( = ?auto_149028 ?auto_149029 ) ) ( not ( = ?auto_149028 ?auto_149030 ) ) ( not ( = ?auto_149028 ?auto_149027 ) ) ( not ( = ?auto_149028 ?auto_149026 ) ) ( not ( = ?auto_149028 ?auto_149025 ) ) ( not ( = ?auto_149029 ?auto_149030 ) ) ( not ( = ?auto_149029 ?auto_149027 ) ) ( not ( = ?auto_149029 ?auto_149026 ) ) ( not ( = ?auto_149029 ?auto_149025 ) ) ( not ( = ?auto_149030 ?auto_149027 ) ) ( not ( = ?auto_149030 ?auto_149026 ) ) ( not ( = ?auto_149030 ?auto_149025 ) ) ( not ( = ?auto_149023 ?auto_149028 ) ) ( not ( = ?auto_149023 ?auto_149029 ) ) ( not ( = ?auto_149023 ?auto_149030 ) ) ( not ( = ?auto_149024 ?auto_149028 ) ) ( not ( = ?auto_149024 ?auto_149029 ) ) ( not ( = ?auto_149024 ?auto_149030 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149028 ?auto_149029 ?auto_149030 ?auto_149027 ?auto_149026 )
      ( MAKE-4PILE ?auto_149023 ?auto_149024 ?auto_149025 ?auto_149026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149031 - BLOCK
      ?auto_149032 - BLOCK
      ?auto_149033 - BLOCK
      ?auto_149034 - BLOCK
    )
    :vars
    (
      ?auto_149036 - BLOCK
      ?auto_149038 - BLOCK
      ?auto_149037 - BLOCK
      ?auto_149035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149031 ) ( not ( = ?auto_149031 ?auto_149032 ) ) ( not ( = ?auto_149031 ?auto_149033 ) ) ( not ( = ?auto_149031 ?auto_149034 ) ) ( not ( = ?auto_149032 ?auto_149033 ) ) ( not ( = ?auto_149032 ?auto_149034 ) ) ( not ( = ?auto_149033 ?auto_149034 ) ) ( ON ?auto_149034 ?auto_149036 ) ( not ( = ?auto_149031 ?auto_149036 ) ) ( not ( = ?auto_149032 ?auto_149036 ) ) ( not ( = ?auto_149033 ?auto_149036 ) ) ( not ( = ?auto_149034 ?auto_149036 ) ) ( ON ?auto_149033 ?auto_149034 ) ( CLEAR ?auto_149033 ) ( ON-TABLE ?auto_149038 ) ( ON ?auto_149037 ?auto_149038 ) ( ON ?auto_149035 ?auto_149037 ) ( ON ?auto_149036 ?auto_149035 ) ( not ( = ?auto_149038 ?auto_149037 ) ) ( not ( = ?auto_149038 ?auto_149035 ) ) ( not ( = ?auto_149038 ?auto_149036 ) ) ( not ( = ?auto_149038 ?auto_149034 ) ) ( not ( = ?auto_149038 ?auto_149033 ) ) ( not ( = ?auto_149037 ?auto_149035 ) ) ( not ( = ?auto_149037 ?auto_149036 ) ) ( not ( = ?auto_149037 ?auto_149034 ) ) ( not ( = ?auto_149037 ?auto_149033 ) ) ( not ( = ?auto_149035 ?auto_149036 ) ) ( not ( = ?auto_149035 ?auto_149034 ) ) ( not ( = ?auto_149035 ?auto_149033 ) ) ( not ( = ?auto_149031 ?auto_149038 ) ) ( not ( = ?auto_149031 ?auto_149037 ) ) ( not ( = ?auto_149031 ?auto_149035 ) ) ( not ( = ?auto_149032 ?auto_149038 ) ) ( not ( = ?auto_149032 ?auto_149037 ) ) ( not ( = ?auto_149032 ?auto_149035 ) ) ( HOLDING ?auto_149032 ) ( CLEAR ?auto_149031 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149031 ?auto_149032 )
      ( MAKE-4PILE ?auto_149031 ?auto_149032 ?auto_149033 ?auto_149034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149039 - BLOCK
      ?auto_149040 - BLOCK
      ?auto_149041 - BLOCK
      ?auto_149042 - BLOCK
    )
    :vars
    (
      ?auto_149046 - BLOCK
      ?auto_149044 - BLOCK
      ?auto_149043 - BLOCK
      ?auto_149045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149039 ) ( not ( = ?auto_149039 ?auto_149040 ) ) ( not ( = ?auto_149039 ?auto_149041 ) ) ( not ( = ?auto_149039 ?auto_149042 ) ) ( not ( = ?auto_149040 ?auto_149041 ) ) ( not ( = ?auto_149040 ?auto_149042 ) ) ( not ( = ?auto_149041 ?auto_149042 ) ) ( ON ?auto_149042 ?auto_149046 ) ( not ( = ?auto_149039 ?auto_149046 ) ) ( not ( = ?auto_149040 ?auto_149046 ) ) ( not ( = ?auto_149041 ?auto_149046 ) ) ( not ( = ?auto_149042 ?auto_149046 ) ) ( ON ?auto_149041 ?auto_149042 ) ( ON-TABLE ?auto_149044 ) ( ON ?auto_149043 ?auto_149044 ) ( ON ?auto_149045 ?auto_149043 ) ( ON ?auto_149046 ?auto_149045 ) ( not ( = ?auto_149044 ?auto_149043 ) ) ( not ( = ?auto_149044 ?auto_149045 ) ) ( not ( = ?auto_149044 ?auto_149046 ) ) ( not ( = ?auto_149044 ?auto_149042 ) ) ( not ( = ?auto_149044 ?auto_149041 ) ) ( not ( = ?auto_149043 ?auto_149045 ) ) ( not ( = ?auto_149043 ?auto_149046 ) ) ( not ( = ?auto_149043 ?auto_149042 ) ) ( not ( = ?auto_149043 ?auto_149041 ) ) ( not ( = ?auto_149045 ?auto_149046 ) ) ( not ( = ?auto_149045 ?auto_149042 ) ) ( not ( = ?auto_149045 ?auto_149041 ) ) ( not ( = ?auto_149039 ?auto_149044 ) ) ( not ( = ?auto_149039 ?auto_149043 ) ) ( not ( = ?auto_149039 ?auto_149045 ) ) ( not ( = ?auto_149040 ?auto_149044 ) ) ( not ( = ?auto_149040 ?auto_149043 ) ) ( not ( = ?auto_149040 ?auto_149045 ) ) ( CLEAR ?auto_149039 ) ( ON ?auto_149040 ?auto_149041 ) ( CLEAR ?auto_149040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149044 ?auto_149043 ?auto_149045 ?auto_149046 ?auto_149042 ?auto_149041 )
      ( MAKE-4PILE ?auto_149039 ?auto_149040 ?auto_149041 ?auto_149042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149047 - BLOCK
      ?auto_149048 - BLOCK
      ?auto_149049 - BLOCK
      ?auto_149050 - BLOCK
    )
    :vars
    (
      ?auto_149053 - BLOCK
      ?auto_149054 - BLOCK
      ?auto_149052 - BLOCK
      ?auto_149051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149047 ?auto_149048 ) ) ( not ( = ?auto_149047 ?auto_149049 ) ) ( not ( = ?auto_149047 ?auto_149050 ) ) ( not ( = ?auto_149048 ?auto_149049 ) ) ( not ( = ?auto_149048 ?auto_149050 ) ) ( not ( = ?auto_149049 ?auto_149050 ) ) ( ON ?auto_149050 ?auto_149053 ) ( not ( = ?auto_149047 ?auto_149053 ) ) ( not ( = ?auto_149048 ?auto_149053 ) ) ( not ( = ?auto_149049 ?auto_149053 ) ) ( not ( = ?auto_149050 ?auto_149053 ) ) ( ON ?auto_149049 ?auto_149050 ) ( ON-TABLE ?auto_149054 ) ( ON ?auto_149052 ?auto_149054 ) ( ON ?auto_149051 ?auto_149052 ) ( ON ?auto_149053 ?auto_149051 ) ( not ( = ?auto_149054 ?auto_149052 ) ) ( not ( = ?auto_149054 ?auto_149051 ) ) ( not ( = ?auto_149054 ?auto_149053 ) ) ( not ( = ?auto_149054 ?auto_149050 ) ) ( not ( = ?auto_149054 ?auto_149049 ) ) ( not ( = ?auto_149052 ?auto_149051 ) ) ( not ( = ?auto_149052 ?auto_149053 ) ) ( not ( = ?auto_149052 ?auto_149050 ) ) ( not ( = ?auto_149052 ?auto_149049 ) ) ( not ( = ?auto_149051 ?auto_149053 ) ) ( not ( = ?auto_149051 ?auto_149050 ) ) ( not ( = ?auto_149051 ?auto_149049 ) ) ( not ( = ?auto_149047 ?auto_149054 ) ) ( not ( = ?auto_149047 ?auto_149052 ) ) ( not ( = ?auto_149047 ?auto_149051 ) ) ( not ( = ?auto_149048 ?auto_149054 ) ) ( not ( = ?auto_149048 ?auto_149052 ) ) ( not ( = ?auto_149048 ?auto_149051 ) ) ( ON ?auto_149048 ?auto_149049 ) ( CLEAR ?auto_149048 ) ( HOLDING ?auto_149047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149047 )
      ( MAKE-4PILE ?auto_149047 ?auto_149048 ?auto_149049 ?auto_149050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149055 - BLOCK
      ?auto_149056 - BLOCK
      ?auto_149057 - BLOCK
      ?auto_149058 - BLOCK
    )
    :vars
    (
      ?auto_149061 - BLOCK
      ?auto_149062 - BLOCK
      ?auto_149059 - BLOCK
      ?auto_149060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149055 ?auto_149056 ) ) ( not ( = ?auto_149055 ?auto_149057 ) ) ( not ( = ?auto_149055 ?auto_149058 ) ) ( not ( = ?auto_149056 ?auto_149057 ) ) ( not ( = ?auto_149056 ?auto_149058 ) ) ( not ( = ?auto_149057 ?auto_149058 ) ) ( ON ?auto_149058 ?auto_149061 ) ( not ( = ?auto_149055 ?auto_149061 ) ) ( not ( = ?auto_149056 ?auto_149061 ) ) ( not ( = ?auto_149057 ?auto_149061 ) ) ( not ( = ?auto_149058 ?auto_149061 ) ) ( ON ?auto_149057 ?auto_149058 ) ( ON-TABLE ?auto_149062 ) ( ON ?auto_149059 ?auto_149062 ) ( ON ?auto_149060 ?auto_149059 ) ( ON ?auto_149061 ?auto_149060 ) ( not ( = ?auto_149062 ?auto_149059 ) ) ( not ( = ?auto_149062 ?auto_149060 ) ) ( not ( = ?auto_149062 ?auto_149061 ) ) ( not ( = ?auto_149062 ?auto_149058 ) ) ( not ( = ?auto_149062 ?auto_149057 ) ) ( not ( = ?auto_149059 ?auto_149060 ) ) ( not ( = ?auto_149059 ?auto_149061 ) ) ( not ( = ?auto_149059 ?auto_149058 ) ) ( not ( = ?auto_149059 ?auto_149057 ) ) ( not ( = ?auto_149060 ?auto_149061 ) ) ( not ( = ?auto_149060 ?auto_149058 ) ) ( not ( = ?auto_149060 ?auto_149057 ) ) ( not ( = ?auto_149055 ?auto_149062 ) ) ( not ( = ?auto_149055 ?auto_149059 ) ) ( not ( = ?auto_149055 ?auto_149060 ) ) ( not ( = ?auto_149056 ?auto_149062 ) ) ( not ( = ?auto_149056 ?auto_149059 ) ) ( not ( = ?auto_149056 ?auto_149060 ) ) ( ON ?auto_149056 ?auto_149057 ) ( ON ?auto_149055 ?auto_149056 ) ( CLEAR ?auto_149055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149062 ?auto_149059 ?auto_149060 ?auto_149061 ?auto_149058 ?auto_149057 ?auto_149056 )
      ( MAKE-4PILE ?auto_149055 ?auto_149056 ?auto_149057 ?auto_149058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149067 - BLOCK
      ?auto_149068 - BLOCK
      ?auto_149069 - BLOCK
      ?auto_149070 - BLOCK
    )
    :vars
    (
      ?auto_149073 - BLOCK
      ?auto_149072 - BLOCK
      ?auto_149071 - BLOCK
      ?auto_149074 - BLOCK
      ?auto_149075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149067 ?auto_149068 ) ) ( not ( = ?auto_149067 ?auto_149069 ) ) ( not ( = ?auto_149067 ?auto_149070 ) ) ( not ( = ?auto_149068 ?auto_149069 ) ) ( not ( = ?auto_149068 ?auto_149070 ) ) ( not ( = ?auto_149069 ?auto_149070 ) ) ( ON ?auto_149070 ?auto_149073 ) ( not ( = ?auto_149067 ?auto_149073 ) ) ( not ( = ?auto_149068 ?auto_149073 ) ) ( not ( = ?auto_149069 ?auto_149073 ) ) ( not ( = ?auto_149070 ?auto_149073 ) ) ( ON ?auto_149069 ?auto_149070 ) ( ON-TABLE ?auto_149072 ) ( ON ?auto_149071 ?auto_149072 ) ( ON ?auto_149074 ?auto_149071 ) ( ON ?auto_149073 ?auto_149074 ) ( not ( = ?auto_149072 ?auto_149071 ) ) ( not ( = ?auto_149072 ?auto_149074 ) ) ( not ( = ?auto_149072 ?auto_149073 ) ) ( not ( = ?auto_149072 ?auto_149070 ) ) ( not ( = ?auto_149072 ?auto_149069 ) ) ( not ( = ?auto_149071 ?auto_149074 ) ) ( not ( = ?auto_149071 ?auto_149073 ) ) ( not ( = ?auto_149071 ?auto_149070 ) ) ( not ( = ?auto_149071 ?auto_149069 ) ) ( not ( = ?auto_149074 ?auto_149073 ) ) ( not ( = ?auto_149074 ?auto_149070 ) ) ( not ( = ?auto_149074 ?auto_149069 ) ) ( not ( = ?auto_149067 ?auto_149072 ) ) ( not ( = ?auto_149067 ?auto_149071 ) ) ( not ( = ?auto_149067 ?auto_149074 ) ) ( not ( = ?auto_149068 ?auto_149072 ) ) ( not ( = ?auto_149068 ?auto_149071 ) ) ( not ( = ?auto_149068 ?auto_149074 ) ) ( ON ?auto_149068 ?auto_149069 ) ( CLEAR ?auto_149068 ) ( ON ?auto_149067 ?auto_149075 ) ( CLEAR ?auto_149067 ) ( HAND-EMPTY ) ( not ( = ?auto_149067 ?auto_149075 ) ) ( not ( = ?auto_149068 ?auto_149075 ) ) ( not ( = ?auto_149069 ?auto_149075 ) ) ( not ( = ?auto_149070 ?auto_149075 ) ) ( not ( = ?auto_149073 ?auto_149075 ) ) ( not ( = ?auto_149072 ?auto_149075 ) ) ( not ( = ?auto_149071 ?auto_149075 ) ) ( not ( = ?auto_149074 ?auto_149075 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149067 ?auto_149075 )
      ( MAKE-4PILE ?auto_149067 ?auto_149068 ?auto_149069 ?auto_149070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149076 - BLOCK
      ?auto_149077 - BLOCK
      ?auto_149078 - BLOCK
      ?auto_149079 - BLOCK
    )
    :vars
    (
      ?auto_149082 - BLOCK
      ?auto_149084 - BLOCK
      ?auto_149081 - BLOCK
      ?auto_149083 - BLOCK
      ?auto_149080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149076 ?auto_149077 ) ) ( not ( = ?auto_149076 ?auto_149078 ) ) ( not ( = ?auto_149076 ?auto_149079 ) ) ( not ( = ?auto_149077 ?auto_149078 ) ) ( not ( = ?auto_149077 ?auto_149079 ) ) ( not ( = ?auto_149078 ?auto_149079 ) ) ( ON ?auto_149079 ?auto_149082 ) ( not ( = ?auto_149076 ?auto_149082 ) ) ( not ( = ?auto_149077 ?auto_149082 ) ) ( not ( = ?auto_149078 ?auto_149082 ) ) ( not ( = ?auto_149079 ?auto_149082 ) ) ( ON ?auto_149078 ?auto_149079 ) ( ON-TABLE ?auto_149084 ) ( ON ?auto_149081 ?auto_149084 ) ( ON ?auto_149083 ?auto_149081 ) ( ON ?auto_149082 ?auto_149083 ) ( not ( = ?auto_149084 ?auto_149081 ) ) ( not ( = ?auto_149084 ?auto_149083 ) ) ( not ( = ?auto_149084 ?auto_149082 ) ) ( not ( = ?auto_149084 ?auto_149079 ) ) ( not ( = ?auto_149084 ?auto_149078 ) ) ( not ( = ?auto_149081 ?auto_149083 ) ) ( not ( = ?auto_149081 ?auto_149082 ) ) ( not ( = ?auto_149081 ?auto_149079 ) ) ( not ( = ?auto_149081 ?auto_149078 ) ) ( not ( = ?auto_149083 ?auto_149082 ) ) ( not ( = ?auto_149083 ?auto_149079 ) ) ( not ( = ?auto_149083 ?auto_149078 ) ) ( not ( = ?auto_149076 ?auto_149084 ) ) ( not ( = ?auto_149076 ?auto_149081 ) ) ( not ( = ?auto_149076 ?auto_149083 ) ) ( not ( = ?auto_149077 ?auto_149084 ) ) ( not ( = ?auto_149077 ?auto_149081 ) ) ( not ( = ?auto_149077 ?auto_149083 ) ) ( ON ?auto_149076 ?auto_149080 ) ( CLEAR ?auto_149076 ) ( not ( = ?auto_149076 ?auto_149080 ) ) ( not ( = ?auto_149077 ?auto_149080 ) ) ( not ( = ?auto_149078 ?auto_149080 ) ) ( not ( = ?auto_149079 ?auto_149080 ) ) ( not ( = ?auto_149082 ?auto_149080 ) ) ( not ( = ?auto_149084 ?auto_149080 ) ) ( not ( = ?auto_149081 ?auto_149080 ) ) ( not ( = ?auto_149083 ?auto_149080 ) ) ( HOLDING ?auto_149077 ) ( CLEAR ?auto_149078 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149084 ?auto_149081 ?auto_149083 ?auto_149082 ?auto_149079 ?auto_149078 ?auto_149077 )
      ( MAKE-4PILE ?auto_149076 ?auto_149077 ?auto_149078 ?auto_149079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149085 - BLOCK
      ?auto_149086 - BLOCK
      ?auto_149087 - BLOCK
      ?auto_149088 - BLOCK
    )
    :vars
    (
      ?auto_149089 - BLOCK
      ?auto_149091 - BLOCK
      ?auto_149092 - BLOCK
      ?auto_149093 - BLOCK
      ?auto_149090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149085 ?auto_149086 ) ) ( not ( = ?auto_149085 ?auto_149087 ) ) ( not ( = ?auto_149085 ?auto_149088 ) ) ( not ( = ?auto_149086 ?auto_149087 ) ) ( not ( = ?auto_149086 ?auto_149088 ) ) ( not ( = ?auto_149087 ?auto_149088 ) ) ( ON ?auto_149088 ?auto_149089 ) ( not ( = ?auto_149085 ?auto_149089 ) ) ( not ( = ?auto_149086 ?auto_149089 ) ) ( not ( = ?auto_149087 ?auto_149089 ) ) ( not ( = ?auto_149088 ?auto_149089 ) ) ( ON ?auto_149087 ?auto_149088 ) ( ON-TABLE ?auto_149091 ) ( ON ?auto_149092 ?auto_149091 ) ( ON ?auto_149093 ?auto_149092 ) ( ON ?auto_149089 ?auto_149093 ) ( not ( = ?auto_149091 ?auto_149092 ) ) ( not ( = ?auto_149091 ?auto_149093 ) ) ( not ( = ?auto_149091 ?auto_149089 ) ) ( not ( = ?auto_149091 ?auto_149088 ) ) ( not ( = ?auto_149091 ?auto_149087 ) ) ( not ( = ?auto_149092 ?auto_149093 ) ) ( not ( = ?auto_149092 ?auto_149089 ) ) ( not ( = ?auto_149092 ?auto_149088 ) ) ( not ( = ?auto_149092 ?auto_149087 ) ) ( not ( = ?auto_149093 ?auto_149089 ) ) ( not ( = ?auto_149093 ?auto_149088 ) ) ( not ( = ?auto_149093 ?auto_149087 ) ) ( not ( = ?auto_149085 ?auto_149091 ) ) ( not ( = ?auto_149085 ?auto_149092 ) ) ( not ( = ?auto_149085 ?auto_149093 ) ) ( not ( = ?auto_149086 ?auto_149091 ) ) ( not ( = ?auto_149086 ?auto_149092 ) ) ( not ( = ?auto_149086 ?auto_149093 ) ) ( ON ?auto_149085 ?auto_149090 ) ( not ( = ?auto_149085 ?auto_149090 ) ) ( not ( = ?auto_149086 ?auto_149090 ) ) ( not ( = ?auto_149087 ?auto_149090 ) ) ( not ( = ?auto_149088 ?auto_149090 ) ) ( not ( = ?auto_149089 ?auto_149090 ) ) ( not ( = ?auto_149091 ?auto_149090 ) ) ( not ( = ?auto_149092 ?auto_149090 ) ) ( not ( = ?auto_149093 ?auto_149090 ) ) ( CLEAR ?auto_149087 ) ( ON ?auto_149086 ?auto_149085 ) ( CLEAR ?auto_149086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149090 ?auto_149085 )
      ( MAKE-4PILE ?auto_149085 ?auto_149086 ?auto_149087 ?auto_149088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149094 - BLOCK
      ?auto_149095 - BLOCK
      ?auto_149096 - BLOCK
      ?auto_149097 - BLOCK
    )
    :vars
    (
      ?auto_149100 - BLOCK
      ?auto_149098 - BLOCK
      ?auto_149102 - BLOCK
      ?auto_149101 - BLOCK
      ?auto_149099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149094 ?auto_149095 ) ) ( not ( = ?auto_149094 ?auto_149096 ) ) ( not ( = ?auto_149094 ?auto_149097 ) ) ( not ( = ?auto_149095 ?auto_149096 ) ) ( not ( = ?auto_149095 ?auto_149097 ) ) ( not ( = ?auto_149096 ?auto_149097 ) ) ( ON ?auto_149097 ?auto_149100 ) ( not ( = ?auto_149094 ?auto_149100 ) ) ( not ( = ?auto_149095 ?auto_149100 ) ) ( not ( = ?auto_149096 ?auto_149100 ) ) ( not ( = ?auto_149097 ?auto_149100 ) ) ( ON-TABLE ?auto_149098 ) ( ON ?auto_149102 ?auto_149098 ) ( ON ?auto_149101 ?auto_149102 ) ( ON ?auto_149100 ?auto_149101 ) ( not ( = ?auto_149098 ?auto_149102 ) ) ( not ( = ?auto_149098 ?auto_149101 ) ) ( not ( = ?auto_149098 ?auto_149100 ) ) ( not ( = ?auto_149098 ?auto_149097 ) ) ( not ( = ?auto_149098 ?auto_149096 ) ) ( not ( = ?auto_149102 ?auto_149101 ) ) ( not ( = ?auto_149102 ?auto_149100 ) ) ( not ( = ?auto_149102 ?auto_149097 ) ) ( not ( = ?auto_149102 ?auto_149096 ) ) ( not ( = ?auto_149101 ?auto_149100 ) ) ( not ( = ?auto_149101 ?auto_149097 ) ) ( not ( = ?auto_149101 ?auto_149096 ) ) ( not ( = ?auto_149094 ?auto_149098 ) ) ( not ( = ?auto_149094 ?auto_149102 ) ) ( not ( = ?auto_149094 ?auto_149101 ) ) ( not ( = ?auto_149095 ?auto_149098 ) ) ( not ( = ?auto_149095 ?auto_149102 ) ) ( not ( = ?auto_149095 ?auto_149101 ) ) ( ON ?auto_149094 ?auto_149099 ) ( not ( = ?auto_149094 ?auto_149099 ) ) ( not ( = ?auto_149095 ?auto_149099 ) ) ( not ( = ?auto_149096 ?auto_149099 ) ) ( not ( = ?auto_149097 ?auto_149099 ) ) ( not ( = ?auto_149100 ?auto_149099 ) ) ( not ( = ?auto_149098 ?auto_149099 ) ) ( not ( = ?auto_149102 ?auto_149099 ) ) ( not ( = ?auto_149101 ?auto_149099 ) ) ( ON ?auto_149095 ?auto_149094 ) ( CLEAR ?auto_149095 ) ( ON-TABLE ?auto_149099 ) ( HOLDING ?auto_149096 ) ( CLEAR ?auto_149097 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149098 ?auto_149102 ?auto_149101 ?auto_149100 ?auto_149097 ?auto_149096 )
      ( MAKE-4PILE ?auto_149094 ?auto_149095 ?auto_149096 ?auto_149097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149103 - BLOCK
      ?auto_149104 - BLOCK
      ?auto_149105 - BLOCK
      ?auto_149106 - BLOCK
    )
    :vars
    (
      ?auto_149109 - BLOCK
      ?auto_149111 - BLOCK
      ?auto_149107 - BLOCK
      ?auto_149108 - BLOCK
      ?auto_149110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149103 ?auto_149104 ) ) ( not ( = ?auto_149103 ?auto_149105 ) ) ( not ( = ?auto_149103 ?auto_149106 ) ) ( not ( = ?auto_149104 ?auto_149105 ) ) ( not ( = ?auto_149104 ?auto_149106 ) ) ( not ( = ?auto_149105 ?auto_149106 ) ) ( ON ?auto_149106 ?auto_149109 ) ( not ( = ?auto_149103 ?auto_149109 ) ) ( not ( = ?auto_149104 ?auto_149109 ) ) ( not ( = ?auto_149105 ?auto_149109 ) ) ( not ( = ?auto_149106 ?auto_149109 ) ) ( ON-TABLE ?auto_149111 ) ( ON ?auto_149107 ?auto_149111 ) ( ON ?auto_149108 ?auto_149107 ) ( ON ?auto_149109 ?auto_149108 ) ( not ( = ?auto_149111 ?auto_149107 ) ) ( not ( = ?auto_149111 ?auto_149108 ) ) ( not ( = ?auto_149111 ?auto_149109 ) ) ( not ( = ?auto_149111 ?auto_149106 ) ) ( not ( = ?auto_149111 ?auto_149105 ) ) ( not ( = ?auto_149107 ?auto_149108 ) ) ( not ( = ?auto_149107 ?auto_149109 ) ) ( not ( = ?auto_149107 ?auto_149106 ) ) ( not ( = ?auto_149107 ?auto_149105 ) ) ( not ( = ?auto_149108 ?auto_149109 ) ) ( not ( = ?auto_149108 ?auto_149106 ) ) ( not ( = ?auto_149108 ?auto_149105 ) ) ( not ( = ?auto_149103 ?auto_149111 ) ) ( not ( = ?auto_149103 ?auto_149107 ) ) ( not ( = ?auto_149103 ?auto_149108 ) ) ( not ( = ?auto_149104 ?auto_149111 ) ) ( not ( = ?auto_149104 ?auto_149107 ) ) ( not ( = ?auto_149104 ?auto_149108 ) ) ( ON ?auto_149103 ?auto_149110 ) ( not ( = ?auto_149103 ?auto_149110 ) ) ( not ( = ?auto_149104 ?auto_149110 ) ) ( not ( = ?auto_149105 ?auto_149110 ) ) ( not ( = ?auto_149106 ?auto_149110 ) ) ( not ( = ?auto_149109 ?auto_149110 ) ) ( not ( = ?auto_149111 ?auto_149110 ) ) ( not ( = ?auto_149107 ?auto_149110 ) ) ( not ( = ?auto_149108 ?auto_149110 ) ) ( ON ?auto_149104 ?auto_149103 ) ( ON-TABLE ?auto_149110 ) ( CLEAR ?auto_149106 ) ( ON ?auto_149105 ?auto_149104 ) ( CLEAR ?auto_149105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149110 ?auto_149103 ?auto_149104 )
      ( MAKE-4PILE ?auto_149103 ?auto_149104 ?auto_149105 ?auto_149106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149112 - BLOCK
      ?auto_149113 - BLOCK
      ?auto_149114 - BLOCK
      ?auto_149115 - BLOCK
    )
    :vars
    (
      ?auto_149119 - BLOCK
      ?auto_149120 - BLOCK
      ?auto_149117 - BLOCK
      ?auto_149118 - BLOCK
      ?auto_149116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149112 ?auto_149113 ) ) ( not ( = ?auto_149112 ?auto_149114 ) ) ( not ( = ?auto_149112 ?auto_149115 ) ) ( not ( = ?auto_149113 ?auto_149114 ) ) ( not ( = ?auto_149113 ?auto_149115 ) ) ( not ( = ?auto_149114 ?auto_149115 ) ) ( not ( = ?auto_149112 ?auto_149119 ) ) ( not ( = ?auto_149113 ?auto_149119 ) ) ( not ( = ?auto_149114 ?auto_149119 ) ) ( not ( = ?auto_149115 ?auto_149119 ) ) ( ON-TABLE ?auto_149120 ) ( ON ?auto_149117 ?auto_149120 ) ( ON ?auto_149118 ?auto_149117 ) ( ON ?auto_149119 ?auto_149118 ) ( not ( = ?auto_149120 ?auto_149117 ) ) ( not ( = ?auto_149120 ?auto_149118 ) ) ( not ( = ?auto_149120 ?auto_149119 ) ) ( not ( = ?auto_149120 ?auto_149115 ) ) ( not ( = ?auto_149120 ?auto_149114 ) ) ( not ( = ?auto_149117 ?auto_149118 ) ) ( not ( = ?auto_149117 ?auto_149119 ) ) ( not ( = ?auto_149117 ?auto_149115 ) ) ( not ( = ?auto_149117 ?auto_149114 ) ) ( not ( = ?auto_149118 ?auto_149119 ) ) ( not ( = ?auto_149118 ?auto_149115 ) ) ( not ( = ?auto_149118 ?auto_149114 ) ) ( not ( = ?auto_149112 ?auto_149120 ) ) ( not ( = ?auto_149112 ?auto_149117 ) ) ( not ( = ?auto_149112 ?auto_149118 ) ) ( not ( = ?auto_149113 ?auto_149120 ) ) ( not ( = ?auto_149113 ?auto_149117 ) ) ( not ( = ?auto_149113 ?auto_149118 ) ) ( ON ?auto_149112 ?auto_149116 ) ( not ( = ?auto_149112 ?auto_149116 ) ) ( not ( = ?auto_149113 ?auto_149116 ) ) ( not ( = ?auto_149114 ?auto_149116 ) ) ( not ( = ?auto_149115 ?auto_149116 ) ) ( not ( = ?auto_149119 ?auto_149116 ) ) ( not ( = ?auto_149120 ?auto_149116 ) ) ( not ( = ?auto_149117 ?auto_149116 ) ) ( not ( = ?auto_149118 ?auto_149116 ) ) ( ON ?auto_149113 ?auto_149112 ) ( ON-TABLE ?auto_149116 ) ( ON ?auto_149114 ?auto_149113 ) ( CLEAR ?auto_149114 ) ( HOLDING ?auto_149115 ) ( CLEAR ?auto_149119 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149120 ?auto_149117 ?auto_149118 ?auto_149119 ?auto_149115 )
      ( MAKE-4PILE ?auto_149112 ?auto_149113 ?auto_149114 ?auto_149115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149121 - BLOCK
      ?auto_149122 - BLOCK
      ?auto_149123 - BLOCK
      ?auto_149124 - BLOCK
    )
    :vars
    (
      ?auto_149128 - BLOCK
      ?auto_149125 - BLOCK
      ?auto_149127 - BLOCK
      ?auto_149126 - BLOCK
      ?auto_149129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149121 ?auto_149122 ) ) ( not ( = ?auto_149121 ?auto_149123 ) ) ( not ( = ?auto_149121 ?auto_149124 ) ) ( not ( = ?auto_149122 ?auto_149123 ) ) ( not ( = ?auto_149122 ?auto_149124 ) ) ( not ( = ?auto_149123 ?auto_149124 ) ) ( not ( = ?auto_149121 ?auto_149128 ) ) ( not ( = ?auto_149122 ?auto_149128 ) ) ( not ( = ?auto_149123 ?auto_149128 ) ) ( not ( = ?auto_149124 ?auto_149128 ) ) ( ON-TABLE ?auto_149125 ) ( ON ?auto_149127 ?auto_149125 ) ( ON ?auto_149126 ?auto_149127 ) ( ON ?auto_149128 ?auto_149126 ) ( not ( = ?auto_149125 ?auto_149127 ) ) ( not ( = ?auto_149125 ?auto_149126 ) ) ( not ( = ?auto_149125 ?auto_149128 ) ) ( not ( = ?auto_149125 ?auto_149124 ) ) ( not ( = ?auto_149125 ?auto_149123 ) ) ( not ( = ?auto_149127 ?auto_149126 ) ) ( not ( = ?auto_149127 ?auto_149128 ) ) ( not ( = ?auto_149127 ?auto_149124 ) ) ( not ( = ?auto_149127 ?auto_149123 ) ) ( not ( = ?auto_149126 ?auto_149128 ) ) ( not ( = ?auto_149126 ?auto_149124 ) ) ( not ( = ?auto_149126 ?auto_149123 ) ) ( not ( = ?auto_149121 ?auto_149125 ) ) ( not ( = ?auto_149121 ?auto_149127 ) ) ( not ( = ?auto_149121 ?auto_149126 ) ) ( not ( = ?auto_149122 ?auto_149125 ) ) ( not ( = ?auto_149122 ?auto_149127 ) ) ( not ( = ?auto_149122 ?auto_149126 ) ) ( ON ?auto_149121 ?auto_149129 ) ( not ( = ?auto_149121 ?auto_149129 ) ) ( not ( = ?auto_149122 ?auto_149129 ) ) ( not ( = ?auto_149123 ?auto_149129 ) ) ( not ( = ?auto_149124 ?auto_149129 ) ) ( not ( = ?auto_149128 ?auto_149129 ) ) ( not ( = ?auto_149125 ?auto_149129 ) ) ( not ( = ?auto_149127 ?auto_149129 ) ) ( not ( = ?auto_149126 ?auto_149129 ) ) ( ON ?auto_149122 ?auto_149121 ) ( ON-TABLE ?auto_149129 ) ( ON ?auto_149123 ?auto_149122 ) ( CLEAR ?auto_149128 ) ( ON ?auto_149124 ?auto_149123 ) ( CLEAR ?auto_149124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149129 ?auto_149121 ?auto_149122 ?auto_149123 )
      ( MAKE-4PILE ?auto_149121 ?auto_149122 ?auto_149123 ?auto_149124 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149130 - BLOCK
      ?auto_149131 - BLOCK
      ?auto_149132 - BLOCK
      ?auto_149133 - BLOCK
    )
    :vars
    (
      ?auto_149137 - BLOCK
      ?auto_149136 - BLOCK
      ?auto_149134 - BLOCK
      ?auto_149135 - BLOCK
      ?auto_149138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149130 ?auto_149131 ) ) ( not ( = ?auto_149130 ?auto_149132 ) ) ( not ( = ?auto_149130 ?auto_149133 ) ) ( not ( = ?auto_149131 ?auto_149132 ) ) ( not ( = ?auto_149131 ?auto_149133 ) ) ( not ( = ?auto_149132 ?auto_149133 ) ) ( not ( = ?auto_149130 ?auto_149137 ) ) ( not ( = ?auto_149131 ?auto_149137 ) ) ( not ( = ?auto_149132 ?auto_149137 ) ) ( not ( = ?auto_149133 ?auto_149137 ) ) ( ON-TABLE ?auto_149136 ) ( ON ?auto_149134 ?auto_149136 ) ( ON ?auto_149135 ?auto_149134 ) ( not ( = ?auto_149136 ?auto_149134 ) ) ( not ( = ?auto_149136 ?auto_149135 ) ) ( not ( = ?auto_149136 ?auto_149137 ) ) ( not ( = ?auto_149136 ?auto_149133 ) ) ( not ( = ?auto_149136 ?auto_149132 ) ) ( not ( = ?auto_149134 ?auto_149135 ) ) ( not ( = ?auto_149134 ?auto_149137 ) ) ( not ( = ?auto_149134 ?auto_149133 ) ) ( not ( = ?auto_149134 ?auto_149132 ) ) ( not ( = ?auto_149135 ?auto_149137 ) ) ( not ( = ?auto_149135 ?auto_149133 ) ) ( not ( = ?auto_149135 ?auto_149132 ) ) ( not ( = ?auto_149130 ?auto_149136 ) ) ( not ( = ?auto_149130 ?auto_149134 ) ) ( not ( = ?auto_149130 ?auto_149135 ) ) ( not ( = ?auto_149131 ?auto_149136 ) ) ( not ( = ?auto_149131 ?auto_149134 ) ) ( not ( = ?auto_149131 ?auto_149135 ) ) ( ON ?auto_149130 ?auto_149138 ) ( not ( = ?auto_149130 ?auto_149138 ) ) ( not ( = ?auto_149131 ?auto_149138 ) ) ( not ( = ?auto_149132 ?auto_149138 ) ) ( not ( = ?auto_149133 ?auto_149138 ) ) ( not ( = ?auto_149137 ?auto_149138 ) ) ( not ( = ?auto_149136 ?auto_149138 ) ) ( not ( = ?auto_149134 ?auto_149138 ) ) ( not ( = ?auto_149135 ?auto_149138 ) ) ( ON ?auto_149131 ?auto_149130 ) ( ON-TABLE ?auto_149138 ) ( ON ?auto_149132 ?auto_149131 ) ( ON ?auto_149133 ?auto_149132 ) ( CLEAR ?auto_149133 ) ( HOLDING ?auto_149137 ) ( CLEAR ?auto_149135 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149136 ?auto_149134 ?auto_149135 ?auto_149137 )
      ( MAKE-4PILE ?auto_149130 ?auto_149131 ?auto_149132 ?auto_149133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149139 - BLOCK
      ?auto_149140 - BLOCK
      ?auto_149141 - BLOCK
      ?auto_149142 - BLOCK
    )
    :vars
    (
      ?auto_149143 - BLOCK
      ?auto_149144 - BLOCK
      ?auto_149146 - BLOCK
      ?auto_149147 - BLOCK
      ?auto_149145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149139 ?auto_149140 ) ) ( not ( = ?auto_149139 ?auto_149141 ) ) ( not ( = ?auto_149139 ?auto_149142 ) ) ( not ( = ?auto_149140 ?auto_149141 ) ) ( not ( = ?auto_149140 ?auto_149142 ) ) ( not ( = ?auto_149141 ?auto_149142 ) ) ( not ( = ?auto_149139 ?auto_149143 ) ) ( not ( = ?auto_149140 ?auto_149143 ) ) ( not ( = ?auto_149141 ?auto_149143 ) ) ( not ( = ?auto_149142 ?auto_149143 ) ) ( ON-TABLE ?auto_149144 ) ( ON ?auto_149146 ?auto_149144 ) ( ON ?auto_149147 ?auto_149146 ) ( not ( = ?auto_149144 ?auto_149146 ) ) ( not ( = ?auto_149144 ?auto_149147 ) ) ( not ( = ?auto_149144 ?auto_149143 ) ) ( not ( = ?auto_149144 ?auto_149142 ) ) ( not ( = ?auto_149144 ?auto_149141 ) ) ( not ( = ?auto_149146 ?auto_149147 ) ) ( not ( = ?auto_149146 ?auto_149143 ) ) ( not ( = ?auto_149146 ?auto_149142 ) ) ( not ( = ?auto_149146 ?auto_149141 ) ) ( not ( = ?auto_149147 ?auto_149143 ) ) ( not ( = ?auto_149147 ?auto_149142 ) ) ( not ( = ?auto_149147 ?auto_149141 ) ) ( not ( = ?auto_149139 ?auto_149144 ) ) ( not ( = ?auto_149139 ?auto_149146 ) ) ( not ( = ?auto_149139 ?auto_149147 ) ) ( not ( = ?auto_149140 ?auto_149144 ) ) ( not ( = ?auto_149140 ?auto_149146 ) ) ( not ( = ?auto_149140 ?auto_149147 ) ) ( ON ?auto_149139 ?auto_149145 ) ( not ( = ?auto_149139 ?auto_149145 ) ) ( not ( = ?auto_149140 ?auto_149145 ) ) ( not ( = ?auto_149141 ?auto_149145 ) ) ( not ( = ?auto_149142 ?auto_149145 ) ) ( not ( = ?auto_149143 ?auto_149145 ) ) ( not ( = ?auto_149144 ?auto_149145 ) ) ( not ( = ?auto_149146 ?auto_149145 ) ) ( not ( = ?auto_149147 ?auto_149145 ) ) ( ON ?auto_149140 ?auto_149139 ) ( ON-TABLE ?auto_149145 ) ( ON ?auto_149141 ?auto_149140 ) ( ON ?auto_149142 ?auto_149141 ) ( CLEAR ?auto_149147 ) ( ON ?auto_149143 ?auto_149142 ) ( CLEAR ?auto_149143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149145 ?auto_149139 ?auto_149140 ?auto_149141 ?auto_149142 )
      ( MAKE-4PILE ?auto_149139 ?auto_149140 ?auto_149141 ?auto_149142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149148 - BLOCK
      ?auto_149149 - BLOCK
      ?auto_149150 - BLOCK
      ?auto_149151 - BLOCK
    )
    :vars
    (
      ?auto_149155 - BLOCK
      ?auto_149156 - BLOCK
      ?auto_149154 - BLOCK
      ?auto_149152 - BLOCK
      ?auto_149153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149148 ?auto_149149 ) ) ( not ( = ?auto_149148 ?auto_149150 ) ) ( not ( = ?auto_149148 ?auto_149151 ) ) ( not ( = ?auto_149149 ?auto_149150 ) ) ( not ( = ?auto_149149 ?auto_149151 ) ) ( not ( = ?auto_149150 ?auto_149151 ) ) ( not ( = ?auto_149148 ?auto_149155 ) ) ( not ( = ?auto_149149 ?auto_149155 ) ) ( not ( = ?auto_149150 ?auto_149155 ) ) ( not ( = ?auto_149151 ?auto_149155 ) ) ( ON-TABLE ?auto_149156 ) ( ON ?auto_149154 ?auto_149156 ) ( not ( = ?auto_149156 ?auto_149154 ) ) ( not ( = ?auto_149156 ?auto_149152 ) ) ( not ( = ?auto_149156 ?auto_149155 ) ) ( not ( = ?auto_149156 ?auto_149151 ) ) ( not ( = ?auto_149156 ?auto_149150 ) ) ( not ( = ?auto_149154 ?auto_149152 ) ) ( not ( = ?auto_149154 ?auto_149155 ) ) ( not ( = ?auto_149154 ?auto_149151 ) ) ( not ( = ?auto_149154 ?auto_149150 ) ) ( not ( = ?auto_149152 ?auto_149155 ) ) ( not ( = ?auto_149152 ?auto_149151 ) ) ( not ( = ?auto_149152 ?auto_149150 ) ) ( not ( = ?auto_149148 ?auto_149156 ) ) ( not ( = ?auto_149148 ?auto_149154 ) ) ( not ( = ?auto_149148 ?auto_149152 ) ) ( not ( = ?auto_149149 ?auto_149156 ) ) ( not ( = ?auto_149149 ?auto_149154 ) ) ( not ( = ?auto_149149 ?auto_149152 ) ) ( ON ?auto_149148 ?auto_149153 ) ( not ( = ?auto_149148 ?auto_149153 ) ) ( not ( = ?auto_149149 ?auto_149153 ) ) ( not ( = ?auto_149150 ?auto_149153 ) ) ( not ( = ?auto_149151 ?auto_149153 ) ) ( not ( = ?auto_149155 ?auto_149153 ) ) ( not ( = ?auto_149156 ?auto_149153 ) ) ( not ( = ?auto_149154 ?auto_149153 ) ) ( not ( = ?auto_149152 ?auto_149153 ) ) ( ON ?auto_149149 ?auto_149148 ) ( ON-TABLE ?auto_149153 ) ( ON ?auto_149150 ?auto_149149 ) ( ON ?auto_149151 ?auto_149150 ) ( ON ?auto_149155 ?auto_149151 ) ( CLEAR ?auto_149155 ) ( HOLDING ?auto_149152 ) ( CLEAR ?auto_149154 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149156 ?auto_149154 ?auto_149152 )
      ( MAKE-4PILE ?auto_149148 ?auto_149149 ?auto_149150 ?auto_149151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149157 - BLOCK
      ?auto_149158 - BLOCK
      ?auto_149159 - BLOCK
      ?auto_149160 - BLOCK
    )
    :vars
    (
      ?auto_149165 - BLOCK
      ?auto_149163 - BLOCK
      ?auto_149162 - BLOCK
      ?auto_149164 - BLOCK
      ?auto_149161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149157 ?auto_149158 ) ) ( not ( = ?auto_149157 ?auto_149159 ) ) ( not ( = ?auto_149157 ?auto_149160 ) ) ( not ( = ?auto_149158 ?auto_149159 ) ) ( not ( = ?auto_149158 ?auto_149160 ) ) ( not ( = ?auto_149159 ?auto_149160 ) ) ( not ( = ?auto_149157 ?auto_149165 ) ) ( not ( = ?auto_149158 ?auto_149165 ) ) ( not ( = ?auto_149159 ?auto_149165 ) ) ( not ( = ?auto_149160 ?auto_149165 ) ) ( ON-TABLE ?auto_149163 ) ( ON ?auto_149162 ?auto_149163 ) ( not ( = ?auto_149163 ?auto_149162 ) ) ( not ( = ?auto_149163 ?auto_149164 ) ) ( not ( = ?auto_149163 ?auto_149165 ) ) ( not ( = ?auto_149163 ?auto_149160 ) ) ( not ( = ?auto_149163 ?auto_149159 ) ) ( not ( = ?auto_149162 ?auto_149164 ) ) ( not ( = ?auto_149162 ?auto_149165 ) ) ( not ( = ?auto_149162 ?auto_149160 ) ) ( not ( = ?auto_149162 ?auto_149159 ) ) ( not ( = ?auto_149164 ?auto_149165 ) ) ( not ( = ?auto_149164 ?auto_149160 ) ) ( not ( = ?auto_149164 ?auto_149159 ) ) ( not ( = ?auto_149157 ?auto_149163 ) ) ( not ( = ?auto_149157 ?auto_149162 ) ) ( not ( = ?auto_149157 ?auto_149164 ) ) ( not ( = ?auto_149158 ?auto_149163 ) ) ( not ( = ?auto_149158 ?auto_149162 ) ) ( not ( = ?auto_149158 ?auto_149164 ) ) ( ON ?auto_149157 ?auto_149161 ) ( not ( = ?auto_149157 ?auto_149161 ) ) ( not ( = ?auto_149158 ?auto_149161 ) ) ( not ( = ?auto_149159 ?auto_149161 ) ) ( not ( = ?auto_149160 ?auto_149161 ) ) ( not ( = ?auto_149165 ?auto_149161 ) ) ( not ( = ?auto_149163 ?auto_149161 ) ) ( not ( = ?auto_149162 ?auto_149161 ) ) ( not ( = ?auto_149164 ?auto_149161 ) ) ( ON ?auto_149158 ?auto_149157 ) ( ON-TABLE ?auto_149161 ) ( ON ?auto_149159 ?auto_149158 ) ( ON ?auto_149160 ?auto_149159 ) ( ON ?auto_149165 ?auto_149160 ) ( CLEAR ?auto_149162 ) ( ON ?auto_149164 ?auto_149165 ) ( CLEAR ?auto_149164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149161 ?auto_149157 ?auto_149158 ?auto_149159 ?auto_149160 ?auto_149165 )
      ( MAKE-4PILE ?auto_149157 ?auto_149158 ?auto_149159 ?auto_149160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149166 - BLOCK
      ?auto_149167 - BLOCK
      ?auto_149168 - BLOCK
      ?auto_149169 - BLOCK
    )
    :vars
    (
      ?auto_149172 - BLOCK
      ?auto_149173 - BLOCK
      ?auto_149170 - BLOCK
      ?auto_149174 - BLOCK
      ?auto_149171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149166 ?auto_149167 ) ) ( not ( = ?auto_149166 ?auto_149168 ) ) ( not ( = ?auto_149166 ?auto_149169 ) ) ( not ( = ?auto_149167 ?auto_149168 ) ) ( not ( = ?auto_149167 ?auto_149169 ) ) ( not ( = ?auto_149168 ?auto_149169 ) ) ( not ( = ?auto_149166 ?auto_149172 ) ) ( not ( = ?auto_149167 ?auto_149172 ) ) ( not ( = ?auto_149168 ?auto_149172 ) ) ( not ( = ?auto_149169 ?auto_149172 ) ) ( ON-TABLE ?auto_149173 ) ( not ( = ?auto_149173 ?auto_149170 ) ) ( not ( = ?auto_149173 ?auto_149174 ) ) ( not ( = ?auto_149173 ?auto_149172 ) ) ( not ( = ?auto_149173 ?auto_149169 ) ) ( not ( = ?auto_149173 ?auto_149168 ) ) ( not ( = ?auto_149170 ?auto_149174 ) ) ( not ( = ?auto_149170 ?auto_149172 ) ) ( not ( = ?auto_149170 ?auto_149169 ) ) ( not ( = ?auto_149170 ?auto_149168 ) ) ( not ( = ?auto_149174 ?auto_149172 ) ) ( not ( = ?auto_149174 ?auto_149169 ) ) ( not ( = ?auto_149174 ?auto_149168 ) ) ( not ( = ?auto_149166 ?auto_149173 ) ) ( not ( = ?auto_149166 ?auto_149170 ) ) ( not ( = ?auto_149166 ?auto_149174 ) ) ( not ( = ?auto_149167 ?auto_149173 ) ) ( not ( = ?auto_149167 ?auto_149170 ) ) ( not ( = ?auto_149167 ?auto_149174 ) ) ( ON ?auto_149166 ?auto_149171 ) ( not ( = ?auto_149166 ?auto_149171 ) ) ( not ( = ?auto_149167 ?auto_149171 ) ) ( not ( = ?auto_149168 ?auto_149171 ) ) ( not ( = ?auto_149169 ?auto_149171 ) ) ( not ( = ?auto_149172 ?auto_149171 ) ) ( not ( = ?auto_149173 ?auto_149171 ) ) ( not ( = ?auto_149170 ?auto_149171 ) ) ( not ( = ?auto_149174 ?auto_149171 ) ) ( ON ?auto_149167 ?auto_149166 ) ( ON-TABLE ?auto_149171 ) ( ON ?auto_149168 ?auto_149167 ) ( ON ?auto_149169 ?auto_149168 ) ( ON ?auto_149172 ?auto_149169 ) ( ON ?auto_149174 ?auto_149172 ) ( CLEAR ?auto_149174 ) ( HOLDING ?auto_149170 ) ( CLEAR ?auto_149173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149173 ?auto_149170 )
      ( MAKE-4PILE ?auto_149166 ?auto_149167 ?auto_149168 ?auto_149169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149175 - BLOCK
      ?auto_149176 - BLOCK
      ?auto_149177 - BLOCK
      ?auto_149178 - BLOCK
    )
    :vars
    (
      ?auto_149183 - BLOCK
      ?auto_149179 - BLOCK
      ?auto_149181 - BLOCK
      ?auto_149180 - BLOCK
      ?auto_149182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149175 ?auto_149176 ) ) ( not ( = ?auto_149175 ?auto_149177 ) ) ( not ( = ?auto_149175 ?auto_149178 ) ) ( not ( = ?auto_149176 ?auto_149177 ) ) ( not ( = ?auto_149176 ?auto_149178 ) ) ( not ( = ?auto_149177 ?auto_149178 ) ) ( not ( = ?auto_149175 ?auto_149183 ) ) ( not ( = ?auto_149176 ?auto_149183 ) ) ( not ( = ?auto_149177 ?auto_149183 ) ) ( not ( = ?auto_149178 ?auto_149183 ) ) ( ON-TABLE ?auto_149179 ) ( not ( = ?auto_149179 ?auto_149181 ) ) ( not ( = ?auto_149179 ?auto_149180 ) ) ( not ( = ?auto_149179 ?auto_149183 ) ) ( not ( = ?auto_149179 ?auto_149178 ) ) ( not ( = ?auto_149179 ?auto_149177 ) ) ( not ( = ?auto_149181 ?auto_149180 ) ) ( not ( = ?auto_149181 ?auto_149183 ) ) ( not ( = ?auto_149181 ?auto_149178 ) ) ( not ( = ?auto_149181 ?auto_149177 ) ) ( not ( = ?auto_149180 ?auto_149183 ) ) ( not ( = ?auto_149180 ?auto_149178 ) ) ( not ( = ?auto_149180 ?auto_149177 ) ) ( not ( = ?auto_149175 ?auto_149179 ) ) ( not ( = ?auto_149175 ?auto_149181 ) ) ( not ( = ?auto_149175 ?auto_149180 ) ) ( not ( = ?auto_149176 ?auto_149179 ) ) ( not ( = ?auto_149176 ?auto_149181 ) ) ( not ( = ?auto_149176 ?auto_149180 ) ) ( ON ?auto_149175 ?auto_149182 ) ( not ( = ?auto_149175 ?auto_149182 ) ) ( not ( = ?auto_149176 ?auto_149182 ) ) ( not ( = ?auto_149177 ?auto_149182 ) ) ( not ( = ?auto_149178 ?auto_149182 ) ) ( not ( = ?auto_149183 ?auto_149182 ) ) ( not ( = ?auto_149179 ?auto_149182 ) ) ( not ( = ?auto_149181 ?auto_149182 ) ) ( not ( = ?auto_149180 ?auto_149182 ) ) ( ON ?auto_149176 ?auto_149175 ) ( ON-TABLE ?auto_149182 ) ( ON ?auto_149177 ?auto_149176 ) ( ON ?auto_149178 ?auto_149177 ) ( ON ?auto_149183 ?auto_149178 ) ( ON ?auto_149180 ?auto_149183 ) ( CLEAR ?auto_149179 ) ( ON ?auto_149181 ?auto_149180 ) ( CLEAR ?auto_149181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149182 ?auto_149175 ?auto_149176 ?auto_149177 ?auto_149178 ?auto_149183 ?auto_149180 )
      ( MAKE-4PILE ?auto_149175 ?auto_149176 ?auto_149177 ?auto_149178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149184 - BLOCK
      ?auto_149185 - BLOCK
      ?auto_149186 - BLOCK
      ?auto_149187 - BLOCK
    )
    :vars
    (
      ?auto_149189 - BLOCK
      ?auto_149192 - BLOCK
      ?auto_149188 - BLOCK
      ?auto_149190 - BLOCK
      ?auto_149191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149184 ?auto_149185 ) ) ( not ( = ?auto_149184 ?auto_149186 ) ) ( not ( = ?auto_149184 ?auto_149187 ) ) ( not ( = ?auto_149185 ?auto_149186 ) ) ( not ( = ?auto_149185 ?auto_149187 ) ) ( not ( = ?auto_149186 ?auto_149187 ) ) ( not ( = ?auto_149184 ?auto_149189 ) ) ( not ( = ?auto_149185 ?auto_149189 ) ) ( not ( = ?auto_149186 ?auto_149189 ) ) ( not ( = ?auto_149187 ?auto_149189 ) ) ( not ( = ?auto_149192 ?auto_149188 ) ) ( not ( = ?auto_149192 ?auto_149190 ) ) ( not ( = ?auto_149192 ?auto_149189 ) ) ( not ( = ?auto_149192 ?auto_149187 ) ) ( not ( = ?auto_149192 ?auto_149186 ) ) ( not ( = ?auto_149188 ?auto_149190 ) ) ( not ( = ?auto_149188 ?auto_149189 ) ) ( not ( = ?auto_149188 ?auto_149187 ) ) ( not ( = ?auto_149188 ?auto_149186 ) ) ( not ( = ?auto_149190 ?auto_149189 ) ) ( not ( = ?auto_149190 ?auto_149187 ) ) ( not ( = ?auto_149190 ?auto_149186 ) ) ( not ( = ?auto_149184 ?auto_149192 ) ) ( not ( = ?auto_149184 ?auto_149188 ) ) ( not ( = ?auto_149184 ?auto_149190 ) ) ( not ( = ?auto_149185 ?auto_149192 ) ) ( not ( = ?auto_149185 ?auto_149188 ) ) ( not ( = ?auto_149185 ?auto_149190 ) ) ( ON ?auto_149184 ?auto_149191 ) ( not ( = ?auto_149184 ?auto_149191 ) ) ( not ( = ?auto_149185 ?auto_149191 ) ) ( not ( = ?auto_149186 ?auto_149191 ) ) ( not ( = ?auto_149187 ?auto_149191 ) ) ( not ( = ?auto_149189 ?auto_149191 ) ) ( not ( = ?auto_149192 ?auto_149191 ) ) ( not ( = ?auto_149188 ?auto_149191 ) ) ( not ( = ?auto_149190 ?auto_149191 ) ) ( ON ?auto_149185 ?auto_149184 ) ( ON-TABLE ?auto_149191 ) ( ON ?auto_149186 ?auto_149185 ) ( ON ?auto_149187 ?auto_149186 ) ( ON ?auto_149189 ?auto_149187 ) ( ON ?auto_149190 ?auto_149189 ) ( ON ?auto_149188 ?auto_149190 ) ( CLEAR ?auto_149188 ) ( HOLDING ?auto_149192 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149192 )
      ( MAKE-4PILE ?auto_149184 ?auto_149185 ?auto_149186 ?auto_149187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_149193 - BLOCK
      ?auto_149194 - BLOCK
      ?auto_149195 - BLOCK
      ?auto_149196 - BLOCK
    )
    :vars
    (
      ?auto_149198 - BLOCK
      ?auto_149201 - BLOCK
      ?auto_149199 - BLOCK
      ?auto_149200 - BLOCK
      ?auto_149197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149193 ?auto_149194 ) ) ( not ( = ?auto_149193 ?auto_149195 ) ) ( not ( = ?auto_149193 ?auto_149196 ) ) ( not ( = ?auto_149194 ?auto_149195 ) ) ( not ( = ?auto_149194 ?auto_149196 ) ) ( not ( = ?auto_149195 ?auto_149196 ) ) ( not ( = ?auto_149193 ?auto_149198 ) ) ( not ( = ?auto_149194 ?auto_149198 ) ) ( not ( = ?auto_149195 ?auto_149198 ) ) ( not ( = ?auto_149196 ?auto_149198 ) ) ( not ( = ?auto_149201 ?auto_149199 ) ) ( not ( = ?auto_149201 ?auto_149200 ) ) ( not ( = ?auto_149201 ?auto_149198 ) ) ( not ( = ?auto_149201 ?auto_149196 ) ) ( not ( = ?auto_149201 ?auto_149195 ) ) ( not ( = ?auto_149199 ?auto_149200 ) ) ( not ( = ?auto_149199 ?auto_149198 ) ) ( not ( = ?auto_149199 ?auto_149196 ) ) ( not ( = ?auto_149199 ?auto_149195 ) ) ( not ( = ?auto_149200 ?auto_149198 ) ) ( not ( = ?auto_149200 ?auto_149196 ) ) ( not ( = ?auto_149200 ?auto_149195 ) ) ( not ( = ?auto_149193 ?auto_149201 ) ) ( not ( = ?auto_149193 ?auto_149199 ) ) ( not ( = ?auto_149193 ?auto_149200 ) ) ( not ( = ?auto_149194 ?auto_149201 ) ) ( not ( = ?auto_149194 ?auto_149199 ) ) ( not ( = ?auto_149194 ?auto_149200 ) ) ( ON ?auto_149193 ?auto_149197 ) ( not ( = ?auto_149193 ?auto_149197 ) ) ( not ( = ?auto_149194 ?auto_149197 ) ) ( not ( = ?auto_149195 ?auto_149197 ) ) ( not ( = ?auto_149196 ?auto_149197 ) ) ( not ( = ?auto_149198 ?auto_149197 ) ) ( not ( = ?auto_149201 ?auto_149197 ) ) ( not ( = ?auto_149199 ?auto_149197 ) ) ( not ( = ?auto_149200 ?auto_149197 ) ) ( ON ?auto_149194 ?auto_149193 ) ( ON-TABLE ?auto_149197 ) ( ON ?auto_149195 ?auto_149194 ) ( ON ?auto_149196 ?auto_149195 ) ( ON ?auto_149198 ?auto_149196 ) ( ON ?auto_149200 ?auto_149198 ) ( ON ?auto_149199 ?auto_149200 ) ( ON ?auto_149201 ?auto_149199 ) ( CLEAR ?auto_149201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149197 ?auto_149193 ?auto_149194 ?auto_149195 ?auto_149196 ?auto_149198 ?auto_149200 ?auto_149199 )
      ( MAKE-4PILE ?auto_149193 ?auto_149194 ?auto_149195 ?auto_149196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149221 - BLOCK
      ?auto_149222 - BLOCK
      ?auto_149223 - BLOCK
    )
    :vars
    (
      ?auto_149225 - BLOCK
      ?auto_149226 - BLOCK
      ?auto_149224 - BLOCK
      ?auto_149228 - BLOCK
      ?auto_149227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149225 ?auto_149223 ) ( ON-TABLE ?auto_149221 ) ( ON ?auto_149222 ?auto_149221 ) ( ON ?auto_149223 ?auto_149222 ) ( not ( = ?auto_149221 ?auto_149222 ) ) ( not ( = ?auto_149221 ?auto_149223 ) ) ( not ( = ?auto_149221 ?auto_149225 ) ) ( not ( = ?auto_149222 ?auto_149223 ) ) ( not ( = ?auto_149222 ?auto_149225 ) ) ( not ( = ?auto_149223 ?auto_149225 ) ) ( not ( = ?auto_149221 ?auto_149226 ) ) ( not ( = ?auto_149221 ?auto_149224 ) ) ( not ( = ?auto_149222 ?auto_149226 ) ) ( not ( = ?auto_149222 ?auto_149224 ) ) ( not ( = ?auto_149223 ?auto_149226 ) ) ( not ( = ?auto_149223 ?auto_149224 ) ) ( not ( = ?auto_149225 ?auto_149226 ) ) ( not ( = ?auto_149225 ?auto_149224 ) ) ( not ( = ?auto_149226 ?auto_149224 ) ) ( ON ?auto_149226 ?auto_149225 ) ( CLEAR ?auto_149226 ) ( HOLDING ?auto_149224 ) ( CLEAR ?auto_149228 ) ( ON-TABLE ?auto_149227 ) ( ON ?auto_149228 ?auto_149227 ) ( not ( = ?auto_149227 ?auto_149228 ) ) ( not ( = ?auto_149227 ?auto_149224 ) ) ( not ( = ?auto_149228 ?auto_149224 ) ) ( not ( = ?auto_149221 ?auto_149228 ) ) ( not ( = ?auto_149221 ?auto_149227 ) ) ( not ( = ?auto_149222 ?auto_149228 ) ) ( not ( = ?auto_149222 ?auto_149227 ) ) ( not ( = ?auto_149223 ?auto_149228 ) ) ( not ( = ?auto_149223 ?auto_149227 ) ) ( not ( = ?auto_149225 ?auto_149228 ) ) ( not ( = ?auto_149225 ?auto_149227 ) ) ( not ( = ?auto_149226 ?auto_149228 ) ) ( not ( = ?auto_149226 ?auto_149227 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149227 ?auto_149228 ?auto_149224 )
      ( MAKE-3PILE ?auto_149221 ?auto_149222 ?auto_149223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149229 - BLOCK
      ?auto_149230 - BLOCK
      ?auto_149231 - BLOCK
    )
    :vars
    (
      ?auto_149232 - BLOCK
      ?auto_149234 - BLOCK
      ?auto_149235 - BLOCK
      ?auto_149233 - BLOCK
      ?auto_149236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149232 ?auto_149231 ) ( ON-TABLE ?auto_149229 ) ( ON ?auto_149230 ?auto_149229 ) ( ON ?auto_149231 ?auto_149230 ) ( not ( = ?auto_149229 ?auto_149230 ) ) ( not ( = ?auto_149229 ?auto_149231 ) ) ( not ( = ?auto_149229 ?auto_149232 ) ) ( not ( = ?auto_149230 ?auto_149231 ) ) ( not ( = ?auto_149230 ?auto_149232 ) ) ( not ( = ?auto_149231 ?auto_149232 ) ) ( not ( = ?auto_149229 ?auto_149234 ) ) ( not ( = ?auto_149229 ?auto_149235 ) ) ( not ( = ?auto_149230 ?auto_149234 ) ) ( not ( = ?auto_149230 ?auto_149235 ) ) ( not ( = ?auto_149231 ?auto_149234 ) ) ( not ( = ?auto_149231 ?auto_149235 ) ) ( not ( = ?auto_149232 ?auto_149234 ) ) ( not ( = ?auto_149232 ?auto_149235 ) ) ( not ( = ?auto_149234 ?auto_149235 ) ) ( ON ?auto_149234 ?auto_149232 ) ( CLEAR ?auto_149233 ) ( ON-TABLE ?auto_149236 ) ( ON ?auto_149233 ?auto_149236 ) ( not ( = ?auto_149236 ?auto_149233 ) ) ( not ( = ?auto_149236 ?auto_149235 ) ) ( not ( = ?auto_149233 ?auto_149235 ) ) ( not ( = ?auto_149229 ?auto_149233 ) ) ( not ( = ?auto_149229 ?auto_149236 ) ) ( not ( = ?auto_149230 ?auto_149233 ) ) ( not ( = ?auto_149230 ?auto_149236 ) ) ( not ( = ?auto_149231 ?auto_149233 ) ) ( not ( = ?auto_149231 ?auto_149236 ) ) ( not ( = ?auto_149232 ?auto_149233 ) ) ( not ( = ?auto_149232 ?auto_149236 ) ) ( not ( = ?auto_149234 ?auto_149233 ) ) ( not ( = ?auto_149234 ?auto_149236 ) ) ( ON ?auto_149235 ?auto_149234 ) ( CLEAR ?auto_149235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149229 ?auto_149230 ?auto_149231 ?auto_149232 ?auto_149234 )
      ( MAKE-3PILE ?auto_149229 ?auto_149230 ?auto_149231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149237 - BLOCK
      ?auto_149238 - BLOCK
      ?auto_149239 - BLOCK
    )
    :vars
    (
      ?auto_149241 - BLOCK
      ?auto_149242 - BLOCK
      ?auto_149243 - BLOCK
      ?auto_149240 - BLOCK
      ?auto_149244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149241 ?auto_149239 ) ( ON-TABLE ?auto_149237 ) ( ON ?auto_149238 ?auto_149237 ) ( ON ?auto_149239 ?auto_149238 ) ( not ( = ?auto_149237 ?auto_149238 ) ) ( not ( = ?auto_149237 ?auto_149239 ) ) ( not ( = ?auto_149237 ?auto_149241 ) ) ( not ( = ?auto_149238 ?auto_149239 ) ) ( not ( = ?auto_149238 ?auto_149241 ) ) ( not ( = ?auto_149239 ?auto_149241 ) ) ( not ( = ?auto_149237 ?auto_149242 ) ) ( not ( = ?auto_149237 ?auto_149243 ) ) ( not ( = ?auto_149238 ?auto_149242 ) ) ( not ( = ?auto_149238 ?auto_149243 ) ) ( not ( = ?auto_149239 ?auto_149242 ) ) ( not ( = ?auto_149239 ?auto_149243 ) ) ( not ( = ?auto_149241 ?auto_149242 ) ) ( not ( = ?auto_149241 ?auto_149243 ) ) ( not ( = ?auto_149242 ?auto_149243 ) ) ( ON ?auto_149242 ?auto_149241 ) ( ON-TABLE ?auto_149240 ) ( not ( = ?auto_149240 ?auto_149244 ) ) ( not ( = ?auto_149240 ?auto_149243 ) ) ( not ( = ?auto_149244 ?auto_149243 ) ) ( not ( = ?auto_149237 ?auto_149244 ) ) ( not ( = ?auto_149237 ?auto_149240 ) ) ( not ( = ?auto_149238 ?auto_149244 ) ) ( not ( = ?auto_149238 ?auto_149240 ) ) ( not ( = ?auto_149239 ?auto_149244 ) ) ( not ( = ?auto_149239 ?auto_149240 ) ) ( not ( = ?auto_149241 ?auto_149244 ) ) ( not ( = ?auto_149241 ?auto_149240 ) ) ( not ( = ?auto_149242 ?auto_149244 ) ) ( not ( = ?auto_149242 ?auto_149240 ) ) ( ON ?auto_149243 ?auto_149242 ) ( CLEAR ?auto_149243 ) ( HOLDING ?auto_149244 ) ( CLEAR ?auto_149240 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149240 ?auto_149244 )
      ( MAKE-3PILE ?auto_149237 ?auto_149238 ?auto_149239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149245 - BLOCK
      ?auto_149246 - BLOCK
      ?auto_149247 - BLOCK
    )
    :vars
    (
      ?auto_149252 - BLOCK
      ?auto_149248 - BLOCK
      ?auto_149251 - BLOCK
      ?auto_149250 - BLOCK
      ?auto_149249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149252 ?auto_149247 ) ( ON-TABLE ?auto_149245 ) ( ON ?auto_149246 ?auto_149245 ) ( ON ?auto_149247 ?auto_149246 ) ( not ( = ?auto_149245 ?auto_149246 ) ) ( not ( = ?auto_149245 ?auto_149247 ) ) ( not ( = ?auto_149245 ?auto_149252 ) ) ( not ( = ?auto_149246 ?auto_149247 ) ) ( not ( = ?auto_149246 ?auto_149252 ) ) ( not ( = ?auto_149247 ?auto_149252 ) ) ( not ( = ?auto_149245 ?auto_149248 ) ) ( not ( = ?auto_149245 ?auto_149251 ) ) ( not ( = ?auto_149246 ?auto_149248 ) ) ( not ( = ?auto_149246 ?auto_149251 ) ) ( not ( = ?auto_149247 ?auto_149248 ) ) ( not ( = ?auto_149247 ?auto_149251 ) ) ( not ( = ?auto_149252 ?auto_149248 ) ) ( not ( = ?auto_149252 ?auto_149251 ) ) ( not ( = ?auto_149248 ?auto_149251 ) ) ( ON ?auto_149248 ?auto_149252 ) ( ON-TABLE ?auto_149250 ) ( not ( = ?auto_149250 ?auto_149249 ) ) ( not ( = ?auto_149250 ?auto_149251 ) ) ( not ( = ?auto_149249 ?auto_149251 ) ) ( not ( = ?auto_149245 ?auto_149249 ) ) ( not ( = ?auto_149245 ?auto_149250 ) ) ( not ( = ?auto_149246 ?auto_149249 ) ) ( not ( = ?auto_149246 ?auto_149250 ) ) ( not ( = ?auto_149247 ?auto_149249 ) ) ( not ( = ?auto_149247 ?auto_149250 ) ) ( not ( = ?auto_149252 ?auto_149249 ) ) ( not ( = ?auto_149252 ?auto_149250 ) ) ( not ( = ?auto_149248 ?auto_149249 ) ) ( not ( = ?auto_149248 ?auto_149250 ) ) ( ON ?auto_149251 ?auto_149248 ) ( CLEAR ?auto_149250 ) ( ON ?auto_149249 ?auto_149251 ) ( CLEAR ?auto_149249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149245 ?auto_149246 ?auto_149247 ?auto_149252 ?auto_149248 ?auto_149251 )
      ( MAKE-3PILE ?auto_149245 ?auto_149246 ?auto_149247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149253 - BLOCK
      ?auto_149254 - BLOCK
      ?auto_149255 - BLOCK
    )
    :vars
    (
      ?auto_149259 - BLOCK
      ?auto_149257 - BLOCK
      ?auto_149258 - BLOCK
      ?auto_149256 - BLOCK
      ?auto_149260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149259 ?auto_149255 ) ( ON-TABLE ?auto_149253 ) ( ON ?auto_149254 ?auto_149253 ) ( ON ?auto_149255 ?auto_149254 ) ( not ( = ?auto_149253 ?auto_149254 ) ) ( not ( = ?auto_149253 ?auto_149255 ) ) ( not ( = ?auto_149253 ?auto_149259 ) ) ( not ( = ?auto_149254 ?auto_149255 ) ) ( not ( = ?auto_149254 ?auto_149259 ) ) ( not ( = ?auto_149255 ?auto_149259 ) ) ( not ( = ?auto_149253 ?auto_149257 ) ) ( not ( = ?auto_149253 ?auto_149258 ) ) ( not ( = ?auto_149254 ?auto_149257 ) ) ( not ( = ?auto_149254 ?auto_149258 ) ) ( not ( = ?auto_149255 ?auto_149257 ) ) ( not ( = ?auto_149255 ?auto_149258 ) ) ( not ( = ?auto_149259 ?auto_149257 ) ) ( not ( = ?auto_149259 ?auto_149258 ) ) ( not ( = ?auto_149257 ?auto_149258 ) ) ( ON ?auto_149257 ?auto_149259 ) ( not ( = ?auto_149256 ?auto_149260 ) ) ( not ( = ?auto_149256 ?auto_149258 ) ) ( not ( = ?auto_149260 ?auto_149258 ) ) ( not ( = ?auto_149253 ?auto_149260 ) ) ( not ( = ?auto_149253 ?auto_149256 ) ) ( not ( = ?auto_149254 ?auto_149260 ) ) ( not ( = ?auto_149254 ?auto_149256 ) ) ( not ( = ?auto_149255 ?auto_149260 ) ) ( not ( = ?auto_149255 ?auto_149256 ) ) ( not ( = ?auto_149259 ?auto_149260 ) ) ( not ( = ?auto_149259 ?auto_149256 ) ) ( not ( = ?auto_149257 ?auto_149260 ) ) ( not ( = ?auto_149257 ?auto_149256 ) ) ( ON ?auto_149258 ?auto_149257 ) ( ON ?auto_149260 ?auto_149258 ) ( CLEAR ?auto_149260 ) ( HOLDING ?auto_149256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149256 )
      ( MAKE-3PILE ?auto_149253 ?auto_149254 ?auto_149255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149272 - BLOCK
      ?auto_149273 - BLOCK
      ?auto_149274 - BLOCK
    )
    :vars
    (
      ?auto_149276 - BLOCK
      ?auto_149277 - BLOCK
      ?auto_149279 - BLOCK
      ?auto_149275 - BLOCK
      ?auto_149278 - BLOCK
      ?auto_149280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149276 ?auto_149274 ) ( ON-TABLE ?auto_149272 ) ( ON ?auto_149273 ?auto_149272 ) ( ON ?auto_149274 ?auto_149273 ) ( not ( = ?auto_149272 ?auto_149273 ) ) ( not ( = ?auto_149272 ?auto_149274 ) ) ( not ( = ?auto_149272 ?auto_149276 ) ) ( not ( = ?auto_149273 ?auto_149274 ) ) ( not ( = ?auto_149273 ?auto_149276 ) ) ( not ( = ?auto_149274 ?auto_149276 ) ) ( not ( = ?auto_149272 ?auto_149277 ) ) ( not ( = ?auto_149272 ?auto_149279 ) ) ( not ( = ?auto_149273 ?auto_149277 ) ) ( not ( = ?auto_149273 ?auto_149279 ) ) ( not ( = ?auto_149274 ?auto_149277 ) ) ( not ( = ?auto_149274 ?auto_149279 ) ) ( not ( = ?auto_149276 ?auto_149277 ) ) ( not ( = ?auto_149276 ?auto_149279 ) ) ( not ( = ?auto_149277 ?auto_149279 ) ) ( ON ?auto_149277 ?auto_149276 ) ( not ( = ?auto_149275 ?auto_149278 ) ) ( not ( = ?auto_149275 ?auto_149279 ) ) ( not ( = ?auto_149278 ?auto_149279 ) ) ( not ( = ?auto_149272 ?auto_149278 ) ) ( not ( = ?auto_149272 ?auto_149275 ) ) ( not ( = ?auto_149273 ?auto_149278 ) ) ( not ( = ?auto_149273 ?auto_149275 ) ) ( not ( = ?auto_149274 ?auto_149278 ) ) ( not ( = ?auto_149274 ?auto_149275 ) ) ( not ( = ?auto_149276 ?auto_149278 ) ) ( not ( = ?auto_149276 ?auto_149275 ) ) ( not ( = ?auto_149277 ?auto_149278 ) ) ( not ( = ?auto_149277 ?auto_149275 ) ) ( ON ?auto_149279 ?auto_149277 ) ( ON ?auto_149278 ?auto_149279 ) ( CLEAR ?auto_149278 ) ( ON ?auto_149275 ?auto_149280 ) ( CLEAR ?auto_149275 ) ( HAND-EMPTY ) ( not ( = ?auto_149272 ?auto_149280 ) ) ( not ( = ?auto_149273 ?auto_149280 ) ) ( not ( = ?auto_149274 ?auto_149280 ) ) ( not ( = ?auto_149276 ?auto_149280 ) ) ( not ( = ?auto_149277 ?auto_149280 ) ) ( not ( = ?auto_149279 ?auto_149280 ) ) ( not ( = ?auto_149275 ?auto_149280 ) ) ( not ( = ?auto_149278 ?auto_149280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149275 ?auto_149280 )
      ( MAKE-3PILE ?auto_149272 ?auto_149273 ?auto_149274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149281 - BLOCK
      ?auto_149282 - BLOCK
      ?auto_149283 - BLOCK
    )
    :vars
    (
      ?auto_149289 - BLOCK
      ?auto_149284 - BLOCK
      ?auto_149285 - BLOCK
      ?auto_149286 - BLOCK
      ?auto_149287 - BLOCK
      ?auto_149288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149289 ?auto_149283 ) ( ON-TABLE ?auto_149281 ) ( ON ?auto_149282 ?auto_149281 ) ( ON ?auto_149283 ?auto_149282 ) ( not ( = ?auto_149281 ?auto_149282 ) ) ( not ( = ?auto_149281 ?auto_149283 ) ) ( not ( = ?auto_149281 ?auto_149289 ) ) ( not ( = ?auto_149282 ?auto_149283 ) ) ( not ( = ?auto_149282 ?auto_149289 ) ) ( not ( = ?auto_149283 ?auto_149289 ) ) ( not ( = ?auto_149281 ?auto_149284 ) ) ( not ( = ?auto_149281 ?auto_149285 ) ) ( not ( = ?auto_149282 ?auto_149284 ) ) ( not ( = ?auto_149282 ?auto_149285 ) ) ( not ( = ?auto_149283 ?auto_149284 ) ) ( not ( = ?auto_149283 ?auto_149285 ) ) ( not ( = ?auto_149289 ?auto_149284 ) ) ( not ( = ?auto_149289 ?auto_149285 ) ) ( not ( = ?auto_149284 ?auto_149285 ) ) ( ON ?auto_149284 ?auto_149289 ) ( not ( = ?auto_149286 ?auto_149287 ) ) ( not ( = ?auto_149286 ?auto_149285 ) ) ( not ( = ?auto_149287 ?auto_149285 ) ) ( not ( = ?auto_149281 ?auto_149287 ) ) ( not ( = ?auto_149281 ?auto_149286 ) ) ( not ( = ?auto_149282 ?auto_149287 ) ) ( not ( = ?auto_149282 ?auto_149286 ) ) ( not ( = ?auto_149283 ?auto_149287 ) ) ( not ( = ?auto_149283 ?auto_149286 ) ) ( not ( = ?auto_149289 ?auto_149287 ) ) ( not ( = ?auto_149289 ?auto_149286 ) ) ( not ( = ?auto_149284 ?auto_149287 ) ) ( not ( = ?auto_149284 ?auto_149286 ) ) ( ON ?auto_149285 ?auto_149284 ) ( ON ?auto_149286 ?auto_149288 ) ( CLEAR ?auto_149286 ) ( not ( = ?auto_149281 ?auto_149288 ) ) ( not ( = ?auto_149282 ?auto_149288 ) ) ( not ( = ?auto_149283 ?auto_149288 ) ) ( not ( = ?auto_149289 ?auto_149288 ) ) ( not ( = ?auto_149284 ?auto_149288 ) ) ( not ( = ?auto_149285 ?auto_149288 ) ) ( not ( = ?auto_149286 ?auto_149288 ) ) ( not ( = ?auto_149287 ?auto_149288 ) ) ( HOLDING ?auto_149287 ) ( CLEAR ?auto_149285 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149281 ?auto_149282 ?auto_149283 ?auto_149289 ?auto_149284 ?auto_149285 ?auto_149287 )
      ( MAKE-3PILE ?auto_149281 ?auto_149282 ?auto_149283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149290 - BLOCK
      ?auto_149291 - BLOCK
      ?auto_149292 - BLOCK
    )
    :vars
    (
      ?auto_149296 - BLOCK
      ?auto_149294 - BLOCK
      ?auto_149293 - BLOCK
      ?auto_149298 - BLOCK
      ?auto_149295 - BLOCK
      ?auto_149297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149296 ?auto_149292 ) ( ON-TABLE ?auto_149290 ) ( ON ?auto_149291 ?auto_149290 ) ( ON ?auto_149292 ?auto_149291 ) ( not ( = ?auto_149290 ?auto_149291 ) ) ( not ( = ?auto_149290 ?auto_149292 ) ) ( not ( = ?auto_149290 ?auto_149296 ) ) ( not ( = ?auto_149291 ?auto_149292 ) ) ( not ( = ?auto_149291 ?auto_149296 ) ) ( not ( = ?auto_149292 ?auto_149296 ) ) ( not ( = ?auto_149290 ?auto_149294 ) ) ( not ( = ?auto_149290 ?auto_149293 ) ) ( not ( = ?auto_149291 ?auto_149294 ) ) ( not ( = ?auto_149291 ?auto_149293 ) ) ( not ( = ?auto_149292 ?auto_149294 ) ) ( not ( = ?auto_149292 ?auto_149293 ) ) ( not ( = ?auto_149296 ?auto_149294 ) ) ( not ( = ?auto_149296 ?auto_149293 ) ) ( not ( = ?auto_149294 ?auto_149293 ) ) ( ON ?auto_149294 ?auto_149296 ) ( not ( = ?auto_149298 ?auto_149295 ) ) ( not ( = ?auto_149298 ?auto_149293 ) ) ( not ( = ?auto_149295 ?auto_149293 ) ) ( not ( = ?auto_149290 ?auto_149295 ) ) ( not ( = ?auto_149290 ?auto_149298 ) ) ( not ( = ?auto_149291 ?auto_149295 ) ) ( not ( = ?auto_149291 ?auto_149298 ) ) ( not ( = ?auto_149292 ?auto_149295 ) ) ( not ( = ?auto_149292 ?auto_149298 ) ) ( not ( = ?auto_149296 ?auto_149295 ) ) ( not ( = ?auto_149296 ?auto_149298 ) ) ( not ( = ?auto_149294 ?auto_149295 ) ) ( not ( = ?auto_149294 ?auto_149298 ) ) ( ON ?auto_149293 ?auto_149294 ) ( ON ?auto_149298 ?auto_149297 ) ( not ( = ?auto_149290 ?auto_149297 ) ) ( not ( = ?auto_149291 ?auto_149297 ) ) ( not ( = ?auto_149292 ?auto_149297 ) ) ( not ( = ?auto_149296 ?auto_149297 ) ) ( not ( = ?auto_149294 ?auto_149297 ) ) ( not ( = ?auto_149293 ?auto_149297 ) ) ( not ( = ?auto_149298 ?auto_149297 ) ) ( not ( = ?auto_149295 ?auto_149297 ) ) ( CLEAR ?auto_149293 ) ( ON ?auto_149295 ?auto_149298 ) ( CLEAR ?auto_149295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149297 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149297 ?auto_149298 )
      ( MAKE-3PILE ?auto_149290 ?auto_149291 ?auto_149292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_149299 - BLOCK
      ?auto_149300 - BLOCK
      ?auto_149301 - BLOCK
    )
    :vars
    (
      ?auto_149303 - BLOCK
      ?auto_149307 - BLOCK
      ?auto_149304 - BLOCK
      ?auto_149306 - BLOCK
      ?auto_149302 - BLOCK
      ?auto_149305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149303 ?auto_149301 ) ( ON-TABLE ?auto_149299 ) ( ON ?auto_149300 ?auto_149299 ) ( ON ?auto_149301 ?auto_149300 ) ( not ( = ?auto_149299 ?auto_149300 ) ) ( not ( = ?auto_149299 ?auto_149301 ) ) ( not ( = ?auto_149299 ?auto_149303 ) ) ( not ( = ?auto_149300 ?auto_149301 ) ) ( not ( = ?auto_149300 ?auto_149303 ) ) ( not ( = ?auto_149301 ?auto_149303 ) ) ( not ( = ?auto_149299 ?auto_149307 ) ) ( not ( = ?auto_149299 ?auto_149304 ) ) ( not ( = ?auto_149300 ?auto_149307 ) ) ( not ( = ?auto_149300 ?auto_149304 ) ) ( not ( = ?auto_149301 ?auto_149307 ) ) ( not ( = ?auto_149301 ?auto_149304 ) ) ( not ( = ?auto_149303 ?auto_149307 ) ) ( not ( = ?auto_149303 ?auto_149304 ) ) ( not ( = ?auto_149307 ?auto_149304 ) ) ( ON ?auto_149307 ?auto_149303 ) ( not ( = ?auto_149306 ?auto_149302 ) ) ( not ( = ?auto_149306 ?auto_149304 ) ) ( not ( = ?auto_149302 ?auto_149304 ) ) ( not ( = ?auto_149299 ?auto_149302 ) ) ( not ( = ?auto_149299 ?auto_149306 ) ) ( not ( = ?auto_149300 ?auto_149302 ) ) ( not ( = ?auto_149300 ?auto_149306 ) ) ( not ( = ?auto_149301 ?auto_149302 ) ) ( not ( = ?auto_149301 ?auto_149306 ) ) ( not ( = ?auto_149303 ?auto_149302 ) ) ( not ( = ?auto_149303 ?auto_149306 ) ) ( not ( = ?auto_149307 ?auto_149302 ) ) ( not ( = ?auto_149307 ?auto_149306 ) ) ( ON ?auto_149306 ?auto_149305 ) ( not ( = ?auto_149299 ?auto_149305 ) ) ( not ( = ?auto_149300 ?auto_149305 ) ) ( not ( = ?auto_149301 ?auto_149305 ) ) ( not ( = ?auto_149303 ?auto_149305 ) ) ( not ( = ?auto_149307 ?auto_149305 ) ) ( not ( = ?auto_149304 ?auto_149305 ) ) ( not ( = ?auto_149306 ?auto_149305 ) ) ( not ( = ?auto_149302 ?auto_149305 ) ) ( ON ?auto_149302 ?auto_149306 ) ( CLEAR ?auto_149302 ) ( ON-TABLE ?auto_149305 ) ( HOLDING ?auto_149304 ) ( CLEAR ?auto_149307 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149299 ?auto_149300 ?auto_149301 ?auto_149303 ?auto_149307 ?auto_149304 )
      ( MAKE-3PILE ?auto_149299 ?auto_149300 ?auto_149301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149366 - BLOCK
      ?auto_149367 - BLOCK
      ?auto_149368 - BLOCK
      ?auto_149369 - BLOCK
      ?auto_149370 - BLOCK
    )
    :vars
    (
      ?auto_149371 - BLOCK
      ?auto_149372 - BLOCK
      ?auto_149373 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149366 ) ( ON ?auto_149367 ?auto_149366 ) ( ON ?auto_149368 ?auto_149367 ) ( not ( = ?auto_149366 ?auto_149367 ) ) ( not ( = ?auto_149366 ?auto_149368 ) ) ( not ( = ?auto_149366 ?auto_149369 ) ) ( not ( = ?auto_149366 ?auto_149370 ) ) ( not ( = ?auto_149367 ?auto_149368 ) ) ( not ( = ?auto_149367 ?auto_149369 ) ) ( not ( = ?auto_149367 ?auto_149370 ) ) ( not ( = ?auto_149368 ?auto_149369 ) ) ( not ( = ?auto_149368 ?auto_149370 ) ) ( not ( = ?auto_149369 ?auto_149370 ) ) ( ON ?auto_149370 ?auto_149371 ) ( not ( = ?auto_149366 ?auto_149371 ) ) ( not ( = ?auto_149367 ?auto_149371 ) ) ( not ( = ?auto_149368 ?auto_149371 ) ) ( not ( = ?auto_149369 ?auto_149371 ) ) ( not ( = ?auto_149370 ?auto_149371 ) ) ( CLEAR ?auto_149368 ) ( ON ?auto_149369 ?auto_149370 ) ( CLEAR ?auto_149369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149372 ) ( ON ?auto_149373 ?auto_149372 ) ( ON ?auto_149371 ?auto_149373 ) ( not ( = ?auto_149372 ?auto_149373 ) ) ( not ( = ?auto_149372 ?auto_149371 ) ) ( not ( = ?auto_149372 ?auto_149370 ) ) ( not ( = ?auto_149372 ?auto_149369 ) ) ( not ( = ?auto_149373 ?auto_149371 ) ) ( not ( = ?auto_149373 ?auto_149370 ) ) ( not ( = ?auto_149373 ?auto_149369 ) ) ( not ( = ?auto_149366 ?auto_149372 ) ) ( not ( = ?auto_149366 ?auto_149373 ) ) ( not ( = ?auto_149367 ?auto_149372 ) ) ( not ( = ?auto_149367 ?auto_149373 ) ) ( not ( = ?auto_149368 ?auto_149372 ) ) ( not ( = ?auto_149368 ?auto_149373 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149372 ?auto_149373 ?auto_149371 ?auto_149370 )
      ( MAKE-5PILE ?auto_149366 ?auto_149367 ?auto_149368 ?auto_149369 ?auto_149370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149374 - BLOCK
      ?auto_149375 - BLOCK
      ?auto_149376 - BLOCK
      ?auto_149377 - BLOCK
      ?auto_149378 - BLOCK
    )
    :vars
    (
      ?auto_149381 - BLOCK
      ?auto_149380 - BLOCK
      ?auto_149379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149374 ) ( ON ?auto_149375 ?auto_149374 ) ( not ( = ?auto_149374 ?auto_149375 ) ) ( not ( = ?auto_149374 ?auto_149376 ) ) ( not ( = ?auto_149374 ?auto_149377 ) ) ( not ( = ?auto_149374 ?auto_149378 ) ) ( not ( = ?auto_149375 ?auto_149376 ) ) ( not ( = ?auto_149375 ?auto_149377 ) ) ( not ( = ?auto_149375 ?auto_149378 ) ) ( not ( = ?auto_149376 ?auto_149377 ) ) ( not ( = ?auto_149376 ?auto_149378 ) ) ( not ( = ?auto_149377 ?auto_149378 ) ) ( ON ?auto_149378 ?auto_149381 ) ( not ( = ?auto_149374 ?auto_149381 ) ) ( not ( = ?auto_149375 ?auto_149381 ) ) ( not ( = ?auto_149376 ?auto_149381 ) ) ( not ( = ?auto_149377 ?auto_149381 ) ) ( not ( = ?auto_149378 ?auto_149381 ) ) ( ON ?auto_149377 ?auto_149378 ) ( CLEAR ?auto_149377 ) ( ON-TABLE ?auto_149380 ) ( ON ?auto_149379 ?auto_149380 ) ( ON ?auto_149381 ?auto_149379 ) ( not ( = ?auto_149380 ?auto_149379 ) ) ( not ( = ?auto_149380 ?auto_149381 ) ) ( not ( = ?auto_149380 ?auto_149378 ) ) ( not ( = ?auto_149380 ?auto_149377 ) ) ( not ( = ?auto_149379 ?auto_149381 ) ) ( not ( = ?auto_149379 ?auto_149378 ) ) ( not ( = ?auto_149379 ?auto_149377 ) ) ( not ( = ?auto_149374 ?auto_149380 ) ) ( not ( = ?auto_149374 ?auto_149379 ) ) ( not ( = ?auto_149375 ?auto_149380 ) ) ( not ( = ?auto_149375 ?auto_149379 ) ) ( not ( = ?auto_149376 ?auto_149380 ) ) ( not ( = ?auto_149376 ?auto_149379 ) ) ( HOLDING ?auto_149376 ) ( CLEAR ?auto_149375 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149374 ?auto_149375 ?auto_149376 )
      ( MAKE-5PILE ?auto_149374 ?auto_149375 ?auto_149376 ?auto_149377 ?auto_149378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149382 - BLOCK
      ?auto_149383 - BLOCK
      ?auto_149384 - BLOCK
      ?auto_149385 - BLOCK
      ?auto_149386 - BLOCK
    )
    :vars
    (
      ?auto_149387 - BLOCK
      ?auto_149388 - BLOCK
      ?auto_149389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149382 ) ( ON ?auto_149383 ?auto_149382 ) ( not ( = ?auto_149382 ?auto_149383 ) ) ( not ( = ?auto_149382 ?auto_149384 ) ) ( not ( = ?auto_149382 ?auto_149385 ) ) ( not ( = ?auto_149382 ?auto_149386 ) ) ( not ( = ?auto_149383 ?auto_149384 ) ) ( not ( = ?auto_149383 ?auto_149385 ) ) ( not ( = ?auto_149383 ?auto_149386 ) ) ( not ( = ?auto_149384 ?auto_149385 ) ) ( not ( = ?auto_149384 ?auto_149386 ) ) ( not ( = ?auto_149385 ?auto_149386 ) ) ( ON ?auto_149386 ?auto_149387 ) ( not ( = ?auto_149382 ?auto_149387 ) ) ( not ( = ?auto_149383 ?auto_149387 ) ) ( not ( = ?auto_149384 ?auto_149387 ) ) ( not ( = ?auto_149385 ?auto_149387 ) ) ( not ( = ?auto_149386 ?auto_149387 ) ) ( ON ?auto_149385 ?auto_149386 ) ( ON-TABLE ?auto_149388 ) ( ON ?auto_149389 ?auto_149388 ) ( ON ?auto_149387 ?auto_149389 ) ( not ( = ?auto_149388 ?auto_149389 ) ) ( not ( = ?auto_149388 ?auto_149387 ) ) ( not ( = ?auto_149388 ?auto_149386 ) ) ( not ( = ?auto_149388 ?auto_149385 ) ) ( not ( = ?auto_149389 ?auto_149387 ) ) ( not ( = ?auto_149389 ?auto_149386 ) ) ( not ( = ?auto_149389 ?auto_149385 ) ) ( not ( = ?auto_149382 ?auto_149388 ) ) ( not ( = ?auto_149382 ?auto_149389 ) ) ( not ( = ?auto_149383 ?auto_149388 ) ) ( not ( = ?auto_149383 ?auto_149389 ) ) ( not ( = ?auto_149384 ?auto_149388 ) ) ( not ( = ?auto_149384 ?auto_149389 ) ) ( CLEAR ?auto_149383 ) ( ON ?auto_149384 ?auto_149385 ) ( CLEAR ?auto_149384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149388 ?auto_149389 ?auto_149387 ?auto_149386 ?auto_149385 )
      ( MAKE-5PILE ?auto_149382 ?auto_149383 ?auto_149384 ?auto_149385 ?auto_149386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149390 - BLOCK
      ?auto_149391 - BLOCK
      ?auto_149392 - BLOCK
      ?auto_149393 - BLOCK
      ?auto_149394 - BLOCK
    )
    :vars
    (
      ?auto_149395 - BLOCK
      ?auto_149396 - BLOCK
      ?auto_149397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149390 ) ( not ( = ?auto_149390 ?auto_149391 ) ) ( not ( = ?auto_149390 ?auto_149392 ) ) ( not ( = ?auto_149390 ?auto_149393 ) ) ( not ( = ?auto_149390 ?auto_149394 ) ) ( not ( = ?auto_149391 ?auto_149392 ) ) ( not ( = ?auto_149391 ?auto_149393 ) ) ( not ( = ?auto_149391 ?auto_149394 ) ) ( not ( = ?auto_149392 ?auto_149393 ) ) ( not ( = ?auto_149392 ?auto_149394 ) ) ( not ( = ?auto_149393 ?auto_149394 ) ) ( ON ?auto_149394 ?auto_149395 ) ( not ( = ?auto_149390 ?auto_149395 ) ) ( not ( = ?auto_149391 ?auto_149395 ) ) ( not ( = ?auto_149392 ?auto_149395 ) ) ( not ( = ?auto_149393 ?auto_149395 ) ) ( not ( = ?auto_149394 ?auto_149395 ) ) ( ON ?auto_149393 ?auto_149394 ) ( ON-TABLE ?auto_149396 ) ( ON ?auto_149397 ?auto_149396 ) ( ON ?auto_149395 ?auto_149397 ) ( not ( = ?auto_149396 ?auto_149397 ) ) ( not ( = ?auto_149396 ?auto_149395 ) ) ( not ( = ?auto_149396 ?auto_149394 ) ) ( not ( = ?auto_149396 ?auto_149393 ) ) ( not ( = ?auto_149397 ?auto_149395 ) ) ( not ( = ?auto_149397 ?auto_149394 ) ) ( not ( = ?auto_149397 ?auto_149393 ) ) ( not ( = ?auto_149390 ?auto_149396 ) ) ( not ( = ?auto_149390 ?auto_149397 ) ) ( not ( = ?auto_149391 ?auto_149396 ) ) ( not ( = ?auto_149391 ?auto_149397 ) ) ( not ( = ?auto_149392 ?auto_149396 ) ) ( not ( = ?auto_149392 ?auto_149397 ) ) ( ON ?auto_149392 ?auto_149393 ) ( CLEAR ?auto_149392 ) ( HOLDING ?auto_149391 ) ( CLEAR ?auto_149390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149390 ?auto_149391 )
      ( MAKE-5PILE ?auto_149390 ?auto_149391 ?auto_149392 ?auto_149393 ?auto_149394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149398 - BLOCK
      ?auto_149399 - BLOCK
      ?auto_149400 - BLOCK
      ?auto_149401 - BLOCK
      ?auto_149402 - BLOCK
    )
    :vars
    (
      ?auto_149403 - BLOCK
      ?auto_149404 - BLOCK
      ?auto_149405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149398 ) ( not ( = ?auto_149398 ?auto_149399 ) ) ( not ( = ?auto_149398 ?auto_149400 ) ) ( not ( = ?auto_149398 ?auto_149401 ) ) ( not ( = ?auto_149398 ?auto_149402 ) ) ( not ( = ?auto_149399 ?auto_149400 ) ) ( not ( = ?auto_149399 ?auto_149401 ) ) ( not ( = ?auto_149399 ?auto_149402 ) ) ( not ( = ?auto_149400 ?auto_149401 ) ) ( not ( = ?auto_149400 ?auto_149402 ) ) ( not ( = ?auto_149401 ?auto_149402 ) ) ( ON ?auto_149402 ?auto_149403 ) ( not ( = ?auto_149398 ?auto_149403 ) ) ( not ( = ?auto_149399 ?auto_149403 ) ) ( not ( = ?auto_149400 ?auto_149403 ) ) ( not ( = ?auto_149401 ?auto_149403 ) ) ( not ( = ?auto_149402 ?auto_149403 ) ) ( ON ?auto_149401 ?auto_149402 ) ( ON-TABLE ?auto_149404 ) ( ON ?auto_149405 ?auto_149404 ) ( ON ?auto_149403 ?auto_149405 ) ( not ( = ?auto_149404 ?auto_149405 ) ) ( not ( = ?auto_149404 ?auto_149403 ) ) ( not ( = ?auto_149404 ?auto_149402 ) ) ( not ( = ?auto_149404 ?auto_149401 ) ) ( not ( = ?auto_149405 ?auto_149403 ) ) ( not ( = ?auto_149405 ?auto_149402 ) ) ( not ( = ?auto_149405 ?auto_149401 ) ) ( not ( = ?auto_149398 ?auto_149404 ) ) ( not ( = ?auto_149398 ?auto_149405 ) ) ( not ( = ?auto_149399 ?auto_149404 ) ) ( not ( = ?auto_149399 ?auto_149405 ) ) ( not ( = ?auto_149400 ?auto_149404 ) ) ( not ( = ?auto_149400 ?auto_149405 ) ) ( ON ?auto_149400 ?auto_149401 ) ( CLEAR ?auto_149398 ) ( ON ?auto_149399 ?auto_149400 ) ( CLEAR ?auto_149399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149404 ?auto_149405 ?auto_149403 ?auto_149402 ?auto_149401 ?auto_149400 )
      ( MAKE-5PILE ?auto_149398 ?auto_149399 ?auto_149400 ?auto_149401 ?auto_149402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149406 - BLOCK
      ?auto_149407 - BLOCK
      ?auto_149408 - BLOCK
      ?auto_149409 - BLOCK
      ?auto_149410 - BLOCK
    )
    :vars
    (
      ?auto_149413 - BLOCK
      ?auto_149412 - BLOCK
      ?auto_149411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149406 ?auto_149407 ) ) ( not ( = ?auto_149406 ?auto_149408 ) ) ( not ( = ?auto_149406 ?auto_149409 ) ) ( not ( = ?auto_149406 ?auto_149410 ) ) ( not ( = ?auto_149407 ?auto_149408 ) ) ( not ( = ?auto_149407 ?auto_149409 ) ) ( not ( = ?auto_149407 ?auto_149410 ) ) ( not ( = ?auto_149408 ?auto_149409 ) ) ( not ( = ?auto_149408 ?auto_149410 ) ) ( not ( = ?auto_149409 ?auto_149410 ) ) ( ON ?auto_149410 ?auto_149413 ) ( not ( = ?auto_149406 ?auto_149413 ) ) ( not ( = ?auto_149407 ?auto_149413 ) ) ( not ( = ?auto_149408 ?auto_149413 ) ) ( not ( = ?auto_149409 ?auto_149413 ) ) ( not ( = ?auto_149410 ?auto_149413 ) ) ( ON ?auto_149409 ?auto_149410 ) ( ON-TABLE ?auto_149412 ) ( ON ?auto_149411 ?auto_149412 ) ( ON ?auto_149413 ?auto_149411 ) ( not ( = ?auto_149412 ?auto_149411 ) ) ( not ( = ?auto_149412 ?auto_149413 ) ) ( not ( = ?auto_149412 ?auto_149410 ) ) ( not ( = ?auto_149412 ?auto_149409 ) ) ( not ( = ?auto_149411 ?auto_149413 ) ) ( not ( = ?auto_149411 ?auto_149410 ) ) ( not ( = ?auto_149411 ?auto_149409 ) ) ( not ( = ?auto_149406 ?auto_149412 ) ) ( not ( = ?auto_149406 ?auto_149411 ) ) ( not ( = ?auto_149407 ?auto_149412 ) ) ( not ( = ?auto_149407 ?auto_149411 ) ) ( not ( = ?auto_149408 ?auto_149412 ) ) ( not ( = ?auto_149408 ?auto_149411 ) ) ( ON ?auto_149408 ?auto_149409 ) ( ON ?auto_149407 ?auto_149408 ) ( CLEAR ?auto_149407 ) ( HOLDING ?auto_149406 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149406 )
      ( MAKE-5PILE ?auto_149406 ?auto_149407 ?auto_149408 ?auto_149409 ?auto_149410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149414 - BLOCK
      ?auto_149415 - BLOCK
      ?auto_149416 - BLOCK
      ?auto_149417 - BLOCK
      ?auto_149418 - BLOCK
    )
    :vars
    (
      ?auto_149421 - BLOCK
      ?auto_149419 - BLOCK
      ?auto_149420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149414 ?auto_149415 ) ) ( not ( = ?auto_149414 ?auto_149416 ) ) ( not ( = ?auto_149414 ?auto_149417 ) ) ( not ( = ?auto_149414 ?auto_149418 ) ) ( not ( = ?auto_149415 ?auto_149416 ) ) ( not ( = ?auto_149415 ?auto_149417 ) ) ( not ( = ?auto_149415 ?auto_149418 ) ) ( not ( = ?auto_149416 ?auto_149417 ) ) ( not ( = ?auto_149416 ?auto_149418 ) ) ( not ( = ?auto_149417 ?auto_149418 ) ) ( ON ?auto_149418 ?auto_149421 ) ( not ( = ?auto_149414 ?auto_149421 ) ) ( not ( = ?auto_149415 ?auto_149421 ) ) ( not ( = ?auto_149416 ?auto_149421 ) ) ( not ( = ?auto_149417 ?auto_149421 ) ) ( not ( = ?auto_149418 ?auto_149421 ) ) ( ON ?auto_149417 ?auto_149418 ) ( ON-TABLE ?auto_149419 ) ( ON ?auto_149420 ?auto_149419 ) ( ON ?auto_149421 ?auto_149420 ) ( not ( = ?auto_149419 ?auto_149420 ) ) ( not ( = ?auto_149419 ?auto_149421 ) ) ( not ( = ?auto_149419 ?auto_149418 ) ) ( not ( = ?auto_149419 ?auto_149417 ) ) ( not ( = ?auto_149420 ?auto_149421 ) ) ( not ( = ?auto_149420 ?auto_149418 ) ) ( not ( = ?auto_149420 ?auto_149417 ) ) ( not ( = ?auto_149414 ?auto_149419 ) ) ( not ( = ?auto_149414 ?auto_149420 ) ) ( not ( = ?auto_149415 ?auto_149419 ) ) ( not ( = ?auto_149415 ?auto_149420 ) ) ( not ( = ?auto_149416 ?auto_149419 ) ) ( not ( = ?auto_149416 ?auto_149420 ) ) ( ON ?auto_149416 ?auto_149417 ) ( ON ?auto_149415 ?auto_149416 ) ( ON ?auto_149414 ?auto_149415 ) ( CLEAR ?auto_149414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149419 ?auto_149420 ?auto_149421 ?auto_149418 ?auto_149417 ?auto_149416 ?auto_149415 )
      ( MAKE-5PILE ?auto_149414 ?auto_149415 ?auto_149416 ?auto_149417 ?auto_149418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149427 - BLOCK
      ?auto_149428 - BLOCK
      ?auto_149429 - BLOCK
      ?auto_149430 - BLOCK
      ?auto_149431 - BLOCK
    )
    :vars
    (
      ?auto_149432 - BLOCK
      ?auto_149433 - BLOCK
      ?auto_149434 - BLOCK
      ?auto_149435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149427 ?auto_149428 ) ) ( not ( = ?auto_149427 ?auto_149429 ) ) ( not ( = ?auto_149427 ?auto_149430 ) ) ( not ( = ?auto_149427 ?auto_149431 ) ) ( not ( = ?auto_149428 ?auto_149429 ) ) ( not ( = ?auto_149428 ?auto_149430 ) ) ( not ( = ?auto_149428 ?auto_149431 ) ) ( not ( = ?auto_149429 ?auto_149430 ) ) ( not ( = ?auto_149429 ?auto_149431 ) ) ( not ( = ?auto_149430 ?auto_149431 ) ) ( ON ?auto_149431 ?auto_149432 ) ( not ( = ?auto_149427 ?auto_149432 ) ) ( not ( = ?auto_149428 ?auto_149432 ) ) ( not ( = ?auto_149429 ?auto_149432 ) ) ( not ( = ?auto_149430 ?auto_149432 ) ) ( not ( = ?auto_149431 ?auto_149432 ) ) ( ON ?auto_149430 ?auto_149431 ) ( ON-TABLE ?auto_149433 ) ( ON ?auto_149434 ?auto_149433 ) ( ON ?auto_149432 ?auto_149434 ) ( not ( = ?auto_149433 ?auto_149434 ) ) ( not ( = ?auto_149433 ?auto_149432 ) ) ( not ( = ?auto_149433 ?auto_149431 ) ) ( not ( = ?auto_149433 ?auto_149430 ) ) ( not ( = ?auto_149434 ?auto_149432 ) ) ( not ( = ?auto_149434 ?auto_149431 ) ) ( not ( = ?auto_149434 ?auto_149430 ) ) ( not ( = ?auto_149427 ?auto_149433 ) ) ( not ( = ?auto_149427 ?auto_149434 ) ) ( not ( = ?auto_149428 ?auto_149433 ) ) ( not ( = ?auto_149428 ?auto_149434 ) ) ( not ( = ?auto_149429 ?auto_149433 ) ) ( not ( = ?auto_149429 ?auto_149434 ) ) ( ON ?auto_149429 ?auto_149430 ) ( ON ?auto_149428 ?auto_149429 ) ( CLEAR ?auto_149428 ) ( ON ?auto_149427 ?auto_149435 ) ( CLEAR ?auto_149427 ) ( HAND-EMPTY ) ( not ( = ?auto_149427 ?auto_149435 ) ) ( not ( = ?auto_149428 ?auto_149435 ) ) ( not ( = ?auto_149429 ?auto_149435 ) ) ( not ( = ?auto_149430 ?auto_149435 ) ) ( not ( = ?auto_149431 ?auto_149435 ) ) ( not ( = ?auto_149432 ?auto_149435 ) ) ( not ( = ?auto_149433 ?auto_149435 ) ) ( not ( = ?auto_149434 ?auto_149435 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149427 ?auto_149435 )
      ( MAKE-5PILE ?auto_149427 ?auto_149428 ?auto_149429 ?auto_149430 ?auto_149431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149436 - BLOCK
      ?auto_149437 - BLOCK
      ?auto_149438 - BLOCK
      ?auto_149439 - BLOCK
      ?auto_149440 - BLOCK
    )
    :vars
    (
      ?auto_149443 - BLOCK
      ?auto_149441 - BLOCK
      ?auto_149442 - BLOCK
      ?auto_149444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149436 ?auto_149437 ) ) ( not ( = ?auto_149436 ?auto_149438 ) ) ( not ( = ?auto_149436 ?auto_149439 ) ) ( not ( = ?auto_149436 ?auto_149440 ) ) ( not ( = ?auto_149437 ?auto_149438 ) ) ( not ( = ?auto_149437 ?auto_149439 ) ) ( not ( = ?auto_149437 ?auto_149440 ) ) ( not ( = ?auto_149438 ?auto_149439 ) ) ( not ( = ?auto_149438 ?auto_149440 ) ) ( not ( = ?auto_149439 ?auto_149440 ) ) ( ON ?auto_149440 ?auto_149443 ) ( not ( = ?auto_149436 ?auto_149443 ) ) ( not ( = ?auto_149437 ?auto_149443 ) ) ( not ( = ?auto_149438 ?auto_149443 ) ) ( not ( = ?auto_149439 ?auto_149443 ) ) ( not ( = ?auto_149440 ?auto_149443 ) ) ( ON ?auto_149439 ?auto_149440 ) ( ON-TABLE ?auto_149441 ) ( ON ?auto_149442 ?auto_149441 ) ( ON ?auto_149443 ?auto_149442 ) ( not ( = ?auto_149441 ?auto_149442 ) ) ( not ( = ?auto_149441 ?auto_149443 ) ) ( not ( = ?auto_149441 ?auto_149440 ) ) ( not ( = ?auto_149441 ?auto_149439 ) ) ( not ( = ?auto_149442 ?auto_149443 ) ) ( not ( = ?auto_149442 ?auto_149440 ) ) ( not ( = ?auto_149442 ?auto_149439 ) ) ( not ( = ?auto_149436 ?auto_149441 ) ) ( not ( = ?auto_149436 ?auto_149442 ) ) ( not ( = ?auto_149437 ?auto_149441 ) ) ( not ( = ?auto_149437 ?auto_149442 ) ) ( not ( = ?auto_149438 ?auto_149441 ) ) ( not ( = ?auto_149438 ?auto_149442 ) ) ( ON ?auto_149438 ?auto_149439 ) ( ON ?auto_149436 ?auto_149444 ) ( CLEAR ?auto_149436 ) ( not ( = ?auto_149436 ?auto_149444 ) ) ( not ( = ?auto_149437 ?auto_149444 ) ) ( not ( = ?auto_149438 ?auto_149444 ) ) ( not ( = ?auto_149439 ?auto_149444 ) ) ( not ( = ?auto_149440 ?auto_149444 ) ) ( not ( = ?auto_149443 ?auto_149444 ) ) ( not ( = ?auto_149441 ?auto_149444 ) ) ( not ( = ?auto_149442 ?auto_149444 ) ) ( HOLDING ?auto_149437 ) ( CLEAR ?auto_149438 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149441 ?auto_149442 ?auto_149443 ?auto_149440 ?auto_149439 ?auto_149438 ?auto_149437 )
      ( MAKE-5PILE ?auto_149436 ?auto_149437 ?auto_149438 ?auto_149439 ?auto_149440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149445 - BLOCK
      ?auto_149446 - BLOCK
      ?auto_149447 - BLOCK
      ?auto_149448 - BLOCK
      ?auto_149449 - BLOCK
    )
    :vars
    (
      ?auto_149450 - BLOCK
      ?auto_149451 - BLOCK
      ?auto_149452 - BLOCK
      ?auto_149453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149445 ?auto_149446 ) ) ( not ( = ?auto_149445 ?auto_149447 ) ) ( not ( = ?auto_149445 ?auto_149448 ) ) ( not ( = ?auto_149445 ?auto_149449 ) ) ( not ( = ?auto_149446 ?auto_149447 ) ) ( not ( = ?auto_149446 ?auto_149448 ) ) ( not ( = ?auto_149446 ?auto_149449 ) ) ( not ( = ?auto_149447 ?auto_149448 ) ) ( not ( = ?auto_149447 ?auto_149449 ) ) ( not ( = ?auto_149448 ?auto_149449 ) ) ( ON ?auto_149449 ?auto_149450 ) ( not ( = ?auto_149445 ?auto_149450 ) ) ( not ( = ?auto_149446 ?auto_149450 ) ) ( not ( = ?auto_149447 ?auto_149450 ) ) ( not ( = ?auto_149448 ?auto_149450 ) ) ( not ( = ?auto_149449 ?auto_149450 ) ) ( ON ?auto_149448 ?auto_149449 ) ( ON-TABLE ?auto_149451 ) ( ON ?auto_149452 ?auto_149451 ) ( ON ?auto_149450 ?auto_149452 ) ( not ( = ?auto_149451 ?auto_149452 ) ) ( not ( = ?auto_149451 ?auto_149450 ) ) ( not ( = ?auto_149451 ?auto_149449 ) ) ( not ( = ?auto_149451 ?auto_149448 ) ) ( not ( = ?auto_149452 ?auto_149450 ) ) ( not ( = ?auto_149452 ?auto_149449 ) ) ( not ( = ?auto_149452 ?auto_149448 ) ) ( not ( = ?auto_149445 ?auto_149451 ) ) ( not ( = ?auto_149445 ?auto_149452 ) ) ( not ( = ?auto_149446 ?auto_149451 ) ) ( not ( = ?auto_149446 ?auto_149452 ) ) ( not ( = ?auto_149447 ?auto_149451 ) ) ( not ( = ?auto_149447 ?auto_149452 ) ) ( ON ?auto_149447 ?auto_149448 ) ( ON ?auto_149445 ?auto_149453 ) ( not ( = ?auto_149445 ?auto_149453 ) ) ( not ( = ?auto_149446 ?auto_149453 ) ) ( not ( = ?auto_149447 ?auto_149453 ) ) ( not ( = ?auto_149448 ?auto_149453 ) ) ( not ( = ?auto_149449 ?auto_149453 ) ) ( not ( = ?auto_149450 ?auto_149453 ) ) ( not ( = ?auto_149451 ?auto_149453 ) ) ( not ( = ?auto_149452 ?auto_149453 ) ) ( CLEAR ?auto_149447 ) ( ON ?auto_149446 ?auto_149445 ) ( CLEAR ?auto_149446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149453 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149453 ?auto_149445 )
      ( MAKE-5PILE ?auto_149445 ?auto_149446 ?auto_149447 ?auto_149448 ?auto_149449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149454 - BLOCK
      ?auto_149455 - BLOCK
      ?auto_149456 - BLOCK
      ?auto_149457 - BLOCK
      ?auto_149458 - BLOCK
    )
    :vars
    (
      ?auto_149459 - BLOCK
      ?auto_149462 - BLOCK
      ?auto_149460 - BLOCK
      ?auto_149461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149454 ?auto_149455 ) ) ( not ( = ?auto_149454 ?auto_149456 ) ) ( not ( = ?auto_149454 ?auto_149457 ) ) ( not ( = ?auto_149454 ?auto_149458 ) ) ( not ( = ?auto_149455 ?auto_149456 ) ) ( not ( = ?auto_149455 ?auto_149457 ) ) ( not ( = ?auto_149455 ?auto_149458 ) ) ( not ( = ?auto_149456 ?auto_149457 ) ) ( not ( = ?auto_149456 ?auto_149458 ) ) ( not ( = ?auto_149457 ?auto_149458 ) ) ( ON ?auto_149458 ?auto_149459 ) ( not ( = ?auto_149454 ?auto_149459 ) ) ( not ( = ?auto_149455 ?auto_149459 ) ) ( not ( = ?auto_149456 ?auto_149459 ) ) ( not ( = ?auto_149457 ?auto_149459 ) ) ( not ( = ?auto_149458 ?auto_149459 ) ) ( ON ?auto_149457 ?auto_149458 ) ( ON-TABLE ?auto_149462 ) ( ON ?auto_149460 ?auto_149462 ) ( ON ?auto_149459 ?auto_149460 ) ( not ( = ?auto_149462 ?auto_149460 ) ) ( not ( = ?auto_149462 ?auto_149459 ) ) ( not ( = ?auto_149462 ?auto_149458 ) ) ( not ( = ?auto_149462 ?auto_149457 ) ) ( not ( = ?auto_149460 ?auto_149459 ) ) ( not ( = ?auto_149460 ?auto_149458 ) ) ( not ( = ?auto_149460 ?auto_149457 ) ) ( not ( = ?auto_149454 ?auto_149462 ) ) ( not ( = ?auto_149454 ?auto_149460 ) ) ( not ( = ?auto_149455 ?auto_149462 ) ) ( not ( = ?auto_149455 ?auto_149460 ) ) ( not ( = ?auto_149456 ?auto_149462 ) ) ( not ( = ?auto_149456 ?auto_149460 ) ) ( ON ?auto_149454 ?auto_149461 ) ( not ( = ?auto_149454 ?auto_149461 ) ) ( not ( = ?auto_149455 ?auto_149461 ) ) ( not ( = ?auto_149456 ?auto_149461 ) ) ( not ( = ?auto_149457 ?auto_149461 ) ) ( not ( = ?auto_149458 ?auto_149461 ) ) ( not ( = ?auto_149459 ?auto_149461 ) ) ( not ( = ?auto_149462 ?auto_149461 ) ) ( not ( = ?auto_149460 ?auto_149461 ) ) ( ON ?auto_149455 ?auto_149454 ) ( CLEAR ?auto_149455 ) ( ON-TABLE ?auto_149461 ) ( HOLDING ?auto_149456 ) ( CLEAR ?auto_149457 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149462 ?auto_149460 ?auto_149459 ?auto_149458 ?auto_149457 ?auto_149456 )
      ( MAKE-5PILE ?auto_149454 ?auto_149455 ?auto_149456 ?auto_149457 ?auto_149458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149463 - BLOCK
      ?auto_149464 - BLOCK
      ?auto_149465 - BLOCK
      ?auto_149466 - BLOCK
      ?auto_149467 - BLOCK
    )
    :vars
    (
      ?auto_149469 - BLOCK
      ?auto_149468 - BLOCK
      ?auto_149470 - BLOCK
      ?auto_149471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149463 ?auto_149464 ) ) ( not ( = ?auto_149463 ?auto_149465 ) ) ( not ( = ?auto_149463 ?auto_149466 ) ) ( not ( = ?auto_149463 ?auto_149467 ) ) ( not ( = ?auto_149464 ?auto_149465 ) ) ( not ( = ?auto_149464 ?auto_149466 ) ) ( not ( = ?auto_149464 ?auto_149467 ) ) ( not ( = ?auto_149465 ?auto_149466 ) ) ( not ( = ?auto_149465 ?auto_149467 ) ) ( not ( = ?auto_149466 ?auto_149467 ) ) ( ON ?auto_149467 ?auto_149469 ) ( not ( = ?auto_149463 ?auto_149469 ) ) ( not ( = ?auto_149464 ?auto_149469 ) ) ( not ( = ?auto_149465 ?auto_149469 ) ) ( not ( = ?auto_149466 ?auto_149469 ) ) ( not ( = ?auto_149467 ?auto_149469 ) ) ( ON ?auto_149466 ?auto_149467 ) ( ON-TABLE ?auto_149468 ) ( ON ?auto_149470 ?auto_149468 ) ( ON ?auto_149469 ?auto_149470 ) ( not ( = ?auto_149468 ?auto_149470 ) ) ( not ( = ?auto_149468 ?auto_149469 ) ) ( not ( = ?auto_149468 ?auto_149467 ) ) ( not ( = ?auto_149468 ?auto_149466 ) ) ( not ( = ?auto_149470 ?auto_149469 ) ) ( not ( = ?auto_149470 ?auto_149467 ) ) ( not ( = ?auto_149470 ?auto_149466 ) ) ( not ( = ?auto_149463 ?auto_149468 ) ) ( not ( = ?auto_149463 ?auto_149470 ) ) ( not ( = ?auto_149464 ?auto_149468 ) ) ( not ( = ?auto_149464 ?auto_149470 ) ) ( not ( = ?auto_149465 ?auto_149468 ) ) ( not ( = ?auto_149465 ?auto_149470 ) ) ( ON ?auto_149463 ?auto_149471 ) ( not ( = ?auto_149463 ?auto_149471 ) ) ( not ( = ?auto_149464 ?auto_149471 ) ) ( not ( = ?auto_149465 ?auto_149471 ) ) ( not ( = ?auto_149466 ?auto_149471 ) ) ( not ( = ?auto_149467 ?auto_149471 ) ) ( not ( = ?auto_149469 ?auto_149471 ) ) ( not ( = ?auto_149468 ?auto_149471 ) ) ( not ( = ?auto_149470 ?auto_149471 ) ) ( ON ?auto_149464 ?auto_149463 ) ( ON-TABLE ?auto_149471 ) ( CLEAR ?auto_149466 ) ( ON ?auto_149465 ?auto_149464 ) ( CLEAR ?auto_149465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149471 ?auto_149463 ?auto_149464 )
      ( MAKE-5PILE ?auto_149463 ?auto_149464 ?auto_149465 ?auto_149466 ?auto_149467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149472 - BLOCK
      ?auto_149473 - BLOCK
      ?auto_149474 - BLOCK
      ?auto_149475 - BLOCK
      ?auto_149476 - BLOCK
    )
    :vars
    (
      ?auto_149480 - BLOCK
      ?auto_149479 - BLOCK
      ?auto_149478 - BLOCK
      ?auto_149477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149472 ?auto_149473 ) ) ( not ( = ?auto_149472 ?auto_149474 ) ) ( not ( = ?auto_149472 ?auto_149475 ) ) ( not ( = ?auto_149472 ?auto_149476 ) ) ( not ( = ?auto_149473 ?auto_149474 ) ) ( not ( = ?auto_149473 ?auto_149475 ) ) ( not ( = ?auto_149473 ?auto_149476 ) ) ( not ( = ?auto_149474 ?auto_149475 ) ) ( not ( = ?auto_149474 ?auto_149476 ) ) ( not ( = ?auto_149475 ?auto_149476 ) ) ( ON ?auto_149476 ?auto_149480 ) ( not ( = ?auto_149472 ?auto_149480 ) ) ( not ( = ?auto_149473 ?auto_149480 ) ) ( not ( = ?auto_149474 ?auto_149480 ) ) ( not ( = ?auto_149475 ?auto_149480 ) ) ( not ( = ?auto_149476 ?auto_149480 ) ) ( ON-TABLE ?auto_149479 ) ( ON ?auto_149478 ?auto_149479 ) ( ON ?auto_149480 ?auto_149478 ) ( not ( = ?auto_149479 ?auto_149478 ) ) ( not ( = ?auto_149479 ?auto_149480 ) ) ( not ( = ?auto_149479 ?auto_149476 ) ) ( not ( = ?auto_149479 ?auto_149475 ) ) ( not ( = ?auto_149478 ?auto_149480 ) ) ( not ( = ?auto_149478 ?auto_149476 ) ) ( not ( = ?auto_149478 ?auto_149475 ) ) ( not ( = ?auto_149472 ?auto_149479 ) ) ( not ( = ?auto_149472 ?auto_149478 ) ) ( not ( = ?auto_149473 ?auto_149479 ) ) ( not ( = ?auto_149473 ?auto_149478 ) ) ( not ( = ?auto_149474 ?auto_149479 ) ) ( not ( = ?auto_149474 ?auto_149478 ) ) ( ON ?auto_149472 ?auto_149477 ) ( not ( = ?auto_149472 ?auto_149477 ) ) ( not ( = ?auto_149473 ?auto_149477 ) ) ( not ( = ?auto_149474 ?auto_149477 ) ) ( not ( = ?auto_149475 ?auto_149477 ) ) ( not ( = ?auto_149476 ?auto_149477 ) ) ( not ( = ?auto_149480 ?auto_149477 ) ) ( not ( = ?auto_149479 ?auto_149477 ) ) ( not ( = ?auto_149478 ?auto_149477 ) ) ( ON ?auto_149473 ?auto_149472 ) ( ON-TABLE ?auto_149477 ) ( ON ?auto_149474 ?auto_149473 ) ( CLEAR ?auto_149474 ) ( HOLDING ?auto_149475 ) ( CLEAR ?auto_149476 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149479 ?auto_149478 ?auto_149480 ?auto_149476 ?auto_149475 )
      ( MAKE-5PILE ?auto_149472 ?auto_149473 ?auto_149474 ?auto_149475 ?auto_149476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149481 - BLOCK
      ?auto_149482 - BLOCK
      ?auto_149483 - BLOCK
      ?auto_149484 - BLOCK
      ?auto_149485 - BLOCK
    )
    :vars
    (
      ?auto_149487 - BLOCK
      ?auto_149488 - BLOCK
      ?auto_149486 - BLOCK
      ?auto_149489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149481 ?auto_149482 ) ) ( not ( = ?auto_149481 ?auto_149483 ) ) ( not ( = ?auto_149481 ?auto_149484 ) ) ( not ( = ?auto_149481 ?auto_149485 ) ) ( not ( = ?auto_149482 ?auto_149483 ) ) ( not ( = ?auto_149482 ?auto_149484 ) ) ( not ( = ?auto_149482 ?auto_149485 ) ) ( not ( = ?auto_149483 ?auto_149484 ) ) ( not ( = ?auto_149483 ?auto_149485 ) ) ( not ( = ?auto_149484 ?auto_149485 ) ) ( ON ?auto_149485 ?auto_149487 ) ( not ( = ?auto_149481 ?auto_149487 ) ) ( not ( = ?auto_149482 ?auto_149487 ) ) ( not ( = ?auto_149483 ?auto_149487 ) ) ( not ( = ?auto_149484 ?auto_149487 ) ) ( not ( = ?auto_149485 ?auto_149487 ) ) ( ON-TABLE ?auto_149488 ) ( ON ?auto_149486 ?auto_149488 ) ( ON ?auto_149487 ?auto_149486 ) ( not ( = ?auto_149488 ?auto_149486 ) ) ( not ( = ?auto_149488 ?auto_149487 ) ) ( not ( = ?auto_149488 ?auto_149485 ) ) ( not ( = ?auto_149488 ?auto_149484 ) ) ( not ( = ?auto_149486 ?auto_149487 ) ) ( not ( = ?auto_149486 ?auto_149485 ) ) ( not ( = ?auto_149486 ?auto_149484 ) ) ( not ( = ?auto_149481 ?auto_149488 ) ) ( not ( = ?auto_149481 ?auto_149486 ) ) ( not ( = ?auto_149482 ?auto_149488 ) ) ( not ( = ?auto_149482 ?auto_149486 ) ) ( not ( = ?auto_149483 ?auto_149488 ) ) ( not ( = ?auto_149483 ?auto_149486 ) ) ( ON ?auto_149481 ?auto_149489 ) ( not ( = ?auto_149481 ?auto_149489 ) ) ( not ( = ?auto_149482 ?auto_149489 ) ) ( not ( = ?auto_149483 ?auto_149489 ) ) ( not ( = ?auto_149484 ?auto_149489 ) ) ( not ( = ?auto_149485 ?auto_149489 ) ) ( not ( = ?auto_149487 ?auto_149489 ) ) ( not ( = ?auto_149488 ?auto_149489 ) ) ( not ( = ?auto_149486 ?auto_149489 ) ) ( ON ?auto_149482 ?auto_149481 ) ( ON-TABLE ?auto_149489 ) ( ON ?auto_149483 ?auto_149482 ) ( CLEAR ?auto_149485 ) ( ON ?auto_149484 ?auto_149483 ) ( CLEAR ?auto_149484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149489 ?auto_149481 ?auto_149482 ?auto_149483 )
      ( MAKE-5PILE ?auto_149481 ?auto_149482 ?auto_149483 ?auto_149484 ?auto_149485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149490 - BLOCK
      ?auto_149491 - BLOCK
      ?auto_149492 - BLOCK
      ?auto_149493 - BLOCK
      ?auto_149494 - BLOCK
    )
    :vars
    (
      ?auto_149495 - BLOCK
      ?auto_149496 - BLOCK
      ?auto_149497 - BLOCK
      ?auto_149498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149490 ?auto_149491 ) ) ( not ( = ?auto_149490 ?auto_149492 ) ) ( not ( = ?auto_149490 ?auto_149493 ) ) ( not ( = ?auto_149490 ?auto_149494 ) ) ( not ( = ?auto_149491 ?auto_149492 ) ) ( not ( = ?auto_149491 ?auto_149493 ) ) ( not ( = ?auto_149491 ?auto_149494 ) ) ( not ( = ?auto_149492 ?auto_149493 ) ) ( not ( = ?auto_149492 ?auto_149494 ) ) ( not ( = ?auto_149493 ?auto_149494 ) ) ( not ( = ?auto_149490 ?auto_149495 ) ) ( not ( = ?auto_149491 ?auto_149495 ) ) ( not ( = ?auto_149492 ?auto_149495 ) ) ( not ( = ?auto_149493 ?auto_149495 ) ) ( not ( = ?auto_149494 ?auto_149495 ) ) ( ON-TABLE ?auto_149496 ) ( ON ?auto_149497 ?auto_149496 ) ( ON ?auto_149495 ?auto_149497 ) ( not ( = ?auto_149496 ?auto_149497 ) ) ( not ( = ?auto_149496 ?auto_149495 ) ) ( not ( = ?auto_149496 ?auto_149494 ) ) ( not ( = ?auto_149496 ?auto_149493 ) ) ( not ( = ?auto_149497 ?auto_149495 ) ) ( not ( = ?auto_149497 ?auto_149494 ) ) ( not ( = ?auto_149497 ?auto_149493 ) ) ( not ( = ?auto_149490 ?auto_149496 ) ) ( not ( = ?auto_149490 ?auto_149497 ) ) ( not ( = ?auto_149491 ?auto_149496 ) ) ( not ( = ?auto_149491 ?auto_149497 ) ) ( not ( = ?auto_149492 ?auto_149496 ) ) ( not ( = ?auto_149492 ?auto_149497 ) ) ( ON ?auto_149490 ?auto_149498 ) ( not ( = ?auto_149490 ?auto_149498 ) ) ( not ( = ?auto_149491 ?auto_149498 ) ) ( not ( = ?auto_149492 ?auto_149498 ) ) ( not ( = ?auto_149493 ?auto_149498 ) ) ( not ( = ?auto_149494 ?auto_149498 ) ) ( not ( = ?auto_149495 ?auto_149498 ) ) ( not ( = ?auto_149496 ?auto_149498 ) ) ( not ( = ?auto_149497 ?auto_149498 ) ) ( ON ?auto_149491 ?auto_149490 ) ( ON-TABLE ?auto_149498 ) ( ON ?auto_149492 ?auto_149491 ) ( ON ?auto_149493 ?auto_149492 ) ( CLEAR ?auto_149493 ) ( HOLDING ?auto_149494 ) ( CLEAR ?auto_149495 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149496 ?auto_149497 ?auto_149495 ?auto_149494 )
      ( MAKE-5PILE ?auto_149490 ?auto_149491 ?auto_149492 ?auto_149493 ?auto_149494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149499 - BLOCK
      ?auto_149500 - BLOCK
      ?auto_149501 - BLOCK
      ?auto_149502 - BLOCK
      ?auto_149503 - BLOCK
    )
    :vars
    (
      ?auto_149507 - BLOCK
      ?auto_149505 - BLOCK
      ?auto_149506 - BLOCK
      ?auto_149504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149499 ?auto_149500 ) ) ( not ( = ?auto_149499 ?auto_149501 ) ) ( not ( = ?auto_149499 ?auto_149502 ) ) ( not ( = ?auto_149499 ?auto_149503 ) ) ( not ( = ?auto_149500 ?auto_149501 ) ) ( not ( = ?auto_149500 ?auto_149502 ) ) ( not ( = ?auto_149500 ?auto_149503 ) ) ( not ( = ?auto_149501 ?auto_149502 ) ) ( not ( = ?auto_149501 ?auto_149503 ) ) ( not ( = ?auto_149502 ?auto_149503 ) ) ( not ( = ?auto_149499 ?auto_149507 ) ) ( not ( = ?auto_149500 ?auto_149507 ) ) ( not ( = ?auto_149501 ?auto_149507 ) ) ( not ( = ?auto_149502 ?auto_149507 ) ) ( not ( = ?auto_149503 ?auto_149507 ) ) ( ON-TABLE ?auto_149505 ) ( ON ?auto_149506 ?auto_149505 ) ( ON ?auto_149507 ?auto_149506 ) ( not ( = ?auto_149505 ?auto_149506 ) ) ( not ( = ?auto_149505 ?auto_149507 ) ) ( not ( = ?auto_149505 ?auto_149503 ) ) ( not ( = ?auto_149505 ?auto_149502 ) ) ( not ( = ?auto_149506 ?auto_149507 ) ) ( not ( = ?auto_149506 ?auto_149503 ) ) ( not ( = ?auto_149506 ?auto_149502 ) ) ( not ( = ?auto_149499 ?auto_149505 ) ) ( not ( = ?auto_149499 ?auto_149506 ) ) ( not ( = ?auto_149500 ?auto_149505 ) ) ( not ( = ?auto_149500 ?auto_149506 ) ) ( not ( = ?auto_149501 ?auto_149505 ) ) ( not ( = ?auto_149501 ?auto_149506 ) ) ( ON ?auto_149499 ?auto_149504 ) ( not ( = ?auto_149499 ?auto_149504 ) ) ( not ( = ?auto_149500 ?auto_149504 ) ) ( not ( = ?auto_149501 ?auto_149504 ) ) ( not ( = ?auto_149502 ?auto_149504 ) ) ( not ( = ?auto_149503 ?auto_149504 ) ) ( not ( = ?auto_149507 ?auto_149504 ) ) ( not ( = ?auto_149505 ?auto_149504 ) ) ( not ( = ?auto_149506 ?auto_149504 ) ) ( ON ?auto_149500 ?auto_149499 ) ( ON-TABLE ?auto_149504 ) ( ON ?auto_149501 ?auto_149500 ) ( ON ?auto_149502 ?auto_149501 ) ( CLEAR ?auto_149507 ) ( ON ?auto_149503 ?auto_149502 ) ( CLEAR ?auto_149503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149504 ?auto_149499 ?auto_149500 ?auto_149501 ?auto_149502 )
      ( MAKE-5PILE ?auto_149499 ?auto_149500 ?auto_149501 ?auto_149502 ?auto_149503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149508 - BLOCK
      ?auto_149509 - BLOCK
      ?auto_149510 - BLOCK
      ?auto_149511 - BLOCK
      ?auto_149512 - BLOCK
    )
    :vars
    (
      ?auto_149514 - BLOCK
      ?auto_149516 - BLOCK
      ?auto_149515 - BLOCK
      ?auto_149513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149508 ?auto_149509 ) ) ( not ( = ?auto_149508 ?auto_149510 ) ) ( not ( = ?auto_149508 ?auto_149511 ) ) ( not ( = ?auto_149508 ?auto_149512 ) ) ( not ( = ?auto_149509 ?auto_149510 ) ) ( not ( = ?auto_149509 ?auto_149511 ) ) ( not ( = ?auto_149509 ?auto_149512 ) ) ( not ( = ?auto_149510 ?auto_149511 ) ) ( not ( = ?auto_149510 ?auto_149512 ) ) ( not ( = ?auto_149511 ?auto_149512 ) ) ( not ( = ?auto_149508 ?auto_149514 ) ) ( not ( = ?auto_149509 ?auto_149514 ) ) ( not ( = ?auto_149510 ?auto_149514 ) ) ( not ( = ?auto_149511 ?auto_149514 ) ) ( not ( = ?auto_149512 ?auto_149514 ) ) ( ON-TABLE ?auto_149516 ) ( ON ?auto_149515 ?auto_149516 ) ( not ( = ?auto_149516 ?auto_149515 ) ) ( not ( = ?auto_149516 ?auto_149514 ) ) ( not ( = ?auto_149516 ?auto_149512 ) ) ( not ( = ?auto_149516 ?auto_149511 ) ) ( not ( = ?auto_149515 ?auto_149514 ) ) ( not ( = ?auto_149515 ?auto_149512 ) ) ( not ( = ?auto_149515 ?auto_149511 ) ) ( not ( = ?auto_149508 ?auto_149516 ) ) ( not ( = ?auto_149508 ?auto_149515 ) ) ( not ( = ?auto_149509 ?auto_149516 ) ) ( not ( = ?auto_149509 ?auto_149515 ) ) ( not ( = ?auto_149510 ?auto_149516 ) ) ( not ( = ?auto_149510 ?auto_149515 ) ) ( ON ?auto_149508 ?auto_149513 ) ( not ( = ?auto_149508 ?auto_149513 ) ) ( not ( = ?auto_149509 ?auto_149513 ) ) ( not ( = ?auto_149510 ?auto_149513 ) ) ( not ( = ?auto_149511 ?auto_149513 ) ) ( not ( = ?auto_149512 ?auto_149513 ) ) ( not ( = ?auto_149514 ?auto_149513 ) ) ( not ( = ?auto_149516 ?auto_149513 ) ) ( not ( = ?auto_149515 ?auto_149513 ) ) ( ON ?auto_149509 ?auto_149508 ) ( ON-TABLE ?auto_149513 ) ( ON ?auto_149510 ?auto_149509 ) ( ON ?auto_149511 ?auto_149510 ) ( ON ?auto_149512 ?auto_149511 ) ( CLEAR ?auto_149512 ) ( HOLDING ?auto_149514 ) ( CLEAR ?auto_149515 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149516 ?auto_149515 ?auto_149514 )
      ( MAKE-5PILE ?auto_149508 ?auto_149509 ?auto_149510 ?auto_149511 ?auto_149512 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149517 - BLOCK
      ?auto_149518 - BLOCK
      ?auto_149519 - BLOCK
      ?auto_149520 - BLOCK
      ?auto_149521 - BLOCK
    )
    :vars
    (
      ?auto_149525 - BLOCK
      ?auto_149524 - BLOCK
      ?auto_149522 - BLOCK
      ?auto_149523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149517 ?auto_149518 ) ) ( not ( = ?auto_149517 ?auto_149519 ) ) ( not ( = ?auto_149517 ?auto_149520 ) ) ( not ( = ?auto_149517 ?auto_149521 ) ) ( not ( = ?auto_149518 ?auto_149519 ) ) ( not ( = ?auto_149518 ?auto_149520 ) ) ( not ( = ?auto_149518 ?auto_149521 ) ) ( not ( = ?auto_149519 ?auto_149520 ) ) ( not ( = ?auto_149519 ?auto_149521 ) ) ( not ( = ?auto_149520 ?auto_149521 ) ) ( not ( = ?auto_149517 ?auto_149525 ) ) ( not ( = ?auto_149518 ?auto_149525 ) ) ( not ( = ?auto_149519 ?auto_149525 ) ) ( not ( = ?auto_149520 ?auto_149525 ) ) ( not ( = ?auto_149521 ?auto_149525 ) ) ( ON-TABLE ?auto_149524 ) ( ON ?auto_149522 ?auto_149524 ) ( not ( = ?auto_149524 ?auto_149522 ) ) ( not ( = ?auto_149524 ?auto_149525 ) ) ( not ( = ?auto_149524 ?auto_149521 ) ) ( not ( = ?auto_149524 ?auto_149520 ) ) ( not ( = ?auto_149522 ?auto_149525 ) ) ( not ( = ?auto_149522 ?auto_149521 ) ) ( not ( = ?auto_149522 ?auto_149520 ) ) ( not ( = ?auto_149517 ?auto_149524 ) ) ( not ( = ?auto_149517 ?auto_149522 ) ) ( not ( = ?auto_149518 ?auto_149524 ) ) ( not ( = ?auto_149518 ?auto_149522 ) ) ( not ( = ?auto_149519 ?auto_149524 ) ) ( not ( = ?auto_149519 ?auto_149522 ) ) ( ON ?auto_149517 ?auto_149523 ) ( not ( = ?auto_149517 ?auto_149523 ) ) ( not ( = ?auto_149518 ?auto_149523 ) ) ( not ( = ?auto_149519 ?auto_149523 ) ) ( not ( = ?auto_149520 ?auto_149523 ) ) ( not ( = ?auto_149521 ?auto_149523 ) ) ( not ( = ?auto_149525 ?auto_149523 ) ) ( not ( = ?auto_149524 ?auto_149523 ) ) ( not ( = ?auto_149522 ?auto_149523 ) ) ( ON ?auto_149518 ?auto_149517 ) ( ON-TABLE ?auto_149523 ) ( ON ?auto_149519 ?auto_149518 ) ( ON ?auto_149520 ?auto_149519 ) ( ON ?auto_149521 ?auto_149520 ) ( CLEAR ?auto_149522 ) ( ON ?auto_149525 ?auto_149521 ) ( CLEAR ?auto_149525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149523 ?auto_149517 ?auto_149518 ?auto_149519 ?auto_149520 ?auto_149521 )
      ( MAKE-5PILE ?auto_149517 ?auto_149518 ?auto_149519 ?auto_149520 ?auto_149521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149526 - BLOCK
      ?auto_149527 - BLOCK
      ?auto_149528 - BLOCK
      ?auto_149529 - BLOCK
      ?auto_149530 - BLOCK
    )
    :vars
    (
      ?auto_149533 - BLOCK
      ?auto_149531 - BLOCK
      ?auto_149532 - BLOCK
      ?auto_149534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149526 ?auto_149527 ) ) ( not ( = ?auto_149526 ?auto_149528 ) ) ( not ( = ?auto_149526 ?auto_149529 ) ) ( not ( = ?auto_149526 ?auto_149530 ) ) ( not ( = ?auto_149527 ?auto_149528 ) ) ( not ( = ?auto_149527 ?auto_149529 ) ) ( not ( = ?auto_149527 ?auto_149530 ) ) ( not ( = ?auto_149528 ?auto_149529 ) ) ( not ( = ?auto_149528 ?auto_149530 ) ) ( not ( = ?auto_149529 ?auto_149530 ) ) ( not ( = ?auto_149526 ?auto_149533 ) ) ( not ( = ?auto_149527 ?auto_149533 ) ) ( not ( = ?auto_149528 ?auto_149533 ) ) ( not ( = ?auto_149529 ?auto_149533 ) ) ( not ( = ?auto_149530 ?auto_149533 ) ) ( ON-TABLE ?auto_149531 ) ( not ( = ?auto_149531 ?auto_149532 ) ) ( not ( = ?auto_149531 ?auto_149533 ) ) ( not ( = ?auto_149531 ?auto_149530 ) ) ( not ( = ?auto_149531 ?auto_149529 ) ) ( not ( = ?auto_149532 ?auto_149533 ) ) ( not ( = ?auto_149532 ?auto_149530 ) ) ( not ( = ?auto_149532 ?auto_149529 ) ) ( not ( = ?auto_149526 ?auto_149531 ) ) ( not ( = ?auto_149526 ?auto_149532 ) ) ( not ( = ?auto_149527 ?auto_149531 ) ) ( not ( = ?auto_149527 ?auto_149532 ) ) ( not ( = ?auto_149528 ?auto_149531 ) ) ( not ( = ?auto_149528 ?auto_149532 ) ) ( ON ?auto_149526 ?auto_149534 ) ( not ( = ?auto_149526 ?auto_149534 ) ) ( not ( = ?auto_149527 ?auto_149534 ) ) ( not ( = ?auto_149528 ?auto_149534 ) ) ( not ( = ?auto_149529 ?auto_149534 ) ) ( not ( = ?auto_149530 ?auto_149534 ) ) ( not ( = ?auto_149533 ?auto_149534 ) ) ( not ( = ?auto_149531 ?auto_149534 ) ) ( not ( = ?auto_149532 ?auto_149534 ) ) ( ON ?auto_149527 ?auto_149526 ) ( ON-TABLE ?auto_149534 ) ( ON ?auto_149528 ?auto_149527 ) ( ON ?auto_149529 ?auto_149528 ) ( ON ?auto_149530 ?auto_149529 ) ( ON ?auto_149533 ?auto_149530 ) ( CLEAR ?auto_149533 ) ( HOLDING ?auto_149532 ) ( CLEAR ?auto_149531 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149531 ?auto_149532 )
      ( MAKE-5PILE ?auto_149526 ?auto_149527 ?auto_149528 ?auto_149529 ?auto_149530 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149535 - BLOCK
      ?auto_149536 - BLOCK
      ?auto_149537 - BLOCK
      ?auto_149538 - BLOCK
      ?auto_149539 - BLOCK
    )
    :vars
    (
      ?auto_149540 - BLOCK
      ?auto_149542 - BLOCK
      ?auto_149543 - BLOCK
      ?auto_149541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149535 ?auto_149536 ) ) ( not ( = ?auto_149535 ?auto_149537 ) ) ( not ( = ?auto_149535 ?auto_149538 ) ) ( not ( = ?auto_149535 ?auto_149539 ) ) ( not ( = ?auto_149536 ?auto_149537 ) ) ( not ( = ?auto_149536 ?auto_149538 ) ) ( not ( = ?auto_149536 ?auto_149539 ) ) ( not ( = ?auto_149537 ?auto_149538 ) ) ( not ( = ?auto_149537 ?auto_149539 ) ) ( not ( = ?auto_149538 ?auto_149539 ) ) ( not ( = ?auto_149535 ?auto_149540 ) ) ( not ( = ?auto_149536 ?auto_149540 ) ) ( not ( = ?auto_149537 ?auto_149540 ) ) ( not ( = ?auto_149538 ?auto_149540 ) ) ( not ( = ?auto_149539 ?auto_149540 ) ) ( ON-TABLE ?auto_149542 ) ( not ( = ?auto_149542 ?auto_149543 ) ) ( not ( = ?auto_149542 ?auto_149540 ) ) ( not ( = ?auto_149542 ?auto_149539 ) ) ( not ( = ?auto_149542 ?auto_149538 ) ) ( not ( = ?auto_149543 ?auto_149540 ) ) ( not ( = ?auto_149543 ?auto_149539 ) ) ( not ( = ?auto_149543 ?auto_149538 ) ) ( not ( = ?auto_149535 ?auto_149542 ) ) ( not ( = ?auto_149535 ?auto_149543 ) ) ( not ( = ?auto_149536 ?auto_149542 ) ) ( not ( = ?auto_149536 ?auto_149543 ) ) ( not ( = ?auto_149537 ?auto_149542 ) ) ( not ( = ?auto_149537 ?auto_149543 ) ) ( ON ?auto_149535 ?auto_149541 ) ( not ( = ?auto_149535 ?auto_149541 ) ) ( not ( = ?auto_149536 ?auto_149541 ) ) ( not ( = ?auto_149537 ?auto_149541 ) ) ( not ( = ?auto_149538 ?auto_149541 ) ) ( not ( = ?auto_149539 ?auto_149541 ) ) ( not ( = ?auto_149540 ?auto_149541 ) ) ( not ( = ?auto_149542 ?auto_149541 ) ) ( not ( = ?auto_149543 ?auto_149541 ) ) ( ON ?auto_149536 ?auto_149535 ) ( ON-TABLE ?auto_149541 ) ( ON ?auto_149537 ?auto_149536 ) ( ON ?auto_149538 ?auto_149537 ) ( ON ?auto_149539 ?auto_149538 ) ( ON ?auto_149540 ?auto_149539 ) ( CLEAR ?auto_149542 ) ( ON ?auto_149543 ?auto_149540 ) ( CLEAR ?auto_149543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149541 ?auto_149535 ?auto_149536 ?auto_149537 ?auto_149538 ?auto_149539 ?auto_149540 )
      ( MAKE-5PILE ?auto_149535 ?auto_149536 ?auto_149537 ?auto_149538 ?auto_149539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149544 - BLOCK
      ?auto_149545 - BLOCK
      ?auto_149546 - BLOCK
      ?auto_149547 - BLOCK
      ?auto_149548 - BLOCK
    )
    :vars
    (
      ?auto_149552 - BLOCK
      ?auto_149549 - BLOCK
      ?auto_149551 - BLOCK
      ?auto_149550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149544 ?auto_149545 ) ) ( not ( = ?auto_149544 ?auto_149546 ) ) ( not ( = ?auto_149544 ?auto_149547 ) ) ( not ( = ?auto_149544 ?auto_149548 ) ) ( not ( = ?auto_149545 ?auto_149546 ) ) ( not ( = ?auto_149545 ?auto_149547 ) ) ( not ( = ?auto_149545 ?auto_149548 ) ) ( not ( = ?auto_149546 ?auto_149547 ) ) ( not ( = ?auto_149546 ?auto_149548 ) ) ( not ( = ?auto_149547 ?auto_149548 ) ) ( not ( = ?auto_149544 ?auto_149552 ) ) ( not ( = ?auto_149545 ?auto_149552 ) ) ( not ( = ?auto_149546 ?auto_149552 ) ) ( not ( = ?auto_149547 ?auto_149552 ) ) ( not ( = ?auto_149548 ?auto_149552 ) ) ( not ( = ?auto_149549 ?auto_149551 ) ) ( not ( = ?auto_149549 ?auto_149552 ) ) ( not ( = ?auto_149549 ?auto_149548 ) ) ( not ( = ?auto_149549 ?auto_149547 ) ) ( not ( = ?auto_149551 ?auto_149552 ) ) ( not ( = ?auto_149551 ?auto_149548 ) ) ( not ( = ?auto_149551 ?auto_149547 ) ) ( not ( = ?auto_149544 ?auto_149549 ) ) ( not ( = ?auto_149544 ?auto_149551 ) ) ( not ( = ?auto_149545 ?auto_149549 ) ) ( not ( = ?auto_149545 ?auto_149551 ) ) ( not ( = ?auto_149546 ?auto_149549 ) ) ( not ( = ?auto_149546 ?auto_149551 ) ) ( ON ?auto_149544 ?auto_149550 ) ( not ( = ?auto_149544 ?auto_149550 ) ) ( not ( = ?auto_149545 ?auto_149550 ) ) ( not ( = ?auto_149546 ?auto_149550 ) ) ( not ( = ?auto_149547 ?auto_149550 ) ) ( not ( = ?auto_149548 ?auto_149550 ) ) ( not ( = ?auto_149552 ?auto_149550 ) ) ( not ( = ?auto_149549 ?auto_149550 ) ) ( not ( = ?auto_149551 ?auto_149550 ) ) ( ON ?auto_149545 ?auto_149544 ) ( ON-TABLE ?auto_149550 ) ( ON ?auto_149546 ?auto_149545 ) ( ON ?auto_149547 ?auto_149546 ) ( ON ?auto_149548 ?auto_149547 ) ( ON ?auto_149552 ?auto_149548 ) ( ON ?auto_149551 ?auto_149552 ) ( CLEAR ?auto_149551 ) ( HOLDING ?auto_149549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149549 )
      ( MAKE-5PILE ?auto_149544 ?auto_149545 ?auto_149546 ?auto_149547 ?auto_149548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_149553 - BLOCK
      ?auto_149554 - BLOCK
      ?auto_149555 - BLOCK
      ?auto_149556 - BLOCK
      ?auto_149557 - BLOCK
    )
    :vars
    (
      ?auto_149561 - BLOCK
      ?auto_149558 - BLOCK
      ?auto_149560 - BLOCK
      ?auto_149559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149553 ?auto_149554 ) ) ( not ( = ?auto_149553 ?auto_149555 ) ) ( not ( = ?auto_149553 ?auto_149556 ) ) ( not ( = ?auto_149553 ?auto_149557 ) ) ( not ( = ?auto_149554 ?auto_149555 ) ) ( not ( = ?auto_149554 ?auto_149556 ) ) ( not ( = ?auto_149554 ?auto_149557 ) ) ( not ( = ?auto_149555 ?auto_149556 ) ) ( not ( = ?auto_149555 ?auto_149557 ) ) ( not ( = ?auto_149556 ?auto_149557 ) ) ( not ( = ?auto_149553 ?auto_149561 ) ) ( not ( = ?auto_149554 ?auto_149561 ) ) ( not ( = ?auto_149555 ?auto_149561 ) ) ( not ( = ?auto_149556 ?auto_149561 ) ) ( not ( = ?auto_149557 ?auto_149561 ) ) ( not ( = ?auto_149558 ?auto_149560 ) ) ( not ( = ?auto_149558 ?auto_149561 ) ) ( not ( = ?auto_149558 ?auto_149557 ) ) ( not ( = ?auto_149558 ?auto_149556 ) ) ( not ( = ?auto_149560 ?auto_149561 ) ) ( not ( = ?auto_149560 ?auto_149557 ) ) ( not ( = ?auto_149560 ?auto_149556 ) ) ( not ( = ?auto_149553 ?auto_149558 ) ) ( not ( = ?auto_149553 ?auto_149560 ) ) ( not ( = ?auto_149554 ?auto_149558 ) ) ( not ( = ?auto_149554 ?auto_149560 ) ) ( not ( = ?auto_149555 ?auto_149558 ) ) ( not ( = ?auto_149555 ?auto_149560 ) ) ( ON ?auto_149553 ?auto_149559 ) ( not ( = ?auto_149553 ?auto_149559 ) ) ( not ( = ?auto_149554 ?auto_149559 ) ) ( not ( = ?auto_149555 ?auto_149559 ) ) ( not ( = ?auto_149556 ?auto_149559 ) ) ( not ( = ?auto_149557 ?auto_149559 ) ) ( not ( = ?auto_149561 ?auto_149559 ) ) ( not ( = ?auto_149558 ?auto_149559 ) ) ( not ( = ?auto_149560 ?auto_149559 ) ) ( ON ?auto_149554 ?auto_149553 ) ( ON-TABLE ?auto_149559 ) ( ON ?auto_149555 ?auto_149554 ) ( ON ?auto_149556 ?auto_149555 ) ( ON ?auto_149557 ?auto_149556 ) ( ON ?auto_149561 ?auto_149557 ) ( ON ?auto_149560 ?auto_149561 ) ( ON ?auto_149558 ?auto_149560 ) ( CLEAR ?auto_149558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149559 ?auto_149553 ?auto_149554 ?auto_149555 ?auto_149556 ?auto_149557 ?auto_149561 ?auto_149560 )
      ( MAKE-5PILE ?auto_149553 ?auto_149554 ?auto_149555 ?auto_149556 ?auto_149557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149577 - BLOCK
      ?auto_149578 - BLOCK
    )
    :vars
    (
      ?auto_149581 - BLOCK
      ?auto_149579 - BLOCK
      ?auto_149580 - BLOCK
      ?auto_149584 - BLOCK
      ?auto_149582 - BLOCK
      ?auto_149583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149581 ?auto_149578 ) ( ON-TABLE ?auto_149577 ) ( ON ?auto_149578 ?auto_149577 ) ( not ( = ?auto_149577 ?auto_149578 ) ) ( not ( = ?auto_149577 ?auto_149581 ) ) ( not ( = ?auto_149578 ?auto_149581 ) ) ( not ( = ?auto_149577 ?auto_149579 ) ) ( not ( = ?auto_149577 ?auto_149580 ) ) ( not ( = ?auto_149578 ?auto_149579 ) ) ( not ( = ?auto_149578 ?auto_149580 ) ) ( not ( = ?auto_149581 ?auto_149579 ) ) ( not ( = ?auto_149581 ?auto_149580 ) ) ( not ( = ?auto_149579 ?auto_149580 ) ) ( ON ?auto_149579 ?auto_149581 ) ( CLEAR ?auto_149579 ) ( HOLDING ?auto_149580 ) ( CLEAR ?auto_149584 ) ( ON-TABLE ?auto_149582 ) ( ON ?auto_149583 ?auto_149582 ) ( ON ?auto_149584 ?auto_149583 ) ( not ( = ?auto_149582 ?auto_149583 ) ) ( not ( = ?auto_149582 ?auto_149584 ) ) ( not ( = ?auto_149582 ?auto_149580 ) ) ( not ( = ?auto_149583 ?auto_149584 ) ) ( not ( = ?auto_149583 ?auto_149580 ) ) ( not ( = ?auto_149584 ?auto_149580 ) ) ( not ( = ?auto_149577 ?auto_149584 ) ) ( not ( = ?auto_149577 ?auto_149582 ) ) ( not ( = ?auto_149577 ?auto_149583 ) ) ( not ( = ?auto_149578 ?auto_149584 ) ) ( not ( = ?auto_149578 ?auto_149582 ) ) ( not ( = ?auto_149578 ?auto_149583 ) ) ( not ( = ?auto_149581 ?auto_149584 ) ) ( not ( = ?auto_149581 ?auto_149582 ) ) ( not ( = ?auto_149581 ?auto_149583 ) ) ( not ( = ?auto_149579 ?auto_149584 ) ) ( not ( = ?auto_149579 ?auto_149582 ) ) ( not ( = ?auto_149579 ?auto_149583 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149582 ?auto_149583 ?auto_149584 ?auto_149580 )
      ( MAKE-2PILE ?auto_149577 ?auto_149578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149585 - BLOCK
      ?auto_149586 - BLOCK
    )
    :vars
    (
      ?auto_149591 - BLOCK
      ?auto_149589 - BLOCK
      ?auto_149592 - BLOCK
      ?auto_149588 - BLOCK
      ?auto_149587 - BLOCK
      ?auto_149590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149591 ?auto_149586 ) ( ON-TABLE ?auto_149585 ) ( ON ?auto_149586 ?auto_149585 ) ( not ( = ?auto_149585 ?auto_149586 ) ) ( not ( = ?auto_149585 ?auto_149591 ) ) ( not ( = ?auto_149586 ?auto_149591 ) ) ( not ( = ?auto_149585 ?auto_149589 ) ) ( not ( = ?auto_149585 ?auto_149592 ) ) ( not ( = ?auto_149586 ?auto_149589 ) ) ( not ( = ?auto_149586 ?auto_149592 ) ) ( not ( = ?auto_149591 ?auto_149589 ) ) ( not ( = ?auto_149591 ?auto_149592 ) ) ( not ( = ?auto_149589 ?auto_149592 ) ) ( ON ?auto_149589 ?auto_149591 ) ( CLEAR ?auto_149588 ) ( ON-TABLE ?auto_149587 ) ( ON ?auto_149590 ?auto_149587 ) ( ON ?auto_149588 ?auto_149590 ) ( not ( = ?auto_149587 ?auto_149590 ) ) ( not ( = ?auto_149587 ?auto_149588 ) ) ( not ( = ?auto_149587 ?auto_149592 ) ) ( not ( = ?auto_149590 ?auto_149588 ) ) ( not ( = ?auto_149590 ?auto_149592 ) ) ( not ( = ?auto_149588 ?auto_149592 ) ) ( not ( = ?auto_149585 ?auto_149588 ) ) ( not ( = ?auto_149585 ?auto_149587 ) ) ( not ( = ?auto_149585 ?auto_149590 ) ) ( not ( = ?auto_149586 ?auto_149588 ) ) ( not ( = ?auto_149586 ?auto_149587 ) ) ( not ( = ?auto_149586 ?auto_149590 ) ) ( not ( = ?auto_149591 ?auto_149588 ) ) ( not ( = ?auto_149591 ?auto_149587 ) ) ( not ( = ?auto_149591 ?auto_149590 ) ) ( not ( = ?auto_149589 ?auto_149588 ) ) ( not ( = ?auto_149589 ?auto_149587 ) ) ( not ( = ?auto_149589 ?auto_149590 ) ) ( ON ?auto_149592 ?auto_149589 ) ( CLEAR ?auto_149592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149585 ?auto_149586 ?auto_149591 ?auto_149589 )
      ( MAKE-2PILE ?auto_149585 ?auto_149586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149593 - BLOCK
      ?auto_149594 - BLOCK
    )
    :vars
    (
      ?auto_149599 - BLOCK
      ?auto_149600 - BLOCK
      ?auto_149597 - BLOCK
      ?auto_149598 - BLOCK
      ?auto_149596 - BLOCK
      ?auto_149595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149599 ?auto_149594 ) ( ON-TABLE ?auto_149593 ) ( ON ?auto_149594 ?auto_149593 ) ( not ( = ?auto_149593 ?auto_149594 ) ) ( not ( = ?auto_149593 ?auto_149599 ) ) ( not ( = ?auto_149594 ?auto_149599 ) ) ( not ( = ?auto_149593 ?auto_149600 ) ) ( not ( = ?auto_149593 ?auto_149597 ) ) ( not ( = ?auto_149594 ?auto_149600 ) ) ( not ( = ?auto_149594 ?auto_149597 ) ) ( not ( = ?auto_149599 ?auto_149600 ) ) ( not ( = ?auto_149599 ?auto_149597 ) ) ( not ( = ?auto_149600 ?auto_149597 ) ) ( ON ?auto_149600 ?auto_149599 ) ( ON-TABLE ?auto_149598 ) ( ON ?auto_149596 ?auto_149598 ) ( not ( = ?auto_149598 ?auto_149596 ) ) ( not ( = ?auto_149598 ?auto_149595 ) ) ( not ( = ?auto_149598 ?auto_149597 ) ) ( not ( = ?auto_149596 ?auto_149595 ) ) ( not ( = ?auto_149596 ?auto_149597 ) ) ( not ( = ?auto_149595 ?auto_149597 ) ) ( not ( = ?auto_149593 ?auto_149595 ) ) ( not ( = ?auto_149593 ?auto_149598 ) ) ( not ( = ?auto_149593 ?auto_149596 ) ) ( not ( = ?auto_149594 ?auto_149595 ) ) ( not ( = ?auto_149594 ?auto_149598 ) ) ( not ( = ?auto_149594 ?auto_149596 ) ) ( not ( = ?auto_149599 ?auto_149595 ) ) ( not ( = ?auto_149599 ?auto_149598 ) ) ( not ( = ?auto_149599 ?auto_149596 ) ) ( not ( = ?auto_149600 ?auto_149595 ) ) ( not ( = ?auto_149600 ?auto_149598 ) ) ( not ( = ?auto_149600 ?auto_149596 ) ) ( ON ?auto_149597 ?auto_149600 ) ( CLEAR ?auto_149597 ) ( HOLDING ?auto_149595 ) ( CLEAR ?auto_149596 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149598 ?auto_149596 ?auto_149595 )
      ( MAKE-2PILE ?auto_149593 ?auto_149594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149601 - BLOCK
      ?auto_149602 - BLOCK
    )
    :vars
    (
      ?auto_149606 - BLOCK
      ?auto_149605 - BLOCK
      ?auto_149604 - BLOCK
      ?auto_149603 - BLOCK
      ?auto_149607 - BLOCK
      ?auto_149608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149606 ?auto_149602 ) ( ON-TABLE ?auto_149601 ) ( ON ?auto_149602 ?auto_149601 ) ( not ( = ?auto_149601 ?auto_149602 ) ) ( not ( = ?auto_149601 ?auto_149606 ) ) ( not ( = ?auto_149602 ?auto_149606 ) ) ( not ( = ?auto_149601 ?auto_149605 ) ) ( not ( = ?auto_149601 ?auto_149604 ) ) ( not ( = ?auto_149602 ?auto_149605 ) ) ( not ( = ?auto_149602 ?auto_149604 ) ) ( not ( = ?auto_149606 ?auto_149605 ) ) ( not ( = ?auto_149606 ?auto_149604 ) ) ( not ( = ?auto_149605 ?auto_149604 ) ) ( ON ?auto_149605 ?auto_149606 ) ( ON-TABLE ?auto_149603 ) ( ON ?auto_149607 ?auto_149603 ) ( not ( = ?auto_149603 ?auto_149607 ) ) ( not ( = ?auto_149603 ?auto_149608 ) ) ( not ( = ?auto_149603 ?auto_149604 ) ) ( not ( = ?auto_149607 ?auto_149608 ) ) ( not ( = ?auto_149607 ?auto_149604 ) ) ( not ( = ?auto_149608 ?auto_149604 ) ) ( not ( = ?auto_149601 ?auto_149608 ) ) ( not ( = ?auto_149601 ?auto_149603 ) ) ( not ( = ?auto_149601 ?auto_149607 ) ) ( not ( = ?auto_149602 ?auto_149608 ) ) ( not ( = ?auto_149602 ?auto_149603 ) ) ( not ( = ?auto_149602 ?auto_149607 ) ) ( not ( = ?auto_149606 ?auto_149608 ) ) ( not ( = ?auto_149606 ?auto_149603 ) ) ( not ( = ?auto_149606 ?auto_149607 ) ) ( not ( = ?auto_149605 ?auto_149608 ) ) ( not ( = ?auto_149605 ?auto_149603 ) ) ( not ( = ?auto_149605 ?auto_149607 ) ) ( ON ?auto_149604 ?auto_149605 ) ( CLEAR ?auto_149607 ) ( ON ?auto_149608 ?auto_149604 ) ( CLEAR ?auto_149608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149601 ?auto_149602 ?auto_149606 ?auto_149605 ?auto_149604 )
      ( MAKE-2PILE ?auto_149601 ?auto_149602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149609 - BLOCK
      ?auto_149610 - BLOCK
    )
    :vars
    (
      ?auto_149612 - BLOCK
      ?auto_149611 - BLOCK
      ?auto_149614 - BLOCK
      ?auto_149613 - BLOCK
      ?auto_149616 - BLOCK
      ?auto_149615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149612 ?auto_149610 ) ( ON-TABLE ?auto_149609 ) ( ON ?auto_149610 ?auto_149609 ) ( not ( = ?auto_149609 ?auto_149610 ) ) ( not ( = ?auto_149609 ?auto_149612 ) ) ( not ( = ?auto_149610 ?auto_149612 ) ) ( not ( = ?auto_149609 ?auto_149611 ) ) ( not ( = ?auto_149609 ?auto_149614 ) ) ( not ( = ?auto_149610 ?auto_149611 ) ) ( not ( = ?auto_149610 ?auto_149614 ) ) ( not ( = ?auto_149612 ?auto_149611 ) ) ( not ( = ?auto_149612 ?auto_149614 ) ) ( not ( = ?auto_149611 ?auto_149614 ) ) ( ON ?auto_149611 ?auto_149612 ) ( ON-TABLE ?auto_149613 ) ( not ( = ?auto_149613 ?auto_149616 ) ) ( not ( = ?auto_149613 ?auto_149615 ) ) ( not ( = ?auto_149613 ?auto_149614 ) ) ( not ( = ?auto_149616 ?auto_149615 ) ) ( not ( = ?auto_149616 ?auto_149614 ) ) ( not ( = ?auto_149615 ?auto_149614 ) ) ( not ( = ?auto_149609 ?auto_149615 ) ) ( not ( = ?auto_149609 ?auto_149613 ) ) ( not ( = ?auto_149609 ?auto_149616 ) ) ( not ( = ?auto_149610 ?auto_149615 ) ) ( not ( = ?auto_149610 ?auto_149613 ) ) ( not ( = ?auto_149610 ?auto_149616 ) ) ( not ( = ?auto_149612 ?auto_149615 ) ) ( not ( = ?auto_149612 ?auto_149613 ) ) ( not ( = ?auto_149612 ?auto_149616 ) ) ( not ( = ?auto_149611 ?auto_149615 ) ) ( not ( = ?auto_149611 ?auto_149613 ) ) ( not ( = ?auto_149611 ?auto_149616 ) ) ( ON ?auto_149614 ?auto_149611 ) ( ON ?auto_149615 ?auto_149614 ) ( CLEAR ?auto_149615 ) ( HOLDING ?auto_149616 ) ( CLEAR ?auto_149613 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149613 ?auto_149616 )
      ( MAKE-2PILE ?auto_149609 ?auto_149610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149617 - BLOCK
      ?auto_149618 - BLOCK
    )
    :vars
    (
      ?auto_149624 - BLOCK
      ?auto_149623 - BLOCK
      ?auto_149619 - BLOCK
      ?auto_149620 - BLOCK
      ?auto_149622 - BLOCK
      ?auto_149621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149624 ?auto_149618 ) ( ON-TABLE ?auto_149617 ) ( ON ?auto_149618 ?auto_149617 ) ( not ( = ?auto_149617 ?auto_149618 ) ) ( not ( = ?auto_149617 ?auto_149624 ) ) ( not ( = ?auto_149618 ?auto_149624 ) ) ( not ( = ?auto_149617 ?auto_149623 ) ) ( not ( = ?auto_149617 ?auto_149619 ) ) ( not ( = ?auto_149618 ?auto_149623 ) ) ( not ( = ?auto_149618 ?auto_149619 ) ) ( not ( = ?auto_149624 ?auto_149623 ) ) ( not ( = ?auto_149624 ?auto_149619 ) ) ( not ( = ?auto_149623 ?auto_149619 ) ) ( ON ?auto_149623 ?auto_149624 ) ( ON-TABLE ?auto_149620 ) ( not ( = ?auto_149620 ?auto_149622 ) ) ( not ( = ?auto_149620 ?auto_149621 ) ) ( not ( = ?auto_149620 ?auto_149619 ) ) ( not ( = ?auto_149622 ?auto_149621 ) ) ( not ( = ?auto_149622 ?auto_149619 ) ) ( not ( = ?auto_149621 ?auto_149619 ) ) ( not ( = ?auto_149617 ?auto_149621 ) ) ( not ( = ?auto_149617 ?auto_149620 ) ) ( not ( = ?auto_149617 ?auto_149622 ) ) ( not ( = ?auto_149618 ?auto_149621 ) ) ( not ( = ?auto_149618 ?auto_149620 ) ) ( not ( = ?auto_149618 ?auto_149622 ) ) ( not ( = ?auto_149624 ?auto_149621 ) ) ( not ( = ?auto_149624 ?auto_149620 ) ) ( not ( = ?auto_149624 ?auto_149622 ) ) ( not ( = ?auto_149623 ?auto_149621 ) ) ( not ( = ?auto_149623 ?auto_149620 ) ) ( not ( = ?auto_149623 ?auto_149622 ) ) ( ON ?auto_149619 ?auto_149623 ) ( ON ?auto_149621 ?auto_149619 ) ( CLEAR ?auto_149620 ) ( ON ?auto_149622 ?auto_149621 ) ( CLEAR ?auto_149622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149617 ?auto_149618 ?auto_149624 ?auto_149623 ?auto_149619 ?auto_149621 )
      ( MAKE-2PILE ?auto_149617 ?auto_149618 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149625 - BLOCK
      ?auto_149626 - BLOCK
    )
    :vars
    (
      ?auto_149632 - BLOCK
      ?auto_149627 - BLOCK
      ?auto_149629 - BLOCK
      ?auto_149630 - BLOCK
      ?auto_149628 - BLOCK
      ?auto_149631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149632 ?auto_149626 ) ( ON-TABLE ?auto_149625 ) ( ON ?auto_149626 ?auto_149625 ) ( not ( = ?auto_149625 ?auto_149626 ) ) ( not ( = ?auto_149625 ?auto_149632 ) ) ( not ( = ?auto_149626 ?auto_149632 ) ) ( not ( = ?auto_149625 ?auto_149627 ) ) ( not ( = ?auto_149625 ?auto_149629 ) ) ( not ( = ?auto_149626 ?auto_149627 ) ) ( not ( = ?auto_149626 ?auto_149629 ) ) ( not ( = ?auto_149632 ?auto_149627 ) ) ( not ( = ?auto_149632 ?auto_149629 ) ) ( not ( = ?auto_149627 ?auto_149629 ) ) ( ON ?auto_149627 ?auto_149632 ) ( not ( = ?auto_149630 ?auto_149628 ) ) ( not ( = ?auto_149630 ?auto_149631 ) ) ( not ( = ?auto_149630 ?auto_149629 ) ) ( not ( = ?auto_149628 ?auto_149631 ) ) ( not ( = ?auto_149628 ?auto_149629 ) ) ( not ( = ?auto_149631 ?auto_149629 ) ) ( not ( = ?auto_149625 ?auto_149631 ) ) ( not ( = ?auto_149625 ?auto_149630 ) ) ( not ( = ?auto_149625 ?auto_149628 ) ) ( not ( = ?auto_149626 ?auto_149631 ) ) ( not ( = ?auto_149626 ?auto_149630 ) ) ( not ( = ?auto_149626 ?auto_149628 ) ) ( not ( = ?auto_149632 ?auto_149631 ) ) ( not ( = ?auto_149632 ?auto_149630 ) ) ( not ( = ?auto_149632 ?auto_149628 ) ) ( not ( = ?auto_149627 ?auto_149631 ) ) ( not ( = ?auto_149627 ?auto_149630 ) ) ( not ( = ?auto_149627 ?auto_149628 ) ) ( ON ?auto_149629 ?auto_149627 ) ( ON ?auto_149631 ?auto_149629 ) ( ON ?auto_149628 ?auto_149631 ) ( CLEAR ?auto_149628 ) ( HOLDING ?auto_149630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149630 )
      ( MAKE-2PILE ?auto_149625 ?auto_149626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149643 - BLOCK
      ?auto_149644 - BLOCK
    )
    :vars
    (
      ?auto_149650 - BLOCK
      ?auto_149649 - BLOCK
      ?auto_149648 - BLOCK
      ?auto_149646 - BLOCK
      ?auto_149647 - BLOCK
      ?auto_149645 - BLOCK
      ?auto_149651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149650 ?auto_149644 ) ( ON-TABLE ?auto_149643 ) ( ON ?auto_149644 ?auto_149643 ) ( not ( = ?auto_149643 ?auto_149644 ) ) ( not ( = ?auto_149643 ?auto_149650 ) ) ( not ( = ?auto_149644 ?auto_149650 ) ) ( not ( = ?auto_149643 ?auto_149649 ) ) ( not ( = ?auto_149643 ?auto_149648 ) ) ( not ( = ?auto_149644 ?auto_149649 ) ) ( not ( = ?auto_149644 ?auto_149648 ) ) ( not ( = ?auto_149650 ?auto_149649 ) ) ( not ( = ?auto_149650 ?auto_149648 ) ) ( not ( = ?auto_149649 ?auto_149648 ) ) ( ON ?auto_149649 ?auto_149650 ) ( not ( = ?auto_149646 ?auto_149647 ) ) ( not ( = ?auto_149646 ?auto_149645 ) ) ( not ( = ?auto_149646 ?auto_149648 ) ) ( not ( = ?auto_149647 ?auto_149645 ) ) ( not ( = ?auto_149647 ?auto_149648 ) ) ( not ( = ?auto_149645 ?auto_149648 ) ) ( not ( = ?auto_149643 ?auto_149645 ) ) ( not ( = ?auto_149643 ?auto_149646 ) ) ( not ( = ?auto_149643 ?auto_149647 ) ) ( not ( = ?auto_149644 ?auto_149645 ) ) ( not ( = ?auto_149644 ?auto_149646 ) ) ( not ( = ?auto_149644 ?auto_149647 ) ) ( not ( = ?auto_149650 ?auto_149645 ) ) ( not ( = ?auto_149650 ?auto_149646 ) ) ( not ( = ?auto_149650 ?auto_149647 ) ) ( not ( = ?auto_149649 ?auto_149645 ) ) ( not ( = ?auto_149649 ?auto_149646 ) ) ( not ( = ?auto_149649 ?auto_149647 ) ) ( ON ?auto_149648 ?auto_149649 ) ( ON ?auto_149645 ?auto_149648 ) ( ON ?auto_149647 ?auto_149645 ) ( CLEAR ?auto_149647 ) ( ON ?auto_149646 ?auto_149651 ) ( CLEAR ?auto_149646 ) ( HAND-EMPTY ) ( not ( = ?auto_149643 ?auto_149651 ) ) ( not ( = ?auto_149644 ?auto_149651 ) ) ( not ( = ?auto_149650 ?auto_149651 ) ) ( not ( = ?auto_149649 ?auto_149651 ) ) ( not ( = ?auto_149648 ?auto_149651 ) ) ( not ( = ?auto_149646 ?auto_149651 ) ) ( not ( = ?auto_149647 ?auto_149651 ) ) ( not ( = ?auto_149645 ?auto_149651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149646 ?auto_149651 )
      ( MAKE-2PILE ?auto_149643 ?auto_149644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149652 - BLOCK
      ?auto_149653 - BLOCK
    )
    :vars
    (
      ?auto_149659 - BLOCK
      ?auto_149660 - BLOCK
      ?auto_149657 - BLOCK
      ?auto_149655 - BLOCK
      ?auto_149654 - BLOCK
      ?auto_149656 - BLOCK
      ?auto_149658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149659 ?auto_149653 ) ( ON-TABLE ?auto_149652 ) ( ON ?auto_149653 ?auto_149652 ) ( not ( = ?auto_149652 ?auto_149653 ) ) ( not ( = ?auto_149652 ?auto_149659 ) ) ( not ( = ?auto_149653 ?auto_149659 ) ) ( not ( = ?auto_149652 ?auto_149660 ) ) ( not ( = ?auto_149652 ?auto_149657 ) ) ( not ( = ?auto_149653 ?auto_149660 ) ) ( not ( = ?auto_149653 ?auto_149657 ) ) ( not ( = ?auto_149659 ?auto_149660 ) ) ( not ( = ?auto_149659 ?auto_149657 ) ) ( not ( = ?auto_149660 ?auto_149657 ) ) ( ON ?auto_149660 ?auto_149659 ) ( not ( = ?auto_149655 ?auto_149654 ) ) ( not ( = ?auto_149655 ?auto_149656 ) ) ( not ( = ?auto_149655 ?auto_149657 ) ) ( not ( = ?auto_149654 ?auto_149656 ) ) ( not ( = ?auto_149654 ?auto_149657 ) ) ( not ( = ?auto_149656 ?auto_149657 ) ) ( not ( = ?auto_149652 ?auto_149656 ) ) ( not ( = ?auto_149652 ?auto_149655 ) ) ( not ( = ?auto_149652 ?auto_149654 ) ) ( not ( = ?auto_149653 ?auto_149656 ) ) ( not ( = ?auto_149653 ?auto_149655 ) ) ( not ( = ?auto_149653 ?auto_149654 ) ) ( not ( = ?auto_149659 ?auto_149656 ) ) ( not ( = ?auto_149659 ?auto_149655 ) ) ( not ( = ?auto_149659 ?auto_149654 ) ) ( not ( = ?auto_149660 ?auto_149656 ) ) ( not ( = ?auto_149660 ?auto_149655 ) ) ( not ( = ?auto_149660 ?auto_149654 ) ) ( ON ?auto_149657 ?auto_149660 ) ( ON ?auto_149656 ?auto_149657 ) ( ON ?auto_149655 ?auto_149658 ) ( CLEAR ?auto_149655 ) ( not ( = ?auto_149652 ?auto_149658 ) ) ( not ( = ?auto_149653 ?auto_149658 ) ) ( not ( = ?auto_149659 ?auto_149658 ) ) ( not ( = ?auto_149660 ?auto_149658 ) ) ( not ( = ?auto_149657 ?auto_149658 ) ) ( not ( = ?auto_149655 ?auto_149658 ) ) ( not ( = ?auto_149654 ?auto_149658 ) ) ( not ( = ?auto_149656 ?auto_149658 ) ) ( HOLDING ?auto_149654 ) ( CLEAR ?auto_149656 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149652 ?auto_149653 ?auto_149659 ?auto_149660 ?auto_149657 ?auto_149656 ?auto_149654 )
      ( MAKE-2PILE ?auto_149652 ?auto_149653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149661 - BLOCK
      ?auto_149662 - BLOCK
    )
    :vars
    (
      ?auto_149664 - BLOCK
      ?auto_149663 - BLOCK
      ?auto_149668 - BLOCK
      ?auto_149666 - BLOCK
      ?auto_149665 - BLOCK
      ?auto_149667 - BLOCK
      ?auto_149669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149664 ?auto_149662 ) ( ON-TABLE ?auto_149661 ) ( ON ?auto_149662 ?auto_149661 ) ( not ( = ?auto_149661 ?auto_149662 ) ) ( not ( = ?auto_149661 ?auto_149664 ) ) ( not ( = ?auto_149662 ?auto_149664 ) ) ( not ( = ?auto_149661 ?auto_149663 ) ) ( not ( = ?auto_149661 ?auto_149668 ) ) ( not ( = ?auto_149662 ?auto_149663 ) ) ( not ( = ?auto_149662 ?auto_149668 ) ) ( not ( = ?auto_149664 ?auto_149663 ) ) ( not ( = ?auto_149664 ?auto_149668 ) ) ( not ( = ?auto_149663 ?auto_149668 ) ) ( ON ?auto_149663 ?auto_149664 ) ( not ( = ?auto_149666 ?auto_149665 ) ) ( not ( = ?auto_149666 ?auto_149667 ) ) ( not ( = ?auto_149666 ?auto_149668 ) ) ( not ( = ?auto_149665 ?auto_149667 ) ) ( not ( = ?auto_149665 ?auto_149668 ) ) ( not ( = ?auto_149667 ?auto_149668 ) ) ( not ( = ?auto_149661 ?auto_149667 ) ) ( not ( = ?auto_149661 ?auto_149666 ) ) ( not ( = ?auto_149661 ?auto_149665 ) ) ( not ( = ?auto_149662 ?auto_149667 ) ) ( not ( = ?auto_149662 ?auto_149666 ) ) ( not ( = ?auto_149662 ?auto_149665 ) ) ( not ( = ?auto_149664 ?auto_149667 ) ) ( not ( = ?auto_149664 ?auto_149666 ) ) ( not ( = ?auto_149664 ?auto_149665 ) ) ( not ( = ?auto_149663 ?auto_149667 ) ) ( not ( = ?auto_149663 ?auto_149666 ) ) ( not ( = ?auto_149663 ?auto_149665 ) ) ( ON ?auto_149668 ?auto_149663 ) ( ON ?auto_149667 ?auto_149668 ) ( ON ?auto_149666 ?auto_149669 ) ( not ( = ?auto_149661 ?auto_149669 ) ) ( not ( = ?auto_149662 ?auto_149669 ) ) ( not ( = ?auto_149664 ?auto_149669 ) ) ( not ( = ?auto_149663 ?auto_149669 ) ) ( not ( = ?auto_149668 ?auto_149669 ) ) ( not ( = ?auto_149666 ?auto_149669 ) ) ( not ( = ?auto_149665 ?auto_149669 ) ) ( not ( = ?auto_149667 ?auto_149669 ) ) ( CLEAR ?auto_149667 ) ( ON ?auto_149665 ?auto_149666 ) ( CLEAR ?auto_149665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149669 ?auto_149666 )
      ( MAKE-2PILE ?auto_149661 ?auto_149662 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149670 - BLOCK
      ?auto_149671 - BLOCK
    )
    :vars
    (
      ?auto_149677 - BLOCK
      ?auto_149673 - BLOCK
      ?auto_149678 - BLOCK
      ?auto_149672 - BLOCK
      ?auto_149674 - BLOCK
      ?auto_149675 - BLOCK
      ?auto_149676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149677 ?auto_149671 ) ( ON-TABLE ?auto_149670 ) ( ON ?auto_149671 ?auto_149670 ) ( not ( = ?auto_149670 ?auto_149671 ) ) ( not ( = ?auto_149670 ?auto_149677 ) ) ( not ( = ?auto_149671 ?auto_149677 ) ) ( not ( = ?auto_149670 ?auto_149673 ) ) ( not ( = ?auto_149670 ?auto_149678 ) ) ( not ( = ?auto_149671 ?auto_149673 ) ) ( not ( = ?auto_149671 ?auto_149678 ) ) ( not ( = ?auto_149677 ?auto_149673 ) ) ( not ( = ?auto_149677 ?auto_149678 ) ) ( not ( = ?auto_149673 ?auto_149678 ) ) ( ON ?auto_149673 ?auto_149677 ) ( not ( = ?auto_149672 ?auto_149674 ) ) ( not ( = ?auto_149672 ?auto_149675 ) ) ( not ( = ?auto_149672 ?auto_149678 ) ) ( not ( = ?auto_149674 ?auto_149675 ) ) ( not ( = ?auto_149674 ?auto_149678 ) ) ( not ( = ?auto_149675 ?auto_149678 ) ) ( not ( = ?auto_149670 ?auto_149675 ) ) ( not ( = ?auto_149670 ?auto_149672 ) ) ( not ( = ?auto_149670 ?auto_149674 ) ) ( not ( = ?auto_149671 ?auto_149675 ) ) ( not ( = ?auto_149671 ?auto_149672 ) ) ( not ( = ?auto_149671 ?auto_149674 ) ) ( not ( = ?auto_149677 ?auto_149675 ) ) ( not ( = ?auto_149677 ?auto_149672 ) ) ( not ( = ?auto_149677 ?auto_149674 ) ) ( not ( = ?auto_149673 ?auto_149675 ) ) ( not ( = ?auto_149673 ?auto_149672 ) ) ( not ( = ?auto_149673 ?auto_149674 ) ) ( ON ?auto_149678 ?auto_149673 ) ( ON ?auto_149672 ?auto_149676 ) ( not ( = ?auto_149670 ?auto_149676 ) ) ( not ( = ?auto_149671 ?auto_149676 ) ) ( not ( = ?auto_149677 ?auto_149676 ) ) ( not ( = ?auto_149673 ?auto_149676 ) ) ( not ( = ?auto_149678 ?auto_149676 ) ) ( not ( = ?auto_149672 ?auto_149676 ) ) ( not ( = ?auto_149674 ?auto_149676 ) ) ( not ( = ?auto_149675 ?auto_149676 ) ) ( ON ?auto_149674 ?auto_149672 ) ( CLEAR ?auto_149674 ) ( ON-TABLE ?auto_149676 ) ( HOLDING ?auto_149675 ) ( CLEAR ?auto_149678 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149670 ?auto_149671 ?auto_149677 ?auto_149673 ?auto_149678 ?auto_149675 )
      ( MAKE-2PILE ?auto_149670 ?auto_149671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_149679 - BLOCK
      ?auto_149680 - BLOCK
    )
    :vars
    (
      ?auto_149687 - BLOCK
      ?auto_149681 - BLOCK
      ?auto_149682 - BLOCK
      ?auto_149683 - BLOCK
      ?auto_149686 - BLOCK
      ?auto_149684 - BLOCK
      ?auto_149685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149687 ?auto_149680 ) ( ON-TABLE ?auto_149679 ) ( ON ?auto_149680 ?auto_149679 ) ( not ( = ?auto_149679 ?auto_149680 ) ) ( not ( = ?auto_149679 ?auto_149687 ) ) ( not ( = ?auto_149680 ?auto_149687 ) ) ( not ( = ?auto_149679 ?auto_149681 ) ) ( not ( = ?auto_149679 ?auto_149682 ) ) ( not ( = ?auto_149680 ?auto_149681 ) ) ( not ( = ?auto_149680 ?auto_149682 ) ) ( not ( = ?auto_149687 ?auto_149681 ) ) ( not ( = ?auto_149687 ?auto_149682 ) ) ( not ( = ?auto_149681 ?auto_149682 ) ) ( ON ?auto_149681 ?auto_149687 ) ( not ( = ?auto_149683 ?auto_149686 ) ) ( not ( = ?auto_149683 ?auto_149684 ) ) ( not ( = ?auto_149683 ?auto_149682 ) ) ( not ( = ?auto_149686 ?auto_149684 ) ) ( not ( = ?auto_149686 ?auto_149682 ) ) ( not ( = ?auto_149684 ?auto_149682 ) ) ( not ( = ?auto_149679 ?auto_149684 ) ) ( not ( = ?auto_149679 ?auto_149683 ) ) ( not ( = ?auto_149679 ?auto_149686 ) ) ( not ( = ?auto_149680 ?auto_149684 ) ) ( not ( = ?auto_149680 ?auto_149683 ) ) ( not ( = ?auto_149680 ?auto_149686 ) ) ( not ( = ?auto_149687 ?auto_149684 ) ) ( not ( = ?auto_149687 ?auto_149683 ) ) ( not ( = ?auto_149687 ?auto_149686 ) ) ( not ( = ?auto_149681 ?auto_149684 ) ) ( not ( = ?auto_149681 ?auto_149683 ) ) ( not ( = ?auto_149681 ?auto_149686 ) ) ( ON ?auto_149682 ?auto_149681 ) ( ON ?auto_149683 ?auto_149685 ) ( not ( = ?auto_149679 ?auto_149685 ) ) ( not ( = ?auto_149680 ?auto_149685 ) ) ( not ( = ?auto_149687 ?auto_149685 ) ) ( not ( = ?auto_149681 ?auto_149685 ) ) ( not ( = ?auto_149682 ?auto_149685 ) ) ( not ( = ?auto_149683 ?auto_149685 ) ) ( not ( = ?auto_149686 ?auto_149685 ) ) ( not ( = ?auto_149684 ?auto_149685 ) ) ( ON ?auto_149686 ?auto_149683 ) ( ON-TABLE ?auto_149685 ) ( CLEAR ?auto_149682 ) ( ON ?auto_149684 ?auto_149686 ) ( CLEAR ?auto_149684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149685 ?auto_149683 ?auto_149686 )
      ( MAKE-2PILE ?auto_149679 ?auto_149680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149737 - BLOCK
      ?auto_149738 - BLOCK
      ?auto_149739 - BLOCK
      ?auto_149740 - BLOCK
      ?auto_149741 - BLOCK
      ?auto_149742 - BLOCK
    )
    :vars
    (
      ?auto_149743 - BLOCK
      ?auto_149744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149737 ) ( ON ?auto_149738 ?auto_149737 ) ( ON ?auto_149739 ?auto_149738 ) ( ON ?auto_149740 ?auto_149739 ) ( not ( = ?auto_149737 ?auto_149738 ) ) ( not ( = ?auto_149737 ?auto_149739 ) ) ( not ( = ?auto_149737 ?auto_149740 ) ) ( not ( = ?auto_149737 ?auto_149741 ) ) ( not ( = ?auto_149737 ?auto_149742 ) ) ( not ( = ?auto_149738 ?auto_149739 ) ) ( not ( = ?auto_149738 ?auto_149740 ) ) ( not ( = ?auto_149738 ?auto_149741 ) ) ( not ( = ?auto_149738 ?auto_149742 ) ) ( not ( = ?auto_149739 ?auto_149740 ) ) ( not ( = ?auto_149739 ?auto_149741 ) ) ( not ( = ?auto_149739 ?auto_149742 ) ) ( not ( = ?auto_149740 ?auto_149741 ) ) ( not ( = ?auto_149740 ?auto_149742 ) ) ( not ( = ?auto_149741 ?auto_149742 ) ) ( ON ?auto_149742 ?auto_149743 ) ( not ( = ?auto_149737 ?auto_149743 ) ) ( not ( = ?auto_149738 ?auto_149743 ) ) ( not ( = ?auto_149739 ?auto_149743 ) ) ( not ( = ?auto_149740 ?auto_149743 ) ) ( not ( = ?auto_149741 ?auto_149743 ) ) ( not ( = ?auto_149742 ?auto_149743 ) ) ( CLEAR ?auto_149740 ) ( ON ?auto_149741 ?auto_149742 ) ( CLEAR ?auto_149741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149744 ) ( ON ?auto_149743 ?auto_149744 ) ( not ( = ?auto_149744 ?auto_149743 ) ) ( not ( = ?auto_149744 ?auto_149742 ) ) ( not ( = ?auto_149744 ?auto_149741 ) ) ( not ( = ?auto_149737 ?auto_149744 ) ) ( not ( = ?auto_149738 ?auto_149744 ) ) ( not ( = ?auto_149739 ?auto_149744 ) ) ( not ( = ?auto_149740 ?auto_149744 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149744 ?auto_149743 ?auto_149742 )
      ( MAKE-6PILE ?auto_149737 ?auto_149738 ?auto_149739 ?auto_149740 ?auto_149741 ?auto_149742 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149745 - BLOCK
      ?auto_149746 - BLOCK
      ?auto_149747 - BLOCK
      ?auto_149748 - BLOCK
      ?auto_149749 - BLOCK
      ?auto_149750 - BLOCK
    )
    :vars
    (
      ?auto_149751 - BLOCK
      ?auto_149752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149745 ) ( ON ?auto_149746 ?auto_149745 ) ( ON ?auto_149747 ?auto_149746 ) ( not ( = ?auto_149745 ?auto_149746 ) ) ( not ( = ?auto_149745 ?auto_149747 ) ) ( not ( = ?auto_149745 ?auto_149748 ) ) ( not ( = ?auto_149745 ?auto_149749 ) ) ( not ( = ?auto_149745 ?auto_149750 ) ) ( not ( = ?auto_149746 ?auto_149747 ) ) ( not ( = ?auto_149746 ?auto_149748 ) ) ( not ( = ?auto_149746 ?auto_149749 ) ) ( not ( = ?auto_149746 ?auto_149750 ) ) ( not ( = ?auto_149747 ?auto_149748 ) ) ( not ( = ?auto_149747 ?auto_149749 ) ) ( not ( = ?auto_149747 ?auto_149750 ) ) ( not ( = ?auto_149748 ?auto_149749 ) ) ( not ( = ?auto_149748 ?auto_149750 ) ) ( not ( = ?auto_149749 ?auto_149750 ) ) ( ON ?auto_149750 ?auto_149751 ) ( not ( = ?auto_149745 ?auto_149751 ) ) ( not ( = ?auto_149746 ?auto_149751 ) ) ( not ( = ?auto_149747 ?auto_149751 ) ) ( not ( = ?auto_149748 ?auto_149751 ) ) ( not ( = ?auto_149749 ?auto_149751 ) ) ( not ( = ?auto_149750 ?auto_149751 ) ) ( ON ?auto_149749 ?auto_149750 ) ( CLEAR ?auto_149749 ) ( ON-TABLE ?auto_149752 ) ( ON ?auto_149751 ?auto_149752 ) ( not ( = ?auto_149752 ?auto_149751 ) ) ( not ( = ?auto_149752 ?auto_149750 ) ) ( not ( = ?auto_149752 ?auto_149749 ) ) ( not ( = ?auto_149745 ?auto_149752 ) ) ( not ( = ?auto_149746 ?auto_149752 ) ) ( not ( = ?auto_149747 ?auto_149752 ) ) ( not ( = ?auto_149748 ?auto_149752 ) ) ( HOLDING ?auto_149748 ) ( CLEAR ?auto_149747 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149745 ?auto_149746 ?auto_149747 ?auto_149748 )
      ( MAKE-6PILE ?auto_149745 ?auto_149746 ?auto_149747 ?auto_149748 ?auto_149749 ?auto_149750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149753 - BLOCK
      ?auto_149754 - BLOCK
      ?auto_149755 - BLOCK
      ?auto_149756 - BLOCK
      ?auto_149757 - BLOCK
      ?auto_149758 - BLOCK
    )
    :vars
    (
      ?auto_149759 - BLOCK
      ?auto_149760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149753 ) ( ON ?auto_149754 ?auto_149753 ) ( ON ?auto_149755 ?auto_149754 ) ( not ( = ?auto_149753 ?auto_149754 ) ) ( not ( = ?auto_149753 ?auto_149755 ) ) ( not ( = ?auto_149753 ?auto_149756 ) ) ( not ( = ?auto_149753 ?auto_149757 ) ) ( not ( = ?auto_149753 ?auto_149758 ) ) ( not ( = ?auto_149754 ?auto_149755 ) ) ( not ( = ?auto_149754 ?auto_149756 ) ) ( not ( = ?auto_149754 ?auto_149757 ) ) ( not ( = ?auto_149754 ?auto_149758 ) ) ( not ( = ?auto_149755 ?auto_149756 ) ) ( not ( = ?auto_149755 ?auto_149757 ) ) ( not ( = ?auto_149755 ?auto_149758 ) ) ( not ( = ?auto_149756 ?auto_149757 ) ) ( not ( = ?auto_149756 ?auto_149758 ) ) ( not ( = ?auto_149757 ?auto_149758 ) ) ( ON ?auto_149758 ?auto_149759 ) ( not ( = ?auto_149753 ?auto_149759 ) ) ( not ( = ?auto_149754 ?auto_149759 ) ) ( not ( = ?auto_149755 ?auto_149759 ) ) ( not ( = ?auto_149756 ?auto_149759 ) ) ( not ( = ?auto_149757 ?auto_149759 ) ) ( not ( = ?auto_149758 ?auto_149759 ) ) ( ON ?auto_149757 ?auto_149758 ) ( ON-TABLE ?auto_149760 ) ( ON ?auto_149759 ?auto_149760 ) ( not ( = ?auto_149760 ?auto_149759 ) ) ( not ( = ?auto_149760 ?auto_149758 ) ) ( not ( = ?auto_149760 ?auto_149757 ) ) ( not ( = ?auto_149753 ?auto_149760 ) ) ( not ( = ?auto_149754 ?auto_149760 ) ) ( not ( = ?auto_149755 ?auto_149760 ) ) ( not ( = ?auto_149756 ?auto_149760 ) ) ( CLEAR ?auto_149755 ) ( ON ?auto_149756 ?auto_149757 ) ( CLEAR ?auto_149756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149760 ?auto_149759 ?auto_149758 ?auto_149757 )
      ( MAKE-6PILE ?auto_149753 ?auto_149754 ?auto_149755 ?auto_149756 ?auto_149757 ?auto_149758 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149761 - BLOCK
      ?auto_149762 - BLOCK
      ?auto_149763 - BLOCK
      ?auto_149764 - BLOCK
      ?auto_149765 - BLOCK
      ?auto_149766 - BLOCK
    )
    :vars
    (
      ?auto_149768 - BLOCK
      ?auto_149767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149761 ) ( ON ?auto_149762 ?auto_149761 ) ( not ( = ?auto_149761 ?auto_149762 ) ) ( not ( = ?auto_149761 ?auto_149763 ) ) ( not ( = ?auto_149761 ?auto_149764 ) ) ( not ( = ?auto_149761 ?auto_149765 ) ) ( not ( = ?auto_149761 ?auto_149766 ) ) ( not ( = ?auto_149762 ?auto_149763 ) ) ( not ( = ?auto_149762 ?auto_149764 ) ) ( not ( = ?auto_149762 ?auto_149765 ) ) ( not ( = ?auto_149762 ?auto_149766 ) ) ( not ( = ?auto_149763 ?auto_149764 ) ) ( not ( = ?auto_149763 ?auto_149765 ) ) ( not ( = ?auto_149763 ?auto_149766 ) ) ( not ( = ?auto_149764 ?auto_149765 ) ) ( not ( = ?auto_149764 ?auto_149766 ) ) ( not ( = ?auto_149765 ?auto_149766 ) ) ( ON ?auto_149766 ?auto_149768 ) ( not ( = ?auto_149761 ?auto_149768 ) ) ( not ( = ?auto_149762 ?auto_149768 ) ) ( not ( = ?auto_149763 ?auto_149768 ) ) ( not ( = ?auto_149764 ?auto_149768 ) ) ( not ( = ?auto_149765 ?auto_149768 ) ) ( not ( = ?auto_149766 ?auto_149768 ) ) ( ON ?auto_149765 ?auto_149766 ) ( ON-TABLE ?auto_149767 ) ( ON ?auto_149768 ?auto_149767 ) ( not ( = ?auto_149767 ?auto_149768 ) ) ( not ( = ?auto_149767 ?auto_149766 ) ) ( not ( = ?auto_149767 ?auto_149765 ) ) ( not ( = ?auto_149761 ?auto_149767 ) ) ( not ( = ?auto_149762 ?auto_149767 ) ) ( not ( = ?auto_149763 ?auto_149767 ) ) ( not ( = ?auto_149764 ?auto_149767 ) ) ( ON ?auto_149764 ?auto_149765 ) ( CLEAR ?auto_149764 ) ( HOLDING ?auto_149763 ) ( CLEAR ?auto_149762 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149761 ?auto_149762 ?auto_149763 )
      ( MAKE-6PILE ?auto_149761 ?auto_149762 ?auto_149763 ?auto_149764 ?auto_149765 ?auto_149766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149769 - BLOCK
      ?auto_149770 - BLOCK
      ?auto_149771 - BLOCK
      ?auto_149772 - BLOCK
      ?auto_149773 - BLOCK
      ?auto_149774 - BLOCK
    )
    :vars
    (
      ?auto_149776 - BLOCK
      ?auto_149775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149769 ) ( ON ?auto_149770 ?auto_149769 ) ( not ( = ?auto_149769 ?auto_149770 ) ) ( not ( = ?auto_149769 ?auto_149771 ) ) ( not ( = ?auto_149769 ?auto_149772 ) ) ( not ( = ?auto_149769 ?auto_149773 ) ) ( not ( = ?auto_149769 ?auto_149774 ) ) ( not ( = ?auto_149770 ?auto_149771 ) ) ( not ( = ?auto_149770 ?auto_149772 ) ) ( not ( = ?auto_149770 ?auto_149773 ) ) ( not ( = ?auto_149770 ?auto_149774 ) ) ( not ( = ?auto_149771 ?auto_149772 ) ) ( not ( = ?auto_149771 ?auto_149773 ) ) ( not ( = ?auto_149771 ?auto_149774 ) ) ( not ( = ?auto_149772 ?auto_149773 ) ) ( not ( = ?auto_149772 ?auto_149774 ) ) ( not ( = ?auto_149773 ?auto_149774 ) ) ( ON ?auto_149774 ?auto_149776 ) ( not ( = ?auto_149769 ?auto_149776 ) ) ( not ( = ?auto_149770 ?auto_149776 ) ) ( not ( = ?auto_149771 ?auto_149776 ) ) ( not ( = ?auto_149772 ?auto_149776 ) ) ( not ( = ?auto_149773 ?auto_149776 ) ) ( not ( = ?auto_149774 ?auto_149776 ) ) ( ON ?auto_149773 ?auto_149774 ) ( ON-TABLE ?auto_149775 ) ( ON ?auto_149776 ?auto_149775 ) ( not ( = ?auto_149775 ?auto_149776 ) ) ( not ( = ?auto_149775 ?auto_149774 ) ) ( not ( = ?auto_149775 ?auto_149773 ) ) ( not ( = ?auto_149769 ?auto_149775 ) ) ( not ( = ?auto_149770 ?auto_149775 ) ) ( not ( = ?auto_149771 ?auto_149775 ) ) ( not ( = ?auto_149772 ?auto_149775 ) ) ( ON ?auto_149772 ?auto_149773 ) ( CLEAR ?auto_149770 ) ( ON ?auto_149771 ?auto_149772 ) ( CLEAR ?auto_149771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149775 ?auto_149776 ?auto_149774 ?auto_149773 ?auto_149772 )
      ( MAKE-6PILE ?auto_149769 ?auto_149770 ?auto_149771 ?auto_149772 ?auto_149773 ?auto_149774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149777 - BLOCK
      ?auto_149778 - BLOCK
      ?auto_149779 - BLOCK
      ?auto_149780 - BLOCK
      ?auto_149781 - BLOCK
      ?auto_149782 - BLOCK
    )
    :vars
    (
      ?auto_149783 - BLOCK
      ?auto_149784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149777 ) ( not ( = ?auto_149777 ?auto_149778 ) ) ( not ( = ?auto_149777 ?auto_149779 ) ) ( not ( = ?auto_149777 ?auto_149780 ) ) ( not ( = ?auto_149777 ?auto_149781 ) ) ( not ( = ?auto_149777 ?auto_149782 ) ) ( not ( = ?auto_149778 ?auto_149779 ) ) ( not ( = ?auto_149778 ?auto_149780 ) ) ( not ( = ?auto_149778 ?auto_149781 ) ) ( not ( = ?auto_149778 ?auto_149782 ) ) ( not ( = ?auto_149779 ?auto_149780 ) ) ( not ( = ?auto_149779 ?auto_149781 ) ) ( not ( = ?auto_149779 ?auto_149782 ) ) ( not ( = ?auto_149780 ?auto_149781 ) ) ( not ( = ?auto_149780 ?auto_149782 ) ) ( not ( = ?auto_149781 ?auto_149782 ) ) ( ON ?auto_149782 ?auto_149783 ) ( not ( = ?auto_149777 ?auto_149783 ) ) ( not ( = ?auto_149778 ?auto_149783 ) ) ( not ( = ?auto_149779 ?auto_149783 ) ) ( not ( = ?auto_149780 ?auto_149783 ) ) ( not ( = ?auto_149781 ?auto_149783 ) ) ( not ( = ?auto_149782 ?auto_149783 ) ) ( ON ?auto_149781 ?auto_149782 ) ( ON-TABLE ?auto_149784 ) ( ON ?auto_149783 ?auto_149784 ) ( not ( = ?auto_149784 ?auto_149783 ) ) ( not ( = ?auto_149784 ?auto_149782 ) ) ( not ( = ?auto_149784 ?auto_149781 ) ) ( not ( = ?auto_149777 ?auto_149784 ) ) ( not ( = ?auto_149778 ?auto_149784 ) ) ( not ( = ?auto_149779 ?auto_149784 ) ) ( not ( = ?auto_149780 ?auto_149784 ) ) ( ON ?auto_149780 ?auto_149781 ) ( ON ?auto_149779 ?auto_149780 ) ( CLEAR ?auto_149779 ) ( HOLDING ?auto_149778 ) ( CLEAR ?auto_149777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149777 ?auto_149778 )
      ( MAKE-6PILE ?auto_149777 ?auto_149778 ?auto_149779 ?auto_149780 ?auto_149781 ?auto_149782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149785 - BLOCK
      ?auto_149786 - BLOCK
      ?auto_149787 - BLOCK
      ?auto_149788 - BLOCK
      ?auto_149789 - BLOCK
      ?auto_149790 - BLOCK
    )
    :vars
    (
      ?auto_149791 - BLOCK
      ?auto_149792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149785 ) ( not ( = ?auto_149785 ?auto_149786 ) ) ( not ( = ?auto_149785 ?auto_149787 ) ) ( not ( = ?auto_149785 ?auto_149788 ) ) ( not ( = ?auto_149785 ?auto_149789 ) ) ( not ( = ?auto_149785 ?auto_149790 ) ) ( not ( = ?auto_149786 ?auto_149787 ) ) ( not ( = ?auto_149786 ?auto_149788 ) ) ( not ( = ?auto_149786 ?auto_149789 ) ) ( not ( = ?auto_149786 ?auto_149790 ) ) ( not ( = ?auto_149787 ?auto_149788 ) ) ( not ( = ?auto_149787 ?auto_149789 ) ) ( not ( = ?auto_149787 ?auto_149790 ) ) ( not ( = ?auto_149788 ?auto_149789 ) ) ( not ( = ?auto_149788 ?auto_149790 ) ) ( not ( = ?auto_149789 ?auto_149790 ) ) ( ON ?auto_149790 ?auto_149791 ) ( not ( = ?auto_149785 ?auto_149791 ) ) ( not ( = ?auto_149786 ?auto_149791 ) ) ( not ( = ?auto_149787 ?auto_149791 ) ) ( not ( = ?auto_149788 ?auto_149791 ) ) ( not ( = ?auto_149789 ?auto_149791 ) ) ( not ( = ?auto_149790 ?auto_149791 ) ) ( ON ?auto_149789 ?auto_149790 ) ( ON-TABLE ?auto_149792 ) ( ON ?auto_149791 ?auto_149792 ) ( not ( = ?auto_149792 ?auto_149791 ) ) ( not ( = ?auto_149792 ?auto_149790 ) ) ( not ( = ?auto_149792 ?auto_149789 ) ) ( not ( = ?auto_149785 ?auto_149792 ) ) ( not ( = ?auto_149786 ?auto_149792 ) ) ( not ( = ?auto_149787 ?auto_149792 ) ) ( not ( = ?auto_149788 ?auto_149792 ) ) ( ON ?auto_149788 ?auto_149789 ) ( ON ?auto_149787 ?auto_149788 ) ( CLEAR ?auto_149785 ) ( ON ?auto_149786 ?auto_149787 ) ( CLEAR ?auto_149786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149792 ?auto_149791 ?auto_149790 ?auto_149789 ?auto_149788 ?auto_149787 )
      ( MAKE-6PILE ?auto_149785 ?auto_149786 ?auto_149787 ?auto_149788 ?auto_149789 ?auto_149790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149793 - BLOCK
      ?auto_149794 - BLOCK
      ?auto_149795 - BLOCK
      ?auto_149796 - BLOCK
      ?auto_149797 - BLOCK
      ?auto_149798 - BLOCK
    )
    :vars
    (
      ?auto_149800 - BLOCK
      ?auto_149799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149793 ?auto_149794 ) ) ( not ( = ?auto_149793 ?auto_149795 ) ) ( not ( = ?auto_149793 ?auto_149796 ) ) ( not ( = ?auto_149793 ?auto_149797 ) ) ( not ( = ?auto_149793 ?auto_149798 ) ) ( not ( = ?auto_149794 ?auto_149795 ) ) ( not ( = ?auto_149794 ?auto_149796 ) ) ( not ( = ?auto_149794 ?auto_149797 ) ) ( not ( = ?auto_149794 ?auto_149798 ) ) ( not ( = ?auto_149795 ?auto_149796 ) ) ( not ( = ?auto_149795 ?auto_149797 ) ) ( not ( = ?auto_149795 ?auto_149798 ) ) ( not ( = ?auto_149796 ?auto_149797 ) ) ( not ( = ?auto_149796 ?auto_149798 ) ) ( not ( = ?auto_149797 ?auto_149798 ) ) ( ON ?auto_149798 ?auto_149800 ) ( not ( = ?auto_149793 ?auto_149800 ) ) ( not ( = ?auto_149794 ?auto_149800 ) ) ( not ( = ?auto_149795 ?auto_149800 ) ) ( not ( = ?auto_149796 ?auto_149800 ) ) ( not ( = ?auto_149797 ?auto_149800 ) ) ( not ( = ?auto_149798 ?auto_149800 ) ) ( ON ?auto_149797 ?auto_149798 ) ( ON-TABLE ?auto_149799 ) ( ON ?auto_149800 ?auto_149799 ) ( not ( = ?auto_149799 ?auto_149800 ) ) ( not ( = ?auto_149799 ?auto_149798 ) ) ( not ( = ?auto_149799 ?auto_149797 ) ) ( not ( = ?auto_149793 ?auto_149799 ) ) ( not ( = ?auto_149794 ?auto_149799 ) ) ( not ( = ?auto_149795 ?auto_149799 ) ) ( not ( = ?auto_149796 ?auto_149799 ) ) ( ON ?auto_149796 ?auto_149797 ) ( ON ?auto_149795 ?auto_149796 ) ( ON ?auto_149794 ?auto_149795 ) ( CLEAR ?auto_149794 ) ( HOLDING ?auto_149793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149793 )
      ( MAKE-6PILE ?auto_149793 ?auto_149794 ?auto_149795 ?auto_149796 ?auto_149797 ?auto_149798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149801 - BLOCK
      ?auto_149802 - BLOCK
      ?auto_149803 - BLOCK
      ?auto_149804 - BLOCK
      ?auto_149805 - BLOCK
      ?auto_149806 - BLOCK
    )
    :vars
    (
      ?auto_149808 - BLOCK
      ?auto_149807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149801 ?auto_149802 ) ) ( not ( = ?auto_149801 ?auto_149803 ) ) ( not ( = ?auto_149801 ?auto_149804 ) ) ( not ( = ?auto_149801 ?auto_149805 ) ) ( not ( = ?auto_149801 ?auto_149806 ) ) ( not ( = ?auto_149802 ?auto_149803 ) ) ( not ( = ?auto_149802 ?auto_149804 ) ) ( not ( = ?auto_149802 ?auto_149805 ) ) ( not ( = ?auto_149802 ?auto_149806 ) ) ( not ( = ?auto_149803 ?auto_149804 ) ) ( not ( = ?auto_149803 ?auto_149805 ) ) ( not ( = ?auto_149803 ?auto_149806 ) ) ( not ( = ?auto_149804 ?auto_149805 ) ) ( not ( = ?auto_149804 ?auto_149806 ) ) ( not ( = ?auto_149805 ?auto_149806 ) ) ( ON ?auto_149806 ?auto_149808 ) ( not ( = ?auto_149801 ?auto_149808 ) ) ( not ( = ?auto_149802 ?auto_149808 ) ) ( not ( = ?auto_149803 ?auto_149808 ) ) ( not ( = ?auto_149804 ?auto_149808 ) ) ( not ( = ?auto_149805 ?auto_149808 ) ) ( not ( = ?auto_149806 ?auto_149808 ) ) ( ON ?auto_149805 ?auto_149806 ) ( ON-TABLE ?auto_149807 ) ( ON ?auto_149808 ?auto_149807 ) ( not ( = ?auto_149807 ?auto_149808 ) ) ( not ( = ?auto_149807 ?auto_149806 ) ) ( not ( = ?auto_149807 ?auto_149805 ) ) ( not ( = ?auto_149801 ?auto_149807 ) ) ( not ( = ?auto_149802 ?auto_149807 ) ) ( not ( = ?auto_149803 ?auto_149807 ) ) ( not ( = ?auto_149804 ?auto_149807 ) ) ( ON ?auto_149804 ?auto_149805 ) ( ON ?auto_149803 ?auto_149804 ) ( ON ?auto_149802 ?auto_149803 ) ( ON ?auto_149801 ?auto_149802 ) ( CLEAR ?auto_149801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149807 ?auto_149808 ?auto_149806 ?auto_149805 ?auto_149804 ?auto_149803 ?auto_149802 )
      ( MAKE-6PILE ?auto_149801 ?auto_149802 ?auto_149803 ?auto_149804 ?auto_149805 ?auto_149806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149815 - BLOCK
      ?auto_149816 - BLOCK
      ?auto_149817 - BLOCK
      ?auto_149818 - BLOCK
      ?auto_149819 - BLOCK
      ?auto_149820 - BLOCK
    )
    :vars
    (
      ?auto_149822 - BLOCK
      ?auto_149821 - BLOCK
      ?auto_149823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149815 ?auto_149816 ) ) ( not ( = ?auto_149815 ?auto_149817 ) ) ( not ( = ?auto_149815 ?auto_149818 ) ) ( not ( = ?auto_149815 ?auto_149819 ) ) ( not ( = ?auto_149815 ?auto_149820 ) ) ( not ( = ?auto_149816 ?auto_149817 ) ) ( not ( = ?auto_149816 ?auto_149818 ) ) ( not ( = ?auto_149816 ?auto_149819 ) ) ( not ( = ?auto_149816 ?auto_149820 ) ) ( not ( = ?auto_149817 ?auto_149818 ) ) ( not ( = ?auto_149817 ?auto_149819 ) ) ( not ( = ?auto_149817 ?auto_149820 ) ) ( not ( = ?auto_149818 ?auto_149819 ) ) ( not ( = ?auto_149818 ?auto_149820 ) ) ( not ( = ?auto_149819 ?auto_149820 ) ) ( ON ?auto_149820 ?auto_149822 ) ( not ( = ?auto_149815 ?auto_149822 ) ) ( not ( = ?auto_149816 ?auto_149822 ) ) ( not ( = ?auto_149817 ?auto_149822 ) ) ( not ( = ?auto_149818 ?auto_149822 ) ) ( not ( = ?auto_149819 ?auto_149822 ) ) ( not ( = ?auto_149820 ?auto_149822 ) ) ( ON ?auto_149819 ?auto_149820 ) ( ON-TABLE ?auto_149821 ) ( ON ?auto_149822 ?auto_149821 ) ( not ( = ?auto_149821 ?auto_149822 ) ) ( not ( = ?auto_149821 ?auto_149820 ) ) ( not ( = ?auto_149821 ?auto_149819 ) ) ( not ( = ?auto_149815 ?auto_149821 ) ) ( not ( = ?auto_149816 ?auto_149821 ) ) ( not ( = ?auto_149817 ?auto_149821 ) ) ( not ( = ?auto_149818 ?auto_149821 ) ) ( ON ?auto_149818 ?auto_149819 ) ( ON ?auto_149817 ?auto_149818 ) ( ON ?auto_149816 ?auto_149817 ) ( CLEAR ?auto_149816 ) ( ON ?auto_149815 ?auto_149823 ) ( CLEAR ?auto_149815 ) ( HAND-EMPTY ) ( not ( = ?auto_149815 ?auto_149823 ) ) ( not ( = ?auto_149816 ?auto_149823 ) ) ( not ( = ?auto_149817 ?auto_149823 ) ) ( not ( = ?auto_149818 ?auto_149823 ) ) ( not ( = ?auto_149819 ?auto_149823 ) ) ( not ( = ?auto_149820 ?auto_149823 ) ) ( not ( = ?auto_149822 ?auto_149823 ) ) ( not ( = ?auto_149821 ?auto_149823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149815 ?auto_149823 )
      ( MAKE-6PILE ?auto_149815 ?auto_149816 ?auto_149817 ?auto_149818 ?auto_149819 ?auto_149820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149824 - BLOCK
      ?auto_149825 - BLOCK
      ?auto_149826 - BLOCK
      ?auto_149827 - BLOCK
      ?auto_149828 - BLOCK
      ?auto_149829 - BLOCK
    )
    :vars
    (
      ?auto_149831 - BLOCK
      ?auto_149830 - BLOCK
      ?auto_149832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149824 ?auto_149825 ) ) ( not ( = ?auto_149824 ?auto_149826 ) ) ( not ( = ?auto_149824 ?auto_149827 ) ) ( not ( = ?auto_149824 ?auto_149828 ) ) ( not ( = ?auto_149824 ?auto_149829 ) ) ( not ( = ?auto_149825 ?auto_149826 ) ) ( not ( = ?auto_149825 ?auto_149827 ) ) ( not ( = ?auto_149825 ?auto_149828 ) ) ( not ( = ?auto_149825 ?auto_149829 ) ) ( not ( = ?auto_149826 ?auto_149827 ) ) ( not ( = ?auto_149826 ?auto_149828 ) ) ( not ( = ?auto_149826 ?auto_149829 ) ) ( not ( = ?auto_149827 ?auto_149828 ) ) ( not ( = ?auto_149827 ?auto_149829 ) ) ( not ( = ?auto_149828 ?auto_149829 ) ) ( ON ?auto_149829 ?auto_149831 ) ( not ( = ?auto_149824 ?auto_149831 ) ) ( not ( = ?auto_149825 ?auto_149831 ) ) ( not ( = ?auto_149826 ?auto_149831 ) ) ( not ( = ?auto_149827 ?auto_149831 ) ) ( not ( = ?auto_149828 ?auto_149831 ) ) ( not ( = ?auto_149829 ?auto_149831 ) ) ( ON ?auto_149828 ?auto_149829 ) ( ON-TABLE ?auto_149830 ) ( ON ?auto_149831 ?auto_149830 ) ( not ( = ?auto_149830 ?auto_149831 ) ) ( not ( = ?auto_149830 ?auto_149829 ) ) ( not ( = ?auto_149830 ?auto_149828 ) ) ( not ( = ?auto_149824 ?auto_149830 ) ) ( not ( = ?auto_149825 ?auto_149830 ) ) ( not ( = ?auto_149826 ?auto_149830 ) ) ( not ( = ?auto_149827 ?auto_149830 ) ) ( ON ?auto_149827 ?auto_149828 ) ( ON ?auto_149826 ?auto_149827 ) ( ON ?auto_149824 ?auto_149832 ) ( CLEAR ?auto_149824 ) ( not ( = ?auto_149824 ?auto_149832 ) ) ( not ( = ?auto_149825 ?auto_149832 ) ) ( not ( = ?auto_149826 ?auto_149832 ) ) ( not ( = ?auto_149827 ?auto_149832 ) ) ( not ( = ?auto_149828 ?auto_149832 ) ) ( not ( = ?auto_149829 ?auto_149832 ) ) ( not ( = ?auto_149831 ?auto_149832 ) ) ( not ( = ?auto_149830 ?auto_149832 ) ) ( HOLDING ?auto_149825 ) ( CLEAR ?auto_149826 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149830 ?auto_149831 ?auto_149829 ?auto_149828 ?auto_149827 ?auto_149826 ?auto_149825 )
      ( MAKE-6PILE ?auto_149824 ?auto_149825 ?auto_149826 ?auto_149827 ?auto_149828 ?auto_149829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149833 - BLOCK
      ?auto_149834 - BLOCK
      ?auto_149835 - BLOCK
      ?auto_149836 - BLOCK
      ?auto_149837 - BLOCK
      ?auto_149838 - BLOCK
    )
    :vars
    (
      ?auto_149840 - BLOCK
      ?auto_149841 - BLOCK
      ?auto_149839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149833 ?auto_149834 ) ) ( not ( = ?auto_149833 ?auto_149835 ) ) ( not ( = ?auto_149833 ?auto_149836 ) ) ( not ( = ?auto_149833 ?auto_149837 ) ) ( not ( = ?auto_149833 ?auto_149838 ) ) ( not ( = ?auto_149834 ?auto_149835 ) ) ( not ( = ?auto_149834 ?auto_149836 ) ) ( not ( = ?auto_149834 ?auto_149837 ) ) ( not ( = ?auto_149834 ?auto_149838 ) ) ( not ( = ?auto_149835 ?auto_149836 ) ) ( not ( = ?auto_149835 ?auto_149837 ) ) ( not ( = ?auto_149835 ?auto_149838 ) ) ( not ( = ?auto_149836 ?auto_149837 ) ) ( not ( = ?auto_149836 ?auto_149838 ) ) ( not ( = ?auto_149837 ?auto_149838 ) ) ( ON ?auto_149838 ?auto_149840 ) ( not ( = ?auto_149833 ?auto_149840 ) ) ( not ( = ?auto_149834 ?auto_149840 ) ) ( not ( = ?auto_149835 ?auto_149840 ) ) ( not ( = ?auto_149836 ?auto_149840 ) ) ( not ( = ?auto_149837 ?auto_149840 ) ) ( not ( = ?auto_149838 ?auto_149840 ) ) ( ON ?auto_149837 ?auto_149838 ) ( ON-TABLE ?auto_149841 ) ( ON ?auto_149840 ?auto_149841 ) ( not ( = ?auto_149841 ?auto_149840 ) ) ( not ( = ?auto_149841 ?auto_149838 ) ) ( not ( = ?auto_149841 ?auto_149837 ) ) ( not ( = ?auto_149833 ?auto_149841 ) ) ( not ( = ?auto_149834 ?auto_149841 ) ) ( not ( = ?auto_149835 ?auto_149841 ) ) ( not ( = ?auto_149836 ?auto_149841 ) ) ( ON ?auto_149836 ?auto_149837 ) ( ON ?auto_149835 ?auto_149836 ) ( ON ?auto_149833 ?auto_149839 ) ( not ( = ?auto_149833 ?auto_149839 ) ) ( not ( = ?auto_149834 ?auto_149839 ) ) ( not ( = ?auto_149835 ?auto_149839 ) ) ( not ( = ?auto_149836 ?auto_149839 ) ) ( not ( = ?auto_149837 ?auto_149839 ) ) ( not ( = ?auto_149838 ?auto_149839 ) ) ( not ( = ?auto_149840 ?auto_149839 ) ) ( not ( = ?auto_149841 ?auto_149839 ) ) ( CLEAR ?auto_149835 ) ( ON ?auto_149834 ?auto_149833 ) ( CLEAR ?auto_149834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149839 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149839 ?auto_149833 )
      ( MAKE-6PILE ?auto_149833 ?auto_149834 ?auto_149835 ?auto_149836 ?auto_149837 ?auto_149838 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149842 - BLOCK
      ?auto_149843 - BLOCK
      ?auto_149844 - BLOCK
      ?auto_149845 - BLOCK
      ?auto_149846 - BLOCK
      ?auto_149847 - BLOCK
    )
    :vars
    (
      ?auto_149850 - BLOCK
      ?auto_149848 - BLOCK
      ?auto_149849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149842 ?auto_149843 ) ) ( not ( = ?auto_149842 ?auto_149844 ) ) ( not ( = ?auto_149842 ?auto_149845 ) ) ( not ( = ?auto_149842 ?auto_149846 ) ) ( not ( = ?auto_149842 ?auto_149847 ) ) ( not ( = ?auto_149843 ?auto_149844 ) ) ( not ( = ?auto_149843 ?auto_149845 ) ) ( not ( = ?auto_149843 ?auto_149846 ) ) ( not ( = ?auto_149843 ?auto_149847 ) ) ( not ( = ?auto_149844 ?auto_149845 ) ) ( not ( = ?auto_149844 ?auto_149846 ) ) ( not ( = ?auto_149844 ?auto_149847 ) ) ( not ( = ?auto_149845 ?auto_149846 ) ) ( not ( = ?auto_149845 ?auto_149847 ) ) ( not ( = ?auto_149846 ?auto_149847 ) ) ( ON ?auto_149847 ?auto_149850 ) ( not ( = ?auto_149842 ?auto_149850 ) ) ( not ( = ?auto_149843 ?auto_149850 ) ) ( not ( = ?auto_149844 ?auto_149850 ) ) ( not ( = ?auto_149845 ?auto_149850 ) ) ( not ( = ?auto_149846 ?auto_149850 ) ) ( not ( = ?auto_149847 ?auto_149850 ) ) ( ON ?auto_149846 ?auto_149847 ) ( ON-TABLE ?auto_149848 ) ( ON ?auto_149850 ?auto_149848 ) ( not ( = ?auto_149848 ?auto_149850 ) ) ( not ( = ?auto_149848 ?auto_149847 ) ) ( not ( = ?auto_149848 ?auto_149846 ) ) ( not ( = ?auto_149842 ?auto_149848 ) ) ( not ( = ?auto_149843 ?auto_149848 ) ) ( not ( = ?auto_149844 ?auto_149848 ) ) ( not ( = ?auto_149845 ?auto_149848 ) ) ( ON ?auto_149845 ?auto_149846 ) ( ON ?auto_149842 ?auto_149849 ) ( not ( = ?auto_149842 ?auto_149849 ) ) ( not ( = ?auto_149843 ?auto_149849 ) ) ( not ( = ?auto_149844 ?auto_149849 ) ) ( not ( = ?auto_149845 ?auto_149849 ) ) ( not ( = ?auto_149846 ?auto_149849 ) ) ( not ( = ?auto_149847 ?auto_149849 ) ) ( not ( = ?auto_149850 ?auto_149849 ) ) ( not ( = ?auto_149848 ?auto_149849 ) ) ( ON ?auto_149843 ?auto_149842 ) ( CLEAR ?auto_149843 ) ( ON-TABLE ?auto_149849 ) ( HOLDING ?auto_149844 ) ( CLEAR ?auto_149845 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149848 ?auto_149850 ?auto_149847 ?auto_149846 ?auto_149845 ?auto_149844 )
      ( MAKE-6PILE ?auto_149842 ?auto_149843 ?auto_149844 ?auto_149845 ?auto_149846 ?auto_149847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149851 - BLOCK
      ?auto_149852 - BLOCK
      ?auto_149853 - BLOCK
      ?auto_149854 - BLOCK
      ?auto_149855 - BLOCK
      ?auto_149856 - BLOCK
    )
    :vars
    (
      ?auto_149857 - BLOCK
      ?auto_149859 - BLOCK
      ?auto_149858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149851 ?auto_149852 ) ) ( not ( = ?auto_149851 ?auto_149853 ) ) ( not ( = ?auto_149851 ?auto_149854 ) ) ( not ( = ?auto_149851 ?auto_149855 ) ) ( not ( = ?auto_149851 ?auto_149856 ) ) ( not ( = ?auto_149852 ?auto_149853 ) ) ( not ( = ?auto_149852 ?auto_149854 ) ) ( not ( = ?auto_149852 ?auto_149855 ) ) ( not ( = ?auto_149852 ?auto_149856 ) ) ( not ( = ?auto_149853 ?auto_149854 ) ) ( not ( = ?auto_149853 ?auto_149855 ) ) ( not ( = ?auto_149853 ?auto_149856 ) ) ( not ( = ?auto_149854 ?auto_149855 ) ) ( not ( = ?auto_149854 ?auto_149856 ) ) ( not ( = ?auto_149855 ?auto_149856 ) ) ( ON ?auto_149856 ?auto_149857 ) ( not ( = ?auto_149851 ?auto_149857 ) ) ( not ( = ?auto_149852 ?auto_149857 ) ) ( not ( = ?auto_149853 ?auto_149857 ) ) ( not ( = ?auto_149854 ?auto_149857 ) ) ( not ( = ?auto_149855 ?auto_149857 ) ) ( not ( = ?auto_149856 ?auto_149857 ) ) ( ON ?auto_149855 ?auto_149856 ) ( ON-TABLE ?auto_149859 ) ( ON ?auto_149857 ?auto_149859 ) ( not ( = ?auto_149859 ?auto_149857 ) ) ( not ( = ?auto_149859 ?auto_149856 ) ) ( not ( = ?auto_149859 ?auto_149855 ) ) ( not ( = ?auto_149851 ?auto_149859 ) ) ( not ( = ?auto_149852 ?auto_149859 ) ) ( not ( = ?auto_149853 ?auto_149859 ) ) ( not ( = ?auto_149854 ?auto_149859 ) ) ( ON ?auto_149854 ?auto_149855 ) ( ON ?auto_149851 ?auto_149858 ) ( not ( = ?auto_149851 ?auto_149858 ) ) ( not ( = ?auto_149852 ?auto_149858 ) ) ( not ( = ?auto_149853 ?auto_149858 ) ) ( not ( = ?auto_149854 ?auto_149858 ) ) ( not ( = ?auto_149855 ?auto_149858 ) ) ( not ( = ?auto_149856 ?auto_149858 ) ) ( not ( = ?auto_149857 ?auto_149858 ) ) ( not ( = ?auto_149859 ?auto_149858 ) ) ( ON ?auto_149852 ?auto_149851 ) ( ON-TABLE ?auto_149858 ) ( CLEAR ?auto_149854 ) ( ON ?auto_149853 ?auto_149852 ) ( CLEAR ?auto_149853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149858 ?auto_149851 ?auto_149852 )
      ( MAKE-6PILE ?auto_149851 ?auto_149852 ?auto_149853 ?auto_149854 ?auto_149855 ?auto_149856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149860 - BLOCK
      ?auto_149861 - BLOCK
      ?auto_149862 - BLOCK
      ?auto_149863 - BLOCK
      ?auto_149864 - BLOCK
      ?auto_149865 - BLOCK
    )
    :vars
    (
      ?auto_149868 - BLOCK
      ?auto_149867 - BLOCK
      ?auto_149866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149860 ?auto_149861 ) ) ( not ( = ?auto_149860 ?auto_149862 ) ) ( not ( = ?auto_149860 ?auto_149863 ) ) ( not ( = ?auto_149860 ?auto_149864 ) ) ( not ( = ?auto_149860 ?auto_149865 ) ) ( not ( = ?auto_149861 ?auto_149862 ) ) ( not ( = ?auto_149861 ?auto_149863 ) ) ( not ( = ?auto_149861 ?auto_149864 ) ) ( not ( = ?auto_149861 ?auto_149865 ) ) ( not ( = ?auto_149862 ?auto_149863 ) ) ( not ( = ?auto_149862 ?auto_149864 ) ) ( not ( = ?auto_149862 ?auto_149865 ) ) ( not ( = ?auto_149863 ?auto_149864 ) ) ( not ( = ?auto_149863 ?auto_149865 ) ) ( not ( = ?auto_149864 ?auto_149865 ) ) ( ON ?auto_149865 ?auto_149868 ) ( not ( = ?auto_149860 ?auto_149868 ) ) ( not ( = ?auto_149861 ?auto_149868 ) ) ( not ( = ?auto_149862 ?auto_149868 ) ) ( not ( = ?auto_149863 ?auto_149868 ) ) ( not ( = ?auto_149864 ?auto_149868 ) ) ( not ( = ?auto_149865 ?auto_149868 ) ) ( ON ?auto_149864 ?auto_149865 ) ( ON-TABLE ?auto_149867 ) ( ON ?auto_149868 ?auto_149867 ) ( not ( = ?auto_149867 ?auto_149868 ) ) ( not ( = ?auto_149867 ?auto_149865 ) ) ( not ( = ?auto_149867 ?auto_149864 ) ) ( not ( = ?auto_149860 ?auto_149867 ) ) ( not ( = ?auto_149861 ?auto_149867 ) ) ( not ( = ?auto_149862 ?auto_149867 ) ) ( not ( = ?auto_149863 ?auto_149867 ) ) ( ON ?auto_149860 ?auto_149866 ) ( not ( = ?auto_149860 ?auto_149866 ) ) ( not ( = ?auto_149861 ?auto_149866 ) ) ( not ( = ?auto_149862 ?auto_149866 ) ) ( not ( = ?auto_149863 ?auto_149866 ) ) ( not ( = ?auto_149864 ?auto_149866 ) ) ( not ( = ?auto_149865 ?auto_149866 ) ) ( not ( = ?auto_149868 ?auto_149866 ) ) ( not ( = ?auto_149867 ?auto_149866 ) ) ( ON ?auto_149861 ?auto_149860 ) ( ON-TABLE ?auto_149866 ) ( ON ?auto_149862 ?auto_149861 ) ( CLEAR ?auto_149862 ) ( HOLDING ?auto_149863 ) ( CLEAR ?auto_149864 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149867 ?auto_149868 ?auto_149865 ?auto_149864 ?auto_149863 )
      ( MAKE-6PILE ?auto_149860 ?auto_149861 ?auto_149862 ?auto_149863 ?auto_149864 ?auto_149865 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149869 - BLOCK
      ?auto_149870 - BLOCK
      ?auto_149871 - BLOCK
      ?auto_149872 - BLOCK
      ?auto_149873 - BLOCK
      ?auto_149874 - BLOCK
    )
    :vars
    (
      ?auto_149876 - BLOCK
      ?auto_149877 - BLOCK
      ?auto_149875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149869 ?auto_149870 ) ) ( not ( = ?auto_149869 ?auto_149871 ) ) ( not ( = ?auto_149869 ?auto_149872 ) ) ( not ( = ?auto_149869 ?auto_149873 ) ) ( not ( = ?auto_149869 ?auto_149874 ) ) ( not ( = ?auto_149870 ?auto_149871 ) ) ( not ( = ?auto_149870 ?auto_149872 ) ) ( not ( = ?auto_149870 ?auto_149873 ) ) ( not ( = ?auto_149870 ?auto_149874 ) ) ( not ( = ?auto_149871 ?auto_149872 ) ) ( not ( = ?auto_149871 ?auto_149873 ) ) ( not ( = ?auto_149871 ?auto_149874 ) ) ( not ( = ?auto_149872 ?auto_149873 ) ) ( not ( = ?auto_149872 ?auto_149874 ) ) ( not ( = ?auto_149873 ?auto_149874 ) ) ( ON ?auto_149874 ?auto_149876 ) ( not ( = ?auto_149869 ?auto_149876 ) ) ( not ( = ?auto_149870 ?auto_149876 ) ) ( not ( = ?auto_149871 ?auto_149876 ) ) ( not ( = ?auto_149872 ?auto_149876 ) ) ( not ( = ?auto_149873 ?auto_149876 ) ) ( not ( = ?auto_149874 ?auto_149876 ) ) ( ON ?auto_149873 ?auto_149874 ) ( ON-TABLE ?auto_149877 ) ( ON ?auto_149876 ?auto_149877 ) ( not ( = ?auto_149877 ?auto_149876 ) ) ( not ( = ?auto_149877 ?auto_149874 ) ) ( not ( = ?auto_149877 ?auto_149873 ) ) ( not ( = ?auto_149869 ?auto_149877 ) ) ( not ( = ?auto_149870 ?auto_149877 ) ) ( not ( = ?auto_149871 ?auto_149877 ) ) ( not ( = ?auto_149872 ?auto_149877 ) ) ( ON ?auto_149869 ?auto_149875 ) ( not ( = ?auto_149869 ?auto_149875 ) ) ( not ( = ?auto_149870 ?auto_149875 ) ) ( not ( = ?auto_149871 ?auto_149875 ) ) ( not ( = ?auto_149872 ?auto_149875 ) ) ( not ( = ?auto_149873 ?auto_149875 ) ) ( not ( = ?auto_149874 ?auto_149875 ) ) ( not ( = ?auto_149876 ?auto_149875 ) ) ( not ( = ?auto_149877 ?auto_149875 ) ) ( ON ?auto_149870 ?auto_149869 ) ( ON-TABLE ?auto_149875 ) ( ON ?auto_149871 ?auto_149870 ) ( CLEAR ?auto_149873 ) ( ON ?auto_149872 ?auto_149871 ) ( CLEAR ?auto_149872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149875 ?auto_149869 ?auto_149870 ?auto_149871 )
      ( MAKE-6PILE ?auto_149869 ?auto_149870 ?auto_149871 ?auto_149872 ?auto_149873 ?auto_149874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149878 - BLOCK
      ?auto_149879 - BLOCK
      ?auto_149880 - BLOCK
      ?auto_149881 - BLOCK
      ?auto_149882 - BLOCK
      ?auto_149883 - BLOCK
    )
    :vars
    (
      ?auto_149886 - BLOCK
      ?auto_149884 - BLOCK
      ?auto_149885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149878 ?auto_149879 ) ) ( not ( = ?auto_149878 ?auto_149880 ) ) ( not ( = ?auto_149878 ?auto_149881 ) ) ( not ( = ?auto_149878 ?auto_149882 ) ) ( not ( = ?auto_149878 ?auto_149883 ) ) ( not ( = ?auto_149879 ?auto_149880 ) ) ( not ( = ?auto_149879 ?auto_149881 ) ) ( not ( = ?auto_149879 ?auto_149882 ) ) ( not ( = ?auto_149879 ?auto_149883 ) ) ( not ( = ?auto_149880 ?auto_149881 ) ) ( not ( = ?auto_149880 ?auto_149882 ) ) ( not ( = ?auto_149880 ?auto_149883 ) ) ( not ( = ?auto_149881 ?auto_149882 ) ) ( not ( = ?auto_149881 ?auto_149883 ) ) ( not ( = ?auto_149882 ?auto_149883 ) ) ( ON ?auto_149883 ?auto_149886 ) ( not ( = ?auto_149878 ?auto_149886 ) ) ( not ( = ?auto_149879 ?auto_149886 ) ) ( not ( = ?auto_149880 ?auto_149886 ) ) ( not ( = ?auto_149881 ?auto_149886 ) ) ( not ( = ?auto_149882 ?auto_149886 ) ) ( not ( = ?auto_149883 ?auto_149886 ) ) ( ON-TABLE ?auto_149884 ) ( ON ?auto_149886 ?auto_149884 ) ( not ( = ?auto_149884 ?auto_149886 ) ) ( not ( = ?auto_149884 ?auto_149883 ) ) ( not ( = ?auto_149884 ?auto_149882 ) ) ( not ( = ?auto_149878 ?auto_149884 ) ) ( not ( = ?auto_149879 ?auto_149884 ) ) ( not ( = ?auto_149880 ?auto_149884 ) ) ( not ( = ?auto_149881 ?auto_149884 ) ) ( ON ?auto_149878 ?auto_149885 ) ( not ( = ?auto_149878 ?auto_149885 ) ) ( not ( = ?auto_149879 ?auto_149885 ) ) ( not ( = ?auto_149880 ?auto_149885 ) ) ( not ( = ?auto_149881 ?auto_149885 ) ) ( not ( = ?auto_149882 ?auto_149885 ) ) ( not ( = ?auto_149883 ?auto_149885 ) ) ( not ( = ?auto_149886 ?auto_149885 ) ) ( not ( = ?auto_149884 ?auto_149885 ) ) ( ON ?auto_149879 ?auto_149878 ) ( ON-TABLE ?auto_149885 ) ( ON ?auto_149880 ?auto_149879 ) ( ON ?auto_149881 ?auto_149880 ) ( CLEAR ?auto_149881 ) ( HOLDING ?auto_149882 ) ( CLEAR ?auto_149883 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149884 ?auto_149886 ?auto_149883 ?auto_149882 )
      ( MAKE-6PILE ?auto_149878 ?auto_149879 ?auto_149880 ?auto_149881 ?auto_149882 ?auto_149883 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149887 - BLOCK
      ?auto_149888 - BLOCK
      ?auto_149889 - BLOCK
      ?auto_149890 - BLOCK
      ?auto_149891 - BLOCK
      ?auto_149892 - BLOCK
    )
    :vars
    (
      ?auto_149895 - BLOCK
      ?auto_149893 - BLOCK
      ?auto_149894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149887 ?auto_149888 ) ) ( not ( = ?auto_149887 ?auto_149889 ) ) ( not ( = ?auto_149887 ?auto_149890 ) ) ( not ( = ?auto_149887 ?auto_149891 ) ) ( not ( = ?auto_149887 ?auto_149892 ) ) ( not ( = ?auto_149888 ?auto_149889 ) ) ( not ( = ?auto_149888 ?auto_149890 ) ) ( not ( = ?auto_149888 ?auto_149891 ) ) ( not ( = ?auto_149888 ?auto_149892 ) ) ( not ( = ?auto_149889 ?auto_149890 ) ) ( not ( = ?auto_149889 ?auto_149891 ) ) ( not ( = ?auto_149889 ?auto_149892 ) ) ( not ( = ?auto_149890 ?auto_149891 ) ) ( not ( = ?auto_149890 ?auto_149892 ) ) ( not ( = ?auto_149891 ?auto_149892 ) ) ( ON ?auto_149892 ?auto_149895 ) ( not ( = ?auto_149887 ?auto_149895 ) ) ( not ( = ?auto_149888 ?auto_149895 ) ) ( not ( = ?auto_149889 ?auto_149895 ) ) ( not ( = ?auto_149890 ?auto_149895 ) ) ( not ( = ?auto_149891 ?auto_149895 ) ) ( not ( = ?auto_149892 ?auto_149895 ) ) ( ON-TABLE ?auto_149893 ) ( ON ?auto_149895 ?auto_149893 ) ( not ( = ?auto_149893 ?auto_149895 ) ) ( not ( = ?auto_149893 ?auto_149892 ) ) ( not ( = ?auto_149893 ?auto_149891 ) ) ( not ( = ?auto_149887 ?auto_149893 ) ) ( not ( = ?auto_149888 ?auto_149893 ) ) ( not ( = ?auto_149889 ?auto_149893 ) ) ( not ( = ?auto_149890 ?auto_149893 ) ) ( ON ?auto_149887 ?auto_149894 ) ( not ( = ?auto_149887 ?auto_149894 ) ) ( not ( = ?auto_149888 ?auto_149894 ) ) ( not ( = ?auto_149889 ?auto_149894 ) ) ( not ( = ?auto_149890 ?auto_149894 ) ) ( not ( = ?auto_149891 ?auto_149894 ) ) ( not ( = ?auto_149892 ?auto_149894 ) ) ( not ( = ?auto_149895 ?auto_149894 ) ) ( not ( = ?auto_149893 ?auto_149894 ) ) ( ON ?auto_149888 ?auto_149887 ) ( ON-TABLE ?auto_149894 ) ( ON ?auto_149889 ?auto_149888 ) ( ON ?auto_149890 ?auto_149889 ) ( CLEAR ?auto_149892 ) ( ON ?auto_149891 ?auto_149890 ) ( CLEAR ?auto_149891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149894 ?auto_149887 ?auto_149888 ?auto_149889 ?auto_149890 )
      ( MAKE-6PILE ?auto_149887 ?auto_149888 ?auto_149889 ?auto_149890 ?auto_149891 ?auto_149892 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149896 - BLOCK
      ?auto_149897 - BLOCK
      ?auto_149898 - BLOCK
      ?auto_149899 - BLOCK
      ?auto_149900 - BLOCK
      ?auto_149901 - BLOCK
    )
    :vars
    (
      ?auto_149903 - BLOCK
      ?auto_149904 - BLOCK
      ?auto_149902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149896 ?auto_149897 ) ) ( not ( = ?auto_149896 ?auto_149898 ) ) ( not ( = ?auto_149896 ?auto_149899 ) ) ( not ( = ?auto_149896 ?auto_149900 ) ) ( not ( = ?auto_149896 ?auto_149901 ) ) ( not ( = ?auto_149897 ?auto_149898 ) ) ( not ( = ?auto_149897 ?auto_149899 ) ) ( not ( = ?auto_149897 ?auto_149900 ) ) ( not ( = ?auto_149897 ?auto_149901 ) ) ( not ( = ?auto_149898 ?auto_149899 ) ) ( not ( = ?auto_149898 ?auto_149900 ) ) ( not ( = ?auto_149898 ?auto_149901 ) ) ( not ( = ?auto_149899 ?auto_149900 ) ) ( not ( = ?auto_149899 ?auto_149901 ) ) ( not ( = ?auto_149900 ?auto_149901 ) ) ( not ( = ?auto_149896 ?auto_149903 ) ) ( not ( = ?auto_149897 ?auto_149903 ) ) ( not ( = ?auto_149898 ?auto_149903 ) ) ( not ( = ?auto_149899 ?auto_149903 ) ) ( not ( = ?auto_149900 ?auto_149903 ) ) ( not ( = ?auto_149901 ?auto_149903 ) ) ( ON-TABLE ?auto_149904 ) ( ON ?auto_149903 ?auto_149904 ) ( not ( = ?auto_149904 ?auto_149903 ) ) ( not ( = ?auto_149904 ?auto_149901 ) ) ( not ( = ?auto_149904 ?auto_149900 ) ) ( not ( = ?auto_149896 ?auto_149904 ) ) ( not ( = ?auto_149897 ?auto_149904 ) ) ( not ( = ?auto_149898 ?auto_149904 ) ) ( not ( = ?auto_149899 ?auto_149904 ) ) ( ON ?auto_149896 ?auto_149902 ) ( not ( = ?auto_149896 ?auto_149902 ) ) ( not ( = ?auto_149897 ?auto_149902 ) ) ( not ( = ?auto_149898 ?auto_149902 ) ) ( not ( = ?auto_149899 ?auto_149902 ) ) ( not ( = ?auto_149900 ?auto_149902 ) ) ( not ( = ?auto_149901 ?auto_149902 ) ) ( not ( = ?auto_149903 ?auto_149902 ) ) ( not ( = ?auto_149904 ?auto_149902 ) ) ( ON ?auto_149897 ?auto_149896 ) ( ON-TABLE ?auto_149902 ) ( ON ?auto_149898 ?auto_149897 ) ( ON ?auto_149899 ?auto_149898 ) ( ON ?auto_149900 ?auto_149899 ) ( CLEAR ?auto_149900 ) ( HOLDING ?auto_149901 ) ( CLEAR ?auto_149903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149904 ?auto_149903 ?auto_149901 )
      ( MAKE-6PILE ?auto_149896 ?auto_149897 ?auto_149898 ?auto_149899 ?auto_149900 ?auto_149901 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149905 - BLOCK
      ?auto_149906 - BLOCK
      ?auto_149907 - BLOCK
      ?auto_149908 - BLOCK
      ?auto_149909 - BLOCK
      ?auto_149910 - BLOCK
    )
    :vars
    (
      ?auto_149913 - BLOCK
      ?auto_149911 - BLOCK
      ?auto_149912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149905 ?auto_149906 ) ) ( not ( = ?auto_149905 ?auto_149907 ) ) ( not ( = ?auto_149905 ?auto_149908 ) ) ( not ( = ?auto_149905 ?auto_149909 ) ) ( not ( = ?auto_149905 ?auto_149910 ) ) ( not ( = ?auto_149906 ?auto_149907 ) ) ( not ( = ?auto_149906 ?auto_149908 ) ) ( not ( = ?auto_149906 ?auto_149909 ) ) ( not ( = ?auto_149906 ?auto_149910 ) ) ( not ( = ?auto_149907 ?auto_149908 ) ) ( not ( = ?auto_149907 ?auto_149909 ) ) ( not ( = ?auto_149907 ?auto_149910 ) ) ( not ( = ?auto_149908 ?auto_149909 ) ) ( not ( = ?auto_149908 ?auto_149910 ) ) ( not ( = ?auto_149909 ?auto_149910 ) ) ( not ( = ?auto_149905 ?auto_149913 ) ) ( not ( = ?auto_149906 ?auto_149913 ) ) ( not ( = ?auto_149907 ?auto_149913 ) ) ( not ( = ?auto_149908 ?auto_149913 ) ) ( not ( = ?auto_149909 ?auto_149913 ) ) ( not ( = ?auto_149910 ?auto_149913 ) ) ( ON-TABLE ?auto_149911 ) ( ON ?auto_149913 ?auto_149911 ) ( not ( = ?auto_149911 ?auto_149913 ) ) ( not ( = ?auto_149911 ?auto_149910 ) ) ( not ( = ?auto_149911 ?auto_149909 ) ) ( not ( = ?auto_149905 ?auto_149911 ) ) ( not ( = ?auto_149906 ?auto_149911 ) ) ( not ( = ?auto_149907 ?auto_149911 ) ) ( not ( = ?auto_149908 ?auto_149911 ) ) ( ON ?auto_149905 ?auto_149912 ) ( not ( = ?auto_149905 ?auto_149912 ) ) ( not ( = ?auto_149906 ?auto_149912 ) ) ( not ( = ?auto_149907 ?auto_149912 ) ) ( not ( = ?auto_149908 ?auto_149912 ) ) ( not ( = ?auto_149909 ?auto_149912 ) ) ( not ( = ?auto_149910 ?auto_149912 ) ) ( not ( = ?auto_149913 ?auto_149912 ) ) ( not ( = ?auto_149911 ?auto_149912 ) ) ( ON ?auto_149906 ?auto_149905 ) ( ON-TABLE ?auto_149912 ) ( ON ?auto_149907 ?auto_149906 ) ( ON ?auto_149908 ?auto_149907 ) ( ON ?auto_149909 ?auto_149908 ) ( CLEAR ?auto_149913 ) ( ON ?auto_149910 ?auto_149909 ) ( CLEAR ?auto_149910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149912 ?auto_149905 ?auto_149906 ?auto_149907 ?auto_149908 ?auto_149909 )
      ( MAKE-6PILE ?auto_149905 ?auto_149906 ?auto_149907 ?auto_149908 ?auto_149909 ?auto_149910 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149914 - BLOCK
      ?auto_149915 - BLOCK
      ?auto_149916 - BLOCK
      ?auto_149917 - BLOCK
      ?auto_149918 - BLOCK
      ?auto_149919 - BLOCK
    )
    :vars
    (
      ?auto_149922 - BLOCK
      ?auto_149921 - BLOCK
      ?auto_149920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149914 ?auto_149915 ) ) ( not ( = ?auto_149914 ?auto_149916 ) ) ( not ( = ?auto_149914 ?auto_149917 ) ) ( not ( = ?auto_149914 ?auto_149918 ) ) ( not ( = ?auto_149914 ?auto_149919 ) ) ( not ( = ?auto_149915 ?auto_149916 ) ) ( not ( = ?auto_149915 ?auto_149917 ) ) ( not ( = ?auto_149915 ?auto_149918 ) ) ( not ( = ?auto_149915 ?auto_149919 ) ) ( not ( = ?auto_149916 ?auto_149917 ) ) ( not ( = ?auto_149916 ?auto_149918 ) ) ( not ( = ?auto_149916 ?auto_149919 ) ) ( not ( = ?auto_149917 ?auto_149918 ) ) ( not ( = ?auto_149917 ?auto_149919 ) ) ( not ( = ?auto_149918 ?auto_149919 ) ) ( not ( = ?auto_149914 ?auto_149922 ) ) ( not ( = ?auto_149915 ?auto_149922 ) ) ( not ( = ?auto_149916 ?auto_149922 ) ) ( not ( = ?auto_149917 ?auto_149922 ) ) ( not ( = ?auto_149918 ?auto_149922 ) ) ( not ( = ?auto_149919 ?auto_149922 ) ) ( ON-TABLE ?auto_149921 ) ( not ( = ?auto_149921 ?auto_149922 ) ) ( not ( = ?auto_149921 ?auto_149919 ) ) ( not ( = ?auto_149921 ?auto_149918 ) ) ( not ( = ?auto_149914 ?auto_149921 ) ) ( not ( = ?auto_149915 ?auto_149921 ) ) ( not ( = ?auto_149916 ?auto_149921 ) ) ( not ( = ?auto_149917 ?auto_149921 ) ) ( ON ?auto_149914 ?auto_149920 ) ( not ( = ?auto_149914 ?auto_149920 ) ) ( not ( = ?auto_149915 ?auto_149920 ) ) ( not ( = ?auto_149916 ?auto_149920 ) ) ( not ( = ?auto_149917 ?auto_149920 ) ) ( not ( = ?auto_149918 ?auto_149920 ) ) ( not ( = ?auto_149919 ?auto_149920 ) ) ( not ( = ?auto_149922 ?auto_149920 ) ) ( not ( = ?auto_149921 ?auto_149920 ) ) ( ON ?auto_149915 ?auto_149914 ) ( ON-TABLE ?auto_149920 ) ( ON ?auto_149916 ?auto_149915 ) ( ON ?auto_149917 ?auto_149916 ) ( ON ?auto_149918 ?auto_149917 ) ( ON ?auto_149919 ?auto_149918 ) ( CLEAR ?auto_149919 ) ( HOLDING ?auto_149922 ) ( CLEAR ?auto_149921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149921 ?auto_149922 )
      ( MAKE-6PILE ?auto_149914 ?auto_149915 ?auto_149916 ?auto_149917 ?auto_149918 ?auto_149919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149923 - BLOCK
      ?auto_149924 - BLOCK
      ?auto_149925 - BLOCK
      ?auto_149926 - BLOCK
      ?auto_149927 - BLOCK
      ?auto_149928 - BLOCK
    )
    :vars
    (
      ?auto_149930 - BLOCK
      ?auto_149931 - BLOCK
      ?auto_149929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149923 ?auto_149924 ) ) ( not ( = ?auto_149923 ?auto_149925 ) ) ( not ( = ?auto_149923 ?auto_149926 ) ) ( not ( = ?auto_149923 ?auto_149927 ) ) ( not ( = ?auto_149923 ?auto_149928 ) ) ( not ( = ?auto_149924 ?auto_149925 ) ) ( not ( = ?auto_149924 ?auto_149926 ) ) ( not ( = ?auto_149924 ?auto_149927 ) ) ( not ( = ?auto_149924 ?auto_149928 ) ) ( not ( = ?auto_149925 ?auto_149926 ) ) ( not ( = ?auto_149925 ?auto_149927 ) ) ( not ( = ?auto_149925 ?auto_149928 ) ) ( not ( = ?auto_149926 ?auto_149927 ) ) ( not ( = ?auto_149926 ?auto_149928 ) ) ( not ( = ?auto_149927 ?auto_149928 ) ) ( not ( = ?auto_149923 ?auto_149930 ) ) ( not ( = ?auto_149924 ?auto_149930 ) ) ( not ( = ?auto_149925 ?auto_149930 ) ) ( not ( = ?auto_149926 ?auto_149930 ) ) ( not ( = ?auto_149927 ?auto_149930 ) ) ( not ( = ?auto_149928 ?auto_149930 ) ) ( ON-TABLE ?auto_149931 ) ( not ( = ?auto_149931 ?auto_149930 ) ) ( not ( = ?auto_149931 ?auto_149928 ) ) ( not ( = ?auto_149931 ?auto_149927 ) ) ( not ( = ?auto_149923 ?auto_149931 ) ) ( not ( = ?auto_149924 ?auto_149931 ) ) ( not ( = ?auto_149925 ?auto_149931 ) ) ( not ( = ?auto_149926 ?auto_149931 ) ) ( ON ?auto_149923 ?auto_149929 ) ( not ( = ?auto_149923 ?auto_149929 ) ) ( not ( = ?auto_149924 ?auto_149929 ) ) ( not ( = ?auto_149925 ?auto_149929 ) ) ( not ( = ?auto_149926 ?auto_149929 ) ) ( not ( = ?auto_149927 ?auto_149929 ) ) ( not ( = ?auto_149928 ?auto_149929 ) ) ( not ( = ?auto_149930 ?auto_149929 ) ) ( not ( = ?auto_149931 ?auto_149929 ) ) ( ON ?auto_149924 ?auto_149923 ) ( ON-TABLE ?auto_149929 ) ( ON ?auto_149925 ?auto_149924 ) ( ON ?auto_149926 ?auto_149925 ) ( ON ?auto_149927 ?auto_149926 ) ( ON ?auto_149928 ?auto_149927 ) ( CLEAR ?auto_149931 ) ( ON ?auto_149930 ?auto_149928 ) ( CLEAR ?auto_149930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149929 ?auto_149923 ?auto_149924 ?auto_149925 ?auto_149926 ?auto_149927 ?auto_149928 )
      ( MAKE-6PILE ?auto_149923 ?auto_149924 ?auto_149925 ?auto_149926 ?auto_149927 ?auto_149928 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149932 - BLOCK
      ?auto_149933 - BLOCK
      ?auto_149934 - BLOCK
      ?auto_149935 - BLOCK
      ?auto_149936 - BLOCK
      ?auto_149937 - BLOCK
    )
    :vars
    (
      ?auto_149939 - BLOCK
      ?auto_149938 - BLOCK
      ?auto_149940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149932 ?auto_149933 ) ) ( not ( = ?auto_149932 ?auto_149934 ) ) ( not ( = ?auto_149932 ?auto_149935 ) ) ( not ( = ?auto_149932 ?auto_149936 ) ) ( not ( = ?auto_149932 ?auto_149937 ) ) ( not ( = ?auto_149933 ?auto_149934 ) ) ( not ( = ?auto_149933 ?auto_149935 ) ) ( not ( = ?auto_149933 ?auto_149936 ) ) ( not ( = ?auto_149933 ?auto_149937 ) ) ( not ( = ?auto_149934 ?auto_149935 ) ) ( not ( = ?auto_149934 ?auto_149936 ) ) ( not ( = ?auto_149934 ?auto_149937 ) ) ( not ( = ?auto_149935 ?auto_149936 ) ) ( not ( = ?auto_149935 ?auto_149937 ) ) ( not ( = ?auto_149936 ?auto_149937 ) ) ( not ( = ?auto_149932 ?auto_149939 ) ) ( not ( = ?auto_149933 ?auto_149939 ) ) ( not ( = ?auto_149934 ?auto_149939 ) ) ( not ( = ?auto_149935 ?auto_149939 ) ) ( not ( = ?auto_149936 ?auto_149939 ) ) ( not ( = ?auto_149937 ?auto_149939 ) ) ( not ( = ?auto_149938 ?auto_149939 ) ) ( not ( = ?auto_149938 ?auto_149937 ) ) ( not ( = ?auto_149938 ?auto_149936 ) ) ( not ( = ?auto_149932 ?auto_149938 ) ) ( not ( = ?auto_149933 ?auto_149938 ) ) ( not ( = ?auto_149934 ?auto_149938 ) ) ( not ( = ?auto_149935 ?auto_149938 ) ) ( ON ?auto_149932 ?auto_149940 ) ( not ( = ?auto_149932 ?auto_149940 ) ) ( not ( = ?auto_149933 ?auto_149940 ) ) ( not ( = ?auto_149934 ?auto_149940 ) ) ( not ( = ?auto_149935 ?auto_149940 ) ) ( not ( = ?auto_149936 ?auto_149940 ) ) ( not ( = ?auto_149937 ?auto_149940 ) ) ( not ( = ?auto_149939 ?auto_149940 ) ) ( not ( = ?auto_149938 ?auto_149940 ) ) ( ON ?auto_149933 ?auto_149932 ) ( ON-TABLE ?auto_149940 ) ( ON ?auto_149934 ?auto_149933 ) ( ON ?auto_149935 ?auto_149934 ) ( ON ?auto_149936 ?auto_149935 ) ( ON ?auto_149937 ?auto_149936 ) ( ON ?auto_149939 ?auto_149937 ) ( CLEAR ?auto_149939 ) ( HOLDING ?auto_149938 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149938 )
      ( MAKE-6PILE ?auto_149932 ?auto_149933 ?auto_149934 ?auto_149935 ?auto_149936 ?auto_149937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_149941 - BLOCK
      ?auto_149942 - BLOCK
      ?auto_149943 - BLOCK
      ?auto_149944 - BLOCK
      ?auto_149945 - BLOCK
      ?auto_149946 - BLOCK
    )
    :vars
    (
      ?auto_149949 - BLOCK
      ?auto_149947 - BLOCK
      ?auto_149948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149941 ?auto_149942 ) ) ( not ( = ?auto_149941 ?auto_149943 ) ) ( not ( = ?auto_149941 ?auto_149944 ) ) ( not ( = ?auto_149941 ?auto_149945 ) ) ( not ( = ?auto_149941 ?auto_149946 ) ) ( not ( = ?auto_149942 ?auto_149943 ) ) ( not ( = ?auto_149942 ?auto_149944 ) ) ( not ( = ?auto_149942 ?auto_149945 ) ) ( not ( = ?auto_149942 ?auto_149946 ) ) ( not ( = ?auto_149943 ?auto_149944 ) ) ( not ( = ?auto_149943 ?auto_149945 ) ) ( not ( = ?auto_149943 ?auto_149946 ) ) ( not ( = ?auto_149944 ?auto_149945 ) ) ( not ( = ?auto_149944 ?auto_149946 ) ) ( not ( = ?auto_149945 ?auto_149946 ) ) ( not ( = ?auto_149941 ?auto_149949 ) ) ( not ( = ?auto_149942 ?auto_149949 ) ) ( not ( = ?auto_149943 ?auto_149949 ) ) ( not ( = ?auto_149944 ?auto_149949 ) ) ( not ( = ?auto_149945 ?auto_149949 ) ) ( not ( = ?auto_149946 ?auto_149949 ) ) ( not ( = ?auto_149947 ?auto_149949 ) ) ( not ( = ?auto_149947 ?auto_149946 ) ) ( not ( = ?auto_149947 ?auto_149945 ) ) ( not ( = ?auto_149941 ?auto_149947 ) ) ( not ( = ?auto_149942 ?auto_149947 ) ) ( not ( = ?auto_149943 ?auto_149947 ) ) ( not ( = ?auto_149944 ?auto_149947 ) ) ( ON ?auto_149941 ?auto_149948 ) ( not ( = ?auto_149941 ?auto_149948 ) ) ( not ( = ?auto_149942 ?auto_149948 ) ) ( not ( = ?auto_149943 ?auto_149948 ) ) ( not ( = ?auto_149944 ?auto_149948 ) ) ( not ( = ?auto_149945 ?auto_149948 ) ) ( not ( = ?auto_149946 ?auto_149948 ) ) ( not ( = ?auto_149949 ?auto_149948 ) ) ( not ( = ?auto_149947 ?auto_149948 ) ) ( ON ?auto_149942 ?auto_149941 ) ( ON-TABLE ?auto_149948 ) ( ON ?auto_149943 ?auto_149942 ) ( ON ?auto_149944 ?auto_149943 ) ( ON ?auto_149945 ?auto_149944 ) ( ON ?auto_149946 ?auto_149945 ) ( ON ?auto_149949 ?auto_149946 ) ( ON ?auto_149947 ?auto_149949 ) ( CLEAR ?auto_149947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149948 ?auto_149941 ?auto_149942 ?auto_149943 ?auto_149944 ?auto_149945 ?auto_149946 ?auto_149949 )
      ( MAKE-6PILE ?auto_149941 ?auto_149942 ?auto_149943 ?auto_149944 ?auto_149945 ?auto_149946 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149961 - BLOCK
    )
    :vars
    (
      ?auto_149962 - BLOCK
      ?auto_149964 - BLOCK
      ?auto_149963 - BLOCK
      ?auto_149965 - BLOCK
      ?auto_149968 - BLOCK
      ?auto_149966 - BLOCK
      ?auto_149967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149962 ?auto_149961 ) ( ON-TABLE ?auto_149961 ) ( not ( = ?auto_149961 ?auto_149962 ) ) ( not ( = ?auto_149961 ?auto_149964 ) ) ( not ( = ?auto_149961 ?auto_149963 ) ) ( not ( = ?auto_149962 ?auto_149964 ) ) ( not ( = ?auto_149962 ?auto_149963 ) ) ( not ( = ?auto_149964 ?auto_149963 ) ) ( ON ?auto_149964 ?auto_149962 ) ( CLEAR ?auto_149964 ) ( HOLDING ?auto_149963 ) ( CLEAR ?auto_149965 ) ( ON-TABLE ?auto_149968 ) ( ON ?auto_149966 ?auto_149968 ) ( ON ?auto_149967 ?auto_149966 ) ( ON ?auto_149965 ?auto_149967 ) ( not ( = ?auto_149968 ?auto_149966 ) ) ( not ( = ?auto_149968 ?auto_149967 ) ) ( not ( = ?auto_149968 ?auto_149965 ) ) ( not ( = ?auto_149968 ?auto_149963 ) ) ( not ( = ?auto_149966 ?auto_149967 ) ) ( not ( = ?auto_149966 ?auto_149965 ) ) ( not ( = ?auto_149966 ?auto_149963 ) ) ( not ( = ?auto_149967 ?auto_149965 ) ) ( not ( = ?auto_149967 ?auto_149963 ) ) ( not ( = ?auto_149965 ?auto_149963 ) ) ( not ( = ?auto_149961 ?auto_149965 ) ) ( not ( = ?auto_149961 ?auto_149968 ) ) ( not ( = ?auto_149961 ?auto_149966 ) ) ( not ( = ?auto_149961 ?auto_149967 ) ) ( not ( = ?auto_149962 ?auto_149965 ) ) ( not ( = ?auto_149962 ?auto_149968 ) ) ( not ( = ?auto_149962 ?auto_149966 ) ) ( not ( = ?auto_149962 ?auto_149967 ) ) ( not ( = ?auto_149964 ?auto_149965 ) ) ( not ( = ?auto_149964 ?auto_149968 ) ) ( not ( = ?auto_149964 ?auto_149966 ) ) ( not ( = ?auto_149964 ?auto_149967 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149968 ?auto_149966 ?auto_149967 ?auto_149965 ?auto_149963 )
      ( MAKE-1PILE ?auto_149961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149969 - BLOCK
    )
    :vars
    (
      ?auto_149971 - BLOCK
      ?auto_149972 - BLOCK
      ?auto_149974 - BLOCK
      ?auto_149975 - BLOCK
      ?auto_149973 - BLOCK
      ?auto_149976 - BLOCK
      ?auto_149970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149971 ?auto_149969 ) ( ON-TABLE ?auto_149969 ) ( not ( = ?auto_149969 ?auto_149971 ) ) ( not ( = ?auto_149969 ?auto_149972 ) ) ( not ( = ?auto_149969 ?auto_149974 ) ) ( not ( = ?auto_149971 ?auto_149972 ) ) ( not ( = ?auto_149971 ?auto_149974 ) ) ( not ( = ?auto_149972 ?auto_149974 ) ) ( ON ?auto_149972 ?auto_149971 ) ( CLEAR ?auto_149975 ) ( ON-TABLE ?auto_149973 ) ( ON ?auto_149976 ?auto_149973 ) ( ON ?auto_149970 ?auto_149976 ) ( ON ?auto_149975 ?auto_149970 ) ( not ( = ?auto_149973 ?auto_149976 ) ) ( not ( = ?auto_149973 ?auto_149970 ) ) ( not ( = ?auto_149973 ?auto_149975 ) ) ( not ( = ?auto_149973 ?auto_149974 ) ) ( not ( = ?auto_149976 ?auto_149970 ) ) ( not ( = ?auto_149976 ?auto_149975 ) ) ( not ( = ?auto_149976 ?auto_149974 ) ) ( not ( = ?auto_149970 ?auto_149975 ) ) ( not ( = ?auto_149970 ?auto_149974 ) ) ( not ( = ?auto_149975 ?auto_149974 ) ) ( not ( = ?auto_149969 ?auto_149975 ) ) ( not ( = ?auto_149969 ?auto_149973 ) ) ( not ( = ?auto_149969 ?auto_149976 ) ) ( not ( = ?auto_149969 ?auto_149970 ) ) ( not ( = ?auto_149971 ?auto_149975 ) ) ( not ( = ?auto_149971 ?auto_149973 ) ) ( not ( = ?auto_149971 ?auto_149976 ) ) ( not ( = ?auto_149971 ?auto_149970 ) ) ( not ( = ?auto_149972 ?auto_149975 ) ) ( not ( = ?auto_149972 ?auto_149973 ) ) ( not ( = ?auto_149972 ?auto_149976 ) ) ( not ( = ?auto_149972 ?auto_149970 ) ) ( ON ?auto_149974 ?auto_149972 ) ( CLEAR ?auto_149974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149969 ?auto_149971 ?auto_149972 )
      ( MAKE-1PILE ?auto_149969 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149977 - BLOCK
    )
    :vars
    (
      ?auto_149984 - BLOCK
      ?auto_149979 - BLOCK
      ?auto_149981 - BLOCK
      ?auto_149978 - BLOCK
      ?auto_149980 - BLOCK
      ?auto_149982 - BLOCK
      ?auto_149983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149984 ?auto_149977 ) ( ON-TABLE ?auto_149977 ) ( not ( = ?auto_149977 ?auto_149984 ) ) ( not ( = ?auto_149977 ?auto_149979 ) ) ( not ( = ?auto_149977 ?auto_149981 ) ) ( not ( = ?auto_149984 ?auto_149979 ) ) ( not ( = ?auto_149984 ?auto_149981 ) ) ( not ( = ?auto_149979 ?auto_149981 ) ) ( ON ?auto_149979 ?auto_149984 ) ( ON-TABLE ?auto_149978 ) ( ON ?auto_149980 ?auto_149978 ) ( ON ?auto_149982 ?auto_149980 ) ( not ( = ?auto_149978 ?auto_149980 ) ) ( not ( = ?auto_149978 ?auto_149982 ) ) ( not ( = ?auto_149978 ?auto_149983 ) ) ( not ( = ?auto_149978 ?auto_149981 ) ) ( not ( = ?auto_149980 ?auto_149982 ) ) ( not ( = ?auto_149980 ?auto_149983 ) ) ( not ( = ?auto_149980 ?auto_149981 ) ) ( not ( = ?auto_149982 ?auto_149983 ) ) ( not ( = ?auto_149982 ?auto_149981 ) ) ( not ( = ?auto_149983 ?auto_149981 ) ) ( not ( = ?auto_149977 ?auto_149983 ) ) ( not ( = ?auto_149977 ?auto_149978 ) ) ( not ( = ?auto_149977 ?auto_149980 ) ) ( not ( = ?auto_149977 ?auto_149982 ) ) ( not ( = ?auto_149984 ?auto_149983 ) ) ( not ( = ?auto_149984 ?auto_149978 ) ) ( not ( = ?auto_149984 ?auto_149980 ) ) ( not ( = ?auto_149984 ?auto_149982 ) ) ( not ( = ?auto_149979 ?auto_149983 ) ) ( not ( = ?auto_149979 ?auto_149978 ) ) ( not ( = ?auto_149979 ?auto_149980 ) ) ( not ( = ?auto_149979 ?auto_149982 ) ) ( ON ?auto_149981 ?auto_149979 ) ( CLEAR ?auto_149981 ) ( HOLDING ?auto_149983 ) ( CLEAR ?auto_149982 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149978 ?auto_149980 ?auto_149982 ?auto_149983 )
      ( MAKE-1PILE ?auto_149977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149985 - BLOCK
    )
    :vars
    (
      ?auto_149989 - BLOCK
      ?auto_149987 - BLOCK
      ?auto_149990 - BLOCK
      ?auto_149988 - BLOCK
      ?auto_149986 - BLOCK
      ?auto_149992 - BLOCK
      ?auto_149991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149989 ?auto_149985 ) ( ON-TABLE ?auto_149985 ) ( not ( = ?auto_149985 ?auto_149989 ) ) ( not ( = ?auto_149985 ?auto_149987 ) ) ( not ( = ?auto_149985 ?auto_149990 ) ) ( not ( = ?auto_149989 ?auto_149987 ) ) ( not ( = ?auto_149989 ?auto_149990 ) ) ( not ( = ?auto_149987 ?auto_149990 ) ) ( ON ?auto_149987 ?auto_149989 ) ( ON-TABLE ?auto_149988 ) ( ON ?auto_149986 ?auto_149988 ) ( ON ?auto_149992 ?auto_149986 ) ( not ( = ?auto_149988 ?auto_149986 ) ) ( not ( = ?auto_149988 ?auto_149992 ) ) ( not ( = ?auto_149988 ?auto_149991 ) ) ( not ( = ?auto_149988 ?auto_149990 ) ) ( not ( = ?auto_149986 ?auto_149992 ) ) ( not ( = ?auto_149986 ?auto_149991 ) ) ( not ( = ?auto_149986 ?auto_149990 ) ) ( not ( = ?auto_149992 ?auto_149991 ) ) ( not ( = ?auto_149992 ?auto_149990 ) ) ( not ( = ?auto_149991 ?auto_149990 ) ) ( not ( = ?auto_149985 ?auto_149991 ) ) ( not ( = ?auto_149985 ?auto_149988 ) ) ( not ( = ?auto_149985 ?auto_149986 ) ) ( not ( = ?auto_149985 ?auto_149992 ) ) ( not ( = ?auto_149989 ?auto_149991 ) ) ( not ( = ?auto_149989 ?auto_149988 ) ) ( not ( = ?auto_149989 ?auto_149986 ) ) ( not ( = ?auto_149989 ?auto_149992 ) ) ( not ( = ?auto_149987 ?auto_149991 ) ) ( not ( = ?auto_149987 ?auto_149988 ) ) ( not ( = ?auto_149987 ?auto_149986 ) ) ( not ( = ?auto_149987 ?auto_149992 ) ) ( ON ?auto_149990 ?auto_149987 ) ( CLEAR ?auto_149992 ) ( ON ?auto_149991 ?auto_149990 ) ( CLEAR ?auto_149991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149985 ?auto_149989 ?auto_149987 ?auto_149990 )
      ( MAKE-1PILE ?auto_149985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149993 - BLOCK
    )
    :vars
    (
      ?auto_149997 - BLOCK
      ?auto_149996 - BLOCK
      ?auto_150000 - BLOCK
      ?auto_149998 - BLOCK
      ?auto_149999 - BLOCK
      ?auto_149994 - BLOCK
      ?auto_149995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149997 ?auto_149993 ) ( ON-TABLE ?auto_149993 ) ( not ( = ?auto_149993 ?auto_149997 ) ) ( not ( = ?auto_149993 ?auto_149996 ) ) ( not ( = ?auto_149993 ?auto_150000 ) ) ( not ( = ?auto_149997 ?auto_149996 ) ) ( not ( = ?auto_149997 ?auto_150000 ) ) ( not ( = ?auto_149996 ?auto_150000 ) ) ( ON ?auto_149996 ?auto_149997 ) ( ON-TABLE ?auto_149998 ) ( ON ?auto_149999 ?auto_149998 ) ( not ( = ?auto_149998 ?auto_149999 ) ) ( not ( = ?auto_149998 ?auto_149994 ) ) ( not ( = ?auto_149998 ?auto_149995 ) ) ( not ( = ?auto_149998 ?auto_150000 ) ) ( not ( = ?auto_149999 ?auto_149994 ) ) ( not ( = ?auto_149999 ?auto_149995 ) ) ( not ( = ?auto_149999 ?auto_150000 ) ) ( not ( = ?auto_149994 ?auto_149995 ) ) ( not ( = ?auto_149994 ?auto_150000 ) ) ( not ( = ?auto_149995 ?auto_150000 ) ) ( not ( = ?auto_149993 ?auto_149995 ) ) ( not ( = ?auto_149993 ?auto_149998 ) ) ( not ( = ?auto_149993 ?auto_149999 ) ) ( not ( = ?auto_149993 ?auto_149994 ) ) ( not ( = ?auto_149997 ?auto_149995 ) ) ( not ( = ?auto_149997 ?auto_149998 ) ) ( not ( = ?auto_149997 ?auto_149999 ) ) ( not ( = ?auto_149997 ?auto_149994 ) ) ( not ( = ?auto_149996 ?auto_149995 ) ) ( not ( = ?auto_149996 ?auto_149998 ) ) ( not ( = ?auto_149996 ?auto_149999 ) ) ( not ( = ?auto_149996 ?auto_149994 ) ) ( ON ?auto_150000 ?auto_149996 ) ( ON ?auto_149995 ?auto_150000 ) ( CLEAR ?auto_149995 ) ( HOLDING ?auto_149994 ) ( CLEAR ?auto_149999 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149998 ?auto_149999 ?auto_149994 )
      ( MAKE-1PILE ?auto_149993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150001 - BLOCK
    )
    :vars
    (
      ?auto_150003 - BLOCK
      ?auto_150006 - BLOCK
      ?auto_150002 - BLOCK
      ?auto_150004 - BLOCK
      ?auto_150008 - BLOCK
      ?auto_150005 - BLOCK
      ?auto_150007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150003 ?auto_150001 ) ( ON-TABLE ?auto_150001 ) ( not ( = ?auto_150001 ?auto_150003 ) ) ( not ( = ?auto_150001 ?auto_150006 ) ) ( not ( = ?auto_150001 ?auto_150002 ) ) ( not ( = ?auto_150003 ?auto_150006 ) ) ( not ( = ?auto_150003 ?auto_150002 ) ) ( not ( = ?auto_150006 ?auto_150002 ) ) ( ON ?auto_150006 ?auto_150003 ) ( ON-TABLE ?auto_150004 ) ( ON ?auto_150008 ?auto_150004 ) ( not ( = ?auto_150004 ?auto_150008 ) ) ( not ( = ?auto_150004 ?auto_150005 ) ) ( not ( = ?auto_150004 ?auto_150007 ) ) ( not ( = ?auto_150004 ?auto_150002 ) ) ( not ( = ?auto_150008 ?auto_150005 ) ) ( not ( = ?auto_150008 ?auto_150007 ) ) ( not ( = ?auto_150008 ?auto_150002 ) ) ( not ( = ?auto_150005 ?auto_150007 ) ) ( not ( = ?auto_150005 ?auto_150002 ) ) ( not ( = ?auto_150007 ?auto_150002 ) ) ( not ( = ?auto_150001 ?auto_150007 ) ) ( not ( = ?auto_150001 ?auto_150004 ) ) ( not ( = ?auto_150001 ?auto_150008 ) ) ( not ( = ?auto_150001 ?auto_150005 ) ) ( not ( = ?auto_150003 ?auto_150007 ) ) ( not ( = ?auto_150003 ?auto_150004 ) ) ( not ( = ?auto_150003 ?auto_150008 ) ) ( not ( = ?auto_150003 ?auto_150005 ) ) ( not ( = ?auto_150006 ?auto_150007 ) ) ( not ( = ?auto_150006 ?auto_150004 ) ) ( not ( = ?auto_150006 ?auto_150008 ) ) ( not ( = ?auto_150006 ?auto_150005 ) ) ( ON ?auto_150002 ?auto_150006 ) ( ON ?auto_150007 ?auto_150002 ) ( CLEAR ?auto_150008 ) ( ON ?auto_150005 ?auto_150007 ) ( CLEAR ?auto_150005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150001 ?auto_150003 ?auto_150006 ?auto_150002 ?auto_150007 )
      ( MAKE-1PILE ?auto_150001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150009 - BLOCK
    )
    :vars
    (
      ?auto_150013 - BLOCK
      ?auto_150016 - BLOCK
      ?auto_150014 - BLOCK
      ?auto_150011 - BLOCK
      ?auto_150010 - BLOCK
      ?auto_150012 - BLOCK
      ?auto_150015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150013 ?auto_150009 ) ( ON-TABLE ?auto_150009 ) ( not ( = ?auto_150009 ?auto_150013 ) ) ( not ( = ?auto_150009 ?auto_150016 ) ) ( not ( = ?auto_150009 ?auto_150014 ) ) ( not ( = ?auto_150013 ?auto_150016 ) ) ( not ( = ?auto_150013 ?auto_150014 ) ) ( not ( = ?auto_150016 ?auto_150014 ) ) ( ON ?auto_150016 ?auto_150013 ) ( ON-TABLE ?auto_150011 ) ( not ( = ?auto_150011 ?auto_150010 ) ) ( not ( = ?auto_150011 ?auto_150012 ) ) ( not ( = ?auto_150011 ?auto_150015 ) ) ( not ( = ?auto_150011 ?auto_150014 ) ) ( not ( = ?auto_150010 ?auto_150012 ) ) ( not ( = ?auto_150010 ?auto_150015 ) ) ( not ( = ?auto_150010 ?auto_150014 ) ) ( not ( = ?auto_150012 ?auto_150015 ) ) ( not ( = ?auto_150012 ?auto_150014 ) ) ( not ( = ?auto_150015 ?auto_150014 ) ) ( not ( = ?auto_150009 ?auto_150015 ) ) ( not ( = ?auto_150009 ?auto_150011 ) ) ( not ( = ?auto_150009 ?auto_150010 ) ) ( not ( = ?auto_150009 ?auto_150012 ) ) ( not ( = ?auto_150013 ?auto_150015 ) ) ( not ( = ?auto_150013 ?auto_150011 ) ) ( not ( = ?auto_150013 ?auto_150010 ) ) ( not ( = ?auto_150013 ?auto_150012 ) ) ( not ( = ?auto_150016 ?auto_150015 ) ) ( not ( = ?auto_150016 ?auto_150011 ) ) ( not ( = ?auto_150016 ?auto_150010 ) ) ( not ( = ?auto_150016 ?auto_150012 ) ) ( ON ?auto_150014 ?auto_150016 ) ( ON ?auto_150015 ?auto_150014 ) ( ON ?auto_150012 ?auto_150015 ) ( CLEAR ?auto_150012 ) ( HOLDING ?auto_150010 ) ( CLEAR ?auto_150011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150011 ?auto_150010 )
      ( MAKE-1PILE ?auto_150009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150017 - BLOCK
    )
    :vars
    (
      ?auto_150021 - BLOCK
      ?auto_150020 - BLOCK
      ?auto_150024 - BLOCK
      ?auto_150019 - BLOCK
      ?auto_150023 - BLOCK
      ?auto_150022 - BLOCK
      ?auto_150018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150021 ?auto_150017 ) ( ON-TABLE ?auto_150017 ) ( not ( = ?auto_150017 ?auto_150021 ) ) ( not ( = ?auto_150017 ?auto_150020 ) ) ( not ( = ?auto_150017 ?auto_150024 ) ) ( not ( = ?auto_150021 ?auto_150020 ) ) ( not ( = ?auto_150021 ?auto_150024 ) ) ( not ( = ?auto_150020 ?auto_150024 ) ) ( ON ?auto_150020 ?auto_150021 ) ( ON-TABLE ?auto_150019 ) ( not ( = ?auto_150019 ?auto_150023 ) ) ( not ( = ?auto_150019 ?auto_150022 ) ) ( not ( = ?auto_150019 ?auto_150018 ) ) ( not ( = ?auto_150019 ?auto_150024 ) ) ( not ( = ?auto_150023 ?auto_150022 ) ) ( not ( = ?auto_150023 ?auto_150018 ) ) ( not ( = ?auto_150023 ?auto_150024 ) ) ( not ( = ?auto_150022 ?auto_150018 ) ) ( not ( = ?auto_150022 ?auto_150024 ) ) ( not ( = ?auto_150018 ?auto_150024 ) ) ( not ( = ?auto_150017 ?auto_150018 ) ) ( not ( = ?auto_150017 ?auto_150019 ) ) ( not ( = ?auto_150017 ?auto_150023 ) ) ( not ( = ?auto_150017 ?auto_150022 ) ) ( not ( = ?auto_150021 ?auto_150018 ) ) ( not ( = ?auto_150021 ?auto_150019 ) ) ( not ( = ?auto_150021 ?auto_150023 ) ) ( not ( = ?auto_150021 ?auto_150022 ) ) ( not ( = ?auto_150020 ?auto_150018 ) ) ( not ( = ?auto_150020 ?auto_150019 ) ) ( not ( = ?auto_150020 ?auto_150023 ) ) ( not ( = ?auto_150020 ?auto_150022 ) ) ( ON ?auto_150024 ?auto_150020 ) ( ON ?auto_150018 ?auto_150024 ) ( ON ?auto_150022 ?auto_150018 ) ( CLEAR ?auto_150019 ) ( ON ?auto_150023 ?auto_150022 ) ( CLEAR ?auto_150023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150017 ?auto_150021 ?auto_150020 ?auto_150024 ?auto_150018 ?auto_150022 )
      ( MAKE-1PILE ?auto_150017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150025 - BLOCK
    )
    :vars
    (
      ?auto_150031 - BLOCK
      ?auto_150029 - BLOCK
      ?auto_150030 - BLOCK
      ?auto_150032 - BLOCK
      ?auto_150026 - BLOCK
      ?auto_150028 - BLOCK
      ?auto_150027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150031 ?auto_150025 ) ( ON-TABLE ?auto_150025 ) ( not ( = ?auto_150025 ?auto_150031 ) ) ( not ( = ?auto_150025 ?auto_150029 ) ) ( not ( = ?auto_150025 ?auto_150030 ) ) ( not ( = ?auto_150031 ?auto_150029 ) ) ( not ( = ?auto_150031 ?auto_150030 ) ) ( not ( = ?auto_150029 ?auto_150030 ) ) ( ON ?auto_150029 ?auto_150031 ) ( not ( = ?auto_150032 ?auto_150026 ) ) ( not ( = ?auto_150032 ?auto_150028 ) ) ( not ( = ?auto_150032 ?auto_150027 ) ) ( not ( = ?auto_150032 ?auto_150030 ) ) ( not ( = ?auto_150026 ?auto_150028 ) ) ( not ( = ?auto_150026 ?auto_150027 ) ) ( not ( = ?auto_150026 ?auto_150030 ) ) ( not ( = ?auto_150028 ?auto_150027 ) ) ( not ( = ?auto_150028 ?auto_150030 ) ) ( not ( = ?auto_150027 ?auto_150030 ) ) ( not ( = ?auto_150025 ?auto_150027 ) ) ( not ( = ?auto_150025 ?auto_150032 ) ) ( not ( = ?auto_150025 ?auto_150026 ) ) ( not ( = ?auto_150025 ?auto_150028 ) ) ( not ( = ?auto_150031 ?auto_150027 ) ) ( not ( = ?auto_150031 ?auto_150032 ) ) ( not ( = ?auto_150031 ?auto_150026 ) ) ( not ( = ?auto_150031 ?auto_150028 ) ) ( not ( = ?auto_150029 ?auto_150027 ) ) ( not ( = ?auto_150029 ?auto_150032 ) ) ( not ( = ?auto_150029 ?auto_150026 ) ) ( not ( = ?auto_150029 ?auto_150028 ) ) ( ON ?auto_150030 ?auto_150029 ) ( ON ?auto_150027 ?auto_150030 ) ( ON ?auto_150028 ?auto_150027 ) ( ON ?auto_150026 ?auto_150028 ) ( CLEAR ?auto_150026 ) ( HOLDING ?auto_150032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150032 )
      ( MAKE-1PILE ?auto_150025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150042 - BLOCK
    )
    :vars
    (
      ?auto_150047 - BLOCK
      ?auto_150049 - BLOCK
      ?auto_150045 - BLOCK
      ?auto_150046 - BLOCK
      ?auto_150048 - BLOCK
      ?auto_150044 - BLOCK
      ?auto_150043 - BLOCK
      ?auto_150050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150047 ?auto_150042 ) ( ON-TABLE ?auto_150042 ) ( not ( = ?auto_150042 ?auto_150047 ) ) ( not ( = ?auto_150042 ?auto_150049 ) ) ( not ( = ?auto_150042 ?auto_150045 ) ) ( not ( = ?auto_150047 ?auto_150049 ) ) ( not ( = ?auto_150047 ?auto_150045 ) ) ( not ( = ?auto_150049 ?auto_150045 ) ) ( ON ?auto_150049 ?auto_150047 ) ( not ( = ?auto_150046 ?auto_150048 ) ) ( not ( = ?auto_150046 ?auto_150044 ) ) ( not ( = ?auto_150046 ?auto_150043 ) ) ( not ( = ?auto_150046 ?auto_150045 ) ) ( not ( = ?auto_150048 ?auto_150044 ) ) ( not ( = ?auto_150048 ?auto_150043 ) ) ( not ( = ?auto_150048 ?auto_150045 ) ) ( not ( = ?auto_150044 ?auto_150043 ) ) ( not ( = ?auto_150044 ?auto_150045 ) ) ( not ( = ?auto_150043 ?auto_150045 ) ) ( not ( = ?auto_150042 ?auto_150043 ) ) ( not ( = ?auto_150042 ?auto_150046 ) ) ( not ( = ?auto_150042 ?auto_150048 ) ) ( not ( = ?auto_150042 ?auto_150044 ) ) ( not ( = ?auto_150047 ?auto_150043 ) ) ( not ( = ?auto_150047 ?auto_150046 ) ) ( not ( = ?auto_150047 ?auto_150048 ) ) ( not ( = ?auto_150047 ?auto_150044 ) ) ( not ( = ?auto_150049 ?auto_150043 ) ) ( not ( = ?auto_150049 ?auto_150046 ) ) ( not ( = ?auto_150049 ?auto_150048 ) ) ( not ( = ?auto_150049 ?auto_150044 ) ) ( ON ?auto_150045 ?auto_150049 ) ( ON ?auto_150043 ?auto_150045 ) ( ON ?auto_150044 ?auto_150043 ) ( ON ?auto_150048 ?auto_150044 ) ( CLEAR ?auto_150048 ) ( ON ?auto_150046 ?auto_150050 ) ( CLEAR ?auto_150046 ) ( HAND-EMPTY ) ( not ( = ?auto_150042 ?auto_150050 ) ) ( not ( = ?auto_150047 ?auto_150050 ) ) ( not ( = ?auto_150049 ?auto_150050 ) ) ( not ( = ?auto_150045 ?auto_150050 ) ) ( not ( = ?auto_150046 ?auto_150050 ) ) ( not ( = ?auto_150048 ?auto_150050 ) ) ( not ( = ?auto_150044 ?auto_150050 ) ) ( not ( = ?auto_150043 ?auto_150050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150046 ?auto_150050 )
      ( MAKE-1PILE ?auto_150042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150051 - BLOCK
    )
    :vars
    (
      ?auto_150057 - BLOCK
      ?auto_150052 - BLOCK
      ?auto_150053 - BLOCK
      ?auto_150056 - BLOCK
      ?auto_150058 - BLOCK
      ?auto_150055 - BLOCK
      ?auto_150054 - BLOCK
      ?auto_150059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150057 ?auto_150051 ) ( ON-TABLE ?auto_150051 ) ( not ( = ?auto_150051 ?auto_150057 ) ) ( not ( = ?auto_150051 ?auto_150052 ) ) ( not ( = ?auto_150051 ?auto_150053 ) ) ( not ( = ?auto_150057 ?auto_150052 ) ) ( not ( = ?auto_150057 ?auto_150053 ) ) ( not ( = ?auto_150052 ?auto_150053 ) ) ( ON ?auto_150052 ?auto_150057 ) ( not ( = ?auto_150056 ?auto_150058 ) ) ( not ( = ?auto_150056 ?auto_150055 ) ) ( not ( = ?auto_150056 ?auto_150054 ) ) ( not ( = ?auto_150056 ?auto_150053 ) ) ( not ( = ?auto_150058 ?auto_150055 ) ) ( not ( = ?auto_150058 ?auto_150054 ) ) ( not ( = ?auto_150058 ?auto_150053 ) ) ( not ( = ?auto_150055 ?auto_150054 ) ) ( not ( = ?auto_150055 ?auto_150053 ) ) ( not ( = ?auto_150054 ?auto_150053 ) ) ( not ( = ?auto_150051 ?auto_150054 ) ) ( not ( = ?auto_150051 ?auto_150056 ) ) ( not ( = ?auto_150051 ?auto_150058 ) ) ( not ( = ?auto_150051 ?auto_150055 ) ) ( not ( = ?auto_150057 ?auto_150054 ) ) ( not ( = ?auto_150057 ?auto_150056 ) ) ( not ( = ?auto_150057 ?auto_150058 ) ) ( not ( = ?auto_150057 ?auto_150055 ) ) ( not ( = ?auto_150052 ?auto_150054 ) ) ( not ( = ?auto_150052 ?auto_150056 ) ) ( not ( = ?auto_150052 ?auto_150058 ) ) ( not ( = ?auto_150052 ?auto_150055 ) ) ( ON ?auto_150053 ?auto_150052 ) ( ON ?auto_150054 ?auto_150053 ) ( ON ?auto_150055 ?auto_150054 ) ( ON ?auto_150056 ?auto_150059 ) ( CLEAR ?auto_150056 ) ( not ( = ?auto_150051 ?auto_150059 ) ) ( not ( = ?auto_150057 ?auto_150059 ) ) ( not ( = ?auto_150052 ?auto_150059 ) ) ( not ( = ?auto_150053 ?auto_150059 ) ) ( not ( = ?auto_150056 ?auto_150059 ) ) ( not ( = ?auto_150058 ?auto_150059 ) ) ( not ( = ?auto_150055 ?auto_150059 ) ) ( not ( = ?auto_150054 ?auto_150059 ) ) ( HOLDING ?auto_150058 ) ( CLEAR ?auto_150055 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150051 ?auto_150057 ?auto_150052 ?auto_150053 ?auto_150054 ?auto_150055 ?auto_150058 )
      ( MAKE-1PILE ?auto_150051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150060 - BLOCK
    )
    :vars
    (
      ?auto_150067 - BLOCK
      ?auto_150064 - BLOCK
      ?auto_150066 - BLOCK
      ?auto_150063 - BLOCK
      ?auto_150062 - BLOCK
      ?auto_150068 - BLOCK
      ?auto_150061 - BLOCK
      ?auto_150065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150067 ?auto_150060 ) ( ON-TABLE ?auto_150060 ) ( not ( = ?auto_150060 ?auto_150067 ) ) ( not ( = ?auto_150060 ?auto_150064 ) ) ( not ( = ?auto_150060 ?auto_150066 ) ) ( not ( = ?auto_150067 ?auto_150064 ) ) ( not ( = ?auto_150067 ?auto_150066 ) ) ( not ( = ?auto_150064 ?auto_150066 ) ) ( ON ?auto_150064 ?auto_150067 ) ( not ( = ?auto_150063 ?auto_150062 ) ) ( not ( = ?auto_150063 ?auto_150068 ) ) ( not ( = ?auto_150063 ?auto_150061 ) ) ( not ( = ?auto_150063 ?auto_150066 ) ) ( not ( = ?auto_150062 ?auto_150068 ) ) ( not ( = ?auto_150062 ?auto_150061 ) ) ( not ( = ?auto_150062 ?auto_150066 ) ) ( not ( = ?auto_150068 ?auto_150061 ) ) ( not ( = ?auto_150068 ?auto_150066 ) ) ( not ( = ?auto_150061 ?auto_150066 ) ) ( not ( = ?auto_150060 ?auto_150061 ) ) ( not ( = ?auto_150060 ?auto_150063 ) ) ( not ( = ?auto_150060 ?auto_150062 ) ) ( not ( = ?auto_150060 ?auto_150068 ) ) ( not ( = ?auto_150067 ?auto_150061 ) ) ( not ( = ?auto_150067 ?auto_150063 ) ) ( not ( = ?auto_150067 ?auto_150062 ) ) ( not ( = ?auto_150067 ?auto_150068 ) ) ( not ( = ?auto_150064 ?auto_150061 ) ) ( not ( = ?auto_150064 ?auto_150063 ) ) ( not ( = ?auto_150064 ?auto_150062 ) ) ( not ( = ?auto_150064 ?auto_150068 ) ) ( ON ?auto_150066 ?auto_150064 ) ( ON ?auto_150061 ?auto_150066 ) ( ON ?auto_150068 ?auto_150061 ) ( ON ?auto_150063 ?auto_150065 ) ( not ( = ?auto_150060 ?auto_150065 ) ) ( not ( = ?auto_150067 ?auto_150065 ) ) ( not ( = ?auto_150064 ?auto_150065 ) ) ( not ( = ?auto_150066 ?auto_150065 ) ) ( not ( = ?auto_150063 ?auto_150065 ) ) ( not ( = ?auto_150062 ?auto_150065 ) ) ( not ( = ?auto_150068 ?auto_150065 ) ) ( not ( = ?auto_150061 ?auto_150065 ) ) ( CLEAR ?auto_150068 ) ( ON ?auto_150062 ?auto_150063 ) ( CLEAR ?auto_150062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150065 ?auto_150063 )
      ( MAKE-1PILE ?auto_150060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150069 - BLOCK
    )
    :vars
    (
      ?auto_150073 - BLOCK
      ?auto_150072 - BLOCK
      ?auto_150077 - BLOCK
      ?auto_150076 - BLOCK
      ?auto_150074 - BLOCK
      ?auto_150075 - BLOCK
      ?auto_150071 - BLOCK
      ?auto_150070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150073 ?auto_150069 ) ( ON-TABLE ?auto_150069 ) ( not ( = ?auto_150069 ?auto_150073 ) ) ( not ( = ?auto_150069 ?auto_150072 ) ) ( not ( = ?auto_150069 ?auto_150077 ) ) ( not ( = ?auto_150073 ?auto_150072 ) ) ( not ( = ?auto_150073 ?auto_150077 ) ) ( not ( = ?auto_150072 ?auto_150077 ) ) ( ON ?auto_150072 ?auto_150073 ) ( not ( = ?auto_150076 ?auto_150074 ) ) ( not ( = ?auto_150076 ?auto_150075 ) ) ( not ( = ?auto_150076 ?auto_150071 ) ) ( not ( = ?auto_150076 ?auto_150077 ) ) ( not ( = ?auto_150074 ?auto_150075 ) ) ( not ( = ?auto_150074 ?auto_150071 ) ) ( not ( = ?auto_150074 ?auto_150077 ) ) ( not ( = ?auto_150075 ?auto_150071 ) ) ( not ( = ?auto_150075 ?auto_150077 ) ) ( not ( = ?auto_150071 ?auto_150077 ) ) ( not ( = ?auto_150069 ?auto_150071 ) ) ( not ( = ?auto_150069 ?auto_150076 ) ) ( not ( = ?auto_150069 ?auto_150074 ) ) ( not ( = ?auto_150069 ?auto_150075 ) ) ( not ( = ?auto_150073 ?auto_150071 ) ) ( not ( = ?auto_150073 ?auto_150076 ) ) ( not ( = ?auto_150073 ?auto_150074 ) ) ( not ( = ?auto_150073 ?auto_150075 ) ) ( not ( = ?auto_150072 ?auto_150071 ) ) ( not ( = ?auto_150072 ?auto_150076 ) ) ( not ( = ?auto_150072 ?auto_150074 ) ) ( not ( = ?auto_150072 ?auto_150075 ) ) ( ON ?auto_150077 ?auto_150072 ) ( ON ?auto_150071 ?auto_150077 ) ( ON ?auto_150076 ?auto_150070 ) ( not ( = ?auto_150069 ?auto_150070 ) ) ( not ( = ?auto_150073 ?auto_150070 ) ) ( not ( = ?auto_150072 ?auto_150070 ) ) ( not ( = ?auto_150077 ?auto_150070 ) ) ( not ( = ?auto_150076 ?auto_150070 ) ) ( not ( = ?auto_150074 ?auto_150070 ) ) ( not ( = ?auto_150075 ?auto_150070 ) ) ( not ( = ?auto_150071 ?auto_150070 ) ) ( ON ?auto_150074 ?auto_150076 ) ( CLEAR ?auto_150074 ) ( ON-TABLE ?auto_150070 ) ( HOLDING ?auto_150075 ) ( CLEAR ?auto_150071 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150069 ?auto_150073 ?auto_150072 ?auto_150077 ?auto_150071 ?auto_150075 )
      ( MAKE-1PILE ?auto_150069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150078 - BLOCK
    )
    :vars
    (
      ?auto_150086 - BLOCK
      ?auto_150085 - BLOCK
      ?auto_150082 - BLOCK
      ?auto_150083 - BLOCK
      ?auto_150080 - BLOCK
      ?auto_150081 - BLOCK
      ?auto_150079 - BLOCK
      ?auto_150084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150086 ?auto_150078 ) ( ON-TABLE ?auto_150078 ) ( not ( = ?auto_150078 ?auto_150086 ) ) ( not ( = ?auto_150078 ?auto_150085 ) ) ( not ( = ?auto_150078 ?auto_150082 ) ) ( not ( = ?auto_150086 ?auto_150085 ) ) ( not ( = ?auto_150086 ?auto_150082 ) ) ( not ( = ?auto_150085 ?auto_150082 ) ) ( ON ?auto_150085 ?auto_150086 ) ( not ( = ?auto_150083 ?auto_150080 ) ) ( not ( = ?auto_150083 ?auto_150081 ) ) ( not ( = ?auto_150083 ?auto_150079 ) ) ( not ( = ?auto_150083 ?auto_150082 ) ) ( not ( = ?auto_150080 ?auto_150081 ) ) ( not ( = ?auto_150080 ?auto_150079 ) ) ( not ( = ?auto_150080 ?auto_150082 ) ) ( not ( = ?auto_150081 ?auto_150079 ) ) ( not ( = ?auto_150081 ?auto_150082 ) ) ( not ( = ?auto_150079 ?auto_150082 ) ) ( not ( = ?auto_150078 ?auto_150079 ) ) ( not ( = ?auto_150078 ?auto_150083 ) ) ( not ( = ?auto_150078 ?auto_150080 ) ) ( not ( = ?auto_150078 ?auto_150081 ) ) ( not ( = ?auto_150086 ?auto_150079 ) ) ( not ( = ?auto_150086 ?auto_150083 ) ) ( not ( = ?auto_150086 ?auto_150080 ) ) ( not ( = ?auto_150086 ?auto_150081 ) ) ( not ( = ?auto_150085 ?auto_150079 ) ) ( not ( = ?auto_150085 ?auto_150083 ) ) ( not ( = ?auto_150085 ?auto_150080 ) ) ( not ( = ?auto_150085 ?auto_150081 ) ) ( ON ?auto_150082 ?auto_150085 ) ( ON ?auto_150079 ?auto_150082 ) ( ON ?auto_150083 ?auto_150084 ) ( not ( = ?auto_150078 ?auto_150084 ) ) ( not ( = ?auto_150086 ?auto_150084 ) ) ( not ( = ?auto_150085 ?auto_150084 ) ) ( not ( = ?auto_150082 ?auto_150084 ) ) ( not ( = ?auto_150083 ?auto_150084 ) ) ( not ( = ?auto_150080 ?auto_150084 ) ) ( not ( = ?auto_150081 ?auto_150084 ) ) ( not ( = ?auto_150079 ?auto_150084 ) ) ( ON ?auto_150080 ?auto_150083 ) ( ON-TABLE ?auto_150084 ) ( CLEAR ?auto_150079 ) ( ON ?auto_150081 ?auto_150080 ) ( CLEAR ?auto_150081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150084 ?auto_150083 ?auto_150080 )
      ( MAKE-1PILE ?auto_150078 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150130 - BLOCK
      ?auto_150131 - BLOCK
      ?auto_150132 - BLOCK
      ?auto_150133 - BLOCK
      ?auto_150134 - BLOCK
      ?auto_150135 - BLOCK
      ?auto_150136 - BLOCK
    )
    :vars
    (
      ?auto_150137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150130 ) ( ON ?auto_150131 ?auto_150130 ) ( ON ?auto_150132 ?auto_150131 ) ( ON ?auto_150133 ?auto_150132 ) ( ON ?auto_150134 ?auto_150133 ) ( not ( = ?auto_150130 ?auto_150131 ) ) ( not ( = ?auto_150130 ?auto_150132 ) ) ( not ( = ?auto_150130 ?auto_150133 ) ) ( not ( = ?auto_150130 ?auto_150134 ) ) ( not ( = ?auto_150130 ?auto_150135 ) ) ( not ( = ?auto_150130 ?auto_150136 ) ) ( not ( = ?auto_150131 ?auto_150132 ) ) ( not ( = ?auto_150131 ?auto_150133 ) ) ( not ( = ?auto_150131 ?auto_150134 ) ) ( not ( = ?auto_150131 ?auto_150135 ) ) ( not ( = ?auto_150131 ?auto_150136 ) ) ( not ( = ?auto_150132 ?auto_150133 ) ) ( not ( = ?auto_150132 ?auto_150134 ) ) ( not ( = ?auto_150132 ?auto_150135 ) ) ( not ( = ?auto_150132 ?auto_150136 ) ) ( not ( = ?auto_150133 ?auto_150134 ) ) ( not ( = ?auto_150133 ?auto_150135 ) ) ( not ( = ?auto_150133 ?auto_150136 ) ) ( not ( = ?auto_150134 ?auto_150135 ) ) ( not ( = ?auto_150134 ?auto_150136 ) ) ( not ( = ?auto_150135 ?auto_150136 ) ) ( ON ?auto_150136 ?auto_150137 ) ( not ( = ?auto_150130 ?auto_150137 ) ) ( not ( = ?auto_150131 ?auto_150137 ) ) ( not ( = ?auto_150132 ?auto_150137 ) ) ( not ( = ?auto_150133 ?auto_150137 ) ) ( not ( = ?auto_150134 ?auto_150137 ) ) ( not ( = ?auto_150135 ?auto_150137 ) ) ( not ( = ?auto_150136 ?auto_150137 ) ) ( CLEAR ?auto_150134 ) ( ON ?auto_150135 ?auto_150136 ) ( CLEAR ?auto_150135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150137 ?auto_150136 )
      ( MAKE-7PILE ?auto_150130 ?auto_150131 ?auto_150132 ?auto_150133 ?auto_150134 ?auto_150135 ?auto_150136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150138 - BLOCK
      ?auto_150139 - BLOCK
      ?auto_150140 - BLOCK
      ?auto_150141 - BLOCK
      ?auto_150142 - BLOCK
      ?auto_150143 - BLOCK
      ?auto_150144 - BLOCK
    )
    :vars
    (
      ?auto_150145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150138 ) ( ON ?auto_150139 ?auto_150138 ) ( ON ?auto_150140 ?auto_150139 ) ( ON ?auto_150141 ?auto_150140 ) ( not ( = ?auto_150138 ?auto_150139 ) ) ( not ( = ?auto_150138 ?auto_150140 ) ) ( not ( = ?auto_150138 ?auto_150141 ) ) ( not ( = ?auto_150138 ?auto_150142 ) ) ( not ( = ?auto_150138 ?auto_150143 ) ) ( not ( = ?auto_150138 ?auto_150144 ) ) ( not ( = ?auto_150139 ?auto_150140 ) ) ( not ( = ?auto_150139 ?auto_150141 ) ) ( not ( = ?auto_150139 ?auto_150142 ) ) ( not ( = ?auto_150139 ?auto_150143 ) ) ( not ( = ?auto_150139 ?auto_150144 ) ) ( not ( = ?auto_150140 ?auto_150141 ) ) ( not ( = ?auto_150140 ?auto_150142 ) ) ( not ( = ?auto_150140 ?auto_150143 ) ) ( not ( = ?auto_150140 ?auto_150144 ) ) ( not ( = ?auto_150141 ?auto_150142 ) ) ( not ( = ?auto_150141 ?auto_150143 ) ) ( not ( = ?auto_150141 ?auto_150144 ) ) ( not ( = ?auto_150142 ?auto_150143 ) ) ( not ( = ?auto_150142 ?auto_150144 ) ) ( not ( = ?auto_150143 ?auto_150144 ) ) ( ON ?auto_150144 ?auto_150145 ) ( not ( = ?auto_150138 ?auto_150145 ) ) ( not ( = ?auto_150139 ?auto_150145 ) ) ( not ( = ?auto_150140 ?auto_150145 ) ) ( not ( = ?auto_150141 ?auto_150145 ) ) ( not ( = ?auto_150142 ?auto_150145 ) ) ( not ( = ?auto_150143 ?auto_150145 ) ) ( not ( = ?auto_150144 ?auto_150145 ) ) ( ON ?auto_150143 ?auto_150144 ) ( CLEAR ?auto_150143 ) ( ON-TABLE ?auto_150145 ) ( HOLDING ?auto_150142 ) ( CLEAR ?auto_150141 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150138 ?auto_150139 ?auto_150140 ?auto_150141 ?auto_150142 )
      ( MAKE-7PILE ?auto_150138 ?auto_150139 ?auto_150140 ?auto_150141 ?auto_150142 ?auto_150143 ?auto_150144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150146 - BLOCK
      ?auto_150147 - BLOCK
      ?auto_150148 - BLOCK
      ?auto_150149 - BLOCK
      ?auto_150150 - BLOCK
      ?auto_150151 - BLOCK
      ?auto_150152 - BLOCK
    )
    :vars
    (
      ?auto_150153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150146 ) ( ON ?auto_150147 ?auto_150146 ) ( ON ?auto_150148 ?auto_150147 ) ( ON ?auto_150149 ?auto_150148 ) ( not ( = ?auto_150146 ?auto_150147 ) ) ( not ( = ?auto_150146 ?auto_150148 ) ) ( not ( = ?auto_150146 ?auto_150149 ) ) ( not ( = ?auto_150146 ?auto_150150 ) ) ( not ( = ?auto_150146 ?auto_150151 ) ) ( not ( = ?auto_150146 ?auto_150152 ) ) ( not ( = ?auto_150147 ?auto_150148 ) ) ( not ( = ?auto_150147 ?auto_150149 ) ) ( not ( = ?auto_150147 ?auto_150150 ) ) ( not ( = ?auto_150147 ?auto_150151 ) ) ( not ( = ?auto_150147 ?auto_150152 ) ) ( not ( = ?auto_150148 ?auto_150149 ) ) ( not ( = ?auto_150148 ?auto_150150 ) ) ( not ( = ?auto_150148 ?auto_150151 ) ) ( not ( = ?auto_150148 ?auto_150152 ) ) ( not ( = ?auto_150149 ?auto_150150 ) ) ( not ( = ?auto_150149 ?auto_150151 ) ) ( not ( = ?auto_150149 ?auto_150152 ) ) ( not ( = ?auto_150150 ?auto_150151 ) ) ( not ( = ?auto_150150 ?auto_150152 ) ) ( not ( = ?auto_150151 ?auto_150152 ) ) ( ON ?auto_150152 ?auto_150153 ) ( not ( = ?auto_150146 ?auto_150153 ) ) ( not ( = ?auto_150147 ?auto_150153 ) ) ( not ( = ?auto_150148 ?auto_150153 ) ) ( not ( = ?auto_150149 ?auto_150153 ) ) ( not ( = ?auto_150150 ?auto_150153 ) ) ( not ( = ?auto_150151 ?auto_150153 ) ) ( not ( = ?auto_150152 ?auto_150153 ) ) ( ON ?auto_150151 ?auto_150152 ) ( ON-TABLE ?auto_150153 ) ( CLEAR ?auto_150149 ) ( ON ?auto_150150 ?auto_150151 ) ( CLEAR ?auto_150150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150153 ?auto_150152 ?auto_150151 )
      ( MAKE-7PILE ?auto_150146 ?auto_150147 ?auto_150148 ?auto_150149 ?auto_150150 ?auto_150151 ?auto_150152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150154 - BLOCK
      ?auto_150155 - BLOCK
      ?auto_150156 - BLOCK
      ?auto_150157 - BLOCK
      ?auto_150158 - BLOCK
      ?auto_150159 - BLOCK
      ?auto_150160 - BLOCK
    )
    :vars
    (
      ?auto_150161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150154 ) ( ON ?auto_150155 ?auto_150154 ) ( ON ?auto_150156 ?auto_150155 ) ( not ( = ?auto_150154 ?auto_150155 ) ) ( not ( = ?auto_150154 ?auto_150156 ) ) ( not ( = ?auto_150154 ?auto_150157 ) ) ( not ( = ?auto_150154 ?auto_150158 ) ) ( not ( = ?auto_150154 ?auto_150159 ) ) ( not ( = ?auto_150154 ?auto_150160 ) ) ( not ( = ?auto_150155 ?auto_150156 ) ) ( not ( = ?auto_150155 ?auto_150157 ) ) ( not ( = ?auto_150155 ?auto_150158 ) ) ( not ( = ?auto_150155 ?auto_150159 ) ) ( not ( = ?auto_150155 ?auto_150160 ) ) ( not ( = ?auto_150156 ?auto_150157 ) ) ( not ( = ?auto_150156 ?auto_150158 ) ) ( not ( = ?auto_150156 ?auto_150159 ) ) ( not ( = ?auto_150156 ?auto_150160 ) ) ( not ( = ?auto_150157 ?auto_150158 ) ) ( not ( = ?auto_150157 ?auto_150159 ) ) ( not ( = ?auto_150157 ?auto_150160 ) ) ( not ( = ?auto_150158 ?auto_150159 ) ) ( not ( = ?auto_150158 ?auto_150160 ) ) ( not ( = ?auto_150159 ?auto_150160 ) ) ( ON ?auto_150160 ?auto_150161 ) ( not ( = ?auto_150154 ?auto_150161 ) ) ( not ( = ?auto_150155 ?auto_150161 ) ) ( not ( = ?auto_150156 ?auto_150161 ) ) ( not ( = ?auto_150157 ?auto_150161 ) ) ( not ( = ?auto_150158 ?auto_150161 ) ) ( not ( = ?auto_150159 ?auto_150161 ) ) ( not ( = ?auto_150160 ?auto_150161 ) ) ( ON ?auto_150159 ?auto_150160 ) ( ON-TABLE ?auto_150161 ) ( ON ?auto_150158 ?auto_150159 ) ( CLEAR ?auto_150158 ) ( HOLDING ?auto_150157 ) ( CLEAR ?auto_150156 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150154 ?auto_150155 ?auto_150156 ?auto_150157 )
      ( MAKE-7PILE ?auto_150154 ?auto_150155 ?auto_150156 ?auto_150157 ?auto_150158 ?auto_150159 ?auto_150160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150162 - BLOCK
      ?auto_150163 - BLOCK
      ?auto_150164 - BLOCK
      ?auto_150165 - BLOCK
      ?auto_150166 - BLOCK
      ?auto_150167 - BLOCK
      ?auto_150168 - BLOCK
    )
    :vars
    (
      ?auto_150169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150162 ) ( ON ?auto_150163 ?auto_150162 ) ( ON ?auto_150164 ?auto_150163 ) ( not ( = ?auto_150162 ?auto_150163 ) ) ( not ( = ?auto_150162 ?auto_150164 ) ) ( not ( = ?auto_150162 ?auto_150165 ) ) ( not ( = ?auto_150162 ?auto_150166 ) ) ( not ( = ?auto_150162 ?auto_150167 ) ) ( not ( = ?auto_150162 ?auto_150168 ) ) ( not ( = ?auto_150163 ?auto_150164 ) ) ( not ( = ?auto_150163 ?auto_150165 ) ) ( not ( = ?auto_150163 ?auto_150166 ) ) ( not ( = ?auto_150163 ?auto_150167 ) ) ( not ( = ?auto_150163 ?auto_150168 ) ) ( not ( = ?auto_150164 ?auto_150165 ) ) ( not ( = ?auto_150164 ?auto_150166 ) ) ( not ( = ?auto_150164 ?auto_150167 ) ) ( not ( = ?auto_150164 ?auto_150168 ) ) ( not ( = ?auto_150165 ?auto_150166 ) ) ( not ( = ?auto_150165 ?auto_150167 ) ) ( not ( = ?auto_150165 ?auto_150168 ) ) ( not ( = ?auto_150166 ?auto_150167 ) ) ( not ( = ?auto_150166 ?auto_150168 ) ) ( not ( = ?auto_150167 ?auto_150168 ) ) ( ON ?auto_150168 ?auto_150169 ) ( not ( = ?auto_150162 ?auto_150169 ) ) ( not ( = ?auto_150163 ?auto_150169 ) ) ( not ( = ?auto_150164 ?auto_150169 ) ) ( not ( = ?auto_150165 ?auto_150169 ) ) ( not ( = ?auto_150166 ?auto_150169 ) ) ( not ( = ?auto_150167 ?auto_150169 ) ) ( not ( = ?auto_150168 ?auto_150169 ) ) ( ON ?auto_150167 ?auto_150168 ) ( ON-TABLE ?auto_150169 ) ( ON ?auto_150166 ?auto_150167 ) ( CLEAR ?auto_150164 ) ( ON ?auto_150165 ?auto_150166 ) ( CLEAR ?auto_150165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150169 ?auto_150168 ?auto_150167 ?auto_150166 )
      ( MAKE-7PILE ?auto_150162 ?auto_150163 ?auto_150164 ?auto_150165 ?auto_150166 ?auto_150167 ?auto_150168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150170 - BLOCK
      ?auto_150171 - BLOCK
      ?auto_150172 - BLOCK
      ?auto_150173 - BLOCK
      ?auto_150174 - BLOCK
      ?auto_150175 - BLOCK
      ?auto_150176 - BLOCK
    )
    :vars
    (
      ?auto_150177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150170 ) ( ON ?auto_150171 ?auto_150170 ) ( not ( = ?auto_150170 ?auto_150171 ) ) ( not ( = ?auto_150170 ?auto_150172 ) ) ( not ( = ?auto_150170 ?auto_150173 ) ) ( not ( = ?auto_150170 ?auto_150174 ) ) ( not ( = ?auto_150170 ?auto_150175 ) ) ( not ( = ?auto_150170 ?auto_150176 ) ) ( not ( = ?auto_150171 ?auto_150172 ) ) ( not ( = ?auto_150171 ?auto_150173 ) ) ( not ( = ?auto_150171 ?auto_150174 ) ) ( not ( = ?auto_150171 ?auto_150175 ) ) ( not ( = ?auto_150171 ?auto_150176 ) ) ( not ( = ?auto_150172 ?auto_150173 ) ) ( not ( = ?auto_150172 ?auto_150174 ) ) ( not ( = ?auto_150172 ?auto_150175 ) ) ( not ( = ?auto_150172 ?auto_150176 ) ) ( not ( = ?auto_150173 ?auto_150174 ) ) ( not ( = ?auto_150173 ?auto_150175 ) ) ( not ( = ?auto_150173 ?auto_150176 ) ) ( not ( = ?auto_150174 ?auto_150175 ) ) ( not ( = ?auto_150174 ?auto_150176 ) ) ( not ( = ?auto_150175 ?auto_150176 ) ) ( ON ?auto_150176 ?auto_150177 ) ( not ( = ?auto_150170 ?auto_150177 ) ) ( not ( = ?auto_150171 ?auto_150177 ) ) ( not ( = ?auto_150172 ?auto_150177 ) ) ( not ( = ?auto_150173 ?auto_150177 ) ) ( not ( = ?auto_150174 ?auto_150177 ) ) ( not ( = ?auto_150175 ?auto_150177 ) ) ( not ( = ?auto_150176 ?auto_150177 ) ) ( ON ?auto_150175 ?auto_150176 ) ( ON-TABLE ?auto_150177 ) ( ON ?auto_150174 ?auto_150175 ) ( ON ?auto_150173 ?auto_150174 ) ( CLEAR ?auto_150173 ) ( HOLDING ?auto_150172 ) ( CLEAR ?auto_150171 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150170 ?auto_150171 ?auto_150172 )
      ( MAKE-7PILE ?auto_150170 ?auto_150171 ?auto_150172 ?auto_150173 ?auto_150174 ?auto_150175 ?auto_150176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150178 - BLOCK
      ?auto_150179 - BLOCK
      ?auto_150180 - BLOCK
      ?auto_150181 - BLOCK
      ?auto_150182 - BLOCK
      ?auto_150183 - BLOCK
      ?auto_150184 - BLOCK
    )
    :vars
    (
      ?auto_150185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150178 ) ( ON ?auto_150179 ?auto_150178 ) ( not ( = ?auto_150178 ?auto_150179 ) ) ( not ( = ?auto_150178 ?auto_150180 ) ) ( not ( = ?auto_150178 ?auto_150181 ) ) ( not ( = ?auto_150178 ?auto_150182 ) ) ( not ( = ?auto_150178 ?auto_150183 ) ) ( not ( = ?auto_150178 ?auto_150184 ) ) ( not ( = ?auto_150179 ?auto_150180 ) ) ( not ( = ?auto_150179 ?auto_150181 ) ) ( not ( = ?auto_150179 ?auto_150182 ) ) ( not ( = ?auto_150179 ?auto_150183 ) ) ( not ( = ?auto_150179 ?auto_150184 ) ) ( not ( = ?auto_150180 ?auto_150181 ) ) ( not ( = ?auto_150180 ?auto_150182 ) ) ( not ( = ?auto_150180 ?auto_150183 ) ) ( not ( = ?auto_150180 ?auto_150184 ) ) ( not ( = ?auto_150181 ?auto_150182 ) ) ( not ( = ?auto_150181 ?auto_150183 ) ) ( not ( = ?auto_150181 ?auto_150184 ) ) ( not ( = ?auto_150182 ?auto_150183 ) ) ( not ( = ?auto_150182 ?auto_150184 ) ) ( not ( = ?auto_150183 ?auto_150184 ) ) ( ON ?auto_150184 ?auto_150185 ) ( not ( = ?auto_150178 ?auto_150185 ) ) ( not ( = ?auto_150179 ?auto_150185 ) ) ( not ( = ?auto_150180 ?auto_150185 ) ) ( not ( = ?auto_150181 ?auto_150185 ) ) ( not ( = ?auto_150182 ?auto_150185 ) ) ( not ( = ?auto_150183 ?auto_150185 ) ) ( not ( = ?auto_150184 ?auto_150185 ) ) ( ON ?auto_150183 ?auto_150184 ) ( ON-TABLE ?auto_150185 ) ( ON ?auto_150182 ?auto_150183 ) ( ON ?auto_150181 ?auto_150182 ) ( CLEAR ?auto_150179 ) ( ON ?auto_150180 ?auto_150181 ) ( CLEAR ?auto_150180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150185 ?auto_150184 ?auto_150183 ?auto_150182 ?auto_150181 )
      ( MAKE-7PILE ?auto_150178 ?auto_150179 ?auto_150180 ?auto_150181 ?auto_150182 ?auto_150183 ?auto_150184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150186 - BLOCK
      ?auto_150187 - BLOCK
      ?auto_150188 - BLOCK
      ?auto_150189 - BLOCK
      ?auto_150190 - BLOCK
      ?auto_150191 - BLOCK
      ?auto_150192 - BLOCK
    )
    :vars
    (
      ?auto_150193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150186 ) ( not ( = ?auto_150186 ?auto_150187 ) ) ( not ( = ?auto_150186 ?auto_150188 ) ) ( not ( = ?auto_150186 ?auto_150189 ) ) ( not ( = ?auto_150186 ?auto_150190 ) ) ( not ( = ?auto_150186 ?auto_150191 ) ) ( not ( = ?auto_150186 ?auto_150192 ) ) ( not ( = ?auto_150187 ?auto_150188 ) ) ( not ( = ?auto_150187 ?auto_150189 ) ) ( not ( = ?auto_150187 ?auto_150190 ) ) ( not ( = ?auto_150187 ?auto_150191 ) ) ( not ( = ?auto_150187 ?auto_150192 ) ) ( not ( = ?auto_150188 ?auto_150189 ) ) ( not ( = ?auto_150188 ?auto_150190 ) ) ( not ( = ?auto_150188 ?auto_150191 ) ) ( not ( = ?auto_150188 ?auto_150192 ) ) ( not ( = ?auto_150189 ?auto_150190 ) ) ( not ( = ?auto_150189 ?auto_150191 ) ) ( not ( = ?auto_150189 ?auto_150192 ) ) ( not ( = ?auto_150190 ?auto_150191 ) ) ( not ( = ?auto_150190 ?auto_150192 ) ) ( not ( = ?auto_150191 ?auto_150192 ) ) ( ON ?auto_150192 ?auto_150193 ) ( not ( = ?auto_150186 ?auto_150193 ) ) ( not ( = ?auto_150187 ?auto_150193 ) ) ( not ( = ?auto_150188 ?auto_150193 ) ) ( not ( = ?auto_150189 ?auto_150193 ) ) ( not ( = ?auto_150190 ?auto_150193 ) ) ( not ( = ?auto_150191 ?auto_150193 ) ) ( not ( = ?auto_150192 ?auto_150193 ) ) ( ON ?auto_150191 ?auto_150192 ) ( ON-TABLE ?auto_150193 ) ( ON ?auto_150190 ?auto_150191 ) ( ON ?auto_150189 ?auto_150190 ) ( ON ?auto_150188 ?auto_150189 ) ( CLEAR ?auto_150188 ) ( HOLDING ?auto_150187 ) ( CLEAR ?auto_150186 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150186 ?auto_150187 )
      ( MAKE-7PILE ?auto_150186 ?auto_150187 ?auto_150188 ?auto_150189 ?auto_150190 ?auto_150191 ?auto_150192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150194 - BLOCK
      ?auto_150195 - BLOCK
      ?auto_150196 - BLOCK
      ?auto_150197 - BLOCK
      ?auto_150198 - BLOCK
      ?auto_150199 - BLOCK
      ?auto_150200 - BLOCK
    )
    :vars
    (
      ?auto_150201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150194 ) ( not ( = ?auto_150194 ?auto_150195 ) ) ( not ( = ?auto_150194 ?auto_150196 ) ) ( not ( = ?auto_150194 ?auto_150197 ) ) ( not ( = ?auto_150194 ?auto_150198 ) ) ( not ( = ?auto_150194 ?auto_150199 ) ) ( not ( = ?auto_150194 ?auto_150200 ) ) ( not ( = ?auto_150195 ?auto_150196 ) ) ( not ( = ?auto_150195 ?auto_150197 ) ) ( not ( = ?auto_150195 ?auto_150198 ) ) ( not ( = ?auto_150195 ?auto_150199 ) ) ( not ( = ?auto_150195 ?auto_150200 ) ) ( not ( = ?auto_150196 ?auto_150197 ) ) ( not ( = ?auto_150196 ?auto_150198 ) ) ( not ( = ?auto_150196 ?auto_150199 ) ) ( not ( = ?auto_150196 ?auto_150200 ) ) ( not ( = ?auto_150197 ?auto_150198 ) ) ( not ( = ?auto_150197 ?auto_150199 ) ) ( not ( = ?auto_150197 ?auto_150200 ) ) ( not ( = ?auto_150198 ?auto_150199 ) ) ( not ( = ?auto_150198 ?auto_150200 ) ) ( not ( = ?auto_150199 ?auto_150200 ) ) ( ON ?auto_150200 ?auto_150201 ) ( not ( = ?auto_150194 ?auto_150201 ) ) ( not ( = ?auto_150195 ?auto_150201 ) ) ( not ( = ?auto_150196 ?auto_150201 ) ) ( not ( = ?auto_150197 ?auto_150201 ) ) ( not ( = ?auto_150198 ?auto_150201 ) ) ( not ( = ?auto_150199 ?auto_150201 ) ) ( not ( = ?auto_150200 ?auto_150201 ) ) ( ON ?auto_150199 ?auto_150200 ) ( ON-TABLE ?auto_150201 ) ( ON ?auto_150198 ?auto_150199 ) ( ON ?auto_150197 ?auto_150198 ) ( ON ?auto_150196 ?auto_150197 ) ( CLEAR ?auto_150194 ) ( ON ?auto_150195 ?auto_150196 ) ( CLEAR ?auto_150195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150201 ?auto_150200 ?auto_150199 ?auto_150198 ?auto_150197 ?auto_150196 )
      ( MAKE-7PILE ?auto_150194 ?auto_150195 ?auto_150196 ?auto_150197 ?auto_150198 ?auto_150199 ?auto_150200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150202 - BLOCK
      ?auto_150203 - BLOCK
      ?auto_150204 - BLOCK
      ?auto_150205 - BLOCK
      ?auto_150206 - BLOCK
      ?auto_150207 - BLOCK
      ?auto_150208 - BLOCK
    )
    :vars
    (
      ?auto_150209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150202 ?auto_150203 ) ) ( not ( = ?auto_150202 ?auto_150204 ) ) ( not ( = ?auto_150202 ?auto_150205 ) ) ( not ( = ?auto_150202 ?auto_150206 ) ) ( not ( = ?auto_150202 ?auto_150207 ) ) ( not ( = ?auto_150202 ?auto_150208 ) ) ( not ( = ?auto_150203 ?auto_150204 ) ) ( not ( = ?auto_150203 ?auto_150205 ) ) ( not ( = ?auto_150203 ?auto_150206 ) ) ( not ( = ?auto_150203 ?auto_150207 ) ) ( not ( = ?auto_150203 ?auto_150208 ) ) ( not ( = ?auto_150204 ?auto_150205 ) ) ( not ( = ?auto_150204 ?auto_150206 ) ) ( not ( = ?auto_150204 ?auto_150207 ) ) ( not ( = ?auto_150204 ?auto_150208 ) ) ( not ( = ?auto_150205 ?auto_150206 ) ) ( not ( = ?auto_150205 ?auto_150207 ) ) ( not ( = ?auto_150205 ?auto_150208 ) ) ( not ( = ?auto_150206 ?auto_150207 ) ) ( not ( = ?auto_150206 ?auto_150208 ) ) ( not ( = ?auto_150207 ?auto_150208 ) ) ( ON ?auto_150208 ?auto_150209 ) ( not ( = ?auto_150202 ?auto_150209 ) ) ( not ( = ?auto_150203 ?auto_150209 ) ) ( not ( = ?auto_150204 ?auto_150209 ) ) ( not ( = ?auto_150205 ?auto_150209 ) ) ( not ( = ?auto_150206 ?auto_150209 ) ) ( not ( = ?auto_150207 ?auto_150209 ) ) ( not ( = ?auto_150208 ?auto_150209 ) ) ( ON ?auto_150207 ?auto_150208 ) ( ON-TABLE ?auto_150209 ) ( ON ?auto_150206 ?auto_150207 ) ( ON ?auto_150205 ?auto_150206 ) ( ON ?auto_150204 ?auto_150205 ) ( ON ?auto_150203 ?auto_150204 ) ( CLEAR ?auto_150203 ) ( HOLDING ?auto_150202 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150202 )
      ( MAKE-7PILE ?auto_150202 ?auto_150203 ?auto_150204 ?auto_150205 ?auto_150206 ?auto_150207 ?auto_150208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150210 - BLOCK
      ?auto_150211 - BLOCK
      ?auto_150212 - BLOCK
      ?auto_150213 - BLOCK
      ?auto_150214 - BLOCK
      ?auto_150215 - BLOCK
      ?auto_150216 - BLOCK
    )
    :vars
    (
      ?auto_150217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150210 ?auto_150211 ) ) ( not ( = ?auto_150210 ?auto_150212 ) ) ( not ( = ?auto_150210 ?auto_150213 ) ) ( not ( = ?auto_150210 ?auto_150214 ) ) ( not ( = ?auto_150210 ?auto_150215 ) ) ( not ( = ?auto_150210 ?auto_150216 ) ) ( not ( = ?auto_150211 ?auto_150212 ) ) ( not ( = ?auto_150211 ?auto_150213 ) ) ( not ( = ?auto_150211 ?auto_150214 ) ) ( not ( = ?auto_150211 ?auto_150215 ) ) ( not ( = ?auto_150211 ?auto_150216 ) ) ( not ( = ?auto_150212 ?auto_150213 ) ) ( not ( = ?auto_150212 ?auto_150214 ) ) ( not ( = ?auto_150212 ?auto_150215 ) ) ( not ( = ?auto_150212 ?auto_150216 ) ) ( not ( = ?auto_150213 ?auto_150214 ) ) ( not ( = ?auto_150213 ?auto_150215 ) ) ( not ( = ?auto_150213 ?auto_150216 ) ) ( not ( = ?auto_150214 ?auto_150215 ) ) ( not ( = ?auto_150214 ?auto_150216 ) ) ( not ( = ?auto_150215 ?auto_150216 ) ) ( ON ?auto_150216 ?auto_150217 ) ( not ( = ?auto_150210 ?auto_150217 ) ) ( not ( = ?auto_150211 ?auto_150217 ) ) ( not ( = ?auto_150212 ?auto_150217 ) ) ( not ( = ?auto_150213 ?auto_150217 ) ) ( not ( = ?auto_150214 ?auto_150217 ) ) ( not ( = ?auto_150215 ?auto_150217 ) ) ( not ( = ?auto_150216 ?auto_150217 ) ) ( ON ?auto_150215 ?auto_150216 ) ( ON-TABLE ?auto_150217 ) ( ON ?auto_150214 ?auto_150215 ) ( ON ?auto_150213 ?auto_150214 ) ( ON ?auto_150212 ?auto_150213 ) ( ON ?auto_150211 ?auto_150212 ) ( ON ?auto_150210 ?auto_150211 ) ( CLEAR ?auto_150210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150217 ?auto_150216 ?auto_150215 ?auto_150214 ?auto_150213 ?auto_150212 ?auto_150211 )
      ( MAKE-7PILE ?auto_150210 ?auto_150211 ?auto_150212 ?auto_150213 ?auto_150214 ?auto_150215 ?auto_150216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150225 - BLOCK
      ?auto_150226 - BLOCK
      ?auto_150227 - BLOCK
      ?auto_150228 - BLOCK
      ?auto_150229 - BLOCK
      ?auto_150230 - BLOCK
      ?auto_150231 - BLOCK
    )
    :vars
    (
      ?auto_150232 - BLOCK
      ?auto_150233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150225 ?auto_150226 ) ) ( not ( = ?auto_150225 ?auto_150227 ) ) ( not ( = ?auto_150225 ?auto_150228 ) ) ( not ( = ?auto_150225 ?auto_150229 ) ) ( not ( = ?auto_150225 ?auto_150230 ) ) ( not ( = ?auto_150225 ?auto_150231 ) ) ( not ( = ?auto_150226 ?auto_150227 ) ) ( not ( = ?auto_150226 ?auto_150228 ) ) ( not ( = ?auto_150226 ?auto_150229 ) ) ( not ( = ?auto_150226 ?auto_150230 ) ) ( not ( = ?auto_150226 ?auto_150231 ) ) ( not ( = ?auto_150227 ?auto_150228 ) ) ( not ( = ?auto_150227 ?auto_150229 ) ) ( not ( = ?auto_150227 ?auto_150230 ) ) ( not ( = ?auto_150227 ?auto_150231 ) ) ( not ( = ?auto_150228 ?auto_150229 ) ) ( not ( = ?auto_150228 ?auto_150230 ) ) ( not ( = ?auto_150228 ?auto_150231 ) ) ( not ( = ?auto_150229 ?auto_150230 ) ) ( not ( = ?auto_150229 ?auto_150231 ) ) ( not ( = ?auto_150230 ?auto_150231 ) ) ( ON ?auto_150231 ?auto_150232 ) ( not ( = ?auto_150225 ?auto_150232 ) ) ( not ( = ?auto_150226 ?auto_150232 ) ) ( not ( = ?auto_150227 ?auto_150232 ) ) ( not ( = ?auto_150228 ?auto_150232 ) ) ( not ( = ?auto_150229 ?auto_150232 ) ) ( not ( = ?auto_150230 ?auto_150232 ) ) ( not ( = ?auto_150231 ?auto_150232 ) ) ( ON ?auto_150230 ?auto_150231 ) ( ON-TABLE ?auto_150232 ) ( ON ?auto_150229 ?auto_150230 ) ( ON ?auto_150228 ?auto_150229 ) ( ON ?auto_150227 ?auto_150228 ) ( ON ?auto_150226 ?auto_150227 ) ( CLEAR ?auto_150226 ) ( ON ?auto_150225 ?auto_150233 ) ( CLEAR ?auto_150225 ) ( HAND-EMPTY ) ( not ( = ?auto_150225 ?auto_150233 ) ) ( not ( = ?auto_150226 ?auto_150233 ) ) ( not ( = ?auto_150227 ?auto_150233 ) ) ( not ( = ?auto_150228 ?auto_150233 ) ) ( not ( = ?auto_150229 ?auto_150233 ) ) ( not ( = ?auto_150230 ?auto_150233 ) ) ( not ( = ?auto_150231 ?auto_150233 ) ) ( not ( = ?auto_150232 ?auto_150233 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150225 ?auto_150233 )
      ( MAKE-7PILE ?auto_150225 ?auto_150226 ?auto_150227 ?auto_150228 ?auto_150229 ?auto_150230 ?auto_150231 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150234 - BLOCK
      ?auto_150235 - BLOCK
      ?auto_150236 - BLOCK
      ?auto_150237 - BLOCK
      ?auto_150238 - BLOCK
      ?auto_150239 - BLOCK
      ?auto_150240 - BLOCK
    )
    :vars
    (
      ?auto_150241 - BLOCK
      ?auto_150242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150234 ?auto_150235 ) ) ( not ( = ?auto_150234 ?auto_150236 ) ) ( not ( = ?auto_150234 ?auto_150237 ) ) ( not ( = ?auto_150234 ?auto_150238 ) ) ( not ( = ?auto_150234 ?auto_150239 ) ) ( not ( = ?auto_150234 ?auto_150240 ) ) ( not ( = ?auto_150235 ?auto_150236 ) ) ( not ( = ?auto_150235 ?auto_150237 ) ) ( not ( = ?auto_150235 ?auto_150238 ) ) ( not ( = ?auto_150235 ?auto_150239 ) ) ( not ( = ?auto_150235 ?auto_150240 ) ) ( not ( = ?auto_150236 ?auto_150237 ) ) ( not ( = ?auto_150236 ?auto_150238 ) ) ( not ( = ?auto_150236 ?auto_150239 ) ) ( not ( = ?auto_150236 ?auto_150240 ) ) ( not ( = ?auto_150237 ?auto_150238 ) ) ( not ( = ?auto_150237 ?auto_150239 ) ) ( not ( = ?auto_150237 ?auto_150240 ) ) ( not ( = ?auto_150238 ?auto_150239 ) ) ( not ( = ?auto_150238 ?auto_150240 ) ) ( not ( = ?auto_150239 ?auto_150240 ) ) ( ON ?auto_150240 ?auto_150241 ) ( not ( = ?auto_150234 ?auto_150241 ) ) ( not ( = ?auto_150235 ?auto_150241 ) ) ( not ( = ?auto_150236 ?auto_150241 ) ) ( not ( = ?auto_150237 ?auto_150241 ) ) ( not ( = ?auto_150238 ?auto_150241 ) ) ( not ( = ?auto_150239 ?auto_150241 ) ) ( not ( = ?auto_150240 ?auto_150241 ) ) ( ON ?auto_150239 ?auto_150240 ) ( ON-TABLE ?auto_150241 ) ( ON ?auto_150238 ?auto_150239 ) ( ON ?auto_150237 ?auto_150238 ) ( ON ?auto_150236 ?auto_150237 ) ( ON ?auto_150234 ?auto_150242 ) ( CLEAR ?auto_150234 ) ( not ( = ?auto_150234 ?auto_150242 ) ) ( not ( = ?auto_150235 ?auto_150242 ) ) ( not ( = ?auto_150236 ?auto_150242 ) ) ( not ( = ?auto_150237 ?auto_150242 ) ) ( not ( = ?auto_150238 ?auto_150242 ) ) ( not ( = ?auto_150239 ?auto_150242 ) ) ( not ( = ?auto_150240 ?auto_150242 ) ) ( not ( = ?auto_150241 ?auto_150242 ) ) ( HOLDING ?auto_150235 ) ( CLEAR ?auto_150236 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150241 ?auto_150240 ?auto_150239 ?auto_150238 ?auto_150237 ?auto_150236 ?auto_150235 )
      ( MAKE-7PILE ?auto_150234 ?auto_150235 ?auto_150236 ?auto_150237 ?auto_150238 ?auto_150239 ?auto_150240 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150243 - BLOCK
      ?auto_150244 - BLOCK
      ?auto_150245 - BLOCK
      ?auto_150246 - BLOCK
      ?auto_150247 - BLOCK
      ?auto_150248 - BLOCK
      ?auto_150249 - BLOCK
    )
    :vars
    (
      ?auto_150250 - BLOCK
      ?auto_150251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150243 ?auto_150244 ) ) ( not ( = ?auto_150243 ?auto_150245 ) ) ( not ( = ?auto_150243 ?auto_150246 ) ) ( not ( = ?auto_150243 ?auto_150247 ) ) ( not ( = ?auto_150243 ?auto_150248 ) ) ( not ( = ?auto_150243 ?auto_150249 ) ) ( not ( = ?auto_150244 ?auto_150245 ) ) ( not ( = ?auto_150244 ?auto_150246 ) ) ( not ( = ?auto_150244 ?auto_150247 ) ) ( not ( = ?auto_150244 ?auto_150248 ) ) ( not ( = ?auto_150244 ?auto_150249 ) ) ( not ( = ?auto_150245 ?auto_150246 ) ) ( not ( = ?auto_150245 ?auto_150247 ) ) ( not ( = ?auto_150245 ?auto_150248 ) ) ( not ( = ?auto_150245 ?auto_150249 ) ) ( not ( = ?auto_150246 ?auto_150247 ) ) ( not ( = ?auto_150246 ?auto_150248 ) ) ( not ( = ?auto_150246 ?auto_150249 ) ) ( not ( = ?auto_150247 ?auto_150248 ) ) ( not ( = ?auto_150247 ?auto_150249 ) ) ( not ( = ?auto_150248 ?auto_150249 ) ) ( ON ?auto_150249 ?auto_150250 ) ( not ( = ?auto_150243 ?auto_150250 ) ) ( not ( = ?auto_150244 ?auto_150250 ) ) ( not ( = ?auto_150245 ?auto_150250 ) ) ( not ( = ?auto_150246 ?auto_150250 ) ) ( not ( = ?auto_150247 ?auto_150250 ) ) ( not ( = ?auto_150248 ?auto_150250 ) ) ( not ( = ?auto_150249 ?auto_150250 ) ) ( ON ?auto_150248 ?auto_150249 ) ( ON-TABLE ?auto_150250 ) ( ON ?auto_150247 ?auto_150248 ) ( ON ?auto_150246 ?auto_150247 ) ( ON ?auto_150245 ?auto_150246 ) ( ON ?auto_150243 ?auto_150251 ) ( not ( = ?auto_150243 ?auto_150251 ) ) ( not ( = ?auto_150244 ?auto_150251 ) ) ( not ( = ?auto_150245 ?auto_150251 ) ) ( not ( = ?auto_150246 ?auto_150251 ) ) ( not ( = ?auto_150247 ?auto_150251 ) ) ( not ( = ?auto_150248 ?auto_150251 ) ) ( not ( = ?auto_150249 ?auto_150251 ) ) ( not ( = ?auto_150250 ?auto_150251 ) ) ( CLEAR ?auto_150245 ) ( ON ?auto_150244 ?auto_150243 ) ( CLEAR ?auto_150244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150251 ?auto_150243 )
      ( MAKE-7PILE ?auto_150243 ?auto_150244 ?auto_150245 ?auto_150246 ?auto_150247 ?auto_150248 ?auto_150249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150252 - BLOCK
      ?auto_150253 - BLOCK
      ?auto_150254 - BLOCK
      ?auto_150255 - BLOCK
      ?auto_150256 - BLOCK
      ?auto_150257 - BLOCK
      ?auto_150258 - BLOCK
    )
    :vars
    (
      ?auto_150259 - BLOCK
      ?auto_150260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150252 ?auto_150253 ) ) ( not ( = ?auto_150252 ?auto_150254 ) ) ( not ( = ?auto_150252 ?auto_150255 ) ) ( not ( = ?auto_150252 ?auto_150256 ) ) ( not ( = ?auto_150252 ?auto_150257 ) ) ( not ( = ?auto_150252 ?auto_150258 ) ) ( not ( = ?auto_150253 ?auto_150254 ) ) ( not ( = ?auto_150253 ?auto_150255 ) ) ( not ( = ?auto_150253 ?auto_150256 ) ) ( not ( = ?auto_150253 ?auto_150257 ) ) ( not ( = ?auto_150253 ?auto_150258 ) ) ( not ( = ?auto_150254 ?auto_150255 ) ) ( not ( = ?auto_150254 ?auto_150256 ) ) ( not ( = ?auto_150254 ?auto_150257 ) ) ( not ( = ?auto_150254 ?auto_150258 ) ) ( not ( = ?auto_150255 ?auto_150256 ) ) ( not ( = ?auto_150255 ?auto_150257 ) ) ( not ( = ?auto_150255 ?auto_150258 ) ) ( not ( = ?auto_150256 ?auto_150257 ) ) ( not ( = ?auto_150256 ?auto_150258 ) ) ( not ( = ?auto_150257 ?auto_150258 ) ) ( ON ?auto_150258 ?auto_150259 ) ( not ( = ?auto_150252 ?auto_150259 ) ) ( not ( = ?auto_150253 ?auto_150259 ) ) ( not ( = ?auto_150254 ?auto_150259 ) ) ( not ( = ?auto_150255 ?auto_150259 ) ) ( not ( = ?auto_150256 ?auto_150259 ) ) ( not ( = ?auto_150257 ?auto_150259 ) ) ( not ( = ?auto_150258 ?auto_150259 ) ) ( ON ?auto_150257 ?auto_150258 ) ( ON-TABLE ?auto_150259 ) ( ON ?auto_150256 ?auto_150257 ) ( ON ?auto_150255 ?auto_150256 ) ( ON ?auto_150252 ?auto_150260 ) ( not ( = ?auto_150252 ?auto_150260 ) ) ( not ( = ?auto_150253 ?auto_150260 ) ) ( not ( = ?auto_150254 ?auto_150260 ) ) ( not ( = ?auto_150255 ?auto_150260 ) ) ( not ( = ?auto_150256 ?auto_150260 ) ) ( not ( = ?auto_150257 ?auto_150260 ) ) ( not ( = ?auto_150258 ?auto_150260 ) ) ( not ( = ?auto_150259 ?auto_150260 ) ) ( ON ?auto_150253 ?auto_150252 ) ( CLEAR ?auto_150253 ) ( ON-TABLE ?auto_150260 ) ( HOLDING ?auto_150254 ) ( CLEAR ?auto_150255 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150259 ?auto_150258 ?auto_150257 ?auto_150256 ?auto_150255 ?auto_150254 )
      ( MAKE-7PILE ?auto_150252 ?auto_150253 ?auto_150254 ?auto_150255 ?auto_150256 ?auto_150257 ?auto_150258 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150261 - BLOCK
      ?auto_150262 - BLOCK
      ?auto_150263 - BLOCK
      ?auto_150264 - BLOCK
      ?auto_150265 - BLOCK
      ?auto_150266 - BLOCK
      ?auto_150267 - BLOCK
    )
    :vars
    (
      ?auto_150268 - BLOCK
      ?auto_150269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150261 ?auto_150262 ) ) ( not ( = ?auto_150261 ?auto_150263 ) ) ( not ( = ?auto_150261 ?auto_150264 ) ) ( not ( = ?auto_150261 ?auto_150265 ) ) ( not ( = ?auto_150261 ?auto_150266 ) ) ( not ( = ?auto_150261 ?auto_150267 ) ) ( not ( = ?auto_150262 ?auto_150263 ) ) ( not ( = ?auto_150262 ?auto_150264 ) ) ( not ( = ?auto_150262 ?auto_150265 ) ) ( not ( = ?auto_150262 ?auto_150266 ) ) ( not ( = ?auto_150262 ?auto_150267 ) ) ( not ( = ?auto_150263 ?auto_150264 ) ) ( not ( = ?auto_150263 ?auto_150265 ) ) ( not ( = ?auto_150263 ?auto_150266 ) ) ( not ( = ?auto_150263 ?auto_150267 ) ) ( not ( = ?auto_150264 ?auto_150265 ) ) ( not ( = ?auto_150264 ?auto_150266 ) ) ( not ( = ?auto_150264 ?auto_150267 ) ) ( not ( = ?auto_150265 ?auto_150266 ) ) ( not ( = ?auto_150265 ?auto_150267 ) ) ( not ( = ?auto_150266 ?auto_150267 ) ) ( ON ?auto_150267 ?auto_150268 ) ( not ( = ?auto_150261 ?auto_150268 ) ) ( not ( = ?auto_150262 ?auto_150268 ) ) ( not ( = ?auto_150263 ?auto_150268 ) ) ( not ( = ?auto_150264 ?auto_150268 ) ) ( not ( = ?auto_150265 ?auto_150268 ) ) ( not ( = ?auto_150266 ?auto_150268 ) ) ( not ( = ?auto_150267 ?auto_150268 ) ) ( ON ?auto_150266 ?auto_150267 ) ( ON-TABLE ?auto_150268 ) ( ON ?auto_150265 ?auto_150266 ) ( ON ?auto_150264 ?auto_150265 ) ( ON ?auto_150261 ?auto_150269 ) ( not ( = ?auto_150261 ?auto_150269 ) ) ( not ( = ?auto_150262 ?auto_150269 ) ) ( not ( = ?auto_150263 ?auto_150269 ) ) ( not ( = ?auto_150264 ?auto_150269 ) ) ( not ( = ?auto_150265 ?auto_150269 ) ) ( not ( = ?auto_150266 ?auto_150269 ) ) ( not ( = ?auto_150267 ?auto_150269 ) ) ( not ( = ?auto_150268 ?auto_150269 ) ) ( ON ?auto_150262 ?auto_150261 ) ( ON-TABLE ?auto_150269 ) ( CLEAR ?auto_150264 ) ( ON ?auto_150263 ?auto_150262 ) ( CLEAR ?auto_150263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150269 ?auto_150261 ?auto_150262 )
      ( MAKE-7PILE ?auto_150261 ?auto_150262 ?auto_150263 ?auto_150264 ?auto_150265 ?auto_150266 ?auto_150267 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150270 - BLOCK
      ?auto_150271 - BLOCK
      ?auto_150272 - BLOCK
      ?auto_150273 - BLOCK
      ?auto_150274 - BLOCK
      ?auto_150275 - BLOCK
      ?auto_150276 - BLOCK
    )
    :vars
    (
      ?auto_150277 - BLOCK
      ?auto_150278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150270 ?auto_150271 ) ) ( not ( = ?auto_150270 ?auto_150272 ) ) ( not ( = ?auto_150270 ?auto_150273 ) ) ( not ( = ?auto_150270 ?auto_150274 ) ) ( not ( = ?auto_150270 ?auto_150275 ) ) ( not ( = ?auto_150270 ?auto_150276 ) ) ( not ( = ?auto_150271 ?auto_150272 ) ) ( not ( = ?auto_150271 ?auto_150273 ) ) ( not ( = ?auto_150271 ?auto_150274 ) ) ( not ( = ?auto_150271 ?auto_150275 ) ) ( not ( = ?auto_150271 ?auto_150276 ) ) ( not ( = ?auto_150272 ?auto_150273 ) ) ( not ( = ?auto_150272 ?auto_150274 ) ) ( not ( = ?auto_150272 ?auto_150275 ) ) ( not ( = ?auto_150272 ?auto_150276 ) ) ( not ( = ?auto_150273 ?auto_150274 ) ) ( not ( = ?auto_150273 ?auto_150275 ) ) ( not ( = ?auto_150273 ?auto_150276 ) ) ( not ( = ?auto_150274 ?auto_150275 ) ) ( not ( = ?auto_150274 ?auto_150276 ) ) ( not ( = ?auto_150275 ?auto_150276 ) ) ( ON ?auto_150276 ?auto_150277 ) ( not ( = ?auto_150270 ?auto_150277 ) ) ( not ( = ?auto_150271 ?auto_150277 ) ) ( not ( = ?auto_150272 ?auto_150277 ) ) ( not ( = ?auto_150273 ?auto_150277 ) ) ( not ( = ?auto_150274 ?auto_150277 ) ) ( not ( = ?auto_150275 ?auto_150277 ) ) ( not ( = ?auto_150276 ?auto_150277 ) ) ( ON ?auto_150275 ?auto_150276 ) ( ON-TABLE ?auto_150277 ) ( ON ?auto_150274 ?auto_150275 ) ( ON ?auto_150270 ?auto_150278 ) ( not ( = ?auto_150270 ?auto_150278 ) ) ( not ( = ?auto_150271 ?auto_150278 ) ) ( not ( = ?auto_150272 ?auto_150278 ) ) ( not ( = ?auto_150273 ?auto_150278 ) ) ( not ( = ?auto_150274 ?auto_150278 ) ) ( not ( = ?auto_150275 ?auto_150278 ) ) ( not ( = ?auto_150276 ?auto_150278 ) ) ( not ( = ?auto_150277 ?auto_150278 ) ) ( ON ?auto_150271 ?auto_150270 ) ( ON-TABLE ?auto_150278 ) ( ON ?auto_150272 ?auto_150271 ) ( CLEAR ?auto_150272 ) ( HOLDING ?auto_150273 ) ( CLEAR ?auto_150274 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150277 ?auto_150276 ?auto_150275 ?auto_150274 ?auto_150273 )
      ( MAKE-7PILE ?auto_150270 ?auto_150271 ?auto_150272 ?auto_150273 ?auto_150274 ?auto_150275 ?auto_150276 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150279 - BLOCK
      ?auto_150280 - BLOCK
      ?auto_150281 - BLOCK
      ?auto_150282 - BLOCK
      ?auto_150283 - BLOCK
      ?auto_150284 - BLOCK
      ?auto_150285 - BLOCK
    )
    :vars
    (
      ?auto_150286 - BLOCK
      ?auto_150287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150279 ?auto_150280 ) ) ( not ( = ?auto_150279 ?auto_150281 ) ) ( not ( = ?auto_150279 ?auto_150282 ) ) ( not ( = ?auto_150279 ?auto_150283 ) ) ( not ( = ?auto_150279 ?auto_150284 ) ) ( not ( = ?auto_150279 ?auto_150285 ) ) ( not ( = ?auto_150280 ?auto_150281 ) ) ( not ( = ?auto_150280 ?auto_150282 ) ) ( not ( = ?auto_150280 ?auto_150283 ) ) ( not ( = ?auto_150280 ?auto_150284 ) ) ( not ( = ?auto_150280 ?auto_150285 ) ) ( not ( = ?auto_150281 ?auto_150282 ) ) ( not ( = ?auto_150281 ?auto_150283 ) ) ( not ( = ?auto_150281 ?auto_150284 ) ) ( not ( = ?auto_150281 ?auto_150285 ) ) ( not ( = ?auto_150282 ?auto_150283 ) ) ( not ( = ?auto_150282 ?auto_150284 ) ) ( not ( = ?auto_150282 ?auto_150285 ) ) ( not ( = ?auto_150283 ?auto_150284 ) ) ( not ( = ?auto_150283 ?auto_150285 ) ) ( not ( = ?auto_150284 ?auto_150285 ) ) ( ON ?auto_150285 ?auto_150286 ) ( not ( = ?auto_150279 ?auto_150286 ) ) ( not ( = ?auto_150280 ?auto_150286 ) ) ( not ( = ?auto_150281 ?auto_150286 ) ) ( not ( = ?auto_150282 ?auto_150286 ) ) ( not ( = ?auto_150283 ?auto_150286 ) ) ( not ( = ?auto_150284 ?auto_150286 ) ) ( not ( = ?auto_150285 ?auto_150286 ) ) ( ON ?auto_150284 ?auto_150285 ) ( ON-TABLE ?auto_150286 ) ( ON ?auto_150283 ?auto_150284 ) ( ON ?auto_150279 ?auto_150287 ) ( not ( = ?auto_150279 ?auto_150287 ) ) ( not ( = ?auto_150280 ?auto_150287 ) ) ( not ( = ?auto_150281 ?auto_150287 ) ) ( not ( = ?auto_150282 ?auto_150287 ) ) ( not ( = ?auto_150283 ?auto_150287 ) ) ( not ( = ?auto_150284 ?auto_150287 ) ) ( not ( = ?auto_150285 ?auto_150287 ) ) ( not ( = ?auto_150286 ?auto_150287 ) ) ( ON ?auto_150280 ?auto_150279 ) ( ON-TABLE ?auto_150287 ) ( ON ?auto_150281 ?auto_150280 ) ( CLEAR ?auto_150283 ) ( ON ?auto_150282 ?auto_150281 ) ( CLEAR ?auto_150282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150287 ?auto_150279 ?auto_150280 ?auto_150281 )
      ( MAKE-7PILE ?auto_150279 ?auto_150280 ?auto_150281 ?auto_150282 ?auto_150283 ?auto_150284 ?auto_150285 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150288 - BLOCK
      ?auto_150289 - BLOCK
      ?auto_150290 - BLOCK
      ?auto_150291 - BLOCK
      ?auto_150292 - BLOCK
      ?auto_150293 - BLOCK
      ?auto_150294 - BLOCK
    )
    :vars
    (
      ?auto_150296 - BLOCK
      ?auto_150295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150288 ?auto_150289 ) ) ( not ( = ?auto_150288 ?auto_150290 ) ) ( not ( = ?auto_150288 ?auto_150291 ) ) ( not ( = ?auto_150288 ?auto_150292 ) ) ( not ( = ?auto_150288 ?auto_150293 ) ) ( not ( = ?auto_150288 ?auto_150294 ) ) ( not ( = ?auto_150289 ?auto_150290 ) ) ( not ( = ?auto_150289 ?auto_150291 ) ) ( not ( = ?auto_150289 ?auto_150292 ) ) ( not ( = ?auto_150289 ?auto_150293 ) ) ( not ( = ?auto_150289 ?auto_150294 ) ) ( not ( = ?auto_150290 ?auto_150291 ) ) ( not ( = ?auto_150290 ?auto_150292 ) ) ( not ( = ?auto_150290 ?auto_150293 ) ) ( not ( = ?auto_150290 ?auto_150294 ) ) ( not ( = ?auto_150291 ?auto_150292 ) ) ( not ( = ?auto_150291 ?auto_150293 ) ) ( not ( = ?auto_150291 ?auto_150294 ) ) ( not ( = ?auto_150292 ?auto_150293 ) ) ( not ( = ?auto_150292 ?auto_150294 ) ) ( not ( = ?auto_150293 ?auto_150294 ) ) ( ON ?auto_150294 ?auto_150296 ) ( not ( = ?auto_150288 ?auto_150296 ) ) ( not ( = ?auto_150289 ?auto_150296 ) ) ( not ( = ?auto_150290 ?auto_150296 ) ) ( not ( = ?auto_150291 ?auto_150296 ) ) ( not ( = ?auto_150292 ?auto_150296 ) ) ( not ( = ?auto_150293 ?auto_150296 ) ) ( not ( = ?auto_150294 ?auto_150296 ) ) ( ON ?auto_150293 ?auto_150294 ) ( ON-TABLE ?auto_150296 ) ( ON ?auto_150288 ?auto_150295 ) ( not ( = ?auto_150288 ?auto_150295 ) ) ( not ( = ?auto_150289 ?auto_150295 ) ) ( not ( = ?auto_150290 ?auto_150295 ) ) ( not ( = ?auto_150291 ?auto_150295 ) ) ( not ( = ?auto_150292 ?auto_150295 ) ) ( not ( = ?auto_150293 ?auto_150295 ) ) ( not ( = ?auto_150294 ?auto_150295 ) ) ( not ( = ?auto_150296 ?auto_150295 ) ) ( ON ?auto_150289 ?auto_150288 ) ( ON-TABLE ?auto_150295 ) ( ON ?auto_150290 ?auto_150289 ) ( ON ?auto_150291 ?auto_150290 ) ( CLEAR ?auto_150291 ) ( HOLDING ?auto_150292 ) ( CLEAR ?auto_150293 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150296 ?auto_150294 ?auto_150293 ?auto_150292 )
      ( MAKE-7PILE ?auto_150288 ?auto_150289 ?auto_150290 ?auto_150291 ?auto_150292 ?auto_150293 ?auto_150294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150297 - BLOCK
      ?auto_150298 - BLOCK
      ?auto_150299 - BLOCK
      ?auto_150300 - BLOCK
      ?auto_150301 - BLOCK
      ?auto_150302 - BLOCK
      ?auto_150303 - BLOCK
    )
    :vars
    (
      ?auto_150304 - BLOCK
      ?auto_150305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150297 ?auto_150298 ) ) ( not ( = ?auto_150297 ?auto_150299 ) ) ( not ( = ?auto_150297 ?auto_150300 ) ) ( not ( = ?auto_150297 ?auto_150301 ) ) ( not ( = ?auto_150297 ?auto_150302 ) ) ( not ( = ?auto_150297 ?auto_150303 ) ) ( not ( = ?auto_150298 ?auto_150299 ) ) ( not ( = ?auto_150298 ?auto_150300 ) ) ( not ( = ?auto_150298 ?auto_150301 ) ) ( not ( = ?auto_150298 ?auto_150302 ) ) ( not ( = ?auto_150298 ?auto_150303 ) ) ( not ( = ?auto_150299 ?auto_150300 ) ) ( not ( = ?auto_150299 ?auto_150301 ) ) ( not ( = ?auto_150299 ?auto_150302 ) ) ( not ( = ?auto_150299 ?auto_150303 ) ) ( not ( = ?auto_150300 ?auto_150301 ) ) ( not ( = ?auto_150300 ?auto_150302 ) ) ( not ( = ?auto_150300 ?auto_150303 ) ) ( not ( = ?auto_150301 ?auto_150302 ) ) ( not ( = ?auto_150301 ?auto_150303 ) ) ( not ( = ?auto_150302 ?auto_150303 ) ) ( ON ?auto_150303 ?auto_150304 ) ( not ( = ?auto_150297 ?auto_150304 ) ) ( not ( = ?auto_150298 ?auto_150304 ) ) ( not ( = ?auto_150299 ?auto_150304 ) ) ( not ( = ?auto_150300 ?auto_150304 ) ) ( not ( = ?auto_150301 ?auto_150304 ) ) ( not ( = ?auto_150302 ?auto_150304 ) ) ( not ( = ?auto_150303 ?auto_150304 ) ) ( ON ?auto_150302 ?auto_150303 ) ( ON-TABLE ?auto_150304 ) ( ON ?auto_150297 ?auto_150305 ) ( not ( = ?auto_150297 ?auto_150305 ) ) ( not ( = ?auto_150298 ?auto_150305 ) ) ( not ( = ?auto_150299 ?auto_150305 ) ) ( not ( = ?auto_150300 ?auto_150305 ) ) ( not ( = ?auto_150301 ?auto_150305 ) ) ( not ( = ?auto_150302 ?auto_150305 ) ) ( not ( = ?auto_150303 ?auto_150305 ) ) ( not ( = ?auto_150304 ?auto_150305 ) ) ( ON ?auto_150298 ?auto_150297 ) ( ON-TABLE ?auto_150305 ) ( ON ?auto_150299 ?auto_150298 ) ( ON ?auto_150300 ?auto_150299 ) ( CLEAR ?auto_150302 ) ( ON ?auto_150301 ?auto_150300 ) ( CLEAR ?auto_150301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150305 ?auto_150297 ?auto_150298 ?auto_150299 ?auto_150300 )
      ( MAKE-7PILE ?auto_150297 ?auto_150298 ?auto_150299 ?auto_150300 ?auto_150301 ?auto_150302 ?auto_150303 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150306 - BLOCK
      ?auto_150307 - BLOCK
      ?auto_150308 - BLOCK
      ?auto_150309 - BLOCK
      ?auto_150310 - BLOCK
      ?auto_150311 - BLOCK
      ?auto_150312 - BLOCK
    )
    :vars
    (
      ?auto_150314 - BLOCK
      ?auto_150313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150306 ?auto_150307 ) ) ( not ( = ?auto_150306 ?auto_150308 ) ) ( not ( = ?auto_150306 ?auto_150309 ) ) ( not ( = ?auto_150306 ?auto_150310 ) ) ( not ( = ?auto_150306 ?auto_150311 ) ) ( not ( = ?auto_150306 ?auto_150312 ) ) ( not ( = ?auto_150307 ?auto_150308 ) ) ( not ( = ?auto_150307 ?auto_150309 ) ) ( not ( = ?auto_150307 ?auto_150310 ) ) ( not ( = ?auto_150307 ?auto_150311 ) ) ( not ( = ?auto_150307 ?auto_150312 ) ) ( not ( = ?auto_150308 ?auto_150309 ) ) ( not ( = ?auto_150308 ?auto_150310 ) ) ( not ( = ?auto_150308 ?auto_150311 ) ) ( not ( = ?auto_150308 ?auto_150312 ) ) ( not ( = ?auto_150309 ?auto_150310 ) ) ( not ( = ?auto_150309 ?auto_150311 ) ) ( not ( = ?auto_150309 ?auto_150312 ) ) ( not ( = ?auto_150310 ?auto_150311 ) ) ( not ( = ?auto_150310 ?auto_150312 ) ) ( not ( = ?auto_150311 ?auto_150312 ) ) ( ON ?auto_150312 ?auto_150314 ) ( not ( = ?auto_150306 ?auto_150314 ) ) ( not ( = ?auto_150307 ?auto_150314 ) ) ( not ( = ?auto_150308 ?auto_150314 ) ) ( not ( = ?auto_150309 ?auto_150314 ) ) ( not ( = ?auto_150310 ?auto_150314 ) ) ( not ( = ?auto_150311 ?auto_150314 ) ) ( not ( = ?auto_150312 ?auto_150314 ) ) ( ON-TABLE ?auto_150314 ) ( ON ?auto_150306 ?auto_150313 ) ( not ( = ?auto_150306 ?auto_150313 ) ) ( not ( = ?auto_150307 ?auto_150313 ) ) ( not ( = ?auto_150308 ?auto_150313 ) ) ( not ( = ?auto_150309 ?auto_150313 ) ) ( not ( = ?auto_150310 ?auto_150313 ) ) ( not ( = ?auto_150311 ?auto_150313 ) ) ( not ( = ?auto_150312 ?auto_150313 ) ) ( not ( = ?auto_150314 ?auto_150313 ) ) ( ON ?auto_150307 ?auto_150306 ) ( ON-TABLE ?auto_150313 ) ( ON ?auto_150308 ?auto_150307 ) ( ON ?auto_150309 ?auto_150308 ) ( ON ?auto_150310 ?auto_150309 ) ( CLEAR ?auto_150310 ) ( HOLDING ?auto_150311 ) ( CLEAR ?auto_150312 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150314 ?auto_150312 ?auto_150311 )
      ( MAKE-7PILE ?auto_150306 ?auto_150307 ?auto_150308 ?auto_150309 ?auto_150310 ?auto_150311 ?auto_150312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150315 - BLOCK
      ?auto_150316 - BLOCK
      ?auto_150317 - BLOCK
      ?auto_150318 - BLOCK
      ?auto_150319 - BLOCK
      ?auto_150320 - BLOCK
      ?auto_150321 - BLOCK
    )
    :vars
    (
      ?auto_150322 - BLOCK
      ?auto_150323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150315 ?auto_150316 ) ) ( not ( = ?auto_150315 ?auto_150317 ) ) ( not ( = ?auto_150315 ?auto_150318 ) ) ( not ( = ?auto_150315 ?auto_150319 ) ) ( not ( = ?auto_150315 ?auto_150320 ) ) ( not ( = ?auto_150315 ?auto_150321 ) ) ( not ( = ?auto_150316 ?auto_150317 ) ) ( not ( = ?auto_150316 ?auto_150318 ) ) ( not ( = ?auto_150316 ?auto_150319 ) ) ( not ( = ?auto_150316 ?auto_150320 ) ) ( not ( = ?auto_150316 ?auto_150321 ) ) ( not ( = ?auto_150317 ?auto_150318 ) ) ( not ( = ?auto_150317 ?auto_150319 ) ) ( not ( = ?auto_150317 ?auto_150320 ) ) ( not ( = ?auto_150317 ?auto_150321 ) ) ( not ( = ?auto_150318 ?auto_150319 ) ) ( not ( = ?auto_150318 ?auto_150320 ) ) ( not ( = ?auto_150318 ?auto_150321 ) ) ( not ( = ?auto_150319 ?auto_150320 ) ) ( not ( = ?auto_150319 ?auto_150321 ) ) ( not ( = ?auto_150320 ?auto_150321 ) ) ( ON ?auto_150321 ?auto_150322 ) ( not ( = ?auto_150315 ?auto_150322 ) ) ( not ( = ?auto_150316 ?auto_150322 ) ) ( not ( = ?auto_150317 ?auto_150322 ) ) ( not ( = ?auto_150318 ?auto_150322 ) ) ( not ( = ?auto_150319 ?auto_150322 ) ) ( not ( = ?auto_150320 ?auto_150322 ) ) ( not ( = ?auto_150321 ?auto_150322 ) ) ( ON-TABLE ?auto_150322 ) ( ON ?auto_150315 ?auto_150323 ) ( not ( = ?auto_150315 ?auto_150323 ) ) ( not ( = ?auto_150316 ?auto_150323 ) ) ( not ( = ?auto_150317 ?auto_150323 ) ) ( not ( = ?auto_150318 ?auto_150323 ) ) ( not ( = ?auto_150319 ?auto_150323 ) ) ( not ( = ?auto_150320 ?auto_150323 ) ) ( not ( = ?auto_150321 ?auto_150323 ) ) ( not ( = ?auto_150322 ?auto_150323 ) ) ( ON ?auto_150316 ?auto_150315 ) ( ON-TABLE ?auto_150323 ) ( ON ?auto_150317 ?auto_150316 ) ( ON ?auto_150318 ?auto_150317 ) ( ON ?auto_150319 ?auto_150318 ) ( CLEAR ?auto_150321 ) ( ON ?auto_150320 ?auto_150319 ) ( CLEAR ?auto_150320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150323 ?auto_150315 ?auto_150316 ?auto_150317 ?auto_150318 ?auto_150319 )
      ( MAKE-7PILE ?auto_150315 ?auto_150316 ?auto_150317 ?auto_150318 ?auto_150319 ?auto_150320 ?auto_150321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150324 - BLOCK
      ?auto_150325 - BLOCK
      ?auto_150326 - BLOCK
      ?auto_150327 - BLOCK
      ?auto_150328 - BLOCK
      ?auto_150329 - BLOCK
      ?auto_150330 - BLOCK
    )
    :vars
    (
      ?auto_150331 - BLOCK
      ?auto_150332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150324 ?auto_150325 ) ) ( not ( = ?auto_150324 ?auto_150326 ) ) ( not ( = ?auto_150324 ?auto_150327 ) ) ( not ( = ?auto_150324 ?auto_150328 ) ) ( not ( = ?auto_150324 ?auto_150329 ) ) ( not ( = ?auto_150324 ?auto_150330 ) ) ( not ( = ?auto_150325 ?auto_150326 ) ) ( not ( = ?auto_150325 ?auto_150327 ) ) ( not ( = ?auto_150325 ?auto_150328 ) ) ( not ( = ?auto_150325 ?auto_150329 ) ) ( not ( = ?auto_150325 ?auto_150330 ) ) ( not ( = ?auto_150326 ?auto_150327 ) ) ( not ( = ?auto_150326 ?auto_150328 ) ) ( not ( = ?auto_150326 ?auto_150329 ) ) ( not ( = ?auto_150326 ?auto_150330 ) ) ( not ( = ?auto_150327 ?auto_150328 ) ) ( not ( = ?auto_150327 ?auto_150329 ) ) ( not ( = ?auto_150327 ?auto_150330 ) ) ( not ( = ?auto_150328 ?auto_150329 ) ) ( not ( = ?auto_150328 ?auto_150330 ) ) ( not ( = ?auto_150329 ?auto_150330 ) ) ( not ( = ?auto_150324 ?auto_150331 ) ) ( not ( = ?auto_150325 ?auto_150331 ) ) ( not ( = ?auto_150326 ?auto_150331 ) ) ( not ( = ?auto_150327 ?auto_150331 ) ) ( not ( = ?auto_150328 ?auto_150331 ) ) ( not ( = ?auto_150329 ?auto_150331 ) ) ( not ( = ?auto_150330 ?auto_150331 ) ) ( ON-TABLE ?auto_150331 ) ( ON ?auto_150324 ?auto_150332 ) ( not ( = ?auto_150324 ?auto_150332 ) ) ( not ( = ?auto_150325 ?auto_150332 ) ) ( not ( = ?auto_150326 ?auto_150332 ) ) ( not ( = ?auto_150327 ?auto_150332 ) ) ( not ( = ?auto_150328 ?auto_150332 ) ) ( not ( = ?auto_150329 ?auto_150332 ) ) ( not ( = ?auto_150330 ?auto_150332 ) ) ( not ( = ?auto_150331 ?auto_150332 ) ) ( ON ?auto_150325 ?auto_150324 ) ( ON-TABLE ?auto_150332 ) ( ON ?auto_150326 ?auto_150325 ) ( ON ?auto_150327 ?auto_150326 ) ( ON ?auto_150328 ?auto_150327 ) ( ON ?auto_150329 ?auto_150328 ) ( CLEAR ?auto_150329 ) ( HOLDING ?auto_150330 ) ( CLEAR ?auto_150331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150331 ?auto_150330 )
      ( MAKE-7PILE ?auto_150324 ?auto_150325 ?auto_150326 ?auto_150327 ?auto_150328 ?auto_150329 ?auto_150330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150333 - BLOCK
      ?auto_150334 - BLOCK
      ?auto_150335 - BLOCK
      ?auto_150336 - BLOCK
      ?auto_150337 - BLOCK
      ?auto_150338 - BLOCK
      ?auto_150339 - BLOCK
    )
    :vars
    (
      ?auto_150340 - BLOCK
      ?auto_150341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150333 ?auto_150334 ) ) ( not ( = ?auto_150333 ?auto_150335 ) ) ( not ( = ?auto_150333 ?auto_150336 ) ) ( not ( = ?auto_150333 ?auto_150337 ) ) ( not ( = ?auto_150333 ?auto_150338 ) ) ( not ( = ?auto_150333 ?auto_150339 ) ) ( not ( = ?auto_150334 ?auto_150335 ) ) ( not ( = ?auto_150334 ?auto_150336 ) ) ( not ( = ?auto_150334 ?auto_150337 ) ) ( not ( = ?auto_150334 ?auto_150338 ) ) ( not ( = ?auto_150334 ?auto_150339 ) ) ( not ( = ?auto_150335 ?auto_150336 ) ) ( not ( = ?auto_150335 ?auto_150337 ) ) ( not ( = ?auto_150335 ?auto_150338 ) ) ( not ( = ?auto_150335 ?auto_150339 ) ) ( not ( = ?auto_150336 ?auto_150337 ) ) ( not ( = ?auto_150336 ?auto_150338 ) ) ( not ( = ?auto_150336 ?auto_150339 ) ) ( not ( = ?auto_150337 ?auto_150338 ) ) ( not ( = ?auto_150337 ?auto_150339 ) ) ( not ( = ?auto_150338 ?auto_150339 ) ) ( not ( = ?auto_150333 ?auto_150340 ) ) ( not ( = ?auto_150334 ?auto_150340 ) ) ( not ( = ?auto_150335 ?auto_150340 ) ) ( not ( = ?auto_150336 ?auto_150340 ) ) ( not ( = ?auto_150337 ?auto_150340 ) ) ( not ( = ?auto_150338 ?auto_150340 ) ) ( not ( = ?auto_150339 ?auto_150340 ) ) ( ON-TABLE ?auto_150340 ) ( ON ?auto_150333 ?auto_150341 ) ( not ( = ?auto_150333 ?auto_150341 ) ) ( not ( = ?auto_150334 ?auto_150341 ) ) ( not ( = ?auto_150335 ?auto_150341 ) ) ( not ( = ?auto_150336 ?auto_150341 ) ) ( not ( = ?auto_150337 ?auto_150341 ) ) ( not ( = ?auto_150338 ?auto_150341 ) ) ( not ( = ?auto_150339 ?auto_150341 ) ) ( not ( = ?auto_150340 ?auto_150341 ) ) ( ON ?auto_150334 ?auto_150333 ) ( ON-TABLE ?auto_150341 ) ( ON ?auto_150335 ?auto_150334 ) ( ON ?auto_150336 ?auto_150335 ) ( ON ?auto_150337 ?auto_150336 ) ( ON ?auto_150338 ?auto_150337 ) ( CLEAR ?auto_150340 ) ( ON ?auto_150339 ?auto_150338 ) ( CLEAR ?auto_150339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150341 ?auto_150333 ?auto_150334 ?auto_150335 ?auto_150336 ?auto_150337 ?auto_150338 )
      ( MAKE-7PILE ?auto_150333 ?auto_150334 ?auto_150335 ?auto_150336 ?auto_150337 ?auto_150338 ?auto_150339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150342 - BLOCK
      ?auto_150343 - BLOCK
      ?auto_150344 - BLOCK
      ?auto_150345 - BLOCK
      ?auto_150346 - BLOCK
      ?auto_150347 - BLOCK
      ?auto_150348 - BLOCK
    )
    :vars
    (
      ?auto_150350 - BLOCK
      ?auto_150349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150342 ?auto_150343 ) ) ( not ( = ?auto_150342 ?auto_150344 ) ) ( not ( = ?auto_150342 ?auto_150345 ) ) ( not ( = ?auto_150342 ?auto_150346 ) ) ( not ( = ?auto_150342 ?auto_150347 ) ) ( not ( = ?auto_150342 ?auto_150348 ) ) ( not ( = ?auto_150343 ?auto_150344 ) ) ( not ( = ?auto_150343 ?auto_150345 ) ) ( not ( = ?auto_150343 ?auto_150346 ) ) ( not ( = ?auto_150343 ?auto_150347 ) ) ( not ( = ?auto_150343 ?auto_150348 ) ) ( not ( = ?auto_150344 ?auto_150345 ) ) ( not ( = ?auto_150344 ?auto_150346 ) ) ( not ( = ?auto_150344 ?auto_150347 ) ) ( not ( = ?auto_150344 ?auto_150348 ) ) ( not ( = ?auto_150345 ?auto_150346 ) ) ( not ( = ?auto_150345 ?auto_150347 ) ) ( not ( = ?auto_150345 ?auto_150348 ) ) ( not ( = ?auto_150346 ?auto_150347 ) ) ( not ( = ?auto_150346 ?auto_150348 ) ) ( not ( = ?auto_150347 ?auto_150348 ) ) ( not ( = ?auto_150342 ?auto_150350 ) ) ( not ( = ?auto_150343 ?auto_150350 ) ) ( not ( = ?auto_150344 ?auto_150350 ) ) ( not ( = ?auto_150345 ?auto_150350 ) ) ( not ( = ?auto_150346 ?auto_150350 ) ) ( not ( = ?auto_150347 ?auto_150350 ) ) ( not ( = ?auto_150348 ?auto_150350 ) ) ( ON ?auto_150342 ?auto_150349 ) ( not ( = ?auto_150342 ?auto_150349 ) ) ( not ( = ?auto_150343 ?auto_150349 ) ) ( not ( = ?auto_150344 ?auto_150349 ) ) ( not ( = ?auto_150345 ?auto_150349 ) ) ( not ( = ?auto_150346 ?auto_150349 ) ) ( not ( = ?auto_150347 ?auto_150349 ) ) ( not ( = ?auto_150348 ?auto_150349 ) ) ( not ( = ?auto_150350 ?auto_150349 ) ) ( ON ?auto_150343 ?auto_150342 ) ( ON-TABLE ?auto_150349 ) ( ON ?auto_150344 ?auto_150343 ) ( ON ?auto_150345 ?auto_150344 ) ( ON ?auto_150346 ?auto_150345 ) ( ON ?auto_150347 ?auto_150346 ) ( ON ?auto_150348 ?auto_150347 ) ( CLEAR ?auto_150348 ) ( HOLDING ?auto_150350 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150350 )
      ( MAKE-7PILE ?auto_150342 ?auto_150343 ?auto_150344 ?auto_150345 ?auto_150346 ?auto_150347 ?auto_150348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150351 - BLOCK
      ?auto_150352 - BLOCK
      ?auto_150353 - BLOCK
      ?auto_150354 - BLOCK
      ?auto_150355 - BLOCK
      ?auto_150356 - BLOCK
      ?auto_150357 - BLOCK
    )
    :vars
    (
      ?auto_150359 - BLOCK
      ?auto_150358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150351 ?auto_150352 ) ) ( not ( = ?auto_150351 ?auto_150353 ) ) ( not ( = ?auto_150351 ?auto_150354 ) ) ( not ( = ?auto_150351 ?auto_150355 ) ) ( not ( = ?auto_150351 ?auto_150356 ) ) ( not ( = ?auto_150351 ?auto_150357 ) ) ( not ( = ?auto_150352 ?auto_150353 ) ) ( not ( = ?auto_150352 ?auto_150354 ) ) ( not ( = ?auto_150352 ?auto_150355 ) ) ( not ( = ?auto_150352 ?auto_150356 ) ) ( not ( = ?auto_150352 ?auto_150357 ) ) ( not ( = ?auto_150353 ?auto_150354 ) ) ( not ( = ?auto_150353 ?auto_150355 ) ) ( not ( = ?auto_150353 ?auto_150356 ) ) ( not ( = ?auto_150353 ?auto_150357 ) ) ( not ( = ?auto_150354 ?auto_150355 ) ) ( not ( = ?auto_150354 ?auto_150356 ) ) ( not ( = ?auto_150354 ?auto_150357 ) ) ( not ( = ?auto_150355 ?auto_150356 ) ) ( not ( = ?auto_150355 ?auto_150357 ) ) ( not ( = ?auto_150356 ?auto_150357 ) ) ( not ( = ?auto_150351 ?auto_150359 ) ) ( not ( = ?auto_150352 ?auto_150359 ) ) ( not ( = ?auto_150353 ?auto_150359 ) ) ( not ( = ?auto_150354 ?auto_150359 ) ) ( not ( = ?auto_150355 ?auto_150359 ) ) ( not ( = ?auto_150356 ?auto_150359 ) ) ( not ( = ?auto_150357 ?auto_150359 ) ) ( ON ?auto_150351 ?auto_150358 ) ( not ( = ?auto_150351 ?auto_150358 ) ) ( not ( = ?auto_150352 ?auto_150358 ) ) ( not ( = ?auto_150353 ?auto_150358 ) ) ( not ( = ?auto_150354 ?auto_150358 ) ) ( not ( = ?auto_150355 ?auto_150358 ) ) ( not ( = ?auto_150356 ?auto_150358 ) ) ( not ( = ?auto_150357 ?auto_150358 ) ) ( not ( = ?auto_150359 ?auto_150358 ) ) ( ON ?auto_150352 ?auto_150351 ) ( ON-TABLE ?auto_150358 ) ( ON ?auto_150353 ?auto_150352 ) ( ON ?auto_150354 ?auto_150353 ) ( ON ?auto_150355 ?auto_150354 ) ( ON ?auto_150356 ?auto_150355 ) ( ON ?auto_150357 ?auto_150356 ) ( ON ?auto_150359 ?auto_150357 ) ( CLEAR ?auto_150359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150358 ?auto_150351 ?auto_150352 ?auto_150353 ?auto_150354 ?auto_150355 ?auto_150356 ?auto_150357 )
      ( MAKE-7PILE ?auto_150351 ?auto_150352 ?auto_150353 ?auto_150354 ?auto_150355 ?auto_150356 ?auto_150357 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150376 - BLOCK
      ?auto_150377 - BLOCK
      ?auto_150378 - BLOCK
      ?auto_150379 - BLOCK
      ?auto_150380 - BLOCK
      ?auto_150381 - BLOCK
      ?auto_150382 - BLOCK
      ?auto_150383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150382 ) ( ON-TABLE ?auto_150376 ) ( ON ?auto_150377 ?auto_150376 ) ( ON ?auto_150378 ?auto_150377 ) ( ON ?auto_150379 ?auto_150378 ) ( ON ?auto_150380 ?auto_150379 ) ( ON ?auto_150381 ?auto_150380 ) ( ON ?auto_150382 ?auto_150381 ) ( not ( = ?auto_150376 ?auto_150377 ) ) ( not ( = ?auto_150376 ?auto_150378 ) ) ( not ( = ?auto_150376 ?auto_150379 ) ) ( not ( = ?auto_150376 ?auto_150380 ) ) ( not ( = ?auto_150376 ?auto_150381 ) ) ( not ( = ?auto_150376 ?auto_150382 ) ) ( not ( = ?auto_150376 ?auto_150383 ) ) ( not ( = ?auto_150377 ?auto_150378 ) ) ( not ( = ?auto_150377 ?auto_150379 ) ) ( not ( = ?auto_150377 ?auto_150380 ) ) ( not ( = ?auto_150377 ?auto_150381 ) ) ( not ( = ?auto_150377 ?auto_150382 ) ) ( not ( = ?auto_150377 ?auto_150383 ) ) ( not ( = ?auto_150378 ?auto_150379 ) ) ( not ( = ?auto_150378 ?auto_150380 ) ) ( not ( = ?auto_150378 ?auto_150381 ) ) ( not ( = ?auto_150378 ?auto_150382 ) ) ( not ( = ?auto_150378 ?auto_150383 ) ) ( not ( = ?auto_150379 ?auto_150380 ) ) ( not ( = ?auto_150379 ?auto_150381 ) ) ( not ( = ?auto_150379 ?auto_150382 ) ) ( not ( = ?auto_150379 ?auto_150383 ) ) ( not ( = ?auto_150380 ?auto_150381 ) ) ( not ( = ?auto_150380 ?auto_150382 ) ) ( not ( = ?auto_150380 ?auto_150383 ) ) ( not ( = ?auto_150381 ?auto_150382 ) ) ( not ( = ?auto_150381 ?auto_150383 ) ) ( not ( = ?auto_150382 ?auto_150383 ) ) ( ON-TABLE ?auto_150383 ) ( CLEAR ?auto_150383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_150383 )
      ( MAKE-8PILE ?auto_150376 ?auto_150377 ?auto_150378 ?auto_150379 ?auto_150380 ?auto_150381 ?auto_150382 ?auto_150383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150384 - BLOCK
      ?auto_150385 - BLOCK
      ?auto_150386 - BLOCK
      ?auto_150387 - BLOCK
      ?auto_150388 - BLOCK
      ?auto_150389 - BLOCK
      ?auto_150390 - BLOCK
      ?auto_150391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150384 ) ( ON ?auto_150385 ?auto_150384 ) ( ON ?auto_150386 ?auto_150385 ) ( ON ?auto_150387 ?auto_150386 ) ( ON ?auto_150388 ?auto_150387 ) ( ON ?auto_150389 ?auto_150388 ) ( not ( = ?auto_150384 ?auto_150385 ) ) ( not ( = ?auto_150384 ?auto_150386 ) ) ( not ( = ?auto_150384 ?auto_150387 ) ) ( not ( = ?auto_150384 ?auto_150388 ) ) ( not ( = ?auto_150384 ?auto_150389 ) ) ( not ( = ?auto_150384 ?auto_150390 ) ) ( not ( = ?auto_150384 ?auto_150391 ) ) ( not ( = ?auto_150385 ?auto_150386 ) ) ( not ( = ?auto_150385 ?auto_150387 ) ) ( not ( = ?auto_150385 ?auto_150388 ) ) ( not ( = ?auto_150385 ?auto_150389 ) ) ( not ( = ?auto_150385 ?auto_150390 ) ) ( not ( = ?auto_150385 ?auto_150391 ) ) ( not ( = ?auto_150386 ?auto_150387 ) ) ( not ( = ?auto_150386 ?auto_150388 ) ) ( not ( = ?auto_150386 ?auto_150389 ) ) ( not ( = ?auto_150386 ?auto_150390 ) ) ( not ( = ?auto_150386 ?auto_150391 ) ) ( not ( = ?auto_150387 ?auto_150388 ) ) ( not ( = ?auto_150387 ?auto_150389 ) ) ( not ( = ?auto_150387 ?auto_150390 ) ) ( not ( = ?auto_150387 ?auto_150391 ) ) ( not ( = ?auto_150388 ?auto_150389 ) ) ( not ( = ?auto_150388 ?auto_150390 ) ) ( not ( = ?auto_150388 ?auto_150391 ) ) ( not ( = ?auto_150389 ?auto_150390 ) ) ( not ( = ?auto_150389 ?auto_150391 ) ) ( not ( = ?auto_150390 ?auto_150391 ) ) ( ON-TABLE ?auto_150391 ) ( CLEAR ?auto_150391 ) ( HOLDING ?auto_150390 ) ( CLEAR ?auto_150389 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150384 ?auto_150385 ?auto_150386 ?auto_150387 ?auto_150388 ?auto_150389 ?auto_150390 )
      ( MAKE-8PILE ?auto_150384 ?auto_150385 ?auto_150386 ?auto_150387 ?auto_150388 ?auto_150389 ?auto_150390 ?auto_150391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150392 - BLOCK
      ?auto_150393 - BLOCK
      ?auto_150394 - BLOCK
      ?auto_150395 - BLOCK
      ?auto_150396 - BLOCK
      ?auto_150397 - BLOCK
      ?auto_150398 - BLOCK
      ?auto_150399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150392 ) ( ON ?auto_150393 ?auto_150392 ) ( ON ?auto_150394 ?auto_150393 ) ( ON ?auto_150395 ?auto_150394 ) ( ON ?auto_150396 ?auto_150395 ) ( ON ?auto_150397 ?auto_150396 ) ( not ( = ?auto_150392 ?auto_150393 ) ) ( not ( = ?auto_150392 ?auto_150394 ) ) ( not ( = ?auto_150392 ?auto_150395 ) ) ( not ( = ?auto_150392 ?auto_150396 ) ) ( not ( = ?auto_150392 ?auto_150397 ) ) ( not ( = ?auto_150392 ?auto_150398 ) ) ( not ( = ?auto_150392 ?auto_150399 ) ) ( not ( = ?auto_150393 ?auto_150394 ) ) ( not ( = ?auto_150393 ?auto_150395 ) ) ( not ( = ?auto_150393 ?auto_150396 ) ) ( not ( = ?auto_150393 ?auto_150397 ) ) ( not ( = ?auto_150393 ?auto_150398 ) ) ( not ( = ?auto_150393 ?auto_150399 ) ) ( not ( = ?auto_150394 ?auto_150395 ) ) ( not ( = ?auto_150394 ?auto_150396 ) ) ( not ( = ?auto_150394 ?auto_150397 ) ) ( not ( = ?auto_150394 ?auto_150398 ) ) ( not ( = ?auto_150394 ?auto_150399 ) ) ( not ( = ?auto_150395 ?auto_150396 ) ) ( not ( = ?auto_150395 ?auto_150397 ) ) ( not ( = ?auto_150395 ?auto_150398 ) ) ( not ( = ?auto_150395 ?auto_150399 ) ) ( not ( = ?auto_150396 ?auto_150397 ) ) ( not ( = ?auto_150396 ?auto_150398 ) ) ( not ( = ?auto_150396 ?auto_150399 ) ) ( not ( = ?auto_150397 ?auto_150398 ) ) ( not ( = ?auto_150397 ?auto_150399 ) ) ( not ( = ?auto_150398 ?auto_150399 ) ) ( ON-TABLE ?auto_150399 ) ( CLEAR ?auto_150397 ) ( ON ?auto_150398 ?auto_150399 ) ( CLEAR ?auto_150398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150399 )
      ( MAKE-8PILE ?auto_150392 ?auto_150393 ?auto_150394 ?auto_150395 ?auto_150396 ?auto_150397 ?auto_150398 ?auto_150399 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150400 - BLOCK
      ?auto_150401 - BLOCK
      ?auto_150402 - BLOCK
      ?auto_150403 - BLOCK
      ?auto_150404 - BLOCK
      ?auto_150405 - BLOCK
      ?auto_150406 - BLOCK
      ?auto_150407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150400 ) ( ON ?auto_150401 ?auto_150400 ) ( ON ?auto_150402 ?auto_150401 ) ( ON ?auto_150403 ?auto_150402 ) ( ON ?auto_150404 ?auto_150403 ) ( not ( = ?auto_150400 ?auto_150401 ) ) ( not ( = ?auto_150400 ?auto_150402 ) ) ( not ( = ?auto_150400 ?auto_150403 ) ) ( not ( = ?auto_150400 ?auto_150404 ) ) ( not ( = ?auto_150400 ?auto_150405 ) ) ( not ( = ?auto_150400 ?auto_150406 ) ) ( not ( = ?auto_150400 ?auto_150407 ) ) ( not ( = ?auto_150401 ?auto_150402 ) ) ( not ( = ?auto_150401 ?auto_150403 ) ) ( not ( = ?auto_150401 ?auto_150404 ) ) ( not ( = ?auto_150401 ?auto_150405 ) ) ( not ( = ?auto_150401 ?auto_150406 ) ) ( not ( = ?auto_150401 ?auto_150407 ) ) ( not ( = ?auto_150402 ?auto_150403 ) ) ( not ( = ?auto_150402 ?auto_150404 ) ) ( not ( = ?auto_150402 ?auto_150405 ) ) ( not ( = ?auto_150402 ?auto_150406 ) ) ( not ( = ?auto_150402 ?auto_150407 ) ) ( not ( = ?auto_150403 ?auto_150404 ) ) ( not ( = ?auto_150403 ?auto_150405 ) ) ( not ( = ?auto_150403 ?auto_150406 ) ) ( not ( = ?auto_150403 ?auto_150407 ) ) ( not ( = ?auto_150404 ?auto_150405 ) ) ( not ( = ?auto_150404 ?auto_150406 ) ) ( not ( = ?auto_150404 ?auto_150407 ) ) ( not ( = ?auto_150405 ?auto_150406 ) ) ( not ( = ?auto_150405 ?auto_150407 ) ) ( not ( = ?auto_150406 ?auto_150407 ) ) ( ON-TABLE ?auto_150407 ) ( ON ?auto_150406 ?auto_150407 ) ( CLEAR ?auto_150406 ) ( HOLDING ?auto_150405 ) ( CLEAR ?auto_150404 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150400 ?auto_150401 ?auto_150402 ?auto_150403 ?auto_150404 ?auto_150405 )
      ( MAKE-8PILE ?auto_150400 ?auto_150401 ?auto_150402 ?auto_150403 ?auto_150404 ?auto_150405 ?auto_150406 ?auto_150407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150408 - BLOCK
      ?auto_150409 - BLOCK
      ?auto_150410 - BLOCK
      ?auto_150411 - BLOCK
      ?auto_150412 - BLOCK
      ?auto_150413 - BLOCK
      ?auto_150414 - BLOCK
      ?auto_150415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150408 ) ( ON ?auto_150409 ?auto_150408 ) ( ON ?auto_150410 ?auto_150409 ) ( ON ?auto_150411 ?auto_150410 ) ( ON ?auto_150412 ?auto_150411 ) ( not ( = ?auto_150408 ?auto_150409 ) ) ( not ( = ?auto_150408 ?auto_150410 ) ) ( not ( = ?auto_150408 ?auto_150411 ) ) ( not ( = ?auto_150408 ?auto_150412 ) ) ( not ( = ?auto_150408 ?auto_150413 ) ) ( not ( = ?auto_150408 ?auto_150414 ) ) ( not ( = ?auto_150408 ?auto_150415 ) ) ( not ( = ?auto_150409 ?auto_150410 ) ) ( not ( = ?auto_150409 ?auto_150411 ) ) ( not ( = ?auto_150409 ?auto_150412 ) ) ( not ( = ?auto_150409 ?auto_150413 ) ) ( not ( = ?auto_150409 ?auto_150414 ) ) ( not ( = ?auto_150409 ?auto_150415 ) ) ( not ( = ?auto_150410 ?auto_150411 ) ) ( not ( = ?auto_150410 ?auto_150412 ) ) ( not ( = ?auto_150410 ?auto_150413 ) ) ( not ( = ?auto_150410 ?auto_150414 ) ) ( not ( = ?auto_150410 ?auto_150415 ) ) ( not ( = ?auto_150411 ?auto_150412 ) ) ( not ( = ?auto_150411 ?auto_150413 ) ) ( not ( = ?auto_150411 ?auto_150414 ) ) ( not ( = ?auto_150411 ?auto_150415 ) ) ( not ( = ?auto_150412 ?auto_150413 ) ) ( not ( = ?auto_150412 ?auto_150414 ) ) ( not ( = ?auto_150412 ?auto_150415 ) ) ( not ( = ?auto_150413 ?auto_150414 ) ) ( not ( = ?auto_150413 ?auto_150415 ) ) ( not ( = ?auto_150414 ?auto_150415 ) ) ( ON-TABLE ?auto_150415 ) ( ON ?auto_150414 ?auto_150415 ) ( CLEAR ?auto_150412 ) ( ON ?auto_150413 ?auto_150414 ) ( CLEAR ?auto_150413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150415 ?auto_150414 )
      ( MAKE-8PILE ?auto_150408 ?auto_150409 ?auto_150410 ?auto_150411 ?auto_150412 ?auto_150413 ?auto_150414 ?auto_150415 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150416 - BLOCK
      ?auto_150417 - BLOCK
      ?auto_150418 - BLOCK
      ?auto_150419 - BLOCK
      ?auto_150420 - BLOCK
      ?auto_150421 - BLOCK
      ?auto_150422 - BLOCK
      ?auto_150423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150416 ) ( ON ?auto_150417 ?auto_150416 ) ( ON ?auto_150418 ?auto_150417 ) ( ON ?auto_150419 ?auto_150418 ) ( not ( = ?auto_150416 ?auto_150417 ) ) ( not ( = ?auto_150416 ?auto_150418 ) ) ( not ( = ?auto_150416 ?auto_150419 ) ) ( not ( = ?auto_150416 ?auto_150420 ) ) ( not ( = ?auto_150416 ?auto_150421 ) ) ( not ( = ?auto_150416 ?auto_150422 ) ) ( not ( = ?auto_150416 ?auto_150423 ) ) ( not ( = ?auto_150417 ?auto_150418 ) ) ( not ( = ?auto_150417 ?auto_150419 ) ) ( not ( = ?auto_150417 ?auto_150420 ) ) ( not ( = ?auto_150417 ?auto_150421 ) ) ( not ( = ?auto_150417 ?auto_150422 ) ) ( not ( = ?auto_150417 ?auto_150423 ) ) ( not ( = ?auto_150418 ?auto_150419 ) ) ( not ( = ?auto_150418 ?auto_150420 ) ) ( not ( = ?auto_150418 ?auto_150421 ) ) ( not ( = ?auto_150418 ?auto_150422 ) ) ( not ( = ?auto_150418 ?auto_150423 ) ) ( not ( = ?auto_150419 ?auto_150420 ) ) ( not ( = ?auto_150419 ?auto_150421 ) ) ( not ( = ?auto_150419 ?auto_150422 ) ) ( not ( = ?auto_150419 ?auto_150423 ) ) ( not ( = ?auto_150420 ?auto_150421 ) ) ( not ( = ?auto_150420 ?auto_150422 ) ) ( not ( = ?auto_150420 ?auto_150423 ) ) ( not ( = ?auto_150421 ?auto_150422 ) ) ( not ( = ?auto_150421 ?auto_150423 ) ) ( not ( = ?auto_150422 ?auto_150423 ) ) ( ON-TABLE ?auto_150423 ) ( ON ?auto_150422 ?auto_150423 ) ( ON ?auto_150421 ?auto_150422 ) ( CLEAR ?auto_150421 ) ( HOLDING ?auto_150420 ) ( CLEAR ?auto_150419 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150416 ?auto_150417 ?auto_150418 ?auto_150419 ?auto_150420 )
      ( MAKE-8PILE ?auto_150416 ?auto_150417 ?auto_150418 ?auto_150419 ?auto_150420 ?auto_150421 ?auto_150422 ?auto_150423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150424 - BLOCK
      ?auto_150425 - BLOCK
      ?auto_150426 - BLOCK
      ?auto_150427 - BLOCK
      ?auto_150428 - BLOCK
      ?auto_150429 - BLOCK
      ?auto_150430 - BLOCK
      ?auto_150431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150424 ) ( ON ?auto_150425 ?auto_150424 ) ( ON ?auto_150426 ?auto_150425 ) ( ON ?auto_150427 ?auto_150426 ) ( not ( = ?auto_150424 ?auto_150425 ) ) ( not ( = ?auto_150424 ?auto_150426 ) ) ( not ( = ?auto_150424 ?auto_150427 ) ) ( not ( = ?auto_150424 ?auto_150428 ) ) ( not ( = ?auto_150424 ?auto_150429 ) ) ( not ( = ?auto_150424 ?auto_150430 ) ) ( not ( = ?auto_150424 ?auto_150431 ) ) ( not ( = ?auto_150425 ?auto_150426 ) ) ( not ( = ?auto_150425 ?auto_150427 ) ) ( not ( = ?auto_150425 ?auto_150428 ) ) ( not ( = ?auto_150425 ?auto_150429 ) ) ( not ( = ?auto_150425 ?auto_150430 ) ) ( not ( = ?auto_150425 ?auto_150431 ) ) ( not ( = ?auto_150426 ?auto_150427 ) ) ( not ( = ?auto_150426 ?auto_150428 ) ) ( not ( = ?auto_150426 ?auto_150429 ) ) ( not ( = ?auto_150426 ?auto_150430 ) ) ( not ( = ?auto_150426 ?auto_150431 ) ) ( not ( = ?auto_150427 ?auto_150428 ) ) ( not ( = ?auto_150427 ?auto_150429 ) ) ( not ( = ?auto_150427 ?auto_150430 ) ) ( not ( = ?auto_150427 ?auto_150431 ) ) ( not ( = ?auto_150428 ?auto_150429 ) ) ( not ( = ?auto_150428 ?auto_150430 ) ) ( not ( = ?auto_150428 ?auto_150431 ) ) ( not ( = ?auto_150429 ?auto_150430 ) ) ( not ( = ?auto_150429 ?auto_150431 ) ) ( not ( = ?auto_150430 ?auto_150431 ) ) ( ON-TABLE ?auto_150431 ) ( ON ?auto_150430 ?auto_150431 ) ( ON ?auto_150429 ?auto_150430 ) ( CLEAR ?auto_150427 ) ( ON ?auto_150428 ?auto_150429 ) ( CLEAR ?auto_150428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150431 ?auto_150430 ?auto_150429 )
      ( MAKE-8PILE ?auto_150424 ?auto_150425 ?auto_150426 ?auto_150427 ?auto_150428 ?auto_150429 ?auto_150430 ?auto_150431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150432 - BLOCK
      ?auto_150433 - BLOCK
      ?auto_150434 - BLOCK
      ?auto_150435 - BLOCK
      ?auto_150436 - BLOCK
      ?auto_150437 - BLOCK
      ?auto_150438 - BLOCK
      ?auto_150439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150432 ) ( ON ?auto_150433 ?auto_150432 ) ( ON ?auto_150434 ?auto_150433 ) ( not ( = ?auto_150432 ?auto_150433 ) ) ( not ( = ?auto_150432 ?auto_150434 ) ) ( not ( = ?auto_150432 ?auto_150435 ) ) ( not ( = ?auto_150432 ?auto_150436 ) ) ( not ( = ?auto_150432 ?auto_150437 ) ) ( not ( = ?auto_150432 ?auto_150438 ) ) ( not ( = ?auto_150432 ?auto_150439 ) ) ( not ( = ?auto_150433 ?auto_150434 ) ) ( not ( = ?auto_150433 ?auto_150435 ) ) ( not ( = ?auto_150433 ?auto_150436 ) ) ( not ( = ?auto_150433 ?auto_150437 ) ) ( not ( = ?auto_150433 ?auto_150438 ) ) ( not ( = ?auto_150433 ?auto_150439 ) ) ( not ( = ?auto_150434 ?auto_150435 ) ) ( not ( = ?auto_150434 ?auto_150436 ) ) ( not ( = ?auto_150434 ?auto_150437 ) ) ( not ( = ?auto_150434 ?auto_150438 ) ) ( not ( = ?auto_150434 ?auto_150439 ) ) ( not ( = ?auto_150435 ?auto_150436 ) ) ( not ( = ?auto_150435 ?auto_150437 ) ) ( not ( = ?auto_150435 ?auto_150438 ) ) ( not ( = ?auto_150435 ?auto_150439 ) ) ( not ( = ?auto_150436 ?auto_150437 ) ) ( not ( = ?auto_150436 ?auto_150438 ) ) ( not ( = ?auto_150436 ?auto_150439 ) ) ( not ( = ?auto_150437 ?auto_150438 ) ) ( not ( = ?auto_150437 ?auto_150439 ) ) ( not ( = ?auto_150438 ?auto_150439 ) ) ( ON-TABLE ?auto_150439 ) ( ON ?auto_150438 ?auto_150439 ) ( ON ?auto_150437 ?auto_150438 ) ( ON ?auto_150436 ?auto_150437 ) ( CLEAR ?auto_150436 ) ( HOLDING ?auto_150435 ) ( CLEAR ?auto_150434 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150432 ?auto_150433 ?auto_150434 ?auto_150435 )
      ( MAKE-8PILE ?auto_150432 ?auto_150433 ?auto_150434 ?auto_150435 ?auto_150436 ?auto_150437 ?auto_150438 ?auto_150439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150440 - BLOCK
      ?auto_150441 - BLOCK
      ?auto_150442 - BLOCK
      ?auto_150443 - BLOCK
      ?auto_150444 - BLOCK
      ?auto_150445 - BLOCK
      ?auto_150446 - BLOCK
      ?auto_150447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150440 ) ( ON ?auto_150441 ?auto_150440 ) ( ON ?auto_150442 ?auto_150441 ) ( not ( = ?auto_150440 ?auto_150441 ) ) ( not ( = ?auto_150440 ?auto_150442 ) ) ( not ( = ?auto_150440 ?auto_150443 ) ) ( not ( = ?auto_150440 ?auto_150444 ) ) ( not ( = ?auto_150440 ?auto_150445 ) ) ( not ( = ?auto_150440 ?auto_150446 ) ) ( not ( = ?auto_150440 ?auto_150447 ) ) ( not ( = ?auto_150441 ?auto_150442 ) ) ( not ( = ?auto_150441 ?auto_150443 ) ) ( not ( = ?auto_150441 ?auto_150444 ) ) ( not ( = ?auto_150441 ?auto_150445 ) ) ( not ( = ?auto_150441 ?auto_150446 ) ) ( not ( = ?auto_150441 ?auto_150447 ) ) ( not ( = ?auto_150442 ?auto_150443 ) ) ( not ( = ?auto_150442 ?auto_150444 ) ) ( not ( = ?auto_150442 ?auto_150445 ) ) ( not ( = ?auto_150442 ?auto_150446 ) ) ( not ( = ?auto_150442 ?auto_150447 ) ) ( not ( = ?auto_150443 ?auto_150444 ) ) ( not ( = ?auto_150443 ?auto_150445 ) ) ( not ( = ?auto_150443 ?auto_150446 ) ) ( not ( = ?auto_150443 ?auto_150447 ) ) ( not ( = ?auto_150444 ?auto_150445 ) ) ( not ( = ?auto_150444 ?auto_150446 ) ) ( not ( = ?auto_150444 ?auto_150447 ) ) ( not ( = ?auto_150445 ?auto_150446 ) ) ( not ( = ?auto_150445 ?auto_150447 ) ) ( not ( = ?auto_150446 ?auto_150447 ) ) ( ON-TABLE ?auto_150447 ) ( ON ?auto_150446 ?auto_150447 ) ( ON ?auto_150445 ?auto_150446 ) ( ON ?auto_150444 ?auto_150445 ) ( CLEAR ?auto_150442 ) ( ON ?auto_150443 ?auto_150444 ) ( CLEAR ?auto_150443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150447 ?auto_150446 ?auto_150445 ?auto_150444 )
      ( MAKE-8PILE ?auto_150440 ?auto_150441 ?auto_150442 ?auto_150443 ?auto_150444 ?auto_150445 ?auto_150446 ?auto_150447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150448 - BLOCK
      ?auto_150449 - BLOCK
      ?auto_150450 - BLOCK
      ?auto_150451 - BLOCK
      ?auto_150452 - BLOCK
      ?auto_150453 - BLOCK
      ?auto_150454 - BLOCK
      ?auto_150455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150448 ) ( ON ?auto_150449 ?auto_150448 ) ( not ( = ?auto_150448 ?auto_150449 ) ) ( not ( = ?auto_150448 ?auto_150450 ) ) ( not ( = ?auto_150448 ?auto_150451 ) ) ( not ( = ?auto_150448 ?auto_150452 ) ) ( not ( = ?auto_150448 ?auto_150453 ) ) ( not ( = ?auto_150448 ?auto_150454 ) ) ( not ( = ?auto_150448 ?auto_150455 ) ) ( not ( = ?auto_150449 ?auto_150450 ) ) ( not ( = ?auto_150449 ?auto_150451 ) ) ( not ( = ?auto_150449 ?auto_150452 ) ) ( not ( = ?auto_150449 ?auto_150453 ) ) ( not ( = ?auto_150449 ?auto_150454 ) ) ( not ( = ?auto_150449 ?auto_150455 ) ) ( not ( = ?auto_150450 ?auto_150451 ) ) ( not ( = ?auto_150450 ?auto_150452 ) ) ( not ( = ?auto_150450 ?auto_150453 ) ) ( not ( = ?auto_150450 ?auto_150454 ) ) ( not ( = ?auto_150450 ?auto_150455 ) ) ( not ( = ?auto_150451 ?auto_150452 ) ) ( not ( = ?auto_150451 ?auto_150453 ) ) ( not ( = ?auto_150451 ?auto_150454 ) ) ( not ( = ?auto_150451 ?auto_150455 ) ) ( not ( = ?auto_150452 ?auto_150453 ) ) ( not ( = ?auto_150452 ?auto_150454 ) ) ( not ( = ?auto_150452 ?auto_150455 ) ) ( not ( = ?auto_150453 ?auto_150454 ) ) ( not ( = ?auto_150453 ?auto_150455 ) ) ( not ( = ?auto_150454 ?auto_150455 ) ) ( ON-TABLE ?auto_150455 ) ( ON ?auto_150454 ?auto_150455 ) ( ON ?auto_150453 ?auto_150454 ) ( ON ?auto_150452 ?auto_150453 ) ( ON ?auto_150451 ?auto_150452 ) ( CLEAR ?auto_150451 ) ( HOLDING ?auto_150450 ) ( CLEAR ?auto_150449 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150448 ?auto_150449 ?auto_150450 )
      ( MAKE-8PILE ?auto_150448 ?auto_150449 ?auto_150450 ?auto_150451 ?auto_150452 ?auto_150453 ?auto_150454 ?auto_150455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150456 - BLOCK
      ?auto_150457 - BLOCK
      ?auto_150458 - BLOCK
      ?auto_150459 - BLOCK
      ?auto_150460 - BLOCK
      ?auto_150461 - BLOCK
      ?auto_150462 - BLOCK
      ?auto_150463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150456 ) ( ON ?auto_150457 ?auto_150456 ) ( not ( = ?auto_150456 ?auto_150457 ) ) ( not ( = ?auto_150456 ?auto_150458 ) ) ( not ( = ?auto_150456 ?auto_150459 ) ) ( not ( = ?auto_150456 ?auto_150460 ) ) ( not ( = ?auto_150456 ?auto_150461 ) ) ( not ( = ?auto_150456 ?auto_150462 ) ) ( not ( = ?auto_150456 ?auto_150463 ) ) ( not ( = ?auto_150457 ?auto_150458 ) ) ( not ( = ?auto_150457 ?auto_150459 ) ) ( not ( = ?auto_150457 ?auto_150460 ) ) ( not ( = ?auto_150457 ?auto_150461 ) ) ( not ( = ?auto_150457 ?auto_150462 ) ) ( not ( = ?auto_150457 ?auto_150463 ) ) ( not ( = ?auto_150458 ?auto_150459 ) ) ( not ( = ?auto_150458 ?auto_150460 ) ) ( not ( = ?auto_150458 ?auto_150461 ) ) ( not ( = ?auto_150458 ?auto_150462 ) ) ( not ( = ?auto_150458 ?auto_150463 ) ) ( not ( = ?auto_150459 ?auto_150460 ) ) ( not ( = ?auto_150459 ?auto_150461 ) ) ( not ( = ?auto_150459 ?auto_150462 ) ) ( not ( = ?auto_150459 ?auto_150463 ) ) ( not ( = ?auto_150460 ?auto_150461 ) ) ( not ( = ?auto_150460 ?auto_150462 ) ) ( not ( = ?auto_150460 ?auto_150463 ) ) ( not ( = ?auto_150461 ?auto_150462 ) ) ( not ( = ?auto_150461 ?auto_150463 ) ) ( not ( = ?auto_150462 ?auto_150463 ) ) ( ON-TABLE ?auto_150463 ) ( ON ?auto_150462 ?auto_150463 ) ( ON ?auto_150461 ?auto_150462 ) ( ON ?auto_150460 ?auto_150461 ) ( ON ?auto_150459 ?auto_150460 ) ( CLEAR ?auto_150457 ) ( ON ?auto_150458 ?auto_150459 ) ( CLEAR ?auto_150458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150463 ?auto_150462 ?auto_150461 ?auto_150460 ?auto_150459 )
      ( MAKE-8PILE ?auto_150456 ?auto_150457 ?auto_150458 ?auto_150459 ?auto_150460 ?auto_150461 ?auto_150462 ?auto_150463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150464 - BLOCK
      ?auto_150465 - BLOCK
      ?auto_150466 - BLOCK
      ?auto_150467 - BLOCK
      ?auto_150468 - BLOCK
      ?auto_150469 - BLOCK
      ?auto_150470 - BLOCK
      ?auto_150471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150464 ) ( not ( = ?auto_150464 ?auto_150465 ) ) ( not ( = ?auto_150464 ?auto_150466 ) ) ( not ( = ?auto_150464 ?auto_150467 ) ) ( not ( = ?auto_150464 ?auto_150468 ) ) ( not ( = ?auto_150464 ?auto_150469 ) ) ( not ( = ?auto_150464 ?auto_150470 ) ) ( not ( = ?auto_150464 ?auto_150471 ) ) ( not ( = ?auto_150465 ?auto_150466 ) ) ( not ( = ?auto_150465 ?auto_150467 ) ) ( not ( = ?auto_150465 ?auto_150468 ) ) ( not ( = ?auto_150465 ?auto_150469 ) ) ( not ( = ?auto_150465 ?auto_150470 ) ) ( not ( = ?auto_150465 ?auto_150471 ) ) ( not ( = ?auto_150466 ?auto_150467 ) ) ( not ( = ?auto_150466 ?auto_150468 ) ) ( not ( = ?auto_150466 ?auto_150469 ) ) ( not ( = ?auto_150466 ?auto_150470 ) ) ( not ( = ?auto_150466 ?auto_150471 ) ) ( not ( = ?auto_150467 ?auto_150468 ) ) ( not ( = ?auto_150467 ?auto_150469 ) ) ( not ( = ?auto_150467 ?auto_150470 ) ) ( not ( = ?auto_150467 ?auto_150471 ) ) ( not ( = ?auto_150468 ?auto_150469 ) ) ( not ( = ?auto_150468 ?auto_150470 ) ) ( not ( = ?auto_150468 ?auto_150471 ) ) ( not ( = ?auto_150469 ?auto_150470 ) ) ( not ( = ?auto_150469 ?auto_150471 ) ) ( not ( = ?auto_150470 ?auto_150471 ) ) ( ON-TABLE ?auto_150471 ) ( ON ?auto_150470 ?auto_150471 ) ( ON ?auto_150469 ?auto_150470 ) ( ON ?auto_150468 ?auto_150469 ) ( ON ?auto_150467 ?auto_150468 ) ( ON ?auto_150466 ?auto_150467 ) ( CLEAR ?auto_150466 ) ( HOLDING ?auto_150465 ) ( CLEAR ?auto_150464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150464 ?auto_150465 )
      ( MAKE-8PILE ?auto_150464 ?auto_150465 ?auto_150466 ?auto_150467 ?auto_150468 ?auto_150469 ?auto_150470 ?auto_150471 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150472 - BLOCK
      ?auto_150473 - BLOCK
      ?auto_150474 - BLOCK
      ?auto_150475 - BLOCK
      ?auto_150476 - BLOCK
      ?auto_150477 - BLOCK
      ?auto_150478 - BLOCK
      ?auto_150479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150472 ) ( not ( = ?auto_150472 ?auto_150473 ) ) ( not ( = ?auto_150472 ?auto_150474 ) ) ( not ( = ?auto_150472 ?auto_150475 ) ) ( not ( = ?auto_150472 ?auto_150476 ) ) ( not ( = ?auto_150472 ?auto_150477 ) ) ( not ( = ?auto_150472 ?auto_150478 ) ) ( not ( = ?auto_150472 ?auto_150479 ) ) ( not ( = ?auto_150473 ?auto_150474 ) ) ( not ( = ?auto_150473 ?auto_150475 ) ) ( not ( = ?auto_150473 ?auto_150476 ) ) ( not ( = ?auto_150473 ?auto_150477 ) ) ( not ( = ?auto_150473 ?auto_150478 ) ) ( not ( = ?auto_150473 ?auto_150479 ) ) ( not ( = ?auto_150474 ?auto_150475 ) ) ( not ( = ?auto_150474 ?auto_150476 ) ) ( not ( = ?auto_150474 ?auto_150477 ) ) ( not ( = ?auto_150474 ?auto_150478 ) ) ( not ( = ?auto_150474 ?auto_150479 ) ) ( not ( = ?auto_150475 ?auto_150476 ) ) ( not ( = ?auto_150475 ?auto_150477 ) ) ( not ( = ?auto_150475 ?auto_150478 ) ) ( not ( = ?auto_150475 ?auto_150479 ) ) ( not ( = ?auto_150476 ?auto_150477 ) ) ( not ( = ?auto_150476 ?auto_150478 ) ) ( not ( = ?auto_150476 ?auto_150479 ) ) ( not ( = ?auto_150477 ?auto_150478 ) ) ( not ( = ?auto_150477 ?auto_150479 ) ) ( not ( = ?auto_150478 ?auto_150479 ) ) ( ON-TABLE ?auto_150479 ) ( ON ?auto_150478 ?auto_150479 ) ( ON ?auto_150477 ?auto_150478 ) ( ON ?auto_150476 ?auto_150477 ) ( ON ?auto_150475 ?auto_150476 ) ( ON ?auto_150474 ?auto_150475 ) ( CLEAR ?auto_150472 ) ( ON ?auto_150473 ?auto_150474 ) ( CLEAR ?auto_150473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150479 ?auto_150478 ?auto_150477 ?auto_150476 ?auto_150475 ?auto_150474 )
      ( MAKE-8PILE ?auto_150472 ?auto_150473 ?auto_150474 ?auto_150475 ?auto_150476 ?auto_150477 ?auto_150478 ?auto_150479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150480 - BLOCK
      ?auto_150481 - BLOCK
      ?auto_150482 - BLOCK
      ?auto_150483 - BLOCK
      ?auto_150484 - BLOCK
      ?auto_150485 - BLOCK
      ?auto_150486 - BLOCK
      ?auto_150487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150480 ?auto_150481 ) ) ( not ( = ?auto_150480 ?auto_150482 ) ) ( not ( = ?auto_150480 ?auto_150483 ) ) ( not ( = ?auto_150480 ?auto_150484 ) ) ( not ( = ?auto_150480 ?auto_150485 ) ) ( not ( = ?auto_150480 ?auto_150486 ) ) ( not ( = ?auto_150480 ?auto_150487 ) ) ( not ( = ?auto_150481 ?auto_150482 ) ) ( not ( = ?auto_150481 ?auto_150483 ) ) ( not ( = ?auto_150481 ?auto_150484 ) ) ( not ( = ?auto_150481 ?auto_150485 ) ) ( not ( = ?auto_150481 ?auto_150486 ) ) ( not ( = ?auto_150481 ?auto_150487 ) ) ( not ( = ?auto_150482 ?auto_150483 ) ) ( not ( = ?auto_150482 ?auto_150484 ) ) ( not ( = ?auto_150482 ?auto_150485 ) ) ( not ( = ?auto_150482 ?auto_150486 ) ) ( not ( = ?auto_150482 ?auto_150487 ) ) ( not ( = ?auto_150483 ?auto_150484 ) ) ( not ( = ?auto_150483 ?auto_150485 ) ) ( not ( = ?auto_150483 ?auto_150486 ) ) ( not ( = ?auto_150483 ?auto_150487 ) ) ( not ( = ?auto_150484 ?auto_150485 ) ) ( not ( = ?auto_150484 ?auto_150486 ) ) ( not ( = ?auto_150484 ?auto_150487 ) ) ( not ( = ?auto_150485 ?auto_150486 ) ) ( not ( = ?auto_150485 ?auto_150487 ) ) ( not ( = ?auto_150486 ?auto_150487 ) ) ( ON-TABLE ?auto_150487 ) ( ON ?auto_150486 ?auto_150487 ) ( ON ?auto_150485 ?auto_150486 ) ( ON ?auto_150484 ?auto_150485 ) ( ON ?auto_150483 ?auto_150484 ) ( ON ?auto_150482 ?auto_150483 ) ( ON ?auto_150481 ?auto_150482 ) ( CLEAR ?auto_150481 ) ( HOLDING ?auto_150480 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150480 )
      ( MAKE-8PILE ?auto_150480 ?auto_150481 ?auto_150482 ?auto_150483 ?auto_150484 ?auto_150485 ?auto_150486 ?auto_150487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150488 - BLOCK
      ?auto_150489 - BLOCK
      ?auto_150490 - BLOCK
      ?auto_150491 - BLOCK
      ?auto_150492 - BLOCK
      ?auto_150493 - BLOCK
      ?auto_150494 - BLOCK
      ?auto_150495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150488 ?auto_150489 ) ) ( not ( = ?auto_150488 ?auto_150490 ) ) ( not ( = ?auto_150488 ?auto_150491 ) ) ( not ( = ?auto_150488 ?auto_150492 ) ) ( not ( = ?auto_150488 ?auto_150493 ) ) ( not ( = ?auto_150488 ?auto_150494 ) ) ( not ( = ?auto_150488 ?auto_150495 ) ) ( not ( = ?auto_150489 ?auto_150490 ) ) ( not ( = ?auto_150489 ?auto_150491 ) ) ( not ( = ?auto_150489 ?auto_150492 ) ) ( not ( = ?auto_150489 ?auto_150493 ) ) ( not ( = ?auto_150489 ?auto_150494 ) ) ( not ( = ?auto_150489 ?auto_150495 ) ) ( not ( = ?auto_150490 ?auto_150491 ) ) ( not ( = ?auto_150490 ?auto_150492 ) ) ( not ( = ?auto_150490 ?auto_150493 ) ) ( not ( = ?auto_150490 ?auto_150494 ) ) ( not ( = ?auto_150490 ?auto_150495 ) ) ( not ( = ?auto_150491 ?auto_150492 ) ) ( not ( = ?auto_150491 ?auto_150493 ) ) ( not ( = ?auto_150491 ?auto_150494 ) ) ( not ( = ?auto_150491 ?auto_150495 ) ) ( not ( = ?auto_150492 ?auto_150493 ) ) ( not ( = ?auto_150492 ?auto_150494 ) ) ( not ( = ?auto_150492 ?auto_150495 ) ) ( not ( = ?auto_150493 ?auto_150494 ) ) ( not ( = ?auto_150493 ?auto_150495 ) ) ( not ( = ?auto_150494 ?auto_150495 ) ) ( ON-TABLE ?auto_150495 ) ( ON ?auto_150494 ?auto_150495 ) ( ON ?auto_150493 ?auto_150494 ) ( ON ?auto_150492 ?auto_150493 ) ( ON ?auto_150491 ?auto_150492 ) ( ON ?auto_150490 ?auto_150491 ) ( ON ?auto_150489 ?auto_150490 ) ( ON ?auto_150488 ?auto_150489 ) ( CLEAR ?auto_150488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150495 ?auto_150494 ?auto_150493 ?auto_150492 ?auto_150491 ?auto_150490 ?auto_150489 )
      ( MAKE-8PILE ?auto_150488 ?auto_150489 ?auto_150490 ?auto_150491 ?auto_150492 ?auto_150493 ?auto_150494 ?auto_150495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150504 - BLOCK
      ?auto_150505 - BLOCK
      ?auto_150506 - BLOCK
      ?auto_150507 - BLOCK
      ?auto_150508 - BLOCK
      ?auto_150509 - BLOCK
      ?auto_150510 - BLOCK
      ?auto_150511 - BLOCK
    )
    :vars
    (
      ?auto_150512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150504 ?auto_150505 ) ) ( not ( = ?auto_150504 ?auto_150506 ) ) ( not ( = ?auto_150504 ?auto_150507 ) ) ( not ( = ?auto_150504 ?auto_150508 ) ) ( not ( = ?auto_150504 ?auto_150509 ) ) ( not ( = ?auto_150504 ?auto_150510 ) ) ( not ( = ?auto_150504 ?auto_150511 ) ) ( not ( = ?auto_150505 ?auto_150506 ) ) ( not ( = ?auto_150505 ?auto_150507 ) ) ( not ( = ?auto_150505 ?auto_150508 ) ) ( not ( = ?auto_150505 ?auto_150509 ) ) ( not ( = ?auto_150505 ?auto_150510 ) ) ( not ( = ?auto_150505 ?auto_150511 ) ) ( not ( = ?auto_150506 ?auto_150507 ) ) ( not ( = ?auto_150506 ?auto_150508 ) ) ( not ( = ?auto_150506 ?auto_150509 ) ) ( not ( = ?auto_150506 ?auto_150510 ) ) ( not ( = ?auto_150506 ?auto_150511 ) ) ( not ( = ?auto_150507 ?auto_150508 ) ) ( not ( = ?auto_150507 ?auto_150509 ) ) ( not ( = ?auto_150507 ?auto_150510 ) ) ( not ( = ?auto_150507 ?auto_150511 ) ) ( not ( = ?auto_150508 ?auto_150509 ) ) ( not ( = ?auto_150508 ?auto_150510 ) ) ( not ( = ?auto_150508 ?auto_150511 ) ) ( not ( = ?auto_150509 ?auto_150510 ) ) ( not ( = ?auto_150509 ?auto_150511 ) ) ( not ( = ?auto_150510 ?auto_150511 ) ) ( ON-TABLE ?auto_150511 ) ( ON ?auto_150510 ?auto_150511 ) ( ON ?auto_150509 ?auto_150510 ) ( ON ?auto_150508 ?auto_150509 ) ( ON ?auto_150507 ?auto_150508 ) ( ON ?auto_150506 ?auto_150507 ) ( ON ?auto_150505 ?auto_150506 ) ( CLEAR ?auto_150505 ) ( ON ?auto_150504 ?auto_150512 ) ( CLEAR ?auto_150504 ) ( HAND-EMPTY ) ( not ( = ?auto_150504 ?auto_150512 ) ) ( not ( = ?auto_150505 ?auto_150512 ) ) ( not ( = ?auto_150506 ?auto_150512 ) ) ( not ( = ?auto_150507 ?auto_150512 ) ) ( not ( = ?auto_150508 ?auto_150512 ) ) ( not ( = ?auto_150509 ?auto_150512 ) ) ( not ( = ?auto_150510 ?auto_150512 ) ) ( not ( = ?auto_150511 ?auto_150512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150504 ?auto_150512 )
      ( MAKE-8PILE ?auto_150504 ?auto_150505 ?auto_150506 ?auto_150507 ?auto_150508 ?auto_150509 ?auto_150510 ?auto_150511 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150513 - BLOCK
      ?auto_150514 - BLOCK
      ?auto_150515 - BLOCK
      ?auto_150516 - BLOCK
      ?auto_150517 - BLOCK
      ?auto_150518 - BLOCK
      ?auto_150519 - BLOCK
      ?auto_150520 - BLOCK
    )
    :vars
    (
      ?auto_150521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150513 ?auto_150514 ) ) ( not ( = ?auto_150513 ?auto_150515 ) ) ( not ( = ?auto_150513 ?auto_150516 ) ) ( not ( = ?auto_150513 ?auto_150517 ) ) ( not ( = ?auto_150513 ?auto_150518 ) ) ( not ( = ?auto_150513 ?auto_150519 ) ) ( not ( = ?auto_150513 ?auto_150520 ) ) ( not ( = ?auto_150514 ?auto_150515 ) ) ( not ( = ?auto_150514 ?auto_150516 ) ) ( not ( = ?auto_150514 ?auto_150517 ) ) ( not ( = ?auto_150514 ?auto_150518 ) ) ( not ( = ?auto_150514 ?auto_150519 ) ) ( not ( = ?auto_150514 ?auto_150520 ) ) ( not ( = ?auto_150515 ?auto_150516 ) ) ( not ( = ?auto_150515 ?auto_150517 ) ) ( not ( = ?auto_150515 ?auto_150518 ) ) ( not ( = ?auto_150515 ?auto_150519 ) ) ( not ( = ?auto_150515 ?auto_150520 ) ) ( not ( = ?auto_150516 ?auto_150517 ) ) ( not ( = ?auto_150516 ?auto_150518 ) ) ( not ( = ?auto_150516 ?auto_150519 ) ) ( not ( = ?auto_150516 ?auto_150520 ) ) ( not ( = ?auto_150517 ?auto_150518 ) ) ( not ( = ?auto_150517 ?auto_150519 ) ) ( not ( = ?auto_150517 ?auto_150520 ) ) ( not ( = ?auto_150518 ?auto_150519 ) ) ( not ( = ?auto_150518 ?auto_150520 ) ) ( not ( = ?auto_150519 ?auto_150520 ) ) ( ON-TABLE ?auto_150520 ) ( ON ?auto_150519 ?auto_150520 ) ( ON ?auto_150518 ?auto_150519 ) ( ON ?auto_150517 ?auto_150518 ) ( ON ?auto_150516 ?auto_150517 ) ( ON ?auto_150515 ?auto_150516 ) ( ON ?auto_150513 ?auto_150521 ) ( CLEAR ?auto_150513 ) ( not ( = ?auto_150513 ?auto_150521 ) ) ( not ( = ?auto_150514 ?auto_150521 ) ) ( not ( = ?auto_150515 ?auto_150521 ) ) ( not ( = ?auto_150516 ?auto_150521 ) ) ( not ( = ?auto_150517 ?auto_150521 ) ) ( not ( = ?auto_150518 ?auto_150521 ) ) ( not ( = ?auto_150519 ?auto_150521 ) ) ( not ( = ?auto_150520 ?auto_150521 ) ) ( HOLDING ?auto_150514 ) ( CLEAR ?auto_150515 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150520 ?auto_150519 ?auto_150518 ?auto_150517 ?auto_150516 ?auto_150515 ?auto_150514 )
      ( MAKE-8PILE ?auto_150513 ?auto_150514 ?auto_150515 ?auto_150516 ?auto_150517 ?auto_150518 ?auto_150519 ?auto_150520 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150522 - BLOCK
      ?auto_150523 - BLOCK
      ?auto_150524 - BLOCK
      ?auto_150525 - BLOCK
      ?auto_150526 - BLOCK
      ?auto_150527 - BLOCK
      ?auto_150528 - BLOCK
      ?auto_150529 - BLOCK
    )
    :vars
    (
      ?auto_150530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150522 ?auto_150523 ) ) ( not ( = ?auto_150522 ?auto_150524 ) ) ( not ( = ?auto_150522 ?auto_150525 ) ) ( not ( = ?auto_150522 ?auto_150526 ) ) ( not ( = ?auto_150522 ?auto_150527 ) ) ( not ( = ?auto_150522 ?auto_150528 ) ) ( not ( = ?auto_150522 ?auto_150529 ) ) ( not ( = ?auto_150523 ?auto_150524 ) ) ( not ( = ?auto_150523 ?auto_150525 ) ) ( not ( = ?auto_150523 ?auto_150526 ) ) ( not ( = ?auto_150523 ?auto_150527 ) ) ( not ( = ?auto_150523 ?auto_150528 ) ) ( not ( = ?auto_150523 ?auto_150529 ) ) ( not ( = ?auto_150524 ?auto_150525 ) ) ( not ( = ?auto_150524 ?auto_150526 ) ) ( not ( = ?auto_150524 ?auto_150527 ) ) ( not ( = ?auto_150524 ?auto_150528 ) ) ( not ( = ?auto_150524 ?auto_150529 ) ) ( not ( = ?auto_150525 ?auto_150526 ) ) ( not ( = ?auto_150525 ?auto_150527 ) ) ( not ( = ?auto_150525 ?auto_150528 ) ) ( not ( = ?auto_150525 ?auto_150529 ) ) ( not ( = ?auto_150526 ?auto_150527 ) ) ( not ( = ?auto_150526 ?auto_150528 ) ) ( not ( = ?auto_150526 ?auto_150529 ) ) ( not ( = ?auto_150527 ?auto_150528 ) ) ( not ( = ?auto_150527 ?auto_150529 ) ) ( not ( = ?auto_150528 ?auto_150529 ) ) ( ON-TABLE ?auto_150529 ) ( ON ?auto_150528 ?auto_150529 ) ( ON ?auto_150527 ?auto_150528 ) ( ON ?auto_150526 ?auto_150527 ) ( ON ?auto_150525 ?auto_150526 ) ( ON ?auto_150524 ?auto_150525 ) ( ON ?auto_150522 ?auto_150530 ) ( not ( = ?auto_150522 ?auto_150530 ) ) ( not ( = ?auto_150523 ?auto_150530 ) ) ( not ( = ?auto_150524 ?auto_150530 ) ) ( not ( = ?auto_150525 ?auto_150530 ) ) ( not ( = ?auto_150526 ?auto_150530 ) ) ( not ( = ?auto_150527 ?auto_150530 ) ) ( not ( = ?auto_150528 ?auto_150530 ) ) ( not ( = ?auto_150529 ?auto_150530 ) ) ( CLEAR ?auto_150524 ) ( ON ?auto_150523 ?auto_150522 ) ( CLEAR ?auto_150523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150530 ?auto_150522 )
      ( MAKE-8PILE ?auto_150522 ?auto_150523 ?auto_150524 ?auto_150525 ?auto_150526 ?auto_150527 ?auto_150528 ?auto_150529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150531 - BLOCK
      ?auto_150532 - BLOCK
      ?auto_150533 - BLOCK
      ?auto_150534 - BLOCK
      ?auto_150535 - BLOCK
      ?auto_150536 - BLOCK
      ?auto_150537 - BLOCK
      ?auto_150538 - BLOCK
    )
    :vars
    (
      ?auto_150539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150531 ?auto_150532 ) ) ( not ( = ?auto_150531 ?auto_150533 ) ) ( not ( = ?auto_150531 ?auto_150534 ) ) ( not ( = ?auto_150531 ?auto_150535 ) ) ( not ( = ?auto_150531 ?auto_150536 ) ) ( not ( = ?auto_150531 ?auto_150537 ) ) ( not ( = ?auto_150531 ?auto_150538 ) ) ( not ( = ?auto_150532 ?auto_150533 ) ) ( not ( = ?auto_150532 ?auto_150534 ) ) ( not ( = ?auto_150532 ?auto_150535 ) ) ( not ( = ?auto_150532 ?auto_150536 ) ) ( not ( = ?auto_150532 ?auto_150537 ) ) ( not ( = ?auto_150532 ?auto_150538 ) ) ( not ( = ?auto_150533 ?auto_150534 ) ) ( not ( = ?auto_150533 ?auto_150535 ) ) ( not ( = ?auto_150533 ?auto_150536 ) ) ( not ( = ?auto_150533 ?auto_150537 ) ) ( not ( = ?auto_150533 ?auto_150538 ) ) ( not ( = ?auto_150534 ?auto_150535 ) ) ( not ( = ?auto_150534 ?auto_150536 ) ) ( not ( = ?auto_150534 ?auto_150537 ) ) ( not ( = ?auto_150534 ?auto_150538 ) ) ( not ( = ?auto_150535 ?auto_150536 ) ) ( not ( = ?auto_150535 ?auto_150537 ) ) ( not ( = ?auto_150535 ?auto_150538 ) ) ( not ( = ?auto_150536 ?auto_150537 ) ) ( not ( = ?auto_150536 ?auto_150538 ) ) ( not ( = ?auto_150537 ?auto_150538 ) ) ( ON-TABLE ?auto_150538 ) ( ON ?auto_150537 ?auto_150538 ) ( ON ?auto_150536 ?auto_150537 ) ( ON ?auto_150535 ?auto_150536 ) ( ON ?auto_150534 ?auto_150535 ) ( ON ?auto_150531 ?auto_150539 ) ( not ( = ?auto_150531 ?auto_150539 ) ) ( not ( = ?auto_150532 ?auto_150539 ) ) ( not ( = ?auto_150533 ?auto_150539 ) ) ( not ( = ?auto_150534 ?auto_150539 ) ) ( not ( = ?auto_150535 ?auto_150539 ) ) ( not ( = ?auto_150536 ?auto_150539 ) ) ( not ( = ?auto_150537 ?auto_150539 ) ) ( not ( = ?auto_150538 ?auto_150539 ) ) ( ON ?auto_150532 ?auto_150531 ) ( CLEAR ?auto_150532 ) ( ON-TABLE ?auto_150539 ) ( HOLDING ?auto_150533 ) ( CLEAR ?auto_150534 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150538 ?auto_150537 ?auto_150536 ?auto_150535 ?auto_150534 ?auto_150533 )
      ( MAKE-8PILE ?auto_150531 ?auto_150532 ?auto_150533 ?auto_150534 ?auto_150535 ?auto_150536 ?auto_150537 ?auto_150538 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150540 - BLOCK
      ?auto_150541 - BLOCK
      ?auto_150542 - BLOCK
      ?auto_150543 - BLOCK
      ?auto_150544 - BLOCK
      ?auto_150545 - BLOCK
      ?auto_150546 - BLOCK
      ?auto_150547 - BLOCK
    )
    :vars
    (
      ?auto_150548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150540 ?auto_150541 ) ) ( not ( = ?auto_150540 ?auto_150542 ) ) ( not ( = ?auto_150540 ?auto_150543 ) ) ( not ( = ?auto_150540 ?auto_150544 ) ) ( not ( = ?auto_150540 ?auto_150545 ) ) ( not ( = ?auto_150540 ?auto_150546 ) ) ( not ( = ?auto_150540 ?auto_150547 ) ) ( not ( = ?auto_150541 ?auto_150542 ) ) ( not ( = ?auto_150541 ?auto_150543 ) ) ( not ( = ?auto_150541 ?auto_150544 ) ) ( not ( = ?auto_150541 ?auto_150545 ) ) ( not ( = ?auto_150541 ?auto_150546 ) ) ( not ( = ?auto_150541 ?auto_150547 ) ) ( not ( = ?auto_150542 ?auto_150543 ) ) ( not ( = ?auto_150542 ?auto_150544 ) ) ( not ( = ?auto_150542 ?auto_150545 ) ) ( not ( = ?auto_150542 ?auto_150546 ) ) ( not ( = ?auto_150542 ?auto_150547 ) ) ( not ( = ?auto_150543 ?auto_150544 ) ) ( not ( = ?auto_150543 ?auto_150545 ) ) ( not ( = ?auto_150543 ?auto_150546 ) ) ( not ( = ?auto_150543 ?auto_150547 ) ) ( not ( = ?auto_150544 ?auto_150545 ) ) ( not ( = ?auto_150544 ?auto_150546 ) ) ( not ( = ?auto_150544 ?auto_150547 ) ) ( not ( = ?auto_150545 ?auto_150546 ) ) ( not ( = ?auto_150545 ?auto_150547 ) ) ( not ( = ?auto_150546 ?auto_150547 ) ) ( ON-TABLE ?auto_150547 ) ( ON ?auto_150546 ?auto_150547 ) ( ON ?auto_150545 ?auto_150546 ) ( ON ?auto_150544 ?auto_150545 ) ( ON ?auto_150543 ?auto_150544 ) ( ON ?auto_150540 ?auto_150548 ) ( not ( = ?auto_150540 ?auto_150548 ) ) ( not ( = ?auto_150541 ?auto_150548 ) ) ( not ( = ?auto_150542 ?auto_150548 ) ) ( not ( = ?auto_150543 ?auto_150548 ) ) ( not ( = ?auto_150544 ?auto_150548 ) ) ( not ( = ?auto_150545 ?auto_150548 ) ) ( not ( = ?auto_150546 ?auto_150548 ) ) ( not ( = ?auto_150547 ?auto_150548 ) ) ( ON ?auto_150541 ?auto_150540 ) ( ON-TABLE ?auto_150548 ) ( CLEAR ?auto_150543 ) ( ON ?auto_150542 ?auto_150541 ) ( CLEAR ?auto_150542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150548 ?auto_150540 ?auto_150541 )
      ( MAKE-8PILE ?auto_150540 ?auto_150541 ?auto_150542 ?auto_150543 ?auto_150544 ?auto_150545 ?auto_150546 ?auto_150547 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150549 - BLOCK
      ?auto_150550 - BLOCK
      ?auto_150551 - BLOCK
      ?auto_150552 - BLOCK
      ?auto_150553 - BLOCK
      ?auto_150554 - BLOCK
      ?auto_150555 - BLOCK
      ?auto_150556 - BLOCK
    )
    :vars
    (
      ?auto_150557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150549 ?auto_150550 ) ) ( not ( = ?auto_150549 ?auto_150551 ) ) ( not ( = ?auto_150549 ?auto_150552 ) ) ( not ( = ?auto_150549 ?auto_150553 ) ) ( not ( = ?auto_150549 ?auto_150554 ) ) ( not ( = ?auto_150549 ?auto_150555 ) ) ( not ( = ?auto_150549 ?auto_150556 ) ) ( not ( = ?auto_150550 ?auto_150551 ) ) ( not ( = ?auto_150550 ?auto_150552 ) ) ( not ( = ?auto_150550 ?auto_150553 ) ) ( not ( = ?auto_150550 ?auto_150554 ) ) ( not ( = ?auto_150550 ?auto_150555 ) ) ( not ( = ?auto_150550 ?auto_150556 ) ) ( not ( = ?auto_150551 ?auto_150552 ) ) ( not ( = ?auto_150551 ?auto_150553 ) ) ( not ( = ?auto_150551 ?auto_150554 ) ) ( not ( = ?auto_150551 ?auto_150555 ) ) ( not ( = ?auto_150551 ?auto_150556 ) ) ( not ( = ?auto_150552 ?auto_150553 ) ) ( not ( = ?auto_150552 ?auto_150554 ) ) ( not ( = ?auto_150552 ?auto_150555 ) ) ( not ( = ?auto_150552 ?auto_150556 ) ) ( not ( = ?auto_150553 ?auto_150554 ) ) ( not ( = ?auto_150553 ?auto_150555 ) ) ( not ( = ?auto_150553 ?auto_150556 ) ) ( not ( = ?auto_150554 ?auto_150555 ) ) ( not ( = ?auto_150554 ?auto_150556 ) ) ( not ( = ?auto_150555 ?auto_150556 ) ) ( ON-TABLE ?auto_150556 ) ( ON ?auto_150555 ?auto_150556 ) ( ON ?auto_150554 ?auto_150555 ) ( ON ?auto_150553 ?auto_150554 ) ( ON ?auto_150549 ?auto_150557 ) ( not ( = ?auto_150549 ?auto_150557 ) ) ( not ( = ?auto_150550 ?auto_150557 ) ) ( not ( = ?auto_150551 ?auto_150557 ) ) ( not ( = ?auto_150552 ?auto_150557 ) ) ( not ( = ?auto_150553 ?auto_150557 ) ) ( not ( = ?auto_150554 ?auto_150557 ) ) ( not ( = ?auto_150555 ?auto_150557 ) ) ( not ( = ?auto_150556 ?auto_150557 ) ) ( ON ?auto_150550 ?auto_150549 ) ( ON-TABLE ?auto_150557 ) ( ON ?auto_150551 ?auto_150550 ) ( CLEAR ?auto_150551 ) ( HOLDING ?auto_150552 ) ( CLEAR ?auto_150553 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150556 ?auto_150555 ?auto_150554 ?auto_150553 ?auto_150552 )
      ( MAKE-8PILE ?auto_150549 ?auto_150550 ?auto_150551 ?auto_150552 ?auto_150553 ?auto_150554 ?auto_150555 ?auto_150556 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150558 - BLOCK
      ?auto_150559 - BLOCK
      ?auto_150560 - BLOCK
      ?auto_150561 - BLOCK
      ?auto_150562 - BLOCK
      ?auto_150563 - BLOCK
      ?auto_150564 - BLOCK
      ?auto_150565 - BLOCK
    )
    :vars
    (
      ?auto_150566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150558 ?auto_150559 ) ) ( not ( = ?auto_150558 ?auto_150560 ) ) ( not ( = ?auto_150558 ?auto_150561 ) ) ( not ( = ?auto_150558 ?auto_150562 ) ) ( not ( = ?auto_150558 ?auto_150563 ) ) ( not ( = ?auto_150558 ?auto_150564 ) ) ( not ( = ?auto_150558 ?auto_150565 ) ) ( not ( = ?auto_150559 ?auto_150560 ) ) ( not ( = ?auto_150559 ?auto_150561 ) ) ( not ( = ?auto_150559 ?auto_150562 ) ) ( not ( = ?auto_150559 ?auto_150563 ) ) ( not ( = ?auto_150559 ?auto_150564 ) ) ( not ( = ?auto_150559 ?auto_150565 ) ) ( not ( = ?auto_150560 ?auto_150561 ) ) ( not ( = ?auto_150560 ?auto_150562 ) ) ( not ( = ?auto_150560 ?auto_150563 ) ) ( not ( = ?auto_150560 ?auto_150564 ) ) ( not ( = ?auto_150560 ?auto_150565 ) ) ( not ( = ?auto_150561 ?auto_150562 ) ) ( not ( = ?auto_150561 ?auto_150563 ) ) ( not ( = ?auto_150561 ?auto_150564 ) ) ( not ( = ?auto_150561 ?auto_150565 ) ) ( not ( = ?auto_150562 ?auto_150563 ) ) ( not ( = ?auto_150562 ?auto_150564 ) ) ( not ( = ?auto_150562 ?auto_150565 ) ) ( not ( = ?auto_150563 ?auto_150564 ) ) ( not ( = ?auto_150563 ?auto_150565 ) ) ( not ( = ?auto_150564 ?auto_150565 ) ) ( ON-TABLE ?auto_150565 ) ( ON ?auto_150564 ?auto_150565 ) ( ON ?auto_150563 ?auto_150564 ) ( ON ?auto_150562 ?auto_150563 ) ( ON ?auto_150558 ?auto_150566 ) ( not ( = ?auto_150558 ?auto_150566 ) ) ( not ( = ?auto_150559 ?auto_150566 ) ) ( not ( = ?auto_150560 ?auto_150566 ) ) ( not ( = ?auto_150561 ?auto_150566 ) ) ( not ( = ?auto_150562 ?auto_150566 ) ) ( not ( = ?auto_150563 ?auto_150566 ) ) ( not ( = ?auto_150564 ?auto_150566 ) ) ( not ( = ?auto_150565 ?auto_150566 ) ) ( ON ?auto_150559 ?auto_150558 ) ( ON-TABLE ?auto_150566 ) ( ON ?auto_150560 ?auto_150559 ) ( CLEAR ?auto_150562 ) ( ON ?auto_150561 ?auto_150560 ) ( CLEAR ?auto_150561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150566 ?auto_150558 ?auto_150559 ?auto_150560 )
      ( MAKE-8PILE ?auto_150558 ?auto_150559 ?auto_150560 ?auto_150561 ?auto_150562 ?auto_150563 ?auto_150564 ?auto_150565 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150567 - BLOCK
      ?auto_150568 - BLOCK
      ?auto_150569 - BLOCK
      ?auto_150570 - BLOCK
      ?auto_150571 - BLOCK
      ?auto_150572 - BLOCK
      ?auto_150573 - BLOCK
      ?auto_150574 - BLOCK
    )
    :vars
    (
      ?auto_150575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150567 ?auto_150568 ) ) ( not ( = ?auto_150567 ?auto_150569 ) ) ( not ( = ?auto_150567 ?auto_150570 ) ) ( not ( = ?auto_150567 ?auto_150571 ) ) ( not ( = ?auto_150567 ?auto_150572 ) ) ( not ( = ?auto_150567 ?auto_150573 ) ) ( not ( = ?auto_150567 ?auto_150574 ) ) ( not ( = ?auto_150568 ?auto_150569 ) ) ( not ( = ?auto_150568 ?auto_150570 ) ) ( not ( = ?auto_150568 ?auto_150571 ) ) ( not ( = ?auto_150568 ?auto_150572 ) ) ( not ( = ?auto_150568 ?auto_150573 ) ) ( not ( = ?auto_150568 ?auto_150574 ) ) ( not ( = ?auto_150569 ?auto_150570 ) ) ( not ( = ?auto_150569 ?auto_150571 ) ) ( not ( = ?auto_150569 ?auto_150572 ) ) ( not ( = ?auto_150569 ?auto_150573 ) ) ( not ( = ?auto_150569 ?auto_150574 ) ) ( not ( = ?auto_150570 ?auto_150571 ) ) ( not ( = ?auto_150570 ?auto_150572 ) ) ( not ( = ?auto_150570 ?auto_150573 ) ) ( not ( = ?auto_150570 ?auto_150574 ) ) ( not ( = ?auto_150571 ?auto_150572 ) ) ( not ( = ?auto_150571 ?auto_150573 ) ) ( not ( = ?auto_150571 ?auto_150574 ) ) ( not ( = ?auto_150572 ?auto_150573 ) ) ( not ( = ?auto_150572 ?auto_150574 ) ) ( not ( = ?auto_150573 ?auto_150574 ) ) ( ON-TABLE ?auto_150574 ) ( ON ?auto_150573 ?auto_150574 ) ( ON ?auto_150572 ?auto_150573 ) ( ON ?auto_150567 ?auto_150575 ) ( not ( = ?auto_150567 ?auto_150575 ) ) ( not ( = ?auto_150568 ?auto_150575 ) ) ( not ( = ?auto_150569 ?auto_150575 ) ) ( not ( = ?auto_150570 ?auto_150575 ) ) ( not ( = ?auto_150571 ?auto_150575 ) ) ( not ( = ?auto_150572 ?auto_150575 ) ) ( not ( = ?auto_150573 ?auto_150575 ) ) ( not ( = ?auto_150574 ?auto_150575 ) ) ( ON ?auto_150568 ?auto_150567 ) ( ON-TABLE ?auto_150575 ) ( ON ?auto_150569 ?auto_150568 ) ( ON ?auto_150570 ?auto_150569 ) ( CLEAR ?auto_150570 ) ( HOLDING ?auto_150571 ) ( CLEAR ?auto_150572 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_150574 ?auto_150573 ?auto_150572 ?auto_150571 )
      ( MAKE-8PILE ?auto_150567 ?auto_150568 ?auto_150569 ?auto_150570 ?auto_150571 ?auto_150572 ?auto_150573 ?auto_150574 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150576 - BLOCK
      ?auto_150577 - BLOCK
      ?auto_150578 - BLOCK
      ?auto_150579 - BLOCK
      ?auto_150580 - BLOCK
      ?auto_150581 - BLOCK
      ?auto_150582 - BLOCK
      ?auto_150583 - BLOCK
    )
    :vars
    (
      ?auto_150584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150576 ?auto_150577 ) ) ( not ( = ?auto_150576 ?auto_150578 ) ) ( not ( = ?auto_150576 ?auto_150579 ) ) ( not ( = ?auto_150576 ?auto_150580 ) ) ( not ( = ?auto_150576 ?auto_150581 ) ) ( not ( = ?auto_150576 ?auto_150582 ) ) ( not ( = ?auto_150576 ?auto_150583 ) ) ( not ( = ?auto_150577 ?auto_150578 ) ) ( not ( = ?auto_150577 ?auto_150579 ) ) ( not ( = ?auto_150577 ?auto_150580 ) ) ( not ( = ?auto_150577 ?auto_150581 ) ) ( not ( = ?auto_150577 ?auto_150582 ) ) ( not ( = ?auto_150577 ?auto_150583 ) ) ( not ( = ?auto_150578 ?auto_150579 ) ) ( not ( = ?auto_150578 ?auto_150580 ) ) ( not ( = ?auto_150578 ?auto_150581 ) ) ( not ( = ?auto_150578 ?auto_150582 ) ) ( not ( = ?auto_150578 ?auto_150583 ) ) ( not ( = ?auto_150579 ?auto_150580 ) ) ( not ( = ?auto_150579 ?auto_150581 ) ) ( not ( = ?auto_150579 ?auto_150582 ) ) ( not ( = ?auto_150579 ?auto_150583 ) ) ( not ( = ?auto_150580 ?auto_150581 ) ) ( not ( = ?auto_150580 ?auto_150582 ) ) ( not ( = ?auto_150580 ?auto_150583 ) ) ( not ( = ?auto_150581 ?auto_150582 ) ) ( not ( = ?auto_150581 ?auto_150583 ) ) ( not ( = ?auto_150582 ?auto_150583 ) ) ( ON-TABLE ?auto_150583 ) ( ON ?auto_150582 ?auto_150583 ) ( ON ?auto_150581 ?auto_150582 ) ( ON ?auto_150576 ?auto_150584 ) ( not ( = ?auto_150576 ?auto_150584 ) ) ( not ( = ?auto_150577 ?auto_150584 ) ) ( not ( = ?auto_150578 ?auto_150584 ) ) ( not ( = ?auto_150579 ?auto_150584 ) ) ( not ( = ?auto_150580 ?auto_150584 ) ) ( not ( = ?auto_150581 ?auto_150584 ) ) ( not ( = ?auto_150582 ?auto_150584 ) ) ( not ( = ?auto_150583 ?auto_150584 ) ) ( ON ?auto_150577 ?auto_150576 ) ( ON-TABLE ?auto_150584 ) ( ON ?auto_150578 ?auto_150577 ) ( ON ?auto_150579 ?auto_150578 ) ( CLEAR ?auto_150581 ) ( ON ?auto_150580 ?auto_150579 ) ( CLEAR ?auto_150580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150584 ?auto_150576 ?auto_150577 ?auto_150578 ?auto_150579 )
      ( MAKE-8PILE ?auto_150576 ?auto_150577 ?auto_150578 ?auto_150579 ?auto_150580 ?auto_150581 ?auto_150582 ?auto_150583 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150585 - BLOCK
      ?auto_150586 - BLOCK
      ?auto_150587 - BLOCK
      ?auto_150588 - BLOCK
      ?auto_150589 - BLOCK
      ?auto_150590 - BLOCK
      ?auto_150591 - BLOCK
      ?auto_150592 - BLOCK
    )
    :vars
    (
      ?auto_150593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150585 ?auto_150586 ) ) ( not ( = ?auto_150585 ?auto_150587 ) ) ( not ( = ?auto_150585 ?auto_150588 ) ) ( not ( = ?auto_150585 ?auto_150589 ) ) ( not ( = ?auto_150585 ?auto_150590 ) ) ( not ( = ?auto_150585 ?auto_150591 ) ) ( not ( = ?auto_150585 ?auto_150592 ) ) ( not ( = ?auto_150586 ?auto_150587 ) ) ( not ( = ?auto_150586 ?auto_150588 ) ) ( not ( = ?auto_150586 ?auto_150589 ) ) ( not ( = ?auto_150586 ?auto_150590 ) ) ( not ( = ?auto_150586 ?auto_150591 ) ) ( not ( = ?auto_150586 ?auto_150592 ) ) ( not ( = ?auto_150587 ?auto_150588 ) ) ( not ( = ?auto_150587 ?auto_150589 ) ) ( not ( = ?auto_150587 ?auto_150590 ) ) ( not ( = ?auto_150587 ?auto_150591 ) ) ( not ( = ?auto_150587 ?auto_150592 ) ) ( not ( = ?auto_150588 ?auto_150589 ) ) ( not ( = ?auto_150588 ?auto_150590 ) ) ( not ( = ?auto_150588 ?auto_150591 ) ) ( not ( = ?auto_150588 ?auto_150592 ) ) ( not ( = ?auto_150589 ?auto_150590 ) ) ( not ( = ?auto_150589 ?auto_150591 ) ) ( not ( = ?auto_150589 ?auto_150592 ) ) ( not ( = ?auto_150590 ?auto_150591 ) ) ( not ( = ?auto_150590 ?auto_150592 ) ) ( not ( = ?auto_150591 ?auto_150592 ) ) ( ON-TABLE ?auto_150592 ) ( ON ?auto_150591 ?auto_150592 ) ( ON ?auto_150585 ?auto_150593 ) ( not ( = ?auto_150585 ?auto_150593 ) ) ( not ( = ?auto_150586 ?auto_150593 ) ) ( not ( = ?auto_150587 ?auto_150593 ) ) ( not ( = ?auto_150588 ?auto_150593 ) ) ( not ( = ?auto_150589 ?auto_150593 ) ) ( not ( = ?auto_150590 ?auto_150593 ) ) ( not ( = ?auto_150591 ?auto_150593 ) ) ( not ( = ?auto_150592 ?auto_150593 ) ) ( ON ?auto_150586 ?auto_150585 ) ( ON-TABLE ?auto_150593 ) ( ON ?auto_150587 ?auto_150586 ) ( ON ?auto_150588 ?auto_150587 ) ( ON ?auto_150589 ?auto_150588 ) ( CLEAR ?auto_150589 ) ( HOLDING ?auto_150590 ) ( CLEAR ?auto_150591 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150592 ?auto_150591 ?auto_150590 )
      ( MAKE-8PILE ?auto_150585 ?auto_150586 ?auto_150587 ?auto_150588 ?auto_150589 ?auto_150590 ?auto_150591 ?auto_150592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150594 - BLOCK
      ?auto_150595 - BLOCK
      ?auto_150596 - BLOCK
      ?auto_150597 - BLOCK
      ?auto_150598 - BLOCK
      ?auto_150599 - BLOCK
      ?auto_150600 - BLOCK
      ?auto_150601 - BLOCK
    )
    :vars
    (
      ?auto_150602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150594 ?auto_150595 ) ) ( not ( = ?auto_150594 ?auto_150596 ) ) ( not ( = ?auto_150594 ?auto_150597 ) ) ( not ( = ?auto_150594 ?auto_150598 ) ) ( not ( = ?auto_150594 ?auto_150599 ) ) ( not ( = ?auto_150594 ?auto_150600 ) ) ( not ( = ?auto_150594 ?auto_150601 ) ) ( not ( = ?auto_150595 ?auto_150596 ) ) ( not ( = ?auto_150595 ?auto_150597 ) ) ( not ( = ?auto_150595 ?auto_150598 ) ) ( not ( = ?auto_150595 ?auto_150599 ) ) ( not ( = ?auto_150595 ?auto_150600 ) ) ( not ( = ?auto_150595 ?auto_150601 ) ) ( not ( = ?auto_150596 ?auto_150597 ) ) ( not ( = ?auto_150596 ?auto_150598 ) ) ( not ( = ?auto_150596 ?auto_150599 ) ) ( not ( = ?auto_150596 ?auto_150600 ) ) ( not ( = ?auto_150596 ?auto_150601 ) ) ( not ( = ?auto_150597 ?auto_150598 ) ) ( not ( = ?auto_150597 ?auto_150599 ) ) ( not ( = ?auto_150597 ?auto_150600 ) ) ( not ( = ?auto_150597 ?auto_150601 ) ) ( not ( = ?auto_150598 ?auto_150599 ) ) ( not ( = ?auto_150598 ?auto_150600 ) ) ( not ( = ?auto_150598 ?auto_150601 ) ) ( not ( = ?auto_150599 ?auto_150600 ) ) ( not ( = ?auto_150599 ?auto_150601 ) ) ( not ( = ?auto_150600 ?auto_150601 ) ) ( ON-TABLE ?auto_150601 ) ( ON ?auto_150600 ?auto_150601 ) ( ON ?auto_150594 ?auto_150602 ) ( not ( = ?auto_150594 ?auto_150602 ) ) ( not ( = ?auto_150595 ?auto_150602 ) ) ( not ( = ?auto_150596 ?auto_150602 ) ) ( not ( = ?auto_150597 ?auto_150602 ) ) ( not ( = ?auto_150598 ?auto_150602 ) ) ( not ( = ?auto_150599 ?auto_150602 ) ) ( not ( = ?auto_150600 ?auto_150602 ) ) ( not ( = ?auto_150601 ?auto_150602 ) ) ( ON ?auto_150595 ?auto_150594 ) ( ON-TABLE ?auto_150602 ) ( ON ?auto_150596 ?auto_150595 ) ( ON ?auto_150597 ?auto_150596 ) ( ON ?auto_150598 ?auto_150597 ) ( CLEAR ?auto_150600 ) ( ON ?auto_150599 ?auto_150598 ) ( CLEAR ?auto_150599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150602 ?auto_150594 ?auto_150595 ?auto_150596 ?auto_150597 ?auto_150598 )
      ( MAKE-8PILE ?auto_150594 ?auto_150595 ?auto_150596 ?auto_150597 ?auto_150598 ?auto_150599 ?auto_150600 ?auto_150601 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150603 - BLOCK
      ?auto_150604 - BLOCK
      ?auto_150605 - BLOCK
      ?auto_150606 - BLOCK
      ?auto_150607 - BLOCK
      ?auto_150608 - BLOCK
      ?auto_150609 - BLOCK
      ?auto_150610 - BLOCK
    )
    :vars
    (
      ?auto_150611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150603 ?auto_150604 ) ) ( not ( = ?auto_150603 ?auto_150605 ) ) ( not ( = ?auto_150603 ?auto_150606 ) ) ( not ( = ?auto_150603 ?auto_150607 ) ) ( not ( = ?auto_150603 ?auto_150608 ) ) ( not ( = ?auto_150603 ?auto_150609 ) ) ( not ( = ?auto_150603 ?auto_150610 ) ) ( not ( = ?auto_150604 ?auto_150605 ) ) ( not ( = ?auto_150604 ?auto_150606 ) ) ( not ( = ?auto_150604 ?auto_150607 ) ) ( not ( = ?auto_150604 ?auto_150608 ) ) ( not ( = ?auto_150604 ?auto_150609 ) ) ( not ( = ?auto_150604 ?auto_150610 ) ) ( not ( = ?auto_150605 ?auto_150606 ) ) ( not ( = ?auto_150605 ?auto_150607 ) ) ( not ( = ?auto_150605 ?auto_150608 ) ) ( not ( = ?auto_150605 ?auto_150609 ) ) ( not ( = ?auto_150605 ?auto_150610 ) ) ( not ( = ?auto_150606 ?auto_150607 ) ) ( not ( = ?auto_150606 ?auto_150608 ) ) ( not ( = ?auto_150606 ?auto_150609 ) ) ( not ( = ?auto_150606 ?auto_150610 ) ) ( not ( = ?auto_150607 ?auto_150608 ) ) ( not ( = ?auto_150607 ?auto_150609 ) ) ( not ( = ?auto_150607 ?auto_150610 ) ) ( not ( = ?auto_150608 ?auto_150609 ) ) ( not ( = ?auto_150608 ?auto_150610 ) ) ( not ( = ?auto_150609 ?auto_150610 ) ) ( ON-TABLE ?auto_150610 ) ( ON ?auto_150603 ?auto_150611 ) ( not ( = ?auto_150603 ?auto_150611 ) ) ( not ( = ?auto_150604 ?auto_150611 ) ) ( not ( = ?auto_150605 ?auto_150611 ) ) ( not ( = ?auto_150606 ?auto_150611 ) ) ( not ( = ?auto_150607 ?auto_150611 ) ) ( not ( = ?auto_150608 ?auto_150611 ) ) ( not ( = ?auto_150609 ?auto_150611 ) ) ( not ( = ?auto_150610 ?auto_150611 ) ) ( ON ?auto_150604 ?auto_150603 ) ( ON-TABLE ?auto_150611 ) ( ON ?auto_150605 ?auto_150604 ) ( ON ?auto_150606 ?auto_150605 ) ( ON ?auto_150607 ?auto_150606 ) ( ON ?auto_150608 ?auto_150607 ) ( CLEAR ?auto_150608 ) ( HOLDING ?auto_150609 ) ( CLEAR ?auto_150610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150610 ?auto_150609 )
      ( MAKE-8PILE ?auto_150603 ?auto_150604 ?auto_150605 ?auto_150606 ?auto_150607 ?auto_150608 ?auto_150609 ?auto_150610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150612 - BLOCK
      ?auto_150613 - BLOCK
      ?auto_150614 - BLOCK
      ?auto_150615 - BLOCK
      ?auto_150616 - BLOCK
      ?auto_150617 - BLOCK
      ?auto_150618 - BLOCK
      ?auto_150619 - BLOCK
    )
    :vars
    (
      ?auto_150620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150612 ?auto_150613 ) ) ( not ( = ?auto_150612 ?auto_150614 ) ) ( not ( = ?auto_150612 ?auto_150615 ) ) ( not ( = ?auto_150612 ?auto_150616 ) ) ( not ( = ?auto_150612 ?auto_150617 ) ) ( not ( = ?auto_150612 ?auto_150618 ) ) ( not ( = ?auto_150612 ?auto_150619 ) ) ( not ( = ?auto_150613 ?auto_150614 ) ) ( not ( = ?auto_150613 ?auto_150615 ) ) ( not ( = ?auto_150613 ?auto_150616 ) ) ( not ( = ?auto_150613 ?auto_150617 ) ) ( not ( = ?auto_150613 ?auto_150618 ) ) ( not ( = ?auto_150613 ?auto_150619 ) ) ( not ( = ?auto_150614 ?auto_150615 ) ) ( not ( = ?auto_150614 ?auto_150616 ) ) ( not ( = ?auto_150614 ?auto_150617 ) ) ( not ( = ?auto_150614 ?auto_150618 ) ) ( not ( = ?auto_150614 ?auto_150619 ) ) ( not ( = ?auto_150615 ?auto_150616 ) ) ( not ( = ?auto_150615 ?auto_150617 ) ) ( not ( = ?auto_150615 ?auto_150618 ) ) ( not ( = ?auto_150615 ?auto_150619 ) ) ( not ( = ?auto_150616 ?auto_150617 ) ) ( not ( = ?auto_150616 ?auto_150618 ) ) ( not ( = ?auto_150616 ?auto_150619 ) ) ( not ( = ?auto_150617 ?auto_150618 ) ) ( not ( = ?auto_150617 ?auto_150619 ) ) ( not ( = ?auto_150618 ?auto_150619 ) ) ( ON-TABLE ?auto_150619 ) ( ON ?auto_150612 ?auto_150620 ) ( not ( = ?auto_150612 ?auto_150620 ) ) ( not ( = ?auto_150613 ?auto_150620 ) ) ( not ( = ?auto_150614 ?auto_150620 ) ) ( not ( = ?auto_150615 ?auto_150620 ) ) ( not ( = ?auto_150616 ?auto_150620 ) ) ( not ( = ?auto_150617 ?auto_150620 ) ) ( not ( = ?auto_150618 ?auto_150620 ) ) ( not ( = ?auto_150619 ?auto_150620 ) ) ( ON ?auto_150613 ?auto_150612 ) ( ON-TABLE ?auto_150620 ) ( ON ?auto_150614 ?auto_150613 ) ( ON ?auto_150615 ?auto_150614 ) ( ON ?auto_150616 ?auto_150615 ) ( ON ?auto_150617 ?auto_150616 ) ( CLEAR ?auto_150619 ) ( ON ?auto_150618 ?auto_150617 ) ( CLEAR ?auto_150618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150620 ?auto_150612 ?auto_150613 ?auto_150614 ?auto_150615 ?auto_150616 ?auto_150617 )
      ( MAKE-8PILE ?auto_150612 ?auto_150613 ?auto_150614 ?auto_150615 ?auto_150616 ?auto_150617 ?auto_150618 ?auto_150619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150621 - BLOCK
      ?auto_150622 - BLOCK
      ?auto_150623 - BLOCK
      ?auto_150624 - BLOCK
      ?auto_150625 - BLOCK
      ?auto_150626 - BLOCK
      ?auto_150627 - BLOCK
      ?auto_150628 - BLOCK
    )
    :vars
    (
      ?auto_150629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150621 ?auto_150622 ) ) ( not ( = ?auto_150621 ?auto_150623 ) ) ( not ( = ?auto_150621 ?auto_150624 ) ) ( not ( = ?auto_150621 ?auto_150625 ) ) ( not ( = ?auto_150621 ?auto_150626 ) ) ( not ( = ?auto_150621 ?auto_150627 ) ) ( not ( = ?auto_150621 ?auto_150628 ) ) ( not ( = ?auto_150622 ?auto_150623 ) ) ( not ( = ?auto_150622 ?auto_150624 ) ) ( not ( = ?auto_150622 ?auto_150625 ) ) ( not ( = ?auto_150622 ?auto_150626 ) ) ( not ( = ?auto_150622 ?auto_150627 ) ) ( not ( = ?auto_150622 ?auto_150628 ) ) ( not ( = ?auto_150623 ?auto_150624 ) ) ( not ( = ?auto_150623 ?auto_150625 ) ) ( not ( = ?auto_150623 ?auto_150626 ) ) ( not ( = ?auto_150623 ?auto_150627 ) ) ( not ( = ?auto_150623 ?auto_150628 ) ) ( not ( = ?auto_150624 ?auto_150625 ) ) ( not ( = ?auto_150624 ?auto_150626 ) ) ( not ( = ?auto_150624 ?auto_150627 ) ) ( not ( = ?auto_150624 ?auto_150628 ) ) ( not ( = ?auto_150625 ?auto_150626 ) ) ( not ( = ?auto_150625 ?auto_150627 ) ) ( not ( = ?auto_150625 ?auto_150628 ) ) ( not ( = ?auto_150626 ?auto_150627 ) ) ( not ( = ?auto_150626 ?auto_150628 ) ) ( not ( = ?auto_150627 ?auto_150628 ) ) ( ON ?auto_150621 ?auto_150629 ) ( not ( = ?auto_150621 ?auto_150629 ) ) ( not ( = ?auto_150622 ?auto_150629 ) ) ( not ( = ?auto_150623 ?auto_150629 ) ) ( not ( = ?auto_150624 ?auto_150629 ) ) ( not ( = ?auto_150625 ?auto_150629 ) ) ( not ( = ?auto_150626 ?auto_150629 ) ) ( not ( = ?auto_150627 ?auto_150629 ) ) ( not ( = ?auto_150628 ?auto_150629 ) ) ( ON ?auto_150622 ?auto_150621 ) ( ON-TABLE ?auto_150629 ) ( ON ?auto_150623 ?auto_150622 ) ( ON ?auto_150624 ?auto_150623 ) ( ON ?auto_150625 ?auto_150624 ) ( ON ?auto_150626 ?auto_150625 ) ( ON ?auto_150627 ?auto_150626 ) ( CLEAR ?auto_150627 ) ( HOLDING ?auto_150628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150628 )
      ( MAKE-8PILE ?auto_150621 ?auto_150622 ?auto_150623 ?auto_150624 ?auto_150625 ?auto_150626 ?auto_150627 ?auto_150628 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_150630 - BLOCK
      ?auto_150631 - BLOCK
      ?auto_150632 - BLOCK
      ?auto_150633 - BLOCK
      ?auto_150634 - BLOCK
      ?auto_150635 - BLOCK
      ?auto_150636 - BLOCK
      ?auto_150637 - BLOCK
    )
    :vars
    (
      ?auto_150638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150630 ?auto_150631 ) ) ( not ( = ?auto_150630 ?auto_150632 ) ) ( not ( = ?auto_150630 ?auto_150633 ) ) ( not ( = ?auto_150630 ?auto_150634 ) ) ( not ( = ?auto_150630 ?auto_150635 ) ) ( not ( = ?auto_150630 ?auto_150636 ) ) ( not ( = ?auto_150630 ?auto_150637 ) ) ( not ( = ?auto_150631 ?auto_150632 ) ) ( not ( = ?auto_150631 ?auto_150633 ) ) ( not ( = ?auto_150631 ?auto_150634 ) ) ( not ( = ?auto_150631 ?auto_150635 ) ) ( not ( = ?auto_150631 ?auto_150636 ) ) ( not ( = ?auto_150631 ?auto_150637 ) ) ( not ( = ?auto_150632 ?auto_150633 ) ) ( not ( = ?auto_150632 ?auto_150634 ) ) ( not ( = ?auto_150632 ?auto_150635 ) ) ( not ( = ?auto_150632 ?auto_150636 ) ) ( not ( = ?auto_150632 ?auto_150637 ) ) ( not ( = ?auto_150633 ?auto_150634 ) ) ( not ( = ?auto_150633 ?auto_150635 ) ) ( not ( = ?auto_150633 ?auto_150636 ) ) ( not ( = ?auto_150633 ?auto_150637 ) ) ( not ( = ?auto_150634 ?auto_150635 ) ) ( not ( = ?auto_150634 ?auto_150636 ) ) ( not ( = ?auto_150634 ?auto_150637 ) ) ( not ( = ?auto_150635 ?auto_150636 ) ) ( not ( = ?auto_150635 ?auto_150637 ) ) ( not ( = ?auto_150636 ?auto_150637 ) ) ( ON ?auto_150630 ?auto_150638 ) ( not ( = ?auto_150630 ?auto_150638 ) ) ( not ( = ?auto_150631 ?auto_150638 ) ) ( not ( = ?auto_150632 ?auto_150638 ) ) ( not ( = ?auto_150633 ?auto_150638 ) ) ( not ( = ?auto_150634 ?auto_150638 ) ) ( not ( = ?auto_150635 ?auto_150638 ) ) ( not ( = ?auto_150636 ?auto_150638 ) ) ( not ( = ?auto_150637 ?auto_150638 ) ) ( ON ?auto_150631 ?auto_150630 ) ( ON-TABLE ?auto_150638 ) ( ON ?auto_150632 ?auto_150631 ) ( ON ?auto_150633 ?auto_150632 ) ( ON ?auto_150634 ?auto_150633 ) ( ON ?auto_150635 ?auto_150634 ) ( ON ?auto_150636 ?auto_150635 ) ( ON ?auto_150637 ?auto_150636 ) ( CLEAR ?auto_150637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150638 ?auto_150630 ?auto_150631 ?auto_150632 ?auto_150633 ?auto_150634 ?auto_150635 ?auto_150636 )
      ( MAKE-8PILE ?auto_150630 ?auto_150631 ?auto_150632 ?auto_150633 ?auto_150634 ?auto_150635 ?auto_150636 ?auto_150637 ) )
  )

)

