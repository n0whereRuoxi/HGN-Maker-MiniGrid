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
      ?auto_3917 - SURFACE
      ?auto_3918 - SURFACE
    )
    :vars
    (
      ?auto_3919 - HOIST
      ?auto_3920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3919 ?auto_3920 ) ( SURFACE-AT ?auto_3917 ?auto_3920 ) ( CLEAR ?auto_3917 ) ( LIFTING ?auto_3919 ?auto_3918 ) ( IS-CRATE ?auto_3918 ) ( not ( = ?auto_3917 ?auto_3918 ) ) )
    :subtasks
    ( ( !DROP ?auto_3919 ?auto_3918 ?auto_3917 ?auto_3920 )
      ( MAKE-1CRATE-VERIFY ?auto_3917 ?auto_3918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3921 - SURFACE
      ?auto_3922 - SURFACE
    )
    :vars
    (
      ?auto_3924 - HOIST
      ?auto_3923 - PLACE
      ?auto_3925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3924 ?auto_3923 ) ( SURFACE-AT ?auto_3921 ?auto_3923 ) ( CLEAR ?auto_3921 ) ( IS-CRATE ?auto_3922 ) ( not ( = ?auto_3921 ?auto_3922 ) ) ( TRUCK-AT ?auto_3925 ?auto_3923 ) ( AVAILABLE ?auto_3924 ) ( IN ?auto_3922 ?auto_3925 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3924 ?auto_3922 ?auto_3925 ?auto_3923 )
      ( MAKE-1CRATE ?auto_3921 ?auto_3922 )
      ( MAKE-1CRATE-VERIFY ?auto_3921 ?auto_3922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3926 - SURFACE
      ?auto_3927 - SURFACE
    )
    :vars
    (
      ?auto_3928 - HOIST
      ?auto_3929 - PLACE
      ?auto_3930 - TRUCK
      ?auto_3931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3928 ?auto_3929 ) ( SURFACE-AT ?auto_3926 ?auto_3929 ) ( CLEAR ?auto_3926 ) ( IS-CRATE ?auto_3927 ) ( not ( = ?auto_3926 ?auto_3927 ) ) ( AVAILABLE ?auto_3928 ) ( IN ?auto_3927 ?auto_3930 ) ( TRUCK-AT ?auto_3930 ?auto_3931 ) ( not ( = ?auto_3931 ?auto_3929 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3930 ?auto_3931 ?auto_3929 )
      ( MAKE-1CRATE ?auto_3926 ?auto_3927 )
      ( MAKE-1CRATE-VERIFY ?auto_3926 ?auto_3927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3932 - SURFACE
      ?auto_3933 - SURFACE
    )
    :vars
    (
      ?auto_3935 - HOIST
      ?auto_3937 - PLACE
      ?auto_3936 - TRUCK
      ?auto_3934 - PLACE
      ?auto_3938 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3935 ?auto_3937 ) ( SURFACE-AT ?auto_3932 ?auto_3937 ) ( CLEAR ?auto_3932 ) ( IS-CRATE ?auto_3933 ) ( not ( = ?auto_3932 ?auto_3933 ) ) ( AVAILABLE ?auto_3935 ) ( TRUCK-AT ?auto_3936 ?auto_3934 ) ( not ( = ?auto_3934 ?auto_3937 ) ) ( HOIST-AT ?auto_3938 ?auto_3934 ) ( LIFTING ?auto_3938 ?auto_3933 ) ( not ( = ?auto_3935 ?auto_3938 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3938 ?auto_3933 ?auto_3936 ?auto_3934 )
      ( MAKE-1CRATE ?auto_3932 ?auto_3933 )
      ( MAKE-1CRATE-VERIFY ?auto_3932 ?auto_3933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3939 - SURFACE
      ?auto_3940 - SURFACE
    )
    :vars
    (
      ?auto_3944 - HOIST
      ?auto_3941 - PLACE
      ?auto_3943 - TRUCK
      ?auto_3945 - PLACE
      ?auto_3942 - HOIST
      ?auto_3946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3944 ?auto_3941 ) ( SURFACE-AT ?auto_3939 ?auto_3941 ) ( CLEAR ?auto_3939 ) ( IS-CRATE ?auto_3940 ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( AVAILABLE ?auto_3944 ) ( TRUCK-AT ?auto_3943 ?auto_3945 ) ( not ( = ?auto_3945 ?auto_3941 ) ) ( HOIST-AT ?auto_3942 ?auto_3945 ) ( not ( = ?auto_3944 ?auto_3942 ) ) ( AVAILABLE ?auto_3942 ) ( SURFACE-AT ?auto_3940 ?auto_3945 ) ( ON ?auto_3940 ?auto_3946 ) ( CLEAR ?auto_3940 ) ( not ( = ?auto_3939 ?auto_3946 ) ) ( not ( = ?auto_3940 ?auto_3946 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3942 ?auto_3940 ?auto_3946 ?auto_3945 )
      ( MAKE-1CRATE ?auto_3939 ?auto_3940 )
      ( MAKE-1CRATE-VERIFY ?auto_3939 ?auto_3940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3947 - SURFACE
      ?auto_3948 - SURFACE
    )
    :vars
    (
      ?auto_3951 - HOIST
      ?auto_3949 - PLACE
      ?auto_3950 - PLACE
      ?auto_3952 - HOIST
      ?auto_3954 - SURFACE
      ?auto_3953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3951 ?auto_3949 ) ( SURFACE-AT ?auto_3947 ?auto_3949 ) ( CLEAR ?auto_3947 ) ( IS-CRATE ?auto_3948 ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( AVAILABLE ?auto_3951 ) ( not ( = ?auto_3950 ?auto_3949 ) ) ( HOIST-AT ?auto_3952 ?auto_3950 ) ( not ( = ?auto_3951 ?auto_3952 ) ) ( AVAILABLE ?auto_3952 ) ( SURFACE-AT ?auto_3948 ?auto_3950 ) ( ON ?auto_3948 ?auto_3954 ) ( CLEAR ?auto_3948 ) ( not ( = ?auto_3947 ?auto_3954 ) ) ( not ( = ?auto_3948 ?auto_3954 ) ) ( TRUCK-AT ?auto_3953 ?auto_3949 ) )
    :subtasks
    ( ( !DRIVE ?auto_3953 ?auto_3949 ?auto_3950 )
      ( MAKE-1CRATE ?auto_3947 ?auto_3948 )
      ( MAKE-1CRATE-VERIFY ?auto_3947 ?auto_3948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3964 - SURFACE
      ?auto_3965 - SURFACE
      ?auto_3966 - SURFACE
    )
    :vars
    (
      ?auto_3968 - HOIST
      ?auto_3967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3968 ?auto_3967 ) ( SURFACE-AT ?auto_3965 ?auto_3967 ) ( CLEAR ?auto_3965 ) ( LIFTING ?auto_3968 ?auto_3966 ) ( IS-CRATE ?auto_3966 ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( ON ?auto_3965 ?auto_3964 ) ( not ( = ?auto_3964 ?auto_3965 ) ) ( not ( = ?auto_3964 ?auto_3966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3965 ?auto_3966 )
      ( MAKE-2CRATE-VERIFY ?auto_3964 ?auto_3965 ?auto_3966 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3974 - SURFACE
      ?auto_3975 - SURFACE
      ?auto_3976 - SURFACE
    )
    :vars
    (
      ?auto_3979 - HOIST
      ?auto_3977 - PLACE
      ?auto_3978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3979 ?auto_3977 ) ( SURFACE-AT ?auto_3975 ?auto_3977 ) ( CLEAR ?auto_3975 ) ( IS-CRATE ?auto_3976 ) ( not ( = ?auto_3975 ?auto_3976 ) ) ( TRUCK-AT ?auto_3978 ?auto_3977 ) ( AVAILABLE ?auto_3979 ) ( IN ?auto_3976 ?auto_3978 ) ( ON ?auto_3975 ?auto_3974 ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3975 ?auto_3976 )
      ( MAKE-2CRATE-VERIFY ?auto_3974 ?auto_3975 ?auto_3976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3980 - SURFACE
      ?auto_3981 - SURFACE
    )
    :vars
    (
      ?auto_3985 - HOIST
      ?auto_3983 - PLACE
      ?auto_3982 - TRUCK
      ?auto_3984 - SURFACE
      ?auto_3986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3985 ?auto_3983 ) ( SURFACE-AT ?auto_3980 ?auto_3983 ) ( CLEAR ?auto_3980 ) ( IS-CRATE ?auto_3981 ) ( not ( = ?auto_3980 ?auto_3981 ) ) ( AVAILABLE ?auto_3985 ) ( IN ?auto_3981 ?auto_3982 ) ( ON ?auto_3980 ?auto_3984 ) ( not ( = ?auto_3984 ?auto_3980 ) ) ( not ( = ?auto_3984 ?auto_3981 ) ) ( TRUCK-AT ?auto_3982 ?auto_3986 ) ( not ( = ?auto_3986 ?auto_3983 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3982 ?auto_3986 ?auto_3983 )
      ( MAKE-2CRATE ?auto_3984 ?auto_3980 ?auto_3981 )
      ( MAKE-1CRATE-VERIFY ?auto_3980 ?auto_3981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3987 - SURFACE
      ?auto_3988 - SURFACE
      ?auto_3989 - SURFACE
    )
    :vars
    (
      ?auto_3992 - HOIST
      ?auto_3990 - PLACE
      ?auto_3991 - TRUCK
      ?auto_3993 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3992 ?auto_3990 ) ( SURFACE-AT ?auto_3988 ?auto_3990 ) ( CLEAR ?auto_3988 ) ( IS-CRATE ?auto_3989 ) ( not ( = ?auto_3988 ?auto_3989 ) ) ( AVAILABLE ?auto_3992 ) ( IN ?auto_3989 ?auto_3991 ) ( ON ?auto_3988 ?auto_3987 ) ( not ( = ?auto_3987 ?auto_3988 ) ) ( not ( = ?auto_3987 ?auto_3989 ) ) ( TRUCK-AT ?auto_3991 ?auto_3993 ) ( not ( = ?auto_3993 ?auto_3990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3988 ?auto_3989 )
      ( MAKE-2CRATE-VERIFY ?auto_3987 ?auto_3988 ?auto_3989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3994 - SURFACE
      ?auto_3995 - SURFACE
    )
    :vars
    (
      ?auto_3996 - HOIST
      ?auto_3999 - PLACE
      ?auto_3997 - SURFACE
      ?auto_3998 - TRUCK
      ?auto_4000 - PLACE
      ?auto_4001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3996 ?auto_3999 ) ( SURFACE-AT ?auto_3994 ?auto_3999 ) ( CLEAR ?auto_3994 ) ( IS-CRATE ?auto_3995 ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( AVAILABLE ?auto_3996 ) ( ON ?auto_3994 ?auto_3997 ) ( not ( = ?auto_3997 ?auto_3994 ) ) ( not ( = ?auto_3997 ?auto_3995 ) ) ( TRUCK-AT ?auto_3998 ?auto_4000 ) ( not ( = ?auto_4000 ?auto_3999 ) ) ( HOIST-AT ?auto_4001 ?auto_4000 ) ( LIFTING ?auto_4001 ?auto_3995 ) ( not ( = ?auto_3996 ?auto_4001 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4001 ?auto_3995 ?auto_3998 ?auto_4000 )
      ( MAKE-2CRATE ?auto_3997 ?auto_3994 ?auto_3995 )
      ( MAKE-1CRATE-VERIFY ?auto_3994 ?auto_3995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4002 - SURFACE
      ?auto_4003 - SURFACE
      ?auto_4004 - SURFACE
    )
    :vars
    (
      ?auto_4006 - HOIST
      ?auto_4008 - PLACE
      ?auto_4007 - TRUCK
      ?auto_4005 - PLACE
      ?auto_4009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4006 ?auto_4008 ) ( SURFACE-AT ?auto_4003 ?auto_4008 ) ( CLEAR ?auto_4003 ) ( IS-CRATE ?auto_4004 ) ( not ( = ?auto_4003 ?auto_4004 ) ) ( AVAILABLE ?auto_4006 ) ( ON ?auto_4003 ?auto_4002 ) ( not ( = ?auto_4002 ?auto_4003 ) ) ( not ( = ?auto_4002 ?auto_4004 ) ) ( TRUCK-AT ?auto_4007 ?auto_4005 ) ( not ( = ?auto_4005 ?auto_4008 ) ) ( HOIST-AT ?auto_4009 ?auto_4005 ) ( LIFTING ?auto_4009 ?auto_4004 ) ( not ( = ?auto_4006 ?auto_4009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4003 ?auto_4004 )
      ( MAKE-2CRATE-VERIFY ?auto_4002 ?auto_4003 ?auto_4004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4010 - SURFACE
      ?auto_4011 - SURFACE
    )
    :vars
    (
      ?auto_4015 - HOIST
      ?auto_4012 - PLACE
      ?auto_4016 - SURFACE
      ?auto_4014 - TRUCK
      ?auto_4013 - PLACE
      ?auto_4017 - HOIST
      ?auto_4018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4015 ?auto_4012 ) ( SURFACE-AT ?auto_4010 ?auto_4012 ) ( CLEAR ?auto_4010 ) ( IS-CRATE ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4011 ) ) ( AVAILABLE ?auto_4015 ) ( ON ?auto_4010 ?auto_4016 ) ( not ( = ?auto_4016 ?auto_4010 ) ) ( not ( = ?auto_4016 ?auto_4011 ) ) ( TRUCK-AT ?auto_4014 ?auto_4013 ) ( not ( = ?auto_4013 ?auto_4012 ) ) ( HOIST-AT ?auto_4017 ?auto_4013 ) ( not ( = ?auto_4015 ?auto_4017 ) ) ( AVAILABLE ?auto_4017 ) ( SURFACE-AT ?auto_4011 ?auto_4013 ) ( ON ?auto_4011 ?auto_4018 ) ( CLEAR ?auto_4011 ) ( not ( = ?auto_4010 ?auto_4018 ) ) ( not ( = ?auto_4011 ?auto_4018 ) ) ( not ( = ?auto_4016 ?auto_4018 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4017 ?auto_4011 ?auto_4018 ?auto_4013 )
      ( MAKE-2CRATE ?auto_4016 ?auto_4010 ?auto_4011 )
      ( MAKE-1CRATE-VERIFY ?auto_4010 ?auto_4011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4019 - SURFACE
      ?auto_4020 - SURFACE
      ?auto_4021 - SURFACE
    )
    :vars
    (
      ?auto_4025 - HOIST
      ?auto_4026 - PLACE
      ?auto_4027 - TRUCK
      ?auto_4022 - PLACE
      ?auto_4024 - HOIST
      ?auto_4023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4025 ?auto_4026 ) ( SURFACE-AT ?auto_4020 ?auto_4026 ) ( CLEAR ?auto_4020 ) ( IS-CRATE ?auto_4021 ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( AVAILABLE ?auto_4025 ) ( ON ?auto_4020 ?auto_4019 ) ( not ( = ?auto_4019 ?auto_4020 ) ) ( not ( = ?auto_4019 ?auto_4021 ) ) ( TRUCK-AT ?auto_4027 ?auto_4022 ) ( not ( = ?auto_4022 ?auto_4026 ) ) ( HOIST-AT ?auto_4024 ?auto_4022 ) ( not ( = ?auto_4025 ?auto_4024 ) ) ( AVAILABLE ?auto_4024 ) ( SURFACE-AT ?auto_4021 ?auto_4022 ) ( ON ?auto_4021 ?auto_4023 ) ( CLEAR ?auto_4021 ) ( not ( = ?auto_4020 ?auto_4023 ) ) ( not ( = ?auto_4021 ?auto_4023 ) ) ( not ( = ?auto_4019 ?auto_4023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4020 ?auto_4021 )
      ( MAKE-2CRATE-VERIFY ?auto_4019 ?auto_4020 ?auto_4021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4028 - SURFACE
      ?auto_4029 - SURFACE
    )
    :vars
    (
      ?auto_4034 - HOIST
      ?auto_4035 - PLACE
      ?auto_4030 - SURFACE
      ?auto_4036 - PLACE
      ?auto_4031 - HOIST
      ?auto_4033 - SURFACE
      ?auto_4032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4034 ?auto_4035 ) ( SURFACE-AT ?auto_4028 ?auto_4035 ) ( CLEAR ?auto_4028 ) ( IS-CRATE ?auto_4029 ) ( not ( = ?auto_4028 ?auto_4029 ) ) ( AVAILABLE ?auto_4034 ) ( ON ?auto_4028 ?auto_4030 ) ( not ( = ?auto_4030 ?auto_4028 ) ) ( not ( = ?auto_4030 ?auto_4029 ) ) ( not ( = ?auto_4036 ?auto_4035 ) ) ( HOIST-AT ?auto_4031 ?auto_4036 ) ( not ( = ?auto_4034 ?auto_4031 ) ) ( AVAILABLE ?auto_4031 ) ( SURFACE-AT ?auto_4029 ?auto_4036 ) ( ON ?auto_4029 ?auto_4033 ) ( CLEAR ?auto_4029 ) ( not ( = ?auto_4028 ?auto_4033 ) ) ( not ( = ?auto_4029 ?auto_4033 ) ) ( not ( = ?auto_4030 ?auto_4033 ) ) ( TRUCK-AT ?auto_4032 ?auto_4035 ) )
    :subtasks
    ( ( !DRIVE ?auto_4032 ?auto_4035 ?auto_4036 )
      ( MAKE-2CRATE ?auto_4030 ?auto_4028 ?auto_4029 )
      ( MAKE-1CRATE-VERIFY ?auto_4028 ?auto_4029 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4037 - SURFACE
      ?auto_4038 - SURFACE
      ?auto_4039 - SURFACE
    )
    :vars
    (
      ?auto_4041 - HOIST
      ?auto_4045 - PLACE
      ?auto_4043 - PLACE
      ?auto_4042 - HOIST
      ?auto_4040 - SURFACE
      ?auto_4044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4041 ?auto_4045 ) ( SURFACE-AT ?auto_4038 ?auto_4045 ) ( CLEAR ?auto_4038 ) ( IS-CRATE ?auto_4039 ) ( not ( = ?auto_4038 ?auto_4039 ) ) ( AVAILABLE ?auto_4041 ) ( ON ?auto_4038 ?auto_4037 ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( not ( = ?auto_4037 ?auto_4039 ) ) ( not ( = ?auto_4043 ?auto_4045 ) ) ( HOIST-AT ?auto_4042 ?auto_4043 ) ( not ( = ?auto_4041 ?auto_4042 ) ) ( AVAILABLE ?auto_4042 ) ( SURFACE-AT ?auto_4039 ?auto_4043 ) ( ON ?auto_4039 ?auto_4040 ) ( CLEAR ?auto_4039 ) ( not ( = ?auto_4038 ?auto_4040 ) ) ( not ( = ?auto_4039 ?auto_4040 ) ) ( not ( = ?auto_4037 ?auto_4040 ) ) ( TRUCK-AT ?auto_4044 ?auto_4045 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4038 ?auto_4039 )
      ( MAKE-2CRATE-VERIFY ?auto_4037 ?auto_4038 ?auto_4039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4046 - SURFACE
      ?auto_4047 - SURFACE
    )
    :vars
    (
      ?auto_4052 - HOIST
      ?auto_4048 - PLACE
      ?auto_4050 - SURFACE
      ?auto_4054 - PLACE
      ?auto_4053 - HOIST
      ?auto_4051 - SURFACE
      ?auto_4049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4052 ?auto_4048 ) ( IS-CRATE ?auto_4047 ) ( not ( = ?auto_4046 ?auto_4047 ) ) ( not ( = ?auto_4050 ?auto_4046 ) ) ( not ( = ?auto_4050 ?auto_4047 ) ) ( not ( = ?auto_4054 ?auto_4048 ) ) ( HOIST-AT ?auto_4053 ?auto_4054 ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( AVAILABLE ?auto_4053 ) ( SURFACE-AT ?auto_4047 ?auto_4054 ) ( ON ?auto_4047 ?auto_4051 ) ( CLEAR ?auto_4047 ) ( not ( = ?auto_4046 ?auto_4051 ) ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( not ( = ?auto_4050 ?auto_4051 ) ) ( TRUCK-AT ?auto_4049 ?auto_4048 ) ( SURFACE-AT ?auto_4050 ?auto_4048 ) ( CLEAR ?auto_4050 ) ( LIFTING ?auto_4052 ?auto_4046 ) ( IS-CRATE ?auto_4046 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4050 ?auto_4046 )
      ( MAKE-2CRATE ?auto_4050 ?auto_4046 ?auto_4047 )
      ( MAKE-1CRATE-VERIFY ?auto_4046 ?auto_4047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4055 - SURFACE
      ?auto_4056 - SURFACE
      ?auto_4057 - SURFACE
    )
    :vars
    (
      ?auto_4063 - HOIST
      ?auto_4058 - PLACE
      ?auto_4060 - PLACE
      ?auto_4062 - HOIST
      ?auto_4061 - SURFACE
      ?auto_4059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4063 ?auto_4058 ) ( IS-CRATE ?auto_4057 ) ( not ( = ?auto_4056 ?auto_4057 ) ) ( not ( = ?auto_4055 ?auto_4056 ) ) ( not ( = ?auto_4055 ?auto_4057 ) ) ( not ( = ?auto_4060 ?auto_4058 ) ) ( HOIST-AT ?auto_4062 ?auto_4060 ) ( not ( = ?auto_4063 ?auto_4062 ) ) ( AVAILABLE ?auto_4062 ) ( SURFACE-AT ?auto_4057 ?auto_4060 ) ( ON ?auto_4057 ?auto_4061 ) ( CLEAR ?auto_4057 ) ( not ( = ?auto_4056 ?auto_4061 ) ) ( not ( = ?auto_4057 ?auto_4061 ) ) ( not ( = ?auto_4055 ?auto_4061 ) ) ( TRUCK-AT ?auto_4059 ?auto_4058 ) ( SURFACE-AT ?auto_4055 ?auto_4058 ) ( CLEAR ?auto_4055 ) ( LIFTING ?auto_4063 ?auto_4056 ) ( IS-CRATE ?auto_4056 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4056 ?auto_4057 )
      ( MAKE-2CRATE-VERIFY ?auto_4055 ?auto_4056 ?auto_4057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4064 - SURFACE
      ?auto_4065 - SURFACE
    )
    :vars
    (
      ?auto_4071 - HOIST
      ?auto_4068 - PLACE
      ?auto_4066 - SURFACE
      ?auto_4067 - PLACE
      ?auto_4072 - HOIST
      ?auto_4070 - SURFACE
      ?auto_4069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4071 ?auto_4068 ) ( IS-CRATE ?auto_4065 ) ( not ( = ?auto_4064 ?auto_4065 ) ) ( not ( = ?auto_4066 ?auto_4064 ) ) ( not ( = ?auto_4066 ?auto_4065 ) ) ( not ( = ?auto_4067 ?auto_4068 ) ) ( HOIST-AT ?auto_4072 ?auto_4067 ) ( not ( = ?auto_4071 ?auto_4072 ) ) ( AVAILABLE ?auto_4072 ) ( SURFACE-AT ?auto_4065 ?auto_4067 ) ( ON ?auto_4065 ?auto_4070 ) ( CLEAR ?auto_4065 ) ( not ( = ?auto_4064 ?auto_4070 ) ) ( not ( = ?auto_4065 ?auto_4070 ) ) ( not ( = ?auto_4066 ?auto_4070 ) ) ( TRUCK-AT ?auto_4069 ?auto_4068 ) ( SURFACE-AT ?auto_4066 ?auto_4068 ) ( CLEAR ?auto_4066 ) ( IS-CRATE ?auto_4064 ) ( AVAILABLE ?auto_4071 ) ( IN ?auto_4064 ?auto_4069 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4071 ?auto_4064 ?auto_4069 ?auto_4068 )
      ( MAKE-2CRATE ?auto_4066 ?auto_4064 ?auto_4065 )
      ( MAKE-1CRATE-VERIFY ?auto_4064 ?auto_4065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4073 - SURFACE
      ?auto_4074 - SURFACE
      ?auto_4075 - SURFACE
    )
    :vars
    (
      ?auto_4078 - HOIST
      ?auto_4076 - PLACE
      ?auto_4079 - PLACE
      ?auto_4080 - HOIST
      ?auto_4081 - SURFACE
      ?auto_4077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4078 ?auto_4076 ) ( IS-CRATE ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( not ( = ?auto_4079 ?auto_4076 ) ) ( HOIST-AT ?auto_4080 ?auto_4079 ) ( not ( = ?auto_4078 ?auto_4080 ) ) ( AVAILABLE ?auto_4080 ) ( SURFACE-AT ?auto_4075 ?auto_4079 ) ( ON ?auto_4075 ?auto_4081 ) ( CLEAR ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4081 ) ) ( not ( = ?auto_4075 ?auto_4081 ) ) ( not ( = ?auto_4073 ?auto_4081 ) ) ( TRUCK-AT ?auto_4077 ?auto_4076 ) ( SURFACE-AT ?auto_4073 ?auto_4076 ) ( CLEAR ?auto_4073 ) ( IS-CRATE ?auto_4074 ) ( AVAILABLE ?auto_4078 ) ( IN ?auto_4074 ?auto_4077 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4074 ?auto_4075 )
      ( MAKE-2CRATE-VERIFY ?auto_4073 ?auto_4074 ?auto_4075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4118 - SURFACE
      ?auto_4119 - SURFACE
    )
    :vars
    (
      ?auto_4123 - HOIST
      ?auto_4126 - PLACE
      ?auto_4120 - SURFACE
      ?auto_4121 - PLACE
      ?auto_4122 - HOIST
      ?auto_4124 - SURFACE
      ?auto_4125 - TRUCK
      ?auto_4127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4123 ?auto_4126 ) ( SURFACE-AT ?auto_4118 ?auto_4126 ) ( CLEAR ?auto_4118 ) ( IS-CRATE ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( AVAILABLE ?auto_4123 ) ( ON ?auto_4118 ?auto_4120 ) ( not ( = ?auto_4120 ?auto_4118 ) ) ( not ( = ?auto_4120 ?auto_4119 ) ) ( not ( = ?auto_4121 ?auto_4126 ) ) ( HOIST-AT ?auto_4122 ?auto_4121 ) ( not ( = ?auto_4123 ?auto_4122 ) ) ( AVAILABLE ?auto_4122 ) ( SURFACE-AT ?auto_4119 ?auto_4121 ) ( ON ?auto_4119 ?auto_4124 ) ( CLEAR ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4124 ) ) ( not ( = ?auto_4120 ?auto_4124 ) ) ( TRUCK-AT ?auto_4125 ?auto_4127 ) ( not ( = ?auto_4127 ?auto_4126 ) ) ( not ( = ?auto_4121 ?auto_4127 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4125 ?auto_4127 ?auto_4126 )
      ( MAKE-1CRATE ?auto_4118 ?auto_4119 )
      ( MAKE-1CRATE-VERIFY ?auto_4118 ?auto_4119 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4157 - SURFACE
      ?auto_4158 - SURFACE
      ?auto_4159 - SURFACE
      ?auto_4160 - SURFACE
    )
    :vars
    (
      ?auto_4162 - HOIST
      ?auto_4161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4162 ?auto_4161 ) ( SURFACE-AT ?auto_4159 ?auto_4161 ) ( CLEAR ?auto_4159 ) ( LIFTING ?auto_4162 ?auto_4160 ) ( IS-CRATE ?auto_4160 ) ( not ( = ?auto_4159 ?auto_4160 ) ) ( ON ?auto_4158 ?auto_4157 ) ( ON ?auto_4159 ?auto_4158 ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4159 ) ) ( not ( = ?auto_4157 ?auto_4160 ) ) ( not ( = ?auto_4158 ?auto_4159 ) ) ( not ( = ?auto_4158 ?auto_4160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4159 ?auto_4160 )
      ( MAKE-3CRATE-VERIFY ?auto_4157 ?auto_4158 ?auto_4159 ?auto_4160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4174 - SURFACE
      ?auto_4175 - SURFACE
      ?auto_4176 - SURFACE
      ?auto_4177 - SURFACE
    )
    :vars
    (
      ?auto_4178 - HOIST
      ?auto_4179 - PLACE
      ?auto_4180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4178 ?auto_4179 ) ( SURFACE-AT ?auto_4176 ?auto_4179 ) ( CLEAR ?auto_4176 ) ( IS-CRATE ?auto_4177 ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( TRUCK-AT ?auto_4180 ?auto_4179 ) ( AVAILABLE ?auto_4178 ) ( IN ?auto_4177 ?auto_4180 ) ( ON ?auto_4176 ?auto_4175 ) ( not ( = ?auto_4175 ?auto_4176 ) ) ( not ( = ?auto_4175 ?auto_4177 ) ) ( ON ?auto_4175 ?auto_4174 ) ( not ( = ?auto_4174 ?auto_4175 ) ) ( not ( = ?auto_4174 ?auto_4176 ) ) ( not ( = ?auto_4174 ?auto_4177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4175 ?auto_4176 ?auto_4177 )
      ( MAKE-3CRATE-VERIFY ?auto_4174 ?auto_4175 ?auto_4176 ?auto_4177 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4195 - SURFACE
      ?auto_4196 - SURFACE
      ?auto_4197 - SURFACE
      ?auto_4198 - SURFACE
    )
    :vars
    (
      ?auto_4200 - HOIST
      ?auto_4199 - PLACE
      ?auto_4202 - TRUCK
      ?auto_4201 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4200 ?auto_4199 ) ( SURFACE-AT ?auto_4197 ?auto_4199 ) ( CLEAR ?auto_4197 ) ( IS-CRATE ?auto_4198 ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( AVAILABLE ?auto_4200 ) ( IN ?auto_4198 ?auto_4202 ) ( ON ?auto_4197 ?auto_4196 ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4198 ) ) ( TRUCK-AT ?auto_4202 ?auto_4201 ) ( not ( = ?auto_4201 ?auto_4199 ) ) ( ON ?auto_4196 ?auto_4195 ) ( not ( = ?auto_4195 ?auto_4196 ) ) ( not ( = ?auto_4195 ?auto_4197 ) ) ( not ( = ?auto_4195 ?auto_4198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4196 ?auto_4197 ?auto_4198 )
      ( MAKE-3CRATE-VERIFY ?auto_4195 ?auto_4196 ?auto_4197 ?auto_4198 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4219 - SURFACE
      ?auto_4220 - SURFACE
      ?auto_4221 - SURFACE
      ?auto_4222 - SURFACE
    )
    :vars
    (
      ?auto_4225 - HOIST
      ?auto_4224 - PLACE
      ?auto_4223 - TRUCK
      ?auto_4226 - PLACE
      ?auto_4227 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4225 ?auto_4224 ) ( SURFACE-AT ?auto_4221 ?auto_4224 ) ( CLEAR ?auto_4221 ) ( IS-CRATE ?auto_4222 ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( AVAILABLE ?auto_4225 ) ( ON ?auto_4221 ?auto_4220 ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( TRUCK-AT ?auto_4223 ?auto_4226 ) ( not ( = ?auto_4226 ?auto_4224 ) ) ( HOIST-AT ?auto_4227 ?auto_4226 ) ( LIFTING ?auto_4227 ?auto_4222 ) ( not ( = ?auto_4225 ?auto_4227 ) ) ( ON ?auto_4220 ?auto_4219 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4219 ?auto_4222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4220 ?auto_4221 ?auto_4222 )
      ( MAKE-3CRATE-VERIFY ?auto_4219 ?auto_4220 ?auto_4221 ?auto_4222 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4246 - SURFACE
      ?auto_4247 - SURFACE
      ?auto_4248 - SURFACE
      ?auto_4249 - SURFACE
    )
    :vars
    (
      ?auto_4255 - HOIST
      ?auto_4254 - PLACE
      ?auto_4250 - TRUCK
      ?auto_4253 - PLACE
      ?auto_4252 - HOIST
      ?auto_4251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4255 ?auto_4254 ) ( SURFACE-AT ?auto_4248 ?auto_4254 ) ( CLEAR ?auto_4248 ) ( IS-CRATE ?auto_4249 ) ( not ( = ?auto_4248 ?auto_4249 ) ) ( AVAILABLE ?auto_4255 ) ( ON ?auto_4248 ?auto_4247 ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4247 ?auto_4249 ) ) ( TRUCK-AT ?auto_4250 ?auto_4253 ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( HOIST-AT ?auto_4252 ?auto_4253 ) ( not ( = ?auto_4255 ?auto_4252 ) ) ( AVAILABLE ?auto_4252 ) ( SURFACE-AT ?auto_4249 ?auto_4253 ) ( ON ?auto_4249 ?auto_4251 ) ( CLEAR ?auto_4249 ) ( not ( = ?auto_4248 ?auto_4251 ) ) ( not ( = ?auto_4249 ?auto_4251 ) ) ( not ( = ?auto_4247 ?auto_4251 ) ) ( ON ?auto_4247 ?auto_4246 ) ( not ( = ?auto_4246 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4248 ) ) ( not ( = ?auto_4246 ?auto_4249 ) ) ( not ( = ?auto_4246 ?auto_4251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4247 ?auto_4248 ?auto_4249 )
      ( MAKE-3CRATE-VERIFY ?auto_4246 ?auto_4247 ?auto_4248 ?auto_4249 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4274 - SURFACE
      ?auto_4275 - SURFACE
      ?auto_4276 - SURFACE
      ?auto_4277 - SURFACE
    )
    :vars
    (
      ?auto_4278 - HOIST
      ?auto_4282 - PLACE
      ?auto_4279 - PLACE
      ?auto_4281 - HOIST
      ?auto_4280 - SURFACE
      ?auto_4283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4278 ?auto_4282 ) ( SURFACE-AT ?auto_4276 ?auto_4282 ) ( CLEAR ?auto_4276 ) ( IS-CRATE ?auto_4277 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( AVAILABLE ?auto_4278 ) ( ON ?auto_4276 ?auto_4275 ) ( not ( = ?auto_4275 ?auto_4276 ) ) ( not ( = ?auto_4275 ?auto_4277 ) ) ( not ( = ?auto_4279 ?auto_4282 ) ) ( HOIST-AT ?auto_4281 ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( AVAILABLE ?auto_4281 ) ( SURFACE-AT ?auto_4277 ?auto_4279 ) ( ON ?auto_4277 ?auto_4280 ) ( CLEAR ?auto_4277 ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4275 ?auto_4280 ) ) ( TRUCK-AT ?auto_4283 ?auto_4282 ) ( ON ?auto_4275 ?auto_4274 ) ( not ( = ?auto_4274 ?auto_4275 ) ) ( not ( = ?auto_4274 ?auto_4276 ) ) ( not ( = ?auto_4274 ?auto_4277 ) ) ( not ( = ?auto_4274 ?auto_4280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4275 ?auto_4276 ?auto_4277 )
      ( MAKE-3CRATE-VERIFY ?auto_4274 ?auto_4275 ?auto_4276 ?auto_4277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4302 - SURFACE
      ?auto_4303 - SURFACE
      ?auto_4304 - SURFACE
      ?auto_4305 - SURFACE
    )
    :vars
    (
      ?auto_4307 - HOIST
      ?auto_4310 - PLACE
      ?auto_4306 - PLACE
      ?auto_4308 - HOIST
      ?auto_4309 - SURFACE
      ?auto_4311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4307 ?auto_4310 ) ( IS-CRATE ?auto_4305 ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4306 ?auto_4310 ) ) ( HOIST-AT ?auto_4308 ?auto_4306 ) ( not ( = ?auto_4307 ?auto_4308 ) ) ( AVAILABLE ?auto_4308 ) ( SURFACE-AT ?auto_4305 ?auto_4306 ) ( ON ?auto_4305 ?auto_4309 ) ( CLEAR ?auto_4305 ) ( not ( = ?auto_4304 ?auto_4309 ) ) ( not ( = ?auto_4305 ?auto_4309 ) ) ( not ( = ?auto_4303 ?auto_4309 ) ) ( TRUCK-AT ?auto_4311 ?auto_4310 ) ( SURFACE-AT ?auto_4303 ?auto_4310 ) ( CLEAR ?auto_4303 ) ( LIFTING ?auto_4307 ?auto_4304 ) ( IS-CRATE ?auto_4304 ) ( ON ?auto_4303 ?auto_4302 ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( not ( = ?auto_4302 ?auto_4304 ) ) ( not ( = ?auto_4302 ?auto_4305 ) ) ( not ( = ?auto_4302 ?auto_4309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4303 ?auto_4304 ?auto_4305 )
      ( MAKE-3CRATE-VERIFY ?auto_4302 ?auto_4303 ?auto_4304 ?auto_4305 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4330 - SURFACE
      ?auto_4331 - SURFACE
      ?auto_4332 - SURFACE
      ?auto_4333 - SURFACE
    )
    :vars
    (
      ?auto_4334 - HOIST
      ?auto_4335 - PLACE
      ?auto_4338 - PLACE
      ?auto_4339 - HOIST
      ?auto_4336 - SURFACE
      ?auto_4337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4334 ?auto_4335 ) ( IS-CRATE ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4338 ?auto_4335 ) ) ( HOIST-AT ?auto_4339 ?auto_4338 ) ( not ( = ?auto_4334 ?auto_4339 ) ) ( AVAILABLE ?auto_4339 ) ( SURFACE-AT ?auto_4333 ?auto_4338 ) ( ON ?auto_4333 ?auto_4336 ) ( CLEAR ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4336 ) ) ( not ( = ?auto_4333 ?auto_4336 ) ) ( not ( = ?auto_4331 ?auto_4336 ) ) ( TRUCK-AT ?auto_4337 ?auto_4335 ) ( SURFACE-AT ?auto_4331 ?auto_4335 ) ( CLEAR ?auto_4331 ) ( IS-CRATE ?auto_4332 ) ( AVAILABLE ?auto_4334 ) ( IN ?auto_4332 ?auto_4337 ) ( ON ?auto_4331 ?auto_4330 ) ( not ( = ?auto_4330 ?auto_4331 ) ) ( not ( = ?auto_4330 ?auto_4332 ) ) ( not ( = ?auto_4330 ?auto_4333 ) ) ( not ( = ?auto_4330 ?auto_4336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4331 ?auto_4332 ?auto_4333 )
      ( MAKE-3CRATE-VERIFY ?auto_4330 ?auto_4331 ?auto_4332 ?auto_4333 ) )
  )

)

