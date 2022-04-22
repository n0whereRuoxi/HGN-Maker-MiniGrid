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
      ?auto_2891 - BLOCK
    )
    :vars
    (
      ?auto_2892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2891 ?auto_2892 ) ( CLEAR ?auto_2891 ) ( HAND-EMPTY ) ( not ( = ?auto_2891 ?auto_2892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2891 ?auto_2892 )
      ( !PUTDOWN ?auto_2891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2898 - BLOCK
      ?auto_2899 - BLOCK
    )
    :vars
    (
      ?auto_2900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2898 ) ( ON ?auto_2899 ?auto_2900 ) ( CLEAR ?auto_2899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2898 ) ( not ( = ?auto_2898 ?auto_2899 ) ) ( not ( = ?auto_2898 ?auto_2900 ) ) ( not ( = ?auto_2899 ?auto_2900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2899 ?auto_2900 )
      ( !STACK ?auto_2899 ?auto_2898 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2908 - BLOCK
      ?auto_2909 - BLOCK
    )
    :vars
    (
      ?auto_2910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2909 ?auto_2910 ) ( not ( = ?auto_2908 ?auto_2909 ) ) ( not ( = ?auto_2908 ?auto_2910 ) ) ( not ( = ?auto_2909 ?auto_2910 ) ) ( ON ?auto_2908 ?auto_2909 ) ( CLEAR ?auto_2908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2908 )
      ( MAKE-2PILE ?auto_2908 ?auto_2909 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2919 - BLOCK
      ?auto_2920 - BLOCK
      ?auto_2921 - BLOCK
    )
    :vars
    (
      ?auto_2922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2920 ) ( ON ?auto_2921 ?auto_2922 ) ( CLEAR ?auto_2921 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2919 ) ( ON ?auto_2920 ?auto_2919 ) ( not ( = ?auto_2919 ?auto_2920 ) ) ( not ( = ?auto_2919 ?auto_2921 ) ) ( not ( = ?auto_2919 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( not ( = ?auto_2921 ?auto_2922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2921 ?auto_2922 )
      ( !STACK ?auto_2921 ?auto_2920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2933 - BLOCK
      ?auto_2934 - BLOCK
      ?auto_2935 - BLOCK
    )
    :vars
    (
      ?auto_2936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2935 ?auto_2936 ) ( ON-TABLE ?auto_2933 ) ( not ( = ?auto_2933 ?auto_2934 ) ) ( not ( = ?auto_2933 ?auto_2935 ) ) ( not ( = ?auto_2933 ?auto_2936 ) ) ( not ( = ?auto_2934 ?auto_2935 ) ) ( not ( = ?auto_2934 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2936 ) ) ( CLEAR ?auto_2933 ) ( ON ?auto_2934 ?auto_2935 ) ( CLEAR ?auto_2934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2933 ?auto_2934 )
      ( MAKE-3PILE ?auto_2933 ?auto_2934 ?auto_2935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2947 - BLOCK
      ?auto_2948 - BLOCK
      ?auto_2949 - BLOCK
    )
    :vars
    (
      ?auto_2950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2949 ?auto_2950 ) ( not ( = ?auto_2947 ?auto_2948 ) ) ( not ( = ?auto_2947 ?auto_2949 ) ) ( not ( = ?auto_2947 ?auto_2950 ) ) ( not ( = ?auto_2948 ?auto_2949 ) ) ( not ( = ?auto_2948 ?auto_2950 ) ) ( not ( = ?auto_2949 ?auto_2950 ) ) ( ON ?auto_2948 ?auto_2949 ) ( ON ?auto_2947 ?auto_2948 ) ( CLEAR ?auto_2947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2947 )
      ( MAKE-3PILE ?auto_2947 ?auto_2948 ?auto_2949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2962 - BLOCK
      ?auto_2963 - BLOCK
      ?auto_2964 - BLOCK
      ?auto_2965 - BLOCK
    )
    :vars
    (
      ?auto_2966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2964 ) ( ON ?auto_2965 ?auto_2966 ) ( CLEAR ?auto_2965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2962 ) ( ON ?auto_2963 ?auto_2962 ) ( ON ?auto_2964 ?auto_2963 ) ( not ( = ?auto_2962 ?auto_2963 ) ) ( not ( = ?auto_2962 ?auto_2964 ) ) ( not ( = ?auto_2962 ?auto_2965 ) ) ( not ( = ?auto_2962 ?auto_2966 ) ) ( not ( = ?auto_2963 ?auto_2964 ) ) ( not ( = ?auto_2963 ?auto_2965 ) ) ( not ( = ?auto_2963 ?auto_2966 ) ) ( not ( = ?auto_2964 ?auto_2965 ) ) ( not ( = ?auto_2964 ?auto_2966 ) ) ( not ( = ?auto_2965 ?auto_2966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2965 ?auto_2966 )
      ( !STACK ?auto_2965 ?auto_2964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2971 - BLOCK
      ?auto_2972 - BLOCK
      ?auto_2973 - BLOCK
      ?auto_2974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2973 ) ( ON-TABLE ?auto_2974 ) ( CLEAR ?auto_2974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2971 ) ( ON ?auto_2972 ?auto_2971 ) ( ON ?auto_2973 ?auto_2972 ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2973 ) ) ( not ( = ?auto_2971 ?auto_2974 ) ) ( not ( = ?auto_2972 ?auto_2973 ) ) ( not ( = ?auto_2972 ?auto_2974 ) ) ( not ( = ?auto_2973 ?auto_2974 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2974 )
      ( !STACK ?auto_2974 ?auto_2973 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2979 - BLOCK
      ?auto_2980 - BLOCK
      ?auto_2981 - BLOCK
      ?auto_2982 - BLOCK
    )
    :vars
    (
      ?auto_2983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2982 ?auto_2983 ) ( ON-TABLE ?auto_2979 ) ( ON ?auto_2980 ?auto_2979 ) ( not ( = ?auto_2979 ?auto_2980 ) ) ( not ( = ?auto_2979 ?auto_2981 ) ) ( not ( = ?auto_2979 ?auto_2982 ) ) ( not ( = ?auto_2979 ?auto_2983 ) ) ( not ( = ?auto_2980 ?auto_2981 ) ) ( not ( = ?auto_2980 ?auto_2982 ) ) ( not ( = ?auto_2980 ?auto_2983 ) ) ( not ( = ?auto_2981 ?auto_2982 ) ) ( not ( = ?auto_2981 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2983 ) ) ( CLEAR ?auto_2980 ) ( ON ?auto_2981 ?auto_2982 ) ( CLEAR ?auto_2981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2979 ?auto_2980 ?auto_2981 )
      ( MAKE-4PILE ?auto_2979 ?auto_2980 ?auto_2981 ?auto_2982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2988 - BLOCK
      ?auto_2989 - BLOCK
      ?auto_2990 - BLOCK
      ?auto_2991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2991 ) ( ON-TABLE ?auto_2988 ) ( ON ?auto_2989 ?auto_2988 ) ( not ( = ?auto_2988 ?auto_2989 ) ) ( not ( = ?auto_2988 ?auto_2990 ) ) ( not ( = ?auto_2988 ?auto_2991 ) ) ( not ( = ?auto_2989 ?auto_2990 ) ) ( not ( = ?auto_2989 ?auto_2991 ) ) ( not ( = ?auto_2990 ?auto_2991 ) ) ( CLEAR ?auto_2989 ) ( ON ?auto_2990 ?auto_2991 ) ( CLEAR ?auto_2990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2988 ?auto_2989 ?auto_2990 )
      ( MAKE-4PILE ?auto_2988 ?auto_2989 ?auto_2990 ?auto_2991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2996 - BLOCK
      ?auto_2997 - BLOCK
      ?auto_2998 - BLOCK
      ?auto_2999 - BLOCK
    )
    :vars
    (
      ?auto_3000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2999 ?auto_3000 ) ( ON-TABLE ?auto_2996 ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_2998 ) ) ( not ( = ?auto_2996 ?auto_2999 ) ) ( not ( = ?auto_2996 ?auto_3000 ) ) ( not ( = ?auto_2997 ?auto_2998 ) ) ( not ( = ?auto_2997 ?auto_2999 ) ) ( not ( = ?auto_2997 ?auto_3000 ) ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_3000 ) ) ( not ( = ?auto_2999 ?auto_3000 ) ) ( ON ?auto_2998 ?auto_2999 ) ( CLEAR ?auto_2996 ) ( ON ?auto_2997 ?auto_2998 ) ( CLEAR ?auto_2997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2996 ?auto_2997 )
      ( MAKE-4PILE ?auto_2996 ?auto_2997 ?auto_2998 ?auto_2999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3005 - BLOCK
      ?auto_3006 - BLOCK
      ?auto_3007 - BLOCK
      ?auto_3008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3008 ) ( ON-TABLE ?auto_3005 ) ( not ( = ?auto_3005 ?auto_3006 ) ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( not ( = ?auto_3005 ?auto_3008 ) ) ( not ( = ?auto_3006 ?auto_3007 ) ) ( not ( = ?auto_3006 ?auto_3008 ) ) ( not ( = ?auto_3007 ?auto_3008 ) ) ( ON ?auto_3007 ?auto_3008 ) ( CLEAR ?auto_3005 ) ( ON ?auto_3006 ?auto_3007 ) ( CLEAR ?auto_3006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3005 ?auto_3006 )
      ( MAKE-4PILE ?auto_3005 ?auto_3006 ?auto_3007 ?auto_3008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3013 - BLOCK
      ?auto_3014 - BLOCK
      ?auto_3015 - BLOCK
      ?auto_3016 - BLOCK
    )
    :vars
    (
      ?auto_3017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3016 ?auto_3017 ) ( not ( = ?auto_3013 ?auto_3014 ) ) ( not ( = ?auto_3013 ?auto_3015 ) ) ( not ( = ?auto_3013 ?auto_3016 ) ) ( not ( = ?auto_3013 ?auto_3017 ) ) ( not ( = ?auto_3014 ?auto_3015 ) ) ( not ( = ?auto_3014 ?auto_3016 ) ) ( not ( = ?auto_3014 ?auto_3017 ) ) ( not ( = ?auto_3015 ?auto_3016 ) ) ( not ( = ?auto_3015 ?auto_3017 ) ) ( not ( = ?auto_3016 ?auto_3017 ) ) ( ON ?auto_3015 ?auto_3016 ) ( ON ?auto_3014 ?auto_3015 ) ( ON ?auto_3013 ?auto_3014 ) ( CLEAR ?auto_3013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3013 )
      ( MAKE-4PILE ?auto_3013 ?auto_3014 ?auto_3015 ?auto_3016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3022 - BLOCK
      ?auto_3023 - BLOCK
      ?auto_3024 - BLOCK
      ?auto_3025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3025 ) ( not ( = ?auto_3022 ?auto_3023 ) ) ( not ( = ?auto_3022 ?auto_3024 ) ) ( not ( = ?auto_3022 ?auto_3025 ) ) ( not ( = ?auto_3023 ?auto_3024 ) ) ( not ( = ?auto_3023 ?auto_3025 ) ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( ON ?auto_3024 ?auto_3025 ) ( ON ?auto_3023 ?auto_3024 ) ( ON ?auto_3022 ?auto_3023 ) ( CLEAR ?auto_3022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3022 )
      ( MAKE-4PILE ?auto_3022 ?auto_3023 ?auto_3024 ?auto_3025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3030 - BLOCK
      ?auto_3031 - BLOCK
      ?auto_3032 - BLOCK
      ?auto_3033 - BLOCK
    )
    :vars
    (
      ?auto_3034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3030 ?auto_3031 ) ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3030 ?auto_3033 ) ) ( not ( = ?auto_3031 ?auto_3032 ) ) ( not ( = ?auto_3031 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3033 ) ) ( ON ?auto_3030 ?auto_3034 ) ( not ( = ?auto_3033 ?auto_3034 ) ) ( not ( = ?auto_3032 ?auto_3034 ) ) ( not ( = ?auto_3031 ?auto_3034 ) ) ( not ( = ?auto_3030 ?auto_3034 ) ) ( ON ?auto_3031 ?auto_3030 ) ( ON ?auto_3032 ?auto_3031 ) ( ON ?auto_3033 ?auto_3032 ) ( CLEAR ?auto_3033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3033 ?auto_3032 ?auto_3031 ?auto_3030 )
      ( MAKE-4PILE ?auto_3030 ?auto_3031 ?auto_3032 ?auto_3033 ) )
  )

)

