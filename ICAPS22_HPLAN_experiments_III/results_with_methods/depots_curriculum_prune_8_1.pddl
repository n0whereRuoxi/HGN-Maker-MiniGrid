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

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3918 - SURFACE
      ?auto_3919 - SURFACE
    )
    :vars
    (
      ?auto_3920 - HOIST
      ?auto_3921 - PLACE
      ?auto_3923 - PLACE
      ?auto_3924 - HOIST
      ?auto_3925 - SURFACE
      ?auto_3922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3920 ?auto_3921 ) ( SURFACE-AT ?auto_3918 ?auto_3921 ) ( CLEAR ?auto_3918 ) ( IS-CRATE ?auto_3919 ) ( AVAILABLE ?auto_3920 ) ( not ( = ?auto_3923 ?auto_3921 ) ) ( HOIST-AT ?auto_3924 ?auto_3923 ) ( AVAILABLE ?auto_3924 ) ( SURFACE-AT ?auto_3919 ?auto_3923 ) ( ON ?auto_3919 ?auto_3925 ) ( CLEAR ?auto_3919 ) ( TRUCK-AT ?auto_3922 ?auto_3921 ) ( not ( = ?auto_3918 ?auto_3919 ) ) ( not ( = ?auto_3918 ?auto_3925 ) ) ( not ( = ?auto_3919 ?auto_3925 ) ) ( not ( = ?auto_3920 ?auto_3924 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3922 ?auto_3921 ?auto_3923 )
      ( !LIFT ?auto_3924 ?auto_3919 ?auto_3925 ?auto_3923 )
      ( !LOAD ?auto_3924 ?auto_3919 ?auto_3922 ?auto_3923 )
      ( !DRIVE ?auto_3922 ?auto_3923 ?auto_3921 )
      ( !UNLOAD ?auto_3920 ?auto_3919 ?auto_3922 ?auto_3921 )
      ( !DROP ?auto_3920 ?auto_3919 ?auto_3918 ?auto_3921 )
      ( MAKE-1CRATE-VERIFY ?auto_3918 ?auto_3919 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3939 - SURFACE
      ?auto_3940 - SURFACE
      ?auto_3941 - SURFACE
    )
    :vars
    (
      ?auto_3946 - HOIST
      ?auto_3943 - PLACE
      ?auto_3947 - PLACE
      ?auto_3945 - HOIST
      ?auto_3944 - SURFACE
      ?auto_3948 - PLACE
      ?auto_3949 - HOIST
      ?auto_3950 - SURFACE
      ?auto_3942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3946 ?auto_3943 ) ( IS-CRATE ?auto_3941 ) ( not ( = ?auto_3947 ?auto_3943 ) ) ( HOIST-AT ?auto_3945 ?auto_3947 ) ( AVAILABLE ?auto_3945 ) ( SURFACE-AT ?auto_3941 ?auto_3947 ) ( ON ?auto_3941 ?auto_3944 ) ( CLEAR ?auto_3941 ) ( not ( = ?auto_3940 ?auto_3941 ) ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( not ( = ?auto_3941 ?auto_3944 ) ) ( not ( = ?auto_3946 ?auto_3945 ) ) ( SURFACE-AT ?auto_3939 ?auto_3943 ) ( CLEAR ?auto_3939 ) ( IS-CRATE ?auto_3940 ) ( AVAILABLE ?auto_3946 ) ( not ( = ?auto_3948 ?auto_3943 ) ) ( HOIST-AT ?auto_3949 ?auto_3948 ) ( AVAILABLE ?auto_3949 ) ( SURFACE-AT ?auto_3940 ?auto_3948 ) ( ON ?auto_3940 ?auto_3950 ) ( CLEAR ?auto_3940 ) ( TRUCK-AT ?auto_3942 ?auto_3943 ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3950 ) ) ( not ( = ?auto_3940 ?auto_3950 ) ) ( not ( = ?auto_3946 ?auto_3949 ) ) ( not ( = ?auto_3939 ?auto_3941 ) ) ( not ( = ?auto_3939 ?auto_3944 ) ) ( not ( = ?auto_3941 ?auto_3950 ) ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( not ( = ?auto_3945 ?auto_3949 ) ) ( not ( = ?auto_3944 ?auto_3950 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3939 ?auto_3940 )
      ( MAKE-1CRATE ?auto_3940 ?auto_3941 )
      ( MAKE-2CRATE-VERIFY ?auto_3939 ?auto_3940 ?auto_3941 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3965 - SURFACE
      ?auto_3966 - SURFACE
      ?auto_3967 - SURFACE
      ?auto_3968 - SURFACE
    )
    :vars
    (
      ?auto_3974 - HOIST
      ?auto_3973 - PLACE
      ?auto_3969 - PLACE
      ?auto_3970 - HOIST
      ?auto_3971 - SURFACE
      ?auto_3979 - PLACE
      ?auto_3978 - HOIST
      ?auto_3975 - SURFACE
      ?auto_3980 - PLACE
      ?auto_3976 - HOIST
      ?auto_3977 - SURFACE
      ?auto_3972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3974 ?auto_3973 ) ( IS-CRATE ?auto_3968 ) ( not ( = ?auto_3969 ?auto_3973 ) ) ( HOIST-AT ?auto_3970 ?auto_3969 ) ( AVAILABLE ?auto_3970 ) ( SURFACE-AT ?auto_3968 ?auto_3969 ) ( ON ?auto_3968 ?auto_3971 ) ( CLEAR ?auto_3968 ) ( not ( = ?auto_3967 ?auto_3968 ) ) ( not ( = ?auto_3967 ?auto_3971 ) ) ( not ( = ?auto_3968 ?auto_3971 ) ) ( not ( = ?auto_3974 ?auto_3970 ) ) ( IS-CRATE ?auto_3967 ) ( not ( = ?auto_3979 ?auto_3973 ) ) ( HOIST-AT ?auto_3978 ?auto_3979 ) ( AVAILABLE ?auto_3978 ) ( SURFACE-AT ?auto_3967 ?auto_3979 ) ( ON ?auto_3967 ?auto_3975 ) ( CLEAR ?auto_3967 ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( not ( = ?auto_3966 ?auto_3975 ) ) ( not ( = ?auto_3967 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3978 ) ) ( SURFACE-AT ?auto_3965 ?auto_3973 ) ( CLEAR ?auto_3965 ) ( IS-CRATE ?auto_3966 ) ( AVAILABLE ?auto_3974 ) ( not ( = ?auto_3980 ?auto_3973 ) ) ( HOIST-AT ?auto_3976 ?auto_3980 ) ( AVAILABLE ?auto_3976 ) ( SURFACE-AT ?auto_3966 ?auto_3980 ) ( ON ?auto_3966 ?auto_3977 ) ( CLEAR ?auto_3966 ) ( TRUCK-AT ?auto_3972 ?auto_3973 ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3977 ) ) ( not ( = ?auto_3966 ?auto_3977 ) ) ( not ( = ?auto_3974 ?auto_3976 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3965 ?auto_3975 ) ) ( not ( = ?auto_3967 ?auto_3977 ) ) ( not ( = ?auto_3979 ?auto_3980 ) ) ( not ( = ?auto_3978 ?auto_3976 ) ) ( not ( = ?auto_3975 ?auto_3977 ) ) ( not ( = ?auto_3965 ?auto_3968 ) ) ( not ( = ?auto_3965 ?auto_3971 ) ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( not ( = ?auto_3966 ?auto_3971 ) ) ( not ( = ?auto_3968 ?auto_3975 ) ) ( not ( = ?auto_3968 ?auto_3977 ) ) ( not ( = ?auto_3969 ?auto_3979 ) ) ( not ( = ?auto_3969 ?auto_3980 ) ) ( not ( = ?auto_3970 ?auto_3978 ) ) ( not ( = ?auto_3970 ?auto_3976 ) ) ( not ( = ?auto_3971 ?auto_3975 ) ) ( not ( = ?auto_3971 ?auto_3977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3965 ?auto_3966 ?auto_3967 )
      ( MAKE-1CRATE ?auto_3967 ?auto_3968 )
      ( MAKE-3CRATE-VERIFY ?auto_3965 ?auto_3966 ?auto_3967 ?auto_3968 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3996 - SURFACE
      ?auto_3997 - SURFACE
      ?auto_3998 - SURFACE
      ?auto_3999 - SURFACE
      ?auto_4000 - SURFACE
    )
    :vars
    (
      ?auto_4004 - HOIST
      ?auto_4002 - PLACE
      ?auto_4006 - PLACE
      ?auto_4001 - HOIST
      ?auto_4003 - SURFACE
      ?auto_4008 - PLACE
      ?auto_4007 - HOIST
      ?auto_4009 - SURFACE
      ?auto_4014 - PLACE
      ?auto_4015 - HOIST
      ?auto_4011 - SURFACE
      ?auto_4012 - PLACE
      ?auto_4010 - HOIST
      ?auto_4013 - SURFACE
      ?auto_4005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4004 ?auto_4002 ) ( IS-CRATE ?auto_4000 ) ( not ( = ?auto_4006 ?auto_4002 ) ) ( HOIST-AT ?auto_4001 ?auto_4006 ) ( AVAILABLE ?auto_4001 ) ( SURFACE-AT ?auto_4000 ?auto_4006 ) ( ON ?auto_4000 ?auto_4003 ) ( CLEAR ?auto_4000 ) ( not ( = ?auto_3999 ?auto_4000 ) ) ( not ( = ?auto_3999 ?auto_4003 ) ) ( not ( = ?auto_4000 ?auto_4003 ) ) ( not ( = ?auto_4004 ?auto_4001 ) ) ( IS-CRATE ?auto_3999 ) ( not ( = ?auto_4008 ?auto_4002 ) ) ( HOIST-AT ?auto_4007 ?auto_4008 ) ( AVAILABLE ?auto_4007 ) ( SURFACE-AT ?auto_3999 ?auto_4008 ) ( ON ?auto_3999 ?auto_4009 ) ( CLEAR ?auto_3999 ) ( not ( = ?auto_3998 ?auto_3999 ) ) ( not ( = ?auto_3998 ?auto_4009 ) ) ( not ( = ?auto_3999 ?auto_4009 ) ) ( not ( = ?auto_4004 ?auto_4007 ) ) ( IS-CRATE ?auto_3998 ) ( not ( = ?auto_4014 ?auto_4002 ) ) ( HOIST-AT ?auto_4015 ?auto_4014 ) ( AVAILABLE ?auto_4015 ) ( SURFACE-AT ?auto_3998 ?auto_4014 ) ( ON ?auto_3998 ?auto_4011 ) ( CLEAR ?auto_3998 ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_4011 ) ) ( not ( = ?auto_3998 ?auto_4011 ) ) ( not ( = ?auto_4004 ?auto_4015 ) ) ( SURFACE-AT ?auto_3996 ?auto_4002 ) ( CLEAR ?auto_3996 ) ( IS-CRATE ?auto_3997 ) ( AVAILABLE ?auto_4004 ) ( not ( = ?auto_4012 ?auto_4002 ) ) ( HOIST-AT ?auto_4010 ?auto_4012 ) ( AVAILABLE ?auto_4010 ) ( SURFACE-AT ?auto_3997 ?auto_4012 ) ( ON ?auto_3997 ?auto_4013 ) ( CLEAR ?auto_3997 ) ( TRUCK-AT ?auto_4005 ?auto_4002 ) ( not ( = ?auto_3996 ?auto_3997 ) ) ( not ( = ?auto_3996 ?auto_4013 ) ) ( not ( = ?auto_3997 ?auto_4013 ) ) ( not ( = ?auto_4004 ?auto_4010 ) ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3996 ?auto_4011 ) ) ( not ( = ?auto_3998 ?auto_4013 ) ) ( not ( = ?auto_4014 ?auto_4012 ) ) ( not ( = ?auto_4015 ?auto_4010 ) ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( not ( = ?auto_3996 ?auto_3999 ) ) ( not ( = ?auto_3996 ?auto_4009 ) ) ( not ( = ?auto_3997 ?auto_3999 ) ) ( not ( = ?auto_3997 ?auto_4009 ) ) ( not ( = ?auto_3999 ?auto_4011 ) ) ( not ( = ?auto_3999 ?auto_4013 ) ) ( not ( = ?auto_4008 ?auto_4014 ) ) ( not ( = ?auto_4008 ?auto_4012 ) ) ( not ( = ?auto_4007 ?auto_4015 ) ) ( not ( = ?auto_4007 ?auto_4010 ) ) ( not ( = ?auto_4009 ?auto_4011 ) ) ( not ( = ?auto_4009 ?auto_4013 ) ) ( not ( = ?auto_3996 ?auto_4000 ) ) ( not ( = ?auto_3996 ?auto_4003 ) ) ( not ( = ?auto_3997 ?auto_4000 ) ) ( not ( = ?auto_3997 ?auto_4003 ) ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_3998 ?auto_4003 ) ) ( not ( = ?auto_4000 ?auto_4009 ) ) ( not ( = ?auto_4000 ?auto_4011 ) ) ( not ( = ?auto_4000 ?auto_4013 ) ) ( not ( = ?auto_4006 ?auto_4008 ) ) ( not ( = ?auto_4006 ?auto_4014 ) ) ( not ( = ?auto_4006 ?auto_4012 ) ) ( not ( = ?auto_4001 ?auto_4007 ) ) ( not ( = ?auto_4001 ?auto_4015 ) ) ( not ( = ?auto_4001 ?auto_4010 ) ) ( not ( = ?auto_4003 ?auto_4009 ) ) ( not ( = ?auto_4003 ?auto_4011 ) ) ( not ( = ?auto_4003 ?auto_4013 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3996 ?auto_3997 ?auto_3998 ?auto_3999 )
      ( MAKE-1CRATE ?auto_3999 ?auto_4000 )
      ( MAKE-4CRATE-VERIFY ?auto_3996 ?auto_3997 ?auto_3998 ?auto_3999 ?auto_4000 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4032 - SURFACE
      ?auto_4033 - SURFACE
      ?auto_4034 - SURFACE
      ?auto_4035 - SURFACE
      ?auto_4036 - SURFACE
      ?auto_4037 - SURFACE
    )
    :vars
    (
      ?auto_4038 - HOIST
      ?auto_4040 - PLACE
      ?auto_4039 - PLACE
      ?auto_4043 - HOIST
      ?auto_4042 - SURFACE
      ?auto_4055 - PLACE
      ?auto_4048 - HOIST
      ?auto_4052 - SURFACE
      ?auto_4044 - PLACE
      ?auto_4049 - HOIST
      ?auto_4050 - SURFACE
      ?auto_4054 - PLACE
      ?auto_4051 - HOIST
      ?auto_4046 - SURFACE
      ?auto_4047 - PLACE
      ?auto_4045 - HOIST
      ?auto_4053 - SURFACE
      ?auto_4041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4038 ?auto_4040 ) ( IS-CRATE ?auto_4037 ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( HOIST-AT ?auto_4043 ?auto_4039 ) ( AVAILABLE ?auto_4043 ) ( SURFACE-AT ?auto_4037 ?auto_4039 ) ( ON ?auto_4037 ?auto_4042 ) ( CLEAR ?auto_4037 ) ( not ( = ?auto_4036 ?auto_4037 ) ) ( not ( = ?auto_4036 ?auto_4042 ) ) ( not ( = ?auto_4037 ?auto_4042 ) ) ( not ( = ?auto_4038 ?auto_4043 ) ) ( IS-CRATE ?auto_4036 ) ( not ( = ?auto_4055 ?auto_4040 ) ) ( HOIST-AT ?auto_4048 ?auto_4055 ) ( AVAILABLE ?auto_4048 ) ( SURFACE-AT ?auto_4036 ?auto_4055 ) ( ON ?auto_4036 ?auto_4052 ) ( CLEAR ?auto_4036 ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( not ( = ?auto_4035 ?auto_4052 ) ) ( not ( = ?auto_4036 ?auto_4052 ) ) ( not ( = ?auto_4038 ?auto_4048 ) ) ( IS-CRATE ?auto_4035 ) ( not ( = ?auto_4044 ?auto_4040 ) ) ( HOIST-AT ?auto_4049 ?auto_4044 ) ( AVAILABLE ?auto_4049 ) ( SURFACE-AT ?auto_4035 ?auto_4044 ) ( ON ?auto_4035 ?auto_4050 ) ( CLEAR ?auto_4035 ) ( not ( = ?auto_4034 ?auto_4035 ) ) ( not ( = ?auto_4034 ?auto_4050 ) ) ( not ( = ?auto_4035 ?auto_4050 ) ) ( not ( = ?auto_4038 ?auto_4049 ) ) ( IS-CRATE ?auto_4034 ) ( not ( = ?auto_4054 ?auto_4040 ) ) ( HOIST-AT ?auto_4051 ?auto_4054 ) ( AVAILABLE ?auto_4051 ) ( SURFACE-AT ?auto_4034 ?auto_4054 ) ( ON ?auto_4034 ?auto_4046 ) ( CLEAR ?auto_4034 ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( not ( = ?auto_4033 ?auto_4046 ) ) ( not ( = ?auto_4034 ?auto_4046 ) ) ( not ( = ?auto_4038 ?auto_4051 ) ) ( SURFACE-AT ?auto_4032 ?auto_4040 ) ( CLEAR ?auto_4032 ) ( IS-CRATE ?auto_4033 ) ( AVAILABLE ?auto_4038 ) ( not ( = ?auto_4047 ?auto_4040 ) ) ( HOIST-AT ?auto_4045 ?auto_4047 ) ( AVAILABLE ?auto_4045 ) ( SURFACE-AT ?auto_4033 ?auto_4047 ) ( ON ?auto_4033 ?auto_4053 ) ( CLEAR ?auto_4033 ) ( TRUCK-AT ?auto_4041 ?auto_4040 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4053 ) ) ( not ( = ?auto_4033 ?auto_4053 ) ) ( not ( = ?auto_4038 ?auto_4045 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( not ( = ?auto_4032 ?auto_4046 ) ) ( not ( = ?auto_4034 ?auto_4053 ) ) ( not ( = ?auto_4054 ?auto_4047 ) ) ( not ( = ?auto_4051 ?auto_4045 ) ) ( not ( = ?auto_4046 ?auto_4053 ) ) ( not ( = ?auto_4032 ?auto_4035 ) ) ( not ( = ?auto_4032 ?auto_4050 ) ) ( not ( = ?auto_4033 ?auto_4035 ) ) ( not ( = ?auto_4033 ?auto_4050 ) ) ( not ( = ?auto_4035 ?auto_4046 ) ) ( not ( = ?auto_4035 ?auto_4053 ) ) ( not ( = ?auto_4044 ?auto_4054 ) ) ( not ( = ?auto_4044 ?auto_4047 ) ) ( not ( = ?auto_4049 ?auto_4051 ) ) ( not ( = ?auto_4049 ?auto_4045 ) ) ( not ( = ?auto_4050 ?auto_4046 ) ) ( not ( = ?auto_4050 ?auto_4053 ) ) ( not ( = ?auto_4032 ?auto_4036 ) ) ( not ( = ?auto_4032 ?auto_4052 ) ) ( not ( = ?auto_4033 ?auto_4036 ) ) ( not ( = ?auto_4033 ?auto_4052 ) ) ( not ( = ?auto_4034 ?auto_4036 ) ) ( not ( = ?auto_4034 ?auto_4052 ) ) ( not ( = ?auto_4036 ?auto_4050 ) ) ( not ( = ?auto_4036 ?auto_4046 ) ) ( not ( = ?auto_4036 ?auto_4053 ) ) ( not ( = ?auto_4055 ?auto_4044 ) ) ( not ( = ?auto_4055 ?auto_4054 ) ) ( not ( = ?auto_4055 ?auto_4047 ) ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4051 ) ) ( not ( = ?auto_4048 ?auto_4045 ) ) ( not ( = ?auto_4052 ?auto_4050 ) ) ( not ( = ?auto_4052 ?auto_4046 ) ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( not ( = ?auto_4032 ?auto_4037 ) ) ( not ( = ?auto_4032 ?auto_4042 ) ) ( not ( = ?auto_4033 ?auto_4037 ) ) ( not ( = ?auto_4033 ?auto_4042 ) ) ( not ( = ?auto_4034 ?auto_4037 ) ) ( not ( = ?auto_4034 ?auto_4042 ) ) ( not ( = ?auto_4035 ?auto_4037 ) ) ( not ( = ?auto_4035 ?auto_4042 ) ) ( not ( = ?auto_4037 ?auto_4052 ) ) ( not ( = ?auto_4037 ?auto_4050 ) ) ( not ( = ?auto_4037 ?auto_4046 ) ) ( not ( = ?auto_4037 ?auto_4053 ) ) ( not ( = ?auto_4039 ?auto_4055 ) ) ( not ( = ?auto_4039 ?auto_4044 ) ) ( not ( = ?auto_4039 ?auto_4054 ) ) ( not ( = ?auto_4039 ?auto_4047 ) ) ( not ( = ?auto_4043 ?auto_4048 ) ) ( not ( = ?auto_4043 ?auto_4049 ) ) ( not ( = ?auto_4043 ?auto_4051 ) ) ( not ( = ?auto_4043 ?auto_4045 ) ) ( not ( = ?auto_4042 ?auto_4052 ) ) ( not ( = ?auto_4042 ?auto_4050 ) ) ( not ( = ?auto_4042 ?auto_4046 ) ) ( not ( = ?auto_4042 ?auto_4053 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4032 ?auto_4033 ?auto_4034 ?auto_4035 ?auto_4036 )
      ( MAKE-1CRATE ?auto_4036 ?auto_4037 )
      ( MAKE-5CRATE-VERIFY ?auto_4032 ?auto_4033 ?auto_4034 ?auto_4035 ?auto_4036 ?auto_4037 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4073 - SURFACE
      ?auto_4074 - SURFACE
      ?auto_4075 - SURFACE
      ?auto_4076 - SURFACE
      ?auto_4077 - SURFACE
      ?auto_4078 - SURFACE
      ?auto_4079 - SURFACE
    )
    :vars
    (
      ?auto_4080 - HOIST
      ?auto_4082 - PLACE
      ?auto_4084 - PLACE
      ?auto_4085 - HOIST
      ?auto_4083 - SURFACE
      ?auto_4096 - PLACE
      ?auto_4087 - HOIST
      ?auto_4097 - SURFACE
      ?auto_4092 - PLACE
      ?auto_4093 - HOIST
      ?auto_4091 - SURFACE
      ?auto_4089 - PLACE
      ?auto_4090 - HOIST
      ?auto_4094 - SURFACE
      ?auto_4098 - PLACE
      ?auto_4095 - HOIST
      ?auto_4088 - SURFACE
      ?auto_4086 - SURFACE
      ?auto_4081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4080 ?auto_4082 ) ( IS-CRATE ?auto_4079 ) ( not ( = ?auto_4084 ?auto_4082 ) ) ( HOIST-AT ?auto_4085 ?auto_4084 ) ( SURFACE-AT ?auto_4079 ?auto_4084 ) ( ON ?auto_4079 ?auto_4083 ) ( CLEAR ?auto_4079 ) ( not ( = ?auto_4078 ?auto_4079 ) ) ( not ( = ?auto_4078 ?auto_4083 ) ) ( not ( = ?auto_4079 ?auto_4083 ) ) ( not ( = ?auto_4080 ?auto_4085 ) ) ( IS-CRATE ?auto_4078 ) ( not ( = ?auto_4096 ?auto_4082 ) ) ( HOIST-AT ?auto_4087 ?auto_4096 ) ( AVAILABLE ?auto_4087 ) ( SURFACE-AT ?auto_4078 ?auto_4096 ) ( ON ?auto_4078 ?auto_4097 ) ( CLEAR ?auto_4078 ) ( not ( = ?auto_4077 ?auto_4078 ) ) ( not ( = ?auto_4077 ?auto_4097 ) ) ( not ( = ?auto_4078 ?auto_4097 ) ) ( not ( = ?auto_4080 ?auto_4087 ) ) ( IS-CRATE ?auto_4077 ) ( not ( = ?auto_4092 ?auto_4082 ) ) ( HOIST-AT ?auto_4093 ?auto_4092 ) ( AVAILABLE ?auto_4093 ) ( SURFACE-AT ?auto_4077 ?auto_4092 ) ( ON ?auto_4077 ?auto_4091 ) ( CLEAR ?auto_4077 ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4091 ) ) ( not ( = ?auto_4077 ?auto_4091 ) ) ( not ( = ?auto_4080 ?auto_4093 ) ) ( IS-CRATE ?auto_4076 ) ( not ( = ?auto_4089 ?auto_4082 ) ) ( HOIST-AT ?auto_4090 ?auto_4089 ) ( AVAILABLE ?auto_4090 ) ( SURFACE-AT ?auto_4076 ?auto_4089 ) ( ON ?auto_4076 ?auto_4094 ) ( CLEAR ?auto_4076 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4094 ) ) ( not ( = ?auto_4076 ?auto_4094 ) ) ( not ( = ?auto_4080 ?auto_4090 ) ) ( IS-CRATE ?auto_4075 ) ( not ( = ?auto_4098 ?auto_4082 ) ) ( HOIST-AT ?auto_4095 ?auto_4098 ) ( AVAILABLE ?auto_4095 ) ( SURFACE-AT ?auto_4075 ?auto_4098 ) ( ON ?auto_4075 ?auto_4088 ) ( CLEAR ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( not ( = ?auto_4074 ?auto_4088 ) ) ( not ( = ?auto_4075 ?auto_4088 ) ) ( not ( = ?auto_4080 ?auto_4095 ) ) ( SURFACE-AT ?auto_4073 ?auto_4082 ) ( CLEAR ?auto_4073 ) ( IS-CRATE ?auto_4074 ) ( AVAILABLE ?auto_4080 ) ( AVAILABLE ?auto_4085 ) ( SURFACE-AT ?auto_4074 ?auto_4084 ) ( ON ?auto_4074 ?auto_4086 ) ( CLEAR ?auto_4074 ) ( TRUCK-AT ?auto_4081 ?auto_4082 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4086 ) ) ( not ( = ?auto_4074 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( not ( = ?auto_4073 ?auto_4088 ) ) ( not ( = ?auto_4075 ?auto_4086 ) ) ( not ( = ?auto_4098 ?auto_4084 ) ) ( not ( = ?auto_4095 ?auto_4085 ) ) ( not ( = ?auto_4088 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4076 ) ) ( not ( = ?auto_4073 ?auto_4094 ) ) ( not ( = ?auto_4074 ?auto_4076 ) ) ( not ( = ?auto_4074 ?auto_4094 ) ) ( not ( = ?auto_4076 ?auto_4088 ) ) ( not ( = ?auto_4076 ?auto_4086 ) ) ( not ( = ?auto_4089 ?auto_4098 ) ) ( not ( = ?auto_4089 ?auto_4084 ) ) ( not ( = ?auto_4090 ?auto_4095 ) ) ( not ( = ?auto_4090 ?auto_4085 ) ) ( not ( = ?auto_4094 ?auto_4088 ) ) ( not ( = ?auto_4094 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4077 ) ) ( not ( = ?auto_4073 ?auto_4091 ) ) ( not ( = ?auto_4074 ?auto_4077 ) ) ( not ( = ?auto_4074 ?auto_4091 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4075 ?auto_4091 ) ) ( not ( = ?auto_4077 ?auto_4094 ) ) ( not ( = ?auto_4077 ?auto_4088 ) ) ( not ( = ?auto_4077 ?auto_4086 ) ) ( not ( = ?auto_4092 ?auto_4089 ) ) ( not ( = ?auto_4092 ?auto_4098 ) ) ( not ( = ?auto_4092 ?auto_4084 ) ) ( not ( = ?auto_4093 ?auto_4090 ) ) ( not ( = ?auto_4093 ?auto_4095 ) ) ( not ( = ?auto_4093 ?auto_4085 ) ) ( not ( = ?auto_4091 ?auto_4094 ) ) ( not ( = ?auto_4091 ?auto_4088 ) ) ( not ( = ?auto_4091 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4078 ) ) ( not ( = ?auto_4073 ?auto_4097 ) ) ( not ( = ?auto_4074 ?auto_4078 ) ) ( not ( = ?auto_4074 ?auto_4097 ) ) ( not ( = ?auto_4075 ?auto_4078 ) ) ( not ( = ?auto_4075 ?auto_4097 ) ) ( not ( = ?auto_4076 ?auto_4078 ) ) ( not ( = ?auto_4076 ?auto_4097 ) ) ( not ( = ?auto_4078 ?auto_4091 ) ) ( not ( = ?auto_4078 ?auto_4094 ) ) ( not ( = ?auto_4078 ?auto_4088 ) ) ( not ( = ?auto_4078 ?auto_4086 ) ) ( not ( = ?auto_4096 ?auto_4092 ) ) ( not ( = ?auto_4096 ?auto_4089 ) ) ( not ( = ?auto_4096 ?auto_4098 ) ) ( not ( = ?auto_4096 ?auto_4084 ) ) ( not ( = ?auto_4087 ?auto_4093 ) ) ( not ( = ?auto_4087 ?auto_4090 ) ) ( not ( = ?auto_4087 ?auto_4095 ) ) ( not ( = ?auto_4087 ?auto_4085 ) ) ( not ( = ?auto_4097 ?auto_4091 ) ) ( not ( = ?auto_4097 ?auto_4094 ) ) ( not ( = ?auto_4097 ?auto_4088 ) ) ( not ( = ?auto_4097 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4079 ) ) ( not ( = ?auto_4073 ?auto_4083 ) ) ( not ( = ?auto_4074 ?auto_4079 ) ) ( not ( = ?auto_4074 ?auto_4083 ) ) ( not ( = ?auto_4075 ?auto_4079 ) ) ( not ( = ?auto_4075 ?auto_4083 ) ) ( not ( = ?auto_4076 ?auto_4079 ) ) ( not ( = ?auto_4076 ?auto_4083 ) ) ( not ( = ?auto_4077 ?auto_4079 ) ) ( not ( = ?auto_4077 ?auto_4083 ) ) ( not ( = ?auto_4079 ?auto_4097 ) ) ( not ( = ?auto_4079 ?auto_4091 ) ) ( not ( = ?auto_4079 ?auto_4094 ) ) ( not ( = ?auto_4079 ?auto_4088 ) ) ( not ( = ?auto_4079 ?auto_4086 ) ) ( not ( = ?auto_4083 ?auto_4097 ) ) ( not ( = ?auto_4083 ?auto_4091 ) ) ( not ( = ?auto_4083 ?auto_4094 ) ) ( not ( = ?auto_4083 ?auto_4088 ) ) ( not ( = ?auto_4083 ?auto_4086 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4073 ?auto_4074 ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4078 )
      ( MAKE-1CRATE ?auto_4078 ?auto_4079 )
      ( MAKE-6CRATE-VERIFY ?auto_4073 ?auto_4074 ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4078 ?auto_4079 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4117 - SURFACE
      ?auto_4118 - SURFACE
      ?auto_4119 - SURFACE
      ?auto_4120 - SURFACE
      ?auto_4121 - SURFACE
      ?auto_4122 - SURFACE
      ?auto_4123 - SURFACE
      ?auto_4124 - SURFACE
    )
    :vars
    (
      ?auto_4125 - HOIST
      ?auto_4130 - PLACE
      ?auto_4126 - PLACE
      ?auto_4127 - HOIST
      ?auto_4128 - SURFACE
      ?auto_4138 - PLACE
      ?auto_4137 - HOIST
      ?auto_4132 - SURFACE
      ?auto_4135 - SURFACE
      ?auto_4140 - PLACE
      ?auto_4131 - HOIST
      ?auto_4141 - SURFACE
      ?auto_4139 - PLACE
      ?auto_4144 - HOIST
      ?auto_4133 - SURFACE
      ?auto_4136 - PLACE
      ?auto_4142 - HOIST
      ?auto_4143 - SURFACE
      ?auto_4134 - SURFACE
      ?auto_4129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4125 ?auto_4130 ) ( IS-CRATE ?auto_4124 ) ( not ( = ?auto_4126 ?auto_4130 ) ) ( HOIST-AT ?auto_4127 ?auto_4126 ) ( SURFACE-AT ?auto_4124 ?auto_4126 ) ( ON ?auto_4124 ?auto_4128 ) ( CLEAR ?auto_4124 ) ( not ( = ?auto_4123 ?auto_4124 ) ) ( not ( = ?auto_4123 ?auto_4128 ) ) ( not ( = ?auto_4124 ?auto_4128 ) ) ( not ( = ?auto_4125 ?auto_4127 ) ) ( IS-CRATE ?auto_4123 ) ( not ( = ?auto_4138 ?auto_4130 ) ) ( HOIST-AT ?auto_4137 ?auto_4138 ) ( SURFACE-AT ?auto_4123 ?auto_4138 ) ( ON ?auto_4123 ?auto_4132 ) ( CLEAR ?auto_4123 ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4132 ) ) ( not ( = ?auto_4123 ?auto_4132 ) ) ( not ( = ?auto_4125 ?auto_4137 ) ) ( IS-CRATE ?auto_4122 ) ( AVAILABLE ?auto_4127 ) ( SURFACE-AT ?auto_4122 ?auto_4126 ) ( ON ?auto_4122 ?auto_4135 ) ( CLEAR ?auto_4122 ) ( not ( = ?auto_4121 ?auto_4122 ) ) ( not ( = ?auto_4121 ?auto_4135 ) ) ( not ( = ?auto_4122 ?auto_4135 ) ) ( IS-CRATE ?auto_4121 ) ( not ( = ?auto_4140 ?auto_4130 ) ) ( HOIST-AT ?auto_4131 ?auto_4140 ) ( AVAILABLE ?auto_4131 ) ( SURFACE-AT ?auto_4121 ?auto_4140 ) ( ON ?auto_4121 ?auto_4141 ) ( CLEAR ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4121 ) ) ( not ( = ?auto_4120 ?auto_4141 ) ) ( not ( = ?auto_4121 ?auto_4141 ) ) ( not ( = ?auto_4125 ?auto_4131 ) ) ( IS-CRATE ?auto_4120 ) ( not ( = ?auto_4139 ?auto_4130 ) ) ( HOIST-AT ?auto_4144 ?auto_4139 ) ( AVAILABLE ?auto_4144 ) ( SURFACE-AT ?auto_4120 ?auto_4139 ) ( ON ?auto_4120 ?auto_4133 ) ( CLEAR ?auto_4120 ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4133 ) ) ( not ( = ?auto_4120 ?auto_4133 ) ) ( not ( = ?auto_4125 ?auto_4144 ) ) ( IS-CRATE ?auto_4119 ) ( not ( = ?auto_4136 ?auto_4130 ) ) ( HOIST-AT ?auto_4142 ?auto_4136 ) ( AVAILABLE ?auto_4142 ) ( SURFACE-AT ?auto_4119 ?auto_4136 ) ( ON ?auto_4119 ?auto_4143 ) ( CLEAR ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( not ( = ?auto_4118 ?auto_4143 ) ) ( not ( = ?auto_4119 ?auto_4143 ) ) ( not ( = ?auto_4125 ?auto_4142 ) ) ( SURFACE-AT ?auto_4117 ?auto_4130 ) ( CLEAR ?auto_4117 ) ( IS-CRATE ?auto_4118 ) ( AVAILABLE ?auto_4125 ) ( AVAILABLE ?auto_4137 ) ( SURFACE-AT ?auto_4118 ?auto_4138 ) ( ON ?auto_4118 ?auto_4134 ) ( CLEAR ?auto_4118 ) ( TRUCK-AT ?auto_4129 ?auto_4130 ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4134 ) ) ( not ( = ?auto_4118 ?auto_4134 ) ) ( not ( = ?auto_4117 ?auto_4119 ) ) ( not ( = ?auto_4117 ?auto_4143 ) ) ( not ( = ?auto_4119 ?auto_4134 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4142 ?auto_4137 ) ) ( not ( = ?auto_4143 ?auto_4134 ) ) ( not ( = ?auto_4117 ?auto_4120 ) ) ( not ( = ?auto_4117 ?auto_4133 ) ) ( not ( = ?auto_4118 ?auto_4120 ) ) ( not ( = ?auto_4118 ?auto_4133 ) ) ( not ( = ?auto_4120 ?auto_4143 ) ) ( not ( = ?auto_4120 ?auto_4134 ) ) ( not ( = ?auto_4139 ?auto_4136 ) ) ( not ( = ?auto_4139 ?auto_4138 ) ) ( not ( = ?auto_4144 ?auto_4142 ) ) ( not ( = ?auto_4144 ?auto_4137 ) ) ( not ( = ?auto_4133 ?auto_4143 ) ) ( not ( = ?auto_4133 ?auto_4134 ) ) ( not ( = ?auto_4117 ?auto_4121 ) ) ( not ( = ?auto_4117 ?auto_4141 ) ) ( not ( = ?auto_4118 ?auto_4121 ) ) ( not ( = ?auto_4118 ?auto_4141 ) ) ( not ( = ?auto_4119 ?auto_4121 ) ) ( not ( = ?auto_4119 ?auto_4141 ) ) ( not ( = ?auto_4121 ?auto_4133 ) ) ( not ( = ?auto_4121 ?auto_4143 ) ) ( not ( = ?auto_4121 ?auto_4134 ) ) ( not ( = ?auto_4140 ?auto_4139 ) ) ( not ( = ?auto_4140 ?auto_4136 ) ) ( not ( = ?auto_4140 ?auto_4138 ) ) ( not ( = ?auto_4131 ?auto_4144 ) ) ( not ( = ?auto_4131 ?auto_4142 ) ) ( not ( = ?auto_4131 ?auto_4137 ) ) ( not ( = ?auto_4141 ?auto_4133 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4134 ) ) ( not ( = ?auto_4117 ?auto_4122 ) ) ( not ( = ?auto_4117 ?auto_4135 ) ) ( not ( = ?auto_4118 ?auto_4122 ) ) ( not ( = ?auto_4118 ?auto_4135 ) ) ( not ( = ?auto_4119 ?auto_4122 ) ) ( not ( = ?auto_4119 ?auto_4135 ) ) ( not ( = ?auto_4120 ?auto_4122 ) ) ( not ( = ?auto_4120 ?auto_4135 ) ) ( not ( = ?auto_4122 ?auto_4141 ) ) ( not ( = ?auto_4122 ?auto_4133 ) ) ( not ( = ?auto_4122 ?auto_4143 ) ) ( not ( = ?auto_4122 ?auto_4134 ) ) ( not ( = ?auto_4126 ?auto_4140 ) ) ( not ( = ?auto_4126 ?auto_4139 ) ) ( not ( = ?auto_4126 ?auto_4136 ) ) ( not ( = ?auto_4126 ?auto_4138 ) ) ( not ( = ?auto_4127 ?auto_4131 ) ) ( not ( = ?auto_4127 ?auto_4144 ) ) ( not ( = ?auto_4127 ?auto_4142 ) ) ( not ( = ?auto_4127 ?auto_4137 ) ) ( not ( = ?auto_4135 ?auto_4141 ) ) ( not ( = ?auto_4135 ?auto_4133 ) ) ( not ( = ?auto_4135 ?auto_4143 ) ) ( not ( = ?auto_4135 ?auto_4134 ) ) ( not ( = ?auto_4117 ?auto_4123 ) ) ( not ( = ?auto_4117 ?auto_4132 ) ) ( not ( = ?auto_4118 ?auto_4123 ) ) ( not ( = ?auto_4118 ?auto_4132 ) ) ( not ( = ?auto_4119 ?auto_4123 ) ) ( not ( = ?auto_4119 ?auto_4132 ) ) ( not ( = ?auto_4120 ?auto_4123 ) ) ( not ( = ?auto_4120 ?auto_4132 ) ) ( not ( = ?auto_4121 ?auto_4123 ) ) ( not ( = ?auto_4121 ?auto_4132 ) ) ( not ( = ?auto_4123 ?auto_4135 ) ) ( not ( = ?auto_4123 ?auto_4141 ) ) ( not ( = ?auto_4123 ?auto_4133 ) ) ( not ( = ?auto_4123 ?auto_4143 ) ) ( not ( = ?auto_4123 ?auto_4134 ) ) ( not ( = ?auto_4132 ?auto_4135 ) ) ( not ( = ?auto_4132 ?auto_4141 ) ) ( not ( = ?auto_4132 ?auto_4133 ) ) ( not ( = ?auto_4132 ?auto_4143 ) ) ( not ( = ?auto_4132 ?auto_4134 ) ) ( not ( = ?auto_4117 ?auto_4124 ) ) ( not ( = ?auto_4117 ?auto_4128 ) ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4118 ?auto_4128 ) ) ( not ( = ?auto_4119 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4128 ) ) ( not ( = ?auto_4120 ?auto_4124 ) ) ( not ( = ?auto_4120 ?auto_4128 ) ) ( not ( = ?auto_4121 ?auto_4124 ) ) ( not ( = ?auto_4121 ?auto_4128 ) ) ( not ( = ?auto_4122 ?auto_4124 ) ) ( not ( = ?auto_4122 ?auto_4128 ) ) ( not ( = ?auto_4124 ?auto_4132 ) ) ( not ( = ?auto_4124 ?auto_4135 ) ) ( not ( = ?auto_4124 ?auto_4141 ) ) ( not ( = ?auto_4124 ?auto_4133 ) ) ( not ( = ?auto_4124 ?auto_4143 ) ) ( not ( = ?auto_4124 ?auto_4134 ) ) ( not ( = ?auto_4128 ?auto_4132 ) ) ( not ( = ?auto_4128 ?auto_4135 ) ) ( not ( = ?auto_4128 ?auto_4141 ) ) ( not ( = ?auto_4128 ?auto_4133 ) ) ( not ( = ?auto_4128 ?auto_4143 ) ) ( not ( = ?auto_4128 ?auto_4134 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4117 ?auto_4118 ?auto_4119 ?auto_4120 ?auto_4121 ?auto_4122 ?auto_4123 )
      ( MAKE-1CRATE ?auto_4123 ?auto_4124 )
      ( MAKE-7CRATE-VERIFY ?auto_4117 ?auto_4118 ?auto_4119 ?auto_4120 ?auto_4121 ?auto_4122 ?auto_4123 ?auto_4124 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4164 - SURFACE
      ?auto_4165 - SURFACE
      ?auto_4166 - SURFACE
      ?auto_4167 - SURFACE
      ?auto_4168 - SURFACE
      ?auto_4169 - SURFACE
      ?auto_4170 - SURFACE
      ?auto_4171 - SURFACE
      ?auto_4172 - SURFACE
    )
    :vars
    (
      ?auto_4177 - HOIST
      ?auto_4173 - PLACE
      ?auto_4174 - PLACE
      ?auto_4175 - HOIST
      ?auto_4176 - SURFACE
      ?auto_4194 - PLACE
      ?auto_4195 - HOIST
      ?auto_4193 - SURFACE
      ?auto_4184 - PLACE
      ?auto_4185 - HOIST
      ?auto_4191 - SURFACE
      ?auto_4179 - SURFACE
      ?auto_4180 - PLACE
      ?auto_4182 - HOIST
      ?auto_4181 - SURFACE
      ?auto_4189 - PLACE
      ?auto_4183 - HOIST
      ?auto_4192 - SURFACE
      ?auto_4186 - PLACE
      ?auto_4188 - HOIST
      ?auto_4187 - SURFACE
      ?auto_4190 - SURFACE
      ?auto_4178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4177 ?auto_4173 ) ( IS-CRATE ?auto_4172 ) ( not ( = ?auto_4174 ?auto_4173 ) ) ( HOIST-AT ?auto_4175 ?auto_4174 ) ( AVAILABLE ?auto_4175 ) ( SURFACE-AT ?auto_4172 ?auto_4174 ) ( ON ?auto_4172 ?auto_4176 ) ( CLEAR ?auto_4172 ) ( not ( = ?auto_4171 ?auto_4172 ) ) ( not ( = ?auto_4171 ?auto_4176 ) ) ( not ( = ?auto_4172 ?auto_4176 ) ) ( not ( = ?auto_4177 ?auto_4175 ) ) ( IS-CRATE ?auto_4171 ) ( not ( = ?auto_4194 ?auto_4173 ) ) ( HOIST-AT ?auto_4195 ?auto_4194 ) ( SURFACE-AT ?auto_4171 ?auto_4194 ) ( ON ?auto_4171 ?auto_4193 ) ( CLEAR ?auto_4171 ) ( not ( = ?auto_4170 ?auto_4171 ) ) ( not ( = ?auto_4170 ?auto_4193 ) ) ( not ( = ?auto_4171 ?auto_4193 ) ) ( not ( = ?auto_4177 ?auto_4195 ) ) ( IS-CRATE ?auto_4170 ) ( not ( = ?auto_4184 ?auto_4173 ) ) ( HOIST-AT ?auto_4185 ?auto_4184 ) ( SURFACE-AT ?auto_4170 ?auto_4184 ) ( ON ?auto_4170 ?auto_4191 ) ( CLEAR ?auto_4170 ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( not ( = ?auto_4169 ?auto_4191 ) ) ( not ( = ?auto_4170 ?auto_4191 ) ) ( not ( = ?auto_4177 ?auto_4185 ) ) ( IS-CRATE ?auto_4169 ) ( AVAILABLE ?auto_4195 ) ( SURFACE-AT ?auto_4169 ?auto_4194 ) ( ON ?auto_4169 ?auto_4179 ) ( CLEAR ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4169 ) ) ( not ( = ?auto_4168 ?auto_4179 ) ) ( not ( = ?auto_4169 ?auto_4179 ) ) ( IS-CRATE ?auto_4168 ) ( not ( = ?auto_4180 ?auto_4173 ) ) ( HOIST-AT ?auto_4182 ?auto_4180 ) ( AVAILABLE ?auto_4182 ) ( SURFACE-AT ?auto_4168 ?auto_4180 ) ( ON ?auto_4168 ?auto_4181 ) ( CLEAR ?auto_4168 ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4181 ) ) ( not ( = ?auto_4168 ?auto_4181 ) ) ( not ( = ?auto_4177 ?auto_4182 ) ) ( IS-CRATE ?auto_4167 ) ( not ( = ?auto_4189 ?auto_4173 ) ) ( HOIST-AT ?auto_4183 ?auto_4189 ) ( AVAILABLE ?auto_4183 ) ( SURFACE-AT ?auto_4167 ?auto_4189 ) ( ON ?auto_4167 ?auto_4192 ) ( CLEAR ?auto_4167 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4192 ) ) ( not ( = ?auto_4167 ?auto_4192 ) ) ( not ( = ?auto_4177 ?auto_4183 ) ) ( IS-CRATE ?auto_4166 ) ( not ( = ?auto_4186 ?auto_4173 ) ) ( HOIST-AT ?auto_4188 ?auto_4186 ) ( AVAILABLE ?auto_4188 ) ( SURFACE-AT ?auto_4166 ?auto_4186 ) ( ON ?auto_4166 ?auto_4187 ) ( CLEAR ?auto_4166 ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4187 ) ) ( not ( = ?auto_4166 ?auto_4187 ) ) ( not ( = ?auto_4177 ?auto_4188 ) ) ( SURFACE-AT ?auto_4164 ?auto_4173 ) ( CLEAR ?auto_4164 ) ( IS-CRATE ?auto_4165 ) ( AVAILABLE ?auto_4177 ) ( AVAILABLE ?auto_4185 ) ( SURFACE-AT ?auto_4165 ?auto_4184 ) ( ON ?auto_4165 ?auto_4190 ) ( CLEAR ?auto_4165 ) ( TRUCK-AT ?auto_4178 ?auto_4173 ) ( not ( = ?auto_4164 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4190 ) ) ( not ( = ?auto_4165 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4187 ) ) ( not ( = ?auto_4166 ?auto_4190 ) ) ( not ( = ?auto_4186 ?auto_4184 ) ) ( not ( = ?auto_4188 ?auto_4185 ) ) ( not ( = ?auto_4187 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4164 ?auto_4192 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4165 ?auto_4192 ) ) ( not ( = ?auto_4167 ?auto_4187 ) ) ( not ( = ?auto_4167 ?auto_4190 ) ) ( not ( = ?auto_4189 ?auto_4186 ) ) ( not ( = ?auto_4189 ?auto_4184 ) ) ( not ( = ?auto_4183 ?auto_4188 ) ) ( not ( = ?auto_4183 ?auto_4185 ) ) ( not ( = ?auto_4192 ?auto_4187 ) ) ( not ( = ?auto_4192 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4168 ) ) ( not ( = ?auto_4164 ?auto_4181 ) ) ( not ( = ?auto_4165 ?auto_4168 ) ) ( not ( = ?auto_4165 ?auto_4181 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4181 ) ) ( not ( = ?auto_4168 ?auto_4192 ) ) ( not ( = ?auto_4168 ?auto_4187 ) ) ( not ( = ?auto_4168 ?auto_4190 ) ) ( not ( = ?auto_4180 ?auto_4189 ) ) ( not ( = ?auto_4180 ?auto_4186 ) ) ( not ( = ?auto_4180 ?auto_4184 ) ) ( not ( = ?auto_4182 ?auto_4183 ) ) ( not ( = ?auto_4182 ?auto_4188 ) ) ( not ( = ?auto_4182 ?auto_4185 ) ) ( not ( = ?auto_4181 ?auto_4192 ) ) ( not ( = ?auto_4181 ?auto_4187 ) ) ( not ( = ?auto_4181 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4169 ) ) ( not ( = ?auto_4164 ?auto_4179 ) ) ( not ( = ?auto_4165 ?auto_4169 ) ) ( not ( = ?auto_4165 ?auto_4179 ) ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4179 ) ) ( not ( = ?auto_4167 ?auto_4169 ) ) ( not ( = ?auto_4167 ?auto_4179 ) ) ( not ( = ?auto_4169 ?auto_4181 ) ) ( not ( = ?auto_4169 ?auto_4192 ) ) ( not ( = ?auto_4169 ?auto_4187 ) ) ( not ( = ?auto_4169 ?auto_4190 ) ) ( not ( = ?auto_4194 ?auto_4180 ) ) ( not ( = ?auto_4194 ?auto_4189 ) ) ( not ( = ?auto_4194 ?auto_4186 ) ) ( not ( = ?auto_4194 ?auto_4184 ) ) ( not ( = ?auto_4195 ?auto_4182 ) ) ( not ( = ?auto_4195 ?auto_4183 ) ) ( not ( = ?auto_4195 ?auto_4188 ) ) ( not ( = ?auto_4195 ?auto_4185 ) ) ( not ( = ?auto_4179 ?auto_4181 ) ) ( not ( = ?auto_4179 ?auto_4192 ) ) ( not ( = ?auto_4179 ?auto_4187 ) ) ( not ( = ?auto_4179 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4170 ) ) ( not ( = ?auto_4164 ?auto_4191 ) ) ( not ( = ?auto_4165 ?auto_4170 ) ) ( not ( = ?auto_4165 ?auto_4191 ) ) ( not ( = ?auto_4166 ?auto_4170 ) ) ( not ( = ?auto_4166 ?auto_4191 ) ) ( not ( = ?auto_4167 ?auto_4170 ) ) ( not ( = ?auto_4167 ?auto_4191 ) ) ( not ( = ?auto_4168 ?auto_4170 ) ) ( not ( = ?auto_4168 ?auto_4191 ) ) ( not ( = ?auto_4170 ?auto_4179 ) ) ( not ( = ?auto_4170 ?auto_4181 ) ) ( not ( = ?auto_4170 ?auto_4192 ) ) ( not ( = ?auto_4170 ?auto_4187 ) ) ( not ( = ?auto_4170 ?auto_4190 ) ) ( not ( = ?auto_4191 ?auto_4179 ) ) ( not ( = ?auto_4191 ?auto_4181 ) ) ( not ( = ?auto_4191 ?auto_4192 ) ) ( not ( = ?auto_4191 ?auto_4187 ) ) ( not ( = ?auto_4191 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4171 ) ) ( not ( = ?auto_4164 ?auto_4193 ) ) ( not ( = ?auto_4165 ?auto_4171 ) ) ( not ( = ?auto_4165 ?auto_4193 ) ) ( not ( = ?auto_4166 ?auto_4171 ) ) ( not ( = ?auto_4166 ?auto_4193 ) ) ( not ( = ?auto_4167 ?auto_4171 ) ) ( not ( = ?auto_4167 ?auto_4193 ) ) ( not ( = ?auto_4168 ?auto_4171 ) ) ( not ( = ?auto_4168 ?auto_4193 ) ) ( not ( = ?auto_4169 ?auto_4171 ) ) ( not ( = ?auto_4169 ?auto_4193 ) ) ( not ( = ?auto_4171 ?auto_4191 ) ) ( not ( = ?auto_4171 ?auto_4179 ) ) ( not ( = ?auto_4171 ?auto_4181 ) ) ( not ( = ?auto_4171 ?auto_4192 ) ) ( not ( = ?auto_4171 ?auto_4187 ) ) ( not ( = ?auto_4171 ?auto_4190 ) ) ( not ( = ?auto_4193 ?auto_4191 ) ) ( not ( = ?auto_4193 ?auto_4179 ) ) ( not ( = ?auto_4193 ?auto_4181 ) ) ( not ( = ?auto_4193 ?auto_4192 ) ) ( not ( = ?auto_4193 ?auto_4187 ) ) ( not ( = ?auto_4193 ?auto_4190 ) ) ( not ( = ?auto_4164 ?auto_4172 ) ) ( not ( = ?auto_4164 ?auto_4176 ) ) ( not ( = ?auto_4165 ?auto_4172 ) ) ( not ( = ?auto_4165 ?auto_4176 ) ) ( not ( = ?auto_4166 ?auto_4172 ) ) ( not ( = ?auto_4166 ?auto_4176 ) ) ( not ( = ?auto_4167 ?auto_4172 ) ) ( not ( = ?auto_4167 ?auto_4176 ) ) ( not ( = ?auto_4168 ?auto_4172 ) ) ( not ( = ?auto_4168 ?auto_4176 ) ) ( not ( = ?auto_4169 ?auto_4172 ) ) ( not ( = ?auto_4169 ?auto_4176 ) ) ( not ( = ?auto_4170 ?auto_4172 ) ) ( not ( = ?auto_4170 ?auto_4176 ) ) ( not ( = ?auto_4172 ?auto_4193 ) ) ( not ( = ?auto_4172 ?auto_4191 ) ) ( not ( = ?auto_4172 ?auto_4179 ) ) ( not ( = ?auto_4172 ?auto_4181 ) ) ( not ( = ?auto_4172 ?auto_4192 ) ) ( not ( = ?auto_4172 ?auto_4187 ) ) ( not ( = ?auto_4172 ?auto_4190 ) ) ( not ( = ?auto_4174 ?auto_4194 ) ) ( not ( = ?auto_4174 ?auto_4184 ) ) ( not ( = ?auto_4174 ?auto_4180 ) ) ( not ( = ?auto_4174 ?auto_4189 ) ) ( not ( = ?auto_4174 ?auto_4186 ) ) ( not ( = ?auto_4175 ?auto_4195 ) ) ( not ( = ?auto_4175 ?auto_4185 ) ) ( not ( = ?auto_4175 ?auto_4182 ) ) ( not ( = ?auto_4175 ?auto_4183 ) ) ( not ( = ?auto_4175 ?auto_4188 ) ) ( not ( = ?auto_4176 ?auto_4193 ) ) ( not ( = ?auto_4176 ?auto_4191 ) ) ( not ( = ?auto_4176 ?auto_4179 ) ) ( not ( = ?auto_4176 ?auto_4181 ) ) ( not ( = ?auto_4176 ?auto_4192 ) ) ( not ( = ?auto_4176 ?auto_4187 ) ) ( not ( = ?auto_4176 ?auto_4190 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4164 ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ?auto_4170 ?auto_4171 )
      ( MAKE-1CRATE ?auto_4171 ?auto_4172 )
      ( MAKE-8CRATE-VERIFY ?auto_4164 ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ?auto_4170 ?auto_4171 ?auto_4172 ) )
  )

)

