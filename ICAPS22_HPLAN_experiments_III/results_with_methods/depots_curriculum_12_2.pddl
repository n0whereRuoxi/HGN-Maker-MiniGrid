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
      ?auto_11870 - SURFACE
      ?auto_11871 - SURFACE
    )
    :vars
    (
      ?auto_11872 - HOIST
      ?auto_11873 - PLACE
      ?auto_11875 - PLACE
      ?auto_11876 - HOIST
      ?auto_11877 - SURFACE
      ?auto_11874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11872 ?auto_11873 ) ( SURFACE-AT ?auto_11870 ?auto_11873 ) ( CLEAR ?auto_11870 ) ( IS-CRATE ?auto_11871 ) ( AVAILABLE ?auto_11872 ) ( not ( = ?auto_11875 ?auto_11873 ) ) ( HOIST-AT ?auto_11876 ?auto_11875 ) ( AVAILABLE ?auto_11876 ) ( SURFACE-AT ?auto_11871 ?auto_11875 ) ( ON ?auto_11871 ?auto_11877 ) ( CLEAR ?auto_11871 ) ( TRUCK-AT ?auto_11874 ?auto_11873 ) ( not ( = ?auto_11870 ?auto_11871 ) ) ( not ( = ?auto_11870 ?auto_11877 ) ) ( not ( = ?auto_11871 ?auto_11877 ) ) ( not ( = ?auto_11872 ?auto_11876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11874 ?auto_11873 ?auto_11875 )
      ( !LIFT ?auto_11876 ?auto_11871 ?auto_11877 ?auto_11875 )
      ( !LOAD ?auto_11876 ?auto_11871 ?auto_11874 ?auto_11875 )
      ( !DRIVE ?auto_11874 ?auto_11875 ?auto_11873 )
      ( !UNLOAD ?auto_11872 ?auto_11871 ?auto_11874 ?auto_11873 )
      ( !DROP ?auto_11872 ?auto_11871 ?auto_11870 ?auto_11873 )
      ( MAKE-1CRATE-VERIFY ?auto_11870 ?auto_11871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11880 - SURFACE
      ?auto_11881 - SURFACE
    )
    :vars
    (
      ?auto_11882 - HOIST
      ?auto_11883 - PLACE
      ?auto_11885 - PLACE
      ?auto_11886 - HOIST
      ?auto_11887 - SURFACE
      ?auto_11884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11882 ?auto_11883 ) ( SURFACE-AT ?auto_11880 ?auto_11883 ) ( CLEAR ?auto_11880 ) ( IS-CRATE ?auto_11881 ) ( AVAILABLE ?auto_11882 ) ( not ( = ?auto_11885 ?auto_11883 ) ) ( HOIST-AT ?auto_11886 ?auto_11885 ) ( AVAILABLE ?auto_11886 ) ( SURFACE-AT ?auto_11881 ?auto_11885 ) ( ON ?auto_11881 ?auto_11887 ) ( CLEAR ?auto_11881 ) ( TRUCK-AT ?auto_11884 ?auto_11883 ) ( not ( = ?auto_11880 ?auto_11881 ) ) ( not ( = ?auto_11880 ?auto_11887 ) ) ( not ( = ?auto_11881 ?auto_11887 ) ) ( not ( = ?auto_11882 ?auto_11886 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11884 ?auto_11883 ?auto_11885 )
      ( !LIFT ?auto_11886 ?auto_11881 ?auto_11887 ?auto_11885 )
      ( !LOAD ?auto_11886 ?auto_11881 ?auto_11884 ?auto_11885 )
      ( !DRIVE ?auto_11884 ?auto_11885 ?auto_11883 )
      ( !UNLOAD ?auto_11882 ?auto_11881 ?auto_11884 ?auto_11883 )
      ( !DROP ?auto_11882 ?auto_11881 ?auto_11880 ?auto_11883 )
      ( MAKE-1CRATE-VERIFY ?auto_11880 ?auto_11881 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11891 - SURFACE
      ?auto_11892 - SURFACE
      ?auto_11893 - SURFACE
    )
    :vars
    (
      ?auto_11897 - HOIST
      ?auto_11896 - PLACE
      ?auto_11898 - PLACE
      ?auto_11895 - HOIST
      ?auto_11894 - SURFACE
      ?auto_11900 - PLACE
      ?auto_11902 - HOIST
      ?auto_11901 - SURFACE
      ?auto_11899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11897 ?auto_11896 ) ( IS-CRATE ?auto_11893 ) ( not ( = ?auto_11898 ?auto_11896 ) ) ( HOIST-AT ?auto_11895 ?auto_11898 ) ( AVAILABLE ?auto_11895 ) ( SURFACE-AT ?auto_11893 ?auto_11898 ) ( ON ?auto_11893 ?auto_11894 ) ( CLEAR ?auto_11893 ) ( not ( = ?auto_11892 ?auto_11893 ) ) ( not ( = ?auto_11892 ?auto_11894 ) ) ( not ( = ?auto_11893 ?auto_11894 ) ) ( not ( = ?auto_11897 ?auto_11895 ) ) ( SURFACE-AT ?auto_11891 ?auto_11896 ) ( CLEAR ?auto_11891 ) ( IS-CRATE ?auto_11892 ) ( AVAILABLE ?auto_11897 ) ( not ( = ?auto_11900 ?auto_11896 ) ) ( HOIST-AT ?auto_11902 ?auto_11900 ) ( AVAILABLE ?auto_11902 ) ( SURFACE-AT ?auto_11892 ?auto_11900 ) ( ON ?auto_11892 ?auto_11901 ) ( CLEAR ?auto_11892 ) ( TRUCK-AT ?auto_11899 ?auto_11896 ) ( not ( = ?auto_11891 ?auto_11892 ) ) ( not ( = ?auto_11891 ?auto_11901 ) ) ( not ( = ?auto_11892 ?auto_11901 ) ) ( not ( = ?auto_11897 ?auto_11902 ) ) ( not ( = ?auto_11891 ?auto_11893 ) ) ( not ( = ?auto_11891 ?auto_11894 ) ) ( not ( = ?auto_11893 ?auto_11901 ) ) ( not ( = ?auto_11898 ?auto_11900 ) ) ( not ( = ?auto_11895 ?auto_11902 ) ) ( not ( = ?auto_11894 ?auto_11901 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11891 ?auto_11892 )
      ( MAKE-1CRATE ?auto_11892 ?auto_11893 )
      ( MAKE-2CRATE-VERIFY ?auto_11891 ?auto_11892 ?auto_11893 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11905 - SURFACE
      ?auto_11906 - SURFACE
    )
    :vars
    (
      ?auto_11907 - HOIST
      ?auto_11908 - PLACE
      ?auto_11910 - PLACE
      ?auto_11911 - HOIST
      ?auto_11912 - SURFACE
      ?auto_11909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11907 ?auto_11908 ) ( SURFACE-AT ?auto_11905 ?auto_11908 ) ( CLEAR ?auto_11905 ) ( IS-CRATE ?auto_11906 ) ( AVAILABLE ?auto_11907 ) ( not ( = ?auto_11910 ?auto_11908 ) ) ( HOIST-AT ?auto_11911 ?auto_11910 ) ( AVAILABLE ?auto_11911 ) ( SURFACE-AT ?auto_11906 ?auto_11910 ) ( ON ?auto_11906 ?auto_11912 ) ( CLEAR ?auto_11906 ) ( TRUCK-AT ?auto_11909 ?auto_11908 ) ( not ( = ?auto_11905 ?auto_11906 ) ) ( not ( = ?auto_11905 ?auto_11912 ) ) ( not ( = ?auto_11906 ?auto_11912 ) ) ( not ( = ?auto_11907 ?auto_11911 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11909 ?auto_11908 ?auto_11910 )
      ( !LIFT ?auto_11911 ?auto_11906 ?auto_11912 ?auto_11910 )
      ( !LOAD ?auto_11911 ?auto_11906 ?auto_11909 ?auto_11910 )
      ( !DRIVE ?auto_11909 ?auto_11910 ?auto_11908 )
      ( !UNLOAD ?auto_11907 ?auto_11906 ?auto_11909 ?auto_11908 )
      ( !DROP ?auto_11907 ?auto_11906 ?auto_11905 ?auto_11908 )
      ( MAKE-1CRATE-VERIFY ?auto_11905 ?auto_11906 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11917 - SURFACE
      ?auto_11918 - SURFACE
      ?auto_11919 - SURFACE
      ?auto_11920 - SURFACE
    )
    :vars
    (
      ?auto_11921 - HOIST
      ?auto_11926 - PLACE
      ?auto_11924 - PLACE
      ?auto_11925 - HOIST
      ?auto_11923 - SURFACE
      ?auto_11930 - PLACE
      ?auto_11928 - HOIST
      ?auto_11929 - SURFACE
      ?auto_11927 - SURFACE
      ?auto_11922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11921 ?auto_11926 ) ( IS-CRATE ?auto_11920 ) ( not ( = ?auto_11924 ?auto_11926 ) ) ( HOIST-AT ?auto_11925 ?auto_11924 ) ( SURFACE-AT ?auto_11920 ?auto_11924 ) ( ON ?auto_11920 ?auto_11923 ) ( CLEAR ?auto_11920 ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11919 ?auto_11923 ) ) ( not ( = ?auto_11920 ?auto_11923 ) ) ( not ( = ?auto_11921 ?auto_11925 ) ) ( IS-CRATE ?auto_11919 ) ( not ( = ?auto_11930 ?auto_11926 ) ) ( HOIST-AT ?auto_11928 ?auto_11930 ) ( AVAILABLE ?auto_11928 ) ( SURFACE-AT ?auto_11919 ?auto_11930 ) ( ON ?auto_11919 ?auto_11929 ) ( CLEAR ?auto_11919 ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11929 ) ) ( not ( = ?auto_11919 ?auto_11929 ) ) ( not ( = ?auto_11921 ?auto_11928 ) ) ( SURFACE-AT ?auto_11917 ?auto_11926 ) ( CLEAR ?auto_11917 ) ( IS-CRATE ?auto_11918 ) ( AVAILABLE ?auto_11921 ) ( AVAILABLE ?auto_11925 ) ( SURFACE-AT ?auto_11918 ?auto_11924 ) ( ON ?auto_11918 ?auto_11927 ) ( CLEAR ?auto_11918 ) ( TRUCK-AT ?auto_11922 ?auto_11926 ) ( not ( = ?auto_11917 ?auto_11918 ) ) ( not ( = ?auto_11917 ?auto_11927 ) ) ( not ( = ?auto_11918 ?auto_11927 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) ( not ( = ?auto_11917 ?auto_11929 ) ) ( not ( = ?auto_11919 ?auto_11927 ) ) ( not ( = ?auto_11930 ?auto_11924 ) ) ( not ( = ?auto_11928 ?auto_11925 ) ) ( not ( = ?auto_11929 ?auto_11927 ) ) ( not ( = ?auto_11917 ?auto_11920 ) ) ( not ( = ?auto_11917 ?auto_11923 ) ) ( not ( = ?auto_11918 ?auto_11920 ) ) ( not ( = ?auto_11918 ?auto_11923 ) ) ( not ( = ?auto_11920 ?auto_11929 ) ) ( not ( = ?auto_11920 ?auto_11927 ) ) ( not ( = ?auto_11923 ?auto_11929 ) ) ( not ( = ?auto_11923 ?auto_11927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11917 ?auto_11918 ?auto_11919 )
      ( MAKE-1CRATE ?auto_11919 ?auto_11920 )
      ( MAKE-3CRATE-VERIFY ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11933 - SURFACE
      ?auto_11934 - SURFACE
    )
    :vars
    (
      ?auto_11935 - HOIST
      ?auto_11936 - PLACE
      ?auto_11938 - PLACE
      ?auto_11939 - HOIST
      ?auto_11940 - SURFACE
      ?auto_11937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11935 ?auto_11936 ) ( SURFACE-AT ?auto_11933 ?auto_11936 ) ( CLEAR ?auto_11933 ) ( IS-CRATE ?auto_11934 ) ( AVAILABLE ?auto_11935 ) ( not ( = ?auto_11938 ?auto_11936 ) ) ( HOIST-AT ?auto_11939 ?auto_11938 ) ( AVAILABLE ?auto_11939 ) ( SURFACE-AT ?auto_11934 ?auto_11938 ) ( ON ?auto_11934 ?auto_11940 ) ( CLEAR ?auto_11934 ) ( TRUCK-AT ?auto_11937 ?auto_11936 ) ( not ( = ?auto_11933 ?auto_11934 ) ) ( not ( = ?auto_11933 ?auto_11940 ) ) ( not ( = ?auto_11934 ?auto_11940 ) ) ( not ( = ?auto_11935 ?auto_11939 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11937 ?auto_11936 ?auto_11938 )
      ( !LIFT ?auto_11939 ?auto_11934 ?auto_11940 ?auto_11938 )
      ( !LOAD ?auto_11939 ?auto_11934 ?auto_11937 ?auto_11938 )
      ( !DRIVE ?auto_11937 ?auto_11938 ?auto_11936 )
      ( !UNLOAD ?auto_11935 ?auto_11934 ?auto_11937 ?auto_11936 )
      ( !DROP ?auto_11935 ?auto_11934 ?auto_11933 ?auto_11936 )
      ( MAKE-1CRATE-VERIFY ?auto_11933 ?auto_11934 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11946 - SURFACE
      ?auto_11947 - SURFACE
      ?auto_11948 - SURFACE
      ?auto_11949 - SURFACE
      ?auto_11950 - SURFACE
    )
    :vars
    (
      ?auto_11955 - HOIST
      ?auto_11954 - PLACE
      ?auto_11953 - PLACE
      ?auto_11951 - HOIST
      ?auto_11952 - SURFACE
      ?auto_11962 - PLACE
      ?auto_11958 - HOIST
      ?auto_11957 - SURFACE
      ?auto_11963 - PLACE
      ?auto_11960 - HOIST
      ?auto_11959 - SURFACE
      ?auto_11961 - SURFACE
      ?auto_11956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11955 ?auto_11954 ) ( IS-CRATE ?auto_11950 ) ( not ( = ?auto_11953 ?auto_11954 ) ) ( HOIST-AT ?auto_11951 ?auto_11953 ) ( AVAILABLE ?auto_11951 ) ( SURFACE-AT ?auto_11950 ?auto_11953 ) ( ON ?auto_11950 ?auto_11952 ) ( CLEAR ?auto_11950 ) ( not ( = ?auto_11949 ?auto_11950 ) ) ( not ( = ?auto_11949 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11952 ) ) ( not ( = ?auto_11955 ?auto_11951 ) ) ( IS-CRATE ?auto_11949 ) ( not ( = ?auto_11962 ?auto_11954 ) ) ( HOIST-AT ?auto_11958 ?auto_11962 ) ( SURFACE-AT ?auto_11949 ?auto_11962 ) ( ON ?auto_11949 ?auto_11957 ) ( CLEAR ?auto_11949 ) ( not ( = ?auto_11948 ?auto_11949 ) ) ( not ( = ?auto_11948 ?auto_11957 ) ) ( not ( = ?auto_11949 ?auto_11957 ) ) ( not ( = ?auto_11955 ?auto_11958 ) ) ( IS-CRATE ?auto_11948 ) ( not ( = ?auto_11963 ?auto_11954 ) ) ( HOIST-AT ?auto_11960 ?auto_11963 ) ( AVAILABLE ?auto_11960 ) ( SURFACE-AT ?auto_11948 ?auto_11963 ) ( ON ?auto_11948 ?auto_11959 ) ( CLEAR ?auto_11948 ) ( not ( = ?auto_11947 ?auto_11948 ) ) ( not ( = ?auto_11947 ?auto_11959 ) ) ( not ( = ?auto_11948 ?auto_11959 ) ) ( not ( = ?auto_11955 ?auto_11960 ) ) ( SURFACE-AT ?auto_11946 ?auto_11954 ) ( CLEAR ?auto_11946 ) ( IS-CRATE ?auto_11947 ) ( AVAILABLE ?auto_11955 ) ( AVAILABLE ?auto_11958 ) ( SURFACE-AT ?auto_11947 ?auto_11962 ) ( ON ?auto_11947 ?auto_11961 ) ( CLEAR ?auto_11947 ) ( TRUCK-AT ?auto_11956 ?auto_11954 ) ( not ( = ?auto_11946 ?auto_11947 ) ) ( not ( = ?auto_11946 ?auto_11961 ) ) ( not ( = ?auto_11947 ?auto_11961 ) ) ( not ( = ?auto_11946 ?auto_11948 ) ) ( not ( = ?auto_11946 ?auto_11959 ) ) ( not ( = ?auto_11948 ?auto_11961 ) ) ( not ( = ?auto_11963 ?auto_11962 ) ) ( not ( = ?auto_11960 ?auto_11958 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11946 ?auto_11949 ) ) ( not ( = ?auto_11946 ?auto_11957 ) ) ( not ( = ?auto_11947 ?auto_11949 ) ) ( not ( = ?auto_11947 ?auto_11957 ) ) ( not ( = ?auto_11949 ?auto_11959 ) ) ( not ( = ?auto_11949 ?auto_11961 ) ) ( not ( = ?auto_11957 ?auto_11959 ) ) ( not ( = ?auto_11957 ?auto_11961 ) ) ( not ( = ?auto_11946 ?auto_11950 ) ) ( not ( = ?auto_11946 ?auto_11952 ) ) ( not ( = ?auto_11947 ?auto_11950 ) ) ( not ( = ?auto_11947 ?auto_11952 ) ) ( not ( = ?auto_11948 ?auto_11950 ) ) ( not ( = ?auto_11948 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11957 ) ) ( not ( = ?auto_11950 ?auto_11959 ) ) ( not ( = ?auto_11950 ?auto_11961 ) ) ( not ( = ?auto_11953 ?auto_11962 ) ) ( not ( = ?auto_11953 ?auto_11963 ) ) ( not ( = ?auto_11951 ?auto_11958 ) ) ( not ( = ?auto_11951 ?auto_11960 ) ) ( not ( = ?auto_11952 ?auto_11957 ) ) ( not ( = ?auto_11952 ?auto_11959 ) ) ( not ( = ?auto_11952 ?auto_11961 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11946 ?auto_11947 ?auto_11948 ?auto_11949 )
      ( MAKE-1CRATE ?auto_11949 ?auto_11950 )
      ( MAKE-4CRATE-VERIFY ?auto_11946 ?auto_11947 ?auto_11948 ?auto_11949 ?auto_11950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11966 - SURFACE
      ?auto_11967 - SURFACE
    )
    :vars
    (
      ?auto_11968 - HOIST
      ?auto_11969 - PLACE
      ?auto_11971 - PLACE
      ?auto_11972 - HOIST
      ?auto_11973 - SURFACE
      ?auto_11970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11968 ?auto_11969 ) ( SURFACE-AT ?auto_11966 ?auto_11969 ) ( CLEAR ?auto_11966 ) ( IS-CRATE ?auto_11967 ) ( AVAILABLE ?auto_11968 ) ( not ( = ?auto_11971 ?auto_11969 ) ) ( HOIST-AT ?auto_11972 ?auto_11971 ) ( AVAILABLE ?auto_11972 ) ( SURFACE-AT ?auto_11967 ?auto_11971 ) ( ON ?auto_11967 ?auto_11973 ) ( CLEAR ?auto_11967 ) ( TRUCK-AT ?auto_11970 ?auto_11969 ) ( not ( = ?auto_11966 ?auto_11967 ) ) ( not ( = ?auto_11966 ?auto_11973 ) ) ( not ( = ?auto_11967 ?auto_11973 ) ) ( not ( = ?auto_11968 ?auto_11972 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11970 ?auto_11969 ?auto_11971 )
      ( !LIFT ?auto_11972 ?auto_11967 ?auto_11973 ?auto_11971 )
      ( !LOAD ?auto_11972 ?auto_11967 ?auto_11970 ?auto_11971 )
      ( !DRIVE ?auto_11970 ?auto_11971 ?auto_11969 )
      ( !UNLOAD ?auto_11968 ?auto_11967 ?auto_11970 ?auto_11969 )
      ( !DROP ?auto_11968 ?auto_11967 ?auto_11966 ?auto_11969 )
      ( MAKE-1CRATE-VERIFY ?auto_11966 ?auto_11967 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_11980 - SURFACE
      ?auto_11981 - SURFACE
      ?auto_11982 - SURFACE
      ?auto_11983 - SURFACE
      ?auto_11984 - SURFACE
      ?auto_11985 - SURFACE
    )
    :vars
    (
      ?auto_11990 - HOIST
      ?auto_11987 - PLACE
      ?auto_11989 - PLACE
      ?auto_11988 - HOIST
      ?auto_11991 - SURFACE
      ?auto_11993 - PLACE
      ?auto_11999 - HOIST
      ?auto_11997 - SURFACE
      ?auto_11998 - PLACE
      ?auto_11992 - HOIST
      ?auto_12001 - SURFACE
      ?auto_11995 - PLACE
      ?auto_11994 - HOIST
      ?auto_12000 - SURFACE
      ?auto_11996 - SURFACE
      ?auto_11986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11990 ?auto_11987 ) ( IS-CRATE ?auto_11985 ) ( not ( = ?auto_11989 ?auto_11987 ) ) ( HOIST-AT ?auto_11988 ?auto_11989 ) ( AVAILABLE ?auto_11988 ) ( SURFACE-AT ?auto_11985 ?auto_11989 ) ( ON ?auto_11985 ?auto_11991 ) ( CLEAR ?auto_11985 ) ( not ( = ?auto_11984 ?auto_11985 ) ) ( not ( = ?auto_11984 ?auto_11991 ) ) ( not ( = ?auto_11985 ?auto_11991 ) ) ( not ( = ?auto_11990 ?auto_11988 ) ) ( IS-CRATE ?auto_11984 ) ( not ( = ?auto_11993 ?auto_11987 ) ) ( HOIST-AT ?auto_11999 ?auto_11993 ) ( AVAILABLE ?auto_11999 ) ( SURFACE-AT ?auto_11984 ?auto_11993 ) ( ON ?auto_11984 ?auto_11997 ) ( CLEAR ?auto_11984 ) ( not ( = ?auto_11983 ?auto_11984 ) ) ( not ( = ?auto_11983 ?auto_11997 ) ) ( not ( = ?auto_11984 ?auto_11997 ) ) ( not ( = ?auto_11990 ?auto_11999 ) ) ( IS-CRATE ?auto_11983 ) ( not ( = ?auto_11998 ?auto_11987 ) ) ( HOIST-AT ?auto_11992 ?auto_11998 ) ( SURFACE-AT ?auto_11983 ?auto_11998 ) ( ON ?auto_11983 ?auto_12001 ) ( CLEAR ?auto_11983 ) ( not ( = ?auto_11982 ?auto_11983 ) ) ( not ( = ?auto_11982 ?auto_12001 ) ) ( not ( = ?auto_11983 ?auto_12001 ) ) ( not ( = ?auto_11990 ?auto_11992 ) ) ( IS-CRATE ?auto_11982 ) ( not ( = ?auto_11995 ?auto_11987 ) ) ( HOIST-AT ?auto_11994 ?auto_11995 ) ( AVAILABLE ?auto_11994 ) ( SURFACE-AT ?auto_11982 ?auto_11995 ) ( ON ?auto_11982 ?auto_12000 ) ( CLEAR ?auto_11982 ) ( not ( = ?auto_11981 ?auto_11982 ) ) ( not ( = ?auto_11981 ?auto_12000 ) ) ( not ( = ?auto_11982 ?auto_12000 ) ) ( not ( = ?auto_11990 ?auto_11994 ) ) ( SURFACE-AT ?auto_11980 ?auto_11987 ) ( CLEAR ?auto_11980 ) ( IS-CRATE ?auto_11981 ) ( AVAILABLE ?auto_11990 ) ( AVAILABLE ?auto_11992 ) ( SURFACE-AT ?auto_11981 ?auto_11998 ) ( ON ?auto_11981 ?auto_11996 ) ( CLEAR ?auto_11981 ) ( TRUCK-AT ?auto_11986 ?auto_11987 ) ( not ( = ?auto_11980 ?auto_11981 ) ) ( not ( = ?auto_11980 ?auto_11996 ) ) ( not ( = ?auto_11981 ?auto_11996 ) ) ( not ( = ?auto_11980 ?auto_11982 ) ) ( not ( = ?auto_11980 ?auto_12000 ) ) ( not ( = ?auto_11982 ?auto_11996 ) ) ( not ( = ?auto_11995 ?auto_11998 ) ) ( not ( = ?auto_11994 ?auto_11992 ) ) ( not ( = ?auto_12000 ?auto_11996 ) ) ( not ( = ?auto_11980 ?auto_11983 ) ) ( not ( = ?auto_11980 ?auto_12001 ) ) ( not ( = ?auto_11981 ?auto_11983 ) ) ( not ( = ?auto_11981 ?auto_12001 ) ) ( not ( = ?auto_11983 ?auto_12000 ) ) ( not ( = ?auto_11983 ?auto_11996 ) ) ( not ( = ?auto_12001 ?auto_12000 ) ) ( not ( = ?auto_12001 ?auto_11996 ) ) ( not ( = ?auto_11980 ?auto_11984 ) ) ( not ( = ?auto_11980 ?auto_11997 ) ) ( not ( = ?auto_11981 ?auto_11984 ) ) ( not ( = ?auto_11981 ?auto_11997 ) ) ( not ( = ?auto_11982 ?auto_11984 ) ) ( not ( = ?auto_11982 ?auto_11997 ) ) ( not ( = ?auto_11984 ?auto_12001 ) ) ( not ( = ?auto_11984 ?auto_12000 ) ) ( not ( = ?auto_11984 ?auto_11996 ) ) ( not ( = ?auto_11993 ?auto_11998 ) ) ( not ( = ?auto_11993 ?auto_11995 ) ) ( not ( = ?auto_11999 ?auto_11992 ) ) ( not ( = ?auto_11999 ?auto_11994 ) ) ( not ( = ?auto_11997 ?auto_12001 ) ) ( not ( = ?auto_11997 ?auto_12000 ) ) ( not ( = ?auto_11997 ?auto_11996 ) ) ( not ( = ?auto_11980 ?auto_11985 ) ) ( not ( = ?auto_11980 ?auto_11991 ) ) ( not ( = ?auto_11981 ?auto_11985 ) ) ( not ( = ?auto_11981 ?auto_11991 ) ) ( not ( = ?auto_11982 ?auto_11985 ) ) ( not ( = ?auto_11982 ?auto_11991 ) ) ( not ( = ?auto_11983 ?auto_11985 ) ) ( not ( = ?auto_11983 ?auto_11991 ) ) ( not ( = ?auto_11985 ?auto_11997 ) ) ( not ( = ?auto_11985 ?auto_12001 ) ) ( not ( = ?auto_11985 ?auto_12000 ) ) ( not ( = ?auto_11985 ?auto_11996 ) ) ( not ( = ?auto_11989 ?auto_11993 ) ) ( not ( = ?auto_11989 ?auto_11998 ) ) ( not ( = ?auto_11989 ?auto_11995 ) ) ( not ( = ?auto_11988 ?auto_11999 ) ) ( not ( = ?auto_11988 ?auto_11992 ) ) ( not ( = ?auto_11988 ?auto_11994 ) ) ( not ( = ?auto_11991 ?auto_11997 ) ) ( not ( = ?auto_11991 ?auto_12001 ) ) ( not ( = ?auto_11991 ?auto_12000 ) ) ( not ( = ?auto_11991 ?auto_11996 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11980 ?auto_11981 ?auto_11982 ?auto_11983 ?auto_11984 )
      ( MAKE-1CRATE ?auto_11984 ?auto_11985 )
      ( MAKE-5CRATE-VERIFY ?auto_11980 ?auto_11981 ?auto_11982 ?auto_11983 ?auto_11984 ?auto_11985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12004 - SURFACE
      ?auto_12005 - SURFACE
    )
    :vars
    (
      ?auto_12006 - HOIST
      ?auto_12007 - PLACE
      ?auto_12009 - PLACE
      ?auto_12010 - HOIST
      ?auto_12011 - SURFACE
      ?auto_12008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12006 ?auto_12007 ) ( SURFACE-AT ?auto_12004 ?auto_12007 ) ( CLEAR ?auto_12004 ) ( IS-CRATE ?auto_12005 ) ( AVAILABLE ?auto_12006 ) ( not ( = ?auto_12009 ?auto_12007 ) ) ( HOIST-AT ?auto_12010 ?auto_12009 ) ( AVAILABLE ?auto_12010 ) ( SURFACE-AT ?auto_12005 ?auto_12009 ) ( ON ?auto_12005 ?auto_12011 ) ( CLEAR ?auto_12005 ) ( TRUCK-AT ?auto_12008 ?auto_12007 ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12011 ) ) ( not ( = ?auto_12005 ?auto_12011 ) ) ( not ( = ?auto_12006 ?auto_12010 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12008 ?auto_12007 ?auto_12009 )
      ( !LIFT ?auto_12010 ?auto_12005 ?auto_12011 ?auto_12009 )
      ( !LOAD ?auto_12010 ?auto_12005 ?auto_12008 ?auto_12009 )
      ( !DRIVE ?auto_12008 ?auto_12009 ?auto_12007 )
      ( !UNLOAD ?auto_12006 ?auto_12005 ?auto_12008 ?auto_12007 )
      ( !DROP ?auto_12006 ?auto_12005 ?auto_12004 ?auto_12007 )
      ( MAKE-1CRATE-VERIFY ?auto_12004 ?auto_12005 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12019 - SURFACE
      ?auto_12020 - SURFACE
      ?auto_12021 - SURFACE
      ?auto_12022 - SURFACE
      ?auto_12023 - SURFACE
      ?auto_12024 - SURFACE
      ?auto_12025 - SURFACE
    )
    :vars
    (
      ?auto_12031 - HOIST
      ?auto_12027 - PLACE
      ?auto_12029 - PLACE
      ?auto_12028 - HOIST
      ?auto_12026 - SURFACE
      ?auto_12032 - PLACE
      ?auto_12044 - HOIST
      ?auto_12042 - SURFACE
      ?auto_12034 - PLACE
      ?auto_12038 - HOIST
      ?auto_12040 - SURFACE
      ?auto_12039 - PLACE
      ?auto_12036 - HOIST
      ?auto_12037 - SURFACE
      ?auto_12033 - PLACE
      ?auto_12035 - HOIST
      ?auto_12043 - SURFACE
      ?auto_12041 - SURFACE
      ?auto_12030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12031 ?auto_12027 ) ( IS-CRATE ?auto_12025 ) ( not ( = ?auto_12029 ?auto_12027 ) ) ( HOIST-AT ?auto_12028 ?auto_12029 ) ( AVAILABLE ?auto_12028 ) ( SURFACE-AT ?auto_12025 ?auto_12029 ) ( ON ?auto_12025 ?auto_12026 ) ( CLEAR ?auto_12025 ) ( not ( = ?auto_12024 ?auto_12025 ) ) ( not ( = ?auto_12024 ?auto_12026 ) ) ( not ( = ?auto_12025 ?auto_12026 ) ) ( not ( = ?auto_12031 ?auto_12028 ) ) ( IS-CRATE ?auto_12024 ) ( not ( = ?auto_12032 ?auto_12027 ) ) ( HOIST-AT ?auto_12044 ?auto_12032 ) ( AVAILABLE ?auto_12044 ) ( SURFACE-AT ?auto_12024 ?auto_12032 ) ( ON ?auto_12024 ?auto_12042 ) ( CLEAR ?auto_12024 ) ( not ( = ?auto_12023 ?auto_12024 ) ) ( not ( = ?auto_12023 ?auto_12042 ) ) ( not ( = ?auto_12024 ?auto_12042 ) ) ( not ( = ?auto_12031 ?auto_12044 ) ) ( IS-CRATE ?auto_12023 ) ( not ( = ?auto_12034 ?auto_12027 ) ) ( HOIST-AT ?auto_12038 ?auto_12034 ) ( AVAILABLE ?auto_12038 ) ( SURFACE-AT ?auto_12023 ?auto_12034 ) ( ON ?auto_12023 ?auto_12040 ) ( CLEAR ?auto_12023 ) ( not ( = ?auto_12022 ?auto_12023 ) ) ( not ( = ?auto_12022 ?auto_12040 ) ) ( not ( = ?auto_12023 ?auto_12040 ) ) ( not ( = ?auto_12031 ?auto_12038 ) ) ( IS-CRATE ?auto_12022 ) ( not ( = ?auto_12039 ?auto_12027 ) ) ( HOIST-AT ?auto_12036 ?auto_12039 ) ( SURFACE-AT ?auto_12022 ?auto_12039 ) ( ON ?auto_12022 ?auto_12037 ) ( CLEAR ?auto_12022 ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12021 ?auto_12037 ) ) ( not ( = ?auto_12022 ?auto_12037 ) ) ( not ( = ?auto_12031 ?auto_12036 ) ) ( IS-CRATE ?auto_12021 ) ( not ( = ?auto_12033 ?auto_12027 ) ) ( HOIST-AT ?auto_12035 ?auto_12033 ) ( AVAILABLE ?auto_12035 ) ( SURFACE-AT ?auto_12021 ?auto_12033 ) ( ON ?auto_12021 ?auto_12043 ) ( CLEAR ?auto_12021 ) ( not ( = ?auto_12020 ?auto_12021 ) ) ( not ( = ?auto_12020 ?auto_12043 ) ) ( not ( = ?auto_12021 ?auto_12043 ) ) ( not ( = ?auto_12031 ?auto_12035 ) ) ( SURFACE-AT ?auto_12019 ?auto_12027 ) ( CLEAR ?auto_12019 ) ( IS-CRATE ?auto_12020 ) ( AVAILABLE ?auto_12031 ) ( AVAILABLE ?auto_12036 ) ( SURFACE-AT ?auto_12020 ?auto_12039 ) ( ON ?auto_12020 ?auto_12041 ) ( CLEAR ?auto_12020 ) ( TRUCK-AT ?auto_12030 ?auto_12027 ) ( not ( = ?auto_12019 ?auto_12020 ) ) ( not ( = ?auto_12019 ?auto_12041 ) ) ( not ( = ?auto_12020 ?auto_12041 ) ) ( not ( = ?auto_12019 ?auto_12021 ) ) ( not ( = ?auto_12019 ?auto_12043 ) ) ( not ( = ?auto_12021 ?auto_12041 ) ) ( not ( = ?auto_12033 ?auto_12039 ) ) ( not ( = ?auto_12035 ?auto_12036 ) ) ( not ( = ?auto_12043 ?auto_12041 ) ) ( not ( = ?auto_12019 ?auto_12022 ) ) ( not ( = ?auto_12019 ?auto_12037 ) ) ( not ( = ?auto_12020 ?auto_12022 ) ) ( not ( = ?auto_12020 ?auto_12037 ) ) ( not ( = ?auto_12022 ?auto_12043 ) ) ( not ( = ?auto_12022 ?auto_12041 ) ) ( not ( = ?auto_12037 ?auto_12043 ) ) ( not ( = ?auto_12037 ?auto_12041 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( not ( = ?auto_12019 ?auto_12040 ) ) ( not ( = ?auto_12020 ?auto_12023 ) ) ( not ( = ?auto_12020 ?auto_12040 ) ) ( not ( = ?auto_12021 ?auto_12023 ) ) ( not ( = ?auto_12021 ?auto_12040 ) ) ( not ( = ?auto_12023 ?auto_12037 ) ) ( not ( = ?auto_12023 ?auto_12043 ) ) ( not ( = ?auto_12023 ?auto_12041 ) ) ( not ( = ?auto_12034 ?auto_12039 ) ) ( not ( = ?auto_12034 ?auto_12033 ) ) ( not ( = ?auto_12038 ?auto_12036 ) ) ( not ( = ?auto_12038 ?auto_12035 ) ) ( not ( = ?auto_12040 ?auto_12037 ) ) ( not ( = ?auto_12040 ?auto_12043 ) ) ( not ( = ?auto_12040 ?auto_12041 ) ) ( not ( = ?auto_12019 ?auto_12024 ) ) ( not ( = ?auto_12019 ?auto_12042 ) ) ( not ( = ?auto_12020 ?auto_12024 ) ) ( not ( = ?auto_12020 ?auto_12042 ) ) ( not ( = ?auto_12021 ?auto_12024 ) ) ( not ( = ?auto_12021 ?auto_12042 ) ) ( not ( = ?auto_12022 ?auto_12024 ) ) ( not ( = ?auto_12022 ?auto_12042 ) ) ( not ( = ?auto_12024 ?auto_12040 ) ) ( not ( = ?auto_12024 ?auto_12037 ) ) ( not ( = ?auto_12024 ?auto_12043 ) ) ( not ( = ?auto_12024 ?auto_12041 ) ) ( not ( = ?auto_12032 ?auto_12034 ) ) ( not ( = ?auto_12032 ?auto_12039 ) ) ( not ( = ?auto_12032 ?auto_12033 ) ) ( not ( = ?auto_12044 ?auto_12038 ) ) ( not ( = ?auto_12044 ?auto_12036 ) ) ( not ( = ?auto_12044 ?auto_12035 ) ) ( not ( = ?auto_12042 ?auto_12040 ) ) ( not ( = ?auto_12042 ?auto_12037 ) ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12042 ?auto_12041 ) ) ( not ( = ?auto_12019 ?auto_12025 ) ) ( not ( = ?auto_12019 ?auto_12026 ) ) ( not ( = ?auto_12020 ?auto_12025 ) ) ( not ( = ?auto_12020 ?auto_12026 ) ) ( not ( = ?auto_12021 ?auto_12025 ) ) ( not ( = ?auto_12021 ?auto_12026 ) ) ( not ( = ?auto_12022 ?auto_12025 ) ) ( not ( = ?auto_12022 ?auto_12026 ) ) ( not ( = ?auto_12023 ?auto_12025 ) ) ( not ( = ?auto_12023 ?auto_12026 ) ) ( not ( = ?auto_12025 ?auto_12042 ) ) ( not ( = ?auto_12025 ?auto_12040 ) ) ( not ( = ?auto_12025 ?auto_12037 ) ) ( not ( = ?auto_12025 ?auto_12043 ) ) ( not ( = ?auto_12025 ?auto_12041 ) ) ( not ( = ?auto_12029 ?auto_12032 ) ) ( not ( = ?auto_12029 ?auto_12034 ) ) ( not ( = ?auto_12029 ?auto_12039 ) ) ( not ( = ?auto_12029 ?auto_12033 ) ) ( not ( = ?auto_12028 ?auto_12044 ) ) ( not ( = ?auto_12028 ?auto_12038 ) ) ( not ( = ?auto_12028 ?auto_12036 ) ) ( not ( = ?auto_12028 ?auto_12035 ) ) ( not ( = ?auto_12026 ?auto_12042 ) ) ( not ( = ?auto_12026 ?auto_12040 ) ) ( not ( = ?auto_12026 ?auto_12037 ) ) ( not ( = ?auto_12026 ?auto_12043 ) ) ( not ( = ?auto_12026 ?auto_12041 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12019 ?auto_12020 ?auto_12021 ?auto_12022 ?auto_12023 ?auto_12024 )
      ( MAKE-1CRATE ?auto_12024 ?auto_12025 )
      ( MAKE-6CRATE-VERIFY ?auto_12019 ?auto_12020 ?auto_12021 ?auto_12022 ?auto_12023 ?auto_12024 ?auto_12025 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12047 - SURFACE
      ?auto_12048 - SURFACE
    )
    :vars
    (
      ?auto_12049 - HOIST
      ?auto_12050 - PLACE
      ?auto_12052 - PLACE
      ?auto_12053 - HOIST
      ?auto_12054 - SURFACE
      ?auto_12051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12049 ?auto_12050 ) ( SURFACE-AT ?auto_12047 ?auto_12050 ) ( CLEAR ?auto_12047 ) ( IS-CRATE ?auto_12048 ) ( AVAILABLE ?auto_12049 ) ( not ( = ?auto_12052 ?auto_12050 ) ) ( HOIST-AT ?auto_12053 ?auto_12052 ) ( AVAILABLE ?auto_12053 ) ( SURFACE-AT ?auto_12048 ?auto_12052 ) ( ON ?auto_12048 ?auto_12054 ) ( CLEAR ?auto_12048 ) ( TRUCK-AT ?auto_12051 ?auto_12050 ) ( not ( = ?auto_12047 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12054 ) ) ( not ( = ?auto_12048 ?auto_12054 ) ) ( not ( = ?auto_12049 ?auto_12053 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12051 ?auto_12050 ?auto_12052 )
      ( !LIFT ?auto_12053 ?auto_12048 ?auto_12054 ?auto_12052 )
      ( !LOAD ?auto_12053 ?auto_12048 ?auto_12051 ?auto_12052 )
      ( !DRIVE ?auto_12051 ?auto_12052 ?auto_12050 )
      ( !UNLOAD ?auto_12049 ?auto_12048 ?auto_12051 ?auto_12050 )
      ( !DROP ?auto_12049 ?auto_12048 ?auto_12047 ?auto_12050 )
      ( MAKE-1CRATE-VERIFY ?auto_12047 ?auto_12048 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12063 - SURFACE
      ?auto_12064 - SURFACE
      ?auto_12065 - SURFACE
      ?auto_12066 - SURFACE
      ?auto_12067 - SURFACE
      ?auto_12068 - SURFACE
      ?auto_12070 - SURFACE
      ?auto_12069 - SURFACE
    )
    :vars
    (
      ?auto_12073 - HOIST
      ?auto_12072 - PLACE
      ?auto_12071 - PLACE
      ?auto_12075 - HOIST
      ?auto_12076 - SURFACE
      ?auto_12083 - PLACE
      ?auto_12080 - HOIST
      ?auto_12082 - SURFACE
      ?auto_12081 - PLACE
      ?auto_12088 - HOIST
      ?auto_12085 - SURFACE
      ?auto_12079 - PLACE
      ?auto_12090 - HOIST
      ?auto_12084 - SURFACE
      ?auto_12089 - PLACE
      ?auto_12092 - HOIST
      ?auto_12091 - SURFACE
      ?auto_12078 - PLACE
      ?auto_12077 - HOIST
      ?auto_12087 - SURFACE
      ?auto_12086 - SURFACE
      ?auto_12074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12073 ?auto_12072 ) ( IS-CRATE ?auto_12069 ) ( not ( = ?auto_12071 ?auto_12072 ) ) ( HOIST-AT ?auto_12075 ?auto_12071 ) ( AVAILABLE ?auto_12075 ) ( SURFACE-AT ?auto_12069 ?auto_12071 ) ( ON ?auto_12069 ?auto_12076 ) ( CLEAR ?auto_12069 ) ( not ( = ?auto_12070 ?auto_12069 ) ) ( not ( = ?auto_12070 ?auto_12076 ) ) ( not ( = ?auto_12069 ?auto_12076 ) ) ( not ( = ?auto_12073 ?auto_12075 ) ) ( IS-CRATE ?auto_12070 ) ( not ( = ?auto_12083 ?auto_12072 ) ) ( HOIST-AT ?auto_12080 ?auto_12083 ) ( AVAILABLE ?auto_12080 ) ( SURFACE-AT ?auto_12070 ?auto_12083 ) ( ON ?auto_12070 ?auto_12082 ) ( CLEAR ?auto_12070 ) ( not ( = ?auto_12068 ?auto_12070 ) ) ( not ( = ?auto_12068 ?auto_12082 ) ) ( not ( = ?auto_12070 ?auto_12082 ) ) ( not ( = ?auto_12073 ?auto_12080 ) ) ( IS-CRATE ?auto_12068 ) ( not ( = ?auto_12081 ?auto_12072 ) ) ( HOIST-AT ?auto_12088 ?auto_12081 ) ( AVAILABLE ?auto_12088 ) ( SURFACE-AT ?auto_12068 ?auto_12081 ) ( ON ?auto_12068 ?auto_12085 ) ( CLEAR ?auto_12068 ) ( not ( = ?auto_12067 ?auto_12068 ) ) ( not ( = ?auto_12067 ?auto_12085 ) ) ( not ( = ?auto_12068 ?auto_12085 ) ) ( not ( = ?auto_12073 ?auto_12088 ) ) ( IS-CRATE ?auto_12067 ) ( not ( = ?auto_12079 ?auto_12072 ) ) ( HOIST-AT ?auto_12090 ?auto_12079 ) ( AVAILABLE ?auto_12090 ) ( SURFACE-AT ?auto_12067 ?auto_12079 ) ( ON ?auto_12067 ?auto_12084 ) ( CLEAR ?auto_12067 ) ( not ( = ?auto_12066 ?auto_12067 ) ) ( not ( = ?auto_12066 ?auto_12084 ) ) ( not ( = ?auto_12067 ?auto_12084 ) ) ( not ( = ?auto_12073 ?auto_12090 ) ) ( IS-CRATE ?auto_12066 ) ( not ( = ?auto_12089 ?auto_12072 ) ) ( HOIST-AT ?auto_12092 ?auto_12089 ) ( SURFACE-AT ?auto_12066 ?auto_12089 ) ( ON ?auto_12066 ?auto_12091 ) ( CLEAR ?auto_12066 ) ( not ( = ?auto_12065 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12091 ) ) ( not ( = ?auto_12066 ?auto_12091 ) ) ( not ( = ?auto_12073 ?auto_12092 ) ) ( IS-CRATE ?auto_12065 ) ( not ( = ?auto_12078 ?auto_12072 ) ) ( HOIST-AT ?auto_12077 ?auto_12078 ) ( AVAILABLE ?auto_12077 ) ( SURFACE-AT ?auto_12065 ?auto_12078 ) ( ON ?auto_12065 ?auto_12087 ) ( CLEAR ?auto_12065 ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( not ( = ?auto_12064 ?auto_12087 ) ) ( not ( = ?auto_12065 ?auto_12087 ) ) ( not ( = ?auto_12073 ?auto_12077 ) ) ( SURFACE-AT ?auto_12063 ?auto_12072 ) ( CLEAR ?auto_12063 ) ( IS-CRATE ?auto_12064 ) ( AVAILABLE ?auto_12073 ) ( AVAILABLE ?auto_12092 ) ( SURFACE-AT ?auto_12064 ?auto_12089 ) ( ON ?auto_12064 ?auto_12086 ) ( CLEAR ?auto_12064 ) ( TRUCK-AT ?auto_12074 ?auto_12072 ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12086 ) ) ( not ( = ?auto_12064 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12087 ) ) ( not ( = ?auto_12065 ?auto_12086 ) ) ( not ( = ?auto_12078 ?auto_12089 ) ) ( not ( = ?auto_12077 ?auto_12092 ) ) ( not ( = ?auto_12087 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12066 ) ) ( not ( = ?auto_12063 ?auto_12091 ) ) ( not ( = ?auto_12064 ?auto_12066 ) ) ( not ( = ?auto_12064 ?auto_12091 ) ) ( not ( = ?auto_12066 ?auto_12087 ) ) ( not ( = ?auto_12066 ?auto_12086 ) ) ( not ( = ?auto_12091 ?auto_12087 ) ) ( not ( = ?auto_12091 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12067 ) ) ( not ( = ?auto_12063 ?auto_12084 ) ) ( not ( = ?auto_12064 ?auto_12067 ) ) ( not ( = ?auto_12064 ?auto_12084 ) ) ( not ( = ?auto_12065 ?auto_12067 ) ) ( not ( = ?auto_12065 ?auto_12084 ) ) ( not ( = ?auto_12067 ?auto_12091 ) ) ( not ( = ?auto_12067 ?auto_12087 ) ) ( not ( = ?auto_12067 ?auto_12086 ) ) ( not ( = ?auto_12079 ?auto_12089 ) ) ( not ( = ?auto_12079 ?auto_12078 ) ) ( not ( = ?auto_12090 ?auto_12092 ) ) ( not ( = ?auto_12090 ?auto_12077 ) ) ( not ( = ?auto_12084 ?auto_12091 ) ) ( not ( = ?auto_12084 ?auto_12087 ) ) ( not ( = ?auto_12084 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12068 ) ) ( not ( = ?auto_12063 ?auto_12085 ) ) ( not ( = ?auto_12064 ?auto_12068 ) ) ( not ( = ?auto_12064 ?auto_12085 ) ) ( not ( = ?auto_12065 ?auto_12068 ) ) ( not ( = ?auto_12065 ?auto_12085 ) ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( not ( = ?auto_12066 ?auto_12085 ) ) ( not ( = ?auto_12068 ?auto_12084 ) ) ( not ( = ?auto_12068 ?auto_12091 ) ) ( not ( = ?auto_12068 ?auto_12087 ) ) ( not ( = ?auto_12068 ?auto_12086 ) ) ( not ( = ?auto_12081 ?auto_12079 ) ) ( not ( = ?auto_12081 ?auto_12089 ) ) ( not ( = ?auto_12081 ?auto_12078 ) ) ( not ( = ?auto_12088 ?auto_12090 ) ) ( not ( = ?auto_12088 ?auto_12092 ) ) ( not ( = ?auto_12088 ?auto_12077 ) ) ( not ( = ?auto_12085 ?auto_12084 ) ) ( not ( = ?auto_12085 ?auto_12091 ) ) ( not ( = ?auto_12085 ?auto_12087 ) ) ( not ( = ?auto_12085 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12070 ) ) ( not ( = ?auto_12063 ?auto_12082 ) ) ( not ( = ?auto_12064 ?auto_12070 ) ) ( not ( = ?auto_12064 ?auto_12082 ) ) ( not ( = ?auto_12065 ?auto_12070 ) ) ( not ( = ?auto_12065 ?auto_12082 ) ) ( not ( = ?auto_12066 ?auto_12070 ) ) ( not ( = ?auto_12066 ?auto_12082 ) ) ( not ( = ?auto_12067 ?auto_12070 ) ) ( not ( = ?auto_12067 ?auto_12082 ) ) ( not ( = ?auto_12070 ?auto_12085 ) ) ( not ( = ?auto_12070 ?auto_12084 ) ) ( not ( = ?auto_12070 ?auto_12091 ) ) ( not ( = ?auto_12070 ?auto_12087 ) ) ( not ( = ?auto_12070 ?auto_12086 ) ) ( not ( = ?auto_12083 ?auto_12081 ) ) ( not ( = ?auto_12083 ?auto_12079 ) ) ( not ( = ?auto_12083 ?auto_12089 ) ) ( not ( = ?auto_12083 ?auto_12078 ) ) ( not ( = ?auto_12080 ?auto_12088 ) ) ( not ( = ?auto_12080 ?auto_12090 ) ) ( not ( = ?auto_12080 ?auto_12092 ) ) ( not ( = ?auto_12080 ?auto_12077 ) ) ( not ( = ?auto_12082 ?auto_12085 ) ) ( not ( = ?auto_12082 ?auto_12084 ) ) ( not ( = ?auto_12082 ?auto_12091 ) ) ( not ( = ?auto_12082 ?auto_12087 ) ) ( not ( = ?auto_12082 ?auto_12086 ) ) ( not ( = ?auto_12063 ?auto_12069 ) ) ( not ( = ?auto_12063 ?auto_12076 ) ) ( not ( = ?auto_12064 ?auto_12069 ) ) ( not ( = ?auto_12064 ?auto_12076 ) ) ( not ( = ?auto_12065 ?auto_12069 ) ) ( not ( = ?auto_12065 ?auto_12076 ) ) ( not ( = ?auto_12066 ?auto_12069 ) ) ( not ( = ?auto_12066 ?auto_12076 ) ) ( not ( = ?auto_12067 ?auto_12069 ) ) ( not ( = ?auto_12067 ?auto_12076 ) ) ( not ( = ?auto_12068 ?auto_12069 ) ) ( not ( = ?auto_12068 ?auto_12076 ) ) ( not ( = ?auto_12069 ?auto_12082 ) ) ( not ( = ?auto_12069 ?auto_12085 ) ) ( not ( = ?auto_12069 ?auto_12084 ) ) ( not ( = ?auto_12069 ?auto_12091 ) ) ( not ( = ?auto_12069 ?auto_12087 ) ) ( not ( = ?auto_12069 ?auto_12086 ) ) ( not ( = ?auto_12071 ?auto_12083 ) ) ( not ( = ?auto_12071 ?auto_12081 ) ) ( not ( = ?auto_12071 ?auto_12079 ) ) ( not ( = ?auto_12071 ?auto_12089 ) ) ( not ( = ?auto_12071 ?auto_12078 ) ) ( not ( = ?auto_12075 ?auto_12080 ) ) ( not ( = ?auto_12075 ?auto_12088 ) ) ( not ( = ?auto_12075 ?auto_12090 ) ) ( not ( = ?auto_12075 ?auto_12092 ) ) ( not ( = ?auto_12075 ?auto_12077 ) ) ( not ( = ?auto_12076 ?auto_12082 ) ) ( not ( = ?auto_12076 ?auto_12085 ) ) ( not ( = ?auto_12076 ?auto_12084 ) ) ( not ( = ?auto_12076 ?auto_12091 ) ) ( not ( = ?auto_12076 ?auto_12087 ) ) ( not ( = ?auto_12076 ?auto_12086 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12063 ?auto_12064 ?auto_12065 ?auto_12066 ?auto_12067 ?auto_12068 ?auto_12070 )
      ( MAKE-1CRATE ?auto_12070 ?auto_12069 )
      ( MAKE-7CRATE-VERIFY ?auto_12063 ?auto_12064 ?auto_12065 ?auto_12066 ?auto_12067 ?auto_12068 ?auto_12070 ?auto_12069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12095 - SURFACE
      ?auto_12096 - SURFACE
    )
    :vars
    (
      ?auto_12097 - HOIST
      ?auto_12098 - PLACE
      ?auto_12100 - PLACE
      ?auto_12101 - HOIST
      ?auto_12102 - SURFACE
      ?auto_12099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12097 ?auto_12098 ) ( SURFACE-AT ?auto_12095 ?auto_12098 ) ( CLEAR ?auto_12095 ) ( IS-CRATE ?auto_12096 ) ( AVAILABLE ?auto_12097 ) ( not ( = ?auto_12100 ?auto_12098 ) ) ( HOIST-AT ?auto_12101 ?auto_12100 ) ( AVAILABLE ?auto_12101 ) ( SURFACE-AT ?auto_12096 ?auto_12100 ) ( ON ?auto_12096 ?auto_12102 ) ( CLEAR ?auto_12096 ) ( TRUCK-AT ?auto_12099 ?auto_12098 ) ( not ( = ?auto_12095 ?auto_12096 ) ) ( not ( = ?auto_12095 ?auto_12102 ) ) ( not ( = ?auto_12096 ?auto_12102 ) ) ( not ( = ?auto_12097 ?auto_12101 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12099 ?auto_12098 ?auto_12100 )
      ( !LIFT ?auto_12101 ?auto_12096 ?auto_12102 ?auto_12100 )
      ( !LOAD ?auto_12101 ?auto_12096 ?auto_12099 ?auto_12100 )
      ( !DRIVE ?auto_12099 ?auto_12100 ?auto_12098 )
      ( !UNLOAD ?auto_12097 ?auto_12096 ?auto_12099 ?auto_12098 )
      ( !DROP ?auto_12097 ?auto_12096 ?auto_12095 ?auto_12098 )
      ( MAKE-1CRATE-VERIFY ?auto_12095 ?auto_12096 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12112 - SURFACE
      ?auto_12113 - SURFACE
      ?auto_12114 - SURFACE
      ?auto_12115 - SURFACE
      ?auto_12116 - SURFACE
      ?auto_12117 - SURFACE
      ?auto_12120 - SURFACE
      ?auto_12119 - SURFACE
      ?auto_12118 - SURFACE
    )
    :vars
    (
      ?auto_12124 - HOIST
      ?auto_12123 - PLACE
      ?auto_12126 - PLACE
      ?auto_12121 - HOIST
      ?auto_12125 - SURFACE
      ?auto_12145 - PLACE
      ?auto_12128 - HOIST
      ?auto_12127 - SURFACE
      ?auto_12142 - PLACE
      ?auto_12129 - HOIST
      ?auto_12143 - SURFACE
      ?auto_12144 - PLACE
      ?auto_12138 - HOIST
      ?auto_12135 - SURFACE
      ?auto_12131 - PLACE
      ?auto_12140 - HOIST
      ?auto_12141 - SURFACE
      ?auto_12139 - PLACE
      ?auto_12134 - HOIST
      ?auto_12132 - SURFACE
      ?auto_12130 - PLACE
      ?auto_12133 - HOIST
      ?auto_12136 - SURFACE
      ?auto_12137 - SURFACE
      ?auto_12122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12124 ?auto_12123 ) ( IS-CRATE ?auto_12118 ) ( not ( = ?auto_12126 ?auto_12123 ) ) ( HOIST-AT ?auto_12121 ?auto_12126 ) ( AVAILABLE ?auto_12121 ) ( SURFACE-AT ?auto_12118 ?auto_12126 ) ( ON ?auto_12118 ?auto_12125 ) ( CLEAR ?auto_12118 ) ( not ( = ?auto_12119 ?auto_12118 ) ) ( not ( = ?auto_12119 ?auto_12125 ) ) ( not ( = ?auto_12118 ?auto_12125 ) ) ( not ( = ?auto_12124 ?auto_12121 ) ) ( IS-CRATE ?auto_12119 ) ( not ( = ?auto_12145 ?auto_12123 ) ) ( HOIST-AT ?auto_12128 ?auto_12145 ) ( AVAILABLE ?auto_12128 ) ( SURFACE-AT ?auto_12119 ?auto_12145 ) ( ON ?auto_12119 ?auto_12127 ) ( CLEAR ?auto_12119 ) ( not ( = ?auto_12120 ?auto_12119 ) ) ( not ( = ?auto_12120 ?auto_12127 ) ) ( not ( = ?auto_12119 ?auto_12127 ) ) ( not ( = ?auto_12124 ?auto_12128 ) ) ( IS-CRATE ?auto_12120 ) ( not ( = ?auto_12142 ?auto_12123 ) ) ( HOIST-AT ?auto_12129 ?auto_12142 ) ( AVAILABLE ?auto_12129 ) ( SURFACE-AT ?auto_12120 ?auto_12142 ) ( ON ?auto_12120 ?auto_12143 ) ( CLEAR ?auto_12120 ) ( not ( = ?auto_12117 ?auto_12120 ) ) ( not ( = ?auto_12117 ?auto_12143 ) ) ( not ( = ?auto_12120 ?auto_12143 ) ) ( not ( = ?auto_12124 ?auto_12129 ) ) ( IS-CRATE ?auto_12117 ) ( not ( = ?auto_12144 ?auto_12123 ) ) ( HOIST-AT ?auto_12138 ?auto_12144 ) ( AVAILABLE ?auto_12138 ) ( SURFACE-AT ?auto_12117 ?auto_12144 ) ( ON ?auto_12117 ?auto_12135 ) ( CLEAR ?auto_12117 ) ( not ( = ?auto_12116 ?auto_12117 ) ) ( not ( = ?auto_12116 ?auto_12135 ) ) ( not ( = ?auto_12117 ?auto_12135 ) ) ( not ( = ?auto_12124 ?auto_12138 ) ) ( IS-CRATE ?auto_12116 ) ( not ( = ?auto_12131 ?auto_12123 ) ) ( HOIST-AT ?auto_12140 ?auto_12131 ) ( AVAILABLE ?auto_12140 ) ( SURFACE-AT ?auto_12116 ?auto_12131 ) ( ON ?auto_12116 ?auto_12141 ) ( CLEAR ?auto_12116 ) ( not ( = ?auto_12115 ?auto_12116 ) ) ( not ( = ?auto_12115 ?auto_12141 ) ) ( not ( = ?auto_12116 ?auto_12141 ) ) ( not ( = ?auto_12124 ?auto_12140 ) ) ( IS-CRATE ?auto_12115 ) ( not ( = ?auto_12139 ?auto_12123 ) ) ( HOIST-AT ?auto_12134 ?auto_12139 ) ( SURFACE-AT ?auto_12115 ?auto_12139 ) ( ON ?auto_12115 ?auto_12132 ) ( CLEAR ?auto_12115 ) ( not ( = ?auto_12114 ?auto_12115 ) ) ( not ( = ?auto_12114 ?auto_12132 ) ) ( not ( = ?auto_12115 ?auto_12132 ) ) ( not ( = ?auto_12124 ?auto_12134 ) ) ( IS-CRATE ?auto_12114 ) ( not ( = ?auto_12130 ?auto_12123 ) ) ( HOIST-AT ?auto_12133 ?auto_12130 ) ( AVAILABLE ?auto_12133 ) ( SURFACE-AT ?auto_12114 ?auto_12130 ) ( ON ?auto_12114 ?auto_12136 ) ( CLEAR ?auto_12114 ) ( not ( = ?auto_12113 ?auto_12114 ) ) ( not ( = ?auto_12113 ?auto_12136 ) ) ( not ( = ?auto_12114 ?auto_12136 ) ) ( not ( = ?auto_12124 ?auto_12133 ) ) ( SURFACE-AT ?auto_12112 ?auto_12123 ) ( CLEAR ?auto_12112 ) ( IS-CRATE ?auto_12113 ) ( AVAILABLE ?auto_12124 ) ( AVAILABLE ?auto_12134 ) ( SURFACE-AT ?auto_12113 ?auto_12139 ) ( ON ?auto_12113 ?auto_12137 ) ( CLEAR ?auto_12113 ) ( TRUCK-AT ?auto_12122 ?auto_12123 ) ( not ( = ?auto_12112 ?auto_12113 ) ) ( not ( = ?auto_12112 ?auto_12137 ) ) ( not ( = ?auto_12113 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12114 ) ) ( not ( = ?auto_12112 ?auto_12136 ) ) ( not ( = ?auto_12114 ?auto_12137 ) ) ( not ( = ?auto_12130 ?auto_12139 ) ) ( not ( = ?auto_12133 ?auto_12134 ) ) ( not ( = ?auto_12136 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12115 ) ) ( not ( = ?auto_12112 ?auto_12132 ) ) ( not ( = ?auto_12113 ?auto_12115 ) ) ( not ( = ?auto_12113 ?auto_12132 ) ) ( not ( = ?auto_12115 ?auto_12136 ) ) ( not ( = ?auto_12115 ?auto_12137 ) ) ( not ( = ?auto_12132 ?auto_12136 ) ) ( not ( = ?auto_12132 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12116 ) ) ( not ( = ?auto_12112 ?auto_12141 ) ) ( not ( = ?auto_12113 ?auto_12116 ) ) ( not ( = ?auto_12113 ?auto_12141 ) ) ( not ( = ?auto_12114 ?auto_12116 ) ) ( not ( = ?auto_12114 ?auto_12141 ) ) ( not ( = ?auto_12116 ?auto_12132 ) ) ( not ( = ?auto_12116 ?auto_12136 ) ) ( not ( = ?auto_12116 ?auto_12137 ) ) ( not ( = ?auto_12131 ?auto_12139 ) ) ( not ( = ?auto_12131 ?auto_12130 ) ) ( not ( = ?auto_12140 ?auto_12134 ) ) ( not ( = ?auto_12140 ?auto_12133 ) ) ( not ( = ?auto_12141 ?auto_12132 ) ) ( not ( = ?auto_12141 ?auto_12136 ) ) ( not ( = ?auto_12141 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12117 ) ) ( not ( = ?auto_12112 ?auto_12135 ) ) ( not ( = ?auto_12113 ?auto_12117 ) ) ( not ( = ?auto_12113 ?auto_12135 ) ) ( not ( = ?auto_12114 ?auto_12117 ) ) ( not ( = ?auto_12114 ?auto_12135 ) ) ( not ( = ?auto_12115 ?auto_12117 ) ) ( not ( = ?auto_12115 ?auto_12135 ) ) ( not ( = ?auto_12117 ?auto_12141 ) ) ( not ( = ?auto_12117 ?auto_12132 ) ) ( not ( = ?auto_12117 ?auto_12136 ) ) ( not ( = ?auto_12117 ?auto_12137 ) ) ( not ( = ?auto_12144 ?auto_12131 ) ) ( not ( = ?auto_12144 ?auto_12139 ) ) ( not ( = ?auto_12144 ?auto_12130 ) ) ( not ( = ?auto_12138 ?auto_12140 ) ) ( not ( = ?auto_12138 ?auto_12134 ) ) ( not ( = ?auto_12138 ?auto_12133 ) ) ( not ( = ?auto_12135 ?auto_12141 ) ) ( not ( = ?auto_12135 ?auto_12132 ) ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12135 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12120 ) ) ( not ( = ?auto_12112 ?auto_12143 ) ) ( not ( = ?auto_12113 ?auto_12120 ) ) ( not ( = ?auto_12113 ?auto_12143 ) ) ( not ( = ?auto_12114 ?auto_12120 ) ) ( not ( = ?auto_12114 ?auto_12143 ) ) ( not ( = ?auto_12115 ?auto_12120 ) ) ( not ( = ?auto_12115 ?auto_12143 ) ) ( not ( = ?auto_12116 ?auto_12120 ) ) ( not ( = ?auto_12116 ?auto_12143 ) ) ( not ( = ?auto_12120 ?auto_12135 ) ) ( not ( = ?auto_12120 ?auto_12141 ) ) ( not ( = ?auto_12120 ?auto_12132 ) ) ( not ( = ?auto_12120 ?auto_12136 ) ) ( not ( = ?auto_12120 ?auto_12137 ) ) ( not ( = ?auto_12142 ?auto_12144 ) ) ( not ( = ?auto_12142 ?auto_12131 ) ) ( not ( = ?auto_12142 ?auto_12139 ) ) ( not ( = ?auto_12142 ?auto_12130 ) ) ( not ( = ?auto_12129 ?auto_12138 ) ) ( not ( = ?auto_12129 ?auto_12140 ) ) ( not ( = ?auto_12129 ?auto_12134 ) ) ( not ( = ?auto_12129 ?auto_12133 ) ) ( not ( = ?auto_12143 ?auto_12135 ) ) ( not ( = ?auto_12143 ?auto_12141 ) ) ( not ( = ?auto_12143 ?auto_12132 ) ) ( not ( = ?auto_12143 ?auto_12136 ) ) ( not ( = ?auto_12143 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12119 ) ) ( not ( = ?auto_12112 ?auto_12127 ) ) ( not ( = ?auto_12113 ?auto_12119 ) ) ( not ( = ?auto_12113 ?auto_12127 ) ) ( not ( = ?auto_12114 ?auto_12119 ) ) ( not ( = ?auto_12114 ?auto_12127 ) ) ( not ( = ?auto_12115 ?auto_12119 ) ) ( not ( = ?auto_12115 ?auto_12127 ) ) ( not ( = ?auto_12116 ?auto_12119 ) ) ( not ( = ?auto_12116 ?auto_12127 ) ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12117 ?auto_12127 ) ) ( not ( = ?auto_12119 ?auto_12143 ) ) ( not ( = ?auto_12119 ?auto_12135 ) ) ( not ( = ?auto_12119 ?auto_12141 ) ) ( not ( = ?auto_12119 ?auto_12132 ) ) ( not ( = ?auto_12119 ?auto_12136 ) ) ( not ( = ?auto_12119 ?auto_12137 ) ) ( not ( = ?auto_12145 ?auto_12142 ) ) ( not ( = ?auto_12145 ?auto_12144 ) ) ( not ( = ?auto_12145 ?auto_12131 ) ) ( not ( = ?auto_12145 ?auto_12139 ) ) ( not ( = ?auto_12145 ?auto_12130 ) ) ( not ( = ?auto_12128 ?auto_12129 ) ) ( not ( = ?auto_12128 ?auto_12138 ) ) ( not ( = ?auto_12128 ?auto_12140 ) ) ( not ( = ?auto_12128 ?auto_12134 ) ) ( not ( = ?auto_12128 ?auto_12133 ) ) ( not ( = ?auto_12127 ?auto_12143 ) ) ( not ( = ?auto_12127 ?auto_12135 ) ) ( not ( = ?auto_12127 ?auto_12141 ) ) ( not ( = ?auto_12127 ?auto_12132 ) ) ( not ( = ?auto_12127 ?auto_12136 ) ) ( not ( = ?auto_12127 ?auto_12137 ) ) ( not ( = ?auto_12112 ?auto_12118 ) ) ( not ( = ?auto_12112 ?auto_12125 ) ) ( not ( = ?auto_12113 ?auto_12118 ) ) ( not ( = ?auto_12113 ?auto_12125 ) ) ( not ( = ?auto_12114 ?auto_12118 ) ) ( not ( = ?auto_12114 ?auto_12125 ) ) ( not ( = ?auto_12115 ?auto_12118 ) ) ( not ( = ?auto_12115 ?auto_12125 ) ) ( not ( = ?auto_12116 ?auto_12118 ) ) ( not ( = ?auto_12116 ?auto_12125 ) ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12125 ) ) ( not ( = ?auto_12120 ?auto_12118 ) ) ( not ( = ?auto_12120 ?auto_12125 ) ) ( not ( = ?auto_12118 ?auto_12127 ) ) ( not ( = ?auto_12118 ?auto_12143 ) ) ( not ( = ?auto_12118 ?auto_12135 ) ) ( not ( = ?auto_12118 ?auto_12141 ) ) ( not ( = ?auto_12118 ?auto_12132 ) ) ( not ( = ?auto_12118 ?auto_12136 ) ) ( not ( = ?auto_12118 ?auto_12137 ) ) ( not ( = ?auto_12126 ?auto_12145 ) ) ( not ( = ?auto_12126 ?auto_12142 ) ) ( not ( = ?auto_12126 ?auto_12144 ) ) ( not ( = ?auto_12126 ?auto_12131 ) ) ( not ( = ?auto_12126 ?auto_12139 ) ) ( not ( = ?auto_12126 ?auto_12130 ) ) ( not ( = ?auto_12121 ?auto_12128 ) ) ( not ( = ?auto_12121 ?auto_12129 ) ) ( not ( = ?auto_12121 ?auto_12138 ) ) ( not ( = ?auto_12121 ?auto_12140 ) ) ( not ( = ?auto_12121 ?auto_12134 ) ) ( not ( = ?auto_12121 ?auto_12133 ) ) ( not ( = ?auto_12125 ?auto_12127 ) ) ( not ( = ?auto_12125 ?auto_12143 ) ) ( not ( = ?auto_12125 ?auto_12135 ) ) ( not ( = ?auto_12125 ?auto_12141 ) ) ( not ( = ?auto_12125 ?auto_12132 ) ) ( not ( = ?auto_12125 ?auto_12136 ) ) ( not ( = ?auto_12125 ?auto_12137 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12112 ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12120 ?auto_12119 )
      ( MAKE-1CRATE ?auto_12119 ?auto_12118 )
      ( MAKE-8CRATE-VERIFY ?auto_12112 ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12120 ?auto_12119 ?auto_12118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12148 - SURFACE
      ?auto_12149 - SURFACE
    )
    :vars
    (
      ?auto_12150 - HOIST
      ?auto_12151 - PLACE
      ?auto_12153 - PLACE
      ?auto_12154 - HOIST
      ?auto_12155 - SURFACE
      ?auto_12152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12150 ?auto_12151 ) ( SURFACE-AT ?auto_12148 ?auto_12151 ) ( CLEAR ?auto_12148 ) ( IS-CRATE ?auto_12149 ) ( AVAILABLE ?auto_12150 ) ( not ( = ?auto_12153 ?auto_12151 ) ) ( HOIST-AT ?auto_12154 ?auto_12153 ) ( AVAILABLE ?auto_12154 ) ( SURFACE-AT ?auto_12149 ?auto_12153 ) ( ON ?auto_12149 ?auto_12155 ) ( CLEAR ?auto_12149 ) ( TRUCK-AT ?auto_12152 ?auto_12151 ) ( not ( = ?auto_12148 ?auto_12149 ) ) ( not ( = ?auto_12148 ?auto_12155 ) ) ( not ( = ?auto_12149 ?auto_12155 ) ) ( not ( = ?auto_12150 ?auto_12154 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12152 ?auto_12151 ?auto_12153 )
      ( !LIFT ?auto_12154 ?auto_12149 ?auto_12155 ?auto_12153 )
      ( !LOAD ?auto_12154 ?auto_12149 ?auto_12152 ?auto_12153 )
      ( !DRIVE ?auto_12152 ?auto_12153 ?auto_12151 )
      ( !UNLOAD ?auto_12150 ?auto_12149 ?auto_12152 ?auto_12151 )
      ( !DROP ?auto_12150 ?auto_12149 ?auto_12148 ?auto_12151 )
      ( MAKE-1CRATE-VERIFY ?auto_12148 ?auto_12149 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12166 - SURFACE
      ?auto_12167 - SURFACE
      ?auto_12168 - SURFACE
      ?auto_12169 - SURFACE
      ?auto_12170 - SURFACE
      ?auto_12171 - SURFACE
      ?auto_12174 - SURFACE
      ?auto_12173 - SURFACE
      ?auto_12172 - SURFACE
      ?auto_12175 - SURFACE
    )
    :vars
    (
      ?auto_12179 - HOIST
      ?auto_12176 - PLACE
      ?auto_12178 - PLACE
      ?auto_12180 - HOIST
      ?auto_12177 - SURFACE
      ?auto_12194 - PLACE
      ?auto_12193 - HOIST
      ?auto_12182 - SURFACE
      ?auto_12199 - PLACE
      ?auto_12191 - HOIST
      ?auto_12197 - SURFACE
      ?auto_12200 - PLACE
      ?auto_12183 - HOIST
      ?auto_12198 - SURFACE
      ?auto_12196 - PLACE
      ?auto_12184 - HOIST
      ?auto_12201 - SURFACE
      ?auto_12190 - PLACE
      ?auto_12186 - HOIST
      ?auto_12195 - SURFACE
      ?auto_12185 - PLACE
      ?auto_12187 - HOIST
      ?auto_12189 - SURFACE
      ?auto_12192 - PLACE
      ?auto_12188 - HOIST
      ?auto_12203 - SURFACE
      ?auto_12202 - SURFACE
      ?auto_12181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12179 ?auto_12176 ) ( IS-CRATE ?auto_12175 ) ( not ( = ?auto_12178 ?auto_12176 ) ) ( HOIST-AT ?auto_12180 ?auto_12178 ) ( AVAILABLE ?auto_12180 ) ( SURFACE-AT ?auto_12175 ?auto_12178 ) ( ON ?auto_12175 ?auto_12177 ) ( CLEAR ?auto_12175 ) ( not ( = ?auto_12172 ?auto_12175 ) ) ( not ( = ?auto_12172 ?auto_12177 ) ) ( not ( = ?auto_12175 ?auto_12177 ) ) ( not ( = ?auto_12179 ?auto_12180 ) ) ( IS-CRATE ?auto_12172 ) ( not ( = ?auto_12194 ?auto_12176 ) ) ( HOIST-AT ?auto_12193 ?auto_12194 ) ( AVAILABLE ?auto_12193 ) ( SURFACE-AT ?auto_12172 ?auto_12194 ) ( ON ?auto_12172 ?auto_12182 ) ( CLEAR ?auto_12172 ) ( not ( = ?auto_12173 ?auto_12172 ) ) ( not ( = ?auto_12173 ?auto_12182 ) ) ( not ( = ?auto_12172 ?auto_12182 ) ) ( not ( = ?auto_12179 ?auto_12193 ) ) ( IS-CRATE ?auto_12173 ) ( not ( = ?auto_12199 ?auto_12176 ) ) ( HOIST-AT ?auto_12191 ?auto_12199 ) ( AVAILABLE ?auto_12191 ) ( SURFACE-AT ?auto_12173 ?auto_12199 ) ( ON ?auto_12173 ?auto_12197 ) ( CLEAR ?auto_12173 ) ( not ( = ?auto_12174 ?auto_12173 ) ) ( not ( = ?auto_12174 ?auto_12197 ) ) ( not ( = ?auto_12173 ?auto_12197 ) ) ( not ( = ?auto_12179 ?auto_12191 ) ) ( IS-CRATE ?auto_12174 ) ( not ( = ?auto_12200 ?auto_12176 ) ) ( HOIST-AT ?auto_12183 ?auto_12200 ) ( AVAILABLE ?auto_12183 ) ( SURFACE-AT ?auto_12174 ?auto_12200 ) ( ON ?auto_12174 ?auto_12198 ) ( CLEAR ?auto_12174 ) ( not ( = ?auto_12171 ?auto_12174 ) ) ( not ( = ?auto_12171 ?auto_12198 ) ) ( not ( = ?auto_12174 ?auto_12198 ) ) ( not ( = ?auto_12179 ?auto_12183 ) ) ( IS-CRATE ?auto_12171 ) ( not ( = ?auto_12196 ?auto_12176 ) ) ( HOIST-AT ?auto_12184 ?auto_12196 ) ( AVAILABLE ?auto_12184 ) ( SURFACE-AT ?auto_12171 ?auto_12196 ) ( ON ?auto_12171 ?auto_12201 ) ( CLEAR ?auto_12171 ) ( not ( = ?auto_12170 ?auto_12171 ) ) ( not ( = ?auto_12170 ?auto_12201 ) ) ( not ( = ?auto_12171 ?auto_12201 ) ) ( not ( = ?auto_12179 ?auto_12184 ) ) ( IS-CRATE ?auto_12170 ) ( not ( = ?auto_12190 ?auto_12176 ) ) ( HOIST-AT ?auto_12186 ?auto_12190 ) ( AVAILABLE ?auto_12186 ) ( SURFACE-AT ?auto_12170 ?auto_12190 ) ( ON ?auto_12170 ?auto_12195 ) ( CLEAR ?auto_12170 ) ( not ( = ?auto_12169 ?auto_12170 ) ) ( not ( = ?auto_12169 ?auto_12195 ) ) ( not ( = ?auto_12170 ?auto_12195 ) ) ( not ( = ?auto_12179 ?auto_12186 ) ) ( IS-CRATE ?auto_12169 ) ( not ( = ?auto_12185 ?auto_12176 ) ) ( HOIST-AT ?auto_12187 ?auto_12185 ) ( SURFACE-AT ?auto_12169 ?auto_12185 ) ( ON ?auto_12169 ?auto_12189 ) ( CLEAR ?auto_12169 ) ( not ( = ?auto_12168 ?auto_12169 ) ) ( not ( = ?auto_12168 ?auto_12189 ) ) ( not ( = ?auto_12169 ?auto_12189 ) ) ( not ( = ?auto_12179 ?auto_12187 ) ) ( IS-CRATE ?auto_12168 ) ( not ( = ?auto_12192 ?auto_12176 ) ) ( HOIST-AT ?auto_12188 ?auto_12192 ) ( AVAILABLE ?auto_12188 ) ( SURFACE-AT ?auto_12168 ?auto_12192 ) ( ON ?auto_12168 ?auto_12203 ) ( CLEAR ?auto_12168 ) ( not ( = ?auto_12167 ?auto_12168 ) ) ( not ( = ?auto_12167 ?auto_12203 ) ) ( not ( = ?auto_12168 ?auto_12203 ) ) ( not ( = ?auto_12179 ?auto_12188 ) ) ( SURFACE-AT ?auto_12166 ?auto_12176 ) ( CLEAR ?auto_12166 ) ( IS-CRATE ?auto_12167 ) ( AVAILABLE ?auto_12179 ) ( AVAILABLE ?auto_12187 ) ( SURFACE-AT ?auto_12167 ?auto_12185 ) ( ON ?auto_12167 ?auto_12202 ) ( CLEAR ?auto_12167 ) ( TRUCK-AT ?auto_12181 ?auto_12176 ) ( not ( = ?auto_12166 ?auto_12167 ) ) ( not ( = ?auto_12166 ?auto_12202 ) ) ( not ( = ?auto_12167 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12168 ) ) ( not ( = ?auto_12166 ?auto_12203 ) ) ( not ( = ?auto_12168 ?auto_12202 ) ) ( not ( = ?auto_12192 ?auto_12185 ) ) ( not ( = ?auto_12188 ?auto_12187 ) ) ( not ( = ?auto_12203 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12169 ) ) ( not ( = ?auto_12166 ?auto_12189 ) ) ( not ( = ?auto_12167 ?auto_12169 ) ) ( not ( = ?auto_12167 ?auto_12189 ) ) ( not ( = ?auto_12169 ?auto_12203 ) ) ( not ( = ?auto_12169 ?auto_12202 ) ) ( not ( = ?auto_12189 ?auto_12203 ) ) ( not ( = ?auto_12189 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12170 ) ) ( not ( = ?auto_12166 ?auto_12195 ) ) ( not ( = ?auto_12167 ?auto_12170 ) ) ( not ( = ?auto_12167 ?auto_12195 ) ) ( not ( = ?auto_12168 ?auto_12170 ) ) ( not ( = ?auto_12168 ?auto_12195 ) ) ( not ( = ?auto_12170 ?auto_12189 ) ) ( not ( = ?auto_12170 ?auto_12203 ) ) ( not ( = ?auto_12170 ?auto_12202 ) ) ( not ( = ?auto_12190 ?auto_12185 ) ) ( not ( = ?auto_12190 ?auto_12192 ) ) ( not ( = ?auto_12186 ?auto_12187 ) ) ( not ( = ?auto_12186 ?auto_12188 ) ) ( not ( = ?auto_12195 ?auto_12189 ) ) ( not ( = ?auto_12195 ?auto_12203 ) ) ( not ( = ?auto_12195 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12171 ) ) ( not ( = ?auto_12166 ?auto_12201 ) ) ( not ( = ?auto_12167 ?auto_12171 ) ) ( not ( = ?auto_12167 ?auto_12201 ) ) ( not ( = ?auto_12168 ?auto_12171 ) ) ( not ( = ?auto_12168 ?auto_12201 ) ) ( not ( = ?auto_12169 ?auto_12171 ) ) ( not ( = ?auto_12169 ?auto_12201 ) ) ( not ( = ?auto_12171 ?auto_12195 ) ) ( not ( = ?auto_12171 ?auto_12189 ) ) ( not ( = ?auto_12171 ?auto_12203 ) ) ( not ( = ?auto_12171 ?auto_12202 ) ) ( not ( = ?auto_12196 ?auto_12190 ) ) ( not ( = ?auto_12196 ?auto_12185 ) ) ( not ( = ?auto_12196 ?auto_12192 ) ) ( not ( = ?auto_12184 ?auto_12186 ) ) ( not ( = ?auto_12184 ?auto_12187 ) ) ( not ( = ?auto_12184 ?auto_12188 ) ) ( not ( = ?auto_12201 ?auto_12195 ) ) ( not ( = ?auto_12201 ?auto_12189 ) ) ( not ( = ?auto_12201 ?auto_12203 ) ) ( not ( = ?auto_12201 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12174 ) ) ( not ( = ?auto_12166 ?auto_12198 ) ) ( not ( = ?auto_12167 ?auto_12174 ) ) ( not ( = ?auto_12167 ?auto_12198 ) ) ( not ( = ?auto_12168 ?auto_12174 ) ) ( not ( = ?auto_12168 ?auto_12198 ) ) ( not ( = ?auto_12169 ?auto_12174 ) ) ( not ( = ?auto_12169 ?auto_12198 ) ) ( not ( = ?auto_12170 ?auto_12174 ) ) ( not ( = ?auto_12170 ?auto_12198 ) ) ( not ( = ?auto_12174 ?auto_12201 ) ) ( not ( = ?auto_12174 ?auto_12195 ) ) ( not ( = ?auto_12174 ?auto_12189 ) ) ( not ( = ?auto_12174 ?auto_12203 ) ) ( not ( = ?auto_12174 ?auto_12202 ) ) ( not ( = ?auto_12200 ?auto_12196 ) ) ( not ( = ?auto_12200 ?auto_12190 ) ) ( not ( = ?auto_12200 ?auto_12185 ) ) ( not ( = ?auto_12200 ?auto_12192 ) ) ( not ( = ?auto_12183 ?auto_12184 ) ) ( not ( = ?auto_12183 ?auto_12186 ) ) ( not ( = ?auto_12183 ?auto_12187 ) ) ( not ( = ?auto_12183 ?auto_12188 ) ) ( not ( = ?auto_12198 ?auto_12201 ) ) ( not ( = ?auto_12198 ?auto_12195 ) ) ( not ( = ?auto_12198 ?auto_12189 ) ) ( not ( = ?auto_12198 ?auto_12203 ) ) ( not ( = ?auto_12198 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12173 ) ) ( not ( = ?auto_12166 ?auto_12197 ) ) ( not ( = ?auto_12167 ?auto_12173 ) ) ( not ( = ?auto_12167 ?auto_12197 ) ) ( not ( = ?auto_12168 ?auto_12173 ) ) ( not ( = ?auto_12168 ?auto_12197 ) ) ( not ( = ?auto_12169 ?auto_12173 ) ) ( not ( = ?auto_12169 ?auto_12197 ) ) ( not ( = ?auto_12170 ?auto_12173 ) ) ( not ( = ?auto_12170 ?auto_12197 ) ) ( not ( = ?auto_12171 ?auto_12173 ) ) ( not ( = ?auto_12171 ?auto_12197 ) ) ( not ( = ?auto_12173 ?auto_12198 ) ) ( not ( = ?auto_12173 ?auto_12201 ) ) ( not ( = ?auto_12173 ?auto_12195 ) ) ( not ( = ?auto_12173 ?auto_12189 ) ) ( not ( = ?auto_12173 ?auto_12203 ) ) ( not ( = ?auto_12173 ?auto_12202 ) ) ( not ( = ?auto_12199 ?auto_12200 ) ) ( not ( = ?auto_12199 ?auto_12196 ) ) ( not ( = ?auto_12199 ?auto_12190 ) ) ( not ( = ?auto_12199 ?auto_12185 ) ) ( not ( = ?auto_12199 ?auto_12192 ) ) ( not ( = ?auto_12191 ?auto_12183 ) ) ( not ( = ?auto_12191 ?auto_12184 ) ) ( not ( = ?auto_12191 ?auto_12186 ) ) ( not ( = ?auto_12191 ?auto_12187 ) ) ( not ( = ?auto_12191 ?auto_12188 ) ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12201 ) ) ( not ( = ?auto_12197 ?auto_12195 ) ) ( not ( = ?auto_12197 ?auto_12189 ) ) ( not ( = ?auto_12197 ?auto_12203 ) ) ( not ( = ?auto_12197 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12172 ) ) ( not ( = ?auto_12166 ?auto_12182 ) ) ( not ( = ?auto_12167 ?auto_12172 ) ) ( not ( = ?auto_12167 ?auto_12182 ) ) ( not ( = ?auto_12168 ?auto_12172 ) ) ( not ( = ?auto_12168 ?auto_12182 ) ) ( not ( = ?auto_12169 ?auto_12172 ) ) ( not ( = ?auto_12169 ?auto_12182 ) ) ( not ( = ?auto_12170 ?auto_12172 ) ) ( not ( = ?auto_12170 ?auto_12182 ) ) ( not ( = ?auto_12171 ?auto_12172 ) ) ( not ( = ?auto_12171 ?auto_12182 ) ) ( not ( = ?auto_12174 ?auto_12172 ) ) ( not ( = ?auto_12174 ?auto_12182 ) ) ( not ( = ?auto_12172 ?auto_12197 ) ) ( not ( = ?auto_12172 ?auto_12198 ) ) ( not ( = ?auto_12172 ?auto_12201 ) ) ( not ( = ?auto_12172 ?auto_12195 ) ) ( not ( = ?auto_12172 ?auto_12189 ) ) ( not ( = ?auto_12172 ?auto_12203 ) ) ( not ( = ?auto_12172 ?auto_12202 ) ) ( not ( = ?auto_12194 ?auto_12199 ) ) ( not ( = ?auto_12194 ?auto_12200 ) ) ( not ( = ?auto_12194 ?auto_12196 ) ) ( not ( = ?auto_12194 ?auto_12190 ) ) ( not ( = ?auto_12194 ?auto_12185 ) ) ( not ( = ?auto_12194 ?auto_12192 ) ) ( not ( = ?auto_12193 ?auto_12191 ) ) ( not ( = ?auto_12193 ?auto_12183 ) ) ( not ( = ?auto_12193 ?auto_12184 ) ) ( not ( = ?auto_12193 ?auto_12186 ) ) ( not ( = ?auto_12193 ?auto_12187 ) ) ( not ( = ?auto_12193 ?auto_12188 ) ) ( not ( = ?auto_12182 ?auto_12197 ) ) ( not ( = ?auto_12182 ?auto_12198 ) ) ( not ( = ?auto_12182 ?auto_12201 ) ) ( not ( = ?auto_12182 ?auto_12195 ) ) ( not ( = ?auto_12182 ?auto_12189 ) ) ( not ( = ?auto_12182 ?auto_12203 ) ) ( not ( = ?auto_12182 ?auto_12202 ) ) ( not ( = ?auto_12166 ?auto_12175 ) ) ( not ( = ?auto_12166 ?auto_12177 ) ) ( not ( = ?auto_12167 ?auto_12175 ) ) ( not ( = ?auto_12167 ?auto_12177 ) ) ( not ( = ?auto_12168 ?auto_12175 ) ) ( not ( = ?auto_12168 ?auto_12177 ) ) ( not ( = ?auto_12169 ?auto_12175 ) ) ( not ( = ?auto_12169 ?auto_12177 ) ) ( not ( = ?auto_12170 ?auto_12175 ) ) ( not ( = ?auto_12170 ?auto_12177 ) ) ( not ( = ?auto_12171 ?auto_12175 ) ) ( not ( = ?auto_12171 ?auto_12177 ) ) ( not ( = ?auto_12174 ?auto_12175 ) ) ( not ( = ?auto_12174 ?auto_12177 ) ) ( not ( = ?auto_12173 ?auto_12175 ) ) ( not ( = ?auto_12173 ?auto_12177 ) ) ( not ( = ?auto_12175 ?auto_12182 ) ) ( not ( = ?auto_12175 ?auto_12197 ) ) ( not ( = ?auto_12175 ?auto_12198 ) ) ( not ( = ?auto_12175 ?auto_12201 ) ) ( not ( = ?auto_12175 ?auto_12195 ) ) ( not ( = ?auto_12175 ?auto_12189 ) ) ( not ( = ?auto_12175 ?auto_12203 ) ) ( not ( = ?auto_12175 ?auto_12202 ) ) ( not ( = ?auto_12178 ?auto_12194 ) ) ( not ( = ?auto_12178 ?auto_12199 ) ) ( not ( = ?auto_12178 ?auto_12200 ) ) ( not ( = ?auto_12178 ?auto_12196 ) ) ( not ( = ?auto_12178 ?auto_12190 ) ) ( not ( = ?auto_12178 ?auto_12185 ) ) ( not ( = ?auto_12178 ?auto_12192 ) ) ( not ( = ?auto_12180 ?auto_12193 ) ) ( not ( = ?auto_12180 ?auto_12191 ) ) ( not ( = ?auto_12180 ?auto_12183 ) ) ( not ( = ?auto_12180 ?auto_12184 ) ) ( not ( = ?auto_12180 ?auto_12186 ) ) ( not ( = ?auto_12180 ?auto_12187 ) ) ( not ( = ?auto_12180 ?auto_12188 ) ) ( not ( = ?auto_12177 ?auto_12182 ) ) ( not ( = ?auto_12177 ?auto_12197 ) ) ( not ( = ?auto_12177 ?auto_12198 ) ) ( not ( = ?auto_12177 ?auto_12201 ) ) ( not ( = ?auto_12177 ?auto_12195 ) ) ( not ( = ?auto_12177 ?auto_12189 ) ) ( not ( = ?auto_12177 ?auto_12203 ) ) ( not ( = ?auto_12177 ?auto_12202 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12166 ?auto_12167 ?auto_12168 ?auto_12169 ?auto_12170 ?auto_12171 ?auto_12174 ?auto_12173 ?auto_12172 )
      ( MAKE-1CRATE ?auto_12172 ?auto_12175 )
      ( MAKE-9CRATE-VERIFY ?auto_12166 ?auto_12167 ?auto_12168 ?auto_12169 ?auto_12170 ?auto_12171 ?auto_12174 ?auto_12173 ?auto_12172 ?auto_12175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12206 - SURFACE
      ?auto_12207 - SURFACE
    )
    :vars
    (
      ?auto_12208 - HOIST
      ?auto_12209 - PLACE
      ?auto_12211 - PLACE
      ?auto_12212 - HOIST
      ?auto_12213 - SURFACE
      ?auto_12210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12208 ?auto_12209 ) ( SURFACE-AT ?auto_12206 ?auto_12209 ) ( CLEAR ?auto_12206 ) ( IS-CRATE ?auto_12207 ) ( AVAILABLE ?auto_12208 ) ( not ( = ?auto_12211 ?auto_12209 ) ) ( HOIST-AT ?auto_12212 ?auto_12211 ) ( AVAILABLE ?auto_12212 ) ( SURFACE-AT ?auto_12207 ?auto_12211 ) ( ON ?auto_12207 ?auto_12213 ) ( CLEAR ?auto_12207 ) ( TRUCK-AT ?auto_12210 ?auto_12209 ) ( not ( = ?auto_12206 ?auto_12207 ) ) ( not ( = ?auto_12206 ?auto_12213 ) ) ( not ( = ?auto_12207 ?auto_12213 ) ) ( not ( = ?auto_12208 ?auto_12212 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12210 ?auto_12209 ?auto_12211 )
      ( !LIFT ?auto_12212 ?auto_12207 ?auto_12213 ?auto_12211 )
      ( !LOAD ?auto_12212 ?auto_12207 ?auto_12210 ?auto_12211 )
      ( !DRIVE ?auto_12210 ?auto_12211 ?auto_12209 )
      ( !UNLOAD ?auto_12208 ?auto_12207 ?auto_12210 ?auto_12209 )
      ( !DROP ?auto_12208 ?auto_12207 ?auto_12206 ?auto_12209 )
      ( MAKE-1CRATE-VERIFY ?auto_12206 ?auto_12207 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12225 - SURFACE
      ?auto_12226 - SURFACE
      ?auto_12227 - SURFACE
      ?auto_12228 - SURFACE
      ?auto_12229 - SURFACE
      ?auto_12230 - SURFACE
      ?auto_12233 - SURFACE
      ?auto_12232 - SURFACE
      ?auto_12231 - SURFACE
      ?auto_12234 - SURFACE
      ?auto_12235 - SURFACE
    )
    :vars
    (
      ?auto_12241 - HOIST
      ?auto_12237 - PLACE
      ?auto_12240 - PLACE
      ?auto_12238 - HOIST
      ?auto_12236 - SURFACE
      ?auto_12259 - PLACE
      ?auto_12264 - HOIST
      ?auto_12242 - SURFACE
      ?auto_12249 - PLACE
      ?auto_12262 - HOIST
      ?auto_12248 - SURFACE
      ?auto_12265 - PLACE
      ?auto_12251 - HOIST
      ?auto_12258 - SURFACE
      ?auto_12263 - PLACE
      ?auto_12255 - HOIST
      ?auto_12247 - SURFACE
      ?auto_12256 - PLACE
      ?auto_12246 - HOIST
      ?auto_12261 - SURFACE
      ?auto_12244 - PLACE
      ?auto_12254 - HOIST
      ?auto_12250 - SURFACE
      ?auto_12266 - PLACE
      ?auto_12253 - HOIST
      ?auto_12257 - SURFACE
      ?auto_12245 - PLACE
      ?auto_12252 - HOIST
      ?auto_12243 - SURFACE
      ?auto_12260 - SURFACE
      ?auto_12239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12241 ?auto_12237 ) ( IS-CRATE ?auto_12235 ) ( not ( = ?auto_12240 ?auto_12237 ) ) ( HOIST-AT ?auto_12238 ?auto_12240 ) ( AVAILABLE ?auto_12238 ) ( SURFACE-AT ?auto_12235 ?auto_12240 ) ( ON ?auto_12235 ?auto_12236 ) ( CLEAR ?auto_12235 ) ( not ( = ?auto_12234 ?auto_12235 ) ) ( not ( = ?auto_12234 ?auto_12236 ) ) ( not ( = ?auto_12235 ?auto_12236 ) ) ( not ( = ?auto_12241 ?auto_12238 ) ) ( IS-CRATE ?auto_12234 ) ( not ( = ?auto_12259 ?auto_12237 ) ) ( HOIST-AT ?auto_12264 ?auto_12259 ) ( AVAILABLE ?auto_12264 ) ( SURFACE-AT ?auto_12234 ?auto_12259 ) ( ON ?auto_12234 ?auto_12242 ) ( CLEAR ?auto_12234 ) ( not ( = ?auto_12231 ?auto_12234 ) ) ( not ( = ?auto_12231 ?auto_12242 ) ) ( not ( = ?auto_12234 ?auto_12242 ) ) ( not ( = ?auto_12241 ?auto_12264 ) ) ( IS-CRATE ?auto_12231 ) ( not ( = ?auto_12249 ?auto_12237 ) ) ( HOIST-AT ?auto_12262 ?auto_12249 ) ( AVAILABLE ?auto_12262 ) ( SURFACE-AT ?auto_12231 ?auto_12249 ) ( ON ?auto_12231 ?auto_12248 ) ( CLEAR ?auto_12231 ) ( not ( = ?auto_12232 ?auto_12231 ) ) ( not ( = ?auto_12232 ?auto_12248 ) ) ( not ( = ?auto_12231 ?auto_12248 ) ) ( not ( = ?auto_12241 ?auto_12262 ) ) ( IS-CRATE ?auto_12232 ) ( not ( = ?auto_12265 ?auto_12237 ) ) ( HOIST-AT ?auto_12251 ?auto_12265 ) ( AVAILABLE ?auto_12251 ) ( SURFACE-AT ?auto_12232 ?auto_12265 ) ( ON ?auto_12232 ?auto_12258 ) ( CLEAR ?auto_12232 ) ( not ( = ?auto_12233 ?auto_12232 ) ) ( not ( = ?auto_12233 ?auto_12258 ) ) ( not ( = ?auto_12232 ?auto_12258 ) ) ( not ( = ?auto_12241 ?auto_12251 ) ) ( IS-CRATE ?auto_12233 ) ( not ( = ?auto_12263 ?auto_12237 ) ) ( HOIST-AT ?auto_12255 ?auto_12263 ) ( AVAILABLE ?auto_12255 ) ( SURFACE-AT ?auto_12233 ?auto_12263 ) ( ON ?auto_12233 ?auto_12247 ) ( CLEAR ?auto_12233 ) ( not ( = ?auto_12230 ?auto_12233 ) ) ( not ( = ?auto_12230 ?auto_12247 ) ) ( not ( = ?auto_12233 ?auto_12247 ) ) ( not ( = ?auto_12241 ?auto_12255 ) ) ( IS-CRATE ?auto_12230 ) ( not ( = ?auto_12256 ?auto_12237 ) ) ( HOIST-AT ?auto_12246 ?auto_12256 ) ( AVAILABLE ?auto_12246 ) ( SURFACE-AT ?auto_12230 ?auto_12256 ) ( ON ?auto_12230 ?auto_12261 ) ( CLEAR ?auto_12230 ) ( not ( = ?auto_12229 ?auto_12230 ) ) ( not ( = ?auto_12229 ?auto_12261 ) ) ( not ( = ?auto_12230 ?auto_12261 ) ) ( not ( = ?auto_12241 ?auto_12246 ) ) ( IS-CRATE ?auto_12229 ) ( not ( = ?auto_12244 ?auto_12237 ) ) ( HOIST-AT ?auto_12254 ?auto_12244 ) ( AVAILABLE ?auto_12254 ) ( SURFACE-AT ?auto_12229 ?auto_12244 ) ( ON ?auto_12229 ?auto_12250 ) ( CLEAR ?auto_12229 ) ( not ( = ?auto_12228 ?auto_12229 ) ) ( not ( = ?auto_12228 ?auto_12250 ) ) ( not ( = ?auto_12229 ?auto_12250 ) ) ( not ( = ?auto_12241 ?auto_12254 ) ) ( IS-CRATE ?auto_12228 ) ( not ( = ?auto_12266 ?auto_12237 ) ) ( HOIST-AT ?auto_12253 ?auto_12266 ) ( SURFACE-AT ?auto_12228 ?auto_12266 ) ( ON ?auto_12228 ?auto_12257 ) ( CLEAR ?auto_12228 ) ( not ( = ?auto_12227 ?auto_12228 ) ) ( not ( = ?auto_12227 ?auto_12257 ) ) ( not ( = ?auto_12228 ?auto_12257 ) ) ( not ( = ?auto_12241 ?auto_12253 ) ) ( IS-CRATE ?auto_12227 ) ( not ( = ?auto_12245 ?auto_12237 ) ) ( HOIST-AT ?auto_12252 ?auto_12245 ) ( AVAILABLE ?auto_12252 ) ( SURFACE-AT ?auto_12227 ?auto_12245 ) ( ON ?auto_12227 ?auto_12243 ) ( CLEAR ?auto_12227 ) ( not ( = ?auto_12226 ?auto_12227 ) ) ( not ( = ?auto_12226 ?auto_12243 ) ) ( not ( = ?auto_12227 ?auto_12243 ) ) ( not ( = ?auto_12241 ?auto_12252 ) ) ( SURFACE-AT ?auto_12225 ?auto_12237 ) ( CLEAR ?auto_12225 ) ( IS-CRATE ?auto_12226 ) ( AVAILABLE ?auto_12241 ) ( AVAILABLE ?auto_12253 ) ( SURFACE-AT ?auto_12226 ?auto_12266 ) ( ON ?auto_12226 ?auto_12260 ) ( CLEAR ?auto_12226 ) ( TRUCK-AT ?auto_12239 ?auto_12237 ) ( not ( = ?auto_12225 ?auto_12226 ) ) ( not ( = ?auto_12225 ?auto_12260 ) ) ( not ( = ?auto_12226 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12227 ) ) ( not ( = ?auto_12225 ?auto_12243 ) ) ( not ( = ?auto_12227 ?auto_12260 ) ) ( not ( = ?auto_12245 ?auto_12266 ) ) ( not ( = ?auto_12252 ?auto_12253 ) ) ( not ( = ?auto_12243 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12228 ) ) ( not ( = ?auto_12225 ?auto_12257 ) ) ( not ( = ?auto_12226 ?auto_12228 ) ) ( not ( = ?auto_12226 ?auto_12257 ) ) ( not ( = ?auto_12228 ?auto_12243 ) ) ( not ( = ?auto_12228 ?auto_12260 ) ) ( not ( = ?auto_12257 ?auto_12243 ) ) ( not ( = ?auto_12257 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12229 ) ) ( not ( = ?auto_12225 ?auto_12250 ) ) ( not ( = ?auto_12226 ?auto_12229 ) ) ( not ( = ?auto_12226 ?auto_12250 ) ) ( not ( = ?auto_12227 ?auto_12229 ) ) ( not ( = ?auto_12227 ?auto_12250 ) ) ( not ( = ?auto_12229 ?auto_12257 ) ) ( not ( = ?auto_12229 ?auto_12243 ) ) ( not ( = ?auto_12229 ?auto_12260 ) ) ( not ( = ?auto_12244 ?auto_12266 ) ) ( not ( = ?auto_12244 ?auto_12245 ) ) ( not ( = ?auto_12254 ?auto_12253 ) ) ( not ( = ?auto_12254 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12257 ) ) ( not ( = ?auto_12250 ?auto_12243 ) ) ( not ( = ?auto_12250 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12230 ) ) ( not ( = ?auto_12225 ?auto_12261 ) ) ( not ( = ?auto_12226 ?auto_12230 ) ) ( not ( = ?auto_12226 ?auto_12261 ) ) ( not ( = ?auto_12227 ?auto_12230 ) ) ( not ( = ?auto_12227 ?auto_12261 ) ) ( not ( = ?auto_12228 ?auto_12230 ) ) ( not ( = ?auto_12228 ?auto_12261 ) ) ( not ( = ?auto_12230 ?auto_12250 ) ) ( not ( = ?auto_12230 ?auto_12257 ) ) ( not ( = ?auto_12230 ?auto_12243 ) ) ( not ( = ?auto_12230 ?auto_12260 ) ) ( not ( = ?auto_12256 ?auto_12244 ) ) ( not ( = ?auto_12256 ?auto_12266 ) ) ( not ( = ?auto_12256 ?auto_12245 ) ) ( not ( = ?auto_12246 ?auto_12254 ) ) ( not ( = ?auto_12246 ?auto_12253 ) ) ( not ( = ?auto_12246 ?auto_12252 ) ) ( not ( = ?auto_12261 ?auto_12250 ) ) ( not ( = ?auto_12261 ?auto_12257 ) ) ( not ( = ?auto_12261 ?auto_12243 ) ) ( not ( = ?auto_12261 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12233 ) ) ( not ( = ?auto_12225 ?auto_12247 ) ) ( not ( = ?auto_12226 ?auto_12233 ) ) ( not ( = ?auto_12226 ?auto_12247 ) ) ( not ( = ?auto_12227 ?auto_12233 ) ) ( not ( = ?auto_12227 ?auto_12247 ) ) ( not ( = ?auto_12228 ?auto_12233 ) ) ( not ( = ?auto_12228 ?auto_12247 ) ) ( not ( = ?auto_12229 ?auto_12233 ) ) ( not ( = ?auto_12229 ?auto_12247 ) ) ( not ( = ?auto_12233 ?auto_12261 ) ) ( not ( = ?auto_12233 ?auto_12250 ) ) ( not ( = ?auto_12233 ?auto_12257 ) ) ( not ( = ?auto_12233 ?auto_12243 ) ) ( not ( = ?auto_12233 ?auto_12260 ) ) ( not ( = ?auto_12263 ?auto_12256 ) ) ( not ( = ?auto_12263 ?auto_12244 ) ) ( not ( = ?auto_12263 ?auto_12266 ) ) ( not ( = ?auto_12263 ?auto_12245 ) ) ( not ( = ?auto_12255 ?auto_12246 ) ) ( not ( = ?auto_12255 ?auto_12254 ) ) ( not ( = ?auto_12255 ?auto_12253 ) ) ( not ( = ?auto_12255 ?auto_12252 ) ) ( not ( = ?auto_12247 ?auto_12261 ) ) ( not ( = ?auto_12247 ?auto_12250 ) ) ( not ( = ?auto_12247 ?auto_12257 ) ) ( not ( = ?auto_12247 ?auto_12243 ) ) ( not ( = ?auto_12247 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12232 ) ) ( not ( = ?auto_12225 ?auto_12258 ) ) ( not ( = ?auto_12226 ?auto_12232 ) ) ( not ( = ?auto_12226 ?auto_12258 ) ) ( not ( = ?auto_12227 ?auto_12232 ) ) ( not ( = ?auto_12227 ?auto_12258 ) ) ( not ( = ?auto_12228 ?auto_12232 ) ) ( not ( = ?auto_12228 ?auto_12258 ) ) ( not ( = ?auto_12229 ?auto_12232 ) ) ( not ( = ?auto_12229 ?auto_12258 ) ) ( not ( = ?auto_12230 ?auto_12232 ) ) ( not ( = ?auto_12230 ?auto_12258 ) ) ( not ( = ?auto_12232 ?auto_12247 ) ) ( not ( = ?auto_12232 ?auto_12261 ) ) ( not ( = ?auto_12232 ?auto_12250 ) ) ( not ( = ?auto_12232 ?auto_12257 ) ) ( not ( = ?auto_12232 ?auto_12243 ) ) ( not ( = ?auto_12232 ?auto_12260 ) ) ( not ( = ?auto_12265 ?auto_12263 ) ) ( not ( = ?auto_12265 ?auto_12256 ) ) ( not ( = ?auto_12265 ?auto_12244 ) ) ( not ( = ?auto_12265 ?auto_12266 ) ) ( not ( = ?auto_12265 ?auto_12245 ) ) ( not ( = ?auto_12251 ?auto_12255 ) ) ( not ( = ?auto_12251 ?auto_12246 ) ) ( not ( = ?auto_12251 ?auto_12254 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12258 ?auto_12247 ) ) ( not ( = ?auto_12258 ?auto_12261 ) ) ( not ( = ?auto_12258 ?auto_12250 ) ) ( not ( = ?auto_12258 ?auto_12257 ) ) ( not ( = ?auto_12258 ?auto_12243 ) ) ( not ( = ?auto_12258 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12231 ) ) ( not ( = ?auto_12225 ?auto_12248 ) ) ( not ( = ?auto_12226 ?auto_12231 ) ) ( not ( = ?auto_12226 ?auto_12248 ) ) ( not ( = ?auto_12227 ?auto_12231 ) ) ( not ( = ?auto_12227 ?auto_12248 ) ) ( not ( = ?auto_12228 ?auto_12231 ) ) ( not ( = ?auto_12228 ?auto_12248 ) ) ( not ( = ?auto_12229 ?auto_12231 ) ) ( not ( = ?auto_12229 ?auto_12248 ) ) ( not ( = ?auto_12230 ?auto_12231 ) ) ( not ( = ?auto_12230 ?auto_12248 ) ) ( not ( = ?auto_12233 ?auto_12231 ) ) ( not ( = ?auto_12233 ?auto_12248 ) ) ( not ( = ?auto_12231 ?auto_12258 ) ) ( not ( = ?auto_12231 ?auto_12247 ) ) ( not ( = ?auto_12231 ?auto_12261 ) ) ( not ( = ?auto_12231 ?auto_12250 ) ) ( not ( = ?auto_12231 ?auto_12257 ) ) ( not ( = ?auto_12231 ?auto_12243 ) ) ( not ( = ?auto_12231 ?auto_12260 ) ) ( not ( = ?auto_12249 ?auto_12265 ) ) ( not ( = ?auto_12249 ?auto_12263 ) ) ( not ( = ?auto_12249 ?auto_12256 ) ) ( not ( = ?auto_12249 ?auto_12244 ) ) ( not ( = ?auto_12249 ?auto_12266 ) ) ( not ( = ?auto_12249 ?auto_12245 ) ) ( not ( = ?auto_12262 ?auto_12251 ) ) ( not ( = ?auto_12262 ?auto_12255 ) ) ( not ( = ?auto_12262 ?auto_12246 ) ) ( not ( = ?auto_12262 ?auto_12254 ) ) ( not ( = ?auto_12262 ?auto_12253 ) ) ( not ( = ?auto_12262 ?auto_12252 ) ) ( not ( = ?auto_12248 ?auto_12258 ) ) ( not ( = ?auto_12248 ?auto_12247 ) ) ( not ( = ?auto_12248 ?auto_12261 ) ) ( not ( = ?auto_12248 ?auto_12250 ) ) ( not ( = ?auto_12248 ?auto_12257 ) ) ( not ( = ?auto_12248 ?auto_12243 ) ) ( not ( = ?auto_12248 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12234 ) ) ( not ( = ?auto_12225 ?auto_12242 ) ) ( not ( = ?auto_12226 ?auto_12234 ) ) ( not ( = ?auto_12226 ?auto_12242 ) ) ( not ( = ?auto_12227 ?auto_12234 ) ) ( not ( = ?auto_12227 ?auto_12242 ) ) ( not ( = ?auto_12228 ?auto_12234 ) ) ( not ( = ?auto_12228 ?auto_12242 ) ) ( not ( = ?auto_12229 ?auto_12234 ) ) ( not ( = ?auto_12229 ?auto_12242 ) ) ( not ( = ?auto_12230 ?auto_12234 ) ) ( not ( = ?auto_12230 ?auto_12242 ) ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12242 ) ) ( not ( = ?auto_12232 ?auto_12234 ) ) ( not ( = ?auto_12232 ?auto_12242 ) ) ( not ( = ?auto_12234 ?auto_12248 ) ) ( not ( = ?auto_12234 ?auto_12258 ) ) ( not ( = ?auto_12234 ?auto_12247 ) ) ( not ( = ?auto_12234 ?auto_12261 ) ) ( not ( = ?auto_12234 ?auto_12250 ) ) ( not ( = ?auto_12234 ?auto_12257 ) ) ( not ( = ?auto_12234 ?auto_12243 ) ) ( not ( = ?auto_12234 ?auto_12260 ) ) ( not ( = ?auto_12259 ?auto_12249 ) ) ( not ( = ?auto_12259 ?auto_12265 ) ) ( not ( = ?auto_12259 ?auto_12263 ) ) ( not ( = ?auto_12259 ?auto_12256 ) ) ( not ( = ?auto_12259 ?auto_12244 ) ) ( not ( = ?auto_12259 ?auto_12266 ) ) ( not ( = ?auto_12259 ?auto_12245 ) ) ( not ( = ?auto_12264 ?auto_12262 ) ) ( not ( = ?auto_12264 ?auto_12251 ) ) ( not ( = ?auto_12264 ?auto_12255 ) ) ( not ( = ?auto_12264 ?auto_12246 ) ) ( not ( = ?auto_12264 ?auto_12254 ) ) ( not ( = ?auto_12264 ?auto_12253 ) ) ( not ( = ?auto_12264 ?auto_12252 ) ) ( not ( = ?auto_12242 ?auto_12248 ) ) ( not ( = ?auto_12242 ?auto_12258 ) ) ( not ( = ?auto_12242 ?auto_12247 ) ) ( not ( = ?auto_12242 ?auto_12261 ) ) ( not ( = ?auto_12242 ?auto_12250 ) ) ( not ( = ?auto_12242 ?auto_12257 ) ) ( not ( = ?auto_12242 ?auto_12243 ) ) ( not ( = ?auto_12242 ?auto_12260 ) ) ( not ( = ?auto_12225 ?auto_12235 ) ) ( not ( = ?auto_12225 ?auto_12236 ) ) ( not ( = ?auto_12226 ?auto_12235 ) ) ( not ( = ?auto_12226 ?auto_12236 ) ) ( not ( = ?auto_12227 ?auto_12235 ) ) ( not ( = ?auto_12227 ?auto_12236 ) ) ( not ( = ?auto_12228 ?auto_12235 ) ) ( not ( = ?auto_12228 ?auto_12236 ) ) ( not ( = ?auto_12229 ?auto_12235 ) ) ( not ( = ?auto_12229 ?auto_12236 ) ) ( not ( = ?auto_12230 ?auto_12235 ) ) ( not ( = ?auto_12230 ?auto_12236 ) ) ( not ( = ?auto_12233 ?auto_12235 ) ) ( not ( = ?auto_12233 ?auto_12236 ) ) ( not ( = ?auto_12232 ?auto_12235 ) ) ( not ( = ?auto_12232 ?auto_12236 ) ) ( not ( = ?auto_12231 ?auto_12235 ) ) ( not ( = ?auto_12231 ?auto_12236 ) ) ( not ( = ?auto_12235 ?auto_12242 ) ) ( not ( = ?auto_12235 ?auto_12248 ) ) ( not ( = ?auto_12235 ?auto_12258 ) ) ( not ( = ?auto_12235 ?auto_12247 ) ) ( not ( = ?auto_12235 ?auto_12261 ) ) ( not ( = ?auto_12235 ?auto_12250 ) ) ( not ( = ?auto_12235 ?auto_12257 ) ) ( not ( = ?auto_12235 ?auto_12243 ) ) ( not ( = ?auto_12235 ?auto_12260 ) ) ( not ( = ?auto_12240 ?auto_12259 ) ) ( not ( = ?auto_12240 ?auto_12249 ) ) ( not ( = ?auto_12240 ?auto_12265 ) ) ( not ( = ?auto_12240 ?auto_12263 ) ) ( not ( = ?auto_12240 ?auto_12256 ) ) ( not ( = ?auto_12240 ?auto_12244 ) ) ( not ( = ?auto_12240 ?auto_12266 ) ) ( not ( = ?auto_12240 ?auto_12245 ) ) ( not ( = ?auto_12238 ?auto_12264 ) ) ( not ( = ?auto_12238 ?auto_12262 ) ) ( not ( = ?auto_12238 ?auto_12251 ) ) ( not ( = ?auto_12238 ?auto_12255 ) ) ( not ( = ?auto_12238 ?auto_12246 ) ) ( not ( = ?auto_12238 ?auto_12254 ) ) ( not ( = ?auto_12238 ?auto_12253 ) ) ( not ( = ?auto_12238 ?auto_12252 ) ) ( not ( = ?auto_12236 ?auto_12242 ) ) ( not ( = ?auto_12236 ?auto_12248 ) ) ( not ( = ?auto_12236 ?auto_12258 ) ) ( not ( = ?auto_12236 ?auto_12247 ) ) ( not ( = ?auto_12236 ?auto_12261 ) ) ( not ( = ?auto_12236 ?auto_12250 ) ) ( not ( = ?auto_12236 ?auto_12257 ) ) ( not ( = ?auto_12236 ?auto_12243 ) ) ( not ( = ?auto_12236 ?auto_12260 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12225 ?auto_12226 ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12230 ?auto_12233 ?auto_12232 ?auto_12231 ?auto_12234 )
      ( MAKE-1CRATE ?auto_12234 ?auto_12235 )
      ( MAKE-10CRATE-VERIFY ?auto_12225 ?auto_12226 ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12230 ?auto_12233 ?auto_12232 ?auto_12231 ?auto_12234 ?auto_12235 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12269 - SURFACE
      ?auto_12270 - SURFACE
    )
    :vars
    (
      ?auto_12271 - HOIST
      ?auto_12272 - PLACE
      ?auto_12274 - PLACE
      ?auto_12275 - HOIST
      ?auto_12276 - SURFACE
      ?auto_12273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12271 ?auto_12272 ) ( SURFACE-AT ?auto_12269 ?auto_12272 ) ( CLEAR ?auto_12269 ) ( IS-CRATE ?auto_12270 ) ( AVAILABLE ?auto_12271 ) ( not ( = ?auto_12274 ?auto_12272 ) ) ( HOIST-AT ?auto_12275 ?auto_12274 ) ( AVAILABLE ?auto_12275 ) ( SURFACE-AT ?auto_12270 ?auto_12274 ) ( ON ?auto_12270 ?auto_12276 ) ( CLEAR ?auto_12270 ) ( TRUCK-AT ?auto_12273 ?auto_12272 ) ( not ( = ?auto_12269 ?auto_12270 ) ) ( not ( = ?auto_12269 ?auto_12276 ) ) ( not ( = ?auto_12270 ?auto_12276 ) ) ( not ( = ?auto_12271 ?auto_12275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12273 ?auto_12272 ?auto_12274 )
      ( !LIFT ?auto_12275 ?auto_12270 ?auto_12276 ?auto_12274 )
      ( !LOAD ?auto_12275 ?auto_12270 ?auto_12273 ?auto_12274 )
      ( !DRIVE ?auto_12273 ?auto_12274 ?auto_12272 )
      ( !UNLOAD ?auto_12271 ?auto_12270 ?auto_12273 ?auto_12272 )
      ( !DROP ?auto_12271 ?auto_12270 ?auto_12269 ?auto_12272 )
      ( MAKE-1CRATE-VERIFY ?auto_12269 ?auto_12270 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12289 - SURFACE
      ?auto_12290 - SURFACE
      ?auto_12291 - SURFACE
      ?auto_12292 - SURFACE
      ?auto_12293 - SURFACE
      ?auto_12294 - SURFACE
      ?auto_12297 - SURFACE
      ?auto_12296 - SURFACE
      ?auto_12295 - SURFACE
      ?auto_12298 - SURFACE
      ?auto_12300 - SURFACE
      ?auto_12299 - SURFACE
    )
    :vars
    (
      ?auto_12304 - HOIST
      ?auto_12305 - PLACE
      ?auto_12303 - PLACE
      ?auto_12302 - HOIST
      ?auto_12301 - SURFACE
      ?auto_12318 - PLACE
      ?auto_12309 - HOIST
      ?auto_12322 - SURFACE
      ?auto_12325 - PLACE
      ?auto_12307 - HOIST
      ?auto_12328 - SURFACE
      ?auto_12310 - PLACE
      ?auto_12308 - HOIST
      ?auto_12332 - SURFACE
      ?auto_12331 - PLACE
      ?auto_12315 - HOIST
      ?auto_12329 - SURFACE
      ?auto_12312 - PLACE
      ?auto_12320 - HOIST
      ?auto_12314 - SURFACE
      ?auto_12321 - PLACE
      ?auto_12326 - HOIST
      ?auto_12311 - SURFACE
      ?auto_12330 - PLACE
      ?auto_12319 - HOIST
      ?auto_12313 - SURFACE
      ?auto_12316 - PLACE
      ?auto_12323 - HOIST
      ?auto_12334 - SURFACE
      ?auto_12327 - PLACE
      ?auto_12317 - HOIST
      ?auto_12333 - SURFACE
      ?auto_12324 - SURFACE
      ?auto_12306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12304 ?auto_12305 ) ( IS-CRATE ?auto_12299 ) ( not ( = ?auto_12303 ?auto_12305 ) ) ( HOIST-AT ?auto_12302 ?auto_12303 ) ( AVAILABLE ?auto_12302 ) ( SURFACE-AT ?auto_12299 ?auto_12303 ) ( ON ?auto_12299 ?auto_12301 ) ( CLEAR ?auto_12299 ) ( not ( = ?auto_12300 ?auto_12299 ) ) ( not ( = ?auto_12300 ?auto_12301 ) ) ( not ( = ?auto_12299 ?auto_12301 ) ) ( not ( = ?auto_12304 ?auto_12302 ) ) ( IS-CRATE ?auto_12300 ) ( not ( = ?auto_12318 ?auto_12305 ) ) ( HOIST-AT ?auto_12309 ?auto_12318 ) ( AVAILABLE ?auto_12309 ) ( SURFACE-AT ?auto_12300 ?auto_12318 ) ( ON ?auto_12300 ?auto_12322 ) ( CLEAR ?auto_12300 ) ( not ( = ?auto_12298 ?auto_12300 ) ) ( not ( = ?auto_12298 ?auto_12322 ) ) ( not ( = ?auto_12300 ?auto_12322 ) ) ( not ( = ?auto_12304 ?auto_12309 ) ) ( IS-CRATE ?auto_12298 ) ( not ( = ?auto_12325 ?auto_12305 ) ) ( HOIST-AT ?auto_12307 ?auto_12325 ) ( AVAILABLE ?auto_12307 ) ( SURFACE-AT ?auto_12298 ?auto_12325 ) ( ON ?auto_12298 ?auto_12328 ) ( CLEAR ?auto_12298 ) ( not ( = ?auto_12295 ?auto_12298 ) ) ( not ( = ?auto_12295 ?auto_12328 ) ) ( not ( = ?auto_12298 ?auto_12328 ) ) ( not ( = ?auto_12304 ?auto_12307 ) ) ( IS-CRATE ?auto_12295 ) ( not ( = ?auto_12310 ?auto_12305 ) ) ( HOIST-AT ?auto_12308 ?auto_12310 ) ( AVAILABLE ?auto_12308 ) ( SURFACE-AT ?auto_12295 ?auto_12310 ) ( ON ?auto_12295 ?auto_12332 ) ( CLEAR ?auto_12295 ) ( not ( = ?auto_12296 ?auto_12295 ) ) ( not ( = ?auto_12296 ?auto_12332 ) ) ( not ( = ?auto_12295 ?auto_12332 ) ) ( not ( = ?auto_12304 ?auto_12308 ) ) ( IS-CRATE ?auto_12296 ) ( not ( = ?auto_12331 ?auto_12305 ) ) ( HOIST-AT ?auto_12315 ?auto_12331 ) ( AVAILABLE ?auto_12315 ) ( SURFACE-AT ?auto_12296 ?auto_12331 ) ( ON ?auto_12296 ?auto_12329 ) ( CLEAR ?auto_12296 ) ( not ( = ?auto_12297 ?auto_12296 ) ) ( not ( = ?auto_12297 ?auto_12329 ) ) ( not ( = ?auto_12296 ?auto_12329 ) ) ( not ( = ?auto_12304 ?auto_12315 ) ) ( IS-CRATE ?auto_12297 ) ( not ( = ?auto_12312 ?auto_12305 ) ) ( HOIST-AT ?auto_12320 ?auto_12312 ) ( AVAILABLE ?auto_12320 ) ( SURFACE-AT ?auto_12297 ?auto_12312 ) ( ON ?auto_12297 ?auto_12314 ) ( CLEAR ?auto_12297 ) ( not ( = ?auto_12294 ?auto_12297 ) ) ( not ( = ?auto_12294 ?auto_12314 ) ) ( not ( = ?auto_12297 ?auto_12314 ) ) ( not ( = ?auto_12304 ?auto_12320 ) ) ( IS-CRATE ?auto_12294 ) ( not ( = ?auto_12321 ?auto_12305 ) ) ( HOIST-AT ?auto_12326 ?auto_12321 ) ( AVAILABLE ?auto_12326 ) ( SURFACE-AT ?auto_12294 ?auto_12321 ) ( ON ?auto_12294 ?auto_12311 ) ( CLEAR ?auto_12294 ) ( not ( = ?auto_12293 ?auto_12294 ) ) ( not ( = ?auto_12293 ?auto_12311 ) ) ( not ( = ?auto_12294 ?auto_12311 ) ) ( not ( = ?auto_12304 ?auto_12326 ) ) ( IS-CRATE ?auto_12293 ) ( not ( = ?auto_12330 ?auto_12305 ) ) ( HOIST-AT ?auto_12319 ?auto_12330 ) ( AVAILABLE ?auto_12319 ) ( SURFACE-AT ?auto_12293 ?auto_12330 ) ( ON ?auto_12293 ?auto_12313 ) ( CLEAR ?auto_12293 ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( not ( = ?auto_12292 ?auto_12313 ) ) ( not ( = ?auto_12293 ?auto_12313 ) ) ( not ( = ?auto_12304 ?auto_12319 ) ) ( IS-CRATE ?auto_12292 ) ( not ( = ?auto_12316 ?auto_12305 ) ) ( HOIST-AT ?auto_12323 ?auto_12316 ) ( SURFACE-AT ?auto_12292 ?auto_12316 ) ( ON ?auto_12292 ?auto_12334 ) ( CLEAR ?auto_12292 ) ( not ( = ?auto_12291 ?auto_12292 ) ) ( not ( = ?auto_12291 ?auto_12334 ) ) ( not ( = ?auto_12292 ?auto_12334 ) ) ( not ( = ?auto_12304 ?auto_12323 ) ) ( IS-CRATE ?auto_12291 ) ( not ( = ?auto_12327 ?auto_12305 ) ) ( HOIST-AT ?auto_12317 ?auto_12327 ) ( AVAILABLE ?auto_12317 ) ( SURFACE-AT ?auto_12291 ?auto_12327 ) ( ON ?auto_12291 ?auto_12333 ) ( CLEAR ?auto_12291 ) ( not ( = ?auto_12290 ?auto_12291 ) ) ( not ( = ?auto_12290 ?auto_12333 ) ) ( not ( = ?auto_12291 ?auto_12333 ) ) ( not ( = ?auto_12304 ?auto_12317 ) ) ( SURFACE-AT ?auto_12289 ?auto_12305 ) ( CLEAR ?auto_12289 ) ( IS-CRATE ?auto_12290 ) ( AVAILABLE ?auto_12304 ) ( AVAILABLE ?auto_12323 ) ( SURFACE-AT ?auto_12290 ?auto_12316 ) ( ON ?auto_12290 ?auto_12324 ) ( CLEAR ?auto_12290 ) ( TRUCK-AT ?auto_12306 ?auto_12305 ) ( not ( = ?auto_12289 ?auto_12290 ) ) ( not ( = ?auto_12289 ?auto_12324 ) ) ( not ( = ?auto_12290 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12291 ) ) ( not ( = ?auto_12289 ?auto_12333 ) ) ( not ( = ?auto_12291 ?auto_12324 ) ) ( not ( = ?auto_12327 ?auto_12316 ) ) ( not ( = ?auto_12317 ?auto_12323 ) ) ( not ( = ?auto_12333 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12292 ) ) ( not ( = ?auto_12289 ?auto_12334 ) ) ( not ( = ?auto_12290 ?auto_12292 ) ) ( not ( = ?auto_12290 ?auto_12334 ) ) ( not ( = ?auto_12292 ?auto_12333 ) ) ( not ( = ?auto_12292 ?auto_12324 ) ) ( not ( = ?auto_12334 ?auto_12333 ) ) ( not ( = ?auto_12334 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12293 ) ) ( not ( = ?auto_12289 ?auto_12313 ) ) ( not ( = ?auto_12290 ?auto_12293 ) ) ( not ( = ?auto_12290 ?auto_12313 ) ) ( not ( = ?auto_12291 ?auto_12293 ) ) ( not ( = ?auto_12291 ?auto_12313 ) ) ( not ( = ?auto_12293 ?auto_12334 ) ) ( not ( = ?auto_12293 ?auto_12333 ) ) ( not ( = ?auto_12293 ?auto_12324 ) ) ( not ( = ?auto_12330 ?auto_12316 ) ) ( not ( = ?auto_12330 ?auto_12327 ) ) ( not ( = ?auto_12319 ?auto_12323 ) ) ( not ( = ?auto_12319 ?auto_12317 ) ) ( not ( = ?auto_12313 ?auto_12334 ) ) ( not ( = ?auto_12313 ?auto_12333 ) ) ( not ( = ?auto_12313 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12294 ) ) ( not ( = ?auto_12289 ?auto_12311 ) ) ( not ( = ?auto_12290 ?auto_12294 ) ) ( not ( = ?auto_12290 ?auto_12311 ) ) ( not ( = ?auto_12291 ?auto_12294 ) ) ( not ( = ?auto_12291 ?auto_12311 ) ) ( not ( = ?auto_12292 ?auto_12294 ) ) ( not ( = ?auto_12292 ?auto_12311 ) ) ( not ( = ?auto_12294 ?auto_12313 ) ) ( not ( = ?auto_12294 ?auto_12334 ) ) ( not ( = ?auto_12294 ?auto_12333 ) ) ( not ( = ?auto_12294 ?auto_12324 ) ) ( not ( = ?auto_12321 ?auto_12330 ) ) ( not ( = ?auto_12321 ?auto_12316 ) ) ( not ( = ?auto_12321 ?auto_12327 ) ) ( not ( = ?auto_12326 ?auto_12319 ) ) ( not ( = ?auto_12326 ?auto_12323 ) ) ( not ( = ?auto_12326 ?auto_12317 ) ) ( not ( = ?auto_12311 ?auto_12313 ) ) ( not ( = ?auto_12311 ?auto_12334 ) ) ( not ( = ?auto_12311 ?auto_12333 ) ) ( not ( = ?auto_12311 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12297 ) ) ( not ( = ?auto_12289 ?auto_12314 ) ) ( not ( = ?auto_12290 ?auto_12297 ) ) ( not ( = ?auto_12290 ?auto_12314 ) ) ( not ( = ?auto_12291 ?auto_12297 ) ) ( not ( = ?auto_12291 ?auto_12314 ) ) ( not ( = ?auto_12292 ?auto_12297 ) ) ( not ( = ?auto_12292 ?auto_12314 ) ) ( not ( = ?auto_12293 ?auto_12297 ) ) ( not ( = ?auto_12293 ?auto_12314 ) ) ( not ( = ?auto_12297 ?auto_12311 ) ) ( not ( = ?auto_12297 ?auto_12313 ) ) ( not ( = ?auto_12297 ?auto_12334 ) ) ( not ( = ?auto_12297 ?auto_12333 ) ) ( not ( = ?auto_12297 ?auto_12324 ) ) ( not ( = ?auto_12312 ?auto_12321 ) ) ( not ( = ?auto_12312 ?auto_12330 ) ) ( not ( = ?auto_12312 ?auto_12316 ) ) ( not ( = ?auto_12312 ?auto_12327 ) ) ( not ( = ?auto_12320 ?auto_12326 ) ) ( not ( = ?auto_12320 ?auto_12319 ) ) ( not ( = ?auto_12320 ?auto_12323 ) ) ( not ( = ?auto_12320 ?auto_12317 ) ) ( not ( = ?auto_12314 ?auto_12311 ) ) ( not ( = ?auto_12314 ?auto_12313 ) ) ( not ( = ?auto_12314 ?auto_12334 ) ) ( not ( = ?auto_12314 ?auto_12333 ) ) ( not ( = ?auto_12314 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12296 ) ) ( not ( = ?auto_12289 ?auto_12329 ) ) ( not ( = ?auto_12290 ?auto_12296 ) ) ( not ( = ?auto_12290 ?auto_12329 ) ) ( not ( = ?auto_12291 ?auto_12296 ) ) ( not ( = ?auto_12291 ?auto_12329 ) ) ( not ( = ?auto_12292 ?auto_12296 ) ) ( not ( = ?auto_12292 ?auto_12329 ) ) ( not ( = ?auto_12293 ?auto_12296 ) ) ( not ( = ?auto_12293 ?auto_12329 ) ) ( not ( = ?auto_12294 ?auto_12296 ) ) ( not ( = ?auto_12294 ?auto_12329 ) ) ( not ( = ?auto_12296 ?auto_12314 ) ) ( not ( = ?auto_12296 ?auto_12311 ) ) ( not ( = ?auto_12296 ?auto_12313 ) ) ( not ( = ?auto_12296 ?auto_12334 ) ) ( not ( = ?auto_12296 ?auto_12333 ) ) ( not ( = ?auto_12296 ?auto_12324 ) ) ( not ( = ?auto_12331 ?auto_12312 ) ) ( not ( = ?auto_12331 ?auto_12321 ) ) ( not ( = ?auto_12331 ?auto_12330 ) ) ( not ( = ?auto_12331 ?auto_12316 ) ) ( not ( = ?auto_12331 ?auto_12327 ) ) ( not ( = ?auto_12315 ?auto_12320 ) ) ( not ( = ?auto_12315 ?auto_12326 ) ) ( not ( = ?auto_12315 ?auto_12319 ) ) ( not ( = ?auto_12315 ?auto_12323 ) ) ( not ( = ?auto_12315 ?auto_12317 ) ) ( not ( = ?auto_12329 ?auto_12314 ) ) ( not ( = ?auto_12329 ?auto_12311 ) ) ( not ( = ?auto_12329 ?auto_12313 ) ) ( not ( = ?auto_12329 ?auto_12334 ) ) ( not ( = ?auto_12329 ?auto_12333 ) ) ( not ( = ?auto_12329 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12295 ) ) ( not ( = ?auto_12289 ?auto_12332 ) ) ( not ( = ?auto_12290 ?auto_12295 ) ) ( not ( = ?auto_12290 ?auto_12332 ) ) ( not ( = ?auto_12291 ?auto_12295 ) ) ( not ( = ?auto_12291 ?auto_12332 ) ) ( not ( = ?auto_12292 ?auto_12295 ) ) ( not ( = ?auto_12292 ?auto_12332 ) ) ( not ( = ?auto_12293 ?auto_12295 ) ) ( not ( = ?auto_12293 ?auto_12332 ) ) ( not ( = ?auto_12294 ?auto_12295 ) ) ( not ( = ?auto_12294 ?auto_12332 ) ) ( not ( = ?auto_12297 ?auto_12295 ) ) ( not ( = ?auto_12297 ?auto_12332 ) ) ( not ( = ?auto_12295 ?auto_12329 ) ) ( not ( = ?auto_12295 ?auto_12314 ) ) ( not ( = ?auto_12295 ?auto_12311 ) ) ( not ( = ?auto_12295 ?auto_12313 ) ) ( not ( = ?auto_12295 ?auto_12334 ) ) ( not ( = ?auto_12295 ?auto_12333 ) ) ( not ( = ?auto_12295 ?auto_12324 ) ) ( not ( = ?auto_12310 ?auto_12331 ) ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( not ( = ?auto_12310 ?auto_12321 ) ) ( not ( = ?auto_12310 ?auto_12330 ) ) ( not ( = ?auto_12310 ?auto_12316 ) ) ( not ( = ?auto_12310 ?auto_12327 ) ) ( not ( = ?auto_12308 ?auto_12315 ) ) ( not ( = ?auto_12308 ?auto_12320 ) ) ( not ( = ?auto_12308 ?auto_12326 ) ) ( not ( = ?auto_12308 ?auto_12319 ) ) ( not ( = ?auto_12308 ?auto_12323 ) ) ( not ( = ?auto_12308 ?auto_12317 ) ) ( not ( = ?auto_12332 ?auto_12329 ) ) ( not ( = ?auto_12332 ?auto_12314 ) ) ( not ( = ?auto_12332 ?auto_12311 ) ) ( not ( = ?auto_12332 ?auto_12313 ) ) ( not ( = ?auto_12332 ?auto_12334 ) ) ( not ( = ?auto_12332 ?auto_12333 ) ) ( not ( = ?auto_12332 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12298 ) ) ( not ( = ?auto_12289 ?auto_12328 ) ) ( not ( = ?auto_12290 ?auto_12298 ) ) ( not ( = ?auto_12290 ?auto_12328 ) ) ( not ( = ?auto_12291 ?auto_12298 ) ) ( not ( = ?auto_12291 ?auto_12328 ) ) ( not ( = ?auto_12292 ?auto_12298 ) ) ( not ( = ?auto_12292 ?auto_12328 ) ) ( not ( = ?auto_12293 ?auto_12298 ) ) ( not ( = ?auto_12293 ?auto_12328 ) ) ( not ( = ?auto_12294 ?auto_12298 ) ) ( not ( = ?auto_12294 ?auto_12328 ) ) ( not ( = ?auto_12297 ?auto_12298 ) ) ( not ( = ?auto_12297 ?auto_12328 ) ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( not ( = ?auto_12296 ?auto_12328 ) ) ( not ( = ?auto_12298 ?auto_12332 ) ) ( not ( = ?auto_12298 ?auto_12329 ) ) ( not ( = ?auto_12298 ?auto_12314 ) ) ( not ( = ?auto_12298 ?auto_12311 ) ) ( not ( = ?auto_12298 ?auto_12313 ) ) ( not ( = ?auto_12298 ?auto_12334 ) ) ( not ( = ?auto_12298 ?auto_12333 ) ) ( not ( = ?auto_12298 ?auto_12324 ) ) ( not ( = ?auto_12325 ?auto_12310 ) ) ( not ( = ?auto_12325 ?auto_12331 ) ) ( not ( = ?auto_12325 ?auto_12312 ) ) ( not ( = ?auto_12325 ?auto_12321 ) ) ( not ( = ?auto_12325 ?auto_12330 ) ) ( not ( = ?auto_12325 ?auto_12316 ) ) ( not ( = ?auto_12325 ?auto_12327 ) ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( not ( = ?auto_12307 ?auto_12315 ) ) ( not ( = ?auto_12307 ?auto_12320 ) ) ( not ( = ?auto_12307 ?auto_12326 ) ) ( not ( = ?auto_12307 ?auto_12319 ) ) ( not ( = ?auto_12307 ?auto_12323 ) ) ( not ( = ?auto_12307 ?auto_12317 ) ) ( not ( = ?auto_12328 ?auto_12332 ) ) ( not ( = ?auto_12328 ?auto_12329 ) ) ( not ( = ?auto_12328 ?auto_12314 ) ) ( not ( = ?auto_12328 ?auto_12311 ) ) ( not ( = ?auto_12328 ?auto_12313 ) ) ( not ( = ?auto_12328 ?auto_12334 ) ) ( not ( = ?auto_12328 ?auto_12333 ) ) ( not ( = ?auto_12328 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12300 ) ) ( not ( = ?auto_12289 ?auto_12322 ) ) ( not ( = ?auto_12290 ?auto_12300 ) ) ( not ( = ?auto_12290 ?auto_12322 ) ) ( not ( = ?auto_12291 ?auto_12300 ) ) ( not ( = ?auto_12291 ?auto_12322 ) ) ( not ( = ?auto_12292 ?auto_12300 ) ) ( not ( = ?auto_12292 ?auto_12322 ) ) ( not ( = ?auto_12293 ?auto_12300 ) ) ( not ( = ?auto_12293 ?auto_12322 ) ) ( not ( = ?auto_12294 ?auto_12300 ) ) ( not ( = ?auto_12294 ?auto_12322 ) ) ( not ( = ?auto_12297 ?auto_12300 ) ) ( not ( = ?auto_12297 ?auto_12322 ) ) ( not ( = ?auto_12296 ?auto_12300 ) ) ( not ( = ?auto_12296 ?auto_12322 ) ) ( not ( = ?auto_12295 ?auto_12300 ) ) ( not ( = ?auto_12295 ?auto_12322 ) ) ( not ( = ?auto_12300 ?auto_12328 ) ) ( not ( = ?auto_12300 ?auto_12332 ) ) ( not ( = ?auto_12300 ?auto_12329 ) ) ( not ( = ?auto_12300 ?auto_12314 ) ) ( not ( = ?auto_12300 ?auto_12311 ) ) ( not ( = ?auto_12300 ?auto_12313 ) ) ( not ( = ?auto_12300 ?auto_12334 ) ) ( not ( = ?auto_12300 ?auto_12333 ) ) ( not ( = ?auto_12300 ?auto_12324 ) ) ( not ( = ?auto_12318 ?auto_12325 ) ) ( not ( = ?auto_12318 ?auto_12310 ) ) ( not ( = ?auto_12318 ?auto_12331 ) ) ( not ( = ?auto_12318 ?auto_12312 ) ) ( not ( = ?auto_12318 ?auto_12321 ) ) ( not ( = ?auto_12318 ?auto_12330 ) ) ( not ( = ?auto_12318 ?auto_12316 ) ) ( not ( = ?auto_12318 ?auto_12327 ) ) ( not ( = ?auto_12309 ?auto_12307 ) ) ( not ( = ?auto_12309 ?auto_12308 ) ) ( not ( = ?auto_12309 ?auto_12315 ) ) ( not ( = ?auto_12309 ?auto_12320 ) ) ( not ( = ?auto_12309 ?auto_12326 ) ) ( not ( = ?auto_12309 ?auto_12319 ) ) ( not ( = ?auto_12309 ?auto_12323 ) ) ( not ( = ?auto_12309 ?auto_12317 ) ) ( not ( = ?auto_12322 ?auto_12328 ) ) ( not ( = ?auto_12322 ?auto_12332 ) ) ( not ( = ?auto_12322 ?auto_12329 ) ) ( not ( = ?auto_12322 ?auto_12314 ) ) ( not ( = ?auto_12322 ?auto_12311 ) ) ( not ( = ?auto_12322 ?auto_12313 ) ) ( not ( = ?auto_12322 ?auto_12334 ) ) ( not ( = ?auto_12322 ?auto_12333 ) ) ( not ( = ?auto_12322 ?auto_12324 ) ) ( not ( = ?auto_12289 ?auto_12299 ) ) ( not ( = ?auto_12289 ?auto_12301 ) ) ( not ( = ?auto_12290 ?auto_12299 ) ) ( not ( = ?auto_12290 ?auto_12301 ) ) ( not ( = ?auto_12291 ?auto_12299 ) ) ( not ( = ?auto_12291 ?auto_12301 ) ) ( not ( = ?auto_12292 ?auto_12299 ) ) ( not ( = ?auto_12292 ?auto_12301 ) ) ( not ( = ?auto_12293 ?auto_12299 ) ) ( not ( = ?auto_12293 ?auto_12301 ) ) ( not ( = ?auto_12294 ?auto_12299 ) ) ( not ( = ?auto_12294 ?auto_12301 ) ) ( not ( = ?auto_12297 ?auto_12299 ) ) ( not ( = ?auto_12297 ?auto_12301 ) ) ( not ( = ?auto_12296 ?auto_12299 ) ) ( not ( = ?auto_12296 ?auto_12301 ) ) ( not ( = ?auto_12295 ?auto_12299 ) ) ( not ( = ?auto_12295 ?auto_12301 ) ) ( not ( = ?auto_12298 ?auto_12299 ) ) ( not ( = ?auto_12298 ?auto_12301 ) ) ( not ( = ?auto_12299 ?auto_12322 ) ) ( not ( = ?auto_12299 ?auto_12328 ) ) ( not ( = ?auto_12299 ?auto_12332 ) ) ( not ( = ?auto_12299 ?auto_12329 ) ) ( not ( = ?auto_12299 ?auto_12314 ) ) ( not ( = ?auto_12299 ?auto_12311 ) ) ( not ( = ?auto_12299 ?auto_12313 ) ) ( not ( = ?auto_12299 ?auto_12334 ) ) ( not ( = ?auto_12299 ?auto_12333 ) ) ( not ( = ?auto_12299 ?auto_12324 ) ) ( not ( = ?auto_12303 ?auto_12318 ) ) ( not ( = ?auto_12303 ?auto_12325 ) ) ( not ( = ?auto_12303 ?auto_12310 ) ) ( not ( = ?auto_12303 ?auto_12331 ) ) ( not ( = ?auto_12303 ?auto_12312 ) ) ( not ( = ?auto_12303 ?auto_12321 ) ) ( not ( = ?auto_12303 ?auto_12330 ) ) ( not ( = ?auto_12303 ?auto_12316 ) ) ( not ( = ?auto_12303 ?auto_12327 ) ) ( not ( = ?auto_12302 ?auto_12309 ) ) ( not ( = ?auto_12302 ?auto_12307 ) ) ( not ( = ?auto_12302 ?auto_12308 ) ) ( not ( = ?auto_12302 ?auto_12315 ) ) ( not ( = ?auto_12302 ?auto_12320 ) ) ( not ( = ?auto_12302 ?auto_12326 ) ) ( not ( = ?auto_12302 ?auto_12319 ) ) ( not ( = ?auto_12302 ?auto_12323 ) ) ( not ( = ?auto_12302 ?auto_12317 ) ) ( not ( = ?auto_12301 ?auto_12322 ) ) ( not ( = ?auto_12301 ?auto_12328 ) ) ( not ( = ?auto_12301 ?auto_12332 ) ) ( not ( = ?auto_12301 ?auto_12329 ) ) ( not ( = ?auto_12301 ?auto_12314 ) ) ( not ( = ?auto_12301 ?auto_12311 ) ) ( not ( = ?auto_12301 ?auto_12313 ) ) ( not ( = ?auto_12301 ?auto_12334 ) ) ( not ( = ?auto_12301 ?auto_12333 ) ) ( not ( = ?auto_12301 ?auto_12324 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12289 ?auto_12290 ?auto_12291 ?auto_12292 ?auto_12293 ?auto_12294 ?auto_12297 ?auto_12296 ?auto_12295 ?auto_12298 ?auto_12300 )
      ( MAKE-1CRATE ?auto_12300 ?auto_12299 )
      ( MAKE-11CRATE-VERIFY ?auto_12289 ?auto_12290 ?auto_12291 ?auto_12292 ?auto_12293 ?auto_12294 ?auto_12297 ?auto_12296 ?auto_12295 ?auto_12298 ?auto_12300 ?auto_12299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12337 - SURFACE
      ?auto_12338 - SURFACE
    )
    :vars
    (
      ?auto_12339 - HOIST
      ?auto_12340 - PLACE
      ?auto_12342 - PLACE
      ?auto_12343 - HOIST
      ?auto_12344 - SURFACE
      ?auto_12341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12339 ?auto_12340 ) ( SURFACE-AT ?auto_12337 ?auto_12340 ) ( CLEAR ?auto_12337 ) ( IS-CRATE ?auto_12338 ) ( AVAILABLE ?auto_12339 ) ( not ( = ?auto_12342 ?auto_12340 ) ) ( HOIST-AT ?auto_12343 ?auto_12342 ) ( AVAILABLE ?auto_12343 ) ( SURFACE-AT ?auto_12338 ?auto_12342 ) ( ON ?auto_12338 ?auto_12344 ) ( CLEAR ?auto_12338 ) ( TRUCK-AT ?auto_12341 ?auto_12340 ) ( not ( = ?auto_12337 ?auto_12338 ) ) ( not ( = ?auto_12337 ?auto_12344 ) ) ( not ( = ?auto_12338 ?auto_12344 ) ) ( not ( = ?auto_12339 ?auto_12343 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12341 ?auto_12340 ?auto_12342 )
      ( !LIFT ?auto_12343 ?auto_12338 ?auto_12344 ?auto_12342 )
      ( !LOAD ?auto_12343 ?auto_12338 ?auto_12341 ?auto_12342 )
      ( !DRIVE ?auto_12341 ?auto_12342 ?auto_12340 )
      ( !UNLOAD ?auto_12339 ?auto_12338 ?auto_12341 ?auto_12340 )
      ( !DROP ?auto_12339 ?auto_12338 ?auto_12337 ?auto_12340 )
      ( MAKE-1CRATE-VERIFY ?auto_12337 ?auto_12338 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12358 - SURFACE
      ?auto_12359 - SURFACE
      ?auto_12360 - SURFACE
      ?auto_12361 - SURFACE
      ?auto_12362 - SURFACE
      ?auto_12363 - SURFACE
      ?auto_12366 - SURFACE
      ?auto_12365 - SURFACE
      ?auto_12364 - SURFACE
      ?auto_12367 - SURFACE
      ?auto_12369 - SURFACE
      ?auto_12368 - SURFACE
      ?auto_12370 - SURFACE
    )
    :vars
    (
      ?auto_12373 - HOIST
      ?auto_12374 - PLACE
      ?auto_12371 - PLACE
      ?auto_12376 - HOIST
      ?auto_12372 - SURFACE
      ?auto_12390 - PLACE
      ?auto_12385 - HOIST
      ?auto_12404 - SURFACE
      ?auto_12401 - PLACE
      ?auto_12397 - HOIST
      ?auto_12377 - SURFACE
      ?auto_12395 - PLACE
      ?auto_12392 - HOIST
      ?auto_12396 - SURFACE
      ?auto_12391 - PLACE
      ?auto_12386 - HOIST
      ?auto_12381 - SURFACE
      ?auto_12398 - PLACE
      ?auto_12393 - HOIST
      ?auto_12387 - SURFACE
      ?auto_12389 - PLACE
      ?auto_12406 - HOIST
      ?auto_12382 - SURFACE
      ?auto_12384 - PLACE
      ?auto_12407 - HOIST
      ?auto_12405 - SURFACE
      ?auto_12378 - PLACE
      ?auto_12383 - HOIST
      ?auto_12399 - SURFACE
      ?auto_12379 - PLACE
      ?auto_12400 - HOIST
      ?auto_12388 - SURFACE
      ?auto_12403 - PLACE
      ?auto_12402 - HOIST
      ?auto_12394 - SURFACE
      ?auto_12380 - SURFACE
      ?auto_12375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12373 ?auto_12374 ) ( IS-CRATE ?auto_12370 ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( HOIST-AT ?auto_12376 ?auto_12371 ) ( AVAILABLE ?auto_12376 ) ( SURFACE-AT ?auto_12370 ?auto_12371 ) ( ON ?auto_12370 ?auto_12372 ) ( CLEAR ?auto_12370 ) ( not ( = ?auto_12368 ?auto_12370 ) ) ( not ( = ?auto_12368 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12373 ?auto_12376 ) ) ( IS-CRATE ?auto_12368 ) ( not ( = ?auto_12390 ?auto_12374 ) ) ( HOIST-AT ?auto_12385 ?auto_12390 ) ( AVAILABLE ?auto_12385 ) ( SURFACE-AT ?auto_12368 ?auto_12390 ) ( ON ?auto_12368 ?auto_12404 ) ( CLEAR ?auto_12368 ) ( not ( = ?auto_12369 ?auto_12368 ) ) ( not ( = ?auto_12369 ?auto_12404 ) ) ( not ( = ?auto_12368 ?auto_12404 ) ) ( not ( = ?auto_12373 ?auto_12385 ) ) ( IS-CRATE ?auto_12369 ) ( not ( = ?auto_12401 ?auto_12374 ) ) ( HOIST-AT ?auto_12397 ?auto_12401 ) ( AVAILABLE ?auto_12397 ) ( SURFACE-AT ?auto_12369 ?auto_12401 ) ( ON ?auto_12369 ?auto_12377 ) ( CLEAR ?auto_12369 ) ( not ( = ?auto_12367 ?auto_12369 ) ) ( not ( = ?auto_12367 ?auto_12377 ) ) ( not ( = ?auto_12369 ?auto_12377 ) ) ( not ( = ?auto_12373 ?auto_12397 ) ) ( IS-CRATE ?auto_12367 ) ( not ( = ?auto_12395 ?auto_12374 ) ) ( HOIST-AT ?auto_12392 ?auto_12395 ) ( AVAILABLE ?auto_12392 ) ( SURFACE-AT ?auto_12367 ?auto_12395 ) ( ON ?auto_12367 ?auto_12396 ) ( CLEAR ?auto_12367 ) ( not ( = ?auto_12364 ?auto_12367 ) ) ( not ( = ?auto_12364 ?auto_12396 ) ) ( not ( = ?auto_12367 ?auto_12396 ) ) ( not ( = ?auto_12373 ?auto_12392 ) ) ( IS-CRATE ?auto_12364 ) ( not ( = ?auto_12391 ?auto_12374 ) ) ( HOIST-AT ?auto_12386 ?auto_12391 ) ( AVAILABLE ?auto_12386 ) ( SURFACE-AT ?auto_12364 ?auto_12391 ) ( ON ?auto_12364 ?auto_12381 ) ( CLEAR ?auto_12364 ) ( not ( = ?auto_12365 ?auto_12364 ) ) ( not ( = ?auto_12365 ?auto_12381 ) ) ( not ( = ?auto_12364 ?auto_12381 ) ) ( not ( = ?auto_12373 ?auto_12386 ) ) ( IS-CRATE ?auto_12365 ) ( not ( = ?auto_12398 ?auto_12374 ) ) ( HOIST-AT ?auto_12393 ?auto_12398 ) ( AVAILABLE ?auto_12393 ) ( SURFACE-AT ?auto_12365 ?auto_12398 ) ( ON ?auto_12365 ?auto_12387 ) ( CLEAR ?auto_12365 ) ( not ( = ?auto_12366 ?auto_12365 ) ) ( not ( = ?auto_12366 ?auto_12387 ) ) ( not ( = ?auto_12365 ?auto_12387 ) ) ( not ( = ?auto_12373 ?auto_12393 ) ) ( IS-CRATE ?auto_12366 ) ( not ( = ?auto_12389 ?auto_12374 ) ) ( HOIST-AT ?auto_12406 ?auto_12389 ) ( AVAILABLE ?auto_12406 ) ( SURFACE-AT ?auto_12366 ?auto_12389 ) ( ON ?auto_12366 ?auto_12382 ) ( CLEAR ?auto_12366 ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( not ( = ?auto_12363 ?auto_12382 ) ) ( not ( = ?auto_12366 ?auto_12382 ) ) ( not ( = ?auto_12373 ?auto_12406 ) ) ( IS-CRATE ?auto_12363 ) ( not ( = ?auto_12384 ?auto_12374 ) ) ( HOIST-AT ?auto_12407 ?auto_12384 ) ( AVAILABLE ?auto_12407 ) ( SURFACE-AT ?auto_12363 ?auto_12384 ) ( ON ?auto_12363 ?auto_12405 ) ( CLEAR ?auto_12363 ) ( not ( = ?auto_12362 ?auto_12363 ) ) ( not ( = ?auto_12362 ?auto_12405 ) ) ( not ( = ?auto_12363 ?auto_12405 ) ) ( not ( = ?auto_12373 ?auto_12407 ) ) ( IS-CRATE ?auto_12362 ) ( not ( = ?auto_12378 ?auto_12374 ) ) ( HOIST-AT ?auto_12383 ?auto_12378 ) ( AVAILABLE ?auto_12383 ) ( SURFACE-AT ?auto_12362 ?auto_12378 ) ( ON ?auto_12362 ?auto_12399 ) ( CLEAR ?auto_12362 ) ( not ( = ?auto_12361 ?auto_12362 ) ) ( not ( = ?auto_12361 ?auto_12399 ) ) ( not ( = ?auto_12362 ?auto_12399 ) ) ( not ( = ?auto_12373 ?auto_12383 ) ) ( IS-CRATE ?auto_12361 ) ( not ( = ?auto_12379 ?auto_12374 ) ) ( HOIST-AT ?auto_12400 ?auto_12379 ) ( SURFACE-AT ?auto_12361 ?auto_12379 ) ( ON ?auto_12361 ?auto_12388 ) ( CLEAR ?auto_12361 ) ( not ( = ?auto_12360 ?auto_12361 ) ) ( not ( = ?auto_12360 ?auto_12388 ) ) ( not ( = ?auto_12361 ?auto_12388 ) ) ( not ( = ?auto_12373 ?auto_12400 ) ) ( IS-CRATE ?auto_12360 ) ( not ( = ?auto_12403 ?auto_12374 ) ) ( HOIST-AT ?auto_12402 ?auto_12403 ) ( AVAILABLE ?auto_12402 ) ( SURFACE-AT ?auto_12360 ?auto_12403 ) ( ON ?auto_12360 ?auto_12394 ) ( CLEAR ?auto_12360 ) ( not ( = ?auto_12359 ?auto_12360 ) ) ( not ( = ?auto_12359 ?auto_12394 ) ) ( not ( = ?auto_12360 ?auto_12394 ) ) ( not ( = ?auto_12373 ?auto_12402 ) ) ( SURFACE-AT ?auto_12358 ?auto_12374 ) ( CLEAR ?auto_12358 ) ( IS-CRATE ?auto_12359 ) ( AVAILABLE ?auto_12373 ) ( AVAILABLE ?auto_12400 ) ( SURFACE-AT ?auto_12359 ?auto_12379 ) ( ON ?auto_12359 ?auto_12380 ) ( CLEAR ?auto_12359 ) ( TRUCK-AT ?auto_12375 ?auto_12374 ) ( not ( = ?auto_12358 ?auto_12359 ) ) ( not ( = ?auto_12358 ?auto_12380 ) ) ( not ( = ?auto_12359 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12360 ) ) ( not ( = ?auto_12358 ?auto_12394 ) ) ( not ( = ?auto_12360 ?auto_12380 ) ) ( not ( = ?auto_12403 ?auto_12379 ) ) ( not ( = ?auto_12402 ?auto_12400 ) ) ( not ( = ?auto_12394 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12361 ) ) ( not ( = ?auto_12358 ?auto_12388 ) ) ( not ( = ?auto_12359 ?auto_12361 ) ) ( not ( = ?auto_12359 ?auto_12388 ) ) ( not ( = ?auto_12361 ?auto_12394 ) ) ( not ( = ?auto_12361 ?auto_12380 ) ) ( not ( = ?auto_12388 ?auto_12394 ) ) ( not ( = ?auto_12388 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12362 ) ) ( not ( = ?auto_12358 ?auto_12399 ) ) ( not ( = ?auto_12359 ?auto_12362 ) ) ( not ( = ?auto_12359 ?auto_12399 ) ) ( not ( = ?auto_12360 ?auto_12362 ) ) ( not ( = ?auto_12360 ?auto_12399 ) ) ( not ( = ?auto_12362 ?auto_12388 ) ) ( not ( = ?auto_12362 ?auto_12394 ) ) ( not ( = ?auto_12362 ?auto_12380 ) ) ( not ( = ?auto_12378 ?auto_12379 ) ) ( not ( = ?auto_12378 ?auto_12403 ) ) ( not ( = ?auto_12383 ?auto_12400 ) ) ( not ( = ?auto_12383 ?auto_12402 ) ) ( not ( = ?auto_12399 ?auto_12388 ) ) ( not ( = ?auto_12399 ?auto_12394 ) ) ( not ( = ?auto_12399 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12363 ) ) ( not ( = ?auto_12358 ?auto_12405 ) ) ( not ( = ?auto_12359 ?auto_12363 ) ) ( not ( = ?auto_12359 ?auto_12405 ) ) ( not ( = ?auto_12360 ?auto_12363 ) ) ( not ( = ?auto_12360 ?auto_12405 ) ) ( not ( = ?auto_12361 ?auto_12363 ) ) ( not ( = ?auto_12361 ?auto_12405 ) ) ( not ( = ?auto_12363 ?auto_12399 ) ) ( not ( = ?auto_12363 ?auto_12388 ) ) ( not ( = ?auto_12363 ?auto_12394 ) ) ( not ( = ?auto_12363 ?auto_12380 ) ) ( not ( = ?auto_12384 ?auto_12378 ) ) ( not ( = ?auto_12384 ?auto_12379 ) ) ( not ( = ?auto_12384 ?auto_12403 ) ) ( not ( = ?auto_12407 ?auto_12383 ) ) ( not ( = ?auto_12407 ?auto_12400 ) ) ( not ( = ?auto_12407 ?auto_12402 ) ) ( not ( = ?auto_12405 ?auto_12399 ) ) ( not ( = ?auto_12405 ?auto_12388 ) ) ( not ( = ?auto_12405 ?auto_12394 ) ) ( not ( = ?auto_12405 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12366 ) ) ( not ( = ?auto_12358 ?auto_12382 ) ) ( not ( = ?auto_12359 ?auto_12366 ) ) ( not ( = ?auto_12359 ?auto_12382 ) ) ( not ( = ?auto_12360 ?auto_12366 ) ) ( not ( = ?auto_12360 ?auto_12382 ) ) ( not ( = ?auto_12361 ?auto_12366 ) ) ( not ( = ?auto_12361 ?auto_12382 ) ) ( not ( = ?auto_12362 ?auto_12366 ) ) ( not ( = ?auto_12362 ?auto_12382 ) ) ( not ( = ?auto_12366 ?auto_12405 ) ) ( not ( = ?auto_12366 ?auto_12399 ) ) ( not ( = ?auto_12366 ?auto_12388 ) ) ( not ( = ?auto_12366 ?auto_12394 ) ) ( not ( = ?auto_12366 ?auto_12380 ) ) ( not ( = ?auto_12389 ?auto_12384 ) ) ( not ( = ?auto_12389 ?auto_12378 ) ) ( not ( = ?auto_12389 ?auto_12379 ) ) ( not ( = ?auto_12389 ?auto_12403 ) ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12383 ) ) ( not ( = ?auto_12406 ?auto_12400 ) ) ( not ( = ?auto_12406 ?auto_12402 ) ) ( not ( = ?auto_12382 ?auto_12405 ) ) ( not ( = ?auto_12382 ?auto_12399 ) ) ( not ( = ?auto_12382 ?auto_12388 ) ) ( not ( = ?auto_12382 ?auto_12394 ) ) ( not ( = ?auto_12382 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12365 ) ) ( not ( = ?auto_12358 ?auto_12387 ) ) ( not ( = ?auto_12359 ?auto_12365 ) ) ( not ( = ?auto_12359 ?auto_12387 ) ) ( not ( = ?auto_12360 ?auto_12365 ) ) ( not ( = ?auto_12360 ?auto_12387 ) ) ( not ( = ?auto_12361 ?auto_12365 ) ) ( not ( = ?auto_12361 ?auto_12387 ) ) ( not ( = ?auto_12362 ?auto_12365 ) ) ( not ( = ?auto_12362 ?auto_12387 ) ) ( not ( = ?auto_12363 ?auto_12365 ) ) ( not ( = ?auto_12363 ?auto_12387 ) ) ( not ( = ?auto_12365 ?auto_12382 ) ) ( not ( = ?auto_12365 ?auto_12405 ) ) ( not ( = ?auto_12365 ?auto_12399 ) ) ( not ( = ?auto_12365 ?auto_12388 ) ) ( not ( = ?auto_12365 ?auto_12394 ) ) ( not ( = ?auto_12365 ?auto_12380 ) ) ( not ( = ?auto_12398 ?auto_12389 ) ) ( not ( = ?auto_12398 ?auto_12384 ) ) ( not ( = ?auto_12398 ?auto_12378 ) ) ( not ( = ?auto_12398 ?auto_12379 ) ) ( not ( = ?auto_12398 ?auto_12403 ) ) ( not ( = ?auto_12393 ?auto_12406 ) ) ( not ( = ?auto_12393 ?auto_12407 ) ) ( not ( = ?auto_12393 ?auto_12383 ) ) ( not ( = ?auto_12393 ?auto_12400 ) ) ( not ( = ?auto_12393 ?auto_12402 ) ) ( not ( = ?auto_12387 ?auto_12382 ) ) ( not ( = ?auto_12387 ?auto_12405 ) ) ( not ( = ?auto_12387 ?auto_12399 ) ) ( not ( = ?auto_12387 ?auto_12388 ) ) ( not ( = ?auto_12387 ?auto_12394 ) ) ( not ( = ?auto_12387 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12364 ) ) ( not ( = ?auto_12358 ?auto_12381 ) ) ( not ( = ?auto_12359 ?auto_12364 ) ) ( not ( = ?auto_12359 ?auto_12381 ) ) ( not ( = ?auto_12360 ?auto_12364 ) ) ( not ( = ?auto_12360 ?auto_12381 ) ) ( not ( = ?auto_12361 ?auto_12364 ) ) ( not ( = ?auto_12361 ?auto_12381 ) ) ( not ( = ?auto_12362 ?auto_12364 ) ) ( not ( = ?auto_12362 ?auto_12381 ) ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( not ( = ?auto_12363 ?auto_12381 ) ) ( not ( = ?auto_12366 ?auto_12364 ) ) ( not ( = ?auto_12366 ?auto_12381 ) ) ( not ( = ?auto_12364 ?auto_12387 ) ) ( not ( = ?auto_12364 ?auto_12382 ) ) ( not ( = ?auto_12364 ?auto_12405 ) ) ( not ( = ?auto_12364 ?auto_12399 ) ) ( not ( = ?auto_12364 ?auto_12388 ) ) ( not ( = ?auto_12364 ?auto_12394 ) ) ( not ( = ?auto_12364 ?auto_12380 ) ) ( not ( = ?auto_12391 ?auto_12398 ) ) ( not ( = ?auto_12391 ?auto_12389 ) ) ( not ( = ?auto_12391 ?auto_12384 ) ) ( not ( = ?auto_12391 ?auto_12378 ) ) ( not ( = ?auto_12391 ?auto_12379 ) ) ( not ( = ?auto_12391 ?auto_12403 ) ) ( not ( = ?auto_12386 ?auto_12393 ) ) ( not ( = ?auto_12386 ?auto_12406 ) ) ( not ( = ?auto_12386 ?auto_12407 ) ) ( not ( = ?auto_12386 ?auto_12383 ) ) ( not ( = ?auto_12386 ?auto_12400 ) ) ( not ( = ?auto_12386 ?auto_12402 ) ) ( not ( = ?auto_12381 ?auto_12387 ) ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12405 ) ) ( not ( = ?auto_12381 ?auto_12399 ) ) ( not ( = ?auto_12381 ?auto_12388 ) ) ( not ( = ?auto_12381 ?auto_12394 ) ) ( not ( = ?auto_12381 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12367 ) ) ( not ( = ?auto_12358 ?auto_12396 ) ) ( not ( = ?auto_12359 ?auto_12367 ) ) ( not ( = ?auto_12359 ?auto_12396 ) ) ( not ( = ?auto_12360 ?auto_12367 ) ) ( not ( = ?auto_12360 ?auto_12396 ) ) ( not ( = ?auto_12361 ?auto_12367 ) ) ( not ( = ?auto_12361 ?auto_12396 ) ) ( not ( = ?auto_12362 ?auto_12367 ) ) ( not ( = ?auto_12362 ?auto_12396 ) ) ( not ( = ?auto_12363 ?auto_12367 ) ) ( not ( = ?auto_12363 ?auto_12396 ) ) ( not ( = ?auto_12366 ?auto_12367 ) ) ( not ( = ?auto_12366 ?auto_12396 ) ) ( not ( = ?auto_12365 ?auto_12367 ) ) ( not ( = ?auto_12365 ?auto_12396 ) ) ( not ( = ?auto_12367 ?auto_12381 ) ) ( not ( = ?auto_12367 ?auto_12387 ) ) ( not ( = ?auto_12367 ?auto_12382 ) ) ( not ( = ?auto_12367 ?auto_12405 ) ) ( not ( = ?auto_12367 ?auto_12399 ) ) ( not ( = ?auto_12367 ?auto_12388 ) ) ( not ( = ?auto_12367 ?auto_12394 ) ) ( not ( = ?auto_12367 ?auto_12380 ) ) ( not ( = ?auto_12395 ?auto_12391 ) ) ( not ( = ?auto_12395 ?auto_12398 ) ) ( not ( = ?auto_12395 ?auto_12389 ) ) ( not ( = ?auto_12395 ?auto_12384 ) ) ( not ( = ?auto_12395 ?auto_12378 ) ) ( not ( = ?auto_12395 ?auto_12379 ) ) ( not ( = ?auto_12395 ?auto_12403 ) ) ( not ( = ?auto_12392 ?auto_12386 ) ) ( not ( = ?auto_12392 ?auto_12393 ) ) ( not ( = ?auto_12392 ?auto_12406 ) ) ( not ( = ?auto_12392 ?auto_12407 ) ) ( not ( = ?auto_12392 ?auto_12383 ) ) ( not ( = ?auto_12392 ?auto_12400 ) ) ( not ( = ?auto_12392 ?auto_12402 ) ) ( not ( = ?auto_12396 ?auto_12381 ) ) ( not ( = ?auto_12396 ?auto_12387 ) ) ( not ( = ?auto_12396 ?auto_12382 ) ) ( not ( = ?auto_12396 ?auto_12405 ) ) ( not ( = ?auto_12396 ?auto_12399 ) ) ( not ( = ?auto_12396 ?auto_12388 ) ) ( not ( = ?auto_12396 ?auto_12394 ) ) ( not ( = ?auto_12396 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12369 ) ) ( not ( = ?auto_12358 ?auto_12377 ) ) ( not ( = ?auto_12359 ?auto_12369 ) ) ( not ( = ?auto_12359 ?auto_12377 ) ) ( not ( = ?auto_12360 ?auto_12369 ) ) ( not ( = ?auto_12360 ?auto_12377 ) ) ( not ( = ?auto_12361 ?auto_12369 ) ) ( not ( = ?auto_12361 ?auto_12377 ) ) ( not ( = ?auto_12362 ?auto_12369 ) ) ( not ( = ?auto_12362 ?auto_12377 ) ) ( not ( = ?auto_12363 ?auto_12369 ) ) ( not ( = ?auto_12363 ?auto_12377 ) ) ( not ( = ?auto_12366 ?auto_12369 ) ) ( not ( = ?auto_12366 ?auto_12377 ) ) ( not ( = ?auto_12365 ?auto_12369 ) ) ( not ( = ?auto_12365 ?auto_12377 ) ) ( not ( = ?auto_12364 ?auto_12369 ) ) ( not ( = ?auto_12364 ?auto_12377 ) ) ( not ( = ?auto_12369 ?auto_12396 ) ) ( not ( = ?auto_12369 ?auto_12381 ) ) ( not ( = ?auto_12369 ?auto_12387 ) ) ( not ( = ?auto_12369 ?auto_12382 ) ) ( not ( = ?auto_12369 ?auto_12405 ) ) ( not ( = ?auto_12369 ?auto_12399 ) ) ( not ( = ?auto_12369 ?auto_12388 ) ) ( not ( = ?auto_12369 ?auto_12394 ) ) ( not ( = ?auto_12369 ?auto_12380 ) ) ( not ( = ?auto_12401 ?auto_12395 ) ) ( not ( = ?auto_12401 ?auto_12391 ) ) ( not ( = ?auto_12401 ?auto_12398 ) ) ( not ( = ?auto_12401 ?auto_12389 ) ) ( not ( = ?auto_12401 ?auto_12384 ) ) ( not ( = ?auto_12401 ?auto_12378 ) ) ( not ( = ?auto_12401 ?auto_12379 ) ) ( not ( = ?auto_12401 ?auto_12403 ) ) ( not ( = ?auto_12397 ?auto_12392 ) ) ( not ( = ?auto_12397 ?auto_12386 ) ) ( not ( = ?auto_12397 ?auto_12393 ) ) ( not ( = ?auto_12397 ?auto_12406 ) ) ( not ( = ?auto_12397 ?auto_12407 ) ) ( not ( = ?auto_12397 ?auto_12383 ) ) ( not ( = ?auto_12397 ?auto_12400 ) ) ( not ( = ?auto_12397 ?auto_12402 ) ) ( not ( = ?auto_12377 ?auto_12396 ) ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( not ( = ?auto_12377 ?auto_12387 ) ) ( not ( = ?auto_12377 ?auto_12382 ) ) ( not ( = ?auto_12377 ?auto_12405 ) ) ( not ( = ?auto_12377 ?auto_12399 ) ) ( not ( = ?auto_12377 ?auto_12388 ) ) ( not ( = ?auto_12377 ?auto_12394 ) ) ( not ( = ?auto_12377 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12368 ) ) ( not ( = ?auto_12358 ?auto_12404 ) ) ( not ( = ?auto_12359 ?auto_12368 ) ) ( not ( = ?auto_12359 ?auto_12404 ) ) ( not ( = ?auto_12360 ?auto_12368 ) ) ( not ( = ?auto_12360 ?auto_12404 ) ) ( not ( = ?auto_12361 ?auto_12368 ) ) ( not ( = ?auto_12361 ?auto_12404 ) ) ( not ( = ?auto_12362 ?auto_12368 ) ) ( not ( = ?auto_12362 ?auto_12404 ) ) ( not ( = ?auto_12363 ?auto_12368 ) ) ( not ( = ?auto_12363 ?auto_12404 ) ) ( not ( = ?auto_12366 ?auto_12368 ) ) ( not ( = ?auto_12366 ?auto_12404 ) ) ( not ( = ?auto_12365 ?auto_12368 ) ) ( not ( = ?auto_12365 ?auto_12404 ) ) ( not ( = ?auto_12364 ?auto_12368 ) ) ( not ( = ?auto_12364 ?auto_12404 ) ) ( not ( = ?auto_12367 ?auto_12368 ) ) ( not ( = ?auto_12367 ?auto_12404 ) ) ( not ( = ?auto_12368 ?auto_12377 ) ) ( not ( = ?auto_12368 ?auto_12396 ) ) ( not ( = ?auto_12368 ?auto_12381 ) ) ( not ( = ?auto_12368 ?auto_12387 ) ) ( not ( = ?auto_12368 ?auto_12382 ) ) ( not ( = ?auto_12368 ?auto_12405 ) ) ( not ( = ?auto_12368 ?auto_12399 ) ) ( not ( = ?auto_12368 ?auto_12388 ) ) ( not ( = ?auto_12368 ?auto_12394 ) ) ( not ( = ?auto_12368 ?auto_12380 ) ) ( not ( = ?auto_12390 ?auto_12401 ) ) ( not ( = ?auto_12390 ?auto_12395 ) ) ( not ( = ?auto_12390 ?auto_12391 ) ) ( not ( = ?auto_12390 ?auto_12398 ) ) ( not ( = ?auto_12390 ?auto_12389 ) ) ( not ( = ?auto_12390 ?auto_12384 ) ) ( not ( = ?auto_12390 ?auto_12378 ) ) ( not ( = ?auto_12390 ?auto_12379 ) ) ( not ( = ?auto_12390 ?auto_12403 ) ) ( not ( = ?auto_12385 ?auto_12397 ) ) ( not ( = ?auto_12385 ?auto_12392 ) ) ( not ( = ?auto_12385 ?auto_12386 ) ) ( not ( = ?auto_12385 ?auto_12393 ) ) ( not ( = ?auto_12385 ?auto_12406 ) ) ( not ( = ?auto_12385 ?auto_12407 ) ) ( not ( = ?auto_12385 ?auto_12383 ) ) ( not ( = ?auto_12385 ?auto_12400 ) ) ( not ( = ?auto_12385 ?auto_12402 ) ) ( not ( = ?auto_12404 ?auto_12377 ) ) ( not ( = ?auto_12404 ?auto_12396 ) ) ( not ( = ?auto_12404 ?auto_12381 ) ) ( not ( = ?auto_12404 ?auto_12387 ) ) ( not ( = ?auto_12404 ?auto_12382 ) ) ( not ( = ?auto_12404 ?auto_12405 ) ) ( not ( = ?auto_12404 ?auto_12399 ) ) ( not ( = ?auto_12404 ?auto_12388 ) ) ( not ( = ?auto_12404 ?auto_12394 ) ) ( not ( = ?auto_12404 ?auto_12380 ) ) ( not ( = ?auto_12358 ?auto_12370 ) ) ( not ( = ?auto_12358 ?auto_12372 ) ) ( not ( = ?auto_12359 ?auto_12370 ) ) ( not ( = ?auto_12359 ?auto_12372 ) ) ( not ( = ?auto_12360 ?auto_12370 ) ) ( not ( = ?auto_12360 ?auto_12372 ) ) ( not ( = ?auto_12361 ?auto_12370 ) ) ( not ( = ?auto_12361 ?auto_12372 ) ) ( not ( = ?auto_12362 ?auto_12370 ) ) ( not ( = ?auto_12362 ?auto_12372 ) ) ( not ( = ?auto_12363 ?auto_12370 ) ) ( not ( = ?auto_12363 ?auto_12372 ) ) ( not ( = ?auto_12366 ?auto_12370 ) ) ( not ( = ?auto_12366 ?auto_12372 ) ) ( not ( = ?auto_12365 ?auto_12370 ) ) ( not ( = ?auto_12365 ?auto_12372 ) ) ( not ( = ?auto_12364 ?auto_12370 ) ) ( not ( = ?auto_12364 ?auto_12372 ) ) ( not ( = ?auto_12367 ?auto_12370 ) ) ( not ( = ?auto_12367 ?auto_12372 ) ) ( not ( = ?auto_12369 ?auto_12370 ) ) ( not ( = ?auto_12369 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12404 ) ) ( not ( = ?auto_12370 ?auto_12377 ) ) ( not ( = ?auto_12370 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12381 ) ) ( not ( = ?auto_12370 ?auto_12387 ) ) ( not ( = ?auto_12370 ?auto_12382 ) ) ( not ( = ?auto_12370 ?auto_12405 ) ) ( not ( = ?auto_12370 ?auto_12399 ) ) ( not ( = ?auto_12370 ?auto_12388 ) ) ( not ( = ?auto_12370 ?auto_12394 ) ) ( not ( = ?auto_12370 ?auto_12380 ) ) ( not ( = ?auto_12371 ?auto_12390 ) ) ( not ( = ?auto_12371 ?auto_12401 ) ) ( not ( = ?auto_12371 ?auto_12395 ) ) ( not ( = ?auto_12371 ?auto_12391 ) ) ( not ( = ?auto_12371 ?auto_12398 ) ) ( not ( = ?auto_12371 ?auto_12389 ) ) ( not ( = ?auto_12371 ?auto_12384 ) ) ( not ( = ?auto_12371 ?auto_12378 ) ) ( not ( = ?auto_12371 ?auto_12379 ) ) ( not ( = ?auto_12371 ?auto_12403 ) ) ( not ( = ?auto_12376 ?auto_12385 ) ) ( not ( = ?auto_12376 ?auto_12397 ) ) ( not ( = ?auto_12376 ?auto_12392 ) ) ( not ( = ?auto_12376 ?auto_12386 ) ) ( not ( = ?auto_12376 ?auto_12393 ) ) ( not ( = ?auto_12376 ?auto_12406 ) ) ( not ( = ?auto_12376 ?auto_12407 ) ) ( not ( = ?auto_12376 ?auto_12383 ) ) ( not ( = ?auto_12376 ?auto_12400 ) ) ( not ( = ?auto_12376 ?auto_12402 ) ) ( not ( = ?auto_12372 ?auto_12404 ) ) ( not ( = ?auto_12372 ?auto_12377 ) ) ( not ( = ?auto_12372 ?auto_12396 ) ) ( not ( = ?auto_12372 ?auto_12381 ) ) ( not ( = ?auto_12372 ?auto_12387 ) ) ( not ( = ?auto_12372 ?auto_12382 ) ) ( not ( = ?auto_12372 ?auto_12405 ) ) ( not ( = ?auto_12372 ?auto_12399 ) ) ( not ( = ?auto_12372 ?auto_12388 ) ) ( not ( = ?auto_12372 ?auto_12394 ) ) ( not ( = ?auto_12372 ?auto_12380 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12358 ?auto_12359 ?auto_12360 ?auto_12361 ?auto_12362 ?auto_12363 ?auto_12366 ?auto_12365 ?auto_12364 ?auto_12367 ?auto_12369 ?auto_12368 )
      ( MAKE-1CRATE ?auto_12368 ?auto_12370 )
      ( MAKE-12CRATE-VERIFY ?auto_12358 ?auto_12359 ?auto_12360 ?auto_12361 ?auto_12362 ?auto_12363 ?auto_12366 ?auto_12365 ?auto_12364 ?auto_12367 ?auto_12369 ?auto_12368 ?auto_12370 ) )
  )

)

