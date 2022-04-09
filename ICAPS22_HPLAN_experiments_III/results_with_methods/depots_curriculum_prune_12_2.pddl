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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11891 - SURFACE
      ?auto_11892 - SURFACE
      ?auto_11893 - SURFACE
    )
    :vars
    (
      ?auto_11896 - HOIST
      ?auto_11894 - PLACE
      ?auto_11897 - PLACE
      ?auto_11898 - HOIST
      ?auto_11899 - SURFACE
      ?auto_11901 - PLACE
      ?auto_11902 - HOIST
      ?auto_11900 - SURFACE
      ?auto_11895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11896 ?auto_11894 ) ( IS-CRATE ?auto_11893 ) ( not ( = ?auto_11897 ?auto_11894 ) ) ( HOIST-AT ?auto_11898 ?auto_11897 ) ( AVAILABLE ?auto_11898 ) ( SURFACE-AT ?auto_11893 ?auto_11897 ) ( ON ?auto_11893 ?auto_11899 ) ( CLEAR ?auto_11893 ) ( not ( = ?auto_11892 ?auto_11893 ) ) ( not ( = ?auto_11892 ?auto_11899 ) ) ( not ( = ?auto_11893 ?auto_11899 ) ) ( not ( = ?auto_11896 ?auto_11898 ) ) ( SURFACE-AT ?auto_11891 ?auto_11894 ) ( CLEAR ?auto_11891 ) ( IS-CRATE ?auto_11892 ) ( AVAILABLE ?auto_11896 ) ( not ( = ?auto_11901 ?auto_11894 ) ) ( HOIST-AT ?auto_11902 ?auto_11901 ) ( AVAILABLE ?auto_11902 ) ( SURFACE-AT ?auto_11892 ?auto_11901 ) ( ON ?auto_11892 ?auto_11900 ) ( CLEAR ?auto_11892 ) ( TRUCK-AT ?auto_11895 ?auto_11894 ) ( not ( = ?auto_11891 ?auto_11892 ) ) ( not ( = ?auto_11891 ?auto_11900 ) ) ( not ( = ?auto_11892 ?auto_11900 ) ) ( not ( = ?auto_11896 ?auto_11902 ) ) ( not ( = ?auto_11891 ?auto_11893 ) ) ( not ( = ?auto_11891 ?auto_11899 ) ) ( not ( = ?auto_11893 ?auto_11900 ) ) ( not ( = ?auto_11897 ?auto_11901 ) ) ( not ( = ?auto_11898 ?auto_11902 ) ) ( not ( = ?auto_11899 ?auto_11900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11891 ?auto_11892 )
      ( MAKE-1CRATE ?auto_11892 ?auto_11893 )
      ( MAKE-2CRATE-VERIFY ?auto_11891 ?auto_11892 ?auto_11893 ) )
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
      ?auto_11923 - HOIST
      ?auto_11922 - PLACE
      ?auto_11921 - PLACE
      ?auto_11925 - HOIST
      ?auto_11926 - SURFACE
      ?auto_11928 - PLACE
      ?auto_11929 - HOIST
      ?auto_11927 - SURFACE
      ?auto_11930 - SURFACE
      ?auto_11924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11923 ?auto_11922 ) ( IS-CRATE ?auto_11920 ) ( not ( = ?auto_11921 ?auto_11922 ) ) ( HOIST-AT ?auto_11925 ?auto_11921 ) ( SURFACE-AT ?auto_11920 ?auto_11921 ) ( ON ?auto_11920 ?auto_11926 ) ( CLEAR ?auto_11920 ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11919 ?auto_11926 ) ) ( not ( = ?auto_11920 ?auto_11926 ) ) ( not ( = ?auto_11923 ?auto_11925 ) ) ( IS-CRATE ?auto_11919 ) ( not ( = ?auto_11928 ?auto_11922 ) ) ( HOIST-AT ?auto_11929 ?auto_11928 ) ( AVAILABLE ?auto_11929 ) ( SURFACE-AT ?auto_11919 ?auto_11928 ) ( ON ?auto_11919 ?auto_11927 ) ( CLEAR ?auto_11919 ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11927 ) ) ( not ( = ?auto_11919 ?auto_11927 ) ) ( not ( = ?auto_11923 ?auto_11929 ) ) ( SURFACE-AT ?auto_11917 ?auto_11922 ) ( CLEAR ?auto_11917 ) ( IS-CRATE ?auto_11918 ) ( AVAILABLE ?auto_11923 ) ( AVAILABLE ?auto_11925 ) ( SURFACE-AT ?auto_11918 ?auto_11921 ) ( ON ?auto_11918 ?auto_11930 ) ( CLEAR ?auto_11918 ) ( TRUCK-AT ?auto_11924 ?auto_11922 ) ( not ( = ?auto_11917 ?auto_11918 ) ) ( not ( = ?auto_11917 ?auto_11930 ) ) ( not ( = ?auto_11918 ?auto_11930 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) ( not ( = ?auto_11917 ?auto_11927 ) ) ( not ( = ?auto_11919 ?auto_11930 ) ) ( not ( = ?auto_11928 ?auto_11921 ) ) ( not ( = ?auto_11929 ?auto_11925 ) ) ( not ( = ?auto_11927 ?auto_11930 ) ) ( not ( = ?auto_11917 ?auto_11920 ) ) ( not ( = ?auto_11917 ?auto_11926 ) ) ( not ( = ?auto_11918 ?auto_11920 ) ) ( not ( = ?auto_11918 ?auto_11926 ) ) ( not ( = ?auto_11920 ?auto_11927 ) ) ( not ( = ?auto_11920 ?auto_11930 ) ) ( not ( = ?auto_11926 ?auto_11927 ) ) ( not ( = ?auto_11926 ?auto_11930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11917 ?auto_11918 ?auto_11919 )
      ( MAKE-1CRATE ?auto_11919 ?auto_11920 )
      ( MAKE-3CRATE-VERIFY ?auto_11917 ?auto_11918 ?auto_11919 ?auto_11920 ) )
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
      ?auto_11956 - HOIST
      ?auto_11951 - PLACE
      ?auto_11953 - PLACE
      ?auto_11954 - HOIST
      ?auto_11952 - SURFACE
      ?auto_11957 - PLACE
      ?auto_11959 - HOIST
      ?auto_11960 - SURFACE
      ?auto_11958 - PLACE
      ?auto_11962 - HOIST
      ?auto_11961 - SURFACE
      ?auto_11963 - SURFACE
      ?auto_11955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11956 ?auto_11951 ) ( IS-CRATE ?auto_11950 ) ( not ( = ?auto_11953 ?auto_11951 ) ) ( HOIST-AT ?auto_11954 ?auto_11953 ) ( AVAILABLE ?auto_11954 ) ( SURFACE-AT ?auto_11950 ?auto_11953 ) ( ON ?auto_11950 ?auto_11952 ) ( CLEAR ?auto_11950 ) ( not ( = ?auto_11949 ?auto_11950 ) ) ( not ( = ?auto_11949 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11952 ) ) ( not ( = ?auto_11956 ?auto_11954 ) ) ( IS-CRATE ?auto_11949 ) ( not ( = ?auto_11957 ?auto_11951 ) ) ( HOIST-AT ?auto_11959 ?auto_11957 ) ( SURFACE-AT ?auto_11949 ?auto_11957 ) ( ON ?auto_11949 ?auto_11960 ) ( CLEAR ?auto_11949 ) ( not ( = ?auto_11948 ?auto_11949 ) ) ( not ( = ?auto_11948 ?auto_11960 ) ) ( not ( = ?auto_11949 ?auto_11960 ) ) ( not ( = ?auto_11956 ?auto_11959 ) ) ( IS-CRATE ?auto_11948 ) ( not ( = ?auto_11958 ?auto_11951 ) ) ( HOIST-AT ?auto_11962 ?auto_11958 ) ( AVAILABLE ?auto_11962 ) ( SURFACE-AT ?auto_11948 ?auto_11958 ) ( ON ?auto_11948 ?auto_11961 ) ( CLEAR ?auto_11948 ) ( not ( = ?auto_11947 ?auto_11948 ) ) ( not ( = ?auto_11947 ?auto_11961 ) ) ( not ( = ?auto_11948 ?auto_11961 ) ) ( not ( = ?auto_11956 ?auto_11962 ) ) ( SURFACE-AT ?auto_11946 ?auto_11951 ) ( CLEAR ?auto_11946 ) ( IS-CRATE ?auto_11947 ) ( AVAILABLE ?auto_11956 ) ( AVAILABLE ?auto_11959 ) ( SURFACE-AT ?auto_11947 ?auto_11957 ) ( ON ?auto_11947 ?auto_11963 ) ( CLEAR ?auto_11947 ) ( TRUCK-AT ?auto_11955 ?auto_11951 ) ( not ( = ?auto_11946 ?auto_11947 ) ) ( not ( = ?auto_11946 ?auto_11963 ) ) ( not ( = ?auto_11947 ?auto_11963 ) ) ( not ( = ?auto_11946 ?auto_11948 ) ) ( not ( = ?auto_11946 ?auto_11961 ) ) ( not ( = ?auto_11948 ?auto_11963 ) ) ( not ( = ?auto_11958 ?auto_11957 ) ) ( not ( = ?auto_11962 ?auto_11959 ) ) ( not ( = ?auto_11961 ?auto_11963 ) ) ( not ( = ?auto_11946 ?auto_11949 ) ) ( not ( = ?auto_11946 ?auto_11960 ) ) ( not ( = ?auto_11947 ?auto_11949 ) ) ( not ( = ?auto_11947 ?auto_11960 ) ) ( not ( = ?auto_11949 ?auto_11961 ) ) ( not ( = ?auto_11949 ?auto_11963 ) ) ( not ( = ?auto_11960 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11963 ) ) ( not ( = ?auto_11946 ?auto_11950 ) ) ( not ( = ?auto_11946 ?auto_11952 ) ) ( not ( = ?auto_11947 ?auto_11950 ) ) ( not ( = ?auto_11947 ?auto_11952 ) ) ( not ( = ?auto_11948 ?auto_11950 ) ) ( not ( = ?auto_11948 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11960 ) ) ( not ( = ?auto_11950 ?auto_11961 ) ) ( not ( = ?auto_11950 ?auto_11963 ) ) ( not ( = ?auto_11953 ?auto_11957 ) ) ( not ( = ?auto_11953 ?auto_11958 ) ) ( not ( = ?auto_11954 ?auto_11959 ) ) ( not ( = ?auto_11954 ?auto_11962 ) ) ( not ( = ?auto_11952 ?auto_11960 ) ) ( not ( = ?auto_11952 ?auto_11961 ) ) ( not ( = ?auto_11952 ?auto_11963 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11946 ?auto_11947 ?auto_11948 ?auto_11949 )
      ( MAKE-1CRATE ?auto_11949 ?auto_11950 )
      ( MAKE-4CRATE-VERIFY ?auto_11946 ?auto_11947 ?auto_11948 ?auto_11949 ?auto_11950 ) )
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
      ?auto_11987 - HOIST
      ?auto_11990 - PLACE
      ?auto_11986 - PLACE
      ?auto_11991 - HOIST
      ?auto_11989 - SURFACE
      ?auto_11997 - PLACE
      ?auto_11995 - HOIST
      ?auto_11996 - SURFACE
      ?auto_11994 - PLACE
      ?auto_12001 - HOIST
      ?auto_11993 - SURFACE
      ?auto_12000 - PLACE
      ?auto_11998 - HOIST
      ?auto_11999 - SURFACE
      ?auto_11992 - SURFACE
      ?auto_11988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11987 ?auto_11990 ) ( IS-CRATE ?auto_11985 ) ( not ( = ?auto_11986 ?auto_11990 ) ) ( HOIST-AT ?auto_11991 ?auto_11986 ) ( AVAILABLE ?auto_11991 ) ( SURFACE-AT ?auto_11985 ?auto_11986 ) ( ON ?auto_11985 ?auto_11989 ) ( CLEAR ?auto_11985 ) ( not ( = ?auto_11984 ?auto_11985 ) ) ( not ( = ?auto_11984 ?auto_11989 ) ) ( not ( = ?auto_11985 ?auto_11989 ) ) ( not ( = ?auto_11987 ?auto_11991 ) ) ( IS-CRATE ?auto_11984 ) ( not ( = ?auto_11997 ?auto_11990 ) ) ( HOIST-AT ?auto_11995 ?auto_11997 ) ( AVAILABLE ?auto_11995 ) ( SURFACE-AT ?auto_11984 ?auto_11997 ) ( ON ?auto_11984 ?auto_11996 ) ( CLEAR ?auto_11984 ) ( not ( = ?auto_11983 ?auto_11984 ) ) ( not ( = ?auto_11983 ?auto_11996 ) ) ( not ( = ?auto_11984 ?auto_11996 ) ) ( not ( = ?auto_11987 ?auto_11995 ) ) ( IS-CRATE ?auto_11983 ) ( not ( = ?auto_11994 ?auto_11990 ) ) ( HOIST-AT ?auto_12001 ?auto_11994 ) ( SURFACE-AT ?auto_11983 ?auto_11994 ) ( ON ?auto_11983 ?auto_11993 ) ( CLEAR ?auto_11983 ) ( not ( = ?auto_11982 ?auto_11983 ) ) ( not ( = ?auto_11982 ?auto_11993 ) ) ( not ( = ?auto_11983 ?auto_11993 ) ) ( not ( = ?auto_11987 ?auto_12001 ) ) ( IS-CRATE ?auto_11982 ) ( not ( = ?auto_12000 ?auto_11990 ) ) ( HOIST-AT ?auto_11998 ?auto_12000 ) ( AVAILABLE ?auto_11998 ) ( SURFACE-AT ?auto_11982 ?auto_12000 ) ( ON ?auto_11982 ?auto_11999 ) ( CLEAR ?auto_11982 ) ( not ( = ?auto_11981 ?auto_11982 ) ) ( not ( = ?auto_11981 ?auto_11999 ) ) ( not ( = ?auto_11982 ?auto_11999 ) ) ( not ( = ?auto_11987 ?auto_11998 ) ) ( SURFACE-AT ?auto_11980 ?auto_11990 ) ( CLEAR ?auto_11980 ) ( IS-CRATE ?auto_11981 ) ( AVAILABLE ?auto_11987 ) ( AVAILABLE ?auto_12001 ) ( SURFACE-AT ?auto_11981 ?auto_11994 ) ( ON ?auto_11981 ?auto_11992 ) ( CLEAR ?auto_11981 ) ( TRUCK-AT ?auto_11988 ?auto_11990 ) ( not ( = ?auto_11980 ?auto_11981 ) ) ( not ( = ?auto_11980 ?auto_11992 ) ) ( not ( = ?auto_11981 ?auto_11992 ) ) ( not ( = ?auto_11980 ?auto_11982 ) ) ( not ( = ?auto_11980 ?auto_11999 ) ) ( not ( = ?auto_11982 ?auto_11992 ) ) ( not ( = ?auto_12000 ?auto_11994 ) ) ( not ( = ?auto_11998 ?auto_12001 ) ) ( not ( = ?auto_11999 ?auto_11992 ) ) ( not ( = ?auto_11980 ?auto_11983 ) ) ( not ( = ?auto_11980 ?auto_11993 ) ) ( not ( = ?auto_11981 ?auto_11983 ) ) ( not ( = ?auto_11981 ?auto_11993 ) ) ( not ( = ?auto_11983 ?auto_11999 ) ) ( not ( = ?auto_11983 ?auto_11992 ) ) ( not ( = ?auto_11993 ?auto_11999 ) ) ( not ( = ?auto_11993 ?auto_11992 ) ) ( not ( = ?auto_11980 ?auto_11984 ) ) ( not ( = ?auto_11980 ?auto_11996 ) ) ( not ( = ?auto_11981 ?auto_11984 ) ) ( not ( = ?auto_11981 ?auto_11996 ) ) ( not ( = ?auto_11982 ?auto_11984 ) ) ( not ( = ?auto_11982 ?auto_11996 ) ) ( not ( = ?auto_11984 ?auto_11993 ) ) ( not ( = ?auto_11984 ?auto_11999 ) ) ( not ( = ?auto_11984 ?auto_11992 ) ) ( not ( = ?auto_11997 ?auto_11994 ) ) ( not ( = ?auto_11997 ?auto_12000 ) ) ( not ( = ?auto_11995 ?auto_12001 ) ) ( not ( = ?auto_11995 ?auto_11998 ) ) ( not ( = ?auto_11996 ?auto_11993 ) ) ( not ( = ?auto_11996 ?auto_11999 ) ) ( not ( = ?auto_11996 ?auto_11992 ) ) ( not ( = ?auto_11980 ?auto_11985 ) ) ( not ( = ?auto_11980 ?auto_11989 ) ) ( not ( = ?auto_11981 ?auto_11985 ) ) ( not ( = ?auto_11981 ?auto_11989 ) ) ( not ( = ?auto_11982 ?auto_11985 ) ) ( not ( = ?auto_11982 ?auto_11989 ) ) ( not ( = ?auto_11983 ?auto_11985 ) ) ( not ( = ?auto_11983 ?auto_11989 ) ) ( not ( = ?auto_11985 ?auto_11996 ) ) ( not ( = ?auto_11985 ?auto_11993 ) ) ( not ( = ?auto_11985 ?auto_11999 ) ) ( not ( = ?auto_11985 ?auto_11992 ) ) ( not ( = ?auto_11986 ?auto_11997 ) ) ( not ( = ?auto_11986 ?auto_11994 ) ) ( not ( = ?auto_11986 ?auto_12000 ) ) ( not ( = ?auto_11991 ?auto_11995 ) ) ( not ( = ?auto_11991 ?auto_12001 ) ) ( not ( = ?auto_11991 ?auto_11998 ) ) ( not ( = ?auto_11989 ?auto_11996 ) ) ( not ( = ?auto_11989 ?auto_11993 ) ) ( not ( = ?auto_11989 ?auto_11999 ) ) ( not ( = ?auto_11989 ?auto_11992 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11980 ?auto_11981 ?auto_11982 ?auto_11983 ?auto_11984 )
      ( MAKE-1CRATE ?auto_11984 ?auto_11985 )
      ( MAKE-5CRATE-VERIFY ?auto_11980 ?auto_11981 ?auto_11982 ?auto_11983 ?auto_11984 ?auto_11985 ) )
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
      ?auto_12026 - HOIST
      ?auto_12030 - PLACE
      ?auto_12028 - PLACE
      ?auto_12029 - HOIST
      ?auto_12031 - SURFACE
      ?auto_12036 - PLACE
      ?auto_12042 - HOIST
      ?auto_12040 - SURFACE
      ?auto_12039 - PLACE
      ?auto_12043 - HOIST
      ?auto_12038 - SURFACE
      ?auto_12032 - PLACE
      ?auto_12034 - HOIST
      ?auto_12044 - SURFACE
      ?auto_12041 - PLACE
      ?auto_12037 - HOIST
      ?auto_12035 - SURFACE
      ?auto_12033 - SURFACE
      ?auto_12027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12026 ?auto_12030 ) ( IS-CRATE ?auto_12025 ) ( not ( = ?auto_12028 ?auto_12030 ) ) ( HOIST-AT ?auto_12029 ?auto_12028 ) ( AVAILABLE ?auto_12029 ) ( SURFACE-AT ?auto_12025 ?auto_12028 ) ( ON ?auto_12025 ?auto_12031 ) ( CLEAR ?auto_12025 ) ( not ( = ?auto_12024 ?auto_12025 ) ) ( not ( = ?auto_12024 ?auto_12031 ) ) ( not ( = ?auto_12025 ?auto_12031 ) ) ( not ( = ?auto_12026 ?auto_12029 ) ) ( IS-CRATE ?auto_12024 ) ( not ( = ?auto_12036 ?auto_12030 ) ) ( HOIST-AT ?auto_12042 ?auto_12036 ) ( AVAILABLE ?auto_12042 ) ( SURFACE-AT ?auto_12024 ?auto_12036 ) ( ON ?auto_12024 ?auto_12040 ) ( CLEAR ?auto_12024 ) ( not ( = ?auto_12023 ?auto_12024 ) ) ( not ( = ?auto_12023 ?auto_12040 ) ) ( not ( = ?auto_12024 ?auto_12040 ) ) ( not ( = ?auto_12026 ?auto_12042 ) ) ( IS-CRATE ?auto_12023 ) ( not ( = ?auto_12039 ?auto_12030 ) ) ( HOIST-AT ?auto_12043 ?auto_12039 ) ( AVAILABLE ?auto_12043 ) ( SURFACE-AT ?auto_12023 ?auto_12039 ) ( ON ?auto_12023 ?auto_12038 ) ( CLEAR ?auto_12023 ) ( not ( = ?auto_12022 ?auto_12023 ) ) ( not ( = ?auto_12022 ?auto_12038 ) ) ( not ( = ?auto_12023 ?auto_12038 ) ) ( not ( = ?auto_12026 ?auto_12043 ) ) ( IS-CRATE ?auto_12022 ) ( not ( = ?auto_12032 ?auto_12030 ) ) ( HOIST-AT ?auto_12034 ?auto_12032 ) ( SURFACE-AT ?auto_12022 ?auto_12032 ) ( ON ?auto_12022 ?auto_12044 ) ( CLEAR ?auto_12022 ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12021 ?auto_12044 ) ) ( not ( = ?auto_12022 ?auto_12044 ) ) ( not ( = ?auto_12026 ?auto_12034 ) ) ( IS-CRATE ?auto_12021 ) ( not ( = ?auto_12041 ?auto_12030 ) ) ( HOIST-AT ?auto_12037 ?auto_12041 ) ( AVAILABLE ?auto_12037 ) ( SURFACE-AT ?auto_12021 ?auto_12041 ) ( ON ?auto_12021 ?auto_12035 ) ( CLEAR ?auto_12021 ) ( not ( = ?auto_12020 ?auto_12021 ) ) ( not ( = ?auto_12020 ?auto_12035 ) ) ( not ( = ?auto_12021 ?auto_12035 ) ) ( not ( = ?auto_12026 ?auto_12037 ) ) ( SURFACE-AT ?auto_12019 ?auto_12030 ) ( CLEAR ?auto_12019 ) ( IS-CRATE ?auto_12020 ) ( AVAILABLE ?auto_12026 ) ( AVAILABLE ?auto_12034 ) ( SURFACE-AT ?auto_12020 ?auto_12032 ) ( ON ?auto_12020 ?auto_12033 ) ( CLEAR ?auto_12020 ) ( TRUCK-AT ?auto_12027 ?auto_12030 ) ( not ( = ?auto_12019 ?auto_12020 ) ) ( not ( = ?auto_12019 ?auto_12033 ) ) ( not ( = ?auto_12020 ?auto_12033 ) ) ( not ( = ?auto_12019 ?auto_12021 ) ) ( not ( = ?auto_12019 ?auto_12035 ) ) ( not ( = ?auto_12021 ?auto_12033 ) ) ( not ( = ?auto_12041 ?auto_12032 ) ) ( not ( = ?auto_12037 ?auto_12034 ) ) ( not ( = ?auto_12035 ?auto_12033 ) ) ( not ( = ?auto_12019 ?auto_12022 ) ) ( not ( = ?auto_12019 ?auto_12044 ) ) ( not ( = ?auto_12020 ?auto_12022 ) ) ( not ( = ?auto_12020 ?auto_12044 ) ) ( not ( = ?auto_12022 ?auto_12035 ) ) ( not ( = ?auto_12022 ?auto_12033 ) ) ( not ( = ?auto_12044 ?auto_12035 ) ) ( not ( = ?auto_12044 ?auto_12033 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( not ( = ?auto_12019 ?auto_12038 ) ) ( not ( = ?auto_12020 ?auto_12023 ) ) ( not ( = ?auto_12020 ?auto_12038 ) ) ( not ( = ?auto_12021 ?auto_12023 ) ) ( not ( = ?auto_12021 ?auto_12038 ) ) ( not ( = ?auto_12023 ?auto_12044 ) ) ( not ( = ?auto_12023 ?auto_12035 ) ) ( not ( = ?auto_12023 ?auto_12033 ) ) ( not ( = ?auto_12039 ?auto_12032 ) ) ( not ( = ?auto_12039 ?auto_12041 ) ) ( not ( = ?auto_12043 ?auto_12034 ) ) ( not ( = ?auto_12043 ?auto_12037 ) ) ( not ( = ?auto_12038 ?auto_12044 ) ) ( not ( = ?auto_12038 ?auto_12035 ) ) ( not ( = ?auto_12038 ?auto_12033 ) ) ( not ( = ?auto_12019 ?auto_12024 ) ) ( not ( = ?auto_12019 ?auto_12040 ) ) ( not ( = ?auto_12020 ?auto_12024 ) ) ( not ( = ?auto_12020 ?auto_12040 ) ) ( not ( = ?auto_12021 ?auto_12024 ) ) ( not ( = ?auto_12021 ?auto_12040 ) ) ( not ( = ?auto_12022 ?auto_12024 ) ) ( not ( = ?auto_12022 ?auto_12040 ) ) ( not ( = ?auto_12024 ?auto_12038 ) ) ( not ( = ?auto_12024 ?auto_12044 ) ) ( not ( = ?auto_12024 ?auto_12035 ) ) ( not ( = ?auto_12024 ?auto_12033 ) ) ( not ( = ?auto_12036 ?auto_12039 ) ) ( not ( = ?auto_12036 ?auto_12032 ) ) ( not ( = ?auto_12036 ?auto_12041 ) ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12042 ?auto_12034 ) ) ( not ( = ?auto_12042 ?auto_12037 ) ) ( not ( = ?auto_12040 ?auto_12038 ) ) ( not ( = ?auto_12040 ?auto_12044 ) ) ( not ( = ?auto_12040 ?auto_12035 ) ) ( not ( = ?auto_12040 ?auto_12033 ) ) ( not ( = ?auto_12019 ?auto_12025 ) ) ( not ( = ?auto_12019 ?auto_12031 ) ) ( not ( = ?auto_12020 ?auto_12025 ) ) ( not ( = ?auto_12020 ?auto_12031 ) ) ( not ( = ?auto_12021 ?auto_12025 ) ) ( not ( = ?auto_12021 ?auto_12031 ) ) ( not ( = ?auto_12022 ?auto_12025 ) ) ( not ( = ?auto_12022 ?auto_12031 ) ) ( not ( = ?auto_12023 ?auto_12025 ) ) ( not ( = ?auto_12023 ?auto_12031 ) ) ( not ( = ?auto_12025 ?auto_12040 ) ) ( not ( = ?auto_12025 ?auto_12038 ) ) ( not ( = ?auto_12025 ?auto_12044 ) ) ( not ( = ?auto_12025 ?auto_12035 ) ) ( not ( = ?auto_12025 ?auto_12033 ) ) ( not ( = ?auto_12028 ?auto_12036 ) ) ( not ( = ?auto_12028 ?auto_12039 ) ) ( not ( = ?auto_12028 ?auto_12032 ) ) ( not ( = ?auto_12028 ?auto_12041 ) ) ( not ( = ?auto_12029 ?auto_12042 ) ) ( not ( = ?auto_12029 ?auto_12043 ) ) ( not ( = ?auto_12029 ?auto_12034 ) ) ( not ( = ?auto_12029 ?auto_12037 ) ) ( not ( = ?auto_12031 ?auto_12040 ) ) ( not ( = ?auto_12031 ?auto_12038 ) ) ( not ( = ?auto_12031 ?auto_12044 ) ) ( not ( = ?auto_12031 ?auto_12035 ) ) ( not ( = ?auto_12031 ?auto_12033 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12019 ?auto_12020 ?auto_12021 ?auto_12022 ?auto_12023 ?auto_12024 )
      ( MAKE-1CRATE ?auto_12024 ?auto_12025 )
      ( MAKE-6CRATE-VERIFY ?auto_12019 ?auto_12020 ?auto_12021 ?auto_12022 ?auto_12023 ?auto_12024 ?auto_12025 ) )
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
      ?auto_12069 - SURFACE
      ?auto_12070 - SURFACE
    )
    :vars
    (
      ?auto_12074 - HOIST
      ?auto_12076 - PLACE
      ?auto_12075 - PLACE
      ?auto_12072 - HOIST
      ?auto_12073 - SURFACE
      ?auto_12085 - PLACE
      ?auto_12082 - HOIST
      ?auto_12077 - SURFACE
      ?auto_12081 - PLACE
      ?auto_12090 - HOIST
      ?auto_12091 - SURFACE
      ?auto_12078 - PLACE
      ?auto_12092 - HOIST
      ?auto_12079 - SURFACE
      ?auto_12086 - PLACE
      ?auto_12084 - HOIST
      ?auto_12089 - SURFACE
      ?auto_12088 - PLACE
      ?auto_12080 - HOIST
      ?auto_12083 - SURFACE
      ?auto_12087 - SURFACE
      ?auto_12071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12074 ?auto_12076 ) ( IS-CRATE ?auto_12070 ) ( not ( = ?auto_12075 ?auto_12076 ) ) ( HOIST-AT ?auto_12072 ?auto_12075 ) ( AVAILABLE ?auto_12072 ) ( SURFACE-AT ?auto_12070 ?auto_12075 ) ( ON ?auto_12070 ?auto_12073 ) ( CLEAR ?auto_12070 ) ( not ( = ?auto_12069 ?auto_12070 ) ) ( not ( = ?auto_12069 ?auto_12073 ) ) ( not ( = ?auto_12070 ?auto_12073 ) ) ( not ( = ?auto_12074 ?auto_12072 ) ) ( IS-CRATE ?auto_12069 ) ( not ( = ?auto_12085 ?auto_12076 ) ) ( HOIST-AT ?auto_12082 ?auto_12085 ) ( AVAILABLE ?auto_12082 ) ( SURFACE-AT ?auto_12069 ?auto_12085 ) ( ON ?auto_12069 ?auto_12077 ) ( CLEAR ?auto_12069 ) ( not ( = ?auto_12068 ?auto_12069 ) ) ( not ( = ?auto_12068 ?auto_12077 ) ) ( not ( = ?auto_12069 ?auto_12077 ) ) ( not ( = ?auto_12074 ?auto_12082 ) ) ( IS-CRATE ?auto_12068 ) ( not ( = ?auto_12081 ?auto_12076 ) ) ( HOIST-AT ?auto_12090 ?auto_12081 ) ( AVAILABLE ?auto_12090 ) ( SURFACE-AT ?auto_12068 ?auto_12081 ) ( ON ?auto_12068 ?auto_12091 ) ( CLEAR ?auto_12068 ) ( not ( = ?auto_12067 ?auto_12068 ) ) ( not ( = ?auto_12067 ?auto_12091 ) ) ( not ( = ?auto_12068 ?auto_12091 ) ) ( not ( = ?auto_12074 ?auto_12090 ) ) ( IS-CRATE ?auto_12067 ) ( not ( = ?auto_12078 ?auto_12076 ) ) ( HOIST-AT ?auto_12092 ?auto_12078 ) ( AVAILABLE ?auto_12092 ) ( SURFACE-AT ?auto_12067 ?auto_12078 ) ( ON ?auto_12067 ?auto_12079 ) ( CLEAR ?auto_12067 ) ( not ( = ?auto_12066 ?auto_12067 ) ) ( not ( = ?auto_12066 ?auto_12079 ) ) ( not ( = ?auto_12067 ?auto_12079 ) ) ( not ( = ?auto_12074 ?auto_12092 ) ) ( IS-CRATE ?auto_12066 ) ( not ( = ?auto_12086 ?auto_12076 ) ) ( HOIST-AT ?auto_12084 ?auto_12086 ) ( SURFACE-AT ?auto_12066 ?auto_12086 ) ( ON ?auto_12066 ?auto_12089 ) ( CLEAR ?auto_12066 ) ( not ( = ?auto_12065 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12089 ) ) ( not ( = ?auto_12066 ?auto_12089 ) ) ( not ( = ?auto_12074 ?auto_12084 ) ) ( IS-CRATE ?auto_12065 ) ( not ( = ?auto_12088 ?auto_12076 ) ) ( HOIST-AT ?auto_12080 ?auto_12088 ) ( AVAILABLE ?auto_12080 ) ( SURFACE-AT ?auto_12065 ?auto_12088 ) ( ON ?auto_12065 ?auto_12083 ) ( CLEAR ?auto_12065 ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( not ( = ?auto_12064 ?auto_12083 ) ) ( not ( = ?auto_12065 ?auto_12083 ) ) ( not ( = ?auto_12074 ?auto_12080 ) ) ( SURFACE-AT ?auto_12063 ?auto_12076 ) ( CLEAR ?auto_12063 ) ( IS-CRATE ?auto_12064 ) ( AVAILABLE ?auto_12074 ) ( AVAILABLE ?auto_12084 ) ( SURFACE-AT ?auto_12064 ?auto_12086 ) ( ON ?auto_12064 ?auto_12087 ) ( CLEAR ?auto_12064 ) ( TRUCK-AT ?auto_12071 ?auto_12076 ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12087 ) ) ( not ( = ?auto_12064 ?auto_12087 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12083 ) ) ( not ( = ?auto_12065 ?auto_12087 ) ) ( not ( = ?auto_12088 ?auto_12086 ) ) ( not ( = ?auto_12080 ?auto_12084 ) ) ( not ( = ?auto_12083 ?auto_12087 ) ) ( not ( = ?auto_12063 ?auto_12066 ) ) ( not ( = ?auto_12063 ?auto_12089 ) ) ( not ( = ?auto_12064 ?auto_12066 ) ) ( not ( = ?auto_12064 ?auto_12089 ) ) ( not ( = ?auto_12066 ?auto_12083 ) ) ( not ( = ?auto_12066 ?auto_12087 ) ) ( not ( = ?auto_12089 ?auto_12083 ) ) ( not ( = ?auto_12089 ?auto_12087 ) ) ( not ( = ?auto_12063 ?auto_12067 ) ) ( not ( = ?auto_12063 ?auto_12079 ) ) ( not ( = ?auto_12064 ?auto_12067 ) ) ( not ( = ?auto_12064 ?auto_12079 ) ) ( not ( = ?auto_12065 ?auto_12067 ) ) ( not ( = ?auto_12065 ?auto_12079 ) ) ( not ( = ?auto_12067 ?auto_12089 ) ) ( not ( = ?auto_12067 ?auto_12083 ) ) ( not ( = ?auto_12067 ?auto_12087 ) ) ( not ( = ?auto_12078 ?auto_12086 ) ) ( not ( = ?auto_12078 ?auto_12088 ) ) ( not ( = ?auto_12092 ?auto_12084 ) ) ( not ( = ?auto_12092 ?auto_12080 ) ) ( not ( = ?auto_12079 ?auto_12089 ) ) ( not ( = ?auto_12079 ?auto_12083 ) ) ( not ( = ?auto_12079 ?auto_12087 ) ) ( not ( = ?auto_12063 ?auto_12068 ) ) ( not ( = ?auto_12063 ?auto_12091 ) ) ( not ( = ?auto_12064 ?auto_12068 ) ) ( not ( = ?auto_12064 ?auto_12091 ) ) ( not ( = ?auto_12065 ?auto_12068 ) ) ( not ( = ?auto_12065 ?auto_12091 ) ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( not ( = ?auto_12066 ?auto_12091 ) ) ( not ( = ?auto_12068 ?auto_12079 ) ) ( not ( = ?auto_12068 ?auto_12089 ) ) ( not ( = ?auto_12068 ?auto_12083 ) ) ( not ( = ?auto_12068 ?auto_12087 ) ) ( not ( = ?auto_12081 ?auto_12078 ) ) ( not ( = ?auto_12081 ?auto_12086 ) ) ( not ( = ?auto_12081 ?auto_12088 ) ) ( not ( = ?auto_12090 ?auto_12092 ) ) ( not ( = ?auto_12090 ?auto_12084 ) ) ( not ( = ?auto_12090 ?auto_12080 ) ) ( not ( = ?auto_12091 ?auto_12079 ) ) ( not ( = ?auto_12091 ?auto_12089 ) ) ( not ( = ?auto_12091 ?auto_12083 ) ) ( not ( = ?auto_12091 ?auto_12087 ) ) ( not ( = ?auto_12063 ?auto_12069 ) ) ( not ( = ?auto_12063 ?auto_12077 ) ) ( not ( = ?auto_12064 ?auto_12069 ) ) ( not ( = ?auto_12064 ?auto_12077 ) ) ( not ( = ?auto_12065 ?auto_12069 ) ) ( not ( = ?auto_12065 ?auto_12077 ) ) ( not ( = ?auto_12066 ?auto_12069 ) ) ( not ( = ?auto_12066 ?auto_12077 ) ) ( not ( = ?auto_12067 ?auto_12069 ) ) ( not ( = ?auto_12067 ?auto_12077 ) ) ( not ( = ?auto_12069 ?auto_12091 ) ) ( not ( = ?auto_12069 ?auto_12079 ) ) ( not ( = ?auto_12069 ?auto_12089 ) ) ( not ( = ?auto_12069 ?auto_12083 ) ) ( not ( = ?auto_12069 ?auto_12087 ) ) ( not ( = ?auto_12085 ?auto_12081 ) ) ( not ( = ?auto_12085 ?auto_12078 ) ) ( not ( = ?auto_12085 ?auto_12086 ) ) ( not ( = ?auto_12085 ?auto_12088 ) ) ( not ( = ?auto_12082 ?auto_12090 ) ) ( not ( = ?auto_12082 ?auto_12092 ) ) ( not ( = ?auto_12082 ?auto_12084 ) ) ( not ( = ?auto_12082 ?auto_12080 ) ) ( not ( = ?auto_12077 ?auto_12091 ) ) ( not ( = ?auto_12077 ?auto_12079 ) ) ( not ( = ?auto_12077 ?auto_12089 ) ) ( not ( = ?auto_12077 ?auto_12083 ) ) ( not ( = ?auto_12077 ?auto_12087 ) ) ( not ( = ?auto_12063 ?auto_12070 ) ) ( not ( = ?auto_12063 ?auto_12073 ) ) ( not ( = ?auto_12064 ?auto_12070 ) ) ( not ( = ?auto_12064 ?auto_12073 ) ) ( not ( = ?auto_12065 ?auto_12070 ) ) ( not ( = ?auto_12065 ?auto_12073 ) ) ( not ( = ?auto_12066 ?auto_12070 ) ) ( not ( = ?auto_12066 ?auto_12073 ) ) ( not ( = ?auto_12067 ?auto_12070 ) ) ( not ( = ?auto_12067 ?auto_12073 ) ) ( not ( = ?auto_12068 ?auto_12070 ) ) ( not ( = ?auto_12068 ?auto_12073 ) ) ( not ( = ?auto_12070 ?auto_12077 ) ) ( not ( = ?auto_12070 ?auto_12091 ) ) ( not ( = ?auto_12070 ?auto_12079 ) ) ( not ( = ?auto_12070 ?auto_12089 ) ) ( not ( = ?auto_12070 ?auto_12083 ) ) ( not ( = ?auto_12070 ?auto_12087 ) ) ( not ( = ?auto_12075 ?auto_12085 ) ) ( not ( = ?auto_12075 ?auto_12081 ) ) ( not ( = ?auto_12075 ?auto_12078 ) ) ( not ( = ?auto_12075 ?auto_12086 ) ) ( not ( = ?auto_12075 ?auto_12088 ) ) ( not ( = ?auto_12072 ?auto_12082 ) ) ( not ( = ?auto_12072 ?auto_12090 ) ) ( not ( = ?auto_12072 ?auto_12092 ) ) ( not ( = ?auto_12072 ?auto_12084 ) ) ( not ( = ?auto_12072 ?auto_12080 ) ) ( not ( = ?auto_12073 ?auto_12077 ) ) ( not ( = ?auto_12073 ?auto_12091 ) ) ( not ( = ?auto_12073 ?auto_12079 ) ) ( not ( = ?auto_12073 ?auto_12089 ) ) ( not ( = ?auto_12073 ?auto_12083 ) ) ( not ( = ?auto_12073 ?auto_12087 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12063 ?auto_12064 ?auto_12065 ?auto_12066 ?auto_12067 ?auto_12068 ?auto_12069 )
      ( MAKE-1CRATE ?auto_12069 ?auto_12070 )
      ( MAKE-7CRATE-VERIFY ?auto_12063 ?auto_12064 ?auto_12065 ?auto_12066 ?auto_12067 ?auto_12068 ?auto_12069 ?auto_12070 ) )
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
      ?auto_12118 - SURFACE
      ?auto_12119 - SURFACE
      ?auto_12120 - SURFACE
    )
    :vars
    (
      ?auto_12126 - HOIST
      ?auto_12125 - PLACE
      ?auto_12124 - PLACE
      ?auto_12123 - HOIST
      ?auto_12122 - SURFACE
      ?auto_12135 - PLACE
      ?auto_12131 - HOIST
      ?auto_12132 - SURFACE
      ?auto_12137 - PLACE
      ?auto_12145 - HOIST
      ?auto_12133 - SURFACE
      ?auto_12136 - PLACE
      ?auto_12142 - HOIST
      ?auto_12127 - SURFACE
      ?auto_12129 - PLACE
      ?auto_12134 - HOIST
      ?auto_12128 - SURFACE
      ?auto_12139 - PLACE
      ?auto_12143 - HOIST
      ?auto_12141 - SURFACE
      ?auto_12140 - PLACE
      ?auto_12130 - HOIST
      ?auto_12144 - SURFACE
      ?auto_12138 - SURFACE
      ?auto_12121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12126 ?auto_12125 ) ( IS-CRATE ?auto_12120 ) ( not ( = ?auto_12124 ?auto_12125 ) ) ( HOIST-AT ?auto_12123 ?auto_12124 ) ( AVAILABLE ?auto_12123 ) ( SURFACE-AT ?auto_12120 ?auto_12124 ) ( ON ?auto_12120 ?auto_12122 ) ( CLEAR ?auto_12120 ) ( not ( = ?auto_12119 ?auto_12120 ) ) ( not ( = ?auto_12119 ?auto_12122 ) ) ( not ( = ?auto_12120 ?auto_12122 ) ) ( not ( = ?auto_12126 ?auto_12123 ) ) ( IS-CRATE ?auto_12119 ) ( not ( = ?auto_12135 ?auto_12125 ) ) ( HOIST-AT ?auto_12131 ?auto_12135 ) ( AVAILABLE ?auto_12131 ) ( SURFACE-AT ?auto_12119 ?auto_12135 ) ( ON ?auto_12119 ?auto_12132 ) ( CLEAR ?auto_12119 ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12118 ?auto_12132 ) ) ( not ( = ?auto_12119 ?auto_12132 ) ) ( not ( = ?auto_12126 ?auto_12131 ) ) ( IS-CRATE ?auto_12118 ) ( not ( = ?auto_12137 ?auto_12125 ) ) ( HOIST-AT ?auto_12145 ?auto_12137 ) ( AVAILABLE ?auto_12145 ) ( SURFACE-AT ?auto_12118 ?auto_12137 ) ( ON ?auto_12118 ?auto_12133 ) ( CLEAR ?auto_12118 ) ( not ( = ?auto_12117 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12133 ) ) ( not ( = ?auto_12118 ?auto_12133 ) ) ( not ( = ?auto_12126 ?auto_12145 ) ) ( IS-CRATE ?auto_12117 ) ( not ( = ?auto_12136 ?auto_12125 ) ) ( HOIST-AT ?auto_12142 ?auto_12136 ) ( AVAILABLE ?auto_12142 ) ( SURFACE-AT ?auto_12117 ?auto_12136 ) ( ON ?auto_12117 ?auto_12127 ) ( CLEAR ?auto_12117 ) ( not ( = ?auto_12116 ?auto_12117 ) ) ( not ( = ?auto_12116 ?auto_12127 ) ) ( not ( = ?auto_12117 ?auto_12127 ) ) ( not ( = ?auto_12126 ?auto_12142 ) ) ( IS-CRATE ?auto_12116 ) ( not ( = ?auto_12129 ?auto_12125 ) ) ( HOIST-AT ?auto_12134 ?auto_12129 ) ( AVAILABLE ?auto_12134 ) ( SURFACE-AT ?auto_12116 ?auto_12129 ) ( ON ?auto_12116 ?auto_12128 ) ( CLEAR ?auto_12116 ) ( not ( = ?auto_12115 ?auto_12116 ) ) ( not ( = ?auto_12115 ?auto_12128 ) ) ( not ( = ?auto_12116 ?auto_12128 ) ) ( not ( = ?auto_12126 ?auto_12134 ) ) ( IS-CRATE ?auto_12115 ) ( not ( = ?auto_12139 ?auto_12125 ) ) ( HOIST-AT ?auto_12143 ?auto_12139 ) ( SURFACE-AT ?auto_12115 ?auto_12139 ) ( ON ?auto_12115 ?auto_12141 ) ( CLEAR ?auto_12115 ) ( not ( = ?auto_12114 ?auto_12115 ) ) ( not ( = ?auto_12114 ?auto_12141 ) ) ( not ( = ?auto_12115 ?auto_12141 ) ) ( not ( = ?auto_12126 ?auto_12143 ) ) ( IS-CRATE ?auto_12114 ) ( not ( = ?auto_12140 ?auto_12125 ) ) ( HOIST-AT ?auto_12130 ?auto_12140 ) ( AVAILABLE ?auto_12130 ) ( SURFACE-AT ?auto_12114 ?auto_12140 ) ( ON ?auto_12114 ?auto_12144 ) ( CLEAR ?auto_12114 ) ( not ( = ?auto_12113 ?auto_12114 ) ) ( not ( = ?auto_12113 ?auto_12144 ) ) ( not ( = ?auto_12114 ?auto_12144 ) ) ( not ( = ?auto_12126 ?auto_12130 ) ) ( SURFACE-AT ?auto_12112 ?auto_12125 ) ( CLEAR ?auto_12112 ) ( IS-CRATE ?auto_12113 ) ( AVAILABLE ?auto_12126 ) ( AVAILABLE ?auto_12143 ) ( SURFACE-AT ?auto_12113 ?auto_12139 ) ( ON ?auto_12113 ?auto_12138 ) ( CLEAR ?auto_12113 ) ( TRUCK-AT ?auto_12121 ?auto_12125 ) ( not ( = ?auto_12112 ?auto_12113 ) ) ( not ( = ?auto_12112 ?auto_12138 ) ) ( not ( = ?auto_12113 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12114 ) ) ( not ( = ?auto_12112 ?auto_12144 ) ) ( not ( = ?auto_12114 ?auto_12138 ) ) ( not ( = ?auto_12140 ?auto_12139 ) ) ( not ( = ?auto_12130 ?auto_12143 ) ) ( not ( = ?auto_12144 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12115 ) ) ( not ( = ?auto_12112 ?auto_12141 ) ) ( not ( = ?auto_12113 ?auto_12115 ) ) ( not ( = ?auto_12113 ?auto_12141 ) ) ( not ( = ?auto_12115 ?auto_12144 ) ) ( not ( = ?auto_12115 ?auto_12138 ) ) ( not ( = ?auto_12141 ?auto_12144 ) ) ( not ( = ?auto_12141 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12116 ) ) ( not ( = ?auto_12112 ?auto_12128 ) ) ( not ( = ?auto_12113 ?auto_12116 ) ) ( not ( = ?auto_12113 ?auto_12128 ) ) ( not ( = ?auto_12114 ?auto_12116 ) ) ( not ( = ?auto_12114 ?auto_12128 ) ) ( not ( = ?auto_12116 ?auto_12141 ) ) ( not ( = ?auto_12116 ?auto_12144 ) ) ( not ( = ?auto_12116 ?auto_12138 ) ) ( not ( = ?auto_12129 ?auto_12139 ) ) ( not ( = ?auto_12129 ?auto_12140 ) ) ( not ( = ?auto_12134 ?auto_12143 ) ) ( not ( = ?auto_12134 ?auto_12130 ) ) ( not ( = ?auto_12128 ?auto_12141 ) ) ( not ( = ?auto_12128 ?auto_12144 ) ) ( not ( = ?auto_12128 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12117 ) ) ( not ( = ?auto_12112 ?auto_12127 ) ) ( not ( = ?auto_12113 ?auto_12117 ) ) ( not ( = ?auto_12113 ?auto_12127 ) ) ( not ( = ?auto_12114 ?auto_12117 ) ) ( not ( = ?auto_12114 ?auto_12127 ) ) ( not ( = ?auto_12115 ?auto_12117 ) ) ( not ( = ?auto_12115 ?auto_12127 ) ) ( not ( = ?auto_12117 ?auto_12128 ) ) ( not ( = ?auto_12117 ?auto_12141 ) ) ( not ( = ?auto_12117 ?auto_12144 ) ) ( not ( = ?auto_12117 ?auto_12138 ) ) ( not ( = ?auto_12136 ?auto_12129 ) ) ( not ( = ?auto_12136 ?auto_12139 ) ) ( not ( = ?auto_12136 ?auto_12140 ) ) ( not ( = ?auto_12142 ?auto_12134 ) ) ( not ( = ?auto_12142 ?auto_12143 ) ) ( not ( = ?auto_12142 ?auto_12130 ) ) ( not ( = ?auto_12127 ?auto_12128 ) ) ( not ( = ?auto_12127 ?auto_12141 ) ) ( not ( = ?auto_12127 ?auto_12144 ) ) ( not ( = ?auto_12127 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12118 ) ) ( not ( = ?auto_12112 ?auto_12133 ) ) ( not ( = ?auto_12113 ?auto_12118 ) ) ( not ( = ?auto_12113 ?auto_12133 ) ) ( not ( = ?auto_12114 ?auto_12118 ) ) ( not ( = ?auto_12114 ?auto_12133 ) ) ( not ( = ?auto_12115 ?auto_12118 ) ) ( not ( = ?auto_12115 ?auto_12133 ) ) ( not ( = ?auto_12116 ?auto_12118 ) ) ( not ( = ?auto_12116 ?auto_12133 ) ) ( not ( = ?auto_12118 ?auto_12127 ) ) ( not ( = ?auto_12118 ?auto_12128 ) ) ( not ( = ?auto_12118 ?auto_12141 ) ) ( not ( = ?auto_12118 ?auto_12144 ) ) ( not ( = ?auto_12118 ?auto_12138 ) ) ( not ( = ?auto_12137 ?auto_12136 ) ) ( not ( = ?auto_12137 ?auto_12129 ) ) ( not ( = ?auto_12137 ?auto_12139 ) ) ( not ( = ?auto_12137 ?auto_12140 ) ) ( not ( = ?auto_12145 ?auto_12142 ) ) ( not ( = ?auto_12145 ?auto_12134 ) ) ( not ( = ?auto_12145 ?auto_12143 ) ) ( not ( = ?auto_12145 ?auto_12130 ) ) ( not ( = ?auto_12133 ?auto_12127 ) ) ( not ( = ?auto_12133 ?auto_12128 ) ) ( not ( = ?auto_12133 ?auto_12141 ) ) ( not ( = ?auto_12133 ?auto_12144 ) ) ( not ( = ?auto_12133 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12119 ) ) ( not ( = ?auto_12112 ?auto_12132 ) ) ( not ( = ?auto_12113 ?auto_12119 ) ) ( not ( = ?auto_12113 ?auto_12132 ) ) ( not ( = ?auto_12114 ?auto_12119 ) ) ( not ( = ?auto_12114 ?auto_12132 ) ) ( not ( = ?auto_12115 ?auto_12119 ) ) ( not ( = ?auto_12115 ?auto_12132 ) ) ( not ( = ?auto_12116 ?auto_12119 ) ) ( not ( = ?auto_12116 ?auto_12132 ) ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12117 ?auto_12132 ) ) ( not ( = ?auto_12119 ?auto_12133 ) ) ( not ( = ?auto_12119 ?auto_12127 ) ) ( not ( = ?auto_12119 ?auto_12128 ) ) ( not ( = ?auto_12119 ?auto_12141 ) ) ( not ( = ?auto_12119 ?auto_12144 ) ) ( not ( = ?auto_12119 ?auto_12138 ) ) ( not ( = ?auto_12135 ?auto_12137 ) ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12135 ?auto_12129 ) ) ( not ( = ?auto_12135 ?auto_12139 ) ) ( not ( = ?auto_12135 ?auto_12140 ) ) ( not ( = ?auto_12131 ?auto_12145 ) ) ( not ( = ?auto_12131 ?auto_12142 ) ) ( not ( = ?auto_12131 ?auto_12134 ) ) ( not ( = ?auto_12131 ?auto_12143 ) ) ( not ( = ?auto_12131 ?auto_12130 ) ) ( not ( = ?auto_12132 ?auto_12133 ) ) ( not ( = ?auto_12132 ?auto_12127 ) ) ( not ( = ?auto_12132 ?auto_12128 ) ) ( not ( = ?auto_12132 ?auto_12141 ) ) ( not ( = ?auto_12132 ?auto_12144 ) ) ( not ( = ?auto_12132 ?auto_12138 ) ) ( not ( = ?auto_12112 ?auto_12120 ) ) ( not ( = ?auto_12112 ?auto_12122 ) ) ( not ( = ?auto_12113 ?auto_12120 ) ) ( not ( = ?auto_12113 ?auto_12122 ) ) ( not ( = ?auto_12114 ?auto_12120 ) ) ( not ( = ?auto_12114 ?auto_12122 ) ) ( not ( = ?auto_12115 ?auto_12120 ) ) ( not ( = ?auto_12115 ?auto_12122 ) ) ( not ( = ?auto_12116 ?auto_12120 ) ) ( not ( = ?auto_12116 ?auto_12122 ) ) ( not ( = ?auto_12117 ?auto_12120 ) ) ( not ( = ?auto_12117 ?auto_12122 ) ) ( not ( = ?auto_12118 ?auto_12120 ) ) ( not ( = ?auto_12118 ?auto_12122 ) ) ( not ( = ?auto_12120 ?auto_12132 ) ) ( not ( = ?auto_12120 ?auto_12133 ) ) ( not ( = ?auto_12120 ?auto_12127 ) ) ( not ( = ?auto_12120 ?auto_12128 ) ) ( not ( = ?auto_12120 ?auto_12141 ) ) ( not ( = ?auto_12120 ?auto_12144 ) ) ( not ( = ?auto_12120 ?auto_12138 ) ) ( not ( = ?auto_12124 ?auto_12135 ) ) ( not ( = ?auto_12124 ?auto_12137 ) ) ( not ( = ?auto_12124 ?auto_12136 ) ) ( not ( = ?auto_12124 ?auto_12129 ) ) ( not ( = ?auto_12124 ?auto_12139 ) ) ( not ( = ?auto_12124 ?auto_12140 ) ) ( not ( = ?auto_12123 ?auto_12131 ) ) ( not ( = ?auto_12123 ?auto_12145 ) ) ( not ( = ?auto_12123 ?auto_12142 ) ) ( not ( = ?auto_12123 ?auto_12134 ) ) ( not ( = ?auto_12123 ?auto_12143 ) ) ( not ( = ?auto_12123 ?auto_12130 ) ) ( not ( = ?auto_12122 ?auto_12132 ) ) ( not ( = ?auto_12122 ?auto_12133 ) ) ( not ( = ?auto_12122 ?auto_12127 ) ) ( not ( = ?auto_12122 ?auto_12128 ) ) ( not ( = ?auto_12122 ?auto_12141 ) ) ( not ( = ?auto_12122 ?auto_12144 ) ) ( not ( = ?auto_12122 ?auto_12138 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12112 ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12118 ?auto_12119 )
      ( MAKE-1CRATE ?auto_12119 ?auto_12120 )
      ( MAKE-8CRATE-VERIFY ?auto_12112 ?auto_12113 ?auto_12114 ?auto_12115 ?auto_12116 ?auto_12117 ?auto_12118 ?auto_12119 ?auto_12120 ) )
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
      ?auto_12172 - SURFACE
      ?auto_12173 - SURFACE
      ?auto_12174 - SURFACE
      ?auto_12175 - SURFACE
    )
    :vars
    (
      ?auto_12178 - HOIST
      ?auto_12176 - PLACE
      ?auto_12180 - PLACE
      ?auto_12181 - HOIST
      ?auto_12179 - SURFACE
      ?auto_12182 - PLACE
      ?auto_12197 - HOIST
      ?auto_12202 - SURFACE
      ?auto_12201 - PLACE
      ?auto_12187 - HOIST
      ?auto_12186 - SURFACE
      ?auto_12193 - PLACE
      ?auto_12199 - HOIST
      ?auto_12185 - SURFACE
      ?auto_12194 - PLACE
      ?auto_12200 - HOIST
      ?auto_12198 - SURFACE
      ?auto_12192 - PLACE
      ?auto_12184 - HOIST
      ?auto_12203 - SURFACE
      ?auto_12190 - PLACE
      ?auto_12196 - HOIST
      ?auto_12188 - SURFACE
      ?auto_12183 - PLACE
      ?auto_12195 - HOIST
      ?auto_12191 - SURFACE
      ?auto_12189 - SURFACE
      ?auto_12177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12178 ?auto_12176 ) ( IS-CRATE ?auto_12175 ) ( not ( = ?auto_12180 ?auto_12176 ) ) ( HOIST-AT ?auto_12181 ?auto_12180 ) ( AVAILABLE ?auto_12181 ) ( SURFACE-AT ?auto_12175 ?auto_12180 ) ( ON ?auto_12175 ?auto_12179 ) ( CLEAR ?auto_12175 ) ( not ( = ?auto_12174 ?auto_12175 ) ) ( not ( = ?auto_12174 ?auto_12179 ) ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( not ( = ?auto_12178 ?auto_12181 ) ) ( IS-CRATE ?auto_12174 ) ( not ( = ?auto_12182 ?auto_12176 ) ) ( HOIST-AT ?auto_12197 ?auto_12182 ) ( AVAILABLE ?auto_12197 ) ( SURFACE-AT ?auto_12174 ?auto_12182 ) ( ON ?auto_12174 ?auto_12202 ) ( CLEAR ?auto_12174 ) ( not ( = ?auto_12173 ?auto_12174 ) ) ( not ( = ?auto_12173 ?auto_12202 ) ) ( not ( = ?auto_12174 ?auto_12202 ) ) ( not ( = ?auto_12178 ?auto_12197 ) ) ( IS-CRATE ?auto_12173 ) ( not ( = ?auto_12201 ?auto_12176 ) ) ( HOIST-AT ?auto_12187 ?auto_12201 ) ( AVAILABLE ?auto_12187 ) ( SURFACE-AT ?auto_12173 ?auto_12201 ) ( ON ?auto_12173 ?auto_12186 ) ( CLEAR ?auto_12173 ) ( not ( = ?auto_12172 ?auto_12173 ) ) ( not ( = ?auto_12172 ?auto_12186 ) ) ( not ( = ?auto_12173 ?auto_12186 ) ) ( not ( = ?auto_12178 ?auto_12187 ) ) ( IS-CRATE ?auto_12172 ) ( not ( = ?auto_12193 ?auto_12176 ) ) ( HOIST-AT ?auto_12199 ?auto_12193 ) ( AVAILABLE ?auto_12199 ) ( SURFACE-AT ?auto_12172 ?auto_12193 ) ( ON ?auto_12172 ?auto_12185 ) ( CLEAR ?auto_12172 ) ( not ( = ?auto_12171 ?auto_12172 ) ) ( not ( = ?auto_12171 ?auto_12185 ) ) ( not ( = ?auto_12172 ?auto_12185 ) ) ( not ( = ?auto_12178 ?auto_12199 ) ) ( IS-CRATE ?auto_12171 ) ( not ( = ?auto_12194 ?auto_12176 ) ) ( HOIST-AT ?auto_12200 ?auto_12194 ) ( AVAILABLE ?auto_12200 ) ( SURFACE-AT ?auto_12171 ?auto_12194 ) ( ON ?auto_12171 ?auto_12198 ) ( CLEAR ?auto_12171 ) ( not ( = ?auto_12170 ?auto_12171 ) ) ( not ( = ?auto_12170 ?auto_12198 ) ) ( not ( = ?auto_12171 ?auto_12198 ) ) ( not ( = ?auto_12178 ?auto_12200 ) ) ( IS-CRATE ?auto_12170 ) ( not ( = ?auto_12192 ?auto_12176 ) ) ( HOIST-AT ?auto_12184 ?auto_12192 ) ( AVAILABLE ?auto_12184 ) ( SURFACE-AT ?auto_12170 ?auto_12192 ) ( ON ?auto_12170 ?auto_12203 ) ( CLEAR ?auto_12170 ) ( not ( = ?auto_12169 ?auto_12170 ) ) ( not ( = ?auto_12169 ?auto_12203 ) ) ( not ( = ?auto_12170 ?auto_12203 ) ) ( not ( = ?auto_12178 ?auto_12184 ) ) ( IS-CRATE ?auto_12169 ) ( not ( = ?auto_12190 ?auto_12176 ) ) ( HOIST-AT ?auto_12196 ?auto_12190 ) ( SURFACE-AT ?auto_12169 ?auto_12190 ) ( ON ?auto_12169 ?auto_12188 ) ( CLEAR ?auto_12169 ) ( not ( = ?auto_12168 ?auto_12169 ) ) ( not ( = ?auto_12168 ?auto_12188 ) ) ( not ( = ?auto_12169 ?auto_12188 ) ) ( not ( = ?auto_12178 ?auto_12196 ) ) ( IS-CRATE ?auto_12168 ) ( not ( = ?auto_12183 ?auto_12176 ) ) ( HOIST-AT ?auto_12195 ?auto_12183 ) ( AVAILABLE ?auto_12195 ) ( SURFACE-AT ?auto_12168 ?auto_12183 ) ( ON ?auto_12168 ?auto_12191 ) ( CLEAR ?auto_12168 ) ( not ( = ?auto_12167 ?auto_12168 ) ) ( not ( = ?auto_12167 ?auto_12191 ) ) ( not ( = ?auto_12168 ?auto_12191 ) ) ( not ( = ?auto_12178 ?auto_12195 ) ) ( SURFACE-AT ?auto_12166 ?auto_12176 ) ( CLEAR ?auto_12166 ) ( IS-CRATE ?auto_12167 ) ( AVAILABLE ?auto_12178 ) ( AVAILABLE ?auto_12196 ) ( SURFACE-AT ?auto_12167 ?auto_12190 ) ( ON ?auto_12167 ?auto_12189 ) ( CLEAR ?auto_12167 ) ( TRUCK-AT ?auto_12177 ?auto_12176 ) ( not ( = ?auto_12166 ?auto_12167 ) ) ( not ( = ?auto_12166 ?auto_12189 ) ) ( not ( = ?auto_12167 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12168 ) ) ( not ( = ?auto_12166 ?auto_12191 ) ) ( not ( = ?auto_12168 ?auto_12189 ) ) ( not ( = ?auto_12183 ?auto_12190 ) ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( not ( = ?auto_12191 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12169 ) ) ( not ( = ?auto_12166 ?auto_12188 ) ) ( not ( = ?auto_12167 ?auto_12169 ) ) ( not ( = ?auto_12167 ?auto_12188 ) ) ( not ( = ?auto_12169 ?auto_12191 ) ) ( not ( = ?auto_12169 ?auto_12189 ) ) ( not ( = ?auto_12188 ?auto_12191 ) ) ( not ( = ?auto_12188 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12170 ) ) ( not ( = ?auto_12166 ?auto_12203 ) ) ( not ( = ?auto_12167 ?auto_12170 ) ) ( not ( = ?auto_12167 ?auto_12203 ) ) ( not ( = ?auto_12168 ?auto_12170 ) ) ( not ( = ?auto_12168 ?auto_12203 ) ) ( not ( = ?auto_12170 ?auto_12188 ) ) ( not ( = ?auto_12170 ?auto_12191 ) ) ( not ( = ?auto_12170 ?auto_12189 ) ) ( not ( = ?auto_12192 ?auto_12190 ) ) ( not ( = ?auto_12192 ?auto_12183 ) ) ( not ( = ?auto_12184 ?auto_12196 ) ) ( not ( = ?auto_12184 ?auto_12195 ) ) ( not ( = ?auto_12203 ?auto_12188 ) ) ( not ( = ?auto_12203 ?auto_12191 ) ) ( not ( = ?auto_12203 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12171 ) ) ( not ( = ?auto_12166 ?auto_12198 ) ) ( not ( = ?auto_12167 ?auto_12171 ) ) ( not ( = ?auto_12167 ?auto_12198 ) ) ( not ( = ?auto_12168 ?auto_12171 ) ) ( not ( = ?auto_12168 ?auto_12198 ) ) ( not ( = ?auto_12169 ?auto_12171 ) ) ( not ( = ?auto_12169 ?auto_12198 ) ) ( not ( = ?auto_12171 ?auto_12203 ) ) ( not ( = ?auto_12171 ?auto_12188 ) ) ( not ( = ?auto_12171 ?auto_12191 ) ) ( not ( = ?auto_12171 ?auto_12189 ) ) ( not ( = ?auto_12194 ?auto_12192 ) ) ( not ( = ?auto_12194 ?auto_12190 ) ) ( not ( = ?auto_12194 ?auto_12183 ) ) ( not ( = ?auto_12200 ?auto_12184 ) ) ( not ( = ?auto_12200 ?auto_12196 ) ) ( not ( = ?auto_12200 ?auto_12195 ) ) ( not ( = ?auto_12198 ?auto_12203 ) ) ( not ( = ?auto_12198 ?auto_12188 ) ) ( not ( = ?auto_12198 ?auto_12191 ) ) ( not ( = ?auto_12198 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12172 ) ) ( not ( = ?auto_12166 ?auto_12185 ) ) ( not ( = ?auto_12167 ?auto_12172 ) ) ( not ( = ?auto_12167 ?auto_12185 ) ) ( not ( = ?auto_12168 ?auto_12172 ) ) ( not ( = ?auto_12168 ?auto_12185 ) ) ( not ( = ?auto_12169 ?auto_12172 ) ) ( not ( = ?auto_12169 ?auto_12185 ) ) ( not ( = ?auto_12170 ?auto_12172 ) ) ( not ( = ?auto_12170 ?auto_12185 ) ) ( not ( = ?auto_12172 ?auto_12198 ) ) ( not ( = ?auto_12172 ?auto_12203 ) ) ( not ( = ?auto_12172 ?auto_12188 ) ) ( not ( = ?auto_12172 ?auto_12191 ) ) ( not ( = ?auto_12172 ?auto_12189 ) ) ( not ( = ?auto_12193 ?auto_12194 ) ) ( not ( = ?auto_12193 ?auto_12192 ) ) ( not ( = ?auto_12193 ?auto_12190 ) ) ( not ( = ?auto_12193 ?auto_12183 ) ) ( not ( = ?auto_12199 ?auto_12200 ) ) ( not ( = ?auto_12199 ?auto_12184 ) ) ( not ( = ?auto_12199 ?auto_12196 ) ) ( not ( = ?auto_12199 ?auto_12195 ) ) ( not ( = ?auto_12185 ?auto_12198 ) ) ( not ( = ?auto_12185 ?auto_12203 ) ) ( not ( = ?auto_12185 ?auto_12188 ) ) ( not ( = ?auto_12185 ?auto_12191 ) ) ( not ( = ?auto_12185 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12173 ) ) ( not ( = ?auto_12166 ?auto_12186 ) ) ( not ( = ?auto_12167 ?auto_12173 ) ) ( not ( = ?auto_12167 ?auto_12186 ) ) ( not ( = ?auto_12168 ?auto_12173 ) ) ( not ( = ?auto_12168 ?auto_12186 ) ) ( not ( = ?auto_12169 ?auto_12173 ) ) ( not ( = ?auto_12169 ?auto_12186 ) ) ( not ( = ?auto_12170 ?auto_12173 ) ) ( not ( = ?auto_12170 ?auto_12186 ) ) ( not ( = ?auto_12171 ?auto_12173 ) ) ( not ( = ?auto_12171 ?auto_12186 ) ) ( not ( = ?auto_12173 ?auto_12185 ) ) ( not ( = ?auto_12173 ?auto_12198 ) ) ( not ( = ?auto_12173 ?auto_12203 ) ) ( not ( = ?auto_12173 ?auto_12188 ) ) ( not ( = ?auto_12173 ?auto_12191 ) ) ( not ( = ?auto_12173 ?auto_12189 ) ) ( not ( = ?auto_12201 ?auto_12193 ) ) ( not ( = ?auto_12201 ?auto_12194 ) ) ( not ( = ?auto_12201 ?auto_12192 ) ) ( not ( = ?auto_12201 ?auto_12190 ) ) ( not ( = ?auto_12201 ?auto_12183 ) ) ( not ( = ?auto_12187 ?auto_12199 ) ) ( not ( = ?auto_12187 ?auto_12200 ) ) ( not ( = ?auto_12187 ?auto_12184 ) ) ( not ( = ?auto_12187 ?auto_12196 ) ) ( not ( = ?auto_12187 ?auto_12195 ) ) ( not ( = ?auto_12186 ?auto_12185 ) ) ( not ( = ?auto_12186 ?auto_12198 ) ) ( not ( = ?auto_12186 ?auto_12203 ) ) ( not ( = ?auto_12186 ?auto_12188 ) ) ( not ( = ?auto_12186 ?auto_12191 ) ) ( not ( = ?auto_12186 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12174 ) ) ( not ( = ?auto_12166 ?auto_12202 ) ) ( not ( = ?auto_12167 ?auto_12174 ) ) ( not ( = ?auto_12167 ?auto_12202 ) ) ( not ( = ?auto_12168 ?auto_12174 ) ) ( not ( = ?auto_12168 ?auto_12202 ) ) ( not ( = ?auto_12169 ?auto_12174 ) ) ( not ( = ?auto_12169 ?auto_12202 ) ) ( not ( = ?auto_12170 ?auto_12174 ) ) ( not ( = ?auto_12170 ?auto_12202 ) ) ( not ( = ?auto_12171 ?auto_12174 ) ) ( not ( = ?auto_12171 ?auto_12202 ) ) ( not ( = ?auto_12172 ?auto_12174 ) ) ( not ( = ?auto_12172 ?auto_12202 ) ) ( not ( = ?auto_12174 ?auto_12186 ) ) ( not ( = ?auto_12174 ?auto_12185 ) ) ( not ( = ?auto_12174 ?auto_12198 ) ) ( not ( = ?auto_12174 ?auto_12203 ) ) ( not ( = ?auto_12174 ?auto_12188 ) ) ( not ( = ?auto_12174 ?auto_12191 ) ) ( not ( = ?auto_12174 ?auto_12189 ) ) ( not ( = ?auto_12182 ?auto_12201 ) ) ( not ( = ?auto_12182 ?auto_12193 ) ) ( not ( = ?auto_12182 ?auto_12194 ) ) ( not ( = ?auto_12182 ?auto_12192 ) ) ( not ( = ?auto_12182 ?auto_12190 ) ) ( not ( = ?auto_12182 ?auto_12183 ) ) ( not ( = ?auto_12197 ?auto_12187 ) ) ( not ( = ?auto_12197 ?auto_12199 ) ) ( not ( = ?auto_12197 ?auto_12200 ) ) ( not ( = ?auto_12197 ?auto_12184 ) ) ( not ( = ?auto_12197 ?auto_12196 ) ) ( not ( = ?auto_12197 ?auto_12195 ) ) ( not ( = ?auto_12202 ?auto_12186 ) ) ( not ( = ?auto_12202 ?auto_12185 ) ) ( not ( = ?auto_12202 ?auto_12198 ) ) ( not ( = ?auto_12202 ?auto_12203 ) ) ( not ( = ?auto_12202 ?auto_12188 ) ) ( not ( = ?auto_12202 ?auto_12191 ) ) ( not ( = ?auto_12202 ?auto_12189 ) ) ( not ( = ?auto_12166 ?auto_12175 ) ) ( not ( = ?auto_12166 ?auto_12179 ) ) ( not ( = ?auto_12167 ?auto_12175 ) ) ( not ( = ?auto_12167 ?auto_12179 ) ) ( not ( = ?auto_12168 ?auto_12175 ) ) ( not ( = ?auto_12168 ?auto_12179 ) ) ( not ( = ?auto_12169 ?auto_12175 ) ) ( not ( = ?auto_12169 ?auto_12179 ) ) ( not ( = ?auto_12170 ?auto_12175 ) ) ( not ( = ?auto_12170 ?auto_12179 ) ) ( not ( = ?auto_12171 ?auto_12175 ) ) ( not ( = ?auto_12171 ?auto_12179 ) ) ( not ( = ?auto_12172 ?auto_12175 ) ) ( not ( = ?auto_12172 ?auto_12179 ) ) ( not ( = ?auto_12173 ?auto_12175 ) ) ( not ( = ?auto_12173 ?auto_12179 ) ) ( not ( = ?auto_12175 ?auto_12202 ) ) ( not ( = ?auto_12175 ?auto_12186 ) ) ( not ( = ?auto_12175 ?auto_12185 ) ) ( not ( = ?auto_12175 ?auto_12198 ) ) ( not ( = ?auto_12175 ?auto_12203 ) ) ( not ( = ?auto_12175 ?auto_12188 ) ) ( not ( = ?auto_12175 ?auto_12191 ) ) ( not ( = ?auto_12175 ?auto_12189 ) ) ( not ( = ?auto_12180 ?auto_12182 ) ) ( not ( = ?auto_12180 ?auto_12201 ) ) ( not ( = ?auto_12180 ?auto_12193 ) ) ( not ( = ?auto_12180 ?auto_12194 ) ) ( not ( = ?auto_12180 ?auto_12192 ) ) ( not ( = ?auto_12180 ?auto_12190 ) ) ( not ( = ?auto_12180 ?auto_12183 ) ) ( not ( = ?auto_12181 ?auto_12197 ) ) ( not ( = ?auto_12181 ?auto_12187 ) ) ( not ( = ?auto_12181 ?auto_12199 ) ) ( not ( = ?auto_12181 ?auto_12200 ) ) ( not ( = ?auto_12181 ?auto_12184 ) ) ( not ( = ?auto_12181 ?auto_12196 ) ) ( not ( = ?auto_12181 ?auto_12195 ) ) ( not ( = ?auto_12179 ?auto_12202 ) ) ( not ( = ?auto_12179 ?auto_12186 ) ) ( not ( = ?auto_12179 ?auto_12185 ) ) ( not ( = ?auto_12179 ?auto_12198 ) ) ( not ( = ?auto_12179 ?auto_12203 ) ) ( not ( = ?auto_12179 ?auto_12188 ) ) ( not ( = ?auto_12179 ?auto_12191 ) ) ( not ( = ?auto_12179 ?auto_12189 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12166 ?auto_12167 ?auto_12168 ?auto_12169 ?auto_12170 ?auto_12171 ?auto_12172 ?auto_12173 ?auto_12174 )
      ( MAKE-1CRATE ?auto_12174 ?auto_12175 )
      ( MAKE-9CRATE-VERIFY ?auto_12166 ?auto_12167 ?auto_12168 ?auto_12169 ?auto_12170 ?auto_12171 ?auto_12172 ?auto_12173 ?auto_12174 ?auto_12175 ) )
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
      ?auto_12231 - SURFACE
      ?auto_12232 - SURFACE
      ?auto_12233 - SURFACE
      ?auto_12234 - SURFACE
      ?auto_12235 - SURFACE
    )
    :vars
    (
      ?auto_12241 - HOIST
      ?auto_12240 - PLACE
      ?auto_12238 - PLACE
      ?auto_12237 - HOIST
      ?auto_12236 - SURFACE
      ?auto_12264 - PLACE
      ?auto_12244 - HOIST
      ?auto_12265 - SURFACE
      ?auto_12257 - PLACE
      ?auto_12243 - HOIST
      ?auto_12261 - SURFACE
      ?auto_12250 - PLACE
      ?auto_12259 - HOIST
      ?auto_12266 - SURFACE
      ?auto_12260 - PLACE
      ?auto_12258 - HOIST
      ?auto_12251 - SURFACE
      ?auto_12253 - PLACE
      ?auto_12256 - HOIST
      ?auto_12246 - SURFACE
      ?auto_12245 - PLACE
      ?auto_12242 - HOIST
      ?auto_12252 - SURFACE
      ?auto_12254 - PLACE
      ?auto_12247 - HOIST
      ?auto_12263 - SURFACE
      ?auto_12262 - PLACE
      ?auto_12248 - HOIST
      ?auto_12255 - SURFACE
      ?auto_12249 - SURFACE
      ?auto_12239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12241 ?auto_12240 ) ( IS-CRATE ?auto_12235 ) ( not ( = ?auto_12238 ?auto_12240 ) ) ( HOIST-AT ?auto_12237 ?auto_12238 ) ( AVAILABLE ?auto_12237 ) ( SURFACE-AT ?auto_12235 ?auto_12238 ) ( ON ?auto_12235 ?auto_12236 ) ( CLEAR ?auto_12235 ) ( not ( = ?auto_12234 ?auto_12235 ) ) ( not ( = ?auto_12234 ?auto_12236 ) ) ( not ( = ?auto_12235 ?auto_12236 ) ) ( not ( = ?auto_12241 ?auto_12237 ) ) ( IS-CRATE ?auto_12234 ) ( not ( = ?auto_12264 ?auto_12240 ) ) ( HOIST-AT ?auto_12244 ?auto_12264 ) ( AVAILABLE ?auto_12244 ) ( SURFACE-AT ?auto_12234 ?auto_12264 ) ( ON ?auto_12234 ?auto_12265 ) ( CLEAR ?auto_12234 ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12265 ) ) ( not ( = ?auto_12234 ?auto_12265 ) ) ( not ( = ?auto_12241 ?auto_12244 ) ) ( IS-CRATE ?auto_12233 ) ( not ( = ?auto_12257 ?auto_12240 ) ) ( HOIST-AT ?auto_12243 ?auto_12257 ) ( AVAILABLE ?auto_12243 ) ( SURFACE-AT ?auto_12233 ?auto_12257 ) ( ON ?auto_12233 ?auto_12261 ) ( CLEAR ?auto_12233 ) ( not ( = ?auto_12232 ?auto_12233 ) ) ( not ( = ?auto_12232 ?auto_12261 ) ) ( not ( = ?auto_12233 ?auto_12261 ) ) ( not ( = ?auto_12241 ?auto_12243 ) ) ( IS-CRATE ?auto_12232 ) ( not ( = ?auto_12250 ?auto_12240 ) ) ( HOIST-AT ?auto_12259 ?auto_12250 ) ( AVAILABLE ?auto_12259 ) ( SURFACE-AT ?auto_12232 ?auto_12250 ) ( ON ?auto_12232 ?auto_12266 ) ( CLEAR ?auto_12232 ) ( not ( = ?auto_12231 ?auto_12232 ) ) ( not ( = ?auto_12231 ?auto_12266 ) ) ( not ( = ?auto_12232 ?auto_12266 ) ) ( not ( = ?auto_12241 ?auto_12259 ) ) ( IS-CRATE ?auto_12231 ) ( not ( = ?auto_12260 ?auto_12240 ) ) ( HOIST-AT ?auto_12258 ?auto_12260 ) ( AVAILABLE ?auto_12258 ) ( SURFACE-AT ?auto_12231 ?auto_12260 ) ( ON ?auto_12231 ?auto_12251 ) ( CLEAR ?auto_12231 ) ( not ( = ?auto_12230 ?auto_12231 ) ) ( not ( = ?auto_12230 ?auto_12251 ) ) ( not ( = ?auto_12231 ?auto_12251 ) ) ( not ( = ?auto_12241 ?auto_12258 ) ) ( IS-CRATE ?auto_12230 ) ( not ( = ?auto_12253 ?auto_12240 ) ) ( HOIST-AT ?auto_12256 ?auto_12253 ) ( AVAILABLE ?auto_12256 ) ( SURFACE-AT ?auto_12230 ?auto_12253 ) ( ON ?auto_12230 ?auto_12246 ) ( CLEAR ?auto_12230 ) ( not ( = ?auto_12229 ?auto_12230 ) ) ( not ( = ?auto_12229 ?auto_12246 ) ) ( not ( = ?auto_12230 ?auto_12246 ) ) ( not ( = ?auto_12241 ?auto_12256 ) ) ( IS-CRATE ?auto_12229 ) ( not ( = ?auto_12245 ?auto_12240 ) ) ( HOIST-AT ?auto_12242 ?auto_12245 ) ( AVAILABLE ?auto_12242 ) ( SURFACE-AT ?auto_12229 ?auto_12245 ) ( ON ?auto_12229 ?auto_12252 ) ( CLEAR ?auto_12229 ) ( not ( = ?auto_12228 ?auto_12229 ) ) ( not ( = ?auto_12228 ?auto_12252 ) ) ( not ( = ?auto_12229 ?auto_12252 ) ) ( not ( = ?auto_12241 ?auto_12242 ) ) ( IS-CRATE ?auto_12228 ) ( not ( = ?auto_12254 ?auto_12240 ) ) ( HOIST-AT ?auto_12247 ?auto_12254 ) ( SURFACE-AT ?auto_12228 ?auto_12254 ) ( ON ?auto_12228 ?auto_12263 ) ( CLEAR ?auto_12228 ) ( not ( = ?auto_12227 ?auto_12228 ) ) ( not ( = ?auto_12227 ?auto_12263 ) ) ( not ( = ?auto_12228 ?auto_12263 ) ) ( not ( = ?auto_12241 ?auto_12247 ) ) ( IS-CRATE ?auto_12227 ) ( not ( = ?auto_12262 ?auto_12240 ) ) ( HOIST-AT ?auto_12248 ?auto_12262 ) ( AVAILABLE ?auto_12248 ) ( SURFACE-AT ?auto_12227 ?auto_12262 ) ( ON ?auto_12227 ?auto_12255 ) ( CLEAR ?auto_12227 ) ( not ( = ?auto_12226 ?auto_12227 ) ) ( not ( = ?auto_12226 ?auto_12255 ) ) ( not ( = ?auto_12227 ?auto_12255 ) ) ( not ( = ?auto_12241 ?auto_12248 ) ) ( SURFACE-AT ?auto_12225 ?auto_12240 ) ( CLEAR ?auto_12225 ) ( IS-CRATE ?auto_12226 ) ( AVAILABLE ?auto_12241 ) ( AVAILABLE ?auto_12247 ) ( SURFACE-AT ?auto_12226 ?auto_12254 ) ( ON ?auto_12226 ?auto_12249 ) ( CLEAR ?auto_12226 ) ( TRUCK-AT ?auto_12239 ?auto_12240 ) ( not ( = ?auto_12225 ?auto_12226 ) ) ( not ( = ?auto_12225 ?auto_12249 ) ) ( not ( = ?auto_12226 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12227 ) ) ( not ( = ?auto_12225 ?auto_12255 ) ) ( not ( = ?auto_12227 ?auto_12249 ) ) ( not ( = ?auto_12262 ?auto_12254 ) ) ( not ( = ?auto_12248 ?auto_12247 ) ) ( not ( = ?auto_12255 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12228 ) ) ( not ( = ?auto_12225 ?auto_12263 ) ) ( not ( = ?auto_12226 ?auto_12228 ) ) ( not ( = ?auto_12226 ?auto_12263 ) ) ( not ( = ?auto_12228 ?auto_12255 ) ) ( not ( = ?auto_12228 ?auto_12249 ) ) ( not ( = ?auto_12263 ?auto_12255 ) ) ( not ( = ?auto_12263 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12229 ) ) ( not ( = ?auto_12225 ?auto_12252 ) ) ( not ( = ?auto_12226 ?auto_12229 ) ) ( not ( = ?auto_12226 ?auto_12252 ) ) ( not ( = ?auto_12227 ?auto_12229 ) ) ( not ( = ?auto_12227 ?auto_12252 ) ) ( not ( = ?auto_12229 ?auto_12263 ) ) ( not ( = ?auto_12229 ?auto_12255 ) ) ( not ( = ?auto_12229 ?auto_12249 ) ) ( not ( = ?auto_12245 ?auto_12254 ) ) ( not ( = ?auto_12245 ?auto_12262 ) ) ( not ( = ?auto_12242 ?auto_12247 ) ) ( not ( = ?auto_12242 ?auto_12248 ) ) ( not ( = ?auto_12252 ?auto_12263 ) ) ( not ( = ?auto_12252 ?auto_12255 ) ) ( not ( = ?auto_12252 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12230 ) ) ( not ( = ?auto_12225 ?auto_12246 ) ) ( not ( = ?auto_12226 ?auto_12230 ) ) ( not ( = ?auto_12226 ?auto_12246 ) ) ( not ( = ?auto_12227 ?auto_12230 ) ) ( not ( = ?auto_12227 ?auto_12246 ) ) ( not ( = ?auto_12228 ?auto_12230 ) ) ( not ( = ?auto_12228 ?auto_12246 ) ) ( not ( = ?auto_12230 ?auto_12252 ) ) ( not ( = ?auto_12230 ?auto_12263 ) ) ( not ( = ?auto_12230 ?auto_12255 ) ) ( not ( = ?auto_12230 ?auto_12249 ) ) ( not ( = ?auto_12253 ?auto_12245 ) ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12262 ) ) ( not ( = ?auto_12256 ?auto_12242 ) ) ( not ( = ?auto_12256 ?auto_12247 ) ) ( not ( = ?auto_12256 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12252 ) ) ( not ( = ?auto_12246 ?auto_12263 ) ) ( not ( = ?auto_12246 ?auto_12255 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12231 ) ) ( not ( = ?auto_12225 ?auto_12251 ) ) ( not ( = ?auto_12226 ?auto_12231 ) ) ( not ( = ?auto_12226 ?auto_12251 ) ) ( not ( = ?auto_12227 ?auto_12231 ) ) ( not ( = ?auto_12227 ?auto_12251 ) ) ( not ( = ?auto_12228 ?auto_12231 ) ) ( not ( = ?auto_12228 ?auto_12251 ) ) ( not ( = ?auto_12229 ?auto_12231 ) ) ( not ( = ?auto_12229 ?auto_12251 ) ) ( not ( = ?auto_12231 ?auto_12246 ) ) ( not ( = ?auto_12231 ?auto_12252 ) ) ( not ( = ?auto_12231 ?auto_12263 ) ) ( not ( = ?auto_12231 ?auto_12255 ) ) ( not ( = ?auto_12231 ?auto_12249 ) ) ( not ( = ?auto_12260 ?auto_12253 ) ) ( not ( = ?auto_12260 ?auto_12245 ) ) ( not ( = ?auto_12260 ?auto_12254 ) ) ( not ( = ?auto_12260 ?auto_12262 ) ) ( not ( = ?auto_12258 ?auto_12256 ) ) ( not ( = ?auto_12258 ?auto_12242 ) ) ( not ( = ?auto_12258 ?auto_12247 ) ) ( not ( = ?auto_12258 ?auto_12248 ) ) ( not ( = ?auto_12251 ?auto_12246 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12263 ) ) ( not ( = ?auto_12251 ?auto_12255 ) ) ( not ( = ?auto_12251 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12232 ) ) ( not ( = ?auto_12225 ?auto_12266 ) ) ( not ( = ?auto_12226 ?auto_12232 ) ) ( not ( = ?auto_12226 ?auto_12266 ) ) ( not ( = ?auto_12227 ?auto_12232 ) ) ( not ( = ?auto_12227 ?auto_12266 ) ) ( not ( = ?auto_12228 ?auto_12232 ) ) ( not ( = ?auto_12228 ?auto_12266 ) ) ( not ( = ?auto_12229 ?auto_12232 ) ) ( not ( = ?auto_12229 ?auto_12266 ) ) ( not ( = ?auto_12230 ?auto_12232 ) ) ( not ( = ?auto_12230 ?auto_12266 ) ) ( not ( = ?auto_12232 ?auto_12251 ) ) ( not ( = ?auto_12232 ?auto_12246 ) ) ( not ( = ?auto_12232 ?auto_12252 ) ) ( not ( = ?auto_12232 ?auto_12263 ) ) ( not ( = ?auto_12232 ?auto_12255 ) ) ( not ( = ?auto_12232 ?auto_12249 ) ) ( not ( = ?auto_12250 ?auto_12260 ) ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12250 ?auto_12245 ) ) ( not ( = ?auto_12250 ?auto_12254 ) ) ( not ( = ?auto_12250 ?auto_12262 ) ) ( not ( = ?auto_12259 ?auto_12258 ) ) ( not ( = ?auto_12259 ?auto_12256 ) ) ( not ( = ?auto_12259 ?auto_12242 ) ) ( not ( = ?auto_12259 ?auto_12247 ) ) ( not ( = ?auto_12259 ?auto_12248 ) ) ( not ( = ?auto_12266 ?auto_12251 ) ) ( not ( = ?auto_12266 ?auto_12246 ) ) ( not ( = ?auto_12266 ?auto_12252 ) ) ( not ( = ?auto_12266 ?auto_12263 ) ) ( not ( = ?auto_12266 ?auto_12255 ) ) ( not ( = ?auto_12266 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12233 ) ) ( not ( = ?auto_12225 ?auto_12261 ) ) ( not ( = ?auto_12226 ?auto_12233 ) ) ( not ( = ?auto_12226 ?auto_12261 ) ) ( not ( = ?auto_12227 ?auto_12233 ) ) ( not ( = ?auto_12227 ?auto_12261 ) ) ( not ( = ?auto_12228 ?auto_12233 ) ) ( not ( = ?auto_12228 ?auto_12261 ) ) ( not ( = ?auto_12229 ?auto_12233 ) ) ( not ( = ?auto_12229 ?auto_12261 ) ) ( not ( = ?auto_12230 ?auto_12233 ) ) ( not ( = ?auto_12230 ?auto_12261 ) ) ( not ( = ?auto_12231 ?auto_12233 ) ) ( not ( = ?auto_12231 ?auto_12261 ) ) ( not ( = ?auto_12233 ?auto_12266 ) ) ( not ( = ?auto_12233 ?auto_12251 ) ) ( not ( = ?auto_12233 ?auto_12246 ) ) ( not ( = ?auto_12233 ?auto_12252 ) ) ( not ( = ?auto_12233 ?auto_12263 ) ) ( not ( = ?auto_12233 ?auto_12255 ) ) ( not ( = ?auto_12233 ?auto_12249 ) ) ( not ( = ?auto_12257 ?auto_12250 ) ) ( not ( = ?auto_12257 ?auto_12260 ) ) ( not ( = ?auto_12257 ?auto_12253 ) ) ( not ( = ?auto_12257 ?auto_12245 ) ) ( not ( = ?auto_12257 ?auto_12254 ) ) ( not ( = ?auto_12257 ?auto_12262 ) ) ( not ( = ?auto_12243 ?auto_12259 ) ) ( not ( = ?auto_12243 ?auto_12258 ) ) ( not ( = ?auto_12243 ?auto_12256 ) ) ( not ( = ?auto_12243 ?auto_12242 ) ) ( not ( = ?auto_12243 ?auto_12247 ) ) ( not ( = ?auto_12243 ?auto_12248 ) ) ( not ( = ?auto_12261 ?auto_12266 ) ) ( not ( = ?auto_12261 ?auto_12251 ) ) ( not ( = ?auto_12261 ?auto_12246 ) ) ( not ( = ?auto_12261 ?auto_12252 ) ) ( not ( = ?auto_12261 ?auto_12263 ) ) ( not ( = ?auto_12261 ?auto_12255 ) ) ( not ( = ?auto_12261 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12234 ) ) ( not ( = ?auto_12225 ?auto_12265 ) ) ( not ( = ?auto_12226 ?auto_12234 ) ) ( not ( = ?auto_12226 ?auto_12265 ) ) ( not ( = ?auto_12227 ?auto_12234 ) ) ( not ( = ?auto_12227 ?auto_12265 ) ) ( not ( = ?auto_12228 ?auto_12234 ) ) ( not ( = ?auto_12228 ?auto_12265 ) ) ( not ( = ?auto_12229 ?auto_12234 ) ) ( not ( = ?auto_12229 ?auto_12265 ) ) ( not ( = ?auto_12230 ?auto_12234 ) ) ( not ( = ?auto_12230 ?auto_12265 ) ) ( not ( = ?auto_12231 ?auto_12234 ) ) ( not ( = ?auto_12231 ?auto_12265 ) ) ( not ( = ?auto_12232 ?auto_12234 ) ) ( not ( = ?auto_12232 ?auto_12265 ) ) ( not ( = ?auto_12234 ?auto_12261 ) ) ( not ( = ?auto_12234 ?auto_12266 ) ) ( not ( = ?auto_12234 ?auto_12251 ) ) ( not ( = ?auto_12234 ?auto_12246 ) ) ( not ( = ?auto_12234 ?auto_12252 ) ) ( not ( = ?auto_12234 ?auto_12263 ) ) ( not ( = ?auto_12234 ?auto_12255 ) ) ( not ( = ?auto_12234 ?auto_12249 ) ) ( not ( = ?auto_12264 ?auto_12257 ) ) ( not ( = ?auto_12264 ?auto_12250 ) ) ( not ( = ?auto_12264 ?auto_12260 ) ) ( not ( = ?auto_12264 ?auto_12253 ) ) ( not ( = ?auto_12264 ?auto_12245 ) ) ( not ( = ?auto_12264 ?auto_12254 ) ) ( not ( = ?auto_12264 ?auto_12262 ) ) ( not ( = ?auto_12244 ?auto_12243 ) ) ( not ( = ?auto_12244 ?auto_12259 ) ) ( not ( = ?auto_12244 ?auto_12258 ) ) ( not ( = ?auto_12244 ?auto_12256 ) ) ( not ( = ?auto_12244 ?auto_12242 ) ) ( not ( = ?auto_12244 ?auto_12247 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) ( not ( = ?auto_12265 ?auto_12261 ) ) ( not ( = ?auto_12265 ?auto_12266 ) ) ( not ( = ?auto_12265 ?auto_12251 ) ) ( not ( = ?auto_12265 ?auto_12246 ) ) ( not ( = ?auto_12265 ?auto_12252 ) ) ( not ( = ?auto_12265 ?auto_12263 ) ) ( not ( = ?auto_12265 ?auto_12255 ) ) ( not ( = ?auto_12265 ?auto_12249 ) ) ( not ( = ?auto_12225 ?auto_12235 ) ) ( not ( = ?auto_12225 ?auto_12236 ) ) ( not ( = ?auto_12226 ?auto_12235 ) ) ( not ( = ?auto_12226 ?auto_12236 ) ) ( not ( = ?auto_12227 ?auto_12235 ) ) ( not ( = ?auto_12227 ?auto_12236 ) ) ( not ( = ?auto_12228 ?auto_12235 ) ) ( not ( = ?auto_12228 ?auto_12236 ) ) ( not ( = ?auto_12229 ?auto_12235 ) ) ( not ( = ?auto_12229 ?auto_12236 ) ) ( not ( = ?auto_12230 ?auto_12235 ) ) ( not ( = ?auto_12230 ?auto_12236 ) ) ( not ( = ?auto_12231 ?auto_12235 ) ) ( not ( = ?auto_12231 ?auto_12236 ) ) ( not ( = ?auto_12232 ?auto_12235 ) ) ( not ( = ?auto_12232 ?auto_12236 ) ) ( not ( = ?auto_12233 ?auto_12235 ) ) ( not ( = ?auto_12233 ?auto_12236 ) ) ( not ( = ?auto_12235 ?auto_12265 ) ) ( not ( = ?auto_12235 ?auto_12261 ) ) ( not ( = ?auto_12235 ?auto_12266 ) ) ( not ( = ?auto_12235 ?auto_12251 ) ) ( not ( = ?auto_12235 ?auto_12246 ) ) ( not ( = ?auto_12235 ?auto_12252 ) ) ( not ( = ?auto_12235 ?auto_12263 ) ) ( not ( = ?auto_12235 ?auto_12255 ) ) ( not ( = ?auto_12235 ?auto_12249 ) ) ( not ( = ?auto_12238 ?auto_12264 ) ) ( not ( = ?auto_12238 ?auto_12257 ) ) ( not ( = ?auto_12238 ?auto_12250 ) ) ( not ( = ?auto_12238 ?auto_12260 ) ) ( not ( = ?auto_12238 ?auto_12253 ) ) ( not ( = ?auto_12238 ?auto_12245 ) ) ( not ( = ?auto_12238 ?auto_12254 ) ) ( not ( = ?auto_12238 ?auto_12262 ) ) ( not ( = ?auto_12237 ?auto_12244 ) ) ( not ( = ?auto_12237 ?auto_12243 ) ) ( not ( = ?auto_12237 ?auto_12259 ) ) ( not ( = ?auto_12237 ?auto_12258 ) ) ( not ( = ?auto_12237 ?auto_12256 ) ) ( not ( = ?auto_12237 ?auto_12242 ) ) ( not ( = ?auto_12237 ?auto_12247 ) ) ( not ( = ?auto_12237 ?auto_12248 ) ) ( not ( = ?auto_12236 ?auto_12265 ) ) ( not ( = ?auto_12236 ?auto_12261 ) ) ( not ( = ?auto_12236 ?auto_12266 ) ) ( not ( = ?auto_12236 ?auto_12251 ) ) ( not ( = ?auto_12236 ?auto_12246 ) ) ( not ( = ?auto_12236 ?auto_12252 ) ) ( not ( = ?auto_12236 ?auto_12263 ) ) ( not ( = ?auto_12236 ?auto_12255 ) ) ( not ( = ?auto_12236 ?auto_12249 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12225 ?auto_12226 ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12230 ?auto_12231 ?auto_12232 ?auto_12233 ?auto_12234 )
      ( MAKE-1CRATE ?auto_12234 ?auto_12235 )
      ( MAKE-10CRATE-VERIFY ?auto_12225 ?auto_12226 ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12230 ?auto_12231 ?auto_12232 ?auto_12233 ?auto_12234 ?auto_12235 ) )
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
      ?auto_12295 - SURFACE
      ?auto_12296 - SURFACE
      ?auto_12297 - SURFACE
      ?auto_12298 - SURFACE
      ?auto_12299 - SURFACE
      ?auto_12300 - SURFACE
    )
    :vars
    (
      ?auto_12303 - HOIST
      ?auto_12305 - PLACE
      ?auto_12304 - PLACE
      ?auto_12301 - HOIST
      ?auto_12302 - SURFACE
      ?auto_12308 - PLACE
      ?auto_12311 - HOIST
      ?auto_12319 - SURFACE
      ?auto_12327 - PLACE
      ?auto_12316 - HOIST
      ?auto_12329 - SURFACE
      ?auto_12330 - PLACE
      ?auto_12331 - HOIST
      ?auto_12323 - SURFACE
      ?auto_12325 - PLACE
      ?auto_12309 - HOIST
      ?auto_12314 - SURFACE
      ?auto_12307 - PLACE
      ?auto_12315 - HOIST
      ?auto_12312 - SURFACE
      ?auto_12317 - PLACE
      ?auto_12318 - HOIST
      ?auto_12310 - SURFACE
      ?auto_12322 - PLACE
      ?auto_12321 - HOIST
      ?auto_12313 - SURFACE
      ?auto_12333 - PLACE
      ?auto_12320 - HOIST
      ?auto_12324 - SURFACE
      ?auto_12326 - PLACE
      ?auto_12332 - HOIST
      ?auto_12334 - SURFACE
      ?auto_12328 - SURFACE
      ?auto_12306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12303 ?auto_12305 ) ( IS-CRATE ?auto_12300 ) ( not ( = ?auto_12304 ?auto_12305 ) ) ( HOIST-AT ?auto_12301 ?auto_12304 ) ( AVAILABLE ?auto_12301 ) ( SURFACE-AT ?auto_12300 ?auto_12304 ) ( ON ?auto_12300 ?auto_12302 ) ( CLEAR ?auto_12300 ) ( not ( = ?auto_12299 ?auto_12300 ) ) ( not ( = ?auto_12299 ?auto_12302 ) ) ( not ( = ?auto_12300 ?auto_12302 ) ) ( not ( = ?auto_12303 ?auto_12301 ) ) ( IS-CRATE ?auto_12299 ) ( not ( = ?auto_12308 ?auto_12305 ) ) ( HOIST-AT ?auto_12311 ?auto_12308 ) ( AVAILABLE ?auto_12311 ) ( SURFACE-AT ?auto_12299 ?auto_12308 ) ( ON ?auto_12299 ?auto_12319 ) ( CLEAR ?auto_12299 ) ( not ( = ?auto_12298 ?auto_12299 ) ) ( not ( = ?auto_12298 ?auto_12319 ) ) ( not ( = ?auto_12299 ?auto_12319 ) ) ( not ( = ?auto_12303 ?auto_12311 ) ) ( IS-CRATE ?auto_12298 ) ( not ( = ?auto_12327 ?auto_12305 ) ) ( HOIST-AT ?auto_12316 ?auto_12327 ) ( AVAILABLE ?auto_12316 ) ( SURFACE-AT ?auto_12298 ?auto_12327 ) ( ON ?auto_12298 ?auto_12329 ) ( CLEAR ?auto_12298 ) ( not ( = ?auto_12297 ?auto_12298 ) ) ( not ( = ?auto_12297 ?auto_12329 ) ) ( not ( = ?auto_12298 ?auto_12329 ) ) ( not ( = ?auto_12303 ?auto_12316 ) ) ( IS-CRATE ?auto_12297 ) ( not ( = ?auto_12330 ?auto_12305 ) ) ( HOIST-AT ?auto_12331 ?auto_12330 ) ( AVAILABLE ?auto_12331 ) ( SURFACE-AT ?auto_12297 ?auto_12330 ) ( ON ?auto_12297 ?auto_12323 ) ( CLEAR ?auto_12297 ) ( not ( = ?auto_12296 ?auto_12297 ) ) ( not ( = ?auto_12296 ?auto_12323 ) ) ( not ( = ?auto_12297 ?auto_12323 ) ) ( not ( = ?auto_12303 ?auto_12331 ) ) ( IS-CRATE ?auto_12296 ) ( not ( = ?auto_12325 ?auto_12305 ) ) ( HOIST-AT ?auto_12309 ?auto_12325 ) ( AVAILABLE ?auto_12309 ) ( SURFACE-AT ?auto_12296 ?auto_12325 ) ( ON ?auto_12296 ?auto_12314 ) ( CLEAR ?auto_12296 ) ( not ( = ?auto_12295 ?auto_12296 ) ) ( not ( = ?auto_12295 ?auto_12314 ) ) ( not ( = ?auto_12296 ?auto_12314 ) ) ( not ( = ?auto_12303 ?auto_12309 ) ) ( IS-CRATE ?auto_12295 ) ( not ( = ?auto_12307 ?auto_12305 ) ) ( HOIST-AT ?auto_12315 ?auto_12307 ) ( AVAILABLE ?auto_12315 ) ( SURFACE-AT ?auto_12295 ?auto_12307 ) ( ON ?auto_12295 ?auto_12312 ) ( CLEAR ?auto_12295 ) ( not ( = ?auto_12294 ?auto_12295 ) ) ( not ( = ?auto_12294 ?auto_12312 ) ) ( not ( = ?auto_12295 ?auto_12312 ) ) ( not ( = ?auto_12303 ?auto_12315 ) ) ( IS-CRATE ?auto_12294 ) ( not ( = ?auto_12317 ?auto_12305 ) ) ( HOIST-AT ?auto_12318 ?auto_12317 ) ( AVAILABLE ?auto_12318 ) ( SURFACE-AT ?auto_12294 ?auto_12317 ) ( ON ?auto_12294 ?auto_12310 ) ( CLEAR ?auto_12294 ) ( not ( = ?auto_12293 ?auto_12294 ) ) ( not ( = ?auto_12293 ?auto_12310 ) ) ( not ( = ?auto_12294 ?auto_12310 ) ) ( not ( = ?auto_12303 ?auto_12318 ) ) ( IS-CRATE ?auto_12293 ) ( not ( = ?auto_12322 ?auto_12305 ) ) ( HOIST-AT ?auto_12321 ?auto_12322 ) ( AVAILABLE ?auto_12321 ) ( SURFACE-AT ?auto_12293 ?auto_12322 ) ( ON ?auto_12293 ?auto_12313 ) ( CLEAR ?auto_12293 ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( not ( = ?auto_12292 ?auto_12313 ) ) ( not ( = ?auto_12293 ?auto_12313 ) ) ( not ( = ?auto_12303 ?auto_12321 ) ) ( IS-CRATE ?auto_12292 ) ( not ( = ?auto_12333 ?auto_12305 ) ) ( HOIST-AT ?auto_12320 ?auto_12333 ) ( SURFACE-AT ?auto_12292 ?auto_12333 ) ( ON ?auto_12292 ?auto_12324 ) ( CLEAR ?auto_12292 ) ( not ( = ?auto_12291 ?auto_12292 ) ) ( not ( = ?auto_12291 ?auto_12324 ) ) ( not ( = ?auto_12292 ?auto_12324 ) ) ( not ( = ?auto_12303 ?auto_12320 ) ) ( IS-CRATE ?auto_12291 ) ( not ( = ?auto_12326 ?auto_12305 ) ) ( HOIST-AT ?auto_12332 ?auto_12326 ) ( AVAILABLE ?auto_12332 ) ( SURFACE-AT ?auto_12291 ?auto_12326 ) ( ON ?auto_12291 ?auto_12334 ) ( CLEAR ?auto_12291 ) ( not ( = ?auto_12290 ?auto_12291 ) ) ( not ( = ?auto_12290 ?auto_12334 ) ) ( not ( = ?auto_12291 ?auto_12334 ) ) ( not ( = ?auto_12303 ?auto_12332 ) ) ( SURFACE-AT ?auto_12289 ?auto_12305 ) ( CLEAR ?auto_12289 ) ( IS-CRATE ?auto_12290 ) ( AVAILABLE ?auto_12303 ) ( AVAILABLE ?auto_12320 ) ( SURFACE-AT ?auto_12290 ?auto_12333 ) ( ON ?auto_12290 ?auto_12328 ) ( CLEAR ?auto_12290 ) ( TRUCK-AT ?auto_12306 ?auto_12305 ) ( not ( = ?auto_12289 ?auto_12290 ) ) ( not ( = ?auto_12289 ?auto_12328 ) ) ( not ( = ?auto_12290 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12291 ) ) ( not ( = ?auto_12289 ?auto_12334 ) ) ( not ( = ?auto_12291 ?auto_12328 ) ) ( not ( = ?auto_12326 ?auto_12333 ) ) ( not ( = ?auto_12332 ?auto_12320 ) ) ( not ( = ?auto_12334 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12292 ) ) ( not ( = ?auto_12289 ?auto_12324 ) ) ( not ( = ?auto_12290 ?auto_12292 ) ) ( not ( = ?auto_12290 ?auto_12324 ) ) ( not ( = ?auto_12292 ?auto_12334 ) ) ( not ( = ?auto_12292 ?auto_12328 ) ) ( not ( = ?auto_12324 ?auto_12334 ) ) ( not ( = ?auto_12324 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12293 ) ) ( not ( = ?auto_12289 ?auto_12313 ) ) ( not ( = ?auto_12290 ?auto_12293 ) ) ( not ( = ?auto_12290 ?auto_12313 ) ) ( not ( = ?auto_12291 ?auto_12293 ) ) ( not ( = ?auto_12291 ?auto_12313 ) ) ( not ( = ?auto_12293 ?auto_12324 ) ) ( not ( = ?auto_12293 ?auto_12334 ) ) ( not ( = ?auto_12293 ?auto_12328 ) ) ( not ( = ?auto_12322 ?auto_12333 ) ) ( not ( = ?auto_12322 ?auto_12326 ) ) ( not ( = ?auto_12321 ?auto_12320 ) ) ( not ( = ?auto_12321 ?auto_12332 ) ) ( not ( = ?auto_12313 ?auto_12324 ) ) ( not ( = ?auto_12313 ?auto_12334 ) ) ( not ( = ?auto_12313 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12294 ) ) ( not ( = ?auto_12289 ?auto_12310 ) ) ( not ( = ?auto_12290 ?auto_12294 ) ) ( not ( = ?auto_12290 ?auto_12310 ) ) ( not ( = ?auto_12291 ?auto_12294 ) ) ( not ( = ?auto_12291 ?auto_12310 ) ) ( not ( = ?auto_12292 ?auto_12294 ) ) ( not ( = ?auto_12292 ?auto_12310 ) ) ( not ( = ?auto_12294 ?auto_12313 ) ) ( not ( = ?auto_12294 ?auto_12324 ) ) ( not ( = ?auto_12294 ?auto_12334 ) ) ( not ( = ?auto_12294 ?auto_12328 ) ) ( not ( = ?auto_12317 ?auto_12322 ) ) ( not ( = ?auto_12317 ?auto_12333 ) ) ( not ( = ?auto_12317 ?auto_12326 ) ) ( not ( = ?auto_12318 ?auto_12321 ) ) ( not ( = ?auto_12318 ?auto_12320 ) ) ( not ( = ?auto_12318 ?auto_12332 ) ) ( not ( = ?auto_12310 ?auto_12313 ) ) ( not ( = ?auto_12310 ?auto_12324 ) ) ( not ( = ?auto_12310 ?auto_12334 ) ) ( not ( = ?auto_12310 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12295 ) ) ( not ( = ?auto_12289 ?auto_12312 ) ) ( not ( = ?auto_12290 ?auto_12295 ) ) ( not ( = ?auto_12290 ?auto_12312 ) ) ( not ( = ?auto_12291 ?auto_12295 ) ) ( not ( = ?auto_12291 ?auto_12312 ) ) ( not ( = ?auto_12292 ?auto_12295 ) ) ( not ( = ?auto_12292 ?auto_12312 ) ) ( not ( = ?auto_12293 ?auto_12295 ) ) ( not ( = ?auto_12293 ?auto_12312 ) ) ( not ( = ?auto_12295 ?auto_12310 ) ) ( not ( = ?auto_12295 ?auto_12313 ) ) ( not ( = ?auto_12295 ?auto_12324 ) ) ( not ( = ?auto_12295 ?auto_12334 ) ) ( not ( = ?auto_12295 ?auto_12328 ) ) ( not ( = ?auto_12307 ?auto_12317 ) ) ( not ( = ?auto_12307 ?auto_12322 ) ) ( not ( = ?auto_12307 ?auto_12333 ) ) ( not ( = ?auto_12307 ?auto_12326 ) ) ( not ( = ?auto_12315 ?auto_12318 ) ) ( not ( = ?auto_12315 ?auto_12321 ) ) ( not ( = ?auto_12315 ?auto_12320 ) ) ( not ( = ?auto_12315 ?auto_12332 ) ) ( not ( = ?auto_12312 ?auto_12310 ) ) ( not ( = ?auto_12312 ?auto_12313 ) ) ( not ( = ?auto_12312 ?auto_12324 ) ) ( not ( = ?auto_12312 ?auto_12334 ) ) ( not ( = ?auto_12312 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12296 ) ) ( not ( = ?auto_12289 ?auto_12314 ) ) ( not ( = ?auto_12290 ?auto_12296 ) ) ( not ( = ?auto_12290 ?auto_12314 ) ) ( not ( = ?auto_12291 ?auto_12296 ) ) ( not ( = ?auto_12291 ?auto_12314 ) ) ( not ( = ?auto_12292 ?auto_12296 ) ) ( not ( = ?auto_12292 ?auto_12314 ) ) ( not ( = ?auto_12293 ?auto_12296 ) ) ( not ( = ?auto_12293 ?auto_12314 ) ) ( not ( = ?auto_12294 ?auto_12296 ) ) ( not ( = ?auto_12294 ?auto_12314 ) ) ( not ( = ?auto_12296 ?auto_12312 ) ) ( not ( = ?auto_12296 ?auto_12310 ) ) ( not ( = ?auto_12296 ?auto_12313 ) ) ( not ( = ?auto_12296 ?auto_12324 ) ) ( not ( = ?auto_12296 ?auto_12334 ) ) ( not ( = ?auto_12296 ?auto_12328 ) ) ( not ( = ?auto_12325 ?auto_12307 ) ) ( not ( = ?auto_12325 ?auto_12317 ) ) ( not ( = ?auto_12325 ?auto_12322 ) ) ( not ( = ?auto_12325 ?auto_12333 ) ) ( not ( = ?auto_12325 ?auto_12326 ) ) ( not ( = ?auto_12309 ?auto_12315 ) ) ( not ( = ?auto_12309 ?auto_12318 ) ) ( not ( = ?auto_12309 ?auto_12321 ) ) ( not ( = ?auto_12309 ?auto_12320 ) ) ( not ( = ?auto_12309 ?auto_12332 ) ) ( not ( = ?auto_12314 ?auto_12312 ) ) ( not ( = ?auto_12314 ?auto_12310 ) ) ( not ( = ?auto_12314 ?auto_12313 ) ) ( not ( = ?auto_12314 ?auto_12324 ) ) ( not ( = ?auto_12314 ?auto_12334 ) ) ( not ( = ?auto_12314 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12297 ) ) ( not ( = ?auto_12289 ?auto_12323 ) ) ( not ( = ?auto_12290 ?auto_12297 ) ) ( not ( = ?auto_12290 ?auto_12323 ) ) ( not ( = ?auto_12291 ?auto_12297 ) ) ( not ( = ?auto_12291 ?auto_12323 ) ) ( not ( = ?auto_12292 ?auto_12297 ) ) ( not ( = ?auto_12292 ?auto_12323 ) ) ( not ( = ?auto_12293 ?auto_12297 ) ) ( not ( = ?auto_12293 ?auto_12323 ) ) ( not ( = ?auto_12294 ?auto_12297 ) ) ( not ( = ?auto_12294 ?auto_12323 ) ) ( not ( = ?auto_12295 ?auto_12297 ) ) ( not ( = ?auto_12295 ?auto_12323 ) ) ( not ( = ?auto_12297 ?auto_12314 ) ) ( not ( = ?auto_12297 ?auto_12312 ) ) ( not ( = ?auto_12297 ?auto_12310 ) ) ( not ( = ?auto_12297 ?auto_12313 ) ) ( not ( = ?auto_12297 ?auto_12324 ) ) ( not ( = ?auto_12297 ?auto_12334 ) ) ( not ( = ?auto_12297 ?auto_12328 ) ) ( not ( = ?auto_12330 ?auto_12325 ) ) ( not ( = ?auto_12330 ?auto_12307 ) ) ( not ( = ?auto_12330 ?auto_12317 ) ) ( not ( = ?auto_12330 ?auto_12322 ) ) ( not ( = ?auto_12330 ?auto_12333 ) ) ( not ( = ?auto_12330 ?auto_12326 ) ) ( not ( = ?auto_12331 ?auto_12309 ) ) ( not ( = ?auto_12331 ?auto_12315 ) ) ( not ( = ?auto_12331 ?auto_12318 ) ) ( not ( = ?auto_12331 ?auto_12321 ) ) ( not ( = ?auto_12331 ?auto_12320 ) ) ( not ( = ?auto_12331 ?auto_12332 ) ) ( not ( = ?auto_12323 ?auto_12314 ) ) ( not ( = ?auto_12323 ?auto_12312 ) ) ( not ( = ?auto_12323 ?auto_12310 ) ) ( not ( = ?auto_12323 ?auto_12313 ) ) ( not ( = ?auto_12323 ?auto_12324 ) ) ( not ( = ?auto_12323 ?auto_12334 ) ) ( not ( = ?auto_12323 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12298 ) ) ( not ( = ?auto_12289 ?auto_12329 ) ) ( not ( = ?auto_12290 ?auto_12298 ) ) ( not ( = ?auto_12290 ?auto_12329 ) ) ( not ( = ?auto_12291 ?auto_12298 ) ) ( not ( = ?auto_12291 ?auto_12329 ) ) ( not ( = ?auto_12292 ?auto_12298 ) ) ( not ( = ?auto_12292 ?auto_12329 ) ) ( not ( = ?auto_12293 ?auto_12298 ) ) ( not ( = ?auto_12293 ?auto_12329 ) ) ( not ( = ?auto_12294 ?auto_12298 ) ) ( not ( = ?auto_12294 ?auto_12329 ) ) ( not ( = ?auto_12295 ?auto_12298 ) ) ( not ( = ?auto_12295 ?auto_12329 ) ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( not ( = ?auto_12296 ?auto_12329 ) ) ( not ( = ?auto_12298 ?auto_12323 ) ) ( not ( = ?auto_12298 ?auto_12314 ) ) ( not ( = ?auto_12298 ?auto_12312 ) ) ( not ( = ?auto_12298 ?auto_12310 ) ) ( not ( = ?auto_12298 ?auto_12313 ) ) ( not ( = ?auto_12298 ?auto_12324 ) ) ( not ( = ?auto_12298 ?auto_12334 ) ) ( not ( = ?auto_12298 ?auto_12328 ) ) ( not ( = ?auto_12327 ?auto_12330 ) ) ( not ( = ?auto_12327 ?auto_12325 ) ) ( not ( = ?auto_12327 ?auto_12307 ) ) ( not ( = ?auto_12327 ?auto_12317 ) ) ( not ( = ?auto_12327 ?auto_12322 ) ) ( not ( = ?auto_12327 ?auto_12333 ) ) ( not ( = ?auto_12327 ?auto_12326 ) ) ( not ( = ?auto_12316 ?auto_12331 ) ) ( not ( = ?auto_12316 ?auto_12309 ) ) ( not ( = ?auto_12316 ?auto_12315 ) ) ( not ( = ?auto_12316 ?auto_12318 ) ) ( not ( = ?auto_12316 ?auto_12321 ) ) ( not ( = ?auto_12316 ?auto_12320 ) ) ( not ( = ?auto_12316 ?auto_12332 ) ) ( not ( = ?auto_12329 ?auto_12323 ) ) ( not ( = ?auto_12329 ?auto_12314 ) ) ( not ( = ?auto_12329 ?auto_12312 ) ) ( not ( = ?auto_12329 ?auto_12310 ) ) ( not ( = ?auto_12329 ?auto_12313 ) ) ( not ( = ?auto_12329 ?auto_12324 ) ) ( not ( = ?auto_12329 ?auto_12334 ) ) ( not ( = ?auto_12329 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12299 ) ) ( not ( = ?auto_12289 ?auto_12319 ) ) ( not ( = ?auto_12290 ?auto_12299 ) ) ( not ( = ?auto_12290 ?auto_12319 ) ) ( not ( = ?auto_12291 ?auto_12299 ) ) ( not ( = ?auto_12291 ?auto_12319 ) ) ( not ( = ?auto_12292 ?auto_12299 ) ) ( not ( = ?auto_12292 ?auto_12319 ) ) ( not ( = ?auto_12293 ?auto_12299 ) ) ( not ( = ?auto_12293 ?auto_12319 ) ) ( not ( = ?auto_12294 ?auto_12299 ) ) ( not ( = ?auto_12294 ?auto_12319 ) ) ( not ( = ?auto_12295 ?auto_12299 ) ) ( not ( = ?auto_12295 ?auto_12319 ) ) ( not ( = ?auto_12296 ?auto_12299 ) ) ( not ( = ?auto_12296 ?auto_12319 ) ) ( not ( = ?auto_12297 ?auto_12299 ) ) ( not ( = ?auto_12297 ?auto_12319 ) ) ( not ( = ?auto_12299 ?auto_12329 ) ) ( not ( = ?auto_12299 ?auto_12323 ) ) ( not ( = ?auto_12299 ?auto_12314 ) ) ( not ( = ?auto_12299 ?auto_12312 ) ) ( not ( = ?auto_12299 ?auto_12310 ) ) ( not ( = ?auto_12299 ?auto_12313 ) ) ( not ( = ?auto_12299 ?auto_12324 ) ) ( not ( = ?auto_12299 ?auto_12334 ) ) ( not ( = ?auto_12299 ?auto_12328 ) ) ( not ( = ?auto_12308 ?auto_12327 ) ) ( not ( = ?auto_12308 ?auto_12330 ) ) ( not ( = ?auto_12308 ?auto_12325 ) ) ( not ( = ?auto_12308 ?auto_12307 ) ) ( not ( = ?auto_12308 ?auto_12317 ) ) ( not ( = ?auto_12308 ?auto_12322 ) ) ( not ( = ?auto_12308 ?auto_12333 ) ) ( not ( = ?auto_12308 ?auto_12326 ) ) ( not ( = ?auto_12311 ?auto_12316 ) ) ( not ( = ?auto_12311 ?auto_12331 ) ) ( not ( = ?auto_12311 ?auto_12309 ) ) ( not ( = ?auto_12311 ?auto_12315 ) ) ( not ( = ?auto_12311 ?auto_12318 ) ) ( not ( = ?auto_12311 ?auto_12321 ) ) ( not ( = ?auto_12311 ?auto_12320 ) ) ( not ( = ?auto_12311 ?auto_12332 ) ) ( not ( = ?auto_12319 ?auto_12329 ) ) ( not ( = ?auto_12319 ?auto_12323 ) ) ( not ( = ?auto_12319 ?auto_12314 ) ) ( not ( = ?auto_12319 ?auto_12312 ) ) ( not ( = ?auto_12319 ?auto_12310 ) ) ( not ( = ?auto_12319 ?auto_12313 ) ) ( not ( = ?auto_12319 ?auto_12324 ) ) ( not ( = ?auto_12319 ?auto_12334 ) ) ( not ( = ?auto_12319 ?auto_12328 ) ) ( not ( = ?auto_12289 ?auto_12300 ) ) ( not ( = ?auto_12289 ?auto_12302 ) ) ( not ( = ?auto_12290 ?auto_12300 ) ) ( not ( = ?auto_12290 ?auto_12302 ) ) ( not ( = ?auto_12291 ?auto_12300 ) ) ( not ( = ?auto_12291 ?auto_12302 ) ) ( not ( = ?auto_12292 ?auto_12300 ) ) ( not ( = ?auto_12292 ?auto_12302 ) ) ( not ( = ?auto_12293 ?auto_12300 ) ) ( not ( = ?auto_12293 ?auto_12302 ) ) ( not ( = ?auto_12294 ?auto_12300 ) ) ( not ( = ?auto_12294 ?auto_12302 ) ) ( not ( = ?auto_12295 ?auto_12300 ) ) ( not ( = ?auto_12295 ?auto_12302 ) ) ( not ( = ?auto_12296 ?auto_12300 ) ) ( not ( = ?auto_12296 ?auto_12302 ) ) ( not ( = ?auto_12297 ?auto_12300 ) ) ( not ( = ?auto_12297 ?auto_12302 ) ) ( not ( = ?auto_12298 ?auto_12300 ) ) ( not ( = ?auto_12298 ?auto_12302 ) ) ( not ( = ?auto_12300 ?auto_12319 ) ) ( not ( = ?auto_12300 ?auto_12329 ) ) ( not ( = ?auto_12300 ?auto_12323 ) ) ( not ( = ?auto_12300 ?auto_12314 ) ) ( not ( = ?auto_12300 ?auto_12312 ) ) ( not ( = ?auto_12300 ?auto_12310 ) ) ( not ( = ?auto_12300 ?auto_12313 ) ) ( not ( = ?auto_12300 ?auto_12324 ) ) ( not ( = ?auto_12300 ?auto_12334 ) ) ( not ( = ?auto_12300 ?auto_12328 ) ) ( not ( = ?auto_12304 ?auto_12308 ) ) ( not ( = ?auto_12304 ?auto_12327 ) ) ( not ( = ?auto_12304 ?auto_12330 ) ) ( not ( = ?auto_12304 ?auto_12325 ) ) ( not ( = ?auto_12304 ?auto_12307 ) ) ( not ( = ?auto_12304 ?auto_12317 ) ) ( not ( = ?auto_12304 ?auto_12322 ) ) ( not ( = ?auto_12304 ?auto_12333 ) ) ( not ( = ?auto_12304 ?auto_12326 ) ) ( not ( = ?auto_12301 ?auto_12311 ) ) ( not ( = ?auto_12301 ?auto_12316 ) ) ( not ( = ?auto_12301 ?auto_12331 ) ) ( not ( = ?auto_12301 ?auto_12309 ) ) ( not ( = ?auto_12301 ?auto_12315 ) ) ( not ( = ?auto_12301 ?auto_12318 ) ) ( not ( = ?auto_12301 ?auto_12321 ) ) ( not ( = ?auto_12301 ?auto_12320 ) ) ( not ( = ?auto_12301 ?auto_12332 ) ) ( not ( = ?auto_12302 ?auto_12319 ) ) ( not ( = ?auto_12302 ?auto_12329 ) ) ( not ( = ?auto_12302 ?auto_12323 ) ) ( not ( = ?auto_12302 ?auto_12314 ) ) ( not ( = ?auto_12302 ?auto_12312 ) ) ( not ( = ?auto_12302 ?auto_12310 ) ) ( not ( = ?auto_12302 ?auto_12313 ) ) ( not ( = ?auto_12302 ?auto_12324 ) ) ( not ( = ?auto_12302 ?auto_12334 ) ) ( not ( = ?auto_12302 ?auto_12328 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12289 ?auto_12290 ?auto_12291 ?auto_12292 ?auto_12293 ?auto_12294 ?auto_12295 ?auto_12296 ?auto_12297 ?auto_12298 ?auto_12299 )
      ( MAKE-1CRATE ?auto_12299 ?auto_12300 )
      ( MAKE-11CRATE-VERIFY ?auto_12289 ?auto_12290 ?auto_12291 ?auto_12292 ?auto_12293 ?auto_12294 ?auto_12295 ?auto_12296 ?auto_12297 ?auto_12298 ?auto_12299 ?auto_12300 ) )
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
      ?auto_12364 - SURFACE
      ?auto_12365 - SURFACE
      ?auto_12366 - SURFACE
      ?auto_12367 - SURFACE
      ?auto_12368 - SURFACE
      ?auto_12369 - SURFACE
      ?auto_12370 - SURFACE
    )
    :vars
    (
      ?auto_12376 - HOIST
      ?auto_12371 - PLACE
      ?auto_12375 - PLACE
      ?auto_12373 - HOIST
      ?auto_12372 - SURFACE
      ?auto_12403 - PLACE
      ?auto_12398 - HOIST
      ?auto_12392 - SURFACE
      ?auto_12383 - PLACE
      ?auto_12388 - HOIST
      ?auto_12385 - SURFACE
      ?auto_12389 - PLACE
      ?auto_12391 - HOIST
      ?auto_12401 - SURFACE
      ?auto_12377 - PLACE
      ?auto_12394 - HOIST
      ?auto_12396 - SURFACE
      ?auto_12380 - PLACE
      ?auto_12395 - HOIST
      ?auto_12406 - SURFACE
      ?auto_12400 - PLACE
      ?auto_12378 - HOIST
      ?auto_12379 - SURFACE
      ?auto_12382 - PLACE
      ?auto_12402 - HOIST
      ?auto_12381 - SURFACE
      ?auto_12387 - PLACE
      ?auto_12386 - HOIST
      ?auto_12405 - SURFACE
      ?auto_12407 - PLACE
      ?auto_12399 - HOIST
      ?auto_12397 - SURFACE
      ?auto_12393 - PLACE
      ?auto_12384 - HOIST
      ?auto_12390 - SURFACE
      ?auto_12404 - SURFACE
      ?auto_12374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12376 ?auto_12371 ) ( IS-CRATE ?auto_12370 ) ( not ( = ?auto_12375 ?auto_12371 ) ) ( HOIST-AT ?auto_12373 ?auto_12375 ) ( AVAILABLE ?auto_12373 ) ( SURFACE-AT ?auto_12370 ?auto_12375 ) ( ON ?auto_12370 ?auto_12372 ) ( CLEAR ?auto_12370 ) ( not ( = ?auto_12369 ?auto_12370 ) ) ( not ( = ?auto_12369 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12376 ?auto_12373 ) ) ( IS-CRATE ?auto_12369 ) ( not ( = ?auto_12403 ?auto_12371 ) ) ( HOIST-AT ?auto_12398 ?auto_12403 ) ( AVAILABLE ?auto_12398 ) ( SURFACE-AT ?auto_12369 ?auto_12403 ) ( ON ?auto_12369 ?auto_12392 ) ( CLEAR ?auto_12369 ) ( not ( = ?auto_12368 ?auto_12369 ) ) ( not ( = ?auto_12368 ?auto_12392 ) ) ( not ( = ?auto_12369 ?auto_12392 ) ) ( not ( = ?auto_12376 ?auto_12398 ) ) ( IS-CRATE ?auto_12368 ) ( not ( = ?auto_12383 ?auto_12371 ) ) ( HOIST-AT ?auto_12388 ?auto_12383 ) ( AVAILABLE ?auto_12388 ) ( SURFACE-AT ?auto_12368 ?auto_12383 ) ( ON ?auto_12368 ?auto_12385 ) ( CLEAR ?auto_12368 ) ( not ( = ?auto_12367 ?auto_12368 ) ) ( not ( = ?auto_12367 ?auto_12385 ) ) ( not ( = ?auto_12368 ?auto_12385 ) ) ( not ( = ?auto_12376 ?auto_12388 ) ) ( IS-CRATE ?auto_12367 ) ( not ( = ?auto_12389 ?auto_12371 ) ) ( HOIST-AT ?auto_12391 ?auto_12389 ) ( AVAILABLE ?auto_12391 ) ( SURFACE-AT ?auto_12367 ?auto_12389 ) ( ON ?auto_12367 ?auto_12401 ) ( CLEAR ?auto_12367 ) ( not ( = ?auto_12366 ?auto_12367 ) ) ( not ( = ?auto_12366 ?auto_12401 ) ) ( not ( = ?auto_12367 ?auto_12401 ) ) ( not ( = ?auto_12376 ?auto_12391 ) ) ( IS-CRATE ?auto_12366 ) ( not ( = ?auto_12377 ?auto_12371 ) ) ( HOIST-AT ?auto_12394 ?auto_12377 ) ( AVAILABLE ?auto_12394 ) ( SURFACE-AT ?auto_12366 ?auto_12377 ) ( ON ?auto_12366 ?auto_12396 ) ( CLEAR ?auto_12366 ) ( not ( = ?auto_12365 ?auto_12366 ) ) ( not ( = ?auto_12365 ?auto_12396 ) ) ( not ( = ?auto_12366 ?auto_12396 ) ) ( not ( = ?auto_12376 ?auto_12394 ) ) ( IS-CRATE ?auto_12365 ) ( not ( = ?auto_12380 ?auto_12371 ) ) ( HOIST-AT ?auto_12395 ?auto_12380 ) ( AVAILABLE ?auto_12395 ) ( SURFACE-AT ?auto_12365 ?auto_12380 ) ( ON ?auto_12365 ?auto_12406 ) ( CLEAR ?auto_12365 ) ( not ( = ?auto_12364 ?auto_12365 ) ) ( not ( = ?auto_12364 ?auto_12406 ) ) ( not ( = ?auto_12365 ?auto_12406 ) ) ( not ( = ?auto_12376 ?auto_12395 ) ) ( IS-CRATE ?auto_12364 ) ( not ( = ?auto_12400 ?auto_12371 ) ) ( HOIST-AT ?auto_12378 ?auto_12400 ) ( AVAILABLE ?auto_12378 ) ( SURFACE-AT ?auto_12364 ?auto_12400 ) ( ON ?auto_12364 ?auto_12379 ) ( CLEAR ?auto_12364 ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( not ( = ?auto_12363 ?auto_12379 ) ) ( not ( = ?auto_12364 ?auto_12379 ) ) ( not ( = ?auto_12376 ?auto_12378 ) ) ( IS-CRATE ?auto_12363 ) ( not ( = ?auto_12382 ?auto_12371 ) ) ( HOIST-AT ?auto_12402 ?auto_12382 ) ( AVAILABLE ?auto_12402 ) ( SURFACE-AT ?auto_12363 ?auto_12382 ) ( ON ?auto_12363 ?auto_12381 ) ( CLEAR ?auto_12363 ) ( not ( = ?auto_12362 ?auto_12363 ) ) ( not ( = ?auto_12362 ?auto_12381 ) ) ( not ( = ?auto_12363 ?auto_12381 ) ) ( not ( = ?auto_12376 ?auto_12402 ) ) ( IS-CRATE ?auto_12362 ) ( not ( = ?auto_12387 ?auto_12371 ) ) ( HOIST-AT ?auto_12386 ?auto_12387 ) ( AVAILABLE ?auto_12386 ) ( SURFACE-AT ?auto_12362 ?auto_12387 ) ( ON ?auto_12362 ?auto_12405 ) ( CLEAR ?auto_12362 ) ( not ( = ?auto_12361 ?auto_12362 ) ) ( not ( = ?auto_12361 ?auto_12405 ) ) ( not ( = ?auto_12362 ?auto_12405 ) ) ( not ( = ?auto_12376 ?auto_12386 ) ) ( IS-CRATE ?auto_12361 ) ( not ( = ?auto_12407 ?auto_12371 ) ) ( HOIST-AT ?auto_12399 ?auto_12407 ) ( SURFACE-AT ?auto_12361 ?auto_12407 ) ( ON ?auto_12361 ?auto_12397 ) ( CLEAR ?auto_12361 ) ( not ( = ?auto_12360 ?auto_12361 ) ) ( not ( = ?auto_12360 ?auto_12397 ) ) ( not ( = ?auto_12361 ?auto_12397 ) ) ( not ( = ?auto_12376 ?auto_12399 ) ) ( IS-CRATE ?auto_12360 ) ( not ( = ?auto_12393 ?auto_12371 ) ) ( HOIST-AT ?auto_12384 ?auto_12393 ) ( AVAILABLE ?auto_12384 ) ( SURFACE-AT ?auto_12360 ?auto_12393 ) ( ON ?auto_12360 ?auto_12390 ) ( CLEAR ?auto_12360 ) ( not ( = ?auto_12359 ?auto_12360 ) ) ( not ( = ?auto_12359 ?auto_12390 ) ) ( not ( = ?auto_12360 ?auto_12390 ) ) ( not ( = ?auto_12376 ?auto_12384 ) ) ( SURFACE-AT ?auto_12358 ?auto_12371 ) ( CLEAR ?auto_12358 ) ( IS-CRATE ?auto_12359 ) ( AVAILABLE ?auto_12376 ) ( AVAILABLE ?auto_12399 ) ( SURFACE-AT ?auto_12359 ?auto_12407 ) ( ON ?auto_12359 ?auto_12404 ) ( CLEAR ?auto_12359 ) ( TRUCK-AT ?auto_12374 ?auto_12371 ) ( not ( = ?auto_12358 ?auto_12359 ) ) ( not ( = ?auto_12358 ?auto_12404 ) ) ( not ( = ?auto_12359 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12360 ) ) ( not ( = ?auto_12358 ?auto_12390 ) ) ( not ( = ?auto_12360 ?auto_12404 ) ) ( not ( = ?auto_12393 ?auto_12407 ) ) ( not ( = ?auto_12384 ?auto_12399 ) ) ( not ( = ?auto_12390 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12361 ) ) ( not ( = ?auto_12358 ?auto_12397 ) ) ( not ( = ?auto_12359 ?auto_12361 ) ) ( not ( = ?auto_12359 ?auto_12397 ) ) ( not ( = ?auto_12361 ?auto_12390 ) ) ( not ( = ?auto_12361 ?auto_12404 ) ) ( not ( = ?auto_12397 ?auto_12390 ) ) ( not ( = ?auto_12397 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12362 ) ) ( not ( = ?auto_12358 ?auto_12405 ) ) ( not ( = ?auto_12359 ?auto_12362 ) ) ( not ( = ?auto_12359 ?auto_12405 ) ) ( not ( = ?auto_12360 ?auto_12362 ) ) ( not ( = ?auto_12360 ?auto_12405 ) ) ( not ( = ?auto_12362 ?auto_12397 ) ) ( not ( = ?auto_12362 ?auto_12390 ) ) ( not ( = ?auto_12362 ?auto_12404 ) ) ( not ( = ?auto_12387 ?auto_12407 ) ) ( not ( = ?auto_12387 ?auto_12393 ) ) ( not ( = ?auto_12386 ?auto_12399 ) ) ( not ( = ?auto_12386 ?auto_12384 ) ) ( not ( = ?auto_12405 ?auto_12397 ) ) ( not ( = ?auto_12405 ?auto_12390 ) ) ( not ( = ?auto_12405 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12363 ) ) ( not ( = ?auto_12358 ?auto_12381 ) ) ( not ( = ?auto_12359 ?auto_12363 ) ) ( not ( = ?auto_12359 ?auto_12381 ) ) ( not ( = ?auto_12360 ?auto_12363 ) ) ( not ( = ?auto_12360 ?auto_12381 ) ) ( not ( = ?auto_12361 ?auto_12363 ) ) ( not ( = ?auto_12361 ?auto_12381 ) ) ( not ( = ?auto_12363 ?auto_12405 ) ) ( not ( = ?auto_12363 ?auto_12397 ) ) ( not ( = ?auto_12363 ?auto_12390 ) ) ( not ( = ?auto_12363 ?auto_12404 ) ) ( not ( = ?auto_12382 ?auto_12387 ) ) ( not ( = ?auto_12382 ?auto_12407 ) ) ( not ( = ?auto_12382 ?auto_12393 ) ) ( not ( = ?auto_12402 ?auto_12386 ) ) ( not ( = ?auto_12402 ?auto_12399 ) ) ( not ( = ?auto_12402 ?auto_12384 ) ) ( not ( = ?auto_12381 ?auto_12405 ) ) ( not ( = ?auto_12381 ?auto_12397 ) ) ( not ( = ?auto_12381 ?auto_12390 ) ) ( not ( = ?auto_12381 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12364 ) ) ( not ( = ?auto_12358 ?auto_12379 ) ) ( not ( = ?auto_12359 ?auto_12364 ) ) ( not ( = ?auto_12359 ?auto_12379 ) ) ( not ( = ?auto_12360 ?auto_12364 ) ) ( not ( = ?auto_12360 ?auto_12379 ) ) ( not ( = ?auto_12361 ?auto_12364 ) ) ( not ( = ?auto_12361 ?auto_12379 ) ) ( not ( = ?auto_12362 ?auto_12364 ) ) ( not ( = ?auto_12362 ?auto_12379 ) ) ( not ( = ?auto_12364 ?auto_12381 ) ) ( not ( = ?auto_12364 ?auto_12405 ) ) ( not ( = ?auto_12364 ?auto_12397 ) ) ( not ( = ?auto_12364 ?auto_12390 ) ) ( not ( = ?auto_12364 ?auto_12404 ) ) ( not ( = ?auto_12400 ?auto_12382 ) ) ( not ( = ?auto_12400 ?auto_12387 ) ) ( not ( = ?auto_12400 ?auto_12407 ) ) ( not ( = ?auto_12400 ?auto_12393 ) ) ( not ( = ?auto_12378 ?auto_12402 ) ) ( not ( = ?auto_12378 ?auto_12386 ) ) ( not ( = ?auto_12378 ?auto_12399 ) ) ( not ( = ?auto_12378 ?auto_12384 ) ) ( not ( = ?auto_12379 ?auto_12381 ) ) ( not ( = ?auto_12379 ?auto_12405 ) ) ( not ( = ?auto_12379 ?auto_12397 ) ) ( not ( = ?auto_12379 ?auto_12390 ) ) ( not ( = ?auto_12379 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12365 ) ) ( not ( = ?auto_12358 ?auto_12406 ) ) ( not ( = ?auto_12359 ?auto_12365 ) ) ( not ( = ?auto_12359 ?auto_12406 ) ) ( not ( = ?auto_12360 ?auto_12365 ) ) ( not ( = ?auto_12360 ?auto_12406 ) ) ( not ( = ?auto_12361 ?auto_12365 ) ) ( not ( = ?auto_12361 ?auto_12406 ) ) ( not ( = ?auto_12362 ?auto_12365 ) ) ( not ( = ?auto_12362 ?auto_12406 ) ) ( not ( = ?auto_12363 ?auto_12365 ) ) ( not ( = ?auto_12363 ?auto_12406 ) ) ( not ( = ?auto_12365 ?auto_12379 ) ) ( not ( = ?auto_12365 ?auto_12381 ) ) ( not ( = ?auto_12365 ?auto_12405 ) ) ( not ( = ?auto_12365 ?auto_12397 ) ) ( not ( = ?auto_12365 ?auto_12390 ) ) ( not ( = ?auto_12365 ?auto_12404 ) ) ( not ( = ?auto_12380 ?auto_12400 ) ) ( not ( = ?auto_12380 ?auto_12382 ) ) ( not ( = ?auto_12380 ?auto_12387 ) ) ( not ( = ?auto_12380 ?auto_12407 ) ) ( not ( = ?auto_12380 ?auto_12393 ) ) ( not ( = ?auto_12395 ?auto_12378 ) ) ( not ( = ?auto_12395 ?auto_12402 ) ) ( not ( = ?auto_12395 ?auto_12386 ) ) ( not ( = ?auto_12395 ?auto_12399 ) ) ( not ( = ?auto_12395 ?auto_12384 ) ) ( not ( = ?auto_12406 ?auto_12379 ) ) ( not ( = ?auto_12406 ?auto_12381 ) ) ( not ( = ?auto_12406 ?auto_12405 ) ) ( not ( = ?auto_12406 ?auto_12397 ) ) ( not ( = ?auto_12406 ?auto_12390 ) ) ( not ( = ?auto_12406 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12366 ) ) ( not ( = ?auto_12358 ?auto_12396 ) ) ( not ( = ?auto_12359 ?auto_12366 ) ) ( not ( = ?auto_12359 ?auto_12396 ) ) ( not ( = ?auto_12360 ?auto_12366 ) ) ( not ( = ?auto_12360 ?auto_12396 ) ) ( not ( = ?auto_12361 ?auto_12366 ) ) ( not ( = ?auto_12361 ?auto_12396 ) ) ( not ( = ?auto_12362 ?auto_12366 ) ) ( not ( = ?auto_12362 ?auto_12396 ) ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( not ( = ?auto_12363 ?auto_12396 ) ) ( not ( = ?auto_12364 ?auto_12366 ) ) ( not ( = ?auto_12364 ?auto_12396 ) ) ( not ( = ?auto_12366 ?auto_12406 ) ) ( not ( = ?auto_12366 ?auto_12379 ) ) ( not ( = ?auto_12366 ?auto_12381 ) ) ( not ( = ?auto_12366 ?auto_12405 ) ) ( not ( = ?auto_12366 ?auto_12397 ) ) ( not ( = ?auto_12366 ?auto_12390 ) ) ( not ( = ?auto_12366 ?auto_12404 ) ) ( not ( = ?auto_12377 ?auto_12380 ) ) ( not ( = ?auto_12377 ?auto_12400 ) ) ( not ( = ?auto_12377 ?auto_12382 ) ) ( not ( = ?auto_12377 ?auto_12387 ) ) ( not ( = ?auto_12377 ?auto_12407 ) ) ( not ( = ?auto_12377 ?auto_12393 ) ) ( not ( = ?auto_12394 ?auto_12395 ) ) ( not ( = ?auto_12394 ?auto_12378 ) ) ( not ( = ?auto_12394 ?auto_12402 ) ) ( not ( = ?auto_12394 ?auto_12386 ) ) ( not ( = ?auto_12394 ?auto_12399 ) ) ( not ( = ?auto_12394 ?auto_12384 ) ) ( not ( = ?auto_12396 ?auto_12406 ) ) ( not ( = ?auto_12396 ?auto_12379 ) ) ( not ( = ?auto_12396 ?auto_12381 ) ) ( not ( = ?auto_12396 ?auto_12405 ) ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( not ( = ?auto_12396 ?auto_12390 ) ) ( not ( = ?auto_12396 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12367 ) ) ( not ( = ?auto_12358 ?auto_12401 ) ) ( not ( = ?auto_12359 ?auto_12367 ) ) ( not ( = ?auto_12359 ?auto_12401 ) ) ( not ( = ?auto_12360 ?auto_12367 ) ) ( not ( = ?auto_12360 ?auto_12401 ) ) ( not ( = ?auto_12361 ?auto_12367 ) ) ( not ( = ?auto_12361 ?auto_12401 ) ) ( not ( = ?auto_12362 ?auto_12367 ) ) ( not ( = ?auto_12362 ?auto_12401 ) ) ( not ( = ?auto_12363 ?auto_12367 ) ) ( not ( = ?auto_12363 ?auto_12401 ) ) ( not ( = ?auto_12364 ?auto_12367 ) ) ( not ( = ?auto_12364 ?auto_12401 ) ) ( not ( = ?auto_12365 ?auto_12367 ) ) ( not ( = ?auto_12365 ?auto_12401 ) ) ( not ( = ?auto_12367 ?auto_12396 ) ) ( not ( = ?auto_12367 ?auto_12406 ) ) ( not ( = ?auto_12367 ?auto_12379 ) ) ( not ( = ?auto_12367 ?auto_12381 ) ) ( not ( = ?auto_12367 ?auto_12405 ) ) ( not ( = ?auto_12367 ?auto_12397 ) ) ( not ( = ?auto_12367 ?auto_12390 ) ) ( not ( = ?auto_12367 ?auto_12404 ) ) ( not ( = ?auto_12389 ?auto_12377 ) ) ( not ( = ?auto_12389 ?auto_12380 ) ) ( not ( = ?auto_12389 ?auto_12400 ) ) ( not ( = ?auto_12389 ?auto_12382 ) ) ( not ( = ?auto_12389 ?auto_12387 ) ) ( not ( = ?auto_12389 ?auto_12407 ) ) ( not ( = ?auto_12389 ?auto_12393 ) ) ( not ( = ?auto_12391 ?auto_12394 ) ) ( not ( = ?auto_12391 ?auto_12395 ) ) ( not ( = ?auto_12391 ?auto_12378 ) ) ( not ( = ?auto_12391 ?auto_12402 ) ) ( not ( = ?auto_12391 ?auto_12386 ) ) ( not ( = ?auto_12391 ?auto_12399 ) ) ( not ( = ?auto_12391 ?auto_12384 ) ) ( not ( = ?auto_12401 ?auto_12396 ) ) ( not ( = ?auto_12401 ?auto_12406 ) ) ( not ( = ?auto_12401 ?auto_12379 ) ) ( not ( = ?auto_12401 ?auto_12381 ) ) ( not ( = ?auto_12401 ?auto_12405 ) ) ( not ( = ?auto_12401 ?auto_12397 ) ) ( not ( = ?auto_12401 ?auto_12390 ) ) ( not ( = ?auto_12401 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12368 ) ) ( not ( = ?auto_12358 ?auto_12385 ) ) ( not ( = ?auto_12359 ?auto_12368 ) ) ( not ( = ?auto_12359 ?auto_12385 ) ) ( not ( = ?auto_12360 ?auto_12368 ) ) ( not ( = ?auto_12360 ?auto_12385 ) ) ( not ( = ?auto_12361 ?auto_12368 ) ) ( not ( = ?auto_12361 ?auto_12385 ) ) ( not ( = ?auto_12362 ?auto_12368 ) ) ( not ( = ?auto_12362 ?auto_12385 ) ) ( not ( = ?auto_12363 ?auto_12368 ) ) ( not ( = ?auto_12363 ?auto_12385 ) ) ( not ( = ?auto_12364 ?auto_12368 ) ) ( not ( = ?auto_12364 ?auto_12385 ) ) ( not ( = ?auto_12365 ?auto_12368 ) ) ( not ( = ?auto_12365 ?auto_12385 ) ) ( not ( = ?auto_12366 ?auto_12368 ) ) ( not ( = ?auto_12366 ?auto_12385 ) ) ( not ( = ?auto_12368 ?auto_12401 ) ) ( not ( = ?auto_12368 ?auto_12396 ) ) ( not ( = ?auto_12368 ?auto_12406 ) ) ( not ( = ?auto_12368 ?auto_12379 ) ) ( not ( = ?auto_12368 ?auto_12381 ) ) ( not ( = ?auto_12368 ?auto_12405 ) ) ( not ( = ?auto_12368 ?auto_12397 ) ) ( not ( = ?auto_12368 ?auto_12390 ) ) ( not ( = ?auto_12368 ?auto_12404 ) ) ( not ( = ?auto_12383 ?auto_12389 ) ) ( not ( = ?auto_12383 ?auto_12377 ) ) ( not ( = ?auto_12383 ?auto_12380 ) ) ( not ( = ?auto_12383 ?auto_12400 ) ) ( not ( = ?auto_12383 ?auto_12382 ) ) ( not ( = ?auto_12383 ?auto_12387 ) ) ( not ( = ?auto_12383 ?auto_12407 ) ) ( not ( = ?auto_12383 ?auto_12393 ) ) ( not ( = ?auto_12388 ?auto_12391 ) ) ( not ( = ?auto_12388 ?auto_12394 ) ) ( not ( = ?auto_12388 ?auto_12395 ) ) ( not ( = ?auto_12388 ?auto_12378 ) ) ( not ( = ?auto_12388 ?auto_12402 ) ) ( not ( = ?auto_12388 ?auto_12386 ) ) ( not ( = ?auto_12388 ?auto_12399 ) ) ( not ( = ?auto_12388 ?auto_12384 ) ) ( not ( = ?auto_12385 ?auto_12401 ) ) ( not ( = ?auto_12385 ?auto_12396 ) ) ( not ( = ?auto_12385 ?auto_12406 ) ) ( not ( = ?auto_12385 ?auto_12379 ) ) ( not ( = ?auto_12385 ?auto_12381 ) ) ( not ( = ?auto_12385 ?auto_12405 ) ) ( not ( = ?auto_12385 ?auto_12397 ) ) ( not ( = ?auto_12385 ?auto_12390 ) ) ( not ( = ?auto_12385 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12369 ) ) ( not ( = ?auto_12358 ?auto_12392 ) ) ( not ( = ?auto_12359 ?auto_12369 ) ) ( not ( = ?auto_12359 ?auto_12392 ) ) ( not ( = ?auto_12360 ?auto_12369 ) ) ( not ( = ?auto_12360 ?auto_12392 ) ) ( not ( = ?auto_12361 ?auto_12369 ) ) ( not ( = ?auto_12361 ?auto_12392 ) ) ( not ( = ?auto_12362 ?auto_12369 ) ) ( not ( = ?auto_12362 ?auto_12392 ) ) ( not ( = ?auto_12363 ?auto_12369 ) ) ( not ( = ?auto_12363 ?auto_12392 ) ) ( not ( = ?auto_12364 ?auto_12369 ) ) ( not ( = ?auto_12364 ?auto_12392 ) ) ( not ( = ?auto_12365 ?auto_12369 ) ) ( not ( = ?auto_12365 ?auto_12392 ) ) ( not ( = ?auto_12366 ?auto_12369 ) ) ( not ( = ?auto_12366 ?auto_12392 ) ) ( not ( = ?auto_12367 ?auto_12369 ) ) ( not ( = ?auto_12367 ?auto_12392 ) ) ( not ( = ?auto_12369 ?auto_12385 ) ) ( not ( = ?auto_12369 ?auto_12401 ) ) ( not ( = ?auto_12369 ?auto_12396 ) ) ( not ( = ?auto_12369 ?auto_12406 ) ) ( not ( = ?auto_12369 ?auto_12379 ) ) ( not ( = ?auto_12369 ?auto_12381 ) ) ( not ( = ?auto_12369 ?auto_12405 ) ) ( not ( = ?auto_12369 ?auto_12397 ) ) ( not ( = ?auto_12369 ?auto_12390 ) ) ( not ( = ?auto_12369 ?auto_12404 ) ) ( not ( = ?auto_12403 ?auto_12383 ) ) ( not ( = ?auto_12403 ?auto_12389 ) ) ( not ( = ?auto_12403 ?auto_12377 ) ) ( not ( = ?auto_12403 ?auto_12380 ) ) ( not ( = ?auto_12403 ?auto_12400 ) ) ( not ( = ?auto_12403 ?auto_12382 ) ) ( not ( = ?auto_12403 ?auto_12387 ) ) ( not ( = ?auto_12403 ?auto_12407 ) ) ( not ( = ?auto_12403 ?auto_12393 ) ) ( not ( = ?auto_12398 ?auto_12388 ) ) ( not ( = ?auto_12398 ?auto_12391 ) ) ( not ( = ?auto_12398 ?auto_12394 ) ) ( not ( = ?auto_12398 ?auto_12395 ) ) ( not ( = ?auto_12398 ?auto_12378 ) ) ( not ( = ?auto_12398 ?auto_12402 ) ) ( not ( = ?auto_12398 ?auto_12386 ) ) ( not ( = ?auto_12398 ?auto_12399 ) ) ( not ( = ?auto_12398 ?auto_12384 ) ) ( not ( = ?auto_12392 ?auto_12385 ) ) ( not ( = ?auto_12392 ?auto_12401 ) ) ( not ( = ?auto_12392 ?auto_12396 ) ) ( not ( = ?auto_12392 ?auto_12406 ) ) ( not ( = ?auto_12392 ?auto_12379 ) ) ( not ( = ?auto_12392 ?auto_12381 ) ) ( not ( = ?auto_12392 ?auto_12405 ) ) ( not ( = ?auto_12392 ?auto_12397 ) ) ( not ( = ?auto_12392 ?auto_12390 ) ) ( not ( = ?auto_12392 ?auto_12404 ) ) ( not ( = ?auto_12358 ?auto_12370 ) ) ( not ( = ?auto_12358 ?auto_12372 ) ) ( not ( = ?auto_12359 ?auto_12370 ) ) ( not ( = ?auto_12359 ?auto_12372 ) ) ( not ( = ?auto_12360 ?auto_12370 ) ) ( not ( = ?auto_12360 ?auto_12372 ) ) ( not ( = ?auto_12361 ?auto_12370 ) ) ( not ( = ?auto_12361 ?auto_12372 ) ) ( not ( = ?auto_12362 ?auto_12370 ) ) ( not ( = ?auto_12362 ?auto_12372 ) ) ( not ( = ?auto_12363 ?auto_12370 ) ) ( not ( = ?auto_12363 ?auto_12372 ) ) ( not ( = ?auto_12364 ?auto_12370 ) ) ( not ( = ?auto_12364 ?auto_12372 ) ) ( not ( = ?auto_12365 ?auto_12370 ) ) ( not ( = ?auto_12365 ?auto_12372 ) ) ( not ( = ?auto_12366 ?auto_12370 ) ) ( not ( = ?auto_12366 ?auto_12372 ) ) ( not ( = ?auto_12367 ?auto_12370 ) ) ( not ( = ?auto_12367 ?auto_12372 ) ) ( not ( = ?auto_12368 ?auto_12370 ) ) ( not ( = ?auto_12368 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12392 ) ) ( not ( = ?auto_12370 ?auto_12385 ) ) ( not ( = ?auto_12370 ?auto_12401 ) ) ( not ( = ?auto_12370 ?auto_12396 ) ) ( not ( = ?auto_12370 ?auto_12406 ) ) ( not ( = ?auto_12370 ?auto_12379 ) ) ( not ( = ?auto_12370 ?auto_12381 ) ) ( not ( = ?auto_12370 ?auto_12405 ) ) ( not ( = ?auto_12370 ?auto_12397 ) ) ( not ( = ?auto_12370 ?auto_12390 ) ) ( not ( = ?auto_12370 ?auto_12404 ) ) ( not ( = ?auto_12375 ?auto_12403 ) ) ( not ( = ?auto_12375 ?auto_12383 ) ) ( not ( = ?auto_12375 ?auto_12389 ) ) ( not ( = ?auto_12375 ?auto_12377 ) ) ( not ( = ?auto_12375 ?auto_12380 ) ) ( not ( = ?auto_12375 ?auto_12400 ) ) ( not ( = ?auto_12375 ?auto_12382 ) ) ( not ( = ?auto_12375 ?auto_12387 ) ) ( not ( = ?auto_12375 ?auto_12407 ) ) ( not ( = ?auto_12375 ?auto_12393 ) ) ( not ( = ?auto_12373 ?auto_12398 ) ) ( not ( = ?auto_12373 ?auto_12388 ) ) ( not ( = ?auto_12373 ?auto_12391 ) ) ( not ( = ?auto_12373 ?auto_12394 ) ) ( not ( = ?auto_12373 ?auto_12395 ) ) ( not ( = ?auto_12373 ?auto_12378 ) ) ( not ( = ?auto_12373 ?auto_12402 ) ) ( not ( = ?auto_12373 ?auto_12386 ) ) ( not ( = ?auto_12373 ?auto_12399 ) ) ( not ( = ?auto_12373 ?auto_12384 ) ) ( not ( = ?auto_12372 ?auto_12392 ) ) ( not ( = ?auto_12372 ?auto_12385 ) ) ( not ( = ?auto_12372 ?auto_12401 ) ) ( not ( = ?auto_12372 ?auto_12396 ) ) ( not ( = ?auto_12372 ?auto_12406 ) ) ( not ( = ?auto_12372 ?auto_12379 ) ) ( not ( = ?auto_12372 ?auto_12381 ) ) ( not ( = ?auto_12372 ?auto_12405 ) ) ( not ( = ?auto_12372 ?auto_12397 ) ) ( not ( = ?auto_12372 ?auto_12390 ) ) ( not ( = ?auto_12372 ?auto_12404 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12358 ?auto_12359 ?auto_12360 ?auto_12361 ?auto_12362 ?auto_12363 ?auto_12364 ?auto_12365 ?auto_12366 ?auto_12367 ?auto_12368 ?auto_12369 )
      ( MAKE-1CRATE ?auto_12369 ?auto_12370 )
      ( MAKE-12CRATE-VERIFY ?auto_12358 ?auto_12359 ?auto_12360 ?auto_12361 ?auto_12362 ?auto_12363 ?auto_12364 ?auto_12365 ?auto_12366 ?auto_12367 ?auto_12368 ?auto_12369 ?auto_12370 ) )
  )

)

