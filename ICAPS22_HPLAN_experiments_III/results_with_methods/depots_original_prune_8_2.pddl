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
      ?auto_125934 - SURFACE
      ?auto_125935 - SURFACE
    )
    :vars
    (
      ?auto_125936 - HOIST
      ?auto_125937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125936 ?auto_125937 ) ( SURFACE-AT ?auto_125934 ?auto_125937 ) ( CLEAR ?auto_125934 ) ( LIFTING ?auto_125936 ?auto_125935 ) ( IS-CRATE ?auto_125935 ) ( not ( = ?auto_125934 ?auto_125935 ) ) )
    :subtasks
    ( ( !DROP ?auto_125936 ?auto_125935 ?auto_125934 ?auto_125937 )
      ( MAKE-1CRATE-VERIFY ?auto_125934 ?auto_125935 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125938 - SURFACE
      ?auto_125939 - SURFACE
    )
    :vars
    (
      ?auto_125940 - HOIST
      ?auto_125941 - PLACE
      ?auto_125942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125940 ?auto_125941 ) ( SURFACE-AT ?auto_125938 ?auto_125941 ) ( CLEAR ?auto_125938 ) ( IS-CRATE ?auto_125939 ) ( not ( = ?auto_125938 ?auto_125939 ) ) ( TRUCK-AT ?auto_125942 ?auto_125941 ) ( AVAILABLE ?auto_125940 ) ( IN ?auto_125939 ?auto_125942 ) )
    :subtasks
    ( ( !UNLOAD ?auto_125940 ?auto_125939 ?auto_125942 ?auto_125941 )
      ( MAKE-1CRATE ?auto_125938 ?auto_125939 )
      ( MAKE-1CRATE-VERIFY ?auto_125938 ?auto_125939 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125943 - SURFACE
      ?auto_125944 - SURFACE
    )
    :vars
    (
      ?auto_125946 - HOIST
      ?auto_125945 - PLACE
      ?auto_125947 - TRUCK
      ?auto_125948 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125946 ?auto_125945 ) ( SURFACE-AT ?auto_125943 ?auto_125945 ) ( CLEAR ?auto_125943 ) ( IS-CRATE ?auto_125944 ) ( not ( = ?auto_125943 ?auto_125944 ) ) ( AVAILABLE ?auto_125946 ) ( IN ?auto_125944 ?auto_125947 ) ( TRUCK-AT ?auto_125947 ?auto_125948 ) ( not ( = ?auto_125948 ?auto_125945 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_125947 ?auto_125948 ?auto_125945 )
      ( MAKE-1CRATE ?auto_125943 ?auto_125944 )
      ( MAKE-1CRATE-VERIFY ?auto_125943 ?auto_125944 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125949 - SURFACE
      ?auto_125950 - SURFACE
    )
    :vars
    (
      ?auto_125952 - HOIST
      ?auto_125953 - PLACE
      ?auto_125954 - TRUCK
      ?auto_125951 - PLACE
      ?auto_125955 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125952 ?auto_125953 ) ( SURFACE-AT ?auto_125949 ?auto_125953 ) ( CLEAR ?auto_125949 ) ( IS-CRATE ?auto_125950 ) ( not ( = ?auto_125949 ?auto_125950 ) ) ( AVAILABLE ?auto_125952 ) ( TRUCK-AT ?auto_125954 ?auto_125951 ) ( not ( = ?auto_125951 ?auto_125953 ) ) ( HOIST-AT ?auto_125955 ?auto_125951 ) ( LIFTING ?auto_125955 ?auto_125950 ) ( not ( = ?auto_125952 ?auto_125955 ) ) )
    :subtasks
    ( ( !LOAD ?auto_125955 ?auto_125950 ?auto_125954 ?auto_125951 )
      ( MAKE-1CRATE ?auto_125949 ?auto_125950 )
      ( MAKE-1CRATE-VERIFY ?auto_125949 ?auto_125950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125956 - SURFACE
      ?auto_125957 - SURFACE
    )
    :vars
    (
      ?auto_125962 - HOIST
      ?auto_125960 - PLACE
      ?auto_125961 - TRUCK
      ?auto_125959 - PLACE
      ?auto_125958 - HOIST
      ?auto_125963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125962 ?auto_125960 ) ( SURFACE-AT ?auto_125956 ?auto_125960 ) ( CLEAR ?auto_125956 ) ( IS-CRATE ?auto_125957 ) ( not ( = ?auto_125956 ?auto_125957 ) ) ( AVAILABLE ?auto_125962 ) ( TRUCK-AT ?auto_125961 ?auto_125959 ) ( not ( = ?auto_125959 ?auto_125960 ) ) ( HOIST-AT ?auto_125958 ?auto_125959 ) ( not ( = ?auto_125962 ?auto_125958 ) ) ( AVAILABLE ?auto_125958 ) ( SURFACE-AT ?auto_125957 ?auto_125959 ) ( ON ?auto_125957 ?auto_125963 ) ( CLEAR ?auto_125957 ) ( not ( = ?auto_125956 ?auto_125963 ) ) ( not ( = ?auto_125957 ?auto_125963 ) ) )
    :subtasks
    ( ( !LIFT ?auto_125958 ?auto_125957 ?auto_125963 ?auto_125959 )
      ( MAKE-1CRATE ?auto_125956 ?auto_125957 )
      ( MAKE-1CRATE-VERIFY ?auto_125956 ?auto_125957 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125964 - SURFACE
      ?auto_125965 - SURFACE
    )
    :vars
    (
      ?auto_125971 - HOIST
      ?auto_125967 - PLACE
      ?auto_125966 - PLACE
      ?auto_125969 - HOIST
      ?auto_125968 - SURFACE
      ?auto_125970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125971 ?auto_125967 ) ( SURFACE-AT ?auto_125964 ?auto_125967 ) ( CLEAR ?auto_125964 ) ( IS-CRATE ?auto_125965 ) ( not ( = ?auto_125964 ?auto_125965 ) ) ( AVAILABLE ?auto_125971 ) ( not ( = ?auto_125966 ?auto_125967 ) ) ( HOIST-AT ?auto_125969 ?auto_125966 ) ( not ( = ?auto_125971 ?auto_125969 ) ) ( AVAILABLE ?auto_125969 ) ( SURFACE-AT ?auto_125965 ?auto_125966 ) ( ON ?auto_125965 ?auto_125968 ) ( CLEAR ?auto_125965 ) ( not ( = ?auto_125964 ?auto_125968 ) ) ( not ( = ?auto_125965 ?auto_125968 ) ) ( TRUCK-AT ?auto_125970 ?auto_125967 ) )
    :subtasks
    ( ( !DRIVE ?auto_125970 ?auto_125967 ?auto_125966 )
      ( MAKE-1CRATE ?auto_125964 ?auto_125965 )
      ( MAKE-1CRATE-VERIFY ?auto_125964 ?auto_125965 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125981 - SURFACE
      ?auto_125982 - SURFACE
      ?auto_125983 - SURFACE
    )
    :vars
    (
      ?auto_125984 - HOIST
      ?auto_125985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125984 ?auto_125985 ) ( SURFACE-AT ?auto_125982 ?auto_125985 ) ( CLEAR ?auto_125982 ) ( LIFTING ?auto_125984 ?auto_125983 ) ( IS-CRATE ?auto_125983 ) ( not ( = ?auto_125982 ?auto_125983 ) ) ( ON ?auto_125982 ?auto_125981 ) ( not ( = ?auto_125981 ?auto_125982 ) ) ( not ( = ?auto_125981 ?auto_125983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125982 ?auto_125983 )
      ( MAKE-2CRATE-VERIFY ?auto_125981 ?auto_125982 ?auto_125983 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125991 - SURFACE
      ?auto_125992 - SURFACE
      ?auto_125993 - SURFACE
    )
    :vars
    (
      ?auto_125994 - HOIST
      ?auto_125995 - PLACE
      ?auto_125996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125994 ?auto_125995 ) ( SURFACE-AT ?auto_125992 ?auto_125995 ) ( CLEAR ?auto_125992 ) ( IS-CRATE ?auto_125993 ) ( not ( = ?auto_125992 ?auto_125993 ) ) ( TRUCK-AT ?auto_125996 ?auto_125995 ) ( AVAILABLE ?auto_125994 ) ( IN ?auto_125993 ?auto_125996 ) ( ON ?auto_125992 ?auto_125991 ) ( not ( = ?auto_125991 ?auto_125992 ) ) ( not ( = ?auto_125991 ?auto_125993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125992 ?auto_125993 )
      ( MAKE-2CRATE-VERIFY ?auto_125991 ?auto_125992 ?auto_125993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125997 - SURFACE
      ?auto_125998 - SURFACE
    )
    :vars
    (
      ?auto_126000 - HOIST
      ?auto_126001 - PLACE
      ?auto_126002 - TRUCK
      ?auto_125999 - SURFACE
      ?auto_126003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126000 ?auto_126001 ) ( SURFACE-AT ?auto_125997 ?auto_126001 ) ( CLEAR ?auto_125997 ) ( IS-CRATE ?auto_125998 ) ( not ( = ?auto_125997 ?auto_125998 ) ) ( AVAILABLE ?auto_126000 ) ( IN ?auto_125998 ?auto_126002 ) ( ON ?auto_125997 ?auto_125999 ) ( not ( = ?auto_125999 ?auto_125997 ) ) ( not ( = ?auto_125999 ?auto_125998 ) ) ( TRUCK-AT ?auto_126002 ?auto_126003 ) ( not ( = ?auto_126003 ?auto_126001 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_126002 ?auto_126003 ?auto_126001 )
      ( MAKE-2CRATE ?auto_125999 ?auto_125997 ?auto_125998 )
      ( MAKE-1CRATE-VERIFY ?auto_125997 ?auto_125998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126004 - SURFACE
      ?auto_126005 - SURFACE
      ?auto_126006 - SURFACE
    )
    :vars
    (
      ?auto_126007 - HOIST
      ?auto_126009 - PLACE
      ?auto_126008 - TRUCK
      ?auto_126010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126007 ?auto_126009 ) ( SURFACE-AT ?auto_126005 ?auto_126009 ) ( CLEAR ?auto_126005 ) ( IS-CRATE ?auto_126006 ) ( not ( = ?auto_126005 ?auto_126006 ) ) ( AVAILABLE ?auto_126007 ) ( IN ?auto_126006 ?auto_126008 ) ( ON ?auto_126005 ?auto_126004 ) ( not ( = ?auto_126004 ?auto_126005 ) ) ( not ( = ?auto_126004 ?auto_126006 ) ) ( TRUCK-AT ?auto_126008 ?auto_126010 ) ( not ( = ?auto_126010 ?auto_126009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126005 ?auto_126006 )
      ( MAKE-2CRATE-VERIFY ?auto_126004 ?auto_126005 ?auto_126006 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126011 - SURFACE
      ?auto_126012 - SURFACE
    )
    :vars
    (
      ?auto_126013 - HOIST
      ?auto_126015 - PLACE
      ?auto_126014 - SURFACE
      ?auto_126017 - TRUCK
      ?auto_126016 - PLACE
      ?auto_126018 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126013 ?auto_126015 ) ( SURFACE-AT ?auto_126011 ?auto_126015 ) ( CLEAR ?auto_126011 ) ( IS-CRATE ?auto_126012 ) ( not ( = ?auto_126011 ?auto_126012 ) ) ( AVAILABLE ?auto_126013 ) ( ON ?auto_126011 ?auto_126014 ) ( not ( = ?auto_126014 ?auto_126011 ) ) ( not ( = ?auto_126014 ?auto_126012 ) ) ( TRUCK-AT ?auto_126017 ?auto_126016 ) ( not ( = ?auto_126016 ?auto_126015 ) ) ( HOIST-AT ?auto_126018 ?auto_126016 ) ( LIFTING ?auto_126018 ?auto_126012 ) ( not ( = ?auto_126013 ?auto_126018 ) ) )
    :subtasks
    ( ( !LOAD ?auto_126018 ?auto_126012 ?auto_126017 ?auto_126016 )
      ( MAKE-2CRATE ?auto_126014 ?auto_126011 ?auto_126012 )
      ( MAKE-1CRATE-VERIFY ?auto_126011 ?auto_126012 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126019 - SURFACE
      ?auto_126020 - SURFACE
      ?auto_126021 - SURFACE
    )
    :vars
    (
      ?auto_126023 - HOIST
      ?auto_126025 - PLACE
      ?auto_126022 - TRUCK
      ?auto_126024 - PLACE
      ?auto_126026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126023 ?auto_126025 ) ( SURFACE-AT ?auto_126020 ?auto_126025 ) ( CLEAR ?auto_126020 ) ( IS-CRATE ?auto_126021 ) ( not ( = ?auto_126020 ?auto_126021 ) ) ( AVAILABLE ?auto_126023 ) ( ON ?auto_126020 ?auto_126019 ) ( not ( = ?auto_126019 ?auto_126020 ) ) ( not ( = ?auto_126019 ?auto_126021 ) ) ( TRUCK-AT ?auto_126022 ?auto_126024 ) ( not ( = ?auto_126024 ?auto_126025 ) ) ( HOIST-AT ?auto_126026 ?auto_126024 ) ( LIFTING ?auto_126026 ?auto_126021 ) ( not ( = ?auto_126023 ?auto_126026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126020 ?auto_126021 )
      ( MAKE-2CRATE-VERIFY ?auto_126019 ?auto_126020 ?auto_126021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126027 - SURFACE
      ?auto_126028 - SURFACE
    )
    :vars
    (
      ?auto_126031 - HOIST
      ?auto_126030 - PLACE
      ?auto_126032 - SURFACE
      ?auto_126034 - TRUCK
      ?auto_126029 - PLACE
      ?auto_126033 - HOIST
      ?auto_126035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126031 ?auto_126030 ) ( SURFACE-AT ?auto_126027 ?auto_126030 ) ( CLEAR ?auto_126027 ) ( IS-CRATE ?auto_126028 ) ( not ( = ?auto_126027 ?auto_126028 ) ) ( AVAILABLE ?auto_126031 ) ( ON ?auto_126027 ?auto_126032 ) ( not ( = ?auto_126032 ?auto_126027 ) ) ( not ( = ?auto_126032 ?auto_126028 ) ) ( TRUCK-AT ?auto_126034 ?auto_126029 ) ( not ( = ?auto_126029 ?auto_126030 ) ) ( HOIST-AT ?auto_126033 ?auto_126029 ) ( not ( = ?auto_126031 ?auto_126033 ) ) ( AVAILABLE ?auto_126033 ) ( SURFACE-AT ?auto_126028 ?auto_126029 ) ( ON ?auto_126028 ?auto_126035 ) ( CLEAR ?auto_126028 ) ( not ( = ?auto_126027 ?auto_126035 ) ) ( not ( = ?auto_126028 ?auto_126035 ) ) ( not ( = ?auto_126032 ?auto_126035 ) ) )
    :subtasks
    ( ( !LIFT ?auto_126033 ?auto_126028 ?auto_126035 ?auto_126029 )
      ( MAKE-2CRATE ?auto_126032 ?auto_126027 ?auto_126028 )
      ( MAKE-1CRATE-VERIFY ?auto_126027 ?auto_126028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126036 - SURFACE
      ?auto_126037 - SURFACE
      ?auto_126038 - SURFACE
    )
    :vars
    (
      ?auto_126044 - HOIST
      ?auto_126040 - PLACE
      ?auto_126039 - TRUCK
      ?auto_126042 - PLACE
      ?auto_126043 - HOIST
      ?auto_126041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126044 ?auto_126040 ) ( SURFACE-AT ?auto_126037 ?auto_126040 ) ( CLEAR ?auto_126037 ) ( IS-CRATE ?auto_126038 ) ( not ( = ?auto_126037 ?auto_126038 ) ) ( AVAILABLE ?auto_126044 ) ( ON ?auto_126037 ?auto_126036 ) ( not ( = ?auto_126036 ?auto_126037 ) ) ( not ( = ?auto_126036 ?auto_126038 ) ) ( TRUCK-AT ?auto_126039 ?auto_126042 ) ( not ( = ?auto_126042 ?auto_126040 ) ) ( HOIST-AT ?auto_126043 ?auto_126042 ) ( not ( = ?auto_126044 ?auto_126043 ) ) ( AVAILABLE ?auto_126043 ) ( SURFACE-AT ?auto_126038 ?auto_126042 ) ( ON ?auto_126038 ?auto_126041 ) ( CLEAR ?auto_126038 ) ( not ( = ?auto_126037 ?auto_126041 ) ) ( not ( = ?auto_126038 ?auto_126041 ) ) ( not ( = ?auto_126036 ?auto_126041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126037 ?auto_126038 )
      ( MAKE-2CRATE-VERIFY ?auto_126036 ?auto_126037 ?auto_126038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126045 - SURFACE
      ?auto_126046 - SURFACE
    )
    :vars
    (
      ?auto_126047 - HOIST
      ?auto_126051 - PLACE
      ?auto_126053 - SURFACE
      ?auto_126049 - PLACE
      ?auto_126048 - HOIST
      ?auto_126050 - SURFACE
      ?auto_126052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126047 ?auto_126051 ) ( SURFACE-AT ?auto_126045 ?auto_126051 ) ( CLEAR ?auto_126045 ) ( IS-CRATE ?auto_126046 ) ( not ( = ?auto_126045 ?auto_126046 ) ) ( AVAILABLE ?auto_126047 ) ( ON ?auto_126045 ?auto_126053 ) ( not ( = ?auto_126053 ?auto_126045 ) ) ( not ( = ?auto_126053 ?auto_126046 ) ) ( not ( = ?auto_126049 ?auto_126051 ) ) ( HOIST-AT ?auto_126048 ?auto_126049 ) ( not ( = ?auto_126047 ?auto_126048 ) ) ( AVAILABLE ?auto_126048 ) ( SURFACE-AT ?auto_126046 ?auto_126049 ) ( ON ?auto_126046 ?auto_126050 ) ( CLEAR ?auto_126046 ) ( not ( = ?auto_126045 ?auto_126050 ) ) ( not ( = ?auto_126046 ?auto_126050 ) ) ( not ( = ?auto_126053 ?auto_126050 ) ) ( TRUCK-AT ?auto_126052 ?auto_126051 ) )
    :subtasks
    ( ( !DRIVE ?auto_126052 ?auto_126051 ?auto_126049 )
      ( MAKE-2CRATE ?auto_126053 ?auto_126045 ?auto_126046 )
      ( MAKE-1CRATE-VERIFY ?auto_126045 ?auto_126046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126054 - SURFACE
      ?auto_126055 - SURFACE
      ?auto_126056 - SURFACE
    )
    :vars
    (
      ?auto_126060 - HOIST
      ?auto_126058 - PLACE
      ?auto_126061 - PLACE
      ?auto_126059 - HOIST
      ?auto_126062 - SURFACE
      ?auto_126057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126060 ?auto_126058 ) ( SURFACE-AT ?auto_126055 ?auto_126058 ) ( CLEAR ?auto_126055 ) ( IS-CRATE ?auto_126056 ) ( not ( = ?auto_126055 ?auto_126056 ) ) ( AVAILABLE ?auto_126060 ) ( ON ?auto_126055 ?auto_126054 ) ( not ( = ?auto_126054 ?auto_126055 ) ) ( not ( = ?auto_126054 ?auto_126056 ) ) ( not ( = ?auto_126061 ?auto_126058 ) ) ( HOIST-AT ?auto_126059 ?auto_126061 ) ( not ( = ?auto_126060 ?auto_126059 ) ) ( AVAILABLE ?auto_126059 ) ( SURFACE-AT ?auto_126056 ?auto_126061 ) ( ON ?auto_126056 ?auto_126062 ) ( CLEAR ?auto_126056 ) ( not ( = ?auto_126055 ?auto_126062 ) ) ( not ( = ?auto_126056 ?auto_126062 ) ) ( not ( = ?auto_126054 ?auto_126062 ) ) ( TRUCK-AT ?auto_126057 ?auto_126058 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126055 ?auto_126056 )
      ( MAKE-2CRATE-VERIFY ?auto_126054 ?auto_126055 ?auto_126056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126063 - SURFACE
      ?auto_126064 - SURFACE
    )
    :vars
    (
      ?auto_126067 - HOIST
      ?auto_126070 - PLACE
      ?auto_126066 - SURFACE
      ?auto_126071 - PLACE
      ?auto_126069 - HOIST
      ?auto_126068 - SURFACE
      ?auto_126065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126067 ?auto_126070 ) ( IS-CRATE ?auto_126064 ) ( not ( = ?auto_126063 ?auto_126064 ) ) ( not ( = ?auto_126066 ?auto_126063 ) ) ( not ( = ?auto_126066 ?auto_126064 ) ) ( not ( = ?auto_126071 ?auto_126070 ) ) ( HOIST-AT ?auto_126069 ?auto_126071 ) ( not ( = ?auto_126067 ?auto_126069 ) ) ( AVAILABLE ?auto_126069 ) ( SURFACE-AT ?auto_126064 ?auto_126071 ) ( ON ?auto_126064 ?auto_126068 ) ( CLEAR ?auto_126064 ) ( not ( = ?auto_126063 ?auto_126068 ) ) ( not ( = ?auto_126064 ?auto_126068 ) ) ( not ( = ?auto_126066 ?auto_126068 ) ) ( TRUCK-AT ?auto_126065 ?auto_126070 ) ( SURFACE-AT ?auto_126066 ?auto_126070 ) ( CLEAR ?auto_126066 ) ( LIFTING ?auto_126067 ?auto_126063 ) ( IS-CRATE ?auto_126063 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126066 ?auto_126063 )
      ( MAKE-2CRATE ?auto_126066 ?auto_126063 ?auto_126064 )
      ( MAKE-1CRATE-VERIFY ?auto_126063 ?auto_126064 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126072 - SURFACE
      ?auto_126073 - SURFACE
      ?auto_126074 - SURFACE
    )
    :vars
    (
      ?auto_126076 - HOIST
      ?auto_126075 - PLACE
      ?auto_126077 - PLACE
      ?auto_126080 - HOIST
      ?auto_126078 - SURFACE
      ?auto_126079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126076 ?auto_126075 ) ( IS-CRATE ?auto_126074 ) ( not ( = ?auto_126073 ?auto_126074 ) ) ( not ( = ?auto_126072 ?auto_126073 ) ) ( not ( = ?auto_126072 ?auto_126074 ) ) ( not ( = ?auto_126077 ?auto_126075 ) ) ( HOIST-AT ?auto_126080 ?auto_126077 ) ( not ( = ?auto_126076 ?auto_126080 ) ) ( AVAILABLE ?auto_126080 ) ( SURFACE-AT ?auto_126074 ?auto_126077 ) ( ON ?auto_126074 ?auto_126078 ) ( CLEAR ?auto_126074 ) ( not ( = ?auto_126073 ?auto_126078 ) ) ( not ( = ?auto_126074 ?auto_126078 ) ) ( not ( = ?auto_126072 ?auto_126078 ) ) ( TRUCK-AT ?auto_126079 ?auto_126075 ) ( SURFACE-AT ?auto_126072 ?auto_126075 ) ( CLEAR ?auto_126072 ) ( LIFTING ?auto_126076 ?auto_126073 ) ( IS-CRATE ?auto_126073 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126073 ?auto_126074 )
      ( MAKE-2CRATE-VERIFY ?auto_126072 ?auto_126073 ?auto_126074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126081 - SURFACE
      ?auto_126082 - SURFACE
    )
    :vars
    (
      ?auto_126084 - HOIST
      ?auto_126087 - PLACE
      ?auto_126088 - SURFACE
      ?auto_126085 - PLACE
      ?auto_126083 - HOIST
      ?auto_126086 - SURFACE
      ?auto_126089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126084 ?auto_126087 ) ( IS-CRATE ?auto_126082 ) ( not ( = ?auto_126081 ?auto_126082 ) ) ( not ( = ?auto_126088 ?auto_126081 ) ) ( not ( = ?auto_126088 ?auto_126082 ) ) ( not ( = ?auto_126085 ?auto_126087 ) ) ( HOIST-AT ?auto_126083 ?auto_126085 ) ( not ( = ?auto_126084 ?auto_126083 ) ) ( AVAILABLE ?auto_126083 ) ( SURFACE-AT ?auto_126082 ?auto_126085 ) ( ON ?auto_126082 ?auto_126086 ) ( CLEAR ?auto_126082 ) ( not ( = ?auto_126081 ?auto_126086 ) ) ( not ( = ?auto_126082 ?auto_126086 ) ) ( not ( = ?auto_126088 ?auto_126086 ) ) ( TRUCK-AT ?auto_126089 ?auto_126087 ) ( SURFACE-AT ?auto_126088 ?auto_126087 ) ( CLEAR ?auto_126088 ) ( IS-CRATE ?auto_126081 ) ( AVAILABLE ?auto_126084 ) ( IN ?auto_126081 ?auto_126089 ) )
    :subtasks
    ( ( !UNLOAD ?auto_126084 ?auto_126081 ?auto_126089 ?auto_126087 )
      ( MAKE-2CRATE ?auto_126088 ?auto_126081 ?auto_126082 )
      ( MAKE-1CRATE-VERIFY ?auto_126081 ?auto_126082 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126090 - SURFACE
      ?auto_126091 - SURFACE
      ?auto_126092 - SURFACE
    )
    :vars
    (
      ?auto_126094 - HOIST
      ?auto_126095 - PLACE
      ?auto_126093 - PLACE
      ?auto_126096 - HOIST
      ?auto_126097 - SURFACE
      ?auto_126098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126094 ?auto_126095 ) ( IS-CRATE ?auto_126092 ) ( not ( = ?auto_126091 ?auto_126092 ) ) ( not ( = ?auto_126090 ?auto_126091 ) ) ( not ( = ?auto_126090 ?auto_126092 ) ) ( not ( = ?auto_126093 ?auto_126095 ) ) ( HOIST-AT ?auto_126096 ?auto_126093 ) ( not ( = ?auto_126094 ?auto_126096 ) ) ( AVAILABLE ?auto_126096 ) ( SURFACE-AT ?auto_126092 ?auto_126093 ) ( ON ?auto_126092 ?auto_126097 ) ( CLEAR ?auto_126092 ) ( not ( = ?auto_126091 ?auto_126097 ) ) ( not ( = ?auto_126092 ?auto_126097 ) ) ( not ( = ?auto_126090 ?auto_126097 ) ) ( TRUCK-AT ?auto_126098 ?auto_126095 ) ( SURFACE-AT ?auto_126090 ?auto_126095 ) ( CLEAR ?auto_126090 ) ( IS-CRATE ?auto_126091 ) ( AVAILABLE ?auto_126094 ) ( IN ?auto_126091 ?auto_126098 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126091 ?auto_126092 )
      ( MAKE-2CRATE-VERIFY ?auto_126090 ?auto_126091 ?auto_126092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126135 - SURFACE
      ?auto_126136 - SURFACE
    )
    :vars
    (
      ?auto_126138 - HOIST
      ?auto_126141 - PLACE
      ?auto_126142 - SURFACE
      ?auto_126137 - PLACE
      ?auto_126139 - HOIST
      ?auto_126143 - SURFACE
      ?auto_126140 - TRUCK
      ?auto_126144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126138 ?auto_126141 ) ( SURFACE-AT ?auto_126135 ?auto_126141 ) ( CLEAR ?auto_126135 ) ( IS-CRATE ?auto_126136 ) ( not ( = ?auto_126135 ?auto_126136 ) ) ( AVAILABLE ?auto_126138 ) ( ON ?auto_126135 ?auto_126142 ) ( not ( = ?auto_126142 ?auto_126135 ) ) ( not ( = ?auto_126142 ?auto_126136 ) ) ( not ( = ?auto_126137 ?auto_126141 ) ) ( HOIST-AT ?auto_126139 ?auto_126137 ) ( not ( = ?auto_126138 ?auto_126139 ) ) ( AVAILABLE ?auto_126139 ) ( SURFACE-AT ?auto_126136 ?auto_126137 ) ( ON ?auto_126136 ?auto_126143 ) ( CLEAR ?auto_126136 ) ( not ( = ?auto_126135 ?auto_126143 ) ) ( not ( = ?auto_126136 ?auto_126143 ) ) ( not ( = ?auto_126142 ?auto_126143 ) ) ( TRUCK-AT ?auto_126140 ?auto_126144 ) ( not ( = ?auto_126144 ?auto_126141 ) ) ( not ( = ?auto_126137 ?auto_126144 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_126140 ?auto_126144 ?auto_126141 )
      ( MAKE-1CRATE ?auto_126135 ?auto_126136 )
      ( MAKE-1CRATE-VERIFY ?auto_126135 ?auto_126136 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126174 - SURFACE
      ?auto_126175 - SURFACE
      ?auto_126176 - SURFACE
      ?auto_126177 - SURFACE
    )
    :vars
    (
      ?auto_126179 - HOIST
      ?auto_126178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126179 ?auto_126178 ) ( SURFACE-AT ?auto_126176 ?auto_126178 ) ( CLEAR ?auto_126176 ) ( LIFTING ?auto_126179 ?auto_126177 ) ( IS-CRATE ?auto_126177 ) ( not ( = ?auto_126176 ?auto_126177 ) ) ( ON ?auto_126175 ?auto_126174 ) ( ON ?auto_126176 ?auto_126175 ) ( not ( = ?auto_126174 ?auto_126175 ) ) ( not ( = ?auto_126174 ?auto_126176 ) ) ( not ( = ?auto_126174 ?auto_126177 ) ) ( not ( = ?auto_126175 ?auto_126176 ) ) ( not ( = ?auto_126175 ?auto_126177 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126176 ?auto_126177 )
      ( MAKE-3CRATE-VERIFY ?auto_126174 ?auto_126175 ?auto_126176 ?auto_126177 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126191 - SURFACE
      ?auto_126192 - SURFACE
      ?auto_126193 - SURFACE
      ?auto_126194 - SURFACE
    )
    :vars
    (
      ?auto_126197 - HOIST
      ?auto_126195 - PLACE
      ?auto_126196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126197 ?auto_126195 ) ( SURFACE-AT ?auto_126193 ?auto_126195 ) ( CLEAR ?auto_126193 ) ( IS-CRATE ?auto_126194 ) ( not ( = ?auto_126193 ?auto_126194 ) ) ( TRUCK-AT ?auto_126196 ?auto_126195 ) ( AVAILABLE ?auto_126197 ) ( IN ?auto_126194 ?auto_126196 ) ( ON ?auto_126193 ?auto_126192 ) ( not ( = ?auto_126192 ?auto_126193 ) ) ( not ( = ?auto_126192 ?auto_126194 ) ) ( ON ?auto_126192 ?auto_126191 ) ( not ( = ?auto_126191 ?auto_126192 ) ) ( not ( = ?auto_126191 ?auto_126193 ) ) ( not ( = ?auto_126191 ?auto_126194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126192 ?auto_126193 ?auto_126194 )
      ( MAKE-3CRATE-VERIFY ?auto_126191 ?auto_126192 ?auto_126193 ?auto_126194 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126212 - SURFACE
      ?auto_126213 - SURFACE
      ?auto_126214 - SURFACE
      ?auto_126215 - SURFACE
    )
    :vars
    (
      ?auto_126218 - HOIST
      ?auto_126217 - PLACE
      ?auto_126216 - TRUCK
      ?auto_126219 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126218 ?auto_126217 ) ( SURFACE-AT ?auto_126214 ?auto_126217 ) ( CLEAR ?auto_126214 ) ( IS-CRATE ?auto_126215 ) ( not ( = ?auto_126214 ?auto_126215 ) ) ( AVAILABLE ?auto_126218 ) ( IN ?auto_126215 ?auto_126216 ) ( ON ?auto_126214 ?auto_126213 ) ( not ( = ?auto_126213 ?auto_126214 ) ) ( not ( = ?auto_126213 ?auto_126215 ) ) ( TRUCK-AT ?auto_126216 ?auto_126219 ) ( not ( = ?auto_126219 ?auto_126217 ) ) ( ON ?auto_126213 ?auto_126212 ) ( not ( = ?auto_126212 ?auto_126213 ) ) ( not ( = ?auto_126212 ?auto_126214 ) ) ( not ( = ?auto_126212 ?auto_126215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126213 ?auto_126214 ?auto_126215 )
      ( MAKE-3CRATE-VERIFY ?auto_126212 ?auto_126213 ?auto_126214 ?auto_126215 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126236 - SURFACE
      ?auto_126237 - SURFACE
      ?auto_126238 - SURFACE
      ?auto_126239 - SURFACE
    )
    :vars
    (
      ?auto_126240 - HOIST
      ?auto_126243 - PLACE
      ?auto_126244 - TRUCK
      ?auto_126241 - PLACE
      ?auto_126242 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126240 ?auto_126243 ) ( SURFACE-AT ?auto_126238 ?auto_126243 ) ( CLEAR ?auto_126238 ) ( IS-CRATE ?auto_126239 ) ( not ( = ?auto_126238 ?auto_126239 ) ) ( AVAILABLE ?auto_126240 ) ( ON ?auto_126238 ?auto_126237 ) ( not ( = ?auto_126237 ?auto_126238 ) ) ( not ( = ?auto_126237 ?auto_126239 ) ) ( TRUCK-AT ?auto_126244 ?auto_126241 ) ( not ( = ?auto_126241 ?auto_126243 ) ) ( HOIST-AT ?auto_126242 ?auto_126241 ) ( LIFTING ?auto_126242 ?auto_126239 ) ( not ( = ?auto_126240 ?auto_126242 ) ) ( ON ?auto_126237 ?auto_126236 ) ( not ( = ?auto_126236 ?auto_126237 ) ) ( not ( = ?auto_126236 ?auto_126238 ) ) ( not ( = ?auto_126236 ?auto_126239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126237 ?auto_126238 ?auto_126239 )
      ( MAKE-3CRATE-VERIFY ?auto_126236 ?auto_126237 ?auto_126238 ?auto_126239 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126263 - SURFACE
      ?auto_126264 - SURFACE
      ?auto_126265 - SURFACE
      ?auto_126266 - SURFACE
    )
    :vars
    (
      ?auto_126271 - HOIST
      ?auto_126270 - PLACE
      ?auto_126272 - TRUCK
      ?auto_126269 - PLACE
      ?auto_126267 - HOIST
      ?auto_126268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126271 ?auto_126270 ) ( SURFACE-AT ?auto_126265 ?auto_126270 ) ( CLEAR ?auto_126265 ) ( IS-CRATE ?auto_126266 ) ( not ( = ?auto_126265 ?auto_126266 ) ) ( AVAILABLE ?auto_126271 ) ( ON ?auto_126265 ?auto_126264 ) ( not ( = ?auto_126264 ?auto_126265 ) ) ( not ( = ?auto_126264 ?auto_126266 ) ) ( TRUCK-AT ?auto_126272 ?auto_126269 ) ( not ( = ?auto_126269 ?auto_126270 ) ) ( HOIST-AT ?auto_126267 ?auto_126269 ) ( not ( = ?auto_126271 ?auto_126267 ) ) ( AVAILABLE ?auto_126267 ) ( SURFACE-AT ?auto_126266 ?auto_126269 ) ( ON ?auto_126266 ?auto_126268 ) ( CLEAR ?auto_126266 ) ( not ( = ?auto_126265 ?auto_126268 ) ) ( not ( = ?auto_126266 ?auto_126268 ) ) ( not ( = ?auto_126264 ?auto_126268 ) ) ( ON ?auto_126264 ?auto_126263 ) ( not ( = ?auto_126263 ?auto_126264 ) ) ( not ( = ?auto_126263 ?auto_126265 ) ) ( not ( = ?auto_126263 ?auto_126266 ) ) ( not ( = ?auto_126263 ?auto_126268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126264 ?auto_126265 ?auto_126266 )
      ( MAKE-3CRATE-VERIFY ?auto_126263 ?auto_126264 ?auto_126265 ?auto_126266 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126291 - SURFACE
      ?auto_126292 - SURFACE
      ?auto_126293 - SURFACE
      ?auto_126294 - SURFACE
    )
    :vars
    (
      ?auto_126300 - HOIST
      ?auto_126296 - PLACE
      ?auto_126297 - PLACE
      ?auto_126298 - HOIST
      ?auto_126299 - SURFACE
      ?auto_126295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126300 ?auto_126296 ) ( SURFACE-AT ?auto_126293 ?auto_126296 ) ( CLEAR ?auto_126293 ) ( IS-CRATE ?auto_126294 ) ( not ( = ?auto_126293 ?auto_126294 ) ) ( AVAILABLE ?auto_126300 ) ( ON ?auto_126293 ?auto_126292 ) ( not ( = ?auto_126292 ?auto_126293 ) ) ( not ( = ?auto_126292 ?auto_126294 ) ) ( not ( = ?auto_126297 ?auto_126296 ) ) ( HOIST-AT ?auto_126298 ?auto_126297 ) ( not ( = ?auto_126300 ?auto_126298 ) ) ( AVAILABLE ?auto_126298 ) ( SURFACE-AT ?auto_126294 ?auto_126297 ) ( ON ?auto_126294 ?auto_126299 ) ( CLEAR ?auto_126294 ) ( not ( = ?auto_126293 ?auto_126299 ) ) ( not ( = ?auto_126294 ?auto_126299 ) ) ( not ( = ?auto_126292 ?auto_126299 ) ) ( TRUCK-AT ?auto_126295 ?auto_126296 ) ( ON ?auto_126292 ?auto_126291 ) ( not ( = ?auto_126291 ?auto_126292 ) ) ( not ( = ?auto_126291 ?auto_126293 ) ) ( not ( = ?auto_126291 ?auto_126294 ) ) ( not ( = ?auto_126291 ?auto_126299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126292 ?auto_126293 ?auto_126294 )
      ( MAKE-3CRATE-VERIFY ?auto_126291 ?auto_126292 ?auto_126293 ?auto_126294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126319 - SURFACE
      ?auto_126320 - SURFACE
      ?auto_126321 - SURFACE
      ?auto_126322 - SURFACE
    )
    :vars
    (
      ?auto_126323 - HOIST
      ?auto_126328 - PLACE
      ?auto_126325 - PLACE
      ?auto_126324 - HOIST
      ?auto_126326 - SURFACE
      ?auto_126327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126323 ?auto_126328 ) ( IS-CRATE ?auto_126322 ) ( not ( = ?auto_126321 ?auto_126322 ) ) ( not ( = ?auto_126320 ?auto_126321 ) ) ( not ( = ?auto_126320 ?auto_126322 ) ) ( not ( = ?auto_126325 ?auto_126328 ) ) ( HOIST-AT ?auto_126324 ?auto_126325 ) ( not ( = ?auto_126323 ?auto_126324 ) ) ( AVAILABLE ?auto_126324 ) ( SURFACE-AT ?auto_126322 ?auto_126325 ) ( ON ?auto_126322 ?auto_126326 ) ( CLEAR ?auto_126322 ) ( not ( = ?auto_126321 ?auto_126326 ) ) ( not ( = ?auto_126322 ?auto_126326 ) ) ( not ( = ?auto_126320 ?auto_126326 ) ) ( TRUCK-AT ?auto_126327 ?auto_126328 ) ( SURFACE-AT ?auto_126320 ?auto_126328 ) ( CLEAR ?auto_126320 ) ( LIFTING ?auto_126323 ?auto_126321 ) ( IS-CRATE ?auto_126321 ) ( ON ?auto_126320 ?auto_126319 ) ( not ( = ?auto_126319 ?auto_126320 ) ) ( not ( = ?auto_126319 ?auto_126321 ) ) ( not ( = ?auto_126319 ?auto_126322 ) ) ( not ( = ?auto_126319 ?auto_126326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126320 ?auto_126321 ?auto_126322 )
      ( MAKE-3CRATE-VERIFY ?auto_126319 ?auto_126320 ?auto_126321 ?auto_126322 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126347 - SURFACE
      ?auto_126348 - SURFACE
      ?auto_126349 - SURFACE
      ?auto_126350 - SURFACE
    )
    :vars
    (
      ?auto_126352 - HOIST
      ?auto_126351 - PLACE
      ?auto_126355 - PLACE
      ?auto_126356 - HOIST
      ?auto_126353 - SURFACE
      ?auto_126354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126352 ?auto_126351 ) ( IS-CRATE ?auto_126350 ) ( not ( = ?auto_126349 ?auto_126350 ) ) ( not ( = ?auto_126348 ?auto_126349 ) ) ( not ( = ?auto_126348 ?auto_126350 ) ) ( not ( = ?auto_126355 ?auto_126351 ) ) ( HOIST-AT ?auto_126356 ?auto_126355 ) ( not ( = ?auto_126352 ?auto_126356 ) ) ( AVAILABLE ?auto_126356 ) ( SURFACE-AT ?auto_126350 ?auto_126355 ) ( ON ?auto_126350 ?auto_126353 ) ( CLEAR ?auto_126350 ) ( not ( = ?auto_126349 ?auto_126353 ) ) ( not ( = ?auto_126350 ?auto_126353 ) ) ( not ( = ?auto_126348 ?auto_126353 ) ) ( TRUCK-AT ?auto_126354 ?auto_126351 ) ( SURFACE-AT ?auto_126348 ?auto_126351 ) ( CLEAR ?auto_126348 ) ( IS-CRATE ?auto_126349 ) ( AVAILABLE ?auto_126352 ) ( IN ?auto_126349 ?auto_126354 ) ( ON ?auto_126348 ?auto_126347 ) ( not ( = ?auto_126347 ?auto_126348 ) ) ( not ( = ?auto_126347 ?auto_126349 ) ) ( not ( = ?auto_126347 ?auto_126350 ) ) ( not ( = ?auto_126347 ?auto_126353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126348 ?auto_126349 ?auto_126350 )
      ( MAKE-3CRATE-VERIFY ?auto_126347 ?auto_126348 ?auto_126349 ?auto_126350 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126638 - SURFACE
      ?auto_126639 - SURFACE
      ?auto_126640 - SURFACE
      ?auto_126641 - SURFACE
      ?auto_126642 - SURFACE
    )
    :vars
    (
      ?auto_126644 - HOIST
      ?auto_126643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126644 ?auto_126643 ) ( SURFACE-AT ?auto_126641 ?auto_126643 ) ( CLEAR ?auto_126641 ) ( LIFTING ?auto_126644 ?auto_126642 ) ( IS-CRATE ?auto_126642 ) ( not ( = ?auto_126641 ?auto_126642 ) ) ( ON ?auto_126639 ?auto_126638 ) ( ON ?auto_126640 ?auto_126639 ) ( ON ?auto_126641 ?auto_126640 ) ( not ( = ?auto_126638 ?auto_126639 ) ) ( not ( = ?auto_126638 ?auto_126640 ) ) ( not ( = ?auto_126638 ?auto_126641 ) ) ( not ( = ?auto_126638 ?auto_126642 ) ) ( not ( = ?auto_126639 ?auto_126640 ) ) ( not ( = ?auto_126639 ?auto_126641 ) ) ( not ( = ?auto_126639 ?auto_126642 ) ) ( not ( = ?auto_126640 ?auto_126641 ) ) ( not ( = ?auto_126640 ?auto_126642 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126641 ?auto_126642 )
      ( MAKE-4CRATE-VERIFY ?auto_126638 ?auto_126639 ?auto_126640 ?auto_126641 ?auto_126642 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126663 - SURFACE
      ?auto_126664 - SURFACE
      ?auto_126665 - SURFACE
      ?auto_126666 - SURFACE
      ?auto_126667 - SURFACE
    )
    :vars
    (
      ?auto_126668 - HOIST
      ?auto_126669 - PLACE
      ?auto_126670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126668 ?auto_126669 ) ( SURFACE-AT ?auto_126666 ?auto_126669 ) ( CLEAR ?auto_126666 ) ( IS-CRATE ?auto_126667 ) ( not ( = ?auto_126666 ?auto_126667 ) ) ( TRUCK-AT ?auto_126670 ?auto_126669 ) ( AVAILABLE ?auto_126668 ) ( IN ?auto_126667 ?auto_126670 ) ( ON ?auto_126666 ?auto_126665 ) ( not ( = ?auto_126665 ?auto_126666 ) ) ( not ( = ?auto_126665 ?auto_126667 ) ) ( ON ?auto_126664 ?auto_126663 ) ( ON ?auto_126665 ?auto_126664 ) ( not ( = ?auto_126663 ?auto_126664 ) ) ( not ( = ?auto_126663 ?auto_126665 ) ) ( not ( = ?auto_126663 ?auto_126666 ) ) ( not ( = ?auto_126663 ?auto_126667 ) ) ( not ( = ?auto_126664 ?auto_126665 ) ) ( not ( = ?auto_126664 ?auto_126666 ) ) ( not ( = ?auto_126664 ?auto_126667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126665 ?auto_126666 ?auto_126667 )
      ( MAKE-4CRATE-VERIFY ?auto_126663 ?auto_126664 ?auto_126665 ?auto_126666 ?auto_126667 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126693 - SURFACE
      ?auto_126694 - SURFACE
      ?auto_126695 - SURFACE
      ?auto_126696 - SURFACE
      ?auto_126697 - SURFACE
    )
    :vars
    (
      ?auto_126701 - HOIST
      ?auto_126700 - PLACE
      ?auto_126698 - TRUCK
      ?auto_126699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126701 ?auto_126700 ) ( SURFACE-AT ?auto_126696 ?auto_126700 ) ( CLEAR ?auto_126696 ) ( IS-CRATE ?auto_126697 ) ( not ( = ?auto_126696 ?auto_126697 ) ) ( AVAILABLE ?auto_126701 ) ( IN ?auto_126697 ?auto_126698 ) ( ON ?auto_126696 ?auto_126695 ) ( not ( = ?auto_126695 ?auto_126696 ) ) ( not ( = ?auto_126695 ?auto_126697 ) ) ( TRUCK-AT ?auto_126698 ?auto_126699 ) ( not ( = ?auto_126699 ?auto_126700 ) ) ( ON ?auto_126694 ?auto_126693 ) ( ON ?auto_126695 ?auto_126694 ) ( not ( = ?auto_126693 ?auto_126694 ) ) ( not ( = ?auto_126693 ?auto_126695 ) ) ( not ( = ?auto_126693 ?auto_126696 ) ) ( not ( = ?auto_126693 ?auto_126697 ) ) ( not ( = ?auto_126694 ?auto_126695 ) ) ( not ( = ?auto_126694 ?auto_126696 ) ) ( not ( = ?auto_126694 ?auto_126697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126695 ?auto_126696 ?auto_126697 )
      ( MAKE-4CRATE-VERIFY ?auto_126693 ?auto_126694 ?auto_126695 ?auto_126696 ?auto_126697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126727 - SURFACE
      ?auto_126728 - SURFACE
      ?auto_126729 - SURFACE
      ?auto_126730 - SURFACE
      ?auto_126731 - SURFACE
    )
    :vars
    (
      ?auto_126736 - HOIST
      ?auto_126733 - PLACE
      ?auto_126734 - TRUCK
      ?auto_126732 - PLACE
      ?auto_126735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126736 ?auto_126733 ) ( SURFACE-AT ?auto_126730 ?auto_126733 ) ( CLEAR ?auto_126730 ) ( IS-CRATE ?auto_126731 ) ( not ( = ?auto_126730 ?auto_126731 ) ) ( AVAILABLE ?auto_126736 ) ( ON ?auto_126730 ?auto_126729 ) ( not ( = ?auto_126729 ?auto_126730 ) ) ( not ( = ?auto_126729 ?auto_126731 ) ) ( TRUCK-AT ?auto_126734 ?auto_126732 ) ( not ( = ?auto_126732 ?auto_126733 ) ) ( HOIST-AT ?auto_126735 ?auto_126732 ) ( LIFTING ?auto_126735 ?auto_126731 ) ( not ( = ?auto_126736 ?auto_126735 ) ) ( ON ?auto_126728 ?auto_126727 ) ( ON ?auto_126729 ?auto_126728 ) ( not ( = ?auto_126727 ?auto_126728 ) ) ( not ( = ?auto_126727 ?auto_126729 ) ) ( not ( = ?auto_126727 ?auto_126730 ) ) ( not ( = ?auto_126727 ?auto_126731 ) ) ( not ( = ?auto_126728 ?auto_126729 ) ) ( not ( = ?auto_126728 ?auto_126730 ) ) ( not ( = ?auto_126728 ?auto_126731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126729 ?auto_126730 ?auto_126731 )
      ( MAKE-4CRATE-VERIFY ?auto_126727 ?auto_126728 ?auto_126729 ?auto_126730 ?auto_126731 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126765 - SURFACE
      ?auto_126766 - SURFACE
      ?auto_126767 - SURFACE
      ?auto_126768 - SURFACE
      ?auto_126769 - SURFACE
    )
    :vars
    (
      ?auto_126774 - HOIST
      ?auto_126771 - PLACE
      ?auto_126775 - TRUCK
      ?auto_126770 - PLACE
      ?auto_126772 - HOIST
      ?auto_126773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126774 ?auto_126771 ) ( SURFACE-AT ?auto_126768 ?auto_126771 ) ( CLEAR ?auto_126768 ) ( IS-CRATE ?auto_126769 ) ( not ( = ?auto_126768 ?auto_126769 ) ) ( AVAILABLE ?auto_126774 ) ( ON ?auto_126768 ?auto_126767 ) ( not ( = ?auto_126767 ?auto_126768 ) ) ( not ( = ?auto_126767 ?auto_126769 ) ) ( TRUCK-AT ?auto_126775 ?auto_126770 ) ( not ( = ?auto_126770 ?auto_126771 ) ) ( HOIST-AT ?auto_126772 ?auto_126770 ) ( not ( = ?auto_126774 ?auto_126772 ) ) ( AVAILABLE ?auto_126772 ) ( SURFACE-AT ?auto_126769 ?auto_126770 ) ( ON ?auto_126769 ?auto_126773 ) ( CLEAR ?auto_126769 ) ( not ( = ?auto_126768 ?auto_126773 ) ) ( not ( = ?auto_126769 ?auto_126773 ) ) ( not ( = ?auto_126767 ?auto_126773 ) ) ( ON ?auto_126766 ?auto_126765 ) ( ON ?auto_126767 ?auto_126766 ) ( not ( = ?auto_126765 ?auto_126766 ) ) ( not ( = ?auto_126765 ?auto_126767 ) ) ( not ( = ?auto_126765 ?auto_126768 ) ) ( not ( = ?auto_126765 ?auto_126769 ) ) ( not ( = ?auto_126765 ?auto_126773 ) ) ( not ( = ?auto_126766 ?auto_126767 ) ) ( not ( = ?auto_126766 ?auto_126768 ) ) ( not ( = ?auto_126766 ?auto_126769 ) ) ( not ( = ?auto_126766 ?auto_126773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126767 ?auto_126768 ?auto_126769 )
      ( MAKE-4CRATE-VERIFY ?auto_126765 ?auto_126766 ?auto_126767 ?auto_126768 ?auto_126769 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126804 - SURFACE
      ?auto_126805 - SURFACE
      ?auto_126806 - SURFACE
      ?auto_126807 - SURFACE
      ?auto_126808 - SURFACE
    )
    :vars
    (
      ?auto_126812 - HOIST
      ?auto_126814 - PLACE
      ?auto_126810 - PLACE
      ?auto_126813 - HOIST
      ?auto_126811 - SURFACE
      ?auto_126809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126812 ?auto_126814 ) ( SURFACE-AT ?auto_126807 ?auto_126814 ) ( CLEAR ?auto_126807 ) ( IS-CRATE ?auto_126808 ) ( not ( = ?auto_126807 ?auto_126808 ) ) ( AVAILABLE ?auto_126812 ) ( ON ?auto_126807 ?auto_126806 ) ( not ( = ?auto_126806 ?auto_126807 ) ) ( not ( = ?auto_126806 ?auto_126808 ) ) ( not ( = ?auto_126810 ?auto_126814 ) ) ( HOIST-AT ?auto_126813 ?auto_126810 ) ( not ( = ?auto_126812 ?auto_126813 ) ) ( AVAILABLE ?auto_126813 ) ( SURFACE-AT ?auto_126808 ?auto_126810 ) ( ON ?auto_126808 ?auto_126811 ) ( CLEAR ?auto_126808 ) ( not ( = ?auto_126807 ?auto_126811 ) ) ( not ( = ?auto_126808 ?auto_126811 ) ) ( not ( = ?auto_126806 ?auto_126811 ) ) ( TRUCK-AT ?auto_126809 ?auto_126814 ) ( ON ?auto_126805 ?auto_126804 ) ( ON ?auto_126806 ?auto_126805 ) ( not ( = ?auto_126804 ?auto_126805 ) ) ( not ( = ?auto_126804 ?auto_126806 ) ) ( not ( = ?auto_126804 ?auto_126807 ) ) ( not ( = ?auto_126804 ?auto_126808 ) ) ( not ( = ?auto_126804 ?auto_126811 ) ) ( not ( = ?auto_126805 ?auto_126806 ) ) ( not ( = ?auto_126805 ?auto_126807 ) ) ( not ( = ?auto_126805 ?auto_126808 ) ) ( not ( = ?auto_126805 ?auto_126811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126806 ?auto_126807 ?auto_126808 )
      ( MAKE-4CRATE-VERIFY ?auto_126804 ?auto_126805 ?auto_126806 ?auto_126807 ?auto_126808 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126843 - SURFACE
      ?auto_126844 - SURFACE
      ?auto_126845 - SURFACE
      ?auto_126846 - SURFACE
      ?auto_126847 - SURFACE
    )
    :vars
    (
      ?auto_126853 - HOIST
      ?auto_126848 - PLACE
      ?auto_126850 - PLACE
      ?auto_126852 - HOIST
      ?auto_126851 - SURFACE
      ?auto_126849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126853 ?auto_126848 ) ( IS-CRATE ?auto_126847 ) ( not ( = ?auto_126846 ?auto_126847 ) ) ( not ( = ?auto_126845 ?auto_126846 ) ) ( not ( = ?auto_126845 ?auto_126847 ) ) ( not ( = ?auto_126850 ?auto_126848 ) ) ( HOIST-AT ?auto_126852 ?auto_126850 ) ( not ( = ?auto_126853 ?auto_126852 ) ) ( AVAILABLE ?auto_126852 ) ( SURFACE-AT ?auto_126847 ?auto_126850 ) ( ON ?auto_126847 ?auto_126851 ) ( CLEAR ?auto_126847 ) ( not ( = ?auto_126846 ?auto_126851 ) ) ( not ( = ?auto_126847 ?auto_126851 ) ) ( not ( = ?auto_126845 ?auto_126851 ) ) ( TRUCK-AT ?auto_126849 ?auto_126848 ) ( SURFACE-AT ?auto_126845 ?auto_126848 ) ( CLEAR ?auto_126845 ) ( LIFTING ?auto_126853 ?auto_126846 ) ( IS-CRATE ?auto_126846 ) ( ON ?auto_126844 ?auto_126843 ) ( ON ?auto_126845 ?auto_126844 ) ( not ( = ?auto_126843 ?auto_126844 ) ) ( not ( = ?auto_126843 ?auto_126845 ) ) ( not ( = ?auto_126843 ?auto_126846 ) ) ( not ( = ?auto_126843 ?auto_126847 ) ) ( not ( = ?auto_126843 ?auto_126851 ) ) ( not ( = ?auto_126844 ?auto_126845 ) ) ( not ( = ?auto_126844 ?auto_126846 ) ) ( not ( = ?auto_126844 ?auto_126847 ) ) ( not ( = ?auto_126844 ?auto_126851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126845 ?auto_126846 ?auto_126847 )
      ( MAKE-4CRATE-VERIFY ?auto_126843 ?auto_126844 ?auto_126845 ?auto_126846 ?auto_126847 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126882 - SURFACE
      ?auto_126883 - SURFACE
      ?auto_126884 - SURFACE
      ?auto_126885 - SURFACE
      ?auto_126886 - SURFACE
    )
    :vars
    (
      ?auto_126887 - HOIST
      ?auto_126888 - PLACE
      ?auto_126892 - PLACE
      ?auto_126889 - HOIST
      ?auto_126890 - SURFACE
      ?auto_126891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126887 ?auto_126888 ) ( IS-CRATE ?auto_126886 ) ( not ( = ?auto_126885 ?auto_126886 ) ) ( not ( = ?auto_126884 ?auto_126885 ) ) ( not ( = ?auto_126884 ?auto_126886 ) ) ( not ( = ?auto_126892 ?auto_126888 ) ) ( HOIST-AT ?auto_126889 ?auto_126892 ) ( not ( = ?auto_126887 ?auto_126889 ) ) ( AVAILABLE ?auto_126889 ) ( SURFACE-AT ?auto_126886 ?auto_126892 ) ( ON ?auto_126886 ?auto_126890 ) ( CLEAR ?auto_126886 ) ( not ( = ?auto_126885 ?auto_126890 ) ) ( not ( = ?auto_126886 ?auto_126890 ) ) ( not ( = ?auto_126884 ?auto_126890 ) ) ( TRUCK-AT ?auto_126891 ?auto_126888 ) ( SURFACE-AT ?auto_126884 ?auto_126888 ) ( CLEAR ?auto_126884 ) ( IS-CRATE ?auto_126885 ) ( AVAILABLE ?auto_126887 ) ( IN ?auto_126885 ?auto_126891 ) ( ON ?auto_126883 ?auto_126882 ) ( ON ?auto_126884 ?auto_126883 ) ( not ( = ?auto_126882 ?auto_126883 ) ) ( not ( = ?auto_126882 ?auto_126884 ) ) ( not ( = ?auto_126882 ?auto_126885 ) ) ( not ( = ?auto_126882 ?auto_126886 ) ) ( not ( = ?auto_126882 ?auto_126890 ) ) ( not ( = ?auto_126883 ?auto_126884 ) ) ( not ( = ?auto_126883 ?auto_126885 ) ) ( not ( = ?auto_126883 ?auto_126886 ) ) ( not ( = ?auto_126883 ?auto_126890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126884 ?auto_126885 ?auto_126886 )
      ( MAKE-4CRATE-VERIFY ?auto_126882 ?auto_126883 ?auto_126884 ?auto_126885 ?auto_126886 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127542 - SURFACE
      ?auto_127543 - SURFACE
      ?auto_127544 - SURFACE
      ?auto_127545 - SURFACE
      ?auto_127546 - SURFACE
      ?auto_127547 - SURFACE
    )
    :vars
    (
      ?auto_127549 - HOIST
      ?auto_127548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127549 ?auto_127548 ) ( SURFACE-AT ?auto_127546 ?auto_127548 ) ( CLEAR ?auto_127546 ) ( LIFTING ?auto_127549 ?auto_127547 ) ( IS-CRATE ?auto_127547 ) ( not ( = ?auto_127546 ?auto_127547 ) ) ( ON ?auto_127543 ?auto_127542 ) ( ON ?auto_127544 ?auto_127543 ) ( ON ?auto_127545 ?auto_127544 ) ( ON ?auto_127546 ?auto_127545 ) ( not ( = ?auto_127542 ?auto_127543 ) ) ( not ( = ?auto_127542 ?auto_127544 ) ) ( not ( = ?auto_127542 ?auto_127545 ) ) ( not ( = ?auto_127542 ?auto_127546 ) ) ( not ( = ?auto_127542 ?auto_127547 ) ) ( not ( = ?auto_127543 ?auto_127544 ) ) ( not ( = ?auto_127543 ?auto_127545 ) ) ( not ( = ?auto_127543 ?auto_127546 ) ) ( not ( = ?auto_127543 ?auto_127547 ) ) ( not ( = ?auto_127544 ?auto_127545 ) ) ( not ( = ?auto_127544 ?auto_127546 ) ) ( not ( = ?auto_127544 ?auto_127547 ) ) ( not ( = ?auto_127545 ?auto_127546 ) ) ( not ( = ?auto_127545 ?auto_127547 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_127546 ?auto_127547 )
      ( MAKE-5CRATE-VERIFY ?auto_127542 ?auto_127543 ?auto_127544 ?auto_127545 ?auto_127546 ?auto_127547 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127576 - SURFACE
      ?auto_127577 - SURFACE
      ?auto_127578 - SURFACE
      ?auto_127579 - SURFACE
      ?auto_127580 - SURFACE
      ?auto_127581 - SURFACE
    )
    :vars
    (
      ?auto_127582 - HOIST
      ?auto_127584 - PLACE
      ?auto_127583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127582 ?auto_127584 ) ( SURFACE-AT ?auto_127580 ?auto_127584 ) ( CLEAR ?auto_127580 ) ( IS-CRATE ?auto_127581 ) ( not ( = ?auto_127580 ?auto_127581 ) ) ( TRUCK-AT ?auto_127583 ?auto_127584 ) ( AVAILABLE ?auto_127582 ) ( IN ?auto_127581 ?auto_127583 ) ( ON ?auto_127580 ?auto_127579 ) ( not ( = ?auto_127579 ?auto_127580 ) ) ( not ( = ?auto_127579 ?auto_127581 ) ) ( ON ?auto_127577 ?auto_127576 ) ( ON ?auto_127578 ?auto_127577 ) ( ON ?auto_127579 ?auto_127578 ) ( not ( = ?auto_127576 ?auto_127577 ) ) ( not ( = ?auto_127576 ?auto_127578 ) ) ( not ( = ?auto_127576 ?auto_127579 ) ) ( not ( = ?auto_127576 ?auto_127580 ) ) ( not ( = ?auto_127576 ?auto_127581 ) ) ( not ( = ?auto_127577 ?auto_127578 ) ) ( not ( = ?auto_127577 ?auto_127579 ) ) ( not ( = ?auto_127577 ?auto_127580 ) ) ( not ( = ?auto_127577 ?auto_127581 ) ) ( not ( = ?auto_127578 ?auto_127579 ) ) ( not ( = ?auto_127578 ?auto_127580 ) ) ( not ( = ?auto_127578 ?auto_127581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127579 ?auto_127580 ?auto_127581 )
      ( MAKE-5CRATE-VERIFY ?auto_127576 ?auto_127577 ?auto_127578 ?auto_127579 ?auto_127580 ?auto_127581 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127616 - SURFACE
      ?auto_127617 - SURFACE
      ?auto_127618 - SURFACE
      ?auto_127619 - SURFACE
      ?auto_127620 - SURFACE
      ?auto_127621 - SURFACE
    )
    :vars
    (
      ?auto_127622 - HOIST
      ?auto_127624 - PLACE
      ?auto_127625 - TRUCK
      ?auto_127623 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127622 ?auto_127624 ) ( SURFACE-AT ?auto_127620 ?auto_127624 ) ( CLEAR ?auto_127620 ) ( IS-CRATE ?auto_127621 ) ( not ( = ?auto_127620 ?auto_127621 ) ) ( AVAILABLE ?auto_127622 ) ( IN ?auto_127621 ?auto_127625 ) ( ON ?auto_127620 ?auto_127619 ) ( not ( = ?auto_127619 ?auto_127620 ) ) ( not ( = ?auto_127619 ?auto_127621 ) ) ( TRUCK-AT ?auto_127625 ?auto_127623 ) ( not ( = ?auto_127623 ?auto_127624 ) ) ( ON ?auto_127617 ?auto_127616 ) ( ON ?auto_127618 ?auto_127617 ) ( ON ?auto_127619 ?auto_127618 ) ( not ( = ?auto_127616 ?auto_127617 ) ) ( not ( = ?auto_127616 ?auto_127618 ) ) ( not ( = ?auto_127616 ?auto_127619 ) ) ( not ( = ?auto_127616 ?auto_127620 ) ) ( not ( = ?auto_127616 ?auto_127621 ) ) ( not ( = ?auto_127617 ?auto_127618 ) ) ( not ( = ?auto_127617 ?auto_127619 ) ) ( not ( = ?auto_127617 ?auto_127620 ) ) ( not ( = ?auto_127617 ?auto_127621 ) ) ( not ( = ?auto_127618 ?auto_127619 ) ) ( not ( = ?auto_127618 ?auto_127620 ) ) ( not ( = ?auto_127618 ?auto_127621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127619 ?auto_127620 ?auto_127621 )
      ( MAKE-5CRATE-VERIFY ?auto_127616 ?auto_127617 ?auto_127618 ?auto_127619 ?auto_127620 ?auto_127621 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127661 - SURFACE
      ?auto_127662 - SURFACE
      ?auto_127663 - SURFACE
      ?auto_127664 - SURFACE
      ?auto_127665 - SURFACE
      ?auto_127666 - SURFACE
    )
    :vars
    (
      ?auto_127670 - HOIST
      ?auto_127667 - PLACE
      ?auto_127669 - TRUCK
      ?auto_127671 - PLACE
      ?auto_127668 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_127670 ?auto_127667 ) ( SURFACE-AT ?auto_127665 ?auto_127667 ) ( CLEAR ?auto_127665 ) ( IS-CRATE ?auto_127666 ) ( not ( = ?auto_127665 ?auto_127666 ) ) ( AVAILABLE ?auto_127670 ) ( ON ?auto_127665 ?auto_127664 ) ( not ( = ?auto_127664 ?auto_127665 ) ) ( not ( = ?auto_127664 ?auto_127666 ) ) ( TRUCK-AT ?auto_127669 ?auto_127671 ) ( not ( = ?auto_127671 ?auto_127667 ) ) ( HOIST-AT ?auto_127668 ?auto_127671 ) ( LIFTING ?auto_127668 ?auto_127666 ) ( not ( = ?auto_127670 ?auto_127668 ) ) ( ON ?auto_127662 ?auto_127661 ) ( ON ?auto_127663 ?auto_127662 ) ( ON ?auto_127664 ?auto_127663 ) ( not ( = ?auto_127661 ?auto_127662 ) ) ( not ( = ?auto_127661 ?auto_127663 ) ) ( not ( = ?auto_127661 ?auto_127664 ) ) ( not ( = ?auto_127661 ?auto_127665 ) ) ( not ( = ?auto_127661 ?auto_127666 ) ) ( not ( = ?auto_127662 ?auto_127663 ) ) ( not ( = ?auto_127662 ?auto_127664 ) ) ( not ( = ?auto_127662 ?auto_127665 ) ) ( not ( = ?auto_127662 ?auto_127666 ) ) ( not ( = ?auto_127663 ?auto_127664 ) ) ( not ( = ?auto_127663 ?auto_127665 ) ) ( not ( = ?auto_127663 ?auto_127666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127664 ?auto_127665 ?auto_127666 )
      ( MAKE-5CRATE-VERIFY ?auto_127661 ?auto_127662 ?auto_127663 ?auto_127664 ?auto_127665 ?auto_127666 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127711 - SURFACE
      ?auto_127712 - SURFACE
      ?auto_127713 - SURFACE
      ?auto_127714 - SURFACE
      ?auto_127715 - SURFACE
      ?auto_127716 - SURFACE
    )
    :vars
    (
      ?auto_127722 - HOIST
      ?auto_127719 - PLACE
      ?auto_127720 - TRUCK
      ?auto_127717 - PLACE
      ?auto_127721 - HOIST
      ?auto_127718 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127722 ?auto_127719 ) ( SURFACE-AT ?auto_127715 ?auto_127719 ) ( CLEAR ?auto_127715 ) ( IS-CRATE ?auto_127716 ) ( not ( = ?auto_127715 ?auto_127716 ) ) ( AVAILABLE ?auto_127722 ) ( ON ?auto_127715 ?auto_127714 ) ( not ( = ?auto_127714 ?auto_127715 ) ) ( not ( = ?auto_127714 ?auto_127716 ) ) ( TRUCK-AT ?auto_127720 ?auto_127717 ) ( not ( = ?auto_127717 ?auto_127719 ) ) ( HOIST-AT ?auto_127721 ?auto_127717 ) ( not ( = ?auto_127722 ?auto_127721 ) ) ( AVAILABLE ?auto_127721 ) ( SURFACE-AT ?auto_127716 ?auto_127717 ) ( ON ?auto_127716 ?auto_127718 ) ( CLEAR ?auto_127716 ) ( not ( = ?auto_127715 ?auto_127718 ) ) ( not ( = ?auto_127716 ?auto_127718 ) ) ( not ( = ?auto_127714 ?auto_127718 ) ) ( ON ?auto_127712 ?auto_127711 ) ( ON ?auto_127713 ?auto_127712 ) ( ON ?auto_127714 ?auto_127713 ) ( not ( = ?auto_127711 ?auto_127712 ) ) ( not ( = ?auto_127711 ?auto_127713 ) ) ( not ( = ?auto_127711 ?auto_127714 ) ) ( not ( = ?auto_127711 ?auto_127715 ) ) ( not ( = ?auto_127711 ?auto_127716 ) ) ( not ( = ?auto_127711 ?auto_127718 ) ) ( not ( = ?auto_127712 ?auto_127713 ) ) ( not ( = ?auto_127712 ?auto_127714 ) ) ( not ( = ?auto_127712 ?auto_127715 ) ) ( not ( = ?auto_127712 ?auto_127716 ) ) ( not ( = ?auto_127712 ?auto_127718 ) ) ( not ( = ?auto_127713 ?auto_127714 ) ) ( not ( = ?auto_127713 ?auto_127715 ) ) ( not ( = ?auto_127713 ?auto_127716 ) ) ( not ( = ?auto_127713 ?auto_127718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127714 ?auto_127715 ?auto_127716 )
      ( MAKE-5CRATE-VERIFY ?auto_127711 ?auto_127712 ?auto_127713 ?auto_127714 ?auto_127715 ?auto_127716 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127762 - SURFACE
      ?auto_127763 - SURFACE
      ?auto_127764 - SURFACE
      ?auto_127765 - SURFACE
      ?auto_127766 - SURFACE
      ?auto_127767 - SURFACE
    )
    :vars
    (
      ?auto_127771 - HOIST
      ?auto_127769 - PLACE
      ?auto_127770 - PLACE
      ?auto_127772 - HOIST
      ?auto_127773 - SURFACE
      ?auto_127768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127771 ?auto_127769 ) ( SURFACE-AT ?auto_127766 ?auto_127769 ) ( CLEAR ?auto_127766 ) ( IS-CRATE ?auto_127767 ) ( not ( = ?auto_127766 ?auto_127767 ) ) ( AVAILABLE ?auto_127771 ) ( ON ?auto_127766 ?auto_127765 ) ( not ( = ?auto_127765 ?auto_127766 ) ) ( not ( = ?auto_127765 ?auto_127767 ) ) ( not ( = ?auto_127770 ?auto_127769 ) ) ( HOIST-AT ?auto_127772 ?auto_127770 ) ( not ( = ?auto_127771 ?auto_127772 ) ) ( AVAILABLE ?auto_127772 ) ( SURFACE-AT ?auto_127767 ?auto_127770 ) ( ON ?auto_127767 ?auto_127773 ) ( CLEAR ?auto_127767 ) ( not ( = ?auto_127766 ?auto_127773 ) ) ( not ( = ?auto_127767 ?auto_127773 ) ) ( not ( = ?auto_127765 ?auto_127773 ) ) ( TRUCK-AT ?auto_127768 ?auto_127769 ) ( ON ?auto_127763 ?auto_127762 ) ( ON ?auto_127764 ?auto_127763 ) ( ON ?auto_127765 ?auto_127764 ) ( not ( = ?auto_127762 ?auto_127763 ) ) ( not ( = ?auto_127762 ?auto_127764 ) ) ( not ( = ?auto_127762 ?auto_127765 ) ) ( not ( = ?auto_127762 ?auto_127766 ) ) ( not ( = ?auto_127762 ?auto_127767 ) ) ( not ( = ?auto_127762 ?auto_127773 ) ) ( not ( = ?auto_127763 ?auto_127764 ) ) ( not ( = ?auto_127763 ?auto_127765 ) ) ( not ( = ?auto_127763 ?auto_127766 ) ) ( not ( = ?auto_127763 ?auto_127767 ) ) ( not ( = ?auto_127763 ?auto_127773 ) ) ( not ( = ?auto_127764 ?auto_127765 ) ) ( not ( = ?auto_127764 ?auto_127766 ) ) ( not ( = ?auto_127764 ?auto_127767 ) ) ( not ( = ?auto_127764 ?auto_127773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127765 ?auto_127766 ?auto_127767 )
      ( MAKE-5CRATE-VERIFY ?auto_127762 ?auto_127763 ?auto_127764 ?auto_127765 ?auto_127766 ?auto_127767 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127813 - SURFACE
      ?auto_127814 - SURFACE
      ?auto_127815 - SURFACE
      ?auto_127816 - SURFACE
      ?auto_127817 - SURFACE
      ?auto_127818 - SURFACE
    )
    :vars
    (
      ?auto_127824 - HOIST
      ?auto_127820 - PLACE
      ?auto_127819 - PLACE
      ?auto_127823 - HOIST
      ?auto_127821 - SURFACE
      ?auto_127822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127824 ?auto_127820 ) ( IS-CRATE ?auto_127818 ) ( not ( = ?auto_127817 ?auto_127818 ) ) ( not ( = ?auto_127816 ?auto_127817 ) ) ( not ( = ?auto_127816 ?auto_127818 ) ) ( not ( = ?auto_127819 ?auto_127820 ) ) ( HOIST-AT ?auto_127823 ?auto_127819 ) ( not ( = ?auto_127824 ?auto_127823 ) ) ( AVAILABLE ?auto_127823 ) ( SURFACE-AT ?auto_127818 ?auto_127819 ) ( ON ?auto_127818 ?auto_127821 ) ( CLEAR ?auto_127818 ) ( not ( = ?auto_127817 ?auto_127821 ) ) ( not ( = ?auto_127818 ?auto_127821 ) ) ( not ( = ?auto_127816 ?auto_127821 ) ) ( TRUCK-AT ?auto_127822 ?auto_127820 ) ( SURFACE-AT ?auto_127816 ?auto_127820 ) ( CLEAR ?auto_127816 ) ( LIFTING ?auto_127824 ?auto_127817 ) ( IS-CRATE ?auto_127817 ) ( ON ?auto_127814 ?auto_127813 ) ( ON ?auto_127815 ?auto_127814 ) ( ON ?auto_127816 ?auto_127815 ) ( not ( = ?auto_127813 ?auto_127814 ) ) ( not ( = ?auto_127813 ?auto_127815 ) ) ( not ( = ?auto_127813 ?auto_127816 ) ) ( not ( = ?auto_127813 ?auto_127817 ) ) ( not ( = ?auto_127813 ?auto_127818 ) ) ( not ( = ?auto_127813 ?auto_127821 ) ) ( not ( = ?auto_127814 ?auto_127815 ) ) ( not ( = ?auto_127814 ?auto_127816 ) ) ( not ( = ?auto_127814 ?auto_127817 ) ) ( not ( = ?auto_127814 ?auto_127818 ) ) ( not ( = ?auto_127814 ?auto_127821 ) ) ( not ( = ?auto_127815 ?auto_127816 ) ) ( not ( = ?auto_127815 ?auto_127817 ) ) ( not ( = ?auto_127815 ?auto_127818 ) ) ( not ( = ?auto_127815 ?auto_127821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127816 ?auto_127817 ?auto_127818 )
      ( MAKE-5CRATE-VERIFY ?auto_127813 ?auto_127814 ?auto_127815 ?auto_127816 ?auto_127817 ?auto_127818 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127864 - SURFACE
      ?auto_127865 - SURFACE
      ?auto_127866 - SURFACE
      ?auto_127867 - SURFACE
      ?auto_127868 - SURFACE
      ?auto_127869 - SURFACE
    )
    :vars
    (
      ?auto_127872 - HOIST
      ?auto_127870 - PLACE
      ?auto_127871 - PLACE
      ?auto_127873 - HOIST
      ?auto_127875 - SURFACE
      ?auto_127874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127872 ?auto_127870 ) ( IS-CRATE ?auto_127869 ) ( not ( = ?auto_127868 ?auto_127869 ) ) ( not ( = ?auto_127867 ?auto_127868 ) ) ( not ( = ?auto_127867 ?auto_127869 ) ) ( not ( = ?auto_127871 ?auto_127870 ) ) ( HOIST-AT ?auto_127873 ?auto_127871 ) ( not ( = ?auto_127872 ?auto_127873 ) ) ( AVAILABLE ?auto_127873 ) ( SURFACE-AT ?auto_127869 ?auto_127871 ) ( ON ?auto_127869 ?auto_127875 ) ( CLEAR ?auto_127869 ) ( not ( = ?auto_127868 ?auto_127875 ) ) ( not ( = ?auto_127869 ?auto_127875 ) ) ( not ( = ?auto_127867 ?auto_127875 ) ) ( TRUCK-AT ?auto_127874 ?auto_127870 ) ( SURFACE-AT ?auto_127867 ?auto_127870 ) ( CLEAR ?auto_127867 ) ( IS-CRATE ?auto_127868 ) ( AVAILABLE ?auto_127872 ) ( IN ?auto_127868 ?auto_127874 ) ( ON ?auto_127865 ?auto_127864 ) ( ON ?auto_127866 ?auto_127865 ) ( ON ?auto_127867 ?auto_127866 ) ( not ( = ?auto_127864 ?auto_127865 ) ) ( not ( = ?auto_127864 ?auto_127866 ) ) ( not ( = ?auto_127864 ?auto_127867 ) ) ( not ( = ?auto_127864 ?auto_127868 ) ) ( not ( = ?auto_127864 ?auto_127869 ) ) ( not ( = ?auto_127864 ?auto_127875 ) ) ( not ( = ?auto_127865 ?auto_127866 ) ) ( not ( = ?auto_127865 ?auto_127867 ) ) ( not ( = ?auto_127865 ?auto_127868 ) ) ( not ( = ?auto_127865 ?auto_127869 ) ) ( not ( = ?auto_127865 ?auto_127875 ) ) ( not ( = ?auto_127866 ?auto_127867 ) ) ( not ( = ?auto_127866 ?auto_127868 ) ) ( not ( = ?auto_127866 ?auto_127869 ) ) ( not ( = ?auto_127866 ?auto_127875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127867 ?auto_127868 ?auto_127869 )
      ( MAKE-5CRATE-VERIFY ?auto_127864 ?auto_127865 ?auto_127866 ?auto_127867 ?auto_127868 ?auto_127869 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129073 - SURFACE
      ?auto_129074 - SURFACE
      ?auto_129075 - SURFACE
      ?auto_129076 - SURFACE
      ?auto_129077 - SURFACE
      ?auto_129078 - SURFACE
      ?auto_129079 - SURFACE
    )
    :vars
    (
      ?auto_129080 - HOIST
      ?auto_129081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129080 ?auto_129081 ) ( SURFACE-AT ?auto_129078 ?auto_129081 ) ( CLEAR ?auto_129078 ) ( LIFTING ?auto_129080 ?auto_129079 ) ( IS-CRATE ?auto_129079 ) ( not ( = ?auto_129078 ?auto_129079 ) ) ( ON ?auto_129074 ?auto_129073 ) ( ON ?auto_129075 ?auto_129074 ) ( ON ?auto_129076 ?auto_129075 ) ( ON ?auto_129077 ?auto_129076 ) ( ON ?auto_129078 ?auto_129077 ) ( not ( = ?auto_129073 ?auto_129074 ) ) ( not ( = ?auto_129073 ?auto_129075 ) ) ( not ( = ?auto_129073 ?auto_129076 ) ) ( not ( = ?auto_129073 ?auto_129077 ) ) ( not ( = ?auto_129073 ?auto_129078 ) ) ( not ( = ?auto_129073 ?auto_129079 ) ) ( not ( = ?auto_129074 ?auto_129075 ) ) ( not ( = ?auto_129074 ?auto_129076 ) ) ( not ( = ?auto_129074 ?auto_129077 ) ) ( not ( = ?auto_129074 ?auto_129078 ) ) ( not ( = ?auto_129074 ?auto_129079 ) ) ( not ( = ?auto_129075 ?auto_129076 ) ) ( not ( = ?auto_129075 ?auto_129077 ) ) ( not ( = ?auto_129075 ?auto_129078 ) ) ( not ( = ?auto_129075 ?auto_129079 ) ) ( not ( = ?auto_129076 ?auto_129077 ) ) ( not ( = ?auto_129076 ?auto_129078 ) ) ( not ( = ?auto_129076 ?auto_129079 ) ) ( not ( = ?auto_129077 ?auto_129078 ) ) ( not ( = ?auto_129077 ?auto_129079 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_129078 ?auto_129079 )
      ( MAKE-6CRATE-VERIFY ?auto_129073 ?auto_129074 ?auto_129075 ?auto_129076 ?auto_129077 ?auto_129078 ?auto_129079 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129117 - SURFACE
      ?auto_129118 - SURFACE
      ?auto_129119 - SURFACE
      ?auto_129120 - SURFACE
      ?auto_129121 - SURFACE
      ?auto_129122 - SURFACE
      ?auto_129123 - SURFACE
    )
    :vars
    (
      ?auto_129124 - HOIST
      ?auto_129125 - PLACE
      ?auto_129126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129124 ?auto_129125 ) ( SURFACE-AT ?auto_129122 ?auto_129125 ) ( CLEAR ?auto_129122 ) ( IS-CRATE ?auto_129123 ) ( not ( = ?auto_129122 ?auto_129123 ) ) ( TRUCK-AT ?auto_129126 ?auto_129125 ) ( AVAILABLE ?auto_129124 ) ( IN ?auto_129123 ?auto_129126 ) ( ON ?auto_129122 ?auto_129121 ) ( not ( = ?auto_129121 ?auto_129122 ) ) ( not ( = ?auto_129121 ?auto_129123 ) ) ( ON ?auto_129118 ?auto_129117 ) ( ON ?auto_129119 ?auto_129118 ) ( ON ?auto_129120 ?auto_129119 ) ( ON ?auto_129121 ?auto_129120 ) ( not ( = ?auto_129117 ?auto_129118 ) ) ( not ( = ?auto_129117 ?auto_129119 ) ) ( not ( = ?auto_129117 ?auto_129120 ) ) ( not ( = ?auto_129117 ?auto_129121 ) ) ( not ( = ?auto_129117 ?auto_129122 ) ) ( not ( = ?auto_129117 ?auto_129123 ) ) ( not ( = ?auto_129118 ?auto_129119 ) ) ( not ( = ?auto_129118 ?auto_129120 ) ) ( not ( = ?auto_129118 ?auto_129121 ) ) ( not ( = ?auto_129118 ?auto_129122 ) ) ( not ( = ?auto_129118 ?auto_129123 ) ) ( not ( = ?auto_129119 ?auto_129120 ) ) ( not ( = ?auto_129119 ?auto_129121 ) ) ( not ( = ?auto_129119 ?auto_129122 ) ) ( not ( = ?auto_129119 ?auto_129123 ) ) ( not ( = ?auto_129120 ?auto_129121 ) ) ( not ( = ?auto_129120 ?auto_129122 ) ) ( not ( = ?auto_129120 ?auto_129123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129121 ?auto_129122 ?auto_129123 )
      ( MAKE-6CRATE-VERIFY ?auto_129117 ?auto_129118 ?auto_129119 ?auto_129120 ?auto_129121 ?auto_129122 ?auto_129123 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129168 - SURFACE
      ?auto_129169 - SURFACE
      ?auto_129170 - SURFACE
      ?auto_129171 - SURFACE
      ?auto_129172 - SURFACE
      ?auto_129173 - SURFACE
      ?auto_129174 - SURFACE
    )
    :vars
    (
      ?auto_129176 - HOIST
      ?auto_129175 - PLACE
      ?auto_129177 - TRUCK
      ?auto_129178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129176 ?auto_129175 ) ( SURFACE-AT ?auto_129173 ?auto_129175 ) ( CLEAR ?auto_129173 ) ( IS-CRATE ?auto_129174 ) ( not ( = ?auto_129173 ?auto_129174 ) ) ( AVAILABLE ?auto_129176 ) ( IN ?auto_129174 ?auto_129177 ) ( ON ?auto_129173 ?auto_129172 ) ( not ( = ?auto_129172 ?auto_129173 ) ) ( not ( = ?auto_129172 ?auto_129174 ) ) ( TRUCK-AT ?auto_129177 ?auto_129178 ) ( not ( = ?auto_129178 ?auto_129175 ) ) ( ON ?auto_129169 ?auto_129168 ) ( ON ?auto_129170 ?auto_129169 ) ( ON ?auto_129171 ?auto_129170 ) ( ON ?auto_129172 ?auto_129171 ) ( not ( = ?auto_129168 ?auto_129169 ) ) ( not ( = ?auto_129168 ?auto_129170 ) ) ( not ( = ?auto_129168 ?auto_129171 ) ) ( not ( = ?auto_129168 ?auto_129172 ) ) ( not ( = ?auto_129168 ?auto_129173 ) ) ( not ( = ?auto_129168 ?auto_129174 ) ) ( not ( = ?auto_129169 ?auto_129170 ) ) ( not ( = ?auto_129169 ?auto_129171 ) ) ( not ( = ?auto_129169 ?auto_129172 ) ) ( not ( = ?auto_129169 ?auto_129173 ) ) ( not ( = ?auto_129169 ?auto_129174 ) ) ( not ( = ?auto_129170 ?auto_129171 ) ) ( not ( = ?auto_129170 ?auto_129172 ) ) ( not ( = ?auto_129170 ?auto_129173 ) ) ( not ( = ?auto_129170 ?auto_129174 ) ) ( not ( = ?auto_129171 ?auto_129172 ) ) ( not ( = ?auto_129171 ?auto_129173 ) ) ( not ( = ?auto_129171 ?auto_129174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129172 ?auto_129173 ?auto_129174 )
      ( MAKE-6CRATE-VERIFY ?auto_129168 ?auto_129169 ?auto_129170 ?auto_129171 ?auto_129172 ?auto_129173 ?auto_129174 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129225 - SURFACE
      ?auto_129226 - SURFACE
      ?auto_129227 - SURFACE
      ?auto_129228 - SURFACE
      ?auto_129229 - SURFACE
      ?auto_129230 - SURFACE
      ?auto_129231 - SURFACE
    )
    :vars
    (
      ?auto_129233 - HOIST
      ?auto_129232 - PLACE
      ?auto_129236 - TRUCK
      ?auto_129234 - PLACE
      ?auto_129235 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_129233 ?auto_129232 ) ( SURFACE-AT ?auto_129230 ?auto_129232 ) ( CLEAR ?auto_129230 ) ( IS-CRATE ?auto_129231 ) ( not ( = ?auto_129230 ?auto_129231 ) ) ( AVAILABLE ?auto_129233 ) ( ON ?auto_129230 ?auto_129229 ) ( not ( = ?auto_129229 ?auto_129230 ) ) ( not ( = ?auto_129229 ?auto_129231 ) ) ( TRUCK-AT ?auto_129236 ?auto_129234 ) ( not ( = ?auto_129234 ?auto_129232 ) ) ( HOIST-AT ?auto_129235 ?auto_129234 ) ( LIFTING ?auto_129235 ?auto_129231 ) ( not ( = ?auto_129233 ?auto_129235 ) ) ( ON ?auto_129226 ?auto_129225 ) ( ON ?auto_129227 ?auto_129226 ) ( ON ?auto_129228 ?auto_129227 ) ( ON ?auto_129229 ?auto_129228 ) ( not ( = ?auto_129225 ?auto_129226 ) ) ( not ( = ?auto_129225 ?auto_129227 ) ) ( not ( = ?auto_129225 ?auto_129228 ) ) ( not ( = ?auto_129225 ?auto_129229 ) ) ( not ( = ?auto_129225 ?auto_129230 ) ) ( not ( = ?auto_129225 ?auto_129231 ) ) ( not ( = ?auto_129226 ?auto_129227 ) ) ( not ( = ?auto_129226 ?auto_129228 ) ) ( not ( = ?auto_129226 ?auto_129229 ) ) ( not ( = ?auto_129226 ?auto_129230 ) ) ( not ( = ?auto_129226 ?auto_129231 ) ) ( not ( = ?auto_129227 ?auto_129228 ) ) ( not ( = ?auto_129227 ?auto_129229 ) ) ( not ( = ?auto_129227 ?auto_129230 ) ) ( not ( = ?auto_129227 ?auto_129231 ) ) ( not ( = ?auto_129228 ?auto_129229 ) ) ( not ( = ?auto_129228 ?auto_129230 ) ) ( not ( = ?auto_129228 ?auto_129231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129229 ?auto_129230 ?auto_129231 )
      ( MAKE-6CRATE-VERIFY ?auto_129225 ?auto_129226 ?auto_129227 ?auto_129228 ?auto_129229 ?auto_129230 ?auto_129231 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129288 - SURFACE
      ?auto_129289 - SURFACE
      ?auto_129290 - SURFACE
      ?auto_129291 - SURFACE
      ?auto_129292 - SURFACE
      ?auto_129293 - SURFACE
      ?auto_129294 - SURFACE
    )
    :vars
    (
      ?auto_129297 - HOIST
      ?auto_129299 - PLACE
      ?auto_129296 - TRUCK
      ?auto_129295 - PLACE
      ?auto_129298 - HOIST
      ?auto_129300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129297 ?auto_129299 ) ( SURFACE-AT ?auto_129293 ?auto_129299 ) ( CLEAR ?auto_129293 ) ( IS-CRATE ?auto_129294 ) ( not ( = ?auto_129293 ?auto_129294 ) ) ( AVAILABLE ?auto_129297 ) ( ON ?auto_129293 ?auto_129292 ) ( not ( = ?auto_129292 ?auto_129293 ) ) ( not ( = ?auto_129292 ?auto_129294 ) ) ( TRUCK-AT ?auto_129296 ?auto_129295 ) ( not ( = ?auto_129295 ?auto_129299 ) ) ( HOIST-AT ?auto_129298 ?auto_129295 ) ( not ( = ?auto_129297 ?auto_129298 ) ) ( AVAILABLE ?auto_129298 ) ( SURFACE-AT ?auto_129294 ?auto_129295 ) ( ON ?auto_129294 ?auto_129300 ) ( CLEAR ?auto_129294 ) ( not ( = ?auto_129293 ?auto_129300 ) ) ( not ( = ?auto_129294 ?auto_129300 ) ) ( not ( = ?auto_129292 ?auto_129300 ) ) ( ON ?auto_129289 ?auto_129288 ) ( ON ?auto_129290 ?auto_129289 ) ( ON ?auto_129291 ?auto_129290 ) ( ON ?auto_129292 ?auto_129291 ) ( not ( = ?auto_129288 ?auto_129289 ) ) ( not ( = ?auto_129288 ?auto_129290 ) ) ( not ( = ?auto_129288 ?auto_129291 ) ) ( not ( = ?auto_129288 ?auto_129292 ) ) ( not ( = ?auto_129288 ?auto_129293 ) ) ( not ( = ?auto_129288 ?auto_129294 ) ) ( not ( = ?auto_129288 ?auto_129300 ) ) ( not ( = ?auto_129289 ?auto_129290 ) ) ( not ( = ?auto_129289 ?auto_129291 ) ) ( not ( = ?auto_129289 ?auto_129292 ) ) ( not ( = ?auto_129289 ?auto_129293 ) ) ( not ( = ?auto_129289 ?auto_129294 ) ) ( not ( = ?auto_129289 ?auto_129300 ) ) ( not ( = ?auto_129290 ?auto_129291 ) ) ( not ( = ?auto_129290 ?auto_129292 ) ) ( not ( = ?auto_129290 ?auto_129293 ) ) ( not ( = ?auto_129290 ?auto_129294 ) ) ( not ( = ?auto_129290 ?auto_129300 ) ) ( not ( = ?auto_129291 ?auto_129292 ) ) ( not ( = ?auto_129291 ?auto_129293 ) ) ( not ( = ?auto_129291 ?auto_129294 ) ) ( not ( = ?auto_129291 ?auto_129300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129292 ?auto_129293 ?auto_129294 )
      ( MAKE-6CRATE-VERIFY ?auto_129288 ?auto_129289 ?auto_129290 ?auto_129291 ?auto_129292 ?auto_129293 ?auto_129294 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129352 - SURFACE
      ?auto_129353 - SURFACE
      ?auto_129354 - SURFACE
      ?auto_129355 - SURFACE
      ?auto_129356 - SURFACE
      ?auto_129357 - SURFACE
      ?auto_129358 - SURFACE
    )
    :vars
    (
      ?auto_129361 - HOIST
      ?auto_129364 - PLACE
      ?auto_129362 - PLACE
      ?auto_129363 - HOIST
      ?auto_129359 - SURFACE
      ?auto_129360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129361 ?auto_129364 ) ( SURFACE-AT ?auto_129357 ?auto_129364 ) ( CLEAR ?auto_129357 ) ( IS-CRATE ?auto_129358 ) ( not ( = ?auto_129357 ?auto_129358 ) ) ( AVAILABLE ?auto_129361 ) ( ON ?auto_129357 ?auto_129356 ) ( not ( = ?auto_129356 ?auto_129357 ) ) ( not ( = ?auto_129356 ?auto_129358 ) ) ( not ( = ?auto_129362 ?auto_129364 ) ) ( HOIST-AT ?auto_129363 ?auto_129362 ) ( not ( = ?auto_129361 ?auto_129363 ) ) ( AVAILABLE ?auto_129363 ) ( SURFACE-AT ?auto_129358 ?auto_129362 ) ( ON ?auto_129358 ?auto_129359 ) ( CLEAR ?auto_129358 ) ( not ( = ?auto_129357 ?auto_129359 ) ) ( not ( = ?auto_129358 ?auto_129359 ) ) ( not ( = ?auto_129356 ?auto_129359 ) ) ( TRUCK-AT ?auto_129360 ?auto_129364 ) ( ON ?auto_129353 ?auto_129352 ) ( ON ?auto_129354 ?auto_129353 ) ( ON ?auto_129355 ?auto_129354 ) ( ON ?auto_129356 ?auto_129355 ) ( not ( = ?auto_129352 ?auto_129353 ) ) ( not ( = ?auto_129352 ?auto_129354 ) ) ( not ( = ?auto_129352 ?auto_129355 ) ) ( not ( = ?auto_129352 ?auto_129356 ) ) ( not ( = ?auto_129352 ?auto_129357 ) ) ( not ( = ?auto_129352 ?auto_129358 ) ) ( not ( = ?auto_129352 ?auto_129359 ) ) ( not ( = ?auto_129353 ?auto_129354 ) ) ( not ( = ?auto_129353 ?auto_129355 ) ) ( not ( = ?auto_129353 ?auto_129356 ) ) ( not ( = ?auto_129353 ?auto_129357 ) ) ( not ( = ?auto_129353 ?auto_129358 ) ) ( not ( = ?auto_129353 ?auto_129359 ) ) ( not ( = ?auto_129354 ?auto_129355 ) ) ( not ( = ?auto_129354 ?auto_129356 ) ) ( not ( = ?auto_129354 ?auto_129357 ) ) ( not ( = ?auto_129354 ?auto_129358 ) ) ( not ( = ?auto_129354 ?auto_129359 ) ) ( not ( = ?auto_129355 ?auto_129356 ) ) ( not ( = ?auto_129355 ?auto_129357 ) ) ( not ( = ?auto_129355 ?auto_129358 ) ) ( not ( = ?auto_129355 ?auto_129359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129356 ?auto_129357 ?auto_129358 )
      ( MAKE-6CRATE-VERIFY ?auto_129352 ?auto_129353 ?auto_129354 ?auto_129355 ?auto_129356 ?auto_129357 ?auto_129358 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129416 - SURFACE
      ?auto_129417 - SURFACE
      ?auto_129418 - SURFACE
      ?auto_129419 - SURFACE
      ?auto_129420 - SURFACE
      ?auto_129421 - SURFACE
      ?auto_129422 - SURFACE
    )
    :vars
    (
      ?auto_129428 - HOIST
      ?auto_129426 - PLACE
      ?auto_129425 - PLACE
      ?auto_129423 - HOIST
      ?auto_129424 - SURFACE
      ?auto_129427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129428 ?auto_129426 ) ( IS-CRATE ?auto_129422 ) ( not ( = ?auto_129421 ?auto_129422 ) ) ( not ( = ?auto_129420 ?auto_129421 ) ) ( not ( = ?auto_129420 ?auto_129422 ) ) ( not ( = ?auto_129425 ?auto_129426 ) ) ( HOIST-AT ?auto_129423 ?auto_129425 ) ( not ( = ?auto_129428 ?auto_129423 ) ) ( AVAILABLE ?auto_129423 ) ( SURFACE-AT ?auto_129422 ?auto_129425 ) ( ON ?auto_129422 ?auto_129424 ) ( CLEAR ?auto_129422 ) ( not ( = ?auto_129421 ?auto_129424 ) ) ( not ( = ?auto_129422 ?auto_129424 ) ) ( not ( = ?auto_129420 ?auto_129424 ) ) ( TRUCK-AT ?auto_129427 ?auto_129426 ) ( SURFACE-AT ?auto_129420 ?auto_129426 ) ( CLEAR ?auto_129420 ) ( LIFTING ?auto_129428 ?auto_129421 ) ( IS-CRATE ?auto_129421 ) ( ON ?auto_129417 ?auto_129416 ) ( ON ?auto_129418 ?auto_129417 ) ( ON ?auto_129419 ?auto_129418 ) ( ON ?auto_129420 ?auto_129419 ) ( not ( = ?auto_129416 ?auto_129417 ) ) ( not ( = ?auto_129416 ?auto_129418 ) ) ( not ( = ?auto_129416 ?auto_129419 ) ) ( not ( = ?auto_129416 ?auto_129420 ) ) ( not ( = ?auto_129416 ?auto_129421 ) ) ( not ( = ?auto_129416 ?auto_129422 ) ) ( not ( = ?auto_129416 ?auto_129424 ) ) ( not ( = ?auto_129417 ?auto_129418 ) ) ( not ( = ?auto_129417 ?auto_129419 ) ) ( not ( = ?auto_129417 ?auto_129420 ) ) ( not ( = ?auto_129417 ?auto_129421 ) ) ( not ( = ?auto_129417 ?auto_129422 ) ) ( not ( = ?auto_129417 ?auto_129424 ) ) ( not ( = ?auto_129418 ?auto_129419 ) ) ( not ( = ?auto_129418 ?auto_129420 ) ) ( not ( = ?auto_129418 ?auto_129421 ) ) ( not ( = ?auto_129418 ?auto_129422 ) ) ( not ( = ?auto_129418 ?auto_129424 ) ) ( not ( = ?auto_129419 ?auto_129420 ) ) ( not ( = ?auto_129419 ?auto_129421 ) ) ( not ( = ?auto_129419 ?auto_129422 ) ) ( not ( = ?auto_129419 ?auto_129424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129420 ?auto_129421 ?auto_129422 )
      ( MAKE-6CRATE-VERIFY ?auto_129416 ?auto_129417 ?auto_129418 ?auto_129419 ?auto_129420 ?auto_129421 ?auto_129422 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129480 - SURFACE
      ?auto_129481 - SURFACE
      ?auto_129482 - SURFACE
      ?auto_129483 - SURFACE
      ?auto_129484 - SURFACE
      ?auto_129485 - SURFACE
      ?auto_129486 - SURFACE
    )
    :vars
    (
      ?auto_129491 - HOIST
      ?auto_129492 - PLACE
      ?auto_129487 - PLACE
      ?auto_129488 - HOIST
      ?auto_129490 - SURFACE
      ?auto_129489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129491 ?auto_129492 ) ( IS-CRATE ?auto_129486 ) ( not ( = ?auto_129485 ?auto_129486 ) ) ( not ( = ?auto_129484 ?auto_129485 ) ) ( not ( = ?auto_129484 ?auto_129486 ) ) ( not ( = ?auto_129487 ?auto_129492 ) ) ( HOIST-AT ?auto_129488 ?auto_129487 ) ( not ( = ?auto_129491 ?auto_129488 ) ) ( AVAILABLE ?auto_129488 ) ( SURFACE-AT ?auto_129486 ?auto_129487 ) ( ON ?auto_129486 ?auto_129490 ) ( CLEAR ?auto_129486 ) ( not ( = ?auto_129485 ?auto_129490 ) ) ( not ( = ?auto_129486 ?auto_129490 ) ) ( not ( = ?auto_129484 ?auto_129490 ) ) ( TRUCK-AT ?auto_129489 ?auto_129492 ) ( SURFACE-AT ?auto_129484 ?auto_129492 ) ( CLEAR ?auto_129484 ) ( IS-CRATE ?auto_129485 ) ( AVAILABLE ?auto_129491 ) ( IN ?auto_129485 ?auto_129489 ) ( ON ?auto_129481 ?auto_129480 ) ( ON ?auto_129482 ?auto_129481 ) ( ON ?auto_129483 ?auto_129482 ) ( ON ?auto_129484 ?auto_129483 ) ( not ( = ?auto_129480 ?auto_129481 ) ) ( not ( = ?auto_129480 ?auto_129482 ) ) ( not ( = ?auto_129480 ?auto_129483 ) ) ( not ( = ?auto_129480 ?auto_129484 ) ) ( not ( = ?auto_129480 ?auto_129485 ) ) ( not ( = ?auto_129480 ?auto_129486 ) ) ( not ( = ?auto_129480 ?auto_129490 ) ) ( not ( = ?auto_129481 ?auto_129482 ) ) ( not ( = ?auto_129481 ?auto_129483 ) ) ( not ( = ?auto_129481 ?auto_129484 ) ) ( not ( = ?auto_129481 ?auto_129485 ) ) ( not ( = ?auto_129481 ?auto_129486 ) ) ( not ( = ?auto_129481 ?auto_129490 ) ) ( not ( = ?auto_129482 ?auto_129483 ) ) ( not ( = ?auto_129482 ?auto_129484 ) ) ( not ( = ?auto_129482 ?auto_129485 ) ) ( not ( = ?auto_129482 ?auto_129486 ) ) ( not ( = ?auto_129482 ?auto_129490 ) ) ( not ( = ?auto_129483 ?auto_129484 ) ) ( not ( = ?auto_129483 ?auto_129485 ) ) ( not ( = ?auto_129483 ?auto_129486 ) ) ( not ( = ?auto_129483 ?auto_129490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129484 ?auto_129485 ?auto_129486 )
      ( MAKE-6CRATE-VERIFY ?auto_129480 ?auto_129481 ?auto_129482 ?auto_129483 ?auto_129484 ?auto_129485 ?auto_129486 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131436 - SURFACE
      ?auto_131437 - SURFACE
      ?auto_131438 - SURFACE
      ?auto_131439 - SURFACE
      ?auto_131440 - SURFACE
      ?auto_131441 - SURFACE
      ?auto_131442 - SURFACE
      ?auto_131443 - SURFACE
    )
    :vars
    (
      ?auto_131444 - HOIST
      ?auto_131445 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131444 ?auto_131445 ) ( SURFACE-AT ?auto_131442 ?auto_131445 ) ( CLEAR ?auto_131442 ) ( LIFTING ?auto_131444 ?auto_131443 ) ( IS-CRATE ?auto_131443 ) ( not ( = ?auto_131442 ?auto_131443 ) ) ( ON ?auto_131437 ?auto_131436 ) ( ON ?auto_131438 ?auto_131437 ) ( ON ?auto_131439 ?auto_131438 ) ( ON ?auto_131440 ?auto_131439 ) ( ON ?auto_131441 ?auto_131440 ) ( ON ?auto_131442 ?auto_131441 ) ( not ( = ?auto_131436 ?auto_131437 ) ) ( not ( = ?auto_131436 ?auto_131438 ) ) ( not ( = ?auto_131436 ?auto_131439 ) ) ( not ( = ?auto_131436 ?auto_131440 ) ) ( not ( = ?auto_131436 ?auto_131441 ) ) ( not ( = ?auto_131436 ?auto_131442 ) ) ( not ( = ?auto_131436 ?auto_131443 ) ) ( not ( = ?auto_131437 ?auto_131438 ) ) ( not ( = ?auto_131437 ?auto_131439 ) ) ( not ( = ?auto_131437 ?auto_131440 ) ) ( not ( = ?auto_131437 ?auto_131441 ) ) ( not ( = ?auto_131437 ?auto_131442 ) ) ( not ( = ?auto_131437 ?auto_131443 ) ) ( not ( = ?auto_131438 ?auto_131439 ) ) ( not ( = ?auto_131438 ?auto_131440 ) ) ( not ( = ?auto_131438 ?auto_131441 ) ) ( not ( = ?auto_131438 ?auto_131442 ) ) ( not ( = ?auto_131438 ?auto_131443 ) ) ( not ( = ?auto_131439 ?auto_131440 ) ) ( not ( = ?auto_131439 ?auto_131441 ) ) ( not ( = ?auto_131439 ?auto_131442 ) ) ( not ( = ?auto_131439 ?auto_131443 ) ) ( not ( = ?auto_131440 ?auto_131441 ) ) ( not ( = ?auto_131440 ?auto_131442 ) ) ( not ( = ?auto_131440 ?auto_131443 ) ) ( not ( = ?auto_131441 ?auto_131442 ) ) ( not ( = ?auto_131441 ?auto_131443 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_131442 ?auto_131443 )
      ( MAKE-7CRATE-VERIFY ?auto_131436 ?auto_131437 ?auto_131438 ?auto_131439 ?auto_131440 ?auto_131441 ?auto_131442 ?auto_131443 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131491 - SURFACE
      ?auto_131492 - SURFACE
      ?auto_131493 - SURFACE
      ?auto_131494 - SURFACE
      ?auto_131495 - SURFACE
      ?auto_131496 - SURFACE
      ?auto_131497 - SURFACE
      ?auto_131498 - SURFACE
    )
    :vars
    (
      ?auto_131501 - HOIST
      ?auto_131500 - PLACE
      ?auto_131499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131501 ?auto_131500 ) ( SURFACE-AT ?auto_131497 ?auto_131500 ) ( CLEAR ?auto_131497 ) ( IS-CRATE ?auto_131498 ) ( not ( = ?auto_131497 ?auto_131498 ) ) ( TRUCK-AT ?auto_131499 ?auto_131500 ) ( AVAILABLE ?auto_131501 ) ( IN ?auto_131498 ?auto_131499 ) ( ON ?auto_131497 ?auto_131496 ) ( not ( = ?auto_131496 ?auto_131497 ) ) ( not ( = ?auto_131496 ?auto_131498 ) ) ( ON ?auto_131492 ?auto_131491 ) ( ON ?auto_131493 ?auto_131492 ) ( ON ?auto_131494 ?auto_131493 ) ( ON ?auto_131495 ?auto_131494 ) ( ON ?auto_131496 ?auto_131495 ) ( not ( = ?auto_131491 ?auto_131492 ) ) ( not ( = ?auto_131491 ?auto_131493 ) ) ( not ( = ?auto_131491 ?auto_131494 ) ) ( not ( = ?auto_131491 ?auto_131495 ) ) ( not ( = ?auto_131491 ?auto_131496 ) ) ( not ( = ?auto_131491 ?auto_131497 ) ) ( not ( = ?auto_131491 ?auto_131498 ) ) ( not ( = ?auto_131492 ?auto_131493 ) ) ( not ( = ?auto_131492 ?auto_131494 ) ) ( not ( = ?auto_131492 ?auto_131495 ) ) ( not ( = ?auto_131492 ?auto_131496 ) ) ( not ( = ?auto_131492 ?auto_131497 ) ) ( not ( = ?auto_131492 ?auto_131498 ) ) ( not ( = ?auto_131493 ?auto_131494 ) ) ( not ( = ?auto_131493 ?auto_131495 ) ) ( not ( = ?auto_131493 ?auto_131496 ) ) ( not ( = ?auto_131493 ?auto_131497 ) ) ( not ( = ?auto_131493 ?auto_131498 ) ) ( not ( = ?auto_131494 ?auto_131495 ) ) ( not ( = ?auto_131494 ?auto_131496 ) ) ( not ( = ?auto_131494 ?auto_131497 ) ) ( not ( = ?auto_131494 ?auto_131498 ) ) ( not ( = ?auto_131495 ?auto_131496 ) ) ( not ( = ?auto_131495 ?auto_131497 ) ) ( not ( = ?auto_131495 ?auto_131498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131496 ?auto_131497 ?auto_131498 )
      ( MAKE-7CRATE-VERIFY ?auto_131491 ?auto_131492 ?auto_131493 ?auto_131494 ?auto_131495 ?auto_131496 ?auto_131497 ?auto_131498 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131554 - SURFACE
      ?auto_131555 - SURFACE
      ?auto_131556 - SURFACE
      ?auto_131557 - SURFACE
      ?auto_131558 - SURFACE
      ?auto_131559 - SURFACE
      ?auto_131560 - SURFACE
      ?auto_131561 - SURFACE
    )
    :vars
    (
      ?auto_131563 - HOIST
      ?auto_131562 - PLACE
      ?auto_131565 - TRUCK
      ?auto_131564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131563 ?auto_131562 ) ( SURFACE-AT ?auto_131560 ?auto_131562 ) ( CLEAR ?auto_131560 ) ( IS-CRATE ?auto_131561 ) ( not ( = ?auto_131560 ?auto_131561 ) ) ( AVAILABLE ?auto_131563 ) ( IN ?auto_131561 ?auto_131565 ) ( ON ?auto_131560 ?auto_131559 ) ( not ( = ?auto_131559 ?auto_131560 ) ) ( not ( = ?auto_131559 ?auto_131561 ) ) ( TRUCK-AT ?auto_131565 ?auto_131564 ) ( not ( = ?auto_131564 ?auto_131562 ) ) ( ON ?auto_131555 ?auto_131554 ) ( ON ?auto_131556 ?auto_131555 ) ( ON ?auto_131557 ?auto_131556 ) ( ON ?auto_131558 ?auto_131557 ) ( ON ?auto_131559 ?auto_131558 ) ( not ( = ?auto_131554 ?auto_131555 ) ) ( not ( = ?auto_131554 ?auto_131556 ) ) ( not ( = ?auto_131554 ?auto_131557 ) ) ( not ( = ?auto_131554 ?auto_131558 ) ) ( not ( = ?auto_131554 ?auto_131559 ) ) ( not ( = ?auto_131554 ?auto_131560 ) ) ( not ( = ?auto_131554 ?auto_131561 ) ) ( not ( = ?auto_131555 ?auto_131556 ) ) ( not ( = ?auto_131555 ?auto_131557 ) ) ( not ( = ?auto_131555 ?auto_131558 ) ) ( not ( = ?auto_131555 ?auto_131559 ) ) ( not ( = ?auto_131555 ?auto_131560 ) ) ( not ( = ?auto_131555 ?auto_131561 ) ) ( not ( = ?auto_131556 ?auto_131557 ) ) ( not ( = ?auto_131556 ?auto_131558 ) ) ( not ( = ?auto_131556 ?auto_131559 ) ) ( not ( = ?auto_131556 ?auto_131560 ) ) ( not ( = ?auto_131556 ?auto_131561 ) ) ( not ( = ?auto_131557 ?auto_131558 ) ) ( not ( = ?auto_131557 ?auto_131559 ) ) ( not ( = ?auto_131557 ?auto_131560 ) ) ( not ( = ?auto_131557 ?auto_131561 ) ) ( not ( = ?auto_131558 ?auto_131559 ) ) ( not ( = ?auto_131558 ?auto_131560 ) ) ( not ( = ?auto_131558 ?auto_131561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131559 ?auto_131560 ?auto_131561 )
      ( MAKE-7CRATE-VERIFY ?auto_131554 ?auto_131555 ?auto_131556 ?auto_131557 ?auto_131558 ?auto_131559 ?auto_131560 ?auto_131561 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131624 - SURFACE
      ?auto_131625 - SURFACE
      ?auto_131626 - SURFACE
      ?auto_131627 - SURFACE
      ?auto_131628 - SURFACE
      ?auto_131629 - SURFACE
      ?auto_131630 - SURFACE
      ?auto_131631 - SURFACE
    )
    :vars
    (
      ?auto_131636 - HOIST
      ?auto_131635 - PLACE
      ?auto_131634 - TRUCK
      ?auto_131633 - PLACE
      ?auto_131632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_131636 ?auto_131635 ) ( SURFACE-AT ?auto_131630 ?auto_131635 ) ( CLEAR ?auto_131630 ) ( IS-CRATE ?auto_131631 ) ( not ( = ?auto_131630 ?auto_131631 ) ) ( AVAILABLE ?auto_131636 ) ( ON ?auto_131630 ?auto_131629 ) ( not ( = ?auto_131629 ?auto_131630 ) ) ( not ( = ?auto_131629 ?auto_131631 ) ) ( TRUCK-AT ?auto_131634 ?auto_131633 ) ( not ( = ?auto_131633 ?auto_131635 ) ) ( HOIST-AT ?auto_131632 ?auto_131633 ) ( LIFTING ?auto_131632 ?auto_131631 ) ( not ( = ?auto_131636 ?auto_131632 ) ) ( ON ?auto_131625 ?auto_131624 ) ( ON ?auto_131626 ?auto_131625 ) ( ON ?auto_131627 ?auto_131626 ) ( ON ?auto_131628 ?auto_131627 ) ( ON ?auto_131629 ?auto_131628 ) ( not ( = ?auto_131624 ?auto_131625 ) ) ( not ( = ?auto_131624 ?auto_131626 ) ) ( not ( = ?auto_131624 ?auto_131627 ) ) ( not ( = ?auto_131624 ?auto_131628 ) ) ( not ( = ?auto_131624 ?auto_131629 ) ) ( not ( = ?auto_131624 ?auto_131630 ) ) ( not ( = ?auto_131624 ?auto_131631 ) ) ( not ( = ?auto_131625 ?auto_131626 ) ) ( not ( = ?auto_131625 ?auto_131627 ) ) ( not ( = ?auto_131625 ?auto_131628 ) ) ( not ( = ?auto_131625 ?auto_131629 ) ) ( not ( = ?auto_131625 ?auto_131630 ) ) ( not ( = ?auto_131625 ?auto_131631 ) ) ( not ( = ?auto_131626 ?auto_131627 ) ) ( not ( = ?auto_131626 ?auto_131628 ) ) ( not ( = ?auto_131626 ?auto_131629 ) ) ( not ( = ?auto_131626 ?auto_131630 ) ) ( not ( = ?auto_131626 ?auto_131631 ) ) ( not ( = ?auto_131627 ?auto_131628 ) ) ( not ( = ?auto_131627 ?auto_131629 ) ) ( not ( = ?auto_131627 ?auto_131630 ) ) ( not ( = ?auto_131627 ?auto_131631 ) ) ( not ( = ?auto_131628 ?auto_131629 ) ) ( not ( = ?auto_131628 ?auto_131630 ) ) ( not ( = ?auto_131628 ?auto_131631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131629 ?auto_131630 ?auto_131631 )
      ( MAKE-7CRATE-VERIFY ?auto_131624 ?auto_131625 ?auto_131626 ?auto_131627 ?auto_131628 ?auto_131629 ?auto_131630 ?auto_131631 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131701 - SURFACE
      ?auto_131702 - SURFACE
      ?auto_131703 - SURFACE
      ?auto_131704 - SURFACE
      ?auto_131705 - SURFACE
      ?auto_131706 - SURFACE
      ?auto_131707 - SURFACE
      ?auto_131708 - SURFACE
    )
    :vars
    (
      ?auto_131709 - HOIST
      ?auto_131712 - PLACE
      ?auto_131713 - TRUCK
      ?auto_131714 - PLACE
      ?auto_131711 - HOIST
      ?auto_131710 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131709 ?auto_131712 ) ( SURFACE-AT ?auto_131707 ?auto_131712 ) ( CLEAR ?auto_131707 ) ( IS-CRATE ?auto_131708 ) ( not ( = ?auto_131707 ?auto_131708 ) ) ( AVAILABLE ?auto_131709 ) ( ON ?auto_131707 ?auto_131706 ) ( not ( = ?auto_131706 ?auto_131707 ) ) ( not ( = ?auto_131706 ?auto_131708 ) ) ( TRUCK-AT ?auto_131713 ?auto_131714 ) ( not ( = ?auto_131714 ?auto_131712 ) ) ( HOIST-AT ?auto_131711 ?auto_131714 ) ( not ( = ?auto_131709 ?auto_131711 ) ) ( AVAILABLE ?auto_131711 ) ( SURFACE-AT ?auto_131708 ?auto_131714 ) ( ON ?auto_131708 ?auto_131710 ) ( CLEAR ?auto_131708 ) ( not ( = ?auto_131707 ?auto_131710 ) ) ( not ( = ?auto_131708 ?auto_131710 ) ) ( not ( = ?auto_131706 ?auto_131710 ) ) ( ON ?auto_131702 ?auto_131701 ) ( ON ?auto_131703 ?auto_131702 ) ( ON ?auto_131704 ?auto_131703 ) ( ON ?auto_131705 ?auto_131704 ) ( ON ?auto_131706 ?auto_131705 ) ( not ( = ?auto_131701 ?auto_131702 ) ) ( not ( = ?auto_131701 ?auto_131703 ) ) ( not ( = ?auto_131701 ?auto_131704 ) ) ( not ( = ?auto_131701 ?auto_131705 ) ) ( not ( = ?auto_131701 ?auto_131706 ) ) ( not ( = ?auto_131701 ?auto_131707 ) ) ( not ( = ?auto_131701 ?auto_131708 ) ) ( not ( = ?auto_131701 ?auto_131710 ) ) ( not ( = ?auto_131702 ?auto_131703 ) ) ( not ( = ?auto_131702 ?auto_131704 ) ) ( not ( = ?auto_131702 ?auto_131705 ) ) ( not ( = ?auto_131702 ?auto_131706 ) ) ( not ( = ?auto_131702 ?auto_131707 ) ) ( not ( = ?auto_131702 ?auto_131708 ) ) ( not ( = ?auto_131702 ?auto_131710 ) ) ( not ( = ?auto_131703 ?auto_131704 ) ) ( not ( = ?auto_131703 ?auto_131705 ) ) ( not ( = ?auto_131703 ?auto_131706 ) ) ( not ( = ?auto_131703 ?auto_131707 ) ) ( not ( = ?auto_131703 ?auto_131708 ) ) ( not ( = ?auto_131703 ?auto_131710 ) ) ( not ( = ?auto_131704 ?auto_131705 ) ) ( not ( = ?auto_131704 ?auto_131706 ) ) ( not ( = ?auto_131704 ?auto_131707 ) ) ( not ( = ?auto_131704 ?auto_131708 ) ) ( not ( = ?auto_131704 ?auto_131710 ) ) ( not ( = ?auto_131705 ?auto_131706 ) ) ( not ( = ?auto_131705 ?auto_131707 ) ) ( not ( = ?auto_131705 ?auto_131708 ) ) ( not ( = ?auto_131705 ?auto_131710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131706 ?auto_131707 ?auto_131708 )
      ( MAKE-7CRATE-VERIFY ?auto_131701 ?auto_131702 ?auto_131703 ?auto_131704 ?auto_131705 ?auto_131706 ?auto_131707 ?auto_131708 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131779 - SURFACE
      ?auto_131780 - SURFACE
      ?auto_131781 - SURFACE
      ?auto_131782 - SURFACE
      ?auto_131783 - SURFACE
      ?auto_131784 - SURFACE
      ?auto_131785 - SURFACE
      ?auto_131786 - SURFACE
    )
    :vars
    (
      ?auto_131787 - HOIST
      ?auto_131788 - PLACE
      ?auto_131791 - PLACE
      ?auto_131789 - HOIST
      ?auto_131790 - SURFACE
      ?auto_131792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131787 ?auto_131788 ) ( SURFACE-AT ?auto_131785 ?auto_131788 ) ( CLEAR ?auto_131785 ) ( IS-CRATE ?auto_131786 ) ( not ( = ?auto_131785 ?auto_131786 ) ) ( AVAILABLE ?auto_131787 ) ( ON ?auto_131785 ?auto_131784 ) ( not ( = ?auto_131784 ?auto_131785 ) ) ( not ( = ?auto_131784 ?auto_131786 ) ) ( not ( = ?auto_131791 ?auto_131788 ) ) ( HOIST-AT ?auto_131789 ?auto_131791 ) ( not ( = ?auto_131787 ?auto_131789 ) ) ( AVAILABLE ?auto_131789 ) ( SURFACE-AT ?auto_131786 ?auto_131791 ) ( ON ?auto_131786 ?auto_131790 ) ( CLEAR ?auto_131786 ) ( not ( = ?auto_131785 ?auto_131790 ) ) ( not ( = ?auto_131786 ?auto_131790 ) ) ( not ( = ?auto_131784 ?auto_131790 ) ) ( TRUCK-AT ?auto_131792 ?auto_131788 ) ( ON ?auto_131780 ?auto_131779 ) ( ON ?auto_131781 ?auto_131780 ) ( ON ?auto_131782 ?auto_131781 ) ( ON ?auto_131783 ?auto_131782 ) ( ON ?auto_131784 ?auto_131783 ) ( not ( = ?auto_131779 ?auto_131780 ) ) ( not ( = ?auto_131779 ?auto_131781 ) ) ( not ( = ?auto_131779 ?auto_131782 ) ) ( not ( = ?auto_131779 ?auto_131783 ) ) ( not ( = ?auto_131779 ?auto_131784 ) ) ( not ( = ?auto_131779 ?auto_131785 ) ) ( not ( = ?auto_131779 ?auto_131786 ) ) ( not ( = ?auto_131779 ?auto_131790 ) ) ( not ( = ?auto_131780 ?auto_131781 ) ) ( not ( = ?auto_131780 ?auto_131782 ) ) ( not ( = ?auto_131780 ?auto_131783 ) ) ( not ( = ?auto_131780 ?auto_131784 ) ) ( not ( = ?auto_131780 ?auto_131785 ) ) ( not ( = ?auto_131780 ?auto_131786 ) ) ( not ( = ?auto_131780 ?auto_131790 ) ) ( not ( = ?auto_131781 ?auto_131782 ) ) ( not ( = ?auto_131781 ?auto_131783 ) ) ( not ( = ?auto_131781 ?auto_131784 ) ) ( not ( = ?auto_131781 ?auto_131785 ) ) ( not ( = ?auto_131781 ?auto_131786 ) ) ( not ( = ?auto_131781 ?auto_131790 ) ) ( not ( = ?auto_131782 ?auto_131783 ) ) ( not ( = ?auto_131782 ?auto_131784 ) ) ( not ( = ?auto_131782 ?auto_131785 ) ) ( not ( = ?auto_131782 ?auto_131786 ) ) ( not ( = ?auto_131782 ?auto_131790 ) ) ( not ( = ?auto_131783 ?auto_131784 ) ) ( not ( = ?auto_131783 ?auto_131785 ) ) ( not ( = ?auto_131783 ?auto_131786 ) ) ( not ( = ?auto_131783 ?auto_131790 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131784 ?auto_131785 ?auto_131786 )
      ( MAKE-7CRATE-VERIFY ?auto_131779 ?auto_131780 ?auto_131781 ?auto_131782 ?auto_131783 ?auto_131784 ?auto_131785 ?auto_131786 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131857 - SURFACE
      ?auto_131858 - SURFACE
      ?auto_131859 - SURFACE
      ?auto_131860 - SURFACE
      ?auto_131861 - SURFACE
      ?auto_131862 - SURFACE
      ?auto_131863 - SURFACE
      ?auto_131864 - SURFACE
    )
    :vars
    (
      ?auto_131870 - HOIST
      ?auto_131869 - PLACE
      ?auto_131866 - PLACE
      ?auto_131868 - HOIST
      ?auto_131867 - SURFACE
      ?auto_131865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131870 ?auto_131869 ) ( IS-CRATE ?auto_131864 ) ( not ( = ?auto_131863 ?auto_131864 ) ) ( not ( = ?auto_131862 ?auto_131863 ) ) ( not ( = ?auto_131862 ?auto_131864 ) ) ( not ( = ?auto_131866 ?auto_131869 ) ) ( HOIST-AT ?auto_131868 ?auto_131866 ) ( not ( = ?auto_131870 ?auto_131868 ) ) ( AVAILABLE ?auto_131868 ) ( SURFACE-AT ?auto_131864 ?auto_131866 ) ( ON ?auto_131864 ?auto_131867 ) ( CLEAR ?auto_131864 ) ( not ( = ?auto_131863 ?auto_131867 ) ) ( not ( = ?auto_131864 ?auto_131867 ) ) ( not ( = ?auto_131862 ?auto_131867 ) ) ( TRUCK-AT ?auto_131865 ?auto_131869 ) ( SURFACE-AT ?auto_131862 ?auto_131869 ) ( CLEAR ?auto_131862 ) ( LIFTING ?auto_131870 ?auto_131863 ) ( IS-CRATE ?auto_131863 ) ( ON ?auto_131858 ?auto_131857 ) ( ON ?auto_131859 ?auto_131858 ) ( ON ?auto_131860 ?auto_131859 ) ( ON ?auto_131861 ?auto_131860 ) ( ON ?auto_131862 ?auto_131861 ) ( not ( = ?auto_131857 ?auto_131858 ) ) ( not ( = ?auto_131857 ?auto_131859 ) ) ( not ( = ?auto_131857 ?auto_131860 ) ) ( not ( = ?auto_131857 ?auto_131861 ) ) ( not ( = ?auto_131857 ?auto_131862 ) ) ( not ( = ?auto_131857 ?auto_131863 ) ) ( not ( = ?auto_131857 ?auto_131864 ) ) ( not ( = ?auto_131857 ?auto_131867 ) ) ( not ( = ?auto_131858 ?auto_131859 ) ) ( not ( = ?auto_131858 ?auto_131860 ) ) ( not ( = ?auto_131858 ?auto_131861 ) ) ( not ( = ?auto_131858 ?auto_131862 ) ) ( not ( = ?auto_131858 ?auto_131863 ) ) ( not ( = ?auto_131858 ?auto_131864 ) ) ( not ( = ?auto_131858 ?auto_131867 ) ) ( not ( = ?auto_131859 ?auto_131860 ) ) ( not ( = ?auto_131859 ?auto_131861 ) ) ( not ( = ?auto_131859 ?auto_131862 ) ) ( not ( = ?auto_131859 ?auto_131863 ) ) ( not ( = ?auto_131859 ?auto_131864 ) ) ( not ( = ?auto_131859 ?auto_131867 ) ) ( not ( = ?auto_131860 ?auto_131861 ) ) ( not ( = ?auto_131860 ?auto_131862 ) ) ( not ( = ?auto_131860 ?auto_131863 ) ) ( not ( = ?auto_131860 ?auto_131864 ) ) ( not ( = ?auto_131860 ?auto_131867 ) ) ( not ( = ?auto_131861 ?auto_131862 ) ) ( not ( = ?auto_131861 ?auto_131863 ) ) ( not ( = ?auto_131861 ?auto_131864 ) ) ( not ( = ?auto_131861 ?auto_131867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131862 ?auto_131863 ?auto_131864 )
      ( MAKE-7CRATE-VERIFY ?auto_131857 ?auto_131858 ?auto_131859 ?auto_131860 ?auto_131861 ?auto_131862 ?auto_131863 ?auto_131864 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131935 - SURFACE
      ?auto_131936 - SURFACE
      ?auto_131937 - SURFACE
      ?auto_131938 - SURFACE
      ?auto_131939 - SURFACE
      ?auto_131940 - SURFACE
      ?auto_131941 - SURFACE
      ?auto_131942 - SURFACE
    )
    :vars
    (
      ?auto_131946 - HOIST
      ?auto_131947 - PLACE
      ?auto_131945 - PLACE
      ?auto_131944 - HOIST
      ?auto_131943 - SURFACE
      ?auto_131948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131946 ?auto_131947 ) ( IS-CRATE ?auto_131942 ) ( not ( = ?auto_131941 ?auto_131942 ) ) ( not ( = ?auto_131940 ?auto_131941 ) ) ( not ( = ?auto_131940 ?auto_131942 ) ) ( not ( = ?auto_131945 ?auto_131947 ) ) ( HOIST-AT ?auto_131944 ?auto_131945 ) ( not ( = ?auto_131946 ?auto_131944 ) ) ( AVAILABLE ?auto_131944 ) ( SURFACE-AT ?auto_131942 ?auto_131945 ) ( ON ?auto_131942 ?auto_131943 ) ( CLEAR ?auto_131942 ) ( not ( = ?auto_131941 ?auto_131943 ) ) ( not ( = ?auto_131942 ?auto_131943 ) ) ( not ( = ?auto_131940 ?auto_131943 ) ) ( TRUCK-AT ?auto_131948 ?auto_131947 ) ( SURFACE-AT ?auto_131940 ?auto_131947 ) ( CLEAR ?auto_131940 ) ( IS-CRATE ?auto_131941 ) ( AVAILABLE ?auto_131946 ) ( IN ?auto_131941 ?auto_131948 ) ( ON ?auto_131936 ?auto_131935 ) ( ON ?auto_131937 ?auto_131936 ) ( ON ?auto_131938 ?auto_131937 ) ( ON ?auto_131939 ?auto_131938 ) ( ON ?auto_131940 ?auto_131939 ) ( not ( = ?auto_131935 ?auto_131936 ) ) ( not ( = ?auto_131935 ?auto_131937 ) ) ( not ( = ?auto_131935 ?auto_131938 ) ) ( not ( = ?auto_131935 ?auto_131939 ) ) ( not ( = ?auto_131935 ?auto_131940 ) ) ( not ( = ?auto_131935 ?auto_131941 ) ) ( not ( = ?auto_131935 ?auto_131942 ) ) ( not ( = ?auto_131935 ?auto_131943 ) ) ( not ( = ?auto_131936 ?auto_131937 ) ) ( not ( = ?auto_131936 ?auto_131938 ) ) ( not ( = ?auto_131936 ?auto_131939 ) ) ( not ( = ?auto_131936 ?auto_131940 ) ) ( not ( = ?auto_131936 ?auto_131941 ) ) ( not ( = ?auto_131936 ?auto_131942 ) ) ( not ( = ?auto_131936 ?auto_131943 ) ) ( not ( = ?auto_131937 ?auto_131938 ) ) ( not ( = ?auto_131937 ?auto_131939 ) ) ( not ( = ?auto_131937 ?auto_131940 ) ) ( not ( = ?auto_131937 ?auto_131941 ) ) ( not ( = ?auto_131937 ?auto_131942 ) ) ( not ( = ?auto_131937 ?auto_131943 ) ) ( not ( = ?auto_131938 ?auto_131939 ) ) ( not ( = ?auto_131938 ?auto_131940 ) ) ( not ( = ?auto_131938 ?auto_131941 ) ) ( not ( = ?auto_131938 ?auto_131942 ) ) ( not ( = ?auto_131938 ?auto_131943 ) ) ( not ( = ?auto_131939 ?auto_131940 ) ) ( not ( = ?auto_131939 ?auto_131941 ) ) ( not ( = ?auto_131939 ?auto_131942 ) ) ( not ( = ?auto_131939 ?auto_131943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131940 ?auto_131941 ?auto_131942 )
      ( MAKE-7CRATE-VERIFY ?auto_131935 ?auto_131936 ?auto_131937 ?auto_131938 ?auto_131939 ?auto_131940 ?auto_131941 ?auto_131942 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134854 - SURFACE
      ?auto_134855 - SURFACE
      ?auto_134856 - SURFACE
      ?auto_134857 - SURFACE
      ?auto_134858 - SURFACE
      ?auto_134859 - SURFACE
      ?auto_134860 - SURFACE
      ?auto_134861 - SURFACE
      ?auto_134862 - SURFACE
    )
    :vars
    (
      ?auto_134864 - HOIST
      ?auto_134863 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_134864 ?auto_134863 ) ( SURFACE-AT ?auto_134861 ?auto_134863 ) ( CLEAR ?auto_134861 ) ( LIFTING ?auto_134864 ?auto_134862 ) ( IS-CRATE ?auto_134862 ) ( not ( = ?auto_134861 ?auto_134862 ) ) ( ON ?auto_134855 ?auto_134854 ) ( ON ?auto_134856 ?auto_134855 ) ( ON ?auto_134857 ?auto_134856 ) ( ON ?auto_134858 ?auto_134857 ) ( ON ?auto_134859 ?auto_134858 ) ( ON ?auto_134860 ?auto_134859 ) ( ON ?auto_134861 ?auto_134860 ) ( not ( = ?auto_134854 ?auto_134855 ) ) ( not ( = ?auto_134854 ?auto_134856 ) ) ( not ( = ?auto_134854 ?auto_134857 ) ) ( not ( = ?auto_134854 ?auto_134858 ) ) ( not ( = ?auto_134854 ?auto_134859 ) ) ( not ( = ?auto_134854 ?auto_134860 ) ) ( not ( = ?auto_134854 ?auto_134861 ) ) ( not ( = ?auto_134854 ?auto_134862 ) ) ( not ( = ?auto_134855 ?auto_134856 ) ) ( not ( = ?auto_134855 ?auto_134857 ) ) ( not ( = ?auto_134855 ?auto_134858 ) ) ( not ( = ?auto_134855 ?auto_134859 ) ) ( not ( = ?auto_134855 ?auto_134860 ) ) ( not ( = ?auto_134855 ?auto_134861 ) ) ( not ( = ?auto_134855 ?auto_134862 ) ) ( not ( = ?auto_134856 ?auto_134857 ) ) ( not ( = ?auto_134856 ?auto_134858 ) ) ( not ( = ?auto_134856 ?auto_134859 ) ) ( not ( = ?auto_134856 ?auto_134860 ) ) ( not ( = ?auto_134856 ?auto_134861 ) ) ( not ( = ?auto_134856 ?auto_134862 ) ) ( not ( = ?auto_134857 ?auto_134858 ) ) ( not ( = ?auto_134857 ?auto_134859 ) ) ( not ( = ?auto_134857 ?auto_134860 ) ) ( not ( = ?auto_134857 ?auto_134861 ) ) ( not ( = ?auto_134857 ?auto_134862 ) ) ( not ( = ?auto_134858 ?auto_134859 ) ) ( not ( = ?auto_134858 ?auto_134860 ) ) ( not ( = ?auto_134858 ?auto_134861 ) ) ( not ( = ?auto_134858 ?auto_134862 ) ) ( not ( = ?auto_134859 ?auto_134860 ) ) ( not ( = ?auto_134859 ?auto_134861 ) ) ( not ( = ?auto_134859 ?auto_134862 ) ) ( not ( = ?auto_134860 ?auto_134861 ) ) ( not ( = ?auto_134860 ?auto_134862 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_134861 ?auto_134862 )
      ( MAKE-8CRATE-VERIFY ?auto_134854 ?auto_134855 ?auto_134856 ?auto_134857 ?auto_134858 ?auto_134859 ?auto_134860 ?auto_134861 ?auto_134862 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134921 - SURFACE
      ?auto_134922 - SURFACE
      ?auto_134923 - SURFACE
      ?auto_134924 - SURFACE
      ?auto_134925 - SURFACE
      ?auto_134926 - SURFACE
      ?auto_134927 - SURFACE
      ?auto_134928 - SURFACE
      ?auto_134929 - SURFACE
    )
    :vars
    (
      ?auto_134931 - HOIST
      ?auto_134930 - PLACE
      ?auto_134932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_134931 ?auto_134930 ) ( SURFACE-AT ?auto_134928 ?auto_134930 ) ( CLEAR ?auto_134928 ) ( IS-CRATE ?auto_134929 ) ( not ( = ?auto_134928 ?auto_134929 ) ) ( TRUCK-AT ?auto_134932 ?auto_134930 ) ( AVAILABLE ?auto_134931 ) ( IN ?auto_134929 ?auto_134932 ) ( ON ?auto_134928 ?auto_134927 ) ( not ( = ?auto_134927 ?auto_134928 ) ) ( not ( = ?auto_134927 ?auto_134929 ) ) ( ON ?auto_134922 ?auto_134921 ) ( ON ?auto_134923 ?auto_134922 ) ( ON ?auto_134924 ?auto_134923 ) ( ON ?auto_134925 ?auto_134924 ) ( ON ?auto_134926 ?auto_134925 ) ( ON ?auto_134927 ?auto_134926 ) ( not ( = ?auto_134921 ?auto_134922 ) ) ( not ( = ?auto_134921 ?auto_134923 ) ) ( not ( = ?auto_134921 ?auto_134924 ) ) ( not ( = ?auto_134921 ?auto_134925 ) ) ( not ( = ?auto_134921 ?auto_134926 ) ) ( not ( = ?auto_134921 ?auto_134927 ) ) ( not ( = ?auto_134921 ?auto_134928 ) ) ( not ( = ?auto_134921 ?auto_134929 ) ) ( not ( = ?auto_134922 ?auto_134923 ) ) ( not ( = ?auto_134922 ?auto_134924 ) ) ( not ( = ?auto_134922 ?auto_134925 ) ) ( not ( = ?auto_134922 ?auto_134926 ) ) ( not ( = ?auto_134922 ?auto_134927 ) ) ( not ( = ?auto_134922 ?auto_134928 ) ) ( not ( = ?auto_134922 ?auto_134929 ) ) ( not ( = ?auto_134923 ?auto_134924 ) ) ( not ( = ?auto_134923 ?auto_134925 ) ) ( not ( = ?auto_134923 ?auto_134926 ) ) ( not ( = ?auto_134923 ?auto_134927 ) ) ( not ( = ?auto_134923 ?auto_134928 ) ) ( not ( = ?auto_134923 ?auto_134929 ) ) ( not ( = ?auto_134924 ?auto_134925 ) ) ( not ( = ?auto_134924 ?auto_134926 ) ) ( not ( = ?auto_134924 ?auto_134927 ) ) ( not ( = ?auto_134924 ?auto_134928 ) ) ( not ( = ?auto_134924 ?auto_134929 ) ) ( not ( = ?auto_134925 ?auto_134926 ) ) ( not ( = ?auto_134925 ?auto_134927 ) ) ( not ( = ?auto_134925 ?auto_134928 ) ) ( not ( = ?auto_134925 ?auto_134929 ) ) ( not ( = ?auto_134926 ?auto_134927 ) ) ( not ( = ?auto_134926 ?auto_134928 ) ) ( not ( = ?auto_134926 ?auto_134929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134927 ?auto_134928 ?auto_134929 )
      ( MAKE-8CRATE-VERIFY ?auto_134921 ?auto_134922 ?auto_134923 ?auto_134924 ?auto_134925 ?auto_134926 ?auto_134927 ?auto_134928 ?auto_134929 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134997 - SURFACE
      ?auto_134998 - SURFACE
      ?auto_134999 - SURFACE
      ?auto_135000 - SURFACE
      ?auto_135001 - SURFACE
      ?auto_135002 - SURFACE
      ?auto_135003 - SURFACE
      ?auto_135004 - SURFACE
      ?auto_135005 - SURFACE
    )
    :vars
    (
      ?auto_135009 - HOIST
      ?auto_135008 - PLACE
      ?auto_135007 - TRUCK
      ?auto_135006 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_135009 ?auto_135008 ) ( SURFACE-AT ?auto_135004 ?auto_135008 ) ( CLEAR ?auto_135004 ) ( IS-CRATE ?auto_135005 ) ( not ( = ?auto_135004 ?auto_135005 ) ) ( AVAILABLE ?auto_135009 ) ( IN ?auto_135005 ?auto_135007 ) ( ON ?auto_135004 ?auto_135003 ) ( not ( = ?auto_135003 ?auto_135004 ) ) ( not ( = ?auto_135003 ?auto_135005 ) ) ( TRUCK-AT ?auto_135007 ?auto_135006 ) ( not ( = ?auto_135006 ?auto_135008 ) ) ( ON ?auto_134998 ?auto_134997 ) ( ON ?auto_134999 ?auto_134998 ) ( ON ?auto_135000 ?auto_134999 ) ( ON ?auto_135001 ?auto_135000 ) ( ON ?auto_135002 ?auto_135001 ) ( ON ?auto_135003 ?auto_135002 ) ( not ( = ?auto_134997 ?auto_134998 ) ) ( not ( = ?auto_134997 ?auto_134999 ) ) ( not ( = ?auto_134997 ?auto_135000 ) ) ( not ( = ?auto_134997 ?auto_135001 ) ) ( not ( = ?auto_134997 ?auto_135002 ) ) ( not ( = ?auto_134997 ?auto_135003 ) ) ( not ( = ?auto_134997 ?auto_135004 ) ) ( not ( = ?auto_134997 ?auto_135005 ) ) ( not ( = ?auto_134998 ?auto_134999 ) ) ( not ( = ?auto_134998 ?auto_135000 ) ) ( not ( = ?auto_134998 ?auto_135001 ) ) ( not ( = ?auto_134998 ?auto_135002 ) ) ( not ( = ?auto_134998 ?auto_135003 ) ) ( not ( = ?auto_134998 ?auto_135004 ) ) ( not ( = ?auto_134998 ?auto_135005 ) ) ( not ( = ?auto_134999 ?auto_135000 ) ) ( not ( = ?auto_134999 ?auto_135001 ) ) ( not ( = ?auto_134999 ?auto_135002 ) ) ( not ( = ?auto_134999 ?auto_135003 ) ) ( not ( = ?auto_134999 ?auto_135004 ) ) ( not ( = ?auto_134999 ?auto_135005 ) ) ( not ( = ?auto_135000 ?auto_135001 ) ) ( not ( = ?auto_135000 ?auto_135002 ) ) ( not ( = ?auto_135000 ?auto_135003 ) ) ( not ( = ?auto_135000 ?auto_135004 ) ) ( not ( = ?auto_135000 ?auto_135005 ) ) ( not ( = ?auto_135001 ?auto_135002 ) ) ( not ( = ?auto_135001 ?auto_135003 ) ) ( not ( = ?auto_135001 ?auto_135004 ) ) ( not ( = ?auto_135001 ?auto_135005 ) ) ( not ( = ?auto_135002 ?auto_135003 ) ) ( not ( = ?auto_135002 ?auto_135004 ) ) ( not ( = ?auto_135002 ?auto_135005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135003 ?auto_135004 ?auto_135005 )
      ( MAKE-8CRATE-VERIFY ?auto_134997 ?auto_134998 ?auto_134999 ?auto_135000 ?auto_135001 ?auto_135002 ?auto_135003 ?auto_135004 ?auto_135005 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135081 - SURFACE
      ?auto_135082 - SURFACE
      ?auto_135083 - SURFACE
      ?auto_135084 - SURFACE
      ?auto_135085 - SURFACE
      ?auto_135086 - SURFACE
      ?auto_135087 - SURFACE
      ?auto_135088 - SURFACE
      ?auto_135089 - SURFACE
    )
    :vars
    (
      ?auto_135092 - HOIST
      ?auto_135093 - PLACE
      ?auto_135091 - TRUCK
      ?auto_135094 - PLACE
      ?auto_135090 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_135092 ?auto_135093 ) ( SURFACE-AT ?auto_135088 ?auto_135093 ) ( CLEAR ?auto_135088 ) ( IS-CRATE ?auto_135089 ) ( not ( = ?auto_135088 ?auto_135089 ) ) ( AVAILABLE ?auto_135092 ) ( ON ?auto_135088 ?auto_135087 ) ( not ( = ?auto_135087 ?auto_135088 ) ) ( not ( = ?auto_135087 ?auto_135089 ) ) ( TRUCK-AT ?auto_135091 ?auto_135094 ) ( not ( = ?auto_135094 ?auto_135093 ) ) ( HOIST-AT ?auto_135090 ?auto_135094 ) ( LIFTING ?auto_135090 ?auto_135089 ) ( not ( = ?auto_135092 ?auto_135090 ) ) ( ON ?auto_135082 ?auto_135081 ) ( ON ?auto_135083 ?auto_135082 ) ( ON ?auto_135084 ?auto_135083 ) ( ON ?auto_135085 ?auto_135084 ) ( ON ?auto_135086 ?auto_135085 ) ( ON ?auto_135087 ?auto_135086 ) ( not ( = ?auto_135081 ?auto_135082 ) ) ( not ( = ?auto_135081 ?auto_135083 ) ) ( not ( = ?auto_135081 ?auto_135084 ) ) ( not ( = ?auto_135081 ?auto_135085 ) ) ( not ( = ?auto_135081 ?auto_135086 ) ) ( not ( = ?auto_135081 ?auto_135087 ) ) ( not ( = ?auto_135081 ?auto_135088 ) ) ( not ( = ?auto_135081 ?auto_135089 ) ) ( not ( = ?auto_135082 ?auto_135083 ) ) ( not ( = ?auto_135082 ?auto_135084 ) ) ( not ( = ?auto_135082 ?auto_135085 ) ) ( not ( = ?auto_135082 ?auto_135086 ) ) ( not ( = ?auto_135082 ?auto_135087 ) ) ( not ( = ?auto_135082 ?auto_135088 ) ) ( not ( = ?auto_135082 ?auto_135089 ) ) ( not ( = ?auto_135083 ?auto_135084 ) ) ( not ( = ?auto_135083 ?auto_135085 ) ) ( not ( = ?auto_135083 ?auto_135086 ) ) ( not ( = ?auto_135083 ?auto_135087 ) ) ( not ( = ?auto_135083 ?auto_135088 ) ) ( not ( = ?auto_135083 ?auto_135089 ) ) ( not ( = ?auto_135084 ?auto_135085 ) ) ( not ( = ?auto_135084 ?auto_135086 ) ) ( not ( = ?auto_135084 ?auto_135087 ) ) ( not ( = ?auto_135084 ?auto_135088 ) ) ( not ( = ?auto_135084 ?auto_135089 ) ) ( not ( = ?auto_135085 ?auto_135086 ) ) ( not ( = ?auto_135085 ?auto_135087 ) ) ( not ( = ?auto_135085 ?auto_135088 ) ) ( not ( = ?auto_135085 ?auto_135089 ) ) ( not ( = ?auto_135086 ?auto_135087 ) ) ( not ( = ?auto_135086 ?auto_135088 ) ) ( not ( = ?auto_135086 ?auto_135089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135087 ?auto_135088 ?auto_135089 )
      ( MAKE-8CRATE-VERIFY ?auto_135081 ?auto_135082 ?auto_135083 ?auto_135084 ?auto_135085 ?auto_135086 ?auto_135087 ?auto_135088 ?auto_135089 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135173 - SURFACE
      ?auto_135174 - SURFACE
      ?auto_135175 - SURFACE
      ?auto_135176 - SURFACE
      ?auto_135177 - SURFACE
      ?auto_135178 - SURFACE
      ?auto_135179 - SURFACE
      ?auto_135180 - SURFACE
      ?auto_135181 - SURFACE
    )
    :vars
    (
      ?auto_135182 - HOIST
      ?auto_135185 - PLACE
      ?auto_135186 - TRUCK
      ?auto_135184 - PLACE
      ?auto_135183 - HOIST
      ?auto_135187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_135182 ?auto_135185 ) ( SURFACE-AT ?auto_135180 ?auto_135185 ) ( CLEAR ?auto_135180 ) ( IS-CRATE ?auto_135181 ) ( not ( = ?auto_135180 ?auto_135181 ) ) ( AVAILABLE ?auto_135182 ) ( ON ?auto_135180 ?auto_135179 ) ( not ( = ?auto_135179 ?auto_135180 ) ) ( not ( = ?auto_135179 ?auto_135181 ) ) ( TRUCK-AT ?auto_135186 ?auto_135184 ) ( not ( = ?auto_135184 ?auto_135185 ) ) ( HOIST-AT ?auto_135183 ?auto_135184 ) ( not ( = ?auto_135182 ?auto_135183 ) ) ( AVAILABLE ?auto_135183 ) ( SURFACE-AT ?auto_135181 ?auto_135184 ) ( ON ?auto_135181 ?auto_135187 ) ( CLEAR ?auto_135181 ) ( not ( = ?auto_135180 ?auto_135187 ) ) ( not ( = ?auto_135181 ?auto_135187 ) ) ( not ( = ?auto_135179 ?auto_135187 ) ) ( ON ?auto_135174 ?auto_135173 ) ( ON ?auto_135175 ?auto_135174 ) ( ON ?auto_135176 ?auto_135175 ) ( ON ?auto_135177 ?auto_135176 ) ( ON ?auto_135178 ?auto_135177 ) ( ON ?auto_135179 ?auto_135178 ) ( not ( = ?auto_135173 ?auto_135174 ) ) ( not ( = ?auto_135173 ?auto_135175 ) ) ( not ( = ?auto_135173 ?auto_135176 ) ) ( not ( = ?auto_135173 ?auto_135177 ) ) ( not ( = ?auto_135173 ?auto_135178 ) ) ( not ( = ?auto_135173 ?auto_135179 ) ) ( not ( = ?auto_135173 ?auto_135180 ) ) ( not ( = ?auto_135173 ?auto_135181 ) ) ( not ( = ?auto_135173 ?auto_135187 ) ) ( not ( = ?auto_135174 ?auto_135175 ) ) ( not ( = ?auto_135174 ?auto_135176 ) ) ( not ( = ?auto_135174 ?auto_135177 ) ) ( not ( = ?auto_135174 ?auto_135178 ) ) ( not ( = ?auto_135174 ?auto_135179 ) ) ( not ( = ?auto_135174 ?auto_135180 ) ) ( not ( = ?auto_135174 ?auto_135181 ) ) ( not ( = ?auto_135174 ?auto_135187 ) ) ( not ( = ?auto_135175 ?auto_135176 ) ) ( not ( = ?auto_135175 ?auto_135177 ) ) ( not ( = ?auto_135175 ?auto_135178 ) ) ( not ( = ?auto_135175 ?auto_135179 ) ) ( not ( = ?auto_135175 ?auto_135180 ) ) ( not ( = ?auto_135175 ?auto_135181 ) ) ( not ( = ?auto_135175 ?auto_135187 ) ) ( not ( = ?auto_135176 ?auto_135177 ) ) ( not ( = ?auto_135176 ?auto_135178 ) ) ( not ( = ?auto_135176 ?auto_135179 ) ) ( not ( = ?auto_135176 ?auto_135180 ) ) ( not ( = ?auto_135176 ?auto_135181 ) ) ( not ( = ?auto_135176 ?auto_135187 ) ) ( not ( = ?auto_135177 ?auto_135178 ) ) ( not ( = ?auto_135177 ?auto_135179 ) ) ( not ( = ?auto_135177 ?auto_135180 ) ) ( not ( = ?auto_135177 ?auto_135181 ) ) ( not ( = ?auto_135177 ?auto_135187 ) ) ( not ( = ?auto_135178 ?auto_135179 ) ) ( not ( = ?auto_135178 ?auto_135180 ) ) ( not ( = ?auto_135178 ?auto_135181 ) ) ( not ( = ?auto_135178 ?auto_135187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135179 ?auto_135180 ?auto_135181 )
      ( MAKE-8CRATE-VERIFY ?auto_135173 ?auto_135174 ?auto_135175 ?auto_135176 ?auto_135177 ?auto_135178 ?auto_135179 ?auto_135180 ?auto_135181 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135266 - SURFACE
      ?auto_135267 - SURFACE
      ?auto_135268 - SURFACE
      ?auto_135269 - SURFACE
      ?auto_135270 - SURFACE
      ?auto_135271 - SURFACE
      ?auto_135272 - SURFACE
      ?auto_135273 - SURFACE
      ?auto_135274 - SURFACE
    )
    :vars
    (
      ?auto_135275 - HOIST
      ?auto_135277 - PLACE
      ?auto_135280 - PLACE
      ?auto_135279 - HOIST
      ?auto_135278 - SURFACE
      ?auto_135276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135275 ?auto_135277 ) ( SURFACE-AT ?auto_135273 ?auto_135277 ) ( CLEAR ?auto_135273 ) ( IS-CRATE ?auto_135274 ) ( not ( = ?auto_135273 ?auto_135274 ) ) ( AVAILABLE ?auto_135275 ) ( ON ?auto_135273 ?auto_135272 ) ( not ( = ?auto_135272 ?auto_135273 ) ) ( not ( = ?auto_135272 ?auto_135274 ) ) ( not ( = ?auto_135280 ?auto_135277 ) ) ( HOIST-AT ?auto_135279 ?auto_135280 ) ( not ( = ?auto_135275 ?auto_135279 ) ) ( AVAILABLE ?auto_135279 ) ( SURFACE-AT ?auto_135274 ?auto_135280 ) ( ON ?auto_135274 ?auto_135278 ) ( CLEAR ?auto_135274 ) ( not ( = ?auto_135273 ?auto_135278 ) ) ( not ( = ?auto_135274 ?auto_135278 ) ) ( not ( = ?auto_135272 ?auto_135278 ) ) ( TRUCK-AT ?auto_135276 ?auto_135277 ) ( ON ?auto_135267 ?auto_135266 ) ( ON ?auto_135268 ?auto_135267 ) ( ON ?auto_135269 ?auto_135268 ) ( ON ?auto_135270 ?auto_135269 ) ( ON ?auto_135271 ?auto_135270 ) ( ON ?auto_135272 ?auto_135271 ) ( not ( = ?auto_135266 ?auto_135267 ) ) ( not ( = ?auto_135266 ?auto_135268 ) ) ( not ( = ?auto_135266 ?auto_135269 ) ) ( not ( = ?auto_135266 ?auto_135270 ) ) ( not ( = ?auto_135266 ?auto_135271 ) ) ( not ( = ?auto_135266 ?auto_135272 ) ) ( not ( = ?auto_135266 ?auto_135273 ) ) ( not ( = ?auto_135266 ?auto_135274 ) ) ( not ( = ?auto_135266 ?auto_135278 ) ) ( not ( = ?auto_135267 ?auto_135268 ) ) ( not ( = ?auto_135267 ?auto_135269 ) ) ( not ( = ?auto_135267 ?auto_135270 ) ) ( not ( = ?auto_135267 ?auto_135271 ) ) ( not ( = ?auto_135267 ?auto_135272 ) ) ( not ( = ?auto_135267 ?auto_135273 ) ) ( not ( = ?auto_135267 ?auto_135274 ) ) ( not ( = ?auto_135267 ?auto_135278 ) ) ( not ( = ?auto_135268 ?auto_135269 ) ) ( not ( = ?auto_135268 ?auto_135270 ) ) ( not ( = ?auto_135268 ?auto_135271 ) ) ( not ( = ?auto_135268 ?auto_135272 ) ) ( not ( = ?auto_135268 ?auto_135273 ) ) ( not ( = ?auto_135268 ?auto_135274 ) ) ( not ( = ?auto_135268 ?auto_135278 ) ) ( not ( = ?auto_135269 ?auto_135270 ) ) ( not ( = ?auto_135269 ?auto_135271 ) ) ( not ( = ?auto_135269 ?auto_135272 ) ) ( not ( = ?auto_135269 ?auto_135273 ) ) ( not ( = ?auto_135269 ?auto_135274 ) ) ( not ( = ?auto_135269 ?auto_135278 ) ) ( not ( = ?auto_135270 ?auto_135271 ) ) ( not ( = ?auto_135270 ?auto_135272 ) ) ( not ( = ?auto_135270 ?auto_135273 ) ) ( not ( = ?auto_135270 ?auto_135274 ) ) ( not ( = ?auto_135270 ?auto_135278 ) ) ( not ( = ?auto_135271 ?auto_135272 ) ) ( not ( = ?auto_135271 ?auto_135273 ) ) ( not ( = ?auto_135271 ?auto_135274 ) ) ( not ( = ?auto_135271 ?auto_135278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135272 ?auto_135273 ?auto_135274 )
      ( MAKE-8CRATE-VERIFY ?auto_135266 ?auto_135267 ?auto_135268 ?auto_135269 ?auto_135270 ?auto_135271 ?auto_135272 ?auto_135273 ?auto_135274 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135359 - SURFACE
      ?auto_135360 - SURFACE
      ?auto_135361 - SURFACE
      ?auto_135362 - SURFACE
      ?auto_135363 - SURFACE
      ?auto_135364 - SURFACE
      ?auto_135365 - SURFACE
      ?auto_135366 - SURFACE
      ?auto_135367 - SURFACE
    )
    :vars
    (
      ?auto_135370 - HOIST
      ?auto_135372 - PLACE
      ?auto_135373 - PLACE
      ?auto_135369 - HOIST
      ?auto_135368 - SURFACE
      ?auto_135371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135370 ?auto_135372 ) ( IS-CRATE ?auto_135367 ) ( not ( = ?auto_135366 ?auto_135367 ) ) ( not ( = ?auto_135365 ?auto_135366 ) ) ( not ( = ?auto_135365 ?auto_135367 ) ) ( not ( = ?auto_135373 ?auto_135372 ) ) ( HOIST-AT ?auto_135369 ?auto_135373 ) ( not ( = ?auto_135370 ?auto_135369 ) ) ( AVAILABLE ?auto_135369 ) ( SURFACE-AT ?auto_135367 ?auto_135373 ) ( ON ?auto_135367 ?auto_135368 ) ( CLEAR ?auto_135367 ) ( not ( = ?auto_135366 ?auto_135368 ) ) ( not ( = ?auto_135367 ?auto_135368 ) ) ( not ( = ?auto_135365 ?auto_135368 ) ) ( TRUCK-AT ?auto_135371 ?auto_135372 ) ( SURFACE-AT ?auto_135365 ?auto_135372 ) ( CLEAR ?auto_135365 ) ( LIFTING ?auto_135370 ?auto_135366 ) ( IS-CRATE ?auto_135366 ) ( ON ?auto_135360 ?auto_135359 ) ( ON ?auto_135361 ?auto_135360 ) ( ON ?auto_135362 ?auto_135361 ) ( ON ?auto_135363 ?auto_135362 ) ( ON ?auto_135364 ?auto_135363 ) ( ON ?auto_135365 ?auto_135364 ) ( not ( = ?auto_135359 ?auto_135360 ) ) ( not ( = ?auto_135359 ?auto_135361 ) ) ( not ( = ?auto_135359 ?auto_135362 ) ) ( not ( = ?auto_135359 ?auto_135363 ) ) ( not ( = ?auto_135359 ?auto_135364 ) ) ( not ( = ?auto_135359 ?auto_135365 ) ) ( not ( = ?auto_135359 ?auto_135366 ) ) ( not ( = ?auto_135359 ?auto_135367 ) ) ( not ( = ?auto_135359 ?auto_135368 ) ) ( not ( = ?auto_135360 ?auto_135361 ) ) ( not ( = ?auto_135360 ?auto_135362 ) ) ( not ( = ?auto_135360 ?auto_135363 ) ) ( not ( = ?auto_135360 ?auto_135364 ) ) ( not ( = ?auto_135360 ?auto_135365 ) ) ( not ( = ?auto_135360 ?auto_135366 ) ) ( not ( = ?auto_135360 ?auto_135367 ) ) ( not ( = ?auto_135360 ?auto_135368 ) ) ( not ( = ?auto_135361 ?auto_135362 ) ) ( not ( = ?auto_135361 ?auto_135363 ) ) ( not ( = ?auto_135361 ?auto_135364 ) ) ( not ( = ?auto_135361 ?auto_135365 ) ) ( not ( = ?auto_135361 ?auto_135366 ) ) ( not ( = ?auto_135361 ?auto_135367 ) ) ( not ( = ?auto_135361 ?auto_135368 ) ) ( not ( = ?auto_135362 ?auto_135363 ) ) ( not ( = ?auto_135362 ?auto_135364 ) ) ( not ( = ?auto_135362 ?auto_135365 ) ) ( not ( = ?auto_135362 ?auto_135366 ) ) ( not ( = ?auto_135362 ?auto_135367 ) ) ( not ( = ?auto_135362 ?auto_135368 ) ) ( not ( = ?auto_135363 ?auto_135364 ) ) ( not ( = ?auto_135363 ?auto_135365 ) ) ( not ( = ?auto_135363 ?auto_135366 ) ) ( not ( = ?auto_135363 ?auto_135367 ) ) ( not ( = ?auto_135363 ?auto_135368 ) ) ( not ( = ?auto_135364 ?auto_135365 ) ) ( not ( = ?auto_135364 ?auto_135366 ) ) ( not ( = ?auto_135364 ?auto_135367 ) ) ( not ( = ?auto_135364 ?auto_135368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135365 ?auto_135366 ?auto_135367 )
      ( MAKE-8CRATE-VERIFY ?auto_135359 ?auto_135360 ?auto_135361 ?auto_135362 ?auto_135363 ?auto_135364 ?auto_135365 ?auto_135366 ?auto_135367 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135452 - SURFACE
      ?auto_135453 - SURFACE
      ?auto_135454 - SURFACE
      ?auto_135455 - SURFACE
      ?auto_135456 - SURFACE
      ?auto_135457 - SURFACE
      ?auto_135458 - SURFACE
      ?auto_135459 - SURFACE
      ?auto_135460 - SURFACE
    )
    :vars
    (
      ?auto_135465 - HOIST
      ?auto_135464 - PLACE
      ?auto_135466 - PLACE
      ?auto_135463 - HOIST
      ?auto_135462 - SURFACE
      ?auto_135461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135465 ?auto_135464 ) ( IS-CRATE ?auto_135460 ) ( not ( = ?auto_135459 ?auto_135460 ) ) ( not ( = ?auto_135458 ?auto_135459 ) ) ( not ( = ?auto_135458 ?auto_135460 ) ) ( not ( = ?auto_135466 ?auto_135464 ) ) ( HOIST-AT ?auto_135463 ?auto_135466 ) ( not ( = ?auto_135465 ?auto_135463 ) ) ( AVAILABLE ?auto_135463 ) ( SURFACE-AT ?auto_135460 ?auto_135466 ) ( ON ?auto_135460 ?auto_135462 ) ( CLEAR ?auto_135460 ) ( not ( = ?auto_135459 ?auto_135462 ) ) ( not ( = ?auto_135460 ?auto_135462 ) ) ( not ( = ?auto_135458 ?auto_135462 ) ) ( TRUCK-AT ?auto_135461 ?auto_135464 ) ( SURFACE-AT ?auto_135458 ?auto_135464 ) ( CLEAR ?auto_135458 ) ( IS-CRATE ?auto_135459 ) ( AVAILABLE ?auto_135465 ) ( IN ?auto_135459 ?auto_135461 ) ( ON ?auto_135453 ?auto_135452 ) ( ON ?auto_135454 ?auto_135453 ) ( ON ?auto_135455 ?auto_135454 ) ( ON ?auto_135456 ?auto_135455 ) ( ON ?auto_135457 ?auto_135456 ) ( ON ?auto_135458 ?auto_135457 ) ( not ( = ?auto_135452 ?auto_135453 ) ) ( not ( = ?auto_135452 ?auto_135454 ) ) ( not ( = ?auto_135452 ?auto_135455 ) ) ( not ( = ?auto_135452 ?auto_135456 ) ) ( not ( = ?auto_135452 ?auto_135457 ) ) ( not ( = ?auto_135452 ?auto_135458 ) ) ( not ( = ?auto_135452 ?auto_135459 ) ) ( not ( = ?auto_135452 ?auto_135460 ) ) ( not ( = ?auto_135452 ?auto_135462 ) ) ( not ( = ?auto_135453 ?auto_135454 ) ) ( not ( = ?auto_135453 ?auto_135455 ) ) ( not ( = ?auto_135453 ?auto_135456 ) ) ( not ( = ?auto_135453 ?auto_135457 ) ) ( not ( = ?auto_135453 ?auto_135458 ) ) ( not ( = ?auto_135453 ?auto_135459 ) ) ( not ( = ?auto_135453 ?auto_135460 ) ) ( not ( = ?auto_135453 ?auto_135462 ) ) ( not ( = ?auto_135454 ?auto_135455 ) ) ( not ( = ?auto_135454 ?auto_135456 ) ) ( not ( = ?auto_135454 ?auto_135457 ) ) ( not ( = ?auto_135454 ?auto_135458 ) ) ( not ( = ?auto_135454 ?auto_135459 ) ) ( not ( = ?auto_135454 ?auto_135460 ) ) ( not ( = ?auto_135454 ?auto_135462 ) ) ( not ( = ?auto_135455 ?auto_135456 ) ) ( not ( = ?auto_135455 ?auto_135457 ) ) ( not ( = ?auto_135455 ?auto_135458 ) ) ( not ( = ?auto_135455 ?auto_135459 ) ) ( not ( = ?auto_135455 ?auto_135460 ) ) ( not ( = ?auto_135455 ?auto_135462 ) ) ( not ( = ?auto_135456 ?auto_135457 ) ) ( not ( = ?auto_135456 ?auto_135458 ) ) ( not ( = ?auto_135456 ?auto_135459 ) ) ( not ( = ?auto_135456 ?auto_135460 ) ) ( not ( = ?auto_135456 ?auto_135462 ) ) ( not ( = ?auto_135457 ?auto_135458 ) ) ( not ( = ?auto_135457 ?auto_135459 ) ) ( not ( = ?auto_135457 ?auto_135460 ) ) ( not ( = ?auto_135457 ?auto_135462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135458 ?auto_135459 ?auto_135460 )
      ( MAKE-8CRATE-VERIFY ?auto_135452 ?auto_135453 ?auto_135454 ?auto_135455 ?auto_135456 ?auto_135457 ?auto_135458 ?auto_135459 ?auto_135460 ) )
  )

)

