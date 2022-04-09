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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9910 - SURFACE
      ?auto_9911 - SURFACE
    )
    :vars
    (
      ?auto_9912 - HOIST
      ?auto_9913 - PLACE
      ?auto_9915 - PLACE
      ?auto_9916 - HOIST
      ?auto_9917 - SURFACE
      ?auto_9914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9912 ?auto_9913 ) ( SURFACE-AT ?auto_9910 ?auto_9913 ) ( CLEAR ?auto_9910 ) ( IS-CRATE ?auto_9911 ) ( AVAILABLE ?auto_9912 ) ( not ( = ?auto_9915 ?auto_9913 ) ) ( HOIST-AT ?auto_9916 ?auto_9915 ) ( AVAILABLE ?auto_9916 ) ( SURFACE-AT ?auto_9911 ?auto_9915 ) ( ON ?auto_9911 ?auto_9917 ) ( CLEAR ?auto_9911 ) ( TRUCK-AT ?auto_9914 ?auto_9913 ) ( not ( = ?auto_9910 ?auto_9911 ) ) ( not ( = ?auto_9910 ?auto_9917 ) ) ( not ( = ?auto_9911 ?auto_9917 ) ) ( not ( = ?auto_9912 ?auto_9916 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9914 ?auto_9913 ?auto_9915 )
      ( !LIFT ?auto_9916 ?auto_9911 ?auto_9917 ?auto_9915 )
      ( !LOAD ?auto_9916 ?auto_9911 ?auto_9914 ?auto_9915 )
      ( !DRIVE ?auto_9914 ?auto_9915 ?auto_9913 )
      ( !UNLOAD ?auto_9912 ?auto_9911 ?auto_9914 ?auto_9913 )
      ( !DROP ?auto_9912 ?auto_9911 ?auto_9910 ?auto_9913 )
      ( MAKE-1CRATE-VERIFY ?auto_9910 ?auto_9911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9931 - SURFACE
      ?auto_9932 - SURFACE
      ?auto_9933 - SURFACE
    )
    :vars
    (
      ?auto_9938 - HOIST
      ?auto_9939 - PLACE
      ?auto_9935 - PLACE
      ?auto_9937 - HOIST
      ?auto_9934 - SURFACE
      ?auto_9942 - PLACE
      ?auto_9941 - HOIST
      ?auto_9940 - SURFACE
      ?auto_9936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9938 ?auto_9939 ) ( IS-CRATE ?auto_9933 ) ( not ( = ?auto_9935 ?auto_9939 ) ) ( HOIST-AT ?auto_9937 ?auto_9935 ) ( AVAILABLE ?auto_9937 ) ( SURFACE-AT ?auto_9933 ?auto_9935 ) ( ON ?auto_9933 ?auto_9934 ) ( CLEAR ?auto_9933 ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( not ( = ?auto_9932 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9934 ) ) ( not ( = ?auto_9938 ?auto_9937 ) ) ( SURFACE-AT ?auto_9931 ?auto_9939 ) ( CLEAR ?auto_9931 ) ( IS-CRATE ?auto_9932 ) ( AVAILABLE ?auto_9938 ) ( not ( = ?auto_9942 ?auto_9939 ) ) ( HOIST-AT ?auto_9941 ?auto_9942 ) ( AVAILABLE ?auto_9941 ) ( SURFACE-AT ?auto_9932 ?auto_9942 ) ( ON ?auto_9932 ?auto_9940 ) ( CLEAR ?auto_9932 ) ( TRUCK-AT ?auto_9936 ?auto_9939 ) ( not ( = ?auto_9931 ?auto_9932 ) ) ( not ( = ?auto_9931 ?auto_9940 ) ) ( not ( = ?auto_9932 ?auto_9940 ) ) ( not ( = ?auto_9938 ?auto_9941 ) ) ( not ( = ?auto_9931 ?auto_9933 ) ) ( not ( = ?auto_9931 ?auto_9934 ) ) ( not ( = ?auto_9933 ?auto_9940 ) ) ( not ( = ?auto_9935 ?auto_9942 ) ) ( not ( = ?auto_9937 ?auto_9941 ) ) ( not ( = ?auto_9934 ?auto_9940 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9931 ?auto_9932 )
      ( MAKE-1CRATE ?auto_9932 ?auto_9933 )
      ( MAKE-2CRATE-VERIFY ?auto_9931 ?auto_9932 ?auto_9933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9957 - SURFACE
      ?auto_9958 - SURFACE
      ?auto_9959 - SURFACE
      ?auto_9960 - SURFACE
    )
    :vars
    (
      ?auto_9961 - HOIST
      ?auto_9964 - PLACE
      ?auto_9965 - PLACE
      ?auto_9966 - HOIST
      ?auto_9963 - SURFACE
      ?auto_9968 - PLACE
      ?auto_9967 - HOIST
      ?auto_9969 - SURFACE
      ?auto_9971 - PLACE
      ?auto_9970 - HOIST
      ?auto_9972 - SURFACE
      ?auto_9962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9961 ?auto_9964 ) ( IS-CRATE ?auto_9960 ) ( not ( = ?auto_9965 ?auto_9964 ) ) ( HOIST-AT ?auto_9966 ?auto_9965 ) ( AVAILABLE ?auto_9966 ) ( SURFACE-AT ?auto_9960 ?auto_9965 ) ( ON ?auto_9960 ?auto_9963 ) ( CLEAR ?auto_9960 ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9963 ) ) ( not ( = ?auto_9960 ?auto_9963 ) ) ( not ( = ?auto_9961 ?auto_9966 ) ) ( IS-CRATE ?auto_9959 ) ( not ( = ?auto_9968 ?auto_9964 ) ) ( HOIST-AT ?auto_9967 ?auto_9968 ) ( AVAILABLE ?auto_9967 ) ( SURFACE-AT ?auto_9959 ?auto_9968 ) ( ON ?auto_9959 ?auto_9969 ) ( CLEAR ?auto_9959 ) ( not ( = ?auto_9958 ?auto_9959 ) ) ( not ( = ?auto_9958 ?auto_9969 ) ) ( not ( = ?auto_9959 ?auto_9969 ) ) ( not ( = ?auto_9961 ?auto_9967 ) ) ( SURFACE-AT ?auto_9957 ?auto_9964 ) ( CLEAR ?auto_9957 ) ( IS-CRATE ?auto_9958 ) ( AVAILABLE ?auto_9961 ) ( not ( = ?auto_9971 ?auto_9964 ) ) ( HOIST-AT ?auto_9970 ?auto_9971 ) ( AVAILABLE ?auto_9970 ) ( SURFACE-AT ?auto_9958 ?auto_9971 ) ( ON ?auto_9958 ?auto_9972 ) ( CLEAR ?auto_9958 ) ( TRUCK-AT ?auto_9962 ?auto_9964 ) ( not ( = ?auto_9957 ?auto_9958 ) ) ( not ( = ?auto_9957 ?auto_9972 ) ) ( not ( = ?auto_9958 ?auto_9972 ) ) ( not ( = ?auto_9961 ?auto_9970 ) ) ( not ( = ?auto_9957 ?auto_9959 ) ) ( not ( = ?auto_9957 ?auto_9969 ) ) ( not ( = ?auto_9959 ?auto_9972 ) ) ( not ( = ?auto_9968 ?auto_9971 ) ) ( not ( = ?auto_9967 ?auto_9970 ) ) ( not ( = ?auto_9969 ?auto_9972 ) ) ( not ( = ?auto_9957 ?auto_9960 ) ) ( not ( = ?auto_9957 ?auto_9963 ) ) ( not ( = ?auto_9958 ?auto_9960 ) ) ( not ( = ?auto_9958 ?auto_9963 ) ) ( not ( = ?auto_9960 ?auto_9969 ) ) ( not ( = ?auto_9960 ?auto_9972 ) ) ( not ( = ?auto_9965 ?auto_9968 ) ) ( not ( = ?auto_9965 ?auto_9971 ) ) ( not ( = ?auto_9966 ?auto_9967 ) ) ( not ( = ?auto_9966 ?auto_9970 ) ) ( not ( = ?auto_9963 ?auto_9969 ) ) ( not ( = ?auto_9963 ?auto_9972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9957 ?auto_9958 ?auto_9959 )
      ( MAKE-1CRATE ?auto_9959 ?auto_9960 )
      ( MAKE-3CRATE-VERIFY ?auto_9957 ?auto_9958 ?auto_9959 ?auto_9960 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9988 - SURFACE
      ?auto_9989 - SURFACE
      ?auto_9990 - SURFACE
      ?auto_9991 - SURFACE
      ?auto_9992 - SURFACE
    )
    :vars
    (
      ?auto_9993 - HOIST
      ?auto_9998 - PLACE
      ?auto_9997 - PLACE
      ?auto_9996 - HOIST
      ?auto_9994 - SURFACE
      ?auto_10002 - PLACE
      ?auto_10001 - HOIST
      ?auto_10005 - SURFACE
      ?auto_10000 - PLACE
      ?auto_9999 - HOIST
      ?auto_10007 - SURFACE
      ?auto_10004 - PLACE
      ?auto_10003 - HOIST
      ?auto_10006 - SURFACE
      ?auto_9995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9993 ?auto_9998 ) ( IS-CRATE ?auto_9992 ) ( not ( = ?auto_9997 ?auto_9998 ) ) ( HOIST-AT ?auto_9996 ?auto_9997 ) ( AVAILABLE ?auto_9996 ) ( SURFACE-AT ?auto_9992 ?auto_9997 ) ( ON ?auto_9992 ?auto_9994 ) ( CLEAR ?auto_9992 ) ( not ( = ?auto_9991 ?auto_9992 ) ) ( not ( = ?auto_9991 ?auto_9994 ) ) ( not ( = ?auto_9992 ?auto_9994 ) ) ( not ( = ?auto_9993 ?auto_9996 ) ) ( IS-CRATE ?auto_9991 ) ( not ( = ?auto_10002 ?auto_9998 ) ) ( HOIST-AT ?auto_10001 ?auto_10002 ) ( AVAILABLE ?auto_10001 ) ( SURFACE-AT ?auto_9991 ?auto_10002 ) ( ON ?auto_9991 ?auto_10005 ) ( CLEAR ?auto_9991 ) ( not ( = ?auto_9990 ?auto_9991 ) ) ( not ( = ?auto_9990 ?auto_10005 ) ) ( not ( = ?auto_9991 ?auto_10005 ) ) ( not ( = ?auto_9993 ?auto_10001 ) ) ( IS-CRATE ?auto_9990 ) ( not ( = ?auto_10000 ?auto_9998 ) ) ( HOIST-AT ?auto_9999 ?auto_10000 ) ( AVAILABLE ?auto_9999 ) ( SURFACE-AT ?auto_9990 ?auto_10000 ) ( ON ?auto_9990 ?auto_10007 ) ( CLEAR ?auto_9990 ) ( not ( = ?auto_9989 ?auto_9990 ) ) ( not ( = ?auto_9989 ?auto_10007 ) ) ( not ( = ?auto_9990 ?auto_10007 ) ) ( not ( = ?auto_9993 ?auto_9999 ) ) ( SURFACE-AT ?auto_9988 ?auto_9998 ) ( CLEAR ?auto_9988 ) ( IS-CRATE ?auto_9989 ) ( AVAILABLE ?auto_9993 ) ( not ( = ?auto_10004 ?auto_9998 ) ) ( HOIST-AT ?auto_10003 ?auto_10004 ) ( AVAILABLE ?auto_10003 ) ( SURFACE-AT ?auto_9989 ?auto_10004 ) ( ON ?auto_9989 ?auto_10006 ) ( CLEAR ?auto_9989 ) ( TRUCK-AT ?auto_9995 ?auto_9998 ) ( not ( = ?auto_9988 ?auto_9989 ) ) ( not ( = ?auto_9988 ?auto_10006 ) ) ( not ( = ?auto_9989 ?auto_10006 ) ) ( not ( = ?auto_9993 ?auto_10003 ) ) ( not ( = ?auto_9988 ?auto_9990 ) ) ( not ( = ?auto_9988 ?auto_10007 ) ) ( not ( = ?auto_9990 ?auto_10006 ) ) ( not ( = ?auto_10000 ?auto_10004 ) ) ( not ( = ?auto_9999 ?auto_10003 ) ) ( not ( = ?auto_10007 ?auto_10006 ) ) ( not ( = ?auto_9988 ?auto_9991 ) ) ( not ( = ?auto_9988 ?auto_10005 ) ) ( not ( = ?auto_9989 ?auto_9991 ) ) ( not ( = ?auto_9989 ?auto_10005 ) ) ( not ( = ?auto_9991 ?auto_10007 ) ) ( not ( = ?auto_9991 ?auto_10006 ) ) ( not ( = ?auto_10002 ?auto_10000 ) ) ( not ( = ?auto_10002 ?auto_10004 ) ) ( not ( = ?auto_10001 ?auto_9999 ) ) ( not ( = ?auto_10001 ?auto_10003 ) ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10005 ?auto_10006 ) ) ( not ( = ?auto_9988 ?auto_9992 ) ) ( not ( = ?auto_9988 ?auto_9994 ) ) ( not ( = ?auto_9989 ?auto_9992 ) ) ( not ( = ?auto_9989 ?auto_9994 ) ) ( not ( = ?auto_9990 ?auto_9992 ) ) ( not ( = ?auto_9990 ?auto_9994 ) ) ( not ( = ?auto_9992 ?auto_10005 ) ) ( not ( = ?auto_9992 ?auto_10007 ) ) ( not ( = ?auto_9992 ?auto_10006 ) ) ( not ( = ?auto_9997 ?auto_10002 ) ) ( not ( = ?auto_9997 ?auto_10000 ) ) ( not ( = ?auto_9997 ?auto_10004 ) ) ( not ( = ?auto_9996 ?auto_10001 ) ) ( not ( = ?auto_9996 ?auto_9999 ) ) ( not ( = ?auto_9996 ?auto_10003 ) ) ( not ( = ?auto_9994 ?auto_10005 ) ) ( not ( = ?auto_9994 ?auto_10007 ) ) ( not ( = ?auto_9994 ?auto_10006 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9988 ?auto_9989 ?auto_9990 ?auto_9991 )
      ( MAKE-1CRATE ?auto_9991 ?auto_9992 )
      ( MAKE-4CRATE-VERIFY ?auto_9988 ?auto_9989 ?auto_9990 ?auto_9991 ?auto_9992 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10024 - SURFACE
      ?auto_10025 - SURFACE
      ?auto_10026 - SURFACE
      ?auto_10027 - SURFACE
      ?auto_10028 - SURFACE
      ?auto_10029 - SURFACE
    )
    :vars
    (
      ?auto_10031 - HOIST
      ?auto_10032 - PLACE
      ?auto_10030 - PLACE
      ?auto_10035 - HOIST
      ?auto_10033 - SURFACE
      ?auto_10043 - PLACE
      ?auto_10042 - HOIST
      ?auto_10038 - SURFACE
      ?auto_10041 - PLACE
      ?auto_10040 - HOIST
      ?auto_10036 - SURFACE
      ?auto_10046 - PLACE
      ?auto_10039 - HOIST
      ?auto_10045 - SURFACE
      ?auto_10047 - PLACE
      ?auto_10044 - HOIST
      ?auto_10037 - SURFACE
      ?auto_10034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10031 ?auto_10032 ) ( IS-CRATE ?auto_10029 ) ( not ( = ?auto_10030 ?auto_10032 ) ) ( HOIST-AT ?auto_10035 ?auto_10030 ) ( AVAILABLE ?auto_10035 ) ( SURFACE-AT ?auto_10029 ?auto_10030 ) ( ON ?auto_10029 ?auto_10033 ) ( CLEAR ?auto_10029 ) ( not ( = ?auto_10028 ?auto_10029 ) ) ( not ( = ?auto_10028 ?auto_10033 ) ) ( not ( = ?auto_10029 ?auto_10033 ) ) ( not ( = ?auto_10031 ?auto_10035 ) ) ( IS-CRATE ?auto_10028 ) ( not ( = ?auto_10043 ?auto_10032 ) ) ( HOIST-AT ?auto_10042 ?auto_10043 ) ( AVAILABLE ?auto_10042 ) ( SURFACE-AT ?auto_10028 ?auto_10043 ) ( ON ?auto_10028 ?auto_10038 ) ( CLEAR ?auto_10028 ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10038 ) ) ( not ( = ?auto_10028 ?auto_10038 ) ) ( not ( = ?auto_10031 ?auto_10042 ) ) ( IS-CRATE ?auto_10027 ) ( not ( = ?auto_10041 ?auto_10032 ) ) ( HOIST-AT ?auto_10040 ?auto_10041 ) ( AVAILABLE ?auto_10040 ) ( SURFACE-AT ?auto_10027 ?auto_10041 ) ( ON ?auto_10027 ?auto_10036 ) ( CLEAR ?auto_10027 ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( not ( = ?auto_10026 ?auto_10036 ) ) ( not ( = ?auto_10027 ?auto_10036 ) ) ( not ( = ?auto_10031 ?auto_10040 ) ) ( IS-CRATE ?auto_10026 ) ( not ( = ?auto_10046 ?auto_10032 ) ) ( HOIST-AT ?auto_10039 ?auto_10046 ) ( AVAILABLE ?auto_10039 ) ( SURFACE-AT ?auto_10026 ?auto_10046 ) ( ON ?auto_10026 ?auto_10045 ) ( CLEAR ?auto_10026 ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10045 ) ) ( not ( = ?auto_10026 ?auto_10045 ) ) ( not ( = ?auto_10031 ?auto_10039 ) ) ( SURFACE-AT ?auto_10024 ?auto_10032 ) ( CLEAR ?auto_10024 ) ( IS-CRATE ?auto_10025 ) ( AVAILABLE ?auto_10031 ) ( not ( = ?auto_10047 ?auto_10032 ) ) ( HOIST-AT ?auto_10044 ?auto_10047 ) ( AVAILABLE ?auto_10044 ) ( SURFACE-AT ?auto_10025 ?auto_10047 ) ( ON ?auto_10025 ?auto_10037 ) ( CLEAR ?auto_10025 ) ( TRUCK-AT ?auto_10034 ?auto_10032 ) ( not ( = ?auto_10024 ?auto_10025 ) ) ( not ( = ?auto_10024 ?auto_10037 ) ) ( not ( = ?auto_10025 ?auto_10037 ) ) ( not ( = ?auto_10031 ?auto_10044 ) ) ( not ( = ?auto_10024 ?auto_10026 ) ) ( not ( = ?auto_10024 ?auto_10045 ) ) ( not ( = ?auto_10026 ?auto_10037 ) ) ( not ( = ?auto_10046 ?auto_10047 ) ) ( not ( = ?auto_10039 ?auto_10044 ) ) ( not ( = ?auto_10045 ?auto_10037 ) ) ( not ( = ?auto_10024 ?auto_10027 ) ) ( not ( = ?auto_10024 ?auto_10036 ) ) ( not ( = ?auto_10025 ?auto_10027 ) ) ( not ( = ?auto_10025 ?auto_10036 ) ) ( not ( = ?auto_10027 ?auto_10045 ) ) ( not ( = ?auto_10027 ?auto_10037 ) ) ( not ( = ?auto_10041 ?auto_10046 ) ) ( not ( = ?auto_10041 ?auto_10047 ) ) ( not ( = ?auto_10040 ?auto_10039 ) ) ( not ( = ?auto_10040 ?auto_10044 ) ) ( not ( = ?auto_10036 ?auto_10045 ) ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( not ( = ?auto_10024 ?auto_10028 ) ) ( not ( = ?auto_10024 ?auto_10038 ) ) ( not ( = ?auto_10025 ?auto_10028 ) ) ( not ( = ?auto_10025 ?auto_10038 ) ) ( not ( = ?auto_10026 ?auto_10028 ) ) ( not ( = ?auto_10026 ?auto_10038 ) ) ( not ( = ?auto_10028 ?auto_10036 ) ) ( not ( = ?auto_10028 ?auto_10045 ) ) ( not ( = ?auto_10028 ?auto_10037 ) ) ( not ( = ?auto_10043 ?auto_10041 ) ) ( not ( = ?auto_10043 ?auto_10046 ) ) ( not ( = ?auto_10043 ?auto_10047 ) ) ( not ( = ?auto_10042 ?auto_10040 ) ) ( not ( = ?auto_10042 ?auto_10039 ) ) ( not ( = ?auto_10042 ?auto_10044 ) ) ( not ( = ?auto_10038 ?auto_10036 ) ) ( not ( = ?auto_10038 ?auto_10045 ) ) ( not ( = ?auto_10038 ?auto_10037 ) ) ( not ( = ?auto_10024 ?auto_10029 ) ) ( not ( = ?auto_10024 ?auto_10033 ) ) ( not ( = ?auto_10025 ?auto_10029 ) ) ( not ( = ?auto_10025 ?auto_10033 ) ) ( not ( = ?auto_10026 ?auto_10029 ) ) ( not ( = ?auto_10026 ?auto_10033 ) ) ( not ( = ?auto_10027 ?auto_10029 ) ) ( not ( = ?auto_10027 ?auto_10033 ) ) ( not ( = ?auto_10029 ?auto_10038 ) ) ( not ( = ?auto_10029 ?auto_10036 ) ) ( not ( = ?auto_10029 ?auto_10045 ) ) ( not ( = ?auto_10029 ?auto_10037 ) ) ( not ( = ?auto_10030 ?auto_10043 ) ) ( not ( = ?auto_10030 ?auto_10041 ) ) ( not ( = ?auto_10030 ?auto_10046 ) ) ( not ( = ?auto_10030 ?auto_10047 ) ) ( not ( = ?auto_10035 ?auto_10042 ) ) ( not ( = ?auto_10035 ?auto_10040 ) ) ( not ( = ?auto_10035 ?auto_10039 ) ) ( not ( = ?auto_10035 ?auto_10044 ) ) ( not ( = ?auto_10033 ?auto_10038 ) ) ( not ( = ?auto_10033 ?auto_10036 ) ) ( not ( = ?auto_10033 ?auto_10045 ) ) ( not ( = ?auto_10033 ?auto_10037 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10024 ?auto_10025 ?auto_10026 ?auto_10027 ?auto_10028 )
      ( MAKE-1CRATE ?auto_10028 ?auto_10029 )
      ( MAKE-5CRATE-VERIFY ?auto_10024 ?auto_10025 ?auto_10026 ?auto_10027 ?auto_10028 ?auto_10029 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10065 - SURFACE
      ?auto_10066 - SURFACE
      ?auto_10067 - SURFACE
      ?auto_10068 - SURFACE
      ?auto_10069 - SURFACE
      ?auto_10070 - SURFACE
      ?auto_10071 - SURFACE
    )
    :vars
    (
      ?auto_10075 - HOIST
      ?auto_10072 - PLACE
      ?auto_10077 - PLACE
      ?auto_10073 - HOIST
      ?auto_10074 - SURFACE
      ?auto_10078 - PLACE
      ?auto_10079 - HOIST
      ?auto_10088 - SURFACE
      ?auto_10087 - PLACE
      ?auto_10083 - HOIST
      ?auto_10090 - SURFACE
      ?auto_10084 - PLACE
      ?auto_10082 - HOIST
      ?auto_10091 - SURFACE
      ?auto_10080 - PLACE
      ?auto_10092 - HOIST
      ?auto_10085 - SURFACE
      ?auto_10081 - PLACE
      ?auto_10089 - HOIST
      ?auto_10086 - SURFACE
      ?auto_10076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10075 ?auto_10072 ) ( IS-CRATE ?auto_10071 ) ( not ( = ?auto_10077 ?auto_10072 ) ) ( HOIST-AT ?auto_10073 ?auto_10077 ) ( AVAILABLE ?auto_10073 ) ( SURFACE-AT ?auto_10071 ?auto_10077 ) ( ON ?auto_10071 ?auto_10074 ) ( CLEAR ?auto_10071 ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10074 ) ) ( not ( = ?auto_10071 ?auto_10074 ) ) ( not ( = ?auto_10075 ?auto_10073 ) ) ( IS-CRATE ?auto_10070 ) ( not ( = ?auto_10078 ?auto_10072 ) ) ( HOIST-AT ?auto_10079 ?auto_10078 ) ( AVAILABLE ?auto_10079 ) ( SURFACE-AT ?auto_10070 ?auto_10078 ) ( ON ?auto_10070 ?auto_10088 ) ( CLEAR ?auto_10070 ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( not ( = ?auto_10069 ?auto_10088 ) ) ( not ( = ?auto_10070 ?auto_10088 ) ) ( not ( = ?auto_10075 ?auto_10079 ) ) ( IS-CRATE ?auto_10069 ) ( not ( = ?auto_10087 ?auto_10072 ) ) ( HOIST-AT ?auto_10083 ?auto_10087 ) ( AVAILABLE ?auto_10083 ) ( SURFACE-AT ?auto_10069 ?auto_10087 ) ( ON ?auto_10069 ?auto_10090 ) ( CLEAR ?auto_10069 ) ( not ( = ?auto_10068 ?auto_10069 ) ) ( not ( = ?auto_10068 ?auto_10090 ) ) ( not ( = ?auto_10069 ?auto_10090 ) ) ( not ( = ?auto_10075 ?auto_10083 ) ) ( IS-CRATE ?auto_10068 ) ( not ( = ?auto_10084 ?auto_10072 ) ) ( HOIST-AT ?auto_10082 ?auto_10084 ) ( AVAILABLE ?auto_10082 ) ( SURFACE-AT ?auto_10068 ?auto_10084 ) ( ON ?auto_10068 ?auto_10091 ) ( CLEAR ?auto_10068 ) ( not ( = ?auto_10067 ?auto_10068 ) ) ( not ( = ?auto_10067 ?auto_10091 ) ) ( not ( = ?auto_10068 ?auto_10091 ) ) ( not ( = ?auto_10075 ?auto_10082 ) ) ( IS-CRATE ?auto_10067 ) ( not ( = ?auto_10080 ?auto_10072 ) ) ( HOIST-AT ?auto_10092 ?auto_10080 ) ( AVAILABLE ?auto_10092 ) ( SURFACE-AT ?auto_10067 ?auto_10080 ) ( ON ?auto_10067 ?auto_10085 ) ( CLEAR ?auto_10067 ) ( not ( = ?auto_10066 ?auto_10067 ) ) ( not ( = ?auto_10066 ?auto_10085 ) ) ( not ( = ?auto_10067 ?auto_10085 ) ) ( not ( = ?auto_10075 ?auto_10092 ) ) ( SURFACE-AT ?auto_10065 ?auto_10072 ) ( CLEAR ?auto_10065 ) ( IS-CRATE ?auto_10066 ) ( AVAILABLE ?auto_10075 ) ( not ( = ?auto_10081 ?auto_10072 ) ) ( HOIST-AT ?auto_10089 ?auto_10081 ) ( AVAILABLE ?auto_10089 ) ( SURFACE-AT ?auto_10066 ?auto_10081 ) ( ON ?auto_10066 ?auto_10086 ) ( CLEAR ?auto_10066 ) ( TRUCK-AT ?auto_10076 ?auto_10072 ) ( not ( = ?auto_10065 ?auto_10066 ) ) ( not ( = ?auto_10065 ?auto_10086 ) ) ( not ( = ?auto_10066 ?auto_10086 ) ) ( not ( = ?auto_10075 ?auto_10089 ) ) ( not ( = ?auto_10065 ?auto_10067 ) ) ( not ( = ?auto_10065 ?auto_10085 ) ) ( not ( = ?auto_10067 ?auto_10086 ) ) ( not ( = ?auto_10080 ?auto_10081 ) ) ( not ( = ?auto_10092 ?auto_10089 ) ) ( not ( = ?auto_10085 ?auto_10086 ) ) ( not ( = ?auto_10065 ?auto_10068 ) ) ( not ( = ?auto_10065 ?auto_10091 ) ) ( not ( = ?auto_10066 ?auto_10068 ) ) ( not ( = ?auto_10066 ?auto_10091 ) ) ( not ( = ?auto_10068 ?auto_10085 ) ) ( not ( = ?auto_10068 ?auto_10086 ) ) ( not ( = ?auto_10084 ?auto_10080 ) ) ( not ( = ?auto_10084 ?auto_10081 ) ) ( not ( = ?auto_10082 ?auto_10092 ) ) ( not ( = ?auto_10082 ?auto_10089 ) ) ( not ( = ?auto_10091 ?auto_10085 ) ) ( not ( = ?auto_10091 ?auto_10086 ) ) ( not ( = ?auto_10065 ?auto_10069 ) ) ( not ( = ?auto_10065 ?auto_10090 ) ) ( not ( = ?auto_10066 ?auto_10069 ) ) ( not ( = ?auto_10066 ?auto_10090 ) ) ( not ( = ?auto_10067 ?auto_10069 ) ) ( not ( = ?auto_10067 ?auto_10090 ) ) ( not ( = ?auto_10069 ?auto_10091 ) ) ( not ( = ?auto_10069 ?auto_10085 ) ) ( not ( = ?auto_10069 ?auto_10086 ) ) ( not ( = ?auto_10087 ?auto_10084 ) ) ( not ( = ?auto_10087 ?auto_10080 ) ) ( not ( = ?auto_10087 ?auto_10081 ) ) ( not ( = ?auto_10083 ?auto_10082 ) ) ( not ( = ?auto_10083 ?auto_10092 ) ) ( not ( = ?auto_10083 ?auto_10089 ) ) ( not ( = ?auto_10090 ?auto_10091 ) ) ( not ( = ?auto_10090 ?auto_10085 ) ) ( not ( = ?auto_10090 ?auto_10086 ) ) ( not ( = ?auto_10065 ?auto_10070 ) ) ( not ( = ?auto_10065 ?auto_10088 ) ) ( not ( = ?auto_10066 ?auto_10070 ) ) ( not ( = ?auto_10066 ?auto_10088 ) ) ( not ( = ?auto_10067 ?auto_10070 ) ) ( not ( = ?auto_10067 ?auto_10088 ) ) ( not ( = ?auto_10068 ?auto_10070 ) ) ( not ( = ?auto_10068 ?auto_10088 ) ) ( not ( = ?auto_10070 ?auto_10090 ) ) ( not ( = ?auto_10070 ?auto_10091 ) ) ( not ( = ?auto_10070 ?auto_10085 ) ) ( not ( = ?auto_10070 ?auto_10086 ) ) ( not ( = ?auto_10078 ?auto_10087 ) ) ( not ( = ?auto_10078 ?auto_10084 ) ) ( not ( = ?auto_10078 ?auto_10080 ) ) ( not ( = ?auto_10078 ?auto_10081 ) ) ( not ( = ?auto_10079 ?auto_10083 ) ) ( not ( = ?auto_10079 ?auto_10082 ) ) ( not ( = ?auto_10079 ?auto_10092 ) ) ( not ( = ?auto_10079 ?auto_10089 ) ) ( not ( = ?auto_10088 ?auto_10090 ) ) ( not ( = ?auto_10088 ?auto_10091 ) ) ( not ( = ?auto_10088 ?auto_10085 ) ) ( not ( = ?auto_10088 ?auto_10086 ) ) ( not ( = ?auto_10065 ?auto_10071 ) ) ( not ( = ?auto_10065 ?auto_10074 ) ) ( not ( = ?auto_10066 ?auto_10071 ) ) ( not ( = ?auto_10066 ?auto_10074 ) ) ( not ( = ?auto_10067 ?auto_10071 ) ) ( not ( = ?auto_10067 ?auto_10074 ) ) ( not ( = ?auto_10068 ?auto_10071 ) ) ( not ( = ?auto_10068 ?auto_10074 ) ) ( not ( = ?auto_10069 ?auto_10071 ) ) ( not ( = ?auto_10069 ?auto_10074 ) ) ( not ( = ?auto_10071 ?auto_10088 ) ) ( not ( = ?auto_10071 ?auto_10090 ) ) ( not ( = ?auto_10071 ?auto_10091 ) ) ( not ( = ?auto_10071 ?auto_10085 ) ) ( not ( = ?auto_10071 ?auto_10086 ) ) ( not ( = ?auto_10077 ?auto_10078 ) ) ( not ( = ?auto_10077 ?auto_10087 ) ) ( not ( = ?auto_10077 ?auto_10084 ) ) ( not ( = ?auto_10077 ?auto_10080 ) ) ( not ( = ?auto_10077 ?auto_10081 ) ) ( not ( = ?auto_10073 ?auto_10079 ) ) ( not ( = ?auto_10073 ?auto_10083 ) ) ( not ( = ?auto_10073 ?auto_10082 ) ) ( not ( = ?auto_10073 ?auto_10092 ) ) ( not ( = ?auto_10073 ?auto_10089 ) ) ( not ( = ?auto_10074 ?auto_10088 ) ) ( not ( = ?auto_10074 ?auto_10090 ) ) ( not ( = ?auto_10074 ?auto_10091 ) ) ( not ( = ?auto_10074 ?auto_10085 ) ) ( not ( = ?auto_10074 ?auto_10086 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10065 ?auto_10066 ?auto_10067 ?auto_10068 ?auto_10069 ?auto_10070 )
      ( MAKE-1CRATE ?auto_10070 ?auto_10071 )
      ( MAKE-6CRATE-VERIFY ?auto_10065 ?auto_10066 ?auto_10067 ?auto_10068 ?auto_10069 ?auto_10070 ?auto_10071 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10111 - SURFACE
      ?auto_10112 - SURFACE
      ?auto_10113 - SURFACE
      ?auto_10114 - SURFACE
      ?auto_10115 - SURFACE
      ?auto_10116 - SURFACE
      ?auto_10117 - SURFACE
      ?auto_10118 - SURFACE
    )
    :vars
    (
      ?auto_10123 - HOIST
      ?auto_10122 - PLACE
      ?auto_10119 - PLACE
      ?auto_10124 - HOIST
      ?auto_10120 - SURFACE
      ?auto_10132 - PLACE
      ?auto_10133 - HOIST
      ?auto_10134 - SURFACE
      ?auto_10131 - PLACE
      ?auto_10140 - HOIST
      ?auto_10130 - SURFACE
      ?auto_10141 - PLACE
      ?auto_10138 - HOIST
      ?auto_10135 - SURFACE
      ?auto_10127 - PLACE
      ?auto_10139 - HOIST
      ?auto_10136 - SURFACE
      ?auto_10142 - PLACE
      ?auto_10125 - HOIST
      ?auto_10137 - SURFACE
      ?auto_10126 - PLACE
      ?auto_10128 - HOIST
      ?auto_10129 - SURFACE
      ?auto_10121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10123 ?auto_10122 ) ( IS-CRATE ?auto_10118 ) ( not ( = ?auto_10119 ?auto_10122 ) ) ( HOIST-AT ?auto_10124 ?auto_10119 ) ( AVAILABLE ?auto_10124 ) ( SURFACE-AT ?auto_10118 ?auto_10119 ) ( ON ?auto_10118 ?auto_10120 ) ( CLEAR ?auto_10118 ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10120 ) ) ( not ( = ?auto_10118 ?auto_10120 ) ) ( not ( = ?auto_10123 ?auto_10124 ) ) ( IS-CRATE ?auto_10117 ) ( not ( = ?auto_10132 ?auto_10122 ) ) ( HOIST-AT ?auto_10133 ?auto_10132 ) ( AVAILABLE ?auto_10133 ) ( SURFACE-AT ?auto_10117 ?auto_10132 ) ( ON ?auto_10117 ?auto_10134 ) ( CLEAR ?auto_10117 ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10134 ) ) ( not ( = ?auto_10117 ?auto_10134 ) ) ( not ( = ?auto_10123 ?auto_10133 ) ) ( IS-CRATE ?auto_10116 ) ( not ( = ?auto_10131 ?auto_10122 ) ) ( HOIST-AT ?auto_10140 ?auto_10131 ) ( AVAILABLE ?auto_10140 ) ( SURFACE-AT ?auto_10116 ?auto_10131 ) ( ON ?auto_10116 ?auto_10130 ) ( CLEAR ?auto_10116 ) ( not ( = ?auto_10115 ?auto_10116 ) ) ( not ( = ?auto_10115 ?auto_10130 ) ) ( not ( = ?auto_10116 ?auto_10130 ) ) ( not ( = ?auto_10123 ?auto_10140 ) ) ( IS-CRATE ?auto_10115 ) ( not ( = ?auto_10141 ?auto_10122 ) ) ( HOIST-AT ?auto_10138 ?auto_10141 ) ( AVAILABLE ?auto_10138 ) ( SURFACE-AT ?auto_10115 ?auto_10141 ) ( ON ?auto_10115 ?auto_10135 ) ( CLEAR ?auto_10115 ) ( not ( = ?auto_10114 ?auto_10115 ) ) ( not ( = ?auto_10114 ?auto_10135 ) ) ( not ( = ?auto_10115 ?auto_10135 ) ) ( not ( = ?auto_10123 ?auto_10138 ) ) ( IS-CRATE ?auto_10114 ) ( not ( = ?auto_10127 ?auto_10122 ) ) ( HOIST-AT ?auto_10139 ?auto_10127 ) ( AVAILABLE ?auto_10139 ) ( SURFACE-AT ?auto_10114 ?auto_10127 ) ( ON ?auto_10114 ?auto_10136 ) ( CLEAR ?auto_10114 ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10136 ) ) ( not ( = ?auto_10114 ?auto_10136 ) ) ( not ( = ?auto_10123 ?auto_10139 ) ) ( IS-CRATE ?auto_10113 ) ( not ( = ?auto_10142 ?auto_10122 ) ) ( HOIST-AT ?auto_10125 ?auto_10142 ) ( AVAILABLE ?auto_10125 ) ( SURFACE-AT ?auto_10113 ?auto_10142 ) ( ON ?auto_10113 ?auto_10137 ) ( CLEAR ?auto_10113 ) ( not ( = ?auto_10112 ?auto_10113 ) ) ( not ( = ?auto_10112 ?auto_10137 ) ) ( not ( = ?auto_10113 ?auto_10137 ) ) ( not ( = ?auto_10123 ?auto_10125 ) ) ( SURFACE-AT ?auto_10111 ?auto_10122 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10112 ) ( AVAILABLE ?auto_10123 ) ( not ( = ?auto_10126 ?auto_10122 ) ) ( HOIST-AT ?auto_10128 ?auto_10126 ) ( AVAILABLE ?auto_10128 ) ( SURFACE-AT ?auto_10112 ?auto_10126 ) ( ON ?auto_10112 ?auto_10129 ) ( CLEAR ?auto_10112 ) ( TRUCK-AT ?auto_10121 ?auto_10122 ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( not ( = ?auto_10111 ?auto_10129 ) ) ( not ( = ?auto_10112 ?auto_10129 ) ) ( not ( = ?auto_10123 ?auto_10128 ) ) ( not ( = ?auto_10111 ?auto_10113 ) ) ( not ( = ?auto_10111 ?auto_10137 ) ) ( not ( = ?auto_10113 ?auto_10129 ) ) ( not ( = ?auto_10142 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( not ( = ?auto_10137 ?auto_10129 ) ) ( not ( = ?auto_10111 ?auto_10114 ) ) ( not ( = ?auto_10111 ?auto_10136 ) ) ( not ( = ?auto_10112 ?auto_10114 ) ) ( not ( = ?auto_10112 ?auto_10136 ) ) ( not ( = ?auto_10114 ?auto_10137 ) ) ( not ( = ?auto_10114 ?auto_10129 ) ) ( not ( = ?auto_10127 ?auto_10142 ) ) ( not ( = ?auto_10127 ?auto_10126 ) ) ( not ( = ?auto_10139 ?auto_10125 ) ) ( not ( = ?auto_10139 ?auto_10128 ) ) ( not ( = ?auto_10136 ?auto_10137 ) ) ( not ( = ?auto_10136 ?auto_10129 ) ) ( not ( = ?auto_10111 ?auto_10115 ) ) ( not ( = ?auto_10111 ?auto_10135 ) ) ( not ( = ?auto_10112 ?auto_10115 ) ) ( not ( = ?auto_10112 ?auto_10135 ) ) ( not ( = ?auto_10113 ?auto_10115 ) ) ( not ( = ?auto_10113 ?auto_10135 ) ) ( not ( = ?auto_10115 ?auto_10136 ) ) ( not ( = ?auto_10115 ?auto_10137 ) ) ( not ( = ?auto_10115 ?auto_10129 ) ) ( not ( = ?auto_10141 ?auto_10127 ) ) ( not ( = ?auto_10141 ?auto_10142 ) ) ( not ( = ?auto_10141 ?auto_10126 ) ) ( not ( = ?auto_10138 ?auto_10139 ) ) ( not ( = ?auto_10138 ?auto_10125 ) ) ( not ( = ?auto_10138 ?auto_10128 ) ) ( not ( = ?auto_10135 ?auto_10136 ) ) ( not ( = ?auto_10135 ?auto_10137 ) ) ( not ( = ?auto_10135 ?auto_10129 ) ) ( not ( = ?auto_10111 ?auto_10116 ) ) ( not ( = ?auto_10111 ?auto_10130 ) ) ( not ( = ?auto_10112 ?auto_10116 ) ) ( not ( = ?auto_10112 ?auto_10130 ) ) ( not ( = ?auto_10113 ?auto_10116 ) ) ( not ( = ?auto_10113 ?auto_10130 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10130 ) ) ( not ( = ?auto_10116 ?auto_10135 ) ) ( not ( = ?auto_10116 ?auto_10136 ) ) ( not ( = ?auto_10116 ?auto_10137 ) ) ( not ( = ?auto_10116 ?auto_10129 ) ) ( not ( = ?auto_10131 ?auto_10141 ) ) ( not ( = ?auto_10131 ?auto_10127 ) ) ( not ( = ?auto_10131 ?auto_10142 ) ) ( not ( = ?auto_10131 ?auto_10126 ) ) ( not ( = ?auto_10140 ?auto_10138 ) ) ( not ( = ?auto_10140 ?auto_10139 ) ) ( not ( = ?auto_10140 ?auto_10125 ) ) ( not ( = ?auto_10140 ?auto_10128 ) ) ( not ( = ?auto_10130 ?auto_10135 ) ) ( not ( = ?auto_10130 ?auto_10136 ) ) ( not ( = ?auto_10130 ?auto_10137 ) ) ( not ( = ?auto_10130 ?auto_10129 ) ) ( not ( = ?auto_10111 ?auto_10117 ) ) ( not ( = ?auto_10111 ?auto_10134 ) ) ( not ( = ?auto_10112 ?auto_10117 ) ) ( not ( = ?auto_10112 ?auto_10134 ) ) ( not ( = ?auto_10113 ?auto_10117 ) ) ( not ( = ?auto_10113 ?auto_10134 ) ) ( not ( = ?auto_10114 ?auto_10117 ) ) ( not ( = ?auto_10114 ?auto_10134 ) ) ( not ( = ?auto_10115 ?auto_10117 ) ) ( not ( = ?auto_10115 ?auto_10134 ) ) ( not ( = ?auto_10117 ?auto_10130 ) ) ( not ( = ?auto_10117 ?auto_10135 ) ) ( not ( = ?auto_10117 ?auto_10136 ) ) ( not ( = ?auto_10117 ?auto_10137 ) ) ( not ( = ?auto_10117 ?auto_10129 ) ) ( not ( = ?auto_10132 ?auto_10131 ) ) ( not ( = ?auto_10132 ?auto_10141 ) ) ( not ( = ?auto_10132 ?auto_10127 ) ) ( not ( = ?auto_10132 ?auto_10142 ) ) ( not ( = ?auto_10132 ?auto_10126 ) ) ( not ( = ?auto_10133 ?auto_10140 ) ) ( not ( = ?auto_10133 ?auto_10138 ) ) ( not ( = ?auto_10133 ?auto_10139 ) ) ( not ( = ?auto_10133 ?auto_10125 ) ) ( not ( = ?auto_10133 ?auto_10128 ) ) ( not ( = ?auto_10134 ?auto_10130 ) ) ( not ( = ?auto_10134 ?auto_10135 ) ) ( not ( = ?auto_10134 ?auto_10136 ) ) ( not ( = ?auto_10134 ?auto_10137 ) ) ( not ( = ?auto_10134 ?auto_10129 ) ) ( not ( = ?auto_10111 ?auto_10118 ) ) ( not ( = ?auto_10111 ?auto_10120 ) ) ( not ( = ?auto_10112 ?auto_10118 ) ) ( not ( = ?auto_10112 ?auto_10120 ) ) ( not ( = ?auto_10113 ?auto_10118 ) ) ( not ( = ?auto_10113 ?auto_10120 ) ) ( not ( = ?auto_10114 ?auto_10118 ) ) ( not ( = ?auto_10114 ?auto_10120 ) ) ( not ( = ?auto_10115 ?auto_10118 ) ) ( not ( = ?auto_10115 ?auto_10120 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10116 ?auto_10120 ) ) ( not ( = ?auto_10118 ?auto_10134 ) ) ( not ( = ?auto_10118 ?auto_10130 ) ) ( not ( = ?auto_10118 ?auto_10135 ) ) ( not ( = ?auto_10118 ?auto_10136 ) ) ( not ( = ?auto_10118 ?auto_10137 ) ) ( not ( = ?auto_10118 ?auto_10129 ) ) ( not ( = ?auto_10119 ?auto_10132 ) ) ( not ( = ?auto_10119 ?auto_10131 ) ) ( not ( = ?auto_10119 ?auto_10141 ) ) ( not ( = ?auto_10119 ?auto_10127 ) ) ( not ( = ?auto_10119 ?auto_10142 ) ) ( not ( = ?auto_10119 ?auto_10126 ) ) ( not ( = ?auto_10124 ?auto_10133 ) ) ( not ( = ?auto_10124 ?auto_10140 ) ) ( not ( = ?auto_10124 ?auto_10138 ) ) ( not ( = ?auto_10124 ?auto_10139 ) ) ( not ( = ?auto_10124 ?auto_10125 ) ) ( not ( = ?auto_10124 ?auto_10128 ) ) ( not ( = ?auto_10120 ?auto_10134 ) ) ( not ( = ?auto_10120 ?auto_10130 ) ) ( not ( = ?auto_10120 ?auto_10135 ) ) ( not ( = ?auto_10120 ?auto_10136 ) ) ( not ( = ?auto_10120 ?auto_10137 ) ) ( not ( = ?auto_10120 ?auto_10129 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10117 )
      ( MAKE-1CRATE ?auto_10117 ?auto_10118 )
      ( MAKE-7CRATE-VERIFY ?auto_10111 ?auto_10112 ?auto_10113 ?auto_10114 ?auto_10115 ?auto_10116 ?auto_10117 ?auto_10118 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10162 - SURFACE
      ?auto_10163 - SURFACE
      ?auto_10164 - SURFACE
      ?auto_10165 - SURFACE
      ?auto_10166 - SURFACE
      ?auto_10167 - SURFACE
      ?auto_10168 - SURFACE
      ?auto_10169 - SURFACE
      ?auto_10170 - SURFACE
    )
    :vars
    (
      ?auto_10174 - HOIST
      ?auto_10171 - PLACE
      ?auto_10173 - PLACE
      ?auto_10172 - HOIST
      ?auto_10175 - SURFACE
      ?auto_10177 - PLACE
      ?auto_10179 - HOIST
      ?auto_10193 - SURFACE
      ?auto_10182 - SURFACE
      ?auto_10186 - PLACE
      ?auto_10184 - HOIST
      ?auto_10185 - SURFACE
      ?auto_10187 - PLACE
      ?auto_10178 - HOIST
      ?auto_10181 - SURFACE
      ?auto_10188 - PLACE
      ?auto_10190 - HOIST
      ?auto_10194 - SURFACE
      ?auto_10189 - PLACE
      ?auto_10191 - HOIST
      ?auto_10192 - SURFACE
      ?auto_10195 - PLACE
      ?auto_10183 - HOIST
      ?auto_10180 - SURFACE
      ?auto_10176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10174 ?auto_10171 ) ( IS-CRATE ?auto_10170 ) ( not ( = ?auto_10173 ?auto_10171 ) ) ( HOIST-AT ?auto_10172 ?auto_10173 ) ( SURFACE-AT ?auto_10170 ?auto_10173 ) ( ON ?auto_10170 ?auto_10175 ) ( CLEAR ?auto_10170 ) ( not ( = ?auto_10169 ?auto_10170 ) ) ( not ( = ?auto_10169 ?auto_10175 ) ) ( not ( = ?auto_10170 ?auto_10175 ) ) ( not ( = ?auto_10174 ?auto_10172 ) ) ( IS-CRATE ?auto_10169 ) ( not ( = ?auto_10177 ?auto_10171 ) ) ( HOIST-AT ?auto_10179 ?auto_10177 ) ( AVAILABLE ?auto_10179 ) ( SURFACE-AT ?auto_10169 ?auto_10177 ) ( ON ?auto_10169 ?auto_10193 ) ( CLEAR ?auto_10169 ) ( not ( = ?auto_10168 ?auto_10169 ) ) ( not ( = ?auto_10168 ?auto_10193 ) ) ( not ( = ?auto_10169 ?auto_10193 ) ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( IS-CRATE ?auto_10168 ) ( AVAILABLE ?auto_10172 ) ( SURFACE-AT ?auto_10168 ?auto_10173 ) ( ON ?auto_10168 ?auto_10182 ) ( CLEAR ?auto_10168 ) ( not ( = ?auto_10167 ?auto_10168 ) ) ( not ( = ?auto_10167 ?auto_10182 ) ) ( not ( = ?auto_10168 ?auto_10182 ) ) ( IS-CRATE ?auto_10167 ) ( not ( = ?auto_10186 ?auto_10171 ) ) ( HOIST-AT ?auto_10184 ?auto_10186 ) ( AVAILABLE ?auto_10184 ) ( SURFACE-AT ?auto_10167 ?auto_10186 ) ( ON ?auto_10167 ?auto_10185 ) ( CLEAR ?auto_10167 ) ( not ( = ?auto_10166 ?auto_10167 ) ) ( not ( = ?auto_10166 ?auto_10185 ) ) ( not ( = ?auto_10167 ?auto_10185 ) ) ( not ( = ?auto_10174 ?auto_10184 ) ) ( IS-CRATE ?auto_10166 ) ( not ( = ?auto_10187 ?auto_10171 ) ) ( HOIST-AT ?auto_10178 ?auto_10187 ) ( AVAILABLE ?auto_10178 ) ( SURFACE-AT ?auto_10166 ?auto_10187 ) ( ON ?auto_10166 ?auto_10181 ) ( CLEAR ?auto_10166 ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( not ( = ?auto_10165 ?auto_10181 ) ) ( not ( = ?auto_10166 ?auto_10181 ) ) ( not ( = ?auto_10174 ?auto_10178 ) ) ( IS-CRATE ?auto_10165 ) ( not ( = ?auto_10188 ?auto_10171 ) ) ( HOIST-AT ?auto_10190 ?auto_10188 ) ( AVAILABLE ?auto_10190 ) ( SURFACE-AT ?auto_10165 ?auto_10188 ) ( ON ?auto_10165 ?auto_10194 ) ( CLEAR ?auto_10165 ) ( not ( = ?auto_10164 ?auto_10165 ) ) ( not ( = ?auto_10164 ?auto_10194 ) ) ( not ( = ?auto_10165 ?auto_10194 ) ) ( not ( = ?auto_10174 ?auto_10190 ) ) ( IS-CRATE ?auto_10164 ) ( not ( = ?auto_10189 ?auto_10171 ) ) ( HOIST-AT ?auto_10191 ?auto_10189 ) ( AVAILABLE ?auto_10191 ) ( SURFACE-AT ?auto_10164 ?auto_10189 ) ( ON ?auto_10164 ?auto_10192 ) ( CLEAR ?auto_10164 ) ( not ( = ?auto_10163 ?auto_10164 ) ) ( not ( = ?auto_10163 ?auto_10192 ) ) ( not ( = ?auto_10164 ?auto_10192 ) ) ( not ( = ?auto_10174 ?auto_10191 ) ) ( SURFACE-AT ?auto_10162 ?auto_10171 ) ( CLEAR ?auto_10162 ) ( IS-CRATE ?auto_10163 ) ( AVAILABLE ?auto_10174 ) ( not ( = ?auto_10195 ?auto_10171 ) ) ( HOIST-AT ?auto_10183 ?auto_10195 ) ( AVAILABLE ?auto_10183 ) ( SURFACE-AT ?auto_10163 ?auto_10195 ) ( ON ?auto_10163 ?auto_10180 ) ( CLEAR ?auto_10163 ) ( TRUCK-AT ?auto_10176 ?auto_10171 ) ( not ( = ?auto_10162 ?auto_10163 ) ) ( not ( = ?auto_10162 ?auto_10180 ) ) ( not ( = ?auto_10163 ?auto_10180 ) ) ( not ( = ?auto_10174 ?auto_10183 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10192 ) ) ( not ( = ?auto_10164 ?auto_10180 ) ) ( not ( = ?auto_10189 ?auto_10195 ) ) ( not ( = ?auto_10191 ?auto_10183 ) ) ( not ( = ?auto_10192 ?auto_10180 ) ) ( not ( = ?auto_10162 ?auto_10165 ) ) ( not ( = ?auto_10162 ?auto_10194 ) ) ( not ( = ?auto_10163 ?auto_10165 ) ) ( not ( = ?auto_10163 ?auto_10194 ) ) ( not ( = ?auto_10165 ?auto_10192 ) ) ( not ( = ?auto_10165 ?auto_10180 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10195 ) ) ( not ( = ?auto_10190 ?auto_10191 ) ) ( not ( = ?auto_10190 ?auto_10183 ) ) ( not ( = ?auto_10194 ?auto_10192 ) ) ( not ( = ?auto_10194 ?auto_10180 ) ) ( not ( = ?auto_10162 ?auto_10166 ) ) ( not ( = ?auto_10162 ?auto_10181 ) ) ( not ( = ?auto_10163 ?auto_10166 ) ) ( not ( = ?auto_10163 ?auto_10181 ) ) ( not ( = ?auto_10164 ?auto_10166 ) ) ( not ( = ?auto_10164 ?auto_10181 ) ) ( not ( = ?auto_10166 ?auto_10194 ) ) ( not ( = ?auto_10166 ?auto_10192 ) ) ( not ( = ?auto_10166 ?auto_10180 ) ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10187 ?auto_10195 ) ) ( not ( = ?auto_10178 ?auto_10190 ) ) ( not ( = ?auto_10178 ?auto_10191 ) ) ( not ( = ?auto_10178 ?auto_10183 ) ) ( not ( = ?auto_10181 ?auto_10194 ) ) ( not ( = ?auto_10181 ?auto_10192 ) ) ( not ( = ?auto_10181 ?auto_10180 ) ) ( not ( = ?auto_10162 ?auto_10167 ) ) ( not ( = ?auto_10162 ?auto_10185 ) ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( not ( = ?auto_10163 ?auto_10185 ) ) ( not ( = ?auto_10164 ?auto_10167 ) ) ( not ( = ?auto_10164 ?auto_10185 ) ) ( not ( = ?auto_10165 ?auto_10167 ) ) ( not ( = ?auto_10165 ?auto_10185 ) ) ( not ( = ?auto_10167 ?auto_10181 ) ) ( not ( = ?auto_10167 ?auto_10194 ) ) ( not ( = ?auto_10167 ?auto_10192 ) ) ( not ( = ?auto_10167 ?auto_10180 ) ) ( not ( = ?auto_10186 ?auto_10187 ) ) ( not ( = ?auto_10186 ?auto_10188 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( not ( = ?auto_10186 ?auto_10195 ) ) ( not ( = ?auto_10184 ?auto_10178 ) ) ( not ( = ?auto_10184 ?auto_10190 ) ) ( not ( = ?auto_10184 ?auto_10191 ) ) ( not ( = ?auto_10184 ?auto_10183 ) ) ( not ( = ?auto_10185 ?auto_10181 ) ) ( not ( = ?auto_10185 ?auto_10194 ) ) ( not ( = ?auto_10185 ?auto_10192 ) ) ( not ( = ?auto_10185 ?auto_10180 ) ) ( not ( = ?auto_10162 ?auto_10168 ) ) ( not ( = ?auto_10162 ?auto_10182 ) ) ( not ( = ?auto_10163 ?auto_10168 ) ) ( not ( = ?auto_10163 ?auto_10182 ) ) ( not ( = ?auto_10164 ?auto_10168 ) ) ( not ( = ?auto_10164 ?auto_10182 ) ) ( not ( = ?auto_10165 ?auto_10168 ) ) ( not ( = ?auto_10165 ?auto_10182 ) ) ( not ( = ?auto_10166 ?auto_10168 ) ) ( not ( = ?auto_10166 ?auto_10182 ) ) ( not ( = ?auto_10168 ?auto_10185 ) ) ( not ( = ?auto_10168 ?auto_10181 ) ) ( not ( = ?auto_10168 ?auto_10194 ) ) ( not ( = ?auto_10168 ?auto_10192 ) ) ( not ( = ?auto_10168 ?auto_10180 ) ) ( not ( = ?auto_10173 ?auto_10186 ) ) ( not ( = ?auto_10173 ?auto_10187 ) ) ( not ( = ?auto_10173 ?auto_10188 ) ) ( not ( = ?auto_10173 ?auto_10189 ) ) ( not ( = ?auto_10173 ?auto_10195 ) ) ( not ( = ?auto_10172 ?auto_10184 ) ) ( not ( = ?auto_10172 ?auto_10178 ) ) ( not ( = ?auto_10172 ?auto_10190 ) ) ( not ( = ?auto_10172 ?auto_10191 ) ) ( not ( = ?auto_10172 ?auto_10183 ) ) ( not ( = ?auto_10182 ?auto_10185 ) ) ( not ( = ?auto_10182 ?auto_10181 ) ) ( not ( = ?auto_10182 ?auto_10194 ) ) ( not ( = ?auto_10182 ?auto_10192 ) ) ( not ( = ?auto_10182 ?auto_10180 ) ) ( not ( = ?auto_10162 ?auto_10169 ) ) ( not ( = ?auto_10162 ?auto_10193 ) ) ( not ( = ?auto_10163 ?auto_10169 ) ) ( not ( = ?auto_10163 ?auto_10193 ) ) ( not ( = ?auto_10164 ?auto_10169 ) ) ( not ( = ?auto_10164 ?auto_10193 ) ) ( not ( = ?auto_10165 ?auto_10169 ) ) ( not ( = ?auto_10165 ?auto_10193 ) ) ( not ( = ?auto_10166 ?auto_10169 ) ) ( not ( = ?auto_10166 ?auto_10193 ) ) ( not ( = ?auto_10167 ?auto_10169 ) ) ( not ( = ?auto_10167 ?auto_10193 ) ) ( not ( = ?auto_10169 ?auto_10182 ) ) ( not ( = ?auto_10169 ?auto_10185 ) ) ( not ( = ?auto_10169 ?auto_10181 ) ) ( not ( = ?auto_10169 ?auto_10194 ) ) ( not ( = ?auto_10169 ?auto_10192 ) ) ( not ( = ?auto_10169 ?auto_10180 ) ) ( not ( = ?auto_10177 ?auto_10173 ) ) ( not ( = ?auto_10177 ?auto_10186 ) ) ( not ( = ?auto_10177 ?auto_10187 ) ) ( not ( = ?auto_10177 ?auto_10188 ) ) ( not ( = ?auto_10177 ?auto_10189 ) ) ( not ( = ?auto_10177 ?auto_10195 ) ) ( not ( = ?auto_10179 ?auto_10172 ) ) ( not ( = ?auto_10179 ?auto_10184 ) ) ( not ( = ?auto_10179 ?auto_10178 ) ) ( not ( = ?auto_10179 ?auto_10190 ) ) ( not ( = ?auto_10179 ?auto_10191 ) ) ( not ( = ?auto_10179 ?auto_10183 ) ) ( not ( = ?auto_10193 ?auto_10182 ) ) ( not ( = ?auto_10193 ?auto_10185 ) ) ( not ( = ?auto_10193 ?auto_10181 ) ) ( not ( = ?auto_10193 ?auto_10194 ) ) ( not ( = ?auto_10193 ?auto_10192 ) ) ( not ( = ?auto_10193 ?auto_10180 ) ) ( not ( = ?auto_10162 ?auto_10170 ) ) ( not ( = ?auto_10162 ?auto_10175 ) ) ( not ( = ?auto_10163 ?auto_10170 ) ) ( not ( = ?auto_10163 ?auto_10175 ) ) ( not ( = ?auto_10164 ?auto_10170 ) ) ( not ( = ?auto_10164 ?auto_10175 ) ) ( not ( = ?auto_10165 ?auto_10170 ) ) ( not ( = ?auto_10165 ?auto_10175 ) ) ( not ( = ?auto_10166 ?auto_10170 ) ) ( not ( = ?auto_10166 ?auto_10175 ) ) ( not ( = ?auto_10167 ?auto_10170 ) ) ( not ( = ?auto_10167 ?auto_10175 ) ) ( not ( = ?auto_10168 ?auto_10170 ) ) ( not ( = ?auto_10168 ?auto_10175 ) ) ( not ( = ?auto_10170 ?auto_10193 ) ) ( not ( = ?auto_10170 ?auto_10182 ) ) ( not ( = ?auto_10170 ?auto_10185 ) ) ( not ( = ?auto_10170 ?auto_10181 ) ) ( not ( = ?auto_10170 ?auto_10194 ) ) ( not ( = ?auto_10170 ?auto_10192 ) ) ( not ( = ?auto_10170 ?auto_10180 ) ) ( not ( = ?auto_10175 ?auto_10193 ) ) ( not ( = ?auto_10175 ?auto_10182 ) ) ( not ( = ?auto_10175 ?auto_10185 ) ) ( not ( = ?auto_10175 ?auto_10181 ) ) ( not ( = ?auto_10175 ?auto_10194 ) ) ( not ( = ?auto_10175 ?auto_10192 ) ) ( not ( = ?auto_10175 ?auto_10180 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10162 ?auto_10163 ?auto_10164 ?auto_10165 ?auto_10166 ?auto_10167 ?auto_10168 ?auto_10169 )
      ( MAKE-1CRATE ?auto_10169 ?auto_10170 )
      ( MAKE-8CRATE-VERIFY ?auto_10162 ?auto_10163 ?auto_10164 ?auto_10165 ?auto_10166 ?auto_10167 ?auto_10168 ?auto_10169 ?auto_10170 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10216 - SURFACE
      ?auto_10217 - SURFACE
      ?auto_10218 - SURFACE
      ?auto_10219 - SURFACE
      ?auto_10220 - SURFACE
      ?auto_10221 - SURFACE
      ?auto_10222 - SURFACE
      ?auto_10223 - SURFACE
      ?auto_10224 - SURFACE
      ?auto_10225 - SURFACE
    )
    :vars
    (
      ?auto_10228 - HOIST
      ?auto_10227 - PLACE
      ?auto_10229 - PLACE
      ?auto_10230 - HOIST
      ?auto_10231 - SURFACE
      ?auto_10234 - PLACE
      ?auto_10242 - HOIST
      ?auto_10236 - SURFACE
      ?auto_10239 - PLACE
      ?auto_10246 - HOIST
      ?auto_10253 - SURFACE
      ?auto_10232 - SURFACE
      ?auto_10249 - PLACE
      ?auto_10245 - HOIST
      ?auto_10250 - SURFACE
      ?auto_10238 - PLACE
      ?auto_10241 - HOIST
      ?auto_10237 - SURFACE
      ?auto_10233 - PLACE
      ?auto_10240 - HOIST
      ?auto_10244 - SURFACE
      ?auto_10235 - PLACE
      ?auto_10248 - HOIST
      ?auto_10251 - SURFACE
      ?auto_10252 - PLACE
      ?auto_10243 - HOIST
      ?auto_10247 - SURFACE
      ?auto_10226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10228 ?auto_10227 ) ( IS-CRATE ?auto_10225 ) ( not ( = ?auto_10229 ?auto_10227 ) ) ( HOIST-AT ?auto_10230 ?auto_10229 ) ( AVAILABLE ?auto_10230 ) ( SURFACE-AT ?auto_10225 ?auto_10229 ) ( ON ?auto_10225 ?auto_10231 ) ( CLEAR ?auto_10225 ) ( not ( = ?auto_10224 ?auto_10225 ) ) ( not ( = ?auto_10224 ?auto_10231 ) ) ( not ( = ?auto_10225 ?auto_10231 ) ) ( not ( = ?auto_10228 ?auto_10230 ) ) ( IS-CRATE ?auto_10224 ) ( not ( = ?auto_10234 ?auto_10227 ) ) ( HOIST-AT ?auto_10242 ?auto_10234 ) ( SURFACE-AT ?auto_10224 ?auto_10234 ) ( ON ?auto_10224 ?auto_10236 ) ( CLEAR ?auto_10224 ) ( not ( = ?auto_10223 ?auto_10224 ) ) ( not ( = ?auto_10223 ?auto_10236 ) ) ( not ( = ?auto_10224 ?auto_10236 ) ) ( not ( = ?auto_10228 ?auto_10242 ) ) ( IS-CRATE ?auto_10223 ) ( not ( = ?auto_10239 ?auto_10227 ) ) ( HOIST-AT ?auto_10246 ?auto_10239 ) ( AVAILABLE ?auto_10246 ) ( SURFACE-AT ?auto_10223 ?auto_10239 ) ( ON ?auto_10223 ?auto_10253 ) ( CLEAR ?auto_10223 ) ( not ( = ?auto_10222 ?auto_10223 ) ) ( not ( = ?auto_10222 ?auto_10253 ) ) ( not ( = ?auto_10223 ?auto_10253 ) ) ( not ( = ?auto_10228 ?auto_10246 ) ) ( IS-CRATE ?auto_10222 ) ( AVAILABLE ?auto_10242 ) ( SURFACE-AT ?auto_10222 ?auto_10234 ) ( ON ?auto_10222 ?auto_10232 ) ( CLEAR ?auto_10222 ) ( not ( = ?auto_10221 ?auto_10222 ) ) ( not ( = ?auto_10221 ?auto_10232 ) ) ( not ( = ?auto_10222 ?auto_10232 ) ) ( IS-CRATE ?auto_10221 ) ( not ( = ?auto_10249 ?auto_10227 ) ) ( HOIST-AT ?auto_10245 ?auto_10249 ) ( AVAILABLE ?auto_10245 ) ( SURFACE-AT ?auto_10221 ?auto_10249 ) ( ON ?auto_10221 ?auto_10250 ) ( CLEAR ?auto_10221 ) ( not ( = ?auto_10220 ?auto_10221 ) ) ( not ( = ?auto_10220 ?auto_10250 ) ) ( not ( = ?auto_10221 ?auto_10250 ) ) ( not ( = ?auto_10228 ?auto_10245 ) ) ( IS-CRATE ?auto_10220 ) ( not ( = ?auto_10238 ?auto_10227 ) ) ( HOIST-AT ?auto_10241 ?auto_10238 ) ( AVAILABLE ?auto_10241 ) ( SURFACE-AT ?auto_10220 ?auto_10238 ) ( ON ?auto_10220 ?auto_10237 ) ( CLEAR ?auto_10220 ) ( not ( = ?auto_10219 ?auto_10220 ) ) ( not ( = ?auto_10219 ?auto_10237 ) ) ( not ( = ?auto_10220 ?auto_10237 ) ) ( not ( = ?auto_10228 ?auto_10241 ) ) ( IS-CRATE ?auto_10219 ) ( not ( = ?auto_10233 ?auto_10227 ) ) ( HOIST-AT ?auto_10240 ?auto_10233 ) ( AVAILABLE ?auto_10240 ) ( SURFACE-AT ?auto_10219 ?auto_10233 ) ( ON ?auto_10219 ?auto_10244 ) ( CLEAR ?auto_10219 ) ( not ( = ?auto_10218 ?auto_10219 ) ) ( not ( = ?auto_10218 ?auto_10244 ) ) ( not ( = ?auto_10219 ?auto_10244 ) ) ( not ( = ?auto_10228 ?auto_10240 ) ) ( IS-CRATE ?auto_10218 ) ( not ( = ?auto_10235 ?auto_10227 ) ) ( HOIST-AT ?auto_10248 ?auto_10235 ) ( AVAILABLE ?auto_10248 ) ( SURFACE-AT ?auto_10218 ?auto_10235 ) ( ON ?auto_10218 ?auto_10251 ) ( CLEAR ?auto_10218 ) ( not ( = ?auto_10217 ?auto_10218 ) ) ( not ( = ?auto_10217 ?auto_10251 ) ) ( not ( = ?auto_10218 ?auto_10251 ) ) ( not ( = ?auto_10228 ?auto_10248 ) ) ( SURFACE-AT ?auto_10216 ?auto_10227 ) ( CLEAR ?auto_10216 ) ( IS-CRATE ?auto_10217 ) ( AVAILABLE ?auto_10228 ) ( not ( = ?auto_10252 ?auto_10227 ) ) ( HOIST-AT ?auto_10243 ?auto_10252 ) ( AVAILABLE ?auto_10243 ) ( SURFACE-AT ?auto_10217 ?auto_10252 ) ( ON ?auto_10217 ?auto_10247 ) ( CLEAR ?auto_10217 ) ( TRUCK-AT ?auto_10226 ?auto_10227 ) ( not ( = ?auto_10216 ?auto_10217 ) ) ( not ( = ?auto_10216 ?auto_10247 ) ) ( not ( = ?auto_10217 ?auto_10247 ) ) ( not ( = ?auto_10228 ?auto_10243 ) ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( not ( = ?auto_10216 ?auto_10251 ) ) ( not ( = ?auto_10218 ?auto_10247 ) ) ( not ( = ?auto_10235 ?auto_10252 ) ) ( not ( = ?auto_10248 ?auto_10243 ) ) ( not ( = ?auto_10251 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10219 ) ) ( not ( = ?auto_10216 ?auto_10244 ) ) ( not ( = ?auto_10217 ?auto_10219 ) ) ( not ( = ?auto_10217 ?auto_10244 ) ) ( not ( = ?auto_10219 ?auto_10251 ) ) ( not ( = ?auto_10219 ?auto_10247 ) ) ( not ( = ?auto_10233 ?auto_10235 ) ) ( not ( = ?auto_10233 ?auto_10252 ) ) ( not ( = ?auto_10240 ?auto_10248 ) ) ( not ( = ?auto_10240 ?auto_10243 ) ) ( not ( = ?auto_10244 ?auto_10251 ) ) ( not ( = ?auto_10244 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10220 ) ) ( not ( = ?auto_10216 ?auto_10237 ) ) ( not ( = ?auto_10217 ?auto_10220 ) ) ( not ( = ?auto_10217 ?auto_10237 ) ) ( not ( = ?auto_10218 ?auto_10220 ) ) ( not ( = ?auto_10218 ?auto_10237 ) ) ( not ( = ?auto_10220 ?auto_10244 ) ) ( not ( = ?auto_10220 ?auto_10251 ) ) ( not ( = ?auto_10220 ?auto_10247 ) ) ( not ( = ?auto_10238 ?auto_10233 ) ) ( not ( = ?auto_10238 ?auto_10235 ) ) ( not ( = ?auto_10238 ?auto_10252 ) ) ( not ( = ?auto_10241 ?auto_10240 ) ) ( not ( = ?auto_10241 ?auto_10248 ) ) ( not ( = ?auto_10241 ?auto_10243 ) ) ( not ( = ?auto_10237 ?auto_10244 ) ) ( not ( = ?auto_10237 ?auto_10251 ) ) ( not ( = ?auto_10237 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10221 ) ) ( not ( = ?auto_10216 ?auto_10250 ) ) ( not ( = ?auto_10217 ?auto_10221 ) ) ( not ( = ?auto_10217 ?auto_10250 ) ) ( not ( = ?auto_10218 ?auto_10221 ) ) ( not ( = ?auto_10218 ?auto_10250 ) ) ( not ( = ?auto_10219 ?auto_10221 ) ) ( not ( = ?auto_10219 ?auto_10250 ) ) ( not ( = ?auto_10221 ?auto_10237 ) ) ( not ( = ?auto_10221 ?auto_10244 ) ) ( not ( = ?auto_10221 ?auto_10251 ) ) ( not ( = ?auto_10221 ?auto_10247 ) ) ( not ( = ?auto_10249 ?auto_10238 ) ) ( not ( = ?auto_10249 ?auto_10233 ) ) ( not ( = ?auto_10249 ?auto_10235 ) ) ( not ( = ?auto_10249 ?auto_10252 ) ) ( not ( = ?auto_10245 ?auto_10241 ) ) ( not ( = ?auto_10245 ?auto_10240 ) ) ( not ( = ?auto_10245 ?auto_10248 ) ) ( not ( = ?auto_10245 ?auto_10243 ) ) ( not ( = ?auto_10250 ?auto_10237 ) ) ( not ( = ?auto_10250 ?auto_10244 ) ) ( not ( = ?auto_10250 ?auto_10251 ) ) ( not ( = ?auto_10250 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10222 ) ) ( not ( = ?auto_10216 ?auto_10232 ) ) ( not ( = ?auto_10217 ?auto_10222 ) ) ( not ( = ?auto_10217 ?auto_10232 ) ) ( not ( = ?auto_10218 ?auto_10222 ) ) ( not ( = ?auto_10218 ?auto_10232 ) ) ( not ( = ?auto_10219 ?auto_10222 ) ) ( not ( = ?auto_10219 ?auto_10232 ) ) ( not ( = ?auto_10220 ?auto_10222 ) ) ( not ( = ?auto_10220 ?auto_10232 ) ) ( not ( = ?auto_10222 ?auto_10250 ) ) ( not ( = ?auto_10222 ?auto_10237 ) ) ( not ( = ?auto_10222 ?auto_10244 ) ) ( not ( = ?auto_10222 ?auto_10251 ) ) ( not ( = ?auto_10222 ?auto_10247 ) ) ( not ( = ?auto_10234 ?auto_10249 ) ) ( not ( = ?auto_10234 ?auto_10238 ) ) ( not ( = ?auto_10234 ?auto_10233 ) ) ( not ( = ?auto_10234 ?auto_10235 ) ) ( not ( = ?auto_10234 ?auto_10252 ) ) ( not ( = ?auto_10242 ?auto_10245 ) ) ( not ( = ?auto_10242 ?auto_10241 ) ) ( not ( = ?auto_10242 ?auto_10240 ) ) ( not ( = ?auto_10242 ?auto_10248 ) ) ( not ( = ?auto_10242 ?auto_10243 ) ) ( not ( = ?auto_10232 ?auto_10250 ) ) ( not ( = ?auto_10232 ?auto_10237 ) ) ( not ( = ?auto_10232 ?auto_10244 ) ) ( not ( = ?auto_10232 ?auto_10251 ) ) ( not ( = ?auto_10232 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10223 ) ) ( not ( = ?auto_10216 ?auto_10253 ) ) ( not ( = ?auto_10217 ?auto_10223 ) ) ( not ( = ?auto_10217 ?auto_10253 ) ) ( not ( = ?auto_10218 ?auto_10223 ) ) ( not ( = ?auto_10218 ?auto_10253 ) ) ( not ( = ?auto_10219 ?auto_10223 ) ) ( not ( = ?auto_10219 ?auto_10253 ) ) ( not ( = ?auto_10220 ?auto_10223 ) ) ( not ( = ?auto_10220 ?auto_10253 ) ) ( not ( = ?auto_10221 ?auto_10223 ) ) ( not ( = ?auto_10221 ?auto_10253 ) ) ( not ( = ?auto_10223 ?auto_10232 ) ) ( not ( = ?auto_10223 ?auto_10250 ) ) ( not ( = ?auto_10223 ?auto_10237 ) ) ( not ( = ?auto_10223 ?auto_10244 ) ) ( not ( = ?auto_10223 ?auto_10251 ) ) ( not ( = ?auto_10223 ?auto_10247 ) ) ( not ( = ?auto_10239 ?auto_10234 ) ) ( not ( = ?auto_10239 ?auto_10249 ) ) ( not ( = ?auto_10239 ?auto_10238 ) ) ( not ( = ?auto_10239 ?auto_10233 ) ) ( not ( = ?auto_10239 ?auto_10235 ) ) ( not ( = ?auto_10239 ?auto_10252 ) ) ( not ( = ?auto_10246 ?auto_10242 ) ) ( not ( = ?auto_10246 ?auto_10245 ) ) ( not ( = ?auto_10246 ?auto_10241 ) ) ( not ( = ?auto_10246 ?auto_10240 ) ) ( not ( = ?auto_10246 ?auto_10248 ) ) ( not ( = ?auto_10246 ?auto_10243 ) ) ( not ( = ?auto_10253 ?auto_10232 ) ) ( not ( = ?auto_10253 ?auto_10250 ) ) ( not ( = ?auto_10253 ?auto_10237 ) ) ( not ( = ?auto_10253 ?auto_10244 ) ) ( not ( = ?auto_10253 ?auto_10251 ) ) ( not ( = ?auto_10253 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10224 ) ) ( not ( = ?auto_10216 ?auto_10236 ) ) ( not ( = ?auto_10217 ?auto_10224 ) ) ( not ( = ?auto_10217 ?auto_10236 ) ) ( not ( = ?auto_10218 ?auto_10224 ) ) ( not ( = ?auto_10218 ?auto_10236 ) ) ( not ( = ?auto_10219 ?auto_10224 ) ) ( not ( = ?auto_10219 ?auto_10236 ) ) ( not ( = ?auto_10220 ?auto_10224 ) ) ( not ( = ?auto_10220 ?auto_10236 ) ) ( not ( = ?auto_10221 ?auto_10224 ) ) ( not ( = ?auto_10221 ?auto_10236 ) ) ( not ( = ?auto_10222 ?auto_10224 ) ) ( not ( = ?auto_10222 ?auto_10236 ) ) ( not ( = ?auto_10224 ?auto_10253 ) ) ( not ( = ?auto_10224 ?auto_10232 ) ) ( not ( = ?auto_10224 ?auto_10250 ) ) ( not ( = ?auto_10224 ?auto_10237 ) ) ( not ( = ?auto_10224 ?auto_10244 ) ) ( not ( = ?auto_10224 ?auto_10251 ) ) ( not ( = ?auto_10224 ?auto_10247 ) ) ( not ( = ?auto_10236 ?auto_10253 ) ) ( not ( = ?auto_10236 ?auto_10232 ) ) ( not ( = ?auto_10236 ?auto_10250 ) ) ( not ( = ?auto_10236 ?auto_10237 ) ) ( not ( = ?auto_10236 ?auto_10244 ) ) ( not ( = ?auto_10236 ?auto_10251 ) ) ( not ( = ?auto_10236 ?auto_10247 ) ) ( not ( = ?auto_10216 ?auto_10225 ) ) ( not ( = ?auto_10216 ?auto_10231 ) ) ( not ( = ?auto_10217 ?auto_10225 ) ) ( not ( = ?auto_10217 ?auto_10231 ) ) ( not ( = ?auto_10218 ?auto_10225 ) ) ( not ( = ?auto_10218 ?auto_10231 ) ) ( not ( = ?auto_10219 ?auto_10225 ) ) ( not ( = ?auto_10219 ?auto_10231 ) ) ( not ( = ?auto_10220 ?auto_10225 ) ) ( not ( = ?auto_10220 ?auto_10231 ) ) ( not ( = ?auto_10221 ?auto_10225 ) ) ( not ( = ?auto_10221 ?auto_10231 ) ) ( not ( = ?auto_10222 ?auto_10225 ) ) ( not ( = ?auto_10222 ?auto_10231 ) ) ( not ( = ?auto_10223 ?auto_10225 ) ) ( not ( = ?auto_10223 ?auto_10231 ) ) ( not ( = ?auto_10225 ?auto_10236 ) ) ( not ( = ?auto_10225 ?auto_10253 ) ) ( not ( = ?auto_10225 ?auto_10232 ) ) ( not ( = ?auto_10225 ?auto_10250 ) ) ( not ( = ?auto_10225 ?auto_10237 ) ) ( not ( = ?auto_10225 ?auto_10244 ) ) ( not ( = ?auto_10225 ?auto_10251 ) ) ( not ( = ?auto_10225 ?auto_10247 ) ) ( not ( = ?auto_10229 ?auto_10234 ) ) ( not ( = ?auto_10229 ?auto_10239 ) ) ( not ( = ?auto_10229 ?auto_10249 ) ) ( not ( = ?auto_10229 ?auto_10238 ) ) ( not ( = ?auto_10229 ?auto_10233 ) ) ( not ( = ?auto_10229 ?auto_10235 ) ) ( not ( = ?auto_10229 ?auto_10252 ) ) ( not ( = ?auto_10230 ?auto_10242 ) ) ( not ( = ?auto_10230 ?auto_10246 ) ) ( not ( = ?auto_10230 ?auto_10245 ) ) ( not ( = ?auto_10230 ?auto_10241 ) ) ( not ( = ?auto_10230 ?auto_10240 ) ) ( not ( = ?auto_10230 ?auto_10248 ) ) ( not ( = ?auto_10230 ?auto_10243 ) ) ( not ( = ?auto_10231 ?auto_10236 ) ) ( not ( = ?auto_10231 ?auto_10253 ) ) ( not ( = ?auto_10231 ?auto_10232 ) ) ( not ( = ?auto_10231 ?auto_10250 ) ) ( not ( = ?auto_10231 ?auto_10237 ) ) ( not ( = ?auto_10231 ?auto_10244 ) ) ( not ( = ?auto_10231 ?auto_10251 ) ) ( not ( = ?auto_10231 ?auto_10247 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10216 ?auto_10217 ?auto_10218 ?auto_10219 ?auto_10220 ?auto_10221 ?auto_10222 ?auto_10223 ?auto_10224 )
      ( MAKE-1CRATE ?auto_10224 ?auto_10225 )
      ( MAKE-9CRATE-VERIFY ?auto_10216 ?auto_10217 ?auto_10218 ?auto_10219 ?auto_10220 ?auto_10221 ?auto_10222 ?auto_10223 ?auto_10224 ?auto_10225 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10275 - SURFACE
      ?auto_10276 - SURFACE
      ?auto_10277 - SURFACE
      ?auto_10278 - SURFACE
      ?auto_10279 - SURFACE
      ?auto_10280 - SURFACE
      ?auto_10281 - SURFACE
      ?auto_10282 - SURFACE
      ?auto_10283 - SURFACE
      ?auto_10284 - SURFACE
      ?auto_10285 - SURFACE
    )
    :vars
    (
      ?auto_10286 - HOIST
      ?auto_10287 - PLACE
      ?auto_10288 - PLACE
      ?auto_10290 - HOIST
      ?auto_10291 - SURFACE
      ?auto_10297 - PLACE
      ?auto_10309 - HOIST
      ?auto_10296 - SURFACE
      ?auto_10312 - PLACE
      ?auto_10301 - HOIST
      ?auto_10300 - SURFACE
      ?auto_10306 - PLACE
      ?auto_10292 - HOIST
      ?auto_10313 - SURFACE
      ?auto_10310 - SURFACE
      ?auto_10305 - PLACE
      ?auto_10294 - HOIST
      ?auto_10304 - SURFACE
      ?auto_10308 - PLACE
      ?auto_10299 - HOIST
      ?auto_10295 - SURFACE
      ?auto_10311 - PLACE
      ?auto_10303 - HOIST
      ?auto_10307 - SURFACE
      ?auto_10298 - SURFACE
      ?auto_10302 - PLACE
      ?auto_10293 - HOIST
      ?auto_10314 - SURFACE
      ?auto_10289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10286 ?auto_10287 ) ( IS-CRATE ?auto_10285 ) ( not ( = ?auto_10288 ?auto_10287 ) ) ( HOIST-AT ?auto_10290 ?auto_10288 ) ( SURFACE-AT ?auto_10285 ?auto_10288 ) ( ON ?auto_10285 ?auto_10291 ) ( CLEAR ?auto_10285 ) ( not ( = ?auto_10284 ?auto_10285 ) ) ( not ( = ?auto_10284 ?auto_10291 ) ) ( not ( = ?auto_10285 ?auto_10291 ) ) ( not ( = ?auto_10286 ?auto_10290 ) ) ( IS-CRATE ?auto_10284 ) ( not ( = ?auto_10297 ?auto_10287 ) ) ( HOIST-AT ?auto_10309 ?auto_10297 ) ( AVAILABLE ?auto_10309 ) ( SURFACE-AT ?auto_10284 ?auto_10297 ) ( ON ?auto_10284 ?auto_10296 ) ( CLEAR ?auto_10284 ) ( not ( = ?auto_10283 ?auto_10284 ) ) ( not ( = ?auto_10283 ?auto_10296 ) ) ( not ( = ?auto_10284 ?auto_10296 ) ) ( not ( = ?auto_10286 ?auto_10309 ) ) ( IS-CRATE ?auto_10283 ) ( not ( = ?auto_10312 ?auto_10287 ) ) ( HOIST-AT ?auto_10301 ?auto_10312 ) ( SURFACE-AT ?auto_10283 ?auto_10312 ) ( ON ?auto_10283 ?auto_10300 ) ( CLEAR ?auto_10283 ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( not ( = ?auto_10282 ?auto_10300 ) ) ( not ( = ?auto_10283 ?auto_10300 ) ) ( not ( = ?auto_10286 ?auto_10301 ) ) ( IS-CRATE ?auto_10282 ) ( not ( = ?auto_10306 ?auto_10287 ) ) ( HOIST-AT ?auto_10292 ?auto_10306 ) ( AVAILABLE ?auto_10292 ) ( SURFACE-AT ?auto_10282 ?auto_10306 ) ( ON ?auto_10282 ?auto_10313 ) ( CLEAR ?auto_10282 ) ( not ( = ?auto_10281 ?auto_10282 ) ) ( not ( = ?auto_10281 ?auto_10313 ) ) ( not ( = ?auto_10282 ?auto_10313 ) ) ( not ( = ?auto_10286 ?auto_10292 ) ) ( IS-CRATE ?auto_10281 ) ( AVAILABLE ?auto_10301 ) ( SURFACE-AT ?auto_10281 ?auto_10312 ) ( ON ?auto_10281 ?auto_10310 ) ( CLEAR ?auto_10281 ) ( not ( = ?auto_10280 ?auto_10281 ) ) ( not ( = ?auto_10280 ?auto_10310 ) ) ( not ( = ?auto_10281 ?auto_10310 ) ) ( IS-CRATE ?auto_10280 ) ( not ( = ?auto_10305 ?auto_10287 ) ) ( HOIST-AT ?auto_10294 ?auto_10305 ) ( AVAILABLE ?auto_10294 ) ( SURFACE-AT ?auto_10280 ?auto_10305 ) ( ON ?auto_10280 ?auto_10304 ) ( CLEAR ?auto_10280 ) ( not ( = ?auto_10279 ?auto_10280 ) ) ( not ( = ?auto_10279 ?auto_10304 ) ) ( not ( = ?auto_10280 ?auto_10304 ) ) ( not ( = ?auto_10286 ?auto_10294 ) ) ( IS-CRATE ?auto_10279 ) ( not ( = ?auto_10308 ?auto_10287 ) ) ( HOIST-AT ?auto_10299 ?auto_10308 ) ( AVAILABLE ?auto_10299 ) ( SURFACE-AT ?auto_10279 ?auto_10308 ) ( ON ?auto_10279 ?auto_10295 ) ( CLEAR ?auto_10279 ) ( not ( = ?auto_10278 ?auto_10279 ) ) ( not ( = ?auto_10278 ?auto_10295 ) ) ( not ( = ?auto_10279 ?auto_10295 ) ) ( not ( = ?auto_10286 ?auto_10299 ) ) ( IS-CRATE ?auto_10278 ) ( not ( = ?auto_10311 ?auto_10287 ) ) ( HOIST-AT ?auto_10303 ?auto_10311 ) ( AVAILABLE ?auto_10303 ) ( SURFACE-AT ?auto_10278 ?auto_10311 ) ( ON ?auto_10278 ?auto_10307 ) ( CLEAR ?auto_10278 ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10307 ) ) ( not ( = ?auto_10278 ?auto_10307 ) ) ( not ( = ?auto_10286 ?auto_10303 ) ) ( IS-CRATE ?auto_10277 ) ( AVAILABLE ?auto_10290 ) ( SURFACE-AT ?auto_10277 ?auto_10288 ) ( ON ?auto_10277 ?auto_10298 ) ( CLEAR ?auto_10277 ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10298 ) ) ( not ( = ?auto_10277 ?auto_10298 ) ) ( SURFACE-AT ?auto_10275 ?auto_10287 ) ( CLEAR ?auto_10275 ) ( IS-CRATE ?auto_10276 ) ( AVAILABLE ?auto_10286 ) ( not ( = ?auto_10302 ?auto_10287 ) ) ( HOIST-AT ?auto_10293 ?auto_10302 ) ( AVAILABLE ?auto_10293 ) ( SURFACE-AT ?auto_10276 ?auto_10302 ) ( ON ?auto_10276 ?auto_10314 ) ( CLEAR ?auto_10276 ) ( TRUCK-AT ?auto_10289 ?auto_10287 ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10314 ) ) ( not ( = ?auto_10276 ?auto_10314 ) ) ( not ( = ?auto_10286 ?auto_10293 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10298 ) ) ( not ( = ?auto_10277 ?auto_10314 ) ) ( not ( = ?auto_10288 ?auto_10302 ) ) ( not ( = ?auto_10290 ?auto_10293 ) ) ( not ( = ?auto_10298 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10278 ) ) ( not ( = ?auto_10275 ?auto_10307 ) ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10307 ) ) ( not ( = ?auto_10278 ?auto_10298 ) ) ( not ( = ?auto_10278 ?auto_10314 ) ) ( not ( = ?auto_10311 ?auto_10288 ) ) ( not ( = ?auto_10311 ?auto_10302 ) ) ( not ( = ?auto_10303 ?auto_10290 ) ) ( not ( = ?auto_10303 ?auto_10293 ) ) ( not ( = ?auto_10307 ?auto_10298 ) ) ( not ( = ?auto_10307 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10279 ) ) ( not ( = ?auto_10275 ?auto_10295 ) ) ( not ( = ?auto_10276 ?auto_10279 ) ) ( not ( = ?auto_10276 ?auto_10295 ) ) ( not ( = ?auto_10277 ?auto_10279 ) ) ( not ( = ?auto_10277 ?auto_10295 ) ) ( not ( = ?auto_10279 ?auto_10307 ) ) ( not ( = ?auto_10279 ?auto_10298 ) ) ( not ( = ?auto_10279 ?auto_10314 ) ) ( not ( = ?auto_10308 ?auto_10311 ) ) ( not ( = ?auto_10308 ?auto_10288 ) ) ( not ( = ?auto_10308 ?auto_10302 ) ) ( not ( = ?auto_10299 ?auto_10303 ) ) ( not ( = ?auto_10299 ?auto_10290 ) ) ( not ( = ?auto_10299 ?auto_10293 ) ) ( not ( = ?auto_10295 ?auto_10307 ) ) ( not ( = ?auto_10295 ?auto_10298 ) ) ( not ( = ?auto_10295 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10280 ) ) ( not ( = ?auto_10275 ?auto_10304 ) ) ( not ( = ?auto_10276 ?auto_10280 ) ) ( not ( = ?auto_10276 ?auto_10304 ) ) ( not ( = ?auto_10277 ?auto_10280 ) ) ( not ( = ?auto_10277 ?auto_10304 ) ) ( not ( = ?auto_10278 ?auto_10280 ) ) ( not ( = ?auto_10278 ?auto_10304 ) ) ( not ( = ?auto_10280 ?auto_10295 ) ) ( not ( = ?auto_10280 ?auto_10307 ) ) ( not ( = ?auto_10280 ?auto_10298 ) ) ( not ( = ?auto_10280 ?auto_10314 ) ) ( not ( = ?auto_10305 ?auto_10308 ) ) ( not ( = ?auto_10305 ?auto_10311 ) ) ( not ( = ?auto_10305 ?auto_10288 ) ) ( not ( = ?auto_10305 ?auto_10302 ) ) ( not ( = ?auto_10294 ?auto_10299 ) ) ( not ( = ?auto_10294 ?auto_10303 ) ) ( not ( = ?auto_10294 ?auto_10290 ) ) ( not ( = ?auto_10294 ?auto_10293 ) ) ( not ( = ?auto_10304 ?auto_10295 ) ) ( not ( = ?auto_10304 ?auto_10307 ) ) ( not ( = ?auto_10304 ?auto_10298 ) ) ( not ( = ?auto_10304 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10281 ) ) ( not ( = ?auto_10275 ?auto_10310 ) ) ( not ( = ?auto_10276 ?auto_10281 ) ) ( not ( = ?auto_10276 ?auto_10310 ) ) ( not ( = ?auto_10277 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10310 ) ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10278 ?auto_10310 ) ) ( not ( = ?auto_10279 ?auto_10281 ) ) ( not ( = ?auto_10279 ?auto_10310 ) ) ( not ( = ?auto_10281 ?auto_10304 ) ) ( not ( = ?auto_10281 ?auto_10295 ) ) ( not ( = ?auto_10281 ?auto_10307 ) ) ( not ( = ?auto_10281 ?auto_10298 ) ) ( not ( = ?auto_10281 ?auto_10314 ) ) ( not ( = ?auto_10312 ?auto_10305 ) ) ( not ( = ?auto_10312 ?auto_10308 ) ) ( not ( = ?auto_10312 ?auto_10311 ) ) ( not ( = ?auto_10312 ?auto_10288 ) ) ( not ( = ?auto_10312 ?auto_10302 ) ) ( not ( = ?auto_10301 ?auto_10294 ) ) ( not ( = ?auto_10301 ?auto_10299 ) ) ( not ( = ?auto_10301 ?auto_10303 ) ) ( not ( = ?auto_10301 ?auto_10290 ) ) ( not ( = ?auto_10301 ?auto_10293 ) ) ( not ( = ?auto_10310 ?auto_10304 ) ) ( not ( = ?auto_10310 ?auto_10295 ) ) ( not ( = ?auto_10310 ?auto_10307 ) ) ( not ( = ?auto_10310 ?auto_10298 ) ) ( not ( = ?auto_10310 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10282 ) ) ( not ( = ?auto_10275 ?auto_10313 ) ) ( not ( = ?auto_10276 ?auto_10282 ) ) ( not ( = ?auto_10276 ?auto_10313 ) ) ( not ( = ?auto_10277 ?auto_10282 ) ) ( not ( = ?auto_10277 ?auto_10313 ) ) ( not ( = ?auto_10278 ?auto_10282 ) ) ( not ( = ?auto_10278 ?auto_10313 ) ) ( not ( = ?auto_10279 ?auto_10282 ) ) ( not ( = ?auto_10279 ?auto_10313 ) ) ( not ( = ?auto_10280 ?auto_10282 ) ) ( not ( = ?auto_10280 ?auto_10313 ) ) ( not ( = ?auto_10282 ?auto_10310 ) ) ( not ( = ?auto_10282 ?auto_10304 ) ) ( not ( = ?auto_10282 ?auto_10295 ) ) ( not ( = ?auto_10282 ?auto_10307 ) ) ( not ( = ?auto_10282 ?auto_10298 ) ) ( not ( = ?auto_10282 ?auto_10314 ) ) ( not ( = ?auto_10306 ?auto_10312 ) ) ( not ( = ?auto_10306 ?auto_10305 ) ) ( not ( = ?auto_10306 ?auto_10308 ) ) ( not ( = ?auto_10306 ?auto_10311 ) ) ( not ( = ?auto_10306 ?auto_10288 ) ) ( not ( = ?auto_10306 ?auto_10302 ) ) ( not ( = ?auto_10292 ?auto_10301 ) ) ( not ( = ?auto_10292 ?auto_10294 ) ) ( not ( = ?auto_10292 ?auto_10299 ) ) ( not ( = ?auto_10292 ?auto_10303 ) ) ( not ( = ?auto_10292 ?auto_10290 ) ) ( not ( = ?auto_10292 ?auto_10293 ) ) ( not ( = ?auto_10313 ?auto_10310 ) ) ( not ( = ?auto_10313 ?auto_10304 ) ) ( not ( = ?auto_10313 ?auto_10295 ) ) ( not ( = ?auto_10313 ?auto_10307 ) ) ( not ( = ?auto_10313 ?auto_10298 ) ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10283 ) ) ( not ( = ?auto_10275 ?auto_10300 ) ) ( not ( = ?auto_10276 ?auto_10283 ) ) ( not ( = ?auto_10276 ?auto_10300 ) ) ( not ( = ?auto_10277 ?auto_10283 ) ) ( not ( = ?auto_10277 ?auto_10300 ) ) ( not ( = ?auto_10278 ?auto_10283 ) ) ( not ( = ?auto_10278 ?auto_10300 ) ) ( not ( = ?auto_10279 ?auto_10283 ) ) ( not ( = ?auto_10279 ?auto_10300 ) ) ( not ( = ?auto_10280 ?auto_10283 ) ) ( not ( = ?auto_10280 ?auto_10300 ) ) ( not ( = ?auto_10281 ?auto_10283 ) ) ( not ( = ?auto_10281 ?auto_10300 ) ) ( not ( = ?auto_10283 ?auto_10313 ) ) ( not ( = ?auto_10283 ?auto_10310 ) ) ( not ( = ?auto_10283 ?auto_10304 ) ) ( not ( = ?auto_10283 ?auto_10295 ) ) ( not ( = ?auto_10283 ?auto_10307 ) ) ( not ( = ?auto_10283 ?auto_10298 ) ) ( not ( = ?auto_10283 ?auto_10314 ) ) ( not ( = ?auto_10300 ?auto_10313 ) ) ( not ( = ?auto_10300 ?auto_10310 ) ) ( not ( = ?auto_10300 ?auto_10304 ) ) ( not ( = ?auto_10300 ?auto_10295 ) ) ( not ( = ?auto_10300 ?auto_10307 ) ) ( not ( = ?auto_10300 ?auto_10298 ) ) ( not ( = ?auto_10300 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10284 ) ) ( not ( = ?auto_10275 ?auto_10296 ) ) ( not ( = ?auto_10276 ?auto_10284 ) ) ( not ( = ?auto_10276 ?auto_10296 ) ) ( not ( = ?auto_10277 ?auto_10284 ) ) ( not ( = ?auto_10277 ?auto_10296 ) ) ( not ( = ?auto_10278 ?auto_10284 ) ) ( not ( = ?auto_10278 ?auto_10296 ) ) ( not ( = ?auto_10279 ?auto_10284 ) ) ( not ( = ?auto_10279 ?auto_10296 ) ) ( not ( = ?auto_10280 ?auto_10284 ) ) ( not ( = ?auto_10280 ?auto_10296 ) ) ( not ( = ?auto_10281 ?auto_10284 ) ) ( not ( = ?auto_10281 ?auto_10296 ) ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( not ( = ?auto_10282 ?auto_10296 ) ) ( not ( = ?auto_10284 ?auto_10300 ) ) ( not ( = ?auto_10284 ?auto_10313 ) ) ( not ( = ?auto_10284 ?auto_10310 ) ) ( not ( = ?auto_10284 ?auto_10304 ) ) ( not ( = ?auto_10284 ?auto_10295 ) ) ( not ( = ?auto_10284 ?auto_10307 ) ) ( not ( = ?auto_10284 ?auto_10298 ) ) ( not ( = ?auto_10284 ?auto_10314 ) ) ( not ( = ?auto_10297 ?auto_10312 ) ) ( not ( = ?auto_10297 ?auto_10306 ) ) ( not ( = ?auto_10297 ?auto_10305 ) ) ( not ( = ?auto_10297 ?auto_10308 ) ) ( not ( = ?auto_10297 ?auto_10311 ) ) ( not ( = ?auto_10297 ?auto_10288 ) ) ( not ( = ?auto_10297 ?auto_10302 ) ) ( not ( = ?auto_10309 ?auto_10301 ) ) ( not ( = ?auto_10309 ?auto_10292 ) ) ( not ( = ?auto_10309 ?auto_10294 ) ) ( not ( = ?auto_10309 ?auto_10299 ) ) ( not ( = ?auto_10309 ?auto_10303 ) ) ( not ( = ?auto_10309 ?auto_10290 ) ) ( not ( = ?auto_10309 ?auto_10293 ) ) ( not ( = ?auto_10296 ?auto_10300 ) ) ( not ( = ?auto_10296 ?auto_10313 ) ) ( not ( = ?auto_10296 ?auto_10310 ) ) ( not ( = ?auto_10296 ?auto_10304 ) ) ( not ( = ?auto_10296 ?auto_10295 ) ) ( not ( = ?auto_10296 ?auto_10307 ) ) ( not ( = ?auto_10296 ?auto_10298 ) ) ( not ( = ?auto_10296 ?auto_10314 ) ) ( not ( = ?auto_10275 ?auto_10285 ) ) ( not ( = ?auto_10275 ?auto_10291 ) ) ( not ( = ?auto_10276 ?auto_10285 ) ) ( not ( = ?auto_10276 ?auto_10291 ) ) ( not ( = ?auto_10277 ?auto_10285 ) ) ( not ( = ?auto_10277 ?auto_10291 ) ) ( not ( = ?auto_10278 ?auto_10285 ) ) ( not ( = ?auto_10278 ?auto_10291 ) ) ( not ( = ?auto_10279 ?auto_10285 ) ) ( not ( = ?auto_10279 ?auto_10291 ) ) ( not ( = ?auto_10280 ?auto_10285 ) ) ( not ( = ?auto_10280 ?auto_10291 ) ) ( not ( = ?auto_10281 ?auto_10285 ) ) ( not ( = ?auto_10281 ?auto_10291 ) ) ( not ( = ?auto_10282 ?auto_10285 ) ) ( not ( = ?auto_10282 ?auto_10291 ) ) ( not ( = ?auto_10283 ?auto_10285 ) ) ( not ( = ?auto_10283 ?auto_10291 ) ) ( not ( = ?auto_10285 ?auto_10296 ) ) ( not ( = ?auto_10285 ?auto_10300 ) ) ( not ( = ?auto_10285 ?auto_10313 ) ) ( not ( = ?auto_10285 ?auto_10310 ) ) ( not ( = ?auto_10285 ?auto_10304 ) ) ( not ( = ?auto_10285 ?auto_10295 ) ) ( not ( = ?auto_10285 ?auto_10307 ) ) ( not ( = ?auto_10285 ?auto_10298 ) ) ( not ( = ?auto_10285 ?auto_10314 ) ) ( not ( = ?auto_10291 ?auto_10296 ) ) ( not ( = ?auto_10291 ?auto_10300 ) ) ( not ( = ?auto_10291 ?auto_10313 ) ) ( not ( = ?auto_10291 ?auto_10310 ) ) ( not ( = ?auto_10291 ?auto_10304 ) ) ( not ( = ?auto_10291 ?auto_10295 ) ) ( not ( = ?auto_10291 ?auto_10307 ) ) ( not ( = ?auto_10291 ?auto_10298 ) ) ( not ( = ?auto_10291 ?auto_10314 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10278 ?auto_10279 ?auto_10280 ?auto_10281 ?auto_10282 ?auto_10283 ?auto_10284 )
      ( MAKE-1CRATE ?auto_10284 ?auto_10285 )
      ( MAKE-10CRATE-VERIFY ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10278 ?auto_10279 ?auto_10280 ?auto_10281 ?auto_10282 ?auto_10283 ?auto_10284 ?auto_10285 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10337 - SURFACE
      ?auto_10338 - SURFACE
      ?auto_10339 - SURFACE
      ?auto_10340 - SURFACE
      ?auto_10341 - SURFACE
      ?auto_10342 - SURFACE
      ?auto_10343 - SURFACE
      ?auto_10344 - SURFACE
      ?auto_10345 - SURFACE
      ?auto_10346 - SURFACE
      ?auto_10347 - SURFACE
      ?auto_10348 - SURFACE
    )
    :vars
    (
      ?auto_10354 - HOIST
      ?auto_10353 - PLACE
      ?auto_10349 - PLACE
      ?auto_10352 - HOIST
      ?auto_10350 - SURFACE
      ?auto_10366 - PLACE
      ?auto_10374 - HOIST
      ?auto_10355 - SURFACE
      ?auto_10360 - PLACE
      ?auto_10375 - HOIST
      ?auto_10359 - SURFACE
      ?auto_10357 - PLACE
      ?auto_10356 - HOIST
      ?auto_10358 - SURFACE
      ?auto_10377 - SURFACE
      ?auto_10361 - SURFACE
      ?auto_10370 - PLACE
      ?auto_10367 - HOIST
      ?auto_10373 - SURFACE
      ?auto_10362 - PLACE
      ?auto_10378 - HOIST
      ?auto_10363 - SURFACE
      ?auto_10376 - PLACE
      ?auto_10365 - HOIST
      ?auto_10371 - SURFACE
      ?auto_10369 - SURFACE
      ?auto_10368 - PLACE
      ?auto_10372 - HOIST
      ?auto_10364 - SURFACE
      ?auto_10351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10354 ?auto_10353 ) ( IS-CRATE ?auto_10348 ) ( not ( = ?auto_10349 ?auto_10353 ) ) ( HOIST-AT ?auto_10352 ?auto_10349 ) ( SURFACE-AT ?auto_10348 ?auto_10349 ) ( ON ?auto_10348 ?auto_10350 ) ( CLEAR ?auto_10348 ) ( not ( = ?auto_10347 ?auto_10348 ) ) ( not ( = ?auto_10347 ?auto_10350 ) ) ( not ( = ?auto_10348 ?auto_10350 ) ) ( not ( = ?auto_10354 ?auto_10352 ) ) ( IS-CRATE ?auto_10347 ) ( not ( = ?auto_10366 ?auto_10353 ) ) ( HOIST-AT ?auto_10374 ?auto_10366 ) ( SURFACE-AT ?auto_10347 ?auto_10366 ) ( ON ?auto_10347 ?auto_10355 ) ( CLEAR ?auto_10347 ) ( not ( = ?auto_10346 ?auto_10347 ) ) ( not ( = ?auto_10346 ?auto_10355 ) ) ( not ( = ?auto_10347 ?auto_10355 ) ) ( not ( = ?auto_10354 ?auto_10374 ) ) ( IS-CRATE ?auto_10346 ) ( not ( = ?auto_10360 ?auto_10353 ) ) ( HOIST-AT ?auto_10375 ?auto_10360 ) ( AVAILABLE ?auto_10375 ) ( SURFACE-AT ?auto_10346 ?auto_10360 ) ( ON ?auto_10346 ?auto_10359 ) ( CLEAR ?auto_10346 ) ( not ( = ?auto_10345 ?auto_10346 ) ) ( not ( = ?auto_10345 ?auto_10359 ) ) ( not ( = ?auto_10346 ?auto_10359 ) ) ( not ( = ?auto_10354 ?auto_10375 ) ) ( IS-CRATE ?auto_10345 ) ( not ( = ?auto_10357 ?auto_10353 ) ) ( HOIST-AT ?auto_10356 ?auto_10357 ) ( SURFACE-AT ?auto_10345 ?auto_10357 ) ( ON ?auto_10345 ?auto_10358 ) ( CLEAR ?auto_10345 ) ( not ( = ?auto_10344 ?auto_10345 ) ) ( not ( = ?auto_10344 ?auto_10358 ) ) ( not ( = ?auto_10345 ?auto_10358 ) ) ( not ( = ?auto_10354 ?auto_10356 ) ) ( IS-CRATE ?auto_10344 ) ( AVAILABLE ?auto_10352 ) ( SURFACE-AT ?auto_10344 ?auto_10349 ) ( ON ?auto_10344 ?auto_10377 ) ( CLEAR ?auto_10344 ) ( not ( = ?auto_10343 ?auto_10344 ) ) ( not ( = ?auto_10343 ?auto_10377 ) ) ( not ( = ?auto_10344 ?auto_10377 ) ) ( IS-CRATE ?auto_10343 ) ( AVAILABLE ?auto_10356 ) ( SURFACE-AT ?auto_10343 ?auto_10357 ) ( ON ?auto_10343 ?auto_10361 ) ( CLEAR ?auto_10343 ) ( not ( = ?auto_10342 ?auto_10343 ) ) ( not ( = ?auto_10342 ?auto_10361 ) ) ( not ( = ?auto_10343 ?auto_10361 ) ) ( IS-CRATE ?auto_10342 ) ( not ( = ?auto_10370 ?auto_10353 ) ) ( HOIST-AT ?auto_10367 ?auto_10370 ) ( AVAILABLE ?auto_10367 ) ( SURFACE-AT ?auto_10342 ?auto_10370 ) ( ON ?auto_10342 ?auto_10373 ) ( CLEAR ?auto_10342 ) ( not ( = ?auto_10341 ?auto_10342 ) ) ( not ( = ?auto_10341 ?auto_10373 ) ) ( not ( = ?auto_10342 ?auto_10373 ) ) ( not ( = ?auto_10354 ?auto_10367 ) ) ( IS-CRATE ?auto_10341 ) ( not ( = ?auto_10362 ?auto_10353 ) ) ( HOIST-AT ?auto_10378 ?auto_10362 ) ( AVAILABLE ?auto_10378 ) ( SURFACE-AT ?auto_10341 ?auto_10362 ) ( ON ?auto_10341 ?auto_10363 ) ( CLEAR ?auto_10341 ) ( not ( = ?auto_10340 ?auto_10341 ) ) ( not ( = ?auto_10340 ?auto_10363 ) ) ( not ( = ?auto_10341 ?auto_10363 ) ) ( not ( = ?auto_10354 ?auto_10378 ) ) ( IS-CRATE ?auto_10340 ) ( not ( = ?auto_10376 ?auto_10353 ) ) ( HOIST-AT ?auto_10365 ?auto_10376 ) ( AVAILABLE ?auto_10365 ) ( SURFACE-AT ?auto_10340 ?auto_10376 ) ( ON ?auto_10340 ?auto_10371 ) ( CLEAR ?auto_10340 ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( not ( = ?auto_10339 ?auto_10371 ) ) ( not ( = ?auto_10340 ?auto_10371 ) ) ( not ( = ?auto_10354 ?auto_10365 ) ) ( IS-CRATE ?auto_10339 ) ( AVAILABLE ?auto_10374 ) ( SURFACE-AT ?auto_10339 ?auto_10366 ) ( ON ?auto_10339 ?auto_10369 ) ( CLEAR ?auto_10339 ) ( not ( = ?auto_10338 ?auto_10339 ) ) ( not ( = ?auto_10338 ?auto_10369 ) ) ( not ( = ?auto_10339 ?auto_10369 ) ) ( SURFACE-AT ?auto_10337 ?auto_10353 ) ( CLEAR ?auto_10337 ) ( IS-CRATE ?auto_10338 ) ( AVAILABLE ?auto_10354 ) ( not ( = ?auto_10368 ?auto_10353 ) ) ( HOIST-AT ?auto_10372 ?auto_10368 ) ( AVAILABLE ?auto_10372 ) ( SURFACE-AT ?auto_10338 ?auto_10368 ) ( ON ?auto_10338 ?auto_10364 ) ( CLEAR ?auto_10338 ) ( TRUCK-AT ?auto_10351 ?auto_10353 ) ( not ( = ?auto_10337 ?auto_10338 ) ) ( not ( = ?auto_10337 ?auto_10364 ) ) ( not ( = ?auto_10338 ?auto_10364 ) ) ( not ( = ?auto_10354 ?auto_10372 ) ) ( not ( = ?auto_10337 ?auto_10339 ) ) ( not ( = ?auto_10337 ?auto_10369 ) ) ( not ( = ?auto_10339 ?auto_10364 ) ) ( not ( = ?auto_10366 ?auto_10368 ) ) ( not ( = ?auto_10374 ?auto_10372 ) ) ( not ( = ?auto_10369 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10340 ) ) ( not ( = ?auto_10337 ?auto_10371 ) ) ( not ( = ?auto_10338 ?auto_10340 ) ) ( not ( = ?auto_10338 ?auto_10371 ) ) ( not ( = ?auto_10340 ?auto_10369 ) ) ( not ( = ?auto_10340 ?auto_10364 ) ) ( not ( = ?auto_10376 ?auto_10366 ) ) ( not ( = ?auto_10376 ?auto_10368 ) ) ( not ( = ?auto_10365 ?auto_10374 ) ) ( not ( = ?auto_10365 ?auto_10372 ) ) ( not ( = ?auto_10371 ?auto_10369 ) ) ( not ( = ?auto_10371 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10341 ) ) ( not ( = ?auto_10337 ?auto_10363 ) ) ( not ( = ?auto_10338 ?auto_10341 ) ) ( not ( = ?auto_10338 ?auto_10363 ) ) ( not ( = ?auto_10339 ?auto_10341 ) ) ( not ( = ?auto_10339 ?auto_10363 ) ) ( not ( = ?auto_10341 ?auto_10371 ) ) ( not ( = ?auto_10341 ?auto_10369 ) ) ( not ( = ?auto_10341 ?auto_10364 ) ) ( not ( = ?auto_10362 ?auto_10376 ) ) ( not ( = ?auto_10362 ?auto_10366 ) ) ( not ( = ?auto_10362 ?auto_10368 ) ) ( not ( = ?auto_10378 ?auto_10365 ) ) ( not ( = ?auto_10378 ?auto_10374 ) ) ( not ( = ?auto_10378 ?auto_10372 ) ) ( not ( = ?auto_10363 ?auto_10371 ) ) ( not ( = ?auto_10363 ?auto_10369 ) ) ( not ( = ?auto_10363 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10342 ) ) ( not ( = ?auto_10337 ?auto_10373 ) ) ( not ( = ?auto_10338 ?auto_10342 ) ) ( not ( = ?auto_10338 ?auto_10373 ) ) ( not ( = ?auto_10339 ?auto_10342 ) ) ( not ( = ?auto_10339 ?auto_10373 ) ) ( not ( = ?auto_10340 ?auto_10342 ) ) ( not ( = ?auto_10340 ?auto_10373 ) ) ( not ( = ?auto_10342 ?auto_10363 ) ) ( not ( = ?auto_10342 ?auto_10371 ) ) ( not ( = ?auto_10342 ?auto_10369 ) ) ( not ( = ?auto_10342 ?auto_10364 ) ) ( not ( = ?auto_10370 ?auto_10362 ) ) ( not ( = ?auto_10370 ?auto_10376 ) ) ( not ( = ?auto_10370 ?auto_10366 ) ) ( not ( = ?auto_10370 ?auto_10368 ) ) ( not ( = ?auto_10367 ?auto_10378 ) ) ( not ( = ?auto_10367 ?auto_10365 ) ) ( not ( = ?auto_10367 ?auto_10374 ) ) ( not ( = ?auto_10367 ?auto_10372 ) ) ( not ( = ?auto_10373 ?auto_10363 ) ) ( not ( = ?auto_10373 ?auto_10371 ) ) ( not ( = ?auto_10373 ?auto_10369 ) ) ( not ( = ?auto_10373 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10343 ) ) ( not ( = ?auto_10337 ?auto_10361 ) ) ( not ( = ?auto_10338 ?auto_10343 ) ) ( not ( = ?auto_10338 ?auto_10361 ) ) ( not ( = ?auto_10339 ?auto_10343 ) ) ( not ( = ?auto_10339 ?auto_10361 ) ) ( not ( = ?auto_10340 ?auto_10343 ) ) ( not ( = ?auto_10340 ?auto_10361 ) ) ( not ( = ?auto_10341 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10361 ) ) ( not ( = ?auto_10343 ?auto_10373 ) ) ( not ( = ?auto_10343 ?auto_10363 ) ) ( not ( = ?auto_10343 ?auto_10371 ) ) ( not ( = ?auto_10343 ?auto_10369 ) ) ( not ( = ?auto_10343 ?auto_10364 ) ) ( not ( = ?auto_10357 ?auto_10370 ) ) ( not ( = ?auto_10357 ?auto_10362 ) ) ( not ( = ?auto_10357 ?auto_10376 ) ) ( not ( = ?auto_10357 ?auto_10366 ) ) ( not ( = ?auto_10357 ?auto_10368 ) ) ( not ( = ?auto_10356 ?auto_10367 ) ) ( not ( = ?auto_10356 ?auto_10378 ) ) ( not ( = ?auto_10356 ?auto_10365 ) ) ( not ( = ?auto_10356 ?auto_10374 ) ) ( not ( = ?auto_10356 ?auto_10372 ) ) ( not ( = ?auto_10361 ?auto_10373 ) ) ( not ( = ?auto_10361 ?auto_10363 ) ) ( not ( = ?auto_10361 ?auto_10371 ) ) ( not ( = ?auto_10361 ?auto_10369 ) ) ( not ( = ?auto_10361 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10344 ) ) ( not ( = ?auto_10337 ?auto_10377 ) ) ( not ( = ?auto_10338 ?auto_10344 ) ) ( not ( = ?auto_10338 ?auto_10377 ) ) ( not ( = ?auto_10339 ?auto_10344 ) ) ( not ( = ?auto_10339 ?auto_10377 ) ) ( not ( = ?auto_10340 ?auto_10344 ) ) ( not ( = ?auto_10340 ?auto_10377 ) ) ( not ( = ?auto_10341 ?auto_10344 ) ) ( not ( = ?auto_10341 ?auto_10377 ) ) ( not ( = ?auto_10342 ?auto_10344 ) ) ( not ( = ?auto_10342 ?auto_10377 ) ) ( not ( = ?auto_10344 ?auto_10361 ) ) ( not ( = ?auto_10344 ?auto_10373 ) ) ( not ( = ?auto_10344 ?auto_10363 ) ) ( not ( = ?auto_10344 ?auto_10371 ) ) ( not ( = ?auto_10344 ?auto_10369 ) ) ( not ( = ?auto_10344 ?auto_10364 ) ) ( not ( = ?auto_10349 ?auto_10357 ) ) ( not ( = ?auto_10349 ?auto_10370 ) ) ( not ( = ?auto_10349 ?auto_10362 ) ) ( not ( = ?auto_10349 ?auto_10376 ) ) ( not ( = ?auto_10349 ?auto_10366 ) ) ( not ( = ?auto_10349 ?auto_10368 ) ) ( not ( = ?auto_10352 ?auto_10356 ) ) ( not ( = ?auto_10352 ?auto_10367 ) ) ( not ( = ?auto_10352 ?auto_10378 ) ) ( not ( = ?auto_10352 ?auto_10365 ) ) ( not ( = ?auto_10352 ?auto_10374 ) ) ( not ( = ?auto_10352 ?auto_10372 ) ) ( not ( = ?auto_10377 ?auto_10361 ) ) ( not ( = ?auto_10377 ?auto_10373 ) ) ( not ( = ?auto_10377 ?auto_10363 ) ) ( not ( = ?auto_10377 ?auto_10371 ) ) ( not ( = ?auto_10377 ?auto_10369 ) ) ( not ( = ?auto_10377 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10345 ) ) ( not ( = ?auto_10337 ?auto_10358 ) ) ( not ( = ?auto_10338 ?auto_10345 ) ) ( not ( = ?auto_10338 ?auto_10358 ) ) ( not ( = ?auto_10339 ?auto_10345 ) ) ( not ( = ?auto_10339 ?auto_10358 ) ) ( not ( = ?auto_10340 ?auto_10345 ) ) ( not ( = ?auto_10340 ?auto_10358 ) ) ( not ( = ?auto_10341 ?auto_10345 ) ) ( not ( = ?auto_10341 ?auto_10358 ) ) ( not ( = ?auto_10342 ?auto_10345 ) ) ( not ( = ?auto_10342 ?auto_10358 ) ) ( not ( = ?auto_10343 ?auto_10345 ) ) ( not ( = ?auto_10343 ?auto_10358 ) ) ( not ( = ?auto_10345 ?auto_10377 ) ) ( not ( = ?auto_10345 ?auto_10361 ) ) ( not ( = ?auto_10345 ?auto_10373 ) ) ( not ( = ?auto_10345 ?auto_10363 ) ) ( not ( = ?auto_10345 ?auto_10371 ) ) ( not ( = ?auto_10345 ?auto_10369 ) ) ( not ( = ?auto_10345 ?auto_10364 ) ) ( not ( = ?auto_10358 ?auto_10377 ) ) ( not ( = ?auto_10358 ?auto_10361 ) ) ( not ( = ?auto_10358 ?auto_10373 ) ) ( not ( = ?auto_10358 ?auto_10363 ) ) ( not ( = ?auto_10358 ?auto_10371 ) ) ( not ( = ?auto_10358 ?auto_10369 ) ) ( not ( = ?auto_10358 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10346 ) ) ( not ( = ?auto_10337 ?auto_10359 ) ) ( not ( = ?auto_10338 ?auto_10346 ) ) ( not ( = ?auto_10338 ?auto_10359 ) ) ( not ( = ?auto_10339 ?auto_10346 ) ) ( not ( = ?auto_10339 ?auto_10359 ) ) ( not ( = ?auto_10340 ?auto_10346 ) ) ( not ( = ?auto_10340 ?auto_10359 ) ) ( not ( = ?auto_10341 ?auto_10346 ) ) ( not ( = ?auto_10341 ?auto_10359 ) ) ( not ( = ?auto_10342 ?auto_10346 ) ) ( not ( = ?auto_10342 ?auto_10359 ) ) ( not ( = ?auto_10343 ?auto_10346 ) ) ( not ( = ?auto_10343 ?auto_10359 ) ) ( not ( = ?auto_10344 ?auto_10346 ) ) ( not ( = ?auto_10344 ?auto_10359 ) ) ( not ( = ?auto_10346 ?auto_10358 ) ) ( not ( = ?auto_10346 ?auto_10377 ) ) ( not ( = ?auto_10346 ?auto_10361 ) ) ( not ( = ?auto_10346 ?auto_10373 ) ) ( not ( = ?auto_10346 ?auto_10363 ) ) ( not ( = ?auto_10346 ?auto_10371 ) ) ( not ( = ?auto_10346 ?auto_10369 ) ) ( not ( = ?auto_10346 ?auto_10364 ) ) ( not ( = ?auto_10360 ?auto_10357 ) ) ( not ( = ?auto_10360 ?auto_10349 ) ) ( not ( = ?auto_10360 ?auto_10370 ) ) ( not ( = ?auto_10360 ?auto_10362 ) ) ( not ( = ?auto_10360 ?auto_10376 ) ) ( not ( = ?auto_10360 ?auto_10366 ) ) ( not ( = ?auto_10360 ?auto_10368 ) ) ( not ( = ?auto_10375 ?auto_10356 ) ) ( not ( = ?auto_10375 ?auto_10352 ) ) ( not ( = ?auto_10375 ?auto_10367 ) ) ( not ( = ?auto_10375 ?auto_10378 ) ) ( not ( = ?auto_10375 ?auto_10365 ) ) ( not ( = ?auto_10375 ?auto_10374 ) ) ( not ( = ?auto_10375 ?auto_10372 ) ) ( not ( = ?auto_10359 ?auto_10358 ) ) ( not ( = ?auto_10359 ?auto_10377 ) ) ( not ( = ?auto_10359 ?auto_10361 ) ) ( not ( = ?auto_10359 ?auto_10373 ) ) ( not ( = ?auto_10359 ?auto_10363 ) ) ( not ( = ?auto_10359 ?auto_10371 ) ) ( not ( = ?auto_10359 ?auto_10369 ) ) ( not ( = ?auto_10359 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10347 ) ) ( not ( = ?auto_10337 ?auto_10355 ) ) ( not ( = ?auto_10338 ?auto_10347 ) ) ( not ( = ?auto_10338 ?auto_10355 ) ) ( not ( = ?auto_10339 ?auto_10347 ) ) ( not ( = ?auto_10339 ?auto_10355 ) ) ( not ( = ?auto_10340 ?auto_10347 ) ) ( not ( = ?auto_10340 ?auto_10355 ) ) ( not ( = ?auto_10341 ?auto_10347 ) ) ( not ( = ?auto_10341 ?auto_10355 ) ) ( not ( = ?auto_10342 ?auto_10347 ) ) ( not ( = ?auto_10342 ?auto_10355 ) ) ( not ( = ?auto_10343 ?auto_10347 ) ) ( not ( = ?auto_10343 ?auto_10355 ) ) ( not ( = ?auto_10344 ?auto_10347 ) ) ( not ( = ?auto_10344 ?auto_10355 ) ) ( not ( = ?auto_10345 ?auto_10347 ) ) ( not ( = ?auto_10345 ?auto_10355 ) ) ( not ( = ?auto_10347 ?auto_10359 ) ) ( not ( = ?auto_10347 ?auto_10358 ) ) ( not ( = ?auto_10347 ?auto_10377 ) ) ( not ( = ?auto_10347 ?auto_10361 ) ) ( not ( = ?auto_10347 ?auto_10373 ) ) ( not ( = ?auto_10347 ?auto_10363 ) ) ( not ( = ?auto_10347 ?auto_10371 ) ) ( not ( = ?auto_10347 ?auto_10369 ) ) ( not ( = ?auto_10347 ?auto_10364 ) ) ( not ( = ?auto_10355 ?auto_10359 ) ) ( not ( = ?auto_10355 ?auto_10358 ) ) ( not ( = ?auto_10355 ?auto_10377 ) ) ( not ( = ?auto_10355 ?auto_10361 ) ) ( not ( = ?auto_10355 ?auto_10373 ) ) ( not ( = ?auto_10355 ?auto_10363 ) ) ( not ( = ?auto_10355 ?auto_10371 ) ) ( not ( = ?auto_10355 ?auto_10369 ) ) ( not ( = ?auto_10355 ?auto_10364 ) ) ( not ( = ?auto_10337 ?auto_10348 ) ) ( not ( = ?auto_10337 ?auto_10350 ) ) ( not ( = ?auto_10338 ?auto_10348 ) ) ( not ( = ?auto_10338 ?auto_10350 ) ) ( not ( = ?auto_10339 ?auto_10348 ) ) ( not ( = ?auto_10339 ?auto_10350 ) ) ( not ( = ?auto_10340 ?auto_10348 ) ) ( not ( = ?auto_10340 ?auto_10350 ) ) ( not ( = ?auto_10341 ?auto_10348 ) ) ( not ( = ?auto_10341 ?auto_10350 ) ) ( not ( = ?auto_10342 ?auto_10348 ) ) ( not ( = ?auto_10342 ?auto_10350 ) ) ( not ( = ?auto_10343 ?auto_10348 ) ) ( not ( = ?auto_10343 ?auto_10350 ) ) ( not ( = ?auto_10344 ?auto_10348 ) ) ( not ( = ?auto_10344 ?auto_10350 ) ) ( not ( = ?auto_10345 ?auto_10348 ) ) ( not ( = ?auto_10345 ?auto_10350 ) ) ( not ( = ?auto_10346 ?auto_10348 ) ) ( not ( = ?auto_10346 ?auto_10350 ) ) ( not ( = ?auto_10348 ?auto_10355 ) ) ( not ( = ?auto_10348 ?auto_10359 ) ) ( not ( = ?auto_10348 ?auto_10358 ) ) ( not ( = ?auto_10348 ?auto_10377 ) ) ( not ( = ?auto_10348 ?auto_10361 ) ) ( not ( = ?auto_10348 ?auto_10373 ) ) ( not ( = ?auto_10348 ?auto_10363 ) ) ( not ( = ?auto_10348 ?auto_10371 ) ) ( not ( = ?auto_10348 ?auto_10369 ) ) ( not ( = ?auto_10348 ?auto_10364 ) ) ( not ( = ?auto_10350 ?auto_10355 ) ) ( not ( = ?auto_10350 ?auto_10359 ) ) ( not ( = ?auto_10350 ?auto_10358 ) ) ( not ( = ?auto_10350 ?auto_10377 ) ) ( not ( = ?auto_10350 ?auto_10361 ) ) ( not ( = ?auto_10350 ?auto_10373 ) ) ( not ( = ?auto_10350 ?auto_10363 ) ) ( not ( = ?auto_10350 ?auto_10371 ) ) ( not ( = ?auto_10350 ?auto_10369 ) ) ( not ( = ?auto_10350 ?auto_10364 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10337 ?auto_10338 ?auto_10339 ?auto_10340 ?auto_10341 ?auto_10342 ?auto_10343 ?auto_10344 ?auto_10345 ?auto_10346 ?auto_10347 )
      ( MAKE-1CRATE ?auto_10347 ?auto_10348 )
      ( MAKE-11CRATE-VERIFY ?auto_10337 ?auto_10338 ?auto_10339 ?auto_10340 ?auto_10341 ?auto_10342 ?auto_10343 ?auto_10344 ?auto_10345 ?auto_10346 ?auto_10347 ?auto_10348 ) )
  )

)

