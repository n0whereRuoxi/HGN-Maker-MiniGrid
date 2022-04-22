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
      ?auto_893 - BLOCK
      ?auto_894 - BLOCK
    )
    :vars
    (
      ?auto_895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895 ?auto_894 ) ( CLEAR ?auto_895 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_893 ) ( ON ?auto_894 ?auto_893 ) ( not ( = ?auto_893 ?auto_894 ) ) ( not ( = ?auto_893 ?auto_895 ) ) ( not ( = ?auto_894 ?auto_895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_895 ?auto_894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_897 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_897 ) )
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
    ( and ( ON ?auto_898 ?auto_899 ) ( CLEAR ?auto_898 ) ( HAND-EMPTY ) ( not ( = ?auto_898 ?auto_899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898 ?auto_899 )
      ( MAKE-1PILE ?auto_898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_901 - BLOCK
    )
    :vars
    (
      ?auto_902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902 ?auto_901 ) ( CLEAR ?auto_902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_901 ) ( not ( = ?auto_901 ?auto_902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_902 ?auto_901 ) )
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
    ( and ( ON ?auto_904 ?auto_903 ) ( CLEAR ?auto_904 ) ( ON-TABLE ?auto_903 ) ( not ( = ?auto_903 ?auto_904 ) ) ( HOLDING ?auto_905 ) ( not ( = ?auto_903 ?auto_905 ) ) ( not ( = ?auto_904 ?auto_905 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_905 )
      ( MAKE-1PILE ?auto_903 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_906 - BLOCK
    )
    :vars
    (
      ?auto_908 - BLOCK
      ?auto_907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_908 ?auto_906 ) ( ON-TABLE ?auto_906 ) ( not ( = ?auto_906 ?auto_908 ) ) ( not ( = ?auto_906 ?auto_907 ) ) ( not ( = ?auto_908 ?auto_907 ) ) ( ON ?auto_907 ?auto_908 ) ( CLEAR ?auto_907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_906 ?auto_908 )
      ( MAKE-1PILE ?auto_906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_911 - BLOCK
      ?auto_912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_912 ) ( CLEAR ?auto_911 ) ( ON-TABLE ?auto_911 ) ( not ( = ?auto_911 ?auto_912 ) ) )
    :subtasks
    ( ( !STACK ?auto_912 ?auto_911 ) )
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
    ( and ( CLEAR ?auto_913 ) ( ON-TABLE ?auto_913 ) ( not ( = ?auto_913 ?auto_914 ) ) ( ON ?auto_914 ?auto_915 ) ( CLEAR ?auto_914 ) ( HAND-EMPTY ) ( not ( = ?auto_913 ?auto_915 ) ) ( not ( = ?auto_914 ?auto_915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_914 ?auto_915 )
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
    ( and ( not ( = ?auto_916 ?auto_917 ) ) ( ON ?auto_917 ?auto_918 ) ( CLEAR ?auto_917 ) ( not ( = ?auto_916 ?auto_918 ) ) ( not ( = ?auto_917 ?auto_918 ) ) ( HOLDING ?auto_916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_916 )
      ( MAKE-2PILE ?auto_916 ?auto_917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_919 - BLOCK
      ?auto_920 - BLOCK
    )
    :vars
    (
      ?auto_921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_919 ?auto_920 ) ) ( ON ?auto_920 ?auto_921 ) ( not ( = ?auto_919 ?auto_921 ) ) ( not ( = ?auto_920 ?auto_921 ) ) ( ON ?auto_919 ?auto_920 ) ( CLEAR ?auto_919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_921 ?auto_920 )
      ( MAKE-2PILE ?auto_919 ?auto_920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_923 - BLOCK
    )
    :vars
    (
      ?auto_924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_924 ?auto_923 ) ( CLEAR ?auto_924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_923 ) ( not ( = ?auto_923 ?auto_924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_924 ?auto_923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_930 - BLOCK
    )
    :vars
    (
      ?auto_931 - BLOCK
      ?auto_932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_930 ?auto_931 ) ) ( ON ?auto_931 ?auto_932 ) ( CLEAR ?auto_931 ) ( not ( = ?auto_930 ?auto_932 ) ) ( not ( = ?auto_931 ?auto_932 ) ) ( HOLDING ?auto_930 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_930 ?auto_931 )
      ( MAKE-1PILE ?auto_930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_933 - BLOCK
    )
    :vars
    (
      ?auto_934 - BLOCK
      ?auto_935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_933 ?auto_934 ) ) ( ON ?auto_934 ?auto_935 ) ( not ( = ?auto_933 ?auto_935 ) ) ( not ( = ?auto_934 ?auto_935 ) ) ( ON ?auto_933 ?auto_934 ) ( CLEAR ?auto_933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_935 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_935 ?auto_934 )
      ( MAKE-1PILE ?auto_933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_937 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_938 - BLOCK
    )
    :vars
    (
      ?auto_939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_938 ?auto_939 ) ( CLEAR ?auto_938 ) ( HAND-EMPTY ) ( not ( = ?auto_938 ?auto_939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_938 ?auto_939 )
      ( MAKE-1PILE ?auto_938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_940 - BLOCK
    )
    :vars
    (
      ?auto_941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_940 ?auto_941 ) ) ( HOLDING ?auto_940 ) ( CLEAR ?auto_941 ) ( ON-TABLE ?auto_941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_941 ?auto_940 )
      ( MAKE-1PILE ?auto_940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_942 - BLOCK
    )
    :vars
    (
      ?auto_943 - BLOCK
      ?auto_944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_942 ?auto_943 ) ) ( CLEAR ?auto_943 ) ( ON-TABLE ?auto_943 ) ( ON ?auto_942 ?auto_944 ) ( CLEAR ?auto_942 ) ( HAND-EMPTY ) ( not ( = ?auto_942 ?auto_944 ) ) ( not ( = ?auto_943 ?auto_944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_942 ?auto_944 )
      ( MAKE-1PILE ?auto_942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_945 - BLOCK
    )
    :vars
    (
      ?auto_946 - BLOCK
      ?auto_947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_945 ?auto_946 ) ) ( ON ?auto_945 ?auto_947 ) ( CLEAR ?auto_945 ) ( not ( = ?auto_945 ?auto_947 ) ) ( not ( = ?auto_946 ?auto_947 ) ) ( HOLDING ?auto_946 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_946 )
      ( MAKE-1PILE ?auto_945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_948 - BLOCK
    )
    :vars
    (
      ?auto_949 - BLOCK
      ?auto_950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_948 ?auto_949 ) ) ( ON ?auto_948 ?auto_950 ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_949 ?auto_950 ) ) ( ON ?auto_949 ?auto_948 ) ( CLEAR ?auto_949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_950 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_950 ?auto_948 )
      ( MAKE-1PILE ?auto_948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_953 - BLOCK
      ?auto_954 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_954 ) ( CLEAR ?auto_953 ) ( ON-TABLE ?auto_953 ) ( not ( = ?auto_953 ?auto_954 ) ) )
    :subtasks
    ( ( !STACK ?auto_954 ?auto_953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_955 - BLOCK
      ?auto_956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_955 ) ( ON-TABLE ?auto_955 ) ( not ( = ?auto_955 ?auto_956 ) ) ( ON-TABLE ?auto_956 ) ( CLEAR ?auto_956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_956 )
      ( MAKE-2PILE ?auto_955 ?auto_956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_957 - BLOCK
      ?auto_958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_957 ?auto_958 ) ) ( ON-TABLE ?auto_958 ) ( CLEAR ?auto_958 ) ( HOLDING ?auto_957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_957 )
      ( MAKE-2PILE ?auto_957 ?auto_958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_959 - BLOCK
      ?auto_960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_959 ?auto_960 ) ) ( ON-TABLE ?auto_960 ) ( ON ?auto_959 ?auto_960 ) ( CLEAR ?auto_959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_960 )
      ( MAKE-2PILE ?auto_959 ?auto_960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_961 - BLOCK
      ?auto_962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_961 ?auto_962 ) ) ( ON-TABLE ?auto_962 ) ( HOLDING ?auto_961 ) ( CLEAR ?auto_962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_962 ?auto_961 )
      ( MAKE-2PILE ?auto_961 ?auto_962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_963 - BLOCK
      ?auto_964 - BLOCK
    )
    :vars
    (
      ?auto_965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_963 ?auto_964 ) ) ( ON-TABLE ?auto_964 ) ( CLEAR ?auto_964 ) ( ON ?auto_963 ?auto_965 ) ( CLEAR ?auto_963 ) ( HAND-EMPTY ) ( not ( = ?auto_963 ?auto_965 ) ) ( not ( = ?auto_964 ?auto_965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_963 ?auto_965 )
      ( MAKE-2PILE ?auto_963 ?auto_964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_966 - BLOCK
      ?auto_967 - BLOCK
    )
    :vars
    (
      ?auto_968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_966 ?auto_967 ) ) ( ON ?auto_966 ?auto_968 ) ( CLEAR ?auto_966 ) ( not ( = ?auto_966 ?auto_968 ) ) ( not ( = ?auto_967 ?auto_968 ) ) ( HOLDING ?auto_967 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_967 )
      ( MAKE-2PILE ?auto_966 ?auto_967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_969 - BLOCK
      ?auto_970 - BLOCK
    )
    :vars
    (
      ?auto_971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_969 ?auto_970 ) ) ( ON ?auto_969 ?auto_971 ) ( not ( = ?auto_969 ?auto_971 ) ) ( not ( = ?auto_970 ?auto_971 ) ) ( ON ?auto_970 ?auto_969 ) ( CLEAR ?auto_970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_971 ?auto_969 )
      ( MAKE-2PILE ?auto_969 ?auto_970 ) )
  )

)

