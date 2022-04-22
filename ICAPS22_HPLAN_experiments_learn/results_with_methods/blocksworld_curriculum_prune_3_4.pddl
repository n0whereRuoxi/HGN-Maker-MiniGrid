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
      ?auto_869 - BLOCK
    )
    :vars
    (
      ?auto_870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_869 ?auto_870 ) ( CLEAR ?auto_869 ) ( HAND-EMPTY ) ( not ( = ?auto_869 ?auto_870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_869 ?auto_870 )
      ( !PUTDOWN ?auto_869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_876 - BLOCK
      ?auto_877 - BLOCK
    )
    :vars
    (
      ?auto_878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_876 ) ( ON ?auto_877 ?auto_878 ) ( CLEAR ?auto_877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_876 ) ( not ( = ?auto_876 ?auto_877 ) ) ( not ( = ?auto_876 ?auto_878 ) ) ( not ( = ?auto_877 ?auto_878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_877 ?auto_878 )
      ( !STACK ?auto_877 ?auto_876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_886 - BLOCK
      ?auto_887 - BLOCK
    )
    :vars
    (
      ?auto_888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_887 ?auto_888 ) ( not ( = ?auto_886 ?auto_887 ) ) ( not ( = ?auto_886 ?auto_888 ) ) ( not ( = ?auto_887 ?auto_888 ) ) ( ON ?auto_886 ?auto_887 ) ( CLEAR ?auto_886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_886 )
      ( MAKE-2PILE ?auto_886 ?auto_887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_897 - BLOCK
      ?auto_898 - BLOCK
      ?auto_899 - BLOCK
    )
    :vars
    (
      ?auto_900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898 ) ( ON ?auto_899 ?auto_900 ) ( CLEAR ?auto_899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_897 ) ( ON ?auto_898 ?auto_897 ) ( not ( = ?auto_897 ?auto_898 ) ) ( not ( = ?auto_897 ?auto_899 ) ) ( not ( = ?auto_897 ?auto_900 ) ) ( not ( = ?auto_898 ?auto_899 ) ) ( not ( = ?auto_898 ?auto_900 ) ) ( not ( = ?auto_899 ?auto_900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_899 ?auto_900 )
      ( !STACK ?auto_899 ?auto_898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_904 - BLOCK
      ?auto_905 - BLOCK
      ?auto_906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_905 ) ( ON-TABLE ?auto_906 ) ( CLEAR ?auto_906 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_904 ) ( ON ?auto_905 ?auto_904 ) ( not ( = ?auto_904 ?auto_905 ) ) ( not ( = ?auto_904 ?auto_906 ) ) ( not ( = ?auto_905 ?auto_906 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_906 )
      ( !STACK ?auto_906 ?auto_905 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_910 - BLOCK
      ?auto_911 - BLOCK
      ?auto_912 - BLOCK
    )
    :vars
    (
      ?auto_913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_912 ?auto_913 ) ( ON-TABLE ?auto_910 ) ( not ( = ?auto_910 ?auto_911 ) ) ( not ( = ?auto_910 ?auto_912 ) ) ( not ( = ?auto_910 ?auto_913 ) ) ( not ( = ?auto_911 ?auto_912 ) ) ( not ( = ?auto_911 ?auto_913 ) ) ( not ( = ?auto_912 ?auto_913 ) ) ( CLEAR ?auto_910 ) ( ON ?auto_911 ?auto_912 ) ( CLEAR ?auto_911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_910 ?auto_911 )
      ( MAKE-3PILE ?auto_910 ?auto_911 ?auto_912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_917 - BLOCK
      ?auto_918 - BLOCK
      ?auto_919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_919 ) ( ON-TABLE ?auto_917 ) ( not ( = ?auto_917 ?auto_918 ) ) ( not ( = ?auto_917 ?auto_919 ) ) ( not ( = ?auto_918 ?auto_919 ) ) ( CLEAR ?auto_917 ) ( ON ?auto_918 ?auto_919 ) ( CLEAR ?auto_918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_917 ?auto_918 )
      ( MAKE-3PILE ?auto_917 ?auto_918 ?auto_919 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_923 - BLOCK
      ?auto_924 - BLOCK
      ?auto_925 - BLOCK
    )
    :vars
    (
      ?auto_926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_925 ?auto_926 ) ( not ( = ?auto_923 ?auto_924 ) ) ( not ( = ?auto_923 ?auto_925 ) ) ( not ( = ?auto_923 ?auto_926 ) ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_924 ?auto_926 ) ) ( not ( = ?auto_925 ?auto_926 ) ) ( ON ?auto_924 ?auto_925 ) ( ON ?auto_923 ?auto_924 ) ( CLEAR ?auto_923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_923 )
      ( MAKE-3PILE ?auto_923 ?auto_924 ?auto_925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_930 - BLOCK
      ?auto_931 - BLOCK
      ?auto_932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_932 ) ( not ( = ?auto_930 ?auto_931 ) ) ( not ( = ?auto_930 ?auto_932 ) ) ( not ( = ?auto_931 ?auto_932 ) ) ( ON ?auto_931 ?auto_932 ) ( ON ?auto_930 ?auto_931 ) ( CLEAR ?auto_930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_930 )
      ( MAKE-3PILE ?auto_930 ?auto_931 ?auto_932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_936 - BLOCK
      ?auto_937 - BLOCK
      ?auto_938 - BLOCK
    )
    :vars
    (
      ?auto_939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_936 ?auto_937 ) ) ( not ( = ?auto_936 ?auto_938 ) ) ( not ( = ?auto_937 ?auto_938 ) ) ( ON ?auto_936 ?auto_939 ) ( not ( = ?auto_938 ?auto_939 ) ) ( not ( = ?auto_937 ?auto_939 ) ) ( not ( = ?auto_936 ?auto_939 ) ) ( ON ?auto_937 ?auto_936 ) ( ON ?auto_938 ?auto_937 ) ( CLEAR ?auto_938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_938 ?auto_937 ?auto_936 )
      ( MAKE-3PILE ?auto_936 ?auto_937 ?auto_938 ) )
  )

)

