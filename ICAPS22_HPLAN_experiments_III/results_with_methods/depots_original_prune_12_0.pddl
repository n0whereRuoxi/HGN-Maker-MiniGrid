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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592878 - SURFACE
      ?auto_592879 - SURFACE
    )
    :vars
    (
      ?auto_592880 - HOIST
      ?auto_592881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592880 ?auto_592881 ) ( SURFACE-AT ?auto_592878 ?auto_592881 ) ( CLEAR ?auto_592878 ) ( LIFTING ?auto_592880 ?auto_592879 ) ( IS-CRATE ?auto_592879 ) ( not ( = ?auto_592878 ?auto_592879 ) ) )
    :subtasks
    ( ( !DROP ?auto_592880 ?auto_592879 ?auto_592878 ?auto_592881 )
      ( MAKE-1CRATE-VERIFY ?auto_592878 ?auto_592879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592882 - SURFACE
      ?auto_592883 - SURFACE
    )
    :vars
    (
      ?auto_592884 - HOIST
      ?auto_592885 - PLACE
      ?auto_592886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592884 ?auto_592885 ) ( SURFACE-AT ?auto_592882 ?auto_592885 ) ( CLEAR ?auto_592882 ) ( IS-CRATE ?auto_592883 ) ( not ( = ?auto_592882 ?auto_592883 ) ) ( TRUCK-AT ?auto_592886 ?auto_592885 ) ( AVAILABLE ?auto_592884 ) ( IN ?auto_592883 ?auto_592886 ) )
    :subtasks
    ( ( !UNLOAD ?auto_592884 ?auto_592883 ?auto_592886 ?auto_592885 )
      ( MAKE-1CRATE ?auto_592882 ?auto_592883 )
      ( MAKE-1CRATE-VERIFY ?auto_592882 ?auto_592883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592887 - SURFACE
      ?auto_592888 - SURFACE
    )
    :vars
    (
      ?auto_592889 - HOIST
      ?auto_592890 - PLACE
      ?auto_592891 - TRUCK
      ?auto_592892 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592889 ?auto_592890 ) ( SURFACE-AT ?auto_592887 ?auto_592890 ) ( CLEAR ?auto_592887 ) ( IS-CRATE ?auto_592888 ) ( not ( = ?auto_592887 ?auto_592888 ) ) ( AVAILABLE ?auto_592889 ) ( IN ?auto_592888 ?auto_592891 ) ( TRUCK-AT ?auto_592891 ?auto_592892 ) ( not ( = ?auto_592892 ?auto_592890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_592891 ?auto_592892 ?auto_592890 )
      ( MAKE-1CRATE ?auto_592887 ?auto_592888 )
      ( MAKE-1CRATE-VERIFY ?auto_592887 ?auto_592888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592893 - SURFACE
      ?auto_592894 - SURFACE
    )
    :vars
    (
      ?auto_592898 - HOIST
      ?auto_592895 - PLACE
      ?auto_592896 - TRUCK
      ?auto_592897 - PLACE
      ?auto_592899 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592898 ?auto_592895 ) ( SURFACE-AT ?auto_592893 ?auto_592895 ) ( CLEAR ?auto_592893 ) ( IS-CRATE ?auto_592894 ) ( not ( = ?auto_592893 ?auto_592894 ) ) ( AVAILABLE ?auto_592898 ) ( TRUCK-AT ?auto_592896 ?auto_592897 ) ( not ( = ?auto_592897 ?auto_592895 ) ) ( HOIST-AT ?auto_592899 ?auto_592897 ) ( LIFTING ?auto_592899 ?auto_592894 ) ( not ( = ?auto_592898 ?auto_592899 ) ) )
    :subtasks
    ( ( !LOAD ?auto_592899 ?auto_592894 ?auto_592896 ?auto_592897 )
      ( MAKE-1CRATE ?auto_592893 ?auto_592894 )
      ( MAKE-1CRATE-VERIFY ?auto_592893 ?auto_592894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592900 - SURFACE
      ?auto_592901 - SURFACE
    )
    :vars
    (
      ?auto_592904 - HOIST
      ?auto_592906 - PLACE
      ?auto_592905 - TRUCK
      ?auto_592902 - PLACE
      ?auto_592903 - HOIST
      ?auto_592907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592904 ?auto_592906 ) ( SURFACE-AT ?auto_592900 ?auto_592906 ) ( CLEAR ?auto_592900 ) ( IS-CRATE ?auto_592901 ) ( not ( = ?auto_592900 ?auto_592901 ) ) ( AVAILABLE ?auto_592904 ) ( TRUCK-AT ?auto_592905 ?auto_592902 ) ( not ( = ?auto_592902 ?auto_592906 ) ) ( HOIST-AT ?auto_592903 ?auto_592902 ) ( not ( = ?auto_592904 ?auto_592903 ) ) ( AVAILABLE ?auto_592903 ) ( SURFACE-AT ?auto_592901 ?auto_592902 ) ( ON ?auto_592901 ?auto_592907 ) ( CLEAR ?auto_592901 ) ( not ( = ?auto_592900 ?auto_592907 ) ) ( not ( = ?auto_592901 ?auto_592907 ) ) )
    :subtasks
    ( ( !LIFT ?auto_592903 ?auto_592901 ?auto_592907 ?auto_592902 )
      ( MAKE-1CRATE ?auto_592900 ?auto_592901 )
      ( MAKE-1CRATE-VERIFY ?auto_592900 ?auto_592901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592908 - SURFACE
      ?auto_592909 - SURFACE
    )
    :vars
    (
      ?auto_592911 - HOIST
      ?auto_592915 - PLACE
      ?auto_592913 - PLACE
      ?auto_592912 - HOIST
      ?auto_592910 - SURFACE
      ?auto_592914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592911 ?auto_592915 ) ( SURFACE-AT ?auto_592908 ?auto_592915 ) ( CLEAR ?auto_592908 ) ( IS-CRATE ?auto_592909 ) ( not ( = ?auto_592908 ?auto_592909 ) ) ( AVAILABLE ?auto_592911 ) ( not ( = ?auto_592913 ?auto_592915 ) ) ( HOIST-AT ?auto_592912 ?auto_592913 ) ( not ( = ?auto_592911 ?auto_592912 ) ) ( AVAILABLE ?auto_592912 ) ( SURFACE-AT ?auto_592909 ?auto_592913 ) ( ON ?auto_592909 ?auto_592910 ) ( CLEAR ?auto_592909 ) ( not ( = ?auto_592908 ?auto_592910 ) ) ( not ( = ?auto_592909 ?auto_592910 ) ) ( TRUCK-AT ?auto_592914 ?auto_592915 ) )
    :subtasks
    ( ( !DRIVE ?auto_592914 ?auto_592915 ?auto_592913 )
      ( MAKE-1CRATE ?auto_592908 ?auto_592909 )
      ( MAKE-1CRATE-VERIFY ?auto_592908 ?auto_592909 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592925 - SURFACE
      ?auto_592926 - SURFACE
      ?auto_592927 - SURFACE
    )
    :vars
    (
      ?auto_592929 - HOIST
      ?auto_592928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592929 ?auto_592928 ) ( SURFACE-AT ?auto_592926 ?auto_592928 ) ( CLEAR ?auto_592926 ) ( LIFTING ?auto_592929 ?auto_592927 ) ( IS-CRATE ?auto_592927 ) ( not ( = ?auto_592926 ?auto_592927 ) ) ( ON ?auto_592926 ?auto_592925 ) ( not ( = ?auto_592925 ?auto_592926 ) ) ( not ( = ?auto_592925 ?auto_592927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592926 ?auto_592927 )
      ( MAKE-2CRATE-VERIFY ?auto_592925 ?auto_592926 ?auto_592927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592935 - SURFACE
      ?auto_592936 - SURFACE
      ?auto_592937 - SURFACE
    )
    :vars
    (
      ?auto_592940 - HOIST
      ?auto_592939 - PLACE
      ?auto_592938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592940 ?auto_592939 ) ( SURFACE-AT ?auto_592936 ?auto_592939 ) ( CLEAR ?auto_592936 ) ( IS-CRATE ?auto_592937 ) ( not ( = ?auto_592936 ?auto_592937 ) ) ( TRUCK-AT ?auto_592938 ?auto_592939 ) ( AVAILABLE ?auto_592940 ) ( IN ?auto_592937 ?auto_592938 ) ( ON ?auto_592936 ?auto_592935 ) ( not ( = ?auto_592935 ?auto_592936 ) ) ( not ( = ?auto_592935 ?auto_592937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592936 ?auto_592937 )
      ( MAKE-2CRATE-VERIFY ?auto_592935 ?auto_592936 ?auto_592937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592941 - SURFACE
      ?auto_592942 - SURFACE
    )
    :vars
    (
      ?auto_592943 - HOIST
      ?auto_592946 - PLACE
      ?auto_592945 - TRUCK
      ?auto_592944 - SURFACE
      ?auto_592947 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592943 ?auto_592946 ) ( SURFACE-AT ?auto_592941 ?auto_592946 ) ( CLEAR ?auto_592941 ) ( IS-CRATE ?auto_592942 ) ( not ( = ?auto_592941 ?auto_592942 ) ) ( AVAILABLE ?auto_592943 ) ( IN ?auto_592942 ?auto_592945 ) ( ON ?auto_592941 ?auto_592944 ) ( not ( = ?auto_592944 ?auto_592941 ) ) ( not ( = ?auto_592944 ?auto_592942 ) ) ( TRUCK-AT ?auto_592945 ?auto_592947 ) ( not ( = ?auto_592947 ?auto_592946 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_592945 ?auto_592947 ?auto_592946 )
      ( MAKE-2CRATE ?auto_592944 ?auto_592941 ?auto_592942 )
      ( MAKE-1CRATE-VERIFY ?auto_592941 ?auto_592942 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592948 - SURFACE
      ?auto_592949 - SURFACE
      ?auto_592950 - SURFACE
    )
    :vars
    (
      ?auto_592954 - HOIST
      ?auto_592951 - PLACE
      ?auto_592952 - TRUCK
      ?auto_592953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592954 ?auto_592951 ) ( SURFACE-AT ?auto_592949 ?auto_592951 ) ( CLEAR ?auto_592949 ) ( IS-CRATE ?auto_592950 ) ( not ( = ?auto_592949 ?auto_592950 ) ) ( AVAILABLE ?auto_592954 ) ( IN ?auto_592950 ?auto_592952 ) ( ON ?auto_592949 ?auto_592948 ) ( not ( = ?auto_592948 ?auto_592949 ) ) ( not ( = ?auto_592948 ?auto_592950 ) ) ( TRUCK-AT ?auto_592952 ?auto_592953 ) ( not ( = ?auto_592953 ?auto_592951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592949 ?auto_592950 )
      ( MAKE-2CRATE-VERIFY ?auto_592948 ?auto_592949 ?auto_592950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592955 - SURFACE
      ?auto_592956 - SURFACE
    )
    :vars
    (
      ?auto_592960 - HOIST
      ?auto_592961 - PLACE
      ?auto_592958 - SURFACE
      ?auto_592959 - TRUCK
      ?auto_592957 - PLACE
      ?auto_592962 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592960 ?auto_592961 ) ( SURFACE-AT ?auto_592955 ?auto_592961 ) ( CLEAR ?auto_592955 ) ( IS-CRATE ?auto_592956 ) ( not ( = ?auto_592955 ?auto_592956 ) ) ( AVAILABLE ?auto_592960 ) ( ON ?auto_592955 ?auto_592958 ) ( not ( = ?auto_592958 ?auto_592955 ) ) ( not ( = ?auto_592958 ?auto_592956 ) ) ( TRUCK-AT ?auto_592959 ?auto_592957 ) ( not ( = ?auto_592957 ?auto_592961 ) ) ( HOIST-AT ?auto_592962 ?auto_592957 ) ( LIFTING ?auto_592962 ?auto_592956 ) ( not ( = ?auto_592960 ?auto_592962 ) ) )
    :subtasks
    ( ( !LOAD ?auto_592962 ?auto_592956 ?auto_592959 ?auto_592957 )
      ( MAKE-2CRATE ?auto_592958 ?auto_592955 ?auto_592956 )
      ( MAKE-1CRATE-VERIFY ?auto_592955 ?auto_592956 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592963 - SURFACE
      ?auto_592964 - SURFACE
      ?auto_592965 - SURFACE
    )
    :vars
    (
      ?auto_592970 - HOIST
      ?auto_592966 - PLACE
      ?auto_592967 - TRUCK
      ?auto_592968 - PLACE
      ?auto_592969 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592970 ?auto_592966 ) ( SURFACE-AT ?auto_592964 ?auto_592966 ) ( CLEAR ?auto_592964 ) ( IS-CRATE ?auto_592965 ) ( not ( = ?auto_592964 ?auto_592965 ) ) ( AVAILABLE ?auto_592970 ) ( ON ?auto_592964 ?auto_592963 ) ( not ( = ?auto_592963 ?auto_592964 ) ) ( not ( = ?auto_592963 ?auto_592965 ) ) ( TRUCK-AT ?auto_592967 ?auto_592968 ) ( not ( = ?auto_592968 ?auto_592966 ) ) ( HOIST-AT ?auto_592969 ?auto_592968 ) ( LIFTING ?auto_592969 ?auto_592965 ) ( not ( = ?auto_592970 ?auto_592969 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592964 ?auto_592965 )
      ( MAKE-2CRATE-VERIFY ?auto_592963 ?auto_592964 ?auto_592965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592971 - SURFACE
      ?auto_592972 - SURFACE
    )
    :vars
    (
      ?auto_592973 - HOIST
      ?auto_592975 - PLACE
      ?auto_592978 - SURFACE
      ?auto_592977 - TRUCK
      ?auto_592976 - PLACE
      ?auto_592974 - HOIST
      ?auto_592979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592973 ?auto_592975 ) ( SURFACE-AT ?auto_592971 ?auto_592975 ) ( CLEAR ?auto_592971 ) ( IS-CRATE ?auto_592972 ) ( not ( = ?auto_592971 ?auto_592972 ) ) ( AVAILABLE ?auto_592973 ) ( ON ?auto_592971 ?auto_592978 ) ( not ( = ?auto_592978 ?auto_592971 ) ) ( not ( = ?auto_592978 ?auto_592972 ) ) ( TRUCK-AT ?auto_592977 ?auto_592976 ) ( not ( = ?auto_592976 ?auto_592975 ) ) ( HOIST-AT ?auto_592974 ?auto_592976 ) ( not ( = ?auto_592973 ?auto_592974 ) ) ( AVAILABLE ?auto_592974 ) ( SURFACE-AT ?auto_592972 ?auto_592976 ) ( ON ?auto_592972 ?auto_592979 ) ( CLEAR ?auto_592972 ) ( not ( = ?auto_592971 ?auto_592979 ) ) ( not ( = ?auto_592972 ?auto_592979 ) ) ( not ( = ?auto_592978 ?auto_592979 ) ) )
    :subtasks
    ( ( !LIFT ?auto_592974 ?auto_592972 ?auto_592979 ?auto_592976 )
      ( MAKE-2CRATE ?auto_592978 ?auto_592971 ?auto_592972 )
      ( MAKE-1CRATE-VERIFY ?auto_592971 ?auto_592972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592980 - SURFACE
      ?auto_592981 - SURFACE
      ?auto_592982 - SURFACE
    )
    :vars
    (
      ?auto_592987 - HOIST
      ?auto_592984 - PLACE
      ?auto_592985 - TRUCK
      ?auto_592986 - PLACE
      ?auto_592983 - HOIST
      ?auto_592988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592987 ?auto_592984 ) ( SURFACE-AT ?auto_592981 ?auto_592984 ) ( CLEAR ?auto_592981 ) ( IS-CRATE ?auto_592982 ) ( not ( = ?auto_592981 ?auto_592982 ) ) ( AVAILABLE ?auto_592987 ) ( ON ?auto_592981 ?auto_592980 ) ( not ( = ?auto_592980 ?auto_592981 ) ) ( not ( = ?auto_592980 ?auto_592982 ) ) ( TRUCK-AT ?auto_592985 ?auto_592986 ) ( not ( = ?auto_592986 ?auto_592984 ) ) ( HOIST-AT ?auto_592983 ?auto_592986 ) ( not ( = ?auto_592987 ?auto_592983 ) ) ( AVAILABLE ?auto_592983 ) ( SURFACE-AT ?auto_592982 ?auto_592986 ) ( ON ?auto_592982 ?auto_592988 ) ( CLEAR ?auto_592982 ) ( not ( = ?auto_592981 ?auto_592988 ) ) ( not ( = ?auto_592982 ?auto_592988 ) ) ( not ( = ?auto_592980 ?auto_592988 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592981 ?auto_592982 )
      ( MAKE-2CRATE-VERIFY ?auto_592980 ?auto_592981 ?auto_592982 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_592989 - SURFACE
      ?auto_592990 - SURFACE
    )
    :vars
    (
      ?auto_592994 - HOIST
      ?auto_592996 - PLACE
      ?auto_592991 - SURFACE
      ?auto_592997 - PLACE
      ?auto_592993 - HOIST
      ?auto_592995 - SURFACE
      ?auto_592992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_592994 ?auto_592996 ) ( SURFACE-AT ?auto_592989 ?auto_592996 ) ( CLEAR ?auto_592989 ) ( IS-CRATE ?auto_592990 ) ( not ( = ?auto_592989 ?auto_592990 ) ) ( AVAILABLE ?auto_592994 ) ( ON ?auto_592989 ?auto_592991 ) ( not ( = ?auto_592991 ?auto_592989 ) ) ( not ( = ?auto_592991 ?auto_592990 ) ) ( not ( = ?auto_592997 ?auto_592996 ) ) ( HOIST-AT ?auto_592993 ?auto_592997 ) ( not ( = ?auto_592994 ?auto_592993 ) ) ( AVAILABLE ?auto_592993 ) ( SURFACE-AT ?auto_592990 ?auto_592997 ) ( ON ?auto_592990 ?auto_592995 ) ( CLEAR ?auto_592990 ) ( not ( = ?auto_592989 ?auto_592995 ) ) ( not ( = ?auto_592990 ?auto_592995 ) ) ( not ( = ?auto_592991 ?auto_592995 ) ) ( TRUCK-AT ?auto_592992 ?auto_592996 ) )
    :subtasks
    ( ( !DRIVE ?auto_592992 ?auto_592996 ?auto_592997 )
      ( MAKE-2CRATE ?auto_592991 ?auto_592989 ?auto_592990 )
      ( MAKE-1CRATE-VERIFY ?auto_592989 ?auto_592990 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_592998 - SURFACE
      ?auto_592999 - SURFACE
      ?auto_593000 - SURFACE
    )
    :vars
    (
      ?auto_593006 - HOIST
      ?auto_593001 - PLACE
      ?auto_593004 - PLACE
      ?auto_593002 - HOIST
      ?auto_593003 - SURFACE
      ?auto_593005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593006 ?auto_593001 ) ( SURFACE-AT ?auto_592999 ?auto_593001 ) ( CLEAR ?auto_592999 ) ( IS-CRATE ?auto_593000 ) ( not ( = ?auto_592999 ?auto_593000 ) ) ( AVAILABLE ?auto_593006 ) ( ON ?auto_592999 ?auto_592998 ) ( not ( = ?auto_592998 ?auto_592999 ) ) ( not ( = ?auto_592998 ?auto_593000 ) ) ( not ( = ?auto_593004 ?auto_593001 ) ) ( HOIST-AT ?auto_593002 ?auto_593004 ) ( not ( = ?auto_593006 ?auto_593002 ) ) ( AVAILABLE ?auto_593002 ) ( SURFACE-AT ?auto_593000 ?auto_593004 ) ( ON ?auto_593000 ?auto_593003 ) ( CLEAR ?auto_593000 ) ( not ( = ?auto_592999 ?auto_593003 ) ) ( not ( = ?auto_593000 ?auto_593003 ) ) ( not ( = ?auto_592998 ?auto_593003 ) ) ( TRUCK-AT ?auto_593005 ?auto_593001 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_592999 ?auto_593000 )
      ( MAKE-2CRATE-VERIFY ?auto_592998 ?auto_592999 ?auto_593000 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593007 - SURFACE
      ?auto_593008 - SURFACE
    )
    :vars
    (
      ?auto_593013 - HOIST
      ?auto_593009 - PLACE
      ?auto_593010 - SURFACE
      ?auto_593012 - PLACE
      ?auto_593015 - HOIST
      ?auto_593014 - SURFACE
      ?auto_593011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593013 ?auto_593009 ) ( IS-CRATE ?auto_593008 ) ( not ( = ?auto_593007 ?auto_593008 ) ) ( not ( = ?auto_593010 ?auto_593007 ) ) ( not ( = ?auto_593010 ?auto_593008 ) ) ( not ( = ?auto_593012 ?auto_593009 ) ) ( HOIST-AT ?auto_593015 ?auto_593012 ) ( not ( = ?auto_593013 ?auto_593015 ) ) ( AVAILABLE ?auto_593015 ) ( SURFACE-AT ?auto_593008 ?auto_593012 ) ( ON ?auto_593008 ?auto_593014 ) ( CLEAR ?auto_593008 ) ( not ( = ?auto_593007 ?auto_593014 ) ) ( not ( = ?auto_593008 ?auto_593014 ) ) ( not ( = ?auto_593010 ?auto_593014 ) ) ( TRUCK-AT ?auto_593011 ?auto_593009 ) ( SURFACE-AT ?auto_593010 ?auto_593009 ) ( CLEAR ?auto_593010 ) ( LIFTING ?auto_593013 ?auto_593007 ) ( IS-CRATE ?auto_593007 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593010 ?auto_593007 )
      ( MAKE-2CRATE ?auto_593010 ?auto_593007 ?auto_593008 )
      ( MAKE-1CRATE-VERIFY ?auto_593007 ?auto_593008 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593016 - SURFACE
      ?auto_593017 - SURFACE
      ?auto_593018 - SURFACE
    )
    :vars
    (
      ?auto_593022 - HOIST
      ?auto_593020 - PLACE
      ?auto_593023 - PLACE
      ?auto_593024 - HOIST
      ?auto_593021 - SURFACE
      ?auto_593019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593022 ?auto_593020 ) ( IS-CRATE ?auto_593018 ) ( not ( = ?auto_593017 ?auto_593018 ) ) ( not ( = ?auto_593016 ?auto_593017 ) ) ( not ( = ?auto_593016 ?auto_593018 ) ) ( not ( = ?auto_593023 ?auto_593020 ) ) ( HOIST-AT ?auto_593024 ?auto_593023 ) ( not ( = ?auto_593022 ?auto_593024 ) ) ( AVAILABLE ?auto_593024 ) ( SURFACE-AT ?auto_593018 ?auto_593023 ) ( ON ?auto_593018 ?auto_593021 ) ( CLEAR ?auto_593018 ) ( not ( = ?auto_593017 ?auto_593021 ) ) ( not ( = ?auto_593018 ?auto_593021 ) ) ( not ( = ?auto_593016 ?auto_593021 ) ) ( TRUCK-AT ?auto_593019 ?auto_593020 ) ( SURFACE-AT ?auto_593016 ?auto_593020 ) ( CLEAR ?auto_593016 ) ( LIFTING ?auto_593022 ?auto_593017 ) ( IS-CRATE ?auto_593017 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593017 ?auto_593018 )
      ( MAKE-2CRATE-VERIFY ?auto_593016 ?auto_593017 ?auto_593018 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593025 - SURFACE
      ?auto_593026 - SURFACE
    )
    :vars
    (
      ?auto_593029 - HOIST
      ?auto_593027 - PLACE
      ?auto_593032 - SURFACE
      ?auto_593033 - PLACE
      ?auto_593028 - HOIST
      ?auto_593030 - SURFACE
      ?auto_593031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593029 ?auto_593027 ) ( IS-CRATE ?auto_593026 ) ( not ( = ?auto_593025 ?auto_593026 ) ) ( not ( = ?auto_593032 ?auto_593025 ) ) ( not ( = ?auto_593032 ?auto_593026 ) ) ( not ( = ?auto_593033 ?auto_593027 ) ) ( HOIST-AT ?auto_593028 ?auto_593033 ) ( not ( = ?auto_593029 ?auto_593028 ) ) ( AVAILABLE ?auto_593028 ) ( SURFACE-AT ?auto_593026 ?auto_593033 ) ( ON ?auto_593026 ?auto_593030 ) ( CLEAR ?auto_593026 ) ( not ( = ?auto_593025 ?auto_593030 ) ) ( not ( = ?auto_593026 ?auto_593030 ) ) ( not ( = ?auto_593032 ?auto_593030 ) ) ( TRUCK-AT ?auto_593031 ?auto_593027 ) ( SURFACE-AT ?auto_593032 ?auto_593027 ) ( CLEAR ?auto_593032 ) ( IS-CRATE ?auto_593025 ) ( AVAILABLE ?auto_593029 ) ( IN ?auto_593025 ?auto_593031 ) )
    :subtasks
    ( ( !UNLOAD ?auto_593029 ?auto_593025 ?auto_593031 ?auto_593027 )
      ( MAKE-2CRATE ?auto_593032 ?auto_593025 ?auto_593026 )
      ( MAKE-1CRATE-VERIFY ?auto_593025 ?auto_593026 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_593034 - SURFACE
      ?auto_593035 - SURFACE
      ?auto_593036 - SURFACE
    )
    :vars
    (
      ?auto_593038 - HOIST
      ?auto_593041 - PLACE
      ?auto_593037 - PLACE
      ?auto_593039 - HOIST
      ?auto_593040 - SURFACE
      ?auto_593042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593038 ?auto_593041 ) ( IS-CRATE ?auto_593036 ) ( not ( = ?auto_593035 ?auto_593036 ) ) ( not ( = ?auto_593034 ?auto_593035 ) ) ( not ( = ?auto_593034 ?auto_593036 ) ) ( not ( = ?auto_593037 ?auto_593041 ) ) ( HOIST-AT ?auto_593039 ?auto_593037 ) ( not ( = ?auto_593038 ?auto_593039 ) ) ( AVAILABLE ?auto_593039 ) ( SURFACE-AT ?auto_593036 ?auto_593037 ) ( ON ?auto_593036 ?auto_593040 ) ( CLEAR ?auto_593036 ) ( not ( = ?auto_593035 ?auto_593040 ) ) ( not ( = ?auto_593036 ?auto_593040 ) ) ( not ( = ?auto_593034 ?auto_593040 ) ) ( TRUCK-AT ?auto_593042 ?auto_593041 ) ( SURFACE-AT ?auto_593034 ?auto_593041 ) ( CLEAR ?auto_593034 ) ( IS-CRATE ?auto_593035 ) ( AVAILABLE ?auto_593038 ) ( IN ?auto_593035 ?auto_593042 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593035 ?auto_593036 )
      ( MAKE-2CRATE-VERIFY ?auto_593034 ?auto_593035 ?auto_593036 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593079 - SURFACE
      ?auto_593080 - SURFACE
    )
    :vars
    (
      ?auto_593087 - HOIST
      ?auto_593083 - PLACE
      ?auto_593086 - SURFACE
      ?auto_593081 - PLACE
      ?auto_593084 - HOIST
      ?auto_593082 - SURFACE
      ?auto_593085 - TRUCK
      ?auto_593088 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593087 ?auto_593083 ) ( SURFACE-AT ?auto_593079 ?auto_593083 ) ( CLEAR ?auto_593079 ) ( IS-CRATE ?auto_593080 ) ( not ( = ?auto_593079 ?auto_593080 ) ) ( AVAILABLE ?auto_593087 ) ( ON ?auto_593079 ?auto_593086 ) ( not ( = ?auto_593086 ?auto_593079 ) ) ( not ( = ?auto_593086 ?auto_593080 ) ) ( not ( = ?auto_593081 ?auto_593083 ) ) ( HOIST-AT ?auto_593084 ?auto_593081 ) ( not ( = ?auto_593087 ?auto_593084 ) ) ( AVAILABLE ?auto_593084 ) ( SURFACE-AT ?auto_593080 ?auto_593081 ) ( ON ?auto_593080 ?auto_593082 ) ( CLEAR ?auto_593080 ) ( not ( = ?auto_593079 ?auto_593082 ) ) ( not ( = ?auto_593080 ?auto_593082 ) ) ( not ( = ?auto_593086 ?auto_593082 ) ) ( TRUCK-AT ?auto_593085 ?auto_593088 ) ( not ( = ?auto_593088 ?auto_593083 ) ) ( not ( = ?auto_593081 ?auto_593088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_593085 ?auto_593088 ?auto_593083 )
      ( MAKE-1CRATE ?auto_593079 ?auto_593080 )
      ( MAKE-1CRATE-VERIFY ?auto_593079 ?auto_593080 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593118 - SURFACE
      ?auto_593119 - SURFACE
      ?auto_593120 - SURFACE
      ?auto_593121 - SURFACE
    )
    :vars
    (
      ?auto_593122 - HOIST
      ?auto_593123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593122 ?auto_593123 ) ( SURFACE-AT ?auto_593120 ?auto_593123 ) ( CLEAR ?auto_593120 ) ( LIFTING ?auto_593122 ?auto_593121 ) ( IS-CRATE ?auto_593121 ) ( not ( = ?auto_593120 ?auto_593121 ) ) ( ON ?auto_593119 ?auto_593118 ) ( ON ?auto_593120 ?auto_593119 ) ( not ( = ?auto_593118 ?auto_593119 ) ) ( not ( = ?auto_593118 ?auto_593120 ) ) ( not ( = ?auto_593118 ?auto_593121 ) ) ( not ( = ?auto_593119 ?auto_593120 ) ) ( not ( = ?auto_593119 ?auto_593121 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593120 ?auto_593121 )
      ( MAKE-3CRATE-VERIFY ?auto_593118 ?auto_593119 ?auto_593120 ?auto_593121 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593135 - SURFACE
      ?auto_593136 - SURFACE
      ?auto_593137 - SURFACE
      ?auto_593138 - SURFACE
    )
    :vars
    (
      ?auto_593141 - HOIST
      ?auto_593140 - PLACE
      ?auto_593139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593141 ?auto_593140 ) ( SURFACE-AT ?auto_593137 ?auto_593140 ) ( CLEAR ?auto_593137 ) ( IS-CRATE ?auto_593138 ) ( not ( = ?auto_593137 ?auto_593138 ) ) ( TRUCK-AT ?auto_593139 ?auto_593140 ) ( AVAILABLE ?auto_593141 ) ( IN ?auto_593138 ?auto_593139 ) ( ON ?auto_593137 ?auto_593136 ) ( not ( = ?auto_593136 ?auto_593137 ) ) ( not ( = ?auto_593136 ?auto_593138 ) ) ( ON ?auto_593136 ?auto_593135 ) ( not ( = ?auto_593135 ?auto_593136 ) ) ( not ( = ?auto_593135 ?auto_593137 ) ) ( not ( = ?auto_593135 ?auto_593138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593136 ?auto_593137 ?auto_593138 )
      ( MAKE-3CRATE-VERIFY ?auto_593135 ?auto_593136 ?auto_593137 ?auto_593138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593156 - SURFACE
      ?auto_593157 - SURFACE
      ?auto_593158 - SURFACE
      ?auto_593159 - SURFACE
    )
    :vars
    (
      ?auto_593160 - HOIST
      ?auto_593161 - PLACE
      ?auto_593162 - TRUCK
      ?auto_593163 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593160 ?auto_593161 ) ( SURFACE-AT ?auto_593158 ?auto_593161 ) ( CLEAR ?auto_593158 ) ( IS-CRATE ?auto_593159 ) ( not ( = ?auto_593158 ?auto_593159 ) ) ( AVAILABLE ?auto_593160 ) ( IN ?auto_593159 ?auto_593162 ) ( ON ?auto_593158 ?auto_593157 ) ( not ( = ?auto_593157 ?auto_593158 ) ) ( not ( = ?auto_593157 ?auto_593159 ) ) ( TRUCK-AT ?auto_593162 ?auto_593163 ) ( not ( = ?auto_593163 ?auto_593161 ) ) ( ON ?auto_593157 ?auto_593156 ) ( not ( = ?auto_593156 ?auto_593157 ) ) ( not ( = ?auto_593156 ?auto_593158 ) ) ( not ( = ?auto_593156 ?auto_593159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593157 ?auto_593158 ?auto_593159 )
      ( MAKE-3CRATE-VERIFY ?auto_593156 ?auto_593157 ?auto_593158 ?auto_593159 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593180 - SURFACE
      ?auto_593181 - SURFACE
      ?auto_593182 - SURFACE
      ?auto_593183 - SURFACE
    )
    :vars
    (
      ?auto_593184 - HOIST
      ?auto_593187 - PLACE
      ?auto_593188 - TRUCK
      ?auto_593186 - PLACE
      ?auto_593185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593184 ?auto_593187 ) ( SURFACE-AT ?auto_593182 ?auto_593187 ) ( CLEAR ?auto_593182 ) ( IS-CRATE ?auto_593183 ) ( not ( = ?auto_593182 ?auto_593183 ) ) ( AVAILABLE ?auto_593184 ) ( ON ?auto_593182 ?auto_593181 ) ( not ( = ?auto_593181 ?auto_593182 ) ) ( not ( = ?auto_593181 ?auto_593183 ) ) ( TRUCK-AT ?auto_593188 ?auto_593186 ) ( not ( = ?auto_593186 ?auto_593187 ) ) ( HOIST-AT ?auto_593185 ?auto_593186 ) ( LIFTING ?auto_593185 ?auto_593183 ) ( not ( = ?auto_593184 ?auto_593185 ) ) ( ON ?auto_593181 ?auto_593180 ) ( not ( = ?auto_593180 ?auto_593181 ) ) ( not ( = ?auto_593180 ?auto_593182 ) ) ( not ( = ?auto_593180 ?auto_593183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593181 ?auto_593182 ?auto_593183 )
      ( MAKE-3CRATE-VERIFY ?auto_593180 ?auto_593181 ?auto_593182 ?auto_593183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593207 - SURFACE
      ?auto_593208 - SURFACE
      ?auto_593209 - SURFACE
      ?auto_593210 - SURFACE
    )
    :vars
    (
      ?auto_593214 - HOIST
      ?auto_593211 - PLACE
      ?auto_593213 - TRUCK
      ?auto_593212 - PLACE
      ?auto_593215 - HOIST
      ?auto_593216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593214 ?auto_593211 ) ( SURFACE-AT ?auto_593209 ?auto_593211 ) ( CLEAR ?auto_593209 ) ( IS-CRATE ?auto_593210 ) ( not ( = ?auto_593209 ?auto_593210 ) ) ( AVAILABLE ?auto_593214 ) ( ON ?auto_593209 ?auto_593208 ) ( not ( = ?auto_593208 ?auto_593209 ) ) ( not ( = ?auto_593208 ?auto_593210 ) ) ( TRUCK-AT ?auto_593213 ?auto_593212 ) ( not ( = ?auto_593212 ?auto_593211 ) ) ( HOIST-AT ?auto_593215 ?auto_593212 ) ( not ( = ?auto_593214 ?auto_593215 ) ) ( AVAILABLE ?auto_593215 ) ( SURFACE-AT ?auto_593210 ?auto_593212 ) ( ON ?auto_593210 ?auto_593216 ) ( CLEAR ?auto_593210 ) ( not ( = ?auto_593209 ?auto_593216 ) ) ( not ( = ?auto_593210 ?auto_593216 ) ) ( not ( = ?auto_593208 ?auto_593216 ) ) ( ON ?auto_593208 ?auto_593207 ) ( not ( = ?auto_593207 ?auto_593208 ) ) ( not ( = ?auto_593207 ?auto_593209 ) ) ( not ( = ?auto_593207 ?auto_593210 ) ) ( not ( = ?auto_593207 ?auto_593216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593208 ?auto_593209 ?auto_593210 )
      ( MAKE-3CRATE-VERIFY ?auto_593207 ?auto_593208 ?auto_593209 ?auto_593210 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593235 - SURFACE
      ?auto_593236 - SURFACE
      ?auto_593237 - SURFACE
      ?auto_593238 - SURFACE
    )
    :vars
    (
      ?auto_593242 - HOIST
      ?auto_593241 - PLACE
      ?auto_593244 - PLACE
      ?auto_593239 - HOIST
      ?auto_593240 - SURFACE
      ?auto_593243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593242 ?auto_593241 ) ( SURFACE-AT ?auto_593237 ?auto_593241 ) ( CLEAR ?auto_593237 ) ( IS-CRATE ?auto_593238 ) ( not ( = ?auto_593237 ?auto_593238 ) ) ( AVAILABLE ?auto_593242 ) ( ON ?auto_593237 ?auto_593236 ) ( not ( = ?auto_593236 ?auto_593237 ) ) ( not ( = ?auto_593236 ?auto_593238 ) ) ( not ( = ?auto_593244 ?auto_593241 ) ) ( HOIST-AT ?auto_593239 ?auto_593244 ) ( not ( = ?auto_593242 ?auto_593239 ) ) ( AVAILABLE ?auto_593239 ) ( SURFACE-AT ?auto_593238 ?auto_593244 ) ( ON ?auto_593238 ?auto_593240 ) ( CLEAR ?auto_593238 ) ( not ( = ?auto_593237 ?auto_593240 ) ) ( not ( = ?auto_593238 ?auto_593240 ) ) ( not ( = ?auto_593236 ?auto_593240 ) ) ( TRUCK-AT ?auto_593243 ?auto_593241 ) ( ON ?auto_593236 ?auto_593235 ) ( not ( = ?auto_593235 ?auto_593236 ) ) ( not ( = ?auto_593235 ?auto_593237 ) ) ( not ( = ?auto_593235 ?auto_593238 ) ) ( not ( = ?auto_593235 ?auto_593240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593236 ?auto_593237 ?auto_593238 )
      ( MAKE-3CRATE-VERIFY ?auto_593235 ?auto_593236 ?auto_593237 ?auto_593238 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593263 - SURFACE
      ?auto_593264 - SURFACE
      ?auto_593265 - SURFACE
      ?auto_593266 - SURFACE
    )
    :vars
    (
      ?auto_593271 - HOIST
      ?auto_593270 - PLACE
      ?auto_593272 - PLACE
      ?auto_593267 - HOIST
      ?auto_593268 - SURFACE
      ?auto_593269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593271 ?auto_593270 ) ( IS-CRATE ?auto_593266 ) ( not ( = ?auto_593265 ?auto_593266 ) ) ( not ( = ?auto_593264 ?auto_593265 ) ) ( not ( = ?auto_593264 ?auto_593266 ) ) ( not ( = ?auto_593272 ?auto_593270 ) ) ( HOIST-AT ?auto_593267 ?auto_593272 ) ( not ( = ?auto_593271 ?auto_593267 ) ) ( AVAILABLE ?auto_593267 ) ( SURFACE-AT ?auto_593266 ?auto_593272 ) ( ON ?auto_593266 ?auto_593268 ) ( CLEAR ?auto_593266 ) ( not ( = ?auto_593265 ?auto_593268 ) ) ( not ( = ?auto_593266 ?auto_593268 ) ) ( not ( = ?auto_593264 ?auto_593268 ) ) ( TRUCK-AT ?auto_593269 ?auto_593270 ) ( SURFACE-AT ?auto_593264 ?auto_593270 ) ( CLEAR ?auto_593264 ) ( LIFTING ?auto_593271 ?auto_593265 ) ( IS-CRATE ?auto_593265 ) ( ON ?auto_593264 ?auto_593263 ) ( not ( = ?auto_593263 ?auto_593264 ) ) ( not ( = ?auto_593263 ?auto_593265 ) ) ( not ( = ?auto_593263 ?auto_593266 ) ) ( not ( = ?auto_593263 ?auto_593268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593264 ?auto_593265 ?auto_593266 )
      ( MAKE-3CRATE-VERIFY ?auto_593263 ?auto_593264 ?auto_593265 ?auto_593266 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_593291 - SURFACE
      ?auto_593292 - SURFACE
      ?auto_593293 - SURFACE
      ?auto_593294 - SURFACE
    )
    :vars
    (
      ?auto_593297 - HOIST
      ?auto_593296 - PLACE
      ?auto_593295 - PLACE
      ?auto_593300 - HOIST
      ?auto_593298 - SURFACE
      ?auto_593299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593297 ?auto_593296 ) ( IS-CRATE ?auto_593294 ) ( not ( = ?auto_593293 ?auto_593294 ) ) ( not ( = ?auto_593292 ?auto_593293 ) ) ( not ( = ?auto_593292 ?auto_593294 ) ) ( not ( = ?auto_593295 ?auto_593296 ) ) ( HOIST-AT ?auto_593300 ?auto_593295 ) ( not ( = ?auto_593297 ?auto_593300 ) ) ( AVAILABLE ?auto_593300 ) ( SURFACE-AT ?auto_593294 ?auto_593295 ) ( ON ?auto_593294 ?auto_593298 ) ( CLEAR ?auto_593294 ) ( not ( = ?auto_593293 ?auto_593298 ) ) ( not ( = ?auto_593294 ?auto_593298 ) ) ( not ( = ?auto_593292 ?auto_593298 ) ) ( TRUCK-AT ?auto_593299 ?auto_593296 ) ( SURFACE-AT ?auto_593292 ?auto_593296 ) ( CLEAR ?auto_593292 ) ( IS-CRATE ?auto_593293 ) ( AVAILABLE ?auto_593297 ) ( IN ?auto_593293 ?auto_593299 ) ( ON ?auto_593292 ?auto_593291 ) ( not ( = ?auto_593291 ?auto_593292 ) ) ( not ( = ?auto_593291 ?auto_593293 ) ) ( not ( = ?auto_593291 ?auto_593294 ) ) ( not ( = ?auto_593291 ?auto_593298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593292 ?auto_593293 ?auto_593294 )
      ( MAKE-3CRATE-VERIFY ?auto_593291 ?auto_593292 ?auto_593293 ?auto_593294 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593582 - SURFACE
      ?auto_593583 - SURFACE
      ?auto_593584 - SURFACE
      ?auto_593585 - SURFACE
      ?auto_593586 - SURFACE
    )
    :vars
    (
      ?auto_593588 - HOIST
      ?auto_593587 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593588 ?auto_593587 ) ( SURFACE-AT ?auto_593585 ?auto_593587 ) ( CLEAR ?auto_593585 ) ( LIFTING ?auto_593588 ?auto_593586 ) ( IS-CRATE ?auto_593586 ) ( not ( = ?auto_593585 ?auto_593586 ) ) ( ON ?auto_593583 ?auto_593582 ) ( ON ?auto_593584 ?auto_593583 ) ( ON ?auto_593585 ?auto_593584 ) ( not ( = ?auto_593582 ?auto_593583 ) ) ( not ( = ?auto_593582 ?auto_593584 ) ) ( not ( = ?auto_593582 ?auto_593585 ) ) ( not ( = ?auto_593582 ?auto_593586 ) ) ( not ( = ?auto_593583 ?auto_593584 ) ) ( not ( = ?auto_593583 ?auto_593585 ) ) ( not ( = ?auto_593583 ?auto_593586 ) ) ( not ( = ?auto_593584 ?auto_593585 ) ) ( not ( = ?auto_593584 ?auto_593586 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_593585 ?auto_593586 )
      ( MAKE-4CRATE-VERIFY ?auto_593582 ?auto_593583 ?auto_593584 ?auto_593585 ?auto_593586 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593607 - SURFACE
      ?auto_593608 - SURFACE
      ?auto_593609 - SURFACE
      ?auto_593610 - SURFACE
      ?auto_593611 - SURFACE
    )
    :vars
    (
      ?auto_593612 - HOIST
      ?auto_593614 - PLACE
      ?auto_593613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593612 ?auto_593614 ) ( SURFACE-AT ?auto_593610 ?auto_593614 ) ( CLEAR ?auto_593610 ) ( IS-CRATE ?auto_593611 ) ( not ( = ?auto_593610 ?auto_593611 ) ) ( TRUCK-AT ?auto_593613 ?auto_593614 ) ( AVAILABLE ?auto_593612 ) ( IN ?auto_593611 ?auto_593613 ) ( ON ?auto_593610 ?auto_593609 ) ( not ( = ?auto_593609 ?auto_593610 ) ) ( not ( = ?auto_593609 ?auto_593611 ) ) ( ON ?auto_593608 ?auto_593607 ) ( ON ?auto_593609 ?auto_593608 ) ( not ( = ?auto_593607 ?auto_593608 ) ) ( not ( = ?auto_593607 ?auto_593609 ) ) ( not ( = ?auto_593607 ?auto_593610 ) ) ( not ( = ?auto_593607 ?auto_593611 ) ) ( not ( = ?auto_593608 ?auto_593609 ) ) ( not ( = ?auto_593608 ?auto_593610 ) ) ( not ( = ?auto_593608 ?auto_593611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593609 ?auto_593610 ?auto_593611 )
      ( MAKE-4CRATE-VERIFY ?auto_593607 ?auto_593608 ?auto_593609 ?auto_593610 ?auto_593611 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593637 - SURFACE
      ?auto_593638 - SURFACE
      ?auto_593639 - SURFACE
      ?auto_593640 - SURFACE
      ?auto_593641 - SURFACE
    )
    :vars
    (
      ?auto_593644 - HOIST
      ?auto_593645 - PLACE
      ?auto_593642 - TRUCK
      ?auto_593643 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593644 ?auto_593645 ) ( SURFACE-AT ?auto_593640 ?auto_593645 ) ( CLEAR ?auto_593640 ) ( IS-CRATE ?auto_593641 ) ( not ( = ?auto_593640 ?auto_593641 ) ) ( AVAILABLE ?auto_593644 ) ( IN ?auto_593641 ?auto_593642 ) ( ON ?auto_593640 ?auto_593639 ) ( not ( = ?auto_593639 ?auto_593640 ) ) ( not ( = ?auto_593639 ?auto_593641 ) ) ( TRUCK-AT ?auto_593642 ?auto_593643 ) ( not ( = ?auto_593643 ?auto_593645 ) ) ( ON ?auto_593638 ?auto_593637 ) ( ON ?auto_593639 ?auto_593638 ) ( not ( = ?auto_593637 ?auto_593638 ) ) ( not ( = ?auto_593637 ?auto_593639 ) ) ( not ( = ?auto_593637 ?auto_593640 ) ) ( not ( = ?auto_593637 ?auto_593641 ) ) ( not ( = ?auto_593638 ?auto_593639 ) ) ( not ( = ?auto_593638 ?auto_593640 ) ) ( not ( = ?auto_593638 ?auto_593641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593639 ?auto_593640 ?auto_593641 )
      ( MAKE-4CRATE-VERIFY ?auto_593637 ?auto_593638 ?auto_593639 ?auto_593640 ?auto_593641 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593671 - SURFACE
      ?auto_593672 - SURFACE
      ?auto_593673 - SURFACE
      ?auto_593674 - SURFACE
      ?auto_593675 - SURFACE
    )
    :vars
    (
      ?auto_593677 - HOIST
      ?auto_593680 - PLACE
      ?auto_593676 - TRUCK
      ?auto_593679 - PLACE
      ?auto_593678 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_593677 ?auto_593680 ) ( SURFACE-AT ?auto_593674 ?auto_593680 ) ( CLEAR ?auto_593674 ) ( IS-CRATE ?auto_593675 ) ( not ( = ?auto_593674 ?auto_593675 ) ) ( AVAILABLE ?auto_593677 ) ( ON ?auto_593674 ?auto_593673 ) ( not ( = ?auto_593673 ?auto_593674 ) ) ( not ( = ?auto_593673 ?auto_593675 ) ) ( TRUCK-AT ?auto_593676 ?auto_593679 ) ( not ( = ?auto_593679 ?auto_593680 ) ) ( HOIST-AT ?auto_593678 ?auto_593679 ) ( LIFTING ?auto_593678 ?auto_593675 ) ( not ( = ?auto_593677 ?auto_593678 ) ) ( ON ?auto_593672 ?auto_593671 ) ( ON ?auto_593673 ?auto_593672 ) ( not ( = ?auto_593671 ?auto_593672 ) ) ( not ( = ?auto_593671 ?auto_593673 ) ) ( not ( = ?auto_593671 ?auto_593674 ) ) ( not ( = ?auto_593671 ?auto_593675 ) ) ( not ( = ?auto_593672 ?auto_593673 ) ) ( not ( = ?auto_593672 ?auto_593674 ) ) ( not ( = ?auto_593672 ?auto_593675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593673 ?auto_593674 ?auto_593675 )
      ( MAKE-4CRATE-VERIFY ?auto_593671 ?auto_593672 ?auto_593673 ?auto_593674 ?auto_593675 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593709 - SURFACE
      ?auto_593710 - SURFACE
      ?auto_593711 - SURFACE
      ?auto_593712 - SURFACE
      ?auto_593713 - SURFACE
    )
    :vars
    (
      ?auto_593716 - HOIST
      ?auto_593718 - PLACE
      ?auto_593714 - TRUCK
      ?auto_593719 - PLACE
      ?auto_593717 - HOIST
      ?auto_593715 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_593716 ?auto_593718 ) ( SURFACE-AT ?auto_593712 ?auto_593718 ) ( CLEAR ?auto_593712 ) ( IS-CRATE ?auto_593713 ) ( not ( = ?auto_593712 ?auto_593713 ) ) ( AVAILABLE ?auto_593716 ) ( ON ?auto_593712 ?auto_593711 ) ( not ( = ?auto_593711 ?auto_593712 ) ) ( not ( = ?auto_593711 ?auto_593713 ) ) ( TRUCK-AT ?auto_593714 ?auto_593719 ) ( not ( = ?auto_593719 ?auto_593718 ) ) ( HOIST-AT ?auto_593717 ?auto_593719 ) ( not ( = ?auto_593716 ?auto_593717 ) ) ( AVAILABLE ?auto_593717 ) ( SURFACE-AT ?auto_593713 ?auto_593719 ) ( ON ?auto_593713 ?auto_593715 ) ( CLEAR ?auto_593713 ) ( not ( = ?auto_593712 ?auto_593715 ) ) ( not ( = ?auto_593713 ?auto_593715 ) ) ( not ( = ?auto_593711 ?auto_593715 ) ) ( ON ?auto_593710 ?auto_593709 ) ( ON ?auto_593711 ?auto_593710 ) ( not ( = ?auto_593709 ?auto_593710 ) ) ( not ( = ?auto_593709 ?auto_593711 ) ) ( not ( = ?auto_593709 ?auto_593712 ) ) ( not ( = ?auto_593709 ?auto_593713 ) ) ( not ( = ?auto_593709 ?auto_593715 ) ) ( not ( = ?auto_593710 ?auto_593711 ) ) ( not ( = ?auto_593710 ?auto_593712 ) ) ( not ( = ?auto_593710 ?auto_593713 ) ) ( not ( = ?auto_593710 ?auto_593715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593711 ?auto_593712 ?auto_593713 )
      ( MAKE-4CRATE-VERIFY ?auto_593709 ?auto_593710 ?auto_593711 ?auto_593712 ?auto_593713 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593748 - SURFACE
      ?auto_593749 - SURFACE
      ?auto_593750 - SURFACE
      ?auto_593751 - SURFACE
      ?auto_593752 - SURFACE
    )
    :vars
    (
      ?auto_593755 - HOIST
      ?auto_593753 - PLACE
      ?auto_593757 - PLACE
      ?auto_593758 - HOIST
      ?auto_593756 - SURFACE
      ?auto_593754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593755 ?auto_593753 ) ( SURFACE-AT ?auto_593751 ?auto_593753 ) ( CLEAR ?auto_593751 ) ( IS-CRATE ?auto_593752 ) ( not ( = ?auto_593751 ?auto_593752 ) ) ( AVAILABLE ?auto_593755 ) ( ON ?auto_593751 ?auto_593750 ) ( not ( = ?auto_593750 ?auto_593751 ) ) ( not ( = ?auto_593750 ?auto_593752 ) ) ( not ( = ?auto_593757 ?auto_593753 ) ) ( HOIST-AT ?auto_593758 ?auto_593757 ) ( not ( = ?auto_593755 ?auto_593758 ) ) ( AVAILABLE ?auto_593758 ) ( SURFACE-AT ?auto_593752 ?auto_593757 ) ( ON ?auto_593752 ?auto_593756 ) ( CLEAR ?auto_593752 ) ( not ( = ?auto_593751 ?auto_593756 ) ) ( not ( = ?auto_593752 ?auto_593756 ) ) ( not ( = ?auto_593750 ?auto_593756 ) ) ( TRUCK-AT ?auto_593754 ?auto_593753 ) ( ON ?auto_593749 ?auto_593748 ) ( ON ?auto_593750 ?auto_593749 ) ( not ( = ?auto_593748 ?auto_593749 ) ) ( not ( = ?auto_593748 ?auto_593750 ) ) ( not ( = ?auto_593748 ?auto_593751 ) ) ( not ( = ?auto_593748 ?auto_593752 ) ) ( not ( = ?auto_593748 ?auto_593756 ) ) ( not ( = ?auto_593749 ?auto_593750 ) ) ( not ( = ?auto_593749 ?auto_593751 ) ) ( not ( = ?auto_593749 ?auto_593752 ) ) ( not ( = ?auto_593749 ?auto_593756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593750 ?auto_593751 ?auto_593752 )
      ( MAKE-4CRATE-VERIFY ?auto_593748 ?auto_593749 ?auto_593750 ?auto_593751 ?auto_593752 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593787 - SURFACE
      ?auto_593788 - SURFACE
      ?auto_593789 - SURFACE
      ?auto_593790 - SURFACE
      ?auto_593791 - SURFACE
    )
    :vars
    (
      ?auto_593797 - HOIST
      ?auto_593796 - PLACE
      ?auto_593795 - PLACE
      ?auto_593792 - HOIST
      ?auto_593793 - SURFACE
      ?auto_593794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593797 ?auto_593796 ) ( IS-CRATE ?auto_593791 ) ( not ( = ?auto_593790 ?auto_593791 ) ) ( not ( = ?auto_593789 ?auto_593790 ) ) ( not ( = ?auto_593789 ?auto_593791 ) ) ( not ( = ?auto_593795 ?auto_593796 ) ) ( HOIST-AT ?auto_593792 ?auto_593795 ) ( not ( = ?auto_593797 ?auto_593792 ) ) ( AVAILABLE ?auto_593792 ) ( SURFACE-AT ?auto_593791 ?auto_593795 ) ( ON ?auto_593791 ?auto_593793 ) ( CLEAR ?auto_593791 ) ( not ( = ?auto_593790 ?auto_593793 ) ) ( not ( = ?auto_593791 ?auto_593793 ) ) ( not ( = ?auto_593789 ?auto_593793 ) ) ( TRUCK-AT ?auto_593794 ?auto_593796 ) ( SURFACE-AT ?auto_593789 ?auto_593796 ) ( CLEAR ?auto_593789 ) ( LIFTING ?auto_593797 ?auto_593790 ) ( IS-CRATE ?auto_593790 ) ( ON ?auto_593788 ?auto_593787 ) ( ON ?auto_593789 ?auto_593788 ) ( not ( = ?auto_593787 ?auto_593788 ) ) ( not ( = ?auto_593787 ?auto_593789 ) ) ( not ( = ?auto_593787 ?auto_593790 ) ) ( not ( = ?auto_593787 ?auto_593791 ) ) ( not ( = ?auto_593787 ?auto_593793 ) ) ( not ( = ?auto_593788 ?auto_593789 ) ) ( not ( = ?auto_593788 ?auto_593790 ) ) ( not ( = ?auto_593788 ?auto_593791 ) ) ( not ( = ?auto_593788 ?auto_593793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593789 ?auto_593790 ?auto_593791 )
      ( MAKE-4CRATE-VERIFY ?auto_593787 ?auto_593788 ?auto_593789 ?auto_593790 ?auto_593791 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_593826 - SURFACE
      ?auto_593827 - SURFACE
      ?auto_593828 - SURFACE
      ?auto_593829 - SURFACE
      ?auto_593830 - SURFACE
    )
    :vars
    (
      ?auto_593835 - HOIST
      ?auto_593834 - PLACE
      ?auto_593836 - PLACE
      ?auto_593832 - HOIST
      ?auto_593831 - SURFACE
      ?auto_593833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_593835 ?auto_593834 ) ( IS-CRATE ?auto_593830 ) ( not ( = ?auto_593829 ?auto_593830 ) ) ( not ( = ?auto_593828 ?auto_593829 ) ) ( not ( = ?auto_593828 ?auto_593830 ) ) ( not ( = ?auto_593836 ?auto_593834 ) ) ( HOIST-AT ?auto_593832 ?auto_593836 ) ( not ( = ?auto_593835 ?auto_593832 ) ) ( AVAILABLE ?auto_593832 ) ( SURFACE-AT ?auto_593830 ?auto_593836 ) ( ON ?auto_593830 ?auto_593831 ) ( CLEAR ?auto_593830 ) ( not ( = ?auto_593829 ?auto_593831 ) ) ( not ( = ?auto_593830 ?auto_593831 ) ) ( not ( = ?auto_593828 ?auto_593831 ) ) ( TRUCK-AT ?auto_593833 ?auto_593834 ) ( SURFACE-AT ?auto_593828 ?auto_593834 ) ( CLEAR ?auto_593828 ) ( IS-CRATE ?auto_593829 ) ( AVAILABLE ?auto_593835 ) ( IN ?auto_593829 ?auto_593833 ) ( ON ?auto_593827 ?auto_593826 ) ( ON ?auto_593828 ?auto_593827 ) ( not ( = ?auto_593826 ?auto_593827 ) ) ( not ( = ?auto_593826 ?auto_593828 ) ) ( not ( = ?auto_593826 ?auto_593829 ) ) ( not ( = ?auto_593826 ?auto_593830 ) ) ( not ( = ?auto_593826 ?auto_593831 ) ) ( not ( = ?auto_593827 ?auto_593828 ) ) ( not ( = ?auto_593827 ?auto_593829 ) ) ( not ( = ?auto_593827 ?auto_593830 ) ) ( not ( = ?auto_593827 ?auto_593831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_593828 ?auto_593829 ?auto_593830 )
      ( MAKE-4CRATE-VERIFY ?auto_593826 ?auto_593827 ?auto_593828 ?auto_593829 ?auto_593830 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_594327 - SURFACE
      ?auto_594328 - SURFACE
    )
    :vars
    (
      ?auto_594334 - HOIST
      ?auto_594329 - PLACE
      ?auto_594333 - SURFACE
      ?auto_594335 - TRUCK
      ?auto_594332 - PLACE
      ?auto_594330 - HOIST
      ?auto_594331 - SURFACE
      ?auto_594336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594334 ?auto_594329 ) ( SURFACE-AT ?auto_594327 ?auto_594329 ) ( CLEAR ?auto_594327 ) ( IS-CRATE ?auto_594328 ) ( not ( = ?auto_594327 ?auto_594328 ) ) ( AVAILABLE ?auto_594334 ) ( ON ?auto_594327 ?auto_594333 ) ( not ( = ?auto_594333 ?auto_594327 ) ) ( not ( = ?auto_594333 ?auto_594328 ) ) ( TRUCK-AT ?auto_594335 ?auto_594332 ) ( not ( = ?auto_594332 ?auto_594329 ) ) ( HOIST-AT ?auto_594330 ?auto_594332 ) ( not ( = ?auto_594334 ?auto_594330 ) ) ( SURFACE-AT ?auto_594328 ?auto_594332 ) ( ON ?auto_594328 ?auto_594331 ) ( CLEAR ?auto_594328 ) ( not ( = ?auto_594327 ?auto_594331 ) ) ( not ( = ?auto_594328 ?auto_594331 ) ) ( not ( = ?auto_594333 ?auto_594331 ) ) ( LIFTING ?auto_594330 ?auto_594336 ) ( IS-CRATE ?auto_594336 ) ( not ( = ?auto_594327 ?auto_594336 ) ) ( not ( = ?auto_594328 ?auto_594336 ) ) ( not ( = ?auto_594333 ?auto_594336 ) ) ( not ( = ?auto_594331 ?auto_594336 ) ) )
    :subtasks
    ( ( !LOAD ?auto_594330 ?auto_594336 ?auto_594335 ?auto_594332 )
      ( MAKE-1CRATE ?auto_594327 ?auto_594328 )
      ( MAKE-1CRATE-VERIFY ?auto_594327 ?auto_594328 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594486 - SURFACE
      ?auto_594487 - SURFACE
      ?auto_594488 - SURFACE
      ?auto_594489 - SURFACE
      ?auto_594490 - SURFACE
      ?auto_594491 - SURFACE
    )
    :vars
    (
      ?auto_594493 - HOIST
      ?auto_594492 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594493 ?auto_594492 ) ( SURFACE-AT ?auto_594490 ?auto_594492 ) ( CLEAR ?auto_594490 ) ( LIFTING ?auto_594493 ?auto_594491 ) ( IS-CRATE ?auto_594491 ) ( not ( = ?auto_594490 ?auto_594491 ) ) ( ON ?auto_594487 ?auto_594486 ) ( ON ?auto_594488 ?auto_594487 ) ( ON ?auto_594489 ?auto_594488 ) ( ON ?auto_594490 ?auto_594489 ) ( not ( = ?auto_594486 ?auto_594487 ) ) ( not ( = ?auto_594486 ?auto_594488 ) ) ( not ( = ?auto_594486 ?auto_594489 ) ) ( not ( = ?auto_594486 ?auto_594490 ) ) ( not ( = ?auto_594486 ?auto_594491 ) ) ( not ( = ?auto_594487 ?auto_594488 ) ) ( not ( = ?auto_594487 ?auto_594489 ) ) ( not ( = ?auto_594487 ?auto_594490 ) ) ( not ( = ?auto_594487 ?auto_594491 ) ) ( not ( = ?auto_594488 ?auto_594489 ) ) ( not ( = ?auto_594488 ?auto_594490 ) ) ( not ( = ?auto_594488 ?auto_594491 ) ) ( not ( = ?auto_594489 ?auto_594490 ) ) ( not ( = ?auto_594489 ?auto_594491 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_594490 ?auto_594491 )
      ( MAKE-5CRATE-VERIFY ?auto_594486 ?auto_594487 ?auto_594488 ?auto_594489 ?auto_594490 ?auto_594491 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594520 - SURFACE
      ?auto_594521 - SURFACE
      ?auto_594522 - SURFACE
      ?auto_594523 - SURFACE
      ?auto_594524 - SURFACE
      ?auto_594525 - SURFACE
    )
    :vars
    (
      ?auto_594527 - HOIST
      ?auto_594528 - PLACE
      ?auto_594526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594527 ?auto_594528 ) ( SURFACE-AT ?auto_594524 ?auto_594528 ) ( CLEAR ?auto_594524 ) ( IS-CRATE ?auto_594525 ) ( not ( = ?auto_594524 ?auto_594525 ) ) ( TRUCK-AT ?auto_594526 ?auto_594528 ) ( AVAILABLE ?auto_594527 ) ( IN ?auto_594525 ?auto_594526 ) ( ON ?auto_594524 ?auto_594523 ) ( not ( = ?auto_594523 ?auto_594524 ) ) ( not ( = ?auto_594523 ?auto_594525 ) ) ( ON ?auto_594521 ?auto_594520 ) ( ON ?auto_594522 ?auto_594521 ) ( ON ?auto_594523 ?auto_594522 ) ( not ( = ?auto_594520 ?auto_594521 ) ) ( not ( = ?auto_594520 ?auto_594522 ) ) ( not ( = ?auto_594520 ?auto_594523 ) ) ( not ( = ?auto_594520 ?auto_594524 ) ) ( not ( = ?auto_594520 ?auto_594525 ) ) ( not ( = ?auto_594521 ?auto_594522 ) ) ( not ( = ?auto_594521 ?auto_594523 ) ) ( not ( = ?auto_594521 ?auto_594524 ) ) ( not ( = ?auto_594521 ?auto_594525 ) ) ( not ( = ?auto_594522 ?auto_594523 ) ) ( not ( = ?auto_594522 ?auto_594524 ) ) ( not ( = ?auto_594522 ?auto_594525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594523 ?auto_594524 ?auto_594525 )
      ( MAKE-5CRATE-VERIFY ?auto_594520 ?auto_594521 ?auto_594522 ?auto_594523 ?auto_594524 ?auto_594525 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594560 - SURFACE
      ?auto_594561 - SURFACE
      ?auto_594562 - SURFACE
      ?auto_594563 - SURFACE
      ?auto_594564 - SURFACE
      ?auto_594565 - SURFACE
    )
    :vars
    (
      ?auto_594566 - HOIST
      ?auto_594568 - PLACE
      ?auto_594569 - TRUCK
      ?auto_594567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594566 ?auto_594568 ) ( SURFACE-AT ?auto_594564 ?auto_594568 ) ( CLEAR ?auto_594564 ) ( IS-CRATE ?auto_594565 ) ( not ( = ?auto_594564 ?auto_594565 ) ) ( AVAILABLE ?auto_594566 ) ( IN ?auto_594565 ?auto_594569 ) ( ON ?auto_594564 ?auto_594563 ) ( not ( = ?auto_594563 ?auto_594564 ) ) ( not ( = ?auto_594563 ?auto_594565 ) ) ( TRUCK-AT ?auto_594569 ?auto_594567 ) ( not ( = ?auto_594567 ?auto_594568 ) ) ( ON ?auto_594561 ?auto_594560 ) ( ON ?auto_594562 ?auto_594561 ) ( ON ?auto_594563 ?auto_594562 ) ( not ( = ?auto_594560 ?auto_594561 ) ) ( not ( = ?auto_594560 ?auto_594562 ) ) ( not ( = ?auto_594560 ?auto_594563 ) ) ( not ( = ?auto_594560 ?auto_594564 ) ) ( not ( = ?auto_594560 ?auto_594565 ) ) ( not ( = ?auto_594561 ?auto_594562 ) ) ( not ( = ?auto_594561 ?auto_594563 ) ) ( not ( = ?auto_594561 ?auto_594564 ) ) ( not ( = ?auto_594561 ?auto_594565 ) ) ( not ( = ?auto_594562 ?auto_594563 ) ) ( not ( = ?auto_594562 ?auto_594564 ) ) ( not ( = ?auto_594562 ?auto_594565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594563 ?auto_594564 ?auto_594565 )
      ( MAKE-5CRATE-VERIFY ?auto_594560 ?auto_594561 ?auto_594562 ?auto_594563 ?auto_594564 ?auto_594565 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594605 - SURFACE
      ?auto_594606 - SURFACE
      ?auto_594607 - SURFACE
      ?auto_594608 - SURFACE
      ?auto_594609 - SURFACE
      ?auto_594610 - SURFACE
    )
    :vars
    (
      ?auto_594612 - HOIST
      ?auto_594614 - PLACE
      ?auto_594615 - TRUCK
      ?auto_594613 - PLACE
      ?auto_594611 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_594612 ?auto_594614 ) ( SURFACE-AT ?auto_594609 ?auto_594614 ) ( CLEAR ?auto_594609 ) ( IS-CRATE ?auto_594610 ) ( not ( = ?auto_594609 ?auto_594610 ) ) ( AVAILABLE ?auto_594612 ) ( ON ?auto_594609 ?auto_594608 ) ( not ( = ?auto_594608 ?auto_594609 ) ) ( not ( = ?auto_594608 ?auto_594610 ) ) ( TRUCK-AT ?auto_594615 ?auto_594613 ) ( not ( = ?auto_594613 ?auto_594614 ) ) ( HOIST-AT ?auto_594611 ?auto_594613 ) ( LIFTING ?auto_594611 ?auto_594610 ) ( not ( = ?auto_594612 ?auto_594611 ) ) ( ON ?auto_594606 ?auto_594605 ) ( ON ?auto_594607 ?auto_594606 ) ( ON ?auto_594608 ?auto_594607 ) ( not ( = ?auto_594605 ?auto_594606 ) ) ( not ( = ?auto_594605 ?auto_594607 ) ) ( not ( = ?auto_594605 ?auto_594608 ) ) ( not ( = ?auto_594605 ?auto_594609 ) ) ( not ( = ?auto_594605 ?auto_594610 ) ) ( not ( = ?auto_594606 ?auto_594607 ) ) ( not ( = ?auto_594606 ?auto_594608 ) ) ( not ( = ?auto_594606 ?auto_594609 ) ) ( not ( = ?auto_594606 ?auto_594610 ) ) ( not ( = ?auto_594607 ?auto_594608 ) ) ( not ( = ?auto_594607 ?auto_594609 ) ) ( not ( = ?auto_594607 ?auto_594610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594608 ?auto_594609 ?auto_594610 )
      ( MAKE-5CRATE-VERIFY ?auto_594605 ?auto_594606 ?auto_594607 ?auto_594608 ?auto_594609 ?auto_594610 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594655 - SURFACE
      ?auto_594656 - SURFACE
      ?auto_594657 - SURFACE
      ?auto_594658 - SURFACE
      ?auto_594659 - SURFACE
      ?auto_594660 - SURFACE
    )
    :vars
    (
      ?auto_594665 - HOIST
      ?auto_594661 - PLACE
      ?auto_594664 - TRUCK
      ?auto_594663 - PLACE
      ?auto_594666 - HOIST
      ?auto_594662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_594665 ?auto_594661 ) ( SURFACE-AT ?auto_594659 ?auto_594661 ) ( CLEAR ?auto_594659 ) ( IS-CRATE ?auto_594660 ) ( not ( = ?auto_594659 ?auto_594660 ) ) ( AVAILABLE ?auto_594665 ) ( ON ?auto_594659 ?auto_594658 ) ( not ( = ?auto_594658 ?auto_594659 ) ) ( not ( = ?auto_594658 ?auto_594660 ) ) ( TRUCK-AT ?auto_594664 ?auto_594663 ) ( not ( = ?auto_594663 ?auto_594661 ) ) ( HOIST-AT ?auto_594666 ?auto_594663 ) ( not ( = ?auto_594665 ?auto_594666 ) ) ( AVAILABLE ?auto_594666 ) ( SURFACE-AT ?auto_594660 ?auto_594663 ) ( ON ?auto_594660 ?auto_594662 ) ( CLEAR ?auto_594660 ) ( not ( = ?auto_594659 ?auto_594662 ) ) ( not ( = ?auto_594660 ?auto_594662 ) ) ( not ( = ?auto_594658 ?auto_594662 ) ) ( ON ?auto_594656 ?auto_594655 ) ( ON ?auto_594657 ?auto_594656 ) ( ON ?auto_594658 ?auto_594657 ) ( not ( = ?auto_594655 ?auto_594656 ) ) ( not ( = ?auto_594655 ?auto_594657 ) ) ( not ( = ?auto_594655 ?auto_594658 ) ) ( not ( = ?auto_594655 ?auto_594659 ) ) ( not ( = ?auto_594655 ?auto_594660 ) ) ( not ( = ?auto_594655 ?auto_594662 ) ) ( not ( = ?auto_594656 ?auto_594657 ) ) ( not ( = ?auto_594656 ?auto_594658 ) ) ( not ( = ?auto_594656 ?auto_594659 ) ) ( not ( = ?auto_594656 ?auto_594660 ) ) ( not ( = ?auto_594656 ?auto_594662 ) ) ( not ( = ?auto_594657 ?auto_594658 ) ) ( not ( = ?auto_594657 ?auto_594659 ) ) ( not ( = ?auto_594657 ?auto_594660 ) ) ( not ( = ?auto_594657 ?auto_594662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594658 ?auto_594659 ?auto_594660 )
      ( MAKE-5CRATE-VERIFY ?auto_594655 ?auto_594656 ?auto_594657 ?auto_594658 ?auto_594659 ?auto_594660 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594706 - SURFACE
      ?auto_594707 - SURFACE
      ?auto_594708 - SURFACE
      ?auto_594709 - SURFACE
      ?auto_594710 - SURFACE
      ?auto_594711 - SURFACE
    )
    :vars
    (
      ?auto_594712 - HOIST
      ?auto_594717 - PLACE
      ?auto_594714 - PLACE
      ?auto_594715 - HOIST
      ?auto_594716 - SURFACE
      ?auto_594713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594712 ?auto_594717 ) ( SURFACE-AT ?auto_594710 ?auto_594717 ) ( CLEAR ?auto_594710 ) ( IS-CRATE ?auto_594711 ) ( not ( = ?auto_594710 ?auto_594711 ) ) ( AVAILABLE ?auto_594712 ) ( ON ?auto_594710 ?auto_594709 ) ( not ( = ?auto_594709 ?auto_594710 ) ) ( not ( = ?auto_594709 ?auto_594711 ) ) ( not ( = ?auto_594714 ?auto_594717 ) ) ( HOIST-AT ?auto_594715 ?auto_594714 ) ( not ( = ?auto_594712 ?auto_594715 ) ) ( AVAILABLE ?auto_594715 ) ( SURFACE-AT ?auto_594711 ?auto_594714 ) ( ON ?auto_594711 ?auto_594716 ) ( CLEAR ?auto_594711 ) ( not ( = ?auto_594710 ?auto_594716 ) ) ( not ( = ?auto_594711 ?auto_594716 ) ) ( not ( = ?auto_594709 ?auto_594716 ) ) ( TRUCK-AT ?auto_594713 ?auto_594717 ) ( ON ?auto_594707 ?auto_594706 ) ( ON ?auto_594708 ?auto_594707 ) ( ON ?auto_594709 ?auto_594708 ) ( not ( = ?auto_594706 ?auto_594707 ) ) ( not ( = ?auto_594706 ?auto_594708 ) ) ( not ( = ?auto_594706 ?auto_594709 ) ) ( not ( = ?auto_594706 ?auto_594710 ) ) ( not ( = ?auto_594706 ?auto_594711 ) ) ( not ( = ?auto_594706 ?auto_594716 ) ) ( not ( = ?auto_594707 ?auto_594708 ) ) ( not ( = ?auto_594707 ?auto_594709 ) ) ( not ( = ?auto_594707 ?auto_594710 ) ) ( not ( = ?auto_594707 ?auto_594711 ) ) ( not ( = ?auto_594707 ?auto_594716 ) ) ( not ( = ?auto_594708 ?auto_594709 ) ) ( not ( = ?auto_594708 ?auto_594710 ) ) ( not ( = ?auto_594708 ?auto_594711 ) ) ( not ( = ?auto_594708 ?auto_594716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594709 ?auto_594710 ?auto_594711 )
      ( MAKE-5CRATE-VERIFY ?auto_594706 ?auto_594707 ?auto_594708 ?auto_594709 ?auto_594710 ?auto_594711 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594757 - SURFACE
      ?auto_594758 - SURFACE
      ?auto_594759 - SURFACE
      ?auto_594760 - SURFACE
      ?auto_594761 - SURFACE
      ?auto_594762 - SURFACE
    )
    :vars
    (
      ?auto_594764 - HOIST
      ?auto_594767 - PLACE
      ?auto_594765 - PLACE
      ?auto_594763 - HOIST
      ?auto_594766 - SURFACE
      ?auto_594768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594764 ?auto_594767 ) ( IS-CRATE ?auto_594762 ) ( not ( = ?auto_594761 ?auto_594762 ) ) ( not ( = ?auto_594760 ?auto_594761 ) ) ( not ( = ?auto_594760 ?auto_594762 ) ) ( not ( = ?auto_594765 ?auto_594767 ) ) ( HOIST-AT ?auto_594763 ?auto_594765 ) ( not ( = ?auto_594764 ?auto_594763 ) ) ( AVAILABLE ?auto_594763 ) ( SURFACE-AT ?auto_594762 ?auto_594765 ) ( ON ?auto_594762 ?auto_594766 ) ( CLEAR ?auto_594762 ) ( not ( = ?auto_594761 ?auto_594766 ) ) ( not ( = ?auto_594762 ?auto_594766 ) ) ( not ( = ?auto_594760 ?auto_594766 ) ) ( TRUCK-AT ?auto_594768 ?auto_594767 ) ( SURFACE-AT ?auto_594760 ?auto_594767 ) ( CLEAR ?auto_594760 ) ( LIFTING ?auto_594764 ?auto_594761 ) ( IS-CRATE ?auto_594761 ) ( ON ?auto_594758 ?auto_594757 ) ( ON ?auto_594759 ?auto_594758 ) ( ON ?auto_594760 ?auto_594759 ) ( not ( = ?auto_594757 ?auto_594758 ) ) ( not ( = ?auto_594757 ?auto_594759 ) ) ( not ( = ?auto_594757 ?auto_594760 ) ) ( not ( = ?auto_594757 ?auto_594761 ) ) ( not ( = ?auto_594757 ?auto_594762 ) ) ( not ( = ?auto_594757 ?auto_594766 ) ) ( not ( = ?auto_594758 ?auto_594759 ) ) ( not ( = ?auto_594758 ?auto_594760 ) ) ( not ( = ?auto_594758 ?auto_594761 ) ) ( not ( = ?auto_594758 ?auto_594762 ) ) ( not ( = ?auto_594758 ?auto_594766 ) ) ( not ( = ?auto_594759 ?auto_594760 ) ) ( not ( = ?auto_594759 ?auto_594761 ) ) ( not ( = ?auto_594759 ?auto_594762 ) ) ( not ( = ?auto_594759 ?auto_594766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594760 ?auto_594761 ?auto_594762 )
      ( MAKE-5CRATE-VERIFY ?auto_594757 ?auto_594758 ?auto_594759 ?auto_594760 ?auto_594761 ?auto_594762 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_594808 - SURFACE
      ?auto_594809 - SURFACE
      ?auto_594810 - SURFACE
      ?auto_594811 - SURFACE
      ?auto_594812 - SURFACE
      ?auto_594813 - SURFACE
    )
    :vars
    (
      ?auto_594815 - HOIST
      ?auto_594814 - PLACE
      ?auto_594818 - PLACE
      ?auto_594819 - HOIST
      ?auto_594817 - SURFACE
      ?auto_594816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_594815 ?auto_594814 ) ( IS-CRATE ?auto_594813 ) ( not ( = ?auto_594812 ?auto_594813 ) ) ( not ( = ?auto_594811 ?auto_594812 ) ) ( not ( = ?auto_594811 ?auto_594813 ) ) ( not ( = ?auto_594818 ?auto_594814 ) ) ( HOIST-AT ?auto_594819 ?auto_594818 ) ( not ( = ?auto_594815 ?auto_594819 ) ) ( AVAILABLE ?auto_594819 ) ( SURFACE-AT ?auto_594813 ?auto_594818 ) ( ON ?auto_594813 ?auto_594817 ) ( CLEAR ?auto_594813 ) ( not ( = ?auto_594812 ?auto_594817 ) ) ( not ( = ?auto_594813 ?auto_594817 ) ) ( not ( = ?auto_594811 ?auto_594817 ) ) ( TRUCK-AT ?auto_594816 ?auto_594814 ) ( SURFACE-AT ?auto_594811 ?auto_594814 ) ( CLEAR ?auto_594811 ) ( IS-CRATE ?auto_594812 ) ( AVAILABLE ?auto_594815 ) ( IN ?auto_594812 ?auto_594816 ) ( ON ?auto_594809 ?auto_594808 ) ( ON ?auto_594810 ?auto_594809 ) ( ON ?auto_594811 ?auto_594810 ) ( not ( = ?auto_594808 ?auto_594809 ) ) ( not ( = ?auto_594808 ?auto_594810 ) ) ( not ( = ?auto_594808 ?auto_594811 ) ) ( not ( = ?auto_594808 ?auto_594812 ) ) ( not ( = ?auto_594808 ?auto_594813 ) ) ( not ( = ?auto_594808 ?auto_594817 ) ) ( not ( = ?auto_594809 ?auto_594810 ) ) ( not ( = ?auto_594809 ?auto_594811 ) ) ( not ( = ?auto_594809 ?auto_594812 ) ) ( not ( = ?auto_594809 ?auto_594813 ) ) ( not ( = ?auto_594809 ?auto_594817 ) ) ( not ( = ?auto_594810 ?auto_594811 ) ) ( not ( = ?auto_594810 ?auto_594812 ) ) ( not ( = ?auto_594810 ?auto_594813 ) ) ( not ( = ?auto_594810 ?auto_594817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_594811 ?auto_594812 ?auto_594813 )
      ( MAKE-5CRATE-VERIFY ?auto_594808 ?auto_594809 ?auto_594810 ?auto_594811 ?auto_594812 ?auto_594813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_595796 - SURFACE
      ?auto_595797 - SURFACE
    )
    :vars
    (
      ?auto_595798 - HOIST
      ?auto_595802 - PLACE
      ?auto_595800 - SURFACE
      ?auto_595801 - PLACE
      ?auto_595799 - HOIST
      ?auto_595803 - SURFACE
      ?auto_595804 - TRUCK
      ?auto_595805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_595798 ?auto_595802 ) ( SURFACE-AT ?auto_595796 ?auto_595802 ) ( CLEAR ?auto_595796 ) ( IS-CRATE ?auto_595797 ) ( not ( = ?auto_595796 ?auto_595797 ) ) ( ON ?auto_595796 ?auto_595800 ) ( not ( = ?auto_595800 ?auto_595796 ) ) ( not ( = ?auto_595800 ?auto_595797 ) ) ( not ( = ?auto_595801 ?auto_595802 ) ) ( HOIST-AT ?auto_595799 ?auto_595801 ) ( not ( = ?auto_595798 ?auto_595799 ) ) ( AVAILABLE ?auto_595799 ) ( SURFACE-AT ?auto_595797 ?auto_595801 ) ( ON ?auto_595797 ?auto_595803 ) ( CLEAR ?auto_595797 ) ( not ( = ?auto_595796 ?auto_595803 ) ) ( not ( = ?auto_595797 ?auto_595803 ) ) ( not ( = ?auto_595800 ?auto_595803 ) ) ( TRUCK-AT ?auto_595804 ?auto_595802 ) ( LIFTING ?auto_595798 ?auto_595805 ) ( IS-CRATE ?auto_595805 ) ( not ( = ?auto_595796 ?auto_595805 ) ) ( not ( = ?auto_595797 ?auto_595805 ) ) ( not ( = ?auto_595800 ?auto_595805 ) ) ( not ( = ?auto_595803 ?auto_595805 ) ) )
    :subtasks
    ( ( !LOAD ?auto_595798 ?auto_595805 ?auto_595804 ?auto_595802 )
      ( MAKE-1CRATE ?auto_595796 ?auto_595797 )
      ( MAKE-1CRATE-VERIFY ?auto_595796 ?auto_595797 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596011 - SURFACE
      ?auto_596012 - SURFACE
      ?auto_596013 - SURFACE
      ?auto_596014 - SURFACE
      ?auto_596015 - SURFACE
      ?auto_596016 - SURFACE
      ?auto_596017 - SURFACE
    )
    :vars
    (
      ?auto_596019 - HOIST
      ?auto_596018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_596019 ?auto_596018 ) ( SURFACE-AT ?auto_596016 ?auto_596018 ) ( CLEAR ?auto_596016 ) ( LIFTING ?auto_596019 ?auto_596017 ) ( IS-CRATE ?auto_596017 ) ( not ( = ?auto_596016 ?auto_596017 ) ) ( ON ?auto_596012 ?auto_596011 ) ( ON ?auto_596013 ?auto_596012 ) ( ON ?auto_596014 ?auto_596013 ) ( ON ?auto_596015 ?auto_596014 ) ( ON ?auto_596016 ?auto_596015 ) ( not ( = ?auto_596011 ?auto_596012 ) ) ( not ( = ?auto_596011 ?auto_596013 ) ) ( not ( = ?auto_596011 ?auto_596014 ) ) ( not ( = ?auto_596011 ?auto_596015 ) ) ( not ( = ?auto_596011 ?auto_596016 ) ) ( not ( = ?auto_596011 ?auto_596017 ) ) ( not ( = ?auto_596012 ?auto_596013 ) ) ( not ( = ?auto_596012 ?auto_596014 ) ) ( not ( = ?auto_596012 ?auto_596015 ) ) ( not ( = ?auto_596012 ?auto_596016 ) ) ( not ( = ?auto_596012 ?auto_596017 ) ) ( not ( = ?auto_596013 ?auto_596014 ) ) ( not ( = ?auto_596013 ?auto_596015 ) ) ( not ( = ?auto_596013 ?auto_596016 ) ) ( not ( = ?auto_596013 ?auto_596017 ) ) ( not ( = ?auto_596014 ?auto_596015 ) ) ( not ( = ?auto_596014 ?auto_596016 ) ) ( not ( = ?auto_596014 ?auto_596017 ) ) ( not ( = ?auto_596015 ?auto_596016 ) ) ( not ( = ?auto_596015 ?auto_596017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_596016 ?auto_596017 )
      ( MAKE-6CRATE-VERIFY ?auto_596011 ?auto_596012 ?auto_596013 ?auto_596014 ?auto_596015 ?auto_596016 ?auto_596017 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596055 - SURFACE
      ?auto_596056 - SURFACE
      ?auto_596057 - SURFACE
      ?auto_596058 - SURFACE
      ?auto_596059 - SURFACE
      ?auto_596060 - SURFACE
      ?auto_596061 - SURFACE
    )
    :vars
    (
      ?auto_596063 - HOIST
      ?auto_596062 - PLACE
      ?auto_596064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596063 ?auto_596062 ) ( SURFACE-AT ?auto_596060 ?auto_596062 ) ( CLEAR ?auto_596060 ) ( IS-CRATE ?auto_596061 ) ( not ( = ?auto_596060 ?auto_596061 ) ) ( TRUCK-AT ?auto_596064 ?auto_596062 ) ( AVAILABLE ?auto_596063 ) ( IN ?auto_596061 ?auto_596064 ) ( ON ?auto_596060 ?auto_596059 ) ( not ( = ?auto_596059 ?auto_596060 ) ) ( not ( = ?auto_596059 ?auto_596061 ) ) ( ON ?auto_596056 ?auto_596055 ) ( ON ?auto_596057 ?auto_596056 ) ( ON ?auto_596058 ?auto_596057 ) ( ON ?auto_596059 ?auto_596058 ) ( not ( = ?auto_596055 ?auto_596056 ) ) ( not ( = ?auto_596055 ?auto_596057 ) ) ( not ( = ?auto_596055 ?auto_596058 ) ) ( not ( = ?auto_596055 ?auto_596059 ) ) ( not ( = ?auto_596055 ?auto_596060 ) ) ( not ( = ?auto_596055 ?auto_596061 ) ) ( not ( = ?auto_596056 ?auto_596057 ) ) ( not ( = ?auto_596056 ?auto_596058 ) ) ( not ( = ?auto_596056 ?auto_596059 ) ) ( not ( = ?auto_596056 ?auto_596060 ) ) ( not ( = ?auto_596056 ?auto_596061 ) ) ( not ( = ?auto_596057 ?auto_596058 ) ) ( not ( = ?auto_596057 ?auto_596059 ) ) ( not ( = ?auto_596057 ?auto_596060 ) ) ( not ( = ?auto_596057 ?auto_596061 ) ) ( not ( = ?auto_596058 ?auto_596059 ) ) ( not ( = ?auto_596058 ?auto_596060 ) ) ( not ( = ?auto_596058 ?auto_596061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596059 ?auto_596060 ?auto_596061 )
      ( MAKE-6CRATE-VERIFY ?auto_596055 ?auto_596056 ?auto_596057 ?auto_596058 ?auto_596059 ?auto_596060 ?auto_596061 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596106 - SURFACE
      ?auto_596107 - SURFACE
      ?auto_596108 - SURFACE
      ?auto_596109 - SURFACE
      ?auto_596110 - SURFACE
      ?auto_596111 - SURFACE
      ?auto_596112 - SURFACE
    )
    :vars
    (
      ?auto_596115 - HOIST
      ?auto_596116 - PLACE
      ?auto_596113 - TRUCK
      ?auto_596114 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_596115 ?auto_596116 ) ( SURFACE-AT ?auto_596111 ?auto_596116 ) ( CLEAR ?auto_596111 ) ( IS-CRATE ?auto_596112 ) ( not ( = ?auto_596111 ?auto_596112 ) ) ( AVAILABLE ?auto_596115 ) ( IN ?auto_596112 ?auto_596113 ) ( ON ?auto_596111 ?auto_596110 ) ( not ( = ?auto_596110 ?auto_596111 ) ) ( not ( = ?auto_596110 ?auto_596112 ) ) ( TRUCK-AT ?auto_596113 ?auto_596114 ) ( not ( = ?auto_596114 ?auto_596116 ) ) ( ON ?auto_596107 ?auto_596106 ) ( ON ?auto_596108 ?auto_596107 ) ( ON ?auto_596109 ?auto_596108 ) ( ON ?auto_596110 ?auto_596109 ) ( not ( = ?auto_596106 ?auto_596107 ) ) ( not ( = ?auto_596106 ?auto_596108 ) ) ( not ( = ?auto_596106 ?auto_596109 ) ) ( not ( = ?auto_596106 ?auto_596110 ) ) ( not ( = ?auto_596106 ?auto_596111 ) ) ( not ( = ?auto_596106 ?auto_596112 ) ) ( not ( = ?auto_596107 ?auto_596108 ) ) ( not ( = ?auto_596107 ?auto_596109 ) ) ( not ( = ?auto_596107 ?auto_596110 ) ) ( not ( = ?auto_596107 ?auto_596111 ) ) ( not ( = ?auto_596107 ?auto_596112 ) ) ( not ( = ?auto_596108 ?auto_596109 ) ) ( not ( = ?auto_596108 ?auto_596110 ) ) ( not ( = ?auto_596108 ?auto_596111 ) ) ( not ( = ?auto_596108 ?auto_596112 ) ) ( not ( = ?auto_596109 ?auto_596110 ) ) ( not ( = ?auto_596109 ?auto_596111 ) ) ( not ( = ?auto_596109 ?auto_596112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596110 ?auto_596111 ?auto_596112 )
      ( MAKE-6CRATE-VERIFY ?auto_596106 ?auto_596107 ?auto_596108 ?auto_596109 ?auto_596110 ?auto_596111 ?auto_596112 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596163 - SURFACE
      ?auto_596164 - SURFACE
      ?auto_596165 - SURFACE
      ?auto_596166 - SURFACE
      ?auto_596167 - SURFACE
      ?auto_596168 - SURFACE
      ?auto_596169 - SURFACE
    )
    :vars
    (
      ?auto_596172 - HOIST
      ?auto_596173 - PLACE
      ?auto_596174 - TRUCK
      ?auto_596170 - PLACE
      ?auto_596171 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_596172 ?auto_596173 ) ( SURFACE-AT ?auto_596168 ?auto_596173 ) ( CLEAR ?auto_596168 ) ( IS-CRATE ?auto_596169 ) ( not ( = ?auto_596168 ?auto_596169 ) ) ( AVAILABLE ?auto_596172 ) ( ON ?auto_596168 ?auto_596167 ) ( not ( = ?auto_596167 ?auto_596168 ) ) ( not ( = ?auto_596167 ?auto_596169 ) ) ( TRUCK-AT ?auto_596174 ?auto_596170 ) ( not ( = ?auto_596170 ?auto_596173 ) ) ( HOIST-AT ?auto_596171 ?auto_596170 ) ( LIFTING ?auto_596171 ?auto_596169 ) ( not ( = ?auto_596172 ?auto_596171 ) ) ( ON ?auto_596164 ?auto_596163 ) ( ON ?auto_596165 ?auto_596164 ) ( ON ?auto_596166 ?auto_596165 ) ( ON ?auto_596167 ?auto_596166 ) ( not ( = ?auto_596163 ?auto_596164 ) ) ( not ( = ?auto_596163 ?auto_596165 ) ) ( not ( = ?auto_596163 ?auto_596166 ) ) ( not ( = ?auto_596163 ?auto_596167 ) ) ( not ( = ?auto_596163 ?auto_596168 ) ) ( not ( = ?auto_596163 ?auto_596169 ) ) ( not ( = ?auto_596164 ?auto_596165 ) ) ( not ( = ?auto_596164 ?auto_596166 ) ) ( not ( = ?auto_596164 ?auto_596167 ) ) ( not ( = ?auto_596164 ?auto_596168 ) ) ( not ( = ?auto_596164 ?auto_596169 ) ) ( not ( = ?auto_596165 ?auto_596166 ) ) ( not ( = ?auto_596165 ?auto_596167 ) ) ( not ( = ?auto_596165 ?auto_596168 ) ) ( not ( = ?auto_596165 ?auto_596169 ) ) ( not ( = ?auto_596166 ?auto_596167 ) ) ( not ( = ?auto_596166 ?auto_596168 ) ) ( not ( = ?auto_596166 ?auto_596169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596167 ?auto_596168 ?auto_596169 )
      ( MAKE-6CRATE-VERIFY ?auto_596163 ?auto_596164 ?auto_596165 ?auto_596166 ?auto_596167 ?auto_596168 ?auto_596169 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596226 - SURFACE
      ?auto_596227 - SURFACE
      ?auto_596228 - SURFACE
      ?auto_596229 - SURFACE
      ?auto_596230 - SURFACE
      ?auto_596231 - SURFACE
      ?auto_596232 - SURFACE
    )
    :vars
    (
      ?auto_596233 - HOIST
      ?auto_596237 - PLACE
      ?auto_596235 - TRUCK
      ?auto_596238 - PLACE
      ?auto_596236 - HOIST
      ?auto_596234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_596233 ?auto_596237 ) ( SURFACE-AT ?auto_596231 ?auto_596237 ) ( CLEAR ?auto_596231 ) ( IS-CRATE ?auto_596232 ) ( not ( = ?auto_596231 ?auto_596232 ) ) ( AVAILABLE ?auto_596233 ) ( ON ?auto_596231 ?auto_596230 ) ( not ( = ?auto_596230 ?auto_596231 ) ) ( not ( = ?auto_596230 ?auto_596232 ) ) ( TRUCK-AT ?auto_596235 ?auto_596238 ) ( not ( = ?auto_596238 ?auto_596237 ) ) ( HOIST-AT ?auto_596236 ?auto_596238 ) ( not ( = ?auto_596233 ?auto_596236 ) ) ( AVAILABLE ?auto_596236 ) ( SURFACE-AT ?auto_596232 ?auto_596238 ) ( ON ?auto_596232 ?auto_596234 ) ( CLEAR ?auto_596232 ) ( not ( = ?auto_596231 ?auto_596234 ) ) ( not ( = ?auto_596232 ?auto_596234 ) ) ( not ( = ?auto_596230 ?auto_596234 ) ) ( ON ?auto_596227 ?auto_596226 ) ( ON ?auto_596228 ?auto_596227 ) ( ON ?auto_596229 ?auto_596228 ) ( ON ?auto_596230 ?auto_596229 ) ( not ( = ?auto_596226 ?auto_596227 ) ) ( not ( = ?auto_596226 ?auto_596228 ) ) ( not ( = ?auto_596226 ?auto_596229 ) ) ( not ( = ?auto_596226 ?auto_596230 ) ) ( not ( = ?auto_596226 ?auto_596231 ) ) ( not ( = ?auto_596226 ?auto_596232 ) ) ( not ( = ?auto_596226 ?auto_596234 ) ) ( not ( = ?auto_596227 ?auto_596228 ) ) ( not ( = ?auto_596227 ?auto_596229 ) ) ( not ( = ?auto_596227 ?auto_596230 ) ) ( not ( = ?auto_596227 ?auto_596231 ) ) ( not ( = ?auto_596227 ?auto_596232 ) ) ( not ( = ?auto_596227 ?auto_596234 ) ) ( not ( = ?auto_596228 ?auto_596229 ) ) ( not ( = ?auto_596228 ?auto_596230 ) ) ( not ( = ?auto_596228 ?auto_596231 ) ) ( not ( = ?auto_596228 ?auto_596232 ) ) ( not ( = ?auto_596228 ?auto_596234 ) ) ( not ( = ?auto_596229 ?auto_596230 ) ) ( not ( = ?auto_596229 ?auto_596231 ) ) ( not ( = ?auto_596229 ?auto_596232 ) ) ( not ( = ?auto_596229 ?auto_596234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596230 ?auto_596231 ?auto_596232 )
      ( MAKE-6CRATE-VERIFY ?auto_596226 ?auto_596227 ?auto_596228 ?auto_596229 ?auto_596230 ?auto_596231 ?auto_596232 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596290 - SURFACE
      ?auto_596291 - SURFACE
      ?auto_596292 - SURFACE
      ?auto_596293 - SURFACE
      ?auto_596294 - SURFACE
      ?auto_596295 - SURFACE
      ?auto_596296 - SURFACE
    )
    :vars
    (
      ?auto_596302 - HOIST
      ?auto_596297 - PLACE
      ?auto_596298 - PLACE
      ?auto_596300 - HOIST
      ?auto_596301 - SURFACE
      ?auto_596299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596302 ?auto_596297 ) ( SURFACE-AT ?auto_596295 ?auto_596297 ) ( CLEAR ?auto_596295 ) ( IS-CRATE ?auto_596296 ) ( not ( = ?auto_596295 ?auto_596296 ) ) ( AVAILABLE ?auto_596302 ) ( ON ?auto_596295 ?auto_596294 ) ( not ( = ?auto_596294 ?auto_596295 ) ) ( not ( = ?auto_596294 ?auto_596296 ) ) ( not ( = ?auto_596298 ?auto_596297 ) ) ( HOIST-AT ?auto_596300 ?auto_596298 ) ( not ( = ?auto_596302 ?auto_596300 ) ) ( AVAILABLE ?auto_596300 ) ( SURFACE-AT ?auto_596296 ?auto_596298 ) ( ON ?auto_596296 ?auto_596301 ) ( CLEAR ?auto_596296 ) ( not ( = ?auto_596295 ?auto_596301 ) ) ( not ( = ?auto_596296 ?auto_596301 ) ) ( not ( = ?auto_596294 ?auto_596301 ) ) ( TRUCK-AT ?auto_596299 ?auto_596297 ) ( ON ?auto_596291 ?auto_596290 ) ( ON ?auto_596292 ?auto_596291 ) ( ON ?auto_596293 ?auto_596292 ) ( ON ?auto_596294 ?auto_596293 ) ( not ( = ?auto_596290 ?auto_596291 ) ) ( not ( = ?auto_596290 ?auto_596292 ) ) ( not ( = ?auto_596290 ?auto_596293 ) ) ( not ( = ?auto_596290 ?auto_596294 ) ) ( not ( = ?auto_596290 ?auto_596295 ) ) ( not ( = ?auto_596290 ?auto_596296 ) ) ( not ( = ?auto_596290 ?auto_596301 ) ) ( not ( = ?auto_596291 ?auto_596292 ) ) ( not ( = ?auto_596291 ?auto_596293 ) ) ( not ( = ?auto_596291 ?auto_596294 ) ) ( not ( = ?auto_596291 ?auto_596295 ) ) ( not ( = ?auto_596291 ?auto_596296 ) ) ( not ( = ?auto_596291 ?auto_596301 ) ) ( not ( = ?auto_596292 ?auto_596293 ) ) ( not ( = ?auto_596292 ?auto_596294 ) ) ( not ( = ?auto_596292 ?auto_596295 ) ) ( not ( = ?auto_596292 ?auto_596296 ) ) ( not ( = ?auto_596292 ?auto_596301 ) ) ( not ( = ?auto_596293 ?auto_596294 ) ) ( not ( = ?auto_596293 ?auto_596295 ) ) ( not ( = ?auto_596293 ?auto_596296 ) ) ( not ( = ?auto_596293 ?auto_596301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596294 ?auto_596295 ?auto_596296 )
      ( MAKE-6CRATE-VERIFY ?auto_596290 ?auto_596291 ?auto_596292 ?auto_596293 ?auto_596294 ?auto_596295 ?auto_596296 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596354 - SURFACE
      ?auto_596355 - SURFACE
      ?auto_596356 - SURFACE
      ?auto_596357 - SURFACE
      ?auto_596358 - SURFACE
      ?auto_596359 - SURFACE
      ?auto_596360 - SURFACE
    )
    :vars
    (
      ?auto_596365 - HOIST
      ?auto_596362 - PLACE
      ?auto_596363 - PLACE
      ?auto_596364 - HOIST
      ?auto_596361 - SURFACE
      ?auto_596366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596365 ?auto_596362 ) ( IS-CRATE ?auto_596360 ) ( not ( = ?auto_596359 ?auto_596360 ) ) ( not ( = ?auto_596358 ?auto_596359 ) ) ( not ( = ?auto_596358 ?auto_596360 ) ) ( not ( = ?auto_596363 ?auto_596362 ) ) ( HOIST-AT ?auto_596364 ?auto_596363 ) ( not ( = ?auto_596365 ?auto_596364 ) ) ( AVAILABLE ?auto_596364 ) ( SURFACE-AT ?auto_596360 ?auto_596363 ) ( ON ?auto_596360 ?auto_596361 ) ( CLEAR ?auto_596360 ) ( not ( = ?auto_596359 ?auto_596361 ) ) ( not ( = ?auto_596360 ?auto_596361 ) ) ( not ( = ?auto_596358 ?auto_596361 ) ) ( TRUCK-AT ?auto_596366 ?auto_596362 ) ( SURFACE-AT ?auto_596358 ?auto_596362 ) ( CLEAR ?auto_596358 ) ( LIFTING ?auto_596365 ?auto_596359 ) ( IS-CRATE ?auto_596359 ) ( ON ?auto_596355 ?auto_596354 ) ( ON ?auto_596356 ?auto_596355 ) ( ON ?auto_596357 ?auto_596356 ) ( ON ?auto_596358 ?auto_596357 ) ( not ( = ?auto_596354 ?auto_596355 ) ) ( not ( = ?auto_596354 ?auto_596356 ) ) ( not ( = ?auto_596354 ?auto_596357 ) ) ( not ( = ?auto_596354 ?auto_596358 ) ) ( not ( = ?auto_596354 ?auto_596359 ) ) ( not ( = ?auto_596354 ?auto_596360 ) ) ( not ( = ?auto_596354 ?auto_596361 ) ) ( not ( = ?auto_596355 ?auto_596356 ) ) ( not ( = ?auto_596355 ?auto_596357 ) ) ( not ( = ?auto_596355 ?auto_596358 ) ) ( not ( = ?auto_596355 ?auto_596359 ) ) ( not ( = ?auto_596355 ?auto_596360 ) ) ( not ( = ?auto_596355 ?auto_596361 ) ) ( not ( = ?auto_596356 ?auto_596357 ) ) ( not ( = ?auto_596356 ?auto_596358 ) ) ( not ( = ?auto_596356 ?auto_596359 ) ) ( not ( = ?auto_596356 ?auto_596360 ) ) ( not ( = ?auto_596356 ?auto_596361 ) ) ( not ( = ?auto_596357 ?auto_596358 ) ) ( not ( = ?auto_596357 ?auto_596359 ) ) ( not ( = ?auto_596357 ?auto_596360 ) ) ( not ( = ?auto_596357 ?auto_596361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596358 ?auto_596359 ?auto_596360 )
      ( MAKE-6CRATE-VERIFY ?auto_596354 ?auto_596355 ?auto_596356 ?auto_596357 ?auto_596358 ?auto_596359 ?auto_596360 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_596418 - SURFACE
      ?auto_596419 - SURFACE
      ?auto_596420 - SURFACE
      ?auto_596421 - SURFACE
      ?auto_596422 - SURFACE
      ?auto_596423 - SURFACE
      ?auto_596424 - SURFACE
    )
    :vars
    (
      ?auto_596429 - HOIST
      ?auto_596425 - PLACE
      ?auto_596427 - PLACE
      ?auto_596426 - HOIST
      ?auto_596428 - SURFACE
      ?auto_596430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_596429 ?auto_596425 ) ( IS-CRATE ?auto_596424 ) ( not ( = ?auto_596423 ?auto_596424 ) ) ( not ( = ?auto_596422 ?auto_596423 ) ) ( not ( = ?auto_596422 ?auto_596424 ) ) ( not ( = ?auto_596427 ?auto_596425 ) ) ( HOIST-AT ?auto_596426 ?auto_596427 ) ( not ( = ?auto_596429 ?auto_596426 ) ) ( AVAILABLE ?auto_596426 ) ( SURFACE-AT ?auto_596424 ?auto_596427 ) ( ON ?auto_596424 ?auto_596428 ) ( CLEAR ?auto_596424 ) ( not ( = ?auto_596423 ?auto_596428 ) ) ( not ( = ?auto_596424 ?auto_596428 ) ) ( not ( = ?auto_596422 ?auto_596428 ) ) ( TRUCK-AT ?auto_596430 ?auto_596425 ) ( SURFACE-AT ?auto_596422 ?auto_596425 ) ( CLEAR ?auto_596422 ) ( IS-CRATE ?auto_596423 ) ( AVAILABLE ?auto_596429 ) ( IN ?auto_596423 ?auto_596430 ) ( ON ?auto_596419 ?auto_596418 ) ( ON ?auto_596420 ?auto_596419 ) ( ON ?auto_596421 ?auto_596420 ) ( ON ?auto_596422 ?auto_596421 ) ( not ( = ?auto_596418 ?auto_596419 ) ) ( not ( = ?auto_596418 ?auto_596420 ) ) ( not ( = ?auto_596418 ?auto_596421 ) ) ( not ( = ?auto_596418 ?auto_596422 ) ) ( not ( = ?auto_596418 ?auto_596423 ) ) ( not ( = ?auto_596418 ?auto_596424 ) ) ( not ( = ?auto_596418 ?auto_596428 ) ) ( not ( = ?auto_596419 ?auto_596420 ) ) ( not ( = ?auto_596419 ?auto_596421 ) ) ( not ( = ?auto_596419 ?auto_596422 ) ) ( not ( = ?auto_596419 ?auto_596423 ) ) ( not ( = ?auto_596419 ?auto_596424 ) ) ( not ( = ?auto_596419 ?auto_596428 ) ) ( not ( = ?auto_596420 ?auto_596421 ) ) ( not ( = ?auto_596420 ?auto_596422 ) ) ( not ( = ?auto_596420 ?auto_596423 ) ) ( not ( = ?auto_596420 ?auto_596424 ) ) ( not ( = ?auto_596420 ?auto_596428 ) ) ( not ( = ?auto_596421 ?auto_596422 ) ) ( not ( = ?auto_596421 ?auto_596423 ) ) ( not ( = ?auto_596421 ?auto_596424 ) ) ( not ( = ?auto_596421 ?auto_596428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_596422 ?auto_596423 ?auto_596424 )
      ( MAKE-6CRATE-VERIFY ?auto_596418 ?auto_596419 ?auto_596420 ?auto_596421 ?auto_596422 ?auto_596423 ?auto_596424 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598368 - SURFACE
      ?auto_598369 - SURFACE
      ?auto_598370 - SURFACE
      ?auto_598371 - SURFACE
      ?auto_598372 - SURFACE
      ?auto_598373 - SURFACE
      ?auto_598374 - SURFACE
      ?auto_598375 - SURFACE
    )
    :vars
    (
      ?auto_598377 - HOIST
      ?auto_598376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598377 ?auto_598376 ) ( SURFACE-AT ?auto_598374 ?auto_598376 ) ( CLEAR ?auto_598374 ) ( LIFTING ?auto_598377 ?auto_598375 ) ( IS-CRATE ?auto_598375 ) ( not ( = ?auto_598374 ?auto_598375 ) ) ( ON ?auto_598369 ?auto_598368 ) ( ON ?auto_598370 ?auto_598369 ) ( ON ?auto_598371 ?auto_598370 ) ( ON ?auto_598372 ?auto_598371 ) ( ON ?auto_598373 ?auto_598372 ) ( ON ?auto_598374 ?auto_598373 ) ( not ( = ?auto_598368 ?auto_598369 ) ) ( not ( = ?auto_598368 ?auto_598370 ) ) ( not ( = ?auto_598368 ?auto_598371 ) ) ( not ( = ?auto_598368 ?auto_598372 ) ) ( not ( = ?auto_598368 ?auto_598373 ) ) ( not ( = ?auto_598368 ?auto_598374 ) ) ( not ( = ?auto_598368 ?auto_598375 ) ) ( not ( = ?auto_598369 ?auto_598370 ) ) ( not ( = ?auto_598369 ?auto_598371 ) ) ( not ( = ?auto_598369 ?auto_598372 ) ) ( not ( = ?auto_598369 ?auto_598373 ) ) ( not ( = ?auto_598369 ?auto_598374 ) ) ( not ( = ?auto_598369 ?auto_598375 ) ) ( not ( = ?auto_598370 ?auto_598371 ) ) ( not ( = ?auto_598370 ?auto_598372 ) ) ( not ( = ?auto_598370 ?auto_598373 ) ) ( not ( = ?auto_598370 ?auto_598374 ) ) ( not ( = ?auto_598370 ?auto_598375 ) ) ( not ( = ?auto_598371 ?auto_598372 ) ) ( not ( = ?auto_598371 ?auto_598373 ) ) ( not ( = ?auto_598371 ?auto_598374 ) ) ( not ( = ?auto_598371 ?auto_598375 ) ) ( not ( = ?auto_598372 ?auto_598373 ) ) ( not ( = ?auto_598372 ?auto_598374 ) ) ( not ( = ?auto_598372 ?auto_598375 ) ) ( not ( = ?auto_598373 ?auto_598374 ) ) ( not ( = ?auto_598373 ?auto_598375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_598374 ?auto_598375 )
      ( MAKE-7CRATE-VERIFY ?auto_598368 ?auto_598369 ?auto_598370 ?auto_598371 ?auto_598372 ?auto_598373 ?auto_598374 ?auto_598375 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598423 - SURFACE
      ?auto_598424 - SURFACE
      ?auto_598425 - SURFACE
      ?auto_598426 - SURFACE
      ?auto_598427 - SURFACE
      ?auto_598428 - SURFACE
      ?auto_598429 - SURFACE
      ?auto_598430 - SURFACE
    )
    :vars
    (
      ?auto_598433 - HOIST
      ?auto_598432 - PLACE
      ?auto_598431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598433 ?auto_598432 ) ( SURFACE-AT ?auto_598429 ?auto_598432 ) ( CLEAR ?auto_598429 ) ( IS-CRATE ?auto_598430 ) ( not ( = ?auto_598429 ?auto_598430 ) ) ( TRUCK-AT ?auto_598431 ?auto_598432 ) ( AVAILABLE ?auto_598433 ) ( IN ?auto_598430 ?auto_598431 ) ( ON ?auto_598429 ?auto_598428 ) ( not ( = ?auto_598428 ?auto_598429 ) ) ( not ( = ?auto_598428 ?auto_598430 ) ) ( ON ?auto_598424 ?auto_598423 ) ( ON ?auto_598425 ?auto_598424 ) ( ON ?auto_598426 ?auto_598425 ) ( ON ?auto_598427 ?auto_598426 ) ( ON ?auto_598428 ?auto_598427 ) ( not ( = ?auto_598423 ?auto_598424 ) ) ( not ( = ?auto_598423 ?auto_598425 ) ) ( not ( = ?auto_598423 ?auto_598426 ) ) ( not ( = ?auto_598423 ?auto_598427 ) ) ( not ( = ?auto_598423 ?auto_598428 ) ) ( not ( = ?auto_598423 ?auto_598429 ) ) ( not ( = ?auto_598423 ?auto_598430 ) ) ( not ( = ?auto_598424 ?auto_598425 ) ) ( not ( = ?auto_598424 ?auto_598426 ) ) ( not ( = ?auto_598424 ?auto_598427 ) ) ( not ( = ?auto_598424 ?auto_598428 ) ) ( not ( = ?auto_598424 ?auto_598429 ) ) ( not ( = ?auto_598424 ?auto_598430 ) ) ( not ( = ?auto_598425 ?auto_598426 ) ) ( not ( = ?auto_598425 ?auto_598427 ) ) ( not ( = ?auto_598425 ?auto_598428 ) ) ( not ( = ?auto_598425 ?auto_598429 ) ) ( not ( = ?auto_598425 ?auto_598430 ) ) ( not ( = ?auto_598426 ?auto_598427 ) ) ( not ( = ?auto_598426 ?auto_598428 ) ) ( not ( = ?auto_598426 ?auto_598429 ) ) ( not ( = ?auto_598426 ?auto_598430 ) ) ( not ( = ?auto_598427 ?auto_598428 ) ) ( not ( = ?auto_598427 ?auto_598429 ) ) ( not ( = ?auto_598427 ?auto_598430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598428 ?auto_598429 ?auto_598430 )
      ( MAKE-7CRATE-VERIFY ?auto_598423 ?auto_598424 ?auto_598425 ?auto_598426 ?auto_598427 ?auto_598428 ?auto_598429 ?auto_598430 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598486 - SURFACE
      ?auto_598487 - SURFACE
      ?auto_598488 - SURFACE
      ?auto_598489 - SURFACE
      ?auto_598490 - SURFACE
      ?auto_598491 - SURFACE
      ?auto_598492 - SURFACE
      ?auto_598493 - SURFACE
    )
    :vars
    (
      ?auto_598496 - HOIST
      ?auto_598497 - PLACE
      ?auto_598495 - TRUCK
      ?auto_598494 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598496 ?auto_598497 ) ( SURFACE-AT ?auto_598492 ?auto_598497 ) ( CLEAR ?auto_598492 ) ( IS-CRATE ?auto_598493 ) ( not ( = ?auto_598492 ?auto_598493 ) ) ( AVAILABLE ?auto_598496 ) ( IN ?auto_598493 ?auto_598495 ) ( ON ?auto_598492 ?auto_598491 ) ( not ( = ?auto_598491 ?auto_598492 ) ) ( not ( = ?auto_598491 ?auto_598493 ) ) ( TRUCK-AT ?auto_598495 ?auto_598494 ) ( not ( = ?auto_598494 ?auto_598497 ) ) ( ON ?auto_598487 ?auto_598486 ) ( ON ?auto_598488 ?auto_598487 ) ( ON ?auto_598489 ?auto_598488 ) ( ON ?auto_598490 ?auto_598489 ) ( ON ?auto_598491 ?auto_598490 ) ( not ( = ?auto_598486 ?auto_598487 ) ) ( not ( = ?auto_598486 ?auto_598488 ) ) ( not ( = ?auto_598486 ?auto_598489 ) ) ( not ( = ?auto_598486 ?auto_598490 ) ) ( not ( = ?auto_598486 ?auto_598491 ) ) ( not ( = ?auto_598486 ?auto_598492 ) ) ( not ( = ?auto_598486 ?auto_598493 ) ) ( not ( = ?auto_598487 ?auto_598488 ) ) ( not ( = ?auto_598487 ?auto_598489 ) ) ( not ( = ?auto_598487 ?auto_598490 ) ) ( not ( = ?auto_598487 ?auto_598491 ) ) ( not ( = ?auto_598487 ?auto_598492 ) ) ( not ( = ?auto_598487 ?auto_598493 ) ) ( not ( = ?auto_598488 ?auto_598489 ) ) ( not ( = ?auto_598488 ?auto_598490 ) ) ( not ( = ?auto_598488 ?auto_598491 ) ) ( not ( = ?auto_598488 ?auto_598492 ) ) ( not ( = ?auto_598488 ?auto_598493 ) ) ( not ( = ?auto_598489 ?auto_598490 ) ) ( not ( = ?auto_598489 ?auto_598491 ) ) ( not ( = ?auto_598489 ?auto_598492 ) ) ( not ( = ?auto_598489 ?auto_598493 ) ) ( not ( = ?auto_598490 ?auto_598491 ) ) ( not ( = ?auto_598490 ?auto_598492 ) ) ( not ( = ?auto_598490 ?auto_598493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598491 ?auto_598492 ?auto_598493 )
      ( MAKE-7CRATE-VERIFY ?auto_598486 ?auto_598487 ?auto_598488 ?auto_598489 ?auto_598490 ?auto_598491 ?auto_598492 ?auto_598493 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598556 - SURFACE
      ?auto_598557 - SURFACE
      ?auto_598558 - SURFACE
      ?auto_598559 - SURFACE
      ?auto_598560 - SURFACE
      ?auto_598561 - SURFACE
      ?auto_598562 - SURFACE
      ?auto_598563 - SURFACE
    )
    :vars
    (
      ?auto_598565 - HOIST
      ?auto_598566 - PLACE
      ?auto_598567 - TRUCK
      ?auto_598568 - PLACE
      ?auto_598564 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_598565 ?auto_598566 ) ( SURFACE-AT ?auto_598562 ?auto_598566 ) ( CLEAR ?auto_598562 ) ( IS-CRATE ?auto_598563 ) ( not ( = ?auto_598562 ?auto_598563 ) ) ( AVAILABLE ?auto_598565 ) ( ON ?auto_598562 ?auto_598561 ) ( not ( = ?auto_598561 ?auto_598562 ) ) ( not ( = ?auto_598561 ?auto_598563 ) ) ( TRUCK-AT ?auto_598567 ?auto_598568 ) ( not ( = ?auto_598568 ?auto_598566 ) ) ( HOIST-AT ?auto_598564 ?auto_598568 ) ( LIFTING ?auto_598564 ?auto_598563 ) ( not ( = ?auto_598565 ?auto_598564 ) ) ( ON ?auto_598557 ?auto_598556 ) ( ON ?auto_598558 ?auto_598557 ) ( ON ?auto_598559 ?auto_598558 ) ( ON ?auto_598560 ?auto_598559 ) ( ON ?auto_598561 ?auto_598560 ) ( not ( = ?auto_598556 ?auto_598557 ) ) ( not ( = ?auto_598556 ?auto_598558 ) ) ( not ( = ?auto_598556 ?auto_598559 ) ) ( not ( = ?auto_598556 ?auto_598560 ) ) ( not ( = ?auto_598556 ?auto_598561 ) ) ( not ( = ?auto_598556 ?auto_598562 ) ) ( not ( = ?auto_598556 ?auto_598563 ) ) ( not ( = ?auto_598557 ?auto_598558 ) ) ( not ( = ?auto_598557 ?auto_598559 ) ) ( not ( = ?auto_598557 ?auto_598560 ) ) ( not ( = ?auto_598557 ?auto_598561 ) ) ( not ( = ?auto_598557 ?auto_598562 ) ) ( not ( = ?auto_598557 ?auto_598563 ) ) ( not ( = ?auto_598558 ?auto_598559 ) ) ( not ( = ?auto_598558 ?auto_598560 ) ) ( not ( = ?auto_598558 ?auto_598561 ) ) ( not ( = ?auto_598558 ?auto_598562 ) ) ( not ( = ?auto_598558 ?auto_598563 ) ) ( not ( = ?auto_598559 ?auto_598560 ) ) ( not ( = ?auto_598559 ?auto_598561 ) ) ( not ( = ?auto_598559 ?auto_598562 ) ) ( not ( = ?auto_598559 ?auto_598563 ) ) ( not ( = ?auto_598560 ?auto_598561 ) ) ( not ( = ?auto_598560 ?auto_598562 ) ) ( not ( = ?auto_598560 ?auto_598563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598561 ?auto_598562 ?auto_598563 )
      ( MAKE-7CRATE-VERIFY ?auto_598556 ?auto_598557 ?auto_598558 ?auto_598559 ?auto_598560 ?auto_598561 ?auto_598562 ?auto_598563 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598633 - SURFACE
      ?auto_598634 - SURFACE
      ?auto_598635 - SURFACE
      ?auto_598636 - SURFACE
      ?auto_598637 - SURFACE
      ?auto_598638 - SURFACE
      ?auto_598639 - SURFACE
      ?auto_598640 - SURFACE
    )
    :vars
    (
      ?auto_598642 - HOIST
      ?auto_598645 - PLACE
      ?auto_598646 - TRUCK
      ?auto_598641 - PLACE
      ?auto_598643 - HOIST
      ?auto_598644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_598642 ?auto_598645 ) ( SURFACE-AT ?auto_598639 ?auto_598645 ) ( CLEAR ?auto_598639 ) ( IS-CRATE ?auto_598640 ) ( not ( = ?auto_598639 ?auto_598640 ) ) ( AVAILABLE ?auto_598642 ) ( ON ?auto_598639 ?auto_598638 ) ( not ( = ?auto_598638 ?auto_598639 ) ) ( not ( = ?auto_598638 ?auto_598640 ) ) ( TRUCK-AT ?auto_598646 ?auto_598641 ) ( not ( = ?auto_598641 ?auto_598645 ) ) ( HOIST-AT ?auto_598643 ?auto_598641 ) ( not ( = ?auto_598642 ?auto_598643 ) ) ( AVAILABLE ?auto_598643 ) ( SURFACE-AT ?auto_598640 ?auto_598641 ) ( ON ?auto_598640 ?auto_598644 ) ( CLEAR ?auto_598640 ) ( not ( = ?auto_598639 ?auto_598644 ) ) ( not ( = ?auto_598640 ?auto_598644 ) ) ( not ( = ?auto_598638 ?auto_598644 ) ) ( ON ?auto_598634 ?auto_598633 ) ( ON ?auto_598635 ?auto_598634 ) ( ON ?auto_598636 ?auto_598635 ) ( ON ?auto_598637 ?auto_598636 ) ( ON ?auto_598638 ?auto_598637 ) ( not ( = ?auto_598633 ?auto_598634 ) ) ( not ( = ?auto_598633 ?auto_598635 ) ) ( not ( = ?auto_598633 ?auto_598636 ) ) ( not ( = ?auto_598633 ?auto_598637 ) ) ( not ( = ?auto_598633 ?auto_598638 ) ) ( not ( = ?auto_598633 ?auto_598639 ) ) ( not ( = ?auto_598633 ?auto_598640 ) ) ( not ( = ?auto_598633 ?auto_598644 ) ) ( not ( = ?auto_598634 ?auto_598635 ) ) ( not ( = ?auto_598634 ?auto_598636 ) ) ( not ( = ?auto_598634 ?auto_598637 ) ) ( not ( = ?auto_598634 ?auto_598638 ) ) ( not ( = ?auto_598634 ?auto_598639 ) ) ( not ( = ?auto_598634 ?auto_598640 ) ) ( not ( = ?auto_598634 ?auto_598644 ) ) ( not ( = ?auto_598635 ?auto_598636 ) ) ( not ( = ?auto_598635 ?auto_598637 ) ) ( not ( = ?auto_598635 ?auto_598638 ) ) ( not ( = ?auto_598635 ?auto_598639 ) ) ( not ( = ?auto_598635 ?auto_598640 ) ) ( not ( = ?auto_598635 ?auto_598644 ) ) ( not ( = ?auto_598636 ?auto_598637 ) ) ( not ( = ?auto_598636 ?auto_598638 ) ) ( not ( = ?auto_598636 ?auto_598639 ) ) ( not ( = ?auto_598636 ?auto_598640 ) ) ( not ( = ?auto_598636 ?auto_598644 ) ) ( not ( = ?auto_598637 ?auto_598638 ) ) ( not ( = ?auto_598637 ?auto_598639 ) ) ( not ( = ?auto_598637 ?auto_598640 ) ) ( not ( = ?auto_598637 ?auto_598644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598638 ?auto_598639 ?auto_598640 )
      ( MAKE-7CRATE-VERIFY ?auto_598633 ?auto_598634 ?auto_598635 ?auto_598636 ?auto_598637 ?auto_598638 ?auto_598639 ?auto_598640 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598711 - SURFACE
      ?auto_598712 - SURFACE
      ?auto_598713 - SURFACE
      ?auto_598714 - SURFACE
      ?auto_598715 - SURFACE
      ?auto_598716 - SURFACE
      ?auto_598717 - SURFACE
      ?auto_598718 - SURFACE
    )
    :vars
    (
      ?auto_598723 - HOIST
      ?auto_598721 - PLACE
      ?auto_598720 - PLACE
      ?auto_598722 - HOIST
      ?auto_598719 - SURFACE
      ?auto_598724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598723 ?auto_598721 ) ( SURFACE-AT ?auto_598717 ?auto_598721 ) ( CLEAR ?auto_598717 ) ( IS-CRATE ?auto_598718 ) ( not ( = ?auto_598717 ?auto_598718 ) ) ( AVAILABLE ?auto_598723 ) ( ON ?auto_598717 ?auto_598716 ) ( not ( = ?auto_598716 ?auto_598717 ) ) ( not ( = ?auto_598716 ?auto_598718 ) ) ( not ( = ?auto_598720 ?auto_598721 ) ) ( HOIST-AT ?auto_598722 ?auto_598720 ) ( not ( = ?auto_598723 ?auto_598722 ) ) ( AVAILABLE ?auto_598722 ) ( SURFACE-AT ?auto_598718 ?auto_598720 ) ( ON ?auto_598718 ?auto_598719 ) ( CLEAR ?auto_598718 ) ( not ( = ?auto_598717 ?auto_598719 ) ) ( not ( = ?auto_598718 ?auto_598719 ) ) ( not ( = ?auto_598716 ?auto_598719 ) ) ( TRUCK-AT ?auto_598724 ?auto_598721 ) ( ON ?auto_598712 ?auto_598711 ) ( ON ?auto_598713 ?auto_598712 ) ( ON ?auto_598714 ?auto_598713 ) ( ON ?auto_598715 ?auto_598714 ) ( ON ?auto_598716 ?auto_598715 ) ( not ( = ?auto_598711 ?auto_598712 ) ) ( not ( = ?auto_598711 ?auto_598713 ) ) ( not ( = ?auto_598711 ?auto_598714 ) ) ( not ( = ?auto_598711 ?auto_598715 ) ) ( not ( = ?auto_598711 ?auto_598716 ) ) ( not ( = ?auto_598711 ?auto_598717 ) ) ( not ( = ?auto_598711 ?auto_598718 ) ) ( not ( = ?auto_598711 ?auto_598719 ) ) ( not ( = ?auto_598712 ?auto_598713 ) ) ( not ( = ?auto_598712 ?auto_598714 ) ) ( not ( = ?auto_598712 ?auto_598715 ) ) ( not ( = ?auto_598712 ?auto_598716 ) ) ( not ( = ?auto_598712 ?auto_598717 ) ) ( not ( = ?auto_598712 ?auto_598718 ) ) ( not ( = ?auto_598712 ?auto_598719 ) ) ( not ( = ?auto_598713 ?auto_598714 ) ) ( not ( = ?auto_598713 ?auto_598715 ) ) ( not ( = ?auto_598713 ?auto_598716 ) ) ( not ( = ?auto_598713 ?auto_598717 ) ) ( not ( = ?auto_598713 ?auto_598718 ) ) ( not ( = ?auto_598713 ?auto_598719 ) ) ( not ( = ?auto_598714 ?auto_598715 ) ) ( not ( = ?auto_598714 ?auto_598716 ) ) ( not ( = ?auto_598714 ?auto_598717 ) ) ( not ( = ?auto_598714 ?auto_598718 ) ) ( not ( = ?auto_598714 ?auto_598719 ) ) ( not ( = ?auto_598715 ?auto_598716 ) ) ( not ( = ?auto_598715 ?auto_598717 ) ) ( not ( = ?auto_598715 ?auto_598718 ) ) ( not ( = ?auto_598715 ?auto_598719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598716 ?auto_598717 ?auto_598718 )
      ( MAKE-7CRATE-VERIFY ?auto_598711 ?auto_598712 ?auto_598713 ?auto_598714 ?auto_598715 ?auto_598716 ?auto_598717 ?auto_598718 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598789 - SURFACE
      ?auto_598790 - SURFACE
      ?auto_598791 - SURFACE
      ?auto_598792 - SURFACE
      ?auto_598793 - SURFACE
      ?auto_598794 - SURFACE
      ?auto_598795 - SURFACE
      ?auto_598796 - SURFACE
    )
    :vars
    (
      ?auto_598800 - HOIST
      ?auto_598798 - PLACE
      ?auto_598801 - PLACE
      ?auto_598797 - HOIST
      ?auto_598802 - SURFACE
      ?auto_598799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598800 ?auto_598798 ) ( IS-CRATE ?auto_598796 ) ( not ( = ?auto_598795 ?auto_598796 ) ) ( not ( = ?auto_598794 ?auto_598795 ) ) ( not ( = ?auto_598794 ?auto_598796 ) ) ( not ( = ?auto_598801 ?auto_598798 ) ) ( HOIST-AT ?auto_598797 ?auto_598801 ) ( not ( = ?auto_598800 ?auto_598797 ) ) ( AVAILABLE ?auto_598797 ) ( SURFACE-AT ?auto_598796 ?auto_598801 ) ( ON ?auto_598796 ?auto_598802 ) ( CLEAR ?auto_598796 ) ( not ( = ?auto_598795 ?auto_598802 ) ) ( not ( = ?auto_598796 ?auto_598802 ) ) ( not ( = ?auto_598794 ?auto_598802 ) ) ( TRUCK-AT ?auto_598799 ?auto_598798 ) ( SURFACE-AT ?auto_598794 ?auto_598798 ) ( CLEAR ?auto_598794 ) ( LIFTING ?auto_598800 ?auto_598795 ) ( IS-CRATE ?auto_598795 ) ( ON ?auto_598790 ?auto_598789 ) ( ON ?auto_598791 ?auto_598790 ) ( ON ?auto_598792 ?auto_598791 ) ( ON ?auto_598793 ?auto_598792 ) ( ON ?auto_598794 ?auto_598793 ) ( not ( = ?auto_598789 ?auto_598790 ) ) ( not ( = ?auto_598789 ?auto_598791 ) ) ( not ( = ?auto_598789 ?auto_598792 ) ) ( not ( = ?auto_598789 ?auto_598793 ) ) ( not ( = ?auto_598789 ?auto_598794 ) ) ( not ( = ?auto_598789 ?auto_598795 ) ) ( not ( = ?auto_598789 ?auto_598796 ) ) ( not ( = ?auto_598789 ?auto_598802 ) ) ( not ( = ?auto_598790 ?auto_598791 ) ) ( not ( = ?auto_598790 ?auto_598792 ) ) ( not ( = ?auto_598790 ?auto_598793 ) ) ( not ( = ?auto_598790 ?auto_598794 ) ) ( not ( = ?auto_598790 ?auto_598795 ) ) ( not ( = ?auto_598790 ?auto_598796 ) ) ( not ( = ?auto_598790 ?auto_598802 ) ) ( not ( = ?auto_598791 ?auto_598792 ) ) ( not ( = ?auto_598791 ?auto_598793 ) ) ( not ( = ?auto_598791 ?auto_598794 ) ) ( not ( = ?auto_598791 ?auto_598795 ) ) ( not ( = ?auto_598791 ?auto_598796 ) ) ( not ( = ?auto_598791 ?auto_598802 ) ) ( not ( = ?auto_598792 ?auto_598793 ) ) ( not ( = ?auto_598792 ?auto_598794 ) ) ( not ( = ?auto_598792 ?auto_598795 ) ) ( not ( = ?auto_598792 ?auto_598796 ) ) ( not ( = ?auto_598792 ?auto_598802 ) ) ( not ( = ?auto_598793 ?auto_598794 ) ) ( not ( = ?auto_598793 ?auto_598795 ) ) ( not ( = ?auto_598793 ?auto_598796 ) ) ( not ( = ?auto_598793 ?auto_598802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598794 ?auto_598795 ?auto_598796 )
      ( MAKE-7CRATE-VERIFY ?auto_598789 ?auto_598790 ?auto_598791 ?auto_598792 ?auto_598793 ?auto_598794 ?auto_598795 ?auto_598796 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_598867 - SURFACE
      ?auto_598868 - SURFACE
      ?auto_598869 - SURFACE
      ?auto_598870 - SURFACE
      ?auto_598871 - SURFACE
      ?auto_598872 - SURFACE
      ?auto_598873 - SURFACE
      ?auto_598874 - SURFACE
    )
    :vars
    (
      ?auto_598877 - HOIST
      ?auto_598876 - PLACE
      ?auto_598875 - PLACE
      ?auto_598880 - HOIST
      ?auto_598878 - SURFACE
      ?auto_598879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_598877 ?auto_598876 ) ( IS-CRATE ?auto_598874 ) ( not ( = ?auto_598873 ?auto_598874 ) ) ( not ( = ?auto_598872 ?auto_598873 ) ) ( not ( = ?auto_598872 ?auto_598874 ) ) ( not ( = ?auto_598875 ?auto_598876 ) ) ( HOIST-AT ?auto_598880 ?auto_598875 ) ( not ( = ?auto_598877 ?auto_598880 ) ) ( AVAILABLE ?auto_598880 ) ( SURFACE-AT ?auto_598874 ?auto_598875 ) ( ON ?auto_598874 ?auto_598878 ) ( CLEAR ?auto_598874 ) ( not ( = ?auto_598873 ?auto_598878 ) ) ( not ( = ?auto_598874 ?auto_598878 ) ) ( not ( = ?auto_598872 ?auto_598878 ) ) ( TRUCK-AT ?auto_598879 ?auto_598876 ) ( SURFACE-AT ?auto_598872 ?auto_598876 ) ( CLEAR ?auto_598872 ) ( IS-CRATE ?auto_598873 ) ( AVAILABLE ?auto_598877 ) ( IN ?auto_598873 ?auto_598879 ) ( ON ?auto_598868 ?auto_598867 ) ( ON ?auto_598869 ?auto_598868 ) ( ON ?auto_598870 ?auto_598869 ) ( ON ?auto_598871 ?auto_598870 ) ( ON ?auto_598872 ?auto_598871 ) ( not ( = ?auto_598867 ?auto_598868 ) ) ( not ( = ?auto_598867 ?auto_598869 ) ) ( not ( = ?auto_598867 ?auto_598870 ) ) ( not ( = ?auto_598867 ?auto_598871 ) ) ( not ( = ?auto_598867 ?auto_598872 ) ) ( not ( = ?auto_598867 ?auto_598873 ) ) ( not ( = ?auto_598867 ?auto_598874 ) ) ( not ( = ?auto_598867 ?auto_598878 ) ) ( not ( = ?auto_598868 ?auto_598869 ) ) ( not ( = ?auto_598868 ?auto_598870 ) ) ( not ( = ?auto_598868 ?auto_598871 ) ) ( not ( = ?auto_598868 ?auto_598872 ) ) ( not ( = ?auto_598868 ?auto_598873 ) ) ( not ( = ?auto_598868 ?auto_598874 ) ) ( not ( = ?auto_598868 ?auto_598878 ) ) ( not ( = ?auto_598869 ?auto_598870 ) ) ( not ( = ?auto_598869 ?auto_598871 ) ) ( not ( = ?auto_598869 ?auto_598872 ) ) ( not ( = ?auto_598869 ?auto_598873 ) ) ( not ( = ?auto_598869 ?auto_598874 ) ) ( not ( = ?auto_598869 ?auto_598878 ) ) ( not ( = ?auto_598870 ?auto_598871 ) ) ( not ( = ?auto_598870 ?auto_598872 ) ) ( not ( = ?auto_598870 ?auto_598873 ) ) ( not ( = ?auto_598870 ?auto_598874 ) ) ( not ( = ?auto_598870 ?auto_598878 ) ) ( not ( = ?auto_598871 ?auto_598872 ) ) ( not ( = ?auto_598871 ?auto_598873 ) ) ( not ( = ?auto_598871 ?auto_598874 ) ) ( not ( = ?auto_598871 ?auto_598878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_598872 ?auto_598873 ?auto_598874 )
      ( MAKE-7CRATE-VERIFY ?auto_598867 ?auto_598868 ?auto_598869 ?auto_598870 ?auto_598871 ?auto_598872 ?auto_598873 ?auto_598874 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601760 - SURFACE
      ?auto_601761 - SURFACE
      ?auto_601762 - SURFACE
      ?auto_601763 - SURFACE
      ?auto_601764 - SURFACE
      ?auto_601765 - SURFACE
      ?auto_601766 - SURFACE
      ?auto_601767 - SURFACE
      ?auto_601768 - SURFACE
    )
    :vars
    (
      ?auto_601770 - HOIST
      ?auto_601769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_601770 ?auto_601769 ) ( SURFACE-AT ?auto_601767 ?auto_601769 ) ( CLEAR ?auto_601767 ) ( LIFTING ?auto_601770 ?auto_601768 ) ( IS-CRATE ?auto_601768 ) ( not ( = ?auto_601767 ?auto_601768 ) ) ( ON ?auto_601761 ?auto_601760 ) ( ON ?auto_601762 ?auto_601761 ) ( ON ?auto_601763 ?auto_601762 ) ( ON ?auto_601764 ?auto_601763 ) ( ON ?auto_601765 ?auto_601764 ) ( ON ?auto_601766 ?auto_601765 ) ( ON ?auto_601767 ?auto_601766 ) ( not ( = ?auto_601760 ?auto_601761 ) ) ( not ( = ?auto_601760 ?auto_601762 ) ) ( not ( = ?auto_601760 ?auto_601763 ) ) ( not ( = ?auto_601760 ?auto_601764 ) ) ( not ( = ?auto_601760 ?auto_601765 ) ) ( not ( = ?auto_601760 ?auto_601766 ) ) ( not ( = ?auto_601760 ?auto_601767 ) ) ( not ( = ?auto_601760 ?auto_601768 ) ) ( not ( = ?auto_601761 ?auto_601762 ) ) ( not ( = ?auto_601761 ?auto_601763 ) ) ( not ( = ?auto_601761 ?auto_601764 ) ) ( not ( = ?auto_601761 ?auto_601765 ) ) ( not ( = ?auto_601761 ?auto_601766 ) ) ( not ( = ?auto_601761 ?auto_601767 ) ) ( not ( = ?auto_601761 ?auto_601768 ) ) ( not ( = ?auto_601762 ?auto_601763 ) ) ( not ( = ?auto_601762 ?auto_601764 ) ) ( not ( = ?auto_601762 ?auto_601765 ) ) ( not ( = ?auto_601762 ?auto_601766 ) ) ( not ( = ?auto_601762 ?auto_601767 ) ) ( not ( = ?auto_601762 ?auto_601768 ) ) ( not ( = ?auto_601763 ?auto_601764 ) ) ( not ( = ?auto_601763 ?auto_601765 ) ) ( not ( = ?auto_601763 ?auto_601766 ) ) ( not ( = ?auto_601763 ?auto_601767 ) ) ( not ( = ?auto_601763 ?auto_601768 ) ) ( not ( = ?auto_601764 ?auto_601765 ) ) ( not ( = ?auto_601764 ?auto_601766 ) ) ( not ( = ?auto_601764 ?auto_601767 ) ) ( not ( = ?auto_601764 ?auto_601768 ) ) ( not ( = ?auto_601765 ?auto_601766 ) ) ( not ( = ?auto_601765 ?auto_601767 ) ) ( not ( = ?auto_601765 ?auto_601768 ) ) ( not ( = ?auto_601766 ?auto_601767 ) ) ( not ( = ?auto_601766 ?auto_601768 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_601767 ?auto_601768 )
      ( MAKE-8CRATE-VERIFY ?auto_601760 ?auto_601761 ?auto_601762 ?auto_601763 ?auto_601764 ?auto_601765 ?auto_601766 ?auto_601767 ?auto_601768 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601827 - SURFACE
      ?auto_601828 - SURFACE
      ?auto_601829 - SURFACE
      ?auto_601830 - SURFACE
      ?auto_601831 - SURFACE
      ?auto_601832 - SURFACE
      ?auto_601833 - SURFACE
      ?auto_601834 - SURFACE
      ?auto_601835 - SURFACE
    )
    :vars
    (
      ?auto_601838 - HOIST
      ?auto_601836 - PLACE
      ?auto_601837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_601838 ?auto_601836 ) ( SURFACE-AT ?auto_601834 ?auto_601836 ) ( CLEAR ?auto_601834 ) ( IS-CRATE ?auto_601835 ) ( not ( = ?auto_601834 ?auto_601835 ) ) ( TRUCK-AT ?auto_601837 ?auto_601836 ) ( AVAILABLE ?auto_601838 ) ( IN ?auto_601835 ?auto_601837 ) ( ON ?auto_601834 ?auto_601833 ) ( not ( = ?auto_601833 ?auto_601834 ) ) ( not ( = ?auto_601833 ?auto_601835 ) ) ( ON ?auto_601828 ?auto_601827 ) ( ON ?auto_601829 ?auto_601828 ) ( ON ?auto_601830 ?auto_601829 ) ( ON ?auto_601831 ?auto_601830 ) ( ON ?auto_601832 ?auto_601831 ) ( ON ?auto_601833 ?auto_601832 ) ( not ( = ?auto_601827 ?auto_601828 ) ) ( not ( = ?auto_601827 ?auto_601829 ) ) ( not ( = ?auto_601827 ?auto_601830 ) ) ( not ( = ?auto_601827 ?auto_601831 ) ) ( not ( = ?auto_601827 ?auto_601832 ) ) ( not ( = ?auto_601827 ?auto_601833 ) ) ( not ( = ?auto_601827 ?auto_601834 ) ) ( not ( = ?auto_601827 ?auto_601835 ) ) ( not ( = ?auto_601828 ?auto_601829 ) ) ( not ( = ?auto_601828 ?auto_601830 ) ) ( not ( = ?auto_601828 ?auto_601831 ) ) ( not ( = ?auto_601828 ?auto_601832 ) ) ( not ( = ?auto_601828 ?auto_601833 ) ) ( not ( = ?auto_601828 ?auto_601834 ) ) ( not ( = ?auto_601828 ?auto_601835 ) ) ( not ( = ?auto_601829 ?auto_601830 ) ) ( not ( = ?auto_601829 ?auto_601831 ) ) ( not ( = ?auto_601829 ?auto_601832 ) ) ( not ( = ?auto_601829 ?auto_601833 ) ) ( not ( = ?auto_601829 ?auto_601834 ) ) ( not ( = ?auto_601829 ?auto_601835 ) ) ( not ( = ?auto_601830 ?auto_601831 ) ) ( not ( = ?auto_601830 ?auto_601832 ) ) ( not ( = ?auto_601830 ?auto_601833 ) ) ( not ( = ?auto_601830 ?auto_601834 ) ) ( not ( = ?auto_601830 ?auto_601835 ) ) ( not ( = ?auto_601831 ?auto_601832 ) ) ( not ( = ?auto_601831 ?auto_601833 ) ) ( not ( = ?auto_601831 ?auto_601834 ) ) ( not ( = ?auto_601831 ?auto_601835 ) ) ( not ( = ?auto_601832 ?auto_601833 ) ) ( not ( = ?auto_601832 ?auto_601834 ) ) ( not ( = ?auto_601832 ?auto_601835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601833 ?auto_601834 ?auto_601835 )
      ( MAKE-8CRATE-VERIFY ?auto_601827 ?auto_601828 ?auto_601829 ?auto_601830 ?auto_601831 ?auto_601832 ?auto_601833 ?auto_601834 ?auto_601835 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601903 - SURFACE
      ?auto_601904 - SURFACE
      ?auto_601905 - SURFACE
      ?auto_601906 - SURFACE
      ?auto_601907 - SURFACE
      ?auto_601908 - SURFACE
      ?auto_601909 - SURFACE
      ?auto_601910 - SURFACE
      ?auto_601911 - SURFACE
    )
    :vars
    (
      ?auto_601915 - HOIST
      ?auto_601913 - PLACE
      ?auto_601914 - TRUCK
      ?auto_601912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_601915 ?auto_601913 ) ( SURFACE-AT ?auto_601910 ?auto_601913 ) ( CLEAR ?auto_601910 ) ( IS-CRATE ?auto_601911 ) ( not ( = ?auto_601910 ?auto_601911 ) ) ( AVAILABLE ?auto_601915 ) ( IN ?auto_601911 ?auto_601914 ) ( ON ?auto_601910 ?auto_601909 ) ( not ( = ?auto_601909 ?auto_601910 ) ) ( not ( = ?auto_601909 ?auto_601911 ) ) ( TRUCK-AT ?auto_601914 ?auto_601912 ) ( not ( = ?auto_601912 ?auto_601913 ) ) ( ON ?auto_601904 ?auto_601903 ) ( ON ?auto_601905 ?auto_601904 ) ( ON ?auto_601906 ?auto_601905 ) ( ON ?auto_601907 ?auto_601906 ) ( ON ?auto_601908 ?auto_601907 ) ( ON ?auto_601909 ?auto_601908 ) ( not ( = ?auto_601903 ?auto_601904 ) ) ( not ( = ?auto_601903 ?auto_601905 ) ) ( not ( = ?auto_601903 ?auto_601906 ) ) ( not ( = ?auto_601903 ?auto_601907 ) ) ( not ( = ?auto_601903 ?auto_601908 ) ) ( not ( = ?auto_601903 ?auto_601909 ) ) ( not ( = ?auto_601903 ?auto_601910 ) ) ( not ( = ?auto_601903 ?auto_601911 ) ) ( not ( = ?auto_601904 ?auto_601905 ) ) ( not ( = ?auto_601904 ?auto_601906 ) ) ( not ( = ?auto_601904 ?auto_601907 ) ) ( not ( = ?auto_601904 ?auto_601908 ) ) ( not ( = ?auto_601904 ?auto_601909 ) ) ( not ( = ?auto_601904 ?auto_601910 ) ) ( not ( = ?auto_601904 ?auto_601911 ) ) ( not ( = ?auto_601905 ?auto_601906 ) ) ( not ( = ?auto_601905 ?auto_601907 ) ) ( not ( = ?auto_601905 ?auto_601908 ) ) ( not ( = ?auto_601905 ?auto_601909 ) ) ( not ( = ?auto_601905 ?auto_601910 ) ) ( not ( = ?auto_601905 ?auto_601911 ) ) ( not ( = ?auto_601906 ?auto_601907 ) ) ( not ( = ?auto_601906 ?auto_601908 ) ) ( not ( = ?auto_601906 ?auto_601909 ) ) ( not ( = ?auto_601906 ?auto_601910 ) ) ( not ( = ?auto_601906 ?auto_601911 ) ) ( not ( = ?auto_601907 ?auto_601908 ) ) ( not ( = ?auto_601907 ?auto_601909 ) ) ( not ( = ?auto_601907 ?auto_601910 ) ) ( not ( = ?auto_601907 ?auto_601911 ) ) ( not ( = ?auto_601908 ?auto_601909 ) ) ( not ( = ?auto_601908 ?auto_601910 ) ) ( not ( = ?auto_601908 ?auto_601911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601909 ?auto_601910 ?auto_601911 )
      ( MAKE-8CRATE-VERIFY ?auto_601903 ?auto_601904 ?auto_601905 ?auto_601906 ?auto_601907 ?auto_601908 ?auto_601909 ?auto_601910 ?auto_601911 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_601987 - SURFACE
      ?auto_601988 - SURFACE
      ?auto_601989 - SURFACE
      ?auto_601990 - SURFACE
      ?auto_601991 - SURFACE
      ?auto_601992 - SURFACE
      ?auto_601993 - SURFACE
      ?auto_601994 - SURFACE
      ?auto_601995 - SURFACE
    )
    :vars
    (
      ?auto_602000 - HOIST
      ?auto_601998 - PLACE
      ?auto_601997 - TRUCK
      ?auto_601996 - PLACE
      ?auto_601999 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_602000 ?auto_601998 ) ( SURFACE-AT ?auto_601994 ?auto_601998 ) ( CLEAR ?auto_601994 ) ( IS-CRATE ?auto_601995 ) ( not ( = ?auto_601994 ?auto_601995 ) ) ( AVAILABLE ?auto_602000 ) ( ON ?auto_601994 ?auto_601993 ) ( not ( = ?auto_601993 ?auto_601994 ) ) ( not ( = ?auto_601993 ?auto_601995 ) ) ( TRUCK-AT ?auto_601997 ?auto_601996 ) ( not ( = ?auto_601996 ?auto_601998 ) ) ( HOIST-AT ?auto_601999 ?auto_601996 ) ( LIFTING ?auto_601999 ?auto_601995 ) ( not ( = ?auto_602000 ?auto_601999 ) ) ( ON ?auto_601988 ?auto_601987 ) ( ON ?auto_601989 ?auto_601988 ) ( ON ?auto_601990 ?auto_601989 ) ( ON ?auto_601991 ?auto_601990 ) ( ON ?auto_601992 ?auto_601991 ) ( ON ?auto_601993 ?auto_601992 ) ( not ( = ?auto_601987 ?auto_601988 ) ) ( not ( = ?auto_601987 ?auto_601989 ) ) ( not ( = ?auto_601987 ?auto_601990 ) ) ( not ( = ?auto_601987 ?auto_601991 ) ) ( not ( = ?auto_601987 ?auto_601992 ) ) ( not ( = ?auto_601987 ?auto_601993 ) ) ( not ( = ?auto_601987 ?auto_601994 ) ) ( not ( = ?auto_601987 ?auto_601995 ) ) ( not ( = ?auto_601988 ?auto_601989 ) ) ( not ( = ?auto_601988 ?auto_601990 ) ) ( not ( = ?auto_601988 ?auto_601991 ) ) ( not ( = ?auto_601988 ?auto_601992 ) ) ( not ( = ?auto_601988 ?auto_601993 ) ) ( not ( = ?auto_601988 ?auto_601994 ) ) ( not ( = ?auto_601988 ?auto_601995 ) ) ( not ( = ?auto_601989 ?auto_601990 ) ) ( not ( = ?auto_601989 ?auto_601991 ) ) ( not ( = ?auto_601989 ?auto_601992 ) ) ( not ( = ?auto_601989 ?auto_601993 ) ) ( not ( = ?auto_601989 ?auto_601994 ) ) ( not ( = ?auto_601989 ?auto_601995 ) ) ( not ( = ?auto_601990 ?auto_601991 ) ) ( not ( = ?auto_601990 ?auto_601992 ) ) ( not ( = ?auto_601990 ?auto_601993 ) ) ( not ( = ?auto_601990 ?auto_601994 ) ) ( not ( = ?auto_601990 ?auto_601995 ) ) ( not ( = ?auto_601991 ?auto_601992 ) ) ( not ( = ?auto_601991 ?auto_601993 ) ) ( not ( = ?auto_601991 ?auto_601994 ) ) ( not ( = ?auto_601991 ?auto_601995 ) ) ( not ( = ?auto_601992 ?auto_601993 ) ) ( not ( = ?auto_601992 ?auto_601994 ) ) ( not ( = ?auto_601992 ?auto_601995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_601993 ?auto_601994 ?auto_601995 )
      ( MAKE-8CRATE-VERIFY ?auto_601987 ?auto_601988 ?auto_601989 ?auto_601990 ?auto_601991 ?auto_601992 ?auto_601993 ?auto_601994 ?auto_601995 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602079 - SURFACE
      ?auto_602080 - SURFACE
      ?auto_602081 - SURFACE
      ?auto_602082 - SURFACE
      ?auto_602083 - SURFACE
      ?auto_602084 - SURFACE
      ?auto_602085 - SURFACE
      ?auto_602086 - SURFACE
      ?auto_602087 - SURFACE
    )
    :vars
    (
      ?auto_602093 - HOIST
      ?auto_602088 - PLACE
      ?auto_602089 - TRUCK
      ?auto_602090 - PLACE
      ?auto_602091 - HOIST
      ?auto_602092 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_602093 ?auto_602088 ) ( SURFACE-AT ?auto_602086 ?auto_602088 ) ( CLEAR ?auto_602086 ) ( IS-CRATE ?auto_602087 ) ( not ( = ?auto_602086 ?auto_602087 ) ) ( AVAILABLE ?auto_602093 ) ( ON ?auto_602086 ?auto_602085 ) ( not ( = ?auto_602085 ?auto_602086 ) ) ( not ( = ?auto_602085 ?auto_602087 ) ) ( TRUCK-AT ?auto_602089 ?auto_602090 ) ( not ( = ?auto_602090 ?auto_602088 ) ) ( HOIST-AT ?auto_602091 ?auto_602090 ) ( not ( = ?auto_602093 ?auto_602091 ) ) ( AVAILABLE ?auto_602091 ) ( SURFACE-AT ?auto_602087 ?auto_602090 ) ( ON ?auto_602087 ?auto_602092 ) ( CLEAR ?auto_602087 ) ( not ( = ?auto_602086 ?auto_602092 ) ) ( not ( = ?auto_602087 ?auto_602092 ) ) ( not ( = ?auto_602085 ?auto_602092 ) ) ( ON ?auto_602080 ?auto_602079 ) ( ON ?auto_602081 ?auto_602080 ) ( ON ?auto_602082 ?auto_602081 ) ( ON ?auto_602083 ?auto_602082 ) ( ON ?auto_602084 ?auto_602083 ) ( ON ?auto_602085 ?auto_602084 ) ( not ( = ?auto_602079 ?auto_602080 ) ) ( not ( = ?auto_602079 ?auto_602081 ) ) ( not ( = ?auto_602079 ?auto_602082 ) ) ( not ( = ?auto_602079 ?auto_602083 ) ) ( not ( = ?auto_602079 ?auto_602084 ) ) ( not ( = ?auto_602079 ?auto_602085 ) ) ( not ( = ?auto_602079 ?auto_602086 ) ) ( not ( = ?auto_602079 ?auto_602087 ) ) ( not ( = ?auto_602079 ?auto_602092 ) ) ( not ( = ?auto_602080 ?auto_602081 ) ) ( not ( = ?auto_602080 ?auto_602082 ) ) ( not ( = ?auto_602080 ?auto_602083 ) ) ( not ( = ?auto_602080 ?auto_602084 ) ) ( not ( = ?auto_602080 ?auto_602085 ) ) ( not ( = ?auto_602080 ?auto_602086 ) ) ( not ( = ?auto_602080 ?auto_602087 ) ) ( not ( = ?auto_602080 ?auto_602092 ) ) ( not ( = ?auto_602081 ?auto_602082 ) ) ( not ( = ?auto_602081 ?auto_602083 ) ) ( not ( = ?auto_602081 ?auto_602084 ) ) ( not ( = ?auto_602081 ?auto_602085 ) ) ( not ( = ?auto_602081 ?auto_602086 ) ) ( not ( = ?auto_602081 ?auto_602087 ) ) ( not ( = ?auto_602081 ?auto_602092 ) ) ( not ( = ?auto_602082 ?auto_602083 ) ) ( not ( = ?auto_602082 ?auto_602084 ) ) ( not ( = ?auto_602082 ?auto_602085 ) ) ( not ( = ?auto_602082 ?auto_602086 ) ) ( not ( = ?auto_602082 ?auto_602087 ) ) ( not ( = ?auto_602082 ?auto_602092 ) ) ( not ( = ?auto_602083 ?auto_602084 ) ) ( not ( = ?auto_602083 ?auto_602085 ) ) ( not ( = ?auto_602083 ?auto_602086 ) ) ( not ( = ?auto_602083 ?auto_602087 ) ) ( not ( = ?auto_602083 ?auto_602092 ) ) ( not ( = ?auto_602084 ?auto_602085 ) ) ( not ( = ?auto_602084 ?auto_602086 ) ) ( not ( = ?auto_602084 ?auto_602087 ) ) ( not ( = ?auto_602084 ?auto_602092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602085 ?auto_602086 ?auto_602087 )
      ( MAKE-8CRATE-VERIFY ?auto_602079 ?auto_602080 ?auto_602081 ?auto_602082 ?auto_602083 ?auto_602084 ?auto_602085 ?auto_602086 ?auto_602087 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602172 - SURFACE
      ?auto_602173 - SURFACE
      ?auto_602174 - SURFACE
      ?auto_602175 - SURFACE
      ?auto_602176 - SURFACE
      ?auto_602177 - SURFACE
      ?auto_602178 - SURFACE
      ?auto_602179 - SURFACE
      ?auto_602180 - SURFACE
    )
    :vars
    (
      ?auto_602183 - HOIST
      ?auto_602185 - PLACE
      ?auto_602181 - PLACE
      ?auto_602186 - HOIST
      ?auto_602182 - SURFACE
      ?auto_602184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602183 ?auto_602185 ) ( SURFACE-AT ?auto_602179 ?auto_602185 ) ( CLEAR ?auto_602179 ) ( IS-CRATE ?auto_602180 ) ( not ( = ?auto_602179 ?auto_602180 ) ) ( AVAILABLE ?auto_602183 ) ( ON ?auto_602179 ?auto_602178 ) ( not ( = ?auto_602178 ?auto_602179 ) ) ( not ( = ?auto_602178 ?auto_602180 ) ) ( not ( = ?auto_602181 ?auto_602185 ) ) ( HOIST-AT ?auto_602186 ?auto_602181 ) ( not ( = ?auto_602183 ?auto_602186 ) ) ( AVAILABLE ?auto_602186 ) ( SURFACE-AT ?auto_602180 ?auto_602181 ) ( ON ?auto_602180 ?auto_602182 ) ( CLEAR ?auto_602180 ) ( not ( = ?auto_602179 ?auto_602182 ) ) ( not ( = ?auto_602180 ?auto_602182 ) ) ( not ( = ?auto_602178 ?auto_602182 ) ) ( TRUCK-AT ?auto_602184 ?auto_602185 ) ( ON ?auto_602173 ?auto_602172 ) ( ON ?auto_602174 ?auto_602173 ) ( ON ?auto_602175 ?auto_602174 ) ( ON ?auto_602176 ?auto_602175 ) ( ON ?auto_602177 ?auto_602176 ) ( ON ?auto_602178 ?auto_602177 ) ( not ( = ?auto_602172 ?auto_602173 ) ) ( not ( = ?auto_602172 ?auto_602174 ) ) ( not ( = ?auto_602172 ?auto_602175 ) ) ( not ( = ?auto_602172 ?auto_602176 ) ) ( not ( = ?auto_602172 ?auto_602177 ) ) ( not ( = ?auto_602172 ?auto_602178 ) ) ( not ( = ?auto_602172 ?auto_602179 ) ) ( not ( = ?auto_602172 ?auto_602180 ) ) ( not ( = ?auto_602172 ?auto_602182 ) ) ( not ( = ?auto_602173 ?auto_602174 ) ) ( not ( = ?auto_602173 ?auto_602175 ) ) ( not ( = ?auto_602173 ?auto_602176 ) ) ( not ( = ?auto_602173 ?auto_602177 ) ) ( not ( = ?auto_602173 ?auto_602178 ) ) ( not ( = ?auto_602173 ?auto_602179 ) ) ( not ( = ?auto_602173 ?auto_602180 ) ) ( not ( = ?auto_602173 ?auto_602182 ) ) ( not ( = ?auto_602174 ?auto_602175 ) ) ( not ( = ?auto_602174 ?auto_602176 ) ) ( not ( = ?auto_602174 ?auto_602177 ) ) ( not ( = ?auto_602174 ?auto_602178 ) ) ( not ( = ?auto_602174 ?auto_602179 ) ) ( not ( = ?auto_602174 ?auto_602180 ) ) ( not ( = ?auto_602174 ?auto_602182 ) ) ( not ( = ?auto_602175 ?auto_602176 ) ) ( not ( = ?auto_602175 ?auto_602177 ) ) ( not ( = ?auto_602175 ?auto_602178 ) ) ( not ( = ?auto_602175 ?auto_602179 ) ) ( not ( = ?auto_602175 ?auto_602180 ) ) ( not ( = ?auto_602175 ?auto_602182 ) ) ( not ( = ?auto_602176 ?auto_602177 ) ) ( not ( = ?auto_602176 ?auto_602178 ) ) ( not ( = ?auto_602176 ?auto_602179 ) ) ( not ( = ?auto_602176 ?auto_602180 ) ) ( not ( = ?auto_602176 ?auto_602182 ) ) ( not ( = ?auto_602177 ?auto_602178 ) ) ( not ( = ?auto_602177 ?auto_602179 ) ) ( not ( = ?auto_602177 ?auto_602180 ) ) ( not ( = ?auto_602177 ?auto_602182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602178 ?auto_602179 ?auto_602180 )
      ( MAKE-8CRATE-VERIFY ?auto_602172 ?auto_602173 ?auto_602174 ?auto_602175 ?auto_602176 ?auto_602177 ?auto_602178 ?auto_602179 ?auto_602180 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602265 - SURFACE
      ?auto_602266 - SURFACE
      ?auto_602267 - SURFACE
      ?auto_602268 - SURFACE
      ?auto_602269 - SURFACE
      ?auto_602270 - SURFACE
      ?auto_602271 - SURFACE
      ?auto_602272 - SURFACE
      ?auto_602273 - SURFACE
    )
    :vars
    (
      ?auto_602279 - HOIST
      ?auto_602274 - PLACE
      ?auto_602278 - PLACE
      ?auto_602277 - HOIST
      ?auto_602275 - SURFACE
      ?auto_602276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602279 ?auto_602274 ) ( IS-CRATE ?auto_602273 ) ( not ( = ?auto_602272 ?auto_602273 ) ) ( not ( = ?auto_602271 ?auto_602272 ) ) ( not ( = ?auto_602271 ?auto_602273 ) ) ( not ( = ?auto_602278 ?auto_602274 ) ) ( HOIST-AT ?auto_602277 ?auto_602278 ) ( not ( = ?auto_602279 ?auto_602277 ) ) ( AVAILABLE ?auto_602277 ) ( SURFACE-AT ?auto_602273 ?auto_602278 ) ( ON ?auto_602273 ?auto_602275 ) ( CLEAR ?auto_602273 ) ( not ( = ?auto_602272 ?auto_602275 ) ) ( not ( = ?auto_602273 ?auto_602275 ) ) ( not ( = ?auto_602271 ?auto_602275 ) ) ( TRUCK-AT ?auto_602276 ?auto_602274 ) ( SURFACE-AT ?auto_602271 ?auto_602274 ) ( CLEAR ?auto_602271 ) ( LIFTING ?auto_602279 ?auto_602272 ) ( IS-CRATE ?auto_602272 ) ( ON ?auto_602266 ?auto_602265 ) ( ON ?auto_602267 ?auto_602266 ) ( ON ?auto_602268 ?auto_602267 ) ( ON ?auto_602269 ?auto_602268 ) ( ON ?auto_602270 ?auto_602269 ) ( ON ?auto_602271 ?auto_602270 ) ( not ( = ?auto_602265 ?auto_602266 ) ) ( not ( = ?auto_602265 ?auto_602267 ) ) ( not ( = ?auto_602265 ?auto_602268 ) ) ( not ( = ?auto_602265 ?auto_602269 ) ) ( not ( = ?auto_602265 ?auto_602270 ) ) ( not ( = ?auto_602265 ?auto_602271 ) ) ( not ( = ?auto_602265 ?auto_602272 ) ) ( not ( = ?auto_602265 ?auto_602273 ) ) ( not ( = ?auto_602265 ?auto_602275 ) ) ( not ( = ?auto_602266 ?auto_602267 ) ) ( not ( = ?auto_602266 ?auto_602268 ) ) ( not ( = ?auto_602266 ?auto_602269 ) ) ( not ( = ?auto_602266 ?auto_602270 ) ) ( not ( = ?auto_602266 ?auto_602271 ) ) ( not ( = ?auto_602266 ?auto_602272 ) ) ( not ( = ?auto_602266 ?auto_602273 ) ) ( not ( = ?auto_602266 ?auto_602275 ) ) ( not ( = ?auto_602267 ?auto_602268 ) ) ( not ( = ?auto_602267 ?auto_602269 ) ) ( not ( = ?auto_602267 ?auto_602270 ) ) ( not ( = ?auto_602267 ?auto_602271 ) ) ( not ( = ?auto_602267 ?auto_602272 ) ) ( not ( = ?auto_602267 ?auto_602273 ) ) ( not ( = ?auto_602267 ?auto_602275 ) ) ( not ( = ?auto_602268 ?auto_602269 ) ) ( not ( = ?auto_602268 ?auto_602270 ) ) ( not ( = ?auto_602268 ?auto_602271 ) ) ( not ( = ?auto_602268 ?auto_602272 ) ) ( not ( = ?auto_602268 ?auto_602273 ) ) ( not ( = ?auto_602268 ?auto_602275 ) ) ( not ( = ?auto_602269 ?auto_602270 ) ) ( not ( = ?auto_602269 ?auto_602271 ) ) ( not ( = ?auto_602269 ?auto_602272 ) ) ( not ( = ?auto_602269 ?auto_602273 ) ) ( not ( = ?auto_602269 ?auto_602275 ) ) ( not ( = ?auto_602270 ?auto_602271 ) ) ( not ( = ?auto_602270 ?auto_602272 ) ) ( not ( = ?auto_602270 ?auto_602273 ) ) ( not ( = ?auto_602270 ?auto_602275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602271 ?auto_602272 ?auto_602273 )
      ( MAKE-8CRATE-VERIFY ?auto_602265 ?auto_602266 ?auto_602267 ?auto_602268 ?auto_602269 ?auto_602270 ?auto_602271 ?auto_602272 ?auto_602273 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_602358 - SURFACE
      ?auto_602359 - SURFACE
      ?auto_602360 - SURFACE
      ?auto_602361 - SURFACE
      ?auto_602362 - SURFACE
      ?auto_602363 - SURFACE
      ?auto_602364 - SURFACE
      ?auto_602365 - SURFACE
      ?auto_602366 - SURFACE
    )
    :vars
    (
      ?auto_602372 - HOIST
      ?auto_602370 - PLACE
      ?auto_602368 - PLACE
      ?auto_602369 - HOIST
      ?auto_602367 - SURFACE
      ?auto_602371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602372 ?auto_602370 ) ( IS-CRATE ?auto_602366 ) ( not ( = ?auto_602365 ?auto_602366 ) ) ( not ( = ?auto_602364 ?auto_602365 ) ) ( not ( = ?auto_602364 ?auto_602366 ) ) ( not ( = ?auto_602368 ?auto_602370 ) ) ( HOIST-AT ?auto_602369 ?auto_602368 ) ( not ( = ?auto_602372 ?auto_602369 ) ) ( AVAILABLE ?auto_602369 ) ( SURFACE-AT ?auto_602366 ?auto_602368 ) ( ON ?auto_602366 ?auto_602367 ) ( CLEAR ?auto_602366 ) ( not ( = ?auto_602365 ?auto_602367 ) ) ( not ( = ?auto_602366 ?auto_602367 ) ) ( not ( = ?auto_602364 ?auto_602367 ) ) ( TRUCK-AT ?auto_602371 ?auto_602370 ) ( SURFACE-AT ?auto_602364 ?auto_602370 ) ( CLEAR ?auto_602364 ) ( IS-CRATE ?auto_602365 ) ( AVAILABLE ?auto_602372 ) ( IN ?auto_602365 ?auto_602371 ) ( ON ?auto_602359 ?auto_602358 ) ( ON ?auto_602360 ?auto_602359 ) ( ON ?auto_602361 ?auto_602360 ) ( ON ?auto_602362 ?auto_602361 ) ( ON ?auto_602363 ?auto_602362 ) ( ON ?auto_602364 ?auto_602363 ) ( not ( = ?auto_602358 ?auto_602359 ) ) ( not ( = ?auto_602358 ?auto_602360 ) ) ( not ( = ?auto_602358 ?auto_602361 ) ) ( not ( = ?auto_602358 ?auto_602362 ) ) ( not ( = ?auto_602358 ?auto_602363 ) ) ( not ( = ?auto_602358 ?auto_602364 ) ) ( not ( = ?auto_602358 ?auto_602365 ) ) ( not ( = ?auto_602358 ?auto_602366 ) ) ( not ( = ?auto_602358 ?auto_602367 ) ) ( not ( = ?auto_602359 ?auto_602360 ) ) ( not ( = ?auto_602359 ?auto_602361 ) ) ( not ( = ?auto_602359 ?auto_602362 ) ) ( not ( = ?auto_602359 ?auto_602363 ) ) ( not ( = ?auto_602359 ?auto_602364 ) ) ( not ( = ?auto_602359 ?auto_602365 ) ) ( not ( = ?auto_602359 ?auto_602366 ) ) ( not ( = ?auto_602359 ?auto_602367 ) ) ( not ( = ?auto_602360 ?auto_602361 ) ) ( not ( = ?auto_602360 ?auto_602362 ) ) ( not ( = ?auto_602360 ?auto_602363 ) ) ( not ( = ?auto_602360 ?auto_602364 ) ) ( not ( = ?auto_602360 ?auto_602365 ) ) ( not ( = ?auto_602360 ?auto_602366 ) ) ( not ( = ?auto_602360 ?auto_602367 ) ) ( not ( = ?auto_602361 ?auto_602362 ) ) ( not ( = ?auto_602361 ?auto_602363 ) ) ( not ( = ?auto_602361 ?auto_602364 ) ) ( not ( = ?auto_602361 ?auto_602365 ) ) ( not ( = ?auto_602361 ?auto_602366 ) ) ( not ( = ?auto_602361 ?auto_602367 ) ) ( not ( = ?auto_602362 ?auto_602363 ) ) ( not ( = ?auto_602362 ?auto_602364 ) ) ( not ( = ?auto_602362 ?auto_602365 ) ) ( not ( = ?auto_602362 ?auto_602366 ) ) ( not ( = ?auto_602362 ?auto_602367 ) ) ( not ( = ?auto_602363 ?auto_602364 ) ) ( not ( = ?auto_602363 ?auto_602365 ) ) ( not ( = ?auto_602363 ?auto_602366 ) ) ( not ( = ?auto_602363 ?auto_602367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_602364 ?auto_602365 ?auto_602366 )
      ( MAKE-8CRATE-VERIFY ?auto_602358 ?auto_602359 ?auto_602360 ?auto_602361 ?auto_602362 ?auto_602363 ?auto_602364 ?auto_602365 ?auto_602366 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606444 - SURFACE
      ?auto_606445 - SURFACE
      ?auto_606446 - SURFACE
      ?auto_606447 - SURFACE
      ?auto_606448 - SURFACE
      ?auto_606449 - SURFACE
      ?auto_606450 - SURFACE
      ?auto_606451 - SURFACE
      ?auto_606452 - SURFACE
      ?auto_606453 - SURFACE
    )
    :vars
    (
      ?auto_606454 - HOIST
      ?auto_606455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606454 ?auto_606455 ) ( SURFACE-AT ?auto_606452 ?auto_606455 ) ( CLEAR ?auto_606452 ) ( LIFTING ?auto_606454 ?auto_606453 ) ( IS-CRATE ?auto_606453 ) ( not ( = ?auto_606452 ?auto_606453 ) ) ( ON ?auto_606445 ?auto_606444 ) ( ON ?auto_606446 ?auto_606445 ) ( ON ?auto_606447 ?auto_606446 ) ( ON ?auto_606448 ?auto_606447 ) ( ON ?auto_606449 ?auto_606448 ) ( ON ?auto_606450 ?auto_606449 ) ( ON ?auto_606451 ?auto_606450 ) ( ON ?auto_606452 ?auto_606451 ) ( not ( = ?auto_606444 ?auto_606445 ) ) ( not ( = ?auto_606444 ?auto_606446 ) ) ( not ( = ?auto_606444 ?auto_606447 ) ) ( not ( = ?auto_606444 ?auto_606448 ) ) ( not ( = ?auto_606444 ?auto_606449 ) ) ( not ( = ?auto_606444 ?auto_606450 ) ) ( not ( = ?auto_606444 ?auto_606451 ) ) ( not ( = ?auto_606444 ?auto_606452 ) ) ( not ( = ?auto_606444 ?auto_606453 ) ) ( not ( = ?auto_606445 ?auto_606446 ) ) ( not ( = ?auto_606445 ?auto_606447 ) ) ( not ( = ?auto_606445 ?auto_606448 ) ) ( not ( = ?auto_606445 ?auto_606449 ) ) ( not ( = ?auto_606445 ?auto_606450 ) ) ( not ( = ?auto_606445 ?auto_606451 ) ) ( not ( = ?auto_606445 ?auto_606452 ) ) ( not ( = ?auto_606445 ?auto_606453 ) ) ( not ( = ?auto_606446 ?auto_606447 ) ) ( not ( = ?auto_606446 ?auto_606448 ) ) ( not ( = ?auto_606446 ?auto_606449 ) ) ( not ( = ?auto_606446 ?auto_606450 ) ) ( not ( = ?auto_606446 ?auto_606451 ) ) ( not ( = ?auto_606446 ?auto_606452 ) ) ( not ( = ?auto_606446 ?auto_606453 ) ) ( not ( = ?auto_606447 ?auto_606448 ) ) ( not ( = ?auto_606447 ?auto_606449 ) ) ( not ( = ?auto_606447 ?auto_606450 ) ) ( not ( = ?auto_606447 ?auto_606451 ) ) ( not ( = ?auto_606447 ?auto_606452 ) ) ( not ( = ?auto_606447 ?auto_606453 ) ) ( not ( = ?auto_606448 ?auto_606449 ) ) ( not ( = ?auto_606448 ?auto_606450 ) ) ( not ( = ?auto_606448 ?auto_606451 ) ) ( not ( = ?auto_606448 ?auto_606452 ) ) ( not ( = ?auto_606448 ?auto_606453 ) ) ( not ( = ?auto_606449 ?auto_606450 ) ) ( not ( = ?auto_606449 ?auto_606451 ) ) ( not ( = ?auto_606449 ?auto_606452 ) ) ( not ( = ?auto_606449 ?auto_606453 ) ) ( not ( = ?auto_606450 ?auto_606451 ) ) ( not ( = ?auto_606450 ?auto_606452 ) ) ( not ( = ?auto_606450 ?auto_606453 ) ) ( not ( = ?auto_606451 ?auto_606452 ) ) ( not ( = ?auto_606451 ?auto_606453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_606452 ?auto_606453 )
      ( MAKE-9CRATE-VERIFY ?auto_606444 ?auto_606445 ?auto_606446 ?auto_606447 ?auto_606448 ?auto_606449 ?auto_606450 ?auto_606451 ?auto_606452 ?auto_606453 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606524 - SURFACE
      ?auto_606525 - SURFACE
      ?auto_606526 - SURFACE
      ?auto_606527 - SURFACE
      ?auto_606528 - SURFACE
      ?auto_606529 - SURFACE
      ?auto_606530 - SURFACE
      ?auto_606531 - SURFACE
      ?auto_606532 - SURFACE
      ?auto_606533 - SURFACE
    )
    :vars
    (
      ?auto_606536 - HOIST
      ?auto_606534 - PLACE
      ?auto_606535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606536 ?auto_606534 ) ( SURFACE-AT ?auto_606532 ?auto_606534 ) ( CLEAR ?auto_606532 ) ( IS-CRATE ?auto_606533 ) ( not ( = ?auto_606532 ?auto_606533 ) ) ( TRUCK-AT ?auto_606535 ?auto_606534 ) ( AVAILABLE ?auto_606536 ) ( IN ?auto_606533 ?auto_606535 ) ( ON ?auto_606532 ?auto_606531 ) ( not ( = ?auto_606531 ?auto_606532 ) ) ( not ( = ?auto_606531 ?auto_606533 ) ) ( ON ?auto_606525 ?auto_606524 ) ( ON ?auto_606526 ?auto_606525 ) ( ON ?auto_606527 ?auto_606526 ) ( ON ?auto_606528 ?auto_606527 ) ( ON ?auto_606529 ?auto_606528 ) ( ON ?auto_606530 ?auto_606529 ) ( ON ?auto_606531 ?auto_606530 ) ( not ( = ?auto_606524 ?auto_606525 ) ) ( not ( = ?auto_606524 ?auto_606526 ) ) ( not ( = ?auto_606524 ?auto_606527 ) ) ( not ( = ?auto_606524 ?auto_606528 ) ) ( not ( = ?auto_606524 ?auto_606529 ) ) ( not ( = ?auto_606524 ?auto_606530 ) ) ( not ( = ?auto_606524 ?auto_606531 ) ) ( not ( = ?auto_606524 ?auto_606532 ) ) ( not ( = ?auto_606524 ?auto_606533 ) ) ( not ( = ?auto_606525 ?auto_606526 ) ) ( not ( = ?auto_606525 ?auto_606527 ) ) ( not ( = ?auto_606525 ?auto_606528 ) ) ( not ( = ?auto_606525 ?auto_606529 ) ) ( not ( = ?auto_606525 ?auto_606530 ) ) ( not ( = ?auto_606525 ?auto_606531 ) ) ( not ( = ?auto_606525 ?auto_606532 ) ) ( not ( = ?auto_606525 ?auto_606533 ) ) ( not ( = ?auto_606526 ?auto_606527 ) ) ( not ( = ?auto_606526 ?auto_606528 ) ) ( not ( = ?auto_606526 ?auto_606529 ) ) ( not ( = ?auto_606526 ?auto_606530 ) ) ( not ( = ?auto_606526 ?auto_606531 ) ) ( not ( = ?auto_606526 ?auto_606532 ) ) ( not ( = ?auto_606526 ?auto_606533 ) ) ( not ( = ?auto_606527 ?auto_606528 ) ) ( not ( = ?auto_606527 ?auto_606529 ) ) ( not ( = ?auto_606527 ?auto_606530 ) ) ( not ( = ?auto_606527 ?auto_606531 ) ) ( not ( = ?auto_606527 ?auto_606532 ) ) ( not ( = ?auto_606527 ?auto_606533 ) ) ( not ( = ?auto_606528 ?auto_606529 ) ) ( not ( = ?auto_606528 ?auto_606530 ) ) ( not ( = ?auto_606528 ?auto_606531 ) ) ( not ( = ?auto_606528 ?auto_606532 ) ) ( not ( = ?auto_606528 ?auto_606533 ) ) ( not ( = ?auto_606529 ?auto_606530 ) ) ( not ( = ?auto_606529 ?auto_606531 ) ) ( not ( = ?auto_606529 ?auto_606532 ) ) ( not ( = ?auto_606529 ?auto_606533 ) ) ( not ( = ?auto_606530 ?auto_606531 ) ) ( not ( = ?auto_606530 ?auto_606532 ) ) ( not ( = ?auto_606530 ?auto_606533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606531 ?auto_606532 ?auto_606533 )
      ( MAKE-9CRATE-VERIFY ?auto_606524 ?auto_606525 ?auto_606526 ?auto_606527 ?auto_606528 ?auto_606529 ?auto_606530 ?auto_606531 ?auto_606532 ?auto_606533 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606614 - SURFACE
      ?auto_606615 - SURFACE
      ?auto_606616 - SURFACE
      ?auto_606617 - SURFACE
      ?auto_606618 - SURFACE
      ?auto_606619 - SURFACE
      ?auto_606620 - SURFACE
      ?auto_606621 - SURFACE
      ?auto_606622 - SURFACE
      ?auto_606623 - SURFACE
    )
    :vars
    (
      ?auto_606625 - HOIST
      ?auto_606626 - PLACE
      ?auto_606627 - TRUCK
      ?auto_606624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606625 ?auto_606626 ) ( SURFACE-AT ?auto_606622 ?auto_606626 ) ( CLEAR ?auto_606622 ) ( IS-CRATE ?auto_606623 ) ( not ( = ?auto_606622 ?auto_606623 ) ) ( AVAILABLE ?auto_606625 ) ( IN ?auto_606623 ?auto_606627 ) ( ON ?auto_606622 ?auto_606621 ) ( not ( = ?auto_606621 ?auto_606622 ) ) ( not ( = ?auto_606621 ?auto_606623 ) ) ( TRUCK-AT ?auto_606627 ?auto_606624 ) ( not ( = ?auto_606624 ?auto_606626 ) ) ( ON ?auto_606615 ?auto_606614 ) ( ON ?auto_606616 ?auto_606615 ) ( ON ?auto_606617 ?auto_606616 ) ( ON ?auto_606618 ?auto_606617 ) ( ON ?auto_606619 ?auto_606618 ) ( ON ?auto_606620 ?auto_606619 ) ( ON ?auto_606621 ?auto_606620 ) ( not ( = ?auto_606614 ?auto_606615 ) ) ( not ( = ?auto_606614 ?auto_606616 ) ) ( not ( = ?auto_606614 ?auto_606617 ) ) ( not ( = ?auto_606614 ?auto_606618 ) ) ( not ( = ?auto_606614 ?auto_606619 ) ) ( not ( = ?auto_606614 ?auto_606620 ) ) ( not ( = ?auto_606614 ?auto_606621 ) ) ( not ( = ?auto_606614 ?auto_606622 ) ) ( not ( = ?auto_606614 ?auto_606623 ) ) ( not ( = ?auto_606615 ?auto_606616 ) ) ( not ( = ?auto_606615 ?auto_606617 ) ) ( not ( = ?auto_606615 ?auto_606618 ) ) ( not ( = ?auto_606615 ?auto_606619 ) ) ( not ( = ?auto_606615 ?auto_606620 ) ) ( not ( = ?auto_606615 ?auto_606621 ) ) ( not ( = ?auto_606615 ?auto_606622 ) ) ( not ( = ?auto_606615 ?auto_606623 ) ) ( not ( = ?auto_606616 ?auto_606617 ) ) ( not ( = ?auto_606616 ?auto_606618 ) ) ( not ( = ?auto_606616 ?auto_606619 ) ) ( not ( = ?auto_606616 ?auto_606620 ) ) ( not ( = ?auto_606616 ?auto_606621 ) ) ( not ( = ?auto_606616 ?auto_606622 ) ) ( not ( = ?auto_606616 ?auto_606623 ) ) ( not ( = ?auto_606617 ?auto_606618 ) ) ( not ( = ?auto_606617 ?auto_606619 ) ) ( not ( = ?auto_606617 ?auto_606620 ) ) ( not ( = ?auto_606617 ?auto_606621 ) ) ( not ( = ?auto_606617 ?auto_606622 ) ) ( not ( = ?auto_606617 ?auto_606623 ) ) ( not ( = ?auto_606618 ?auto_606619 ) ) ( not ( = ?auto_606618 ?auto_606620 ) ) ( not ( = ?auto_606618 ?auto_606621 ) ) ( not ( = ?auto_606618 ?auto_606622 ) ) ( not ( = ?auto_606618 ?auto_606623 ) ) ( not ( = ?auto_606619 ?auto_606620 ) ) ( not ( = ?auto_606619 ?auto_606621 ) ) ( not ( = ?auto_606619 ?auto_606622 ) ) ( not ( = ?auto_606619 ?auto_606623 ) ) ( not ( = ?auto_606620 ?auto_606621 ) ) ( not ( = ?auto_606620 ?auto_606622 ) ) ( not ( = ?auto_606620 ?auto_606623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606621 ?auto_606622 ?auto_606623 )
      ( MAKE-9CRATE-VERIFY ?auto_606614 ?auto_606615 ?auto_606616 ?auto_606617 ?auto_606618 ?auto_606619 ?auto_606620 ?auto_606621 ?auto_606622 ?auto_606623 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606713 - SURFACE
      ?auto_606714 - SURFACE
      ?auto_606715 - SURFACE
      ?auto_606716 - SURFACE
      ?auto_606717 - SURFACE
      ?auto_606718 - SURFACE
      ?auto_606719 - SURFACE
      ?auto_606720 - SURFACE
      ?auto_606721 - SURFACE
      ?auto_606722 - SURFACE
    )
    :vars
    (
      ?auto_606727 - HOIST
      ?auto_606725 - PLACE
      ?auto_606724 - TRUCK
      ?auto_606726 - PLACE
      ?auto_606723 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_606727 ?auto_606725 ) ( SURFACE-AT ?auto_606721 ?auto_606725 ) ( CLEAR ?auto_606721 ) ( IS-CRATE ?auto_606722 ) ( not ( = ?auto_606721 ?auto_606722 ) ) ( AVAILABLE ?auto_606727 ) ( ON ?auto_606721 ?auto_606720 ) ( not ( = ?auto_606720 ?auto_606721 ) ) ( not ( = ?auto_606720 ?auto_606722 ) ) ( TRUCK-AT ?auto_606724 ?auto_606726 ) ( not ( = ?auto_606726 ?auto_606725 ) ) ( HOIST-AT ?auto_606723 ?auto_606726 ) ( LIFTING ?auto_606723 ?auto_606722 ) ( not ( = ?auto_606727 ?auto_606723 ) ) ( ON ?auto_606714 ?auto_606713 ) ( ON ?auto_606715 ?auto_606714 ) ( ON ?auto_606716 ?auto_606715 ) ( ON ?auto_606717 ?auto_606716 ) ( ON ?auto_606718 ?auto_606717 ) ( ON ?auto_606719 ?auto_606718 ) ( ON ?auto_606720 ?auto_606719 ) ( not ( = ?auto_606713 ?auto_606714 ) ) ( not ( = ?auto_606713 ?auto_606715 ) ) ( not ( = ?auto_606713 ?auto_606716 ) ) ( not ( = ?auto_606713 ?auto_606717 ) ) ( not ( = ?auto_606713 ?auto_606718 ) ) ( not ( = ?auto_606713 ?auto_606719 ) ) ( not ( = ?auto_606713 ?auto_606720 ) ) ( not ( = ?auto_606713 ?auto_606721 ) ) ( not ( = ?auto_606713 ?auto_606722 ) ) ( not ( = ?auto_606714 ?auto_606715 ) ) ( not ( = ?auto_606714 ?auto_606716 ) ) ( not ( = ?auto_606714 ?auto_606717 ) ) ( not ( = ?auto_606714 ?auto_606718 ) ) ( not ( = ?auto_606714 ?auto_606719 ) ) ( not ( = ?auto_606714 ?auto_606720 ) ) ( not ( = ?auto_606714 ?auto_606721 ) ) ( not ( = ?auto_606714 ?auto_606722 ) ) ( not ( = ?auto_606715 ?auto_606716 ) ) ( not ( = ?auto_606715 ?auto_606717 ) ) ( not ( = ?auto_606715 ?auto_606718 ) ) ( not ( = ?auto_606715 ?auto_606719 ) ) ( not ( = ?auto_606715 ?auto_606720 ) ) ( not ( = ?auto_606715 ?auto_606721 ) ) ( not ( = ?auto_606715 ?auto_606722 ) ) ( not ( = ?auto_606716 ?auto_606717 ) ) ( not ( = ?auto_606716 ?auto_606718 ) ) ( not ( = ?auto_606716 ?auto_606719 ) ) ( not ( = ?auto_606716 ?auto_606720 ) ) ( not ( = ?auto_606716 ?auto_606721 ) ) ( not ( = ?auto_606716 ?auto_606722 ) ) ( not ( = ?auto_606717 ?auto_606718 ) ) ( not ( = ?auto_606717 ?auto_606719 ) ) ( not ( = ?auto_606717 ?auto_606720 ) ) ( not ( = ?auto_606717 ?auto_606721 ) ) ( not ( = ?auto_606717 ?auto_606722 ) ) ( not ( = ?auto_606718 ?auto_606719 ) ) ( not ( = ?auto_606718 ?auto_606720 ) ) ( not ( = ?auto_606718 ?auto_606721 ) ) ( not ( = ?auto_606718 ?auto_606722 ) ) ( not ( = ?auto_606719 ?auto_606720 ) ) ( not ( = ?auto_606719 ?auto_606721 ) ) ( not ( = ?auto_606719 ?auto_606722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606720 ?auto_606721 ?auto_606722 )
      ( MAKE-9CRATE-VERIFY ?auto_606713 ?auto_606714 ?auto_606715 ?auto_606716 ?auto_606717 ?auto_606718 ?auto_606719 ?auto_606720 ?auto_606721 ?auto_606722 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606821 - SURFACE
      ?auto_606822 - SURFACE
      ?auto_606823 - SURFACE
      ?auto_606824 - SURFACE
      ?auto_606825 - SURFACE
      ?auto_606826 - SURFACE
      ?auto_606827 - SURFACE
      ?auto_606828 - SURFACE
      ?auto_606829 - SURFACE
      ?auto_606830 - SURFACE
    )
    :vars
    (
      ?auto_606835 - HOIST
      ?auto_606834 - PLACE
      ?auto_606832 - TRUCK
      ?auto_606836 - PLACE
      ?auto_606831 - HOIST
      ?auto_606833 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_606835 ?auto_606834 ) ( SURFACE-AT ?auto_606829 ?auto_606834 ) ( CLEAR ?auto_606829 ) ( IS-CRATE ?auto_606830 ) ( not ( = ?auto_606829 ?auto_606830 ) ) ( AVAILABLE ?auto_606835 ) ( ON ?auto_606829 ?auto_606828 ) ( not ( = ?auto_606828 ?auto_606829 ) ) ( not ( = ?auto_606828 ?auto_606830 ) ) ( TRUCK-AT ?auto_606832 ?auto_606836 ) ( not ( = ?auto_606836 ?auto_606834 ) ) ( HOIST-AT ?auto_606831 ?auto_606836 ) ( not ( = ?auto_606835 ?auto_606831 ) ) ( AVAILABLE ?auto_606831 ) ( SURFACE-AT ?auto_606830 ?auto_606836 ) ( ON ?auto_606830 ?auto_606833 ) ( CLEAR ?auto_606830 ) ( not ( = ?auto_606829 ?auto_606833 ) ) ( not ( = ?auto_606830 ?auto_606833 ) ) ( not ( = ?auto_606828 ?auto_606833 ) ) ( ON ?auto_606822 ?auto_606821 ) ( ON ?auto_606823 ?auto_606822 ) ( ON ?auto_606824 ?auto_606823 ) ( ON ?auto_606825 ?auto_606824 ) ( ON ?auto_606826 ?auto_606825 ) ( ON ?auto_606827 ?auto_606826 ) ( ON ?auto_606828 ?auto_606827 ) ( not ( = ?auto_606821 ?auto_606822 ) ) ( not ( = ?auto_606821 ?auto_606823 ) ) ( not ( = ?auto_606821 ?auto_606824 ) ) ( not ( = ?auto_606821 ?auto_606825 ) ) ( not ( = ?auto_606821 ?auto_606826 ) ) ( not ( = ?auto_606821 ?auto_606827 ) ) ( not ( = ?auto_606821 ?auto_606828 ) ) ( not ( = ?auto_606821 ?auto_606829 ) ) ( not ( = ?auto_606821 ?auto_606830 ) ) ( not ( = ?auto_606821 ?auto_606833 ) ) ( not ( = ?auto_606822 ?auto_606823 ) ) ( not ( = ?auto_606822 ?auto_606824 ) ) ( not ( = ?auto_606822 ?auto_606825 ) ) ( not ( = ?auto_606822 ?auto_606826 ) ) ( not ( = ?auto_606822 ?auto_606827 ) ) ( not ( = ?auto_606822 ?auto_606828 ) ) ( not ( = ?auto_606822 ?auto_606829 ) ) ( not ( = ?auto_606822 ?auto_606830 ) ) ( not ( = ?auto_606822 ?auto_606833 ) ) ( not ( = ?auto_606823 ?auto_606824 ) ) ( not ( = ?auto_606823 ?auto_606825 ) ) ( not ( = ?auto_606823 ?auto_606826 ) ) ( not ( = ?auto_606823 ?auto_606827 ) ) ( not ( = ?auto_606823 ?auto_606828 ) ) ( not ( = ?auto_606823 ?auto_606829 ) ) ( not ( = ?auto_606823 ?auto_606830 ) ) ( not ( = ?auto_606823 ?auto_606833 ) ) ( not ( = ?auto_606824 ?auto_606825 ) ) ( not ( = ?auto_606824 ?auto_606826 ) ) ( not ( = ?auto_606824 ?auto_606827 ) ) ( not ( = ?auto_606824 ?auto_606828 ) ) ( not ( = ?auto_606824 ?auto_606829 ) ) ( not ( = ?auto_606824 ?auto_606830 ) ) ( not ( = ?auto_606824 ?auto_606833 ) ) ( not ( = ?auto_606825 ?auto_606826 ) ) ( not ( = ?auto_606825 ?auto_606827 ) ) ( not ( = ?auto_606825 ?auto_606828 ) ) ( not ( = ?auto_606825 ?auto_606829 ) ) ( not ( = ?auto_606825 ?auto_606830 ) ) ( not ( = ?auto_606825 ?auto_606833 ) ) ( not ( = ?auto_606826 ?auto_606827 ) ) ( not ( = ?auto_606826 ?auto_606828 ) ) ( not ( = ?auto_606826 ?auto_606829 ) ) ( not ( = ?auto_606826 ?auto_606830 ) ) ( not ( = ?auto_606826 ?auto_606833 ) ) ( not ( = ?auto_606827 ?auto_606828 ) ) ( not ( = ?auto_606827 ?auto_606829 ) ) ( not ( = ?auto_606827 ?auto_606830 ) ) ( not ( = ?auto_606827 ?auto_606833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606828 ?auto_606829 ?auto_606830 )
      ( MAKE-9CRATE-VERIFY ?auto_606821 ?auto_606822 ?auto_606823 ?auto_606824 ?auto_606825 ?auto_606826 ?auto_606827 ?auto_606828 ?auto_606829 ?auto_606830 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_606930 - SURFACE
      ?auto_606931 - SURFACE
      ?auto_606932 - SURFACE
      ?auto_606933 - SURFACE
      ?auto_606934 - SURFACE
      ?auto_606935 - SURFACE
      ?auto_606936 - SURFACE
      ?auto_606937 - SURFACE
      ?auto_606938 - SURFACE
      ?auto_606939 - SURFACE
    )
    :vars
    (
      ?auto_606943 - HOIST
      ?auto_606942 - PLACE
      ?auto_606940 - PLACE
      ?auto_606945 - HOIST
      ?auto_606944 - SURFACE
      ?auto_606941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_606943 ?auto_606942 ) ( SURFACE-AT ?auto_606938 ?auto_606942 ) ( CLEAR ?auto_606938 ) ( IS-CRATE ?auto_606939 ) ( not ( = ?auto_606938 ?auto_606939 ) ) ( AVAILABLE ?auto_606943 ) ( ON ?auto_606938 ?auto_606937 ) ( not ( = ?auto_606937 ?auto_606938 ) ) ( not ( = ?auto_606937 ?auto_606939 ) ) ( not ( = ?auto_606940 ?auto_606942 ) ) ( HOIST-AT ?auto_606945 ?auto_606940 ) ( not ( = ?auto_606943 ?auto_606945 ) ) ( AVAILABLE ?auto_606945 ) ( SURFACE-AT ?auto_606939 ?auto_606940 ) ( ON ?auto_606939 ?auto_606944 ) ( CLEAR ?auto_606939 ) ( not ( = ?auto_606938 ?auto_606944 ) ) ( not ( = ?auto_606939 ?auto_606944 ) ) ( not ( = ?auto_606937 ?auto_606944 ) ) ( TRUCK-AT ?auto_606941 ?auto_606942 ) ( ON ?auto_606931 ?auto_606930 ) ( ON ?auto_606932 ?auto_606931 ) ( ON ?auto_606933 ?auto_606932 ) ( ON ?auto_606934 ?auto_606933 ) ( ON ?auto_606935 ?auto_606934 ) ( ON ?auto_606936 ?auto_606935 ) ( ON ?auto_606937 ?auto_606936 ) ( not ( = ?auto_606930 ?auto_606931 ) ) ( not ( = ?auto_606930 ?auto_606932 ) ) ( not ( = ?auto_606930 ?auto_606933 ) ) ( not ( = ?auto_606930 ?auto_606934 ) ) ( not ( = ?auto_606930 ?auto_606935 ) ) ( not ( = ?auto_606930 ?auto_606936 ) ) ( not ( = ?auto_606930 ?auto_606937 ) ) ( not ( = ?auto_606930 ?auto_606938 ) ) ( not ( = ?auto_606930 ?auto_606939 ) ) ( not ( = ?auto_606930 ?auto_606944 ) ) ( not ( = ?auto_606931 ?auto_606932 ) ) ( not ( = ?auto_606931 ?auto_606933 ) ) ( not ( = ?auto_606931 ?auto_606934 ) ) ( not ( = ?auto_606931 ?auto_606935 ) ) ( not ( = ?auto_606931 ?auto_606936 ) ) ( not ( = ?auto_606931 ?auto_606937 ) ) ( not ( = ?auto_606931 ?auto_606938 ) ) ( not ( = ?auto_606931 ?auto_606939 ) ) ( not ( = ?auto_606931 ?auto_606944 ) ) ( not ( = ?auto_606932 ?auto_606933 ) ) ( not ( = ?auto_606932 ?auto_606934 ) ) ( not ( = ?auto_606932 ?auto_606935 ) ) ( not ( = ?auto_606932 ?auto_606936 ) ) ( not ( = ?auto_606932 ?auto_606937 ) ) ( not ( = ?auto_606932 ?auto_606938 ) ) ( not ( = ?auto_606932 ?auto_606939 ) ) ( not ( = ?auto_606932 ?auto_606944 ) ) ( not ( = ?auto_606933 ?auto_606934 ) ) ( not ( = ?auto_606933 ?auto_606935 ) ) ( not ( = ?auto_606933 ?auto_606936 ) ) ( not ( = ?auto_606933 ?auto_606937 ) ) ( not ( = ?auto_606933 ?auto_606938 ) ) ( not ( = ?auto_606933 ?auto_606939 ) ) ( not ( = ?auto_606933 ?auto_606944 ) ) ( not ( = ?auto_606934 ?auto_606935 ) ) ( not ( = ?auto_606934 ?auto_606936 ) ) ( not ( = ?auto_606934 ?auto_606937 ) ) ( not ( = ?auto_606934 ?auto_606938 ) ) ( not ( = ?auto_606934 ?auto_606939 ) ) ( not ( = ?auto_606934 ?auto_606944 ) ) ( not ( = ?auto_606935 ?auto_606936 ) ) ( not ( = ?auto_606935 ?auto_606937 ) ) ( not ( = ?auto_606935 ?auto_606938 ) ) ( not ( = ?auto_606935 ?auto_606939 ) ) ( not ( = ?auto_606935 ?auto_606944 ) ) ( not ( = ?auto_606936 ?auto_606937 ) ) ( not ( = ?auto_606936 ?auto_606938 ) ) ( not ( = ?auto_606936 ?auto_606939 ) ) ( not ( = ?auto_606936 ?auto_606944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_606937 ?auto_606938 ?auto_606939 )
      ( MAKE-9CRATE-VERIFY ?auto_606930 ?auto_606931 ?auto_606932 ?auto_606933 ?auto_606934 ?auto_606935 ?auto_606936 ?auto_606937 ?auto_606938 ?auto_606939 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_607039 - SURFACE
      ?auto_607040 - SURFACE
      ?auto_607041 - SURFACE
      ?auto_607042 - SURFACE
      ?auto_607043 - SURFACE
      ?auto_607044 - SURFACE
      ?auto_607045 - SURFACE
      ?auto_607046 - SURFACE
      ?auto_607047 - SURFACE
      ?auto_607048 - SURFACE
    )
    :vars
    (
      ?auto_607049 - HOIST
      ?auto_607053 - PLACE
      ?auto_607052 - PLACE
      ?auto_607050 - HOIST
      ?auto_607051 - SURFACE
      ?auto_607054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_607049 ?auto_607053 ) ( IS-CRATE ?auto_607048 ) ( not ( = ?auto_607047 ?auto_607048 ) ) ( not ( = ?auto_607046 ?auto_607047 ) ) ( not ( = ?auto_607046 ?auto_607048 ) ) ( not ( = ?auto_607052 ?auto_607053 ) ) ( HOIST-AT ?auto_607050 ?auto_607052 ) ( not ( = ?auto_607049 ?auto_607050 ) ) ( AVAILABLE ?auto_607050 ) ( SURFACE-AT ?auto_607048 ?auto_607052 ) ( ON ?auto_607048 ?auto_607051 ) ( CLEAR ?auto_607048 ) ( not ( = ?auto_607047 ?auto_607051 ) ) ( not ( = ?auto_607048 ?auto_607051 ) ) ( not ( = ?auto_607046 ?auto_607051 ) ) ( TRUCK-AT ?auto_607054 ?auto_607053 ) ( SURFACE-AT ?auto_607046 ?auto_607053 ) ( CLEAR ?auto_607046 ) ( LIFTING ?auto_607049 ?auto_607047 ) ( IS-CRATE ?auto_607047 ) ( ON ?auto_607040 ?auto_607039 ) ( ON ?auto_607041 ?auto_607040 ) ( ON ?auto_607042 ?auto_607041 ) ( ON ?auto_607043 ?auto_607042 ) ( ON ?auto_607044 ?auto_607043 ) ( ON ?auto_607045 ?auto_607044 ) ( ON ?auto_607046 ?auto_607045 ) ( not ( = ?auto_607039 ?auto_607040 ) ) ( not ( = ?auto_607039 ?auto_607041 ) ) ( not ( = ?auto_607039 ?auto_607042 ) ) ( not ( = ?auto_607039 ?auto_607043 ) ) ( not ( = ?auto_607039 ?auto_607044 ) ) ( not ( = ?auto_607039 ?auto_607045 ) ) ( not ( = ?auto_607039 ?auto_607046 ) ) ( not ( = ?auto_607039 ?auto_607047 ) ) ( not ( = ?auto_607039 ?auto_607048 ) ) ( not ( = ?auto_607039 ?auto_607051 ) ) ( not ( = ?auto_607040 ?auto_607041 ) ) ( not ( = ?auto_607040 ?auto_607042 ) ) ( not ( = ?auto_607040 ?auto_607043 ) ) ( not ( = ?auto_607040 ?auto_607044 ) ) ( not ( = ?auto_607040 ?auto_607045 ) ) ( not ( = ?auto_607040 ?auto_607046 ) ) ( not ( = ?auto_607040 ?auto_607047 ) ) ( not ( = ?auto_607040 ?auto_607048 ) ) ( not ( = ?auto_607040 ?auto_607051 ) ) ( not ( = ?auto_607041 ?auto_607042 ) ) ( not ( = ?auto_607041 ?auto_607043 ) ) ( not ( = ?auto_607041 ?auto_607044 ) ) ( not ( = ?auto_607041 ?auto_607045 ) ) ( not ( = ?auto_607041 ?auto_607046 ) ) ( not ( = ?auto_607041 ?auto_607047 ) ) ( not ( = ?auto_607041 ?auto_607048 ) ) ( not ( = ?auto_607041 ?auto_607051 ) ) ( not ( = ?auto_607042 ?auto_607043 ) ) ( not ( = ?auto_607042 ?auto_607044 ) ) ( not ( = ?auto_607042 ?auto_607045 ) ) ( not ( = ?auto_607042 ?auto_607046 ) ) ( not ( = ?auto_607042 ?auto_607047 ) ) ( not ( = ?auto_607042 ?auto_607048 ) ) ( not ( = ?auto_607042 ?auto_607051 ) ) ( not ( = ?auto_607043 ?auto_607044 ) ) ( not ( = ?auto_607043 ?auto_607045 ) ) ( not ( = ?auto_607043 ?auto_607046 ) ) ( not ( = ?auto_607043 ?auto_607047 ) ) ( not ( = ?auto_607043 ?auto_607048 ) ) ( not ( = ?auto_607043 ?auto_607051 ) ) ( not ( = ?auto_607044 ?auto_607045 ) ) ( not ( = ?auto_607044 ?auto_607046 ) ) ( not ( = ?auto_607044 ?auto_607047 ) ) ( not ( = ?auto_607044 ?auto_607048 ) ) ( not ( = ?auto_607044 ?auto_607051 ) ) ( not ( = ?auto_607045 ?auto_607046 ) ) ( not ( = ?auto_607045 ?auto_607047 ) ) ( not ( = ?auto_607045 ?auto_607048 ) ) ( not ( = ?auto_607045 ?auto_607051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_607046 ?auto_607047 ?auto_607048 )
      ( MAKE-9CRATE-VERIFY ?auto_607039 ?auto_607040 ?auto_607041 ?auto_607042 ?auto_607043 ?auto_607044 ?auto_607045 ?auto_607046 ?auto_607047 ?auto_607048 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_607148 - SURFACE
      ?auto_607149 - SURFACE
      ?auto_607150 - SURFACE
      ?auto_607151 - SURFACE
      ?auto_607152 - SURFACE
      ?auto_607153 - SURFACE
      ?auto_607154 - SURFACE
      ?auto_607155 - SURFACE
      ?auto_607156 - SURFACE
      ?auto_607157 - SURFACE
    )
    :vars
    (
      ?auto_607160 - HOIST
      ?auto_607161 - PLACE
      ?auto_607163 - PLACE
      ?auto_607159 - HOIST
      ?auto_607162 - SURFACE
      ?auto_607158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_607160 ?auto_607161 ) ( IS-CRATE ?auto_607157 ) ( not ( = ?auto_607156 ?auto_607157 ) ) ( not ( = ?auto_607155 ?auto_607156 ) ) ( not ( = ?auto_607155 ?auto_607157 ) ) ( not ( = ?auto_607163 ?auto_607161 ) ) ( HOIST-AT ?auto_607159 ?auto_607163 ) ( not ( = ?auto_607160 ?auto_607159 ) ) ( AVAILABLE ?auto_607159 ) ( SURFACE-AT ?auto_607157 ?auto_607163 ) ( ON ?auto_607157 ?auto_607162 ) ( CLEAR ?auto_607157 ) ( not ( = ?auto_607156 ?auto_607162 ) ) ( not ( = ?auto_607157 ?auto_607162 ) ) ( not ( = ?auto_607155 ?auto_607162 ) ) ( TRUCK-AT ?auto_607158 ?auto_607161 ) ( SURFACE-AT ?auto_607155 ?auto_607161 ) ( CLEAR ?auto_607155 ) ( IS-CRATE ?auto_607156 ) ( AVAILABLE ?auto_607160 ) ( IN ?auto_607156 ?auto_607158 ) ( ON ?auto_607149 ?auto_607148 ) ( ON ?auto_607150 ?auto_607149 ) ( ON ?auto_607151 ?auto_607150 ) ( ON ?auto_607152 ?auto_607151 ) ( ON ?auto_607153 ?auto_607152 ) ( ON ?auto_607154 ?auto_607153 ) ( ON ?auto_607155 ?auto_607154 ) ( not ( = ?auto_607148 ?auto_607149 ) ) ( not ( = ?auto_607148 ?auto_607150 ) ) ( not ( = ?auto_607148 ?auto_607151 ) ) ( not ( = ?auto_607148 ?auto_607152 ) ) ( not ( = ?auto_607148 ?auto_607153 ) ) ( not ( = ?auto_607148 ?auto_607154 ) ) ( not ( = ?auto_607148 ?auto_607155 ) ) ( not ( = ?auto_607148 ?auto_607156 ) ) ( not ( = ?auto_607148 ?auto_607157 ) ) ( not ( = ?auto_607148 ?auto_607162 ) ) ( not ( = ?auto_607149 ?auto_607150 ) ) ( not ( = ?auto_607149 ?auto_607151 ) ) ( not ( = ?auto_607149 ?auto_607152 ) ) ( not ( = ?auto_607149 ?auto_607153 ) ) ( not ( = ?auto_607149 ?auto_607154 ) ) ( not ( = ?auto_607149 ?auto_607155 ) ) ( not ( = ?auto_607149 ?auto_607156 ) ) ( not ( = ?auto_607149 ?auto_607157 ) ) ( not ( = ?auto_607149 ?auto_607162 ) ) ( not ( = ?auto_607150 ?auto_607151 ) ) ( not ( = ?auto_607150 ?auto_607152 ) ) ( not ( = ?auto_607150 ?auto_607153 ) ) ( not ( = ?auto_607150 ?auto_607154 ) ) ( not ( = ?auto_607150 ?auto_607155 ) ) ( not ( = ?auto_607150 ?auto_607156 ) ) ( not ( = ?auto_607150 ?auto_607157 ) ) ( not ( = ?auto_607150 ?auto_607162 ) ) ( not ( = ?auto_607151 ?auto_607152 ) ) ( not ( = ?auto_607151 ?auto_607153 ) ) ( not ( = ?auto_607151 ?auto_607154 ) ) ( not ( = ?auto_607151 ?auto_607155 ) ) ( not ( = ?auto_607151 ?auto_607156 ) ) ( not ( = ?auto_607151 ?auto_607157 ) ) ( not ( = ?auto_607151 ?auto_607162 ) ) ( not ( = ?auto_607152 ?auto_607153 ) ) ( not ( = ?auto_607152 ?auto_607154 ) ) ( not ( = ?auto_607152 ?auto_607155 ) ) ( not ( = ?auto_607152 ?auto_607156 ) ) ( not ( = ?auto_607152 ?auto_607157 ) ) ( not ( = ?auto_607152 ?auto_607162 ) ) ( not ( = ?auto_607153 ?auto_607154 ) ) ( not ( = ?auto_607153 ?auto_607155 ) ) ( not ( = ?auto_607153 ?auto_607156 ) ) ( not ( = ?auto_607153 ?auto_607157 ) ) ( not ( = ?auto_607153 ?auto_607162 ) ) ( not ( = ?auto_607154 ?auto_607155 ) ) ( not ( = ?auto_607154 ?auto_607156 ) ) ( not ( = ?auto_607154 ?auto_607157 ) ) ( not ( = ?auto_607154 ?auto_607162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_607155 ?auto_607156 ?auto_607157 )
      ( MAKE-9CRATE-VERIFY ?auto_607148 ?auto_607149 ?auto_607150 ?auto_607151 ?auto_607152 ?auto_607153 ?auto_607154 ?auto_607155 ?auto_607156 ?auto_607157 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612698 - SURFACE
      ?auto_612699 - SURFACE
      ?auto_612700 - SURFACE
      ?auto_612701 - SURFACE
      ?auto_612702 - SURFACE
      ?auto_612703 - SURFACE
      ?auto_612704 - SURFACE
      ?auto_612705 - SURFACE
      ?auto_612706 - SURFACE
      ?auto_612707 - SURFACE
      ?auto_612708 - SURFACE
    )
    :vars
    (
      ?auto_612709 - HOIST
      ?auto_612710 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_612709 ?auto_612710 ) ( SURFACE-AT ?auto_612707 ?auto_612710 ) ( CLEAR ?auto_612707 ) ( LIFTING ?auto_612709 ?auto_612708 ) ( IS-CRATE ?auto_612708 ) ( not ( = ?auto_612707 ?auto_612708 ) ) ( ON ?auto_612699 ?auto_612698 ) ( ON ?auto_612700 ?auto_612699 ) ( ON ?auto_612701 ?auto_612700 ) ( ON ?auto_612702 ?auto_612701 ) ( ON ?auto_612703 ?auto_612702 ) ( ON ?auto_612704 ?auto_612703 ) ( ON ?auto_612705 ?auto_612704 ) ( ON ?auto_612706 ?auto_612705 ) ( ON ?auto_612707 ?auto_612706 ) ( not ( = ?auto_612698 ?auto_612699 ) ) ( not ( = ?auto_612698 ?auto_612700 ) ) ( not ( = ?auto_612698 ?auto_612701 ) ) ( not ( = ?auto_612698 ?auto_612702 ) ) ( not ( = ?auto_612698 ?auto_612703 ) ) ( not ( = ?auto_612698 ?auto_612704 ) ) ( not ( = ?auto_612698 ?auto_612705 ) ) ( not ( = ?auto_612698 ?auto_612706 ) ) ( not ( = ?auto_612698 ?auto_612707 ) ) ( not ( = ?auto_612698 ?auto_612708 ) ) ( not ( = ?auto_612699 ?auto_612700 ) ) ( not ( = ?auto_612699 ?auto_612701 ) ) ( not ( = ?auto_612699 ?auto_612702 ) ) ( not ( = ?auto_612699 ?auto_612703 ) ) ( not ( = ?auto_612699 ?auto_612704 ) ) ( not ( = ?auto_612699 ?auto_612705 ) ) ( not ( = ?auto_612699 ?auto_612706 ) ) ( not ( = ?auto_612699 ?auto_612707 ) ) ( not ( = ?auto_612699 ?auto_612708 ) ) ( not ( = ?auto_612700 ?auto_612701 ) ) ( not ( = ?auto_612700 ?auto_612702 ) ) ( not ( = ?auto_612700 ?auto_612703 ) ) ( not ( = ?auto_612700 ?auto_612704 ) ) ( not ( = ?auto_612700 ?auto_612705 ) ) ( not ( = ?auto_612700 ?auto_612706 ) ) ( not ( = ?auto_612700 ?auto_612707 ) ) ( not ( = ?auto_612700 ?auto_612708 ) ) ( not ( = ?auto_612701 ?auto_612702 ) ) ( not ( = ?auto_612701 ?auto_612703 ) ) ( not ( = ?auto_612701 ?auto_612704 ) ) ( not ( = ?auto_612701 ?auto_612705 ) ) ( not ( = ?auto_612701 ?auto_612706 ) ) ( not ( = ?auto_612701 ?auto_612707 ) ) ( not ( = ?auto_612701 ?auto_612708 ) ) ( not ( = ?auto_612702 ?auto_612703 ) ) ( not ( = ?auto_612702 ?auto_612704 ) ) ( not ( = ?auto_612702 ?auto_612705 ) ) ( not ( = ?auto_612702 ?auto_612706 ) ) ( not ( = ?auto_612702 ?auto_612707 ) ) ( not ( = ?auto_612702 ?auto_612708 ) ) ( not ( = ?auto_612703 ?auto_612704 ) ) ( not ( = ?auto_612703 ?auto_612705 ) ) ( not ( = ?auto_612703 ?auto_612706 ) ) ( not ( = ?auto_612703 ?auto_612707 ) ) ( not ( = ?auto_612703 ?auto_612708 ) ) ( not ( = ?auto_612704 ?auto_612705 ) ) ( not ( = ?auto_612704 ?auto_612706 ) ) ( not ( = ?auto_612704 ?auto_612707 ) ) ( not ( = ?auto_612704 ?auto_612708 ) ) ( not ( = ?auto_612705 ?auto_612706 ) ) ( not ( = ?auto_612705 ?auto_612707 ) ) ( not ( = ?auto_612705 ?auto_612708 ) ) ( not ( = ?auto_612706 ?auto_612707 ) ) ( not ( = ?auto_612706 ?auto_612708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_612707 ?auto_612708 )
      ( MAKE-10CRATE-VERIFY ?auto_612698 ?auto_612699 ?auto_612700 ?auto_612701 ?auto_612702 ?auto_612703 ?auto_612704 ?auto_612705 ?auto_612706 ?auto_612707 ?auto_612708 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612792 - SURFACE
      ?auto_612793 - SURFACE
      ?auto_612794 - SURFACE
      ?auto_612795 - SURFACE
      ?auto_612796 - SURFACE
      ?auto_612797 - SURFACE
      ?auto_612798 - SURFACE
      ?auto_612799 - SURFACE
      ?auto_612800 - SURFACE
      ?auto_612801 - SURFACE
      ?auto_612802 - SURFACE
    )
    :vars
    (
      ?auto_612804 - HOIST
      ?auto_612803 - PLACE
      ?auto_612805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612804 ?auto_612803 ) ( SURFACE-AT ?auto_612801 ?auto_612803 ) ( CLEAR ?auto_612801 ) ( IS-CRATE ?auto_612802 ) ( not ( = ?auto_612801 ?auto_612802 ) ) ( TRUCK-AT ?auto_612805 ?auto_612803 ) ( AVAILABLE ?auto_612804 ) ( IN ?auto_612802 ?auto_612805 ) ( ON ?auto_612801 ?auto_612800 ) ( not ( = ?auto_612800 ?auto_612801 ) ) ( not ( = ?auto_612800 ?auto_612802 ) ) ( ON ?auto_612793 ?auto_612792 ) ( ON ?auto_612794 ?auto_612793 ) ( ON ?auto_612795 ?auto_612794 ) ( ON ?auto_612796 ?auto_612795 ) ( ON ?auto_612797 ?auto_612796 ) ( ON ?auto_612798 ?auto_612797 ) ( ON ?auto_612799 ?auto_612798 ) ( ON ?auto_612800 ?auto_612799 ) ( not ( = ?auto_612792 ?auto_612793 ) ) ( not ( = ?auto_612792 ?auto_612794 ) ) ( not ( = ?auto_612792 ?auto_612795 ) ) ( not ( = ?auto_612792 ?auto_612796 ) ) ( not ( = ?auto_612792 ?auto_612797 ) ) ( not ( = ?auto_612792 ?auto_612798 ) ) ( not ( = ?auto_612792 ?auto_612799 ) ) ( not ( = ?auto_612792 ?auto_612800 ) ) ( not ( = ?auto_612792 ?auto_612801 ) ) ( not ( = ?auto_612792 ?auto_612802 ) ) ( not ( = ?auto_612793 ?auto_612794 ) ) ( not ( = ?auto_612793 ?auto_612795 ) ) ( not ( = ?auto_612793 ?auto_612796 ) ) ( not ( = ?auto_612793 ?auto_612797 ) ) ( not ( = ?auto_612793 ?auto_612798 ) ) ( not ( = ?auto_612793 ?auto_612799 ) ) ( not ( = ?auto_612793 ?auto_612800 ) ) ( not ( = ?auto_612793 ?auto_612801 ) ) ( not ( = ?auto_612793 ?auto_612802 ) ) ( not ( = ?auto_612794 ?auto_612795 ) ) ( not ( = ?auto_612794 ?auto_612796 ) ) ( not ( = ?auto_612794 ?auto_612797 ) ) ( not ( = ?auto_612794 ?auto_612798 ) ) ( not ( = ?auto_612794 ?auto_612799 ) ) ( not ( = ?auto_612794 ?auto_612800 ) ) ( not ( = ?auto_612794 ?auto_612801 ) ) ( not ( = ?auto_612794 ?auto_612802 ) ) ( not ( = ?auto_612795 ?auto_612796 ) ) ( not ( = ?auto_612795 ?auto_612797 ) ) ( not ( = ?auto_612795 ?auto_612798 ) ) ( not ( = ?auto_612795 ?auto_612799 ) ) ( not ( = ?auto_612795 ?auto_612800 ) ) ( not ( = ?auto_612795 ?auto_612801 ) ) ( not ( = ?auto_612795 ?auto_612802 ) ) ( not ( = ?auto_612796 ?auto_612797 ) ) ( not ( = ?auto_612796 ?auto_612798 ) ) ( not ( = ?auto_612796 ?auto_612799 ) ) ( not ( = ?auto_612796 ?auto_612800 ) ) ( not ( = ?auto_612796 ?auto_612801 ) ) ( not ( = ?auto_612796 ?auto_612802 ) ) ( not ( = ?auto_612797 ?auto_612798 ) ) ( not ( = ?auto_612797 ?auto_612799 ) ) ( not ( = ?auto_612797 ?auto_612800 ) ) ( not ( = ?auto_612797 ?auto_612801 ) ) ( not ( = ?auto_612797 ?auto_612802 ) ) ( not ( = ?auto_612798 ?auto_612799 ) ) ( not ( = ?auto_612798 ?auto_612800 ) ) ( not ( = ?auto_612798 ?auto_612801 ) ) ( not ( = ?auto_612798 ?auto_612802 ) ) ( not ( = ?auto_612799 ?auto_612800 ) ) ( not ( = ?auto_612799 ?auto_612801 ) ) ( not ( = ?auto_612799 ?auto_612802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612800 ?auto_612801 ?auto_612802 )
      ( MAKE-10CRATE-VERIFY ?auto_612792 ?auto_612793 ?auto_612794 ?auto_612795 ?auto_612796 ?auto_612797 ?auto_612798 ?auto_612799 ?auto_612800 ?auto_612801 ?auto_612802 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_612897 - SURFACE
      ?auto_612898 - SURFACE
      ?auto_612899 - SURFACE
      ?auto_612900 - SURFACE
      ?auto_612901 - SURFACE
      ?auto_612902 - SURFACE
      ?auto_612903 - SURFACE
      ?auto_612904 - SURFACE
      ?auto_612905 - SURFACE
      ?auto_612906 - SURFACE
      ?auto_612907 - SURFACE
    )
    :vars
    (
      ?auto_612910 - HOIST
      ?auto_612908 - PLACE
      ?auto_612909 - TRUCK
      ?auto_612911 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_612910 ?auto_612908 ) ( SURFACE-AT ?auto_612906 ?auto_612908 ) ( CLEAR ?auto_612906 ) ( IS-CRATE ?auto_612907 ) ( not ( = ?auto_612906 ?auto_612907 ) ) ( AVAILABLE ?auto_612910 ) ( IN ?auto_612907 ?auto_612909 ) ( ON ?auto_612906 ?auto_612905 ) ( not ( = ?auto_612905 ?auto_612906 ) ) ( not ( = ?auto_612905 ?auto_612907 ) ) ( TRUCK-AT ?auto_612909 ?auto_612911 ) ( not ( = ?auto_612911 ?auto_612908 ) ) ( ON ?auto_612898 ?auto_612897 ) ( ON ?auto_612899 ?auto_612898 ) ( ON ?auto_612900 ?auto_612899 ) ( ON ?auto_612901 ?auto_612900 ) ( ON ?auto_612902 ?auto_612901 ) ( ON ?auto_612903 ?auto_612902 ) ( ON ?auto_612904 ?auto_612903 ) ( ON ?auto_612905 ?auto_612904 ) ( not ( = ?auto_612897 ?auto_612898 ) ) ( not ( = ?auto_612897 ?auto_612899 ) ) ( not ( = ?auto_612897 ?auto_612900 ) ) ( not ( = ?auto_612897 ?auto_612901 ) ) ( not ( = ?auto_612897 ?auto_612902 ) ) ( not ( = ?auto_612897 ?auto_612903 ) ) ( not ( = ?auto_612897 ?auto_612904 ) ) ( not ( = ?auto_612897 ?auto_612905 ) ) ( not ( = ?auto_612897 ?auto_612906 ) ) ( not ( = ?auto_612897 ?auto_612907 ) ) ( not ( = ?auto_612898 ?auto_612899 ) ) ( not ( = ?auto_612898 ?auto_612900 ) ) ( not ( = ?auto_612898 ?auto_612901 ) ) ( not ( = ?auto_612898 ?auto_612902 ) ) ( not ( = ?auto_612898 ?auto_612903 ) ) ( not ( = ?auto_612898 ?auto_612904 ) ) ( not ( = ?auto_612898 ?auto_612905 ) ) ( not ( = ?auto_612898 ?auto_612906 ) ) ( not ( = ?auto_612898 ?auto_612907 ) ) ( not ( = ?auto_612899 ?auto_612900 ) ) ( not ( = ?auto_612899 ?auto_612901 ) ) ( not ( = ?auto_612899 ?auto_612902 ) ) ( not ( = ?auto_612899 ?auto_612903 ) ) ( not ( = ?auto_612899 ?auto_612904 ) ) ( not ( = ?auto_612899 ?auto_612905 ) ) ( not ( = ?auto_612899 ?auto_612906 ) ) ( not ( = ?auto_612899 ?auto_612907 ) ) ( not ( = ?auto_612900 ?auto_612901 ) ) ( not ( = ?auto_612900 ?auto_612902 ) ) ( not ( = ?auto_612900 ?auto_612903 ) ) ( not ( = ?auto_612900 ?auto_612904 ) ) ( not ( = ?auto_612900 ?auto_612905 ) ) ( not ( = ?auto_612900 ?auto_612906 ) ) ( not ( = ?auto_612900 ?auto_612907 ) ) ( not ( = ?auto_612901 ?auto_612902 ) ) ( not ( = ?auto_612901 ?auto_612903 ) ) ( not ( = ?auto_612901 ?auto_612904 ) ) ( not ( = ?auto_612901 ?auto_612905 ) ) ( not ( = ?auto_612901 ?auto_612906 ) ) ( not ( = ?auto_612901 ?auto_612907 ) ) ( not ( = ?auto_612902 ?auto_612903 ) ) ( not ( = ?auto_612902 ?auto_612904 ) ) ( not ( = ?auto_612902 ?auto_612905 ) ) ( not ( = ?auto_612902 ?auto_612906 ) ) ( not ( = ?auto_612902 ?auto_612907 ) ) ( not ( = ?auto_612903 ?auto_612904 ) ) ( not ( = ?auto_612903 ?auto_612905 ) ) ( not ( = ?auto_612903 ?auto_612906 ) ) ( not ( = ?auto_612903 ?auto_612907 ) ) ( not ( = ?auto_612904 ?auto_612905 ) ) ( not ( = ?auto_612904 ?auto_612906 ) ) ( not ( = ?auto_612904 ?auto_612907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_612905 ?auto_612906 ?auto_612907 )
      ( MAKE-10CRATE-VERIFY ?auto_612897 ?auto_612898 ?auto_612899 ?auto_612900 ?auto_612901 ?auto_612902 ?auto_612903 ?auto_612904 ?auto_612905 ?auto_612906 ?auto_612907 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613012 - SURFACE
      ?auto_613013 - SURFACE
      ?auto_613014 - SURFACE
      ?auto_613015 - SURFACE
      ?auto_613016 - SURFACE
      ?auto_613017 - SURFACE
      ?auto_613018 - SURFACE
      ?auto_613019 - SURFACE
      ?auto_613020 - SURFACE
      ?auto_613021 - SURFACE
      ?auto_613022 - SURFACE
    )
    :vars
    (
      ?auto_613024 - HOIST
      ?auto_613023 - PLACE
      ?auto_613027 - TRUCK
      ?auto_613026 - PLACE
      ?auto_613025 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_613024 ?auto_613023 ) ( SURFACE-AT ?auto_613021 ?auto_613023 ) ( CLEAR ?auto_613021 ) ( IS-CRATE ?auto_613022 ) ( not ( = ?auto_613021 ?auto_613022 ) ) ( AVAILABLE ?auto_613024 ) ( ON ?auto_613021 ?auto_613020 ) ( not ( = ?auto_613020 ?auto_613021 ) ) ( not ( = ?auto_613020 ?auto_613022 ) ) ( TRUCK-AT ?auto_613027 ?auto_613026 ) ( not ( = ?auto_613026 ?auto_613023 ) ) ( HOIST-AT ?auto_613025 ?auto_613026 ) ( LIFTING ?auto_613025 ?auto_613022 ) ( not ( = ?auto_613024 ?auto_613025 ) ) ( ON ?auto_613013 ?auto_613012 ) ( ON ?auto_613014 ?auto_613013 ) ( ON ?auto_613015 ?auto_613014 ) ( ON ?auto_613016 ?auto_613015 ) ( ON ?auto_613017 ?auto_613016 ) ( ON ?auto_613018 ?auto_613017 ) ( ON ?auto_613019 ?auto_613018 ) ( ON ?auto_613020 ?auto_613019 ) ( not ( = ?auto_613012 ?auto_613013 ) ) ( not ( = ?auto_613012 ?auto_613014 ) ) ( not ( = ?auto_613012 ?auto_613015 ) ) ( not ( = ?auto_613012 ?auto_613016 ) ) ( not ( = ?auto_613012 ?auto_613017 ) ) ( not ( = ?auto_613012 ?auto_613018 ) ) ( not ( = ?auto_613012 ?auto_613019 ) ) ( not ( = ?auto_613012 ?auto_613020 ) ) ( not ( = ?auto_613012 ?auto_613021 ) ) ( not ( = ?auto_613012 ?auto_613022 ) ) ( not ( = ?auto_613013 ?auto_613014 ) ) ( not ( = ?auto_613013 ?auto_613015 ) ) ( not ( = ?auto_613013 ?auto_613016 ) ) ( not ( = ?auto_613013 ?auto_613017 ) ) ( not ( = ?auto_613013 ?auto_613018 ) ) ( not ( = ?auto_613013 ?auto_613019 ) ) ( not ( = ?auto_613013 ?auto_613020 ) ) ( not ( = ?auto_613013 ?auto_613021 ) ) ( not ( = ?auto_613013 ?auto_613022 ) ) ( not ( = ?auto_613014 ?auto_613015 ) ) ( not ( = ?auto_613014 ?auto_613016 ) ) ( not ( = ?auto_613014 ?auto_613017 ) ) ( not ( = ?auto_613014 ?auto_613018 ) ) ( not ( = ?auto_613014 ?auto_613019 ) ) ( not ( = ?auto_613014 ?auto_613020 ) ) ( not ( = ?auto_613014 ?auto_613021 ) ) ( not ( = ?auto_613014 ?auto_613022 ) ) ( not ( = ?auto_613015 ?auto_613016 ) ) ( not ( = ?auto_613015 ?auto_613017 ) ) ( not ( = ?auto_613015 ?auto_613018 ) ) ( not ( = ?auto_613015 ?auto_613019 ) ) ( not ( = ?auto_613015 ?auto_613020 ) ) ( not ( = ?auto_613015 ?auto_613021 ) ) ( not ( = ?auto_613015 ?auto_613022 ) ) ( not ( = ?auto_613016 ?auto_613017 ) ) ( not ( = ?auto_613016 ?auto_613018 ) ) ( not ( = ?auto_613016 ?auto_613019 ) ) ( not ( = ?auto_613016 ?auto_613020 ) ) ( not ( = ?auto_613016 ?auto_613021 ) ) ( not ( = ?auto_613016 ?auto_613022 ) ) ( not ( = ?auto_613017 ?auto_613018 ) ) ( not ( = ?auto_613017 ?auto_613019 ) ) ( not ( = ?auto_613017 ?auto_613020 ) ) ( not ( = ?auto_613017 ?auto_613021 ) ) ( not ( = ?auto_613017 ?auto_613022 ) ) ( not ( = ?auto_613018 ?auto_613019 ) ) ( not ( = ?auto_613018 ?auto_613020 ) ) ( not ( = ?auto_613018 ?auto_613021 ) ) ( not ( = ?auto_613018 ?auto_613022 ) ) ( not ( = ?auto_613019 ?auto_613020 ) ) ( not ( = ?auto_613019 ?auto_613021 ) ) ( not ( = ?auto_613019 ?auto_613022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613020 ?auto_613021 ?auto_613022 )
      ( MAKE-10CRATE-VERIFY ?auto_613012 ?auto_613013 ?auto_613014 ?auto_613015 ?auto_613016 ?auto_613017 ?auto_613018 ?auto_613019 ?auto_613020 ?auto_613021 ?auto_613022 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613137 - SURFACE
      ?auto_613138 - SURFACE
      ?auto_613139 - SURFACE
      ?auto_613140 - SURFACE
      ?auto_613141 - SURFACE
      ?auto_613142 - SURFACE
      ?auto_613143 - SURFACE
      ?auto_613144 - SURFACE
      ?auto_613145 - SURFACE
      ?auto_613146 - SURFACE
      ?auto_613147 - SURFACE
    )
    :vars
    (
      ?auto_613148 - HOIST
      ?auto_613153 - PLACE
      ?auto_613149 - TRUCK
      ?auto_613151 - PLACE
      ?auto_613152 - HOIST
      ?auto_613150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613148 ?auto_613153 ) ( SURFACE-AT ?auto_613146 ?auto_613153 ) ( CLEAR ?auto_613146 ) ( IS-CRATE ?auto_613147 ) ( not ( = ?auto_613146 ?auto_613147 ) ) ( AVAILABLE ?auto_613148 ) ( ON ?auto_613146 ?auto_613145 ) ( not ( = ?auto_613145 ?auto_613146 ) ) ( not ( = ?auto_613145 ?auto_613147 ) ) ( TRUCK-AT ?auto_613149 ?auto_613151 ) ( not ( = ?auto_613151 ?auto_613153 ) ) ( HOIST-AT ?auto_613152 ?auto_613151 ) ( not ( = ?auto_613148 ?auto_613152 ) ) ( AVAILABLE ?auto_613152 ) ( SURFACE-AT ?auto_613147 ?auto_613151 ) ( ON ?auto_613147 ?auto_613150 ) ( CLEAR ?auto_613147 ) ( not ( = ?auto_613146 ?auto_613150 ) ) ( not ( = ?auto_613147 ?auto_613150 ) ) ( not ( = ?auto_613145 ?auto_613150 ) ) ( ON ?auto_613138 ?auto_613137 ) ( ON ?auto_613139 ?auto_613138 ) ( ON ?auto_613140 ?auto_613139 ) ( ON ?auto_613141 ?auto_613140 ) ( ON ?auto_613142 ?auto_613141 ) ( ON ?auto_613143 ?auto_613142 ) ( ON ?auto_613144 ?auto_613143 ) ( ON ?auto_613145 ?auto_613144 ) ( not ( = ?auto_613137 ?auto_613138 ) ) ( not ( = ?auto_613137 ?auto_613139 ) ) ( not ( = ?auto_613137 ?auto_613140 ) ) ( not ( = ?auto_613137 ?auto_613141 ) ) ( not ( = ?auto_613137 ?auto_613142 ) ) ( not ( = ?auto_613137 ?auto_613143 ) ) ( not ( = ?auto_613137 ?auto_613144 ) ) ( not ( = ?auto_613137 ?auto_613145 ) ) ( not ( = ?auto_613137 ?auto_613146 ) ) ( not ( = ?auto_613137 ?auto_613147 ) ) ( not ( = ?auto_613137 ?auto_613150 ) ) ( not ( = ?auto_613138 ?auto_613139 ) ) ( not ( = ?auto_613138 ?auto_613140 ) ) ( not ( = ?auto_613138 ?auto_613141 ) ) ( not ( = ?auto_613138 ?auto_613142 ) ) ( not ( = ?auto_613138 ?auto_613143 ) ) ( not ( = ?auto_613138 ?auto_613144 ) ) ( not ( = ?auto_613138 ?auto_613145 ) ) ( not ( = ?auto_613138 ?auto_613146 ) ) ( not ( = ?auto_613138 ?auto_613147 ) ) ( not ( = ?auto_613138 ?auto_613150 ) ) ( not ( = ?auto_613139 ?auto_613140 ) ) ( not ( = ?auto_613139 ?auto_613141 ) ) ( not ( = ?auto_613139 ?auto_613142 ) ) ( not ( = ?auto_613139 ?auto_613143 ) ) ( not ( = ?auto_613139 ?auto_613144 ) ) ( not ( = ?auto_613139 ?auto_613145 ) ) ( not ( = ?auto_613139 ?auto_613146 ) ) ( not ( = ?auto_613139 ?auto_613147 ) ) ( not ( = ?auto_613139 ?auto_613150 ) ) ( not ( = ?auto_613140 ?auto_613141 ) ) ( not ( = ?auto_613140 ?auto_613142 ) ) ( not ( = ?auto_613140 ?auto_613143 ) ) ( not ( = ?auto_613140 ?auto_613144 ) ) ( not ( = ?auto_613140 ?auto_613145 ) ) ( not ( = ?auto_613140 ?auto_613146 ) ) ( not ( = ?auto_613140 ?auto_613147 ) ) ( not ( = ?auto_613140 ?auto_613150 ) ) ( not ( = ?auto_613141 ?auto_613142 ) ) ( not ( = ?auto_613141 ?auto_613143 ) ) ( not ( = ?auto_613141 ?auto_613144 ) ) ( not ( = ?auto_613141 ?auto_613145 ) ) ( not ( = ?auto_613141 ?auto_613146 ) ) ( not ( = ?auto_613141 ?auto_613147 ) ) ( not ( = ?auto_613141 ?auto_613150 ) ) ( not ( = ?auto_613142 ?auto_613143 ) ) ( not ( = ?auto_613142 ?auto_613144 ) ) ( not ( = ?auto_613142 ?auto_613145 ) ) ( not ( = ?auto_613142 ?auto_613146 ) ) ( not ( = ?auto_613142 ?auto_613147 ) ) ( not ( = ?auto_613142 ?auto_613150 ) ) ( not ( = ?auto_613143 ?auto_613144 ) ) ( not ( = ?auto_613143 ?auto_613145 ) ) ( not ( = ?auto_613143 ?auto_613146 ) ) ( not ( = ?auto_613143 ?auto_613147 ) ) ( not ( = ?auto_613143 ?auto_613150 ) ) ( not ( = ?auto_613144 ?auto_613145 ) ) ( not ( = ?auto_613144 ?auto_613146 ) ) ( not ( = ?auto_613144 ?auto_613147 ) ) ( not ( = ?auto_613144 ?auto_613150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613145 ?auto_613146 ?auto_613147 )
      ( MAKE-10CRATE-VERIFY ?auto_613137 ?auto_613138 ?auto_613139 ?auto_613140 ?auto_613141 ?auto_613142 ?auto_613143 ?auto_613144 ?auto_613145 ?auto_613146 ?auto_613147 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613263 - SURFACE
      ?auto_613264 - SURFACE
      ?auto_613265 - SURFACE
      ?auto_613266 - SURFACE
      ?auto_613267 - SURFACE
      ?auto_613268 - SURFACE
      ?auto_613269 - SURFACE
      ?auto_613270 - SURFACE
      ?auto_613271 - SURFACE
      ?auto_613272 - SURFACE
      ?auto_613273 - SURFACE
    )
    :vars
    (
      ?auto_613275 - HOIST
      ?auto_613274 - PLACE
      ?auto_613277 - PLACE
      ?auto_613279 - HOIST
      ?auto_613278 - SURFACE
      ?auto_613276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613275 ?auto_613274 ) ( SURFACE-AT ?auto_613272 ?auto_613274 ) ( CLEAR ?auto_613272 ) ( IS-CRATE ?auto_613273 ) ( not ( = ?auto_613272 ?auto_613273 ) ) ( AVAILABLE ?auto_613275 ) ( ON ?auto_613272 ?auto_613271 ) ( not ( = ?auto_613271 ?auto_613272 ) ) ( not ( = ?auto_613271 ?auto_613273 ) ) ( not ( = ?auto_613277 ?auto_613274 ) ) ( HOIST-AT ?auto_613279 ?auto_613277 ) ( not ( = ?auto_613275 ?auto_613279 ) ) ( AVAILABLE ?auto_613279 ) ( SURFACE-AT ?auto_613273 ?auto_613277 ) ( ON ?auto_613273 ?auto_613278 ) ( CLEAR ?auto_613273 ) ( not ( = ?auto_613272 ?auto_613278 ) ) ( not ( = ?auto_613273 ?auto_613278 ) ) ( not ( = ?auto_613271 ?auto_613278 ) ) ( TRUCK-AT ?auto_613276 ?auto_613274 ) ( ON ?auto_613264 ?auto_613263 ) ( ON ?auto_613265 ?auto_613264 ) ( ON ?auto_613266 ?auto_613265 ) ( ON ?auto_613267 ?auto_613266 ) ( ON ?auto_613268 ?auto_613267 ) ( ON ?auto_613269 ?auto_613268 ) ( ON ?auto_613270 ?auto_613269 ) ( ON ?auto_613271 ?auto_613270 ) ( not ( = ?auto_613263 ?auto_613264 ) ) ( not ( = ?auto_613263 ?auto_613265 ) ) ( not ( = ?auto_613263 ?auto_613266 ) ) ( not ( = ?auto_613263 ?auto_613267 ) ) ( not ( = ?auto_613263 ?auto_613268 ) ) ( not ( = ?auto_613263 ?auto_613269 ) ) ( not ( = ?auto_613263 ?auto_613270 ) ) ( not ( = ?auto_613263 ?auto_613271 ) ) ( not ( = ?auto_613263 ?auto_613272 ) ) ( not ( = ?auto_613263 ?auto_613273 ) ) ( not ( = ?auto_613263 ?auto_613278 ) ) ( not ( = ?auto_613264 ?auto_613265 ) ) ( not ( = ?auto_613264 ?auto_613266 ) ) ( not ( = ?auto_613264 ?auto_613267 ) ) ( not ( = ?auto_613264 ?auto_613268 ) ) ( not ( = ?auto_613264 ?auto_613269 ) ) ( not ( = ?auto_613264 ?auto_613270 ) ) ( not ( = ?auto_613264 ?auto_613271 ) ) ( not ( = ?auto_613264 ?auto_613272 ) ) ( not ( = ?auto_613264 ?auto_613273 ) ) ( not ( = ?auto_613264 ?auto_613278 ) ) ( not ( = ?auto_613265 ?auto_613266 ) ) ( not ( = ?auto_613265 ?auto_613267 ) ) ( not ( = ?auto_613265 ?auto_613268 ) ) ( not ( = ?auto_613265 ?auto_613269 ) ) ( not ( = ?auto_613265 ?auto_613270 ) ) ( not ( = ?auto_613265 ?auto_613271 ) ) ( not ( = ?auto_613265 ?auto_613272 ) ) ( not ( = ?auto_613265 ?auto_613273 ) ) ( not ( = ?auto_613265 ?auto_613278 ) ) ( not ( = ?auto_613266 ?auto_613267 ) ) ( not ( = ?auto_613266 ?auto_613268 ) ) ( not ( = ?auto_613266 ?auto_613269 ) ) ( not ( = ?auto_613266 ?auto_613270 ) ) ( not ( = ?auto_613266 ?auto_613271 ) ) ( not ( = ?auto_613266 ?auto_613272 ) ) ( not ( = ?auto_613266 ?auto_613273 ) ) ( not ( = ?auto_613266 ?auto_613278 ) ) ( not ( = ?auto_613267 ?auto_613268 ) ) ( not ( = ?auto_613267 ?auto_613269 ) ) ( not ( = ?auto_613267 ?auto_613270 ) ) ( not ( = ?auto_613267 ?auto_613271 ) ) ( not ( = ?auto_613267 ?auto_613272 ) ) ( not ( = ?auto_613267 ?auto_613273 ) ) ( not ( = ?auto_613267 ?auto_613278 ) ) ( not ( = ?auto_613268 ?auto_613269 ) ) ( not ( = ?auto_613268 ?auto_613270 ) ) ( not ( = ?auto_613268 ?auto_613271 ) ) ( not ( = ?auto_613268 ?auto_613272 ) ) ( not ( = ?auto_613268 ?auto_613273 ) ) ( not ( = ?auto_613268 ?auto_613278 ) ) ( not ( = ?auto_613269 ?auto_613270 ) ) ( not ( = ?auto_613269 ?auto_613271 ) ) ( not ( = ?auto_613269 ?auto_613272 ) ) ( not ( = ?auto_613269 ?auto_613273 ) ) ( not ( = ?auto_613269 ?auto_613278 ) ) ( not ( = ?auto_613270 ?auto_613271 ) ) ( not ( = ?auto_613270 ?auto_613272 ) ) ( not ( = ?auto_613270 ?auto_613273 ) ) ( not ( = ?auto_613270 ?auto_613278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613271 ?auto_613272 ?auto_613273 )
      ( MAKE-10CRATE-VERIFY ?auto_613263 ?auto_613264 ?auto_613265 ?auto_613266 ?auto_613267 ?auto_613268 ?auto_613269 ?auto_613270 ?auto_613271 ?auto_613272 ?auto_613273 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613389 - SURFACE
      ?auto_613390 - SURFACE
      ?auto_613391 - SURFACE
      ?auto_613392 - SURFACE
      ?auto_613393 - SURFACE
      ?auto_613394 - SURFACE
      ?auto_613395 - SURFACE
      ?auto_613396 - SURFACE
      ?auto_613397 - SURFACE
      ?auto_613398 - SURFACE
      ?auto_613399 - SURFACE
    )
    :vars
    (
      ?auto_613405 - HOIST
      ?auto_613400 - PLACE
      ?auto_613404 - PLACE
      ?auto_613402 - HOIST
      ?auto_613403 - SURFACE
      ?auto_613401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613405 ?auto_613400 ) ( IS-CRATE ?auto_613399 ) ( not ( = ?auto_613398 ?auto_613399 ) ) ( not ( = ?auto_613397 ?auto_613398 ) ) ( not ( = ?auto_613397 ?auto_613399 ) ) ( not ( = ?auto_613404 ?auto_613400 ) ) ( HOIST-AT ?auto_613402 ?auto_613404 ) ( not ( = ?auto_613405 ?auto_613402 ) ) ( AVAILABLE ?auto_613402 ) ( SURFACE-AT ?auto_613399 ?auto_613404 ) ( ON ?auto_613399 ?auto_613403 ) ( CLEAR ?auto_613399 ) ( not ( = ?auto_613398 ?auto_613403 ) ) ( not ( = ?auto_613399 ?auto_613403 ) ) ( not ( = ?auto_613397 ?auto_613403 ) ) ( TRUCK-AT ?auto_613401 ?auto_613400 ) ( SURFACE-AT ?auto_613397 ?auto_613400 ) ( CLEAR ?auto_613397 ) ( LIFTING ?auto_613405 ?auto_613398 ) ( IS-CRATE ?auto_613398 ) ( ON ?auto_613390 ?auto_613389 ) ( ON ?auto_613391 ?auto_613390 ) ( ON ?auto_613392 ?auto_613391 ) ( ON ?auto_613393 ?auto_613392 ) ( ON ?auto_613394 ?auto_613393 ) ( ON ?auto_613395 ?auto_613394 ) ( ON ?auto_613396 ?auto_613395 ) ( ON ?auto_613397 ?auto_613396 ) ( not ( = ?auto_613389 ?auto_613390 ) ) ( not ( = ?auto_613389 ?auto_613391 ) ) ( not ( = ?auto_613389 ?auto_613392 ) ) ( not ( = ?auto_613389 ?auto_613393 ) ) ( not ( = ?auto_613389 ?auto_613394 ) ) ( not ( = ?auto_613389 ?auto_613395 ) ) ( not ( = ?auto_613389 ?auto_613396 ) ) ( not ( = ?auto_613389 ?auto_613397 ) ) ( not ( = ?auto_613389 ?auto_613398 ) ) ( not ( = ?auto_613389 ?auto_613399 ) ) ( not ( = ?auto_613389 ?auto_613403 ) ) ( not ( = ?auto_613390 ?auto_613391 ) ) ( not ( = ?auto_613390 ?auto_613392 ) ) ( not ( = ?auto_613390 ?auto_613393 ) ) ( not ( = ?auto_613390 ?auto_613394 ) ) ( not ( = ?auto_613390 ?auto_613395 ) ) ( not ( = ?auto_613390 ?auto_613396 ) ) ( not ( = ?auto_613390 ?auto_613397 ) ) ( not ( = ?auto_613390 ?auto_613398 ) ) ( not ( = ?auto_613390 ?auto_613399 ) ) ( not ( = ?auto_613390 ?auto_613403 ) ) ( not ( = ?auto_613391 ?auto_613392 ) ) ( not ( = ?auto_613391 ?auto_613393 ) ) ( not ( = ?auto_613391 ?auto_613394 ) ) ( not ( = ?auto_613391 ?auto_613395 ) ) ( not ( = ?auto_613391 ?auto_613396 ) ) ( not ( = ?auto_613391 ?auto_613397 ) ) ( not ( = ?auto_613391 ?auto_613398 ) ) ( not ( = ?auto_613391 ?auto_613399 ) ) ( not ( = ?auto_613391 ?auto_613403 ) ) ( not ( = ?auto_613392 ?auto_613393 ) ) ( not ( = ?auto_613392 ?auto_613394 ) ) ( not ( = ?auto_613392 ?auto_613395 ) ) ( not ( = ?auto_613392 ?auto_613396 ) ) ( not ( = ?auto_613392 ?auto_613397 ) ) ( not ( = ?auto_613392 ?auto_613398 ) ) ( not ( = ?auto_613392 ?auto_613399 ) ) ( not ( = ?auto_613392 ?auto_613403 ) ) ( not ( = ?auto_613393 ?auto_613394 ) ) ( not ( = ?auto_613393 ?auto_613395 ) ) ( not ( = ?auto_613393 ?auto_613396 ) ) ( not ( = ?auto_613393 ?auto_613397 ) ) ( not ( = ?auto_613393 ?auto_613398 ) ) ( not ( = ?auto_613393 ?auto_613399 ) ) ( not ( = ?auto_613393 ?auto_613403 ) ) ( not ( = ?auto_613394 ?auto_613395 ) ) ( not ( = ?auto_613394 ?auto_613396 ) ) ( not ( = ?auto_613394 ?auto_613397 ) ) ( not ( = ?auto_613394 ?auto_613398 ) ) ( not ( = ?auto_613394 ?auto_613399 ) ) ( not ( = ?auto_613394 ?auto_613403 ) ) ( not ( = ?auto_613395 ?auto_613396 ) ) ( not ( = ?auto_613395 ?auto_613397 ) ) ( not ( = ?auto_613395 ?auto_613398 ) ) ( not ( = ?auto_613395 ?auto_613399 ) ) ( not ( = ?auto_613395 ?auto_613403 ) ) ( not ( = ?auto_613396 ?auto_613397 ) ) ( not ( = ?auto_613396 ?auto_613398 ) ) ( not ( = ?auto_613396 ?auto_613399 ) ) ( not ( = ?auto_613396 ?auto_613403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613397 ?auto_613398 ?auto_613399 )
      ( MAKE-10CRATE-VERIFY ?auto_613389 ?auto_613390 ?auto_613391 ?auto_613392 ?auto_613393 ?auto_613394 ?auto_613395 ?auto_613396 ?auto_613397 ?auto_613398 ?auto_613399 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613515 - SURFACE
      ?auto_613516 - SURFACE
      ?auto_613517 - SURFACE
      ?auto_613518 - SURFACE
      ?auto_613519 - SURFACE
      ?auto_613520 - SURFACE
      ?auto_613521 - SURFACE
      ?auto_613522 - SURFACE
      ?auto_613523 - SURFACE
      ?auto_613524 - SURFACE
      ?auto_613525 - SURFACE
    )
    :vars
    (
      ?auto_613527 - HOIST
      ?auto_613529 - PLACE
      ?auto_613530 - PLACE
      ?auto_613528 - HOIST
      ?auto_613526 - SURFACE
      ?auto_613531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613527 ?auto_613529 ) ( IS-CRATE ?auto_613525 ) ( not ( = ?auto_613524 ?auto_613525 ) ) ( not ( = ?auto_613523 ?auto_613524 ) ) ( not ( = ?auto_613523 ?auto_613525 ) ) ( not ( = ?auto_613530 ?auto_613529 ) ) ( HOIST-AT ?auto_613528 ?auto_613530 ) ( not ( = ?auto_613527 ?auto_613528 ) ) ( AVAILABLE ?auto_613528 ) ( SURFACE-AT ?auto_613525 ?auto_613530 ) ( ON ?auto_613525 ?auto_613526 ) ( CLEAR ?auto_613525 ) ( not ( = ?auto_613524 ?auto_613526 ) ) ( not ( = ?auto_613525 ?auto_613526 ) ) ( not ( = ?auto_613523 ?auto_613526 ) ) ( TRUCK-AT ?auto_613531 ?auto_613529 ) ( SURFACE-AT ?auto_613523 ?auto_613529 ) ( CLEAR ?auto_613523 ) ( IS-CRATE ?auto_613524 ) ( AVAILABLE ?auto_613527 ) ( IN ?auto_613524 ?auto_613531 ) ( ON ?auto_613516 ?auto_613515 ) ( ON ?auto_613517 ?auto_613516 ) ( ON ?auto_613518 ?auto_613517 ) ( ON ?auto_613519 ?auto_613518 ) ( ON ?auto_613520 ?auto_613519 ) ( ON ?auto_613521 ?auto_613520 ) ( ON ?auto_613522 ?auto_613521 ) ( ON ?auto_613523 ?auto_613522 ) ( not ( = ?auto_613515 ?auto_613516 ) ) ( not ( = ?auto_613515 ?auto_613517 ) ) ( not ( = ?auto_613515 ?auto_613518 ) ) ( not ( = ?auto_613515 ?auto_613519 ) ) ( not ( = ?auto_613515 ?auto_613520 ) ) ( not ( = ?auto_613515 ?auto_613521 ) ) ( not ( = ?auto_613515 ?auto_613522 ) ) ( not ( = ?auto_613515 ?auto_613523 ) ) ( not ( = ?auto_613515 ?auto_613524 ) ) ( not ( = ?auto_613515 ?auto_613525 ) ) ( not ( = ?auto_613515 ?auto_613526 ) ) ( not ( = ?auto_613516 ?auto_613517 ) ) ( not ( = ?auto_613516 ?auto_613518 ) ) ( not ( = ?auto_613516 ?auto_613519 ) ) ( not ( = ?auto_613516 ?auto_613520 ) ) ( not ( = ?auto_613516 ?auto_613521 ) ) ( not ( = ?auto_613516 ?auto_613522 ) ) ( not ( = ?auto_613516 ?auto_613523 ) ) ( not ( = ?auto_613516 ?auto_613524 ) ) ( not ( = ?auto_613516 ?auto_613525 ) ) ( not ( = ?auto_613516 ?auto_613526 ) ) ( not ( = ?auto_613517 ?auto_613518 ) ) ( not ( = ?auto_613517 ?auto_613519 ) ) ( not ( = ?auto_613517 ?auto_613520 ) ) ( not ( = ?auto_613517 ?auto_613521 ) ) ( not ( = ?auto_613517 ?auto_613522 ) ) ( not ( = ?auto_613517 ?auto_613523 ) ) ( not ( = ?auto_613517 ?auto_613524 ) ) ( not ( = ?auto_613517 ?auto_613525 ) ) ( not ( = ?auto_613517 ?auto_613526 ) ) ( not ( = ?auto_613518 ?auto_613519 ) ) ( not ( = ?auto_613518 ?auto_613520 ) ) ( not ( = ?auto_613518 ?auto_613521 ) ) ( not ( = ?auto_613518 ?auto_613522 ) ) ( not ( = ?auto_613518 ?auto_613523 ) ) ( not ( = ?auto_613518 ?auto_613524 ) ) ( not ( = ?auto_613518 ?auto_613525 ) ) ( not ( = ?auto_613518 ?auto_613526 ) ) ( not ( = ?auto_613519 ?auto_613520 ) ) ( not ( = ?auto_613519 ?auto_613521 ) ) ( not ( = ?auto_613519 ?auto_613522 ) ) ( not ( = ?auto_613519 ?auto_613523 ) ) ( not ( = ?auto_613519 ?auto_613524 ) ) ( not ( = ?auto_613519 ?auto_613525 ) ) ( not ( = ?auto_613519 ?auto_613526 ) ) ( not ( = ?auto_613520 ?auto_613521 ) ) ( not ( = ?auto_613520 ?auto_613522 ) ) ( not ( = ?auto_613520 ?auto_613523 ) ) ( not ( = ?auto_613520 ?auto_613524 ) ) ( not ( = ?auto_613520 ?auto_613525 ) ) ( not ( = ?auto_613520 ?auto_613526 ) ) ( not ( = ?auto_613521 ?auto_613522 ) ) ( not ( = ?auto_613521 ?auto_613523 ) ) ( not ( = ?auto_613521 ?auto_613524 ) ) ( not ( = ?auto_613521 ?auto_613525 ) ) ( not ( = ?auto_613521 ?auto_613526 ) ) ( not ( = ?auto_613522 ?auto_613523 ) ) ( not ( = ?auto_613522 ?auto_613524 ) ) ( not ( = ?auto_613522 ?auto_613525 ) ) ( not ( = ?auto_613522 ?auto_613526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613523 ?auto_613524 ?auto_613525 )
      ( MAKE-10CRATE-VERIFY ?auto_613515 ?auto_613516 ?auto_613517 ?auto_613518 ?auto_613519 ?auto_613520 ?auto_613521 ?auto_613522 ?auto_613523 ?auto_613524 ?auto_613525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_613532 - SURFACE
      ?auto_613533 - SURFACE
    )
    :vars
    (
      ?auto_613536 - HOIST
      ?auto_613538 - PLACE
      ?auto_613534 - SURFACE
      ?auto_613539 - PLACE
      ?auto_613537 - HOIST
      ?auto_613535 - SURFACE
      ?auto_613540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613536 ?auto_613538 ) ( IS-CRATE ?auto_613533 ) ( not ( = ?auto_613532 ?auto_613533 ) ) ( not ( = ?auto_613534 ?auto_613532 ) ) ( not ( = ?auto_613534 ?auto_613533 ) ) ( not ( = ?auto_613539 ?auto_613538 ) ) ( HOIST-AT ?auto_613537 ?auto_613539 ) ( not ( = ?auto_613536 ?auto_613537 ) ) ( AVAILABLE ?auto_613537 ) ( SURFACE-AT ?auto_613533 ?auto_613539 ) ( ON ?auto_613533 ?auto_613535 ) ( CLEAR ?auto_613533 ) ( not ( = ?auto_613532 ?auto_613535 ) ) ( not ( = ?auto_613533 ?auto_613535 ) ) ( not ( = ?auto_613534 ?auto_613535 ) ) ( SURFACE-AT ?auto_613534 ?auto_613538 ) ( CLEAR ?auto_613534 ) ( IS-CRATE ?auto_613532 ) ( AVAILABLE ?auto_613536 ) ( IN ?auto_613532 ?auto_613540 ) ( TRUCK-AT ?auto_613540 ?auto_613539 ) )
    :subtasks
    ( ( !DRIVE ?auto_613540 ?auto_613539 ?auto_613538 )
      ( MAKE-2CRATE ?auto_613534 ?auto_613532 ?auto_613533 )
      ( MAKE-1CRATE-VERIFY ?auto_613532 ?auto_613533 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_613541 - SURFACE
      ?auto_613542 - SURFACE
      ?auto_613543 - SURFACE
    )
    :vars
    (
      ?auto_613546 - HOIST
      ?auto_613548 - PLACE
      ?auto_613544 - PLACE
      ?auto_613549 - HOIST
      ?auto_613547 - SURFACE
      ?auto_613545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613546 ?auto_613548 ) ( IS-CRATE ?auto_613543 ) ( not ( = ?auto_613542 ?auto_613543 ) ) ( not ( = ?auto_613541 ?auto_613542 ) ) ( not ( = ?auto_613541 ?auto_613543 ) ) ( not ( = ?auto_613544 ?auto_613548 ) ) ( HOIST-AT ?auto_613549 ?auto_613544 ) ( not ( = ?auto_613546 ?auto_613549 ) ) ( AVAILABLE ?auto_613549 ) ( SURFACE-AT ?auto_613543 ?auto_613544 ) ( ON ?auto_613543 ?auto_613547 ) ( CLEAR ?auto_613543 ) ( not ( = ?auto_613542 ?auto_613547 ) ) ( not ( = ?auto_613543 ?auto_613547 ) ) ( not ( = ?auto_613541 ?auto_613547 ) ) ( SURFACE-AT ?auto_613541 ?auto_613548 ) ( CLEAR ?auto_613541 ) ( IS-CRATE ?auto_613542 ) ( AVAILABLE ?auto_613546 ) ( IN ?auto_613542 ?auto_613545 ) ( TRUCK-AT ?auto_613545 ?auto_613544 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_613542 ?auto_613543 )
      ( MAKE-2CRATE-VERIFY ?auto_613541 ?auto_613542 ?auto_613543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_613550 - SURFACE
      ?auto_613551 - SURFACE
      ?auto_613552 - SURFACE
      ?auto_613553 - SURFACE
    )
    :vars
    (
      ?auto_613556 - HOIST
      ?auto_613557 - PLACE
      ?auto_613555 - PLACE
      ?auto_613559 - HOIST
      ?auto_613554 - SURFACE
      ?auto_613558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613556 ?auto_613557 ) ( IS-CRATE ?auto_613553 ) ( not ( = ?auto_613552 ?auto_613553 ) ) ( not ( = ?auto_613551 ?auto_613552 ) ) ( not ( = ?auto_613551 ?auto_613553 ) ) ( not ( = ?auto_613555 ?auto_613557 ) ) ( HOIST-AT ?auto_613559 ?auto_613555 ) ( not ( = ?auto_613556 ?auto_613559 ) ) ( AVAILABLE ?auto_613559 ) ( SURFACE-AT ?auto_613553 ?auto_613555 ) ( ON ?auto_613553 ?auto_613554 ) ( CLEAR ?auto_613553 ) ( not ( = ?auto_613552 ?auto_613554 ) ) ( not ( = ?auto_613553 ?auto_613554 ) ) ( not ( = ?auto_613551 ?auto_613554 ) ) ( SURFACE-AT ?auto_613551 ?auto_613557 ) ( CLEAR ?auto_613551 ) ( IS-CRATE ?auto_613552 ) ( AVAILABLE ?auto_613556 ) ( IN ?auto_613552 ?auto_613558 ) ( TRUCK-AT ?auto_613558 ?auto_613555 ) ( ON ?auto_613551 ?auto_613550 ) ( not ( = ?auto_613550 ?auto_613551 ) ) ( not ( = ?auto_613550 ?auto_613552 ) ) ( not ( = ?auto_613550 ?auto_613553 ) ) ( not ( = ?auto_613550 ?auto_613554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613551 ?auto_613552 ?auto_613553 )
      ( MAKE-3CRATE-VERIFY ?auto_613550 ?auto_613551 ?auto_613552 ?auto_613553 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_613560 - SURFACE
      ?auto_613561 - SURFACE
      ?auto_613562 - SURFACE
      ?auto_613563 - SURFACE
      ?auto_613564 - SURFACE
    )
    :vars
    (
      ?auto_613567 - HOIST
      ?auto_613568 - PLACE
      ?auto_613566 - PLACE
      ?auto_613570 - HOIST
      ?auto_613565 - SURFACE
      ?auto_613569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613567 ?auto_613568 ) ( IS-CRATE ?auto_613564 ) ( not ( = ?auto_613563 ?auto_613564 ) ) ( not ( = ?auto_613562 ?auto_613563 ) ) ( not ( = ?auto_613562 ?auto_613564 ) ) ( not ( = ?auto_613566 ?auto_613568 ) ) ( HOIST-AT ?auto_613570 ?auto_613566 ) ( not ( = ?auto_613567 ?auto_613570 ) ) ( AVAILABLE ?auto_613570 ) ( SURFACE-AT ?auto_613564 ?auto_613566 ) ( ON ?auto_613564 ?auto_613565 ) ( CLEAR ?auto_613564 ) ( not ( = ?auto_613563 ?auto_613565 ) ) ( not ( = ?auto_613564 ?auto_613565 ) ) ( not ( = ?auto_613562 ?auto_613565 ) ) ( SURFACE-AT ?auto_613562 ?auto_613568 ) ( CLEAR ?auto_613562 ) ( IS-CRATE ?auto_613563 ) ( AVAILABLE ?auto_613567 ) ( IN ?auto_613563 ?auto_613569 ) ( TRUCK-AT ?auto_613569 ?auto_613566 ) ( ON ?auto_613561 ?auto_613560 ) ( ON ?auto_613562 ?auto_613561 ) ( not ( = ?auto_613560 ?auto_613561 ) ) ( not ( = ?auto_613560 ?auto_613562 ) ) ( not ( = ?auto_613560 ?auto_613563 ) ) ( not ( = ?auto_613560 ?auto_613564 ) ) ( not ( = ?auto_613560 ?auto_613565 ) ) ( not ( = ?auto_613561 ?auto_613562 ) ) ( not ( = ?auto_613561 ?auto_613563 ) ) ( not ( = ?auto_613561 ?auto_613564 ) ) ( not ( = ?auto_613561 ?auto_613565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613562 ?auto_613563 ?auto_613564 )
      ( MAKE-4CRATE-VERIFY ?auto_613560 ?auto_613561 ?auto_613562 ?auto_613563 ?auto_613564 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_613571 - SURFACE
      ?auto_613572 - SURFACE
      ?auto_613573 - SURFACE
      ?auto_613574 - SURFACE
      ?auto_613575 - SURFACE
      ?auto_613576 - SURFACE
    )
    :vars
    (
      ?auto_613579 - HOIST
      ?auto_613580 - PLACE
      ?auto_613578 - PLACE
      ?auto_613582 - HOIST
      ?auto_613577 - SURFACE
      ?auto_613581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613579 ?auto_613580 ) ( IS-CRATE ?auto_613576 ) ( not ( = ?auto_613575 ?auto_613576 ) ) ( not ( = ?auto_613574 ?auto_613575 ) ) ( not ( = ?auto_613574 ?auto_613576 ) ) ( not ( = ?auto_613578 ?auto_613580 ) ) ( HOIST-AT ?auto_613582 ?auto_613578 ) ( not ( = ?auto_613579 ?auto_613582 ) ) ( AVAILABLE ?auto_613582 ) ( SURFACE-AT ?auto_613576 ?auto_613578 ) ( ON ?auto_613576 ?auto_613577 ) ( CLEAR ?auto_613576 ) ( not ( = ?auto_613575 ?auto_613577 ) ) ( not ( = ?auto_613576 ?auto_613577 ) ) ( not ( = ?auto_613574 ?auto_613577 ) ) ( SURFACE-AT ?auto_613574 ?auto_613580 ) ( CLEAR ?auto_613574 ) ( IS-CRATE ?auto_613575 ) ( AVAILABLE ?auto_613579 ) ( IN ?auto_613575 ?auto_613581 ) ( TRUCK-AT ?auto_613581 ?auto_613578 ) ( ON ?auto_613572 ?auto_613571 ) ( ON ?auto_613573 ?auto_613572 ) ( ON ?auto_613574 ?auto_613573 ) ( not ( = ?auto_613571 ?auto_613572 ) ) ( not ( = ?auto_613571 ?auto_613573 ) ) ( not ( = ?auto_613571 ?auto_613574 ) ) ( not ( = ?auto_613571 ?auto_613575 ) ) ( not ( = ?auto_613571 ?auto_613576 ) ) ( not ( = ?auto_613571 ?auto_613577 ) ) ( not ( = ?auto_613572 ?auto_613573 ) ) ( not ( = ?auto_613572 ?auto_613574 ) ) ( not ( = ?auto_613572 ?auto_613575 ) ) ( not ( = ?auto_613572 ?auto_613576 ) ) ( not ( = ?auto_613572 ?auto_613577 ) ) ( not ( = ?auto_613573 ?auto_613574 ) ) ( not ( = ?auto_613573 ?auto_613575 ) ) ( not ( = ?auto_613573 ?auto_613576 ) ) ( not ( = ?auto_613573 ?auto_613577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613574 ?auto_613575 ?auto_613576 )
      ( MAKE-5CRATE-VERIFY ?auto_613571 ?auto_613572 ?auto_613573 ?auto_613574 ?auto_613575 ?auto_613576 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_613583 - SURFACE
      ?auto_613584 - SURFACE
      ?auto_613585 - SURFACE
      ?auto_613586 - SURFACE
      ?auto_613587 - SURFACE
      ?auto_613588 - SURFACE
      ?auto_613589 - SURFACE
    )
    :vars
    (
      ?auto_613592 - HOIST
      ?auto_613593 - PLACE
      ?auto_613591 - PLACE
      ?auto_613595 - HOIST
      ?auto_613590 - SURFACE
      ?auto_613594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613592 ?auto_613593 ) ( IS-CRATE ?auto_613589 ) ( not ( = ?auto_613588 ?auto_613589 ) ) ( not ( = ?auto_613587 ?auto_613588 ) ) ( not ( = ?auto_613587 ?auto_613589 ) ) ( not ( = ?auto_613591 ?auto_613593 ) ) ( HOIST-AT ?auto_613595 ?auto_613591 ) ( not ( = ?auto_613592 ?auto_613595 ) ) ( AVAILABLE ?auto_613595 ) ( SURFACE-AT ?auto_613589 ?auto_613591 ) ( ON ?auto_613589 ?auto_613590 ) ( CLEAR ?auto_613589 ) ( not ( = ?auto_613588 ?auto_613590 ) ) ( not ( = ?auto_613589 ?auto_613590 ) ) ( not ( = ?auto_613587 ?auto_613590 ) ) ( SURFACE-AT ?auto_613587 ?auto_613593 ) ( CLEAR ?auto_613587 ) ( IS-CRATE ?auto_613588 ) ( AVAILABLE ?auto_613592 ) ( IN ?auto_613588 ?auto_613594 ) ( TRUCK-AT ?auto_613594 ?auto_613591 ) ( ON ?auto_613584 ?auto_613583 ) ( ON ?auto_613585 ?auto_613584 ) ( ON ?auto_613586 ?auto_613585 ) ( ON ?auto_613587 ?auto_613586 ) ( not ( = ?auto_613583 ?auto_613584 ) ) ( not ( = ?auto_613583 ?auto_613585 ) ) ( not ( = ?auto_613583 ?auto_613586 ) ) ( not ( = ?auto_613583 ?auto_613587 ) ) ( not ( = ?auto_613583 ?auto_613588 ) ) ( not ( = ?auto_613583 ?auto_613589 ) ) ( not ( = ?auto_613583 ?auto_613590 ) ) ( not ( = ?auto_613584 ?auto_613585 ) ) ( not ( = ?auto_613584 ?auto_613586 ) ) ( not ( = ?auto_613584 ?auto_613587 ) ) ( not ( = ?auto_613584 ?auto_613588 ) ) ( not ( = ?auto_613584 ?auto_613589 ) ) ( not ( = ?auto_613584 ?auto_613590 ) ) ( not ( = ?auto_613585 ?auto_613586 ) ) ( not ( = ?auto_613585 ?auto_613587 ) ) ( not ( = ?auto_613585 ?auto_613588 ) ) ( not ( = ?auto_613585 ?auto_613589 ) ) ( not ( = ?auto_613585 ?auto_613590 ) ) ( not ( = ?auto_613586 ?auto_613587 ) ) ( not ( = ?auto_613586 ?auto_613588 ) ) ( not ( = ?auto_613586 ?auto_613589 ) ) ( not ( = ?auto_613586 ?auto_613590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613587 ?auto_613588 ?auto_613589 )
      ( MAKE-6CRATE-VERIFY ?auto_613583 ?auto_613584 ?auto_613585 ?auto_613586 ?auto_613587 ?auto_613588 ?auto_613589 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_613596 - SURFACE
      ?auto_613597 - SURFACE
      ?auto_613598 - SURFACE
      ?auto_613599 - SURFACE
      ?auto_613600 - SURFACE
      ?auto_613601 - SURFACE
      ?auto_613602 - SURFACE
      ?auto_613603 - SURFACE
    )
    :vars
    (
      ?auto_613606 - HOIST
      ?auto_613607 - PLACE
      ?auto_613605 - PLACE
      ?auto_613609 - HOIST
      ?auto_613604 - SURFACE
      ?auto_613608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613606 ?auto_613607 ) ( IS-CRATE ?auto_613603 ) ( not ( = ?auto_613602 ?auto_613603 ) ) ( not ( = ?auto_613601 ?auto_613602 ) ) ( not ( = ?auto_613601 ?auto_613603 ) ) ( not ( = ?auto_613605 ?auto_613607 ) ) ( HOIST-AT ?auto_613609 ?auto_613605 ) ( not ( = ?auto_613606 ?auto_613609 ) ) ( AVAILABLE ?auto_613609 ) ( SURFACE-AT ?auto_613603 ?auto_613605 ) ( ON ?auto_613603 ?auto_613604 ) ( CLEAR ?auto_613603 ) ( not ( = ?auto_613602 ?auto_613604 ) ) ( not ( = ?auto_613603 ?auto_613604 ) ) ( not ( = ?auto_613601 ?auto_613604 ) ) ( SURFACE-AT ?auto_613601 ?auto_613607 ) ( CLEAR ?auto_613601 ) ( IS-CRATE ?auto_613602 ) ( AVAILABLE ?auto_613606 ) ( IN ?auto_613602 ?auto_613608 ) ( TRUCK-AT ?auto_613608 ?auto_613605 ) ( ON ?auto_613597 ?auto_613596 ) ( ON ?auto_613598 ?auto_613597 ) ( ON ?auto_613599 ?auto_613598 ) ( ON ?auto_613600 ?auto_613599 ) ( ON ?auto_613601 ?auto_613600 ) ( not ( = ?auto_613596 ?auto_613597 ) ) ( not ( = ?auto_613596 ?auto_613598 ) ) ( not ( = ?auto_613596 ?auto_613599 ) ) ( not ( = ?auto_613596 ?auto_613600 ) ) ( not ( = ?auto_613596 ?auto_613601 ) ) ( not ( = ?auto_613596 ?auto_613602 ) ) ( not ( = ?auto_613596 ?auto_613603 ) ) ( not ( = ?auto_613596 ?auto_613604 ) ) ( not ( = ?auto_613597 ?auto_613598 ) ) ( not ( = ?auto_613597 ?auto_613599 ) ) ( not ( = ?auto_613597 ?auto_613600 ) ) ( not ( = ?auto_613597 ?auto_613601 ) ) ( not ( = ?auto_613597 ?auto_613602 ) ) ( not ( = ?auto_613597 ?auto_613603 ) ) ( not ( = ?auto_613597 ?auto_613604 ) ) ( not ( = ?auto_613598 ?auto_613599 ) ) ( not ( = ?auto_613598 ?auto_613600 ) ) ( not ( = ?auto_613598 ?auto_613601 ) ) ( not ( = ?auto_613598 ?auto_613602 ) ) ( not ( = ?auto_613598 ?auto_613603 ) ) ( not ( = ?auto_613598 ?auto_613604 ) ) ( not ( = ?auto_613599 ?auto_613600 ) ) ( not ( = ?auto_613599 ?auto_613601 ) ) ( not ( = ?auto_613599 ?auto_613602 ) ) ( not ( = ?auto_613599 ?auto_613603 ) ) ( not ( = ?auto_613599 ?auto_613604 ) ) ( not ( = ?auto_613600 ?auto_613601 ) ) ( not ( = ?auto_613600 ?auto_613602 ) ) ( not ( = ?auto_613600 ?auto_613603 ) ) ( not ( = ?auto_613600 ?auto_613604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613601 ?auto_613602 ?auto_613603 )
      ( MAKE-7CRATE-VERIFY ?auto_613596 ?auto_613597 ?auto_613598 ?auto_613599 ?auto_613600 ?auto_613601 ?auto_613602 ?auto_613603 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_613610 - SURFACE
      ?auto_613611 - SURFACE
      ?auto_613612 - SURFACE
      ?auto_613613 - SURFACE
      ?auto_613614 - SURFACE
      ?auto_613615 - SURFACE
      ?auto_613616 - SURFACE
      ?auto_613617 - SURFACE
      ?auto_613618 - SURFACE
    )
    :vars
    (
      ?auto_613621 - HOIST
      ?auto_613622 - PLACE
      ?auto_613620 - PLACE
      ?auto_613624 - HOIST
      ?auto_613619 - SURFACE
      ?auto_613623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613621 ?auto_613622 ) ( IS-CRATE ?auto_613618 ) ( not ( = ?auto_613617 ?auto_613618 ) ) ( not ( = ?auto_613616 ?auto_613617 ) ) ( not ( = ?auto_613616 ?auto_613618 ) ) ( not ( = ?auto_613620 ?auto_613622 ) ) ( HOIST-AT ?auto_613624 ?auto_613620 ) ( not ( = ?auto_613621 ?auto_613624 ) ) ( AVAILABLE ?auto_613624 ) ( SURFACE-AT ?auto_613618 ?auto_613620 ) ( ON ?auto_613618 ?auto_613619 ) ( CLEAR ?auto_613618 ) ( not ( = ?auto_613617 ?auto_613619 ) ) ( not ( = ?auto_613618 ?auto_613619 ) ) ( not ( = ?auto_613616 ?auto_613619 ) ) ( SURFACE-AT ?auto_613616 ?auto_613622 ) ( CLEAR ?auto_613616 ) ( IS-CRATE ?auto_613617 ) ( AVAILABLE ?auto_613621 ) ( IN ?auto_613617 ?auto_613623 ) ( TRUCK-AT ?auto_613623 ?auto_613620 ) ( ON ?auto_613611 ?auto_613610 ) ( ON ?auto_613612 ?auto_613611 ) ( ON ?auto_613613 ?auto_613612 ) ( ON ?auto_613614 ?auto_613613 ) ( ON ?auto_613615 ?auto_613614 ) ( ON ?auto_613616 ?auto_613615 ) ( not ( = ?auto_613610 ?auto_613611 ) ) ( not ( = ?auto_613610 ?auto_613612 ) ) ( not ( = ?auto_613610 ?auto_613613 ) ) ( not ( = ?auto_613610 ?auto_613614 ) ) ( not ( = ?auto_613610 ?auto_613615 ) ) ( not ( = ?auto_613610 ?auto_613616 ) ) ( not ( = ?auto_613610 ?auto_613617 ) ) ( not ( = ?auto_613610 ?auto_613618 ) ) ( not ( = ?auto_613610 ?auto_613619 ) ) ( not ( = ?auto_613611 ?auto_613612 ) ) ( not ( = ?auto_613611 ?auto_613613 ) ) ( not ( = ?auto_613611 ?auto_613614 ) ) ( not ( = ?auto_613611 ?auto_613615 ) ) ( not ( = ?auto_613611 ?auto_613616 ) ) ( not ( = ?auto_613611 ?auto_613617 ) ) ( not ( = ?auto_613611 ?auto_613618 ) ) ( not ( = ?auto_613611 ?auto_613619 ) ) ( not ( = ?auto_613612 ?auto_613613 ) ) ( not ( = ?auto_613612 ?auto_613614 ) ) ( not ( = ?auto_613612 ?auto_613615 ) ) ( not ( = ?auto_613612 ?auto_613616 ) ) ( not ( = ?auto_613612 ?auto_613617 ) ) ( not ( = ?auto_613612 ?auto_613618 ) ) ( not ( = ?auto_613612 ?auto_613619 ) ) ( not ( = ?auto_613613 ?auto_613614 ) ) ( not ( = ?auto_613613 ?auto_613615 ) ) ( not ( = ?auto_613613 ?auto_613616 ) ) ( not ( = ?auto_613613 ?auto_613617 ) ) ( not ( = ?auto_613613 ?auto_613618 ) ) ( not ( = ?auto_613613 ?auto_613619 ) ) ( not ( = ?auto_613614 ?auto_613615 ) ) ( not ( = ?auto_613614 ?auto_613616 ) ) ( not ( = ?auto_613614 ?auto_613617 ) ) ( not ( = ?auto_613614 ?auto_613618 ) ) ( not ( = ?auto_613614 ?auto_613619 ) ) ( not ( = ?auto_613615 ?auto_613616 ) ) ( not ( = ?auto_613615 ?auto_613617 ) ) ( not ( = ?auto_613615 ?auto_613618 ) ) ( not ( = ?auto_613615 ?auto_613619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613616 ?auto_613617 ?auto_613618 )
      ( MAKE-8CRATE-VERIFY ?auto_613610 ?auto_613611 ?auto_613612 ?auto_613613 ?auto_613614 ?auto_613615 ?auto_613616 ?auto_613617 ?auto_613618 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_613625 - SURFACE
      ?auto_613626 - SURFACE
      ?auto_613627 - SURFACE
      ?auto_613628 - SURFACE
      ?auto_613629 - SURFACE
      ?auto_613630 - SURFACE
      ?auto_613631 - SURFACE
      ?auto_613632 - SURFACE
      ?auto_613633 - SURFACE
      ?auto_613634 - SURFACE
    )
    :vars
    (
      ?auto_613637 - HOIST
      ?auto_613638 - PLACE
      ?auto_613636 - PLACE
      ?auto_613640 - HOIST
      ?auto_613635 - SURFACE
      ?auto_613639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613637 ?auto_613638 ) ( IS-CRATE ?auto_613634 ) ( not ( = ?auto_613633 ?auto_613634 ) ) ( not ( = ?auto_613632 ?auto_613633 ) ) ( not ( = ?auto_613632 ?auto_613634 ) ) ( not ( = ?auto_613636 ?auto_613638 ) ) ( HOIST-AT ?auto_613640 ?auto_613636 ) ( not ( = ?auto_613637 ?auto_613640 ) ) ( AVAILABLE ?auto_613640 ) ( SURFACE-AT ?auto_613634 ?auto_613636 ) ( ON ?auto_613634 ?auto_613635 ) ( CLEAR ?auto_613634 ) ( not ( = ?auto_613633 ?auto_613635 ) ) ( not ( = ?auto_613634 ?auto_613635 ) ) ( not ( = ?auto_613632 ?auto_613635 ) ) ( SURFACE-AT ?auto_613632 ?auto_613638 ) ( CLEAR ?auto_613632 ) ( IS-CRATE ?auto_613633 ) ( AVAILABLE ?auto_613637 ) ( IN ?auto_613633 ?auto_613639 ) ( TRUCK-AT ?auto_613639 ?auto_613636 ) ( ON ?auto_613626 ?auto_613625 ) ( ON ?auto_613627 ?auto_613626 ) ( ON ?auto_613628 ?auto_613627 ) ( ON ?auto_613629 ?auto_613628 ) ( ON ?auto_613630 ?auto_613629 ) ( ON ?auto_613631 ?auto_613630 ) ( ON ?auto_613632 ?auto_613631 ) ( not ( = ?auto_613625 ?auto_613626 ) ) ( not ( = ?auto_613625 ?auto_613627 ) ) ( not ( = ?auto_613625 ?auto_613628 ) ) ( not ( = ?auto_613625 ?auto_613629 ) ) ( not ( = ?auto_613625 ?auto_613630 ) ) ( not ( = ?auto_613625 ?auto_613631 ) ) ( not ( = ?auto_613625 ?auto_613632 ) ) ( not ( = ?auto_613625 ?auto_613633 ) ) ( not ( = ?auto_613625 ?auto_613634 ) ) ( not ( = ?auto_613625 ?auto_613635 ) ) ( not ( = ?auto_613626 ?auto_613627 ) ) ( not ( = ?auto_613626 ?auto_613628 ) ) ( not ( = ?auto_613626 ?auto_613629 ) ) ( not ( = ?auto_613626 ?auto_613630 ) ) ( not ( = ?auto_613626 ?auto_613631 ) ) ( not ( = ?auto_613626 ?auto_613632 ) ) ( not ( = ?auto_613626 ?auto_613633 ) ) ( not ( = ?auto_613626 ?auto_613634 ) ) ( not ( = ?auto_613626 ?auto_613635 ) ) ( not ( = ?auto_613627 ?auto_613628 ) ) ( not ( = ?auto_613627 ?auto_613629 ) ) ( not ( = ?auto_613627 ?auto_613630 ) ) ( not ( = ?auto_613627 ?auto_613631 ) ) ( not ( = ?auto_613627 ?auto_613632 ) ) ( not ( = ?auto_613627 ?auto_613633 ) ) ( not ( = ?auto_613627 ?auto_613634 ) ) ( not ( = ?auto_613627 ?auto_613635 ) ) ( not ( = ?auto_613628 ?auto_613629 ) ) ( not ( = ?auto_613628 ?auto_613630 ) ) ( not ( = ?auto_613628 ?auto_613631 ) ) ( not ( = ?auto_613628 ?auto_613632 ) ) ( not ( = ?auto_613628 ?auto_613633 ) ) ( not ( = ?auto_613628 ?auto_613634 ) ) ( not ( = ?auto_613628 ?auto_613635 ) ) ( not ( = ?auto_613629 ?auto_613630 ) ) ( not ( = ?auto_613629 ?auto_613631 ) ) ( not ( = ?auto_613629 ?auto_613632 ) ) ( not ( = ?auto_613629 ?auto_613633 ) ) ( not ( = ?auto_613629 ?auto_613634 ) ) ( not ( = ?auto_613629 ?auto_613635 ) ) ( not ( = ?auto_613630 ?auto_613631 ) ) ( not ( = ?auto_613630 ?auto_613632 ) ) ( not ( = ?auto_613630 ?auto_613633 ) ) ( not ( = ?auto_613630 ?auto_613634 ) ) ( not ( = ?auto_613630 ?auto_613635 ) ) ( not ( = ?auto_613631 ?auto_613632 ) ) ( not ( = ?auto_613631 ?auto_613633 ) ) ( not ( = ?auto_613631 ?auto_613634 ) ) ( not ( = ?auto_613631 ?auto_613635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613632 ?auto_613633 ?auto_613634 )
      ( MAKE-9CRATE-VERIFY ?auto_613625 ?auto_613626 ?auto_613627 ?auto_613628 ?auto_613629 ?auto_613630 ?auto_613631 ?auto_613632 ?auto_613633 ?auto_613634 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613641 - SURFACE
      ?auto_613642 - SURFACE
      ?auto_613643 - SURFACE
      ?auto_613644 - SURFACE
      ?auto_613645 - SURFACE
      ?auto_613646 - SURFACE
      ?auto_613647 - SURFACE
      ?auto_613648 - SURFACE
      ?auto_613649 - SURFACE
      ?auto_613650 - SURFACE
      ?auto_613651 - SURFACE
    )
    :vars
    (
      ?auto_613654 - HOIST
      ?auto_613655 - PLACE
      ?auto_613653 - PLACE
      ?auto_613657 - HOIST
      ?auto_613652 - SURFACE
      ?auto_613656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613654 ?auto_613655 ) ( IS-CRATE ?auto_613651 ) ( not ( = ?auto_613650 ?auto_613651 ) ) ( not ( = ?auto_613649 ?auto_613650 ) ) ( not ( = ?auto_613649 ?auto_613651 ) ) ( not ( = ?auto_613653 ?auto_613655 ) ) ( HOIST-AT ?auto_613657 ?auto_613653 ) ( not ( = ?auto_613654 ?auto_613657 ) ) ( AVAILABLE ?auto_613657 ) ( SURFACE-AT ?auto_613651 ?auto_613653 ) ( ON ?auto_613651 ?auto_613652 ) ( CLEAR ?auto_613651 ) ( not ( = ?auto_613650 ?auto_613652 ) ) ( not ( = ?auto_613651 ?auto_613652 ) ) ( not ( = ?auto_613649 ?auto_613652 ) ) ( SURFACE-AT ?auto_613649 ?auto_613655 ) ( CLEAR ?auto_613649 ) ( IS-CRATE ?auto_613650 ) ( AVAILABLE ?auto_613654 ) ( IN ?auto_613650 ?auto_613656 ) ( TRUCK-AT ?auto_613656 ?auto_613653 ) ( ON ?auto_613642 ?auto_613641 ) ( ON ?auto_613643 ?auto_613642 ) ( ON ?auto_613644 ?auto_613643 ) ( ON ?auto_613645 ?auto_613644 ) ( ON ?auto_613646 ?auto_613645 ) ( ON ?auto_613647 ?auto_613646 ) ( ON ?auto_613648 ?auto_613647 ) ( ON ?auto_613649 ?auto_613648 ) ( not ( = ?auto_613641 ?auto_613642 ) ) ( not ( = ?auto_613641 ?auto_613643 ) ) ( not ( = ?auto_613641 ?auto_613644 ) ) ( not ( = ?auto_613641 ?auto_613645 ) ) ( not ( = ?auto_613641 ?auto_613646 ) ) ( not ( = ?auto_613641 ?auto_613647 ) ) ( not ( = ?auto_613641 ?auto_613648 ) ) ( not ( = ?auto_613641 ?auto_613649 ) ) ( not ( = ?auto_613641 ?auto_613650 ) ) ( not ( = ?auto_613641 ?auto_613651 ) ) ( not ( = ?auto_613641 ?auto_613652 ) ) ( not ( = ?auto_613642 ?auto_613643 ) ) ( not ( = ?auto_613642 ?auto_613644 ) ) ( not ( = ?auto_613642 ?auto_613645 ) ) ( not ( = ?auto_613642 ?auto_613646 ) ) ( not ( = ?auto_613642 ?auto_613647 ) ) ( not ( = ?auto_613642 ?auto_613648 ) ) ( not ( = ?auto_613642 ?auto_613649 ) ) ( not ( = ?auto_613642 ?auto_613650 ) ) ( not ( = ?auto_613642 ?auto_613651 ) ) ( not ( = ?auto_613642 ?auto_613652 ) ) ( not ( = ?auto_613643 ?auto_613644 ) ) ( not ( = ?auto_613643 ?auto_613645 ) ) ( not ( = ?auto_613643 ?auto_613646 ) ) ( not ( = ?auto_613643 ?auto_613647 ) ) ( not ( = ?auto_613643 ?auto_613648 ) ) ( not ( = ?auto_613643 ?auto_613649 ) ) ( not ( = ?auto_613643 ?auto_613650 ) ) ( not ( = ?auto_613643 ?auto_613651 ) ) ( not ( = ?auto_613643 ?auto_613652 ) ) ( not ( = ?auto_613644 ?auto_613645 ) ) ( not ( = ?auto_613644 ?auto_613646 ) ) ( not ( = ?auto_613644 ?auto_613647 ) ) ( not ( = ?auto_613644 ?auto_613648 ) ) ( not ( = ?auto_613644 ?auto_613649 ) ) ( not ( = ?auto_613644 ?auto_613650 ) ) ( not ( = ?auto_613644 ?auto_613651 ) ) ( not ( = ?auto_613644 ?auto_613652 ) ) ( not ( = ?auto_613645 ?auto_613646 ) ) ( not ( = ?auto_613645 ?auto_613647 ) ) ( not ( = ?auto_613645 ?auto_613648 ) ) ( not ( = ?auto_613645 ?auto_613649 ) ) ( not ( = ?auto_613645 ?auto_613650 ) ) ( not ( = ?auto_613645 ?auto_613651 ) ) ( not ( = ?auto_613645 ?auto_613652 ) ) ( not ( = ?auto_613646 ?auto_613647 ) ) ( not ( = ?auto_613646 ?auto_613648 ) ) ( not ( = ?auto_613646 ?auto_613649 ) ) ( not ( = ?auto_613646 ?auto_613650 ) ) ( not ( = ?auto_613646 ?auto_613651 ) ) ( not ( = ?auto_613646 ?auto_613652 ) ) ( not ( = ?auto_613647 ?auto_613648 ) ) ( not ( = ?auto_613647 ?auto_613649 ) ) ( not ( = ?auto_613647 ?auto_613650 ) ) ( not ( = ?auto_613647 ?auto_613651 ) ) ( not ( = ?auto_613647 ?auto_613652 ) ) ( not ( = ?auto_613648 ?auto_613649 ) ) ( not ( = ?auto_613648 ?auto_613650 ) ) ( not ( = ?auto_613648 ?auto_613651 ) ) ( not ( = ?auto_613648 ?auto_613652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613649 ?auto_613650 ?auto_613651 )
      ( MAKE-10CRATE-VERIFY ?auto_613641 ?auto_613642 ?auto_613643 ?auto_613644 ?auto_613645 ?auto_613646 ?auto_613647 ?auto_613648 ?auto_613649 ?auto_613650 ?auto_613651 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_613658 - SURFACE
      ?auto_613659 - SURFACE
    )
    :vars
    (
      ?auto_613663 - HOIST
      ?auto_613664 - PLACE
      ?auto_613662 - SURFACE
      ?auto_613661 - PLACE
      ?auto_613666 - HOIST
      ?auto_613660 - SURFACE
      ?auto_613665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613663 ?auto_613664 ) ( IS-CRATE ?auto_613659 ) ( not ( = ?auto_613658 ?auto_613659 ) ) ( not ( = ?auto_613662 ?auto_613658 ) ) ( not ( = ?auto_613662 ?auto_613659 ) ) ( not ( = ?auto_613661 ?auto_613664 ) ) ( HOIST-AT ?auto_613666 ?auto_613661 ) ( not ( = ?auto_613663 ?auto_613666 ) ) ( SURFACE-AT ?auto_613659 ?auto_613661 ) ( ON ?auto_613659 ?auto_613660 ) ( CLEAR ?auto_613659 ) ( not ( = ?auto_613658 ?auto_613660 ) ) ( not ( = ?auto_613659 ?auto_613660 ) ) ( not ( = ?auto_613662 ?auto_613660 ) ) ( SURFACE-AT ?auto_613662 ?auto_613664 ) ( CLEAR ?auto_613662 ) ( IS-CRATE ?auto_613658 ) ( AVAILABLE ?auto_613663 ) ( TRUCK-AT ?auto_613665 ?auto_613661 ) ( LIFTING ?auto_613666 ?auto_613658 ) )
    :subtasks
    ( ( !LOAD ?auto_613666 ?auto_613658 ?auto_613665 ?auto_613661 )
      ( MAKE-2CRATE ?auto_613662 ?auto_613658 ?auto_613659 )
      ( MAKE-1CRATE-VERIFY ?auto_613658 ?auto_613659 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_613667 - SURFACE
      ?auto_613668 - SURFACE
      ?auto_613669 - SURFACE
    )
    :vars
    (
      ?auto_613673 - HOIST
      ?auto_613674 - PLACE
      ?auto_613670 - PLACE
      ?auto_613672 - HOIST
      ?auto_613675 - SURFACE
      ?auto_613671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613673 ?auto_613674 ) ( IS-CRATE ?auto_613669 ) ( not ( = ?auto_613668 ?auto_613669 ) ) ( not ( = ?auto_613667 ?auto_613668 ) ) ( not ( = ?auto_613667 ?auto_613669 ) ) ( not ( = ?auto_613670 ?auto_613674 ) ) ( HOIST-AT ?auto_613672 ?auto_613670 ) ( not ( = ?auto_613673 ?auto_613672 ) ) ( SURFACE-AT ?auto_613669 ?auto_613670 ) ( ON ?auto_613669 ?auto_613675 ) ( CLEAR ?auto_613669 ) ( not ( = ?auto_613668 ?auto_613675 ) ) ( not ( = ?auto_613669 ?auto_613675 ) ) ( not ( = ?auto_613667 ?auto_613675 ) ) ( SURFACE-AT ?auto_613667 ?auto_613674 ) ( CLEAR ?auto_613667 ) ( IS-CRATE ?auto_613668 ) ( AVAILABLE ?auto_613673 ) ( TRUCK-AT ?auto_613671 ?auto_613670 ) ( LIFTING ?auto_613672 ?auto_613668 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_613668 ?auto_613669 )
      ( MAKE-2CRATE-VERIFY ?auto_613667 ?auto_613668 ?auto_613669 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_613676 - SURFACE
      ?auto_613677 - SURFACE
      ?auto_613678 - SURFACE
      ?auto_613679 - SURFACE
    )
    :vars
    (
      ?auto_613680 - HOIST
      ?auto_613682 - PLACE
      ?auto_613683 - PLACE
      ?auto_613684 - HOIST
      ?auto_613681 - SURFACE
      ?auto_613685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613680 ?auto_613682 ) ( IS-CRATE ?auto_613679 ) ( not ( = ?auto_613678 ?auto_613679 ) ) ( not ( = ?auto_613677 ?auto_613678 ) ) ( not ( = ?auto_613677 ?auto_613679 ) ) ( not ( = ?auto_613683 ?auto_613682 ) ) ( HOIST-AT ?auto_613684 ?auto_613683 ) ( not ( = ?auto_613680 ?auto_613684 ) ) ( SURFACE-AT ?auto_613679 ?auto_613683 ) ( ON ?auto_613679 ?auto_613681 ) ( CLEAR ?auto_613679 ) ( not ( = ?auto_613678 ?auto_613681 ) ) ( not ( = ?auto_613679 ?auto_613681 ) ) ( not ( = ?auto_613677 ?auto_613681 ) ) ( SURFACE-AT ?auto_613677 ?auto_613682 ) ( CLEAR ?auto_613677 ) ( IS-CRATE ?auto_613678 ) ( AVAILABLE ?auto_613680 ) ( TRUCK-AT ?auto_613685 ?auto_613683 ) ( LIFTING ?auto_613684 ?auto_613678 ) ( ON ?auto_613677 ?auto_613676 ) ( not ( = ?auto_613676 ?auto_613677 ) ) ( not ( = ?auto_613676 ?auto_613678 ) ) ( not ( = ?auto_613676 ?auto_613679 ) ) ( not ( = ?auto_613676 ?auto_613681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613677 ?auto_613678 ?auto_613679 )
      ( MAKE-3CRATE-VERIFY ?auto_613676 ?auto_613677 ?auto_613678 ?auto_613679 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_613686 - SURFACE
      ?auto_613687 - SURFACE
      ?auto_613688 - SURFACE
      ?auto_613689 - SURFACE
      ?auto_613690 - SURFACE
    )
    :vars
    (
      ?auto_613691 - HOIST
      ?auto_613693 - PLACE
      ?auto_613694 - PLACE
      ?auto_613695 - HOIST
      ?auto_613692 - SURFACE
      ?auto_613696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613691 ?auto_613693 ) ( IS-CRATE ?auto_613690 ) ( not ( = ?auto_613689 ?auto_613690 ) ) ( not ( = ?auto_613688 ?auto_613689 ) ) ( not ( = ?auto_613688 ?auto_613690 ) ) ( not ( = ?auto_613694 ?auto_613693 ) ) ( HOIST-AT ?auto_613695 ?auto_613694 ) ( not ( = ?auto_613691 ?auto_613695 ) ) ( SURFACE-AT ?auto_613690 ?auto_613694 ) ( ON ?auto_613690 ?auto_613692 ) ( CLEAR ?auto_613690 ) ( not ( = ?auto_613689 ?auto_613692 ) ) ( not ( = ?auto_613690 ?auto_613692 ) ) ( not ( = ?auto_613688 ?auto_613692 ) ) ( SURFACE-AT ?auto_613688 ?auto_613693 ) ( CLEAR ?auto_613688 ) ( IS-CRATE ?auto_613689 ) ( AVAILABLE ?auto_613691 ) ( TRUCK-AT ?auto_613696 ?auto_613694 ) ( LIFTING ?auto_613695 ?auto_613689 ) ( ON ?auto_613687 ?auto_613686 ) ( ON ?auto_613688 ?auto_613687 ) ( not ( = ?auto_613686 ?auto_613687 ) ) ( not ( = ?auto_613686 ?auto_613688 ) ) ( not ( = ?auto_613686 ?auto_613689 ) ) ( not ( = ?auto_613686 ?auto_613690 ) ) ( not ( = ?auto_613686 ?auto_613692 ) ) ( not ( = ?auto_613687 ?auto_613688 ) ) ( not ( = ?auto_613687 ?auto_613689 ) ) ( not ( = ?auto_613687 ?auto_613690 ) ) ( not ( = ?auto_613687 ?auto_613692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613688 ?auto_613689 ?auto_613690 )
      ( MAKE-4CRATE-VERIFY ?auto_613686 ?auto_613687 ?auto_613688 ?auto_613689 ?auto_613690 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_613697 - SURFACE
      ?auto_613698 - SURFACE
      ?auto_613699 - SURFACE
      ?auto_613700 - SURFACE
      ?auto_613701 - SURFACE
      ?auto_613702 - SURFACE
    )
    :vars
    (
      ?auto_613703 - HOIST
      ?auto_613705 - PLACE
      ?auto_613706 - PLACE
      ?auto_613707 - HOIST
      ?auto_613704 - SURFACE
      ?auto_613708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613703 ?auto_613705 ) ( IS-CRATE ?auto_613702 ) ( not ( = ?auto_613701 ?auto_613702 ) ) ( not ( = ?auto_613700 ?auto_613701 ) ) ( not ( = ?auto_613700 ?auto_613702 ) ) ( not ( = ?auto_613706 ?auto_613705 ) ) ( HOIST-AT ?auto_613707 ?auto_613706 ) ( not ( = ?auto_613703 ?auto_613707 ) ) ( SURFACE-AT ?auto_613702 ?auto_613706 ) ( ON ?auto_613702 ?auto_613704 ) ( CLEAR ?auto_613702 ) ( not ( = ?auto_613701 ?auto_613704 ) ) ( not ( = ?auto_613702 ?auto_613704 ) ) ( not ( = ?auto_613700 ?auto_613704 ) ) ( SURFACE-AT ?auto_613700 ?auto_613705 ) ( CLEAR ?auto_613700 ) ( IS-CRATE ?auto_613701 ) ( AVAILABLE ?auto_613703 ) ( TRUCK-AT ?auto_613708 ?auto_613706 ) ( LIFTING ?auto_613707 ?auto_613701 ) ( ON ?auto_613698 ?auto_613697 ) ( ON ?auto_613699 ?auto_613698 ) ( ON ?auto_613700 ?auto_613699 ) ( not ( = ?auto_613697 ?auto_613698 ) ) ( not ( = ?auto_613697 ?auto_613699 ) ) ( not ( = ?auto_613697 ?auto_613700 ) ) ( not ( = ?auto_613697 ?auto_613701 ) ) ( not ( = ?auto_613697 ?auto_613702 ) ) ( not ( = ?auto_613697 ?auto_613704 ) ) ( not ( = ?auto_613698 ?auto_613699 ) ) ( not ( = ?auto_613698 ?auto_613700 ) ) ( not ( = ?auto_613698 ?auto_613701 ) ) ( not ( = ?auto_613698 ?auto_613702 ) ) ( not ( = ?auto_613698 ?auto_613704 ) ) ( not ( = ?auto_613699 ?auto_613700 ) ) ( not ( = ?auto_613699 ?auto_613701 ) ) ( not ( = ?auto_613699 ?auto_613702 ) ) ( not ( = ?auto_613699 ?auto_613704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613700 ?auto_613701 ?auto_613702 )
      ( MAKE-5CRATE-VERIFY ?auto_613697 ?auto_613698 ?auto_613699 ?auto_613700 ?auto_613701 ?auto_613702 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_613709 - SURFACE
      ?auto_613710 - SURFACE
      ?auto_613711 - SURFACE
      ?auto_613712 - SURFACE
      ?auto_613713 - SURFACE
      ?auto_613714 - SURFACE
      ?auto_613715 - SURFACE
    )
    :vars
    (
      ?auto_613716 - HOIST
      ?auto_613718 - PLACE
      ?auto_613719 - PLACE
      ?auto_613720 - HOIST
      ?auto_613717 - SURFACE
      ?auto_613721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613716 ?auto_613718 ) ( IS-CRATE ?auto_613715 ) ( not ( = ?auto_613714 ?auto_613715 ) ) ( not ( = ?auto_613713 ?auto_613714 ) ) ( not ( = ?auto_613713 ?auto_613715 ) ) ( not ( = ?auto_613719 ?auto_613718 ) ) ( HOIST-AT ?auto_613720 ?auto_613719 ) ( not ( = ?auto_613716 ?auto_613720 ) ) ( SURFACE-AT ?auto_613715 ?auto_613719 ) ( ON ?auto_613715 ?auto_613717 ) ( CLEAR ?auto_613715 ) ( not ( = ?auto_613714 ?auto_613717 ) ) ( not ( = ?auto_613715 ?auto_613717 ) ) ( not ( = ?auto_613713 ?auto_613717 ) ) ( SURFACE-AT ?auto_613713 ?auto_613718 ) ( CLEAR ?auto_613713 ) ( IS-CRATE ?auto_613714 ) ( AVAILABLE ?auto_613716 ) ( TRUCK-AT ?auto_613721 ?auto_613719 ) ( LIFTING ?auto_613720 ?auto_613714 ) ( ON ?auto_613710 ?auto_613709 ) ( ON ?auto_613711 ?auto_613710 ) ( ON ?auto_613712 ?auto_613711 ) ( ON ?auto_613713 ?auto_613712 ) ( not ( = ?auto_613709 ?auto_613710 ) ) ( not ( = ?auto_613709 ?auto_613711 ) ) ( not ( = ?auto_613709 ?auto_613712 ) ) ( not ( = ?auto_613709 ?auto_613713 ) ) ( not ( = ?auto_613709 ?auto_613714 ) ) ( not ( = ?auto_613709 ?auto_613715 ) ) ( not ( = ?auto_613709 ?auto_613717 ) ) ( not ( = ?auto_613710 ?auto_613711 ) ) ( not ( = ?auto_613710 ?auto_613712 ) ) ( not ( = ?auto_613710 ?auto_613713 ) ) ( not ( = ?auto_613710 ?auto_613714 ) ) ( not ( = ?auto_613710 ?auto_613715 ) ) ( not ( = ?auto_613710 ?auto_613717 ) ) ( not ( = ?auto_613711 ?auto_613712 ) ) ( not ( = ?auto_613711 ?auto_613713 ) ) ( not ( = ?auto_613711 ?auto_613714 ) ) ( not ( = ?auto_613711 ?auto_613715 ) ) ( not ( = ?auto_613711 ?auto_613717 ) ) ( not ( = ?auto_613712 ?auto_613713 ) ) ( not ( = ?auto_613712 ?auto_613714 ) ) ( not ( = ?auto_613712 ?auto_613715 ) ) ( not ( = ?auto_613712 ?auto_613717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613713 ?auto_613714 ?auto_613715 )
      ( MAKE-6CRATE-VERIFY ?auto_613709 ?auto_613710 ?auto_613711 ?auto_613712 ?auto_613713 ?auto_613714 ?auto_613715 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_613722 - SURFACE
      ?auto_613723 - SURFACE
      ?auto_613724 - SURFACE
      ?auto_613725 - SURFACE
      ?auto_613726 - SURFACE
      ?auto_613727 - SURFACE
      ?auto_613728 - SURFACE
      ?auto_613729 - SURFACE
    )
    :vars
    (
      ?auto_613730 - HOIST
      ?auto_613732 - PLACE
      ?auto_613733 - PLACE
      ?auto_613734 - HOIST
      ?auto_613731 - SURFACE
      ?auto_613735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613730 ?auto_613732 ) ( IS-CRATE ?auto_613729 ) ( not ( = ?auto_613728 ?auto_613729 ) ) ( not ( = ?auto_613727 ?auto_613728 ) ) ( not ( = ?auto_613727 ?auto_613729 ) ) ( not ( = ?auto_613733 ?auto_613732 ) ) ( HOIST-AT ?auto_613734 ?auto_613733 ) ( not ( = ?auto_613730 ?auto_613734 ) ) ( SURFACE-AT ?auto_613729 ?auto_613733 ) ( ON ?auto_613729 ?auto_613731 ) ( CLEAR ?auto_613729 ) ( not ( = ?auto_613728 ?auto_613731 ) ) ( not ( = ?auto_613729 ?auto_613731 ) ) ( not ( = ?auto_613727 ?auto_613731 ) ) ( SURFACE-AT ?auto_613727 ?auto_613732 ) ( CLEAR ?auto_613727 ) ( IS-CRATE ?auto_613728 ) ( AVAILABLE ?auto_613730 ) ( TRUCK-AT ?auto_613735 ?auto_613733 ) ( LIFTING ?auto_613734 ?auto_613728 ) ( ON ?auto_613723 ?auto_613722 ) ( ON ?auto_613724 ?auto_613723 ) ( ON ?auto_613725 ?auto_613724 ) ( ON ?auto_613726 ?auto_613725 ) ( ON ?auto_613727 ?auto_613726 ) ( not ( = ?auto_613722 ?auto_613723 ) ) ( not ( = ?auto_613722 ?auto_613724 ) ) ( not ( = ?auto_613722 ?auto_613725 ) ) ( not ( = ?auto_613722 ?auto_613726 ) ) ( not ( = ?auto_613722 ?auto_613727 ) ) ( not ( = ?auto_613722 ?auto_613728 ) ) ( not ( = ?auto_613722 ?auto_613729 ) ) ( not ( = ?auto_613722 ?auto_613731 ) ) ( not ( = ?auto_613723 ?auto_613724 ) ) ( not ( = ?auto_613723 ?auto_613725 ) ) ( not ( = ?auto_613723 ?auto_613726 ) ) ( not ( = ?auto_613723 ?auto_613727 ) ) ( not ( = ?auto_613723 ?auto_613728 ) ) ( not ( = ?auto_613723 ?auto_613729 ) ) ( not ( = ?auto_613723 ?auto_613731 ) ) ( not ( = ?auto_613724 ?auto_613725 ) ) ( not ( = ?auto_613724 ?auto_613726 ) ) ( not ( = ?auto_613724 ?auto_613727 ) ) ( not ( = ?auto_613724 ?auto_613728 ) ) ( not ( = ?auto_613724 ?auto_613729 ) ) ( not ( = ?auto_613724 ?auto_613731 ) ) ( not ( = ?auto_613725 ?auto_613726 ) ) ( not ( = ?auto_613725 ?auto_613727 ) ) ( not ( = ?auto_613725 ?auto_613728 ) ) ( not ( = ?auto_613725 ?auto_613729 ) ) ( not ( = ?auto_613725 ?auto_613731 ) ) ( not ( = ?auto_613726 ?auto_613727 ) ) ( not ( = ?auto_613726 ?auto_613728 ) ) ( not ( = ?auto_613726 ?auto_613729 ) ) ( not ( = ?auto_613726 ?auto_613731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613727 ?auto_613728 ?auto_613729 )
      ( MAKE-7CRATE-VERIFY ?auto_613722 ?auto_613723 ?auto_613724 ?auto_613725 ?auto_613726 ?auto_613727 ?auto_613728 ?auto_613729 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_613736 - SURFACE
      ?auto_613737 - SURFACE
      ?auto_613738 - SURFACE
      ?auto_613739 - SURFACE
      ?auto_613740 - SURFACE
      ?auto_613741 - SURFACE
      ?auto_613742 - SURFACE
      ?auto_613743 - SURFACE
      ?auto_613744 - SURFACE
    )
    :vars
    (
      ?auto_613745 - HOIST
      ?auto_613747 - PLACE
      ?auto_613748 - PLACE
      ?auto_613749 - HOIST
      ?auto_613746 - SURFACE
      ?auto_613750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613745 ?auto_613747 ) ( IS-CRATE ?auto_613744 ) ( not ( = ?auto_613743 ?auto_613744 ) ) ( not ( = ?auto_613742 ?auto_613743 ) ) ( not ( = ?auto_613742 ?auto_613744 ) ) ( not ( = ?auto_613748 ?auto_613747 ) ) ( HOIST-AT ?auto_613749 ?auto_613748 ) ( not ( = ?auto_613745 ?auto_613749 ) ) ( SURFACE-AT ?auto_613744 ?auto_613748 ) ( ON ?auto_613744 ?auto_613746 ) ( CLEAR ?auto_613744 ) ( not ( = ?auto_613743 ?auto_613746 ) ) ( not ( = ?auto_613744 ?auto_613746 ) ) ( not ( = ?auto_613742 ?auto_613746 ) ) ( SURFACE-AT ?auto_613742 ?auto_613747 ) ( CLEAR ?auto_613742 ) ( IS-CRATE ?auto_613743 ) ( AVAILABLE ?auto_613745 ) ( TRUCK-AT ?auto_613750 ?auto_613748 ) ( LIFTING ?auto_613749 ?auto_613743 ) ( ON ?auto_613737 ?auto_613736 ) ( ON ?auto_613738 ?auto_613737 ) ( ON ?auto_613739 ?auto_613738 ) ( ON ?auto_613740 ?auto_613739 ) ( ON ?auto_613741 ?auto_613740 ) ( ON ?auto_613742 ?auto_613741 ) ( not ( = ?auto_613736 ?auto_613737 ) ) ( not ( = ?auto_613736 ?auto_613738 ) ) ( not ( = ?auto_613736 ?auto_613739 ) ) ( not ( = ?auto_613736 ?auto_613740 ) ) ( not ( = ?auto_613736 ?auto_613741 ) ) ( not ( = ?auto_613736 ?auto_613742 ) ) ( not ( = ?auto_613736 ?auto_613743 ) ) ( not ( = ?auto_613736 ?auto_613744 ) ) ( not ( = ?auto_613736 ?auto_613746 ) ) ( not ( = ?auto_613737 ?auto_613738 ) ) ( not ( = ?auto_613737 ?auto_613739 ) ) ( not ( = ?auto_613737 ?auto_613740 ) ) ( not ( = ?auto_613737 ?auto_613741 ) ) ( not ( = ?auto_613737 ?auto_613742 ) ) ( not ( = ?auto_613737 ?auto_613743 ) ) ( not ( = ?auto_613737 ?auto_613744 ) ) ( not ( = ?auto_613737 ?auto_613746 ) ) ( not ( = ?auto_613738 ?auto_613739 ) ) ( not ( = ?auto_613738 ?auto_613740 ) ) ( not ( = ?auto_613738 ?auto_613741 ) ) ( not ( = ?auto_613738 ?auto_613742 ) ) ( not ( = ?auto_613738 ?auto_613743 ) ) ( not ( = ?auto_613738 ?auto_613744 ) ) ( not ( = ?auto_613738 ?auto_613746 ) ) ( not ( = ?auto_613739 ?auto_613740 ) ) ( not ( = ?auto_613739 ?auto_613741 ) ) ( not ( = ?auto_613739 ?auto_613742 ) ) ( not ( = ?auto_613739 ?auto_613743 ) ) ( not ( = ?auto_613739 ?auto_613744 ) ) ( not ( = ?auto_613739 ?auto_613746 ) ) ( not ( = ?auto_613740 ?auto_613741 ) ) ( not ( = ?auto_613740 ?auto_613742 ) ) ( not ( = ?auto_613740 ?auto_613743 ) ) ( not ( = ?auto_613740 ?auto_613744 ) ) ( not ( = ?auto_613740 ?auto_613746 ) ) ( not ( = ?auto_613741 ?auto_613742 ) ) ( not ( = ?auto_613741 ?auto_613743 ) ) ( not ( = ?auto_613741 ?auto_613744 ) ) ( not ( = ?auto_613741 ?auto_613746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613742 ?auto_613743 ?auto_613744 )
      ( MAKE-8CRATE-VERIFY ?auto_613736 ?auto_613737 ?auto_613738 ?auto_613739 ?auto_613740 ?auto_613741 ?auto_613742 ?auto_613743 ?auto_613744 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_613751 - SURFACE
      ?auto_613752 - SURFACE
      ?auto_613753 - SURFACE
      ?auto_613754 - SURFACE
      ?auto_613755 - SURFACE
      ?auto_613756 - SURFACE
      ?auto_613757 - SURFACE
      ?auto_613758 - SURFACE
      ?auto_613759 - SURFACE
      ?auto_613760 - SURFACE
    )
    :vars
    (
      ?auto_613761 - HOIST
      ?auto_613763 - PLACE
      ?auto_613764 - PLACE
      ?auto_613765 - HOIST
      ?auto_613762 - SURFACE
      ?auto_613766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613761 ?auto_613763 ) ( IS-CRATE ?auto_613760 ) ( not ( = ?auto_613759 ?auto_613760 ) ) ( not ( = ?auto_613758 ?auto_613759 ) ) ( not ( = ?auto_613758 ?auto_613760 ) ) ( not ( = ?auto_613764 ?auto_613763 ) ) ( HOIST-AT ?auto_613765 ?auto_613764 ) ( not ( = ?auto_613761 ?auto_613765 ) ) ( SURFACE-AT ?auto_613760 ?auto_613764 ) ( ON ?auto_613760 ?auto_613762 ) ( CLEAR ?auto_613760 ) ( not ( = ?auto_613759 ?auto_613762 ) ) ( not ( = ?auto_613760 ?auto_613762 ) ) ( not ( = ?auto_613758 ?auto_613762 ) ) ( SURFACE-AT ?auto_613758 ?auto_613763 ) ( CLEAR ?auto_613758 ) ( IS-CRATE ?auto_613759 ) ( AVAILABLE ?auto_613761 ) ( TRUCK-AT ?auto_613766 ?auto_613764 ) ( LIFTING ?auto_613765 ?auto_613759 ) ( ON ?auto_613752 ?auto_613751 ) ( ON ?auto_613753 ?auto_613752 ) ( ON ?auto_613754 ?auto_613753 ) ( ON ?auto_613755 ?auto_613754 ) ( ON ?auto_613756 ?auto_613755 ) ( ON ?auto_613757 ?auto_613756 ) ( ON ?auto_613758 ?auto_613757 ) ( not ( = ?auto_613751 ?auto_613752 ) ) ( not ( = ?auto_613751 ?auto_613753 ) ) ( not ( = ?auto_613751 ?auto_613754 ) ) ( not ( = ?auto_613751 ?auto_613755 ) ) ( not ( = ?auto_613751 ?auto_613756 ) ) ( not ( = ?auto_613751 ?auto_613757 ) ) ( not ( = ?auto_613751 ?auto_613758 ) ) ( not ( = ?auto_613751 ?auto_613759 ) ) ( not ( = ?auto_613751 ?auto_613760 ) ) ( not ( = ?auto_613751 ?auto_613762 ) ) ( not ( = ?auto_613752 ?auto_613753 ) ) ( not ( = ?auto_613752 ?auto_613754 ) ) ( not ( = ?auto_613752 ?auto_613755 ) ) ( not ( = ?auto_613752 ?auto_613756 ) ) ( not ( = ?auto_613752 ?auto_613757 ) ) ( not ( = ?auto_613752 ?auto_613758 ) ) ( not ( = ?auto_613752 ?auto_613759 ) ) ( not ( = ?auto_613752 ?auto_613760 ) ) ( not ( = ?auto_613752 ?auto_613762 ) ) ( not ( = ?auto_613753 ?auto_613754 ) ) ( not ( = ?auto_613753 ?auto_613755 ) ) ( not ( = ?auto_613753 ?auto_613756 ) ) ( not ( = ?auto_613753 ?auto_613757 ) ) ( not ( = ?auto_613753 ?auto_613758 ) ) ( not ( = ?auto_613753 ?auto_613759 ) ) ( not ( = ?auto_613753 ?auto_613760 ) ) ( not ( = ?auto_613753 ?auto_613762 ) ) ( not ( = ?auto_613754 ?auto_613755 ) ) ( not ( = ?auto_613754 ?auto_613756 ) ) ( not ( = ?auto_613754 ?auto_613757 ) ) ( not ( = ?auto_613754 ?auto_613758 ) ) ( not ( = ?auto_613754 ?auto_613759 ) ) ( not ( = ?auto_613754 ?auto_613760 ) ) ( not ( = ?auto_613754 ?auto_613762 ) ) ( not ( = ?auto_613755 ?auto_613756 ) ) ( not ( = ?auto_613755 ?auto_613757 ) ) ( not ( = ?auto_613755 ?auto_613758 ) ) ( not ( = ?auto_613755 ?auto_613759 ) ) ( not ( = ?auto_613755 ?auto_613760 ) ) ( not ( = ?auto_613755 ?auto_613762 ) ) ( not ( = ?auto_613756 ?auto_613757 ) ) ( not ( = ?auto_613756 ?auto_613758 ) ) ( not ( = ?auto_613756 ?auto_613759 ) ) ( not ( = ?auto_613756 ?auto_613760 ) ) ( not ( = ?auto_613756 ?auto_613762 ) ) ( not ( = ?auto_613757 ?auto_613758 ) ) ( not ( = ?auto_613757 ?auto_613759 ) ) ( not ( = ?auto_613757 ?auto_613760 ) ) ( not ( = ?auto_613757 ?auto_613762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613758 ?auto_613759 ?auto_613760 )
      ( MAKE-9CRATE-VERIFY ?auto_613751 ?auto_613752 ?auto_613753 ?auto_613754 ?auto_613755 ?auto_613756 ?auto_613757 ?auto_613758 ?auto_613759 ?auto_613760 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613767 - SURFACE
      ?auto_613768 - SURFACE
      ?auto_613769 - SURFACE
      ?auto_613770 - SURFACE
      ?auto_613771 - SURFACE
      ?auto_613772 - SURFACE
      ?auto_613773 - SURFACE
      ?auto_613774 - SURFACE
      ?auto_613775 - SURFACE
      ?auto_613776 - SURFACE
      ?auto_613777 - SURFACE
    )
    :vars
    (
      ?auto_613778 - HOIST
      ?auto_613780 - PLACE
      ?auto_613781 - PLACE
      ?auto_613782 - HOIST
      ?auto_613779 - SURFACE
      ?auto_613783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613778 ?auto_613780 ) ( IS-CRATE ?auto_613777 ) ( not ( = ?auto_613776 ?auto_613777 ) ) ( not ( = ?auto_613775 ?auto_613776 ) ) ( not ( = ?auto_613775 ?auto_613777 ) ) ( not ( = ?auto_613781 ?auto_613780 ) ) ( HOIST-AT ?auto_613782 ?auto_613781 ) ( not ( = ?auto_613778 ?auto_613782 ) ) ( SURFACE-AT ?auto_613777 ?auto_613781 ) ( ON ?auto_613777 ?auto_613779 ) ( CLEAR ?auto_613777 ) ( not ( = ?auto_613776 ?auto_613779 ) ) ( not ( = ?auto_613777 ?auto_613779 ) ) ( not ( = ?auto_613775 ?auto_613779 ) ) ( SURFACE-AT ?auto_613775 ?auto_613780 ) ( CLEAR ?auto_613775 ) ( IS-CRATE ?auto_613776 ) ( AVAILABLE ?auto_613778 ) ( TRUCK-AT ?auto_613783 ?auto_613781 ) ( LIFTING ?auto_613782 ?auto_613776 ) ( ON ?auto_613768 ?auto_613767 ) ( ON ?auto_613769 ?auto_613768 ) ( ON ?auto_613770 ?auto_613769 ) ( ON ?auto_613771 ?auto_613770 ) ( ON ?auto_613772 ?auto_613771 ) ( ON ?auto_613773 ?auto_613772 ) ( ON ?auto_613774 ?auto_613773 ) ( ON ?auto_613775 ?auto_613774 ) ( not ( = ?auto_613767 ?auto_613768 ) ) ( not ( = ?auto_613767 ?auto_613769 ) ) ( not ( = ?auto_613767 ?auto_613770 ) ) ( not ( = ?auto_613767 ?auto_613771 ) ) ( not ( = ?auto_613767 ?auto_613772 ) ) ( not ( = ?auto_613767 ?auto_613773 ) ) ( not ( = ?auto_613767 ?auto_613774 ) ) ( not ( = ?auto_613767 ?auto_613775 ) ) ( not ( = ?auto_613767 ?auto_613776 ) ) ( not ( = ?auto_613767 ?auto_613777 ) ) ( not ( = ?auto_613767 ?auto_613779 ) ) ( not ( = ?auto_613768 ?auto_613769 ) ) ( not ( = ?auto_613768 ?auto_613770 ) ) ( not ( = ?auto_613768 ?auto_613771 ) ) ( not ( = ?auto_613768 ?auto_613772 ) ) ( not ( = ?auto_613768 ?auto_613773 ) ) ( not ( = ?auto_613768 ?auto_613774 ) ) ( not ( = ?auto_613768 ?auto_613775 ) ) ( not ( = ?auto_613768 ?auto_613776 ) ) ( not ( = ?auto_613768 ?auto_613777 ) ) ( not ( = ?auto_613768 ?auto_613779 ) ) ( not ( = ?auto_613769 ?auto_613770 ) ) ( not ( = ?auto_613769 ?auto_613771 ) ) ( not ( = ?auto_613769 ?auto_613772 ) ) ( not ( = ?auto_613769 ?auto_613773 ) ) ( not ( = ?auto_613769 ?auto_613774 ) ) ( not ( = ?auto_613769 ?auto_613775 ) ) ( not ( = ?auto_613769 ?auto_613776 ) ) ( not ( = ?auto_613769 ?auto_613777 ) ) ( not ( = ?auto_613769 ?auto_613779 ) ) ( not ( = ?auto_613770 ?auto_613771 ) ) ( not ( = ?auto_613770 ?auto_613772 ) ) ( not ( = ?auto_613770 ?auto_613773 ) ) ( not ( = ?auto_613770 ?auto_613774 ) ) ( not ( = ?auto_613770 ?auto_613775 ) ) ( not ( = ?auto_613770 ?auto_613776 ) ) ( not ( = ?auto_613770 ?auto_613777 ) ) ( not ( = ?auto_613770 ?auto_613779 ) ) ( not ( = ?auto_613771 ?auto_613772 ) ) ( not ( = ?auto_613771 ?auto_613773 ) ) ( not ( = ?auto_613771 ?auto_613774 ) ) ( not ( = ?auto_613771 ?auto_613775 ) ) ( not ( = ?auto_613771 ?auto_613776 ) ) ( not ( = ?auto_613771 ?auto_613777 ) ) ( not ( = ?auto_613771 ?auto_613779 ) ) ( not ( = ?auto_613772 ?auto_613773 ) ) ( not ( = ?auto_613772 ?auto_613774 ) ) ( not ( = ?auto_613772 ?auto_613775 ) ) ( not ( = ?auto_613772 ?auto_613776 ) ) ( not ( = ?auto_613772 ?auto_613777 ) ) ( not ( = ?auto_613772 ?auto_613779 ) ) ( not ( = ?auto_613773 ?auto_613774 ) ) ( not ( = ?auto_613773 ?auto_613775 ) ) ( not ( = ?auto_613773 ?auto_613776 ) ) ( not ( = ?auto_613773 ?auto_613777 ) ) ( not ( = ?auto_613773 ?auto_613779 ) ) ( not ( = ?auto_613774 ?auto_613775 ) ) ( not ( = ?auto_613774 ?auto_613776 ) ) ( not ( = ?auto_613774 ?auto_613777 ) ) ( not ( = ?auto_613774 ?auto_613779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613775 ?auto_613776 ?auto_613777 )
      ( MAKE-10CRATE-VERIFY ?auto_613767 ?auto_613768 ?auto_613769 ?auto_613770 ?auto_613771 ?auto_613772 ?auto_613773 ?auto_613774 ?auto_613775 ?auto_613776 ?auto_613777 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_613784 - SURFACE
      ?auto_613785 - SURFACE
    )
    :vars
    (
      ?auto_613787 - HOIST
      ?auto_613789 - PLACE
      ?auto_613786 - SURFACE
      ?auto_613790 - PLACE
      ?auto_613791 - HOIST
      ?auto_613788 - SURFACE
      ?auto_613792 - TRUCK
      ?auto_613793 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613787 ?auto_613789 ) ( IS-CRATE ?auto_613785 ) ( not ( = ?auto_613784 ?auto_613785 ) ) ( not ( = ?auto_613786 ?auto_613784 ) ) ( not ( = ?auto_613786 ?auto_613785 ) ) ( not ( = ?auto_613790 ?auto_613789 ) ) ( HOIST-AT ?auto_613791 ?auto_613790 ) ( not ( = ?auto_613787 ?auto_613791 ) ) ( SURFACE-AT ?auto_613785 ?auto_613790 ) ( ON ?auto_613785 ?auto_613788 ) ( CLEAR ?auto_613785 ) ( not ( = ?auto_613784 ?auto_613788 ) ) ( not ( = ?auto_613785 ?auto_613788 ) ) ( not ( = ?auto_613786 ?auto_613788 ) ) ( SURFACE-AT ?auto_613786 ?auto_613789 ) ( CLEAR ?auto_613786 ) ( IS-CRATE ?auto_613784 ) ( AVAILABLE ?auto_613787 ) ( TRUCK-AT ?auto_613792 ?auto_613790 ) ( AVAILABLE ?auto_613791 ) ( SURFACE-AT ?auto_613784 ?auto_613790 ) ( ON ?auto_613784 ?auto_613793 ) ( CLEAR ?auto_613784 ) ( not ( = ?auto_613784 ?auto_613793 ) ) ( not ( = ?auto_613785 ?auto_613793 ) ) ( not ( = ?auto_613786 ?auto_613793 ) ) ( not ( = ?auto_613788 ?auto_613793 ) ) )
    :subtasks
    ( ( !LIFT ?auto_613791 ?auto_613784 ?auto_613793 ?auto_613790 )
      ( MAKE-2CRATE ?auto_613786 ?auto_613784 ?auto_613785 )
      ( MAKE-1CRATE-VERIFY ?auto_613784 ?auto_613785 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_613794 - SURFACE
      ?auto_613795 - SURFACE
      ?auto_613796 - SURFACE
    )
    :vars
    (
      ?auto_613802 - HOIST
      ?auto_613800 - PLACE
      ?auto_613801 - PLACE
      ?auto_613797 - HOIST
      ?auto_613798 - SURFACE
      ?auto_613799 - TRUCK
      ?auto_613803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613802 ?auto_613800 ) ( IS-CRATE ?auto_613796 ) ( not ( = ?auto_613795 ?auto_613796 ) ) ( not ( = ?auto_613794 ?auto_613795 ) ) ( not ( = ?auto_613794 ?auto_613796 ) ) ( not ( = ?auto_613801 ?auto_613800 ) ) ( HOIST-AT ?auto_613797 ?auto_613801 ) ( not ( = ?auto_613802 ?auto_613797 ) ) ( SURFACE-AT ?auto_613796 ?auto_613801 ) ( ON ?auto_613796 ?auto_613798 ) ( CLEAR ?auto_613796 ) ( not ( = ?auto_613795 ?auto_613798 ) ) ( not ( = ?auto_613796 ?auto_613798 ) ) ( not ( = ?auto_613794 ?auto_613798 ) ) ( SURFACE-AT ?auto_613794 ?auto_613800 ) ( CLEAR ?auto_613794 ) ( IS-CRATE ?auto_613795 ) ( AVAILABLE ?auto_613802 ) ( TRUCK-AT ?auto_613799 ?auto_613801 ) ( AVAILABLE ?auto_613797 ) ( SURFACE-AT ?auto_613795 ?auto_613801 ) ( ON ?auto_613795 ?auto_613803 ) ( CLEAR ?auto_613795 ) ( not ( = ?auto_613795 ?auto_613803 ) ) ( not ( = ?auto_613796 ?auto_613803 ) ) ( not ( = ?auto_613794 ?auto_613803 ) ) ( not ( = ?auto_613798 ?auto_613803 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_613795 ?auto_613796 )
      ( MAKE-2CRATE-VERIFY ?auto_613794 ?auto_613795 ?auto_613796 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_613804 - SURFACE
      ?auto_613805 - SURFACE
      ?auto_613806 - SURFACE
      ?auto_613807 - SURFACE
    )
    :vars
    (
      ?auto_613813 - HOIST
      ?auto_613811 - PLACE
      ?auto_613812 - PLACE
      ?auto_613814 - HOIST
      ?auto_613810 - SURFACE
      ?auto_613809 - TRUCK
      ?auto_613808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613813 ?auto_613811 ) ( IS-CRATE ?auto_613807 ) ( not ( = ?auto_613806 ?auto_613807 ) ) ( not ( = ?auto_613805 ?auto_613806 ) ) ( not ( = ?auto_613805 ?auto_613807 ) ) ( not ( = ?auto_613812 ?auto_613811 ) ) ( HOIST-AT ?auto_613814 ?auto_613812 ) ( not ( = ?auto_613813 ?auto_613814 ) ) ( SURFACE-AT ?auto_613807 ?auto_613812 ) ( ON ?auto_613807 ?auto_613810 ) ( CLEAR ?auto_613807 ) ( not ( = ?auto_613806 ?auto_613810 ) ) ( not ( = ?auto_613807 ?auto_613810 ) ) ( not ( = ?auto_613805 ?auto_613810 ) ) ( SURFACE-AT ?auto_613805 ?auto_613811 ) ( CLEAR ?auto_613805 ) ( IS-CRATE ?auto_613806 ) ( AVAILABLE ?auto_613813 ) ( TRUCK-AT ?auto_613809 ?auto_613812 ) ( AVAILABLE ?auto_613814 ) ( SURFACE-AT ?auto_613806 ?auto_613812 ) ( ON ?auto_613806 ?auto_613808 ) ( CLEAR ?auto_613806 ) ( not ( = ?auto_613806 ?auto_613808 ) ) ( not ( = ?auto_613807 ?auto_613808 ) ) ( not ( = ?auto_613805 ?auto_613808 ) ) ( not ( = ?auto_613810 ?auto_613808 ) ) ( ON ?auto_613805 ?auto_613804 ) ( not ( = ?auto_613804 ?auto_613805 ) ) ( not ( = ?auto_613804 ?auto_613806 ) ) ( not ( = ?auto_613804 ?auto_613807 ) ) ( not ( = ?auto_613804 ?auto_613810 ) ) ( not ( = ?auto_613804 ?auto_613808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613805 ?auto_613806 ?auto_613807 )
      ( MAKE-3CRATE-VERIFY ?auto_613804 ?auto_613805 ?auto_613806 ?auto_613807 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_613815 - SURFACE
      ?auto_613816 - SURFACE
      ?auto_613817 - SURFACE
      ?auto_613818 - SURFACE
      ?auto_613819 - SURFACE
    )
    :vars
    (
      ?auto_613825 - HOIST
      ?auto_613823 - PLACE
      ?auto_613824 - PLACE
      ?auto_613826 - HOIST
      ?auto_613822 - SURFACE
      ?auto_613821 - TRUCK
      ?auto_613820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613825 ?auto_613823 ) ( IS-CRATE ?auto_613819 ) ( not ( = ?auto_613818 ?auto_613819 ) ) ( not ( = ?auto_613817 ?auto_613818 ) ) ( not ( = ?auto_613817 ?auto_613819 ) ) ( not ( = ?auto_613824 ?auto_613823 ) ) ( HOIST-AT ?auto_613826 ?auto_613824 ) ( not ( = ?auto_613825 ?auto_613826 ) ) ( SURFACE-AT ?auto_613819 ?auto_613824 ) ( ON ?auto_613819 ?auto_613822 ) ( CLEAR ?auto_613819 ) ( not ( = ?auto_613818 ?auto_613822 ) ) ( not ( = ?auto_613819 ?auto_613822 ) ) ( not ( = ?auto_613817 ?auto_613822 ) ) ( SURFACE-AT ?auto_613817 ?auto_613823 ) ( CLEAR ?auto_613817 ) ( IS-CRATE ?auto_613818 ) ( AVAILABLE ?auto_613825 ) ( TRUCK-AT ?auto_613821 ?auto_613824 ) ( AVAILABLE ?auto_613826 ) ( SURFACE-AT ?auto_613818 ?auto_613824 ) ( ON ?auto_613818 ?auto_613820 ) ( CLEAR ?auto_613818 ) ( not ( = ?auto_613818 ?auto_613820 ) ) ( not ( = ?auto_613819 ?auto_613820 ) ) ( not ( = ?auto_613817 ?auto_613820 ) ) ( not ( = ?auto_613822 ?auto_613820 ) ) ( ON ?auto_613816 ?auto_613815 ) ( ON ?auto_613817 ?auto_613816 ) ( not ( = ?auto_613815 ?auto_613816 ) ) ( not ( = ?auto_613815 ?auto_613817 ) ) ( not ( = ?auto_613815 ?auto_613818 ) ) ( not ( = ?auto_613815 ?auto_613819 ) ) ( not ( = ?auto_613815 ?auto_613822 ) ) ( not ( = ?auto_613815 ?auto_613820 ) ) ( not ( = ?auto_613816 ?auto_613817 ) ) ( not ( = ?auto_613816 ?auto_613818 ) ) ( not ( = ?auto_613816 ?auto_613819 ) ) ( not ( = ?auto_613816 ?auto_613822 ) ) ( not ( = ?auto_613816 ?auto_613820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613817 ?auto_613818 ?auto_613819 )
      ( MAKE-4CRATE-VERIFY ?auto_613815 ?auto_613816 ?auto_613817 ?auto_613818 ?auto_613819 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_613827 - SURFACE
      ?auto_613828 - SURFACE
      ?auto_613829 - SURFACE
      ?auto_613830 - SURFACE
      ?auto_613831 - SURFACE
      ?auto_613832 - SURFACE
    )
    :vars
    (
      ?auto_613838 - HOIST
      ?auto_613836 - PLACE
      ?auto_613837 - PLACE
      ?auto_613839 - HOIST
      ?auto_613835 - SURFACE
      ?auto_613834 - TRUCK
      ?auto_613833 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613838 ?auto_613836 ) ( IS-CRATE ?auto_613832 ) ( not ( = ?auto_613831 ?auto_613832 ) ) ( not ( = ?auto_613830 ?auto_613831 ) ) ( not ( = ?auto_613830 ?auto_613832 ) ) ( not ( = ?auto_613837 ?auto_613836 ) ) ( HOIST-AT ?auto_613839 ?auto_613837 ) ( not ( = ?auto_613838 ?auto_613839 ) ) ( SURFACE-AT ?auto_613832 ?auto_613837 ) ( ON ?auto_613832 ?auto_613835 ) ( CLEAR ?auto_613832 ) ( not ( = ?auto_613831 ?auto_613835 ) ) ( not ( = ?auto_613832 ?auto_613835 ) ) ( not ( = ?auto_613830 ?auto_613835 ) ) ( SURFACE-AT ?auto_613830 ?auto_613836 ) ( CLEAR ?auto_613830 ) ( IS-CRATE ?auto_613831 ) ( AVAILABLE ?auto_613838 ) ( TRUCK-AT ?auto_613834 ?auto_613837 ) ( AVAILABLE ?auto_613839 ) ( SURFACE-AT ?auto_613831 ?auto_613837 ) ( ON ?auto_613831 ?auto_613833 ) ( CLEAR ?auto_613831 ) ( not ( = ?auto_613831 ?auto_613833 ) ) ( not ( = ?auto_613832 ?auto_613833 ) ) ( not ( = ?auto_613830 ?auto_613833 ) ) ( not ( = ?auto_613835 ?auto_613833 ) ) ( ON ?auto_613828 ?auto_613827 ) ( ON ?auto_613829 ?auto_613828 ) ( ON ?auto_613830 ?auto_613829 ) ( not ( = ?auto_613827 ?auto_613828 ) ) ( not ( = ?auto_613827 ?auto_613829 ) ) ( not ( = ?auto_613827 ?auto_613830 ) ) ( not ( = ?auto_613827 ?auto_613831 ) ) ( not ( = ?auto_613827 ?auto_613832 ) ) ( not ( = ?auto_613827 ?auto_613835 ) ) ( not ( = ?auto_613827 ?auto_613833 ) ) ( not ( = ?auto_613828 ?auto_613829 ) ) ( not ( = ?auto_613828 ?auto_613830 ) ) ( not ( = ?auto_613828 ?auto_613831 ) ) ( not ( = ?auto_613828 ?auto_613832 ) ) ( not ( = ?auto_613828 ?auto_613835 ) ) ( not ( = ?auto_613828 ?auto_613833 ) ) ( not ( = ?auto_613829 ?auto_613830 ) ) ( not ( = ?auto_613829 ?auto_613831 ) ) ( not ( = ?auto_613829 ?auto_613832 ) ) ( not ( = ?auto_613829 ?auto_613835 ) ) ( not ( = ?auto_613829 ?auto_613833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613830 ?auto_613831 ?auto_613832 )
      ( MAKE-5CRATE-VERIFY ?auto_613827 ?auto_613828 ?auto_613829 ?auto_613830 ?auto_613831 ?auto_613832 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_613840 - SURFACE
      ?auto_613841 - SURFACE
      ?auto_613842 - SURFACE
      ?auto_613843 - SURFACE
      ?auto_613844 - SURFACE
      ?auto_613845 - SURFACE
      ?auto_613846 - SURFACE
    )
    :vars
    (
      ?auto_613852 - HOIST
      ?auto_613850 - PLACE
      ?auto_613851 - PLACE
      ?auto_613853 - HOIST
      ?auto_613849 - SURFACE
      ?auto_613848 - TRUCK
      ?auto_613847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613852 ?auto_613850 ) ( IS-CRATE ?auto_613846 ) ( not ( = ?auto_613845 ?auto_613846 ) ) ( not ( = ?auto_613844 ?auto_613845 ) ) ( not ( = ?auto_613844 ?auto_613846 ) ) ( not ( = ?auto_613851 ?auto_613850 ) ) ( HOIST-AT ?auto_613853 ?auto_613851 ) ( not ( = ?auto_613852 ?auto_613853 ) ) ( SURFACE-AT ?auto_613846 ?auto_613851 ) ( ON ?auto_613846 ?auto_613849 ) ( CLEAR ?auto_613846 ) ( not ( = ?auto_613845 ?auto_613849 ) ) ( not ( = ?auto_613846 ?auto_613849 ) ) ( not ( = ?auto_613844 ?auto_613849 ) ) ( SURFACE-AT ?auto_613844 ?auto_613850 ) ( CLEAR ?auto_613844 ) ( IS-CRATE ?auto_613845 ) ( AVAILABLE ?auto_613852 ) ( TRUCK-AT ?auto_613848 ?auto_613851 ) ( AVAILABLE ?auto_613853 ) ( SURFACE-AT ?auto_613845 ?auto_613851 ) ( ON ?auto_613845 ?auto_613847 ) ( CLEAR ?auto_613845 ) ( not ( = ?auto_613845 ?auto_613847 ) ) ( not ( = ?auto_613846 ?auto_613847 ) ) ( not ( = ?auto_613844 ?auto_613847 ) ) ( not ( = ?auto_613849 ?auto_613847 ) ) ( ON ?auto_613841 ?auto_613840 ) ( ON ?auto_613842 ?auto_613841 ) ( ON ?auto_613843 ?auto_613842 ) ( ON ?auto_613844 ?auto_613843 ) ( not ( = ?auto_613840 ?auto_613841 ) ) ( not ( = ?auto_613840 ?auto_613842 ) ) ( not ( = ?auto_613840 ?auto_613843 ) ) ( not ( = ?auto_613840 ?auto_613844 ) ) ( not ( = ?auto_613840 ?auto_613845 ) ) ( not ( = ?auto_613840 ?auto_613846 ) ) ( not ( = ?auto_613840 ?auto_613849 ) ) ( not ( = ?auto_613840 ?auto_613847 ) ) ( not ( = ?auto_613841 ?auto_613842 ) ) ( not ( = ?auto_613841 ?auto_613843 ) ) ( not ( = ?auto_613841 ?auto_613844 ) ) ( not ( = ?auto_613841 ?auto_613845 ) ) ( not ( = ?auto_613841 ?auto_613846 ) ) ( not ( = ?auto_613841 ?auto_613849 ) ) ( not ( = ?auto_613841 ?auto_613847 ) ) ( not ( = ?auto_613842 ?auto_613843 ) ) ( not ( = ?auto_613842 ?auto_613844 ) ) ( not ( = ?auto_613842 ?auto_613845 ) ) ( not ( = ?auto_613842 ?auto_613846 ) ) ( not ( = ?auto_613842 ?auto_613849 ) ) ( not ( = ?auto_613842 ?auto_613847 ) ) ( not ( = ?auto_613843 ?auto_613844 ) ) ( not ( = ?auto_613843 ?auto_613845 ) ) ( not ( = ?auto_613843 ?auto_613846 ) ) ( not ( = ?auto_613843 ?auto_613849 ) ) ( not ( = ?auto_613843 ?auto_613847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613844 ?auto_613845 ?auto_613846 )
      ( MAKE-6CRATE-VERIFY ?auto_613840 ?auto_613841 ?auto_613842 ?auto_613843 ?auto_613844 ?auto_613845 ?auto_613846 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_613854 - SURFACE
      ?auto_613855 - SURFACE
      ?auto_613856 - SURFACE
      ?auto_613857 - SURFACE
      ?auto_613858 - SURFACE
      ?auto_613859 - SURFACE
      ?auto_613860 - SURFACE
      ?auto_613861 - SURFACE
    )
    :vars
    (
      ?auto_613867 - HOIST
      ?auto_613865 - PLACE
      ?auto_613866 - PLACE
      ?auto_613868 - HOIST
      ?auto_613864 - SURFACE
      ?auto_613863 - TRUCK
      ?auto_613862 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613867 ?auto_613865 ) ( IS-CRATE ?auto_613861 ) ( not ( = ?auto_613860 ?auto_613861 ) ) ( not ( = ?auto_613859 ?auto_613860 ) ) ( not ( = ?auto_613859 ?auto_613861 ) ) ( not ( = ?auto_613866 ?auto_613865 ) ) ( HOIST-AT ?auto_613868 ?auto_613866 ) ( not ( = ?auto_613867 ?auto_613868 ) ) ( SURFACE-AT ?auto_613861 ?auto_613866 ) ( ON ?auto_613861 ?auto_613864 ) ( CLEAR ?auto_613861 ) ( not ( = ?auto_613860 ?auto_613864 ) ) ( not ( = ?auto_613861 ?auto_613864 ) ) ( not ( = ?auto_613859 ?auto_613864 ) ) ( SURFACE-AT ?auto_613859 ?auto_613865 ) ( CLEAR ?auto_613859 ) ( IS-CRATE ?auto_613860 ) ( AVAILABLE ?auto_613867 ) ( TRUCK-AT ?auto_613863 ?auto_613866 ) ( AVAILABLE ?auto_613868 ) ( SURFACE-AT ?auto_613860 ?auto_613866 ) ( ON ?auto_613860 ?auto_613862 ) ( CLEAR ?auto_613860 ) ( not ( = ?auto_613860 ?auto_613862 ) ) ( not ( = ?auto_613861 ?auto_613862 ) ) ( not ( = ?auto_613859 ?auto_613862 ) ) ( not ( = ?auto_613864 ?auto_613862 ) ) ( ON ?auto_613855 ?auto_613854 ) ( ON ?auto_613856 ?auto_613855 ) ( ON ?auto_613857 ?auto_613856 ) ( ON ?auto_613858 ?auto_613857 ) ( ON ?auto_613859 ?auto_613858 ) ( not ( = ?auto_613854 ?auto_613855 ) ) ( not ( = ?auto_613854 ?auto_613856 ) ) ( not ( = ?auto_613854 ?auto_613857 ) ) ( not ( = ?auto_613854 ?auto_613858 ) ) ( not ( = ?auto_613854 ?auto_613859 ) ) ( not ( = ?auto_613854 ?auto_613860 ) ) ( not ( = ?auto_613854 ?auto_613861 ) ) ( not ( = ?auto_613854 ?auto_613864 ) ) ( not ( = ?auto_613854 ?auto_613862 ) ) ( not ( = ?auto_613855 ?auto_613856 ) ) ( not ( = ?auto_613855 ?auto_613857 ) ) ( not ( = ?auto_613855 ?auto_613858 ) ) ( not ( = ?auto_613855 ?auto_613859 ) ) ( not ( = ?auto_613855 ?auto_613860 ) ) ( not ( = ?auto_613855 ?auto_613861 ) ) ( not ( = ?auto_613855 ?auto_613864 ) ) ( not ( = ?auto_613855 ?auto_613862 ) ) ( not ( = ?auto_613856 ?auto_613857 ) ) ( not ( = ?auto_613856 ?auto_613858 ) ) ( not ( = ?auto_613856 ?auto_613859 ) ) ( not ( = ?auto_613856 ?auto_613860 ) ) ( not ( = ?auto_613856 ?auto_613861 ) ) ( not ( = ?auto_613856 ?auto_613864 ) ) ( not ( = ?auto_613856 ?auto_613862 ) ) ( not ( = ?auto_613857 ?auto_613858 ) ) ( not ( = ?auto_613857 ?auto_613859 ) ) ( not ( = ?auto_613857 ?auto_613860 ) ) ( not ( = ?auto_613857 ?auto_613861 ) ) ( not ( = ?auto_613857 ?auto_613864 ) ) ( not ( = ?auto_613857 ?auto_613862 ) ) ( not ( = ?auto_613858 ?auto_613859 ) ) ( not ( = ?auto_613858 ?auto_613860 ) ) ( not ( = ?auto_613858 ?auto_613861 ) ) ( not ( = ?auto_613858 ?auto_613864 ) ) ( not ( = ?auto_613858 ?auto_613862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613859 ?auto_613860 ?auto_613861 )
      ( MAKE-7CRATE-VERIFY ?auto_613854 ?auto_613855 ?auto_613856 ?auto_613857 ?auto_613858 ?auto_613859 ?auto_613860 ?auto_613861 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_613869 - SURFACE
      ?auto_613870 - SURFACE
      ?auto_613871 - SURFACE
      ?auto_613872 - SURFACE
      ?auto_613873 - SURFACE
      ?auto_613874 - SURFACE
      ?auto_613875 - SURFACE
      ?auto_613876 - SURFACE
      ?auto_613877 - SURFACE
    )
    :vars
    (
      ?auto_613883 - HOIST
      ?auto_613881 - PLACE
      ?auto_613882 - PLACE
      ?auto_613884 - HOIST
      ?auto_613880 - SURFACE
      ?auto_613879 - TRUCK
      ?auto_613878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613883 ?auto_613881 ) ( IS-CRATE ?auto_613877 ) ( not ( = ?auto_613876 ?auto_613877 ) ) ( not ( = ?auto_613875 ?auto_613876 ) ) ( not ( = ?auto_613875 ?auto_613877 ) ) ( not ( = ?auto_613882 ?auto_613881 ) ) ( HOIST-AT ?auto_613884 ?auto_613882 ) ( not ( = ?auto_613883 ?auto_613884 ) ) ( SURFACE-AT ?auto_613877 ?auto_613882 ) ( ON ?auto_613877 ?auto_613880 ) ( CLEAR ?auto_613877 ) ( not ( = ?auto_613876 ?auto_613880 ) ) ( not ( = ?auto_613877 ?auto_613880 ) ) ( not ( = ?auto_613875 ?auto_613880 ) ) ( SURFACE-AT ?auto_613875 ?auto_613881 ) ( CLEAR ?auto_613875 ) ( IS-CRATE ?auto_613876 ) ( AVAILABLE ?auto_613883 ) ( TRUCK-AT ?auto_613879 ?auto_613882 ) ( AVAILABLE ?auto_613884 ) ( SURFACE-AT ?auto_613876 ?auto_613882 ) ( ON ?auto_613876 ?auto_613878 ) ( CLEAR ?auto_613876 ) ( not ( = ?auto_613876 ?auto_613878 ) ) ( not ( = ?auto_613877 ?auto_613878 ) ) ( not ( = ?auto_613875 ?auto_613878 ) ) ( not ( = ?auto_613880 ?auto_613878 ) ) ( ON ?auto_613870 ?auto_613869 ) ( ON ?auto_613871 ?auto_613870 ) ( ON ?auto_613872 ?auto_613871 ) ( ON ?auto_613873 ?auto_613872 ) ( ON ?auto_613874 ?auto_613873 ) ( ON ?auto_613875 ?auto_613874 ) ( not ( = ?auto_613869 ?auto_613870 ) ) ( not ( = ?auto_613869 ?auto_613871 ) ) ( not ( = ?auto_613869 ?auto_613872 ) ) ( not ( = ?auto_613869 ?auto_613873 ) ) ( not ( = ?auto_613869 ?auto_613874 ) ) ( not ( = ?auto_613869 ?auto_613875 ) ) ( not ( = ?auto_613869 ?auto_613876 ) ) ( not ( = ?auto_613869 ?auto_613877 ) ) ( not ( = ?auto_613869 ?auto_613880 ) ) ( not ( = ?auto_613869 ?auto_613878 ) ) ( not ( = ?auto_613870 ?auto_613871 ) ) ( not ( = ?auto_613870 ?auto_613872 ) ) ( not ( = ?auto_613870 ?auto_613873 ) ) ( not ( = ?auto_613870 ?auto_613874 ) ) ( not ( = ?auto_613870 ?auto_613875 ) ) ( not ( = ?auto_613870 ?auto_613876 ) ) ( not ( = ?auto_613870 ?auto_613877 ) ) ( not ( = ?auto_613870 ?auto_613880 ) ) ( not ( = ?auto_613870 ?auto_613878 ) ) ( not ( = ?auto_613871 ?auto_613872 ) ) ( not ( = ?auto_613871 ?auto_613873 ) ) ( not ( = ?auto_613871 ?auto_613874 ) ) ( not ( = ?auto_613871 ?auto_613875 ) ) ( not ( = ?auto_613871 ?auto_613876 ) ) ( not ( = ?auto_613871 ?auto_613877 ) ) ( not ( = ?auto_613871 ?auto_613880 ) ) ( not ( = ?auto_613871 ?auto_613878 ) ) ( not ( = ?auto_613872 ?auto_613873 ) ) ( not ( = ?auto_613872 ?auto_613874 ) ) ( not ( = ?auto_613872 ?auto_613875 ) ) ( not ( = ?auto_613872 ?auto_613876 ) ) ( not ( = ?auto_613872 ?auto_613877 ) ) ( not ( = ?auto_613872 ?auto_613880 ) ) ( not ( = ?auto_613872 ?auto_613878 ) ) ( not ( = ?auto_613873 ?auto_613874 ) ) ( not ( = ?auto_613873 ?auto_613875 ) ) ( not ( = ?auto_613873 ?auto_613876 ) ) ( not ( = ?auto_613873 ?auto_613877 ) ) ( not ( = ?auto_613873 ?auto_613880 ) ) ( not ( = ?auto_613873 ?auto_613878 ) ) ( not ( = ?auto_613874 ?auto_613875 ) ) ( not ( = ?auto_613874 ?auto_613876 ) ) ( not ( = ?auto_613874 ?auto_613877 ) ) ( not ( = ?auto_613874 ?auto_613880 ) ) ( not ( = ?auto_613874 ?auto_613878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613875 ?auto_613876 ?auto_613877 )
      ( MAKE-8CRATE-VERIFY ?auto_613869 ?auto_613870 ?auto_613871 ?auto_613872 ?auto_613873 ?auto_613874 ?auto_613875 ?auto_613876 ?auto_613877 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_613885 - SURFACE
      ?auto_613886 - SURFACE
      ?auto_613887 - SURFACE
      ?auto_613888 - SURFACE
      ?auto_613889 - SURFACE
      ?auto_613890 - SURFACE
      ?auto_613891 - SURFACE
      ?auto_613892 - SURFACE
      ?auto_613893 - SURFACE
      ?auto_613894 - SURFACE
    )
    :vars
    (
      ?auto_613900 - HOIST
      ?auto_613898 - PLACE
      ?auto_613899 - PLACE
      ?auto_613901 - HOIST
      ?auto_613897 - SURFACE
      ?auto_613896 - TRUCK
      ?auto_613895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613900 ?auto_613898 ) ( IS-CRATE ?auto_613894 ) ( not ( = ?auto_613893 ?auto_613894 ) ) ( not ( = ?auto_613892 ?auto_613893 ) ) ( not ( = ?auto_613892 ?auto_613894 ) ) ( not ( = ?auto_613899 ?auto_613898 ) ) ( HOIST-AT ?auto_613901 ?auto_613899 ) ( not ( = ?auto_613900 ?auto_613901 ) ) ( SURFACE-AT ?auto_613894 ?auto_613899 ) ( ON ?auto_613894 ?auto_613897 ) ( CLEAR ?auto_613894 ) ( not ( = ?auto_613893 ?auto_613897 ) ) ( not ( = ?auto_613894 ?auto_613897 ) ) ( not ( = ?auto_613892 ?auto_613897 ) ) ( SURFACE-AT ?auto_613892 ?auto_613898 ) ( CLEAR ?auto_613892 ) ( IS-CRATE ?auto_613893 ) ( AVAILABLE ?auto_613900 ) ( TRUCK-AT ?auto_613896 ?auto_613899 ) ( AVAILABLE ?auto_613901 ) ( SURFACE-AT ?auto_613893 ?auto_613899 ) ( ON ?auto_613893 ?auto_613895 ) ( CLEAR ?auto_613893 ) ( not ( = ?auto_613893 ?auto_613895 ) ) ( not ( = ?auto_613894 ?auto_613895 ) ) ( not ( = ?auto_613892 ?auto_613895 ) ) ( not ( = ?auto_613897 ?auto_613895 ) ) ( ON ?auto_613886 ?auto_613885 ) ( ON ?auto_613887 ?auto_613886 ) ( ON ?auto_613888 ?auto_613887 ) ( ON ?auto_613889 ?auto_613888 ) ( ON ?auto_613890 ?auto_613889 ) ( ON ?auto_613891 ?auto_613890 ) ( ON ?auto_613892 ?auto_613891 ) ( not ( = ?auto_613885 ?auto_613886 ) ) ( not ( = ?auto_613885 ?auto_613887 ) ) ( not ( = ?auto_613885 ?auto_613888 ) ) ( not ( = ?auto_613885 ?auto_613889 ) ) ( not ( = ?auto_613885 ?auto_613890 ) ) ( not ( = ?auto_613885 ?auto_613891 ) ) ( not ( = ?auto_613885 ?auto_613892 ) ) ( not ( = ?auto_613885 ?auto_613893 ) ) ( not ( = ?auto_613885 ?auto_613894 ) ) ( not ( = ?auto_613885 ?auto_613897 ) ) ( not ( = ?auto_613885 ?auto_613895 ) ) ( not ( = ?auto_613886 ?auto_613887 ) ) ( not ( = ?auto_613886 ?auto_613888 ) ) ( not ( = ?auto_613886 ?auto_613889 ) ) ( not ( = ?auto_613886 ?auto_613890 ) ) ( not ( = ?auto_613886 ?auto_613891 ) ) ( not ( = ?auto_613886 ?auto_613892 ) ) ( not ( = ?auto_613886 ?auto_613893 ) ) ( not ( = ?auto_613886 ?auto_613894 ) ) ( not ( = ?auto_613886 ?auto_613897 ) ) ( not ( = ?auto_613886 ?auto_613895 ) ) ( not ( = ?auto_613887 ?auto_613888 ) ) ( not ( = ?auto_613887 ?auto_613889 ) ) ( not ( = ?auto_613887 ?auto_613890 ) ) ( not ( = ?auto_613887 ?auto_613891 ) ) ( not ( = ?auto_613887 ?auto_613892 ) ) ( not ( = ?auto_613887 ?auto_613893 ) ) ( not ( = ?auto_613887 ?auto_613894 ) ) ( not ( = ?auto_613887 ?auto_613897 ) ) ( not ( = ?auto_613887 ?auto_613895 ) ) ( not ( = ?auto_613888 ?auto_613889 ) ) ( not ( = ?auto_613888 ?auto_613890 ) ) ( not ( = ?auto_613888 ?auto_613891 ) ) ( not ( = ?auto_613888 ?auto_613892 ) ) ( not ( = ?auto_613888 ?auto_613893 ) ) ( not ( = ?auto_613888 ?auto_613894 ) ) ( not ( = ?auto_613888 ?auto_613897 ) ) ( not ( = ?auto_613888 ?auto_613895 ) ) ( not ( = ?auto_613889 ?auto_613890 ) ) ( not ( = ?auto_613889 ?auto_613891 ) ) ( not ( = ?auto_613889 ?auto_613892 ) ) ( not ( = ?auto_613889 ?auto_613893 ) ) ( not ( = ?auto_613889 ?auto_613894 ) ) ( not ( = ?auto_613889 ?auto_613897 ) ) ( not ( = ?auto_613889 ?auto_613895 ) ) ( not ( = ?auto_613890 ?auto_613891 ) ) ( not ( = ?auto_613890 ?auto_613892 ) ) ( not ( = ?auto_613890 ?auto_613893 ) ) ( not ( = ?auto_613890 ?auto_613894 ) ) ( not ( = ?auto_613890 ?auto_613897 ) ) ( not ( = ?auto_613890 ?auto_613895 ) ) ( not ( = ?auto_613891 ?auto_613892 ) ) ( not ( = ?auto_613891 ?auto_613893 ) ) ( not ( = ?auto_613891 ?auto_613894 ) ) ( not ( = ?auto_613891 ?auto_613897 ) ) ( not ( = ?auto_613891 ?auto_613895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613892 ?auto_613893 ?auto_613894 )
      ( MAKE-9CRATE-VERIFY ?auto_613885 ?auto_613886 ?auto_613887 ?auto_613888 ?auto_613889 ?auto_613890 ?auto_613891 ?auto_613892 ?auto_613893 ?auto_613894 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_613902 - SURFACE
      ?auto_613903 - SURFACE
      ?auto_613904 - SURFACE
      ?auto_613905 - SURFACE
      ?auto_613906 - SURFACE
      ?auto_613907 - SURFACE
      ?auto_613908 - SURFACE
      ?auto_613909 - SURFACE
      ?auto_613910 - SURFACE
      ?auto_613911 - SURFACE
      ?auto_613912 - SURFACE
    )
    :vars
    (
      ?auto_613918 - HOIST
      ?auto_613916 - PLACE
      ?auto_613917 - PLACE
      ?auto_613919 - HOIST
      ?auto_613915 - SURFACE
      ?auto_613914 - TRUCK
      ?auto_613913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613918 ?auto_613916 ) ( IS-CRATE ?auto_613912 ) ( not ( = ?auto_613911 ?auto_613912 ) ) ( not ( = ?auto_613910 ?auto_613911 ) ) ( not ( = ?auto_613910 ?auto_613912 ) ) ( not ( = ?auto_613917 ?auto_613916 ) ) ( HOIST-AT ?auto_613919 ?auto_613917 ) ( not ( = ?auto_613918 ?auto_613919 ) ) ( SURFACE-AT ?auto_613912 ?auto_613917 ) ( ON ?auto_613912 ?auto_613915 ) ( CLEAR ?auto_613912 ) ( not ( = ?auto_613911 ?auto_613915 ) ) ( not ( = ?auto_613912 ?auto_613915 ) ) ( not ( = ?auto_613910 ?auto_613915 ) ) ( SURFACE-AT ?auto_613910 ?auto_613916 ) ( CLEAR ?auto_613910 ) ( IS-CRATE ?auto_613911 ) ( AVAILABLE ?auto_613918 ) ( TRUCK-AT ?auto_613914 ?auto_613917 ) ( AVAILABLE ?auto_613919 ) ( SURFACE-AT ?auto_613911 ?auto_613917 ) ( ON ?auto_613911 ?auto_613913 ) ( CLEAR ?auto_613911 ) ( not ( = ?auto_613911 ?auto_613913 ) ) ( not ( = ?auto_613912 ?auto_613913 ) ) ( not ( = ?auto_613910 ?auto_613913 ) ) ( not ( = ?auto_613915 ?auto_613913 ) ) ( ON ?auto_613903 ?auto_613902 ) ( ON ?auto_613904 ?auto_613903 ) ( ON ?auto_613905 ?auto_613904 ) ( ON ?auto_613906 ?auto_613905 ) ( ON ?auto_613907 ?auto_613906 ) ( ON ?auto_613908 ?auto_613907 ) ( ON ?auto_613909 ?auto_613908 ) ( ON ?auto_613910 ?auto_613909 ) ( not ( = ?auto_613902 ?auto_613903 ) ) ( not ( = ?auto_613902 ?auto_613904 ) ) ( not ( = ?auto_613902 ?auto_613905 ) ) ( not ( = ?auto_613902 ?auto_613906 ) ) ( not ( = ?auto_613902 ?auto_613907 ) ) ( not ( = ?auto_613902 ?auto_613908 ) ) ( not ( = ?auto_613902 ?auto_613909 ) ) ( not ( = ?auto_613902 ?auto_613910 ) ) ( not ( = ?auto_613902 ?auto_613911 ) ) ( not ( = ?auto_613902 ?auto_613912 ) ) ( not ( = ?auto_613902 ?auto_613915 ) ) ( not ( = ?auto_613902 ?auto_613913 ) ) ( not ( = ?auto_613903 ?auto_613904 ) ) ( not ( = ?auto_613903 ?auto_613905 ) ) ( not ( = ?auto_613903 ?auto_613906 ) ) ( not ( = ?auto_613903 ?auto_613907 ) ) ( not ( = ?auto_613903 ?auto_613908 ) ) ( not ( = ?auto_613903 ?auto_613909 ) ) ( not ( = ?auto_613903 ?auto_613910 ) ) ( not ( = ?auto_613903 ?auto_613911 ) ) ( not ( = ?auto_613903 ?auto_613912 ) ) ( not ( = ?auto_613903 ?auto_613915 ) ) ( not ( = ?auto_613903 ?auto_613913 ) ) ( not ( = ?auto_613904 ?auto_613905 ) ) ( not ( = ?auto_613904 ?auto_613906 ) ) ( not ( = ?auto_613904 ?auto_613907 ) ) ( not ( = ?auto_613904 ?auto_613908 ) ) ( not ( = ?auto_613904 ?auto_613909 ) ) ( not ( = ?auto_613904 ?auto_613910 ) ) ( not ( = ?auto_613904 ?auto_613911 ) ) ( not ( = ?auto_613904 ?auto_613912 ) ) ( not ( = ?auto_613904 ?auto_613915 ) ) ( not ( = ?auto_613904 ?auto_613913 ) ) ( not ( = ?auto_613905 ?auto_613906 ) ) ( not ( = ?auto_613905 ?auto_613907 ) ) ( not ( = ?auto_613905 ?auto_613908 ) ) ( not ( = ?auto_613905 ?auto_613909 ) ) ( not ( = ?auto_613905 ?auto_613910 ) ) ( not ( = ?auto_613905 ?auto_613911 ) ) ( not ( = ?auto_613905 ?auto_613912 ) ) ( not ( = ?auto_613905 ?auto_613915 ) ) ( not ( = ?auto_613905 ?auto_613913 ) ) ( not ( = ?auto_613906 ?auto_613907 ) ) ( not ( = ?auto_613906 ?auto_613908 ) ) ( not ( = ?auto_613906 ?auto_613909 ) ) ( not ( = ?auto_613906 ?auto_613910 ) ) ( not ( = ?auto_613906 ?auto_613911 ) ) ( not ( = ?auto_613906 ?auto_613912 ) ) ( not ( = ?auto_613906 ?auto_613915 ) ) ( not ( = ?auto_613906 ?auto_613913 ) ) ( not ( = ?auto_613907 ?auto_613908 ) ) ( not ( = ?auto_613907 ?auto_613909 ) ) ( not ( = ?auto_613907 ?auto_613910 ) ) ( not ( = ?auto_613907 ?auto_613911 ) ) ( not ( = ?auto_613907 ?auto_613912 ) ) ( not ( = ?auto_613907 ?auto_613915 ) ) ( not ( = ?auto_613907 ?auto_613913 ) ) ( not ( = ?auto_613908 ?auto_613909 ) ) ( not ( = ?auto_613908 ?auto_613910 ) ) ( not ( = ?auto_613908 ?auto_613911 ) ) ( not ( = ?auto_613908 ?auto_613912 ) ) ( not ( = ?auto_613908 ?auto_613915 ) ) ( not ( = ?auto_613908 ?auto_613913 ) ) ( not ( = ?auto_613909 ?auto_613910 ) ) ( not ( = ?auto_613909 ?auto_613911 ) ) ( not ( = ?auto_613909 ?auto_613912 ) ) ( not ( = ?auto_613909 ?auto_613915 ) ) ( not ( = ?auto_613909 ?auto_613913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613910 ?auto_613911 ?auto_613912 )
      ( MAKE-10CRATE-VERIFY ?auto_613902 ?auto_613903 ?auto_613904 ?auto_613905 ?auto_613906 ?auto_613907 ?auto_613908 ?auto_613909 ?auto_613910 ?auto_613911 ?auto_613912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_613920 - SURFACE
      ?auto_613921 - SURFACE
    )
    :vars
    (
      ?auto_613928 - HOIST
      ?auto_613926 - PLACE
      ?auto_613925 - SURFACE
      ?auto_613927 - PLACE
      ?auto_613929 - HOIST
      ?auto_613924 - SURFACE
      ?auto_613922 - SURFACE
      ?auto_613923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613928 ?auto_613926 ) ( IS-CRATE ?auto_613921 ) ( not ( = ?auto_613920 ?auto_613921 ) ) ( not ( = ?auto_613925 ?auto_613920 ) ) ( not ( = ?auto_613925 ?auto_613921 ) ) ( not ( = ?auto_613927 ?auto_613926 ) ) ( HOIST-AT ?auto_613929 ?auto_613927 ) ( not ( = ?auto_613928 ?auto_613929 ) ) ( SURFACE-AT ?auto_613921 ?auto_613927 ) ( ON ?auto_613921 ?auto_613924 ) ( CLEAR ?auto_613921 ) ( not ( = ?auto_613920 ?auto_613924 ) ) ( not ( = ?auto_613921 ?auto_613924 ) ) ( not ( = ?auto_613925 ?auto_613924 ) ) ( SURFACE-AT ?auto_613925 ?auto_613926 ) ( CLEAR ?auto_613925 ) ( IS-CRATE ?auto_613920 ) ( AVAILABLE ?auto_613928 ) ( AVAILABLE ?auto_613929 ) ( SURFACE-AT ?auto_613920 ?auto_613927 ) ( ON ?auto_613920 ?auto_613922 ) ( CLEAR ?auto_613920 ) ( not ( = ?auto_613920 ?auto_613922 ) ) ( not ( = ?auto_613921 ?auto_613922 ) ) ( not ( = ?auto_613925 ?auto_613922 ) ) ( not ( = ?auto_613924 ?auto_613922 ) ) ( TRUCK-AT ?auto_613923 ?auto_613926 ) )
    :subtasks
    ( ( !DRIVE ?auto_613923 ?auto_613926 ?auto_613927 )
      ( MAKE-2CRATE ?auto_613925 ?auto_613920 ?auto_613921 )
      ( MAKE-1CRATE-VERIFY ?auto_613920 ?auto_613921 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_613930 - SURFACE
      ?auto_613931 - SURFACE
      ?auto_613932 - SURFACE
    )
    :vars
    (
      ?auto_613938 - HOIST
      ?auto_613936 - PLACE
      ?auto_613933 - PLACE
      ?auto_613937 - HOIST
      ?auto_613934 - SURFACE
      ?auto_613939 - SURFACE
      ?auto_613935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613938 ?auto_613936 ) ( IS-CRATE ?auto_613932 ) ( not ( = ?auto_613931 ?auto_613932 ) ) ( not ( = ?auto_613930 ?auto_613931 ) ) ( not ( = ?auto_613930 ?auto_613932 ) ) ( not ( = ?auto_613933 ?auto_613936 ) ) ( HOIST-AT ?auto_613937 ?auto_613933 ) ( not ( = ?auto_613938 ?auto_613937 ) ) ( SURFACE-AT ?auto_613932 ?auto_613933 ) ( ON ?auto_613932 ?auto_613934 ) ( CLEAR ?auto_613932 ) ( not ( = ?auto_613931 ?auto_613934 ) ) ( not ( = ?auto_613932 ?auto_613934 ) ) ( not ( = ?auto_613930 ?auto_613934 ) ) ( SURFACE-AT ?auto_613930 ?auto_613936 ) ( CLEAR ?auto_613930 ) ( IS-CRATE ?auto_613931 ) ( AVAILABLE ?auto_613938 ) ( AVAILABLE ?auto_613937 ) ( SURFACE-AT ?auto_613931 ?auto_613933 ) ( ON ?auto_613931 ?auto_613939 ) ( CLEAR ?auto_613931 ) ( not ( = ?auto_613931 ?auto_613939 ) ) ( not ( = ?auto_613932 ?auto_613939 ) ) ( not ( = ?auto_613930 ?auto_613939 ) ) ( not ( = ?auto_613934 ?auto_613939 ) ) ( TRUCK-AT ?auto_613935 ?auto_613936 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_613931 ?auto_613932 )
      ( MAKE-2CRATE-VERIFY ?auto_613930 ?auto_613931 ?auto_613932 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_613940 - SURFACE
      ?auto_613941 - SURFACE
      ?auto_613942 - SURFACE
      ?auto_613943 - SURFACE
    )
    :vars
    (
      ?auto_613944 - HOIST
      ?auto_613946 - PLACE
      ?auto_613945 - PLACE
      ?auto_613948 - HOIST
      ?auto_613947 - SURFACE
      ?auto_613949 - SURFACE
      ?auto_613950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613944 ?auto_613946 ) ( IS-CRATE ?auto_613943 ) ( not ( = ?auto_613942 ?auto_613943 ) ) ( not ( = ?auto_613941 ?auto_613942 ) ) ( not ( = ?auto_613941 ?auto_613943 ) ) ( not ( = ?auto_613945 ?auto_613946 ) ) ( HOIST-AT ?auto_613948 ?auto_613945 ) ( not ( = ?auto_613944 ?auto_613948 ) ) ( SURFACE-AT ?auto_613943 ?auto_613945 ) ( ON ?auto_613943 ?auto_613947 ) ( CLEAR ?auto_613943 ) ( not ( = ?auto_613942 ?auto_613947 ) ) ( not ( = ?auto_613943 ?auto_613947 ) ) ( not ( = ?auto_613941 ?auto_613947 ) ) ( SURFACE-AT ?auto_613941 ?auto_613946 ) ( CLEAR ?auto_613941 ) ( IS-CRATE ?auto_613942 ) ( AVAILABLE ?auto_613944 ) ( AVAILABLE ?auto_613948 ) ( SURFACE-AT ?auto_613942 ?auto_613945 ) ( ON ?auto_613942 ?auto_613949 ) ( CLEAR ?auto_613942 ) ( not ( = ?auto_613942 ?auto_613949 ) ) ( not ( = ?auto_613943 ?auto_613949 ) ) ( not ( = ?auto_613941 ?auto_613949 ) ) ( not ( = ?auto_613947 ?auto_613949 ) ) ( TRUCK-AT ?auto_613950 ?auto_613946 ) ( ON ?auto_613941 ?auto_613940 ) ( not ( = ?auto_613940 ?auto_613941 ) ) ( not ( = ?auto_613940 ?auto_613942 ) ) ( not ( = ?auto_613940 ?auto_613943 ) ) ( not ( = ?auto_613940 ?auto_613947 ) ) ( not ( = ?auto_613940 ?auto_613949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613941 ?auto_613942 ?auto_613943 )
      ( MAKE-3CRATE-VERIFY ?auto_613940 ?auto_613941 ?auto_613942 ?auto_613943 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_613951 - SURFACE
      ?auto_613952 - SURFACE
      ?auto_613953 - SURFACE
      ?auto_613954 - SURFACE
      ?auto_613955 - SURFACE
    )
    :vars
    (
      ?auto_613956 - HOIST
      ?auto_613958 - PLACE
      ?auto_613957 - PLACE
      ?auto_613960 - HOIST
      ?auto_613959 - SURFACE
      ?auto_613961 - SURFACE
      ?auto_613962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613956 ?auto_613958 ) ( IS-CRATE ?auto_613955 ) ( not ( = ?auto_613954 ?auto_613955 ) ) ( not ( = ?auto_613953 ?auto_613954 ) ) ( not ( = ?auto_613953 ?auto_613955 ) ) ( not ( = ?auto_613957 ?auto_613958 ) ) ( HOIST-AT ?auto_613960 ?auto_613957 ) ( not ( = ?auto_613956 ?auto_613960 ) ) ( SURFACE-AT ?auto_613955 ?auto_613957 ) ( ON ?auto_613955 ?auto_613959 ) ( CLEAR ?auto_613955 ) ( not ( = ?auto_613954 ?auto_613959 ) ) ( not ( = ?auto_613955 ?auto_613959 ) ) ( not ( = ?auto_613953 ?auto_613959 ) ) ( SURFACE-AT ?auto_613953 ?auto_613958 ) ( CLEAR ?auto_613953 ) ( IS-CRATE ?auto_613954 ) ( AVAILABLE ?auto_613956 ) ( AVAILABLE ?auto_613960 ) ( SURFACE-AT ?auto_613954 ?auto_613957 ) ( ON ?auto_613954 ?auto_613961 ) ( CLEAR ?auto_613954 ) ( not ( = ?auto_613954 ?auto_613961 ) ) ( not ( = ?auto_613955 ?auto_613961 ) ) ( not ( = ?auto_613953 ?auto_613961 ) ) ( not ( = ?auto_613959 ?auto_613961 ) ) ( TRUCK-AT ?auto_613962 ?auto_613958 ) ( ON ?auto_613952 ?auto_613951 ) ( ON ?auto_613953 ?auto_613952 ) ( not ( = ?auto_613951 ?auto_613952 ) ) ( not ( = ?auto_613951 ?auto_613953 ) ) ( not ( = ?auto_613951 ?auto_613954 ) ) ( not ( = ?auto_613951 ?auto_613955 ) ) ( not ( = ?auto_613951 ?auto_613959 ) ) ( not ( = ?auto_613951 ?auto_613961 ) ) ( not ( = ?auto_613952 ?auto_613953 ) ) ( not ( = ?auto_613952 ?auto_613954 ) ) ( not ( = ?auto_613952 ?auto_613955 ) ) ( not ( = ?auto_613952 ?auto_613959 ) ) ( not ( = ?auto_613952 ?auto_613961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613953 ?auto_613954 ?auto_613955 )
      ( MAKE-4CRATE-VERIFY ?auto_613951 ?auto_613952 ?auto_613953 ?auto_613954 ?auto_613955 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_613963 - SURFACE
      ?auto_613964 - SURFACE
      ?auto_613965 - SURFACE
      ?auto_613966 - SURFACE
      ?auto_613967 - SURFACE
      ?auto_613968 - SURFACE
    )
    :vars
    (
      ?auto_613969 - HOIST
      ?auto_613971 - PLACE
      ?auto_613970 - PLACE
      ?auto_613973 - HOIST
      ?auto_613972 - SURFACE
      ?auto_613974 - SURFACE
      ?auto_613975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613969 ?auto_613971 ) ( IS-CRATE ?auto_613968 ) ( not ( = ?auto_613967 ?auto_613968 ) ) ( not ( = ?auto_613966 ?auto_613967 ) ) ( not ( = ?auto_613966 ?auto_613968 ) ) ( not ( = ?auto_613970 ?auto_613971 ) ) ( HOIST-AT ?auto_613973 ?auto_613970 ) ( not ( = ?auto_613969 ?auto_613973 ) ) ( SURFACE-AT ?auto_613968 ?auto_613970 ) ( ON ?auto_613968 ?auto_613972 ) ( CLEAR ?auto_613968 ) ( not ( = ?auto_613967 ?auto_613972 ) ) ( not ( = ?auto_613968 ?auto_613972 ) ) ( not ( = ?auto_613966 ?auto_613972 ) ) ( SURFACE-AT ?auto_613966 ?auto_613971 ) ( CLEAR ?auto_613966 ) ( IS-CRATE ?auto_613967 ) ( AVAILABLE ?auto_613969 ) ( AVAILABLE ?auto_613973 ) ( SURFACE-AT ?auto_613967 ?auto_613970 ) ( ON ?auto_613967 ?auto_613974 ) ( CLEAR ?auto_613967 ) ( not ( = ?auto_613967 ?auto_613974 ) ) ( not ( = ?auto_613968 ?auto_613974 ) ) ( not ( = ?auto_613966 ?auto_613974 ) ) ( not ( = ?auto_613972 ?auto_613974 ) ) ( TRUCK-AT ?auto_613975 ?auto_613971 ) ( ON ?auto_613964 ?auto_613963 ) ( ON ?auto_613965 ?auto_613964 ) ( ON ?auto_613966 ?auto_613965 ) ( not ( = ?auto_613963 ?auto_613964 ) ) ( not ( = ?auto_613963 ?auto_613965 ) ) ( not ( = ?auto_613963 ?auto_613966 ) ) ( not ( = ?auto_613963 ?auto_613967 ) ) ( not ( = ?auto_613963 ?auto_613968 ) ) ( not ( = ?auto_613963 ?auto_613972 ) ) ( not ( = ?auto_613963 ?auto_613974 ) ) ( not ( = ?auto_613964 ?auto_613965 ) ) ( not ( = ?auto_613964 ?auto_613966 ) ) ( not ( = ?auto_613964 ?auto_613967 ) ) ( not ( = ?auto_613964 ?auto_613968 ) ) ( not ( = ?auto_613964 ?auto_613972 ) ) ( not ( = ?auto_613964 ?auto_613974 ) ) ( not ( = ?auto_613965 ?auto_613966 ) ) ( not ( = ?auto_613965 ?auto_613967 ) ) ( not ( = ?auto_613965 ?auto_613968 ) ) ( not ( = ?auto_613965 ?auto_613972 ) ) ( not ( = ?auto_613965 ?auto_613974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613966 ?auto_613967 ?auto_613968 )
      ( MAKE-5CRATE-VERIFY ?auto_613963 ?auto_613964 ?auto_613965 ?auto_613966 ?auto_613967 ?auto_613968 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_613976 - SURFACE
      ?auto_613977 - SURFACE
      ?auto_613978 - SURFACE
      ?auto_613979 - SURFACE
      ?auto_613980 - SURFACE
      ?auto_613981 - SURFACE
      ?auto_613982 - SURFACE
    )
    :vars
    (
      ?auto_613983 - HOIST
      ?auto_613985 - PLACE
      ?auto_613984 - PLACE
      ?auto_613987 - HOIST
      ?auto_613986 - SURFACE
      ?auto_613988 - SURFACE
      ?auto_613989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613983 ?auto_613985 ) ( IS-CRATE ?auto_613982 ) ( not ( = ?auto_613981 ?auto_613982 ) ) ( not ( = ?auto_613980 ?auto_613981 ) ) ( not ( = ?auto_613980 ?auto_613982 ) ) ( not ( = ?auto_613984 ?auto_613985 ) ) ( HOIST-AT ?auto_613987 ?auto_613984 ) ( not ( = ?auto_613983 ?auto_613987 ) ) ( SURFACE-AT ?auto_613982 ?auto_613984 ) ( ON ?auto_613982 ?auto_613986 ) ( CLEAR ?auto_613982 ) ( not ( = ?auto_613981 ?auto_613986 ) ) ( not ( = ?auto_613982 ?auto_613986 ) ) ( not ( = ?auto_613980 ?auto_613986 ) ) ( SURFACE-AT ?auto_613980 ?auto_613985 ) ( CLEAR ?auto_613980 ) ( IS-CRATE ?auto_613981 ) ( AVAILABLE ?auto_613983 ) ( AVAILABLE ?auto_613987 ) ( SURFACE-AT ?auto_613981 ?auto_613984 ) ( ON ?auto_613981 ?auto_613988 ) ( CLEAR ?auto_613981 ) ( not ( = ?auto_613981 ?auto_613988 ) ) ( not ( = ?auto_613982 ?auto_613988 ) ) ( not ( = ?auto_613980 ?auto_613988 ) ) ( not ( = ?auto_613986 ?auto_613988 ) ) ( TRUCK-AT ?auto_613989 ?auto_613985 ) ( ON ?auto_613977 ?auto_613976 ) ( ON ?auto_613978 ?auto_613977 ) ( ON ?auto_613979 ?auto_613978 ) ( ON ?auto_613980 ?auto_613979 ) ( not ( = ?auto_613976 ?auto_613977 ) ) ( not ( = ?auto_613976 ?auto_613978 ) ) ( not ( = ?auto_613976 ?auto_613979 ) ) ( not ( = ?auto_613976 ?auto_613980 ) ) ( not ( = ?auto_613976 ?auto_613981 ) ) ( not ( = ?auto_613976 ?auto_613982 ) ) ( not ( = ?auto_613976 ?auto_613986 ) ) ( not ( = ?auto_613976 ?auto_613988 ) ) ( not ( = ?auto_613977 ?auto_613978 ) ) ( not ( = ?auto_613977 ?auto_613979 ) ) ( not ( = ?auto_613977 ?auto_613980 ) ) ( not ( = ?auto_613977 ?auto_613981 ) ) ( not ( = ?auto_613977 ?auto_613982 ) ) ( not ( = ?auto_613977 ?auto_613986 ) ) ( not ( = ?auto_613977 ?auto_613988 ) ) ( not ( = ?auto_613978 ?auto_613979 ) ) ( not ( = ?auto_613978 ?auto_613980 ) ) ( not ( = ?auto_613978 ?auto_613981 ) ) ( not ( = ?auto_613978 ?auto_613982 ) ) ( not ( = ?auto_613978 ?auto_613986 ) ) ( not ( = ?auto_613978 ?auto_613988 ) ) ( not ( = ?auto_613979 ?auto_613980 ) ) ( not ( = ?auto_613979 ?auto_613981 ) ) ( not ( = ?auto_613979 ?auto_613982 ) ) ( not ( = ?auto_613979 ?auto_613986 ) ) ( not ( = ?auto_613979 ?auto_613988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613980 ?auto_613981 ?auto_613982 )
      ( MAKE-6CRATE-VERIFY ?auto_613976 ?auto_613977 ?auto_613978 ?auto_613979 ?auto_613980 ?auto_613981 ?auto_613982 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_613990 - SURFACE
      ?auto_613991 - SURFACE
      ?auto_613992 - SURFACE
      ?auto_613993 - SURFACE
      ?auto_613994 - SURFACE
      ?auto_613995 - SURFACE
      ?auto_613996 - SURFACE
      ?auto_613997 - SURFACE
    )
    :vars
    (
      ?auto_613998 - HOIST
      ?auto_614000 - PLACE
      ?auto_613999 - PLACE
      ?auto_614002 - HOIST
      ?auto_614001 - SURFACE
      ?auto_614003 - SURFACE
      ?auto_614004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613998 ?auto_614000 ) ( IS-CRATE ?auto_613997 ) ( not ( = ?auto_613996 ?auto_613997 ) ) ( not ( = ?auto_613995 ?auto_613996 ) ) ( not ( = ?auto_613995 ?auto_613997 ) ) ( not ( = ?auto_613999 ?auto_614000 ) ) ( HOIST-AT ?auto_614002 ?auto_613999 ) ( not ( = ?auto_613998 ?auto_614002 ) ) ( SURFACE-AT ?auto_613997 ?auto_613999 ) ( ON ?auto_613997 ?auto_614001 ) ( CLEAR ?auto_613997 ) ( not ( = ?auto_613996 ?auto_614001 ) ) ( not ( = ?auto_613997 ?auto_614001 ) ) ( not ( = ?auto_613995 ?auto_614001 ) ) ( SURFACE-AT ?auto_613995 ?auto_614000 ) ( CLEAR ?auto_613995 ) ( IS-CRATE ?auto_613996 ) ( AVAILABLE ?auto_613998 ) ( AVAILABLE ?auto_614002 ) ( SURFACE-AT ?auto_613996 ?auto_613999 ) ( ON ?auto_613996 ?auto_614003 ) ( CLEAR ?auto_613996 ) ( not ( = ?auto_613996 ?auto_614003 ) ) ( not ( = ?auto_613997 ?auto_614003 ) ) ( not ( = ?auto_613995 ?auto_614003 ) ) ( not ( = ?auto_614001 ?auto_614003 ) ) ( TRUCK-AT ?auto_614004 ?auto_614000 ) ( ON ?auto_613991 ?auto_613990 ) ( ON ?auto_613992 ?auto_613991 ) ( ON ?auto_613993 ?auto_613992 ) ( ON ?auto_613994 ?auto_613993 ) ( ON ?auto_613995 ?auto_613994 ) ( not ( = ?auto_613990 ?auto_613991 ) ) ( not ( = ?auto_613990 ?auto_613992 ) ) ( not ( = ?auto_613990 ?auto_613993 ) ) ( not ( = ?auto_613990 ?auto_613994 ) ) ( not ( = ?auto_613990 ?auto_613995 ) ) ( not ( = ?auto_613990 ?auto_613996 ) ) ( not ( = ?auto_613990 ?auto_613997 ) ) ( not ( = ?auto_613990 ?auto_614001 ) ) ( not ( = ?auto_613990 ?auto_614003 ) ) ( not ( = ?auto_613991 ?auto_613992 ) ) ( not ( = ?auto_613991 ?auto_613993 ) ) ( not ( = ?auto_613991 ?auto_613994 ) ) ( not ( = ?auto_613991 ?auto_613995 ) ) ( not ( = ?auto_613991 ?auto_613996 ) ) ( not ( = ?auto_613991 ?auto_613997 ) ) ( not ( = ?auto_613991 ?auto_614001 ) ) ( not ( = ?auto_613991 ?auto_614003 ) ) ( not ( = ?auto_613992 ?auto_613993 ) ) ( not ( = ?auto_613992 ?auto_613994 ) ) ( not ( = ?auto_613992 ?auto_613995 ) ) ( not ( = ?auto_613992 ?auto_613996 ) ) ( not ( = ?auto_613992 ?auto_613997 ) ) ( not ( = ?auto_613992 ?auto_614001 ) ) ( not ( = ?auto_613992 ?auto_614003 ) ) ( not ( = ?auto_613993 ?auto_613994 ) ) ( not ( = ?auto_613993 ?auto_613995 ) ) ( not ( = ?auto_613993 ?auto_613996 ) ) ( not ( = ?auto_613993 ?auto_613997 ) ) ( not ( = ?auto_613993 ?auto_614001 ) ) ( not ( = ?auto_613993 ?auto_614003 ) ) ( not ( = ?auto_613994 ?auto_613995 ) ) ( not ( = ?auto_613994 ?auto_613996 ) ) ( not ( = ?auto_613994 ?auto_613997 ) ) ( not ( = ?auto_613994 ?auto_614001 ) ) ( not ( = ?auto_613994 ?auto_614003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_613995 ?auto_613996 ?auto_613997 )
      ( MAKE-7CRATE-VERIFY ?auto_613990 ?auto_613991 ?auto_613992 ?auto_613993 ?auto_613994 ?auto_613995 ?auto_613996 ?auto_613997 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_614005 - SURFACE
      ?auto_614006 - SURFACE
      ?auto_614007 - SURFACE
      ?auto_614008 - SURFACE
      ?auto_614009 - SURFACE
      ?auto_614010 - SURFACE
      ?auto_614011 - SURFACE
      ?auto_614012 - SURFACE
      ?auto_614013 - SURFACE
    )
    :vars
    (
      ?auto_614014 - HOIST
      ?auto_614016 - PLACE
      ?auto_614015 - PLACE
      ?auto_614018 - HOIST
      ?auto_614017 - SURFACE
      ?auto_614019 - SURFACE
      ?auto_614020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614014 ?auto_614016 ) ( IS-CRATE ?auto_614013 ) ( not ( = ?auto_614012 ?auto_614013 ) ) ( not ( = ?auto_614011 ?auto_614012 ) ) ( not ( = ?auto_614011 ?auto_614013 ) ) ( not ( = ?auto_614015 ?auto_614016 ) ) ( HOIST-AT ?auto_614018 ?auto_614015 ) ( not ( = ?auto_614014 ?auto_614018 ) ) ( SURFACE-AT ?auto_614013 ?auto_614015 ) ( ON ?auto_614013 ?auto_614017 ) ( CLEAR ?auto_614013 ) ( not ( = ?auto_614012 ?auto_614017 ) ) ( not ( = ?auto_614013 ?auto_614017 ) ) ( not ( = ?auto_614011 ?auto_614017 ) ) ( SURFACE-AT ?auto_614011 ?auto_614016 ) ( CLEAR ?auto_614011 ) ( IS-CRATE ?auto_614012 ) ( AVAILABLE ?auto_614014 ) ( AVAILABLE ?auto_614018 ) ( SURFACE-AT ?auto_614012 ?auto_614015 ) ( ON ?auto_614012 ?auto_614019 ) ( CLEAR ?auto_614012 ) ( not ( = ?auto_614012 ?auto_614019 ) ) ( not ( = ?auto_614013 ?auto_614019 ) ) ( not ( = ?auto_614011 ?auto_614019 ) ) ( not ( = ?auto_614017 ?auto_614019 ) ) ( TRUCK-AT ?auto_614020 ?auto_614016 ) ( ON ?auto_614006 ?auto_614005 ) ( ON ?auto_614007 ?auto_614006 ) ( ON ?auto_614008 ?auto_614007 ) ( ON ?auto_614009 ?auto_614008 ) ( ON ?auto_614010 ?auto_614009 ) ( ON ?auto_614011 ?auto_614010 ) ( not ( = ?auto_614005 ?auto_614006 ) ) ( not ( = ?auto_614005 ?auto_614007 ) ) ( not ( = ?auto_614005 ?auto_614008 ) ) ( not ( = ?auto_614005 ?auto_614009 ) ) ( not ( = ?auto_614005 ?auto_614010 ) ) ( not ( = ?auto_614005 ?auto_614011 ) ) ( not ( = ?auto_614005 ?auto_614012 ) ) ( not ( = ?auto_614005 ?auto_614013 ) ) ( not ( = ?auto_614005 ?auto_614017 ) ) ( not ( = ?auto_614005 ?auto_614019 ) ) ( not ( = ?auto_614006 ?auto_614007 ) ) ( not ( = ?auto_614006 ?auto_614008 ) ) ( not ( = ?auto_614006 ?auto_614009 ) ) ( not ( = ?auto_614006 ?auto_614010 ) ) ( not ( = ?auto_614006 ?auto_614011 ) ) ( not ( = ?auto_614006 ?auto_614012 ) ) ( not ( = ?auto_614006 ?auto_614013 ) ) ( not ( = ?auto_614006 ?auto_614017 ) ) ( not ( = ?auto_614006 ?auto_614019 ) ) ( not ( = ?auto_614007 ?auto_614008 ) ) ( not ( = ?auto_614007 ?auto_614009 ) ) ( not ( = ?auto_614007 ?auto_614010 ) ) ( not ( = ?auto_614007 ?auto_614011 ) ) ( not ( = ?auto_614007 ?auto_614012 ) ) ( not ( = ?auto_614007 ?auto_614013 ) ) ( not ( = ?auto_614007 ?auto_614017 ) ) ( not ( = ?auto_614007 ?auto_614019 ) ) ( not ( = ?auto_614008 ?auto_614009 ) ) ( not ( = ?auto_614008 ?auto_614010 ) ) ( not ( = ?auto_614008 ?auto_614011 ) ) ( not ( = ?auto_614008 ?auto_614012 ) ) ( not ( = ?auto_614008 ?auto_614013 ) ) ( not ( = ?auto_614008 ?auto_614017 ) ) ( not ( = ?auto_614008 ?auto_614019 ) ) ( not ( = ?auto_614009 ?auto_614010 ) ) ( not ( = ?auto_614009 ?auto_614011 ) ) ( not ( = ?auto_614009 ?auto_614012 ) ) ( not ( = ?auto_614009 ?auto_614013 ) ) ( not ( = ?auto_614009 ?auto_614017 ) ) ( not ( = ?auto_614009 ?auto_614019 ) ) ( not ( = ?auto_614010 ?auto_614011 ) ) ( not ( = ?auto_614010 ?auto_614012 ) ) ( not ( = ?auto_614010 ?auto_614013 ) ) ( not ( = ?auto_614010 ?auto_614017 ) ) ( not ( = ?auto_614010 ?auto_614019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614011 ?auto_614012 ?auto_614013 )
      ( MAKE-8CRATE-VERIFY ?auto_614005 ?auto_614006 ?auto_614007 ?auto_614008 ?auto_614009 ?auto_614010 ?auto_614011 ?auto_614012 ?auto_614013 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_614021 - SURFACE
      ?auto_614022 - SURFACE
      ?auto_614023 - SURFACE
      ?auto_614024 - SURFACE
      ?auto_614025 - SURFACE
      ?auto_614026 - SURFACE
      ?auto_614027 - SURFACE
      ?auto_614028 - SURFACE
      ?auto_614029 - SURFACE
      ?auto_614030 - SURFACE
    )
    :vars
    (
      ?auto_614031 - HOIST
      ?auto_614033 - PLACE
      ?auto_614032 - PLACE
      ?auto_614035 - HOIST
      ?auto_614034 - SURFACE
      ?auto_614036 - SURFACE
      ?auto_614037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614031 ?auto_614033 ) ( IS-CRATE ?auto_614030 ) ( not ( = ?auto_614029 ?auto_614030 ) ) ( not ( = ?auto_614028 ?auto_614029 ) ) ( not ( = ?auto_614028 ?auto_614030 ) ) ( not ( = ?auto_614032 ?auto_614033 ) ) ( HOIST-AT ?auto_614035 ?auto_614032 ) ( not ( = ?auto_614031 ?auto_614035 ) ) ( SURFACE-AT ?auto_614030 ?auto_614032 ) ( ON ?auto_614030 ?auto_614034 ) ( CLEAR ?auto_614030 ) ( not ( = ?auto_614029 ?auto_614034 ) ) ( not ( = ?auto_614030 ?auto_614034 ) ) ( not ( = ?auto_614028 ?auto_614034 ) ) ( SURFACE-AT ?auto_614028 ?auto_614033 ) ( CLEAR ?auto_614028 ) ( IS-CRATE ?auto_614029 ) ( AVAILABLE ?auto_614031 ) ( AVAILABLE ?auto_614035 ) ( SURFACE-AT ?auto_614029 ?auto_614032 ) ( ON ?auto_614029 ?auto_614036 ) ( CLEAR ?auto_614029 ) ( not ( = ?auto_614029 ?auto_614036 ) ) ( not ( = ?auto_614030 ?auto_614036 ) ) ( not ( = ?auto_614028 ?auto_614036 ) ) ( not ( = ?auto_614034 ?auto_614036 ) ) ( TRUCK-AT ?auto_614037 ?auto_614033 ) ( ON ?auto_614022 ?auto_614021 ) ( ON ?auto_614023 ?auto_614022 ) ( ON ?auto_614024 ?auto_614023 ) ( ON ?auto_614025 ?auto_614024 ) ( ON ?auto_614026 ?auto_614025 ) ( ON ?auto_614027 ?auto_614026 ) ( ON ?auto_614028 ?auto_614027 ) ( not ( = ?auto_614021 ?auto_614022 ) ) ( not ( = ?auto_614021 ?auto_614023 ) ) ( not ( = ?auto_614021 ?auto_614024 ) ) ( not ( = ?auto_614021 ?auto_614025 ) ) ( not ( = ?auto_614021 ?auto_614026 ) ) ( not ( = ?auto_614021 ?auto_614027 ) ) ( not ( = ?auto_614021 ?auto_614028 ) ) ( not ( = ?auto_614021 ?auto_614029 ) ) ( not ( = ?auto_614021 ?auto_614030 ) ) ( not ( = ?auto_614021 ?auto_614034 ) ) ( not ( = ?auto_614021 ?auto_614036 ) ) ( not ( = ?auto_614022 ?auto_614023 ) ) ( not ( = ?auto_614022 ?auto_614024 ) ) ( not ( = ?auto_614022 ?auto_614025 ) ) ( not ( = ?auto_614022 ?auto_614026 ) ) ( not ( = ?auto_614022 ?auto_614027 ) ) ( not ( = ?auto_614022 ?auto_614028 ) ) ( not ( = ?auto_614022 ?auto_614029 ) ) ( not ( = ?auto_614022 ?auto_614030 ) ) ( not ( = ?auto_614022 ?auto_614034 ) ) ( not ( = ?auto_614022 ?auto_614036 ) ) ( not ( = ?auto_614023 ?auto_614024 ) ) ( not ( = ?auto_614023 ?auto_614025 ) ) ( not ( = ?auto_614023 ?auto_614026 ) ) ( not ( = ?auto_614023 ?auto_614027 ) ) ( not ( = ?auto_614023 ?auto_614028 ) ) ( not ( = ?auto_614023 ?auto_614029 ) ) ( not ( = ?auto_614023 ?auto_614030 ) ) ( not ( = ?auto_614023 ?auto_614034 ) ) ( not ( = ?auto_614023 ?auto_614036 ) ) ( not ( = ?auto_614024 ?auto_614025 ) ) ( not ( = ?auto_614024 ?auto_614026 ) ) ( not ( = ?auto_614024 ?auto_614027 ) ) ( not ( = ?auto_614024 ?auto_614028 ) ) ( not ( = ?auto_614024 ?auto_614029 ) ) ( not ( = ?auto_614024 ?auto_614030 ) ) ( not ( = ?auto_614024 ?auto_614034 ) ) ( not ( = ?auto_614024 ?auto_614036 ) ) ( not ( = ?auto_614025 ?auto_614026 ) ) ( not ( = ?auto_614025 ?auto_614027 ) ) ( not ( = ?auto_614025 ?auto_614028 ) ) ( not ( = ?auto_614025 ?auto_614029 ) ) ( not ( = ?auto_614025 ?auto_614030 ) ) ( not ( = ?auto_614025 ?auto_614034 ) ) ( not ( = ?auto_614025 ?auto_614036 ) ) ( not ( = ?auto_614026 ?auto_614027 ) ) ( not ( = ?auto_614026 ?auto_614028 ) ) ( not ( = ?auto_614026 ?auto_614029 ) ) ( not ( = ?auto_614026 ?auto_614030 ) ) ( not ( = ?auto_614026 ?auto_614034 ) ) ( not ( = ?auto_614026 ?auto_614036 ) ) ( not ( = ?auto_614027 ?auto_614028 ) ) ( not ( = ?auto_614027 ?auto_614029 ) ) ( not ( = ?auto_614027 ?auto_614030 ) ) ( not ( = ?auto_614027 ?auto_614034 ) ) ( not ( = ?auto_614027 ?auto_614036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614028 ?auto_614029 ?auto_614030 )
      ( MAKE-9CRATE-VERIFY ?auto_614021 ?auto_614022 ?auto_614023 ?auto_614024 ?auto_614025 ?auto_614026 ?auto_614027 ?auto_614028 ?auto_614029 ?auto_614030 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_614038 - SURFACE
      ?auto_614039 - SURFACE
      ?auto_614040 - SURFACE
      ?auto_614041 - SURFACE
      ?auto_614042 - SURFACE
      ?auto_614043 - SURFACE
      ?auto_614044 - SURFACE
      ?auto_614045 - SURFACE
      ?auto_614046 - SURFACE
      ?auto_614047 - SURFACE
      ?auto_614048 - SURFACE
    )
    :vars
    (
      ?auto_614049 - HOIST
      ?auto_614051 - PLACE
      ?auto_614050 - PLACE
      ?auto_614053 - HOIST
      ?auto_614052 - SURFACE
      ?auto_614054 - SURFACE
      ?auto_614055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614049 ?auto_614051 ) ( IS-CRATE ?auto_614048 ) ( not ( = ?auto_614047 ?auto_614048 ) ) ( not ( = ?auto_614046 ?auto_614047 ) ) ( not ( = ?auto_614046 ?auto_614048 ) ) ( not ( = ?auto_614050 ?auto_614051 ) ) ( HOIST-AT ?auto_614053 ?auto_614050 ) ( not ( = ?auto_614049 ?auto_614053 ) ) ( SURFACE-AT ?auto_614048 ?auto_614050 ) ( ON ?auto_614048 ?auto_614052 ) ( CLEAR ?auto_614048 ) ( not ( = ?auto_614047 ?auto_614052 ) ) ( not ( = ?auto_614048 ?auto_614052 ) ) ( not ( = ?auto_614046 ?auto_614052 ) ) ( SURFACE-AT ?auto_614046 ?auto_614051 ) ( CLEAR ?auto_614046 ) ( IS-CRATE ?auto_614047 ) ( AVAILABLE ?auto_614049 ) ( AVAILABLE ?auto_614053 ) ( SURFACE-AT ?auto_614047 ?auto_614050 ) ( ON ?auto_614047 ?auto_614054 ) ( CLEAR ?auto_614047 ) ( not ( = ?auto_614047 ?auto_614054 ) ) ( not ( = ?auto_614048 ?auto_614054 ) ) ( not ( = ?auto_614046 ?auto_614054 ) ) ( not ( = ?auto_614052 ?auto_614054 ) ) ( TRUCK-AT ?auto_614055 ?auto_614051 ) ( ON ?auto_614039 ?auto_614038 ) ( ON ?auto_614040 ?auto_614039 ) ( ON ?auto_614041 ?auto_614040 ) ( ON ?auto_614042 ?auto_614041 ) ( ON ?auto_614043 ?auto_614042 ) ( ON ?auto_614044 ?auto_614043 ) ( ON ?auto_614045 ?auto_614044 ) ( ON ?auto_614046 ?auto_614045 ) ( not ( = ?auto_614038 ?auto_614039 ) ) ( not ( = ?auto_614038 ?auto_614040 ) ) ( not ( = ?auto_614038 ?auto_614041 ) ) ( not ( = ?auto_614038 ?auto_614042 ) ) ( not ( = ?auto_614038 ?auto_614043 ) ) ( not ( = ?auto_614038 ?auto_614044 ) ) ( not ( = ?auto_614038 ?auto_614045 ) ) ( not ( = ?auto_614038 ?auto_614046 ) ) ( not ( = ?auto_614038 ?auto_614047 ) ) ( not ( = ?auto_614038 ?auto_614048 ) ) ( not ( = ?auto_614038 ?auto_614052 ) ) ( not ( = ?auto_614038 ?auto_614054 ) ) ( not ( = ?auto_614039 ?auto_614040 ) ) ( not ( = ?auto_614039 ?auto_614041 ) ) ( not ( = ?auto_614039 ?auto_614042 ) ) ( not ( = ?auto_614039 ?auto_614043 ) ) ( not ( = ?auto_614039 ?auto_614044 ) ) ( not ( = ?auto_614039 ?auto_614045 ) ) ( not ( = ?auto_614039 ?auto_614046 ) ) ( not ( = ?auto_614039 ?auto_614047 ) ) ( not ( = ?auto_614039 ?auto_614048 ) ) ( not ( = ?auto_614039 ?auto_614052 ) ) ( not ( = ?auto_614039 ?auto_614054 ) ) ( not ( = ?auto_614040 ?auto_614041 ) ) ( not ( = ?auto_614040 ?auto_614042 ) ) ( not ( = ?auto_614040 ?auto_614043 ) ) ( not ( = ?auto_614040 ?auto_614044 ) ) ( not ( = ?auto_614040 ?auto_614045 ) ) ( not ( = ?auto_614040 ?auto_614046 ) ) ( not ( = ?auto_614040 ?auto_614047 ) ) ( not ( = ?auto_614040 ?auto_614048 ) ) ( not ( = ?auto_614040 ?auto_614052 ) ) ( not ( = ?auto_614040 ?auto_614054 ) ) ( not ( = ?auto_614041 ?auto_614042 ) ) ( not ( = ?auto_614041 ?auto_614043 ) ) ( not ( = ?auto_614041 ?auto_614044 ) ) ( not ( = ?auto_614041 ?auto_614045 ) ) ( not ( = ?auto_614041 ?auto_614046 ) ) ( not ( = ?auto_614041 ?auto_614047 ) ) ( not ( = ?auto_614041 ?auto_614048 ) ) ( not ( = ?auto_614041 ?auto_614052 ) ) ( not ( = ?auto_614041 ?auto_614054 ) ) ( not ( = ?auto_614042 ?auto_614043 ) ) ( not ( = ?auto_614042 ?auto_614044 ) ) ( not ( = ?auto_614042 ?auto_614045 ) ) ( not ( = ?auto_614042 ?auto_614046 ) ) ( not ( = ?auto_614042 ?auto_614047 ) ) ( not ( = ?auto_614042 ?auto_614048 ) ) ( not ( = ?auto_614042 ?auto_614052 ) ) ( not ( = ?auto_614042 ?auto_614054 ) ) ( not ( = ?auto_614043 ?auto_614044 ) ) ( not ( = ?auto_614043 ?auto_614045 ) ) ( not ( = ?auto_614043 ?auto_614046 ) ) ( not ( = ?auto_614043 ?auto_614047 ) ) ( not ( = ?auto_614043 ?auto_614048 ) ) ( not ( = ?auto_614043 ?auto_614052 ) ) ( not ( = ?auto_614043 ?auto_614054 ) ) ( not ( = ?auto_614044 ?auto_614045 ) ) ( not ( = ?auto_614044 ?auto_614046 ) ) ( not ( = ?auto_614044 ?auto_614047 ) ) ( not ( = ?auto_614044 ?auto_614048 ) ) ( not ( = ?auto_614044 ?auto_614052 ) ) ( not ( = ?auto_614044 ?auto_614054 ) ) ( not ( = ?auto_614045 ?auto_614046 ) ) ( not ( = ?auto_614045 ?auto_614047 ) ) ( not ( = ?auto_614045 ?auto_614048 ) ) ( not ( = ?auto_614045 ?auto_614052 ) ) ( not ( = ?auto_614045 ?auto_614054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614046 ?auto_614047 ?auto_614048 )
      ( MAKE-10CRATE-VERIFY ?auto_614038 ?auto_614039 ?auto_614040 ?auto_614041 ?auto_614042 ?auto_614043 ?auto_614044 ?auto_614045 ?auto_614046 ?auto_614047 ?auto_614048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_614056 - SURFACE
      ?auto_614057 - SURFACE
    )
    :vars
    (
      ?auto_614058 - HOIST
      ?auto_614060 - PLACE
      ?auto_614062 - SURFACE
      ?auto_614059 - PLACE
      ?auto_614063 - HOIST
      ?auto_614061 - SURFACE
      ?auto_614064 - SURFACE
      ?auto_614065 - TRUCK
      ?auto_614066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_614058 ?auto_614060 ) ( IS-CRATE ?auto_614057 ) ( not ( = ?auto_614056 ?auto_614057 ) ) ( not ( = ?auto_614062 ?auto_614056 ) ) ( not ( = ?auto_614062 ?auto_614057 ) ) ( not ( = ?auto_614059 ?auto_614060 ) ) ( HOIST-AT ?auto_614063 ?auto_614059 ) ( not ( = ?auto_614058 ?auto_614063 ) ) ( SURFACE-AT ?auto_614057 ?auto_614059 ) ( ON ?auto_614057 ?auto_614061 ) ( CLEAR ?auto_614057 ) ( not ( = ?auto_614056 ?auto_614061 ) ) ( not ( = ?auto_614057 ?auto_614061 ) ) ( not ( = ?auto_614062 ?auto_614061 ) ) ( IS-CRATE ?auto_614056 ) ( AVAILABLE ?auto_614063 ) ( SURFACE-AT ?auto_614056 ?auto_614059 ) ( ON ?auto_614056 ?auto_614064 ) ( CLEAR ?auto_614056 ) ( not ( = ?auto_614056 ?auto_614064 ) ) ( not ( = ?auto_614057 ?auto_614064 ) ) ( not ( = ?auto_614062 ?auto_614064 ) ) ( not ( = ?auto_614061 ?auto_614064 ) ) ( TRUCK-AT ?auto_614065 ?auto_614060 ) ( SURFACE-AT ?auto_614066 ?auto_614060 ) ( CLEAR ?auto_614066 ) ( LIFTING ?auto_614058 ?auto_614062 ) ( IS-CRATE ?auto_614062 ) ( not ( = ?auto_614066 ?auto_614062 ) ) ( not ( = ?auto_614056 ?auto_614066 ) ) ( not ( = ?auto_614057 ?auto_614066 ) ) ( not ( = ?auto_614061 ?auto_614066 ) ) ( not ( = ?auto_614064 ?auto_614066 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_614066 ?auto_614062 )
      ( MAKE-2CRATE ?auto_614062 ?auto_614056 ?auto_614057 )
      ( MAKE-1CRATE-VERIFY ?auto_614056 ?auto_614057 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_614067 - SURFACE
      ?auto_614068 - SURFACE
      ?auto_614069 - SURFACE
    )
    :vars
    (
      ?auto_614070 - HOIST
      ?auto_614076 - PLACE
      ?auto_614075 - PLACE
      ?auto_614073 - HOIST
      ?auto_614072 - SURFACE
      ?auto_614071 - SURFACE
      ?auto_614077 - TRUCK
      ?auto_614074 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_614070 ?auto_614076 ) ( IS-CRATE ?auto_614069 ) ( not ( = ?auto_614068 ?auto_614069 ) ) ( not ( = ?auto_614067 ?auto_614068 ) ) ( not ( = ?auto_614067 ?auto_614069 ) ) ( not ( = ?auto_614075 ?auto_614076 ) ) ( HOIST-AT ?auto_614073 ?auto_614075 ) ( not ( = ?auto_614070 ?auto_614073 ) ) ( SURFACE-AT ?auto_614069 ?auto_614075 ) ( ON ?auto_614069 ?auto_614072 ) ( CLEAR ?auto_614069 ) ( not ( = ?auto_614068 ?auto_614072 ) ) ( not ( = ?auto_614069 ?auto_614072 ) ) ( not ( = ?auto_614067 ?auto_614072 ) ) ( IS-CRATE ?auto_614068 ) ( AVAILABLE ?auto_614073 ) ( SURFACE-AT ?auto_614068 ?auto_614075 ) ( ON ?auto_614068 ?auto_614071 ) ( CLEAR ?auto_614068 ) ( not ( = ?auto_614068 ?auto_614071 ) ) ( not ( = ?auto_614069 ?auto_614071 ) ) ( not ( = ?auto_614067 ?auto_614071 ) ) ( not ( = ?auto_614072 ?auto_614071 ) ) ( TRUCK-AT ?auto_614077 ?auto_614076 ) ( SURFACE-AT ?auto_614074 ?auto_614076 ) ( CLEAR ?auto_614074 ) ( LIFTING ?auto_614070 ?auto_614067 ) ( IS-CRATE ?auto_614067 ) ( not ( = ?auto_614074 ?auto_614067 ) ) ( not ( = ?auto_614068 ?auto_614074 ) ) ( not ( = ?auto_614069 ?auto_614074 ) ) ( not ( = ?auto_614072 ?auto_614074 ) ) ( not ( = ?auto_614071 ?auto_614074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_614068 ?auto_614069 )
      ( MAKE-2CRATE-VERIFY ?auto_614067 ?auto_614068 ?auto_614069 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_614078 - SURFACE
      ?auto_614079 - SURFACE
      ?auto_614080 - SURFACE
      ?auto_614081 - SURFACE
    )
    :vars
    (
      ?auto_614082 - HOIST
      ?auto_614084 - PLACE
      ?auto_614085 - PLACE
      ?auto_614087 - HOIST
      ?auto_614083 - SURFACE
      ?auto_614086 - SURFACE
      ?auto_614088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614082 ?auto_614084 ) ( IS-CRATE ?auto_614081 ) ( not ( = ?auto_614080 ?auto_614081 ) ) ( not ( = ?auto_614079 ?auto_614080 ) ) ( not ( = ?auto_614079 ?auto_614081 ) ) ( not ( = ?auto_614085 ?auto_614084 ) ) ( HOIST-AT ?auto_614087 ?auto_614085 ) ( not ( = ?auto_614082 ?auto_614087 ) ) ( SURFACE-AT ?auto_614081 ?auto_614085 ) ( ON ?auto_614081 ?auto_614083 ) ( CLEAR ?auto_614081 ) ( not ( = ?auto_614080 ?auto_614083 ) ) ( not ( = ?auto_614081 ?auto_614083 ) ) ( not ( = ?auto_614079 ?auto_614083 ) ) ( IS-CRATE ?auto_614080 ) ( AVAILABLE ?auto_614087 ) ( SURFACE-AT ?auto_614080 ?auto_614085 ) ( ON ?auto_614080 ?auto_614086 ) ( CLEAR ?auto_614080 ) ( not ( = ?auto_614080 ?auto_614086 ) ) ( not ( = ?auto_614081 ?auto_614086 ) ) ( not ( = ?auto_614079 ?auto_614086 ) ) ( not ( = ?auto_614083 ?auto_614086 ) ) ( TRUCK-AT ?auto_614088 ?auto_614084 ) ( SURFACE-AT ?auto_614078 ?auto_614084 ) ( CLEAR ?auto_614078 ) ( LIFTING ?auto_614082 ?auto_614079 ) ( IS-CRATE ?auto_614079 ) ( not ( = ?auto_614078 ?auto_614079 ) ) ( not ( = ?auto_614080 ?auto_614078 ) ) ( not ( = ?auto_614081 ?auto_614078 ) ) ( not ( = ?auto_614083 ?auto_614078 ) ) ( not ( = ?auto_614086 ?auto_614078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614079 ?auto_614080 ?auto_614081 )
      ( MAKE-3CRATE-VERIFY ?auto_614078 ?auto_614079 ?auto_614080 ?auto_614081 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_614089 - SURFACE
      ?auto_614090 - SURFACE
      ?auto_614091 - SURFACE
      ?auto_614092 - SURFACE
      ?auto_614093 - SURFACE
    )
    :vars
    (
      ?auto_614094 - HOIST
      ?auto_614096 - PLACE
      ?auto_614097 - PLACE
      ?auto_614099 - HOIST
      ?auto_614095 - SURFACE
      ?auto_614098 - SURFACE
      ?auto_614100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614094 ?auto_614096 ) ( IS-CRATE ?auto_614093 ) ( not ( = ?auto_614092 ?auto_614093 ) ) ( not ( = ?auto_614091 ?auto_614092 ) ) ( not ( = ?auto_614091 ?auto_614093 ) ) ( not ( = ?auto_614097 ?auto_614096 ) ) ( HOIST-AT ?auto_614099 ?auto_614097 ) ( not ( = ?auto_614094 ?auto_614099 ) ) ( SURFACE-AT ?auto_614093 ?auto_614097 ) ( ON ?auto_614093 ?auto_614095 ) ( CLEAR ?auto_614093 ) ( not ( = ?auto_614092 ?auto_614095 ) ) ( not ( = ?auto_614093 ?auto_614095 ) ) ( not ( = ?auto_614091 ?auto_614095 ) ) ( IS-CRATE ?auto_614092 ) ( AVAILABLE ?auto_614099 ) ( SURFACE-AT ?auto_614092 ?auto_614097 ) ( ON ?auto_614092 ?auto_614098 ) ( CLEAR ?auto_614092 ) ( not ( = ?auto_614092 ?auto_614098 ) ) ( not ( = ?auto_614093 ?auto_614098 ) ) ( not ( = ?auto_614091 ?auto_614098 ) ) ( not ( = ?auto_614095 ?auto_614098 ) ) ( TRUCK-AT ?auto_614100 ?auto_614096 ) ( SURFACE-AT ?auto_614090 ?auto_614096 ) ( CLEAR ?auto_614090 ) ( LIFTING ?auto_614094 ?auto_614091 ) ( IS-CRATE ?auto_614091 ) ( not ( = ?auto_614090 ?auto_614091 ) ) ( not ( = ?auto_614092 ?auto_614090 ) ) ( not ( = ?auto_614093 ?auto_614090 ) ) ( not ( = ?auto_614095 ?auto_614090 ) ) ( not ( = ?auto_614098 ?auto_614090 ) ) ( ON ?auto_614090 ?auto_614089 ) ( not ( = ?auto_614089 ?auto_614090 ) ) ( not ( = ?auto_614089 ?auto_614091 ) ) ( not ( = ?auto_614089 ?auto_614092 ) ) ( not ( = ?auto_614089 ?auto_614093 ) ) ( not ( = ?auto_614089 ?auto_614095 ) ) ( not ( = ?auto_614089 ?auto_614098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614091 ?auto_614092 ?auto_614093 )
      ( MAKE-4CRATE-VERIFY ?auto_614089 ?auto_614090 ?auto_614091 ?auto_614092 ?auto_614093 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_614101 - SURFACE
      ?auto_614102 - SURFACE
      ?auto_614103 - SURFACE
      ?auto_614104 - SURFACE
      ?auto_614105 - SURFACE
      ?auto_614106 - SURFACE
    )
    :vars
    (
      ?auto_614107 - HOIST
      ?auto_614109 - PLACE
      ?auto_614110 - PLACE
      ?auto_614112 - HOIST
      ?auto_614108 - SURFACE
      ?auto_614111 - SURFACE
      ?auto_614113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614107 ?auto_614109 ) ( IS-CRATE ?auto_614106 ) ( not ( = ?auto_614105 ?auto_614106 ) ) ( not ( = ?auto_614104 ?auto_614105 ) ) ( not ( = ?auto_614104 ?auto_614106 ) ) ( not ( = ?auto_614110 ?auto_614109 ) ) ( HOIST-AT ?auto_614112 ?auto_614110 ) ( not ( = ?auto_614107 ?auto_614112 ) ) ( SURFACE-AT ?auto_614106 ?auto_614110 ) ( ON ?auto_614106 ?auto_614108 ) ( CLEAR ?auto_614106 ) ( not ( = ?auto_614105 ?auto_614108 ) ) ( not ( = ?auto_614106 ?auto_614108 ) ) ( not ( = ?auto_614104 ?auto_614108 ) ) ( IS-CRATE ?auto_614105 ) ( AVAILABLE ?auto_614112 ) ( SURFACE-AT ?auto_614105 ?auto_614110 ) ( ON ?auto_614105 ?auto_614111 ) ( CLEAR ?auto_614105 ) ( not ( = ?auto_614105 ?auto_614111 ) ) ( not ( = ?auto_614106 ?auto_614111 ) ) ( not ( = ?auto_614104 ?auto_614111 ) ) ( not ( = ?auto_614108 ?auto_614111 ) ) ( TRUCK-AT ?auto_614113 ?auto_614109 ) ( SURFACE-AT ?auto_614103 ?auto_614109 ) ( CLEAR ?auto_614103 ) ( LIFTING ?auto_614107 ?auto_614104 ) ( IS-CRATE ?auto_614104 ) ( not ( = ?auto_614103 ?auto_614104 ) ) ( not ( = ?auto_614105 ?auto_614103 ) ) ( not ( = ?auto_614106 ?auto_614103 ) ) ( not ( = ?auto_614108 ?auto_614103 ) ) ( not ( = ?auto_614111 ?auto_614103 ) ) ( ON ?auto_614102 ?auto_614101 ) ( ON ?auto_614103 ?auto_614102 ) ( not ( = ?auto_614101 ?auto_614102 ) ) ( not ( = ?auto_614101 ?auto_614103 ) ) ( not ( = ?auto_614101 ?auto_614104 ) ) ( not ( = ?auto_614101 ?auto_614105 ) ) ( not ( = ?auto_614101 ?auto_614106 ) ) ( not ( = ?auto_614101 ?auto_614108 ) ) ( not ( = ?auto_614101 ?auto_614111 ) ) ( not ( = ?auto_614102 ?auto_614103 ) ) ( not ( = ?auto_614102 ?auto_614104 ) ) ( not ( = ?auto_614102 ?auto_614105 ) ) ( not ( = ?auto_614102 ?auto_614106 ) ) ( not ( = ?auto_614102 ?auto_614108 ) ) ( not ( = ?auto_614102 ?auto_614111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614104 ?auto_614105 ?auto_614106 )
      ( MAKE-5CRATE-VERIFY ?auto_614101 ?auto_614102 ?auto_614103 ?auto_614104 ?auto_614105 ?auto_614106 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_614114 - SURFACE
      ?auto_614115 - SURFACE
      ?auto_614116 - SURFACE
      ?auto_614117 - SURFACE
      ?auto_614118 - SURFACE
      ?auto_614119 - SURFACE
      ?auto_614120 - SURFACE
    )
    :vars
    (
      ?auto_614121 - HOIST
      ?auto_614123 - PLACE
      ?auto_614124 - PLACE
      ?auto_614126 - HOIST
      ?auto_614122 - SURFACE
      ?auto_614125 - SURFACE
      ?auto_614127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614121 ?auto_614123 ) ( IS-CRATE ?auto_614120 ) ( not ( = ?auto_614119 ?auto_614120 ) ) ( not ( = ?auto_614118 ?auto_614119 ) ) ( not ( = ?auto_614118 ?auto_614120 ) ) ( not ( = ?auto_614124 ?auto_614123 ) ) ( HOIST-AT ?auto_614126 ?auto_614124 ) ( not ( = ?auto_614121 ?auto_614126 ) ) ( SURFACE-AT ?auto_614120 ?auto_614124 ) ( ON ?auto_614120 ?auto_614122 ) ( CLEAR ?auto_614120 ) ( not ( = ?auto_614119 ?auto_614122 ) ) ( not ( = ?auto_614120 ?auto_614122 ) ) ( not ( = ?auto_614118 ?auto_614122 ) ) ( IS-CRATE ?auto_614119 ) ( AVAILABLE ?auto_614126 ) ( SURFACE-AT ?auto_614119 ?auto_614124 ) ( ON ?auto_614119 ?auto_614125 ) ( CLEAR ?auto_614119 ) ( not ( = ?auto_614119 ?auto_614125 ) ) ( not ( = ?auto_614120 ?auto_614125 ) ) ( not ( = ?auto_614118 ?auto_614125 ) ) ( not ( = ?auto_614122 ?auto_614125 ) ) ( TRUCK-AT ?auto_614127 ?auto_614123 ) ( SURFACE-AT ?auto_614117 ?auto_614123 ) ( CLEAR ?auto_614117 ) ( LIFTING ?auto_614121 ?auto_614118 ) ( IS-CRATE ?auto_614118 ) ( not ( = ?auto_614117 ?auto_614118 ) ) ( not ( = ?auto_614119 ?auto_614117 ) ) ( not ( = ?auto_614120 ?auto_614117 ) ) ( not ( = ?auto_614122 ?auto_614117 ) ) ( not ( = ?auto_614125 ?auto_614117 ) ) ( ON ?auto_614115 ?auto_614114 ) ( ON ?auto_614116 ?auto_614115 ) ( ON ?auto_614117 ?auto_614116 ) ( not ( = ?auto_614114 ?auto_614115 ) ) ( not ( = ?auto_614114 ?auto_614116 ) ) ( not ( = ?auto_614114 ?auto_614117 ) ) ( not ( = ?auto_614114 ?auto_614118 ) ) ( not ( = ?auto_614114 ?auto_614119 ) ) ( not ( = ?auto_614114 ?auto_614120 ) ) ( not ( = ?auto_614114 ?auto_614122 ) ) ( not ( = ?auto_614114 ?auto_614125 ) ) ( not ( = ?auto_614115 ?auto_614116 ) ) ( not ( = ?auto_614115 ?auto_614117 ) ) ( not ( = ?auto_614115 ?auto_614118 ) ) ( not ( = ?auto_614115 ?auto_614119 ) ) ( not ( = ?auto_614115 ?auto_614120 ) ) ( not ( = ?auto_614115 ?auto_614122 ) ) ( not ( = ?auto_614115 ?auto_614125 ) ) ( not ( = ?auto_614116 ?auto_614117 ) ) ( not ( = ?auto_614116 ?auto_614118 ) ) ( not ( = ?auto_614116 ?auto_614119 ) ) ( not ( = ?auto_614116 ?auto_614120 ) ) ( not ( = ?auto_614116 ?auto_614122 ) ) ( not ( = ?auto_614116 ?auto_614125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614118 ?auto_614119 ?auto_614120 )
      ( MAKE-6CRATE-VERIFY ?auto_614114 ?auto_614115 ?auto_614116 ?auto_614117 ?auto_614118 ?auto_614119 ?auto_614120 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_614128 - SURFACE
      ?auto_614129 - SURFACE
      ?auto_614130 - SURFACE
      ?auto_614131 - SURFACE
      ?auto_614132 - SURFACE
      ?auto_614133 - SURFACE
      ?auto_614134 - SURFACE
      ?auto_614135 - SURFACE
    )
    :vars
    (
      ?auto_614136 - HOIST
      ?auto_614138 - PLACE
      ?auto_614139 - PLACE
      ?auto_614141 - HOIST
      ?auto_614137 - SURFACE
      ?auto_614140 - SURFACE
      ?auto_614142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614136 ?auto_614138 ) ( IS-CRATE ?auto_614135 ) ( not ( = ?auto_614134 ?auto_614135 ) ) ( not ( = ?auto_614133 ?auto_614134 ) ) ( not ( = ?auto_614133 ?auto_614135 ) ) ( not ( = ?auto_614139 ?auto_614138 ) ) ( HOIST-AT ?auto_614141 ?auto_614139 ) ( not ( = ?auto_614136 ?auto_614141 ) ) ( SURFACE-AT ?auto_614135 ?auto_614139 ) ( ON ?auto_614135 ?auto_614137 ) ( CLEAR ?auto_614135 ) ( not ( = ?auto_614134 ?auto_614137 ) ) ( not ( = ?auto_614135 ?auto_614137 ) ) ( not ( = ?auto_614133 ?auto_614137 ) ) ( IS-CRATE ?auto_614134 ) ( AVAILABLE ?auto_614141 ) ( SURFACE-AT ?auto_614134 ?auto_614139 ) ( ON ?auto_614134 ?auto_614140 ) ( CLEAR ?auto_614134 ) ( not ( = ?auto_614134 ?auto_614140 ) ) ( not ( = ?auto_614135 ?auto_614140 ) ) ( not ( = ?auto_614133 ?auto_614140 ) ) ( not ( = ?auto_614137 ?auto_614140 ) ) ( TRUCK-AT ?auto_614142 ?auto_614138 ) ( SURFACE-AT ?auto_614132 ?auto_614138 ) ( CLEAR ?auto_614132 ) ( LIFTING ?auto_614136 ?auto_614133 ) ( IS-CRATE ?auto_614133 ) ( not ( = ?auto_614132 ?auto_614133 ) ) ( not ( = ?auto_614134 ?auto_614132 ) ) ( not ( = ?auto_614135 ?auto_614132 ) ) ( not ( = ?auto_614137 ?auto_614132 ) ) ( not ( = ?auto_614140 ?auto_614132 ) ) ( ON ?auto_614129 ?auto_614128 ) ( ON ?auto_614130 ?auto_614129 ) ( ON ?auto_614131 ?auto_614130 ) ( ON ?auto_614132 ?auto_614131 ) ( not ( = ?auto_614128 ?auto_614129 ) ) ( not ( = ?auto_614128 ?auto_614130 ) ) ( not ( = ?auto_614128 ?auto_614131 ) ) ( not ( = ?auto_614128 ?auto_614132 ) ) ( not ( = ?auto_614128 ?auto_614133 ) ) ( not ( = ?auto_614128 ?auto_614134 ) ) ( not ( = ?auto_614128 ?auto_614135 ) ) ( not ( = ?auto_614128 ?auto_614137 ) ) ( not ( = ?auto_614128 ?auto_614140 ) ) ( not ( = ?auto_614129 ?auto_614130 ) ) ( not ( = ?auto_614129 ?auto_614131 ) ) ( not ( = ?auto_614129 ?auto_614132 ) ) ( not ( = ?auto_614129 ?auto_614133 ) ) ( not ( = ?auto_614129 ?auto_614134 ) ) ( not ( = ?auto_614129 ?auto_614135 ) ) ( not ( = ?auto_614129 ?auto_614137 ) ) ( not ( = ?auto_614129 ?auto_614140 ) ) ( not ( = ?auto_614130 ?auto_614131 ) ) ( not ( = ?auto_614130 ?auto_614132 ) ) ( not ( = ?auto_614130 ?auto_614133 ) ) ( not ( = ?auto_614130 ?auto_614134 ) ) ( not ( = ?auto_614130 ?auto_614135 ) ) ( not ( = ?auto_614130 ?auto_614137 ) ) ( not ( = ?auto_614130 ?auto_614140 ) ) ( not ( = ?auto_614131 ?auto_614132 ) ) ( not ( = ?auto_614131 ?auto_614133 ) ) ( not ( = ?auto_614131 ?auto_614134 ) ) ( not ( = ?auto_614131 ?auto_614135 ) ) ( not ( = ?auto_614131 ?auto_614137 ) ) ( not ( = ?auto_614131 ?auto_614140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614133 ?auto_614134 ?auto_614135 )
      ( MAKE-7CRATE-VERIFY ?auto_614128 ?auto_614129 ?auto_614130 ?auto_614131 ?auto_614132 ?auto_614133 ?auto_614134 ?auto_614135 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_614143 - SURFACE
      ?auto_614144 - SURFACE
      ?auto_614145 - SURFACE
      ?auto_614146 - SURFACE
      ?auto_614147 - SURFACE
      ?auto_614148 - SURFACE
      ?auto_614149 - SURFACE
      ?auto_614150 - SURFACE
      ?auto_614151 - SURFACE
    )
    :vars
    (
      ?auto_614152 - HOIST
      ?auto_614154 - PLACE
      ?auto_614155 - PLACE
      ?auto_614157 - HOIST
      ?auto_614153 - SURFACE
      ?auto_614156 - SURFACE
      ?auto_614158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614152 ?auto_614154 ) ( IS-CRATE ?auto_614151 ) ( not ( = ?auto_614150 ?auto_614151 ) ) ( not ( = ?auto_614149 ?auto_614150 ) ) ( not ( = ?auto_614149 ?auto_614151 ) ) ( not ( = ?auto_614155 ?auto_614154 ) ) ( HOIST-AT ?auto_614157 ?auto_614155 ) ( not ( = ?auto_614152 ?auto_614157 ) ) ( SURFACE-AT ?auto_614151 ?auto_614155 ) ( ON ?auto_614151 ?auto_614153 ) ( CLEAR ?auto_614151 ) ( not ( = ?auto_614150 ?auto_614153 ) ) ( not ( = ?auto_614151 ?auto_614153 ) ) ( not ( = ?auto_614149 ?auto_614153 ) ) ( IS-CRATE ?auto_614150 ) ( AVAILABLE ?auto_614157 ) ( SURFACE-AT ?auto_614150 ?auto_614155 ) ( ON ?auto_614150 ?auto_614156 ) ( CLEAR ?auto_614150 ) ( not ( = ?auto_614150 ?auto_614156 ) ) ( not ( = ?auto_614151 ?auto_614156 ) ) ( not ( = ?auto_614149 ?auto_614156 ) ) ( not ( = ?auto_614153 ?auto_614156 ) ) ( TRUCK-AT ?auto_614158 ?auto_614154 ) ( SURFACE-AT ?auto_614148 ?auto_614154 ) ( CLEAR ?auto_614148 ) ( LIFTING ?auto_614152 ?auto_614149 ) ( IS-CRATE ?auto_614149 ) ( not ( = ?auto_614148 ?auto_614149 ) ) ( not ( = ?auto_614150 ?auto_614148 ) ) ( not ( = ?auto_614151 ?auto_614148 ) ) ( not ( = ?auto_614153 ?auto_614148 ) ) ( not ( = ?auto_614156 ?auto_614148 ) ) ( ON ?auto_614144 ?auto_614143 ) ( ON ?auto_614145 ?auto_614144 ) ( ON ?auto_614146 ?auto_614145 ) ( ON ?auto_614147 ?auto_614146 ) ( ON ?auto_614148 ?auto_614147 ) ( not ( = ?auto_614143 ?auto_614144 ) ) ( not ( = ?auto_614143 ?auto_614145 ) ) ( not ( = ?auto_614143 ?auto_614146 ) ) ( not ( = ?auto_614143 ?auto_614147 ) ) ( not ( = ?auto_614143 ?auto_614148 ) ) ( not ( = ?auto_614143 ?auto_614149 ) ) ( not ( = ?auto_614143 ?auto_614150 ) ) ( not ( = ?auto_614143 ?auto_614151 ) ) ( not ( = ?auto_614143 ?auto_614153 ) ) ( not ( = ?auto_614143 ?auto_614156 ) ) ( not ( = ?auto_614144 ?auto_614145 ) ) ( not ( = ?auto_614144 ?auto_614146 ) ) ( not ( = ?auto_614144 ?auto_614147 ) ) ( not ( = ?auto_614144 ?auto_614148 ) ) ( not ( = ?auto_614144 ?auto_614149 ) ) ( not ( = ?auto_614144 ?auto_614150 ) ) ( not ( = ?auto_614144 ?auto_614151 ) ) ( not ( = ?auto_614144 ?auto_614153 ) ) ( not ( = ?auto_614144 ?auto_614156 ) ) ( not ( = ?auto_614145 ?auto_614146 ) ) ( not ( = ?auto_614145 ?auto_614147 ) ) ( not ( = ?auto_614145 ?auto_614148 ) ) ( not ( = ?auto_614145 ?auto_614149 ) ) ( not ( = ?auto_614145 ?auto_614150 ) ) ( not ( = ?auto_614145 ?auto_614151 ) ) ( not ( = ?auto_614145 ?auto_614153 ) ) ( not ( = ?auto_614145 ?auto_614156 ) ) ( not ( = ?auto_614146 ?auto_614147 ) ) ( not ( = ?auto_614146 ?auto_614148 ) ) ( not ( = ?auto_614146 ?auto_614149 ) ) ( not ( = ?auto_614146 ?auto_614150 ) ) ( not ( = ?auto_614146 ?auto_614151 ) ) ( not ( = ?auto_614146 ?auto_614153 ) ) ( not ( = ?auto_614146 ?auto_614156 ) ) ( not ( = ?auto_614147 ?auto_614148 ) ) ( not ( = ?auto_614147 ?auto_614149 ) ) ( not ( = ?auto_614147 ?auto_614150 ) ) ( not ( = ?auto_614147 ?auto_614151 ) ) ( not ( = ?auto_614147 ?auto_614153 ) ) ( not ( = ?auto_614147 ?auto_614156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614149 ?auto_614150 ?auto_614151 )
      ( MAKE-8CRATE-VERIFY ?auto_614143 ?auto_614144 ?auto_614145 ?auto_614146 ?auto_614147 ?auto_614148 ?auto_614149 ?auto_614150 ?auto_614151 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_614159 - SURFACE
      ?auto_614160 - SURFACE
      ?auto_614161 - SURFACE
      ?auto_614162 - SURFACE
      ?auto_614163 - SURFACE
      ?auto_614164 - SURFACE
      ?auto_614165 - SURFACE
      ?auto_614166 - SURFACE
      ?auto_614167 - SURFACE
      ?auto_614168 - SURFACE
    )
    :vars
    (
      ?auto_614169 - HOIST
      ?auto_614171 - PLACE
      ?auto_614172 - PLACE
      ?auto_614174 - HOIST
      ?auto_614170 - SURFACE
      ?auto_614173 - SURFACE
      ?auto_614175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614169 ?auto_614171 ) ( IS-CRATE ?auto_614168 ) ( not ( = ?auto_614167 ?auto_614168 ) ) ( not ( = ?auto_614166 ?auto_614167 ) ) ( not ( = ?auto_614166 ?auto_614168 ) ) ( not ( = ?auto_614172 ?auto_614171 ) ) ( HOIST-AT ?auto_614174 ?auto_614172 ) ( not ( = ?auto_614169 ?auto_614174 ) ) ( SURFACE-AT ?auto_614168 ?auto_614172 ) ( ON ?auto_614168 ?auto_614170 ) ( CLEAR ?auto_614168 ) ( not ( = ?auto_614167 ?auto_614170 ) ) ( not ( = ?auto_614168 ?auto_614170 ) ) ( not ( = ?auto_614166 ?auto_614170 ) ) ( IS-CRATE ?auto_614167 ) ( AVAILABLE ?auto_614174 ) ( SURFACE-AT ?auto_614167 ?auto_614172 ) ( ON ?auto_614167 ?auto_614173 ) ( CLEAR ?auto_614167 ) ( not ( = ?auto_614167 ?auto_614173 ) ) ( not ( = ?auto_614168 ?auto_614173 ) ) ( not ( = ?auto_614166 ?auto_614173 ) ) ( not ( = ?auto_614170 ?auto_614173 ) ) ( TRUCK-AT ?auto_614175 ?auto_614171 ) ( SURFACE-AT ?auto_614165 ?auto_614171 ) ( CLEAR ?auto_614165 ) ( LIFTING ?auto_614169 ?auto_614166 ) ( IS-CRATE ?auto_614166 ) ( not ( = ?auto_614165 ?auto_614166 ) ) ( not ( = ?auto_614167 ?auto_614165 ) ) ( not ( = ?auto_614168 ?auto_614165 ) ) ( not ( = ?auto_614170 ?auto_614165 ) ) ( not ( = ?auto_614173 ?auto_614165 ) ) ( ON ?auto_614160 ?auto_614159 ) ( ON ?auto_614161 ?auto_614160 ) ( ON ?auto_614162 ?auto_614161 ) ( ON ?auto_614163 ?auto_614162 ) ( ON ?auto_614164 ?auto_614163 ) ( ON ?auto_614165 ?auto_614164 ) ( not ( = ?auto_614159 ?auto_614160 ) ) ( not ( = ?auto_614159 ?auto_614161 ) ) ( not ( = ?auto_614159 ?auto_614162 ) ) ( not ( = ?auto_614159 ?auto_614163 ) ) ( not ( = ?auto_614159 ?auto_614164 ) ) ( not ( = ?auto_614159 ?auto_614165 ) ) ( not ( = ?auto_614159 ?auto_614166 ) ) ( not ( = ?auto_614159 ?auto_614167 ) ) ( not ( = ?auto_614159 ?auto_614168 ) ) ( not ( = ?auto_614159 ?auto_614170 ) ) ( not ( = ?auto_614159 ?auto_614173 ) ) ( not ( = ?auto_614160 ?auto_614161 ) ) ( not ( = ?auto_614160 ?auto_614162 ) ) ( not ( = ?auto_614160 ?auto_614163 ) ) ( not ( = ?auto_614160 ?auto_614164 ) ) ( not ( = ?auto_614160 ?auto_614165 ) ) ( not ( = ?auto_614160 ?auto_614166 ) ) ( not ( = ?auto_614160 ?auto_614167 ) ) ( not ( = ?auto_614160 ?auto_614168 ) ) ( not ( = ?auto_614160 ?auto_614170 ) ) ( not ( = ?auto_614160 ?auto_614173 ) ) ( not ( = ?auto_614161 ?auto_614162 ) ) ( not ( = ?auto_614161 ?auto_614163 ) ) ( not ( = ?auto_614161 ?auto_614164 ) ) ( not ( = ?auto_614161 ?auto_614165 ) ) ( not ( = ?auto_614161 ?auto_614166 ) ) ( not ( = ?auto_614161 ?auto_614167 ) ) ( not ( = ?auto_614161 ?auto_614168 ) ) ( not ( = ?auto_614161 ?auto_614170 ) ) ( not ( = ?auto_614161 ?auto_614173 ) ) ( not ( = ?auto_614162 ?auto_614163 ) ) ( not ( = ?auto_614162 ?auto_614164 ) ) ( not ( = ?auto_614162 ?auto_614165 ) ) ( not ( = ?auto_614162 ?auto_614166 ) ) ( not ( = ?auto_614162 ?auto_614167 ) ) ( not ( = ?auto_614162 ?auto_614168 ) ) ( not ( = ?auto_614162 ?auto_614170 ) ) ( not ( = ?auto_614162 ?auto_614173 ) ) ( not ( = ?auto_614163 ?auto_614164 ) ) ( not ( = ?auto_614163 ?auto_614165 ) ) ( not ( = ?auto_614163 ?auto_614166 ) ) ( not ( = ?auto_614163 ?auto_614167 ) ) ( not ( = ?auto_614163 ?auto_614168 ) ) ( not ( = ?auto_614163 ?auto_614170 ) ) ( not ( = ?auto_614163 ?auto_614173 ) ) ( not ( = ?auto_614164 ?auto_614165 ) ) ( not ( = ?auto_614164 ?auto_614166 ) ) ( not ( = ?auto_614164 ?auto_614167 ) ) ( not ( = ?auto_614164 ?auto_614168 ) ) ( not ( = ?auto_614164 ?auto_614170 ) ) ( not ( = ?auto_614164 ?auto_614173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614166 ?auto_614167 ?auto_614168 )
      ( MAKE-9CRATE-VERIFY ?auto_614159 ?auto_614160 ?auto_614161 ?auto_614162 ?auto_614163 ?auto_614164 ?auto_614165 ?auto_614166 ?auto_614167 ?auto_614168 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_614176 - SURFACE
      ?auto_614177 - SURFACE
      ?auto_614178 - SURFACE
      ?auto_614179 - SURFACE
      ?auto_614180 - SURFACE
      ?auto_614181 - SURFACE
      ?auto_614182 - SURFACE
      ?auto_614183 - SURFACE
      ?auto_614184 - SURFACE
      ?auto_614185 - SURFACE
      ?auto_614186 - SURFACE
    )
    :vars
    (
      ?auto_614187 - HOIST
      ?auto_614189 - PLACE
      ?auto_614190 - PLACE
      ?auto_614192 - HOIST
      ?auto_614188 - SURFACE
      ?auto_614191 - SURFACE
      ?auto_614193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_614187 ?auto_614189 ) ( IS-CRATE ?auto_614186 ) ( not ( = ?auto_614185 ?auto_614186 ) ) ( not ( = ?auto_614184 ?auto_614185 ) ) ( not ( = ?auto_614184 ?auto_614186 ) ) ( not ( = ?auto_614190 ?auto_614189 ) ) ( HOIST-AT ?auto_614192 ?auto_614190 ) ( not ( = ?auto_614187 ?auto_614192 ) ) ( SURFACE-AT ?auto_614186 ?auto_614190 ) ( ON ?auto_614186 ?auto_614188 ) ( CLEAR ?auto_614186 ) ( not ( = ?auto_614185 ?auto_614188 ) ) ( not ( = ?auto_614186 ?auto_614188 ) ) ( not ( = ?auto_614184 ?auto_614188 ) ) ( IS-CRATE ?auto_614185 ) ( AVAILABLE ?auto_614192 ) ( SURFACE-AT ?auto_614185 ?auto_614190 ) ( ON ?auto_614185 ?auto_614191 ) ( CLEAR ?auto_614185 ) ( not ( = ?auto_614185 ?auto_614191 ) ) ( not ( = ?auto_614186 ?auto_614191 ) ) ( not ( = ?auto_614184 ?auto_614191 ) ) ( not ( = ?auto_614188 ?auto_614191 ) ) ( TRUCK-AT ?auto_614193 ?auto_614189 ) ( SURFACE-AT ?auto_614183 ?auto_614189 ) ( CLEAR ?auto_614183 ) ( LIFTING ?auto_614187 ?auto_614184 ) ( IS-CRATE ?auto_614184 ) ( not ( = ?auto_614183 ?auto_614184 ) ) ( not ( = ?auto_614185 ?auto_614183 ) ) ( not ( = ?auto_614186 ?auto_614183 ) ) ( not ( = ?auto_614188 ?auto_614183 ) ) ( not ( = ?auto_614191 ?auto_614183 ) ) ( ON ?auto_614177 ?auto_614176 ) ( ON ?auto_614178 ?auto_614177 ) ( ON ?auto_614179 ?auto_614178 ) ( ON ?auto_614180 ?auto_614179 ) ( ON ?auto_614181 ?auto_614180 ) ( ON ?auto_614182 ?auto_614181 ) ( ON ?auto_614183 ?auto_614182 ) ( not ( = ?auto_614176 ?auto_614177 ) ) ( not ( = ?auto_614176 ?auto_614178 ) ) ( not ( = ?auto_614176 ?auto_614179 ) ) ( not ( = ?auto_614176 ?auto_614180 ) ) ( not ( = ?auto_614176 ?auto_614181 ) ) ( not ( = ?auto_614176 ?auto_614182 ) ) ( not ( = ?auto_614176 ?auto_614183 ) ) ( not ( = ?auto_614176 ?auto_614184 ) ) ( not ( = ?auto_614176 ?auto_614185 ) ) ( not ( = ?auto_614176 ?auto_614186 ) ) ( not ( = ?auto_614176 ?auto_614188 ) ) ( not ( = ?auto_614176 ?auto_614191 ) ) ( not ( = ?auto_614177 ?auto_614178 ) ) ( not ( = ?auto_614177 ?auto_614179 ) ) ( not ( = ?auto_614177 ?auto_614180 ) ) ( not ( = ?auto_614177 ?auto_614181 ) ) ( not ( = ?auto_614177 ?auto_614182 ) ) ( not ( = ?auto_614177 ?auto_614183 ) ) ( not ( = ?auto_614177 ?auto_614184 ) ) ( not ( = ?auto_614177 ?auto_614185 ) ) ( not ( = ?auto_614177 ?auto_614186 ) ) ( not ( = ?auto_614177 ?auto_614188 ) ) ( not ( = ?auto_614177 ?auto_614191 ) ) ( not ( = ?auto_614178 ?auto_614179 ) ) ( not ( = ?auto_614178 ?auto_614180 ) ) ( not ( = ?auto_614178 ?auto_614181 ) ) ( not ( = ?auto_614178 ?auto_614182 ) ) ( not ( = ?auto_614178 ?auto_614183 ) ) ( not ( = ?auto_614178 ?auto_614184 ) ) ( not ( = ?auto_614178 ?auto_614185 ) ) ( not ( = ?auto_614178 ?auto_614186 ) ) ( not ( = ?auto_614178 ?auto_614188 ) ) ( not ( = ?auto_614178 ?auto_614191 ) ) ( not ( = ?auto_614179 ?auto_614180 ) ) ( not ( = ?auto_614179 ?auto_614181 ) ) ( not ( = ?auto_614179 ?auto_614182 ) ) ( not ( = ?auto_614179 ?auto_614183 ) ) ( not ( = ?auto_614179 ?auto_614184 ) ) ( not ( = ?auto_614179 ?auto_614185 ) ) ( not ( = ?auto_614179 ?auto_614186 ) ) ( not ( = ?auto_614179 ?auto_614188 ) ) ( not ( = ?auto_614179 ?auto_614191 ) ) ( not ( = ?auto_614180 ?auto_614181 ) ) ( not ( = ?auto_614180 ?auto_614182 ) ) ( not ( = ?auto_614180 ?auto_614183 ) ) ( not ( = ?auto_614180 ?auto_614184 ) ) ( not ( = ?auto_614180 ?auto_614185 ) ) ( not ( = ?auto_614180 ?auto_614186 ) ) ( not ( = ?auto_614180 ?auto_614188 ) ) ( not ( = ?auto_614180 ?auto_614191 ) ) ( not ( = ?auto_614181 ?auto_614182 ) ) ( not ( = ?auto_614181 ?auto_614183 ) ) ( not ( = ?auto_614181 ?auto_614184 ) ) ( not ( = ?auto_614181 ?auto_614185 ) ) ( not ( = ?auto_614181 ?auto_614186 ) ) ( not ( = ?auto_614181 ?auto_614188 ) ) ( not ( = ?auto_614181 ?auto_614191 ) ) ( not ( = ?auto_614182 ?auto_614183 ) ) ( not ( = ?auto_614182 ?auto_614184 ) ) ( not ( = ?auto_614182 ?auto_614185 ) ) ( not ( = ?auto_614182 ?auto_614186 ) ) ( not ( = ?auto_614182 ?auto_614188 ) ) ( not ( = ?auto_614182 ?auto_614191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_614184 ?auto_614185 ?auto_614186 )
      ( MAKE-10CRATE-VERIFY ?auto_614176 ?auto_614177 ?auto_614178 ?auto_614179 ?auto_614180 ?auto_614181 ?auto_614182 ?auto_614183 ?auto_614184 ?auto_614185 ?auto_614186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_616027 - SURFACE
      ?auto_616028 - SURFACE
    )
    :vars
    (
      ?auto_616029 - HOIST
      ?auto_616036 - PLACE
      ?auto_616032 - SURFACE
      ?auto_616030 - PLACE
      ?auto_616031 - HOIST
      ?auto_616034 - SURFACE
      ?auto_616033 - TRUCK
      ?auto_616035 - SURFACE
      ?auto_616037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_616029 ?auto_616036 ) ( IS-CRATE ?auto_616028 ) ( not ( = ?auto_616027 ?auto_616028 ) ) ( not ( = ?auto_616032 ?auto_616027 ) ) ( not ( = ?auto_616032 ?auto_616028 ) ) ( not ( = ?auto_616030 ?auto_616036 ) ) ( HOIST-AT ?auto_616031 ?auto_616030 ) ( not ( = ?auto_616029 ?auto_616031 ) ) ( SURFACE-AT ?auto_616028 ?auto_616030 ) ( ON ?auto_616028 ?auto_616034 ) ( CLEAR ?auto_616028 ) ( not ( = ?auto_616027 ?auto_616034 ) ) ( not ( = ?auto_616028 ?auto_616034 ) ) ( not ( = ?auto_616032 ?auto_616034 ) ) ( SURFACE-AT ?auto_616032 ?auto_616036 ) ( CLEAR ?auto_616032 ) ( IS-CRATE ?auto_616027 ) ( AVAILABLE ?auto_616029 ) ( TRUCK-AT ?auto_616033 ?auto_616030 ) ( SURFACE-AT ?auto_616027 ?auto_616030 ) ( ON ?auto_616027 ?auto_616035 ) ( CLEAR ?auto_616027 ) ( not ( = ?auto_616027 ?auto_616035 ) ) ( not ( = ?auto_616028 ?auto_616035 ) ) ( not ( = ?auto_616032 ?auto_616035 ) ) ( not ( = ?auto_616034 ?auto_616035 ) ) ( LIFTING ?auto_616031 ?auto_616037 ) ( IS-CRATE ?auto_616037 ) ( not ( = ?auto_616027 ?auto_616037 ) ) ( not ( = ?auto_616028 ?auto_616037 ) ) ( not ( = ?auto_616032 ?auto_616037 ) ) ( not ( = ?auto_616034 ?auto_616037 ) ) ( not ( = ?auto_616035 ?auto_616037 ) ) )
    :subtasks
    ( ( !LOAD ?auto_616031 ?auto_616037 ?auto_616033 ?auto_616030 )
      ( MAKE-2CRATE ?auto_616032 ?auto_616027 ?auto_616028 )
      ( MAKE-1CRATE-VERIFY ?auto_616027 ?auto_616028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_616038 - SURFACE
      ?auto_616039 - SURFACE
      ?auto_616040 - SURFACE
    )
    :vars
    (
      ?auto_616041 - HOIST
      ?auto_616045 - PLACE
      ?auto_616042 - PLACE
      ?auto_616044 - HOIST
      ?auto_616048 - SURFACE
      ?auto_616046 - TRUCK
      ?auto_616043 - SURFACE
      ?auto_616047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_616041 ?auto_616045 ) ( IS-CRATE ?auto_616040 ) ( not ( = ?auto_616039 ?auto_616040 ) ) ( not ( = ?auto_616038 ?auto_616039 ) ) ( not ( = ?auto_616038 ?auto_616040 ) ) ( not ( = ?auto_616042 ?auto_616045 ) ) ( HOIST-AT ?auto_616044 ?auto_616042 ) ( not ( = ?auto_616041 ?auto_616044 ) ) ( SURFACE-AT ?auto_616040 ?auto_616042 ) ( ON ?auto_616040 ?auto_616048 ) ( CLEAR ?auto_616040 ) ( not ( = ?auto_616039 ?auto_616048 ) ) ( not ( = ?auto_616040 ?auto_616048 ) ) ( not ( = ?auto_616038 ?auto_616048 ) ) ( SURFACE-AT ?auto_616038 ?auto_616045 ) ( CLEAR ?auto_616038 ) ( IS-CRATE ?auto_616039 ) ( AVAILABLE ?auto_616041 ) ( TRUCK-AT ?auto_616046 ?auto_616042 ) ( SURFACE-AT ?auto_616039 ?auto_616042 ) ( ON ?auto_616039 ?auto_616043 ) ( CLEAR ?auto_616039 ) ( not ( = ?auto_616039 ?auto_616043 ) ) ( not ( = ?auto_616040 ?auto_616043 ) ) ( not ( = ?auto_616038 ?auto_616043 ) ) ( not ( = ?auto_616048 ?auto_616043 ) ) ( LIFTING ?auto_616044 ?auto_616047 ) ( IS-CRATE ?auto_616047 ) ( not ( = ?auto_616039 ?auto_616047 ) ) ( not ( = ?auto_616040 ?auto_616047 ) ) ( not ( = ?auto_616038 ?auto_616047 ) ) ( not ( = ?auto_616048 ?auto_616047 ) ) ( not ( = ?auto_616043 ?auto_616047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_616039 ?auto_616040 )
      ( MAKE-2CRATE-VERIFY ?auto_616038 ?auto_616039 ?auto_616040 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620686 - SURFACE
      ?auto_620687 - SURFACE
      ?auto_620688 - SURFACE
      ?auto_620689 - SURFACE
      ?auto_620690 - SURFACE
      ?auto_620691 - SURFACE
      ?auto_620692 - SURFACE
      ?auto_620693 - SURFACE
      ?auto_620694 - SURFACE
      ?auto_620695 - SURFACE
      ?auto_620696 - SURFACE
      ?auto_620697 - SURFACE
    )
    :vars
    (
      ?auto_620698 - HOIST
      ?auto_620699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_620698 ?auto_620699 ) ( SURFACE-AT ?auto_620696 ?auto_620699 ) ( CLEAR ?auto_620696 ) ( LIFTING ?auto_620698 ?auto_620697 ) ( IS-CRATE ?auto_620697 ) ( not ( = ?auto_620696 ?auto_620697 ) ) ( ON ?auto_620687 ?auto_620686 ) ( ON ?auto_620688 ?auto_620687 ) ( ON ?auto_620689 ?auto_620688 ) ( ON ?auto_620690 ?auto_620689 ) ( ON ?auto_620691 ?auto_620690 ) ( ON ?auto_620692 ?auto_620691 ) ( ON ?auto_620693 ?auto_620692 ) ( ON ?auto_620694 ?auto_620693 ) ( ON ?auto_620695 ?auto_620694 ) ( ON ?auto_620696 ?auto_620695 ) ( not ( = ?auto_620686 ?auto_620687 ) ) ( not ( = ?auto_620686 ?auto_620688 ) ) ( not ( = ?auto_620686 ?auto_620689 ) ) ( not ( = ?auto_620686 ?auto_620690 ) ) ( not ( = ?auto_620686 ?auto_620691 ) ) ( not ( = ?auto_620686 ?auto_620692 ) ) ( not ( = ?auto_620686 ?auto_620693 ) ) ( not ( = ?auto_620686 ?auto_620694 ) ) ( not ( = ?auto_620686 ?auto_620695 ) ) ( not ( = ?auto_620686 ?auto_620696 ) ) ( not ( = ?auto_620686 ?auto_620697 ) ) ( not ( = ?auto_620687 ?auto_620688 ) ) ( not ( = ?auto_620687 ?auto_620689 ) ) ( not ( = ?auto_620687 ?auto_620690 ) ) ( not ( = ?auto_620687 ?auto_620691 ) ) ( not ( = ?auto_620687 ?auto_620692 ) ) ( not ( = ?auto_620687 ?auto_620693 ) ) ( not ( = ?auto_620687 ?auto_620694 ) ) ( not ( = ?auto_620687 ?auto_620695 ) ) ( not ( = ?auto_620687 ?auto_620696 ) ) ( not ( = ?auto_620687 ?auto_620697 ) ) ( not ( = ?auto_620688 ?auto_620689 ) ) ( not ( = ?auto_620688 ?auto_620690 ) ) ( not ( = ?auto_620688 ?auto_620691 ) ) ( not ( = ?auto_620688 ?auto_620692 ) ) ( not ( = ?auto_620688 ?auto_620693 ) ) ( not ( = ?auto_620688 ?auto_620694 ) ) ( not ( = ?auto_620688 ?auto_620695 ) ) ( not ( = ?auto_620688 ?auto_620696 ) ) ( not ( = ?auto_620688 ?auto_620697 ) ) ( not ( = ?auto_620689 ?auto_620690 ) ) ( not ( = ?auto_620689 ?auto_620691 ) ) ( not ( = ?auto_620689 ?auto_620692 ) ) ( not ( = ?auto_620689 ?auto_620693 ) ) ( not ( = ?auto_620689 ?auto_620694 ) ) ( not ( = ?auto_620689 ?auto_620695 ) ) ( not ( = ?auto_620689 ?auto_620696 ) ) ( not ( = ?auto_620689 ?auto_620697 ) ) ( not ( = ?auto_620690 ?auto_620691 ) ) ( not ( = ?auto_620690 ?auto_620692 ) ) ( not ( = ?auto_620690 ?auto_620693 ) ) ( not ( = ?auto_620690 ?auto_620694 ) ) ( not ( = ?auto_620690 ?auto_620695 ) ) ( not ( = ?auto_620690 ?auto_620696 ) ) ( not ( = ?auto_620690 ?auto_620697 ) ) ( not ( = ?auto_620691 ?auto_620692 ) ) ( not ( = ?auto_620691 ?auto_620693 ) ) ( not ( = ?auto_620691 ?auto_620694 ) ) ( not ( = ?auto_620691 ?auto_620695 ) ) ( not ( = ?auto_620691 ?auto_620696 ) ) ( not ( = ?auto_620691 ?auto_620697 ) ) ( not ( = ?auto_620692 ?auto_620693 ) ) ( not ( = ?auto_620692 ?auto_620694 ) ) ( not ( = ?auto_620692 ?auto_620695 ) ) ( not ( = ?auto_620692 ?auto_620696 ) ) ( not ( = ?auto_620692 ?auto_620697 ) ) ( not ( = ?auto_620693 ?auto_620694 ) ) ( not ( = ?auto_620693 ?auto_620695 ) ) ( not ( = ?auto_620693 ?auto_620696 ) ) ( not ( = ?auto_620693 ?auto_620697 ) ) ( not ( = ?auto_620694 ?auto_620695 ) ) ( not ( = ?auto_620694 ?auto_620696 ) ) ( not ( = ?auto_620694 ?auto_620697 ) ) ( not ( = ?auto_620695 ?auto_620696 ) ) ( not ( = ?auto_620695 ?auto_620697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_620696 ?auto_620697 )
      ( MAKE-11CRATE-VERIFY ?auto_620686 ?auto_620687 ?auto_620688 ?auto_620689 ?auto_620690 ?auto_620691 ?auto_620692 ?auto_620693 ?auto_620694 ?auto_620695 ?auto_620696 ?auto_620697 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620795 - SURFACE
      ?auto_620796 - SURFACE
      ?auto_620797 - SURFACE
      ?auto_620798 - SURFACE
      ?auto_620799 - SURFACE
      ?auto_620800 - SURFACE
      ?auto_620801 - SURFACE
      ?auto_620802 - SURFACE
      ?auto_620803 - SURFACE
      ?auto_620804 - SURFACE
      ?auto_620805 - SURFACE
      ?auto_620806 - SURFACE
    )
    :vars
    (
      ?auto_620809 - HOIST
      ?auto_620807 - PLACE
      ?auto_620808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_620809 ?auto_620807 ) ( SURFACE-AT ?auto_620805 ?auto_620807 ) ( CLEAR ?auto_620805 ) ( IS-CRATE ?auto_620806 ) ( not ( = ?auto_620805 ?auto_620806 ) ) ( TRUCK-AT ?auto_620808 ?auto_620807 ) ( AVAILABLE ?auto_620809 ) ( IN ?auto_620806 ?auto_620808 ) ( ON ?auto_620805 ?auto_620804 ) ( not ( = ?auto_620804 ?auto_620805 ) ) ( not ( = ?auto_620804 ?auto_620806 ) ) ( ON ?auto_620796 ?auto_620795 ) ( ON ?auto_620797 ?auto_620796 ) ( ON ?auto_620798 ?auto_620797 ) ( ON ?auto_620799 ?auto_620798 ) ( ON ?auto_620800 ?auto_620799 ) ( ON ?auto_620801 ?auto_620800 ) ( ON ?auto_620802 ?auto_620801 ) ( ON ?auto_620803 ?auto_620802 ) ( ON ?auto_620804 ?auto_620803 ) ( not ( = ?auto_620795 ?auto_620796 ) ) ( not ( = ?auto_620795 ?auto_620797 ) ) ( not ( = ?auto_620795 ?auto_620798 ) ) ( not ( = ?auto_620795 ?auto_620799 ) ) ( not ( = ?auto_620795 ?auto_620800 ) ) ( not ( = ?auto_620795 ?auto_620801 ) ) ( not ( = ?auto_620795 ?auto_620802 ) ) ( not ( = ?auto_620795 ?auto_620803 ) ) ( not ( = ?auto_620795 ?auto_620804 ) ) ( not ( = ?auto_620795 ?auto_620805 ) ) ( not ( = ?auto_620795 ?auto_620806 ) ) ( not ( = ?auto_620796 ?auto_620797 ) ) ( not ( = ?auto_620796 ?auto_620798 ) ) ( not ( = ?auto_620796 ?auto_620799 ) ) ( not ( = ?auto_620796 ?auto_620800 ) ) ( not ( = ?auto_620796 ?auto_620801 ) ) ( not ( = ?auto_620796 ?auto_620802 ) ) ( not ( = ?auto_620796 ?auto_620803 ) ) ( not ( = ?auto_620796 ?auto_620804 ) ) ( not ( = ?auto_620796 ?auto_620805 ) ) ( not ( = ?auto_620796 ?auto_620806 ) ) ( not ( = ?auto_620797 ?auto_620798 ) ) ( not ( = ?auto_620797 ?auto_620799 ) ) ( not ( = ?auto_620797 ?auto_620800 ) ) ( not ( = ?auto_620797 ?auto_620801 ) ) ( not ( = ?auto_620797 ?auto_620802 ) ) ( not ( = ?auto_620797 ?auto_620803 ) ) ( not ( = ?auto_620797 ?auto_620804 ) ) ( not ( = ?auto_620797 ?auto_620805 ) ) ( not ( = ?auto_620797 ?auto_620806 ) ) ( not ( = ?auto_620798 ?auto_620799 ) ) ( not ( = ?auto_620798 ?auto_620800 ) ) ( not ( = ?auto_620798 ?auto_620801 ) ) ( not ( = ?auto_620798 ?auto_620802 ) ) ( not ( = ?auto_620798 ?auto_620803 ) ) ( not ( = ?auto_620798 ?auto_620804 ) ) ( not ( = ?auto_620798 ?auto_620805 ) ) ( not ( = ?auto_620798 ?auto_620806 ) ) ( not ( = ?auto_620799 ?auto_620800 ) ) ( not ( = ?auto_620799 ?auto_620801 ) ) ( not ( = ?auto_620799 ?auto_620802 ) ) ( not ( = ?auto_620799 ?auto_620803 ) ) ( not ( = ?auto_620799 ?auto_620804 ) ) ( not ( = ?auto_620799 ?auto_620805 ) ) ( not ( = ?auto_620799 ?auto_620806 ) ) ( not ( = ?auto_620800 ?auto_620801 ) ) ( not ( = ?auto_620800 ?auto_620802 ) ) ( not ( = ?auto_620800 ?auto_620803 ) ) ( not ( = ?auto_620800 ?auto_620804 ) ) ( not ( = ?auto_620800 ?auto_620805 ) ) ( not ( = ?auto_620800 ?auto_620806 ) ) ( not ( = ?auto_620801 ?auto_620802 ) ) ( not ( = ?auto_620801 ?auto_620803 ) ) ( not ( = ?auto_620801 ?auto_620804 ) ) ( not ( = ?auto_620801 ?auto_620805 ) ) ( not ( = ?auto_620801 ?auto_620806 ) ) ( not ( = ?auto_620802 ?auto_620803 ) ) ( not ( = ?auto_620802 ?auto_620804 ) ) ( not ( = ?auto_620802 ?auto_620805 ) ) ( not ( = ?auto_620802 ?auto_620806 ) ) ( not ( = ?auto_620803 ?auto_620804 ) ) ( not ( = ?auto_620803 ?auto_620805 ) ) ( not ( = ?auto_620803 ?auto_620806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620804 ?auto_620805 ?auto_620806 )
      ( MAKE-11CRATE-VERIFY ?auto_620795 ?auto_620796 ?auto_620797 ?auto_620798 ?auto_620799 ?auto_620800 ?auto_620801 ?auto_620802 ?auto_620803 ?auto_620804 ?auto_620805 ?auto_620806 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_620916 - SURFACE
      ?auto_620917 - SURFACE
      ?auto_620918 - SURFACE
      ?auto_620919 - SURFACE
      ?auto_620920 - SURFACE
      ?auto_620921 - SURFACE
      ?auto_620922 - SURFACE
      ?auto_620923 - SURFACE
      ?auto_620924 - SURFACE
      ?auto_620925 - SURFACE
      ?auto_620926 - SURFACE
      ?auto_620927 - SURFACE
    )
    :vars
    (
      ?auto_620931 - HOIST
      ?auto_620929 - PLACE
      ?auto_620930 - TRUCK
      ?auto_620928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_620931 ?auto_620929 ) ( SURFACE-AT ?auto_620926 ?auto_620929 ) ( CLEAR ?auto_620926 ) ( IS-CRATE ?auto_620927 ) ( not ( = ?auto_620926 ?auto_620927 ) ) ( AVAILABLE ?auto_620931 ) ( IN ?auto_620927 ?auto_620930 ) ( ON ?auto_620926 ?auto_620925 ) ( not ( = ?auto_620925 ?auto_620926 ) ) ( not ( = ?auto_620925 ?auto_620927 ) ) ( TRUCK-AT ?auto_620930 ?auto_620928 ) ( not ( = ?auto_620928 ?auto_620929 ) ) ( ON ?auto_620917 ?auto_620916 ) ( ON ?auto_620918 ?auto_620917 ) ( ON ?auto_620919 ?auto_620918 ) ( ON ?auto_620920 ?auto_620919 ) ( ON ?auto_620921 ?auto_620920 ) ( ON ?auto_620922 ?auto_620921 ) ( ON ?auto_620923 ?auto_620922 ) ( ON ?auto_620924 ?auto_620923 ) ( ON ?auto_620925 ?auto_620924 ) ( not ( = ?auto_620916 ?auto_620917 ) ) ( not ( = ?auto_620916 ?auto_620918 ) ) ( not ( = ?auto_620916 ?auto_620919 ) ) ( not ( = ?auto_620916 ?auto_620920 ) ) ( not ( = ?auto_620916 ?auto_620921 ) ) ( not ( = ?auto_620916 ?auto_620922 ) ) ( not ( = ?auto_620916 ?auto_620923 ) ) ( not ( = ?auto_620916 ?auto_620924 ) ) ( not ( = ?auto_620916 ?auto_620925 ) ) ( not ( = ?auto_620916 ?auto_620926 ) ) ( not ( = ?auto_620916 ?auto_620927 ) ) ( not ( = ?auto_620917 ?auto_620918 ) ) ( not ( = ?auto_620917 ?auto_620919 ) ) ( not ( = ?auto_620917 ?auto_620920 ) ) ( not ( = ?auto_620917 ?auto_620921 ) ) ( not ( = ?auto_620917 ?auto_620922 ) ) ( not ( = ?auto_620917 ?auto_620923 ) ) ( not ( = ?auto_620917 ?auto_620924 ) ) ( not ( = ?auto_620917 ?auto_620925 ) ) ( not ( = ?auto_620917 ?auto_620926 ) ) ( not ( = ?auto_620917 ?auto_620927 ) ) ( not ( = ?auto_620918 ?auto_620919 ) ) ( not ( = ?auto_620918 ?auto_620920 ) ) ( not ( = ?auto_620918 ?auto_620921 ) ) ( not ( = ?auto_620918 ?auto_620922 ) ) ( not ( = ?auto_620918 ?auto_620923 ) ) ( not ( = ?auto_620918 ?auto_620924 ) ) ( not ( = ?auto_620918 ?auto_620925 ) ) ( not ( = ?auto_620918 ?auto_620926 ) ) ( not ( = ?auto_620918 ?auto_620927 ) ) ( not ( = ?auto_620919 ?auto_620920 ) ) ( not ( = ?auto_620919 ?auto_620921 ) ) ( not ( = ?auto_620919 ?auto_620922 ) ) ( not ( = ?auto_620919 ?auto_620923 ) ) ( not ( = ?auto_620919 ?auto_620924 ) ) ( not ( = ?auto_620919 ?auto_620925 ) ) ( not ( = ?auto_620919 ?auto_620926 ) ) ( not ( = ?auto_620919 ?auto_620927 ) ) ( not ( = ?auto_620920 ?auto_620921 ) ) ( not ( = ?auto_620920 ?auto_620922 ) ) ( not ( = ?auto_620920 ?auto_620923 ) ) ( not ( = ?auto_620920 ?auto_620924 ) ) ( not ( = ?auto_620920 ?auto_620925 ) ) ( not ( = ?auto_620920 ?auto_620926 ) ) ( not ( = ?auto_620920 ?auto_620927 ) ) ( not ( = ?auto_620921 ?auto_620922 ) ) ( not ( = ?auto_620921 ?auto_620923 ) ) ( not ( = ?auto_620921 ?auto_620924 ) ) ( not ( = ?auto_620921 ?auto_620925 ) ) ( not ( = ?auto_620921 ?auto_620926 ) ) ( not ( = ?auto_620921 ?auto_620927 ) ) ( not ( = ?auto_620922 ?auto_620923 ) ) ( not ( = ?auto_620922 ?auto_620924 ) ) ( not ( = ?auto_620922 ?auto_620925 ) ) ( not ( = ?auto_620922 ?auto_620926 ) ) ( not ( = ?auto_620922 ?auto_620927 ) ) ( not ( = ?auto_620923 ?auto_620924 ) ) ( not ( = ?auto_620923 ?auto_620925 ) ) ( not ( = ?auto_620923 ?auto_620926 ) ) ( not ( = ?auto_620923 ?auto_620927 ) ) ( not ( = ?auto_620924 ?auto_620925 ) ) ( not ( = ?auto_620924 ?auto_620926 ) ) ( not ( = ?auto_620924 ?auto_620927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_620925 ?auto_620926 ?auto_620927 )
      ( MAKE-11CRATE-VERIFY ?auto_620916 ?auto_620917 ?auto_620918 ?auto_620919 ?auto_620920 ?auto_620921 ?auto_620922 ?auto_620923 ?auto_620924 ?auto_620925 ?auto_620926 ?auto_620927 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621048 - SURFACE
      ?auto_621049 - SURFACE
      ?auto_621050 - SURFACE
      ?auto_621051 - SURFACE
      ?auto_621052 - SURFACE
      ?auto_621053 - SURFACE
      ?auto_621054 - SURFACE
      ?auto_621055 - SURFACE
      ?auto_621056 - SURFACE
      ?auto_621057 - SURFACE
      ?auto_621058 - SURFACE
      ?auto_621059 - SURFACE
    )
    :vars
    (
      ?auto_621064 - HOIST
      ?auto_621062 - PLACE
      ?auto_621060 - TRUCK
      ?auto_621061 - PLACE
      ?auto_621063 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_621064 ?auto_621062 ) ( SURFACE-AT ?auto_621058 ?auto_621062 ) ( CLEAR ?auto_621058 ) ( IS-CRATE ?auto_621059 ) ( not ( = ?auto_621058 ?auto_621059 ) ) ( AVAILABLE ?auto_621064 ) ( ON ?auto_621058 ?auto_621057 ) ( not ( = ?auto_621057 ?auto_621058 ) ) ( not ( = ?auto_621057 ?auto_621059 ) ) ( TRUCK-AT ?auto_621060 ?auto_621061 ) ( not ( = ?auto_621061 ?auto_621062 ) ) ( HOIST-AT ?auto_621063 ?auto_621061 ) ( LIFTING ?auto_621063 ?auto_621059 ) ( not ( = ?auto_621064 ?auto_621063 ) ) ( ON ?auto_621049 ?auto_621048 ) ( ON ?auto_621050 ?auto_621049 ) ( ON ?auto_621051 ?auto_621050 ) ( ON ?auto_621052 ?auto_621051 ) ( ON ?auto_621053 ?auto_621052 ) ( ON ?auto_621054 ?auto_621053 ) ( ON ?auto_621055 ?auto_621054 ) ( ON ?auto_621056 ?auto_621055 ) ( ON ?auto_621057 ?auto_621056 ) ( not ( = ?auto_621048 ?auto_621049 ) ) ( not ( = ?auto_621048 ?auto_621050 ) ) ( not ( = ?auto_621048 ?auto_621051 ) ) ( not ( = ?auto_621048 ?auto_621052 ) ) ( not ( = ?auto_621048 ?auto_621053 ) ) ( not ( = ?auto_621048 ?auto_621054 ) ) ( not ( = ?auto_621048 ?auto_621055 ) ) ( not ( = ?auto_621048 ?auto_621056 ) ) ( not ( = ?auto_621048 ?auto_621057 ) ) ( not ( = ?auto_621048 ?auto_621058 ) ) ( not ( = ?auto_621048 ?auto_621059 ) ) ( not ( = ?auto_621049 ?auto_621050 ) ) ( not ( = ?auto_621049 ?auto_621051 ) ) ( not ( = ?auto_621049 ?auto_621052 ) ) ( not ( = ?auto_621049 ?auto_621053 ) ) ( not ( = ?auto_621049 ?auto_621054 ) ) ( not ( = ?auto_621049 ?auto_621055 ) ) ( not ( = ?auto_621049 ?auto_621056 ) ) ( not ( = ?auto_621049 ?auto_621057 ) ) ( not ( = ?auto_621049 ?auto_621058 ) ) ( not ( = ?auto_621049 ?auto_621059 ) ) ( not ( = ?auto_621050 ?auto_621051 ) ) ( not ( = ?auto_621050 ?auto_621052 ) ) ( not ( = ?auto_621050 ?auto_621053 ) ) ( not ( = ?auto_621050 ?auto_621054 ) ) ( not ( = ?auto_621050 ?auto_621055 ) ) ( not ( = ?auto_621050 ?auto_621056 ) ) ( not ( = ?auto_621050 ?auto_621057 ) ) ( not ( = ?auto_621050 ?auto_621058 ) ) ( not ( = ?auto_621050 ?auto_621059 ) ) ( not ( = ?auto_621051 ?auto_621052 ) ) ( not ( = ?auto_621051 ?auto_621053 ) ) ( not ( = ?auto_621051 ?auto_621054 ) ) ( not ( = ?auto_621051 ?auto_621055 ) ) ( not ( = ?auto_621051 ?auto_621056 ) ) ( not ( = ?auto_621051 ?auto_621057 ) ) ( not ( = ?auto_621051 ?auto_621058 ) ) ( not ( = ?auto_621051 ?auto_621059 ) ) ( not ( = ?auto_621052 ?auto_621053 ) ) ( not ( = ?auto_621052 ?auto_621054 ) ) ( not ( = ?auto_621052 ?auto_621055 ) ) ( not ( = ?auto_621052 ?auto_621056 ) ) ( not ( = ?auto_621052 ?auto_621057 ) ) ( not ( = ?auto_621052 ?auto_621058 ) ) ( not ( = ?auto_621052 ?auto_621059 ) ) ( not ( = ?auto_621053 ?auto_621054 ) ) ( not ( = ?auto_621053 ?auto_621055 ) ) ( not ( = ?auto_621053 ?auto_621056 ) ) ( not ( = ?auto_621053 ?auto_621057 ) ) ( not ( = ?auto_621053 ?auto_621058 ) ) ( not ( = ?auto_621053 ?auto_621059 ) ) ( not ( = ?auto_621054 ?auto_621055 ) ) ( not ( = ?auto_621054 ?auto_621056 ) ) ( not ( = ?auto_621054 ?auto_621057 ) ) ( not ( = ?auto_621054 ?auto_621058 ) ) ( not ( = ?auto_621054 ?auto_621059 ) ) ( not ( = ?auto_621055 ?auto_621056 ) ) ( not ( = ?auto_621055 ?auto_621057 ) ) ( not ( = ?auto_621055 ?auto_621058 ) ) ( not ( = ?auto_621055 ?auto_621059 ) ) ( not ( = ?auto_621056 ?auto_621057 ) ) ( not ( = ?auto_621056 ?auto_621058 ) ) ( not ( = ?auto_621056 ?auto_621059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621057 ?auto_621058 ?auto_621059 )
      ( MAKE-11CRATE-VERIFY ?auto_621048 ?auto_621049 ?auto_621050 ?auto_621051 ?auto_621052 ?auto_621053 ?auto_621054 ?auto_621055 ?auto_621056 ?auto_621057 ?auto_621058 ?auto_621059 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621191 - SURFACE
      ?auto_621192 - SURFACE
      ?auto_621193 - SURFACE
      ?auto_621194 - SURFACE
      ?auto_621195 - SURFACE
      ?auto_621196 - SURFACE
      ?auto_621197 - SURFACE
      ?auto_621198 - SURFACE
      ?auto_621199 - SURFACE
      ?auto_621200 - SURFACE
      ?auto_621201 - SURFACE
      ?auto_621202 - SURFACE
    )
    :vars
    (
      ?auto_621207 - HOIST
      ?auto_621206 - PLACE
      ?auto_621208 - TRUCK
      ?auto_621205 - PLACE
      ?auto_621204 - HOIST
      ?auto_621203 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_621207 ?auto_621206 ) ( SURFACE-AT ?auto_621201 ?auto_621206 ) ( CLEAR ?auto_621201 ) ( IS-CRATE ?auto_621202 ) ( not ( = ?auto_621201 ?auto_621202 ) ) ( AVAILABLE ?auto_621207 ) ( ON ?auto_621201 ?auto_621200 ) ( not ( = ?auto_621200 ?auto_621201 ) ) ( not ( = ?auto_621200 ?auto_621202 ) ) ( TRUCK-AT ?auto_621208 ?auto_621205 ) ( not ( = ?auto_621205 ?auto_621206 ) ) ( HOIST-AT ?auto_621204 ?auto_621205 ) ( not ( = ?auto_621207 ?auto_621204 ) ) ( AVAILABLE ?auto_621204 ) ( SURFACE-AT ?auto_621202 ?auto_621205 ) ( ON ?auto_621202 ?auto_621203 ) ( CLEAR ?auto_621202 ) ( not ( = ?auto_621201 ?auto_621203 ) ) ( not ( = ?auto_621202 ?auto_621203 ) ) ( not ( = ?auto_621200 ?auto_621203 ) ) ( ON ?auto_621192 ?auto_621191 ) ( ON ?auto_621193 ?auto_621192 ) ( ON ?auto_621194 ?auto_621193 ) ( ON ?auto_621195 ?auto_621194 ) ( ON ?auto_621196 ?auto_621195 ) ( ON ?auto_621197 ?auto_621196 ) ( ON ?auto_621198 ?auto_621197 ) ( ON ?auto_621199 ?auto_621198 ) ( ON ?auto_621200 ?auto_621199 ) ( not ( = ?auto_621191 ?auto_621192 ) ) ( not ( = ?auto_621191 ?auto_621193 ) ) ( not ( = ?auto_621191 ?auto_621194 ) ) ( not ( = ?auto_621191 ?auto_621195 ) ) ( not ( = ?auto_621191 ?auto_621196 ) ) ( not ( = ?auto_621191 ?auto_621197 ) ) ( not ( = ?auto_621191 ?auto_621198 ) ) ( not ( = ?auto_621191 ?auto_621199 ) ) ( not ( = ?auto_621191 ?auto_621200 ) ) ( not ( = ?auto_621191 ?auto_621201 ) ) ( not ( = ?auto_621191 ?auto_621202 ) ) ( not ( = ?auto_621191 ?auto_621203 ) ) ( not ( = ?auto_621192 ?auto_621193 ) ) ( not ( = ?auto_621192 ?auto_621194 ) ) ( not ( = ?auto_621192 ?auto_621195 ) ) ( not ( = ?auto_621192 ?auto_621196 ) ) ( not ( = ?auto_621192 ?auto_621197 ) ) ( not ( = ?auto_621192 ?auto_621198 ) ) ( not ( = ?auto_621192 ?auto_621199 ) ) ( not ( = ?auto_621192 ?auto_621200 ) ) ( not ( = ?auto_621192 ?auto_621201 ) ) ( not ( = ?auto_621192 ?auto_621202 ) ) ( not ( = ?auto_621192 ?auto_621203 ) ) ( not ( = ?auto_621193 ?auto_621194 ) ) ( not ( = ?auto_621193 ?auto_621195 ) ) ( not ( = ?auto_621193 ?auto_621196 ) ) ( not ( = ?auto_621193 ?auto_621197 ) ) ( not ( = ?auto_621193 ?auto_621198 ) ) ( not ( = ?auto_621193 ?auto_621199 ) ) ( not ( = ?auto_621193 ?auto_621200 ) ) ( not ( = ?auto_621193 ?auto_621201 ) ) ( not ( = ?auto_621193 ?auto_621202 ) ) ( not ( = ?auto_621193 ?auto_621203 ) ) ( not ( = ?auto_621194 ?auto_621195 ) ) ( not ( = ?auto_621194 ?auto_621196 ) ) ( not ( = ?auto_621194 ?auto_621197 ) ) ( not ( = ?auto_621194 ?auto_621198 ) ) ( not ( = ?auto_621194 ?auto_621199 ) ) ( not ( = ?auto_621194 ?auto_621200 ) ) ( not ( = ?auto_621194 ?auto_621201 ) ) ( not ( = ?auto_621194 ?auto_621202 ) ) ( not ( = ?auto_621194 ?auto_621203 ) ) ( not ( = ?auto_621195 ?auto_621196 ) ) ( not ( = ?auto_621195 ?auto_621197 ) ) ( not ( = ?auto_621195 ?auto_621198 ) ) ( not ( = ?auto_621195 ?auto_621199 ) ) ( not ( = ?auto_621195 ?auto_621200 ) ) ( not ( = ?auto_621195 ?auto_621201 ) ) ( not ( = ?auto_621195 ?auto_621202 ) ) ( not ( = ?auto_621195 ?auto_621203 ) ) ( not ( = ?auto_621196 ?auto_621197 ) ) ( not ( = ?auto_621196 ?auto_621198 ) ) ( not ( = ?auto_621196 ?auto_621199 ) ) ( not ( = ?auto_621196 ?auto_621200 ) ) ( not ( = ?auto_621196 ?auto_621201 ) ) ( not ( = ?auto_621196 ?auto_621202 ) ) ( not ( = ?auto_621196 ?auto_621203 ) ) ( not ( = ?auto_621197 ?auto_621198 ) ) ( not ( = ?auto_621197 ?auto_621199 ) ) ( not ( = ?auto_621197 ?auto_621200 ) ) ( not ( = ?auto_621197 ?auto_621201 ) ) ( not ( = ?auto_621197 ?auto_621202 ) ) ( not ( = ?auto_621197 ?auto_621203 ) ) ( not ( = ?auto_621198 ?auto_621199 ) ) ( not ( = ?auto_621198 ?auto_621200 ) ) ( not ( = ?auto_621198 ?auto_621201 ) ) ( not ( = ?auto_621198 ?auto_621202 ) ) ( not ( = ?auto_621198 ?auto_621203 ) ) ( not ( = ?auto_621199 ?auto_621200 ) ) ( not ( = ?auto_621199 ?auto_621201 ) ) ( not ( = ?auto_621199 ?auto_621202 ) ) ( not ( = ?auto_621199 ?auto_621203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621200 ?auto_621201 ?auto_621202 )
      ( MAKE-11CRATE-VERIFY ?auto_621191 ?auto_621192 ?auto_621193 ?auto_621194 ?auto_621195 ?auto_621196 ?auto_621197 ?auto_621198 ?auto_621199 ?auto_621200 ?auto_621201 ?auto_621202 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621335 - SURFACE
      ?auto_621336 - SURFACE
      ?auto_621337 - SURFACE
      ?auto_621338 - SURFACE
      ?auto_621339 - SURFACE
      ?auto_621340 - SURFACE
      ?auto_621341 - SURFACE
      ?auto_621342 - SURFACE
      ?auto_621343 - SURFACE
      ?auto_621344 - SURFACE
      ?auto_621345 - SURFACE
      ?auto_621346 - SURFACE
    )
    :vars
    (
      ?auto_621348 - HOIST
      ?auto_621347 - PLACE
      ?auto_621351 - PLACE
      ?auto_621350 - HOIST
      ?auto_621352 - SURFACE
      ?auto_621349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621348 ?auto_621347 ) ( SURFACE-AT ?auto_621345 ?auto_621347 ) ( CLEAR ?auto_621345 ) ( IS-CRATE ?auto_621346 ) ( not ( = ?auto_621345 ?auto_621346 ) ) ( AVAILABLE ?auto_621348 ) ( ON ?auto_621345 ?auto_621344 ) ( not ( = ?auto_621344 ?auto_621345 ) ) ( not ( = ?auto_621344 ?auto_621346 ) ) ( not ( = ?auto_621351 ?auto_621347 ) ) ( HOIST-AT ?auto_621350 ?auto_621351 ) ( not ( = ?auto_621348 ?auto_621350 ) ) ( AVAILABLE ?auto_621350 ) ( SURFACE-AT ?auto_621346 ?auto_621351 ) ( ON ?auto_621346 ?auto_621352 ) ( CLEAR ?auto_621346 ) ( not ( = ?auto_621345 ?auto_621352 ) ) ( not ( = ?auto_621346 ?auto_621352 ) ) ( not ( = ?auto_621344 ?auto_621352 ) ) ( TRUCK-AT ?auto_621349 ?auto_621347 ) ( ON ?auto_621336 ?auto_621335 ) ( ON ?auto_621337 ?auto_621336 ) ( ON ?auto_621338 ?auto_621337 ) ( ON ?auto_621339 ?auto_621338 ) ( ON ?auto_621340 ?auto_621339 ) ( ON ?auto_621341 ?auto_621340 ) ( ON ?auto_621342 ?auto_621341 ) ( ON ?auto_621343 ?auto_621342 ) ( ON ?auto_621344 ?auto_621343 ) ( not ( = ?auto_621335 ?auto_621336 ) ) ( not ( = ?auto_621335 ?auto_621337 ) ) ( not ( = ?auto_621335 ?auto_621338 ) ) ( not ( = ?auto_621335 ?auto_621339 ) ) ( not ( = ?auto_621335 ?auto_621340 ) ) ( not ( = ?auto_621335 ?auto_621341 ) ) ( not ( = ?auto_621335 ?auto_621342 ) ) ( not ( = ?auto_621335 ?auto_621343 ) ) ( not ( = ?auto_621335 ?auto_621344 ) ) ( not ( = ?auto_621335 ?auto_621345 ) ) ( not ( = ?auto_621335 ?auto_621346 ) ) ( not ( = ?auto_621335 ?auto_621352 ) ) ( not ( = ?auto_621336 ?auto_621337 ) ) ( not ( = ?auto_621336 ?auto_621338 ) ) ( not ( = ?auto_621336 ?auto_621339 ) ) ( not ( = ?auto_621336 ?auto_621340 ) ) ( not ( = ?auto_621336 ?auto_621341 ) ) ( not ( = ?auto_621336 ?auto_621342 ) ) ( not ( = ?auto_621336 ?auto_621343 ) ) ( not ( = ?auto_621336 ?auto_621344 ) ) ( not ( = ?auto_621336 ?auto_621345 ) ) ( not ( = ?auto_621336 ?auto_621346 ) ) ( not ( = ?auto_621336 ?auto_621352 ) ) ( not ( = ?auto_621337 ?auto_621338 ) ) ( not ( = ?auto_621337 ?auto_621339 ) ) ( not ( = ?auto_621337 ?auto_621340 ) ) ( not ( = ?auto_621337 ?auto_621341 ) ) ( not ( = ?auto_621337 ?auto_621342 ) ) ( not ( = ?auto_621337 ?auto_621343 ) ) ( not ( = ?auto_621337 ?auto_621344 ) ) ( not ( = ?auto_621337 ?auto_621345 ) ) ( not ( = ?auto_621337 ?auto_621346 ) ) ( not ( = ?auto_621337 ?auto_621352 ) ) ( not ( = ?auto_621338 ?auto_621339 ) ) ( not ( = ?auto_621338 ?auto_621340 ) ) ( not ( = ?auto_621338 ?auto_621341 ) ) ( not ( = ?auto_621338 ?auto_621342 ) ) ( not ( = ?auto_621338 ?auto_621343 ) ) ( not ( = ?auto_621338 ?auto_621344 ) ) ( not ( = ?auto_621338 ?auto_621345 ) ) ( not ( = ?auto_621338 ?auto_621346 ) ) ( not ( = ?auto_621338 ?auto_621352 ) ) ( not ( = ?auto_621339 ?auto_621340 ) ) ( not ( = ?auto_621339 ?auto_621341 ) ) ( not ( = ?auto_621339 ?auto_621342 ) ) ( not ( = ?auto_621339 ?auto_621343 ) ) ( not ( = ?auto_621339 ?auto_621344 ) ) ( not ( = ?auto_621339 ?auto_621345 ) ) ( not ( = ?auto_621339 ?auto_621346 ) ) ( not ( = ?auto_621339 ?auto_621352 ) ) ( not ( = ?auto_621340 ?auto_621341 ) ) ( not ( = ?auto_621340 ?auto_621342 ) ) ( not ( = ?auto_621340 ?auto_621343 ) ) ( not ( = ?auto_621340 ?auto_621344 ) ) ( not ( = ?auto_621340 ?auto_621345 ) ) ( not ( = ?auto_621340 ?auto_621346 ) ) ( not ( = ?auto_621340 ?auto_621352 ) ) ( not ( = ?auto_621341 ?auto_621342 ) ) ( not ( = ?auto_621341 ?auto_621343 ) ) ( not ( = ?auto_621341 ?auto_621344 ) ) ( not ( = ?auto_621341 ?auto_621345 ) ) ( not ( = ?auto_621341 ?auto_621346 ) ) ( not ( = ?auto_621341 ?auto_621352 ) ) ( not ( = ?auto_621342 ?auto_621343 ) ) ( not ( = ?auto_621342 ?auto_621344 ) ) ( not ( = ?auto_621342 ?auto_621345 ) ) ( not ( = ?auto_621342 ?auto_621346 ) ) ( not ( = ?auto_621342 ?auto_621352 ) ) ( not ( = ?auto_621343 ?auto_621344 ) ) ( not ( = ?auto_621343 ?auto_621345 ) ) ( not ( = ?auto_621343 ?auto_621346 ) ) ( not ( = ?auto_621343 ?auto_621352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621344 ?auto_621345 ?auto_621346 )
      ( MAKE-11CRATE-VERIFY ?auto_621335 ?auto_621336 ?auto_621337 ?auto_621338 ?auto_621339 ?auto_621340 ?auto_621341 ?auto_621342 ?auto_621343 ?auto_621344 ?auto_621345 ?auto_621346 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621479 - SURFACE
      ?auto_621480 - SURFACE
      ?auto_621481 - SURFACE
      ?auto_621482 - SURFACE
      ?auto_621483 - SURFACE
      ?auto_621484 - SURFACE
      ?auto_621485 - SURFACE
      ?auto_621486 - SURFACE
      ?auto_621487 - SURFACE
      ?auto_621488 - SURFACE
      ?auto_621489 - SURFACE
      ?auto_621490 - SURFACE
    )
    :vars
    (
      ?auto_621496 - HOIST
      ?auto_621491 - PLACE
      ?auto_621493 - PLACE
      ?auto_621495 - HOIST
      ?auto_621494 - SURFACE
      ?auto_621492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621496 ?auto_621491 ) ( IS-CRATE ?auto_621490 ) ( not ( = ?auto_621489 ?auto_621490 ) ) ( not ( = ?auto_621488 ?auto_621489 ) ) ( not ( = ?auto_621488 ?auto_621490 ) ) ( not ( = ?auto_621493 ?auto_621491 ) ) ( HOIST-AT ?auto_621495 ?auto_621493 ) ( not ( = ?auto_621496 ?auto_621495 ) ) ( AVAILABLE ?auto_621495 ) ( SURFACE-AT ?auto_621490 ?auto_621493 ) ( ON ?auto_621490 ?auto_621494 ) ( CLEAR ?auto_621490 ) ( not ( = ?auto_621489 ?auto_621494 ) ) ( not ( = ?auto_621490 ?auto_621494 ) ) ( not ( = ?auto_621488 ?auto_621494 ) ) ( TRUCK-AT ?auto_621492 ?auto_621491 ) ( SURFACE-AT ?auto_621488 ?auto_621491 ) ( CLEAR ?auto_621488 ) ( LIFTING ?auto_621496 ?auto_621489 ) ( IS-CRATE ?auto_621489 ) ( ON ?auto_621480 ?auto_621479 ) ( ON ?auto_621481 ?auto_621480 ) ( ON ?auto_621482 ?auto_621481 ) ( ON ?auto_621483 ?auto_621482 ) ( ON ?auto_621484 ?auto_621483 ) ( ON ?auto_621485 ?auto_621484 ) ( ON ?auto_621486 ?auto_621485 ) ( ON ?auto_621487 ?auto_621486 ) ( ON ?auto_621488 ?auto_621487 ) ( not ( = ?auto_621479 ?auto_621480 ) ) ( not ( = ?auto_621479 ?auto_621481 ) ) ( not ( = ?auto_621479 ?auto_621482 ) ) ( not ( = ?auto_621479 ?auto_621483 ) ) ( not ( = ?auto_621479 ?auto_621484 ) ) ( not ( = ?auto_621479 ?auto_621485 ) ) ( not ( = ?auto_621479 ?auto_621486 ) ) ( not ( = ?auto_621479 ?auto_621487 ) ) ( not ( = ?auto_621479 ?auto_621488 ) ) ( not ( = ?auto_621479 ?auto_621489 ) ) ( not ( = ?auto_621479 ?auto_621490 ) ) ( not ( = ?auto_621479 ?auto_621494 ) ) ( not ( = ?auto_621480 ?auto_621481 ) ) ( not ( = ?auto_621480 ?auto_621482 ) ) ( not ( = ?auto_621480 ?auto_621483 ) ) ( not ( = ?auto_621480 ?auto_621484 ) ) ( not ( = ?auto_621480 ?auto_621485 ) ) ( not ( = ?auto_621480 ?auto_621486 ) ) ( not ( = ?auto_621480 ?auto_621487 ) ) ( not ( = ?auto_621480 ?auto_621488 ) ) ( not ( = ?auto_621480 ?auto_621489 ) ) ( not ( = ?auto_621480 ?auto_621490 ) ) ( not ( = ?auto_621480 ?auto_621494 ) ) ( not ( = ?auto_621481 ?auto_621482 ) ) ( not ( = ?auto_621481 ?auto_621483 ) ) ( not ( = ?auto_621481 ?auto_621484 ) ) ( not ( = ?auto_621481 ?auto_621485 ) ) ( not ( = ?auto_621481 ?auto_621486 ) ) ( not ( = ?auto_621481 ?auto_621487 ) ) ( not ( = ?auto_621481 ?auto_621488 ) ) ( not ( = ?auto_621481 ?auto_621489 ) ) ( not ( = ?auto_621481 ?auto_621490 ) ) ( not ( = ?auto_621481 ?auto_621494 ) ) ( not ( = ?auto_621482 ?auto_621483 ) ) ( not ( = ?auto_621482 ?auto_621484 ) ) ( not ( = ?auto_621482 ?auto_621485 ) ) ( not ( = ?auto_621482 ?auto_621486 ) ) ( not ( = ?auto_621482 ?auto_621487 ) ) ( not ( = ?auto_621482 ?auto_621488 ) ) ( not ( = ?auto_621482 ?auto_621489 ) ) ( not ( = ?auto_621482 ?auto_621490 ) ) ( not ( = ?auto_621482 ?auto_621494 ) ) ( not ( = ?auto_621483 ?auto_621484 ) ) ( not ( = ?auto_621483 ?auto_621485 ) ) ( not ( = ?auto_621483 ?auto_621486 ) ) ( not ( = ?auto_621483 ?auto_621487 ) ) ( not ( = ?auto_621483 ?auto_621488 ) ) ( not ( = ?auto_621483 ?auto_621489 ) ) ( not ( = ?auto_621483 ?auto_621490 ) ) ( not ( = ?auto_621483 ?auto_621494 ) ) ( not ( = ?auto_621484 ?auto_621485 ) ) ( not ( = ?auto_621484 ?auto_621486 ) ) ( not ( = ?auto_621484 ?auto_621487 ) ) ( not ( = ?auto_621484 ?auto_621488 ) ) ( not ( = ?auto_621484 ?auto_621489 ) ) ( not ( = ?auto_621484 ?auto_621490 ) ) ( not ( = ?auto_621484 ?auto_621494 ) ) ( not ( = ?auto_621485 ?auto_621486 ) ) ( not ( = ?auto_621485 ?auto_621487 ) ) ( not ( = ?auto_621485 ?auto_621488 ) ) ( not ( = ?auto_621485 ?auto_621489 ) ) ( not ( = ?auto_621485 ?auto_621490 ) ) ( not ( = ?auto_621485 ?auto_621494 ) ) ( not ( = ?auto_621486 ?auto_621487 ) ) ( not ( = ?auto_621486 ?auto_621488 ) ) ( not ( = ?auto_621486 ?auto_621489 ) ) ( not ( = ?auto_621486 ?auto_621490 ) ) ( not ( = ?auto_621486 ?auto_621494 ) ) ( not ( = ?auto_621487 ?auto_621488 ) ) ( not ( = ?auto_621487 ?auto_621489 ) ) ( not ( = ?auto_621487 ?auto_621490 ) ) ( not ( = ?auto_621487 ?auto_621494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621488 ?auto_621489 ?auto_621490 )
      ( MAKE-11CRATE-VERIFY ?auto_621479 ?auto_621480 ?auto_621481 ?auto_621482 ?auto_621483 ?auto_621484 ?auto_621485 ?auto_621486 ?auto_621487 ?auto_621488 ?auto_621489 ?auto_621490 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_621623 - SURFACE
      ?auto_621624 - SURFACE
      ?auto_621625 - SURFACE
      ?auto_621626 - SURFACE
      ?auto_621627 - SURFACE
      ?auto_621628 - SURFACE
      ?auto_621629 - SURFACE
      ?auto_621630 - SURFACE
      ?auto_621631 - SURFACE
      ?auto_621632 - SURFACE
      ?auto_621633 - SURFACE
      ?auto_621634 - SURFACE
    )
    :vars
    (
      ?auto_621638 - HOIST
      ?auto_621637 - PLACE
      ?auto_621639 - PLACE
      ?auto_621640 - HOIST
      ?auto_621636 - SURFACE
      ?auto_621635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_621638 ?auto_621637 ) ( IS-CRATE ?auto_621634 ) ( not ( = ?auto_621633 ?auto_621634 ) ) ( not ( = ?auto_621632 ?auto_621633 ) ) ( not ( = ?auto_621632 ?auto_621634 ) ) ( not ( = ?auto_621639 ?auto_621637 ) ) ( HOIST-AT ?auto_621640 ?auto_621639 ) ( not ( = ?auto_621638 ?auto_621640 ) ) ( AVAILABLE ?auto_621640 ) ( SURFACE-AT ?auto_621634 ?auto_621639 ) ( ON ?auto_621634 ?auto_621636 ) ( CLEAR ?auto_621634 ) ( not ( = ?auto_621633 ?auto_621636 ) ) ( not ( = ?auto_621634 ?auto_621636 ) ) ( not ( = ?auto_621632 ?auto_621636 ) ) ( TRUCK-AT ?auto_621635 ?auto_621637 ) ( SURFACE-AT ?auto_621632 ?auto_621637 ) ( CLEAR ?auto_621632 ) ( IS-CRATE ?auto_621633 ) ( AVAILABLE ?auto_621638 ) ( IN ?auto_621633 ?auto_621635 ) ( ON ?auto_621624 ?auto_621623 ) ( ON ?auto_621625 ?auto_621624 ) ( ON ?auto_621626 ?auto_621625 ) ( ON ?auto_621627 ?auto_621626 ) ( ON ?auto_621628 ?auto_621627 ) ( ON ?auto_621629 ?auto_621628 ) ( ON ?auto_621630 ?auto_621629 ) ( ON ?auto_621631 ?auto_621630 ) ( ON ?auto_621632 ?auto_621631 ) ( not ( = ?auto_621623 ?auto_621624 ) ) ( not ( = ?auto_621623 ?auto_621625 ) ) ( not ( = ?auto_621623 ?auto_621626 ) ) ( not ( = ?auto_621623 ?auto_621627 ) ) ( not ( = ?auto_621623 ?auto_621628 ) ) ( not ( = ?auto_621623 ?auto_621629 ) ) ( not ( = ?auto_621623 ?auto_621630 ) ) ( not ( = ?auto_621623 ?auto_621631 ) ) ( not ( = ?auto_621623 ?auto_621632 ) ) ( not ( = ?auto_621623 ?auto_621633 ) ) ( not ( = ?auto_621623 ?auto_621634 ) ) ( not ( = ?auto_621623 ?auto_621636 ) ) ( not ( = ?auto_621624 ?auto_621625 ) ) ( not ( = ?auto_621624 ?auto_621626 ) ) ( not ( = ?auto_621624 ?auto_621627 ) ) ( not ( = ?auto_621624 ?auto_621628 ) ) ( not ( = ?auto_621624 ?auto_621629 ) ) ( not ( = ?auto_621624 ?auto_621630 ) ) ( not ( = ?auto_621624 ?auto_621631 ) ) ( not ( = ?auto_621624 ?auto_621632 ) ) ( not ( = ?auto_621624 ?auto_621633 ) ) ( not ( = ?auto_621624 ?auto_621634 ) ) ( not ( = ?auto_621624 ?auto_621636 ) ) ( not ( = ?auto_621625 ?auto_621626 ) ) ( not ( = ?auto_621625 ?auto_621627 ) ) ( not ( = ?auto_621625 ?auto_621628 ) ) ( not ( = ?auto_621625 ?auto_621629 ) ) ( not ( = ?auto_621625 ?auto_621630 ) ) ( not ( = ?auto_621625 ?auto_621631 ) ) ( not ( = ?auto_621625 ?auto_621632 ) ) ( not ( = ?auto_621625 ?auto_621633 ) ) ( not ( = ?auto_621625 ?auto_621634 ) ) ( not ( = ?auto_621625 ?auto_621636 ) ) ( not ( = ?auto_621626 ?auto_621627 ) ) ( not ( = ?auto_621626 ?auto_621628 ) ) ( not ( = ?auto_621626 ?auto_621629 ) ) ( not ( = ?auto_621626 ?auto_621630 ) ) ( not ( = ?auto_621626 ?auto_621631 ) ) ( not ( = ?auto_621626 ?auto_621632 ) ) ( not ( = ?auto_621626 ?auto_621633 ) ) ( not ( = ?auto_621626 ?auto_621634 ) ) ( not ( = ?auto_621626 ?auto_621636 ) ) ( not ( = ?auto_621627 ?auto_621628 ) ) ( not ( = ?auto_621627 ?auto_621629 ) ) ( not ( = ?auto_621627 ?auto_621630 ) ) ( not ( = ?auto_621627 ?auto_621631 ) ) ( not ( = ?auto_621627 ?auto_621632 ) ) ( not ( = ?auto_621627 ?auto_621633 ) ) ( not ( = ?auto_621627 ?auto_621634 ) ) ( not ( = ?auto_621627 ?auto_621636 ) ) ( not ( = ?auto_621628 ?auto_621629 ) ) ( not ( = ?auto_621628 ?auto_621630 ) ) ( not ( = ?auto_621628 ?auto_621631 ) ) ( not ( = ?auto_621628 ?auto_621632 ) ) ( not ( = ?auto_621628 ?auto_621633 ) ) ( not ( = ?auto_621628 ?auto_621634 ) ) ( not ( = ?auto_621628 ?auto_621636 ) ) ( not ( = ?auto_621629 ?auto_621630 ) ) ( not ( = ?auto_621629 ?auto_621631 ) ) ( not ( = ?auto_621629 ?auto_621632 ) ) ( not ( = ?auto_621629 ?auto_621633 ) ) ( not ( = ?auto_621629 ?auto_621634 ) ) ( not ( = ?auto_621629 ?auto_621636 ) ) ( not ( = ?auto_621630 ?auto_621631 ) ) ( not ( = ?auto_621630 ?auto_621632 ) ) ( not ( = ?auto_621630 ?auto_621633 ) ) ( not ( = ?auto_621630 ?auto_621634 ) ) ( not ( = ?auto_621630 ?auto_621636 ) ) ( not ( = ?auto_621631 ?auto_621632 ) ) ( not ( = ?auto_621631 ?auto_621633 ) ) ( not ( = ?auto_621631 ?auto_621634 ) ) ( not ( = ?auto_621631 ?auto_621636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_621632 ?auto_621633 ?auto_621634 )
      ( MAKE-11CRATE-VERIFY ?auto_621623 ?auto_621624 ?auto_621625 ?auto_621626 ?auto_621627 ?auto_621628 ?auto_621629 ?auto_621630 ?auto_621631 ?auto_621632 ?auto_621633 ?auto_621634 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630865 - SURFACE
      ?auto_630866 - SURFACE
      ?auto_630867 - SURFACE
      ?auto_630868 - SURFACE
      ?auto_630869 - SURFACE
      ?auto_630870 - SURFACE
      ?auto_630871 - SURFACE
      ?auto_630872 - SURFACE
      ?auto_630873 - SURFACE
      ?auto_630874 - SURFACE
      ?auto_630875 - SURFACE
      ?auto_630876 - SURFACE
      ?auto_630877 - SURFACE
    )
    :vars
    (
      ?auto_630878 - HOIST
      ?auto_630879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_630878 ?auto_630879 ) ( SURFACE-AT ?auto_630876 ?auto_630879 ) ( CLEAR ?auto_630876 ) ( LIFTING ?auto_630878 ?auto_630877 ) ( IS-CRATE ?auto_630877 ) ( not ( = ?auto_630876 ?auto_630877 ) ) ( ON ?auto_630866 ?auto_630865 ) ( ON ?auto_630867 ?auto_630866 ) ( ON ?auto_630868 ?auto_630867 ) ( ON ?auto_630869 ?auto_630868 ) ( ON ?auto_630870 ?auto_630869 ) ( ON ?auto_630871 ?auto_630870 ) ( ON ?auto_630872 ?auto_630871 ) ( ON ?auto_630873 ?auto_630872 ) ( ON ?auto_630874 ?auto_630873 ) ( ON ?auto_630875 ?auto_630874 ) ( ON ?auto_630876 ?auto_630875 ) ( not ( = ?auto_630865 ?auto_630866 ) ) ( not ( = ?auto_630865 ?auto_630867 ) ) ( not ( = ?auto_630865 ?auto_630868 ) ) ( not ( = ?auto_630865 ?auto_630869 ) ) ( not ( = ?auto_630865 ?auto_630870 ) ) ( not ( = ?auto_630865 ?auto_630871 ) ) ( not ( = ?auto_630865 ?auto_630872 ) ) ( not ( = ?auto_630865 ?auto_630873 ) ) ( not ( = ?auto_630865 ?auto_630874 ) ) ( not ( = ?auto_630865 ?auto_630875 ) ) ( not ( = ?auto_630865 ?auto_630876 ) ) ( not ( = ?auto_630865 ?auto_630877 ) ) ( not ( = ?auto_630866 ?auto_630867 ) ) ( not ( = ?auto_630866 ?auto_630868 ) ) ( not ( = ?auto_630866 ?auto_630869 ) ) ( not ( = ?auto_630866 ?auto_630870 ) ) ( not ( = ?auto_630866 ?auto_630871 ) ) ( not ( = ?auto_630866 ?auto_630872 ) ) ( not ( = ?auto_630866 ?auto_630873 ) ) ( not ( = ?auto_630866 ?auto_630874 ) ) ( not ( = ?auto_630866 ?auto_630875 ) ) ( not ( = ?auto_630866 ?auto_630876 ) ) ( not ( = ?auto_630866 ?auto_630877 ) ) ( not ( = ?auto_630867 ?auto_630868 ) ) ( not ( = ?auto_630867 ?auto_630869 ) ) ( not ( = ?auto_630867 ?auto_630870 ) ) ( not ( = ?auto_630867 ?auto_630871 ) ) ( not ( = ?auto_630867 ?auto_630872 ) ) ( not ( = ?auto_630867 ?auto_630873 ) ) ( not ( = ?auto_630867 ?auto_630874 ) ) ( not ( = ?auto_630867 ?auto_630875 ) ) ( not ( = ?auto_630867 ?auto_630876 ) ) ( not ( = ?auto_630867 ?auto_630877 ) ) ( not ( = ?auto_630868 ?auto_630869 ) ) ( not ( = ?auto_630868 ?auto_630870 ) ) ( not ( = ?auto_630868 ?auto_630871 ) ) ( not ( = ?auto_630868 ?auto_630872 ) ) ( not ( = ?auto_630868 ?auto_630873 ) ) ( not ( = ?auto_630868 ?auto_630874 ) ) ( not ( = ?auto_630868 ?auto_630875 ) ) ( not ( = ?auto_630868 ?auto_630876 ) ) ( not ( = ?auto_630868 ?auto_630877 ) ) ( not ( = ?auto_630869 ?auto_630870 ) ) ( not ( = ?auto_630869 ?auto_630871 ) ) ( not ( = ?auto_630869 ?auto_630872 ) ) ( not ( = ?auto_630869 ?auto_630873 ) ) ( not ( = ?auto_630869 ?auto_630874 ) ) ( not ( = ?auto_630869 ?auto_630875 ) ) ( not ( = ?auto_630869 ?auto_630876 ) ) ( not ( = ?auto_630869 ?auto_630877 ) ) ( not ( = ?auto_630870 ?auto_630871 ) ) ( not ( = ?auto_630870 ?auto_630872 ) ) ( not ( = ?auto_630870 ?auto_630873 ) ) ( not ( = ?auto_630870 ?auto_630874 ) ) ( not ( = ?auto_630870 ?auto_630875 ) ) ( not ( = ?auto_630870 ?auto_630876 ) ) ( not ( = ?auto_630870 ?auto_630877 ) ) ( not ( = ?auto_630871 ?auto_630872 ) ) ( not ( = ?auto_630871 ?auto_630873 ) ) ( not ( = ?auto_630871 ?auto_630874 ) ) ( not ( = ?auto_630871 ?auto_630875 ) ) ( not ( = ?auto_630871 ?auto_630876 ) ) ( not ( = ?auto_630871 ?auto_630877 ) ) ( not ( = ?auto_630872 ?auto_630873 ) ) ( not ( = ?auto_630872 ?auto_630874 ) ) ( not ( = ?auto_630872 ?auto_630875 ) ) ( not ( = ?auto_630872 ?auto_630876 ) ) ( not ( = ?auto_630872 ?auto_630877 ) ) ( not ( = ?auto_630873 ?auto_630874 ) ) ( not ( = ?auto_630873 ?auto_630875 ) ) ( not ( = ?auto_630873 ?auto_630876 ) ) ( not ( = ?auto_630873 ?auto_630877 ) ) ( not ( = ?auto_630874 ?auto_630875 ) ) ( not ( = ?auto_630874 ?auto_630876 ) ) ( not ( = ?auto_630874 ?auto_630877 ) ) ( not ( = ?auto_630875 ?auto_630876 ) ) ( not ( = ?auto_630875 ?auto_630877 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_630876 ?auto_630877 )
      ( MAKE-12CRATE-VERIFY ?auto_630865 ?auto_630866 ?auto_630867 ?auto_630868 ?auto_630869 ?auto_630870 ?auto_630871 ?auto_630872 ?auto_630873 ?auto_630874 ?auto_630875 ?auto_630876 ?auto_630877 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_630990 - SURFACE
      ?auto_630991 - SURFACE
      ?auto_630992 - SURFACE
      ?auto_630993 - SURFACE
      ?auto_630994 - SURFACE
      ?auto_630995 - SURFACE
      ?auto_630996 - SURFACE
      ?auto_630997 - SURFACE
      ?auto_630998 - SURFACE
      ?auto_630999 - SURFACE
      ?auto_631000 - SURFACE
      ?auto_631001 - SURFACE
      ?auto_631002 - SURFACE
    )
    :vars
    (
      ?auto_631003 - HOIST
      ?auto_631005 - PLACE
      ?auto_631004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631003 ?auto_631005 ) ( SURFACE-AT ?auto_631001 ?auto_631005 ) ( CLEAR ?auto_631001 ) ( IS-CRATE ?auto_631002 ) ( not ( = ?auto_631001 ?auto_631002 ) ) ( TRUCK-AT ?auto_631004 ?auto_631005 ) ( AVAILABLE ?auto_631003 ) ( IN ?auto_631002 ?auto_631004 ) ( ON ?auto_631001 ?auto_631000 ) ( not ( = ?auto_631000 ?auto_631001 ) ) ( not ( = ?auto_631000 ?auto_631002 ) ) ( ON ?auto_630991 ?auto_630990 ) ( ON ?auto_630992 ?auto_630991 ) ( ON ?auto_630993 ?auto_630992 ) ( ON ?auto_630994 ?auto_630993 ) ( ON ?auto_630995 ?auto_630994 ) ( ON ?auto_630996 ?auto_630995 ) ( ON ?auto_630997 ?auto_630996 ) ( ON ?auto_630998 ?auto_630997 ) ( ON ?auto_630999 ?auto_630998 ) ( ON ?auto_631000 ?auto_630999 ) ( not ( = ?auto_630990 ?auto_630991 ) ) ( not ( = ?auto_630990 ?auto_630992 ) ) ( not ( = ?auto_630990 ?auto_630993 ) ) ( not ( = ?auto_630990 ?auto_630994 ) ) ( not ( = ?auto_630990 ?auto_630995 ) ) ( not ( = ?auto_630990 ?auto_630996 ) ) ( not ( = ?auto_630990 ?auto_630997 ) ) ( not ( = ?auto_630990 ?auto_630998 ) ) ( not ( = ?auto_630990 ?auto_630999 ) ) ( not ( = ?auto_630990 ?auto_631000 ) ) ( not ( = ?auto_630990 ?auto_631001 ) ) ( not ( = ?auto_630990 ?auto_631002 ) ) ( not ( = ?auto_630991 ?auto_630992 ) ) ( not ( = ?auto_630991 ?auto_630993 ) ) ( not ( = ?auto_630991 ?auto_630994 ) ) ( not ( = ?auto_630991 ?auto_630995 ) ) ( not ( = ?auto_630991 ?auto_630996 ) ) ( not ( = ?auto_630991 ?auto_630997 ) ) ( not ( = ?auto_630991 ?auto_630998 ) ) ( not ( = ?auto_630991 ?auto_630999 ) ) ( not ( = ?auto_630991 ?auto_631000 ) ) ( not ( = ?auto_630991 ?auto_631001 ) ) ( not ( = ?auto_630991 ?auto_631002 ) ) ( not ( = ?auto_630992 ?auto_630993 ) ) ( not ( = ?auto_630992 ?auto_630994 ) ) ( not ( = ?auto_630992 ?auto_630995 ) ) ( not ( = ?auto_630992 ?auto_630996 ) ) ( not ( = ?auto_630992 ?auto_630997 ) ) ( not ( = ?auto_630992 ?auto_630998 ) ) ( not ( = ?auto_630992 ?auto_630999 ) ) ( not ( = ?auto_630992 ?auto_631000 ) ) ( not ( = ?auto_630992 ?auto_631001 ) ) ( not ( = ?auto_630992 ?auto_631002 ) ) ( not ( = ?auto_630993 ?auto_630994 ) ) ( not ( = ?auto_630993 ?auto_630995 ) ) ( not ( = ?auto_630993 ?auto_630996 ) ) ( not ( = ?auto_630993 ?auto_630997 ) ) ( not ( = ?auto_630993 ?auto_630998 ) ) ( not ( = ?auto_630993 ?auto_630999 ) ) ( not ( = ?auto_630993 ?auto_631000 ) ) ( not ( = ?auto_630993 ?auto_631001 ) ) ( not ( = ?auto_630993 ?auto_631002 ) ) ( not ( = ?auto_630994 ?auto_630995 ) ) ( not ( = ?auto_630994 ?auto_630996 ) ) ( not ( = ?auto_630994 ?auto_630997 ) ) ( not ( = ?auto_630994 ?auto_630998 ) ) ( not ( = ?auto_630994 ?auto_630999 ) ) ( not ( = ?auto_630994 ?auto_631000 ) ) ( not ( = ?auto_630994 ?auto_631001 ) ) ( not ( = ?auto_630994 ?auto_631002 ) ) ( not ( = ?auto_630995 ?auto_630996 ) ) ( not ( = ?auto_630995 ?auto_630997 ) ) ( not ( = ?auto_630995 ?auto_630998 ) ) ( not ( = ?auto_630995 ?auto_630999 ) ) ( not ( = ?auto_630995 ?auto_631000 ) ) ( not ( = ?auto_630995 ?auto_631001 ) ) ( not ( = ?auto_630995 ?auto_631002 ) ) ( not ( = ?auto_630996 ?auto_630997 ) ) ( not ( = ?auto_630996 ?auto_630998 ) ) ( not ( = ?auto_630996 ?auto_630999 ) ) ( not ( = ?auto_630996 ?auto_631000 ) ) ( not ( = ?auto_630996 ?auto_631001 ) ) ( not ( = ?auto_630996 ?auto_631002 ) ) ( not ( = ?auto_630997 ?auto_630998 ) ) ( not ( = ?auto_630997 ?auto_630999 ) ) ( not ( = ?auto_630997 ?auto_631000 ) ) ( not ( = ?auto_630997 ?auto_631001 ) ) ( not ( = ?auto_630997 ?auto_631002 ) ) ( not ( = ?auto_630998 ?auto_630999 ) ) ( not ( = ?auto_630998 ?auto_631000 ) ) ( not ( = ?auto_630998 ?auto_631001 ) ) ( not ( = ?auto_630998 ?auto_631002 ) ) ( not ( = ?auto_630999 ?auto_631000 ) ) ( not ( = ?auto_630999 ?auto_631001 ) ) ( not ( = ?auto_630999 ?auto_631002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631000 ?auto_631001 ?auto_631002 )
      ( MAKE-12CRATE-VERIFY ?auto_630990 ?auto_630991 ?auto_630992 ?auto_630993 ?auto_630994 ?auto_630995 ?auto_630996 ?auto_630997 ?auto_630998 ?auto_630999 ?auto_631000 ?auto_631001 ?auto_631002 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631128 - SURFACE
      ?auto_631129 - SURFACE
      ?auto_631130 - SURFACE
      ?auto_631131 - SURFACE
      ?auto_631132 - SURFACE
      ?auto_631133 - SURFACE
      ?auto_631134 - SURFACE
      ?auto_631135 - SURFACE
      ?auto_631136 - SURFACE
      ?auto_631137 - SURFACE
      ?auto_631138 - SURFACE
      ?auto_631139 - SURFACE
      ?auto_631140 - SURFACE
    )
    :vars
    (
      ?auto_631144 - HOIST
      ?auto_631142 - PLACE
      ?auto_631141 - TRUCK
      ?auto_631143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631144 ?auto_631142 ) ( SURFACE-AT ?auto_631139 ?auto_631142 ) ( CLEAR ?auto_631139 ) ( IS-CRATE ?auto_631140 ) ( not ( = ?auto_631139 ?auto_631140 ) ) ( AVAILABLE ?auto_631144 ) ( IN ?auto_631140 ?auto_631141 ) ( ON ?auto_631139 ?auto_631138 ) ( not ( = ?auto_631138 ?auto_631139 ) ) ( not ( = ?auto_631138 ?auto_631140 ) ) ( TRUCK-AT ?auto_631141 ?auto_631143 ) ( not ( = ?auto_631143 ?auto_631142 ) ) ( ON ?auto_631129 ?auto_631128 ) ( ON ?auto_631130 ?auto_631129 ) ( ON ?auto_631131 ?auto_631130 ) ( ON ?auto_631132 ?auto_631131 ) ( ON ?auto_631133 ?auto_631132 ) ( ON ?auto_631134 ?auto_631133 ) ( ON ?auto_631135 ?auto_631134 ) ( ON ?auto_631136 ?auto_631135 ) ( ON ?auto_631137 ?auto_631136 ) ( ON ?auto_631138 ?auto_631137 ) ( not ( = ?auto_631128 ?auto_631129 ) ) ( not ( = ?auto_631128 ?auto_631130 ) ) ( not ( = ?auto_631128 ?auto_631131 ) ) ( not ( = ?auto_631128 ?auto_631132 ) ) ( not ( = ?auto_631128 ?auto_631133 ) ) ( not ( = ?auto_631128 ?auto_631134 ) ) ( not ( = ?auto_631128 ?auto_631135 ) ) ( not ( = ?auto_631128 ?auto_631136 ) ) ( not ( = ?auto_631128 ?auto_631137 ) ) ( not ( = ?auto_631128 ?auto_631138 ) ) ( not ( = ?auto_631128 ?auto_631139 ) ) ( not ( = ?auto_631128 ?auto_631140 ) ) ( not ( = ?auto_631129 ?auto_631130 ) ) ( not ( = ?auto_631129 ?auto_631131 ) ) ( not ( = ?auto_631129 ?auto_631132 ) ) ( not ( = ?auto_631129 ?auto_631133 ) ) ( not ( = ?auto_631129 ?auto_631134 ) ) ( not ( = ?auto_631129 ?auto_631135 ) ) ( not ( = ?auto_631129 ?auto_631136 ) ) ( not ( = ?auto_631129 ?auto_631137 ) ) ( not ( = ?auto_631129 ?auto_631138 ) ) ( not ( = ?auto_631129 ?auto_631139 ) ) ( not ( = ?auto_631129 ?auto_631140 ) ) ( not ( = ?auto_631130 ?auto_631131 ) ) ( not ( = ?auto_631130 ?auto_631132 ) ) ( not ( = ?auto_631130 ?auto_631133 ) ) ( not ( = ?auto_631130 ?auto_631134 ) ) ( not ( = ?auto_631130 ?auto_631135 ) ) ( not ( = ?auto_631130 ?auto_631136 ) ) ( not ( = ?auto_631130 ?auto_631137 ) ) ( not ( = ?auto_631130 ?auto_631138 ) ) ( not ( = ?auto_631130 ?auto_631139 ) ) ( not ( = ?auto_631130 ?auto_631140 ) ) ( not ( = ?auto_631131 ?auto_631132 ) ) ( not ( = ?auto_631131 ?auto_631133 ) ) ( not ( = ?auto_631131 ?auto_631134 ) ) ( not ( = ?auto_631131 ?auto_631135 ) ) ( not ( = ?auto_631131 ?auto_631136 ) ) ( not ( = ?auto_631131 ?auto_631137 ) ) ( not ( = ?auto_631131 ?auto_631138 ) ) ( not ( = ?auto_631131 ?auto_631139 ) ) ( not ( = ?auto_631131 ?auto_631140 ) ) ( not ( = ?auto_631132 ?auto_631133 ) ) ( not ( = ?auto_631132 ?auto_631134 ) ) ( not ( = ?auto_631132 ?auto_631135 ) ) ( not ( = ?auto_631132 ?auto_631136 ) ) ( not ( = ?auto_631132 ?auto_631137 ) ) ( not ( = ?auto_631132 ?auto_631138 ) ) ( not ( = ?auto_631132 ?auto_631139 ) ) ( not ( = ?auto_631132 ?auto_631140 ) ) ( not ( = ?auto_631133 ?auto_631134 ) ) ( not ( = ?auto_631133 ?auto_631135 ) ) ( not ( = ?auto_631133 ?auto_631136 ) ) ( not ( = ?auto_631133 ?auto_631137 ) ) ( not ( = ?auto_631133 ?auto_631138 ) ) ( not ( = ?auto_631133 ?auto_631139 ) ) ( not ( = ?auto_631133 ?auto_631140 ) ) ( not ( = ?auto_631134 ?auto_631135 ) ) ( not ( = ?auto_631134 ?auto_631136 ) ) ( not ( = ?auto_631134 ?auto_631137 ) ) ( not ( = ?auto_631134 ?auto_631138 ) ) ( not ( = ?auto_631134 ?auto_631139 ) ) ( not ( = ?auto_631134 ?auto_631140 ) ) ( not ( = ?auto_631135 ?auto_631136 ) ) ( not ( = ?auto_631135 ?auto_631137 ) ) ( not ( = ?auto_631135 ?auto_631138 ) ) ( not ( = ?auto_631135 ?auto_631139 ) ) ( not ( = ?auto_631135 ?auto_631140 ) ) ( not ( = ?auto_631136 ?auto_631137 ) ) ( not ( = ?auto_631136 ?auto_631138 ) ) ( not ( = ?auto_631136 ?auto_631139 ) ) ( not ( = ?auto_631136 ?auto_631140 ) ) ( not ( = ?auto_631137 ?auto_631138 ) ) ( not ( = ?auto_631137 ?auto_631139 ) ) ( not ( = ?auto_631137 ?auto_631140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631138 ?auto_631139 ?auto_631140 )
      ( MAKE-12CRATE-VERIFY ?auto_631128 ?auto_631129 ?auto_631130 ?auto_631131 ?auto_631132 ?auto_631133 ?auto_631134 ?auto_631135 ?auto_631136 ?auto_631137 ?auto_631138 ?auto_631139 ?auto_631140 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631278 - SURFACE
      ?auto_631279 - SURFACE
      ?auto_631280 - SURFACE
      ?auto_631281 - SURFACE
      ?auto_631282 - SURFACE
      ?auto_631283 - SURFACE
      ?auto_631284 - SURFACE
      ?auto_631285 - SURFACE
      ?auto_631286 - SURFACE
      ?auto_631287 - SURFACE
      ?auto_631288 - SURFACE
      ?auto_631289 - SURFACE
      ?auto_631290 - SURFACE
    )
    :vars
    (
      ?auto_631295 - HOIST
      ?auto_631294 - PLACE
      ?auto_631291 - TRUCK
      ?auto_631292 - PLACE
      ?auto_631293 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_631295 ?auto_631294 ) ( SURFACE-AT ?auto_631289 ?auto_631294 ) ( CLEAR ?auto_631289 ) ( IS-CRATE ?auto_631290 ) ( not ( = ?auto_631289 ?auto_631290 ) ) ( AVAILABLE ?auto_631295 ) ( ON ?auto_631289 ?auto_631288 ) ( not ( = ?auto_631288 ?auto_631289 ) ) ( not ( = ?auto_631288 ?auto_631290 ) ) ( TRUCK-AT ?auto_631291 ?auto_631292 ) ( not ( = ?auto_631292 ?auto_631294 ) ) ( HOIST-AT ?auto_631293 ?auto_631292 ) ( LIFTING ?auto_631293 ?auto_631290 ) ( not ( = ?auto_631295 ?auto_631293 ) ) ( ON ?auto_631279 ?auto_631278 ) ( ON ?auto_631280 ?auto_631279 ) ( ON ?auto_631281 ?auto_631280 ) ( ON ?auto_631282 ?auto_631281 ) ( ON ?auto_631283 ?auto_631282 ) ( ON ?auto_631284 ?auto_631283 ) ( ON ?auto_631285 ?auto_631284 ) ( ON ?auto_631286 ?auto_631285 ) ( ON ?auto_631287 ?auto_631286 ) ( ON ?auto_631288 ?auto_631287 ) ( not ( = ?auto_631278 ?auto_631279 ) ) ( not ( = ?auto_631278 ?auto_631280 ) ) ( not ( = ?auto_631278 ?auto_631281 ) ) ( not ( = ?auto_631278 ?auto_631282 ) ) ( not ( = ?auto_631278 ?auto_631283 ) ) ( not ( = ?auto_631278 ?auto_631284 ) ) ( not ( = ?auto_631278 ?auto_631285 ) ) ( not ( = ?auto_631278 ?auto_631286 ) ) ( not ( = ?auto_631278 ?auto_631287 ) ) ( not ( = ?auto_631278 ?auto_631288 ) ) ( not ( = ?auto_631278 ?auto_631289 ) ) ( not ( = ?auto_631278 ?auto_631290 ) ) ( not ( = ?auto_631279 ?auto_631280 ) ) ( not ( = ?auto_631279 ?auto_631281 ) ) ( not ( = ?auto_631279 ?auto_631282 ) ) ( not ( = ?auto_631279 ?auto_631283 ) ) ( not ( = ?auto_631279 ?auto_631284 ) ) ( not ( = ?auto_631279 ?auto_631285 ) ) ( not ( = ?auto_631279 ?auto_631286 ) ) ( not ( = ?auto_631279 ?auto_631287 ) ) ( not ( = ?auto_631279 ?auto_631288 ) ) ( not ( = ?auto_631279 ?auto_631289 ) ) ( not ( = ?auto_631279 ?auto_631290 ) ) ( not ( = ?auto_631280 ?auto_631281 ) ) ( not ( = ?auto_631280 ?auto_631282 ) ) ( not ( = ?auto_631280 ?auto_631283 ) ) ( not ( = ?auto_631280 ?auto_631284 ) ) ( not ( = ?auto_631280 ?auto_631285 ) ) ( not ( = ?auto_631280 ?auto_631286 ) ) ( not ( = ?auto_631280 ?auto_631287 ) ) ( not ( = ?auto_631280 ?auto_631288 ) ) ( not ( = ?auto_631280 ?auto_631289 ) ) ( not ( = ?auto_631280 ?auto_631290 ) ) ( not ( = ?auto_631281 ?auto_631282 ) ) ( not ( = ?auto_631281 ?auto_631283 ) ) ( not ( = ?auto_631281 ?auto_631284 ) ) ( not ( = ?auto_631281 ?auto_631285 ) ) ( not ( = ?auto_631281 ?auto_631286 ) ) ( not ( = ?auto_631281 ?auto_631287 ) ) ( not ( = ?auto_631281 ?auto_631288 ) ) ( not ( = ?auto_631281 ?auto_631289 ) ) ( not ( = ?auto_631281 ?auto_631290 ) ) ( not ( = ?auto_631282 ?auto_631283 ) ) ( not ( = ?auto_631282 ?auto_631284 ) ) ( not ( = ?auto_631282 ?auto_631285 ) ) ( not ( = ?auto_631282 ?auto_631286 ) ) ( not ( = ?auto_631282 ?auto_631287 ) ) ( not ( = ?auto_631282 ?auto_631288 ) ) ( not ( = ?auto_631282 ?auto_631289 ) ) ( not ( = ?auto_631282 ?auto_631290 ) ) ( not ( = ?auto_631283 ?auto_631284 ) ) ( not ( = ?auto_631283 ?auto_631285 ) ) ( not ( = ?auto_631283 ?auto_631286 ) ) ( not ( = ?auto_631283 ?auto_631287 ) ) ( not ( = ?auto_631283 ?auto_631288 ) ) ( not ( = ?auto_631283 ?auto_631289 ) ) ( not ( = ?auto_631283 ?auto_631290 ) ) ( not ( = ?auto_631284 ?auto_631285 ) ) ( not ( = ?auto_631284 ?auto_631286 ) ) ( not ( = ?auto_631284 ?auto_631287 ) ) ( not ( = ?auto_631284 ?auto_631288 ) ) ( not ( = ?auto_631284 ?auto_631289 ) ) ( not ( = ?auto_631284 ?auto_631290 ) ) ( not ( = ?auto_631285 ?auto_631286 ) ) ( not ( = ?auto_631285 ?auto_631287 ) ) ( not ( = ?auto_631285 ?auto_631288 ) ) ( not ( = ?auto_631285 ?auto_631289 ) ) ( not ( = ?auto_631285 ?auto_631290 ) ) ( not ( = ?auto_631286 ?auto_631287 ) ) ( not ( = ?auto_631286 ?auto_631288 ) ) ( not ( = ?auto_631286 ?auto_631289 ) ) ( not ( = ?auto_631286 ?auto_631290 ) ) ( not ( = ?auto_631287 ?auto_631288 ) ) ( not ( = ?auto_631287 ?auto_631289 ) ) ( not ( = ?auto_631287 ?auto_631290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631288 ?auto_631289 ?auto_631290 )
      ( MAKE-12CRATE-VERIFY ?auto_631278 ?auto_631279 ?auto_631280 ?auto_631281 ?auto_631282 ?auto_631283 ?auto_631284 ?auto_631285 ?auto_631286 ?auto_631287 ?auto_631288 ?auto_631289 ?auto_631290 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631440 - SURFACE
      ?auto_631441 - SURFACE
      ?auto_631442 - SURFACE
      ?auto_631443 - SURFACE
      ?auto_631444 - SURFACE
      ?auto_631445 - SURFACE
      ?auto_631446 - SURFACE
      ?auto_631447 - SURFACE
      ?auto_631448 - SURFACE
      ?auto_631449 - SURFACE
      ?auto_631450 - SURFACE
      ?auto_631451 - SURFACE
      ?auto_631452 - SURFACE
    )
    :vars
    (
      ?auto_631458 - HOIST
      ?auto_631455 - PLACE
      ?auto_631454 - TRUCK
      ?auto_631457 - PLACE
      ?auto_631456 - HOIST
      ?auto_631453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_631458 ?auto_631455 ) ( SURFACE-AT ?auto_631451 ?auto_631455 ) ( CLEAR ?auto_631451 ) ( IS-CRATE ?auto_631452 ) ( not ( = ?auto_631451 ?auto_631452 ) ) ( AVAILABLE ?auto_631458 ) ( ON ?auto_631451 ?auto_631450 ) ( not ( = ?auto_631450 ?auto_631451 ) ) ( not ( = ?auto_631450 ?auto_631452 ) ) ( TRUCK-AT ?auto_631454 ?auto_631457 ) ( not ( = ?auto_631457 ?auto_631455 ) ) ( HOIST-AT ?auto_631456 ?auto_631457 ) ( not ( = ?auto_631458 ?auto_631456 ) ) ( AVAILABLE ?auto_631456 ) ( SURFACE-AT ?auto_631452 ?auto_631457 ) ( ON ?auto_631452 ?auto_631453 ) ( CLEAR ?auto_631452 ) ( not ( = ?auto_631451 ?auto_631453 ) ) ( not ( = ?auto_631452 ?auto_631453 ) ) ( not ( = ?auto_631450 ?auto_631453 ) ) ( ON ?auto_631441 ?auto_631440 ) ( ON ?auto_631442 ?auto_631441 ) ( ON ?auto_631443 ?auto_631442 ) ( ON ?auto_631444 ?auto_631443 ) ( ON ?auto_631445 ?auto_631444 ) ( ON ?auto_631446 ?auto_631445 ) ( ON ?auto_631447 ?auto_631446 ) ( ON ?auto_631448 ?auto_631447 ) ( ON ?auto_631449 ?auto_631448 ) ( ON ?auto_631450 ?auto_631449 ) ( not ( = ?auto_631440 ?auto_631441 ) ) ( not ( = ?auto_631440 ?auto_631442 ) ) ( not ( = ?auto_631440 ?auto_631443 ) ) ( not ( = ?auto_631440 ?auto_631444 ) ) ( not ( = ?auto_631440 ?auto_631445 ) ) ( not ( = ?auto_631440 ?auto_631446 ) ) ( not ( = ?auto_631440 ?auto_631447 ) ) ( not ( = ?auto_631440 ?auto_631448 ) ) ( not ( = ?auto_631440 ?auto_631449 ) ) ( not ( = ?auto_631440 ?auto_631450 ) ) ( not ( = ?auto_631440 ?auto_631451 ) ) ( not ( = ?auto_631440 ?auto_631452 ) ) ( not ( = ?auto_631440 ?auto_631453 ) ) ( not ( = ?auto_631441 ?auto_631442 ) ) ( not ( = ?auto_631441 ?auto_631443 ) ) ( not ( = ?auto_631441 ?auto_631444 ) ) ( not ( = ?auto_631441 ?auto_631445 ) ) ( not ( = ?auto_631441 ?auto_631446 ) ) ( not ( = ?auto_631441 ?auto_631447 ) ) ( not ( = ?auto_631441 ?auto_631448 ) ) ( not ( = ?auto_631441 ?auto_631449 ) ) ( not ( = ?auto_631441 ?auto_631450 ) ) ( not ( = ?auto_631441 ?auto_631451 ) ) ( not ( = ?auto_631441 ?auto_631452 ) ) ( not ( = ?auto_631441 ?auto_631453 ) ) ( not ( = ?auto_631442 ?auto_631443 ) ) ( not ( = ?auto_631442 ?auto_631444 ) ) ( not ( = ?auto_631442 ?auto_631445 ) ) ( not ( = ?auto_631442 ?auto_631446 ) ) ( not ( = ?auto_631442 ?auto_631447 ) ) ( not ( = ?auto_631442 ?auto_631448 ) ) ( not ( = ?auto_631442 ?auto_631449 ) ) ( not ( = ?auto_631442 ?auto_631450 ) ) ( not ( = ?auto_631442 ?auto_631451 ) ) ( not ( = ?auto_631442 ?auto_631452 ) ) ( not ( = ?auto_631442 ?auto_631453 ) ) ( not ( = ?auto_631443 ?auto_631444 ) ) ( not ( = ?auto_631443 ?auto_631445 ) ) ( not ( = ?auto_631443 ?auto_631446 ) ) ( not ( = ?auto_631443 ?auto_631447 ) ) ( not ( = ?auto_631443 ?auto_631448 ) ) ( not ( = ?auto_631443 ?auto_631449 ) ) ( not ( = ?auto_631443 ?auto_631450 ) ) ( not ( = ?auto_631443 ?auto_631451 ) ) ( not ( = ?auto_631443 ?auto_631452 ) ) ( not ( = ?auto_631443 ?auto_631453 ) ) ( not ( = ?auto_631444 ?auto_631445 ) ) ( not ( = ?auto_631444 ?auto_631446 ) ) ( not ( = ?auto_631444 ?auto_631447 ) ) ( not ( = ?auto_631444 ?auto_631448 ) ) ( not ( = ?auto_631444 ?auto_631449 ) ) ( not ( = ?auto_631444 ?auto_631450 ) ) ( not ( = ?auto_631444 ?auto_631451 ) ) ( not ( = ?auto_631444 ?auto_631452 ) ) ( not ( = ?auto_631444 ?auto_631453 ) ) ( not ( = ?auto_631445 ?auto_631446 ) ) ( not ( = ?auto_631445 ?auto_631447 ) ) ( not ( = ?auto_631445 ?auto_631448 ) ) ( not ( = ?auto_631445 ?auto_631449 ) ) ( not ( = ?auto_631445 ?auto_631450 ) ) ( not ( = ?auto_631445 ?auto_631451 ) ) ( not ( = ?auto_631445 ?auto_631452 ) ) ( not ( = ?auto_631445 ?auto_631453 ) ) ( not ( = ?auto_631446 ?auto_631447 ) ) ( not ( = ?auto_631446 ?auto_631448 ) ) ( not ( = ?auto_631446 ?auto_631449 ) ) ( not ( = ?auto_631446 ?auto_631450 ) ) ( not ( = ?auto_631446 ?auto_631451 ) ) ( not ( = ?auto_631446 ?auto_631452 ) ) ( not ( = ?auto_631446 ?auto_631453 ) ) ( not ( = ?auto_631447 ?auto_631448 ) ) ( not ( = ?auto_631447 ?auto_631449 ) ) ( not ( = ?auto_631447 ?auto_631450 ) ) ( not ( = ?auto_631447 ?auto_631451 ) ) ( not ( = ?auto_631447 ?auto_631452 ) ) ( not ( = ?auto_631447 ?auto_631453 ) ) ( not ( = ?auto_631448 ?auto_631449 ) ) ( not ( = ?auto_631448 ?auto_631450 ) ) ( not ( = ?auto_631448 ?auto_631451 ) ) ( not ( = ?auto_631448 ?auto_631452 ) ) ( not ( = ?auto_631448 ?auto_631453 ) ) ( not ( = ?auto_631449 ?auto_631450 ) ) ( not ( = ?auto_631449 ?auto_631451 ) ) ( not ( = ?auto_631449 ?auto_631452 ) ) ( not ( = ?auto_631449 ?auto_631453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631450 ?auto_631451 ?auto_631452 )
      ( MAKE-12CRATE-VERIFY ?auto_631440 ?auto_631441 ?auto_631442 ?auto_631443 ?auto_631444 ?auto_631445 ?auto_631446 ?auto_631447 ?auto_631448 ?auto_631449 ?auto_631450 ?auto_631451 ?auto_631452 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631603 - SURFACE
      ?auto_631604 - SURFACE
      ?auto_631605 - SURFACE
      ?auto_631606 - SURFACE
      ?auto_631607 - SURFACE
      ?auto_631608 - SURFACE
      ?auto_631609 - SURFACE
      ?auto_631610 - SURFACE
      ?auto_631611 - SURFACE
      ?auto_631612 - SURFACE
      ?auto_631613 - SURFACE
      ?auto_631614 - SURFACE
      ?auto_631615 - SURFACE
    )
    :vars
    (
      ?auto_631616 - HOIST
      ?auto_631621 - PLACE
      ?auto_631617 - PLACE
      ?auto_631618 - HOIST
      ?auto_631619 - SURFACE
      ?auto_631620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631616 ?auto_631621 ) ( SURFACE-AT ?auto_631614 ?auto_631621 ) ( CLEAR ?auto_631614 ) ( IS-CRATE ?auto_631615 ) ( not ( = ?auto_631614 ?auto_631615 ) ) ( AVAILABLE ?auto_631616 ) ( ON ?auto_631614 ?auto_631613 ) ( not ( = ?auto_631613 ?auto_631614 ) ) ( not ( = ?auto_631613 ?auto_631615 ) ) ( not ( = ?auto_631617 ?auto_631621 ) ) ( HOIST-AT ?auto_631618 ?auto_631617 ) ( not ( = ?auto_631616 ?auto_631618 ) ) ( AVAILABLE ?auto_631618 ) ( SURFACE-AT ?auto_631615 ?auto_631617 ) ( ON ?auto_631615 ?auto_631619 ) ( CLEAR ?auto_631615 ) ( not ( = ?auto_631614 ?auto_631619 ) ) ( not ( = ?auto_631615 ?auto_631619 ) ) ( not ( = ?auto_631613 ?auto_631619 ) ) ( TRUCK-AT ?auto_631620 ?auto_631621 ) ( ON ?auto_631604 ?auto_631603 ) ( ON ?auto_631605 ?auto_631604 ) ( ON ?auto_631606 ?auto_631605 ) ( ON ?auto_631607 ?auto_631606 ) ( ON ?auto_631608 ?auto_631607 ) ( ON ?auto_631609 ?auto_631608 ) ( ON ?auto_631610 ?auto_631609 ) ( ON ?auto_631611 ?auto_631610 ) ( ON ?auto_631612 ?auto_631611 ) ( ON ?auto_631613 ?auto_631612 ) ( not ( = ?auto_631603 ?auto_631604 ) ) ( not ( = ?auto_631603 ?auto_631605 ) ) ( not ( = ?auto_631603 ?auto_631606 ) ) ( not ( = ?auto_631603 ?auto_631607 ) ) ( not ( = ?auto_631603 ?auto_631608 ) ) ( not ( = ?auto_631603 ?auto_631609 ) ) ( not ( = ?auto_631603 ?auto_631610 ) ) ( not ( = ?auto_631603 ?auto_631611 ) ) ( not ( = ?auto_631603 ?auto_631612 ) ) ( not ( = ?auto_631603 ?auto_631613 ) ) ( not ( = ?auto_631603 ?auto_631614 ) ) ( not ( = ?auto_631603 ?auto_631615 ) ) ( not ( = ?auto_631603 ?auto_631619 ) ) ( not ( = ?auto_631604 ?auto_631605 ) ) ( not ( = ?auto_631604 ?auto_631606 ) ) ( not ( = ?auto_631604 ?auto_631607 ) ) ( not ( = ?auto_631604 ?auto_631608 ) ) ( not ( = ?auto_631604 ?auto_631609 ) ) ( not ( = ?auto_631604 ?auto_631610 ) ) ( not ( = ?auto_631604 ?auto_631611 ) ) ( not ( = ?auto_631604 ?auto_631612 ) ) ( not ( = ?auto_631604 ?auto_631613 ) ) ( not ( = ?auto_631604 ?auto_631614 ) ) ( not ( = ?auto_631604 ?auto_631615 ) ) ( not ( = ?auto_631604 ?auto_631619 ) ) ( not ( = ?auto_631605 ?auto_631606 ) ) ( not ( = ?auto_631605 ?auto_631607 ) ) ( not ( = ?auto_631605 ?auto_631608 ) ) ( not ( = ?auto_631605 ?auto_631609 ) ) ( not ( = ?auto_631605 ?auto_631610 ) ) ( not ( = ?auto_631605 ?auto_631611 ) ) ( not ( = ?auto_631605 ?auto_631612 ) ) ( not ( = ?auto_631605 ?auto_631613 ) ) ( not ( = ?auto_631605 ?auto_631614 ) ) ( not ( = ?auto_631605 ?auto_631615 ) ) ( not ( = ?auto_631605 ?auto_631619 ) ) ( not ( = ?auto_631606 ?auto_631607 ) ) ( not ( = ?auto_631606 ?auto_631608 ) ) ( not ( = ?auto_631606 ?auto_631609 ) ) ( not ( = ?auto_631606 ?auto_631610 ) ) ( not ( = ?auto_631606 ?auto_631611 ) ) ( not ( = ?auto_631606 ?auto_631612 ) ) ( not ( = ?auto_631606 ?auto_631613 ) ) ( not ( = ?auto_631606 ?auto_631614 ) ) ( not ( = ?auto_631606 ?auto_631615 ) ) ( not ( = ?auto_631606 ?auto_631619 ) ) ( not ( = ?auto_631607 ?auto_631608 ) ) ( not ( = ?auto_631607 ?auto_631609 ) ) ( not ( = ?auto_631607 ?auto_631610 ) ) ( not ( = ?auto_631607 ?auto_631611 ) ) ( not ( = ?auto_631607 ?auto_631612 ) ) ( not ( = ?auto_631607 ?auto_631613 ) ) ( not ( = ?auto_631607 ?auto_631614 ) ) ( not ( = ?auto_631607 ?auto_631615 ) ) ( not ( = ?auto_631607 ?auto_631619 ) ) ( not ( = ?auto_631608 ?auto_631609 ) ) ( not ( = ?auto_631608 ?auto_631610 ) ) ( not ( = ?auto_631608 ?auto_631611 ) ) ( not ( = ?auto_631608 ?auto_631612 ) ) ( not ( = ?auto_631608 ?auto_631613 ) ) ( not ( = ?auto_631608 ?auto_631614 ) ) ( not ( = ?auto_631608 ?auto_631615 ) ) ( not ( = ?auto_631608 ?auto_631619 ) ) ( not ( = ?auto_631609 ?auto_631610 ) ) ( not ( = ?auto_631609 ?auto_631611 ) ) ( not ( = ?auto_631609 ?auto_631612 ) ) ( not ( = ?auto_631609 ?auto_631613 ) ) ( not ( = ?auto_631609 ?auto_631614 ) ) ( not ( = ?auto_631609 ?auto_631615 ) ) ( not ( = ?auto_631609 ?auto_631619 ) ) ( not ( = ?auto_631610 ?auto_631611 ) ) ( not ( = ?auto_631610 ?auto_631612 ) ) ( not ( = ?auto_631610 ?auto_631613 ) ) ( not ( = ?auto_631610 ?auto_631614 ) ) ( not ( = ?auto_631610 ?auto_631615 ) ) ( not ( = ?auto_631610 ?auto_631619 ) ) ( not ( = ?auto_631611 ?auto_631612 ) ) ( not ( = ?auto_631611 ?auto_631613 ) ) ( not ( = ?auto_631611 ?auto_631614 ) ) ( not ( = ?auto_631611 ?auto_631615 ) ) ( not ( = ?auto_631611 ?auto_631619 ) ) ( not ( = ?auto_631612 ?auto_631613 ) ) ( not ( = ?auto_631612 ?auto_631614 ) ) ( not ( = ?auto_631612 ?auto_631615 ) ) ( not ( = ?auto_631612 ?auto_631619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631613 ?auto_631614 ?auto_631615 )
      ( MAKE-12CRATE-VERIFY ?auto_631603 ?auto_631604 ?auto_631605 ?auto_631606 ?auto_631607 ?auto_631608 ?auto_631609 ?auto_631610 ?auto_631611 ?auto_631612 ?auto_631613 ?auto_631614 ?auto_631615 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631766 - SURFACE
      ?auto_631767 - SURFACE
      ?auto_631768 - SURFACE
      ?auto_631769 - SURFACE
      ?auto_631770 - SURFACE
      ?auto_631771 - SURFACE
      ?auto_631772 - SURFACE
      ?auto_631773 - SURFACE
      ?auto_631774 - SURFACE
      ?auto_631775 - SURFACE
      ?auto_631776 - SURFACE
      ?auto_631777 - SURFACE
      ?auto_631778 - SURFACE
    )
    :vars
    (
      ?auto_631784 - HOIST
      ?auto_631780 - PLACE
      ?auto_631781 - PLACE
      ?auto_631779 - HOIST
      ?auto_631782 - SURFACE
      ?auto_631783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631784 ?auto_631780 ) ( IS-CRATE ?auto_631778 ) ( not ( = ?auto_631777 ?auto_631778 ) ) ( not ( = ?auto_631776 ?auto_631777 ) ) ( not ( = ?auto_631776 ?auto_631778 ) ) ( not ( = ?auto_631781 ?auto_631780 ) ) ( HOIST-AT ?auto_631779 ?auto_631781 ) ( not ( = ?auto_631784 ?auto_631779 ) ) ( AVAILABLE ?auto_631779 ) ( SURFACE-AT ?auto_631778 ?auto_631781 ) ( ON ?auto_631778 ?auto_631782 ) ( CLEAR ?auto_631778 ) ( not ( = ?auto_631777 ?auto_631782 ) ) ( not ( = ?auto_631778 ?auto_631782 ) ) ( not ( = ?auto_631776 ?auto_631782 ) ) ( TRUCK-AT ?auto_631783 ?auto_631780 ) ( SURFACE-AT ?auto_631776 ?auto_631780 ) ( CLEAR ?auto_631776 ) ( LIFTING ?auto_631784 ?auto_631777 ) ( IS-CRATE ?auto_631777 ) ( ON ?auto_631767 ?auto_631766 ) ( ON ?auto_631768 ?auto_631767 ) ( ON ?auto_631769 ?auto_631768 ) ( ON ?auto_631770 ?auto_631769 ) ( ON ?auto_631771 ?auto_631770 ) ( ON ?auto_631772 ?auto_631771 ) ( ON ?auto_631773 ?auto_631772 ) ( ON ?auto_631774 ?auto_631773 ) ( ON ?auto_631775 ?auto_631774 ) ( ON ?auto_631776 ?auto_631775 ) ( not ( = ?auto_631766 ?auto_631767 ) ) ( not ( = ?auto_631766 ?auto_631768 ) ) ( not ( = ?auto_631766 ?auto_631769 ) ) ( not ( = ?auto_631766 ?auto_631770 ) ) ( not ( = ?auto_631766 ?auto_631771 ) ) ( not ( = ?auto_631766 ?auto_631772 ) ) ( not ( = ?auto_631766 ?auto_631773 ) ) ( not ( = ?auto_631766 ?auto_631774 ) ) ( not ( = ?auto_631766 ?auto_631775 ) ) ( not ( = ?auto_631766 ?auto_631776 ) ) ( not ( = ?auto_631766 ?auto_631777 ) ) ( not ( = ?auto_631766 ?auto_631778 ) ) ( not ( = ?auto_631766 ?auto_631782 ) ) ( not ( = ?auto_631767 ?auto_631768 ) ) ( not ( = ?auto_631767 ?auto_631769 ) ) ( not ( = ?auto_631767 ?auto_631770 ) ) ( not ( = ?auto_631767 ?auto_631771 ) ) ( not ( = ?auto_631767 ?auto_631772 ) ) ( not ( = ?auto_631767 ?auto_631773 ) ) ( not ( = ?auto_631767 ?auto_631774 ) ) ( not ( = ?auto_631767 ?auto_631775 ) ) ( not ( = ?auto_631767 ?auto_631776 ) ) ( not ( = ?auto_631767 ?auto_631777 ) ) ( not ( = ?auto_631767 ?auto_631778 ) ) ( not ( = ?auto_631767 ?auto_631782 ) ) ( not ( = ?auto_631768 ?auto_631769 ) ) ( not ( = ?auto_631768 ?auto_631770 ) ) ( not ( = ?auto_631768 ?auto_631771 ) ) ( not ( = ?auto_631768 ?auto_631772 ) ) ( not ( = ?auto_631768 ?auto_631773 ) ) ( not ( = ?auto_631768 ?auto_631774 ) ) ( not ( = ?auto_631768 ?auto_631775 ) ) ( not ( = ?auto_631768 ?auto_631776 ) ) ( not ( = ?auto_631768 ?auto_631777 ) ) ( not ( = ?auto_631768 ?auto_631778 ) ) ( not ( = ?auto_631768 ?auto_631782 ) ) ( not ( = ?auto_631769 ?auto_631770 ) ) ( not ( = ?auto_631769 ?auto_631771 ) ) ( not ( = ?auto_631769 ?auto_631772 ) ) ( not ( = ?auto_631769 ?auto_631773 ) ) ( not ( = ?auto_631769 ?auto_631774 ) ) ( not ( = ?auto_631769 ?auto_631775 ) ) ( not ( = ?auto_631769 ?auto_631776 ) ) ( not ( = ?auto_631769 ?auto_631777 ) ) ( not ( = ?auto_631769 ?auto_631778 ) ) ( not ( = ?auto_631769 ?auto_631782 ) ) ( not ( = ?auto_631770 ?auto_631771 ) ) ( not ( = ?auto_631770 ?auto_631772 ) ) ( not ( = ?auto_631770 ?auto_631773 ) ) ( not ( = ?auto_631770 ?auto_631774 ) ) ( not ( = ?auto_631770 ?auto_631775 ) ) ( not ( = ?auto_631770 ?auto_631776 ) ) ( not ( = ?auto_631770 ?auto_631777 ) ) ( not ( = ?auto_631770 ?auto_631778 ) ) ( not ( = ?auto_631770 ?auto_631782 ) ) ( not ( = ?auto_631771 ?auto_631772 ) ) ( not ( = ?auto_631771 ?auto_631773 ) ) ( not ( = ?auto_631771 ?auto_631774 ) ) ( not ( = ?auto_631771 ?auto_631775 ) ) ( not ( = ?auto_631771 ?auto_631776 ) ) ( not ( = ?auto_631771 ?auto_631777 ) ) ( not ( = ?auto_631771 ?auto_631778 ) ) ( not ( = ?auto_631771 ?auto_631782 ) ) ( not ( = ?auto_631772 ?auto_631773 ) ) ( not ( = ?auto_631772 ?auto_631774 ) ) ( not ( = ?auto_631772 ?auto_631775 ) ) ( not ( = ?auto_631772 ?auto_631776 ) ) ( not ( = ?auto_631772 ?auto_631777 ) ) ( not ( = ?auto_631772 ?auto_631778 ) ) ( not ( = ?auto_631772 ?auto_631782 ) ) ( not ( = ?auto_631773 ?auto_631774 ) ) ( not ( = ?auto_631773 ?auto_631775 ) ) ( not ( = ?auto_631773 ?auto_631776 ) ) ( not ( = ?auto_631773 ?auto_631777 ) ) ( not ( = ?auto_631773 ?auto_631778 ) ) ( not ( = ?auto_631773 ?auto_631782 ) ) ( not ( = ?auto_631774 ?auto_631775 ) ) ( not ( = ?auto_631774 ?auto_631776 ) ) ( not ( = ?auto_631774 ?auto_631777 ) ) ( not ( = ?auto_631774 ?auto_631778 ) ) ( not ( = ?auto_631774 ?auto_631782 ) ) ( not ( = ?auto_631775 ?auto_631776 ) ) ( not ( = ?auto_631775 ?auto_631777 ) ) ( not ( = ?auto_631775 ?auto_631778 ) ) ( not ( = ?auto_631775 ?auto_631782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631776 ?auto_631777 ?auto_631778 )
      ( MAKE-12CRATE-VERIFY ?auto_631766 ?auto_631767 ?auto_631768 ?auto_631769 ?auto_631770 ?auto_631771 ?auto_631772 ?auto_631773 ?auto_631774 ?auto_631775 ?auto_631776 ?auto_631777 ?auto_631778 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_631929 - SURFACE
      ?auto_631930 - SURFACE
      ?auto_631931 - SURFACE
      ?auto_631932 - SURFACE
      ?auto_631933 - SURFACE
      ?auto_631934 - SURFACE
      ?auto_631935 - SURFACE
      ?auto_631936 - SURFACE
      ?auto_631937 - SURFACE
      ?auto_631938 - SURFACE
      ?auto_631939 - SURFACE
      ?auto_631940 - SURFACE
      ?auto_631941 - SURFACE
    )
    :vars
    (
      ?auto_631946 - HOIST
      ?auto_631943 - PLACE
      ?auto_631947 - PLACE
      ?auto_631944 - HOIST
      ?auto_631942 - SURFACE
      ?auto_631945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631946 ?auto_631943 ) ( IS-CRATE ?auto_631941 ) ( not ( = ?auto_631940 ?auto_631941 ) ) ( not ( = ?auto_631939 ?auto_631940 ) ) ( not ( = ?auto_631939 ?auto_631941 ) ) ( not ( = ?auto_631947 ?auto_631943 ) ) ( HOIST-AT ?auto_631944 ?auto_631947 ) ( not ( = ?auto_631946 ?auto_631944 ) ) ( AVAILABLE ?auto_631944 ) ( SURFACE-AT ?auto_631941 ?auto_631947 ) ( ON ?auto_631941 ?auto_631942 ) ( CLEAR ?auto_631941 ) ( not ( = ?auto_631940 ?auto_631942 ) ) ( not ( = ?auto_631941 ?auto_631942 ) ) ( not ( = ?auto_631939 ?auto_631942 ) ) ( TRUCK-AT ?auto_631945 ?auto_631943 ) ( SURFACE-AT ?auto_631939 ?auto_631943 ) ( CLEAR ?auto_631939 ) ( IS-CRATE ?auto_631940 ) ( AVAILABLE ?auto_631946 ) ( IN ?auto_631940 ?auto_631945 ) ( ON ?auto_631930 ?auto_631929 ) ( ON ?auto_631931 ?auto_631930 ) ( ON ?auto_631932 ?auto_631931 ) ( ON ?auto_631933 ?auto_631932 ) ( ON ?auto_631934 ?auto_631933 ) ( ON ?auto_631935 ?auto_631934 ) ( ON ?auto_631936 ?auto_631935 ) ( ON ?auto_631937 ?auto_631936 ) ( ON ?auto_631938 ?auto_631937 ) ( ON ?auto_631939 ?auto_631938 ) ( not ( = ?auto_631929 ?auto_631930 ) ) ( not ( = ?auto_631929 ?auto_631931 ) ) ( not ( = ?auto_631929 ?auto_631932 ) ) ( not ( = ?auto_631929 ?auto_631933 ) ) ( not ( = ?auto_631929 ?auto_631934 ) ) ( not ( = ?auto_631929 ?auto_631935 ) ) ( not ( = ?auto_631929 ?auto_631936 ) ) ( not ( = ?auto_631929 ?auto_631937 ) ) ( not ( = ?auto_631929 ?auto_631938 ) ) ( not ( = ?auto_631929 ?auto_631939 ) ) ( not ( = ?auto_631929 ?auto_631940 ) ) ( not ( = ?auto_631929 ?auto_631941 ) ) ( not ( = ?auto_631929 ?auto_631942 ) ) ( not ( = ?auto_631930 ?auto_631931 ) ) ( not ( = ?auto_631930 ?auto_631932 ) ) ( not ( = ?auto_631930 ?auto_631933 ) ) ( not ( = ?auto_631930 ?auto_631934 ) ) ( not ( = ?auto_631930 ?auto_631935 ) ) ( not ( = ?auto_631930 ?auto_631936 ) ) ( not ( = ?auto_631930 ?auto_631937 ) ) ( not ( = ?auto_631930 ?auto_631938 ) ) ( not ( = ?auto_631930 ?auto_631939 ) ) ( not ( = ?auto_631930 ?auto_631940 ) ) ( not ( = ?auto_631930 ?auto_631941 ) ) ( not ( = ?auto_631930 ?auto_631942 ) ) ( not ( = ?auto_631931 ?auto_631932 ) ) ( not ( = ?auto_631931 ?auto_631933 ) ) ( not ( = ?auto_631931 ?auto_631934 ) ) ( not ( = ?auto_631931 ?auto_631935 ) ) ( not ( = ?auto_631931 ?auto_631936 ) ) ( not ( = ?auto_631931 ?auto_631937 ) ) ( not ( = ?auto_631931 ?auto_631938 ) ) ( not ( = ?auto_631931 ?auto_631939 ) ) ( not ( = ?auto_631931 ?auto_631940 ) ) ( not ( = ?auto_631931 ?auto_631941 ) ) ( not ( = ?auto_631931 ?auto_631942 ) ) ( not ( = ?auto_631932 ?auto_631933 ) ) ( not ( = ?auto_631932 ?auto_631934 ) ) ( not ( = ?auto_631932 ?auto_631935 ) ) ( not ( = ?auto_631932 ?auto_631936 ) ) ( not ( = ?auto_631932 ?auto_631937 ) ) ( not ( = ?auto_631932 ?auto_631938 ) ) ( not ( = ?auto_631932 ?auto_631939 ) ) ( not ( = ?auto_631932 ?auto_631940 ) ) ( not ( = ?auto_631932 ?auto_631941 ) ) ( not ( = ?auto_631932 ?auto_631942 ) ) ( not ( = ?auto_631933 ?auto_631934 ) ) ( not ( = ?auto_631933 ?auto_631935 ) ) ( not ( = ?auto_631933 ?auto_631936 ) ) ( not ( = ?auto_631933 ?auto_631937 ) ) ( not ( = ?auto_631933 ?auto_631938 ) ) ( not ( = ?auto_631933 ?auto_631939 ) ) ( not ( = ?auto_631933 ?auto_631940 ) ) ( not ( = ?auto_631933 ?auto_631941 ) ) ( not ( = ?auto_631933 ?auto_631942 ) ) ( not ( = ?auto_631934 ?auto_631935 ) ) ( not ( = ?auto_631934 ?auto_631936 ) ) ( not ( = ?auto_631934 ?auto_631937 ) ) ( not ( = ?auto_631934 ?auto_631938 ) ) ( not ( = ?auto_631934 ?auto_631939 ) ) ( not ( = ?auto_631934 ?auto_631940 ) ) ( not ( = ?auto_631934 ?auto_631941 ) ) ( not ( = ?auto_631934 ?auto_631942 ) ) ( not ( = ?auto_631935 ?auto_631936 ) ) ( not ( = ?auto_631935 ?auto_631937 ) ) ( not ( = ?auto_631935 ?auto_631938 ) ) ( not ( = ?auto_631935 ?auto_631939 ) ) ( not ( = ?auto_631935 ?auto_631940 ) ) ( not ( = ?auto_631935 ?auto_631941 ) ) ( not ( = ?auto_631935 ?auto_631942 ) ) ( not ( = ?auto_631936 ?auto_631937 ) ) ( not ( = ?auto_631936 ?auto_631938 ) ) ( not ( = ?auto_631936 ?auto_631939 ) ) ( not ( = ?auto_631936 ?auto_631940 ) ) ( not ( = ?auto_631936 ?auto_631941 ) ) ( not ( = ?auto_631936 ?auto_631942 ) ) ( not ( = ?auto_631937 ?auto_631938 ) ) ( not ( = ?auto_631937 ?auto_631939 ) ) ( not ( = ?auto_631937 ?auto_631940 ) ) ( not ( = ?auto_631937 ?auto_631941 ) ) ( not ( = ?auto_631937 ?auto_631942 ) ) ( not ( = ?auto_631938 ?auto_631939 ) ) ( not ( = ?auto_631938 ?auto_631940 ) ) ( not ( = ?auto_631938 ?auto_631941 ) ) ( not ( = ?auto_631938 ?auto_631942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_631939 ?auto_631940 ?auto_631941 )
      ( MAKE-12CRATE-VERIFY ?auto_631929 ?auto_631930 ?auto_631931 ?auto_631932 ?auto_631933 ?auto_631934 ?auto_631935 ?auto_631936 ?auto_631937 ?auto_631938 ?auto_631939 ?auto_631940 ?auto_631941 ) )
  )

)

