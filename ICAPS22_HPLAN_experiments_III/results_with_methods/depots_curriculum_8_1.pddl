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
      ?auto_3890 - SURFACE
      ?auto_3891 - SURFACE
    )
    :vars
    (
      ?auto_3892 - HOIST
      ?auto_3893 - PLACE
      ?auto_3895 - PLACE
      ?auto_3896 - HOIST
      ?auto_3897 - SURFACE
      ?auto_3894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3892 ?auto_3893 ) ( SURFACE-AT ?auto_3890 ?auto_3893 ) ( CLEAR ?auto_3890 ) ( IS-CRATE ?auto_3891 ) ( AVAILABLE ?auto_3892 ) ( not ( = ?auto_3895 ?auto_3893 ) ) ( HOIST-AT ?auto_3896 ?auto_3895 ) ( AVAILABLE ?auto_3896 ) ( SURFACE-AT ?auto_3891 ?auto_3895 ) ( ON ?auto_3891 ?auto_3897 ) ( CLEAR ?auto_3891 ) ( TRUCK-AT ?auto_3894 ?auto_3893 ) ( not ( = ?auto_3890 ?auto_3891 ) ) ( not ( = ?auto_3890 ?auto_3897 ) ) ( not ( = ?auto_3891 ?auto_3897 ) ) ( not ( = ?auto_3892 ?auto_3896 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3894 ?auto_3893 ?auto_3895 )
      ( !LIFT ?auto_3896 ?auto_3891 ?auto_3897 ?auto_3895 )
      ( !LOAD ?auto_3896 ?auto_3891 ?auto_3894 ?auto_3895 )
      ( !DRIVE ?auto_3894 ?auto_3895 ?auto_3893 )
      ( !UNLOAD ?auto_3892 ?auto_3891 ?auto_3894 ?auto_3893 )
      ( !DROP ?auto_3892 ?auto_3891 ?auto_3890 ?auto_3893 )
      ( MAKE-1CRATE-VERIFY ?auto_3890 ?auto_3891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3900 - SURFACE
      ?auto_3901 - SURFACE
    )
    :vars
    (
      ?auto_3902 - HOIST
      ?auto_3903 - PLACE
      ?auto_3905 - PLACE
      ?auto_3906 - HOIST
      ?auto_3907 - SURFACE
      ?auto_3904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3902 ?auto_3903 ) ( SURFACE-AT ?auto_3900 ?auto_3903 ) ( CLEAR ?auto_3900 ) ( IS-CRATE ?auto_3901 ) ( AVAILABLE ?auto_3902 ) ( not ( = ?auto_3905 ?auto_3903 ) ) ( HOIST-AT ?auto_3906 ?auto_3905 ) ( AVAILABLE ?auto_3906 ) ( SURFACE-AT ?auto_3901 ?auto_3905 ) ( ON ?auto_3901 ?auto_3907 ) ( CLEAR ?auto_3901 ) ( TRUCK-AT ?auto_3904 ?auto_3903 ) ( not ( = ?auto_3900 ?auto_3901 ) ) ( not ( = ?auto_3900 ?auto_3907 ) ) ( not ( = ?auto_3901 ?auto_3907 ) ) ( not ( = ?auto_3902 ?auto_3906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3904 ?auto_3903 ?auto_3905 )
      ( !LIFT ?auto_3906 ?auto_3901 ?auto_3907 ?auto_3905 )
      ( !LOAD ?auto_3906 ?auto_3901 ?auto_3904 ?auto_3905 )
      ( !DRIVE ?auto_3904 ?auto_3905 ?auto_3903 )
      ( !UNLOAD ?auto_3902 ?auto_3901 ?auto_3904 ?auto_3903 )
      ( !DROP ?auto_3902 ?auto_3901 ?auto_3900 ?auto_3903 )
      ( MAKE-1CRATE-VERIFY ?auto_3900 ?auto_3901 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3911 - SURFACE
      ?auto_3912 - SURFACE
      ?auto_3913 - SURFACE
    )
    :vars
    (
      ?auto_3915 - HOIST
      ?auto_3916 - PLACE
      ?auto_3918 - PLACE
      ?auto_3919 - HOIST
      ?auto_3914 - SURFACE
      ?auto_3920 - PLACE
      ?auto_3922 - HOIST
      ?auto_3921 - SURFACE
      ?auto_3917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3915 ?auto_3916 ) ( IS-CRATE ?auto_3913 ) ( not ( = ?auto_3918 ?auto_3916 ) ) ( HOIST-AT ?auto_3919 ?auto_3918 ) ( AVAILABLE ?auto_3919 ) ( SURFACE-AT ?auto_3913 ?auto_3918 ) ( ON ?auto_3913 ?auto_3914 ) ( CLEAR ?auto_3913 ) ( not ( = ?auto_3912 ?auto_3913 ) ) ( not ( = ?auto_3912 ?auto_3914 ) ) ( not ( = ?auto_3913 ?auto_3914 ) ) ( not ( = ?auto_3915 ?auto_3919 ) ) ( SURFACE-AT ?auto_3911 ?auto_3916 ) ( CLEAR ?auto_3911 ) ( IS-CRATE ?auto_3912 ) ( AVAILABLE ?auto_3915 ) ( not ( = ?auto_3920 ?auto_3916 ) ) ( HOIST-AT ?auto_3922 ?auto_3920 ) ( AVAILABLE ?auto_3922 ) ( SURFACE-AT ?auto_3912 ?auto_3920 ) ( ON ?auto_3912 ?auto_3921 ) ( CLEAR ?auto_3912 ) ( TRUCK-AT ?auto_3917 ?auto_3916 ) ( not ( = ?auto_3911 ?auto_3912 ) ) ( not ( = ?auto_3911 ?auto_3921 ) ) ( not ( = ?auto_3912 ?auto_3921 ) ) ( not ( = ?auto_3915 ?auto_3922 ) ) ( not ( = ?auto_3911 ?auto_3913 ) ) ( not ( = ?auto_3911 ?auto_3914 ) ) ( not ( = ?auto_3913 ?auto_3921 ) ) ( not ( = ?auto_3918 ?auto_3920 ) ) ( not ( = ?auto_3919 ?auto_3922 ) ) ( not ( = ?auto_3914 ?auto_3921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3911 ?auto_3912 )
      ( MAKE-1CRATE ?auto_3912 ?auto_3913 )
      ( MAKE-2CRATE-VERIFY ?auto_3911 ?auto_3912 ?auto_3913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3925 - SURFACE
      ?auto_3926 - SURFACE
    )
    :vars
    (
      ?auto_3927 - HOIST
      ?auto_3928 - PLACE
      ?auto_3930 - PLACE
      ?auto_3931 - HOIST
      ?auto_3932 - SURFACE
      ?auto_3929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3927 ?auto_3928 ) ( SURFACE-AT ?auto_3925 ?auto_3928 ) ( CLEAR ?auto_3925 ) ( IS-CRATE ?auto_3926 ) ( AVAILABLE ?auto_3927 ) ( not ( = ?auto_3930 ?auto_3928 ) ) ( HOIST-AT ?auto_3931 ?auto_3930 ) ( AVAILABLE ?auto_3931 ) ( SURFACE-AT ?auto_3926 ?auto_3930 ) ( ON ?auto_3926 ?auto_3932 ) ( CLEAR ?auto_3926 ) ( TRUCK-AT ?auto_3929 ?auto_3928 ) ( not ( = ?auto_3925 ?auto_3926 ) ) ( not ( = ?auto_3925 ?auto_3932 ) ) ( not ( = ?auto_3926 ?auto_3932 ) ) ( not ( = ?auto_3927 ?auto_3931 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3929 ?auto_3928 ?auto_3930 )
      ( !LIFT ?auto_3931 ?auto_3926 ?auto_3932 ?auto_3930 )
      ( !LOAD ?auto_3931 ?auto_3926 ?auto_3929 ?auto_3930 )
      ( !DRIVE ?auto_3929 ?auto_3930 ?auto_3928 )
      ( !UNLOAD ?auto_3927 ?auto_3926 ?auto_3929 ?auto_3928 )
      ( !DROP ?auto_3927 ?auto_3926 ?auto_3925 ?auto_3928 )
      ( MAKE-1CRATE-VERIFY ?auto_3925 ?auto_3926 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3937 - SURFACE
      ?auto_3938 - SURFACE
      ?auto_3939 - SURFACE
      ?auto_3940 - SURFACE
    )
    :vars
    (
      ?auto_3941 - HOIST
      ?auto_3946 - PLACE
      ?auto_3943 - PLACE
      ?auto_3942 - HOIST
      ?auto_3944 - SURFACE
      ?auto_3948 - PLACE
      ?auto_3947 - HOIST
      ?auto_3949 - SURFACE
      ?auto_3952 - PLACE
      ?auto_3950 - HOIST
      ?auto_3951 - SURFACE
      ?auto_3945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3941 ?auto_3946 ) ( IS-CRATE ?auto_3940 ) ( not ( = ?auto_3943 ?auto_3946 ) ) ( HOIST-AT ?auto_3942 ?auto_3943 ) ( AVAILABLE ?auto_3942 ) ( SURFACE-AT ?auto_3940 ?auto_3943 ) ( ON ?auto_3940 ?auto_3944 ) ( CLEAR ?auto_3940 ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3944 ) ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( not ( = ?auto_3941 ?auto_3942 ) ) ( IS-CRATE ?auto_3939 ) ( not ( = ?auto_3948 ?auto_3946 ) ) ( HOIST-AT ?auto_3947 ?auto_3948 ) ( AVAILABLE ?auto_3947 ) ( SURFACE-AT ?auto_3939 ?auto_3948 ) ( ON ?auto_3939 ?auto_3949 ) ( CLEAR ?auto_3939 ) ( not ( = ?auto_3938 ?auto_3939 ) ) ( not ( = ?auto_3938 ?auto_3949 ) ) ( not ( = ?auto_3939 ?auto_3949 ) ) ( not ( = ?auto_3941 ?auto_3947 ) ) ( SURFACE-AT ?auto_3937 ?auto_3946 ) ( CLEAR ?auto_3937 ) ( IS-CRATE ?auto_3938 ) ( AVAILABLE ?auto_3941 ) ( not ( = ?auto_3952 ?auto_3946 ) ) ( HOIST-AT ?auto_3950 ?auto_3952 ) ( AVAILABLE ?auto_3950 ) ( SURFACE-AT ?auto_3938 ?auto_3952 ) ( ON ?auto_3938 ?auto_3951 ) ( CLEAR ?auto_3938 ) ( TRUCK-AT ?auto_3945 ?auto_3946 ) ( not ( = ?auto_3937 ?auto_3938 ) ) ( not ( = ?auto_3937 ?auto_3951 ) ) ( not ( = ?auto_3938 ?auto_3951 ) ) ( not ( = ?auto_3941 ?auto_3950 ) ) ( not ( = ?auto_3937 ?auto_3939 ) ) ( not ( = ?auto_3937 ?auto_3949 ) ) ( not ( = ?auto_3939 ?auto_3951 ) ) ( not ( = ?auto_3948 ?auto_3952 ) ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3949 ?auto_3951 ) ) ( not ( = ?auto_3937 ?auto_3940 ) ) ( not ( = ?auto_3937 ?auto_3944 ) ) ( not ( = ?auto_3938 ?auto_3940 ) ) ( not ( = ?auto_3938 ?auto_3944 ) ) ( not ( = ?auto_3940 ?auto_3949 ) ) ( not ( = ?auto_3940 ?auto_3951 ) ) ( not ( = ?auto_3943 ?auto_3948 ) ) ( not ( = ?auto_3943 ?auto_3952 ) ) ( not ( = ?auto_3942 ?auto_3947 ) ) ( not ( = ?auto_3942 ?auto_3950 ) ) ( not ( = ?auto_3944 ?auto_3949 ) ) ( not ( = ?auto_3944 ?auto_3951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3937 ?auto_3938 ?auto_3939 )
      ( MAKE-1CRATE ?auto_3939 ?auto_3940 )
      ( MAKE-3CRATE-VERIFY ?auto_3937 ?auto_3938 ?auto_3939 ?auto_3940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3955 - SURFACE
      ?auto_3956 - SURFACE
    )
    :vars
    (
      ?auto_3957 - HOIST
      ?auto_3958 - PLACE
      ?auto_3960 - PLACE
      ?auto_3961 - HOIST
      ?auto_3962 - SURFACE
      ?auto_3959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3957 ?auto_3958 ) ( SURFACE-AT ?auto_3955 ?auto_3958 ) ( CLEAR ?auto_3955 ) ( IS-CRATE ?auto_3956 ) ( AVAILABLE ?auto_3957 ) ( not ( = ?auto_3960 ?auto_3958 ) ) ( HOIST-AT ?auto_3961 ?auto_3960 ) ( AVAILABLE ?auto_3961 ) ( SURFACE-AT ?auto_3956 ?auto_3960 ) ( ON ?auto_3956 ?auto_3962 ) ( CLEAR ?auto_3956 ) ( TRUCK-AT ?auto_3959 ?auto_3958 ) ( not ( = ?auto_3955 ?auto_3956 ) ) ( not ( = ?auto_3955 ?auto_3962 ) ) ( not ( = ?auto_3956 ?auto_3962 ) ) ( not ( = ?auto_3957 ?auto_3961 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3959 ?auto_3958 ?auto_3960 )
      ( !LIFT ?auto_3961 ?auto_3956 ?auto_3962 ?auto_3960 )
      ( !LOAD ?auto_3961 ?auto_3956 ?auto_3959 ?auto_3960 )
      ( !DRIVE ?auto_3959 ?auto_3960 ?auto_3958 )
      ( !UNLOAD ?auto_3957 ?auto_3956 ?auto_3959 ?auto_3958 )
      ( !DROP ?auto_3957 ?auto_3956 ?auto_3955 ?auto_3958 )
      ( MAKE-1CRATE-VERIFY ?auto_3955 ?auto_3956 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3968 - SURFACE
      ?auto_3969 - SURFACE
      ?auto_3970 - SURFACE
      ?auto_3971 - SURFACE
      ?auto_3972 - SURFACE
    )
    :vars
    (
      ?auto_3976 - HOIST
      ?auto_3977 - PLACE
      ?auto_3975 - PLACE
      ?auto_3974 - HOIST
      ?auto_3978 - SURFACE
      ?auto_3983 - PLACE
      ?auto_3985 - HOIST
      ?auto_3984 - SURFACE
      ?auto_3986 - PLACE
      ?auto_3987 - HOIST
      ?auto_3980 - SURFACE
      ?auto_3979 - PLACE
      ?auto_3982 - HOIST
      ?auto_3981 - SURFACE
      ?auto_3973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3976 ?auto_3977 ) ( IS-CRATE ?auto_3972 ) ( not ( = ?auto_3975 ?auto_3977 ) ) ( HOIST-AT ?auto_3974 ?auto_3975 ) ( AVAILABLE ?auto_3974 ) ( SURFACE-AT ?auto_3972 ?auto_3975 ) ( ON ?auto_3972 ?auto_3978 ) ( CLEAR ?auto_3972 ) ( not ( = ?auto_3971 ?auto_3972 ) ) ( not ( = ?auto_3971 ?auto_3978 ) ) ( not ( = ?auto_3972 ?auto_3978 ) ) ( not ( = ?auto_3976 ?auto_3974 ) ) ( IS-CRATE ?auto_3971 ) ( not ( = ?auto_3983 ?auto_3977 ) ) ( HOIST-AT ?auto_3985 ?auto_3983 ) ( AVAILABLE ?auto_3985 ) ( SURFACE-AT ?auto_3971 ?auto_3983 ) ( ON ?auto_3971 ?auto_3984 ) ( CLEAR ?auto_3971 ) ( not ( = ?auto_3970 ?auto_3971 ) ) ( not ( = ?auto_3970 ?auto_3984 ) ) ( not ( = ?auto_3971 ?auto_3984 ) ) ( not ( = ?auto_3976 ?auto_3985 ) ) ( IS-CRATE ?auto_3970 ) ( not ( = ?auto_3986 ?auto_3977 ) ) ( HOIST-AT ?auto_3987 ?auto_3986 ) ( AVAILABLE ?auto_3987 ) ( SURFACE-AT ?auto_3970 ?auto_3986 ) ( ON ?auto_3970 ?auto_3980 ) ( CLEAR ?auto_3970 ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( not ( = ?auto_3969 ?auto_3980 ) ) ( not ( = ?auto_3970 ?auto_3980 ) ) ( not ( = ?auto_3976 ?auto_3987 ) ) ( SURFACE-AT ?auto_3968 ?auto_3977 ) ( CLEAR ?auto_3968 ) ( IS-CRATE ?auto_3969 ) ( AVAILABLE ?auto_3976 ) ( not ( = ?auto_3979 ?auto_3977 ) ) ( HOIST-AT ?auto_3982 ?auto_3979 ) ( AVAILABLE ?auto_3982 ) ( SURFACE-AT ?auto_3969 ?auto_3979 ) ( ON ?auto_3969 ?auto_3981 ) ( CLEAR ?auto_3969 ) ( TRUCK-AT ?auto_3973 ?auto_3977 ) ( not ( = ?auto_3968 ?auto_3969 ) ) ( not ( = ?auto_3968 ?auto_3981 ) ) ( not ( = ?auto_3969 ?auto_3981 ) ) ( not ( = ?auto_3976 ?auto_3982 ) ) ( not ( = ?auto_3968 ?auto_3970 ) ) ( not ( = ?auto_3968 ?auto_3980 ) ) ( not ( = ?auto_3970 ?auto_3981 ) ) ( not ( = ?auto_3986 ?auto_3979 ) ) ( not ( = ?auto_3987 ?auto_3982 ) ) ( not ( = ?auto_3980 ?auto_3981 ) ) ( not ( = ?auto_3968 ?auto_3971 ) ) ( not ( = ?auto_3968 ?auto_3984 ) ) ( not ( = ?auto_3969 ?auto_3971 ) ) ( not ( = ?auto_3969 ?auto_3984 ) ) ( not ( = ?auto_3971 ?auto_3980 ) ) ( not ( = ?auto_3971 ?auto_3981 ) ) ( not ( = ?auto_3983 ?auto_3986 ) ) ( not ( = ?auto_3983 ?auto_3979 ) ) ( not ( = ?auto_3985 ?auto_3987 ) ) ( not ( = ?auto_3985 ?auto_3982 ) ) ( not ( = ?auto_3984 ?auto_3980 ) ) ( not ( = ?auto_3984 ?auto_3981 ) ) ( not ( = ?auto_3968 ?auto_3972 ) ) ( not ( = ?auto_3968 ?auto_3978 ) ) ( not ( = ?auto_3969 ?auto_3972 ) ) ( not ( = ?auto_3969 ?auto_3978 ) ) ( not ( = ?auto_3970 ?auto_3972 ) ) ( not ( = ?auto_3970 ?auto_3978 ) ) ( not ( = ?auto_3972 ?auto_3984 ) ) ( not ( = ?auto_3972 ?auto_3980 ) ) ( not ( = ?auto_3972 ?auto_3981 ) ) ( not ( = ?auto_3975 ?auto_3983 ) ) ( not ( = ?auto_3975 ?auto_3986 ) ) ( not ( = ?auto_3975 ?auto_3979 ) ) ( not ( = ?auto_3974 ?auto_3985 ) ) ( not ( = ?auto_3974 ?auto_3987 ) ) ( not ( = ?auto_3974 ?auto_3982 ) ) ( not ( = ?auto_3978 ?auto_3984 ) ) ( not ( = ?auto_3978 ?auto_3980 ) ) ( not ( = ?auto_3978 ?auto_3981 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3968 ?auto_3969 ?auto_3970 ?auto_3971 )
      ( MAKE-1CRATE ?auto_3971 ?auto_3972 )
      ( MAKE-4CRATE-VERIFY ?auto_3968 ?auto_3969 ?auto_3970 ?auto_3971 ?auto_3972 ) )
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
      ?auto_3993 - PLACE
      ?auto_3995 - PLACE
      ?auto_3996 - HOIST
      ?auto_3997 - SURFACE
      ?auto_3994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3992 ?auto_3993 ) ( SURFACE-AT ?auto_3990 ?auto_3993 ) ( CLEAR ?auto_3990 ) ( IS-CRATE ?auto_3991 ) ( AVAILABLE ?auto_3992 ) ( not ( = ?auto_3995 ?auto_3993 ) ) ( HOIST-AT ?auto_3996 ?auto_3995 ) ( AVAILABLE ?auto_3996 ) ( SURFACE-AT ?auto_3991 ?auto_3995 ) ( ON ?auto_3991 ?auto_3997 ) ( CLEAR ?auto_3991 ) ( TRUCK-AT ?auto_3994 ?auto_3993 ) ( not ( = ?auto_3990 ?auto_3991 ) ) ( not ( = ?auto_3990 ?auto_3997 ) ) ( not ( = ?auto_3991 ?auto_3997 ) ) ( not ( = ?auto_3992 ?auto_3996 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3994 ?auto_3993 ?auto_3995 )
      ( !LIFT ?auto_3996 ?auto_3991 ?auto_3997 ?auto_3995 )
      ( !LOAD ?auto_3996 ?auto_3991 ?auto_3994 ?auto_3995 )
      ( !DRIVE ?auto_3994 ?auto_3995 ?auto_3993 )
      ( !UNLOAD ?auto_3992 ?auto_3991 ?auto_3994 ?auto_3993 )
      ( !DROP ?auto_3992 ?auto_3991 ?auto_3990 ?auto_3993 )
      ( MAKE-1CRATE-VERIFY ?auto_3990 ?auto_3991 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4004 - SURFACE
      ?auto_4005 - SURFACE
      ?auto_4006 - SURFACE
      ?auto_4007 - SURFACE
      ?auto_4008 - SURFACE
      ?auto_4009 - SURFACE
    )
    :vars
    (
      ?auto_4014 - HOIST
      ?auto_4011 - PLACE
      ?auto_4012 - PLACE
      ?auto_4013 - HOIST
      ?auto_4010 - SURFACE
      ?auto_4017 - PLACE
      ?auto_4026 - HOIST
      ?auto_4016 - SURFACE
      ?auto_4021 - PLACE
      ?auto_4027 - HOIST
      ?auto_4022 - SURFACE
      ?auto_4018 - PLACE
      ?auto_4025 - HOIST
      ?auto_4019 - SURFACE
      ?auto_4023 - PLACE
      ?auto_4020 - HOIST
      ?auto_4024 - SURFACE
      ?auto_4015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4014 ?auto_4011 ) ( IS-CRATE ?auto_4009 ) ( not ( = ?auto_4012 ?auto_4011 ) ) ( HOIST-AT ?auto_4013 ?auto_4012 ) ( AVAILABLE ?auto_4013 ) ( SURFACE-AT ?auto_4009 ?auto_4012 ) ( ON ?auto_4009 ?auto_4010 ) ( CLEAR ?auto_4009 ) ( not ( = ?auto_4008 ?auto_4009 ) ) ( not ( = ?auto_4008 ?auto_4010 ) ) ( not ( = ?auto_4009 ?auto_4010 ) ) ( not ( = ?auto_4014 ?auto_4013 ) ) ( IS-CRATE ?auto_4008 ) ( not ( = ?auto_4017 ?auto_4011 ) ) ( HOIST-AT ?auto_4026 ?auto_4017 ) ( AVAILABLE ?auto_4026 ) ( SURFACE-AT ?auto_4008 ?auto_4017 ) ( ON ?auto_4008 ?auto_4016 ) ( CLEAR ?auto_4008 ) ( not ( = ?auto_4007 ?auto_4008 ) ) ( not ( = ?auto_4007 ?auto_4016 ) ) ( not ( = ?auto_4008 ?auto_4016 ) ) ( not ( = ?auto_4014 ?auto_4026 ) ) ( IS-CRATE ?auto_4007 ) ( not ( = ?auto_4021 ?auto_4011 ) ) ( HOIST-AT ?auto_4027 ?auto_4021 ) ( AVAILABLE ?auto_4027 ) ( SURFACE-AT ?auto_4007 ?auto_4021 ) ( ON ?auto_4007 ?auto_4022 ) ( CLEAR ?auto_4007 ) ( not ( = ?auto_4006 ?auto_4007 ) ) ( not ( = ?auto_4006 ?auto_4022 ) ) ( not ( = ?auto_4007 ?auto_4022 ) ) ( not ( = ?auto_4014 ?auto_4027 ) ) ( IS-CRATE ?auto_4006 ) ( not ( = ?auto_4018 ?auto_4011 ) ) ( HOIST-AT ?auto_4025 ?auto_4018 ) ( AVAILABLE ?auto_4025 ) ( SURFACE-AT ?auto_4006 ?auto_4018 ) ( ON ?auto_4006 ?auto_4019 ) ( CLEAR ?auto_4006 ) ( not ( = ?auto_4005 ?auto_4006 ) ) ( not ( = ?auto_4005 ?auto_4019 ) ) ( not ( = ?auto_4006 ?auto_4019 ) ) ( not ( = ?auto_4014 ?auto_4025 ) ) ( SURFACE-AT ?auto_4004 ?auto_4011 ) ( CLEAR ?auto_4004 ) ( IS-CRATE ?auto_4005 ) ( AVAILABLE ?auto_4014 ) ( not ( = ?auto_4023 ?auto_4011 ) ) ( HOIST-AT ?auto_4020 ?auto_4023 ) ( AVAILABLE ?auto_4020 ) ( SURFACE-AT ?auto_4005 ?auto_4023 ) ( ON ?auto_4005 ?auto_4024 ) ( CLEAR ?auto_4005 ) ( TRUCK-AT ?auto_4015 ?auto_4011 ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_4004 ?auto_4024 ) ) ( not ( = ?auto_4005 ?auto_4024 ) ) ( not ( = ?auto_4014 ?auto_4020 ) ) ( not ( = ?auto_4004 ?auto_4006 ) ) ( not ( = ?auto_4004 ?auto_4019 ) ) ( not ( = ?auto_4006 ?auto_4024 ) ) ( not ( = ?auto_4018 ?auto_4023 ) ) ( not ( = ?auto_4025 ?auto_4020 ) ) ( not ( = ?auto_4019 ?auto_4024 ) ) ( not ( = ?auto_4004 ?auto_4007 ) ) ( not ( = ?auto_4004 ?auto_4022 ) ) ( not ( = ?auto_4005 ?auto_4007 ) ) ( not ( = ?auto_4005 ?auto_4022 ) ) ( not ( = ?auto_4007 ?auto_4019 ) ) ( not ( = ?auto_4007 ?auto_4024 ) ) ( not ( = ?auto_4021 ?auto_4018 ) ) ( not ( = ?auto_4021 ?auto_4023 ) ) ( not ( = ?auto_4027 ?auto_4025 ) ) ( not ( = ?auto_4027 ?auto_4020 ) ) ( not ( = ?auto_4022 ?auto_4019 ) ) ( not ( = ?auto_4022 ?auto_4024 ) ) ( not ( = ?auto_4004 ?auto_4008 ) ) ( not ( = ?auto_4004 ?auto_4016 ) ) ( not ( = ?auto_4005 ?auto_4008 ) ) ( not ( = ?auto_4005 ?auto_4016 ) ) ( not ( = ?auto_4006 ?auto_4008 ) ) ( not ( = ?auto_4006 ?auto_4016 ) ) ( not ( = ?auto_4008 ?auto_4022 ) ) ( not ( = ?auto_4008 ?auto_4019 ) ) ( not ( = ?auto_4008 ?auto_4024 ) ) ( not ( = ?auto_4017 ?auto_4021 ) ) ( not ( = ?auto_4017 ?auto_4018 ) ) ( not ( = ?auto_4017 ?auto_4023 ) ) ( not ( = ?auto_4026 ?auto_4027 ) ) ( not ( = ?auto_4026 ?auto_4025 ) ) ( not ( = ?auto_4026 ?auto_4020 ) ) ( not ( = ?auto_4016 ?auto_4022 ) ) ( not ( = ?auto_4016 ?auto_4019 ) ) ( not ( = ?auto_4016 ?auto_4024 ) ) ( not ( = ?auto_4004 ?auto_4009 ) ) ( not ( = ?auto_4004 ?auto_4010 ) ) ( not ( = ?auto_4005 ?auto_4009 ) ) ( not ( = ?auto_4005 ?auto_4010 ) ) ( not ( = ?auto_4006 ?auto_4009 ) ) ( not ( = ?auto_4006 ?auto_4010 ) ) ( not ( = ?auto_4007 ?auto_4009 ) ) ( not ( = ?auto_4007 ?auto_4010 ) ) ( not ( = ?auto_4009 ?auto_4016 ) ) ( not ( = ?auto_4009 ?auto_4022 ) ) ( not ( = ?auto_4009 ?auto_4019 ) ) ( not ( = ?auto_4009 ?auto_4024 ) ) ( not ( = ?auto_4012 ?auto_4017 ) ) ( not ( = ?auto_4012 ?auto_4021 ) ) ( not ( = ?auto_4012 ?auto_4018 ) ) ( not ( = ?auto_4012 ?auto_4023 ) ) ( not ( = ?auto_4013 ?auto_4026 ) ) ( not ( = ?auto_4013 ?auto_4027 ) ) ( not ( = ?auto_4013 ?auto_4025 ) ) ( not ( = ?auto_4013 ?auto_4020 ) ) ( not ( = ?auto_4010 ?auto_4016 ) ) ( not ( = ?auto_4010 ?auto_4022 ) ) ( not ( = ?auto_4010 ?auto_4019 ) ) ( not ( = ?auto_4010 ?auto_4024 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4004 ?auto_4005 ?auto_4006 ?auto_4007 ?auto_4008 )
      ( MAKE-1CRATE ?auto_4008 ?auto_4009 )
      ( MAKE-5CRATE-VERIFY ?auto_4004 ?auto_4005 ?auto_4006 ?auto_4007 ?auto_4008 ?auto_4009 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4030 - SURFACE
      ?auto_4031 - SURFACE
    )
    :vars
    (
      ?auto_4032 - HOIST
      ?auto_4033 - PLACE
      ?auto_4035 - PLACE
      ?auto_4036 - HOIST
      ?auto_4037 - SURFACE
      ?auto_4034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4032 ?auto_4033 ) ( SURFACE-AT ?auto_4030 ?auto_4033 ) ( CLEAR ?auto_4030 ) ( IS-CRATE ?auto_4031 ) ( AVAILABLE ?auto_4032 ) ( not ( = ?auto_4035 ?auto_4033 ) ) ( HOIST-AT ?auto_4036 ?auto_4035 ) ( AVAILABLE ?auto_4036 ) ( SURFACE-AT ?auto_4031 ?auto_4035 ) ( ON ?auto_4031 ?auto_4037 ) ( CLEAR ?auto_4031 ) ( TRUCK-AT ?auto_4034 ?auto_4033 ) ( not ( = ?auto_4030 ?auto_4031 ) ) ( not ( = ?auto_4030 ?auto_4037 ) ) ( not ( = ?auto_4031 ?auto_4037 ) ) ( not ( = ?auto_4032 ?auto_4036 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4034 ?auto_4033 ?auto_4035 )
      ( !LIFT ?auto_4036 ?auto_4031 ?auto_4037 ?auto_4035 )
      ( !LOAD ?auto_4036 ?auto_4031 ?auto_4034 ?auto_4035 )
      ( !DRIVE ?auto_4034 ?auto_4035 ?auto_4033 )
      ( !UNLOAD ?auto_4032 ?auto_4031 ?auto_4034 ?auto_4033 )
      ( !DROP ?auto_4032 ?auto_4031 ?auto_4030 ?auto_4033 )
      ( MAKE-1CRATE-VERIFY ?auto_4030 ?auto_4031 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4045 - SURFACE
      ?auto_4046 - SURFACE
      ?auto_4047 - SURFACE
      ?auto_4048 - SURFACE
      ?auto_4049 - SURFACE
      ?auto_4050 - SURFACE
      ?auto_4051 - SURFACE
    )
    :vars
    (
      ?auto_4056 - HOIST
      ?auto_4055 - PLACE
      ?auto_4053 - PLACE
      ?auto_4054 - HOIST
      ?auto_4052 - SURFACE
      ?auto_4070 - PLACE
      ?auto_4069 - HOIST
      ?auto_4068 - SURFACE
      ?auto_4072 - PLACE
      ?auto_4059 - HOIST
      ?auto_4063 - SURFACE
      ?auto_4062 - PLACE
      ?auto_4060 - HOIST
      ?auto_4064 - SURFACE
      ?auto_4071 - PLACE
      ?auto_4058 - HOIST
      ?auto_4066 - SURFACE
      ?auto_4065 - PLACE
      ?auto_4061 - HOIST
      ?auto_4067 - SURFACE
      ?auto_4057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4056 ?auto_4055 ) ( IS-CRATE ?auto_4051 ) ( not ( = ?auto_4053 ?auto_4055 ) ) ( HOIST-AT ?auto_4054 ?auto_4053 ) ( AVAILABLE ?auto_4054 ) ( SURFACE-AT ?auto_4051 ?auto_4053 ) ( ON ?auto_4051 ?auto_4052 ) ( CLEAR ?auto_4051 ) ( not ( = ?auto_4050 ?auto_4051 ) ) ( not ( = ?auto_4050 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4052 ) ) ( not ( = ?auto_4056 ?auto_4054 ) ) ( IS-CRATE ?auto_4050 ) ( not ( = ?auto_4070 ?auto_4055 ) ) ( HOIST-AT ?auto_4069 ?auto_4070 ) ( AVAILABLE ?auto_4069 ) ( SURFACE-AT ?auto_4050 ?auto_4070 ) ( ON ?auto_4050 ?auto_4068 ) ( CLEAR ?auto_4050 ) ( not ( = ?auto_4049 ?auto_4050 ) ) ( not ( = ?auto_4049 ?auto_4068 ) ) ( not ( = ?auto_4050 ?auto_4068 ) ) ( not ( = ?auto_4056 ?auto_4069 ) ) ( IS-CRATE ?auto_4049 ) ( not ( = ?auto_4072 ?auto_4055 ) ) ( HOIST-AT ?auto_4059 ?auto_4072 ) ( AVAILABLE ?auto_4059 ) ( SURFACE-AT ?auto_4049 ?auto_4072 ) ( ON ?auto_4049 ?auto_4063 ) ( CLEAR ?auto_4049 ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4063 ) ) ( not ( = ?auto_4049 ?auto_4063 ) ) ( not ( = ?auto_4056 ?auto_4059 ) ) ( IS-CRATE ?auto_4048 ) ( not ( = ?auto_4062 ?auto_4055 ) ) ( HOIST-AT ?auto_4060 ?auto_4062 ) ( AVAILABLE ?auto_4060 ) ( SURFACE-AT ?auto_4048 ?auto_4062 ) ( ON ?auto_4048 ?auto_4064 ) ( CLEAR ?auto_4048 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( not ( = ?auto_4047 ?auto_4064 ) ) ( not ( = ?auto_4048 ?auto_4064 ) ) ( not ( = ?auto_4056 ?auto_4060 ) ) ( IS-CRATE ?auto_4047 ) ( not ( = ?auto_4071 ?auto_4055 ) ) ( HOIST-AT ?auto_4058 ?auto_4071 ) ( AVAILABLE ?auto_4058 ) ( SURFACE-AT ?auto_4047 ?auto_4071 ) ( ON ?auto_4047 ?auto_4066 ) ( CLEAR ?auto_4047 ) ( not ( = ?auto_4046 ?auto_4047 ) ) ( not ( = ?auto_4046 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4066 ) ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( SURFACE-AT ?auto_4045 ?auto_4055 ) ( CLEAR ?auto_4045 ) ( IS-CRATE ?auto_4046 ) ( AVAILABLE ?auto_4056 ) ( not ( = ?auto_4065 ?auto_4055 ) ) ( HOIST-AT ?auto_4061 ?auto_4065 ) ( AVAILABLE ?auto_4061 ) ( SURFACE-AT ?auto_4046 ?auto_4065 ) ( ON ?auto_4046 ?auto_4067 ) ( CLEAR ?auto_4046 ) ( TRUCK-AT ?auto_4057 ?auto_4055 ) ( not ( = ?auto_4045 ?auto_4046 ) ) ( not ( = ?auto_4045 ?auto_4067 ) ) ( not ( = ?auto_4046 ?auto_4067 ) ) ( not ( = ?auto_4056 ?auto_4061 ) ) ( not ( = ?auto_4045 ?auto_4047 ) ) ( not ( = ?auto_4045 ?auto_4066 ) ) ( not ( = ?auto_4047 ?auto_4067 ) ) ( not ( = ?auto_4071 ?auto_4065 ) ) ( not ( = ?auto_4058 ?auto_4061 ) ) ( not ( = ?auto_4066 ?auto_4067 ) ) ( not ( = ?auto_4045 ?auto_4048 ) ) ( not ( = ?auto_4045 ?auto_4064 ) ) ( not ( = ?auto_4046 ?auto_4048 ) ) ( not ( = ?auto_4046 ?auto_4064 ) ) ( not ( = ?auto_4048 ?auto_4066 ) ) ( not ( = ?auto_4048 ?auto_4067 ) ) ( not ( = ?auto_4062 ?auto_4071 ) ) ( not ( = ?auto_4062 ?auto_4065 ) ) ( not ( = ?auto_4060 ?auto_4058 ) ) ( not ( = ?auto_4060 ?auto_4061 ) ) ( not ( = ?auto_4064 ?auto_4066 ) ) ( not ( = ?auto_4064 ?auto_4067 ) ) ( not ( = ?auto_4045 ?auto_4049 ) ) ( not ( = ?auto_4045 ?auto_4063 ) ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4063 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( not ( = ?auto_4047 ?auto_4063 ) ) ( not ( = ?auto_4049 ?auto_4064 ) ) ( not ( = ?auto_4049 ?auto_4066 ) ) ( not ( = ?auto_4049 ?auto_4067 ) ) ( not ( = ?auto_4072 ?auto_4062 ) ) ( not ( = ?auto_4072 ?auto_4071 ) ) ( not ( = ?auto_4072 ?auto_4065 ) ) ( not ( = ?auto_4059 ?auto_4060 ) ) ( not ( = ?auto_4059 ?auto_4058 ) ) ( not ( = ?auto_4059 ?auto_4061 ) ) ( not ( = ?auto_4063 ?auto_4064 ) ) ( not ( = ?auto_4063 ?auto_4066 ) ) ( not ( = ?auto_4063 ?auto_4067 ) ) ( not ( = ?auto_4045 ?auto_4050 ) ) ( not ( = ?auto_4045 ?auto_4068 ) ) ( not ( = ?auto_4046 ?auto_4050 ) ) ( not ( = ?auto_4046 ?auto_4068 ) ) ( not ( = ?auto_4047 ?auto_4050 ) ) ( not ( = ?auto_4047 ?auto_4068 ) ) ( not ( = ?auto_4048 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4068 ) ) ( not ( = ?auto_4050 ?auto_4063 ) ) ( not ( = ?auto_4050 ?auto_4064 ) ) ( not ( = ?auto_4050 ?auto_4066 ) ) ( not ( = ?auto_4050 ?auto_4067 ) ) ( not ( = ?auto_4070 ?auto_4072 ) ) ( not ( = ?auto_4070 ?auto_4062 ) ) ( not ( = ?auto_4070 ?auto_4071 ) ) ( not ( = ?auto_4070 ?auto_4065 ) ) ( not ( = ?auto_4069 ?auto_4059 ) ) ( not ( = ?auto_4069 ?auto_4060 ) ) ( not ( = ?auto_4069 ?auto_4058 ) ) ( not ( = ?auto_4069 ?auto_4061 ) ) ( not ( = ?auto_4068 ?auto_4063 ) ) ( not ( = ?auto_4068 ?auto_4064 ) ) ( not ( = ?auto_4068 ?auto_4066 ) ) ( not ( = ?auto_4068 ?auto_4067 ) ) ( not ( = ?auto_4045 ?auto_4051 ) ) ( not ( = ?auto_4045 ?auto_4052 ) ) ( not ( = ?auto_4046 ?auto_4051 ) ) ( not ( = ?auto_4046 ?auto_4052 ) ) ( not ( = ?auto_4047 ?auto_4051 ) ) ( not ( = ?auto_4047 ?auto_4052 ) ) ( not ( = ?auto_4048 ?auto_4051 ) ) ( not ( = ?auto_4048 ?auto_4052 ) ) ( not ( = ?auto_4049 ?auto_4051 ) ) ( not ( = ?auto_4049 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4068 ) ) ( not ( = ?auto_4051 ?auto_4063 ) ) ( not ( = ?auto_4051 ?auto_4064 ) ) ( not ( = ?auto_4051 ?auto_4066 ) ) ( not ( = ?auto_4051 ?auto_4067 ) ) ( not ( = ?auto_4053 ?auto_4070 ) ) ( not ( = ?auto_4053 ?auto_4072 ) ) ( not ( = ?auto_4053 ?auto_4062 ) ) ( not ( = ?auto_4053 ?auto_4071 ) ) ( not ( = ?auto_4053 ?auto_4065 ) ) ( not ( = ?auto_4054 ?auto_4069 ) ) ( not ( = ?auto_4054 ?auto_4059 ) ) ( not ( = ?auto_4054 ?auto_4060 ) ) ( not ( = ?auto_4054 ?auto_4058 ) ) ( not ( = ?auto_4054 ?auto_4061 ) ) ( not ( = ?auto_4052 ?auto_4068 ) ) ( not ( = ?auto_4052 ?auto_4063 ) ) ( not ( = ?auto_4052 ?auto_4064 ) ) ( not ( = ?auto_4052 ?auto_4066 ) ) ( not ( = ?auto_4052 ?auto_4067 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4045 ?auto_4046 ?auto_4047 ?auto_4048 ?auto_4049 ?auto_4050 )
      ( MAKE-1CRATE ?auto_4050 ?auto_4051 )
      ( MAKE-6CRATE-VERIFY ?auto_4045 ?auto_4046 ?auto_4047 ?auto_4048 ?auto_4049 ?auto_4050 ?auto_4051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4075 - SURFACE
      ?auto_4076 - SURFACE
    )
    :vars
    (
      ?auto_4077 - HOIST
      ?auto_4078 - PLACE
      ?auto_4080 - PLACE
      ?auto_4081 - HOIST
      ?auto_4082 - SURFACE
      ?auto_4079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4077 ?auto_4078 ) ( SURFACE-AT ?auto_4075 ?auto_4078 ) ( CLEAR ?auto_4075 ) ( IS-CRATE ?auto_4076 ) ( AVAILABLE ?auto_4077 ) ( not ( = ?auto_4080 ?auto_4078 ) ) ( HOIST-AT ?auto_4081 ?auto_4080 ) ( AVAILABLE ?auto_4081 ) ( SURFACE-AT ?auto_4076 ?auto_4080 ) ( ON ?auto_4076 ?auto_4082 ) ( CLEAR ?auto_4076 ) ( TRUCK-AT ?auto_4079 ?auto_4078 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4082 ) ) ( not ( = ?auto_4076 ?auto_4082 ) ) ( not ( = ?auto_4077 ?auto_4081 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4079 ?auto_4078 ?auto_4080 )
      ( !LIFT ?auto_4081 ?auto_4076 ?auto_4082 ?auto_4080 )
      ( !LOAD ?auto_4081 ?auto_4076 ?auto_4079 ?auto_4080 )
      ( !DRIVE ?auto_4079 ?auto_4080 ?auto_4078 )
      ( !UNLOAD ?auto_4077 ?auto_4076 ?auto_4079 ?auto_4078 )
      ( !DROP ?auto_4077 ?auto_4076 ?auto_4075 ?auto_4078 )
      ( MAKE-1CRATE-VERIFY ?auto_4075 ?auto_4076 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4091 - SURFACE
      ?auto_4092 - SURFACE
      ?auto_4093 - SURFACE
      ?auto_4094 - SURFACE
      ?auto_4095 - SURFACE
      ?auto_4096 - SURFACE
      ?auto_4097 - SURFACE
      ?auto_4098 - SURFACE
    )
    :vars
    (
      ?auto_4104 - HOIST
      ?auto_4103 - PLACE
      ?auto_4102 - PLACE
      ?auto_4099 - HOIST
      ?auto_4100 - SURFACE
      ?auto_4117 - PLACE
      ?auto_4106 - HOIST
      ?auto_4115 - SURFACE
      ?auto_4110 - PLACE
      ?auto_4109 - HOIST
      ?auto_4107 - SURFACE
      ?auto_4118 - PLACE
      ?auto_4120 - HOIST
      ?auto_4113 - SURFACE
      ?auto_4114 - PLACE
      ?auto_4116 - HOIST
      ?auto_4112 - SURFACE
      ?auto_4111 - PLACE
      ?auto_4105 - HOIST
      ?auto_4119 - SURFACE
      ?auto_4108 - SURFACE
      ?auto_4101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4104 ?auto_4103 ) ( IS-CRATE ?auto_4098 ) ( not ( = ?auto_4102 ?auto_4103 ) ) ( HOIST-AT ?auto_4099 ?auto_4102 ) ( SURFACE-AT ?auto_4098 ?auto_4102 ) ( ON ?auto_4098 ?auto_4100 ) ( CLEAR ?auto_4098 ) ( not ( = ?auto_4097 ?auto_4098 ) ) ( not ( = ?auto_4097 ?auto_4100 ) ) ( not ( = ?auto_4098 ?auto_4100 ) ) ( not ( = ?auto_4104 ?auto_4099 ) ) ( IS-CRATE ?auto_4097 ) ( not ( = ?auto_4117 ?auto_4103 ) ) ( HOIST-AT ?auto_4106 ?auto_4117 ) ( AVAILABLE ?auto_4106 ) ( SURFACE-AT ?auto_4097 ?auto_4117 ) ( ON ?auto_4097 ?auto_4115 ) ( CLEAR ?auto_4097 ) ( not ( = ?auto_4096 ?auto_4097 ) ) ( not ( = ?auto_4096 ?auto_4115 ) ) ( not ( = ?auto_4097 ?auto_4115 ) ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( IS-CRATE ?auto_4096 ) ( not ( = ?auto_4110 ?auto_4103 ) ) ( HOIST-AT ?auto_4109 ?auto_4110 ) ( AVAILABLE ?auto_4109 ) ( SURFACE-AT ?auto_4096 ?auto_4110 ) ( ON ?auto_4096 ?auto_4107 ) ( CLEAR ?auto_4096 ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( not ( = ?auto_4095 ?auto_4107 ) ) ( not ( = ?auto_4096 ?auto_4107 ) ) ( not ( = ?auto_4104 ?auto_4109 ) ) ( IS-CRATE ?auto_4095 ) ( not ( = ?auto_4118 ?auto_4103 ) ) ( HOIST-AT ?auto_4120 ?auto_4118 ) ( AVAILABLE ?auto_4120 ) ( SURFACE-AT ?auto_4095 ?auto_4118 ) ( ON ?auto_4095 ?auto_4113 ) ( CLEAR ?auto_4095 ) ( not ( = ?auto_4094 ?auto_4095 ) ) ( not ( = ?auto_4094 ?auto_4113 ) ) ( not ( = ?auto_4095 ?auto_4113 ) ) ( not ( = ?auto_4104 ?auto_4120 ) ) ( IS-CRATE ?auto_4094 ) ( not ( = ?auto_4114 ?auto_4103 ) ) ( HOIST-AT ?auto_4116 ?auto_4114 ) ( AVAILABLE ?auto_4116 ) ( SURFACE-AT ?auto_4094 ?auto_4114 ) ( ON ?auto_4094 ?auto_4112 ) ( CLEAR ?auto_4094 ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4112 ) ) ( not ( = ?auto_4094 ?auto_4112 ) ) ( not ( = ?auto_4104 ?auto_4116 ) ) ( IS-CRATE ?auto_4093 ) ( not ( = ?auto_4111 ?auto_4103 ) ) ( HOIST-AT ?auto_4105 ?auto_4111 ) ( AVAILABLE ?auto_4105 ) ( SURFACE-AT ?auto_4093 ?auto_4111 ) ( ON ?auto_4093 ?auto_4119 ) ( CLEAR ?auto_4093 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4119 ) ) ( not ( = ?auto_4093 ?auto_4119 ) ) ( not ( = ?auto_4104 ?auto_4105 ) ) ( SURFACE-AT ?auto_4091 ?auto_4103 ) ( CLEAR ?auto_4091 ) ( IS-CRATE ?auto_4092 ) ( AVAILABLE ?auto_4104 ) ( AVAILABLE ?auto_4099 ) ( SURFACE-AT ?auto_4092 ?auto_4102 ) ( ON ?auto_4092 ?auto_4108 ) ( CLEAR ?auto_4092 ) ( TRUCK-AT ?auto_4101 ?auto_4103 ) ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4108 ) ) ( not ( = ?auto_4092 ?auto_4108 ) ) ( not ( = ?auto_4091 ?auto_4093 ) ) ( not ( = ?auto_4091 ?auto_4119 ) ) ( not ( = ?auto_4093 ?auto_4108 ) ) ( not ( = ?auto_4111 ?auto_4102 ) ) ( not ( = ?auto_4105 ?auto_4099 ) ) ( not ( = ?auto_4119 ?auto_4108 ) ) ( not ( = ?auto_4091 ?auto_4094 ) ) ( not ( = ?auto_4091 ?auto_4112 ) ) ( not ( = ?auto_4092 ?auto_4094 ) ) ( not ( = ?auto_4092 ?auto_4112 ) ) ( not ( = ?auto_4094 ?auto_4119 ) ) ( not ( = ?auto_4094 ?auto_4108 ) ) ( not ( = ?auto_4114 ?auto_4111 ) ) ( not ( = ?auto_4114 ?auto_4102 ) ) ( not ( = ?auto_4116 ?auto_4105 ) ) ( not ( = ?auto_4116 ?auto_4099 ) ) ( not ( = ?auto_4112 ?auto_4119 ) ) ( not ( = ?auto_4112 ?auto_4108 ) ) ( not ( = ?auto_4091 ?auto_4095 ) ) ( not ( = ?auto_4091 ?auto_4113 ) ) ( not ( = ?auto_4092 ?auto_4095 ) ) ( not ( = ?auto_4092 ?auto_4113 ) ) ( not ( = ?auto_4093 ?auto_4095 ) ) ( not ( = ?auto_4093 ?auto_4113 ) ) ( not ( = ?auto_4095 ?auto_4112 ) ) ( not ( = ?auto_4095 ?auto_4119 ) ) ( not ( = ?auto_4095 ?auto_4108 ) ) ( not ( = ?auto_4118 ?auto_4114 ) ) ( not ( = ?auto_4118 ?auto_4111 ) ) ( not ( = ?auto_4118 ?auto_4102 ) ) ( not ( = ?auto_4120 ?auto_4116 ) ) ( not ( = ?auto_4120 ?auto_4105 ) ) ( not ( = ?auto_4120 ?auto_4099 ) ) ( not ( = ?auto_4113 ?auto_4112 ) ) ( not ( = ?auto_4113 ?auto_4119 ) ) ( not ( = ?auto_4113 ?auto_4108 ) ) ( not ( = ?auto_4091 ?auto_4096 ) ) ( not ( = ?auto_4091 ?auto_4107 ) ) ( not ( = ?auto_4092 ?auto_4096 ) ) ( not ( = ?auto_4092 ?auto_4107 ) ) ( not ( = ?auto_4093 ?auto_4096 ) ) ( not ( = ?auto_4093 ?auto_4107 ) ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( not ( = ?auto_4094 ?auto_4107 ) ) ( not ( = ?auto_4096 ?auto_4113 ) ) ( not ( = ?auto_4096 ?auto_4112 ) ) ( not ( = ?auto_4096 ?auto_4119 ) ) ( not ( = ?auto_4096 ?auto_4108 ) ) ( not ( = ?auto_4110 ?auto_4118 ) ) ( not ( = ?auto_4110 ?auto_4114 ) ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( not ( = ?auto_4110 ?auto_4102 ) ) ( not ( = ?auto_4109 ?auto_4120 ) ) ( not ( = ?auto_4109 ?auto_4116 ) ) ( not ( = ?auto_4109 ?auto_4105 ) ) ( not ( = ?auto_4109 ?auto_4099 ) ) ( not ( = ?auto_4107 ?auto_4113 ) ) ( not ( = ?auto_4107 ?auto_4112 ) ) ( not ( = ?auto_4107 ?auto_4119 ) ) ( not ( = ?auto_4107 ?auto_4108 ) ) ( not ( = ?auto_4091 ?auto_4097 ) ) ( not ( = ?auto_4091 ?auto_4115 ) ) ( not ( = ?auto_4092 ?auto_4097 ) ) ( not ( = ?auto_4092 ?auto_4115 ) ) ( not ( = ?auto_4093 ?auto_4097 ) ) ( not ( = ?auto_4093 ?auto_4115 ) ) ( not ( = ?auto_4094 ?auto_4097 ) ) ( not ( = ?auto_4094 ?auto_4115 ) ) ( not ( = ?auto_4095 ?auto_4097 ) ) ( not ( = ?auto_4095 ?auto_4115 ) ) ( not ( = ?auto_4097 ?auto_4107 ) ) ( not ( = ?auto_4097 ?auto_4113 ) ) ( not ( = ?auto_4097 ?auto_4112 ) ) ( not ( = ?auto_4097 ?auto_4119 ) ) ( not ( = ?auto_4097 ?auto_4108 ) ) ( not ( = ?auto_4117 ?auto_4110 ) ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4114 ) ) ( not ( = ?auto_4117 ?auto_4111 ) ) ( not ( = ?auto_4117 ?auto_4102 ) ) ( not ( = ?auto_4106 ?auto_4109 ) ) ( not ( = ?auto_4106 ?auto_4120 ) ) ( not ( = ?auto_4106 ?auto_4116 ) ) ( not ( = ?auto_4106 ?auto_4105 ) ) ( not ( = ?auto_4106 ?auto_4099 ) ) ( not ( = ?auto_4115 ?auto_4107 ) ) ( not ( = ?auto_4115 ?auto_4113 ) ) ( not ( = ?auto_4115 ?auto_4112 ) ) ( not ( = ?auto_4115 ?auto_4119 ) ) ( not ( = ?auto_4115 ?auto_4108 ) ) ( not ( = ?auto_4091 ?auto_4098 ) ) ( not ( = ?auto_4091 ?auto_4100 ) ) ( not ( = ?auto_4092 ?auto_4098 ) ) ( not ( = ?auto_4092 ?auto_4100 ) ) ( not ( = ?auto_4093 ?auto_4098 ) ) ( not ( = ?auto_4093 ?auto_4100 ) ) ( not ( = ?auto_4094 ?auto_4098 ) ) ( not ( = ?auto_4094 ?auto_4100 ) ) ( not ( = ?auto_4095 ?auto_4098 ) ) ( not ( = ?auto_4095 ?auto_4100 ) ) ( not ( = ?auto_4096 ?auto_4098 ) ) ( not ( = ?auto_4096 ?auto_4100 ) ) ( not ( = ?auto_4098 ?auto_4115 ) ) ( not ( = ?auto_4098 ?auto_4107 ) ) ( not ( = ?auto_4098 ?auto_4113 ) ) ( not ( = ?auto_4098 ?auto_4112 ) ) ( not ( = ?auto_4098 ?auto_4119 ) ) ( not ( = ?auto_4098 ?auto_4108 ) ) ( not ( = ?auto_4100 ?auto_4115 ) ) ( not ( = ?auto_4100 ?auto_4107 ) ) ( not ( = ?auto_4100 ?auto_4113 ) ) ( not ( = ?auto_4100 ?auto_4112 ) ) ( not ( = ?auto_4100 ?auto_4119 ) ) ( not ( = ?auto_4100 ?auto_4108 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4094 ?auto_4095 ?auto_4096 ?auto_4097 )
      ( MAKE-1CRATE ?auto_4097 ?auto_4098 )
      ( MAKE-7CRATE-VERIFY ?auto_4091 ?auto_4092 ?auto_4093 ?auto_4094 ?auto_4095 ?auto_4096 ?auto_4097 ?auto_4098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4123 - SURFACE
      ?auto_4124 - SURFACE
    )
    :vars
    (
      ?auto_4125 - HOIST
      ?auto_4126 - PLACE
      ?auto_4128 - PLACE
      ?auto_4129 - HOIST
      ?auto_4130 - SURFACE
      ?auto_4127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4125 ?auto_4126 ) ( SURFACE-AT ?auto_4123 ?auto_4126 ) ( CLEAR ?auto_4123 ) ( IS-CRATE ?auto_4124 ) ( AVAILABLE ?auto_4125 ) ( not ( = ?auto_4128 ?auto_4126 ) ) ( HOIST-AT ?auto_4129 ?auto_4128 ) ( AVAILABLE ?auto_4129 ) ( SURFACE-AT ?auto_4124 ?auto_4128 ) ( ON ?auto_4124 ?auto_4130 ) ( CLEAR ?auto_4124 ) ( TRUCK-AT ?auto_4127 ?auto_4126 ) ( not ( = ?auto_4123 ?auto_4124 ) ) ( not ( = ?auto_4123 ?auto_4130 ) ) ( not ( = ?auto_4124 ?auto_4130 ) ) ( not ( = ?auto_4125 ?auto_4129 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4127 ?auto_4126 ?auto_4128 )
      ( !LIFT ?auto_4129 ?auto_4124 ?auto_4130 ?auto_4128 )
      ( !LOAD ?auto_4129 ?auto_4124 ?auto_4127 ?auto_4128 )
      ( !DRIVE ?auto_4127 ?auto_4128 ?auto_4126 )
      ( !UNLOAD ?auto_4125 ?auto_4124 ?auto_4127 ?auto_4126 )
      ( !DROP ?auto_4125 ?auto_4124 ?auto_4123 ?auto_4126 )
      ( MAKE-1CRATE-VERIFY ?auto_4123 ?auto_4124 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4140 - SURFACE
      ?auto_4141 - SURFACE
      ?auto_4142 - SURFACE
      ?auto_4143 - SURFACE
      ?auto_4144 - SURFACE
      ?auto_4145 - SURFACE
      ?auto_4146 - SURFACE
      ?auto_4148 - SURFACE
      ?auto_4147 - SURFACE
    )
    :vars
    (
      ?auto_4153 - HOIST
      ?auto_4149 - PLACE
      ?auto_4150 - PLACE
      ?auto_4151 - HOIST
      ?auto_4152 - SURFACE
      ?auto_4166 - PLACE
      ?auto_4155 - HOIST
      ?auto_4170 - SURFACE
      ?auto_4161 - SURFACE
      ?auto_4171 - PLACE
      ?auto_4167 - HOIST
      ?auto_4156 - SURFACE
      ?auto_4164 - PLACE
      ?auto_4159 - HOIST
      ?auto_4160 - SURFACE
      ?auto_4162 - PLACE
      ?auto_4163 - HOIST
      ?auto_4165 - SURFACE
      ?auto_4168 - PLACE
      ?auto_4158 - HOIST
      ?auto_4157 - SURFACE
      ?auto_4169 - SURFACE
      ?auto_4154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4153 ?auto_4149 ) ( IS-CRATE ?auto_4147 ) ( not ( = ?auto_4150 ?auto_4149 ) ) ( HOIST-AT ?auto_4151 ?auto_4150 ) ( SURFACE-AT ?auto_4147 ?auto_4150 ) ( ON ?auto_4147 ?auto_4152 ) ( CLEAR ?auto_4147 ) ( not ( = ?auto_4148 ?auto_4147 ) ) ( not ( = ?auto_4148 ?auto_4152 ) ) ( not ( = ?auto_4147 ?auto_4152 ) ) ( not ( = ?auto_4153 ?auto_4151 ) ) ( IS-CRATE ?auto_4148 ) ( not ( = ?auto_4166 ?auto_4149 ) ) ( HOIST-AT ?auto_4155 ?auto_4166 ) ( SURFACE-AT ?auto_4148 ?auto_4166 ) ( ON ?auto_4148 ?auto_4170 ) ( CLEAR ?auto_4148 ) ( not ( = ?auto_4146 ?auto_4148 ) ) ( not ( = ?auto_4146 ?auto_4170 ) ) ( not ( = ?auto_4148 ?auto_4170 ) ) ( not ( = ?auto_4153 ?auto_4155 ) ) ( IS-CRATE ?auto_4146 ) ( AVAILABLE ?auto_4151 ) ( SURFACE-AT ?auto_4146 ?auto_4150 ) ( ON ?auto_4146 ?auto_4161 ) ( CLEAR ?auto_4146 ) ( not ( = ?auto_4145 ?auto_4146 ) ) ( not ( = ?auto_4145 ?auto_4161 ) ) ( not ( = ?auto_4146 ?auto_4161 ) ) ( IS-CRATE ?auto_4145 ) ( not ( = ?auto_4171 ?auto_4149 ) ) ( HOIST-AT ?auto_4167 ?auto_4171 ) ( AVAILABLE ?auto_4167 ) ( SURFACE-AT ?auto_4145 ?auto_4171 ) ( ON ?auto_4145 ?auto_4156 ) ( CLEAR ?auto_4145 ) ( not ( = ?auto_4144 ?auto_4145 ) ) ( not ( = ?auto_4144 ?auto_4156 ) ) ( not ( = ?auto_4145 ?auto_4156 ) ) ( not ( = ?auto_4153 ?auto_4167 ) ) ( IS-CRATE ?auto_4144 ) ( not ( = ?auto_4164 ?auto_4149 ) ) ( HOIST-AT ?auto_4159 ?auto_4164 ) ( AVAILABLE ?auto_4159 ) ( SURFACE-AT ?auto_4144 ?auto_4164 ) ( ON ?auto_4144 ?auto_4160 ) ( CLEAR ?auto_4144 ) ( not ( = ?auto_4143 ?auto_4144 ) ) ( not ( = ?auto_4143 ?auto_4160 ) ) ( not ( = ?auto_4144 ?auto_4160 ) ) ( not ( = ?auto_4153 ?auto_4159 ) ) ( IS-CRATE ?auto_4143 ) ( not ( = ?auto_4162 ?auto_4149 ) ) ( HOIST-AT ?auto_4163 ?auto_4162 ) ( AVAILABLE ?auto_4163 ) ( SURFACE-AT ?auto_4143 ?auto_4162 ) ( ON ?auto_4143 ?auto_4165 ) ( CLEAR ?auto_4143 ) ( not ( = ?auto_4142 ?auto_4143 ) ) ( not ( = ?auto_4142 ?auto_4165 ) ) ( not ( = ?auto_4143 ?auto_4165 ) ) ( not ( = ?auto_4153 ?auto_4163 ) ) ( IS-CRATE ?auto_4142 ) ( not ( = ?auto_4168 ?auto_4149 ) ) ( HOIST-AT ?auto_4158 ?auto_4168 ) ( AVAILABLE ?auto_4158 ) ( SURFACE-AT ?auto_4142 ?auto_4168 ) ( ON ?auto_4142 ?auto_4157 ) ( CLEAR ?auto_4142 ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4157 ) ) ( not ( = ?auto_4142 ?auto_4157 ) ) ( not ( = ?auto_4153 ?auto_4158 ) ) ( SURFACE-AT ?auto_4140 ?auto_4149 ) ( CLEAR ?auto_4140 ) ( IS-CRATE ?auto_4141 ) ( AVAILABLE ?auto_4153 ) ( AVAILABLE ?auto_4155 ) ( SURFACE-AT ?auto_4141 ?auto_4166 ) ( ON ?auto_4141 ?auto_4169 ) ( CLEAR ?auto_4141 ) ( TRUCK-AT ?auto_4154 ?auto_4149 ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4140 ?auto_4169 ) ) ( not ( = ?auto_4141 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4142 ) ) ( not ( = ?auto_4140 ?auto_4157 ) ) ( not ( = ?auto_4142 ?auto_4169 ) ) ( not ( = ?auto_4168 ?auto_4166 ) ) ( not ( = ?auto_4158 ?auto_4155 ) ) ( not ( = ?auto_4157 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4143 ) ) ( not ( = ?auto_4140 ?auto_4165 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4165 ) ) ( not ( = ?auto_4143 ?auto_4157 ) ) ( not ( = ?auto_4143 ?auto_4169 ) ) ( not ( = ?auto_4162 ?auto_4168 ) ) ( not ( = ?auto_4162 ?auto_4166 ) ) ( not ( = ?auto_4163 ?auto_4158 ) ) ( not ( = ?auto_4163 ?auto_4155 ) ) ( not ( = ?auto_4165 ?auto_4157 ) ) ( not ( = ?auto_4165 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4144 ) ) ( not ( = ?auto_4140 ?auto_4160 ) ) ( not ( = ?auto_4141 ?auto_4144 ) ) ( not ( = ?auto_4141 ?auto_4160 ) ) ( not ( = ?auto_4142 ?auto_4144 ) ) ( not ( = ?auto_4142 ?auto_4160 ) ) ( not ( = ?auto_4144 ?auto_4165 ) ) ( not ( = ?auto_4144 ?auto_4157 ) ) ( not ( = ?auto_4144 ?auto_4169 ) ) ( not ( = ?auto_4164 ?auto_4162 ) ) ( not ( = ?auto_4164 ?auto_4168 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4159 ?auto_4163 ) ) ( not ( = ?auto_4159 ?auto_4158 ) ) ( not ( = ?auto_4159 ?auto_4155 ) ) ( not ( = ?auto_4160 ?auto_4165 ) ) ( not ( = ?auto_4160 ?auto_4157 ) ) ( not ( = ?auto_4160 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4145 ) ) ( not ( = ?auto_4140 ?auto_4156 ) ) ( not ( = ?auto_4141 ?auto_4145 ) ) ( not ( = ?auto_4141 ?auto_4156 ) ) ( not ( = ?auto_4142 ?auto_4145 ) ) ( not ( = ?auto_4142 ?auto_4156 ) ) ( not ( = ?auto_4143 ?auto_4145 ) ) ( not ( = ?auto_4143 ?auto_4156 ) ) ( not ( = ?auto_4145 ?auto_4160 ) ) ( not ( = ?auto_4145 ?auto_4165 ) ) ( not ( = ?auto_4145 ?auto_4157 ) ) ( not ( = ?auto_4145 ?auto_4169 ) ) ( not ( = ?auto_4171 ?auto_4164 ) ) ( not ( = ?auto_4171 ?auto_4162 ) ) ( not ( = ?auto_4171 ?auto_4168 ) ) ( not ( = ?auto_4171 ?auto_4166 ) ) ( not ( = ?auto_4167 ?auto_4159 ) ) ( not ( = ?auto_4167 ?auto_4163 ) ) ( not ( = ?auto_4167 ?auto_4158 ) ) ( not ( = ?auto_4167 ?auto_4155 ) ) ( not ( = ?auto_4156 ?auto_4160 ) ) ( not ( = ?auto_4156 ?auto_4165 ) ) ( not ( = ?auto_4156 ?auto_4157 ) ) ( not ( = ?auto_4156 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4146 ) ) ( not ( = ?auto_4140 ?auto_4161 ) ) ( not ( = ?auto_4141 ?auto_4146 ) ) ( not ( = ?auto_4141 ?auto_4161 ) ) ( not ( = ?auto_4142 ?auto_4146 ) ) ( not ( = ?auto_4142 ?auto_4161 ) ) ( not ( = ?auto_4143 ?auto_4146 ) ) ( not ( = ?auto_4143 ?auto_4161 ) ) ( not ( = ?auto_4144 ?auto_4146 ) ) ( not ( = ?auto_4144 ?auto_4161 ) ) ( not ( = ?auto_4146 ?auto_4156 ) ) ( not ( = ?auto_4146 ?auto_4160 ) ) ( not ( = ?auto_4146 ?auto_4165 ) ) ( not ( = ?auto_4146 ?auto_4157 ) ) ( not ( = ?auto_4146 ?auto_4169 ) ) ( not ( = ?auto_4150 ?auto_4171 ) ) ( not ( = ?auto_4150 ?auto_4164 ) ) ( not ( = ?auto_4150 ?auto_4162 ) ) ( not ( = ?auto_4150 ?auto_4168 ) ) ( not ( = ?auto_4150 ?auto_4166 ) ) ( not ( = ?auto_4151 ?auto_4167 ) ) ( not ( = ?auto_4151 ?auto_4159 ) ) ( not ( = ?auto_4151 ?auto_4163 ) ) ( not ( = ?auto_4151 ?auto_4158 ) ) ( not ( = ?auto_4151 ?auto_4155 ) ) ( not ( = ?auto_4161 ?auto_4156 ) ) ( not ( = ?auto_4161 ?auto_4160 ) ) ( not ( = ?auto_4161 ?auto_4165 ) ) ( not ( = ?auto_4161 ?auto_4157 ) ) ( not ( = ?auto_4161 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4148 ) ) ( not ( = ?auto_4140 ?auto_4170 ) ) ( not ( = ?auto_4141 ?auto_4148 ) ) ( not ( = ?auto_4141 ?auto_4170 ) ) ( not ( = ?auto_4142 ?auto_4148 ) ) ( not ( = ?auto_4142 ?auto_4170 ) ) ( not ( = ?auto_4143 ?auto_4148 ) ) ( not ( = ?auto_4143 ?auto_4170 ) ) ( not ( = ?auto_4144 ?auto_4148 ) ) ( not ( = ?auto_4144 ?auto_4170 ) ) ( not ( = ?auto_4145 ?auto_4148 ) ) ( not ( = ?auto_4145 ?auto_4170 ) ) ( not ( = ?auto_4148 ?auto_4161 ) ) ( not ( = ?auto_4148 ?auto_4156 ) ) ( not ( = ?auto_4148 ?auto_4160 ) ) ( not ( = ?auto_4148 ?auto_4165 ) ) ( not ( = ?auto_4148 ?auto_4157 ) ) ( not ( = ?auto_4148 ?auto_4169 ) ) ( not ( = ?auto_4170 ?auto_4161 ) ) ( not ( = ?auto_4170 ?auto_4156 ) ) ( not ( = ?auto_4170 ?auto_4160 ) ) ( not ( = ?auto_4170 ?auto_4165 ) ) ( not ( = ?auto_4170 ?auto_4157 ) ) ( not ( = ?auto_4170 ?auto_4169 ) ) ( not ( = ?auto_4140 ?auto_4147 ) ) ( not ( = ?auto_4140 ?auto_4152 ) ) ( not ( = ?auto_4141 ?auto_4147 ) ) ( not ( = ?auto_4141 ?auto_4152 ) ) ( not ( = ?auto_4142 ?auto_4147 ) ) ( not ( = ?auto_4142 ?auto_4152 ) ) ( not ( = ?auto_4143 ?auto_4147 ) ) ( not ( = ?auto_4143 ?auto_4152 ) ) ( not ( = ?auto_4144 ?auto_4147 ) ) ( not ( = ?auto_4144 ?auto_4152 ) ) ( not ( = ?auto_4145 ?auto_4147 ) ) ( not ( = ?auto_4145 ?auto_4152 ) ) ( not ( = ?auto_4146 ?auto_4147 ) ) ( not ( = ?auto_4146 ?auto_4152 ) ) ( not ( = ?auto_4147 ?auto_4170 ) ) ( not ( = ?auto_4147 ?auto_4161 ) ) ( not ( = ?auto_4147 ?auto_4156 ) ) ( not ( = ?auto_4147 ?auto_4160 ) ) ( not ( = ?auto_4147 ?auto_4165 ) ) ( not ( = ?auto_4147 ?auto_4157 ) ) ( not ( = ?auto_4147 ?auto_4169 ) ) ( not ( = ?auto_4152 ?auto_4170 ) ) ( not ( = ?auto_4152 ?auto_4161 ) ) ( not ( = ?auto_4152 ?auto_4156 ) ) ( not ( = ?auto_4152 ?auto_4160 ) ) ( not ( = ?auto_4152 ?auto_4165 ) ) ( not ( = ?auto_4152 ?auto_4157 ) ) ( not ( = ?auto_4152 ?auto_4169 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4140 ?auto_4141 ?auto_4142 ?auto_4143 ?auto_4144 ?auto_4145 ?auto_4146 ?auto_4148 )
      ( MAKE-1CRATE ?auto_4148 ?auto_4147 )
      ( MAKE-8CRATE-VERIFY ?auto_4140 ?auto_4141 ?auto_4142 ?auto_4143 ?auto_4144 ?auto_4145 ?auto_4146 ?auto_4148 ?auto_4147 ) )
  )

)

