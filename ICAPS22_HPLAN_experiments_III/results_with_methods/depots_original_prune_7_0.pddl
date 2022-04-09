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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54898 - SURFACE
      ?auto_54899 - SURFACE
    )
    :vars
    (
      ?auto_54900 - HOIST
      ?auto_54901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54900 ?auto_54901 ) ( SURFACE-AT ?auto_54898 ?auto_54901 ) ( CLEAR ?auto_54898 ) ( LIFTING ?auto_54900 ?auto_54899 ) ( IS-CRATE ?auto_54899 ) ( not ( = ?auto_54898 ?auto_54899 ) ) )
    :subtasks
    ( ( !DROP ?auto_54900 ?auto_54899 ?auto_54898 ?auto_54901 )
      ( MAKE-1CRATE-VERIFY ?auto_54898 ?auto_54899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54902 - SURFACE
      ?auto_54903 - SURFACE
    )
    :vars
    (
      ?auto_54905 - HOIST
      ?auto_54904 - PLACE
      ?auto_54906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54905 ?auto_54904 ) ( SURFACE-AT ?auto_54902 ?auto_54904 ) ( CLEAR ?auto_54902 ) ( IS-CRATE ?auto_54903 ) ( not ( = ?auto_54902 ?auto_54903 ) ) ( TRUCK-AT ?auto_54906 ?auto_54904 ) ( AVAILABLE ?auto_54905 ) ( IN ?auto_54903 ?auto_54906 ) )
    :subtasks
    ( ( !UNLOAD ?auto_54905 ?auto_54903 ?auto_54906 ?auto_54904 )
      ( MAKE-1CRATE ?auto_54902 ?auto_54903 )
      ( MAKE-1CRATE-VERIFY ?auto_54902 ?auto_54903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54907 - SURFACE
      ?auto_54908 - SURFACE
    )
    :vars
    (
      ?auto_54909 - HOIST
      ?auto_54911 - PLACE
      ?auto_54910 - TRUCK
      ?auto_54912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54909 ?auto_54911 ) ( SURFACE-AT ?auto_54907 ?auto_54911 ) ( CLEAR ?auto_54907 ) ( IS-CRATE ?auto_54908 ) ( not ( = ?auto_54907 ?auto_54908 ) ) ( AVAILABLE ?auto_54909 ) ( IN ?auto_54908 ?auto_54910 ) ( TRUCK-AT ?auto_54910 ?auto_54912 ) ( not ( = ?auto_54912 ?auto_54911 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54910 ?auto_54912 ?auto_54911 )
      ( MAKE-1CRATE ?auto_54907 ?auto_54908 )
      ( MAKE-1CRATE-VERIFY ?auto_54907 ?auto_54908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54913 - SURFACE
      ?auto_54914 - SURFACE
    )
    :vars
    (
      ?auto_54915 - HOIST
      ?auto_54917 - PLACE
      ?auto_54916 - TRUCK
      ?auto_54918 - PLACE
      ?auto_54919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54915 ?auto_54917 ) ( SURFACE-AT ?auto_54913 ?auto_54917 ) ( CLEAR ?auto_54913 ) ( IS-CRATE ?auto_54914 ) ( not ( = ?auto_54913 ?auto_54914 ) ) ( AVAILABLE ?auto_54915 ) ( TRUCK-AT ?auto_54916 ?auto_54918 ) ( not ( = ?auto_54918 ?auto_54917 ) ) ( HOIST-AT ?auto_54919 ?auto_54918 ) ( LIFTING ?auto_54919 ?auto_54914 ) ( not ( = ?auto_54915 ?auto_54919 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54919 ?auto_54914 ?auto_54916 ?auto_54918 )
      ( MAKE-1CRATE ?auto_54913 ?auto_54914 )
      ( MAKE-1CRATE-VERIFY ?auto_54913 ?auto_54914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54920 - SURFACE
      ?auto_54921 - SURFACE
    )
    :vars
    (
      ?auto_54926 - HOIST
      ?auto_54923 - PLACE
      ?auto_54922 - TRUCK
      ?auto_54924 - PLACE
      ?auto_54925 - HOIST
      ?auto_54927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54926 ?auto_54923 ) ( SURFACE-AT ?auto_54920 ?auto_54923 ) ( CLEAR ?auto_54920 ) ( IS-CRATE ?auto_54921 ) ( not ( = ?auto_54920 ?auto_54921 ) ) ( AVAILABLE ?auto_54926 ) ( TRUCK-AT ?auto_54922 ?auto_54924 ) ( not ( = ?auto_54924 ?auto_54923 ) ) ( HOIST-AT ?auto_54925 ?auto_54924 ) ( not ( = ?auto_54926 ?auto_54925 ) ) ( AVAILABLE ?auto_54925 ) ( SURFACE-AT ?auto_54921 ?auto_54924 ) ( ON ?auto_54921 ?auto_54927 ) ( CLEAR ?auto_54921 ) ( not ( = ?auto_54920 ?auto_54927 ) ) ( not ( = ?auto_54921 ?auto_54927 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54925 ?auto_54921 ?auto_54927 ?auto_54924 )
      ( MAKE-1CRATE ?auto_54920 ?auto_54921 )
      ( MAKE-1CRATE-VERIFY ?auto_54920 ?auto_54921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54928 - SURFACE
      ?auto_54929 - SURFACE
    )
    :vars
    (
      ?auto_54934 - HOIST
      ?auto_54930 - PLACE
      ?auto_54933 - PLACE
      ?auto_54931 - HOIST
      ?auto_54935 - SURFACE
      ?auto_54932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54934 ?auto_54930 ) ( SURFACE-AT ?auto_54928 ?auto_54930 ) ( CLEAR ?auto_54928 ) ( IS-CRATE ?auto_54929 ) ( not ( = ?auto_54928 ?auto_54929 ) ) ( AVAILABLE ?auto_54934 ) ( not ( = ?auto_54933 ?auto_54930 ) ) ( HOIST-AT ?auto_54931 ?auto_54933 ) ( not ( = ?auto_54934 ?auto_54931 ) ) ( AVAILABLE ?auto_54931 ) ( SURFACE-AT ?auto_54929 ?auto_54933 ) ( ON ?auto_54929 ?auto_54935 ) ( CLEAR ?auto_54929 ) ( not ( = ?auto_54928 ?auto_54935 ) ) ( not ( = ?auto_54929 ?auto_54935 ) ) ( TRUCK-AT ?auto_54932 ?auto_54930 ) )
    :subtasks
    ( ( !DRIVE ?auto_54932 ?auto_54930 ?auto_54933 )
      ( MAKE-1CRATE ?auto_54928 ?auto_54929 )
      ( MAKE-1CRATE-VERIFY ?auto_54928 ?auto_54929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54945 - SURFACE
      ?auto_54946 - SURFACE
      ?auto_54947 - SURFACE
    )
    :vars
    (
      ?auto_54948 - HOIST
      ?auto_54949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54948 ?auto_54949 ) ( SURFACE-AT ?auto_54946 ?auto_54949 ) ( CLEAR ?auto_54946 ) ( LIFTING ?auto_54948 ?auto_54947 ) ( IS-CRATE ?auto_54947 ) ( not ( = ?auto_54946 ?auto_54947 ) ) ( ON ?auto_54946 ?auto_54945 ) ( not ( = ?auto_54945 ?auto_54946 ) ) ( not ( = ?auto_54945 ?auto_54947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54946 ?auto_54947 )
      ( MAKE-2CRATE-VERIFY ?auto_54945 ?auto_54946 ?auto_54947 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54955 - SURFACE
      ?auto_54956 - SURFACE
      ?auto_54957 - SURFACE
    )
    :vars
    (
      ?auto_54958 - HOIST
      ?auto_54960 - PLACE
      ?auto_54959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_54958 ?auto_54960 ) ( SURFACE-AT ?auto_54956 ?auto_54960 ) ( CLEAR ?auto_54956 ) ( IS-CRATE ?auto_54957 ) ( not ( = ?auto_54956 ?auto_54957 ) ) ( TRUCK-AT ?auto_54959 ?auto_54960 ) ( AVAILABLE ?auto_54958 ) ( IN ?auto_54957 ?auto_54959 ) ( ON ?auto_54956 ?auto_54955 ) ( not ( = ?auto_54955 ?auto_54956 ) ) ( not ( = ?auto_54955 ?auto_54957 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54956 ?auto_54957 )
      ( MAKE-2CRATE-VERIFY ?auto_54955 ?auto_54956 ?auto_54957 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54961 - SURFACE
      ?auto_54962 - SURFACE
    )
    :vars
    (
      ?auto_54965 - HOIST
      ?auto_54964 - PLACE
      ?auto_54963 - TRUCK
      ?auto_54966 - SURFACE
      ?auto_54967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54965 ?auto_54964 ) ( SURFACE-AT ?auto_54961 ?auto_54964 ) ( CLEAR ?auto_54961 ) ( IS-CRATE ?auto_54962 ) ( not ( = ?auto_54961 ?auto_54962 ) ) ( AVAILABLE ?auto_54965 ) ( IN ?auto_54962 ?auto_54963 ) ( ON ?auto_54961 ?auto_54966 ) ( not ( = ?auto_54966 ?auto_54961 ) ) ( not ( = ?auto_54966 ?auto_54962 ) ) ( TRUCK-AT ?auto_54963 ?auto_54967 ) ( not ( = ?auto_54967 ?auto_54964 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54963 ?auto_54967 ?auto_54964 )
      ( MAKE-2CRATE ?auto_54966 ?auto_54961 ?auto_54962 )
      ( MAKE-1CRATE-VERIFY ?auto_54961 ?auto_54962 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54968 - SURFACE
      ?auto_54969 - SURFACE
      ?auto_54970 - SURFACE
    )
    :vars
    (
      ?auto_54971 - HOIST
      ?auto_54972 - PLACE
      ?auto_54974 - TRUCK
      ?auto_54973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54971 ?auto_54972 ) ( SURFACE-AT ?auto_54969 ?auto_54972 ) ( CLEAR ?auto_54969 ) ( IS-CRATE ?auto_54970 ) ( not ( = ?auto_54969 ?auto_54970 ) ) ( AVAILABLE ?auto_54971 ) ( IN ?auto_54970 ?auto_54974 ) ( ON ?auto_54969 ?auto_54968 ) ( not ( = ?auto_54968 ?auto_54969 ) ) ( not ( = ?auto_54968 ?auto_54970 ) ) ( TRUCK-AT ?auto_54974 ?auto_54973 ) ( not ( = ?auto_54973 ?auto_54972 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54969 ?auto_54970 )
      ( MAKE-2CRATE-VERIFY ?auto_54968 ?auto_54969 ?auto_54970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54975 - SURFACE
      ?auto_54976 - SURFACE
    )
    :vars
    (
      ?auto_54981 - HOIST
      ?auto_54980 - PLACE
      ?auto_54977 - SURFACE
      ?auto_54978 - TRUCK
      ?auto_54979 - PLACE
      ?auto_54982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54981 ?auto_54980 ) ( SURFACE-AT ?auto_54975 ?auto_54980 ) ( CLEAR ?auto_54975 ) ( IS-CRATE ?auto_54976 ) ( not ( = ?auto_54975 ?auto_54976 ) ) ( AVAILABLE ?auto_54981 ) ( ON ?auto_54975 ?auto_54977 ) ( not ( = ?auto_54977 ?auto_54975 ) ) ( not ( = ?auto_54977 ?auto_54976 ) ) ( TRUCK-AT ?auto_54978 ?auto_54979 ) ( not ( = ?auto_54979 ?auto_54980 ) ) ( HOIST-AT ?auto_54982 ?auto_54979 ) ( LIFTING ?auto_54982 ?auto_54976 ) ( not ( = ?auto_54981 ?auto_54982 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54982 ?auto_54976 ?auto_54978 ?auto_54979 )
      ( MAKE-2CRATE ?auto_54977 ?auto_54975 ?auto_54976 )
      ( MAKE-1CRATE-VERIFY ?auto_54975 ?auto_54976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_54983 - SURFACE
      ?auto_54984 - SURFACE
      ?auto_54985 - SURFACE
    )
    :vars
    (
      ?auto_54987 - HOIST
      ?auto_54986 - PLACE
      ?auto_54990 - TRUCK
      ?auto_54988 - PLACE
      ?auto_54989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_54987 ?auto_54986 ) ( SURFACE-AT ?auto_54984 ?auto_54986 ) ( CLEAR ?auto_54984 ) ( IS-CRATE ?auto_54985 ) ( not ( = ?auto_54984 ?auto_54985 ) ) ( AVAILABLE ?auto_54987 ) ( ON ?auto_54984 ?auto_54983 ) ( not ( = ?auto_54983 ?auto_54984 ) ) ( not ( = ?auto_54983 ?auto_54985 ) ) ( TRUCK-AT ?auto_54990 ?auto_54988 ) ( not ( = ?auto_54988 ?auto_54986 ) ) ( HOIST-AT ?auto_54989 ?auto_54988 ) ( LIFTING ?auto_54989 ?auto_54985 ) ( not ( = ?auto_54987 ?auto_54989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_54984 ?auto_54985 )
      ( MAKE-2CRATE-VERIFY ?auto_54983 ?auto_54984 ?auto_54985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54991 - SURFACE
      ?auto_54992 - SURFACE
    )
    :vars
    (
      ?auto_54997 - HOIST
      ?auto_54995 - PLACE
      ?auto_54994 - SURFACE
      ?auto_54993 - TRUCK
      ?auto_54996 - PLACE
      ?auto_54998 - HOIST
      ?auto_54999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54997 ?auto_54995 ) ( SURFACE-AT ?auto_54991 ?auto_54995 ) ( CLEAR ?auto_54991 ) ( IS-CRATE ?auto_54992 ) ( not ( = ?auto_54991 ?auto_54992 ) ) ( AVAILABLE ?auto_54997 ) ( ON ?auto_54991 ?auto_54994 ) ( not ( = ?auto_54994 ?auto_54991 ) ) ( not ( = ?auto_54994 ?auto_54992 ) ) ( TRUCK-AT ?auto_54993 ?auto_54996 ) ( not ( = ?auto_54996 ?auto_54995 ) ) ( HOIST-AT ?auto_54998 ?auto_54996 ) ( not ( = ?auto_54997 ?auto_54998 ) ) ( AVAILABLE ?auto_54998 ) ( SURFACE-AT ?auto_54992 ?auto_54996 ) ( ON ?auto_54992 ?auto_54999 ) ( CLEAR ?auto_54992 ) ( not ( = ?auto_54991 ?auto_54999 ) ) ( not ( = ?auto_54992 ?auto_54999 ) ) ( not ( = ?auto_54994 ?auto_54999 ) ) )
    :subtasks
    ( ( !LIFT ?auto_54998 ?auto_54992 ?auto_54999 ?auto_54996 )
      ( MAKE-2CRATE ?auto_54994 ?auto_54991 ?auto_54992 )
      ( MAKE-1CRATE-VERIFY ?auto_54991 ?auto_54992 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55000 - SURFACE
      ?auto_55001 - SURFACE
      ?auto_55002 - SURFACE
    )
    :vars
    (
      ?auto_55003 - HOIST
      ?auto_55004 - PLACE
      ?auto_55008 - TRUCK
      ?auto_55007 - PLACE
      ?auto_55006 - HOIST
      ?auto_55005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55003 ?auto_55004 ) ( SURFACE-AT ?auto_55001 ?auto_55004 ) ( CLEAR ?auto_55001 ) ( IS-CRATE ?auto_55002 ) ( not ( = ?auto_55001 ?auto_55002 ) ) ( AVAILABLE ?auto_55003 ) ( ON ?auto_55001 ?auto_55000 ) ( not ( = ?auto_55000 ?auto_55001 ) ) ( not ( = ?auto_55000 ?auto_55002 ) ) ( TRUCK-AT ?auto_55008 ?auto_55007 ) ( not ( = ?auto_55007 ?auto_55004 ) ) ( HOIST-AT ?auto_55006 ?auto_55007 ) ( not ( = ?auto_55003 ?auto_55006 ) ) ( AVAILABLE ?auto_55006 ) ( SURFACE-AT ?auto_55002 ?auto_55007 ) ( ON ?auto_55002 ?auto_55005 ) ( CLEAR ?auto_55002 ) ( not ( = ?auto_55001 ?auto_55005 ) ) ( not ( = ?auto_55002 ?auto_55005 ) ) ( not ( = ?auto_55000 ?auto_55005 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55001 ?auto_55002 )
      ( MAKE-2CRATE-VERIFY ?auto_55000 ?auto_55001 ?auto_55002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55009 - SURFACE
      ?auto_55010 - SURFACE
    )
    :vars
    (
      ?auto_55012 - HOIST
      ?auto_55014 - PLACE
      ?auto_55015 - SURFACE
      ?auto_55013 - PLACE
      ?auto_55017 - HOIST
      ?auto_55011 - SURFACE
      ?auto_55016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55012 ?auto_55014 ) ( SURFACE-AT ?auto_55009 ?auto_55014 ) ( CLEAR ?auto_55009 ) ( IS-CRATE ?auto_55010 ) ( not ( = ?auto_55009 ?auto_55010 ) ) ( AVAILABLE ?auto_55012 ) ( ON ?auto_55009 ?auto_55015 ) ( not ( = ?auto_55015 ?auto_55009 ) ) ( not ( = ?auto_55015 ?auto_55010 ) ) ( not ( = ?auto_55013 ?auto_55014 ) ) ( HOIST-AT ?auto_55017 ?auto_55013 ) ( not ( = ?auto_55012 ?auto_55017 ) ) ( AVAILABLE ?auto_55017 ) ( SURFACE-AT ?auto_55010 ?auto_55013 ) ( ON ?auto_55010 ?auto_55011 ) ( CLEAR ?auto_55010 ) ( not ( = ?auto_55009 ?auto_55011 ) ) ( not ( = ?auto_55010 ?auto_55011 ) ) ( not ( = ?auto_55015 ?auto_55011 ) ) ( TRUCK-AT ?auto_55016 ?auto_55014 ) )
    :subtasks
    ( ( !DRIVE ?auto_55016 ?auto_55014 ?auto_55013 )
      ( MAKE-2CRATE ?auto_55015 ?auto_55009 ?auto_55010 )
      ( MAKE-1CRATE-VERIFY ?auto_55009 ?auto_55010 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55018 - SURFACE
      ?auto_55019 - SURFACE
      ?auto_55020 - SURFACE
    )
    :vars
    (
      ?auto_55022 - HOIST
      ?auto_55025 - PLACE
      ?auto_55021 - PLACE
      ?auto_55023 - HOIST
      ?auto_55024 - SURFACE
      ?auto_55026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55022 ?auto_55025 ) ( SURFACE-AT ?auto_55019 ?auto_55025 ) ( CLEAR ?auto_55019 ) ( IS-CRATE ?auto_55020 ) ( not ( = ?auto_55019 ?auto_55020 ) ) ( AVAILABLE ?auto_55022 ) ( ON ?auto_55019 ?auto_55018 ) ( not ( = ?auto_55018 ?auto_55019 ) ) ( not ( = ?auto_55018 ?auto_55020 ) ) ( not ( = ?auto_55021 ?auto_55025 ) ) ( HOIST-AT ?auto_55023 ?auto_55021 ) ( not ( = ?auto_55022 ?auto_55023 ) ) ( AVAILABLE ?auto_55023 ) ( SURFACE-AT ?auto_55020 ?auto_55021 ) ( ON ?auto_55020 ?auto_55024 ) ( CLEAR ?auto_55020 ) ( not ( = ?auto_55019 ?auto_55024 ) ) ( not ( = ?auto_55020 ?auto_55024 ) ) ( not ( = ?auto_55018 ?auto_55024 ) ) ( TRUCK-AT ?auto_55026 ?auto_55025 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55019 ?auto_55020 )
      ( MAKE-2CRATE-VERIFY ?auto_55018 ?auto_55019 ?auto_55020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55027 - SURFACE
      ?auto_55028 - SURFACE
    )
    :vars
    (
      ?auto_55035 - HOIST
      ?auto_55029 - PLACE
      ?auto_55030 - SURFACE
      ?auto_55031 - PLACE
      ?auto_55034 - HOIST
      ?auto_55033 - SURFACE
      ?auto_55032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55035 ?auto_55029 ) ( IS-CRATE ?auto_55028 ) ( not ( = ?auto_55027 ?auto_55028 ) ) ( not ( = ?auto_55030 ?auto_55027 ) ) ( not ( = ?auto_55030 ?auto_55028 ) ) ( not ( = ?auto_55031 ?auto_55029 ) ) ( HOIST-AT ?auto_55034 ?auto_55031 ) ( not ( = ?auto_55035 ?auto_55034 ) ) ( AVAILABLE ?auto_55034 ) ( SURFACE-AT ?auto_55028 ?auto_55031 ) ( ON ?auto_55028 ?auto_55033 ) ( CLEAR ?auto_55028 ) ( not ( = ?auto_55027 ?auto_55033 ) ) ( not ( = ?auto_55028 ?auto_55033 ) ) ( not ( = ?auto_55030 ?auto_55033 ) ) ( TRUCK-AT ?auto_55032 ?auto_55029 ) ( SURFACE-AT ?auto_55030 ?auto_55029 ) ( CLEAR ?auto_55030 ) ( LIFTING ?auto_55035 ?auto_55027 ) ( IS-CRATE ?auto_55027 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55030 ?auto_55027 )
      ( MAKE-2CRATE ?auto_55030 ?auto_55027 ?auto_55028 )
      ( MAKE-1CRATE-VERIFY ?auto_55027 ?auto_55028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55036 - SURFACE
      ?auto_55037 - SURFACE
      ?auto_55038 - SURFACE
    )
    :vars
    (
      ?auto_55042 - HOIST
      ?auto_55041 - PLACE
      ?auto_55040 - PLACE
      ?auto_55043 - HOIST
      ?auto_55044 - SURFACE
      ?auto_55039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55042 ?auto_55041 ) ( IS-CRATE ?auto_55038 ) ( not ( = ?auto_55037 ?auto_55038 ) ) ( not ( = ?auto_55036 ?auto_55037 ) ) ( not ( = ?auto_55036 ?auto_55038 ) ) ( not ( = ?auto_55040 ?auto_55041 ) ) ( HOIST-AT ?auto_55043 ?auto_55040 ) ( not ( = ?auto_55042 ?auto_55043 ) ) ( AVAILABLE ?auto_55043 ) ( SURFACE-AT ?auto_55038 ?auto_55040 ) ( ON ?auto_55038 ?auto_55044 ) ( CLEAR ?auto_55038 ) ( not ( = ?auto_55037 ?auto_55044 ) ) ( not ( = ?auto_55038 ?auto_55044 ) ) ( not ( = ?auto_55036 ?auto_55044 ) ) ( TRUCK-AT ?auto_55039 ?auto_55041 ) ( SURFACE-AT ?auto_55036 ?auto_55041 ) ( CLEAR ?auto_55036 ) ( LIFTING ?auto_55042 ?auto_55037 ) ( IS-CRATE ?auto_55037 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55037 ?auto_55038 )
      ( MAKE-2CRATE-VERIFY ?auto_55036 ?auto_55037 ?auto_55038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55045 - SURFACE
      ?auto_55046 - SURFACE
    )
    :vars
    (
      ?auto_55052 - HOIST
      ?auto_55051 - PLACE
      ?auto_55049 - SURFACE
      ?auto_55047 - PLACE
      ?auto_55053 - HOIST
      ?auto_55050 - SURFACE
      ?auto_55048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55052 ?auto_55051 ) ( IS-CRATE ?auto_55046 ) ( not ( = ?auto_55045 ?auto_55046 ) ) ( not ( = ?auto_55049 ?auto_55045 ) ) ( not ( = ?auto_55049 ?auto_55046 ) ) ( not ( = ?auto_55047 ?auto_55051 ) ) ( HOIST-AT ?auto_55053 ?auto_55047 ) ( not ( = ?auto_55052 ?auto_55053 ) ) ( AVAILABLE ?auto_55053 ) ( SURFACE-AT ?auto_55046 ?auto_55047 ) ( ON ?auto_55046 ?auto_55050 ) ( CLEAR ?auto_55046 ) ( not ( = ?auto_55045 ?auto_55050 ) ) ( not ( = ?auto_55046 ?auto_55050 ) ) ( not ( = ?auto_55049 ?auto_55050 ) ) ( TRUCK-AT ?auto_55048 ?auto_55051 ) ( SURFACE-AT ?auto_55049 ?auto_55051 ) ( CLEAR ?auto_55049 ) ( IS-CRATE ?auto_55045 ) ( AVAILABLE ?auto_55052 ) ( IN ?auto_55045 ?auto_55048 ) )
    :subtasks
    ( ( !UNLOAD ?auto_55052 ?auto_55045 ?auto_55048 ?auto_55051 )
      ( MAKE-2CRATE ?auto_55049 ?auto_55045 ?auto_55046 )
      ( MAKE-1CRATE-VERIFY ?auto_55045 ?auto_55046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55054 - SURFACE
      ?auto_55055 - SURFACE
      ?auto_55056 - SURFACE
    )
    :vars
    (
      ?auto_55058 - HOIST
      ?auto_55057 - PLACE
      ?auto_55061 - PLACE
      ?auto_55060 - HOIST
      ?auto_55062 - SURFACE
      ?auto_55059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55058 ?auto_55057 ) ( IS-CRATE ?auto_55056 ) ( not ( = ?auto_55055 ?auto_55056 ) ) ( not ( = ?auto_55054 ?auto_55055 ) ) ( not ( = ?auto_55054 ?auto_55056 ) ) ( not ( = ?auto_55061 ?auto_55057 ) ) ( HOIST-AT ?auto_55060 ?auto_55061 ) ( not ( = ?auto_55058 ?auto_55060 ) ) ( AVAILABLE ?auto_55060 ) ( SURFACE-AT ?auto_55056 ?auto_55061 ) ( ON ?auto_55056 ?auto_55062 ) ( CLEAR ?auto_55056 ) ( not ( = ?auto_55055 ?auto_55062 ) ) ( not ( = ?auto_55056 ?auto_55062 ) ) ( not ( = ?auto_55054 ?auto_55062 ) ) ( TRUCK-AT ?auto_55059 ?auto_55057 ) ( SURFACE-AT ?auto_55054 ?auto_55057 ) ( CLEAR ?auto_55054 ) ( IS-CRATE ?auto_55055 ) ( AVAILABLE ?auto_55058 ) ( IN ?auto_55055 ?auto_55059 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55055 ?auto_55056 )
      ( MAKE-2CRATE-VERIFY ?auto_55054 ?auto_55055 ?auto_55056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55099 - SURFACE
      ?auto_55100 - SURFACE
    )
    :vars
    (
      ?auto_55104 - HOIST
      ?auto_55102 - PLACE
      ?auto_55106 - SURFACE
      ?auto_55103 - PLACE
      ?auto_55105 - HOIST
      ?auto_55101 - SURFACE
      ?auto_55107 - TRUCK
      ?auto_55108 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55104 ?auto_55102 ) ( SURFACE-AT ?auto_55099 ?auto_55102 ) ( CLEAR ?auto_55099 ) ( IS-CRATE ?auto_55100 ) ( not ( = ?auto_55099 ?auto_55100 ) ) ( AVAILABLE ?auto_55104 ) ( ON ?auto_55099 ?auto_55106 ) ( not ( = ?auto_55106 ?auto_55099 ) ) ( not ( = ?auto_55106 ?auto_55100 ) ) ( not ( = ?auto_55103 ?auto_55102 ) ) ( HOIST-AT ?auto_55105 ?auto_55103 ) ( not ( = ?auto_55104 ?auto_55105 ) ) ( AVAILABLE ?auto_55105 ) ( SURFACE-AT ?auto_55100 ?auto_55103 ) ( ON ?auto_55100 ?auto_55101 ) ( CLEAR ?auto_55100 ) ( not ( = ?auto_55099 ?auto_55101 ) ) ( not ( = ?auto_55100 ?auto_55101 ) ) ( not ( = ?auto_55106 ?auto_55101 ) ) ( TRUCK-AT ?auto_55107 ?auto_55108 ) ( not ( = ?auto_55108 ?auto_55102 ) ) ( not ( = ?auto_55103 ?auto_55108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_55107 ?auto_55108 ?auto_55102 )
      ( MAKE-1CRATE ?auto_55099 ?auto_55100 )
      ( MAKE-1CRATE-VERIFY ?auto_55099 ?auto_55100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55138 - SURFACE
      ?auto_55139 - SURFACE
      ?auto_55140 - SURFACE
      ?auto_55141 - SURFACE
    )
    :vars
    (
      ?auto_55143 - HOIST
      ?auto_55142 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55143 ?auto_55142 ) ( SURFACE-AT ?auto_55140 ?auto_55142 ) ( CLEAR ?auto_55140 ) ( LIFTING ?auto_55143 ?auto_55141 ) ( IS-CRATE ?auto_55141 ) ( not ( = ?auto_55140 ?auto_55141 ) ) ( ON ?auto_55139 ?auto_55138 ) ( ON ?auto_55140 ?auto_55139 ) ( not ( = ?auto_55138 ?auto_55139 ) ) ( not ( = ?auto_55138 ?auto_55140 ) ) ( not ( = ?auto_55138 ?auto_55141 ) ) ( not ( = ?auto_55139 ?auto_55140 ) ) ( not ( = ?auto_55139 ?auto_55141 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55140 ?auto_55141 )
      ( MAKE-3CRATE-VERIFY ?auto_55138 ?auto_55139 ?auto_55140 ?auto_55141 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55155 - SURFACE
      ?auto_55156 - SURFACE
      ?auto_55157 - SURFACE
      ?auto_55158 - SURFACE
    )
    :vars
    (
      ?auto_55161 - HOIST
      ?auto_55159 - PLACE
      ?auto_55160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55161 ?auto_55159 ) ( SURFACE-AT ?auto_55157 ?auto_55159 ) ( CLEAR ?auto_55157 ) ( IS-CRATE ?auto_55158 ) ( not ( = ?auto_55157 ?auto_55158 ) ) ( TRUCK-AT ?auto_55160 ?auto_55159 ) ( AVAILABLE ?auto_55161 ) ( IN ?auto_55158 ?auto_55160 ) ( ON ?auto_55157 ?auto_55156 ) ( not ( = ?auto_55156 ?auto_55157 ) ) ( not ( = ?auto_55156 ?auto_55158 ) ) ( ON ?auto_55156 ?auto_55155 ) ( not ( = ?auto_55155 ?auto_55156 ) ) ( not ( = ?auto_55155 ?auto_55157 ) ) ( not ( = ?auto_55155 ?auto_55158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55156 ?auto_55157 ?auto_55158 )
      ( MAKE-3CRATE-VERIFY ?auto_55155 ?auto_55156 ?auto_55157 ?auto_55158 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55176 - SURFACE
      ?auto_55177 - SURFACE
      ?auto_55178 - SURFACE
      ?auto_55179 - SURFACE
    )
    :vars
    (
      ?auto_55182 - HOIST
      ?auto_55180 - PLACE
      ?auto_55183 - TRUCK
      ?auto_55181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55182 ?auto_55180 ) ( SURFACE-AT ?auto_55178 ?auto_55180 ) ( CLEAR ?auto_55178 ) ( IS-CRATE ?auto_55179 ) ( not ( = ?auto_55178 ?auto_55179 ) ) ( AVAILABLE ?auto_55182 ) ( IN ?auto_55179 ?auto_55183 ) ( ON ?auto_55178 ?auto_55177 ) ( not ( = ?auto_55177 ?auto_55178 ) ) ( not ( = ?auto_55177 ?auto_55179 ) ) ( TRUCK-AT ?auto_55183 ?auto_55181 ) ( not ( = ?auto_55181 ?auto_55180 ) ) ( ON ?auto_55177 ?auto_55176 ) ( not ( = ?auto_55176 ?auto_55177 ) ) ( not ( = ?auto_55176 ?auto_55178 ) ) ( not ( = ?auto_55176 ?auto_55179 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55177 ?auto_55178 ?auto_55179 )
      ( MAKE-3CRATE-VERIFY ?auto_55176 ?auto_55177 ?auto_55178 ?auto_55179 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55200 - SURFACE
      ?auto_55201 - SURFACE
      ?auto_55202 - SURFACE
      ?auto_55203 - SURFACE
    )
    :vars
    (
      ?auto_55208 - HOIST
      ?auto_55204 - PLACE
      ?auto_55207 - TRUCK
      ?auto_55206 - PLACE
      ?auto_55205 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55208 ?auto_55204 ) ( SURFACE-AT ?auto_55202 ?auto_55204 ) ( CLEAR ?auto_55202 ) ( IS-CRATE ?auto_55203 ) ( not ( = ?auto_55202 ?auto_55203 ) ) ( AVAILABLE ?auto_55208 ) ( ON ?auto_55202 ?auto_55201 ) ( not ( = ?auto_55201 ?auto_55202 ) ) ( not ( = ?auto_55201 ?auto_55203 ) ) ( TRUCK-AT ?auto_55207 ?auto_55206 ) ( not ( = ?auto_55206 ?auto_55204 ) ) ( HOIST-AT ?auto_55205 ?auto_55206 ) ( LIFTING ?auto_55205 ?auto_55203 ) ( not ( = ?auto_55208 ?auto_55205 ) ) ( ON ?auto_55201 ?auto_55200 ) ( not ( = ?auto_55200 ?auto_55201 ) ) ( not ( = ?auto_55200 ?auto_55202 ) ) ( not ( = ?auto_55200 ?auto_55203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55201 ?auto_55202 ?auto_55203 )
      ( MAKE-3CRATE-VERIFY ?auto_55200 ?auto_55201 ?auto_55202 ?auto_55203 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55227 - SURFACE
      ?auto_55228 - SURFACE
      ?auto_55229 - SURFACE
      ?auto_55230 - SURFACE
    )
    :vars
    (
      ?auto_55233 - HOIST
      ?auto_55234 - PLACE
      ?auto_55235 - TRUCK
      ?auto_55232 - PLACE
      ?auto_55231 - HOIST
      ?auto_55236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55233 ?auto_55234 ) ( SURFACE-AT ?auto_55229 ?auto_55234 ) ( CLEAR ?auto_55229 ) ( IS-CRATE ?auto_55230 ) ( not ( = ?auto_55229 ?auto_55230 ) ) ( AVAILABLE ?auto_55233 ) ( ON ?auto_55229 ?auto_55228 ) ( not ( = ?auto_55228 ?auto_55229 ) ) ( not ( = ?auto_55228 ?auto_55230 ) ) ( TRUCK-AT ?auto_55235 ?auto_55232 ) ( not ( = ?auto_55232 ?auto_55234 ) ) ( HOIST-AT ?auto_55231 ?auto_55232 ) ( not ( = ?auto_55233 ?auto_55231 ) ) ( AVAILABLE ?auto_55231 ) ( SURFACE-AT ?auto_55230 ?auto_55232 ) ( ON ?auto_55230 ?auto_55236 ) ( CLEAR ?auto_55230 ) ( not ( = ?auto_55229 ?auto_55236 ) ) ( not ( = ?auto_55230 ?auto_55236 ) ) ( not ( = ?auto_55228 ?auto_55236 ) ) ( ON ?auto_55228 ?auto_55227 ) ( not ( = ?auto_55227 ?auto_55228 ) ) ( not ( = ?auto_55227 ?auto_55229 ) ) ( not ( = ?auto_55227 ?auto_55230 ) ) ( not ( = ?auto_55227 ?auto_55236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55228 ?auto_55229 ?auto_55230 )
      ( MAKE-3CRATE-VERIFY ?auto_55227 ?auto_55228 ?auto_55229 ?auto_55230 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55255 - SURFACE
      ?auto_55256 - SURFACE
      ?auto_55257 - SURFACE
      ?auto_55258 - SURFACE
    )
    :vars
    (
      ?auto_55259 - HOIST
      ?auto_55261 - PLACE
      ?auto_55263 - PLACE
      ?auto_55264 - HOIST
      ?auto_55260 - SURFACE
      ?auto_55262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55259 ?auto_55261 ) ( SURFACE-AT ?auto_55257 ?auto_55261 ) ( CLEAR ?auto_55257 ) ( IS-CRATE ?auto_55258 ) ( not ( = ?auto_55257 ?auto_55258 ) ) ( AVAILABLE ?auto_55259 ) ( ON ?auto_55257 ?auto_55256 ) ( not ( = ?auto_55256 ?auto_55257 ) ) ( not ( = ?auto_55256 ?auto_55258 ) ) ( not ( = ?auto_55263 ?auto_55261 ) ) ( HOIST-AT ?auto_55264 ?auto_55263 ) ( not ( = ?auto_55259 ?auto_55264 ) ) ( AVAILABLE ?auto_55264 ) ( SURFACE-AT ?auto_55258 ?auto_55263 ) ( ON ?auto_55258 ?auto_55260 ) ( CLEAR ?auto_55258 ) ( not ( = ?auto_55257 ?auto_55260 ) ) ( not ( = ?auto_55258 ?auto_55260 ) ) ( not ( = ?auto_55256 ?auto_55260 ) ) ( TRUCK-AT ?auto_55262 ?auto_55261 ) ( ON ?auto_55256 ?auto_55255 ) ( not ( = ?auto_55255 ?auto_55256 ) ) ( not ( = ?auto_55255 ?auto_55257 ) ) ( not ( = ?auto_55255 ?auto_55258 ) ) ( not ( = ?auto_55255 ?auto_55260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55256 ?auto_55257 ?auto_55258 )
      ( MAKE-3CRATE-VERIFY ?auto_55255 ?auto_55256 ?auto_55257 ?auto_55258 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55283 - SURFACE
      ?auto_55284 - SURFACE
      ?auto_55285 - SURFACE
      ?auto_55286 - SURFACE
    )
    :vars
    (
      ?auto_55292 - HOIST
      ?auto_55287 - PLACE
      ?auto_55289 - PLACE
      ?auto_55291 - HOIST
      ?auto_55290 - SURFACE
      ?auto_55288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55292 ?auto_55287 ) ( IS-CRATE ?auto_55286 ) ( not ( = ?auto_55285 ?auto_55286 ) ) ( not ( = ?auto_55284 ?auto_55285 ) ) ( not ( = ?auto_55284 ?auto_55286 ) ) ( not ( = ?auto_55289 ?auto_55287 ) ) ( HOIST-AT ?auto_55291 ?auto_55289 ) ( not ( = ?auto_55292 ?auto_55291 ) ) ( AVAILABLE ?auto_55291 ) ( SURFACE-AT ?auto_55286 ?auto_55289 ) ( ON ?auto_55286 ?auto_55290 ) ( CLEAR ?auto_55286 ) ( not ( = ?auto_55285 ?auto_55290 ) ) ( not ( = ?auto_55286 ?auto_55290 ) ) ( not ( = ?auto_55284 ?auto_55290 ) ) ( TRUCK-AT ?auto_55288 ?auto_55287 ) ( SURFACE-AT ?auto_55284 ?auto_55287 ) ( CLEAR ?auto_55284 ) ( LIFTING ?auto_55292 ?auto_55285 ) ( IS-CRATE ?auto_55285 ) ( ON ?auto_55284 ?auto_55283 ) ( not ( = ?auto_55283 ?auto_55284 ) ) ( not ( = ?auto_55283 ?auto_55285 ) ) ( not ( = ?auto_55283 ?auto_55286 ) ) ( not ( = ?auto_55283 ?auto_55290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55284 ?auto_55285 ?auto_55286 )
      ( MAKE-3CRATE-VERIFY ?auto_55283 ?auto_55284 ?auto_55285 ?auto_55286 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55311 - SURFACE
      ?auto_55312 - SURFACE
      ?auto_55313 - SURFACE
      ?auto_55314 - SURFACE
    )
    :vars
    (
      ?auto_55315 - HOIST
      ?auto_55320 - PLACE
      ?auto_55318 - PLACE
      ?auto_55316 - HOIST
      ?auto_55319 - SURFACE
      ?auto_55317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55315 ?auto_55320 ) ( IS-CRATE ?auto_55314 ) ( not ( = ?auto_55313 ?auto_55314 ) ) ( not ( = ?auto_55312 ?auto_55313 ) ) ( not ( = ?auto_55312 ?auto_55314 ) ) ( not ( = ?auto_55318 ?auto_55320 ) ) ( HOIST-AT ?auto_55316 ?auto_55318 ) ( not ( = ?auto_55315 ?auto_55316 ) ) ( AVAILABLE ?auto_55316 ) ( SURFACE-AT ?auto_55314 ?auto_55318 ) ( ON ?auto_55314 ?auto_55319 ) ( CLEAR ?auto_55314 ) ( not ( = ?auto_55313 ?auto_55319 ) ) ( not ( = ?auto_55314 ?auto_55319 ) ) ( not ( = ?auto_55312 ?auto_55319 ) ) ( TRUCK-AT ?auto_55317 ?auto_55320 ) ( SURFACE-AT ?auto_55312 ?auto_55320 ) ( CLEAR ?auto_55312 ) ( IS-CRATE ?auto_55313 ) ( AVAILABLE ?auto_55315 ) ( IN ?auto_55313 ?auto_55317 ) ( ON ?auto_55312 ?auto_55311 ) ( not ( = ?auto_55311 ?auto_55312 ) ) ( not ( = ?auto_55311 ?auto_55313 ) ) ( not ( = ?auto_55311 ?auto_55314 ) ) ( not ( = ?auto_55311 ?auto_55319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55312 ?auto_55313 ?auto_55314 )
      ( MAKE-3CRATE-VERIFY ?auto_55311 ?auto_55312 ?auto_55313 ?auto_55314 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55496 - SURFACE
      ?auto_55497 - SURFACE
    )
    :vars
    (
      ?auto_55504 - HOIST
      ?auto_55503 - PLACE
      ?auto_55501 - SURFACE
      ?auto_55498 - TRUCK
      ?auto_55500 - PLACE
      ?auto_55502 - HOIST
      ?auto_55499 - SURFACE
      ?auto_55505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55504 ?auto_55503 ) ( SURFACE-AT ?auto_55496 ?auto_55503 ) ( CLEAR ?auto_55496 ) ( IS-CRATE ?auto_55497 ) ( not ( = ?auto_55496 ?auto_55497 ) ) ( AVAILABLE ?auto_55504 ) ( ON ?auto_55496 ?auto_55501 ) ( not ( = ?auto_55501 ?auto_55496 ) ) ( not ( = ?auto_55501 ?auto_55497 ) ) ( TRUCK-AT ?auto_55498 ?auto_55500 ) ( not ( = ?auto_55500 ?auto_55503 ) ) ( HOIST-AT ?auto_55502 ?auto_55500 ) ( not ( = ?auto_55504 ?auto_55502 ) ) ( SURFACE-AT ?auto_55497 ?auto_55500 ) ( ON ?auto_55497 ?auto_55499 ) ( CLEAR ?auto_55497 ) ( not ( = ?auto_55496 ?auto_55499 ) ) ( not ( = ?auto_55497 ?auto_55499 ) ) ( not ( = ?auto_55501 ?auto_55499 ) ) ( LIFTING ?auto_55502 ?auto_55505 ) ( IS-CRATE ?auto_55505 ) ( not ( = ?auto_55496 ?auto_55505 ) ) ( not ( = ?auto_55497 ?auto_55505 ) ) ( not ( = ?auto_55501 ?auto_55505 ) ) ( not ( = ?auto_55499 ?auto_55505 ) ) )
    :subtasks
    ( ( !LOAD ?auto_55502 ?auto_55505 ?auto_55498 ?auto_55500 )
      ( MAKE-1CRATE ?auto_55496 ?auto_55497 )
      ( MAKE-1CRATE-VERIFY ?auto_55496 ?auto_55497 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55604 - SURFACE
      ?auto_55605 - SURFACE
      ?auto_55606 - SURFACE
      ?auto_55607 - SURFACE
      ?auto_55608 - SURFACE
    )
    :vars
    (
      ?auto_55609 - HOIST
      ?auto_55610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55609 ?auto_55610 ) ( SURFACE-AT ?auto_55607 ?auto_55610 ) ( CLEAR ?auto_55607 ) ( LIFTING ?auto_55609 ?auto_55608 ) ( IS-CRATE ?auto_55608 ) ( not ( = ?auto_55607 ?auto_55608 ) ) ( ON ?auto_55605 ?auto_55604 ) ( ON ?auto_55606 ?auto_55605 ) ( ON ?auto_55607 ?auto_55606 ) ( not ( = ?auto_55604 ?auto_55605 ) ) ( not ( = ?auto_55604 ?auto_55606 ) ) ( not ( = ?auto_55604 ?auto_55607 ) ) ( not ( = ?auto_55604 ?auto_55608 ) ) ( not ( = ?auto_55605 ?auto_55606 ) ) ( not ( = ?auto_55605 ?auto_55607 ) ) ( not ( = ?auto_55605 ?auto_55608 ) ) ( not ( = ?auto_55606 ?auto_55607 ) ) ( not ( = ?auto_55606 ?auto_55608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55607 ?auto_55608 )
      ( MAKE-4CRATE-VERIFY ?auto_55604 ?auto_55605 ?auto_55606 ?auto_55607 ?auto_55608 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55629 - SURFACE
      ?auto_55630 - SURFACE
      ?auto_55631 - SURFACE
      ?auto_55632 - SURFACE
      ?auto_55633 - SURFACE
    )
    :vars
    (
      ?auto_55635 - HOIST
      ?auto_55634 - PLACE
      ?auto_55636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55635 ?auto_55634 ) ( SURFACE-AT ?auto_55632 ?auto_55634 ) ( CLEAR ?auto_55632 ) ( IS-CRATE ?auto_55633 ) ( not ( = ?auto_55632 ?auto_55633 ) ) ( TRUCK-AT ?auto_55636 ?auto_55634 ) ( AVAILABLE ?auto_55635 ) ( IN ?auto_55633 ?auto_55636 ) ( ON ?auto_55632 ?auto_55631 ) ( not ( = ?auto_55631 ?auto_55632 ) ) ( not ( = ?auto_55631 ?auto_55633 ) ) ( ON ?auto_55630 ?auto_55629 ) ( ON ?auto_55631 ?auto_55630 ) ( not ( = ?auto_55629 ?auto_55630 ) ) ( not ( = ?auto_55629 ?auto_55631 ) ) ( not ( = ?auto_55629 ?auto_55632 ) ) ( not ( = ?auto_55629 ?auto_55633 ) ) ( not ( = ?auto_55630 ?auto_55631 ) ) ( not ( = ?auto_55630 ?auto_55632 ) ) ( not ( = ?auto_55630 ?auto_55633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55631 ?auto_55632 ?auto_55633 )
      ( MAKE-4CRATE-VERIFY ?auto_55629 ?auto_55630 ?auto_55631 ?auto_55632 ?auto_55633 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55659 - SURFACE
      ?auto_55660 - SURFACE
      ?auto_55661 - SURFACE
      ?auto_55662 - SURFACE
      ?auto_55663 - SURFACE
    )
    :vars
    (
      ?auto_55665 - HOIST
      ?auto_55666 - PLACE
      ?auto_55664 - TRUCK
      ?auto_55667 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55665 ?auto_55666 ) ( SURFACE-AT ?auto_55662 ?auto_55666 ) ( CLEAR ?auto_55662 ) ( IS-CRATE ?auto_55663 ) ( not ( = ?auto_55662 ?auto_55663 ) ) ( AVAILABLE ?auto_55665 ) ( IN ?auto_55663 ?auto_55664 ) ( ON ?auto_55662 ?auto_55661 ) ( not ( = ?auto_55661 ?auto_55662 ) ) ( not ( = ?auto_55661 ?auto_55663 ) ) ( TRUCK-AT ?auto_55664 ?auto_55667 ) ( not ( = ?auto_55667 ?auto_55666 ) ) ( ON ?auto_55660 ?auto_55659 ) ( ON ?auto_55661 ?auto_55660 ) ( not ( = ?auto_55659 ?auto_55660 ) ) ( not ( = ?auto_55659 ?auto_55661 ) ) ( not ( = ?auto_55659 ?auto_55662 ) ) ( not ( = ?auto_55659 ?auto_55663 ) ) ( not ( = ?auto_55660 ?auto_55661 ) ) ( not ( = ?auto_55660 ?auto_55662 ) ) ( not ( = ?auto_55660 ?auto_55663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55661 ?auto_55662 ?auto_55663 )
      ( MAKE-4CRATE-VERIFY ?auto_55659 ?auto_55660 ?auto_55661 ?auto_55662 ?auto_55663 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55693 - SURFACE
      ?auto_55694 - SURFACE
      ?auto_55695 - SURFACE
      ?auto_55696 - SURFACE
      ?auto_55697 - SURFACE
    )
    :vars
    (
      ?auto_55702 - HOIST
      ?auto_55701 - PLACE
      ?auto_55698 - TRUCK
      ?auto_55699 - PLACE
      ?auto_55700 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_55702 ?auto_55701 ) ( SURFACE-AT ?auto_55696 ?auto_55701 ) ( CLEAR ?auto_55696 ) ( IS-CRATE ?auto_55697 ) ( not ( = ?auto_55696 ?auto_55697 ) ) ( AVAILABLE ?auto_55702 ) ( ON ?auto_55696 ?auto_55695 ) ( not ( = ?auto_55695 ?auto_55696 ) ) ( not ( = ?auto_55695 ?auto_55697 ) ) ( TRUCK-AT ?auto_55698 ?auto_55699 ) ( not ( = ?auto_55699 ?auto_55701 ) ) ( HOIST-AT ?auto_55700 ?auto_55699 ) ( LIFTING ?auto_55700 ?auto_55697 ) ( not ( = ?auto_55702 ?auto_55700 ) ) ( ON ?auto_55694 ?auto_55693 ) ( ON ?auto_55695 ?auto_55694 ) ( not ( = ?auto_55693 ?auto_55694 ) ) ( not ( = ?auto_55693 ?auto_55695 ) ) ( not ( = ?auto_55693 ?auto_55696 ) ) ( not ( = ?auto_55693 ?auto_55697 ) ) ( not ( = ?auto_55694 ?auto_55695 ) ) ( not ( = ?auto_55694 ?auto_55696 ) ) ( not ( = ?auto_55694 ?auto_55697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55695 ?auto_55696 ?auto_55697 )
      ( MAKE-4CRATE-VERIFY ?auto_55693 ?auto_55694 ?auto_55695 ?auto_55696 ?auto_55697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55731 - SURFACE
      ?auto_55732 - SURFACE
      ?auto_55733 - SURFACE
      ?auto_55734 - SURFACE
      ?auto_55735 - SURFACE
    )
    :vars
    (
      ?auto_55740 - HOIST
      ?auto_55737 - PLACE
      ?auto_55739 - TRUCK
      ?auto_55736 - PLACE
      ?auto_55738 - HOIST
      ?auto_55741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55740 ?auto_55737 ) ( SURFACE-AT ?auto_55734 ?auto_55737 ) ( CLEAR ?auto_55734 ) ( IS-CRATE ?auto_55735 ) ( not ( = ?auto_55734 ?auto_55735 ) ) ( AVAILABLE ?auto_55740 ) ( ON ?auto_55734 ?auto_55733 ) ( not ( = ?auto_55733 ?auto_55734 ) ) ( not ( = ?auto_55733 ?auto_55735 ) ) ( TRUCK-AT ?auto_55739 ?auto_55736 ) ( not ( = ?auto_55736 ?auto_55737 ) ) ( HOIST-AT ?auto_55738 ?auto_55736 ) ( not ( = ?auto_55740 ?auto_55738 ) ) ( AVAILABLE ?auto_55738 ) ( SURFACE-AT ?auto_55735 ?auto_55736 ) ( ON ?auto_55735 ?auto_55741 ) ( CLEAR ?auto_55735 ) ( not ( = ?auto_55734 ?auto_55741 ) ) ( not ( = ?auto_55735 ?auto_55741 ) ) ( not ( = ?auto_55733 ?auto_55741 ) ) ( ON ?auto_55732 ?auto_55731 ) ( ON ?auto_55733 ?auto_55732 ) ( not ( = ?auto_55731 ?auto_55732 ) ) ( not ( = ?auto_55731 ?auto_55733 ) ) ( not ( = ?auto_55731 ?auto_55734 ) ) ( not ( = ?auto_55731 ?auto_55735 ) ) ( not ( = ?auto_55731 ?auto_55741 ) ) ( not ( = ?auto_55732 ?auto_55733 ) ) ( not ( = ?auto_55732 ?auto_55734 ) ) ( not ( = ?auto_55732 ?auto_55735 ) ) ( not ( = ?auto_55732 ?auto_55741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55733 ?auto_55734 ?auto_55735 )
      ( MAKE-4CRATE-VERIFY ?auto_55731 ?auto_55732 ?auto_55733 ?auto_55734 ?auto_55735 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55770 - SURFACE
      ?auto_55771 - SURFACE
      ?auto_55772 - SURFACE
      ?auto_55773 - SURFACE
      ?auto_55774 - SURFACE
    )
    :vars
    (
      ?auto_55780 - HOIST
      ?auto_55776 - PLACE
      ?auto_55775 - PLACE
      ?auto_55778 - HOIST
      ?auto_55779 - SURFACE
      ?auto_55777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55780 ?auto_55776 ) ( SURFACE-AT ?auto_55773 ?auto_55776 ) ( CLEAR ?auto_55773 ) ( IS-CRATE ?auto_55774 ) ( not ( = ?auto_55773 ?auto_55774 ) ) ( AVAILABLE ?auto_55780 ) ( ON ?auto_55773 ?auto_55772 ) ( not ( = ?auto_55772 ?auto_55773 ) ) ( not ( = ?auto_55772 ?auto_55774 ) ) ( not ( = ?auto_55775 ?auto_55776 ) ) ( HOIST-AT ?auto_55778 ?auto_55775 ) ( not ( = ?auto_55780 ?auto_55778 ) ) ( AVAILABLE ?auto_55778 ) ( SURFACE-AT ?auto_55774 ?auto_55775 ) ( ON ?auto_55774 ?auto_55779 ) ( CLEAR ?auto_55774 ) ( not ( = ?auto_55773 ?auto_55779 ) ) ( not ( = ?auto_55774 ?auto_55779 ) ) ( not ( = ?auto_55772 ?auto_55779 ) ) ( TRUCK-AT ?auto_55777 ?auto_55776 ) ( ON ?auto_55771 ?auto_55770 ) ( ON ?auto_55772 ?auto_55771 ) ( not ( = ?auto_55770 ?auto_55771 ) ) ( not ( = ?auto_55770 ?auto_55772 ) ) ( not ( = ?auto_55770 ?auto_55773 ) ) ( not ( = ?auto_55770 ?auto_55774 ) ) ( not ( = ?auto_55770 ?auto_55779 ) ) ( not ( = ?auto_55771 ?auto_55772 ) ) ( not ( = ?auto_55771 ?auto_55773 ) ) ( not ( = ?auto_55771 ?auto_55774 ) ) ( not ( = ?auto_55771 ?auto_55779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55772 ?auto_55773 ?auto_55774 )
      ( MAKE-4CRATE-VERIFY ?auto_55770 ?auto_55771 ?auto_55772 ?auto_55773 ?auto_55774 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55809 - SURFACE
      ?auto_55810 - SURFACE
      ?auto_55811 - SURFACE
      ?auto_55812 - SURFACE
      ?auto_55813 - SURFACE
    )
    :vars
    (
      ?auto_55815 - HOIST
      ?auto_55818 - PLACE
      ?auto_55819 - PLACE
      ?auto_55817 - HOIST
      ?auto_55814 - SURFACE
      ?auto_55816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55815 ?auto_55818 ) ( IS-CRATE ?auto_55813 ) ( not ( = ?auto_55812 ?auto_55813 ) ) ( not ( = ?auto_55811 ?auto_55812 ) ) ( not ( = ?auto_55811 ?auto_55813 ) ) ( not ( = ?auto_55819 ?auto_55818 ) ) ( HOIST-AT ?auto_55817 ?auto_55819 ) ( not ( = ?auto_55815 ?auto_55817 ) ) ( AVAILABLE ?auto_55817 ) ( SURFACE-AT ?auto_55813 ?auto_55819 ) ( ON ?auto_55813 ?auto_55814 ) ( CLEAR ?auto_55813 ) ( not ( = ?auto_55812 ?auto_55814 ) ) ( not ( = ?auto_55813 ?auto_55814 ) ) ( not ( = ?auto_55811 ?auto_55814 ) ) ( TRUCK-AT ?auto_55816 ?auto_55818 ) ( SURFACE-AT ?auto_55811 ?auto_55818 ) ( CLEAR ?auto_55811 ) ( LIFTING ?auto_55815 ?auto_55812 ) ( IS-CRATE ?auto_55812 ) ( ON ?auto_55810 ?auto_55809 ) ( ON ?auto_55811 ?auto_55810 ) ( not ( = ?auto_55809 ?auto_55810 ) ) ( not ( = ?auto_55809 ?auto_55811 ) ) ( not ( = ?auto_55809 ?auto_55812 ) ) ( not ( = ?auto_55809 ?auto_55813 ) ) ( not ( = ?auto_55809 ?auto_55814 ) ) ( not ( = ?auto_55810 ?auto_55811 ) ) ( not ( = ?auto_55810 ?auto_55812 ) ) ( not ( = ?auto_55810 ?auto_55813 ) ) ( not ( = ?auto_55810 ?auto_55814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55811 ?auto_55812 ?auto_55813 )
      ( MAKE-4CRATE-VERIFY ?auto_55809 ?auto_55810 ?auto_55811 ?auto_55812 ?auto_55813 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55848 - SURFACE
      ?auto_55849 - SURFACE
      ?auto_55850 - SURFACE
      ?auto_55851 - SURFACE
      ?auto_55852 - SURFACE
    )
    :vars
    (
      ?auto_55858 - HOIST
      ?auto_55855 - PLACE
      ?auto_55857 - PLACE
      ?auto_55853 - HOIST
      ?auto_55854 - SURFACE
      ?auto_55856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55858 ?auto_55855 ) ( IS-CRATE ?auto_55852 ) ( not ( = ?auto_55851 ?auto_55852 ) ) ( not ( = ?auto_55850 ?auto_55851 ) ) ( not ( = ?auto_55850 ?auto_55852 ) ) ( not ( = ?auto_55857 ?auto_55855 ) ) ( HOIST-AT ?auto_55853 ?auto_55857 ) ( not ( = ?auto_55858 ?auto_55853 ) ) ( AVAILABLE ?auto_55853 ) ( SURFACE-AT ?auto_55852 ?auto_55857 ) ( ON ?auto_55852 ?auto_55854 ) ( CLEAR ?auto_55852 ) ( not ( = ?auto_55851 ?auto_55854 ) ) ( not ( = ?auto_55852 ?auto_55854 ) ) ( not ( = ?auto_55850 ?auto_55854 ) ) ( TRUCK-AT ?auto_55856 ?auto_55855 ) ( SURFACE-AT ?auto_55850 ?auto_55855 ) ( CLEAR ?auto_55850 ) ( IS-CRATE ?auto_55851 ) ( AVAILABLE ?auto_55858 ) ( IN ?auto_55851 ?auto_55856 ) ( ON ?auto_55849 ?auto_55848 ) ( ON ?auto_55850 ?auto_55849 ) ( not ( = ?auto_55848 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55850 ) ) ( not ( = ?auto_55848 ?auto_55851 ) ) ( not ( = ?auto_55848 ?auto_55852 ) ) ( not ( = ?auto_55848 ?auto_55854 ) ) ( not ( = ?auto_55849 ?auto_55850 ) ) ( not ( = ?auto_55849 ?auto_55851 ) ) ( not ( = ?auto_55849 ?auto_55852 ) ) ( not ( = ?auto_55849 ?auto_55854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55850 ?auto_55851 ?auto_55852 )
      ( MAKE-4CRATE-VERIFY ?auto_55848 ?auto_55849 ?auto_55850 ?auto_55851 ?auto_55852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55859 - SURFACE
      ?auto_55860 - SURFACE
    )
    :vars
    (
      ?auto_55867 - HOIST
      ?auto_55864 - PLACE
      ?auto_55862 - SURFACE
      ?auto_55866 - PLACE
      ?auto_55861 - HOIST
      ?auto_55863 - SURFACE
      ?auto_55865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55867 ?auto_55864 ) ( IS-CRATE ?auto_55860 ) ( not ( = ?auto_55859 ?auto_55860 ) ) ( not ( = ?auto_55862 ?auto_55859 ) ) ( not ( = ?auto_55862 ?auto_55860 ) ) ( not ( = ?auto_55866 ?auto_55864 ) ) ( HOIST-AT ?auto_55861 ?auto_55866 ) ( not ( = ?auto_55867 ?auto_55861 ) ) ( AVAILABLE ?auto_55861 ) ( SURFACE-AT ?auto_55860 ?auto_55866 ) ( ON ?auto_55860 ?auto_55863 ) ( CLEAR ?auto_55860 ) ( not ( = ?auto_55859 ?auto_55863 ) ) ( not ( = ?auto_55860 ?auto_55863 ) ) ( not ( = ?auto_55862 ?auto_55863 ) ) ( SURFACE-AT ?auto_55862 ?auto_55864 ) ( CLEAR ?auto_55862 ) ( IS-CRATE ?auto_55859 ) ( AVAILABLE ?auto_55867 ) ( IN ?auto_55859 ?auto_55865 ) ( TRUCK-AT ?auto_55865 ?auto_55866 ) )
    :subtasks
    ( ( !DRIVE ?auto_55865 ?auto_55866 ?auto_55864 )
      ( MAKE-2CRATE ?auto_55862 ?auto_55859 ?auto_55860 )
      ( MAKE-1CRATE-VERIFY ?auto_55859 ?auto_55860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55868 - SURFACE
      ?auto_55869 - SURFACE
      ?auto_55870 - SURFACE
    )
    :vars
    (
      ?auto_55873 - HOIST
      ?auto_55871 - PLACE
      ?auto_55876 - PLACE
      ?auto_55875 - HOIST
      ?auto_55872 - SURFACE
      ?auto_55874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55873 ?auto_55871 ) ( IS-CRATE ?auto_55870 ) ( not ( = ?auto_55869 ?auto_55870 ) ) ( not ( = ?auto_55868 ?auto_55869 ) ) ( not ( = ?auto_55868 ?auto_55870 ) ) ( not ( = ?auto_55876 ?auto_55871 ) ) ( HOIST-AT ?auto_55875 ?auto_55876 ) ( not ( = ?auto_55873 ?auto_55875 ) ) ( AVAILABLE ?auto_55875 ) ( SURFACE-AT ?auto_55870 ?auto_55876 ) ( ON ?auto_55870 ?auto_55872 ) ( CLEAR ?auto_55870 ) ( not ( = ?auto_55869 ?auto_55872 ) ) ( not ( = ?auto_55870 ?auto_55872 ) ) ( not ( = ?auto_55868 ?auto_55872 ) ) ( SURFACE-AT ?auto_55868 ?auto_55871 ) ( CLEAR ?auto_55868 ) ( IS-CRATE ?auto_55869 ) ( AVAILABLE ?auto_55873 ) ( IN ?auto_55869 ?auto_55874 ) ( TRUCK-AT ?auto_55874 ?auto_55876 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55869 ?auto_55870 )
      ( MAKE-2CRATE-VERIFY ?auto_55868 ?auto_55869 ?auto_55870 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55877 - SURFACE
      ?auto_55878 - SURFACE
      ?auto_55879 - SURFACE
      ?auto_55880 - SURFACE
    )
    :vars
    (
      ?auto_55883 - HOIST
      ?auto_55886 - PLACE
      ?auto_55885 - PLACE
      ?auto_55884 - HOIST
      ?auto_55881 - SURFACE
      ?auto_55882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55883 ?auto_55886 ) ( IS-CRATE ?auto_55880 ) ( not ( = ?auto_55879 ?auto_55880 ) ) ( not ( = ?auto_55878 ?auto_55879 ) ) ( not ( = ?auto_55878 ?auto_55880 ) ) ( not ( = ?auto_55885 ?auto_55886 ) ) ( HOIST-AT ?auto_55884 ?auto_55885 ) ( not ( = ?auto_55883 ?auto_55884 ) ) ( AVAILABLE ?auto_55884 ) ( SURFACE-AT ?auto_55880 ?auto_55885 ) ( ON ?auto_55880 ?auto_55881 ) ( CLEAR ?auto_55880 ) ( not ( = ?auto_55879 ?auto_55881 ) ) ( not ( = ?auto_55880 ?auto_55881 ) ) ( not ( = ?auto_55878 ?auto_55881 ) ) ( SURFACE-AT ?auto_55878 ?auto_55886 ) ( CLEAR ?auto_55878 ) ( IS-CRATE ?auto_55879 ) ( AVAILABLE ?auto_55883 ) ( IN ?auto_55879 ?auto_55882 ) ( TRUCK-AT ?auto_55882 ?auto_55885 ) ( ON ?auto_55878 ?auto_55877 ) ( not ( = ?auto_55877 ?auto_55878 ) ) ( not ( = ?auto_55877 ?auto_55879 ) ) ( not ( = ?auto_55877 ?auto_55880 ) ) ( not ( = ?auto_55877 ?auto_55881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55878 ?auto_55879 ?auto_55880 )
      ( MAKE-3CRATE-VERIFY ?auto_55877 ?auto_55878 ?auto_55879 ?auto_55880 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55887 - SURFACE
      ?auto_55888 - SURFACE
      ?auto_55889 - SURFACE
      ?auto_55890 - SURFACE
      ?auto_55891 - SURFACE
    )
    :vars
    (
      ?auto_55894 - HOIST
      ?auto_55897 - PLACE
      ?auto_55896 - PLACE
      ?auto_55895 - HOIST
      ?auto_55892 - SURFACE
      ?auto_55893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55894 ?auto_55897 ) ( IS-CRATE ?auto_55891 ) ( not ( = ?auto_55890 ?auto_55891 ) ) ( not ( = ?auto_55889 ?auto_55890 ) ) ( not ( = ?auto_55889 ?auto_55891 ) ) ( not ( = ?auto_55896 ?auto_55897 ) ) ( HOIST-AT ?auto_55895 ?auto_55896 ) ( not ( = ?auto_55894 ?auto_55895 ) ) ( AVAILABLE ?auto_55895 ) ( SURFACE-AT ?auto_55891 ?auto_55896 ) ( ON ?auto_55891 ?auto_55892 ) ( CLEAR ?auto_55891 ) ( not ( = ?auto_55890 ?auto_55892 ) ) ( not ( = ?auto_55891 ?auto_55892 ) ) ( not ( = ?auto_55889 ?auto_55892 ) ) ( SURFACE-AT ?auto_55889 ?auto_55897 ) ( CLEAR ?auto_55889 ) ( IS-CRATE ?auto_55890 ) ( AVAILABLE ?auto_55894 ) ( IN ?auto_55890 ?auto_55893 ) ( TRUCK-AT ?auto_55893 ?auto_55896 ) ( ON ?auto_55888 ?auto_55887 ) ( ON ?auto_55889 ?auto_55888 ) ( not ( = ?auto_55887 ?auto_55888 ) ) ( not ( = ?auto_55887 ?auto_55889 ) ) ( not ( = ?auto_55887 ?auto_55890 ) ) ( not ( = ?auto_55887 ?auto_55891 ) ) ( not ( = ?auto_55887 ?auto_55892 ) ) ( not ( = ?auto_55888 ?auto_55889 ) ) ( not ( = ?auto_55888 ?auto_55890 ) ) ( not ( = ?auto_55888 ?auto_55891 ) ) ( not ( = ?auto_55888 ?auto_55892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55889 ?auto_55890 ?auto_55891 )
      ( MAKE-4CRATE-VERIFY ?auto_55887 ?auto_55888 ?auto_55889 ?auto_55890 ?auto_55891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55898 - SURFACE
      ?auto_55899 - SURFACE
    )
    :vars
    (
      ?auto_55903 - HOIST
      ?auto_55906 - PLACE
      ?auto_55900 - SURFACE
      ?auto_55905 - PLACE
      ?auto_55904 - HOIST
      ?auto_55901 - SURFACE
      ?auto_55902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55903 ?auto_55906 ) ( IS-CRATE ?auto_55899 ) ( not ( = ?auto_55898 ?auto_55899 ) ) ( not ( = ?auto_55900 ?auto_55898 ) ) ( not ( = ?auto_55900 ?auto_55899 ) ) ( not ( = ?auto_55905 ?auto_55906 ) ) ( HOIST-AT ?auto_55904 ?auto_55905 ) ( not ( = ?auto_55903 ?auto_55904 ) ) ( SURFACE-AT ?auto_55899 ?auto_55905 ) ( ON ?auto_55899 ?auto_55901 ) ( CLEAR ?auto_55899 ) ( not ( = ?auto_55898 ?auto_55901 ) ) ( not ( = ?auto_55899 ?auto_55901 ) ) ( not ( = ?auto_55900 ?auto_55901 ) ) ( SURFACE-AT ?auto_55900 ?auto_55906 ) ( CLEAR ?auto_55900 ) ( IS-CRATE ?auto_55898 ) ( AVAILABLE ?auto_55903 ) ( TRUCK-AT ?auto_55902 ?auto_55905 ) ( LIFTING ?auto_55904 ?auto_55898 ) )
    :subtasks
    ( ( !LOAD ?auto_55904 ?auto_55898 ?auto_55902 ?auto_55905 )
      ( MAKE-2CRATE ?auto_55900 ?auto_55898 ?auto_55899 )
      ( MAKE-1CRATE-VERIFY ?auto_55898 ?auto_55899 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55907 - SURFACE
      ?auto_55908 - SURFACE
      ?auto_55909 - SURFACE
    )
    :vars
    (
      ?auto_55910 - HOIST
      ?auto_55912 - PLACE
      ?auto_55911 - PLACE
      ?auto_55913 - HOIST
      ?auto_55915 - SURFACE
      ?auto_55914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55910 ?auto_55912 ) ( IS-CRATE ?auto_55909 ) ( not ( = ?auto_55908 ?auto_55909 ) ) ( not ( = ?auto_55907 ?auto_55908 ) ) ( not ( = ?auto_55907 ?auto_55909 ) ) ( not ( = ?auto_55911 ?auto_55912 ) ) ( HOIST-AT ?auto_55913 ?auto_55911 ) ( not ( = ?auto_55910 ?auto_55913 ) ) ( SURFACE-AT ?auto_55909 ?auto_55911 ) ( ON ?auto_55909 ?auto_55915 ) ( CLEAR ?auto_55909 ) ( not ( = ?auto_55908 ?auto_55915 ) ) ( not ( = ?auto_55909 ?auto_55915 ) ) ( not ( = ?auto_55907 ?auto_55915 ) ) ( SURFACE-AT ?auto_55907 ?auto_55912 ) ( CLEAR ?auto_55907 ) ( IS-CRATE ?auto_55908 ) ( AVAILABLE ?auto_55910 ) ( TRUCK-AT ?auto_55914 ?auto_55911 ) ( LIFTING ?auto_55913 ?auto_55908 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55908 ?auto_55909 )
      ( MAKE-2CRATE-VERIFY ?auto_55907 ?auto_55908 ?auto_55909 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55916 - SURFACE
      ?auto_55917 - SURFACE
      ?auto_55918 - SURFACE
      ?auto_55919 - SURFACE
    )
    :vars
    (
      ?auto_55924 - HOIST
      ?auto_55923 - PLACE
      ?auto_55920 - PLACE
      ?auto_55925 - HOIST
      ?auto_55922 - SURFACE
      ?auto_55921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55924 ?auto_55923 ) ( IS-CRATE ?auto_55919 ) ( not ( = ?auto_55918 ?auto_55919 ) ) ( not ( = ?auto_55917 ?auto_55918 ) ) ( not ( = ?auto_55917 ?auto_55919 ) ) ( not ( = ?auto_55920 ?auto_55923 ) ) ( HOIST-AT ?auto_55925 ?auto_55920 ) ( not ( = ?auto_55924 ?auto_55925 ) ) ( SURFACE-AT ?auto_55919 ?auto_55920 ) ( ON ?auto_55919 ?auto_55922 ) ( CLEAR ?auto_55919 ) ( not ( = ?auto_55918 ?auto_55922 ) ) ( not ( = ?auto_55919 ?auto_55922 ) ) ( not ( = ?auto_55917 ?auto_55922 ) ) ( SURFACE-AT ?auto_55917 ?auto_55923 ) ( CLEAR ?auto_55917 ) ( IS-CRATE ?auto_55918 ) ( AVAILABLE ?auto_55924 ) ( TRUCK-AT ?auto_55921 ?auto_55920 ) ( LIFTING ?auto_55925 ?auto_55918 ) ( ON ?auto_55917 ?auto_55916 ) ( not ( = ?auto_55916 ?auto_55917 ) ) ( not ( = ?auto_55916 ?auto_55918 ) ) ( not ( = ?auto_55916 ?auto_55919 ) ) ( not ( = ?auto_55916 ?auto_55922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55917 ?auto_55918 ?auto_55919 )
      ( MAKE-3CRATE-VERIFY ?auto_55916 ?auto_55917 ?auto_55918 ?auto_55919 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55926 - SURFACE
      ?auto_55927 - SURFACE
      ?auto_55928 - SURFACE
      ?auto_55929 - SURFACE
      ?auto_55930 - SURFACE
    )
    :vars
    (
      ?auto_55935 - HOIST
      ?auto_55934 - PLACE
      ?auto_55931 - PLACE
      ?auto_55936 - HOIST
      ?auto_55933 - SURFACE
      ?auto_55932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55935 ?auto_55934 ) ( IS-CRATE ?auto_55930 ) ( not ( = ?auto_55929 ?auto_55930 ) ) ( not ( = ?auto_55928 ?auto_55929 ) ) ( not ( = ?auto_55928 ?auto_55930 ) ) ( not ( = ?auto_55931 ?auto_55934 ) ) ( HOIST-AT ?auto_55936 ?auto_55931 ) ( not ( = ?auto_55935 ?auto_55936 ) ) ( SURFACE-AT ?auto_55930 ?auto_55931 ) ( ON ?auto_55930 ?auto_55933 ) ( CLEAR ?auto_55930 ) ( not ( = ?auto_55929 ?auto_55933 ) ) ( not ( = ?auto_55930 ?auto_55933 ) ) ( not ( = ?auto_55928 ?auto_55933 ) ) ( SURFACE-AT ?auto_55928 ?auto_55934 ) ( CLEAR ?auto_55928 ) ( IS-CRATE ?auto_55929 ) ( AVAILABLE ?auto_55935 ) ( TRUCK-AT ?auto_55932 ?auto_55931 ) ( LIFTING ?auto_55936 ?auto_55929 ) ( ON ?auto_55927 ?auto_55926 ) ( ON ?auto_55928 ?auto_55927 ) ( not ( = ?auto_55926 ?auto_55927 ) ) ( not ( = ?auto_55926 ?auto_55928 ) ) ( not ( = ?auto_55926 ?auto_55929 ) ) ( not ( = ?auto_55926 ?auto_55930 ) ) ( not ( = ?auto_55926 ?auto_55933 ) ) ( not ( = ?auto_55927 ?auto_55928 ) ) ( not ( = ?auto_55927 ?auto_55929 ) ) ( not ( = ?auto_55927 ?auto_55930 ) ) ( not ( = ?auto_55927 ?auto_55933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55928 ?auto_55929 ?auto_55930 )
      ( MAKE-4CRATE-VERIFY ?auto_55926 ?auto_55927 ?auto_55928 ?auto_55929 ?auto_55930 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55937 - SURFACE
      ?auto_55938 - SURFACE
    )
    :vars
    (
      ?auto_55944 - HOIST
      ?auto_55942 - PLACE
      ?auto_55943 - SURFACE
      ?auto_55939 - PLACE
      ?auto_55945 - HOIST
      ?auto_55941 - SURFACE
      ?auto_55940 - TRUCK
      ?auto_55946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55944 ?auto_55942 ) ( IS-CRATE ?auto_55938 ) ( not ( = ?auto_55937 ?auto_55938 ) ) ( not ( = ?auto_55943 ?auto_55937 ) ) ( not ( = ?auto_55943 ?auto_55938 ) ) ( not ( = ?auto_55939 ?auto_55942 ) ) ( HOIST-AT ?auto_55945 ?auto_55939 ) ( not ( = ?auto_55944 ?auto_55945 ) ) ( SURFACE-AT ?auto_55938 ?auto_55939 ) ( ON ?auto_55938 ?auto_55941 ) ( CLEAR ?auto_55938 ) ( not ( = ?auto_55937 ?auto_55941 ) ) ( not ( = ?auto_55938 ?auto_55941 ) ) ( not ( = ?auto_55943 ?auto_55941 ) ) ( SURFACE-AT ?auto_55943 ?auto_55942 ) ( CLEAR ?auto_55943 ) ( IS-CRATE ?auto_55937 ) ( AVAILABLE ?auto_55944 ) ( TRUCK-AT ?auto_55940 ?auto_55939 ) ( AVAILABLE ?auto_55945 ) ( SURFACE-AT ?auto_55937 ?auto_55939 ) ( ON ?auto_55937 ?auto_55946 ) ( CLEAR ?auto_55937 ) ( not ( = ?auto_55937 ?auto_55946 ) ) ( not ( = ?auto_55938 ?auto_55946 ) ) ( not ( = ?auto_55943 ?auto_55946 ) ) ( not ( = ?auto_55941 ?auto_55946 ) ) )
    :subtasks
    ( ( !LIFT ?auto_55945 ?auto_55937 ?auto_55946 ?auto_55939 )
      ( MAKE-2CRATE ?auto_55943 ?auto_55937 ?auto_55938 )
      ( MAKE-1CRATE-VERIFY ?auto_55937 ?auto_55938 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55947 - SURFACE
      ?auto_55948 - SURFACE
      ?auto_55949 - SURFACE
    )
    :vars
    (
      ?auto_55952 - HOIST
      ?auto_55956 - PLACE
      ?auto_55950 - PLACE
      ?auto_55954 - HOIST
      ?auto_55953 - SURFACE
      ?auto_55955 - TRUCK
      ?auto_55951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55952 ?auto_55956 ) ( IS-CRATE ?auto_55949 ) ( not ( = ?auto_55948 ?auto_55949 ) ) ( not ( = ?auto_55947 ?auto_55948 ) ) ( not ( = ?auto_55947 ?auto_55949 ) ) ( not ( = ?auto_55950 ?auto_55956 ) ) ( HOIST-AT ?auto_55954 ?auto_55950 ) ( not ( = ?auto_55952 ?auto_55954 ) ) ( SURFACE-AT ?auto_55949 ?auto_55950 ) ( ON ?auto_55949 ?auto_55953 ) ( CLEAR ?auto_55949 ) ( not ( = ?auto_55948 ?auto_55953 ) ) ( not ( = ?auto_55949 ?auto_55953 ) ) ( not ( = ?auto_55947 ?auto_55953 ) ) ( SURFACE-AT ?auto_55947 ?auto_55956 ) ( CLEAR ?auto_55947 ) ( IS-CRATE ?auto_55948 ) ( AVAILABLE ?auto_55952 ) ( TRUCK-AT ?auto_55955 ?auto_55950 ) ( AVAILABLE ?auto_55954 ) ( SURFACE-AT ?auto_55948 ?auto_55950 ) ( ON ?auto_55948 ?auto_55951 ) ( CLEAR ?auto_55948 ) ( not ( = ?auto_55948 ?auto_55951 ) ) ( not ( = ?auto_55949 ?auto_55951 ) ) ( not ( = ?auto_55947 ?auto_55951 ) ) ( not ( = ?auto_55953 ?auto_55951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55948 ?auto_55949 )
      ( MAKE-2CRATE-VERIFY ?auto_55947 ?auto_55948 ?auto_55949 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_55957 - SURFACE
      ?auto_55958 - SURFACE
      ?auto_55959 - SURFACE
      ?auto_55960 - SURFACE
    )
    :vars
    (
      ?auto_55964 - HOIST
      ?auto_55966 - PLACE
      ?auto_55965 - PLACE
      ?auto_55963 - HOIST
      ?auto_55962 - SURFACE
      ?auto_55967 - TRUCK
      ?auto_55961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55964 ?auto_55966 ) ( IS-CRATE ?auto_55960 ) ( not ( = ?auto_55959 ?auto_55960 ) ) ( not ( = ?auto_55958 ?auto_55959 ) ) ( not ( = ?auto_55958 ?auto_55960 ) ) ( not ( = ?auto_55965 ?auto_55966 ) ) ( HOIST-AT ?auto_55963 ?auto_55965 ) ( not ( = ?auto_55964 ?auto_55963 ) ) ( SURFACE-AT ?auto_55960 ?auto_55965 ) ( ON ?auto_55960 ?auto_55962 ) ( CLEAR ?auto_55960 ) ( not ( = ?auto_55959 ?auto_55962 ) ) ( not ( = ?auto_55960 ?auto_55962 ) ) ( not ( = ?auto_55958 ?auto_55962 ) ) ( SURFACE-AT ?auto_55958 ?auto_55966 ) ( CLEAR ?auto_55958 ) ( IS-CRATE ?auto_55959 ) ( AVAILABLE ?auto_55964 ) ( TRUCK-AT ?auto_55967 ?auto_55965 ) ( AVAILABLE ?auto_55963 ) ( SURFACE-AT ?auto_55959 ?auto_55965 ) ( ON ?auto_55959 ?auto_55961 ) ( CLEAR ?auto_55959 ) ( not ( = ?auto_55959 ?auto_55961 ) ) ( not ( = ?auto_55960 ?auto_55961 ) ) ( not ( = ?auto_55958 ?auto_55961 ) ) ( not ( = ?auto_55962 ?auto_55961 ) ) ( ON ?auto_55958 ?auto_55957 ) ( not ( = ?auto_55957 ?auto_55958 ) ) ( not ( = ?auto_55957 ?auto_55959 ) ) ( not ( = ?auto_55957 ?auto_55960 ) ) ( not ( = ?auto_55957 ?auto_55962 ) ) ( not ( = ?auto_55957 ?auto_55961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55958 ?auto_55959 ?auto_55960 )
      ( MAKE-3CRATE-VERIFY ?auto_55957 ?auto_55958 ?auto_55959 ?auto_55960 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_55968 - SURFACE
      ?auto_55969 - SURFACE
      ?auto_55970 - SURFACE
      ?auto_55971 - SURFACE
      ?auto_55972 - SURFACE
    )
    :vars
    (
      ?auto_55976 - HOIST
      ?auto_55978 - PLACE
      ?auto_55977 - PLACE
      ?auto_55975 - HOIST
      ?auto_55974 - SURFACE
      ?auto_55979 - TRUCK
      ?auto_55973 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55976 ?auto_55978 ) ( IS-CRATE ?auto_55972 ) ( not ( = ?auto_55971 ?auto_55972 ) ) ( not ( = ?auto_55970 ?auto_55971 ) ) ( not ( = ?auto_55970 ?auto_55972 ) ) ( not ( = ?auto_55977 ?auto_55978 ) ) ( HOIST-AT ?auto_55975 ?auto_55977 ) ( not ( = ?auto_55976 ?auto_55975 ) ) ( SURFACE-AT ?auto_55972 ?auto_55977 ) ( ON ?auto_55972 ?auto_55974 ) ( CLEAR ?auto_55972 ) ( not ( = ?auto_55971 ?auto_55974 ) ) ( not ( = ?auto_55972 ?auto_55974 ) ) ( not ( = ?auto_55970 ?auto_55974 ) ) ( SURFACE-AT ?auto_55970 ?auto_55978 ) ( CLEAR ?auto_55970 ) ( IS-CRATE ?auto_55971 ) ( AVAILABLE ?auto_55976 ) ( TRUCK-AT ?auto_55979 ?auto_55977 ) ( AVAILABLE ?auto_55975 ) ( SURFACE-AT ?auto_55971 ?auto_55977 ) ( ON ?auto_55971 ?auto_55973 ) ( CLEAR ?auto_55971 ) ( not ( = ?auto_55971 ?auto_55973 ) ) ( not ( = ?auto_55972 ?auto_55973 ) ) ( not ( = ?auto_55970 ?auto_55973 ) ) ( not ( = ?auto_55974 ?auto_55973 ) ) ( ON ?auto_55969 ?auto_55968 ) ( ON ?auto_55970 ?auto_55969 ) ( not ( = ?auto_55968 ?auto_55969 ) ) ( not ( = ?auto_55968 ?auto_55970 ) ) ( not ( = ?auto_55968 ?auto_55971 ) ) ( not ( = ?auto_55968 ?auto_55972 ) ) ( not ( = ?auto_55968 ?auto_55974 ) ) ( not ( = ?auto_55968 ?auto_55973 ) ) ( not ( = ?auto_55969 ?auto_55970 ) ) ( not ( = ?auto_55969 ?auto_55971 ) ) ( not ( = ?auto_55969 ?auto_55972 ) ) ( not ( = ?auto_55969 ?auto_55974 ) ) ( not ( = ?auto_55969 ?auto_55973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_55970 ?auto_55971 ?auto_55972 )
      ( MAKE-4CRATE-VERIFY ?auto_55968 ?auto_55969 ?auto_55970 ?auto_55971 ?auto_55972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_55980 - SURFACE
      ?auto_55981 - SURFACE
    )
    :vars
    (
      ?auto_55985 - HOIST
      ?auto_55987 - PLACE
      ?auto_55989 - SURFACE
      ?auto_55986 - PLACE
      ?auto_55984 - HOIST
      ?auto_55983 - SURFACE
      ?auto_55982 - SURFACE
      ?auto_55988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55985 ?auto_55987 ) ( IS-CRATE ?auto_55981 ) ( not ( = ?auto_55980 ?auto_55981 ) ) ( not ( = ?auto_55989 ?auto_55980 ) ) ( not ( = ?auto_55989 ?auto_55981 ) ) ( not ( = ?auto_55986 ?auto_55987 ) ) ( HOIST-AT ?auto_55984 ?auto_55986 ) ( not ( = ?auto_55985 ?auto_55984 ) ) ( SURFACE-AT ?auto_55981 ?auto_55986 ) ( ON ?auto_55981 ?auto_55983 ) ( CLEAR ?auto_55981 ) ( not ( = ?auto_55980 ?auto_55983 ) ) ( not ( = ?auto_55981 ?auto_55983 ) ) ( not ( = ?auto_55989 ?auto_55983 ) ) ( SURFACE-AT ?auto_55989 ?auto_55987 ) ( CLEAR ?auto_55989 ) ( IS-CRATE ?auto_55980 ) ( AVAILABLE ?auto_55985 ) ( AVAILABLE ?auto_55984 ) ( SURFACE-AT ?auto_55980 ?auto_55986 ) ( ON ?auto_55980 ?auto_55982 ) ( CLEAR ?auto_55980 ) ( not ( = ?auto_55980 ?auto_55982 ) ) ( not ( = ?auto_55981 ?auto_55982 ) ) ( not ( = ?auto_55989 ?auto_55982 ) ) ( not ( = ?auto_55983 ?auto_55982 ) ) ( TRUCK-AT ?auto_55988 ?auto_55987 ) )
    :subtasks
    ( ( !DRIVE ?auto_55988 ?auto_55987 ?auto_55986 )
      ( MAKE-2CRATE ?auto_55989 ?auto_55980 ?auto_55981 )
      ( MAKE-1CRATE-VERIFY ?auto_55980 ?auto_55981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_55990 - SURFACE
      ?auto_55991 - SURFACE
      ?auto_55992 - SURFACE
    )
    :vars
    (
      ?auto_55995 - HOIST
      ?auto_55999 - PLACE
      ?auto_55994 - PLACE
      ?auto_55996 - HOIST
      ?auto_55997 - SURFACE
      ?auto_55993 - SURFACE
      ?auto_55998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_55995 ?auto_55999 ) ( IS-CRATE ?auto_55992 ) ( not ( = ?auto_55991 ?auto_55992 ) ) ( not ( = ?auto_55990 ?auto_55991 ) ) ( not ( = ?auto_55990 ?auto_55992 ) ) ( not ( = ?auto_55994 ?auto_55999 ) ) ( HOIST-AT ?auto_55996 ?auto_55994 ) ( not ( = ?auto_55995 ?auto_55996 ) ) ( SURFACE-AT ?auto_55992 ?auto_55994 ) ( ON ?auto_55992 ?auto_55997 ) ( CLEAR ?auto_55992 ) ( not ( = ?auto_55991 ?auto_55997 ) ) ( not ( = ?auto_55992 ?auto_55997 ) ) ( not ( = ?auto_55990 ?auto_55997 ) ) ( SURFACE-AT ?auto_55990 ?auto_55999 ) ( CLEAR ?auto_55990 ) ( IS-CRATE ?auto_55991 ) ( AVAILABLE ?auto_55995 ) ( AVAILABLE ?auto_55996 ) ( SURFACE-AT ?auto_55991 ?auto_55994 ) ( ON ?auto_55991 ?auto_55993 ) ( CLEAR ?auto_55991 ) ( not ( = ?auto_55991 ?auto_55993 ) ) ( not ( = ?auto_55992 ?auto_55993 ) ) ( not ( = ?auto_55990 ?auto_55993 ) ) ( not ( = ?auto_55997 ?auto_55993 ) ) ( TRUCK-AT ?auto_55998 ?auto_55999 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_55991 ?auto_55992 )
      ( MAKE-2CRATE-VERIFY ?auto_55990 ?auto_55991 ?auto_55992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_56000 - SURFACE
      ?auto_56001 - SURFACE
      ?auto_56002 - SURFACE
      ?auto_56003 - SURFACE
    )
    :vars
    (
      ?auto_56008 - HOIST
      ?auto_56004 - PLACE
      ?auto_56007 - PLACE
      ?auto_56010 - HOIST
      ?auto_56006 - SURFACE
      ?auto_56005 - SURFACE
      ?auto_56009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56008 ?auto_56004 ) ( IS-CRATE ?auto_56003 ) ( not ( = ?auto_56002 ?auto_56003 ) ) ( not ( = ?auto_56001 ?auto_56002 ) ) ( not ( = ?auto_56001 ?auto_56003 ) ) ( not ( = ?auto_56007 ?auto_56004 ) ) ( HOIST-AT ?auto_56010 ?auto_56007 ) ( not ( = ?auto_56008 ?auto_56010 ) ) ( SURFACE-AT ?auto_56003 ?auto_56007 ) ( ON ?auto_56003 ?auto_56006 ) ( CLEAR ?auto_56003 ) ( not ( = ?auto_56002 ?auto_56006 ) ) ( not ( = ?auto_56003 ?auto_56006 ) ) ( not ( = ?auto_56001 ?auto_56006 ) ) ( SURFACE-AT ?auto_56001 ?auto_56004 ) ( CLEAR ?auto_56001 ) ( IS-CRATE ?auto_56002 ) ( AVAILABLE ?auto_56008 ) ( AVAILABLE ?auto_56010 ) ( SURFACE-AT ?auto_56002 ?auto_56007 ) ( ON ?auto_56002 ?auto_56005 ) ( CLEAR ?auto_56002 ) ( not ( = ?auto_56002 ?auto_56005 ) ) ( not ( = ?auto_56003 ?auto_56005 ) ) ( not ( = ?auto_56001 ?auto_56005 ) ) ( not ( = ?auto_56006 ?auto_56005 ) ) ( TRUCK-AT ?auto_56009 ?auto_56004 ) ( ON ?auto_56001 ?auto_56000 ) ( not ( = ?auto_56000 ?auto_56001 ) ) ( not ( = ?auto_56000 ?auto_56002 ) ) ( not ( = ?auto_56000 ?auto_56003 ) ) ( not ( = ?auto_56000 ?auto_56006 ) ) ( not ( = ?auto_56000 ?auto_56005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56001 ?auto_56002 ?auto_56003 )
      ( MAKE-3CRATE-VERIFY ?auto_56000 ?auto_56001 ?auto_56002 ?auto_56003 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_56011 - SURFACE
      ?auto_56012 - SURFACE
      ?auto_56013 - SURFACE
      ?auto_56014 - SURFACE
      ?auto_56015 - SURFACE
    )
    :vars
    (
      ?auto_56020 - HOIST
      ?auto_56016 - PLACE
      ?auto_56019 - PLACE
      ?auto_56022 - HOIST
      ?auto_56018 - SURFACE
      ?auto_56017 - SURFACE
      ?auto_56021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56020 ?auto_56016 ) ( IS-CRATE ?auto_56015 ) ( not ( = ?auto_56014 ?auto_56015 ) ) ( not ( = ?auto_56013 ?auto_56014 ) ) ( not ( = ?auto_56013 ?auto_56015 ) ) ( not ( = ?auto_56019 ?auto_56016 ) ) ( HOIST-AT ?auto_56022 ?auto_56019 ) ( not ( = ?auto_56020 ?auto_56022 ) ) ( SURFACE-AT ?auto_56015 ?auto_56019 ) ( ON ?auto_56015 ?auto_56018 ) ( CLEAR ?auto_56015 ) ( not ( = ?auto_56014 ?auto_56018 ) ) ( not ( = ?auto_56015 ?auto_56018 ) ) ( not ( = ?auto_56013 ?auto_56018 ) ) ( SURFACE-AT ?auto_56013 ?auto_56016 ) ( CLEAR ?auto_56013 ) ( IS-CRATE ?auto_56014 ) ( AVAILABLE ?auto_56020 ) ( AVAILABLE ?auto_56022 ) ( SURFACE-AT ?auto_56014 ?auto_56019 ) ( ON ?auto_56014 ?auto_56017 ) ( CLEAR ?auto_56014 ) ( not ( = ?auto_56014 ?auto_56017 ) ) ( not ( = ?auto_56015 ?auto_56017 ) ) ( not ( = ?auto_56013 ?auto_56017 ) ) ( not ( = ?auto_56018 ?auto_56017 ) ) ( TRUCK-AT ?auto_56021 ?auto_56016 ) ( ON ?auto_56012 ?auto_56011 ) ( ON ?auto_56013 ?auto_56012 ) ( not ( = ?auto_56011 ?auto_56012 ) ) ( not ( = ?auto_56011 ?auto_56013 ) ) ( not ( = ?auto_56011 ?auto_56014 ) ) ( not ( = ?auto_56011 ?auto_56015 ) ) ( not ( = ?auto_56011 ?auto_56018 ) ) ( not ( = ?auto_56011 ?auto_56017 ) ) ( not ( = ?auto_56012 ?auto_56013 ) ) ( not ( = ?auto_56012 ?auto_56014 ) ) ( not ( = ?auto_56012 ?auto_56015 ) ) ( not ( = ?auto_56012 ?auto_56018 ) ) ( not ( = ?auto_56012 ?auto_56017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56013 ?auto_56014 ?auto_56015 )
      ( MAKE-4CRATE-VERIFY ?auto_56011 ?auto_56012 ?auto_56013 ?auto_56014 ?auto_56015 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_56023 - SURFACE
      ?auto_56024 - SURFACE
    )
    :vars
    (
      ?auto_56029 - HOIST
      ?auto_56025 - PLACE
      ?auto_56032 - SURFACE
      ?auto_56028 - PLACE
      ?auto_56031 - HOIST
      ?auto_56027 - SURFACE
      ?auto_56026 - SURFACE
      ?auto_56030 - TRUCK
      ?auto_56033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56029 ?auto_56025 ) ( IS-CRATE ?auto_56024 ) ( not ( = ?auto_56023 ?auto_56024 ) ) ( not ( = ?auto_56032 ?auto_56023 ) ) ( not ( = ?auto_56032 ?auto_56024 ) ) ( not ( = ?auto_56028 ?auto_56025 ) ) ( HOIST-AT ?auto_56031 ?auto_56028 ) ( not ( = ?auto_56029 ?auto_56031 ) ) ( SURFACE-AT ?auto_56024 ?auto_56028 ) ( ON ?auto_56024 ?auto_56027 ) ( CLEAR ?auto_56024 ) ( not ( = ?auto_56023 ?auto_56027 ) ) ( not ( = ?auto_56024 ?auto_56027 ) ) ( not ( = ?auto_56032 ?auto_56027 ) ) ( IS-CRATE ?auto_56023 ) ( AVAILABLE ?auto_56031 ) ( SURFACE-AT ?auto_56023 ?auto_56028 ) ( ON ?auto_56023 ?auto_56026 ) ( CLEAR ?auto_56023 ) ( not ( = ?auto_56023 ?auto_56026 ) ) ( not ( = ?auto_56024 ?auto_56026 ) ) ( not ( = ?auto_56032 ?auto_56026 ) ) ( not ( = ?auto_56027 ?auto_56026 ) ) ( TRUCK-AT ?auto_56030 ?auto_56025 ) ( SURFACE-AT ?auto_56033 ?auto_56025 ) ( CLEAR ?auto_56033 ) ( LIFTING ?auto_56029 ?auto_56032 ) ( IS-CRATE ?auto_56032 ) ( not ( = ?auto_56033 ?auto_56032 ) ) ( not ( = ?auto_56023 ?auto_56033 ) ) ( not ( = ?auto_56024 ?auto_56033 ) ) ( not ( = ?auto_56027 ?auto_56033 ) ) ( not ( = ?auto_56026 ?auto_56033 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56033 ?auto_56032 )
      ( MAKE-2CRATE ?auto_56032 ?auto_56023 ?auto_56024 )
      ( MAKE-1CRATE-VERIFY ?auto_56023 ?auto_56024 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_56034 - SURFACE
      ?auto_56035 - SURFACE
      ?auto_56036 - SURFACE
    )
    :vars
    (
      ?auto_56044 - HOIST
      ?auto_56040 - PLACE
      ?auto_56038 - PLACE
      ?auto_56042 - HOIST
      ?auto_56037 - SURFACE
      ?auto_56041 - SURFACE
      ?auto_56039 - TRUCK
      ?auto_56043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56044 ?auto_56040 ) ( IS-CRATE ?auto_56036 ) ( not ( = ?auto_56035 ?auto_56036 ) ) ( not ( = ?auto_56034 ?auto_56035 ) ) ( not ( = ?auto_56034 ?auto_56036 ) ) ( not ( = ?auto_56038 ?auto_56040 ) ) ( HOIST-AT ?auto_56042 ?auto_56038 ) ( not ( = ?auto_56044 ?auto_56042 ) ) ( SURFACE-AT ?auto_56036 ?auto_56038 ) ( ON ?auto_56036 ?auto_56037 ) ( CLEAR ?auto_56036 ) ( not ( = ?auto_56035 ?auto_56037 ) ) ( not ( = ?auto_56036 ?auto_56037 ) ) ( not ( = ?auto_56034 ?auto_56037 ) ) ( IS-CRATE ?auto_56035 ) ( AVAILABLE ?auto_56042 ) ( SURFACE-AT ?auto_56035 ?auto_56038 ) ( ON ?auto_56035 ?auto_56041 ) ( CLEAR ?auto_56035 ) ( not ( = ?auto_56035 ?auto_56041 ) ) ( not ( = ?auto_56036 ?auto_56041 ) ) ( not ( = ?auto_56034 ?auto_56041 ) ) ( not ( = ?auto_56037 ?auto_56041 ) ) ( TRUCK-AT ?auto_56039 ?auto_56040 ) ( SURFACE-AT ?auto_56043 ?auto_56040 ) ( CLEAR ?auto_56043 ) ( LIFTING ?auto_56044 ?auto_56034 ) ( IS-CRATE ?auto_56034 ) ( not ( = ?auto_56043 ?auto_56034 ) ) ( not ( = ?auto_56035 ?auto_56043 ) ) ( not ( = ?auto_56036 ?auto_56043 ) ) ( not ( = ?auto_56037 ?auto_56043 ) ) ( not ( = ?auto_56041 ?auto_56043 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56035 ?auto_56036 )
      ( MAKE-2CRATE-VERIFY ?auto_56034 ?auto_56035 ?auto_56036 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_56045 - SURFACE
      ?auto_56046 - SURFACE
      ?auto_56047 - SURFACE
      ?auto_56048 - SURFACE
    )
    :vars
    (
      ?auto_56053 - HOIST
      ?auto_56054 - PLACE
      ?auto_56049 - PLACE
      ?auto_56050 - HOIST
      ?auto_56051 - SURFACE
      ?auto_56055 - SURFACE
      ?auto_56052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56053 ?auto_56054 ) ( IS-CRATE ?auto_56048 ) ( not ( = ?auto_56047 ?auto_56048 ) ) ( not ( = ?auto_56046 ?auto_56047 ) ) ( not ( = ?auto_56046 ?auto_56048 ) ) ( not ( = ?auto_56049 ?auto_56054 ) ) ( HOIST-AT ?auto_56050 ?auto_56049 ) ( not ( = ?auto_56053 ?auto_56050 ) ) ( SURFACE-AT ?auto_56048 ?auto_56049 ) ( ON ?auto_56048 ?auto_56051 ) ( CLEAR ?auto_56048 ) ( not ( = ?auto_56047 ?auto_56051 ) ) ( not ( = ?auto_56048 ?auto_56051 ) ) ( not ( = ?auto_56046 ?auto_56051 ) ) ( IS-CRATE ?auto_56047 ) ( AVAILABLE ?auto_56050 ) ( SURFACE-AT ?auto_56047 ?auto_56049 ) ( ON ?auto_56047 ?auto_56055 ) ( CLEAR ?auto_56047 ) ( not ( = ?auto_56047 ?auto_56055 ) ) ( not ( = ?auto_56048 ?auto_56055 ) ) ( not ( = ?auto_56046 ?auto_56055 ) ) ( not ( = ?auto_56051 ?auto_56055 ) ) ( TRUCK-AT ?auto_56052 ?auto_56054 ) ( SURFACE-AT ?auto_56045 ?auto_56054 ) ( CLEAR ?auto_56045 ) ( LIFTING ?auto_56053 ?auto_56046 ) ( IS-CRATE ?auto_56046 ) ( not ( = ?auto_56045 ?auto_56046 ) ) ( not ( = ?auto_56047 ?auto_56045 ) ) ( not ( = ?auto_56048 ?auto_56045 ) ) ( not ( = ?auto_56051 ?auto_56045 ) ) ( not ( = ?auto_56055 ?auto_56045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56046 ?auto_56047 ?auto_56048 )
      ( MAKE-3CRATE-VERIFY ?auto_56045 ?auto_56046 ?auto_56047 ?auto_56048 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_56056 - SURFACE
      ?auto_56057 - SURFACE
      ?auto_56058 - SURFACE
      ?auto_56059 - SURFACE
      ?auto_56060 - SURFACE
    )
    :vars
    (
      ?auto_56065 - HOIST
      ?auto_56066 - PLACE
      ?auto_56061 - PLACE
      ?auto_56062 - HOIST
      ?auto_56063 - SURFACE
      ?auto_56067 - SURFACE
      ?auto_56064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56065 ?auto_56066 ) ( IS-CRATE ?auto_56060 ) ( not ( = ?auto_56059 ?auto_56060 ) ) ( not ( = ?auto_56058 ?auto_56059 ) ) ( not ( = ?auto_56058 ?auto_56060 ) ) ( not ( = ?auto_56061 ?auto_56066 ) ) ( HOIST-AT ?auto_56062 ?auto_56061 ) ( not ( = ?auto_56065 ?auto_56062 ) ) ( SURFACE-AT ?auto_56060 ?auto_56061 ) ( ON ?auto_56060 ?auto_56063 ) ( CLEAR ?auto_56060 ) ( not ( = ?auto_56059 ?auto_56063 ) ) ( not ( = ?auto_56060 ?auto_56063 ) ) ( not ( = ?auto_56058 ?auto_56063 ) ) ( IS-CRATE ?auto_56059 ) ( AVAILABLE ?auto_56062 ) ( SURFACE-AT ?auto_56059 ?auto_56061 ) ( ON ?auto_56059 ?auto_56067 ) ( CLEAR ?auto_56059 ) ( not ( = ?auto_56059 ?auto_56067 ) ) ( not ( = ?auto_56060 ?auto_56067 ) ) ( not ( = ?auto_56058 ?auto_56067 ) ) ( not ( = ?auto_56063 ?auto_56067 ) ) ( TRUCK-AT ?auto_56064 ?auto_56066 ) ( SURFACE-AT ?auto_56057 ?auto_56066 ) ( CLEAR ?auto_56057 ) ( LIFTING ?auto_56065 ?auto_56058 ) ( IS-CRATE ?auto_56058 ) ( not ( = ?auto_56057 ?auto_56058 ) ) ( not ( = ?auto_56059 ?auto_56057 ) ) ( not ( = ?auto_56060 ?auto_56057 ) ) ( not ( = ?auto_56063 ?auto_56057 ) ) ( not ( = ?auto_56067 ?auto_56057 ) ) ( ON ?auto_56057 ?auto_56056 ) ( not ( = ?auto_56056 ?auto_56057 ) ) ( not ( = ?auto_56056 ?auto_56058 ) ) ( not ( = ?auto_56056 ?auto_56059 ) ) ( not ( = ?auto_56056 ?auto_56060 ) ) ( not ( = ?auto_56056 ?auto_56063 ) ) ( not ( = ?auto_56056 ?auto_56067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56058 ?auto_56059 ?auto_56060 )
      ( MAKE-4CRATE-VERIFY ?auto_56056 ?auto_56057 ?auto_56058 ?auto_56059 ?auto_56060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_56339 - SURFACE
      ?auto_56340 - SURFACE
    )
    :vars
    (
      ?auto_56342 - HOIST
      ?auto_56348 - PLACE
      ?auto_56341 - SURFACE
      ?auto_56347 - PLACE
      ?auto_56344 - HOIST
      ?auto_56343 - SURFACE
      ?auto_56346 - TRUCK
      ?auto_56345 - SURFACE
      ?auto_56349 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56342 ?auto_56348 ) ( IS-CRATE ?auto_56340 ) ( not ( = ?auto_56339 ?auto_56340 ) ) ( not ( = ?auto_56341 ?auto_56339 ) ) ( not ( = ?auto_56341 ?auto_56340 ) ) ( not ( = ?auto_56347 ?auto_56348 ) ) ( HOIST-AT ?auto_56344 ?auto_56347 ) ( not ( = ?auto_56342 ?auto_56344 ) ) ( SURFACE-AT ?auto_56340 ?auto_56347 ) ( ON ?auto_56340 ?auto_56343 ) ( CLEAR ?auto_56340 ) ( not ( = ?auto_56339 ?auto_56343 ) ) ( not ( = ?auto_56340 ?auto_56343 ) ) ( not ( = ?auto_56341 ?auto_56343 ) ) ( SURFACE-AT ?auto_56341 ?auto_56348 ) ( CLEAR ?auto_56341 ) ( IS-CRATE ?auto_56339 ) ( AVAILABLE ?auto_56342 ) ( TRUCK-AT ?auto_56346 ?auto_56347 ) ( SURFACE-AT ?auto_56339 ?auto_56347 ) ( ON ?auto_56339 ?auto_56345 ) ( CLEAR ?auto_56339 ) ( not ( = ?auto_56339 ?auto_56345 ) ) ( not ( = ?auto_56340 ?auto_56345 ) ) ( not ( = ?auto_56341 ?auto_56345 ) ) ( not ( = ?auto_56343 ?auto_56345 ) ) ( LIFTING ?auto_56344 ?auto_56349 ) ( IS-CRATE ?auto_56349 ) ( not ( = ?auto_56339 ?auto_56349 ) ) ( not ( = ?auto_56340 ?auto_56349 ) ) ( not ( = ?auto_56341 ?auto_56349 ) ) ( not ( = ?auto_56343 ?auto_56349 ) ) ( not ( = ?auto_56345 ?auto_56349 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56344 ?auto_56349 ?auto_56346 ?auto_56347 )
      ( MAKE-2CRATE ?auto_56341 ?auto_56339 ?auto_56340 )
      ( MAKE-1CRATE-VERIFY ?auto_56339 ?auto_56340 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_56350 - SURFACE
      ?auto_56351 - SURFACE
      ?auto_56352 - SURFACE
    )
    :vars
    (
      ?auto_56356 - HOIST
      ?auto_56353 - PLACE
      ?auto_56354 - PLACE
      ?auto_56359 - HOIST
      ?auto_56357 - SURFACE
      ?auto_56358 - TRUCK
      ?auto_56355 - SURFACE
      ?auto_56360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56356 ?auto_56353 ) ( IS-CRATE ?auto_56352 ) ( not ( = ?auto_56351 ?auto_56352 ) ) ( not ( = ?auto_56350 ?auto_56351 ) ) ( not ( = ?auto_56350 ?auto_56352 ) ) ( not ( = ?auto_56354 ?auto_56353 ) ) ( HOIST-AT ?auto_56359 ?auto_56354 ) ( not ( = ?auto_56356 ?auto_56359 ) ) ( SURFACE-AT ?auto_56352 ?auto_56354 ) ( ON ?auto_56352 ?auto_56357 ) ( CLEAR ?auto_56352 ) ( not ( = ?auto_56351 ?auto_56357 ) ) ( not ( = ?auto_56352 ?auto_56357 ) ) ( not ( = ?auto_56350 ?auto_56357 ) ) ( SURFACE-AT ?auto_56350 ?auto_56353 ) ( CLEAR ?auto_56350 ) ( IS-CRATE ?auto_56351 ) ( AVAILABLE ?auto_56356 ) ( TRUCK-AT ?auto_56358 ?auto_56354 ) ( SURFACE-AT ?auto_56351 ?auto_56354 ) ( ON ?auto_56351 ?auto_56355 ) ( CLEAR ?auto_56351 ) ( not ( = ?auto_56351 ?auto_56355 ) ) ( not ( = ?auto_56352 ?auto_56355 ) ) ( not ( = ?auto_56350 ?auto_56355 ) ) ( not ( = ?auto_56357 ?auto_56355 ) ) ( LIFTING ?auto_56359 ?auto_56360 ) ( IS-CRATE ?auto_56360 ) ( not ( = ?auto_56351 ?auto_56360 ) ) ( not ( = ?auto_56352 ?auto_56360 ) ) ( not ( = ?auto_56350 ?auto_56360 ) ) ( not ( = ?auto_56357 ?auto_56360 ) ) ( not ( = ?auto_56355 ?auto_56360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56351 ?auto_56352 )
      ( MAKE-2CRATE-VERIFY ?auto_56350 ?auto_56351 ?auto_56352 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56491 - SURFACE
      ?auto_56492 - SURFACE
      ?auto_56493 - SURFACE
      ?auto_56494 - SURFACE
      ?auto_56495 - SURFACE
      ?auto_56496 - SURFACE
    )
    :vars
    (
      ?auto_56498 - HOIST
      ?auto_56497 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56498 ?auto_56497 ) ( SURFACE-AT ?auto_56495 ?auto_56497 ) ( CLEAR ?auto_56495 ) ( LIFTING ?auto_56498 ?auto_56496 ) ( IS-CRATE ?auto_56496 ) ( not ( = ?auto_56495 ?auto_56496 ) ) ( ON ?auto_56492 ?auto_56491 ) ( ON ?auto_56493 ?auto_56492 ) ( ON ?auto_56494 ?auto_56493 ) ( ON ?auto_56495 ?auto_56494 ) ( not ( = ?auto_56491 ?auto_56492 ) ) ( not ( = ?auto_56491 ?auto_56493 ) ) ( not ( = ?auto_56491 ?auto_56494 ) ) ( not ( = ?auto_56491 ?auto_56495 ) ) ( not ( = ?auto_56491 ?auto_56496 ) ) ( not ( = ?auto_56492 ?auto_56493 ) ) ( not ( = ?auto_56492 ?auto_56494 ) ) ( not ( = ?auto_56492 ?auto_56495 ) ) ( not ( = ?auto_56492 ?auto_56496 ) ) ( not ( = ?auto_56493 ?auto_56494 ) ) ( not ( = ?auto_56493 ?auto_56495 ) ) ( not ( = ?auto_56493 ?auto_56496 ) ) ( not ( = ?auto_56494 ?auto_56495 ) ) ( not ( = ?auto_56494 ?auto_56496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56495 ?auto_56496 )
      ( MAKE-5CRATE-VERIFY ?auto_56491 ?auto_56492 ?auto_56493 ?auto_56494 ?auto_56495 ?auto_56496 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56525 - SURFACE
      ?auto_56526 - SURFACE
      ?auto_56527 - SURFACE
      ?auto_56528 - SURFACE
      ?auto_56529 - SURFACE
      ?auto_56530 - SURFACE
    )
    :vars
    (
      ?auto_56532 - HOIST
      ?auto_56533 - PLACE
      ?auto_56531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56532 ?auto_56533 ) ( SURFACE-AT ?auto_56529 ?auto_56533 ) ( CLEAR ?auto_56529 ) ( IS-CRATE ?auto_56530 ) ( not ( = ?auto_56529 ?auto_56530 ) ) ( TRUCK-AT ?auto_56531 ?auto_56533 ) ( AVAILABLE ?auto_56532 ) ( IN ?auto_56530 ?auto_56531 ) ( ON ?auto_56529 ?auto_56528 ) ( not ( = ?auto_56528 ?auto_56529 ) ) ( not ( = ?auto_56528 ?auto_56530 ) ) ( ON ?auto_56526 ?auto_56525 ) ( ON ?auto_56527 ?auto_56526 ) ( ON ?auto_56528 ?auto_56527 ) ( not ( = ?auto_56525 ?auto_56526 ) ) ( not ( = ?auto_56525 ?auto_56527 ) ) ( not ( = ?auto_56525 ?auto_56528 ) ) ( not ( = ?auto_56525 ?auto_56529 ) ) ( not ( = ?auto_56525 ?auto_56530 ) ) ( not ( = ?auto_56526 ?auto_56527 ) ) ( not ( = ?auto_56526 ?auto_56528 ) ) ( not ( = ?auto_56526 ?auto_56529 ) ) ( not ( = ?auto_56526 ?auto_56530 ) ) ( not ( = ?auto_56527 ?auto_56528 ) ) ( not ( = ?auto_56527 ?auto_56529 ) ) ( not ( = ?auto_56527 ?auto_56530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56528 ?auto_56529 ?auto_56530 )
      ( MAKE-5CRATE-VERIFY ?auto_56525 ?auto_56526 ?auto_56527 ?auto_56528 ?auto_56529 ?auto_56530 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56565 - SURFACE
      ?auto_56566 - SURFACE
      ?auto_56567 - SURFACE
      ?auto_56568 - SURFACE
      ?auto_56569 - SURFACE
      ?auto_56570 - SURFACE
    )
    :vars
    (
      ?auto_56574 - HOIST
      ?auto_56573 - PLACE
      ?auto_56571 - TRUCK
      ?auto_56572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56574 ?auto_56573 ) ( SURFACE-AT ?auto_56569 ?auto_56573 ) ( CLEAR ?auto_56569 ) ( IS-CRATE ?auto_56570 ) ( not ( = ?auto_56569 ?auto_56570 ) ) ( AVAILABLE ?auto_56574 ) ( IN ?auto_56570 ?auto_56571 ) ( ON ?auto_56569 ?auto_56568 ) ( not ( = ?auto_56568 ?auto_56569 ) ) ( not ( = ?auto_56568 ?auto_56570 ) ) ( TRUCK-AT ?auto_56571 ?auto_56572 ) ( not ( = ?auto_56572 ?auto_56573 ) ) ( ON ?auto_56566 ?auto_56565 ) ( ON ?auto_56567 ?auto_56566 ) ( ON ?auto_56568 ?auto_56567 ) ( not ( = ?auto_56565 ?auto_56566 ) ) ( not ( = ?auto_56565 ?auto_56567 ) ) ( not ( = ?auto_56565 ?auto_56568 ) ) ( not ( = ?auto_56565 ?auto_56569 ) ) ( not ( = ?auto_56565 ?auto_56570 ) ) ( not ( = ?auto_56566 ?auto_56567 ) ) ( not ( = ?auto_56566 ?auto_56568 ) ) ( not ( = ?auto_56566 ?auto_56569 ) ) ( not ( = ?auto_56566 ?auto_56570 ) ) ( not ( = ?auto_56567 ?auto_56568 ) ) ( not ( = ?auto_56567 ?auto_56569 ) ) ( not ( = ?auto_56567 ?auto_56570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56568 ?auto_56569 ?auto_56570 )
      ( MAKE-5CRATE-VERIFY ?auto_56565 ?auto_56566 ?auto_56567 ?auto_56568 ?auto_56569 ?auto_56570 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56610 - SURFACE
      ?auto_56611 - SURFACE
      ?auto_56612 - SURFACE
      ?auto_56613 - SURFACE
      ?auto_56614 - SURFACE
      ?auto_56615 - SURFACE
    )
    :vars
    (
      ?auto_56619 - HOIST
      ?auto_56618 - PLACE
      ?auto_56617 - TRUCK
      ?auto_56620 - PLACE
      ?auto_56616 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56619 ?auto_56618 ) ( SURFACE-AT ?auto_56614 ?auto_56618 ) ( CLEAR ?auto_56614 ) ( IS-CRATE ?auto_56615 ) ( not ( = ?auto_56614 ?auto_56615 ) ) ( AVAILABLE ?auto_56619 ) ( ON ?auto_56614 ?auto_56613 ) ( not ( = ?auto_56613 ?auto_56614 ) ) ( not ( = ?auto_56613 ?auto_56615 ) ) ( TRUCK-AT ?auto_56617 ?auto_56620 ) ( not ( = ?auto_56620 ?auto_56618 ) ) ( HOIST-AT ?auto_56616 ?auto_56620 ) ( LIFTING ?auto_56616 ?auto_56615 ) ( not ( = ?auto_56619 ?auto_56616 ) ) ( ON ?auto_56611 ?auto_56610 ) ( ON ?auto_56612 ?auto_56611 ) ( ON ?auto_56613 ?auto_56612 ) ( not ( = ?auto_56610 ?auto_56611 ) ) ( not ( = ?auto_56610 ?auto_56612 ) ) ( not ( = ?auto_56610 ?auto_56613 ) ) ( not ( = ?auto_56610 ?auto_56614 ) ) ( not ( = ?auto_56610 ?auto_56615 ) ) ( not ( = ?auto_56611 ?auto_56612 ) ) ( not ( = ?auto_56611 ?auto_56613 ) ) ( not ( = ?auto_56611 ?auto_56614 ) ) ( not ( = ?auto_56611 ?auto_56615 ) ) ( not ( = ?auto_56612 ?auto_56613 ) ) ( not ( = ?auto_56612 ?auto_56614 ) ) ( not ( = ?auto_56612 ?auto_56615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56613 ?auto_56614 ?auto_56615 )
      ( MAKE-5CRATE-VERIFY ?auto_56610 ?auto_56611 ?auto_56612 ?auto_56613 ?auto_56614 ?auto_56615 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56660 - SURFACE
      ?auto_56661 - SURFACE
      ?auto_56662 - SURFACE
      ?auto_56663 - SURFACE
      ?auto_56664 - SURFACE
      ?auto_56665 - SURFACE
    )
    :vars
    (
      ?auto_56670 - HOIST
      ?auto_56667 - PLACE
      ?auto_56666 - TRUCK
      ?auto_56671 - PLACE
      ?auto_56668 - HOIST
      ?auto_56669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56670 ?auto_56667 ) ( SURFACE-AT ?auto_56664 ?auto_56667 ) ( CLEAR ?auto_56664 ) ( IS-CRATE ?auto_56665 ) ( not ( = ?auto_56664 ?auto_56665 ) ) ( AVAILABLE ?auto_56670 ) ( ON ?auto_56664 ?auto_56663 ) ( not ( = ?auto_56663 ?auto_56664 ) ) ( not ( = ?auto_56663 ?auto_56665 ) ) ( TRUCK-AT ?auto_56666 ?auto_56671 ) ( not ( = ?auto_56671 ?auto_56667 ) ) ( HOIST-AT ?auto_56668 ?auto_56671 ) ( not ( = ?auto_56670 ?auto_56668 ) ) ( AVAILABLE ?auto_56668 ) ( SURFACE-AT ?auto_56665 ?auto_56671 ) ( ON ?auto_56665 ?auto_56669 ) ( CLEAR ?auto_56665 ) ( not ( = ?auto_56664 ?auto_56669 ) ) ( not ( = ?auto_56665 ?auto_56669 ) ) ( not ( = ?auto_56663 ?auto_56669 ) ) ( ON ?auto_56661 ?auto_56660 ) ( ON ?auto_56662 ?auto_56661 ) ( ON ?auto_56663 ?auto_56662 ) ( not ( = ?auto_56660 ?auto_56661 ) ) ( not ( = ?auto_56660 ?auto_56662 ) ) ( not ( = ?auto_56660 ?auto_56663 ) ) ( not ( = ?auto_56660 ?auto_56664 ) ) ( not ( = ?auto_56660 ?auto_56665 ) ) ( not ( = ?auto_56660 ?auto_56669 ) ) ( not ( = ?auto_56661 ?auto_56662 ) ) ( not ( = ?auto_56661 ?auto_56663 ) ) ( not ( = ?auto_56661 ?auto_56664 ) ) ( not ( = ?auto_56661 ?auto_56665 ) ) ( not ( = ?auto_56661 ?auto_56669 ) ) ( not ( = ?auto_56662 ?auto_56663 ) ) ( not ( = ?auto_56662 ?auto_56664 ) ) ( not ( = ?auto_56662 ?auto_56665 ) ) ( not ( = ?auto_56662 ?auto_56669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56663 ?auto_56664 ?auto_56665 )
      ( MAKE-5CRATE-VERIFY ?auto_56660 ?auto_56661 ?auto_56662 ?auto_56663 ?auto_56664 ?auto_56665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56711 - SURFACE
      ?auto_56712 - SURFACE
      ?auto_56713 - SURFACE
      ?auto_56714 - SURFACE
      ?auto_56715 - SURFACE
      ?auto_56716 - SURFACE
    )
    :vars
    (
      ?auto_56721 - HOIST
      ?auto_56719 - PLACE
      ?auto_56722 - PLACE
      ?auto_56720 - HOIST
      ?auto_56718 - SURFACE
      ?auto_56717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56721 ?auto_56719 ) ( SURFACE-AT ?auto_56715 ?auto_56719 ) ( CLEAR ?auto_56715 ) ( IS-CRATE ?auto_56716 ) ( not ( = ?auto_56715 ?auto_56716 ) ) ( AVAILABLE ?auto_56721 ) ( ON ?auto_56715 ?auto_56714 ) ( not ( = ?auto_56714 ?auto_56715 ) ) ( not ( = ?auto_56714 ?auto_56716 ) ) ( not ( = ?auto_56722 ?auto_56719 ) ) ( HOIST-AT ?auto_56720 ?auto_56722 ) ( not ( = ?auto_56721 ?auto_56720 ) ) ( AVAILABLE ?auto_56720 ) ( SURFACE-AT ?auto_56716 ?auto_56722 ) ( ON ?auto_56716 ?auto_56718 ) ( CLEAR ?auto_56716 ) ( not ( = ?auto_56715 ?auto_56718 ) ) ( not ( = ?auto_56716 ?auto_56718 ) ) ( not ( = ?auto_56714 ?auto_56718 ) ) ( TRUCK-AT ?auto_56717 ?auto_56719 ) ( ON ?auto_56712 ?auto_56711 ) ( ON ?auto_56713 ?auto_56712 ) ( ON ?auto_56714 ?auto_56713 ) ( not ( = ?auto_56711 ?auto_56712 ) ) ( not ( = ?auto_56711 ?auto_56713 ) ) ( not ( = ?auto_56711 ?auto_56714 ) ) ( not ( = ?auto_56711 ?auto_56715 ) ) ( not ( = ?auto_56711 ?auto_56716 ) ) ( not ( = ?auto_56711 ?auto_56718 ) ) ( not ( = ?auto_56712 ?auto_56713 ) ) ( not ( = ?auto_56712 ?auto_56714 ) ) ( not ( = ?auto_56712 ?auto_56715 ) ) ( not ( = ?auto_56712 ?auto_56716 ) ) ( not ( = ?auto_56712 ?auto_56718 ) ) ( not ( = ?auto_56713 ?auto_56714 ) ) ( not ( = ?auto_56713 ?auto_56715 ) ) ( not ( = ?auto_56713 ?auto_56716 ) ) ( not ( = ?auto_56713 ?auto_56718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56714 ?auto_56715 ?auto_56716 )
      ( MAKE-5CRATE-VERIFY ?auto_56711 ?auto_56712 ?auto_56713 ?auto_56714 ?auto_56715 ?auto_56716 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56762 - SURFACE
      ?auto_56763 - SURFACE
      ?auto_56764 - SURFACE
      ?auto_56765 - SURFACE
      ?auto_56766 - SURFACE
      ?auto_56767 - SURFACE
    )
    :vars
    (
      ?auto_56770 - HOIST
      ?auto_56771 - PLACE
      ?auto_56769 - PLACE
      ?auto_56772 - HOIST
      ?auto_56773 - SURFACE
      ?auto_56768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56770 ?auto_56771 ) ( IS-CRATE ?auto_56767 ) ( not ( = ?auto_56766 ?auto_56767 ) ) ( not ( = ?auto_56765 ?auto_56766 ) ) ( not ( = ?auto_56765 ?auto_56767 ) ) ( not ( = ?auto_56769 ?auto_56771 ) ) ( HOIST-AT ?auto_56772 ?auto_56769 ) ( not ( = ?auto_56770 ?auto_56772 ) ) ( AVAILABLE ?auto_56772 ) ( SURFACE-AT ?auto_56767 ?auto_56769 ) ( ON ?auto_56767 ?auto_56773 ) ( CLEAR ?auto_56767 ) ( not ( = ?auto_56766 ?auto_56773 ) ) ( not ( = ?auto_56767 ?auto_56773 ) ) ( not ( = ?auto_56765 ?auto_56773 ) ) ( TRUCK-AT ?auto_56768 ?auto_56771 ) ( SURFACE-AT ?auto_56765 ?auto_56771 ) ( CLEAR ?auto_56765 ) ( LIFTING ?auto_56770 ?auto_56766 ) ( IS-CRATE ?auto_56766 ) ( ON ?auto_56763 ?auto_56762 ) ( ON ?auto_56764 ?auto_56763 ) ( ON ?auto_56765 ?auto_56764 ) ( not ( = ?auto_56762 ?auto_56763 ) ) ( not ( = ?auto_56762 ?auto_56764 ) ) ( not ( = ?auto_56762 ?auto_56765 ) ) ( not ( = ?auto_56762 ?auto_56766 ) ) ( not ( = ?auto_56762 ?auto_56767 ) ) ( not ( = ?auto_56762 ?auto_56773 ) ) ( not ( = ?auto_56763 ?auto_56764 ) ) ( not ( = ?auto_56763 ?auto_56765 ) ) ( not ( = ?auto_56763 ?auto_56766 ) ) ( not ( = ?auto_56763 ?auto_56767 ) ) ( not ( = ?auto_56763 ?auto_56773 ) ) ( not ( = ?auto_56764 ?auto_56765 ) ) ( not ( = ?auto_56764 ?auto_56766 ) ) ( not ( = ?auto_56764 ?auto_56767 ) ) ( not ( = ?auto_56764 ?auto_56773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56765 ?auto_56766 ?auto_56767 )
      ( MAKE-5CRATE-VERIFY ?auto_56762 ?auto_56763 ?auto_56764 ?auto_56765 ?auto_56766 ?auto_56767 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56813 - SURFACE
      ?auto_56814 - SURFACE
      ?auto_56815 - SURFACE
      ?auto_56816 - SURFACE
      ?auto_56817 - SURFACE
      ?auto_56818 - SURFACE
    )
    :vars
    (
      ?auto_56823 - HOIST
      ?auto_56819 - PLACE
      ?auto_56822 - PLACE
      ?auto_56824 - HOIST
      ?auto_56820 - SURFACE
      ?auto_56821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56823 ?auto_56819 ) ( IS-CRATE ?auto_56818 ) ( not ( = ?auto_56817 ?auto_56818 ) ) ( not ( = ?auto_56816 ?auto_56817 ) ) ( not ( = ?auto_56816 ?auto_56818 ) ) ( not ( = ?auto_56822 ?auto_56819 ) ) ( HOIST-AT ?auto_56824 ?auto_56822 ) ( not ( = ?auto_56823 ?auto_56824 ) ) ( AVAILABLE ?auto_56824 ) ( SURFACE-AT ?auto_56818 ?auto_56822 ) ( ON ?auto_56818 ?auto_56820 ) ( CLEAR ?auto_56818 ) ( not ( = ?auto_56817 ?auto_56820 ) ) ( not ( = ?auto_56818 ?auto_56820 ) ) ( not ( = ?auto_56816 ?auto_56820 ) ) ( TRUCK-AT ?auto_56821 ?auto_56819 ) ( SURFACE-AT ?auto_56816 ?auto_56819 ) ( CLEAR ?auto_56816 ) ( IS-CRATE ?auto_56817 ) ( AVAILABLE ?auto_56823 ) ( IN ?auto_56817 ?auto_56821 ) ( ON ?auto_56814 ?auto_56813 ) ( ON ?auto_56815 ?auto_56814 ) ( ON ?auto_56816 ?auto_56815 ) ( not ( = ?auto_56813 ?auto_56814 ) ) ( not ( = ?auto_56813 ?auto_56815 ) ) ( not ( = ?auto_56813 ?auto_56816 ) ) ( not ( = ?auto_56813 ?auto_56817 ) ) ( not ( = ?auto_56813 ?auto_56818 ) ) ( not ( = ?auto_56813 ?auto_56820 ) ) ( not ( = ?auto_56814 ?auto_56815 ) ) ( not ( = ?auto_56814 ?auto_56816 ) ) ( not ( = ?auto_56814 ?auto_56817 ) ) ( not ( = ?auto_56814 ?auto_56818 ) ) ( not ( = ?auto_56814 ?auto_56820 ) ) ( not ( = ?auto_56815 ?auto_56816 ) ) ( not ( = ?auto_56815 ?auto_56817 ) ) ( not ( = ?auto_56815 ?auto_56818 ) ) ( not ( = ?auto_56815 ?auto_56820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56816 ?auto_56817 ?auto_56818 )
      ( MAKE-5CRATE-VERIFY ?auto_56813 ?auto_56814 ?auto_56815 ?auto_56816 ?auto_56817 ?auto_56818 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56864 - SURFACE
      ?auto_56865 - SURFACE
      ?auto_56866 - SURFACE
      ?auto_56867 - SURFACE
      ?auto_56868 - SURFACE
      ?auto_56869 - SURFACE
    )
    :vars
    (
      ?auto_56870 - HOIST
      ?auto_56874 - PLACE
      ?auto_56873 - PLACE
      ?auto_56875 - HOIST
      ?auto_56872 - SURFACE
      ?auto_56871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56870 ?auto_56874 ) ( IS-CRATE ?auto_56869 ) ( not ( = ?auto_56868 ?auto_56869 ) ) ( not ( = ?auto_56867 ?auto_56868 ) ) ( not ( = ?auto_56867 ?auto_56869 ) ) ( not ( = ?auto_56873 ?auto_56874 ) ) ( HOIST-AT ?auto_56875 ?auto_56873 ) ( not ( = ?auto_56870 ?auto_56875 ) ) ( AVAILABLE ?auto_56875 ) ( SURFACE-AT ?auto_56869 ?auto_56873 ) ( ON ?auto_56869 ?auto_56872 ) ( CLEAR ?auto_56869 ) ( not ( = ?auto_56868 ?auto_56872 ) ) ( not ( = ?auto_56869 ?auto_56872 ) ) ( not ( = ?auto_56867 ?auto_56872 ) ) ( SURFACE-AT ?auto_56867 ?auto_56874 ) ( CLEAR ?auto_56867 ) ( IS-CRATE ?auto_56868 ) ( AVAILABLE ?auto_56870 ) ( IN ?auto_56868 ?auto_56871 ) ( TRUCK-AT ?auto_56871 ?auto_56873 ) ( ON ?auto_56865 ?auto_56864 ) ( ON ?auto_56866 ?auto_56865 ) ( ON ?auto_56867 ?auto_56866 ) ( not ( = ?auto_56864 ?auto_56865 ) ) ( not ( = ?auto_56864 ?auto_56866 ) ) ( not ( = ?auto_56864 ?auto_56867 ) ) ( not ( = ?auto_56864 ?auto_56868 ) ) ( not ( = ?auto_56864 ?auto_56869 ) ) ( not ( = ?auto_56864 ?auto_56872 ) ) ( not ( = ?auto_56865 ?auto_56866 ) ) ( not ( = ?auto_56865 ?auto_56867 ) ) ( not ( = ?auto_56865 ?auto_56868 ) ) ( not ( = ?auto_56865 ?auto_56869 ) ) ( not ( = ?auto_56865 ?auto_56872 ) ) ( not ( = ?auto_56866 ?auto_56867 ) ) ( not ( = ?auto_56866 ?auto_56868 ) ) ( not ( = ?auto_56866 ?auto_56869 ) ) ( not ( = ?auto_56866 ?auto_56872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56867 ?auto_56868 ?auto_56869 )
      ( MAKE-5CRATE-VERIFY ?auto_56864 ?auto_56865 ?auto_56866 ?auto_56867 ?auto_56868 ?auto_56869 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56915 - SURFACE
      ?auto_56916 - SURFACE
      ?auto_56917 - SURFACE
      ?auto_56918 - SURFACE
      ?auto_56919 - SURFACE
      ?auto_56920 - SURFACE
    )
    :vars
    (
      ?auto_56925 - HOIST
      ?auto_56926 - PLACE
      ?auto_56921 - PLACE
      ?auto_56922 - HOIST
      ?auto_56924 - SURFACE
      ?auto_56923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56925 ?auto_56926 ) ( IS-CRATE ?auto_56920 ) ( not ( = ?auto_56919 ?auto_56920 ) ) ( not ( = ?auto_56918 ?auto_56919 ) ) ( not ( = ?auto_56918 ?auto_56920 ) ) ( not ( = ?auto_56921 ?auto_56926 ) ) ( HOIST-AT ?auto_56922 ?auto_56921 ) ( not ( = ?auto_56925 ?auto_56922 ) ) ( SURFACE-AT ?auto_56920 ?auto_56921 ) ( ON ?auto_56920 ?auto_56924 ) ( CLEAR ?auto_56920 ) ( not ( = ?auto_56919 ?auto_56924 ) ) ( not ( = ?auto_56920 ?auto_56924 ) ) ( not ( = ?auto_56918 ?auto_56924 ) ) ( SURFACE-AT ?auto_56918 ?auto_56926 ) ( CLEAR ?auto_56918 ) ( IS-CRATE ?auto_56919 ) ( AVAILABLE ?auto_56925 ) ( TRUCK-AT ?auto_56923 ?auto_56921 ) ( LIFTING ?auto_56922 ?auto_56919 ) ( ON ?auto_56916 ?auto_56915 ) ( ON ?auto_56917 ?auto_56916 ) ( ON ?auto_56918 ?auto_56917 ) ( not ( = ?auto_56915 ?auto_56916 ) ) ( not ( = ?auto_56915 ?auto_56917 ) ) ( not ( = ?auto_56915 ?auto_56918 ) ) ( not ( = ?auto_56915 ?auto_56919 ) ) ( not ( = ?auto_56915 ?auto_56920 ) ) ( not ( = ?auto_56915 ?auto_56924 ) ) ( not ( = ?auto_56916 ?auto_56917 ) ) ( not ( = ?auto_56916 ?auto_56918 ) ) ( not ( = ?auto_56916 ?auto_56919 ) ) ( not ( = ?auto_56916 ?auto_56920 ) ) ( not ( = ?auto_56916 ?auto_56924 ) ) ( not ( = ?auto_56917 ?auto_56918 ) ) ( not ( = ?auto_56917 ?auto_56919 ) ) ( not ( = ?auto_56917 ?auto_56920 ) ) ( not ( = ?auto_56917 ?auto_56924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56918 ?auto_56919 ?auto_56920 )
      ( MAKE-5CRATE-VERIFY ?auto_56915 ?auto_56916 ?auto_56917 ?auto_56918 ?auto_56919 ?auto_56920 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_56970 - SURFACE
      ?auto_56971 - SURFACE
      ?auto_56972 - SURFACE
      ?auto_56973 - SURFACE
      ?auto_56974 - SURFACE
      ?auto_56975 - SURFACE
    )
    :vars
    (
      ?auto_56980 - HOIST
      ?auto_56981 - PLACE
      ?auto_56979 - PLACE
      ?auto_56982 - HOIST
      ?auto_56976 - SURFACE
      ?auto_56978 - TRUCK
      ?auto_56977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56980 ?auto_56981 ) ( IS-CRATE ?auto_56975 ) ( not ( = ?auto_56974 ?auto_56975 ) ) ( not ( = ?auto_56973 ?auto_56974 ) ) ( not ( = ?auto_56973 ?auto_56975 ) ) ( not ( = ?auto_56979 ?auto_56981 ) ) ( HOIST-AT ?auto_56982 ?auto_56979 ) ( not ( = ?auto_56980 ?auto_56982 ) ) ( SURFACE-AT ?auto_56975 ?auto_56979 ) ( ON ?auto_56975 ?auto_56976 ) ( CLEAR ?auto_56975 ) ( not ( = ?auto_56974 ?auto_56976 ) ) ( not ( = ?auto_56975 ?auto_56976 ) ) ( not ( = ?auto_56973 ?auto_56976 ) ) ( SURFACE-AT ?auto_56973 ?auto_56981 ) ( CLEAR ?auto_56973 ) ( IS-CRATE ?auto_56974 ) ( AVAILABLE ?auto_56980 ) ( TRUCK-AT ?auto_56978 ?auto_56979 ) ( AVAILABLE ?auto_56982 ) ( SURFACE-AT ?auto_56974 ?auto_56979 ) ( ON ?auto_56974 ?auto_56977 ) ( CLEAR ?auto_56974 ) ( not ( = ?auto_56974 ?auto_56977 ) ) ( not ( = ?auto_56975 ?auto_56977 ) ) ( not ( = ?auto_56973 ?auto_56977 ) ) ( not ( = ?auto_56976 ?auto_56977 ) ) ( ON ?auto_56971 ?auto_56970 ) ( ON ?auto_56972 ?auto_56971 ) ( ON ?auto_56973 ?auto_56972 ) ( not ( = ?auto_56970 ?auto_56971 ) ) ( not ( = ?auto_56970 ?auto_56972 ) ) ( not ( = ?auto_56970 ?auto_56973 ) ) ( not ( = ?auto_56970 ?auto_56974 ) ) ( not ( = ?auto_56970 ?auto_56975 ) ) ( not ( = ?auto_56970 ?auto_56976 ) ) ( not ( = ?auto_56970 ?auto_56977 ) ) ( not ( = ?auto_56971 ?auto_56972 ) ) ( not ( = ?auto_56971 ?auto_56973 ) ) ( not ( = ?auto_56971 ?auto_56974 ) ) ( not ( = ?auto_56971 ?auto_56975 ) ) ( not ( = ?auto_56971 ?auto_56976 ) ) ( not ( = ?auto_56971 ?auto_56977 ) ) ( not ( = ?auto_56972 ?auto_56973 ) ) ( not ( = ?auto_56972 ?auto_56974 ) ) ( not ( = ?auto_56972 ?auto_56975 ) ) ( not ( = ?auto_56972 ?auto_56976 ) ) ( not ( = ?auto_56972 ?auto_56977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_56973 ?auto_56974 ?auto_56975 )
      ( MAKE-5CRATE-VERIFY ?auto_56970 ?auto_56971 ?auto_56972 ?auto_56973 ?auto_56974 ?auto_56975 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_57026 - SURFACE
      ?auto_57027 - SURFACE
      ?auto_57028 - SURFACE
      ?auto_57029 - SURFACE
      ?auto_57030 - SURFACE
      ?auto_57031 - SURFACE
    )
    :vars
    (
      ?auto_57033 - HOIST
      ?auto_57035 - PLACE
      ?auto_57034 - PLACE
      ?auto_57032 - HOIST
      ?auto_57038 - SURFACE
      ?auto_57037 - SURFACE
      ?auto_57036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57033 ?auto_57035 ) ( IS-CRATE ?auto_57031 ) ( not ( = ?auto_57030 ?auto_57031 ) ) ( not ( = ?auto_57029 ?auto_57030 ) ) ( not ( = ?auto_57029 ?auto_57031 ) ) ( not ( = ?auto_57034 ?auto_57035 ) ) ( HOIST-AT ?auto_57032 ?auto_57034 ) ( not ( = ?auto_57033 ?auto_57032 ) ) ( SURFACE-AT ?auto_57031 ?auto_57034 ) ( ON ?auto_57031 ?auto_57038 ) ( CLEAR ?auto_57031 ) ( not ( = ?auto_57030 ?auto_57038 ) ) ( not ( = ?auto_57031 ?auto_57038 ) ) ( not ( = ?auto_57029 ?auto_57038 ) ) ( SURFACE-AT ?auto_57029 ?auto_57035 ) ( CLEAR ?auto_57029 ) ( IS-CRATE ?auto_57030 ) ( AVAILABLE ?auto_57033 ) ( AVAILABLE ?auto_57032 ) ( SURFACE-AT ?auto_57030 ?auto_57034 ) ( ON ?auto_57030 ?auto_57037 ) ( CLEAR ?auto_57030 ) ( not ( = ?auto_57030 ?auto_57037 ) ) ( not ( = ?auto_57031 ?auto_57037 ) ) ( not ( = ?auto_57029 ?auto_57037 ) ) ( not ( = ?auto_57038 ?auto_57037 ) ) ( TRUCK-AT ?auto_57036 ?auto_57035 ) ( ON ?auto_57027 ?auto_57026 ) ( ON ?auto_57028 ?auto_57027 ) ( ON ?auto_57029 ?auto_57028 ) ( not ( = ?auto_57026 ?auto_57027 ) ) ( not ( = ?auto_57026 ?auto_57028 ) ) ( not ( = ?auto_57026 ?auto_57029 ) ) ( not ( = ?auto_57026 ?auto_57030 ) ) ( not ( = ?auto_57026 ?auto_57031 ) ) ( not ( = ?auto_57026 ?auto_57038 ) ) ( not ( = ?auto_57026 ?auto_57037 ) ) ( not ( = ?auto_57027 ?auto_57028 ) ) ( not ( = ?auto_57027 ?auto_57029 ) ) ( not ( = ?auto_57027 ?auto_57030 ) ) ( not ( = ?auto_57027 ?auto_57031 ) ) ( not ( = ?auto_57027 ?auto_57038 ) ) ( not ( = ?auto_57027 ?auto_57037 ) ) ( not ( = ?auto_57028 ?auto_57029 ) ) ( not ( = ?auto_57028 ?auto_57030 ) ) ( not ( = ?auto_57028 ?auto_57031 ) ) ( not ( = ?auto_57028 ?auto_57038 ) ) ( not ( = ?auto_57028 ?auto_57037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57029 ?auto_57030 ?auto_57031 )
      ( MAKE-5CRATE-VERIFY ?auto_57026 ?auto_57027 ?auto_57028 ?auto_57029 ?auto_57030 ?auto_57031 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_57084 - SURFACE
      ?auto_57085 - SURFACE
      ?auto_57086 - SURFACE
      ?auto_57087 - SURFACE
      ?auto_57088 - SURFACE
      ?auto_57089 - SURFACE
    )
    :vars
    (
      ?auto_57096 - HOIST
      ?auto_57095 - PLACE
      ?auto_57090 - PLACE
      ?auto_57091 - HOIST
      ?auto_57092 - SURFACE
      ?auto_57093 - SURFACE
      ?auto_57094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57096 ?auto_57095 ) ( IS-CRATE ?auto_57089 ) ( not ( = ?auto_57088 ?auto_57089 ) ) ( not ( = ?auto_57087 ?auto_57088 ) ) ( not ( = ?auto_57087 ?auto_57089 ) ) ( not ( = ?auto_57090 ?auto_57095 ) ) ( HOIST-AT ?auto_57091 ?auto_57090 ) ( not ( = ?auto_57096 ?auto_57091 ) ) ( SURFACE-AT ?auto_57089 ?auto_57090 ) ( ON ?auto_57089 ?auto_57092 ) ( CLEAR ?auto_57089 ) ( not ( = ?auto_57088 ?auto_57092 ) ) ( not ( = ?auto_57089 ?auto_57092 ) ) ( not ( = ?auto_57087 ?auto_57092 ) ) ( IS-CRATE ?auto_57088 ) ( AVAILABLE ?auto_57091 ) ( SURFACE-AT ?auto_57088 ?auto_57090 ) ( ON ?auto_57088 ?auto_57093 ) ( CLEAR ?auto_57088 ) ( not ( = ?auto_57088 ?auto_57093 ) ) ( not ( = ?auto_57089 ?auto_57093 ) ) ( not ( = ?auto_57087 ?auto_57093 ) ) ( not ( = ?auto_57092 ?auto_57093 ) ) ( TRUCK-AT ?auto_57094 ?auto_57095 ) ( SURFACE-AT ?auto_57086 ?auto_57095 ) ( CLEAR ?auto_57086 ) ( LIFTING ?auto_57096 ?auto_57087 ) ( IS-CRATE ?auto_57087 ) ( not ( = ?auto_57086 ?auto_57087 ) ) ( not ( = ?auto_57088 ?auto_57086 ) ) ( not ( = ?auto_57089 ?auto_57086 ) ) ( not ( = ?auto_57092 ?auto_57086 ) ) ( not ( = ?auto_57093 ?auto_57086 ) ) ( ON ?auto_57085 ?auto_57084 ) ( ON ?auto_57086 ?auto_57085 ) ( not ( = ?auto_57084 ?auto_57085 ) ) ( not ( = ?auto_57084 ?auto_57086 ) ) ( not ( = ?auto_57084 ?auto_57087 ) ) ( not ( = ?auto_57084 ?auto_57088 ) ) ( not ( = ?auto_57084 ?auto_57089 ) ) ( not ( = ?auto_57084 ?auto_57092 ) ) ( not ( = ?auto_57084 ?auto_57093 ) ) ( not ( = ?auto_57085 ?auto_57086 ) ) ( not ( = ?auto_57085 ?auto_57087 ) ) ( not ( = ?auto_57085 ?auto_57088 ) ) ( not ( = ?auto_57085 ?auto_57089 ) ) ( not ( = ?auto_57085 ?auto_57092 ) ) ( not ( = ?auto_57085 ?auto_57093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_57087 ?auto_57088 ?auto_57089 )
      ( MAKE-5CRATE-VERIFY ?auto_57084 ?auto_57085 ?auto_57086 ?auto_57087 ?auto_57088 ?auto_57089 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_57198 - SURFACE
      ?auto_57199 - SURFACE
    )
    :vars
    (
      ?auto_57205 - HOIST
      ?auto_57204 - PLACE
      ?auto_57201 - SURFACE
      ?auto_57203 - PLACE
      ?auto_57207 - HOIST
      ?auto_57206 - SURFACE
      ?auto_57202 - TRUCK
      ?auto_57200 - SURFACE
      ?auto_57208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57205 ?auto_57204 ) ( IS-CRATE ?auto_57199 ) ( not ( = ?auto_57198 ?auto_57199 ) ) ( not ( = ?auto_57201 ?auto_57198 ) ) ( not ( = ?auto_57201 ?auto_57199 ) ) ( not ( = ?auto_57203 ?auto_57204 ) ) ( HOIST-AT ?auto_57207 ?auto_57203 ) ( not ( = ?auto_57205 ?auto_57207 ) ) ( SURFACE-AT ?auto_57199 ?auto_57203 ) ( ON ?auto_57199 ?auto_57206 ) ( CLEAR ?auto_57199 ) ( not ( = ?auto_57198 ?auto_57206 ) ) ( not ( = ?auto_57199 ?auto_57206 ) ) ( not ( = ?auto_57201 ?auto_57206 ) ) ( SURFACE-AT ?auto_57201 ?auto_57204 ) ( CLEAR ?auto_57201 ) ( IS-CRATE ?auto_57198 ) ( AVAILABLE ?auto_57205 ) ( TRUCK-AT ?auto_57202 ?auto_57203 ) ( SURFACE-AT ?auto_57198 ?auto_57203 ) ( ON ?auto_57198 ?auto_57200 ) ( CLEAR ?auto_57198 ) ( not ( = ?auto_57198 ?auto_57200 ) ) ( not ( = ?auto_57199 ?auto_57200 ) ) ( not ( = ?auto_57201 ?auto_57200 ) ) ( not ( = ?auto_57206 ?auto_57200 ) ) ( LIFTING ?auto_57207 ?auto_57208 ) ( IS-CRATE ?auto_57208 ) ( not ( = ?auto_57198 ?auto_57208 ) ) ( not ( = ?auto_57199 ?auto_57208 ) ) ( not ( = ?auto_57201 ?auto_57208 ) ) ( not ( = ?auto_57206 ?auto_57208 ) ) ( not ( = ?auto_57200 ?auto_57208 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57207 ?auto_57208 ?auto_57202 ?auto_57203 )
      ( MAKE-1CRATE ?auto_57198 ?auto_57199 )
      ( MAKE-1CRATE-VERIFY ?auto_57198 ?auto_57199 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58032 - SURFACE
      ?auto_58033 - SURFACE
      ?auto_58034 - SURFACE
      ?auto_58035 - SURFACE
      ?auto_58036 - SURFACE
      ?auto_58037 - SURFACE
      ?auto_58038 - SURFACE
    )
    :vars
    (
      ?auto_58040 - HOIST
      ?auto_58039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58040 ?auto_58039 ) ( SURFACE-AT ?auto_58037 ?auto_58039 ) ( CLEAR ?auto_58037 ) ( LIFTING ?auto_58040 ?auto_58038 ) ( IS-CRATE ?auto_58038 ) ( not ( = ?auto_58037 ?auto_58038 ) ) ( ON ?auto_58033 ?auto_58032 ) ( ON ?auto_58034 ?auto_58033 ) ( ON ?auto_58035 ?auto_58034 ) ( ON ?auto_58036 ?auto_58035 ) ( ON ?auto_58037 ?auto_58036 ) ( not ( = ?auto_58032 ?auto_58033 ) ) ( not ( = ?auto_58032 ?auto_58034 ) ) ( not ( = ?auto_58032 ?auto_58035 ) ) ( not ( = ?auto_58032 ?auto_58036 ) ) ( not ( = ?auto_58032 ?auto_58037 ) ) ( not ( = ?auto_58032 ?auto_58038 ) ) ( not ( = ?auto_58033 ?auto_58034 ) ) ( not ( = ?auto_58033 ?auto_58035 ) ) ( not ( = ?auto_58033 ?auto_58036 ) ) ( not ( = ?auto_58033 ?auto_58037 ) ) ( not ( = ?auto_58033 ?auto_58038 ) ) ( not ( = ?auto_58034 ?auto_58035 ) ) ( not ( = ?auto_58034 ?auto_58036 ) ) ( not ( = ?auto_58034 ?auto_58037 ) ) ( not ( = ?auto_58034 ?auto_58038 ) ) ( not ( = ?auto_58035 ?auto_58036 ) ) ( not ( = ?auto_58035 ?auto_58037 ) ) ( not ( = ?auto_58035 ?auto_58038 ) ) ( not ( = ?auto_58036 ?auto_58037 ) ) ( not ( = ?auto_58036 ?auto_58038 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_58037 ?auto_58038 )
      ( MAKE-6CRATE-VERIFY ?auto_58032 ?auto_58033 ?auto_58034 ?auto_58035 ?auto_58036 ?auto_58037 ?auto_58038 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58076 - SURFACE
      ?auto_58077 - SURFACE
      ?auto_58078 - SURFACE
      ?auto_58079 - SURFACE
      ?auto_58080 - SURFACE
      ?auto_58081 - SURFACE
      ?auto_58082 - SURFACE
    )
    :vars
    (
      ?auto_58085 - HOIST
      ?auto_58084 - PLACE
      ?auto_58083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58085 ?auto_58084 ) ( SURFACE-AT ?auto_58081 ?auto_58084 ) ( CLEAR ?auto_58081 ) ( IS-CRATE ?auto_58082 ) ( not ( = ?auto_58081 ?auto_58082 ) ) ( TRUCK-AT ?auto_58083 ?auto_58084 ) ( AVAILABLE ?auto_58085 ) ( IN ?auto_58082 ?auto_58083 ) ( ON ?auto_58081 ?auto_58080 ) ( not ( = ?auto_58080 ?auto_58081 ) ) ( not ( = ?auto_58080 ?auto_58082 ) ) ( ON ?auto_58077 ?auto_58076 ) ( ON ?auto_58078 ?auto_58077 ) ( ON ?auto_58079 ?auto_58078 ) ( ON ?auto_58080 ?auto_58079 ) ( not ( = ?auto_58076 ?auto_58077 ) ) ( not ( = ?auto_58076 ?auto_58078 ) ) ( not ( = ?auto_58076 ?auto_58079 ) ) ( not ( = ?auto_58076 ?auto_58080 ) ) ( not ( = ?auto_58076 ?auto_58081 ) ) ( not ( = ?auto_58076 ?auto_58082 ) ) ( not ( = ?auto_58077 ?auto_58078 ) ) ( not ( = ?auto_58077 ?auto_58079 ) ) ( not ( = ?auto_58077 ?auto_58080 ) ) ( not ( = ?auto_58077 ?auto_58081 ) ) ( not ( = ?auto_58077 ?auto_58082 ) ) ( not ( = ?auto_58078 ?auto_58079 ) ) ( not ( = ?auto_58078 ?auto_58080 ) ) ( not ( = ?auto_58078 ?auto_58081 ) ) ( not ( = ?auto_58078 ?auto_58082 ) ) ( not ( = ?auto_58079 ?auto_58080 ) ) ( not ( = ?auto_58079 ?auto_58081 ) ) ( not ( = ?auto_58079 ?auto_58082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58080 ?auto_58081 ?auto_58082 )
      ( MAKE-6CRATE-VERIFY ?auto_58076 ?auto_58077 ?auto_58078 ?auto_58079 ?auto_58080 ?auto_58081 ?auto_58082 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58127 - SURFACE
      ?auto_58128 - SURFACE
      ?auto_58129 - SURFACE
      ?auto_58130 - SURFACE
      ?auto_58131 - SURFACE
      ?auto_58132 - SURFACE
      ?auto_58133 - SURFACE
    )
    :vars
    (
      ?auto_58137 - HOIST
      ?auto_58135 - PLACE
      ?auto_58136 - TRUCK
      ?auto_58134 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58137 ?auto_58135 ) ( SURFACE-AT ?auto_58132 ?auto_58135 ) ( CLEAR ?auto_58132 ) ( IS-CRATE ?auto_58133 ) ( not ( = ?auto_58132 ?auto_58133 ) ) ( AVAILABLE ?auto_58137 ) ( IN ?auto_58133 ?auto_58136 ) ( ON ?auto_58132 ?auto_58131 ) ( not ( = ?auto_58131 ?auto_58132 ) ) ( not ( = ?auto_58131 ?auto_58133 ) ) ( TRUCK-AT ?auto_58136 ?auto_58134 ) ( not ( = ?auto_58134 ?auto_58135 ) ) ( ON ?auto_58128 ?auto_58127 ) ( ON ?auto_58129 ?auto_58128 ) ( ON ?auto_58130 ?auto_58129 ) ( ON ?auto_58131 ?auto_58130 ) ( not ( = ?auto_58127 ?auto_58128 ) ) ( not ( = ?auto_58127 ?auto_58129 ) ) ( not ( = ?auto_58127 ?auto_58130 ) ) ( not ( = ?auto_58127 ?auto_58131 ) ) ( not ( = ?auto_58127 ?auto_58132 ) ) ( not ( = ?auto_58127 ?auto_58133 ) ) ( not ( = ?auto_58128 ?auto_58129 ) ) ( not ( = ?auto_58128 ?auto_58130 ) ) ( not ( = ?auto_58128 ?auto_58131 ) ) ( not ( = ?auto_58128 ?auto_58132 ) ) ( not ( = ?auto_58128 ?auto_58133 ) ) ( not ( = ?auto_58129 ?auto_58130 ) ) ( not ( = ?auto_58129 ?auto_58131 ) ) ( not ( = ?auto_58129 ?auto_58132 ) ) ( not ( = ?auto_58129 ?auto_58133 ) ) ( not ( = ?auto_58130 ?auto_58131 ) ) ( not ( = ?auto_58130 ?auto_58132 ) ) ( not ( = ?auto_58130 ?auto_58133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58131 ?auto_58132 ?auto_58133 )
      ( MAKE-6CRATE-VERIFY ?auto_58127 ?auto_58128 ?auto_58129 ?auto_58130 ?auto_58131 ?auto_58132 ?auto_58133 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58184 - SURFACE
      ?auto_58185 - SURFACE
      ?auto_58186 - SURFACE
      ?auto_58187 - SURFACE
      ?auto_58188 - SURFACE
      ?auto_58189 - SURFACE
      ?auto_58190 - SURFACE
    )
    :vars
    (
      ?auto_58192 - HOIST
      ?auto_58191 - PLACE
      ?auto_58195 - TRUCK
      ?auto_58194 - PLACE
      ?auto_58193 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_58192 ?auto_58191 ) ( SURFACE-AT ?auto_58189 ?auto_58191 ) ( CLEAR ?auto_58189 ) ( IS-CRATE ?auto_58190 ) ( not ( = ?auto_58189 ?auto_58190 ) ) ( AVAILABLE ?auto_58192 ) ( ON ?auto_58189 ?auto_58188 ) ( not ( = ?auto_58188 ?auto_58189 ) ) ( not ( = ?auto_58188 ?auto_58190 ) ) ( TRUCK-AT ?auto_58195 ?auto_58194 ) ( not ( = ?auto_58194 ?auto_58191 ) ) ( HOIST-AT ?auto_58193 ?auto_58194 ) ( LIFTING ?auto_58193 ?auto_58190 ) ( not ( = ?auto_58192 ?auto_58193 ) ) ( ON ?auto_58185 ?auto_58184 ) ( ON ?auto_58186 ?auto_58185 ) ( ON ?auto_58187 ?auto_58186 ) ( ON ?auto_58188 ?auto_58187 ) ( not ( = ?auto_58184 ?auto_58185 ) ) ( not ( = ?auto_58184 ?auto_58186 ) ) ( not ( = ?auto_58184 ?auto_58187 ) ) ( not ( = ?auto_58184 ?auto_58188 ) ) ( not ( = ?auto_58184 ?auto_58189 ) ) ( not ( = ?auto_58184 ?auto_58190 ) ) ( not ( = ?auto_58185 ?auto_58186 ) ) ( not ( = ?auto_58185 ?auto_58187 ) ) ( not ( = ?auto_58185 ?auto_58188 ) ) ( not ( = ?auto_58185 ?auto_58189 ) ) ( not ( = ?auto_58185 ?auto_58190 ) ) ( not ( = ?auto_58186 ?auto_58187 ) ) ( not ( = ?auto_58186 ?auto_58188 ) ) ( not ( = ?auto_58186 ?auto_58189 ) ) ( not ( = ?auto_58186 ?auto_58190 ) ) ( not ( = ?auto_58187 ?auto_58188 ) ) ( not ( = ?auto_58187 ?auto_58189 ) ) ( not ( = ?auto_58187 ?auto_58190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58188 ?auto_58189 ?auto_58190 )
      ( MAKE-6CRATE-VERIFY ?auto_58184 ?auto_58185 ?auto_58186 ?auto_58187 ?auto_58188 ?auto_58189 ?auto_58190 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58247 - SURFACE
      ?auto_58248 - SURFACE
      ?auto_58249 - SURFACE
      ?auto_58250 - SURFACE
      ?auto_58251 - SURFACE
      ?auto_58252 - SURFACE
      ?auto_58253 - SURFACE
    )
    :vars
    (
      ?auto_58254 - HOIST
      ?auto_58259 - PLACE
      ?auto_58255 - TRUCK
      ?auto_58256 - PLACE
      ?auto_58257 - HOIST
      ?auto_58258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58254 ?auto_58259 ) ( SURFACE-AT ?auto_58252 ?auto_58259 ) ( CLEAR ?auto_58252 ) ( IS-CRATE ?auto_58253 ) ( not ( = ?auto_58252 ?auto_58253 ) ) ( AVAILABLE ?auto_58254 ) ( ON ?auto_58252 ?auto_58251 ) ( not ( = ?auto_58251 ?auto_58252 ) ) ( not ( = ?auto_58251 ?auto_58253 ) ) ( TRUCK-AT ?auto_58255 ?auto_58256 ) ( not ( = ?auto_58256 ?auto_58259 ) ) ( HOIST-AT ?auto_58257 ?auto_58256 ) ( not ( = ?auto_58254 ?auto_58257 ) ) ( AVAILABLE ?auto_58257 ) ( SURFACE-AT ?auto_58253 ?auto_58256 ) ( ON ?auto_58253 ?auto_58258 ) ( CLEAR ?auto_58253 ) ( not ( = ?auto_58252 ?auto_58258 ) ) ( not ( = ?auto_58253 ?auto_58258 ) ) ( not ( = ?auto_58251 ?auto_58258 ) ) ( ON ?auto_58248 ?auto_58247 ) ( ON ?auto_58249 ?auto_58248 ) ( ON ?auto_58250 ?auto_58249 ) ( ON ?auto_58251 ?auto_58250 ) ( not ( = ?auto_58247 ?auto_58248 ) ) ( not ( = ?auto_58247 ?auto_58249 ) ) ( not ( = ?auto_58247 ?auto_58250 ) ) ( not ( = ?auto_58247 ?auto_58251 ) ) ( not ( = ?auto_58247 ?auto_58252 ) ) ( not ( = ?auto_58247 ?auto_58253 ) ) ( not ( = ?auto_58247 ?auto_58258 ) ) ( not ( = ?auto_58248 ?auto_58249 ) ) ( not ( = ?auto_58248 ?auto_58250 ) ) ( not ( = ?auto_58248 ?auto_58251 ) ) ( not ( = ?auto_58248 ?auto_58252 ) ) ( not ( = ?auto_58248 ?auto_58253 ) ) ( not ( = ?auto_58248 ?auto_58258 ) ) ( not ( = ?auto_58249 ?auto_58250 ) ) ( not ( = ?auto_58249 ?auto_58251 ) ) ( not ( = ?auto_58249 ?auto_58252 ) ) ( not ( = ?auto_58249 ?auto_58253 ) ) ( not ( = ?auto_58249 ?auto_58258 ) ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58252 ) ) ( not ( = ?auto_58250 ?auto_58253 ) ) ( not ( = ?auto_58250 ?auto_58258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58251 ?auto_58252 ?auto_58253 )
      ( MAKE-6CRATE-VERIFY ?auto_58247 ?auto_58248 ?auto_58249 ?auto_58250 ?auto_58251 ?auto_58252 ?auto_58253 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58311 - SURFACE
      ?auto_58312 - SURFACE
      ?auto_58313 - SURFACE
      ?auto_58314 - SURFACE
      ?auto_58315 - SURFACE
      ?auto_58316 - SURFACE
      ?auto_58317 - SURFACE
    )
    :vars
    (
      ?auto_58320 - HOIST
      ?auto_58318 - PLACE
      ?auto_58323 - PLACE
      ?auto_58322 - HOIST
      ?auto_58319 - SURFACE
      ?auto_58321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58320 ?auto_58318 ) ( SURFACE-AT ?auto_58316 ?auto_58318 ) ( CLEAR ?auto_58316 ) ( IS-CRATE ?auto_58317 ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( AVAILABLE ?auto_58320 ) ( ON ?auto_58316 ?auto_58315 ) ( not ( = ?auto_58315 ?auto_58316 ) ) ( not ( = ?auto_58315 ?auto_58317 ) ) ( not ( = ?auto_58323 ?auto_58318 ) ) ( HOIST-AT ?auto_58322 ?auto_58323 ) ( not ( = ?auto_58320 ?auto_58322 ) ) ( AVAILABLE ?auto_58322 ) ( SURFACE-AT ?auto_58317 ?auto_58323 ) ( ON ?auto_58317 ?auto_58319 ) ( CLEAR ?auto_58317 ) ( not ( = ?auto_58316 ?auto_58319 ) ) ( not ( = ?auto_58317 ?auto_58319 ) ) ( not ( = ?auto_58315 ?auto_58319 ) ) ( TRUCK-AT ?auto_58321 ?auto_58318 ) ( ON ?auto_58312 ?auto_58311 ) ( ON ?auto_58313 ?auto_58312 ) ( ON ?auto_58314 ?auto_58313 ) ( ON ?auto_58315 ?auto_58314 ) ( not ( = ?auto_58311 ?auto_58312 ) ) ( not ( = ?auto_58311 ?auto_58313 ) ) ( not ( = ?auto_58311 ?auto_58314 ) ) ( not ( = ?auto_58311 ?auto_58315 ) ) ( not ( = ?auto_58311 ?auto_58316 ) ) ( not ( = ?auto_58311 ?auto_58317 ) ) ( not ( = ?auto_58311 ?auto_58319 ) ) ( not ( = ?auto_58312 ?auto_58313 ) ) ( not ( = ?auto_58312 ?auto_58314 ) ) ( not ( = ?auto_58312 ?auto_58315 ) ) ( not ( = ?auto_58312 ?auto_58316 ) ) ( not ( = ?auto_58312 ?auto_58317 ) ) ( not ( = ?auto_58312 ?auto_58319 ) ) ( not ( = ?auto_58313 ?auto_58314 ) ) ( not ( = ?auto_58313 ?auto_58315 ) ) ( not ( = ?auto_58313 ?auto_58316 ) ) ( not ( = ?auto_58313 ?auto_58317 ) ) ( not ( = ?auto_58313 ?auto_58319 ) ) ( not ( = ?auto_58314 ?auto_58315 ) ) ( not ( = ?auto_58314 ?auto_58316 ) ) ( not ( = ?auto_58314 ?auto_58317 ) ) ( not ( = ?auto_58314 ?auto_58319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58315 ?auto_58316 ?auto_58317 )
      ( MAKE-6CRATE-VERIFY ?auto_58311 ?auto_58312 ?auto_58313 ?auto_58314 ?auto_58315 ?auto_58316 ?auto_58317 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58375 - SURFACE
      ?auto_58376 - SURFACE
      ?auto_58377 - SURFACE
      ?auto_58378 - SURFACE
      ?auto_58379 - SURFACE
      ?auto_58380 - SURFACE
      ?auto_58381 - SURFACE
    )
    :vars
    (
      ?auto_58387 - HOIST
      ?auto_58384 - PLACE
      ?auto_58385 - PLACE
      ?auto_58386 - HOIST
      ?auto_58382 - SURFACE
      ?auto_58383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58387 ?auto_58384 ) ( IS-CRATE ?auto_58381 ) ( not ( = ?auto_58380 ?auto_58381 ) ) ( not ( = ?auto_58379 ?auto_58380 ) ) ( not ( = ?auto_58379 ?auto_58381 ) ) ( not ( = ?auto_58385 ?auto_58384 ) ) ( HOIST-AT ?auto_58386 ?auto_58385 ) ( not ( = ?auto_58387 ?auto_58386 ) ) ( AVAILABLE ?auto_58386 ) ( SURFACE-AT ?auto_58381 ?auto_58385 ) ( ON ?auto_58381 ?auto_58382 ) ( CLEAR ?auto_58381 ) ( not ( = ?auto_58380 ?auto_58382 ) ) ( not ( = ?auto_58381 ?auto_58382 ) ) ( not ( = ?auto_58379 ?auto_58382 ) ) ( TRUCK-AT ?auto_58383 ?auto_58384 ) ( SURFACE-AT ?auto_58379 ?auto_58384 ) ( CLEAR ?auto_58379 ) ( LIFTING ?auto_58387 ?auto_58380 ) ( IS-CRATE ?auto_58380 ) ( ON ?auto_58376 ?auto_58375 ) ( ON ?auto_58377 ?auto_58376 ) ( ON ?auto_58378 ?auto_58377 ) ( ON ?auto_58379 ?auto_58378 ) ( not ( = ?auto_58375 ?auto_58376 ) ) ( not ( = ?auto_58375 ?auto_58377 ) ) ( not ( = ?auto_58375 ?auto_58378 ) ) ( not ( = ?auto_58375 ?auto_58379 ) ) ( not ( = ?auto_58375 ?auto_58380 ) ) ( not ( = ?auto_58375 ?auto_58381 ) ) ( not ( = ?auto_58375 ?auto_58382 ) ) ( not ( = ?auto_58376 ?auto_58377 ) ) ( not ( = ?auto_58376 ?auto_58378 ) ) ( not ( = ?auto_58376 ?auto_58379 ) ) ( not ( = ?auto_58376 ?auto_58380 ) ) ( not ( = ?auto_58376 ?auto_58381 ) ) ( not ( = ?auto_58376 ?auto_58382 ) ) ( not ( = ?auto_58377 ?auto_58378 ) ) ( not ( = ?auto_58377 ?auto_58379 ) ) ( not ( = ?auto_58377 ?auto_58380 ) ) ( not ( = ?auto_58377 ?auto_58381 ) ) ( not ( = ?auto_58377 ?auto_58382 ) ) ( not ( = ?auto_58378 ?auto_58379 ) ) ( not ( = ?auto_58378 ?auto_58380 ) ) ( not ( = ?auto_58378 ?auto_58381 ) ) ( not ( = ?auto_58378 ?auto_58382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58379 ?auto_58380 ?auto_58381 )
      ( MAKE-6CRATE-VERIFY ?auto_58375 ?auto_58376 ?auto_58377 ?auto_58378 ?auto_58379 ?auto_58380 ?auto_58381 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_58439 - SURFACE
      ?auto_58440 - SURFACE
      ?auto_58441 - SURFACE
      ?auto_58442 - SURFACE
      ?auto_58443 - SURFACE
      ?auto_58444 - SURFACE
      ?auto_58445 - SURFACE
    )
    :vars
    (
      ?auto_58447 - HOIST
      ?auto_58450 - PLACE
      ?auto_58451 - PLACE
      ?auto_58449 - HOIST
      ?auto_58448 - SURFACE
      ?auto_58446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_58447 ?auto_58450 ) ( IS-CRATE ?auto_58445 ) ( not ( = ?auto_58444 ?auto_58445 ) ) ( not ( = ?auto_58443 ?auto_58444 ) ) ( not ( = ?auto_58443 ?auto_58445 ) ) ( not ( = ?auto_58451 ?auto_58450 ) ) ( HOIST-AT ?auto_58449 ?auto_58451 ) ( not ( = ?auto_58447 ?auto_58449 ) ) ( AVAILABLE ?auto_58449 ) ( SURFACE-AT ?auto_58445 ?auto_58451 ) ( ON ?auto_58445 ?auto_58448 ) ( CLEAR ?auto_58445 ) ( not ( = ?auto_58444 ?auto_58448 ) ) ( not ( = ?auto_58445 ?auto_58448 ) ) ( not ( = ?auto_58443 ?auto_58448 ) ) ( TRUCK-AT ?auto_58446 ?auto_58450 ) ( SURFACE-AT ?auto_58443 ?auto_58450 ) ( CLEAR ?auto_58443 ) ( IS-CRATE ?auto_58444 ) ( AVAILABLE ?auto_58447 ) ( IN ?auto_58444 ?auto_58446 ) ( ON ?auto_58440 ?auto_58439 ) ( ON ?auto_58441 ?auto_58440 ) ( ON ?auto_58442 ?auto_58441 ) ( ON ?auto_58443 ?auto_58442 ) ( not ( = ?auto_58439 ?auto_58440 ) ) ( not ( = ?auto_58439 ?auto_58441 ) ) ( not ( = ?auto_58439 ?auto_58442 ) ) ( not ( = ?auto_58439 ?auto_58443 ) ) ( not ( = ?auto_58439 ?auto_58444 ) ) ( not ( = ?auto_58439 ?auto_58445 ) ) ( not ( = ?auto_58439 ?auto_58448 ) ) ( not ( = ?auto_58440 ?auto_58441 ) ) ( not ( = ?auto_58440 ?auto_58442 ) ) ( not ( = ?auto_58440 ?auto_58443 ) ) ( not ( = ?auto_58440 ?auto_58444 ) ) ( not ( = ?auto_58440 ?auto_58445 ) ) ( not ( = ?auto_58440 ?auto_58448 ) ) ( not ( = ?auto_58441 ?auto_58442 ) ) ( not ( = ?auto_58441 ?auto_58443 ) ) ( not ( = ?auto_58441 ?auto_58444 ) ) ( not ( = ?auto_58441 ?auto_58445 ) ) ( not ( = ?auto_58441 ?auto_58448 ) ) ( not ( = ?auto_58442 ?auto_58443 ) ) ( not ( = ?auto_58442 ?auto_58444 ) ) ( not ( = ?auto_58442 ?auto_58445 ) ) ( not ( = ?auto_58442 ?auto_58448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_58443 ?auto_58444 ?auto_58445 )
      ( MAKE-6CRATE-VERIFY ?auto_58439 ?auto_58440 ?auto_58441 ?auto_58442 ?auto_58443 ?auto_58444 ?auto_58445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_58909 - SURFACE
      ?auto_58910 - SURFACE
    )
    :vars
    (
      ?auto_58913 - HOIST
      ?auto_58916 - PLACE
      ?auto_58914 - SURFACE
      ?auto_58911 - PLACE
      ?auto_58912 - HOIST
      ?auto_58915 - SURFACE
      ?auto_58917 - TRUCK
      ?auto_58918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_58913 ?auto_58916 ) ( SURFACE-AT ?auto_58909 ?auto_58916 ) ( CLEAR ?auto_58909 ) ( IS-CRATE ?auto_58910 ) ( not ( = ?auto_58909 ?auto_58910 ) ) ( ON ?auto_58909 ?auto_58914 ) ( not ( = ?auto_58914 ?auto_58909 ) ) ( not ( = ?auto_58914 ?auto_58910 ) ) ( not ( = ?auto_58911 ?auto_58916 ) ) ( HOIST-AT ?auto_58912 ?auto_58911 ) ( not ( = ?auto_58913 ?auto_58912 ) ) ( AVAILABLE ?auto_58912 ) ( SURFACE-AT ?auto_58910 ?auto_58911 ) ( ON ?auto_58910 ?auto_58915 ) ( CLEAR ?auto_58910 ) ( not ( = ?auto_58909 ?auto_58915 ) ) ( not ( = ?auto_58910 ?auto_58915 ) ) ( not ( = ?auto_58914 ?auto_58915 ) ) ( TRUCK-AT ?auto_58917 ?auto_58916 ) ( LIFTING ?auto_58913 ?auto_58918 ) ( IS-CRATE ?auto_58918 ) ( not ( = ?auto_58909 ?auto_58918 ) ) ( not ( = ?auto_58910 ?auto_58918 ) ) ( not ( = ?auto_58914 ?auto_58918 ) ) ( not ( = ?auto_58915 ?auto_58918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_58913 ?auto_58918 ?auto_58917 ?auto_58916 )
      ( MAKE-1CRATE ?auto_58909 ?auto_58910 )
      ( MAKE-1CRATE-VERIFY ?auto_58909 ?auto_58910 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60362 - SURFACE
      ?auto_60363 - SURFACE
      ?auto_60364 - SURFACE
      ?auto_60365 - SURFACE
      ?auto_60366 - SURFACE
      ?auto_60367 - SURFACE
      ?auto_60368 - SURFACE
      ?auto_60369 - SURFACE
    )
    :vars
    (
      ?auto_60371 - HOIST
      ?auto_60370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60371 ?auto_60370 ) ( SURFACE-AT ?auto_60368 ?auto_60370 ) ( CLEAR ?auto_60368 ) ( LIFTING ?auto_60371 ?auto_60369 ) ( IS-CRATE ?auto_60369 ) ( not ( = ?auto_60368 ?auto_60369 ) ) ( ON ?auto_60363 ?auto_60362 ) ( ON ?auto_60364 ?auto_60363 ) ( ON ?auto_60365 ?auto_60364 ) ( ON ?auto_60366 ?auto_60365 ) ( ON ?auto_60367 ?auto_60366 ) ( ON ?auto_60368 ?auto_60367 ) ( not ( = ?auto_60362 ?auto_60363 ) ) ( not ( = ?auto_60362 ?auto_60364 ) ) ( not ( = ?auto_60362 ?auto_60365 ) ) ( not ( = ?auto_60362 ?auto_60366 ) ) ( not ( = ?auto_60362 ?auto_60367 ) ) ( not ( = ?auto_60362 ?auto_60368 ) ) ( not ( = ?auto_60362 ?auto_60369 ) ) ( not ( = ?auto_60363 ?auto_60364 ) ) ( not ( = ?auto_60363 ?auto_60365 ) ) ( not ( = ?auto_60363 ?auto_60366 ) ) ( not ( = ?auto_60363 ?auto_60367 ) ) ( not ( = ?auto_60363 ?auto_60368 ) ) ( not ( = ?auto_60363 ?auto_60369 ) ) ( not ( = ?auto_60364 ?auto_60365 ) ) ( not ( = ?auto_60364 ?auto_60366 ) ) ( not ( = ?auto_60364 ?auto_60367 ) ) ( not ( = ?auto_60364 ?auto_60368 ) ) ( not ( = ?auto_60364 ?auto_60369 ) ) ( not ( = ?auto_60365 ?auto_60366 ) ) ( not ( = ?auto_60365 ?auto_60367 ) ) ( not ( = ?auto_60365 ?auto_60368 ) ) ( not ( = ?auto_60365 ?auto_60369 ) ) ( not ( = ?auto_60366 ?auto_60367 ) ) ( not ( = ?auto_60366 ?auto_60368 ) ) ( not ( = ?auto_60366 ?auto_60369 ) ) ( not ( = ?auto_60367 ?auto_60368 ) ) ( not ( = ?auto_60367 ?auto_60369 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_60368 ?auto_60369 )
      ( MAKE-7CRATE-VERIFY ?auto_60362 ?auto_60363 ?auto_60364 ?auto_60365 ?auto_60366 ?auto_60367 ?auto_60368 ?auto_60369 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60417 - SURFACE
      ?auto_60418 - SURFACE
      ?auto_60419 - SURFACE
      ?auto_60420 - SURFACE
      ?auto_60421 - SURFACE
      ?auto_60422 - SURFACE
      ?auto_60423 - SURFACE
      ?auto_60424 - SURFACE
    )
    :vars
    (
      ?auto_60427 - HOIST
      ?auto_60426 - PLACE
      ?auto_60425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60427 ?auto_60426 ) ( SURFACE-AT ?auto_60423 ?auto_60426 ) ( CLEAR ?auto_60423 ) ( IS-CRATE ?auto_60424 ) ( not ( = ?auto_60423 ?auto_60424 ) ) ( TRUCK-AT ?auto_60425 ?auto_60426 ) ( AVAILABLE ?auto_60427 ) ( IN ?auto_60424 ?auto_60425 ) ( ON ?auto_60423 ?auto_60422 ) ( not ( = ?auto_60422 ?auto_60423 ) ) ( not ( = ?auto_60422 ?auto_60424 ) ) ( ON ?auto_60418 ?auto_60417 ) ( ON ?auto_60419 ?auto_60418 ) ( ON ?auto_60420 ?auto_60419 ) ( ON ?auto_60421 ?auto_60420 ) ( ON ?auto_60422 ?auto_60421 ) ( not ( = ?auto_60417 ?auto_60418 ) ) ( not ( = ?auto_60417 ?auto_60419 ) ) ( not ( = ?auto_60417 ?auto_60420 ) ) ( not ( = ?auto_60417 ?auto_60421 ) ) ( not ( = ?auto_60417 ?auto_60422 ) ) ( not ( = ?auto_60417 ?auto_60423 ) ) ( not ( = ?auto_60417 ?auto_60424 ) ) ( not ( = ?auto_60418 ?auto_60419 ) ) ( not ( = ?auto_60418 ?auto_60420 ) ) ( not ( = ?auto_60418 ?auto_60421 ) ) ( not ( = ?auto_60418 ?auto_60422 ) ) ( not ( = ?auto_60418 ?auto_60423 ) ) ( not ( = ?auto_60418 ?auto_60424 ) ) ( not ( = ?auto_60419 ?auto_60420 ) ) ( not ( = ?auto_60419 ?auto_60421 ) ) ( not ( = ?auto_60419 ?auto_60422 ) ) ( not ( = ?auto_60419 ?auto_60423 ) ) ( not ( = ?auto_60419 ?auto_60424 ) ) ( not ( = ?auto_60420 ?auto_60421 ) ) ( not ( = ?auto_60420 ?auto_60422 ) ) ( not ( = ?auto_60420 ?auto_60423 ) ) ( not ( = ?auto_60420 ?auto_60424 ) ) ( not ( = ?auto_60421 ?auto_60422 ) ) ( not ( = ?auto_60421 ?auto_60423 ) ) ( not ( = ?auto_60421 ?auto_60424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60422 ?auto_60423 ?auto_60424 )
      ( MAKE-7CRATE-VERIFY ?auto_60417 ?auto_60418 ?auto_60419 ?auto_60420 ?auto_60421 ?auto_60422 ?auto_60423 ?auto_60424 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60480 - SURFACE
      ?auto_60481 - SURFACE
      ?auto_60482 - SURFACE
      ?auto_60483 - SURFACE
      ?auto_60484 - SURFACE
      ?auto_60485 - SURFACE
      ?auto_60486 - SURFACE
      ?auto_60487 - SURFACE
    )
    :vars
    (
      ?auto_60491 - HOIST
      ?auto_60488 - PLACE
      ?auto_60489 - TRUCK
      ?auto_60490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60491 ?auto_60488 ) ( SURFACE-AT ?auto_60486 ?auto_60488 ) ( CLEAR ?auto_60486 ) ( IS-CRATE ?auto_60487 ) ( not ( = ?auto_60486 ?auto_60487 ) ) ( AVAILABLE ?auto_60491 ) ( IN ?auto_60487 ?auto_60489 ) ( ON ?auto_60486 ?auto_60485 ) ( not ( = ?auto_60485 ?auto_60486 ) ) ( not ( = ?auto_60485 ?auto_60487 ) ) ( TRUCK-AT ?auto_60489 ?auto_60490 ) ( not ( = ?auto_60490 ?auto_60488 ) ) ( ON ?auto_60481 ?auto_60480 ) ( ON ?auto_60482 ?auto_60481 ) ( ON ?auto_60483 ?auto_60482 ) ( ON ?auto_60484 ?auto_60483 ) ( ON ?auto_60485 ?auto_60484 ) ( not ( = ?auto_60480 ?auto_60481 ) ) ( not ( = ?auto_60480 ?auto_60482 ) ) ( not ( = ?auto_60480 ?auto_60483 ) ) ( not ( = ?auto_60480 ?auto_60484 ) ) ( not ( = ?auto_60480 ?auto_60485 ) ) ( not ( = ?auto_60480 ?auto_60486 ) ) ( not ( = ?auto_60480 ?auto_60487 ) ) ( not ( = ?auto_60481 ?auto_60482 ) ) ( not ( = ?auto_60481 ?auto_60483 ) ) ( not ( = ?auto_60481 ?auto_60484 ) ) ( not ( = ?auto_60481 ?auto_60485 ) ) ( not ( = ?auto_60481 ?auto_60486 ) ) ( not ( = ?auto_60481 ?auto_60487 ) ) ( not ( = ?auto_60482 ?auto_60483 ) ) ( not ( = ?auto_60482 ?auto_60484 ) ) ( not ( = ?auto_60482 ?auto_60485 ) ) ( not ( = ?auto_60482 ?auto_60486 ) ) ( not ( = ?auto_60482 ?auto_60487 ) ) ( not ( = ?auto_60483 ?auto_60484 ) ) ( not ( = ?auto_60483 ?auto_60485 ) ) ( not ( = ?auto_60483 ?auto_60486 ) ) ( not ( = ?auto_60483 ?auto_60487 ) ) ( not ( = ?auto_60484 ?auto_60485 ) ) ( not ( = ?auto_60484 ?auto_60486 ) ) ( not ( = ?auto_60484 ?auto_60487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60485 ?auto_60486 ?auto_60487 )
      ( MAKE-7CRATE-VERIFY ?auto_60480 ?auto_60481 ?auto_60482 ?auto_60483 ?auto_60484 ?auto_60485 ?auto_60486 ?auto_60487 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60550 - SURFACE
      ?auto_60551 - SURFACE
      ?auto_60552 - SURFACE
      ?auto_60553 - SURFACE
      ?auto_60554 - SURFACE
      ?auto_60555 - SURFACE
      ?auto_60556 - SURFACE
      ?auto_60557 - SURFACE
    )
    :vars
    (
      ?auto_60559 - HOIST
      ?auto_60558 - PLACE
      ?auto_60562 - TRUCK
      ?auto_60561 - PLACE
      ?auto_60560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60559 ?auto_60558 ) ( SURFACE-AT ?auto_60556 ?auto_60558 ) ( CLEAR ?auto_60556 ) ( IS-CRATE ?auto_60557 ) ( not ( = ?auto_60556 ?auto_60557 ) ) ( AVAILABLE ?auto_60559 ) ( ON ?auto_60556 ?auto_60555 ) ( not ( = ?auto_60555 ?auto_60556 ) ) ( not ( = ?auto_60555 ?auto_60557 ) ) ( TRUCK-AT ?auto_60562 ?auto_60561 ) ( not ( = ?auto_60561 ?auto_60558 ) ) ( HOIST-AT ?auto_60560 ?auto_60561 ) ( LIFTING ?auto_60560 ?auto_60557 ) ( not ( = ?auto_60559 ?auto_60560 ) ) ( ON ?auto_60551 ?auto_60550 ) ( ON ?auto_60552 ?auto_60551 ) ( ON ?auto_60553 ?auto_60552 ) ( ON ?auto_60554 ?auto_60553 ) ( ON ?auto_60555 ?auto_60554 ) ( not ( = ?auto_60550 ?auto_60551 ) ) ( not ( = ?auto_60550 ?auto_60552 ) ) ( not ( = ?auto_60550 ?auto_60553 ) ) ( not ( = ?auto_60550 ?auto_60554 ) ) ( not ( = ?auto_60550 ?auto_60555 ) ) ( not ( = ?auto_60550 ?auto_60556 ) ) ( not ( = ?auto_60550 ?auto_60557 ) ) ( not ( = ?auto_60551 ?auto_60552 ) ) ( not ( = ?auto_60551 ?auto_60553 ) ) ( not ( = ?auto_60551 ?auto_60554 ) ) ( not ( = ?auto_60551 ?auto_60555 ) ) ( not ( = ?auto_60551 ?auto_60556 ) ) ( not ( = ?auto_60551 ?auto_60557 ) ) ( not ( = ?auto_60552 ?auto_60553 ) ) ( not ( = ?auto_60552 ?auto_60554 ) ) ( not ( = ?auto_60552 ?auto_60555 ) ) ( not ( = ?auto_60552 ?auto_60556 ) ) ( not ( = ?auto_60552 ?auto_60557 ) ) ( not ( = ?auto_60553 ?auto_60554 ) ) ( not ( = ?auto_60553 ?auto_60555 ) ) ( not ( = ?auto_60553 ?auto_60556 ) ) ( not ( = ?auto_60553 ?auto_60557 ) ) ( not ( = ?auto_60554 ?auto_60555 ) ) ( not ( = ?auto_60554 ?auto_60556 ) ) ( not ( = ?auto_60554 ?auto_60557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60555 ?auto_60556 ?auto_60557 )
      ( MAKE-7CRATE-VERIFY ?auto_60550 ?auto_60551 ?auto_60552 ?auto_60553 ?auto_60554 ?auto_60555 ?auto_60556 ?auto_60557 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60627 - SURFACE
      ?auto_60628 - SURFACE
      ?auto_60629 - SURFACE
      ?auto_60630 - SURFACE
      ?auto_60631 - SURFACE
      ?auto_60632 - SURFACE
      ?auto_60633 - SURFACE
      ?auto_60634 - SURFACE
    )
    :vars
    (
      ?auto_60640 - HOIST
      ?auto_60636 - PLACE
      ?auto_60637 - TRUCK
      ?auto_60638 - PLACE
      ?auto_60639 - HOIST
      ?auto_60635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_60640 ?auto_60636 ) ( SURFACE-AT ?auto_60633 ?auto_60636 ) ( CLEAR ?auto_60633 ) ( IS-CRATE ?auto_60634 ) ( not ( = ?auto_60633 ?auto_60634 ) ) ( AVAILABLE ?auto_60640 ) ( ON ?auto_60633 ?auto_60632 ) ( not ( = ?auto_60632 ?auto_60633 ) ) ( not ( = ?auto_60632 ?auto_60634 ) ) ( TRUCK-AT ?auto_60637 ?auto_60638 ) ( not ( = ?auto_60638 ?auto_60636 ) ) ( HOIST-AT ?auto_60639 ?auto_60638 ) ( not ( = ?auto_60640 ?auto_60639 ) ) ( AVAILABLE ?auto_60639 ) ( SURFACE-AT ?auto_60634 ?auto_60638 ) ( ON ?auto_60634 ?auto_60635 ) ( CLEAR ?auto_60634 ) ( not ( = ?auto_60633 ?auto_60635 ) ) ( not ( = ?auto_60634 ?auto_60635 ) ) ( not ( = ?auto_60632 ?auto_60635 ) ) ( ON ?auto_60628 ?auto_60627 ) ( ON ?auto_60629 ?auto_60628 ) ( ON ?auto_60630 ?auto_60629 ) ( ON ?auto_60631 ?auto_60630 ) ( ON ?auto_60632 ?auto_60631 ) ( not ( = ?auto_60627 ?auto_60628 ) ) ( not ( = ?auto_60627 ?auto_60629 ) ) ( not ( = ?auto_60627 ?auto_60630 ) ) ( not ( = ?auto_60627 ?auto_60631 ) ) ( not ( = ?auto_60627 ?auto_60632 ) ) ( not ( = ?auto_60627 ?auto_60633 ) ) ( not ( = ?auto_60627 ?auto_60634 ) ) ( not ( = ?auto_60627 ?auto_60635 ) ) ( not ( = ?auto_60628 ?auto_60629 ) ) ( not ( = ?auto_60628 ?auto_60630 ) ) ( not ( = ?auto_60628 ?auto_60631 ) ) ( not ( = ?auto_60628 ?auto_60632 ) ) ( not ( = ?auto_60628 ?auto_60633 ) ) ( not ( = ?auto_60628 ?auto_60634 ) ) ( not ( = ?auto_60628 ?auto_60635 ) ) ( not ( = ?auto_60629 ?auto_60630 ) ) ( not ( = ?auto_60629 ?auto_60631 ) ) ( not ( = ?auto_60629 ?auto_60632 ) ) ( not ( = ?auto_60629 ?auto_60633 ) ) ( not ( = ?auto_60629 ?auto_60634 ) ) ( not ( = ?auto_60629 ?auto_60635 ) ) ( not ( = ?auto_60630 ?auto_60631 ) ) ( not ( = ?auto_60630 ?auto_60632 ) ) ( not ( = ?auto_60630 ?auto_60633 ) ) ( not ( = ?auto_60630 ?auto_60634 ) ) ( not ( = ?auto_60630 ?auto_60635 ) ) ( not ( = ?auto_60631 ?auto_60632 ) ) ( not ( = ?auto_60631 ?auto_60633 ) ) ( not ( = ?auto_60631 ?auto_60634 ) ) ( not ( = ?auto_60631 ?auto_60635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60632 ?auto_60633 ?auto_60634 )
      ( MAKE-7CRATE-VERIFY ?auto_60627 ?auto_60628 ?auto_60629 ?auto_60630 ?auto_60631 ?auto_60632 ?auto_60633 ?auto_60634 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60705 - SURFACE
      ?auto_60706 - SURFACE
      ?auto_60707 - SURFACE
      ?auto_60708 - SURFACE
      ?auto_60709 - SURFACE
      ?auto_60710 - SURFACE
      ?auto_60711 - SURFACE
      ?auto_60712 - SURFACE
    )
    :vars
    (
      ?auto_60717 - HOIST
      ?auto_60714 - PLACE
      ?auto_60716 - PLACE
      ?auto_60718 - HOIST
      ?auto_60715 - SURFACE
      ?auto_60713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60717 ?auto_60714 ) ( SURFACE-AT ?auto_60711 ?auto_60714 ) ( CLEAR ?auto_60711 ) ( IS-CRATE ?auto_60712 ) ( not ( = ?auto_60711 ?auto_60712 ) ) ( AVAILABLE ?auto_60717 ) ( ON ?auto_60711 ?auto_60710 ) ( not ( = ?auto_60710 ?auto_60711 ) ) ( not ( = ?auto_60710 ?auto_60712 ) ) ( not ( = ?auto_60716 ?auto_60714 ) ) ( HOIST-AT ?auto_60718 ?auto_60716 ) ( not ( = ?auto_60717 ?auto_60718 ) ) ( AVAILABLE ?auto_60718 ) ( SURFACE-AT ?auto_60712 ?auto_60716 ) ( ON ?auto_60712 ?auto_60715 ) ( CLEAR ?auto_60712 ) ( not ( = ?auto_60711 ?auto_60715 ) ) ( not ( = ?auto_60712 ?auto_60715 ) ) ( not ( = ?auto_60710 ?auto_60715 ) ) ( TRUCK-AT ?auto_60713 ?auto_60714 ) ( ON ?auto_60706 ?auto_60705 ) ( ON ?auto_60707 ?auto_60706 ) ( ON ?auto_60708 ?auto_60707 ) ( ON ?auto_60709 ?auto_60708 ) ( ON ?auto_60710 ?auto_60709 ) ( not ( = ?auto_60705 ?auto_60706 ) ) ( not ( = ?auto_60705 ?auto_60707 ) ) ( not ( = ?auto_60705 ?auto_60708 ) ) ( not ( = ?auto_60705 ?auto_60709 ) ) ( not ( = ?auto_60705 ?auto_60710 ) ) ( not ( = ?auto_60705 ?auto_60711 ) ) ( not ( = ?auto_60705 ?auto_60712 ) ) ( not ( = ?auto_60705 ?auto_60715 ) ) ( not ( = ?auto_60706 ?auto_60707 ) ) ( not ( = ?auto_60706 ?auto_60708 ) ) ( not ( = ?auto_60706 ?auto_60709 ) ) ( not ( = ?auto_60706 ?auto_60710 ) ) ( not ( = ?auto_60706 ?auto_60711 ) ) ( not ( = ?auto_60706 ?auto_60712 ) ) ( not ( = ?auto_60706 ?auto_60715 ) ) ( not ( = ?auto_60707 ?auto_60708 ) ) ( not ( = ?auto_60707 ?auto_60709 ) ) ( not ( = ?auto_60707 ?auto_60710 ) ) ( not ( = ?auto_60707 ?auto_60711 ) ) ( not ( = ?auto_60707 ?auto_60712 ) ) ( not ( = ?auto_60707 ?auto_60715 ) ) ( not ( = ?auto_60708 ?auto_60709 ) ) ( not ( = ?auto_60708 ?auto_60710 ) ) ( not ( = ?auto_60708 ?auto_60711 ) ) ( not ( = ?auto_60708 ?auto_60712 ) ) ( not ( = ?auto_60708 ?auto_60715 ) ) ( not ( = ?auto_60709 ?auto_60710 ) ) ( not ( = ?auto_60709 ?auto_60711 ) ) ( not ( = ?auto_60709 ?auto_60712 ) ) ( not ( = ?auto_60709 ?auto_60715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60710 ?auto_60711 ?auto_60712 )
      ( MAKE-7CRATE-VERIFY ?auto_60705 ?auto_60706 ?auto_60707 ?auto_60708 ?auto_60709 ?auto_60710 ?auto_60711 ?auto_60712 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60783 - SURFACE
      ?auto_60784 - SURFACE
      ?auto_60785 - SURFACE
      ?auto_60786 - SURFACE
      ?auto_60787 - SURFACE
      ?auto_60788 - SURFACE
      ?auto_60789 - SURFACE
      ?auto_60790 - SURFACE
    )
    :vars
    (
      ?auto_60795 - HOIST
      ?auto_60791 - PLACE
      ?auto_60794 - PLACE
      ?auto_60792 - HOIST
      ?auto_60793 - SURFACE
      ?auto_60796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60795 ?auto_60791 ) ( IS-CRATE ?auto_60790 ) ( not ( = ?auto_60789 ?auto_60790 ) ) ( not ( = ?auto_60788 ?auto_60789 ) ) ( not ( = ?auto_60788 ?auto_60790 ) ) ( not ( = ?auto_60794 ?auto_60791 ) ) ( HOIST-AT ?auto_60792 ?auto_60794 ) ( not ( = ?auto_60795 ?auto_60792 ) ) ( AVAILABLE ?auto_60792 ) ( SURFACE-AT ?auto_60790 ?auto_60794 ) ( ON ?auto_60790 ?auto_60793 ) ( CLEAR ?auto_60790 ) ( not ( = ?auto_60789 ?auto_60793 ) ) ( not ( = ?auto_60790 ?auto_60793 ) ) ( not ( = ?auto_60788 ?auto_60793 ) ) ( TRUCK-AT ?auto_60796 ?auto_60791 ) ( SURFACE-AT ?auto_60788 ?auto_60791 ) ( CLEAR ?auto_60788 ) ( LIFTING ?auto_60795 ?auto_60789 ) ( IS-CRATE ?auto_60789 ) ( ON ?auto_60784 ?auto_60783 ) ( ON ?auto_60785 ?auto_60784 ) ( ON ?auto_60786 ?auto_60785 ) ( ON ?auto_60787 ?auto_60786 ) ( ON ?auto_60788 ?auto_60787 ) ( not ( = ?auto_60783 ?auto_60784 ) ) ( not ( = ?auto_60783 ?auto_60785 ) ) ( not ( = ?auto_60783 ?auto_60786 ) ) ( not ( = ?auto_60783 ?auto_60787 ) ) ( not ( = ?auto_60783 ?auto_60788 ) ) ( not ( = ?auto_60783 ?auto_60789 ) ) ( not ( = ?auto_60783 ?auto_60790 ) ) ( not ( = ?auto_60783 ?auto_60793 ) ) ( not ( = ?auto_60784 ?auto_60785 ) ) ( not ( = ?auto_60784 ?auto_60786 ) ) ( not ( = ?auto_60784 ?auto_60787 ) ) ( not ( = ?auto_60784 ?auto_60788 ) ) ( not ( = ?auto_60784 ?auto_60789 ) ) ( not ( = ?auto_60784 ?auto_60790 ) ) ( not ( = ?auto_60784 ?auto_60793 ) ) ( not ( = ?auto_60785 ?auto_60786 ) ) ( not ( = ?auto_60785 ?auto_60787 ) ) ( not ( = ?auto_60785 ?auto_60788 ) ) ( not ( = ?auto_60785 ?auto_60789 ) ) ( not ( = ?auto_60785 ?auto_60790 ) ) ( not ( = ?auto_60785 ?auto_60793 ) ) ( not ( = ?auto_60786 ?auto_60787 ) ) ( not ( = ?auto_60786 ?auto_60788 ) ) ( not ( = ?auto_60786 ?auto_60789 ) ) ( not ( = ?auto_60786 ?auto_60790 ) ) ( not ( = ?auto_60786 ?auto_60793 ) ) ( not ( = ?auto_60787 ?auto_60788 ) ) ( not ( = ?auto_60787 ?auto_60789 ) ) ( not ( = ?auto_60787 ?auto_60790 ) ) ( not ( = ?auto_60787 ?auto_60793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60788 ?auto_60789 ?auto_60790 )
      ( MAKE-7CRATE-VERIFY ?auto_60783 ?auto_60784 ?auto_60785 ?auto_60786 ?auto_60787 ?auto_60788 ?auto_60789 ?auto_60790 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_60861 - SURFACE
      ?auto_60862 - SURFACE
      ?auto_60863 - SURFACE
      ?auto_60864 - SURFACE
      ?auto_60865 - SURFACE
      ?auto_60866 - SURFACE
      ?auto_60867 - SURFACE
      ?auto_60868 - SURFACE
    )
    :vars
    (
      ?auto_60869 - HOIST
      ?auto_60873 - PLACE
      ?auto_60870 - PLACE
      ?auto_60871 - HOIST
      ?auto_60874 - SURFACE
      ?auto_60872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_60869 ?auto_60873 ) ( IS-CRATE ?auto_60868 ) ( not ( = ?auto_60867 ?auto_60868 ) ) ( not ( = ?auto_60866 ?auto_60867 ) ) ( not ( = ?auto_60866 ?auto_60868 ) ) ( not ( = ?auto_60870 ?auto_60873 ) ) ( HOIST-AT ?auto_60871 ?auto_60870 ) ( not ( = ?auto_60869 ?auto_60871 ) ) ( AVAILABLE ?auto_60871 ) ( SURFACE-AT ?auto_60868 ?auto_60870 ) ( ON ?auto_60868 ?auto_60874 ) ( CLEAR ?auto_60868 ) ( not ( = ?auto_60867 ?auto_60874 ) ) ( not ( = ?auto_60868 ?auto_60874 ) ) ( not ( = ?auto_60866 ?auto_60874 ) ) ( TRUCK-AT ?auto_60872 ?auto_60873 ) ( SURFACE-AT ?auto_60866 ?auto_60873 ) ( CLEAR ?auto_60866 ) ( IS-CRATE ?auto_60867 ) ( AVAILABLE ?auto_60869 ) ( IN ?auto_60867 ?auto_60872 ) ( ON ?auto_60862 ?auto_60861 ) ( ON ?auto_60863 ?auto_60862 ) ( ON ?auto_60864 ?auto_60863 ) ( ON ?auto_60865 ?auto_60864 ) ( ON ?auto_60866 ?auto_60865 ) ( not ( = ?auto_60861 ?auto_60862 ) ) ( not ( = ?auto_60861 ?auto_60863 ) ) ( not ( = ?auto_60861 ?auto_60864 ) ) ( not ( = ?auto_60861 ?auto_60865 ) ) ( not ( = ?auto_60861 ?auto_60866 ) ) ( not ( = ?auto_60861 ?auto_60867 ) ) ( not ( = ?auto_60861 ?auto_60868 ) ) ( not ( = ?auto_60861 ?auto_60874 ) ) ( not ( = ?auto_60862 ?auto_60863 ) ) ( not ( = ?auto_60862 ?auto_60864 ) ) ( not ( = ?auto_60862 ?auto_60865 ) ) ( not ( = ?auto_60862 ?auto_60866 ) ) ( not ( = ?auto_60862 ?auto_60867 ) ) ( not ( = ?auto_60862 ?auto_60868 ) ) ( not ( = ?auto_60862 ?auto_60874 ) ) ( not ( = ?auto_60863 ?auto_60864 ) ) ( not ( = ?auto_60863 ?auto_60865 ) ) ( not ( = ?auto_60863 ?auto_60866 ) ) ( not ( = ?auto_60863 ?auto_60867 ) ) ( not ( = ?auto_60863 ?auto_60868 ) ) ( not ( = ?auto_60863 ?auto_60874 ) ) ( not ( = ?auto_60864 ?auto_60865 ) ) ( not ( = ?auto_60864 ?auto_60866 ) ) ( not ( = ?auto_60864 ?auto_60867 ) ) ( not ( = ?auto_60864 ?auto_60868 ) ) ( not ( = ?auto_60864 ?auto_60874 ) ) ( not ( = ?auto_60865 ?auto_60866 ) ) ( not ( = ?auto_60865 ?auto_60867 ) ) ( not ( = ?auto_60865 ?auto_60868 ) ) ( not ( = ?auto_60865 ?auto_60874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_60866 ?auto_60867 ?auto_60868 )
      ( MAKE-7CRATE-VERIFY ?auto_60861 ?auto_60862 ?auto_60863 ?auto_60864 ?auto_60865 ?auto_60866 ?auto_60867 ?auto_60868 ) )
  )

)

