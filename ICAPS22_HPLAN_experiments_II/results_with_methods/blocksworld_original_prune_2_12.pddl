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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_890 - BLOCK
      ?auto_891 - BLOCK
    )
    :vars
    (
      ?auto_892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892 ?auto_891 ) ( CLEAR ?auto_892 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_890 ) ( ON ?auto_891 ?auto_890 ) ( not ( = ?auto_890 ?auto_891 ) ) ( not ( = ?auto_890 ?auto_892 ) ) ( not ( = ?auto_891 ?auto_892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_892 ?auto_891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_894 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_894 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_895 - BLOCK
    )
    :vars
    (
      ?auto_896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895 ?auto_896 ) ( CLEAR ?auto_895 ) ( HAND-EMPTY ) ( not ( = ?auto_895 ?auto_896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_895 ?auto_896 )
      ( MAKE-1PILE ?auto_895 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_898 - BLOCK
    )
    :vars
    (
      ?auto_899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899 ?auto_898 ) ( CLEAR ?auto_899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898 ) ( not ( = ?auto_898 ?auto_899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_899 ?auto_898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_900 - BLOCK
    )
    :vars
    (
      ?auto_901 - BLOCK
      ?auto_902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901 ?auto_900 ) ( CLEAR ?auto_901 ) ( ON-TABLE ?auto_900 ) ( not ( = ?auto_900 ?auto_901 ) ) ( HOLDING ?auto_902 ) ( not ( = ?auto_900 ?auto_902 ) ) ( not ( = ?auto_901 ?auto_902 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_902 )
      ( MAKE-1PILE ?auto_900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_903 - BLOCK
    )
    :vars
    (
      ?auto_904 - BLOCK
      ?auto_905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904 ?auto_903 ) ( ON-TABLE ?auto_903 ) ( not ( = ?auto_903 ?auto_904 ) ) ( not ( = ?auto_903 ?auto_905 ) ) ( not ( = ?auto_904 ?auto_905 ) ) ( ON ?auto_905 ?auto_904 ) ( CLEAR ?auto_905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_903 ?auto_904 )
      ( MAKE-1PILE ?auto_903 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_908 - BLOCK
      ?auto_909 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_909 ) ( CLEAR ?auto_908 ) ( ON-TABLE ?auto_908 ) ( not ( = ?auto_908 ?auto_909 ) ) )
    :subtasks
    ( ( !STACK ?auto_909 ?auto_908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_910 - BLOCK
      ?auto_911 - BLOCK
    )
    :vars
    (
      ?auto_912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_910 ) ( ON-TABLE ?auto_910 ) ( not ( = ?auto_910 ?auto_911 ) ) ( ON ?auto_911 ?auto_912 ) ( CLEAR ?auto_911 ) ( HAND-EMPTY ) ( not ( = ?auto_910 ?auto_912 ) ) ( not ( = ?auto_911 ?auto_912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_911 ?auto_912 )
      ( MAKE-2PILE ?auto_910 ?auto_911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_913 - BLOCK
      ?auto_914 - BLOCK
    )
    :vars
    (
      ?auto_915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_913 ?auto_914 ) ) ( ON ?auto_914 ?auto_915 ) ( CLEAR ?auto_914 ) ( not ( = ?auto_913 ?auto_915 ) ) ( not ( = ?auto_914 ?auto_915 ) ) ( HOLDING ?auto_913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_913 )
      ( MAKE-2PILE ?auto_913 ?auto_914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_916 - BLOCK
      ?auto_917 - BLOCK
    )
    :vars
    (
      ?auto_918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_916 ?auto_917 ) ) ( ON ?auto_917 ?auto_918 ) ( not ( = ?auto_916 ?auto_918 ) ) ( not ( = ?auto_917 ?auto_918 ) ) ( ON ?auto_916 ?auto_917 ) ( CLEAR ?auto_916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_918 ?auto_917 )
      ( MAKE-2PILE ?auto_916 ?auto_917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_935 - BLOCK
    )
    :vars
    (
      ?auto_936 - BLOCK
      ?auto_937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_935 ?auto_936 ) ( CLEAR ?auto_935 ) ( not ( = ?auto_935 ?auto_936 ) ) ( HOLDING ?auto_937 ) ( not ( = ?auto_935 ?auto_937 ) ) ( not ( = ?auto_936 ?auto_937 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_937 )
      ( MAKE-1PILE ?auto_935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_938 - BLOCK
    )
    :vars
    (
      ?auto_939 - BLOCK
      ?auto_940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_938 ?auto_939 ) ( not ( = ?auto_938 ?auto_939 ) ) ( not ( = ?auto_938 ?auto_940 ) ) ( not ( = ?auto_939 ?auto_940 ) ) ( ON ?auto_940 ?auto_938 ) ( CLEAR ?auto_940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_939 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_939 ?auto_938 )
      ( MAKE-1PILE ?auto_938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_945 - BLOCK
      ?auto_946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_945 ) ( ON-TABLE ?auto_945 ) ( not ( = ?auto_945 ?auto_946 ) ) ( ON-TABLE ?auto_946 ) ( CLEAR ?auto_946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_946 )
      ( MAKE-2PILE ?auto_945 ?auto_946 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_947 - BLOCK
      ?auto_948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_947 ?auto_948 ) ) ( ON-TABLE ?auto_948 ) ( CLEAR ?auto_948 ) ( HOLDING ?auto_947 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_947 )
      ( MAKE-2PILE ?auto_947 ?auto_948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_949 - BLOCK
      ?auto_950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_949 ?auto_950 ) ) ( ON-TABLE ?auto_950 ) ( ON ?auto_949 ?auto_950 ) ( CLEAR ?auto_949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_950 )
      ( MAKE-2PILE ?auto_949 ?auto_950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_953 - BLOCK
      ?auto_954 - BLOCK
    )
    :vars
    (
      ?auto_955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_953 ?auto_954 ) ) ( ON-TABLE ?auto_954 ) ( CLEAR ?auto_954 ) ( ON ?auto_953 ?auto_955 ) ( CLEAR ?auto_953 ) ( HAND-EMPTY ) ( not ( = ?auto_953 ?auto_955 ) ) ( not ( = ?auto_954 ?auto_955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_953 ?auto_955 )
      ( MAKE-2PILE ?auto_953 ?auto_954 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_956 - BLOCK
      ?auto_957 - BLOCK
    )
    :vars
    (
      ?auto_958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_956 ?auto_957 ) ) ( ON ?auto_956 ?auto_958 ) ( CLEAR ?auto_956 ) ( not ( = ?auto_956 ?auto_958 ) ) ( not ( = ?auto_957 ?auto_958 ) ) ( HOLDING ?auto_957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_957 )
      ( MAKE-2PILE ?auto_956 ?auto_957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_959 - BLOCK
      ?auto_960 - BLOCK
    )
    :vars
    (
      ?auto_961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_959 ?auto_960 ) ) ( ON ?auto_959 ?auto_961 ) ( not ( = ?auto_959 ?auto_961 ) ) ( not ( = ?auto_960 ?auto_961 ) ) ( ON ?auto_960 ?auto_959 ) ( CLEAR ?auto_960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_961 ?auto_959 )
      ( MAKE-2PILE ?auto_959 ?auto_960 ) )
  )

)

