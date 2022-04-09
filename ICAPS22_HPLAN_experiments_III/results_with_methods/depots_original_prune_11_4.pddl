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
      ?auto_554915 - SURFACE
      ?auto_554916 - SURFACE
    )
    :vars
    (
      ?auto_554917 - HOIST
      ?auto_554918 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554917 ?auto_554918 ) ( SURFACE-AT ?auto_554915 ?auto_554918 ) ( CLEAR ?auto_554915 ) ( LIFTING ?auto_554917 ?auto_554916 ) ( IS-CRATE ?auto_554916 ) ( not ( = ?auto_554915 ?auto_554916 ) ) )
    :subtasks
    ( ( !DROP ?auto_554917 ?auto_554916 ?auto_554915 ?auto_554918 )
      ( MAKE-1CRATE-VERIFY ?auto_554915 ?auto_554916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554919 - SURFACE
      ?auto_554920 - SURFACE
    )
    :vars
    (
      ?auto_554922 - HOIST
      ?auto_554921 - PLACE
      ?auto_554923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554922 ?auto_554921 ) ( SURFACE-AT ?auto_554919 ?auto_554921 ) ( CLEAR ?auto_554919 ) ( IS-CRATE ?auto_554920 ) ( not ( = ?auto_554919 ?auto_554920 ) ) ( TRUCK-AT ?auto_554923 ?auto_554921 ) ( AVAILABLE ?auto_554922 ) ( IN ?auto_554920 ?auto_554923 ) )
    :subtasks
    ( ( !UNLOAD ?auto_554922 ?auto_554920 ?auto_554923 ?auto_554921 )
      ( MAKE-1CRATE ?auto_554919 ?auto_554920 )
      ( MAKE-1CRATE-VERIFY ?auto_554919 ?auto_554920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554924 - SURFACE
      ?auto_554925 - SURFACE
    )
    :vars
    (
      ?auto_554928 - HOIST
      ?auto_554927 - PLACE
      ?auto_554926 - TRUCK
      ?auto_554929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554928 ?auto_554927 ) ( SURFACE-AT ?auto_554924 ?auto_554927 ) ( CLEAR ?auto_554924 ) ( IS-CRATE ?auto_554925 ) ( not ( = ?auto_554924 ?auto_554925 ) ) ( AVAILABLE ?auto_554928 ) ( IN ?auto_554925 ?auto_554926 ) ( TRUCK-AT ?auto_554926 ?auto_554929 ) ( not ( = ?auto_554929 ?auto_554927 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_554926 ?auto_554929 ?auto_554927 )
      ( MAKE-1CRATE ?auto_554924 ?auto_554925 )
      ( MAKE-1CRATE-VERIFY ?auto_554924 ?auto_554925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554930 - SURFACE
      ?auto_554931 - SURFACE
    )
    :vars
    (
      ?auto_554933 - HOIST
      ?auto_554935 - PLACE
      ?auto_554932 - TRUCK
      ?auto_554934 - PLACE
      ?auto_554936 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_554933 ?auto_554935 ) ( SURFACE-AT ?auto_554930 ?auto_554935 ) ( CLEAR ?auto_554930 ) ( IS-CRATE ?auto_554931 ) ( not ( = ?auto_554930 ?auto_554931 ) ) ( AVAILABLE ?auto_554933 ) ( TRUCK-AT ?auto_554932 ?auto_554934 ) ( not ( = ?auto_554934 ?auto_554935 ) ) ( HOIST-AT ?auto_554936 ?auto_554934 ) ( LIFTING ?auto_554936 ?auto_554931 ) ( not ( = ?auto_554933 ?auto_554936 ) ) )
    :subtasks
    ( ( !LOAD ?auto_554936 ?auto_554931 ?auto_554932 ?auto_554934 )
      ( MAKE-1CRATE ?auto_554930 ?auto_554931 )
      ( MAKE-1CRATE-VERIFY ?auto_554930 ?auto_554931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554937 - SURFACE
      ?auto_554938 - SURFACE
    )
    :vars
    (
      ?auto_554939 - HOIST
      ?auto_554940 - PLACE
      ?auto_554943 - TRUCK
      ?auto_554941 - PLACE
      ?auto_554942 - HOIST
      ?auto_554944 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554939 ?auto_554940 ) ( SURFACE-AT ?auto_554937 ?auto_554940 ) ( CLEAR ?auto_554937 ) ( IS-CRATE ?auto_554938 ) ( not ( = ?auto_554937 ?auto_554938 ) ) ( AVAILABLE ?auto_554939 ) ( TRUCK-AT ?auto_554943 ?auto_554941 ) ( not ( = ?auto_554941 ?auto_554940 ) ) ( HOIST-AT ?auto_554942 ?auto_554941 ) ( not ( = ?auto_554939 ?auto_554942 ) ) ( AVAILABLE ?auto_554942 ) ( SURFACE-AT ?auto_554938 ?auto_554941 ) ( ON ?auto_554938 ?auto_554944 ) ( CLEAR ?auto_554938 ) ( not ( = ?auto_554937 ?auto_554944 ) ) ( not ( = ?auto_554938 ?auto_554944 ) ) )
    :subtasks
    ( ( !LIFT ?auto_554942 ?auto_554938 ?auto_554944 ?auto_554941 )
      ( MAKE-1CRATE ?auto_554937 ?auto_554938 )
      ( MAKE-1CRATE-VERIFY ?auto_554937 ?auto_554938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554945 - SURFACE
      ?auto_554946 - SURFACE
    )
    :vars
    (
      ?auto_554950 - HOIST
      ?auto_554949 - PLACE
      ?auto_554948 - PLACE
      ?auto_554947 - HOIST
      ?auto_554952 - SURFACE
      ?auto_554951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554950 ?auto_554949 ) ( SURFACE-AT ?auto_554945 ?auto_554949 ) ( CLEAR ?auto_554945 ) ( IS-CRATE ?auto_554946 ) ( not ( = ?auto_554945 ?auto_554946 ) ) ( AVAILABLE ?auto_554950 ) ( not ( = ?auto_554948 ?auto_554949 ) ) ( HOIST-AT ?auto_554947 ?auto_554948 ) ( not ( = ?auto_554950 ?auto_554947 ) ) ( AVAILABLE ?auto_554947 ) ( SURFACE-AT ?auto_554946 ?auto_554948 ) ( ON ?auto_554946 ?auto_554952 ) ( CLEAR ?auto_554946 ) ( not ( = ?auto_554945 ?auto_554952 ) ) ( not ( = ?auto_554946 ?auto_554952 ) ) ( TRUCK-AT ?auto_554951 ?auto_554949 ) )
    :subtasks
    ( ( !DRIVE ?auto_554951 ?auto_554949 ?auto_554948 )
      ( MAKE-1CRATE ?auto_554945 ?auto_554946 )
      ( MAKE-1CRATE-VERIFY ?auto_554945 ?auto_554946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554962 - SURFACE
      ?auto_554963 - SURFACE
      ?auto_554964 - SURFACE
    )
    :vars
    (
      ?auto_554965 - HOIST
      ?auto_554966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554965 ?auto_554966 ) ( SURFACE-AT ?auto_554963 ?auto_554966 ) ( CLEAR ?auto_554963 ) ( LIFTING ?auto_554965 ?auto_554964 ) ( IS-CRATE ?auto_554964 ) ( not ( = ?auto_554963 ?auto_554964 ) ) ( ON ?auto_554963 ?auto_554962 ) ( not ( = ?auto_554962 ?auto_554963 ) ) ( not ( = ?auto_554962 ?auto_554964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554963 ?auto_554964 )
      ( MAKE-2CRATE-VERIFY ?auto_554962 ?auto_554963 ?auto_554964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554972 - SURFACE
      ?auto_554973 - SURFACE
      ?auto_554974 - SURFACE
    )
    :vars
    (
      ?auto_554977 - HOIST
      ?auto_554975 - PLACE
      ?auto_554976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554977 ?auto_554975 ) ( SURFACE-AT ?auto_554973 ?auto_554975 ) ( CLEAR ?auto_554973 ) ( IS-CRATE ?auto_554974 ) ( not ( = ?auto_554973 ?auto_554974 ) ) ( TRUCK-AT ?auto_554976 ?auto_554975 ) ( AVAILABLE ?auto_554977 ) ( IN ?auto_554974 ?auto_554976 ) ( ON ?auto_554973 ?auto_554972 ) ( not ( = ?auto_554972 ?auto_554973 ) ) ( not ( = ?auto_554972 ?auto_554974 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554973 ?auto_554974 )
      ( MAKE-2CRATE-VERIFY ?auto_554972 ?auto_554973 ?auto_554974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554978 - SURFACE
      ?auto_554979 - SURFACE
    )
    :vars
    (
      ?auto_554980 - HOIST
      ?auto_554981 - PLACE
      ?auto_554983 - TRUCK
      ?auto_554982 - SURFACE
      ?auto_554984 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554980 ?auto_554981 ) ( SURFACE-AT ?auto_554978 ?auto_554981 ) ( CLEAR ?auto_554978 ) ( IS-CRATE ?auto_554979 ) ( not ( = ?auto_554978 ?auto_554979 ) ) ( AVAILABLE ?auto_554980 ) ( IN ?auto_554979 ?auto_554983 ) ( ON ?auto_554978 ?auto_554982 ) ( not ( = ?auto_554982 ?auto_554978 ) ) ( not ( = ?auto_554982 ?auto_554979 ) ) ( TRUCK-AT ?auto_554983 ?auto_554984 ) ( not ( = ?auto_554984 ?auto_554981 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_554983 ?auto_554984 ?auto_554981 )
      ( MAKE-2CRATE ?auto_554982 ?auto_554978 ?auto_554979 )
      ( MAKE-1CRATE-VERIFY ?auto_554978 ?auto_554979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554985 - SURFACE
      ?auto_554986 - SURFACE
      ?auto_554987 - SURFACE
    )
    :vars
    (
      ?auto_554989 - HOIST
      ?auto_554990 - PLACE
      ?auto_554988 - TRUCK
      ?auto_554991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554989 ?auto_554990 ) ( SURFACE-AT ?auto_554986 ?auto_554990 ) ( CLEAR ?auto_554986 ) ( IS-CRATE ?auto_554987 ) ( not ( = ?auto_554986 ?auto_554987 ) ) ( AVAILABLE ?auto_554989 ) ( IN ?auto_554987 ?auto_554988 ) ( ON ?auto_554986 ?auto_554985 ) ( not ( = ?auto_554985 ?auto_554986 ) ) ( not ( = ?auto_554985 ?auto_554987 ) ) ( TRUCK-AT ?auto_554988 ?auto_554991 ) ( not ( = ?auto_554991 ?auto_554990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554986 ?auto_554987 )
      ( MAKE-2CRATE-VERIFY ?auto_554985 ?auto_554986 ?auto_554987 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554992 - SURFACE
      ?auto_554993 - SURFACE
    )
    :vars
    (
      ?auto_554997 - HOIST
      ?auto_554994 - PLACE
      ?auto_554995 - SURFACE
      ?auto_554996 - TRUCK
      ?auto_554998 - PLACE
      ?auto_554999 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_554997 ?auto_554994 ) ( SURFACE-AT ?auto_554992 ?auto_554994 ) ( CLEAR ?auto_554992 ) ( IS-CRATE ?auto_554993 ) ( not ( = ?auto_554992 ?auto_554993 ) ) ( AVAILABLE ?auto_554997 ) ( ON ?auto_554992 ?auto_554995 ) ( not ( = ?auto_554995 ?auto_554992 ) ) ( not ( = ?auto_554995 ?auto_554993 ) ) ( TRUCK-AT ?auto_554996 ?auto_554998 ) ( not ( = ?auto_554998 ?auto_554994 ) ) ( HOIST-AT ?auto_554999 ?auto_554998 ) ( LIFTING ?auto_554999 ?auto_554993 ) ( not ( = ?auto_554997 ?auto_554999 ) ) )
    :subtasks
    ( ( !LOAD ?auto_554999 ?auto_554993 ?auto_554996 ?auto_554998 )
      ( MAKE-2CRATE ?auto_554995 ?auto_554992 ?auto_554993 )
      ( MAKE-1CRATE-VERIFY ?auto_554992 ?auto_554993 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555000 - SURFACE
      ?auto_555001 - SURFACE
      ?auto_555002 - SURFACE
    )
    :vars
    (
      ?auto_555005 - HOIST
      ?auto_555006 - PLACE
      ?auto_555007 - TRUCK
      ?auto_555004 - PLACE
      ?auto_555003 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555005 ?auto_555006 ) ( SURFACE-AT ?auto_555001 ?auto_555006 ) ( CLEAR ?auto_555001 ) ( IS-CRATE ?auto_555002 ) ( not ( = ?auto_555001 ?auto_555002 ) ) ( AVAILABLE ?auto_555005 ) ( ON ?auto_555001 ?auto_555000 ) ( not ( = ?auto_555000 ?auto_555001 ) ) ( not ( = ?auto_555000 ?auto_555002 ) ) ( TRUCK-AT ?auto_555007 ?auto_555004 ) ( not ( = ?auto_555004 ?auto_555006 ) ) ( HOIST-AT ?auto_555003 ?auto_555004 ) ( LIFTING ?auto_555003 ?auto_555002 ) ( not ( = ?auto_555005 ?auto_555003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555001 ?auto_555002 )
      ( MAKE-2CRATE-VERIFY ?auto_555000 ?auto_555001 ?auto_555002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555008 - SURFACE
      ?auto_555009 - SURFACE
    )
    :vars
    (
      ?auto_555012 - HOIST
      ?auto_555010 - PLACE
      ?auto_555011 - SURFACE
      ?auto_555014 - TRUCK
      ?auto_555015 - PLACE
      ?auto_555013 - HOIST
      ?auto_555016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555012 ?auto_555010 ) ( SURFACE-AT ?auto_555008 ?auto_555010 ) ( CLEAR ?auto_555008 ) ( IS-CRATE ?auto_555009 ) ( not ( = ?auto_555008 ?auto_555009 ) ) ( AVAILABLE ?auto_555012 ) ( ON ?auto_555008 ?auto_555011 ) ( not ( = ?auto_555011 ?auto_555008 ) ) ( not ( = ?auto_555011 ?auto_555009 ) ) ( TRUCK-AT ?auto_555014 ?auto_555015 ) ( not ( = ?auto_555015 ?auto_555010 ) ) ( HOIST-AT ?auto_555013 ?auto_555015 ) ( not ( = ?auto_555012 ?auto_555013 ) ) ( AVAILABLE ?auto_555013 ) ( SURFACE-AT ?auto_555009 ?auto_555015 ) ( ON ?auto_555009 ?auto_555016 ) ( CLEAR ?auto_555009 ) ( not ( = ?auto_555008 ?auto_555016 ) ) ( not ( = ?auto_555009 ?auto_555016 ) ) ( not ( = ?auto_555011 ?auto_555016 ) ) )
    :subtasks
    ( ( !LIFT ?auto_555013 ?auto_555009 ?auto_555016 ?auto_555015 )
      ( MAKE-2CRATE ?auto_555011 ?auto_555008 ?auto_555009 )
      ( MAKE-1CRATE-VERIFY ?auto_555008 ?auto_555009 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555017 - SURFACE
      ?auto_555018 - SURFACE
      ?auto_555019 - SURFACE
    )
    :vars
    (
      ?auto_555024 - HOIST
      ?auto_555025 - PLACE
      ?auto_555020 - TRUCK
      ?auto_555021 - PLACE
      ?auto_555022 - HOIST
      ?auto_555023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555024 ?auto_555025 ) ( SURFACE-AT ?auto_555018 ?auto_555025 ) ( CLEAR ?auto_555018 ) ( IS-CRATE ?auto_555019 ) ( not ( = ?auto_555018 ?auto_555019 ) ) ( AVAILABLE ?auto_555024 ) ( ON ?auto_555018 ?auto_555017 ) ( not ( = ?auto_555017 ?auto_555018 ) ) ( not ( = ?auto_555017 ?auto_555019 ) ) ( TRUCK-AT ?auto_555020 ?auto_555021 ) ( not ( = ?auto_555021 ?auto_555025 ) ) ( HOIST-AT ?auto_555022 ?auto_555021 ) ( not ( = ?auto_555024 ?auto_555022 ) ) ( AVAILABLE ?auto_555022 ) ( SURFACE-AT ?auto_555019 ?auto_555021 ) ( ON ?auto_555019 ?auto_555023 ) ( CLEAR ?auto_555019 ) ( not ( = ?auto_555018 ?auto_555023 ) ) ( not ( = ?auto_555019 ?auto_555023 ) ) ( not ( = ?auto_555017 ?auto_555023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555018 ?auto_555019 )
      ( MAKE-2CRATE-VERIFY ?auto_555017 ?auto_555018 ?auto_555019 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555026 - SURFACE
      ?auto_555027 - SURFACE
    )
    :vars
    (
      ?auto_555029 - HOIST
      ?auto_555032 - PLACE
      ?auto_555030 - SURFACE
      ?auto_555033 - PLACE
      ?auto_555031 - HOIST
      ?auto_555034 - SURFACE
      ?auto_555028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555029 ?auto_555032 ) ( SURFACE-AT ?auto_555026 ?auto_555032 ) ( CLEAR ?auto_555026 ) ( IS-CRATE ?auto_555027 ) ( not ( = ?auto_555026 ?auto_555027 ) ) ( AVAILABLE ?auto_555029 ) ( ON ?auto_555026 ?auto_555030 ) ( not ( = ?auto_555030 ?auto_555026 ) ) ( not ( = ?auto_555030 ?auto_555027 ) ) ( not ( = ?auto_555033 ?auto_555032 ) ) ( HOIST-AT ?auto_555031 ?auto_555033 ) ( not ( = ?auto_555029 ?auto_555031 ) ) ( AVAILABLE ?auto_555031 ) ( SURFACE-AT ?auto_555027 ?auto_555033 ) ( ON ?auto_555027 ?auto_555034 ) ( CLEAR ?auto_555027 ) ( not ( = ?auto_555026 ?auto_555034 ) ) ( not ( = ?auto_555027 ?auto_555034 ) ) ( not ( = ?auto_555030 ?auto_555034 ) ) ( TRUCK-AT ?auto_555028 ?auto_555032 ) )
    :subtasks
    ( ( !DRIVE ?auto_555028 ?auto_555032 ?auto_555033 )
      ( MAKE-2CRATE ?auto_555030 ?auto_555026 ?auto_555027 )
      ( MAKE-1CRATE-VERIFY ?auto_555026 ?auto_555027 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555035 - SURFACE
      ?auto_555036 - SURFACE
      ?auto_555037 - SURFACE
    )
    :vars
    (
      ?auto_555040 - HOIST
      ?auto_555043 - PLACE
      ?auto_555042 - PLACE
      ?auto_555041 - HOIST
      ?auto_555038 - SURFACE
      ?auto_555039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555040 ?auto_555043 ) ( SURFACE-AT ?auto_555036 ?auto_555043 ) ( CLEAR ?auto_555036 ) ( IS-CRATE ?auto_555037 ) ( not ( = ?auto_555036 ?auto_555037 ) ) ( AVAILABLE ?auto_555040 ) ( ON ?auto_555036 ?auto_555035 ) ( not ( = ?auto_555035 ?auto_555036 ) ) ( not ( = ?auto_555035 ?auto_555037 ) ) ( not ( = ?auto_555042 ?auto_555043 ) ) ( HOIST-AT ?auto_555041 ?auto_555042 ) ( not ( = ?auto_555040 ?auto_555041 ) ) ( AVAILABLE ?auto_555041 ) ( SURFACE-AT ?auto_555037 ?auto_555042 ) ( ON ?auto_555037 ?auto_555038 ) ( CLEAR ?auto_555037 ) ( not ( = ?auto_555036 ?auto_555038 ) ) ( not ( = ?auto_555037 ?auto_555038 ) ) ( not ( = ?auto_555035 ?auto_555038 ) ) ( TRUCK-AT ?auto_555039 ?auto_555043 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555036 ?auto_555037 )
      ( MAKE-2CRATE-VERIFY ?auto_555035 ?auto_555036 ?auto_555037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555044 - SURFACE
      ?auto_555045 - SURFACE
    )
    :vars
    (
      ?auto_555049 - HOIST
      ?auto_555046 - PLACE
      ?auto_555052 - SURFACE
      ?auto_555050 - PLACE
      ?auto_555051 - HOIST
      ?auto_555047 - SURFACE
      ?auto_555048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555049 ?auto_555046 ) ( IS-CRATE ?auto_555045 ) ( not ( = ?auto_555044 ?auto_555045 ) ) ( not ( = ?auto_555052 ?auto_555044 ) ) ( not ( = ?auto_555052 ?auto_555045 ) ) ( not ( = ?auto_555050 ?auto_555046 ) ) ( HOIST-AT ?auto_555051 ?auto_555050 ) ( not ( = ?auto_555049 ?auto_555051 ) ) ( AVAILABLE ?auto_555051 ) ( SURFACE-AT ?auto_555045 ?auto_555050 ) ( ON ?auto_555045 ?auto_555047 ) ( CLEAR ?auto_555045 ) ( not ( = ?auto_555044 ?auto_555047 ) ) ( not ( = ?auto_555045 ?auto_555047 ) ) ( not ( = ?auto_555052 ?auto_555047 ) ) ( TRUCK-AT ?auto_555048 ?auto_555046 ) ( SURFACE-AT ?auto_555052 ?auto_555046 ) ( CLEAR ?auto_555052 ) ( LIFTING ?auto_555049 ?auto_555044 ) ( IS-CRATE ?auto_555044 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555052 ?auto_555044 )
      ( MAKE-2CRATE ?auto_555052 ?auto_555044 ?auto_555045 )
      ( MAKE-1CRATE-VERIFY ?auto_555044 ?auto_555045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555053 - SURFACE
      ?auto_555054 - SURFACE
      ?auto_555055 - SURFACE
    )
    :vars
    (
      ?auto_555057 - HOIST
      ?auto_555058 - PLACE
      ?auto_555061 - PLACE
      ?auto_555059 - HOIST
      ?auto_555056 - SURFACE
      ?auto_555060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555057 ?auto_555058 ) ( IS-CRATE ?auto_555055 ) ( not ( = ?auto_555054 ?auto_555055 ) ) ( not ( = ?auto_555053 ?auto_555054 ) ) ( not ( = ?auto_555053 ?auto_555055 ) ) ( not ( = ?auto_555061 ?auto_555058 ) ) ( HOIST-AT ?auto_555059 ?auto_555061 ) ( not ( = ?auto_555057 ?auto_555059 ) ) ( AVAILABLE ?auto_555059 ) ( SURFACE-AT ?auto_555055 ?auto_555061 ) ( ON ?auto_555055 ?auto_555056 ) ( CLEAR ?auto_555055 ) ( not ( = ?auto_555054 ?auto_555056 ) ) ( not ( = ?auto_555055 ?auto_555056 ) ) ( not ( = ?auto_555053 ?auto_555056 ) ) ( TRUCK-AT ?auto_555060 ?auto_555058 ) ( SURFACE-AT ?auto_555053 ?auto_555058 ) ( CLEAR ?auto_555053 ) ( LIFTING ?auto_555057 ?auto_555054 ) ( IS-CRATE ?auto_555054 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555054 ?auto_555055 )
      ( MAKE-2CRATE-VERIFY ?auto_555053 ?auto_555054 ?auto_555055 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555062 - SURFACE
      ?auto_555063 - SURFACE
    )
    :vars
    (
      ?auto_555065 - HOIST
      ?auto_555068 - PLACE
      ?auto_555067 - SURFACE
      ?auto_555064 - PLACE
      ?auto_555069 - HOIST
      ?auto_555070 - SURFACE
      ?auto_555066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555065 ?auto_555068 ) ( IS-CRATE ?auto_555063 ) ( not ( = ?auto_555062 ?auto_555063 ) ) ( not ( = ?auto_555067 ?auto_555062 ) ) ( not ( = ?auto_555067 ?auto_555063 ) ) ( not ( = ?auto_555064 ?auto_555068 ) ) ( HOIST-AT ?auto_555069 ?auto_555064 ) ( not ( = ?auto_555065 ?auto_555069 ) ) ( AVAILABLE ?auto_555069 ) ( SURFACE-AT ?auto_555063 ?auto_555064 ) ( ON ?auto_555063 ?auto_555070 ) ( CLEAR ?auto_555063 ) ( not ( = ?auto_555062 ?auto_555070 ) ) ( not ( = ?auto_555063 ?auto_555070 ) ) ( not ( = ?auto_555067 ?auto_555070 ) ) ( TRUCK-AT ?auto_555066 ?auto_555068 ) ( SURFACE-AT ?auto_555067 ?auto_555068 ) ( CLEAR ?auto_555067 ) ( IS-CRATE ?auto_555062 ) ( AVAILABLE ?auto_555065 ) ( IN ?auto_555062 ?auto_555066 ) )
    :subtasks
    ( ( !UNLOAD ?auto_555065 ?auto_555062 ?auto_555066 ?auto_555068 )
      ( MAKE-2CRATE ?auto_555067 ?auto_555062 ?auto_555063 )
      ( MAKE-1CRATE-VERIFY ?auto_555062 ?auto_555063 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_555071 - SURFACE
      ?auto_555072 - SURFACE
      ?auto_555073 - SURFACE
    )
    :vars
    (
      ?auto_555077 - HOIST
      ?auto_555079 - PLACE
      ?auto_555076 - PLACE
      ?auto_555075 - HOIST
      ?auto_555078 - SURFACE
      ?auto_555074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555077 ?auto_555079 ) ( IS-CRATE ?auto_555073 ) ( not ( = ?auto_555072 ?auto_555073 ) ) ( not ( = ?auto_555071 ?auto_555072 ) ) ( not ( = ?auto_555071 ?auto_555073 ) ) ( not ( = ?auto_555076 ?auto_555079 ) ) ( HOIST-AT ?auto_555075 ?auto_555076 ) ( not ( = ?auto_555077 ?auto_555075 ) ) ( AVAILABLE ?auto_555075 ) ( SURFACE-AT ?auto_555073 ?auto_555076 ) ( ON ?auto_555073 ?auto_555078 ) ( CLEAR ?auto_555073 ) ( not ( = ?auto_555072 ?auto_555078 ) ) ( not ( = ?auto_555073 ?auto_555078 ) ) ( not ( = ?auto_555071 ?auto_555078 ) ) ( TRUCK-AT ?auto_555074 ?auto_555079 ) ( SURFACE-AT ?auto_555071 ?auto_555079 ) ( CLEAR ?auto_555071 ) ( IS-CRATE ?auto_555072 ) ( AVAILABLE ?auto_555077 ) ( IN ?auto_555072 ?auto_555074 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555072 ?auto_555073 )
      ( MAKE-2CRATE-VERIFY ?auto_555071 ?auto_555072 ?auto_555073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555116 - SURFACE
      ?auto_555117 - SURFACE
    )
    :vars
    (
      ?auto_555120 - HOIST
      ?auto_555124 - PLACE
      ?auto_555119 - SURFACE
      ?auto_555123 - PLACE
      ?auto_555118 - HOIST
      ?auto_555121 - SURFACE
      ?auto_555122 - TRUCK
      ?auto_555125 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555120 ?auto_555124 ) ( SURFACE-AT ?auto_555116 ?auto_555124 ) ( CLEAR ?auto_555116 ) ( IS-CRATE ?auto_555117 ) ( not ( = ?auto_555116 ?auto_555117 ) ) ( AVAILABLE ?auto_555120 ) ( ON ?auto_555116 ?auto_555119 ) ( not ( = ?auto_555119 ?auto_555116 ) ) ( not ( = ?auto_555119 ?auto_555117 ) ) ( not ( = ?auto_555123 ?auto_555124 ) ) ( HOIST-AT ?auto_555118 ?auto_555123 ) ( not ( = ?auto_555120 ?auto_555118 ) ) ( AVAILABLE ?auto_555118 ) ( SURFACE-AT ?auto_555117 ?auto_555123 ) ( ON ?auto_555117 ?auto_555121 ) ( CLEAR ?auto_555117 ) ( not ( = ?auto_555116 ?auto_555121 ) ) ( not ( = ?auto_555117 ?auto_555121 ) ) ( not ( = ?auto_555119 ?auto_555121 ) ) ( TRUCK-AT ?auto_555122 ?auto_555125 ) ( not ( = ?auto_555125 ?auto_555124 ) ) ( not ( = ?auto_555123 ?auto_555125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_555122 ?auto_555125 ?auto_555124 )
      ( MAKE-1CRATE ?auto_555116 ?auto_555117 )
      ( MAKE-1CRATE-VERIFY ?auto_555116 ?auto_555117 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555155 - SURFACE
      ?auto_555156 - SURFACE
      ?auto_555157 - SURFACE
      ?auto_555158 - SURFACE
    )
    :vars
    (
      ?auto_555160 - HOIST
      ?auto_555159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555160 ?auto_555159 ) ( SURFACE-AT ?auto_555157 ?auto_555159 ) ( CLEAR ?auto_555157 ) ( LIFTING ?auto_555160 ?auto_555158 ) ( IS-CRATE ?auto_555158 ) ( not ( = ?auto_555157 ?auto_555158 ) ) ( ON ?auto_555156 ?auto_555155 ) ( ON ?auto_555157 ?auto_555156 ) ( not ( = ?auto_555155 ?auto_555156 ) ) ( not ( = ?auto_555155 ?auto_555157 ) ) ( not ( = ?auto_555155 ?auto_555158 ) ) ( not ( = ?auto_555156 ?auto_555157 ) ) ( not ( = ?auto_555156 ?auto_555158 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555157 ?auto_555158 )
      ( MAKE-3CRATE-VERIFY ?auto_555155 ?auto_555156 ?auto_555157 ?auto_555158 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555172 - SURFACE
      ?auto_555173 - SURFACE
      ?auto_555174 - SURFACE
      ?auto_555175 - SURFACE
    )
    :vars
    (
      ?auto_555177 - HOIST
      ?auto_555178 - PLACE
      ?auto_555176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555177 ?auto_555178 ) ( SURFACE-AT ?auto_555174 ?auto_555178 ) ( CLEAR ?auto_555174 ) ( IS-CRATE ?auto_555175 ) ( not ( = ?auto_555174 ?auto_555175 ) ) ( TRUCK-AT ?auto_555176 ?auto_555178 ) ( AVAILABLE ?auto_555177 ) ( IN ?auto_555175 ?auto_555176 ) ( ON ?auto_555174 ?auto_555173 ) ( not ( = ?auto_555173 ?auto_555174 ) ) ( not ( = ?auto_555173 ?auto_555175 ) ) ( ON ?auto_555173 ?auto_555172 ) ( not ( = ?auto_555172 ?auto_555173 ) ) ( not ( = ?auto_555172 ?auto_555174 ) ) ( not ( = ?auto_555172 ?auto_555175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555173 ?auto_555174 ?auto_555175 )
      ( MAKE-3CRATE-VERIFY ?auto_555172 ?auto_555173 ?auto_555174 ?auto_555175 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555193 - SURFACE
      ?auto_555194 - SURFACE
      ?auto_555195 - SURFACE
      ?auto_555196 - SURFACE
    )
    :vars
    (
      ?auto_555199 - HOIST
      ?auto_555197 - PLACE
      ?auto_555200 - TRUCK
      ?auto_555198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555199 ?auto_555197 ) ( SURFACE-AT ?auto_555195 ?auto_555197 ) ( CLEAR ?auto_555195 ) ( IS-CRATE ?auto_555196 ) ( not ( = ?auto_555195 ?auto_555196 ) ) ( AVAILABLE ?auto_555199 ) ( IN ?auto_555196 ?auto_555200 ) ( ON ?auto_555195 ?auto_555194 ) ( not ( = ?auto_555194 ?auto_555195 ) ) ( not ( = ?auto_555194 ?auto_555196 ) ) ( TRUCK-AT ?auto_555200 ?auto_555198 ) ( not ( = ?auto_555198 ?auto_555197 ) ) ( ON ?auto_555194 ?auto_555193 ) ( not ( = ?auto_555193 ?auto_555194 ) ) ( not ( = ?auto_555193 ?auto_555195 ) ) ( not ( = ?auto_555193 ?auto_555196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555194 ?auto_555195 ?auto_555196 )
      ( MAKE-3CRATE-VERIFY ?auto_555193 ?auto_555194 ?auto_555195 ?auto_555196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555217 - SURFACE
      ?auto_555218 - SURFACE
      ?auto_555219 - SURFACE
      ?auto_555220 - SURFACE
    )
    :vars
    (
      ?auto_555222 - HOIST
      ?auto_555225 - PLACE
      ?auto_555224 - TRUCK
      ?auto_555223 - PLACE
      ?auto_555221 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555222 ?auto_555225 ) ( SURFACE-AT ?auto_555219 ?auto_555225 ) ( CLEAR ?auto_555219 ) ( IS-CRATE ?auto_555220 ) ( not ( = ?auto_555219 ?auto_555220 ) ) ( AVAILABLE ?auto_555222 ) ( ON ?auto_555219 ?auto_555218 ) ( not ( = ?auto_555218 ?auto_555219 ) ) ( not ( = ?auto_555218 ?auto_555220 ) ) ( TRUCK-AT ?auto_555224 ?auto_555223 ) ( not ( = ?auto_555223 ?auto_555225 ) ) ( HOIST-AT ?auto_555221 ?auto_555223 ) ( LIFTING ?auto_555221 ?auto_555220 ) ( not ( = ?auto_555222 ?auto_555221 ) ) ( ON ?auto_555218 ?auto_555217 ) ( not ( = ?auto_555217 ?auto_555218 ) ) ( not ( = ?auto_555217 ?auto_555219 ) ) ( not ( = ?auto_555217 ?auto_555220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555218 ?auto_555219 ?auto_555220 )
      ( MAKE-3CRATE-VERIFY ?auto_555217 ?auto_555218 ?auto_555219 ?auto_555220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555244 - SURFACE
      ?auto_555245 - SURFACE
      ?auto_555246 - SURFACE
      ?auto_555247 - SURFACE
    )
    :vars
    (
      ?auto_555248 - HOIST
      ?auto_555249 - PLACE
      ?auto_555252 - TRUCK
      ?auto_555251 - PLACE
      ?auto_555250 - HOIST
      ?auto_555253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555248 ?auto_555249 ) ( SURFACE-AT ?auto_555246 ?auto_555249 ) ( CLEAR ?auto_555246 ) ( IS-CRATE ?auto_555247 ) ( not ( = ?auto_555246 ?auto_555247 ) ) ( AVAILABLE ?auto_555248 ) ( ON ?auto_555246 ?auto_555245 ) ( not ( = ?auto_555245 ?auto_555246 ) ) ( not ( = ?auto_555245 ?auto_555247 ) ) ( TRUCK-AT ?auto_555252 ?auto_555251 ) ( not ( = ?auto_555251 ?auto_555249 ) ) ( HOIST-AT ?auto_555250 ?auto_555251 ) ( not ( = ?auto_555248 ?auto_555250 ) ) ( AVAILABLE ?auto_555250 ) ( SURFACE-AT ?auto_555247 ?auto_555251 ) ( ON ?auto_555247 ?auto_555253 ) ( CLEAR ?auto_555247 ) ( not ( = ?auto_555246 ?auto_555253 ) ) ( not ( = ?auto_555247 ?auto_555253 ) ) ( not ( = ?auto_555245 ?auto_555253 ) ) ( ON ?auto_555245 ?auto_555244 ) ( not ( = ?auto_555244 ?auto_555245 ) ) ( not ( = ?auto_555244 ?auto_555246 ) ) ( not ( = ?auto_555244 ?auto_555247 ) ) ( not ( = ?auto_555244 ?auto_555253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555245 ?auto_555246 ?auto_555247 )
      ( MAKE-3CRATE-VERIFY ?auto_555244 ?auto_555245 ?auto_555246 ?auto_555247 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555272 - SURFACE
      ?auto_555273 - SURFACE
      ?auto_555274 - SURFACE
      ?auto_555275 - SURFACE
    )
    :vars
    (
      ?auto_555278 - HOIST
      ?auto_555279 - PLACE
      ?auto_555277 - PLACE
      ?auto_555281 - HOIST
      ?auto_555276 - SURFACE
      ?auto_555280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555278 ?auto_555279 ) ( SURFACE-AT ?auto_555274 ?auto_555279 ) ( CLEAR ?auto_555274 ) ( IS-CRATE ?auto_555275 ) ( not ( = ?auto_555274 ?auto_555275 ) ) ( AVAILABLE ?auto_555278 ) ( ON ?auto_555274 ?auto_555273 ) ( not ( = ?auto_555273 ?auto_555274 ) ) ( not ( = ?auto_555273 ?auto_555275 ) ) ( not ( = ?auto_555277 ?auto_555279 ) ) ( HOIST-AT ?auto_555281 ?auto_555277 ) ( not ( = ?auto_555278 ?auto_555281 ) ) ( AVAILABLE ?auto_555281 ) ( SURFACE-AT ?auto_555275 ?auto_555277 ) ( ON ?auto_555275 ?auto_555276 ) ( CLEAR ?auto_555275 ) ( not ( = ?auto_555274 ?auto_555276 ) ) ( not ( = ?auto_555275 ?auto_555276 ) ) ( not ( = ?auto_555273 ?auto_555276 ) ) ( TRUCK-AT ?auto_555280 ?auto_555279 ) ( ON ?auto_555273 ?auto_555272 ) ( not ( = ?auto_555272 ?auto_555273 ) ) ( not ( = ?auto_555272 ?auto_555274 ) ) ( not ( = ?auto_555272 ?auto_555275 ) ) ( not ( = ?auto_555272 ?auto_555276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555273 ?auto_555274 ?auto_555275 )
      ( MAKE-3CRATE-VERIFY ?auto_555272 ?auto_555273 ?auto_555274 ?auto_555275 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555300 - SURFACE
      ?auto_555301 - SURFACE
      ?auto_555302 - SURFACE
      ?auto_555303 - SURFACE
    )
    :vars
    (
      ?auto_555305 - HOIST
      ?auto_555309 - PLACE
      ?auto_555306 - PLACE
      ?auto_555304 - HOIST
      ?auto_555307 - SURFACE
      ?auto_555308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555305 ?auto_555309 ) ( IS-CRATE ?auto_555303 ) ( not ( = ?auto_555302 ?auto_555303 ) ) ( not ( = ?auto_555301 ?auto_555302 ) ) ( not ( = ?auto_555301 ?auto_555303 ) ) ( not ( = ?auto_555306 ?auto_555309 ) ) ( HOIST-AT ?auto_555304 ?auto_555306 ) ( not ( = ?auto_555305 ?auto_555304 ) ) ( AVAILABLE ?auto_555304 ) ( SURFACE-AT ?auto_555303 ?auto_555306 ) ( ON ?auto_555303 ?auto_555307 ) ( CLEAR ?auto_555303 ) ( not ( = ?auto_555302 ?auto_555307 ) ) ( not ( = ?auto_555303 ?auto_555307 ) ) ( not ( = ?auto_555301 ?auto_555307 ) ) ( TRUCK-AT ?auto_555308 ?auto_555309 ) ( SURFACE-AT ?auto_555301 ?auto_555309 ) ( CLEAR ?auto_555301 ) ( LIFTING ?auto_555305 ?auto_555302 ) ( IS-CRATE ?auto_555302 ) ( ON ?auto_555301 ?auto_555300 ) ( not ( = ?auto_555300 ?auto_555301 ) ) ( not ( = ?auto_555300 ?auto_555302 ) ) ( not ( = ?auto_555300 ?auto_555303 ) ) ( not ( = ?auto_555300 ?auto_555307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555301 ?auto_555302 ?auto_555303 )
      ( MAKE-3CRATE-VERIFY ?auto_555300 ?auto_555301 ?auto_555302 ?auto_555303 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_555328 - SURFACE
      ?auto_555329 - SURFACE
      ?auto_555330 - SURFACE
      ?auto_555331 - SURFACE
    )
    :vars
    (
      ?auto_555334 - HOIST
      ?auto_555333 - PLACE
      ?auto_555336 - PLACE
      ?auto_555335 - HOIST
      ?auto_555337 - SURFACE
      ?auto_555332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555334 ?auto_555333 ) ( IS-CRATE ?auto_555331 ) ( not ( = ?auto_555330 ?auto_555331 ) ) ( not ( = ?auto_555329 ?auto_555330 ) ) ( not ( = ?auto_555329 ?auto_555331 ) ) ( not ( = ?auto_555336 ?auto_555333 ) ) ( HOIST-AT ?auto_555335 ?auto_555336 ) ( not ( = ?auto_555334 ?auto_555335 ) ) ( AVAILABLE ?auto_555335 ) ( SURFACE-AT ?auto_555331 ?auto_555336 ) ( ON ?auto_555331 ?auto_555337 ) ( CLEAR ?auto_555331 ) ( not ( = ?auto_555330 ?auto_555337 ) ) ( not ( = ?auto_555331 ?auto_555337 ) ) ( not ( = ?auto_555329 ?auto_555337 ) ) ( TRUCK-AT ?auto_555332 ?auto_555333 ) ( SURFACE-AT ?auto_555329 ?auto_555333 ) ( CLEAR ?auto_555329 ) ( IS-CRATE ?auto_555330 ) ( AVAILABLE ?auto_555334 ) ( IN ?auto_555330 ?auto_555332 ) ( ON ?auto_555329 ?auto_555328 ) ( not ( = ?auto_555328 ?auto_555329 ) ) ( not ( = ?auto_555328 ?auto_555330 ) ) ( not ( = ?auto_555328 ?auto_555331 ) ) ( not ( = ?auto_555328 ?auto_555337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555329 ?auto_555330 ?auto_555331 )
      ( MAKE-3CRATE-VERIFY ?auto_555328 ?auto_555329 ?auto_555330 ?auto_555331 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555619 - SURFACE
      ?auto_555620 - SURFACE
      ?auto_555621 - SURFACE
      ?auto_555622 - SURFACE
      ?auto_555623 - SURFACE
    )
    :vars
    (
      ?auto_555624 - HOIST
      ?auto_555625 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555624 ?auto_555625 ) ( SURFACE-AT ?auto_555622 ?auto_555625 ) ( CLEAR ?auto_555622 ) ( LIFTING ?auto_555624 ?auto_555623 ) ( IS-CRATE ?auto_555623 ) ( not ( = ?auto_555622 ?auto_555623 ) ) ( ON ?auto_555620 ?auto_555619 ) ( ON ?auto_555621 ?auto_555620 ) ( ON ?auto_555622 ?auto_555621 ) ( not ( = ?auto_555619 ?auto_555620 ) ) ( not ( = ?auto_555619 ?auto_555621 ) ) ( not ( = ?auto_555619 ?auto_555622 ) ) ( not ( = ?auto_555619 ?auto_555623 ) ) ( not ( = ?auto_555620 ?auto_555621 ) ) ( not ( = ?auto_555620 ?auto_555622 ) ) ( not ( = ?auto_555620 ?auto_555623 ) ) ( not ( = ?auto_555621 ?auto_555622 ) ) ( not ( = ?auto_555621 ?auto_555623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555622 ?auto_555623 )
      ( MAKE-4CRATE-VERIFY ?auto_555619 ?auto_555620 ?auto_555621 ?auto_555622 ?auto_555623 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555644 - SURFACE
      ?auto_555645 - SURFACE
      ?auto_555646 - SURFACE
      ?auto_555647 - SURFACE
      ?auto_555648 - SURFACE
    )
    :vars
    (
      ?auto_555650 - HOIST
      ?auto_555651 - PLACE
      ?auto_555649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555650 ?auto_555651 ) ( SURFACE-AT ?auto_555647 ?auto_555651 ) ( CLEAR ?auto_555647 ) ( IS-CRATE ?auto_555648 ) ( not ( = ?auto_555647 ?auto_555648 ) ) ( TRUCK-AT ?auto_555649 ?auto_555651 ) ( AVAILABLE ?auto_555650 ) ( IN ?auto_555648 ?auto_555649 ) ( ON ?auto_555647 ?auto_555646 ) ( not ( = ?auto_555646 ?auto_555647 ) ) ( not ( = ?auto_555646 ?auto_555648 ) ) ( ON ?auto_555645 ?auto_555644 ) ( ON ?auto_555646 ?auto_555645 ) ( not ( = ?auto_555644 ?auto_555645 ) ) ( not ( = ?auto_555644 ?auto_555646 ) ) ( not ( = ?auto_555644 ?auto_555647 ) ) ( not ( = ?auto_555644 ?auto_555648 ) ) ( not ( = ?auto_555645 ?auto_555646 ) ) ( not ( = ?auto_555645 ?auto_555647 ) ) ( not ( = ?auto_555645 ?auto_555648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555646 ?auto_555647 ?auto_555648 )
      ( MAKE-4CRATE-VERIFY ?auto_555644 ?auto_555645 ?auto_555646 ?auto_555647 ?auto_555648 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555674 - SURFACE
      ?auto_555675 - SURFACE
      ?auto_555676 - SURFACE
      ?auto_555677 - SURFACE
      ?auto_555678 - SURFACE
    )
    :vars
    (
      ?auto_555679 - HOIST
      ?auto_555682 - PLACE
      ?auto_555681 - TRUCK
      ?auto_555680 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555679 ?auto_555682 ) ( SURFACE-AT ?auto_555677 ?auto_555682 ) ( CLEAR ?auto_555677 ) ( IS-CRATE ?auto_555678 ) ( not ( = ?auto_555677 ?auto_555678 ) ) ( AVAILABLE ?auto_555679 ) ( IN ?auto_555678 ?auto_555681 ) ( ON ?auto_555677 ?auto_555676 ) ( not ( = ?auto_555676 ?auto_555677 ) ) ( not ( = ?auto_555676 ?auto_555678 ) ) ( TRUCK-AT ?auto_555681 ?auto_555680 ) ( not ( = ?auto_555680 ?auto_555682 ) ) ( ON ?auto_555675 ?auto_555674 ) ( ON ?auto_555676 ?auto_555675 ) ( not ( = ?auto_555674 ?auto_555675 ) ) ( not ( = ?auto_555674 ?auto_555676 ) ) ( not ( = ?auto_555674 ?auto_555677 ) ) ( not ( = ?auto_555674 ?auto_555678 ) ) ( not ( = ?auto_555675 ?auto_555676 ) ) ( not ( = ?auto_555675 ?auto_555677 ) ) ( not ( = ?auto_555675 ?auto_555678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555676 ?auto_555677 ?auto_555678 )
      ( MAKE-4CRATE-VERIFY ?auto_555674 ?auto_555675 ?auto_555676 ?auto_555677 ?auto_555678 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555708 - SURFACE
      ?auto_555709 - SURFACE
      ?auto_555710 - SURFACE
      ?auto_555711 - SURFACE
      ?auto_555712 - SURFACE
    )
    :vars
    (
      ?auto_555715 - HOIST
      ?auto_555717 - PLACE
      ?auto_555713 - TRUCK
      ?auto_555714 - PLACE
      ?auto_555716 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555715 ?auto_555717 ) ( SURFACE-AT ?auto_555711 ?auto_555717 ) ( CLEAR ?auto_555711 ) ( IS-CRATE ?auto_555712 ) ( not ( = ?auto_555711 ?auto_555712 ) ) ( AVAILABLE ?auto_555715 ) ( ON ?auto_555711 ?auto_555710 ) ( not ( = ?auto_555710 ?auto_555711 ) ) ( not ( = ?auto_555710 ?auto_555712 ) ) ( TRUCK-AT ?auto_555713 ?auto_555714 ) ( not ( = ?auto_555714 ?auto_555717 ) ) ( HOIST-AT ?auto_555716 ?auto_555714 ) ( LIFTING ?auto_555716 ?auto_555712 ) ( not ( = ?auto_555715 ?auto_555716 ) ) ( ON ?auto_555709 ?auto_555708 ) ( ON ?auto_555710 ?auto_555709 ) ( not ( = ?auto_555708 ?auto_555709 ) ) ( not ( = ?auto_555708 ?auto_555710 ) ) ( not ( = ?auto_555708 ?auto_555711 ) ) ( not ( = ?auto_555708 ?auto_555712 ) ) ( not ( = ?auto_555709 ?auto_555710 ) ) ( not ( = ?auto_555709 ?auto_555711 ) ) ( not ( = ?auto_555709 ?auto_555712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555710 ?auto_555711 ?auto_555712 )
      ( MAKE-4CRATE-VERIFY ?auto_555708 ?auto_555709 ?auto_555710 ?auto_555711 ?auto_555712 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555746 - SURFACE
      ?auto_555747 - SURFACE
      ?auto_555748 - SURFACE
      ?auto_555749 - SURFACE
      ?auto_555750 - SURFACE
    )
    :vars
    (
      ?auto_555753 - HOIST
      ?auto_555754 - PLACE
      ?auto_555756 - TRUCK
      ?auto_555755 - PLACE
      ?auto_555752 - HOIST
      ?auto_555751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555753 ?auto_555754 ) ( SURFACE-AT ?auto_555749 ?auto_555754 ) ( CLEAR ?auto_555749 ) ( IS-CRATE ?auto_555750 ) ( not ( = ?auto_555749 ?auto_555750 ) ) ( AVAILABLE ?auto_555753 ) ( ON ?auto_555749 ?auto_555748 ) ( not ( = ?auto_555748 ?auto_555749 ) ) ( not ( = ?auto_555748 ?auto_555750 ) ) ( TRUCK-AT ?auto_555756 ?auto_555755 ) ( not ( = ?auto_555755 ?auto_555754 ) ) ( HOIST-AT ?auto_555752 ?auto_555755 ) ( not ( = ?auto_555753 ?auto_555752 ) ) ( AVAILABLE ?auto_555752 ) ( SURFACE-AT ?auto_555750 ?auto_555755 ) ( ON ?auto_555750 ?auto_555751 ) ( CLEAR ?auto_555750 ) ( not ( = ?auto_555749 ?auto_555751 ) ) ( not ( = ?auto_555750 ?auto_555751 ) ) ( not ( = ?auto_555748 ?auto_555751 ) ) ( ON ?auto_555747 ?auto_555746 ) ( ON ?auto_555748 ?auto_555747 ) ( not ( = ?auto_555746 ?auto_555747 ) ) ( not ( = ?auto_555746 ?auto_555748 ) ) ( not ( = ?auto_555746 ?auto_555749 ) ) ( not ( = ?auto_555746 ?auto_555750 ) ) ( not ( = ?auto_555746 ?auto_555751 ) ) ( not ( = ?auto_555747 ?auto_555748 ) ) ( not ( = ?auto_555747 ?auto_555749 ) ) ( not ( = ?auto_555747 ?auto_555750 ) ) ( not ( = ?auto_555747 ?auto_555751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555748 ?auto_555749 ?auto_555750 )
      ( MAKE-4CRATE-VERIFY ?auto_555746 ?auto_555747 ?auto_555748 ?auto_555749 ?auto_555750 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555785 - SURFACE
      ?auto_555786 - SURFACE
      ?auto_555787 - SURFACE
      ?auto_555788 - SURFACE
      ?auto_555789 - SURFACE
    )
    :vars
    (
      ?auto_555793 - HOIST
      ?auto_555790 - PLACE
      ?auto_555791 - PLACE
      ?auto_555792 - HOIST
      ?auto_555795 - SURFACE
      ?auto_555794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555793 ?auto_555790 ) ( SURFACE-AT ?auto_555788 ?auto_555790 ) ( CLEAR ?auto_555788 ) ( IS-CRATE ?auto_555789 ) ( not ( = ?auto_555788 ?auto_555789 ) ) ( AVAILABLE ?auto_555793 ) ( ON ?auto_555788 ?auto_555787 ) ( not ( = ?auto_555787 ?auto_555788 ) ) ( not ( = ?auto_555787 ?auto_555789 ) ) ( not ( = ?auto_555791 ?auto_555790 ) ) ( HOIST-AT ?auto_555792 ?auto_555791 ) ( not ( = ?auto_555793 ?auto_555792 ) ) ( AVAILABLE ?auto_555792 ) ( SURFACE-AT ?auto_555789 ?auto_555791 ) ( ON ?auto_555789 ?auto_555795 ) ( CLEAR ?auto_555789 ) ( not ( = ?auto_555788 ?auto_555795 ) ) ( not ( = ?auto_555789 ?auto_555795 ) ) ( not ( = ?auto_555787 ?auto_555795 ) ) ( TRUCK-AT ?auto_555794 ?auto_555790 ) ( ON ?auto_555786 ?auto_555785 ) ( ON ?auto_555787 ?auto_555786 ) ( not ( = ?auto_555785 ?auto_555786 ) ) ( not ( = ?auto_555785 ?auto_555787 ) ) ( not ( = ?auto_555785 ?auto_555788 ) ) ( not ( = ?auto_555785 ?auto_555789 ) ) ( not ( = ?auto_555785 ?auto_555795 ) ) ( not ( = ?auto_555786 ?auto_555787 ) ) ( not ( = ?auto_555786 ?auto_555788 ) ) ( not ( = ?auto_555786 ?auto_555789 ) ) ( not ( = ?auto_555786 ?auto_555795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555787 ?auto_555788 ?auto_555789 )
      ( MAKE-4CRATE-VERIFY ?auto_555785 ?auto_555786 ?auto_555787 ?auto_555788 ?auto_555789 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555824 - SURFACE
      ?auto_555825 - SURFACE
      ?auto_555826 - SURFACE
      ?auto_555827 - SURFACE
      ?auto_555828 - SURFACE
    )
    :vars
    (
      ?auto_555834 - HOIST
      ?auto_555830 - PLACE
      ?auto_555831 - PLACE
      ?auto_555833 - HOIST
      ?auto_555832 - SURFACE
      ?auto_555829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555834 ?auto_555830 ) ( IS-CRATE ?auto_555828 ) ( not ( = ?auto_555827 ?auto_555828 ) ) ( not ( = ?auto_555826 ?auto_555827 ) ) ( not ( = ?auto_555826 ?auto_555828 ) ) ( not ( = ?auto_555831 ?auto_555830 ) ) ( HOIST-AT ?auto_555833 ?auto_555831 ) ( not ( = ?auto_555834 ?auto_555833 ) ) ( AVAILABLE ?auto_555833 ) ( SURFACE-AT ?auto_555828 ?auto_555831 ) ( ON ?auto_555828 ?auto_555832 ) ( CLEAR ?auto_555828 ) ( not ( = ?auto_555827 ?auto_555832 ) ) ( not ( = ?auto_555828 ?auto_555832 ) ) ( not ( = ?auto_555826 ?auto_555832 ) ) ( TRUCK-AT ?auto_555829 ?auto_555830 ) ( SURFACE-AT ?auto_555826 ?auto_555830 ) ( CLEAR ?auto_555826 ) ( LIFTING ?auto_555834 ?auto_555827 ) ( IS-CRATE ?auto_555827 ) ( ON ?auto_555825 ?auto_555824 ) ( ON ?auto_555826 ?auto_555825 ) ( not ( = ?auto_555824 ?auto_555825 ) ) ( not ( = ?auto_555824 ?auto_555826 ) ) ( not ( = ?auto_555824 ?auto_555827 ) ) ( not ( = ?auto_555824 ?auto_555828 ) ) ( not ( = ?auto_555824 ?auto_555832 ) ) ( not ( = ?auto_555825 ?auto_555826 ) ) ( not ( = ?auto_555825 ?auto_555827 ) ) ( not ( = ?auto_555825 ?auto_555828 ) ) ( not ( = ?auto_555825 ?auto_555832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555826 ?auto_555827 ?auto_555828 )
      ( MAKE-4CRATE-VERIFY ?auto_555824 ?auto_555825 ?auto_555826 ?auto_555827 ?auto_555828 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555863 - SURFACE
      ?auto_555864 - SURFACE
      ?auto_555865 - SURFACE
      ?auto_555866 - SURFACE
      ?auto_555867 - SURFACE
    )
    :vars
    (
      ?auto_555868 - HOIST
      ?auto_555871 - PLACE
      ?auto_555870 - PLACE
      ?auto_555872 - HOIST
      ?auto_555873 - SURFACE
      ?auto_555869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555868 ?auto_555871 ) ( IS-CRATE ?auto_555867 ) ( not ( = ?auto_555866 ?auto_555867 ) ) ( not ( = ?auto_555865 ?auto_555866 ) ) ( not ( = ?auto_555865 ?auto_555867 ) ) ( not ( = ?auto_555870 ?auto_555871 ) ) ( HOIST-AT ?auto_555872 ?auto_555870 ) ( not ( = ?auto_555868 ?auto_555872 ) ) ( AVAILABLE ?auto_555872 ) ( SURFACE-AT ?auto_555867 ?auto_555870 ) ( ON ?auto_555867 ?auto_555873 ) ( CLEAR ?auto_555867 ) ( not ( = ?auto_555866 ?auto_555873 ) ) ( not ( = ?auto_555867 ?auto_555873 ) ) ( not ( = ?auto_555865 ?auto_555873 ) ) ( TRUCK-AT ?auto_555869 ?auto_555871 ) ( SURFACE-AT ?auto_555865 ?auto_555871 ) ( CLEAR ?auto_555865 ) ( IS-CRATE ?auto_555866 ) ( AVAILABLE ?auto_555868 ) ( IN ?auto_555866 ?auto_555869 ) ( ON ?auto_555864 ?auto_555863 ) ( ON ?auto_555865 ?auto_555864 ) ( not ( = ?auto_555863 ?auto_555864 ) ) ( not ( = ?auto_555863 ?auto_555865 ) ) ( not ( = ?auto_555863 ?auto_555866 ) ) ( not ( = ?auto_555863 ?auto_555867 ) ) ( not ( = ?auto_555863 ?auto_555873 ) ) ( not ( = ?auto_555864 ?auto_555865 ) ) ( not ( = ?auto_555864 ?auto_555866 ) ) ( not ( = ?auto_555864 ?auto_555867 ) ) ( not ( = ?auto_555864 ?auto_555873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555865 ?auto_555866 ?auto_555867 )
      ( MAKE-4CRATE-VERIFY ?auto_555863 ?auto_555864 ?auto_555865 ?auto_555866 ?auto_555867 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556523 - SURFACE
      ?auto_556524 - SURFACE
      ?auto_556525 - SURFACE
      ?auto_556526 - SURFACE
      ?auto_556527 - SURFACE
      ?auto_556528 - SURFACE
    )
    :vars
    (
      ?auto_556530 - HOIST
      ?auto_556529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556530 ?auto_556529 ) ( SURFACE-AT ?auto_556527 ?auto_556529 ) ( CLEAR ?auto_556527 ) ( LIFTING ?auto_556530 ?auto_556528 ) ( IS-CRATE ?auto_556528 ) ( not ( = ?auto_556527 ?auto_556528 ) ) ( ON ?auto_556524 ?auto_556523 ) ( ON ?auto_556525 ?auto_556524 ) ( ON ?auto_556526 ?auto_556525 ) ( ON ?auto_556527 ?auto_556526 ) ( not ( = ?auto_556523 ?auto_556524 ) ) ( not ( = ?auto_556523 ?auto_556525 ) ) ( not ( = ?auto_556523 ?auto_556526 ) ) ( not ( = ?auto_556523 ?auto_556527 ) ) ( not ( = ?auto_556523 ?auto_556528 ) ) ( not ( = ?auto_556524 ?auto_556525 ) ) ( not ( = ?auto_556524 ?auto_556526 ) ) ( not ( = ?auto_556524 ?auto_556527 ) ) ( not ( = ?auto_556524 ?auto_556528 ) ) ( not ( = ?auto_556525 ?auto_556526 ) ) ( not ( = ?auto_556525 ?auto_556527 ) ) ( not ( = ?auto_556525 ?auto_556528 ) ) ( not ( = ?auto_556526 ?auto_556527 ) ) ( not ( = ?auto_556526 ?auto_556528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556527 ?auto_556528 )
      ( MAKE-5CRATE-VERIFY ?auto_556523 ?auto_556524 ?auto_556525 ?auto_556526 ?auto_556527 ?auto_556528 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556557 - SURFACE
      ?auto_556558 - SURFACE
      ?auto_556559 - SURFACE
      ?auto_556560 - SURFACE
      ?auto_556561 - SURFACE
      ?auto_556562 - SURFACE
    )
    :vars
    (
      ?auto_556563 - HOIST
      ?auto_556564 - PLACE
      ?auto_556565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556563 ?auto_556564 ) ( SURFACE-AT ?auto_556561 ?auto_556564 ) ( CLEAR ?auto_556561 ) ( IS-CRATE ?auto_556562 ) ( not ( = ?auto_556561 ?auto_556562 ) ) ( TRUCK-AT ?auto_556565 ?auto_556564 ) ( AVAILABLE ?auto_556563 ) ( IN ?auto_556562 ?auto_556565 ) ( ON ?auto_556561 ?auto_556560 ) ( not ( = ?auto_556560 ?auto_556561 ) ) ( not ( = ?auto_556560 ?auto_556562 ) ) ( ON ?auto_556558 ?auto_556557 ) ( ON ?auto_556559 ?auto_556558 ) ( ON ?auto_556560 ?auto_556559 ) ( not ( = ?auto_556557 ?auto_556558 ) ) ( not ( = ?auto_556557 ?auto_556559 ) ) ( not ( = ?auto_556557 ?auto_556560 ) ) ( not ( = ?auto_556557 ?auto_556561 ) ) ( not ( = ?auto_556557 ?auto_556562 ) ) ( not ( = ?auto_556558 ?auto_556559 ) ) ( not ( = ?auto_556558 ?auto_556560 ) ) ( not ( = ?auto_556558 ?auto_556561 ) ) ( not ( = ?auto_556558 ?auto_556562 ) ) ( not ( = ?auto_556559 ?auto_556560 ) ) ( not ( = ?auto_556559 ?auto_556561 ) ) ( not ( = ?auto_556559 ?auto_556562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556560 ?auto_556561 ?auto_556562 )
      ( MAKE-5CRATE-VERIFY ?auto_556557 ?auto_556558 ?auto_556559 ?auto_556560 ?auto_556561 ?auto_556562 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556597 - SURFACE
      ?auto_556598 - SURFACE
      ?auto_556599 - SURFACE
      ?auto_556600 - SURFACE
      ?auto_556601 - SURFACE
      ?auto_556602 - SURFACE
    )
    :vars
    (
      ?auto_556605 - HOIST
      ?auto_556603 - PLACE
      ?auto_556604 - TRUCK
      ?auto_556606 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556605 ?auto_556603 ) ( SURFACE-AT ?auto_556601 ?auto_556603 ) ( CLEAR ?auto_556601 ) ( IS-CRATE ?auto_556602 ) ( not ( = ?auto_556601 ?auto_556602 ) ) ( AVAILABLE ?auto_556605 ) ( IN ?auto_556602 ?auto_556604 ) ( ON ?auto_556601 ?auto_556600 ) ( not ( = ?auto_556600 ?auto_556601 ) ) ( not ( = ?auto_556600 ?auto_556602 ) ) ( TRUCK-AT ?auto_556604 ?auto_556606 ) ( not ( = ?auto_556606 ?auto_556603 ) ) ( ON ?auto_556598 ?auto_556597 ) ( ON ?auto_556599 ?auto_556598 ) ( ON ?auto_556600 ?auto_556599 ) ( not ( = ?auto_556597 ?auto_556598 ) ) ( not ( = ?auto_556597 ?auto_556599 ) ) ( not ( = ?auto_556597 ?auto_556600 ) ) ( not ( = ?auto_556597 ?auto_556601 ) ) ( not ( = ?auto_556597 ?auto_556602 ) ) ( not ( = ?auto_556598 ?auto_556599 ) ) ( not ( = ?auto_556598 ?auto_556600 ) ) ( not ( = ?auto_556598 ?auto_556601 ) ) ( not ( = ?auto_556598 ?auto_556602 ) ) ( not ( = ?auto_556599 ?auto_556600 ) ) ( not ( = ?auto_556599 ?auto_556601 ) ) ( not ( = ?auto_556599 ?auto_556602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556600 ?auto_556601 ?auto_556602 )
      ( MAKE-5CRATE-VERIFY ?auto_556597 ?auto_556598 ?auto_556599 ?auto_556600 ?auto_556601 ?auto_556602 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556642 - SURFACE
      ?auto_556643 - SURFACE
      ?auto_556644 - SURFACE
      ?auto_556645 - SURFACE
      ?auto_556646 - SURFACE
      ?auto_556647 - SURFACE
    )
    :vars
    (
      ?auto_556652 - HOIST
      ?auto_556648 - PLACE
      ?auto_556650 - TRUCK
      ?auto_556649 - PLACE
      ?auto_556651 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_556652 ?auto_556648 ) ( SURFACE-AT ?auto_556646 ?auto_556648 ) ( CLEAR ?auto_556646 ) ( IS-CRATE ?auto_556647 ) ( not ( = ?auto_556646 ?auto_556647 ) ) ( AVAILABLE ?auto_556652 ) ( ON ?auto_556646 ?auto_556645 ) ( not ( = ?auto_556645 ?auto_556646 ) ) ( not ( = ?auto_556645 ?auto_556647 ) ) ( TRUCK-AT ?auto_556650 ?auto_556649 ) ( not ( = ?auto_556649 ?auto_556648 ) ) ( HOIST-AT ?auto_556651 ?auto_556649 ) ( LIFTING ?auto_556651 ?auto_556647 ) ( not ( = ?auto_556652 ?auto_556651 ) ) ( ON ?auto_556643 ?auto_556642 ) ( ON ?auto_556644 ?auto_556643 ) ( ON ?auto_556645 ?auto_556644 ) ( not ( = ?auto_556642 ?auto_556643 ) ) ( not ( = ?auto_556642 ?auto_556644 ) ) ( not ( = ?auto_556642 ?auto_556645 ) ) ( not ( = ?auto_556642 ?auto_556646 ) ) ( not ( = ?auto_556642 ?auto_556647 ) ) ( not ( = ?auto_556643 ?auto_556644 ) ) ( not ( = ?auto_556643 ?auto_556645 ) ) ( not ( = ?auto_556643 ?auto_556646 ) ) ( not ( = ?auto_556643 ?auto_556647 ) ) ( not ( = ?auto_556644 ?auto_556645 ) ) ( not ( = ?auto_556644 ?auto_556646 ) ) ( not ( = ?auto_556644 ?auto_556647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556645 ?auto_556646 ?auto_556647 )
      ( MAKE-5CRATE-VERIFY ?auto_556642 ?auto_556643 ?auto_556644 ?auto_556645 ?auto_556646 ?auto_556647 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556692 - SURFACE
      ?auto_556693 - SURFACE
      ?auto_556694 - SURFACE
      ?auto_556695 - SURFACE
      ?auto_556696 - SURFACE
      ?auto_556697 - SURFACE
    )
    :vars
    (
      ?auto_556702 - HOIST
      ?auto_556699 - PLACE
      ?auto_556698 - TRUCK
      ?auto_556701 - PLACE
      ?auto_556700 - HOIST
      ?auto_556703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556702 ?auto_556699 ) ( SURFACE-AT ?auto_556696 ?auto_556699 ) ( CLEAR ?auto_556696 ) ( IS-CRATE ?auto_556697 ) ( not ( = ?auto_556696 ?auto_556697 ) ) ( AVAILABLE ?auto_556702 ) ( ON ?auto_556696 ?auto_556695 ) ( not ( = ?auto_556695 ?auto_556696 ) ) ( not ( = ?auto_556695 ?auto_556697 ) ) ( TRUCK-AT ?auto_556698 ?auto_556701 ) ( not ( = ?auto_556701 ?auto_556699 ) ) ( HOIST-AT ?auto_556700 ?auto_556701 ) ( not ( = ?auto_556702 ?auto_556700 ) ) ( AVAILABLE ?auto_556700 ) ( SURFACE-AT ?auto_556697 ?auto_556701 ) ( ON ?auto_556697 ?auto_556703 ) ( CLEAR ?auto_556697 ) ( not ( = ?auto_556696 ?auto_556703 ) ) ( not ( = ?auto_556697 ?auto_556703 ) ) ( not ( = ?auto_556695 ?auto_556703 ) ) ( ON ?auto_556693 ?auto_556692 ) ( ON ?auto_556694 ?auto_556693 ) ( ON ?auto_556695 ?auto_556694 ) ( not ( = ?auto_556692 ?auto_556693 ) ) ( not ( = ?auto_556692 ?auto_556694 ) ) ( not ( = ?auto_556692 ?auto_556695 ) ) ( not ( = ?auto_556692 ?auto_556696 ) ) ( not ( = ?auto_556692 ?auto_556697 ) ) ( not ( = ?auto_556692 ?auto_556703 ) ) ( not ( = ?auto_556693 ?auto_556694 ) ) ( not ( = ?auto_556693 ?auto_556695 ) ) ( not ( = ?auto_556693 ?auto_556696 ) ) ( not ( = ?auto_556693 ?auto_556697 ) ) ( not ( = ?auto_556693 ?auto_556703 ) ) ( not ( = ?auto_556694 ?auto_556695 ) ) ( not ( = ?auto_556694 ?auto_556696 ) ) ( not ( = ?auto_556694 ?auto_556697 ) ) ( not ( = ?auto_556694 ?auto_556703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556695 ?auto_556696 ?auto_556697 )
      ( MAKE-5CRATE-VERIFY ?auto_556692 ?auto_556693 ?auto_556694 ?auto_556695 ?auto_556696 ?auto_556697 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556743 - SURFACE
      ?auto_556744 - SURFACE
      ?auto_556745 - SURFACE
      ?auto_556746 - SURFACE
      ?auto_556747 - SURFACE
      ?auto_556748 - SURFACE
    )
    :vars
    (
      ?auto_556753 - HOIST
      ?auto_556751 - PLACE
      ?auto_556749 - PLACE
      ?auto_556752 - HOIST
      ?auto_556750 - SURFACE
      ?auto_556754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556753 ?auto_556751 ) ( SURFACE-AT ?auto_556747 ?auto_556751 ) ( CLEAR ?auto_556747 ) ( IS-CRATE ?auto_556748 ) ( not ( = ?auto_556747 ?auto_556748 ) ) ( AVAILABLE ?auto_556753 ) ( ON ?auto_556747 ?auto_556746 ) ( not ( = ?auto_556746 ?auto_556747 ) ) ( not ( = ?auto_556746 ?auto_556748 ) ) ( not ( = ?auto_556749 ?auto_556751 ) ) ( HOIST-AT ?auto_556752 ?auto_556749 ) ( not ( = ?auto_556753 ?auto_556752 ) ) ( AVAILABLE ?auto_556752 ) ( SURFACE-AT ?auto_556748 ?auto_556749 ) ( ON ?auto_556748 ?auto_556750 ) ( CLEAR ?auto_556748 ) ( not ( = ?auto_556747 ?auto_556750 ) ) ( not ( = ?auto_556748 ?auto_556750 ) ) ( not ( = ?auto_556746 ?auto_556750 ) ) ( TRUCK-AT ?auto_556754 ?auto_556751 ) ( ON ?auto_556744 ?auto_556743 ) ( ON ?auto_556745 ?auto_556744 ) ( ON ?auto_556746 ?auto_556745 ) ( not ( = ?auto_556743 ?auto_556744 ) ) ( not ( = ?auto_556743 ?auto_556745 ) ) ( not ( = ?auto_556743 ?auto_556746 ) ) ( not ( = ?auto_556743 ?auto_556747 ) ) ( not ( = ?auto_556743 ?auto_556748 ) ) ( not ( = ?auto_556743 ?auto_556750 ) ) ( not ( = ?auto_556744 ?auto_556745 ) ) ( not ( = ?auto_556744 ?auto_556746 ) ) ( not ( = ?auto_556744 ?auto_556747 ) ) ( not ( = ?auto_556744 ?auto_556748 ) ) ( not ( = ?auto_556744 ?auto_556750 ) ) ( not ( = ?auto_556745 ?auto_556746 ) ) ( not ( = ?auto_556745 ?auto_556747 ) ) ( not ( = ?auto_556745 ?auto_556748 ) ) ( not ( = ?auto_556745 ?auto_556750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556746 ?auto_556747 ?auto_556748 )
      ( MAKE-5CRATE-VERIFY ?auto_556743 ?auto_556744 ?auto_556745 ?auto_556746 ?auto_556747 ?auto_556748 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556794 - SURFACE
      ?auto_556795 - SURFACE
      ?auto_556796 - SURFACE
      ?auto_556797 - SURFACE
      ?auto_556798 - SURFACE
      ?auto_556799 - SURFACE
    )
    :vars
    (
      ?auto_556801 - HOIST
      ?auto_556805 - PLACE
      ?auto_556803 - PLACE
      ?auto_556800 - HOIST
      ?auto_556804 - SURFACE
      ?auto_556802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556801 ?auto_556805 ) ( IS-CRATE ?auto_556799 ) ( not ( = ?auto_556798 ?auto_556799 ) ) ( not ( = ?auto_556797 ?auto_556798 ) ) ( not ( = ?auto_556797 ?auto_556799 ) ) ( not ( = ?auto_556803 ?auto_556805 ) ) ( HOIST-AT ?auto_556800 ?auto_556803 ) ( not ( = ?auto_556801 ?auto_556800 ) ) ( AVAILABLE ?auto_556800 ) ( SURFACE-AT ?auto_556799 ?auto_556803 ) ( ON ?auto_556799 ?auto_556804 ) ( CLEAR ?auto_556799 ) ( not ( = ?auto_556798 ?auto_556804 ) ) ( not ( = ?auto_556799 ?auto_556804 ) ) ( not ( = ?auto_556797 ?auto_556804 ) ) ( TRUCK-AT ?auto_556802 ?auto_556805 ) ( SURFACE-AT ?auto_556797 ?auto_556805 ) ( CLEAR ?auto_556797 ) ( LIFTING ?auto_556801 ?auto_556798 ) ( IS-CRATE ?auto_556798 ) ( ON ?auto_556795 ?auto_556794 ) ( ON ?auto_556796 ?auto_556795 ) ( ON ?auto_556797 ?auto_556796 ) ( not ( = ?auto_556794 ?auto_556795 ) ) ( not ( = ?auto_556794 ?auto_556796 ) ) ( not ( = ?auto_556794 ?auto_556797 ) ) ( not ( = ?auto_556794 ?auto_556798 ) ) ( not ( = ?auto_556794 ?auto_556799 ) ) ( not ( = ?auto_556794 ?auto_556804 ) ) ( not ( = ?auto_556795 ?auto_556796 ) ) ( not ( = ?auto_556795 ?auto_556797 ) ) ( not ( = ?auto_556795 ?auto_556798 ) ) ( not ( = ?auto_556795 ?auto_556799 ) ) ( not ( = ?auto_556795 ?auto_556804 ) ) ( not ( = ?auto_556796 ?auto_556797 ) ) ( not ( = ?auto_556796 ?auto_556798 ) ) ( not ( = ?auto_556796 ?auto_556799 ) ) ( not ( = ?auto_556796 ?auto_556804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556797 ?auto_556798 ?auto_556799 )
      ( MAKE-5CRATE-VERIFY ?auto_556794 ?auto_556795 ?auto_556796 ?auto_556797 ?auto_556798 ?auto_556799 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556845 - SURFACE
      ?auto_556846 - SURFACE
      ?auto_556847 - SURFACE
      ?auto_556848 - SURFACE
      ?auto_556849 - SURFACE
      ?auto_556850 - SURFACE
    )
    :vars
    (
      ?auto_556854 - HOIST
      ?auto_556855 - PLACE
      ?auto_556851 - PLACE
      ?auto_556856 - HOIST
      ?auto_556852 - SURFACE
      ?auto_556853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556854 ?auto_556855 ) ( IS-CRATE ?auto_556850 ) ( not ( = ?auto_556849 ?auto_556850 ) ) ( not ( = ?auto_556848 ?auto_556849 ) ) ( not ( = ?auto_556848 ?auto_556850 ) ) ( not ( = ?auto_556851 ?auto_556855 ) ) ( HOIST-AT ?auto_556856 ?auto_556851 ) ( not ( = ?auto_556854 ?auto_556856 ) ) ( AVAILABLE ?auto_556856 ) ( SURFACE-AT ?auto_556850 ?auto_556851 ) ( ON ?auto_556850 ?auto_556852 ) ( CLEAR ?auto_556850 ) ( not ( = ?auto_556849 ?auto_556852 ) ) ( not ( = ?auto_556850 ?auto_556852 ) ) ( not ( = ?auto_556848 ?auto_556852 ) ) ( TRUCK-AT ?auto_556853 ?auto_556855 ) ( SURFACE-AT ?auto_556848 ?auto_556855 ) ( CLEAR ?auto_556848 ) ( IS-CRATE ?auto_556849 ) ( AVAILABLE ?auto_556854 ) ( IN ?auto_556849 ?auto_556853 ) ( ON ?auto_556846 ?auto_556845 ) ( ON ?auto_556847 ?auto_556846 ) ( ON ?auto_556848 ?auto_556847 ) ( not ( = ?auto_556845 ?auto_556846 ) ) ( not ( = ?auto_556845 ?auto_556847 ) ) ( not ( = ?auto_556845 ?auto_556848 ) ) ( not ( = ?auto_556845 ?auto_556849 ) ) ( not ( = ?auto_556845 ?auto_556850 ) ) ( not ( = ?auto_556845 ?auto_556852 ) ) ( not ( = ?auto_556846 ?auto_556847 ) ) ( not ( = ?auto_556846 ?auto_556848 ) ) ( not ( = ?auto_556846 ?auto_556849 ) ) ( not ( = ?auto_556846 ?auto_556850 ) ) ( not ( = ?auto_556846 ?auto_556852 ) ) ( not ( = ?auto_556847 ?auto_556848 ) ) ( not ( = ?auto_556847 ?auto_556849 ) ) ( not ( = ?auto_556847 ?auto_556850 ) ) ( not ( = ?auto_556847 ?auto_556852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556848 ?auto_556849 ?auto_556850 )
      ( MAKE-5CRATE-VERIFY ?auto_556845 ?auto_556846 ?auto_556847 ?auto_556848 ?auto_556849 ?auto_556850 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_557837 - SURFACE
      ?auto_557838 - SURFACE
    )
    :vars
    (
      ?auto_557840 - HOIST
      ?auto_557843 - PLACE
      ?auto_557845 - SURFACE
      ?auto_557839 - TRUCK
      ?auto_557844 - PLACE
      ?auto_557841 - HOIST
      ?auto_557842 - SURFACE
      ?auto_557846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557840 ?auto_557843 ) ( SURFACE-AT ?auto_557837 ?auto_557843 ) ( CLEAR ?auto_557837 ) ( IS-CRATE ?auto_557838 ) ( not ( = ?auto_557837 ?auto_557838 ) ) ( AVAILABLE ?auto_557840 ) ( ON ?auto_557837 ?auto_557845 ) ( not ( = ?auto_557845 ?auto_557837 ) ) ( not ( = ?auto_557845 ?auto_557838 ) ) ( TRUCK-AT ?auto_557839 ?auto_557844 ) ( not ( = ?auto_557844 ?auto_557843 ) ) ( HOIST-AT ?auto_557841 ?auto_557844 ) ( not ( = ?auto_557840 ?auto_557841 ) ) ( SURFACE-AT ?auto_557838 ?auto_557844 ) ( ON ?auto_557838 ?auto_557842 ) ( CLEAR ?auto_557838 ) ( not ( = ?auto_557837 ?auto_557842 ) ) ( not ( = ?auto_557838 ?auto_557842 ) ) ( not ( = ?auto_557845 ?auto_557842 ) ) ( LIFTING ?auto_557841 ?auto_557846 ) ( IS-CRATE ?auto_557846 ) ( not ( = ?auto_557837 ?auto_557846 ) ) ( not ( = ?auto_557838 ?auto_557846 ) ) ( not ( = ?auto_557845 ?auto_557846 ) ) ( not ( = ?auto_557842 ?auto_557846 ) ) )
    :subtasks
    ( ( !LOAD ?auto_557841 ?auto_557846 ?auto_557839 ?auto_557844 )
      ( MAKE-1CRATE ?auto_557837 ?auto_557838 )
      ( MAKE-1CRATE-VERIFY ?auto_557837 ?auto_557838 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558052 - SURFACE
      ?auto_558053 - SURFACE
      ?auto_558054 - SURFACE
      ?auto_558055 - SURFACE
      ?auto_558056 - SURFACE
      ?auto_558057 - SURFACE
      ?auto_558058 - SURFACE
    )
    :vars
    (
      ?auto_558059 - HOIST
      ?auto_558060 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_558059 ?auto_558060 ) ( SURFACE-AT ?auto_558057 ?auto_558060 ) ( CLEAR ?auto_558057 ) ( LIFTING ?auto_558059 ?auto_558058 ) ( IS-CRATE ?auto_558058 ) ( not ( = ?auto_558057 ?auto_558058 ) ) ( ON ?auto_558053 ?auto_558052 ) ( ON ?auto_558054 ?auto_558053 ) ( ON ?auto_558055 ?auto_558054 ) ( ON ?auto_558056 ?auto_558055 ) ( ON ?auto_558057 ?auto_558056 ) ( not ( = ?auto_558052 ?auto_558053 ) ) ( not ( = ?auto_558052 ?auto_558054 ) ) ( not ( = ?auto_558052 ?auto_558055 ) ) ( not ( = ?auto_558052 ?auto_558056 ) ) ( not ( = ?auto_558052 ?auto_558057 ) ) ( not ( = ?auto_558052 ?auto_558058 ) ) ( not ( = ?auto_558053 ?auto_558054 ) ) ( not ( = ?auto_558053 ?auto_558055 ) ) ( not ( = ?auto_558053 ?auto_558056 ) ) ( not ( = ?auto_558053 ?auto_558057 ) ) ( not ( = ?auto_558053 ?auto_558058 ) ) ( not ( = ?auto_558054 ?auto_558055 ) ) ( not ( = ?auto_558054 ?auto_558056 ) ) ( not ( = ?auto_558054 ?auto_558057 ) ) ( not ( = ?auto_558054 ?auto_558058 ) ) ( not ( = ?auto_558055 ?auto_558056 ) ) ( not ( = ?auto_558055 ?auto_558057 ) ) ( not ( = ?auto_558055 ?auto_558058 ) ) ( not ( = ?auto_558056 ?auto_558057 ) ) ( not ( = ?auto_558056 ?auto_558058 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_558057 ?auto_558058 )
      ( MAKE-6CRATE-VERIFY ?auto_558052 ?auto_558053 ?auto_558054 ?auto_558055 ?auto_558056 ?auto_558057 ?auto_558058 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558096 - SURFACE
      ?auto_558097 - SURFACE
      ?auto_558098 - SURFACE
      ?auto_558099 - SURFACE
      ?auto_558100 - SURFACE
      ?auto_558101 - SURFACE
      ?auto_558102 - SURFACE
    )
    :vars
    (
      ?auto_558103 - HOIST
      ?auto_558104 - PLACE
      ?auto_558105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558103 ?auto_558104 ) ( SURFACE-AT ?auto_558101 ?auto_558104 ) ( CLEAR ?auto_558101 ) ( IS-CRATE ?auto_558102 ) ( not ( = ?auto_558101 ?auto_558102 ) ) ( TRUCK-AT ?auto_558105 ?auto_558104 ) ( AVAILABLE ?auto_558103 ) ( IN ?auto_558102 ?auto_558105 ) ( ON ?auto_558101 ?auto_558100 ) ( not ( = ?auto_558100 ?auto_558101 ) ) ( not ( = ?auto_558100 ?auto_558102 ) ) ( ON ?auto_558097 ?auto_558096 ) ( ON ?auto_558098 ?auto_558097 ) ( ON ?auto_558099 ?auto_558098 ) ( ON ?auto_558100 ?auto_558099 ) ( not ( = ?auto_558096 ?auto_558097 ) ) ( not ( = ?auto_558096 ?auto_558098 ) ) ( not ( = ?auto_558096 ?auto_558099 ) ) ( not ( = ?auto_558096 ?auto_558100 ) ) ( not ( = ?auto_558096 ?auto_558101 ) ) ( not ( = ?auto_558096 ?auto_558102 ) ) ( not ( = ?auto_558097 ?auto_558098 ) ) ( not ( = ?auto_558097 ?auto_558099 ) ) ( not ( = ?auto_558097 ?auto_558100 ) ) ( not ( = ?auto_558097 ?auto_558101 ) ) ( not ( = ?auto_558097 ?auto_558102 ) ) ( not ( = ?auto_558098 ?auto_558099 ) ) ( not ( = ?auto_558098 ?auto_558100 ) ) ( not ( = ?auto_558098 ?auto_558101 ) ) ( not ( = ?auto_558098 ?auto_558102 ) ) ( not ( = ?auto_558099 ?auto_558100 ) ) ( not ( = ?auto_558099 ?auto_558101 ) ) ( not ( = ?auto_558099 ?auto_558102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558100 ?auto_558101 ?auto_558102 )
      ( MAKE-6CRATE-VERIFY ?auto_558096 ?auto_558097 ?auto_558098 ?auto_558099 ?auto_558100 ?auto_558101 ?auto_558102 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558147 - SURFACE
      ?auto_558148 - SURFACE
      ?auto_558149 - SURFACE
      ?auto_558150 - SURFACE
      ?auto_558151 - SURFACE
      ?auto_558152 - SURFACE
      ?auto_558153 - SURFACE
    )
    :vars
    (
      ?auto_558157 - HOIST
      ?auto_558156 - PLACE
      ?auto_558155 - TRUCK
      ?auto_558154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_558157 ?auto_558156 ) ( SURFACE-AT ?auto_558152 ?auto_558156 ) ( CLEAR ?auto_558152 ) ( IS-CRATE ?auto_558153 ) ( not ( = ?auto_558152 ?auto_558153 ) ) ( AVAILABLE ?auto_558157 ) ( IN ?auto_558153 ?auto_558155 ) ( ON ?auto_558152 ?auto_558151 ) ( not ( = ?auto_558151 ?auto_558152 ) ) ( not ( = ?auto_558151 ?auto_558153 ) ) ( TRUCK-AT ?auto_558155 ?auto_558154 ) ( not ( = ?auto_558154 ?auto_558156 ) ) ( ON ?auto_558148 ?auto_558147 ) ( ON ?auto_558149 ?auto_558148 ) ( ON ?auto_558150 ?auto_558149 ) ( ON ?auto_558151 ?auto_558150 ) ( not ( = ?auto_558147 ?auto_558148 ) ) ( not ( = ?auto_558147 ?auto_558149 ) ) ( not ( = ?auto_558147 ?auto_558150 ) ) ( not ( = ?auto_558147 ?auto_558151 ) ) ( not ( = ?auto_558147 ?auto_558152 ) ) ( not ( = ?auto_558147 ?auto_558153 ) ) ( not ( = ?auto_558148 ?auto_558149 ) ) ( not ( = ?auto_558148 ?auto_558150 ) ) ( not ( = ?auto_558148 ?auto_558151 ) ) ( not ( = ?auto_558148 ?auto_558152 ) ) ( not ( = ?auto_558148 ?auto_558153 ) ) ( not ( = ?auto_558149 ?auto_558150 ) ) ( not ( = ?auto_558149 ?auto_558151 ) ) ( not ( = ?auto_558149 ?auto_558152 ) ) ( not ( = ?auto_558149 ?auto_558153 ) ) ( not ( = ?auto_558150 ?auto_558151 ) ) ( not ( = ?auto_558150 ?auto_558152 ) ) ( not ( = ?auto_558150 ?auto_558153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558151 ?auto_558152 ?auto_558153 )
      ( MAKE-6CRATE-VERIFY ?auto_558147 ?auto_558148 ?auto_558149 ?auto_558150 ?auto_558151 ?auto_558152 ?auto_558153 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558204 - SURFACE
      ?auto_558205 - SURFACE
      ?auto_558206 - SURFACE
      ?auto_558207 - SURFACE
      ?auto_558208 - SURFACE
      ?auto_558209 - SURFACE
      ?auto_558210 - SURFACE
    )
    :vars
    (
      ?auto_558211 - HOIST
      ?auto_558214 - PLACE
      ?auto_558215 - TRUCK
      ?auto_558212 - PLACE
      ?auto_558213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_558211 ?auto_558214 ) ( SURFACE-AT ?auto_558209 ?auto_558214 ) ( CLEAR ?auto_558209 ) ( IS-CRATE ?auto_558210 ) ( not ( = ?auto_558209 ?auto_558210 ) ) ( AVAILABLE ?auto_558211 ) ( ON ?auto_558209 ?auto_558208 ) ( not ( = ?auto_558208 ?auto_558209 ) ) ( not ( = ?auto_558208 ?auto_558210 ) ) ( TRUCK-AT ?auto_558215 ?auto_558212 ) ( not ( = ?auto_558212 ?auto_558214 ) ) ( HOIST-AT ?auto_558213 ?auto_558212 ) ( LIFTING ?auto_558213 ?auto_558210 ) ( not ( = ?auto_558211 ?auto_558213 ) ) ( ON ?auto_558205 ?auto_558204 ) ( ON ?auto_558206 ?auto_558205 ) ( ON ?auto_558207 ?auto_558206 ) ( ON ?auto_558208 ?auto_558207 ) ( not ( = ?auto_558204 ?auto_558205 ) ) ( not ( = ?auto_558204 ?auto_558206 ) ) ( not ( = ?auto_558204 ?auto_558207 ) ) ( not ( = ?auto_558204 ?auto_558208 ) ) ( not ( = ?auto_558204 ?auto_558209 ) ) ( not ( = ?auto_558204 ?auto_558210 ) ) ( not ( = ?auto_558205 ?auto_558206 ) ) ( not ( = ?auto_558205 ?auto_558207 ) ) ( not ( = ?auto_558205 ?auto_558208 ) ) ( not ( = ?auto_558205 ?auto_558209 ) ) ( not ( = ?auto_558205 ?auto_558210 ) ) ( not ( = ?auto_558206 ?auto_558207 ) ) ( not ( = ?auto_558206 ?auto_558208 ) ) ( not ( = ?auto_558206 ?auto_558209 ) ) ( not ( = ?auto_558206 ?auto_558210 ) ) ( not ( = ?auto_558207 ?auto_558208 ) ) ( not ( = ?auto_558207 ?auto_558209 ) ) ( not ( = ?auto_558207 ?auto_558210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558208 ?auto_558209 ?auto_558210 )
      ( MAKE-6CRATE-VERIFY ?auto_558204 ?auto_558205 ?auto_558206 ?auto_558207 ?auto_558208 ?auto_558209 ?auto_558210 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558267 - SURFACE
      ?auto_558268 - SURFACE
      ?auto_558269 - SURFACE
      ?auto_558270 - SURFACE
      ?auto_558271 - SURFACE
      ?auto_558272 - SURFACE
      ?auto_558273 - SURFACE
    )
    :vars
    (
      ?auto_558278 - HOIST
      ?auto_558275 - PLACE
      ?auto_558279 - TRUCK
      ?auto_558277 - PLACE
      ?auto_558276 - HOIST
      ?auto_558274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_558278 ?auto_558275 ) ( SURFACE-AT ?auto_558272 ?auto_558275 ) ( CLEAR ?auto_558272 ) ( IS-CRATE ?auto_558273 ) ( not ( = ?auto_558272 ?auto_558273 ) ) ( AVAILABLE ?auto_558278 ) ( ON ?auto_558272 ?auto_558271 ) ( not ( = ?auto_558271 ?auto_558272 ) ) ( not ( = ?auto_558271 ?auto_558273 ) ) ( TRUCK-AT ?auto_558279 ?auto_558277 ) ( not ( = ?auto_558277 ?auto_558275 ) ) ( HOIST-AT ?auto_558276 ?auto_558277 ) ( not ( = ?auto_558278 ?auto_558276 ) ) ( AVAILABLE ?auto_558276 ) ( SURFACE-AT ?auto_558273 ?auto_558277 ) ( ON ?auto_558273 ?auto_558274 ) ( CLEAR ?auto_558273 ) ( not ( = ?auto_558272 ?auto_558274 ) ) ( not ( = ?auto_558273 ?auto_558274 ) ) ( not ( = ?auto_558271 ?auto_558274 ) ) ( ON ?auto_558268 ?auto_558267 ) ( ON ?auto_558269 ?auto_558268 ) ( ON ?auto_558270 ?auto_558269 ) ( ON ?auto_558271 ?auto_558270 ) ( not ( = ?auto_558267 ?auto_558268 ) ) ( not ( = ?auto_558267 ?auto_558269 ) ) ( not ( = ?auto_558267 ?auto_558270 ) ) ( not ( = ?auto_558267 ?auto_558271 ) ) ( not ( = ?auto_558267 ?auto_558272 ) ) ( not ( = ?auto_558267 ?auto_558273 ) ) ( not ( = ?auto_558267 ?auto_558274 ) ) ( not ( = ?auto_558268 ?auto_558269 ) ) ( not ( = ?auto_558268 ?auto_558270 ) ) ( not ( = ?auto_558268 ?auto_558271 ) ) ( not ( = ?auto_558268 ?auto_558272 ) ) ( not ( = ?auto_558268 ?auto_558273 ) ) ( not ( = ?auto_558268 ?auto_558274 ) ) ( not ( = ?auto_558269 ?auto_558270 ) ) ( not ( = ?auto_558269 ?auto_558271 ) ) ( not ( = ?auto_558269 ?auto_558272 ) ) ( not ( = ?auto_558269 ?auto_558273 ) ) ( not ( = ?auto_558269 ?auto_558274 ) ) ( not ( = ?auto_558270 ?auto_558271 ) ) ( not ( = ?auto_558270 ?auto_558272 ) ) ( not ( = ?auto_558270 ?auto_558273 ) ) ( not ( = ?auto_558270 ?auto_558274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558271 ?auto_558272 ?auto_558273 )
      ( MAKE-6CRATE-VERIFY ?auto_558267 ?auto_558268 ?auto_558269 ?auto_558270 ?auto_558271 ?auto_558272 ?auto_558273 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558331 - SURFACE
      ?auto_558332 - SURFACE
      ?auto_558333 - SURFACE
      ?auto_558334 - SURFACE
      ?auto_558335 - SURFACE
      ?auto_558336 - SURFACE
      ?auto_558337 - SURFACE
    )
    :vars
    (
      ?auto_558339 - HOIST
      ?auto_558343 - PLACE
      ?auto_558340 - PLACE
      ?auto_558342 - HOIST
      ?auto_558341 - SURFACE
      ?auto_558338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558339 ?auto_558343 ) ( SURFACE-AT ?auto_558336 ?auto_558343 ) ( CLEAR ?auto_558336 ) ( IS-CRATE ?auto_558337 ) ( not ( = ?auto_558336 ?auto_558337 ) ) ( AVAILABLE ?auto_558339 ) ( ON ?auto_558336 ?auto_558335 ) ( not ( = ?auto_558335 ?auto_558336 ) ) ( not ( = ?auto_558335 ?auto_558337 ) ) ( not ( = ?auto_558340 ?auto_558343 ) ) ( HOIST-AT ?auto_558342 ?auto_558340 ) ( not ( = ?auto_558339 ?auto_558342 ) ) ( AVAILABLE ?auto_558342 ) ( SURFACE-AT ?auto_558337 ?auto_558340 ) ( ON ?auto_558337 ?auto_558341 ) ( CLEAR ?auto_558337 ) ( not ( = ?auto_558336 ?auto_558341 ) ) ( not ( = ?auto_558337 ?auto_558341 ) ) ( not ( = ?auto_558335 ?auto_558341 ) ) ( TRUCK-AT ?auto_558338 ?auto_558343 ) ( ON ?auto_558332 ?auto_558331 ) ( ON ?auto_558333 ?auto_558332 ) ( ON ?auto_558334 ?auto_558333 ) ( ON ?auto_558335 ?auto_558334 ) ( not ( = ?auto_558331 ?auto_558332 ) ) ( not ( = ?auto_558331 ?auto_558333 ) ) ( not ( = ?auto_558331 ?auto_558334 ) ) ( not ( = ?auto_558331 ?auto_558335 ) ) ( not ( = ?auto_558331 ?auto_558336 ) ) ( not ( = ?auto_558331 ?auto_558337 ) ) ( not ( = ?auto_558331 ?auto_558341 ) ) ( not ( = ?auto_558332 ?auto_558333 ) ) ( not ( = ?auto_558332 ?auto_558334 ) ) ( not ( = ?auto_558332 ?auto_558335 ) ) ( not ( = ?auto_558332 ?auto_558336 ) ) ( not ( = ?auto_558332 ?auto_558337 ) ) ( not ( = ?auto_558332 ?auto_558341 ) ) ( not ( = ?auto_558333 ?auto_558334 ) ) ( not ( = ?auto_558333 ?auto_558335 ) ) ( not ( = ?auto_558333 ?auto_558336 ) ) ( not ( = ?auto_558333 ?auto_558337 ) ) ( not ( = ?auto_558333 ?auto_558341 ) ) ( not ( = ?auto_558334 ?auto_558335 ) ) ( not ( = ?auto_558334 ?auto_558336 ) ) ( not ( = ?auto_558334 ?auto_558337 ) ) ( not ( = ?auto_558334 ?auto_558341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558335 ?auto_558336 ?auto_558337 )
      ( MAKE-6CRATE-VERIFY ?auto_558331 ?auto_558332 ?auto_558333 ?auto_558334 ?auto_558335 ?auto_558336 ?auto_558337 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558395 - SURFACE
      ?auto_558396 - SURFACE
      ?auto_558397 - SURFACE
      ?auto_558398 - SURFACE
      ?auto_558399 - SURFACE
      ?auto_558400 - SURFACE
      ?auto_558401 - SURFACE
    )
    :vars
    (
      ?auto_558407 - HOIST
      ?auto_558405 - PLACE
      ?auto_558406 - PLACE
      ?auto_558403 - HOIST
      ?auto_558404 - SURFACE
      ?auto_558402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558407 ?auto_558405 ) ( IS-CRATE ?auto_558401 ) ( not ( = ?auto_558400 ?auto_558401 ) ) ( not ( = ?auto_558399 ?auto_558400 ) ) ( not ( = ?auto_558399 ?auto_558401 ) ) ( not ( = ?auto_558406 ?auto_558405 ) ) ( HOIST-AT ?auto_558403 ?auto_558406 ) ( not ( = ?auto_558407 ?auto_558403 ) ) ( AVAILABLE ?auto_558403 ) ( SURFACE-AT ?auto_558401 ?auto_558406 ) ( ON ?auto_558401 ?auto_558404 ) ( CLEAR ?auto_558401 ) ( not ( = ?auto_558400 ?auto_558404 ) ) ( not ( = ?auto_558401 ?auto_558404 ) ) ( not ( = ?auto_558399 ?auto_558404 ) ) ( TRUCK-AT ?auto_558402 ?auto_558405 ) ( SURFACE-AT ?auto_558399 ?auto_558405 ) ( CLEAR ?auto_558399 ) ( LIFTING ?auto_558407 ?auto_558400 ) ( IS-CRATE ?auto_558400 ) ( ON ?auto_558396 ?auto_558395 ) ( ON ?auto_558397 ?auto_558396 ) ( ON ?auto_558398 ?auto_558397 ) ( ON ?auto_558399 ?auto_558398 ) ( not ( = ?auto_558395 ?auto_558396 ) ) ( not ( = ?auto_558395 ?auto_558397 ) ) ( not ( = ?auto_558395 ?auto_558398 ) ) ( not ( = ?auto_558395 ?auto_558399 ) ) ( not ( = ?auto_558395 ?auto_558400 ) ) ( not ( = ?auto_558395 ?auto_558401 ) ) ( not ( = ?auto_558395 ?auto_558404 ) ) ( not ( = ?auto_558396 ?auto_558397 ) ) ( not ( = ?auto_558396 ?auto_558398 ) ) ( not ( = ?auto_558396 ?auto_558399 ) ) ( not ( = ?auto_558396 ?auto_558400 ) ) ( not ( = ?auto_558396 ?auto_558401 ) ) ( not ( = ?auto_558396 ?auto_558404 ) ) ( not ( = ?auto_558397 ?auto_558398 ) ) ( not ( = ?auto_558397 ?auto_558399 ) ) ( not ( = ?auto_558397 ?auto_558400 ) ) ( not ( = ?auto_558397 ?auto_558401 ) ) ( not ( = ?auto_558397 ?auto_558404 ) ) ( not ( = ?auto_558398 ?auto_558399 ) ) ( not ( = ?auto_558398 ?auto_558400 ) ) ( not ( = ?auto_558398 ?auto_558401 ) ) ( not ( = ?auto_558398 ?auto_558404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558399 ?auto_558400 ?auto_558401 )
      ( MAKE-6CRATE-VERIFY ?auto_558395 ?auto_558396 ?auto_558397 ?auto_558398 ?auto_558399 ?auto_558400 ?auto_558401 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558459 - SURFACE
      ?auto_558460 - SURFACE
      ?auto_558461 - SURFACE
      ?auto_558462 - SURFACE
      ?auto_558463 - SURFACE
      ?auto_558464 - SURFACE
      ?auto_558465 - SURFACE
    )
    :vars
    (
      ?auto_558470 - HOIST
      ?auto_558471 - PLACE
      ?auto_558467 - PLACE
      ?auto_558466 - HOIST
      ?auto_558469 - SURFACE
      ?auto_558468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558470 ?auto_558471 ) ( IS-CRATE ?auto_558465 ) ( not ( = ?auto_558464 ?auto_558465 ) ) ( not ( = ?auto_558463 ?auto_558464 ) ) ( not ( = ?auto_558463 ?auto_558465 ) ) ( not ( = ?auto_558467 ?auto_558471 ) ) ( HOIST-AT ?auto_558466 ?auto_558467 ) ( not ( = ?auto_558470 ?auto_558466 ) ) ( AVAILABLE ?auto_558466 ) ( SURFACE-AT ?auto_558465 ?auto_558467 ) ( ON ?auto_558465 ?auto_558469 ) ( CLEAR ?auto_558465 ) ( not ( = ?auto_558464 ?auto_558469 ) ) ( not ( = ?auto_558465 ?auto_558469 ) ) ( not ( = ?auto_558463 ?auto_558469 ) ) ( TRUCK-AT ?auto_558468 ?auto_558471 ) ( SURFACE-AT ?auto_558463 ?auto_558471 ) ( CLEAR ?auto_558463 ) ( IS-CRATE ?auto_558464 ) ( AVAILABLE ?auto_558470 ) ( IN ?auto_558464 ?auto_558468 ) ( ON ?auto_558460 ?auto_558459 ) ( ON ?auto_558461 ?auto_558460 ) ( ON ?auto_558462 ?auto_558461 ) ( ON ?auto_558463 ?auto_558462 ) ( not ( = ?auto_558459 ?auto_558460 ) ) ( not ( = ?auto_558459 ?auto_558461 ) ) ( not ( = ?auto_558459 ?auto_558462 ) ) ( not ( = ?auto_558459 ?auto_558463 ) ) ( not ( = ?auto_558459 ?auto_558464 ) ) ( not ( = ?auto_558459 ?auto_558465 ) ) ( not ( = ?auto_558459 ?auto_558469 ) ) ( not ( = ?auto_558460 ?auto_558461 ) ) ( not ( = ?auto_558460 ?auto_558462 ) ) ( not ( = ?auto_558460 ?auto_558463 ) ) ( not ( = ?auto_558460 ?auto_558464 ) ) ( not ( = ?auto_558460 ?auto_558465 ) ) ( not ( = ?auto_558460 ?auto_558469 ) ) ( not ( = ?auto_558461 ?auto_558462 ) ) ( not ( = ?auto_558461 ?auto_558463 ) ) ( not ( = ?auto_558461 ?auto_558464 ) ) ( not ( = ?auto_558461 ?auto_558465 ) ) ( not ( = ?auto_558461 ?auto_558469 ) ) ( not ( = ?auto_558462 ?auto_558463 ) ) ( not ( = ?auto_558462 ?auto_558464 ) ) ( not ( = ?auto_558462 ?auto_558465 ) ) ( not ( = ?auto_558462 ?auto_558469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558463 ?auto_558464 ?auto_558465 )
      ( MAKE-6CRATE-VERIFY ?auto_558459 ?auto_558460 ?auto_558461 ?auto_558462 ?auto_558463 ?auto_558464 ?auto_558465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_560135 - SURFACE
      ?auto_560136 - SURFACE
    )
    :vars
    (
      ?auto_560140 - HOIST
      ?auto_560137 - PLACE
      ?auto_560139 - SURFACE
      ?auto_560142 - PLACE
      ?auto_560138 - HOIST
      ?auto_560141 - SURFACE
      ?auto_560143 - TRUCK
      ?auto_560144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560140 ?auto_560137 ) ( SURFACE-AT ?auto_560135 ?auto_560137 ) ( CLEAR ?auto_560135 ) ( IS-CRATE ?auto_560136 ) ( not ( = ?auto_560135 ?auto_560136 ) ) ( ON ?auto_560135 ?auto_560139 ) ( not ( = ?auto_560139 ?auto_560135 ) ) ( not ( = ?auto_560139 ?auto_560136 ) ) ( not ( = ?auto_560142 ?auto_560137 ) ) ( HOIST-AT ?auto_560138 ?auto_560142 ) ( not ( = ?auto_560140 ?auto_560138 ) ) ( AVAILABLE ?auto_560138 ) ( SURFACE-AT ?auto_560136 ?auto_560142 ) ( ON ?auto_560136 ?auto_560141 ) ( CLEAR ?auto_560136 ) ( not ( = ?auto_560135 ?auto_560141 ) ) ( not ( = ?auto_560136 ?auto_560141 ) ) ( not ( = ?auto_560139 ?auto_560141 ) ) ( TRUCK-AT ?auto_560143 ?auto_560137 ) ( LIFTING ?auto_560140 ?auto_560144 ) ( IS-CRATE ?auto_560144 ) ( not ( = ?auto_560135 ?auto_560144 ) ) ( not ( = ?auto_560136 ?auto_560144 ) ) ( not ( = ?auto_560139 ?auto_560144 ) ) ( not ( = ?auto_560141 ?auto_560144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_560140 ?auto_560144 ?auto_560143 ?auto_560137 )
      ( MAKE-1CRATE ?auto_560135 ?auto_560136 )
      ( MAKE-1CRATE-VERIFY ?auto_560135 ?auto_560136 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560411 - SURFACE
      ?auto_560412 - SURFACE
      ?auto_560413 - SURFACE
      ?auto_560414 - SURFACE
      ?auto_560415 - SURFACE
      ?auto_560416 - SURFACE
      ?auto_560417 - SURFACE
      ?auto_560418 - SURFACE
    )
    :vars
    (
      ?auto_560419 - HOIST
      ?auto_560420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560419 ?auto_560420 ) ( SURFACE-AT ?auto_560417 ?auto_560420 ) ( CLEAR ?auto_560417 ) ( LIFTING ?auto_560419 ?auto_560418 ) ( IS-CRATE ?auto_560418 ) ( not ( = ?auto_560417 ?auto_560418 ) ) ( ON ?auto_560412 ?auto_560411 ) ( ON ?auto_560413 ?auto_560412 ) ( ON ?auto_560414 ?auto_560413 ) ( ON ?auto_560415 ?auto_560414 ) ( ON ?auto_560416 ?auto_560415 ) ( ON ?auto_560417 ?auto_560416 ) ( not ( = ?auto_560411 ?auto_560412 ) ) ( not ( = ?auto_560411 ?auto_560413 ) ) ( not ( = ?auto_560411 ?auto_560414 ) ) ( not ( = ?auto_560411 ?auto_560415 ) ) ( not ( = ?auto_560411 ?auto_560416 ) ) ( not ( = ?auto_560411 ?auto_560417 ) ) ( not ( = ?auto_560411 ?auto_560418 ) ) ( not ( = ?auto_560412 ?auto_560413 ) ) ( not ( = ?auto_560412 ?auto_560414 ) ) ( not ( = ?auto_560412 ?auto_560415 ) ) ( not ( = ?auto_560412 ?auto_560416 ) ) ( not ( = ?auto_560412 ?auto_560417 ) ) ( not ( = ?auto_560412 ?auto_560418 ) ) ( not ( = ?auto_560413 ?auto_560414 ) ) ( not ( = ?auto_560413 ?auto_560415 ) ) ( not ( = ?auto_560413 ?auto_560416 ) ) ( not ( = ?auto_560413 ?auto_560417 ) ) ( not ( = ?auto_560413 ?auto_560418 ) ) ( not ( = ?auto_560414 ?auto_560415 ) ) ( not ( = ?auto_560414 ?auto_560416 ) ) ( not ( = ?auto_560414 ?auto_560417 ) ) ( not ( = ?auto_560414 ?auto_560418 ) ) ( not ( = ?auto_560415 ?auto_560416 ) ) ( not ( = ?auto_560415 ?auto_560417 ) ) ( not ( = ?auto_560415 ?auto_560418 ) ) ( not ( = ?auto_560416 ?auto_560417 ) ) ( not ( = ?auto_560416 ?auto_560418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_560417 ?auto_560418 )
      ( MAKE-7CRATE-VERIFY ?auto_560411 ?auto_560412 ?auto_560413 ?auto_560414 ?auto_560415 ?auto_560416 ?auto_560417 ?auto_560418 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560466 - SURFACE
      ?auto_560467 - SURFACE
      ?auto_560468 - SURFACE
      ?auto_560469 - SURFACE
      ?auto_560470 - SURFACE
      ?auto_560471 - SURFACE
      ?auto_560472 - SURFACE
      ?auto_560473 - SURFACE
    )
    :vars
    (
      ?auto_560476 - HOIST
      ?auto_560475 - PLACE
      ?auto_560474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560476 ?auto_560475 ) ( SURFACE-AT ?auto_560472 ?auto_560475 ) ( CLEAR ?auto_560472 ) ( IS-CRATE ?auto_560473 ) ( not ( = ?auto_560472 ?auto_560473 ) ) ( TRUCK-AT ?auto_560474 ?auto_560475 ) ( AVAILABLE ?auto_560476 ) ( IN ?auto_560473 ?auto_560474 ) ( ON ?auto_560472 ?auto_560471 ) ( not ( = ?auto_560471 ?auto_560472 ) ) ( not ( = ?auto_560471 ?auto_560473 ) ) ( ON ?auto_560467 ?auto_560466 ) ( ON ?auto_560468 ?auto_560467 ) ( ON ?auto_560469 ?auto_560468 ) ( ON ?auto_560470 ?auto_560469 ) ( ON ?auto_560471 ?auto_560470 ) ( not ( = ?auto_560466 ?auto_560467 ) ) ( not ( = ?auto_560466 ?auto_560468 ) ) ( not ( = ?auto_560466 ?auto_560469 ) ) ( not ( = ?auto_560466 ?auto_560470 ) ) ( not ( = ?auto_560466 ?auto_560471 ) ) ( not ( = ?auto_560466 ?auto_560472 ) ) ( not ( = ?auto_560466 ?auto_560473 ) ) ( not ( = ?auto_560467 ?auto_560468 ) ) ( not ( = ?auto_560467 ?auto_560469 ) ) ( not ( = ?auto_560467 ?auto_560470 ) ) ( not ( = ?auto_560467 ?auto_560471 ) ) ( not ( = ?auto_560467 ?auto_560472 ) ) ( not ( = ?auto_560467 ?auto_560473 ) ) ( not ( = ?auto_560468 ?auto_560469 ) ) ( not ( = ?auto_560468 ?auto_560470 ) ) ( not ( = ?auto_560468 ?auto_560471 ) ) ( not ( = ?auto_560468 ?auto_560472 ) ) ( not ( = ?auto_560468 ?auto_560473 ) ) ( not ( = ?auto_560469 ?auto_560470 ) ) ( not ( = ?auto_560469 ?auto_560471 ) ) ( not ( = ?auto_560469 ?auto_560472 ) ) ( not ( = ?auto_560469 ?auto_560473 ) ) ( not ( = ?auto_560470 ?auto_560471 ) ) ( not ( = ?auto_560470 ?auto_560472 ) ) ( not ( = ?auto_560470 ?auto_560473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560471 ?auto_560472 ?auto_560473 )
      ( MAKE-7CRATE-VERIFY ?auto_560466 ?auto_560467 ?auto_560468 ?auto_560469 ?auto_560470 ?auto_560471 ?auto_560472 ?auto_560473 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560529 - SURFACE
      ?auto_560530 - SURFACE
      ?auto_560531 - SURFACE
      ?auto_560532 - SURFACE
      ?auto_560533 - SURFACE
      ?auto_560534 - SURFACE
      ?auto_560535 - SURFACE
      ?auto_560536 - SURFACE
    )
    :vars
    (
      ?auto_560540 - HOIST
      ?auto_560538 - PLACE
      ?auto_560537 - TRUCK
      ?auto_560539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560540 ?auto_560538 ) ( SURFACE-AT ?auto_560535 ?auto_560538 ) ( CLEAR ?auto_560535 ) ( IS-CRATE ?auto_560536 ) ( not ( = ?auto_560535 ?auto_560536 ) ) ( AVAILABLE ?auto_560540 ) ( IN ?auto_560536 ?auto_560537 ) ( ON ?auto_560535 ?auto_560534 ) ( not ( = ?auto_560534 ?auto_560535 ) ) ( not ( = ?auto_560534 ?auto_560536 ) ) ( TRUCK-AT ?auto_560537 ?auto_560539 ) ( not ( = ?auto_560539 ?auto_560538 ) ) ( ON ?auto_560530 ?auto_560529 ) ( ON ?auto_560531 ?auto_560530 ) ( ON ?auto_560532 ?auto_560531 ) ( ON ?auto_560533 ?auto_560532 ) ( ON ?auto_560534 ?auto_560533 ) ( not ( = ?auto_560529 ?auto_560530 ) ) ( not ( = ?auto_560529 ?auto_560531 ) ) ( not ( = ?auto_560529 ?auto_560532 ) ) ( not ( = ?auto_560529 ?auto_560533 ) ) ( not ( = ?auto_560529 ?auto_560534 ) ) ( not ( = ?auto_560529 ?auto_560535 ) ) ( not ( = ?auto_560529 ?auto_560536 ) ) ( not ( = ?auto_560530 ?auto_560531 ) ) ( not ( = ?auto_560530 ?auto_560532 ) ) ( not ( = ?auto_560530 ?auto_560533 ) ) ( not ( = ?auto_560530 ?auto_560534 ) ) ( not ( = ?auto_560530 ?auto_560535 ) ) ( not ( = ?auto_560530 ?auto_560536 ) ) ( not ( = ?auto_560531 ?auto_560532 ) ) ( not ( = ?auto_560531 ?auto_560533 ) ) ( not ( = ?auto_560531 ?auto_560534 ) ) ( not ( = ?auto_560531 ?auto_560535 ) ) ( not ( = ?auto_560531 ?auto_560536 ) ) ( not ( = ?auto_560532 ?auto_560533 ) ) ( not ( = ?auto_560532 ?auto_560534 ) ) ( not ( = ?auto_560532 ?auto_560535 ) ) ( not ( = ?auto_560532 ?auto_560536 ) ) ( not ( = ?auto_560533 ?auto_560534 ) ) ( not ( = ?auto_560533 ?auto_560535 ) ) ( not ( = ?auto_560533 ?auto_560536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560534 ?auto_560535 ?auto_560536 )
      ( MAKE-7CRATE-VERIFY ?auto_560529 ?auto_560530 ?auto_560531 ?auto_560532 ?auto_560533 ?auto_560534 ?auto_560535 ?auto_560536 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560599 - SURFACE
      ?auto_560600 - SURFACE
      ?auto_560601 - SURFACE
      ?auto_560602 - SURFACE
      ?auto_560603 - SURFACE
      ?auto_560604 - SURFACE
      ?auto_560605 - SURFACE
      ?auto_560606 - SURFACE
    )
    :vars
    (
      ?auto_560608 - HOIST
      ?auto_560610 - PLACE
      ?auto_560611 - TRUCK
      ?auto_560609 - PLACE
      ?auto_560607 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_560608 ?auto_560610 ) ( SURFACE-AT ?auto_560605 ?auto_560610 ) ( CLEAR ?auto_560605 ) ( IS-CRATE ?auto_560606 ) ( not ( = ?auto_560605 ?auto_560606 ) ) ( AVAILABLE ?auto_560608 ) ( ON ?auto_560605 ?auto_560604 ) ( not ( = ?auto_560604 ?auto_560605 ) ) ( not ( = ?auto_560604 ?auto_560606 ) ) ( TRUCK-AT ?auto_560611 ?auto_560609 ) ( not ( = ?auto_560609 ?auto_560610 ) ) ( HOIST-AT ?auto_560607 ?auto_560609 ) ( LIFTING ?auto_560607 ?auto_560606 ) ( not ( = ?auto_560608 ?auto_560607 ) ) ( ON ?auto_560600 ?auto_560599 ) ( ON ?auto_560601 ?auto_560600 ) ( ON ?auto_560602 ?auto_560601 ) ( ON ?auto_560603 ?auto_560602 ) ( ON ?auto_560604 ?auto_560603 ) ( not ( = ?auto_560599 ?auto_560600 ) ) ( not ( = ?auto_560599 ?auto_560601 ) ) ( not ( = ?auto_560599 ?auto_560602 ) ) ( not ( = ?auto_560599 ?auto_560603 ) ) ( not ( = ?auto_560599 ?auto_560604 ) ) ( not ( = ?auto_560599 ?auto_560605 ) ) ( not ( = ?auto_560599 ?auto_560606 ) ) ( not ( = ?auto_560600 ?auto_560601 ) ) ( not ( = ?auto_560600 ?auto_560602 ) ) ( not ( = ?auto_560600 ?auto_560603 ) ) ( not ( = ?auto_560600 ?auto_560604 ) ) ( not ( = ?auto_560600 ?auto_560605 ) ) ( not ( = ?auto_560600 ?auto_560606 ) ) ( not ( = ?auto_560601 ?auto_560602 ) ) ( not ( = ?auto_560601 ?auto_560603 ) ) ( not ( = ?auto_560601 ?auto_560604 ) ) ( not ( = ?auto_560601 ?auto_560605 ) ) ( not ( = ?auto_560601 ?auto_560606 ) ) ( not ( = ?auto_560602 ?auto_560603 ) ) ( not ( = ?auto_560602 ?auto_560604 ) ) ( not ( = ?auto_560602 ?auto_560605 ) ) ( not ( = ?auto_560602 ?auto_560606 ) ) ( not ( = ?auto_560603 ?auto_560604 ) ) ( not ( = ?auto_560603 ?auto_560605 ) ) ( not ( = ?auto_560603 ?auto_560606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560604 ?auto_560605 ?auto_560606 )
      ( MAKE-7CRATE-VERIFY ?auto_560599 ?auto_560600 ?auto_560601 ?auto_560602 ?auto_560603 ?auto_560604 ?auto_560605 ?auto_560606 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560676 - SURFACE
      ?auto_560677 - SURFACE
      ?auto_560678 - SURFACE
      ?auto_560679 - SURFACE
      ?auto_560680 - SURFACE
      ?auto_560681 - SURFACE
      ?auto_560682 - SURFACE
      ?auto_560683 - SURFACE
    )
    :vars
    (
      ?auto_560686 - HOIST
      ?auto_560687 - PLACE
      ?auto_560685 - TRUCK
      ?auto_560689 - PLACE
      ?auto_560684 - HOIST
      ?auto_560688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560686 ?auto_560687 ) ( SURFACE-AT ?auto_560682 ?auto_560687 ) ( CLEAR ?auto_560682 ) ( IS-CRATE ?auto_560683 ) ( not ( = ?auto_560682 ?auto_560683 ) ) ( AVAILABLE ?auto_560686 ) ( ON ?auto_560682 ?auto_560681 ) ( not ( = ?auto_560681 ?auto_560682 ) ) ( not ( = ?auto_560681 ?auto_560683 ) ) ( TRUCK-AT ?auto_560685 ?auto_560689 ) ( not ( = ?auto_560689 ?auto_560687 ) ) ( HOIST-AT ?auto_560684 ?auto_560689 ) ( not ( = ?auto_560686 ?auto_560684 ) ) ( AVAILABLE ?auto_560684 ) ( SURFACE-AT ?auto_560683 ?auto_560689 ) ( ON ?auto_560683 ?auto_560688 ) ( CLEAR ?auto_560683 ) ( not ( = ?auto_560682 ?auto_560688 ) ) ( not ( = ?auto_560683 ?auto_560688 ) ) ( not ( = ?auto_560681 ?auto_560688 ) ) ( ON ?auto_560677 ?auto_560676 ) ( ON ?auto_560678 ?auto_560677 ) ( ON ?auto_560679 ?auto_560678 ) ( ON ?auto_560680 ?auto_560679 ) ( ON ?auto_560681 ?auto_560680 ) ( not ( = ?auto_560676 ?auto_560677 ) ) ( not ( = ?auto_560676 ?auto_560678 ) ) ( not ( = ?auto_560676 ?auto_560679 ) ) ( not ( = ?auto_560676 ?auto_560680 ) ) ( not ( = ?auto_560676 ?auto_560681 ) ) ( not ( = ?auto_560676 ?auto_560682 ) ) ( not ( = ?auto_560676 ?auto_560683 ) ) ( not ( = ?auto_560676 ?auto_560688 ) ) ( not ( = ?auto_560677 ?auto_560678 ) ) ( not ( = ?auto_560677 ?auto_560679 ) ) ( not ( = ?auto_560677 ?auto_560680 ) ) ( not ( = ?auto_560677 ?auto_560681 ) ) ( not ( = ?auto_560677 ?auto_560682 ) ) ( not ( = ?auto_560677 ?auto_560683 ) ) ( not ( = ?auto_560677 ?auto_560688 ) ) ( not ( = ?auto_560678 ?auto_560679 ) ) ( not ( = ?auto_560678 ?auto_560680 ) ) ( not ( = ?auto_560678 ?auto_560681 ) ) ( not ( = ?auto_560678 ?auto_560682 ) ) ( not ( = ?auto_560678 ?auto_560683 ) ) ( not ( = ?auto_560678 ?auto_560688 ) ) ( not ( = ?auto_560679 ?auto_560680 ) ) ( not ( = ?auto_560679 ?auto_560681 ) ) ( not ( = ?auto_560679 ?auto_560682 ) ) ( not ( = ?auto_560679 ?auto_560683 ) ) ( not ( = ?auto_560679 ?auto_560688 ) ) ( not ( = ?auto_560680 ?auto_560681 ) ) ( not ( = ?auto_560680 ?auto_560682 ) ) ( not ( = ?auto_560680 ?auto_560683 ) ) ( not ( = ?auto_560680 ?auto_560688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560681 ?auto_560682 ?auto_560683 )
      ( MAKE-7CRATE-VERIFY ?auto_560676 ?auto_560677 ?auto_560678 ?auto_560679 ?auto_560680 ?auto_560681 ?auto_560682 ?auto_560683 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560754 - SURFACE
      ?auto_560755 - SURFACE
      ?auto_560756 - SURFACE
      ?auto_560757 - SURFACE
      ?auto_560758 - SURFACE
      ?auto_560759 - SURFACE
      ?auto_560760 - SURFACE
      ?auto_560761 - SURFACE
    )
    :vars
    (
      ?auto_560763 - HOIST
      ?auto_560767 - PLACE
      ?auto_560766 - PLACE
      ?auto_560762 - HOIST
      ?auto_560765 - SURFACE
      ?auto_560764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560763 ?auto_560767 ) ( SURFACE-AT ?auto_560760 ?auto_560767 ) ( CLEAR ?auto_560760 ) ( IS-CRATE ?auto_560761 ) ( not ( = ?auto_560760 ?auto_560761 ) ) ( AVAILABLE ?auto_560763 ) ( ON ?auto_560760 ?auto_560759 ) ( not ( = ?auto_560759 ?auto_560760 ) ) ( not ( = ?auto_560759 ?auto_560761 ) ) ( not ( = ?auto_560766 ?auto_560767 ) ) ( HOIST-AT ?auto_560762 ?auto_560766 ) ( not ( = ?auto_560763 ?auto_560762 ) ) ( AVAILABLE ?auto_560762 ) ( SURFACE-AT ?auto_560761 ?auto_560766 ) ( ON ?auto_560761 ?auto_560765 ) ( CLEAR ?auto_560761 ) ( not ( = ?auto_560760 ?auto_560765 ) ) ( not ( = ?auto_560761 ?auto_560765 ) ) ( not ( = ?auto_560759 ?auto_560765 ) ) ( TRUCK-AT ?auto_560764 ?auto_560767 ) ( ON ?auto_560755 ?auto_560754 ) ( ON ?auto_560756 ?auto_560755 ) ( ON ?auto_560757 ?auto_560756 ) ( ON ?auto_560758 ?auto_560757 ) ( ON ?auto_560759 ?auto_560758 ) ( not ( = ?auto_560754 ?auto_560755 ) ) ( not ( = ?auto_560754 ?auto_560756 ) ) ( not ( = ?auto_560754 ?auto_560757 ) ) ( not ( = ?auto_560754 ?auto_560758 ) ) ( not ( = ?auto_560754 ?auto_560759 ) ) ( not ( = ?auto_560754 ?auto_560760 ) ) ( not ( = ?auto_560754 ?auto_560761 ) ) ( not ( = ?auto_560754 ?auto_560765 ) ) ( not ( = ?auto_560755 ?auto_560756 ) ) ( not ( = ?auto_560755 ?auto_560757 ) ) ( not ( = ?auto_560755 ?auto_560758 ) ) ( not ( = ?auto_560755 ?auto_560759 ) ) ( not ( = ?auto_560755 ?auto_560760 ) ) ( not ( = ?auto_560755 ?auto_560761 ) ) ( not ( = ?auto_560755 ?auto_560765 ) ) ( not ( = ?auto_560756 ?auto_560757 ) ) ( not ( = ?auto_560756 ?auto_560758 ) ) ( not ( = ?auto_560756 ?auto_560759 ) ) ( not ( = ?auto_560756 ?auto_560760 ) ) ( not ( = ?auto_560756 ?auto_560761 ) ) ( not ( = ?auto_560756 ?auto_560765 ) ) ( not ( = ?auto_560757 ?auto_560758 ) ) ( not ( = ?auto_560757 ?auto_560759 ) ) ( not ( = ?auto_560757 ?auto_560760 ) ) ( not ( = ?auto_560757 ?auto_560761 ) ) ( not ( = ?auto_560757 ?auto_560765 ) ) ( not ( = ?auto_560758 ?auto_560759 ) ) ( not ( = ?auto_560758 ?auto_560760 ) ) ( not ( = ?auto_560758 ?auto_560761 ) ) ( not ( = ?auto_560758 ?auto_560765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560759 ?auto_560760 ?auto_560761 )
      ( MAKE-7CRATE-VERIFY ?auto_560754 ?auto_560755 ?auto_560756 ?auto_560757 ?auto_560758 ?auto_560759 ?auto_560760 ?auto_560761 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560832 - SURFACE
      ?auto_560833 - SURFACE
      ?auto_560834 - SURFACE
      ?auto_560835 - SURFACE
      ?auto_560836 - SURFACE
      ?auto_560837 - SURFACE
      ?auto_560838 - SURFACE
      ?auto_560839 - SURFACE
    )
    :vars
    (
      ?auto_560844 - HOIST
      ?auto_560845 - PLACE
      ?auto_560843 - PLACE
      ?auto_560841 - HOIST
      ?auto_560842 - SURFACE
      ?auto_560840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560844 ?auto_560845 ) ( IS-CRATE ?auto_560839 ) ( not ( = ?auto_560838 ?auto_560839 ) ) ( not ( = ?auto_560837 ?auto_560838 ) ) ( not ( = ?auto_560837 ?auto_560839 ) ) ( not ( = ?auto_560843 ?auto_560845 ) ) ( HOIST-AT ?auto_560841 ?auto_560843 ) ( not ( = ?auto_560844 ?auto_560841 ) ) ( AVAILABLE ?auto_560841 ) ( SURFACE-AT ?auto_560839 ?auto_560843 ) ( ON ?auto_560839 ?auto_560842 ) ( CLEAR ?auto_560839 ) ( not ( = ?auto_560838 ?auto_560842 ) ) ( not ( = ?auto_560839 ?auto_560842 ) ) ( not ( = ?auto_560837 ?auto_560842 ) ) ( TRUCK-AT ?auto_560840 ?auto_560845 ) ( SURFACE-AT ?auto_560837 ?auto_560845 ) ( CLEAR ?auto_560837 ) ( LIFTING ?auto_560844 ?auto_560838 ) ( IS-CRATE ?auto_560838 ) ( ON ?auto_560833 ?auto_560832 ) ( ON ?auto_560834 ?auto_560833 ) ( ON ?auto_560835 ?auto_560834 ) ( ON ?auto_560836 ?auto_560835 ) ( ON ?auto_560837 ?auto_560836 ) ( not ( = ?auto_560832 ?auto_560833 ) ) ( not ( = ?auto_560832 ?auto_560834 ) ) ( not ( = ?auto_560832 ?auto_560835 ) ) ( not ( = ?auto_560832 ?auto_560836 ) ) ( not ( = ?auto_560832 ?auto_560837 ) ) ( not ( = ?auto_560832 ?auto_560838 ) ) ( not ( = ?auto_560832 ?auto_560839 ) ) ( not ( = ?auto_560832 ?auto_560842 ) ) ( not ( = ?auto_560833 ?auto_560834 ) ) ( not ( = ?auto_560833 ?auto_560835 ) ) ( not ( = ?auto_560833 ?auto_560836 ) ) ( not ( = ?auto_560833 ?auto_560837 ) ) ( not ( = ?auto_560833 ?auto_560838 ) ) ( not ( = ?auto_560833 ?auto_560839 ) ) ( not ( = ?auto_560833 ?auto_560842 ) ) ( not ( = ?auto_560834 ?auto_560835 ) ) ( not ( = ?auto_560834 ?auto_560836 ) ) ( not ( = ?auto_560834 ?auto_560837 ) ) ( not ( = ?auto_560834 ?auto_560838 ) ) ( not ( = ?auto_560834 ?auto_560839 ) ) ( not ( = ?auto_560834 ?auto_560842 ) ) ( not ( = ?auto_560835 ?auto_560836 ) ) ( not ( = ?auto_560835 ?auto_560837 ) ) ( not ( = ?auto_560835 ?auto_560838 ) ) ( not ( = ?auto_560835 ?auto_560839 ) ) ( not ( = ?auto_560835 ?auto_560842 ) ) ( not ( = ?auto_560836 ?auto_560837 ) ) ( not ( = ?auto_560836 ?auto_560838 ) ) ( not ( = ?auto_560836 ?auto_560839 ) ) ( not ( = ?auto_560836 ?auto_560842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560837 ?auto_560838 ?auto_560839 )
      ( MAKE-7CRATE-VERIFY ?auto_560832 ?auto_560833 ?auto_560834 ?auto_560835 ?auto_560836 ?auto_560837 ?auto_560838 ?auto_560839 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560910 - SURFACE
      ?auto_560911 - SURFACE
      ?auto_560912 - SURFACE
      ?auto_560913 - SURFACE
      ?auto_560914 - SURFACE
      ?auto_560915 - SURFACE
      ?auto_560916 - SURFACE
      ?auto_560917 - SURFACE
    )
    :vars
    (
      ?auto_560921 - HOIST
      ?auto_560922 - PLACE
      ?auto_560918 - PLACE
      ?auto_560919 - HOIST
      ?auto_560920 - SURFACE
      ?auto_560923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560921 ?auto_560922 ) ( IS-CRATE ?auto_560917 ) ( not ( = ?auto_560916 ?auto_560917 ) ) ( not ( = ?auto_560915 ?auto_560916 ) ) ( not ( = ?auto_560915 ?auto_560917 ) ) ( not ( = ?auto_560918 ?auto_560922 ) ) ( HOIST-AT ?auto_560919 ?auto_560918 ) ( not ( = ?auto_560921 ?auto_560919 ) ) ( AVAILABLE ?auto_560919 ) ( SURFACE-AT ?auto_560917 ?auto_560918 ) ( ON ?auto_560917 ?auto_560920 ) ( CLEAR ?auto_560917 ) ( not ( = ?auto_560916 ?auto_560920 ) ) ( not ( = ?auto_560917 ?auto_560920 ) ) ( not ( = ?auto_560915 ?auto_560920 ) ) ( TRUCK-AT ?auto_560923 ?auto_560922 ) ( SURFACE-AT ?auto_560915 ?auto_560922 ) ( CLEAR ?auto_560915 ) ( IS-CRATE ?auto_560916 ) ( AVAILABLE ?auto_560921 ) ( IN ?auto_560916 ?auto_560923 ) ( ON ?auto_560911 ?auto_560910 ) ( ON ?auto_560912 ?auto_560911 ) ( ON ?auto_560913 ?auto_560912 ) ( ON ?auto_560914 ?auto_560913 ) ( ON ?auto_560915 ?auto_560914 ) ( not ( = ?auto_560910 ?auto_560911 ) ) ( not ( = ?auto_560910 ?auto_560912 ) ) ( not ( = ?auto_560910 ?auto_560913 ) ) ( not ( = ?auto_560910 ?auto_560914 ) ) ( not ( = ?auto_560910 ?auto_560915 ) ) ( not ( = ?auto_560910 ?auto_560916 ) ) ( not ( = ?auto_560910 ?auto_560917 ) ) ( not ( = ?auto_560910 ?auto_560920 ) ) ( not ( = ?auto_560911 ?auto_560912 ) ) ( not ( = ?auto_560911 ?auto_560913 ) ) ( not ( = ?auto_560911 ?auto_560914 ) ) ( not ( = ?auto_560911 ?auto_560915 ) ) ( not ( = ?auto_560911 ?auto_560916 ) ) ( not ( = ?auto_560911 ?auto_560917 ) ) ( not ( = ?auto_560911 ?auto_560920 ) ) ( not ( = ?auto_560912 ?auto_560913 ) ) ( not ( = ?auto_560912 ?auto_560914 ) ) ( not ( = ?auto_560912 ?auto_560915 ) ) ( not ( = ?auto_560912 ?auto_560916 ) ) ( not ( = ?auto_560912 ?auto_560917 ) ) ( not ( = ?auto_560912 ?auto_560920 ) ) ( not ( = ?auto_560913 ?auto_560914 ) ) ( not ( = ?auto_560913 ?auto_560915 ) ) ( not ( = ?auto_560913 ?auto_560916 ) ) ( not ( = ?auto_560913 ?auto_560917 ) ) ( not ( = ?auto_560913 ?auto_560920 ) ) ( not ( = ?auto_560914 ?auto_560915 ) ) ( not ( = ?auto_560914 ?auto_560916 ) ) ( not ( = ?auto_560914 ?auto_560917 ) ) ( not ( = ?auto_560914 ?auto_560920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560915 ?auto_560916 ?auto_560917 )
      ( MAKE-7CRATE-VERIFY ?auto_560910 ?auto_560911 ?auto_560912 ?auto_560913 ?auto_560914 ?auto_560915 ?auto_560916 ?auto_560917 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563829 - SURFACE
      ?auto_563830 - SURFACE
      ?auto_563831 - SURFACE
      ?auto_563832 - SURFACE
      ?auto_563833 - SURFACE
      ?auto_563834 - SURFACE
      ?auto_563835 - SURFACE
      ?auto_563836 - SURFACE
      ?auto_563837 - SURFACE
    )
    :vars
    (
      ?auto_563838 - HOIST
      ?auto_563839 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_563838 ?auto_563839 ) ( SURFACE-AT ?auto_563836 ?auto_563839 ) ( CLEAR ?auto_563836 ) ( LIFTING ?auto_563838 ?auto_563837 ) ( IS-CRATE ?auto_563837 ) ( not ( = ?auto_563836 ?auto_563837 ) ) ( ON ?auto_563830 ?auto_563829 ) ( ON ?auto_563831 ?auto_563830 ) ( ON ?auto_563832 ?auto_563831 ) ( ON ?auto_563833 ?auto_563832 ) ( ON ?auto_563834 ?auto_563833 ) ( ON ?auto_563835 ?auto_563834 ) ( ON ?auto_563836 ?auto_563835 ) ( not ( = ?auto_563829 ?auto_563830 ) ) ( not ( = ?auto_563829 ?auto_563831 ) ) ( not ( = ?auto_563829 ?auto_563832 ) ) ( not ( = ?auto_563829 ?auto_563833 ) ) ( not ( = ?auto_563829 ?auto_563834 ) ) ( not ( = ?auto_563829 ?auto_563835 ) ) ( not ( = ?auto_563829 ?auto_563836 ) ) ( not ( = ?auto_563829 ?auto_563837 ) ) ( not ( = ?auto_563830 ?auto_563831 ) ) ( not ( = ?auto_563830 ?auto_563832 ) ) ( not ( = ?auto_563830 ?auto_563833 ) ) ( not ( = ?auto_563830 ?auto_563834 ) ) ( not ( = ?auto_563830 ?auto_563835 ) ) ( not ( = ?auto_563830 ?auto_563836 ) ) ( not ( = ?auto_563830 ?auto_563837 ) ) ( not ( = ?auto_563831 ?auto_563832 ) ) ( not ( = ?auto_563831 ?auto_563833 ) ) ( not ( = ?auto_563831 ?auto_563834 ) ) ( not ( = ?auto_563831 ?auto_563835 ) ) ( not ( = ?auto_563831 ?auto_563836 ) ) ( not ( = ?auto_563831 ?auto_563837 ) ) ( not ( = ?auto_563832 ?auto_563833 ) ) ( not ( = ?auto_563832 ?auto_563834 ) ) ( not ( = ?auto_563832 ?auto_563835 ) ) ( not ( = ?auto_563832 ?auto_563836 ) ) ( not ( = ?auto_563832 ?auto_563837 ) ) ( not ( = ?auto_563833 ?auto_563834 ) ) ( not ( = ?auto_563833 ?auto_563835 ) ) ( not ( = ?auto_563833 ?auto_563836 ) ) ( not ( = ?auto_563833 ?auto_563837 ) ) ( not ( = ?auto_563834 ?auto_563835 ) ) ( not ( = ?auto_563834 ?auto_563836 ) ) ( not ( = ?auto_563834 ?auto_563837 ) ) ( not ( = ?auto_563835 ?auto_563836 ) ) ( not ( = ?auto_563835 ?auto_563837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_563836 ?auto_563837 )
      ( MAKE-8CRATE-VERIFY ?auto_563829 ?auto_563830 ?auto_563831 ?auto_563832 ?auto_563833 ?auto_563834 ?auto_563835 ?auto_563836 ?auto_563837 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563896 - SURFACE
      ?auto_563897 - SURFACE
      ?auto_563898 - SURFACE
      ?auto_563899 - SURFACE
      ?auto_563900 - SURFACE
      ?auto_563901 - SURFACE
      ?auto_563902 - SURFACE
      ?auto_563903 - SURFACE
      ?auto_563904 - SURFACE
    )
    :vars
    (
      ?auto_563906 - HOIST
      ?auto_563905 - PLACE
      ?auto_563907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_563906 ?auto_563905 ) ( SURFACE-AT ?auto_563903 ?auto_563905 ) ( CLEAR ?auto_563903 ) ( IS-CRATE ?auto_563904 ) ( not ( = ?auto_563903 ?auto_563904 ) ) ( TRUCK-AT ?auto_563907 ?auto_563905 ) ( AVAILABLE ?auto_563906 ) ( IN ?auto_563904 ?auto_563907 ) ( ON ?auto_563903 ?auto_563902 ) ( not ( = ?auto_563902 ?auto_563903 ) ) ( not ( = ?auto_563902 ?auto_563904 ) ) ( ON ?auto_563897 ?auto_563896 ) ( ON ?auto_563898 ?auto_563897 ) ( ON ?auto_563899 ?auto_563898 ) ( ON ?auto_563900 ?auto_563899 ) ( ON ?auto_563901 ?auto_563900 ) ( ON ?auto_563902 ?auto_563901 ) ( not ( = ?auto_563896 ?auto_563897 ) ) ( not ( = ?auto_563896 ?auto_563898 ) ) ( not ( = ?auto_563896 ?auto_563899 ) ) ( not ( = ?auto_563896 ?auto_563900 ) ) ( not ( = ?auto_563896 ?auto_563901 ) ) ( not ( = ?auto_563896 ?auto_563902 ) ) ( not ( = ?auto_563896 ?auto_563903 ) ) ( not ( = ?auto_563896 ?auto_563904 ) ) ( not ( = ?auto_563897 ?auto_563898 ) ) ( not ( = ?auto_563897 ?auto_563899 ) ) ( not ( = ?auto_563897 ?auto_563900 ) ) ( not ( = ?auto_563897 ?auto_563901 ) ) ( not ( = ?auto_563897 ?auto_563902 ) ) ( not ( = ?auto_563897 ?auto_563903 ) ) ( not ( = ?auto_563897 ?auto_563904 ) ) ( not ( = ?auto_563898 ?auto_563899 ) ) ( not ( = ?auto_563898 ?auto_563900 ) ) ( not ( = ?auto_563898 ?auto_563901 ) ) ( not ( = ?auto_563898 ?auto_563902 ) ) ( not ( = ?auto_563898 ?auto_563903 ) ) ( not ( = ?auto_563898 ?auto_563904 ) ) ( not ( = ?auto_563899 ?auto_563900 ) ) ( not ( = ?auto_563899 ?auto_563901 ) ) ( not ( = ?auto_563899 ?auto_563902 ) ) ( not ( = ?auto_563899 ?auto_563903 ) ) ( not ( = ?auto_563899 ?auto_563904 ) ) ( not ( = ?auto_563900 ?auto_563901 ) ) ( not ( = ?auto_563900 ?auto_563902 ) ) ( not ( = ?auto_563900 ?auto_563903 ) ) ( not ( = ?auto_563900 ?auto_563904 ) ) ( not ( = ?auto_563901 ?auto_563902 ) ) ( not ( = ?auto_563901 ?auto_563903 ) ) ( not ( = ?auto_563901 ?auto_563904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563902 ?auto_563903 ?auto_563904 )
      ( MAKE-8CRATE-VERIFY ?auto_563896 ?auto_563897 ?auto_563898 ?auto_563899 ?auto_563900 ?auto_563901 ?auto_563902 ?auto_563903 ?auto_563904 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563972 - SURFACE
      ?auto_563973 - SURFACE
      ?auto_563974 - SURFACE
      ?auto_563975 - SURFACE
      ?auto_563976 - SURFACE
      ?auto_563977 - SURFACE
      ?auto_563978 - SURFACE
      ?auto_563979 - SURFACE
      ?auto_563980 - SURFACE
    )
    :vars
    (
      ?auto_563983 - HOIST
      ?auto_563982 - PLACE
      ?auto_563984 - TRUCK
      ?auto_563981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_563983 ?auto_563982 ) ( SURFACE-AT ?auto_563979 ?auto_563982 ) ( CLEAR ?auto_563979 ) ( IS-CRATE ?auto_563980 ) ( not ( = ?auto_563979 ?auto_563980 ) ) ( AVAILABLE ?auto_563983 ) ( IN ?auto_563980 ?auto_563984 ) ( ON ?auto_563979 ?auto_563978 ) ( not ( = ?auto_563978 ?auto_563979 ) ) ( not ( = ?auto_563978 ?auto_563980 ) ) ( TRUCK-AT ?auto_563984 ?auto_563981 ) ( not ( = ?auto_563981 ?auto_563982 ) ) ( ON ?auto_563973 ?auto_563972 ) ( ON ?auto_563974 ?auto_563973 ) ( ON ?auto_563975 ?auto_563974 ) ( ON ?auto_563976 ?auto_563975 ) ( ON ?auto_563977 ?auto_563976 ) ( ON ?auto_563978 ?auto_563977 ) ( not ( = ?auto_563972 ?auto_563973 ) ) ( not ( = ?auto_563972 ?auto_563974 ) ) ( not ( = ?auto_563972 ?auto_563975 ) ) ( not ( = ?auto_563972 ?auto_563976 ) ) ( not ( = ?auto_563972 ?auto_563977 ) ) ( not ( = ?auto_563972 ?auto_563978 ) ) ( not ( = ?auto_563972 ?auto_563979 ) ) ( not ( = ?auto_563972 ?auto_563980 ) ) ( not ( = ?auto_563973 ?auto_563974 ) ) ( not ( = ?auto_563973 ?auto_563975 ) ) ( not ( = ?auto_563973 ?auto_563976 ) ) ( not ( = ?auto_563973 ?auto_563977 ) ) ( not ( = ?auto_563973 ?auto_563978 ) ) ( not ( = ?auto_563973 ?auto_563979 ) ) ( not ( = ?auto_563973 ?auto_563980 ) ) ( not ( = ?auto_563974 ?auto_563975 ) ) ( not ( = ?auto_563974 ?auto_563976 ) ) ( not ( = ?auto_563974 ?auto_563977 ) ) ( not ( = ?auto_563974 ?auto_563978 ) ) ( not ( = ?auto_563974 ?auto_563979 ) ) ( not ( = ?auto_563974 ?auto_563980 ) ) ( not ( = ?auto_563975 ?auto_563976 ) ) ( not ( = ?auto_563975 ?auto_563977 ) ) ( not ( = ?auto_563975 ?auto_563978 ) ) ( not ( = ?auto_563975 ?auto_563979 ) ) ( not ( = ?auto_563975 ?auto_563980 ) ) ( not ( = ?auto_563976 ?auto_563977 ) ) ( not ( = ?auto_563976 ?auto_563978 ) ) ( not ( = ?auto_563976 ?auto_563979 ) ) ( not ( = ?auto_563976 ?auto_563980 ) ) ( not ( = ?auto_563977 ?auto_563978 ) ) ( not ( = ?auto_563977 ?auto_563979 ) ) ( not ( = ?auto_563977 ?auto_563980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563978 ?auto_563979 ?auto_563980 )
      ( MAKE-8CRATE-VERIFY ?auto_563972 ?auto_563973 ?auto_563974 ?auto_563975 ?auto_563976 ?auto_563977 ?auto_563978 ?auto_563979 ?auto_563980 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564056 - SURFACE
      ?auto_564057 - SURFACE
      ?auto_564058 - SURFACE
      ?auto_564059 - SURFACE
      ?auto_564060 - SURFACE
      ?auto_564061 - SURFACE
      ?auto_564062 - SURFACE
      ?auto_564063 - SURFACE
      ?auto_564064 - SURFACE
    )
    :vars
    (
      ?auto_564068 - HOIST
      ?auto_564069 - PLACE
      ?auto_564066 - TRUCK
      ?auto_564067 - PLACE
      ?auto_564065 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_564068 ?auto_564069 ) ( SURFACE-AT ?auto_564063 ?auto_564069 ) ( CLEAR ?auto_564063 ) ( IS-CRATE ?auto_564064 ) ( not ( = ?auto_564063 ?auto_564064 ) ) ( AVAILABLE ?auto_564068 ) ( ON ?auto_564063 ?auto_564062 ) ( not ( = ?auto_564062 ?auto_564063 ) ) ( not ( = ?auto_564062 ?auto_564064 ) ) ( TRUCK-AT ?auto_564066 ?auto_564067 ) ( not ( = ?auto_564067 ?auto_564069 ) ) ( HOIST-AT ?auto_564065 ?auto_564067 ) ( LIFTING ?auto_564065 ?auto_564064 ) ( not ( = ?auto_564068 ?auto_564065 ) ) ( ON ?auto_564057 ?auto_564056 ) ( ON ?auto_564058 ?auto_564057 ) ( ON ?auto_564059 ?auto_564058 ) ( ON ?auto_564060 ?auto_564059 ) ( ON ?auto_564061 ?auto_564060 ) ( ON ?auto_564062 ?auto_564061 ) ( not ( = ?auto_564056 ?auto_564057 ) ) ( not ( = ?auto_564056 ?auto_564058 ) ) ( not ( = ?auto_564056 ?auto_564059 ) ) ( not ( = ?auto_564056 ?auto_564060 ) ) ( not ( = ?auto_564056 ?auto_564061 ) ) ( not ( = ?auto_564056 ?auto_564062 ) ) ( not ( = ?auto_564056 ?auto_564063 ) ) ( not ( = ?auto_564056 ?auto_564064 ) ) ( not ( = ?auto_564057 ?auto_564058 ) ) ( not ( = ?auto_564057 ?auto_564059 ) ) ( not ( = ?auto_564057 ?auto_564060 ) ) ( not ( = ?auto_564057 ?auto_564061 ) ) ( not ( = ?auto_564057 ?auto_564062 ) ) ( not ( = ?auto_564057 ?auto_564063 ) ) ( not ( = ?auto_564057 ?auto_564064 ) ) ( not ( = ?auto_564058 ?auto_564059 ) ) ( not ( = ?auto_564058 ?auto_564060 ) ) ( not ( = ?auto_564058 ?auto_564061 ) ) ( not ( = ?auto_564058 ?auto_564062 ) ) ( not ( = ?auto_564058 ?auto_564063 ) ) ( not ( = ?auto_564058 ?auto_564064 ) ) ( not ( = ?auto_564059 ?auto_564060 ) ) ( not ( = ?auto_564059 ?auto_564061 ) ) ( not ( = ?auto_564059 ?auto_564062 ) ) ( not ( = ?auto_564059 ?auto_564063 ) ) ( not ( = ?auto_564059 ?auto_564064 ) ) ( not ( = ?auto_564060 ?auto_564061 ) ) ( not ( = ?auto_564060 ?auto_564062 ) ) ( not ( = ?auto_564060 ?auto_564063 ) ) ( not ( = ?auto_564060 ?auto_564064 ) ) ( not ( = ?auto_564061 ?auto_564062 ) ) ( not ( = ?auto_564061 ?auto_564063 ) ) ( not ( = ?auto_564061 ?auto_564064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564062 ?auto_564063 ?auto_564064 )
      ( MAKE-8CRATE-VERIFY ?auto_564056 ?auto_564057 ?auto_564058 ?auto_564059 ?auto_564060 ?auto_564061 ?auto_564062 ?auto_564063 ?auto_564064 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564148 - SURFACE
      ?auto_564149 - SURFACE
      ?auto_564150 - SURFACE
      ?auto_564151 - SURFACE
      ?auto_564152 - SURFACE
      ?auto_564153 - SURFACE
      ?auto_564154 - SURFACE
      ?auto_564155 - SURFACE
      ?auto_564156 - SURFACE
    )
    :vars
    (
      ?auto_564161 - HOIST
      ?auto_564160 - PLACE
      ?auto_564162 - TRUCK
      ?auto_564157 - PLACE
      ?auto_564158 - HOIST
      ?auto_564159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_564161 ?auto_564160 ) ( SURFACE-AT ?auto_564155 ?auto_564160 ) ( CLEAR ?auto_564155 ) ( IS-CRATE ?auto_564156 ) ( not ( = ?auto_564155 ?auto_564156 ) ) ( AVAILABLE ?auto_564161 ) ( ON ?auto_564155 ?auto_564154 ) ( not ( = ?auto_564154 ?auto_564155 ) ) ( not ( = ?auto_564154 ?auto_564156 ) ) ( TRUCK-AT ?auto_564162 ?auto_564157 ) ( not ( = ?auto_564157 ?auto_564160 ) ) ( HOIST-AT ?auto_564158 ?auto_564157 ) ( not ( = ?auto_564161 ?auto_564158 ) ) ( AVAILABLE ?auto_564158 ) ( SURFACE-AT ?auto_564156 ?auto_564157 ) ( ON ?auto_564156 ?auto_564159 ) ( CLEAR ?auto_564156 ) ( not ( = ?auto_564155 ?auto_564159 ) ) ( not ( = ?auto_564156 ?auto_564159 ) ) ( not ( = ?auto_564154 ?auto_564159 ) ) ( ON ?auto_564149 ?auto_564148 ) ( ON ?auto_564150 ?auto_564149 ) ( ON ?auto_564151 ?auto_564150 ) ( ON ?auto_564152 ?auto_564151 ) ( ON ?auto_564153 ?auto_564152 ) ( ON ?auto_564154 ?auto_564153 ) ( not ( = ?auto_564148 ?auto_564149 ) ) ( not ( = ?auto_564148 ?auto_564150 ) ) ( not ( = ?auto_564148 ?auto_564151 ) ) ( not ( = ?auto_564148 ?auto_564152 ) ) ( not ( = ?auto_564148 ?auto_564153 ) ) ( not ( = ?auto_564148 ?auto_564154 ) ) ( not ( = ?auto_564148 ?auto_564155 ) ) ( not ( = ?auto_564148 ?auto_564156 ) ) ( not ( = ?auto_564148 ?auto_564159 ) ) ( not ( = ?auto_564149 ?auto_564150 ) ) ( not ( = ?auto_564149 ?auto_564151 ) ) ( not ( = ?auto_564149 ?auto_564152 ) ) ( not ( = ?auto_564149 ?auto_564153 ) ) ( not ( = ?auto_564149 ?auto_564154 ) ) ( not ( = ?auto_564149 ?auto_564155 ) ) ( not ( = ?auto_564149 ?auto_564156 ) ) ( not ( = ?auto_564149 ?auto_564159 ) ) ( not ( = ?auto_564150 ?auto_564151 ) ) ( not ( = ?auto_564150 ?auto_564152 ) ) ( not ( = ?auto_564150 ?auto_564153 ) ) ( not ( = ?auto_564150 ?auto_564154 ) ) ( not ( = ?auto_564150 ?auto_564155 ) ) ( not ( = ?auto_564150 ?auto_564156 ) ) ( not ( = ?auto_564150 ?auto_564159 ) ) ( not ( = ?auto_564151 ?auto_564152 ) ) ( not ( = ?auto_564151 ?auto_564153 ) ) ( not ( = ?auto_564151 ?auto_564154 ) ) ( not ( = ?auto_564151 ?auto_564155 ) ) ( not ( = ?auto_564151 ?auto_564156 ) ) ( not ( = ?auto_564151 ?auto_564159 ) ) ( not ( = ?auto_564152 ?auto_564153 ) ) ( not ( = ?auto_564152 ?auto_564154 ) ) ( not ( = ?auto_564152 ?auto_564155 ) ) ( not ( = ?auto_564152 ?auto_564156 ) ) ( not ( = ?auto_564152 ?auto_564159 ) ) ( not ( = ?auto_564153 ?auto_564154 ) ) ( not ( = ?auto_564153 ?auto_564155 ) ) ( not ( = ?auto_564153 ?auto_564156 ) ) ( not ( = ?auto_564153 ?auto_564159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564154 ?auto_564155 ?auto_564156 )
      ( MAKE-8CRATE-VERIFY ?auto_564148 ?auto_564149 ?auto_564150 ?auto_564151 ?auto_564152 ?auto_564153 ?auto_564154 ?auto_564155 ?auto_564156 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564241 - SURFACE
      ?auto_564242 - SURFACE
      ?auto_564243 - SURFACE
      ?auto_564244 - SURFACE
      ?auto_564245 - SURFACE
      ?auto_564246 - SURFACE
      ?auto_564247 - SURFACE
      ?auto_564248 - SURFACE
      ?auto_564249 - SURFACE
    )
    :vars
    (
      ?auto_564254 - HOIST
      ?auto_564253 - PLACE
      ?auto_564251 - PLACE
      ?auto_564255 - HOIST
      ?auto_564250 - SURFACE
      ?auto_564252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564254 ?auto_564253 ) ( SURFACE-AT ?auto_564248 ?auto_564253 ) ( CLEAR ?auto_564248 ) ( IS-CRATE ?auto_564249 ) ( not ( = ?auto_564248 ?auto_564249 ) ) ( AVAILABLE ?auto_564254 ) ( ON ?auto_564248 ?auto_564247 ) ( not ( = ?auto_564247 ?auto_564248 ) ) ( not ( = ?auto_564247 ?auto_564249 ) ) ( not ( = ?auto_564251 ?auto_564253 ) ) ( HOIST-AT ?auto_564255 ?auto_564251 ) ( not ( = ?auto_564254 ?auto_564255 ) ) ( AVAILABLE ?auto_564255 ) ( SURFACE-AT ?auto_564249 ?auto_564251 ) ( ON ?auto_564249 ?auto_564250 ) ( CLEAR ?auto_564249 ) ( not ( = ?auto_564248 ?auto_564250 ) ) ( not ( = ?auto_564249 ?auto_564250 ) ) ( not ( = ?auto_564247 ?auto_564250 ) ) ( TRUCK-AT ?auto_564252 ?auto_564253 ) ( ON ?auto_564242 ?auto_564241 ) ( ON ?auto_564243 ?auto_564242 ) ( ON ?auto_564244 ?auto_564243 ) ( ON ?auto_564245 ?auto_564244 ) ( ON ?auto_564246 ?auto_564245 ) ( ON ?auto_564247 ?auto_564246 ) ( not ( = ?auto_564241 ?auto_564242 ) ) ( not ( = ?auto_564241 ?auto_564243 ) ) ( not ( = ?auto_564241 ?auto_564244 ) ) ( not ( = ?auto_564241 ?auto_564245 ) ) ( not ( = ?auto_564241 ?auto_564246 ) ) ( not ( = ?auto_564241 ?auto_564247 ) ) ( not ( = ?auto_564241 ?auto_564248 ) ) ( not ( = ?auto_564241 ?auto_564249 ) ) ( not ( = ?auto_564241 ?auto_564250 ) ) ( not ( = ?auto_564242 ?auto_564243 ) ) ( not ( = ?auto_564242 ?auto_564244 ) ) ( not ( = ?auto_564242 ?auto_564245 ) ) ( not ( = ?auto_564242 ?auto_564246 ) ) ( not ( = ?auto_564242 ?auto_564247 ) ) ( not ( = ?auto_564242 ?auto_564248 ) ) ( not ( = ?auto_564242 ?auto_564249 ) ) ( not ( = ?auto_564242 ?auto_564250 ) ) ( not ( = ?auto_564243 ?auto_564244 ) ) ( not ( = ?auto_564243 ?auto_564245 ) ) ( not ( = ?auto_564243 ?auto_564246 ) ) ( not ( = ?auto_564243 ?auto_564247 ) ) ( not ( = ?auto_564243 ?auto_564248 ) ) ( not ( = ?auto_564243 ?auto_564249 ) ) ( not ( = ?auto_564243 ?auto_564250 ) ) ( not ( = ?auto_564244 ?auto_564245 ) ) ( not ( = ?auto_564244 ?auto_564246 ) ) ( not ( = ?auto_564244 ?auto_564247 ) ) ( not ( = ?auto_564244 ?auto_564248 ) ) ( not ( = ?auto_564244 ?auto_564249 ) ) ( not ( = ?auto_564244 ?auto_564250 ) ) ( not ( = ?auto_564245 ?auto_564246 ) ) ( not ( = ?auto_564245 ?auto_564247 ) ) ( not ( = ?auto_564245 ?auto_564248 ) ) ( not ( = ?auto_564245 ?auto_564249 ) ) ( not ( = ?auto_564245 ?auto_564250 ) ) ( not ( = ?auto_564246 ?auto_564247 ) ) ( not ( = ?auto_564246 ?auto_564248 ) ) ( not ( = ?auto_564246 ?auto_564249 ) ) ( not ( = ?auto_564246 ?auto_564250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564247 ?auto_564248 ?auto_564249 )
      ( MAKE-8CRATE-VERIFY ?auto_564241 ?auto_564242 ?auto_564243 ?auto_564244 ?auto_564245 ?auto_564246 ?auto_564247 ?auto_564248 ?auto_564249 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564334 - SURFACE
      ?auto_564335 - SURFACE
      ?auto_564336 - SURFACE
      ?auto_564337 - SURFACE
      ?auto_564338 - SURFACE
      ?auto_564339 - SURFACE
      ?auto_564340 - SURFACE
      ?auto_564341 - SURFACE
      ?auto_564342 - SURFACE
    )
    :vars
    (
      ?auto_564344 - HOIST
      ?auto_564347 - PLACE
      ?auto_564345 - PLACE
      ?auto_564348 - HOIST
      ?auto_564343 - SURFACE
      ?auto_564346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564344 ?auto_564347 ) ( IS-CRATE ?auto_564342 ) ( not ( = ?auto_564341 ?auto_564342 ) ) ( not ( = ?auto_564340 ?auto_564341 ) ) ( not ( = ?auto_564340 ?auto_564342 ) ) ( not ( = ?auto_564345 ?auto_564347 ) ) ( HOIST-AT ?auto_564348 ?auto_564345 ) ( not ( = ?auto_564344 ?auto_564348 ) ) ( AVAILABLE ?auto_564348 ) ( SURFACE-AT ?auto_564342 ?auto_564345 ) ( ON ?auto_564342 ?auto_564343 ) ( CLEAR ?auto_564342 ) ( not ( = ?auto_564341 ?auto_564343 ) ) ( not ( = ?auto_564342 ?auto_564343 ) ) ( not ( = ?auto_564340 ?auto_564343 ) ) ( TRUCK-AT ?auto_564346 ?auto_564347 ) ( SURFACE-AT ?auto_564340 ?auto_564347 ) ( CLEAR ?auto_564340 ) ( LIFTING ?auto_564344 ?auto_564341 ) ( IS-CRATE ?auto_564341 ) ( ON ?auto_564335 ?auto_564334 ) ( ON ?auto_564336 ?auto_564335 ) ( ON ?auto_564337 ?auto_564336 ) ( ON ?auto_564338 ?auto_564337 ) ( ON ?auto_564339 ?auto_564338 ) ( ON ?auto_564340 ?auto_564339 ) ( not ( = ?auto_564334 ?auto_564335 ) ) ( not ( = ?auto_564334 ?auto_564336 ) ) ( not ( = ?auto_564334 ?auto_564337 ) ) ( not ( = ?auto_564334 ?auto_564338 ) ) ( not ( = ?auto_564334 ?auto_564339 ) ) ( not ( = ?auto_564334 ?auto_564340 ) ) ( not ( = ?auto_564334 ?auto_564341 ) ) ( not ( = ?auto_564334 ?auto_564342 ) ) ( not ( = ?auto_564334 ?auto_564343 ) ) ( not ( = ?auto_564335 ?auto_564336 ) ) ( not ( = ?auto_564335 ?auto_564337 ) ) ( not ( = ?auto_564335 ?auto_564338 ) ) ( not ( = ?auto_564335 ?auto_564339 ) ) ( not ( = ?auto_564335 ?auto_564340 ) ) ( not ( = ?auto_564335 ?auto_564341 ) ) ( not ( = ?auto_564335 ?auto_564342 ) ) ( not ( = ?auto_564335 ?auto_564343 ) ) ( not ( = ?auto_564336 ?auto_564337 ) ) ( not ( = ?auto_564336 ?auto_564338 ) ) ( not ( = ?auto_564336 ?auto_564339 ) ) ( not ( = ?auto_564336 ?auto_564340 ) ) ( not ( = ?auto_564336 ?auto_564341 ) ) ( not ( = ?auto_564336 ?auto_564342 ) ) ( not ( = ?auto_564336 ?auto_564343 ) ) ( not ( = ?auto_564337 ?auto_564338 ) ) ( not ( = ?auto_564337 ?auto_564339 ) ) ( not ( = ?auto_564337 ?auto_564340 ) ) ( not ( = ?auto_564337 ?auto_564341 ) ) ( not ( = ?auto_564337 ?auto_564342 ) ) ( not ( = ?auto_564337 ?auto_564343 ) ) ( not ( = ?auto_564338 ?auto_564339 ) ) ( not ( = ?auto_564338 ?auto_564340 ) ) ( not ( = ?auto_564338 ?auto_564341 ) ) ( not ( = ?auto_564338 ?auto_564342 ) ) ( not ( = ?auto_564338 ?auto_564343 ) ) ( not ( = ?auto_564339 ?auto_564340 ) ) ( not ( = ?auto_564339 ?auto_564341 ) ) ( not ( = ?auto_564339 ?auto_564342 ) ) ( not ( = ?auto_564339 ?auto_564343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564340 ?auto_564341 ?auto_564342 )
      ( MAKE-8CRATE-VERIFY ?auto_564334 ?auto_564335 ?auto_564336 ?auto_564337 ?auto_564338 ?auto_564339 ?auto_564340 ?auto_564341 ?auto_564342 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_564427 - SURFACE
      ?auto_564428 - SURFACE
      ?auto_564429 - SURFACE
      ?auto_564430 - SURFACE
      ?auto_564431 - SURFACE
      ?auto_564432 - SURFACE
      ?auto_564433 - SURFACE
      ?auto_564434 - SURFACE
      ?auto_564435 - SURFACE
    )
    :vars
    (
      ?auto_564441 - HOIST
      ?auto_564438 - PLACE
      ?auto_564439 - PLACE
      ?auto_564440 - HOIST
      ?auto_564436 - SURFACE
      ?auto_564437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564441 ?auto_564438 ) ( IS-CRATE ?auto_564435 ) ( not ( = ?auto_564434 ?auto_564435 ) ) ( not ( = ?auto_564433 ?auto_564434 ) ) ( not ( = ?auto_564433 ?auto_564435 ) ) ( not ( = ?auto_564439 ?auto_564438 ) ) ( HOIST-AT ?auto_564440 ?auto_564439 ) ( not ( = ?auto_564441 ?auto_564440 ) ) ( AVAILABLE ?auto_564440 ) ( SURFACE-AT ?auto_564435 ?auto_564439 ) ( ON ?auto_564435 ?auto_564436 ) ( CLEAR ?auto_564435 ) ( not ( = ?auto_564434 ?auto_564436 ) ) ( not ( = ?auto_564435 ?auto_564436 ) ) ( not ( = ?auto_564433 ?auto_564436 ) ) ( TRUCK-AT ?auto_564437 ?auto_564438 ) ( SURFACE-AT ?auto_564433 ?auto_564438 ) ( CLEAR ?auto_564433 ) ( IS-CRATE ?auto_564434 ) ( AVAILABLE ?auto_564441 ) ( IN ?auto_564434 ?auto_564437 ) ( ON ?auto_564428 ?auto_564427 ) ( ON ?auto_564429 ?auto_564428 ) ( ON ?auto_564430 ?auto_564429 ) ( ON ?auto_564431 ?auto_564430 ) ( ON ?auto_564432 ?auto_564431 ) ( ON ?auto_564433 ?auto_564432 ) ( not ( = ?auto_564427 ?auto_564428 ) ) ( not ( = ?auto_564427 ?auto_564429 ) ) ( not ( = ?auto_564427 ?auto_564430 ) ) ( not ( = ?auto_564427 ?auto_564431 ) ) ( not ( = ?auto_564427 ?auto_564432 ) ) ( not ( = ?auto_564427 ?auto_564433 ) ) ( not ( = ?auto_564427 ?auto_564434 ) ) ( not ( = ?auto_564427 ?auto_564435 ) ) ( not ( = ?auto_564427 ?auto_564436 ) ) ( not ( = ?auto_564428 ?auto_564429 ) ) ( not ( = ?auto_564428 ?auto_564430 ) ) ( not ( = ?auto_564428 ?auto_564431 ) ) ( not ( = ?auto_564428 ?auto_564432 ) ) ( not ( = ?auto_564428 ?auto_564433 ) ) ( not ( = ?auto_564428 ?auto_564434 ) ) ( not ( = ?auto_564428 ?auto_564435 ) ) ( not ( = ?auto_564428 ?auto_564436 ) ) ( not ( = ?auto_564429 ?auto_564430 ) ) ( not ( = ?auto_564429 ?auto_564431 ) ) ( not ( = ?auto_564429 ?auto_564432 ) ) ( not ( = ?auto_564429 ?auto_564433 ) ) ( not ( = ?auto_564429 ?auto_564434 ) ) ( not ( = ?auto_564429 ?auto_564435 ) ) ( not ( = ?auto_564429 ?auto_564436 ) ) ( not ( = ?auto_564430 ?auto_564431 ) ) ( not ( = ?auto_564430 ?auto_564432 ) ) ( not ( = ?auto_564430 ?auto_564433 ) ) ( not ( = ?auto_564430 ?auto_564434 ) ) ( not ( = ?auto_564430 ?auto_564435 ) ) ( not ( = ?auto_564430 ?auto_564436 ) ) ( not ( = ?auto_564431 ?auto_564432 ) ) ( not ( = ?auto_564431 ?auto_564433 ) ) ( not ( = ?auto_564431 ?auto_564434 ) ) ( not ( = ?auto_564431 ?auto_564435 ) ) ( not ( = ?auto_564431 ?auto_564436 ) ) ( not ( = ?auto_564432 ?auto_564433 ) ) ( not ( = ?auto_564432 ?auto_564434 ) ) ( not ( = ?auto_564432 ?auto_564435 ) ) ( not ( = ?auto_564432 ?auto_564436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564433 ?auto_564434 ?auto_564435 )
      ( MAKE-8CRATE-VERIFY ?auto_564427 ?auto_564428 ?auto_564429 ?auto_564430 ?auto_564431 ?auto_564432 ?auto_564433 ?auto_564434 ?auto_564435 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568543 - SURFACE
      ?auto_568544 - SURFACE
      ?auto_568545 - SURFACE
      ?auto_568546 - SURFACE
      ?auto_568547 - SURFACE
      ?auto_568548 - SURFACE
      ?auto_568549 - SURFACE
      ?auto_568550 - SURFACE
      ?auto_568551 - SURFACE
      ?auto_568552 - SURFACE
    )
    :vars
    (
      ?auto_568553 - HOIST
      ?auto_568554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568553 ?auto_568554 ) ( SURFACE-AT ?auto_568551 ?auto_568554 ) ( CLEAR ?auto_568551 ) ( LIFTING ?auto_568553 ?auto_568552 ) ( IS-CRATE ?auto_568552 ) ( not ( = ?auto_568551 ?auto_568552 ) ) ( ON ?auto_568544 ?auto_568543 ) ( ON ?auto_568545 ?auto_568544 ) ( ON ?auto_568546 ?auto_568545 ) ( ON ?auto_568547 ?auto_568546 ) ( ON ?auto_568548 ?auto_568547 ) ( ON ?auto_568549 ?auto_568548 ) ( ON ?auto_568550 ?auto_568549 ) ( ON ?auto_568551 ?auto_568550 ) ( not ( = ?auto_568543 ?auto_568544 ) ) ( not ( = ?auto_568543 ?auto_568545 ) ) ( not ( = ?auto_568543 ?auto_568546 ) ) ( not ( = ?auto_568543 ?auto_568547 ) ) ( not ( = ?auto_568543 ?auto_568548 ) ) ( not ( = ?auto_568543 ?auto_568549 ) ) ( not ( = ?auto_568543 ?auto_568550 ) ) ( not ( = ?auto_568543 ?auto_568551 ) ) ( not ( = ?auto_568543 ?auto_568552 ) ) ( not ( = ?auto_568544 ?auto_568545 ) ) ( not ( = ?auto_568544 ?auto_568546 ) ) ( not ( = ?auto_568544 ?auto_568547 ) ) ( not ( = ?auto_568544 ?auto_568548 ) ) ( not ( = ?auto_568544 ?auto_568549 ) ) ( not ( = ?auto_568544 ?auto_568550 ) ) ( not ( = ?auto_568544 ?auto_568551 ) ) ( not ( = ?auto_568544 ?auto_568552 ) ) ( not ( = ?auto_568545 ?auto_568546 ) ) ( not ( = ?auto_568545 ?auto_568547 ) ) ( not ( = ?auto_568545 ?auto_568548 ) ) ( not ( = ?auto_568545 ?auto_568549 ) ) ( not ( = ?auto_568545 ?auto_568550 ) ) ( not ( = ?auto_568545 ?auto_568551 ) ) ( not ( = ?auto_568545 ?auto_568552 ) ) ( not ( = ?auto_568546 ?auto_568547 ) ) ( not ( = ?auto_568546 ?auto_568548 ) ) ( not ( = ?auto_568546 ?auto_568549 ) ) ( not ( = ?auto_568546 ?auto_568550 ) ) ( not ( = ?auto_568546 ?auto_568551 ) ) ( not ( = ?auto_568546 ?auto_568552 ) ) ( not ( = ?auto_568547 ?auto_568548 ) ) ( not ( = ?auto_568547 ?auto_568549 ) ) ( not ( = ?auto_568547 ?auto_568550 ) ) ( not ( = ?auto_568547 ?auto_568551 ) ) ( not ( = ?auto_568547 ?auto_568552 ) ) ( not ( = ?auto_568548 ?auto_568549 ) ) ( not ( = ?auto_568548 ?auto_568550 ) ) ( not ( = ?auto_568548 ?auto_568551 ) ) ( not ( = ?auto_568548 ?auto_568552 ) ) ( not ( = ?auto_568549 ?auto_568550 ) ) ( not ( = ?auto_568549 ?auto_568551 ) ) ( not ( = ?auto_568549 ?auto_568552 ) ) ( not ( = ?auto_568550 ?auto_568551 ) ) ( not ( = ?auto_568550 ?auto_568552 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_568551 ?auto_568552 )
      ( MAKE-9CRATE-VERIFY ?auto_568543 ?auto_568544 ?auto_568545 ?auto_568546 ?auto_568547 ?auto_568548 ?auto_568549 ?auto_568550 ?auto_568551 ?auto_568552 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568623 - SURFACE
      ?auto_568624 - SURFACE
      ?auto_568625 - SURFACE
      ?auto_568626 - SURFACE
      ?auto_568627 - SURFACE
      ?auto_568628 - SURFACE
      ?auto_568629 - SURFACE
      ?auto_568630 - SURFACE
      ?auto_568631 - SURFACE
      ?auto_568632 - SURFACE
    )
    :vars
    (
      ?auto_568635 - HOIST
      ?auto_568634 - PLACE
      ?auto_568633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568635 ?auto_568634 ) ( SURFACE-AT ?auto_568631 ?auto_568634 ) ( CLEAR ?auto_568631 ) ( IS-CRATE ?auto_568632 ) ( not ( = ?auto_568631 ?auto_568632 ) ) ( TRUCK-AT ?auto_568633 ?auto_568634 ) ( AVAILABLE ?auto_568635 ) ( IN ?auto_568632 ?auto_568633 ) ( ON ?auto_568631 ?auto_568630 ) ( not ( = ?auto_568630 ?auto_568631 ) ) ( not ( = ?auto_568630 ?auto_568632 ) ) ( ON ?auto_568624 ?auto_568623 ) ( ON ?auto_568625 ?auto_568624 ) ( ON ?auto_568626 ?auto_568625 ) ( ON ?auto_568627 ?auto_568626 ) ( ON ?auto_568628 ?auto_568627 ) ( ON ?auto_568629 ?auto_568628 ) ( ON ?auto_568630 ?auto_568629 ) ( not ( = ?auto_568623 ?auto_568624 ) ) ( not ( = ?auto_568623 ?auto_568625 ) ) ( not ( = ?auto_568623 ?auto_568626 ) ) ( not ( = ?auto_568623 ?auto_568627 ) ) ( not ( = ?auto_568623 ?auto_568628 ) ) ( not ( = ?auto_568623 ?auto_568629 ) ) ( not ( = ?auto_568623 ?auto_568630 ) ) ( not ( = ?auto_568623 ?auto_568631 ) ) ( not ( = ?auto_568623 ?auto_568632 ) ) ( not ( = ?auto_568624 ?auto_568625 ) ) ( not ( = ?auto_568624 ?auto_568626 ) ) ( not ( = ?auto_568624 ?auto_568627 ) ) ( not ( = ?auto_568624 ?auto_568628 ) ) ( not ( = ?auto_568624 ?auto_568629 ) ) ( not ( = ?auto_568624 ?auto_568630 ) ) ( not ( = ?auto_568624 ?auto_568631 ) ) ( not ( = ?auto_568624 ?auto_568632 ) ) ( not ( = ?auto_568625 ?auto_568626 ) ) ( not ( = ?auto_568625 ?auto_568627 ) ) ( not ( = ?auto_568625 ?auto_568628 ) ) ( not ( = ?auto_568625 ?auto_568629 ) ) ( not ( = ?auto_568625 ?auto_568630 ) ) ( not ( = ?auto_568625 ?auto_568631 ) ) ( not ( = ?auto_568625 ?auto_568632 ) ) ( not ( = ?auto_568626 ?auto_568627 ) ) ( not ( = ?auto_568626 ?auto_568628 ) ) ( not ( = ?auto_568626 ?auto_568629 ) ) ( not ( = ?auto_568626 ?auto_568630 ) ) ( not ( = ?auto_568626 ?auto_568631 ) ) ( not ( = ?auto_568626 ?auto_568632 ) ) ( not ( = ?auto_568627 ?auto_568628 ) ) ( not ( = ?auto_568627 ?auto_568629 ) ) ( not ( = ?auto_568627 ?auto_568630 ) ) ( not ( = ?auto_568627 ?auto_568631 ) ) ( not ( = ?auto_568627 ?auto_568632 ) ) ( not ( = ?auto_568628 ?auto_568629 ) ) ( not ( = ?auto_568628 ?auto_568630 ) ) ( not ( = ?auto_568628 ?auto_568631 ) ) ( not ( = ?auto_568628 ?auto_568632 ) ) ( not ( = ?auto_568629 ?auto_568630 ) ) ( not ( = ?auto_568629 ?auto_568631 ) ) ( not ( = ?auto_568629 ?auto_568632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568630 ?auto_568631 ?auto_568632 )
      ( MAKE-9CRATE-VERIFY ?auto_568623 ?auto_568624 ?auto_568625 ?auto_568626 ?auto_568627 ?auto_568628 ?auto_568629 ?auto_568630 ?auto_568631 ?auto_568632 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568713 - SURFACE
      ?auto_568714 - SURFACE
      ?auto_568715 - SURFACE
      ?auto_568716 - SURFACE
      ?auto_568717 - SURFACE
      ?auto_568718 - SURFACE
      ?auto_568719 - SURFACE
      ?auto_568720 - SURFACE
      ?auto_568721 - SURFACE
      ?auto_568722 - SURFACE
    )
    :vars
    (
      ?auto_568723 - HOIST
      ?auto_568724 - PLACE
      ?auto_568725 - TRUCK
      ?auto_568726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568723 ?auto_568724 ) ( SURFACE-AT ?auto_568721 ?auto_568724 ) ( CLEAR ?auto_568721 ) ( IS-CRATE ?auto_568722 ) ( not ( = ?auto_568721 ?auto_568722 ) ) ( AVAILABLE ?auto_568723 ) ( IN ?auto_568722 ?auto_568725 ) ( ON ?auto_568721 ?auto_568720 ) ( not ( = ?auto_568720 ?auto_568721 ) ) ( not ( = ?auto_568720 ?auto_568722 ) ) ( TRUCK-AT ?auto_568725 ?auto_568726 ) ( not ( = ?auto_568726 ?auto_568724 ) ) ( ON ?auto_568714 ?auto_568713 ) ( ON ?auto_568715 ?auto_568714 ) ( ON ?auto_568716 ?auto_568715 ) ( ON ?auto_568717 ?auto_568716 ) ( ON ?auto_568718 ?auto_568717 ) ( ON ?auto_568719 ?auto_568718 ) ( ON ?auto_568720 ?auto_568719 ) ( not ( = ?auto_568713 ?auto_568714 ) ) ( not ( = ?auto_568713 ?auto_568715 ) ) ( not ( = ?auto_568713 ?auto_568716 ) ) ( not ( = ?auto_568713 ?auto_568717 ) ) ( not ( = ?auto_568713 ?auto_568718 ) ) ( not ( = ?auto_568713 ?auto_568719 ) ) ( not ( = ?auto_568713 ?auto_568720 ) ) ( not ( = ?auto_568713 ?auto_568721 ) ) ( not ( = ?auto_568713 ?auto_568722 ) ) ( not ( = ?auto_568714 ?auto_568715 ) ) ( not ( = ?auto_568714 ?auto_568716 ) ) ( not ( = ?auto_568714 ?auto_568717 ) ) ( not ( = ?auto_568714 ?auto_568718 ) ) ( not ( = ?auto_568714 ?auto_568719 ) ) ( not ( = ?auto_568714 ?auto_568720 ) ) ( not ( = ?auto_568714 ?auto_568721 ) ) ( not ( = ?auto_568714 ?auto_568722 ) ) ( not ( = ?auto_568715 ?auto_568716 ) ) ( not ( = ?auto_568715 ?auto_568717 ) ) ( not ( = ?auto_568715 ?auto_568718 ) ) ( not ( = ?auto_568715 ?auto_568719 ) ) ( not ( = ?auto_568715 ?auto_568720 ) ) ( not ( = ?auto_568715 ?auto_568721 ) ) ( not ( = ?auto_568715 ?auto_568722 ) ) ( not ( = ?auto_568716 ?auto_568717 ) ) ( not ( = ?auto_568716 ?auto_568718 ) ) ( not ( = ?auto_568716 ?auto_568719 ) ) ( not ( = ?auto_568716 ?auto_568720 ) ) ( not ( = ?auto_568716 ?auto_568721 ) ) ( not ( = ?auto_568716 ?auto_568722 ) ) ( not ( = ?auto_568717 ?auto_568718 ) ) ( not ( = ?auto_568717 ?auto_568719 ) ) ( not ( = ?auto_568717 ?auto_568720 ) ) ( not ( = ?auto_568717 ?auto_568721 ) ) ( not ( = ?auto_568717 ?auto_568722 ) ) ( not ( = ?auto_568718 ?auto_568719 ) ) ( not ( = ?auto_568718 ?auto_568720 ) ) ( not ( = ?auto_568718 ?auto_568721 ) ) ( not ( = ?auto_568718 ?auto_568722 ) ) ( not ( = ?auto_568719 ?auto_568720 ) ) ( not ( = ?auto_568719 ?auto_568721 ) ) ( not ( = ?auto_568719 ?auto_568722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568720 ?auto_568721 ?auto_568722 )
      ( MAKE-9CRATE-VERIFY ?auto_568713 ?auto_568714 ?auto_568715 ?auto_568716 ?auto_568717 ?auto_568718 ?auto_568719 ?auto_568720 ?auto_568721 ?auto_568722 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568812 - SURFACE
      ?auto_568813 - SURFACE
      ?auto_568814 - SURFACE
      ?auto_568815 - SURFACE
      ?auto_568816 - SURFACE
      ?auto_568817 - SURFACE
      ?auto_568818 - SURFACE
      ?auto_568819 - SURFACE
      ?auto_568820 - SURFACE
      ?auto_568821 - SURFACE
    )
    :vars
    (
      ?auto_568824 - HOIST
      ?auto_568825 - PLACE
      ?auto_568826 - TRUCK
      ?auto_568822 - PLACE
      ?auto_568823 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_568824 ?auto_568825 ) ( SURFACE-AT ?auto_568820 ?auto_568825 ) ( CLEAR ?auto_568820 ) ( IS-CRATE ?auto_568821 ) ( not ( = ?auto_568820 ?auto_568821 ) ) ( AVAILABLE ?auto_568824 ) ( ON ?auto_568820 ?auto_568819 ) ( not ( = ?auto_568819 ?auto_568820 ) ) ( not ( = ?auto_568819 ?auto_568821 ) ) ( TRUCK-AT ?auto_568826 ?auto_568822 ) ( not ( = ?auto_568822 ?auto_568825 ) ) ( HOIST-AT ?auto_568823 ?auto_568822 ) ( LIFTING ?auto_568823 ?auto_568821 ) ( not ( = ?auto_568824 ?auto_568823 ) ) ( ON ?auto_568813 ?auto_568812 ) ( ON ?auto_568814 ?auto_568813 ) ( ON ?auto_568815 ?auto_568814 ) ( ON ?auto_568816 ?auto_568815 ) ( ON ?auto_568817 ?auto_568816 ) ( ON ?auto_568818 ?auto_568817 ) ( ON ?auto_568819 ?auto_568818 ) ( not ( = ?auto_568812 ?auto_568813 ) ) ( not ( = ?auto_568812 ?auto_568814 ) ) ( not ( = ?auto_568812 ?auto_568815 ) ) ( not ( = ?auto_568812 ?auto_568816 ) ) ( not ( = ?auto_568812 ?auto_568817 ) ) ( not ( = ?auto_568812 ?auto_568818 ) ) ( not ( = ?auto_568812 ?auto_568819 ) ) ( not ( = ?auto_568812 ?auto_568820 ) ) ( not ( = ?auto_568812 ?auto_568821 ) ) ( not ( = ?auto_568813 ?auto_568814 ) ) ( not ( = ?auto_568813 ?auto_568815 ) ) ( not ( = ?auto_568813 ?auto_568816 ) ) ( not ( = ?auto_568813 ?auto_568817 ) ) ( not ( = ?auto_568813 ?auto_568818 ) ) ( not ( = ?auto_568813 ?auto_568819 ) ) ( not ( = ?auto_568813 ?auto_568820 ) ) ( not ( = ?auto_568813 ?auto_568821 ) ) ( not ( = ?auto_568814 ?auto_568815 ) ) ( not ( = ?auto_568814 ?auto_568816 ) ) ( not ( = ?auto_568814 ?auto_568817 ) ) ( not ( = ?auto_568814 ?auto_568818 ) ) ( not ( = ?auto_568814 ?auto_568819 ) ) ( not ( = ?auto_568814 ?auto_568820 ) ) ( not ( = ?auto_568814 ?auto_568821 ) ) ( not ( = ?auto_568815 ?auto_568816 ) ) ( not ( = ?auto_568815 ?auto_568817 ) ) ( not ( = ?auto_568815 ?auto_568818 ) ) ( not ( = ?auto_568815 ?auto_568819 ) ) ( not ( = ?auto_568815 ?auto_568820 ) ) ( not ( = ?auto_568815 ?auto_568821 ) ) ( not ( = ?auto_568816 ?auto_568817 ) ) ( not ( = ?auto_568816 ?auto_568818 ) ) ( not ( = ?auto_568816 ?auto_568819 ) ) ( not ( = ?auto_568816 ?auto_568820 ) ) ( not ( = ?auto_568816 ?auto_568821 ) ) ( not ( = ?auto_568817 ?auto_568818 ) ) ( not ( = ?auto_568817 ?auto_568819 ) ) ( not ( = ?auto_568817 ?auto_568820 ) ) ( not ( = ?auto_568817 ?auto_568821 ) ) ( not ( = ?auto_568818 ?auto_568819 ) ) ( not ( = ?auto_568818 ?auto_568820 ) ) ( not ( = ?auto_568818 ?auto_568821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568819 ?auto_568820 ?auto_568821 )
      ( MAKE-9CRATE-VERIFY ?auto_568812 ?auto_568813 ?auto_568814 ?auto_568815 ?auto_568816 ?auto_568817 ?auto_568818 ?auto_568819 ?auto_568820 ?auto_568821 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568920 - SURFACE
      ?auto_568921 - SURFACE
      ?auto_568922 - SURFACE
      ?auto_568923 - SURFACE
      ?auto_568924 - SURFACE
      ?auto_568925 - SURFACE
      ?auto_568926 - SURFACE
      ?auto_568927 - SURFACE
      ?auto_568928 - SURFACE
      ?auto_568929 - SURFACE
    )
    :vars
    (
      ?auto_568935 - HOIST
      ?auto_568930 - PLACE
      ?auto_568932 - TRUCK
      ?auto_568933 - PLACE
      ?auto_568931 - HOIST
      ?auto_568934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568935 ?auto_568930 ) ( SURFACE-AT ?auto_568928 ?auto_568930 ) ( CLEAR ?auto_568928 ) ( IS-CRATE ?auto_568929 ) ( not ( = ?auto_568928 ?auto_568929 ) ) ( AVAILABLE ?auto_568935 ) ( ON ?auto_568928 ?auto_568927 ) ( not ( = ?auto_568927 ?auto_568928 ) ) ( not ( = ?auto_568927 ?auto_568929 ) ) ( TRUCK-AT ?auto_568932 ?auto_568933 ) ( not ( = ?auto_568933 ?auto_568930 ) ) ( HOIST-AT ?auto_568931 ?auto_568933 ) ( not ( = ?auto_568935 ?auto_568931 ) ) ( AVAILABLE ?auto_568931 ) ( SURFACE-AT ?auto_568929 ?auto_568933 ) ( ON ?auto_568929 ?auto_568934 ) ( CLEAR ?auto_568929 ) ( not ( = ?auto_568928 ?auto_568934 ) ) ( not ( = ?auto_568929 ?auto_568934 ) ) ( not ( = ?auto_568927 ?auto_568934 ) ) ( ON ?auto_568921 ?auto_568920 ) ( ON ?auto_568922 ?auto_568921 ) ( ON ?auto_568923 ?auto_568922 ) ( ON ?auto_568924 ?auto_568923 ) ( ON ?auto_568925 ?auto_568924 ) ( ON ?auto_568926 ?auto_568925 ) ( ON ?auto_568927 ?auto_568926 ) ( not ( = ?auto_568920 ?auto_568921 ) ) ( not ( = ?auto_568920 ?auto_568922 ) ) ( not ( = ?auto_568920 ?auto_568923 ) ) ( not ( = ?auto_568920 ?auto_568924 ) ) ( not ( = ?auto_568920 ?auto_568925 ) ) ( not ( = ?auto_568920 ?auto_568926 ) ) ( not ( = ?auto_568920 ?auto_568927 ) ) ( not ( = ?auto_568920 ?auto_568928 ) ) ( not ( = ?auto_568920 ?auto_568929 ) ) ( not ( = ?auto_568920 ?auto_568934 ) ) ( not ( = ?auto_568921 ?auto_568922 ) ) ( not ( = ?auto_568921 ?auto_568923 ) ) ( not ( = ?auto_568921 ?auto_568924 ) ) ( not ( = ?auto_568921 ?auto_568925 ) ) ( not ( = ?auto_568921 ?auto_568926 ) ) ( not ( = ?auto_568921 ?auto_568927 ) ) ( not ( = ?auto_568921 ?auto_568928 ) ) ( not ( = ?auto_568921 ?auto_568929 ) ) ( not ( = ?auto_568921 ?auto_568934 ) ) ( not ( = ?auto_568922 ?auto_568923 ) ) ( not ( = ?auto_568922 ?auto_568924 ) ) ( not ( = ?auto_568922 ?auto_568925 ) ) ( not ( = ?auto_568922 ?auto_568926 ) ) ( not ( = ?auto_568922 ?auto_568927 ) ) ( not ( = ?auto_568922 ?auto_568928 ) ) ( not ( = ?auto_568922 ?auto_568929 ) ) ( not ( = ?auto_568922 ?auto_568934 ) ) ( not ( = ?auto_568923 ?auto_568924 ) ) ( not ( = ?auto_568923 ?auto_568925 ) ) ( not ( = ?auto_568923 ?auto_568926 ) ) ( not ( = ?auto_568923 ?auto_568927 ) ) ( not ( = ?auto_568923 ?auto_568928 ) ) ( not ( = ?auto_568923 ?auto_568929 ) ) ( not ( = ?auto_568923 ?auto_568934 ) ) ( not ( = ?auto_568924 ?auto_568925 ) ) ( not ( = ?auto_568924 ?auto_568926 ) ) ( not ( = ?auto_568924 ?auto_568927 ) ) ( not ( = ?auto_568924 ?auto_568928 ) ) ( not ( = ?auto_568924 ?auto_568929 ) ) ( not ( = ?auto_568924 ?auto_568934 ) ) ( not ( = ?auto_568925 ?auto_568926 ) ) ( not ( = ?auto_568925 ?auto_568927 ) ) ( not ( = ?auto_568925 ?auto_568928 ) ) ( not ( = ?auto_568925 ?auto_568929 ) ) ( not ( = ?auto_568925 ?auto_568934 ) ) ( not ( = ?auto_568926 ?auto_568927 ) ) ( not ( = ?auto_568926 ?auto_568928 ) ) ( not ( = ?auto_568926 ?auto_568929 ) ) ( not ( = ?auto_568926 ?auto_568934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568927 ?auto_568928 ?auto_568929 )
      ( MAKE-9CRATE-VERIFY ?auto_568920 ?auto_568921 ?auto_568922 ?auto_568923 ?auto_568924 ?auto_568925 ?auto_568926 ?auto_568927 ?auto_568928 ?auto_568929 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569029 - SURFACE
      ?auto_569030 - SURFACE
      ?auto_569031 - SURFACE
      ?auto_569032 - SURFACE
      ?auto_569033 - SURFACE
      ?auto_569034 - SURFACE
      ?auto_569035 - SURFACE
      ?auto_569036 - SURFACE
      ?auto_569037 - SURFACE
      ?auto_569038 - SURFACE
    )
    :vars
    (
      ?auto_569042 - HOIST
      ?auto_569040 - PLACE
      ?auto_569044 - PLACE
      ?auto_569039 - HOIST
      ?auto_569043 - SURFACE
      ?auto_569041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569042 ?auto_569040 ) ( SURFACE-AT ?auto_569037 ?auto_569040 ) ( CLEAR ?auto_569037 ) ( IS-CRATE ?auto_569038 ) ( not ( = ?auto_569037 ?auto_569038 ) ) ( AVAILABLE ?auto_569042 ) ( ON ?auto_569037 ?auto_569036 ) ( not ( = ?auto_569036 ?auto_569037 ) ) ( not ( = ?auto_569036 ?auto_569038 ) ) ( not ( = ?auto_569044 ?auto_569040 ) ) ( HOIST-AT ?auto_569039 ?auto_569044 ) ( not ( = ?auto_569042 ?auto_569039 ) ) ( AVAILABLE ?auto_569039 ) ( SURFACE-AT ?auto_569038 ?auto_569044 ) ( ON ?auto_569038 ?auto_569043 ) ( CLEAR ?auto_569038 ) ( not ( = ?auto_569037 ?auto_569043 ) ) ( not ( = ?auto_569038 ?auto_569043 ) ) ( not ( = ?auto_569036 ?auto_569043 ) ) ( TRUCK-AT ?auto_569041 ?auto_569040 ) ( ON ?auto_569030 ?auto_569029 ) ( ON ?auto_569031 ?auto_569030 ) ( ON ?auto_569032 ?auto_569031 ) ( ON ?auto_569033 ?auto_569032 ) ( ON ?auto_569034 ?auto_569033 ) ( ON ?auto_569035 ?auto_569034 ) ( ON ?auto_569036 ?auto_569035 ) ( not ( = ?auto_569029 ?auto_569030 ) ) ( not ( = ?auto_569029 ?auto_569031 ) ) ( not ( = ?auto_569029 ?auto_569032 ) ) ( not ( = ?auto_569029 ?auto_569033 ) ) ( not ( = ?auto_569029 ?auto_569034 ) ) ( not ( = ?auto_569029 ?auto_569035 ) ) ( not ( = ?auto_569029 ?auto_569036 ) ) ( not ( = ?auto_569029 ?auto_569037 ) ) ( not ( = ?auto_569029 ?auto_569038 ) ) ( not ( = ?auto_569029 ?auto_569043 ) ) ( not ( = ?auto_569030 ?auto_569031 ) ) ( not ( = ?auto_569030 ?auto_569032 ) ) ( not ( = ?auto_569030 ?auto_569033 ) ) ( not ( = ?auto_569030 ?auto_569034 ) ) ( not ( = ?auto_569030 ?auto_569035 ) ) ( not ( = ?auto_569030 ?auto_569036 ) ) ( not ( = ?auto_569030 ?auto_569037 ) ) ( not ( = ?auto_569030 ?auto_569038 ) ) ( not ( = ?auto_569030 ?auto_569043 ) ) ( not ( = ?auto_569031 ?auto_569032 ) ) ( not ( = ?auto_569031 ?auto_569033 ) ) ( not ( = ?auto_569031 ?auto_569034 ) ) ( not ( = ?auto_569031 ?auto_569035 ) ) ( not ( = ?auto_569031 ?auto_569036 ) ) ( not ( = ?auto_569031 ?auto_569037 ) ) ( not ( = ?auto_569031 ?auto_569038 ) ) ( not ( = ?auto_569031 ?auto_569043 ) ) ( not ( = ?auto_569032 ?auto_569033 ) ) ( not ( = ?auto_569032 ?auto_569034 ) ) ( not ( = ?auto_569032 ?auto_569035 ) ) ( not ( = ?auto_569032 ?auto_569036 ) ) ( not ( = ?auto_569032 ?auto_569037 ) ) ( not ( = ?auto_569032 ?auto_569038 ) ) ( not ( = ?auto_569032 ?auto_569043 ) ) ( not ( = ?auto_569033 ?auto_569034 ) ) ( not ( = ?auto_569033 ?auto_569035 ) ) ( not ( = ?auto_569033 ?auto_569036 ) ) ( not ( = ?auto_569033 ?auto_569037 ) ) ( not ( = ?auto_569033 ?auto_569038 ) ) ( not ( = ?auto_569033 ?auto_569043 ) ) ( not ( = ?auto_569034 ?auto_569035 ) ) ( not ( = ?auto_569034 ?auto_569036 ) ) ( not ( = ?auto_569034 ?auto_569037 ) ) ( not ( = ?auto_569034 ?auto_569038 ) ) ( not ( = ?auto_569034 ?auto_569043 ) ) ( not ( = ?auto_569035 ?auto_569036 ) ) ( not ( = ?auto_569035 ?auto_569037 ) ) ( not ( = ?auto_569035 ?auto_569038 ) ) ( not ( = ?auto_569035 ?auto_569043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569036 ?auto_569037 ?auto_569038 )
      ( MAKE-9CRATE-VERIFY ?auto_569029 ?auto_569030 ?auto_569031 ?auto_569032 ?auto_569033 ?auto_569034 ?auto_569035 ?auto_569036 ?auto_569037 ?auto_569038 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569138 - SURFACE
      ?auto_569139 - SURFACE
      ?auto_569140 - SURFACE
      ?auto_569141 - SURFACE
      ?auto_569142 - SURFACE
      ?auto_569143 - SURFACE
      ?auto_569144 - SURFACE
      ?auto_569145 - SURFACE
      ?auto_569146 - SURFACE
      ?auto_569147 - SURFACE
    )
    :vars
    (
      ?auto_569148 - HOIST
      ?auto_569149 - PLACE
      ?auto_569153 - PLACE
      ?auto_569151 - HOIST
      ?auto_569152 - SURFACE
      ?auto_569150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569148 ?auto_569149 ) ( IS-CRATE ?auto_569147 ) ( not ( = ?auto_569146 ?auto_569147 ) ) ( not ( = ?auto_569145 ?auto_569146 ) ) ( not ( = ?auto_569145 ?auto_569147 ) ) ( not ( = ?auto_569153 ?auto_569149 ) ) ( HOIST-AT ?auto_569151 ?auto_569153 ) ( not ( = ?auto_569148 ?auto_569151 ) ) ( AVAILABLE ?auto_569151 ) ( SURFACE-AT ?auto_569147 ?auto_569153 ) ( ON ?auto_569147 ?auto_569152 ) ( CLEAR ?auto_569147 ) ( not ( = ?auto_569146 ?auto_569152 ) ) ( not ( = ?auto_569147 ?auto_569152 ) ) ( not ( = ?auto_569145 ?auto_569152 ) ) ( TRUCK-AT ?auto_569150 ?auto_569149 ) ( SURFACE-AT ?auto_569145 ?auto_569149 ) ( CLEAR ?auto_569145 ) ( LIFTING ?auto_569148 ?auto_569146 ) ( IS-CRATE ?auto_569146 ) ( ON ?auto_569139 ?auto_569138 ) ( ON ?auto_569140 ?auto_569139 ) ( ON ?auto_569141 ?auto_569140 ) ( ON ?auto_569142 ?auto_569141 ) ( ON ?auto_569143 ?auto_569142 ) ( ON ?auto_569144 ?auto_569143 ) ( ON ?auto_569145 ?auto_569144 ) ( not ( = ?auto_569138 ?auto_569139 ) ) ( not ( = ?auto_569138 ?auto_569140 ) ) ( not ( = ?auto_569138 ?auto_569141 ) ) ( not ( = ?auto_569138 ?auto_569142 ) ) ( not ( = ?auto_569138 ?auto_569143 ) ) ( not ( = ?auto_569138 ?auto_569144 ) ) ( not ( = ?auto_569138 ?auto_569145 ) ) ( not ( = ?auto_569138 ?auto_569146 ) ) ( not ( = ?auto_569138 ?auto_569147 ) ) ( not ( = ?auto_569138 ?auto_569152 ) ) ( not ( = ?auto_569139 ?auto_569140 ) ) ( not ( = ?auto_569139 ?auto_569141 ) ) ( not ( = ?auto_569139 ?auto_569142 ) ) ( not ( = ?auto_569139 ?auto_569143 ) ) ( not ( = ?auto_569139 ?auto_569144 ) ) ( not ( = ?auto_569139 ?auto_569145 ) ) ( not ( = ?auto_569139 ?auto_569146 ) ) ( not ( = ?auto_569139 ?auto_569147 ) ) ( not ( = ?auto_569139 ?auto_569152 ) ) ( not ( = ?auto_569140 ?auto_569141 ) ) ( not ( = ?auto_569140 ?auto_569142 ) ) ( not ( = ?auto_569140 ?auto_569143 ) ) ( not ( = ?auto_569140 ?auto_569144 ) ) ( not ( = ?auto_569140 ?auto_569145 ) ) ( not ( = ?auto_569140 ?auto_569146 ) ) ( not ( = ?auto_569140 ?auto_569147 ) ) ( not ( = ?auto_569140 ?auto_569152 ) ) ( not ( = ?auto_569141 ?auto_569142 ) ) ( not ( = ?auto_569141 ?auto_569143 ) ) ( not ( = ?auto_569141 ?auto_569144 ) ) ( not ( = ?auto_569141 ?auto_569145 ) ) ( not ( = ?auto_569141 ?auto_569146 ) ) ( not ( = ?auto_569141 ?auto_569147 ) ) ( not ( = ?auto_569141 ?auto_569152 ) ) ( not ( = ?auto_569142 ?auto_569143 ) ) ( not ( = ?auto_569142 ?auto_569144 ) ) ( not ( = ?auto_569142 ?auto_569145 ) ) ( not ( = ?auto_569142 ?auto_569146 ) ) ( not ( = ?auto_569142 ?auto_569147 ) ) ( not ( = ?auto_569142 ?auto_569152 ) ) ( not ( = ?auto_569143 ?auto_569144 ) ) ( not ( = ?auto_569143 ?auto_569145 ) ) ( not ( = ?auto_569143 ?auto_569146 ) ) ( not ( = ?auto_569143 ?auto_569147 ) ) ( not ( = ?auto_569143 ?auto_569152 ) ) ( not ( = ?auto_569144 ?auto_569145 ) ) ( not ( = ?auto_569144 ?auto_569146 ) ) ( not ( = ?auto_569144 ?auto_569147 ) ) ( not ( = ?auto_569144 ?auto_569152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569145 ?auto_569146 ?auto_569147 )
      ( MAKE-9CRATE-VERIFY ?auto_569138 ?auto_569139 ?auto_569140 ?auto_569141 ?auto_569142 ?auto_569143 ?auto_569144 ?auto_569145 ?auto_569146 ?auto_569147 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_569247 - SURFACE
      ?auto_569248 - SURFACE
      ?auto_569249 - SURFACE
      ?auto_569250 - SURFACE
      ?auto_569251 - SURFACE
      ?auto_569252 - SURFACE
      ?auto_569253 - SURFACE
      ?auto_569254 - SURFACE
      ?auto_569255 - SURFACE
      ?auto_569256 - SURFACE
    )
    :vars
    (
      ?auto_569262 - HOIST
      ?auto_569258 - PLACE
      ?auto_569261 - PLACE
      ?auto_569257 - HOIST
      ?auto_569259 - SURFACE
      ?auto_569260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569262 ?auto_569258 ) ( IS-CRATE ?auto_569256 ) ( not ( = ?auto_569255 ?auto_569256 ) ) ( not ( = ?auto_569254 ?auto_569255 ) ) ( not ( = ?auto_569254 ?auto_569256 ) ) ( not ( = ?auto_569261 ?auto_569258 ) ) ( HOIST-AT ?auto_569257 ?auto_569261 ) ( not ( = ?auto_569262 ?auto_569257 ) ) ( AVAILABLE ?auto_569257 ) ( SURFACE-AT ?auto_569256 ?auto_569261 ) ( ON ?auto_569256 ?auto_569259 ) ( CLEAR ?auto_569256 ) ( not ( = ?auto_569255 ?auto_569259 ) ) ( not ( = ?auto_569256 ?auto_569259 ) ) ( not ( = ?auto_569254 ?auto_569259 ) ) ( TRUCK-AT ?auto_569260 ?auto_569258 ) ( SURFACE-AT ?auto_569254 ?auto_569258 ) ( CLEAR ?auto_569254 ) ( IS-CRATE ?auto_569255 ) ( AVAILABLE ?auto_569262 ) ( IN ?auto_569255 ?auto_569260 ) ( ON ?auto_569248 ?auto_569247 ) ( ON ?auto_569249 ?auto_569248 ) ( ON ?auto_569250 ?auto_569249 ) ( ON ?auto_569251 ?auto_569250 ) ( ON ?auto_569252 ?auto_569251 ) ( ON ?auto_569253 ?auto_569252 ) ( ON ?auto_569254 ?auto_569253 ) ( not ( = ?auto_569247 ?auto_569248 ) ) ( not ( = ?auto_569247 ?auto_569249 ) ) ( not ( = ?auto_569247 ?auto_569250 ) ) ( not ( = ?auto_569247 ?auto_569251 ) ) ( not ( = ?auto_569247 ?auto_569252 ) ) ( not ( = ?auto_569247 ?auto_569253 ) ) ( not ( = ?auto_569247 ?auto_569254 ) ) ( not ( = ?auto_569247 ?auto_569255 ) ) ( not ( = ?auto_569247 ?auto_569256 ) ) ( not ( = ?auto_569247 ?auto_569259 ) ) ( not ( = ?auto_569248 ?auto_569249 ) ) ( not ( = ?auto_569248 ?auto_569250 ) ) ( not ( = ?auto_569248 ?auto_569251 ) ) ( not ( = ?auto_569248 ?auto_569252 ) ) ( not ( = ?auto_569248 ?auto_569253 ) ) ( not ( = ?auto_569248 ?auto_569254 ) ) ( not ( = ?auto_569248 ?auto_569255 ) ) ( not ( = ?auto_569248 ?auto_569256 ) ) ( not ( = ?auto_569248 ?auto_569259 ) ) ( not ( = ?auto_569249 ?auto_569250 ) ) ( not ( = ?auto_569249 ?auto_569251 ) ) ( not ( = ?auto_569249 ?auto_569252 ) ) ( not ( = ?auto_569249 ?auto_569253 ) ) ( not ( = ?auto_569249 ?auto_569254 ) ) ( not ( = ?auto_569249 ?auto_569255 ) ) ( not ( = ?auto_569249 ?auto_569256 ) ) ( not ( = ?auto_569249 ?auto_569259 ) ) ( not ( = ?auto_569250 ?auto_569251 ) ) ( not ( = ?auto_569250 ?auto_569252 ) ) ( not ( = ?auto_569250 ?auto_569253 ) ) ( not ( = ?auto_569250 ?auto_569254 ) ) ( not ( = ?auto_569250 ?auto_569255 ) ) ( not ( = ?auto_569250 ?auto_569256 ) ) ( not ( = ?auto_569250 ?auto_569259 ) ) ( not ( = ?auto_569251 ?auto_569252 ) ) ( not ( = ?auto_569251 ?auto_569253 ) ) ( not ( = ?auto_569251 ?auto_569254 ) ) ( not ( = ?auto_569251 ?auto_569255 ) ) ( not ( = ?auto_569251 ?auto_569256 ) ) ( not ( = ?auto_569251 ?auto_569259 ) ) ( not ( = ?auto_569252 ?auto_569253 ) ) ( not ( = ?auto_569252 ?auto_569254 ) ) ( not ( = ?auto_569252 ?auto_569255 ) ) ( not ( = ?auto_569252 ?auto_569256 ) ) ( not ( = ?auto_569252 ?auto_569259 ) ) ( not ( = ?auto_569253 ?auto_569254 ) ) ( not ( = ?auto_569253 ?auto_569255 ) ) ( not ( = ?auto_569253 ?auto_569256 ) ) ( not ( = ?auto_569253 ?auto_569259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_569254 ?auto_569255 ?auto_569256 )
      ( MAKE-9CRATE-VERIFY ?auto_569247 ?auto_569248 ?auto_569249 ?auto_569250 ?auto_569251 ?auto_569252 ?auto_569253 ?auto_569254 ?auto_569255 ?auto_569256 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574812 - SURFACE
      ?auto_574813 - SURFACE
      ?auto_574814 - SURFACE
      ?auto_574815 - SURFACE
      ?auto_574816 - SURFACE
      ?auto_574817 - SURFACE
      ?auto_574818 - SURFACE
      ?auto_574819 - SURFACE
      ?auto_574820 - SURFACE
      ?auto_574821 - SURFACE
      ?auto_574822 - SURFACE
    )
    :vars
    (
      ?auto_574824 - HOIST
      ?auto_574823 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_574824 ?auto_574823 ) ( SURFACE-AT ?auto_574821 ?auto_574823 ) ( CLEAR ?auto_574821 ) ( LIFTING ?auto_574824 ?auto_574822 ) ( IS-CRATE ?auto_574822 ) ( not ( = ?auto_574821 ?auto_574822 ) ) ( ON ?auto_574813 ?auto_574812 ) ( ON ?auto_574814 ?auto_574813 ) ( ON ?auto_574815 ?auto_574814 ) ( ON ?auto_574816 ?auto_574815 ) ( ON ?auto_574817 ?auto_574816 ) ( ON ?auto_574818 ?auto_574817 ) ( ON ?auto_574819 ?auto_574818 ) ( ON ?auto_574820 ?auto_574819 ) ( ON ?auto_574821 ?auto_574820 ) ( not ( = ?auto_574812 ?auto_574813 ) ) ( not ( = ?auto_574812 ?auto_574814 ) ) ( not ( = ?auto_574812 ?auto_574815 ) ) ( not ( = ?auto_574812 ?auto_574816 ) ) ( not ( = ?auto_574812 ?auto_574817 ) ) ( not ( = ?auto_574812 ?auto_574818 ) ) ( not ( = ?auto_574812 ?auto_574819 ) ) ( not ( = ?auto_574812 ?auto_574820 ) ) ( not ( = ?auto_574812 ?auto_574821 ) ) ( not ( = ?auto_574812 ?auto_574822 ) ) ( not ( = ?auto_574813 ?auto_574814 ) ) ( not ( = ?auto_574813 ?auto_574815 ) ) ( not ( = ?auto_574813 ?auto_574816 ) ) ( not ( = ?auto_574813 ?auto_574817 ) ) ( not ( = ?auto_574813 ?auto_574818 ) ) ( not ( = ?auto_574813 ?auto_574819 ) ) ( not ( = ?auto_574813 ?auto_574820 ) ) ( not ( = ?auto_574813 ?auto_574821 ) ) ( not ( = ?auto_574813 ?auto_574822 ) ) ( not ( = ?auto_574814 ?auto_574815 ) ) ( not ( = ?auto_574814 ?auto_574816 ) ) ( not ( = ?auto_574814 ?auto_574817 ) ) ( not ( = ?auto_574814 ?auto_574818 ) ) ( not ( = ?auto_574814 ?auto_574819 ) ) ( not ( = ?auto_574814 ?auto_574820 ) ) ( not ( = ?auto_574814 ?auto_574821 ) ) ( not ( = ?auto_574814 ?auto_574822 ) ) ( not ( = ?auto_574815 ?auto_574816 ) ) ( not ( = ?auto_574815 ?auto_574817 ) ) ( not ( = ?auto_574815 ?auto_574818 ) ) ( not ( = ?auto_574815 ?auto_574819 ) ) ( not ( = ?auto_574815 ?auto_574820 ) ) ( not ( = ?auto_574815 ?auto_574821 ) ) ( not ( = ?auto_574815 ?auto_574822 ) ) ( not ( = ?auto_574816 ?auto_574817 ) ) ( not ( = ?auto_574816 ?auto_574818 ) ) ( not ( = ?auto_574816 ?auto_574819 ) ) ( not ( = ?auto_574816 ?auto_574820 ) ) ( not ( = ?auto_574816 ?auto_574821 ) ) ( not ( = ?auto_574816 ?auto_574822 ) ) ( not ( = ?auto_574817 ?auto_574818 ) ) ( not ( = ?auto_574817 ?auto_574819 ) ) ( not ( = ?auto_574817 ?auto_574820 ) ) ( not ( = ?auto_574817 ?auto_574821 ) ) ( not ( = ?auto_574817 ?auto_574822 ) ) ( not ( = ?auto_574818 ?auto_574819 ) ) ( not ( = ?auto_574818 ?auto_574820 ) ) ( not ( = ?auto_574818 ?auto_574821 ) ) ( not ( = ?auto_574818 ?auto_574822 ) ) ( not ( = ?auto_574819 ?auto_574820 ) ) ( not ( = ?auto_574819 ?auto_574821 ) ) ( not ( = ?auto_574819 ?auto_574822 ) ) ( not ( = ?auto_574820 ?auto_574821 ) ) ( not ( = ?auto_574820 ?auto_574822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_574821 ?auto_574822 )
      ( MAKE-10CRATE-VERIFY ?auto_574812 ?auto_574813 ?auto_574814 ?auto_574815 ?auto_574816 ?auto_574817 ?auto_574818 ?auto_574819 ?auto_574820 ?auto_574821 ?auto_574822 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574906 - SURFACE
      ?auto_574907 - SURFACE
      ?auto_574908 - SURFACE
      ?auto_574909 - SURFACE
      ?auto_574910 - SURFACE
      ?auto_574911 - SURFACE
      ?auto_574912 - SURFACE
      ?auto_574913 - SURFACE
      ?auto_574914 - SURFACE
      ?auto_574915 - SURFACE
      ?auto_574916 - SURFACE
    )
    :vars
    (
      ?auto_574918 - HOIST
      ?auto_574917 - PLACE
      ?auto_574919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_574918 ?auto_574917 ) ( SURFACE-AT ?auto_574915 ?auto_574917 ) ( CLEAR ?auto_574915 ) ( IS-CRATE ?auto_574916 ) ( not ( = ?auto_574915 ?auto_574916 ) ) ( TRUCK-AT ?auto_574919 ?auto_574917 ) ( AVAILABLE ?auto_574918 ) ( IN ?auto_574916 ?auto_574919 ) ( ON ?auto_574915 ?auto_574914 ) ( not ( = ?auto_574914 ?auto_574915 ) ) ( not ( = ?auto_574914 ?auto_574916 ) ) ( ON ?auto_574907 ?auto_574906 ) ( ON ?auto_574908 ?auto_574907 ) ( ON ?auto_574909 ?auto_574908 ) ( ON ?auto_574910 ?auto_574909 ) ( ON ?auto_574911 ?auto_574910 ) ( ON ?auto_574912 ?auto_574911 ) ( ON ?auto_574913 ?auto_574912 ) ( ON ?auto_574914 ?auto_574913 ) ( not ( = ?auto_574906 ?auto_574907 ) ) ( not ( = ?auto_574906 ?auto_574908 ) ) ( not ( = ?auto_574906 ?auto_574909 ) ) ( not ( = ?auto_574906 ?auto_574910 ) ) ( not ( = ?auto_574906 ?auto_574911 ) ) ( not ( = ?auto_574906 ?auto_574912 ) ) ( not ( = ?auto_574906 ?auto_574913 ) ) ( not ( = ?auto_574906 ?auto_574914 ) ) ( not ( = ?auto_574906 ?auto_574915 ) ) ( not ( = ?auto_574906 ?auto_574916 ) ) ( not ( = ?auto_574907 ?auto_574908 ) ) ( not ( = ?auto_574907 ?auto_574909 ) ) ( not ( = ?auto_574907 ?auto_574910 ) ) ( not ( = ?auto_574907 ?auto_574911 ) ) ( not ( = ?auto_574907 ?auto_574912 ) ) ( not ( = ?auto_574907 ?auto_574913 ) ) ( not ( = ?auto_574907 ?auto_574914 ) ) ( not ( = ?auto_574907 ?auto_574915 ) ) ( not ( = ?auto_574907 ?auto_574916 ) ) ( not ( = ?auto_574908 ?auto_574909 ) ) ( not ( = ?auto_574908 ?auto_574910 ) ) ( not ( = ?auto_574908 ?auto_574911 ) ) ( not ( = ?auto_574908 ?auto_574912 ) ) ( not ( = ?auto_574908 ?auto_574913 ) ) ( not ( = ?auto_574908 ?auto_574914 ) ) ( not ( = ?auto_574908 ?auto_574915 ) ) ( not ( = ?auto_574908 ?auto_574916 ) ) ( not ( = ?auto_574909 ?auto_574910 ) ) ( not ( = ?auto_574909 ?auto_574911 ) ) ( not ( = ?auto_574909 ?auto_574912 ) ) ( not ( = ?auto_574909 ?auto_574913 ) ) ( not ( = ?auto_574909 ?auto_574914 ) ) ( not ( = ?auto_574909 ?auto_574915 ) ) ( not ( = ?auto_574909 ?auto_574916 ) ) ( not ( = ?auto_574910 ?auto_574911 ) ) ( not ( = ?auto_574910 ?auto_574912 ) ) ( not ( = ?auto_574910 ?auto_574913 ) ) ( not ( = ?auto_574910 ?auto_574914 ) ) ( not ( = ?auto_574910 ?auto_574915 ) ) ( not ( = ?auto_574910 ?auto_574916 ) ) ( not ( = ?auto_574911 ?auto_574912 ) ) ( not ( = ?auto_574911 ?auto_574913 ) ) ( not ( = ?auto_574911 ?auto_574914 ) ) ( not ( = ?auto_574911 ?auto_574915 ) ) ( not ( = ?auto_574911 ?auto_574916 ) ) ( not ( = ?auto_574912 ?auto_574913 ) ) ( not ( = ?auto_574912 ?auto_574914 ) ) ( not ( = ?auto_574912 ?auto_574915 ) ) ( not ( = ?auto_574912 ?auto_574916 ) ) ( not ( = ?auto_574913 ?auto_574914 ) ) ( not ( = ?auto_574913 ?auto_574915 ) ) ( not ( = ?auto_574913 ?auto_574916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_574914 ?auto_574915 ?auto_574916 )
      ( MAKE-10CRATE-VERIFY ?auto_574906 ?auto_574907 ?auto_574908 ?auto_574909 ?auto_574910 ?auto_574911 ?auto_574912 ?auto_574913 ?auto_574914 ?auto_574915 ?auto_574916 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575011 - SURFACE
      ?auto_575012 - SURFACE
      ?auto_575013 - SURFACE
      ?auto_575014 - SURFACE
      ?auto_575015 - SURFACE
      ?auto_575016 - SURFACE
      ?auto_575017 - SURFACE
      ?auto_575018 - SURFACE
      ?auto_575019 - SURFACE
      ?auto_575020 - SURFACE
      ?auto_575021 - SURFACE
    )
    :vars
    (
      ?auto_575022 - HOIST
      ?auto_575025 - PLACE
      ?auto_575023 - TRUCK
      ?auto_575024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575022 ?auto_575025 ) ( SURFACE-AT ?auto_575020 ?auto_575025 ) ( CLEAR ?auto_575020 ) ( IS-CRATE ?auto_575021 ) ( not ( = ?auto_575020 ?auto_575021 ) ) ( AVAILABLE ?auto_575022 ) ( IN ?auto_575021 ?auto_575023 ) ( ON ?auto_575020 ?auto_575019 ) ( not ( = ?auto_575019 ?auto_575020 ) ) ( not ( = ?auto_575019 ?auto_575021 ) ) ( TRUCK-AT ?auto_575023 ?auto_575024 ) ( not ( = ?auto_575024 ?auto_575025 ) ) ( ON ?auto_575012 ?auto_575011 ) ( ON ?auto_575013 ?auto_575012 ) ( ON ?auto_575014 ?auto_575013 ) ( ON ?auto_575015 ?auto_575014 ) ( ON ?auto_575016 ?auto_575015 ) ( ON ?auto_575017 ?auto_575016 ) ( ON ?auto_575018 ?auto_575017 ) ( ON ?auto_575019 ?auto_575018 ) ( not ( = ?auto_575011 ?auto_575012 ) ) ( not ( = ?auto_575011 ?auto_575013 ) ) ( not ( = ?auto_575011 ?auto_575014 ) ) ( not ( = ?auto_575011 ?auto_575015 ) ) ( not ( = ?auto_575011 ?auto_575016 ) ) ( not ( = ?auto_575011 ?auto_575017 ) ) ( not ( = ?auto_575011 ?auto_575018 ) ) ( not ( = ?auto_575011 ?auto_575019 ) ) ( not ( = ?auto_575011 ?auto_575020 ) ) ( not ( = ?auto_575011 ?auto_575021 ) ) ( not ( = ?auto_575012 ?auto_575013 ) ) ( not ( = ?auto_575012 ?auto_575014 ) ) ( not ( = ?auto_575012 ?auto_575015 ) ) ( not ( = ?auto_575012 ?auto_575016 ) ) ( not ( = ?auto_575012 ?auto_575017 ) ) ( not ( = ?auto_575012 ?auto_575018 ) ) ( not ( = ?auto_575012 ?auto_575019 ) ) ( not ( = ?auto_575012 ?auto_575020 ) ) ( not ( = ?auto_575012 ?auto_575021 ) ) ( not ( = ?auto_575013 ?auto_575014 ) ) ( not ( = ?auto_575013 ?auto_575015 ) ) ( not ( = ?auto_575013 ?auto_575016 ) ) ( not ( = ?auto_575013 ?auto_575017 ) ) ( not ( = ?auto_575013 ?auto_575018 ) ) ( not ( = ?auto_575013 ?auto_575019 ) ) ( not ( = ?auto_575013 ?auto_575020 ) ) ( not ( = ?auto_575013 ?auto_575021 ) ) ( not ( = ?auto_575014 ?auto_575015 ) ) ( not ( = ?auto_575014 ?auto_575016 ) ) ( not ( = ?auto_575014 ?auto_575017 ) ) ( not ( = ?auto_575014 ?auto_575018 ) ) ( not ( = ?auto_575014 ?auto_575019 ) ) ( not ( = ?auto_575014 ?auto_575020 ) ) ( not ( = ?auto_575014 ?auto_575021 ) ) ( not ( = ?auto_575015 ?auto_575016 ) ) ( not ( = ?auto_575015 ?auto_575017 ) ) ( not ( = ?auto_575015 ?auto_575018 ) ) ( not ( = ?auto_575015 ?auto_575019 ) ) ( not ( = ?auto_575015 ?auto_575020 ) ) ( not ( = ?auto_575015 ?auto_575021 ) ) ( not ( = ?auto_575016 ?auto_575017 ) ) ( not ( = ?auto_575016 ?auto_575018 ) ) ( not ( = ?auto_575016 ?auto_575019 ) ) ( not ( = ?auto_575016 ?auto_575020 ) ) ( not ( = ?auto_575016 ?auto_575021 ) ) ( not ( = ?auto_575017 ?auto_575018 ) ) ( not ( = ?auto_575017 ?auto_575019 ) ) ( not ( = ?auto_575017 ?auto_575020 ) ) ( not ( = ?auto_575017 ?auto_575021 ) ) ( not ( = ?auto_575018 ?auto_575019 ) ) ( not ( = ?auto_575018 ?auto_575020 ) ) ( not ( = ?auto_575018 ?auto_575021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575019 ?auto_575020 ?auto_575021 )
      ( MAKE-10CRATE-VERIFY ?auto_575011 ?auto_575012 ?auto_575013 ?auto_575014 ?auto_575015 ?auto_575016 ?auto_575017 ?auto_575018 ?auto_575019 ?auto_575020 ?auto_575021 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575126 - SURFACE
      ?auto_575127 - SURFACE
      ?auto_575128 - SURFACE
      ?auto_575129 - SURFACE
      ?auto_575130 - SURFACE
      ?auto_575131 - SURFACE
      ?auto_575132 - SURFACE
      ?auto_575133 - SURFACE
      ?auto_575134 - SURFACE
      ?auto_575135 - SURFACE
      ?auto_575136 - SURFACE
    )
    :vars
    (
      ?auto_575138 - HOIST
      ?auto_575140 - PLACE
      ?auto_575139 - TRUCK
      ?auto_575141 - PLACE
      ?auto_575137 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_575138 ?auto_575140 ) ( SURFACE-AT ?auto_575135 ?auto_575140 ) ( CLEAR ?auto_575135 ) ( IS-CRATE ?auto_575136 ) ( not ( = ?auto_575135 ?auto_575136 ) ) ( AVAILABLE ?auto_575138 ) ( ON ?auto_575135 ?auto_575134 ) ( not ( = ?auto_575134 ?auto_575135 ) ) ( not ( = ?auto_575134 ?auto_575136 ) ) ( TRUCK-AT ?auto_575139 ?auto_575141 ) ( not ( = ?auto_575141 ?auto_575140 ) ) ( HOIST-AT ?auto_575137 ?auto_575141 ) ( LIFTING ?auto_575137 ?auto_575136 ) ( not ( = ?auto_575138 ?auto_575137 ) ) ( ON ?auto_575127 ?auto_575126 ) ( ON ?auto_575128 ?auto_575127 ) ( ON ?auto_575129 ?auto_575128 ) ( ON ?auto_575130 ?auto_575129 ) ( ON ?auto_575131 ?auto_575130 ) ( ON ?auto_575132 ?auto_575131 ) ( ON ?auto_575133 ?auto_575132 ) ( ON ?auto_575134 ?auto_575133 ) ( not ( = ?auto_575126 ?auto_575127 ) ) ( not ( = ?auto_575126 ?auto_575128 ) ) ( not ( = ?auto_575126 ?auto_575129 ) ) ( not ( = ?auto_575126 ?auto_575130 ) ) ( not ( = ?auto_575126 ?auto_575131 ) ) ( not ( = ?auto_575126 ?auto_575132 ) ) ( not ( = ?auto_575126 ?auto_575133 ) ) ( not ( = ?auto_575126 ?auto_575134 ) ) ( not ( = ?auto_575126 ?auto_575135 ) ) ( not ( = ?auto_575126 ?auto_575136 ) ) ( not ( = ?auto_575127 ?auto_575128 ) ) ( not ( = ?auto_575127 ?auto_575129 ) ) ( not ( = ?auto_575127 ?auto_575130 ) ) ( not ( = ?auto_575127 ?auto_575131 ) ) ( not ( = ?auto_575127 ?auto_575132 ) ) ( not ( = ?auto_575127 ?auto_575133 ) ) ( not ( = ?auto_575127 ?auto_575134 ) ) ( not ( = ?auto_575127 ?auto_575135 ) ) ( not ( = ?auto_575127 ?auto_575136 ) ) ( not ( = ?auto_575128 ?auto_575129 ) ) ( not ( = ?auto_575128 ?auto_575130 ) ) ( not ( = ?auto_575128 ?auto_575131 ) ) ( not ( = ?auto_575128 ?auto_575132 ) ) ( not ( = ?auto_575128 ?auto_575133 ) ) ( not ( = ?auto_575128 ?auto_575134 ) ) ( not ( = ?auto_575128 ?auto_575135 ) ) ( not ( = ?auto_575128 ?auto_575136 ) ) ( not ( = ?auto_575129 ?auto_575130 ) ) ( not ( = ?auto_575129 ?auto_575131 ) ) ( not ( = ?auto_575129 ?auto_575132 ) ) ( not ( = ?auto_575129 ?auto_575133 ) ) ( not ( = ?auto_575129 ?auto_575134 ) ) ( not ( = ?auto_575129 ?auto_575135 ) ) ( not ( = ?auto_575129 ?auto_575136 ) ) ( not ( = ?auto_575130 ?auto_575131 ) ) ( not ( = ?auto_575130 ?auto_575132 ) ) ( not ( = ?auto_575130 ?auto_575133 ) ) ( not ( = ?auto_575130 ?auto_575134 ) ) ( not ( = ?auto_575130 ?auto_575135 ) ) ( not ( = ?auto_575130 ?auto_575136 ) ) ( not ( = ?auto_575131 ?auto_575132 ) ) ( not ( = ?auto_575131 ?auto_575133 ) ) ( not ( = ?auto_575131 ?auto_575134 ) ) ( not ( = ?auto_575131 ?auto_575135 ) ) ( not ( = ?auto_575131 ?auto_575136 ) ) ( not ( = ?auto_575132 ?auto_575133 ) ) ( not ( = ?auto_575132 ?auto_575134 ) ) ( not ( = ?auto_575132 ?auto_575135 ) ) ( not ( = ?auto_575132 ?auto_575136 ) ) ( not ( = ?auto_575133 ?auto_575134 ) ) ( not ( = ?auto_575133 ?auto_575135 ) ) ( not ( = ?auto_575133 ?auto_575136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575134 ?auto_575135 ?auto_575136 )
      ( MAKE-10CRATE-VERIFY ?auto_575126 ?auto_575127 ?auto_575128 ?auto_575129 ?auto_575130 ?auto_575131 ?auto_575132 ?auto_575133 ?auto_575134 ?auto_575135 ?auto_575136 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575251 - SURFACE
      ?auto_575252 - SURFACE
      ?auto_575253 - SURFACE
      ?auto_575254 - SURFACE
      ?auto_575255 - SURFACE
      ?auto_575256 - SURFACE
      ?auto_575257 - SURFACE
      ?auto_575258 - SURFACE
      ?auto_575259 - SURFACE
      ?auto_575260 - SURFACE
      ?auto_575261 - SURFACE
    )
    :vars
    (
      ?auto_575264 - HOIST
      ?auto_575262 - PLACE
      ?auto_575266 - TRUCK
      ?auto_575267 - PLACE
      ?auto_575265 - HOIST
      ?auto_575263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575264 ?auto_575262 ) ( SURFACE-AT ?auto_575260 ?auto_575262 ) ( CLEAR ?auto_575260 ) ( IS-CRATE ?auto_575261 ) ( not ( = ?auto_575260 ?auto_575261 ) ) ( AVAILABLE ?auto_575264 ) ( ON ?auto_575260 ?auto_575259 ) ( not ( = ?auto_575259 ?auto_575260 ) ) ( not ( = ?auto_575259 ?auto_575261 ) ) ( TRUCK-AT ?auto_575266 ?auto_575267 ) ( not ( = ?auto_575267 ?auto_575262 ) ) ( HOIST-AT ?auto_575265 ?auto_575267 ) ( not ( = ?auto_575264 ?auto_575265 ) ) ( AVAILABLE ?auto_575265 ) ( SURFACE-AT ?auto_575261 ?auto_575267 ) ( ON ?auto_575261 ?auto_575263 ) ( CLEAR ?auto_575261 ) ( not ( = ?auto_575260 ?auto_575263 ) ) ( not ( = ?auto_575261 ?auto_575263 ) ) ( not ( = ?auto_575259 ?auto_575263 ) ) ( ON ?auto_575252 ?auto_575251 ) ( ON ?auto_575253 ?auto_575252 ) ( ON ?auto_575254 ?auto_575253 ) ( ON ?auto_575255 ?auto_575254 ) ( ON ?auto_575256 ?auto_575255 ) ( ON ?auto_575257 ?auto_575256 ) ( ON ?auto_575258 ?auto_575257 ) ( ON ?auto_575259 ?auto_575258 ) ( not ( = ?auto_575251 ?auto_575252 ) ) ( not ( = ?auto_575251 ?auto_575253 ) ) ( not ( = ?auto_575251 ?auto_575254 ) ) ( not ( = ?auto_575251 ?auto_575255 ) ) ( not ( = ?auto_575251 ?auto_575256 ) ) ( not ( = ?auto_575251 ?auto_575257 ) ) ( not ( = ?auto_575251 ?auto_575258 ) ) ( not ( = ?auto_575251 ?auto_575259 ) ) ( not ( = ?auto_575251 ?auto_575260 ) ) ( not ( = ?auto_575251 ?auto_575261 ) ) ( not ( = ?auto_575251 ?auto_575263 ) ) ( not ( = ?auto_575252 ?auto_575253 ) ) ( not ( = ?auto_575252 ?auto_575254 ) ) ( not ( = ?auto_575252 ?auto_575255 ) ) ( not ( = ?auto_575252 ?auto_575256 ) ) ( not ( = ?auto_575252 ?auto_575257 ) ) ( not ( = ?auto_575252 ?auto_575258 ) ) ( not ( = ?auto_575252 ?auto_575259 ) ) ( not ( = ?auto_575252 ?auto_575260 ) ) ( not ( = ?auto_575252 ?auto_575261 ) ) ( not ( = ?auto_575252 ?auto_575263 ) ) ( not ( = ?auto_575253 ?auto_575254 ) ) ( not ( = ?auto_575253 ?auto_575255 ) ) ( not ( = ?auto_575253 ?auto_575256 ) ) ( not ( = ?auto_575253 ?auto_575257 ) ) ( not ( = ?auto_575253 ?auto_575258 ) ) ( not ( = ?auto_575253 ?auto_575259 ) ) ( not ( = ?auto_575253 ?auto_575260 ) ) ( not ( = ?auto_575253 ?auto_575261 ) ) ( not ( = ?auto_575253 ?auto_575263 ) ) ( not ( = ?auto_575254 ?auto_575255 ) ) ( not ( = ?auto_575254 ?auto_575256 ) ) ( not ( = ?auto_575254 ?auto_575257 ) ) ( not ( = ?auto_575254 ?auto_575258 ) ) ( not ( = ?auto_575254 ?auto_575259 ) ) ( not ( = ?auto_575254 ?auto_575260 ) ) ( not ( = ?auto_575254 ?auto_575261 ) ) ( not ( = ?auto_575254 ?auto_575263 ) ) ( not ( = ?auto_575255 ?auto_575256 ) ) ( not ( = ?auto_575255 ?auto_575257 ) ) ( not ( = ?auto_575255 ?auto_575258 ) ) ( not ( = ?auto_575255 ?auto_575259 ) ) ( not ( = ?auto_575255 ?auto_575260 ) ) ( not ( = ?auto_575255 ?auto_575261 ) ) ( not ( = ?auto_575255 ?auto_575263 ) ) ( not ( = ?auto_575256 ?auto_575257 ) ) ( not ( = ?auto_575256 ?auto_575258 ) ) ( not ( = ?auto_575256 ?auto_575259 ) ) ( not ( = ?auto_575256 ?auto_575260 ) ) ( not ( = ?auto_575256 ?auto_575261 ) ) ( not ( = ?auto_575256 ?auto_575263 ) ) ( not ( = ?auto_575257 ?auto_575258 ) ) ( not ( = ?auto_575257 ?auto_575259 ) ) ( not ( = ?auto_575257 ?auto_575260 ) ) ( not ( = ?auto_575257 ?auto_575261 ) ) ( not ( = ?auto_575257 ?auto_575263 ) ) ( not ( = ?auto_575258 ?auto_575259 ) ) ( not ( = ?auto_575258 ?auto_575260 ) ) ( not ( = ?auto_575258 ?auto_575261 ) ) ( not ( = ?auto_575258 ?auto_575263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575259 ?auto_575260 ?auto_575261 )
      ( MAKE-10CRATE-VERIFY ?auto_575251 ?auto_575252 ?auto_575253 ?auto_575254 ?auto_575255 ?auto_575256 ?auto_575257 ?auto_575258 ?auto_575259 ?auto_575260 ?auto_575261 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575377 - SURFACE
      ?auto_575378 - SURFACE
      ?auto_575379 - SURFACE
      ?auto_575380 - SURFACE
      ?auto_575381 - SURFACE
      ?auto_575382 - SURFACE
      ?auto_575383 - SURFACE
      ?auto_575384 - SURFACE
      ?auto_575385 - SURFACE
      ?auto_575386 - SURFACE
      ?auto_575387 - SURFACE
    )
    :vars
    (
      ?auto_575391 - HOIST
      ?auto_575390 - PLACE
      ?auto_575389 - PLACE
      ?auto_575388 - HOIST
      ?auto_575392 - SURFACE
      ?auto_575393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575391 ?auto_575390 ) ( SURFACE-AT ?auto_575386 ?auto_575390 ) ( CLEAR ?auto_575386 ) ( IS-CRATE ?auto_575387 ) ( not ( = ?auto_575386 ?auto_575387 ) ) ( AVAILABLE ?auto_575391 ) ( ON ?auto_575386 ?auto_575385 ) ( not ( = ?auto_575385 ?auto_575386 ) ) ( not ( = ?auto_575385 ?auto_575387 ) ) ( not ( = ?auto_575389 ?auto_575390 ) ) ( HOIST-AT ?auto_575388 ?auto_575389 ) ( not ( = ?auto_575391 ?auto_575388 ) ) ( AVAILABLE ?auto_575388 ) ( SURFACE-AT ?auto_575387 ?auto_575389 ) ( ON ?auto_575387 ?auto_575392 ) ( CLEAR ?auto_575387 ) ( not ( = ?auto_575386 ?auto_575392 ) ) ( not ( = ?auto_575387 ?auto_575392 ) ) ( not ( = ?auto_575385 ?auto_575392 ) ) ( TRUCK-AT ?auto_575393 ?auto_575390 ) ( ON ?auto_575378 ?auto_575377 ) ( ON ?auto_575379 ?auto_575378 ) ( ON ?auto_575380 ?auto_575379 ) ( ON ?auto_575381 ?auto_575380 ) ( ON ?auto_575382 ?auto_575381 ) ( ON ?auto_575383 ?auto_575382 ) ( ON ?auto_575384 ?auto_575383 ) ( ON ?auto_575385 ?auto_575384 ) ( not ( = ?auto_575377 ?auto_575378 ) ) ( not ( = ?auto_575377 ?auto_575379 ) ) ( not ( = ?auto_575377 ?auto_575380 ) ) ( not ( = ?auto_575377 ?auto_575381 ) ) ( not ( = ?auto_575377 ?auto_575382 ) ) ( not ( = ?auto_575377 ?auto_575383 ) ) ( not ( = ?auto_575377 ?auto_575384 ) ) ( not ( = ?auto_575377 ?auto_575385 ) ) ( not ( = ?auto_575377 ?auto_575386 ) ) ( not ( = ?auto_575377 ?auto_575387 ) ) ( not ( = ?auto_575377 ?auto_575392 ) ) ( not ( = ?auto_575378 ?auto_575379 ) ) ( not ( = ?auto_575378 ?auto_575380 ) ) ( not ( = ?auto_575378 ?auto_575381 ) ) ( not ( = ?auto_575378 ?auto_575382 ) ) ( not ( = ?auto_575378 ?auto_575383 ) ) ( not ( = ?auto_575378 ?auto_575384 ) ) ( not ( = ?auto_575378 ?auto_575385 ) ) ( not ( = ?auto_575378 ?auto_575386 ) ) ( not ( = ?auto_575378 ?auto_575387 ) ) ( not ( = ?auto_575378 ?auto_575392 ) ) ( not ( = ?auto_575379 ?auto_575380 ) ) ( not ( = ?auto_575379 ?auto_575381 ) ) ( not ( = ?auto_575379 ?auto_575382 ) ) ( not ( = ?auto_575379 ?auto_575383 ) ) ( not ( = ?auto_575379 ?auto_575384 ) ) ( not ( = ?auto_575379 ?auto_575385 ) ) ( not ( = ?auto_575379 ?auto_575386 ) ) ( not ( = ?auto_575379 ?auto_575387 ) ) ( not ( = ?auto_575379 ?auto_575392 ) ) ( not ( = ?auto_575380 ?auto_575381 ) ) ( not ( = ?auto_575380 ?auto_575382 ) ) ( not ( = ?auto_575380 ?auto_575383 ) ) ( not ( = ?auto_575380 ?auto_575384 ) ) ( not ( = ?auto_575380 ?auto_575385 ) ) ( not ( = ?auto_575380 ?auto_575386 ) ) ( not ( = ?auto_575380 ?auto_575387 ) ) ( not ( = ?auto_575380 ?auto_575392 ) ) ( not ( = ?auto_575381 ?auto_575382 ) ) ( not ( = ?auto_575381 ?auto_575383 ) ) ( not ( = ?auto_575381 ?auto_575384 ) ) ( not ( = ?auto_575381 ?auto_575385 ) ) ( not ( = ?auto_575381 ?auto_575386 ) ) ( not ( = ?auto_575381 ?auto_575387 ) ) ( not ( = ?auto_575381 ?auto_575392 ) ) ( not ( = ?auto_575382 ?auto_575383 ) ) ( not ( = ?auto_575382 ?auto_575384 ) ) ( not ( = ?auto_575382 ?auto_575385 ) ) ( not ( = ?auto_575382 ?auto_575386 ) ) ( not ( = ?auto_575382 ?auto_575387 ) ) ( not ( = ?auto_575382 ?auto_575392 ) ) ( not ( = ?auto_575383 ?auto_575384 ) ) ( not ( = ?auto_575383 ?auto_575385 ) ) ( not ( = ?auto_575383 ?auto_575386 ) ) ( not ( = ?auto_575383 ?auto_575387 ) ) ( not ( = ?auto_575383 ?auto_575392 ) ) ( not ( = ?auto_575384 ?auto_575385 ) ) ( not ( = ?auto_575384 ?auto_575386 ) ) ( not ( = ?auto_575384 ?auto_575387 ) ) ( not ( = ?auto_575384 ?auto_575392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575385 ?auto_575386 ?auto_575387 )
      ( MAKE-10CRATE-VERIFY ?auto_575377 ?auto_575378 ?auto_575379 ?auto_575380 ?auto_575381 ?auto_575382 ?auto_575383 ?auto_575384 ?auto_575385 ?auto_575386 ?auto_575387 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575503 - SURFACE
      ?auto_575504 - SURFACE
      ?auto_575505 - SURFACE
      ?auto_575506 - SURFACE
      ?auto_575507 - SURFACE
      ?auto_575508 - SURFACE
      ?auto_575509 - SURFACE
      ?auto_575510 - SURFACE
      ?auto_575511 - SURFACE
      ?auto_575512 - SURFACE
      ?auto_575513 - SURFACE
    )
    :vars
    (
      ?auto_575516 - HOIST
      ?auto_575514 - PLACE
      ?auto_575518 - PLACE
      ?auto_575517 - HOIST
      ?auto_575515 - SURFACE
      ?auto_575519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575516 ?auto_575514 ) ( IS-CRATE ?auto_575513 ) ( not ( = ?auto_575512 ?auto_575513 ) ) ( not ( = ?auto_575511 ?auto_575512 ) ) ( not ( = ?auto_575511 ?auto_575513 ) ) ( not ( = ?auto_575518 ?auto_575514 ) ) ( HOIST-AT ?auto_575517 ?auto_575518 ) ( not ( = ?auto_575516 ?auto_575517 ) ) ( AVAILABLE ?auto_575517 ) ( SURFACE-AT ?auto_575513 ?auto_575518 ) ( ON ?auto_575513 ?auto_575515 ) ( CLEAR ?auto_575513 ) ( not ( = ?auto_575512 ?auto_575515 ) ) ( not ( = ?auto_575513 ?auto_575515 ) ) ( not ( = ?auto_575511 ?auto_575515 ) ) ( TRUCK-AT ?auto_575519 ?auto_575514 ) ( SURFACE-AT ?auto_575511 ?auto_575514 ) ( CLEAR ?auto_575511 ) ( LIFTING ?auto_575516 ?auto_575512 ) ( IS-CRATE ?auto_575512 ) ( ON ?auto_575504 ?auto_575503 ) ( ON ?auto_575505 ?auto_575504 ) ( ON ?auto_575506 ?auto_575505 ) ( ON ?auto_575507 ?auto_575506 ) ( ON ?auto_575508 ?auto_575507 ) ( ON ?auto_575509 ?auto_575508 ) ( ON ?auto_575510 ?auto_575509 ) ( ON ?auto_575511 ?auto_575510 ) ( not ( = ?auto_575503 ?auto_575504 ) ) ( not ( = ?auto_575503 ?auto_575505 ) ) ( not ( = ?auto_575503 ?auto_575506 ) ) ( not ( = ?auto_575503 ?auto_575507 ) ) ( not ( = ?auto_575503 ?auto_575508 ) ) ( not ( = ?auto_575503 ?auto_575509 ) ) ( not ( = ?auto_575503 ?auto_575510 ) ) ( not ( = ?auto_575503 ?auto_575511 ) ) ( not ( = ?auto_575503 ?auto_575512 ) ) ( not ( = ?auto_575503 ?auto_575513 ) ) ( not ( = ?auto_575503 ?auto_575515 ) ) ( not ( = ?auto_575504 ?auto_575505 ) ) ( not ( = ?auto_575504 ?auto_575506 ) ) ( not ( = ?auto_575504 ?auto_575507 ) ) ( not ( = ?auto_575504 ?auto_575508 ) ) ( not ( = ?auto_575504 ?auto_575509 ) ) ( not ( = ?auto_575504 ?auto_575510 ) ) ( not ( = ?auto_575504 ?auto_575511 ) ) ( not ( = ?auto_575504 ?auto_575512 ) ) ( not ( = ?auto_575504 ?auto_575513 ) ) ( not ( = ?auto_575504 ?auto_575515 ) ) ( not ( = ?auto_575505 ?auto_575506 ) ) ( not ( = ?auto_575505 ?auto_575507 ) ) ( not ( = ?auto_575505 ?auto_575508 ) ) ( not ( = ?auto_575505 ?auto_575509 ) ) ( not ( = ?auto_575505 ?auto_575510 ) ) ( not ( = ?auto_575505 ?auto_575511 ) ) ( not ( = ?auto_575505 ?auto_575512 ) ) ( not ( = ?auto_575505 ?auto_575513 ) ) ( not ( = ?auto_575505 ?auto_575515 ) ) ( not ( = ?auto_575506 ?auto_575507 ) ) ( not ( = ?auto_575506 ?auto_575508 ) ) ( not ( = ?auto_575506 ?auto_575509 ) ) ( not ( = ?auto_575506 ?auto_575510 ) ) ( not ( = ?auto_575506 ?auto_575511 ) ) ( not ( = ?auto_575506 ?auto_575512 ) ) ( not ( = ?auto_575506 ?auto_575513 ) ) ( not ( = ?auto_575506 ?auto_575515 ) ) ( not ( = ?auto_575507 ?auto_575508 ) ) ( not ( = ?auto_575507 ?auto_575509 ) ) ( not ( = ?auto_575507 ?auto_575510 ) ) ( not ( = ?auto_575507 ?auto_575511 ) ) ( not ( = ?auto_575507 ?auto_575512 ) ) ( not ( = ?auto_575507 ?auto_575513 ) ) ( not ( = ?auto_575507 ?auto_575515 ) ) ( not ( = ?auto_575508 ?auto_575509 ) ) ( not ( = ?auto_575508 ?auto_575510 ) ) ( not ( = ?auto_575508 ?auto_575511 ) ) ( not ( = ?auto_575508 ?auto_575512 ) ) ( not ( = ?auto_575508 ?auto_575513 ) ) ( not ( = ?auto_575508 ?auto_575515 ) ) ( not ( = ?auto_575509 ?auto_575510 ) ) ( not ( = ?auto_575509 ?auto_575511 ) ) ( not ( = ?auto_575509 ?auto_575512 ) ) ( not ( = ?auto_575509 ?auto_575513 ) ) ( not ( = ?auto_575509 ?auto_575515 ) ) ( not ( = ?auto_575510 ?auto_575511 ) ) ( not ( = ?auto_575510 ?auto_575512 ) ) ( not ( = ?auto_575510 ?auto_575513 ) ) ( not ( = ?auto_575510 ?auto_575515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575511 ?auto_575512 ?auto_575513 )
      ( MAKE-10CRATE-VERIFY ?auto_575503 ?auto_575504 ?auto_575505 ?auto_575506 ?auto_575507 ?auto_575508 ?auto_575509 ?auto_575510 ?auto_575511 ?auto_575512 ?auto_575513 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575629 - SURFACE
      ?auto_575630 - SURFACE
      ?auto_575631 - SURFACE
      ?auto_575632 - SURFACE
      ?auto_575633 - SURFACE
      ?auto_575634 - SURFACE
      ?auto_575635 - SURFACE
      ?auto_575636 - SURFACE
      ?auto_575637 - SURFACE
      ?auto_575638 - SURFACE
      ?auto_575639 - SURFACE
    )
    :vars
    (
      ?auto_575643 - HOIST
      ?auto_575644 - PLACE
      ?auto_575645 - PLACE
      ?auto_575641 - HOIST
      ?auto_575642 - SURFACE
      ?auto_575640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575643 ?auto_575644 ) ( IS-CRATE ?auto_575639 ) ( not ( = ?auto_575638 ?auto_575639 ) ) ( not ( = ?auto_575637 ?auto_575638 ) ) ( not ( = ?auto_575637 ?auto_575639 ) ) ( not ( = ?auto_575645 ?auto_575644 ) ) ( HOIST-AT ?auto_575641 ?auto_575645 ) ( not ( = ?auto_575643 ?auto_575641 ) ) ( AVAILABLE ?auto_575641 ) ( SURFACE-AT ?auto_575639 ?auto_575645 ) ( ON ?auto_575639 ?auto_575642 ) ( CLEAR ?auto_575639 ) ( not ( = ?auto_575638 ?auto_575642 ) ) ( not ( = ?auto_575639 ?auto_575642 ) ) ( not ( = ?auto_575637 ?auto_575642 ) ) ( TRUCK-AT ?auto_575640 ?auto_575644 ) ( SURFACE-AT ?auto_575637 ?auto_575644 ) ( CLEAR ?auto_575637 ) ( IS-CRATE ?auto_575638 ) ( AVAILABLE ?auto_575643 ) ( IN ?auto_575638 ?auto_575640 ) ( ON ?auto_575630 ?auto_575629 ) ( ON ?auto_575631 ?auto_575630 ) ( ON ?auto_575632 ?auto_575631 ) ( ON ?auto_575633 ?auto_575632 ) ( ON ?auto_575634 ?auto_575633 ) ( ON ?auto_575635 ?auto_575634 ) ( ON ?auto_575636 ?auto_575635 ) ( ON ?auto_575637 ?auto_575636 ) ( not ( = ?auto_575629 ?auto_575630 ) ) ( not ( = ?auto_575629 ?auto_575631 ) ) ( not ( = ?auto_575629 ?auto_575632 ) ) ( not ( = ?auto_575629 ?auto_575633 ) ) ( not ( = ?auto_575629 ?auto_575634 ) ) ( not ( = ?auto_575629 ?auto_575635 ) ) ( not ( = ?auto_575629 ?auto_575636 ) ) ( not ( = ?auto_575629 ?auto_575637 ) ) ( not ( = ?auto_575629 ?auto_575638 ) ) ( not ( = ?auto_575629 ?auto_575639 ) ) ( not ( = ?auto_575629 ?auto_575642 ) ) ( not ( = ?auto_575630 ?auto_575631 ) ) ( not ( = ?auto_575630 ?auto_575632 ) ) ( not ( = ?auto_575630 ?auto_575633 ) ) ( not ( = ?auto_575630 ?auto_575634 ) ) ( not ( = ?auto_575630 ?auto_575635 ) ) ( not ( = ?auto_575630 ?auto_575636 ) ) ( not ( = ?auto_575630 ?auto_575637 ) ) ( not ( = ?auto_575630 ?auto_575638 ) ) ( not ( = ?auto_575630 ?auto_575639 ) ) ( not ( = ?auto_575630 ?auto_575642 ) ) ( not ( = ?auto_575631 ?auto_575632 ) ) ( not ( = ?auto_575631 ?auto_575633 ) ) ( not ( = ?auto_575631 ?auto_575634 ) ) ( not ( = ?auto_575631 ?auto_575635 ) ) ( not ( = ?auto_575631 ?auto_575636 ) ) ( not ( = ?auto_575631 ?auto_575637 ) ) ( not ( = ?auto_575631 ?auto_575638 ) ) ( not ( = ?auto_575631 ?auto_575639 ) ) ( not ( = ?auto_575631 ?auto_575642 ) ) ( not ( = ?auto_575632 ?auto_575633 ) ) ( not ( = ?auto_575632 ?auto_575634 ) ) ( not ( = ?auto_575632 ?auto_575635 ) ) ( not ( = ?auto_575632 ?auto_575636 ) ) ( not ( = ?auto_575632 ?auto_575637 ) ) ( not ( = ?auto_575632 ?auto_575638 ) ) ( not ( = ?auto_575632 ?auto_575639 ) ) ( not ( = ?auto_575632 ?auto_575642 ) ) ( not ( = ?auto_575633 ?auto_575634 ) ) ( not ( = ?auto_575633 ?auto_575635 ) ) ( not ( = ?auto_575633 ?auto_575636 ) ) ( not ( = ?auto_575633 ?auto_575637 ) ) ( not ( = ?auto_575633 ?auto_575638 ) ) ( not ( = ?auto_575633 ?auto_575639 ) ) ( not ( = ?auto_575633 ?auto_575642 ) ) ( not ( = ?auto_575634 ?auto_575635 ) ) ( not ( = ?auto_575634 ?auto_575636 ) ) ( not ( = ?auto_575634 ?auto_575637 ) ) ( not ( = ?auto_575634 ?auto_575638 ) ) ( not ( = ?auto_575634 ?auto_575639 ) ) ( not ( = ?auto_575634 ?auto_575642 ) ) ( not ( = ?auto_575635 ?auto_575636 ) ) ( not ( = ?auto_575635 ?auto_575637 ) ) ( not ( = ?auto_575635 ?auto_575638 ) ) ( not ( = ?auto_575635 ?auto_575639 ) ) ( not ( = ?auto_575635 ?auto_575642 ) ) ( not ( = ?auto_575636 ?auto_575637 ) ) ( not ( = ?auto_575636 ?auto_575638 ) ) ( not ( = ?auto_575636 ?auto_575639 ) ) ( not ( = ?auto_575636 ?auto_575642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575637 ?auto_575638 ?auto_575639 )
      ( MAKE-10CRATE-VERIFY ?auto_575629 ?auto_575630 ?auto_575631 ?auto_575632 ?auto_575633 ?auto_575634 ?auto_575635 ?auto_575636 ?auto_575637 ?auto_575638 ?auto_575639 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582877 - SURFACE
      ?auto_582878 - SURFACE
      ?auto_582879 - SURFACE
      ?auto_582880 - SURFACE
      ?auto_582881 - SURFACE
      ?auto_582882 - SURFACE
      ?auto_582883 - SURFACE
      ?auto_582884 - SURFACE
      ?auto_582885 - SURFACE
      ?auto_582886 - SURFACE
      ?auto_582887 - SURFACE
      ?auto_582888 - SURFACE
    )
    :vars
    (
      ?auto_582889 - HOIST
      ?auto_582890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_582889 ?auto_582890 ) ( SURFACE-AT ?auto_582887 ?auto_582890 ) ( CLEAR ?auto_582887 ) ( LIFTING ?auto_582889 ?auto_582888 ) ( IS-CRATE ?auto_582888 ) ( not ( = ?auto_582887 ?auto_582888 ) ) ( ON ?auto_582878 ?auto_582877 ) ( ON ?auto_582879 ?auto_582878 ) ( ON ?auto_582880 ?auto_582879 ) ( ON ?auto_582881 ?auto_582880 ) ( ON ?auto_582882 ?auto_582881 ) ( ON ?auto_582883 ?auto_582882 ) ( ON ?auto_582884 ?auto_582883 ) ( ON ?auto_582885 ?auto_582884 ) ( ON ?auto_582886 ?auto_582885 ) ( ON ?auto_582887 ?auto_582886 ) ( not ( = ?auto_582877 ?auto_582878 ) ) ( not ( = ?auto_582877 ?auto_582879 ) ) ( not ( = ?auto_582877 ?auto_582880 ) ) ( not ( = ?auto_582877 ?auto_582881 ) ) ( not ( = ?auto_582877 ?auto_582882 ) ) ( not ( = ?auto_582877 ?auto_582883 ) ) ( not ( = ?auto_582877 ?auto_582884 ) ) ( not ( = ?auto_582877 ?auto_582885 ) ) ( not ( = ?auto_582877 ?auto_582886 ) ) ( not ( = ?auto_582877 ?auto_582887 ) ) ( not ( = ?auto_582877 ?auto_582888 ) ) ( not ( = ?auto_582878 ?auto_582879 ) ) ( not ( = ?auto_582878 ?auto_582880 ) ) ( not ( = ?auto_582878 ?auto_582881 ) ) ( not ( = ?auto_582878 ?auto_582882 ) ) ( not ( = ?auto_582878 ?auto_582883 ) ) ( not ( = ?auto_582878 ?auto_582884 ) ) ( not ( = ?auto_582878 ?auto_582885 ) ) ( not ( = ?auto_582878 ?auto_582886 ) ) ( not ( = ?auto_582878 ?auto_582887 ) ) ( not ( = ?auto_582878 ?auto_582888 ) ) ( not ( = ?auto_582879 ?auto_582880 ) ) ( not ( = ?auto_582879 ?auto_582881 ) ) ( not ( = ?auto_582879 ?auto_582882 ) ) ( not ( = ?auto_582879 ?auto_582883 ) ) ( not ( = ?auto_582879 ?auto_582884 ) ) ( not ( = ?auto_582879 ?auto_582885 ) ) ( not ( = ?auto_582879 ?auto_582886 ) ) ( not ( = ?auto_582879 ?auto_582887 ) ) ( not ( = ?auto_582879 ?auto_582888 ) ) ( not ( = ?auto_582880 ?auto_582881 ) ) ( not ( = ?auto_582880 ?auto_582882 ) ) ( not ( = ?auto_582880 ?auto_582883 ) ) ( not ( = ?auto_582880 ?auto_582884 ) ) ( not ( = ?auto_582880 ?auto_582885 ) ) ( not ( = ?auto_582880 ?auto_582886 ) ) ( not ( = ?auto_582880 ?auto_582887 ) ) ( not ( = ?auto_582880 ?auto_582888 ) ) ( not ( = ?auto_582881 ?auto_582882 ) ) ( not ( = ?auto_582881 ?auto_582883 ) ) ( not ( = ?auto_582881 ?auto_582884 ) ) ( not ( = ?auto_582881 ?auto_582885 ) ) ( not ( = ?auto_582881 ?auto_582886 ) ) ( not ( = ?auto_582881 ?auto_582887 ) ) ( not ( = ?auto_582881 ?auto_582888 ) ) ( not ( = ?auto_582882 ?auto_582883 ) ) ( not ( = ?auto_582882 ?auto_582884 ) ) ( not ( = ?auto_582882 ?auto_582885 ) ) ( not ( = ?auto_582882 ?auto_582886 ) ) ( not ( = ?auto_582882 ?auto_582887 ) ) ( not ( = ?auto_582882 ?auto_582888 ) ) ( not ( = ?auto_582883 ?auto_582884 ) ) ( not ( = ?auto_582883 ?auto_582885 ) ) ( not ( = ?auto_582883 ?auto_582886 ) ) ( not ( = ?auto_582883 ?auto_582887 ) ) ( not ( = ?auto_582883 ?auto_582888 ) ) ( not ( = ?auto_582884 ?auto_582885 ) ) ( not ( = ?auto_582884 ?auto_582886 ) ) ( not ( = ?auto_582884 ?auto_582887 ) ) ( not ( = ?auto_582884 ?auto_582888 ) ) ( not ( = ?auto_582885 ?auto_582886 ) ) ( not ( = ?auto_582885 ?auto_582887 ) ) ( not ( = ?auto_582885 ?auto_582888 ) ) ( not ( = ?auto_582886 ?auto_582887 ) ) ( not ( = ?auto_582886 ?auto_582888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_582887 ?auto_582888 )
      ( MAKE-11CRATE-VERIFY ?auto_582877 ?auto_582878 ?auto_582879 ?auto_582880 ?auto_582881 ?auto_582882 ?auto_582883 ?auto_582884 ?auto_582885 ?auto_582886 ?auto_582887 ?auto_582888 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582986 - SURFACE
      ?auto_582987 - SURFACE
      ?auto_582988 - SURFACE
      ?auto_582989 - SURFACE
      ?auto_582990 - SURFACE
      ?auto_582991 - SURFACE
      ?auto_582992 - SURFACE
      ?auto_582993 - SURFACE
      ?auto_582994 - SURFACE
      ?auto_582995 - SURFACE
      ?auto_582996 - SURFACE
      ?auto_582997 - SURFACE
    )
    :vars
    (
      ?auto_583000 - HOIST
      ?auto_582999 - PLACE
      ?auto_582998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583000 ?auto_582999 ) ( SURFACE-AT ?auto_582996 ?auto_582999 ) ( CLEAR ?auto_582996 ) ( IS-CRATE ?auto_582997 ) ( not ( = ?auto_582996 ?auto_582997 ) ) ( TRUCK-AT ?auto_582998 ?auto_582999 ) ( AVAILABLE ?auto_583000 ) ( IN ?auto_582997 ?auto_582998 ) ( ON ?auto_582996 ?auto_582995 ) ( not ( = ?auto_582995 ?auto_582996 ) ) ( not ( = ?auto_582995 ?auto_582997 ) ) ( ON ?auto_582987 ?auto_582986 ) ( ON ?auto_582988 ?auto_582987 ) ( ON ?auto_582989 ?auto_582988 ) ( ON ?auto_582990 ?auto_582989 ) ( ON ?auto_582991 ?auto_582990 ) ( ON ?auto_582992 ?auto_582991 ) ( ON ?auto_582993 ?auto_582992 ) ( ON ?auto_582994 ?auto_582993 ) ( ON ?auto_582995 ?auto_582994 ) ( not ( = ?auto_582986 ?auto_582987 ) ) ( not ( = ?auto_582986 ?auto_582988 ) ) ( not ( = ?auto_582986 ?auto_582989 ) ) ( not ( = ?auto_582986 ?auto_582990 ) ) ( not ( = ?auto_582986 ?auto_582991 ) ) ( not ( = ?auto_582986 ?auto_582992 ) ) ( not ( = ?auto_582986 ?auto_582993 ) ) ( not ( = ?auto_582986 ?auto_582994 ) ) ( not ( = ?auto_582986 ?auto_582995 ) ) ( not ( = ?auto_582986 ?auto_582996 ) ) ( not ( = ?auto_582986 ?auto_582997 ) ) ( not ( = ?auto_582987 ?auto_582988 ) ) ( not ( = ?auto_582987 ?auto_582989 ) ) ( not ( = ?auto_582987 ?auto_582990 ) ) ( not ( = ?auto_582987 ?auto_582991 ) ) ( not ( = ?auto_582987 ?auto_582992 ) ) ( not ( = ?auto_582987 ?auto_582993 ) ) ( not ( = ?auto_582987 ?auto_582994 ) ) ( not ( = ?auto_582987 ?auto_582995 ) ) ( not ( = ?auto_582987 ?auto_582996 ) ) ( not ( = ?auto_582987 ?auto_582997 ) ) ( not ( = ?auto_582988 ?auto_582989 ) ) ( not ( = ?auto_582988 ?auto_582990 ) ) ( not ( = ?auto_582988 ?auto_582991 ) ) ( not ( = ?auto_582988 ?auto_582992 ) ) ( not ( = ?auto_582988 ?auto_582993 ) ) ( not ( = ?auto_582988 ?auto_582994 ) ) ( not ( = ?auto_582988 ?auto_582995 ) ) ( not ( = ?auto_582988 ?auto_582996 ) ) ( not ( = ?auto_582988 ?auto_582997 ) ) ( not ( = ?auto_582989 ?auto_582990 ) ) ( not ( = ?auto_582989 ?auto_582991 ) ) ( not ( = ?auto_582989 ?auto_582992 ) ) ( not ( = ?auto_582989 ?auto_582993 ) ) ( not ( = ?auto_582989 ?auto_582994 ) ) ( not ( = ?auto_582989 ?auto_582995 ) ) ( not ( = ?auto_582989 ?auto_582996 ) ) ( not ( = ?auto_582989 ?auto_582997 ) ) ( not ( = ?auto_582990 ?auto_582991 ) ) ( not ( = ?auto_582990 ?auto_582992 ) ) ( not ( = ?auto_582990 ?auto_582993 ) ) ( not ( = ?auto_582990 ?auto_582994 ) ) ( not ( = ?auto_582990 ?auto_582995 ) ) ( not ( = ?auto_582990 ?auto_582996 ) ) ( not ( = ?auto_582990 ?auto_582997 ) ) ( not ( = ?auto_582991 ?auto_582992 ) ) ( not ( = ?auto_582991 ?auto_582993 ) ) ( not ( = ?auto_582991 ?auto_582994 ) ) ( not ( = ?auto_582991 ?auto_582995 ) ) ( not ( = ?auto_582991 ?auto_582996 ) ) ( not ( = ?auto_582991 ?auto_582997 ) ) ( not ( = ?auto_582992 ?auto_582993 ) ) ( not ( = ?auto_582992 ?auto_582994 ) ) ( not ( = ?auto_582992 ?auto_582995 ) ) ( not ( = ?auto_582992 ?auto_582996 ) ) ( not ( = ?auto_582992 ?auto_582997 ) ) ( not ( = ?auto_582993 ?auto_582994 ) ) ( not ( = ?auto_582993 ?auto_582995 ) ) ( not ( = ?auto_582993 ?auto_582996 ) ) ( not ( = ?auto_582993 ?auto_582997 ) ) ( not ( = ?auto_582994 ?auto_582995 ) ) ( not ( = ?auto_582994 ?auto_582996 ) ) ( not ( = ?auto_582994 ?auto_582997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_582995 ?auto_582996 ?auto_582997 )
      ( MAKE-11CRATE-VERIFY ?auto_582986 ?auto_582987 ?auto_582988 ?auto_582989 ?auto_582990 ?auto_582991 ?auto_582992 ?auto_582993 ?auto_582994 ?auto_582995 ?auto_582996 ?auto_582997 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583107 - SURFACE
      ?auto_583108 - SURFACE
      ?auto_583109 - SURFACE
      ?auto_583110 - SURFACE
      ?auto_583111 - SURFACE
      ?auto_583112 - SURFACE
      ?auto_583113 - SURFACE
      ?auto_583114 - SURFACE
      ?auto_583115 - SURFACE
      ?auto_583116 - SURFACE
      ?auto_583117 - SURFACE
      ?auto_583118 - SURFACE
    )
    :vars
    (
      ?auto_583121 - HOIST
      ?auto_583122 - PLACE
      ?auto_583119 - TRUCK
      ?auto_583120 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_583121 ?auto_583122 ) ( SURFACE-AT ?auto_583117 ?auto_583122 ) ( CLEAR ?auto_583117 ) ( IS-CRATE ?auto_583118 ) ( not ( = ?auto_583117 ?auto_583118 ) ) ( AVAILABLE ?auto_583121 ) ( IN ?auto_583118 ?auto_583119 ) ( ON ?auto_583117 ?auto_583116 ) ( not ( = ?auto_583116 ?auto_583117 ) ) ( not ( = ?auto_583116 ?auto_583118 ) ) ( TRUCK-AT ?auto_583119 ?auto_583120 ) ( not ( = ?auto_583120 ?auto_583122 ) ) ( ON ?auto_583108 ?auto_583107 ) ( ON ?auto_583109 ?auto_583108 ) ( ON ?auto_583110 ?auto_583109 ) ( ON ?auto_583111 ?auto_583110 ) ( ON ?auto_583112 ?auto_583111 ) ( ON ?auto_583113 ?auto_583112 ) ( ON ?auto_583114 ?auto_583113 ) ( ON ?auto_583115 ?auto_583114 ) ( ON ?auto_583116 ?auto_583115 ) ( not ( = ?auto_583107 ?auto_583108 ) ) ( not ( = ?auto_583107 ?auto_583109 ) ) ( not ( = ?auto_583107 ?auto_583110 ) ) ( not ( = ?auto_583107 ?auto_583111 ) ) ( not ( = ?auto_583107 ?auto_583112 ) ) ( not ( = ?auto_583107 ?auto_583113 ) ) ( not ( = ?auto_583107 ?auto_583114 ) ) ( not ( = ?auto_583107 ?auto_583115 ) ) ( not ( = ?auto_583107 ?auto_583116 ) ) ( not ( = ?auto_583107 ?auto_583117 ) ) ( not ( = ?auto_583107 ?auto_583118 ) ) ( not ( = ?auto_583108 ?auto_583109 ) ) ( not ( = ?auto_583108 ?auto_583110 ) ) ( not ( = ?auto_583108 ?auto_583111 ) ) ( not ( = ?auto_583108 ?auto_583112 ) ) ( not ( = ?auto_583108 ?auto_583113 ) ) ( not ( = ?auto_583108 ?auto_583114 ) ) ( not ( = ?auto_583108 ?auto_583115 ) ) ( not ( = ?auto_583108 ?auto_583116 ) ) ( not ( = ?auto_583108 ?auto_583117 ) ) ( not ( = ?auto_583108 ?auto_583118 ) ) ( not ( = ?auto_583109 ?auto_583110 ) ) ( not ( = ?auto_583109 ?auto_583111 ) ) ( not ( = ?auto_583109 ?auto_583112 ) ) ( not ( = ?auto_583109 ?auto_583113 ) ) ( not ( = ?auto_583109 ?auto_583114 ) ) ( not ( = ?auto_583109 ?auto_583115 ) ) ( not ( = ?auto_583109 ?auto_583116 ) ) ( not ( = ?auto_583109 ?auto_583117 ) ) ( not ( = ?auto_583109 ?auto_583118 ) ) ( not ( = ?auto_583110 ?auto_583111 ) ) ( not ( = ?auto_583110 ?auto_583112 ) ) ( not ( = ?auto_583110 ?auto_583113 ) ) ( not ( = ?auto_583110 ?auto_583114 ) ) ( not ( = ?auto_583110 ?auto_583115 ) ) ( not ( = ?auto_583110 ?auto_583116 ) ) ( not ( = ?auto_583110 ?auto_583117 ) ) ( not ( = ?auto_583110 ?auto_583118 ) ) ( not ( = ?auto_583111 ?auto_583112 ) ) ( not ( = ?auto_583111 ?auto_583113 ) ) ( not ( = ?auto_583111 ?auto_583114 ) ) ( not ( = ?auto_583111 ?auto_583115 ) ) ( not ( = ?auto_583111 ?auto_583116 ) ) ( not ( = ?auto_583111 ?auto_583117 ) ) ( not ( = ?auto_583111 ?auto_583118 ) ) ( not ( = ?auto_583112 ?auto_583113 ) ) ( not ( = ?auto_583112 ?auto_583114 ) ) ( not ( = ?auto_583112 ?auto_583115 ) ) ( not ( = ?auto_583112 ?auto_583116 ) ) ( not ( = ?auto_583112 ?auto_583117 ) ) ( not ( = ?auto_583112 ?auto_583118 ) ) ( not ( = ?auto_583113 ?auto_583114 ) ) ( not ( = ?auto_583113 ?auto_583115 ) ) ( not ( = ?auto_583113 ?auto_583116 ) ) ( not ( = ?auto_583113 ?auto_583117 ) ) ( not ( = ?auto_583113 ?auto_583118 ) ) ( not ( = ?auto_583114 ?auto_583115 ) ) ( not ( = ?auto_583114 ?auto_583116 ) ) ( not ( = ?auto_583114 ?auto_583117 ) ) ( not ( = ?auto_583114 ?auto_583118 ) ) ( not ( = ?auto_583115 ?auto_583116 ) ) ( not ( = ?auto_583115 ?auto_583117 ) ) ( not ( = ?auto_583115 ?auto_583118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583116 ?auto_583117 ?auto_583118 )
      ( MAKE-11CRATE-VERIFY ?auto_583107 ?auto_583108 ?auto_583109 ?auto_583110 ?auto_583111 ?auto_583112 ?auto_583113 ?auto_583114 ?auto_583115 ?auto_583116 ?auto_583117 ?auto_583118 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583239 - SURFACE
      ?auto_583240 - SURFACE
      ?auto_583241 - SURFACE
      ?auto_583242 - SURFACE
      ?auto_583243 - SURFACE
      ?auto_583244 - SURFACE
      ?auto_583245 - SURFACE
      ?auto_583246 - SURFACE
      ?auto_583247 - SURFACE
      ?auto_583248 - SURFACE
      ?auto_583249 - SURFACE
      ?auto_583250 - SURFACE
    )
    :vars
    (
      ?auto_583254 - HOIST
      ?auto_583253 - PLACE
      ?auto_583251 - TRUCK
      ?auto_583255 - PLACE
      ?auto_583252 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_583254 ?auto_583253 ) ( SURFACE-AT ?auto_583249 ?auto_583253 ) ( CLEAR ?auto_583249 ) ( IS-CRATE ?auto_583250 ) ( not ( = ?auto_583249 ?auto_583250 ) ) ( AVAILABLE ?auto_583254 ) ( ON ?auto_583249 ?auto_583248 ) ( not ( = ?auto_583248 ?auto_583249 ) ) ( not ( = ?auto_583248 ?auto_583250 ) ) ( TRUCK-AT ?auto_583251 ?auto_583255 ) ( not ( = ?auto_583255 ?auto_583253 ) ) ( HOIST-AT ?auto_583252 ?auto_583255 ) ( LIFTING ?auto_583252 ?auto_583250 ) ( not ( = ?auto_583254 ?auto_583252 ) ) ( ON ?auto_583240 ?auto_583239 ) ( ON ?auto_583241 ?auto_583240 ) ( ON ?auto_583242 ?auto_583241 ) ( ON ?auto_583243 ?auto_583242 ) ( ON ?auto_583244 ?auto_583243 ) ( ON ?auto_583245 ?auto_583244 ) ( ON ?auto_583246 ?auto_583245 ) ( ON ?auto_583247 ?auto_583246 ) ( ON ?auto_583248 ?auto_583247 ) ( not ( = ?auto_583239 ?auto_583240 ) ) ( not ( = ?auto_583239 ?auto_583241 ) ) ( not ( = ?auto_583239 ?auto_583242 ) ) ( not ( = ?auto_583239 ?auto_583243 ) ) ( not ( = ?auto_583239 ?auto_583244 ) ) ( not ( = ?auto_583239 ?auto_583245 ) ) ( not ( = ?auto_583239 ?auto_583246 ) ) ( not ( = ?auto_583239 ?auto_583247 ) ) ( not ( = ?auto_583239 ?auto_583248 ) ) ( not ( = ?auto_583239 ?auto_583249 ) ) ( not ( = ?auto_583239 ?auto_583250 ) ) ( not ( = ?auto_583240 ?auto_583241 ) ) ( not ( = ?auto_583240 ?auto_583242 ) ) ( not ( = ?auto_583240 ?auto_583243 ) ) ( not ( = ?auto_583240 ?auto_583244 ) ) ( not ( = ?auto_583240 ?auto_583245 ) ) ( not ( = ?auto_583240 ?auto_583246 ) ) ( not ( = ?auto_583240 ?auto_583247 ) ) ( not ( = ?auto_583240 ?auto_583248 ) ) ( not ( = ?auto_583240 ?auto_583249 ) ) ( not ( = ?auto_583240 ?auto_583250 ) ) ( not ( = ?auto_583241 ?auto_583242 ) ) ( not ( = ?auto_583241 ?auto_583243 ) ) ( not ( = ?auto_583241 ?auto_583244 ) ) ( not ( = ?auto_583241 ?auto_583245 ) ) ( not ( = ?auto_583241 ?auto_583246 ) ) ( not ( = ?auto_583241 ?auto_583247 ) ) ( not ( = ?auto_583241 ?auto_583248 ) ) ( not ( = ?auto_583241 ?auto_583249 ) ) ( not ( = ?auto_583241 ?auto_583250 ) ) ( not ( = ?auto_583242 ?auto_583243 ) ) ( not ( = ?auto_583242 ?auto_583244 ) ) ( not ( = ?auto_583242 ?auto_583245 ) ) ( not ( = ?auto_583242 ?auto_583246 ) ) ( not ( = ?auto_583242 ?auto_583247 ) ) ( not ( = ?auto_583242 ?auto_583248 ) ) ( not ( = ?auto_583242 ?auto_583249 ) ) ( not ( = ?auto_583242 ?auto_583250 ) ) ( not ( = ?auto_583243 ?auto_583244 ) ) ( not ( = ?auto_583243 ?auto_583245 ) ) ( not ( = ?auto_583243 ?auto_583246 ) ) ( not ( = ?auto_583243 ?auto_583247 ) ) ( not ( = ?auto_583243 ?auto_583248 ) ) ( not ( = ?auto_583243 ?auto_583249 ) ) ( not ( = ?auto_583243 ?auto_583250 ) ) ( not ( = ?auto_583244 ?auto_583245 ) ) ( not ( = ?auto_583244 ?auto_583246 ) ) ( not ( = ?auto_583244 ?auto_583247 ) ) ( not ( = ?auto_583244 ?auto_583248 ) ) ( not ( = ?auto_583244 ?auto_583249 ) ) ( not ( = ?auto_583244 ?auto_583250 ) ) ( not ( = ?auto_583245 ?auto_583246 ) ) ( not ( = ?auto_583245 ?auto_583247 ) ) ( not ( = ?auto_583245 ?auto_583248 ) ) ( not ( = ?auto_583245 ?auto_583249 ) ) ( not ( = ?auto_583245 ?auto_583250 ) ) ( not ( = ?auto_583246 ?auto_583247 ) ) ( not ( = ?auto_583246 ?auto_583248 ) ) ( not ( = ?auto_583246 ?auto_583249 ) ) ( not ( = ?auto_583246 ?auto_583250 ) ) ( not ( = ?auto_583247 ?auto_583248 ) ) ( not ( = ?auto_583247 ?auto_583249 ) ) ( not ( = ?auto_583247 ?auto_583250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583248 ?auto_583249 ?auto_583250 )
      ( MAKE-11CRATE-VERIFY ?auto_583239 ?auto_583240 ?auto_583241 ?auto_583242 ?auto_583243 ?auto_583244 ?auto_583245 ?auto_583246 ?auto_583247 ?auto_583248 ?auto_583249 ?auto_583250 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583382 - SURFACE
      ?auto_583383 - SURFACE
      ?auto_583384 - SURFACE
      ?auto_583385 - SURFACE
      ?auto_583386 - SURFACE
      ?auto_583387 - SURFACE
      ?auto_583388 - SURFACE
      ?auto_583389 - SURFACE
      ?auto_583390 - SURFACE
      ?auto_583391 - SURFACE
      ?auto_583392 - SURFACE
      ?auto_583393 - SURFACE
    )
    :vars
    (
      ?auto_583394 - HOIST
      ?auto_583396 - PLACE
      ?auto_583399 - TRUCK
      ?auto_583397 - PLACE
      ?auto_583398 - HOIST
      ?auto_583395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_583394 ?auto_583396 ) ( SURFACE-AT ?auto_583392 ?auto_583396 ) ( CLEAR ?auto_583392 ) ( IS-CRATE ?auto_583393 ) ( not ( = ?auto_583392 ?auto_583393 ) ) ( AVAILABLE ?auto_583394 ) ( ON ?auto_583392 ?auto_583391 ) ( not ( = ?auto_583391 ?auto_583392 ) ) ( not ( = ?auto_583391 ?auto_583393 ) ) ( TRUCK-AT ?auto_583399 ?auto_583397 ) ( not ( = ?auto_583397 ?auto_583396 ) ) ( HOIST-AT ?auto_583398 ?auto_583397 ) ( not ( = ?auto_583394 ?auto_583398 ) ) ( AVAILABLE ?auto_583398 ) ( SURFACE-AT ?auto_583393 ?auto_583397 ) ( ON ?auto_583393 ?auto_583395 ) ( CLEAR ?auto_583393 ) ( not ( = ?auto_583392 ?auto_583395 ) ) ( not ( = ?auto_583393 ?auto_583395 ) ) ( not ( = ?auto_583391 ?auto_583395 ) ) ( ON ?auto_583383 ?auto_583382 ) ( ON ?auto_583384 ?auto_583383 ) ( ON ?auto_583385 ?auto_583384 ) ( ON ?auto_583386 ?auto_583385 ) ( ON ?auto_583387 ?auto_583386 ) ( ON ?auto_583388 ?auto_583387 ) ( ON ?auto_583389 ?auto_583388 ) ( ON ?auto_583390 ?auto_583389 ) ( ON ?auto_583391 ?auto_583390 ) ( not ( = ?auto_583382 ?auto_583383 ) ) ( not ( = ?auto_583382 ?auto_583384 ) ) ( not ( = ?auto_583382 ?auto_583385 ) ) ( not ( = ?auto_583382 ?auto_583386 ) ) ( not ( = ?auto_583382 ?auto_583387 ) ) ( not ( = ?auto_583382 ?auto_583388 ) ) ( not ( = ?auto_583382 ?auto_583389 ) ) ( not ( = ?auto_583382 ?auto_583390 ) ) ( not ( = ?auto_583382 ?auto_583391 ) ) ( not ( = ?auto_583382 ?auto_583392 ) ) ( not ( = ?auto_583382 ?auto_583393 ) ) ( not ( = ?auto_583382 ?auto_583395 ) ) ( not ( = ?auto_583383 ?auto_583384 ) ) ( not ( = ?auto_583383 ?auto_583385 ) ) ( not ( = ?auto_583383 ?auto_583386 ) ) ( not ( = ?auto_583383 ?auto_583387 ) ) ( not ( = ?auto_583383 ?auto_583388 ) ) ( not ( = ?auto_583383 ?auto_583389 ) ) ( not ( = ?auto_583383 ?auto_583390 ) ) ( not ( = ?auto_583383 ?auto_583391 ) ) ( not ( = ?auto_583383 ?auto_583392 ) ) ( not ( = ?auto_583383 ?auto_583393 ) ) ( not ( = ?auto_583383 ?auto_583395 ) ) ( not ( = ?auto_583384 ?auto_583385 ) ) ( not ( = ?auto_583384 ?auto_583386 ) ) ( not ( = ?auto_583384 ?auto_583387 ) ) ( not ( = ?auto_583384 ?auto_583388 ) ) ( not ( = ?auto_583384 ?auto_583389 ) ) ( not ( = ?auto_583384 ?auto_583390 ) ) ( not ( = ?auto_583384 ?auto_583391 ) ) ( not ( = ?auto_583384 ?auto_583392 ) ) ( not ( = ?auto_583384 ?auto_583393 ) ) ( not ( = ?auto_583384 ?auto_583395 ) ) ( not ( = ?auto_583385 ?auto_583386 ) ) ( not ( = ?auto_583385 ?auto_583387 ) ) ( not ( = ?auto_583385 ?auto_583388 ) ) ( not ( = ?auto_583385 ?auto_583389 ) ) ( not ( = ?auto_583385 ?auto_583390 ) ) ( not ( = ?auto_583385 ?auto_583391 ) ) ( not ( = ?auto_583385 ?auto_583392 ) ) ( not ( = ?auto_583385 ?auto_583393 ) ) ( not ( = ?auto_583385 ?auto_583395 ) ) ( not ( = ?auto_583386 ?auto_583387 ) ) ( not ( = ?auto_583386 ?auto_583388 ) ) ( not ( = ?auto_583386 ?auto_583389 ) ) ( not ( = ?auto_583386 ?auto_583390 ) ) ( not ( = ?auto_583386 ?auto_583391 ) ) ( not ( = ?auto_583386 ?auto_583392 ) ) ( not ( = ?auto_583386 ?auto_583393 ) ) ( not ( = ?auto_583386 ?auto_583395 ) ) ( not ( = ?auto_583387 ?auto_583388 ) ) ( not ( = ?auto_583387 ?auto_583389 ) ) ( not ( = ?auto_583387 ?auto_583390 ) ) ( not ( = ?auto_583387 ?auto_583391 ) ) ( not ( = ?auto_583387 ?auto_583392 ) ) ( not ( = ?auto_583387 ?auto_583393 ) ) ( not ( = ?auto_583387 ?auto_583395 ) ) ( not ( = ?auto_583388 ?auto_583389 ) ) ( not ( = ?auto_583388 ?auto_583390 ) ) ( not ( = ?auto_583388 ?auto_583391 ) ) ( not ( = ?auto_583388 ?auto_583392 ) ) ( not ( = ?auto_583388 ?auto_583393 ) ) ( not ( = ?auto_583388 ?auto_583395 ) ) ( not ( = ?auto_583389 ?auto_583390 ) ) ( not ( = ?auto_583389 ?auto_583391 ) ) ( not ( = ?auto_583389 ?auto_583392 ) ) ( not ( = ?auto_583389 ?auto_583393 ) ) ( not ( = ?auto_583389 ?auto_583395 ) ) ( not ( = ?auto_583390 ?auto_583391 ) ) ( not ( = ?auto_583390 ?auto_583392 ) ) ( not ( = ?auto_583390 ?auto_583393 ) ) ( not ( = ?auto_583390 ?auto_583395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583391 ?auto_583392 ?auto_583393 )
      ( MAKE-11CRATE-VERIFY ?auto_583382 ?auto_583383 ?auto_583384 ?auto_583385 ?auto_583386 ?auto_583387 ?auto_583388 ?auto_583389 ?auto_583390 ?auto_583391 ?auto_583392 ?auto_583393 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583526 - SURFACE
      ?auto_583527 - SURFACE
      ?auto_583528 - SURFACE
      ?auto_583529 - SURFACE
      ?auto_583530 - SURFACE
      ?auto_583531 - SURFACE
      ?auto_583532 - SURFACE
      ?auto_583533 - SURFACE
      ?auto_583534 - SURFACE
      ?auto_583535 - SURFACE
      ?auto_583536 - SURFACE
      ?auto_583537 - SURFACE
    )
    :vars
    (
      ?auto_583539 - HOIST
      ?auto_583538 - PLACE
      ?auto_583543 - PLACE
      ?auto_583540 - HOIST
      ?auto_583541 - SURFACE
      ?auto_583542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583539 ?auto_583538 ) ( SURFACE-AT ?auto_583536 ?auto_583538 ) ( CLEAR ?auto_583536 ) ( IS-CRATE ?auto_583537 ) ( not ( = ?auto_583536 ?auto_583537 ) ) ( AVAILABLE ?auto_583539 ) ( ON ?auto_583536 ?auto_583535 ) ( not ( = ?auto_583535 ?auto_583536 ) ) ( not ( = ?auto_583535 ?auto_583537 ) ) ( not ( = ?auto_583543 ?auto_583538 ) ) ( HOIST-AT ?auto_583540 ?auto_583543 ) ( not ( = ?auto_583539 ?auto_583540 ) ) ( AVAILABLE ?auto_583540 ) ( SURFACE-AT ?auto_583537 ?auto_583543 ) ( ON ?auto_583537 ?auto_583541 ) ( CLEAR ?auto_583537 ) ( not ( = ?auto_583536 ?auto_583541 ) ) ( not ( = ?auto_583537 ?auto_583541 ) ) ( not ( = ?auto_583535 ?auto_583541 ) ) ( TRUCK-AT ?auto_583542 ?auto_583538 ) ( ON ?auto_583527 ?auto_583526 ) ( ON ?auto_583528 ?auto_583527 ) ( ON ?auto_583529 ?auto_583528 ) ( ON ?auto_583530 ?auto_583529 ) ( ON ?auto_583531 ?auto_583530 ) ( ON ?auto_583532 ?auto_583531 ) ( ON ?auto_583533 ?auto_583532 ) ( ON ?auto_583534 ?auto_583533 ) ( ON ?auto_583535 ?auto_583534 ) ( not ( = ?auto_583526 ?auto_583527 ) ) ( not ( = ?auto_583526 ?auto_583528 ) ) ( not ( = ?auto_583526 ?auto_583529 ) ) ( not ( = ?auto_583526 ?auto_583530 ) ) ( not ( = ?auto_583526 ?auto_583531 ) ) ( not ( = ?auto_583526 ?auto_583532 ) ) ( not ( = ?auto_583526 ?auto_583533 ) ) ( not ( = ?auto_583526 ?auto_583534 ) ) ( not ( = ?auto_583526 ?auto_583535 ) ) ( not ( = ?auto_583526 ?auto_583536 ) ) ( not ( = ?auto_583526 ?auto_583537 ) ) ( not ( = ?auto_583526 ?auto_583541 ) ) ( not ( = ?auto_583527 ?auto_583528 ) ) ( not ( = ?auto_583527 ?auto_583529 ) ) ( not ( = ?auto_583527 ?auto_583530 ) ) ( not ( = ?auto_583527 ?auto_583531 ) ) ( not ( = ?auto_583527 ?auto_583532 ) ) ( not ( = ?auto_583527 ?auto_583533 ) ) ( not ( = ?auto_583527 ?auto_583534 ) ) ( not ( = ?auto_583527 ?auto_583535 ) ) ( not ( = ?auto_583527 ?auto_583536 ) ) ( not ( = ?auto_583527 ?auto_583537 ) ) ( not ( = ?auto_583527 ?auto_583541 ) ) ( not ( = ?auto_583528 ?auto_583529 ) ) ( not ( = ?auto_583528 ?auto_583530 ) ) ( not ( = ?auto_583528 ?auto_583531 ) ) ( not ( = ?auto_583528 ?auto_583532 ) ) ( not ( = ?auto_583528 ?auto_583533 ) ) ( not ( = ?auto_583528 ?auto_583534 ) ) ( not ( = ?auto_583528 ?auto_583535 ) ) ( not ( = ?auto_583528 ?auto_583536 ) ) ( not ( = ?auto_583528 ?auto_583537 ) ) ( not ( = ?auto_583528 ?auto_583541 ) ) ( not ( = ?auto_583529 ?auto_583530 ) ) ( not ( = ?auto_583529 ?auto_583531 ) ) ( not ( = ?auto_583529 ?auto_583532 ) ) ( not ( = ?auto_583529 ?auto_583533 ) ) ( not ( = ?auto_583529 ?auto_583534 ) ) ( not ( = ?auto_583529 ?auto_583535 ) ) ( not ( = ?auto_583529 ?auto_583536 ) ) ( not ( = ?auto_583529 ?auto_583537 ) ) ( not ( = ?auto_583529 ?auto_583541 ) ) ( not ( = ?auto_583530 ?auto_583531 ) ) ( not ( = ?auto_583530 ?auto_583532 ) ) ( not ( = ?auto_583530 ?auto_583533 ) ) ( not ( = ?auto_583530 ?auto_583534 ) ) ( not ( = ?auto_583530 ?auto_583535 ) ) ( not ( = ?auto_583530 ?auto_583536 ) ) ( not ( = ?auto_583530 ?auto_583537 ) ) ( not ( = ?auto_583530 ?auto_583541 ) ) ( not ( = ?auto_583531 ?auto_583532 ) ) ( not ( = ?auto_583531 ?auto_583533 ) ) ( not ( = ?auto_583531 ?auto_583534 ) ) ( not ( = ?auto_583531 ?auto_583535 ) ) ( not ( = ?auto_583531 ?auto_583536 ) ) ( not ( = ?auto_583531 ?auto_583537 ) ) ( not ( = ?auto_583531 ?auto_583541 ) ) ( not ( = ?auto_583532 ?auto_583533 ) ) ( not ( = ?auto_583532 ?auto_583534 ) ) ( not ( = ?auto_583532 ?auto_583535 ) ) ( not ( = ?auto_583532 ?auto_583536 ) ) ( not ( = ?auto_583532 ?auto_583537 ) ) ( not ( = ?auto_583532 ?auto_583541 ) ) ( not ( = ?auto_583533 ?auto_583534 ) ) ( not ( = ?auto_583533 ?auto_583535 ) ) ( not ( = ?auto_583533 ?auto_583536 ) ) ( not ( = ?auto_583533 ?auto_583537 ) ) ( not ( = ?auto_583533 ?auto_583541 ) ) ( not ( = ?auto_583534 ?auto_583535 ) ) ( not ( = ?auto_583534 ?auto_583536 ) ) ( not ( = ?auto_583534 ?auto_583537 ) ) ( not ( = ?auto_583534 ?auto_583541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583535 ?auto_583536 ?auto_583537 )
      ( MAKE-11CRATE-VERIFY ?auto_583526 ?auto_583527 ?auto_583528 ?auto_583529 ?auto_583530 ?auto_583531 ?auto_583532 ?auto_583533 ?auto_583534 ?auto_583535 ?auto_583536 ?auto_583537 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583670 - SURFACE
      ?auto_583671 - SURFACE
      ?auto_583672 - SURFACE
      ?auto_583673 - SURFACE
      ?auto_583674 - SURFACE
      ?auto_583675 - SURFACE
      ?auto_583676 - SURFACE
      ?auto_583677 - SURFACE
      ?auto_583678 - SURFACE
      ?auto_583679 - SURFACE
      ?auto_583680 - SURFACE
      ?auto_583681 - SURFACE
    )
    :vars
    (
      ?auto_583687 - HOIST
      ?auto_583685 - PLACE
      ?auto_583684 - PLACE
      ?auto_583686 - HOIST
      ?auto_583683 - SURFACE
      ?auto_583682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583687 ?auto_583685 ) ( IS-CRATE ?auto_583681 ) ( not ( = ?auto_583680 ?auto_583681 ) ) ( not ( = ?auto_583679 ?auto_583680 ) ) ( not ( = ?auto_583679 ?auto_583681 ) ) ( not ( = ?auto_583684 ?auto_583685 ) ) ( HOIST-AT ?auto_583686 ?auto_583684 ) ( not ( = ?auto_583687 ?auto_583686 ) ) ( AVAILABLE ?auto_583686 ) ( SURFACE-AT ?auto_583681 ?auto_583684 ) ( ON ?auto_583681 ?auto_583683 ) ( CLEAR ?auto_583681 ) ( not ( = ?auto_583680 ?auto_583683 ) ) ( not ( = ?auto_583681 ?auto_583683 ) ) ( not ( = ?auto_583679 ?auto_583683 ) ) ( TRUCK-AT ?auto_583682 ?auto_583685 ) ( SURFACE-AT ?auto_583679 ?auto_583685 ) ( CLEAR ?auto_583679 ) ( LIFTING ?auto_583687 ?auto_583680 ) ( IS-CRATE ?auto_583680 ) ( ON ?auto_583671 ?auto_583670 ) ( ON ?auto_583672 ?auto_583671 ) ( ON ?auto_583673 ?auto_583672 ) ( ON ?auto_583674 ?auto_583673 ) ( ON ?auto_583675 ?auto_583674 ) ( ON ?auto_583676 ?auto_583675 ) ( ON ?auto_583677 ?auto_583676 ) ( ON ?auto_583678 ?auto_583677 ) ( ON ?auto_583679 ?auto_583678 ) ( not ( = ?auto_583670 ?auto_583671 ) ) ( not ( = ?auto_583670 ?auto_583672 ) ) ( not ( = ?auto_583670 ?auto_583673 ) ) ( not ( = ?auto_583670 ?auto_583674 ) ) ( not ( = ?auto_583670 ?auto_583675 ) ) ( not ( = ?auto_583670 ?auto_583676 ) ) ( not ( = ?auto_583670 ?auto_583677 ) ) ( not ( = ?auto_583670 ?auto_583678 ) ) ( not ( = ?auto_583670 ?auto_583679 ) ) ( not ( = ?auto_583670 ?auto_583680 ) ) ( not ( = ?auto_583670 ?auto_583681 ) ) ( not ( = ?auto_583670 ?auto_583683 ) ) ( not ( = ?auto_583671 ?auto_583672 ) ) ( not ( = ?auto_583671 ?auto_583673 ) ) ( not ( = ?auto_583671 ?auto_583674 ) ) ( not ( = ?auto_583671 ?auto_583675 ) ) ( not ( = ?auto_583671 ?auto_583676 ) ) ( not ( = ?auto_583671 ?auto_583677 ) ) ( not ( = ?auto_583671 ?auto_583678 ) ) ( not ( = ?auto_583671 ?auto_583679 ) ) ( not ( = ?auto_583671 ?auto_583680 ) ) ( not ( = ?auto_583671 ?auto_583681 ) ) ( not ( = ?auto_583671 ?auto_583683 ) ) ( not ( = ?auto_583672 ?auto_583673 ) ) ( not ( = ?auto_583672 ?auto_583674 ) ) ( not ( = ?auto_583672 ?auto_583675 ) ) ( not ( = ?auto_583672 ?auto_583676 ) ) ( not ( = ?auto_583672 ?auto_583677 ) ) ( not ( = ?auto_583672 ?auto_583678 ) ) ( not ( = ?auto_583672 ?auto_583679 ) ) ( not ( = ?auto_583672 ?auto_583680 ) ) ( not ( = ?auto_583672 ?auto_583681 ) ) ( not ( = ?auto_583672 ?auto_583683 ) ) ( not ( = ?auto_583673 ?auto_583674 ) ) ( not ( = ?auto_583673 ?auto_583675 ) ) ( not ( = ?auto_583673 ?auto_583676 ) ) ( not ( = ?auto_583673 ?auto_583677 ) ) ( not ( = ?auto_583673 ?auto_583678 ) ) ( not ( = ?auto_583673 ?auto_583679 ) ) ( not ( = ?auto_583673 ?auto_583680 ) ) ( not ( = ?auto_583673 ?auto_583681 ) ) ( not ( = ?auto_583673 ?auto_583683 ) ) ( not ( = ?auto_583674 ?auto_583675 ) ) ( not ( = ?auto_583674 ?auto_583676 ) ) ( not ( = ?auto_583674 ?auto_583677 ) ) ( not ( = ?auto_583674 ?auto_583678 ) ) ( not ( = ?auto_583674 ?auto_583679 ) ) ( not ( = ?auto_583674 ?auto_583680 ) ) ( not ( = ?auto_583674 ?auto_583681 ) ) ( not ( = ?auto_583674 ?auto_583683 ) ) ( not ( = ?auto_583675 ?auto_583676 ) ) ( not ( = ?auto_583675 ?auto_583677 ) ) ( not ( = ?auto_583675 ?auto_583678 ) ) ( not ( = ?auto_583675 ?auto_583679 ) ) ( not ( = ?auto_583675 ?auto_583680 ) ) ( not ( = ?auto_583675 ?auto_583681 ) ) ( not ( = ?auto_583675 ?auto_583683 ) ) ( not ( = ?auto_583676 ?auto_583677 ) ) ( not ( = ?auto_583676 ?auto_583678 ) ) ( not ( = ?auto_583676 ?auto_583679 ) ) ( not ( = ?auto_583676 ?auto_583680 ) ) ( not ( = ?auto_583676 ?auto_583681 ) ) ( not ( = ?auto_583676 ?auto_583683 ) ) ( not ( = ?auto_583677 ?auto_583678 ) ) ( not ( = ?auto_583677 ?auto_583679 ) ) ( not ( = ?auto_583677 ?auto_583680 ) ) ( not ( = ?auto_583677 ?auto_583681 ) ) ( not ( = ?auto_583677 ?auto_583683 ) ) ( not ( = ?auto_583678 ?auto_583679 ) ) ( not ( = ?auto_583678 ?auto_583680 ) ) ( not ( = ?auto_583678 ?auto_583681 ) ) ( not ( = ?auto_583678 ?auto_583683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583679 ?auto_583680 ?auto_583681 )
      ( MAKE-11CRATE-VERIFY ?auto_583670 ?auto_583671 ?auto_583672 ?auto_583673 ?auto_583674 ?auto_583675 ?auto_583676 ?auto_583677 ?auto_583678 ?auto_583679 ?auto_583680 ?auto_583681 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583814 - SURFACE
      ?auto_583815 - SURFACE
      ?auto_583816 - SURFACE
      ?auto_583817 - SURFACE
      ?auto_583818 - SURFACE
      ?auto_583819 - SURFACE
      ?auto_583820 - SURFACE
      ?auto_583821 - SURFACE
      ?auto_583822 - SURFACE
      ?auto_583823 - SURFACE
      ?auto_583824 - SURFACE
      ?auto_583825 - SURFACE
    )
    :vars
    (
      ?auto_583829 - HOIST
      ?auto_583830 - PLACE
      ?auto_583826 - PLACE
      ?auto_583831 - HOIST
      ?auto_583828 - SURFACE
      ?auto_583827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583829 ?auto_583830 ) ( IS-CRATE ?auto_583825 ) ( not ( = ?auto_583824 ?auto_583825 ) ) ( not ( = ?auto_583823 ?auto_583824 ) ) ( not ( = ?auto_583823 ?auto_583825 ) ) ( not ( = ?auto_583826 ?auto_583830 ) ) ( HOIST-AT ?auto_583831 ?auto_583826 ) ( not ( = ?auto_583829 ?auto_583831 ) ) ( AVAILABLE ?auto_583831 ) ( SURFACE-AT ?auto_583825 ?auto_583826 ) ( ON ?auto_583825 ?auto_583828 ) ( CLEAR ?auto_583825 ) ( not ( = ?auto_583824 ?auto_583828 ) ) ( not ( = ?auto_583825 ?auto_583828 ) ) ( not ( = ?auto_583823 ?auto_583828 ) ) ( TRUCK-AT ?auto_583827 ?auto_583830 ) ( SURFACE-AT ?auto_583823 ?auto_583830 ) ( CLEAR ?auto_583823 ) ( IS-CRATE ?auto_583824 ) ( AVAILABLE ?auto_583829 ) ( IN ?auto_583824 ?auto_583827 ) ( ON ?auto_583815 ?auto_583814 ) ( ON ?auto_583816 ?auto_583815 ) ( ON ?auto_583817 ?auto_583816 ) ( ON ?auto_583818 ?auto_583817 ) ( ON ?auto_583819 ?auto_583818 ) ( ON ?auto_583820 ?auto_583819 ) ( ON ?auto_583821 ?auto_583820 ) ( ON ?auto_583822 ?auto_583821 ) ( ON ?auto_583823 ?auto_583822 ) ( not ( = ?auto_583814 ?auto_583815 ) ) ( not ( = ?auto_583814 ?auto_583816 ) ) ( not ( = ?auto_583814 ?auto_583817 ) ) ( not ( = ?auto_583814 ?auto_583818 ) ) ( not ( = ?auto_583814 ?auto_583819 ) ) ( not ( = ?auto_583814 ?auto_583820 ) ) ( not ( = ?auto_583814 ?auto_583821 ) ) ( not ( = ?auto_583814 ?auto_583822 ) ) ( not ( = ?auto_583814 ?auto_583823 ) ) ( not ( = ?auto_583814 ?auto_583824 ) ) ( not ( = ?auto_583814 ?auto_583825 ) ) ( not ( = ?auto_583814 ?auto_583828 ) ) ( not ( = ?auto_583815 ?auto_583816 ) ) ( not ( = ?auto_583815 ?auto_583817 ) ) ( not ( = ?auto_583815 ?auto_583818 ) ) ( not ( = ?auto_583815 ?auto_583819 ) ) ( not ( = ?auto_583815 ?auto_583820 ) ) ( not ( = ?auto_583815 ?auto_583821 ) ) ( not ( = ?auto_583815 ?auto_583822 ) ) ( not ( = ?auto_583815 ?auto_583823 ) ) ( not ( = ?auto_583815 ?auto_583824 ) ) ( not ( = ?auto_583815 ?auto_583825 ) ) ( not ( = ?auto_583815 ?auto_583828 ) ) ( not ( = ?auto_583816 ?auto_583817 ) ) ( not ( = ?auto_583816 ?auto_583818 ) ) ( not ( = ?auto_583816 ?auto_583819 ) ) ( not ( = ?auto_583816 ?auto_583820 ) ) ( not ( = ?auto_583816 ?auto_583821 ) ) ( not ( = ?auto_583816 ?auto_583822 ) ) ( not ( = ?auto_583816 ?auto_583823 ) ) ( not ( = ?auto_583816 ?auto_583824 ) ) ( not ( = ?auto_583816 ?auto_583825 ) ) ( not ( = ?auto_583816 ?auto_583828 ) ) ( not ( = ?auto_583817 ?auto_583818 ) ) ( not ( = ?auto_583817 ?auto_583819 ) ) ( not ( = ?auto_583817 ?auto_583820 ) ) ( not ( = ?auto_583817 ?auto_583821 ) ) ( not ( = ?auto_583817 ?auto_583822 ) ) ( not ( = ?auto_583817 ?auto_583823 ) ) ( not ( = ?auto_583817 ?auto_583824 ) ) ( not ( = ?auto_583817 ?auto_583825 ) ) ( not ( = ?auto_583817 ?auto_583828 ) ) ( not ( = ?auto_583818 ?auto_583819 ) ) ( not ( = ?auto_583818 ?auto_583820 ) ) ( not ( = ?auto_583818 ?auto_583821 ) ) ( not ( = ?auto_583818 ?auto_583822 ) ) ( not ( = ?auto_583818 ?auto_583823 ) ) ( not ( = ?auto_583818 ?auto_583824 ) ) ( not ( = ?auto_583818 ?auto_583825 ) ) ( not ( = ?auto_583818 ?auto_583828 ) ) ( not ( = ?auto_583819 ?auto_583820 ) ) ( not ( = ?auto_583819 ?auto_583821 ) ) ( not ( = ?auto_583819 ?auto_583822 ) ) ( not ( = ?auto_583819 ?auto_583823 ) ) ( not ( = ?auto_583819 ?auto_583824 ) ) ( not ( = ?auto_583819 ?auto_583825 ) ) ( not ( = ?auto_583819 ?auto_583828 ) ) ( not ( = ?auto_583820 ?auto_583821 ) ) ( not ( = ?auto_583820 ?auto_583822 ) ) ( not ( = ?auto_583820 ?auto_583823 ) ) ( not ( = ?auto_583820 ?auto_583824 ) ) ( not ( = ?auto_583820 ?auto_583825 ) ) ( not ( = ?auto_583820 ?auto_583828 ) ) ( not ( = ?auto_583821 ?auto_583822 ) ) ( not ( = ?auto_583821 ?auto_583823 ) ) ( not ( = ?auto_583821 ?auto_583824 ) ) ( not ( = ?auto_583821 ?auto_583825 ) ) ( not ( = ?auto_583821 ?auto_583828 ) ) ( not ( = ?auto_583822 ?auto_583823 ) ) ( not ( = ?auto_583822 ?auto_583824 ) ) ( not ( = ?auto_583822 ?auto_583825 ) ) ( not ( = ?auto_583822 ?auto_583828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583823 ?auto_583824 ?auto_583825 )
      ( MAKE-11CRATE-VERIFY ?auto_583814 ?auto_583815 ?auto_583816 ?auto_583817 ?auto_583818 ?auto_583819 ?auto_583820 ?auto_583821 ?auto_583822 ?auto_583823 ?auto_583824 ?auto_583825 ) )
  )

)

