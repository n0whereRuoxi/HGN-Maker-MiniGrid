( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3960 - SURFACE
      ?auto_3961 - SURFACE
    )
    :vars
    (
      ?auto_3962 - HOIST
      ?auto_3963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3962 ?auto_3963 ) ( SURFACE-AT ?auto_3960 ?auto_3963 ) ( CLEAR ?auto_3960 ) ( LIFTING ?auto_3962 ?auto_3961 ) ( IS-CRATE ?auto_3961 ) ( not ( = ?auto_3960 ?auto_3961 ) ) )
    :subtasks
    ( ( !DROP ?auto_3962 ?auto_3961 ?auto_3960 ?auto_3963 )
      ( MAKE-1CRATE-VERIFY ?auto_3960 ?auto_3961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3964 - SURFACE
      ?auto_3965 - SURFACE
    )
    :vars
    (
      ?auto_3967 - HOIST
      ?auto_3966 - PLACE
      ?auto_3968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3967 ?auto_3966 ) ( SURFACE-AT ?auto_3964 ?auto_3966 ) ( CLEAR ?auto_3964 ) ( IS-CRATE ?auto_3965 ) ( not ( = ?auto_3964 ?auto_3965 ) ) ( TRUCK-AT ?auto_3968 ?auto_3966 ) ( AVAILABLE ?auto_3967 ) ( IN ?auto_3965 ?auto_3968 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3967 ?auto_3965 ?auto_3968 ?auto_3966 )
      ( MAKE-1CRATE ?auto_3964 ?auto_3965 )
      ( MAKE-1CRATE-VERIFY ?auto_3964 ?auto_3965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3969 - SURFACE
      ?auto_3970 - SURFACE
    )
    :vars
    (
      ?auto_3972 - HOIST
      ?auto_3971 - PLACE
      ?auto_3973 - TRUCK
      ?auto_3974 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3972 ?auto_3971 ) ( SURFACE-AT ?auto_3969 ?auto_3971 ) ( CLEAR ?auto_3969 ) ( IS-CRATE ?auto_3970 ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( AVAILABLE ?auto_3972 ) ( IN ?auto_3970 ?auto_3973 ) ( TRUCK-AT ?auto_3973 ?auto_3974 ) ( not ( = ?auto_3974 ?auto_3971 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3973 ?auto_3974 ?auto_3971 )
      ( MAKE-1CRATE ?auto_3969 ?auto_3970 )
      ( MAKE-1CRATE-VERIFY ?auto_3969 ?auto_3970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3975 - SURFACE
      ?auto_3976 - SURFACE
    )
    :vars
    (
      ?auto_3977 - HOIST
      ?auto_3978 - PLACE
      ?auto_3979 - TRUCK
      ?auto_3980 - PLACE
      ?auto_3981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3977 ?auto_3978 ) ( SURFACE-AT ?auto_3975 ?auto_3978 ) ( CLEAR ?auto_3975 ) ( IS-CRATE ?auto_3976 ) ( not ( = ?auto_3975 ?auto_3976 ) ) ( AVAILABLE ?auto_3977 ) ( TRUCK-AT ?auto_3979 ?auto_3980 ) ( not ( = ?auto_3980 ?auto_3978 ) ) ( HOIST-AT ?auto_3981 ?auto_3980 ) ( LIFTING ?auto_3981 ?auto_3976 ) ( not ( = ?auto_3977 ?auto_3981 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3981 ?auto_3976 ?auto_3979 ?auto_3980 )
      ( MAKE-1CRATE ?auto_3975 ?auto_3976 )
      ( MAKE-1CRATE-VERIFY ?auto_3975 ?auto_3976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3982 - SURFACE
      ?auto_3983 - SURFACE
    )
    :vars
    (
      ?auto_3985 - HOIST
      ?auto_3984 - PLACE
      ?auto_3988 - TRUCK
      ?auto_3987 - PLACE
      ?auto_3986 - HOIST
      ?auto_3989 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3985 ?auto_3984 ) ( SURFACE-AT ?auto_3982 ?auto_3984 ) ( CLEAR ?auto_3982 ) ( IS-CRATE ?auto_3983 ) ( not ( = ?auto_3982 ?auto_3983 ) ) ( AVAILABLE ?auto_3985 ) ( TRUCK-AT ?auto_3988 ?auto_3987 ) ( not ( = ?auto_3987 ?auto_3984 ) ) ( HOIST-AT ?auto_3986 ?auto_3987 ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( AVAILABLE ?auto_3986 ) ( SURFACE-AT ?auto_3983 ?auto_3987 ) ( ON ?auto_3983 ?auto_3989 ) ( CLEAR ?auto_3983 ) ( not ( = ?auto_3982 ?auto_3989 ) ) ( not ( = ?auto_3983 ?auto_3989 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3986 ?auto_3983 ?auto_3989 ?auto_3987 )
      ( MAKE-1CRATE ?auto_3982 ?auto_3983 )
      ( MAKE-1CRATE-VERIFY ?auto_3982 ?auto_3983 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3990 - SURFACE
      ?auto_3991 - SURFACE
    )
    :vars
    (
      ?auto_3992 - HOIST
      ?auto_3996 - PLACE
      ?auto_3993 - PLACE
      ?auto_3994 - HOIST
      ?auto_3995 - SURFACE
      ?auto_3997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3992 ?auto_3996 ) ( SURFACE-AT ?auto_3990 ?auto_3996 ) ( CLEAR ?auto_3990 ) ( IS-CRATE ?auto_3991 ) ( not ( = ?auto_3990 ?auto_3991 ) ) ( AVAILABLE ?auto_3992 ) ( not ( = ?auto_3993 ?auto_3996 ) ) ( HOIST-AT ?auto_3994 ?auto_3993 ) ( not ( = ?auto_3992 ?auto_3994 ) ) ( AVAILABLE ?auto_3994 ) ( SURFACE-AT ?auto_3991 ?auto_3993 ) ( ON ?auto_3991 ?auto_3995 ) ( CLEAR ?auto_3991 ) ( not ( = ?auto_3990 ?auto_3995 ) ) ( not ( = ?auto_3991 ?auto_3995 ) ) ( TRUCK-AT ?auto_3997 ?auto_3996 ) )
    :subtasks
    ( ( !DRIVE ?auto_3997 ?auto_3996 ?auto_3993 )
      ( MAKE-1CRATE ?auto_3990 ?auto_3991 )
      ( MAKE-1CRATE-VERIFY ?auto_3990 ?auto_3991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4007 - SURFACE
      ?auto_4008 - SURFACE
      ?auto_4009 - SURFACE
    )
    :vars
    (
      ?auto_4011 - HOIST
      ?auto_4010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4011 ?auto_4010 ) ( SURFACE-AT ?auto_4008 ?auto_4010 ) ( CLEAR ?auto_4008 ) ( LIFTING ?auto_4011 ?auto_4009 ) ( IS-CRATE ?auto_4009 ) ( not ( = ?auto_4008 ?auto_4009 ) ) ( ON ?auto_4008 ?auto_4007 ) ( not ( = ?auto_4007 ?auto_4008 ) ) ( not ( = ?auto_4007 ?auto_4009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4008 ?auto_4009 )
      ( MAKE-2CRATE-VERIFY ?auto_4007 ?auto_4008 ?auto_4009 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4017 - SURFACE
      ?auto_4018 - SURFACE
      ?auto_4019 - SURFACE
    )
    :vars
    (
      ?auto_4021 - HOIST
      ?auto_4020 - PLACE
      ?auto_4022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4021 ?auto_4020 ) ( SURFACE-AT ?auto_4018 ?auto_4020 ) ( CLEAR ?auto_4018 ) ( IS-CRATE ?auto_4019 ) ( not ( = ?auto_4018 ?auto_4019 ) ) ( TRUCK-AT ?auto_4022 ?auto_4020 ) ( AVAILABLE ?auto_4021 ) ( IN ?auto_4019 ?auto_4022 ) ( ON ?auto_4018 ?auto_4017 ) ( not ( = ?auto_4017 ?auto_4018 ) ) ( not ( = ?auto_4017 ?auto_4019 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4018 ?auto_4019 )
      ( MAKE-2CRATE-VERIFY ?auto_4017 ?auto_4018 ?auto_4019 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4023 - SURFACE
      ?auto_4024 - SURFACE
    )
    :vars
    (
      ?auto_4025 - HOIST
      ?auto_4027 - PLACE
      ?auto_4026 - TRUCK
      ?auto_4028 - SURFACE
      ?auto_4029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4025 ?auto_4027 ) ( SURFACE-AT ?auto_4023 ?auto_4027 ) ( CLEAR ?auto_4023 ) ( IS-CRATE ?auto_4024 ) ( not ( = ?auto_4023 ?auto_4024 ) ) ( AVAILABLE ?auto_4025 ) ( IN ?auto_4024 ?auto_4026 ) ( ON ?auto_4023 ?auto_4028 ) ( not ( = ?auto_4028 ?auto_4023 ) ) ( not ( = ?auto_4028 ?auto_4024 ) ) ( TRUCK-AT ?auto_4026 ?auto_4029 ) ( not ( = ?auto_4029 ?auto_4027 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4026 ?auto_4029 ?auto_4027 )
      ( MAKE-2CRATE ?auto_4028 ?auto_4023 ?auto_4024 )
      ( MAKE-1CRATE-VERIFY ?auto_4023 ?auto_4024 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4030 - SURFACE
      ?auto_4031 - SURFACE
      ?auto_4032 - SURFACE
    )
    :vars
    (
      ?auto_4036 - HOIST
      ?auto_4035 - PLACE
      ?auto_4033 - TRUCK
      ?auto_4034 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4036 ?auto_4035 ) ( SURFACE-AT ?auto_4031 ?auto_4035 ) ( CLEAR ?auto_4031 ) ( IS-CRATE ?auto_4032 ) ( not ( = ?auto_4031 ?auto_4032 ) ) ( AVAILABLE ?auto_4036 ) ( IN ?auto_4032 ?auto_4033 ) ( ON ?auto_4031 ?auto_4030 ) ( not ( = ?auto_4030 ?auto_4031 ) ) ( not ( = ?auto_4030 ?auto_4032 ) ) ( TRUCK-AT ?auto_4033 ?auto_4034 ) ( not ( = ?auto_4034 ?auto_4035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4031 ?auto_4032 )
      ( MAKE-2CRATE-VERIFY ?auto_4030 ?auto_4031 ?auto_4032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4037 - SURFACE
      ?auto_4038 - SURFACE
    )
    :vars
    (
      ?auto_4042 - HOIST
      ?auto_4043 - PLACE
      ?auto_4040 - SURFACE
      ?auto_4041 - TRUCK
      ?auto_4039 - PLACE
      ?auto_4044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4042 ?auto_4043 ) ( SURFACE-AT ?auto_4037 ?auto_4043 ) ( CLEAR ?auto_4037 ) ( IS-CRATE ?auto_4038 ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( AVAILABLE ?auto_4042 ) ( ON ?auto_4037 ?auto_4040 ) ( not ( = ?auto_4040 ?auto_4037 ) ) ( not ( = ?auto_4040 ?auto_4038 ) ) ( TRUCK-AT ?auto_4041 ?auto_4039 ) ( not ( = ?auto_4039 ?auto_4043 ) ) ( HOIST-AT ?auto_4044 ?auto_4039 ) ( LIFTING ?auto_4044 ?auto_4038 ) ( not ( = ?auto_4042 ?auto_4044 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4044 ?auto_4038 ?auto_4041 ?auto_4039 )
      ( MAKE-2CRATE ?auto_4040 ?auto_4037 ?auto_4038 )
      ( MAKE-1CRATE-VERIFY ?auto_4037 ?auto_4038 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4045 - SURFACE
      ?auto_4046 - SURFACE
      ?auto_4047 - SURFACE
    )
    :vars
    (
      ?auto_4051 - HOIST
      ?auto_4052 - PLACE
      ?auto_4048 - TRUCK
      ?auto_4050 - PLACE
      ?auto_4049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4051 ?auto_4052 ) ( SURFACE-AT ?auto_4046 ?auto_4052 ) ( CLEAR ?auto_4046 ) ( IS-CRATE ?auto_4047 ) ( not ( = ?auto_4046 ?auto_4047 ) ) ( AVAILABLE ?auto_4051 ) ( ON ?auto_4046 ?auto_4045 ) ( not ( = ?auto_4045 ?auto_4046 ) ) ( not ( = ?auto_4045 ?auto_4047 ) ) ( TRUCK-AT ?auto_4048 ?auto_4050 ) ( not ( = ?auto_4050 ?auto_4052 ) ) ( HOIST-AT ?auto_4049 ?auto_4050 ) ( LIFTING ?auto_4049 ?auto_4047 ) ( not ( = ?auto_4051 ?auto_4049 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4046 ?auto_4047 )
      ( MAKE-2CRATE-VERIFY ?auto_4045 ?auto_4046 ?auto_4047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4053 - SURFACE
      ?auto_4054 - SURFACE
    )
    :vars
    (
      ?auto_4058 - HOIST
      ?auto_4056 - PLACE
      ?auto_4055 - SURFACE
      ?auto_4060 - TRUCK
      ?auto_4057 - PLACE
      ?auto_4059 - HOIST
      ?auto_4061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4058 ?auto_4056 ) ( SURFACE-AT ?auto_4053 ?auto_4056 ) ( CLEAR ?auto_4053 ) ( IS-CRATE ?auto_4054 ) ( not ( = ?auto_4053 ?auto_4054 ) ) ( AVAILABLE ?auto_4058 ) ( ON ?auto_4053 ?auto_4055 ) ( not ( = ?auto_4055 ?auto_4053 ) ) ( not ( = ?auto_4055 ?auto_4054 ) ) ( TRUCK-AT ?auto_4060 ?auto_4057 ) ( not ( = ?auto_4057 ?auto_4056 ) ) ( HOIST-AT ?auto_4059 ?auto_4057 ) ( not ( = ?auto_4058 ?auto_4059 ) ) ( AVAILABLE ?auto_4059 ) ( SURFACE-AT ?auto_4054 ?auto_4057 ) ( ON ?auto_4054 ?auto_4061 ) ( CLEAR ?auto_4054 ) ( not ( = ?auto_4053 ?auto_4061 ) ) ( not ( = ?auto_4054 ?auto_4061 ) ) ( not ( = ?auto_4055 ?auto_4061 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4059 ?auto_4054 ?auto_4061 ?auto_4057 )
      ( MAKE-2CRATE ?auto_4055 ?auto_4053 ?auto_4054 )
      ( MAKE-1CRATE-VERIFY ?auto_4053 ?auto_4054 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4062 - SURFACE
      ?auto_4063 - SURFACE
      ?auto_4064 - SURFACE
    )
    :vars
    (
      ?auto_4067 - HOIST
      ?auto_4069 - PLACE
      ?auto_4066 - TRUCK
      ?auto_4068 - PLACE
      ?auto_4070 - HOIST
      ?auto_4065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4067 ?auto_4069 ) ( SURFACE-AT ?auto_4063 ?auto_4069 ) ( CLEAR ?auto_4063 ) ( IS-CRATE ?auto_4064 ) ( not ( = ?auto_4063 ?auto_4064 ) ) ( AVAILABLE ?auto_4067 ) ( ON ?auto_4063 ?auto_4062 ) ( not ( = ?auto_4062 ?auto_4063 ) ) ( not ( = ?auto_4062 ?auto_4064 ) ) ( TRUCK-AT ?auto_4066 ?auto_4068 ) ( not ( = ?auto_4068 ?auto_4069 ) ) ( HOIST-AT ?auto_4070 ?auto_4068 ) ( not ( = ?auto_4067 ?auto_4070 ) ) ( AVAILABLE ?auto_4070 ) ( SURFACE-AT ?auto_4064 ?auto_4068 ) ( ON ?auto_4064 ?auto_4065 ) ( CLEAR ?auto_4064 ) ( not ( = ?auto_4063 ?auto_4065 ) ) ( not ( = ?auto_4064 ?auto_4065 ) ) ( not ( = ?auto_4062 ?auto_4065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4063 ?auto_4064 )
      ( MAKE-2CRATE-VERIFY ?auto_4062 ?auto_4063 ?auto_4064 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4071 - SURFACE
      ?auto_4072 - SURFACE
    )
    :vars
    (
      ?auto_4078 - HOIST
      ?auto_4073 - PLACE
      ?auto_4079 - SURFACE
      ?auto_4075 - PLACE
      ?auto_4074 - HOIST
      ?auto_4077 - SURFACE
      ?auto_4076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4078 ?auto_4073 ) ( SURFACE-AT ?auto_4071 ?auto_4073 ) ( CLEAR ?auto_4071 ) ( IS-CRATE ?auto_4072 ) ( not ( = ?auto_4071 ?auto_4072 ) ) ( AVAILABLE ?auto_4078 ) ( ON ?auto_4071 ?auto_4079 ) ( not ( = ?auto_4079 ?auto_4071 ) ) ( not ( = ?auto_4079 ?auto_4072 ) ) ( not ( = ?auto_4075 ?auto_4073 ) ) ( HOIST-AT ?auto_4074 ?auto_4075 ) ( not ( = ?auto_4078 ?auto_4074 ) ) ( AVAILABLE ?auto_4074 ) ( SURFACE-AT ?auto_4072 ?auto_4075 ) ( ON ?auto_4072 ?auto_4077 ) ( CLEAR ?auto_4072 ) ( not ( = ?auto_4071 ?auto_4077 ) ) ( not ( = ?auto_4072 ?auto_4077 ) ) ( not ( = ?auto_4079 ?auto_4077 ) ) ( TRUCK-AT ?auto_4076 ?auto_4073 ) )
    :subtasks
    ( ( !DRIVE ?auto_4076 ?auto_4073 ?auto_4075 )
      ( MAKE-2CRATE ?auto_4079 ?auto_4071 ?auto_4072 )
      ( MAKE-1CRATE-VERIFY ?auto_4071 ?auto_4072 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4080 - SURFACE
      ?auto_4081 - SURFACE
      ?auto_4082 - SURFACE
    )
    :vars
    (
      ?auto_4084 - HOIST
      ?auto_4087 - PLACE
      ?auto_4083 - PLACE
      ?auto_4086 - HOIST
      ?auto_4088 - SURFACE
      ?auto_4085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4084 ?auto_4087 ) ( SURFACE-AT ?auto_4081 ?auto_4087 ) ( CLEAR ?auto_4081 ) ( IS-CRATE ?auto_4082 ) ( not ( = ?auto_4081 ?auto_4082 ) ) ( AVAILABLE ?auto_4084 ) ( ON ?auto_4081 ?auto_4080 ) ( not ( = ?auto_4080 ?auto_4081 ) ) ( not ( = ?auto_4080 ?auto_4082 ) ) ( not ( = ?auto_4083 ?auto_4087 ) ) ( HOIST-AT ?auto_4086 ?auto_4083 ) ( not ( = ?auto_4084 ?auto_4086 ) ) ( AVAILABLE ?auto_4086 ) ( SURFACE-AT ?auto_4082 ?auto_4083 ) ( ON ?auto_4082 ?auto_4088 ) ( CLEAR ?auto_4082 ) ( not ( = ?auto_4081 ?auto_4088 ) ) ( not ( = ?auto_4082 ?auto_4088 ) ) ( not ( = ?auto_4080 ?auto_4088 ) ) ( TRUCK-AT ?auto_4085 ?auto_4087 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4081 ?auto_4082 )
      ( MAKE-2CRATE-VERIFY ?auto_4080 ?auto_4081 ?auto_4082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4089 - SURFACE
      ?auto_4090 - SURFACE
    )
    :vars
    (
      ?auto_4092 - HOIST
      ?auto_4091 - PLACE
      ?auto_4096 - SURFACE
      ?auto_4095 - PLACE
      ?auto_4097 - HOIST
      ?auto_4093 - SURFACE
      ?auto_4094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4092 ?auto_4091 ) ( IS-CRATE ?auto_4090 ) ( not ( = ?auto_4089 ?auto_4090 ) ) ( not ( = ?auto_4096 ?auto_4089 ) ) ( not ( = ?auto_4096 ?auto_4090 ) ) ( not ( = ?auto_4095 ?auto_4091 ) ) ( HOIST-AT ?auto_4097 ?auto_4095 ) ( not ( = ?auto_4092 ?auto_4097 ) ) ( AVAILABLE ?auto_4097 ) ( SURFACE-AT ?auto_4090 ?auto_4095 ) ( ON ?auto_4090 ?auto_4093 ) ( CLEAR ?auto_4090 ) ( not ( = ?auto_4089 ?auto_4093 ) ) ( not ( = ?auto_4090 ?auto_4093 ) ) ( not ( = ?auto_4096 ?auto_4093 ) ) ( TRUCK-AT ?auto_4094 ?auto_4091 ) ( SURFACE-AT ?auto_4096 ?auto_4091 ) ( CLEAR ?auto_4096 ) ( LIFTING ?auto_4092 ?auto_4089 ) ( IS-CRATE ?auto_4089 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4096 ?auto_4089 )
      ( MAKE-2CRATE ?auto_4096 ?auto_4089 ?auto_4090 )
      ( MAKE-1CRATE-VERIFY ?auto_4089 ?auto_4090 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4098 - SURFACE
      ?auto_4099 - SURFACE
      ?auto_4100 - SURFACE
    )
    :vars
    (
      ?auto_4102 - HOIST
      ?auto_4103 - PLACE
      ?auto_4101 - PLACE
      ?auto_4106 - HOIST
      ?auto_4104 - SURFACE
      ?auto_4105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4102 ?auto_4103 ) ( IS-CRATE ?auto_4100 ) ( not ( = ?auto_4099 ?auto_4100 ) ) ( not ( = ?auto_4098 ?auto_4099 ) ) ( not ( = ?auto_4098 ?auto_4100 ) ) ( not ( = ?auto_4101 ?auto_4103 ) ) ( HOIST-AT ?auto_4106 ?auto_4101 ) ( not ( = ?auto_4102 ?auto_4106 ) ) ( AVAILABLE ?auto_4106 ) ( SURFACE-AT ?auto_4100 ?auto_4101 ) ( ON ?auto_4100 ?auto_4104 ) ( CLEAR ?auto_4100 ) ( not ( = ?auto_4099 ?auto_4104 ) ) ( not ( = ?auto_4100 ?auto_4104 ) ) ( not ( = ?auto_4098 ?auto_4104 ) ) ( TRUCK-AT ?auto_4105 ?auto_4103 ) ( SURFACE-AT ?auto_4098 ?auto_4103 ) ( CLEAR ?auto_4098 ) ( LIFTING ?auto_4102 ?auto_4099 ) ( IS-CRATE ?auto_4099 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4099 ?auto_4100 )
      ( MAKE-2CRATE-VERIFY ?auto_4098 ?auto_4099 ?auto_4100 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4107 - SURFACE
      ?auto_4108 - SURFACE
    )
    :vars
    (
      ?auto_4114 - HOIST
      ?auto_4115 - PLACE
      ?auto_4110 - SURFACE
      ?auto_4109 - PLACE
      ?auto_4112 - HOIST
      ?auto_4113 - SURFACE
      ?auto_4111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4114 ?auto_4115 ) ( IS-CRATE ?auto_4108 ) ( not ( = ?auto_4107 ?auto_4108 ) ) ( not ( = ?auto_4110 ?auto_4107 ) ) ( not ( = ?auto_4110 ?auto_4108 ) ) ( not ( = ?auto_4109 ?auto_4115 ) ) ( HOIST-AT ?auto_4112 ?auto_4109 ) ( not ( = ?auto_4114 ?auto_4112 ) ) ( AVAILABLE ?auto_4112 ) ( SURFACE-AT ?auto_4108 ?auto_4109 ) ( ON ?auto_4108 ?auto_4113 ) ( CLEAR ?auto_4108 ) ( not ( = ?auto_4107 ?auto_4113 ) ) ( not ( = ?auto_4108 ?auto_4113 ) ) ( not ( = ?auto_4110 ?auto_4113 ) ) ( TRUCK-AT ?auto_4111 ?auto_4115 ) ( SURFACE-AT ?auto_4110 ?auto_4115 ) ( CLEAR ?auto_4110 ) ( IS-CRATE ?auto_4107 ) ( AVAILABLE ?auto_4114 ) ( IN ?auto_4107 ?auto_4111 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4114 ?auto_4107 ?auto_4111 ?auto_4115 )
      ( MAKE-2CRATE ?auto_4110 ?auto_4107 ?auto_4108 )
      ( MAKE-1CRATE-VERIFY ?auto_4107 ?auto_4108 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4116 - SURFACE
      ?auto_4117 - SURFACE
      ?auto_4118 - SURFACE
    )
    :vars
    (
      ?auto_4122 - HOIST
      ?auto_4123 - PLACE
      ?auto_4119 - PLACE
      ?auto_4121 - HOIST
      ?auto_4124 - SURFACE
      ?auto_4120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4122 ?auto_4123 ) ( IS-CRATE ?auto_4118 ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( not ( = ?auto_4116 ?auto_4117 ) ) ( not ( = ?auto_4116 ?auto_4118 ) ) ( not ( = ?auto_4119 ?auto_4123 ) ) ( HOIST-AT ?auto_4121 ?auto_4119 ) ( not ( = ?auto_4122 ?auto_4121 ) ) ( AVAILABLE ?auto_4121 ) ( SURFACE-AT ?auto_4118 ?auto_4119 ) ( ON ?auto_4118 ?auto_4124 ) ( CLEAR ?auto_4118 ) ( not ( = ?auto_4117 ?auto_4124 ) ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4116 ?auto_4124 ) ) ( TRUCK-AT ?auto_4120 ?auto_4123 ) ( SURFACE-AT ?auto_4116 ?auto_4123 ) ( CLEAR ?auto_4116 ) ( IS-CRATE ?auto_4117 ) ( AVAILABLE ?auto_4122 ) ( IN ?auto_4117 ?auto_4120 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4117 ?auto_4118 )
      ( MAKE-2CRATE-VERIFY ?auto_4116 ?auto_4117 ?auto_4118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4161 - SURFACE
      ?auto_4162 - SURFACE
    )
    :vars
    (
      ?auto_4167 - HOIST
      ?auto_4169 - PLACE
      ?auto_4166 - SURFACE
      ?auto_4165 - PLACE
      ?auto_4163 - HOIST
      ?auto_4164 - SURFACE
      ?auto_4168 - TRUCK
      ?auto_4170 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4167 ?auto_4169 ) ( SURFACE-AT ?auto_4161 ?auto_4169 ) ( CLEAR ?auto_4161 ) ( IS-CRATE ?auto_4162 ) ( not ( = ?auto_4161 ?auto_4162 ) ) ( AVAILABLE ?auto_4167 ) ( ON ?auto_4161 ?auto_4166 ) ( not ( = ?auto_4166 ?auto_4161 ) ) ( not ( = ?auto_4166 ?auto_4162 ) ) ( not ( = ?auto_4165 ?auto_4169 ) ) ( HOIST-AT ?auto_4163 ?auto_4165 ) ( not ( = ?auto_4167 ?auto_4163 ) ) ( AVAILABLE ?auto_4163 ) ( SURFACE-AT ?auto_4162 ?auto_4165 ) ( ON ?auto_4162 ?auto_4164 ) ( CLEAR ?auto_4162 ) ( not ( = ?auto_4161 ?auto_4164 ) ) ( not ( = ?auto_4162 ?auto_4164 ) ) ( not ( = ?auto_4166 ?auto_4164 ) ) ( TRUCK-AT ?auto_4168 ?auto_4170 ) ( not ( = ?auto_4170 ?auto_4169 ) ) ( not ( = ?auto_4165 ?auto_4170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4168 ?auto_4170 ?auto_4169 )
      ( MAKE-1CRATE ?auto_4161 ?auto_4162 )
      ( MAKE-1CRATE-VERIFY ?auto_4161 ?auto_4162 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4200 - SURFACE
      ?auto_4201 - SURFACE
      ?auto_4202 - SURFACE
      ?auto_4203 - SURFACE
    )
    :vars
    (
      ?auto_4204 - HOIST
      ?auto_4205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4204 ?auto_4205 ) ( SURFACE-AT ?auto_4202 ?auto_4205 ) ( CLEAR ?auto_4202 ) ( LIFTING ?auto_4204 ?auto_4203 ) ( IS-CRATE ?auto_4203 ) ( not ( = ?auto_4202 ?auto_4203 ) ) ( ON ?auto_4201 ?auto_4200 ) ( ON ?auto_4202 ?auto_4201 ) ( not ( = ?auto_4200 ?auto_4201 ) ) ( not ( = ?auto_4200 ?auto_4202 ) ) ( not ( = ?auto_4200 ?auto_4203 ) ) ( not ( = ?auto_4201 ?auto_4202 ) ) ( not ( = ?auto_4201 ?auto_4203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4202 ?auto_4203 )
      ( MAKE-3CRATE-VERIFY ?auto_4200 ?auto_4201 ?auto_4202 ?auto_4203 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4217 - SURFACE
      ?auto_4218 - SURFACE
      ?auto_4219 - SURFACE
      ?auto_4220 - SURFACE
    )
    :vars
    (
      ?auto_4222 - HOIST
      ?auto_4221 - PLACE
      ?auto_4223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4222 ?auto_4221 ) ( SURFACE-AT ?auto_4219 ?auto_4221 ) ( CLEAR ?auto_4219 ) ( IS-CRATE ?auto_4220 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( TRUCK-AT ?auto_4223 ?auto_4221 ) ( AVAILABLE ?auto_4222 ) ( IN ?auto_4220 ?auto_4223 ) ( ON ?auto_4219 ?auto_4218 ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( not ( = ?auto_4218 ?auto_4220 ) ) ( ON ?auto_4218 ?auto_4217 ) ( not ( = ?auto_4217 ?auto_4218 ) ) ( not ( = ?auto_4217 ?auto_4219 ) ) ( not ( = ?auto_4217 ?auto_4220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4218 ?auto_4219 ?auto_4220 )
      ( MAKE-3CRATE-VERIFY ?auto_4217 ?auto_4218 ?auto_4219 ?auto_4220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4238 - SURFACE
      ?auto_4239 - SURFACE
      ?auto_4240 - SURFACE
      ?auto_4241 - SURFACE
    )
    :vars
    (
      ?auto_4243 - HOIST
      ?auto_4242 - PLACE
      ?auto_4245 - TRUCK
      ?auto_4244 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4243 ?auto_4242 ) ( SURFACE-AT ?auto_4240 ?auto_4242 ) ( CLEAR ?auto_4240 ) ( IS-CRATE ?auto_4241 ) ( not ( = ?auto_4240 ?auto_4241 ) ) ( AVAILABLE ?auto_4243 ) ( IN ?auto_4241 ?auto_4245 ) ( ON ?auto_4240 ?auto_4239 ) ( not ( = ?auto_4239 ?auto_4240 ) ) ( not ( = ?auto_4239 ?auto_4241 ) ) ( TRUCK-AT ?auto_4245 ?auto_4244 ) ( not ( = ?auto_4244 ?auto_4242 ) ) ( ON ?auto_4239 ?auto_4238 ) ( not ( = ?auto_4238 ?auto_4239 ) ) ( not ( = ?auto_4238 ?auto_4240 ) ) ( not ( = ?auto_4238 ?auto_4241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4239 ?auto_4240 ?auto_4241 )
      ( MAKE-3CRATE-VERIFY ?auto_4238 ?auto_4239 ?auto_4240 ?auto_4241 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4262 - SURFACE
      ?auto_4263 - SURFACE
      ?auto_4264 - SURFACE
      ?auto_4265 - SURFACE
    )
    :vars
    (
      ?auto_4267 - HOIST
      ?auto_4266 - PLACE
      ?auto_4270 - TRUCK
      ?auto_4269 - PLACE
      ?auto_4268 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4267 ?auto_4266 ) ( SURFACE-AT ?auto_4264 ?auto_4266 ) ( CLEAR ?auto_4264 ) ( IS-CRATE ?auto_4265 ) ( not ( = ?auto_4264 ?auto_4265 ) ) ( AVAILABLE ?auto_4267 ) ( ON ?auto_4264 ?auto_4263 ) ( not ( = ?auto_4263 ?auto_4264 ) ) ( not ( = ?auto_4263 ?auto_4265 ) ) ( TRUCK-AT ?auto_4270 ?auto_4269 ) ( not ( = ?auto_4269 ?auto_4266 ) ) ( HOIST-AT ?auto_4268 ?auto_4269 ) ( LIFTING ?auto_4268 ?auto_4265 ) ( not ( = ?auto_4267 ?auto_4268 ) ) ( ON ?auto_4263 ?auto_4262 ) ( not ( = ?auto_4262 ?auto_4263 ) ) ( not ( = ?auto_4262 ?auto_4264 ) ) ( not ( = ?auto_4262 ?auto_4265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4263 ?auto_4264 ?auto_4265 )
      ( MAKE-3CRATE-VERIFY ?auto_4262 ?auto_4263 ?auto_4264 ?auto_4265 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4289 - SURFACE
      ?auto_4290 - SURFACE
      ?auto_4291 - SURFACE
      ?auto_4292 - SURFACE
    )
    :vars
    (
      ?auto_4297 - HOIST
      ?auto_4293 - PLACE
      ?auto_4296 - TRUCK
      ?auto_4295 - PLACE
      ?auto_4294 - HOIST
      ?auto_4298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4297 ?auto_4293 ) ( SURFACE-AT ?auto_4291 ?auto_4293 ) ( CLEAR ?auto_4291 ) ( IS-CRATE ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( AVAILABLE ?auto_4297 ) ( ON ?auto_4291 ?auto_4290 ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( TRUCK-AT ?auto_4296 ?auto_4295 ) ( not ( = ?auto_4295 ?auto_4293 ) ) ( HOIST-AT ?auto_4294 ?auto_4295 ) ( not ( = ?auto_4297 ?auto_4294 ) ) ( AVAILABLE ?auto_4294 ) ( SURFACE-AT ?auto_4292 ?auto_4295 ) ( ON ?auto_4292 ?auto_4298 ) ( CLEAR ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4298 ) ) ( not ( = ?auto_4292 ?auto_4298 ) ) ( not ( = ?auto_4290 ?auto_4298 ) ) ( ON ?auto_4290 ?auto_4289 ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4291 ) ) ( not ( = ?auto_4289 ?auto_4292 ) ) ( not ( = ?auto_4289 ?auto_4298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4290 ?auto_4291 ?auto_4292 )
      ( MAKE-3CRATE-VERIFY ?auto_4289 ?auto_4290 ?auto_4291 ?auto_4292 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4317 - SURFACE
      ?auto_4318 - SURFACE
      ?auto_4319 - SURFACE
      ?auto_4320 - SURFACE
    )
    :vars
    (
      ?auto_4322 - HOIST
      ?auto_4325 - PLACE
      ?auto_4323 - PLACE
      ?auto_4326 - HOIST
      ?auto_4321 - SURFACE
      ?auto_4324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4322 ?auto_4325 ) ( SURFACE-AT ?auto_4319 ?auto_4325 ) ( CLEAR ?auto_4319 ) ( IS-CRATE ?auto_4320 ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( AVAILABLE ?auto_4322 ) ( ON ?auto_4319 ?auto_4318 ) ( not ( = ?auto_4318 ?auto_4319 ) ) ( not ( = ?auto_4318 ?auto_4320 ) ) ( not ( = ?auto_4323 ?auto_4325 ) ) ( HOIST-AT ?auto_4326 ?auto_4323 ) ( not ( = ?auto_4322 ?auto_4326 ) ) ( AVAILABLE ?auto_4326 ) ( SURFACE-AT ?auto_4320 ?auto_4323 ) ( ON ?auto_4320 ?auto_4321 ) ( CLEAR ?auto_4320 ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4320 ?auto_4321 ) ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( TRUCK-AT ?auto_4324 ?auto_4325 ) ( ON ?auto_4318 ?auto_4317 ) ( not ( = ?auto_4317 ?auto_4318 ) ) ( not ( = ?auto_4317 ?auto_4319 ) ) ( not ( = ?auto_4317 ?auto_4320 ) ) ( not ( = ?auto_4317 ?auto_4321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4318 ?auto_4319 ?auto_4320 )
      ( MAKE-3CRATE-VERIFY ?auto_4317 ?auto_4318 ?auto_4319 ?auto_4320 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4345 - SURFACE
      ?auto_4346 - SURFACE
      ?auto_4347 - SURFACE
      ?auto_4348 - SURFACE
    )
    :vars
    (
      ?auto_4352 - HOIST
      ?auto_4353 - PLACE
      ?auto_4350 - PLACE
      ?auto_4354 - HOIST
      ?auto_4351 - SURFACE
      ?auto_4349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4352 ?auto_4353 ) ( IS-CRATE ?auto_4348 ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( not ( = ?auto_4346 ?auto_4347 ) ) ( not ( = ?auto_4346 ?auto_4348 ) ) ( not ( = ?auto_4350 ?auto_4353 ) ) ( HOIST-AT ?auto_4354 ?auto_4350 ) ( not ( = ?auto_4352 ?auto_4354 ) ) ( AVAILABLE ?auto_4354 ) ( SURFACE-AT ?auto_4348 ?auto_4350 ) ( ON ?auto_4348 ?auto_4351 ) ( CLEAR ?auto_4348 ) ( not ( = ?auto_4347 ?auto_4351 ) ) ( not ( = ?auto_4348 ?auto_4351 ) ) ( not ( = ?auto_4346 ?auto_4351 ) ) ( TRUCK-AT ?auto_4349 ?auto_4353 ) ( SURFACE-AT ?auto_4346 ?auto_4353 ) ( CLEAR ?auto_4346 ) ( LIFTING ?auto_4352 ?auto_4347 ) ( IS-CRATE ?auto_4347 ) ( ON ?auto_4346 ?auto_4345 ) ( not ( = ?auto_4345 ?auto_4346 ) ) ( not ( = ?auto_4345 ?auto_4347 ) ) ( not ( = ?auto_4345 ?auto_4348 ) ) ( not ( = ?auto_4345 ?auto_4351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4346 ?auto_4347 ?auto_4348 )
      ( MAKE-3CRATE-VERIFY ?auto_4345 ?auto_4346 ?auto_4347 ?auto_4348 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4373 - SURFACE
      ?auto_4374 - SURFACE
      ?auto_4375 - SURFACE
      ?auto_4376 - SURFACE
    )
    :vars
    (
      ?auto_4379 - HOIST
      ?auto_4378 - PLACE
      ?auto_4377 - PLACE
      ?auto_4382 - HOIST
      ?auto_4380 - SURFACE
      ?auto_4381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4379 ?auto_4378 ) ( IS-CRATE ?auto_4376 ) ( not ( = ?auto_4375 ?auto_4376 ) ) ( not ( = ?auto_4374 ?auto_4375 ) ) ( not ( = ?auto_4374 ?auto_4376 ) ) ( not ( = ?auto_4377 ?auto_4378 ) ) ( HOIST-AT ?auto_4382 ?auto_4377 ) ( not ( = ?auto_4379 ?auto_4382 ) ) ( AVAILABLE ?auto_4382 ) ( SURFACE-AT ?auto_4376 ?auto_4377 ) ( ON ?auto_4376 ?auto_4380 ) ( CLEAR ?auto_4376 ) ( not ( = ?auto_4375 ?auto_4380 ) ) ( not ( = ?auto_4376 ?auto_4380 ) ) ( not ( = ?auto_4374 ?auto_4380 ) ) ( TRUCK-AT ?auto_4381 ?auto_4378 ) ( SURFACE-AT ?auto_4374 ?auto_4378 ) ( CLEAR ?auto_4374 ) ( IS-CRATE ?auto_4375 ) ( AVAILABLE ?auto_4379 ) ( IN ?auto_4375 ?auto_4381 ) ( ON ?auto_4374 ?auto_4373 ) ( not ( = ?auto_4373 ?auto_4374 ) ) ( not ( = ?auto_4373 ?auto_4375 ) ) ( not ( = ?auto_4373 ?auto_4376 ) ) ( not ( = ?auto_4373 ?auto_4380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4374 ?auto_4375 ?auto_4376 )
      ( MAKE-3CRATE-VERIFY ?auto_4373 ?auto_4374 ?auto_4375 ?auto_4376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4558 - SURFACE
      ?auto_4559 - SURFACE
    )
    :vars
    (
      ?auto_4564 - HOIST
      ?auto_4561 - PLACE
      ?auto_4566 - SURFACE
      ?auto_4560 - TRUCK
      ?auto_4562 - PLACE
      ?auto_4563 - HOIST
      ?auto_4565 - SURFACE
      ?auto_4567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4564 ?auto_4561 ) ( SURFACE-AT ?auto_4558 ?auto_4561 ) ( CLEAR ?auto_4558 ) ( IS-CRATE ?auto_4559 ) ( not ( = ?auto_4558 ?auto_4559 ) ) ( AVAILABLE ?auto_4564 ) ( ON ?auto_4558 ?auto_4566 ) ( not ( = ?auto_4566 ?auto_4558 ) ) ( not ( = ?auto_4566 ?auto_4559 ) ) ( TRUCK-AT ?auto_4560 ?auto_4562 ) ( not ( = ?auto_4562 ?auto_4561 ) ) ( HOIST-AT ?auto_4563 ?auto_4562 ) ( not ( = ?auto_4564 ?auto_4563 ) ) ( SURFACE-AT ?auto_4559 ?auto_4562 ) ( ON ?auto_4559 ?auto_4565 ) ( CLEAR ?auto_4559 ) ( not ( = ?auto_4558 ?auto_4565 ) ) ( not ( = ?auto_4559 ?auto_4565 ) ) ( not ( = ?auto_4566 ?auto_4565 ) ) ( LIFTING ?auto_4563 ?auto_4567 ) ( IS-CRATE ?auto_4567 ) ( not ( = ?auto_4558 ?auto_4567 ) ) ( not ( = ?auto_4559 ?auto_4567 ) ) ( not ( = ?auto_4566 ?auto_4567 ) ) ( not ( = ?auto_4565 ?auto_4567 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4563 ?auto_4567 ?auto_4560 ?auto_4562 )
      ( MAKE-1CRATE ?auto_4558 ?auto_4559 )
      ( MAKE-1CRATE-VERIFY ?auto_4558 ?auto_4559 ) )
  )

)

