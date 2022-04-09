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
      ?auto_152873 - SURFACE
      ?auto_152874 - SURFACE
    )
    :vars
    (
      ?auto_152875 - HOIST
      ?auto_152876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152875 ?auto_152876 ) ( SURFACE-AT ?auto_152873 ?auto_152876 ) ( CLEAR ?auto_152873 ) ( LIFTING ?auto_152875 ?auto_152874 ) ( IS-CRATE ?auto_152874 ) ( not ( = ?auto_152873 ?auto_152874 ) ) )
    :subtasks
    ( ( !DROP ?auto_152875 ?auto_152874 ?auto_152873 ?auto_152876 )
      ( MAKE-1CRATE-VERIFY ?auto_152873 ?auto_152874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152877 - SURFACE
      ?auto_152878 - SURFACE
    )
    :vars
    (
      ?auto_152879 - HOIST
      ?auto_152880 - PLACE
      ?auto_152881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152879 ?auto_152880 ) ( SURFACE-AT ?auto_152877 ?auto_152880 ) ( CLEAR ?auto_152877 ) ( IS-CRATE ?auto_152878 ) ( not ( = ?auto_152877 ?auto_152878 ) ) ( TRUCK-AT ?auto_152881 ?auto_152880 ) ( AVAILABLE ?auto_152879 ) ( IN ?auto_152878 ?auto_152881 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152879 ?auto_152878 ?auto_152881 ?auto_152880 )
      ( MAKE-1CRATE ?auto_152877 ?auto_152878 )
      ( MAKE-1CRATE-VERIFY ?auto_152877 ?auto_152878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152882 - SURFACE
      ?auto_152883 - SURFACE
    )
    :vars
    (
      ?auto_152884 - HOIST
      ?auto_152885 - PLACE
      ?auto_152886 - TRUCK
      ?auto_152887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152884 ?auto_152885 ) ( SURFACE-AT ?auto_152882 ?auto_152885 ) ( CLEAR ?auto_152882 ) ( IS-CRATE ?auto_152883 ) ( not ( = ?auto_152882 ?auto_152883 ) ) ( AVAILABLE ?auto_152884 ) ( IN ?auto_152883 ?auto_152886 ) ( TRUCK-AT ?auto_152886 ?auto_152887 ) ( not ( = ?auto_152887 ?auto_152885 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152886 ?auto_152887 ?auto_152885 )
      ( MAKE-1CRATE ?auto_152882 ?auto_152883 )
      ( MAKE-1CRATE-VERIFY ?auto_152882 ?auto_152883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152888 - SURFACE
      ?auto_152889 - SURFACE
    )
    :vars
    (
      ?auto_152891 - HOIST
      ?auto_152893 - PLACE
      ?auto_152890 - TRUCK
      ?auto_152892 - PLACE
      ?auto_152894 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152891 ?auto_152893 ) ( SURFACE-AT ?auto_152888 ?auto_152893 ) ( CLEAR ?auto_152888 ) ( IS-CRATE ?auto_152889 ) ( not ( = ?auto_152888 ?auto_152889 ) ) ( AVAILABLE ?auto_152891 ) ( TRUCK-AT ?auto_152890 ?auto_152892 ) ( not ( = ?auto_152892 ?auto_152893 ) ) ( HOIST-AT ?auto_152894 ?auto_152892 ) ( LIFTING ?auto_152894 ?auto_152889 ) ( not ( = ?auto_152891 ?auto_152894 ) ) )
    :subtasks
    ( ( !LOAD ?auto_152894 ?auto_152889 ?auto_152890 ?auto_152892 )
      ( MAKE-1CRATE ?auto_152888 ?auto_152889 )
      ( MAKE-1CRATE-VERIFY ?auto_152888 ?auto_152889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152895 - SURFACE
      ?auto_152896 - SURFACE
    )
    :vars
    (
      ?auto_152901 - HOIST
      ?auto_152898 - PLACE
      ?auto_152900 - TRUCK
      ?auto_152897 - PLACE
      ?auto_152899 - HOIST
      ?auto_152902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152901 ?auto_152898 ) ( SURFACE-AT ?auto_152895 ?auto_152898 ) ( CLEAR ?auto_152895 ) ( IS-CRATE ?auto_152896 ) ( not ( = ?auto_152895 ?auto_152896 ) ) ( AVAILABLE ?auto_152901 ) ( TRUCK-AT ?auto_152900 ?auto_152897 ) ( not ( = ?auto_152897 ?auto_152898 ) ) ( HOIST-AT ?auto_152899 ?auto_152897 ) ( not ( = ?auto_152901 ?auto_152899 ) ) ( AVAILABLE ?auto_152899 ) ( SURFACE-AT ?auto_152896 ?auto_152897 ) ( ON ?auto_152896 ?auto_152902 ) ( CLEAR ?auto_152896 ) ( not ( = ?auto_152895 ?auto_152902 ) ) ( not ( = ?auto_152896 ?auto_152902 ) ) )
    :subtasks
    ( ( !LIFT ?auto_152899 ?auto_152896 ?auto_152902 ?auto_152897 )
      ( MAKE-1CRATE ?auto_152895 ?auto_152896 )
      ( MAKE-1CRATE-VERIFY ?auto_152895 ?auto_152896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152903 - SURFACE
      ?auto_152904 - SURFACE
    )
    :vars
    (
      ?auto_152907 - HOIST
      ?auto_152909 - PLACE
      ?auto_152905 - PLACE
      ?auto_152906 - HOIST
      ?auto_152910 - SURFACE
      ?auto_152908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152907 ?auto_152909 ) ( SURFACE-AT ?auto_152903 ?auto_152909 ) ( CLEAR ?auto_152903 ) ( IS-CRATE ?auto_152904 ) ( not ( = ?auto_152903 ?auto_152904 ) ) ( AVAILABLE ?auto_152907 ) ( not ( = ?auto_152905 ?auto_152909 ) ) ( HOIST-AT ?auto_152906 ?auto_152905 ) ( not ( = ?auto_152907 ?auto_152906 ) ) ( AVAILABLE ?auto_152906 ) ( SURFACE-AT ?auto_152904 ?auto_152905 ) ( ON ?auto_152904 ?auto_152910 ) ( CLEAR ?auto_152904 ) ( not ( = ?auto_152903 ?auto_152910 ) ) ( not ( = ?auto_152904 ?auto_152910 ) ) ( TRUCK-AT ?auto_152908 ?auto_152909 ) )
    :subtasks
    ( ( !DRIVE ?auto_152908 ?auto_152909 ?auto_152905 )
      ( MAKE-1CRATE ?auto_152903 ?auto_152904 )
      ( MAKE-1CRATE-VERIFY ?auto_152903 ?auto_152904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152920 - SURFACE
      ?auto_152921 - SURFACE
      ?auto_152922 - SURFACE
    )
    :vars
    (
      ?auto_152923 - HOIST
      ?auto_152924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152923 ?auto_152924 ) ( SURFACE-AT ?auto_152921 ?auto_152924 ) ( CLEAR ?auto_152921 ) ( LIFTING ?auto_152923 ?auto_152922 ) ( IS-CRATE ?auto_152922 ) ( not ( = ?auto_152921 ?auto_152922 ) ) ( ON ?auto_152921 ?auto_152920 ) ( not ( = ?auto_152920 ?auto_152921 ) ) ( not ( = ?auto_152920 ?auto_152922 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152921 ?auto_152922 )
      ( MAKE-2CRATE-VERIFY ?auto_152920 ?auto_152921 ?auto_152922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152930 - SURFACE
      ?auto_152931 - SURFACE
      ?auto_152932 - SURFACE
    )
    :vars
    (
      ?auto_152934 - HOIST
      ?auto_152933 - PLACE
      ?auto_152935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152934 ?auto_152933 ) ( SURFACE-AT ?auto_152931 ?auto_152933 ) ( CLEAR ?auto_152931 ) ( IS-CRATE ?auto_152932 ) ( not ( = ?auto_152931 ?auto_152932 ) ) ( TRUCK-AT ?auto_152935 ?auto_152933 ) ( AVAILABLE ?auto_152934 ) ( IN ?auto_152932 ?auto_152935 ) ( ON ?auto_152931 ?auto_152930 ) ( not ( = ?auto_152930 ?auto_152931 ) ) ( not ( = ?auto_152930 ?auto_152932 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152931 ?auto_152932 )
      ( MAKE-2CRATE-VERIFY ?auto_152930 ?auto_152931 ?auto_152932 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152936 - SURFACE
      ?auto_152937 - SURFACE
    )
    :vars
    (
      ?auto_152938 - HOIST
      ?auto_152940 - PLACE
      ?auto_152941 - TRUCK
      ?auto_152939 - SURFACE
      ?auto_152942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152938 ?auto_152940 ) ( SURFACE-AT ?auto_152936 ?auto_152940 ) ( CLEAR ?auto_152936 ) ( IS-CRATE ?auto_152937 ) ( not ( = ?auto_152936 ?auto_152937 ) ) ( AVAILABLE ?auto_152938 ) ( IN ?auto_152937 ?auto_152941 ) ( ON ?auto_152936 ?auto_152939 ) ( not ( = ?auto_152939 ?auto_152936 ) ) ( not ( = ?auto_152939 ?auto_152937 ) ) ( TRUCK-AT ?auto_152941 ?auto_152942 ) ( not ( = ?auto_152942 ?auto_152940 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152941 ?auto_152942 ?auto_152940 )
      ( MAKE-2CRATE ?auto_152939 ?auto_152936 ?auto_152937 )
      ( MAKE-1CRATE-VERIFY ?auto_152936 ?auto_152937 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152943 - SURFACE
      ?auto_152944 - SURFACE
      ?auto_152945 - SURFACE
    )
    :vars
    (
      ?auto_152948 - HOIST
      ?auto_152947 - PLACE
      ?auto_152949 - TRUCK
      ?auto_152946 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152948 ?auto_152947 ) ( SURFACE-AT ?auto_152944 ?auto_152947 ) ( CLEAR ?auto_152944 ) ( IS-CRATE ?auto_152945 ) ( not ( = ?auto_152944 ?auto_152945 ) ) ( AVAILABLE ?auto_152948 ) ( IN ?auto_152945 ?auto_152949 ) ( ON ?auto_152944 ?auto_152943 ) ( not ( = ?auto_152943 ?auto_152944 ) ) ( not ( = ?auto_152943 ?auto_152945 ) ) ( TRUCK-AT ?auto_152949 ?auto_152946 ) ( not ( = ?auto_152946 ?auto_152947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152944 ?auto_152945 )
      ( MAKE-2CRATE-VERIFY ?auto_152943 ?auto_152944 ?auto_152945 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152950 - SURFACE
      ?auto_152951 - SURFACE
    )
    :vars
    (
      ?auto_152953 - HOIST
      ?auto_152955 - PLACE
      ?auto_152954 - SURFACE
      ?auto_152952 - TRUCK
      ?auto_152956 - PLACE
      ?auto_152957 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152953 ?auto_152955 ) ( SURFACE-AT ?auto_152950 ?auto_152955 ) ( CLEAR ?auto_152950 ) ( IS-CRATE ?auto_152951 ) ( not ( = ?auto_152950 ?auto_152951 ) ) ( AVAILABLE ?auto_152953 ) ( ON ?auto_152950 ?auto_152954 ) ( not ( = ?auto_152954 ?auto_152950 ) ) ( not ( = ?auto_152954 ?auto_152951 ) ) ( TRUCK-AT ?auto_152952 ?auto_152956 ) ( not ( = ?auto_152956 ?auto_152955 ) ) ( HOIST-AT ?auto_152957 ?auto_152956 ) ( LIFTING ?auto_152957 ?auto_152951 ) ( not ( = ?auto_152953 ?auto_152957 ) ) )
    :subtasks
    ( ( !LOAD ?auto_152957 ?auto_152951 ?auto_152952 ?auto_152956 )
      ( MAKE-2CRATE ?auto_152954 ?auto_152950 ?auto_152951 )
      ( MAKE-1CRATE-VERIFY ?auto_152950 ?auto_152951 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152958 - SURFACE
      ?auto_152959 - SURFACE
      ?auto_152960 - SURFACE
    )
    :vars
    (
      ?auto_152961 - HOIST
      ?auto_152963 - PLACE
      ?auto_152962 - TRUCK
      ?auto_152965 - PLACE
      ?auto_152964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152961 ?auto_152963 ) ( SURFACE-AT ?auto_152959 ?auto_152963 ) ( CLEAR ?auto_152959 ) ( IS-CRATE ?auto_152960 ) ( not ( = ?auto_152959 ?auto_152960 ) ) ( AVAILABLE ?auto_152961 ) ( ON ?auto_152959 ?auto_152958 ) ( not ( = ?auto_152958 ?auto_152959 ) ) ( not ( = ?auto_152958 ?auto_152960 ) ) ( TRUCK-AT ?auto_152962 ?auto_152965 ) ( not ( = ?auto_152965 ?auto_152963 ) ) ( HOIST-AT ?auto_152964 ?auto_152965 ) ( LIFTING ?auto_152964 ?auto_152960 ) ( not ( = ?auto_152961 ?auto_152964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152959 ?auto_152960 )
      ( MAKE-2CRATE-VERIFY ?auto_152958 ?auto_152959 ?auto_152960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152966 - SURFACE
      ?auto_152967 - SURFACE
    )
    :vars
    (
      ?auto_152971 - HOIST
      ?auto_152970 - PLACE
      ?auto_152973 - SURFACE
      ?auto_152969 - TRUCK
      ?auto_152972 - PLACE
      ?auto_152968 - HOIST
      ?auto_152974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152971 ?auto_152970 ) ( SURFACE-AT ?auto_152966 ?auto_152970 ) ( CLEAR ?auto_152966 ) ( IS-CRATE ?auto_152967 ) ( not ( = ?auto_152966 ?auto_152967 ) ) ( AVAILABLE ?auto_152971 ) ( ON ?auto_152966 ?auto_152973 ) ( not ( = ?auto_152973 ?auto_152966 ) ) ( not ( = ?auto_152973 ?auto_152967 ) ) ( TRUCK-AT ?auto_152969 ?auto_152972 ) ( not ( = ?auto_152972 ?auto_152970 ) ) ( HOIST-AT ?auto_152968 ?auto_152972 ) ( not ( = ?auto_152971 ?auto_152968 ) ) ( AVAILABLE ?auto_152968 ) ( SURFACE-AT ?auto_152967 ?auto_152972 ) ( ON ?auto_152967 ?auto_152974 ) ( CLEAR ?auto_152967 ) ( not ( = ?auto_152966 ?auto_152974 ) ) ( not ( = ?auto_152967 ?auto_152974 ) ) ( not ( = ?auto_152973 ?auto_152974 ) ) )
    :subtasks
    ( ( !LIFT ?auto_152968 ?auto_152967 ?auto_152974 ?auto_152972 )
      ( MAKE-2CRATE ?auto_152973 ?auto_152966 ?auto_152967 )
      ( MAKE-1CRATE-VERIFY ?auto_152966 ?auto_152967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152975 - SURFACE
      ?auto_152976 - SURFACE
      ?auto_152977 - SURFACE
    )
    :vars
    (
      ?auto_152982 - HOIST
      ?auto_152979 - PLACE
      ?auto_152978 - TRUCK
      ?auto_152983 - PLACE
      ?auto_152980 - HOIST
      ?auto_152981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152982 ?auto_152979 ) ( SURFACE-AT ?auto_152976 ?auto_152979 ) ( CLEAR ?auto_152976 ) ( IS-CRATE ?auto_152977 ) ( not ( = ?auto_152976 ?auto_152977 ) ) ( AVAILABLE ?auto_152982 ) ( ON ?auto_152976 ?auto_152975 ) ( not ( = ?auto_152975 ?auto_152976 ) ) ( not ( = ?auto_152975 ?auto_152977 ) ) ( TRUCK-AT ?auto_152978 ?auto_152983 ) ( not ( = ?auto_152983 ?auto_152979 ) ) ( HOIST-AT ?auto_152980 ?auto_152983 ) ( not ( = ?auto_152982 ?auto_152980 ) ) ( AVAILABLE ?auto_152980 ) ( SURFACE-AT ?auto_152977 ?auto_152983 ) ( ON ?auto_152977 ?auto_152981 ) ( CLEAR ?auto_152977 ) ( not ( = ?auto_152976 ?auto_152981 ) ) ( not ( = ?auto_152977 ?auto_152981 ) ) ( not ( = ?auto_152975 ?auto_152981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152976 ?auto_152977 )
      ( MAKE-2CRATE-VERIFY ?auto_152975 ?auto_152976 ?auto_152977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152984 - SURFACE
      ?auto_152985 - SURFACE
    )
    :vars
    (
      ?auto_152988 - HOIST
      ?auto_152992 - PLACE
      ?auto_152986 - SURFACE
      ?auto_152989 - PLACE
      ?auto_152990 - HOIST
      ?auto_152991 - SURFACE
      ?auto_152987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152988 ?auto_152992 ) ( SURFACE-AT ?auto_152984 ?auto_152992 ) ( CLEAR ?auto_152984 ) ( IS-CRATE ?auto_152985 ) ( not ( = ?auto_152984 ?auto_152985 ) ) ( AVAILABLE ?auto_152988 ) ( ON ?auto_152984 ?auto_152986 ) ( not ( = ?auto_152986 ?auto_152984 ) ) ( not ( = ?auto_152986 ?auto_152985 ) ) ( not ( = ?auto_152989 ?auto_152992 ) ) ( HOIST-AT ?auto_152990 ?auto_152989 ) ( not ( = ?auto_152988 ?auto_152990 ) ) ( AVAILABLE ?auto_152990 ) ( SURFACE-AT ?auto_152985 ?auto_152989 ) ( ON ?auto_152985 ?auto_152991 ) ( CLEAR ?auto_152985 ) ( not ( = ?auto_152984 ?auto_152991 ) ) ( not ( = ?auto_152985 ?auto_152991 ) ) ( not ( = ?auto_152986 ?auto_152991 ) ) ( TRUCK-AT ?auto_152987 ?auto_152992 ) )
    :subtasks
    ( ( !DRIVE ?auto_152987 ?auto_152992 ?auto_152989 )
      ( MAKE-2CRATE ?auto_152986 ?auto_152984 ?auto_152985 )
      ( MAKE-1CRATE-VERIFY ?auto_152984 ?auto_152985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152993 - SURFACE
      ?auto_152994 - SURFACE
      ?auto_152995 - SURFACE
    )
    :vars
    (
      ?auto_152999 - HOIST
      ?auto_153000 - PLACE
      ?auto_152996 - PLACE
      ?auto_152998 - HOIST
      ?auto_153001 - SURFACE
      ?auto_152997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152999 ?auto_153000 ) ( SURFACE-AT ?auto_152994 ?auto_153000 ) ( CLEAR ?auto_152994 ) ( IS-CRATE ?auto_152995 ) ( not ( = ?auto_152994 ?auto_152995 ) ) ( AVAILABLE ?auto_152999 ) ( ON ?auto_152994 ?auto_152993 ) ( not ( = ?auto_152993 ?auto_152994 ) ) ( not ( = ?auto_152993 ?auto_152995 ) ) ( not ( = ?auto_152996 ?auto_153000 ) ) ( HOIST-AT ?auto_152998 ?auto_152996 ) ( not ( = ?auto_152999 ?auto_152998 ) ) ( AVAILABLE ?auto_152998 ) ( SURFACE-AT ?auto_152995 ?auto_152996 ) ( ON ?auto_152995 ?auto_153001 ) ( CLEAR ?auto_152995 ) ( not ( = ?auto_152994 ?auto_153001 ) ) ( not ( = ?auto_152995 ?auto_153001 ) ) ( not ( = ?auto_152993 ?auto_153001 ) ) ( TRUCK-AT ?auto_152997 ?auto_153000 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152994 ?auto_152995 )
      ( MAKE-2CRATE-VERIFY ?auto_152993 ?auto_152994 ?auto_152995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153002 - SURFACE
      ?auto_153003 - SURFACE
    )
    :vars
    (
      ?auto_153007 - HOIST
      ?auto_153006 - PLACE
      ?auto_153010 - SURFACE
      ?auto_153005 - PLACE
      ?auto_153004 - HOIST
      ?auto_153008 - SURFACE
      ?auto_153009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153007 ?auto_153006 ) ( IS-CRATE ?auto_153003 ) ( not ( = ?auto_153002 ?auto_153003 ) ) ( not ( = ?auto_153010 ?auto_153002 ) ) ( not ( = ?auto_153010 ?auto_153003 ) ) ( not ( = ?auto_153005 ?auto_153006 ) ) ( HOIST-AT ?auto_153004 ?auto_153005 ) ( not ( = ?auto_153007 ?auto_153004 ) ) ( AVAILABLE ?auto_153004 ) ( SURFACE-AT ?auto_153003 ?auto_153005 ) ( ON ?auto_153003 ?auto_153008 ) ( CLEAR ?auto_153003 ) ( not ( = ?auto_153002 ?auto_153008 ) ) ( not ( = ?auto_153003 ?auto_153008 ) ) ( not ( = ?auto_153010 ?auto_153008 ) ) ( TRUCK-AT ?auto_153009 ?auto_153006 ) ( SURFACE-AT ?auto_153010 ?auto_153006 ) ( CLEAR ?auto_153010 ) ( LIFTING ?auto_153007 ?auto_153002 ) ( IS-CRATE ?auto_153002 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153010 ?auto_153002 )
      ( MAKE-2CRATE ?auto_153010 ?auto_153002 ?auto_153003 )
      ( MAKE-1CRATE-VERIFY ?auto_153002 ?auto_153003 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153011 - SURFACE
      ?auto_153012 - SURFACE
      ?auto_153013 - SURFACE
    )
    :vars
    (
      ?auto_153014 - HOIST
      ?auto_153019 - PLACE
      ?auto_153017 - PLACE
      ?auto_153016 - HOIST
      ?auto_153018 - SURFACE
      ?auto_153015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153014 ?auto_153019 ) ( IS-CRATE ?auto_153013 ) ( not ( = ?auto_153012 ?auto_153013 ) ) ( not ( = ?auto_153011 ?auto_153012 ) ) ( not ( = ?auto_153011 ?auto_153013 ) ) ( not ( = ?auto_153017 ?auto_153019 ) ) ( HOIST-AT ?auto_153016 ?auto_153017 ) ( not ( = ?auto_153014 ?auto_153016 ) ) ( AVAILABLE ?auto_153016 ) ( SURFACE-AT ?auto_153013 ?auto_153017 ) ( ON ?auto_153013 ?auto_153018 ) ( CLEAR ?auto_153013 ) ( not ( = ?auto_153012 ?auto_153018 ) ) ( not ( = ?auto_153013 ?auto_153018 ) ) ( not ( = ?auto_153011 ?auto_153018 ) ) ( TRUCK-AT ?auto_153015 ?auto_153019 ) ( SURFACE-AT ?auto_153011 ?auto_153019 ) ( CLEAR ?auto_153011 ) ( LIFTING ?auto_153014 ?auto_153012 ) ( IS-CRATE ?auto_153012 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153012 ?auto_153013 )
      ( MAKE-2CRATE-VERIFY ?auto_153011 ?auto_153012 ?auto_153013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153020 - SURFACE
      ?auto_153021 - SURFACE
    )
    :vars
    (
      ?auto_153022 - HOIST
      ?auto_153024 - PLACE
      ?auto_153023 - SURFACE
      ?auto_153027 - PLACE
      ?auto_153028 - HOIST
      ?auto_153026 - SURFACE
      ?auto_153025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153022 ?auto_153024 ) ( IS-CRATE ?auto_153021 ) ( not ( = ?auto_153020 ?auto_153021 ) ) ( not ( = ?auto_153023 ?auto_153020 ) ) ( not ( = ?auto_153023 ?auto_153021 ) ) ( not ( = ?auto_153027 ?auto_153024 ) ) ( HOIST-AT ?auto_153028 ?auto_153027 ) ( not ( = ?auto_153022 ?auto_153028 ) ) ( AVAILABLE ?auto_153028 ) ( SURFACE-AT ?auto_153021 ?auto_153027 ) ( ON ?auto_153021 ?auto_153026 ) ( CLEAR ?auto_153021 ) ( not ( = ?auto_153020 ?auto_153026 ) ) ( not ( = ?auto_153021 ?auto_153026 ) ) ( not ( = ?auto_153023 ?auto_153026 ) ) ( TRUCK-AT ?auto_153025 ?auto_153024 ) ( SURFACE-AT ?auto_153023 ?auto_153024 ) ( CLEAR ?auto_153023 ) ( IS-CRATE ?auto_153020 ) ( AVAILABLE ?auto_153022 ) ( IN ?auto_153020 ?auto_153025 ) )
    :subtasks
    ( ( !UNLOAD ?auto_153022 ?auto_153020 ?auto_153025 ?auto_153024 )
      ( MAKE-2CRATE ?auto_153023 ?auto_153020 ?auto_153021 )
      ( MAKE-1CRATE-VERIFY ?auto_153020 ?auto_153021 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153029 - SURFACE
      ?auto_153030 - SURFACE
      ?auto_153031 - SURFACE
    )
    :vars
    (
      ?auto_153035 - HOIST
      ?auto_153037 - PLACE
      ?auto_153032 - PLACE
      ?auto_153036 - HOIST
      ?auto_153034 - SURFACE
      ?auto_153033 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153035 ?auto_153037 ) ( IS-CRATE ?auto_153031 ) ( not ( = ?auto_153030 ?auto_153031 ) ) ( not ( = ?auto_153029 ?auto_153030 ) ) ( not ( = ?auto_153029 ?auto_153031 ) ) ( not ( = ?auto_153032 ?auto_153037 ) ) ( HOIST-AT ?auto_153036 ?auto_153032 ) ( not ( = ?auto_153035 ?auto_153036 ) ) ( AVAILABLE ?auto_153036 ) ( SURFACE-AT ?auto_153031 ?auto_153032 ) ( ON ?auto_153031 ?auto_153034 ) ( CLEAR ?auto_153031 ) ( not ( = ?auto_153030 ?auto_153034 ) ) ( not ( = ?auto_153031 ?auto_153034 ) ) ( not ( = ?auto_153029 ?auto_153034 ) ) ( TRUCK-AT ?auto_153033 ?auto_153037 ) ( SURFACE-AT ?auto_153029 ?auto_153037 ) ( CLEAR ?auto_153029 ) ( IS-CRATE ?auto_153030 ) ( AVAILABLE ?auto_153035 ) ( IN ?auto_153030 ?auto_153033 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153030 ?auto_153031 )
      ( MAKE-2CRATE-VERIFY ?auto_153029 ?auto_153030 ?auto_153031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153038 - SURFACE
      ?auto_153039 - SURFACE
    )
    :vars
    (
      ?auto_153044 - HOIST
      ?auto_153045 - PLACE
      ?auto_153042 - SURFACE
      ?auto_153046 - PLACE
      ?auto_153041 - HOIST
      ?auto_153040 - SURFACE
      ?auto_153043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153044 ?auto_153045 ) ( IS-CRATE ?auto_153039 ) ( not ( = ?auto_153038 ?auto_153039 ) ) ( not ( = ?auto_153042 ?auto_153038 ) ) ( not ( = ?auto_153042 ?auto_153039 ) ) ( not ( = ?auto_153046 ?auto_153045 ) ) ( HOIST-AT ?auto_153041 ?auto_153046 ) ( not ( = ?auto_153044 ?auto_153041 ) ) ( AVAILABLE ?auto_153041 ) ( SURFACE-AT ?auto_153039 ?auto_153046 ) ( ON ?auto_153039 ?auto_153040 ) ( CLEAR ?auto_153039 ) ( not ( = ?auto_153038 ?auto_153040 ) ) ( not ( = ?auto_153039 ?auto_153040 ) ) ( not ( = ?auto_153042 ?auto_153040 ) ) ( SURFACE-AT ?auto_153042 ?auto_153045 ) ( CLEAR ?auto_153042 ) ( IS-CRATE ?auto_153038 ) ( AVAILABLE ?auto_153044 ) ( IN ?auto_153038 ?auto_153043 ) ( TRUCK-AT ?auto_153043 ?auto_153046 ) )
    :subtasks
    ( ( !DRIVE ?auto_153043 ?auto_153046 ?auto_153045 )
      ( MAKE-2CRATE ?auto_153042 ?auto_153038 ?auto_153039 )
      ( MAKE-1CRATE-VERIFY ?auto_153038 ?auto_153039 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153047 - SURFACE
      ?auto_153048 - SURFACE
      ?auto_153049 - SURFACE
    )
    :vars
    (
      ?auto_153051 - HOIST
      ?auto_153052 - PLACE
      ?auto_153050 - PLACE
      ?auto_153054 - HOIST
      ?auto_153055 - SURFACE
      ?auto_153053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153051 ?auto_153052 ) ( IS-CRATE ?auto_153049 ) ( not ( = ?auto_153048 ?auto_153049 ) ) ( not ( = ?auto_153047 ?auto_153048 ) ) ( not ( = ?auto_153047 ?auto_153049 ) ) ( not ( = ?auto_153050 ?auto_153052 ) ) ( HOIST-AT ?auto_153054 ?auto_153050 ) ( not ( = ?auto_153051 ?auto_153054 ) ) ( AVAILABLE ?auto_153054 ) ( SURFACE-AT ?auto_153049 ?auto_153050 ) ( ON ?auto_153049 ?auto_153055 ) ( CLEAR ?auto_153049 ) ( not ( = ?auto_153048 ?auto_153055 ) ) ( not ( = ?auto_153049 ?auto_153055 ) ) ( not ( = ?auto_153047 ?auto_153055 ) ) ( SURFACE-AT ?auto_153047 ?auto_153052 ) ( CLEAR ?auto_153047 ) ( IS-CRATE ?auto_153048 ) ( AVAILABLE ?auto_153051 ) ( IN ?auto_153048 ?auto_153053 ) ( TRUCK-AT ?auto_153053 ?auto_153050 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153048 ?auto_153049 )
      ( MAKE-2CRATE-VERIFY ?auto_153047 ?auto_153048 ?auto_153049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153056 - SURFACE
      ?auto_153057 - SURFACE
    )
    :vars
    (
      ?auto_153063 - HOIST
      ?auto_153062 - PLACE
      ?auto_153058 - SURFACE
      ?auto_153061 - PLACE
      ?auto_153064 - HOIST
      ?auto_153060 - SURFACE
      ?auto_153059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153063 ?auto_153062 ) ( IS-CRATE ?auto_153057 ) ( not ( = ?auto_153056 ?auto_153057 ) ) ( not ( = ?auto_153058 ?auto_153056 ) ) ( not ( = ?auto_153058 ?auto_153057 ) ) ( not ( = ?auto_153061 ?auto_153062 ) ) ( HOIST-AT ?auto_153064 ?auto_153061 ) ( not ( = ?auto_153063 ?auto_153064 ) ) ( SURFACE-AT ?auto_153057 ?auto_153061 ) ( ON ?auto_153057 ?auto_153060 ) ( CLEAR ?auto_153057 ) ( not ( = ?auto_153056 ?auto_153060 ) ) ( not ( = ?auto_153057 ?auto_153060 ) ) ( not ( = ?auto_153058 ?auto_153060 ) ) ( SURFACE-AT ?auto_153058 ?auto_153062 ) ( CLEAR ?auto_153058 ) ( IS-CRATE ?auto_153056 ) ( AVAILABLE ?auto_153063 ) ( TRUCK-AT ?auto_153059 ?auto_153061 ) ( LIFTING ?auto_153064 ?auto_153056 ) )
    :subtasks
    ( ( !LOAD ?auto_153064 ?auto_153056 ?auto_153059 ?auto_153061 )
      ( MAKE-2CRATE ?auto_153058 ?auto_153056 ?auto_153057 )
      ( MAKE-1CRATE-VERIFY ?auto_153056 ?auto_153057 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153065 - SURFACE
      ?auto_153066 - SURFACE
      ?auto_153067 - SURFACE
    )
    :vars
    (
      ?auto_153070 - HOIST
      ?auto_153069 - PLACE
      ?auto_153068 - PLACE
      ?auto_153073 - HOIST
      ?auto_153072 - SURFACE
      ?auto_153071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153070 ?auto_153069 ) ( IS-CRATE ?auto_153067 ) ( not ( = ?auto_153066 ?auto_153067 ) ) ( not ( = ?auto_153065 ?auto_153066 ) ) ( not ( = ?auto_153065 ?auto_153067 ) ) ( not ( = ?auto_153068 ?auto_153069 ) ) ( HOIST-AT ?auto_153073 ?auto_153068 ) ( not ( = ?auto_153070 ?auto_153073 ) ) ( SURFACE-AT ?auto_153067 ?auto_153068 ) ( ON ?auto_153067 ?auto_153072 ) ( CLEAR ?auto_153067 ) ( not ( = ?auto_153066 ?auto_153072 ) ) ( not ( = ?auto_153067 ?auto_153072 ) ) ( not ( = ?auto_153065 ?auto_153072 ) ) ( SURFACE-AT ?auto_153065 ?auto_153069 ) ( CLEAR ?auto_153065 ) ( IS-CRATE ?auto_153066 ) ( AVAILABLE ?auto_153070 ) ( TRUCK-AT ?auto_153071 ?auto_153068 ) ( LIFTING ?auto_153073 ?auto_153066 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153066 ?auto_153067 )
      ( MAKE-2CRATE-VERIFY ?auto_153065 ?auto_153066 ?auto_153067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153074 - SURFACE
      ?auto_153075 - SURFACE
    )
    :vars
    (
      ?auto_153078 - HOIST
      ?auto_153081 - PLACE
      ?auto_153080 - SURFACE
      ?auto_153077 - PLACE
      ?auto_153076 - HOIST
      ?auto_153082 - SURFACE
      ?auto_153079 - TRUCK
      ?auto_153083 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153078 ?auto_153081 ) ( IS-CRATE ?auto_153075 ) ( not ( = ?auto_153074 ?auto_153075 ) ) ( not ( = ?auto_153080 ?auto_153074 ) ) ( not ( = ?auto_153080 ?auto_153075 ) ) ( not ( = ?auto_153077 ?auto_153081 ) ) ( HOIST-AT ?auto_153076 ?auto_153077 ) ( not ( = ?auto_153078 ?auto_153076 ) ) ( SURFACE-AT ?auto_153075 ?auto_153077 ) ( ON ?auto_153075 ?auto_153082 ) ( CLEAR ?auto_153075 ) ( not ( = ?auto_153074 ?auto_153082 ) ) ( not ( = ?auto_153075 ?auto_153082 ) ) ( not ( = ?auto_153080 ?auto_153082 ) ) ( SURFACE-AT ?auto_153080 ?auto_153081 ) ( CLEAR ?auto_153080 ) ( IS-CRATE ?auto_153074 ) ( AVAILABLE ?auto_153078 ) ( TRUCK-AT ?auto_153079 ?auto_153077 ) ( AVAILABLE ?auto_153076 ) ( SURFACE-AT ?auto_153074 ?auto_153077 ) ( ON ?auto_153074 ?auto_153083 ) ( CLEAR ?auto_153074 ) ( not ( = ?auto_153074 ?auto_153083 ) ) ( not ( = ?auto_153075 ?auto_153083 ) ) ( not ( = ?auto_153080 ?auto_153083 ) ) ( not ( = ?auto_153082 ?auto_153083 ) ) )
    :subtasks
    ( ( !LIFT ?auto_153076 ?auto_153074 ?auto_153083 ?auto_153077 )
      ( MAKE-2CRATE ?auto_153080 ?auto_153074 ?auto_153075 )
      ( MAKE-1CRATE-VERIFY ?auto_153074 ?auto_153075 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153084 - SURFACE
      ?auto_153085 - SURFACE
      ?auto_153086 - SURFACE
    )
    :vars
    (
      ?auto_153092 - HOIST
      ?auto_153088 - PLACE
      ?auto_153091 - PLACE
      ?auto_153090 - HOIST
      ?auto_153089 - SURFACE
      ?auto_153093 - TRUCK
      ?auto_153087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153092 ?auto_153088 ) ( IS-CRATE ?auto_153086 ) ( not ( = ?auto_153085 ?auto_153086 ) ) ( not ( = ?auto_153084 ?auto_153085 ) ) ( not ( = ?auto_153084 ?auto_153086 ) ) ( not ( = ?auto_153091 ?auto_153088 ) ) ( HOIST-AT ?auto_153090 ?auto_153091 ) ( not ( = ?auto_153092 ?auto_153090 ) ) ( SURFACE-AT ?auto_153086 ?auto_153091 ) ( ON ?auto_153086 ?auto_153089 ) ( CLEAR ?auto_153086 ) ( not ( = ?auto_153085 ?auto_153089 ) ) ( not ( = ?auto_153086 ?auto_153089 ) ) ( not ( = ?auto_153084 ?auto_153089 ) ) ( SURFACE-AT ?auto_153084 ?auto_153088 ) ( CLEAR ?auto_153084 ) ( IS-CRATE ?auto_153085 ) ( AVAILABLE ?auto_153092 ) ( TRUCK-AT ?auto_153093 ?auto_153091 ) ( AVAILABLE ?auto_153090 ) ( SURFACE-AT ?auto_153085 ?auto_153091 ) ( ON ?auto_153085 ?auto_153087 ) ( CLEAR ?auto_153085 ) ( not ( = ?auto_153085 ?auto_153087 ) ) ( not ( = ?auto_153086 ?auto_153087 ) ) ( not ( = ?auto_153084 ?auto_153087 ) ) ( not ( = ?auto_153089 ?auto_153087 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153085 ?auto_153086 )
      ( MAKE-2CRATE-VERIFY ?auto_153084 ?auto_153085 ?auto_153086 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153094 - SURFACE
      ?auto_153095 - SURFACE
    )
    :vars
    (
      ?auto_153102 - HOIST
      ?auto_153100 - PLACE
      ?auto_153097 - SURFACE
      ?auto_153096 - PLACE
      ?auto_153101 - HOIST
      ?auto_153099 - SURFACE
      ?auto_153103 - SURFACE
      ?auto_153098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153102 ?auto_153100 ) ( IS-CRATE ?auto_153095 ) ( not ( = ?auto_153094 ?auto_153095 ) ) ( not ( = ?auto_153097 ?auto_153094 ) ) ( not ( = ?auto_153097 ?auto_153095 ) ) ( not ( = ?auto_153096 ?auto_153100 ) ) ( HOIST-AT ?auto_153101 ?auto_153096 ) ( not ( = ?auto_153102 ?auto_153101 ) ) ( SURFACE-AT ?auto_153095 ?auto_153096 ) ( ON ?auto_153095 ?auto_153099 ) ( CLEAR ?auto_153095 ) ( not ( = ?auto_153094 ?auto_153099 ) ) ( not ( = ?auto_153095 ?auto_153099 ) ) ( not ( = ?auto_153097 ?auto_153099 ) ) ( SURFACE-AT ?auto_153097 ?auto_153100 ) ( CLEAR ?auto_153097 ) ( IS-CRATE ?auto_153094 ) ( AVAILABLE ?auto_153102 ) ( AVAILABLE ?auto_153101 ) ( SURFACE-AT ?auto_153094 ?auto_153096 ) ( ON ?auto_153094 ?auto_153103 ) ( CLEAR ?auto_153094 ) ( not ( = ?auto_153094 ?auto_153103 ) ) ( not ( = ?auto_153095 ?auto_153103 ) ) ( not ( = ?auto_153097 ?auto_153103 ) ) ( not ( = ?auto_153099 ?auto_153103 ) ) ( TRUCK-AT ?auto_153098 ?auto_153100 ) )
    :subtasks
    ( ( !DRIVE ?auto_153098 ?auto_153100 ?auto_153096 )
      ( MAKE-2CRATE ?auto_153097 ?auto_153094 ?auto_153095 )
      ( MAKE-1CRATE-VERIFY ?auto_153094 ?auto_153095 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_153104 - SURFACE
      ?auto_153105 - SURFACE
      ?auto_153106 - SURFACE
    )
    :vars
    (
      ?auto_153110 - HOIST
      ?auto_153107 - PLACE
      ?auto_153113 - PLACE
      ?auto_153109 - HOIST
      ?auto_153112 - SURFACE
      ?auto_153111 - SURFACE
      ?auto_153108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153110 ?auto_153107 ) ( IS-CRATE ?auto_153106 ) ( not ( = ?auto_153105 ?auto_153106 ) ) ( not ( = ?auto_153104 ?auto_153105 ) ) ( not ( = ?auto_153104 ?auto_153106 ) ) ( not ( = ?auto_153113 ?auto_153107 ) ) ( HOIST-AT ?auto_153109 ?auto_153113 ) ( not ( = ?auto_153110 ?auto_153109 ) ) ( SURFACE-AT ?auto_153106 ?auto_153113 ) ( ON ?auto_153106 ?auto_153112 ) ( CLEAR ?auto_153106 ) ( not ( = ?auto_153105 ?auto_153112 ) ) ( not ( = ?auto_153106 ?auto_153112 ) ) ( not ( = ?auto_153104 ?auto_153112 ) ) ( SURFACE-AT ?auto_153104 ?auto_153107 ) ( CLEAR ?auto_153104 ) ( IS-CRATE ?auto_153105 ) ( AVAILABLE ?auto_153110 ) ( AVAILABLE ?auto_153109 ) ( SURFACE-AT ?auto_153105 ?auto_153113 ) ( ON ?auto_153105 ?auto_153111 ) ( CLEAR ?auto_153105 ) ( not ( = ?auto_153105 ?auto_153111 ) ) ( not ( = ?auto_153106 ?auto_153111 ) ) ( not ( = ?auto_153104 ?auto_153111 ) ) ( not ( = ?auto_153112 ?auto_153111 ) ) ( TRUCK-AT ?auto_153108 ?auto_153107 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153105 ?auto_153106 )
      ( MAKE-2CRATE-VERIFY ?auto_153104 ?auto_153105 ?auto_153106 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153132 - SURFACE
      ?auto_153133 - SURFACE
      ?auto_153134 - SURFACE
      ?auto_153135 - SURFACE
    )
    :vars
    (
      ?auto_153137 - HOIST
      ?auto_153136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153137 ?auto_153136 ) ( SURFACE-AT ?auto_153134 ?auto_153136 ) ( CLEAR ?auto_153134 ) ( LIFTING ?auto_153137 ?auto_153135 ) ( IS-CRATE ?auto_153135 ) ( not ( = ?auto_153134 ?auto_153135 ) ) ( ON ?auto_153133 ?auto_153132 ) ( ON ?auto_153134 ?auto_153133 ) ( not ( = ?auto_153132 ?auto_153133 ) ) ( not ( = ?auto_153132 ?auto_153134 ) ) ( not ( = ?auto_153132 ?auto_153135 ) ) ( not ( = ?auto_153133 ?auto_153134 ) ) ( not ( = ?auto_153133 ?auto_153135 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153134 ?auto_153135 )
      ( MAKE-3CRATE-VERIFY ?auto_153132 ?auto_153133 ?auto_153134 ?auto_153135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153149 - SURFACE
      ?auto_153150 - SURFACE
      ?auto_153151 - SURFACE
      ?auto_153152 - SURFACE
    )
    :vars
    (
      ?auto_153155 - HOIST
      ?auto_153154 - PLACE
      ?auto_153153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153155 ?auto_153154 ) ( SURFACE-AT ?auto_153151 ?auto_153154 ) ( CLEAR ?auto_153151 ) ( IS-CRATE ?auto_153152 ) ( not ( = ?auto_153151 ?auto_153152 ) ) ( TRUCK-AT ?auto_153153 ?auto_153154 ) ( AVAILABLE ?auto_153155 ) ( IN ?auto_153152 ?auto_153153 ) ( ON ?auto_153151 ?auto_153150 ) ( not ( = ?auto_153150 ?auto_153151 ) ) ( not ( = ?auto_153150 ?auto_153152 ) ) ( ON ?auto_153150 ?auto_153149 ) ( not ( = ?auto_153149 ?auto_153150 ) ) ( not ( = ?auto_153149 ?auto_153151 ) ) ( not ( = ?auto_153149 ?auto_153152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153150 ?auto_153151 ?auto_153152 )
      ( MAKE-3CRATE-VERIFY ?auto_153149 ?auto_153150 ?auto_153151 ?auto_153152 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153170 - SURFACE
      ?auto_153171 - SURFACE
      ?auto_153172 - SURFACE
      ?auto_153173 - SURFACE
    )
    :vars
    (
      ?auto_153174 - HOIST
      ?auto_153177 - PLACE
      ?auto_153175 - TRUCK
      ?auto_153176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153174 ?auto_153177 ) ( SURFACE-AT ?auto_153172 ?auto_153177 ) ( CLEAR ?auto_153172 ) ( IS-CRATE ?auto_153173 ) ( not ( = ?auto_153172 ?auto_153173 ) ) ( AVAILABLE ?auto_153174 ) ( IN ?auto_153173 ?auto_153175 ) ( ON ?auto_153172 ?auto_153171 ) ( not ( = ?auto_153171 ?auto_153172 ) ) ( not ( = ?auto_153171 ?auto_153173 ) ) ( TRUCK-AT ?auto_153175 ?auto_153176 ) ( not ( = ?auto_153176 ?auto_153177 ) ) ( ON ?auto_153171 ?auto_153170 ) ( not ( = ?auto_153170 ?auto_153171 ) ) ( not ( = ?auto_153170 ?auto_153172 ) ) ( not ( = ?auto_153170 ?auto_153173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153171 ?auto_153172 ?auto_153173 )
      ( MAKE-3CRATE-VERIFY ?auto_153170 ?auto_153171 ?auto_153172 ?auto_153173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153194 - SURFACE
      ?auto_153195 - SURFACE
      ?auto_153196 - SURFACE
      ?auto_153197 - SURFACE
    )
    :vars
    (
      ?auto_153200 - HOIST
      ?auto_153198 - PLACE
      ?auto_153199 - TRUCK
      ?auto_153202 - PLACE
      ?auto_153201 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_153200 ?auto_153198 ) ( SURFACE-AT ?auto_153196 ?auto_153198 ) ( CLEAR ?auto_153196 ) ( IS-CRATE ?auto_153197 ) ( not ( = ?auto_153196 ?auto_153197 ) ) ( AVAILABLE ?auto_153200 ) ( ON ?auto_153196 ?auto_153195 ) ( not ( = ?auto_153195 ?auto_153196 ) ) ( not ( = ?auto_153195 ?auto_153197 ) ) ( TRUCK-AT ?auto_153199 ?auto_153202 ) ( not ( = ?auto_153202 ?auto_153198 ) ) ( HOIST-AT ?auto_153201 ?auto_153202 ) ( LIFTING ?auto_153201 ?auto_153197 ) ( not ( = ?auto_153200 ?auto_153201 ) ) ( ON ?auto_153195 ?auto_153194 ) ( not ( = ?auto_153194 ?auto_153195 ) ) ( not ( = ?auto_153194 ?auto_153196 ) ) ( not ( = ?auto_153194 ?auto_153197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153195 ?auto_153196 ?auto_153197 )
      ( MAKE-3CRATE-VERIFY ?auto_153194 ?auto_153195 ?auto_153196 ?auto_153197 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153221 - SURFACE
      ?auto_153222 - SURFACE
      ?auto_153223 - SURFACE
      ?auto_153224 - SURFACE
    )
    :vars
    (
      ?auto_153227 - HOIST
      ?auto_153226 - PLACE
      ?auto_153225 - TRUCK
      ?auto_153228 - PLACE
      ?auto_153229 - HOIST
      ?auto_153230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153227 ?auto_153226 ) ( SURFACE-AT ?auto_153223 ?auto_153226 ) ( CLEAR ?auto_153223 ) ( IS-CRATE ?auto_153224 ) ( not ( = ?auto_153223 ?auto_153224 ) ) ( AVAILABLE ?auto_153227 ) ( ON ?auto_153223 ?auto_153222 ) ( not ( = ?auto_153222 ?auto_153223 ) ) ( not ( = ?auto_153222 ?auto_153224 ) ) ( TRUCK-AT ?auto_153225 ?auto_153228 ) ( not ( = ?auto_153228 ?auto_153226 ) ) ( HOIST-AT ?auto_153229 ?auto_153228 ) ( not ( = ?auto_153227 ?auto_153229 ) ) ( AVAILABLE ?auto_153229 ) ( SURFACE-AT ?auto_153224 ?auto_153228 ) ( ON ?auto_153224 ?auto_153230 ) ( CLEAR ?auto_153224 ) ( not ( = ?auto_153223 ?auto_153230 ) ) ( not ( = ?auto_153224 ?auto_153230 ) ) ( not ( = ?auto_153222 ?auto_153230 ) ) ( ON ?auto_153222 ?auto_153221 ) ( not ( = ?auto_153221 ?auto_153222 ) ) ( not ( = ?auto_153221 ?auto_153223 ) ) ( not ( = ?auto_153221 ?auto_153224 ) ) ( not ( = ?auto_153221 ?auto_153230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153222 ?auto_153223 ?auto_153224 )
      ( MAKE-3CRATE-VERIFY ?auto_153221 ?auto_153222 ?auto_153223 ?auto_153224 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153249 - SURFACE
      ?auto_153250 - SURFACE
      ?auto_153251 - SURFACE
      ?auto_153252 - SURFACE
    )
    :vars
    (
      ?auto_153254 - HOIST
      ?auto_153257 - PLACE
      ?auto_153255 - PLACE
      ?auto_153258 - HOIST
      ?auto_153253 - SURFACE
      ?auto_153256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153254 ?auto_153257 ) ( SURFACE-AT ?auto_153251 ?auto_153257 ) ( CLEAR ?auto_153251 ) ( IS-CRATE ?auto_153252 ) ( not ( = ?auto_153251 ?auto_153252 ) ) ( AVAILABLE ?auto_153254 ) ( ON ?auto_153251 ?auto_153250 ) ( not ( = ?auto_153250 ?auto_153251 ) ) ( not ( = ?auto_153250 ?auto_153252 ) ) ( not ( = ?auto_153255 ?auto_153257 ) ) ( HOIST-AT ?auto_153258 ?auto_153255 ) ( not ( = ?auto_153254 ?auto_153258 ) ) ( AVAILABLE ?auto_153258 ) ( SURFACE-AT ?auto_153252 ?auto_153255 ) ( ON ?auto_153252 ?auto_153253 ) ( CLEAR ?auto_153252 ) ( not ( = ?auto_153251 ?auto_153253 ) ) ( not ( = ?auto_153252 ?auto_153253 ) ) ( not ( = ?auto_153250 ?auto_153253 ) ) ( TRUCK-AT ?auto_153256 ?auto_153257 ) ( ON ?auto_153250 ?auto_153249 ) ( not ( = ?auto_153249 ?auto_153250 ) ) ( not ( = ?auto_153249 ?auto_153251 ) ) ( not ( = ?auto_153249 ?auto_153252 ) ) ( not ( = ?auto_153249 ?auto_153253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153250 ?auto_153251 ?auto_153252 )
      ( MAKE-3CRATE-VERIFY ?auto_153249 ?auto_153250 ?auto_153251 ?auto_153252 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153277 - SURFACE
      ?auto_153278 - SURFACE
      ?auto_153279 - SURFACE
      ?auto_153280 - SURFACE
    )
    :vars
    (
      ?auto_153283 - HOIST
      ?auto_153284 - PLACE
      ?auto_153282 - PLACE
      ?auto_153285 - HOIST
      ?auto_153281 - SURFACE
      ?auto_153286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153283 ?auto_153284 ) ( IS-CRATE ?auto_153280 ) ( not ( = ?auto_153279 ?auto_153280 ) ) ( not ( = ?auto_153278 ?auto_153279 ) ) ( not ( = ?auto_153278 ?auto_153280 ) ) ( not ( = ?auto_153282 ?auto_153284 ) ) ( HOIST-AT ?auto_153285 ?auto_153282 ) ( not ( = ?auto_153283 ?auto_153285 ) ) ( AVAILABLE ?auto_153285 ) ( SURFACE-AT ?auto_153280 ?auto_153282 ) ( ON ?auto_153280 ?auto_153281 ) ( CLEAR ?auto_153280 ) ( not ( = ?auto_153279 ?auto_153281 ) ) ( not ( = ?auto_153280 ?auto_153281 ) ) ( not ( = ?auto_153278 ?auto_153281 ) ) ( TRUCK-AT ?auto_153286 ?auto_153284 ) ( SURFACE-AT ?auto_153278 ?auto_153284 ) ( CLEAR ?auto_153278 ) ( LIFTING ?auto_153283 ?auto_153279 ) ( IS-CRATE ?auto_153279 ) ( ON ?auto_153278 ?auto_153277 ) ( not ( = ?auto_153277 ?auto_153278 ) ) ( not ( = ?auto_153277 ?auto_153279 ) ) ( not ( = ?auto_153277 ?auto_153280 ) ) ( not ( = ?auto_153277 ?auto_153281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153278 ?auto_153279 ?auto_153280 )
      ( MAKE-3CRATE-VERIFY ?auto_153277 ?auto_153278 ?auto_153279 ?auto_153280 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153305 - SURFACE
      ?auto_153306 - SURFACE
      ?auto_153307 - SURFACE
      ?auto_153308 - SURFACE
    )
    :vars
    (
      ?auto_153310 - HOIST
      ?auto_153309 - PLACE
      ?auto_153313 - PLACE
      ?auto_153312 - HOIST
      ?auto_153311 - SURFACE
      ?auto_153314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153310 ?auto_153309 ) ( IS-CRATE ?auto_153308 ) ( not ( = ?auto_153307 ?auto_153308 ) ) ( not ( = ?auto_153306 ?auto_153307 ) ) ( not ( = ?auto_153306 ?auto_153308 ) ) ( not ( = ?auto_153313 ?auto_153309 ) ) ( HOIST-AT ?auto_153312 ?auto_153313 ) ( not ( = ?auto_153310 ?auto_153312 ) ) ( AVAILABLE ?auto_153312 ) ( SURFACE-AT ?auto_153308 ?auto_153313 ) ( ON ?auto_153308 ?auto_153311 ) ( CLEAR ?auto_153308 ) ( not ( = ?auto_153307 ?auto_153311 ) ) ( not ( = ?auto_153308 ?auto_153311 ) ) ( not ( = ?auto_153306 ?auto_153311 ) ) ( TRUCK-AT ?auto_153314 ?auto_153309 ) ( SURFACE-AT ?auto_153306 ?auto_153309 ) ( CLEAR ?auto_153306 ) ( IS-CRATE ?auto_153307 ) ( AVAILABLE ?auto_153310 ) ( IN ?auto_153307 ?auto_153314 ) ( ON ?auto_153306 ?auto_153305 ) ( not ( = ?auto_153305 ?auto_153306 ) ) ( not ( = ?auto_153305 ?auto_153307 ) ) ( not ( = ?auto_153305 ?auto_153308 ) ) ( not ( = ?auto_153305 ?auto_153311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153306 ?auto_153307 ?auto_153308 )
      ( MAKE-3CRATE-VERIFY ?auto_153305 ?auto_153306 ?auto_153307 ?auto_153308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153384 - SURFACE
      ?auto_153385 - SURFACE
    )
    :vars
    (
      ?auto_153390 - HOIST
      ?auto_153392 - PLACE
      ?auto_153386 - SURFACE
      ?auto_153391 - PLACE
      ?auto_153387 - HOIST
      ?auto_153389 - SURFACE
      ?auto_153388 - TRUCK
      ?auto_153393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153390 ?auto_153392 ) ( SURFACE-AT ?auto_153384 ?auto_153392 ) ( CLEAR ?auto_153384 ) ( IS-CRATE ?auto_153385 ) ( not ( = ?auto_153384 ?auto_153385 ) ) ( AVAILABLE ?auto_153390 ) ( ON ?auto_153384 ?auto_153386 ) ( not ( = ?auto_153386 ?auto_153384 ) ) ( not ( = ?auto_153386 ?auto_153385 ) ) ( not ( = ?auto_153391 ?auto_153392 ) ) ( HOIST-AT ?auto_153387 ?auto_153391 ) ( not ( = ?auto_153390 ?auto_153387 ) ) ( AVAILABLE ?auto_153387 ) ( SURFACE-AT ?auto_153385 ?auto_153391 ) ( ON ?auto_153385 ?auto_153389 ) ( CLEAR ?auto_153385 ) ( not ( = ?auto_153384 ?auto_153389 ) ) ( not ( = ?auto_153385 ?auto_153389 ) ) ( not ( = ?auto_153386 ?auto_153389 ) ) ( TRUCK-AT ?auto_153388 ?auto_153393 ) ( not ( = ?auto_153393 ?auto_153392 ) ) ( not ( = ?auto_153391 ?auto_153393 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_153388 ?auto_153393 ?auto_153392 )
      ( MAKE-1CRATE ?auto_153384 ?auto_153385 )
      ( MAKE-1CRATE-VERIFY ?auto_153384 ?auto_153385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_153490 - SURFACE
      ?auto_153491 - SURFACE
    )
    :vars
    (
      ?auto_153493 - HOIST
      ?auto_153497 - PLACE
      ?auto_153492 - SURFACE
      ?auto_153498 - PLACE
      ?auto_153494 - HOIST
      ?auto_153496 - SURFACE
      ?auto_153495 - TRUCK
      ?auto_153499 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153493 ?auto_153497 ) ( SURFACE-AT ?auto_153490 ?auto_153497 ) ( CLEAR ?auto_153490 ) ( IS-CRATE ?auto_153491 ) ( not ( = ?auto_153490 ?auto_153491 ) ) ( ON ?auto_153490 ?auto_153492 ) ( not ( = ?auto_153492 ?auto_153490 ) ) ( not ( = ?auto_153492 ?auto_153491 ) ) ( not ( = ?auto_153498 ?auto_153497 ) ) ( HOIST-AT ?auto_153494 ?auto_153498 ) ( not ( = ?auto_153493 ?auto_153494 ) ) ( AVAILABLE ?auto_153494 ) ( SURFACE-AT ?auto_153491 ?auto_153498 ) ( ON ?auto_153491 ?auto_153496 ) ( CLEAR ?auto_153491 ) ( not ( = ?auto_153490 ?auto_153496 ) ) ( not ( = ?auto_153491 ?auto_153496 ) ) ( not ( = ?auto_153492 ?auto_153496 ) ) ( TRUCK-AT ?auto_153495 ?auto_153497 ) ( LIFTING ?auto_153493 ?auto_153499 ) ( IS-CRATE ?auto_153499 ) ( not ( = ?auto_153490 ?auto_153499 ) ) ( not ( = ?auto_153491 ?auto_153499 ) ) ( not ( = ?auto_153492 ?auto_153499 ) ) ( not ( = ?auto_153496 ?auto_153499 ) ) )
    :subtasks
    ( ( !LOAD ?auto_153493 ?auto_153499 ?auto_153495 ?auto_153497 )
      ( MAKE-1CRATE ?auto_153490 ?auto_153491 )
      ( MAKE-1CRATE-VERIFY ?auto_153490 ?auto_153491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153598 - SURFACE
      ?auto_153599 - SURFACE
      ?auto_153600 - SURFACE
      ?auto_153601 - SURFACE
      ?auto_153602 - SURFACE
    )
    :vars
    (
      ?auto_153603 - HOIST
      ?auto_153604 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153603 ?auto_153604 ) ( SURFACE-AT ?auto_153601 ?auto_153604 ) ( CLEAR ?auto_153601 ) ( LIFTING ?auto_153603 ?auto_153602 ) ( IS-CRATE ?auto_153602 ) ( not ( = ?auto_153601 ?auto_153602 ) ) ( ON ?auto_153599 ?auto_153598 ) ( ON ?auto_153600 ?auto_153599 ) ( ON ?auto_153601 ?auto_153600 ) ( not ( = ?auto_153598 ?auto_153599 ) ) ( not ( = ?auto_153598 ?auto_153600 ) ) ( not ( = ?auto_153598 ?auto_153601 ) ) ( not ( = ?auto_153598 ?auto_153602 ) ) ( not ( = ?auto_153599 ?auto_153600 ) ) ( not ( = ?auto_153599 ?auto_153601 ) ) ( not ( = ?auto_153599 ?auto_153602 ) ) ( not ( = ?auto_153600 ?auto_153601 ) ) ( not ( = ?auto_153600 ?auto_153602 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153601 ?auto_153602 )
      ( MAKE-4CRATE-VERIFY ?auto_153598 ?auto_153599 ?auto_153600 ?auto_153601 ?auto_153602 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153623 - SURFACE
      ?auto_153624 - SURFACE
      ?auto_153625 - SURFACE
      ?auto_153626 - SURFACE
      ?auto_153627 - SURFACE
    )
    :vars
    (
      ?auto_153628 - HOIST
      ?auto_153629 - PLACE
      ?auto_153630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153628 ?auto_153629 ) ( SURFACE-AT ?auto_153626 ?auto_153629 ) ( CLEAR ?auto_153626 ) ( IS-CRATE ?auto_153627 ) ( not ( = ?auto_153626 ?auto_153627 ) ) ( TRUCK-AT ?auto_153630 ?auto_153629 ) ( AVAILABLE ?auto_153628 ) ( IN ?auto_153627 ?auto_153630 ) ( ON ?auto_153626 ?auto_153625 ) ( not ( = ?auto_153625 ?auto_153626 ) ) ( not ( = ?auto_153625 ?auto_153627 ) ) ( ON ?auto_153624 ?auto_153623 ) ( ON ?auto_153625 ?auto_153624 ) ( not ( = ?auto_153623 ?auto_153624 ) ) ( not ( = ?auto_153623 ?auto_153625 ) ) ( not ( = ?auto_153623 ?auto_153626 ) ) ( not ( = ?auto_153623 ?auto_153627 ) ) ( not ( = ?auto_153624 ?auto_153625 ) ) ( not ( = ?auto_153624 ?auto_153626 ) ) ( not ( = ?auto_153624 ?auto_153627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153625 ?auto_153626 ?auto_153627 )
      ( MAKE-4CRATE-VERIFY ?auto_153623 ?auto_153624 ?auto_153625 ?auto_153626 ?auto_153627 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153653 - SURFACE
      ?auto_153654 - SURFACE
      ?auto_153655 - SURFACE
      ?auto_153656 - SURFACE
      ?auto_153657 - SURFACE
    )
    :vars
    (
      ?auto_153658 - HOIST
      ?auto_153660 - PLACE
      ?auto_153659 - TRUCK
      ?auto_153661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153658 ?auto_153660 ) ( SURFACE-AT ?auto_153656 ?auto_153660 ) ( CLEAR ?auto_153656 ) ( IS-CRATE ?auto_153657 ) ( not ( = ?auto_153656 ?auto_153657 ) ) ( AVAILABLE ?auto_153658 ) ( IN ?auto_153657 ?auto_153659 ) ( ON ?auto_153656 ?auto_153655 ) ( not ( = ?auto_153655 ?auto_153656 ) ) ( not ( = ?auto_153655 ?auto_153657 ) ) ( TRUCK-AT ?auto_153659 ?auto_153661 ) ( not ( = ?auto_153661 ?auto_153660 ) ) ( ON ?auto_153654 ?auto_153653 ) ( ON ?auto_153655 ?auto_153654 ) ( not ( = ?auto_153653 ?auto_153654 ) ) ( not ( = ?auto_153653 ?auto_153655 ) ) ( not ( = ?auto_153653 ?auto_153656 ) ) ( not ( = ?auto_153653 ?auto_153657 ) ) ( not ( = ?auto_153654 ?auto_153655 ) ) ( not ( = ?auto_153654 ?auto_153656 ) ) ( not ( = ?auto_153654 ?auto_153657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153655 ?auto_153656 ?auto_153657 )
      ( MAKE-4CRATE-VERIFY ?auto_153653 ?auto_153654 ?auto_153655 ?auto_153656 ?auto_153657 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153687 - SURFACE
      ?auto_153688 - SURFACE
      ?auto_153689 - SURFACE
      ?auto_153690 - SURFACE
      ?auto_153691 - SURFACE
    )
    :vars
    (
      ?auto_153692 - HOIST
      ?auto_153695 - PLACE
      ?auto_153696 - TRUCK
      ?auto_153694 - PLACE
      ?auto_153693 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_153692 ?auto_153695 ) ( SURFACE-AT ?auto_153690 ?auto_153695 ) ( CLEAR ?auto_153690 ) ( IS-CRATE ?auto_153691 ) ( not ( = ?auto_153690 ?auto_153691 ) ) ( AVAILABLE ?auto_153692 ) ( ON ?auto_153690 ?auto_153689 ) ( not ( = ?auto_153689 ?auto_153690 ) ) ( not ( = ?auto_153689 ?auto_153691 ) ) ( TRUCK-AT ?auto_153696 ?auto_153694 ) ( not ( = ?auto_153694 ?auto_153695 ) ) ( HOIST-AT ?auto_153693 ?auto_153694 ) ( LIFTING ?auto_153693 ?auto_153691 ) ( not ( = ?auto_153692 ?auto_153693 ) ) ( ON ?auto_153688 ?auto_153687 ) ( ON ?auto_153689 ?auto_153688 ) ( not ( = ?auto_153687 ?auto_153688 ) ) ( not ( = ?auto_153687 ?auto_153689 ) ) ( not ( = ?auto_153687 ?auto_153690 ) ) ( not ( = ?auto_153687 ?auto_153691 ) ) ( not ( = ?auto_153688 ?auto_153689 ) ) ( not ( = ?auto_153688 ?auto_153690 ) ) ( not ( = ?auto_153688 ?auto_153691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153689 ?auto_153690 ?auto_153691 )
      ( MAKE-4CRATE-VERIFY ?auto_153687 ?auto_153688 ?auto_153689 ?auto_153690 ?auto_153691 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153725 - SURFACE
      ?auto_153726 - SURFACE
      ?auto_153727 - SURFACE
      ?auto_153728 - SURFACE
      ?auto_153729 - SURFACE
    )
    :vars
    (
      ?auto_153730 - HOIST
      ?auto_153733 - PLACE
      ?auto_153731 - TRUCK
      ?auto_153734 - PLACE
      ?auto_153735 - HOIST
      ?auto_153732 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153730 ?auto_153733 ) ( SURFACE-AT ?auto_153728 ?auto_153733 ) ( CLEAR ?auto_153728 ) ( IS-CRATE ?auto_153729 ) ( not ( = ?auto_153728 ?auto_153729 ) ) ( AVAILABLE ?auto_153730 ) ( ON ?auto_153728 ?auto_153727 ) ( not ( = ?auto_153727 ?auto_153728 ) ) ( not ( = ?auto_153727 ?auto_153729 ) ) ( TRUCK-AT ?auto_153731 ?auto_153734 ) ( not ( = ?auto_153734 ?auto_153733 ) ) ( HOIST-AT ?auto_153735 ?auto_153734 ) ( not ( = ?auto_153730 ?auto_153735 ) ) ( AVAILABLE ?auto_153735 ) ( SURFACE-AT ?auto_153729 ?auto_153734 ) ( ON ?auto_153729 ?auto_153732 ) ( CLEAR ?auto_153729 ) ( not ( = ?auto_153728 ?auto_153732 ) ) ( not ( = ?auto_153729 ?auto_153732 ) ) ( not ( = ?auto_153727 ?auto_153732 ) ) ( ON ?auto_153726 ?auto_153725 ) ( ON ?auto_153727 ?auto_153726 ) ( not ( = ?auto_153725 ?auto_153726 ) ) ( not ( = ?auto_153725 ?auto_153727 ) ) ( not ( = ?auto_153725 ?auto_153728 ) ) ( not ( = ?auto_153725 ?auto_153729 ) ) ( not ( = ?auto_153725 ?auto_153732 ) ) ( not ( = ?auto_153726 ?auto_153727 ) ) ( not ( = ?auto_153726 ?auto_153728 ) ) ( not ( = ?auto_153726 ?auto_153729 ) ) ( not ( = ?auto_153726 ?auto_153732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153727 ?auto_153728 ?auto_153729 )
      ( MAKE-4CRATE-VERIFY ?auto_153725 ?auto_153726 ?auto_153727 ?auto_153728 ?auto_153729 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153764 - SURFACE
      ?auto_153765 - SURFACE
      ?auto_153766 - SURFACE
      ?auto_153767 - SURFACE
      ?auto_153768 - SURFACE
    )
    :vars
    (
      ?auto_153773 - HOIST
      ?auto_153771 - PLACE
      ?auto_153774 - PLACE
      ?auto_153769 - HOIST
      ?auto_153770 - SURFACE
      ?auto_153772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153773 ?auto_153771 ) ( SURFACE-AT ?auto_153767 ?auto_153771 ) ( CLEAR ?auto_153767 ) ( IS-CRATE ?auto_153768 ) ( not ( = ?auto_153767 ?auto_153768 ) ) ( AVAILABLE ?auto_153773 ) ( ON ?auto_153767 ?auto_153766 ) ( not ( = ?auto_153766 ?auto_153767 ) ) ( not ( = ?auto_153766 ?auto_153768 ) ) ( not ( = ?auto_153774 ?auto_153771 ) ) ( HOIST-AT ?auto_153769 ?auto_153774 ) ( not ( = ?auto_153773 ?auto_153769 ) ) ( AVAILABLE ?auto_153769 ) ( SURFACE-AT ?auto_153768 ?auto_153774 ) ( ON ?auto_153768 ?auto_153770 ) ( CLEAR ?auto_153768 ) ( not ( = ?auto_153767 ?auto_153770 ) ) ( not ( = ?auto_153768 ?auto_153770 ) ) ( not ( = ?auto_153766 ?auto_153770 ) ) ( TRUCK-AT ?auto_153772 ?auto_153771 ) ( ON ?auto_153765 ?auto_153764 ) ( ON ?auto_153766 ?auto_153765 ) ( not ( = ?auto_153764 ?auto_153765 ) ) ( not ( = ?auto_153764 ?auto_153766 ) ) ( not ( = ?auto_153764 ?auto_153767 ) ) ( not ( = ?auto_153764 ?auto_153768 ) ) ( not ( = ?auto_153764 ?auto_153770 ) ) ( not ( = ?auto_153765 ?auto_153766 ) ) ( not ( = ?auto_153765 ?auto_153767 ) ) ( not ( = ?auto_153765 ?auto_153768 ) ) ( not ( = ?auto_153765 ?auto_153770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153766 ?auto_153767 ?auto_153768 )
      ( MAKE-4CRATE-VERIFY ?auto_153764 ?auto_153765 ?auto_153766 ?auto_153767 ?auto_153768 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153803 - SURFACE
      ?auto_153804 - SURFACE
      ?auto_153805 - SURFACE
      ?auto_153806 - SURFACE
      ?auto_153807 - SURFACE
    )
    :vars
    (
      ?auto_153812 - HOIST
      ?auto_153809 - PLACE
      ?auto_153808 - PLACE
      ?auto_153811 - HOIST
      ?auto_153813 - SURFACE
      ?auto_153810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153812 ?auto_153809 ) ( IS-CRATE ?auto_153807 ) ( not ( = ?auto_153806 ?auto_153807 ) ) ( not ( = ?auto_153805 ?auto_153806 ) ) ( not ( = ?auto_153805 ?auto_153807 ) ) ( not ( = ?auto_153808 ?auto_153809 ) ) ( HOIST-AT ?auto_153811 ?auto_153808 ) ( not ( = ?auto_153812 ?auto_153811 ) ) ( AVAILABLE ?auto_153811 ) ( SURFACE-AT ?auto_153807 ?auto_153808 ) ( ON ?auto_153807 ?auto_153813 ) ( CLEAR ?auto_153807 ) ( not ( = ?auto_153806 ?auto_153813 ) ) ( not ( = ?auto_153807 ?auto_153813 ) ) ( not ( = ?auto_153805 ?auto_153813 ) ) ( TRUCK-AT ?auto_153810 ?auto_153809 ) ( SURFACE-AT ?auto_153805 ?auto_153809 ) ( CLEAR ?auto_153805 ) ( LIFTING ?auto_153812 ?auto_153806 ) ( IS-CRATE ?auto_153806 ) ( ON ?auto_153804 ?auto_153803 ) ( ON ?auto_153805 ?auto_153804 ) ( not ( = ?auto_153803 ?auto_153804 ) ) ( not ( = ?auto_153803 ?auto_153805 ) ) ( not ( = ?auto_153803 ?auto_153806 ) ) ( not ( = ?auto_153803 ?auto_153807 ) ) ( not ( = ?auto_153803 ?auto_153813 ) ) ( not ( = ?auto_153804 ?auto_153805 ) ) ( not ( = ?auto_153804 ?auto_153806 ) ) ( not ( = ?auto_153804 ?auto_153807 ) ) ( not ( = ?auto_153804 ?auto_153813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153805 ?auto_153806 ?auto_153807 )
      ( MAKE-4CRATE-VERIFY ?auto_153803 ?auto_153804 ?auto_153805 ?auto_153806 ?auto_153807 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153842 - SURFACE
      ?auto_153843 - SURFACE
      ?auto_153844 - SURFACE
      ?auto_153845 - SURFACE
      ?auto_153846 - SURFACE
    )
    :vars
    (
      ?auto_153847 - HOIST
      ?auto_153849 - PLACE
      ?auto_153850 - PLACE
      ?auto_153851 - HOIST
      ?auto_153852 - SURFACE
      ?auto_153848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153847 ?auto_153849 ) ( IS-CRATE ?auto_153846 ) ( not ( = ?auto_153845 ?auto_153846 ) ) ( not ( = ?auto_153844 ?auto_153845 ) ) ( not ( = ?auto_153844 ?auto_153846 ) ) ( not ( = ?auto_153850 ?auto_153849 ) ) ( HOIST-AT ?auto_153851 ?auto_153850 ) ( not ( = ?auto_153847 ?auto_153851 ) ) ( AVAILABLE ?auto_153851 ) ( SURFACE-AT ?auto_153846 ?auto_153850 ) ( ON ?auto_153846 ?auto_153852 ) ( CLEAR ?auto_153846 ) ( not ( = ?auto_153845 ?auto_153852 ) ) ( not ( = ?auto_153846 ?auto_153852 ) ) ( not ( = ?auto_153844 ?auto_153852 ) ) ( TRUCK-AT ?auto_153848 ?auto_153849 ) ( SURFACE-AT ?auto_153844 ?auto_153849 ) ( CLEAR ?auto_153844 ) ( IS-CRATE ?auto_153845 ) ( AVAILABLE ?auto_153847 ) ( IN ?auto_153845 ?auto_153848 ) ( ON ?auto_153843 ?auto_153842 ) ( ON ?auto_153844 ?auto_153843 ) ( not ( = ?auto_153842 ?auto_153843 ) ) ( not ( = ?auto_153842 ?auto_153844 ) ) ( not ( = ?auto_153842 ?auto_153845 ) ) ( not ( = ?auto_153842 ?auto_153846 ) ) ( not ( = ?auto_153842 ?auto_153852 ) ) ( not ( = ?auto_153843 ?auto_153844 ) ) ( not ( = ?auto_153843 ?auto_153845 ) ) ( not ( = ?auto_153843 ?auto_153846 ) ) ( not ( = ?auto_153843 ?auto_153852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153844 ?auto_153845 ?auto_153846 )
      ( MAKE-4CRATE-VERIFY ?auto_153842 ?auto_153843 ?auto_153844 ?auto_153845 ?auto_153846 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154502 - SURFACE
      ?auto_154503 - SURFACE
      ?auto_154504 - SURFACE
      ?auto_154505 - SURFACE
      ?auto_154506 - SURFACE
      ?auto_154507 - SURFACE
    )
    :vars
    (
      ?auto_154509 - HOIST
      ?auto_154508 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154509 ?auto_154508 ) ( SURFACE-AT ?auto_154506 ?auto_154508 ) ( CLEAR ?auto_154506 ) ( LIFTING ?auto_154509 ?auto_154507 ) ( IS-CRATE ?auto_154507 ) ( not ( = ?auto_154506 ?auto_154507 ) ) ( ON ?auto_154503 ?auto_154502 ) ( ON ?auto_154504 ?auto_154503 ) ( ON ?auto_154505 ?auto_154504 ) ( ON ?auto_154506 ?auto_154505 ) ( not ( = ?auto_154502 ?auto_154503 ) ) ( not ( = ?auto_154502 ?auto_154504 ) ) ( not ( = ?auto_154502 ?auto_154505 ) ) ( not ( = ?auto_154502 ?auto_154506 ) ) ( not ( = ?auto_154502 ?auto_154507 ) ) ( not ( = ?auto_154503 ?auto_154504 ) ) ( not ( = ?auto_154503 ?auto_154505 ) ) ( not ( = ?auto_154503 ?auto_154506 ) ) ( not ( = ?auto_154503 ?auto_154507 ) ) ( not ( = ?auto_154504 ?auto_154505 ) ) ( not ( = ?auto_154504 ?auto_154506 ) ) ( not ( = ?auto_154504 ?auto_154507 ) ) ( not ( = ?auto_154505 ?auto_154506 ) ) ( not ( = ?auto_154505 ?auto_154507 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_154506 ?auto_154507 )
      ( MAKE-5CRATE-VERIFY ?auto_154502 ?auto_154503 ?auto_154504 ?auto_154505 ?auto_154506 ?auto_154507 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154536 - SURFACE
      ?auto_154537 - SURFACE
      ?auto_154538 - SURFACE
      ?auto_154539 - SURFACE
      ?auto_154540 - SURFACE
      ?auto_154541 - SURFACE
    )
    :vars
    (
      ?auto_154542 - HOIST
      ?auto_154543 - PLACE
      ?auto_154544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154542 ?auto_154543 ) ( SURFACE-AT ?auto_154540 ?auto_154543 ) ( CLEAR ?auto_154540 ) ( IS-CRATE ?auto_154541 ) ( not ( = ?auto_154540 ?auto_154541 ) ) ( TRUCK-AT ?auto_154544 ?auto_154543 ) ( AVAILABLE ?auto_154542 ) ( IN ?auto_154541 ?auto_154544 ) ( ON ?auto_154540 ?auto_154539 ) ( not ( = ?auto_154539 ?auto_154540 ) ) ( not ( = ?auto_154539 ?auto_154541 ) ) ( ON ?auto_154537 ?auto_154536 ) ( ON ?auto_154538 ?auto_154537 ) ( ON ?auto_154539 ?auto_154538 ) ( not ( = ?auto_154536 ?auto_154537 ) ) ( not ( = ?auto_154536 ?auto_154538 ) ) ( not ( = ?auto_154536 ?auto_154539 ) ) ( not ( = ?auto_154536 ?auto_154540 ) ) ( not ( = ?auto_154536 ?auto_154541 ) ) ( not ( = ?auto_154537 ?auto_154538 ) ) ( not ( = ?auto_154537 ?auto_154539 ) ) ( not ( = ?auto_154537 ?auto_154540 ) ) ( not ( = ?auto_154537 ?auto_154541 ) ) ( not ( = ?auto_154538 ?auto_154539 ) ) ( not ( = ?auto_154538 ?auto_154540 ) ) ( not ( = ?auto_154538 ?auto_154541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154539 ?auto_154540 ?auto_154541 )
      ( MAKE-5CRATE-VERIFY ?auto_154536 ?auto_154537 ?auto_154538 ?auto_154539 ?auto_154540 ?auto_154541 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154576 - SURFACE
      ?auto_154577 - SURFACE
      ?auto_154578 - SURFACE
      ?auto_154579 - SURFACE
      ?auto_154580 - SURFACE
      ?auto_154581 - SURFACE
    )
    :vars
    (
      ?auto_154583 - HOIST
      ?auto_154582 - PLACE
      ?auto_154585 - TRUCK
      ?auto_154584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154583 ?auto_154582 ) ( SURFACE-AT ?auto_154580 ?auto_154582 ) ( CLEAR ?auto_154580 ) ( IS-CRATE ?auto_154581 ) ( not ( = ?auto_154580 ?auto_154581 ) ) ( AVAILABLE ?auto_154583 ) ( IN ?auto_154581 ?auto_154585 ) ( ON ?auto_154580 ?auto_154579 ) ( not ( = ?auto_154579 ?auto_154580 ) ) ( not ( = ?auto_154579 ?auto_154581 ) ) ( TRUCK-AT ?auto_154585 ?auto_154584 ) ( not ( = ?auto_154584 ?auto_154582 ) ) ( ON ?auto_154577 ?auto_154576 ) ( ON ?auto_154578 ?auto_154577 ) ( ON ?auto_154579 ?auto_154578 ) ( not ( = ?auto_154576 ?auto_154577 ) ) ( not ( = ?auto_154576 ?auto_154578 ) ) ( not ( = ?auto_154576 ?auto_154579 ) ) ( not ( = ?auto_154576 ?auto_154580 ) ) ( not ( = ?auto_154576 ?auto_154581 ) ) ( not ( = ?auto_154577 ?auto_154578 ) ) ( not ( = ?auto_154577 ?auto_154579 ) ) ( not ( = ?auto_154577 ?auto_154580 ) ) ( not ( = ?auto_154577 ?auto_154581 ) ) ( not ( = ?auto_154578 ?auto_154579 ) ) ( not ( = ?auto_154578 ?auto_154580 ) ) ( not ( = ?auto_154578 ?auto_154581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154579 ?auto_154580 ?auto_154581 )
      ( MAKE-5CRATE-VERIFY ?auto_154576 ?auto_154577 ?auto_154578 ?auto_154579 ?auto_154580 ?auto_154581 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154621 - SURFACE
      ?auto_154622 - SURFACE
      ?auto_154623 - SURFACE
      ?auto_154624 - SURFACE
      ?auto_154625 - SURFACE
      ?auto_154626 - SURFACE
    )
    :vars
    (
      ?auto_154628 - HOIST
      ?auto_154627 - PLACE
      ?auto_154631 - TRUCK
      ?auto_154630 - PLACE
      ?auto_154629 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_154628 ?auto_154627 ) ( SURFACE-AT ?auto_154625 ?auto_154627 ) ( CLEAR ?auto_154625 ) ( IS-CRATE ?auto_154626 ) ( not ( = ?auto_154625 ?auto_154626 ) ) ( AVAILABLE ?auto_154628 ) ( ON ?auto_154625 ?auto_154624 ) ( not ( = ?auto_154624 ?auto_154625 ) ) ( not ( = ?auto_154624 ?auto_154626 ) ) ( TRUCK-AT ?auto_154631 ?auto_154630 ) ( not ( = ?auto_154630 ?auto_154627 ) ) ( HOIST-AT ?auto_154629 ?auto_154630 ) ( LIFTING ?auto_154629 ?auto_154626 ) ( not ( = ?auto_154628 ?auto_154629 ) ) ( ON ?auto_154622 ?auto_154621 ) ( ON ?auto_154623 ?auto_154622 ) ( ON ?auto_154624 ?auto_154623 ) ( not ( = ?auto_154621 ?auto_154622 ) ) ( not ( = ?auto_154621 ?auto_154623 ) ) ( not ( = ?auto_154621 ?auto_154624 ) ) ( not ( = ?auto_154621 ?auto_154625 ) ) ( not ( = ?auto_154621 ?auto_154626 ) ) ( not ( = ?auto_154622 ?auto_154623 ) ) ( not ( = ?auto_154622 ?auto_154624 ) ) ( not ( = ?auto_154622 ?auto_154625 ) ) ( not ( = ?auto_154622 ?auto_154626 ) ) ( not ( = ?auto_154623 ?auto_154624 ) ) ( not ( = ?auto_154623 ?auto_154625 ) ) ( not ( = ?auto_154623 ?auto_154626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154624 ?auto_154625 ?auto_154626 )
      ( MAKE-5CRATE-VERIFY ?auto_154621 ?auto_154622 ?auto_154623 ?auto_154624 ?auto_154625 ?auto_154626 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154671 - SURFACE
      ?auto_154672 - SURFACE
      ?auto_154673 - SURFACE
      ?auto_154674 - SURFACE
      ?auto_154675 - SURFACE
      ?auto_154676 - SURFACE
    )
    :vars
    (
      ?auto_154681 - HOIST
      ?auto_154677 - PLACE
      ?auto_154680 - TRUCK
      ?auto_154682 - PLACE
      ?auto_154678 - HOIST
      ?auto_154679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154681 ?auto_154677 ) ( SURFACE-AT ?auto_154675 ?auto_154677 ) ( CLEAR ?auto_154675 ) ( IS-CRATE ?auto_154676 ) ( not ( = ?auto_154675 ?auto_154676 ) ) ( AVAILABLE ?auto_154681 ) ( ON ?auto_154675 ?auto_154674 ) ( not ( = ?auto_154674 ?auto_154675 ) ) ( not ( = ?auto_154674 ?auto_154676 ) ) ( TRUCK-AT ?auto_154680 ?auto_154682 ) ( not ( = ?auto_154682 ?auto_154677 ) ) ( HOIST-AT ?auto_154678 ?auto_154682 ) ( not ( = ?auto_154681 ?auto_154678 ) ) ( AVAILABLE ?auto_154678 ) ( SURFACE-AT ?auto_154676 ?auto_154682 ) ( ON ?auto_154676 ?auto_154679 ) ( CLEAR ?auto_154676 ) ( not ( = ?auto_154675 ?auto_154679 ) ) ( not ( = ?auto_154676 ?auto_154679 ) ) ( not ( = ?auto_154674 ?auto_154679 ) ) ( ON ?auto_154672 ?auto_154671 ) ( ON ?auto_154673 ?auto_154672 ) ( ON ?auto_154674 ?auto_154673 ) ( not ( = ?auto_154671 ?auto_154672 ) ) ( not ( = ?auto_154671 ?auto_154673 ) ) ( not ( = ?auto_154671 ?auto_154674 ) ) ( not ( = ?auto_154671 ?auto_154675 ) ) ( not ( = ?auto_154671 ?auto_154676 ) ) ( not ( = ?auto_154671 ?auto_154679 ) ) ( not ( = ?auto_154672 ?auto_154673 ) ) ( not ( = ?auto_154672 ?auto_154674 ) ) ( not ( = ?auto_154672 ?auto_154675 ) ) ( not ( = ?auto_154672 ?auto_154676 ) ) ( not ( = ?auto_154672 ?auto_154679 ) ) ( not ( = ?auto_154673 ?auto_154674 ) ) ( not ( = ?auto_154673 ?auto_154675 ) ) ( not ( = ?auto_154673 ?auto_154676 ) ) ( not ( = ?auto_154673 ?auto_154679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154674 ?auto_154675 ?auto_154676 )
      ( MAKE-5CRATE-VERIFY ?auto_154671 ?auto_154672 ?auto_154673 ?auto_154674 ?auto_154675 ?auto_154676 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154722 - SURFACE
      ?auto_154723 - SURFACE
      ?auto_154724 - SURFACE
      ?auto_154725 - SURFACE
      ?auto_154726 - SURFACE
      ?auto_154727 - SURFACE
    )
    :vars
    (
      ?auto_154732 - HOIST
      ?auto_154728 - PLACE
      ?auto_154730 - PLACE
      ?auto_154731 - HOIST
      ?auto_154733 - SURFACE
      ?auto_154729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154732 ?auto_154728 ) ( SURFACE-AT ?auto_154726 ?auto_154728 ) ( CLEAR ?auto_154726 ) ( IS-CRATE ?auto_154727 ) ( not ( = ?auto_154726 ?auto_154727 ) ) ( AVAILABLE ?auto_154732 ) ( ON ?auto_154726 ?auto_154725 ) ( not ( = ?auto_154725 ?auto_154726 ) ) ( not ( = ?auto_154725 ?auto_154727 ) ) ( not ( = ?auto_154730 ?auto_154728 ) ) ( HOIST-AT ?auto_154731 ?auto_154730 ) ( not ( = ?auto_154732 ?auto_154731 ) ) ( AVAILABLE ?auto_154731 ) ( SURFACE-AT ?auto_154727 ?auto_154730 ) ( ON ?auto_154727 ?auto_154733 ) ( CLEAR ?auto_154727 ) ( not ( = ?auto_154726 ?auto_154733 ) ) ( not ( = ?auto_154727 ?auto_154733 ) ) ( not ( = ?auto_154725 ?auto_154733 ) ) ( TRUCK-AT ?auto_154729 ?auto_154728 ) ( ON ?auto_154723 ?auto_154722 ) ( ON ?auto_154724 ?auto_154723 ) ( ON ?auto_154725 ?auto_154724 ) ( not ( = ?auto_154722 ?auto_154723 ) ) ( not ( = ?auto_154722 ?auto_154724 ) ) ( not ( = ?auto_154722 ?auto_154725 ) ) ( not ( = ?auto_154722 ?auto_154726 ) ) ( not ( = ?auto_154722 ?auto_154727 ) ) ( not ( = ?auto_154722 ?auto_154733 ) ) ( not ( = ?auto_154723 ?auto_154724 ) ) ( not ( = ?auto_154723 ?auto_154725 ) ) ( not ( = ?auto_154723 ?auto_154726 ) ) ( not ( = ?auto_154723 ?auto_154727 ) ) ( not ( = ?auto_154723 ?auto_154733 ) ) ( not ( = ?auto_154724 ?auto_154725 ) ) ( not ( = ?auto_154724 ?auto_154726 ) ) ( not ( = ?auto_154724 ?auto_154727 ) ) ( not ( = ?auto_154724 ?auto_154733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154725 ?auto_154726 ?auto_154727 )
      ( MAKE-5CRATE-VERIFY ?auto_154722 ?auto_154723 ?auto_154724 ?auto_154725 ?auto_154726 ?auto_154727 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154773 - SURFACE
      ?auto_154774 - SURFACE
      ?auto_154775 - SURFACE
      ?auto_154776 - SURFACE
      ?auto_154777 - SURFACE
      ?auto_154778 - SURFACE
    )
    :vars
    (
      ?auto_154781 - HOIST
      ?auto_154779 - PLACE
      ?auto_154784 - PLACE
      ?auto_154783 - HOIST
      ?auto_154780 - SURFACE
      ?auto_154782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154781 ?auto_154779 ) ( IS-CRATE ?auto_154778 ) ( not ( = ?auto_154777 ?auto_154778 ) ) ( not ( = ?auto_154776 ?auto_154777 ) ) ( not ( = ?auto_154776 ?auto_154778 ) ) ( not ( = ?auto_154784 ?auto_154779 ) ) ( HOIST-AT ?auto_154783 ?auto_154784 ) ( not ( = ?auto_154781 ?auto_154783 ) ) ( AVAILABLE ?auto_154783 ) ( SURFACE-AT ?auto_154778 ?auto_154784 ) ( ON ?auto_154778 ?auto_154780 ) ( CLEAR ?auto_154778 ) ( not ( = ?auto_154777 ?auto_154780 ) ) ( not ( = ?auto_154778 ?auto_154780 ) ) ( not ( = ?auto_154776 ?auto_154780 ) ) ( TRUCK-AT ?auto_154782 ?auto_154779 ) ( SURFACE-AT ?auto_154776 ?auto_154779 ) ( CLEAR ?auto_154776 ) ( LIFTING ?auto_154781 ?auto_154777 ) ( IS-CRATE ?auto_154777 ) ( ON ?auto_154774 ?auto_154773 ) ( ON ?auto_154775 ?auto_154774 ) ( ON ?auto_154776 ?auto_154775 ) ( not ( = ?auto_154773 ?auto_154774 ) ) ( not ( = ?auto_154773 ?auto_154775 ) ) ( not ( = ?auto_154773 ?auto_154776 ) ) ( not ( = ?auto_154773 ?auto_154777 ) ) ( not ( = ?auto_154773 ?auto_154778 ) ) ( not ( = ?auto_154773 ?auto_154780 ) ) ( not ( = ?auto_154774 ?auto_154775 ) ) ( not ( = ?auto_154774 ?auto_154776 ) ) ( not ( = ?auto_154774 ?auto_154777 ) ) ( not ( = ?auto_154774 ?auto_154778 ) ) ( not ( = ?auto_154774 ?auto_154780 ) ) ( not ( = ?auto_154775 ?auto_154776 ) ) ( not ( = ?auto_154775 ?auto_154777 ) ) ( not ( = ?auto_154775 ?auto_154778 ) ) ( not ( = ?auto_154775 ?auto_154780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154776 ?auto_154777 ?auto_154778 )
      ( MAKE-5CRATE-VERIFY ?auto_154773 ?auto_154774 ?auto_154775 ?auto_154776 ?auto_154777 ?auto_154778 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154824 - SURFACE
      ?auto_154825 - SURFACE
      ?auto_154826 - SURFACE
      ?auto_154827 - SURFACE
      ?auto_154828 - SURFACE
      ?auto_154829 - SURFACE
    )
    :vars
    (
      ?auto_154832 - HOIST
      ?auto_154835 - PLACE
      ?auto_154834 - PLACE
      ?auto_154833 - HOIST
      ?auto_154831 - SURFACE
      ?auto_154830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154832 ?auto_154835 ) ( IS-CRATE ?auto_154829 ) ( not ( = ?auto_154828 ?auto_154829 ) ) ( not ( = ?auto_154827 ?auto_154828 ) ) ( not ( = ?auto_154827 ?auto_154829 ) ) ( not ( = ?auto_154834 ?auto_154835 ) ) ( HOIST-AT ?auto_154833 ?auto_154834 ) ( not ( = ?auto_154832 ?auto_154833 ) ) ( AVAILABLE ?auto_154833 ) ( SURFACE-AT ?auto_154829 ?auto_154834 ) ( ON ?auto_154829 ?auto_154831 ) ( CLEAR ?auto_154829 ) ( not ( = ?auto_154828 ?auto_154831 ) ) ( not ( = ?auto_154829 ?auto_154831 ) ) ( not ( = ?auto_154827 ?auto_154831 ) ) ( TRUCK-AT ?auto_154830 ?auto_154835 ) ( SURFACE-AT ?auto_154827 ?auto_154835 ) ( CLEAR ?auto_154827 ) ( IS-CRATE ?auto_154828 ) ( AVAILABLE ?auto_154832 ) ( IN ?auto_154828 ?auto_154830 ) ( ON ?auto_154825 ?auto_154824 ) ( ON ?auto_154826 ?auto_154825 ) ( ON ?auto_154827 ?auto_154826 ) ( not ( = ?auto_154824 ?auto_154825 ) ) ( not ( = ?auto_154824 ?auto_154826 ) ) ( not ( = ?auto_154824 ?auto_154827 ) ) ( not ( = ?auto_154824 ?auto_154828 ) ) ( not ( = ?auto_154824 ?auto_154829 ) ) ( not ( = ?auto_154824 ?auto_154831 ) ) ( not ( = ?auto_154825 ?auto_154826 ) ) ( not ( = ?auto_154825 ?auto_154827 ) ) ( not ( = ?auto_154825 ?auto_154828 ) ) ( not ( = ?auto_154825 ?auto_154829 ) ) ( not ( = ?auto_154825 ?auto_154831 ) ) ( not ( = ?auto_154826 ?auto_154827 ) ) ( not ( = ?auto_154826 ?auto_154828 ) ) ( not ( = ?auto_154826 ?auto_154829 ) ) ( not ( = ?auto_154826 ?auto_154831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154827 ?auto_154828 ?auto_154829 )
      ( MAKE-5CRATE-VERIFY ?auto_154824 ?auto_154825 ?auto_154826 ?auto_154827 ?auto_154828 ?auto_154829 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156033 - SURFACE
      ?auto_156034 - SURFACE
      ?auto_156035 - SURFACE
      ?auto_156036 - SURFACE
      ?auto_156037 - SURFACE
      ?auto_156038 - SURFACE
      ?auto_156039 - SURFACE
    )
    :vars
    (
      ?auto_156040 - HOIST
      ?auto_156041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156040 ?auto_156041 ) ( SURFACE-AT ?auto_156038 ?auto_156041 ) ( CLEAR ?auto_156038 ) ( LIFTING ?auto_156040 ?auto_156039 ) ( IS-CRATE ?auto_156039 ) ( not ( = ?auto_156038 ?auto_156039 ) ) ( ON ?auto_156034 ?auto_156033 ) ( ON ?auto_156035 ?auto_156034 ) ( ON ?auto_156036 ?auto_156035 ) ( ON ?auto_156037 ?auto_156036 ) ( ON ?auto_156038 ?auto_156037 ) ( not ( = ?auto_156033 ?auto_156034 ) ) ( not ( = ?auto_156033 ?auto_156035 ) ) ( not ( = ?auto_156033 ?auto_156036 ) ) ( not ( = ?auto_156033 ?auto_156037 ) ) ( not ( = ?auto_156033 ?auto_156038 ) ) ( not ( = ?auto_156033 ?auto_156039 ) ) ( not ( = ?auto_156034 ?auto_156035 ) ) ( not ( = ?auto_156034 ?auto_156036 ) ) ( not ( = ?auto_156034 ?auto_156037 ) ) ( not ( = ?auto_156034 ?auto_156038 ) ) ( not ( = ?auto_156034 ?auto_156039 ) ) ( not ( = ?auto_156035 ?auto_156036 ) ) ( not ( = ?auto_156035 ?auto_156037 ) ) ( not ( = ?auto_156035 ?auto_156038 ) ) ( not ( = ?auto_156035 ?auto_156039 ) ) ( not ( = ?auto_156036 ?auto_156037 ) ) ( not ( = ?auto_156036 ?auto_156038 ) ) ( not ( = ?auto_156036 ?auto_156039 ) ) ( not ( = ?auto_156037 ?auto_156038 ) ) ( not ( = ?auto_156037 ?auto_156039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_156038 ?auto_156039 )
      ( MAKE-6CRATE-VERIFY ?auto_156033 ?auto_156034 ?auto_156035 ?auto_156036 ?auto_156037 ?auto_156038 ?auto_156039 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156077 - SURFACE
      ?auto_156078 - SURFACE
      ?auto_156079 - SURFACE
      ?auto_156080 - SURFACE
      ?auto_156081 - SURFACE
      ?auto_156082 - SURFACE
      ?auto_156083 - SURFACE
    )
    :vars
    (
      ?auto_156086 - HOIST
      ?auto_156084 - PLACE
      ?auto_156085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156086 ?auto_156084 ) ( SURFACE-AT ?auto_156082 ?auto_156084 ) ( CLEAR ?auto_156082 ) ( IS-CRATE ?auto_156083 ) ( not ( = ?auto_156082 ?auto_156083 ) ) ( TRUCK-AT ?auto_156085 ?auto_156084 ) ( AVAILABLE ?auto_156086 ) ( IN ?auto_156083 ?auto_156085 ) ( ON ?auto_156082 ?auto_156081 ) ( not ( = ?auto_156081 ?auto_156082 ) ) ( not ( = ?auto_156081 ?auto_156083 ) ) ( ON ?auto_156078 ?auto_156077 ) ( ON ?auto_156079 ?auto_156078 ) ( ON ?auto_156080 ?auto_156079 ) ( ON ?auto_156081 ?auto_156080 ) ( not ( = ?auto_156077 ?auto_156078 ) ) ( not ( = ?auto_156077 ?auto_156079 ) ) ( not ( = ?auto_156077 ?auto_156080 ) ) ( not ( = ?auto_156077 ?auto_156081 ) ) ( not ( = ?auto_156077 ?auto_156082 ) ) ( not ( = ?auto_156077 ?auto_156083 ) ) ( not ( = ?auto_156078 ?auto_156079 ) ) ( not ( = ?auto_156078 ?auto_156080 ) ) ( not ( = ?auto_156078 ?auto_156081 ) ) ( not ( = ?auto_156078 ?auto_156082 ) ) ( not ( = ?auto_156078 ?auto_156083 ) ) ( not ( = ?auto_156079 ?auto_156080 ) ) ( not ( = ?auto_156079 ?auto_156081 ) ) ( not ( = ?auto_156079 ?auto_156082 ) ) ( not ( = ?auto_156079 ?auto_156083 ) ) ( not ( = ?auto_156080 ?auto_156081 ) ) ( not ( = ?auto_156080 ?auto_156082 ) ) ( not ( = ?auto_156080 ?auto_156083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156081 ?auto_156082 ?auto_156083 )
      ( MAKE-6CRATE-VERIFY ?auto_156077 ?auto_156078 ?auto_156079 ?auto_156080 ?auto_156081 ?auto_156082 ?auto_156083 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156128 - SURFACE
      ?auto_156129 - SURFACE
      ?auto_156130 - SURFACE
      ?auto_156131 - SURFACE
      ?auto_156132 - SURFACE
      ?auto_156133 - SURFACE
      ?auto_156134 - SURFACE
    )
    :vars
    (
      ?auto_156136 - HOIST
      ?auto_156135 - PLACE
      ?auto_156137 - TRUCK
      ?auto_156138 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156136 ?auto_156135 ) ( SURFACE-AT ?auto_156133 ?auto_156135 ) ( CLEAR ?auto_156133 ) ( IS-CRATE ?auto_156134 ) ( not ( = ?auto_156133 ?auto_156134 ) ) ( AVAILABLE ?auto_156136 ) ( IN ?auto_156134 ?auto_156137 ) ( ON ?auto_156133 ?auto_156132 ) ( not ( = ?auto_156132 ?auto_156133 ) ) ( not ( = ?auto_156132 ?auto_156134 ) ) ( TRUCK-AT ?auto_156137 ?auto_156138 ) ( not ( = ?auto_156138 ?auto_156135 ) ) ( ON ?auto_156129 ?auto_156128 ) ( ON ?auto_156130 ?auto_156129 ) ( ON ?auto_156131 ?auto_156130 ) ( ON ?auto_156132 ?auto_156131 ) ( not ( = ?auto_156128 ?auto_156129 ) ) ( not ( = ?auto_156128 ?auto_156130 ) ) ( not ( = ?auto_156128 ?auto_156131 ) ) ( not ( = ?auto_156128 ?auto_156132 ) ) ( not ( = ?auto_156128 ?auto_156133 ) ) ( not ( = ?auto_156128 ?auto_156134 ) ) ( not ( = ?auto_156129 ?auto_156130 ) ) ( not ( = ?auto_156129 ?auto_156131 ) ) ( not ( = ?auto_156129 ?auto_156132 ) ) ( not ( = ?auto_156129 ?auto_156133 ) ) ( not ( = ?auto_156129 ?auto_156134 ) ) ( not ( = ?auto_156130 ?auto_156131 ) ) ( not ( = ?auto_156130 ?auto_156132 ) ) ( not ( = ?auto_156130 ?auto_156133 ) ) ( not ( = ?auto_156130 ?auto_156134 ) ) ( not ( = ?auto_156131 ?auto_156132 ) ) ( not ( = ?auto_156131 ?auto_156133 ) ) ( not ( = ?auto_156131 ?auto_156134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156132 ?auto_156133 ?auto_156134 )
      ( MAKE-6CRATE-VERIFY ?auto_156128 ?auto_156129 ?auto_156130 ?auto_156131 ?auto_156132 ?auto_156133 ?auto_156134 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156185 - SURFACE
      ?auto_156186 - SURFACE
      ?auto_156187 - SURFACE
      ?auto_156188 - SURFACE
      ?auto_156189 - SURFACE
      ?auto_156190 - SURFACE
      ?auto_156191 - SURFACE
    )
    :vars
    (
      ?auto_156192 - HOIST
      ?auto_156194 - PLACE
      ?auto_156193 - TRUCK
      ?auto_156196 - PLACE
      ?auto_156195 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_156192 ?auto_156194 ) ( SURFACE-AT ?auto_156190 ?auto_156194 ) ( CLEAR ?auto_156190 ) ( IS-CRATE ?auto_156191 ) ( not ( = ?auto_156190 ?auto_156191 ) ) ( AVAILABLE ?auto_156192 ) ( ON ?auto_156190 ?auto_156189 ) ( not ( = ?auto_156189 ?auto_156190 ) ) ( not ( = ?auto_156189 ?auto_156191 ) ) ( TRUCK-AT ?auto_156193 ?auto_156196 ) ( not ( = ?auto_156196 ?auto_156194 ) ) ( HOIST-AT ?auto_156195 ?auto_156196 ) ( LIFTING ?auto_156195 ?auto_156191 ) ( not ( = ?auto_156192 ?auto_156195 ) ) ( ON ?auto_156186 ?auto_156185 ) ( ON ?auto_156187 ?auto_156186 ) ( ON ?auto_156188 ?auto_156187 ) ( ON ?auto_156189 ?auto_156188 ) ( not ( = ?auto_156185 ?auto_156186 ) ) ( not ( = ?auto_156185 ?auto_156187 ) ) ( not ( = ?auto_156185 ?auto_156188 ) ) ( not ( = ?auto_156185 ?auto_156189 ) ) ( not ( = ?auto_156185 ?auto_156190 ) ) ( not ( = ?auto_156185 ?auto_156191 ) ) ( not ( = ?auto_156186 ?auto_156187 ) ) ( not ( = ?auto_156186 ?auto_156188 ) ) ( not ( = ?auto_156186 ?auto_156189 ) ) ( not ( = ?auto_156186 ?auto_156190 ) ) ( not ( = ?auto_156186 ?auto_156191 ) ) ( not ( = ?auto_156187 ?auto_156188 ) ) ( not ( = ?auto_156187 ?auto_156189 ) ) ( not ( = ?auto_156187 ?auto_156190 ) ) ( not ( = ?auto_156187 ?auto_156191 ) ) ( not ( = ?auto_156188 ?auto_156189 ) ) ( not ( = ?auto_156188 ?auto_156190 ) ) ( not ( = ?auto_156188 ?auto_156191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156189 ?auto_156190 ?auto_156191 )
      ( MAKE-6CRATE-VERIFY ?auto_156185 ?auto_156186 ?auto_156187 ?auto_156188 ?auto_156189 ?auto_156190 ?auto_156191 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156248 - SURFACE
      ?auto_156249 - SURFACE
      ?auto_156250 - SURFACE
      ?auto_156251 - SURFACE
      ?auto_156252 - SURFACE
      ?auto_156253 - SURFACE
      ?auto_156254 - SURFACE
    )
    :vars
    (
      ?auto_156260 - HOIST
      ?auto_156258 - PLACE
      ?auto_156259 - TRUCK
      ?auto_156255 - PLACE
      ?auto_156256 - HOIST
      ?auto_156257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156260 ?auto_156258 ) ( SURFACE-AT ?auto_156253 ?auto_156258 ) ( CLEAR ?auto_156253 ) ( IS-CRATE ?auto_156254 ) ( not ( = ?auto_156253 ?auto_156254 ) ) ( AVAILABLE ?auto_156260 ) ( ON ?auto_156253 ?auto_156252 ) ( not ( = ?auto_156252 ?auto_156253 ) ) ( not ( = ?auto_156252 ?auto_156254 ) ) ( TRUCK-AT ?auto_156259 ?auto_156255 ) ( not ( = ?auto_156255 ?auto_156258 ) ) ( HOIST-AT ?auto_156256 ?auto_156255 ) ( not ( = ?auto_156260 ?auto_156256 ) ) ( AVAILABLE ?auto_156256 ) ( SURFACE-AT ?auto_156254 ?auto_156255 ) ( ON ?auto_156254 ?auto_156257 ) ( CLEAR ?auto_156254 ) ( not ( = ?auto_156253 ?auto_156257 ) ) ( not ( = ?auto_156254 ?auto_156257 ) ) ( not ( = ?auto_156252 ?auto_156257 ) ) ( ON ?auto_156249 ?auto_156248 ) ( ON ?auto_156250 ?auto_156249 ) ( ON ?auto_156251 ?auto_156250 ) ( ON ?auto_156252 ?auto_156251 ) ( not ( = ?auto_156248 ?auto_156249 ) ) ( not ( = ?auto_156248 ?auto_156250 ) ) ( not ( = ?auto_156248 ?auto_156251 ) ) ( not ( = ?auto_156248 ?auto_156252 ) ) ( not ( = ?auto_156248 ?auto_156253 ) ) ( not ( = ?auto_156248 ?auto_156254 ) ) ( not ( = ?auto_156248 ?auto_156257 ) ) ( not ( = ?auto_156249 ?auto_156250 ) ) ( not ( = ?auto_156249 ?auto_156251 ) ) ( not ( = ?auto_156249 ?auto_156252 ) ) ( not ( = ?auto_156249 ?auto_156253 ) ) ( not ( = ?auto_156249 ?auto_156254 ) ) ( not ( = ?auto_156249 ?auto_156257 ) ) ( not ( = ?auto_156250 ?auto_156251 ) ) ( not ( = ?auto_156250 ?auto_156252 ) ) ( not ( = ?auto_156250 ?auto_156253 ) ) ( not ( = ?auto_156250 ?auto_156254 ) ) ( not ( = ?auto_156250 ?auto_156257 ) ) ( not ( = ?auto_156251 ?auto_156252 ) ) ( not ( = ?auto_156251 ?auto_156253 ) ) ( not ( = ?auto_156251 ?auto_156254 ) ) ( not ( = ?auto_156251 ?auto_156257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156252 ?auto_156253 ?auto_156254 )
      ( MAKE-6CRATE-VERIFY ?auto_156248 ?auto_156249 ?auto_156250 ?auto_156251 ?auto_156252 ?auto_156253 ?auto_156254 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156312 - SURFACE
      ?auto_156313 - SURFACE
      ?auto_156314 - SURFACE
      ?auto_156315 - SURFACE
      ?auto_156316 - SURFACE
      ?auto_156317 - SURFACE
      ?auto_156318 - SURFACE
    )
    :vars
    (
      ?auto_156323 - HOIST
      ?auto_156322 - PLACE
      ?auto_156320 - PLACE
      ?auto_156319 - HOIST
      ?auto_156321 - SURFACE
      ?auto_156324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156323 ?auto_156322 ) ( SURFACE-AT ?auto_156317 ?auto_156322 ) ( CLEAR ?auto_156317 ) ( IS-CRATE ?auto_156318 ) ( not ( = ?auto_156317 ?auto_156318 ) ) ( AVAILABLE ?auto_156323 ) ( ON ?auto_156317 ?auto_156316 ) ( not ( = ?auto_156316 ?auto_156317 ) ) ( not ( = ?auto_156316 ?auto_156318 ) ) ( not ( = ?auto_156320 ?auto_156322 ) ) ( HOIST-AT ?auto_156319 ?auto_156320 ) ( not ( = ?auto_156323 ?auto_156319 ) ) ( AVAILABLE ?auto_156319 ) ( SURFACE-AT ?auto_156318 ?auto_156320 ) ( ON ?auto_156318 ?auto_156321 ) ( CLEAR ?auto_156318 ) ( not ( = ?auto_156317 ?auto_156321 ) ) ( not ( = ?auto_156318 ?auto_156321 ) ) ( not ( = ?auto_156316 ?auto_156321 ) ) ( TRUCK-AT ?auto_156324 ?auto_156322 ) ( ON ?auto_156313 ?auto_156312 ) ( ON ?auto_156314 ?auto_156313 ) ( ON ?auto_156315 ?auto_156314 ) ( ON ?auto_156316 ?auto_156315 ) ( not ( = ?auto_156312 ?auto_156313 ) ) ( not ( = ?auto_156312 ?auto_156314 ) ) ( not ( = ?auto_156312 ?auto_156315 ) ) ( not ( = ?auto_156312 ?auto_156316 ) ) ( not ( = ?auto_156312 ?auto_156317 ) ) ( not ( = ?auto_156312 ?auto_156318 ) ) ( not ( = ?auto_156312 ?auto_156321 ) ) ( not ( = ?auto_156313 ?auto_156314 ) ) ( not ( = ?auto_156313 ?auto_156315 ) ) ( not ( = ?auto_156313 ?auto_156316 ) ) ( not ( = ?auto_156313 ?auto_156317 ) ) ( not ( = ?auto_156313 ?auto_156318 ) ) ( not ( = ?auto_156313 ?auto_156321 ) ) ( not ( = ?auto_156314 ?auto_156315 ) ) ( not ( = ?auto_156314 ?auto_156316 ) ) ( not ( = ?auto_156314 ?auto_156317 ) ) ( not ( = ?auto_156314 ?auto_156318 ) ) ( not ( = ?auto_156314 ?auto_156321 ) ) ( not ( = ?auto_156315 ?auto_156316 ) ) ( not ( = ?auto_156315 ?auto_156317 ) ) ( not ( = ?auto_156315 ?auto_156318 ) ) ( not ( = ?auto_156315 ?auto_156321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156316 ?auto_156317 ?auto_156318 )
      ( MAKE-6CRATE-VERIFY ?auto_156312 ?auto_156313 ?auto_156314 ?auto_156315 ?auto_156316 ?auto_156317 ?auto_156318 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156376 - SURFACE
      ?auto_156377 - SURFACE
      ?auto_156378 - SURFACE
      ?auto_156379 - SURFACE
      ?auto_156380 - SURFACE
      ?auto_156381 - SURFACE
      ?auto_156382 - SURFACE
    )
    :vars
    (
      ?auto_156388 - HOIST
      ?auto_156387 - PLACE
      ?auto_156386 - PLACE
      ?auto_156383 - HOIST
      ?auto_156385 - SURFACE
      ?auto_156384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156388 ?auto_156387 ) ( IS-CRATE ?auto_156382 ) ( not ( = ?auto_156381 ?auto_156382 ) ) ( not ( = ?auto_156380 ?auto_156381 ) ) ( not ( = ?auto_156380 ?auto_156382 ) ) ( not ( = ?auto_156386 ?auto_156387 ) ) ( HOIST-AT ?auto_156383 ?auto_156386 ) ( not ( = ?auto_156388 ?auto_156383 ) ) ( AVAILABLE ?auto_156383 ) ( SURFACE-AT ?auto_156382 ?auto_156386 ) ( ON ?auto_156382 ?auto_156385 ) ( CLEAR ?auto_156382 ) ( not ( = ?auto_156381 ?auto_156385 ) ) ( not ( = ?auto_156382 ?auto_156385 ) ) ( not ( = ?auto_156380 ?auto_156385 ) ) ( TRUCK-AT ?auto_156384 ?auto_156387 ) ( SURFACE-AT ?auto_156380 ?auto_156387 ) ( CLEAR ?auto_156380 ) ( LIFTING ?auto_156388 ?auto_156381 ) ( IS-CRATE ?auto_156381 ) ( ON ?auto_156377 ?auto_156376 ) ( ON ?auto_156378 ?auto_156377 ) ( ON ?auto_156379 ?auto_156378 ) ( ON ?auto_156380 ?auto_156379 ) ( not ( = ?auto_156376 ?auto_156377 ) ) ( not ( = ?auto_156376 ?auto_156378 ) ) ( not ( = ?auto_156376 ?auto_156379 ) ) ( not ( = ?auto_156376 ?auto_156380 ) ) ( not ( = ?auto_156376 ?auto_156381 ) ) ( not ( = ?auto_156376 ?auto_156382 ) ) ( not ( = ?auto_156376 ?auto_156385 ) ) ( not ( = ?auto_156377 ?auto_156378 ) ) ( not ( = ?auto_156377 ?auto_156379 ) ) ( not ( = ?auto_156377 ?auto_156380 ) ) ( not ( = ?auto_156377 ?auto_156381 ) ) ( not ( = ?auto_156377 ?auto_156382 ) ) ( not ( = ?auto_156377 ?auto_156385 ) ) ( not ( = ?auto_156378 ?auto_156379 ) ) ( not ( = ?auto_156378 ?auto_156380 ) ) ( not ( = ?auto_156378 ?auto_156381 ) ) ( not ( = ?auto_156378 ?auto_156382 ) ) ( not ( = ?auto_156378 ?auto_156385 ) ) ( not ( = ?auto_156379 ?auto_156380 ) ) ( not ( = ?auto_156379 ?auto_156381 ) ) ( not ( = ?auto_156379 ?auto_156382 ) ) ( not ( = ?auto_156379 ?auto_156385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156380 ?auto_156381 ?auto_156382 )
      ( MAKE-6CRATE-VERIFY ?auto_156376 ?auto_156377 ?auto_156378 ?auto_156379 ?auto_156380 ?auto_156381 ?auto_156382 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156440 - SURFACE
      ?auto_156441 - SURFACE
      ?auto_156442 - SURFACE
      ?auto_156443 - SURFACE
      ?auto_156444 - SURFACE
      ?auto_156445 - SURFACE
      ?auto_156446 - SURFACE
    )
    :vars
    (
      ?auto_156450 - HOIST
      ?auto_156451 - PLACE
      ?auto_156449 - PLACE
      ?auto_156447 - HOIST
      ?auto_156448 - SURFACE
      ?auto_156452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156450 ?auto_156451 ) ( IS-CRATE ?auto_156446 ) ( not ( = ?auto_156445 ?auto_156446 ) ) ( not ( = ?auto_156444 ?auto_156445 ) ) ( not ( = ?auto_156444 ?auto_156446 ) ) ( not ( = ?auto_156449 ?auto_156451 ) ) ( HOIST-AT ?auto_156447 ?auto_156449 ) ( not ( = ?auto_156450 ?auto_156447 ) ) ( AVAILABLE ?auto_156447 ) ( SURFACE-AT ?auto_156446 ?auto_156449 ) ( ON ?auto_156446 ?auto_156448 ) ( CLEAR ?auto_156446 ) ( not ( = ?auto_156445 ?auto_156448 ) ) ( not ( = ?auto_156446 ?auto_156448 ) ) ( not ( = ?auto_156444 ?auto_156448 ) ) ( TRUCK-AT ?auto_156452 ?auto_156451 ) ( SURFACE-AT ?auto_156444 ?auto_156451 ) ( CLEAR ?auto_156444 ) ( IS-CRATE ?auto_156445 ) ( AVAILABLE ?auto_156450 ) ( IN ?auto_156445 ?auto_156452 ) ( ON ?auto_156441 ?auto_156440 ) ( ON ?auto_156442 ?auto_156441 ) ( ON ?auto_156443 ?auto_156442 ) ( ON ?auto_156444 ?auto_156443 ) ( not ( = ?auto_156440 ?auto_156441 ) ) ( not ( = ?auto_156440 ?auto_156442 ) ) ( not ( = ?auto_156440 ?auto_156443 ) ) ( not ( = ?auto_156440 ?auto_156444 ) ) ( not ( = ?auto_156440 ?auto_156445 ) ) ( not ( = ?auto_156440 ?auto_156446 ) ) ( not ( = ?auto_156440 ?auto_156448 ) ) ( not ( = ?auto_156441 ?auto_156442 ) ) ( not ( = ?auto_156441 ?auto_156443 ) ) ( not ( = ?auto_156441 ?auto_156444 ) ) ( not ( = ?auto_156441 ?auto_156445 ) ) ( not ( = ?auto_156441 ?auto_156446 ) ) ( not ( = ?auto_156441 ?auto_156448 ) ) ( not ( = ?auto_156442 ?auto_156443 ) ) ( not ( = ?auto_156442 ?auto_156444 ) ) ( not ( = ?auto_156442 ?auto_156445 ) ) ( not ( = ?auto_156442 ?auto_156446 ) ) ( not ( = ?auto_156442 ?auto_156448 ) ) ( not ( = ?auto_156443 ?auto_156444 ) ) ( not ( = ?auto_156443 ?auto_156445 ) ) ( not ( = ?auto_156443 ?auto_156446 ) ) ( not ( = ?auto_156443 ?auto_156448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156444 ?auto_156445 ?auto_156446 )
      ( MAKE-6CRATE-VERIFY ?auto_156440 ?auto_156441 ?auto_156442 ?auto_156443 ?auto_156444 ?auto_156445 ?auto_156446 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158396 - SURFACE
      ?auto_158397 - SURFACE
      ?auto_158398 - SURFACE
      ?auto_158399 - SURFACE
      ?auto_158400 - SURFACE
      ?auto_158401 - SURFACE
      ?auto_158402 - SURFACE
      ?auto_158403 - SURFACE
    )
    :vars
    (
      ?auto_158404 - HOIST
      ?auto_158405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158404 ?auto_158405 ) ( SURFACE-AT ?auto_158402 ?auto_158405 ) ( CLEAR ?auto_158402 ) ( LIFTING ?auto_158404 ?auto_158403 ) ( IS-CRATE ?auto_158403 ) ( not ( = ?auto_158402 ?auto_158403 ) ) ( ON ?auto_158397 ?auto_158396 ) ( ON ?auto_158398 ?auto_158397 ) ( ON ?auto_158399 ?auto_158398 ) ( ON ?auto_158400 ?auto_158399 ) ( ON ?auto_158401 ?auto_158400 ) ( ON ?auto_158402 ?auto_158401 ) ( not ( = ?auto_158396 ?auto_158397 ) ) ( not ( = ?auto_158396 ?auto_158398 ) ) ( not ( = ?auto_158396 ?auto_158399 ) ) ( not ( = ?auto_158396 ?auto_158400 ) ) ( not ( = ?auto_158396 ?auto_158401 ) ) ( not ( = ?auto_158396 ?auto_158402 ) ) ( not ( = ?auto_158396 ?auto_158403 ) ) ( not ( = ?auto_158397 ?auto_158398 ) ) ( not ( = ?auto_158397 ?auto_158399 ) ) ( not ( = ?auto_158397 ?auto_158400 ) ) ( not ( = ?auto_158397 ?auto_158401 ) ) ( not ( = ?auto_158397 ?auto_158402 ) ) ( not ( = ?auto_158397 ?auto_158403 ) ) ( not ( = ?auto_158398 ?auto_158399 ) ) ( not ( = ?auto_158398 ?auto_158400 ) ) ( not ( = ?auto_158398 ?auto_158401 ) ) ( not ( = ?auto_158398 ?auto_158402 ) ) ( not ( = ?auto_158398 ?auto_158403 ) ) ( not ( = ?auto_158399 ?auto_158400 ) ) ( not ( = ?auto_158399 ?auto_158401 ) ) ( not ( = ?auto_158399 ?auto_158402 ) ) ( not ( = ?auto_158399 ?auto_158403 ) ) ( not ( = ?auto_158400 ?auto_158401 ) ) ( not ( = ?auto_158400 ?auto_158402 ) ) ( not ( = ?auto_158400 ?auto_158403 ) ) ( not ( = ?auto_158401 ?auto_158402 ) ) ( not ( = ?auto_158401 ?auto_158403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_158402 ?auto_158403 )
      ( MAKE-7CRATE-VERIFY ?auto_158396 ?auto_158397 ?auto_158398 ?auto_158399 ?auto_158400 ?auto_158401 ?auto_158402 ?auto_158403 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158451 - SURFACE
      ?auto_158452 - SURFACE
      ?auto_158453 - SURFACE
      ?auto_158454 - SURFACE
      ?auto_158455 - SURFACE
      ?auto_158456 - SURFACE
      ?auto_158457 - SURFACE
      ?auto_158458 - SURFACE
    )
    :vars
    (
      ?auto_158461 - HOIST
      ?auto_158460 - PLACE
      ?auto_158459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158461 ?auto_158460 ) ( SURFACE-AT ?auto_158457 ?auto_158460 ) ( CLEAR ?auto_158457 ) ( IS-CRATE ?auto_158458 ) ( not ( = ?auto_158457 ?auto_158458 ) ) ( TRUCK-AT ?auto_158459 ?auto_158460 ) ( AVAILABLE ?auto_158461 ) ( IN ?auto_158458 ?auto_158459 ) ( ON ?auto_158457 ?auto_158456 ) ( not ( = ?auto_158456 ?auto_158457 ) ) ( not ( = ?auto_158456 ?auto_158458 ) ) ( ON ?auto_158452 ?auto_158451 ) ( ON ?auto_158453 ?auto_158452 ) ( ON ?auto_158454 ?auto_158453 ) ( ON ?auto_158455 ?auto_158454 ) ( ON ?auto_158456 ?auto_158455 ) ( not ( = ?auto_158451 ?auto_158452 ) ) ( not ( = ?auto_158451 ?auto_158453 ) ) ( not ( = ?auto_158451 ?auto_158454 ) ) ( not ( = ?auto_158451 ?auto_158455 ) ) ( not ( = ?auto_158451 ?auto_158456 ) ) ( not ( = ?auto_158451 ?auto_158457 ) ) ( not ( = ?auto_158451 ?auto_158458 ) ) ( not ( = ?auto_158452 ?auto_158453 ) ) ( not ( = ?auto_158452 ?auto_158454 ) ) ( not ( = ?auto_158452 ?auto_158455 ) ) ( not ( = ?auto_158452 ?auto_158456 ) ) ( not ( = ?auto_158452 ?auto_158457 ) ) ( not ( = ?auto_158452 ?auto_158458 ) ) ( not ( = ?auto_158453 ?auto_158454 ) ) ( not ( = ?auto_158453 ?auto_158455 ) ) ( not ( = ?auto_158453 ?auto_158456 ) ) ( not ( = ?auto_158453 ?auto_158457 ) ) ( not ( = ?auto_158453 ?auto_158458 ) ) ( not ( = ?auto_158454 ?auto_158455 ) ) ( not ( = ?auto_158454 ?auto_158456 ) ) ( not ( = ?auto_158454 ?auto_158457 ) ) ( not ( = ?auto_158454 ?auto_158458 ) ) ( not ( = ?auto_158455 ?auto_158456 ) ) ( not ( = ?auto_158455 ?auto_158457 ) ) ( not ( = ?auto_158455 ?auto_158458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158456 ?auto_158457 ?auto_158458 )
      ( MAKE-7CRATE-VERIFY ?auto_158451 ?auto_158452 ?auto_158453 ?auto_158454 ?auto_158455 ?auto_158456 ?auto_158457 ?auto_158458 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158514 - SURFACE
      ?auto_158515 - SURFACE
      ?auto_158516 - SURFACE
      ?auto_158517 - SURFACE
      ?auto_158518 - SURFACE
      ?auto_158519 - SURFACE
      ?auto_158520 - SURFACE
      ?auto_158521 - SURFACE
    )
    :vars
    (
      ?auto_158524 - HOIST
      ?auto_158525 - PLACE
      ?auto_158522 - TRUCK
      ?auto_158523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158524 ?auto_158525 ) ( SURFACE-AT ?auto_158520 ?auto_158525 ) ( CLEAR ?auto_158520 ) ( IS-CRATE ?auto_158521 ) ( not ( = ?auto_158520 ?auto_158521 ) ) ( AVAILABLE ?auto_158524 ) ( IN ?auto_158521 ?auto_158522 ) ( ON ?auto_158520 ?auto_158519 ) ( not ( = ?auto_158519 ?auto_158520 ) ) ( not ( = ?auto_158519 ?auto_158521 ) ) ( TRUCK-AT ?auto_158522 ?auto_158523 ) ( not ( = ?auto_158523 ?auto_158525 ) ) ( ON ?auto_158515 ?auto_158514 ) ( ON ?auto_158516 ?auto_158515 ) ( ON ?auto_158517 ?auto_158516 ) ( ON ?auto_158518 ?auto_158517 ) ( ON ?auto_158519 ?auto_158518 ) ( not ( = ?auto_158514 ?auto_158515 ) ) ( not ( = ?auto_158514 ?auto_158516 ) ) ( not ( = ?auto_158514 ?auto_158517 ) ) ( not ( = ?auto_158514 ?auto_158518 ) ) ( not ( = ?auto_158514 ?auto_158519 ) ) ( not ( = ?auto_158514 ?auto_158520 ) ) ( not ( = ?auto_158514 ?auto_158521 ) ) ( not ( = ?auto_158515 ?auto_158516 ) ) ( not ( = ?auto_158515 ?auto_158517 ) ) ( not ( = ?auto_158515 ?auto_158518 ) ) ( not ( = ?auto_158515 ?auto_158519 ) ) ( not ( = ?auto_158515 ?auto_158520 ) ) ( not ( = ?auto_158515 ?auto_158521 ) ) ( not ( = ?auto_158516 ?auto_158517 ) ) ( not ( = ?auto_158516 ?auto_158518 ) ) ( not ( = ?auto_158516 ?auto_158519 ) ) ( not ( = ?auto_158516 ?auto_158520 ) ) ( not ( = ?auto_158516 ?auto_158521 ) ) ( not ( = ?auto_158517 ?auto_158518 ) ) ( not ( = ?auto_158517 ?auto_158519 ) ) ( not ( = ?auto_158517 ?auto_158520 ) ) ( not ( = ?auto_158517 ?auto_158521 ) ) ( not ( = ?auto_158518 ?auto_158519 ) ) ( not ( = ?auto_158518 ?auto_158520 ) ) ( not ( = ?auto_158518 ?auto_158521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158519 ?auto_158520 ?auto_158521 )
      ( MAKE-7CRATE-VERIFY ?auto_158514 ?auto_158515 ?auto_158516 ?auto_158517 ?auto_158518 ?auto_158519 ?auto_158520 ?auto_158521 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158584 - SURFACE
      ?auto_158585 - SURFACE
      ?auto_158586 - SURFACE
      ?auto_158587 - SURFACE
      ?auto_158588 - SURFACE
      ?auto_158589 - SURFACE
      ?auto_158590 - SURFACE
      ?auto_158591 - SURFACE
    )
    :vars
    (
      ?auto_158596 - HOIST
      ?auto_158592 - PLACE
      ?auto_158593 - TRUCK
      ?auto_158595 - PLACE
      ?auto_158594 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_158596 ?auto_158592 ) ( SURFACE-AT ?auto_158590 ?auto_158592 ) ( CLEAR ?auto_158590 ) ( IS-CRATE ?auto_158591 ) ( not ( = ?auto_158590 ?auto_158591 ) ) ( AVAILABLE ?auto_158596 ) ( ON ?auto_158590 ?auto_158589 ) ( not ( = ?auto_158589 ?auto_158590 ) ) ( not ( = ?auto_158589 ?auto_158591 ) ) ( TRUCK-AT ?auto_158593 ?auto_158595 ) ( not ( = ?auto_158595 ?auto_158592 ) ) ( HOIST-AT ?auto_158594 ?auto_158595 ) ( LIFTING ?auto_158594 ?auto_158591 ) ( not ( = ?auto_158596 ?auto_158594 ) ) ( ON ?auto_158585 ?auto_158584 ) ( ON ?auto_158586 ?auto_158585 ) ( ON ?auto_158587 ?auto_158586 ) ( ON ?auto_158588 ?auto_158587 ) ( ON ?auto_158589 ?auto_158588 ) ( not ( = ?auto_158584 ?auto_158585 ) ) ( not ( = ?auto_158584 ?auto_158586 ) ) ( not ( = ?auto_158584 ?auto_158587 ) ) ( not ( = ?auto_158584 ?auto_158588 ) ) ( not ( = ?auto_158584 ?auto_158589 ) ) ( not ( = ?auto_158584 ?auto_158590 ) ) ( not ( = ?auto_158584 ?auto_158591 ) ) ( not ( = ?auto_158585 ?auto_158586 ) ) ( not ( = ?auto_158585 ?auto_158587 ) ) ( not ( = ?auto_158585 ?auto_158588 ) ) ( not ( = ?auto_158585 ?auto_158589 ) ) ( not ( = ?auto_158585 ?auto_158590 ) ) ( not ( = ?auto_158585 ?auto_158591 ) ) ( not ( = ?auto_158586 ?auto_158587 ) ) ( not ( = ?auto_158586 ?auto_158588 ) ) ( not ( = ?auto_158586 ?auto_158589 ) ) ( not ( = ?auto_158586 ?auto_158590 ) ) ( not ( = ?auto_158586 ?auto_158591 ) ) ( not ( = ?auto_158587 ?auto_158588 ) ) ( not ( = ?auto_158587 ?auto_158589 ) ) ( not ( = ?auto_158587 ?auto_158590 ) ) ( not ( = ?auto_158587 ?auto_158591 ) ) ( not ( = ?auto_158588 ?auto_158589 ) ) ( not ( = ?auto_158588 ?auto_158590 ) ) ( not ( = ?auto_158588 ?auto_158591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158589 ?auto_158590 ?auto_158591 )
      ( MAKE-7CRATE-VERIFY ?auto_158584 ?auto_158585 ?auto_158586 ?auto_158587 ?auto_158588 ?auto_158589 ?auto_158590 ?auto_158591 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158661 - SURFACE
      ?auto_158662 - SURFACE
      ?auto_158663 - SURFACE
      ?auto_158664 - SURFACE
      ?auto_158665 - SURFACE
      ?auto_158666 - SURFACE
      ?auto_158667 - SURFACE
      ?auto_158668 - SURFACE
    )
    :vars
    (
      ?auto_158669 - HOIST
      ?auto_158673 - PLACE
      ?auto_158671 - TRUCK
      ?auto_158670 - PLACE
      ?auto_158674 - HOIST
      ?auto_158672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158669 ?auto_158673 ) ( SURFACE-AT ?auto_158667 ?auto_158673 ) ( CLEAR ?auto_158667 ) ( IS-CRATE ?auto_158668 ) ( not ( = ?auto_158667 ?auto_158668 ) ) ( AVAILABLE ?auto_158669 ) ( ON ?auto_158667 ?auto_158666 ) ( not ( = ?auto_158666 ?auto_158667 ) ) ( not ( = ?auto_158666 ?auto_158668 ) ) ( TRUCK-AT ?auto_158671 ?auto_158670 ) ( not ( = ?auto_158670 ?auto_158673 ) ) ( HOIST-AT ?auto_158674 ?auto_158670 ) ( not ( = ?auto_158669 ?auto_158674 ) ) ( AVAILABLE ?auto_158674 ) ( SURFACE-AT ?auto_158668 ?auto_158670 ) ( ON ?auto_158668 ?auto_158672 ) ( CLEAR ?auto_158668 ) ( not ( = ?auto_158667 ?auto_158672 ) ) ( not ( = ?auto_158668 ?auto_158672 ) ) ( not ( = ?auto_158666 ?auto_158672 ) ) ( ON ?auto_158662 ?auto_158661 ) ( ON ?auto_158663 ?auto_158662 ) ( ON ?auto_158664 ?auto_158663 ) ( ON ?auto_158665 ?auto_158664 ) ( ON ?auto_158666 ?auto_158665 ) ( not ( = ?auto_158661 ?auto_158662 ) ) ( not ( = ?auto_158661 ?auto_158663 ) ) ( not ( = ?auto_158661 ?auto_158664 ) ) ( not ( = ?auto_158661 ?auto_158665 ) ) ( not ( = ?auto_158661 ?auto_158666 ) ) ( not ( = ?auto_158661 ?auto_158667 ) ) ( not ( = ?auto_158661 ?auto_158668 ) ) ( not ( = ?auto_158661 ?auto_158672 ) ) ( not ( = ?auto_158662 ?auto_158663 ) ) ( not ( = ?auto_158662 ?auto_158664 ) ) ( not ( = ?auto_158662 ?auto_158665 ) ) ( not ( = ?auto_158662 ?auto_158666 ) ) ( not ( = ?auto_158662 ?auto_158667 ) ) ( not ( = ?auto_158662 ?auto_158668 ) ) ( not ( = ?auto_158662 ?auto_158672 ) ) ( not ( = ?auto_158663 ?auto_158664 ) ) ( not ( = ?auto_158663 ?auto_158665 ) ) ( not ( = ?auto_158663 ?auto_158666 ) ) ( not ( = ?auto_158663 ?auto_158667 ) ) ( not ( = ?auto_158663 ?auto_158668 ) ) ( not ( = ?auto_158663 ?auto_158672 ) ) ( not ( = ?auto_158664 ?auto_158665 ) ) ( not ( = ?auto_158664 ?auto_158666 ) ) ( not ( = ?auto_158664 ?auto_158667 ) ) ( not ( = ?auto_158664 ?auto_158668 ) ) ( not ( = ?auto_158664 ?auto_158672 ) ) ( not ( = ?auto_158665 ?auto_158666 ) ) ( not ( = ?auto_158665 ?auto_158667 ) ) ( not ( = ?auto_158665 ?auto_158668 ) ) ( not ( = ?auto_158665 ?auto_158672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158666 ?auto_158667 ?auto_158668 )
      ( MAKE-7CRATE-VERIFY ?auto_158661 ?auto_158662 ?auto_158663 ?auto_158664 ?auto_158665 ?auto_158666 ?auto_158667 ?auto_158668 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158739 - SURFACE
      ?auto_158740 - SURFACE
      ?auto_158741 - SURFACE
      ?auto_158742 - SURFACE
      ?auto_158743 - SURFACE
      ?auto_158744 - SURFACE
      ?auto_158745 - SURFACE
      ?auto_158746 - SURFACE
    )
    :vars
    (
      ?auto_158748 - HOIST
      ?auto_158752 - PLACE
      ?auto_158751 - PLACE
      ?auto_158747 - HOIST
      ?auto_158750 - SURFACE
      ?auto_158749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158748 ?auto_158752 ) ( SURFACE-AT ?auto_158745 ?auto_158752 ) ( CLEAR ?auto_158745 ) ( IS-CRATE ?auto_158746 ) ( not ( = ?auto_158745 ?auto_158746 ) ) ( AVAILABLE ?auto_158748 ) ( ON ?auto_158745 ?auto_158744 ) ( not ( = ?auto_158744 ?auto_158745 ) ) ( not ( = ?auto_158744 ?auto_158746 ) ) ( not ( = ?auto_158751 ?auto_158752 ) ) ( HOIST-AT ?auto_158747 ?auto_158751 ) ( not ( = ?auto_158748 ?auto_158747 ) ) ( AVAILABLE ?auto_158747 ) ( SURFACE-AT ?auto_158746 ?auto_158751 ) ( ON ?auto_158746 ?auto_158750 ) ( CLEAR ?auto_158746 ) ( not ( = ?auto_158745 ?auto_158750 ) ) ( not ( = ?auto_158746 ?auto_158750 ) ) ( not ( = ?auto_158744 ?auto_158750 ) ) ( TRUCK-AT ?auto_158749 ?auto_158752 ) ( ON ?auto_158740 ?auto_158739 ) ( ON ?auto_158741 ?auto_158740 ) ( ON ?auto_158742 ?auto_158741 ) ( ON ?auto_158743 ?auto_158742 ) ( ON ?auto_158744 ?auto_158743 ) ( not ( = ?auto_158739 ?auto_158740 ) ) ( not ( = ?auto_158739 ?auto_158741 ) ) ( not ( = ?auto_158739 ?auto_158742 ) ) ( not ( = ?auto_158739 ?auto_158743 ) ) ( not ( = ?auto_158739 ?auto_158744 ) ) ( not ( = ?auto_158739 ?auto_158745 ) ) ( not ( = ?auto_158739 ?auto_158746 ) ) ( not ( = ?auto_158739 ?auto_158750 ) ) ( not ( = ?auto_158740 ?auto_158741 ) ) ( not ( = ?auto_158740 ?auto_158742 ) ) ( not ( = ?auto_158740 ?auto_158743 ) ) ( not ( = ?auto_158740 ?auto_158744 ) ) ( not ( = ?auto_158740 ?auto_158745 ) ) ( not ( = ?auto_158740 ?auto_158746 ) ) ( not ( = ?auto_158740 ?auto_158750 ) ) ( not ( = ?auto_158741 ?auto_158742 ) ) ( not ( = ?auto_158741 ?auto_158743 ) ) ( not ( = ?auto_158741 ?auto_158744 ) ) ( not ( = ?auto_158741 ?auto_158745 ) ) ( not ( = ?auto_158741 ?auto_158746 ) ) ( not ( = ?auto_158741 ?auto_158750 ) ) ( not ( = ?auto_158742 ?auto_158743 ) ) ( not ( = ?auto_158742 ?auto_158744 ) ) ( not ( = ?auto_158742 ?auto_158745 ) ) ( not ( = ?auto_158742 ?auto_158746 ) ) ( not ( = ?auto_158742 ?auto_158750 ) ) ( not ( = ?auto_158743 ?auto_158744 ) ) ( not ( = ?auto_158743 ?auto_158745 ) ) ( not ( = ?auto_158743 ?auto_158746 ) ) ( not ( = ?auto_158743 ?auto_158750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158744 ?auto_158745 ?auto_158746 )
      ( MAKE-7CRATE-VERIFY ?auto_158739 ?auto_158740 ?auto_158741 ?auto_158742 ?auto_158743 ?auto_158744 ?auto_158745 ?auto_158746 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158817 - SURFACE
      ?auto_158818 - SURFACE
      ?auto_158819 - SURFACE
      ?auto_158820 - SURFACE
      ?auto_158821 - SURFACE
      ?auto_158822 - SURFACE
      ?auto_158823 - SURFACE
      ?auto_158824 - SURFACE
    )
    :vars
    (
      ?auto_158828 - HOIST
      ?auto_158827 - PLACE
      ?auto_158826 - PLACE
      ?auto_158830 - HOIST
      ?auto_158829 - SURFACE
      ?auto_158825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158828 ?auto_158827 ) ( IS-CRATE ?auto_158824 ) ( not ( = ?auto_158823 ?auto_158824 ) ) ( not ( = ?auto_158822 ?auto_158823 ) ) ( not ( = ?auto_158822 ?auto_158824 ) ) ( not ( = ?auto_158826 ?auto_158827 ) ) ( HOIST-AT ?auto_158830 ?auto_158826 ) ( not ( = ?auto_158828 ?auto_158830 ) ) ( AVAILABLE ?auto_158830 ) ( SURFACE-AT ?auto_158824 ?auto_158826 ) ( ON ?auto_158824 ?auto_158829 ) ( CLEAR ?auto_158824 ) ( not ( = ?auto_158823 ?auto_158829 ) ) ( not ( = ?auto_158824 ?auto_158829 ) ) ( not ( = ?auto_158822 ?auto_158829 ) ) ( TRUCK-AT ?auto_158825 ?auto_158827 ) ( SURFACE-AT ?auto_158822 ?auto_158827 ) ( CLEAR ?auto_158822 ) ( LIFTING ?auto_158828 ?auto_158823 ) ( IS-CRATE ?auto_158823 ) ( ON ?auto_158818 ?auto_158817 ) ( ON ?auto_158819 ?auto_158818 ) ( ON ?auto_158820 ?auto_158819 ) ( ON ?auto_158821 ?auto_158820 ) ( ON ?auto_158822 ?auto_158821 ) ( not ( = ?auto_158817 ?auto_158818 ) ) ( not ( = ?auto_158817 ?auto_158819 ) ) ( not ( = ?auto_158817 ?auto_158820 ) ) ( not ( = ?auto_158817 ?auto_158821 ) ) ( not ( = ?auto_158817 ?auto_158822 ) ) ( not ( = ?auto_158817 ?auto_158823 ) ) ( not ( = ?auto_158817 ?auto_158824 ) ) ( not ( = ?auto_158817 ?auto_158829 ) ) ( not ( = ?auto_158818 ?auto_158819 ) ) ( not ( = ?auto_158818 ?auto_158820 ) ) ( not ( = ?auto_158818 ?auto_158821 ) ) ( not ( = ?auto_158818 ?auto_158822 ) ) ( not ( = ?auto_158818 ?auto_158823 ) ) ( not ( = ?auto_158818 ?auto_158824 ) ) ( not ( = ?auto_158818 ?auto_158829 ) ) ( not ( = ?auto_158819 ?auto_158820 ) ) ( not ( = ?auto_158819 ?auto_158821 ) ) ( not ( = ?auto_158819 ?auto_158822 ) ) ( not ( = ?auto_158819 ?auto_158823 ) ) ( not ( = ?auto_158819 ?auto_158824 ) ) ( not ( = ?auto_158819 ?auto_158829 ) ) ( not ( = ?auto_158820 ?auto_158821 ) ) ( not ( = ?auto_158820 ?auto_158822 ) ) ( not ( = ?auto_158820 ?auto_158823 ) ) ( not ( = ?auto_158820 ?auto_158824 ) ) ( not ( = ?auto_158820 ?auto_158829 ) ) ( not ( = ?auto_158821 ?auto_158822 ) ) ( not ( = ?auto_158821 ?auto_158823 ) ) ( not ( = ?auto_158821 ?auto_158824 ) ) ( not ( = ?auto_158821 ?auto_158829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158822 ?auto_158823 ?auto_158824 )
      ( MAKE-7CRATE-VERIFY ?auto_158817 ?auto_158818 ?auto_158819 ?auto_158820 ?auto_158821 ?auto_158822 ?auto_158823 ?auto_158824 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158895 - SURFACE
      ?auto_158896 - SURFACE
      ?auto_158897 - SURFACE
      ?auto_158898 - SURFACE
      ?auto_158899 - SURFACE
      ?auto_158900 - SURFACE
      ?auto_158901 - SURFACE
      ?auto_158902 - SURFACE
    )
    :vars
    (
      ?auto_158906 - HOIST
      ?auto_158908 - PLACE
      ?auto_158905 - PLACE
      ?auto_158903 - HOIST
      ?auto_158907 - SURFACE
      ?auto_158904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158906 ?auto_158908 ) ( IS-CRATE ?auto_158902 ) ( not ( = ?auto_158901 ?auto_158902 ) ) ( not ( = ?auto_158900 ?auto_158901 ) ) ( not ( = ?auto_158900 ?auto_158902 ) ) ( not ( = ?auto_158905 ?auto_158908 ) ) ( HOIST-AT ?auto_158903 ?auto_158905 ) ( not ( = ?auto_158906 ?auto_158903 ) ) ( AVAILABLE ?auto_158903 ) ( SURFACE-AT ?auto_158902 ?auto_158905 ) ( ON ?auto_158902 ?auto_158907 ) ( CLEAR ?auto_158902 ) ( not ( = ?auto_158901 ?auto_158907 ) ) ( not ( = ?auto_158902 ?auto_158907 ) ) ( not ( = ?auto_158900 ?auto_158907 ) ) ( TRUCK-AT ?auto_158904 ?auto_158908 ) ( SURFACE-AT ?auto_158900 ?auto_158908 ) ( CLEAR ?auto_158900 ) ( IS-CRATE ?auto_158901 ) ( AVAILABLE ?auto_158906 ) ( IN ?auto_158901 ?auto_158904 ) ( ON ?auto_158896 ?auto_158895 ) ( ON ?auto_158897 ?auto_158896 ) ( ON ?auto_158898 ?auto_158897 ) ( ON ?auto_158899 ?auto_158898 ) ( ON ?auto_158900 ?auto_158899 ) ( not ( = ?auto_158895 ?auto_158896 ) ) ( not ( = ?auto_158895 ?auto_158897 ) ) ( not ( = ?auto_158895 ?auto_158898 ) ) ( not ( = ?auto_158895 ?auto_158899 ) ) ( not ( = ?auto_158895 ?auto_158900 ) ) ( not ( = ?auto_158895 ?auto_158901 ) ) ( not ( = ?auto_158895 ?auto_158902 ) ) ( not ( = ?auto_158895 ?auto_158907 ) ) ( not ( = ?auto_158896 ?auto_158897 ) ) ( not ( = ?auto_158896 ?auto_158898 ) ) ( not ( = ?auto_158896 ?auto_158899 ) ) ( not ( = ?auto_158896 ?auto_158900 ) ) ( not ( = ?auto_158896 ?auto_158901 ) ) ( not ( = ?auto_158896 ?auto_158902 ) ) ( not ( = ?auto_158896 ?auto_158907 ) ) ( not ( = ?auto_158897 ?auto_158898 ) ) ( not ( = ?auto_158897 ?auto_158899 ) ) ( not ( = ?auto_158897 ?auto_158900 ) ) ( not ( = ?auto_158897 ?auto_158901 ) ) ( not ( = ?auto_158897 ?auto_158902 ) ) ( not ( = ?auto_158897 ?auto_158907 ) ) ( not ( = ?auto_158898 ?auto_158899 ) ) ( not ( = ?auto_158898 ?auto_158900 ) ) ( not ( = ?auto_158898 ?auto_158901 ) ) ( not ( = ?auto_158898 ?auto_158902 ) ) ( not ( = ?auto_158898 ?auto_158907 ) ) ( not ( = ?auto_158899 ?auto_158900 ) ) ( not ( = ?auto_158899 ?auto_158901 ) ) ( not ( = ?auto_158899 ?auto_158902 ) ) ( not ( = ?auto_158899 ?auto_158907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158900 ?auto_158901 ?auto_158902 )
      ( MAKE-7CRATE-VERIFY ?auto_158895 ?auto_158896 ?auto_158897 ?auto_158898 ?auto_158899 ?auto_158900 ?auto_158901 ?auto_158902 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161814 - SURFACE
      ?auto_161815 - SURFACE
      ?auto_161816 - SURFACE
      ?auto_161817 - SURFACE
      ?auto_161818 - SURFACE
      ?auto_161819 - SURFACE
      ?auto_161820 - SURFACE
      ?auto_161821 - SURFACE
      ?auto_161822 - SURFACE
    )
    :vars
    (
      ?auto_161823 - HOIST
      ?auto_161824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161823 ?auto_161824 ) ( SURFACE-AT ?auto_161821 ?auto_161824 ) ( CLEAR ?auto_161821 ) ( LIFTING ?auto_161823 ?auto_161822 ) ( IS-CRATE ?auto_161822 ) ( not ( = ?auto_161821 ?auto_161822 ) ) ( ON ?auto_161815 ?auto_161814 ) ( ON ?auto_161816 ?auto_161815 ) ( ON ?auto_161817 ?auto_161816 ) ( ON ?auto_161818 ?auto_161817 ) ( ON ?auto_161819 ?auto_161818 ) ( ON ?auto_161820 ?auto_161819 ) ( ON ?auto_161821 ?auto_161820 ) ( not ( = ?auto_161814 ?auto_161815 ) ) ( not ( = ?auto_161814 ?auto_161816 ) ) ( not ( = ?auto_161814 ?auto_161817 ) ) ( not ( = ?auto_161814 ?auto_161818 ) ) ( not ( = ?auto_161814 ?auto_161819 ) ) ( not ( = ?auto_161814 ?auto_161820 ) ) ( not ( = ?auto_161814 ?auto_161821 ) ) ( not ( = ?auto_161814 ?auto_161822 ) ) ( not ( = ?auto_161815 ?auto_161816 ) ) ( not ( = ?auto_161815 ?auto_161817 ) ) ( not ( = ?auto_161815 ?auto_161818 ) ) ( not ( = ?auto_161815 ?auto_161819 ) ) ( not ( = ?auto_161815 ?auto_161820 ) ) ( not ( = ?auto_161815 ?auto_161821 ) ) ( not ( = ?auto_161815 ?auto_161822 ) ) ( not ( = ?auto_161816 ?auto_161817 ) ) ( not ( = ?auto_161816 ?auto_161818 ) ) ( not ( = ?auto_161816 ?auto_161819 ) ) ( not ( = ?auto_161816 ?auto_161820 ) ) ( not ( = ?auto_161816 ?auto_161821 ) ) ( not ( = ?auto_161816 ?auto_161822 ) ) ( not ( = ?auto_161817 ?auto_161818 ) ) ( not ( = ?auto_161817 ?auto_161819 ) ) ( not ( = ?auto_161817 ?auto_161820 ) ) ( not ( = ?auto_161817 ?auto_161821 ) ) ( not ( = ?auto_161817 ?auto_161822 ) ) ( not ( = ?auto_161818 ?auto_161819 ) ) ( not ( = ?auto_161818 ?auto_161820 ) ) ( not ( = ?auto_161818 ?auto_161821 ) ) ( not ( = ?auto_161818 ?auto_161822 ) ) ( not ( = ?auto_161819 ?auto_161820 ) ) ( not ( = ?auto_161819 ?auto_161821 ) ) ( not ( = ?auto_161819 ?auto_161822 ) ) ( not ( = ?auto_161820 ?auto_161821 ) ) ( not ( = ?auto_161820 ?auto_161822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_161821 ?auto_161822 )
      ( MAKE-8CRATE-VERIFY ?auto_161814 ?auto_161815 ?auto_161816 ?auto_161817 ?auto_161818 ?auto_161819 ?auto_161820 ?auto_161821 ?auto_161822 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161881 - SURFACE
      ?auto_161882 - SURFACE
      ?auto_161883 - SURFACE
      ?auto_161884 - SURFACE
      ?auto_161885 - SURFACE
      ?auto_161886 - SURFACE
      ?auto_161887 - SURFACE
      ?auto_161888 - SURFACE
      ?auto_161889 - SURFACE
    )
    :vars
    (
      ?auto_161891 - HOIST
      ?auto_161892 - PLACE
      ?auto_161890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_161891 ?auto_161892 ) ( SURFACE-AT ?auto_161888 ?auto_161892 ) ( CLEAR ?auto_161888 ) ( IS-CRATE ?auto_161889 ) ( not ( = ?auto_161888 ?auto_161889 ) ) ( TRUCK-AT ?auto_161890 ?auto_161892 ) ( AVAILABLE ?auto_161891 ) ( IN ?auto_161889 ?auto_161890 ) ( ON ?auto_161888 ?auto_161887 ) ( not ( = ?auto_161887 ?auto_161888 ) ) ( not ( = ?auto_161887 ?auto_161889 ) ) ( ON ?auto_161882 ?auto_161881 ) ( ON ?auto_161883 ?auto_161882 ) ( ON ?auto_161884 ?auto_161883 ) ( ON ?auto_161885 ?auto_161884 ) ( ON ?auto_161886 ?auto_161885 ) ( ON ?auto_161887 ?auto_161886 ) ( not ( = ?auto_161881 ?auto_161882 ) ) ( not ( = ?auto_161881 ?auto_161883 ) ) ( not ( = ?auto_161881 ?auto_161884 ) ) ( not ( = ?auto_161881 ?auto_161885 ) ) ( not ( = ?auto_161881 ?auto_161886 ) ) ( not ( = ?auto_161881 ?auto_161887 ) ) ( not ( = ?auto_161881 ?auto_161888 ) ) ( not ( = ?auto_161881 ?auto_161889 ) ) ( not ( = ?auto_161882 ?auto_161883 ) ) ( not ( = ?auto_161882 ?auto_161884 ) ) ( not ( = ?auto_161882 ?auto_161885 ) ) ( not ( = ?auto_161882 ?auto_161886 ) ) ( not ( = ?auto_161882 ?auto_161887 ) ) ( not ( = ?auto_161882 ?auto_161888 ) ) ( not ( = ?auto_161882 ?auto_161889 ) ) ( not ( = ?auto_161883 ?auto_161884 ) ) ( not ( = ?auto_161883 ?auto_161885 ) ) ( not ( = ?auto_161883 ?auto_161886 ) ) ( not ( = ?auto_161883 ?auto_161887 ) ) ( not ( = ?auto_161883 ?auto_161888 ) ) ( not ( = ?auto_161883 ?auto_161889 ) ) ( not ( = ?auto_161884 ?auto_161885 ) ) ( not ( = ?auto_161884 ?auto_161886 ) ) ( not ( = ?auto_161884 ?auto_161887 ) ) ( not ( = ?auto_161884 ?auto_161888 ) ) ( not ( = ?auto_161884 ?auto_161889 ) ) ( not ( = ?auto_161885 ?auto_161886 ) ) ( not ( = ?auto_161885 ?auto_161887 ) ) ( not ( = ?auto_161885 ?auto_161888 ) ) ( not ( = ?auto_161885 ?auto_161889 ) ) ( not ( = ?auto_161886 ?auto_161887 ) ) ( not ( = ?auto_161886 ?auto_161888 ) ) ( not ( = ?auto_161886 ?auto_161889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161887 ?auto_161888 ?auto_161889 )
      ( MAKE-8CRATE-VERIFY ?auto_161881 ?auto_161882 ?auto_161883 ?auto_161884 ?auto_161885 ?auto_161886 ?auto_161887 ?auto_161888 ?auto_161889 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161957 - SURFACE
      ?auto_161958 - SURFACE
      ?auto_161959 - SURFACE
      ?auto_161960 - SURFACE
      ?auto_161961 - SURFACE
      ?auto_161962 - SURFACE
      ?auto_161963 - SURFACE
      ?auto_161964 - SURFACE
      ?auto_161965 - SURFACE
    )
    :vars
    (
      ?auto_161966 - HOIST
      ?auto_161969 - PLACE
      ?auto_161968 - TRUCK
      ?auto_161967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161966 ?auto_161969 ) ( SURFACE-AT ?auto_161964 ?auto_161969 ) ( CLEAR ?auto_161964 ) ( IS-CRATE ?auto_161965 ) ( not ( = ?auto_161964 ?auto_161965 ) ) ( AVAILABLE ?auto_161966 ) ( IN ?auto_161965 ?auto_161968 ) ( ON ?auto_161964 ?auto_161963 ) ( not ( = ?auto_161963 ?auto_161964 ) ) ( not ( = ?auto_161963 ?auto_161965 ) ) ( TRUCK-AT ?auto_161968 ?auto_161967 ) ( not ( = ?auto_161967 ?auto_161969 ) ) ( ON ?auto_161958 ?auto_161957 ) ( ON ?auto_161959 ?auto_161958 ) ( ON ?auto_161960 ?auto_161959 ) ( ON ?auto_161961 ?auto_161960 ) ( ON ?auto_161962 ?auto_161961 ) ( ON ?auto_161963 ?auto_161962 ) ( not ( = ?auto_161957 ?auto_161958 ) ) ( not ( = ?auto_161957 ?auto_161959 ) ) ( not ( = ?auto_161957 ?auto_161960 ) ) ( not ( = ?auto_161957 ?auto_161961 ) ) ( not ( = ?auto_161957 ?auto_161962 ) ) ( not ( = ?auto_161957 ?auto_161963 ) ) ( not ( = ?auto_161957 ?auto_161964 ) ) ( not ( = ?auto_161957 ?auto_161965 ) ) ( not ( = ?auto_161958 ?auto_161959 ) ) ( not ( = ?auto_161958 ?auto_161960 ) ) ( not ( = ?auto_161958 ?auto_161961 ) ) ( not ( = ?auto_161958 ?auto_161962 ) ) ( not ( = ?auto_161958 ?auto_161963 ) ) ( not ( = ?auto_161958 ?auto_161964 ) ) ( not ( = ?auto_161958 ?auto_161965 ) ) ( not ( = ?auto_161959 ?auto_161960 ) ) ( not ( = ?auto_161959 ?auto_161961 ) ) ( not ( = ?auto_161959 ?auto_161962 ) ) ( not ( = ?auto_161959 ?auto_161963 ) ) ( not ( = ?auto_161959 ?auto_161964 ) ) ( not ( = ?auto_161959 ?auto_161965 ) ) ( not ( = ?auto_161960 ?auto_161961 ) ) ( not ( = ?auto_161960 ?auto_161962 ) ) ( not ( = ?auto_161960 ?auto_161963 ) ) ( not ( = ?auto_161960 ?auto_161964 ) ) ( not ( = ?auto_161960 ?auto_161965 ) ) ( not ( = ?auto_161961 ?auto_161962 ) ) ( not ( = ?auto_161961 ?auto_161963 ) ) ( not ( = ?auto_161961 ?auto_161964 ) ) ( not ( = ?auto_161961 ?auto_161965 ) ) ( not ( = ?auto_161962 ?auto_161963 ) ) ( not ( = ?auto_161962 ?auto_161964 ) ) ( not ( = ?auto_161962 ?auto_161965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161963 ?auto_161964 ?auto_161965 )
      ( MAKE-8CRATE-VERIFY ?auto_161957 ?auto_161958 ?auto_161959 ?auto_161960 ?auto_161961 ?auto_161962 ?auto_161963 ?auto_161964 ?auto_161965 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162041 - SURFACE
      ?auto_162042 - SURFACE
      ?auto_162043 - SURFACE
      ?auto_162044 - SURFACE
      ?auto_162045 - SURFACE
      ?auto_162046 - SURFACE
      ?auto_162047 - SURFACE
      ?auto_162048 - SURFACE
      ?auto_162049 - SURFACE
    )
    :vars
    (
      ?auto_162054 - HOIST
      ?auto_162050 - PLACE
      ?auto_162053 - TRUCK
      ?auto_162052 - PLACE
      ?auto_162051 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_162054 ?auto_162050 ) ( SURFACE-AT ?auto_162048 ?auto_162050 ) ( CLEAR ?auto_162048 ) ( IS-CRATE ?auto_162049 ) ( not ( = ?auto_162048 ?auto_162049 ) ) ( AVAILABLE ?auto_162054 ) ( ON ?auto_162048 ?auto_162047 ) ( not ( = ?auto_162047 ?auto_162048 ) ) ( not ( = ?auto_162047 ?auto_162049 ) ) ( TRUCK-AT ?auto_162053 ?auto_162052 ) ( not ( = ?auto_162052 ?auto_162050 ) ) ( HOIST-AT ?auto_162051 ?auto_162052 ) ( LIFTING ?auto_162051 ?auto_162049 ) ( not ( = ?auto_162054 ?auto_162051 ) ) ( ON ?auto_162042 ?auto_162041 ) ( ON ?auto_162043 ?auto_162042 ) ( ON ?auto_162044 ?auto_162043 ) ( ON ?auto_162045 ?auto_162044 ) ( ON ?auto_162046 ?auto_162045 ) ( ON ?auto_162047 ?auto_162046 ) ( not ( = ?auto_162041 ?auto_162042 ) ) ( not ( = ?auto_162041 ?auto_162043 ) ) ( not ( = ?auto_162041 ?auto_162044 ) ) ( not ( = ?auto_162041 ?auto_162045 ) ) ( not ( = ?auto_162041 ?auto_162046 ) ) ( not ( = ?auto_162041 ?auto_162047 ) ) ( not ( = ?auto_162041 ?auto_162048 ) ) ( not ( = ?auto_162041 ?auto_162049 ) ) ( not ( = ?auto_162042 ?auto_162043 ) ) ( not ( = ?auto_162042 ?auto_162044 ) ) ( not ( = ?auto_162042 ?auto_162045 ) ) ( not ( = ?auto_162042 ?auto_162046 ) ) ( not ( = ?auto_162042 ?auto_162047 ) ) ( not ( = ?auto_162042 ?auto_162048 ) ) ( not ( = ?auto_162042 ?auto_162049 ) ) ( not ( = ?auto_162043 ?auto_162044 ) ) ( not ( = ?auto_162043 ?auto_162045 ) ) ( not ( = ?auto_162043 ?auto_162046 ) ) ( not ( = ?auto_162043 ?auto_162047 ) ) ( not ( = ?auto_162043 ?auto_162048 ) ) ( not ( = ?auto_162043 ?auto_162049 ) ) ( not ( = ?auto_162044 ?auto_162045 ) ) ( not ( = ?auto_162044 ?auto_162046 ) ) ( not ( = ?auto_162044 ?auto_162047 ) ) ( not ( = ?auto_162044 ?auto_162048 ) ) ( not ( = ?auto_162044 ?auto_162049 ) ) ( not ( = ?auto_162045 ?auto_162046 ) ) ( not ( = ?auto_162045 ?auto_162047 ) ) ( not ( = ?auto_162045 ?auto_162048 ) ) ( not ( = ?auto_162045 ?auto_162049 ) ) ( not ( = ?auto_162046 ?auto_162047 ) ) ( not ( = ?auto_162046 ?auto_162048 ) ) ( not ( = ?auto_162046 ?auto_162049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162047 ?auto_162048 ?auto_162049 )
      ( MAKE-8CRATE-VERIFY ?auto_162041 ?auto_162042 ?auto_162043 ?auto_162044 ?auto_162045 ?auto_162046 ?auto_162047 ?auto_162048 ?auto_162049 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162133 - SURFACE
      ?auto_162134 - SURFACE
      ?auto_162135 - SURFACE
      ?auto_162136 - SURFACE
      ?auto_162137 - SURFACE
      ?auto_162138 - SURFACE
      ?auto_162139 - SURFACE
      ?auto_162140 - SURFACE
      ?auto_162141 - SURFACE
    )
    :vars
    (
      ?auto_162146 - HOIST
      ?auto_162145 - PLACE
      ?auto_162142 - TRUCK
      ?auto_162144 - PLACE
      ?auto_162143 - HOIST
      ?auto_162147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_162146 ?auto_162145 ) ( SURFACE-AT ?auto_162140 ?auto_162145 ) ( CLEAR ?auto_162140 ) ( IS-CRATE ?auto_162141 ) ( not ( = ?auto_162140 ?auto_162141 ) ) ( AVAILABLE ?auto_162146 ) ( ON ?auto_162140 ?auto_162139 ) ( not ( = ?auto_162139 ?auto_162140 ) ) ( not ( = ?auto_162139 ?auto_162141 ) ) ( TRUCK-AT ?auto_162142 ?auto_162144 ) ( not ( = ?auto_162144 ?auto_162145 ) ) ( HOIST-AT ?auto_162143 ?auto_162144 ) ( not ( = ?auto_162146 ?auto_162143 ) ) ( AVAILABLE ?auto_162143 ) ( SURFACE-AT ?auto_162141 ?auto_162144 ) ( ON ?auto_162141 ?auto_162147 ) ( CLEAR ?auto_162141 ) ( not ( = ?auto_162140 ?auto_162147 ) ) ( not ( = ?auto_162141 ?auto_162147 ) ) ( not ( = ?auto_162139 ?auto_162147 ) ) ( ON ?auto_162134 ?auto_162133 ) ( ON ?auto_162135 ?auto_162134 ) ( ON ?auto_162136 ?auto_162135 ) ( ON ?auto_162137 ?auto_162136 ) ( ON ?auto_162138 ?auto_162137 ) ( ON ?auto_162139 ?auto_162138 ) ( not ( = ?auto_162133 ?auto_162134 ) ) ( not ( = ?auto_162133 ?auto_162135 ) ) ( not ( = ?auto_162133 ?auto_162136 ) ) ( not ( = ?auto_162133 ?auto_162137 ) ) ( not ( = ?auto_162133 ?auto_162138 ) ) ( not ( = ?auto_162133 ?auto_162139 ) ) ( not ( = ?auto_162133 ?auto_162140 ) ) ( not ( = ?auto_162133 ?auto_162141 ) ) ( not ( = ?auto_162133 ?auto_162147 ) ) ( not ( = ?auto_162134 ?auto_162135 ) ) ( not ( = ?auto_162134 ?auto_162136 ) ) ( not ( = ?auto_162134 ?auto_162137 ) ) ( not ( = ?auto_162134 ?auto_162138 ) ) ( not ( = ?auto_162134 ?auto_162139 ) ) ( not ( = ?auto_162134 ?auto_162140 ) ) ( not ( = ?auto_162134 ?auto_162141 ) ) ( not ( = ?auto_162134 ?auto_162147 ) ) ( not ( = ?auto_162135 ?auto_162136 ) ) ( not ( = ?auto_162135 ?auto_162137 ) ) ( not ( = ?auto_162135 ?auto_162138 ) ) ( not ( = ?auto_162135 ?auto_162139 ) ) ( not ( = ?auto_162135 ?auto_162140 ) ) ( not ( = ?auto_162135 ?auto_162141 ) ) ( not ( = ?auto_162135 ?auto_162147 ) ) ( not ( = ?auto_162136 ?auto_162137 ) ) ( not ( = ?auto_162136 ?auto_162138 ) ) ( not ( = ?auto_162136 ?auto_162139 ) ) ( not ( = ?auto_162136 ?auto_162140 ) ) ( not ( = ?auto_162136 ?auto_162141 ) ) ( not ( = ?auto_162136 ?auto_162147 ) ) ( not ( = ?auto_162137 ?auto_162138 ) ) ( not ( = ?auto_162137 ?auto_162139 ) ) ( not ( = ?auto_162137 ?auto_162140 ) ) ( not ( = ?auto_162137 ?auto_162141 ) ) ( not ( = ?auto_162137 ?auto_162147 ) ) ( not ( = ?auto_162138 ?auto_162139 ) ) ( not ( = ?auto_162138 ?auto_162140 ) ) ( not ( = ?auto_162138 ?auto_162141 ) ) ( not ( = ?auto_162138 ?auto_162147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162139 ?auto_162140 ?auto_162141 )
      ( MAKE-8CRATE-VERIFY ?auto_162133 ?auto_162134 ?auto_162135 ?auto_162136 ?auto_162137 ?auto_162138 ?auto_162139 ?auto_162140 ?auto_162141 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162226 - SURFACE
      ?auto_162227 - SURFACE
      ?auto_162228 - SURFACE
      ?auto_162229 - SURFACE
      ?auto_162230 - SURFACE
      ?auto_162231 - SURFACE
      ?auto_162232 - SURFACE
      ?auto_162233 - SURFACE
      ?auto_162234 - SURFACE
    )
    :vars
    (
      ?auto_162238 - HOIST
      ?auto_162239 - PLACE
      ?auto_162240 - PLACE
      ?auto_162236 - HOIST
      ?auto_162235 - SURFACE
      ?auto_162237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162238 ?auto_162239 ) ( SURFACE-AT ?auto_162233 ?auto_162239 ) ( CLEAR ?auto_162233 ) ( IS-CRATE ?auto_162234 ) ( not ( = ?auto_162233 ?auto_162234 ) ) ( AVAILABLE ?auto_162238 ) ( ON ?auto_162233 ?auto_162232 ) ( not ( = ?auto_162232 ?auto_162233 ) ) ( not ( = ?auto_162232 ?auto_162234 ) ) ( not ( = ?auto_162240 ?auto_162239 ) ) ( HOIST-AT ?auto_162236 ?auto_162240 ) ( not ( = ?auto_162238 ?auto_162236 ) ) ( AVAILABLE ?auto_162236 ) ( SURFACE-AT ?auto_162234 ?auto_162240 ) ( ON ?auto_162234 ?auto_162235 ) ( CLEAR ?auto_162234 ) ( not ( = ?auto_162233 ?auto_162235 ) ) ( not ( = ?auto_162234 ?auto_162235 ) ) ( not ( = ?auto_162232 ?auto_162235 ) ) ( TRUCK-AT ?auto_162237 ?auto_162239 ) ( ON ?auto_162227 ?auto_162226 ) ( ON ?auto_162228 ?auto_162227 ) ( ON ?auto_162229 ?auto_162228 ) ( ON ?auto_162230 ?auto_162229 ) ( ON ?auto_162231 ?auto_162230 ) ( ON ?auto_162232 ?auto_162231 ) ( not ( = ?auto_162226 ?auto_162227 ) ) ( not ( = ?auto_162226 ?auto_162228 ) ) ( not ( = ?auto_162226 ?auto_162229 ) ) ( not ( = ?auto_162226 ?auto_162230 ) ) ( not ( = ?auto_162226 ?auto_162231 ) ) ( not ( = ?auto_162226 ?auto_162232 ) ) ( not ( = ?auto_162226 ?auto_162233 ) ) ( not ( = ?auto_162226 ?auto_162234 ) ) ( not ( = ?auto_162226 ?auto_162235 ) ) ( not ( = ?auto_162227 ?auto_162228 ) ) ( not ( = ?auto_162227 ?auto_162229 ) ) ( not ( = ?auto_162227 ?auto_162230 ) ) ( not ( = ?auto_162227 ?auto_162231 ) ) ( not ( = ?auto_162227 ?auto_162232 ) ) ( not ( = ?auto_162227 ?auto_162233 ) ) ( not ( = ?auto_162227 ?auto_162234 ) ) ( not ( = ?auto_162227 ?auto_162235 ) ) ( not ( = ?auto_162228 ?auto_162229 ) ) ( not ( = ?auto_162228 ?auto_162230 ) ) ( not ( = ?auto_162228 ?auto_162231 ) ) ( not ( = ?auto_162228 ?auto_162232 ) ) ( not ( = ?auto_162228 ?auto_162233 ) ) ( not ( = ?auto_162228 ?auto_162234 ) ) ( not ( = ?auto_162228 ?auto_162235 ) ) ( not ( = ?auto_162229 ?auto_162230 ) ) ( not ( = ?auto_162229 ?auto_162231 ) ) ( not ( = ?auto_162229 ?auto_162232 ) ) ( not ( = ?auto_162229 ?auto_162233 ) ) ( not ( = ?auto_162229 ?auto_162234 ) ) ( not ( = ?auto_162229 ?auto_162235 ) ) ( not ( = ?auto_162230 ?auto_162231 ) ) ( not ( = ?auto_162230 ?auto_162232 ) ) ( not ( = ?auto_162230 ?auto_162233 ) ) ( not ( = ?auto_162230 ?auto_162234 ) ) ( not ( = ?auto_162230 ?auto_162235 ) ) ( not ( = ?auto_162231 ?auto_162232 ) ) ( not ( = ?auto_162231 ?auto_162233 ) ) ( not ( = ?auto_162231 ?auto_162234 ) ) ( not ( = ?auto_162231 ?auto_162235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162232 ?auto_162233 ?auto_162234 )
      ( MAKE-8CRATE-VERIFY ?auto_162226 ?auto_162227 ?auto_162228 ?auto_162229 ?auto_162230 ?auto_162231 ?auto_162232 ?auto_162233 ?auto_162234 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162319 - SURFACE
      ?auto_162320 - SURFACE
      ?auto_162321 - SURFACE
      ?auto_162322 - SURFACE
      ?auto_162323 - SURFACE
      ?auto_162324 - SURFACE
      ?auto_162325 - SURFACE
      ?auto_162326 - SURFACE
      ?auto_162327 - SURFACE
    )
    :vars
    (
      ?auto_162329 - HOIST
      ?auto_162331 - PLACE
      ?auto_162333 - PLACE
      ?auto_162330 - HOIST
      ?auto_162328 - SURFACE
      ?auto_162332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162329 ?auto_162331 ) ( IS-CRATE ?auto_162327 ) ( not ( = ?auto_162326 ?auto_162327 ) ) ( not ( = ?auto_162325 ?auto_162326 ) ) ( not ( = ?auto_162325 ?auto_162327 ) ) ( not ( = ?auto_162333 ?auto_162331 ) ) ( HOIST-AT ?auto_162330 ?auto_162333 ) ( not ( = ?auto_162329 ?auto_162330 ) ) ( AVAILABLE ?auto_162330 ) ( SURFACE-AT ?auto_162327 ?auto_162333 ) ( ON ?auto_162327 ?auto_162328 ) ( CLEAR ?auto_162327 ) ( not ( = ?auto_162326 ?auto_162328 ) ) ( not ( = ?auto_162327 ?auto_162328 ) ) ( not ( = ?auto_162325 ?auto_162328 ) ) ( TRUCK-AT ?auto_162332 ?auto_162331 ) ( SURFACE-AT ?auto_162325 ?auto_162331 ) ( CLEAR ?auto_162325 ) ( LIFTING ?auto_162329 ?auto_162326 ) ( IS-CRATE ?auto_162326 ) ( ON ?auto_162320 ?auto_162319 ) ( ON ?auto_162321 ?auto_162320 ) ( ON ?auto_162322 ?auto_162321 ) ( ON ?auto_162323 ?auto_162322 ) ( ON ?auto_162324 ?auto_162323 ) ( ON ?auto_162325 ?auto_162324 ) ( not ( = ?auto_162319 ?auto_162320 ) ) ( not ( = ?auto_162319 ?auto_162321 ) ) ( not ( = ?auto_162319 ?auto_162322 ) ) ( not ( = ?auto_162319 ?auto_162323 ) ) ( not ( = ?auto_162319 ?auto_162324 ) ) ( not ( = ?auto_162319 ?auto_162325 ) ) ( not ( = ?auto_162319 ?auto_162326 ) ) ( not ( = ?auto_162319 ?auto_162327 ) ) ( not ( = ?auto_162319 ?auto_162328 ) ) ( not ( = ?auto_162320 ?auto_162321 ) ) ( not ( = ?auto_162320 ?auto_162322 ) ) ( not ( = ?auto_162320 ?auto_162323 ) ) ( not ( = ?auto_162320 ?auto_162324 ) ) ( not ( = ?auto_162320 ?auto_162325 ) ) ( not ( = ?auto_162320 ?auto_162326 ) ) ( not ( = ?auto_162320 ?auto_162327 ) ) ( not ( = ?auto_162320 ?auto_162328 ) ) ( not ( = ?auto_162321 ?auto_162322 ) ) ( not ( = ?auto_162321 ?auto_162323 ) ) ( not ( = ?auto_162321 ?auto_162324 ) ) ( not ( = ?auto_162321 ?auto_162325 ) ) ( not ( = ?auto_162321 ?auto_162326 ) ) ( not ( = ?auto_162321 ?auto_162327 ) ) ( not ( = ?auto_162321 ?auto_162328 ) ) ( not ( = ?auto_162322 ?auto_162323 ) ) ( not ( = ?auto_162322 ?auto_162324 ) ) ( not ( = ?auto_162322 ?auto_162325 ) ) ( not ( = ?auto_162322 ?auto_162326 ) ) ( not ( = ?auto_162322 ?auto_162327 ) ) ( not ( = ?auto_162322 ?auto_162328 ) ) ( not ( = ?auto_162323 ?auto_162324 ) ) ( not ( = ?auto_162323 ?auto_162325 ) ) ( not ( = ?auto_162323 ?auto_162326 ) ) ( not ( = ?auto_162323 ?auto_162327 ) ) ( not ( = ?auto_162323 ?auto_162328 ) ) ( not ( = ?auto_162324 ?auto_162325 ) ) ( not ( = ?auto_162324 ?auto_162326 ) ) ( not ( = ?auto_162324 ?auto_162327 ) ) ( not ( = ?auto_162324 ?auto_162328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162325 ?auto_162326 ?auto_162327 )
      ( MAKE-8CRATE-VERIFY ?auto_162319 ?auto_162320 ?auto_162321 ?auto_162322 ?auto_162323 ?auto_162324 ?auto_162325 ?auto_162326 ?auto_162327 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162412 - SURFACE
      ?auto_162413 - SURFACE
      ?auto_162414 - SURFACE
      ?auto_162415 - SURFACE
      ?auto_162416 - SURFACE
      ?auto_162417 - SURFACE
      ?auto_162418 - SURFACE
      ?auto_162419 - SURFACE
      ?auto_162420 - SURFACE
    )
    :vars
    (
      ?auto_162423 - HOIST
      ?auto_162425 - PLACE
      ?auto_162426 - PLACE
      ?auto_162424 - HOIST
      ?auto_162422 - SURFACE
      ?auto_162421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162423 ?auto_162425 ) ( IS-CRATE ?auto_162420 ) ( not ( = ?auto_162419 ?auto_162420 ) ) ( not ( = ?auto_162418 ?auto_162419 ) ) ( not ( = ?auto_162418 ?auto_162420 ) ) ( not ( = ?auto_162426 ?auto_162425 ) ) ( HOIST-AT ?auto_162424 ?auto_162426 ) ( not ( = ?auto_162423 ?auto_162424 ) ) ( AVAILABLE ?auto_162424 ) ( SURFACE-AT ?auto_162420 ?auto_162426 ) ( ON ?auto_162420 ?auto_162422 ) ( CLEAR ?auto_162420 ) ( not ( = ?auto_162419 ?auto_162422 ) ) ( not ( = ?auto_162420 ?auto_162422 ) ) ( not ( = ?auto_162418 ?auto_162422 ) ) ( TRUCK-AT ?auto_162421 ?auto_162425 ) ( SURFACE-AT ?auto_162418 ?auto_162425 ) ( CLEAR ?auto_162418 ) ( IS-CRATE ?auto_162419 ) ( AVAILABLE ?auto_162423 ) ( IN ?auto_162419 ?auto_162421 ) ( ON ?auto_162413 ?auto_162412 ) ( ON ?auto_162414 ?auto_162413 ) ( ON ?auto_162415 ?auto_162414 ) ( ON ?auto_162416 ?auto_162415 ) ( ON ?auto_162417 ?auto_162416 ) ( ON ?auto_162418 ?auto_162417 ) ( not ( = ?auto_162412 ?auto_162413 ) ) ( not ( = ?auto_162412 ?auto_162414 ) ) ( not ( = ?auto_162412 ?auto_162415 ) ) ( not ( = ?auto_162412 ?auto_162416 ) ) ( not ( = ?auto_162412 ?auto_162417 ) ) ( not ( = ?auto_162412 ?auto_162418 ) ) ( not ( = ?auto_162412 ?auto_162419 ) ) ( not ( = ?auto_162412 ?auto_162420 ) ) ( not ( = ?auto_162412 ?auto_162422 ) ) ( not ( = ?auto_162413 ?auto_162414 ) ) ( not ( = ?auto_162413 ?auto_162415 ) ) ( not ( = ?auto_162413 ?auto_162416 ) ) ( not ( = ?auto_162413 ?auto_162417 ) ) ( not ( = ?auto_162413 ?auto_162418 ) ) ( not ( = ?auto_162413 ?auto_162419 ) ) ( not ( = ?auto_162413 ?auto_162420 ) ) ( not ( = ?auto_162413 ?auto_162422 ) ) ( not ( = ?auto_162414 ?auto_162415 ) ) ( not ( = ?auto_162414 ?auto_162416 ) ) ( not ( = ?auto_162414 ?auto_162417 ) ) ( not ( = ?auto_162414 ?auto_162418 ) ) ( not ( = ?auto_162414 ?auto_162419 ) ) ( not ( = ?auto_162414 ?auto_162420 ) ) ( not ( = ?auto_162414 ?auto_162422 ) ) ( not ( = ?auto_162415 ?auto_162416 ) ) ( not ( = ?auto_162415 ?auto_162417 ) ) ( not ( = ?auto_162415 ?auto_162418 ) ) ( not ( = ?auto_162415 ?auto_162419 ) ) ( not ( = ?auto_162415 ?auto_162420 ) ) ( not ( = ?auto_162415 ?auto_162422 ) ) ( not ( = ?auto_162416 ?auto_162417 ) ) ( not ( = ?auto_162416 ?auto_162418 ) ) ( not ( = ?auto_162416 ?auto_162419 ) ) ( not ( = ?auto_162416 ?auto_162420 ) ) ( not ( = ?auto_162416 ?auto_162422 ) ) ( not ( = ?auto_162417 ?auto_162418 ) ) ( not ( = ?auto_162417 ?auto_162419 ) ) ( not ( = ?auto_162417 ?auto_162420 ) ) ( not ( = ?auto_162417 ?auto_162422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162418 ?auto_162419 ?auto_162420 )
      ( MAKE-8CRATE-VERIFY ?auto_162412 ?auto_162413 ?auto_162414 ?auto_162415 ?auto_162416 ?auto_162417 ?auto_162418 ?auto_162419 ?auto_162420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_163707 - SURFACE
      ?auto_163708 - SURFACE
    )
    :vars
    (
      ?auto_163709 - HOIST
      ?auto_163710 - PLACE
      ?auto_163715 - SURFACE
      ?auto_163712 - TRUCK
      ?auto_163713 - PLACE
      ?auto_163711 - HOIST
      ?auto_163714 - SURFACE
      ?auto_163716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_163709 ?auto_163710 ) ( SURFACE-AT ?auto_163707 ?auto_163710 ) ( CLEAR ?auto_163707 ) ( IS-CRATE ?auto_163708 ) ( not ( = ?auto_163707 ?auto_163708 ) ) ( AVAILABLE ?auto_163709 ) ( ON ?auto_163707 ?auto_163715 ) ( not ( = ?auto_163715 ?auto_163707 ) ) ( not ( = ?auto_163715 ?auto_163708 ) ) ( TRUCK-AT ?auto_163712 ?auto_163713 ) ( not ( = ?auto_163713 ?auto_163710 ) ) ( HOIST-AT ?auto_163711 ?auto_163713 ) ( not ( = ?auto_163709 ?auto_163711 ) ) ( SURFACE-AT ?auto_163708 ?auto_163713 ) ( ON ?auto_163708 ?auto_163714 ) ( CLEAR ?auto_163708 ) ( not ( = ?auto_163707 ?auto_163714 ) ) ( not ( = ?auto_163708 ?auto_163714 ) ) ( not ( = ?auto_163715 ?auto_163714 ) ) ( LIFTING ?auto_163711 ?auto_163716 ) ( IS-CRATE ?auto_163716 ) ( not ( = ?auto_163707 ?auto_163716 ) ) ( not ( = ?auto_163708 ?auto_163716 ) ) ( not ( = ?auto_163715 ?auto_163716 ) ) ( not ( = ?auto_163714 ?auto_163716 ) ) )
    :subtasks
    ( ( !LOAD ?auto_163711 ?auto_163716 ?auto_163712 ?auto_163713 )
      ( MAKE-1CRATE ?auto_163707 ?auto_163708 )
      ( MAKE-1CRATE-VERIFY ?auto_163707 ?auto_163708 ) )
  )

)

