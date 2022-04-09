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
      ?auto_3947 - HOIST
      ?auto_3943 - PLACE
      ?auto_3945 - PLACE
      ?auto_3944 - HOIST
      ?auto_3946 - SURFACE
      ?auto_3948 - PLACE
      ?auto_3950 - HOIST
      ?auto_3949 - SURFACE
      ?auto_3942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3947 ?auto_3943 ) ( IS-CRATE ?auto_3941 ) ( not ( = ?auto_3945 ?auto_3943 ) ) ( HOIST-AT ?auto_3944 ?auto_3945 ) ( AVAILABLE ?auto_3944 ) ( SURFACE-AT ?auto_3941 ?auto_3945 ) ( ON ?auto_3941 ?auto_3946 ) ( CLEAR ?auto_3941 ) ( not ( = ?auto_3940 ?auto_3941 ) ) ( not ( = ?auto_3940 ?auto_3946 ) ) ( not ( = ?auto_3941 ?auto_3946 ) ) ( not ( = ?auto_3947 ?auto_3944 ) ) ( SURFACE-AT ?auto_3939 ?auto_3943 ) ( CLEAR ?auto_3939 ) ( IS-CRATE ?auto_3940 ) ( AVAILABLE ?auto_3947 ) ( not ( = ?auto_3948 ?auto_3943 ) ) ( HOIST-AT ?auto_3950 ?auto_3948 ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3940 ?auto_3948 ) ( ON ?auto_3940 ?auto_3949 ) ( CLEAR ?auto_3940 ) ( TRUCK-AT ?auto_3942 ?auto_3943 ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3949 ) ) ( not ( = ?auto_3940 ?auto_3949 ) ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3939 ?auto_3941 ) ) ( not ( = ?auto_3939 ?auto_3946 ) ) ( not ( = ?auto_3941 ?auto_3949 ) ) ( not ( = ?auto_3945 ?auto_3948 ) ) ( not ( = ?auto_3944 ?auto_3950 ) ) ( not ( = ?auto_3946 ?auto_3949 ) ) )
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
      ?auto_3971 - PLACE
      ?auto_3969 - PLACE
      ?auto_3972 - HOIST
      ?auto_3970 - SURFACE
      ?auto_3980 - PLACE
      ?auto_3975 - HOIST
      ?auto_3976 - SURFACE
      ?auto_3979 - PLACE
      ?auto_3978 - HOIST
      ?auto_3977 - SURFACE
      ?auto_3973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3974 ?auto_3971 ) ( IS-CRATE ?auto_3968 ) ( not ( = ?auto_3969 ?auto_3971 ) ) ( HOIST-AT ?auto_3972 ?auto_3969 ) ( AVAILABLE ?auto_3972 ) ( SURFACE-AT ?auto_3968 ?auto_3969 ) ( ON ?auto_3968 ?auto_3970 ) ( CLEAR ?auto_3968 ) ( not ( = ?auto_3967 ?auto_3968 ) ) ( not ( = ?auto_3967 ?auto_3970 ) ) ( not ( = ?auto_3968 ?auto_3970 ) ) ( not ( = ?auto_3974 ?auto_3972 ) ) ( IS-CRATE ?auto_3967 ) ( not ( = ?auto_3980 ?auto_3971 ) ) ( HOIST-AT ?auto_3975 ?auto_3980 ) ( AVAILABLE ?auto_3975 ) ( SURFACE-AT ?auto_3967 ?auto_3980 ) ( ON ?auto_3967 ?auto_3976 ) ( CLEAR ?auto_3967 ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( not ( = ?auto_3966 ?auto_3976 ) ) ( not ( = ?auto_3967 ?auto_3976 ) ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( SURFACE-AT ?auto_3965 ?auto_3971 ) ( CLEAR ?auto_3965 ) ( IS-CRATE ?auto_3966 ) ( AVAILABLE ?auto_3974 ) ( not ( = ?auto_3979 ?auto_3971 ) ) ( HOIST-AT ?auto_3978 ?auto_3979 ) ( AVAILABLE ?auto_3978 ) ( SURFACE-AT ?auto_3966 ?auto_3979 ) ( ON ?auto_3966 ?auto_3977 ) ( CLEAR ?auto_3966 ) ( TRUCK-AT ?auto_3973 ?auto_3971 ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3977 ) ) ( not ( = ?auto_3966 ?auto_3977 ) ) ( not ( = ?auto_3974 ?auto_3978 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3965 ?auto_3976 ) ) ( not ( = ?auto_3967 ?auto_3977 ) ) ( not ( = ?auto_3980 ?auto_3979 ) ) ( not ( = ?auto_3975 ?auto_3978 ) ) ( not ( = ?auto_3976 ?auto_3977 ) ) ( not ( = ?auto_3965 ?auto_3968 ) ) ( not ( = ?auto_3965 ?auto_3970 ) ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( not ( = ?auto_3966 ?auto_3970 ) ) ( not ( = ?auto_3968 ?auto_3976 ) ) ( not ( = ?auto_3968 ?auto_3977 ) ) ( not ( = ?auto_3969 ?auto_3980 ) ) ( not ( = ?auto_3969 ?auto_3979 ) ) ( not ( = ?auto_3972 ?auto_3975 ) ) ( not ( = ?auto_3972 ?auto_3978 ) ) ( not ( = ?auto_3970 ?auto_3976 ) ) ( not ( = ?auto_3970 ?auto_3977 ) ) )
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
      ?auto_4001 - HOIST
      ?auto_4004 - PLACE
      ?auto_4006 - PLACE
      ?auto_4002 - HOIST
      ?auto_4003 - SURFACE
      ?auto_4012 - PLACE
      ?auto_4010 - HOIST
      ?auto_4011 - SURFACE
      ?auto_4009 - PLACE
      ?auto_4014 - HOIST
      ?auto_4015 - SURFACE
      ?auto_4013 - PLACE
      ?auto_4007 - HOIST
      ?auto_4008 - SURFACE
      ?auto_4005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4001 ?auto_4004 ) ( IS-CRATE ?auto_4000 ) ( not ( = ?auto_4006 ?auto_4004 ) ) ( HOIST-AT ?auto_4002 ?auto_4006 ) ( AVAILABLE ?auto_4002 ) ( SURFACE-AT ?auto_4000 ?auto_4006 ) ( ON ?auto_4000 ?auto_4003 ) ( CLEAR ?auto_4000 ) ( not ( = ?auto_3999 ?auto_4000 ) ) ( not ( = ?auto_3999 ?auto_4003 ) ) ( not ( = ?auto_4000 ?auto_4003 ) ) ( not ( = ?auto_4001 ?auto_4002 ) ) ( IS-CRATE ?auto_3999 ) ( not ( = ?auto_4012 ?auto_4004 ) ) ( HOIST-AT ?auto_4010 ?auto_4012 ) ( AVAILABLE ?auto_4010 ) ( SURFACE-AT ?auto_3999 ?auto_4012 ) ( ON ?auto_3999 ?auto_4011 ) ( CLEAR ?auto_3999 ) ( not ( = ?auto_3998 ?auto_3999 ) ) ( not ( = ?auto_3998 ?auto_4011 ) ) ( not ( = ?auto_3999 ?auto_4011 ) ) ( not ( = ?auto_4001 ?auto_4010 ) ) ( IS-CRATE ?auto_3998 ) ( not ( = ?auto_4009 ?auto_4004 ) ) ( HOIST-AT ?auto_4014 ?auto_4009 ) ( AVAILABLE ?auto_4014 ) ( SURFACE-AT ?auto_3998 ?auto_4009 ) ( ON ?auto_3998 ?auto_4015 ) ( CLEAR ?auto_3998 ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_4015 ) ) ( not ( = ?auto_3998 ?auto_4015 ) ) ( not ( = ?auto_4001 ?auto_4014 ) ) ( SURFACE-AT ?auto_3996 ?auto_4004 ) ( CLEAR ?auto_3996 ) ( IS-CRATE ?auto_3997 ) ( AVAILABLE ?auto_4001 ) ( not ( = ?auto_4013 ?auto_4004 ) ) ( HOIST-AT ?auto_4007 ?auto_4013 ) ( AVAILABLE ?auto_4007 ) ( SURFACE-AT ?auto_3997 ?auto_4013 ) ( ON ?auto_3997 ?auto_4008 ) ( CLEAR ?auto_3997 ) ( TRUCK-AT ?auto_4005 ?auto_4004 ) ( not ( = ?auto_3996 ?auto_3997 ) ) ( not ( = ?auto_3996 ?auto_4008 ) ) ( not ( = ?auto_3997 ?auto_4008 ) ) ( not ( = ?auto_4001 ?auto_4007 ) ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3996 ?auto_4015 ) ) ( not ( = ?auto_3998 ?auto_4008 ) ) ( not ( = ?auto_4009 ?auto_4013 ) ) ( not ( = ?auto_4014 ?auto_4007 ) ) ( not ( = ?auto_4015 ?auto_4008 ) ) ( not ( = ?auto_3996 ?auto_3999 ) ) ( not ( = ?auto_3996 ?auto_4011 ) ) ( not ( = ?auto_3997 ?auto_3999 ) ) ( not ( = ?auto_3997 ?auto_4011 ) ) ( not ( = ?auto_3999 ?auto_4015 ) ) ( not ( = ?auto_3999 ?auto_4008 ) ) ( not ( = ?auto_4012 ?auto_4009 ) ) ( not ( = ?auto_4012 ?auto_4013 ) ) ( not ( = ?auto_4010 ?auto_4014 ) ) ( not ( = ?auto_4010 ?auto_4007 ) ) ( not ( = ?auto_4011 ?auto_4015 ) ) ( not ( = ?auto_4011 ?auto_4008 ) ) ( not ( = ?auto_3996 ?auto_4000 ) ) ( not ( = ?auto_3996 ?auto_4003 ) ) ( not ( = ?auto_3997 ?auto_4000 ) ) ( not ( = ?auto_3997 ?auto_4003 ) ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_3998 ?auto_4003 ) ) ( not ( = ?auto_4000 ?auto_4011 ) ) ( not ( = ?auto_4000 ?auto_4015 ) ) ( not ( = ?auto_4000 ?auto_4008 ) ) ( not ( = ?auto_4006 ?auto_4012 ) ) ( not ( = ?auto_4006 ?auto_4009 ) ) ( not ( = ?auto_4006 ?auto_4013 ) ) ( not ( = ?auto_4002 ?auto_4010 ) ) ( not ( = ?auto_4002 ?auto_4014 ) ) ( not ( = ?auto_4002 ?auto_4007 ) ) ( not ( = ?auto_4003 ?auto_4011 ) ) ( not ( = ?auto_4003 ?auto_4015 ) ) ( not ( = ?auto_4003 ?auto_4008 ) ) )
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
      ?auto_4041 - HOIST
      ?auto_4043 - PLACE
      ?auto_4038 - PLACE
      ?auto_4039 - HOIST
      ?auto_4042 - SURFACE
      ?auto_4049 - PLACE
      ?auto_4052 - HOIST
      ?auto_4053 - SURFACE
      ?auto_4045 - PLACE
      ?auto_4048 - HOIST
      ?auto_4044 - SURFACE
      ?auto_4051 - PLACE
      ?auto_4050 - HOIST
      ?auto_4055 - SURFACE
      ?auto_4046 - PLACE
      ?auto_4054 - HOIST
      ?auto_4047 - SURFACE
      ?auto_4040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4041 ?auto_4043 ) ( IS-CRATE ?auto_4037 ) ( not ( = ?auto_4038 ?auto_4043 ) ) ( HOIST-AT ?auto_4039 ?auto_4038 ) ( AVAILABLE ?auto_4039 ) ( SURFACE-AT ?auto_4037 ?auto_4038 ) ( ON ?auto_4037 ?auto_4042 ) ( CLEAR ?auto_4037 ) ( not ( = ?auto_4036 ?auto_4037 ) ) ( not ( = ?auto_4036 ?auto_4042 ) ) ( not ( = ?auto_4037 ?auto_4042 ) ) ( not ( = ?auto_4041 ?auto_4039 ) ) ( IS-CRATE ?auto_4036 ) ( not ( = ?auto_4049 ?auto_4043 ) ) ( HOIST-AT ?auto_4052 ?auto_4049 ) ( AVAILABLE ?auto_4052 ) ( SURFACE-AT ?auto_4036 ?auto_4049 ) ( ON ?auto_4036 ?auto_4053 ) ( CLEAR ?auto_4036 ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( not ( = ?auto_4035 ?auto_4053 ) ) ( not ( = ?auto_4036 ?auto_4053 ) ) ( not ( = ?auto_4041 ?auto_4052 ) ) ( IS-CRATE ?auto_4035 ) ( not ( = ?auto_4045 ?auto_4043 ) ) ( HOIST-AT ?auto_4048 ?auto_4045 ) ( AVAILABLE ?auto_4048 ) ( SURFACE-AT ?auto_4035 ?auto_4045 ) ( ON ?auto_4035 ?auto_4044 ) ( CLEAR ?auto_4035 ) ( not ( = ?auto_4034 ?auto_4035 ) ) ( not ( = ?auto_4034 ?auto_4044 ) ) ( not ( = ?auto_4035 ?auto_4044 ) ) ( not ( = ?auto_4041 ?auto_4048 ) ) ( IS-CRATE ?auto_4034 ) ( not ( = ?auto_4051 ?auto_4043 ) ) ( HOIST-AT ?auto_4050 ?auto_4051 ) ( AVAILABLE ?auto_4050 ) ( SURFACE-AT ?auto_4034 ?auto_4051 ) ( ON ?auto_4034 ?auto_4055 ) ( CLEAR ?auto_4034 ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( not ( = ?auto_4033 ?auto_4055 ) ) ( not ( = ?auto_4034 ?auto_4055 ) ) ( not ( = ?auto_4041 ?auto_4050 ) ) ( SURFACE-AT ?auto_4032 ?auto_4043 ) ( CLEAR ?auto_4032 ) ( IS-CRATE ?auto_4033 ) ( AVAILABLE ?auto_4041 ) ( not ( = ?auto_4046 ?auto_4043 ) ) ( HOIST-AT ?auto_4054 ?auto_4046 ) ( AVAILABLE ?auto_4054 ) ( SURFACE-AT ?auto_4033 ?auto_4046 ) ( ON ?auto_4033 ?auto_4047 ) ( CLEAR ?auto_4033 ) ( TRUCK-AT ?auto_4040 ?auto_4043 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4047 ) ) ( not ( = ?auto_4033 ?auto_4047 ) ) ( not ( = ?auto_4041 ?auto_4054 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( not ( = ?auto_4032 ?auto_4055 ) ) ( not ( = ?auto_4034 ?auto_4047 ) ) ( not ( = ?auto_4051 ?auto_4046 ) ) ( not ( = ?auto_4050 ?auto_4054 ) ) ( not ( = ?auto_4055 ?auto_4047 ) ) ( not ( = ?auto_4032 ?auto_4035 ) ) ( not ( = ?auto_4032 ?auto_4044 ) ) ( not ( = ?auto_4033 ?auto_4035 ) ) ( not ( = ?auto_4033 ?auto_4044 ) ) ( not ( = ?auto_4035 ?auto_4055 ) ) ( not ( = ?auto_4035 ?auto_4047 ) ) ( not ( = ?auto_4045 ?auto_4051 ) ) ( not ( = ?auto_4045 ?auto_4046 ) ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4054 ) ) ( not ( = ?auto_4044 ?auto_4055 ) ) ( not ( = ?auto_4044 ?auto_4047 ) ) ( not ( = ?auto_4032 ?auto_4036 ) ) ( not ( = ?auto_4032 ?auto_4053 ) ) ( not ( = ?auto_4033 ?auto_4036 ) ) ( not ( = ?auto_4033 ?auto_4053 ) ) ( not ( = ?auto_4034 ?auto_4036 ) ) ( not ( = ?auto_4034 ?auto_4053 ) ) ( not ( = ?auto_4036 ?auto_4044 ) ) ( not ( = ?auto_4036 ?auto_4055 ) ) ( not ( = ?auto_4036 ?auto_4047 ) ) ( not ( = ?auto_4049 ?auto_4045 ) ) ( not ( = ?auto_4049 ?auto_4051 ) ) ( not ( = ?auto_4049 ?auto_4046 ) ) ( not ( = ?auto_4052 ?auto_4048 ) ) ( not ( = ?auto_4052 ?auto_4050 ) ) ( not ( = ?auto_4052 ?auto_4054 ) ) ( not ( = ?auto_4053 ?auto_4044 ) ) ( not ( = ?auto_4053 ?auto_4055 ) ) ( not ( = ?auto_4053 ?auto_4047 ) ) ( not ( = ?auto_4032 ?auto_4037 ) ) ( not ( = ?auto_4032 ?auto_4042 ) ) ( not ( = ?auto_4033 ?auto_4037 ) ) ( not ( = ?auto_4033 ?auto_4042 ) ) ( not ( = ?auto_4034 ?auto_4037 ) ) ( not ( = ?auto_4034 ?auto_4042 ) ) ( not ( = ?auto_4035 ?auto_4037 ) ) ( not ( = ?auto_4035 ?auto_4042 ) ) ( not ( = ?auto_4037 ?auto_4053 ) ) ( not ( = ?auto_4037 ?auto_4044 ) ) ( not ( = ?auto_4037 ?auto_4055 ) ) ( not ( = ?auto_4037 ?auto_4047 ) ) ( not ( = ?auto_4038 ?auto_4049 ) ) ( not ( = ?auto_4038 ?auto_4045 ) ) ( not ( = ?auto_4038 ?auto_4051 ) ) ( not ( = ?auto_4038 ?auto_4046 ) ) ( not ( = ?auto_4039 ?auto_4052 ) ) ( not ( = ?auto_4039 ?auto_4048 ) ) ( not ( = ?auto_4039 ?auto_4050 ) ) ( not ( = ?auto_4039 ?auto_4054 ) ) ( not ( = ?auto_4042 ?auto_4053 ) ) ( not ( = ?auto_4042 ?auto_4044 ) ) ( not ( = ?auto_4042 ?auto_4055 ) ) ( not ( = ?auto_4042 ?auto_4047 ) ) )
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
      ?auto_4084 - HOIST
      ?auto_4080 - PLACE
      ?auto_4082 - PLACE
      ?auto_4083 - HOIST
      ?auto_4081 - SURFACE
      ?auto_4095 - PLACE
      ?auto_4098 - HOIST
      ?auto_4093 - SURFACE
      ?auto_4091 - PLACE
      ?auto_4089 - HOIST
      ?auto_4096 - SURFACE
      ?auto_4097 - PLACE
      ?auto_4090 - HOIST
      ?auto_4088 - SURFACE
      ?auto_4092 - PLACE
      ?auto_4087 - HOIST
      ?auto_4094 - SURFACE
      ?auto_4086 - SURFACE
      ?auto_4085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4084 ?auto_4080 ) ( IS-CRATE ?auto_4079 ) ( not ( = ?auto_4082 ?auto_4080 ) ) ( HOIST-AT ?auto_4083 ?auto_4082 ) ( SURFACE-AT ?auto_4079 ?auto_4082 ) ( ON ?auto_4079 ?auto_4081 ) ( CLEAR ?auto_4079 ) ( not ( = ?auto_4078 ?auto_4079 ) ) ( not ( = ?auto_4078 ?auto_4081 ) ) ( not ( = ?auto_4079 ?auto_4081 ) ) ( not ( = ?auto_4084 ?auto_4083 ) ) ( IS-CRATE ?auto_4078 ) ( not ( = ?auto_4095 ?auto_4080 ) ) ( HOIST-AT ?auto_4098 ?auto_4095 ) ( AVAILABLE ?auto_4098 ) ( SURFACE-AT ?auto_4078 ?auto_4095 ) ( ON ?auto_4078 ?auto_4093 ) ( CLEAR ?auto_4078 ) ( not ( = ?auto_4077 ?auto_4078 ) ) ( not ( = ?auto_4077 ?auto_4093 ) ) ( not ( = ?auto_4078 ?auto_4093 ) ) ( not ( = ?auto_4084 ?auto_4098 ) ) ( IS-CRATE ?auto_4077 ) ( not ( = ?auto_4091 ?auto_4080 ) ) ( HOIST-AT ?auto_4089 ?auto_4091 ) ( AVAILABLE ?auto_4089 ) ( SURFACE-AT ?auto_4077 ?auto_4091 ) ( ON ?auto_4077 ?auto_4096 ) ( CLEAR ?auto_4077 ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4096 ) ) ( not ( = ?auto_4077 ?auto_4096 ) ) ( not ( = ?auto_4084 ?auto_4089 ) ) ( IS-CRATE ?auto_4076 ) ( not ( = ?auto_4097 ?auto_4080 ) ) ( HOIST-AT ?auto_4090 ?auto_4097 ) ( AVAILABLE ?auto_4090 ) ( SURFACE-AT ?auto_4076 ?auto_4097 ) ( ON ?auto_4076 ?auto_4088 ) ( CLEAR ?auto_4076 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4088 ) ) ( not ( = ?auto_4076 ?auto_4088 ) ) ( not ( = ?auto_4084 ?auto_4090 ) ) ( IS-CRATE ?auto_4075 ) ( not ( = ?auto_4092 ?auto_4080 ) ) ( HOIST-AT ?auto_4087 ?auto_4092 ) ( AVAILABLE ?auto_4087 ) ( SURFACE-AT ?auto_4075 ?auto_4092 ) ( ON ?auto_4075 ?auto_4094 ) ( CLEAR ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( not ( = ?auto_4074 ?auto_4094 ) ) ( not ( = ?auto_4075 ?auto_4094 ) ) ( not ( = ?auto_4084 ?auto_4087 ) ) ( SURFACE-AT ?auto_4073 ?auto_4080 ) ( CLEAR ?auto_4073 ) ( IS-CRATE ?auto_4074 ) ( AVAILABLE ?auto_4084 ) ( AVAILABLE ?auto_4083 ) ( SURFACE-AT ?auto_4074 ?auto_4082 ) ( ON ?auto_4074 ?auto_4086 ) ( CLEAR ?auto_4074 ) ( TRUCK-AT ?auto_4085 ?auto_4080 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4086 ) ) ( not ( = ?auto_4074 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( not ( = ?auto_4073 ?auto_4094 ) ) ( not ( = ?auto_4075 ?auto_4086 ) ) ( not ( = ?auto_4092 ?auto_4082 ) ) ( not ( = ?auto_4087 ?auto_4083 ) ) ( not ( = ?auto_4094 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4076 ) ) ( not ( = ?auto_4073 ?auto_4088 ) ) ( not ( = ?auto_4074 ?auto_4076 ) ) ( not ( = ?auto_4074 ?auto_4088 ) ) ( not ( = ?auto_4076 ?auto_4094 ) ) ( not ( = ?auto_4076 ?auto_4086 ) ) ( not ( = ?auto_4097 ?auto_4092 ) ) ( not ( = ?auto_4097 ?auto_4082 ) ) ( not ( = ?auto_4090 ?auto_4087 ) ) ( not ( = ?auto_4090 ?auto_4083 ) ) ( not ( = ?auto_4088 ?auto_4094 ) ) ( not ( = ?auto_4088 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4077 ) ) ( not ( = ?auto_4073 ?auto_4096 ) ) ( not ( = ?auto_4074 ?auto_4077 ) ) ( not ( = ?auto_4074 ?auto_4096 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4075 ?auto_4096 ) ) ( not ( = ?auto_4077 ?auto_4088 ) ) ( not ( = ?auto_4077 ?auto_4094 ) ) ( not ( = ?auto_4077 ?auto_4086 ) ) ( not ( = ?auto_4091 ?auto_4097 ) ) ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4082 ) ) ( not ( = ?auto_4089 ?auto_4090 ) ) ( not ( = ?auto_4089 ?auto_4087 ) ) ( not ( = ?auto_4089 ?auto_4083 ) ) ( not ( = ?auto_4096 ?auto_4088 ) ) ( not ( = ?auto_4096 ?auto_4094 ) ) ( not ( = ?auto_4096 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4078 ) ) ( not ( = ?auto_4073 ?auto_4093 ) ) ( not ( = ?auto_4074 ?auto_4078 ) ) ( not ( = ?auto_4074 ?auto_4093 ) ) ( not ( = ?auto_4075 ?auto_4078 ) ) ( not ( = ?auto_4075 ?auto_4093 ) ) ( not ( = ?auto_4076 ?auto_4078 ) ) ( not ( = ?auto_4076 ?auto_4093 ) ) ( not ( = ?auto_4078 ?auto_4096 ) ) ( not ( = ?auto_4078 ?auto_4088 ) ) ( not ( = ?auto_4078 ?auto_4094 ) ) ( not ( = ?auto_4078 ?auto_4086 ) ) ( not ( = ?auto_4095 ?auto_4091 ) ) ( not ( = ?auto_4095 ?auto_4097 ) ) ( not ( = ?auto_4095 ?auto_4092 ) ) ( not ( = ?auto_4095 ?auto_4082 ) ) ( not ( = ?auto_4098 ?auto_4089 ) ) ( not ( = ?auto_4098 ?auto_4090 ) ) ( not ( = ?auto_4098 ?auto_4087 ) ) ( not ( = ?auto_4098 ?auto_4083 ) ) ( not ( = ?auto_4093 ?auto_4096 ) ) ( not ( = ?auto_4093 ?auto_4088 ) ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4086 ) ) ( not ( = ?auto_4073 ?auto_4079 ) ) ( not ( = ?auto_4073 ?auto_4081 ) ) ( not ( = ?auto_4074 ?auto_4079 ) ) ( not ( = ?auto_4074 ?auto_4081 ) ) ( not ( = ?auto_4075 ?auto_4079 ) ) ( not ( = ?auto_4075 ?auto_4081 ) ) ( not ( = ?auto_4076 ?auto_4079 ) ) ( not ( = ?auto_4076 ?auto_4081 ) ) ( not ( = ?auto_4077 ?auto_4079 ) ) ( not ( = ?auto_4077 ?auto_4081 ) ) ( not ( = ?auto_4079 ?auto_4093 ) ) ( not ( = ?auto_4079 ?auto_4096 ) ) ( not ( = ?auto_4079 ?auto_4088 ) ) ( not ( = ?auto_4079 ?auto_4094 ) ) ( not ( = ?auto_4079 ?auto_4086 ) ) ( not ( = ?auto_4081 ?auto_4093 ) ) ( not ( = ?auto_4081 ?auto_4096 ) ) ( not ( = ?auto_4081 ?auto_4088 ) ) ( not ( = ?auto_4081 ?auto_4094 ) ) ( not ( = ?auto_4081 ?auto_4086 ) ) )
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
      ?auto_4126 - HOIST
      ?auto_4125 - PLACE
      ?auto_4127 - PLACE
      ?auto_4128 - HOIST
      ?auto_4129 - SURFACE
      ?auto_4134 - PLACE
      ?auto_4133 - HOIST
      ?auto_4136 - SURFACE
      ?auto_4131 - SURFACE
      ?auto_4135 - PLACE
      ?auto_4140 - HOIST
      ?auto_4144 - SURFACE
      ?auto_4142 - PLACE
      ?auto_4137 - HOIST
      ?auto_4139 - SURFACE
      ?auto_4141 - PLACE
      ?auto_4138 - HOIST
      ?auto_4143 - SURFACE
      ?auto_4132 - SURFACE
      ?auto_4130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4126 ?auto_4125 ) ( IS-CRATE ?auto_4124 ) ( not ( = ?auto_4127 ?auto_4125 ) ) ( HOIST-AT ?auto_4128 ?auto_4127 ) ( SURFACE-AT ?auto_4124 ?auto_4127 ) ( ON ?auto_4124 ?auto_4129 ) ( CLEAR ?auto_4124 ) ( not ( = ?auto_4123 ?auto_4124 ) ) ( not ( = ?auto_4123 ?auto_4129 ) ) ( not ( = ?auto_4124 ?auto_4129 ) ) ( not ( = ?auto_4126 ?auto_4128 ) ) ( IS-CRATE ?auto_4123 ) ( not ( = ?auto_4134 ?auto_4125 ) ) ( HOIST-AT ?auto_4133 ?auto_4134 ) ( SURFACE-AT ?auto_4123 ?auto_4134 ) ( ON ?auto_4123 ?auto_4136 ) ( CLEAR ?auto_4123 ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4136 ) ) ( not ( = ?auto_4123 ?auto_4136 ) ) ( not ( = ?auto_4126 ?auto_4133 ) ) ( IS-CRATE ?auto_4122 ) ( AVAILABLE ?auto_4128 ) ( SURFACE-AT ?auto_4122 ?auto_4127 ) ( ON ?auto_4122 ?auto_4131 ) ( CLEAR ?auto_4122 ) ( not ( = ?auto_4121 ?auto_4122 ) ) ( not ( = ?auto_4121 ?auto_4131 ) ) ( not ( = ?auto_4122 ?auto_4131 ) ) ( IS-CRATE ?auto_4121 ) ( not ( = ?auto_4135 ?auto_4125 ) ) ( HOIST-AT ?auto_4140 ?auto_4135 ) ( AVAILABLE ?auto_4140 ) ( SURFACE-AT ?auto_4121 ?auto_4135 ) ( ON ?auto_4121 ?auto_4144 ) ( CLEAR ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4121 ) ) ( not ( = ?auto_4120 ?auto_4144 ) ) ( not ( = ?auto_4121 ?auto_4144 ) ) ( not ( = ?auto_4126 ?auto_4140 ) ) ( IS-CRATE ?auto_4120 ) ( not ( = ?auto_4142 ?auto_4125 ) ) ( HOIST-AT ?auto_4137 ?auto_4142 ) ( AVAILABLE ?auto_4137 ) ( SURFACE-AT ?auto_4120 ?auto_4142 ) ( ON ?auto_4120 ?auto_4139 ) ( CLEAR ?auto_4120 ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4139 ) ) ( not ( = ?auto_4120 ?auto_4139 ) ) ( not ( = ?auto_4126 ?auto_4137 ) ) ( IS-CRATE ?auto_4119 ) ( not ( = ?auto_4141 ?auto_4125 ) ) ( HOIST-AT ?auto_4138 ?auto_4141 ) ( AVAILABLE ?auto_4138 ) ( SURFACE-AT ?auto_4119 ?auto_4141 ) ( ON ?auto_4119 ?auto_4143 ) ( CLEAR ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( not ( = ?auto_4118 ?auto_4143 ) ) ( not ( = ?auto_4119 ?auto_4143 ) ) ( not ( = ?auto_4126 ?auto_4138 ) ) ( SURFACE-AT ?auto_4117 ?auto_4125 ) ( CLEAR ?auto_4117 ) ( IS-CRATE ?auto_4118 ) ( AVAILABLE ?auto_4126 ) ( AVAILABLE ?auto_4133 ) ( SURFACE-AT ?auto_4118 ?auto_4134 ) ( ON ?auto_4118 ?auto_4132 ) ( CLEAR ?auto_4118 ) ( TRUCK-AT ?auto_4130 ?auto_4125 ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4132 ) ) ( not ( = ?auto_4118 ?auto_4132 ) ) ( not ( = ?auto_4117 ?auto_4119 ) ) ( not ( = ?auto_4117 ?auto_4143 ) ) ( not ( = ?auto_4119 ?auto_4132 ) ) ( not ( = ?auto_4141 ?auto_4134 ) ) ( not ( = ?auto_4138 ?auto_4133 ) ) ( not ( = ?auto_4143 ?auto_4132 ) ) ( not ( = ?auto_4117 ?auto_4120 ) ) ( not ( = ?auto_4117 ?auto_4139 ) ) ( not ( = ?auto_4118 ?auto_4120 ) ) ( not ( = ?auto_4118 ?auto_4139 ) ) ( not ( = ?auto_4120 ?auto_4143 ) ) ( not ( = ?auto_4120 ?auto_4132 ) ) ( not ( = ?auto_4142 ?auto_4141 ) ) ( not ( = ?auto_4142 ?auto_4134 ) ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4133 ) ) ( not ( = ?auto_4139 ?auto_4143 ) ) ( not ( = ?auto_4139 ?auto_4132 ) ) ( not ( = ?auto_4117 ?auto_4121 ) ) ( not ( = ?auto_4117 ?auto_4144 ) ) ( not ( = ?auto_4118 ?auto_4121 ) ) ( not ( = ?auto_4118 ?auto_4144 ) ) ( not ( = ?auto_4119 ?auto_4121 ) ) ( not ( = ?auto_4119 ?auto_4144 ) ) ( not ( = ?auto_4121 ?auto_4139 ) ) ( not ( = ?auto_4121 ?auto_4143 ) ) ( not ( = ?auto_4121 ?auto_4132 ) ) ( not ( = ?auto_4135 ?auto_4142 ) ) ( not ( = ?auto_4135 ?auto_4141 ) ) ( not ( = ?auto_4135 ?auto_4134 ) ) ( not ( = ?auto_4140 ?auto_4137 ) ) ( not ( = ?auto_4140 ?auto_4138 ) ) ( not ( = ?auto_4140 ?auto_4133 ) ) ( not ( = ?auto_4144 ?auto_4139 ) ) ( not ( = ?auto_4144 ?auto_4143 ) ) ( not ( = ?auto_4144 ?auto_4132 ) ) ( not ( = ?auto_4117 ?auto_4122 ) ) ( not ( = ?auto_4117 ?auto_4131 ) ) ( not ( = ?auto_4118 ?auto_4122 ) ) ( not ( = ?auto_4118 ?auto_4131 ) ) ( not ( = ?auto_4119 ?auto_4122 ) ) ( not ( = ?auto_4119 ?auto_4131 ) ) ( not ( = ?auto_4120 ?auto_4122 ) ) ( not ( = ?auto_4120 ?auto_4131 ) ) ( not ( = ?auto_4122 ?auto_4144 ) ) ( not ( = ?auto_4122 ?auto_4139 ) ) ( not ( = ?auto_4122 ?auto_4143 ) ) ( not ( = ?auto_4122 ?auto_4132 ) ) ( not ( = ?auto_4127 ?auto_4135 ) ) ( not ( = ?auto_4127 ?auto_4142 ) ) ( not ( = ?auto_4127 ?auto_4141 ) ) ( not ( = ?auto_4127 ?auto_4134 ) ) ( not ( = ?auto_4128 ?auto_4140 ) ) ( not ( = ?auto_4128 ?auto_4137 ) ) ( not ( = ?auto_4128 ?auto_4138 ) ) ( not ( = ?auto_4128 ?auto_4133 ) ) ( not ( = ?auto_4131 ?auto_4144 ) ) ( not ( = ?auto_4131 ?auto_4139 ) ) ( not ( = ?auto_4131 ?auto_4143 ) ) ( not ( = ?auto_4131 ?auto_4132 ) ) ( not ( = ?auto_4117 ?auto_4123 ) ) ( not ( = ?auto_4117 ?auto_4136 ) ) ( not ( = ?auto_4118 ?auto_4123 ) ) ( not ( = ?auto_4118 ?auto_4136 ) ) ( not ( = ?auto_4119 ?auto_4123 ) ) ( not ( = ?auto_4119 ?auto_4136 ) ) ( not ( = ?auto_4120 ?auto_4123 ) ) ( not ( = ?auto_4120 ?auto_4136 ) ) ( not ( = ?auto_4121 ?auto_4123 ) ) ( not ( = ?auto_4121 ?auto_4136 ) ) ( not ( = ?auto_4123 ?auto_4131 ) ) ( not ( = ?auto_4123 ?auto_4144 ) ) ( not ( = ?auto_4123 ?auto_4139 ) ) ( not ( = ?auto_4123 ?auto_4143 ) ) ( not ( = ?auto_4123 ?auto_4132 ) ) ( not ( = ?auto_4136 ?auto_4131 ) ) ( not ( = ?auto_4136 ?auto_4144 ) ) ( not ( = ?auto_4136 ?auto_4139 ) ) ( not ( = ?auto_4136 ?auto_4143 ) ) ( not ( = ?auto_4136 ?auto_4132 ) ) ( not ( = ?auto_4117 ?auto_4124 ) ) ( not ( = ?auto_4117 ?auto_4129 ) ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4118 ?auto_4129 ) ) ( not ( = ?auto_4119 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4129 ) ) ( not ( = ?auto_4120 ?auto_4124 ) ) ( not ( = ?auto_4120 ?auto_4129 ) ) ( not ( = ?auto_4121 ?auto_4124 ) ) ( not ( = ?auto_4121 ?auto_4129 ) ) ( not ( = ?auto_4122 ?auto_4124 ) ) ( not ( = ?auto_4122 ?auto_4129 ) ) ( not ( = ?auto_4124 ?auto_4136 ) ) ( not ( = ?auto_4124 ?auto_4131 ) ) ( not ( = ?auto_4124 ?auto_4144 ) ) ( not ( = ?auto_4124 ?auto_4139 ) ) ( not ( = ?auto_4124 ?auto_4143 ) ) ( not ( = ?auto_4124 ?auto_4132 ) ) ( not ( = ?auto_4129 ?auto_4136 ) ) ( not ( = ?auto_4129 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4144 ) ) ( not ( = ?auto_4129 ?auto_4139 ) ) ( not ( = ?auto_4129 ?auto_4143 ) ) ( not ( = ?auto_4129 ?auto_4132 ) ) )
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
      ?auto_4193 - HOIST
      ?auto_4191 - SURFACE
      ?auto_4192 - PLACE
      ?auto_4184 - HOIST
      ?auto_4181 - SURFACE
      ?auto_4190 - SURFACE
      ?auto_4195 - PLACE
      ?auto_4187 - HOIST
      ?auto_4186 - SURFACE
      ?auto_4183 - PLACE
      ?auto_4189 - HOIST
      ?auto_4182 - SURFACE
      ?auto_4185 - PLACE
      ?auto_4188 - HOIST
      ?auto_4179 - SURFACE
      ?auto_4180 - SURFACE
      ?auto_4178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4177 ?auto_4173 ) ( IS-CRATE ?auto_4172 ) ( not ( = ?auto_4174 ?auto_4173 ) ) ( HOIST-AT ?auto_4175 ?auto_4174 ) ( AVAILABLE ?auto_4175 ) ( SURFACE-AT ?auto_4172 ?auto_4174 ) ( ON ?auto_4172 ?auto_4176 ) ( CLEAR ?auto_4172 ) ( not ( = ?auto_4171 ?auto_4172 ) ) ( not ( = ?auto_4171 ?auto_4176 ) ) ( not ( = ?auto_4172 ?auto_4176 ) ) ( not ( = ?auto_4177 ?auto_4175 ) ) ( IS-CRATE ?auto_4171 ) ( not ( = ?auto_4194 ?auto_4173 ) ) ( HOIST-AT ?auto_4193 ?auto_4194 ) ( SURFACE-AT ?auto_4171 ?auto_4194 ) ( ON ?auto_4171 ?auto_4191 ) ( CLEAR ?auto_4171 ) ( not ( = ?auto_4170 ?auto_4171 ) ) ( not ( = ?auto_4170 ?auto_4191 ) ) ( not ( = ?auto_4171 ?auto_4191 ) ) ( not ( = ?auto_4177 ?auto_4193 ) ) ( IS-CRATE ?auto_4170 ) ( not ( = ?auto_4192 ?auto_4173 ) ) ( HOIST-AT ?auto_4184 ?auto_4192 ) ( SURFACE-AT ?auto_4170 ?auto_4192 ) ( ON ?auto_4170 ?auto_4181 ) ( CLEAR ?auto_4170 ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( not ( = ?auto_4169 ?auto_4181 ) ) ( not ( = ?auto_4170 ?auto_4181 ) ) ( not ( = ?auto_4177 ?auto_4184 ) ) ( IS-CRATE ?auto_4169 ) ( AVAILABLE ?auto_4193 ) ( SURFACE-AT ?auto_4169 ?auto_4194 ) ( ON ?auto_4169 ?auto_4190 ) ( CLEAR ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4169 ) ) ( not ( = ?auto_4168 ?auto_4190 ) ) ( not ( = ?auto_4169 ?auto_4190 ) ) ( IS-CRATE ?auto_4168 ) ( not ( = ?auto_4195 ?auto_4173 ) ) ( HOIST-AT ?auto_4187 ?auto_4195 ) ( AVAILABLE ?auto_4187 ) ( SURFACE-AT ?auto_4168 ?auto_4195 ) ( ON ?auto_4168 ?auto_4186 ) ( CLEAR ?auto_4168 ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4186 ) ) ( not ( = ?auto_4168 ?auto_4186 ) ) ( not ( = ?auto_4177 ?auto_4187 ) ) ( IS-CRATE ?auto_4167 ) ( not ( = ?auto_4183 ?auto_4173 ) ) ( HOIST-AT ?auto_4189 ?auto_4183 ) ( AVAILABLE ?auto_4189 ) ( SURFACE-AT ?auto_4167 ?auto_4183 ) ( ON ?auto_4167 ?auto_4182 ) ( CLEAR ?auto_4167 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4182 ) ) ( not ( = ?auto_4167 ?auto_4182 ) ) ( not ( = ?auto_4177 ?auto_4189 ) ) ( IS-CRATE ?auto_4166 ) ( not ( = ?auto_4185 ?auto_4173 ) ) ( HOIST-AT ?auto_4188 ?auto_4185 ) ( AVAILABLE ?auto_4188 ) ( SURFACE-AT ?auto_4166 ?auto_4185 ) ( ON ?auto_4166 ?auto_4179 ) ( CLEAR ?auto_4166 ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4179 ) ) ( not ( = ?auto_4166 ?auto_4179 ) ) ( not ( = ?auto_4177 ?auto_4188 ) ) ( SURFACE-AT ?auto_4164 ?auto_4173 ) ( CLEAR ?auto_4164 ) ( IS-CRATE ?auto_4165 ) ( AVAILABLE ?auto_4177 ) ( AVAILABLE ?auto_4184 ) ( SURFACE-AT ?auto_4165 ?auto_4192 ) ( ON ?auto_4165 ?auto_4180 ) ( CLEAR ?auto_4165 ) ( TRUCK-AT ?auto_4178 ?auto_4173 ) ( not ( = ?auto_4164 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4180 ) ) ( not ( = ?auto_4165 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4179 ) ) ( not ( = ?auto_4166 ?auto_4180 ) ) ( not ( = ?auto_4185 ?auto_4192 ) ) ( not ( = ?auto_4188 ?auto_4184 ) ) ( not ( = ?auto_4179 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4164 ?auto_4182 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4165 ?auto_4182 ) ) ( not ( = ?auto_4167 ?auto_4179 ) ) ( not ( = ?auto_4167 ?auto_4180 ) ) ( not ( = ?auto_4183 ?auto_4185 ) ) ( not ( = ?auto_4183 ?auto_4192 ) ) ( not ( = ?auto_4189 ?auto_4188 ) ) ( not ( = ?auto_4189 ?auto_4184 ) ) ( not ( = ?auto_4182 ?auto_4179 ) ) ( not ( = ?auto_4182 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4168 ) ) ( not ( = ?auto_4164 ?auto_4186 ) ) ( not ( = ?auto_4165 ?auto_4168 ) ) ( not ( = ?auto_4165 ?auto_4186 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4186 ) ) ( not ( = ?auto_4168 ?auto_4182 ) ) ( not ( = ?auto_4168 ?auto_4179 ) ) ( not ( = ?auto_4168 ?auto_4180 ) ) ( not ( = ?auto_4195 ?auto_4183 ) ) ( not ( = ?auto_4195 ?auto_4185 ) ) ( not ( = ?auto_4195 ?auto_4192 ) ) ( not ( = ?auto_4187 ?auto_4189 ) ) ( not ( = ?auto_4187 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4184 ) ) ( not ( = ?auto_4186 ?auto_4182 ) ) ( not ( = ?auto_4186 ?auto_4179 ) ) ( not ( = ?auto_4186 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4169 ) ) ( not ( = ?auto_4164 ?auto_4190 ) ) ( not ( = ?auto_4165 ?auto_4169 ) ) ( not ( = ?auto_4165 ?auto_4190 ) ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4190 ) ) ( not ( = ?auto_4167 ?auto_4169 ) ) ( not ( = ?auto_4167 ?auto_4190 ) ) ( not ( = ?auto_4169 ?auto_4186 ) ) ( not ( = ?auto_4169 ?auto_4182 ) ) ( not ( = ?auto_4169 ?auto_4179 ) ) ( not ( = ?auto_4169 ?auto_4180 ) ) ( not ( = ?auto_4194 ?auto_4195 ) ) ( not ( = ?auto_4194 ?auto_4183 ) ) ( not ( = ?auto_4194 ?auto_4185 ) ) ( not ( = ?auto_4194 ?auto_4192 ) ) ( not ( = ?auto_4193 ?auto_4187 ) ) ( not ( = ?auto_4193 ?auto_4189 ) ) ( not ( = ?auto_4193 ?auto_4188 ) ) ( not ( = ?auto_4193 ?auto_4184 ) ) ( not ( = ?auto_4190 ?auto_4186 ) ) ( not ( = ?auto_4190 ?auto_4182 ) ) ( not ( = ?auto_4190 ?auto_4179 ) ) ( not ( = ?auto_4190 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4170 ) ) ( not ( = ?auto_4164 ?auto_4181 ) ) ( not ( = ?auto_4165 ?auto_4170 ) ) ( not ( = ?auto_4165 ?auto_4181 ) ) ( not ( = ?auto_4166 ?auto_4170 ) ) ( not ( = ?auto_4166 ?auto_4181 ) ) ( not ( = ?auto_4167 ?auto_4170 ) ) ( not ( = ?auto_4167 ?auto_4181 ) ) ( not ( = ?auto_4168 ?auto_4170 ) ) ( not ( = ?auto_4168 ?auto_4181 ) ) ( not ( = ?auto_4170 ?auto_4190 ) ) ( not ( = ?auto_4170 ?auto_4186 ) ) ( not ( = ?auto_4170 ?auto_4182 ) ) ( not ( = ?auto_4170 ?auto_4179 ) ) ( not ( = ?auto_4170 ?auto_4180 ) ) ( not ( = ?auto_4181 ?auto_4190 ) ) ( not ( = ?auto_4181 ?auto_4186 ) ) ( not ( = ?auto_4181 ?auto_4182 ) ) ( not ( = ?auto_4181 ?auto_4179 ) ) ( not ( = ?auto_4181 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4171 ) ) ( not ( = ?auto_4164 ?auto_4191 ) ) ( not ( = ?auto_4165 ?auto_4171 ) ) ( not ( = ?auto_4165 ?auto_4191 ) ) ( not ( = ?auto_4166 ?auto_4171 ) ) ( not ( = ?auto_4166 ?auto_4191 ) ) ( not ( = ?auto_4167 ?auto_4171 ) ) ( not ( = ?auto_4167 ?auto_4191 ) ) ( not ( = ?auto_4168 ?auto_4171 ) ) ( not ( = ?auto_4168 ?auto_4191 ) ) ( not ( = ?auto_4169 ?auto_4171 ) ) ( not ( = ?auto_4169 ?auto_4191 ) ) ( not ( = ?auto_4171 ?auto_4181 ) ) ( not ( = ?auto_4171 ?auto_4190 ) ) ( not ( = ?auto_4171 ?auto_4186 ) ) ( not ( = ?auto_4171 ?auto_4182 ) ) ( not ( = ?auto_4171 ?auto_4179 ) ) ( not ( = ?auto_4171 ?auto_4180 ) ) ( not ( = ?auto_4191 ?auto_4181 ) ) ( not ( = ?auto_4191 ?auto_4190 ) ) ( not ( = ?auto_4191 ?auto_4186 ) ) ( not ( = ?auto_4191 ?auto_4182 ) ) ( not ( = ?auto_4191 ?auto_4179 ) ) ( not ( = ?auto_4191 ?auto_4180 ) ) ( not ( = ?auto_4164 ?auto_4172 ) ) ( not ( = ?auto_4164 ?auto_4176 ) ) ( not ( = ?auto_4165 ?auto_4172 ) ) ( not ( = ?auto_4165 ?auto_4176 ) ) ( not ( = ?auto_4166 ?auto_4172 ) ) ( not ( = ?auto_4166 ?auto_4176 ) ) ( not ( = ?auto_4167 ?auto_4172 ) ) ( not ( = ?auto_4167 ?auto_4176 ) ) ( not ( = ?auto_4168 ?auto_4172 ) ) ( not ( = ?auto_4168 ?auto_4176 ) ) ( not ( = ?auto_4169 ?auto_4172 ) ) ( not ( = ?auto_4169 ?auto_4176 ) ) ( not ( = ?auto_4170 ?auto_4172 ) ) ( not ( = ?auto_4170 ?auto_4176 ) ) ( not ( = ?auto_4172 ?auto_4191 ) ) ( not ( = ?auto_4172 ?auto_4181 ) ) ( not ( = ?auto_4172 ?auto_4190 ) ) ( not ( = ?auto_4172 ?auto_4186 ) ) ( not ( = ?auto_4172 ?auto_4182 ) ) ( not ( = ?auto_4172 ?auto_4179 ) ) ( not ( = ?auto_4172 ?auto_4180 ) ) ( not ( = ?auto_4174 ?auto_4194 ) ) ( not ( = ?auto_4174 ?auto_4192 ) ) ( not ( = ?auto_4174 ?auto_4195 ) ) ( not ( = ?auto_4174 ?auto_4183 ) ) ( not ( = ?auto_4174 ?auto_4185 ) ) ( not ( = ?auto_4175 ?auto_4193 ) ) ( not ( = ?auto_4175 ?auto_4184 ) ) ( not ( = ?auto_4175 ?auto_4187 ) ) ( not ( = ?auto_4175 ?auto_4189 ) ) ( not ( = ?auto_4175 ?auto_4188 ) ) ( not ( = ?auto_4176 ?auto_4191 ) ) ( not ( = ?auto_4176 ?auto_4181 ) ) ( not ( = ?auto_4176 ?auto_4190 ) ) ( not ( = ?auto_4176 ?auto_4186 ) ) ( not ( = ?auto_4176 ?auto_4182 ) ) ( not ( = ?auto_4176 ?auto_4179 ) ) ( not ( = ?auto_4176 ?auto_4180 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4164 ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ?auto_4170 ?auto_4171 )
      ( MAKE-1CRATE ?auto_4171 ?auto_4172 )
      ( MAKE-8CRATE-VERIFY ?auto_4164 ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ?auto_4170 ?auto_4171 ?auto_4172 ) )
  )

)

