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
      ?auto_3906 - BLOCK
    )
    :vars
    (
      ?auto_3907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3906 ?auto_3907 ) ( CLEAR ?auto_3906 ) ( HAND-EMPTY ) ( not ( = ?auto_3906 ?auto_3907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3906 ?auto_3907 )
      ( !PUTDOWN ?auto_3906 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3913 - BLOCK
      ?auto_3914 - BLOCK
    )
    :vars
    (
      ?auto_3915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3913 ) ( ON ?auto_3914 ?auto_3915 ) ( CLEAR ?auto_3914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3913 ) ( not ( = ?auto_3913 ?auto_3914 ) ) ( not ( = ?auto_3913 ?auto_3915 ) ) ( not ( = ?auto_3914 ?auto_3915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3914 ?auto_3915 )
      ( !STACK ?auto_3914 ?auto_3913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3923 - BLOCK
      ?auto_3924 - BLOCK
    )
    :vars
    (
      ?auto_3925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3924 ?auto_3925 ) ( not ( = ?auto_3923 ?auto_3924 ) ) ( not ( = ?auto_3923 ?auto_3925 ) ) ( not ( = ?auto_3924 ?auto_3925 ) ) ( ON ?auto_3923 ?auto_3924 ) ( CLEAR ?auto_3923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3923 )
      ( MAKE-2PILE ?auto_3923 ?auto_3924 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3934 - BLOCK
      ?auto_3935 - BLOCK
      ?auto_3936 - BLOCK
    )
    :vars
    (
      ?auto_3937 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3935 ) ( ON ?auto_3936 ?auto_3937 ) ( CLEAR ?auto_3936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3934 ) ( ON ?auto_3935 ?auto_3934 ) ( not ( = ?auto_3934 ?auto_3935 ) ) ( not ( = ?auto_3934 ?auto_3936 ) ) ( not ( = ?auto_3934 ?auto_3937 ) ) ( not ( = ?auto_3935 ?auto_3936 ) ) ( not ( = ?auto_3935 ?auto_3937 ) ) ( not ( = ?auto_3936 ?auto_3937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3936 ?auto_3937 )
      ( !STACK ?auto_3936 ?auto_3935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3948 - BLOCK
      ?auto_3949 - BLOCK
      ?auto_3950 - BLOCK
    )
    :vars
    (
      ?auto_3951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3950 ?auto_3951 ) ( ON-TABLE ?auto_3948 ) ( not ( = ?auto_3948 ?auto_3949 ) ) ( not ( = ?auto_3948 ?auto_3950 ) ) ( not ( = ?auto_3948 ?auto_3951 ) ) ( not ( = ?auto_3949 ?auto_3950 ) ) ( not ( = ?auto_3949 ?auto_3951 ) ) ( not ( = ?auto_3950 ?auto_3951 ) ) ( CLEAR ?auto_3948 ) ( ON ?auto_3949 ?auto_3950 ) ( CLEAR ?auto_3949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3948 ?auto_3949 )
      ( MAKE-3PILE ?auto_3948 ?auto_3949 ?auto_3950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3962 - BLOCK
      ?auto_3963 - BLOCK
      ?auto_3964 - BLOCK
    )
    :vars
    (
      ?auto_3965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3964 ?auto_3965 ) ( not ( = ?auto_3962 ?auto_3963 ) ) ( not ( = ?auto_3962 ?auto_3964 ) ) ( not ( = ?auto_3962 ?auto_3965 ) ) ( not ( = ?auto_3963 ?auto_3964 ) ) ( not ( = ?auto_3963 ?auto_3965 ) ) ( not ( = ?auto_3964 ?auto_3965 ) ) ( ON ?auto_3963 ?auto_3964 ) ( ON ?auto_3962 ?auto_3963 ) ( CLEAR ?auto_3962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3962 )
      ( MAKE-3PILE ?auto_3962 ?auto_3963 ?auto_3964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3977 - BLOCK
      ?auto_3978 - BLOCK
      ?auto_3979 - BLOCK
      ?auto_3980 - BLOCK
    )
    :vars
    (
      ?auto_3981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3979 ) ( ON ?auto_3980 ?auto_3981 ) ( CLEAR ?auto_3980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3977 ) ( ON ?auto_3978 ?auto_3977 ) ( ON ?auto_3979 ?auto_3978 ) ( not ( = ?auto_3977 ?auto_3978 ) ) ( not ( = ?auto_3977 ?auto_3979 ) ) ( not ( = ?auto_3977 ?auto_3980 ) ) ( not ( = ?auto_3977 ?auto_3981 ) ) ( not ( = ?auto_3978 ?auto_3979 ) ) ( not ( = ?auto_3978 ?auto_3980 ) ) ( not ( = ?auto_3978 ?auto_3981 ) ) ( not ( = ?auto_3979 ?auto_3980 ) ) ( not ( = ?auto_3979 ?auto_3981 ) ) ( not ( = ?auto_3980 ?auto_3981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3980 ?auto_3981 )
      ( !STACK ?auto_3980 ?auto_3979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3986 - BLOCK
      ?auto_3987 - BLOCK
      ?auto_3988 - BLOCK
      ?auto_3989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3988 ) ( ON-TABLE ?auto_3989 ) ( CLEAR ?auto_3989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3986 ) ( ON ?auto_3987 ?auto_3986 ) ( ON ?auto_3988 ?auto_3987 ) ( not ( = ?auto_3986 ?auto_3987 ) ) ( not ( = ?auto_3986 ?auto_3988 ) ) ( not ( = ?auto_3986 ?auto_3989 ) ) ( not ( = ?auto_3987 ?auto_3988 ) ) ( not ( = ?auto_3987 ?auto_3989 ) ) ( not ( = ?auto_3988 ?auto_3989 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3989 )
      ( !STACK ?auto_3989 ?auto_3988 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3994 - BLOCK
      ?auto_3995 - BLOCK
      ?auto_3996 - BLOCK
      ?auto_3997 - BLOCK
    )
    :vars
    (
      ?auto_3998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3997 ?auto_3998 ) ( ON-TABLE ?auto_3994 ) ( ON ?auto_3995 ?auto_3994 ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3996 ) ) ( not ( = ?auto_3994 ?auto_3997 ) ) ( not ( = ?auto_3994 ?auto_3998 ) ) ( not ( = ?auto_3995 ?auto_3996 ) ) ( not ( = ?auto_3995 ?auto_3997 ) ) ( not ( = ?auto_3995 ?auto_3998 ) ) ( not ( = ?auto_3996 ?auto_3997 ) ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( CLEAR ?auto_3995 ) ( ON ?auto_3996 ?auto_3997 ) ( CLEAR ?auto_3996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3994 ?auto_3995 ?auto_3996 )
      ( MAKE-4PILE ?auto_3994 ?auto_3995 ?auto_3996 ?auto_3997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4003 - BLOCK
      ?auto_4004 - BLOCK
      ?auto_4005 - BLOCK
      ?auto_4006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4006 ) ( ON-TABLE ?auto_4003 ) ( ON ?auto_4004 ?auto_4003 ) ( not ( = ?auto_4003 ?auto_4004 ) ) ( not ( = ?auto_4003 ?auto_4005 ) ) ( not ( = ?auto_4003 ?auto_4006 ) ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_4004 ?auto_4006 ) ) ( not ( = ?auto_4005 ?auto_4006 ) ) ( CLEAR ?auto_4004 ) ( ON ?auto_4005 ?auto_4006 ) ( CLEAR ?auto_4005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4003 ?auto_4004 ?auto_4005 )
      ( MAKE-4PILE ?auto_4003 ?auto_4004 ?auto_4005 ?auto_4006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4011 - BLOCK
      ?auto_4012 - BLOCK
      ?auto_4013 - BLOCK
      ?auto_4014 - BLOCK
    )
    :vars
    (
      ?auto_4015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4014 ?auto_4015 ) ( ON-TABLE ?auto_4011 ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( not ( = ?auto_4011 ?auto_4014 ) ) ( not ( = ?auto_4011 ?auto_4015 ) ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( not ( = ?auto_4012 ?auto_4014 ) ) ( not ( = ?auto_4012 ?auto_4015 ) ) ( not ( = ?auto_4013 ?auto_4014 ) ) ( not ( = ?auto_4013 ?auto_4015 ) ) ( not ( = ?auto_4014 ?auto_4015 ) ) ( ON ?auto_4013 ?auto_4014 ) ( CLEAR ?auto_4011 ) ( ON ?auto_4012 ?auto_4013 ) ( CLEAR ?auto_4012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4011 ?auto_4012 )
      ( MAKE-4PILE ?auto_4011 ?auto_4012 ?auto_4013 ?auto_4014 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4020 - BLOCK
      ?auto_4021 - BLOCK
      ?auto_4022 - BLOCK
      ?auto_4023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4023 ) ( ON-TABLE ?auto_4020 ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( not ( = ?auto_4020 ?auto_4022 ) ) ( not ( = ?auto_4020 ?auto_4023 ) ) ( not ( = ?auto_4021 ?auto_4022 ) ) ( not ( = ?auto_4021 ?auto_4023 ) ) ( not ( = ?auto_4022 ?auto_4023 ) ) ( ON ?auto_4022 ?auto_4023 ) ( CLEAR ?auto_4020 ) ( ON ?auto_4021 ?auto_4022 ) ( CLEAR ?auto_4021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4020 ?auto_4021 )
      ( MAKE-4PILE ?auto_4020 ?auto_4021 ?auto_4022 ?auto_4023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4028 - BLOCK
      ?auto_4029 - BLOCK
      ?auto_4030 - BLOCK
      ?auto_4031 - BLOCK
    )
    :vars
    (
      ?auto_4032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4031 ?auto_4032 ) ( not ( = ?auto_4028 ?auto_4029 ) ) ( not ( = ?auto_4028 ?auto_4030 ) ) ( not ( = ?auto_4028 ?auto_4031 ) ) ( not ( = ?auto_4028 ?auto_4032 ) ) ( not ( = ?auto_4029 ?auto_4030 ) ) ( not ( = ?auto_4029 ?auto_4031 ) ) ( not ( = ?auto_4029 ?auto_4032 ) ) ( not ( = ?auto_4030 ?auto_4031 ) ) ( not ( = ?auto_4030 ?auto_4032 ) ) ( not ( = ?auto_4031 ?auto_4032 ) ) ( ON ?auto_4030 ?auto_4031 ) ( ON ?auto_4029 ?auto_4030 ) ( ON ?auto_4028 ?auto_4029 ) ( CLEAR ?auto_4028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4028 )
      ( MAKE-4PILE ?auto_4028 ?auto_4029 ?auto_4030 ?auto_4031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4037 - BLOCK
      ?auto_4038 - BLOCK
      ?auto_4039 - BLOCK
      ?auto_4040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4040 ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( not ( = ?auto_4037 ?auto_4039 ) ) ( not ( = ?auto_4037 ?auto_4040 ) ) ( not ( = ?auto_4038 ?auto_4039 ) ) ( not ( = ?auto_4038 ?auto_4040 ) ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( ON ?auto_4039 ?auto_4040 ) ( ON ?auto_4038 ?auto_4039 ) ( ON ?auto_4037 ?auto_4038 ) ( CLEAR ?auto_4037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4037 )
      ( MAKE-4PILE ?auto_4037 ?auto_4038 ?auto_4039 ?auto_4040 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4045 - BLOCK
      ?auto_4046 - BLOCK
      ?auto_4047 - BLOCK
      ?auto_4048 - BLOCK
    )
    :vars
    (
      ?auto_4049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4045 ?auto_4046 ) ) ( not ( = ?auto_4045 ?auto_4047 ) ) ( not ( = ?auto_4045 ?auto_4048 ) ) ( not ( = ?auto_4046 ?auto_4047 ) ) ( not ( = ?auto_4046 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( ON ?auto_4045 ?auto_4049 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4045 ?auto_4049 ) ) ( ON ?auto_4046 ?auto_4045 ) ( ON ?auto_4047 ?auto_4046 ) ( ON ?auto_4048 ?auto_4047 ) ( CLEAR ?auto_4048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4048 ?auto_4047 ?auto_4046 ?auto_4045 )
      ( MAKE-4PILE ?auto_4045 ?auto_4046 ?auto_4047 ?auto_4048 ) )
  )

)

