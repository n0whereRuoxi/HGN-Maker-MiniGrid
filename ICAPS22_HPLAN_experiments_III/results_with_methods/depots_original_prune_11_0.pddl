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
      ?auto_402855 - SURFACE
      ?auto_402856 - SURFACE
    )
    :vars
    (
      ?auto_402857 - HOIST
      ?auto_402858 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402857 ?auto_402858 ) ( SURFACE-AT ?auto_402855 ?auto_402858 ) ( CLEAR ?auto_402855 ) ( LIFTING ?auto_402857 ?auto_402856 ) ( IS-CRATE ?auto_402856 ) ( not ( = ?auto_402855 ?auto_402856 ) ) )
    :subtasks
    ( ( !DROP ?auto_402857 ?auto_402856 ?auto_402855 ?auto_402858 )
      ( MAKE-1CRATE-VERIFY ?auto_402855 ?auto_402856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402859 - SURFACE
      ?auto_402860 - SURFACE
    )
    :vars
    (
      ?auto_402862 - HOIST
      ?auto_402861 - PLACE
      ?auto_402863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402862 ?auto_402861 ) ( SURFACE-AT ?auto_402859 ?auto_402861 ) ( CLEAR ?auto_402859 ) ( IS-CRATE ?auto_402860 ) ( not ( = ?auto_402859 ?auto_402860 ) ) ( TRUCK-AT ?auto_402863 ?auto_402861 ) ( AVAILABLE ?auto_402862 ) ( IN ?auto_402860 ?auto_402863 ) )
    :subtasks
    ( ( !UNLOAD ?auto_402862 ?auto_402860 ?auto_402863 ?auto_402861 )
      ( MAKE-1CRATE ?auto_402859 ?auto_402860 )
      ( MAKE-1CRATE-VERIFY ?auto_402859 ?auto_402860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402864 - SURFACE
      ?auto_402865 - SURFACE
    )
    :vars
    (
      ?auto_402868 - HOIST
      ?auto_402867 - PLACE
      ?auto_402866 - TRUCK
      ?auto_402869 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402868 ?auto_402867 ) ( SURFACE-AT ?auto_402864 ?auto_402867 ) ( CLEAR ?auto_402864 ) ( IS-CRATE ?auto_402865 ) ( not ( = ?auto_402864 ?auto_402865 ) ) ( AVAILABLE ?auto_402868 ) ( IN ?auto_402865 ?auto_402866 ) ( TRUCK-AT ?auto_402866 ?auto_402869 ) ( not ( = ?auto_402869 ?auto_402867 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_402866 ?auto_402869 ?auto_402867 )
      ( MAKE-1CRATE ?auto_402864 ?auto_402865 )
      ( MAKE-1CRATE-VERIFY ?auto_402864 ?auto_402865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402870 - SURFACE
      ?auto_402871 - SURFACE
    )
    :vars
    (
      ?auto_402875 - HOIST
      ?auto_402874 - PLACE
      ?auto_402872 - TRUCK
      ?auto_402873 - PLACE
      ?auto_402876 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_402875 ?auto_402874 ) ( SURFACE-AT ?auto_402870 ?auto_402874 ) ( CLEAR ?auto_402870 ) ( IS-CRATE ?auto_402871 ) ( not ( = ?auto_402870 ?auto_402871 ) ) ( AVAILABLE ?auto_402875 ) ( TRUCK-AT ?auto_402872 ?auto_402873 ) ( not ( = ?auto_402873 ?auto_402874 ) ) ( HOIST-AT ?auto_402876 ?auto_402873 ) ( LIFTING ?auto_402876 ?auto_402871 ) ( not ( = ?auto_402875 ?auto_402876 ) ) )
    :subtasks
    ( ( !LOAD ?auto_402876 ?auto_402871 ?auto_402872 ?auto_402873 )
      ( MAKE-1CRATE ?auto_402870 ?auto_402871 )
      ( MAKE-1CRATE-VERIFY ?auto_402870 ?auto_402871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402877 - SURFACE
      ?auto_402878 - SURFACE
    )
    :vars
    (
      ?auto_402880 - HOIST
      ?auto_402879 - PLACE
      ?auto_402882 - TRUCK
      ?auto_402881 - PLACE
      ?auto_402883 - HOIST
      ?auto_402884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402880 ?auto_402879 ) ( SURFACE-AT ?auto_402877 ?auto_402879 ) ( CLEAR ?auto_402877 ) ( IS-CRATE ?auto_402878 ) ( not ( = ?auto_402877 ?auto_402878 ) ) ( AVAILABLE ?auto_402880 ) ( TRUCK-AT ?auto_402882 ?auto_402881 ) ( not ( = ?auto_402881 ?auto_402879 ) ) ( HOIST-AT ?auto_402883 ?auto_402881 ) ( not ( = ?auto_402880 ?auto_402883 ) ) ( AVAILABLE ?auto_402883 ) ( SURFACE-AT ?auto_402878 ?auto_402881 ) ( ON ?auto_402878 ?auto_402884 ) ( CLEAR ?auto_402878 ) ( not ( = ?auto_402877 ?auto_402884 ) ) ( not ( = ?auto_402878 ?auto_402884 ) ) )
    :subtasks
    ( ( !LIFT ?auto_402883 ?auto_402878 ?auto_402884 ?auto_402881 )
      ( MAKE-1CRATE ?auto_402877 ?auto_402878 )
      ( MAKE-1CRATE-VERIFY ?auto_402877 ?auto_402878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402885 - SURFACE
      ?auto_402886 - SURFACE
    )
    :vars
    (
      ?auto_402889 - HOIST
      ?auto_402892 - PLACE
      ?auto_402887 - PLACE
      ?auto_402891 - HOIST
      ?auto_402888 - SURFACE
      ?auto_402890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402889 ?auto_402892 ) ( SURFACE-AT ?auto_402885 ?auto_402892 ) ( CLEAR ?auto_402885 ) ( IS-CRATE ?auto_402886 ) ( not ( = ?auto_402885 ?auto_402886 ) ) ( AVAILABLE ?auto_402889 ) ( not ( = ?auto_402887 ?auto_402892 ) ) ( HOIST-AT ?auto_402891 ?auto_402887 ) ( not ( = ?auto_402889 ?auto_402891 ) ) ( AVAILABLE ?auto_402891 ) ( SURFACE-AT ?auto_402886 ?auto_402887 ) ( ON ?auto_402886 ?auto_402888 ) ( CLEAR ?auto_402886 ) ( not ( = ?auto_402885 ?auto_402888 ) ) ( not ( = ?auto_402886 ?auto_402888 ) ) ( TRUCK-AT ?auto_402890 ?auto_402892 ) )
    :subtasks
    ( ( !DRIVE ?auto_402890 ?auto_402892 ?auto_402887 )
      ( MAKE-1CRATE ?auto_402885 ?auto_402886 )
      ( MAKE-1CRATE-VERIFY ?auto_402885 ?auto_402886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402902 - SURFACE
      ?auto_402903 - SURFACE
      ?auto_402904 - SURFACE
    )
    :vars
    (
      ?auto_402905 - HOIST
      ?auto_402906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402905 ?auto_402906 ) ( SURFACE-AT ?auto_402903 ?auto_402906 ) ( CLEAR ?auto_402903 ) ( LIFTING ?auto_402905 ?auto_402904 ) ( IS-CRATE ?auto_402904 ) ( not ( = ?auto_402903 ?auto_402904 ) ) ( ON ?auto_402903 ?auto_402902 ) ( not ( = ?auto_402902 ?auto_402903 ) ) ( not ( = ?auto_402902 ?auto_402904 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402903 ?auto_402904 )
      ( MAKE-2CRATE-VERIFY ?auto_402902 ?auto_402903 ?auto_402904 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402912 - SURFACE
      ?auto_402913 - SURFACE
      ?auto_402914 - SURFACE
    )
    :vars
    (
      ?auto_402915 - HOIST
      ?auto_402917 - PLACE
      ?auto_402916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402915 ?auto_402917 ) ( SURFACE-AT ?auto_402913 ?auto_402917 ) ( CLEAR ?auto_402913 ) ( IS-CRATE ?auto_402914 ) ( not ( = ?auto_402913 ?auto_402914 ) ) ( TRUCK-AT ?auto_402916 ?auto_402917 ) ( AVAILABLE ?auto_402915 ) ( IN ?auto_402914 ?auto_402916 ) ( ON ?auto_402913 ?auto_402912 ) ( not ( = ?auto_402912 ?auto_402913 ) ) ( not ( = ?auto_402912 ?auto_402914 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402913 ?auto_402914 )
      ( MAKE-2CRATE-VERIFY ?auto_402912 ?auto_402913 ?auto_402914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402918 - SURFACE
      ?auto_402919 - SURFACE
    )
    :vars
    (
      ?auto_402923 - HOIST
      ?auto_402922 - PLACE
      ?auto_402921 - TRUCK
      ?auto_402920 - SURFACE
      ?auto_402924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402923 ?auto_402922 ) ( SURFACE-AT ?auto_402918 ?auto_402922 ) ( CLEAR ?auto_402918 ) ( IS-CRATE ?auto_402919 ) ( not ( = ?auto_402918 ?auto_402919 ) ) ( AVAILABLE ?auto_402923 ) ( IN ?auto_402919 ?auto_402921 ) ( ON ?auto_402918 ?auto_402920 ) ( not ( = ?auto_402920 ?auto_402918 ) ) ( not ( = ?auto_402920 ?auto_402919 ) ) ( TRUCK-AT ?auto_402921 ?auto_402924 ) ( not ( = ?auto_402924 ?auto_402922 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_402921 ?auto_402924 ?auto_402922 )
      ( MAKE-2CRATE ?auto_402920 ?auto_402918 ?auto_402919 )
      ( MAKE-1CRATE-VERIFY ?auto_402918 ?auto_402919 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402925 - SURFACE
      ?auto_402926 - SURFACE
      ?auto_402927 - SURFACE
    )
    :vars
    (
      ?auto_402930 - HOIST
      ?auto_402928 - PLACE
      ?auto_402931 - TRUCK
      ?auto_402929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402930 ?auto_402928 ) ( SURFACE-AT ?auto_402926 ?auto_402928 ) ( CLEAR ?auto_402926 ) ( IS-CRATE ?auto_402927 ) ( not ( = ?auto_402926 ?auto_402927 ) ) ( AVAILABLE ?auto_402930 ) ( IN ?auto_402927 ?auto_402931 ) ( ON ?auto_402926 ?auto_402925 ) ( not ( = ?auto_402925 ?auto_402926 ) ) ( not ( = ?auto_402925 ?auto_402927 ) ) ( TRUCK-AT ?auto_402931 ?auto_402929 ) ( not ( = ?auto_402929 ?auto_402928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402926 ?auto_402927 )
      ( MAKE-2CRATE-VERIFY ?auto_402925 ?auto_402926 ?auto_402927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402932 - SURFACE
      ?auto_402933 - SURFACE
    )
    :vars
    (
      ?auto_402935 - HOIST
      ?auto_402934 - PLACE
      ?auto_402936 - SURFACE
      ?auto_402938 - TRUCK
      ?auto_402937 - PLACE
      ?auto_402939 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_402935 ?auto_402934 ) ( SURFACE-AT ?auto_402932 ?auto_402934 ) ( CLEAR ?auto_402932 ) ( IS-CRATE ?auto_402933 ) ( not ( = ?auto_402932 ?auto_402933 ) ) ( AVAILABLE ?auto_402935 ) ( ON ?auto_402932 ?auto_402936 ) ( not ( = ?auto_402936 ?auto_402932 ) ) ( not ( = ?auto_402936 ?auto_402933 ) ) ( TRUCK-AT ?auto_402938 ?auto_402937 ) ( not ( = ?auto_402937 ?auto_402934 ) ) ( HOIST-AT ?auto_402939 ?auto_402937 ) ( LIFTING ?auto_402939 ?auto_402933 ) ( not ( = ?auto_402935 ?auto_402939 ) ) )
    :subtasks
    ( ( !LOAD ?auto_402939 ?auto_402933 ?auto_402938 ?auto_402937 )
      ( MAKE-2CRATE ?auto_402936 ?auto_402932 ?auto_402933 )
      ( MAKE-1CRATE-VERIFY ?auto_402932 ?auto_402933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402940 - SURFACE
      ?auto_402941 - SURFACE
      ?auto_402942 - SURFACE
    )
    :vars
    (
      ?auto_402946 - HOIST
      ?auto_402944 - PLACE
      ?auto_402943 - TRUCK
      ?auto_402947 - PLACE
      ?auto_402945 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_402946 ?auto_402944 ) ( SURFACE-AT ?auto_402941 ?auto_402944 ) ( CLEAR ?auto_402941 ) ( IS-CRATE ?auto_402942 ) ( not ( = ?auto_402941 ?auto_402942 ) ) ( AVAILABLE ?auto_402946 ) ( ON ?auto_402941 ?auto_402940 ) ( not ( = ?auto_402940 ?auto_402941 ) ) ( not ( = ?auto_402940 ?auto_402942 ) ) ( TRUCK-AT ?auto_402943 ?auto_402947 ) ( not ( = ?auto_402947 ?auto_402944 ) ) ( HOIST-AT ?auto_402945 ?auto_402947 ) ( LIFTING ?auto_402945 ?auto_402942 ) ( not ( = ?auto_402946 ?auto_402945 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402941 ?auto_402942 )
      ( MAKE-2CRATE-VERIFY ?auto_402940 ?auto_402941 ?auto_402942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402948 - SURFACE
      ?auto_402949 - SURFACE
    )
    :vars
    (
      ?auto_402950 - HOIST
      ?auto_402953 - PLACE
      ?auto_402951 - SURFACE
      ?auto_402952 - TRUCK
      ?auto_402954 - PLACE
      ?auto_402955 - HOIST
      ?auto_402956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402950 ?auto_402953 ) ( SURFACE-AT ?auto_402948 ?auto_402953 ) ( CLEAR ?auto_402948 ) ( IS-CRATE ?auto_402949 ) ( not ( = ?auto_402948 ?auto_402949 ) ) ( AVAILABLE ?auto_402950 ) ( ON ?auto_402948 ?auto_402951 ) ( not ( = ?auto_402951 ?auto_402948 ) ) ( not ( = ?auto_402951 ?auto_402949 ) ) ( TRUCK-AT ?auto_402952 ?auto_402954 ) ( not ( = ?auto_402954 ?auto_402953 ) ) ( HOIST-AT ?auto_402955 ?auto_402954 ) ( not ( = ?auto_402950 ?auto_402955 ) ) ( AVAILABLE ?auto_402955 ) ( SURFACE-AT ?auto_402949 ?auto_402954 ) ( ON ?auto_402949 ?auto_402956 ) ( CLEAR ?auto_402949 ) ( not ( = ?auto_402948 ?auto_402956 ) ) ( not ( = ?auto_402949 ?auto_402956 ) ) ( not ( = ?auto_402951 ?auto_402956 ) ) )
    :subtasks
    ( ( !LIFT ?auto_402955 ?auto_402949 ?auto_402956 ?auto_402954 )
      ( MAKE-2CRATE ?auto_402951 ?auto_402948 ?auto_402949 )
      ( MAKE-1CRATE-VERIFY ?auto_402948 ?auto_402949 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402957 - SURFACE
      ?auto_402958 - SURFACE
      ?auto_402959 - SURFACE
    )
    :vars
    (
      ?auto_402965 - HOIST
      ?auto_402963 - PLACE
      ?auto_402962 - TRUCK
      ?auto_402964 - PLACE
      ?auto_402960 - HOIST
      ?auto_402961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402965 ?auto_402963 ) ( SURFACE-AT ?auto_402958 ?auto_402963 ) ( CLEAR ?auto_402958 ) ( IS-CRATE ?auto_402959 ) ( not ( = ?auto_402958 ?auto_402959 ) ) ( AVAILABLE ?auto_402965 ) ( ON ?auto_402958 ?auto_402957 ) ( not ( = ?auto_402957 ?auto_402958 ) ) ( not ( = ?auto_402957 ?auto_402959 ) ) ( TRUCK-AT ?auto_402962 ?auto_402964 ) ( not ( = ?auto_402964 ?auto_402963 ) ) ( HOIST-AT ?auto_402960 ?auto_402964 ) ( not ( = ?auto_402965 ?auto_402960 ) ) ( AVAILABLE ?auto_402960 ) ( SURFACE-AT ?auto_402959 ?auto_402964 ) ( ON ?auto_402959 ?auto_402961 ) ( CLEAR ?auto_402959 ) ( not ( = ?auto_402958 ?auto_402961 ) ) ( not ( = ?auto_402959 ?auto_402961 ) ) ( not ( = ?auto_402957 ?auto_402961 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402958 ?auto_402959 )
      ( MAKE-2CRATE-VERIFY ?auto_402957 ?auto_402958 ?auto_402959 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402966 - SURFACE
      ?auto_402967 - SURFACE
    )
    :vars
    (
      ?auto_402968 - HOIST
      ?auto_402973 - PLACE
      ?auto_402971 - SURFACE
      ?auto_402969 - PLACE
      ?auto_402970 - HOIST
      ?auto_402972 - SURFACE
      ?auto_402974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402968 ?auto_402973 ) ( SURFACE-AT ?auto_402966 ?auto_402973 ) ( CLEAR ?auto_402966 ) ( IS-CRATE ?auto_402967 ) ( not ( = ?auto_402966 ?auto_402967 ) ) ( AVAILABLE ?auto_402968 ) ( ON ?auto_402966 ?auto_402971 ) ( not ( = ?auto_402971 ?auto_402966 ) ) ( not ( = ?auto_402971 ?auto_402967 ) ) ( not ( = ?auto_402969 ?auto_402973 ) ) ( HOIST-AT ?auto_402970 ?auto_402969 ) ( not ( = ?auto_402968 ?auto_402970 ) ) ( AVAILABLE ?auto_402970 ) ( SURFACE-AT ?auto_402967 ?auto_402969 ) ( ON ?auto_402967 ?auto_402972 ) ( CLEAR ?auto_402967 ) ( not ( = ?auto_402966 ?auto_402972 ) ) ( not ( = ?auto_402967 ?auto_402972 ) ) ( not ( = ?auto_402971 ?auto_402972 ) ) ( TRUCK-AT ?auto_402974 ?auto_402973 ) )
    :subtasks
    ( ( !DRIVE ?auto_402974 ?auto_402973 ?auto_402969 )
      ( MAKE-2CRATE ?auto_402971 ?auto_402966 ?auto_402967 )
      ( MAKE-1CRATE-VERIFY ?auto_402966 ?auto_402967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402975 - SURFACE
      ?auto_402976 - SURFACE
      ?auto_402977 - SURFACE
    )
    :vars
    (
      ?auto_402983 - HOIST
      ?auto_402979 - PLACE
      ?auto_402982 - PLACE
      ?auto_402980 - HOIST
      ?auto_402981 - SURFACE
      ?auto_402978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402983 ?auto_402979 ) ( SURFACE-AT ?auto_402976 ?auto_402979 ) ( CLEAR ?auto_402976 ) ( IS-CRATE ?auto_402977 ) ( not ( = ?auto_402976 ?auto_402977 ) ) ( AVAILABLE ?auto_402983 ) ( ON ?auto_402976 ?auto_402975 ) ( not ( = ?auto_402975 ?auto_402976 ) ) ( not ( = ?auto_402975 ?auto_402977 ) ) ( not ( = ?auto_402982 ?auto_402979 ) ) ( HOIST-AT ?auto_402980 ?auto_402982 ) ( not ( = ?auto_402983 ?auto_402980 ) ) ( AVAILABLE ?auto_402980 ) ( SURFACE-AT ?auto_402977 ?auto_402982 ) ( ON ?auto_402977 ?auto_402981 ) ( CLEAR ?auto_402977 ) ( not ( = ?auto_402976 ?auto_402981 ) ) ( not ( = ?auto_402977 ?auto_402981 ) ) ( not ( = ?auto_402975 ?auto_402981 ) ) ( TRUCK-AT ?auto_402978 ?auto_402979 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402976 ?auto_402977 )
      ( MAKE-2CRATE-VERIFY ?auto_402975 ?auto_402976 ?auto_402977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_402984 - SURFACE
      ?auto_402985 - SURFACE
    )
    :vars
    (
      ?auto_402986 - HOIST
      ?auto_402992 - PLACE
      ?auto_402991 - SURFACE
      ?auto_402987 - PLACE
      ?auto_402990 - HOIST
      ?auto_402989 - SURFACE
      ?auto_402988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_402986 ?auto_402992 ) ( IS-CRATE ?auto_402985 ) ( not ( = ?auto_402984 ?auto_402985 ) ) ( not ( = ?auto_402991 ?auto_402984 ) ) ( not ( = ?auto_402991 ?auto_402985 ) ) ( not ( = ?auto_402987 ?auto_402992 ) ) ( HOIST-AT ?auto_402990 ?auto_402987 ) ( not ( = ?auto_402986 ?auto_402990 ) ) ( AVAILABLE ?auto_402990 ) ( SURFACE-AT ?auto_402985 ?auto_402987 ) ( ON ?auto_402985 ?auto_402989 ) ( CLEAR ?auto_402985 ) ( not ( = ?auto_402984 ?auto_402989 ) ) ( not ( = ?auto_402985 ?auto_402989 ) ) ( not ( = ?auto_402991 ?auto_402989 ) ) ( TRUCK-AT ?auto_402988 ?auto_402992 ) ( SURFACE-AT ?auto_402991 ?auto_402992 ) ( CLEAR ?auto_402991 ) ( LIFTING ?auto_402986 ?auto_402984 ) ( IS-CRATE ?auto_402984 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402991 ?auto_402984 )
      ( MAKE-2CRATE ?auto_402991 ?auto_402984 ?auto_402985 )
      ( MAKE-1CRATE-VERIFY ?auto_402984 ?auto_402985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_402993 - SURFACE
      ?auto_402994 - SURFACE
      ?auto_402995 - SURFACE
    )
    :vars
    (
      ?auto_403000 - HOIST
      ?auto_402998 - PLACE
      ?auto_402999 - PLACE
      ?auto_402997 - HOIST
      ?auto_402996 - SURFACE
      ?auto_403001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403000 ?auto_402998 ) ( IS-CRATE ?auto_402995 ) ( not ( = ?auto_402994 ?auto_402995 ) ) ( not ( = ?auto_402993 ?auto_402994 ) ) ( not ( = ?auto_402993 ?auto_402995 ) ) ( not ( = ?auto_402999 ?auto_402998 ) ) ( HOIST-AT ?auto_402997 ?auto_402999 ) ( not ( = ?auto_403000 ?auto_402997 ) ) ( AVAILABLE ?auto_402997 ) ( SURFACE-AT ?auto_402995 ?auto_402999 ) ( ON ?auto_402995 ?auto_402996 ) ( CLEAR ?auto_402995 ) ( not ( = ?auto_402994 ?auto_402996 ) ) ( not ( = ?auto_402995 ?auto_402996 ) ) ( not ( = ?auto_402993 ?auto_402996 ) ) ( TRUCK-AT ?auto_403001 ?auto_402998 ) ( SURFACE-AT ?auto_402993 ?auto_402998 ) ( CLEAR ?auto_402993 ) ( LIFTING ?auto_403000 ?auto_402994 ) ( IS-CRATE ?auto_402994 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_402994 ?auto_402995 )
      ( MAKE-2CRATE-VERIFY ?auto_402993 ?auto_402994 ?auto_402995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403002 - SURFACE
      ?auto_403003 - SURFACE
    )
    :vars
    (
      ?auto_403008 - HOIST
      ?auto_403004 - PLACE
      ?auto_403007 - SURFACE
      ?auto_403009 - PLACE
      ?auto_403006 - HOIST
      ?auto_403010 - SURFACE
      ?auto_403005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403008 ?auto_403004 ) ( IS-CRATE ?auto_403003 ) ( not ( = ?auto_403002 ?auto_403003 ) ) ( not ( = ?auto_403007 ?auto_403002 ) ) ( not ( = ?auto_403007 ?auto_403003 ) ) ( not ( = ?auto_403009 ?auto_403004 ) ) ( HOIST-AT ?auto_403006 ?auto_403009 ) ( not ( = ?auto_403008 ?auto_403006 ) ) ( AVAILABLE ?auto_403006 ) ( SURFACE-AT ?auto_403003 ?auto_403009 ) ( ON ?auto_403003 ?auto_403010 ) ( CLEAR ?auto_403003 ) ( not ( = ?auto_403002 ?auto_403010 ) ) ( not ( = ?auto_403003 ?auto_403010 ) ) ( not ( = ?auto_403007 ?auto_403010 ) ) ( TRUCK-AT ?auto_403005 ?auto_403004 ) ( SURFACE-AT ?auto_403007 ?auto_403004 ) ( CLEAR ?auto_403007 ) ( IS-CRATE ?auto_403002 ) ( AVAILABLE ?auto_403008 ) ( IN ?auto_403002 ?auto_403005 ) )
    :subtasks
    ( ( !UNLOAD ?auto_403008 ?auto_403002 ?auto_403005 ?auto_403004 )
      ( MAKE-2CRATE ?auto_403007 ?auto_403002 ?auto_403003 )
      ( MAKE-1CRATE-VERIFY ?auto_403002 ?auto_403003 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_403011 - SURFACE
      ?auto_403012 - SURFACE
      ?auto_403013 - SURFACE
    )
    :vars
    (
      ?auto_403015 - HOIST
      ?auto_403018 - PLACE
      ?auto_403016 - PLACE
      ?auto_403017 - HOIST
      ?auto_403014 - SURFACE
      ?auto_403019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403015 ?auto_403018 ) ( IS-CRATE ?auto_403013 ) ( not ( = ?auto_403012 ?auto_403013 ) ) ( not ( = ?auto_403011 ?auto_403012 ) ) ( not ( = ?auto_403011 ?auto_403013 ) ) ( not ( = ?auto_403016 ?auto_403018 ) ) ( HOIST-AT ?auto_403017 ?auto_403016 ) ( not ( = ?auto_403015 ?auto_403017 ) ) ( AVAILABLE ?auto_403017 ) ( SURFACE-AT ?auto_403013 ?auto_403016 ) ( ON ?auto_403013 ?auto_403014 ) ( CLEAR ?auto_403013 ) ( not ( = ?auto_403012 ?auto_403014 ) ) ( not ( = ?auto_403013 ?auto_403014 ) ) ( not ( = ?auto_403011 ?auto_403014 ) ) ( TRUCK-AT ?auto_403019 ?auto_403018 ) ( SURFACE-AT ?auto_403011 ?auto_403018 ) ( CLEAR ?auto_403011 ) ( IS-CRATE ?auto_403012 ) ( AVAILABLE ?auto_403015 ) ( IN ?auto_403012 ?auto_403019 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403012 ?auto_403013 )
      ( MAKE-2CRATE-VERIFY ?auto_403011 ?auto_403012 ?auto_403013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_403056 - SURFACE
      ?auto_403057 - SURFACE
    )
    :vars
    (
      ?auto_403064 - HOIST
      ?auto_403061 - PLACE
      ?auto_403059 - SURFACE
      ?auto_403058 - PLACE
      ?auto_403062 - HOIST
      ?auto_403060 - SURFACE
      ?auto_403063 - TRUCK
      ?auto_403065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403064 ?auto_403061 ) ( SURFACE-AT ?auto_403056 ?auto_403061 ) ( CLEAR ?auto_403056 ) ( IS-CRATE ?auto_403057 ) ( not ( = ?auto_403056 ?auto_403057 ) ) ( AVAILABLE ?auto_403064 ) ( ON ?auto_403056 ?auto_403059 ) ( not ( = ?auto_403059 ?auto_403056 ) ) ( not ( = ?auto_403059 ?auto_403057 ) ) ( not ( = ?auto_403058 ?auto_403061 ) ) ( HOIST-AT ?auto_403062 ?auto_403058 ) ( not ( = ?auto_403064 ?auto_403062 ) ) ( AVAILABLE ?auto_403062 ) ( SURFACE-AT ?auto_403057 ?auto_403058 ) ( ON ?auto_403057 ?auto_403060 ) ( CLEAR ?auto_403057 ) ( not ( = ?auto_403056 ?auto_403060 ) ) ( not ( = ?auto_403057 ?auto_403060 ) ) ( not ( = ?auto_403059 ?auto_403060 ) ) ( TRUCK-AT ?auto_403063 ?auto_403065 ) ( not ( = ?auto_403065 ?auto_403061 ) ) ( not ( = ?auto_403058 ?auto_403065 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_403063 ?auto_403065 ?auto_403061 )
      ( MAKE-1CRATE ?auto_403056 ?auto_403057 )
      ( MAKE-1CRATE-VERIFY ?auto_403056 ?auto_403057 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403095 - SURFACE
      ?auto_403096 - SURFACE
      ?auto_403097 - SURFACE
      ?auto_403098 - SURFACE
    )
    :vars
    (
      ?auto_403099 - HOIST
      ?auto_403100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403099 ?auto_403100 ) ( SURFACE-AT ?auto_403097 ?auto_403100 ) ( CLEAR ?auto_403097 ) ( LIFTING ?auto_403099 ?auto_403098 ) ( IS-CRATE ?auto_403098 ) ( not ( = ?auto_403097 ?auto_403098 ) ) ( ON ?auto_403096 ?auto_403095 ) ( ON ?auto_403097 ?auto_403096 ) ( not ( = ?auto_403095 ?auto_403096 ) ) ( not ( = ?auto_403095 ?auto_403097 ) ) ( not ( = ?auto_403095 ?auto_403098 ) ) ( not ( = ?auto_403096 ?auto_403097 ) ) ( not ( = ?auto_403096 ?auto_403098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403097 ?auto_403098 )
      ( MAKE-3CRATE-VERIFY ?auto_403095 ?auto_403096 ?auto_403097 ?auto_403098 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403112 - SURFACE
      ?auto_403113 - SURFACE
      ?auto_403114 - SURFACE
      ?auto_403115 - SURFACE
    )
    :vars
    (
      ?auto_403116 - HOIST
      ?auto_403117 - PLACE
      ?auto_403118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403116 ?auto_403117 ) ( SURFACE-AT ?auto_403114 ?auto_403117 ) ( CLEAR ?auto_403114 ) ( IS-CRATE ?auto_403115 ) ( not ( = ?auto_403114 ?auto_403115 ) ) ( TRUCK-AT ?auto_403118 ?auto_403117 ) ( AVAILABLE ?auto_403116 ) ( IN ?auto_403115 ?auto_403118 ) ( ON ?auto_403114 ?auto_403113 ) ( not ( = ?auto_403113 ?auto_403114 ) ) ( not ( = ?auto_403113 ?auto_403115 ) ) ( ON ?auto_403113 ?auto_403112 ) ( not ( = ?auto_403112 ?auto_403113 ) ) ( not ( = ?auto_403112 ?auto_403114 ) ) ( not ( = ?auto_403112 ?auto_403115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403113 ?auto_403114 ?auto_403115 )
      ( MAKE-3CRATE-VERIFY ?auto_403112 ?auto_403113 ?auto_403114 ?auto_403115 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403133 - SURFACE
      ?auto_403134 - SURFACE
      ?auto_403135 - SURFACE
      ?auto_403136 - SURFACE
    )
    :vars
    (
      ?auto_403137 - HOIST
      ?auto_403140 - PLACE
      ?auto_403139 - TRUCK
      ?auto_403138 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403137 ?auto_403140 ) ( SURFACE-AT ?auto_403135 ?auto_403140 ) ( CLEAR ?auto_403135 ) ( IS-CRATE ?auto_403136 ) ( not ( = ?auto_403135 ?auto_403136 ) ) ( AVAILABLE ?auto_403137 ) ( IN ?auto_403136 ?auto_403139 ) ( ON ?auto_403135 ?auto_403134 ) ( not ( = ?auto_403134 ?auto_403135 ) ) ( not ( = ?auto_403134 ?auto_403136 ) ) ( TRUCK-AT ?auto_403139 ?auto_403138 ) ( not ( = ?auto_403138 ?auto_403140 ) ) ( ON ?auto_403134 ?auto_403133 ) ( not ( = ?auto_403133 ?auto_403134 ) ) ( not ( = ?auto_403133 ?auto_403135 ) ) ( not ( = ?auto_403133 ?auto_403136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403134 ?auto_403135 ?auto_403136 )
      ( MAKE-3CRATE-VERIFY ?auto_403133 ?auto_403134 ?auto_403135 ?auto_403136 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403157 - SURFACE
      ?auto_403158 - SURFACE
      ?auto_403159 - SURFACE
      ?auto_403160 - SURFACE
    )
    :vars
    (
      ?auto_403163 - HOIST
      ?auto_403164 - PLACE
      ?auto_403165 - TRUCK
      ?auto_403161 - PLACE
      ?auto_403162 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403163 ?auto_403164 ) ( SURFACE-AT ?auto_403159 ?auto_403164 ) ( CLEAR ?auto_403159 ) ( IS-CRATE ?auto_403160 ) ( not ( = ?auto_403159 ?auto_403160 ) ) ( AVAILABLE ?auto_403163 ) ( ON ?auto_403159 ?auto_403158 ) ( not ( = ?auto_403158 ?auto_403159 ) ) ( not ( = ?auto_403158 ?auto_403160 ) ) ( TRUCK-AT ?auto_403165 ?auto_403161 ) ( not ( = ?auto_403161 ?auto_403164 ) ) ( HOIST-AT ?auto_403162 ?auto_403161 ) ( LIFTING ?auto_403162 ?auto_403160 ) ( not ( = ?auto_403163 ?auto_403162 ) ) ( ON ?auto_403158 ?auto_403157 ) ( not ( = ?auto_403157 ?auto_403158 ) ) ( not ( = ?auto_403157 ?auto_403159 ) ) ( not ( = ?auto_403157 ?auto_403160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403158 ?auto_403159 ?auto_403160 )
      ( MAKE-3CRATE-VERIFY ?auto_403157 ?auto_403158 ?auto_403159 ?auto_403160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403184 - SURFACE
      ?auto_403185 - SURFACE
      ?auto_403186 - SURFACE
      ?auto_403187 - SURFACE
    )
    :vars
    (
      ?auto_403190 - HOIST
      ?auto_403193 - PLACE
      ?auto_403189 - TRUCK
      ?auto_403188 - PLACE
      ?auto_403191 - HOIST
      ?auto_403192 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403190 ?auto_403193 ) ( SURFACE-AT ?auto_403186 ?auto_403193 ) ( CLEAR ?auto_403186 ) ( IS-CRATE ?auto_403187 ) ( not ( = ?auto_403186 ?auto_403187 ) ) ( AVAILABLE ?auto_403190 ) ( ON ?auto_403186 ?auto_403185 ) ( not ( = ?auto_403185 ?auto_403186 ) ) ( not ( = ?auto_403185 ?auto_403187 ) ) ( TRUCK-AT ?auto_403189 ?auto_403188 ) ( not ( = ?auto_403188 ?auto_403193 ) ) ( HOIST-AT ?auto_403191 ?auto_403188 ) ( not ( = ?auto_403190 ?auto_403191 ) ) ( AVAILABLE ?auto_403191 ) ( SURFACE-AT ?auto_403187 ?auto_403188 ) ( ON ?auto_403187 ?auto_403192 ) ( CLEAR ?auto_403187 ) ( not ( = ?auto_403186 ?auto_403192 ) ) ( not ( = ?auto_403187 ?auto_403192 ) ) ( not ( = ?auto_403185 ?auto_403192 ) ) ( ON ?auto_403185 ?auto_403184 ) ( not ( = ?auto_403184 ?auto_403185 ) ) ( not ( = ?auto_403184 ?auto_403186 ) ) ( not ( = ?auto_403184 ?auto_403187 ) ) ( not ( = ?auto_403184 ?auto_403192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403185 ?auto_403186 ?auto_403187 )
      ( MAKE-3CRATE-VERIFY ?auto_403184 ?auto_403185 ?auto_403186 ?auto_403187 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403212 - SURFACE
      ?auto_403213 - SURFACE
      ?auto_403214 - SURFACE
      ?auto_403215 - SURFACE
    )
    :vars
    (
      ?auto_403221 - HOIST
      ?auto_403218 - PLACE
      ?auto_403219 - PLACE
      ?auto_403217 - HOIST
      ?auto_403216 - SURFACE
      ?auto_403220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403221 ?auto_403218 ) ( SURFACE-AT ?auto_403214 ?auto_403218 ) ( CLEAR ?auto_403214 ) ( IS-CRATE ?auto_403215 ) ( not ( = ?auto_403214 ?auto_403215 ) ) ( AVAILABLE ?auto_403221 ) ( ON ?auto_403214 ?auto_403213 ) ( not ( = ?auto_403213 ?auto_403214 ) ) ( not ( = ?auto_403213 ?auto_403215 ) ) ( not ( = ?auto_403219 ?auto_403218 ) ) ( HOIST-AT ?auto_403217 ?auto_403219 ) ( not ( = ?auto_403221 ?auto_403217 ) ) ( AVAILABLE ?auto_403217 ) ( SURFACE-AT ?auto_403215 ?auto_403219 ) ( ON ?auto_403215 ?auto_403216 ) ( CLEAR ?auto_403215 ) ( not ( = ?auto_403214 ?auto_403216 ) ) ( not ( = ?auto_403215 ?auto_403216 ) ) ( not ( = ?auto_403213 ?auto_403216 ) ) ( TRUCK-AT ?auto_403220 ?auto_403218 ) ( ON ?auto_403213 ?auto_403212 ) ( not ( = ?auto_403212 ?auto_403213 ) ) ( not ( = ?auto_403212 ?auto_403214 ) ) ( not ( = ?auto_403212 ?auto_403215 ) ) ( not ( = ?auto_403212 ?auto_403216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403213 ?auto_403214 ?auto_403215 )
      ( MAKE-3CRATE-VERIFY ?auto_403212 ?auto_403213 ?auto_403214 ?auto_403215 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403240 - SURFACE
      ?auto_403241 - SURFACE
      ?auto_403242 - SURFACE
      ?auto_403243 - SURFACE
    )
    :vars
    (
      ?auto_403247 - HOIST
      ?auto_403244 - PLACE
      ?auto_403249 - PLACE
      ?auto_403245 - HOIST
      ?auto_403248 - SURFACE
      ?auto_403246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403247 ?auto_403244 ) ( IS-CRATE ?auto_403243 ) ( not ( = ?auto_403242 ?auto_403243 ) ) ( not ( = ?auto_403241 ?auto_403242 ) ) ( not ( = ?auto_403241 ?auto_403243 ) ) ( not ( = ?auto_403249 ?auto_403244 ) ) ( HOIST-AT ?auto_403245 ?auto_403249 ) ( not ( = ?auto_403247 ?auto_403245 ) ) ( AVAILABLE ?auto_403245 ) ( SURFACE-AT ?auto_403243 ?auto_403249 ) ( ON ?auto_403243 ?auto_403248 ) ( CLEAR ?auto_403243 ) ( not ( = ?auto_403242 ?auto_403248 ) ) ( not ( = ?auto_403243 ?auto_403248 ) ) ( not ( = ?auto_403241 ?auto_403248 ) ) ( TRUCK-AT ?auto_403246 ?auto_403244 ) ( SURFACE-AT ?auto_403241 ?auto_403244 ) ( CLEAR ?auto_403241 ) ( LIFTING ?auto_403247 ?auto_403242 ) ( IS-CRATE ?auto_403242 ) ( ON ?auto_403241 ?auto_403240 ) ( not ( = ?auto_403240 ?auto_403241 ) ) ( not ( = ?auto_403240 ?auto_403242 ) ) ( not ( = ?auto_403240 ?auto_403243 ) ) ( not ( = ?auto_403240 ?auto_403248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403241 ?auto_403242 ?auto_403243 )
      ( MAKE-3CRATE-VERIFY ?auto_403240 ?auto_403241 ?auto_403242 ?auto_403243 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_403268 - SURFACE
      ?auto_403269 - SURFACE
      ?auto_403270 - SURFACE
      ?auto_403271 - SURFACE
    )
    :vars
    (
      ?auto_403276 - HOIST
      ?auto_403277 - PLACE
      ?auto_403273 - PLACE
      ?auto_403275 - HOIST
      ?auto_403274 - SURFACE
      ?auto_403272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403276 ?auto_403277 ) ( IS-CRATE ?auto_403271 ) ( not ( = ?auto_403270 ?auto_403271 ) ) ( not ( = ?auto_403269 ?auto_403270 ) ) ( not ( = ?auto_403269 ?auto_403271 ) ) ( not ( = ?auto_403273 ?auto_403277 ) ) ( HOIST-AT ?auto_403275 ?auto_403273 ) ( not ( = ?auto_403276 ?auto_403275 ) ) ( AVAILABLE ?auto_403275 ) ( SURFACE-AT ?auto_403271 ?auto_403273 ) ( ON ?auto_403271 ?auto_403274 ) ( CLEAR ?auto_403271 ) ( not ( = ?auto_403270 ?auto_403274 ) ) ( not ( = ?auto_403271 ?auto_403274 ) ) ( not ( = ?auto_403269 ?auto_403274 ) ) ( TRUCK-AT ?auto_403272 ?auto_403277 ) ( SURFACE-AT ?auto_403269 ?auto_403277 ) ( CLEAR ?auto_403269 ) ( IS-CRATE ?auto_403270 ) ( AVAILABLE ?auto_403276 ) ( IN ?auto_403270 ?auto_403272 ) ( ON ?auto_403269 ?auto_403268 ) ( not ( = ?auto_403268 ?auto_403269 ) ) ( not ( = ?auto_403268 ?auto_403270 ) ) ( not ( = ?auto_403268 ?auto_403271 ) ) ( not ( = ?auto_403268 ?auto_403274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403269 ?auto_403270 ?auto_403271 )
      ( MAKE-3CRATE-VERIFY ?auto_403268 ?auto_403269 ?auto_403270 ?auto_403271 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403559 - SURFACE
      ?auto_403560 - SURFACE
      ?auto_403561 - SURFACE
      ?auto_403563 - SURFACE
      ?auto_403562 - SURFACE
    )
    :vars
    (
      ?auto_403565 - HOIST
      ?auto_403564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403565 ?auto_403564 ) ( SURFACE-AT ?auto_403563 ?auto_403564 ) ( CLEAR ?auto_403563 ) ( LIFTING ?auto_403565 ?auto_403562 ) ( IS-CRATE ?auto_403562 ) ( not ( = ?auto_403563 ?auto_403562 ) ) ( ON ?auto_403560 ?auto_403559 ) ( ON ?auto_403561 ?auto_403560 ) ( ON ?auto_403563 ?auto_403561 ) ( not ( = ?auto_403559 ?auto_403560 ) ) ( not ( = ?auto_403559 ?auto_403561 ) ) ( not ( = ?auto_403559 ?auto_403563 ) ) ( not ( = ?auto_403559 ?auto_403562 ) ) ( not ( = ?auto_403560 ?auto_403561 ) ) ( not ( = ?auto_403560 ?auto_403563 ) ) ( not ( = ?auto_403560 ?auto_403562 ) ) ( not ( = ?auto_403561 ?auto_403563 ) ) ( not ( = ?auto_403561 ?auto_403562 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_403563 ?auto_403562 )
      ( MAKE-4CRATE-VERIFY ?auto_403559 ?auto_403560 ?auto_403561 ?auto_403563 ?auto_403562 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403584 - SURFACE
      ?auto_403585 - SURFACE
      ?auto_403586 - SURFACE
      ?auto_403588 - SURFACE
      ?auto_403587 - SURFACE
    )
    :vars
    (
      ?auto_403591 - HOIST
      ?auto_403589 - PLACE
      ?auto_403590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403591 ?auto_403589 ) ( SURFACE-AT ?auto_403588 ?auto_403589 ) ( CLEAR ?auto_403588 ) ( IS-CRATE ?auto_403587 ) ( not ( = ?auto_403588 ?auto_403587 ) ) ( TRUCK-AT ?auto_403590 ?auto_403589 ) ( AVAILABLE ?auto_403591 ) ( IN ?auto_403587 ?auto_403590 ) ( ON ?auto_403588 ?auto_403586 ) ( not ( = ?auto_403586 ?auto_403588 ) ) ( not ( = ?auto_403586 ?auto_403587 ) ) ( ON ?auto_403585 ?auto_403584 ) ( ON ?auto_403586 ?auto_403585 ) ( not ( = ?auto_403584 ?auto_403585 ) ) ( not ( = ?auto_403584 ?auto_403586 ) ) ( not ( = ?auto_403584 ?auto_403588 ) ) ( not ( = ?auto_403584 ?auto_403587 ) ) ( not ( = ?auto_403585 ?auto_403586 ) ) ( not ( = ?auto_403585 ?auto_403588 ) ) ( not ( = ?auto_403585 ?auto_403587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403586 ?auto_403588 ?auto_403587 )
      ( MAKE-4CRATE-VERIFY ?auto_403584 ?auto_403585 ?auto_403586 ?auto_403588 ?auto_403587 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403614 - SURFACE
      ?auto_403615 - SURFACE
      ?auto_403616 - SURFACE
      ?auto_403618 - SURFACE
      ?auto_403617 - SURFACE
    )
    :vars
    (
      ?auto_403619 - HOIST
      ?auto_403622 - PLACE
      ?auto_403620 - TRUCK
      ?auto_403621 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403619 ?auto_403622 ) ( SURFACE-AT ?auto_403618 ?auto_403622 ) ( CLEAR ?auto_403618 ) ( IS-CRATE ?auto_403617 ) ( not ( = ?auto_403618 ?auto_403617 ) ) ( AVAILABLE ?auto_403619 ) ( IN ?auto_403617 ?auto_403620 ) ( ON ?auto_403618 ?auto_403616 ) ( not ( = ?auto_403616 ?auto_403618 ) ) ( not ( = ?auto_403616 ?auto_403617 ) ) ( TRUCK-AT ?auto_403620 ?auto_403621 ) ( not ( = ?auto_403621 ?auto_403622 ) ) ( ON ?auto_403615 ?auto_403614 ) ( ON ?auto_403616 ?auto_403615 ) ( not ( = ?auto_403614 ?auto_403615 ) ) ( not ( = ?auto_403614 ?auto_403616 ) ) ( not ( = ?auto_403614 ?auto_403618 ) ) ( not ( = ?auto_403614 ?auto_403617 ) ) ( not ( = ?auto_403615 ?auto_403616 ) ) ( not ( = ?auto_403615 ?auto_403618 ) ) ( not ( = ?auto_403615 ?auto_403617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403616 ?auto_403618 ?auto_403617 )
      ( MAKE-4CRATE-VERIFY ?auto_403614 ?auto_403615 ?auto_403616 ?auto_403618 ?auto_403617 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403648 - SURFACE
      ?auto_403649 - SURFACE
      ?auto_403650 - SURFACE
      ?auto_403652 - SURFACE
      ?auto_403651 - SURFACE
    )
    :vars
    (
      ?auto_403656 - HOIST
      ?auto_403657 - PLACE
      ?auto_403654 - TRUCK
      ?auto_403655 - PLACE
      ?auto_403653 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_403656 ?auto_403657 ) ( SURFACE-AT ?auto_403652 ?auto_403657 ) ( CLEAR ?auto_403652 ) ( IS-CRATE ?auto_403651 ) ( not ( = ?auto_403652 ?auto_403651 ) ) ( AVAILABLE ?auto_403656 ) ( ON ?auto_403652 ?auto_403650 ) ( not ( = ?auto_403650 ?auto_403652 ) ) ( not ( = ?auto_403650 ?auto_403651 ) ) ( TRUCK-AT ?auto_403654 ?auto_403655 ) ( not ( = ?auto_403655 ?auto_403657 ) ) ( HOIST-AT ?auto_403653 ?auto_403655 ) ( LIFTING ?auto_403653 ?auto_403651 ) ( not ( = ?auto_403656 ?auto_403653 ) ) ( ON ?auto_403649 ?auto_403648 ) ( ON ?auto_403650 ?auto_403649 ) ( not ( = ?auto_403648 ?auto_403649 ) ) ( not ( = ?auto_403648 ?auto_403650 ) ) ( not ( = ?auto_403648 ?auto_403652 ) ) ( not ( = ?auto_403648 ?auto_403651 ) ) ( not ( = ?auto_403649 ?auto_403650 ) ) ( not ( = ?auto_403649 ?auto_403652 ) ) ( not ( = ?auto_403649 ?auto_403651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403650 ?auto_403652 ?auto_403651 )
      ( MAKE-4CRATE-VERIFY ?auto_403648 ?auto_403649 ?auto_403650 ?auto_403652 ?auto_403651 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403686 - SURFACE
      ?auto_403687 - SURFACE
      ?auto_403688 - SURFACE
      ?auto_403690 - SURFACE
      ?auto_403689 - SURFACE
    )
    :vars
    (
      ?auto_403696 - HOIST
      ?auto_403691 - PLACE
      ?auto_403694 - TRUCK
      ?auto_403693 - PLACE
      ?auto_403695 - HOIST
      ?auto_403692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_403696 ?auto_403691 ) ( SURFACE-AT ?auto_403690 ?auto_403691 ) ( CLEAR ?auto_403690 ) ( IS-CRATE ?auto_403689 ) ( not ( = ?auto_403690 ?auto_403689 ) ) ( AVAILABLE ?auto_403696 ) ( ON ?auto_403690 ?auto_403688 ) ( not ( = ?auto_403688 ?auto_403690 ) ) ( not ( = ?auto_403688 ?auto_403689 ) ) ( TRUCK-AT ?auto_403694 ?auto_403693 ) ( not ( = ?auto_403693 ?auto_403691 ) ) ( HOIST-AT ?auto_403695 ?auto_403693 ) ( not ( = ?auto_403696 ?auto_403695 ) ) ( AVAILABLE ?auto_403695 ) ( SURFACE-AT ?auto_403689 ?auto_403693 ) ( ON ?auto_403689 ?auto_403692 ) ( CLEAR ?auto_403689 ) ( not ( = ?auto_403690 ?auto_403692 ) ) ( not ( = ?auto_403689 ?auto_403692 ) ) ( not ( = ?auto_403688 ?auto_403692 ) ) ( ON ?auto_403687 ?auto_403686 ) ( ON ?auto_403688 ?auto_403687 ) ( not ( = ?auto_403686 ?auto_403687 ) ) ( not ( = ?auto_403686 ?auto_403688 ) ) ( not ( = ?auto_403686 ?auto_403690 ) ) ( not ( = ?auto_403686 ?auto_403689 ) ) ( not ( = ?auto_403686 ?auto_403692 ) ) ( not ( = ?auto_403687 ?auto_403688 ) ) ( not ( = ?auto_403687 ?auto_403690 ) ) ( not ( = ?auto_403687 ?auto_403689 ) ) ( not ( = ?auto_403687 ?auto_403692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403688 ?auto_403690 ?auto_403689 )
      ( MAKE-4CRATE-VERIFY ?auto_403686 ?auto_403687 ?auto_403688 ?auto_403690 ?auto_403689 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403725 - SURFACE
      ?auto_403726 - SURFACE
      ?auto_403727 - SURFACE
      ?auto_403729 - SURFACE
      ?auto_403728 - SURFACE
    )
    :vars
    (
      ?auto_403733 - HOIST
      ?auto_403731 - PLACE
      ?auto_403732 - PLACE
      ?auto_403730 - HOIST
      ?auto_403735 - SURFACE
      ?auto_403734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403733 ?auto_403731 ) ( SURFACE-AT ?auto_403729 ?auto_403731 ) ( CLEAR ?auto_403729 ) ( IS-CRATE ?auto_403728 ) ( not ( = ?auto_403729 ?auto_403728 ) ) ( AVAILABLE ?auto_403733 ) ( ON ?auto_403729 ?auto_403727 ) ( not ( = ?auto_403727 ?auto_403729 ) ) ( not ( = ?auto_403727 ?auto_403728 ) ) ( not ( = ?auto_403732 ?auto_403731 ) ) ( HOIST-AT ?auto_403730 ?auto_403732 ) ( not ( = ?auto_403733 ?auto_403730 ) ) ( AVAILABLE ?auto_403730 ) ( SURFACE-AT ?auto_403728 ?auto_403732 ) ( ON ?auto_403728 ?auto_403735 ) ( CLEAR ?auto_403728 ) ( not ( = ?auto_403729 ?auto_403735 ) ) ( not ( = ?auto_403728 ?auto_403735 ) ) ( not ( = ?auto_403727 ?auto_403735 ) ) ( TRUCK-AT ?auto_403734 ?auto_403731 ) ( ON ?auto_403726 ?auto_403725 ) ( ON ?auto_403727 ?auto_403726 ) ( not ( = ?auto_403725 ?auto_403726 ) ) ( not ( = ?auto_403725 ?auto_403727 ) ) ( not ( = ?auto_403725 ?auto_403729 ) ) ( not ( = ?auto_403725 ?auto_403728 ) ) ( not ( = ?auto_403725 ?auto_403735 ) ) ( not ( = ?auto_403726 ?auto_403727 ) ) ( not ( = ?auto_403726 ?auto_403729 ) ) ( not ( = ?auto_403726 ?auto_403728 ) ) ( not ( = ?auto_403726 ?auto_403735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403727 ?auto_403729 ?auto_403728 )
      ( MAKE-4CRATE-VERIFY ?auto_403725 ?auto_403726 ?auto_403727 ?auto_403729 ?auto_403728 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403764 - SURFACE
      ?auto_403765 - SURFACE
      ?auto_403766 - SURFACE
      ?auto_403768 - SURFACE
      ?auto_403767 - SURFACE
    )
    :vars
    (
      ?auto_403770 - HOIST
      ?auto_403772 - PLACE
      ?auto_403769 - PLACE
      ?auto_403773 - HOIST
      ?auto_403774 - SURFACE
      ?auto_403771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403770 ?auto_403772 ) ( IS-CRATE ?auto_403767 ) ( not ( = ?auto_403768 ?auto_403767 ) ) ( not ( = ?auto_403766 ?auto_403768 ) ) ( not ( = ?auto_403766 ?auto_403767 ) ) ( not ( = ?auto_403769 ?auto_403772 ) ) ( HOIST-AT ?auto_403773 ?auto_403769 ) ( not ( = ?auto_403770 ?auto_403773 ) ) ( AVAILABLE ?auto_403773 ) ( SURFACE-AT ?auto_403767 ?auto_403769 ) ( ON ?auto_403767 ?auto_403774 ) ( CLEAR ?auto_403767 ) ( not ( = ?auto_403768 ?auto_403774 ) ) ( not ( = ?auto_403767 ?auto_403774 ) ) ( not ( = ?auto_403766 ?auto_403774 ) ) ( TRUCK-AT ?auto_403771 ?auto_403772 ) ( SURFACE-AT ?auto_403766 ?auto_403772 ) ( CLEAR ?auto_403766 ) ( LIFTING ?auto_403770 ?auto_403768 ) ( IS-CRATE ?auto_403768 ) ( ON ?auto_403765 ?auto_403764 ) ( ON ?auto_403766 ?auto_403765 ) ( not ( = ?auto_403764 ?auto_403765 ) ) ( not ( = ?auto_403764 ?auto_403766 ) ) ( not ( = ?auto_403764 ?auto_403768 ) ) ( not ( = ?auto_403764 ?auto_403767 ) ) ( not ( = ?auto_403764 ?auto_403774 ) ) ( not ( = ?auto_403765 ?auto_403766 ) ) ( not ( = ?auto_403765 ?auto_403768 ) ) ( not ( = ?auto_403765 ?auto_403767 ) ) ( not ( = ?auto_403765 ?auto_403774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403766 ?auto_403768 ?auto_403767 )
      ( MAKE-4CRATE-VERIFY ?auto_403764 ?auto_403765 ?auto_403766 ?auto_403768 ?auto_403767 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_403803 - SURFACE
      ?auto_403804 - SURFACE
      ?auto_403805 - SURFACE
      ?auto_403807 - SURFACE
      ?auto_403806 - SURFACE
    )
    :vars
    (
      ?auto_403808 - HOIST
      ?auto_403812 - PLACE
      ?auto_403810 - PLACE
      ?auto_403811 - HOIST
      ?auto_403813 - SURFACE
      ?auto_403809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_403808 ?auto_403812 ) ( IS-CRATE ?auto_403806 ) ( not ( = ?auto_403807 ?auto_403806 ) ) ( not ( = ?auto_403805 ?auto_403807 ) ) ( not ( = ?auto_403805 ?auto_403806 ) ) ( not ( = ?auto_403810 ?auto_403812 ) ) ( HOIST-AT ?auto_403811 ?auto_403810 ) ( not ( = ?auto_403808 ?auto_403811 ) ) ( AVAILABLE ?auto_403811 ) ( SURFACE-AT ?auto_403806 ?auto_403810 ) ( ON ?auto_403806 ?auto_403813 ) ( CLEAR ?auto_403806 ) ( not ( = ?auto_403807 ?auto_403813 ) ) ( not ( = ?auto_403806 ?auto_403813 ) ) ( not ( = ?auto_403805 ?auto_403813 ) ) ( TRUCK-AT ?auto_403809 ?auto_403812 ) ( SURFACE-AT ?auto_403805 ?auto_403812 ) ( CLEAR ?auto_403805 ) ( IS-CRATE ?auto_403807 ) ( AVAILABLE ?auto_403808 ) ( IN ?auto_403807 ?auto_403809 ) ( ON ?auto_403804 ?auto_403803 ) ( ON ?auto_403805 ?auto_403804 ) ( not ( = ?auto_403803 ?auto_403804 ) ) ( not ( = ?auto_403803 ?auto_403805 ) ) ( not ( = ?auto_403803 ?auto_403807 ) ) ( not ( = ?auto_403803 ?auto_403806 ) ) ( not ( = ?auto_403803 ?auto_403813 ) ) ( not ( = ?auto_403804 ?auto_403805 ) ) ( not ( = ?auto_403804 ?auto_403807 ) ) ( not ( = ?auto_403804 ?auto_403806 ) ) ( not ( = ?auto_403804 ?auto_403813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_403805 ?auto_403807 ?auto_403806 )
      ( MAKE-4CRATE-VERIFY ?auto_403803 ?auto_403804 ?auto_403805 ?auto_403807 ?auto_403806 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404463 - SURFACE
      ?auto_404464 - SURFACE
      ?auto_404465 - SURFACE
      ?auto_404467 - SURFACE
      ?auto_404466 - SURFACE
      ?auto_404468 - SURFACE
    )
    :vars
    (
      ?auto_404469 - HOIST
      ?auto_404470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404469 ?auto_404470 ) ( SURFACE-AT ?auto_404466 ?auto_404470 ) ( CLEAR ?auto_404466 ) ( LIFTING ?auto_404469 ?auto_404468 ) ( IS-CRATE ?auto_404468 ) ( not ( = ?auto_404466 ?auto_404468 ) ) ( ON ?auto_404464 ?auto_404463 ) ( ON ?auto_404465 ?auto_404464 ) ( ON ?auto_404467 ?auto_404465 ) ( ON ?auto_404466 ?auto_404467 ) ( not ( = ?auto_404463 ?auto_404464 ) ) ( not ( = ?auto_404463 ?auto_404465 ) ) ( not ( = ?auto_404463 ?auto_404467 ) ) ( not ( = ?auto_404463 ?auto_404466 ) ) ( not ( = ?auto_404463 ?auto_404468 ) ) ( not ( = ?auto_404464 ?auto_404465 ) ) ( not ( = ?auto_404464 ?auto_404467 ) ) ( not ( = ?auto_404464 ?auto_404466 ) ) ( not ( = ?auto_404464 ?auto_404468 ) ) ( not ( = ?auto_404465 ?auto_404467 ) ) ( not ( = ?auto_404465 ?auto_404466 ) ) ( not ( = ?auto_404465 ?auto_404468 ) ) ( not ( = ?auto_404467 ?auto_404466 ) ) ( not ( = ?auto_404467 ?auto_404468 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_404466 ?auto_404468 )
      ( MAKE-5CRATE-VERIFY ?auto_404463 ?auto_404464 ?auto_404465 ?auto_404467 ?auto_404466 ?auto_404468 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404497 - SURFACE
      ?auto_404498 - SURFACE
      ?auto_404499 - SURFACE
      ?auto_404501 - SURFACE
      ?auto_404500 - SURFACE
      ?auto_404502 - SURFACE
    )
    :vars
    (
      ?auto_404503 - HOIST
      ?auto_404505 - PLACE
      ?auto_404504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404503 ?auto_404505 ) ( SURFACE-AT ?auto_404500 ?auto_404505 ) ( CLEAR ?auto_404500 ) ( IS-CRATE ?auto_404502 ) ( not ( = ?auto_404500 ?auto_404502 ) ) ( TRUCK-AT ?auto_404504 ?auto_404505 ) ( AVAILABLE ?auto_404503 ) ( IN ?auto_404502 ?auto_404504 ) ( ON ?auto_404500 ?auto_404501 ) ( not ( = ?auto_404501 ?auto_404500 ) ) ( not ( = ?auto_404501 ?auto_404502 ) ) ( ON ?auto_404498 ?auto_404497 ) ( ON ?auto_404499 ?auto_404498 ) ( ON ?auto_404501 ?auto_404499 ) ( not ( = ?auto_404497 ?auto_404498 ) ) ( not ( = ?auto_404497 ?auto_404499 ) ) ( not ( = ?auto_404497 ?auto_404501 ) ) ( not ( = ?auto_404497 ?auto_404500 ) ) ( not ( = ?auto_404497 ?auto_404502 ) ) ( not ( = ?auto_404498 ?auto_404499 ) ) ( not ( = ?auto_404498 ?auto_404501 ) ) ( not ( = ?auto_404498 ?auto_404500 ) ) ( not ( = ?auto_404498 ?auto_404502 ) ) ( not ( = ?auto_404499 ?auto_404501 ) ) ( not ( = ?auto_404499 ?auto_404500 ) ) ( not ( = ?auto_404499 ?auto_404502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404501 ?auto_404500 ?auto_404502 )
      ( MAKE-5CRATE-VERIFY ?auto_404497 ?auto_404498 ?auto_404499 ?auto_404501 ?auto_404500 ?auto_404502 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404537 - SURFACE
      ?auto_404538 - SURFACE
      ?auto_404539 - SURFACE
      ?auto_404541 - SURFACE
      ?auto_404540 - SURFACE
      ?auto_404542 - SURFACE
    )
    :vars
    (
      ?auto_404543 - HOIST
      ?auto_404546 - PLACE
      ?auto_404544 - TRUCK
      ?auto_404545 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404543 ?auto_404546 ) ( SURFACE-AT ?auto_404540 ?auto_404546 ) ( CLEAR ?auto_404540 ) ( IS-CRATE ?auto_404542 ) ( not ( = ?auto_404540 ?auto_404542 ) ) ( AVAILABLE ?auto_404543 ) ( IN ?auto_404542 ?auto_404544 ) ( ON ?auto_404540 ?auto_404541 ) ( not ( = ?auto_404541 ?auto_404540 ) ) ( not ( = ?auto_404541 ?auto_404542 ) ) ( TRUCK-AT ?auto_404544 ?auto_404545 ) ( not ( = ?auto_404545 ?auto_404546 ) ) ( ON ?auto_404538 ?auto_404537 ) ( ON ?auto_404539 ?auto_404538 ) ( ON ?auto_404541 ?auto_404539 ) ( not ( = ?auto_404537 ?auto_404538 ) ) ( not ( = ?auto_404537 ?auto_404539 ) ) ( not ( = ?auto_404537 ?auto_404541 ) ) ( not ( = ?auto_404537 ?auto_404540 ) ) ( not ( = ?auto_404537 ?auto_404542 ) ) ( not ( = ?auto_404538 ?auto_404539 ) ) ( not ( = ?auto_404538 ?auto_404541 ) ) ( not ( = ?auto_404538 ?auto_404540 ) ) ( not ( = ?auto_404538 ?auto_404542 ) ) ( not ( = ?auto_404539 ?auto_404541 ) ) ( not ( = ?auto_404539 ?auto_404540 ) ) ( not ( = ?auto_404539 ?auto_404542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404541 ?auto_404540 ?auto_404542 )
      ( MAKE-5CRATE-VERIFY ?auto_404537 ?auto_404538 ?auto_404539 ?auto_404541 ?auto_404540 ?auto_404542 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404582 - SURFACE
      ?auto_404583 - SURFACE
      ?auto_404584 - SURFACE
      ?auto_404586 - SURFACE
      ?auto_404585 - SURFACE
      ?auto_404587 - SURFACE
    )
    :vars
    (
      ?auto_404588 - HOIST
      ?auto_404591 - PLACE
      ?auto_404589 - TRUCK
      ?auto_404590 - PLACE
      ?auto_404592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_404588 ?auto_404591 ) ( SURFACE-AT ?auto_404585 ?auto_404591 ) ( CLEAR ?auto_404585 ) ( IS-CRATE ?auto_404587 ) ( not ( = ?auto_404585 ?auto_404587 ) ) ( AVAILABLE ?auto_404588 ) ( ON ?auto_404585 ?auto_404586 ) ( not ( = ?auto_404586 ?auto_404585 ) ) ( not ( = ?auto_404586 ?auto_404587 ) ) ( TRUCK-AT ?auto_404589 ?auto_404590 ) ( not ( = ?auto_404590 ?auto_404591 ) ) ( HOIST-AT ?auto_404592 ?auto_404590 ) ( LIFTING ?auto_404592 ?auto_404587 ) ( not ( = ?auto_404588 ?auto_404592 ) ) ( ON ?auto_404583 ?auto_404582 ) ( ON ?auto_404584 ?auto_404583 ) ( ON ?auto_404586 ?auto_404584 ) ( not ( = ?auto_404582 ?auto_404583 ) ) ( not ( = ?auto_404582 ?auto_404584 ) ) ( not ( = ?auto_404582 ?auto_404586 ) ) ( not ( = ?auto_404582 ?auto_404585 ) ) ( not ( = ?auto_404582 ?auto_404587 ) ) ( not ( = ?auto_404583 ?auto_404584 ) ) ( not ( = ?auto_404583 ?auto_404586 ) ) ( not ( = ?auto_404583 ?auto_404585 ) ) ( not ( = ?auto_404583 ?auto_404587 ) ) ( not ( = ?auto_404584 ?auto_404586 ) ) ( not ( = ?auto_404584 ?auto_404585 ) ) ( not ( = ?auto_404584 ?auto_404587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404586 ?auto_404585 ?auto_404587 )
      ( MAKE-5CRATE-VERIFY ?auto_404582 ?auto_404583 ?auto_404584 ?auto_404586 ?auto_404585 ?auto_404587 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404632 - SURFACE
      ?auto_404633 - SURFACE
      ?auto_404634 - SURFACE
      ?auto_404636 - SURFACE
      ?auto_404635 - SURFACE
      ?auto_404637 - SURFACE
    )
    :vars
    (
      ?auto_404638 - HOIST
      ?auto_404640 - PLACE
      ?auto_404639 - TRUCK
      ?auto_404642 - PLACE
      ?auto_404643 - HOIST
      ?auto_404641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_404638 ?auto_404640 ) ( SURFACE-AT ?auto_404635 ?auto_404640 ) ( CLEAR ?auto_404635 ) ( IS-CRATE ?auto_404637 ) ( not ( = ?auto_404635 ?auto_404637 ) ) ( AVAILABLE ?auto_404638 ) ( ON ?auto_404635 ?auto_404636 ) ( not ( = ?auto_404636 ?auto_404635 ) ) ( not ( = ?auto_404636 ?auto_404637 ) ) ( TRUCK-AT ?auto_404639 ?auto_404642 ) ( not ( = ?auto_404642 ?auto_404640 ) ) ( HOIST-AT ?auto_404643 ?auto_404642 ) ( not ( = ?auto_404638 ?auto_404643 ) ) ( AVAILABLE ?auto_404643 ) ( SURFACE-AT ?auto_404637 ?auto_404642 ) ( ON ?auto_404637 ?auto_404641 ) ( CLEAR ?auto_404637 ) ( not ( = ?auto_404635 ?auto_404641 ) ) ( not ( = ?auto_404637 ?auto_404641 ) ) ( not ( = ?auto_404636 ?auto_404641 ) ) ( ON ?auto_404633 ?auto_404632 ) ( ON ?auto_404634 ?auto_404633 ) ( ON ?auto_404636 ?auto_404634 ) ( not ( = ?auto_404632 ?auto_404633 ) ) ( not ( = ?auto_404632 ?auto_404634 ) ) ( not ( = ?auto_404632 ?auto_404636 ) ) ( not ( = ?auto_404632 ?auto_404635 ) ) ( not ( = ?auto_404632 ?auto_404637 ) ) ( not ( = ?auto_404632 ?auto_404641 ) ) ( not ( = ?auto_404633 ?auto_404634 ) ) ( not ( = ?auto_404633 ?auto_404636 ) ) ( not ( = ?auto_404633 ?auto_404635 ) ) ( not ( = ?auto_404633 ?auto_404637 ) ) ( not ( = ?auto_404633 ?auto_404641 ) ) ( not ( = ?auto_404634 ?auto_404636 ) ) ( not ( = ?auto_404634 ?auto_404635 ) ) ( not ( = ?auto_404634 ?auto_404637 ) ) ( not ( = ?auto_404634 ?auto_404641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404636 ?auto_404635 ?auto_404637 )
      ( MAKE-5CRATE-VERIFY ?auto_404632 ?auto_404633 ?auto_404634 ?auto_404636 ?auto_404635 ?auto_404637 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404683 - SURFACE
      ?auto_404684 - SURFACE
      ?auto_404685 - SURFACE
      ?auto_404687 - SURFACE
      ?auto_404686 - SURFACE
      ?auto_404688 - SURFACE
    )
    :vars
    (
      ?auto_404690 - HOIST
      ?auto_404689 - PLACE
      ?auto_404692 - PLACE
      ?auto_404693 - HOIST
      ?auto_404694 - SURFACE
      ?auto_404691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404690 ?auto_404689 ) ( SURFACE-AT ?auto_404686 ?auto_404689 ) ( CLEAR ?auto_404686 ) ( IS-CRATE ?auto_404688 ) ( not ( = ?auto_404686 ?auto_404688 ) ) ( AVAILABLE ?auto_404690 ) ( ON ?auto_404686 ?auto_404687 ) ( not ( = ?auto_404687 ?auto_404686 ) ) ( not ( = ?auto_404687 ?auto_404688 ) ) ( not ( = ?auto_404692 ?auto_404689 ) ) ( HOIST-AT ?auto_404693 ?auto_404692 ) ( not ( = ?auto_404690 ?auto_404693 ) ) ( AVAILABLE ?auto_404693 ) ( SURFACE-AT ?auto_404688 ?auto_404692 ) ( ON ?auto_404688 ?auto_404694 ) ( CLEAR ?auto_404688 ) ( not ( = ?auto_404686 ?auto_404694 ) ) ( not ( = ?auto_404688 ?auto_404694 ) ) ( not ( = ?auto_404687 ?auto_404694 ) ) ( TRUCK-AT ?auto_404691 ?auto_404689 ) ( ON ?auto_404684 ?auto_404683 ) ( ON ?auto_404685 ?auto_404684 ) ( ON ?auto_404687 ?auto_404685 ) ( not ( = ?auto_404683 ?auto_404684 ) ) ( not ( = ?auto_404683 ?auto_404685 ) ) ( not ( = ?auto_404683 ?auto_404687 ) ) ( not ( = ?auto_404683 ?auto_404686 ) ) ( not ( = ?auto_404683 ?auto_404688 ) ) ( not ( = ?auto_404683 ?auto_404694 ) ) ( not ( = ?auto_404684 ?auto_404685 ) ) ( not ( = ?auto_404684 ?auto_404687 ) ) ( not ( = ?auto_404684 ?auto_404686 ) ) ( not ( = ?auto_404684 ?auto_404688 ) ) ( not ( = ?auto_404684 ?auto_404694 ) ) ( not ( = ?auto_404685 ?auto_404687 ) ) ( not ( = ?auto_404685 ?auto_404686 ) ) ( not ( = ?auto_404685 ?auto_404688 ) ) ( not ( = ?auto_404685 ?auto_404694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404687 ?auto_404686 ?auto_404688 )
      ( MAKE-5CRATE-VERIFY ?auto_404683 ?auto_404684 ?auto_404685 ?auto_404687 ?auto_404686 ?auto_404688 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404734 - SURFACE
      ?auto_404735 - SURFACE
      ?auto_404736 - SURFACE
      ?auto_404738 - SURFACE
      ?auto_404737 - SURFACE
      ?auto_404739 - SURFACE
    )
    :vars
    (
      ?auto_404745 - HOIST
      ?auto_404741 - PLACE
      ?auto_404740 - PLACE
      ?auto_404743 - HOIST
      ?auto_404744 - SURFACE
      ?auto_404742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404745 ?auto_404741 ) ( IS-CRATE ?auto_404739 ) ( not ( = ?auto_404737 ?auto_404739 ) ) ( not ( = ?auto_404738 ?auto_404737 ) ) ( not ( = ?auto_404738 ?auto_404739 ) ) ( not ( = ?auto_404740 ?auto_404741 ) ) ( HOIST-AT ?auto_404743 ?auto_404740 ) ( not ( = ?auto_404745 ?auto_404743 ) ) ( AVAILABLE ?auto_404743 ) ( SURFACE-AT ?auto_404739 ?auto_404740 ) ( ON ?auto_404739 ?auto_404744 ) ( CLEAR ?auto_404739 ) ( not ( = ?auto_404737 ?auto_404744 ) ) ( not ( = ?auto_404739 ?auto_404744 ) ) ( not ( = ?auto_404738 ?auto_404744 ) ) ( TRUCK-AT ?auto_404742 ?auto_404741 ) ( SURFACE-AT ?auto_404738 ?auto_404741 ) ( CLEAR ?auto_404738 ) ( LIFTING ?auto_404745 ?auto_404737 ) ( IS-CRATE ?auto_404737 ) ( ON ?auto_404735 ?auto_404734 ) ( ON ?auto_404736 ?auto_404735 ) ( ON ?auto_404738 ?auto_404736 ) ( not ( = ?auto_404734 ?auto_404735 ) ) ( not ( = ?auto_404734 ?auto_404736 ) ) ( not ( = ?auto_404734 ?auto_404738 ) ) ( not ( = ?auto_404734 ?auto_404737 ) ) ( not ( = ?auto_404734 ?auto_404739 ) ) ( not ( = ?auto_404734 ?auto_404744 ) ) ( not ( = ?auto_404735 ?auto_404736 ) ) ( not ( = ?auto_404735 ?auto_404738 ) ) ( not ( = ?auto_404735 ?auto_404737 ) ) ( not ( = ?auto_404735 ?auto_404739 ) ) ( not ( = ?auto_404735 ?auto_404744 ) ) ( not ( = ?auto_404736 ?auto_404738 ) ) ( not ( = ?auto_404736 ?auto_404737 ) ) ( not ( = ?auto_404736 ?auto_404739 ) ) ( not ( = ?auto_404736 ?auto_404744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404738 ?auto_404737 ?auto_404739 )
      ( MAKE-5CRATE-VERIFY ?auto_404734 ?auto_404735 ?auto_404736 ?auto_404738 ?auto_404737 ?auto_404739 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_404785 - SURFACE
      ?auto_404786 - SURFACE
      ?auto_404787 - SURFACE
      ?auto_404789 - SURFACE
      ?auto_404788 - SURFACE
      ?auto_404790 - SURFACE
    )
    :vars
    (
      ?auto_404792 - HOIST
      ?auto_404791 - PLACE
      ?auto_404796 - PLACE
      ?auto_404794 - HOIST
      ?auto_404793 - SURFACE
      ?auto_404795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_404792 ?auto_404791 ) ( IS-CRATE ?auto_404790 ) ( not ( = ?auto_404788 ?auto_404790 ) ) ( not ( = ?auto_404789 ?auto_404788 ) ) ( not ( = ?auto_404789 ?auto_404790 ) ) ( not ( = ?auto_404796 ?auto_404791 ) ) ( HOIST-AT ?auto_404794 ?auto_404796 ) ( not ( = ?auto_404792 ?auto_404794 ) ) ( AVAILABLE ?auto_404794 ) ( SURFACE-AT ?auto_404790 ?auto_404796 ) ( ON ?auto_404790 ?auto_404793 ) ( CLEAR ?auto_404790 ) ( not ( = ?auto_404788 ?auto_404793 ) ) ( not ( = ?auto_404790 ?auto_404793 ) ) ( not ( = ?auto_404789 ?auto_404793 ) ) ( TRUCK-AT ?auto_404795 ?auto_404791 ) ( SURFACE-AT ?auto_404789 ?auto_404791 ) ( CLEAR ?auto_404789 ) ( IS-CRATE ?auto_404788 ) ( AVAILABLE ?auto_404792 ) ( IN ?auto_404788 ?auto_404795 ) ( ON ?auto_404786 ?auto_404785 ) ( ON ?auto_404787 ?auto_404786 ) ( ON ?auto_404789 ?auto_404787 ) ( not ( = ?auto_404785 ?auto_404786 ) ) ( not ( = ?auto_404785 ?auto_404787 ) ) ( not ( = ?auto_404785 ?auto_404789 ) ) ( not ( = ?auto_404785 ?auto_404788 ) ) ( not ( = ?auto_404785 ?auto_404790 ) ) ( not ( = ?auto_404785 ?auto_404793 ) ) ( not ( = ?auto_404786 ?auto_404787 ) ) ( not ( = ?auto_404786 ?auto_404789 ) ) ( not ( = ?auto_404786 ?auto_404788 ) ) ( not ( = ?auto_404786 ?auto_404790 ) ) ( not ( = ?auto_404786 ?auto_404793 ) ) ( not ( = ?auto_404787 ?auto_404789 ) ) ( not ( = ?auto_404787 ?auto_404788 ) ) ( not ( = ?auto_404787 ?auto_404790 ) ) ( not ( = ?auto_404787 ?auto_404793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_404789 ?auto_404788 ?auto_404790 )
      ( MAKE-5CRATE-VERIFY ?auto_404785 ?auto_404786 ?auto_404787 ?auto_404789 ?auto_404788 ?auto_404790 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_405994 - SURFACE
      ?auto_405995 - SURFACE
      ?auto_405996 - SURFACE
      ?auto_405998 - SURFACE
      ?auto_405997 - SURFACE
      ?auto_405999 - SURFACE
      ?auto_406000 - SURFACE
    )
    :vars
    (
      ?auto_406001 - HOIST
      ?auto_406002 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406001 ?auto_406002 ) ( SURFACE-AT ?auto_405999 ?auto_406002 ) ( CLEAR ?auto_405999 ) ( LIFTING ?auto_406001 ?auto_406000 ) ( IS-CRATE ?auto_406000 ) ( not ( = ?auto_405999 ?auto_406000 ) ) ( ON ?auto_405995 ?auto_405994 ) ( ON ?auto_405996 ?auto_405995 ) ( ON ?auto_405998 ?auto_405996 ) ( ON ?auto_405997 ?auto_405998 ) ( ON ?auto_405999 ?auto_405997 ) ( not ( = ?auto_405994 ?auto_405995 ) ) ( not ( = ?auto_405994 ?auto_405996 ) ) ( not ( = ?auto_405994 ?auto_405998 ) ) ( not ( = ?auto_405994 ?auto_405997 ) ) ( not ( = ?auto_405994 ?auto_405999 ) ) ( not ( = ?auto_405994 ?auto_406000 ) ) ( not ( = ?auto_405995 ?auto_405996 ) ) ( not ( = ?auto_405995 ?auto_405998 ) ) ( not ( = ?auto_405995 ?auto_405997 ) ) ( not ( = ?auto_405995 ?auto_405999 ) ) ( not ( = ?auto_405995 ?auto_406000 ) ) ( not ( = ?auto_405996 ?auto_405998 ) ) ( not ( = ?auto_405996 ?auto_405997 ) ) ( not ( = ?auto_405996 ?auto_405999 ) ) ( not ( = ?auto_405996 ?auto_406000 ) ) ( not ( = ?auto_405998 ?auto_405997 ) ) ( not ( = ?auto_405998 ?auto_405999 ) ) ( not ( = ?auto_405998 ?auto_406000 ) ) ( not ( = ?auto_405997 ?auto_405999 ) ) ( not ( = ?auto_405997 ?auto_406000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_405999 ?auto_406000 )
      ( MAKE-6CRATE-VERIFY ?auto_405994 ?auto_405995 ?auto_405996 ?auto_405998 ?auto_405997 ?auto_405999 ?auto_406000 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406038 - SURFACE
      ?auto_406039 - SURFACE
      ?auto_406040 - SURFACE
      ?auto_406042 - SURFACE
      ?auto_406041 - SURFACE
      ?auto_406043 - SURFACE
      ?auto_406044 - SURFACE
    )
    :vars
    (
      ?auto_406045 - HOIST
      ?auto_406046 - PLACE
      ?auto_406047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406045 ?auto_406046 ) ( SURFACE-AT ?auto_406043 ?auto_406046 ) ( CLEAR ?auto_406043 ) ( IS-CRATE ?auto_406044 ) ( not ( = ?auto_406043 ?auto_406044 ) ) ( TRUCK-AT ?auto_406047 ?auto_406046 ) ( AVAILABLE ?auto_406045 ) ( IN ?auto_406044 ?auto_406047 ) ( ON ?auto_406043 ?auto_406041 ) ( not ( = ?auto_406041 ?auto_406043 ) ) ( not ( = ?auto_406041 ?auto_406044 ) ) ( ON ?auto_406039 ?auto_406038 ) ( ON ?auto_406040 ?auto_406039 ) ( ON ?auto_406042 ?auto_406040 ) ( ON ?auto_406041 ?auto_406042 ) ( not ( = ?auto_406038 ?auto_406039 ) ) ( not ( = ?auto_406038 ?auto_406040 ) ) ( not ( = ?auto_406038 ?auto_406042 ) ) ( not ( = ?auto_406038 ?auto_406041 ) ) ( not ( = ?auto_406038 ?auto_406043 ) ) ( not ( = ?auto_406038 ?auto_406044 ) ) ( not ( = ?auto_406039 ?auto_406040 ) ) ( not ( = ?auto_406039 ?auto_406042 ) ) ( not ( = ?auto_406039 ?auto_406041 ) ) ( not ( = ?auto_406039 ?auto_406043 ) ) ( not ( = ?auto_406039 ?auto_406044 ) ) ( not ( = ?auto_406040 ?auto_406042 ) ) ( not ( = ?auto_406040 ?auto_406041 ) ) ( not ( = ?auto_406040 ?auto_406043 ) ) ( not ( = ?auto_406040 ?auto_406044 ) ) ( not ( = ?auto_406042 ?auto_406041 ) ) ( not ( = ?auto_406042 ?auto_406043 ) ) ( not ( = ?auto_406042 ?auto_406044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406041 ?auto_406043 ?auto_406044 )
      ( MAKE-6CRATE-VERIFY ?auto_406038 ?auto_406039 ?auto_406040 ?auto_406042 ?auto_406041 ?auto_406043 ?auto_406044 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406089 - SURFACE
      ?auto_406090 - SURFACE
      ?auto_406091 - SURFACE
      ?auto_406093 - SURFACE
      ?auto_406092 - SURFACE
      ?auto_406094 - SURFACE
      ?auto_406095 - SURFACE
    )
    :vars
    (
      ?auto_406098 - HOIST
      ?auto_406099 - PLACE
      ?auto_406096 - TRUCK
      ?auto_406097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406098 ?auto_406099 ) ( SURFACE-AT ?auto_406094 ?auto_406099 ) ( CLEAR ?auto_406094 ) ( IS-CRATE ?auto_406095 ) ( not ( = ?auto_406094 ?auto_406095 ) ) ( AVAILABLE ?auto_406098 ) ( IN ?auto_406095 ?auto_406096 ) ( ON ?auto_406094 ?auto_406092 ) ( not ( = ?auto_406092 ?auto_406094 ) ) ( not ( = ?auto_406092 ?auto_406095 ) ) ( TRUCK-AT ?auto_406096 ?auto_406097 ) ( not ( = ?auto_406097 ?auto_406099 ) ) ( ON ?auto_406090 ?auto_406089 ) ( ON ?auto_406091 ?auto_406090 ) ( ON ?auto_406093 ?auto_406091 ) ( ON ?auto_406092 ?auto_406093 ) ( not ( = ?auto_406089 ?auto_406090 ) ) ( not ( = ?auto_406089 ?auto_406091 ) ) ( not ( = ?auto_406089 ?auto_406093 ) ) ( not ( = ?auto_406089 ?auto_406092 ) ) ( not ( = ?auto_406089 ?auto_406094 ) ) ( not ( = ?auto_406089 ?auto_406095 ) ) ( not ( = ?auto_406090 ?auto_406091 ) ) ( not ( = ?auto_406090 ?auto_406093 ) ) ( not ( = ?auto_406090 ?auto_406092 ) ) ( not ( = ?auto_406090 ?auto_406094 ) ) ( not ( = ?auto_406090 ?auto_406095 ) ) ( not ( = ?auto_406091 ?auto_406093 ) ) ( not ( = ?auto_406091 ?auto_406092 ) ) ( not ( = ?auto_406091 ?auto_406094 ) ) ( not ( = ?auto_406091 ?auto_406095 ) ) ( not ( = ?auto_406093 ?auto_406092 ) ) ( not ( = ?auto_406093 ?auto_406094 ) ) ( not ( = ?auto_406093 ?auto_406095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406092 ?auto_406094 ?auto_406095 )
      ( MAKE-6CRATE-VERIFY ?auto_406089 ?auto_406090 ?auto_406091 ?auto_406093 ?auto_406092 ?auto_406094 ?auto_406095 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406146 - SURFACE
      ?auto_406147 - SURFACE
      ?auto_406148 - SURFACE
      ?auto_406150 - SURFACE
      ?auto_406149 - SURFACE
      ?auto_406151 - SURFACE
      ?auto_406152 - SURFACE
    )
    :vars
    (
      ?auto_406156 - HOIST
      ?auto_406153 - PLACE
      ?auto_406157 - TRUCK
      ?auto_406155 - PLACE
      ?auto_406154 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_406156 ?auto_406153 ) ( SURFACE-AT ?auto_406151 ?auto_406153 ) ( CLEAR ?auto_406151 ) ( IS-CRATE ?auto_406152 ) ( not ( = ?auto_406151 ?auto_406152 ) ) ( AVAILABLE ?auto_406156 ) ( ON ?auto_406151 ?auto_406149 ) ( not ( = ?auto_406149 ?auto_406151 ) ) ( not ( = ?auto_406149 ?auto_406152 ) ) ( TRUCK-AT ?auto_406157 ?auto_406155 ) ( not ( = ?auto_406155 ?auto_406153 ) ) ( HOIST-AT ?auto_406154 ?auto_406155 ) ( LIFTING ?auto_406154 ?auto_406152 ) ( not ( = ?auto_406156 ?auto_406154 ) ) ( ON ?auto_406147 ?auto_406146 ) ( ON ?auto_406148 ?auto_406147 ) ( ON ?auto_406150 ?auto_406148 ) ( ON ?auto_406149 ?auto_406150 ) ( not ( = ?auto_406146 ?auto_406147 ) ) ( not ( = ?auto_406146 ?auto_406148 ) ) ( not ( = ?auto_406146 ?auto_406150 ) ) ( not ( = ?auto_406146 ?auto_406149 ) ) ( not ( = ?auto_406146 ?auto_406151 ) ) ( not ( = ?auto_406146 ?auto_406152 ) ) ( not ( = ?auto_406147 ?auto_406148 ) ) ( not ( = ?auto_406147 ?auto_406150 ) ) ( not ( = ?auto_406147 ?auto_406149 ) ) ( not ( = ?auto_406147 ?auto_406151 ) ) ( not ( = ?auto_406147 ?auto_406152 ) ) ( not ( = ?auto_406148 ?auto_406150 ) ) ( not ( = ?auto_406148 ?auto_406149 ) ) ( not ( = ?auto_406148 ?auto_406151 ) ) ( not ( = ?auto_406148 ?auto_406152 ) ) ( not ( = ?auto_406150 ?auto_406149 ) ) ( not ( = ?auto_406150 ?auto_406151 ) ) ( not ( = ?auto_406150 ?auto_406152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406149 ?auto_406151 ?auto_406152 )
      ( MAKE-6CRATE-VERIFY ?auto_406146 ?auto_406147 ?auto_406148 ?auto_406150 ?auto_406149 ?auto_406151 ?auto_406152 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406209 - SURFACE
      ?auto_406210 - SURFACE
      ?auto_406211 - SURFACE
      ?auto_406213 - SURFACE
      ?auto_406212 - SURFACE
      ?auto_406214 - SURFACE
      ?auto_406215 - SURFACE
    )
    :vars
    (
      ?auto_406216 - HOIST
      ?auto_406221 - PLACE
      ?auto_406220 - TRUCK
      ?auto_406218 - PLACE
      ?auto_406219 - HOIST
      ?auto_406217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406216 ?auto_406221 ) ( SURFACE-AT ?auto_406214 ?auto_406221 ) ( CLEAR ?auto_406214 ) ( IS-CRATE ?auto_406215 ) ( not ( = ?auto_406214 ?auto_406215 ) ) ( AVAILABLE ?auto_406216 ) ( ON ?auto_406214 ?auto_406212 ) ( not ( = ?auto_406212 ?auto_406214 ) ) ( not ( = ?auto_406212 ?auto_406215 ) ) ( TRUCK-AT ?auto_406220 ?auto_406218 ) ( not ( = ?auto_406218 ?auto_406221 ) ) ( HOIST-AT ?auto_406219 ?auto_406218 ) ( not ( = ?auto_406216 ?auto_406219 ) ) ( AVAILABLE ?auto_406219 ) ( SURFACE-AT ?auto_406215 ?auto_406218 ) ( ON ?auto_406215 ?auto_406217 ) ( CLEAR ?auto_406215 ) ( not ( = ?auto_406214 ?auto_406217 ) ) ( not ( = ?auto_406215 ?auto_406217 ) ) ( not ( = ?auto_406212 ?auto_406217 ) ) ( ON ?auto_406210 ?auto_406209 ) ( ON ?auto_406211 ?auto_406210 ) ( ON ?auto_406213 ?auto_406211 ) ( ON ?auto_406212 ?auto_406213 ) ( not ( = ?auto_406209 ?auto_406210 ) ) ( not ( = ?auto_406209 ?auto_406211 ) ) ( not ( = ?auto_406209 ?auto_406213 ) ) ( not ( = ?auto_406209 ?auto_406212 ) ) ( not ( = ?auto_406209 ?auto_406214 ) ) ( not ( = ?auto_406209 ?auto_406215 ) ) ( not ( = ?auto_406209 ?auto_406217 ) ) ( not ( = ?auto_406210 ?auto_406211 ) ) ( not ( = ?auto_406210 ?auto_406213 ) ) ( not ( = ?auto_406210 ?auto_406212 ) ) ( not ( = ?auto_406210 ?auto_406214 ) ) ( not ( = ?auto_406210 ?auto_406215 ) ) ( not ( = ?auto_406210 ?auto_406217 ) ) ( not ( = ?auto_406211 ?auto_406213 ) ) ( not ( = ?auto_406211 ?auto_406212 ) ) ( not ( = ?auto_406211 ?auto_406214 ) ) ( not ( = ?auto_406211 ?auto_406215 ) ) ( not ( = ?auto_406211 ?auto_406217 ) ) ( not ( = ?auto_406213 ?auto_406212 ) ) ( not ( = ?auto_406213 ?auto_406214 ) ) ( not ( = ?auto_406213 ?auto_406215 ) ) ( not ( = ?auto_406213 ?auto_406217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406212 ?auto_406214 ?auto_406215 )
      ( MAKE-6CRATE-VERIFY ?auto_406209 ?auto_406210 ?auto_406211 ?auto_406213 ?auto_406212 ?auto_406214 ?auto_406215 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406273 - SURFACE
      ?auto_406274 - SURFACE
      ?auto_406275 - SURFACE
      ?auto_406277 - SURFACE
      ?auto_406276 - SURFACE
      ?auto_406278 - SURFACE
      ?auto_406279 - SURFACE
    )
    :vars
    (
      ?auto_406284 - HOIST
      ?auto_406280 - PLACE
      ?auto_406283 - PLACE
      ?auto_406281 - HOIST
      ?auto_406285 - SURFACE
      ?auto_406282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406284 ?auto_406280 ) ( SURFACE-AT ?auto_406278 ?auto_406280 ) ( CLEAR ?auto_406278 ) ( IS-CRATE ?auto_406279 ) ( not ( = ?auto_406278 ?auto_406279 ) ) ( AVAILABLE ?auto_406284 ) ( ON ?auto_406278 ?auto_406276 ) ( not ( = ?auto_406276 ?auto_406278 ) ) ( not ( = ?auto_406276 ?auto_406279 ) ) ( not ( = ?auto_406283 ?auto_406280 ) ) ( HOIST-AT ?auto_406281 ?auto_406283 ) ( not ( = ?auto_406284 ?auto_406281 ) ) ( AVAILABLE ?auto_406281 ) ( SURFACE-AT ?auto_406279 ?auto_406283 ) ( ON ?auto_406279 ?auto_406285 ) ( CLEAR ?auto_406279 ) ( not ( = ?auto_406278 ?auto_406285 ) ) ( not ( = ?auto_406279 ?auto_406285 ) ) ( not ( = ?auto_406276 ?auto_406285 ) ) ( TRUCK-AT ?auto_406282 ?auto_406280 ) ( ON ?auto_406274 ?auto_406273 ) ( ON ?auto_406275 ?auto_406274 ) ( ON ?auto_406277 ?auto_406275 ) ( ON ?auto_406276 ?auto_406277 ) ( not ( = ?auto_406273 ?auto_406274 ) ) ( not ( = ?auto_406273 ?auto_406275 ) ) ( not ( = ?auto_406273 ?auto_406277 ) ) ( not ( = ?auto_406273 ?auto_406276 ) ) ( not ( = ?auto_406273 ?auto_406278 ) ) ( not ( = ?auto_406273 ?auto_406279 ) ) ( not ( = ?auto_406273 ?auto_406285 ) ) ( not ( = ?auto_406274 ?auto_406275 ) ) ( not ( = ?auto_406274 ?auto_406277 ) ) ( not ( = ?auto_406274 ?auto_406276 ) ) ( not ( = ?auto_406274 ?auto_406278 ) ) ( not ( = ?auto_406274 ?auto_406279 ) ) ( not ( = ?auto_406274 ?auto_406285 ) ) ( not ( = ?auto_406275 ?auto_406277 ) ) ( not ( = ?auto_406275 ?auto_406276 ) ) ( not ( = ?auto_406275 ?auto_406278 ) ) ( not ( = ?auto_406275 ?auto_406279 ) ) ( not ( = ?auto_406275 ?auto_406285 ) ) ( not ( = ?auto_406277 ?auto_406276 ) ) ( not ( = ?auto_406277 ?auto_406278 ) ) ( not ( = ?auto_406277 ?auto_406279 ) ) ( not ( = ?auto_406277 ?auto_406285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406276 ?auto_406278 ?auto_406279 )
      ( MAKE-6CRATE-VERIFY ?auto_406273 ?auto_406274 ?auto_406275 ?auto_406277 ?auto_406276 ?auto_406278 ?auto_406279 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406337 - SURFACE
      ?auto_406338 - SURFACE
      ?auto_406339 - SURFACE
      ?auto_406341 - SURFACE
      ?auto_406340 - SURFACE
      ?auto_406342 - SURFACE
      ?auto_406343 - SURFACE
    )
    :vars
    (
      ?auto_406344 - HOIST
      ?auto_406349 - PLACE
      ?auto_406345 - PLACE
      ?auto_406348 - HOIST
      ?auto_406347 - SURFACE
      ?auto_406346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406344 ?auto_406349 ) ( IS-CRATE ?auto_406343 ) ( not ( = ?auto_406342 ?auto_406343 ) ) ( not ( = ?auto_406340 ?auto_406342 ) ) ( not ( = ?auto_406340 ?auto_406343 ) ) ( not ( = ?auto_406345 ?auto_406349 ) ) ( HOIST-AT ?auto_406348 ?auto_406345 ) ( not ( = ?auto_406344 ?auto_406348 ) ) ( AVAILABLE ?auto_406348 ) ( SURFACE-AT ?auto_406343 ?auto_406345 ) ( ON ?auto_406343 ?auto_406347 ) ( CLEAR ?auto_406343 ) ( not ( = ?auto_406342 ?auto_406347 ) ) ( not ( = ?auto_406343 ?auto_406347 ) ) ( not ( = ?auto_406340 ?auto_406347 ) ) ( TRUCK-AT ?auto_406346 ?auto_406349 ) ( SURFACE-AT ?auto_406340 ?auto_406349 ) ( CLEAR ?auto_406340 ) ( LIFTING ?auto_406344 ?auto_406342 ) ( IS-CRATE ?auto_406342 ) ( ON ?auto_406338 ?auto_406337 ) ( ON ?auto_406339 ?auto_406338 ) ( ON ?auto_406341 ?auto_406339 ) ( ON ?auto_406340 ?auto_406341 ) ( not ( = ?auto_406337 ?auto_406338 ) ) ( not ( = ?auto_406337 ?auto_406339 ) ) ( not ( = ?auto_406337 ?auto_406341 ) ) ( not ( = ?auto_406337 ?auto_406340 ) ) ( not ( = ?auto_406337 ?auto_406342 ) ) ( not ( = ?auto_406337 ?auto_406343 ) ) ( not ( = ?auto_406337 ?auto_406347 ) ) ( not ( = ?auto_406338 ?auto_406339 ) ) ( not ( = ?auto_406338 ?auto_406341 ) ) ( not ( = ?auto_406338 ?auto_406340 ) ) ( not ( = ?auto_406338 ?auto_406342 ) ) ( not ( = ?auto_406338 ?auto_406343 ) ) ( not ( = ?auto_406338 ?auto_406347 ) ) ( not ( = ?auto_406339 ?auto_406341 ) ) ( not ( = ?auto_406339 ?auto_406340 ) ) ( not ( = ?auto_406339 ?auto_406342 ) ) ( not ( = ?auto_406339 ?auto_406343 ) ) ( not ( = ?auto_406339 ?auto_406347 ) ) ( not ( = ?auto_406341 ?auto_406340 ) ) ( not ( = ?auto_406341 ?auto_406342 ) ) ( not ( = ?auto_406341 ?auto_406343 ) ) ( not ( = ?auto_406341 ?auto_406347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406340 ?auto_406342 ?auto_406343 )
      ( MAKE-6CRATE-VERIFY ?auto_406337 ?auto_406338 ?auto_406339 ?auto_406341 ?auto_406340 ?auto_406342 ?auto_406343 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_406401 - SURFACE
      ?auto_406402 - SURFACE
      ?auto_406403 - SURFACE
      ?auto_406405 - SURFACE
      ?auto_406404 - SURFACE
      ?auto_406406 - SURFACE
      ?auto_406407 - SURFACE
    )
    :vars
    (
      ?auto_406413 - HOIST
      ?auto_406410 - PLACE
      ?auto_406409 - PLACE
      ?auto_406408 - HOIST
      ?auto_406411 - SURFACE
      ?auto_406412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_406413 ?auto_406410 ) ( IS-CRATE ?auto_406407 ) ( not ( = ?auto_406406 ?auto_406407 ) ) ( not ( = ?auto_406404 ?auto_406406 ) ) ( not ( = ?auto_406404 ?auto_406407 ) ) ( not ( = ?auto_406409 ?auto_406410 ) ) ( HOIST-AT ?auto_406408 ?auto_406409 ) ( not ( = ?auto_406413 ?auto_406408 ) ) ( AVAILABLE ?auto_406408 ) ( SURFACE-AT ?auto_406407 ?auto_406409 ) ( ON ?auto_406407 ?auto_406411 ) ( CLEAR ?auto_406407 ) ( not ( = ?auto_406406 ?auto_406411 ) ) ( not ( = ?auto_406407 ?auto_406411 ) ) ( not ( = ?auto_406404 ?auto_406411 ) ) ( TRUCK-AT ?auto_406412 ?auto_406410 ) ( SURFACE-AT ?auto_406404 ?auto_406410 ) ( CLEAR ?auto_406404 ) ( IS-CRATE ?auto_406406 ) ( AVAILABLE ?auto_406413 ) ( IN ?auto_406406 ?auto_406412 ) ( ON ?auto_406402 ?auto_406401 ) ( ON ?auto_406403 ?auto_406402 ) ( ON ?auto_406405 ?auto_406403 ) ( ON ?auto_406404 ?auto_406405 ) ( not ( = ?auto_406401 ?auto_406402 ) ) ( not ( = ?auto_406401 ?auto_406403 ) ) ( not ( = ?auto_406401 ?auto_406405 ) ) ( not ( = ?auto_406401 ?auto_406404 ) ) ( not ( = ?auto_406401 ?auto_406406 ) ) ( not ( = ?auto_406401 ?auto_406407 ) ) ( not ( = ?auto_406401 ?auto_406411 ) ) ( not ( = ?auto_406402 ?auto_406403 ) ) ( not ( = ?auto_406402 ?auto_406405 ) ) ( not ( = ?auto_406402 ?auto_406404 ) ) ( not ( = ?auto_406402 ?auto_406406 ) ) ( not ( = ?auto_406402 ?auto_406407 ) ) ( not ( = ?auto_406402 ?auto_406411 ) ) ( not ( = ?auto_406403 ?auto_406405 ) ) ( not ( = ?auto_406403 ?auto_406404 ) ) ( not ( = ?auto_406403 ?auto_406406 ) ) ( not ( = ?auto_406403 ?auto_406407 ) ) ( not ( = ?auto_406403 ?auto_406411 ) ) ( not ( = ?auto_406405 ?auto_406404 ) ) ( not ( = ?auto_406405 ?auto_406406 ) ) ( not ( = ?auto_406405 ?auto_406407 ) ) ( not ( = ?auto_406405 ?auto_406411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_406404 ?auto_406406 ?auto_406407 )
      ( MAKE-6CRATE-VERIFY ?auto_406401 ?auto_406402 ?auto_406403 ?auto_406405 ?auto_406404 ?auto_406406 ?auto_406407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_406871 - SURFACE
      ?auto_406872 - SURFACE
    )
    :vars
    (
      ?auto_406876 - HOIST
      ?auto_406875 - PLACE
      ?auto_406873 - SURFACE
      ?auto_406874 - TRUCK
      ?auto_406877 - PLACE
      ?auto_406878 - HOIST
      ?auto_406879 - SURFACE
      ?auto_406880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_406876 ?auto_406875 ) ( SURFACE-AT ?auto_406871 ?auto_406875 ) ( CLEAR ?auto_406871 ) ( IS-CRATE ?auto_406872 ) ( not ( = ?auto_406871 ?auto_406872 ) ) ( AVAILABLE ?auto_406876 ) ( ON ?auto_406871 ?auto_406873 ) ( not ( = ?auto_406873 ?auto_406871 ) ) ( not ( = ?auto_406873 ?auto_406872 ) ) ( TRUCK-AT ?auto_406874 ?auto_406877 ) ( not ( = ?auto_406877 ?auto_406875 ) ) ( HOIST-AT ?auto_406878 ?auto_406877 ) ( not ( = ?auto_406876 ?auto_406878 ) ) ( SURFACE-AT ?auto_406872 ?auto_406877 ) ( ON ?auto_406872 ?auto_406879 ) ( CLEAR ?auto_406872 ) ( not ( = ?auto_406871 ?auto_406879 ) ) ( not ( = ?auto_406872 ?auto_406879 ) ) ( not ( = ?auto_406873 ?auto_406879 ) ) ( LIFTING ?auto_406878 ?auto_406880 ) ( IS-CRATE ?auto_406880 ) ( not ( = ?auto_406871 ?auto_406880 ) ) ( not ( = ?auto_406872 ?auto_406880 ) ) ( not ( = ?auto_406873 ?auto_406880 ) ) ( not ( = ?auto_406879 ?auto_406880 ) ) )
    :subtasks
    ( ( !LOAD ?auto_406878 ?auto_406880 ?auto_406874 ?auto_406877 )
      ( MAKE-1CRATE ?auto_406871 ?auto_406872 )
      ( MAKE-1CRATE-VERIFY ?auto_406871 ?auto_406872 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408350 - SURFACE
      ?auto_408351 - SURFACE
      ?auto_408352 - SURFACE
      ?auto_408354 - SURFACE
      ?auto_408353 - SURFACE
      ?auto_408355 - SURFACE
      ?auto_408356 - SURFACE
      ?auto_408357 - SURFACE
    )
    :vars
    (
      ?auto_408358 - HOIST
      ?auto_408359 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_408358 ?auto_408359 ) ( SURFACE-AT ?auto_408356 ?auto_408359 ) ( CLEAR ?auto_408356 ) ( LIFTING ?auto_408358 ?auto_408357 ) ( IS-CRATE ?auto_408357 ) ( not ( = ?auto_408356 ?auto_408357 ) ) ( ON ?auto_408351 ?auto_408350 ) ( ON ?auto_408352 ?auto_408351 ) ( ON ?auto_408354 ?auto_408352 ) ( ON ?auto_408353 ?auto_408354 ) ( ON ?auto_408355 ?auto_408353 ) ( ON ?auto_408356 ?auto_408355 ) ( not ( = ?auto_408350 ?auto_408351 ) ) ( not ( = ?auto_408350 ?auto_408352 ) ) ( not ( = ?auto_408350 ?auto_408354 ) ) ( not ( = ?auto_408350 ?auto_408353 ) ) ( not ( = ?auto_408350 ?auto_408355 ) ) ( not ( = ?auto_408350 ?auto_408356 ) ) ( not ( = ?auto_408350 ?auto_408357 ) ) ( not ( = ?auto_408351 ?auto_408352 ) ) ( not ( = ?auto_408351 ?auto_408354 ) ) ( not ( = ?auto_408351 ?auto_408353 ) ) ( not ( = ?auto_408351 ?auto_408355 ) ) ( not ( = ?auto_408351 ?auto_408356 ) ) ( not ( = ?auto_408351 ?auto_408357 ) ) ( not ( = ?auto_408352 ?auto_408354 ) ) ( not ( = ?auto_408352 ?auto_408353 ) ) ( not ( = ?auto_408352 ?auto_408355 ) ) ( not ( = ?auto_408352 ?auto_408356 ) ) ( not ( = ?auto_408352 ?auto_408357 ) ) ( not ( = ?auto_408354 ?auto_408353 ) ) ( not ( = ?auto_408354 ?auto_408355 ) ) ( not ( = ?auto_408354 ?auto_408356 ) ) ( not ( = ?auto_408354 ?auto_408357 ) ) ( not ( = ?auto_408353 ?auto_408355 ) ) ( not ( = ?auto_408353 ?auto_408356 ) ) ( not ( = ?auto_408353 ?auto_408357 ) ) ( not ( = ?auto_408355 ?auto_408356 ) ) ( not ( = ?auto_408355 ?auto_408357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_408356 ?auto_408357 )
      ( MAKE-7CRATE-VERIFY ?auto_408350 ?auto_408351 ?auto_408352 ?auto_408354 ?auto_408353 ?auto_408355 ?auto_408356 ?auto_408357 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408405 - SURFACE
      ?auto_408406 - SURFACE
      ?auto_408407 - SURFACE
      ?auto_408409 - SURFACE
      ?auto_408408 - SURFACE
      ?auto_408410 - SURFACE
      ?auto_408411 - SURFACE
      ?auto_408412 - SURFACE
    )
    :vars
    (
      ?auto_408413 - HOIST
      ?auto_408415 - PLACE
      ?auto_408414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_408413 ?auto_408415 ) ( SURFACE-AT ?auto_408411 ?auto_408415 ) ( CLEAR ?auto_408411 ) ( IS-CRATE ?auto_408412 ) ( not ( = ?auto_408411 ?auto_408412 ) ) ( TRUCK-AT ?auto_408414 ?auto_408415 ) ( AVAILABLE ?auto_408413 ) ( IN ?auto_408412 ?auto_408414 ) ( ON ?auto_408411 ?auto_408410 ) ( not ( = ?auto_408410 ?auto_408411 ) ) ( not ( = ?auto_408410 ?auto_408412 ) ) ( ON ?auto_408406 ?auto_408405 ) ( ON ?auto_408407 ?auto_408406 ) ( ON ?auto_408409 ?auto_408407 ) ( ON ?auto_408408 ?auto_408409 ) ( ON ?auto_408410 ?auto_408408 ) ( not ( = ?auto_408405 ?auto_408406 ) ) ( not ( = ?auto_408405 ?auto_408407 ) ) ( not ( = ?auto_408405 ?auto_408409 ) ) ( not ( = ?auto_408405 ?auto_408408 ) ) ( not ( = ?auto_408405 ?auto_408410 ) ) ( not ( = ?auto_408405 ?auto_408411 ) ) ( not ( = ?auto_408405 ?auto_408412 ) ) ( not ( = ?auto_408406 ?auto_408407 ) ) ( not ( = ?auto_408406 ?auto_408409 ) ) ( not ( = ?auto_408406 ?auto_408408 ) ) ( not ( = ?auto_408406 ?auto_408410 ) ) ( not ( = ?auto_408406 ?auto_408411 ) ) ( not ( = ?auto_408406 ?auto_408412 ) ) ( not ( = ?auto_408407 ?auto_408409 ) ) ( not ( = ?auto_408407 ?auto_408408 ) ) ( not ( = ?auto_408407 ?auto_408410 ) ) ( not ( = ?auto_408407 ?auto_408411 ) ) ( not ( = ?auto_408407 ?auto_408412 ) ) ( not ( = ?auto_408409 ?auto_408408 ) ) ( not ( = ?auto_408409 ?auto_408410 ) ) ( not ( = ?auto_408409 ?auto_408411 ) ) ( not ( = ?auto_408409 ?auto_408412 ) ) ( not ( = ?auto_408408 ?auto_408410 ) ) ( not ( = ?auto_408408 ?auto_408411 ) ) ( not ( = ?auto_408408 ?auto_408412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408410 ?auto_408411 ?auto_408412 )
      ( MAKE-7CRATE-VERIFY ?auto_408405 ?auto_408406 ?auto_408407 ?auto_408409 ?auto_408408 ?auto_408410 ?auto_408411 ?auto_408412 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408468 - SURFACE
      ?auto_408469 - SURFACE
      ?auto_408470 - SURFACE
      ?auto_408472 - SURFACE
      ?auto_408471 - SURFACE
      ?auto_408473 - SURFACE
      ?auto_408474 - SURFACE
      ?auto_408475 - SURFACE
    )
    :vars
    (
      ?auto_408479 - HOIST
      ?auto_408478 - PLACE
      ?auto_408476 - TRUCK
      ?auto_408477 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_408479 ?auto_408478 ) ( SURFACE-AT ?auto_408474 ?auto_408478 ) ( CLEAR ?auto_408474 ) ( IS-CRATE ?auto_408475 ) ( not ( = ?auto_408474 ?auto_408475 ) ) ( AVAILABLE ?auto_408479 ) ( IN ?auto_408475 ?auto_408476 ) ( ON ?auto_408474 ?auto_408473 ) ( not ( = ?auto_408473 ?auto_408474 ) ) ( not ( = ?auto_408473 ?auto_408475 ) ) ( TRUCK-AT ?auto_408476 ?auto_408477 ) ( not ( = ?auto_408477 ?auto_408478 ) ) ( ON ?auto_408469 ?auto_408468 ) ( ON ?auto_408470 ?auto_408469 ) ( ON ?auto_408472 ?auto_408470 ) ( ON ?auto_408471 ?auto_408472 ) ( ON ?auto_408473 ?auto_408471 ) ( not ( = ?auto_408468 ?auto_408469 ) ) ( not ( = ?auto_408468 ?auto_408470 ) ) ( not ( = ?auto_408468 ?auto_408472 ) ) ( not ( = ?auto_408468 ?auto_408471 ) ) ( not ( = ?auto_408468 ?auto_408473 ) ) ( not ( = ?auto_408468 ?auto_408474 ) ) ( not ( = ?auto_408468 ?auto_408475 ) ) ( not ( = ?auto_408469 ?auto_408470 ) ) ( not ( = ?auto_408469 ?auto_408472 ) ) ( not ( = ?auto_408469 ?auto_408471 ) ) ( not ( = ?auto_408469 ?auto_408473 ) ) ( not ( = ?auto_408469 ?auto_408474 ) ) ( not ( = ?auto_408469 ?auto_408475 ) ) ( not ( = ?auto_408470 ?auto_408472 ) ) ( not ( = ?auto_408470 ?auto_408471 ) ) ( not ( = ?auto_408470 ?auto_408473 ) ) ( not ( = ?auto_408470 ?auto_408474 ) ) ( not ( = ?auto_408470 ?auto_408475 ) ) ( not ( = ?auto_408472 ?auto_408471 ) ) ( not ( = ?auto_408472 ?auto_408473 ) ) ( not ( = ?auto_408472 ?auto_408474 ) ) ( not ( = ?auto_408472 ?auto_408475 ) ) ( not ( = ?auto_408471 ?auto_408473 ) ) ( not ( = ?auto_408471 ?auto_408474 ) ) ( not ( = ?auto_408471 ?auto_408475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408473 ?auto_408474 ?auto_408475 )
      ( MAKE-7CRATE-VERIFY ?auto_408468 ?auto_408469 ?auto_408470 ?auto_408472 ?auto_408471 ?auto_408473 ?auto_408474 ?auto_408475 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408538 - SURFACE
      ?auto_408539 - SURFACE
      ?auto_408540 - SURFACE
      ?auto_408542 - SURFACE
      ?auto_408541 - SURFACE
      ?auto_408543 - SURFACE
      ?auto_408544 - SURFACE
      ?auto_408545 - SURFACE
    )
    :vars
    (
      ?auto_408547 - HOIST
      ?auto_408550 - PLACE
      ?auto_408549 - TRUCK
      ?auto_408548 - PLACE
      ?auto_408546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_408547 ?auto_408550 ) ( SURFACE-AT ?auto_408544 ?auto_408550 ) ( CLEAR ?auto_408544 ) ( IS-CRATE ?auto_408545 ) ( not ( = ?auto_408544 ?auto_408545 ) ) ( AVAILABLE ?auto_408547 ) ( ON ?auto_408544 ?auto_408543 ) ( not ( = ?auto_408543 ?auto_408544 ) ) ( not ( = ?auto_408543 ?auto_408545 ) ) ( TRUCK-AT ?auto_408549 ?auto_408548 ) ( not ( = ?auto_408548 ?auto_408550 ) ) ( HOIST-AT ?auto_408546 ?auto_408548 ) ( LIFTING ?auto_408546 ?auto_408545 ) ( not ( = ?auto_408547 ?auto_408546 ) ) ( ON ?auto_408539 ?auto_408538 ) ( ON ?auto_408540 ?auto_408539 ) ( ON ?auto_408542 ?auto_408540 ) ( ON ?auto_408541 ?auto_408542 ) ( ON ?auto_408543 ?auto_408541 ) ( not ( = ?auto_408538 ?auto_408539 ) ) ( not ( = ?auto_408538 ?auto_408540 ) ) ( not ( = ?auto_408538 ?auto_408542 ) ) ( not ( = ?auto_408538 ?auto_408541 ) ) ( not ( = ?auto_408538 ?auto_408543 ) ) ( not ( = ?auto_408538 ?auto_408544 ) ) ( not ( = ?auto_408538 ?auto_408545 ) ) ( not ( = ?auto_408539 ?auto_408540 ) ) ( not ( = ?auto_408539 ?auto_408542 ) ) ( not ( = ?auto_408539 ?auto_408541 ) ) ( not ( = ?auto_408539 ?auto_408543 ) ) ( not ( = ?auto_408539 ?auto_408544 ) ) ( not ( = ?auto_408539 ?auto_408545 ) ) ( not ( = ?auto_408540 ?auto_408542 ) ) ( not ( = ?auto_408540 ?auto_408541 ) ) ( not ( = ?auto_408540 ?auto_408543 ) ) ( not ( = ?auto_408540 ?auto_408544 ) ) ( not ( = ?auto_408540 ?auto_408545 ) ) ( not ( = ?auto_408542 ?auto_408541 ) ) ( not ( = ?auto_408542 ?auto_408543 ) ) ( not ( = ?auto_408542 ?auto_408544 ) ) ( not ( = ?auto_408542 ?auto_408545 ) ) ( not ( = ?auto_408541 ?auto_408543 ) ) ( not ( = ?auto_408541 ?auto_408544 ) ) ( not ( = ?auto_408541 ?auto_408545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408543 ?auto_408544 ?auto_408545 )
      ( MAKE-7CRATE-VERIFY ?auto_408538 ?auto_408539 ?auto_408540 ?auto_408542 ?auto_408541 ?auto_408543 ?auto_408544 ?auto_408545 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408615 - SURFACE
      ?auto_408616 - SURFACE
      ?auto_408617 - SURFACE
      ?auto_408619 - SURFACE
      ?auto_408618 - SURFACE
      ?auto_408620 - SURFACE
      ?auto_408621 - SURFACE
      ?auto_408622 - SURFACE
    )
    :vars
    (
      ?auto_408628 - HOIST
      ?auto_408627 - PLACE
      ?auto_408623 - TRUCK
      ?auto_408626 - PLACE
      ?auto_408624 - HOIST
      ?auto_408625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_408628 ?auto_408627 ) ( SURFACE-AT ?auto_408621 ?auto_408627 ) ( CLEAR ?auto_408621 ) ( IS-CRATE ?auto_408622 ) ( not ( = ?auto_408621 ?auto_408622 ) ) ( AVAILABLE ?auto_408628 ) ( ON ?auto_408621 ?auto_408620 ) ( not ( = ?auto_408620 ?auto_408621 ) ) ( not ( = ?auto_408620 ?auto_408622 ) ) ( TRUCK-AT ?auto_408623 ?auto_408626 ) ( not ( = ?auto_408626 ?auto_408627 ) ) ( HOIST-AT ?auto_408624 ?auto_408626 ) ( not ( = ?auto_408628 ?auto_408624 ) ) ( AVAILABLE ?auto_408624 ) ( SURFACE-AT ?auto_408622 ?auto_408626 ) ( ON ?auto_408622 ?auto_408625 ) ( CLEAR ?auto_408622 ) ( not ( = ?auto_408621 ?auto_408625 ) ) ( not ( = ?auto_408622 ?auto_408625 ) ) ( not ( = ?auto_408620 ?auto_408625 ) ) ( ON ?auto_408616 ?auto_408615 ) ( ON ?auto_408617 ?auto_408616 ) ( ON ?auto_408619 ?auto_408617 ) ( ON ?auto_408618 ?auto_408619 ) ( ON ?auto_408620 ?auto_408618 ) ( not ( = ?auto_408615 ?auto_408616 ) ) ( not ( = ?auto_408615 ?auto_408617 ) ) ( not ( = ?auto_408615 ?auto_408619 ) ) ( not ( = ?auto_408615 ?auto_408618 ) ) ( not ( = ?auto_408615 ?auto_408620 ) ) ( not ( = ?auto_408615 ?auto_408621 ) ) ( not ( = ?auto_408615 ?auto_408622 ) ) ( not ( = ?auto_408615 ?auto_408625 ) ) ( not ( = ?auto_408616 ?auto_408617 ) ) ( not ( = ?auto_408616 ?auto_408619 ) ) ( not ( = ?auto_408616 ?auto_408618 ) ) ( not ( = ?auto_408616 ?auto_408620 ) ) ( not ( = ?auto_408616 ?auto_408621 ) ) ( not ( = ?auto_408616 ?auto_408622 ) ) ( not ( = ?auto_408616 ?auto_408625 ) ) ( not ( = ?auto_408617 ?auto_408619 ) ) ( not ( = ?auto_408617 ?auto_408618 ) ) ( not ( = ?auto_408617 ?auto_408620 ) ) ( not ( = ?auto_408617 ?auto_408621 ) ) ( not ( = ?auto_408617 ?auto_408622 ) ) ( not ( = ?auto_408617 ?auto_408625 ) ) ( not ( = ?auto_408619 ?auto_408618 ) ) ( not ( = ?auto_408619 ?auto_408620 ) ) ( not ( = ?auto_408619 ?auto_408621 ) ) ( not ( = ?auto_408619 ?auto_408622 ) ) ( not ( = ?auto_408619 ?auto_408625 ) ) ( not ( = ?auto_408618 ?auto_408620 ) ) ( not ( = ?auto_408618 ?auto_408621 ) ) ( not ( = ?auto_408618 ?auto_408622 ) ) ( not ( = ?auto_408618 ?auto_408625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408620 ?auto_408621 ?auto_408622 )
      ( MAKE-7CRATE-VERIFY ?auto_408615 ?auto_408616 ?auto_408617 ?auto_408619 ?auto_408618 ?auto_408620 ?auto_408621 ?auto_408622 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408693 - SURFACE
      ?auto_408694 - SURFACE
      ?auto_408695 - SURFACE
      ?auto_408697 - SURFACE
      ?auto_408696 - SURFACE
      ?auto_408698 - SURFACE
      ?auto_408699 - SURFACE
      ?auto_408700 - SURFACE
    )
    :vars
    (
      ?auto_408701 - HOIST
      ?auto_408703 - PLACE
      ?auto_408706 - PLACE
      ?auto_408702 - HOIST
      ?auto_408705 - SURFACE
      ?auto_408704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_408701 ?auto_408703 ) ( SURFACE-AT ?auto_408699 ?auto_408703 ) ( CLEAR ?auto_408699 ) ( IS-CRATE ?auto_408700 ) ( not ( = ?auto_408699 ?auto_408700 ) ) ( AVAILABLE ?auto_408701 ) ( ON ?auto_408699 ?auto_408698 ) ( not ( = ?auto_408698 ?auto_408699 ) ) ( not ( = ?auto_408698 ?auto_408700 ) ) ( not ( = ?auto_408706 ?auto_408703 ) ) ( HOIST-AT ?auto_408702 ?auto_408706 ) ( not ( = ?auto_408701 ?auto_408702 ) ) ( AVAILABLE ?auto_408702 ) ( SURFACE-AT ?auto_408700 ?auto_408706 ) ( ON ?auto_408700 ?auto_408705 ) ( CLEAR ?auto_408700 ) ( not ( = ?auto_408699 ?auto_408705 ) ) ( not ( = ?auto_408700 ?auto_408705 ) ) ( not ( = ?auto_408698 ?auto_408705 ) ) ( TRUCK-AT ?auto_408704 ?auto_408703 ) ( ON ?auto_408694 ?auto_408693 ) ( ON ?auto_408695 ?auto_408694 ) ( ON ?auto_408697 ?auto_408695 ) ( ON ?auto_408696 ?auto_408697 ) ( ON ?auto_408698 ?auto_408696 ) ( not ( = ?auto_408693 ?auto_408694 ) ) ( not ( = ?auto_408693 ?auto_408695 ) ) ( not ( = ?auto_408693 ?auto_408697 ) ) ( not ( = ?auto_408693 ?auto_408696 ) ) ( not ( = ?auto_408693 ?auto_408698 ) ) ( not ( = ?auto_408693 ?auto_408699 ) ) ( not ( = ?auto_408693 ?auto_408700 ) ) ( not ( = ?auto_408693 ?auto_408705 ) ) ( not ( = ?auto_408694 ?auto_408695 ) ) ( not ( = ?auto_408694 ?auto_408697 ) ) ( not ( = ?auto_408694 ?auto_408696 ) ) ( not ( = ?auto_408694 ?auto_408698 ) ) ( not ( = ?auto_408694 ?auto_408699 ) ) ( not ( = ?auto_408694 ?auto_408700 ) ) ( not ( = ?auto_408694 ?auto_408705 ) ) ( not ( = ?auto_408695 ?auto_408697 ) ) ( not ( = ?auto_408695 ?auto_408696 ) ) ( not ( = ?auto_408695 ?auto_408698 ) ) ( not ( = ?auto_408695 ?auto_408699 ) ) ( not ( = ?auto_408695 ?auto_408700 ) ) ( not ( = ?auto_408695 ?auto_408705 ) ) ( not ( = ?auto_408697 ?auto_408696 ) ) ( not ( = ?auto_408697 ?auto_408698 ) ) ( not ( = ?auto_408697 ?auto_408699 ) ) ( not ( = ?auto_408697 ?auto_408700 ) ) ( not ( = ?auto_408697 ?auto_408705 ) ) ( not ( = ?auto_408696 ?auto_408698 ) ) ( not ( = ?auto_408696 ?auto_408699 ) ) ( not ( = ?auto_408696 ?auto_408700 ) ) ( not ( = ?auto_408696 ?auto_408705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408698 ?auto_408699 ?auto_408700 )
      ( MAKE-7CRATE-VERIFY ?auto_408693 ?auto_408694 ?auto_408695 ?auto_408697 ?auto_408696 ?auto_408698 ?auto_408699 ?auto_408700 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408771 - SURFACE
      ?auto_408772 - SURFACE
      ?auto_408773 - SURFACE
      ?auto_408775 - SURFACE
      ?auto_408774 - SURFACE
      ?auto_408776 - SURFACE
      ?auto_408777 - SURFACE
      ?auto_408778 - SURFACE
    )
    :vars
    (
      ?auto_408780 - HOIST
      ?auto_408783 - PLACE
      ?auto_408782 - PLACE
      ?auto_408779 - HOIST
      ?auto_408784 - SURFACE
      ?auto_408781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_408780 ?auto_408783 ) ( IS-CRATE ?auto_408778 ) ( not ( = ?auto_408777 ?auto_408778 ) ) ( not ( = ?auto_408776 ?auto_408777 ) ) ( not ( = ?auto_408776 ?auto_408778 ) ) ( not ( = ?auto_408782 ?auto_408783 ) ) ( HOIST-AT ?auto_408779 ?auto_408782 ) ( not ( = ?auto_408780 ?auto_408779 ) ) ( AVAILABLE ?auto_408779 ) ( SURFACE-AT ?auto_408778 ?auto_408782 ) ( ON ?auto_408778 ?auto_408784 ) ( CLEAR ?auto_408778 ) ( not ( = ?auto_408777 ?auto_408784 ) ) ( not ( = ?auto_408778 ?auto_408784 ) ) ( not ( = ?auto_408776 ?auto_408784 ) ) ( TRUCK-AT ?auto_408781 ?auto_408783 ) ( SURFACE-AT ?auto_408776 ?auto_408783 ) ( CLEAR ?auto_408776 ) ( LIFTING ?auto_408780 ?auto_408777 ) ( IS-CRATE ?auto_408777 ) ( ON ?auto_408772 ?auto_408771 ) ( ON ?auto_408773 ?auto_408772 ) ( ON ?auto_408775 ?auto_408773 ) ( ON ?auto_408774 ?auto_408775 ) ( ON ?auto_408776 ?auto_408774 ) ( not ( = ?auto_408771 ?auto_408772 ) ) ( not ( = ?auto_408771 ?auto_408773 ) ) ( not ( = ?auto_408771 ?auto_408775 ) ) ( not ( = ?auto_408771 ?auto_408774 ) ) ( not ( = ?auto_408771 ?auto_408776 ) ) ( not ( = ?auto_408771 ?auto_408777 ) ) ( not ( = ?auto_408771 ?auto_408778 ) ) ( not ( = ?auto_408771 ?auto_408784 ) ) ( not ( = ?auto_408772 ?auto_408773 ) ) ( not ( = ?auto_408772 ?auto_408775 ) ) ( not ( = ?auto_408772 ?auto_408774 ) ) ( not ( = ?auto_408772 ?auto_408776 ) ) ( not ( = ?auto_408772 ?auto_408777 ) ) ( not ( = ?auto_408772 ?auto_408778 ) ) ( not ( = ?auto_408772 ?auto_408784 ) ) ( not ( = ?auto_408773 ?auto_408775 ) ) ( not ( = ?auto_408773 ?auto_408774 ) ) ( not ( = ?auto_408773 ?auto_408776 ) ) ( not ( = ?auto_408773 ?auto_408777 ) ) ( not ( = ?auto_408773 ?auto_408778 ) ) ( not ( = ?auto_408773 ?auto_408784 ) ) ( not ( = ?auto_408775 ?auto_408774 ) ) ( not ( = ?auto_408775 ?auto_408776 ) ) ( not ( = ?auto_408775 ?auto_408777 ) ) ( not ( = ?auto_408775 ?auto_408778 ) ) ( not ( = ?auto_408775 ?auto_408784 ) ) ( not ( = ?auto_408774 ?auto_408776 ) ) ( not ( = ?auto_408774 ?auto_408777 ) ) ( not ( = ?auto_408774 ?auto_408778 ) ) ( not ( = ?auto_408774 ?auto_408784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408776 ?auto_408777 ?auto_408778 )
      ( MAKE-7CRATE-VERIFY ?auto_408771 ?auto_408772 ?auto_408773 ?auto_408775 ?auto_408774 ?auto_408776 ?auto_408777 ?auto_408778 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_408849 - SURFACE
      ?auto_408850 - SURFACE
      ?auto_408851 - SURFACE
      ?auto_408853 - SURFACE
      ?auto_408852 - SURFACE
      ?auto_408854 - SURFACE
      ?auto_408855 - SURFACE
      ?auto_408856 - SURFACE
    )
    :vars
    (
      ?auto_408860 - HOIST
      ?auto_408861 - PLACE
      ?auto_408862 - PLACE
      ?auto_408858 - HOIST
      ?auto_408857 - SURFACE
      ?auto_408859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_408860 ?auto_408861 ) ( IS-CRATE ?auto_408856 ) ( not ( = ?auto_408855 ?auto_408856 ) ) ( not ( = ?auto_408854 ?auto_408855 ) ) ( not ( = ?auto_408854 ?auto_408856 ) ) ( not ( = ?auto_408862 ?auto_408861 ) ) ( HOIST-AT ?auto_408858 ?auto_408862 ) ( not ( = ?auto_408860 ?auto_408858 ) ) ( AVAILABLE ?auto_408858 ) ( SURFACE-AT ?auto_408856 ?auto_408862 ) ( ON ?auto_408856 ?auto_408857 ) ( CLEAR ?auto_408856 ) ( not ( = ?auto_408855 ?auto_408857 ) ) ( not ( = ?auto_408856 ?auto_408857 ) ) ( not ( = ?auto_408854 ?auto_408857 ) ) ( TRUCK-AT ?auto_408859 ?auto_408861 ) ( SURFACE-AT ?auto_408854 ?auto_408861 ) ( CLEAR ?auto_408854 ) ( IS-CRATE ?auto_408855 ) ( AVAILABLE ?auto_408860 ) ( IN ?auto_408855 ?auto_408859 ) ( ON ?auto_408850 ?auto_408849 ) ( ON ?auto_408851 ?auto_408850 ) ( ON ?auto_408853 ?auto_408851 ) ( ON ?auto_408852 ?auto_408853 ) ( ON ?auto_408854 ?auto_408852 ) ( not ( = ?auto_408849 ?auto_408850 ) ) ( not ( = ?auto_408849 ?auto_408851 ) ) ( not ( = ?auto_408849 ?auto_408853 ) ) ( not ( = ?auto_408849 ?auto_408852 ) ) ( not ( = ?auto_408849 ?auto_408854 ) ) ( not ( = ?auto_408849 ?auto_408855 ) ) ( not ( = ?auto_408849 ?auto_408856 ) ) ( not ( = ?auto_408849 ?auto_408857 ) ) ( not ( = ?auto_408850 ?auto_408851 ) ) ( not ( = ?auto_408850 ?auto_408853 ) ) ( not ( = ?auto_408850 ?auto_408852 ) ) ( not ( = ?auto_408850 ?auto_408854 ) ) ( not ( = ?auto_408850 ?auto_408855 ) ) ( not ( = ?auto_408850 ?auto_408856 ) ) ( not ( = ?auto_408850 ?auto_408857 ) ) ( not ( = ?auto_408851 ?auto_408853 ) ) ( not ( = ?auto_408851 ?auto_408852 ) ) ( not ( = ?auto_408851 ?auto_408854 ) ) ( not ( = ?auto_408851 ?auto_408855 ) ) ( not ( = ?auto_408851 ?auto_408856 ) ) ( not ( = ?auto_408851 ?auto_408857 ) ) ( not ( = ?auto_408853 ?auto_408852 ) ) ( not ( = ?auto_408853 ?auto_408854 ) ) ( not ( = ?auto_408853 ?auto_408855 ) ) ( not ( = ?auto_408853 ?auto_408856 ) ) ( not ( = ?auto_408853 ?auto_408857 ) ) ( not ( = ?auto_408852 ?auto_408854 ) ) ( not ( = ?auto_408852 ?auto_408855 ) ) ( not ( = ?auto_408852 ?auto_408856 ) ) ( not ( = ?auto_408852 ?auto_408857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_408854 ?auto_408855 ?auto_408856 )
      ( MAKE-7CRATE-VERIFY ?auto_408849 ?auto_408850 ?auto_408851 ?auto_408853 ?auto_408852 ?auto_408854 ?auto_408855 ?auto_408856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_409926 - SURFACE
      ?auto_409927 - SURFACE
    )
    :vars
    (
      ?auto_409934 - HOIST
      ?auto_409932 - PLACE
      ?auto_409931 - SURFACE
      ?auto_409930 - PLACE
      ?auto_409929 - HOIST
      ?auto_409928 - SURFACE
      ?auto_409933 - TRUCK
      ?auto_409935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_409934 ?auto_409932 ) ( SURFACE-AT ?auto_409926 ?auto_409932 ) ( CLEAR ?auto_409926 ) ( IS-CRATE ?auto_409927 ) ( not ( = ?auto_409926 ?auto_409927 ) ) ( ON ?auto_409926 ?auto_409931 ) ( not ( = ?auto_409931 ?auto_409926 ) ) ( not ( = ?auto_409931 ?auto_409927 ) ) ( not ( = ?auto_409930 ?auto_409932 ) ) ( HOIST-AT ?auto_409929 ?auto_409930 ) ( not ( = ?auto_409934 ?auto_409929 ) ) ( AVAILABLE ?auto_409929 ) ( SURFACE-AT ?auto_409927 ?auto_409930 ) ( ON ?auto_409927 ?auto_409928 ) ( CLEAR ?auto_409927 ) ( not ( = ?auto_409926 ?auto_409928 ) ) ( not ( = ?auto_409927 ?auto_409928 ) ) ( not ( = ?auto_409931 ?auto_409928 ) ) ( TRUCK-AT ?auto_409933 ?auto_409932 ) ( LIFTING ?auto_409934 ?auto_409935 ) ( IS-CRATE ?auto_409935 ) ( not ( = ?auto_409926 ?auto_409935 ) ) ( not ( = ?auto_409927 ?auto_409935 ) ) ( not ( = ?auto_409931 ?auto_409935 ) ) ( not ( = ?auto_409928 ?auto_409935 ) ) )
    :subtasks
    ( ( !LOAD ?auto_409934 ?auto_409935 ?auto_409933 ?auto_409932 )
      ( MAKE-1CRATE ?auto_409926 ?auto_409927 )
      ( MAKE-1CRATE-VERIFY ?auto_409926 ?auto_409927 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_411759 - SURFACE
      ?auto_411760 - SURFACE
      ?auto_411761 - SURFACE
      ?auto_411763 - SURFACE
      ?auto_411762 - SURFACE
      ?auto_411764 - SURFACE
      ?auto_411765 - SURFACE
      ?auto_411766 - SURFACE
      ?auto_411767 - SURFACE
    )
    :vars
    (
      ?auto_411769 - HOIST
      ?auto_411768 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_411769 ?auto_411768 ) ( SURFACE-AT ?auto_411766 ?auto_411768 ) ( CLEAR ?auto_411766 ) ( LIFTING ?auto_411769 ?auto_411767 ) ( IS-CRATE ?auto_411767 ) ( not ( = ?auto_411766 ?auto_411767 ) ) ( ON ?auto_411760 ?auto_411759 ) ( ON ?auto_411761 ?auto_411760 ) ( ON ?auto_411763 ?auto_411761 ) ( ON ?auto_411762 ?auto_411763 ) ( ON ?auto_411764 ?auto_411762 ) ( ON ?auto_411765 ?auto_411764 ) ( ON ?auto_411766 ?auto_411765 ) ( not ( = ?auto_411759 ?auto_411760 ) ) ( not ( = ?auto_411759 ?auto_411761 ) ) ( not ( = ?auto_411759 ?auto_411763 ) ) ( not ( = ?auto_411759 ?auto_411762 ) ) ( not ( = ?auto_411759 ?auto_411764 ) ) ( not ( = ?auto_411759 ?auto_411765 ) ) ( not ( = ?auto_411759 ?auto_411766 ) ) ( not ( = ?auto_411759 ?auto_411767 ) ) ( not ( = ?auto_411760 ?auto_411761 ) ) ( not ( = ?auto_411760 ?auto_411763 ) ) ( not ( = ?auto_411760 ?auto_411762 ) ) ( not ( = ?auto_411760 ?auto_411764 ) ) ( not ( = ?auto_411760 ?auto_411765 ) ) ( not ( = ?auto_411760 ?auto_411766 ) ) ( not ( = ?auto_411760 ?auto_411767 ) ) ( not ( = ?auto_411761 ?auto_411763 ) ) ( not ( = ?auto_411761 ?auto_411762 ) ) ( not ( = ?auto_411761 ?auto_411764 ) ) ( not ( = ?auto_411761 ?auto_411765 ) ) ( not ( = ?auto_411761 ?auto_411766 ) ) ( not ( = ?auto_411761 ?auto_411767 ) ) ( not ( = ?auto_411763 ?auto_411762 ) ) ( not ( = ?auto_411763 ?auto_411764 ) ) ( not ( = ?auto_411763 ?auto_411765 ) ) ( not ( = ?auto_411763 ?auto_411766 ) ) ( not ( = ?auto_411763 ?auto_411767 ) ) ( not ( = ?auto_411762 ?auto_411764 ) ) ( not ( = ?auto_411762 ?auto_411765 ) ) ( not ( = ?auto_411762 ?auto_411766 ) ) ( not ( = ?auto_411762 ?auto_411767 ) ) ( not ( = ?auto_411764 ?auto_411765 ) ) ( not ( = ?auto_411764 ?auto_411766 ) ) ( not ( = ?auto_411764 ?auto_411767 ) ) ( not ( = ?auto_411765 ?auto_411766 ) ) ( not ( = ?auto_411765 ?auto_411767 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_411766 ?auto_411767 )
      ( MAKE-8CRATE-VERIFY ?auto_411759 ?auto_411760 ?auto_411761 ?auto_411763 ?auto_411762 ?auto_411764 ?auto_411765 ?auto_411766 ?auto_411767 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_411826 - SURFACE
      ?auto_411827 - SURFACE
      ?auto_411828 - SURFACE
      ?auto_411830 - SURFACE
      ?auto_411829 - SURFACE
      ?auto_411831 - SURFACE
      ?auto_411832 - SURFACE
      ?auto_411833 - SURFACE
      ?auto_411834 - SURFACE
    )
    :vars
    (
      ?auto_411837 - HOIST
      ?auto_411836 - PLACE
      ?auto_411835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_411837 ?auto_411836 ) ( SURFACE-AT ?auto_411833 ?auto_411836 ) ( CLEAR ?auto_411833 ) ( IS-CRATE ?auto_411834 ) ( not ( = ?auto_411833 ?auto_411834 ) ) ( TRUCK-AT ?auto_411835 ?auto_411836 ) ( AVAILABLE ?auto_411837 ) ( IN ?auto_411834 ?auto_411835 ) ( ON ?auto_411833 ?auto_411832 ) ( not ( = ?auto_411832 ?auto_411833 ) ) ( not ( = ?auto_411832 ?auto_411834 ) ) ( ON ?auto_411827 ?auto_411826 ) ( ON ?auto_411828 ?auto_411827 ) ( ON ?auto_411830 ?auto_411828 ) ( ON ?auto_411829 ?auto_411830 ) ( ON ?auto_411831 ?auto_411829 ) ( ON ?auto_411832 ?auto_411831 ) ( not ( = ?auto_411826 ?auto_411827 ) ) ( not ( = ?auto_411826 ?auto_411828 ) ) ( not ( = ?auto_411826 ?auto_411830 ) ) ( not ( = ?auto_411826 ?auto_411829 ) ) ( not ( = ?auto_411826 ?auto_411831 ) ) ( not ( = ?auto_411826 ?auto_411832 ) ) ( not ( = ?auto_411826 ?auto_411833 ) ) ( not ( = ?auto_411826 ?auto_411834 ) ) ( not ( = ?auto_411827 ?auto_411828 ) ) ( not ( = ?auto_411827 ?auto_411830 ) ) ( not ( = ?auto_411827 ?auto_411829 ) ) ( not ( = ?auto_411827 ?auto_411831 ) ) ( not ( = ?auto_411827 ?auto_411832 ) ) ( not ( = ?auto_411827 ?auto_411833 ) ) ( not ( = ?auto_411827 ?auto_411834 ) ) ( not ( = ?auto_411828 ?auto_411830 ) ) ( not ( = ?auto_411828 ?auto_411829 ) ) ( not ( = ?auto_411828 ?auto_411831 ) ) ( not ( = ?auto_411828 ?auto_411832 ) ) ( not ( = ?auto_411828 ?auto_411833 ) ) ( not ( = ?auto_411828 ?auto_411834 ) ) ( not ( = ?auto_411830 ?auto_411829 ) ) ( not ( = ?auto_411830 ?auto_411831 ) ) ( not ( = ?auto_411830 ?auto_411832 ) ) ( not ( = ?auto_411830 ?auto_411833 ) ) ( not ( = ?auto_411830 ?auto_411834 ) ) ( not ( = ?auto_411829 ?auto_411831 ) ) ( not ( = ?auto_411829 ?auto_411832 ) ) ( not ( = ?auto_411829 ?auto_411833 ) ) ( not ( = ?auto_411829 ?auto_411834 ) ) ( not ( = ?auto_411831 ?auto_411832 ) ) ( not ( = ?auto_411831 ?auto_411833 ) ) ( not ( = ?auto_411831 ?auto_411834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_411832 ?auto_411833 ?auto_411834 )
      ( MAKE-8CRATE-VERIFY ?auto_411826 ?auto_411827 ?auto_411828 ?auto_411830 ?auto_411829 ?auto_411831 ?auto_411832 ?auto_411833 ?auto_411834 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_411902 - SURFACE
      ?auto_411903 - SURFACE
      ?auto_411904 - SURFACE
      ?auto_411906 - SURFACE
      ?auto_411905 - SURFACE
      ?auto_411907 - SURFACE
      ?auto_411908 - SURFACE
      ?auto_411909 - SURFACE
      ?auto_411910 - SURFACE
    )
    :vars
    (
      ?auto_411914 - HOIST
      ?auto_411911 - PLACE
      ?auto_411913 - TRUCK
      ?auto_411912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_411914 ?auto_411911 ) ( SURFACE-AT ?auto_411909 ?auto_411911 ) ( CLEAR ?auto_411909 ) ( IS-CRATE ?auto_411910 ) ( not ( = ?auto_411909 ?auto_411910 ) ) ( AVAILABLE ?auto_411914 ) ( IN ?auto_411910 ?auto_411913 ) ( ON ?auto_411909 ?auto_411908 ) ( not ( = ?auto_411908 ?auto_411909 ) ) ( not ( = ?auto_411908 ?auto_411910 ) ) ( TRUCK-AT ?auto_411913 ?auto_411912 ) ( not ( = ?auto_411912 ?auto_411911 ) ) ( ON ?auto_411903 ?auto_411902 ) ( ON ?auto_411904 ?auto_411903 ) ( ON ?auto_411906 ?auto_411904 ) ( ON ?auto_411905 ?auto_411906 ) ( ON ?auto_411907 ?auto_411905 ) ( ON ?auto_411908 ?auto_411907 ) ( not ( = ?auto_411902 ?auto_411903 ) ) ( not ( = ?auto_411902 ?auto_411904 ) ) ( not ( = ?auto_411902 ?auto_411906 ) ) ( not ( = ?auto_411902 ?auto_411905 ) ) ( not ( = ?auto_411902 ?auto_411907 ) ) ( not ( = ?auto_411902 ?auto_411908 ) ) ( not ( = ?auto_411902 ?auto_411909 ) ) ( not ( = ?auto_411902 ?auto_411910 ) ) ( not ( = ?auto_411903 ?auto_411904 ) ) ( not ( = ?auto_411903 ?auto_411906 ) ) ( not ( = ?auto_411903 ?auto_411905 ) ) ( not ( = ?auto_411903 ?auto_411907 ) ) ( not ( = ?auto_411903 ?auto_411908 ) ) ( not ( = ?auto_411903 ?auto_411909 ) ) ( not ( = ?auto_411903 ?auto_411910 ) ) ( not ( = ?auto_411904 ?auto_411906 ) ) ( not ( = ?auto_411904 ?auto_411905 ) ) ( not ( = ?auto_411904 ?auto_411907 ) ) ( not ( = ?auto_411904 ?auto_411908 ) ) ( not ( = ?auto_411904 ?auto_411909 ) ) ( not ( = ?auto_411904 ?auto_411910 ) ) ( not ( = ?auto_411906 ?auto_411905 ) ) ( not ( = ?auto_411906 ?auto_411907 ) ) ( not ( = ?auto_411906 ?auto_411908 ) ) ( not ( = ?auto_411906 ?auto_411909 ) ) ( not ( = ?auto_411906 ?auto_411910 ) ) ( not ( = ?auto_411905 ?auto_411907 ) ) ( not ( = ?auto_411905 ?auto_411908 ) ) ( not ( = ?auto_411905 ?auto_411909 ) ) ( not ( = ?auto_411905 ?auto_411910 ) ) ( not ( = ?auto_411907 ?auto_411908 ) ) ( not ( = ?auto_411907 ?auto_411909 ) ) ( not ( = ?auto_411907 ?auto_411910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_411908 ?auto_411909 ?auto_411910 )
      ( MAKE-8CRATE-VERIFY ?auto_411902 ?auto_411903 ?auto_411904 ?auto_411906 ?auto_411905 ?auto_411907 ?auto_411908 ?auto_411909 ?auto_411910 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_411986 - SURFACE
      ?auto_411987 - SURFACE
      ?auto_411988 - SURFACE
      ?auto_411990 - SURFACE
      ?auto_411989 - SURFACE
      ?auto_411991 - SURFACE
      ?auto_411992 - SURFACE
      ?auto_411993 - SURFACE
      ?auto_411994 - SURFACE
    )
    :vars
    (
      ?auto_411995 - HOIST
      ?auto_411998 - PLACE
      ?auto_411999 - TRUCK
      ?auto_411997 - PLACE
      ?auto_411996 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_411995 ?auto_411998 ) ( SURFACE-AT ?auto_411993 ?auto_411998 ) ( CLEAR ?auto_411993 ) ( IS-CRATE ?auto_411994 ) ( not ( = ?auto_411993 ?auto_411994 ) ) ( AVAILABLE ?auto_411995 ) ( ON ?auto_411993 ?auto_411992 ) ( not ( = ?auto_411992 ?auto_411993 ) ) ( not ( = ?auto_411992 ?auto_411994 ) ) ( TRUCK-AT ?auto_411999 ?auto_411997 ) ( not ( = ?auto_411997 ?auto_411998 ) ) ( HOIST-AT ?auto_411996 ?auto_411997 ) ( LIFTING ?auto_411996 ?auto_411994 ) ( not ( = ?auto_411995 ?auto_411996 ) ) ( ON ?auto_411987 ?auto_411986 ) ( ON ?auto_411988 ?auto_411987 ) ( ON ?auto_411990 ?auto_411988 ) ( ON ?auto_411989 ?auto_411990 ) ( ON ?auto_411991 ?auto_411989 ) ( ON ?auto_411992 ?auto_411991 ) ( not ( = ?auto_411986 ?auto_411987 ) ) ( not ( = ?auto_411986 ?auto_411988 ) ) ( not ( = ?auto_411986 ?auto_411990 ) ) ( not ( = ?auto_411986 ?auto_411989 ) ) ( not ( = ?auto_411986 ?auto_411991 ) ) ( not ( = ?auto_411986 ?auto_411992 ) ) ( not ( = ?auto_411986 ?auto_411993 ) ) ( not ( = ?auto_411986 ?auto_411994 ) ) ( not ( = ?auto_411987 ?auto_411988 ) ) ( not ( = ?auto_411987 ?auto_411990 ) ) ( not ( = ?auto_411987 ?auto_411989 ) ) ( not ( = ?auto_411987 ?auto_411991 ) ) ( not ( = ?auto_411987 ?auto_411992 ) ) ( not ( = ?auto_411987 ?auto_411993 ) ) ( not ( = ?auto_411987 ?auto_411994 ) ) ( not ( = ?auto_411988 ?auto_411990 ) ) ( not ( = ?auto_411988 ?auto_411989 ) ) ( not ( = ?auto_411988 ?auto_411991 ) ) ( not ( = ?auto_411988 ?auto_411992 ) ) ( not ( = ?auto_411988 ?auto_411993 ) ) ( not ( = ?auto_411988 ?auto_411994 ) ) ( not ( = ?auto_411990 ?auto_411989 ) ) ( not ( = ?auto_411990 ?auto_411991 ) ) ( not ( = ?auto_411990 ?auto_411992 ) ) ( not ( = ?auto_411990 ?auto_411993 ) ) ( not ( = ?auto_411990 ?auto_411994 ) ) ( not ( = ?auto_411989 ?auto_411991 ) ) ( not ( = ?auto_411989 ?auto_411992 ) ) ( not ( = ?auto_411989 ?auto_411993 ) ) ( not ( = ?auto_411989 ?auto_411994 ) ) ( not ( = ?auto_411991 ?auto_411992 ) ) ( not ( = ?auto_411991 ?auto_411993 ) ) ( not ( = ?auto_411991 ?auto_411994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_411992 ?auto_411993 ?auto_411994 )
      ( MAKE-8CRATE-VERIFY ?auto_411986 ?auto_411987 ?auto_411988 ?auto_411990 ?auto_411989 ?auto_411991 ?auto_411992 ?auto_411993 ?auto_411994 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412078 - SURFACE
      ?auto_412079 - SURFACE
      ?auto_412080 - SURFACE
      ?auto_412082 - SURFACE
      ?auto_412081 - SURFACE
      ?auto_412083 - SURFACE
      ?auto_412084 - SURFACE
      ?auto_412085 - SURFACE
      ?auto_412086 - SURFACE
    )
    :vars
    (
      ?auto_412090 - HOIST
      ?auto_412088 - PLACE
      ?auto_412092 - TRUCK
      ?auto_412089 - PLACE
      ?auto_412091 - HOIST
      ?auto_412087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412090 ?auto_412088 ) ( SURFACE-AT ?auto_412085 ?auto_412088 ) ( CLEAR ?auto_412085 ) ( IS-CRATE ?auto_412086 ) ( not ( = ?auto_412085 ?auto_412086 ) ) ( AVAILABLE ?auto_412090 ) ( ON ?auto_412085 ?auto_412084 ) ( not ( = ?auto_412084 ?auto_412085 ) ) ( not ( = ?auto_412084 ?auto_412086 ) ) ( TRUCK-AT ?auto_412092 ?auto_412089 ) ( not ( = ?auto_412089 ?auto_412088 ) ) ( HOIST-AT ?auto_412091 ?auto_412089 ) ( not ( = ?auto_412090 ?auto_412091 ) ) ( AVAILABLE ?auto_412091 ) ( SURFACE-AT ?auto_412086 ?auto_412089 ) ( ON ?auto_412086 ?auto_412087 ) ( CLEAR ?auto_412086 ) ( not ( = ?auto_412085 ?auto_412087 ) ) ( not ( = ?auto_412086 ?auto_412087 ) ) ( not ( = ?auto_412084 ?auto_412087 ) ) ( ON ?auto_412079 ?auto_412078 ) ( ON ?auto_412080 ?auto_412079 ) ( ON ?auto_412082 ?auto_412080 ) ( ON ?auto_412081 ?auto_412082 ) ( ON ?auto_412083 ?auto_412081 ) ( ON ?auto_412084 ?auto_412083 ) ( not ( = ?auto_412078 ?auto_412079 ) ) ( not ( = ?auto_412078 ?auto_412080 ) ) ( not ( = ?auto_412078 ?auto_412082 ) ) ( not ( = ?auto_412078 ?auto_412081 ) ) ( not ( = ?auto_412078 ?auto_412083 ) ) ( not ( = ?auto_412078 ?auto_412084 ) ) ( not ( = ?auto_412078 ?auto_412085 ) ) ( not ( = ?auto_412078 ?auto_412086 ) ) ( not ( = ?auto_412078 ?auto_412087 ) ) ( not ( = ?auto_412079 ?auto_412080 ) ) ( not ( = ?auto_412079 ?auto_412082 ) ) ( not ( = ?auto_412079 ?auto_412081 ) ) ( not ( = ?auto_412079 ?auto_412083 ) ) ( not ( = ?auto_412079 ?auto_412084 ) ) ( not ( = ?auto_412079 ?auto_412085 ) ) ( not ( = ?auto_412079 ?auto_412086 ) ) ( not ( = ?auto_412079 ?auto_412087 ) ) ( not ( = ?auto_412080 ?auto_412082 ) ) ( not ( = ?auto_412080 ?auto_412081 ) ) ( not ( = ?auto_412080 ?auto_412083 ) ) ( not ( = ?auto_412080 ?auto_412084 ) ) ( not ( = ?auto_412080 ?auto_412085 ) ) ( not ( = ?auto_412080 ?auto_412086 ) ) ( not ( = ?auto_412080 ?auto_412087 ) ) ( not ( = ?auto_412082 ?auto_412081 ) ) ( not ( = ?auto_412082 ?auto_412083 ) ) ( not ( = ?auto_412082 ?auto_412084 ) ) ( not ( = ?auto_412082 ?auto_412085 ) ) ( not ( = ?auto_412082 ?auto_412086 ) ) ( not ( = ?auto_412082 ?auto_412087 ) ) ( not ( = ?auto_412081 ?auto_412083 ) ) ( not ( = ?auto_412081 ?auto_412084 ) ) ( not ( = ?auto_412081 ?auto_412085 ) ) ( not ( = ?auto_412081 ?auto_412086 ) ) ( not ( = ?auto_412081 ?auto_412087 ) ) ( not ( = ?auto_412083 ?auto_412084 ) ) ( not ( = ?auto_412083 ?auto_412085 ) ) ( not ( = ?auto_412083 ?auto_412086 ) ) ( not ( = ?auto_412083 ?auto_412087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412084 ?auto_412085 ?auto_412086 )
      ( MAKE-8CRATE-VERIFY ?auto_412078 ?auto_412079 ?auto_412080 ?auto_412082 ?auto_412081 ?auto_412083 ?auto_412084 ?auto_412085 ?auto_412086 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412171 - SURFACE
      ?auto_412172 - SURFACE
      ?auto_412173 - SURFACE
      ?auto_412175 - SURFACE
      ?auto_412174 - SURFACE
      ?auto_412176 - SURFACE
      ?auto_412177 - SURFACE
      ?auto_412178 - SURFACE
      ?auto_412179 - SURFACE
    )
    :vars
    (
      ?auto_412180 - HOIST
      ?auto_412184 - PLACE
      ?auto_412183 - PLACE
      ?auto_412182 - HOIST
      ?auto_412181 - SURFACE
      ?auto_412185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412180 ?auto_412184 ) ( SURFACE-AT ?auto_412178 ?auto_412184 ) ( CLEAR ?auto_412178 ) ( IS-CRATE ?auto_412179 ) ( not ( = ?auto_412178 ?auto_412179 ) ) ( AVAILABLE ?auto_412180 ) ( ON ?auto_412178 ?auto_412177 ) ( not ( = ?auto_412177 ?auto_412178 ) ) ( not ( = ?auto_412177 ?auto_412179 ) ) ( not ( = ?auto_412183 ?auto_412184 ) ) ( HOIST-AT ?auto_412182 ?auto_412183 ) ( not ( = ?auto_412180 ?auto_412182 ) ) ( AVAILABLE ?auto_412182 ) ( SURFACE-AT ?auto_412179 ?auto_412183 ) ( ON ?auto_412179 ?auto_412181 ) ( CLEAR ?auto_412179 ) ( not ( = ?auto_412178 ?auto_412181 ) ) ( not ( = ?auto_412179 ?auto_412181 ) ) ( not ( = ?auto_412177 ?auto_412181 ) ) ( TRUCK-AT ?auto_412185 ?auto_412184 ) ( ON ?auto_412172 ?auto_412171 ) ( ON ?auto_412173 ?auto_412172 ) ( ON ?auto_412175 ?auto_412173 ) ( ON ?auto_412174 ?auto_412175 ) ( ON ?auto_412176 ?auto_412174 ) ( ON ?auto_412177 ?auto_412176 ) ( not ( = ?auto_412171 ?auto_412172 ) ) ( not ( = ?auto_412171 ?auto_412173 ) ) ( not ( = ?auto_412171 ?auto_412175 ) ) ( not ( = ?auto_412171 ?auto_412174 ) ) ( not ( = ?auto_412171 ?auto_412176 ) ) ( not ( = ?auto_412171 ?auto_412177 ) ) ( not ( = ?auto_412171 ?auto_412178 ) ) ( not ( = ?auto_412171 ?auto_412179 ) ) ( not ( = ?auto_412171 ?auto_412181 ) ) ( not ( = ?auto_412172 ?auto_412173 ) ) ( not ( = ?auto_412172 ?auto_412175 ) ) ( not ( = ?auto_412172 ?auto_412174 ) ) ( not ( = ?auto_412172 ?auto_412176 ) ) ( not ( = ?auto_412172 ?auto_412177 ) ) ( not ( = ?auto_412172 ?auto_412178 ) ) ( not ( = ?auto_412172 ?auto_412179 ) ) ( not ( = ?auto_412172 ?auto_412181 ) ) ( not ( = ?auto_412173 ?auto_412175 ) ) ( not ( = ?auto_412173 ?auto_412174 ) ) ( not ( = ?auto_412173 ?auto_412176 ) ) ( not ( = ?auto_412173 ?auto_412177 ) ) ( not ( = ?auto_412173 ?auto_412178 ) ) ( not ( = ?auto_412173 ?auto_412179 ) ) ( not ( = ?auto_412173 ?auto_412181 ) ) ( not ( = ?auto_412175 ?auto_412174 ) ) ( not ( = ?auto_412175 ?auto_412176 ) ) ( not ( = ?auto_412175 ?auto_412177 ) ) ( not ( = ?auto_412175 ?auto_412178 ) ) ( not ( = ?auto_412175 ?auto_412179 ) ) ( not ( = ?auto_412175 ?auto_412181 ) ) ( not ( = ?auto_412174 ?auto_412176 ) ) ( not ( = ?auto_412174 ?auto_412177 ) ) ( not ( = ?auto_412174 ?auto_412178 ) ) ( not ( = ?auto_412174 ?auto_412179 ) ) ( not ( = ?auto_412174 ?auto_412181 ) ) ( not ( = ?auto_412176 ?auto_412177 ) ) ( not ( = ?auto_412176 ?auto_412178 ) ) ( not ( = ?auto_412176 ?auto_412179 ) ) ( not ( = ?auto_412176 ?auto_412181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412177 ?auto_412178 ?auto_412179 )
      ( MAKE-8CRATE-VERIFY ?auto_412171 ?auto_412172 ?auto_412173 ?auto_412175 ?auto_412174 ?auto_412176 ?auto_412177 ?auto_412178 ?auto_412179 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412264 - SURFACE
      ?auto_412265 - SURFACE
      ?auto_412266 - SURFACE
      ?auto_412268 - SURFACE
      ?auto_412267 - SURFACE
      ?auto_412269 - SURFACE
      ?auto_412270 - SURFACE
      ?auto_412271 - SURFACE
      ?auto_412272 - SURFACE
    )
    :vars
    (
      ?auto_412277 - HOIST
      ?auto_412276 - PLACE
      ?auto_412278 - PLACE
      ?auto_412275 - HOIST
      ?auto_412274 - SURFACE
      ?auto_412273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412277 ?auto_412276 ) ( IS-CRATE ?auto_412272 ) ( not ( = ?auto_412271 ?auto_412272 ) ) ( not ( = ?auto_412270 ?auto_412271 ) ) ( not ( = ?auto_412270 ?auto_412272 ) ) ( not ( = ?auto_412278 ?auto_412276 ) ) ( HOIST-AT ?auto_412275 ?auto_412278 ) ( not ( = ?auto_412277 ?auto_412275 ) ) ( AVAILABLE ?auto_412275 ) ( SURFACE-AT ?auto_412272 ?auto_412278 ) ( ON ?auto_412272 ?auto_412274 ) ( CLEAR ?auto_412272 ) ( not ( = ?auto_412271 ?auto_412274 ) ) ( not ( = ?auto_412272 ?auto_412274 ) ) ( not ( = ?auto_412270 ?auto_412274 ) ) ( TRUCK-AT ?auto_412273 ?auto_412276 ) ( SURFACE-AT ?auto_412270 ?auto_412276 ) ( CLEAR ?auto_412270 ) ( LIFTING ?auto_412277 ?auto_412271 ) ( IS-CRATE ?auto_412271 ) ( ON ?auto_412265 ?auto_412264 ) ( ON ?auto_412266 ?auto_412265 ) ( ON ?auto_412268 ?auto_412266 ) ( ON ?auto_412267 ?auto_412268 ) ( ON ?auto_412269 ?auto_412267 ) ( ON ?auto_412270 ?auto_412269 ) ( not ( = ?auto_412264 ?auto_412265 ) ) ( not ( = ?auto_412264 ?auto_412266 ) ) ( not ( = ?auto_412264 ?auto_412268 ) ) ( not ( = ?auto_412264 ?auto_412267 ) ) ( not ( = ?auto_412264 ?auto_412269 ) ) ( not ( = ?auto_412264 ?auto_412270 ) ) ( not ( = ?auto_412264 ?auto_412271 ) ) ( not ( = ?auto_412264 ?auto_412272 ) ) ( not ( = ?auto_412264 ?auto_412274 ) ) ( not ( = ?auto_412265 ?auto_412266 ) ) ( not ( = ?auto_412265 ?auto_412268 ) ) ( not ( = ?auto_412265 ?auto_412267 ) ) ( not ( = ?auto_412265 ?auto_412269 ) ) ( not ( = ?auto_412265 ?auto_412270 ) ) ( not ( = ?auto_412265 ?auto_412271 ) ) ( not ( = ?auto_412265 ?auto_412272 ) ) ( not ( = ?auto_412265 ?auto_412274 ) ) ( not ( = ?auto_412266 ?auto_412268 ) ) ( not ( = ?auto_412266 ?auto_412267 ) ) ( not ( = ?auto_412266 ?auto_412269 ) ) ( not ( = ?auto_412266 ?auto_412270 ) ) ( not ( = ?auto_412266 ?auto_412271 ) ) ( not ( = ?auto_412266 ?auto_412272 ) ) ( not ( = ?auto_412266 ?auto_412274 ) ) ( not ( = ?auto_412268 ?auto_412267 ) ) ( not ( = ?auto_412268 ?auto_412269 ) ) ( not ( = ?auto_412268 ?auto_412270 ) ) ( not ( = ?auto_412268 ?auto_412271 ) ) ( not ( = ?auto_412268 ?auto_412272 ) ) ( not ( = ?auto_412268 ?auto_412274 ) ) ( not ( = ?auto_412267 ?auto_412269 ) ) ( not ( = ?auto_412267 ?auto_412270 ) ) ( not ( = ?auto_412267 ?auto_412271 ) ) ( not ( = ?auto_412267 ?auto_412272 ) ) ( not ( = ?auto_412267 ?auto_412274 ) ) ( not ( = ?auto_412269 ?auto_412270 ) ) ( not ( = ?auto_412269 ?auto_412271 ) ) ( not ( = ?auto_412269 ?auto_412272 ) ) ( not ( = ?auto_412269 ?auto_412274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412270 ?auto_412271 ?auto_412272 )
      ( MAKE-8CRATE-VERIFY ?auto_412264 ?auto_412265 ?auto_412266 ?auto_412268 ?auto_412267 ?auto_412269 ?auto_412270 ?auto_412271 ?auto_412272 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412357 - SURFACE
      ?auto_412358 - SURFACE
      ?auto_412359 - SURFACE
      ?auto_412361 - SURFACE
      ?auto_412360 - SURFACE
      ?auto_412362 - SURFACE
      ?auto_412363 - SURFACE
      ?auto_412364 - SURFACE
      ?auto_412365 - SURFACE
    )
    :vars
    (
      ?auto_412371 - HOIST
      ?auto_412367 - PLACE
      ?auto_412370 - PLACE
      ?auto_412368 - HOIST
      ?auto_412369 - SURFACE
      ?auto_412366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412371 ?auto_412367 ) ( IS-CRATE ?auto_412365 ) ( not ( = ?auto_412364 ?auto_412365 ) ) ( not ( = ?auto_412363 ?auto_412364 ) ) ( not ( = ?auto_412363 ?auto_412365 ) ) ( not ( = ?auto_412370 ?auto_412367 ) ) ( HOIST-AT ?auto_412368 ?auto_412370 ) ( not ( = ?auto_412371 ?auto_412368 ) ) ( AVAILABLE ?auto_412368 ) ( SURFACE-AT ?auto_412365 ?auto_412370 ) ( ON ?auto_412365 ?auto_412369 ) ( CLEAR ?auto_412365 ) ( not ( = ?auto_412364 ?auto_412369 ) ) ( not ( = ?auto_412365 ?auto_412369 ) ) ( not ( = ?auto_412363 ?auto_412369 ) ) ( TRUCK-AT ?auto_412366 ?auto_412367 ) ( SURFACE-AT ?auto_412363 ?auto_412367 ) ( CLEAR ?auto_412363 ) ( IS-CRATE ?auto_412364 ) ( AVAILABLE ?auto_412371 ) ( IN ?auto_412364 ?auto_412366 ) ( ON ?auto_412358 ?auto_412357 ) ( ON ?auto_412359 ?auto_412358 ) ( ON ?auto_412361 ?auto_412359 ) ( ON ?auto_412360 ?auto_412361 ) ( ON ?auto_412362 ?auto_412360 ) ( ON ?auto_412363 ?auto_412362 ) ( not ( = ?auto_412357 ?auto_412358 ) ) ( not ( = ?auto_412357 ?auto_412359 ) ) ( not ( = ?auto_412357 ?auto_412361 ) ) ( not ( = ?auto_412357 ?auto_412360 ) ) ( not ( = ?auto_412357 ?auto_412362 ) ) ( not ( = ?auto_412357 ?auto_412363 ) ) ( not ( = ?auto_412357 ?auto_412364 ) ) ( not ( = ?auto_412357 ?auto_412365 ) ) ( not ( = ?auto_412357 ?auto_412369 ) ) ( not ( = ?auto_412358 ?auto_412359 ) ) ( not ( = ?auto_412358 ?auto_412361 ) ) ( not ( = ?auto_412358 ?auto_412360 ) ) ( not ( = ?auto_412358 ?auto_412362 ) ) ( not ( = ?auto_412358 ?auto_412363 ) ) ( not ( = ?auto_412358 ?auto_412364 ) ) ( not ( = ?auto_412358 ?auto_412365 ) ) ( not ( = ?auto_412358 ?auto_412369 ) ) ( not ( = ?auto_412359 ?auto_412361 ) ) ( not ( = ?auto_412359 ?auto_412360 ) ) ( not ( = ?auto_412359 ?auto_412362 ) ) ( not ( = ?auto_412359 ?auto_412363 ) ) ( not ( = ?auto_412359 ?auto_412364 ) ) ( not ( = ?auto_412359 ?auto_412365 ) ) ( not ( = ?auto_412359 ?auto_412369 ) ) ( not ( = ?auto_412361 ?auto_412360 ) ) ( not ( = ?auto_412361 ?auto_412362 ) ) ( not ( = ?auto_412361 ?auto_412363 ) ) ( not ( = ?auto_412361 ?auto_412364 ) ) ( not ( = ?auto_412361 ?auto_412365 ) ) ( not ( = ?auto_412361 ?auto_412369 ) ) ( not ( = ?auto_412360 ?auto_412362 ) ) ( not ( = ?auto_412360 ?auto_412363 ) ) ( not ( = ?auto_412360 ?auto_412364 ) ) ( not ( = ?auto_412360 ?auto_412365 ) ) ( not ( = ?auto_412360 ?auto_412369 ) ) ( not ( = ?auto_412362 ?auto_412363 ) ) ( not ( = ?auto_412362 ?auto_412364 ) ) ( not ( = ?auto_412362 ?auto_412365 ) ) ( not ( = ?auto_412362 ?auto_412369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412363 ?auto_412364 ?auto_412365 )
      ( MAKE-8CRATE-VERIFY ?auto_412357 ?auto_412358 ?auto_412359 ?auto_412361 ?auto_412360 ?auto_412362 ?auto_412363 ?auto_412364 ?auto_412365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_412372 - SURFACE
      ?auto_412373 - SURFACE
    )
    :vars
    (
      ?auto_412380 - HOIST
      ?auto_412375 - PLACE
      ?auto_412379 - SURFACE
      ?auto_412378 - PLACE
      ?auto_412376 - HOIST
      ?auto_412377 - SURFACE
      ?auto_412374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412380 ?auto_412375 ) ( IS-CRATE ?auto_412373 ) ( not ( = ?auto_412372 ?auto_412373 ) ) ( not ( = ?auto_412379 ?auto_412372 ) ) ( not ( = ?auto_412379 ?auto_412373 ) ) ( not ( = ?auto_412378 ?auto_412375 ) ) ( HOIST-AT ?auto_412376 ?auto_412378 ) ( not ( = ?auto_412380 ?auto_412376 ) ) ( AVAILABLE ?auto_412376 ) ( SURFACE-AT ?auto_412373 ?auto_412378 ) ( ON ?auto_412373 ?auto_412377 ) ( CLEAR ?auto_412373 ) ( not ( = ?auto_412372 ?auto_412377 ) ) ( not ( = ?auto_412373 ?auto_412377 ) ) ( not ( = ?auto_412379 ?auto_412377 ) ) ( SURFACE-AT ?auto_412379 ?auto_412375 ) ( CLEAR ?auto_412379 ) ( IS-CRATE ?auto_412372 ) ( AVAILABLE ?auto_412380 ) ( IN ?auto_412372 ?auto_412374 ) ( TRUCK-AT ?auto_412374 ?auto_412378 ) )
    :subtasks
    ( ( !DRIVE ?auto_412374 ?auto_412378 ?auto_412375 )
      ( MAKE-2CRATE ?auto_412379 ?auto_412372 ?auto_412373 )
      ( MAKE-1CRATE-VERIFY ?auto_412372 ?auto_412373 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_412381 - SURFACE
      ?auto_412382 - SURFACE
      ?auto_412383 - SURFACE
    )
    :vars
    (
      ?auto_412385 - HOIST
      ?auto_412384 - PLACE
      ?auto_412386 - PLACE
      ?auto_412389 - HOIST
      ?auto_412388 - SURFACE
      ?auto_412387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412385 ?auto_412384 ) ( IS-CRATE ?auto_412383 ) ( not ( = ?auto_412382 ?auto_412383 ) ) ( not ( = ?auto_412381 ?auto_412382 ) ) ( not ( = ?auto_412381 ?auto_412383 ) ) ( not ( = ?auto_412386 ?auto_412384 ) ) ( HOIST-AT ?auto_412389 ?auto_412386 ) ( not ( = ?auto_412385 ?auto_412389 ) ) ( AVAILABLE ?auto_412389 ) ( SURFACE-AT ?auto_412383 ?auto_412386 ) ( ON ?auto_412383 ?auto_412388 ) ( CLEAR ?auto_412383 ) ( not ( = ?auto_412382 ?auto_412388 ) ) ( not ( = ?auto_412383 ?auto_412388 ) ) ( not ( = ?auto_412381 ?auto_412388 ) ) ( SURFACE-AT ?auto_412381 ?auto_412384 ) ( CLEAR ?auto_412381 ) ( IS-CRATE ?auto_412382 ) ( AVAILABLE ?auto_412385 ) ( IN ?auto_412382 ?auto_412387 ) ( TRUCK-AT ?auto_412387 ?auto_412386 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412382 ?auto_412383 )
      ( MAKE-2CRATE-VERIFY ?auto_412381 ?auto_412382 ?auto_412383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_412390 - SURFACE
      ?auto_412391 - SURFACE
      ?auto_412392 - SURFACE
      ?auto_412393 - SURFACE
    )
    :vars
    (
      ?auto_412397 - HOIST
      ?auto_412399 - PLACE
      ?auto_412396 - PLACE
      ?auto_412394 - HOIST
      ?auto_412398 - SURFACE
      ?auto_412395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412397 ?auto_412399 ) ( IS-CRATE ?auto_412393 ) ( not ( = ?auto_412392 ?auto_412393 ) ) ( not ( = ?auto_412391 ?auto_412392 ) ) ( not ( = ?auto_412391 ?auto_412393 ) ) ( not ( = ?auto_412396 ?auto_412399 ) ) ( HOIST-AT ?auto_412394 ?auto_412396 ) ( not ( = ?auto_412397 ?auto_412394 ) ) ( AVAILABLE ?auto_412394 ) ( SURFACE-AT ?auto_412393 ?auto_412396 ) ( ON ?auto_412393 ?auto_412398 ) ( CLEAR ?auto_412393 ) ( not ( = ?auto_412392 ?auto_412398 ) ) ( not ( = ?auto_412393 ?auto_412398 ) ) ( not ( = ?auto_412391 ?auto_412398 ) ) ( SURFACE-AT ?auto_412391 ?auto_412399 ) ( CLEAR ?auto_412391 ) ( IS-CRATE ?auto_412392 ) ( AVAILABLE ?auto_412397 ) ( IN ?auto_412392 ?auto_412395 ) ( TRUCK-AT ?auto_412395 ?auto_412396 ) ( ON ?auto_412391 ?auto_412390 ) ( not ( = ?auto_412390 ?auto_412391 ) ) ( not ( = ?auto_412390 ?auto_412392 ) ) ( not ( = ?auto_412390 ?auto_412393 ) ) ( not ( = ?auto_412390 ?auto_412398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412391 ?auto_412392 ?auto_412393 )
      ( MAKE-3CRATE-VERIFY ?auto_412390 ?auto_412391 ?auto_412392 ?auto_412393 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_412400 - SURFACE
      ?auto_412401 - SURFACE
      ?auto_412402 - SURFACE
      ?auto_412404 - SURFACE
      ?auto_412403 - SURFACE
    )
    :vars
    (
      ?auto_412408 - HOIST
      ?auto_412410 - PLACE
      ?auto_412407 - PLACE
      ?auto_412405 - HOIST
      ?auto_412409 - SURFACE
      ?auto_412406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412408 ?auto_412410 ) ( IS-CRATE ?auto_412403 ) ( not ( = ?auto_412404 ?auto_412403 ) ) ( not ( = ?auto_412402 ?auto_412404 ) ) ( not ( = ?auto_412402 ?auto_412403 ) ) ( not ( = ?auto_412407 ?auto_412410 ) ) ( HOIST-AT ?auto_412405 ?auto_412407 ) ( not ( = ?auto_412408 ?auto_412405 ) ) ( AVAILABLE ?auto_412405 ) ( SURFACE-AT ?auto_412403 ?auto_412407 ) ( ON ?auto_412403 ?auto_412409 ) ( CLEAR ?auto_412403 ) ( not ( = ?auto_412404 ?auto_412409 ) ) ( not ( = ?auto_412403 ?auto_412409 ) ) ( not ( = ?auto_412402 ?auto_412409 ) ) ( SURFACE-AT ?auto_412402 ?auto_412410 ) ( CLEAR ?auto_412402 ) ( IS-CRATE ?auto_412404 ) ( AVAILABLE ?auto_412408 ) ( IN ?auto_412404 ?auto_412406 ) ( TRUCK-AT ?auto_412406 ?auto_412407 ) ( ON ?auto_412401 ?auto_412400 ) ( ON ?auto_412402 ?auto_412401 ) ( not ( = ?auto_412400 ?auto_412401 ) ) ( not ( = ?auto_412400 ?auto_412402 ) ) ( not ( = ?auto_412400 ?auto_412404 ) ) ( not ( = ?auto_412400 ?auto_412403 ) ) ( not ( = ?auto_412400 ?auto_412409 ) ) ( not ( = ?auto_412401 ?auto_412402 ) ) ( not ( = ?auto_412401 ?auto_412404 ) ) ( not ( = ?auto_412401 ?auto_412403 ) ) ( not ( = ?auto_412401 ?auto_412409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412402 ?auto_412404 ?auto_412403 )
      ( MAKE-4CRATE-VERIFY ?auto_412400 ?auto_412401 ?auto_412402 ?auto_412404 ?auto_412403 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_412411 - SURFACE
      ?auto_412412 - SURFACE
      ?auto_412413 - SURFACE
      ?auto_412415 - SURFACE
      ?auto_412414 - SURFACE
      ?auto_412416 - SURFACE
    )
    :vars
    (
      ?auto_412420 - HOIST
      ?auto_412422 - PLACE
      ?auto_412419 - PLACE
      ?auto_412417 - HOIST
      ?auto_412421 - SURFACE
      ?auto_412418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412420 ?auto_412422 ) ( IS-CRATE ?auto_412416 ) ( not ( = ?auto_412414 ?auto_412416 ) ) ( not ( = ?auto_412415 ?auto_412414 ) ) ( not ( = ?auto_412415 ?auto_412416 ) ) ( not ( = ?auto_412419 ?auto_412422 ) ) ( HOIST-AT ?auto_412417 ?auto_412419 ) ( not ( = ?auto_412420 ?auto_412417 ) ) ( AVAILABLE ?auto_412417 ) ( SURFACE-AT ?auto_412416 ?auto_412419 ) ( ON ?auto_412416 ?auto_412421 ) ( CLEAR ?auto_412416 ) ( not ( = ?auto_412414 ?auto_412421 ) ) ( not ( = ?auto_412416 ?auto_412421 ) ) ( not ( = ?auto_412415 ?auto_412421 ) ) ( SURFACE-AT ?auto_412415 ?auto_412422 ) ( CLEAR ?auto_412415 ) ( IS-CRATE ?auto_412414 ) ( AVAILABLE ?auto_412420 ) ( IN ?auto_412414 ?auto_412418 ) ( TRUCK-AT ?auto_412418 ?auto_412419 ) ( ON ?auto_412412 ?auto_412411 ) ( ON ?auto_412413 ?auto_412412 ) ( ON ?auto_412415 ?auto_412413 ) ( not ( = ?auto_412411 ?auto_412412 ) ) ( not ( = ?auto_412411 ?auto_412413 ) ) ( not ( = ?auto_412411 ?auto_412415 ) ) ( not ( = ?auto_412411 ?auto_412414 ) ) ( not ( = ?auto_412411 ?auto_412416 ) ) ( not ( = ?auto_412411 ?auto_412421 ) ) ( not ( = ?auto_412412 ?auto_412413 ) ) ( not ( = ?auto_412412 ?auto_412415 ) ) ( not ( = ?auto_412412 ?auto_412414 ) ) ( not ( = ?auto_412412 ?auto_412416 ) ) ( not ( = ?auto_412412 ?auto_412421 ) ) ( not ( = ?auto_412413 ?auto_412415 ) ) ( not ( = ?auto_412413 ?auto_412414 ) ) ( not ( = ?auto_412413 ?auto_412416 ) ) ( not ( = ?auto_412413 ?auto_412421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412415 ?auto_412414 ?auto_412416 )
      ( MAKE-5CRATE-VERIFY ?auto_412411 ?auto_412412 ?auto_412413 ?auto_412415 ?auto_412414 ?auto_412416 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_412423 - SURFACE
      ?auto_412424 - SURFACE
      ?auto_412425 - SURFACE
      ?auto_412427 - SURFACE
      ?auto_412426 - SURFACE
      ?auto_412428 - SURFACE
      ?auto_412429 - SURFACE
    )
    :vars
    (
      ?auto_412433 - HOIST
      ?auto_412435 - PLACE
      ?auto_412432 - PLACE
      ?auto_412430 - HOIST
      ?auto_412434 - SURFACE
      ?auto_412431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412433 ?auto_412435 ) ( IS-CRATE ?auto_412429 ) ( not ( = ?auto_412428 ?auto_412429 ) ) ( not ( = ?auto_412426 ?auto_412428 ) ) ( not ( = ?auto_412426 ?auto_412429 ) ) ( not ( = ?auto_412432 ?auto_412435 ) ) ( HOIST-AT ?auto_412430 ?auto_412432 ) ( not ( = ?auto_412433 ?auto_412430 ) ) ( AVAILABLE ?auto_412430 ) ( SURFACE-AT ?auto_412429 ?auto_412432 ) ( ON ?auto_412429 ?auto_412434 ) ( CLEAR ?auto_412429 ) ( not ( = ?auto_412428 ?auto_412434 ) ) ( not ( = ?auto_412429 ?auto_412434 ) ) ( not ( = ?auto_412426 ?auto_412434 ) ) ( SURFACE-AT ?auto_412426 ?auto_412435 ) ( CLEAR ?auto_412426 ) ( IS-CRATE ?auto_412428 ) ( AVAILABLE ?auto_412433 ) ( IN ?auto_412428 ?auto_412431 ) ( TRUCK-AT ?auto_412431 ?auto_412432 ) ( ON ?auto_412424 ?auto_412423 ) ( ON ?auto_412425 ?auto_412424 ) ( ON ?auto_412427 ?auto_412425 ) ( ON ?auto_412426 ?auto_412427 ) ( not ( = ?auto_412423 ?auto_412424 ) ) ( not ( = ?auto_412423 ?auto_412425 ) ) ( not ( = ?auto_412423 ?auto_412427 ) ) ( not ( = ?auto_412423 ?auto_412426 ) ) ( not ( = ?auto_412423 ?auto_412428 ) ) ( not ( = ?auto_412423 ?auto_412429 ) ) ( not ( = ?auto_412423 ?auto_412434 ) ) ( not ( = ?auto_412424 ?auto_412425 ) ) ( not ( = ?auto_412424 ?auto_412427 ) ) ( not ( = ?auto_412424 ?auto_412426 ) ) ( not ( = ?auto_412424 ?auto_412428 ) ) ( not ( = ?auto_412424 ?auto_412429 ) ) ( not ( = ?auto_412424 ?auto_412434 ) ) ( not ( = ?auto_412425 ?auto_412427 ) ) ( not ( = ?auto_412425 ?auto_412426 ) ) ( not ( = ?auto_412425 ?auto_412428 ) ) ( not ( = ?auto_412425 ?auto_412429 ) ) ( not ( = ?auto_412425 ?auto_412434 ) ) ( not ( = ?auto_412427 ?auto_412426 ) ) ( not ( = ?auto_412427 ?auto_412428 ) ) ( not ( = ?auto_412427 ?auto_412429 ) ) ( not ( = ?auto_412427 ?auto_412434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412426 ?auto_412428 ?auto_412429 )
      ( MAKE-6CRATE-VERIFY ?auto_412423 ?auto_412424 ?auto_412425 ?auto_412427 ?auto_412426 ?auto_412428 ?auto_412429 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_412436 - SURFACE
      ?auto_412437 - SURFACE
      ?auto_412438 - SURFACE
      ?auto_412440 - SURFACE
      ?auto_412439 - SURFACE
      ?auto_412441 - SURFACE
      ?auto_412442 - SURFACE
      ?auto_412443 - SURFACE
    )
    :vars
    (
      ?auto_412447 - HOIST
      ?auto_412449 - PLACE
      ?auto_412446 - PLACE
      ?auto_412444 - HOIST
      ?auto_412448 - SURFACE
      ?auto_412445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412447 ?auto_412449 ) ( IS-CRATE ?auto_412443 ) ( not ( = ?auto_412442 ?auto_412443 ) ) ( not ( = ?auto_412441 ?auto_412442 ) ) ( not ( = ?auto_412441 ?auto_412443 ) ) ( not ( = ?auto_412446 ?auto_412449 ) ) ( HOIST-AT ?auto_412444 ?auto_412446 ) ( not ( = ?auto_412447 ?auto_412444 ) ) ( AVAILABLE ?auto_412444 ) ( SURFACE-AT ?auto_412443 ?auto_412446 ) ( ON ?auto_412443 ?auto_412448 ) ( CLEAR ?auto_412443 ) ( not ( = ?auto_412442 ?auto_412448 ) ) ( not ( = ?auto_412443 ?auto_412448 ) ) ( not ( = ?auto_412441 ?auto_412448 ) ) ( SURFACE-AT ?auto_412441 ?auto_412449 ) ( CLEAR ?auto_412441 ) ( IS-CRATE ?auto_412442 ) ( AVAILABLE ?auto_412447 ) ( IN ?auto_412442 ?auto_412445 ) ( TRUCK-AT ?auto_412445 ?auto_412446 ) ( ON ?auto_412437 ?auto_412436 ) ( ON ?auto_412438 ?auto_412437 ) ( ON ?auto_412440 ?auto_412438 ) ( ON ?auto_412439 ?auto_412440 ) ( ON ?auto_412441 ?auto_412439 ) ( not ( = ?auto_412436 ?auto_412437 ) ) ( not ( = ?auto_412436 ?auto_412438 ) ) ( not ( = ?auto_412436 ?auto_412440 ) ) ( not ( = ?auto_412436 ?auto_412439 ) ) ( not ( = ?auto_412436 ?auto_412441 ) ) ( not ( = ?auto_412436 ?auto_412442 ) ) ( not ( = ?auto_412436 ?auto_412443 ) ) ( not ( = ?auto_412436 ?auto_412448 ) ) ( not ( = ?auto_412437 ?auto_412438 ) ) ( not ( = ?auto_412437 ?auto_412440 ) ) ( not ( = ?auto_412437 ?auto_412439 ) ) ( not ( = ?auto_412437 ?auto_412441 ) ) ( not ( = ?auto_412437 ?auto_412442 ) ) ( not ( = ?auto_412437 ?auto_412443 ) ) ( not ( = ?auto_412437 ?auto_412448 ) ) ( not ( = ?auto_412438 ?auto_412440 ) ) ( not ( = ?auto_412438 ?auto_412439 ) ) ( not ( = ?auto_412438 ?auto_412441 ) ) ( not ( = ?auto_412438 ?auto_412442 ) ) ( not ( = ?auto_412438 ?auto_412443 ) ) ( not ( = ?auto_412438 ?auto_412448 ) ) ( not ( = ?auto_412440 ?auto_412439 ) ) ( not ( = ?auto_412440 ?auto_412441 ) ) ( not ( = ?auto_412440 ?auto_412442 ) ) ( not ( = ?auto_412440 ?auto_412443 ) ) ( not ( = ?auto_412440 ?auto_412448 ) ) ( not ( = ?auto_412439 ?auto_412441 ) ) ( not ( = ?auto_412439 ?auto_412442 ) ) ( not ( = ?auto_412439 ?auto_412443 ) ) ( not ( = ?auto_412439 ?auto_412448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412441 ?auto_412442 ?auto_412443 )
      ( MAKE-7CRATE-VERIFY ?auto_412436 ?auto_412437 ?auto_412438 ?auto_412440 ?auto_412439 ?auto_412441 ?auto_412442 ?auto_412443 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412450 - SURFACE
      ?auto_412451 - SURFACE
      ?auto_412452 - SURFACE
      ?auto_412454 - SURFACE
      ?auto_412453 - SURFACE
      ?auto_412455 - SURFACE
      ?auto_412456 - SURFACE
      ?auto_412457 - SURFACE
      ?auto_412458 - SURFACE
    )
    :vars
    (
      ?auto_412462 - HOIST
      ?auto_412464 - PLACE
      ?auto_412461 - PLACE
      ?auto_412459 - HOIST
      ?auto_412463 - SURFACE
      ?auto_412460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412462 ?auto_412464 ) ( IS-CRATE ?auto_412458 ) ( not ( = ?auto_412457 ?auto_412458 ) ) ( not ( = ?auto_412456 ?auto_412457 ) ) ( not ( = ?auto_412456 ?auto_412458 ) ) ( not ( = ?auto_412461 ?auto_412464 ) ) ( HOIST-AT ?auto_412459 ?auto_412461 ) ( not ( = ?auto_412462 ?auto_412459 ) ) ( AVAILABLE ?auto_412459 ) ( SURFACE-AT ?auto_412458 ?auto_412461 ) ( ON ?auto_412458 ?auto_412463 ) ( CLEAR ?auto_412458 ) ( not ( = ?auto_412457 ?auto_412463 ) ) ( not ( = ?auto_412458 ?auto_412463 ) ) ( not ( = ?auto_412456 ?auto_412463 ) ) ( SURFACE-AT ?auto_412456 ?auto_412464 ) ( CLEAR ?auto_412456 ) ( IS-CRATE ?auto_412457 ) ( AVAILABLE ?auto_412462 ) ( IN ?auto_412457 ?auto_412460 ) ( TRUCK-AT ?auto_412460 ?auto_412461 ) ( ON ?auto_412451 ?auto_412450 ) ( ON ?auto_412452 ?auto_412451 ) ( ON ?auto_412454 ?auto_412452 ) ( ON ?auto_412453 ?auto_412454 ) ( ON ?auto_412455 ?auto_412453 ) ( ON ?auto_412456 ?auto_412455 ) ( not ( = ?auto_412450 ?auto_412451 ) ) ( not ( = ?auto_412450 ?auto_412452 ) ) ( not ( = ?auto_412450 ?auto_412454 ) ) ( not ( = ?auto_412450 ?auto_412453 ) ) ( not ( = ?auto_412450 ?auto_412455 ) ) ( not ( = ?auto_412450 ?auto_412456 ) ) ( not ( = ?auto_412450 ?auto_412457 ) ) ( not ( = ?auto_412450 ?auto_412458 ) ) ( not ( = ?auto_412450 ?auto_412463 ) ) ( not ( = ?auto_412451 ?auto_412452 ) ) ( not ( = ?auto_412451 ?auto_412454 ) ) ( not ( = ?auto_412451 ?auto_412453 ) ) ( not ( = ?auto_412451 ?auto_412455 ) ) ( not ( = ?auto_412451 ?auto_412456 ) ) ( not ( = ?auto_412451 ?auto_412457 ) ) ( not ( = ?auto_412451 ?auto_412458 ) ) ( not ( = ?auto_412451 ?auto_412463 ) ) ( not ( = ?auto_412452 ?auto_412454 ) ) ( not ( = ?auto_412452 ?auto_412453 ) ) ( not ( = ?auto_412452 ?auto_412455 ) ) ( not ( = ?auto_412452 ?auto_412456 ) ) ( not ( = ?auto_412452 ?auto_412457 ) ) ( not ( = ?auto_412452 ?auto_412458 ) ) ( not ( = ?auto_412452 ?auto_412463 ) ) ( not ( = ?auto_412454 ?auto_412453 ) ) ( not ( = ?auto_412454 ?auto_412455 ) ) ( not ( = ?auto_412454 ?auto_412456 ) ) ( not ( = ?auto_412454 ?auto_412457 ) ) ( not ( = ?auto_412454 ?auto_412458 ) ) ( not ( = ?auto_412454 ?auto_412463 ) ) ( not ( = ?auto_412453 ?auto_412455 ) ) ( not ( = ?auto_412453 ?auto_412456 ) ) ( not ( = ?auto_412453 ?auto_412457 ) ) ( not ( = ?auto_412453 ?auto_412458 ) ) ( not ( = ?auto_412453 ?auto_412463 ) ) ( not ( = ?auto_412455 ?auto_412456 ) ) ( not ( = ?auto_412455 ?auto_412457 ) ) ( not ( = ?auto_412455 ?auto_412458 ) ) ( not ( = ?auto_412455 ?auto_412463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412456 ?auto_412457 ?auto_412458 )
      ( MAKE-8CRATE-VERIFY ?auto_412450 ?auto_412451 ?auto_412452 ?auto_412454 ?auto_412453 ?auto_412455 ?auto_412456 ?auto_412457 ?auto_412458 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_412465 - SURFACE
      ?auto_412466 - SURFACE
    )
    :vars
    (
      ?auto_412470 - HOIST
      ?auto_412472 - PLACE
      ?auto_412473 - SURFACE
      ?auto_412469 - PLACE
      ?auto_412467 - HOIST
      ?auto_412471 - SURFACE
      ?auto_412468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412470 ?auto_412472 ) ( IS-CRATE ?auto_412466 ) ( not ( = ?auto_412465 ?auto_412466 ) ) ( not ( = ?auto_412473 ?auto_412465 ) ) ( not ( = ?auto_412473 ?auto_412466 ) ) ( not ( = ?auto_412469 ?auto_412472 ) ) ( HOIST-AT ?auto_412467 ?auto_412469 ) ( not ( = ?auto_412470 ?auto_412467 ) ) ( SURFACE-AT ?auto_412466 ?auto_412469 ) ( ON ?auto_412466 ?auto_412471 ) ( CLEAR ?auto_412466 ) ( not ( = ?auto_412465 ?auto_412471 ) ) ( not ( = ?auto_412466 ?auto_412471 ) ) ( not ( = ?auto_412473 ?auto_412471 ) ) ( SURFACE-AT ?auto_412473 ?auto_412472 ) ( CLEAR ?auto_412473 ) ( IS-CRATE ?auto_412465 ) ( AVAILABLE ?auto_412470 ) ( TRUCK-AT ?auto_412468 ?auto_412469 ) ( LIFTING ?auto_412467 ?auto_412465 ) )
    :subtasks
    ( ( !LOAD ?auto_412467 ?auto_412465 ?auto_412468 ?auto_412469 )
      ( MAKE-2CRATE ?auto_412473 ?auto_412465 ?auto_412466 )
      ( MAKE-1CRATE-VERIFY ?auto_412465 ?auto_412466 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_412474 - SURFACE
      ?auto_412475 - SURFACE
      ?auto_412476 - SURFACE
    )
    :vars
    (
      ?auto_412482 - HOIST
      ?auto_412481 - PLACE
      ?auto_412477 - PLACE
      ?auto_412478 - HOIST
      ?auto_412479 - SURFACE
      ?auto_412480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412482 ?auto_412481 ) ( IS-CRATE ?auto_412476 ) ( not ( = ?auto_412475 ?auto_412476 ) ) ( not ( = ?auto_412474 ?auto_412475 ) ) ( not ( = ?auto_412474 ?auto_412476 ) ) ( not ( = ?auto_412477 ?auto_412481 ) ) ( HOIST-AT ?auto_412478 ?auto_412477 ) ( not ( = ?auto_412482 ?auto_412478 ) ) ( SURFACE-AT ?auto_412476 ?auto_412477 ) ( ON ?auto_412476 ?auto_412479 ) ( CLEAR ?auto_412476 ) ( not ( = ?auto_412475 ?auto_412479 ) ) ( not ( = ?auto_412476 ?auto_412479 ) ) ( not ( = ?auto_412474 ?auto_412479 ) ) ( SURFACE-AT ?auto_412474 ?auto_412481 ) ( CLEAR ?auto_412474 ) ( IS-CRATE ?auto_412475 ) ( AVAILABLE ?auto_412482 ) ( TRUCK-AT ?auto_412480 ?auto_412477 ) ( LIFTING ?auto_412478 ?auto_412475 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412475 ?auto_412476 )
      ( MAKE-2CRATE-VERIFY ?auto_412474 ?auto_412475 ?auto_412476 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_412483 - SURFACE
      ?auto_412484 - SURFACE
      ?auto_412485 - SURFACE
      ?auto_412486 - SURFACE
    )
    :vars
    (
      ?auto_412489 - HOIST
      ?auto_412490 - PLACE
      ?auto_412488 - PLACE
      ?auto_412491 - HOIST
      ?auto_412492 - SURFACE
      ?auto_412487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412489 ?auto_412490 ) ( IS-CRATE ?auto_412486 ) ( not ( = ?auto_412485 ?auto_412486 ) ) ( not ( = ?auto_412484 ?auto_412485 ) ) ( not ( = ?auto_412484 ?auto_412486 ) ) ( not ( = ?auto_412488 ?auto_412490 ) ) ( HOIST-AT ?auto_412491 ?auto_412488 ) ( not ( = ?auto_412489 ?auto_412491 ) ) ( SURFACE-AT ?auto_412486 ?auto_412488 ) ( ON ?auto_412486 ?auto_412492 ) ( CLEAR ?auto_412486 ) ( not ( = ?auto_412485 ?auto_412492 ) ) ( not ( = ?auto_412486 ?auto_412492 ) ) ( not ( = ?auto_412484 ?auto_412492 ) ) ( SURFACE-AT ?auto_412484 ?auto_412490 ) ( CLEAR ?auto_412484 ) ( IS-CRATE ?auto_412485 ) ( AVAILABLE ?auto_412489 ) ( TRUCK-AT ?auto_412487 ?auto_412488 ) ( LIFTING ?auto_412491 ?auto_412485 ) ( ON ?auto_412484 ?auto_412483 ) ( not ( = ?auto_412483 ?auto_412484 ) ) ( not ( = ?auto_412483 ?auto_412485 ) ) ( not ( = ?auto_412483 ?auto_412486 ) ) ( not ( = ?auto_412483 ?auto_412492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412484 ?auto_412485 ?auto_412486 )
      ( MAKE-3CRATE-VERIFY ?auto_412483 ?auto_412484 ?auto_412485 ?auto_412486 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_412493 - SURFACE
      ?auto_412494 - SURFACE
      ?auto_412495 - SURFACE
      ?auto_412497 - SURFACE
      ?auto_412496 - SURFACE
    )
    :vars
    (
      ?auto_412500 - HOIST
      ?auto_412501 - PLACE
      ?auto_412499 - PLACE
      ?auto_412502 - HOIST
      ?auto_412503 - SURFACE
      ?auto_412498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412500 ?auto_412501 ) ( IS-CRATE ?auto_412496 ) ( not ( = ?auto_412497 ?auto_412496 ) ) ( not ( = ?auto_412495 ?auto_412497 ) ) ( not ( = ?auto_412495 ?auto_412496 ) ) ( not ( = ?auto_412499 ?auto_412501 ) ) ( HOIST-AT ?auto_412502 ?auto_412499 ) ( not ( = ?auto_412500 ?auto_412502 ) ) ( SURFACE-AT ?auto_412496 ?auto_412499 ) ( ON ?auto_412496 ?auto_412503 ) ( CLEAR ?auto_412496 ) ( not ( = ?auto_412497 ?auto_412503 ) ) ( not ( = ?auto_412496 ?auto_412503 ) ) ( not ( = ?auto_412495 ?auto_412503 ) ) ( SURFACE-AT ?auto_412495 ?auto_412501 ) ( CLEAR ?auto_412495 ) ( IS-CRATE ?auto_412497 ) ( AVAILABLE ?auto_412500 ) ( TRUCK-AT ?auto_412498 ?auto_412499 ) ( LIFTING ?auto_412502 ?auto_412497 ) ( ON ?auto_412494 ?auto_412493 ) ( ON ?auto_412495 ?auto_412494 ) ( not ( = ?auto_412493 ?auto_412494 ) ) ( not ( = ?auto_412493 ?auto_412495 ) ) ( not ( = ?auto_412493 ?auto_412497 ) ) ( not ( = ?auto_412493 ?auto_412496 ) ) ( not ( = ?auto_412493 ?auto_412503 ) ) ( not ( = ?auto_412494 ?auto_412495 ) ) ( not ( = ?auto_412494 ?auto_412497 ) ) ( not ( = ?auto_412494 ?auto_412496 ) ) ( not ( = ?auto_412494 ?auto_412503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412495 ?auto_412497 ?auto_412496 )
      ( MAKE-4CRATE-VERIFY ?auto_412493 ?auto_412494 ?auto_412495 ?auto_412497 ?auto_412496 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_412504 - SURFACE
      ?auto_412505 - SURFACE
      ?auto_412506 - SURFACE
      ?auto_412508 - SURFACE
      ?auto_412507 - SURFACE
      ?auto_412509 - SURFACE
    )
    :vars
    (
      ?auto_412512 - HOIST
      ?auto_412513 - PLACE
      ?auto_412511 - PLACE
      ?auto_412514 - HOIST
      ?auto_412515 - SURFACE
      ?auto_412510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412512 ?auto_412513 ) ( IS-CRATE ?auto_412509 ) ( not ( = ?auto_412507 ?auto_412509 ) ) ( not ( = ?auto_412508 ?auto_412507 ) ) ( not ( = ?auto_412508 ?auto_412509 ) ) ( not ( = ?auto_412511 ?auto_412513 ) ) ( HOIST-AT ?auto_412514 ?auto_412511 ) ( not ( = ?auto_412512 ?auto_412514 ) ) ( SURFACE-AT ?auto_412509 ?auto_412511 ) ( ON ?auto_412509 ?auto_412515 ) ( CLEAR ?auto_412509 ) ( not ( = ?auto_412507 ?auto_412515 ) ) ( not ( = ?auto_412509 ?auto_412515 ) ) ( not ( = ?auto_412508 ?auto_412515 ) ) ( SURFACE-AT ?auto_412508 ?auto_412513 ) ( CLEAR ?auto_412508 ) ( IS-CRATE ?auto_412507 ) ( AVAILABLE ?auto_412512 ) ( TRUCK-AT ?auto_412510 ?auto_412511 ) ( LIFTING ?auto_412514 ?auto_412507 ) ( ON ?auto_412505 ?auto_412504 ) ( ON ?auto_412506 ?auto_412505 ) ( ON ?auto_412508 ?auto_412506 ) ( not ( = ?auto_412504 ?auto_412505 ) ) ( not ( = ?auto_412504 ?auto_412506 ) ) ( not ( = ?auto_412504 ?auto_412508 ) ) ( not ( = ?auto_412504 ?auto_412507 ) ) ( not ( = ?auto_412504 ?auto_412509 ) ) ( not ( = ?auto_412504 ?auto_412515 ) ) ( not ( = ?auto_412505 ?auto_412506 ) ) ( not ( = ?auto_412505 ?auto_412508 ) ) ( not ( = ?auto_412505 ?auto_412507 ) ) ( not ( = ?auto_412505 ?auto_412509 ) ) ( not ( = ?auto_412505 ?auto_412515 ) ) ( not ( = ?auto_412506 ?auto_412508 ) ) ( not ( = ?auto_412506 ?auto_412507 ) ) ( not ( = ?auto_412506 ?auto_412509 ) ) ( not ( = ?auto_412506 ?auto_412515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412508 ?auto_412507 ?auto_412509 )
      ( MAKE-5CRATE-VERIFY ?auto_412504 ?auto_412505 ?auto_412506 ?auto_412508 ?auto_412507 ?auto_412509 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_412516 - SURFACE
      ?auto_412517 - SURFACE
      ?auto_412518 - SURFACE
      ?auto_412520 - SURFACE
      ?auto_412519 - SURFACE
      ?auto_412521 - SURFACE
      ?auto_412522 - SURFACE
    )
    :vars
    (
      ?auto_412525 - HOIST
      ?auto_412526 - PLACE
      ?auto_412524 - PLACE
      ?auto_412527 - HOIST
      ?auto_412528 - SURFACE
      ?auto_412523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412525 ?auto_412526 ) ( IS-CRATE ?auto_412522 ) ( not ( = ?auto_412521 ?auto_412522 ) ) ( not ( = ?auto_412519 ?auto_412521 ) ) ( not ( = ?auto_412519 ?auto_412522 ) ) ( not ( = ?auto_412524 ?auto_412526 ) ) ( HOIST-AT ?auto_412527 ?auto_412524 ) ( not ( = ?auto_412525 ?auto_412527 ) ) ( SURFACE-AT ?auto_412522 ?auto_412524 ) ( ON ?auto_412522 ?auto_412528 ) ( CLEAR ?auto_412522 ) ( not ( = ?auto_412521 ?auto_412528 ) ) ( not ( = ?auto_412522 ?auto_412528 ) ) ( not ( = ?auto_412519 ?auto_412528 ) ) ( SURFACE-AT ?auto_412519 ?auto_412526 ) ( CLEAR ?auto_412519 ) ( IS-CRATE ?auto_412521 ) ( AVAILABLE ?auto_412525 ) ( TRUCK-AT ?auto_412523 ?auto_412524 ) ( LIFTING ?auto_412527 ?auto_412521 ) ( ON ?auto_412517 ?auto_412516 ) ( ON ?auto_412518 ?auto_412517 ) ( ON ?auto_412520 ?auto_412518 ) ( ON ?auto_412519 ?auto_412520 ) ( not ( = ?auto_412516 ?auto_412517 ) ) ( not ( = ?auto_412516 ?auto_412518 ) ) ( not ( = ?auto_412516 ?auto_412520 ) ) ( not ( = ?auto_412516 ?auto_412519 ) ) ( not ( = ?auto_412516 ?auto_412521 ) ) ( not ( = ?auto_412516 ?auto_412522 ) ) ( not ( = ?auto_412516 ?auto_412528 ) ) ( not ( = ?auto_412517 ?auto_412518 ) ) ( not ( = ?auto_412517 ?auto_412520 ) ) ( not ( = ?auto_412517 ?auto_412519 ) ) ( not ( = ?auto_412517 ?auto_412521 ) ) ( not ( = ?auto_412517 ?auto_412522 ) ) ( not ( = ?auto_412517 ?auto_412528 ) ) ( not ( = ?auto_412518 ?auto_412520 ) ) ( not ( = ?auto_412518 ?auto_412519 ) ) ( not ( = ?auto_412518 ?auto_412521 ) ) ( not ( = ?auto_412518 ?auto_412522 ) ) ( not ( = ?auto_412518 ?auto_412528 ) ) ( not ( = ?auto_412520 ?auto_412519 ) ) ( not ( = ?auto_412520 ?auto_412521 ) ) ( not ( = ?auto_412520 ?auto_412522 ) ) ( not ( = ?auto_412520 ?auto_412528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412519 ?auto_412521 ?auto_412522 )
      ( MAKE-6CRATE-VERIFY ?auto_412516 ?auto_412517 ?auto_412518 ?auto_412520 ?auto_412519 ?auto_412521 ?auto_412522 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_412529 - SURFACE
      ?auto_412530 - SURFACE
      ?auto_412531 - SURFACE
      ?auto_412533 - SURFACE
      ?auto_412532 - SURFACE
      ?auto_412534 - SURFACE
      ?auto_412535 - SURFACE
      ?auto_412536 - SURFACE
    )
    :vars
    (
      ?auto_412539 - HOIST
      ?auto_412540 - PLACE
      ?auto_412538 - PLACE
      ?auto_412541 - HOIST
      ?auto_412542 - SURFACE
      ?auto_412537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412539 ?auto_412540 ) ( IS-CRATE ?auto_412536 ) ( not ( = ?auto_412535 ?auto_412536 ) ) ( not ( = ?auto_412534 ?auto_412535 ) ) ( not ( = ?auto_412534 ?auto_412536 ) ) ( not ( = ?auto_412538 ?auto_412540 ) ) ( HOIST-AT ?auto_412541 ?auto_412538 ) ( not ( = ?auto_412539 ?auto_412541 ) ) ( SURFACE-AT ?auto_412536 ?auto_412538 ) ( ON ?auto_412536 ?auto_412542 ) ( CLEAR ?auto_412536 ) ( not ( = ?auto_412535 ?auto_412542 ) ) ( not ( = ?auto_412536 ?auto_412542 ) ) ( not ( = ?auto_412534 ?auto_412542 ) ) ( SURFACE-AT ?auto_412534 ?auto_412540 ) ( CLEAR ?auto_412534 ) ( IS-CRATE ?auto_412535 ) ( AVAILABLE ?auto_412539 ) ( TRUCK-AT ?auto_412537 ?auto_412538 ) ( LIFTING ?auto_412541 ?auto_412535 ) ( ON ?auto_412530 ?auto_412529 ) ( ON ?auto_412531 ?auto_412530 ) ( ON ?auto_412533 ?auto_412531 ) ( ON ?auto_412532 ?auto_412533 ) ( ON ?auto_412534 ?auto_412532 ) ( not ( = ?auto_412529 ?auto_412530 ) ) ( not ( = ?auto_412529 ?auto_412531 ) ) ( not ( = ?auto_412529 ?auto_412533 ) ) ( not ( = ?auto_412529 ?auto_412532 ) ) ( not ( = ?auto_412529 ?auto_412534 ) ) ( not ( = ?auto_412529 ?auto_412535 ) ) ( not ( = ?auto_412529 ?auto_412536 ) ) ( not ( = ?auto_412529 ?auto_412542 ) ) ( not ( = ?auto_412530 ?auto_412531 ) ) ( not ( = ?auto_412530 ?auto_412533 ) ) ( not ( = ?auto_412530 ?auto_412532 ) ) ( not ( = ?auto_412530 ?auto_412534 ) ) ( not ( = ?auto_412530 ?auto_412535 ) ) ( not ( = ?auto_412530 ?auto_412536 ) ) ( not ( = ?auto_412530 ?auto_412542 ) ) ( not ( = ?auto_412531 ?auto_412533 ) ) ( not ( = ?auto_412531 ?auto_412532 ) ) ( not ( = ?auto_412531 ?auto_412534 ) ) ( not ( = ?auto_412531 ?auto_412535 ) ) ( not ( = ?auto_412531 ?auto_412536 ) ) ( not ( = ?auto_412531 ?auto_412542 ) ) ( not ( = ?auto_412533 ?auto_412532 ) ) ( not ( = ?auto_412533 ?auto_412534 ) ) ( not ( = ?auto_412533 ?auto_412535 ) ) ( not ( = ?auto_412533 ?auto_412536 ) ) ( not ( = ?auto_412533 ?auto_412542 ) ) ( not ( = ?auto_412532 ?auto_412534 ) ) ( not ( = ?auto_412532 ?auto_412535 ) ) ( not ( = ?auto_412532 ?auto_412536 ) ) ( not ( = ?auto_412532 ?auto_412542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412534 ?auto_412535 ?auto_412536 )
      ( MAKE-7CRATE-VERIFY ?auto_412529 ?auto_412530 ?auto_412531 ?auto_412533 ?auto_412532 ?auto_412534 ?auto_412535 ?auto_412536 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412543 - SURFACE
      ?auto_412544 - SURFACE
      ?auto_412545 - SURFACE
      ?auto_412547 - SURFACE
      ?auto_412546 - SURFACE
      ?auto_412548 - SURFACE
      ?auto_412549 - SURFACE
      ?auto_412550 - SURFACE
      ?auto_412551 - SURFACE
    )
    :vars
    (
      ?auto_412554 - HOIST
      ?auto_412555 - PLACE
      ?auto_412553 - PLACE
      ?auto_412556 - HOIST
      ?auto_412557 - SURFACE
      ?auto_412552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412554 ?auto_412555 ) ( IS-CRATE ?auto_412551 ) ( not ( = ?auto_412550 ?auto_412551 ) ) ( not ( = ?auto_412549 ?auto_412550 ) ) ( not ( = ?auto_412549 ?auto_412551 ) ) ( not ( = ?auto_412553 ?auto_412555 ) ) ( HOIST-AT ?auto_412556 ?auto_412553 ) ( not ( = ?auto_412554 ?auto_412556 ) ) ( SURFACE-AT ?auto_412551 ?auto_412553 ) ( ON ?auto_412551 ?auto_412557 ) ( CLEAR ?auto_412551 ) ( not ( = ?auto_412550 ?auto_412557 ) ) ( not ( = ?auto_412551 ?auto_412557 ) ) ( not ( = ?auto_412549 ?auto_412557 ) ) ( SURFACE-AT ?auto_412549 ?auto_412555 ) ( CLEAR ?auto_412549 ) ( IS-CRATE ?auto_412550 ) ( AVAILABLE ?auto_412554 ) ( TRUCK-AT ?auto_412552 ?auto_412553 ) ( LIFTING ?auto_412556 ?auto_412550 ) ( ON ?auto_412544 ?auto_412543 ) ( ON ?auto_412545 ?auto_412544 ) ( ON ?auto_412547 ?auto_412545 ) ( ON ?auto_412546 ?auto_412547 ) ( ON ?auto_412548 ?auto_412546 ) ( ON ?auto_412549 ?auto_412548 ) ( not ( = ?auto_412543 ?auto_412544 ) ) ( not ( = ?auto_412543 ?auto_412545 ) ) ( not ( = ?auto_412543 ?auto_412547 ) ) ( not ( = ?auto_412543 ?auto_412546 ) ) ( not ( = ?auto_412543 ?auto_412548 ) ) ( not ( = ?auto_412543 ?auto_412549 ) ) ( not ( = ?auto_412543 ?auto_412550 ) ) ( not ( = ?auto_412543 ?auto_412551 ) ) ( not ( = ?auto_412543 ?auto_412557 ) ) ( not ( = ?auto_412544 ?auto_412545 ) ) ( not ( = ?auto_412544 ?auto_412547 ) ) ( not ( = ?auto_412544 ?auto_412546 ) ) ( not ( = ?auto_412544 ?auto_412548 ) ) ( not ( = ?auto_412544 ?auto_412549 ) ) ( not ( = ?auto_412544 ?auto_412550 ) ) ( not ( = ?auto_412544 ?auto_412551 ) ) ( not ( = ?auto_412544 ?auto_412557 ) ) ( not ( = ?auto_412545 ?auto_412547 ) ) ( not ( = ?auto_412545 ?auto_412546 ) ) ( not ( = ?auto_412545 ?auto_412548 ) ) ( not ( = ?auto_412545 ?auto_412549 ) ) ( not ( = ?auto_412545 ?auto_412550 ) ) ( not ( = ?auto_412545 ?auto_412551 ) ) ( not ( = ?auto_412545 ?auto_412557 ) ) ( not ( = ?auto_412547 ?auto_412546 ) ) ( not ( = ?auto_412547 ?auto_412548 ) ) ( not ( = ?auto_412547 ?auto_412549 ) ) ( not ( = ?auto_412547 ?auto_412550 ) ) ( not ( = ?auto_412547 ?auto_412551 ) ) ( not ( = ?auto_412547 ?auto_412557 ) ) ( not ( = ?auto_412546 ?auto_412548 ) ) ( not ( = ?auto_412546 ?auto_412549 ) ) ( not ( = ?auto_412546 ?auto_412550 ) ) ( not ( = ?auto_412546 ?auto_412551 ) ) ( not ( = ?auto_412546 ?auto_412557 ) ) ( not ( = ?auto_412548 ?auto_412549 ) ) ( not ( = ?auto_412548 ?auto_412550 ) ) ( not ( = ?auto_412548 ?auto_412551 ) ) ( not ( = ?auto_412548 ?auto_412557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412549 ?auto_412550 ?auto_412551 )
      ( MAKE-8CRATE-VERIFY ?auto_412543 ?auto_412544 ?auto_412545 ?auto_412547 ?auto_412546 ?auto_412548 ?auto_412549 ?auto_412550 ?auto_412551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_412558 - SURFACE
      ?auto_412559 - SURFACE
    )
    :vars
    (
      ?auto_412562 - HOIST
      ?auto_412563 - PLACE
      ?auto_412566 - SURFACE
      ?auto_412561 - PLACE
      ?auto_412564 - HOIST
      ?auto_412565 - SURFACE
      ?auto_412560 - TRUCK
      ?auto_412567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412562 ?auto_412563 ) ( IS-CRATE ?auto_412559 ) ( not ( = ?auto_412558 ?auto_412559 ) ) ( not ( = ?auto_412566 ?auto_412558 ) ) ( not ( = ?auto_412566 ?auto_412559 ) ) ( not ( = ?auto_412561 ?auto_412563 ) ) ( HOIST-AT ?auto_412564 ?auto_412561 ) ( not ( = ?auto_412562 ?auto_412564 ) ) ( SURFACE-AT ?auto_412559 ?auto_412561 ) ( ON ?auto_412559 ?auto_412565 ) ( CLEAR ?auto_412559 ) ( not ( = ?auto_412558 ?auto_412565 ) ) ( not ( = ?auto_412559 ?auto_412565 ) ) ( not ( = ?auto_412566 ?auto_412565 ) ) ( SURFACE-AT ?auto_412566 ?auto_412563 ) ( CLEAR ?auto_412566 ) ( IS-CRATE ?auto_412558 ) ( AVAILABLE ?auto_412562 ) ( TRUCK-AT ?auto_412560 ?auto_412561 ) ( AVAILABLE ?auto_412564 ) ( SURFACE-AT ?auto_412558 ?auto_412561 ) ( ON ?auto_412558 ?auto_412567 ) ( CLEAR ?auto_412558 ) ( not ( = ?auto_412558 ?auto_412567 ) ) ( not ( = ?auto_412559 ?auto_412567 ) ) ( not ( = ?auto_412566 ?auto_412567 ) ) ( not ( = ?auto_412565 ?auto_412567 ) ) )
    :subtasks
    ( ( !LIFT ?auto_412564 ?auto_412558 ?auto_412567 ?auto_412561 )
      ( MAKE-2CRATE ?auto_412566 ?auto_412558 ?auto_412559 )
      ( MAKE-1CRATE-VERIFY ?auto_412558 ?auto_412559 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_412568 - SURFACE
      ?auto_412569 - SURFACE
      ?auto_412570 - SURFACE
    )
    :vars
    (
      ?auto_412575 - HOIST
      ?auto_412576 - PLACE
      ?auto_412572 - PLACE
      ?auto_412577 - HOIST
      ?auto_412573 - SURFACE
      ?auto_412571 - TRUCK
      ?auto_412574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412575 ?auto_412576 ) ( IS-CRATE ?auto_412570 ) ( not ( = ?auto_412569 ?auto_412570 ) ) ( not ( = ?auto_412568 ?auto_412569 ) ) ( not ( = ?auto_412568 ?auto_412570 ) ) ( not ( = ?auto_412572 ?auto_412576 ) ) ( HOIST-AT ?auto_412577 ?auto_412572 ) ( not ( = ?auto_412575 ?auto_412577 ) ) ( SURFACE-AT ?auto_412570 ?auto_412572 ) ( ON ?auto_412570 ?auto_412573 ) ( CLEAR ?auto_412570 ) ( not ( = ?auto_412569 ?auto_412573 ) ) ( not ( = ?auto_412570 ?auto_412573 ) ) ( not ( = ?auto_412568 ?auto_412573 ) ) ( SURFACE-AT ?auto_412568 ?auto_412576 ) ( CLEAR ?auto_412568 ) ( IS-CRATE ?auto_412569 ) ( AVAILABLE ?auto_412575 ) ( TRUCK-AT ?auto_412571 ?auto_412572 ) ( AVAILABLE ?auto_412577 ) ( SURFACE-AT ?auto_412569 ?auto_412572 ) ( ON ?auto_412569 ?auto_412574 ) ( CLEAR ?auto_412569 ) ( not ( = ?auto_412569 ?auto_412574 ) ) ( not ( = ?auto_412570 ?auto_412574 ) ) ( not ( = ?auto_412568 ?auto_412574 ) ) ( not ( = ?auto_412573 ?auto_412574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412569 ?auto_412570 )
      ( MAKE-2CRATE-VERIFY ?auto_412568 ?auto_412569 ?auto_412570 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_412578 - SURFACE
      ?auto_412579 - SURFACE
      ?auto_412580 - SURFACE
      ?auto_412581 - SURFACE
    )
    :vars
    (
      ?auto_412588 - HOIST
      ?auto_412585 - PLACE
      ?auto_412586 - PLACE
      ?auto_412582 - HOIST
      ?auto_412583 - SURFACE
      ?auto_412587 - TRUCK
      ?auto_412584 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412588 ?auto_412585 ) ( IS-CRATE ?auto_412581 ) ( not ( = ?auto_412580 ?auto_412581 ) ) ( not ( = ?auto_412579 ?auto_412580 ) ) ( not ( = ?auto_412579 ?auto_412581 ) ) ( not ( = ?auto_412586 ?auto_412585 ) ) ( HOIST-AT ?auto_412582 ?auto_412586 ) ( not ( = ?auto_412588 ?auto_412582 ) ) ( SURFACE-AT ?auto_412581 ?auto_412586 ) ( ON ?auto_412581 ?auto_412583 ) ( CLEAR ?auto_412581 ) ( not ( = ?auto_412580 ?auto_412583 ) ) ( not ( = ?auto_412581 ?auto_412583 ) ) ( not ( = ?auto_412579 ?auto_412583 ) ) ( SURFACE-AT ?auto_412579 ?auto_412585 ) ( CLEAR ?auto_412579 ) ( IS-CRATE ?auto_412580 ) ( AVAILABLE ?auto_412588 ) ( TRUCK-AT ?auto_412587 ?auto_412586 ) ( AVAILABLE ?auto_412582 ) ( SURFACE-AT ?auto_412580 ?auto_412586 ) ( ON ?auto_412580 ?auto_412584 ) ( CLEAR ?auto_412580 ) ( not ( = ?auto_412580 ?auto_412584 ) ) ( not ( = ?auto_412581 ?auto_412584 ) ) ( not ( = ?auto_412579 ?auto_412584 ) ) ( not ( = ?auto_412583 ?auto_412584 ) ) ( ON ?auto_412579 ?auto_412578 ) ( not ( = ?auto_412578 ?auto_412579 ) ) ( not ( = ?auto_412578 ?auto_412580 ) ) ( not ( = ?auto_412578 ?auto_412581 ) ) ( not ( = ?auto_412578 ?auto_412583 ) ) ( not ( = ?auto_412578 ?auto_412584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412579 ?auto_412580 ?auto_412581 )
      ( MAKE-3CRATE-VERIFY ?auto_412578 ?auto_412579 ?auto_412580 ?auto_412581 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_412589 - SURFACE
      ?auto_412590 - SURFACE
      ?auto_412591 - SURFACE
      ?auto_412593 - SURFACE
      ?auto_412592 - SURFACE
    )
    :vars
    (
      ?auto_412600 - HOIST
      ?auto_412597 - PLACE
      ?auto_412598 - PLACE
      ?auto_412594 - HOIST
      ?auto_412595 - SURFACE
      ?auto_412599 - TRUCK
      ?auto_412596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412600 ?auto_412597 ) ( IS-CRATE ?auto_412592 ) ( not ( = ?auto_412593 ?auto_412592 ) ) ( not ( = ?auto_412591 ?auto_412593 ) ) ( not ( = ?auto_412591 ?auto_412592 ) ) ( not ( = ?auto_412598 ?auto_412597 ) ) ( HOIST-AT ?auto_412594 ?auto_412598 ) ( not ( = ?auto_412600 ?auto_412594 ) ) ( SURFACE-AT ?auto_412592 ?auto_412598 ) ( ON ?auto_412592 ?auto_412595 ) ( CLEAR ?auto_412592 ) ( not ( = ?auto_412593 ?auto_412595 ) ) ( not ( = ?auto_412592 ?auto_412595 ) ) ( not ( = ?auto_412591 ?auto_412595 ) ) ( SURFACE-AT ?auto_412591 ?auto_412597 ) ( CLEAR ?auto_412591 ) ( IS-CRATE ?auto_412593 ) ( AVAILABLE ?auto_412600 ) ( TRUCK-AT ?auto_412599 ?auto_412598 ) ( AVAILABLE ?auto_412594 ) ( SURFACE-AT ?auto_412593 ?auto_412598 ) ( ON ?auto_412593 ?auto_412596 ) ( CLEAR ?auto_412593 ) ( not ( = ?auto_412593 ?auto_412596 ) ) ( not ( = ?auto_412592 ?auto_412596 ) ) ( not ( = ?auto_412591 ?auto_412596 ) ) ( not ( = ?auto_412595 ?auto_412596 ) ) ( ON ?auto_412590 ?auto_412589 ) ( ON ?auto_412591 ?auto_412590 ) ( not ( = ?auto_412589 ?auto_412590 ) ) ( not ( = ?auto_412589 ?auto_412591 ) ) ( not ( = ?auto_412589 ?auto_412593 ) ) ( not ( = ?auto_412589 ?auto_412592 ) ) ( not ( = ?auto_412589 ?auto_412595 ) ) ( not ( = ?auto_412589 ?auto_412596 ) ) ( not ( = ?auto_412590 ?auto_412591 ) ) ( not ( = ?auto_412590 ?auto_412593 ) ) ( not ( = ?auto_412590 ?auto_412592 ) ) ( not ( = ?auto_412590 ?auto_412595 ) ) ( not ( = ?auto_412590 ?auto_412596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412591 ?auto_412593 ?auto_412592 )
      ( MAKE-4CRATE-VERIFY ?auto_412589 ?auto_412590 ?auto_412591 ?auto_412593 ?auto_412592 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_412601 - SURFACE
      ?auto_412602 - SURFACE
      ?auto_412603 - SURFACE
      ?auto_412605 - SURFACE
      ?auto_412604 - SURFACE
      ?auto_412606 - SURFACE
    )
    :vars
    (
      ?auto_412613 - HOIST
      ?auto_412610 - PLACE
      ?auto_412611 - PLACE
      ?auto_412607 - HOIST
      ?auto_412608 - SURFACE
      ?auto_412612 - TRUCK
      ?auto_412609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412613 ?auto_412610 ) ( IS-CRATE ?auto_412606 ) ( not ( = ?auto_412604 ?auto_412606 ) ) ( not ( = ?auto_412605 ?auto_412604 ) ) ( not ( = ?auto_412605 ?auto_412606 ) ) ( not ( = ?auto_412611 ?auto_412610 ) ) ( HOIST-AT ?auto_412607 ?auto_412611 ) ( not ( = ?auto_412613 ?auto_412607 ) ) ( SURFACE-AT ?auto_412606 ?auto_412611 ) ( ON ?auto_412606 ?auto_412608 ) ( CLEAR ?auto_412606 ) ( not ( = ?auto_412604 ?auto_412608 ) ) ( not ( = ?auto_412606 ?auto_412608 ) ) ( not ( = ?auto_412605 ?auto_412608 ) ) ( SURFACE-AT ?auto_412605 ?auto_412610 ) ( CLEAR ?auto_412605 ) ( IS-CRATE ?auto_412604 ) ( AVAILABLE ?auto_412613 ) ( TRUCK-AT ?auto_412612 ?auto_412611 ) ( AVAILABLE ?auto_412607 ) ( SURFACE-AT ?auto_412604 ?auto_412611 ) ( ON ?auto_412604 ?auto_412609 ) ( CLEAR ?auto_412604 ) ( not ( = ?auto_412604 ?auto_412609 ) ) ( not ( = ?auto_412606 ?auto_412609 ) ) ( not ( = ?auto_412605 ?auto_412609 ) ) ( not ( = ?auto_412608 ?auto_412609 ) ) ( ON ?auto_412602 ?auto_412601 ) ( ON ?auto_412603 ?auto_412602 ) ( ON ?auto_412605 ?auto_412603 ) ( not ( = ?auto_412601 ?auto_412602 ) ) ( not ( = ?auto_412601 ?auto_412603 ) ) ( not ( = ?auto_412601 ?auto_412605 ) ) ( not ( = ?auto_412601 ?auto_412604 ) ) ( not ( = ?auto_412601 ?auto_412606 ) ) ( not ( = ?auto_412601 ?auto_412608 ) ) ( not ( = ?auto_412601 ?auto_412609 ) ) ( not ( = ?auto_412602 ?auto_412603 ) ) ( not ( = ?auto_412602 ?auto_412605 ) ) ( not ( = ?auto_412602 ?auto_412604 ) ) ( not ( = ?auto_412602 ?auto_412606 ) ) ( not ( = ?auto_412602 ?auto_412608 ) ) ( not ( = ?auto_412602 ?auto_412609 ) ) ( not ( = ?auto_412603 ?auto_412605 ) ) ( not ( = ?auto_412603 ?auto_412604 ) ) ( not ( = ?auto_412603 ?auto_412606 ) ) ( not ( = ?auto_412603 ?auto_412608 ) ) ( not ( = ?auto_412603 ?auto_412609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412605 ?auto_412604 ?auto_412606 )
      ( MAKE-5CRATE-VERIFY ?auto_412601 ?auto_412602 ?auto_412603 ?auto_412605 ?auto_412604 ?auto_412606 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_412614 - SURFACE
      ?auto_412615 - SURFACE
      ?auto_412616 - SURFACE
      ?auto_412618 - SURFACE
      ?auto_412617 - SURFACE
      ?auto_412619 - SURFACE
      ?auto_412620 - SURFACE
    )
    :vars
    (
      ?auto_412627 - HOIST
      ?auto_412624 - PLACE
      ?auto_412625 - PLACE
      ?auto_412621 - HOIST
      ?auto_412622 - SURFACE
      ?auto_412626 - TRUCK
      ?auto_412623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412627 ?auto_412624 ) ( IS-CRATE ?auto_412620 ) ( not ( = ?auto_412619 ?auto_412620 ) ) ( not ( = ?auto_412617 ?auto_412619 ) ) ( not ( = ?auto_412617 ?auto_412620 ) ) ( not ( = ?auto_412625 ?auto_412624 ) ) ( HOIST-AT ?auto_412621 ?auto_412625 ) ( not ( = ?auto_412627 ?auto_412621 ) ) ( SURFACE-AT ?auto_412620 ?auto_412625 ) ( ON ?auto_412620 ?auto_412622 ) ( CLEAR ?auto_412620 ) ( not ( = ?auto_412619 ?auto_412622 ) ) ( not ( = ?auto_412620 ?auto_412622 ) ) ( not ( = ?auto_412617 ?auto_412622 ) ) ( SURFACE-AT ?auto_412617 ?auto_412624 ) ( CLEAR ?auto_412617 ) ( IS-CRATE ?auto_412619 ) ( AVAILABLE ?auto_412627 ) ( TRUCK-AT ?auto_412626 ?auto_412625 ) ( AVAILABLE ?auto_412621 ) ( SURFACE-AT ?auto_412619 ?auto_412625 ) ( ON ?auto_412619 ?auto_412623 ) ( CLEAR ?auto_412619 ) ( not ( = ?auto_412619 ?auto_412623 ) ) ( not ( = ?auto_412620 ?auto_412623 ) ) ( not ( = ?auto_412617 ?auto_412623 ) ) ( not ( = ?auto_412622 ?auto_412623 ) ) ( ON ?auto_412615 ?auto_412614 ) ( ON ?auto_412616 ?auto_412615 ) ( ON ?auto_412618 ?auto_412616 ) ( ON ?auto_412617 ?auto_412618 ) ( not ( = ?auto_412614 ?auto_412615 ) ) ( not ( = ?auto_412614 ?auto_412616 ) ) ( not ( = ?auto_412614 ?auto_412618 ) ) ( not ( = ?auto_412614 ?auto_412617 ) ) ( not ( = ?auto_412614 ?auto_412619 ) ) ( not ( = ?auto_412614 ?auto_412620 ) ) ( not ( = ?auto_412614 ?auto_412622 ) ) ( not ( = ?auto_412614 ?auto_412623 ) ) ( not ( = ?auto_412615 ?auto_412616 ) ) ( not ( = ?auto_412615 ?auto_412618 ) ) ( not ( = ?auto_412615 ?auto_412617 ) ) ( not ( = ?auto_412615 ?auto_412619 ) ) ( not ( = ?auto_412615 ?auto_412620 ) ) ( not ( = ?auto_412615 ?auto_412622 ) ) ( not ( = ?auto_412615 ?auto_412623 ) ) ( not ( = ?auto_412616 ?auto_412618 ) ) ( not ( = ?auto_412616 ?auto_412617 ) ) ( not ( = ?auto_412616 ?auto_412619 ) ) ( not ( = ?auto_412616 ?auto_412620 ) ) ( not ( = ?auto_412616 ?auto_412622 ) ) ( not ( = ?auto_412616 ?auto_412623 ) ) ( not ( = ?auto_412618 ?auto_412617 ) ) ( not ( = ?auto_412618 ?auto_412619 ) ) ( not ( = ?auto_412618 ?auto_412620 ) ) ( not ( = ?auto_412618 ?auto_412622 ) ) ( not ( = ?auto_412618 ?auto_412623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412617 ?auto_412619 ?auto_412620 )
      ( MAKE-6CRATE-VERIFY ?auto_412614 ?auto_412615 ?auto_412616 ?auto_412618 ?auto_412617 ?auto_412619 ?auto_412620 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_412628 - SURFACE
      ?auto_412629 - SURFACE
      ?auto_412630 - SURFACE
      ?auto_412632 - SURFACE
      ?auto_412631 - SURFACE
      ?auto_412633 - SURFACE
      ?auto_412634 - SURFACE
      ?auto_412635 - SURFACE
    )
    :vars
    (
      ?auto_412642 - HOIST
      ?auto_412639 - PLACE
      ?auto_412640 - PLACE
      ?auto_412636 - HOIST
      ?auto_412637 - SURFACE
      ?auto_412641 - TRUCK
      ?auto_412638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412642 ?auto_412639 ) ( IS-CRATE ?auto_412635 ) ( not ( = ?auto_412634 ?auto_412635 ) ) ( not ( = ?auto_412633 ?auto_412634 ) ) ( not ( = ?auto_412633 ?auto_412635 ) ) ( not ( = ?auto_412640 ?auto_412639 ) ) ( HOIST-AT ?auto_412636 ?auto_412640 ) ( not ( = ?auto_412642 ?auto_412636 ) ) ( SURFACE-AT ?auto_412635 ?auto_412640 ) ( ON ?auto_412635 ?auto_412637 ) ( CLEAR ?auto_412635 ) ( not ( = ?auto_412634 ?auto_412637 ) ) ( not ( = ?auto_412635 ?auto_412637 ) ) ( not ( = ?auto_412633 ?auto_412637 ) ) ( SURFACE-AT ?auto_412633 ?auto_412639 ) ( CLEAR ?auto_412633 ) ( IS-CRATE ?auto_412634 ) ( AVAILABLE ?auto_412642 ) ( TRUCK-AT ?auto_412641 ?auto_412640 ) ( AVAILABLE ?auto_412636 ) ( SURFACE-AT ?auto_412634 ?auto_412640 ) ( ON ?auto_412634 ?auto_412638 ) ( CLEAR ?auto_412634 ) ( not ( = ?auto_412634 ?auto_412638 ) ) ( not ( = ?auto_412635 ?auto_412638 ) ) ( not ( = ?auto_412633 ?auto_412638 ) ) ( not ( = ?auto_412637 ?auto_412638 ) ) ( ON ?auto_412629 ?auto_412628 ) ( ON ?auto_412630 ?auto_412629 ) ( ON ?auto_412632 ?auto_412630 ) ( ON ?auto_412631 ?auto_412632 ) ( ON ?auto_412633 ?auto_412631 ) ( not ( = ?auto_412628 ?auto_412629 ) ) ( not ( = ?auto_412628 ?auto_412630 ) ) ( not ( = ?auto_412628 ?auto_412632 ) ) ( not ( = ?auto_412628 ?auto_412631 ) ) ( not ( = ?auto_412628 ?auto_412633 ) ) ( not ( = ?auto_412628 ?auto_412634 ) ) ( not ( = ?auto_412628 ?auto_412635 ) ) ( not ( = ?auto_412628 ?auto_412637 ) ) ( not ( = ?auto_412628 ?auto_412638 ) ) ( not ( = ?auto_412629 ?auto_412630 ) ) ( not ( = ?auto_412629 ?auto_412632 ) ) ( not ( = ?auto_412629 ?auto_412631 ) ) ( not ( = ?auto_412629 ?auto_412633 ) ) ( not ( = ?auto_412629 ?auto_412634 ) ) ( not ( = ?auto_412629 ?auto_412635 ) ) ( not ( = ?auto_412629 ?auto_412637 ) ) ( not ( = ?auto_412629 ?auto_412638 ) ) ( not ( = ?auto_412630 ?auto_412632 ) ) ( not ( = ?auto_412630 ?auto_412631 ) ) ( not ( = ?auto_412630 ?auto_412633 ) ) ( not ( = ?auto_412630 ?auto_412634 ) ) ( not ( = ?auto_412630 ?auto_412635 ) ) ( not ( = ?auto_412630 ?auto_412637 ) ) ( not ( = ?auto_412630 ?auto_412638 ) ) ( not ( = ?auto_412632 ?auto_412631 ) ) ( not ( = ?auto_412632 ?auto_412633 ) ) ( not ( = ?auto_412632 ?auto_412634 ) ) ( not ( = ?auto_412632 ?auto_412635 ) ) ( not ( = ?auto_412632 ?auto_412637 ) ) ( not ( = ?auto_412632 ?auto_412638 ) ) ( not ( = ?auto_412631 ?auto_412633 ) ) ( not ( = ?auto_412631 ?auto_412634 ) ) ( not ( = ?auto_412631 ?auto_412635 ) ) ( not ( = ?auto_412631 ?auto_412637 ) ) ( not ( = ?auto_412631 ?auto_412638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412633 ?auto_412634 ?auto_412635 )
      ( MAKE-7CRATE-VERIFY ?auto_412628 ?auto_412629 ?auto_412630 ?auto_412632 ?auto_412631 ?auto_412633 ?auto_412634 ?auto_412635 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412643 - SURFACE
      ?auto_412644 - SURFACE
      ?auto_412645 - SURFACE
      ?auto_412647 - SURFACE
      ?auto_412646 - SURFACE
      ?auto_412648 - SURFACE
      ?auto_412649 - SURFACE
      ?auto_412650 - SURFACE
      ?auto_412651 - SURFACE
    )
    :vars
    (
      ?auto_412658 - HOIST
      ?auto_412655 - PLACE
      ?auto_412656 - PLACE
      ?auto_412652 - HOIST
      ?auto_412653 - SURFACE
      ?auto_412657 - TRUCK
      ?auto_412654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412658 ?auto_412655 ) ( IS-CRATE ?auto_412651 ) ( not ( = ?auto_412650 ?auto_412651 ) ) ( not ( = ?auto_412649 ?auto_412650 ) ) ( not ( = ?auto_412649 ?auto_412651 ) ) ( not ( = ?auto_412656 ?auto_412655 ) ) ( HOIST-AT ?auto_412652 ?auto_412656 ) ( not ( = ?auto_412658 ?auto_412652 ) ) ( SURFACE-AT ?auto_412651 ?auto_412656 ) ( ON ?auto_412651 ?auto_412653 ) ( CLEAR ?auto_412651 ) ( not ( = ?auto_412650 ?auto_412653 ) ) ( not ( = ?auto_412651 ?auto_412653 ) ) ( not ( = ?auto_412649 ?auto_412653 ) ) ( SURFACE-AT ?auto_412649 ?auto_412655 ) ( CLEAR ?auto_412649 ) ( IS-CRATE ?auto_412650 ) ( AVAILABLE ?auto_412658 ) ( TRUCK-AT ?auto_412657 ?auto_412656 ) ( AVAILABLE ?auto_412652 ) ( SURFACE-AT ?auto_412650 ?auto_412656 ) ( ON ?auto_412650 ?auto_412654 ) ( CLEAR ?auto_412650 ) ( not ( = ?auto_412650 ?auto_412654 ) ) ( not ( = ?auto_412651 ?auto_412654 ) ) ( not ( = ?auto_412649 ?auto_412654 ) ) ( not ( = ?auto_412653 ?auto_412654 ) ) ( ON ?auto_412644 ?auto_412643 ) ( ON ?auto_412645 ?auto_412644 ) ( ON ?auto_412647 ?auto_412645 ) ( ON ?auto_412646 ?auto_412647 ) ( ON ?auto_412648 ?auto_412646 ) ( ON ?auto_412649 ?auto_412648 ) ( not ( = ?auto_412643 ?auto_412644 ) ) ( not ( = ?auto_412643 ?auto_412645 ) ) ( not ( = ?auto_412643 ?auto_412647 ) ) ( not ( = ?auto_412643 ?auto_412646 ) ) ( not ( = ?auto_412643 ?auto_412648 ) ) ( not ( = ?auto_412643 ?auto_412649 ) ) ( not ( = ?auto_412643 ?auto_412650 ) ) ( not ( = ?auto_412643 ?auto_412651 ) ) ( not ( = ?auto_412643 ?auto_412653 ) ) ( not ( = ?auto_412643 ?auto_412654 ) ) ( not ( = ?auto_412644 ?auto_412645 ) ) ( not ( = ?auto_412644 ?auto_412647 ) ) ( not ( = ?auto_412644 ?auto_412646 ) ) ( not ( = ?auto_412644 ?auto_412648 ) ) ( not ( = ?auto_412644 ?auto_412649 ) ) ( not ( = ?auto_412644 ?auto_412650 ) ) ( not ( = ?auto_412644 ?auto_412651 ) ) ( not ( = ?auto_412644 ?auto_412653 ) ) ( not ( = ?auto_412644 ?auto_412654 ) ) ( not ( = ?auto_412645 ?auto_412647 ) ) ( not ( = ?auto_412645 ?auto_412646 ) ) ( not ( = ?auto_412645 ?auto_412648 ) ) ( not ( = ?auto_412645 ?auto_412649 ) ) ( not ( = ?auto_412645 ?auto_412650 ) ) ( not ( = ?auto_412645 ?auto_412651 ) ) ( not ( = ?auto_412645 ?auto_412653 ) ) ( not ( = ?auto_412645 ?auto_412654 ) ) ( not ( = ?auto_412647 ?auto_412646 ) ) ( not ( = ?auto_412647 ?auto_412648 ) ) ( not ( = ?auto_412647 ?auto_412649 ) ) ( not ( = ?auto_412647 ?auto_412650 ) ) ( not ( = ?auto_412647 ?auto_412651 ) ) ( not ( = ?auto_412647 ?auto_412653 ) ) ( not ( = ?auto_412647 ?auto_412654 ) ) ( not ( = ?auto_412646 ?auto_412648 ) ) ( not ( = ?auto_412646 ?auto_412649 ) ) ( not ( = ?auto_412646 ?auto_412650 ) ) ( not ( = ?auto_412646 ?auto_412651 ) ) ( not ( = ?auto_412646 ?auto_412653 ) ) ( not ( = ?auto_412646 ?auto_412654 ) ) ( not ( = ?auto_412648 ?auto_412649 ) ) ( not ( = ?auto_412648 ?auto_412650 ) ) ( not ( = ?auto_412648 ?auto_412651 ) ) ( not ( = ?auto_412648 ?auto_412653 ) ) ( not ( = ?auto_412648 ?auto_412654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412649 ?auto_412650 ?auto_412651 )
      ( MAKE-8CRATE-VERIFY ?auto_412643 ?auto_412644 ?auto_412645 ?auto_412647 ?auto_412646 ?auto_412648 ?auto_412649 ?auto_412650 ?auto_412651 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_412659 - SURFACE
      ?auto_412660 - SURFACE
    )
    :vars
    (
      ?auto_412667 - HOIST
      ?auto_412664 - PLACE
      ?auto_412668 - SURFACE
      ?auto_412665 - PLACE
      ?auto_412661 - HOIST
      ?auto_412662 - SURFACE
      ?auto_412663 - SURFACE
      ?auto_412666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412667 ?auto_412664 ) ( IS-CRATE ?auto_412660 ) ( not ( = ?auto_412659 ?auto_412660 ) ) ( not ( = ?auto_412668 ?auto_412659 ) ) ( not ( = ?auto_412668 ?auto_412660 ) ) ( not ( = ?auto_412665 ?auto_412664 ) ) ( HOIST-AT ?auto_412661 ?auto_412665 ) ( not ( = ?auto_412667 ?auto_412661 ) ) ( SURFACE-AT ?auto_412660 ?auto_412665 ) ( ON ?auto_412660 ?auto_412662 ) ( CLEAR ?auto_412660 ) ( not ( = ?auto_412659 ?auto_412662 ) ) ( not ( = ?auto_412660 ?auto_412662 ) ) ( not ( = ?auto_412668 ?auto_412662 ) ) ( SURFACE-AT ?auto_412668 ?auto_412664 ) ( CLEAR ?auto_412668 ) ( IS-CRATE ?auto_412659 ) ( AVAILABLE ?auto_412667 ) ( AVAILABLE ?auto_412661 ) ( SURFACE-AT ?auto_412659 ?auto_412665 ) ( ON ?auto_412659 ?auto_412663 ) ( CLEAR ?auto_412659 ) ( not ( = ?auto_412659 ?auto_412663 ) ) ( not ( = ?auto_412660 ?auto_412663 ) ) ( not ( = ?auto_412668 ?auto_412663 ) ) ( not ( = ?auto_412662 ?auto_412663 ) ) ( TRUCK-AT ?auto_412666 ?auto_412664 ) )
    :subtasks
    ( ( !DRIVE ?auto_412666 ?auto_412664 ?auto_412665 )
      ( MAKE-2CRATE ?auto_412668 ?auto_412659 ?auto_412660 )
      ( MAKE-1CRATE-VERIFY ?auto_412659 ?auto_412660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_412669 - SURFACE
      ?auto_412670 - SURFACE
      ?auto_412671 - SURFACE
    )
    :vars
    (
      ?auto_412675 - HOIST
      ?auto_412672 - PLACE
      ?auto_412674 - PLACE
      ?auto_412673 - HOIST
      ?auto_412678 - SURFACE
      ?auto_412677 - SURFACE
      ?auto_412676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412675 ?auto_412672 ) ( IS-CRATE ?auto_412671 ) ( not ( = ?auto_412670 ?auto_412671 ) ) ( not ( = ?auto_412669 ?auto_412670 ) ) ( not ( = ?auto_412669 ?auto_412671 ) ) ( not ( = ?auto_412674 ?auto_412672 ) ) ( HOIST-AT ?auto_412673 ?auto_412674 ) ( not ( = ?auto_412675 ?auto_412673 ) ) ( SURFACE-AT ?auto_412671 ?auto_412674 ) ( ON ?auto_412671 ?auto_412678 ) ( CLEAR ?auto_412671 ) ( not ( = ?auto_412670 ?auto_412678 ) ) ( not ( = ?auto_412671 ?auto_412678 ) ) ( not ( = ?auto_412669 ?auto_412678 ) ) ( SURFACE-AT ?auto_412669 ?auto_412672 ) ( CLEAR ?auto_412669 ) ( IS-CRATE ?auto_412670 ) ( AVAILABLE ?auto_412675 ) ( AVAILABLE ?auto_412673 ) ( SURFACE-AT ?auto_412670 ?auto_412674 ) ( ON ?auto_412670 ?auto_412677 ) ( CLEAR ?auto_412670 ) ( not ( = ?auto_412670 ?auto_412677 ) ) ( not ( = ?auto_412671 ?auto_412677 ) ) ( not ( = ?auto_412669 ?auto_412677 ) ) ( not ( = ?auto_412678 ?auto_412677 ) ) ( TRUCK-AT ?auto_412676 ?auto_412672 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412670 ?auto_412671 )
      ( MAKE-2CRATE-VERIFY ?auto_412669 ?auto_412670 ?auto_412671 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_412679 - SURFACE
      ?auto_412680 - SURFACE
      ?auto_412681 - SURFACE
      ?auto_412682 - SURFACE
    )
    :vars
    (
      ?auto_412689 - HOIST
      ?auto_412687 - PLACE
      ?auto_412688 - PLACE
      ?auto_412683 - HOIST
      ?auto_412684 - SURFACE
      ?auto_412686 - SURFACE
      ?auto_412685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412689 ?auto_412687 ) ( IS-CRATE ?auto_412682 ) ( not ( = ?auto_412681 ?auto_412682 ) ) ( not ( = ?auto_412680 ?auto_412681 ) ) ( not ( = ?auto_412680 ?auto_412682 ) ) ( not ( = ?auto_412688 ?auto_412687 ) ) ( HOIST-AT ?auto_412683 ?auto_412688 ) ( not ( = ?auto_412689 ?auto_412683 ) ) ( SURFACE-AT ?auto_412682 ?auto_412688 ) ( ON ?auto_412682 ?auto_412684 ) ( CLEAR ?auto_412682 ) ( not ( = ?auto_412681 ?auto_412684 ) ) ( not ( = ?auto_412682 ?auto_412684 ) ) ( not ( = ?auto_412680 ?auto_412684 ) ) ( SURFACE-AT ?auto_412680 ?auto_412687 ) ( CLEAR ?auto_412680 ) ( IS-CRATE ?auto_412681 ) ( AVAILABLE ?auto_412689 ) ( AVAILABLE ?auto_412683 ) ( SURFACE-AT ?auto_412681 ?auto_412688 ) ( ON ?auto_412681 ?auto_412686 ) ( CLEAR ?auto_412681 ) ( not ( = ?auto_412681 ?auto_412686 ) ) ( not ( = ?auto_412682 ?auto_412686 ) ) ( not ( = ?auto_412680 ?auto_412686 ) ) ( not ( = ?auto_412684 ?auto_412686 ) ) ( TRUCK-AT ?auto_412685 ?auto_412687 ) ( ON ?auto_412680 ?auto_412679 ) ( not ( = ?auto_412679 ?auto_412680 ) ) ( not ( = ?auto_412679 ?auto_412681 ) ) ( not ( = ?auto_412679 ?auto_412682 ) ) ( not ( = ?auto_412679 ?auto_412684 ) ) ( not ( = ?auto_412679 ?auto_412686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412680 ?auto_412681 ?auto_412682 )
      ( MAKE-3CRATE-VERIFY ?auto_412679 ?auto_412680 ?auto_412681 ?auto_412682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_412690 - SURFACE
      ?auto_412691 - SURFACE
      ?auto_412692 - SURFACE
      ?auto_412694 - SURFACE
      ?auto_412693 - SURFACE
    )
    :vars
    (
      ?auto_412701 - HOIST
      ?auto_412699 - PLACE
      ?auto_412700 - PLACE
      ?auto_412695 - HOIST
      ?auto_412696 - SURFACE
      ?auto_412698 - SURFACE
      ?auto_412697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412701 ?auto_412699 ) ( IS-CRATE ?auto_412693 ) ( not ( = ?auto_412694 ?auto_412693 ) ) ( not ( = ?auto_412692 ?auto_412694 ) ) ( not ( = ?auto_412692 ?auto_412693 ) ) ( not ( = ?auto_412700 ?auto_412699 ) ) ( HOIST-AT ?auto_412695 ?auto_412700 ) ( not ( = ?auto_412701 ?auto_412695 ) ) ( SURFACE-AT ?auto_412693 ?auto_412700 ) ( ON ?auto_412693 ?auto_412696 ) ( CLEAR ?auto_412693 ) ( not ( = ?auto_412694 ?auto_412696 ) ) ( not ( = ?auto_412693 ?auto_412696 ) ) ( not ( = ?auto_412692 ?auto_412696 ) ) ( SURFACE-AT ?auto_412692 ?auto_412699 ) ( CLEAR ?auto_412692 ) ( IS-CRATE ?auto_412694 ) ( AVAILABLE ?auto_412701 ) ( AVAILABLE ?auto_412695 ) ( SURFACE-AT ?auto_412694 ?auto_412700 ) ( ON ?auto_412694 ?auto_412698 ) ( CLEAR ?auto_412694 ) ( not ( = ?auto_412694 ?auto_412698 ) ) ( not ( = ?auto_412693 ?auto_412698 ) ) ( not ( = ?auto_412692 ?auto_412698 ) ) ( not ( = ?auto_412696 ?auto_412698 ) ) ( TRUCK-AT ?auto_412697 ?auto_412699 ) ( ON ?auto_412691 ?auto_412690 ) ( ON ?auto_412692 ?auto_412691 ) ( not ( = ?auto_412690 ?auto_412691 ) ) ( not ( = ?auto_412690 ?auto_412692 ) ) ( not ( = ?auto_412690 ?auto_412694 ) ) ( not ( = ?auto_412690 ?auto_412693 ) ) ( not ( = ?auto_412690 ?auto_412696 ) ) ( not ( = ?auto_412690 ?auto_412698 ) ) ( not ( = ?auto_412691 ?auto_412692 ) ) ( not ( = ?auto_412691 ?auto_412694 ) ) ( not ( = ?auto_412691 ?auto_412693 ) ) ( not ( = ?auto_412691 ?auto_412696 ) ) ( not ( = ?auto_412691 ?auto_412698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412692 ?auto_412694 ?auto_412693 )
      ( MAKE-4CRATE-VERIFY ?auto_412690 ?auto_412691 ?auto_412692 ?auto_412694 ?auto_412693 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_412702 - SURFACE
      ?auto_412703 - SURFACE
      ?auto_412704 - SURFACE
      ?auto_412706 - SURFACE
      ?auto_412705 - SURFACE
      ?auto_412707 - SURFACE
    )
    :vars
    (
      ?auto_412714 - HOIST
      ?auto_412712 - PLACE
      ?auto_412713 - PLACE
      ?auto_412708 - HOIST
      ?auto_412709 - SURFACE
      ?auto_412711 - SURFACE
      ?auto_412710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412714 ?auto_412712 ) ( IS-CRATE ?auto_412707 ) ( not ( = ?auto_412705 ?auto_412707 ) ) ( not ( = ?auto_412706 ?auto_412705 ) ) ( not ( = ?auto_412706 ?auto_412707 ) ) ( not ( = ?auto_412713 ?auto_412712 ) ) ( HOIST-AT ?auto_412708 ?auto_412713 ) ( not ( = ?auto_412714 ?auto_412708 ) ) ( SURFACE-AT ?auto_412707 ?auto_412713 ) ( ON ?auto_412707 ?auto_412709 ) ( CLEAR ?auto_412707 ) ( not ( = ?auto_412705 ?auto_412709 ) ) ( not ( = ?auto_412707 ?auto_412709 ) ) ( not ( = ?auto_412706 ?auto_412709 ) ) ( SURFACE-AT ?auto_412706 ?auto_412712 ) ( CLEAR ?auto_412706 ) ( IS-CRATE ?auto_412705 ) ( AVAILABLE ?auto_412714 ) ( AVAILABLE ?auto_412708 ) ( SURFACE-AT ?auto_412705 ?auto_412713 ) ( ON ?auto_412705 ?auto_412711 ) ( CLEAR ?auto_412705 ) ( not ( = ?auto_412705 ?auto_412711 ) ) ( not ( = ?auto_412707 ?auto_412711 ) ) ( not ( = ?auto_412706 ?auto_412711 ) ) ( not ( = ?auto_412709 ?auto_412711 ) ) ( TRUCK-AT ?auto_412710 ?auto_412712 ) ( ON ?auto_412703 ?auto_412702 ) ( ON ?auto_412704 ?auto_412703 ) ( ON ?auto_412706 ?auto_412704 ) ( not ( = ?auto_412702 ?auto_412703 ) ) ( not ( = ?auto_412702 ?auto_412704 ) ) ( not ( = ?auto_412702 ?auto_412706 ) ) ( not ( = ?auto_412702 ?auto_412705 ) ) ( not ( = ?auto_412702 ?auto_412707 ) ) ( not ( = ?auto_412702 ?auto_412709 ) ) ( not ( = ?auto_412702 ?auto_412711 ) ) ( not ( = ?auto_412703 ?auto_412704 ) ) ( not ( = ?auto_412703 ?auto_412706 ) ) ( not ( = ?auto_412703 ?auto_412705 ) ) ( not ( = ?auto_412703 ?auto_412707 ) ) ( not ( = ?auto_412703 ?auto_412709 ) ) ( not ( = ?auto_412703 ?auto_412711 ) ) ( not ( = ?auto_412704 ?auto_412706 ) ) ( not ( = ?auto_412704 ?auto_412705 ) ) ( not ( = ?auto_412704 ?auto_412707 ) ) ( not ( = ?auto_412704 ?auto_412709 ) ) ( not ( = ?auto_412704 ?auto_412711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412706 ?auto_412705 ?auto_412707 )
      ( MAKE-5CRATE-VERIFY ?auto_412702 ?auto_412703 ?auto_412704 ?auto_412706 ?auto_412705 ?auto_412707 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_412715 - SURFACE
      ?auto_412716 - SURFACE
      ?auto_412717 - SURFACE
      ?auto_412719 - SURFACE
      ?auto_412718 - SURFACE
      ?auto_412720 - SURFACE
      ?auto_412721 - SURFACE
    )
    :vars
    (
      ?auto_412728 - HOIST
      ?auto_412726 - PLACE
      ?auto_412727 - PLACE
      ?auto_412722 - HOIST
      ?auto_412723 - SURFACE
      ?auto_412725 - SURFACE
      ?auto_412724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412728 ?auto_412726 ) ( IS-CRATE ?auto_412721 ) ( not ( = ?auto_412720 ?auto_412721 ) ) ( not ( = ?auto_412718 ?auto_412720 ) ) ( not ( = ?auto_412718 ?auto_412721 ) ) ( not ( = ?auto_412727 ?auto_412726 ) ) ( HOIST-AT ?auto_412722 ?auto_412727 ) ( not ( = ?auto_412728 ?auto_412722 ) ) ( SURFACE-AT ?auto_412721 ?auto_412727 ) ( ON ?auto_412721 ?auto_412723 ) ( CLEAR ?auto_412721 ) ( not ( = ?auto_412720 ?auto_412723 ) ) ( not ( = ?auto_412721 ?auto_412723 ) ) ( not ( = ?auto_412718 ?auto_412723 ) ) ( SURFACE-AT ?auto_412718 ?auto_412726 ) ( CLEAR ?auto_412718 ) ( IS-CRATE ?auto_412720 ) ( AVAILABLE ?auto_412728 ) ( AVAILABLE ?auto_412722 ) ( SURFACE-AT ?auto_412720 ?auto_412727 ) ( ON ?auto_412720 ?auto_412725 ) ( CLEAR ?auto_412720 ) ( not ( = ?auto_412720 ?auto_412725 ) ) ( not ( = ?auto_412721 ?auto_412725 ) ) ( not ( = ?auto_412718 ?auto_412725 ) ) ( not ( = ?auto_412723 ?auto_412725 ) ) ( TRUCK-AT ?auto_412724 ?auto_412726 ) ( ON ?auto_412716 ?auto_412715 ) ( ON ?auto_412717 ?auto_412716 ) ( ON ?auto_412719 ?auto_412717 ) ( ON ?auto_412718 ?auto_412719 ) ( not ( = ?auto_412715 ?auto_412716 ) ) ( not ( = ?auto_412715 ?auto_412717 ) ) ( not ( = ?auto_412715 ?auto_412719 ) ) ( not ( = ?auto_412715 ?auto_412718 ) ) ( not ( = ?auto_412715 ?auto_412720 ) ) ( not ( = ?auto_412715 ?auto_412721 ) ) ( not ( = ?auto_412715 ?auto_412723 ) ) ( not ( = ?auto_412715 ?auto_412725 ) ) ( not ( = ?auto_412716 ?auto_412717 ) ) ( not ( = ?auto_412716 ?auto_412719 ) ) ( not ( = ?auto_412716 ?auto_412718 ) ) ( not ( = ?auto_412716 ?auto_412720 ) ) ( not ( = ?auto_412716 ?auto_412721 ) ) ( not ( = ?auto_412716 ?auto_412723 ) ) ( not ( = ?auto_412716 ?auto_412725 ) ) ( not ( = ?auto_412717 ?auto_412719 ) ) ( not ( = ?auto_412717 ?auto_412718 ) ) ( not ( = ?auto_412717 ?auto_412720 ) ) ( not ( = ?auto_412717 ?auto_412721 ) ) ( not ( = ?auto_412717 ?auto_412723 ) ) ( not ( = ?auto_412717 ?auto_412725 ) ) ( not ( = ?auto_412719 ?auto_412718 ) ) ( not ( = ?auto_412719 ?auto_412720 ) ) ( not ( = ?auto_412719 ?auto_412721 ) ) ( not ( = ?auto_412719 ?auto_412723 ) ) ( not ( = ?auto_412719 ?auto_412725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412718 ?auto_412720 ?auto_412721 )
      ( MAKE-6CRATE-VERIFY ?auto_412715 ?auto_412716 ?auto_412717 ?auto_412719 ?auto_412718 ?auto_412720 ?auto_412721 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_412729 - SURFACE
      ?auto_412730 - SURFACE
      ?auto_412731 - SURFACE
      ?auto_412733 - SURFACE
      ?auto_412732 - SURFACE
      ?auto_412734 - SURFACE
      ?auto_412735 - SURFACE
      ?auto_412736 - SURFACE
    )
    :vars
    (
      ?auto_412743 - HOIST
      ?auto_412741 - PLACE
      ?auto_412742 - PLACE
      ?auto_412737 - HOIST
      ?auto_412738 - SURFACE
      ?auto_412740 - SURFACE
      ?auto_412739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412743 ?auto_412741 ) ( IS-CRATE ?auto_412736 ) ( not ( = ?auto_412735 ?auto_412736 ) ) ( not ( = ?auto_412734 ?auto_412735 ) ) ( not ( = ?auto_412734 ?auto_412736 ) ) ( not ( = ?auto_412742 ?auto_412741 ) ) ( HOIST-AT ?auto_412737 ?auto_412742 ) ( not ( = ?auto_412743 ?auto_412737 ) ) ( SURFACE-AT ?auto_412736 ?auto_412742 ) ( ON ?auto_412736 ?auto_412738 ) ( CLEAR ?auto_412736 ) ( not ( = ?auto_412735 ?auto_412738 ) ) ( not ( = ?auto_412736 ?auto_412738 ) ) ( not ( = ?auto_412734 ?auto_412738 ) ) ( SURFACE-AT ?auto_412734 ?auto_412741 ) ( CLEAR ?auto_412734 ) ( IS-CRATE ?auto_412735 ) ( AVAILABLE ?auto_412743 ) ( AVAILABLE ?auto_412737 ) ( SURFACE-AT ?auto_412735 ?auto_412742 ) ( ON ?auto_412735 ?auto_412740 ) ( CLEAR ?auto_412735 ) ( not ( = ?auto_412735 ?auto_412740 ) ) ( not ( = ?auto_412736 ?auto_412740 ) ) ( not ( = ?auto_412734 ?auto_412740 ) ) ( not ( = ?auto_412738 ?auto_412740 ) ) ( TRUCK-AT ?auto_412739 ?auto_412741 ) ( ON ?auto_412730 ?auto_412729 ) ( ON ?auto_412731 ?auto_412730 ) ( ON ?auto_412733 ?auto_412731 ) ( ON ?auto_412732 ?auto_412733 ) ( ON ?auto_412734 ?auto_412732 ) ( not ( = ?auto_412729 ?auto_412730 ) ) ( not ( = ?auto_412729 ?auto_412731 ) ) ( not ( = ?auto_412729 ?auto_412733 ) ) ( not ( = ?auto_412729 ?auto_412732 ) ) ( not ( = ?auto_412729 ?auto_412734 ) ) ( not ( = ?auto_412729 ?auto_412735 ) ) ( not ( = ?auto_412729 ?auto_412736 ) ) ( not ( = ?auto_412729 ?auto_412738 ) ) ( not ( = ?auto_412729 ?auto_412740 ) ) ( not ( = ?auto_412730 ?auto_412731 ) ) ( not ( = ?auto_412730 ?auto_412733 ) ) ( not ( = ?auto_412730 ?auto_412732 ) ) ( not ( = ?auto_412730 ?auto_412734 ) ) ( not ( = ?auto_412730 ?auto_412735 ) ) ( not ( = ?auto_412730 ?auto_412736 ) ) ( not ( = ?auto_412730 ?auto_412738 ) ) ( not ( = ?auto_412730 ?auto_412740 ) ) ( not ( = ?auto_412731 ?auto_412733 ) ) ( not ( = ?auto_412731 ?auto_412732 ) ) ( not ( = ?auto_412731 ?auto_412734 ) ) ( not ( = ?auto_412731 ?auto_412735 ) ) ( not ( = ?auto_412731 ?auto_412736 ) ) ( not ( = ?auto_412731 ?auto_412738 ) ) ( not ( = ?auto_412731 ?auto_412740 ) ) ( not ( = ?auto_412733 ?auto_412732 ) ) ( not ( = ?auto_412733 ?auto_412734 ) ) ( not ( = ?auto_412733 ?auto_412735 ) ) ( not ( = ?auto_412733 ?auto_412736 ) ) ( not ( = ?auto_412733 ?auto_412738 ) ) ( not ( = ?auto_412733 ?auto_412740 ) ) ( not ( = ?auto_412732 ?auto_412734 ) ) ( not ( = ?auto_412732 ?auto_412735 ) ) ( not ( = ?auto_412732 ?auto_412736 ) ) ( not ( = ?auto_412732 ?auto_412738 ) ) ( not ( = ?auto_412732 ?auto_412740 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412734 ?auto_412735 ?auto_412736 )
      ( MAKE-7CRATE-VERIFY ?auto_412729 ?auto_412730 ?auto_412731 ?auto_412733 ?auto_412732 ?auto_412734 ?auto_412735 ?auto_412736 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412744 - SURFACE
      ?auto_412745 - SURFACE
      ?auto_412746 - SURFACE
      ?auto_412748 - SURFACE
      ?auto_412747 - SURFACE
      ?auto_412749 - SURFACE
      ?auto_412750 - SURFACE
      ?auto_412751 - SURFACE
      ?auto_412752 - SURFACE
    )
    :vars
    (
      ?auto_412759 - HOIST
      ?auto_412757 - PLACE
      ?auto_412758 - PLACE
      ?auto_412753 - HOIST
      ?auto_412754 - SURFACE
      ?auto_412756 - SURFACE
      ?auto_412755 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412759 ?auto_412757 ) ( IS-CRATE ?auto_412752 ) ( not ( = ?auto_412751 ?auto_412752 ) ) ( not ( = ?auto_412750 ?auto_412751 ) ) ( not ( = ?auto_412750 ?auto_412752 ) ) ( not ( = ?auto_412758 ?auto_412757 ) ) ( HOIST-AT ?auto_412753 ?auto_412758 ) ( not ( = ?auto_412759 ?auto_412753 ) ) ( SURFACE-AT ?auto_412752 ?auto_412758 ) ( ON ?auto_412752 ?auto_412754 ) ( CLEAR ?auto_412752 ) ( not ( = ?auto_412751 ?auto_412754 ) ) ( not ( = ?auto_412752 ?auto_412754 ) ) ( not ( = ?auto_412750 ?auto_412754 ) ) ( SURFACE-AT ?auto_412750 ?auto_412757 ) ( CLEAR ?auto_412750 ) ( IS-CRATE ?auto_412751 ) ( AVAILABLE ?auto_412759 ) ( AVAILABLE ?auto_412753 ) ( SURFACE-AT ?auto_412751 ?auto_412758 ) ( ON ?auto_412751 ?auto_412756 ) ( CLEAR ?auto_412751 ) ( not ( = ?auto_412751 ?auto_412756 ) ) ( not ( = ?auto_412752 ?auto_412756 ) ) ( not ( = ?auto_412750 ?auto_412756 ) ) ( not ( = ?auto_412754 ?auto_412756 ) ) ( TRUCK-AT ?auto_412755 ?auto_412757 ) ( ON ?auto_412745 ?auto_412744 ) ( ON ?auto_412746 ?auto_412745 ) ( ON ?auto_412748 ?auto_412746 ) ( ON ?auto_412747 ?auto_412748 ) ( ON ?auto_412749 ?auto_412747 ) ( ON ?auto_412750 ?auto_412749 ) ( not ( = ?auto_412744 ?auto_412745 ) ) ( not ( = ?auto_412744 ?auto_412746 ) ) ( not ( = ?auto_412744 ?auto_412748 ) ) ( not ( = ?auto_412744 ?auto_412747 ) ) ( not ( = ?auto_412744 ?auto_412749 ) ) ( not ( = ?auto_412744 ?auto_412750 ) ) ( not ( = ?auto_412744 ?auto_412751 ) ) ( not ( = ?auto_412744 ?auto_412752 ) ) ( not ( = ?auto_412744 ?auto_412754 ) ) ( not ( = ?auto_412744 ?auto_412756 ) ) ( not ( = ?auto_412745 ?auto_412746 ) ) ( not ( = ?auto_412745 ?auto_412748 ) ) ( not ( = ?auto_412745 ?auto_412747 ) ) ( not ( = ?auto_412745 ?auto_412749 ) ) ( not ( = ?auto_412745 ?auto_412750 ) ) ( not ( = ?auto_412745 ?auto_412751 ) ) ( not ( = ?auto_412745 ?auto_412752 ) ) ( not ( = ?auto_412745 ?auto_412754 ) ) ( not ( = ?auto_412745 ?auto_412756 ) ) ( not ( = ?auto_412746 ?auto_412748 ) ) ( not ( = ?auto_412746 ?auto_412747 ) ) ( not ( = ?auto_412746 ?auto_412749 ) ) ( not ( = ?auto_412746 ?auto_412750 ) ) ( not ( = ?auto_412746 ?auto_412751 ) ) ( not ( = ?auto_412746 ?auto_412752 ) ) ( not ( = ?auto_412746 ?auto_412754 ) ) ( not ( = ?auto_412746 ?auto_412756 ) ) ( not ( = ?auto_412748 ?auto_412747 ) ) ( not ( = ?auto_412748 ?auto_412749 ) ) ( not ( = ?auto_412748 ?auto_412750 ) ) ( not ( = ?auto_412748 ?auto_412751 ) ) ( not ( = ?auto_412748 ?auto_412752 ) ) ( not ( = ?auto_412748 ?auto_412754 ) ) ( not ( = ?auto_412748 ?auto_412756 ) ) ( not ( = ?auto_412747 ?auto_412749 ) ) ( not ( = ?auto_412747 ?auto_412750 ) ) ( not ( = ?auto_412747 ?auto_412751 ) ) ( not ( = ?auto_412747 ?auto_412752 ) ) ( not ( = ?auto_412747 ?auto_412754 ) ) ( not ( = ?auto_412747 ?auto_412756 ) ) ( not ( = ?auto_412749 ?auto_412750 ) ) ( not ( = ?auto_412749 ?auto_412751 ) ) ( not ( = ?auto_412749 ?auto_412752 ) ) ( not ( = ?auto_412749 ?auto_412754 ) ) ( not ( = ?auto_412749 ?auto_412756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412750 ?auto_412751 ?auto_412752 )
      ( MAKE-8CRATE-VERIFY ?auto_412744 ?auto_412745 ?auto_412746 ?auto_412748 ?auto_412747 ?auto_412749 ?auto_412750 ?auto_412751 ?auto_412752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_412760 - SURFACE
      ?auto_412761 - SURFACE
    )
    :vars
    (
      ?auto_412769 - HOIST
      ?auto_412767 - PLACE
      ?auto_412764 - SURFACE
      ?auto_412768 - PLACE
      ?auto_412762 - HOIST
      ?auto_412763 - SURFACE
      ?auto_412766 - SURFACE
      ?auto_412765 - TRUCK
      ?auto_412770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412769 ?auto_412767 ) ( IS-CRATE ?auto_412761 ) ( not ( = ?auto_412760 ?auto_412761 ) ) ( not ( = ?auto_412764 ?auto_412760 ) ) ( not ( = ?auto_412764 ?auto_412761 ) ) ( not ( = ?auto_412768 ?auto_412767 ) ) ( HOIST-AT ?auto_412762 ?auto_412768 ) ( not ( = ?auto_412769 ?auto_412762 ) ) ( SURFACE-AT ?auto_412761 ?auto_412768 ) ( ON ?auto_412761 ?auto_412763 ) ( CLEAR ?auto_412761 ) ( not ( = ?auto_412760 ?auto_412763 ) ) ( not ( = ?auto_412761 ?auto_412763 ) ) ( not ( = ?auto_412764 ?auto_412763 ) ) ( IS-CRATE ?auto_412760 ) ( AVAILABLE ?auto_412762 ) ( SURFACE-AT ?auto_412760 ?auto_412768 ) ( ON ?auto_412760 ?auto_412766 ) ( CLEAR ?auto_412760 ) ( not ( = ?auto_412760 ?auto_412766 ) ) ( not ( = ?auto_412761 ?auto_412766 ) ) ( not ( = ?auto_412764 ?auto_412766 ) ) ( not ( = ?auto_412763 ?auto_412766 ) ) ( TRUCK-AT ?auto_412765 ?auto_412767 ) ( SURFACE-AT ?auto_412770 ?auto_412767 ) ( CLEAR ?auto_412770 ) ( LIFTING ?auto_412769 ?auto_412764 ) ( IS-CRATE ?auto_412764 ) ( not ( = ?auto_412770 ?auto_412764 ) ) ( not ( = ?auto_412760 ?auto_412770 ) ) ( not ( = ?auto_412761 ?auto_412770 ) ) ( not ( = ?auto_412763 ?auto_412770 ) ) ( not ( = ?auto_412766 ?auto_412770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412770 ?auto_412764 )
      ( MAKE-2CRATE ?auto_412764 ?auto_412760 ?auto_412761 )
      ( MAKE-1CRATE-VERIFY ?auto_412760 ?auto_412761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_412771 - SURFACE
      ?auto_412772 - SURFACE
      ?auto_412773 - SURFACE
    )
    :vars
    (
      ?auto_412777 - HOIST
      ?auto_412780 - PLACE
      ?auto_412781 - PLACE
      ?auto_412779 - HOIST
      ?auto_412774 - SURFACE
      ?auto_412775 - SURFACE
      ?auto_412778 - TRUCK
      ?auto_412776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_412777 ?auto_412780 ) ( IS-CRATE ?auto_412773 ) ( not ( = ?auto_412772 ?auto_412773 ) ) ( not ( = ?auto_412771 ?auto_412772 ) ) ( not ( = ?auto_412771 ?auto_412773 ) ) ( not ( = ?auto_412781 ?auto_412780 ) ) ( HOIST-AT ?auto_412779 ?auto_412781 ) ( not ( = ?auto_412777 ?auto_412779 ) ) ( SURFACE-AT ?auto_412773 ?auto_412781 ) ( ON ?auto_412773 ?auto_412774 ) ( CLEAR ?auto_412773 ) ( not ( = ?auto_412772 ?auto_412774 ) ) ( not ( = ?auto_412773 ?auto_412774 ) ) ( not ( = ?auto_412771 ?auto_412774 ) ) ( IS-CRATE ?auto_412772 ) ( AVAILABLE ?auto_412779 ) ( SURFACE-AT ?auto_412772 ?auto_412781 ) ( ON ?auto_412772 ?auto_412775 ) ( CLEAR ?auto_412772 ) ( not ( = ?auto_412772 ?auto_412775 ) ) ( not ( = ?auto_412773 ?auto_412775 ) ) ( not ( = ?auto_412771 ?auto_412775 ) ) ( not ( = ?auto_412774 ?auto_412775 ) ) ( TRUCK-AT ?auto_412778 ?auto_412780 ) ( SURFACE-AT ?auto_412776 ?auto_412780 ) ( CLEAR ?auto_412776 ) ( LIFTING ?auto_412777 ?auto_412771 ) ( IS-CRATE ?auto_412771 ) ( not ( = ?auto_412776 ?auto_412771 ) ) ( not ( = ?auto_412772 ?auto_412776 ) ) ( not ( = ?auto_412773 ?auto_412776 ) ) ( not ( = ?auto_412774 ?auto_412776 ) ) ( not ( = ?auto_412775 ?auto_412776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_412772 ?auto_412773 )
      ( MAKE-2CRATE-VERIFY ?auto_412771 ?auto_412772 ?auto_412773 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_412782 - SURFACE
      ?auto_412783 - SURFACE
      ?auto_412784 - SURFACE
      ?auto_412785 - SURFACE
    )
    :vars
    (
      ?auto_412786 - HOIST
      ?auto_412788 - PLACE
      ?auto_412789 - PLACE
      ?auto_412791 - HOIST
      ?auto_412790 - SURFACE
      ?auto_412787 - SURFACE
      ?auto_412792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412786 ?auto_412788 ) ( IS-CRATE ?auto_412785 ) ( not ( = ?auto_412784 ?auto_412785 ) ) ( not ( = ?auto_412783 ?auto_412784 ) ) ( not ( = ?auto_412783 ?auto_412785 ) ) ( not ( = ?auto_412789 ?auto_412788 ) ) ( HOIST-AT ?auto_412791 ?auto_412789 ) ( not ( = ?auto_412786 ?auto_412791 ) ) ( SURFACE-AT ?auto_412785 ?auto_412789 ) ( ON ?auto_412785 ?auto_412790 ) ( CLEAR ?auto_412785 ) ( not ( = ?auto_412784 ?auto_412790 ) ) ( not ( = ?auto_412785 ?auto_412790 ) ) ( not ( = ?auto_412783 ?auto_412790 ) ) ( IS-CRATE ?auto_412784 ) ( AVAILABLE ?auto_412791 ) ( SURFACE-AT ?auto_412784 ?auto_412789 ) ( ON ?auto_412784 ?auto_412787 ) ( CLEAR ?auto_412784 ) ( not ( = ?auto_412784 ?auto_412787 ) ) ( not ( = ?auto_412785 ?auto_412787 ) ) ( not ( = ?auto_412783 ?auto_412787 ) ) ( not ( = ?auto_412790 ?auto_412787 ) ) ( TRUCK-AT ?auto_412792 ?auto_412788 ) ( SURFACE-AT ?auto_412782 ?auto_412788 ) ( CLEAR ?auto_412782 ) ( LIFTING ?auto_412786 ?auto_412783 ) ( IS-CRATE ?auto_412783 ) ( not ( = ?auto_412782 ?auto_412783 ) ) ( not ( = ?auto_412784 ?auto_412782 ) ) ( not ( = ?auto_412785 ?auto_412782 ) ) ( not ( = ?auto_412790 ?auto_412782 ) ) ( not ( = ?auto_412787 ?auto_412782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412783 ?auto_412784 ?auto_412785 )
      ( MAKE-3CRATE-VERIFY ?auto_412782 ?auto_412783 ?auto_412784 ?auto_412785 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_412793 - SURFACE
      ?auto_412794 - SURFACE
      ?auto_412795 - SURFACE
      ?auto_412797 - SURFACE
      ?auto_412796 - SURFACE
    )
    :vars
    (
      ?auto_412798 - HOIST
      ?auto_412800 - PLACE
      ?auto_412801 - PLACE
      ?auto_412803 - HOIST
      ?auto_412802 - SURFACE
      ?auto_412799 - SURFACE
      ?auto_412804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412798 ?auto_412800 ) ( IS-CRATE ?auto_412796 ) ( not ( = ?auto_412797 ?auto_412796 ) ) ( not ( = ?auto_412795 ?auto_412797 ) ) ( not ( = ?auto_412795 ?auto_412796 ) ) ( not ( = ?auto_412801 ?auto_412800 ) ) ( HOIST-AT ?auto_412803 ?auto_412801 ) ( not ( = ?auto_412798 ?auto_412803 ) ) ( SURFACE-AT ?auto_412796 ?auto_412801 ) ( ON ?auto_412796 ?auto_412802 ) ( CLEAR ?auto_412796 ) ( not ( = ?auto_412797 ?auto_412802 ) ) ( not ( = ?auto_412796 ?auto_412802 ) ) ( not ( = ?auto_412795 ?auto_412802 ) ) ( IS-CRATE ?auto_412797 ) ( AVAILABLE ?auto_412803 ) ( SURFACE-AT ?auto_412797 ?auto_412801 ) ( ON ?auto_412797 ?auto_412799 ) ( CLEAR ?auto_412797 ) ( not ( = ?auto_412797 ?auto_412799 ) ) ( not ( = ?auto_412796 ?auto_412799 ) ) ( not ( = ?auto_412795 ?auto_412799 ) ) ( not ( = ?auto_412802 ?auto_412799 ) ) ( TRUCK-AT ?auto_412804 ?auto_412800 ) ( SURFACE-AT ?auto_412794 ?auto_412800 ) ( CLEAR ?auto_412794 ) ( LIFTING ?auto_412798 ?auto_412795 ) ( IS-CRATE ?auto_412795 ) ( not ( = ?auto_412794 ?auto_412795 ) ) ( not ( = ?auto_412797 ?auto_412794 ) ) ( not ( = ?auto_412796 ?auto_412794 ) ) ( not ( = ?auto_412802 ?auto_412794 ) ) ( not ( = ?auto_412799 ?auto_412794 ) ) ( ON ?auto_412794 ?auto_412793 ) ( not ( = ?auto_412793 ?auto_412794 ) ) ( not ( = ?auto_412793 ?auto_412795 ) ) ( not ( = ?auto_412793 ?auto_412797 ) ) ( not ( = ?auto_412793 ?auto_412796 ) ) ( not ( = ?auto_412793 ?auto_412802 ) ) ( not ( = ?auto_412793 ?auto_412799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412795 ?auto_412797 ?auto_412796 )
      ( MAKE-4CRATE-VERIFY ?auto_412793 ?auto_412794 ?auto_412795 ?auto_412797 ?auto_412796 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_412805 - SURFACE
      ?auto_412806 - SURFACE
      ?auto_412807 - SURFACE
      ?auto_412809 - SURFACE
      ?auto_412808 - SURFACE
      ?auto_412810 - SURFACE
    )
    :vars
    (
      ?auto_412811 - HOIST
      ?auto_412813 - PLACE
      ?auto_412814 - PLACE
      ?auto_412816 - HOIST
      ?auto_412815 - SURFACE
      ?auto_412812 - SURFACE
      ?auto_412817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412811 ?auto_412813 ) ( IS-CRATE ?auto_412810 ) ( not ( = ?auto_412808 ?auto_412810 ) ) ( not ( = ?auto_412809 ?auto_412808 ) ) ( not ( = ?auto_412809 ?auto_412810 ) ) ( not ( = ?auto_412814 ?auto_412813 ) ) ( HOIST-AT ?auto_412816 ?auto_412814 ) ( not ( = ?auto_412811 ?auto_412816 ) ) ( SURFACE-AT ?auto_412810 ?auto_412814 ) ( ON ?auto_412810 ?auto_412815 ) ( CLEAR ?auto_412810 ) ( not ( = ?auto_412808 ?auto_412815 ) ) ( not ( = ?auto_412810 ?auto_412815 ) ) ( not ( = ?auto_412809 ?auto_412815 ) ) ( IS-CRATE ?auto_412808 ) ( AVAILABLE ?auto_412816 ) ( SURFACE-AT ?auto_412808 ?auto_412814 ) ( ON ?auto_412808 ?auto_412812 ) ( CLEAR ?auto_412808 ) ( not ( = ?auto_412808 ?auto_412812 ) ) ( not ( = ?auto_412810 ?auto_412812 ) ) ( not ( = ?auto_412809 ?auto_412812 ) ) ( not ( = ?auto_412815 ?auto_412812 ) ) ( TRUCK-AT ?auto_412817 ?auto_412813 ) ( SURFACE-AT ?auto_412807 ?auto_412813 ) ( CLEAR ?auto_412807 ) ( LIFTING ?auto_412811 ?auto_412809 ) ( IS-CRATE ?auto_412809 ) ( not ( = ?auto_412807 ?auto_412809 ) ) ( not ( = ?auto_412808 ?auto_412807 ) ) ( not ( = ?auto_412810 ?auto_412807 ) ) ( not ( = ?auto_412815 ?auto_412807 ) ) ( not ( = ?auto_412812 ?auto_412807 ) ) ( ON ?auto_412806 ?auto_412805 ) ( ON ?auto_412807 ?auto_412806 ) ( not ( = ?auto_412805 ?auto_412806 ) ) ( not ( = ?auto_412805 ?auto_412807 ) ) ( not ( = ?auto_412805 ?auto_412809 ) ) ( not ( = ?auto_412805 ?auto_412808 ) ) ( not ( = ?auto_412805 ?auto_412810 ) ) ( not ( = ?auto_412805 ?auto_412815 ) ) ( not ( = ?auto_412805 ?auto_412812 ) ) ( not ( = ?auto_412806 ?auto_412807 ) ) ( not ( = ?auto_412806 ?auto_412809 ) ) ( not ( = ?auto_412806 ?auto_412808 ) ) ( not ( = ?auto_412806 ?auto_412810 ) ) ( not ( = ?auto_412806 ?auto_412815 ) ) ( not ( = ?auto_412806 ?auto_412812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412809 ?auto_412808 ?auto_412810 )
      ( MAKE-5CRATE-VERIFY ?auto_412805 ?auto_412806 ?auto_412807 ?auto_412809 ?auto_412808 ?auto_412810 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_412818 - SURFACE
      ?auto_412819 - SURFACE
      ?auto_412820 - SURFACE
      ?auto_412822 - SURFACE
      ?auto_412821 - SURFACE
      ?auto_412823 - SURFACE
      ?auto_412824 - SURFACE
    )
    :vars
    (
      ?auto_412825 - HOIST
      ?auto_412827 - PLACE
      ?auto_412828 - PLACE
      ?auto_412830 - HOIST
      ?auto_412829 - SURFACE
      ?auto_412826 - SURFACE
      ?auto_412831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412825 ?auto_412827 ) ( IS-CRATE ?auto_412824 ) ( not ( = ?auto_412823 ?auto_412824 ) ) ( not ( = ?auto_412821 ?auto_412823 ) ) ( not ( = ?auto_412821 ?auto_412824 ) ) ( not ( = ?auto_412828 ?auto_412827 ) ) ( HOIST-AT ?auto_412830 ?auto_412828 ) ( not ( = ?auto_412825 ?auto_412830 ) ) ( SURFACE-AT ?auto_412824 ?auto_412828 ) ( ON ?auto_412824 ?auto_412829 ) ( CLEAR ?auto_412824 ) ( not ( = ?auto_412823 ?auto_412829 ) ) ( not ( = ?auto_412824 ?auto_412829 ) ) ( not ( = ?auto_412821 ?auto_412829 ) ) ( IS-CRATE ?auto_412823 ) ( AVAILABLE ?auto_412830 ) ( SURFACE-AT ?auto_412823 ?auto_412828 ) ( ON ?auto_412823 ?auto_412826 ) ( CLEAR ?auto_412823 ) ( not ( = ?auto_412823 ?auto_412826 ) ) ( not ( = ?auto_412824 ?auto_412826 ) ) ( not ( = ?auto_412821 ?auto_412826 ) ) ( not ( = ?auto_412829 ?auto_412826 ) ) ( TRUCK-AT ?auto_412831 ?auto_412827 ) ( SURFACE-AT ?auto_412822 ?auto_412827 ) ( CLEAR ?auto_412822 ) ( LIFTING ?auto_412825 ?auto_412821 ) ( IS-CRATE ?auto_412821 ) ( not ( = ?auto_412822 ?auto_412821 ) ) ( not ( = ?auto_412823 ?auto_412822 ) ) ( not ( = ?auto_412824 ?auto_412822 ) ) ( not ( = ?auto_412829 ?auto_412822 ) ) ( not ( = ?auto_412826 ?auto_412822 ) ) ( ON ?auto_412819 ?auto_412818 ) ( ON ?auto_412820 ?auto_412819 ) ( ON ?auto_412822 ?auto_412820 ) ( not ( = ?auto_412818 ?auto_412819 ) ) ( not ( = ?auto_412818 ?auto_412820 ) ) ( not ( = ?auto_412818 ?auto_412822 ) ) ( not ( = ?auto_412818 ?auto_412821 ) ) ( not ( = ?auto_412818 ?auto_412823 ) ) ( not ( = ?auto_412818 ?auto_412824 ) ) ( not ( = ?auto_412818 ?auto_412829 ) ) ( not ( = ?auto_412818 ?auto_412826 ) ) ( not ( = ?auto_412819 ?auto_412820 ) ) ( not ( = ?auto_412819 ?auto_412822 ) ) ( not ( = ?auto_412819 ?auto_412821 ) ) ( not ( = ?auto_412819 ?auto_412823 ) ) ( not ( = ?auto_412819 ?auto_412824 ) ) ( not ( = ?auto_412819 ?auto_412829 ) ) ( not ( = ?auto_412819 ?auto_412826 ) ) ( not ( = ?auto_412820 ?auto_412822 ) ) ( not ( = ?auto_412820 ?auto_412821 ) ) ( not ( = ?auto_412820 ?auto_412823 ) ) ( not ( = ?auto_412820 ?auto_412824 ) ) ( not ( = ?auto_412820 ?auto_412829 ) ) ( not ( = ?auto_412820 ?auto_412826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412821 ?auto_412823 ?auto_412824 )
      ( MAKE-6CRATE-VERIFY ?auto_412818 ?auto_412819 ?auto_412820 ?auto_412822 ?auto_412821 ?auto_412823 ?auto_412824 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_412832 - SURFACE
      ?auto_412833 - SURFACE
      ?auto_412834 - SURFACE
      ?auto_412836 - SURFACE
      ?auto_412835 - SURFACE
      ?auto_412837 - SURFACE
      ?auto_412838 - SURFACE
      ?auto_412839 - SURFACE
    )
    :vars
    (
      ?auto_412840 - HOIST
      ?auto_412842 - PLACE
      ?auto_412843 - PLACE
      ?auto_412845 - HOIST
      ?auto_412844 - SURFACE
      ?auto_412841 - SURFACE
      ?auto_412846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412840 ?auto_412842 ) ( IS-CRATE ?auto_412839 ) ( not ( = ?auto_412838 ?auto_412839 ) ) ( not ( = ?auto_412837 ?auto_412838 ) ) ( not ( = ?auto_412837 ?auto_412839 ) ) ( not ( = ?auto_412843 ?auto_412842 ) ) ( HOIST-AT ?auto_412845 ?auto_412843 ) ( not ( = ?auto_412840 ?auto_412845 ) ) ( SURFACE-AT ?auto_412839 ?auto_412843 ) ( ON ?auto_412839 ?auto_412844 ) ( CLEAR ?auto_412839 ) ( not ( = ?auto_412838 ?auto_412844 ) ) ( not ( = ?auto_412839 ?auto_412844 ) ) ( not ( = ?auto_412837 ?auto_412844 ) ) ( IS-CRATE ?auto_412838 ) ( AVAILABLE ?auto_412845 ) ( SURFACE-AT ?auto_412838 ?auto_412843 ) ( ON ?auto_412838 ?auto_412841 ) ( CLEAR ?auto_412838 ) ( not ( = ?auto_412838 ?auto_412841 ) ) ( not ( = ?auto_412839 ?auto_412841 ) ) ( not ( = ?auto_412837 ?auto_412841 ) ) ( not ( = ?auto_412844 ?auto_412841 ) ) ( TRUCK-AT ?auto_412846 ?auto_412842 ) ( SURFACE-AT ?auto_412835 ?auto_412842 ) ( CLEAR ?auto_412835 ) ( LIFTING ?auto_412840 ?auto_412837 ) ( IS-CRATE ?auto_412837 ) ( not ( = ?auto_412835 ?auto_412837 ) ) ( not ( = ?auto_412838 ?auto_412835 ) ) ( not ( = ?auto_412839 ?auto_412835 ) ) ( not ( = ?auto_412844 ?auto_412835 ) ) ( not ( = ?auto_412841 ?auto_412835 ) ) ( ON ?auto_412833 ?auto_412832 ) ( ON ?auto_412834 ?auto_412833 ) ( ON ?auto_412836 ?auto_412834 ) ( ON ?auto_412835 ?auto_412836 ) ( not ( = ?auto_412832 ?auto_412833 ) ) ( not ( = ?auto_412832 ?auto_412834 ) ) ( not ( = ?auto_412832 ?auto_412836 ) ) ( not ( = ?auto_412832 ?auto_412835 ) ) ( not ( = ?auto_412832 ?auto_412837 ) ) ( not ( = ?auto_412832 ?auto_412838 ) ) ( not ( = ?auto_412832 ?auto_412839 ) ) ( not ( = ?auto_412832 ?auto_412844 ) ) ( not ( = ?auto_412832 ?auto_412841 ) ) ( not ( = ?auto_412833 ?auto_412834 ) ) ( not ( = ?auto_412833 ?auto_412836 ) ) ( not ( = ?auto_412833 ?auto_412835 ) ) ( not ( = ?auto_412833 ?auto_412837 ) ) ( not ( = ?auto_412833 ?auto_412838 ) ) ( not ( = ?auto_412833 ?auto_412839 ) ) ( not ( = ?auto_412833 ?auto_412844 ) ) ( not ( = ?auto_412833 ?auto_412841 ) ) ( not ( = ?auto_412834 ?auto_412836 ) ) ( not ( = ?auto_412834 ?auto_412835 ) ) ( not ( = ?auto_412834 ?auto_412837 ) ) ( not ( = ?auto_412834 ?auto_412838 ) ) ( not ( = ?auto_412834 ?auto_412839 ) ) ( not ( = ?auto_412834 ?auto_412844 ) ) ( not ( = ?auto_412834 ?auto_412841 ) ) ( not ( = ?auto_412836 ?auto_412835 ) ) ( not ( = ?auto_412836 ?auto_412837 ) ) ( not ( = ?auto_412836 ?auto_412838 ) ) ( not ( = ?auto_412836 ?auto_412839 ) ) ( not ( = ?auto_412836 ?auto_412844 ) ) ( not ( = ?auto_412836 ?auto_412841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412837 ?auto_412838 ?auto_412839 )
      ( MAKE-7CRATE-VERIFY ?auto_412832 ?auto_412833 ?auto_412834 ?auto_412836 ?auto_412835 ?auto_412837 ?auto_412838 ?auto_412839 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_412847 - SURFACE
      ?auto_412848 - SURFACE
      ?auto_412849 - SURFACE
      ?auto_412851 - SURFACE
      ?auto_412850 - SURFACE
      ?auto_412852 - SURFACE
      ?auto_412853 - SURFACE
      ?auto_412854 - SURFACE
      ?auto_412855 - SURFACE
    )
    :vars
    (
      ?auto_412856 - HOIST
      ?auto_412858 - PLACE
      ?auto_412859 - PLACE
      ?auto_412861 - HOIST
      ?auto_412860 - SURFACE
      ?auto_412857 - SURFACE
      ?auto_412862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_412856 ?auto_412858 ) ( IS-CRATE ?auto_412855 ) ( not ( = ?auto_412854 ?auto_412855 ) ) ( not ( = ?auto_412853 ?auto_412854 ) ) ( not ( = ?auto_412853 ?auto_412855 ) ) ( not ( = ?auto_412859 ?auto_412858 ) ) ( HOIST-AT ?auto_412861 ?auto_412859 ) ( not ( = ?auto_412856 ?auto_412861 ) ) ( SURFACE-AT ?auto_412855 ?auto_412859 ) ( ON ?auto_412855 ?auto_412860 ) ( CLEAR ?auto_412855 ) ( not ( = ?auto_412854 ?auto_412860 ) ) ( not ( = ?auto_412855 ?auto_412860 ) ) ( not ( = ?auto_412853 ?auto_412860 ) ) ( IS-CRATE ?auto_412854 ) ( AVAILABLE ?auto_412861 ) ( SURFACE-AT ?auto_412854 ?auto_412859 ) ( ON ?auto_412854 ?auto_412857 ) ( CLEAR ?auto_412854 ) ( not ( = ?auto_412854 ?auto_412857 ) ) ( not ( = ?auto_412855 ?auto_412857 ) ) ( not ( = ?auto_412853 ?auto_412857 ) ) ( not ( = ?auto_412860 ?auto_412857 ) ) ( TRUCK-AT ?auto_412862 ?auto_412858 ) ( SURFACE-AT ?auto_412852 ?auto_412858 ) ( CLEAR ?auto_412852 ) ( LIFTING ?auto_412856 ?auto_412853 ) ( IS-CRATE ?auto_412853 ) ( not ( = ?auto_412852 ?auto_412853 ) ) ( not ( = ?auto_412854 ?auto_412852 ) ) ( not ( = ?auto_412855 ?auto_412852 ) ) ( not ( = ?auto_412860 ?auto_412852 ) ) ( not ( = ?auto_412857 ?auto_412852 ) ) ( ON ?auto_412848 ?auto_412847 ) ( ON ?auto_412849 ?auto_412848 ) ( ON ?auto_412851 ?auto_412849 ) ( ON ?auto_412850 ?auto_412851 ) ( ON ?auto_412852 ?auto_412850 ) ( not ( = ?auto_412847 ?auto_412848 ) ) ( not ( = ?auto_412847 ?auto_412849 ) ) ( not ( = ?auto_412847 ?auto_412851 ) ) ( not ( = ?auto_412847 ?auto_412850 ) ) ( not ( = ?auto_412847 ?auto_412852 ) ) ( not ( = ?auto_412847 ?auto_412853 ) ) ( not ( = ?auto_412847 ?auto_412854 ) ) ( not ( = ?auto_412847 ?auto_412855 ) ) ( not ( = ?auto_412847 ?auto_412860 ) ) ( not ( = ?auto_412847 ?auto_412857 ) ) ( not ( = ?auto_412848 ?auto_412849 ) ) ( not ( = ?auto_412848 ?auto_412851 ) ) ( not ( = ?auto_412848 ?auto_412850 ) ) ( not ( = ?auto_412848 ?auto_412852 ) ) ( not ( = ?auto_412848 ?auto_412853 ) ) ( not ( = ?auto_412848 ?auto_412854 ) ) ( not ( = ?auto_412848 ?auto_412855 ) ) ( not ( = ?auto_412848 ?auto_412860 ) ) ( not ( = ?auto_412848 ?auto_412857 ) ) ( not ( = ?auto_412849 ?auto_412851 ) ) ( not ( = ?auto_412849 ?auto_412850 ) ) ( not ( = ?auto_412849 ?auto_412852 ) ) ( not ( = ?auto_412849 ?auto_412853 ) ) ( not ( = ?auto_412849 ?auto_412854 ) ) ( not ( = ?auto_412849 ?auto_412855 ) ) ( not ( = ?auto_412849 ?auto_412860 ) ) ( not ( = ?auto_412849 ?auto_412857 ) ) ( not ( = ?auto_412851 ?auto_412850 ) ) ( not ( = ?auto_412851 ?auto_412852 ) ) ( not ( = ?auto_412851 ?auto_412853 ) ) ( not ( = ?auto_412851 ?auto_412854 ) ) ( not ( = ?auto_412851 ?auto_412855 ) ) ( not ( = ?auto_412851 ?auto_412860 ) ) ( not ( = ?auto_412851 ?auto_412857 ) ) ( not ( = ?auto_412850 ?auto_412852 ) ) ( not ( = ?auto_412850 ?auto_412853 ) ) ( not ( = ?auto_412850 ?auto_412854 ) ) ( not ( = ?auto_412850 ?auto_412855 ) ) ( not ( = ?auto_412850 ?auto_412860 ) ) ( not ( = ?auto_412850 ?auto_412857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_412853 ?auto_412854 ?auto_412855 )
      ( MAKE-8CRATE-VERIFY ?auto_412847 ?auto_412848 ?auto_412849 ?auto_412851 ?auto_412850 ?auto_412852 ?auto_412853 ?auto_412854 ?auto_412855 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416385 - SURFACE
      ?auto_416386 - SURFACE
      ?auto_416387 - SURFACE
      ?auto_416389 - SURFACE
      ?auto_416388 - SURFACE
      ?auto_416390 - SURFACE
      ?auto_416391 - SURFACE
      ?auto_416392 - SURFACE
      ?auto_416393 - SURFACE
      ?auto_416394 - SURFACE
    )
    :vars
    (
      ?auto_416395 - HOIST
      ?auto_416396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_416395 ?auto_416396 ) ( SURFACE-AT ?auto_416393 ?auto_416396 ) ( CLEAR ?auto_416393 ) ( LIFTING ?auto_416395 ?auto_416394 ) ( IS-CRATE ?auto_416394 ) ( not ( = ?auto_416393 ?auto_416394 ) ) ( ON ?auto_416386 ?auto_416385 ) ( ON ?auto_416387 ?auto_416386 ) ( ON ?auto_416389 ?auto_416387 ) ( ON ?auto_416388 ?auto_416389 ) ( ON ?auto_416390 ?auto_416388 ) ( ON ?auto_416391 ?auto_416390 ) ( ON ?auto_416392 ?auto_416391 ) ( ON ?auto_416393 ?auto_416392 ) ( not ( = ?auto_416385 ?auto_416386 ) ) ( not ( = ?auto_416385 ?auto_416387 ) ) ( not ( = ?auto_416385 ?auto_416389 ) ) ( not ( = ?auto_416385 ?auto_416388 ) ) ( not ( = ?auto_416385 ?auto_416390 ) ) ( not ( = ?auto_416385 ?auto_416391 ) ) ( not ( = ?auto_416385 ?auto_416392 ) ) ( not ( = ?auto_416385 ?auto_416393 ) ) ( not ( = ?auto_416385 ?auto_416394 ) ) ( not ( = ?auto_416386 ?auto_416387 ) ) ( not ( = ?auto_416386 ?auto_416389 ) ) ( not ( = ?auto_416386 ?auto_416388 ) ) ( not ( = ?auto_416386 ?auto_416390 ) ) ( not ( = ?auto_416386 ?auto_416391 ) ) ( not ( = ?auto_416386 ?auto_416392 ) ) ( not ( = ?auto_416386 ?auto_416393 ) ) ( not ( = ?auto_416386 ?auto_416394 ) ) ( not ( = ?auto_416387 ?auto_416389 ) ) ( not ( = ?auto_416387 ?auto_416388 ) ) ( not ( = ?auto_416387 ?auto_416390 ) ) ( not ( = ?auto_416387 ?auto_416391 ) ) ( not ( = ?auto_416387 ?auto_416392 ) ) ( not ( = ?auto_416387 ?auto_416393 ) ) ( not ( = ?auto_416387 ?auto_416394 ) ) ( not ( = ?auto_416389 ?auto_416388 ) ) ( not ( = ?auto_416389 ?auto_416390 ) ) ( not ( = ?auto_416389 ?auto_416391 ) ) ( not ( = ?auto_416389 ?auto_416392 ) ) ( not ( = ?auto_416389 ?auto_416393 ) ) ( not ( = ?auto_416389 ?auto_416394 ) ) ( not ( = ?auto_416388 ?auto_416390 ) ) ( not ( = ?auto_416388 ?auto_416391 ) ) ( not ( = ?auto_416388 ?auto_416392 ) ) ( not ( = ?auto_416388 ?auto_416393 ) ) ( not ( = ?auto_416388 ?auto_416394 ) ) ( not ( = ?auto_416390 ?auto_416391 ) ) ( not ( = ?auto_416390 ?auto_416392 ) ) ( not ( = ?auto_416390 ?auto_416393 ) ) ( not ( = ?auto_416390 ?auto_416394 ) ) ( not ( = ?auto_416391 ?auto_416392 ) ) ( not ( = ?auto_416391 ?auto_416393 ) ) ( not ( = ?auto_416391 ?auto_416394 ) ) ( not ( = ?auto_416392 ?auto_416393 ) ) ( not ( = ?auto_416392 ?auto_416394 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_416393 ?auto_416394 )
      ( MAKE-9CRATE-VERIFY ?auto_416385 ?auto_416386 ?auto_416387 ?auto_416389 ?auto_416388 ?auto_416390 ?auto_416391 ?auto_416392 ?auto_416393 ?auto_416394 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416465 - SURFACE
      ?auto_416466 - SURFACE
      ?auto_416467 - SURFACE
      ?auto_416469 - SURFACE
      ?auto_416468 - SURFACE
      ?auto_416470 - SURFACE
      ?auto_416471 - SURFACE
      ?auto_416472 - SURFACE
      ?auto_416473 - SURFACE
      ?auto_416474 - SURFACE
    )
    :vars
    (
      ?auto_416475 - HOIST
      ?auto_416476 - PLACE
      ?auto_416477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_416475 ?auto_416476 ) ( SURFACE-AT ?auto_416473 ?auto_416476 ) ( CLEAR ?auto_416473 ) ( IS-CRATE ?auto_416474 ) ( not ( = ?auto_416473 ?auto_416474 ) ) ( TRUCK-AT ?auto_416477 ?auto_416476 ) ( AVAILABLE ?auto_416475 ) ( IN ?auto_416474 ?auto_416477 ) ( ON ?auto_416473 ?auto_416472 ) ( not ( = ?auto_416472 ?auto_416473 ) ) ( not ( = ?auto_416472 ?auto_416474 ) ) ( ON ?auto_416466 ?auto_416465 ) ( ON ?auto_416467 ?auto_416466 ) ( ON ?auto_416469 ?auto_416467 ) ( ON ?auto_416468 ?auto_416469 ) ( ON ?auto_416470 ?auto_416468 ) ( ON ?auto_416471 ?auto_416470 ) ( ON ?auto_416472 ?auto_416471 ) ( not ( = ?auto_416465 ?auto_416466 ) ) ( not ( = ?auto_416465 ?auto_416467 ) ) ( not ( = ?auto_416465 ?auto_416469 ) ) ( not ( = ?auto_416465 ?auto_416468 ) ) ( not ( = ?auto_416465 ?auto_416470 ) ) ( not ( = ?auto_416465 ?auto_416471 ) ) ( not ( = ?auto_416465 ?auto_416472 ) ) ( not ( = ?auto_416465 ?auto_416473 ) ) ( not ( = ?auto_416465 ?auto_416474 ) ) ( not ( = ?auto_416466 ?auto_416467 ) ) ( not ( = ?auto_416466 ?auto_416469 ) ) ( not ( = ?auto_416466 ?auto_416468 ) ) ( not ( = ?auto_416466 ?auto_416470 ) ) ( not ( = ?auto_416466 ?auto_416471 ) ) ( not ( = ?auto_416466 ?auto_416472 ) ) ( not ( = ?auto_416466 ?auto_416473 ) ) ( not ( = ?auto_416466 ?auto_416474 ) ) ( not ( = ?auto_416467 ?auto_416469 ) ) ( not ( = ?auto_416467 ?auto_416468 ) ) ( not ( = ?auto_416467 ?auto_416470 ) ) ( not ( = ?auto_416467 ?auto_416471 ) ) ( not ( = ?auto_416467 ?auto_416472 ) ) ( not ( = ?auto_416467 ?auto_416473 ) ) ( not ( = ?auto_416467 ?auto_416474 ) ) ( not ( = ?auto_416469 ?auto_416468 ) ) ( not ( = ?auto_416469 ?auto_416470 ) ) ( not ( = ?auto_416469 ?auto_416471 ) ) ( not ( = ?auto_416469 ?auto_416472 ) ) ( not ( = ?auto_416469 ?auto_416473 ) ) ( not ( = ?auto_416469 ?auto_416474 ) ) ( not ( = ?auto_416468 ?auto_416470 ) ) ( not ( = ?auto_416468 ?auto_416471 ) ) ( not ( = ?auto_416468 ?auto_416472 ) ) ( not ( = ?auto_416468 ?auto_416473 ) ) ( not ( = ?auto_416468 ?auto_416474 ) ) ( not ( = ?auto_416470 ?auto_416471 ) ) ( not ( = ?auto_416470 ?auto_416472 ) ) ( not ( = ?auto_416470 ?auto_416473 ) ) ( not ( = ?auto_416470 ?auto_416474 ) ) ( not ( = ?auto_416471 ?auto_416472 ) ) ( not ( = ?auto_416471 ?auto_416473 ) ) ( not ( = ?auto_416471 ?auto_416474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_416472 ?auto_416473 ?auto_416474 )
      ( MAKE-9CRATE-VERIFY ?auto_416465 ?auto_416466 ?auto_416467 ?auto_416469 ?auto_416468 ?auto_416470 ?auto_416471 ?auto_416472 ?auto_416473 ?auto_416474 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416555 - SURFACE
      ?auto_416556 - SURFACE
      ?auto_416557 - SURFACE
      ?auto_416559 - SURFACE
      ?auto_416558 - SURFACE
      ?auto_416560 - SURFACE
      ?auto_416561 - SURFACE
      ?auto_416562 - SURFACE
      ?auto_416563 - SURFACE
      ?auto_416564 - SURFACE
    )
    :vars
    (
      ?auto_416565 - HOIST
      ?auto_416568 - PLACE
      ?auto_416567 - TRUCK
      ?auto_416566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_416565 ?auto_416568 ) ( SURFACE-AT ?auto_416563 ?auto_416568 ) ( CLEAR ?auto_416563 ) ( IS-CRATE ?auto_416564 ) ( not ( = ?auto_416563 ?auto_416564 ) ) ( AVAILABLE ?auto_416565 ) ( IN ?auto_416564 ?auto_416567 ) ( ON ?auto_416563 ?auto_416562 ) ( not ( = ?auto_416562 ?auto_416563 ) ) ( not ( = ?auto_416562 ?auto_416564 ) ) ( TRUCK-AT ?auto_416567 ?auto_416566 ) ( not ( = ?auto_416566 ?auto_416568 ) ) ( ON ?auto_416556 ?auto_416555 ) ( ON ?auto_416557 ?auto_416556 ) ( ON ?auto_416559 ?auto_416557 ) ( ON ?auto_416558 ?auto_416559 ) ( ON ?auto_416560 ?auto_416558 ) ( ON ?auto_416561 ?auto_416560 ) ( ON ?auto_416562 ?auto_416561 ) ( not ( = ?auto_416555 ?auto_416556 ) ) ( not ( = ?auto_416555 ?auto_416557 ) ) ( not ( = ?auto_416555 ?auto_416559 ) ) ( not ( = ?auto_416555 ?auto_416558 ) ) ( not ( = ?auto_416555 ?auto_416560 ) ) ( not ( = ?auto_416555 ?auto_416561 ) ) ( not ( = ?auto_416555 ?auto_416562 ) ) ( not ( = ?auto_416555 ?auto_416563 ) ) ( not ( = ?auto_416555 ?auto_416564 ) ) ( not ( = ?auto_416556 ?auto_416557 ) ) ( not ( = ?auto_416556 ?auto_416559 ) ) ( not ( = ?auto_416556 ?auto_416558 ) ) ( not ( = ?auto_416556 ?auto_416560 ) ) ( not ( = ?auto_416556 ?auto_416561 ) ) ( not ( = ?auto_416556 ?auto_416562 ) ) ( not ( = ?auto_416556 ?auto_416563 ) ) ( not ( = ?auto_416556 ?auto_416564 ) ) ( not ( = ?auto_416557 ?auto_416559 ) ) ( not ( = ?auto_416557 ?auto_416558 ) ) ( not ( = ?auto_416557 ?auto_416560 ) ) ( not ( = ?auto_416557 ?auto_416561 ) ) ( not ( = ?auto_416557 ?auto_416562 ) ) ( not ( = ?auto_416557 ?auto_416563 ) ) ( not ( = ?auto_416557 ?auto_416564 ) ) ( not ( = ?auto_416559 ?auto_416558 ) ) ( not ( = ?auto_416559 ?auto_416560 ) ) ( not ( = ?auto_416559 ?auto_416561 ) ) ( not ( = ?auto_416559 ?auto_416562 ) ) ( not ( = ?auto_416559 ?auto_416563 ) ) ( not ( = ?auto_416559 ?auto_416564 ) ) ( not ( = ?auto_416558 ?auto_416560 ) ) ( not ( = ?auto_416558 ?auto_416561 ) ) ( not ( = ?auto_416558 ?auto_416562 ) ) ( not ( = ?auto_416558 ?auto_416563 ) ) ( not ( = ?auto_416558 ?auto_416564 ) ) ( not ( = ?auto_416560 ?auto_416561 ) ) ( not ( = ?auto_416560 ?auto_416562 ) ) ( not ( = ?auto_416560 ?auto_416563 ) ) ( not ( = ?auto_416560 ?auto_416564 ) ) ( not ( = ?auto_416561 ?auto_416562 ) ) ( not ( = ?auto_416561 ?auto_416563 ) ) ( not ( = ?auto_416561 ?auto_416564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_416562 ?auto_416563 ?auto_416564 )
      ( MAKE-9CRATE-VERIFY ?auto_416555 ?auto_416556 ?auto_416557 ?auto_416559 ?auto_416558 ?auto_416560 ?auto_416561 ?auto_416562 ?auto_416563 ?auto_416564 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416654 - SURFACE
      ?auto_416655 - SURFACE
      ?auto_416656 - SURFACE
      ?auto_416658 - SURFACE
      ?auto_416657 - SURFACE
      ?auto_416659 - SURFACE
      ?auto_416660 - SURFACE
      ?auto_416661 - SURFACE
      ?auto_416662 - SURFACE
      ?auto_416663 - SURFACE
    )
    :vars
    (
      ?auto_416666 - HOIST
      ?auto_416664 - PLACE
      ?auto_416668 - TRUCK
      ?auto_416665 - PLACE
      ?auto_416667 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_416666 ?auto_416664 ) ( SURFACE-AT ?auto_416662 ?auto_416664 ) ( CLEAR ?auto_416662 ) ( IS-CRATE ?auto_416663 ) ( not ( = ?auto_416662 ?auto_416663 ) ) ( AVAILABLE ?auto_416666 ) ( ON ?auto_416662 ?auto_416661 ) ( not ( = ?auto_416661 ?auto_416662 ) ) ( not ( = ?auto_416661 ?auto_416663 ) ) ( TRUCK-AT ?auto_416668 ?auto_416665 ) ( not ( = ?auto_416665 ?auto_416664 ) ) ( HOIST-AT ?auto_416667 ?auto_416665 ) ( LIFTING ?auto_416667 ?auto_416663 ) ( not ( = ?auto_416666 ?auto_416667 ) ) ( ON ?auto_416655 ?auto_416654 ) ( ON ?auto_416656 ?auto_416655 ) ( ON ?auto_416658 ?auto_416656 ) ( ON ?auto_416657 ?auto_416658 ) ( ON ?auto_416659 ?auto_416657 ) ( ON ?auto_416660 ?auto_416659 ) ( ON ?auto_416661 ?auto_416660 ) ( not ( = ?auto_416654 ?auto_416655 ) ) ( not ( = ?auto_416654 ?auto_416656 ) ) ( not ( = ?auto_416654 ?auto_416658 ) ) ( not ( = ?auto_416654 ?auto_416657 ) ) ( not ( = ?auto_416654 ?auto_416659 ) ) ( not ( = ?auto_416654 ?auto_416660 ) ) ( not ( = ?auto_416654 ?auto_416661 ) ) ( not ( = ?auto_416654 ?auto_416662 ) ) ( not ( = ?auto_416654 ?auto_416663 ) ) ( not ( = ?auto_416655 ?auto_416656 ) ) ( not ( = ?auto_416655 ?auto_416658 ) ) ( not ( = ?auto_416655 ?auto_416657 ) ) ( not ( = ?auto_416655 ?auto_416659 ) ) ( not ( = ?auto_416655 ?auto_416660 ) ) ( not ( = ?auto_416655 ?auto_416661 ) ) ( not ( = ?auto_416655 ?auto_416662 ) ) ( not ( = ?auto_416655 ?auto_416663 ) ) ( not ( = ?auto_416656 ?auto_416658 ) ) ( not ( = ?auto_416656 ?auto_416657 ) ) ( not ( = ?auto_416656 ?auto_416659 ) ) ( not ( = ?auto_416656 ?auto_416660 ) ) ( not ( = ?auto_416656 ?auto_416661 ) ) ( not ( = ?auto_416656 ?auto_416662 ) ) ( not ( = ?auto_416656 ?auto_416663 ) ) ( not ( = ?auto_416658 ?auto_416657 ) ) ( not ( = ?auto_416658 ?auto_416659 ) ) ( not ( = ?auto_416658 ?auto_416660 ) ) ( not ( = ?auto_416658 ?auto_416661 ) ) ( not ( = ?auto_416658 ?auto_416662 ) ) ( not ( = ?auto_416658 ?auto_416663 ) ) ( not ( = ?auto_416657 ?auto_416659 ) ) ( not ( = ?auto_416657 ?auto_416660 ) ) ( not ( = ?auto_416657 ?auto_416661 ) ) ( not ( = ?auto_416657 ?auto_416662 ) ) ( not ( = ?auto_416657 ?auto_416663 ) ) ( not ( = ?auto_416659 ?auto_416660 ) ) ( not ( = ?auto_416659 ?auto_416661 ) ) ( not ( = ?auto_416659 ?auto_416662 ) ) ( not ( = ?auto_416659 ?auto_416663 ) ) ( not ( = ?auto_416660 ?auto_416661 ) ) ( not ( = ?auto_416660 ?auto_416662 ) ) ( not ( = ?auto_416660 ?auto_416663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_416661 ?auto_416662 ?auto_416663 )
      ( MAKE-9CRATE-VERIFY ?auto_416654 ?auto_416655 ?auto_416656 ?auto_416658 ?auto_416657 ?auto_416659 ?auto_416660 ?auto_416661 ?auto_416662 ?auto_416663 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416762 - SURFACE
      ?auto_416763 - SURFACE
      ?auto_416764 - SURFACE
      ?auto_416766 - SURFACE
      ?auto_416765 - SURFACE
      ?auto_416767 - SURFACE
      ?auto_416768 - SURFACE
      ?auto_416769 - SURFACE
      ?auto_416770 - SURFACE
      ?auto_416771 - SURFACE
    )
    :vars
    (
      ?auto_416772 - HOIST
      ?auto_416775 - PLACE
      ?auto_416773 - TRUCK
      ?auto_416777 - PLACE
      ?auto_416776 - HOIST
      ?auto_416774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_416772 ?auto_416775 ) ( SURFACE-AT ?auto_416770 ?auto_416775 ) ( CLEAR ?auto_416770 ) ( IS-CRATE ?auto_416771 ) ( not ( = ?auto_416770 ?auto_416771 ) ) ( AVAILABLE ?auto_416772 ) ( ON ?auto_416770 ?auto_416769 ) ( not ( = ?auto_416769 ?auto_416770 ) ) ( not ( = ?auto_416769 ?auto_416771 ) ) ( TRUCK-AT ?auto_416773 ?auto_416777 ) ( not ( = ?auto_416777 ?auto_416775 ) ) ( HOIST-AT ?auto_416776 ?auto_416777 ) ( not ( = ?auto_416772 ?auto_416776 ) ) ( AVAILABLE ?auto_416776 ) ( SURFACE-AT ?auto_416771 ?auto_416777 ) ( ON ?auto_416771 ?auto_416774 ) ( CLEAR ?auto_416771 ) ( not ( = ?auto_416770 ?auto_416774 ) ) ( not ( = ?auto_416771 ?auto_416774 ) ) ( not ( = ?auto_416769 ?auto_416774 ) ) ( ON ?auto_416763 ?auto_416762 ) ( ON ?auto_416764 ?auto_416763 ) ( ON ?auto_416766 ?auto_416764 ) ( ON ?auto_416765 ?auto_416766 ) ( ON ?auto_416767 ?auto_416765 ) ( ON ?auto_416768 ?auto_416767 ) ( ON ?auto_416769 ?auto_416768 ) ( not ( = ?auto_416762 ?auto_416763 ) ) ( not ( = ?auto_416762 ?auto_416764 ) ) ( not ( = ?auto_416762 ?auto_416766 ) ) ( not ( = ?auto_416762 ?auto_416765 ) ) ( not ( = ?auto_416762 ?auto_416767 ) ) ( not ( = ?auto_416762 ?auto_416768 ) ) ( not ( = ?auto_416762 ?auto_416769 ) ) ( not ( = ?auto_416762 ?auto_416770 ) ) ( not ( = ?auto_416762 ?auto_416771 ) ) ( not ( = ?auto_416762 ?auto_416774 ) ) ( not ( = ?auto_416763 ?auto_416764 ) ) ( not ( = ?auto_416763 ?auto_416766 ) ) ( not ( = ?auto_416763 ?auto_416765 ) ) ( not ( = ?auto_416763 ?auto_416767 ) ) ( not ( = ?auto_416763 ?auto_416768 ) ) ( not ( = ?auto_416763 ?auto_416769 ) ) ( not ( = ?auto_416763 ?auto_416770 ) ) ( not ( = ?auto_416763 ?auto_416771 ) ) ( not ( = ?auto_416763 ?auto_416774 ) ) ( not ( = ?auto_416764 ?auto_416766 ) ) ( not ( = ?auto_416764 ?auto_416765 ) ) ( not ( = ?auto_416764 ?auto_416767 ) ) ( not ( = ?auto_416764 ?auto_416768 ) ) ( not ( = ?auto_416764 ?auto_416769 ) ) ( not ( = ?auto_416764 ?auto_416770 ) ) ( not ( = ?auto_416764 ?auto_416771 ) ) ( not ( = ?auto_416764 ?auto_416774 ) ) ( not ( = ?auto_416766 ?auto_416765 ) ) ( not ( = ?auto_416766 ?auto_416767 ) ) ( not ( = ?auto_416766 ?auto_416768 ) ) ( not ( = ?auto_416766 ?auto_416769 ) ) ( not ( = ?auto_416766 ?auto_416770 ) ) ( not ( = ?auto_416766 ?auto_416771 ) ) ( not ( = ?auto_416766 ?auto_416774 ) ) ( not ( = ?auto_416765 ?auto_416767 ) ) ( not ( = ?auto_416765 ?auto_416768 ) ) ( not ( = ?auto_416765 ?auto_416769 ) ) ( not ( = ?auto_416765 ?auto_416770 ) ) ( not ( = ?auto_416765 ?auto_416771 ) ) ( not ( = ?auto_416765 ?auto_416774 ) ) ( not ( = ?auto_416767 ?auto_416768 ) ) ( not ( = ?auto_416767 ?auto_416769 ) ) ( not ( = ?auto_416767 ?auto_416770 ) ) ( not ( = ?auto_416767 ?auto_416771 ) ) ( not ( = ?auto_416767 ?auto_416774 ) ) ( not ( = ?auto_416768 ?auto_416769 ) ) ( not ( = ?auto_416768 ?auto_416770 ) ) ( not ( = ?auto_416768 ?auto_416771 ) ) ( not ( = ?auto_416768 ?auto_416774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_416769 ?auto_416770 ?auto_416771 )
      ( MAKE-9CRATE-VERIFY ?auto_416762 ?auto_416763 ?auto_416764 ?auto_416766 ?auto_416765 ?auto_416767 ?auto_416768 ?auto_416769 ?auto_416770 ?auto_416771 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416871 - SURFACE
      ?auto_416872 - SURFACE
      ?auto_416873 - SURFACE
      ?auto_416875 - SURFACE
      ?auto_416874 - SURFACE
      ?auto_416876 - SURFACE
      ?auto_416877 - SURFACE
      ?auto_416878 - SURFACE
      ?auto_416879 - SURFACE
      ?auto_416880 - SURFACE
    )
    :vars
    (
      ?auto_416886 - HOIST
      ?auto_416885 - PLACE
      ?auto_416882 - PLACE
      ?auto_416883 - HOIST
      ?auto_416881 - SURFACE
      ?auto_416884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_416886 ?auto_416885 ) ( SURFACE-AT ?auto_416879 ?auto_416885 ) ( CLEAR ?auto_416879 ) ( IS-CRATE ?auto_416880 ) ( not ( = ?auto_416879 ?auto_416880 ) ) ( AVAILABLE ?auto_416886 ) ( ON ?auto_416879 ?auto_416878 ) ( not ( = ?auto_416878 ?auto_416879 ) ) ( not ( = ?auto_416878 ?auto_416880 ) ) ( not ( = ?auto_416882 ?auto_416885 ) ) ( HOIST-AT ?auto_416883 ?auto_416882 ) ( not ( = ?auto_416886 ?auto_416883 ) ) ( AVAILABLE ?auto_416883 ) ( SURFACE-AT ?auto_416880 ?auto_416882 ) ( ON ?auto_416880 ?auto_416881 ) ( CLEAR ?auto_416880 ) ( not ( = ?auto_416879 ?auto_416881 ) ) ( not ( = ?auto_416880 ?auto_416881 ) ) ( not ( = ?auto_416878 ?auto_416881 ) ) ( TRUCK-AT ?auto_416884 ?auto_416885 ) ( ON ?auto_416872 ?auto_416871 ) ( ON ?auto_416873 ?auto_416872 ) ( ON ?auto_416875 ?auto_416873 ) ( ON ?auto_416874 ?auto_416875 ) ( ON ?auto_416876 ?auto_416874 ) ( ON ?auto_416877 ?auto_416876 ) ( ON ?auto_416878 ?auto_416877 ) ( not ( = ?auto_416871 ?auto_416872 ) ) ( not ( = ?auto_416871 ?auto_416873 ) ) ( not ( = ?auto_416871 ?auto_416875 ) ) ( not ( = ?auto_416871 ?auto_416874 ) ) ( not ( = ?auto_416871 ?auto_416876 ) ) ( not ( = ?auto_416871 ?auto_416877 ) ) ( not ( = ?auto_416871 ?auto_416878 ) ) ( not ( = ?auto_416871 ?auto_416879 ) ) ( not ( = ?auto_416871 ?auto_416880 ) ) ( not ( = ?auto_416871 ?auto_416881 ) ) ( not ( = ?auto_416872 ?auto_416873 ) ) ( not ( = ?auto_416872 ?auto_416875 ) ) ( not ( = ?auto_416872 ?auto_416874 ) ) ( not ( = ?auto_416872 ?auto_416876 ) ) ( not ( = ?auto_416872 ?auto_416877 ) ) ( not ( = ?auto_416872 ?auto_416878 ) ) ( not ( = ?auto_416872 ?auto_416879 ) ) ( not ( = ?auto_416872 ?auto_416880 ) ) ( not ( = ?auto_416872 ?auto_416881 ) ) ( not ( = ?auto_416873 ?auto_416875 ) ) ( not ( = ?auto_416873 ?auto_416874 ) ) ( not ( = ?auto_416873 ?auto_416876 ) ) ( not ( = ?auto_416873 ?auto_416877 ) ) ( not ( = ?auto_416873 ?auto_416878 ) ) ( not ( = ?auto_416873 ?auto_416879 ) ) ( not ( = ?auto_416873 ?auto_416880 ) ) ( not ( = ?auto_416873 ?auto_416881 ) ) ( not ( = ?auto_416875 ?auto_416874 ) ) ( not ( = ?auto_416875 ?auto_416876 ) ) ( not ( = ?auto_416875 ?auto_416877 ) ) ( not ( = ?auto_416875 ?auto_416878 ) ) ( not ( = ?auto_416875 ?auto_416879 ) ) ( not ( = ?auto_416875 ?auto_416880 ) ) ( not ( = ?auto_416875 ?auto_416881 ) ) ( not ( = ?auto_416874 ?auto_416876 ) ) ( not ( = ?auto_416874 ?auto_416877 ) ) ( not ( = ?auto_416874 ?auto_416878 ) ) ( not ( = ?auto_416874 ?auto_416879 ) ) ( not ( = ?auto_416874 ?auto_416880 ) ) ( not ( = ?auto_416874 ?auto_416881 ) ) ( not ( = ?auto_416876 ?auto_416877 ) ) ( not ( = ?auto_416876 ?auto_416878 ) ) ( not ( = ?auto_416876 ?auto_416879 ) ) ( not ( = ?auto_416876 ?auto_416880 ) ) ( not ( = ?auto_416876 ?auto_416881 ) ) ( not ( = ?auto_416877 ?auto_416878 ) ) ( not ( = ?auto_416877 ?auto_416879 ) ) ( not ( = ?auto_416877 ?auto_416880 ) ) ( not ( = ?auto_416877 ?auto_416881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_416878 ?auto_416879 ?auto_416880 )
      ( MAKE-9CRATE-VERIFY ?auto_416871 ?auto_416872 ?auto_416873 ?auto_416875 ?auto_416874 ?auto_416876 ?auto_416877 ?auto_416878 ?auto_416879 ?auto_416880 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_416980 - SURFACE
      ?auto_416981 - SURFACE
      ?auto_416982 - SURFACE
      ?auto_416984 - SURFACE
      ?auto_416983 - SURFACE
      ?auto_416985 - SURFACE
      ?auto_416986 - SURFACE
      ?auto_416987 - SURFACE
      ?auto_416988 - SURFACE
      ?auto_416989 - SURFACE
    )
    :vars
    (
      ?auto_416995 - HOIST
      ?auto_416990 - PLACE
      ?auto_416991 - PLACE
      ?auto_416992 - HOIST
      ?auto_416994 - SURFACE
      ?auto_416993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_416995 ?auto_416990 ) ( IS-CRATE ?auto_416989 ) ( not ( = ?auto_416988 ?auto_416989 ) ) ( not ( = ?auto_416987 ?auto_416988 ) ) ( not ( = ?auto_416987 ?auto_416989 ) ) ( not ( = ?auto_416991 ?auto_416990 ) ) ( HOIST-AT ?auto_416992 ?auto_416991 ) ( not ( = ?auto_416995 ?auto_416992 ) ) ( AVAILABLE ?auto_416992 ) ( SURFACE-AT ?auto_416989 ?auto_416991 ) ( ON ?auto_416989 ?auto_416994 ) ( CLEAR ?auto_416989 ) ( not ( = ?auto_416988 ?auto_416994 ) ) ( not ( = ?auto_416989 ?auto_416994 ) ) ( not ( = ?auto_416987 ?auto_416994 ) ) ( TRUCK-AT ?auto_416993 ?auto_416990 ) ( SURFACE-AT ?auto_416987 ?auto_416990 ) ( CLEAR ?auto_416987 ) ( LIFTING ?auto_416995 ?auto_416988 ) ( IS-CRATE ?auto_416988 ) ( ON ?auto_416981 ?auto_416980 ) ( ON ?auto_416982 ?auto_416981 ) ( ON ?auto_416984 ?auto_416982 ) ( ON ?auto_416983 ?auto_416984 ) ( ON ?auto_416985 ?auto_416983 ) ( ON ?auto_416986 ?auto_416985 ) ( ON ?auto_416987 ?auto_416986 ) ( not ( = ?auto_416980 ?auto_416981 ) ) ( not ( = ?auto_416980 ?auto_416982 ) ) ( not ( = ?auto_416980 ?auto_416984 ) ) ( not ( = ?auto_416980 ?auto_416983 ) ) ( not ( = ?auto_416980 ?auto_416985 ) ) ( not ( = ?auto_416980 ?auto_416986 ) ) ( not ( = ?auto_416980 ?auto_416987 ) ) ( not ( = ?auto_416980 ?auto_416988 ) ) ( not ( = ?auto_416980 ?auto_416989 ) ) ( not ( = ?auto_416980 ?auto_416994 ) ) ( not ( = ?auto_416981 ?auto_416982 ) ) ( not ( = ?auto_416981 ?auto_416984 ) ) ( not ( = ?auto_416981 ?auto_416983 ) ) ( not ( = ?auto_416981 ?auto_416985 ) ) ( not ( = ?auto_416981 ?auto_416986 ) ) ( not ( = ?auto_416981 ?auto_416987 ) ) ( not ( = ?auto_416981 ?auto_416988 ) ) ( not ( = ?auto_416981 ?auto_416989 ) ) ( not ( = ?auto_416981 ?auto_416994 ) ) ( not ( = ?auto_416982 ?auto_416984 ) ) ( not ( = ?auto_416982 ?auto_416983 ) ) ( not ( = ?auto_416982 ?auto_416985 ) ) ( not ( = ?auto_416982 ?auto_416986 ) ) ( not ( = ?auto_416982 ?auto_416987 ) ) ( not ( = ?auto_416982 ?auto_416988 ) ) ( not ( = ?auto_416982 ?auto_416989 ) ) ( not ( = ?auto_416982 ?auto_416994 ) ) ( not ( = ?auto_416984 ?auto_416983 ) ) ( not ( = ?auto_416984 ?auto_416985 ) ) ( not ( = ?auto_416984 ?auto_416986 ) ) ( not ( = ?auto_416984 ?auto_416987 ) ) ( not ( = ?auto_416984 ?auto_416988 ) ) ( not ( = ?auto_416984 ?auto_416989 ) ) ( not ( = ?auto_416984 ?auto_416994 ) ) ( not ( = ?auto_416983 ?auto_416985 ) ) ( not ( = ?auto_416983 ?auto_416986 ) ) ( not ( = ?auto_416983 ?auto_416987 ) ) ( not ( = ?auto_416983 ?auto_416988 ) ) ( not ( = ?auto_416983 ?auto_416989 ) ) ( not ( = ?auto_416983 ?auto_416994 ) ) ( not ( = ?auto_416985 ?auto_416986 ) ) ( not ( = ?auto_416985 ?auto_416987 ) ) ( not ( = ?auto_416985 ?auto_416988 ) ) ( not ( = ?auto_416985 ?auto_416989 ) ) ( not ( = ?auto_416985 ?auto_416994 ) ) ( not ( = ?auto_416986 ?auto_416987 ) ) ( not ( = ?auto_416986 ?auto_416988 ) ) ( not ( = ?auto_416986 ?auto_416989 ) ) ( not ( = ?auto_416986 ?auto_416994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_416987 ?auto_416988 ?auto_416989 )
      ( MAKE-9CRATE-VERIFY ?auto_416980 ?auto_416981 ?auto_416982 ?auto_416984 ?auto_416983 ?auto_416985 ?auto_416986 ?auto_416987 ?auto_416988 ?auto_416989 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_417089 - SURFACE
      ?auto_417090 - SURFACE
      ?auto_417091 - SURFACE
      ?auto_417093 - SURFACE
      ?auto_417092 - SURFACE
      ?auto_417094 - SURFACE
      ?auto_417095 - SURFACE
      ?auto_417096 - SURFACE
      ?auto_417097 - SURFACE
      ?auto_417098 - SURFACE
    )
    :vars
    (
      ?auto_417101 - HOIST
      ?auto_417100 - PLACE
      ?auto_417104 - PLACE
      ?auto_417103 - HOIST
      ?auto_417102 - SURFACE
      ?auto_417099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_417101 ?auto_417100 ) ( IS-CRATE ?auto_417098 ) ( not ( = ?auto_417097 ?auto_417098 ) ) ( not ( = ?auto_417096 ?auto_417097 ) ) ( not ( = ?auto_417096 ?auto_417098 ) ) ( not ( = ?auto_417104 ?auto_417100 ) ) ( HOIST-AT ?auto_417103 ?auto_417104 ) ( not ( = ?auto_417101 ?auto_417103 ) ) ( AVAILABLE ?auto_417103 ) ( SURFACE-AT ?auto_417098 ?auto_417104 ) ( ON ?auto_417098 ?auto_417102 ) ( CLEAR ?auto_417098 ) ( not ( = ?auto_417097 ?auto_417102 ) ) ( not ( = ?auto_417098 ?auto_417102 ) ) ( not ( = ?auto_417096 ?auto_417102 ) ) ( TRUCK-AT ?auto_417099 ?auto_417100 ) ( SURFACE-AT ?auto_417096 ?auto_417100 ) ( CLEAR ?auto_417096 ) ( IS-CRATE ?auto_417097 ) ( AVAILABLE ?auto_417101 ) ( IN ?auto_417097 ?auto_417099 ) ( ON ?auto_417090 ?auto_417089 ) ( ON ?auto_417091 ?auto_417090 ) ( ON ?auto_417093 ?auto_417091 ) ( ON ?auto_417092 ?auto_417093 ) ( ON ?auto_417094 ?auto_417092 ) ( ON ?auto_417095 ?auto_417094 ) ( ON ?auto_417096 ?auto_417095 ) ( not ( = ?auto_417089 ?auto_417090 ) ) ( not ( = ?auto_417089 ?auto_417091 ) ) ( not ( = ?auto_417089 ?auto_417093 ) ) ( not ( = ?auto_417089 ?auto_417092 ) ) ( not ( = ?auto_417089 ?auto_417094 ) ) ( not ( = ?auto_417089 ?auto_417095 ) ) ( not ( = ?auto_417089 ?auto_417096 ) ) ( not ( = ?auto_417089 ?auto_417097 ) ) ( not ( = ?auto_417089 ?auto_417098 ) ) ( not ( = ?auto_417089 ?auto_417102 ) ) ( not ( = ?auto_417090 ?auto_417091 ) ) ( not ( = ?auto_417090 ?auto_417093 ) ) ( not ( = ?auto_417090 ?auto_417092 ) ) ( not ( = ?auto_417090 ?auto_417094 ) ) ( not ( = ?auto_417090 ?auto_417095 ) ) ( not ( = ?auto_417090 ?auto_417096 ) ) ( not ( = ?auto_417090 ?auto_417097 ) ) ( not ( = ?auto_417090 ?auto_417098 ) ) ( not ( = ?auto_417090 ?auto_417102 ) ) ( not ( = ?auto_417091 ?auto_417093 ) ) ( not ( = ?auto_417091 ?auto_417092 ) ) ( not ( = ?auto_417091 ?auto_417094 ) ) ( not ( = ?auto_417091 ?auto_417095 ) ) ( not ( = ?auto_417091 ?auto_417096 ) ) ( not ( = ?auto_417091 ?auto_417097 ) ) ( not ( = ?auto_417091 ?auto_417098 ) ) ( not ( = ?auto_417091 ?auto_417102 ) ) ( not ( = ?auto_417093 ?auto_417092 ) ) ( not ( = ?auto_417093 ?auto_417094 ) ) ( not ( = ?auto_417093 ?auto_417095 ) ) ( not ( = ?auto_417093 ?auto_417096 ) ) ( not ( = ?auto_417093 ?auto_417097 ) ) ( not ( = ?auto_417093 ?auto_417098 ) ) ( not ( = ?auto_417093 ?auto_417102 ) ) ( not ( = ?auto_417092 ?auto_417094 ) ) ( not ( = ?auto_417092 ?auto_417095 ) ) ( not ( = ?auto_417092 ?auto_417096 ) ) ( not ( = ?auto_417092 ?auto_417097 ) ) ( not ( = ?auto_417092 ?auto_417098 ) ) ( not ( = ?auto_417092 ?auto_417102 ) ) ( not ( = ?auto_417094 ?auto_417095 ) ) ( not ( = ?auto_417094 ?auto_417096 ) ) ( not ( = ?auto_417094 ?auto_417097 ) ) ( not ( = ?auto_417094 ?auto_417098 ) ) ( not ( = ?auto_417094 ?auto_417102 ) ) ( not ( = ?auto_417095 ?auto_417096 ) ) ( not ( = ?auto_417095 ?auto_417097 ) ) ( not ( = ?auto_417095 ?auto_417098 ) ) ( not ( = ?auto_417095 ?auto_417102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_417096 ?auto_417097 ?auto_417098 )
      ( MAKE-9CRATE-VERIFY ?auto_417089 ?auto_417090 ?auto_417091 ?auto_417093 ?auto_417092 ?auto_417094 ?auto_417095 ?auto_417096 ?auto_417097 ?auto_417098 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_422620 - SURFACE
      ?auto_422621 - SURFACE
      ?auto_422622 - SURFACE
      ?auto_422624 - SURFACE
      ?auto_422623 - SURFACE
      ?auto_422625 - SURFACE
      ?auto_422626 - SURFACE
      ?auto_422627 - SURFACE
      ?auto_422628 - SURFACE
      ?auto_422629 - SURFACE
      ?auto_422630 - SURFACE
    )
    :vars
    (
      ?auto_422632 - HOIST
      ?auto_422631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_422632 ?auto_422631 ) ( SURFACE-AT ?auto_422629 ?auto_422631 ) ( CLEAR ?auto_422629 ) ( LIFTING ?auto_422632 ?auto_422630 ) ( IS-CRATE ?auto_422630 ) ( not ( = ?auto_422629 ?auto_422630 ) ) ( ON ?auto_422621 ?auto_422620 ) ( ON ?auto_422622 ?auto_422621 ) ( ON ?auto_422624 ?auto_422622 ) ( ON ?auto_422623 ?auto_422624 ) ( ON ?auto_422625 ?auto_422623 ) ( ON ?auto_422626 ?auto_422625 ) ( ON ?auto_422627 ?auto_422626 ) ( ON ?auto_422628 ?auto_422627 ) ( ON ?auto_422629 ?auto_422628 ) ( not ( = ?auto_422620 ?auto_422621 ) ) ( not ( = ?auto_422620 ?auto_422622 ) ) ( not ( = ?auto_422620 ?auto_422624 ) ) ( not ( = ?auto_422620 ?auto_422623 ) ) ( not ( = ?auto_422620 ?auto_422625 ) ) ( not ( = ?auto_422620 ?auto_422626 ) ) ( not ( = ?auto_422620 ?auto_422627 ) ) ( not ( = ?auto_422620 ?auto_422628 ) ) ( not ( = ?auto_422620 ?auto_422629 ) ) ( not ( = ?auto_422620 ?auto_422630 ) ) ( not ( = ?auto_422621 ?auto_422622 ) ) ( not ( = ?auto_422621 ?auto_422624 ) ) ( not ( = ?auto_422621 ?auto_422623 ) ) ( not ( = ?auto_422621 ?auto_422625 ) ) ( not ( = ?auto_422621 ?auto_422626 ) ) ( not ( = ?auto_422621 ?auto_422627 ) ) ( not ( = ?auto_422621 ?auto_422628 ) ) ( not ( = ?auto_422621 ?auto_422629 ) ) ( not ( = ?auto_422621 ?auto_422630 ) ) ( not ( = ?auto_422622 ?auto_422624 ) ) ( not ( = ?auto_422622 ?auto_422623 ) ) ( not ( = ?auto_422622 ?auto_422625 ) ) ( not ( = ?auto_422622 ?auto_422626 ) ) ( not ( = ?auto_422622 ?auto_422627 ) ) ( not ( = ?auto_422622 ?auto_422628 ) ) ( not ( = ?auto_422622 ?auto_422629 ) ) ( not ( = ?auto_422622 ?auto_422630 ) ) ( not ( = ?auto_422624 ?auto_422623 ) ) ( not ( = ?auto_422624 ?auto_422625 ) ) ( not ( = ?auto_422624 ?auto_422626 ) ) ( not ( = ?auto_422624 ?auto_422627 ) ) ( not ( = ?auto_422624 ?auto_422628 ) ) ( not ( = ?auto_422624 ?auto_422629 ) ) ( not ( = ?auto_422624 ?auto_422630 ) ) ( not ( = ?auto_422623 ?auto_422625 ) ) ( not ( = ?auto_422623 ?auto_422626 ) ) ( not ( = ?auto_422623 ?auto_422627 ) ) ( not ( = ?auto_422623 ?auto_422628 ) ) ( not ( = ?auto_422623 ?auto_422629 ) ) ( not ( = ?auto_422623 ?auto_422630 ) ) ( not ( = ?auto_422625 ?auto_422626 ) ) ( not ( = ?auto_422625 ?auto_422627 ) ) ( not ( = ?auto_422625 ?auto_422628 ) ) ( not ( = ?auto_422625 ?auto_422629 ) ) ( not ( = ?auto_422625 ?auto_422630 ) ) ( not ( = ?auto_422626 ?auto_422627 ) ) ( not ( = ?auto_422626 ?auto_422628 ) ) ( not ( = ?auto_422626 ?auto_422629 ) ) ( not ( = ?auto_422626 ?auto_422630 ) ) ( not ( = ?auto_422627 ?auto_422628 ) ) ( not ( = ?auto_422627 ?auto_422629 ) ) ( not ( = ?auto_422627 ?auto_422630 ) ) ( not ( = ?auto_422628 ?auto_422629 ) ) ( not ( = ?auto_422628 ?auto_422630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_422629 ?auto_422630 )
      ( MAKE-10CRATE-VERIFY ?auto_422620 ?auto_422621 ?auto_422622 ?auto_422624 ?auto_422623 ?auto_422625 ?auto_422626 ?auto_422627 ?auto_422628 ?auto_422629 ?auto_422630 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_422714 - SURFACE
      ?auto_422715 - SURFACE
      ?auto_422716 - SURFACE
      ?auto_422718 - SURFACE
      ?auto_422717 - SURFACE
      ?auto_422719 - SURFACE
      ?auto_422720 - SURFACE
      ?auto_422721 - SURFACE
      ?auto_422722 - SURFACE
      ?auto_422723 - SURFACE
      ?auto_422724 - SURFACE
    )
    :vars
    (
      ?auto_422726 - HOIST
      ?auto_422727 - PLACE
      ?auto_422725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_422726 ?auto_422727 ) ( SURFACE-AT ?auto_422723 ?auto_422727 ) ( CLEAR ?auto_422723 ) ( IS-CRATE ?auto_422724 ) ( not ( = ?auto_422723 ?auto_422724 ) ) ( TRUCK-AT ?auto_422725 ?auto_422727 ) ( AVAILABLE ?auto_422726 ) ( IN ?auto_422724 ?auto_422725 ) ( ON ?auto_422723 ?auto_422722 ) ( not ( = ?auto_422722 ?auto_422723 ) ) ( not ( = ?auto_422722 ?auto_422724 ) ) ( ON ?auto_422715 ?auto_422714 ) ( ON ?auto_422716 ?auto_422715 ) ( ON ?auto_422718 ?auto_422716 ) ( ON ?auto_422717 ?auto_422718 ) ( ON ?auto_422719 ?auto_422717 ) ( ON ?auto_422720 ?auto_422719 ) ( ON ?auto_422721 ?auto_422720 ) ( ON ?auto_422722 ?auto_422721 ) ( not ( = ?auto_422714 ?auto_422715 ) ) ( not ( = ?auto_422714 ?auto_422716 ) ) ( not ( = ?auto_422714 ?auto_422718 ) ) ( not ( = ?auto_422714 ?auto_422717 ) ) ( not ( = ?auto_422714 ?auto_422719 ) ) ( not ( = ?auto_422714 ?auto_422720 ) ) ( not ( = ?auto_422714 ?auto_422721 ) ) ( not ( = ?auto_422714 ?auto_422722 ) ) ( not ( = ?auto_422714 ?auto_422723 ) ) ( not ( = ?auto_422714 ?auto_422724 ) ) ( not ( = ?auto_422715 ?auto_422716 ) ) ( not ( = ?auto_422715 ?auto_422718 ) ) ( not ( = ?auto_422715 ?auto_422717 ) ) ( not ( = ?auto_422715 ?auto_422719 ) ) ( not ( = ?auto_422715 ?auto_422720 ) ) ( not ( = ?auto_422715 ?auto_422721 ) ) ( not ( = ?auto_422715 ?auto_422722 ) ) ( not ( = ?auto_422715 ?auto_422723 ) ) ( not ( = ?auto_422715 ?auto_422724 ) ) ( not ( = ?auto_422716 ?auto_422718 ) ) ( not ( = ?auto_422716 ?auto_422717 ) ) ( not ( = ?auto_422716 ?auto_422719 ) ) ( not ( = ?auto_422716 ?auto_422720 ) ) ( not ( = ?auto_422716 ?auto_422721 ) ) ( not ( = ?auto_422716 ?auto_422722 ) ) ( not ( = ?auto_422716 ?auto_422723 ) ) ( not ( = ?auto_422716 ?auto_422724 ) ) ( not ( = ?auto_422718 ?auto_422717 ) ) ( not ( = ?auto_422718 ?auto_422719 ) ) ( not ( = ?auto_422718 ?auto_422720 ) ) ( not ( = ?auto_422718 ?auto_422721 ) ) ( not ( = ?auto_422718 ?auto_422722 ) ) ( not ( = ?auto_422718 ?auto_422723 ) ) ( not ( = ?auto_422718 ?auto_422724 ) ) ( not ( = ?auto_422717 ?auto_422719 ) ) ( not ( = ?auto_422717 ?auto_422720 ) ) ( not ( = ?auto_422717 ?auto_422721 ) ) ( not ( = ?auto_422717 ?auto_422722 ) ) ( not ( = ?auto_422717 ?auto_422723 ) ) ( not ( = ?auto_422717 ?auto_422724 ) ) ( not ( = ?auto_422719 ?auto_422720 ) ) ( not ( = ?auto_422719 ?auto_422721 ) ) ( not ( = ?auto_422719 ?auto_422722 ) ) ( not ( = ?auto_422719 ?auto_422723 ) ) ( not ( = ?auto_422719 ?auto_422724 ) ) ( not ( = ?auto_422720 ?auto_422721 ) ) ( not ( = ?auto_422720 ?auto_422722 ) ) ( not ( = ?auto_422720 ?auto_422723 ) ) ( not ( = ?auto_422720 ?auto_422724 ) ) ( not ( = ?auto_422721 ?auto_422722 ) ) ( not ( = ?auto_422721 ?auto_422723 ) ) ( not ( = ?auto_422721 ?auto_422724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_422722 ?auto_422723 ?auto_422724 )
      ( MAKE-10CRATE-VERIFY ?auto_422714 ?auto_422715 ?auto_422716 ?auto_422718 ?auto_422717 ?auto_422719 ?auto_422720 ?auto_422721 ?auto_422722 ?auto_422723 ?auto_422724 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_422819 - SURFACE
      ?auto_422820 - SURFACE
      ?auto_422821 - SURFACE
      ?auto_422823 - SURFACE
      ?auto_422822 - SURFACE
      ?auto_422824 - SURFACE
      ?auto_422825 - SURFACE
      ?auto_422826 - SURFACE
      ?auto_422827 - SURFACE
      ?auto_422828 - SURFACE
      ?auto_422829 - SURFACE
    )
    :vars
    (
      ?auto_422833 - HOIST
      ?auto_422830 - PLACE
      ?auto_422831 - TRUCK
      ?auto_422832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_422833 ?auto_422830 ) ( SURFACE-AT ?auto_422828 ?auto_422830 ) ( CLEAR ?auto_422828 ) ( IS-CRATE ?auto_422829 ) ( not ( = ?auto_422828 ?auto_422829 ) ) ( AVAILABLE ?auto_422833 ) ( IN ?auto_422829 ?auto_422831 ) ( ON ?auto_422828 ?auto_422827 ) ( not ( = ?auto_422827 ?auto_422828 ) ) ( not ( = ?auto_422827 ?auto_422829 ) ) ( TRUCK-AT ?auto_422831 ?auto_422832 ) ( not ( = ?auto_422832 ?auto_422830 ) ) ( ON ?auto_422820 ?auto_422819 ) ( ON ?auto_422821 ?auto_422820 ) ( ON ?auto_422823 ?auto_422821 ) ( ON ?auto_422822 ?auto_422823 ) ( ON ?auto_422824 ?auto_422822 ) ( ON ?auto_422825 ?auto_422824 ) ( ON ?auto_422826 ?auto_422825 ) ( ON ?auto_422827 ?auto_422826 ) ( not ( = ?auto_422819 ?auto_422820 ) ) ( not ( = ?auto_422819 ?auto_422821 ) ) ( not ( = ?auto_422819 ?auto_422823 ) ) ( not ( = ?auto_422819 ?auto_422822 ) ) ( not ( = ?auto_422819 ?auto_422824 ) ) ( not ( = ?auto_422819 ?auto_422825 ) ) ( not ( = ?auto_422819 ?auto_422826 ) ) ( not ( = ?auto_422819 ?auto_422827 ) ) ( not ( = ?auto_422819 ?auto_422828 ) ) ( not ( = ?auto_422819 ?auto_422829 ) ) ( not ( = ?auto_422820 ?auto_422821 ) ) ( not ( = ?auto_422820 ?auto_422823 ) ) ( not ( = ?auto_422820 ?auto_422822 ) ) ( not ( = ?auto_422820 ?auto_422824 ) ) ( not ( = ?auto_422820 ?auto_422825 ) ) ( not ( = ?auto_422820 ?auto_422826 ) ) ( not ( = ?auto_422820 ?auto_422827 ) ) ( not ( = ?auto_422820 ?auto_422828 ) ) ( not ( = ?auto_422820 ?auto_422829 ) ) ( not ( = ?auto_422821 ?auto_422823 ) ) ( not ( = ?auto_422821 ?auto_422822 ) ) ( not ( = ?auto_422821 ?auto_422824 ) ) ( not ( = ?auto_422821 ?auto_422825 ) ) ( not ( = ?auto_422821 ?auto_422826 ) ) ( not ( = ?auto_422821 ?auto_422827 ) ) ( not ( = ?auto_422821 ?auto_422828 ) ) ( not ( = ?auto_422821 ?auto_422829 ) ) ( not ( = ?auto_422823 ?auto_422822 ) ) ( not ( = ?auto_422823 ?auto_422824 ) ) ( not ( = ?auto_422823 ?auto_422825 ) ) ( not ( = ?auto_422823 ?auto_422826 ) ) ( not ( = ?auto_422823 ?auto_422827 ) ) ( not ( = ?auto_422823 ?auto_422828 ) ) ( not ( = ?auto_422823 ?auto_422829 ) ) ( not ( = ?auto_422822 ?auto_422824 ) ) ( not ( = ?auto_422822 ?auto_422825 ) ) ( not ( = ?auto_422822 ?auto_422826 ) ) ( not ( = ?auto_422822 ?auto_422827 ) ) ( not ( = ?auto_422822 ?auto_422828 ) ) ( not ( = ?auto_422822 ?auto_422829 ) ) ( not ( = ?auto_422824 ?auto_422825 ) ) ( not ( = ?auto_422824 ?auto_422826 ) ) ( not ( = ?auto_422824 ?auto_422827 ) ) ( not ( = ?auto_422824 ?auto_422828 ) ) ( not ( = ?auto_422824 ?auto_422829 ) ) ( not ( = ?auto_422825 ?auto_422826 ) ) ( not ( = ?auto_422825 ?auto_422827 ) ) ( not ( = ?auto_422825 ?auto_422828 ) ) ( not ( = ?auto_422825 ?auto_422829 ) ) ( not ( = ?auto_422826 ?auto_422827 ) ) ( not ( = ?auto_422826 ?auto_422828 ) ) ( not ( = ?auto_422826 ?auto_422829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_422827 ?auto_422828 ?auto_422829 )
      ( MAKE-10CRATE-VERIFY ?auto_422819 ?auto_422820 ?auto_422821 ?auto_422823 ?auto_422822 ?auto_422824 ?auto_422825 ?auto_422826 ?auto_422827 ?auto_422828 ?auto_422829 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_422934 - SURFACE
      ?auto_422935 - SURFACE
      ?auto_422936 - SURFACE
      ?auto_422938 - SURFACE
      ?auto_422937 - SURFACE
      ?auto_422939 - SURFACE
      ?auto_422940 - SURFACE
      ?auto_422941 - SURFACE
      ?auto_422942 - SURFACE
      ?auto_422943 - SURFACE
      ?auto_422944 - SURFACE
    )
    :vars
    (
      ?auto_422946 - HOIST
      ?auto_422945 - PLACE
      ?auto_422949 - TRUCK
      ?auto_422947 - PLACE
      ?auto_422948 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_422946 ?auto_422945 ) ( SURFACE-AT ?auto_422943 ?auto_422945 ) ( CLEAR ?auto_422943 ) ( IS-CRATE ?auto_422944 ) ( not ( = ?auto_422943 ?auto_422944 ) ) ( AVAILABLE ?auto_422946 ) ( ON ?auto_422943 ?auto_422942 ) ( not ( = ?auto_422942 ?auto_422943 ) ) ( not ( = ?auto_422942 ?auto_422944 ) ) ( TRUCK-AT ?auto_422949 ?auto_422947 ) ( not ( = ?auto_422947 ?auto_422945 ) ) ( HOIST-AT ?auto_422948 ?auto_422947 ) ( LIFTING ?auto_422948 ?auto_422944 ) ( not ( = ?auto_422946 ?auto_422948 ) ) ( ON ?auto_422935 ?auto_422934 ) ( ON ?auto_422936 ?auto_422935 ) ( ON ?auto_422938 ?auto_422936 ) ( ON ?auto_422937 ?auto_422938 ) ( ON ?auto_422939 ?auto_422937 ) ( ON ?auto_422940 ?auto_422939 ) ( ON ?auto_422941 ?auto_422940 ) ( ON ?auto_422942 ?auto_422941 ) ( not ( = ?auto_422934 ?auto_422935 ) ) ( not ( = ?auto_422934 ?auto_422936 ) ) ( not ( = ?auto_422934 ?auto_422938 ) ) ( not ( = ?auto_422934 ?auto_422937 ) ) ( not ( = ?auto_422934 ?auto_422939 ) ) ( not ( = ?auto_422934 ?auto_422940 ) ) ( not ( = ?auto_422934 ?auto_422941 ) ) ( not ( = ?auto_422934 ?auto_422942 ) ) ( not ( = ?auto_422934 ?auto_422943 ) ) ( not ( = ?auto_422934 ?auto_422944 ) ) ( not ( = ?auto_422935 ?auto_422936 ) ) ( not ( = ?auto_422935 ?auto_422938 ) ) ( not ( = ?auto_422935 ?auto_422937 ) ) ( not ( = ?auto_422935 ?auto_422939 ) ) ( not ( = ?auto_422935 ?auto_422940 ) ) ( not ( = ?auto_422935 ?auto_422941 ) ) ( not ( = ?auto_422935 ?auto_422942 ) ) ( not ( = ?auto_422935 ?auto_422943 ) ) ( not ( = ?auto_422935 ?auto_422944 ) ) ( not ( = ?auto_422936 ?auto_422938 ) ) ( not ( = ?auto_422936 ?auto_422937 ) ) ( not ( = ?auto_422936 ?auto_422939 ) ) ( not ( = ?auto_422936 ?auto_422940 ) ) ( not ( = ?auto_422936 ?auto_422941 ) ) ( not ( = ?auto_422936 ?auto_422942 ) ) ( not ( = ?auto_422936 ?auto_422943 ) ) ( not ( = ?auto_422936 ?auto_422944 ) ) ( not ( = ?auto_422938 ?auto_422937 ) ) ( not ( = ?auto_422938 ?auto_422939 ) ) ( not ( = ?auto_422938 ?auto_422940 ) ) ( not ( = ?auto_422938 ?auto_422941 ) ) ( not ( = ?auto_422938 ?auto_422942 ) ) ( not ( = ?auto_422938 ?auto_422943 ) ) ( not ( = ?auto_422938 ?auto_422944 ) ) ( not ( = ?auto_422937 ?auto_422939 ) ) ( not ( = ?auto_422937 ?auto_422940 ) ) ( not ( = ?auto_422937 ?auto_422941 ) ) ( not ( = ?auto_422937 ?auto_422942 ) ) ( not ( = ?auto_422937 ?auto_422943 ) ) ( not ( = ?auto_422937 ?auto_422944 ) ) ( not ( = ?auto_422939 ?auto_422940 ) ) ( not ( = ?auto_422939 ?auto_422941 ) ) ( not ( = ?auto_422939 ?auto_422942 ) ) ( not ( = ?auto_422939 ?auto_422943 ) ) ( not ( = ?auto_422939 ?auto_422944 ) ) ( not ( = ?auto_422940 ?auto_422941 ) ) ( not ( = ?auto_422940 ?auto_422942 ) ) ( not ( = ?auto_422940 ?auto_422943 ) ) ( not ( = ?auto_422940 ?auto_422944 ) ) ( not ( = ?auto_422941 ?auto_422942 ) ) ( not ( = ?auto_422941 ?auto_422943 ) ) ( not ( = ?auto_422941 ?auto_422944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_422942 ?auto_422943 ?auto_422944 )
      ( MAKE-10CRATE-VERIFY ?auto_422934 ?auto_422935 ?auto_422936 ?auto_422938 ?auto_422937 ?auto_422939 ?auto_422940 ?auto_422941 ?auto_422942 ?auto_422943 ?auto_422944 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423059 - SURFACE
      ?auto_423060 - SURFACE
      ?auto_423061 - SURFACE
      ?auto_423063 - SURFACE
      ?auto_423062 - SURFACE
      ?auto_423064 - SURFACE
      ?auto_423065 - SURFACE
      ?auto_423066 - SURFACE
      ?auto_423067 - SURFACE
      ?auto_423068 - SURFACE
      ?auto_423069 - SURFACE
    )
    :vars
    (
      ?auto_423073 - HOIST
      ?auto_423075 - PLACE
      ?auto_423072 - TRUCK
      ?auto_423071 - PLACE
      ?auto_423074 - HOIST
      ?auto_423070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_423073 ?auto_423075 ) ( SURFACE-AT ?auto_423068 ?auto_423075 ) ( CLEAR ?auto_423068 ) ( IS-CRATE ?auto_423069 ) ( not ( = ?auto_423068 ?auto_423069 ) ) ( AVAILABLE ?auto_423073 ) ( ON ?auto_423068 ?auto_423067 ) ( not ( = ?auto_423067 ?auto_423068 ) ) ( not ( = ?auto_423067 ?auto_423069 ) ) ( TRUCK-AT ?auto_423072 ?auto_423071 ) ( not ( = ?auto_423071 ?auto_423075 ) ) ( HOIST-AT ?auto_423074 ?auto_423071 ) ( not ( = ?auto_423073 ?auto_423074 ) ) ( AVAILABLE ?auto_423074 ) ( SURFACE-AT ?auto_423069 ?auto_423071 ) ( ON ?auto_423069 ?auto_423070 ) ( CLEAR ?auto_423069 ) ( not ( = ?auto_423068 ?auto_423070 ) ) ( not ( = ?auto_423069 ?auto_423070 ) ) ( not ( = ?auto_423067 ?auto_423070 ) ) ( ON ?auto_423060 ?auto_423059 ) ( ON ?auto_423061 ?auto_423060 ) ( ON ?auto_423063 ?auto_423061 ) ( ON ?auto_423062 ?auto_423063 ) ( ON ?auto_423064 ?auto_423062 ) ( ON ?auto_423065 ?auto_423064 ) ( ON ?auto_423066 ?auto_423065 ) ( ON ?auto_423067 ?auto_423066 ) ( not ( = ?auto_423059 ?auto_423060 ) ) ( not ( = ?auto_423059 ?auto_423061 ) ) ( not ( = ?auto_423059 ?auto_423063 ) ) ( not ( = ?auto_423059 ?auto_423062 ) ) ( not ( = ?auto_423059 ?auto_423064 ) ) ( not ( = ?auto_423059 ?auto_423065 ) ) ( not ( = ?auto_423059 ?auto_423066 ) ) ( not ( = ?auto_423059 ?auto_423067 ) ) ( not ( = ?auto_423059 ?auto_423068 ) ) ( not ( = ?auto_423059 ?auto_423069 ) ) ( not ( = ?auto_423059 ?auto_423070 ) ) ( not ( = ?auto_423060 ?auto_423061 ) ) ( not ( = ?auto_423060 ?auto_423063 ) ) ( not ( = ?auto_423060 ?auto_423062 ) ) ( not ( = ?auto_423060 ?auto_423064 ) ) ( not ( = ?auto_423060 ?auto_423065 ) ) ( not ( = ?auto_423060 ?auto_423066 ) ) ( not ( = ?auto_423060 ?auto_423067 ) ) ( not ( = ?auto_423060 ?auto_423068 ) ) ( not ( = ?auto_423060 ?auto_423069 ) ) ( not ( = ?auto_423060 ?auto_423070 ) ) ( not ( = ?auto_423061 ?auto_423063 ) ) ( not ( = ?auto_423061 ?auto_423062 ) ) ( not ( = ?auto_423061 ?auto_423064 ) ) ( not ( = ?auto_423061 ?auto_423065 ) ) ( not ( = ?auto_423061 ?auto_423066 ) ) ( not ( = ?auto_423061 ?auto_423067 ) ) ( not ( = ?auto_423061 ?auto_423068 ) ) ( not ( = ?auto_423061 ?auto_423069 ) ) ( not ( = ?auto_423061 ?auto_423070 ) ) ( not ( = ?auto_423063 ?auto_423062 ) ) ( not ( = ?auto_423063 ?auto_423064 ) ) ( not ( = ?auto_423063 ?auto_423065 ) ) ( not ( = ?auto_423063 ?auto_423066 ) ) ( not ( = ?auto_423063 ?auto_423067 ) ) ( not ( = ?auto_423063 ?auto_423068 ) ) ( not ( = ?auto_423063 ?auto_423069 ) ) ( not ( = ?auto_423063 ?auto_423070 ) ) ( not ( = ?auto_423062 ?auto_423064 ) ) ( not ( = ?auto_423062 ?auto_423065 ) ) ( not ( = ?auto_423062 ?auto_423066 ) ) ( not ( = ?auto_423062 ?auto_423067 ) ) ( not ( = ?auto_423062 ?auto_423068 ) ) ( not ( = ?auto_423062 ?auto_423069 ) ) ( not ( = ?auto_423062 ?auto_423070 ) ) ( not ( = ?auto_423064 ?auto_423065 ) ) ( not ( = ?auto_423064 ?auto_423066 ) ) ( not ( = ?auto_423064 ?auto_423067 ) ) ( not ( = ?auto_423064 ?auto_423068 ) ) ( not ( = ?auto_423064 ?auto_423069 ) ) ( not ( = ?auto_423064 ?auto_423070 ) ) ( not ( = ?auto_423065 ?auto_423066 ) ) ( not ( = ?auto_423065 ?auto_423067 ) ) ( not ( = ?auto_423065 ?auto_423068 ) ) ( not ( = ?auto_423065 ?auto_423069 ) ) ( not ( = ?auto_423065 ?auto_423070 ) ) ( not ( = ?auto_423066 ?auto_423067 ) ) ( not ( = ?auto_423066 ?auto_423068 ) ) ( not ( = ?auto_423066 ?auto_423069 ) ) ( not ( = ?auto_423066 ?auto_423070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423067 ?auto_423068 ?auto_423069 )
      ( MAKE-10CRATE-VERIFY ?auto_423059 ?auto_423060 ?auto_423061 ?auto_423063 ?auto_423062 ?auto_423064 ?auto_423065 ?auto_423066 ?auto_423067 ?auto_423068 ?auto_423069 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423185 - SURFACE
      ?auto_423186 - SURFACE
      ?auto_423187 - SURFACE
      ?auto_423189 - SURFACE
      ?auto_423188 - SURFACE
      ?auto_423190 - SURFACE
      ?auto_423191 - SURFACE
      ?auto_423192 - SURFACE
      ?auto_423193 - SURFACE
      ?auto_423194 - SURFACE
      ?auto_423195 - SURFACE
    )
    :vars
    (
      ?auto_423196 - HOIST
      ?auto_423197 - PLACE
      ?auto_423199 - PLACE
      ?auto_423201 - HOIST
      ?auto_423198 - SURFACE
      ?auto_423200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423196 ?auto_423197 ) ( SURFACE-AT ?auto_423194 ?auto_423197 ) ( CLEAR ?auto_423194 ) ( IS-CRATE ?auto_423195 ) ( not ( = ?auto_423194 ?auto_423195 ) ) ( AVAILABLE ?auto_423196 ) ( ON ?auto_423194 ?auto_423193 ) ( not ( = ?auto_423193 ?auto_423194 ) ) ( not ( = ?auto_423193 ?auto_423195 ) ) ( not ( = ?auto_423199 ?auto_423197 ) ) ( HOIST-AT ?auto_423201 ?auto_423199 ) ( not ( = ?auto_423196 ?auto_423201 ) ) ( AVAILABLE ?auto_423201 ) ( SURFACE-AT ?auto_423195 ?auto_423199 ) ( ON ?auto_423195 ?auto_423198 ) ( CLEAR ?auto_423195 ) ( not ( = ?auto_423194 ?auto_423198 ) ) ( not ( = ?auto_423195 ?auto_423198 ) ) ( not ( = ?auto_423193 ?auto_423198 ) ) ( TRUCK-AT ?auto_423200 ?auto_423197 ) ( ON ?auto_423186 ?auto_423185 ) ( ON ?auto_423187 ?auto_423186 ) ( ON ?auto_423189 ?auto_423187 ) ( ON ?auto_423188 ?auto_423189 ) ( ON ?auto_423190 ?auto_423188 ) ( ON ?auto_423191 ?auto_423190 ) ( ON ?auto_423192 ?auto_423191 ) ( ON ?auto_423193 ?auto_423192 ) ( not ( = ?auto_423185 ?auto_423186 ) ) ( not ( = ?auto_423185 ?auto_423187 ) ) ( not ( = ?auto_423185 ?auto_423189 ) ) ( not ( = ?auto_423185 ?auto_423188 ) ) ( not ( = ?auto_423185 ?auto_423190 ) ) ( not ( = ?auto_423185 ?auto_423191 ) ) ( not ( = ?auto_423185 ?auto_423192 ) ) ( not ( = ?auto_423185 ?auto_423193 ) ) ( not ( = ?auto_423185 ?auto_423194 ) ) ( not ( = ?auto_423185 ?auto_423195 ) ) ( not ( = ?auto_423185 ?auto_423198 ) ) ( not ( = ?auto_423186 ?auto_423187 ) ) ( not ( = ?auto_423186 ?auto_423189 ) ) ( not ( = ?auto_423186 ?auto_423188 ) ) ( not ( = ?auto_423186 ?auto_423190 ) ) ( not ( = ?auto_423186 ?auto_423191 ) ) ( not ( = ?auto_423186 ?auto_423192 ) ) ( not ( = ?auto_423186 ?auto_423193 ) ) ( not ( = ?auto_423186 ?auto_423194 ) ) ( not ( = ?auto_423186 ?auto_423195 ) ) ( not ( = ?auto_423186 ?auto_423198 ) ) ( not ( = ?auto_423187 ?auto_423189 ) ) ( not ( = ?auto_423187 ?auto_423188 ) ) ( not ( = ?auto_423187 ?auto_423190 ) ) ( not ( = ?auto_423187 ?auto_423191 ) ) ( not ( = ?auto_423187 ?auto_423192 ) ) ( not ( = ?auto_423187 ?auto_423193 ) ) ( not ( = ?auto_423187 ?auto_423194 ) ) ( not ( = ?auto_423187 ?auto_423195 ) ) ( not ( = ?auto_423187 ?auto_423198 ) ) ( not ( = ?auto_423189 ?auto_423188 ) ) ( not ( = ?auto_423189 ?auto_423190 ) ) ( not ( = ?auto_423189 ?auto_423191 ) ) ( not ( = ?auto_423189 ?auto_423192 ) ) ( not ( = ?auto_423189 ?auto_423193 ) ) ( not ( = ?auto_423189 ?auto_423194 ) ) ( not ( = ?auto_423189 ?auto_423195 ) ) ( not ( = ?auto_423189 ?auto_423198 ) ) ( not ( = ?auto_423188 ?auto_423190 ) ) ( not ( = ?auto_423188 ?auto_423191 ) ) ( not ( = ?auto_423188 ?auto_423192 ) ) ( not ( = ?auto_423188 ?auto_423193 ) ) ( not ( = ?auto_423188 ?auto_423194 ) ) ( not ( = ?auto_423188 ?auto_423195 ) ) ( not ( = ?auto_423188 ?auto_423198 ) ) ( not ( = ?auto_423190 ?auto_423191 ) ) ( not ( = ?auto_423190 ?auto_423192 ) ) ( not ( = ?auto_423190 ?auto_423193 ) ) ( not ( = ?auto_423190 ?auto_423194 ) ) ( not ( = ?auto_423190 ?auto_423195 ) ) ( not ( = ?auto_423190 ?auto_423198 ) ) ( not ( = ?auto_423191 ?auto_423192 ) ) ( not ( = ?auto_423191 ?auto_423193 ) ) ( not ( = ?auto_423191 ?auto_423194 ) ) ( not ( = ?auto_423191 ?auto_423195 ) ) ( not ( = ?auto_423191 ?auto_423198 ) ) ( not ( = ?auto_423192 ?auto_423193 ) ) ( not ( = ?auto_423192 ?auto_423194 ) ) ( not ( = ?auto_423192 ?auto_423195 ) ) ( not ( = ?auto_423192 ?auto_423198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423193 ?auto_423194 ?auto_423195 )
      ( MAKE-10CRATE-VERIFY ?auto_423185 ?auto_423186 ?auto_423187 ?auto_423189 ?auto_423188 ?auto_423190 ?auto_423191 ?auto_423192 ?auto_423193 ?auto_423194 ?auto_423195 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423311 - SURFACE
      ?auto_423312 - SURFACE
      ?auto_423313 - SURFACE
      ?auto_423315 - SURFACE
      ?auto_423314 - SURFACE
      ?auto_423316 - SURFACE
      ?auto_423317 - SURFACE
      ?auto_423318 - SURFACE
      ?auto_423319 - SURFACE
      ?auto_423320 - SURFACE
      ?auto_423321 - SURFACE
    )
    :vars
    (
      ?auto_423325 - HOIST
      ?auto_423322 - PLACE
      ?auto_423326 - PLACE
      ?auto_423327 - HOIST
      ?auto_423323 - SURFACE
      ?auto_423324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423325 ?auto_423322 ) ( IS-CRATE ?auto_423321 ) ( not ( = ?auto_423320 ?auto_423321 ) ) ( not ( = ?auto_423319 ?auto_423320 ) ) ( not ( = ?auto_423319 ?auto_423321 ) ) ( not ( = ?auto_423326 ?auto_423322 ) ) ( HOIST-AT ?auto_423327 ?auto_423326 ) ( not ( = ?auto_423325 ?auto_423327 ) ) ( AVAILABLE ?auto_423327 ) ( SURFACE-AT ?auto_423321 ?auto_423326 ) ( ON ?auto_423321 ?auto_423323 ) ( CLEAR ?auto_423321 ) ( not ( = ?auto_423320 ?auto_423323 ) ) ( not ( = ?auto_423321 ?auto_423323 ) ) ( not ( = ?auto_423319 ?auto_423323 ) ) ( TRUCK-AT ?auto_423324 ?auto_423322 ) ( SURFACE-AT ?auto_423319 ?auto_423322 ) ( CLEAR ?auto_423319 ) ( LIFTING ?auto_423325 ?auto_423320 ) ( IS-CRATE ?auto_423320 ) ( ON ?auto_423312 ?auto_423311 ) ( ON ?auto_423313 ?auto_423312 ) ( ON ?auto_423315 ?auto_423313 ) ( ON ?auto_423314 ?auto_423315 ) ( ON ?auto_423316 ?auto_423314 ) ( ON ?auto_423317 ?auto_423316 ) ( ON ?auto_423318 ?auto_423317 ) ( ON ?auto_423319 ?auto_423318 ) ( not ( = ?auto_423311 ?auto_423312 ) ) ( not ( = ?auto_423311 ?auto_423313 ) ) ( not ( = ?auto_423311 ?auto_423315 ) ) ( not ( = ?auto_423311 ?auto_423314 ) ) ( not ( = ?auto_423311 ?auto_423316 ) ) ( not ( = ?auto_423311 ?auto_423317 ) ) ( not ( = ?auto_423311 ?auto_423318 ) ) ( not ( = ?auto_423311 ?auto_423319 ) ) ( not ( = ?auto_423311 ?auto_423320 ) ) ( not ( = ?auto_423311 ?auto_423321 ) ) ( not ( = ?auto_423311 ?auto_423323 ) ) ( not ( = ?auto_423312 ?auto_423313 ) ) ( not ( = ?auto_423312 ?auto_423315 ) ) ( not ( = ?auto_423312 ?auto_423314 ) ) ( not ( = ?auto_423312 ?auto_423316 ) ) ( not ( = ?auto_423312 ?auto_423317 ) ) ( not ( = ?auto_423312 ?auto_423318 ) ) ( not ( = ?auto_423312 ?auto_423319 ) ) ( not ( = ?auto_423312 ?auto_423320 ) ) ( not ( = ?auto_423312 ?auto_423321 ) ) ( not ( = ?auto_423312 ?auto_423323 ) ) ( not ( = ?auto_423313 ?auto_423315 ) ) ( not ( = ?auto_423313 ?auto_423314 ) ) ( not ( = ?auto_423313 ?auto_423316 ) ) ( not ( = ?auto_423313 ?auto_423317 ) ) ( not ( = ?auto_423313 ?auto_423318 ) ) ( not ( = ?auto_423313 ?auto_423319 ) ) ( not ( = ?auto_423313 ?auto_423320 ) ) ( not ( = ?auto_423313 ?auto_423321 ) ) ( not ( = ?auto_423313 ?auto_423323 ) ) ( not ( = ?auto_423315 ?auto_423314 ) ) ( not ( = ?auto_423315 ?auto_423316 ) ) ( not ( = ?auto_423315 ?auto_423317 ) ) ( not ( = ?auto_423315 ?auto_423318 ) ) ( not ( = ?auto_423315 ?auto_423319 ) ) ( not ( = ?auto_423315 ?auto_423320 ) ) ( not ( = ?auto_423315 ?auto_423321 ) ) ( not ( = ?auto_423315 ?auto_423323 ) ) ( not ( = ?auto_423314 ?auto_423316 ) ) ( not ( = ?auto_423314 ?auto_423317 ) ) ( not ( = ?auto_423314 ?auto_423318 ) ) ( not ( = ?auto_423314 ?auto_423319 ) ) ( not ( = ?auto_423314 ?auto_423320 ) ) ( not ( = ?auto_423314 ?auto_423321 ) ) ( not ( = ?auto_423314 ?auto_423323 ) ) ( not ( = ?auto_423316 ?auto_423317 ) ) ( not ( = ?auto_423316 ?auto_423318 ) ) ( not ( = ?auto_423316 ?auto_423319 ) ) ( not ( = ?auto_423316 ?auto_423320 ) ) ( not ( = ?auto_423316 ?auto_423321 ) ) ( not ( = ?auto_423316 ?auto_423323 ) ) ( not ( = ?auto_423317 ?auto_423318 ) ) ( not ( = ?auto_423317 ?auto_423319 ) ) ( not ( = ?auto_423317 ?auto_423320 ) ) ( not ( = ?auto_423317 ?auto_423321 ) ) ( not ( = ?auto_423317 ?auto_423323 ) ) ( not ( = ?auto_423318 ?auto_423319 ) ) ( not ( = ?auto_423318 ?auto_423320 ) ) ( not ( = ?auto_423318 ?auto_423321 ) ) ( not ( = ?auto_423318 ?auto_423323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423319 ?auto_423320 ?auto_423321 )
      ( MAKE-10CRATE-VERIFY ?auto_423311 ?auto_423312 ?auto_423313 ?auto_423315 ?auto_423314 ?auto_423316 ?auto_423317 ?auto_423318 ?auto_423319 ?auto_423320 ?auto_423321 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_423437 - SURFACE
      ?auto_423438 - SURFACE
      ?auto_423439 - SURFACE
      ?auto_423441 - SURFACE
      ?auto_423440 - SURFACE
      ?auto_423442 - SURFACE
      ?auto_423443 - SURFACE
      ?auto_423444 - SURFACE
      ?auto_423445 - SURFACE
      ?auto_423446 - SURFACE
      ?auto_423447 - SURFACE
    )
    :vars
    (
      ?auto_423453 - HOIST
      ?auto_423449 - PLACE
      ?auto_423448 - PLACE
      ?auto_423450 - HOIST
      ?auto_423452 - SURFACE
      ?auto_423451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_423453 ?auto_423449 ) ( IS-CRATE ?auto_423447 ) ( not ( = ?auto_423446 ?auto_423447 ) ) ( not ( = ?auto_423445 ?auto_423446 ) ) ( not ( = ?auto_423445 ?auto_423447 ) ) ( not ( = ?auto_423448 ?auto_423449 ) ) ( HOIST-AT ?auto_423450 ?auto_423448 ) ( not ( = ?auto_423453 ?auto_423450 ) ) ( AVAILABLE ?auto_423450 ) ( SURFACE-AT ?auto_423447 ?auto_423448 ) ( ON ?auto_423447 ?auto_423452 ) ( CLEAR ?auto_423447 ) ( not ( = ?auto_423446 ?auto_423452 ) ) ( not ( = ?auto_423447 ?auto_423452 ) ) ( not ( = ?auto_423445 ?auto_423452 ) ) ( TRUCK-AT ?auto_423451 ?auto_423449 ) ( SURFACE-AT ?auto_423445 ?auto_423449 ) ( CLEAR ?auto_423445 ) ( IS-CRATE ?auto_423446 ) ( AVAILABLE ?auto_423453 ) ( IN ?auto_423446 ?auto_423451 ) ( ON ?auto_423438 ?auto_423437 ) ( ON ?auto_423439 ?auto_423438 ) ( ON ?auto_423441 ?auto_423439 ) ( ON ?auto_423440 ?auto_423441 ) ( ON ?auto_423442 ?auto_423440 ) ( ON ?auto_423443 ?auto_423442 ) ( ON ?auto_423444 ?auto_423443 ) ( ON ?auto_423445 ?auto_423444 ) ( not ( = ?auto_423437 ?auto_423438 ) ) ( not ( = ?auto_423437 ?auto_423439 ) ) ( not ( = ?auto_423437 ?auto_423441 ) ) ( not ( = ?auto_423437 ?auto_423440 ) ) ( not ( = ?auto_423437 ?auto_423442 ) ) ( not ( = ?auto_423437 ?auto_423443 ) ) ( not ( = ?auto_423437 ?auto_423444 ) ) ( not ( = ?auto_423437 ?auto_423445 ) ) ( not ( = ?auto_423437 ?auto_423446 ) ) ( not ( = ?auto_423437 ?auto_423447 ) ) ( not ( = ?auto_423437 ?auto_423452 ) ) ( not ( = ?auto_423438 ?auto_423439 ) ) ( not ( = ?auto_423438 ?auto_423441 ) ) ( not ( = ?auto_423438 ?auto_423440 ) ) ( not ( = ?auto_423438 ?auto_423442 ) ) ( not ( = ?auto_423438 ?auto_423443 ) ) ( not ( = ?auto_423438 ?auto_423444 ) ) ( not ( = ?auto_423438 ?auto_423445 ) ) ( not ( = ?auto_423438 ?auto_423446 ) ) ( not ( = ?auto_423438 ?auto_423447 ) ) ( not ( = ?auto_423438 ?auto_423452 ) ) ( not ( = ?auto_423439 ?auto_423441 ) ) ( not ( = ?auto_423439 ?auto_423440 ) ) ( not ( = ?auto_423439 ?auto_423442 ) ) ( not ( = ?auto_423439 ?auto_423443 ) ) ( not ( = ?auto_423439 ?auto_423444 ) ) ( not ( = ?auto_423439 ?auto_423445 ) ) ( not ( = ?auto_423439 ?auto_423446 ) ) ( not ( = ?auto_423439 ?auto_423447 ) ) ( not ( = ?auto_423439 ?auto_423452 ) ) ( not ( = ?auto_423441 ?auto_423440 ) ) ( not ( = ?auto_423441 ?auto_423442 ) ) ( not ( = ?auto_423441 ?auto_423443 ) ) ( not ( = ?auto_423441 ?auto_423444 ) ) ( not ( = ?auto_423441 ?auto_423445 ) ) ( not ( = ?auto_423441 ?auto_423446 ) ) ( not ( = ?auto_423441 ?auto_423447 ) ) ( not ( = ?auto_423441 ?auto_423452 ) ) ( not ( = ?auto_423440 ?auto_423442 ) ) ( not ( = ?auto_423440 ?auto_423443 ) ) ( not ( = ?auto_423440 ?auto_423444 ) ) ( not ( = ?auto_423440 ?auto_423445 ) ) ( not ( = ?auto_423440 ?auto_423446 ) ) ( not ( = ?auto_423440 ?auto_423447 ) ) ( not ( = ?auto_423440 ?auto_423452 ) ) ( not ( = ?auto_423442 ?auto_423443 ) ) ( not ( = ?auto_423442 ?auto_423444 ) ) ( not ( = ?auto_423442 ?auto_423445 ) ) ( not ( = ?auto_423442 ?auto_423446 ) ) ( not ( = ?auto_423442 ?auto_423447 ) ) ( not ( = ?auto_423442 ?auto_423452 ) ) ( not ( = ?auto_423443 ?auto_423444 ) ) ( not ( = ?auto_423443 ?auto_423445 ) ) ( not ( = ?auto_423443 ?auto_423446 ) ) ( not ( = ?auto_423443 ?auto_423447 ) ) ( not ( = ?auto_423443 ?auto_423452 ) ) ( not ( = ?auto_423444 ?auto_423445 ) ) ( not ( = ?auto_423444 ?auto_423446 ) ) ( not ( = ?auto_423444 ?auto_423447 ) ) ( not ( = ?auto_423444 ?auto_423452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_423445 ?auto_423446 ?auto_423447 )
      ( MAKE-10CRATE-VERIFY ?auto_423437 ?auto_423438 ?auto_423439 ?auto_423441 ?auto_423440 ?auto_423442 ?auto_423443 ?auto_423444 ?auto_423445 ?auto_423446 ?auto_423447 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_430679 - SURFACE
      ?auto_430680 - SURFACE
      ?auto_430681 - SURFACE
      ?auto_430683 - SURFACE
      ?auto_430682 - SURFACE
      ?auto_430684 - SURFACE
      ?auto_430685 - SURFACE
      ?auto_430686 - SURFACE
      ?auto_430687 - SURFACE
      ?auto_430688 - SURFACE
      ?auto_430689 - SURFACE
      ?auto_430690 - SURFACE
    )
    :vars
    (
      ?auto_430692 - HOIST
      ?auto_430691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_430692 ?auto_430691 ) ( SURFACE-AT ?auto_430689 ?auto_430691 ) ( CLEAR ?auto_430689 ) ( LIFTING ?auto_430692 ?auto_430690 ) ( IS-CRATE ?auto_430690 ) ( not ( = ?auto_430689 ?auto_430690 ) ) ( ON ?auto_430680 ?auto_430679 ) ( ON ?auto_430681 ?auto_430680 ) ( ON ?auto_430683 ?auto_430681 ) ( ON ?auto_430682 ?auto_430683 ) ( ON ?auto_430684 ?auto_430682 ) ( ON ?auto_430685 ?auto_430684 ) ( ON ?auto_430686 ?auto_430685 ) ( ON ?auto_430687 ?auto_430686 ) ( ON ?auto_430688 ?auto_430687 ) ( ON ?auto_430689 ?auto_430688 ) ( not ( = ?auto_430679 ?auto_430680 ) ) ( not ( = ?auto_430679 ?auto_430681 ) ) ( not ( = ?auto_430679 ?auto_430683 ) ) ( not ( = ?auto_430679 ?auto_430682 ) ) ( not ( = ?auto_430679 ?auto_430684 ) ) ( not ( = ?auto_430679 ?auto_430685 ) ) ( not ( = ?auto_430679 ?auto_430686 ) ) ( not ( = ?auto_430679 ?auto_430687 ) ) ( not ( = ?auto_430679 ?auto_430688 ) ) ( not ( = ?auto_430679 ?auto_430689 ) ) ( not ( = ?auto_430679 ?auto_430690 ) ) ( not ( = ?auto_430680 ?auto_430681 ) ) ( not ( = ?auto_430680 ?auto_430683 ) ) ( not ( = ?auto_430680 ?auto_430682 ) ) ( not ( = ?auto_430680 ?auto_430684 ) ) ( not ( = ?auto_430680 ?auto_430685 ) ) ( not ( = ?auto_430680 ?auto_430686 ) ) ( not ( = ?auto_430680 ?auto_430687 ) ) ( not ( = ?auto_430680 ?auto_430688 ) ) ( not ( = ?auto_430680 ?auto_430689 ) ) ( not ( = ?auto_430680 ?auto_430690 ) ) ( not ( = ?auto_430681 ?auto_430683 ) ) ( not ( = ?auto_430681 ?auto_430682 ) ) ( not ( = ?auto_430681 ?auto_430684 ) ) ( not ( = ?auto_430681 ?auto_430685 ) ) ( not ( = ?auto_430681 ?auto_430686 ) ) ( not ( = ?auto_430681 ?auto_430687 ) ) ( not ( = ?auto_430681 ?auto_430688 ) ) ( not ( = ?auto_430681 ?auto_430689 ) ) ( not ( = ?auto_430681 ?auto_430690 ) ) ( not ( = ?auto_430683 ?auto_430682 ) ) ( not ( = ?auto_430683 ?auto_430684 ) ) ( not ( = ?auto_430683 ?auto_430685 ) ) ( not ( = ?auto_430683 ?auto_430686 ) ) ( not ( = ?auto_430683 ?auto_430687 ) ) ( not ( = ?auto_430683 ?auto_430688 ) ) ( not ( = ?auto_430683 ?auto_430689 ) ) ( not ( = ?auto_430683 ?auto_430690 ) ) ( not ( = ?auto_430682 ?auto_430684 ) ) ( not ( = ?auto_430682 ?auto_430685 ) ) ( not ( = ?auto_430682 ?auto_430686 ) ) ( not ( = ?auto_430682 ?auto_430687 ) ) ( not ( = ?auto_430682 ?auto_430688 ) ) ( not ( = ?auto_430682 ?auto_430689 ) ) ( not ( = ?auto_430682 ?auto_430690 ) ) ( not ( = ?auto_430684 ?auto_430685 ) ) ( not ( = ?auto_430684 ?auto_430686 ) ) ( not ( = ?auto_430684 ?auto_430687 ) ) ( not ( = ?auto_430684 ?auto_430688 ) ) ( not ( = ?auto_430684 ?auto_430689 ) ) ( not ( = ?auto_430684 ?auto_430690 ) ) ( not ( = ?auto_430685 ?auto_430686 ) ) ( not ( = ?auto_430685 ?auto_430687 ) ) ( not ( = ?auto_430685 ?auto_430688 ) ) ( not ( = ?auto_430685 ?auto_430689 ) ) ( not ( = ?auto_430685 ?auto_430690 ) ) ( not ( = ?auto_430686 ?auto_430687 ) ) ( not ( = ?auto_430686 ?auto_430688 ) ) ( not ( = ?auto_430686 ?auto_430689 ) ) ( not ( = ?auto_430686 ?auto_430690 ) ) ( not ( = ?auto_430687 ?auto_430688 ) ) ( not ( = ?auto_430687 ?auto_430689 ) ) ( not ( = ?auto_430687 ?auto_430690 ) ) ( not ( = ?auto_430688 ?auto_430689 ) ) ( not ( = ?auto_430688 ?auto_430690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_430689 ?auto_430690 )
      ( MAKE-11CRATE-VERIFY ?auto_430679 ?auto_430680 ?auto_430681 ?auto_430683 ?auto_430682 ?auto_430684 ?auto_430685 ?auto_430686 ?auto_430687 ?auto_430688 ?auto_430689 ?auto_430690 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_430788 - SURFACE
      ?auto_430789 - SURFACE
      ?auto_430790 - SURFACE
      ?auto_430792 - SURFACE
      ?auto_430791 - SURFACE
      ?auto_430793 - SURFACE
      ?auto_430794 - SURFACE
      ?auto_430795 - SURFACE
      ?auto_430796 - SURFACE
      ?auto_430797 - SURFACE
      ?auto_430798 - SURFACE
      ?auto_430799 - SURFACE
    )
    :vars
    (
      ?auto_430802 - HOIST
      ?auto_430801 - PLACE
      ?auto_430800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_430802 ?auto_430801 ) ( SURFACE-AT ?auto_430798 ?auto_430801 ) ( CLEAR ?auto_430798 ) ( IS-CRATE ?auto_430799 ) ( not ( = ?auto_430798 ?auto_430799 ) ) ( TRUCK-AT ?auto_430800 ?auto_430801 ) ( AVAILABLE ?auto_430802 ) ( IN ?auto_430799 ?auto_430800 ) ( ON ?auto_430798 ?auto_430797 ) ( not ( = ?auto_430797 ?auto_430798 ) ) ( not ( = ?auto_430797 ?auto_430799 ) ) ( ON ?auto_430789 ?auto_430788 ) ( ON ?auto_430790 ?auto_430789 ) ( ON ?auto_430792 ?auto_430790 ) ( ON ?auto_430791 ?auto_430792 ) ( ON ?auto_430793 ?auto_430791 ) ( ON ?auto_430794 ?auto_430793 ) ( ON ?auto_430795 ?auto_430794 ) ( ON ?auto_430796 ?auto_430795 ) ( ON ?auto_430797 ?auto_430796 ) ( not ( = ?auto_430788 ?auto_430789 ) ) ( not ( = ?auto_430788 ?auto_430790 ) ) ( not ( = ?auto_430788 ?auto_430792 ) ) ( not ( = ?auto_430788 ?auto_430791 ) ) ( not ( = ?auto_430788 ?auto_430793 ) ) ( not ( = ?auto_430788 ?auto_430794 ) ) ( not ( = ?auto_430788 ?auto_430795 ) ) ( not ( = ?auto_430788 ?auto_430796 ) ) ( not ( = ?auto_430788 ?auto_430797 ) ) ( not ( = ?auto_430788 ?auto_430798 ) ) ( not ( = ?auto_430788 ?auto_430799 ) ) ( not ( = ?auto_430789 ?auto_430790 ) ) ( not ( = ?auto_430789 ?auto_430792 ) ) ( not ( = ?auto_430789 ?auto_430791 ) ) ( not ( = ?auto_430789 ?auto_430793 ) ) ( not ( = ?auto_430789 ?auto_430794 ) ) ( not ( = ?auto_430789 ?auto_430795 ) ) ( not ( = ?auto_430789 ?auto_430796 ) ) ( not ( = ?auto_430789 ?auto_430797 ) ) ( not ( = ?auto_430789 ?auto_430798 ) ) ( not ( = ?auto_430789 ?auto_430799 ) ) ( not ( = ?auto_430790 ?auto_430792 ) ) ( not ( = ?auto_430790 ?auto_430791 ) ) ( not ( = ?auto_430790 ?auto_430793 ) ) ( not ( = ?auto_430790 ?auto_430794 ) ) ( not ( = ?auto_430790 ?auto_430795 ) ) ( not ( = ?auto_430790 ?auto_430796 ) ) ( not ( = ?auto_430790 ?auto_430797 ) ) ( not ( = ?auto_430790 ?auto_430798 ) ) ( not ( = ?auto_430790 ?auto_430799 ) ) ( not ( = ?auto_430792 ?auto_430791 ) ) ( not ( = ?auto_430792 ?auto_430793 ) ) ( not ( = ?auto_430792 ?auto_430794 ) ) ( not ( = ?auto_430792 ?auto_430795 ) ) ( not ( = ?auto_430792 ?auto_430796 ) ) ( not ( = ?auto_430792 ?auto_430797 ) ) ( not ( = ?auto_430792 ?auto_430798 ) ) ( not ( = ?auto_430792 ?auto_430799 ) ) ( not ( = ?auto_430791 ?auto_430793 ) ) ( not ( = ?auto_430791 ?auto_430794 ) ) ( not ( = ?auto_430791 ?auto_430795 ) ) ( not ( = ?auto_430791 ?auto_430796 ) ) ( not ( = ?auto_430791 ?auto_430797 ) ) ( not ( = ?auto_430791 ?auto_430798 ) ) ( not ( = ?auto_430791 ?auto_430799 ) ) ( not ( = ?auto_430793 ?auto_430794 ) ) ( not ( = ?auto_430793 ?auto_430795 ) ) ( not ( = ?auto_430793 ?auto_430796 ) ) ( not ( = ?auto_430793 ?auto_430797 ) ) ( not ( = ?auto_430793 ?auto_430798 ) ) ( not ( = ?auto_430793 ?auto_430799 ) ) ( not ( = ?auto_430794 ?auto_430795 ) ) ( not ( = ?auto_430794 ?auto_430796 ) ) ( not ( = ?auto_430794 ?auto_430797 ) ) ( not ( = ?auto_430794 ?auto_430798 ) ) ( not ( = ?auto_430794 ?auto_430799 ) ) ( not ( = ?auto_430795 ?auto_430796 ) ) ( not ( = ?auto_430795 ?auto_430797 ) ) ( not ( = ?auto_430795 ?auto_430798 ) ) ( not ( = ?auto_430795 ?auto_430799 ) ) ( not ( = ?auto_430796 ?auto_430797 ) ) ( not ( = ?auto_430796 ?auto_430798 ) ) ( not ( = ?auto_430796 ?auto_430799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_430797 ?auto_430798 ?auto_430799 )
      ( MAKE-11CRATE-VERIFY ?auto_430788 ?auto_430789 ?auto_430790 ?auto_430792 ?auto_430791 ?auto_430793 ?auto_430794 ?auto_430795 ?auto_430796 ?auto_430797 ?auto_430798 ?auto_430799 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_430909 - SURFACE
      ?auto_430910 - SURFACE
      ?auto_430911 - SURFACE
      ?auto_430913 - SURFACE
      ?auto_430912 - SURFACE
      ?auto_430914 - SURFACE
      ?auto_430915 - SURFACE
      ?auto_430916 - SURFACE
      ?auto_430917 - SURFACE
      ?auto_430918 - SURFACE
      ?auto_430919 - SURFACE
      ?auto_430920 - SURFACE
    )
    :vars
    (
      ?auto_430922 - HOIST
      ?auto_430921 - PLACE
      ?auto_430923 - TRUCK
      ?auto_430924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_430922 ?auto_430921 ) ( SURFACE-AT ?auto_430919 ?auto_430921 ) ( CLEAR ?auto_430919 ) ( IS-CRATE ?auto_430920 ) ( not ( = ?auto_430919 ?auto_430920 ) ) ( AVAILABLE ?auto_430922 ) ( IN ?auto_430920 ?auto_430923 ) ( ON ?auto_430919 ?auto_430918 ) ( not ( = ?auto_430918 ?auto_430919 ) ) ( not ( = ?auto_430918 ?auto_430920 ) ) ( TRUCK-AT ?auto_430923 ?auto_430924 ) ( not ( = ?auto_430924 ?auto_430921 ) ) ( ON ?auto_430910 ?auto_430909 ) ( ON ?auto_430911 ?auto_430910 ) ( ON ?auto_430913 ?auto_430911 ) ( ON ?auto_430912 ?auto_430913 ) ( ON ?auto_430914 ?auto_430912 ) ( ON ?auto_430915 ?auto_430914 ) ( ON ?auto_430916 ?auto_430915 ) ( ON ?auto_430917 ?auto_430916 ) ( ON ?auto_430918 ?auto_430917 ) ( not ( = ?auto_430909 ?auto_430910 ) ) ( not ( = ?auto_430909 ?auto_430911 ) ) ( not ( = ?auto_430909 ?auto_430913 ) ) ( not ( = ?auto_430909 ?auto_430912 ) ) ( not ( = ?auto_430909 ?auto_430914 ) ) ( not ( = ?auto_430909 ?auto_430915 ) ) ( not ( = ?auto_430909 ?auto_430916 ) ) ( not ( = ?auto_430909 ?auto_430917 ) ) ( not ( = ?auto_430909 ?auto_430918 ) ) ( not ( = ?auto_430909 ?auto_430919 ) ) ( not ( = ?auto_430909 ?auto_430920 ) ) ( not ( = ?auto_430910 ?auto_430911 ) ) ( not ( = ?auto_430910 ?auto_430913 ) ) ( not ( = ?auto_430910 ?auto_430912 ) ) ( not ( = ?auto_430910 ?auto_430914 ) ) ( not ( = ?auto_430910 ?auto_430915 ) ) ( not ( = ?auto_430910 ?auto_430916 ) ) ( not ( = ?auto_430910 ?auto_430917 ) ) ( not ( = ?auto_430910 ?auto_430918 ) ) ( not ( = ?auto_430910 ?auto_430919 ) ) ( not ( = ?auto_430910 ?auto_430920 ) ) ( not ( = ?auto_430911 ?auto_430913 ) ) ( not ( = ?auto_430911 ?auto_430912 ) ) ( not ( = ?auto_430911 ?auto_430914 ) ) ( not ( = ?auto_430911 ?auto_430915 ) ) ( not ( = ?auto_430911 ?auto_430916 ) ) ( not ( = ?auto_430911 ?auto_430917 ) ) ( not ( = ?auto_430911 ?auto_430918 ) ) ( not ( = ?auto_430911 ?auto_430919 ) ) ( not ( = ?auto_430911 ?auto_430920 ) ) ( not ( = ?auto_430913 ?auto_430912 ) ) ( not ( = ?auto_430913 ?auto_430914 ) ) ( not ( = ?auto_430913 ?auto_430915 ) ) ( not ( = ?auto_430913 ?auto_430916 ) ) ( not ( = ?auto_430913 ?auto_430917 ) ) ( not ( = ?auto_430913 ?auto_430918 ) ) ( not ( = ?auto_430913 ?auto_430919 ) ) ( not ( = ?auto_430913 ?auto_430920 ) ) ( not ( = ?auto_430912 ?auto_430914 ) ) ( not ( = ?auto_430912 ?auto_430915 ) ) ( not ( = ?auto_430912 ?auto_430916 ) ) ( not ( = ?auto_430912 ?auto_430917 ) ) ( not ( = ?auto_430912 ?auto_430918 ) ) ( not ( = ?auto_430912 ?auto_430919 ) ) ( not ( = ?auto_430912 ?auto_430920 ) ) ( not ( = ?auto_430914 ?auto_430915 ) ) ( not ( = ?auto_430914 ?auto_430916 ) ) ( not ( = ?auto_430914 ?auto_430917 ) ) ( not ( = ?auto_430914 ?auto_430918 ) ) ( not ( = ?auto_430914 ?auto_430919 ) ) ( not ( = ?auto_430914 ?auto_430920 ) ) ( not ( = ?auto_430915 ?auto_430916 ) ) ( not ( = ?auto_430915 ?auto_430917 ) ) ( not ( = ?auto_430915 ?auto_430918 ) ) ( not ( = ?auto_430915 ?auto_430919 ) ) ( not ( = ?auto_430915 ?auto_430920 ) ) ( not ( = ?auto_430916 ?auto_430917 ) ) ( not ( = ?auto_430916 ?auto_430918 ) ) ( not ( = ?auto_430916 ?auto_430919 ) ) ( not ( = ?auto_430916 ?auto_430920 ) ) ( not ( = ?auto_430917 ?auto_430918 ) ) ( not ( = ?auto_430917 ?auto_430919 ) ) ( not ( = ?auto_430917 ?auto_430920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_430918 ?auto_430919 ?auto_430920 )
      ( MAKE-11CRATE-VERIFY ?auto_430909 ?auto_430910 ?auto_430911 ?auto_430913 ?auto_430912 ?auto_430914 ?auto_430915 ?auto_430916 ?auto_430917 ?auto_430918 ?auto_430919 ?auto_430920 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431041 - SURFACE
      ?auto_431042 - SURFACE
      ?auto_431043 - SURFACE
      ?auto_431045 - SURFACE
      ?auto_431044 - SURFACE
      ?auto_431046 - SURFACE
      ?auto_431047 - SURFACE
      ?auto_431048 - SURFACE
      ?auto_431049 - SURFACE
      ?auto_431050 - SURFACE
      ?auto_431051 - SURFACE
      ?auto_431052 - SURFACE
    )
    :vars
    (
      ?auto_431054 - HOIST
      ?auto_431055 - PLACE
      ?auto_431056 - TRUCK
      ?auto_431053 - PLACE
      ?auto_431057 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_431054 ?auto_431055 ) ( SURFACE-AT ?auto_431051 ?auto_431055 ) ( CLEAR ?auto_431051 ) ( IS-CRATE ?auto_431052 ) ( not ( = ?auto_431051 ?auto_431052 ) ) ( AVAILABLE ?auto_431054 ) ( ON ?auto_431051 ?auto_431050 ) ( not ( = ?auto_431050 ?auto_431051 ) ) ( not ( = ?auto_431050 ?auto_431052 ) ) ( TRUCK-AT ?auto_431056 ?auto_431053 ) ( not ( = ?auto_431053 ?auto_431055 ) ) ( HOIST-AT ?auto_431057 ?auto_431053 ) ( LIFTING ?auto_431057 ?auto_431052 ) ( not ( = ?auto_431054 ?auto_431057 ) ) ( ON ?auto_431042 ?auto_431041 ) ( ON ?auto_431043 ?auto_431042 ) ( ON ?auto_431045 ?auto_431043 ) ( ON ?auto_431044 ?auto_431045 ) ( ON ?auto_431046 ?auto_431044 ) ( ON ?auto_431047 ?auto_431046 ) ( ON ?auto_431048 ?auto_431047 ) ( ON ?auto_431049 ?auto_431048 ) ( ON ?auto_431050 ?auto_431049 ) ( not ( = ?auto_431041 ?auto_431042 ) ) ( not ( = ?auto_431041 ?auto_431043 ) ) ( not ( = ?auto_431041 ?auto_431045 ) ) ( not ( = ?auto_431041 ?auto_431044 ) ) ( not ( = ?auto_431041 ?auto_431046 ) ) ( not ( = ?auto_431041 ?auto_431047 ) ) ( not ( = ?auto_431041 ?auto_431048 ) ) ( not ( = ?auto_431041 ?auto_431049 ) ) ( not ( = ?auto_431041 ?auto_431050 ) ) ( not ( = ?auto_431041 ?auto_431051 ) ) ( not ( = ?auto_431041 ?auto_431052 ) ) ( not ( = ?auto_431042 ?auto_431043 ) ) ( not ( = ?auto_431042 ?auto_431045 ) ) ( not ( = ?auto_431042 ?auto_431044 ) ) ( not ( = ?auto_431042 ?auto_431046 ) ) ( not ( = ?auto_431042 ?auto_431047 ) ) ( not ( = ?auto_431042 ?auto_431048 ) ) ( not ( = ?auto_431042 ?auto_431049 ) ) ( not ( = ?auto_431042 ?auto_431050 ) ) ( not ( = ?auto_431042 ?auto_431051 ) ) ( not ( = ?auto_431042 ?auto_431052 ) ) ( not ( = ?auto_431043 ?auto_431045 ) ) ( not ( = ?auto_431043 ?auto_431044 ) ) ( not ( = ?auto_431043 ?auto_431046 ) ) ( not ( = ?auto_431043 ?auto_431047 ) ) ( not ( = ?auto_431043 ?auto_431048 ) ) ( not ( = ?auto_431043 ?auto_431049 ) ) ( not ( = ?auto_431043 ?auto_431050 ) ) ( not ( = ?auto_431043 ?auto_431051 ) ) ( not ( = ?auto_431043 ?auto_431052 ) ) ( not ( = ?auto_431045 ?auto_431044 ) ) ( not ( = ?auto_431045 ?auto_431046 ) ) ( not ( = ?auto_431045 ?auto_431047 ) ) ( not ( = ?auto_431045 ?auto_431048 ) ) ( not ( = ?auto_431045 ?auto_431049 ) ) ( not ( = ?auto_431045 ?auto_431050 ) ) ( not ( = ?auto_431045 ?auto_431051 ) ) ( not ( = ?auto_431045 ?auto_431052 ) ) ( not ( = ?auto_431044 ?auto_431046 ) ) ( not ( = ?auto_431044 ?auto_431047 ) ) ( not ( = ?auto_431044 ?auto_431048 ) ) ( not ( = ?auto_431044 ?auto_431049 ) ) ( not ( = ?auto_431044 ?auto_431050 ) ) ( not ( = ?auto_431044 ?auto_431051 ) ) ( not ( = ?auto_431044 ?auto_431052 ) ) ( not ( = ?auto_431046 ?auto_431047 ) ) ( not ( = ?auto_431046 ?auto_431048 ) ) ( not ( = ?auto_431046 ?auto_431049 ) ) ( not ( = ?auto_431046 ?auto_431050 ) ) ( not ( = ?auto_431046 ?auto_431051 ) ) ( not ( = ?auto_431046 ?auto_431052 ) ) ( not ( = ?auto_431047 ?auto_431048 ) ) ( not ( = ?auto_431047 ?auto_431049 ) ) ( not ( = ?auto_431047 ?auto_431050 ) ) ( not ( = ?auto_431047 ?auto_431051 ) ) ( not ( = ?auto_431047 ?auto_431052 ) ) ( not ( = ?auto_431048 ?auto_431049 ) ) ( not ( = ?auto_431048 ?auto_431050 ) ) ( not ( = ?auto_431048 ?auto_431051 ) ) ( not ( = ?auto_431048 ?auto_431052 ) ) ( not ( = ?auto_431049 ?auto_431050 ) ) ( not ( = ?auto_431049 ?auto_431051 ) ) ( not ( = ?auto_431049 ?auto_431052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431050 ?auto_431051 ?auto_431052 )
      ( MAKE-11CRATE-VERIFY ?auto_431041 ?auto_431042 ?auto_431043 ?auto_431045 ?auto_431044 ?auto_431046 ?auto_431047 ?auto_431048 ?auto_431049 ?auto_431050 ?auto_431051 ?auto_431052 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431184 - SURFACE
      ?auto_431185 - SURFACE
      ?auto_431186 - SURFACE
      ?auto_431188 - SURFACE
      ?auto_431187 - SURFACE
      ?auto_431189 - SURFACE
      ?auto_431190 - SURFACE
      ?auto_431191 - SURFACE
      ?auto_431192 - SURFACE
      ?auto_431193 - SURFACE
      ?auto_431194 - SURFACE
      ?auto_431195 - SURFACE
    )
    :vars
    (
      ?auto_431196 - HOIST
      ?auto_431201 - PLACE
      ?auto_431197 - TRUCK
      ?auto_431200 - PLACE
      ?auto_431199 - HOIST
      ?auto_431198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_431196 ?auto_431201 ) ( SURFACE-AT ?auto_431194 ?auto_431201 ) ( CLEAR ?auto_431194 ) ( IS-CRATE ?auto_431195 ) ( not ( = ?auto_431194 ?auto_431195 ) ) ( AVAILABLE ?auto_431196 ) ( ON ?auto_431194 ?auto_431193 ) ( not ( = ?auto_431193 ?auto_431194 ) ) ( not ( = ?auto_431193 ?auto_431195 ) ) ( TRUCK-AT ?auto_431197 ?auto_431200 ) ( not ( = ?auto_431200 ?auto_431201 ) ) ( HOIST-AT ?auto_431199 ?auto_431200 ) ( not ( = ?auto_431196 ?auto_431199 ) ) ( AVAILABLE ?auto_431199 ) ( SURFACE-AT ?auto_431195 ?auto_431200 ) ( ON ?auto_431195 ?auto_431198 ) ( CLEAR ?auto_431195 ) ( not ( = ?auto_431194 ?auto_431198 ) ) ( not ( = ?auto_431195 ?auto_431198 ) ) ( not ( = ?auto_431193 ?auto_431198 ) ) ( ON ?auto_431185 ?auto_431184 ) ( ON ?auto_431186 ?auto_431185 ) ( ON ?auto_431188 ?auto_431186 ) ( ON ?auto_431187 ?auto_431188 ) ( ON ?auto_431189 ?auto_431187 ) ( ON ?auto_431190 ?auto_431189 ) ( ON ?auto_431191 ?auto_431190 ) ( ON ?auto_431192 ?auto_431191 ) ( ON ?auto_431193 ?auto_431192 ) ( not ( = ?auto_431184 ?auto_431185 ) ) ( not ( = ?auto_431184 ?auto_431186 ) ) ( not ( = ?auto_431184 ?auto_431188 ) ) ( not ( = ?auto_431184 ?auto_431187 ) ) ( not ( = ?auto_431184 ?auto_431189 ) ) ( not ( = ?auto_431184 ?auto_431190 ) ) ( not ( = ?auto_431184 ?auto_431191 ) ) ( not ( = ?auto_431184 ?auto_431192 ) ) ( not ( = ?auto_431184 ?auto_431193 ) ) ( not ( = ?auto_431184 ?auto_431194 ) ) ( not ( = ?auto_431184 ?auto_431195 ) ) ( not ( = ?auto_431184 ?auto_431198 ) ) ( not ( = ?auto_431185 ?auto_431186 ) ) ( not ( = ?auto_431185 ?auto_431188 ) ) ( not ( = ?auto_431185 ?auto_431187 ) ) ( not ( = ?auto_431185 ?auto_431189 ) ) ( not ( = ?auto_431185 ?auto_431190 ) ) ( not ( = ?auto_431185 ?auto_431191 ) ) ( not ( = ?auto_431185 ?auto_431192 ) ) ( not ( = ?auto_431185 ?auto_431193 ) ) ( not ( = ?auto_431185 ?auto_431194 ) ) ( not ( = ?auto_431185 ?auto_431195 ) ) ( not ( = ?auto_431185 ?auto_431198 ) ) ( not ( = ?auto_431186 ?auto_431188 ) ) ( not ( = ?auto_431186 ?auto_431187 ) ) ( not ( = ?auto_431186 ?auto_431189 ) ) ( not ( = ?auto_431186 ?auto_431190 ) ) ( not ( = ?auto_431186 ?auto_431191 ) ) ( not ( = ?auto_431186 ?auto_431192 ) ) ( not ( = ?auto_431186 ?auto_431193 ) ) ( not ( = ?auto_431186 ?auto_431194 ) ) ( not ( = ?auto_431186 ?auto_431195 ) ) ( not ( = ?auto_431186 ?auto_431198 ) ) ( not ( = ?auto_431188 ?auto_431187 ) ) ( not ( = ?auto_431188 ?auto_431189 ) ) ( not ( = ?auto_431188 ?auto_431190 ) ) ( not ( = ?auto_431188 ?auto_431191 ) ) ( not ( = ?auto_431188 ?auto_431192 ) ) ( not ( = ?auto_431188 ?auto_431193 ) ) ( not ( = ?auto_431188 ?auto_431194 ) ) ( not ( = ?auto_431188 ?auto_431195 ) ) ( not ( = ?auto_431188 ?auto_431198 ) ) ( not ( = ?auto_431187 ?auto_431189 ) ) ( not ( = ?auto_431187 ?auto_431190 ) ) ( not ( = ?auto_431187 ?auto_431191 ) ) ( not ( = ?auto_431187 ?auto_431192 ) ) ( not ( = ?auto_431187 ?auto_431193 ) ) ( not ( = ?auto_431187 ?auto_431194 ) ) ( not ( = ?auto_431187 ?auto_431195 ) ) ( not ( = ?auto_431187 ?auto_431198 ) ) ( not ( = ?auto_431189 ?auto_431190 ) ) ( not ( = ?auto_431189 ?auto_431191 ) ) ( not ( = ?auto_431189 ?auto_431192 ) ) ( not ( = ?auto_431189 ?auto_431193 ) ) ( not ( = ?auto_431189 ?auto_431194 ) ) ( not ( = ?auto_431189 ?auto_431195 ) ) ( not ( = ?auto_431189 ?auto_431198 ) ) ( not ( = ?auto_431190 ?auto_431191 ) ) ( not ( = ?auto_431190 ?auto_431192 ) ) ( not ( = ?auto_431190 ?auto_431193 ) ) ( not ( = ?auto_431190 ?auto_431194 ) ) ( not ( = ?auto_431190 ?auto_431195 ) ) ( not ( = ?auto_431190 ?auto_431198 ) ) ( not ( = ?auto_431191 ?auto_431192 ) ) ( not ( = ?auto_431191 ?auto_431193 ) ) ( not ( = ?auto_431191 ?auto_431194 ) ) ( not ( = ?auto_431191 ?auto_431195 ) ) ( not ( = ?auto_431191 ?auto_431198 ) ) ( not ( = ?auto_431192 ?auto_431193 ) ) ( not ( = ?auto_431192 ?auto_431194 ) ) ( not ( = ?auto_431192 ?auto_431195 ) ) ( not ( = ?auto_431192 ?auto_431198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431193 ?auto_431194 ?auto_431195 )
      ( MAKE-11CRATE-VERIFY ?auto_431184 ?auto_431185 ?auto_431186 ?auto_431188 ?auto_431187 ?auto_431189 ?auto_431190 ?auto_431191 ?auto_431192 ?auto_431193 ?auto_431194 ?auto_431195 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431328 - SURFACE
      ?auto_431329 - SURFACE
      ?auto_431330 - SURFACE
      ?auto_431332 - SURFACE
      ?auto_431331 - SURFACE
      ?auto_431333 - SURFACE
      ?auto_431334 - SURFACE
      ?auto_431335 - SURFACE
      ?auto_431336 - SURFACE
      ?auto_431337 - SURFACE
      ?auto_431338 - SURFACE
      ?auto_431339 - SURFACE
    )
    :vars
    (
      ?auto_431344 - HOIST
      ?auto_431340 - PLACE
      ?auto_431341 - PLACE
      ?auto_431343 - HOIST
      ?auto_431345 - SURFACE
      ?auto_431342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431344 ?auto_431340 ) ( SURFACE-AT ?auto_431338 ?auto_431340 ) ( CLEAR ?auto_431338 ) ( IS-CRATE ?auto_431339 ) ( not ( = ?auto_431338 ?auto_431339 ) ) ( AVAILABLE ?auto_431344 ) ( ON ?auto_431338 ?auto_431337 ) ( not ( = ?auto_431337 ?auto_431338 ) ) ( not ( = ?auto_431337 ?auto_431339 ) ) ( not ( = ?auto_431341 ?auto_431340 ) ) ( HOIST-AT ?auto_431343 ?auto_431341 ) ( not ( = ?auto_431344 ?auto_431343 ) ) ( AVAILABLE ?auto_431343 ) ( SURFACE-AT ?auto_431339 ?auto_431341 ) ( ON ?auto_431339 ?auto_431345 ) ( CLEAR ?auto_431339 ) ( not ( = ?auto_431338 ?auto_431345 ) ) ( not ( = ?auto_431339 ?auto_431345 ) ) ( not ( = ?auto_431337 ?auto_431345 ) ) ( TRUCK-AT ?auto_431342 ?auto_431340 ) ( ON ?auto_431329 ?auto_431328 ) ( ON ?auto_431330 ?auto_431329 ) ( ON ?auto_431332 ?auto_431330 ) ( ON ?auto_431331 ?auto_431332 ) ( ON ?auto_431333 ?auto_431331 ) ( ON ?auto_431334 ?auto_431333 ) ( ON ?auto_431335 ?auto_431334 ) ( ON ?auto_431336 ?auto_431335 ) ( ON ?auto_431337 ?auto_431336 ) ( not ( = ?auto_431328 ?auto_431329 ) ) ( not ( = ?auto_431328 ?auto_431330 ) ) ( not ( = ?auto_431328 ?auto_431332 ) ) ( not ( = ?auto_431328 ?auto_431331 ) ) ( not ( = ?auto_431328 ?auto_431333 ) ) ( not ( = ?auto_431328 ?auto_431334 ) ) ( not ( = ?auto_431328 ?auto_431335 ) ) ( not ( = ?auto_431328 ?auto_431336 ) ) ( not ( = ?auto_431328 ?auto_431337 ) ) ( not ( = ?auto_431328 ?auto_431338 ) ) ( not ( = ?auto_431328 ?auto_431339 ) ) ( not ( = ?auto_431328 ?auto_431345 ) ) ( not ( = ?auto_431329 ?auto_431330 ) ) ( not ( = ?auto_431329 ?auto_431332 ) ) ( not ( = ?auto_431329 ?auto_431331 ) ) ( not ( = ?auto_431329 ?auto_431333 ) ) ( not ( = ?auto_431329 ?auto_431334 ) ) ( not ( = ?auto_431329 ?auto_431335 ) ) ( not ( = ?auto_431329 ?auto_431336 ) ) ( not ( = ?auto_431329 ?auto_431337 ) ) ( not ( = ?auto_431329 ?auto_431338 ) ) ( not ( = ?auto_431329 ?auto_431339 ) ) ( not ( = ?auto_431329 ?auto_431345 ) ) ( not ( = ?auto_431330 ?auto_431332 ) ) ( not ( = ?auto_431330 ?auto_431331 ) ) ( not ( = ?auto_431330 ?auto_431333 ) ) ( not ( = ?auto_431330 ?auto_431334 ) ) ( not ( = ?auto_431330 ?auto_431335 ) ) ( not ( = ?auto_431330 ?auto_431336 ) ) ( not ( = ?auto_431330 ?auto_431337 ) ) ( not ( = ?auto_431330 ?auto_431338 ) ) ( not ( = ?auto_431330 ?auto_431339 ) ) ( not ( = ?auto_431330 ?auto_431345 ) ) ( not ( = ?auto_431332 ?auto_431331 ) ) ( not ( = ?auto_431332 ?auto_431333 ) ) ( not ( = ?auto_431332 ?auto_431334 ) ) ( not ( = ?auto_431332 ?auto_431335 ) ) ( not ( = ?auto_431332 ?auto_431336 ) ) ( not ( = ?auto_431332 ?auto_431337 ) ) ( not ( = ?auto_431332 ?auto_431338 ) ) ( not ( = ?auto_431332 ?auto_431339 ) ) ( not ( = ?auto_431332 ?auto_431345 ) ) ( not ( = ?auto_431331 ?auto_431333 ) ) ( not ( = ?auto_431331 ?auto_431334 ) ) ( not ( = ?auto_431331 ?auto_431335 ) ) ( not ( = ?auto_431331 ?auto_431336 ) ) ( not ( = ?auto_431331 ?auto_431337 ) ) ( not ( = ?auto_431331 ?auto_431338 ) ) ( not ( = ?auto_431331 ?auto_431339 ) ) ( not ( = ?auto_431331 ?auto_431345 ) ) ( not ( = ?auto_431333 ?auto_431334 ) ) ( not ( = ?auto_431333 ?auto_431335 ) ) ( not ( = ?auto_431333 ?auto_431336 ) ) ( not ( = ?auto_431333 ?auto_431337 ) ) ( not ( = ?auto_431333 ?auto_431338 ) ) ( not ( = ?auto_431333 ?auto_431339 ) ) ( not ( = ?auto_431333 ?auto_431345 ) ) ( not ( = ?auto_431334 ?auto_431335 ) ) ( not ( = ?auto_431334 ?auto_431336 ) ) ( not ( = ?auto_431334 ?auto_431337 ) ) ( not ( = ?auto_431334 ?auto_431338 ) ) ( not ( = ?auto_431334 ?auto_431339 ) ) ( not ( = ?auto_431334 ?auto_431345 ) ) ( not ( = ?auto_431335 ?auto_431336 ) ) ( not ( = ?auto_431335 ?auto_431337 ) ) ( not ( = ?auto_431335 ?auto_431338 ) ) ( not ( = ?auto_431335 ?auto_431339 ) ) ( not ( = ?auto_431335 ?auto_431345 ) ) ( not ( = ?auto_431336 ?auto_431337 ) ) ( not ( = ?auto_431336 ?auto_431338 ) ) ( not ( = ?auto_431336 ?auto_431339 ) ) ( not ( = ?auto_431336 ?auto_431345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431337 ?auto_431338 ?auto_431339 )
      ( MAKE-11CRATE-VERIFY ?auto_431328 ?auto_431329 ?auto_431330 ?auto_431332 ?auto_431331 ?auto_431333 ?auto_431334 ?auto_431335 ?auto_431336 ?auto_431337 ?auto_431338 ?auto_431339 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431472 - SURFACE
      ?auto_431473 - SURFACE
      ?auto_431474 - SURFACE
      ?auto_431476 - SURFACE
      ?auto_431475 - SURFACE
      ?auto_431477 - SURFACE
      ?auto_431478 - SURFACE
      ?auto_431479 - SURFACE
      ?auto_431480 - SURFACE
      ?auto_431481 - SURFACE
      ?auto_431482 - SURFACE
      ?auto_431483 - SURFACE
    )
    :vars
    (
      ?auto_431485 - HOIST
      ?auto_431489 - PLACE
      ?auto_431487 - PLACE
      ?auto_431488 - HOIST
      ?auto_431486 - SURFACE
      ?auto_431484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431485 ?auto_431489 ) ( IS-CRATE ?auto_431483 ) ( not ( = ?auto_431482 ?auto_431483 ) ) ( not ( = ?auto_431481 ?auto_431482 ) ) ( not ( = ?auto_431481 ?auto_431483 ) ) ( not ( = ?auto_431487 ?auto_431489 ) ) ( HOIST-AT ?auto_431488 ?auto_431487 ) ( not ( = ?auto_431485 ?auto_431488 ) ) ( AVAILABLE ?auto_431488 ) ( SURFACE-AT ?auto_431483 ?auto_431487 ) ( ON ?auto_431483 ?auto_431486 ) ( CLEAR ?auto_431483 ) ( not ( = ?auto_431482 ?auto_431486 ) ) ( not ( = ?auto_431483 ?auto_431486 ) ) ( not ( = ?auto_431481 ?auto_431486 ) ) ( TRUCK-AT ?auto_431484 ?auto_431489 ) ( SURFACE-AT ?auto_431481 ?auto_431489 ) ( CLEAR ?auto_431481 ) ( LIFTING ?auto_431485 ?auto_431482 ) ( IS-CRATE ?auto_431482 ) ( ON ?auto_431473 ?auto_431472 ) ( ON ?auto_431474 ?auto_431473 ) ( ON ?auto_431476 ?auto_431474 ) ( ON ?auto_431475 ?auto_431476 ) ( ON ?auto_431477 ?auto_431475 ) ( ON ?auto_431478 ?auto_431477 ) ( ON ?auto_431479 ?auto_431478 ) ( ON ?auto_431480 ?auto_431479 ) ( ON ?auto_431481 ?auto_431480 ) ( not ( = ?auto_431472 ?auto_431473 ) ) ( not ( = ?auto_431472 ?auto_431474 ) ) ( not ( = ?auto_431472 ?auto_431476 ) ) ( not ( = ?auto_431472 ?auto_431475 ) ) ( not ( = ?auto_431472 ?auto_431477 ) ) ( not ( = ?auto_431472 ?auto_431478 ) ) ( not ( = ?auto_431472 ?auto_431479 ) ) ( not ( = ?auto_431472 ?auto_431480 ) ) ( not ( = ?auto_431472 ?auto_431481 ) ) ( not ( = ?auto_431472 ?auto_431482 ) ) ( not ( = ?auto_431472 ?auto_431483 ) ) ( not ( = ?auto_431472 ?auto_431486 ) ) ( not ( = ?auto_431473 ?auto_431474 ) ) ( not ( = ?auto_431473 ?auto_431476 ) ) ( not ( = ?auto_431473 ?auto_431475 ) ) ( not ( = ?auto_431473 ?auto_431477 ) ) ( not ( = ?auto_431473 ?auto_431478 ) ) ( not ( = ?auto_431473 ?auto_431479 ) ) ( not ( = ?auto_431473 ?auto_431480 ) ) ( not ( = ?auto_431473 ?auto_431481 ) ) ( not ( = ?auto_431473 ?auto_431482 ) ) ( not ( = ?auto_431473 ?auto_431483 ) ) ( not ( = ?auto_431473 ?auto_431486 ) ) ( not ( = ?auto_431474 ?auto_431476 ) ) ( not ( = ?auto_431474 ?auto_431475 ) ) ( not ( = ?auto_431474 ?auto_431477 ) ) ( not ( = ?auto_431474 ?auto_431478 ) ) ( not ( = ?auto_431474 ?auto_431479 ) ) ( not ( = ?auto_431474 ?auto_431480 ) ) ( not ( = ?auto_431474 ?auto_431481 ) ) ( not ( = ?auto_431474 ?auto_431482 ) ) ( not ( = ?auto_431474 ?auto_431483 ) ) ( not ( = ?auto_431474 ?auto_431486 ) ) ( not ( = ?auto_431476 ?auto_431475 ) ) ( not ( = ?auto_431476 ?auto_431477 ) ) ( not ( = ?auto_431476 ?auto_431478 ) ) ( not ( = ?auto_431476 ?auto_431479 ) ) ( not ( = ?auto_431476 ?auto_431480 ) ) ( not ( = ?auto_431476 ?auto_431481 ) ) ( not ( = ?auto_431476 ?auto_431482 ) ) ( not ( = ?auto_431476 ?auto_431483 ) ) ( not ( = ?auto_431476 ?auto_431486 ) ) ( not ( = ?auto_431475 ?auto_431477 ) ) ( not ( = ?auto_431475 ?auto_431478 ) ) ( not ( = ?auto_431475 ?auto_431479 ) ) ( not ( = ?auto_431475 ?auto_431480 ) ) ( not ( = ?auto_431475 ?auto_431481 ) ) ( not ( = ?auto_431475 ?auto_431482 ) ) ( not ( = ?auto_431475 ?auto_431483 ) ) ( not ( = ?auto_431475 ?auto_431486 ) ) ( not ( = ?auto_431477 ?auto_431478 ) ) ( not ( = ?auto_431477 ?auto_431479 ) ) ( not ( = ?auto_431477 ?auto_431480 ) ) ( not ( = ?auto_431477 ?auto_431481 ) ) ( not ( = ?auto_431477 ?auto_431482 ) ) ( not ( = ?auto_431477 ?auto_431483 ) ) ( not ( = ?auto_431477 ?auto_431486 ) ) ( not ( = ?auto_431478 ?auto_431479 ) ) ( not ( = ?auto_431478 ?auto_431480 ) ) ( not ( = ?auto_431478 ?auto_431481 ) ) ( not ( = ?auto_431478 ?auto_431482 ) ) ( not ( = ?auto_431478 ?auto_431483 ) ) ( not ( = ?auto_431478 ?auto_431486 ) ) ( not ( = ?auto_431479 ?auto_431480 ) ) ( not ( = ?auto_431479 ?auto_431481 ) ) ( not ( = ?auto_431479 ?auto_431482 ) ) ( not ( = ?auto_431479 ?auto_431483 ) ) ( not ( = ?auto_431479 ?auto_431486 ) ) ( not ( = ?auto_431480 ?auto_431481 ) ) ( not ( = ?auto_431480 ?auto_431482 ) ) ( not ( = ?auto_431480 ?auto_431483 ) ) ( not ( = ?auto_431480 ?auto_431486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431481 ?auto_431482 ?auto_431483 )
      ( MAKE-11CRATE-VERIFY ?auto_431472 ?auto_431473 ?auto_431474 ?auto_431476 ?auto_431475 ?auto_431477 ?auto_431478 ?auto_431479 ?auto_431480 ?auto_431481 ?auto_431482 ?auto_431483 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_431616 - SURFACE
      ?auto_431617 - SURFACE
      ?auto_431618 - SURFACE
      ?auto_431620 - SURFACE
      ?auto_431619 - SURFACE
      ?auto_431621 - SURFACE
      ?auto_431622 - SURFACE
      ?auto_431623 - SURFACE
      ?auto_431624 - SURFACE
      ?auto_431625 - SURFACE
      ?auto_431626 - SURFACE
      ?auto_431627 - SURFACE
    )
    :vars
    (
      ?auto_431629 - HOIST
      ?auto_431631 - PLACE
      ?auto_431628 - PLACE
      ?auto_431633 - HOIST
      ?auto_431632 - SURFACE
      ?auto_431630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431629 ?auto_431631 ) ( IS-CRATE ?auto_431627 ) ( not ( = ?auto_431626 ?auto_431627 ) ) ( not ( = ?auto_431625 ?auto_431626 ) ) ( not ( = ?auto_431625 ?auto_431627 ) ) ( not ( = ?auto_431628 ?auto_431631 ) ) ( HOIST-AT ?auto_431633 ?auto_431628 ) ( not ( = ?auto_431629 ?auto_431633 ) ) ( AVAILABLE ?auto_431633 ) ( SURFACE-AT ?auto_431627 ?auto_431628 ) ( ON ?auto_431627 ?auto_431632 ) ( CLEAR ?auto_431627 ) ( not ( = ?auto_431626 ?auto_431632 ) ) ( not ( = ?auto_431627 ?auto_431632 ) ) ( not ( = ?auto_431625 ?auto_431632 ) ) ( TRUCK-AT ?auto_431630 ?auto_431631 ) ( SURFACE-AT ?auto_431625 ?auto_431631 ) ( CLEAR ?auto_431625 ) ( IS-CRATE ?auto_431626 ) ( AVAILABLE ?auto_431629 ) ( IN ?auto_431626 ?auto_431630 ) ( ON ?auto_431617 ?auto_431616 ) ( ON ?auto_431618 ?auto_431617 ) ( ON ?auto_431620 ?auto_431618 ) ( ON ?auto_431619 ?auto_431620 ) ( ON ?auto_431621 ?auto_431619 ) ( ON ?auto_431622 ?auto_431621 ) ( ON ?auto_431623 ?auto_431622 ) ( ON ?auto_431624 ?auto_431623 ) ( ON ?auto_431625 ?auto_431624 ) ( not ( = ?auto_431616 ?auto_431617 ) ) ( not ( = ?auto_431616 ?auto_431618 ) ) ( not ( = ?auto_431616 ?auto_431620 ) ) ( not ( = ?auto_431616 ?auto_431619 ) ) ( not ( = ?auto_431616 ?auto_431621 ) ) ( not ( = ?auto_431616 ?auto_431622 ) ) ( not ( = ?auto_431616 ?auto_431623 ) ) ( not ( = ?auto_431616 ?auto_431624 ) ) ( not ( = ?auto_431616 ?auto_431625 ) ) ( not ( = ?auto_431616 ?auto_431626 ) ) ( not ( = ?auto_431616 ?auto_431627 ) ) ( not ( = ?auto_431616 ?auto_431632 ) ) ( not ( = ?auto_431617 ?auto_431618 ) ) ( not ( = ?auto_431617 ?auto_431620 ) ) ( not ( = ?auto_431617 ?auto_431619 ) ) ( not ( = ?auto_431617 ?auto_431621 ) ) ( not ( = ?auto_431617 ?auto_431622 ) ) ( not ( = ?auto_431617 ?auto_431623 ) ) ( not ( = ?auto_431617 ?auto_431624 ) ) ( not ( = ?auto_431617 ?auto_431625 ) ) ( not ( = ?auto_431617 ?auto_431626 ) ) ( not ( = ?auto_431617 ?auto_431627 ) ) ( not ( = ?auto_431617 ?auto_431632 ) ) ( not ( = ?auto_431618 ?auto_431620 ) ) ( not ( = ?auto_431618 ?auto_431619 ) ) ( not ( = ?auto_431618 ?auto_431621 ) ) ( not ( = ?auto_431618 ?auto_431622 ) ) ( not ( = ?auto_431618 ?auto_431623 ) ) ( not ( = ?auto_431618 ?auto_431624 ) ) ( not ( = ?auto_431618 ?auto_431625 ) ) ( not ( = ?auto_431618 ?auto_431626 ) ) ( not ( = ?auto_431618 ?auto_431627 ) ) ( not ( = ?auto_431618 ?auto_431632 ) ) ( not ( = ?auto_431620 ?auto_431619 ) ) ( not ( = ?auto_431620 ?auto_431621 ) ) ( not ( = ?auto_431620 ?auto_431622 ) ) ( not ( = ?auto_431620 ?auto_431623 ) ) ( not ( = ?auto_431620 ?auto_431624 ) ) ( not ( = ?auto_431620 ?auto_431625 ) ) ( not ( = ?auto_431620 ?auto_431626 ) ) ( not ( = ?auto_431620 ?auto_431627 ) ) ( not ( = ?auto_431620 ?auto_431632 ) ) ( not ( = ?auto_431619 ?auto_431621 ) ) ( not ( = ?auto_431619 ?auto_431622 ) ) ( not ( = ?auto_431619 ?auto_431623 ) ) ( not ( = ?auto_431619 ?auto_431624 ) ) ( not ( = ?auto_431619 ?auto_431625 ) ) ( not ( = ?auto_431619 ?auto_431626 ) ) ( not ( = ?auto_431619 ?auto_431627 ) ) ( not ( = ?auto_431619 ?auto_431632 ) ) ( not ( = ?auto_431621 ?auto_431622 ) ) ( not ( = ?auto_431621 ?auto_431623 ) ) ( not ( = ?auto_431621 ?auto_431624 ) ) ( not ( = ?auto_431621 ?auto_431625 ) ) ( not ( = ?auto_431621 ?auto_431626 ) ) ( not ( = ?auto_431621 ?auto_431627 ) ) ( not ( = ?auto_431621 ?auto_431632 ) ) ( not ( = ?auto_431622 ?auto_431623 ) ) ( not ( = ?auto_431622 ?auto_431624 ) ) ( not ( = ?auto_431622 ?auto_431625 ) ) ( not ( = ?auto_431622 ?auto_431626 ) ) ( not ( = ?auto_431622 ?auto_431627 ) ) ( not ( = ?auto_431622 ?auto_431632 ) ) ( not ( = ?auto_431623 ?auto_431624 ) ) ( not ( = ?auto_431623 ?auto_431625 ) ) ( not ( = ?auto_431623 ?auto_431626 ) ) ( not ( = ?auto_431623 ?auto_431627 ) ) ( not ( = ?auto_431623 ?auto_431632 ) ) ( not ( = ?auto_431624 ?auto_431625 ) ) ( not ( = ?auto_431624 ?auto_431626 ) ) ( not ( = ?auto_431624 ?auto_431627 ) ) ( not ( = ?auto_431624 ?auto_431632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_431625 ?auto_431626 ?auto_431627 )
      ( MAKE-11CRATE-VERIFY ?auto_431616 ?auto_431617 ?auto_431618 ?auto_431620 ?auto_431619 ?auto_431621 ?auto_431622 ?auto_431623 ?auto_431624 ?auto_431625 ?auto_431626 ?auto_431627 ) )
  )

)

