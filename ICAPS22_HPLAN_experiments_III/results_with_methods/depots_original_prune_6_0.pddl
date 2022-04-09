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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27873 - SURFACE
      ?auto_27874 - SURFACE
    )
    :vars
    (
      ?auto_27875 - HOIST
      ?auto_27876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27875 ?auto_27876 ) ( SURFACE-AT ?auto_27873 ?auto_27876 ) ( CLEAR ?auto_27873 ) ( LIFTING ?auto_27875 ?auto_27874 ) ( IS-CRATE ?auto_27874 ) ( not ( = ?auto_27873 ?auto_27874 ) ) )
    :subtasks
    ( ( !DROP ?auto_27875 ?auto_27874 ?auto_27873 ?auto_27876 )
      ( MAKE-1CRATE-VERIFY ?auto_27873 ?auto_27874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27877 - SURFACE
      ?auto_27878 - SURFACE
    )
    :vars
    (
      ?auto_27879 - HOIST
      ?auto_27880 - PLACE
      ?auto_27881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27879 ?auto_27880 ) ( SURFACE-AT ?auto_27877 ?auto_27880 ) ( CLEAR ?auto_27877 ) ( IS-CRATE ?auto_27878 ) ( not ( = ?auto_27877 ?auto_27878 ) ) ( TRUCK-AT ?auto_27881 ?auto_27880 ) ( AVAILABLE ?auto_27879 ) ( IN ?auto_27878 ?auto_27881 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27879 ?auto_27878 ?auto_27881 ?auto_27880 )
      ( MAKE-1CRATE ?auto_27877 ?auto_27878 )
      ( MAKE-1CRATE-VERIFY ?auto_27877 ?auto_27878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27882 - SURFACE
      ?auto_27883 - SURFACE
    )
    :vars
    (
      ?auto_27884 - HOIST
      ?auto_27885 - PLACE
      ?auto_27886 - TRUCK
      ?auto_27887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27884 ?auto_27885 ) ( SURFACE-AT ?auto_27882 ?auto_27885 ) ( CLEAR ?auto_27882 ) ( IS-CRATE ?auto_27883 ) ( not ( = ?auto_27882 ?auto_27883 ) ) ( AVAILABLE ?auto_27884 ) ( IN ?auto_27883 ?auto_27886 ) ( TRUCK-AT ?auto_27886 ?auto_27887 ) ( not ( = ?auto_27887 ?auto_27885 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27886 ?auto_27887 ?auto_27885 )
      ( MAKE-1CRATE ?auto_27882 ?auto_27883 )
      ( MAKE-1CRATE-VERIFY ?auto_27882 ?auto_27883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27888 - SURFACE
      ?auto_27889 - SURFACE
    )
    :vars
    (
      ?auto_27890 - HOIST
      ?auto_27892 - PLACE
      ?auto_27891 - TRUCK
      ?auto_27893 - PLACE
      ?auto_27894 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27890 ?auto_27892 ) ( SURFACE-AT ?auto_27888 ?auto_27892 ) ( CLEAR ?auto_27888 ) ( IS-CRATE ?auto_27889 ) ( not ( = ?auto_27888 ?auto_27889 ) ) ( AVAILABLE ?auto_27890 ) ( TRUCK-AT ?auto_27891 ?auto_27893 ) ( not ( = ?auto_27893 ?auto_27892 ) ) ( HOIST-AT ?auto_27894 ?auto_27893 ) ( LIFTING ?auto_27894 ?auto_27889 ) ( not ( = ?auto_27890 ?auto_27894 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27894 ?auto_27889 ?auto_27891 ?auto_27893 )
      ( MAKE-1CRATE ?auto_27888 ?auto_27889 )
      ( MAKE-1CRATE-VERIFY ?auto_27888 ?auto_27889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27895 - SURFACE
      ?auto_27896 - SURFACE
    )
    :vars
    (
      ?auto_27899 - HOIST
      ?auto_27900 - PLACE
      ?auto_27898 - TRUCK
      ?auto_27901 - PLACE
      ?auto_27897 - HOIST
      ?auto_27902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27899 ?auto_27900 ) ( SURFACE-AT ?auto_27895 ?auto_27900 ) ( CLEAR ?auto_27895 ) ( IS-CRATE ?auto_27896 ) ( not ( = ?auto_27895 ?auto_27896 ) ) ( AVAILABLE ?auto_27899 ) ( TRUCK-AT ?auto_27898 ?auto_27901 ) ( not ( = ?auto_27901 ?auto_27900 ) ) ( HOIST-AT ?auto_27897 ?auto_27901 ) ( not ( = ?auto_27899 ?auto_27897 ) ) ( AVAILABLE ?auto_27897 ) ( SURFACE-AT ?auto_27896 ?auto_27901 ) ( ON ?auto_27896 ?auto_27902 ) ( CLEAR ?auto_27896 ) ( not ( = ?auto_27895 ?auto_27902 ) ) ( not ( = ?auto_27896 ?auto_27902 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27897 ?auto_27896 ?auto_27902 ?auto_27901 )
      ( MAKE-1CRATE ?auto_27895 ?auto_27896 )
      ( MAKE-1CRATE-VERIFY ?auto_27895 ?auto_27896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27903 - SURFACE
      ?auto_27904 - SURFACE
    )
    :vars
    (
      ?auto_27908 - HOIST
      ?auto_27907 - PLACE
      ?auto_27909 - PLACE
      ?auto_27905 - HOIST
      ?auto_27906 - SURFACE
      ?auto_27910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27908 ?auto_27907 ) ( SURFACE-AT ?auto_27903 ?auto_27907 ) ( CLEAR ?auto_27903 ) ( IS-CRATE ?auto_27904 ) ( not ( = ?auto_27903 ?auto_27904 ) ) ( AVAILABLE ?auto_27908 ) ( not ( = ?auto_27909 ?auto_27907 ) ) ( HOIST-AT ?auto_27905 ?auto_27909 ) ( not ( = ?auto_27908 ?auto_27905 ) ) ( AVAILABLE ?auto_27905 ) ( SURFACE-AT ?auto_27904 ?auto_27909 ) ( ON ?auto_27904 ?auto_27906 ) ( CLEAR ?auto_27904 ) ( not ( = ?auto_27903 ?auto_27906 ) ) ( not ( = ?auto_27904 ?auto_27906 ) ) ( TRUCK-AT ?auto_27910 ?auto_27907 ) )
    :subtasks
    ( ( !DRIVE ?auto_27910 ?auto_27907 ?auto_27909 )
      ( MAKE-1CRATE ?auto_27903 ?auto_27904 )
      ( MAKE-1CRATE-VERIFY ?auto_27903 ?auto_27904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27920 - SURFACE
      ?auto_27921 - SURFACE
      ?auto_27922 - SURFACE
    )
    :vars
    (
      ?auto_27923 - HOIST
      ?auto_27924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27923 ?auto_27924 ) ( SURFACE-AT ?auto_27921 ?auto_27924 ) ( CLEAR ?auto_27921 ) ( LIFTING ?auto_27923 ?auto_27922 ) ( IS-CRATE ?auto_27922 ) ( not ( = ?auto_27921 ?auto_27922 ) ) ( ON ?auto_27921 ?auto_27920 ) ( not ( = ?auto_27920 ?auto_27921 ) ) ( not ( = ?auto_27920 ?auto_27922 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27921 ?auto_27922 )
      ( MAKE-2CRATE-VERIFY ?auto_27920 ?auto_27921 ?auto_27922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27930 - SURFACE
      ?auto_27931 - SURFACE
      ?auto_27932 - SURFACE
    )
    :vars
    (
      ?auto_27935 - HOIST
      ?auto_27934 - PLACE
      ?auto_27933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27935 ?auto_27934 ) ( SURFACE-AT ?auto_27931 ?auto_27934 ) ( CLEAR ?auto_27931 ) ( IS-CRATE ?auto_27932 ) ( not ( = ?auto_27931 ?auto_27932 ) ) ( TRUCK-AT ?auto_27933 ?auto_27934 ) ( AVAILABLE ?auto_27935 ) ( IN ?auto_27932 ?auto_27933 ) ( ON ?auto_27931 ?auto_27930 ) ( not ( = ?auto_27930 ?auto_27931 ) ) ( not ( = ?auto_27930 ?auto_27932 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27931 ?auto_27932 )
      ( MAKE-2CRATE-VERIFY ?auto_27930 ?auto_27931 ?auto_27932 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27936 - SURFACE
      ?auto_27937 - SURFACE
    )
    :vars
    (
      ?auto_27940 - HOIST
      ?auto_27938 - PLACE
      ?auto_27941 - TRUCK
      ?auto_27939 - SURFACE
      ?auto_27942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27940 ?auto_27938 ) ( SURFACE-AT ?auto_27936 ?auto_27938 ) ( CLEAR ?auto_27936 ) ( IS-CRATE ?auto_27937 ) ( not ( = ?auto_27936 ?auto_27937 ) ) ( AVAILABLE ?auto_27940 ) ( IN ?auto_27937 ?auto_27941 ) ( ON ?auto_27936 ?auto_27939 ) ( not ( = ?auto_27939 ?auto_27936 ) ) ( not ( = ?auto_27939 ?auto_27937 ) ) ( TRUCK-AT ?auto_27941 ?auto_27942 ) ( not ( = ?auto_27942 ?auto_27938 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27941 ?auto_27942 ?auto_27938 )
      ( MAKE-2CRATE ?auto_27939 ?auto_27936 ?auto_27937 )
      ( MAKE-1CRATE-VERIFY ?auto_27936 ?auto_27937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27943 - SURFACE
      ?auto_27944 - SURFACE
      ?auto_27945 - SURFACE
    )
    :vars
    (
      ?auto_27948 - HOIST
      ?auto_27949 - PLACE
      ?auto_27946 - TRUCK
      ?auto_27947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27948 ?auto_27949 ) ( SURFACE-AT ?auto_27944 ?auto_27949 ) ( CLEAR ?auto_27944 ) ( IS-CRATE ?auto_27945 ) ( not ( = ?auto_27944 ?auto_27945 ) ) ( AVAILABLE ?auto_27948 ) ( IN ?auto_27945 ?auto_27946 ) ( ON ?auto_27944 ?auto_27943 ) ( not ( = ?auto_27943 ?auto_27944 ) ) ( not ( = ?auto_27943 ?auto_27945 ) ) ( TRUCK-AT ?auto_27946 ?auto_27947 ) ( not ( = ?auto_27947 ?auto_27949 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27944 ?auto_27945 )
      ( MAKE-2CRATE-VERIFY ?auto_27943 ?auto_27944 ?auto_27945 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27950 - SURFACE
      ?auto_27951 - SURFACE
    )
    :vars
    (
      ?auto_27956 - HOIST
      ?auto_27955 - PLACE
      ?auto_27952 - SURFACE
      ?auto_27953 - TRUCK
      ?auto_27954 - PLACE
      ?auto_27957 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27956 ?auto_27955 ) ( SURFACE-AT ?auto_27950 ?auto_27955 ) ( CLEAR ?auto_27950 ) ( IS-CRATE ?auto_27951 ) ( not ( = ?auto_27950 ?auto_27951 ) ) ( AVAILABLE ?auto_27956 ) ( ON ?auto_27950 ?auto_27952 ) ( not ( = ?auto_27952 ?auto_27950 ) ) ( not ( = ?auto_27952 ?auto_27951 ) ) ( TRUCK-AT ?auto_27953 ?auto_27954 ) ( not ( = ?auto_27954 ?auto_27955 ) ) ( HOIST-AT ?auto_27957 ?auto_27954 ) ( LIFTING ?auto_27957 ?auto_27951 ) ( not ( = ?auto_27956 ?auto_27957 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27957 ?auto_27951 ?auto_27953 ?auto_27954 )
      ( MAKE-2CRATE ?auto_27952 ?auto_27950 ?auto_27951 )
      ( MAKE-1CRATE-VERIFY ?auto_27950 ?auto_27951 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27958 - SURFACE
      ?auto_27959 - SURFACE
      ?auto_27960 - SURFACE
    )
    :vars
    (
      ?auto_27962 - HOIST
      ?auto_27964 - PLACE
      ?auto_27961 - TRUCK
      ?auto_27963 - PLACE
      ?auto_27965 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27962 ?auto_27964 ) ( SURFACE-AT ?auto_27959 ?auto_27964 ) ( CLEAR ?auto_27959 ) ( IS-CRATE ?auto_27960 ) ( not ( = ?auto_27959 ?auto_27960 ) ) ( AVAILABLE ?auto_27962 ) ( ON ?auto_27959 ?auto_27958 ) ( not ( = ?auto_27958 ?auto_27959 ) ) ( not ( = ?auto_27958 ?auto_27960 ) ) ( TRUCK-AT ?auto_27961 ?auto_27963 ) ( not ( = ?auto_27963 ?auto_27964 ) ) ( HOIST-AT ?auto_27965 ?auto_27963 ) ( LIFTING ?auto_27965 ?auto_27960 ) ( not ( = ?auto_27962 ?auto_27965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27959 ?auto_27960 )
      ( MAKE-2CRATE-VERIFY ?auto_27958 ?auto_27959 ?auto_27960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27966 - SURFACE
      ?auto_27967 - SURFACE
    )
    :vars
    (
      ?auto_27971 - HOIST
      ?auto_27973 - PLACE
      ?auto_27970 - SURFACE
      ?auto_27972 - TRUCK
      ?auto_27968 - PLACE
      ?auto_27969 - HOIST
      ?auto_27974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27971 ?auto_27973 ) ( SURFACE-AT ?auto_27966 ?auto_27973 ) ( CLEAR ?auto_27966 ) ( IS-CRATE ?auto_27967 ) ( not ( = ?auto_27966 ?auto_27967 ) ) ( AVAILABLE ?auto_27971 ) ( ON ?auto_27966 ?auto_27970 ) ( not ( = ?auto_27970 ?auto_27966 ) ) ( not ( = ?auto_27970 ?auto_27967 ) ) ( TRUCK-AT ?auto_27972 ?auto_27968 ) ( not ( = ?auto_27968 ?auto_27973 ) ) ( HOIST-AT ?auto_27969 ?auto_27968 ) ( not ( = ?auto_27971 ?auto_27969 ) ) ( AVAILABLE ?auto_27969 ) ( SURFACE-AT ?auto_27967 ?auto_27968 ) ( ON ?auto_27967 ?auto_27974 ) ( CLEAR ?auto_27967 ) ( not ( = ?auto_27966 ?auto_27974 ) ) ( not ( = ?auto_27967 ?auto_27974 ) ) ( not ( = ?auto_27970 ?auto_27974 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27969 ?auto_27967 ?auto_27974 ?auto_27968 )
      ( MAKE-2CRATE ?auto_27970 ?auto_27966 ?auto_27967 )
      ( MAKE-1CRATE-VERIFY ?auto_27966 ?auto_27967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27975 - SURFACE
      ?auto_27976 - SURFACE
      ?auto_27977 - SURFACE
    )
    :vars
    (
      ?auto_27983 - HOIST
      ?auto_27980 - PLACE
      ?auto_27982 - TRUCK
      ?auto_27981 - PLACE
      ?auto_27978 - HOIST
      ?auto_27979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27983 ?auto_27980 ) ( SURFACE-AT ?auto_27976 ?auto_27980 ) ( CLEAR ?auto_27976 ) ( IS-CRATE ?auto_27977 ) ( not ( = ?auto_27976 ?auto_27977 ) ) ( AVAILABLE ?auto_27983 ) ( ON ?auto_27976 ?auto_27975 ) ( not ( = ?auto_27975 ?auto_27976 ) ) ( not ( = ?auto_27975 ?auto_27977 ) ) ( TRUCK-AT ?auto_27982 ?auto_27981 ) ( not ( = ?auto_27981 ?auto_27980 ) ) ( HOIST-AT ?auto_27978 ?auto_27981 ) ( not ( = ?auto_27983 ?auto_27978 ) ) ( AVAILABLE ?auto_27978 ) ( SURFACE-AT ?auto_27977 ?auto_27981 ) ( ON ?auto_27977 ?auto_27979 ) ( CLEAR ?auto_27977 ) ( not ( = ?auto_27976 ?auto_27979 ) ) ( not ( = ?auto_27977 ?auto_27979 ) ) ( not ( = ?auto_27975 ?auto_27979 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27976 ?auto_27977 )
      ( MAKE-2CRATE-VERIFY ?auto_27975 ?auto_27976 ?auto_27977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27984 - SURFACE
      ?auto_27985 - SURFACE
    )
    :vars
    (
      ?auto_27990 - HOIST
      ?auto_27989 - PLACE
      ?auto_27988 - SURFACE
      ?auto_27986 - PLACE
      ?auto_27992 - HOIST
      ?auto_27991 - SURFACE
      ?auto_27987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27990 ?auto_27989 ) ( SURFACE-AT ?auto_27984 ?auto_27989 ) ( CLEAR ?auto_27984 ) ( IS-CRATE ?auto_27985 ) ( not ( = ?auto_27984 ?auto_27985 ) ) ( AVAILABLE ?auto_27990 ) ( ON ?auto_27984 ?auto_27988 ) ( not ( = ?auto_27988 ?auto_27984 ) ) ( not ( = ?auto_27988 ?auto_27985 ) ) ( not ( = ?auto_27986 ?auto_27989 ) ) ( HOIST-AT ?auto_27992 ?auto_27986 ) ( not ( = ?auto_27990 ?auto_27992 ) ) ( AVAILABLE ?auto_27992 ) ( SURFACE-AT ?auto_27985 ?auto_27986 ) ( ON ?auto_27985 ?auto_27991 ) ( CLEAR ?auto_27985 ) ( not ( = ?auto_27984 ?auto_27991 ) ) ( not ( = ?auto_27985 ?auto_27991 ) ) ( not ( = ?auto_27988 ?auto_27991 ) ) ( TRUCK-AT ?auto_27987 ?auto_27989 ) )
    :subtasks
    ( ( !DRIVE ?auto_27987 ?auto_27989 ?auto_27986 )
      ( MAKE-2CRATE ?auto_27988 ?auto_27984 ?auto_27985 )
      ( MAKE-1CRATE-VERIFY ?auto_27984 ?auto_27985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27993 - SURFACE
      ?auto_27994 - SURFACE
      ?auto_27995 - SURFACE
    )
    :vars
    (
      ?auto_27996 - HOIST
      ?auto_28001 - PLACE
      ?auto_28000 - PLACE
      ?auto_27999 - HOIST
      ?auto_27997 - SURFACE
      ?auto_27998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27996 ?auto_28001 ) ( SURFACE-AT ?auto_27994 ?auto_28001 ) ( CLEAR ?auto_27994 ) ( IS-CRATE ?auto_27995 ) ( not ( = ?auto_27994 ?auto_27995 ) ) ( AVAILABLE ?auto_27996 ) ( ON ?auto_27994 ?auto_27993 ) ( not ( = ?auto_27993 ?auto_27994 ) ) ( not ( = ?auto_27993 ?auto_27995 ) ) ( not ( = ?auto_28000 ?auto_28001 ) ) ( HOIST-AT ?auto_27999 ?auto_28000 ) ( not ( = ?auto_27996 ?auto_27999 ) ) ( AVAILABLE ?auto_27999 ) ( SURFACE-AT ?auto_27995 ?auto_28000 ) ( ON ?auto_27995 ?auto_27997 ) ( CLEAR ?auto_27995 ) ( not ( = ?auto_27994 ?auto_27997 ) ) ( not ( = ?auto_27995 ?auto_27997 ) ) ( not ( = ?auto_27993 ?auto_27997 ) ) ( TRUCK-AT ?auto_27998 ?auto_28001 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27994 ?auto_27995 )
      ( MAKE-2CRATE-VERIFY ?auto_27993 ?auto_27994 ?auto_27995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28002 - SURFACE
      ?auto_28003 - SURFACE
    )
    :vars
    (
      ?auto_28005 - HOIST
      ?auto_28006 - PLACE
      ?auto_28007 - SURFACE
      ?auto_28010 - PLACE
      ?auto_28008 - HOIST
      ?auto_28004 - SURFACE
      ?auto_28009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28005 ?auto_28006 ) ( IS-CRATE ?auto_28003 ) ( not ( = ?auto_28002 ?auto_28003 ) ) ( not ( = ?auto_28007 ?auto_28002 ) ) ( not ( = ?auto_28007 ?auto_28003 ) ) ( not ( = ?auto_28010 ?auto_28006 ) ) ( HOIST-AT ?auto_28008 ?auto_28010 ) ( not ( = ?auto_28005 ?auto_28008 ) ) ( AVAILABLE ?auto_28008 ) ( SURFACE-AT ?auto_28003 ?auto_28010 ) ( ON ?auto_28003 ?auto_28004 ) ( CLEAR ?auto_28003 ) ( not ( = ?auto_28002 ?auto_28004 ) ) ( not ( = ?auto_28003 ?auto_28004 ) ) ( not ( = ?auto_28007 ?auto_28004 ) ) ( TRUCK-AT ?auto_28009 ?auto_28006 ) ( SURFACE-AT ?auto_28007 ?auto_28006 ) ( CLEAR ?auto_28007 ) ( LIFTING ?auto_28005 ?auto_28002 ) ( IS-CRATE ?auto_28002 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28007 ?auto_28002 )
      ( MAKE-2CRATE ?auto_28007 ?auto_28002 ?auto_28003 )
      ( MAKE-1CRATE-VERIFY ?auto_28002 ?auto_28003 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28011 - SURFACE
      ?auto_28012 - SURFACE
      ?auto_28013 - SURFACE
    )
    :vars
    (
      ?auto_28015 - HOIST
      ?auto_28016 - PLACE
      ?auto_28014 - PLACE
      ?auto_28017 - HOIST
      ?auto_28019 - SURFACE
      ?auto_28018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28015 ?auto_28016 ) ( IS-CRATE ?auto_28013 ) ( not ( = ?auto_28012 ?auto_28013 ) ) ( not ( = ?auto_28011 ?auto_28012 ) ) ( not ( = ?auto_28011 ?auto_28013 ) ) ( not ( = ?auto_28014 ?auto_28016 ) ) ( HOIST-AT ?auto_28017 ?auto_28014 ) ( not ( = ?auto_28015 ?auto_28017 ) ) ( AVAILABLE ?auto_28017 ) ( SURFACE-AT ?auto_28013 ?auto_28014 ) ( ON ?auto_28013 ?auto_28019 ) ( CLEAR ?auto_28013 ) ( not ( = ?auto_28012 ?auto_28019 ) ) ( not ( = ?auto_28013 ?auto_28019 ) ) ( not ( = ?auto_28011 ?auto_28019 ) ) ( TRUCK-AT ?auto_28018 ?auto_28016 ) ( SURFACE-AT ?auto_28011 ?auto_28016 ) ( CLEAR ?auto_28011 ) ( LIFTING ?auto_28015 ?auto_28012 ) ( IS-CRATE ?auto_28012 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28012 ?auto_28013 )
      ( MAKE-2CRATE-VERIFY ?auto_28011 ?auto_28012 ?auto_28013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28020 - SURFACE
      ?auto_28021 - SURFACE
    )
    :vars
    (
      ?auto_28028 - HOIST
      ?auto_28022 - PLACE
      ?auto_28023 - SURFACE
      ?auto_28026 - PLACE
      ?auto_28027 - HOIST
      ?auto_28024 - SURFACE
      ?auto_28025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28028 ?auto_28022 ) ( IS-CRATE ?auto_28021 ) ( not ( = ?auto_28020 ?auto_28021 ) ) ( not ( = ?auto_28023 ?auto_28020 ) ) ( not ( = ?auto_28023 ?auto_28021 ) ) ( not ( = ?auto_28026 ?auto_28022 ) ) ( HOIST-AT ?auto_28027 ?auto_28026 ) ( not ( = ?auto_28028 ?auto_28027 ) ) ( AVAILABLE ?auto_28027 ) ( SURFACE-AT ?auto_28021 ?auto_28026 ) ( ON ?auto_28021 ?auto_28024 ) ( CLEAR ?auto_28021 ) ( not ( = ?auto_28020 ?auto_28024 ) ) ( not ( = ?auto_28021 ?auto_28024 ) ) ( not ( = ?auto_28023 ?auto_28024 ) ) ( TRUCK-AT ?auto_28025 ?auto_28022 ) ( SURFACE-AT ?auto_28023 ?auto_28022 ) ( CLEAR ?auto_28023 ) ( IS-CRATE ?auto_28020 ) ( AVAILABLE ?auto_28028 ) ( IN ?auto_28020 ?auto_28025 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28028 ?auto_28020 ?auto_28025 ?auto_28022 )
      ( MAKE-2CRATE ?auto_28023 ?auto_28020 ?auto_28021 )
      ( MAKE-1CRATE-VERIFY ?auto_28020 ?auto_28021 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28029 - SURFACE
      ?auto_28030 - SURFACE
      ?auto_28031 - SURFACE
    )
    :vars
    (
      ?auto_28037 - HOIST
      ?auto_28035 - PLACE
      ?auto_28033 - PLACE
      ?auto_28034 - HOIST
      ?auto_28036 - SURFACE
      ?auto_28032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28037 ?auto_28035 ) ( IS-CRATE ?auto_28031 ) ( not ( = ?auto_28030 ?auto_28031 ) ) ( not ( = ?auto_28029 ?auto_28030 ) ) ( not ( = ?auto_28029 ?auto_28031 ) ) ( not ( = ?auto_28033 ?auto_28035 ) ) ( HOIST-AT ?auto_28034 ?auto_28033 ) ( not ( = ?auto_28037 ?auto_28034 ) ) ( AVAILABLE ?auto_28034 ) ( SURFACE-AT ?auto_28031 ?auto_28033 ) ( ON ?auto_28031 ?auto_28036 ) ( CLEAR ?auto_28031 ) ( not ( = ?auto_28030 ?auto_28036 ) ) ( not ( = ?auto_28031 ?auto_28036 ) ) ( not ( = ?auto_28029 ?auto_28036 ) ) ( TRUCK-AT ?auto_28032 ?auto_28035 ) ( SURFACE-AT ?auto_28029 ?auto_28035 ) ( CLEAR ?auto_28029 ) ( IS-CRATE ?auto_28030 ) ( AVAILABLE ?auto_28037 ) ( IN ?auto_28030 ?auto_28032 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28030 ?auto_28031 )
      ( MAKE-2CRATE-VERIFY ?auto_28029 ?auto_28030 ?auto_28031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28074 - SURFACE
      ?auto_28075 - SURFACE
    )
    :vars
    (
      ?auto_28079 - HOIST
      ?auto_28081 - PLACE
      ?auto_28078 - SURFACE
      ?auto_28082 - PLACE
      ?auto_28077 - HOIST
      ?auto_28076 - SURFACE
      ?auto_28080 - TRUCK
      ?auto_28083 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28079 ?auto_28081 ) ( SURFACE-AT ?auto_28074 ?auto_28081 ) ( CLEAR ?auto_28074 ) ( IS-CRATE ?auto_28075 ) ( not ( = ?auto_28074 ?auto_28075 ) ) ( AVAILABLE ?auto_28079 ) ( ON ?auto_28074 ?auto_28078 ) ( not ( = ?auto_28078 ?auto_28074 ) ) ( not ( = ?auto_28078 ?auto_28075 ) ) ( not ( = ?auto_28082 ?auto_28081 ) ) ( HOIST-AT ?auto_28077 ?auto_28082 ) ( not ( = ?auto_28079 ?auto_28077 ) ) ( AVAILABLE ?auto_28077 ) ( SURFACE-AT ?auto_28075 ?auto_28082 ) ( ON ?auto_28075 ?auto_28076 ) ( CLEAR ?auto_28075 ) ( not ( = ?auto_28074 ?auto_28076 ) ) ( not ( = ?auto_28075 ?auto_28076 ) ) ( not ( = ?auto_28078 ?auto_28076 ) ) ( TRUCK-AT ?auto_28080 ?auto_28083 ) ( not ( = ?auto_28083 ?auto_28081 ) ) ( not ( = ?auto_28082 ?auto_28083 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28080 ?auto_28083 ?auto_28081 )
      ( MAKE-1CRATE ?auto_28074 ?auto_28075 )
      ( MAKE-1CRATE-VERIFY ?auto_28074 ?auto_28075 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28113 - SURFACE
      ?auto_28114 - SURFACE
      ?auto_28115 - SURFACE
      ?auto_28116 - SURFACE
    )
    :vars
    (
      ?auto_28118 - HOIST
      ?auto_28117 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28118 ?auto_28117 ) ( SURFACE-AT ?auto_28115 ?auto_28117 ) ( CLEAR ?auto_28115 ) ( LIFTING ?auto_28118 ?auto_28116 ) ( IS-CRATE ?auto_28116 ) ( not ( = ?auto_28115 ?auto_28116 ) ) ( ON ?auto_28114 ?auto_28113 ) ( ON ?auto_28115 ?auto_28114 ) ( not ( = ?auto_28113 ?auto_28114 ) ) ( not ( = ?auto_28113 ?auto_28115 ) ) ( not ( = ?auto_28113 ?auto_28116 ) ) ( not ( = ?auto_28114 ?auto_28115 ) ) ( not ( = ?auto_28114 ?auto_28116 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28115 ?auto_28116 )
      ( MAKE-3CRATE-VERIFY ?auto_28113 ?auto_28114 ?auto_28115 ?auto_28116 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28130 - SURFACE
      ?auto_28131 - SURFACE
      ?auto_28132 - SURFACE
      ?auto_28133 - SURFACE
    )
    :vars
    (
      ?auto_28135 - HOIST
      ?auto_28134 - PLACE
      ?auto_28136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28135 ?auto_28134 ) ( SURFACE-AT ?auto_28132 ?auto_28134 ) ( CLEAR ?auto_28132 ) ( IS-CRATE ?auto_28133 ) ( not ( = ?auto_28132 ?auto_28133 ) ) ( TRUCK-AT ?auto_28136 ?auto_28134 ) ( AVAILABLE ?auto_28135 ) ( IN ?auto_28133 ?auto_28136 ) ( ON ?auto_28132 ?auto_28131 ) ( not ( = ?auto_28131 ?auto_28132 ) ) ( not ( = ?auto_28131 ?auto_28133 ) ) ( ON ?auto_28131 ?auto_28130 ) ( not ( = ?auto_28130 ?auto_28131 ) ) ( not ( = ?auto_28130 ?auto_28132 ) ) ( not ( = ?auto_28130 ?auto_28133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28131 ?auto_28132 ?auto_28133 )
      ( MAKE-3CRATE-VERIFY ?auto_28130 ?auto_28131 ?auto_28132 ?auto_28133 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28151 - SURFACE
      ?auto_28152 - SURFACE
      ?auto_28153 - SURFACE
      ?auto_28154 - SURFACE
    )
    :vars
    (
      ?auto_28157 - HOIST
      ?auto_28158 - PLACE
      ?auto_28155 - TRUCK
      ?auto_28156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28157 ?auto_28158 ) ( SURFACE-AT ?auto_28153 ?auto_28158 ) ( CLEAR ?auto_28153 ) ( IS-CRATE ?auto_28154 ) ( not ( = ?auto_28153 ?auto_28154 ) ) ( AVAILABLE ?auto_28157 ) ( IN ?auto_28154 ?auto_28155 ) ( ON ?auto_28153 ?auto_28152 ) ( not ( = ?auto_28152 ?auto_28153 ) ) ( not ( = ?auto_28152 ?auto_28154 ) ) ( TRUCK-AT ?auto_28155 ?auto_28156 ) ( not ( = ?auto_28156 ?auto_28158 ) ) ( ON ?auto_28152 ?auto_28151 ) ( not ( = ?auto_28151 ?auto_28152 ) ) ( not ( = ?auto_28151 ?auto_28153 ) ) ( not ( = ?auto_28151 ?auto_28154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28152 ?auto_28153 ?auto_28154 )
      ( MAKE-3CRATE-VERIFY ?auto_28151 ?auto_28152 ?auto_28153 ?auto_28154 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28175 - SURFACE
      ?auto_28176 - SURFACE
      ?auto_28177 - SURFACE
      ?auto_28178 - SURFACE
    )
    :vars
    (
      ?auto_28183 - HOIST
      ?auto_28182 - PLACE
      ?auto_28181 - TRUCK
      ?auto_28180 - PLACE
      ?auto_28179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28183 ?auto_28182 ) ( SURFACE-AT ?auto_28177 ?auto_28182 ) ( CLEAR ?auto_28177 ) ( IS-CRATE ?auto_28178 ) ( not ( = ?auto_28177 ?auto_28178 ) ) ( AVAILABLE ?auto_28183 ) ( ON ?auto_28177 ?auto_28176 ) ( not ( = ?auto_28176 ?auto_28177 ) ) ( not ( = ?auto_28176 ?auto_28178 ) ) ( TRUCK-AT ?auto_28181 ?auto_28180 ) ( not ( = ?auto_28180 ?auto_28182 ) ) ( HOIST-AT ?auto_28179 ?auto_28180 ) ( LIFTING ?auto_28179 ?auto_28178 ) ( not ( = ?auto_28183 ?auto_28179 ) ) ( ON ?auto_28176 ?auto_28175 ) ( not ( = ?auto_28175 ?auto_28176 ) ) ( not ( = ?auto_28175 ?auto_28177 ) ) ( not ( = ?auto_28175 ?auto_28178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28176 ?auto_28177 ?auto_28178 )
      ( MAKE-3CRATE-VERIFY ?auto_28175 ?auto_28176 ?auto_28177 ?auto_28178 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28202 - SURFACE
      ?auto_28203 - SURFACE
      ?auto_28204 - SURFACE
      ?auto_28205 - SURFACE
    )
    :vars
    (
      ?auto_28209 - HOIST
      ?auto_28208 - PLACE
      ?auto_28210 - TRUCK
      ?auto_28206 - PLACE
      ?auto_28207 - HOIST
      ?auto_28211 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28209 ?auto_28208 ) ( SURFACE-AT ?auto_28204 ?auto_28208 ) ( CLEAR ?auto_28204 ) ( IS-CRATE ?auto_28205 ) ( not ( = ?auto_28204 ?auto_28205 ) ) ( AVAILABLE ?auto_28209 ) ( ON ?auto_28204 ?auto_28203 ) ( not ( = ?auto_28203 ?auto_28204 ) ) ( not ( = ?auto_28203 ?auto_28205 ) ) ( TRUCK-AT ?auto_28210 ?auto_28206 ) ( not ( = ?auto_28206 ?auto_28208 ) ) ( HOIST-AT ?auto_28207 ?auto_28206 ) ( not ( = ?auto_28209 ?auto_28207 ) ) ( AVAILABLE ?auto_28207 ) ( SURFACE-AT ?auto_28205 ?auto_28206 ) ( ON ?auto_28205 ?auto_28211 ) ( CLEAR ?auto_28205 ) ( not ( = ?auto_28204 ?auto_28211 ) ) ( not ( = ?auto_28205 ?auto_28211 ) ) ( not ( = ?auto_28203 ?auto_28211 ) ) ( ON ?auto_28203 ?auto_28202 ) ( not ( = ?auto_28202 ?auto_28203 ) ) ( not ( = ?auto_28202 ?auto_28204 ) ) ( not ( = ?auto_28202 ?auto_28205 ) ) ( not ( = ?auto_28202 ?auto_28211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28203 ?auto_28204 ?auto_28205 )
      ( MAKE-3CRATE-VERIFY ?auto_28202 ?auto_28203 ?auto_28204 ?auto_28205 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28230 - SURFACE
      ?auto_28231 - SURFACE
      ?auto_28232 - SURFACE
      ?auto_28233 - SURFACE
    )
    :vars
    (
      ?auto_28237 - HOIST
      ?auto_28235 - PLACE
      ?auto_28238 - PLACE
      ?auto_28239 - HOIST
      ?auto_28236 - SURFACE
      ?auto_28234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28237 ?auto_28235 ) ( SURFACE-AT ?auto_28232 ?auto_28235 ) ( CLEAR ?auto_28232 ) ( IS-CRATE ?auto_28233 ) ( not ( = ?auto_28232 ?auto_28233 ) ) ( AVAILABLE ?auto_28237 ) ( ON ?auto_28232 ?auto_28231 ) ( not ( = ?auto_28231 ?auto_28232 ) ) ( not ( = ?auto_28231 ?auto_28233 ) ) ( not ( = ?auto_28238 ?auto_28235 ) ) ( HOIST-AT ?auto_28239 ?auto_28238 ) ( not ( = ?auto_28237 ?auto_28239 ) ) ( AVAILABLE ?auto_28239 ) ( SURFACE-AT ?auto_28233 ?auto_28238 ) ( ON ?auto_28233 ?auto_28236 ) ( CLEAR ?auto_28233 ) ( not ( = ?auto_28232 ?auto_28236 ) ) ( not ( = ?auto_28233 ?auto_28236 ) ) ( not ( = ?auto_28231 ?auto_28236 ) ) ( TRUCK-AT ?auto_28234 ?auto_28235 ) ( ON ?auto_28231 ?auto_28230 ) ( not ( = ?auto_28230 ?auto_28231 ) ) ( not ( = ?auto_28230 ?auto_28232 ) ) ( not ( = ?auto_28230 ?auto_28233 ) ) ( not ( = ?auto_28230 ?auto_28236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28231 ?auto_28232 ?auto_28233 )
      ( MAKE-3CRATE-VERIFY ?auto_28230 ?auto_28231 ?auto_28232 ?auto_28233 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28258 - SURFACE
      ?auto_28259 - SURFACE
      ?auto_28260 - SURFACE
      ?auto_28261 - SURFACE
    )
    :vars
    (
      ?auto_28264 - HOIST
      ?auto_28262 - PLACE
      ?auto_28267 - PLACE
      ?auto_28263 - HOIST
      ?auto_28266 - SURFACE
      ?auto_28265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28264 ?auto_28262 ) ( IS-CRATE ?auto_28261 ) ( not ( = ?auto_28260 ?auto_28261 ) ) ( not ( = ?auto_28259 ?auto_28260 ) ) ( not ( = ?auto_28259 ?auto_28261 ) ) ( not ( = ?auto_28267 ?auto_28262 ) ) ( HOIST-AT ?auto_28263 ?auto_28267 ) ( not ( = ?auto_28264 ?auto_28263 ) ) ( AVAILABLE ?auto_28263 ) ( SURFACE-AT ?auto_28261 ?auto_28267 ) ( ON ?auto_28261 ?auto_28266 ) ( CLEAR ?auto_28261 ) ( not ( = ?auto_28260 ?auto_28266 ) ) ( not ( = ?auto_28261 ?auto_28266 ) ) ( not ( = ?auto_28259 ?auto_28266 ) ) ( TRUCK-AT ?auto_28265 ?auto_28262 ) ( SURFACE-AT ?auto_28259 ?auto_28262 ) ( CLEAR ?auto_28259 ) ( LIFTING ?auto_28264 ?auto_28260 ) ( IS-CRATE ?auto_28260 ) ( ON ?auto_28259 ?auto_28258 ) ( not ( = ?auto_28258 ?auto_28259 ) ) ( not ( = ?auto_28258 ?auto_28260 ) ) ( not ( = ?auto_28258 ?auto_28261 ) ) ( not ( = ?auto_28258 ?auto_28266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28259 ?auto_28260 ?auto_28261 )
      ( MAKE-3CRATE-VERIFY ?auto_28258 ?auto_28259 ?auto_28260 ?auto_28261 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28286 - SURFACE
      ?auto_28287 - SURFACE
      ?auto_28288 - SURFACE
      ?auto_28289 - SURFACE
    )
    :vars
    (
      ?auto_28295 - HOIST
      ?auto_28294 - PLACE
      ?auto_28292 - PLACE
      ?auto_28291 - HOIST
      ?auto_28290 - SURFACE
      ?auto_28293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28295 ?auto_28294 ) ( IS-CRATE ?auto_28289 ) ( not ( = ?auto_28288 ?auto_28289 ) ) ( not ( = ?auto_28287 ?auto_28288 ) ) ( not ( = ?auto_28287 ?auto_28289 ) ) ( not ( = ?auto_28292 ?auto_28294 ) ) ( HOIST-AT ?auto_28291 ?auto_28292 ) ( not ( = ?auto_28295 ?auto_28291 ) ) ( AVAILABLE ?auto_28291 ) ( SURFACE-AT ?auto_28289 ?auto_28292 ) ( ON ?auto_28289 ?auto_28290 ) ( CLEAR ?auto_28289 ) ( not ( = ?auto_28288 ?auto_28290 ) ) ( not ( = ?auto_28289 ?auto_28290 ) ) ( not ( = ?auto_28287 ?auto_28290 ) ) ( TRUCK-AT ?auto_28293 ?auto_28294 ) ( SURFACE-AT ?auto_28287 ?auto_28294 ) ( CLEAR ?auto_28287 ) ( IS-CRATE ?auto_28288 ) ( AVAILABLE ?auto_28295 ) ( IN ?auto_28288 ?auto_28293 ) ( ON ?auto_28287 ?auto_28286 ) ( not ( = ?auto_28286 ?auto_28287 ) ) ( not ( = ?auto_28286 ?auto_28288 ) ) ( not ( = ?auto_28286 ?auto_28289 ) ) ( not ( = ?auto_28286 ?auto_28290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28287 ?auto_28288 ?auto_28289 )
      ( MAKE-3CRATE-VERIFY ?auto_28286 ?auto_28287 ?auto_28288 ?auto_28289 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28471 - SURFACE
      ?auto_28472 - SURFACE
    )
    :vars
    (
      ?auto_28479 - HOIST
      ?auto_28476 - PLACE
      ?auto_28473 - SURFACE
      ?auto_28474 - TRUCK
      ?auto_28478 - PLACE
      ?auto_28475 - HOIST
      ?auto_28477 - SURFACE
      ?auto_28480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28479 ?auto_28476 ) ( SURFACE-AT ?auto_28471 ?auto_28476 ) ( CLEAR ?auto_28471 ) ( IS-CRATE ?auto_28472 ) ( not ( = ?auto_28471 ?auto_28472 ) ) ( AVAILABLE ?auto_28479 ) ( ON ?auto_28471 ?auto_28473 ) ( not ( = ?auto_28473 ?auto_28471 ) ) ( not ( = ?auto_28473 ?auto_28472 ) ) ( TRUCK-AT ?auto_28474 ?auto_28478 ) ( not ( = ?auto_28478 ?auto_28476 ) ) ( HOIST-AT ?auto_28475 ?auto_28478 ) ( not ( = ?auto_28479 ?auto_28475 ) ) ( SURFACE-AT ?auto_28472 ?auto_28478 ) ( ON ?auto_28472 ?auto_28477 ) ( CLEAR ?auto_28472 ) ( not ( = ?auto_28471 ?auto_28477 ) ) ( not ( = ?auto_28472 ?auto_28477 ) ) ( not ( = ?auto_28473 ?auto_28477 ) ) ( LIFTING ?auto_28475 ?auto_28480 ) ( IS-CRATE ?auto_28480 ) ( not ( = ?auto_28471 ?auto_28480 ) ) ( not ( = ?auto_28472 ?auto_28480 ) ) ( not ( = ?auto_28473 ?auto_28480 ) ) ( not ( = ?auto_28477 ?auto_28480 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28475 ?auto_28480 ?auto_28474 ?auto_28478 )
      ( MAKE-1CRATE ?auto_28471 ?auto_28472 )
      ( MAKE-1CRATE-VERIFY ?auto_28471 ?auto_28472 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28579 - SURFACE
      ?auto_28580 - SURFACE
      ?auto_28581 - SURFACE
      ?auto_28582 - SURFACE
      ?auto_28583 - SURFACE
    )
    :vars
    (
      ?auto_28585 - HOIST
      ?auto_28584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28585 ?auto_28584 ) ( SURFACE-AT ?auto_28582 ?auto_28584 ) ( CLEAR ?auto_28582 ) ( LIFTING ?auto_28585 ?auto_28583 ) ( IS-CRATE ?auto_28583 ) ( not ( = ?auto_28582 ?auto_28583 ) ) ( ON ?auto_28580 ?auto_28579 ) ( ON ?auto_28581 ?auto_28580 ) ( ON ?auto_28582 ?auto_28581 ) ( not ( = ?auto_28579 ?auto_28580 ) ) ( not ( = ?auto_28579 ?auto_28581 ) ) ( not ( = ?auto_28579 ?auto_28582 ) ) ( not ( = ?auto_28579 ?auto_28583 ) ) ( not ( = ?auto_28580 ?auto_28581 ) ) ( not ( = ?auto_28580 ?auto_28582 ) ) ( not ( = ?auto_28580 ?auto_28583 ) ) ( not ( = ?auto_28581 ?auto_28582 ) ) ( not ( = ?auto_28581 ?auto_28583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28582 ?auto_28583 )
      ( MAKE-4CRATE-VERIFY ?auto_28579 ?auto_28580 ?auto_28581 ?auto_28582 ?auto_28583 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28604 - SURFACE
      ?auto_28605 - SURFACE
      ?auto_28606 - SURFACE
      ?auto_28607 - SURFACE
      ?auto_28608 - SURFACE
    )
    :vars
    (
      ?auto_28610 - HOIST
      ?auto_28609 - PLACE
      ?auto_28611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28610 ?auto_28609 ) ( SURFACE-AT ?auto_28607 ?auto_28609 ) ( CLEAR ?auto_28607 ) ( IS-CRATE ?auto_28608 ) ( not ( = ?auto_28607 ?auto_28608 ) ) ( TRUCK-AT ?auto_28611 ?auto_28609 ) ( AVAILABLE ?auto_28610 ) ( IN ?auto_28608 ?auto_28611 ) ( ON ?auto_28607 ?auto_28606 ) ( not ( = ?auto_28606 ?auto_28607 ) ) ( not ( = ?auto_28606 ?auto_28608 ) ) ( ON ?auto_28605 ?auto_28604 ) ( ON ?auto_28606 ?auto_28605 ) ( not ( = ?auto_28604 ?auto_28605 ) ) ( not ( = ?auto_28604 ?auto_28606 ) ) ( not ( = ?auto_28604 ?auto_28607 ) ) ( not ( = ?auto_28604 ?auto_28608 ) ) ( not ( = ?auto_28605 ?auto_28606 ) ) ( not ( = ?auto_28605 ?auto_28607 ) ) ( not ( = ?auto_28605 ?auto_28608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28606 ?auto_28607 ?auto_28608 )
      ( MAKE-4CRATE-VERIFY ?auto_28604 ?auto_28605 ?auto_28606 ?auto_28607 ?auto_28608 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28634 - SURFACE
      ?auto_28635 - SURFACE
      ?auto_28636 - SURFACE
      ?auto_28637 - SURFACE
      ?auto_28638 - SURFACE
    )
    :vars
    (
      ?auto_28642 - HOIST
      ?auto_28640 - PLACE
      ?auto_28641 - TRUCK
      ?auto_28639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28642 ?auto_28640 ) ( SURFACE-AT ?auto_28637 ?auto_28640 ) ( CLEAR ?auto_28637 ) ( IS-CRATE ?auto_28638 ) ( not ( = ?auto_28637 ?auto_28638 ) ) ( AVAILABLE ?auto_28642 ) ( IN ?auto_28638 ?auto_28641 ) ( ON ?auto_28637 ?auto_28636 ) ( not ( = ?auto_28636 ?auto_28637 ) ) ( not ( = ?auto_28636 ?auto_28638 ) ) ( TRUCK-AT ?auto_28641 ?auto_28639 ) ( not ( = ?auto_28639 ?auto_28640 ) ) ( ON ?auto_28635 ?auto_28634 ) ( ON ?auto_28636 ?auto_28635 ) ( not ( = ?auto_28634 ?auto_28635 ) ) ( not ( = ?auto_28634 ?auto_28636 ) ) ( not ( = ?auto_28634 ?auto_28637 ) ) ( not ( = ?auto_28634 ?auto_28638 ) ) ( not ( = ?auto_28635 ?auto_28636 ) ) ( not ( = ?auto_28635 ?auto_28637 ) ) ( not ( = ?auto_28635 ?auto_28638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28636 ?auto_28637 ?auto_28638 )
      ( MAKE-4CRATE-VERIFY ?auto_28634 ?auto_28635 ?auto_28636 ?auto_28637 ?auto_28638 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28668 - SURFACE
      ?auto_28669 - SURFACE
      ?auto_28670 - SURFACE
      ?auto_28671 - SURFACE
      ?auto_28672 - SURFACE
    )
    :vars
    (
      ?auto_28677 - HOIST
      ?auto_28674 - PLACE
      ?auto_28676 - TRUCK
      ?auto_28675 - PLACE
      ?auto_28673 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28677 ?auto_28674 ) ( SURFACE-AT ?auto_28671 ?auto_28674 ) ( CLEAR ?auto_28671 ) ( IS-CRATE ?auto_28672 ) ( not ( = ?auto_28671 ?auto_28672 ) ) ( AVAILABLE ?auto_28677 ) ( ON ?auto_28671 ?auto_28670 ) ( not ( = ?auto_28670 ?auto_28671 ) ) ( not ( = ?auto_28670 ?auto_28672 ) ) ( TRUCK-AT ?auto_28676 ?auto_28675 ) ( not ( = ?auto_28675 ?auto_28674 ) ) ( HOIST-AT ?auto_28673 ?auto_28675 ) ( LIFTING ?auto_28673 ?auto_28672 ) ( not ( = ?auto_28677 ?auto_28673 ) ) ( ON ?auto_28669 ?auto_28668 ) ( ON ?auto_28670 ?auto_28669 ) ( not ( = ?auto_28668 ?auto_28669 ) ) ( not ( = ?auto_28668 ?auto_28670 ) ) ( not ( = ?auto_28668 ?auto_28671 ) ) ( not ( = ?auto_28668 ?auto_28672 ) ) ( not ( = ?auto_28669 ?auto_28670 ) ) ( not ( = ?auto_28669 ?auto_28671 ) ) ( not ( = ?auto_28669 ?auto_28672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28670 ?auto_28671 ?auto_28672 )
      ( MAKE-4CRATE-VERIFY ?auto_28668 ?auto_28669 ?auto_28670 ?auto_28671 ?auto_28672 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28706 - SURFACE
      ?auto_28707 - SURFACE
      ?auto_28708 - SURFACE
      ?auto_28709 - SURFACE
      ?auto_28710 - SURFACE
    )
    :vars
    (
      ?auto_28711 - HOIST
      ?auto_28712 - PLACE
      ?auto_28715 - TRUCK
      ?auto_28716 - PLACE
      ?auto_28714 - HOIST
      ?auto_28713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28711 ?auto_28712 ) ( SURFACE-AT ?auto_28709 ?auto_28712 ) ( CLEAR ?auto_28709 ) ( IS-CRATE ?auto_28710 ) ( not ( = ?auto_28709 ?auto_28710 ) ) ( AVAILABLE ?auto_28711 ) ( ON ?auto_28709 ?auto_28708 ) ( not ( = ?auto_28708 ?auto_28709 ) ) ( not ( = ?auto_28708 ?auto_28710 ) ) ( TRUCK-AT ?auto_28715 ?auto_28716 ) ( not ( = ?auto_28716 ?auto_28712 ) ) ( HOIST-AT ?auto_28714 ?auto_28716 ) ( not ( = ?auto_28711 ?auto_28714 ) ) ( AVAILABLE ?auto_28714 ) ( SURFACE-AT ?auto_28710 ?auto_28716 ) ( ON ?auto_28710 ?auto_28713 ) ( CLEAR ?auto_28710 ) ( not ( = ?auto_28709 ?auto_28713 ) ) ( not ( = ?auto_28710 ?auto_28713 ) ) ( not ( = ?auto_28708 ?auto_28713 ) ) ( ON ?auto_28707 ?auto_28706 ) ( ON ?auto_28708 ?auto_28707 ) ( not ( = ?auto_28706 ?auto_28707 ) ) ( not ( = ?auto_28706 ?auto_28708 ) ) ( not ( = ?auto_28706 ?auto_28709 ) ) ( not ( = ?auto_28706 ?auto_28710 ) ) ( not ( = ?auto_28706 ?auto_28713 ) ) ( not ( = ?auto_28707 ?auto_28708 ) ) ( not ( = ?auto_28707 ?auto_28709 ) ) ( not ( = ?auto_28707 ?auto_28710 ) ) ( not ( = ?auto_28707 ?auto_28713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28708 ?auto_28709 ?auto_28710 )
      ( MAKE-4CRATE-VERIFY ?auto_28706 ?auto_28707 ?auto_28708 ?auto_28709 ?auto_28710 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28745 - SURFACE
      ?auto_28746 - SURFACE
      ?auto_28747 - SURFACE
      ?auto_28748 - SURFACE
      ?auto_28749 - SURFACE
    )
    :vars
    (
      ?auto_28753 - HOIST
      ?auto_28752 - PLACE
      ?auto_28750 - PLACE
      ?auto_28751 - HOIST
      ?auto_28755 - SURFACE
      ?auto_28754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28753 ?auto_28752 ) ( SURFACE-AT ?auto_28748 ?auto_28752 ) ( CLEAR ?auto_28748 ) ( IS-CRATE ?auto_28749 ) ( not ( = ?auto_28748 ?auto_28749 ) ) ( AVAILABLE ?auto_28753 ) ( ON ?auto_28748 ?auto_28747 ) ( not ( = ?auto_28747 ?auto_28748 ) ) ( not ( = ?auto_28747 ?auto_28749 ) ) ( not ( = ?auto_28750 ?auto_28752 ) ) ( HOIST-AT ?auto_28751 ?auto_28750 ) ( not ( = ?auto_28753 ?auto_28751 ) ) ( AVAILABLE ?auto_28751 ) ( SURFACE-AT ?auto_28749 ?auto_28750 ) ( ON ?auto_28749 ?auto_28755 ) ( CLEAR ?auto_28749 ) ( not ( = ?auto_28748 ?auto_28755 ) ) ( not ( = ?auto_28749 ?auto_28755 ) ) ( not ( = ?auto_28747 ?auto_28755 ) ) ( TRUCK-AT ?auto_28754 ?auto_28752 ) ( ON ?auto_28746 ?auto_28745 ) ( ON ?auto_28747 ?auto_28746 ) ( not ( = ?auto_28745 ?auto_28746 ) ) ( not ( = ?auto_28745 ?auto_28747 ) ) ( not ( = ?auto_28745 ?auto_28748 ) ) ( not ( = ?auto_28745 ?auto_28749 ) ) ( not ( = ?auto_28745 ?auto_28755 ) ) ( not ( = ?auto_28746 ?auto_28747 ) ) ( not ( = ?auto_28746 ?auto_28748 ) ) ( not ( = ?auto_28746 ?auto_28749 ) ) ( not ( = ?auto_28746 ?auto_28755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28747 ?auto_28748 ?auto_28749 )
      ( MAKE-4CRATE-VERIFY ?auto_28745 ?auto_28746 ?auto_28747 ?auto_28748 ?auto_28749 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28784 - SURFACE
      ?auto_28785 - SURFACE
      ?auto_28786 - SURFACE
      ?auto_28787 - SURFACE
      ?auto_28788 - SURFACE
    )
    :vars
    (
      ?auto_28791 - HOIST
      ?auto_28793 - PLACE
      ?auto_28790 - PLACE
      ?auto_28789 - HOIST
      ?auto_28792 - SURFACE
      ?auto_28794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28791 ?auto_28793 ) ( IS-CRATE ?auto_28788 ) ( not ( = ?auto_28787 ?auto_28788 ) ) ( not ( = ?auto_28786 ?auto_28787 ) ) ( not ( = ?auto_28786 ?auto_28788 ) ) ( not ( = ?auto_28790 ?auto_28793 ) ) ( HOIST-AT ?auto_28789 ?auto_28790 ) ( not ( = ?auto_28791 ?auto_28789 ) ) ( AVAILABLE ?auto_28789 ) ( SURFACE-AT ?auto_28788 ?auto_28790 ) ( ON ?auto_28788 ?auto_28792 ) ( CLEAR ?auto_28788 ) ( not ( = ?auto_28787 ?auto_28792 ) ) ( not ( = ?auto_28788 ?auto_28792 ) ) ( not ( = ?auto_28786 ?auto_28792 ) ) ( TRUCK-AT ?auto_28794 ?auto_28793 ) ( SURFACE-AT ?auto_28786 ?auto_28793 ) ( CLEAR ?auto_28786 ) ( LIFTING ?auto_28791 ?auto_28787 ) ( IS-CRATE ?auto_28787 ) ( ON ?auto_28785 ?auto_28784 ) ( ON ?auto_28786 ?auto_28785 ) ( not ( = ?auto_28784 ?auto_28785 ) ) ( not ( = ?auto_28784 ?auto_28786 ) ) ( not ( = ?auto_28784 ?auto_28787 ) ) ( not ( = ?auto_28784 ?auto_28788 ) ) ( not ( = ?auto_28784 ?auto_28792 ) ) ( not ( = ?auto_28785 ?auto_28786 ) ) ( not ( = ?auto_28785 ?auto_28787 ) ) ( not ( = ?auto_28785 ?auto_28788 ) ) ( not ( = ?auto_28785 ?auto_28792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28786 ?auto_28787 ?auto_28788 )
      ( MAKE-4CRATE-VERIFY ?auto_28784 ?auto_28785 ?auto_28786 ?auto_28787 ?auto_28788 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28823 - SURFACE
      ?auto_28824 - SURFACE
      ?auto_28825 - SURFACE
      ?auto_28826 - SURFACE
      ?auto_28827 - SURFACE
    )
    :vars
    (
      ?auto_28829 - HOIST
      ?auto_28828 - PLACE
      ?auto_28832 - PLACE
      ?auto_28833 - HOIST
      ?auto_28831 - SURFACE
      ?auto_28830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28829 ?auto_28828 ) ( IS-CRATE ?auto_28827 ) ( not ( = ?auto_28826 ?auto_28827 ) ) ( not ( = ?auto_28825 ?auto_28826 ) ) ( not ( = ?auto_28825 ?auto_28827 ) ) ( not ( = ?auto_28832 ?auto_28828 ) ) ( HOIST-AT ?auto_28833 ?auto_28832 ) ( not ( = ?auto_28829 ?auto_28833 ) ) ( AVAILABLE ?auto_28833 ) ( SURFACE-AT ?auto_28827 ?auto_28832 ) ( ON ?auto_28827 ?auto_28831 ) ( CLEAR ?auto_28827 ) ( not ( = ?auto_28826 ?auto_28831 ) ) ( not ( = ?auto_28827 ?auto_28831 ) ) ( not ( = ?auto_28825 ?auto_28831 ) ) ( TRUCK-AT ?auto_28830 ?auto_28828 ) ( SURFACE-AT ?auto_28825 ?auto_28828 ) ( CLEAR ?auto_28825 ) ( IS-CRATE ?auto_28826 ) ( AVAILABLE ?auto_28829 ) ( IN ?auto_28826 ?auto_28830 ) ( ON ?auto_28824 ?auto_28823 ) ( ON ?auto_28825 ?auto_28824 ) ( not ( = ?auto_28823 ?auto_28824 ) ) ( not ( = ?auto_28823 ?auto_28825 ) ) ( not ( = ?auto_28823 ?auto_28826 ) ) ( not ( = ?auto_28823 ?auto_28827 ) ) ( not ( = ?auto_28823 ?auto_28831 ) ) ( not ( = ?auto_28824 ?auto_28825 ) ) ( not ( = ?auto_28824 ?auto_28826 ) ) ( not ( = ?auto_28824 ?auto_28827 ) ) ( not ( = ?auto_28824 ?auto_28831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28825 ?auto_28826 ?auto_28827 )
      ( MAKE-4CRATE-VERIFY ?auto_28823 ?auto_28824 ?auto_28825 ?auto_28826 ?auto_28827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29324 - SURFACE
      ?auto_29325 - SURFACE
    )
    :vars
    (
      ?auto_29332 - HOIST
      ?auto_29327 - PLACE
      ?auto_29329 - SURFACE
      ?auto_29328 - PLACE
      ?auto_29330 - HOIST
      ?auto_29326 - SURFACE
      ?auto_29331 - TRUCK
      ?auto_29333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29332 ?auto_29327 ) ( SURFACE-AT ?auto_29324 ?auto_29327 ) ( CLEAR ?auto_29324 ) ( IS-CRATE ?auto_29325 ) ( not ( = ?auto_29324 ?auto_29325 ) ) ( ON ?auto_29324 ?auto_29329 ) ( not ( = ?auto_29329 ?auto_29324 ) ) ( not ( = ?auto_29329 ?auto_29325 ) ) ( not ( = ?auto_29328 ?auto_29327 ) ) ( HOIST-AT ?auto_29330 ?auto_29328 ) ( not ( = ?auto_29332 ?auto_29330 ) ) ( AVAILABLE ?auto_29330 ) ( SURFACE-AT ?auto_29325 ?auto_29328 ) ( ON ?auto_29325 ?auto_29326 ) ( CLEAR ?auto_29325 ) ( not ( = ?auto_29324 ?auto_29326 ) ) ( not ( = ?auto_29325 ?auto_29326 ) ) ( not ( = ?auto_29329 ?auto_29326 ) ) ( TRUCK-AT ?auto_29331 ?auto_29327 ) ( LIFTING ?auto_29332 ?auto_29333 ) ( IS-CRATE ?auto_29333 ) ( not ( = ?auto_29324 ?auto_29333 ) ) ( not ( = ?auto_29325 ?auto_29333 ) ) ( not ( = ?auto_29329 ?auto_29333 ) ) ( not ( = ?auto_29326 ?auto_29333 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29332 ?auto_29333 ?auto_29331 ?auto_29327 )
      ( MAKE-1CRATE ?auto_29324 ?auto_29325 )
      ( MAKE-1CRATE-VERIFY ?auto_29324 ?auto_29325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29483 - SURFACE
      ?auto_29484 - SURFACE
      ?auto_29485 - SURFACE
      ?auto_29486 - SURFACE
      ?auto_29487 - SURFACE
      ?auto_29488 - SURFACE
    )
    :vars
    (
      ?auto_29489 - HOIST
      ?auto_29490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29489 ?auto_29490 ) ( SURFACE-AT ?auto_29487 ?auto_29490 ) ( CLEAR ?auto_29487 ) ( LIFTING ?auto_29489 ?auto_29488 ) ( IS-CRATE ?auto_29488 ) ( not ( = ?auto_29487 ?auto_29488 ) ) ( ON ?auto_29484 ?auto_29483 ) ( ON ?auto_29485 ?auto_29484 ) ( ON ?auto_29486 ?auto_29485 ) ( ON ?auto_29487 ?auto_29486 ) ( not ( = ?auto_29483 ?auto_29484 ) ) ( not ( = ?auto_29483 ?auto_29485 ) ) ( not ( = ?auto_29483 ?auto_29486 ) ) ( not ( = ?auto_29483 ?auto_29487 ) ) ( not ( = ?auto_29483 ?auto_29488 ) ) ( not ( = ?auto_29484 ?auto_29485 ) ) ( not ( = ?auto_29484 ?auto_29486 ) ) ( not ( = ?auto_29484 ?auto_29487 ) ) ( not ( = ?auto_29484 ?auto_29488 ) ) ( not ( = ?auto_29485 ?auto_29486 ) ) ( not ( = ?auto_29485 ?auto_29487 ) ) ( not ( = ?auto_29485 ?auto_29488 ) ) ( not ( = ?auto_29486 ?auto_29487 ) ) ( not ( = ?auto_29486 ?auto_29488 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29487 ?auto_29488 )
      ( MAKE-5CRATE-VERIFY ?auto_29483 ?auto_29484 ?auto_29485 ?auto_29486 ?auto_29487 ?auto_29488 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29517 - SURFACE
      ?auto_29518 - SURFACE
      ?auto_29519 - SURFACE
      ?auto_29520 - SURFACE
      ?auto_29521 - SURFACE
      ?auto_29522 - SURFACE
    )
    :vars
    (
      ?auto_29525 - HOIST
      ?auto_29523 - PLACE
      ?auto_29524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29525 ?auto_29523 ) ( SURFACE-AT ?auto_29521 ?auto_29523 ) ( CLEAR ?auto_29521 ) ( IS-CRATE ?auto_29522 ) ( not ( = ?auto_29521 ?auto_29522 ) ) ( TRUCK-AT ?auto_29524 ?auto_29523 ) ( AVAILABLE ?auto_29525 ) ( IN ?auto_29522 ?auto_29524 ) ( ON ?auto_29521 ?auto_29520 ) ( not ( = ?auto_29520 ?auto_29521 ) ) ( not ( = ?auto_29520 ?auto_29522 ) ) ( ON ?auto_29518 ?auto_29517 ) ( ON ?auto_29519 ?auto_29518 ) ( ON ?auto_29520 ?auto_29519 ) ( not ( = ?auto_29517 ?auto_29518 ) ) ( not ( = ?auto_29517 ?auto_29519 ) ) ( not ( = ?auto_29517 ?auto_29520 ) ) ( not ( = ?auto_29517 ?auto_29521 ) ) ( not ( = ?auto_29517 ?auto_29522 ) ) ( not ( = ?auto_29518 ?auto_29519 ) ) ( not ( = ?auto_29518 ?auto_29520 ) ) ( not ( = ?auto_29518 ?auto_29521 ) ) ( not ( = ?auto_29518 ?auto_29522 ) ) ( not ( = ?auto_29519 ?auto_29520 ) ) ( not ( = ?auto_29519 ?auto_29521 ) ) ( not ( = ?auto_29519 ?auto_29522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29520 ?auto_29521 ?auto_29522 )
      ( MAKE-5CRATE-VERIFY ?auto_29517 ?auto_29518 ?auto_29519 ?auto_29520 ?auto_29521 ?auto_29522 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29557 - SURFACE
      ?auto_29558 - SURFACE
      ?auto_29559 - SURFACE
      ?auto_29560 - SURFACE
      ?auto_29561 - SURFACE
      ?auto_29562 - SURFACE
    )
    :vars
    (
      ?auto_29563 - HOIST
      ?auto_29564 - PLACE
      ?auto_29566 - TRUCK
      ?auto_29565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29563 ?auto_29564 ) ( SURFACE-AT ?auto_29561 ?auto_29564 ) ( CLEAR ?auto_29561 ) ( IS-CRATE ?auto_29562 ) ( not ( = ?auto_29561 ?auto_29562 ) ) ( AVAILABLE ?auto_29563 ) ( IN ?auto_29562 ?auto_29566 ) ( ON ?auto_29561 ?auto_29560 ) ( not ( = ?auto_29560 ?auto_29561 ) ) ( not ( = ?auto_29560 ?auto_29562 ) ) ( TRUCK-AT ?auto_29566 ?auto_29565 ) ( not ( = ?auto_29565 ?auto_29564 ) ) ( ON ?auto_29558 ?auto_29557 ) ( ON ?auto_29559 ?auto_29558 ) ( ON ?auto_29560 ?auto_29559 ) ( not ( = ?auto_29557 ?auto_29558 ) ) ( not ( = ?auto_29557 ?auto_29559 ) ) ( not ( = ?auto_29557 ?auto_29560 ) ) ( not ( = ?auto_29557 ?auto_29561 ) ) ( not ( = ?auto_29557 ?auto_29562 ) ) ( not ( = ?auto_29558 ?auto_29559 ) ) ( not ( = ?auto_29558 ?auto_29560 ) ) ( not ( = ?auto_29558 ?auto_29561 ) ) ( not ( = ?auto_29558 ?auto_29562 ) ) ( not ( = ?auto_29559 ?auto_29560 ) ) ( not ( = ?auto_29559 ?auto_29561 ) ) ( not ( = ?auto_29559 ?auto_29562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29560 ?auto_29561 ?auto_29562 )
      ( MAKE-5CRATE-VERIFY ?auto_29557 ?auto_29558 ?auto_29559 ?auto_29560 ?auto_29561 ?auto_29562 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29602 - SURFACE
      ?auto_29603 - SURFACE
      ?auto_29604 - SURFACE
      ?auto_29605 - SURFACE
      ?auto_29606 - SURFACE
      ?auto_29607 - SURFACE
    )
    :vars
    (
      ?auto_29611 - HOIST
      ?auto_29609 - PLACE
      ?auto_29610 - TRUCK
      ?auto_29612 - PLACE
      ?auto_29608 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29611 ?auto_29609 ) ( SURFACE-AT ?auto_29606 ?auto_29609 ) ( CLEAR ?auto_29606 ) ( IS-CRATE ?auto_29607 ) ( not ( = ?auto_29606 ?auto_29607 ) ) ( AVAILABLE ?auto_29611 ) ( ON ?auto_29606 ?auto_29605 ) ( not ( = ?auto_29605 ?auto_29606 ) ) ( not ( = ?auto_29605 ?auto_29607 ) ) ( TRUCK-AT ?auto_29610 ?auto_29612 ) ( not ( = ?auto_29612 ?auto_29609 ) ) ( HOIST-AT ?auto_29608 ?auto_29612 ) ( LIFTING ?auto_29608 ?auto_29607 ) ( not ( = ?auto_29611 ?auto_29608 ) ) ( ON ?auto_29603 ?auto_29602 ) ( ON ?auto_29604 ?auto_29603 ) ( ON ?auto_29605 ?auto_29604 ) ( not ( = ?auto_29602 ?auto_29603 ) ) ( not ( = ?auto_29602 ?auto_29604 ) ) ( not ( = ?auto_29602 ?auto_29605 ) ) ( not ( = ?auto_29602 ?auto_29606 ) ) ( not ( = ?auto_29602 ?auto_29607 ) ) ( not ( = ?auto_29603 ?auto_29604 ) ) ( not ( = ?auto_29603 ?auto_29605 ) ) ( not ( = ?auto_29603 ?auto_29606 ) ) ( not ( = ?auto_29603 ?auto_29607 ) ) ( not ( = ?auto_29604 ?auto_29605 ) ) ( not ( = ?auto_29604 ?auto_29606 ) ) ( not ( = ?auto_29604 ?auto_29607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29605 ?auto_29606 ?auto_29607 )
      ( MAKE-5CRATE-VERIFY ?auto_29602 ?auto_29603 ?auto_29604 ?auto_29605 ?auto_29606 ?auto_29607 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29652 - SURFACE
      ?auto_29653 - SURFACE
      ?auto_29654 - SURFACE
      ?auto_29655 - SURFACE
      ?auto_29656 - SURFACE
      ?auto_29657 - SURFACE
    )
    :vars
    (
      ?auto_29662 - HOIST
      ?auto_29658 - PLACE
      ?auto_29660 - TRUCK
      ?auto_29663 - PLACE
      ?auto_29659 - HOIST
      ?auto_29661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29662 ?auto_29658 ) ( SURFACE-AT ?auto_29656 ?auto_29658 ) ( CLEAR ?auto_29656 ) ( IS-CRATE ?auto_29657 ) ( not ( = ?auto_29656 ?auto_29657 ) ) ( AVAILABLE ?auto_29662 ) ( ON ?auto_29656 ?auto_29655 ) ( not ( = ?auto_29655 ?auto_29656 ) ) ( not ( = ?auto_29655 ?auto_29657 ) ) ( TRUCK-AT ?auto_29660 ?auto_29663 ) ( not ( = ?auto_29663 ?auto_29658 ) ) ( HOIST-AT ?auto_29659 ?auto_29663 ) ( not ( = ?auto_29662 ?auto_29659 ) ) ( AVAILABLE ?auto_29659 ) ( SURFACE-AT ?auto_29657 ?auto_29663 ) ( ON ?auto_29657 ?auto_29661 ) ( CLEAR ?auto_29657 ) ( not ( = ?auto_29656 ?auto_29661 ) ) ( not ( = ?auto_29657 ?auto_29661 ) ) ( not ( = ?auto_29655 ?auto_29661 ) ) ( ON ?auto_29653 ?auto_29652 ) ( ON ?auto_29654 ?auto_29653 ) ( ON ?auto_29655 ?auto_29654 ) ( not ( = ?auto_29652 ?auto_29653 ) ) ( not ( = ?auto_29652 ?auto_29654 ) ) ( not ( = ?auto_29652 ?auto_29655 ) ) ( not ( = ?auto_29652 ?auto_29656 ) ) ( not ( = ?auto_29652 ?auto_29657 ) ) ( not ( = ?auto_29652 ?auto_29661 ) ) ( not ( = ?auto_29653 ?auto_29654 ) ) ( not ( = ?auto_29653 ?auto_29655 ) ) ( not ( = ?auto_29653 ?auto_29656 ) ) ( not ( = ?auto_29653 ?auto_29657 ) ) ( not ( = ?auto_29653 ?auto_29661 ) ) ( not ( = ?auto_29654 ?auto_29655 ) ) ( not ( = ?auto_29654 ?auto_29656 ) ) ( not ( = ?auto_29654 ?auto_29657 ) ) ( not ( = ?auto_29654 ?auto_29661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29655 ?auto_29656 ?auto_29657 )
      ( MAKE-5CRATE-VERIFY ?auto_29652 ?auto_29653 ?auto_29654 ?auto_29655 ?auto_29656 ?auto_29657 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29703 - SURFACE
      ?auto_29704 - SURFACE
      ?auto_29705 - SURFACE
      ?auto_29706 - SURFACE
      ?auto_29707 - SURFACE
      ?auto_29708 - SURFACE
    )
    :vars
    (
      ?auto_29712 - HOIST
      ?auto_29709 - PLACE
      ?auto_29711 - PLACE
      ?auto_29714 - HOIST
      ?auto_29713 - SURFACE
      ?auto_29710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29712 ?auto_29709 ) ( SURFACE-AT ?auto_29707 ?auto_29709 ) ( CLEAR ?auto_29707 ) ( IS-CRATE ?auto_29708 ) ( not ( = ?auto_29707 ?auto_29708 ) ) ( AVAILABLE ?auto_29712 ) ( ON ?auto_29707 ?auto_29706 ) ( not ( = ?auto_29706 ?auto_29707 ) ) ( not ( = ?auto_29706 ?auto_29708 ) ) ( not ( = ?auto_29711 ?auto_29709 ) ) ( HOIST-AT ?auto_29714 ?auto_29711 ) ( not ( = ?auto_29712 ?auto_29714 ) ) ( AVAILABLE ?auto_29714 ) ( SURFACE-AT ?auto_29708 ?auto_29711 ) ( ON ?auto_29708 ?auto_29713 ) ( CLEAR ?auto_29708 ) ( not ( = ?auto_29707 ?auto_29713 ) ) ( not ( = ?auto_29708 ?auto_29713 ) ) ( not ( = ?auto_29706 ?auto_29713 ) ) ( TRUCK-AT ?auto_29710 ?auto_29709 ) ( ON ?auto_29704 ?auto_29703 ) ( ON ?auto_29705 ?auto_29704 ) ( ON ?auto_29706 ?auto_29705 ) ( not ( = ?auto_29703 ?auto_29704 ) ) ( not ( = ?auto_29703 ?auto_29705 ) ) ( not ( = ?auto_29703 ?auto_29706 ) ) ( not ( = ?auto_29703 ?auto_29707 ) ) ( not ( = ?auto_29703 ?auto_29708 ) ) ( not ( = ?auto_29703 ?auto_29713 ) ) ( not ( = ?auto_29704 ?auto_29705 ) ) ( not ( = ?auto_29704 ?auto_29706 ) ) ( not ( = ?auto_29704 ?auto_29707 ) ) ( not ( = ?auto_29704 ?auto_29708 ) ) ( not ( = ?auto_29704 ?auto_29713 ) ) ( not ( = ?auto_29705 ?auto_29706 ) ) ( not ( = ?auto_29705 ?auto_29707 ) ) ( not ( = ?auto_29705 ?auto_29708 ) ) ( not ( = ?auto_29705 ?auto_29713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29706 ?auto_29707 ?auto_29708 )
      ( MAKE-5CRATE-VERIFY ?auto_29703 ?auto_29704 ?auto_29705 ?auto_29706 ?auto_29707 ?auto_29708 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29754 - SURFACE
      ?auto_29755 - SURFACE
      ?auto_29756 - SURFACE
      ?auto_29757 - SURFACE
      ?auto_29758 - SURFACE
      ?auto_29759 - SURFACE
    )
    :vars
    (
      ?auto_29764 - HOIST
      ?auto_29762 - PLACE
      ?auto_29760 - PLACE
      ?auto_29761 - HOIST
      ?auto_29765 - SURFACE
      ?auto_29763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29764 ?auto_29762 ) ( IS-CRATE ?auto_29759 ) ( not ( = ?auto_29758 ?auto_29759 ) ) ( not ( = ?auto_29757 ?auto_29758 ) ) ( not ( = ?auto_29757 ?auto_29759 ) ) ( not ( = ?auto_29760 ?auto_29762 ) ) ( HOIST-AT ?auto_29761 ?auto_29760 ) ( not ( = ?auto_29764 ?auto_29761 ) ) ( AVAILABLE ?auto_29761 ) ( SURFACE-AT ?auto_29759 ?auto_29760 ) ( ON ?auto_29759 ?auto_29765 ) ( CLEAR ?auto_29759 ) ( not ( = ?auto_29758 ?auto_29765 ) ) ( not ( = ?auto_29759 ?auto_29765 ) ) ( not ( = ?auto_29757 ?auto_29765 ) ) ( TRUCK-AT ?auto_29763 ?auto_29762 ) ( SURFACE-AT ?auto_29757 ?auto_29762 ) ( CLEAR ?auto_29757 ) ( LIFTING ?auto_29764 ?auto_29758 ) ( IS-CRATE ?auto_29758 ) ( ON ?auto_29755 ?auto_29754 ) ( ON ?auto_29756 ?auto_29755 ) ( ON ?auto_29757 ?auto_29756 ) ( not ( = ?auto_29754 ?auto_29755 ) ) ( not ( = ?auto_29754 ?auto_29756 ) ) ( not ( = ?auto_29754 ?auto_29757 ) ) ( not ( = ?auto_29754 ?auto_29758 ) ) ( not ( = ?auto_29754 ?auto_29759 ) ) ( not ( = ?auto_29754 ?auto_29765 ) ) ( not ( = ?auto_29755 ?auto_29756 ) ) ( not ( = ?auto_29755 ?auto_29757 ) ) ( not ( = ?auto_29755 ?auto_29758 ) ) ( not ( = ?auto_29755 ?auto_29759 ) ) ( not ( = ?auto_29755 ?auto_29765 ) ) ( not ( = ?auto_29756 ?auto_29757 ) ) ( not ( = ?auto_29756 ?auto_29758 ) ) ( not ( = ?auto_29756 ?auto_29759 ) ) ( not ( = ?auto_29756 ?auto_29765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29757 ?auto_29758 ?auto_29759 )
      ( MAKE-5CRATE-VERIFY ?auto_29754 ?auto_29755 ?auto_29756 ?auto_29757 ?auto_29758 ?auto_29759 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29805 - SURFACE
      ?auto_29806 - SURFACE
      ?auto_29807 - SURFACE
      ?auto_29808 - SURFACE
      ?auto_29809 - SURFACE
      ?auto_29810 - SURFACE
    )
    :vars
    (
      ?auto_29814 - HOIST
      ?auto_29816 - PLACE
      ?auto_29815 - PLACE
      ?auto_29811 - HOIST
      ?auto_29812 - SURFACE
      ?auto_29813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29814 ?auto_29816 ) ( IS-CRATE ?auto_29810 ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( not ( = ?auto_29808 ?auto_29809 ) ) ( not ( = ?auto_29808 ?auto_29810 ) ) ( not ( = ?auto_29815 ?auto_29816 ) ) ( HOIST-AT ?auto_29811 ?auto_29815 ) ( not ( = ?auto_29814 ?auto_29811 ) ) ( AVAILABLE ?auto_29811 ) ( SURFACE-AT ?auto_29810 ?auto_29815 ) ( ON ?auto_29810 ?auto_29812 ) ( CLEAR ?auto_29810 ) ( not ( = ?auto_29809 ?auto_29812 ) ) ( not ( = ?auto_29810 ?auto_29812 ) ) ( not ( = ?auto_29808 ?auto_29812 ) ) ( TRUCK-AT ?auto_29813 ?auto_29816 ) ( SURFACE-AT ?auto_29808 ?auto_29816 ) ( CLEAR ?auto_29808 ) ( IS-CRATE ?auto_29809 ) ( AVAILABLE ?auto_29814 ) ( IN ?auto_29809 ?auto_29813 ) ( ON ?auto_29806 ?auto_29805 ) ( ON ?auto_29807 ?auto_29806 ) ( ON ?auto_29808 ?auto_29807 ) ( not ( = ?auto_29805 ?auto_29806 ) ) ( not ( = ?auto_29805 ?auto_29807 ) ) ( not ( = ?auto_29805 ?auto_29808 ) ) ( not ( = ?auto_29805 ?auto_29809 ) ) ( not ( = ?auto_29805 ?auto_29810 ) ) ( not ( = ?auto_29805 ?auto_29812 ) ) ( not ( = ?auto_29806 ?auto_29807 ) ) ( not ( = ?auto_29806 ?auto_29808 ) ) ( not ( = ?auto_29806 ?auto_29809 ) ) ( not ( = ?auto_29806 ?auto_29810 ) ) ( not ( = ?auto_29806 ?auto_29812 ) ) ( not ( = ?auto_29807 ?auto_29808 ) ) ( not ( = ?auto_29807 ?auto_29809 ) ) ( not ( = ?auto_29807 ?auto_29810 ) ) ( not ( = ?auto_29807 ?auto_29812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29808 ?auto_29809 ?auto_29810 )
      ( MAKE-5CRATE-VERIFY ?auto_29805 ?auto_29806 ?auto_29807 ?auto_29808 ?auto_29809 ?auto_29810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29817 - SURFACE
      ?auto_29818 - SURFACE
    )
    :vars
    (
      ?auto_29822 - HOIST
      ?auto_29824 - PLACE
      ?auto_29825 - SURFACE
      ?auto_29823 - PLACE
      ?auto_29819 - HOIST
      ?auto_29820 - SURFACE
      ?auto_29821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29822 ?auto_29824 ) ( IS-CRATE ?auto_29818 ) ( not ( = ?auto_29817 ?auto_29818 ) ) ( not ( = ?auto_29825 ?auto_29817 ) ) ( not ( = ?auto_29825 ?auto_29818 ) ) ( not ( = ?auto_29823 ?auto_29824 ) ) ( HOIST-AT ?auto_29819 ?auto_29823 ) ( not ( = ?auto_29822 ?auto_29819 ) ) ( AVAILABLE ?auto_29819 ) ( SURFACE-AT ?auto_29818 ?auto_29823 ) ( ON ?auto_29818 ?auto_29820 ) ( CLEAR ?auto_29818 ) ( not ( = ?auto_29817 ?auto_29820 ) ) ( not ( = ?auto_29818 ?auto_29820 ) ) ( not ( = ?auto_29825 ?auto_29820 ) ) ( SURFACE-AT ?auto_29825 ?auto_29824 ) ( CLEAR ?auto_29825 ) ( IS-CRATE ?auto_29817 ) ( AVAILABLE ?auto_29822 ) ( IN ?auto_29817 ?auto_29821 ) ( TRUCK-AT ?auto_29821 ?auto_29823 ) )
    :subtasks
    ( ( !DRIVE ?auto_29821 ?auto_29823 ?auto_29824 )
      ( MAKE-2CRATE ?auto_29825 ?auto_29817 ?auto_29818 )
      ( MAKE-1CRATE-VERIFY ?auto_29817 ?auto_29818 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29826 - SURFACE
      ?auto_29827 - SURFACE
      ?auto_29828 - SURFACE
    )
    :vars
    (
      ?auto_29834 - HOIST
      ?auto_29832 - PLACE
      ?auto_29829 - PLACE
      ?auto_29833 - HOIST
      ?auto_29830 - SURFACE
      ?auto_29831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29834 ?auto_29832 ) ( IS-CRATE ?auto_29828 ) ( not ( = ?auto_29827 ?auto_29828 ) ) ( not ( = ?auto_29826 ?auto_29827 ) ) ( not ( = ?auto_29826 ?auto_29828 ) ) ( not ( = ?auto_29829 ?auto_29832 ) ) ( HOIST-AT ?auto_29833 ?auto_29829 ) ( not ( = ?auto_29834 ?auto_29833 ) ) ( AVAILABLE ?auto_29833 ) ( SURFACE-AT ?auto_29828 ?auto_29829 ) ( ON ?auto_29828 ?auto_29830 ) ( CLEAR ?auto_29828 ) ( not ( = ?auto_29827 ?auto_29830 ) ) ( not ( = ?auto_29828 ?auto_29830 ) ) ( not ( = ?auto_29826 ?auto_29830 ) ) ( SURFACE-AT ?auto_29826 ?auto_29832 ) ( CLEAR ?auto_29826 ) ( IS-CRATE ?auto_29827 ) ( AVAILABLE ?auto_29834 ) ( IN ?auto_29827 ?auto_29831 ) ( TRUCK-AT ?auto_29831 ?auto_29829 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29827 ?auto_29828 )
      ( MAKE-2CRATE-VERIFY ?auto_29826 ?auto_29827 ?auto_29828 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29835 - SURFACE
      ?auto_29836 - SURFACE
      ?auto_29837 - SURFACE
      ?auto_29838 - SURFACE
    )
    :vars
    (
      ?auto_29842 - HOIST
      ?auto_29841 - PLACE
      ?auto_29839 - PLACE
      ?auto_29843 - HOIST
      ?auto_29840 - SURFACE
      ?auto_29844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29842 ?auto_29841 ) ( IS-CRATE ?auto_29838 ) ( not ( = ?auto_29837 ?auto_29838 ) ) ( not ( = ?auto_29836 ?auto_29837 ) ) ( not ( = ?auto_29836 ?auto_29838 ) ) ( not ( = ?auto_29839 ?auto_29841 ) ) ( HOIST-AT ?auto_29843 ?auto_29839 ) ( not ( = ?auto_29842 ?auto_29843 ) ) ( AVAILABLE ?auto_29843 ) ( SURFACE-AT ?auto_29838 ?auto_29839 ) ( ON ?auto_29838 ?auto_29840 ) ( CLEAR ?auto_29838 ) ( not ( = ?auto_29837 ?auto_29840 ) ) ( not ( = ?auto_29838 ?auto_29840 ) ) ( not ( = ?auto_29836 ?auto_29840 ) ) ( SURFACE-AT ?auto_29836 ?auto_29841 ) ( CLEAR ?auto_29836 ) ( IS-CRATE ?auto_29837 ) ( AVAILABLE ?auto_29842 ) ( IN ?auto_29837 ?auto_29844 ) ( TRUCK-AT ?auto_29844 ?auto_29839 ) ( ON ?auto_29836 ?auto_29835 ) ( not ( = ?auto_29835 ?auto_29836 ) ) ( not ( = ?auto_29835 ?auto_29837 ) ) ( not ( = ?auto_29835 ?auto_29838 ) ) ( not ( = ?auto_29835 ?auto_29840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29836 ?auto_29837 ?auto_29838 )
      ( MAKE-3CRATE-VERIFY ?auto_29835 ?auto_29836 ?auto_29837 ?auto_29838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29845 - SURFACE
      ?auto_29846 - SURFACE
      ?auto_29847 - SURFACE
      ?auto_29848 - SURFACE
      ?auto_29849 - SURFACE
    )
    :vars
    (
      ?auto_29853 - HOIST
      ?auto_29852 - PLACE
      ?auto_29850 - PLACE
      ?auto_29854 - HOIST
      ?auto_29851 - SURFACE
      ?auto_29855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29853 ?auto_29852 ) ( IS-CRATE ?auto_29849 ) ( not ( = ?auto_29848 ?auto_29849 ) ) ( not ( = ?auto_29847 ?auto_29848 ) ) ( not ( = ?auto_29847 ?auto_29849 ) ) ( not ( = ?auto_29850 ?auto_29852 ) ) ( HOIST-AT ?auto_29854 ?auto_29850 ) ( not ( = ?auto_29853 ?auto_29854 ) ) ( AVAILABLE ?auto_29854 ) ( SURFACE-AT ?auto_29849 ?auto_29850 ) ( ON ?auto_29849 ?auto_29851 ) ( CLEAR ?auto_29849 ) ( not ( = ?auto_29848 ?auto_29851 ) ) ( not ( = ?auto_29849 ?auto_29851 ) ) ( not ( = ?auto_29847 ?auto_29851 ) ) ( SURFACE-AT ?auto_29847 ?auto_29852 ) ( CLEAR ?auto_29847 ) ( IS-CRATE ?auto_29848 ) ( AVAILABLE ?auto_29853 ) ( IN ?auto_29848 ?auto_29855 ) ( TRUCK-AT ?auto_29855 ?auto_29850 ) ( ON ?auto_29846 ?auto_29845 ) ( ON ?auto_29847 ?auto_29846 ) ( not ( = ?auto_29845 ?auto_29846 ) ) ( not ( = ?auto_29845 ?auto_29847 ) ) ( not ( = ?auto_29845 ?auto_29848 ) ) ( not ( = ?auto_29845 ?auto_29849 ) ) ( not ( = ?auto_29845 ?auto_29851 ) ) ( not ( = ?auto_29846 ?auto_29847 ) ) ( not ( = ?auto_29846 ?auto_29848 ) ) ( not ( = ?auto_29846 ?auto_29849 ) ) ( not ( = ?auto_29846 ?auto_29851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29847 ?auto_29848 ?auto_29849 )
      ( MAKE-4CRATE-VERIFY ?auto_29845 ?auto_29846 ?auto_29847 ?auto_29848 ?auto_29849 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29856 - SURFACE
      ?auto_29857 - SURFACE
      ?auto_29858 - SURFACE
      ?auto_29859 - SURFACE
      ?auto_29860 - SURFACE
      ?auto_29861 - SURFACE
    )
    :vars
    (
      ?auto_29865 - HOIST
      ?auto_29864 - PLACE
      ?auto_29862 - PLACE
      ?auto_29866 - HOIST
      ?auto_29863 - SURFACE
      ?auto_29867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29865 ?auto_29864 ) ( IS-CRATE ?auto_29861 ) ( not ( = ?auto_29860 ?auto_29861 ) ) ( not ( = ?auto_29859 ?auto_29860 ) ) ( not ( = ?auto_29859 ?auto_29861 ) ) ( not ( = ?auto_29862 ?auto_29864 ) ) ( HOIST-AT ?auto_29866 ?auto_29862 ) ( not ( = ?auto_29865 ?auto_29866 ) ) ( AVAILABLE ?auto_29866 ) ( SURFACE-AT ?auto_29861 ?auto_29862 ) ( ON ?auto_29861 ?auto_29863 ) ( CLEAR ?auto_29861 ) ( not ( = ?auto_29860 ?auto_29863 ) ) ( not ( = ?auto_29861 ?auto_29863 ) ) ( not ( = ?auto_29859 ?auto_29863 ) ) ( SURFACE-AT ?auto_29859 ?auto_29864 ) ( CLEAR ?auto_29859 ) ( IS-CRATE ?auto_29860 ) ( AVAILABLE ?auto_29865 ) ( IN ?auto_29860 ?auto_29867 ) ( TRUCK-AT ?auto_29867 ?auto_29862 ) ( ON ?auto_29857 ?auto_29856 ) ( ON ?auto_29858 ?auto_29857 ) ( ON ?auto_29859 ?auto_29858 ) ( not ( = ?auto_29856 ?auto_29857 ) ) ( not ( = ?auto_29856 ?auto_29858 ) ) ( not ( = ?auto_29856 ?auto_29859 ) ) ( not ( = ?auto_29856 ?auto_29860 ) ) ( not ( = ?auto_29856 ?auto_29861 ) ) ( not ( = ?auto_29856 ?auto_29863 ) ) ( not ( = ?auto_29857 ?auto_29858 ) ) ( not ( = ?auto_29857 ?auto_29859 ) ) ( not ( = ?auto_29857 ?auto_29860 ) ) ( not ( = ?auto_29857 ?auto_29861 ) ) ( not ( = ?auto_29857 ?auto_29863 ) ) ( not ( = ?auto_29858 ?auto_29859 ) ) ( not ( = ?auto_29858 ?auto_29860 ) ) ( not ( = ?auto_29858 ?auto_29861 ) ) ( not ( = ?auto_29858 ?auto_29863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29859 ?auto_29860 ?auto_29861 )
      ( MAKE-5CRATE-VERIFY ?auto_29856 ?auto_29857 ?auto_29858 ?auto_29859 ?auto_29860 ?auto_29861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29868 - SURFACE
      ?auto_29869 - SURFACE
    )
    :vars
    (
      ?auto_29874 - HOIST
      ?auto_29873 - PLACE
      ?auto_29870 - SURFACE
      ?auto_29871 - PLACE
      ?auto_29875 - HOIST
      ?auto_29872 - SURFACE
      ?auto_29876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29874 ?auto_29873 ) ( IS-CRATE ?auto_29869 ) ( not ( = ?auto_29868 ?auto_29869 ) ) ( not ( = ?auto_29870 ?auto_29868 ) ) ( not ( = ?auto_29870 ?auto_29869 ) ) ( not ( = ?auto_29871 ?auto_29873 ) ) ( HOIST-AT ?auto_29875 ?auto_29871 ) ( not ( = ?auto_29874 ?auto_29875 ) ) ( SURFACE-AT ?auto_29869 ?auto_29871 ) ( ON ?auto_29869 ?auto_29872 ) ( CLEAR ?auto_29869 ) ( not ( = ?auto_29868 ?auto_29872 ) ) ( not ( = ?auto_29869 ?auto_29872 ) ) ( not ( = ?auto_29870 ?auto_29872 ) ) ( SURFACE-AT ?auto_29870 ?auto_29873 ) ( CLEAR ?auto_29870 ) ( IS-CRATE ?auto_29868 ) ( AVAILABLE ?auto_29874 ) ( TRUCK-AT ?auto_29876 ?auto_29871 ) ( LIFTING ?auto_29875 ?auto_29868 ) )
    :subtasks
    ( ( !LOAD ?auto_29875 ?auto_29868 ?auto_29876 ?auto_29871 )
      ( MAKE-2CRATE ?auto_29870 ?auto_29868 ?auto_29869 )
      ( MAKE-1CRATE-VERIFY ?auto_29868 ?auto_29869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29877 - SURFACE
      ?auto_29878 - SURFACE
      ?auto_29879 - SURFACE
    )
    :vars
    (
      ?auto_29883 - HOIST
      ?auto_29882 - PLACE
      ?auto_29880 - PLACE
      ?auto_29881 - HOIST
      ?auto_29885 - SURFACE
      ?auto_29884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29883 ?auto_29882 ) ( IS-CRATE ?auto_29879 ) ( not ( = ?auto_29878 ?auto_29879 ) ) ( not ( = ?auto_29877 ?auto_29878 ) ) ( not ( = ?auto_29877 ?auto_29879 ) ) ( not ( = ?auto_29880 ?auto_29882 ) ) ( HOIST-AT ?auto_29881 ?auto_29880 ) ( not ( = ?auto_29883 ?auto_29881 ) ) ( SURFACE-AT ?auto_29879 ?auto_29880 ) ( ON ?auto_29879 ?auto_29885 ) ( CLEAR ?auto_29879 ) ( not ( = ?auto_29878 ?auto_29885 ) ) ( not ( = ?auto_29879 ?auto_29885 ) ) ( not ( = ?auto_29877 ?auto_29885 ) ) ( SURFACE-AT ?auto_29877 ?auto_29882 ) ( CLEAR ?auto_29877 ) ( IS-CRATE ?auto_29878 ) ( AVAILABLE ?auto_29883 ) ( TRUCK-AT ?auto_29884 ?auto_29880 ) ( LIFTING ?auto_29881 ?auto_29878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29878 ?auto_29879 )
      ( MAKE-2CRATE-VERIFY ?auto_29877 ?auto_29878 ?auto_29879 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29886 - SURFACE
      ?auto_29887 - SURFACE
      ?auto_29888 - SURFACE
      ?auto_29889 - SURFACE
    )
    :vars
    (
      ?auto_29895 - HOIST
      ?auto_29894 - PLACE
      ?auto_29892 - PLACE
      ?auto_29893 - HOIST
      ?auto_29891 - SURFACE
      ?auto_29890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29895 ?auto_29894 ) ( IS-CRATE ?auto_29889 ) ( not ( = ?auto_29888 ?auto_29889 ) ) ( not ( = ?auto_29887 ?auto_29888 ) ) ( not ( = ?auto_29887 ?auto_29889 ) ) ( not ( = ?auto_29892 ?auto_29894 ) ) ( HOIST-AT ?auto_29893 ?auto_29892 ) ( not ( = ?auto_29895 ?auto_29893 ) ) ( SURFACE-AT ?auto_29889 ?auto_29892 ) ( ON ?auto_29889 ?auto_29891 ) ( CLEAR ?auto_29889 ) ( not ( = ?auto_29888 ?auto_29891 ) ) ( not ( = ?auto_29889 ?auto_29891 ) ) ( not ( = ?auto_29887 ?auto_29891 ) ) ( SURFACE-AT ?auto_29887 ?auto_29894 ) ( CLEAR ?auto_29887 ) ( IS-CRATE ?auto_29888 ) ( AVAILABLE ?auto_29895 ) ( TRUCK-AT ?auto_29890 ?auto_29892 ) ( LIFTING ?auto_29893 ?auto_29888 ) ( ON ?auto_29887 ?auto_29886 ) ( not ( = ?auto_29886 ?auto_29887 ) ) ( not ( = ?auto_29886 ?auto_29888 ) ) ( not ( = ?auto_29886 ?auto_29889 ) ) ( not ( = ?auto_29886 ?auto_29891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29887 ?auto_29888 ?auto_29889 )
      ( MAKE-3CRATE-VERIFY ?auto_29886 ?auto_29887 ?auto_29888 ?auto_29889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29896 - SURFACE
      ?auto_29897 - SURFACE
      ?auto_29898 - SURFACE
      ?auto_29899 - SURFACE
      ?auto_29900 - SURFACE
    )
    :vars
    (
      ?auto_29906 - HOIST
      ?auto_29905 - PLACE
      ?auto_29903 - PLACE
      ?auto_29904 - HOIST
      ?auto_29902 - SURFACE
      ?auto_29901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29906 ?auto_29905 ) ( IS-CRATE ?auto_29900 ) ( not ( = ?auto_29899 ?auto_29900 ) ) ( not ( = ?auto_29898 ?auto_29899 ) ) ( not ( = ?auto_29898 ?auto_29900 ) ) ( not ( = ?auto_29903 ?auto_29905 ) ) ( HOIST-AT ?auto_29904 ?auto_29903 ) ( not ( = ?auto_29906 ?auto_29904 ) ) ( SURFACE-AT ?auto_29900 ?auto_29903 ) ( ON ?auto_29900 ?auto_29902 ) ( CLEAR ?auto_29900 ) ( not ( = ?auto_29899 ?auto_29902 ) ) ( not ( = ?auto_29900 ?auto_29902 ) ) ( not ( = ?auto_29898 ?auto_29902 ) ) ( SURFACE-AT ?auto_29898 ?auto_29905 ) ( CLEAR ?auto_29898 ) ( IS-CRATE ?auto_29899 ) ( AVAILABLE ?auto_29906 ) ( TRUCK-AT ?auto_29901 ?auto_29903 ) ( LIFTING ?auto_29904 ?auto_29899 ) ( ON ?auto_29897 ?auto_29896 ) ( ON ?auto_29898 ?auto_29897 ) ( not ( = ?auto_29896 ?auto_29897 ) ) ( not ( = ?auto_29896 ?auto_29898 ) ) ( not ( = ?auto_29896 ?auto_29899 ) ) ( not ( = ?auto_29896 ?auto_29900 ) ) ( not ( = ?auto_29896 ?auto_29902 ) ) ( not ( = ?auto_29897 ?auto_29898 ) ) ( not ( = ?auto_29897 ?auto_29899 ) ) ( not ( = ?auto_29897 ?auto_29900 ) ) ( not ( = ?auto_29897 ?auto_29902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29898 ?auto_29899 ?auto_29900 )
      ( MAKE-4CRATE-VERIFY ?auto_29896 ?auto_29897 ?auto_29898 ?auto_29899 ?auto_29900 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29907 - SURFACE
      ?auto_29908 - SURFACE
      ?auto_29909 - SURFACE
      ?auto_29910 - SURFACE
      ?auto_29911 - SURFACE
      ?auto_29912 - SURFACE
    )
    :vars
    (
      ?auto_29918 - HOIST
      ?auto_29917 - PLACE
      ?auto_29915 - PLACE
      ?auto_29916 - HOIST
      ?auto_29914 - SURFACE
      ?auto_29913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29918 ?auto_29917 ) ( IS-CRATE ?auto_29912 ) ( not ( = ?auto_29911 ?auto_29912 ) ) ( not ( = ?auto_29910 ?auto_29911 ) ) ( not ( = ?auto_29910 ?auto_29912 ) ) ( not ( = ?auto_29915 ?auto_29917 ) ) ( HOIST-AT ?auto_29916 ?auto_29915 ) ( not ( = ?auto_29918 ?auto_29916 ) ) ( SURFACE-AT ?auto_29912 ?auto_29915 ) ( ON ?auto_29912 ?auto_29914 ) ( CLEAR ?auto_29912 ) ( not ( = ?auto_29911 ?auto_29914 ) ) ( not ( = ?auto_29912 ?auto_29914 ) ) ( not ( = ?auto_29910 ?auto_29914 ) ) ( SURFACE-AT ?auto_29910 ?auto_29917 ) ( CLEAR ?auto_29910 ) ( IS-CRATE ?auto_29911 ) ( AVAILABLE ?auto_29918 ) ( TRUCK-AT ?auto_29913 ?auto_29915 ) ( LIFTING ?auto_29916 ?auto_29911 ) ( ON ?auto_29908 ?auto_29907 ) ( ON ?auto_29909 ?auto_29908 ) ( ON ?auto_29910 ?auto_29909 ) ( not ( = ?auto_29907 ?auto_29908 ) ) ( not ( = ?auto_29907 ?auto_29909 ) ) ( not ( = ?auto_29907 ?auto_29910 ) ) ( not ( = ?auto_29907 ?auto_29911 ) ) ( not ( = ?auto_29907 ?auto_29912 ) ) ( not ( = ?auto_29907 ?auto_29914 ) ) ( not ( = ?auto_29908 ?auto_29909 ) ) ( not ( = ?auto_29908 ?auto_29910 ) ) ( not ( = ?auto_29908 ?auto_29911 ) ) ( not ( = ?auto_29908 ?auto_29912 ) ) ( not ( = ?auto_29908 ?auto_29914 ) ) ( not ( = ?auto_29909 ?auto_29910 ) ) ( not ( = ?auto_29909 ?auto_29911 ) ) ( not ( = ?auto_29909 ?auto_29912 ) ) ( not ( = ?auto_29909 ?auto_29914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29910 ?auto_29911 ?auto_29912 )
      ( MAKE-5CRATE-VERIFY ?auto_29907 ?auto_29908 ?auto_29909 ?auto_29910 ?auto_29911 ?auto_29912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29919 - SURFACE
      ?auto_29920 - SURFACE
    )
    :vars
    (
      ?auto_29926 - HOIST
      ?auto_29925 - PLACE
      ?auto_29927 - SURFACE
      ?auto_29923 - PLACE
      ?auto_29924 - HOIST
      ?auto_29922 - SURFACE
      ?auto_29921 - TRUCK
      ?auto_29928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29926 ?auto_29925 ) ( IS-CRATE ?auto_29920 ) ( not ( = ?auto_29919 ?auto_29920 ) ) ( not ( = ?auto_29927 ?auto_29919 ) ) ( not ( = ?auto_29927 ?auto_29920 ) ) ( not ( = ?auto_29923 ?auto_29925 ) ) ( HOIST-AT ?auto_29924 ?auto_29923 ) ( not ( = ?auto_29926 ?auto_29924 ) ) ( SURFACE-AT ?auto_29920 ?auto_29923 ) ( ON ?auto_29920 ?auto_29922 ) ( CLEAR ?auto_29920 ) ( not ( = ?auto_29919 ?auto_29922 ) ) ( not ( = ?auto_29920 ?auto_29922 ) ) ( not ( = ?auto_29927 ?auto_29922 ) ) ( SURFACE-AT ?auto_29927 ?auto_29925 ) ( CLEAR ?auto_29927 ) ( IS-CRATE ?auto_29919 ) ( AVAILABLE ?auto_29926 ) ( TRUCK-AT ?auto_29921 ?auto_29923 ) ( AVAILABLE ?auto_29924 ) ( SURFACE-AT ?auto_29919 ?auto_29923 ) ( ON ?auto_29919 ?auto_29928 ) ( CLEAR ?auto_29919 ) ( not ( = ?auto_29919 ?auto_29928 ) ) ( not ( = ?auto_29920 ?auto_29928 ) ) ( not ( = ?auto_29927 ?auto_29928 ) ) ( not ( = ?auto_29922 ?auto_29928 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29924 ?auto_29919 ?auto_29928 ?auto_29923 )
      ( MAKE-2CRATE ?auto_29927 ?auto_29919 ?auto_29920 )
      ( MAKE-1CRATE-VERIFY ?auto_29919 ?auto_29920 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29929 - SURFACE
      ?auto_29930 - SURFACE
      ?auto_29931 - SURFACE
    )
    :vars
    (
      ?auto_29936 - HOIST
      ?auto_29933 - PLACE
      ?auto_29934 - PLACE
      ?auto_29935 - HOIST
      ?auto_29932 - SURFACE
      ?auto_29937 - TRUCK
      ?auto_29938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29936 ?auto_29933 ) ( IS-CRATE ?auto_29931 ) ( not ( = ?auto_29930 ?auto_29931 ) ) ( not ( = ?auto_29929 ?auto_29930 ) ) ( not ( = ?auto_29929 ?auto_29931 ) ) ( not ( = ?auto_29934 ?auto_29933 ) ) ( HOIST-AT ?auto_29935 ?auto_29934 ) ( not ( = ?auto_29936 ?auto_29935 ) ) ( SURFACE-AT ?auto_29931 ?auto_29934 ) ( ON ?auto_29931 ?auto_29932 ) ( CLEAR ?auto_29931 ) ( not ( = ?auto_29930 ?auto_29932 ) ) ( not ( = ?auto_29931 ?auto_29932 ) ) ( not ( = ?auto_29929 ?auto_29932 ) ) ( SURFACE-AT ?auto_29929 ?auto_29933 ) ( CLEAR ?auto_29929 ) ( IS-CRATE ?auto_29930 ) ( AVAILABLE ?auto_29936 ) ( TRUCK-AT ?auto_29937 ?auto_29934 ) ( AVAILABLE ?auto_29935 ) ( SURFACE-AT ?auto_29930 ?auto_29934 ) ( ON ?auto_29930 ?auto_29938 ) ( CLEAR ?auto_29930 ) ( not ( = ?auto_29930 ?auto_29938 ) ) ( not ( = ?auto_29931 ?auto_29938 ) ) ( not ( = ?auto_29929 ?auto_29938 ) ) ( not ( = ?auto_29932 ?auto_29938 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29930 ?auto_29931 )
      ( MAKE-2CRATE-VERIFY ?auto_29929 ?auto_29930 ?auto_29931 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29939 - SURFACE
      ?auto_29940 - SURFACE
      ?auto_29941 - SURFACE
      ?auto_29942 - SURFACE
    )
    :vars
    (
      ?auto_29944 - HOIST
      ?auto_29947 - PLACE
      ?auto_29943 - PLACE
      ?auto_29945 - HOIST
      ?auto_29946 - SURFACE
      ?auto_29948 - TRUCK
      ?auto_29949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29944 ?auto_29947 ) ( IS-CRATE ?auto_29942 ) ( not ( = ?auto_29941 ?auto_29942 ) ) ( not ( = ?auto_29940 ?auto_29941 ) ) ( not ( = ?auto_29940 ?auto_29942 ) ) ( not ( = ?auto_29943 ?auto_29947 ) ) ( HOIST-AT ?auto_29945 ?auto_29943 ) ( not ( = ?auto_29944 ?auto_29945 ) ) ( SURFACE-AT ?auto_29942 ?auto_29943 ) ( ON ?auto_29942 ?auto_29946 ) ( CLEAR ?auto_29942 ) ( not ( = ?auto_29941 ?auto_29946 ) ) ( not ( = ?auto_29942 ?auto_29946 ) ) ( not ( = ?auto_29940 ?auto_29946 ) ) ( SURFACE-AT ?auto_29940 ?auto_29947 ) ( CLEAR ?auto_29940 ) ( IS-CRATE ?auto_29941 ) ( AVAILABLE ?auto_29944 ) ( TRUCK-AT ?auto_29948 ?auto_29943 ) ( AVAILABLE ?auto_29945 ) ( SURFACE-AT ?auto_29941 ?auto_29943 ) ( ON ?auto_29941 ?auto_29949 ) ( CLEAR ?auto_29941 ) ( not ( = ?auto_29941 ?auto_29949 ) ) ( not ( = ?auto_29942 ?auto_29949 ) ) ( not ( = ?auto_29940 ?auto_29949 ) ) ( not ( = ?auto_29946 ?auto_29949 ) ) ( ON ?auto_29940 ?auto_29939 ) ( not ( = ?auto_29939 ?auto_29940 ) ) ( not ( = ?auto_29939 ?auto_29941 ) ) ( not ( = ?auto_29939 ?auto_29942 ) ) ( not ( = ?auto_29939 ?auto_29946 ) ) ( not ( = ?auto_29939 ?auto_29949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29940 ?auto_29941 ?auto_29942 )
      ( MAKE-3CRATE-VERIFY ?auto_29939 ?auto_29940 ?auto_29941 ?auto_29942 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29950 - SURFACE
      ?auto_29951 - SURFACE
      ?auto_29952 - SURFACE
      ?auto_29953 - SURFACE
      ?auto_29954 - SURFACE
    )
    :vars
    (
      ?auto_29956 - HOIST
      ?auto_29959 - PLACE
      ?auto_29955 - PLACE
      ?auto_29957 - HOIST
      ?auto_29958 - SURFACE
      ?auto_29960 - TRUCK
      ?auto_29961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29956 ?auto_29959 ) ( IS-CRATE ?auto_29954 ) ( not ( = ?auto_29953 ?auto_29954 ) ) ( not ( = ?auto_29952 ?auto_29953 ) ) ( not ( = ?auto_29952 ?auto_29954 ) ) ( not ( = ?auto_29955 ?auto_29959 ) ) ( HOIST-AT ?auto_29957 ?auto_29955 ) ( not ( = ?auto_29956 ?auto_29957 ) ) ( SURFACE-AT ?auto_29954 ?auto_29955 ) ( ON ?auto_29954 ?auto_29958 ) ( CLEAR ?auto_29954 ) ( not ( = ?auto_29953 ?auto_29958 ) ) ( not ( = ?auto_29954 ?auto_29958 ) ) ( not ( = ?auto_29952 ?auto_29958 ) ) ( SURFACE-AT ?auto_29952 ?auto_29959 ) ( CLEAR ?auto_29952 ) ( IS-CRATE ?auto_29953 ) ( AVAILABLE ?auto_29956 ) ( TRUCK-AT ?auto_29960 ?auto_29955 ) ( AVAILABLE ?auto_29957 ) ( SURFACE-AT ?auto_29953 ?auto_29955 ) ( ON ?auto_29953 ?auto_29961 ) ( CLEAR ?auto_29953 ) ( not ( = ?auto_29953 ?auto_29961 ) ) ( not ( = ?auto_29954 ?auto_29961 ) ) ( not ( = ?auto_29952 ?auto_29961 ) ) ( not ( = ?auto_29958 ?auto_29961 ) ) ( ON ?auto_29951 ?auto_29950 ) ( ON ?auto_29952 ?auto_29951 ) ( not ( = ?auto_29950 ?auto_29951 ) ) ( not ( = ?auto_29950 ?auto_29952 ) ) ( not ( = ?auto_29950 ?auto_29953 ) ) ( not ( = ?auto_29950 ?auto_29954 ) ) ( not ( = ?auto_29950 ?auto_29958 ) ) ( not ( = ?auto_29950 ?auto_29961 ) ) ( not ( = ?auto_29951 ?auto_29952 ) ) ( not ( = ?auto_29951 ?auto_29953 ) ) ( not ( = ?auto_29951 ?auto_29954 ) ) ( not ( = ?auto_29951 ?auto_29958 ) ) ( not ( = ?auto_29951 ?auto_29961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29952 ?auto_29953 ?auto_29954 )
      ( MAKE-4CRATE-VERIFY ?auto_29950 ?auto_29951 ?auto_29952 ?auto_29953 ?auto_29954 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29962 - SURFACE
      ?auto_29963 - SURFACE
      ?auto_29964 - SURFACE
      ?auto_29965 - SURFACE
      ?auto_29966 - SURFACE
      ?auto_29967 - SURFACE
    )
    :vars
    (
      ?auto_29969 - HOIST
      ?auto_29972 - PLACE
      ?auto_29968 - PLACE
      ?auto_29970 - HOIST
      ?auto_29971 - SURFACE
      ?auto_29973 - TRUCK
      ?auto_29974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29969 ?auto_29972 ) ( IS-CRATE ?auto_29967 ) ( not ( = ?auto_29966 ?auto_29967 ) ) ( not ( = ?auto_29965 ?auto_29966 ) ) ( not ( = ?auto_29965 ?auto_29967 ) ) ( not ( = ?auto_29968 ?auto_29972 ) ) ( HOIST-AT ?auto_29970 ?auto_29968 ) ( not ( = ?auto_29969 ?auto_29970 ) ) ( SURFACE-AT ?auto_29967 ?auto_29968 ) ( ON ?auto_29967 ?auto_29971 ) ( CLEAR ?auto_29967 ) ( not ( = ?auto_29966 ?auto_29971 ) ) ( not ( = ?auto_29967 ?auto_29971 ) ) ( not ( = ?auto_29965 ?auto_29971 ) ) ( SURFACE-AT ?auto_29965 ?auto_29972 ) ( CLEAR ?auto_29965 ) ( IS-CRATE ?auto_29966 ) ( AVAILABLE ?auto_29969 ) ( TRUCK-AT ?auto_29973 ?auto_29968 ) ( AVAILABLE ?auto_29970 ) ( SURFACE-AT ?auto_29966 ?auto_29968 ) ( ON ?auto_29966 ?auto_29974 ) ( CLEAR ?auto_29966 ) ( not ( = ?auto_29966 ?auto_29974 ) ) ( not ( = ?auto_29967 ?auto_29974 ) ) ( not ( = ?auto_29965 ?auto_29974 ) ) ( not ( = ?auto_29971 ?auto_29974 ) ) ( ON ?auto_29963 ?auto_29962 ) ( ON ?auto_29964 ?auto_29963 ) ( ON ?auto_29965 ?auto_29964 ) ( not ( = ?auto_29962 ?auto_29963 ) ) ( not ( = ?auto_29962 ?auto_29964 ) ) ( not ( = ?auto_29962 ?auto_29965 ) ) ( not ( = ?auto_29962 ?auto_29966 ) ) ( not ( = ?auto_29962 ?auto_29967 ) ) ( not ( = ?auto_29962 ?auto_29971 ) ) ( not ( = ?auto_29962 ?auto_29974 ) ) ( not ( = ?auto_29963 ?auto_29964 ) ) ( not ( = ?auto_29963 ?auto_29965 ) ) ( not ( = ?auto_29963 ?auto_29966 ) ) ( not ( = ?auto_29963 ?auto_29967 ) ) ( not ( = ?auto_29963 ?auto_29971 ) ) ( not ( = ?auto_29963 ?auto_29974 ) ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29964 ?auto_29966 ) ) ( not ( = ?auto_29964 ?auto_29967 ) ) ( not ( = ?auto_29964 ?auto_29971 ) ) ( not ( = ?auto_29964 ?auto_29974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29965 ?auto_29966 ?auto_29967 )
      ( MAKE-5CRATE-VERIFY ?auto_29962 ?auto_29963 ?auto_29964 ?auto_29965 ?auto_29966 ?auto_29967 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29975 - SURFACE
      ?auto_29976 - SURFACE
    )
    :vars
    (
      ?auto_29978 - HOIST
      ?auto_29982 - PLACE
      ?auto_29979 - SURFACE
      ?auto_29977 - PLACE
      ?auto_29980 - HOIST
      ?auto_29981 - SURFACE
      ?auto_29984 - SURFACE
      ?auto_29983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29978 ?auto_29982 ) ( IS-CRATE ?auto_29976 ) ( not ( = ?auto_29975 ?auto_29976 ) ) ( not ( = ?auto_29979 ?auto_29975 ) ) ( not ( = ?auto_29979 ?auto_29976 ) ) ( not ( = ?auto_29977 ?auto_29982 ) ) ( HOIST-AT ?auto_29980 ?auto_29977 ) ( not ( = ?auto_29978 ?auto_29980 ) ) ( SURFACE-AT ?auto_29976 ?auto_29977 ) ( ON ?auto_29976 ?auto_29981 ) ( CLEAR ?auto_29976 ) ( not ( = ?auto_29975 ?auto_29981 ) ) ( not ( = ?auto_29976 ?auto_29981 ) ) ( not ( = ?auto_29979 ?auto_29981 ) ) ( SURFACE-AT ?auto_29979 ?auto_29982 ) ( CLEAR ?auto_29979 ) ( IS-CRATE ?auto_29975 ) ( AVAILABLE ?auto_29978 ) ( AVAILABLE ?auto_29980 ) ( SURFACE-AT ?auto_29975 ?auto_29977 ) ( ON ?auto_29975 ?auto_29984 ) ( CLEAR ?auto_29975 ) ( not ( = ?auto_29975 ?auto_29984 ) ) ( not ( = ?auto_29976 ?auto_29984 ) ) ( not ( = ?auto_29979 ?auto_29984 ) ) ( not ( = ?auto_29981 ?auto_29984 ) ) ( TRUCK-AT ?auto_29983 ?auto_29982 ) )
    :subtasks
    ( ( !DRIVE ?auto_29983 ?auto_29982 ?auto_29977 )
      ( MAKE-2CRATE ?auto_29979 ?auto_29975 ?auto_29976 )
      ( MAKE-1CRATE-VERIFY ?auto_29975 ?auto_29976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29985 - SURFACE
      ?auto_29986 - SURFACE
      ?auto_29987 - SURFACE
    )
    :vars
    (
      ?auto_29988 - HOIST
      ?auto_29994 - PLACE
      ?auto_29990 - PLACE
      ?auto_29993 - HOIST
      ?auto_29989 - SURFACE
      ?auto_29991 - SURFACE
      ?auto_29992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29988 ?auto_29994 ) ( IS-CRATE ?auto_29987 ) ( not ( = ?auto_29986 ?auto_29987 ) ) ( not ( = ?auto_29985 ?auto_29986 ) ) ( not ( = ?auto_29985 ?auto_29987 ) ) ( not ( = ?auto_29990 ?auto_29994 ) ) ( HOIST-AT ?auto_29993 ?auto_29990 ) ( not ( = ?auto_29988 ?auto_29993 ) ) ( SURFACE-AT ?auto_29987 ?auto_29990 ) ( ON ?auto_29987 ?auto_29989 ) ( CLEAR ?auto_29987 ) ( not ( = ?auto_29986 ?auto_29989 ) ) ( not ( = ?auto_29987 ?auto_29989 ) ) ( not ( = ?auto_29985 ?auto_29989 ) ) ( SURFACE-AT ?auto_29985 ?auto_29994 ) ( CLEAR ?auto_29985 ) ( IS-CRATE ?auto_29986 ) ( AVAILABLE ?auto_29988 ) ( AVAILABLE ?auto_29993 ) ( SURFACE-AT ?auto_29986 ?auto_29990 ) ( ON ?auto_29986 ?auto_29991 ) ( CLEAR ?auto_29986 ) ( not ( = ?auto_29986 ?auto_29991 ) ) ( not ( = ?auto_29987 ?auto_29991 ) ) ( not ( = ?auto_29985 ?auto_29991 ) ) ( not ( = ?auto_29989 ?auto_29991 ) ) ( TRUCK-AT ?auto_29992 ?auto_29994 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29986 ?auto_29987 )
      ( MAKE-2CRATE-VERIFY ?auto_29985 ?auto_29986 ?auto_29987 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29995 - SURFACE
      ?auto_29996 - SURFACE
      ?auto_29997 - SURFACE
      ?auto_29998 - SURFACE
    )
    :vars
    (
      ?auto_30004 - HOIST
      ?auto_30005 - PLACE
      ?auto_30001 - PLACE
      ?auto_30002 - HOIST
      ?auto_29999 - SURFACE
      ?auto_30000 - SURFACE
      ?auto_30003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30004 ?auto_30005 ) ( IS-CRATE ?auto_29998 ) ( not ( = ?auto_29997 ?auto_29998 ) ) ( not ( = ?auto_29996 ?auto_29997 ) ) ( not ( = ?auto_29996 ?auto_29998 ) ) ( not ( = ?auto_30001 ?auto_30005 ) ) ( HOIST-AT ?auto_30002 ?auto_30001 ) ( not ( = ?auto_30004 ?auto_30002 ) ) ( SURFACE-AT ?auto_29998 ?auto_30001 ) ( ON ?auto_29998 ?auto_29999 ) ( CLEAR ?auto_29998 ) ( not ( = ?auto_29997 ?auto_29999 ) ) ( not ( = ?auto_29998 ?auto_29999 ) ) ( not ( = ?auto_29996 ?auto_29999 ) ) ( SURFACE-AT ?auto_29996 ?auto_30005 ) ( CLEAR ?auto_29996 ) ( IS-CRATE ?auto_29997 ) ( AVAILABLE ?auto_30004 ) ( AVAILABLE ?auto_30002 ) ( SURFACE-AT ?auto_29997 ?auto_30001 ) ( ON ?auto_29997 ?auto_30000 ) ( CLEAR ?auto_29997 ) ( not ( = ?auto_29997 ?auto_30000 ) ) ( not ( = ?auto_29998 ?auto_30000 ) ) ( not ( = ?auto_29996 ?auto_30000 ) ) ( not ( = ?auto_29999 ?auto_30000 ) ) ( TRUCK-AT ?auto_30003 ?auto_30005 ) ( ON ?auto_29996 ?auto_29995 ) ( not ( = ?auto_29995 ?auto_29996 ) ) ( not ( = ?auto_29995 ?auto_29997 ) ) ( not ( = ?auto_29995 ?auto_29998 ) ) ( not ( = ?auto_29995 ?auto_29999 ) ) ( not ( = ?auto_29995 ?auto_30000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29996 ?auto_29997 ?auto_29998 )
      ( MAKE-3CRATE-VERIFY ?auto_29995 ?auto_29996 ?auto_29997 ?auto_29998 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30006 - SURFACE
      ?auto_30007 - SURFACE
      ?auto_30008 - SURFACE
      ?auto_30009 - SURFACE
      ?auto_30010 - SURFACE
    )
    :vars
    (
      ?auto_30016 - HOIST
      ?auto_30017 - PLACE
      ?auto_30013 - PLACE
      ?auto_30014 - HOIST
      ?auto_30011 - SURFACE
      ?auto_30012 - SURFACE
      ?auto_30015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30016 ?auto_30017 ) ( IS-CRATE ?auto_30010 ) ( not ( = ?auto_30009 ?auto_30010 ) ) ( not ( = ?auto_30008 ?auto_30009 ) ) ( not ( = ?auto_30008 ?auto_30010 ) ) ( not ( = ?auto_30013 ?auto_30017 ) ) ( HOIST-AT ?auto_30014 ?auto_30013 ) ( not ( = ?auto_30016 ?auto_30014 ) ) ( SURFACE-AT ?auto_30010 ?auto_30013 ) ( ON ?auto_30010 ?auto_30011 ) ( CLEAR ?auto_30010 ) ( not ( = ?auto_30009 ?auto_30011 ) ) ( not ( = ?auto_30010 ?auto_30011 ) ) ( not ( = ?auto_30008 ?auto_30011 ) ) ( SURFACE-AT ?auto_30008 ?auto_30017 ) ( CLEAR ?auto_30008 ) ( IS-CRATE ?auto_30009 ) ( AVAILABLE ?auto_30016 ) ( AVAILABLE ?auto_30014 ) ( SURFACE-AT ?auto_30009 ?auto_30013 ) ( ON ?auto_30009 ?auto_30012 ) ( CLEAR ?auto_30009 ) ( not ( = ?auto_30009 ?auto_30012 ) ) ( not ( = ?auto_30010 ?auto_30012 ) ) ( not ( = ?auto_30008 ?auto_30012 ) ) ( not ( = ?auto_30011 ?auto_30012 ) ) ( TRUCK-AT ?auto_30015 ?auto_30017 ) ( ON ?auto_30007 ?auto_30006 ) ( ON ?auto_30008 ?auto_30007 ) ( not ( = ?auto_30006 ?auto_30007 ) ) ( not ( = ?auto_30006 ?auto_30008 ) ) ( not ( = ?auto_30006 ?auto_30009 ) ) ( not ( = ?auto_30006 ?auto_30010 ) ) ( not ( = ?auto_30006 ?auto_30011 ) ) ( not ( = ?auto_30006 ?auto_30012 ) ) ( not ( = ?auto_30007 ?auto_30008 ) ) ( not ( = ?auto_30007 ?auto_30009 ) ) ( not ( = ?auto_30007 ?auto_30010 ) ) ( not ( = ?auto_30007 ?auto_30011 ) ) ( not ( = ?auto_30007 ?auto_30012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30008 ?auto_30009 ?auto_30010 )
      ( MAKE-4CRATE-VERIFY ?auto_30006 ?auto_30007 ?auto_30008 ?auto_30009 ?auto_30010 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30018 - SURFACE
      ?auto_30019 - SURFACE
      ?auto_30020 - SURFACE
      ?auto_30021 - SURFACE
      ?auto_30022 - SURFACE
      ?auto_30023 - SURFACE
    )
    :vars
    (
      ?auto_30029 - HOIST
      ?auto_30030 - PLACE
      ?auto_30026 - PLACE
      ?auto_30027 - HOIST
      ?auto_30024 - SURFACE
      ?auto_30025 - SURFACE
      ?auto_30028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30029 ?auto_30030 ) ( IS-CRATE ?auto_30023 ) ( not ( = ?auto_30022 ?auto_30023 ) ) ( not ( = ?auto_30021 ?auto_30022 ) ) ( not ( = ?auto_30021 ?auto_30023 ) ) ( not ( = ?auto_30026 ?auto_30030 ) ) ( HOIST-AT ?auto_30027 ?auto_30026 ) ( not ( = ?auto_30029 ?auto_30027 ) ) ( SURFACE-AT ?auto_30023 ?auto_30026 ) ( ON ?auto_30023 ?auto_30024 ) ( CLEAR ?auto_30023 ) ( not ( = ?auto_30022 ?auto_30024 ) ) ( not ( = ?auto_30023 ?auto_30024 ) ) ( not ( = ?auto_30021 ?auto_30024 ) ) ( SURFACE-AT ?auto_30021 ?auto_30030 ) ( CLEAR ?auto_30021 ) ( IS-CRATE ?auto_30022 ) ( AVAILABLE ?auto_30029 ) ( AVAILABLE ?auto_30027 ) ( SURFACE-AT ?auto_30022 ?auto_30026 ) ( ON ?auto_30022 ?auto_30025 ) ( CLEAR ?auto_30022 ) ( not ( = ?auto_30022 ?auto_30025 ) ) ( not ( = ?auto_30023 ?auto_30025 ) ) ( not ( = ?auto_30021 ?auto_30025 ) ) ( not ( = ?auto_30024 ?auto_30025 ) ) ( TRUCK-AT ?auto_30028 ?auto_30030 ) ( ON ?auto_30019 ?auto_30018 ) ( ON ?auto_30020 ?auto_30019 ) ( ON ?auto_30021 ?auto_30020 ) ( not ( = ?auto_30018 ?auto_30019 ) ) ( not ( = ?auto_30018 ?auto_30020 ) ) ( not ( = ?auto_30018 ?auto_30021 ) ) ( not ( = ?auto_30018 ?auto_30022 ) ) ( not ( = ?auto_30018 ?auto_30023 ) ) ( not ( = ?auto_30018 ?auto_30024 ) ) ( not ( = ?auto_30018 ?auto_30025 ) ) ( not ( = ?auto_30019 ?auto_30020 ) ) ( not ( = ?auto_30019 ?auto_30021 ) ) ( not ( = ?auto_30019 ?auto_30022 ) ) ( not ( = ?auto_30019 ?auto_30023 ) ) ( not ( = ?auto_30019 ?auto_30024 ) ) ( not ( = ?auto_30019 ?auto_30025 ) ) ( not ( = ?auto_30020 ?auto_30021 ) ) ( not ( = ?auto_30020 ?auto_30022 ) ) ( not ( = ?auto_30020 ?auto_30023 ) ) ( not ( = ?auto_30020 ?auto_30024 ) ) ( not ( = ?auto_30020 ?auto_30025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30021 ?auto_30022 ?auto_30023 )
      ( MAKE-5CRATE-VERIFY ?auto_30018 ?auto_30019 ?auto_30020 ?auto_30021 ?auto_30022 ?auto_30023 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_30031 - SURFACE
      ?auto_30032 - SURFACE
    )
    :vars
    (
      ?auto_30039 - HOIST
      ?auto_30040 - PLACE
      ?auto_30038 - SURFACE
      ?auto_30035 - PLACE
      ?auto_30036 - HOIST
      ?auto_30033 - SURFACE
      ?auto_30034 - SURFACE
      ?auto_30037 - TRUCK
      ?auto_30041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30039 ?auto_30040 ) ( IS-CRATE ?auto_30032 ) ( not ( = ?auto_30031 ?auto_30032 ) ) ( not ( = ?auto_30038 ?auto_30031 ) ) ( not ( = ?auto_30038 ?auto_30032 ) ) ( not ( = ?auto_30035 ?auto_30040 ) ) ( HOIST-AT ?auto_30036 ?auto_30035 ) ( not ( = ?auto_30039 ?auto_30036 ) ) ( SURFACE-AT ?auto_30032 ?auto_30035 ) ( ON ?auto_30032 ?auto_30033 ) ( CLEAR ?auto_30032 ) ( not ( = ?auto_30031 ?auto_30033 ) ) ( not ( = ?auto_30032 ?auto_30033 ) ) ( not ( = ?auto_30038 ?auto_30033 ) ) ( IS-CRATE ?auto_30031 ) ( AVAILABLE ?auto_30036 ) ( SURFACE-AT ?auto_30031 ?auto_30035 ) ( ON ?auto_30031 ?auto_30034 ) ( CLEAR ?auto_30031 ) ( not ( = ?auto_30031 ?auto_30034 ) ) ( not ( = ?auto_30032 ?auto_30034 ) ) ( not ( = ?auto_30038 ?auto_30034 ) ) ( not ( = ?auto_30033 ?auto_30034 ) ) ( TRUCK-AT ?auto_30037 ?auto_30040 ) ( SURFACE-AT ?auto_30041 ?auto_30040 ) ( CLEAR ?auto_30041 ) ( LIFTING ?auto_30039 ?auto_30038 ) ( IS-CRATE ?auto_30038 ) ( not ( = ?auto_30041 ?auto_30038 ) ) ( not ( = ?auto_30031 ?auto_30041 ) ) ( not ( = ?auto_30032 ?auto_30041 ) ) ( not ( = ?auto_30033 ?auto_30041 ) ) ( not ( = ?auto_30034 ?auto_30041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30041 ?auto_30038 )
      ( MAKE-2CRATE ?auto_30038 ?auto_30031 ?auto_30032 )
      ( MAKE-1CRATE-VERIFY ?auto_30031 ?auto_30032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_30042 - SURFACE
      ?auto_30043 - SURFACE
      ?auto_30044 - SURFACE
    )
    :vars
    (
      ?auto_30048 - HOIST
      ?auto_30045 - PLACE
      ?auto_30047 - PLACE
      ?auto_30050 - HOIST
      ?auto_30051 - SURFACE
      ?auto_30052 - SURFACE
      ?auto_30049 - TRUCK
      ?auto_30046 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30048 ?auto_30045 ) ( IS-CRATE ?auto_30044 ) ( not ( = ?auto_30043 ?auto_30044 ) ) ( not ( = ?auto_30042 ?auto_30043 ) ) ( not ( = ?auto_30042 ?auto_30044 ) ) ( not ( = ?auto_30047 ?auto_30045 ) ) ( HOIST-AT ?auto_30050 ?auto_30047 ) ( not ( = ?auto_30048 ?auto_30050 ) ) ( SURFACE-AT ?auto_30044 ?auto_30047 ) ( ON ?auto_30044 ?auto_30051 ) ( CLEAR ?auto_30044 ) ( not ( = ?auto_30043 ?auto_30051 ) ) ( not ( = ?auto_30044 ?auto_30051 ) ) ( not ( = ?auto_30042 ?auto_30051 ) ) ( IS-CRATE ?auto_30043 ) ( AVAILABLE ?auto_30050 ) ( SURFACE-AT ?auto_30043 ?auto_30047 ) ( ON ?auto_30043 ?auto_30052 ) ( CLEAR ?auto_30043 ) ( not ( = ?auto_30043 ?auto_30052 ) ) ( not ( = ?auto_30044 ?auto_30052 ) ) ( not ( = ?auto_30042 ?auto_30052 ) ) ( not ( = ?auto_30051 ?auto_30052 ) ) ( TRUCK-AT ?auto_30049 ?auto_30045 ) ( SURFACE-AT ?auto_30046 ?auto_30045 ) ( CLEAR ?auto_30046 ) ( LIFTING ?auto_30048 ?auto_30042 ) ( IS-CRATE ?auto_30042 ) ( not ( = ?auto_30046 ?auto_30042 ) ) ( not ( = ?auto_30043 ?auto_30046 ) ) ( not ( = ?auto_30044 ?auto_30046 ) ) ( not ( = ?auto_30051 ?auto_30046 ) ) ( not ( = ?auto_30052 ?auto_30046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30043 ?auto_30044 )
      ( MAKE-2CRATE-VERIFY ?auto_30042 ?auto_30043 ?auto_30044 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_30053 - SURFACE
      ?auto_30054 - SURFACE
      ?auto_30055 - SURFACE
      ?auto_30056 - SURFACE
    )
    :vars
    (
      ?auto_30061 - HOIST
      ?auto_30062 - PLACE
      ?auto_30060 - PLACE
      ?auto_30063 - HOIST
      ?auto_30057 - SURFACE
      ?auto_30058 - SURFACE
      ?auto_30059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30061 ?auto_30062 ) ( IS-CRATE ?auto_30056 ) ( not ( = ?auto_30055 ?auto_30056 ) ) ( not ( = ?auto_30054 ?auto_30055 ) ) ( not ( = ?auto_30054 ?auto_30056 ) ) ( not ( = ?auto_30060 ?auto_30062 ) ) ( HOIST-AT ?auto_30063 ?auto_30060 ) ( not ( = ?auto_30061 ?auto_30063 ) ) ( SURFACE-AT ?auto_30056 ?auto_30060 ) ( ON ?auto_30056 ?auto_30057 ) ( CLEAR ?auto_30056 ) ( not ( = ?auto_30055 ?auto_30057 ) ) ( not ( = ?auto_30056 ?auto_30057 ) ) ( not ( = ?auto_30054 ?auto_30057 ) ) ( IS-CRATE ?auto_30055 ) ( AVAILABLE ?auto_30063 ) ( SURFACE-AT ?auto_30055 ?auto_30060 ) ( ON ?auto_30055 ?auto_30058 ) ( CLEAR ?auto_30055 ) ( not ( = ?auto_30055 ?auto_30058 ) ) ( not ( = ?auto_30056 ?auto_30058 ) ) ( not ( = ?auto_30054 ?auto_30058 ) ) ( not ( = ?auto_30057 ?auto_30058 ) ) ( TRUCK-AT ?auto_30059 ?auto_30062 ) ( SURFACE-AT ?auto_30053 ?auto_30062 ) ( CLEAR ?auto_30053 ) ( LIFTING ?auto_30061 ?auto_30054 ) ( IS-CRATE ?auto_30054 ) ( not ( = ?auto_30053 ?auto_30054 ) ) ( not ( = ?auto_30055 ?auto_30053 ) ) ( not ( = ?auto_30056 ?auto_30053 ) ) ( not ( = ?auto_30057 ?auto_30053 ) ) ( not ( = ?auto_30058 ?auto_30053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30054 ?auto_30055 ?auto_30056 )
      ( MAKE-3CRATE-VERIFY ?auto_30053 ?auto_30054 ?auto_30055 ?auto_30056 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_30064 - SURFACE
      ?auto_30065 - SURFACE
      ?auto_30066 - SURFACE
      ?auto_30067 - SURFACE
      ?auto_30068 - SURFACE
    )
    :vars
    (
      ?auto_30073 - HOIST
      ?auto_30074 - PLACE
      ?auto_30072 - PLACE
      ?auto_30075 - HOIST
      ?auto_30069 - SURFACE
      ?auto_30070 - SURFACE
      ?auto_30071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30073 ?auto_30074 ) ( IS-CRATE ?auto_30068 ) ( not ( = ?auto_30067 ?auto_30068 ) ) ( not ( = ?auto_30066 ?auto_30067 ) ) ( not ( = ?auto_30066 ?auto_30068 ) ) ( not ( = ?auto_30072 ?auto_30074 ) ) ( HOIST-AT ?auto_30075 ?auto_30072 ) ( not ( = ?auto_30073 ?auto_30075 ) ) ( SURFACE-AT ?auto_30068 ?auto_30072 ) ( ON ?auto_30068 ?auto_30069 ) ( CLEAR ?auto_30068 ) ( not ( = ?auto_30067 ?auto_30069 ) ) ( not ( = ?auto_30068 ?auto_30069 ) ) ( not ( = ?auto_30066 ?auto_30069 ) ) ( IS-CRATE ?auto_30067 ) ( AVAILABLE ?auto_30075 ) ( SURFACE-AT ?auto_30067 ?auto_30072 ) ( ON ?auto_30067 ?auto_30070 ) ( CLEAR ?auto_30067 ) ( not ( = ?auto_30067 ?auto_30070 ) ) ( not ( = ?auto_30068 ?auto_30070 ) ) ( not ( = ?auto_30066 ?auto_30070 ) ) ( not ( = ?auto_30069 ?auto_30070 ) ) ( TRUCK-AT ?auto_30071 ?auto_30074 ) ( SURFACE-AT ?auto_30065 ?auto_30074 ) ( CLEAR ?auto_30065 ) ( LIFTING ?auto_30073 ?auto_30066 ) ( IS-CRATE ?auto_30066 ) ( not ( = ?auto_30065 ?auto_30066 ) ) ( not ( = ?auto_30067 ?auto_30065 ) ) ( not ( = ?auto_30068 ?auto_30065 ) ) ( not ( = ?auto_30069 ?auto_30065 ) ) ( not ( = ?auto_30070 ?auto_30065 ) ) ( ON ?auto_30065 ?auto_30064 ) ( not ( = ?auto_30064 ?auto_30065 ) ) ( not ( = ?auto_30064 ?auto_30066 ) ) ( not ( = ?auto_30064 ?auto_30067 ) ) ( not ( = ?auto_30064 ?auto_30068 ) ) ( not ( = ?auto_30064 ?auto_30069 ) ) ( not ( = ?auto_30064 ?auto_30070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30066 ?auto_30067 ?auto_30068 )
      ( MAKE-4CRATE-VERIFY ?auto_30064 ?auto_30065 ?auto_30066 ?auto_30067 ?auto_30068 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_30076 - SURFACE
      ?auto_30077 - SURFACE
      ?auto_30078 - SURFACE
      ?auto_30079 - SURFACE
      ?auto_30080 - SURFACE
      ?auto_30081 - SURFACE
    )
    :vars
    (
      ?auto_30086 - HOIST
      ?auto_30087 - PLACE
      ?auto_30085 - PLACE
      ?auto_30088 - HOIST
      ?auto_30082 - SURFACE
      ?auto_30083 - SURFACE
      ?auto_30084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30086 ?auto_30087 ) ( IS-CRATE ?auto_30081 ) ( not ( = ?auto_30080 ?auto_30081 ) ) ( not ( = ?auto_30079 ?auto_30080 ) ) ( not ( = ?auto_30079 ?auto_30081 ) ) ( not ( = ?auto_30085 ?auto_30087 ) ) ( HOIST-AT ?auto_30088 ?auto_30085 ) ( not ( = ?auto_30086 ?auto_30088 ) ) ( SURFACE-AT ?auto_30081 ?auto_30085 ) ( ON ?auto_30081 ?auto_30082 ) ( CLEAR ?auto_30081 ) ( not ( = ?auto_30080 ?auto_30082 ) ) ( not ( = ?auto_30081 ?auto_30082 ) ) ( not ( = ?auto_30079 ?auto_30082 ) ) ( IS-CRATE ?auto_30080 ) ( AVAILABLE ?auto_30088 ) ( SURFACE-AT ?auto_30080 ?auto_30085 ) ( ON ?auto_30080 ?auto_30083 ) ( CLEAR ?auto_30080 ) ( not ( = ?auto_30080 ?auto_30083 ) ) ( not ( = ?auto_30081 ?auto_30083 ) ) ( not ( = ?auto_30079 ?auto_30083 ) ) ( not ( = ?auto_30082 ?auto_30083 ) ) ( TRUCK-AT ?auto_30084 ?auto_30087 ) ( SURFACE-AT ?auto_30078 ?auto_30087 ) ( CLEAR ?auto_30078 ) ( LIFTING ?auto_30086 ?auto_30079 ) ( IS-CRATE ?auto_30079 ) ( not ( = ?auto_30078 ?auto_30079 ) ) ( not ( = ?auto_30080 ?auto_30078 ) ) ( not ( = ?auto_30081 ?auto_30078 ) ) ( not ( = ?auto_30082 ?auto_30078 ) ) ( not ( = ?auto_30083 ?auto_30078 ) ) ( ON ?auto_30077 ?auto_30076 ) ( ON ?auto_30078 ?auto_30077 ) ( not ( = ?auto_30076 ?auto_30077 ) ) ( not ( = ?auto_30076 ?auto_30078 ) ) ( not ( = ?auto_30076 ?auto_30079 ) ) ( not ( = ?auto_30076 ?auto_30080 ) ) ( not ( = ?auto_30076 ?auto_30081 ) ) ( not ( = ?auto_30076 ?auto_30082 ) ) ( not ( = ?auto_30076 ?auto_30083 ) ) ( not ( = ?auto_30077 ?auto_30078 ) ) ( not ( = ?auto_30077 ?auto_30079 ) ) ( not ( = ?auto_30077 ?auto_30080 ) ) ( not ( = ?auto_30077 ?auto_30081 ) ) ( not ( = ?auto_30077 ?auto_30082 ) ) ( not ( = ?auto_30077 ?auto_30083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30079 ?auto_30080 ?auto_30081 )
      ( MAKE-5CRATE-VERIFY ?auto_30076 ?auto_30077 ?auto_30078 ?auto_30079 ?auto_30080 ?auto_30081 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_30977 - SURFACE
      ?auto_30978 - SURFACE
      ?auto_30979 - SURFACE
      ?auto_30980 - SURFACE
      ?auto_30981 - SURFACE
      ?auto_30982 - SURFACE
      ?auto_30983 - SURFACE
    )
    :vars
    (
      ?auto_30985 - HOIST
      ?auto_30984 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30985 ?auto_30984 ) ( SURFACE-AT ?auto_30982 ?auto_30984 ) ( CLEAR ?auto_30982 ) ( LIFTING ?auto_30985 ?auto_30983 ) ( IS-CRATE ?auto_30983 ) ( not ( = ?auto_30982 ?auto_30983 ) ) ( ON ?auto_30978 ?auto_30977 ) ( ON ?auto_30979 ?auto_30978 ) ( ON ?auto_30980 ?auto_30979 ) ( ON ?auto_30981 ?auto_30980 ) ( ON ?auto_30982 ?auto_30981 ) ( not ( = ?auto_30977 ?auto_30978 ) ) ( not ( = ?auto_30977 ?auto_30979 ) ) ( not ( = ?auto_30977 ?auto_30980 ) ) ( not ( = ?auto_30977 ?auto_30981 ) ) ( not ( = ?auto_30977 ?auto_30982 ) ) ( not ( = ?auto_30977 ?auto_30983 ) ) ( not ( = ?auto_30978 ?auto_30979 ) ) ( not ( = ?auto_30978 ?auto_30980 ) ) ( not ( = ?auto_30978 ?auto_30981 ) ) ( not ( = ?auto_30978 ?auto_30982 ) ) ( not ( = ?auto_30978 ?auto_30983 ) ) ( not ( = ?auto_30979 ?auto_30980 ) ) ( not ( = ?auto_30979 ?auto_30981 ) ) ( not ( = ?auto_30979 ?auto_30982 ) ) ( not ( = ?auto_30979 ?auto_30983 ) ) ( not ( = ?auto_30980 ?auto_30981 ) ) ( not ( = ?auto_30980 ?auto_30982 ) ) ( not ( = ?auto_30980 ?auto_30983 ) ) ( not ( = ?auto_30981 ?auto_30982 ) ) ( not ( = ?auto_30981 ?auto_30983 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30982 ?auto_30983 )
      ( MAKE-6CRATE-VERIFY ?auto_30977 ?auto_30978 ?auto_30979 ?auto_30980 ?auto_30981 ?auto_30982 ?auto_30983 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31021 - SURFACE
      ?auto_31022 - SURFACE
      ?auto_31023 - SURFACE
      ?auto_31024 - SURFACE
      ?auto_31025 - SURFACE
      ?auto_31026 - SURFACE
      ?auto_31027 - SURFACE
    )
    :vars
    (
      ?auto_31029 - HOIST
      ?auto_31028 - PLACE
      ?auto_31030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31029 ?auto_31028 ) ( SURFACE-AT ?auto_31026 ?auto_31028 ) ( CLEAR ?auto_31026 ) ( IS-CRATE ?auto_31027 ) ( not ( = ?auto_31026 ?auto_31027 ) ) ( TRUCK-AT ?auto_31030 ?auto_31028 ) ( AVAILABLE ?auto_31029 ) ( IN ?auto_31027 ?auto_31030 ) ( ON ?auto_31026 ?auto_31025 ) ( not ( = ?auto_31025 ?auto_31026 ) ) ( not ( = ?auto_31025 ?auto_31027 ) ) ( ON ?auto_31022 ?auto_31021 ) ( ON ?auto_31023 ?auto_31022 ) ( ON ?auto_31024 ?auto_31023 ) ( ON ?auto_31025 ?auto_31024 ) ( not ( = ?auto_31021 ?auto_31022 ) ) ( not ( = ?auto_31021 ?auto_31023 ) ) ( not ( = ?auto_31021 ?auto_31024 ) ) ( not ( = ?auto_31021 ?auto_31025 ) ) ( not ( = ?auto_31021 ?auto_31026 ) ) ( not ( = ?auto_31021 ?auto_31027 ) ) ( not ( = ?auto_31022 ?auto_31023 ) ) ( not ( = ?auto_31022 ?auto_31024 ) ) ( not ( = ?auto_31022 ?auto_31025 ) ) ( not ( = ?auto_31022 ?auto_31026 ) ) ( not ( = ?auto_31022 ?auto_31027 ) ) ( not ( = ?auto_31023 ?auto_31024 ) ) ( not ( = ?auto_31023 ?auto_31025 ) ) ( not ( = ?auto_31023 ?auto_31026 ) ) ( not ( = ?auto_31023 ?auto_31027 ) ) ( not ( = ?auto_31024 ?auto_31025 ) ) ( not ( = ?auto_31024 ?auto_31026 ) ) ( not ( = ?auto_31024 ?auto_31027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31025 ?auto_31026 ?auto_31027 )
      ( MAKE-6CRATE-VERIFY ?auto_31021 ?auto_31022 ?auto_31023 ?auto_31024 ?auto_31025 ?auto_31026 ?auto_31027 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31072 - SURFACE
      ?auto_31073 - SURFACE
      ?auto_31074 - SURFACE
      ?auto_31075 - SURFACE
      ?auto_31076 - SURFACE
      ?auto_31077 - SURFACE
      ?auto_31078 - SURFACE
    )
    :vars
    (
      ?auto_31080 - HOIST
      ?auto_31082 - PLACE
      ?auto_31079 - TRUCK
      ?auto_31081 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31080 ?auto_31082 ) ( SURFACE-AT ?auto_31077 ?auto_31082 ) ( CLEAR ?auto_31077 ) ( IS-CRATE ?auto_31078 ) ( not ( = ?auto_31077 ?auto_31078 ) ) ( AVAILABLE ?auto_31080 ) ( IN ?auto_31078 ?auto_31079 ) ( ON ?auto_31077 ?auto_31076 ) ( not ( = ?auto_31076 ?auto_31077 ) ) ( not ( = ?auto_31076 ?auto_31078 ) ) ( TRUCK-AT ?auto_31079 ?auto_31081 ) ( not ( = ?auto_31081 ?auto_31082 ) ) ( ON ?auto_31073 ?auto_31072 ) ( ON ?auto_31074 ?auto_31073 ) ( ON ?auto_31075 ?auto_31074 ) ( ON ?auto_31076 ?auto_31075 ) ( not ( = ?auto_31072 ?auto_31073 ) ) ( not ( = ?auto_31072 ?auto_31074 ) ) ( not ( = ?auto_31072 ?auto_31075 ) ) ( not ( = ?auto_31072 ?auto_31076 ) ) ( not ( = ?auto_31072 ?auto_31077 ) ) ( not ( = ?auto_31072 ?auto_31078 ) ) ( not ( = ?auto_31073 ?auto_31074 ) ) ( not ( = ?auto_31073 ?auto_31075 ) ) ( not ( = ?auto_31073 ?auto_31076 ) ) ( not ( = ?auto_31073 ?auto_31077 ) ) ( not ( = ?auto_31073 ?auto_31078 ) ) ( not ( = ?auto_31074 ?auto_31075 ) ) ( not ( = ?auto_31074 ?auto_31076 ) ) ( not ( = ?auto_31074 ?auto_31077 ) ) ( not ( = ?auto_31074 ?auto_31078 ) ) ( not ( = ?auto_31075 ?auto_31076 ) ) ( not ( = ?auto_31075 ?auto_31077 ) ) ( not ( = ?auto_31075 ?auto_31078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31076 ?auto_31077 ?auto_31078 )
      ( MAKE-6CRATE-VERIFY ?auto_31072 ?auto_31073 ?auto_31074 ?auto_31075 ?auto_31076 ?auto_31077 ?auto_31078 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31129 - SURFACE
      ?auto_31130 - SURFACE
      ?auto_31131 - SURFACE
      ?auto_31132 - SURFACE
      ?auto_31133 - SURFACE
      ?auto_31134 - SURFACE
      ?auto_31135 - SURFACE
    )
    :vars
    (
      ?auto_31137 - HOIST
      ?auto_31140 - PLACE
      ?auto_31139 - TRUCK
      ?auto_31136 - PLACE
      ?auto_31138 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31137 ?auto_31140 ) ( SURFACE-AT ?auto_31134 ?auto_31140 ) ( CLEAR ?auto_31134 ) ( IS-CRATE ?auto_31135 ) ( not ( = ?auto_31134 ?auto_31135 ) ) ( AVAILABLE ?auto_31137 ) ( ON ?auto_31134 ?auto_31133 ) ( not ( = ?auto_31133 ?auto_31134 ) ) ( not ( = ?auto_31133 ?auto_31135 ) ) ( TRUCK-AT ?auto_31139 ?auto_31136 ) ( not ( = ?auto_31136 ?auto_31140 ) ) ( HOIST-AT ?auto_31138 ?auto_31136 ) ( LIFTING ?auto_31138 ?auto_31135 ) ( not ( = ?auto_31137 ?auto_31138 ) ) ( ON ?auto_31130 ?auto_31129 ) ( ON ?auto_31131 ?auto_31130 ) ( ON ?auto_31132 ?auto_31131 ) ( ON ?auto_31133 ?auto_31132 ) ( not ( = ?auto_31129 ?auto_31130 ) ) ( not ( = ?auto_31129 ?auto_31131 ) ) ( not ( = ?auto_31129 ?auto_31132 ) ) ( not ( = ?auto_31129 ?auto_31133 ) ) ( not ( = ?auto_31129 ?auto_31134 ) ) ( not ( = ?auto_31129 ?auto_31135 ) ) ( not ( = ?auto_31130 ?auto_31131 ) ) ( not ( = ?auto_31130 ?auto_31132 ) ) ( not ( = ?auto_31130 ?auto_31133 ) ) ( not ( = ?auto_31130 ?auto_31134 ) ) ( not ( = ?auto_31130 ?auto_31135 ) ) ( not ( = ?auto_31131 ?auto_31132 ) ) ( not ( = ?auto_31131 ?auto_31133 ) ) ( not ( = ?auto_31131 ?auto_31134 ) ) ( not ( = ?auto_31131 ?auto_31135 ) ) ( not ( = ?auto_31132 ?auto_31133 ) ) ( not ( = ?auto_31132 ?auto_31134 ) ) ( not ( = ?auto_31132 ?auto_31135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31133 ?auto_31134 ?auto_31135 )
      ( MAKE-6CRATE-VERIFY ?auto_31129 ?auto_31130 ?auto_31131 ?auto_31132 ?auto_31133 ?auto_31134 ?auto_31135 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31192 - SURFACE
      ?auto_31193 - SURFACE
      ?auto_31194 - SURFACE
      ?auto_31195 - SURFACE
      ?auto_31196 - SURFACE
      ?auto_31197 - SURFACE
      ?auto_31198 - SURFACE
    )
    :vars
    (
      ?auto_31203 - HOIST
      ?auto_31200 - PLACE
      ?auto_31201 - TRUCK
      ?auto_31199 - PLACE
      ?auto_31204 - HOIST
      ?auto_31202 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31203 ?auto_31200 ) ( SURFACE-AT ?auto_31197 ?auto_31200 ) ( CLEAR ?auto_31197 ) ( IS-CRATE ?auto_31198 ) ( not ( = ?auto_31197 ?auto_31198 ) ) ( AVAILABLE ?auto_31203 ) ( ON ?auto_31197 ?auto_31196 ) ( not ( = ?auto_31196 ?auto_31197 ) ) ( not ( = ?auto_31196 ?auto_31198 ) ) ( TRUCK-AT ?auto_31201 ?auto_31199 ) ( not ( = ?auto_31199 ?auto_31200 ) ) ( HOIST-AT ?auto_31204 ?auto_31199 ) ( not ( = ?auto_31203 ?auto_31204 ) ) ( AVAILABLE ?auto_31204 ) ( SURFACE-AT ?auto_31198 ?auto_31199 ) ( ON ?auto_31198 ?auto_31202 ) ( CLEAR ?auto_31198 ) ( not ( = ?auto_31197 ?auto_31202 ) ) ( not ( = ?auto_31198 ?auto_31202 ) ) ( not ( = ?auto_31196 ?auto_31202 ) ) ( ON ?auto_31193 ?auto_31192 ) ( ON ?auto_31194 ?auto_31193 ) ( ON ?auto_31195 ?auto_31194 ) ( ON ?auto_31196 ?auto_31195 ) ( not ( = ?auto_31192 ?auto_31193 ) ) ( not ( = ?auto_31192 ?auto_31194 ) ) ( not ( = ?auto_31192 ?auto_31195 ) ) ( not ( = ?auto_31192 ?auto_31196 ) ) ( not ( = ?auto_31192 ?auto_31197 ) ) ( not ( = ?auto_31192 ?auto_31198 ) ) ( not ( = ?auto_31192 ?auto_31202 ) ) ( not ( = ?auto_31193 ?auto_31194 ) ) ( not ( = ?auto_31193 ?auto_31195 ) ) ( not ( = ?auto_31193 ?auto_31196 ) ) ( not ( = ?auto_31193 ?auto_31197 ) ) ( not ( = ?auto_31193 ?auto_31198 ) ) ( not ( = ?auto_31193 ?auto_31202 ) ) ( not ( = ?auto_31194 ?auto_31195 ) ) ( not ( = ?auto_31194 ?auto_31196 ) ) ( not ( = ?auto_31194 ?auto_31197 ) ) ( not ( = ?auto_31194 ?auto_31198 ) ) ( not ( = ?auto_31194 ?auto_31202 ) ) ( not ( = ?auto_31195 ?auto_31196 ) ) ( not ( = ?auto_31195 ?auto_31197 ) ) ( not ( = ?auto_31195 ?auto_31198 ) ) ( not ( = ?auto_31195 ?auto_31202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31196 ?auto_31197 ?auto_31198 )
      ( MAKE-6CRATE-VERIFY ?auto_31192 ?auto_31193 ?auto_31194 ?auto_31195 ?auto_31196 ?auto_31197 ?auto_31198 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31256 - SURFACE
      ?auto_31257 - SURFACE
      ?auto_31258 - SURFACE
      ?auto_31259 - SURFACE
      ?auto_31260 - SURFACE
      ?auto_31261 - SURFACE
      ?auto_31262 - SURFACE
    )
    :vars
    (
      ?auto_31263 - HOIST
      ?auto_31268 - PLACE
      ?auto_31265 - PLACE
      ?auto_31264 - HOIST
      ?auto_31267 - SURFACE
      ?auto_31266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31263 ?auto_31268 ) ( SURFACE-AT ?auto_31261 ?auto_31268 ) ( CLEAR ?auto_31261 ) ( IS-CRATE ?auto_31262 ) ( not ( = ?auto_31261 ?auto_31262 ) ) ( AVAILABLE ?auto_31263 ) ( ON ?auto_31261 ?auto_31260 ) ( not ( = ?auto_31260 ?auto_31261 ) ) ( not ( = ?auto_31260 ?auto_31262 ) ) ( not ( = ?auto_31265 ?auto_31268 ) ) ( HOIST-AT ?auto_31264 ?auto_31265 ) ( not ( = ?auto_31263 ?auto_31264 ) ) ( AVAILABLE ?auto_31264 ) ( SURFACE-AT ?auto_31262 ?auto_31265 ) ( ON ?auto_31262 ?auto_31267 ) ( CLEAR ?auto_31262 ) ( not ( = ?auto_31261 ?auto_31267 ) ) ( not ( = ?auto_31262 ?auto_31267 ) ) ( not ( = ?auto_31260 ?auto_31267 ) ) ( TRUCK-AT ?auto_31266 ?auto_31268 ) ( ON ?auto_31257 ?auto_31256 ) ( ON ?auto_31258 ?auto_31257 ) ( ON ?auto_31259 ?auto_31258 ) ( ON ?auto_31260 ?auto_31259 ) ( not ( = ?auto_31256 ?auto_31257 ) ) ( not ( = ?auto_31256 ?auto_31258 ) ) ( not ( = ?auto_31256 ?auto_31259 ) ) ( not ( = ?auto_31256 ?auto_31260 ) ) ( not ( = ?auto_31256 ?auto_31261 ) ) ( not ( = ?auto_31256 ?auto_31262 ) ) ( not ( = ?auto_31256 ?auto_31267 ) ) ( not ( = ?auto_31257 ?auto_31258 ) ) ( not ( = ?auto_31257 ?auto_31259 ) ) ( not ( = ?auto_31257 ?auto_31260 ) ) ( not ( = ?auto_31257 ?auto_31261 ) ) ( not ( = ?auto_31257 ?auto_31262 ) ) ( not ( = ?auto_31257 ?auto_31267 ) ) ( not ( = ?auto_31258 ?auto_31259 ) ) ( not ( = ?auto_31258 ?auto_31260 ) ) ( not ( = ?auto_31258 ?auto_31261 ) ) ( not ( = ?auto_31258 ?auto_31262 ) ) ( not ( = ?auto_31258 ?auto_31267 ) ) ( not ( = ?auto_31259 ?auto_31260 ) ) ( not ( = ?auto_31259 ?auto_31261 ) ) ( not ( = ?auto_31259 ?auto_31262 ) ) ( not ( = ?auto_31259 ?auto_31267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31260 ?auto_31261 ?auto_31262 )
      ( MAKE-6CRATE-VERIFY ?auto_31256 ?auto_31257 ?auto_31258 ?auto_31259 ?auto_31260 ?auto_31261 ?auto_31262 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31320 - SURFACE
      ?auto_31321 - SURFACE
      ?auto_31322 - SURFACE
      ?auto_31323 - SURFACE
      ?auto_31324 - SURFACE
      ?auto_31325 - SURFACE
      ?auto_31326 - SURFACE
    )
    :vars
    (
      ?auto_31331 - HOIST
      ?auto_31332 - PLACE
      ?auto_31330 - PLACE
      ?auto_31328 - HOIST
      ?auto_31329 - SURFACE
      ?auto_31327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31331 ?auto_31332 ) ( IS-CRATE ?auto_31326 ) ( not ( = ?auto_31325 ?auto_31326 ) ) ( not ( = ?auto_31324 ?auto_31325 ) ) ( not ( = ?auto_31324 ?auto_31326 ) ) ( not ( = ?auto_31330 ?auto_31332 ) ) ( HOIST-AT ?auto_31328 ?auto_31330 ) ( not ( = ?auto_31331 ?auto_31328 ) ) ( AVAILABLE ?auto_31328 ) ( SURFACE-AT ?auto_31326 ?auto_31330 ) ( ON ?auto_31326 ?auto_31329 ) ( CLEAR ?auto_31326 ) ( not ( = ?auto_31325 ?auto_31329 ) ) ( not ( = ?auto_31326 ?auto_31329 ) ) ( not ( = ?auto_31324 ?auto_31329 ) ) ( TRUCK-AT ?auto_31327 ?auto_31332 ) ( SURFACE-AT ?auto_31324 ?auto_31332 ) ( CLEAR ?auto_31324 ) ( LIFTING ?auto_31331 ?auto_31325 ) ( IS-CRATE ?auto_31325 ) ( ON ?auto_31321 ?auto_31320 ) ( ON ?auto_31322 ?auto_31321 ) ( ON ?auto_31323 ?auto_31322 ) ( ON ?auto_31324 ?auto_31323 ) ( not ( = ?auto_31320 ?auto_31321 ) ) ( not ( = ?auto_31320 ?auto_31322 ) ) ( not ( = ?auto_31320 ?auto_31323 ) ) ( not ( = ?auto_31320 ?auto_31324 ) ) ( not ( = ?auto_31320 ?auto_31325 ) ) ( not ( = ?auto_31320 ?auto_31326 ) ) ( not ( = ?auto_31320 ?auto_31329 ) ) ( not ( = ?auto_31321 ?auto_31322 ) ) ( not ( = ?auto_31321 ?auto_31323 ) ) ( not ( = ?auto_31321 ?auto_31324 ) ) ( not ( = ?auto_31321 ?auto_31325 ) ) ( not ( = ?auto_31321 ?auto_31326 ) ) ( not ( = ?auto_31321 ?auto_31329 ) ) ( not ( = ?auto_31322 ?auto_31323 ) ) ( not ( = ?auto_31322 ?auto_31324 ) ) ( not ( = ?auto_31322 ?auto_31325 ) ) ( not ( = ?auto_31322 ?auto_31326 ) ) ( not ( = ?auto_31322 ?auto_31329 ) ) ( not ( = ?auto_31323 ?auto_31324 ) ) ( not ( = ?auto_31323 ?auto_31325 ) ) ( not ( = ?auto_31323 ?auto_31326 ) ) ( not ( = ?auto_31323 ?auto_31329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31324 ?auto_31325 ?auto_31326 )
      ( MAKE-6CRATE-VERIFY ?auto_31320 ?auto_31321 ?auto_31322 ?auto_31323 ?auto_31324 ?auto_31325 ?auto_31326 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31384 - SURFACE
      ?auto_31385 - SURFACE
      ?auto_31386 - SURFACE
      ?auto_31387 - SURFACE
      ?auto_31388 - SURFACE
      ?auto_31389 - SURFACE
      ?auto_31390 - SURFACE
    )
    :vars
    (
      ?auto_31394 - HOIST
      ?auto_31396 - PLACE
      ?auto_31392 - PLACE
      ?auto_31395 - HOIST
      ?auto_31393 - SURFACE
      ?auto_31391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31394 ?auto_31396 ) ( IS-CRATE ?auto_31390 ) ( not ( = ?auto_31389 ?auto_31390 ) ) ( not ( = ?auto_31388 ?auto_31389 ) ) ( not ( = ?auto_31388 ?auto_31390 ) ) ( not ( = ?auto_31392 ?auto_31396 ) ) ( HOIST-AT ?auto_31395 ?auto_31392 ) ( not ( = ?auto_31394 ?auto_31395 ) ) ( AVAILABLE ?auto_31395 ) ( SURFACE-AT ?auto_31390 ?auto_31392 ) ( ON ?auto_31390 ?auto_31393 ) ( CLEAR ?auto_31390 ) ( not ( = ?auto_31389 ?auto_31393 ) ) ( not ( = ?auto_31390 ?auto_31393 ) ) ( not ( = ?auto_31388 ?auto_31393 ) ) ( TRUCK-AT ?auto_31391 ?auto_31396 ) ( SURFACE-AT ?auto_31388 ?auto_31396 ) ( CLEAR ?auto_31388 ) ( IS-CRATE ?auto_31389 ) ( AVAILABLE ?auto_31394 ) ( IN ?auto_31389 ?auto_31391 ) ( ON ?auto_31385 ?auto_31384 ) ( ON ?auto_31386 ?auto_31385 ) ( ON ?auto_31387 ?auto_31386 ) ( ON ?auto_31388 ?auto_31387 ) ( not ( = ?auto_31384 ?auto_31385 ) ) ( not ( = ?auto_31384 ?auto_31386 ) ) ( not ( = ?auto_31384 ?auto_31387 ) ) ( not ( = ?auto_31384 ?auto_31388 ) ) ( not ( = ?auto_31384 ?auto_31389 ) ) ( not ( = ?auto_31384 ?auto_31390 ) ) ( not ( = ?auto_31384 ?auto_31393 ) ) ( not ( = ?auto_31385 ?auto_31386 ) ) ( not ( = ?auto_31385 ?auto_31387 ) ) ( not ( = ?auto_31385 ?auto_31388 ) ) ( not ( = ?auto_31385 ?auto_31389 ) ) ( not ( = ?auto_31385 ?auto_31390 ) ) ( not ( = ?auto_31385 ?auto_31393 ) ) ( not ( = ?auto_31386 ?auto_31387 ) ) ( not ( = ?auto_31386 ?auto_31388 ) ) ( not ( = ?auto_31386 ?auto_31389 ) ) ( not ( = ?auto_31386 ?auto_31390 ) ) ( not ( = ?auto_31386 ?auto_31393 ) ) ( not ( = ?auto_31387 ?auto_31388 ) ) ( not ( = ?auto_31387 ?auto_31389 ) ) ( not ( = ?auto_31387 ?auto_31390 ) ) ( not ( = ?auto_31387 ?auto_31393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31388 ?auto_31389 ?auto_31390 )
      ( MAKE-6CRATE-VERIFY ?auto_31384 ?auto_31385 ?auto_31386 ?auto_31387 ?auto_31388 ?auto_31389 ?auto_31390 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31448 - SURFACE
      ?auto_31449 - SURFACE
      ?auto_31450 - SURFACE
      ?auto_31451 - SURFACE
      ?auto_31452 - SURFACE
      ?auto_31453 - SURFACE
      ?auto_31454 - SURFACE
    )
    :vars
    (
      ?auto_31455 - HOIST
      ?auto_31459 - PLACE
      ?auto_31460 - PLACE
      ?auto_31456 - HOIST
      ?auto_31457 - SURFACE
      ?auto_31458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31455 ?auto_31459 ) ( IS-CRATE ?auto_31454 ) ( not ( = ?auto_31453 ?auto_31454 ) ) ( not ( = ?auto_31452 ?auto_31453 ) ) ( not ( = ?auto_31452 ?auto_31454 ) ) ( not ( = ?auto_31460 ?auto_31459 ) ) ( HOIST-AT ?auto_31456 ?auto_31460 ) ( not ( = ?auto_31455 ?auto_31456 ) ) ( AVAILABLE ?auto_31456 ) ( SURFACE-AT ?auto_31454 ?auto_31460 ) ( ON ?auto_31454 ?auto_31457 ) ( CLEAR ?auto_31454 ) ( not ( = ?auto_31453 ?auto_31457 ) ) ( not ( = ?auto_31454 ?auto_31457 ) ) ( not ( = ?auto_31452 ?auto_31457 ) ) ( SURFACE-AT ?auto_31452 ?auto_31459 ) ( CLEAR ?auto_31452 ) ( IS-CRATE ?auto_31453 ) ( AVAILABLE ?auto_31455 ) ( IN ?auto_31453 ?auto_31458 ) ( TRUCK-AT ?auto_31458 ?auto_31460 ) ( ON ?auto_31449 ?auto_31448 ) ( ON ?auto_31450 ?auto_31449 ) ( ON ?auto_31451 ?auto_31450 ) ( ON ?auto_31452 ?auto_31451 ) ( not ( = ?auto_31448 ?auto_31449 ) ) ( not ( = ?auto_31448 ?auto_31450 ) ) ( not ( = ?auto_31448 ?auto_31451 ) ) ( not ( = ?auto_31448 ?auto_31452 ) ) ( not ( = ?auto_31448 ?auto_31453 ) ) ( not ( = ?auto_31448 ?auto_31454 ) ) ( not ( = ?auto_31448 ?auto_31457 ) ) ( not ( = ?auto_31449 ?auto_31450 ) ) ( not ( = ?auto_31449 ?auto_31451 ) ) ( not ( = ?auto_31449 ?auto_31452 ) ) ( not ( = ?auto_31449 ?auto_31453 ) ) ( not ( = ?auto_31449 ?auto_31454 ) ) ( not ( = ?auto_31449 ?auto_31457 ) ) ( not ( = ?auto_31450 ?auto_31451 ) ) ( not ( = ?auto_31450 ?auto_31452 ) ) ( not ( = ?auto_31450 ?auto_31453 ) ) ( not ( = ?auto_31450 ?auto_31454 ) ) ( not ( = ?auto_31450 ?auto_31457 ) ) ( not ( = ?auto_31451 ?auto_31452 ) ) ( not ( = ?auto_31451 ?auto_31453 ) ) ( not ( = ?auto_31451 ?auto_31454 ) ) ( not ( = ?auto_31451 ?auto_31457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31452 ?auto_31453 ?auto_31454 )
      ( MAKE-6CRATE-VERIFY ?auto_31448 ?auto_31449 ?auto_31450 ?auto_31451 ?auto_31452 ?auto_31453 ?auto_31454 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31512 - SURFACE
      ?auto_31513 - SURFACE
      ?auto_31514 - SURFACE
      ?auto_31515 - SURFACE
      ?auto_31516 - SURFACE
      ?auto_31517 - SURFACE
      ?auto_31518 - SURFACE
    )
    :vars
    (
      ?auto_31524 - HOIST
      ?auto_31519 - PLACE
      ?auto_31523 - PLACE
      ?auto_31520 - HOIST
      ?auto_31521 - SURFACE
      ?auto_31522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31524 ?auto_31519 ) ( IS-CRATE ?auto_31518 ) ( not ( = ?auto_31517 ?auto_31518 ) ) ( not ( = ?auto_31516 ?auto_31517 ) ) ( not ( = ?auto_31516 ?auto_31518 ) ) ( not ( = ?auto_31523 ?auto_31519 ) ) ( HOIST-AT ?auto_31520 ?auto_31523 ) ( not ( = ?auto_31524 ?auto_31520 ) ) ( SURFACE-AT ?auto_31518 ?auto_31523 ) ( ON ?auto_31518 ?auto_31521 ) ( CLEAR ?auto_31518 ) ( not ( = ?auto_31517 ?auto_31521 ) ) ( not ( = ?auto_31518 ?auto_31521 ) ) ( not ( = ?auto_31516 ?auto_31521 ) ) ( SURFACE-AT ?auto_31516 ?auto_31519 ) ( CLEAR ?auto_31516 ) ( IS-CRATE ?auto_31517 ) ( AVAILABLE ?auto_31524 ) ( TRUCK-AT ?auto_31522 ?auto_31523 ) ( LIFTING ?auto_31520 ?auto_31517 ) ( ON ?auto_31513 ?auto_31512 ) ( ON ?auto_31514 ?auto_31513 ) ( ON ?auto_31515 ?auto_31514 ) ( ON ?auto_31516 ?auto_31515 ) ( not ( = ?auto_31512 ?auto_31513 ) ) ( not ( = ?auto_31512 ?auto_31514 ) ) ( not ( = ?auto_31512 ?auto_31515 ) ) ( not ( = ?auto_31512 ?auto_31516 ) ) ( not ( = ?auto_31512 ?auto_31517 ) ) ( not ( = ?auto_31512 ?auto_31518 ) ) ( not ( = ?auto_31512 ?auto_31521 ) ) ( not ( = ?auto_31513 ?auto_31514 ) ) ( not ( = ?auto_31513 ?auto_31515 ) ) ( not ( = ?auto_31513 ?auto_31516 ) ) ( not ( = ?auto_31513 ?auto_31517 ) ) ( not ( = ?auto_31513 ?auto_31518 ) ) ( not ( = ?auto_31513 ?auto_31521 ) ) ( not ( = ?auto_31514 ?auto_31515 ) ) ( not ( = ?auto_31514 ?auto_31516 ) ) ( not ( = ?auto_31514 ?auto_31517 ) ) ( not ( = ?auto_31514 ?auto_31518 ) ) ( not ( = ?auto_31514 ?auto_31521 ) ) ( not ( = ?auto_31515 ?auto_31516 ) ) ( not ( = ?auto_31515 ?auto_31517 ) ) ( not ( = ?auto_31515 ?auto_31518 ) ) ( not ( = ?auto_31515 ?auto_31521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31516 ?auto_31517 ?auto_31518 )
      ( MAKE-6CRATE-VERIFY ?auto_31512 ?auto_31513 ?auto_31514 ?auto_31515 ?auto_31516 ?auto_31517 ?auto_31518 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31581 - SURFACE
      ?auto_31582 - SURFACE
      ?auto_31583 - SURFACE
      ?auto_31584 - SURFACE
      ?auto_31585 - SURFACE
      ?auto_31586 - SURFACE
      ?auto_31587 - SURFACE
    )
    :vars
    (
      ?auto_31593 - HOIST
      ?auto_31594 - PLACE
      ?auto_31592 - PLACE
      ?auto_31588 - HOIST
      ?auto_31590 - SURFACE
      ?auto_31589 - TRUCK
      ?auto_31591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31593 ?auto_31594 ) ( IS-CRATE ?auto_31587 ) ( not ( = ?auto_31586 ?auto_31587 ) ) ( not ( = ?auto_31585 ?auto_31586 ) ) ( not ( = ?auto_31585 ?auto_31587 ) ) ( not ( = ?auto_31592 ?auto_31594 ) ) ( HOIST-AT ?auto_31588 ?auto_31592 ) ( not ( = ?auto_31593 ?auto_31588 ) ) ( SURFACE-AT ?auto_31587 ?auto_31592 ) ( ON ?auto_31587 ?auto_31590 ) ( CLEAR ?auto_31587 ) ( not ( = ?auto_31586 ?auto_31590 ) ) ( not ( = ?auto_31587 ?auto_31590 ) ) ( not ( = ?auto_31585 ?auto_31590 ) ) ( SURFACE-AT ?auto_31585 ?auto_31594 ) ( CLEAR ?auto_31585 ) ( IS-CRATE ?auto_31586 ) ( AVAILABLE ?auto_31593 ) ( TRUCK-AT ?auto_31589 ?auto_31592 ) ( AVAILABLE ?auto_31588 ) ( SURFACE-AT ?auto_31586 ?auto_31592 ) ( ON ?auto_31586 ?auto_31591 ) ( CLEAR ?auto_31586 ) ( not ( = ?auto_31586 ?auto_31591 ) ) ( not ( = ?auto_31587 ?auto_31591 ) ) ( not ( = ?auto_31585 ?auto_31591 ) ) ( not ( = ?auto_31590 ?auto_31591 ) ) ( ON ?auto_31582 ?auto_31581 ) ( ON ?auto_31583 ?auto_31582 ) ( ON ?auto_31584 ?auto_31583 ) ( ON ?auto_31585 ?auto_31584 ) ( not ( = ?auto_31581 ?auto_31582 ) ) ( not ( = ?auto_31581 ?auto_31583 ) ) ( not ( = ?auto_31581 ?auto_31584 ) ) ( not ( = ?auto_31581 ?auto_31585 ) ) ( not ( = ?auto_31581 ?auto_31586 ) ) ( not ( = ?auto_31581 ?auto_31587 ) ) ( not ( = ?auto_31581 ?auto_31590 ) ) ( not ( = ?auto_31581 ?auto_31591 ) ) ( not ( = ?auto_31582 ?auto_31583 ) ) ( not ( = ?auto_31582 ?auto_31584 ) ) ( not ( = ?auto_31582 ?auto_31585 ) ) ( not ( = ?auto_31582 ?auto_31586 ) ) ( not ( = ?auto_31582 ?auto_31587 ) ) ( not ( = ?auto_31582 ?auto_31590 ) ) ( not ( = ?auto_31582 ?auto_31591 ) ) ( not ( = ?auto_31583 ?auto_31584 ) ) ( not ( = ?auto_31583 ?auto_31585 ) ) ( not ( = ?auto_31583 ?auto_31586 ) ) ( not ( = ?auto_31583 ?auto_31587 ) ) ( not ( = ?auto_31583 ?auto_31590 ) ) ( not ( = ?auto_31583 ?auto_31591 ) ) ( not ( = ?auto_31584 ?auto_31585 ) ) ( not ( = ?auto_31584 ?auto_31586 ) ) ( not ( = ?auto_31584 ?auto_31587 ) ) ( not ( = ?auto_31584 ?auto_31590 ) ) ( not ( = ?auto_31584 ?auto_31591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31585 ?auto_31586 ?auto_31587 )
      ( MAKE-6CRATE-VERIFY ?auto_31581 ?auto_31582 ?auto_31583 ?auto_31584 ?auto_31585 ?auto_31586 ?auto_31587 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31651 - SURFACE
      ?auto_31652 - SURFACE
      ?auto_31653 - SURFACE
      ?auto_31654 - SURFACE
      ?auto_31655 - SURFACE
      ?auto_31656 - SURFACE
      ?auto_31657 - SURFACE
    )
    :vars
    (
      ?auto_31664 - HOIST
      ?auto_31661 - PLACE
      ?auto_31662 - PLACE
      ?auto_31663 - HOIST
      ?auto_31659 - SURFACE
      ?auto_31660 - SURFACE
      ?auto_31658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31664 ?auto_31661 ) ( IS-CRATE ?auto_31657 ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( not ( = ?auto_31655 ?auto_31656 ) ) ( not ( = ?auto_31655 ?auto_31657 ) ) ( not ( = ?auto_31662 ?auto_31661 ) ) ( HOIST-AT ?auto_31663 ?auto_31662 ) ( not ( = ?auto_31664 ?auto_31663 ) ) ( SURFACE-AT ?auto_31657 ?auto_31662 ) ( ON ?auto_31657 ?auto_31659 ) ( CLEAR ?auto_31657 ) ( not ( = ?auto_31656 ?auto_31659 ) ) ( not ( = ?auto_31657 ?auto_31659 ) ) ( not ( = ?auto_31655 ?auto_31659 ) ) ( SURFACE-AT ?auto_31655 ?auto_31661 ) ( CLEAR ?auto_31655 ) ( IS-CRATE ?auto_31656 ) ( AVAILABLE ?auto_31664 ) ( AVAILABLE ?auto_31663 ) ( SURFACE-AT ?auto_31656 ?auto_31662 ) ( ON ?auto_31656 ?auto_31660 ) ( CLEAR ?auto_31656 ) ( not ( = ?auto_31656 ?auto_31660 ) ) ( not ( = ?auto_31657 ?auto_31660 ) ) ( not ( = ?auto_31655 ?auto_31660 ) ) ( not ( = ?auto_31659 ?auto_31660 ) ) ( TRUCK-AT ?auto_31658 ?auto_31661 ) ( ON ?auto_31652 ?auto_31651 ) ( ON ?auto_31653 ?auto_31652 ) ( ON ?auto_31654 ?auto_31653 ) ( ON ?auto_31655 ?auto_31654 ) ( not ( = ?auto_31651 ?auto_31652 ) ) ( not ( = ?auto_31651 ?auto_31653 ) ) ( not ( = ?auto_31651 ?auto_31654 ) ) ( not ( = ?auto_31651 ?auto_31655 ) ) ( not ( = ?auto_31651 ?auto_31656 ) ) ( not ( = ?auto_31651 ?auto_31657 ) ) ( not ( = ?auto_31651 ?auto_31659 ) ) ( not ( = ?auto_31651 ?auto_31660 ) ) ( not ( = ?auto_31652 ?auto_31653 ) ) ( not ( = ?auto_31652 ?auto_31654 ) ) ( not ( = ?auto_31652 ?auto_31655 ) ) ( not ( = ?auto_31652 ?auto_31656 ) ) ( not ( = ?auto_31652 ?auto_31657 ) ) ( not ( = ?auto_31652 ?auto_31659 ) ) ( not ( = ?auto_31652 ?auto_31660 ) ) ( not ( = ?auto_31653 ?auto_31654 ) ) ( not ( = ?auto_31653 ?auto_31655 ) ) ( not ( = ?auto_31653 ?auto_31656 ) ) ( not ( = ?auto_31653 ?auto_31657 ) ) ( not ( = ?auto_31653 ?auto_31659 ) ) ( not ( = ?auto_31653 ?auto_31660 ) ) ( not ( = ?auto_31654 ?auto_31655 ) ) ( not ( = ?auto_31654 ?auto_31656 ) ) ( not ( = ?auto_31654 ?auto_31657 ) ) ( not ( = ?auto_31654 ?auto_31659 ) ) ( not ( = ?auto_31654 ?auto_31660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31655 ?auto_31656 ?auto_31657 )
      ( MAKE-6CRATE-VERIFY ?auto_31651 ?auto_31652 ?auto_31653 ?auto_31654 ?auto_31655 ?auto_31656 ?auto_31657 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31723 - SURFACE
      ?auto_31724 - SURFACE
      ?auto_31725 - SURFACE
      ?auto_31726 - SURFACE
      ?auto_31727 - SURFACE
      ?auto_31728 - SURFACE
      ?auto_31729 - SURFACE
    )
    :vars
    (
      ?auto_31731 - HOIST
      ?auto_31733 - PLACE
      ?auto_31734 - PLACE
      ?auto_31730 - HOIST
      ?auto_31736 - SURFACE
      ?auto_31732 - SURFACE
      ?auto_31735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31731 ?auto_31733 ) ( IS-CRATE ?auto_31729 ) ( not ( = ?auto_31728 ?auto_31729 ) ) ( not ( = ?auto_31727 ?auto_31728 ) ) ( not ( = ?auto_31727 ?auto_31729 ) ) ( not ( = ?auto_31734 ?auto_31733 ) ) ( HOIST-AT ?auto_31730 ?auto_31734 ) ( not ( = ?auto_31731 ?auto_31730 ) ) ( SURFACE-AT ?auto_31729 ?auto_31734 ) ( ON ?auto_31729 ?auto_31736 ) ( CLEAR ?auto_31729 ) ( not ( = ?auto_31728 ?auto_31736 ) ) ( not ( = ?auto_31729 ?auto_31736 ) ) ( not ( = ?auto_31727 ?auto_31736 ) ) ( IS-CRATE ?auto_31728 ) ( AVAILABLE ?auto_31730 ) ( SURFACE-AT ?auto_31728 ?auto_31734 ) ( ON ?auto_31728 ?auto_31732 ) ( CLEAR ?auto_31728 ) ( not ( = ?auto_31728 ?auto_31732 ) ) ( not ( = ?auto_31729 ?auto_31732 ) ) ( not ( = ?auto_31727 ?auto_31732 ) ) ( not ( = ?auto_31736 ?auto_31732 ) ) ( TRUCK-AT ?auto_31735 ?auto_31733 ) ( SURFACE-AT ?auto_31726 ?auto_31733 ) ( CLEAR ?auto_31726 ) ( LIFTING ?auto_31731 ?auto_31727 ) ( IS-CRATE ?auto_31727 ) ( not ( = ?auto_31726 ?auto_31727 ) ) ( not ( = ?auto_31728 ?auto_31726 ) ) ( not ( = ?auto_31729 ?auto_31726 ) ) ( not ( = ?auto_31736 ?auto_31726 ) ) ( not ( = ?auto_31732 ?auto_31726 ) ) ( ON ?auto_31724 ?auto_31723 ) ( ON ?auto_31725 ?auto_31724 ) ( ON ?auto_31726 ?auto_31725 ) ( not ( = ?auto_31723 ?auto_31724 ) ) ( not ( = ?auto_31723 ?auto_31725 ) ) ( not ( = ?auto_31723 ?auto_31726 ) ) ( not ( = ?auto_31723 ?auto_31727 ) ) ( not ( = ?auto_31723 ?auto_31728 ) ) ( not ( = ?auto_31723 ?auto_31729 ) ) ( not ( = ?auto_31723 ?auto_31736 ) ) ( not ( = ?auto_31723 ?auto_31732 ) ) ( not ( = ?auto_31724 ?auto_31725 ) ) ( not ( = ?auto_31724 ?auto_31726 ) ) ( not ( = ?auto_31724 ?auto_31727 ) ) ( not ( = ?auto_31724 ?auto_31728 ) ) ( not ( = ?auto_31724 ?auto_31729 ) ) ( not ( = ?auto_31724 ?auto_31736 ) ) ( not ( = ?auto_31724 ?auto_31732 ) ) ( not ( = ?auto_31725 ?auto_31726 ) ) ( not ( = ?auto_31725 ?auto_31727 ) ) ( not ( = ?auto_31725 ?auto_31728 ) ) ( not ( = ?auto_31725 ?auto_31729 ) ) ( not ( = ?auto_31725 ?auto_31736 ) ) ( not ( = ?auto_31725 ?auto_31732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31727 ?auto_31728 ?auto_31729 )
      ( MAKE-6CRATE-VERIFY ?auto_31723 ?auto_31724 ?auto_31725 ?auto_31726 ?auto_31727 ?auto_31728 ?auto_31729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31867 - SURFACE
      ?auto_31868 - SURFACE
    )
    :vars
    (
      ?auto_31869 - HOIST
      ?auto_31872 - PLACE
      ?auto_31874 - SURFACE
      ?auto_31873 - PLACE
      ?auto_31876 - HOIST
      ?auto_31871 - SURFACE
      ?auto_31870 - TRUCK
      ?auto_31875 - SURFACE
      ?auto_31877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31869 ?auto_31872 ) ( IS-CRATE ?auto_31868 ) ( not ( = ?auto_31867 ?auto_31868 ) ) ( not ( = ?auto_31874 ?auto_31867 ) ) ( not ( = ?auto_31874 ?auto_31868 ) ) ( not ( = ?auto_31873 ?auto_31872 ) ) ( HOIST-AT ?auto_31876 ?auto_31873 ) ( not ( = ?auto_31869 ?auto_31876 ) ) ( SURFACE-AT ?auto_31868 ?auto_31873 ) ( ON ?auto_31868 ?auto_31871 ) ( CLEAR ?auto_31868 ) ( not ( = ?auto_31867 ?auto_31871 ) ) ( not ( = ?auto_31868 ?auto_31871 ) ) ( not ( = ?auto_31874 ?auto_31871 ) ) ( SURFACE-AT ?auto_31874 ?auto_31872 ) ( CLEAR ?auto_31874 ) ( IS-CRATE ?auto_31867 ) ( AVAILABLE ?auto_31869 ) ( TRUCK-AT ?auto_31870 ?auto_31873 ) ( SURFACE-AT ?auto_31867 ?auto_31873 ) ( ON ?auto_31867 ?auto_31875 ) ( CLEAR ?auto_31867 ) ( not ( = ?auto_31867 ?auto_31875 ) ) ( not ( = ?auto_31868 ?auto_31875 ) ) ( not ( = ?auto_31874 ?auto_31875 ) ) ( not ( = ?auto_31871 ?auto_31875 ) ) ( LIFTING ?auto_31876 ?auto_31877 ) ( IS-CRATE ?auto_31877 ) ( not ( = ?auto_31867 ?auto_31877 ) ) ( not ( = ?auto_31868 ?auto_31877 ) ) ( not ( = ?auto_31874 ?auto_31877 ) ) ( not ( = ?auto_31871 ?auto_31877 ) ) ( not ( = ?auto_31875 ?auto_31877 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31876 ?auto_31877 ?auto_31870 ?auto_31873 )
      ( MAKE-1CRATE ?auto_31867 ?auto_31868 )
      ( MAKE-1CRATE-VERIFY ?auto_31867 ?auto_31868 ) )
  )

)

