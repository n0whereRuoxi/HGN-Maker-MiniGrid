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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3928 - SURFACE
      ?auto_3929 - SURFACE
    )
    :vars
    (
      ?auto_3930 - HOIST
      ?auto_3931 - PLACE
      ?auto_3933 - PLACE
      ?auto_3934 - HOIST
      ?auto_3935 - SURFACE
      ?auto_3932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3930 ?auto_3931 ) ( SURFACE-AT ?auto_3928 ?auto_3931 ) ( CLEAR ?auto_3928 ) ( IS-CRATE ?auto_3929 ) ( AVAILABLE ?auto_3930 ) ( not ( = ?auto_3933 ?auto_3931 ) ) ( HOIST-AT ?auto_3934 ?auto_3933 ) ( AVAILABLE ?auto_3934 ) ( SURFACE-AT ?auto_3929 ?auto_3933 ) ( ON ?auto_3929 ?auto_3935 ) ( CLEAR ?auto_3929 ) ( TRUCK-AT ?auto_3932 ?auto_3931 ) ( not ( = ?auto_3928 ?auto_3929 ) ) ( not ( = ?auto_3928 ?auto_3935 ) ) ( not ( = ?auto_3929 ?auto_3935 ) ) ( not ( = ?auto_3930 ?auto_3934 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3932 ?auto_3931 ?auto_3933 )
      ( !LIFT ?auto_3934 ?auto_3929 ?auto_3935 ?auto_3933 )
      ( !LOAD ?auto_3934 ?auto_3929 ?auto_3932 ?auto_3933 )
      ( !DRIVE ?auto_3932 ?auto_3933 ?auto_3931 )
      ( !UNLOAD ?auto_3930 ?auto_3929 ?auto_3932 ?auto_3931 )
      ( !DROP ?auto_3930 ?auto_3929 ?auto_3928 ?auto_3931 )
      ( MAKE-1CRATE-VERIFY ?auto_3928 ?auto_3929 ) )
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
      ?auto_3944 - PLACE
      ?auto_3943 - PLACE
      ?auto_3947 - HOIST
      ?auto_3942 - SURFACE
      ?auto_3949 - PLACE
      ?auto_3950 - HOIST
      ?auto_3948 - SURFACE
      ?auto_3945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3946 ?auto_3944 ) ( IS-CRATE ?auto_3941 ) ( not ( = ?auto_3943 ?auto_3944 ) ) ( HOIST-AT ?auto_3947 ?auto_3943 ) ( AVAILABLE ?auto_3947 ) ( SURFACE-AT ?auto_3941 ?auto_3943 ) ( ON ?auto_3941 ?auto_3942 ) ( CLEAR ?auto_3941 ) ( not ( = ?auto_3940 ?auto_3941 ) ) ( not ( = ?auto_3940 ?auto_3942 ) ) ( not ( = ?auto_3941 ?auto_3942 ) ) ( not ( = ?auto_3946 ?auto_3947 ) ) ( SURFACE-AT ?auto_3939 ?auto_3944 ) ( CLEAR ?auto_3939 ) ( IS-CRATE ?auto_3940 ) ( AVAILABLE ?auto_3946 ) ( not ( = ?auto_3949 ?auto_3944 ) ) ( HOIST-AT ?auto_3950 ?auto_3949 ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3940 ?auto_3949 ) ( ON ?auto_3940 ?auto_3948 ) ( CLEAR ?auto_3940 ) ( TRUCK-AT ?auto_3945 ?auto_3944 ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3948 ) ) ( not ( = ?auto_3940 ?auto_3948 ) ) ( not ( = ?auto_3946 ?auto_3950 ) ) ( not ( = ?auto_3939 ?auto_3941 ) ) ( not ( = ?auto_3939 ?auto_3942 ) ) ( not ( = ?auto_3941 ?auto_3948 ) ) ( not ( = ?auto_3943 ?auto_3949 ) ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3942 ?auto_3948 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3939 ?auto_3940 )
      ( MAKE-1CRATE ?auto_3940 ?auto_3941 )
      ( MAKE-2CRATE-VERIFY ?auto_3939 ?auto_3940 ?auto_3941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3953 - SURFACE
      ?auto_3954 - SURFACE
    )
    :vars
    (
      ?auto_3955 - HOIST
      ?auto_3956 - PLACE
      ?auto_3958 - PLACE
      ?auto_3959 - HOIST
      ?auto_3960 - SURFACE
      ?auto_3957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3955 ?auto_3956 ) ( SURFACE-AT ?auto_3953 ?auto_3956 ) ( CLEAR ?auto_3953 ) ( IS-CRATE ?auto_3954 ) ( AVAILABLE ?auto_3955 ) ( not ( = ?auto_3958 ?auto_3956 ) ) ( HOIST-AT ?auto_3959 ?auto_3958 ) ( AVAILABLE ?auto_3959 ) ( SURFACE-AT ?auto_3954 ?auto_3958 ) ( ON ?auto_3954 ?auto_3960 ) ( CLEAR ?auto_3954 ) ( TRUCK-AT ?auto_3957 ?auto_3956 ) ( not ( = ?auto_3953 ?auto_3954 ) ) ( not ( = ?auto_3953 ?auto_3960 ) ) ( not ( = ?auto_3954 ?auto_3960 ) ) ( not ( = ?auto_3955 ?auto_3959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3957 ?auto_3956 ?auto_3958 )
      ( !LIFT ?auto_3959 ?auto_3954 ?auto_3960 ?auto_3958 )
      ( !LOAD ?auto_3959 ?auto_3954 ?auto_3957 ?auto_3958 )
      ( !DRIVE ?auto_3957 ?auto_3958 ?auto_3956 )
      ( !UNLOAD ?auto_3955 ?auto_3954 ?auto_3957 ?auto_3956 )
      ( !DROP ?auto_3955 ?auto_3954 ?auto_3953 ?auto_3956 )
      ( MAKE-1CRATE-VERIFY ?auto_3953 ?auto_3954 ) )
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
      ?auto_3971 - HOIST
      ?auto_3970 - PLACE
      ?auto_3969 - PLACE
      ?auto_3972 - HOIST
      ?auto_3974 - SURFACE
      ?auto_3975 - PLACE
      ?auto_3976 - HOIST
      ?auto_3977 - SURFACE
      ?auto_3978 - PLACE
      ?auto_3979 - HOIST
      ?auto_3980 - SURFACE
      ?auto_3973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3971 ?auto_3970 ) ( IS-CRATE ?auto_3968 ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( HOIST-AT ?auto_3972 ?auto_3969 ) ( AVAILABLE ?auto_3972 ) ( SURFACE-AT ?auto_3968 ?auto_3969 ) ( ON ?auto_3968 ?auto_3974 ) ( CLEAR ?auto_3968 ) ( not ( = ?auto_3967 ?auto_3968 ) ) ( not ( = ?auto_3967 ?auto_3974 ) ) ( not ( = ?auto_3968 ?auto_3974 ) ) ( not ( = ?auto_3971 ?auto_3972 ) ) ( IS-CRATE ?auto_3967 ) ( not ( = ?auto_3975 ?auto_3970 ) ) ( HOIST-AT ?auto_3976 ?auto_3975 ) ( AVAILABLE ?auto_3976 ) ( SURFACE-AT ?auto_3967 ?auto_3975 ) ( ON ?auto_3967 ?auto_3977 ) ( CLEAR ?auto_3967 ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( not ( = ?auto_3966 ?auto_3977 ) ) ( not ( = ?auto_3967 ?auto_3977 ) ) ( not ( = ?auto_3971 ?auto_3976 ) ) ( SURFACE-AT ?auto_3965 ?auto_3970 ) ( CLEAR ?auto_3965 ) ( IS-CRATE ?auto_3966 ) ( AVAILABLE ?auto_3971 ) ( not ( = ?auto_3978 ?auto_3970 ) ) ( HOIST-AT ?auto_3979 ?auto_3978 ) ( AVAILABLE ?auto_3979 ) ( SURFACE-AT ?auto_3966 ?auto_3978 ) ( ON ?auto_3966 ?auto_3980 ) ( CLEAR ?auto_3966 ) ( TRUCK-AT ?auto_3973 ?auto_3970 ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3980 ) ) ( not ( = ?auto_3966 ?auto_3980 ) ) ( not ( = ?auto_3971 ?auto_3979 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3965 ?auto_3977 ) ) ( not ( = ?auto_3967 ?auto_3980 ) ) ( not ( = ?auto_3975 ?auto_3978 ) ) ( not ( = ?auto_3976 ?auto_3979 ) ) ( not ( = ?auto_3977 ?auto_3980 ) ) ( not ( = ?auto_3965 ?auto_3968 ) ) ( not ( = ?auto_3965 ?auto_3974 ) ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( not ( = ?auto_3966 ?auto_3974 ) ) ( not ( = ?auto_3968 ?auto_3977 ) ) ( not ( = ?auto_3968 ?auto_3980 ) ) ( not ( = ?auto_3969 ?auto_3975 ) ) ( not ( = ?auto_3969 ?auto_3978 ) ) ( not ( = ?auto_3972 ?auto_3976 ) ) ( not ( = ?auto_3972 ?auto_3979 ) ) ( not ( = ?auto_3974 ?auto_3977 ) ) ( not ( = ?auto_3974 ?auto_3980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3965 ?auto_3966 ?auto_3967 )
      ( MAKE-1CRATE ?auto_3967 ?auto_3968 )
      ( MAKE-3CRATE-VERIFY ?auto_3965 ?auto_3966 ?auto_3967 ?auto_3968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3983 - SURFACE
      ?auto_3984 - SURFACE
    )
    :vars
    (
      ?auto_3985 - HOIST
      ?auto_3986 - PLACE
      ?auto_3988 - PLACE
      ?auto_3989 - HOIST
      ?auto_3990 - SURFACE
      ?auto_3987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3985 ?auto_3986 ) ( SURFACE-AT ?auto_3983 ?auto_3986 ) ( CLEAR ?auto_3983 ) ( IS-CRATE ?auto_3984 ) ( AVAILABLE ?auto_3985 ) ( not ( = ?auto_3988 ?auto_3986 ) ) ( HOIST-AT ?auto_3989 ?auto_3988 ) ( AVAILABLE ?auto_3989 ) ( SURFACE-AT ?auto_3984 ?auto_3988 ) ( ON ?auto_3984 ?auto_3990 ) ( CLEAR ?auto_3984 ) ( TRUCK-AT ?auto_3987 ?auto_3986 ) ( not ( = ?auto_3983 ?auto_3984 ) ) ( not ( = ?auto_3983 ?auto_3990 ) ) ( not ( = ?auto_3984 ?auto_3990 ) ) ( not ( = ?auto_3985 ?auto_3989 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3987 ?auto_3986 ?auto_3988 )
      ( !LIFT ?auto_3989 ?auto_3984 ?auto_3990 ?auto_3988 )
      ( !LOAD ?auto_3989 ?auto_3984 ?auto_3987 ?auto_3988 )
      ( !DRIVE ?auto_3987 ?auto_3988 ?auto_3986 )
      ( !UNLOAD ?auto_3985 ?auto_3984 ?auto_3987 ?auto_3986 )
      ( !DROP ?auto_3985 ?auto_3984 ?auto_3983 ?auto_3986 )
      ( MAKE-1CRATE-VERIFY ?auto_3983 ?auto_3984 ) )
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
      ?auto_4005 - HOIST
      ?auto_4001 - PLACE
      ?auto_4002 - PLACE
      ?auto_4006 - HOIST
      ?auto_4004 - SURFACE
      ?auto_4010 - PLACE
      ?auto_4013 - HOIST
      ?auto_4014 - SURFACE
      ?auto_4012 - PLACE
      ?auto_4015 - HOIST
      ?auto_4008 - SURFACE
      ?auto_4011 - PLACE
      ?auto_4009 - HOIST
      ?auto_4007 - SURFACE
      ?auto_4003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4005 ?auto_4001 ) ( IS-CRATE ?auto_4000 ) ( not ( = ?auto_4002 ?auto_4001 ) ) ( HOIST-AT ?auto_4006 ?auto_4002 ) ( AVAILABLE ?auto_4006 ) ( SURFACE-AT ?auto_4000 ?auto_4002 ) ( ON ?auto_4000 ?auto_4004 ) ( CLEAR ?auto_4000 ) ( not ( = ?auto_3999 ?auto_4000 ) ) ( not ( = ?auto_3999 ?auto_4004 ) ) ( not ( = ?auto_4000 ?auto_4004 ) ) ( not ( = ?auto_4005 ?auto_4006 ) ) ( IS-CRATE ?auto_3999 ) ( not ( = ?auto_4010 ?auto_4001 ) ) ( HOIST-AT ?auto_4013 ?auto_4010 ) ( AVAILABLE ?auto_4013 ) ( SURFACE-AT ?auto_3999 ?auto_4010 ) ( ON ?auto_3999 ?auto_4014 ) ( CLEAR ?auto_3999 ) ( not ( = ?auto_3998 ?auto_3999 ) ) ( not ( = ?auto_3998 ?auto_4014 ) ) ( not ( = ?auto_3999 ?auto_4014 ) ) ( not ( = ?auto_4005 ?auto_4013 ) ) ( IS-CRATE ?auto_3998 ) ( not ( = ?auto_4012 ?auto_4001 ) ) ( HOIST-AT ?auto_4015 ?auto_4012 ) ( AVAILABLE ?auto_4015 ) ( SURFACE-AT ?auto_3998 ?auto_4012 ) ( ON ?auto_3998 ?auto_4008 ) ( CLEAR ?auto_3998 ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_4008 ) ) ( not ( = ?auto_3998 ?auto_4008 ) ) ( not ( = ?auto_4005 ?auto_4015 ) ) ( SURFACE-AT ?auto_3996 ?auto_4001 ) ( CLEAR ?auto_3996 ) ( IS-CRATE ?auto_3997 ) ( AVAILABLE ?auto_4005 ) ( not ( = ?auto_4011 ?auto_4001 ) ) ( HOIST-AT ?auto_4009 ?auto_4011 ) ( AVAILABLE ?auto_4009 ) ( SURFACE-AT ?auto_3997 ?auto_4011 ) ( ON ?auto_3997 ?auto_4007 ) ( CLEAR ?auto_3997 ) ( TRUCK-AT ?auto_4003 ?auto_4001 ) ( not ( = ?auto_3996 ?auto_3997 ) ) ( not ( = ?auto_3996 ?auto_4007 ) ) ( not ( = ?auto_3997 ?auto_4007 ) ) ( not ( = ?auto_4005 ?auto_4009 ) ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3996 ?auto_4008 ) ) ( not ( = ?auto_3998 ?auto_4007 ) ) ( not ( = ?auto_4012 ?auto_4011 ) ) ( not ( = ?auto_4015 ?auto_4009 ) ) ( not ( = ?auto_4008 ?auto_4007 ) ) ( not ( = ?auto_3996 ?auto_3999 ) ) ( not ( = ?auto_3996 ?auto_4014 ) ) ( not ( = ?auto_3997 ?auto_3999 ) ) ( not ( = ?auto_3997 ?auto_4014 ) ) ( not ( = ?auto_3999 ?auto_4008 ) ) ( not ( = ?auto_3999 ?auto_4007 ) ) ( not ( = ?auto_4010 ?auto_4012 ) ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( not ( = ?auto_4013 ?auto_4015 ) ) ( not ( = ?auto_4013 ?auto_4009 ) ) ( not ( = ?auto_4014 ?auto_4008 ) ) ( not ( = ?auto_4014 ?auto_4007 ) ) ( not ( = ?auto_3996 ?auto_4000 ) ) ( not ( = ?auto_3996 ?auto_4004 ) ) ( not ( = ?auto_3997 ?auto_4000 ) ) ( not ( = ?auto_3997 ?auto_4004 ) ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_3998 ?auto_4004 ) ) ( not ( = ?auto_4000 ?auto_4014 ) ) ( not ( = ?auto_4000 ?auto_4008 ) ) ( not ( = ?auto_4000 ?auto_4007 ) ) ( not ( = ?auto_4002 ?auto_4010 ) ) ( not ( = ?auto_4002 ?auto_4012 ) ) ( not ( = ?auto_4002 ?auto_4011 ) ) ( not ( = ?auto_4006 ?auto_4013 ) ) ( not ( = ?auto_4006 ?auto_4015 ) ) ( not ( = ?auto_4006 ?auto_4009 ) ) ( not ( = ?auto_4004 ?auto_4014 ) ) ( not ( = ?auto_4004 ?auto_4008 ) ) ( not ( = ?auto_4004 ?auto_4007 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3996 ?auto_3997 ?auto_3998 ?auto_3999 )
      ( MAKE-1CRATE ?auto_3999 ?auto_4000 )
      ( MAKE-4CRATE-VERIFY ?auto_3996 ?auto_3997 ?auto_3998 ?auto_3999 ?auto_4000 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4018 - SURFACE
      ?auto_4019 - SURFACE
    )
    :vars
    (
      ?auto_4020 - HOIST
      ?auto_4021 - PLACE
      ?auto_4023 - PLACE
      ?auto_4024 - HOIST
      ?auto_4025 - SURFACE
      ?auto_4022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4020 ?auto_4021 ) ( SURFACE-AT ?auto_4018 ?auto_4021 ) ( CLEAR ?auto_4018 ) ( IS-CRATE ?auto_4019 ) ( AVAILABLE ?auto_4020 ) ( not ( = ?auto_4023 ?auto_4021 ) ) ( HOIST-AT ?auto_4024 ?auto_4023 ) ( AVAILABLE ?auto_4024 ) ( SURFACE-AT ?auto_4019 ?auto_4023 ) ( ON ?auto_4019 ?auto_4025 ) ( CLEAR ?auto_4019 ) ( TRUCK-AT ?auto_4022 ?auto_4021 ) ( not ( = ?auto_4018 ?auto_4019 ) ) ( not ( = ?auto_4018 ?auto_4025 ) ) ( not ( = ?auto_4019 ?auto_4025 ) ) ( not ( = ?auto_4020 ?auto_4024 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4022 ?auto_4021 ?auto_4023 )
      ( !LIFT ?auto_4024 ?auto_4019 ?auto_4025 ?auto_4023 )
      ( !LOAD ?auto_4024 ?auto_4019 ?auto_4022 ?auto_4023 )
      ( !DRIVE ?auto_4022 ?auto_4023 ?auto_4021 )
      ( !UNLOAD ?auto_4020 ?auto_4019 ?auto_4022 ?auto_4021 )
      ( !DROP ?auto_4020 ?auto_4019 ?auto_4018 ?auto_4021 )
      ( MAKE-1CRATE-VERIFY ?auto_4018 ?auto_4019 ) )
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
      ?auto_4039 - HOIST
      ?auto_4043 - PLACE
      ?auto_4042 - PLACE
      ?auto_4040 - HOIST
      ?auto_4038 - SURFACE
      ?auto_4045 - PLACE
      ?auto_4054 - HOIST
      ?auto_4044 - SURFACE
      ?auto_4052 - PLACE
      ?auto_4046 - HOIST
      ?auto_4047 - SURFACE
      ?auto_4055 - PLACE
      ?auto_4049 - HOIST
      ?auto_4050 - SURFACE
      ?auto_4051 - PLACE
      ?auto_4048 - HOIST
      ?auto_4053 - SURFACE
      ?auto_4041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4039 ?auto_4043 ) ( IS-CRATE ?auto_4037 ) ( not ( = ?auto_4042 ?auto_4043 ) ) ( HOIST-AT ?auto_4040 ?auto_4042 ) ( AVAILABLE ?auto_4040 ) ( SURFACE-AT ?auto_4037 ?auto_4042 ) ( ON ?auto_4037 ?auto_4038 ) ( CLEAR ?auto_4037 ) ( not ( = ?auto_4036 ?auto_4037 ) ) ( not ( = ?auto_4036 ?auto_4038 ) ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( IS-CRATE ?auto_4036 ) ( not ( = ?auto_4045 ?auto_4043 ) ) ( HOIST-AT ?auto_4054 ?auto_4045 ) ( AVAILABLE ?auto_4054 ) ( SURFACE-AT ?auto_4036 ?auto_4045 ) ( ON ?auto_4036 ?auto_4044 ) ( CLEAR ?auto_4036 ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( not ( = ?auto_4035 ?auto_4044 ) ) ( not ( = ?auto_4036 ?auto_4044 ) ) ( not ( = ?auto_4039 ?auto_4054 ) ) ( IS-CRATE ?auto_4035 ) ( not ( = ?auto_4052 ?auto_4043 ) ) ( HOIST-AT ?auto_4046 ?auto_4052 ) ( AVAILABLE ?auto_4046 ) ( SURFACE-AT ?auto_4035 ?auto_4052 ) ( ON ?auto_4035 ?auto_4047 ) ( CLEAR ?auto_4035 ) ( not ( = ?auto_4034 ?auto_4035 ) ) ( not ( = ?auto_4034 ?auto_4047 ) ) ( not ( = ?auto_4035 ?auto_4047 ) ) ( not ( = ?auto_4039 ?auto_4046 ) ) ( IS-CRATE ?auto_4034 ) ( not ( = ?auto_4055 ?auto_4043 ) ) ( HOIST-AT ?auto_4049 ?auto_4055 ) ( AVAILABLE ?auto_4049 ) ( SURFACE-AT ?auto_4034 ?auto_4055 ) ( ON ?auto_4034 ?auto_4050 ) ( CLEAR ?auto_4034 ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( not ( = ?auto_4033 ?auto_4050 ) ) ( not ( = ?auto_4034 ?auto_4050 ) ) ( not ( = ?auto_4039 ?auto_4049 ) ) ( SURFACE-AT ?auto_4032 ?auto_4043 ) ( CLEAR ?auto_4032 ) ( IS-CRATE ?auto_4033 ) ( AVAILABLE ?auto_4039 ) ( not ( = ?auto_4051 ?auto_4043 ) ) ( HOIST-AT ?auto_4048 ?auto_4051 ) ( AVAILABLE ?auto_4048 ) ( SURFACE-AT ?auto_4033 ?auto_4051 ) ( ON ?auto_4033 ?auto_4053 ) ( CLEAR ?auto_4033 ) ( TRUCK-AT ?auto_4041 ?auto_4043 ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4032 ?auto_4053 ) ) ( not ( = ?auto_4033 ?auto_4053 ) ) ( not ( = ?auto_4039 ?auto_4048 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( not ( = ?auto_4032 ?auto_4050 ) ) ( not ( = ?auto_4034 ?auto_4053 ) ) ( not ( = ?auto_4055 ?auto_4051 ) ) ( not ( = ?auto_4049 ?auto_4048 ) ) ( not ( = ?auto_4050 ?auto_4053 ) ) ( not ( = ?auto_4032 ?auto_4035 ) ) ( not ( = ?auto_4032 ?auto_4047 ) ) ( not ( = ?auto_4033 ?auto_4035 ) ) ( not ( = ?auto_4033 ?auto_4047 ) ) ( not ( = ?auto_4035 ?auto_4050 ) ) ( not ( = ?auto_4035 ?auto_4053 ) ) ( not ( = ?auto_4052 ?auto_4055 ) ) ( not ( = ?auto_4052 ?auto_4051 ) ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4050 ) ) ( not ( = ?auto_4047 ?auto_4053 ) ) ( not ( = ?auto_4032 ?auto_4036 ) ) ( not ( = ?auto_4032 ?auto_4044 ) ) ( not ( = ?auto_4033 ?auto_4036 ) ) ( not ( = ?auto_4033 ?auto_4044 ) ) ( not ( = ?auto_4034 ?auto_4036 ) ) ( not ( = ?auto_4034 ?auto_4044 ) ) ( not ( = ?auto_4036 ?auto_4047 ) ) ( not ( = ?auto_4036 ?auto_4050 ) ) ( not ( = ?auto_4036 ?auto_4053 ) ) ( not ( = ?auto_4045 ?auto_4052 ) ) ( not ( = ?auto_4045 ?auto_4055 ) ) ( not ( = ?auto_4045 ?auto_4051 ) ) ( not ( = ?auto_4054 ?auto_4046 ) ) ( not ( = ?auto_4054 ?auto_4049 ) ) ( not ( = ?auto_4054 ?auto_4048 ) ) ( not ( = ?auto_4044 ?auto_4047 ) ) ( not ( = ?auto_4044 ?auto_4050 ) ) ( not ( = ?auto_4044 ?auto_4053 ) ) ( not ( = ?auto_4032 ?auto_4037 ) ) ( not ( = ?auto_4032 ?auto_4038 ) ) ( not ( = ?auto_4033 ?auto_4037 ) ) ( not ( = ?auto_4033 ?auto_4038 ) ) ( not ( = ?auto_4034 ?auto_4037 ) ) ( not ( = ?auto_4034 ?auto_4038 ) ) ( not ( = ?auto_4035 ?auto_4037 ) ) ( not ( = ?auto_4035 ?auto_4038 ) ) ( not ( = ?auto_4037 ?auto_4044 ) ) ( not ( = ?auto_4037 ?auto_4047 ) ) ( not ( = ?auto_4037 ?auto_4050 ) ) ( not ( = ?auto_4037 ?auto_4053 ) ) ( not ( = ?auto_4042 ?auto_4045 ) ) ( not ( = ?auto_4042 ?auto_4052 ) ) ( not ( = ?auto_4042 ?auto_4055 ) ) ( not ( = ?auto_4042 ?auto_4051 ) ) ( not ( = ?auto_4040 ?auto_4054 ) ) ( not ( = ?auto_4040 ?auto_4046 ) ) ( not ( = ?auto_4040 ?auto_4049 ) ) ( not ( = ?auto_4040 ?auto_4048 ) ) ( not ( = ?auto_4038 ?auto_4044 ) ) ( not ( = ?auto_4038 ?auto_4047 ) ) ( not ( = ?auto_4038 ?auto_4050 ) ) ( not ( = ?auto_4038 ?auto_4053 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4032 ?auto_4033 ?auto_4034 ?auto_4035 ?auto_4036 )
      ( MAKE-1CRATE ?auto_4036 ?auto_4037 )
      ( MAKE-5CRATE-VERIFY ?auto_4032 ?auto_4033 ?auto_4034 ?auto_4035 ?auto_4036 ?auto_4037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4058 - SURFACE
      ?auto_4059 - SURFACE
    )
    :vars
    (
      ?auto_4060 - HOIST
      ?auto_4061 - PLACE
      ?auto_4063 - PLACE
      ?auto_4064 - HOIST
      ?auto_4065 - SURFACE
      ?auto_4062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4060 ?auto_4061 ) ( SURFACE-AT ?auto_4058 ?auto_4061 ) ( CLEAR ?auto_4058 ) ( IS-CRATE ?auto_4059 ) ( AVAILABLE ?auto_4060 ) ( not ( = ?auto_4063 ?auto_4061 ) ) ( HOIST-AT ?auto_4064 ?auto_4063 ) ( AVAILABLE ?auto_4064 ) ( SURFACE-AT ?auto_4059 ?auto_4063 ) ( ON ?auto_4059 ?auto_4065 ) ( CLEAR ?auto_4059 ) ( TRUCK-AT ?auto_4062 ?auto_4061 ) ( not ( = ?auto_4058 ?auto_4059 ) ) ( not ( = ?auto_4058 ?auto_4065 ) ) ( not ( = ?auto_4059 ?auto_4065 ) ) ( not ( = ?auto_4060 ?auto_4064 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4062 ?auto_4061 ?auto_4063 )
      ( !LIFT ?auto_4064 ?auto_4059 ?auto_4065 ?auto_4063 )
      ( !LOAD ?auto_4064 ?auto_4059 ?auto_4062 ?auto_4063 )
      ( !DRIVE ?auto_4062 ?auto_4063 ?auto_4061 )
      ( !UNLOAD ?auto_4060 ?auto_4059 ?auto_4062 ?auto_4061 )
      ( !DROP ?auto_4060 ?auto_4059 ?auto_4058 ?auto_4061 )
      ( MAKE-1CRATE-VERIFY ?auto_4058 ?auto_4059 ) )
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
      ?auto_4082 - HOIST
      ?auto_4081 - PLACE
      ?auto_4083 - PLACE
      ?auto_4084 - HOIST
      ?auto_4085 - SURFACE
      ?auto_4087 - PLACE
      ?auto_4096 - HOIST
      ?auto_4086 - SURFACE
      ?auto_4089 - PLACE
      ?auto_4095 - HOIST
      ?auto_4088 - SURFACE
      ?auto_4098 - PLACE
      ?auto_4093 - HOIST
      ?auto_4094 - SURFACE
      ?auto_4097 - PLACE
      ?auto_4091 - HOIST
      ?auto_4092 - SURFACE
      ?auto_4090 - SURFACE
      ?auto_4080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4082 ?auto_4081 ) ( IS-CRATE ?auto_4079 ) ( not ( = ?auto_4083 ?auto_4081 ) ) ( HOIST-AT ?auto_4084 ?auto_4083 ) ( SURFACE-AT ?auto_4079 ?auto_4083 ) ( ON ?auto_4079 ?auto_4085 ) ( CLEAR ?auto_4079 ) ( not ( = ?auto_4078 ?auto_4079 ) ) ( not ( = ?auto_4078 ?auto_4085 ) ) ( not ( = ?auto_4079 ?auto_4085 ) ) ( not ( = ?auto_4082 ?auto_4084 ) ) ( IS-CRATE ?auto_4078 ) ( not ( = ?auto_4087 ?auto_4081 ) ) ( HOIST-AT ?auto_4096 ?auto_4087 ) ( AVAILABLE ?auto_4096 ) ( SURFACE-AT ?auto_4078 ?auto_4087 ) ( ON ?auto_4078 ?auto_4086 ) ( CLEAR ?auto_4078 ) ( not ( = ?auto_4077 ?auto_4078 ) ) ( not ( = ?auto_4077 ?auto_4086 ) ) ( not ( = ?auto_4078 ?auto_4086 ) ) ( not ( = ?auto_4082 ?auto_4096 ) ) ( IS-CRATE ?auto_4077 ) ( not ( = ?auto_4089 ?auto_4081 ) ) ( HOIST-AT ?auto_4095 ?auto_4089 ) ( AVAILABLE ?auto_4095 ) ( SURFACE-AT ?auto_4077 ?auto_4089 ) ( ON ?auto_4077 ?auto_4088 ) ( CLEAR ?auto_4077 ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4088 ) ) ( not ( = ?auto_4077 ?auto_4088 ) ) ( not ( = ?auto_4082 ?auto_4095 ) ) ( IS-CRATE ?auto_4076 ) ( not ( = ?auto_4098 ?auto_4081 ) ) ( HOIST-AT ?auto_4093 ?auto_4098 ) ( AVAILABLE ?auto_4093 ) ( SURFACE-AT ?auto_4076 ?auto_4098 ) ( ON ?auto_4076 ?auto_4094 ) ( CLEAR ?auto_4076 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4094 ) ) ( not ( = ?auto_4076 ?auto_4094 ) ) ( not ( = ?auto_4082 ?auto_4093 ) ) ( IS-CRATE ?auto_4075 ) ( not ( = ?auto_4097 ?auto_4081 ) ) ( HOIST-AT ?auto_4091 ?auto_4097 ) ( AVAILABLE ?auto_4091 ) ( SURFACE-AT ?auto_4075 ?auto_4097 ) ( ON ?auto_4075 ?auto_4092 ) ( CLEAR ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( not ( = ?auto_4074 ?auto_4092 ) ) ( not ( = ?auto_4075 ?auto_4092 ) ) ( not ( = ?auto_4082 ?auto_4091 ) ) ( SURFACE-AT ?auto_4073 ?auto_4081 ) ( CLEAR ?auto_4073 ) ( IS-CRATE ?auto_4074 ) ( AVAILABLE ?auto_4082 ) ( AVAILABLE ?auto_4084 ) ( SURFACE-AT ?auto_4074 ?auto_4083 ) ( ON ?auto_4074 ?auto_4090 ) ( CLEAR ?auto_4074 ) ( TRUCK-AT ?auto_4080 ?auto_4081 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4090 ) ) ( not ( = ?auto_4074 ?auto_4090 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( not ( = ?auto_4073 ?auto_4092 ) ) ( not ( = ?auto_4075 ?auto_4090 ) ) ( not ( = ?auto_4097 ?auto_4083 ) ) ( not ( = ?auto_4091 ?auto_4084 ) ) ( not ( = ?auto_4092 ?auto_4090 ) ) ( not ( = ?auto_4073 ?auto_4076 ) ) ( not ( = ?auto_4073 ?auto_4094 ) ) ( not ( = ?auto_4074 ?auto_4076 ) ) ( not ( = ?auto_4074 ?auto_4094 ) ) ( not ( = ?auto_4076 ?auto_4092 ) ) ( not ( = ?auto_4076 ?auto_4090 ) ) ( not ( = ?auto_4098 ?auto_4097 ) ) ( not ( = ?auto_4098 ?auto_4083 ) ) ( not ( = ?auto_4093 ?auto_4091 ) ) ( not ( = ?auto_4093 ?auto_4084 ) ) ( not ( = ?auto_4094 ?auto_4092 ) ) ( not ( = ?auto_4094 ?auto_4090 ) ) ( not ( = ?auto_4073 ?auto_4077 ) ) ( not ( = ?auto_4073 ?auto_4088 ) ) ( not ( = ?auto_4074 ?auto_4077 ) ) ( not ( = ?auto_4074 ?auto_4088 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4075 ?auto_4088 ) ) ( not ( = ?auto_4077 ?auto_4094 ) ) ( not ( = ?auto_4077 ?auto_4092 ) ) ( not ( = ?auto_4077 ?auto_4090 ) ) ( not ( = ?auto_4089 ?auto_4098 ) ) ( not ( = ?auto_4089 ?auto_4097 ) ) ( not ( = ?auto_4089 ?auto_4083 ) ) ( not ( = ?auto_4095 ?auto_4093 ) ) ( not ( = ?auto_4095 ?auto_4091 ) ) ( not ( = ?auto_4095 ?auto_4084 ) ) ( not ( = ?auto_4088 ?auto_4094 ) ) ( not ( = ?auto_4088 ?auto_4092 ) ) ( not ( = ?auto_4088 ?auto_4090 ) ) ( not ( = ?auto_4073 ?auto_4078 ) ) ( not ( = ?auto_4073 ?auto_4086 ) ) ( not ( = ?auto_4074 ?auto_4078 ) ) ( not ( = ?auto_4074 ?auto_4086 ) ) ( not ( = ?auto_4075 ?auto_4078 ) ) ( not ( = ?auto_4075 ?auto_4086 ) ) ( not ( = ?auto_4076 ?auto_4078 ) ) ( not ( = ?auto_4076 ?auto_4086 ) ) ( not ( = ?auto_4078 ?auto_4088 ) ) ( not ( = ?auto_4078 ?auto_4094 ) ) ( not ( = ?auto_4078 ?auto_4092 ) ) ( not ( = ?auto_4078 ?auto_4090 ) ) ( not ( = ?auto_4087 ?auto_4089 ) ) ( not ( = ?auto_4087 ?auto_4098 ) ) ( not ( = ?auto_4087 ?auto_4097 ) ) ( not ( = ?auto_4087 ?auto_4083 ) ) ( not ( = ?auto_4096 ?auto_4095 ) ) ( not ( = ?auto_4096 ?auto_4093 ) ) ( not ( = ?auto_4096 ?auto_4091 ) ) ( not ( = ?auto_4096 ?auto_4084 ) ) ( not ( = ?auto_4086 ?auto_4088 ) ) ( not ( = ?auto_4086 ?auto_4094 ) ) ( not ( = ?auto_4086 ?auto_4092 ) ) ( not ( = ?auto_4086 ?auto_4090 ) ) ( not ( = ?auto_4073 ?auto_4079 ) ) ( not ( = ?auto_4073 ?auto_4085 ) ) ( not ( = ?auto_4074 ?auto_4079 ) ) ( not ( = ?auto_4074 ?auto_4085 ) ) ( not ( = ?auto_4075 ?auto_4079 ) ) ( not ( = ?auto_4075 ?auto_4085 ) ) ( not ( = ?auto_4076 ?auto_4079 ) ) ( not ( = ?auto_4076 ?auto_4085 ) ) ( not ( = ?auto_4077 ?auto_4079 ) ) ( not ( = ?auto_4077 ?auto_4085 ) ) ( not ( = ?auto_4079 ?auto_4086 ) ) ( not ( = ?auto_4079 ?auto_4088 ) ) ( not ( = ?auto_4079 ?auto_4094 ) ) ( not ( = ?auto_4079 ?auto_4092 ) ) ( not ( = ?auto_4079 ?auto_4090 ) ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( not ( = ?auto_4085 ?auto_4088 ) ) ( not ( = ?auto_4085 ?auto_4094 ) ) ( not ( = ?auto_4085 ?auto_4092 ) ) ( not ( = ?auto_4085 ?auto_4090 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4073 ?auto_4074 ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4078 )
      ( MAKE-1CRATE ?auto_4078 ?auto_4079 )
      ( MAKE-6CRATE-VERIFY ?auto_4073 ?auto_4074 ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4078 ?auto_4079 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4101 - SURFACE
      ?auto_4102 - SURFACE
    )
    :vars
    (
      ?auto_4103 - HOIST
      ?auto_4104 - PLACE
      ?auto_4106 - PLACE
      ?auto_4107 - HOIST
      ?auto_4108 - SURFACE
      ?auto_4105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4103 ?auto_4104 ) ( SURFACE-AT ?auto_4101 ?auto_4104 ) ( CLEAR ?auto_4101 ) ( IS-CRATE ?auto_4102 ) ( AVAILABLE ?auto_4103 ) ( not ( = ?auto_4106 ?auto_4104 ) ) ( HOIST-AT ?auto_4107 ?auto_4106 ) ( AVAILABLE ?auto_4107 ) ( SURFACE-AT ?auto_4102 ?auto_4106 ) ( ON ?auto_4102 ?auto_4108 ) ( CLEAR ?auto_4102 ) ( TRUCK-AT ?auto_4105 ?auto_4104 ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( not ( = ?auto_4101 ?auto_4108 ) ) ( not ( = ?auto_4102 ?auto_4108 ) ) ( not ( = ?auto_4103 ?auto_4107 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4105 ?auto_4104 ?auto_4106 )
      ( !LIFT ?auto_4107 ?auto_4102 ?auto_4108 ?auto_4106 )
      ( !LOAD ?auto_4107 ?auto_4102 ?auto_4105 ?auto_4106 )
      ( !DRIVE ?auto_4105 ?auto_4106 ?auto_4104 )
      ( !UNLOAD ?auto_4103 ?auto_4102 ?auto_4105 ?auto_4104 )
      ( !DROP ?auto_4103 ?auto_4102 ?auto_4101 ?auto_4104 )
      ( MAKE-1CRATE-VERIFY ?auto_4101 ?auto_4102 ) )
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
      ?auto_4124 - SURFACE
      ?auto_4123 - SURFACE
    )
    :vars
    (
      ?auto_4129 - HOIST
      ?auto_4125 - PLACE
      ?auto_4128 - PLACE
      ?auto_4126 - HOIST
      ?auto_4127 - SURFACE
      ?auto_4143 - PLACE
      ?auto_4141 - HOIST
      ?auto_4140 - SURFACE
      ?auto_4131 - SURFACE
      ?auto_4142 - PLACE
      ?auto_4133 - HOIST
      ?auto_4144 - SURFACE
      ?auto_4135 - PLACE
      ?auto_4136 - HOIST
      ?auto_4132 - SURFACE
      ?auto_4134 - PLACE
      ?auto_4138 - HOIST
      ?auto_4137 - SURFACE
      ?auto_4139 - SURFACE
      ?auto_4130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4129 ?auto_4125 ) ( IS-CRATE ?auto_4123 ) ( not ( = ?auto_4128 ?auto_4125 ) ) ( HOIST-AT ?auto_4126 ?auto_4128 ) ( SURFACE-AT ?auto_4123 ?auto_4128 ) ( ON ?auto_4123 ?auto_4127 ) ( CLEAR ?auto_4123 ) ( not ( = ?auto_4124 ?auto_4123 ) ) ( not ( = ?auto_4124 ?auto_4127 ) ) ( not ( = ?auto_4123 ?auto_4127 ) ) ( not ( = ?auto_4129 ?auto_4126 ) ) ( IS-CRATE ?auto_4124 ) ( not ( = ?auto_4143 ?auto_4125 ) ) ( HOIST-AT ?auto_4141 ?auto_4143 ) ( SURFACE-AT ?auto_4124 ?auto_4143 ) ( ON ?auto_4124 ?auto_4140 ) ( CLEAR ?auto_4124 ) ( not ( = ?auto_4122 ?auto_4124 ) ) ( not ( = ?auto_4122 ?auto_4140 ) ) ( not ( = ?auto_4124 ?auto_4140 ) ) ( not ( = ?auto_4129 ?auto_4141 ) ) ( IS-CRATE ?auto_4122 ) ( AVAILABLE ?auto_4126 ) ( SURFACE-AT ?auto_4122 ?auto_4128 ) ( ON ?auto_4122 ?auto_4131 ) ( CLEAR ?auto_4122 ) ( not ( = ?auto_4121 ?auto_4122 ) ) ( not ( = ?auto_4121 ?auto_4131 ) ) ( not ( = ?auto_4122 ?auto_4131 ) ) ( IS-CRATE ?auto_4121 ) ( not ( = ?auto_4142 ?auto_4125 ) ) ( HOIST-AT ?auto_4133 ?auto_4142 ) ( AVAILABLE ?auto_4133 ) ( SURFACE-AT ?auto_4121 ?auto_4142 ) ( ON ?auto_4121 ?auto_4144 ) ( CLEAR ?auto_4121 ) ( not ( = ?auto_4120 ?auto_4121 ) ) ( not ( = ?auto_4120 ?auto_4144 ) ) ( not ( = ?auto_4121 ?auto_4144 ) ) ( not ( = ?auto_4129 ?auto_4133 ) ) ( IS-CRATE ?auto_4120 ) ( not ( = ?auto_4135 ?auto_4125 ) ) ( HOIST-AT ?auto_4136 ?auto_4135 ) ( AVAILABLE ?auto_4136 ) ( SURFACE-AT ?auto_4120 ?auto_4135 ) ( ON ?auto_4120 ?auto_4132 ) ( CLEAR ?auto_4120 ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4132 ) ) ( not ( = ?auto_4120 ?auto_4132 ) ) ( not ( = ?auto_4129 ?auto_4136 ) ) ( IS-CRATE ?auto_4119 ) ( not ( = ?auto_4134 ?auto_4125 ) ) ( HOIST-AT ?auto_4138 ?auto_4134 ) ( AVAILABLE ?auto_4138 ) ( SURFACE-AT ?auto_4119 ?auto_4134 ) ( ON ?auto_4119 ?auto_4137 ) ( CLEAR ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( not ( = ?auto_4118 ?auto_4137 ) ) ( not ( = ?auto_4119 ?auto_4137 ) ) ( not ( = ?auto_4129 ?auto_4138 ) ) ( SURFACE-AT ?auto_4117 ?auto_4125 ) ( CLEAR ?auto_4117 ) ( IS-CRATE ?auto_4118 ) ( AVAILABLE ?auto_4129 ) ( AVAILABLE ?auto_4141 ) ( SURFACE-AT ?auto_4118 ?auto_4143 ) ( ON ?auto_4118 ?auto_4139 ) ( CLEAR ?auto_4118 ) ( TRUCK-AT ?auto_4130 ?auto_4125 ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4139 ) ) ( not ( = ?auto_4118 ?auto_4139 ) ) ( not ( = ?auto_4117 ?auto_4119 ) ) ( not ( = ?auto_4117 ?auto_4137 ) ) ( not ( = ?auto_4119 ?auto_4139 ) ) ( not ( = ?auto_4134 ?auto_4143 ) ) ( not ( = ?auto_4138 ?auto_4141 ) ) ( not ( = ?auto_4137 ?auto_4139 ) ) ( not ( = ?auto_4117 ?auto_4120 ) ) ( not ( = ?auto_4117 ?auto_4132 ) ) ( not ( = ?auto_4118 ?auto_4120 ) ) ( not ( = ?auto_4118 ?auto_4132 ) ) ( not ( = ?auto_4120 ?auto_4137 ) ) ( not ( = ?auto_4120 ?auto_4139 ) ) ( not ( = ?auto_4135 ?auto_4134 ) ) ( not ( = ?auto_4135 ?auto_4143 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4136 ?auto_4141 ) ) ( not ( = ?auto_4132 ?auto_4137 ) ) ( not ( = ?auto_4132 ?auto_4139 ) ) ( not ( = ?auto_4117 ?auto_4121 ) ) ( not ( = ?auto_4117 ?auto_4144 ) ) ( not ( = ?auto_4118 ?auto_4121 ) ) ( not ( = ?auto_4118 ?auto_4144 ) ) ( not ( = ?auto_4119 ?auto_4121 ) ) ( not ( = ?auto_4119 ?auto_4144 ) ) ( not ( = ?auto_4121 ?auto_4132 ) ) ( not ( = ?auto_4121 ?auto_4137 ) ) ( not ( = ?auto_4121 ?auto_4139 ) ) ( not ( = ?auto_4142 ?auto_4135 ) ) ( not ( = ?auto_4142 ?auto_4134 ) ) ( not ( = ?auto_4142 ?auto_4143 ) ) ( not ( = ?auto_4133 ?auto_4136 ) ) ( not ( = ?auto_4133 ?auto_4138 ) ) ( not ( = ?auto_4133 ?auto_4141 ) ) ( not ( = ?auto_4144 ?auto_4132 ) ) ( not ( = ?auto_4144 ?auto_4137 ) ) ( not ( = ?auto_4144 ?auto_4139 ) ) ( not ( = ?auto_4117 ?auto_4122 ) ) ( not ( = ?auto_4117 ?auto_4131 ) ) ( not ( = ?auto_4118 ?auto_4122 ) ) ( not ( = ?auto_4118 ?auto_4131 ) ) ( not ( = ?auto_4119 ?auto_4122 ) ) ( not ( = ?auto_4119 ?auto_4131 ) ) ( not ( = ?auto_4120 ?auto_4122 ) ) ( not ( = ?auto_4120 ?auto_4131 ) ) ( not ( = ?auto_4122 ?auto_4144 ) ) ( not ( = ?auto_4122 ?auto_4132 ) ) ( not ( = ?auto_4122 ?auto_4137 ) ) ( not ( = ?auto_4122 ?auto_4139 ) ) ( not ( = ?auto_4128 ?auto_4142 ) ) ( not ( = ?auto_4128 ?auto_4135 ) ) ( not ( = ?auto_4128 ?auto_4134 ) ) ( not ( = ?auto_4128 ?auto_4143 ) ) ( not ( = ?auto_4126 ?auto_4133 ) ) ( not ( = ?auto_4126 ?auto_4136 ) ) ( not ( = ?auto_4126 ?auto_4138 ) ) ( not ( = ?auto_4126 ?auto_4141 ) ) ( not ( = ?auto_4131 ?auto_4144 ) ) ( not ( = ?auto_4131 ?auto_4132 ) ) ( not ( = ?auto_4131 ?auto_4137 ) ) ( not ( = ?auto_4131 ?auto_4139 ) ) ( not ( = ?auto_4117 ?auto_4124 ) ) ( not ( = ?auto_4117 ?auto_4140 ) ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4118 ?auto_4140 ) ) ( not ( = ?auto_4119 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4140 ) ) ( not ( = ?auto_4120 ?auto_4124 ) ) ( not ( = ?auto_4120 ?auto_4140 ) ) ( not ( = ?auto_4121 ?auto_4124 ) ) ( not ( = ?auto_4121 ?auto_4140 ) ) ( not ( = ?auto_4124 ?auto_4131 ) ) ( not ( = ?auto_4124 ?auto_4144 ) ) ( not ( = ?auto_4124 ?auto_4132 ) ) ( not ( = ?auto_4124 ?auto_4137 ) ) ( not ( = ?auto_4124 ?auto_4139 ) ) ( not ( = ?auto_4140 ?auto_4131 ) ) ( not ( = ?auto_4140 ?auto_4144 ) ) ( not ( = ?auto_4140 ?auto_4132 ) ) ( not ( = ?auto_4140 ?auto_4137 ) ) ( not ( = ?auto_4140 ?auto_4139 ) ) ( not ( = ?auto_4117 ?auto_4123 ) ) ( not ( = ?auto_4117 ?auto_4127 ) ) ( not ( = ?auto_4118 ?auto_4123 ) ) ( not ( = ?auto_4118 ?auto_4127 ) ) ( not ( = ?auto_4119 ?auto_4123 ) ) ( not ( = ?auto_4119 ?auto_4127 ) ) ( not ( = ?auto_4120 ?auto_4123 ) ) ( not ( = ?auto_4120 ?auto_4127 ) ) ( not ( = ?auto_4121 ?auto_4123 ) ) ( not ( = ?auto_4121 ?auto_4127 ) ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4127 ) ) ( not ( = ?auto_4123 ?auto_4140 ) ) ( not ( = ?auto_4123 ?auto_4131 ) ) ( not ( = ?auto_4123 ?auto_4144 ) ) ( not ( = ?auto_4123 ?auto_4132 ) ) ( not ( = ?auto_4123 ?auto_4137 ) ) ( not ( = ?auto_4123 ?auto_4139 ) ) ( not ( = ?auto_4127 ?auto_4140 ) ) ( not ( = ?auto_4127 ?auto_4131 ) ) ( not ( = ?auto_4127 ?auto_4144 ) ) ( not ( = ?auto_4127 ?auto_4132 ) ) ( not ( = ?auto_4127 ?auto_4137 ) ) ( not ( = ?auto_4127 ?auto_4139 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4117 ?auto_4118 ?auto_4119 ?auto_4120 ?auto_4121 ?auto_4122 ?auto_4124 )
      ( MAKE-1CRATE ?auto_4124 ?auto_4123 )
      ( MAKE-7CRATE-VERIFY ?auto_4117 ?auto_4118 ?auto_4119 ?auto_4120 ?auto_4121 ?auto_4122 ?auto_4124 ?auto_4123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4147 - SURFACE
      ?auto_4148 - SURFACE
    )
    :vars
    (
      ?auto_4149 - HOIST
      ?auto_4150 - PLACE
      ?auto_4152 - PLACE
      ?auto_4153 - HOIST
      ?auto_4154 - SURFACE
      ?auto_4151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4149 ?auto_4150 ) ( SURFACE-AT ?auto_4147 ?auto_4150 ) ( CLEAR ?auto_4147 ) ( IS-CRATE ?auto_4148 ) ( AVAILABLE ?auto_4149 ) ( not ( = ?auto_4152 ?auto_4150 ) ) ( HOIST-AT ?auto_4153 ?auto_4152 ) ( AVAILABLE ?auto_4153 ) ( SURFACE-AT ?auto_4148 ?auto_4152 ) ( ON ?auto_4148 ?auto_4154 ) ( CLEAR ?auto_4148 ) ( TRUCK-AT ?auto_4151 ?auto_4150 ) ( not ( = ?auto_4147 ?auto_4148 ) ) ( not ( = ?auto_4147 ?auto_4154 ) ) ( not ( = ?auto_4148 ?auto_4154 ) ) ( not ( = ?auto_4149 ?auto_4153 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4151 ?auto_4150 ?auto_4152 )
      ( !LIFT ?auto_4153 ?auto_4148 ?auto_4154 ?auto_4152 )
      ( !LOAD ?auto_4153 ?auto_4148 ?auto_4151 ?auto_4152 )
      ( !DRIVE ?auto_4151 ?auto_4152 ?auto_4150 )
      ( !UNLOAD ?auto_4149 ?auto_4148 ?auto_4151 ?auto_4150 )
      ( !DROP ?auto_4149 ?auto_4148 ?auto_4147 ?auto_4150 )
      ( MAKE-1CRATE-VERIFY ?auto_4147 ?auto_4148 ) )
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
      ?auto_4172 - SURFACE
      ?auto_4171 - SURFACE
      ?auto_4170 - SURFACE
    )
    :vars
    (
      ?auto_4175 - HOIST
      ?auto_4176 - PLACE
      ?auto_4178 - PLACE
      ?auto_4177 - HOIST
      ?auto_4174 - SURFACE
      ?auto_4193 - PLACE
      ?auto_4194 - HOIST
      ?auto_4195 - SURFACE
      ?auto_4187 - PLACE
      ?auto_4184 - HOIST
      ?auto_4185 - SURFACE
      ?auto_4182 - SURFACE
      ?auto_4186 - PLACE
      ?auto_4179 - HOIST
      ?auto_4188 - SURFACE
      ?auto_4192 - PLACE
      ?auto_4191 - HOIST
      ?auto_4181 - SURFACE
      ?auto_4180 - PLACE
      ?auto_4189 - HOIST
      ?auto_4190 - SURFACE
      ?auto_4183 - SURFACE
      ?auto_4173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4175 ?auto_4176 ) ( IS-CRATE ?auto_4170 ) ( not ( = ?auto_4178 ?auto_4176 ) ) ( HOIST-AT ?auto_4177 ?auto_4178 ) ( AVAILABLE ?auto_4177 ) ( SURFACE-AT ?auto_4170 ?auto_4178 ) ( ON ?auto_4170 ?auto_4174 ) ( CLEAR ?auto_4170 ) ( not ( = ?auto_4171 ?auto_4170 ) ) ( not ( = ?auto_4171 ?auto_4174 ) ) ( not ( = ?auto_4170 ?auto_4174 ) ) ( not ( = ?auto_4175 ?auto_4177 ) ) ( IS-CRATE ?auto_4171 ) ( not ( = ?auto_4193 ?auto_4176 ) ) ( HOIST-AT ?auto_4194 ?auto_4193 ) ( SURFACE-AT ?auto_4171 ?auto_4193 ) ( ON ?auto_4171 ?auto_4195 ) ( CLEAR ?auto_4171 ) ( not ( = ?auto_4172 ?auto_4171 ) ) ( not ( = ?auto_4172 ?auto_4195 ) ) ( not ( = ?auto_4171 ?auto_4195 ) ) ( not ( = ?auto_4175 ?auto_4194 ) ) ( IS-CRATE ?auto_4172 ) ( not ( = ?auto_4187 ?auto_4176 ) ) ( HOIST-AT ?auto_4184 ?auto_4187 ) ( SURFACE-AT ?auto_4172 ?auto_4187 ) ( ON ?auto_4172 ?auto_4185 ) ( CLEAR ?auto_4172 ) ( not ( = ?auto_4169 ?auto_4172 ) ) ( not ( = ?auto_4169 ?auto_4185 ) ) ( not ( = ?auto_4172 ?auto_4185 ) ) ( not ( = ?auto_4175 ?auto_4184 ) ) ( IS-CRATE ?auto_4169 ) ( AVAILABLE ?auto_4194 ) ( SURFACE-AT ?auto_4169 ?auto_4193 ) ( ON ?auto_4169 ?auto_4182 ) ( CLEAR ?auto_4169 ) ( not ( = ?auto_4168 ?auto_4169 ) ) ( not ( = ?auto_4168 ?auto_4182 ) ) ( not ( = ?auto_4169 ?auto_4182 ) ) ( IS-CRATE ?auto_4168 ) ( not ( = ?auto_4186 ?auto_4176 ) ) ( HOIST-AT ?auto_4179 ?auto_4186 ) ( AVAILABLE ?auto_4179 ) ( SURFACE-AT ?auto_4168 ?auto_4186 ) ( ON ?auto_4168 ?auto_4188 ) ( CLEAR ?auto_4168 ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4188 ) ) ( not ( = ?auto_4168 ?auto_4188 ) ) ( not ( = ?auto_4175 ?auto_4179 ) ) ( IS-CRATE ?auto_4167 ) ( not ( = ?auto_4192 ?auto_4176 ) ) ( HOIST-AT ?auto_4191 ?auto_4192 ) ( AVAILABLE ?auto_4191 ) ( SURFACE-AT ?auto_4167 ?auto_4192 ) ( ON ?auto_4167 ?auto_4181 ) ( CLEAR ?auto_4167 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4181 ) ) ( not ( = ?auto_4167 ?auto_4181 ) ) ( not ( = ?auto_4175 ?auto_4191 ) ) ( IS-CRATE ?auto_4166 ) ( not ( = ?auto_4180 ?auto_4176 ) ) ( HOIST-AT ?auto_4189 ?auto_4180 ) ( AVAILABLE ?auto_4189 ) ( SURFACE-AT ?auto_4166 ?auto_4180 ) ( ON ?auto_4166 ?auto_4190 ) ( CLEAR ?auto_4166 ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4190 ) ) ( not ( = ?auto_4166 ?auto_4190 ) ) ( not ( = ?auto_4175 ?auto_4189 ) ) ( SURFACE-AT ?auto_4164 ?auto_4176 ) ( CLEAR ?auto_4164 ) ( IS-CRATE ?auto_4165 ) ( AVAILABLE ?auto_4175 ) ( AVAILABLE ?auto_4184 ) ( SURFACE-AT ?auto_4165 ?auto_4187 ) ( ON ?auto_4165 ?auto_4183 ) ( CLEAR ?auto_4165 ) ( TRUCK-AT ?auto_4173 ?auto_4176 ) ( not ( = ?auto_4164 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4183 ) ) ( not ( = ?auto_4165 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4190 ) ) ( not ( = ?auto_4166 ?auto_4183 ) ) ( not ( = ?auto_4180 ?auto_4187 ) ) ( not ( = ?auto_4189 ?auto_4184 ) ) ( not ( = ?auto_4190 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4164 ?auto_4181 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4165 ?auto_4181 ) ) ( not ( = ?auto_4167 ?auto_4190 ) ) ( not ( = ?auto_4167 ?auto_4183 ) ) ( not ( = ?auto_4192 ?auto_4180 ) ) ( not ( = ?auto_4192 ?auto_4187 ) ) ( not ( = ?auto_4191 ?auto_4189 ) ) ( not ( = ?auto_4191 ?auto_4184 ) ) ( not ( = ?auto_4181 ?auto_4190 ) ) ( not ( = ?auto_4181 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4168 ) ) ( not ( = ?auto_4164 ?auto_4188 ) ) ( not ( = ?auto_4165 ?auto_4168 ) ) ( not ( = ?auto_4165 ?auto_4188 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4188 ) ) ( not ( = ?auto_4168 ?auto_4181 ) ) ( not ( = ?auto_4168 ?auto_4190 ) ) ( not ( = ?auto_4168 ?auto_4183 ) ) ( not ( = ?auto_4186 ?auto_4192 ) ) ( not ( = ?auto_4186 ?auto_4180 ) ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4179 ?auto_4191 ) ) ( not ( = ?auto_4179 ?auto_4189 ) ) ( not ( = ?auto_4179 ?auto_4184 ) ) ( not ( = ?auto_4188 ?auto_4181 ) ) ( not ( = ?auto_4188 ?auto_4190 ) ) ( not ( = ?auto_4188 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4169 ) ) ( not ( = ?auto_4164 ?auto_4182 ) ) ( not ( = ?auto_4165 ?auto_4169 ) ) ( not ( = ?auto_4165 ?auto_4182 ) ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4182 ) ) ( not ( = ?auto_4167 ?auto_4169 ) ) ( not ( = ?auto_4167 ?auto_4182 ) ) ( not ( = ?auto_4169 ?auto_4188 ) ) ( not ( = ?auto_4169 ?auto_4181 ) ) ( not ( = ?auto_4169 ?auto_4190 ) ) ( not ( = ?auto_4169 ?auto_4183 ) ) ( not ( = ?auto_4193 ?auto_4186 ) ) ( not ( = ?auto_4193 ?auto_4192 ) ) ( not ( = ?auto_4193 ?auto_4180 ) ) ( not ( = ?auto_4193 ?auto_4187 ) ) ( not ( = ?auto_4194 ?auto_4179 ) ) ( not ( = ?auto_4194 ?auto_4191 ) ) ( not ( = ?auto_4194 ?auto_4189 ) ) ( not ( = ?auto_4194 ?auto_4184 ) ) ( not ( = ?auto_4182 ?auto_4188 ) ) ( not ( = ?auto_4182 ?auto_4181 ) ) ( not ( = ?auto_4182 ?auto_4190 ) ) ( not ( = ?auto_4182 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4172 ) ) ( not ( = ?auto_4164 ?auto_4185 ) ) ( not ( = ?auto_4165 ?auto_4172 ) ) ( not ( = ?auto_4165 ?auto_4185 ) ) ( not ( = ?auto_4166 ?auto_4172 ) ) ( not ( = ?auto_4166 ?auto_4185 ) ) ( not ( = ?auto_4167 ?auto_4172 ) ) ( not ( = ?auto_4167 ?auto_4185 ) ) ( not ( = ?auto_4168 ?auto_4172 ) ) ( not ( = ?auto_4168 ?auto_4185 ) ) ( not ( = ?auto_4172 ?auto_4182 ) ) ( not ( = ?auto_4172 ?auto_4188 ) ) ( not ( = ?auto_4172 ?auto_4181 ) ) ( not ( = ?auto_4172 ?auto_4190 ) ) ( not ( = ?auto_4172 ?auto_4183 ) ) ( not ( = ?auto_4185 ?auto_4182 ) ) ( not ( = ?auto_4185 ?auto_4188 ) ) ( not ( = ?auto_4185 ?auto_4181 ) ) ( not ( = ?auto_4185 ?auto_4190 ) ) ( not ( = ?auto_4185 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4171 ) ) ( not ( = ?auto_4164 ?auto_4195 ) ) ( not ( = ?auto_4165 ?auto_4171 ) ) ( not ( = ?auto_4165 ?auto_4195 ) ) ( not ( = ?auto_4166 ?auto_4171 ) ) ( not ( = ?auto_4166 ?auto_4195 ) ) ( not ( = ?auto_4167 ?auto_4171 ) ) ( not ( = ?auto_4167 ?auto_4195 ) ) ( not ( = ?auto_4168 ?auto_4171 ) ) ( not ( = ?auto_4168 ?auto_4195 ) ) ( not ( = ?auto_4169 ?auto_4171 ) ) ( not ( = ?auto_4169 ?auto_4195 ) ) ( not ( = ?auto_4171 ?auto_4185 ) ) ( not ( = ?auto_4171 ?auto_4182 ) ) ( not ( = ?auto_4171 ?auto_4188 ) ) ( not ( = ?auto_4171 ?auto_4181 ) ) ( not ( = ?auto_4171 ?auto_4190 ) ) ( not ( = ?auto_4171 ?auto_4183 ) ) ( not ( = ?auto_4195 ?auto_4185 ) ) ( not ( = ?auto_4195 ?auto_4182 ) ) ( not ( = ?auto_4195 ?auto_4188 ) ) ( not ( = ?auto_4195 ?auto_4181 ) ) ( not ( = ?auto_4195 ?auto_4190 ) ) ( not ( = ?auto_4195 ?auto_4183 ) ) ( not ( = ?auto_4164 ?auto_4170 ) ) ( not ( = ?auto_4164 ?auto_4174 ) ) ( not ( = ?auto_4165 ?auto_4170 ) ) ( not ( = ?auto_4165 ?auto_4174 ) ) ( not ( = ?auto_4166 ?auto_4170 ) ) ( not ( = ?auto_4166 ?auto_4174 ) ) ( not ( = ?auto_4167 ?auto_4170 ) ) ( not ( = ?auto_4167 ?auto_4174 ) ) ( not ( = ?auto_4168 ?auto_4170 ) ) ( not ( = ?auto_4168 ?auto_4174 ) ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( not ( = ?auto_4169 ?auto_4174 ) ) ( not ( = ?auto_4172 ?auto_4170 ) ) ( not ( = ?auto_4172 ?auto_4174 ) ) ( not ( = ?auto_4170 ?auto_4195 ) ) ( not ( = ?auto_4170 ?auto_4185 ) ) ( not ( = ?auto_4170 ?auto_4182 ) ) ( not ( = ?auto_4170 ?auto_4188 ) ) ( not ( = ?auto_4170 ?auto_4181 ) ) ( not ( = ?auto_4170 ?auto_4190 ) ) ( not ( = ?auto_4170 ?auto_4183 ) ) ( not ( = ?auto_4178 ?auto_4193 ) ) ( not ( = ?auto_4178 ?auto_4187 ) ) ( not ( = ?auto_4178 ?auto_4186 ) ) ( not ( = ?auto_4178 ?auto_4192 ) ) ( not ( = ?auto_4178 ?auto_4180 ) ) ( not ( = ?auto_4177 ?auto_4194 ) ) ( not ( = ?auto_4177 ?auto_4184 ) ) ( not ( = ?auto_4177 ?auto_4179 ) ) ( not ( = ?auto_4177 ?auto_4191 ) ) ( not ( = ?auto_4177 ?auto_4189 ) ) ( not ( = ?auto_4174 ?auto_4195 ) ) ( not ( = ?auto_4174 ?auto_4185 ) ) ( not ( = ?auto_4174 ?auto_4182 ) ) ( not ( = ?auto_4174 ?auto_4188 ) ) ( not ( = ?auto_4174 ?auto_4181 ) ) ( not ( = ?auto_4174 ?auto_4190 ) ) ( not ( = ?auto_4174 ?auto_4183 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4164 ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ?auto_4172 ?auto_4171 )
      ( MAKE-1CRATE ?auto_4171 ?auto_4170 )
      ( MAKE-8CRATE-VERIFY ?auto_4164 ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4169 ?auto_4172 ?auto_4171 ?auto_4170 ) )
  )

)

