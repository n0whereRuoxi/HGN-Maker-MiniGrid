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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3925 - BLOCK
      ?auto_3926 - BLOCK
      ?auto_3927 - BLOCK
    )
    :vars
    (
      ?auto_3928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3928 ?auto_3927 ) ( CLEAR ?auto_3928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3925 ) ( ON ?auto_3926 ?auto_3925 ) ( ON ?auto_3927 ?auto_3926 ) ( not ( = ?auto_3925 ?auto_3926 ) ) ( not ( = ?auto_3925 ?auto_3927 ) ) ( not ( = ?auto_3925 ?auto_3928 ) ) ( not ( = ?auto_3926 ?auto_3927 ) ) ( not ( = ?auto_3926 ?auto_3928 ) ) ( not ( = ?auto_3927 ?auto_3928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3928 ?auto_3927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3930 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3931 - BLOCK
    )
    :vars
    (
      ?auto_3932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3931 ?auto_3932 ) ( CLEAR ?auto_3931 ) ( HAND-EMPTY ) ( not ( = ?auto_3931 ?auto_3932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3931 ?auto_3932 )
      ( MAKE-1PILE ?auto_3931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3935 - BLOCK
      ?auto_3936 - BLOCK
    )
    :vars
    (
      ?auto_3937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3937 ?auto_3936 ) ( CLEAR ?auto_3937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3935 ) ( ON ?auto_3936 ?auto_3935 ) ( not ( = ?auto_3935 ?auto_3936 ) ) ( not ( = ?auto_3935 ?auto_3937 ) ) ( not ( = ?auto_3936 ?auto_3937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3937 ?auto_3936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3938 - BLOCK
      ?auto_3939 - BLOCK
    )
    :vars
    (
      ?auto_3940 - BLOCK
      ?auto_3941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3940 ?auto_3939 ) ( CLEAR ?auto_3940 ) ( ON-TABLE ?auto_3938 ) ( ON ?auto_3939 ?auto_3938 ) ( not ( = ?auto_3938 ?auto_3939 ) ) ( not ( = ?auto_3938 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( HOLDING ?auto_3941 ) ( not ( = ?auto_3938 ?auto_3941 ) ) ( not ( = ?auto_3939 ?auto_3941 ) ) ( not ( = ?auto_3940 ?auto_3941 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3941 )
      ( MAKE-2PILE ?auto_3938 ?auto_3939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3942 - BLOCK
      ?auto_3943 - BLOCK
    )
    :vars
    (
      ?auto_3944 - BLOCK
      ?auto_3945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3944 ?auto_3943 ) ( ON-TABLE ?auto_3942 ) ( ON ?auto_3943 ?auto_3942 ) ( not ( = ?auto_3942 ?auto_3943 ) ) ( not ( = ?auto_3942 ?auto_3944 ) ) ( not ( = ?auto_3943 ?auto_3944 ) ) ( not ( = ?auto_3942 ?auto_3945 ) ) ( not ( = ?auto_3943 ?auto_3945 ) ) ( not ( = ?auto_3944 ?auto_3945 ) ) ( ON ?auto_3945 ?auto_3944 ) ( CLEAR ?auto_3945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3942 ?auto_3943 ?auto_3944 )
      ( MAKE-2PILE ?auto_3942 ?auto_3943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3948 - BLOCK
      ?auto_3949 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3949 ) ( CLEAR ?auto_3948 ) ( ON-TABLE ?auto_3948 ) ( not ( = ?auto_3948 ?auto_3949 ) ) )
    :subtasks
    ( ( !STACK ?auto_3949 ?auto_3948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3950 - BLOCK
      ?auto_3951 - BLOCK
    )
    :vars
    (
      ?auto_3952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3950 ) ( ON-TABLE ?auto_3950 ) ( not ( = ?auto_3950 ?auto_3951 ) ) ( ON ?auto_3951 ?auto_3952 ) ( CLEAR ?auto_3951 ) ( HAND-EMPTY ) ( not ( = ?auto_3950 ?auto_3952 ) ) ( not ( = ?auto_3951 ?auto_3952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3951 ?auto_3952 )
      ( MAKE-2PILE ?auto_3950 ?auto_3951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3953 - BLOCK
      ?auto_3954 - BLOCK
    )
    :vars
    (
      ?auto_3955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3953 ?auto_3954 ) ) ( ON ?auto_3954 ?auto_3955 ) ( CLEAR ?auto_3954 ) ( not ( = ?auto_3953 ?auto_3955 ) ) ( not ( = ?auto_3954 ?auto_3955 ) ) ( HOLDING ?auto_3953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3953 )
      ( MAKE-2PILE ?auto_3953 ?auto_3954 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3956 - BLOCK
      ?auto_3957 - BLOCK
    )
    :vars
    (
      ?auto_3958 - BLOCK
      ?auto_3959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3956 ?auto_3957 ) ) ( ON ?auto_3957 ?auto_3958 ) ( not ( = ?auto_3956 ?auto_3958 ) ) ( not ( = ?auto_3957 ?auto_3958 ) ) ( ON ?auto_3956 ?auto_3957 ) ( CLEAR ?auto_3956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3959 ) ( ON ?auto_3958 ?auto_3959 ) ( not ( = ?auto_3959 ?auto_3958 ) ) ( not ( = ?auto_3959 ?auto_3957 ) ) ( not ( = ?auto_3959 ?auto_3956 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3959 ?auto_3958 ?auto_3957 )
      ( MAKE-2PILE ?auto_3956 ?auto_3957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3961 - BLOCK
    )
    :vars
    (
      ?auto_3962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3962 ?auto_3961 ) ( CLEAR ?auto_3962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3961 ) ( not ( = ?auto_3961 ?auto_3962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3962 ?auto_3961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3963 - BLOCK
    )
    :vars
    (
      ?auto_3964 - BLOCK
      ?auto_3965 - BLOCK
      ?auto_3966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3964 ?auto_3963 ) ( CLEAR ?auto_3964 ) ( ON-TABLE ?auto_3963 ) ( not ( = ?auto_3963 ?auto_3964 ) ) ( HOLDING ?auto_3965 ) ( CLEAR ?auto_3966 ) ( not ( = ?auto_3963 ?auto_3965 ) ) ( not ( = ?auto_3963 ?auto_3966 ) ) ( not ( = ?auto_3964 ?auto_3965 ) ) ( not ( = ?auto_3964 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3966 ) ) )
    :subtasks
    ( ( !STACK ?auto_3965 ?auto_3966 )
      ( MAKE-1PILE ?auto_3963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4053 - BLOCK
    )
    :vars
    (
      ?auto_4055 - BLOCK
      ?auto_4054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4055 ?auto_4053 ) ( ON-TABLE ?auto_4053 ) ( not ( = ?auto_4053 ?auto_4055 ) ) ( not ( = ?auto_4053 ?auto_4054 ) ) ( not ( = ?auto_4055 ?auto_4054 ) ) ( ON ?auto_4054 ?auto_4055 ) ( CLEAR ?auto_4054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4053 ?auto_4055 )
      ( MAKE-1PILE ?auto_4053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3971 - BLOCK
    )
    :vars
    (
      ?auto_3974 - BLOCK
      ?auto_3973 - BLOCK
      ?auto_3972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3974 ?auto_3971 ) ( ON-TABLE ?auto_3971 ) ( not ( = ?auto_3971 ?auto_3974 ) ) ( not ( = ?auto_3971 ?auto_3973 ) ) ( not ( = ?auto_3971 ?auto_3972 ) ) ( not ( = ?auto_3974 ?auto_3973 ) ) ( not ( = ?auto_3974 ?auto_3972 ) ) ( not ( = ?auto_3973 ?auto_3972 ) ) ( ON ?auto_3973 ?auto_3974 ) ( CLEAR ?auto_3973 ) ( HOLDING ?auto_3972 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3972 )
      ( MAKE-1PILE ?auto_3971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3975 - BLOCK
    )
    :vars
    (
      ?auto_3978 - BLOCK
      ?auto_3977 - BLOCK
      ?auto_3976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3978 ?auto_3975 ) ( ON-TABLE ?auto_3975 ) ( not ( = ?auto_3975 ?auto_3978 ) ) ( not ( = ?auto_3975 ?auto_3977 ) ) ( not ( = ?auto_3975 ?auto_3976 ) ) ( not ( = ?auto_3978 ?auto_3977 ) ) ( not ( = ?auto_3978 ?auto_3976 ) ) ( not ( = ?auto_3977 ?auto_3976 ) ) ( ON ?auto_3977 ?auto_3978 ) ( ON ?auto_3976 ?auto_3977 ) ( CLEAR ?auto_3976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3975 ?auto_3978 ?auto_3977 )
      ( MAKE-1PILE ?auto_3975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3982 - BLOCK
      ?auto_3983 - BLOCK
      ?auto_3984 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3984 ) ( CLEAR ?auto_3983 ) ( ON-TABLE ?auto_3982 ) ( ON ?auto_3983 ?auto_3982 ) ( not ( = ?auto_3982 ?auto_3983 ) ) ( not ( = ?auto_3982 ?auto_3984 ) ) ( not ( = ?auto_3983 ?auto_3984 ) ) )
    :subtasks
    ( ( !STACK ?auto_3984 ?auto_3983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3985 - BLOCK
      ?auto_3986 - BLOCK
      ?auto_3987 - BLOCK
    )
    :vars
    (
      ?auto_3988 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3986 ) ( ON-TABLE ?auto_3985 ) ( ON ?auto_3986 ?auto_3985 ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( not ( = ?auto_3985 ?auto_3987 ) ) ( not ( = ?auto_3986 ?auto_3987 ) ) ( ON ?auto_3987 ?auto_3988 ) ( CLEAR ?auto_3987 ) ( HAND-EMPTY ) ( not ( = ?auto_3985 ?auto_3988 ) ) ( not ( = ?auto_3986 ?auto_3988 ) ) ( not ( = ?auto_3987 ?auto_3988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3987 ?auto_3988 )
      ( MAKE-3PILE ?auto_3985 ?auto_3986 ?auto_3987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3989 - BLOCK
      ?auto_3990 - BLOCK
      ?auto_3991 - BLOCK
    )
    :vars
    (
      ?auto_3992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3989 ) ( not ( = ?auto_3989 ?auto_3990 ) ) ( not ( = ?auto_3989 ?auto_3991 ) ) ( not ( = ?auto_3990 ?auto_3991 ) ) ( ON ?auto_3991 ?auto_3992 ) ( CLEAR ?auto_3991 ) ( not ( = ?auto_3989 ?auto_3992 ) ) ( not ( = ?auto_3990 ?auto_3992 ) ) ( not ( = ?auto_3991 ?auto_3992 ) ) ( HOLDING ?auto_3990 ) ( CLEAR ?auto_3989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3989 ?auto_3990 )
      ( MAKE-3PILE ?auto_3989 ?auto_3990 ?auto_3991 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3993 - BLOCK
      ?auto_3994 - BLOCK
      ?auto_3995 - BLOCK
    )
    :vars
    (
      ?auto_3996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3993 ) ( not ( = ?auto_3993 ?auto_3994 ) ) ( not ( = ?auto_3993 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( ON ?auto_3995 ?auto_3996 ) ( not ( = ?auto_3993 ?auto_3996 ) ) ( not ( = ?auto_3994 ?auto_3996 ) ) ( not ( = ?auto_3995 ?auto_3996 ) ) ( CLEAR ?auto_3993 ) ( ON ?auto_3994 ?auto_3995 ) ( CLEAR ?auto_3994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3996 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3996 ?auto_3995 )
      ( MAKE-3PILE ?auto_3993 ?auto_3994 ?auto_3995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3997 - BLOCK
      ?auto_3998 - BLOCK
      ?auto_3999 - BLOCK
    )
    :vars
    (
      ?auto_4000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_3999 ) ) ( not ( = ?auto_3998 ?auto_3999 ) ) ( ON ?auto_3999 ?auto_4000 ) ( not ( = ?auto_3997 ?auto_4000 ) ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_3999 ?auto_4000 ) ) ( ON ?auto_3998 ?auto_3999 ) ( CLEAR ?auto_3998 ) ( ON-TABLE ?auto_4000 ) ( HOLDING ?auto_3997 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3997 )
      ( MAKE-3PILE ?auto_3997 ?auto_3998 ?auto_3999 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4001 - BLOCK
      ?auto_4002 - BLOCK
      ?auto_4003 - BLOCK
    )
    :vars
    (
      ?auto_4004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4001 ?auto_4002 ) ) ( not ( = ?auto_4001 ?auto_4003 ) ) ( not ( = ?auto_4002 ?auto_4003 ) ) ( ON ?auto_4003 ?auto_4004 ) ( not ( = ?auto_4001 ?auto_4004 ) ) ( not ( = ?auto_4002 ?auto_4004 ) ) ( not ( = ?auto_4003 ?auto_4004 ) ) ( ON ?auto_4002 ?auto_4003 ) ( ON-TABLE ?auto_4004 ) ( ON ?auto_4001 ?auto_4002 ) ( CLEAR ?auto_4001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4004 ?auto_4003 ?auto_4002 )
      ( MAKE-3PILE ?auto_4001 ?auto_4002 ?auto_4003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4031 - BLOCK
    )
    :vars
    (
      ?auto_4032 - BLOCK
      ?auto_4033 - BLOCK
      ?auto_4034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4031 ?auto_4032 ) ( CLEAR ?auto_4031 ) ( not ( = ?auto_4031 ?auto_4032 ) ) ( HOLDING ?auto_4033 ) ( CLEAR ?auto_4034 ) ( not ( = ?auto_4031 ?auto_4033 ) ) ( not ( = ?auto_4031 ?auto_4034 ) ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( not ( = ?auto_4033 ?auto_4034 ) ) )
    :subtasks
    ( ( !STACK ?auto_4033 ?auto_4034 )
      ( MAKE-1PILE ?auto_4031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4035 - BLOCK
    )
    :vars
    (
      ?auto_4037 - BLOCK
      ?auto_4036 - BLOCK
      ?auto_4038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4035 ?auto_4037 ) ( not ( = ?auto_4035 ?auto_4037 ) ) ( CLEAR ?auto_4036 ) ( not ( = ?auto_4035 ?auto_4038 ) ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( not ( = ?auto_4037 ?auto_4036 ) ) ( not ( = ?auto_4038 ?auto_4036 ) ) ( ON ?auto_4038 ?auto_4035 ) ( CLEAR ?auto_4038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4037 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4037 ?auto_4035 )
      ( MAKE-1PILE ?auto_4035 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4039 - BLOCK
    )
    :vars
    (
      ?auto_4042 - BLOCK
      ?auto_4040 - BLOCK
      ?auto_4041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4039 ?auto_4042 ) ( not ( = ?auto_4039 ?auto_4042 ) ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( not ( = ?auto_4039 ?auto_4041 ) ) ( not ( = ?auto_4042 ?auto_4040 ) ) ( not ( = ?auto_4042 ?auto_4041 ) ) ( not ( = ?auto_4040 ?auto_4041 ) ) ( ON ?auto_4040 ?auto_4039 ) ( CLEAR ?auto_4040 ) ( ON-TABLE ?auto_4042 ) ( HOLDING ?auto_4041 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4041 )
      ( MAKE-1PILE ?auto_4039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4043 - BLOCK
    )
    :vars
    (
      ?auto_4044 - BLOCK
      ?auto_4046 - BLOCK
      ?auto_4045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4043 ?auto_4044 ) ( not ( = ?auto_4043 ?auto_4044 ) ) ( not ( = ?auto_4043 ?auto_4046 ) ) ( not ( = ?auto_4043 ?auto_4045 ) ) ( not ( = ?auto_4044 ?auto_4046 ) ) ( not ( = ?auto_4044 ?auto_4045 ) ) ( not ( = ?auto_4046 ?auto_4045 ) ) ( ON ?auto_4046 ?auto_4043 ) ( ON-TABLE ?auto_4044 ) ( ON ?auto_4045 ?auto_4046 ) ( CLEAR ?auto_4045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4044 ?auto_4043 ?auto_4046 )
      ( MAKE-1PILE ?auto_4043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4050 - BLOCK
    )
    :vars
    (
      ?auto_4051 - BLOCK
      ?auto_4052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4051 ?auto_4050 ) ( CLEAR ?auto_4051 ) ( ON-TABLE ?auto_4050 ) ( not ( = ?auto_4050 ?auto_4051 ) ) ( HOLDING ?auto_4052 ) ( not ( = ?auto_4050 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4052 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4052 )
      ( MAKE-1PILE ?auto_4050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4075 - BLOCK
      ?auto_4076 - BLOCK
    )
    :vars
    (
      ?auto_4077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4075 ?auto_4076 ) ) ( ON ?auto_4076 ?auto_4077 ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( ON ?auto_4075 ?auto_4076 ) ( CLEAR ?auto_4075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4077 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4077 ?auto_4076 )
      ( MAKE-2PILE ?auto_4075 ?auto_4076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4080 - BLOCK
      ?auto_4081 - BLOCK
    )
    :vars
    (
      ?auto_4082 - BLOCK
      ?auto_4083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4080 ?auto_4081 ) ) ( ON ?auto_4081 ?auto_4082 ) ( CLEAR ?auto_4081 ) ( not ( = ?auto_4080 ?auto_4082 ) ) ( not ( = ?auto_4081 ?auto_4082 ) ) ( ON ?auto_4080 ?auto_4083 ) ( CLEAR ?auto_4080 ) ( HAND-EMPTY ) ( not ( = ?auto_4080 ?auto_4083 ) ) ( not ( = ?auto_4081 ?auto_4083 ) ) ( not ( = ?auto_4082 ?auto_4083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4080 ?auto_4083 )
      ( MAKE-2PILE ?auto_4080 ?auto_4081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4084 - BLOCK
      ?auto_4085 - BLOCK
    )
    :vars
    (
      ?auto_4086 - BLOCK
      ?auto_4087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4084 ?auto_4085 ) ) ( not ( = ?auto_4084 ?auto_4086 ) ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( ON ?auto_4084 ?auto_4087 ) ( CLEAR ?auto_4084 ) ( not ( = ?auto_4084 ?auto_4087 ) ) ( not ( = ?auto_4085 ?auto_4087 ) ) ( not ( = ?auto_4086 ?auto_4087 ) ) ( HOLDING ?auto_4085 ) ( CLEAR ?auto_4086 ) ( ON-TABLE ?auto_4086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4086 ?auto_4085 )
      ( MAKE-2PILE ?auto_4084 ?auto_4085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4088 - BLOCK
      ?auto_4089 - BLOCK
    )
    :vars
    (
      ?auto_4091 - BLOCK
      ?auto_4090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4088 ?auto_4089 ) ) ( not ( = ?auto_4088 ?auto_4091 ) ) ( not ( = ?auto_4089 ?auto_4091 ) ) ( ON ?auto_4088 ?auto_4090 ) ( not ( = ?auto_4088 ?auto_4090 ) ) ( not ( = ?auto_4089 ?auto_4090 ) ) ( not ( = ?auto_4091 ?auto_4090 ) ) ( CLEAR ?auto_4091 ) ( ON-TABLE ?auto_4091 ) ( ON ?auto_4089 ?auto_4088 ) ( CLEAR ?auto_4089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4090 ?auto_4088 )
      ( MAKE-2PILE ?auto_4088 ?auto_4089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4092 - BLOCK
      ?auto_4093 - BLOCK
    )
    :vars
    (
      ?auto_4095 - BLOCK
      ?auto_4094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4092 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4095 ) ) ( not ( = ?auto_4093 ?auto_4095 ) ) ( ON ?auto_4092 ?auto_4094 ) ( not ( = ?auto_4092 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4095 ?auto_4094 ) ) ( ON ?auto_4093 ?auto_4092 ) ( CLEAR ?auto_4093 ) ( ON-TABLE ?auto_4094 ) ( HOLDING ?auto_4095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4095 )
      ( MAKE-2PILE ?auto_4092 ?auto_4093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4096 - BLOCK
      ?auto_4097 - BLOCK
    )
    :vars
    (
      ?auto_4099 - BLOCK
      ?auto_4098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4096 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4099 ) ) ( not ( = ?auto_4097 ?auto_4099 ) ) ( ON ?auto_4096 ?auto_4098 ) ( not ( = ?auto_4096 ?auto_4098 ) ) ( not ( = ?auto_4097 ?auto_4098 ) ) ( not ( = ?auto_4099 ?auto_4098 ) ) ( ON ?auto_4097 ?auto_4096 ) ( ON-TABLE ?auto_4098 ) ( ON ?auto_4099 ?auto_4097 ) ( CLEAR ?auto_4099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4098 ?auto_4096 ?auto_4097 )
      ( MAKE-2PILE ?auto_4096 ?auto_4097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4106 - BLOCK
      ?auto_4107 - BLOCK
      ?auto_4108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4107 ) ( ON-TABLE ?auto_4106 ) ( ON ?auto_4107 ?auto_4106 ) ( not ( = ?auto_4106 ?auto_4107 ) ) ( not ( = ?auto_4106 ?auto_4108 ) ) ( not ( = ?auto_4107 ?auto_4108 ) ) ( ON-TABLE ?auto_4108 ) ( CLEAR ?auto_4108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4108 )
      ( MAKE-3PILE ?auto_4106 ?auto_4107 ?auto_4108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4109 - BLOCK
      ?auto_4110 - BLOCK
      ?auto_4111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4109 ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4111 ) ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( ON-TABLE ?auto_4111 ) ( CLEAR ?auto_4111 ) ( HOLDING ?auto_4110 ) ( CLEAR ?auto_4109 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4109 ?auto_4110 )
      ( MAKE-3PILE ?auto_4109 ?auto_4110 ?auto_4111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4112 - BLOCK
      ?auto_4113 - BLOCK
      ?auto_4114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4112 ) ( not ( = ?auto_4112 ?auto_4113 ) ) ( not ( = ?auto_4112 ?auto_4114 ) ) ( not ( = ?auto_4113 ?auto_4114 ) ) ( ON-TABLE ?auto_4114 ) ( CLEAR ?auto_4112 ) ( ON ?auto_4113 ?auto_4114 ) ( CLEAR ?auto_4113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4114 )
      ( MAKE-3PILE ?auto_4112 ?auto_4113 ?auto_4114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4115 - BLOCK
      ?auto_4116 - BLOCK
      ?auto_4117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4115 ?auto_4116 ) ) ( not ( = ?auto_4115 ?auto_4117 ) ) ( not ( = ?auto_4116 ?auto_4117 ) ) ( ON-TABLE ?auto_4117 ) ( ON ?auto_4116 ?auto_4117 ) ( CLEAR ?auto_4116 ) ( HOLDING ?auto_4115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4115 )
      ( MAKE-3PILE ?auto_4115 ?auto_4116 ?auto_4117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4118 - BLOCK
      ?auto_4119 - BLOCK
      ?auto_4120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4118 ?auto_4119 ) ) ( not ( = ?auto_4118 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( ON-TABLE ?auto_4120 ) ( ON ?auto_4119 ?auto_4120 ) ( ON ?auto_4118 ?auto_4119 ) ( CLEAR ?auto_4118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4120 ?auto_4119 )
      ( MAKE-3PILE ?auto_4118 ?auto_4119 ?auto_4120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4124 - BLOCK
      ?auto_4125 - BLOCK
      ?auto_4126 - BLOCK
    )
    :vars
    (
      ?auto_4127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4124 ?auto_4125 ) ) ( not ( = ?auto_4124 ?auto_4126 ) ) ( not ( = ?auto_4125 ?auto_4126 ) ) ( ON-TABLE ?auto_4126 ) ( ON ?auto_4125 ?auto_4126 ) ( CLEAR ?auto_4125 ) ( ON ?auto_4124 ?auto_4127 ) ( CLEAR ?auto_4124 ) ( HAND-EMPTY ) ( not ( = ?auto_4124 ?auto_4127 ) ) ( not ( = ?auto_4125 ?auto_4127 ) ) ( not ( = ?auto_4126 ?auto_4127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4124 ?auto_4127 )
      ( MAKE-3PILE ?auto_4124 ?auto_4125 ?auto_4126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4128 - BLOCK
      ?auto_4129 - BLOCK
      ?auto_4130 - BLOCK
    )
    :vars
    (
      ?auto_4131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4128 ?auto_4129 ) ) ( not ( = ?auto_4128 ?auto_4130 ) ) ( not ( = ?auto_4129 ?auto_4130 ) ) ( ON-TABLE ?auto_4130 ) ( ON ?auto_4128 ?auto_4131 ) ( CLEAR ?auto_4128 ) ( not ( = ?auto_4128 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4131 ) ) ( not ( = ?auto_4130 ?auto_4131 ) ) ( HOLDING ?auto_4129 ) ( CLEAR ?auto_4130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4130 ?auto_4129 )
      ( MAKE-3PILE ?auto_4128 ?auto_4129 ?auto_4130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4132 - BLOCK
      ?auto_4133 - BLOCK
      ?auto_4134 - BLOCK
    )
    :vars
    (
      ?auto_4135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4132 ?auto_4133 ) ) ( not ( = ?auto_4132 ?auto_4134 ) ) ( not ( = ?auto_4133 ?auto_4134 ) ) ( ON-TABLE ?auto_4134 ) ( ON ?auto_4132 ?auto_4135 ) ( not ( = ?auto_4132 ?auto_4135 ) ) ( not ( = ?auto_4133 ?auto_4135 ) ) ( not ( = ?auto_4134 ?auto_4135 ) ) ( CLEAR ?auto_4134 ) ( ON ?auto_4133 ?auto_4132 ) ( CLEAR ?auto_4133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4135 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4135 ?auto_4132 )
      ( MAKE-3PILE ?auto_4132 ?auto_4133 ?auto_4134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4136 - BLOCK
      ?auto_4137 - BLOCK
      ?auto_4138 - BLOCK
    )
    :vars
    (
      ?auto_4139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4136 ?auto_4137 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( ON ?auto_4136 ?auto_4139 ) ( not ( = ?auto_4136 ?auto_4139 ) ) ( not ( = ?auto_4137 ?auto_4139 ) ) ( not ( = ?auto_4138 ?auto_4139 ) ) ( ON ?auto_4137 ?auto_4136 ) ( CLEAR ?auto_4137 ) ( ON-TABLE ?auto_4139 ) ( HOLDING ?auto_4138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4138 )
      ( MAKE-3PILE ?auto_4136 ?auto_4137 ?auto_4138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4140 - BLOCK
      ?auto_4141 - BLOCK
      ?auto_4142 - BLOCK
    )
    :vars
    (
      ?auto_4143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4140 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( ON ?auto_4140 ?auto_4143 ) ( not ( = ?auto_4140 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4142 ?auto_4143 ) ) ( ON ?auto_4141 ?auto_4140 ) ( ON-TABLE ?auto_4143 ) ( ON ?auto_4142 ?auto_4141 ) ( CLEAR ?auto_4142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4143 ?auto_4140 ?auto_4141 )
      ( MAKE-3PILE ?auto_4140 ?auto_4141 ?auto_4142 ) )
  )

)

