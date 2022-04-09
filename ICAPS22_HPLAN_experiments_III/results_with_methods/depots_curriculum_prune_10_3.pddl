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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7839 - SURFACE
      ?auto_7840 - SURFACE
    )
    :vars
    (
      ?auto_7841 - HOIST
      ?auto_7842 - PLACE
      ?auto_7844 - PLACE
      ?auto_7845 - HOIST
      ?auto_7846 - SURFACE
      ?auto_7843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7841 ?auto_7842 ) ( SURFACE-AT ?auto_7839 ?auto_7842 ) ( CLEAR ?auto_7839 ) ( IS-CRATE ?auto_7840 ) ( AVAILABLE ?auto_7841 ) ( not ( = ?auto_7844 ?auto_7842 ) ) ( HOIST-AT ?auto_7845 ?auto_7844 ) ( AVAILABLE ?auto_7845 ) ( SURFACE-AT ?auto_7840 ?auto_7844 ) ( ON ?auto_7840 ?auto_7846 ) ( CLEAR ?auto_7840 ) ( TRUCK-AT ?auto_7843 ?auto_7842 ) ( not ( = ?auto_7839 ?auto_7840 ) ) ( not ( = ?auto_7839 ?auto_7846 ) ) ( not ( = ?auto_7840 ?auto_7846 ) ) ( not ( = ?auto_7841 ?auto_7845 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7843 ?auto_7842 ?auto_7844 )
      ( !LIFT ?auto_7845 ?auto_7840 ?auto_7846 ?auto_7844 )
      ( !LOAD ?auto_7845 ?auto_7840 ?auto_7843 ?auto_7844 )
      ( !DRIVE ?auto_7843 ?auto_7844 ?auto_7842 )
      ( !UNLOAD ?auto_7841 ?auto_7840 ?auto_7843 ?auto_7842 )
      ( !DROP ?auto_7841 ?auto_7840 ?auto_7839 ?auto_7842 )
      ( MAKE-1CRATE-VERIFY ?auto_7839 ?auto_7840 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7860 - SURFACE
      ?auto_7861 - SURFACE
      ?auto_7862 - SURFACE
    )
    :vars
    (
      ?auto_7865 - HOIST
      ?auto_7868 - PLACE
      ?auto_7866 - PLACE
      ?auto_7867 - HOIST
      ?auto_7863 - SURFACE
      ?auto_7869 - PLACE
      ?auto_7871 - HOIST
      ?auto_7870 - SURFACE
      ?auto_7864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7865 ?auto_7868 ) ( IS-CRATE ?auto_7862 ) ( not ( = ?auto_7866 ?auto_7868 ) ) ( HOIST-AT ?auto_7867 ?auto_7866 ) ( AVAILABLE ?auto_7867 ) ( SURFACE-AT ?auto_7862 ?auto_7866 ) ( ON ?auto_7862 ?auto_7863 ) ( CLEAR ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7861 ?auto_7863 ) ) ( not ( = ?auto_7862 ?auto_7863 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( SURFACE-AT ?auto_7860 ?auto_7868 ) ( CLEAR ?auto_7860 ) ( IS-CRATE ?auto_7861 ) ( AVAILABLE ?auto_7865 ) ( not ( = ?auto_7869 ?auto_7868 ) ) ( HOIST-AT ?auto_7871 ?auto_7869 ) ( AVAILABLE ?auto_7871 ) ( SURFACE-AT ?auto_7861 ?auto_7869 ) ( ON ?auto_7861 ?auto_7870 ) ( CLEAR ?auto_7861 ) ( TRUCK-AT ?auto_7864 ?auto_7868 ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7870 ) ) ( not ( = ?auto_7861 ?auto_7870 ) ) ( not ( = ?auto_7865 ?auto_7871 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7863 ) ) ( not ( = ?auto_7862 ?auto_7870 ) ) ( not ( = ?auto_7866 ?auto_7869 ) ) ( not ( = ?auto_7867 ?auto_7871 ) ) ( not ( = ?auto_7863 ?auto_7870 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7860 ?auto_7861 )
      ( MAKE-1CRATE ?auto_7861 ?auto_7862 )
      ( MAKE-2CRATE-VERIFY ?auto_7860 ?auto_7861 ?auto_7862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7886 - SURFACE
      ?auto_7887 - SURFACE
      ?auto_7888 - SURFACE
      ?auto_7889 - SURFACE
    )
    :vars
    (
      ?auto_7893 - HOIST
      ?auto_7891 - PLACE
      ?auto_7890 - PLACE
      ?auto_7892 - HOIST
      ?auto_7895 - SURFACE
      ?auto_7899 - SURFACE
      ?auto_7896 - PLACE
      ?auto_7897 - HOIST
      ?auto_7898 - SURFACE
      ?auto_7894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7893 ?auto_7891 ) ( IS-CRATE ?auto_7889 ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( HOIST-AT ?auto_7892 ?auto_7890 ) ( SURFACE-AT ?auto_7889 ?auto_7890 ) ( ON ?auto_7889 ?auto_7895 ) ( CLEAR ?auto_7889 ) ( not ( = ?auto_7888 ?auto_7889 ) ) ( not ( = ?auto_7888 ?auto_7895 ) ) ( not ( = ?auto_7889 ?auto_7895 ) ) ( not ( = ?auto_7893 ?auto_7892 ) ) ( IS-CRATE ?auto_7888 ) ( AVAILABLE ?auto_7892 ) ( SURFACE-AT ?auto_7888 ?auto_7890 ) ( ON ?auto_7888 ?auto_7899 ) ( CLEAR ?auto_7888 ) ( not ( = ?auto_7887 ?auto_7888 ) ) ( not ( = ?auto_7887 ?auto_7899 ) ) ( not ( = ?auto_7888 ?auto_7899 ) ) ( SURFACE-AT ?auto_7886 ?auto_7891 ) ( CLEAR ?auto_7886 ) ( IS-CRATE ?auto_7887 ) ( AVAILABLE ?auto_7893 ) ( not ( = ?auto_7896 ?auto_7891 ) ) ( HOIST-AT ?auto_7897 ?auto_7896 ) ( AVAILABLE ?auto_7897 ) ( SURFACE-AT ?auto_7887 ?auto_7896 ) ( ON ?auto_7887 ?auto_7898 ) ( CLEAR ?auto_7887 ) ( TRUCK-AT ?auto_7894 ?auto_7891 ) ( not ( = ?auto_7886 ?auto_7887 ) ) ( not ( = ?auto_7886 ?auto_7898 ) ) ( not ( = ?auto_7887 ?auto_7898 ) ) ( not ( = ?auto_7893 ?auto_7897 ) ) ( not ( = ?auto_7886 ?auto_7888 ) ) ( not ( = ?auto_7886 ?auto_7899 ) ) ( not ( = ?auto_7888 ?auto_7898 ) ) ( not ( = ?auto_7890 ?auto_7896 ) ) ( not ( = ?auto_7892 ?auto_7897 ) ) ( not ( = ?auto_7899 ?auto_7898 ) ) ( not ( = ?auto_7886 ?auto_7889 ) ) ( not ( = ?auto_7886 ?auto_7895 ) ) ( not ( = ?auto_7887 ?auto_7889 ) ) ( not ( = ?auto_7887 ?auto_7895 ) ) ( not ( = ?auto_7889 ?auto_7899 ) ) ( not ( = ?auto_7889 ?auto_7898 ) ) ( not ( = ?auto_7895 ?auto_7899 ) ) ( not ( = ?auto_7895 ?auto_7898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7886 ?auto_7887 ?auto_7888 )
      ( MAKE-1CRATE ?auto_7888 ?auto_7889 )
      ( MAKE-3CRATE-VERIFY ?auto_7886 ?auto_7887 ?auto_7888 ?auto_7889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7915 - SURFACE
      ?auto_7916 - SURFACE
      ?auto_7917 - SURFACE
      ?auto_7918 - SURFACE
      ?auto_7919 - SURFACE
    )
    :vars
    (
      ?auto_7924 - HOIST
      ?auto_7920 - PLACE
      ?auto_7925 - PLACE
      ?auto_7921 - HOIST
      ?auto_7923 - SURFACE
      ?auto_7932 - PLACE
      ?auto_7929 - HOIST
      ?auto_7931 - SURFACE
      ?auto_7926 - SURFACE
      ?auto_7928 - PLACE
      ?auto_7927 - HOIST
      ?auto_7930 - SURFACE
      ?auto_7922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7924 ?auto_7920 ) ( IS-CRATE ?auto_7919 ) ( not ( = ?auto_7925 ?auto_7920 ) ) ( HOIST-AT ?auto_7921 ?auto_7925 ) ( AVAILABLE ?auto_7921 ) ( SURFACE-AT ?auto_7919 ?auto_7925 ) ( ON ?auto_7919 ?auto_7923 ) ( CLEAR ?auto_7919 ) ( not ( = ?auto_7918 ?auto_7919 ) ) ( not ( = ?auto_7918 ?auto_7923 ) ) ( not ( = ?auto_7919 ?auto_7923 ) ) ( not ( = ?auto_7924 ?auto_7921 ) ) ( IS-CRATE ?auto_7918 ) ( not ( = ?auto_7932 ?auto_7920 ) ) ( HOIST-AT ?auto_7929 ?auto_7932 ) ( SURFACE-AT ?auto_7918 ?auto_7932 ) ( ON ?auto_7918 ?auto_7931 ) ( CLEAR ?auto_7918 ) ( not ( = ?auto_7917 ?auto_7918 ) ) ( not ( = ?auto_7917 ?auto_7931 ) ) ( not ( = ?auto_7918 ?auto_7931 ) ) ( not ( = ?auto_7924 ?auto_7929 ) ) ( IS-CRATE ?auto_7917 ) ( AVAILABLE ?auto_7929 ) ( SURFACE-AT ?auto_7917 ?auto_7932 ) ( ON ?auto_7917 ?auto_7926 ) ( CLEAR ?auto_7917 ) ( not ( = ?auto_7916 ?auto_7917 ) ) ( not ( = ?auto_7916 ?auto_7926 ) ) ( not ( = ?auto_7917 ?auto_7926 ) ) ( SURFACE-AT ?auto_7915 ?auto_7920 ) ( CLEAR ?auto_7915 ) ( IS-CRATE ?auto_7916 ) ( AVAILABLE ?auto_7924 ) ( not ( = ?auto_7928 ?auto_7920 ) ) ( HOIST-AT ?auto_7927 ?auto_7928 ) ( AVAILABLE ?auto_7927 ) ( SURFACE-AT ?auto_7916 ?auto_7928 ) ( ON ?auto_7916 ?auto_7930 ) ( CLEAR ?auto_7916 ) ( TRUCK-AT ?auto_7922 ?auto_7920 ) ( not ( = ?auto_7915 ?auto_7916 ) ) ( not ( = ?auto_7915 ?auto_7930 ) ) ( not ( = ?auto_7916 ?auto_7930 ) ) ( not ( = ?auto_7924 ?auto_7927 ) ) ( not ( = ?auto_7915 ?auto_7917 ) ) ( not ( = ?auto_7915 ?auto_7926 ) ) ( not ( = ?auto_7917 ?auto_7930 ) ) ( not ( = ?auto_7932 ?auto_7928 ) ) ( not ( = ?auto_7929 ?auto_7927 ) ) ( not ( = ?auto_7926 ?auto_7930 ) ) ( not ( = ?auto_7915 ?auto_7918 ) ) ( not ( = ?auto_7915 ?auto_7931 ) ) ( not ( = ?auto_7916 ?auto_7918 ) ) ( not ( = ?auto_7916 ?auto_7931 ) ) ( not ( = ?auto_7918 ?auto_7926 ) ) ( not ( = ?auto_7918 ?auto_7930 ) ) ( not ( = ?auto_7931 ?auto_7926 ) ) ( not ( = ?auto_7931 ?auto_7930 ) ) ( not ( = ?auto_7915 ?auto_7919 ) ) ( not ( = ?auto_7915 ?auto_7923 ) ) ( not ( = ?auto_7916 ?auto_7919 ) ) ( not ( = ?auto_7916 ?auto_7923 ) ) ( not ( = ?auto_7917 ?auto_7919 ) ) ( not ( = ?auto_7917 ?auto_7923 ) ) ( not ( = ?auto_7919 ?auto_7931 ) ) ( not ( = ?auto_7919 ?auto_7926 ) ) ( not ( = ?auto_7919 ?auto_7930 ) ) ( not ( = ?auto_7925 ?auto_7932 ) ) ( not ( = ?auto_7925 ?auto_7928 ) ) ( not ( = ?auto_7921 ?auto_7929 ) ) ( not ( = ?auto_7921 ?auto_7927 ) ) ( not ( = ?auto_7923 ?auto_7931 ) ) ( not ( = ?auto_7923 ?auto_7926 ) ) ( not ( = ?auto_7923 ?auto_7930 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7915 ?auto_7916 ?auto_7917 ?auto_7918 )
      ( MAKE-1CRATE ?auto_7918 ?auto_7919 )
      ( MAKE-4CRATE-VERIFY ?auto_7915 ?auto_7916 ?auto_7917 ?auto_7918 ?auto_7919 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7949 - SURFACE
      ?auto_7950 - SURFACE
      ?auto_7951 - SURFACE
      ?auto_7952 - SURFACE
      ?auto_7953 - SURFACE
      ?auto_7954 - SURFACE
    )
    :vars
    (
      ?auto_7960 - HOIST
      ?auto_7957 - PLACE
      ?auto_7956 - PLACE
      ?auto_7958 - HOIST
      ?auto_7959 - SURFACE
      ?auto_7967 - PLACE
      ?auto_7970 - HOIST
      ?auto_7961 - SURFACE
      ?auto_7966 - PLACE
      ?auto_7963 - HOIST
      ?auto_7965 - SURFACE
      ?auto_7969 - SURFACE
      ?auto_7968 - PLACE
      ?auto_7962 - HOIST
      ?auto_7964 - SURFACE
      ?auto_7955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7960 ?auto_7957 ) ( IS-CRATE ?auto_7954 ) ( not ( = ?auto_7956 ?auto_7957 ) ) ( HOIST-AT ?auto_7958 ?auto_7956 ) ( AVAILABLE ?auto_7958 ) ( SURFACE-AT ?auto_7954 ?auto_7956 ) ( ON ?auto_7954 ?auto_7959 ) ( CLEAR ?auto_7954 ) ( not ( = ?auto_7953 ?auto_7954 ) ) ( not ( = ?auto_7953 ?auto_7959 ) ) ( not ( = ?auto_7954 ?auto_7959 ) ) ( not ( = ?auto_7960 ?auto_7958 ) ) ( IS-CRATE ?auto_7953 ) ( not ( = ?auto_7967 ?auto_7957 ) ) ( HOIST-AT ?auto_7970 ?auto_7967 ) ( AVAILABLE ?auto_7970 ) ( SURFACE-AT ?auto_7953 ?auto_7967 ) ( ON ?auto_7953 ?auto_7961 ) ( CLEAR ?auto_7953 ) ( not ( = ?auto_7952 ?auto_7953 ) ) ( not ( = ?auto_7952 ?auto_7961 ) ) ( not ( = ?auto_7953 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7970 ) ) ( IS-CRATE ?auto_7952 ) ( not ( = ?auto_7966 ?auto_7957 ) ) ( HOIST-AT ?auto_7963 ?auto_7966 ) ( SURFACE-AT ?auto_7952 ?auto_7966 ) ( ON ?auto_7952 ?auto_7965 ) ( CLEAR ?auto_7952 ) ( not ( = ?auto_7951 ?auto_7952 ) ) ( not ( = ?auto_7951 ?auto_7965 ) ) ( not ( = ?auto_7952 ?auto_7965 ) ) ( not ( = ?auto_7960 ?auto_7963 ) ) ( IS-CRATE ?auto_7951 ) ( AVAILABLE ?auto_7963 ) ( SURFACE-AT ?auto_7951 ?auto_7966 ) ( ON ?auto_7951 ?auto_7969 ) ( CLEAR ?auto_7951 ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7969 ) ) ( not ( = ?auto_7951 ?auto_7969 ) ) ( SURFACE-AT ?auto_7949 ?auto_7957 ) ( CLEAR ?auto_7949 ) ( IS-CRATE ?auto_7950 ) ( AVAILABLE ?auto_7960 ) ( not ( = ?auto_7968 ?auto_7957 ) ) ( HOIST-AT ?auto_7962 ?auto_7968 ) ( AVAILABLE ?auto_7962 ) ( SURFACE-AT ?auto_7950 ?auto_7968 ) ( ON ?auto_7950 ?auto_7964 ) ( CLEAR ?auto_7950 ) ( TRUCK-AT ?auto_7955 ?auto_7957 ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7964 ) ) ( not ( = ?auto_7950 ?auto_7964 ) ) ( not ( = ?auto_7960 ?auto_7962 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7949 ?auto_7969 ) ) ( not ( = ?auto_7951 ?auto_7964 ) ) ( not ( = ?auto_7966 ?auto_7968 ) ) ( not ( = ?auto_7963 ?auto_7962 ) ) ( not ( = ?auto_7969 ?auto_7964 ) ) ( not ( = ?auto_7949 ?auto_7952 ) ) ( not ( = ?auto_7949 ?auto_7965 ) ) ( not ( = ?auto_7950 ?auto_7952 ) ) ( not ( = ?auto_7950 ?auto_7965 ) ) ( not ( = ?auto_7952 ?auto_7969 ) ) ( not ( = ?auto_7952 ?auto_7964 ) ) ( not ( = ?auto_7965 ?auto_7969 ) ) ( not ( = ?auto_7965 ?auto_7964 ) ) ( not ( = ?auto_7949 ?auto_7953 ) ) ( not ( = ?auto_7949 ?auto_7961 ) ) ( not ( = ?auto_7950 ?auto_7953 ) ) ( not ( = ?auto_7950 ?auto_7961 ) ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7951 ?auto_7961 ) ) ( not ( = ?auto_7953 ?auto_7965 ) ) ( not ( = ?auto_7953 ?auto_7969 ) ) ( not ( = ?auto_7953 ?auto_7964 ) ) ( not ( = ?auto_7967 ?auto_7966 ) ) ( not ( = ?auto_7967 ?auto_7968 ) ) ( not ( = ?auto_7970 ?auto_7963 ) ) ( not ( = ?auto_7970 ?auto_7962 ) ) ( not ( = ?auto_7961 ?auto_7965 ) ) ( not ( = ?auto_7961 ?auto_7969 ) ) ( not ( = ?auto_7961 ?auto_7964 ) ) ( not ( = ?auto_7949 ?auto_7954 ) ) ( not ( = ?auto_7949 ?auto_7959 ) ) ( not ( = ?auto_7950 ?auto_7954 ) ) ( not ( = ?auto_7950 ?auto_7959 ) ) ( not ( = ?auto_7951 ?auto_7954 ) ) ( not ( = ?auto_7951 ?auto_7959 ) ) ( not ( = ?auto_7952 ?auto_7954 ) ) ( not ( = ?auto_7952 ?auto_7959 ) ) ( not ( = ?auto_7954 ?auto_7961 ) ) ( not ( = ?auto_7954 ?auto_7965 ) ) ( not ( = ?auto_7954 ?auto_7969 ) ) ( not ( = ?auto_7954 ?auto_7964 ) ) ( not ( = ?auto_7956 ?auto_7967 ) ) ( not ( = ?auto_7956 ?auto_7966 ) ) ( not ( = ?auto_7956 ?auto_7968 ) ) ( not ( = ?auto_7958 ?auto_7970 ) ) ( not ( = ?auto_7958 ?auto_7963 ) ) ( not ( = ?auto_7958 ?auto_7962 ) ) ( not ( = ?auto_7959 ?auto_7961 ) ) ( not ( = ?auto_7959 ?auto_7965 ) ) ( not ( = ?auto_7959 ?auto_7969 ) ) ( not ( = ?auto_7959 ?auto_7964 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7949 ?auto_7950 ?auto_7951 ?auto_7952 ?auto_7953 )
      ( MAKE-1CRATE ?auto_7953 ?auto_7954 )
      ( MAKE-5CRATE-VERIFY ?auto_7949 ?auto_7950 ?auto_7951 ?auto_7952 ?auto_7953 ?auto_7954 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7988 - SURFACE
      ?auto_7989 - SURFACE
      ?auto_7990 - SURFACE
      ?auto_7991 - SURFACE
      ?auto_7992 - SURFACE
      ?auto_7993 - SURFACE
      ?auto_7994 - SURFACE
    )
    :vars
    (
      ?auto_7996 - HOIST
      ?auto_7999 - PLACE
      ?auto_8000 - PLACE
      ?auto_7998 - HOIST
      ?auto_7997 - SURFACE
      ?auto_8006 - PLACE
      ?auto_8009 - HOIST
      ?auto_8001 - SURFACE
      ?auto_8004 - PLACE
      ?auto_8005 - HOIST
      ?auto_8008 - SURFACE
      ?auto_8011 - PLACE
      ?auto_8010 - HOIST
      ?auto_8003 - SURFACE
      ?auto_8002 - SURFACE
      ?auto_8013 - PLACE
      ?auto_8007 - HOIST
      ?auto_8012 - SURFACE
      ?auto_7995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7996 ?auto_7999 ) ( IS-CRATE ?auto_7994 ) ( not ( = ?auto_8000 ?auto_7999 ) ) ( HOIST-AT ?auto_7998 ?auto_8000 ) ( AVAILABLE ?auto_7998 ) ( SURFACE-AT ?auto_7994 ?auto_8000 ) ( ON ?auto_7994 ?auto_7997 ) ( CLEAR ?auto_7994 ) ( not ( = ?auto_7993 ?auto_7994 ) ) ( not ( = ?auto_7993 ?auto_7997 ) ) ( not ( = ?auto_7994 ?auto_7997 ) ) ( not ( = ?auto_7996 ?auto_7998 ) ) ( IS-CRATE ?auto_7993 ) ( not ( = ?auto_8006 ?auto_7999 ) ) ( HOIST-AT ?auto_8009 ?auto_8006 ) ( AVAILABLE ?auto_8009 ) ( SURFACE-AT ?auto_7993 ?auto_8006 ) ( ON ?auto_7993 ?auto_8001 ) ( CLEAR ?auto_7993 ) ( not ( = ?auto_7992 ?auto_7993 ) ) ( not ( = ?auto_7992 ?auto_8001 ) ) ( not ( = ?auto_7993 ?auto_8001 ) ) ( not ( = ?auto_7996 ?auto_8009 ) ) ( IS-CRATE ?auto_7992 ) ( not ( = ?auto_8004 ?auto_7999 ) ) ( HOIST-AT ?auto_8005 ?auto_8004 ) ( AVAILABLE ?auto_8005 ) ( SURFACE-AT ?auto_7992 ?auto_8004 ) ( ON ?auto_7992 ?auto_8008 ) ( CLEAR ?auto_7992 ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( not ( = ?auto_7991 ?auto_8008 ) ) ( not ( = ?auto_7992 ?auto_8008 ) ) ( not ( = ?auto_7996 ?auto_8005 ) ) ( IS-CRATE ?auto_7991 ) ( not ( = ?auto_8011 ?auto_7999 ) ) ( HOIST-AT ?auto_8010 ?auto_8011 ) ( SURFACE-AT ?auto_7991 ?auto_8011 ) ( ON ?auto_7991 ?auto_8003 ) ( CLEAR ?auto_7991 ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7990 ?auto_8003 ) ) ( not ( = ?auto_7991 ?auto_8003 ) ) ( not ( = ?auto_7996 ?auto_8010 ) ) ( IS-CRATE ?auto_7990 ) ( AVAILABLE ?auto_8010 ) ( SURFACE-AT ?auto_7990 ?auto_8011 ) ( ON ?auto_7990 ?auto_8002 ) ( CLEAR ?auto_7990 ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_8002 ) ) ( not ( = ?auto_7990 ?auto_8002 ) ) ( SURFACE-AT ?auto_7988 ?auto_7999 ) ( CLEAR ?auto_7988 ) ( IS-CRATE ?auto_7989 ) ( AVAILABLE ?auto_7996 ) ( not ( = ?auto_8013 ?auto_7999 ) ) ( HOIST-AT ?auto_8007 ?auto_8013 ) ( AVAILABLE ?auto_8007 ) ( SURFACE-AT ?auto_7989 ?auto_8013 ) ( ON ?auto_7989 ?auto_8012 ) ( CLEAR ?auto_7989 ) ( TRUCK-AT ?auto_7995 ?auto_7999 ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7988 ?auto_8012 ) ) ( not ( = ?auto_7989 ?auto_8012 ) ) ( not ( = ?auto_7996 ?auto_8007 ) ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7988 ?auto_8002 ) ) ( not ( = ?auto_7990 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8013 ) ) ( not ( = ?auto_8010 ?auto_8007 ) ) ( not ( = ?auto_8002 ?auto_8012 ) ) ( not ( = ?auto_7988 ?auto_7991 ) ) ( not ( = ?auto_7988 ?auto_8003 ) ) ( not ( = ?auto_7989 ?auto_7991 ) ) ( not ( = ?auto_7989 ?auto_8003 ) ) ( not ( = ?auto_7991 ?auto_8002 ) ) ( not ( = ?auto_7991 ?auto_8012 ) ) ( not ( = ?auto_8003 ?auto_8002 ) ) ( not ( = ?auto_8003 ?auto_8012 ) ) ( not ( = ?auto_7988 ?auto_7992 ) ) ( not ( = ?auto_7988 ?auto_8008 ) ) ( not ( = ?auto_7989 ?auto_7992 ) ) ( not ( = ?auto_7989 ?auto_8008 ) ) ( not ( = ?auto_7990 ?auto_7992 ) ) ( not ( = ?auto_7990 ?auto_8008 ) ) ( not ( = ?auto_7992 ?auto_8003 ) ) ( not ( = ?auto_7992 ?auto_8002 ) ) ( not ( = ?auto_7992 ?auto_8012 ) ) ( not ( = ?auto_8004 ?auto_8011 ) ) ( not ( = ?auto_8004 ?auto_8013 ) ) ( not ( = ?auto_8005 ?auto_8010 ) ) ( not ( = ?auto_8005 ?auto_8007 ) ) ( not ( = ?auto_8008 ?auto_8003 ) ) ( not ( = ?auto_8008 ?auto_8002 ) ) ( not ( = ?auto_8008 ?auto_8012 ) ) ( not ( = ?auto_7988 ?auto_7993 ) ) ( not ( = ?auto_7988 ?auto_8001 ) ) ( not ( = ?auto_7989 ?auto_7993 ) ) ( not ( = ?auto_7989 ?auto_8001 ) ) ( not ( = ?auto_7990 ?auto_7993 ) ) ( not ( = ?auto_7990 ?auto_8001 ) ) ( not ( = ?auto_7991 ?auto_7993 ) ) ( not ( = ?auto_7991 ?auto_8001 ) ) ( not ( = ?auto_7993 ?auto_8008 ) ) ( not ( = ?auto_7993 ?auto_8003 ) ) ( not ( = ?auto_7993 ?auto_8002 ) ) ( not ( = ?auto_7993 ?auto_8012 ) ) ( not ( = ?auto_8006 ?auto_8004 ) ) ( not ( = ?auto_8006 ?auto_8011 ) ) ( not ( = ?auto_8006 ?auto_8013 ) ) ( not ( = ?auto_8009 ?auto_8005 ) ) ( not ( = ?auto_8009 ?auto_8010 ) ) ( not ( = ?auto_8009 ?auto_8007 ) ) ( not ( = ?auto_8001 ?auto_8008 ) ) ( not ( = ?auto_8001 ?auto_8003 ) ) ( not ( = ?auto_8001 ?auto_8002 ) ) ( not ( = ?auto_8001 ?auto_8012 ) ) ( not ( = ?auto_7988 ?auto_7994 ) ) ( not ( = ?auto_7988 ?auto_7997 ) ) ( not ( = ?auto_7989 ?auto_7994 ) ) ( not ( = ?auto_7989 ?auto_7997 ) ) ( not ( = ?auto_7990 ?auto_7994 ) ) ( not ( = ?auto_7990 ?auto_7997 ) ) ( not ( = ?auto_7991 ?auto_7994 ) ) ( not ( = ?auto_7991 ?auto_7997 ) ) ( not ( = ?auto_7992 ?auto_7994 ) ) ( not ( = ?auto_7992 ?auto_7997 ) ) ( not ( = ?auto_7994 ?auto_8001 ) ) ( not ( = ?auto_7994 ?auto_8008 ) ) ( not ( = ?auto_7994 ?auto_8003 ) ) ( not ( = ?auto_7994 ?auto_8002 ) ) ( not ( = ?auto_7994 ?auto_8012 ) ) ( not ( = ?auto_8000 ?auto_8006 ) ) ( not ( = ?auto_8000 ?auto_8004 ) ) ( not ( = ?auto_8000 ?auto_8011 ) ) ( not ( = ?auto_8000 ?auto_8013 ) ) ( not ( = ?auto_7998 ?auto_8009 ) ) ( not ( = ?auto_7998 ?auto_8005 ) ) ( not ( = ?auto_7998 ?auto_8010 ) ) ( not ( = ?auto_7998 ?auto_8007 ) ) ( not ( = ?auto_7997 ?auto_8001 ) ) ( not ( = ?auto_7997 ?auto_8008 ) ) ( not ( = ?auto_7997 ?auto_8003 ) ) ( not ( = ?auto_7997 ?auto_8002 ) ) ( not ( = ?auto_7997 ?auto_8012 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7988 ?auto_7989 ?auto_7990 ?auto_7991 ?auto_7992 ?auto_7993 )
      ( MAKE-1CRATE ?auto_7993 ?auto_7994 )
      ( MAKE-6CRATE-VERIFY ?auto_7988 ?auto_7989 ?auto_7990 ?auto_7991 ?auto_7992 ?auto_7993 ?auto_7994 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8032 - SURFACE
      ?auto_8033 - SURFACE
      ?auto_8034 - SURFACE
      ?auto_8035 - SURFACE
      ?auto_8036 - SURFACE
      ?auto_8037 - SURFACE
      ?auto_8038 - SURFACE
      ?auto_8039 - SURFACE
    )
    :vars
    (
      ?auto_8040 - HOIST
      ?auto_8041 - PLACE
      ?auto_8042 - PLACE
      ?auto_8045 - HOIST
      ?auto_8043 - SURFACE
      ?auto_8050 - PLACE
      ?auto_8049 - HOIST
      ?auto_8060 - SURFACE
      ?auto_8061 - PLACE
      ?auto_8057 - HOIST
      ?auto_8052 - SURFACE
      ?auto_8054 - PLACE
      ?auto_8056 - HOIST
      ?auto_8047 - SURFACE
      ?auto_8046 - PLACE
      ?auto_8058 - HOIST
      ?auto_8055 - SURFACE
      ?auto_8051 - SURFACE
      ?auto_8048 - PLACE
      ?auto_8059 - HOIST
      ?auto_8053 - SURFACE
      ?auto_8044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8040 ?auto_8041 ) ( IS-CRATE ?auto_8039 ) ( not ( = ?auto_8042 ?auto_8041 ) ) ( HOIST-AT ?auto_8045 ?auto_8042 ) ( AVAILABLE ?auto_8045 ) ( SURFACE-AT ?auto_8039 ?auto_8042 ) ( ON ?auto_8039 ?auto_8043 ) ( CLEAR ?auto_8039 ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8043 ) ) ( not ( = ?auto_8039 ?auto_8043 ) ) ( not ( = ?auto_8040 ?auto_8045 ) ) ( IS-CRATE ?auto_8038 ) ( not ( = ?auto_8050 ?auto_8041 ) ) ( HOIST-AT ?auto_8049 ?auto_8050 ) ( AVAILABLE ?auto_8049 ) ( SURFACE-AT ?auto_8038 ?auto_8050 ) ( ON ?auto_8038 ?auto_8060 ) ( CLEAR ?auto_8038 ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8060 ) ) ( not ( = ?auto_8038 ?auto_8060 ) ) ( not ( = ?auto_8040 ?auto_8049 ) ) ( IS-CRATE ?auto_8037 ) ( not ( = ?auto_8061 ?auto_8041 ) ) ( HOIST-AT ?auto_8057 ?auto_8061 ) ( AVAILABLE ?auto_8057 ) ( SURFACE-AT ?auto_8037 ?auto_8061 ) ( ON ?auto_8037 ?auto_8052 ) ( CLEAR ?auto_8037 ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8052 ) ) ( not ( = ?auto_8037 ?auto_8052 ) ) ( not ( = ?auto_8040 ?auto_8057 ) ) ( IS-CRATE ?auto_8036 ) ( not ( = ?auto_8054 ?auto_8041 ) ) ( HOIST-AT ?auto_8056 ?auto_8054 ) ( AVAILABLE ?auto_8056 ) ( SURFACE-AT ?auto_8036 ?auto_8054 ) ( ON ?auto_8036 ?auto_8047 ) ( CLEAR ?auto_8036 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8047 ) ) ( not ( = ?auto_8036 ?auto_8047 ) ) ( not ( = ?auto_8040 ?auto_8056 ) ) ( IS-CRATE ?auto_8035 ) ( not ( = ?auto_8046 ?auto_8041 ) ) ( HOIST-AT ?auto_8058 ?auto_8046 ) ( SURFACE-AT ?auto_8035 ?auto_8046 ) ( ON ?auto_8035 ?auto_8055 ) ( CLEAR ?auto_8035 ) ( not ( = ?auto_8034 ?auto_8035 ) ) ( not ( = ?auto_8034 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8055 ) ) ( not ( = ?auto_8040 ?auto_8058 ) ) ( IS-CRATE ?auto_8034 ) ( AVAILABLE ?auto_8058 ) ( SURFACE-AT ?auto_8034 ?auto_8046 ) ( ON ?auto_8034 ?auto_8051 ) ( CLEAR ?auto_8034 ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( not ( = ?auto_8033 ?auto_8051 ) ) ( not ( = ?auto_8034 ?auto_8051 ) ) ( SURFACE-AT ?auto_8032 ?auto_8041 ) ( CLEAR ?auto_8032 ) ( IS-CRATE ?auto_8033 ) ( AVAILABLE ?auto_8040 ) ( not ( = ?auto_8048 ?auto_8041 ) ) ( HOIST-AT ?auto_8059 ?auto_8048 ) ( AVAILABLE ?auto_8059 ) ( SURFACE-AT ?auto_8033 ?auto_8048 ) ( ON ?auto_8033 ?auto_8053 ) ( CLEAR ?auto_8033 ) ( TRUCK-AT ?auto_8044 ?auto_8041 ) ( not ( = ?auto_8032 ?auto_8033 ) ) ( not ( = ?auto_8032 ?auto_8053 ) ) ( not ( = ?auto_8033 ?auto_8053 ) ) ( not ( = ?auto_8040 ?auto_8059 ) ) ( not ( = ?auto_8032 ?auto_8034 ) ) ( not ( = ?auto_8032 ?auto_8051 ) ) ( not ( = ?auto_8034 ?auto_8053 ) ) ( not ( = ?auto_8046 ?auto_8048 ) ) ( not ( = ?auto_8058 ?auto_8059 ) ) ( not ( = ?auto_8051 ?auto_8053 ) ) ( not ( = ?auto_8032 ?auto_8035 ) ) ( not ( = ?auto_8032 ?auto_8055 ) ) ( not ( = ?auto_8033 ?auto_8035 ) ) ( not ( = ?auto_8033 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8051 ) ) ( not ( = ?auto_8035 ?auto_8053 ) ) ( not ( = ?auto_8055 ?auto_8051 ) ) ( not ( = ?auto_8055 ?auto_8053 ) ) ( not ( = ?auto_8032 ?auto_8036 ) ) ( not ( = ?auto_8032 ?auto_8047 ) ) ( not ( = ?auto_8033 ?auto_8036 ) ) ( not ( = ?auto_8033 ?auto_8047 ) ) ( not ( = ?auto_8034 ?auto_8036 ) ) ( not ( = ?auto_8034 ?auto_8047 ) ) ( not ( = ?auto_8036 ?auto_8055 ) ) ( not ( = ?auto_8036 ?auto_8051 ) ) ( not ( = ?auto_8036 ?auto_8053 ) ) ( not ( = ?auto_8054 ?auto_8046 ) ) ( not ( = ?auto_8054 ?auto_8048 ) ) ( not ( = ?auto_8056 ?auto_8058 ) ) ( not ( = ?auto_8056 ?auto_8059 ) ) ( not ( = ?auto_8047 ?auto_8055 ) ) ( not ( = ?auto_8047 ?auto_8051 ) ) ( not ( = ?auto_8047 ?auto_8053 ) ) ( not ( = ?auto_8032 ?auto_8037 ) ) ( not ( = ?auto_8032 ?auto_8052 ) ) ( not ( = ?auto_8033 ?auto_8037 ) ) ( not ( = ?auto_8033 ?auto_8052 ) ) ( not ( = ?auto_8034 ?auto_8037 ) ) ( not ( = ?auto_8034 ?auto_8052 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8052 ) ) ( not ( = ?auto_8037 ?auto_8047 ) ) ( not ( = ?auto_8037 ?auto_8055 ) ) ( not ( = ?auto_8037 ?auto_8051 ) ) ( not ( = ?auto_8037 ?auto_8053 ) ) ( not ( = ?auto_8061 ?auto_8054 ) ) ( not ( = ?auto_8061 ?auto_8046 ) ) ( not ( = ?auto_8061 ?auto_8048 ) ) ( not ( = ?auto_8057 ?auto_8056 ) ) ( not ( = ?auto_8057 ?auto_8058 ) ) ( not ( = ?auto_8057 ?auto_8059 ) ) ( not ( = ?auto_8052 ?auto_8047 ) ) ( not ( = ?auto_8052 ?auto_8055 ) ) ( not ( = ?auto_8052 ?auto_8051 ) ) ( not ( = ?auto_8052 ?auto_8053 ) ) ( not ( = ?auto_8032 ?auto_8038 ) ) ( not ( = ?auto_8032 ?auto_8060 ) ) ( not ( = ?auto_8033 ?auto_8038 ) ) ( not ( = ?auto_8033 ?auto_8060 ) ) ( not ( = ?auto_8034 ?auto_8038 ) ) ( not ( = ?auto_8034 ?auto_8060 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8035 ?auto_8060 ) ) ( not ( = ?auto_8036 ?auto_8038 ) ) ( not ( = ?auto_8036 ?auto_8060 ) ) ( not ( = ?auto_8038 ?auto_8052 ) ) ( not ( = ?auto_8038 ?auto_8047 ) ) ( not ( = ?auto_8038 ?auto_8055 ) ) ( not ( = ?auto_8038 ?auto_8051 ) ) ( not ( = ?auto_8038 ?auto_8053 ) ) ( not ( = ?auto_8050 ?auto_8061 ) ) ( not ( = ?auto_8050 ?auto_8054 ) ) ( not ( = ?auto_8050 ?auto_8046 ) ) ( not ( = ?auto_8050 ?auto_8048 ) ) ( not ( = ?auto_8049 ?auto_8057 ) ) ( not ( = ?auto_8049 ?auto_8056 ) ) ( not ( = ?auto_8049 ?auto_8058 ) ) ( not ( = ?auto_8049 ?auto_8059 ) ) ( not ( = ?auto_8060 ?auto_8052 ) ) ( not ( = ?auto_8060 ?auto_8047 ) ) ( not ( = ?auto_8060 ?auto_8055 ) ) ( not ( = ?auto_8060 ?auto_8051 ) ) ( not ( = ?auto_8060 ?auto_8053 ) ) ( not ( = ?auto_8032 ?auto_8039 ) ) ( not ( = ?auto_8032 ?auto_8043 ) ) ( not ( = ?auto_8033 ?auto_8039 ) ) ( not ( = ?auto_8033 ?auto_8043 ) ) ( not ( = ?auto_8034 ?auto_8039 ) ) ( not ( = ?auto_8034 ?auto_8043 ) ) ( not ( = ?auto_8035 ?auto_8039 ) ) ( not ( = ?auto_8035 ?auto_8043 ) ) ( not ( = ?auto_8036 ?auto_8039 ) ) ( not ( = ?auto_8036 ?auto_8043 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8037 ?auto_8043 ) ) ( not ( = ?auto_8039 ?auto_8060 ) ) ( not ( = ?auto_8039 ?auto_8052 ) ) ( not ( = ?auto_8039 ?auto_8047 ) ) ( not ( = ?auto_8039 ?auto_8055 ) ) ( not ( = ?auto_8039 ?auto_8051 ) ) ( not ( = ?auto_8039 ?auto_8053 ) ) ( not ( = ?auto_8042 ?auto_8050 ) ) ( not ( = ?auto_8042 ?auto_8061 ) ) ( not ( = ?auto_8042 ?auto_8054 ) ) ( not ( = ?auto_8042 ?auto_8046 ) ) ( not ( = ?auto_8042 ?auto_8048 ) ) ( not ( = ?auto_8045 ?auto_8049 ) ) ( not ( = ?auto_8045 ?auto_8057 ) ) ( not ( = ?auto_8045 ?auto_8056 ) ) ( not ( = ?auto_8045 ?auto_8058 ) ) ( not ( = ?auto_8045 ?auto_8059 ) ) ( not ( = ?auto_8043 ?auto_8060 ) ) ( not ( = ?auto_8043 ?auto_8052 ) ) ( not ( = ?auto_8043 ?auto_8047 ) ) ( not ( = ?auto_8043 ?auto_8055 ) ) ( not ( = ?auto_8043 ?auto_8051 ) ) ( not ( = ?auto_8043 ?auto_8053 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8032 ?auto_8033 ?auto_8034 ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 )
      ( MAKE-1CRATE ?auto_8038 ?auto_8039 )
      ( MAKE-7CRATE-VERIFY ?auto_8032 ?auto_8033 ?auto_8034 ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8081 - SURFACE
      ?auto_8082 - SURFACE
      ?auto_8083 - SURFACE
      ?auto_8084 - SURFACE
      ?auto_8085 - SURFACE
      ?auto_8086 - SURFACE
      ?auto_8087 - SURFACE
      ?auto_8088 - SURFACE
      ?auto_8089 - SURFACE
    )
    :vars
    (
      ?auto_8092 - HOIST
      ?auto_8094 - PLACE
      ?auto_8090 - PLACE
      ?auto_8093 - HOIST
      ?auto_8095 - SURFACE
      ?auto_8112 - PLACE
      ?auto_8100 - HOIST
      ?auto_8105 - SURFACE
      ?auto_8103 - SURFACE
      ?auto_8108 - PLACE
      ?auto_8110 - HOIST
      ?auto_8098 - SURFACE
      ?auto_8096 - PLACE
      ?auto_8109 - HOIST
      ?auto_8102 - SURFACE
      ?auto_8107 - PLACE
      ?auto_8111 - HOIST
      ?auto_8101 - SURFACE
      ?auto_8099 - SURFACE
      ?auto_8106 - PLACE
      ?auto_8104 - HOIST
      ?auto_8097 - SURFACE
      ?auto_8091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8092 ?auto_8094 ) ( IS-CRATE ?auto_8089 ) ( not ( = ?auto_8090 ?auto_8094 ) ) ( HOIST-AT ?auto_8093 ?auto_8090 ) ( SURFACE-AT ?auto_8089 ?auto_8090 ) ( ON ?auto_8089 ?auto_8095 ) ( CLEAR ?auto_8089 ) ( not ( = ?auto_8088 ?auto_8089 ) ) ( not ( = ?auto_8088 ?auto_8095 ) ) ( not ( = ?auto_8089 ?auto_8095 ) ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( IS-CRATE ?auto_8088 ) ( not ( = ?auto_8112 ?auto_8094 ) ) ( HOIST-AT ?auto_8100 ?auto_8112 ) ( AVAILABLE ?auto_8100 ) ( SURFACE-AT ?auto_8088 ?auto_8112 ) ( ON ?auto_8088 ?auto_8105 ) ( CLEAR ?auto_8088 ) ( not ( = ?auto_8087 ?auto_8088 ) ) ( not ( = ?auto_8087 ?auto_8105 ) ) ( not ( = ?auto_8088 ?auto_8105 ) ) ( not ( = ?auto_8092 ?auto_8100 ) ) ( IS-CRATE ?auto_8087 ) ( AVAILABLE ?auto_8093 ) ( SURFACE-AT ?auto_8087 ?auto_8090 ) ( ON ?auto_8087 ?auto_8103 ) ( CLEAR ?auto_8087 ) ( not ( = ?auto_8086 ?auto_8087 ) ) ( not ( = ?auto_8086 ?auto_8103 ) ) ( not ( = ?auto_8087 ?auto_8103 ) ) ( IS-CRATE ?auto_8086 ) ( not ( = ?auto_8108 ?auto_8094 ) ) ( HOIST-AT ?auto_8110 ?auto_8108 ) ( AVAILABLE ?auto_8110 ) ( SURFACE-AT ?auto_8086 ?auto_8108 ) ( ON ?auto_8086 ?auto_8098 ) ( CLEAR ?auto_8086 ) ( not ( = ?auto_8085 ?auto_8086 ) ) ( not ( = ?auto_8085 ?auto_8098 ) ) ( not ( = ?auto_8086 ?auto_8098 ) ) ( not ( = ?auto_8092 ?auto_8110 ) ) ( IS-CRATE ?auto_8085 ) ( not ( = ?auto_8096 ?auto_8094 ) ) ( HOIST-AT ?auto_8109 ?auto_8096 ) ( AVAILABLE ?auto_8109 ) ( SURFACE-AT ?auto_8085 ?auto_8096 ) ( ON ?auto_8085 ?auto_8102 ) ( CLEAR ?auto_8085 ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( not ( = ?auto_8084 ?auto_8102 ) ) ( not ( = ?auto_8085 ?auto_8102 ) ) ( not ( = ?auto_8092 ?auto_8109 ) ) ( IS-CRATE ?auto_8084 ) ( not ( = ?auto_8107 ?auto_8094 ) ) ( HOIST-AT ?auto_8111 ?auto_8107 ) ( SURFACE-AT ?auto_8084 ?auto_8107 ) ( ON ?auto_8084 ?auto_8101 ) ( CLEAR ?auto_8084 ) ( not ( = ?auto_8083 ?auto_8084 ) ) ( not ( = ?auto_8083 ?auto_8101 ) ) ( not ( = ?auto_8084 ?auto_8101 ) ) ( not ( = ?auto_8092 ?auto_8111 ) ) ( IS-CRATE ?auto_8083 ) ( AVAILABLE ?auto_8111 ) ( SURFACE-AT ?auto_8083 ?auto_8107 ) ( ON ?auto_8083 ?auto_8099 ) ( CLEAR ?auto_8083 ) ( not ( = ?auto_8082 ?auto_8083 ) ) ( not ( = ?auto_8082 ?auto_8099 ) ) ( not ( = ?auto_8083 ?auto_8099 ) ) ( SURFACE-AT ?auto_8081 ?auto_8094 ) ( CLEAR ?auto_8081 ) ( IS-CRATE ?auto_8082 ) ( AVAILABLE ?auto_8092 ) ( not ( = ?auto_8106 ?auto_8094 ) ) ( HOIST-AT ?auto_8104 ?auto_8106 ) ( AVAILABLE ?auto_8104 ) ( SURFACE-AT ?auto_8082 ?auto_8106 ) ( ON ?auto_8082 ?auto_8097 ) ( CLEAR ?auto_8082 ) ( TRUCK-AT ?auto_8091 ?auto_8094 ) ( not ( = ?auto_8081 ?auto_8082 ) ) ( not ( = ?auto_8081 ?auto_8097 ) ) ( not ( = ?auto_8082 ?auto_8097 ) ) ( not ( = ?auto_8092 ?auto_8104 ) ) ( not ( = ?auto_8081 ?auto_8083 ) ) ( not ( = ?auto_8081 ?auto_8099 ) ) ( not ( = ?auto_8083 ?auto_8097 ) ) ( not ( = ?auto_8107 ?auto_8106 ) ) ( not ( = ?auto_8111 ?auto_8104 ) ) ( not ( = ?auto_8099 ?auto_8097 ) ) ( not ( = ?auto_8081 ?auto_8084 ) ) ( not ( = ?auto_8081 ?auto_8101 ) ) ( not ( = ?auto_8082 ?auto_8084 ) ) ( not ( = ?auto_8082 ?auto_8101 ) ) ( not ( = ?auto_8084 ?auto_8099 ) ) ( not ( = ?auto_8084 ?auto_8097 ) ) ( not ( = ?auto_8101 ?auto_8099 ) ) ( not ( = ?auto_8101 ?auto_8097 ) ) ( not ( = ?auto_8081 ?auto_8085 ) ) ( not ( = ?auto_8081 ?auto_8102 ) ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( not ( = ?auto_8082 ?auto_8102 ) ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( not ( = ?auto_8083 ?auto_8102 ) ) ( not ( = ?auto_8085 ?auto_8101 ) ) ( not ( = ?auto_8085 ?auto_8099 ) ) ( not ( = ?auto_8085 ?auto_8097 ) ) ( not ( = ?auto_8096 ?auto_8107 ) ) ( not ( = ?auto_8096 ?auto_8106 ) ) ( not ( = ?auto_8109 ?auto_8111 ) ) ( not ( = ?auto_8109 ?auto_8104 ) ) ( not ( = ?auto_8102 ?auto_8101 ) ) ( not ( = ?auto_8102 ?auto_8099 ) ) ( not ( = ?auto_8102 ?auto_8097 ) ) ( not ( = ?auto_8081 ?auto_8086 ) ) ( not ( = ?auto_8081 ?auto_8098 ) ) ( not ( = ?auto_8082 ?auto_8086 ) ) ( not ( = ?auto_8082 ?auto_8098 ) ) ( not ( = ?auto_8083 ?auto_8086 ) ) ( not ( = ?auto_8083 ?auto_8098 ) ) ( not ( = ?auto_8084 ?auto_8086 ) ) ( not ( = ?auto_8084 ?auto_8098 ) ) ( not ( = ?auto_8086 ?auto_8102 ) ) ( not ( = ?auto_8086 ?auto_8101 ) ) ( not ( = ?auto_8086 ?auto_8099 ) ) ( not ( = ?auto_8086 ?auto_8097 ) ) ( not ( = ?auto_8108 ?auto_8096 ) ) ( not ( = ?auto_8108 ?auto_8107 ) ) ( not ( = ?auto_8108 ?auto_8106 ) ) ( not ( = ?auto_8110 ?auto_8109 ) ) ( not ( = ?auto_8110 ?auto_8111 ) ) ( not ( = ?auto_8110 ?auto_8104 ) ) ( not ( = ?auto_8098 ?auto_8102 ) ) ( not ( = ?auto_8098 ?auto_8101 ) ) ( not ( = ?auto_8098 ?auto_8099 ) ) ( not ( = ?auto_8098 ?auto_8097 ) ) ( not ( = ?auto_8081 ?auto_8087 ) ) ( not ( = ?auto_8081 ?auto_8103 ) ) ( not ( = ?auto_8082 ?auto_8087 ) ) ( not ( = ?auto_8082 ?auto_8103 ) ) ( not ( = ?auto_8083 ?auto_8087 ) ) ( not ( = ?auto_8083 ?auto_8103 ) ) ( not ( = ?auto_8084 ?auto_8087 ) ) ( not ( = ?auto_8084 ?auto_8103 ) ) ( not ( = ?auto_8085 ?auto_8087 ) ) ( not ( = ?auto_8085 ?auto_8103 ) ) ( not ( = ?auto_8087 ?auto_8098 ) ) ( not ( = ?auto_8087 ?auto_8102 ) ) ( not ( = ?auto_8087 ?auto_8101 ) ) ( not ( = ?auto_8087 ?auto_8099 ) ) ( not ( = ?auto_8087 ?auto_8097 ) ) ( not ( = ?auto_8090 ?auto_8108 ) ) ( not ( = ?auto_8090 ?auto_8096 ) ) ( not ( = ?auto_8090 ?auto_8107 ) ) ( not ( = ?auto_8090 ?auto_8106 ) ) ( not ( = ?auto_8093 ?auto_8110 ) ) ( not ( = ?auto_8093 ?auto_8109 ) ) ( not ( = ?auto_8093 ?auto_8111 ) ) ( not ( = ?auto_8093 ?auto_8104 ) ) ( not ( = ?auto_8103 ?auto_8098 ) ) ( not ( = ?auto_8103 ?auto_8102 ) ) ( not ( = ?auto_8103 ?auto_8101 ) ) ( not ( = ?auto_8103 ?auto_8099 ) ) ( not ( = ?auto_8103 ?auto_8097 ) ) ( not ( = ?auto_8081 ?auto_8088 ) ) ( not ( = ?auto_8081 ?auto_8105 ) ) ( not ( = ?auto_8082 ?auto_8088 ) ) ( not ( = ?auto_8082 ?auto_8105 ) ) ( not ( = ?auto_8083 ?auto_8088 ) ) ( not ( = ?auto_8083 ?auto_8105 ) ) ( not ( = ?auto_8084 ?auto_8088 ) ) ( not ( = ?auto_8084 ?auto_8105 ) ) ( not ( = ?auto_8085 ?auto_8088 ) ) ( not ( = ?auto_8085 ?auto_8105 ) ) ( not ( = ?auto_8086 ?auto_8088 ) ) ( not ( = ?auto_8086 ?auto_8105 ) ) ( not ( = ?auto_8088 ?auto_8103 ) ) ( not ( = ?auto_8088 ?auto_8098 ) ) ( not ( = ?auto_8088 ?auto_8102 ) ) ( not ( = ?auto_8088 ?auto_8101 ) ) ( not ( = ?auto_8088 ?auto_8099 ) ) ( not ( = ?auto_8088 ?auto_8097 ) ) ( not ( = ?auto_8112 ?auto_8090 ) ) ( not ( = ?auto_8112 ?auto_8108 ) ) ( not ( = ?auto_8112 ?auto_8096 ) ) ( not ( = ?auto_8112 ?auto_8107 ) ) ( not ( = ?auto_8112 ?auto_8106 ) ) ( not ( = ?auto_8100 ?auto_8093 ) ) ( not ( = ?auto_8100 ?auto_8110 ) ) ( not ( = ?auto_8100 ?auto_8109 ) ) ( not ( = ?auto_8100 ?auto_8111 ) ) ( not ( = ?auto_8100 ?auto_8104 ) ) ( not ( = ?auto_8105 ?auto_8103 ) ) ( not ( = ?auto_8105 ?auto_8098 ) ) ( not ( = ?auto_8105 ?auto_8102 ) ) ( not ( = ?auto_8105 ?auto_8101 ) ) ( not ( = ?auto_8105 ?auto_8099 ) ) ( not ( = ?auto_8105 ?auto_8097 ) ) ( not ( = ?auto_8081 ?auto_8089 ) ) ( not ( = ?auto_8081 ?auto_8095 ) ) ( not ( = ?auto_8082 ?auto_8089 ) ) ( not ( = ?auto_8082 ?auto_8095 ) ) ( not ( = ?auto_8083 ?auto_8089 ) ) ( not ( = ?auto_8083 ?auto_8095 ) ) ( not ( = ?auto_8084 ?auto_8089 ) ) ( not ( = ?auto_8084 ?auto_8095 ) ) ( not ( = ?auto_8085 ?auto_8089 ) ) ( not ( = ?auto_8085 ?auto_8095 ) ) ( not ( = ?auto_8086 ?auto_8089 ) ) ( not ( = ?auto_8086 ?auto_8095 ) ) ( not ( = ?auto_8087 ?auto_8089 ) ) ( not ( = ?auto_8087 ?auto_8095 ) ) ( not ( = ?auto_8089 ?auto_8105 ) ) ( not ( = ?auto_8089 ?auto_8103 ) ) ( not ( = ?auto_8089 ?auto_8098 ) ) ( not ( = ?auto_8089 ?auto_8102 ) ) ( not ( = ?auto_8089 ?auto_8101 ) ) ( not ( = ?auto_8089 ?auto_8099 ) ) ( not ( = ?auto_8089 ?auto_8097 ) ) ( not ( = ?auto_8095 ?auto_8105 ) ) ( not ( = ?auto_8095 ?auto_8103 ) ) ( not ( = ?auto_8095 ?auto_8098 ) ) ( not ( = ?auto_8095 ?auto_8102 ) ) ( not ( = ?auto_8095 ?auto_8101 ) ) ( not ( = ?auto_8095 ?auto_8099 ) ) ( not ( = ?auto_8095 ?auto_8097 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8081 ?auto_8082 ?auto_8083 ?auto_8084 ?auto_8085 ?auto_8086 ?auto_8087 ?auto_8088 )
      ( MAKE-1CRATE ?auto_8088 ?auto_8089 )
      ( MAKE-8CRATE-VERIFY ?auto_8081 ?auto_8082 ?auto_8083 ?auto_8084 ?auto_8085 ?auto_8086 ?auto_8087 ?auto_8088 ?auto_8089 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8133 - SURFACE
      ?auto_8134 - SURFACE
      ?auto_8135 - SURFACE
      ?auto_8136 - SURFACE
      ?auto_8137 - SURFACE
      ?auto_8138 - SURFACE
      ?auto_8139 - SURFACE
      ?auto_8140 - SURFACE
      ?auto_8141 - SURFACE
      ?auto_8142 - SURFACE
    )
    :vars
    (
      ?auto_8146 - HOIST
      ?auto_8148 - PLACE
      ?auto_8147 - PLACE
      ?auto_8143 - HOIST
      ?auto_8144 - SURFACE
      ?auto_8158 - PLACE
      ?auto_8160 - HOIST
      ?auto_8159 - SURFACE
      ?auto_8152 - PLACE
      ?auto_8164 - HOIST
      ?auto_8157 - SURFACE
      ?auto_8165 - SURFACE
      ?auto_8153 - PLACE
      ?auto_8155 - HOIST
      ?auto_8150 - SURFACE
      ?auto_8162 - PLACE
      ?auto_8167 - HOIST
      ?auto_8151 - SURFACE
      ?auto_8161 - PLACE
      ?auto_8163 - HOIST
      ?auto_8149 - SURFACE
      ?auto_8166 - SURFACE
      ?auto_8156 - PLACE
      ?auto_8168 - HOIST
      ?auto_8154 - SURFACE
      ?auto_8145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8146 ?auto_8148 ) ( IS-CRATE ?auto_8142 ) ( not ( = ?auto_8147 ?auto_8148 ) ) ( HOIST-AT ?auto_8143 ?auto_8147 ) ( AVAILABLE ?auto_8143 ) ( SURFACE-AT ?auto_8142 ?auto_8147 ) ( ON ?auto_8142 ?auto_8144 ) ( CLEAR ?auto_8142 ) ( not ( = ?auto_8141 ?auto_8142 ) ) ( not ( = ?auto_8141 ?auto_8144 ) ) ( not ( = ?auto_8142 ?auto_8144 ) ) ( not ( = ?auto_8146 ?auto_8143 ) ) ( IS-CRATE ?auto_8141 ) ( not ( = ?auto_8158 ?auto_8148 ) ) ( HOIST-AT ?auto_8160 ?auto_8158 ) ( SURFACE-AT ?auto_8141 ?auto_8158 ) ( ON ?auto_8141 ?auto_8159 ) ( CLEAR ?auto_8141 ) ( not ( = ?auto_8140 ?auto_8141 ) ) ( not ( = ?auto_8140 ?auto_8159 ) ) ( not ( = ?auto_8141 ?auto_8159 ) ) ( not ( = ?auto_8146 ?auto_8160 ) ) ( IS-CRATE ?auto_8140 ) ( not ( = ?auto_8152 ?auto_8148 ) ) ( HOIST-AT ?auto_8164 ?auto_8152 ) ( AVAILABLE ?auto_8164 ) ( SURFACE-AT ?auto_8140 ?auto_8152 ) ( ON ?auto_8140 ?auto_8157 ) ( CLEAR ?auto_8140 ) ( not ( = ?auto_8139 ?auto_8140 ) ) ( not ( = ?auto_8139 ?auto_8157 ) ) ( not ( = ?auto_8140 ?auto_8157 ) ) ( not ( = ?auto_8146 ?auto_8164 ) ) ( IS-CRATE ?auto_8139 ) ( AVAILABLE ?auto_8160 ) ( SURFACE-AT ?auto_8139 ?auto_8158 ) ( ON ?auto_8139 ?auto_8165 ) ( CLEAR ?auto_8139 ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8138 ?auto_8165 ) ) ( not ( = ?auto_8139 ?auto_8165 ) ) ( IS-CRATE ?auto_8138 ) ( not ( = ?auto_8153 ?auto_8148 ) ) ( HOIST-AT ?auto_8155 ?auto_8153 ) ( AVAILABLE ?auto_8155 ) ( SURFACE-AT ?auto_8138 ?auto_8153 ) ( ON ?auto_8138 ?auto_8150 ) ( CLEAR ?auto_8138 ) ( not ( = ?auto_8137 ?auto_8138 ) ) ( not ( = ?auto_8137 ?auto_8150 ) ) ( not ( = ?auto_8138 ?auto_8150 ) ) ( not ( = ?auto_8146 ?auto_8155 ) ) ( IS-CRATE ?auto_8137 ) ( not ( = ?auto_8162 ?auto_8148 ) ) ( HOIST-AT ?auto_8167 ?auto_8162 ) ( AVAILABLE ?auto_8167 ) ( SURFACE-AT ?auto_8137 ?auto_8162 ) ( ON ?auto_8137 ?auto_8151 ) ( CLEAR ?auto_8137 ) ( not ( = ?auto_8136 ?auto_8137 ) ) ( not ( = ?auto_8136 ?auto_8151 ) ) ( not ( = ?auto_8137 ?auto_8151 ) ) ( not ( = ?auto_8146 ?auto_8167 ) ) ( IS-CRATE ?auto_8136 ) ( not ( = ?auto_8161 ?auto_8148 ) ) ( HOIST-AT ?auto_8163 ?auto_8161 ) ( SURFACE-AT ?auto_8136 ?auto_8161 ) ( ON ?auto_8136 ?auto_8149 ) ( CLEAR ?auto_8136 ) ( not ( = ?auto_8135 ?auto_8136 ) ) ( not ( = ?auto_8135 ?auto_8149 ) ) ( not ( = ?auto_8136 ?auto_8149 ) ) ( not ( = ?auto_8146 ?auto_8163 ) ) ( IS-CRATE ?auto_8135 ) ( AVAILABLE ?auto_8163 ) ( SURFACE-AT ?auto_8135 ?auto_8161 ) ( ON ?auto_8135 ?auto_8166 ) ( CLEAR ?auto_8135 ) ( not ( = ?auto_8134 ?auto_8135 ) ) ( not ( = ?auto_8134 ?auto_8166 ) ) ( not ( = ?auto_8135 ?auto_8166 ) ) ( SURFACE-AT ?auto_8133 ?auto_8148 ) ( CLEAR ?auto_8133 ) ( IS-CRATE ?auto_8134 ) ( AVAILABLE ?auto_8146 ) ( not ( = ?auto_8156 ?auto_8148 ) ) ( HOIST-AT ?auto_8168 ?auto_8156 ) ( AVAILABLE ?auto_8168 ) ( SURFACE-AT ?auto_8134 ?auto_8156 ) ( ON ?auto_8134 ?auto_8154 ) ( CLEAR ?auto_8134 ) ( TRUCK-AT ?auto_8145 ?auto_8148 ) ( not ( = ?auto_8133 ?auto_8134 ) ) ( not ( = ?auto_8133 ?auto_8154 ) ) ( not ( = ?auto_8134 ?auto_8154 ) ) ( not ( = ?auto_8146 ?auto_8168 ) ) ( not ( = ?auto_8133 ?auto_8135 ) ) ( not ( = ?auto_8133 ?auto_8166 ) ) ( not ( = ?auto_8135 ?auto_8154 ) ) ( not ( = ?auto_8161 ?auto_8156 ) ) ( not ( = ?auto_8163 ?auto_8168 ) ) ( not ( = ?auto_8166 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8136 ) ) ( not ( = ?auto_8133 ?auto_8149 ) ) ( not ( = ?auto_8134 ?auto_8136 ) ) ( not ( = ?auto_8134 ?auto_8149 ) ) ( not ( = ?auto_8136 ?auto_8166 ) ) ( not ( = ?auto_8136 ?auto_8154 ) ) ( not ( = ?auto_8149 ?auto_8166 ) ) ( not ( = ?auto_8149 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8137 ) ) ( not ( = ?auto_8133 ?auto_8151 ) ) ( not ( = ?auto_8134 ?auto_8137 ) ) ( not ( = ?auto_8134 ?auto_8151 ) ) ( not ( = ?auto_8135 ?auto_8137 ) ) ( not ( = ?auto_8135 ?auto_8151 ) ) ( not ( = ?auto_8137 ?auto_8149 ) ) ( not ( = ?auto_8137 ?auto_8166 ) ) ( not ( = ?auto_8137 ?auto_8154 ) ) ( not ( = ?auto_8162 ?auto_8161 ) ) ( not ( = ?auto_8162 ?auto_8156 ) ) ( not ( = ?auto_8167 ?auto_8163 ) ) ( not ( = ?auto_8167 ?auto_8168 ) ) ( not ( = ?auto_8151 ?auto_8149 ) ) ( not ( = ?auto_8151 ?auto_8166 ) ) ( not ( = ?auto_8151 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8138 ) ) ( not ( = ?auto_8133 ?auto_8150 ) ) ( not ( = ?auto_8134 ?auto_8138 ) ) ( not ( = ?auto_8134 ?auto_8150 ) ) ( not ( = ?auto_8135 ?auto_8138 ) ) ( not ( = ?auto_8135 ?auto_8150 ) ) ( not ( = ?auto_8136 ?auto_8138 ) ) ( not ( = ?auto_8136 ?auto_8150 ) ) ( not ( = ?auto_8138 ?auto_8151 ) ) ( not ( = ?auto_8138 ?auto_8149 ) ) ( not ( = ?auto_8138 ?auto_8166 ) ) ( not ( = ?auto_8138 ?auto_8154 ) ) ( not ( = ?auto_8153 ?auto_8162 ) ) ( not ( = ?auto_8153 ?auto_8161 ) ) ( not ( = ?auto_8153 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8167 ) ) ( not ( = ?auto_8155 ?auto_8163 ) ) ( not ( = ?auto_8155 ?auto_8168 ) ) ( not ( = ?auto_8150 ?auto_8151 ) ) ( not ( = ?auto_8150 ?auto_8149 ) ) ( not ( = ?auto_8150 ?auto_8166 ) ) ( not ( = ?auto_8150 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8139 ) ) ( not ( = ?auto_8133 ?auto_8165 ) ) ( not ( = ?auto_8134 ?auto_8139 ) ) ( not ( = ?auto_8134 ?auto_8165 ) ) ( not ( = ?auto_8135 ?auto_8139 ) ) ( not ( = ?auto_8135 ?auto_8165 ) ) ( not ( = ?auto_8136 ?auto_8139 ) ) ( not ( = ?auto_8136 ?auto_8165 ) ) ( not ( = ?auto_8137 ?auto_8139 ) ) ( not ( = ?auto_8137 ?auto_8165 ) ) ( not ( = ?auto_8139 ?auto_8150 ) ) ( not ( = ?auto_8139 ?auto_8151 ) ) ( not ( = ?auto_8139 ?auto_8149 ) ) ( not ( = ?auto_8139 ?auto_8166 ) ) ( not ( = ?auto_8139 ?auto_8154 ) ) ( not ( = ?auto_8158 ?auto_8153 ) ) ( not ( = ?auto_8158 ?auto_8162 ) ) ( not ( = ?auto_8158 ?auto_8161 ) ) ( not ( = ?auto_8158 ?auto_8156 ) ) ( not ( = ?auto_8160 ?auto_8155 ) ) ( not ( = ?auto_8160 ?auto_8167 ) ) ( not ( = ?auto_8160 ?auto_8163 ) ) ( not ( = ?auto_8160 ?auto_8168 ) ) ( not ( = ?auto_8165 ?auto_8150 ) ) ( not ( = ?auto_8165 ?auto_8151 ) ) ( not ( = ?auto_8165 ?auto_8149 ) ) ( not ( = ?auto_8165 ?auto_8166 ) ) ( not ( = ?auto_8165 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8140 ) ) ( not ( = ?auto_8133 ?auto_8157 ) ) ( not ( = ?auto_8134 ?auto_8140 ) ) ( not ( = ?auto_8134 ?auto_8157 ) ) ( not ( = ?auto_8135 ?auto_8140 ) ) ( not ( = ?auto_8135 ?auto_8157 ) ) ( not ( = ?auto_8136 ?auto_8140 ) ) ( not ( = ?auto_8136 ?auto_8157 ) ) ( not ( = ?auto_8137 ?auto_8140 ) ) ( not ( = ?auto_8137 ?auto_8157 ) ) ( not ( = ?auto_8138 ?auto_8140 ) ) ( not ( = ?auto_8138 ?auto_8157 ) ) ( not ( = ?auto_8140 ?auto_8165 ) ) ( not ( = ?auto_8140 ?auto_8150 ) ) ( not ( = ?auto_8140 ?auto_8151 ) ) ( not ( = ?auto_8140 ?auto_8149 ) ) ( not ( = ?auto_8140 ?auto_8166 ) ) ( not ( = ?auto_8140 ?auto_8154 ) ) ( not ( = ?auto_8152 ?auto_8158 ) ) ( not ( = ?auto_8152 ?auto_8153 ) ) ( not ( = ?auto_8152 ?auto_8162 ) ) ( not ( = ?auto_8152 ?auto_8161 ) ) ( not ( = ?auto_8152 ?auto_8156 ) ) ( not ( = ?auto_8164 ?auto_8160 ) ) ( not ( = ?auto_8164 ?auto_8155 ) ) ( not ( = ?auto_8164 ?auto_8167 ) ) ( not ( = ?auto_8164 ?auto_8163 ) ) ( not ( = ?auto_8164 ?auto_8168 ) ) ( not ( = ?auto_8157 ?auto_8165 ) ) ( not ( = ?auto_8157 ?auto_8150 ) ) ( not ( = ?auto_8157 ?auto_8151 ) ) ( not ( = ?auto_8157 ?auto_8149 ) ) ( not ( = ?auto_8157 ?auto_8166 ) ) ( not ( = ?auto_8157 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8141 ) ) ( not ( = ?auto_8133 ?auto_8159 ) ) ( not ( = ?auto_8134 ?auto_8141 ) ) ( not ( = ?auto_8134 ?auto_8159 ) ) ( not ( = ?auto_8135 ?auto_8141 ) ) ( not ( = ?auto_8135 ?auto_8159 ) ) ( not ( = ?auto_8136 ?auto_8141 ) ) ( not ( = ?auto_8136 ?auto_8159 ) ) ( not ( = ?auto_8137 ?auto_8141 ) ) ( not ( = ?auto_8137 ?auto_8159 ) ) ( not ( = ?auto_8138 ?auto_8141 ) ) ( not ( = ?auto_8138 ?auto_8159 ) ) ( not ( = ?auto_8139 ?auto_8141 ) ) ( not ( = ?auto_8139 ?auto_8159 ) ) ( not ( = ?auto_8141 ?auto_8157 ) ) ( not ( = ?auto_8141 ?auto_8165 ) ) ( not ( = ?auto_8141 ?auto_8150 ) ) ( not ( = ?auto_8141 ?auto_8151 ) ) ( not ( = ?auto_8141 ?auto_8149 ) ) ( not ( = ?auto_8141 ?auto_8166 ) ) ( not ( = ?auto_8141 ?auto_8154 ) ) ( not ( = ?auto_8159 ?auto_8157 ) ) ( not ( = ?auto_8159 ?auto_8165 ) ) ( not ( = ?auto_8159 ?auto_8150 ) ) ( not ( = ?auto_8159 ?auto_8151 ) ) ( not ( = ?auto_8159 ?auto_8149 ) ) ( not ( = ?auto_8159 ?auto_8166 ) ) ( not ( = ?auto_8159 ?auto_8154 ) ) ( not ( = ?auto_8133 ?auto_8142 ) ) ( not ( = ?auto_8133 ?auto_8144 ) ) ( not ( = ?auto_8134 ?auto_8142 ) ) ( not ( = ?auto_8134 ?auto_8144 ) ) ( not ( = ?auto_8135 ?auto_8142 ) ) ( not ( = ?auto_8135 ?auto_8144 ) ) ( not ( = ?auto_8136 ?auto_8142 ) ) ( not ( = ?auto_8136 ?auto_8144 ) ) ( not ( = ?auto_8137 ?auto_8142 ) ) ( not ( = ?auto_8137 ?auto_8144 ) ) ( not ( = ?auto_8138 ?auto_8142 ) ) ( not ( = ?auto_8138 ?auto_8144 ) ) ( not ( = ?auto_8139 ?auto_8142 ) ) ( not ( = ?auto_8139 ?auto_8144 ) ) ( not ( = ?auto_8140 ?auto_8142 ) ) ( not ( = ?auto_8140 ?auto_8144 ) ) ( not ( = ?auto_8142 ?auto_8159 ) ) ( not ( = ?auto_8142 ?auto_8157 ) ) ( not ( = ?auto_8142 ?auto_8165 ) ) ( not ( = ?auto_8142 ?auto_8150 ) ) ( not ( = ?auto_8142 ?auto_8151 ) ) ( not ( = ?auto_8142 ?auto_8149 ) ) ( not ( = ?auto_8142 ?auto_8166 ) ) ( not ( = ?auto_8142 ?auto_8154 ) ) ( not ( = ?auto_8147 ?auto_8158 ) ) ( not ( = ?auto_8147 ?auto_8152 ) ) ( not ( = ?auto_8147 ?auto_8153 ) ) ( not ( = ?auto_8147 ?auto_8162 ) ) ( not ( = ?auto_8147 ?auto_8161 ) ) ( not ( = ?auto_8147 ?auto_8156 ) ) ( not ( = ?auto_8143 ?auto_8160 ) ) ( not ( = ?auto_8143 ?auto_8164 ) ) ( not ( = ?auto_8143 ?auto_8155 ) ) ( not ( = ?auto_8143 ?auto_8167 ) ) ( not ( = ?auto_8143 ?auto_8163 ) ) ( not ( = ?auto_8143 ?auto_8168 ) ) ( not ( = ?auto_8144 ?auto_8159 ) ) ( not ( = ?auto_8144 ?auto_8157 ) ) ( not ( = ?auto_8144 ?auto_8165 ) ) ( not ( = ?auto_8144 ?auto_8150 ) ) ( not ( = ?auto_8144 ?auto_8151 ) ) ( not ( = ?auto_8144 ?auto_8149 ) ) ( not ( = ?auto_8144 ?auto_8166 ) ) ( not ( = ?auto_8144 ?auto_8154 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8133 ?auto_8134 ?auto_8135 ?auto_8136 ?auto_8137 ?auto_8138 ?auto_8139 ?auto_8140 ?auto_8141 )
      ( MAKE-1CRATE ?auto_8141 ?auto_8142 )
      ( MAKE-9CRATE-VERIFY ?auto_8133 ?auto_8134 ?auto_8135 ?auto_8136 ?auto_8137 ?auto_8138 ?auto_8139 ?auto_8140 ?auto_8141 ?auto_8142 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8190 - SURFACE
      ?auto_8191 - SURFACE
      ?auto_8192 - SURFACE
      ?auto_8193 - SURFACE
      ?auto_8194 - SURFACE
      ?auto_8195 - SURFACE
      ?auto_8196 - SURFACE
      ?auto_8197 - SURFACE
      ?auto_8198 - SURFACE
      ?auto_8199 - SURFACE
      ?auto_8200 - SURFACE
    )
    :vars
    (
      ?auto_8204 - HOIST
      ?auto_8206 - PLACE
      ?auto_8202 - PLACE
      ?auto_8201 - HOIST
      ?auto_8203 - SURFACE
      ?auto_8223 - PLACE
      ?auto_8212 - HOIST
      ?auto_8215 - SURFACE
      ?auto_8207 - PLACE
      ?auto_8219 - HOIST
      ?auto_8211 - SURFACE
      ?auto_8209 - PLACE
      ?auto_8227 - HOIST
      ?auto_8218 - SURFACE
      ?auto_8208 - SURFACE
      ?auto_8214 - PLACE
      ?auto_8221 - HOIST
      ?auto_8217 - SURFACE
      ?auto_8210 - PLACE
      ?auto_8213 - HOIST
      ?auto_8224 - SURFACE
      ?auto_8220 - PLACE
      ?auto_8222 - HOIST
      ?auto_8216 - SURFACE
      ?auto_8226 - SURFACE
      ?auto_8225 - SURFACE
      ?auto_8205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8204 ?auto_8206 ) ( IS-CRATE ?auto_8200 ) ( not ( = ?auto_8202 ?auto_8206 ) ) ( HOIST-AT ?auto_8201 ?auto_8202 ) ( SURFACE-AT ?auto_8200 ?auto_8202 ) ( ON ?auto_8200 ?auto_8203 ) ( CLEAR ?auto_8200 ) ( not ( = ?auto_8199 ?auto_8200 ) ) ( not ( = ?auto_8199 ?auto_8203 ) ) ( not ( = ?auto_8200 ?auto_8203 ) ) ( not ( = ?auto_8204 ?auto_8201 ) ) ( IS-CRATE ?auto_8199 ) ( not ( = ?auto_8223 ?auto_8206 ) ) ( HOIST-AT ?auto_8212 ?auto_8223 ) ( AVAILABLE ?auto_8212 ) ( SURFACE-AT ?auto_8199 ?auto_8223 ) ( ON ?auto_8199 ?auto_8215 ) ( CLEAR ?auto_8199 ) ( not ( = ?auto_8198 ?auto_8199 ) ) ( not ( = ?auto_8198 ?auto_8215 ) ) ( not ( = ?auto_8199 ?auto_8215 ) ) ( not ( = ?auto_8204 ?auto_8212 ) ) ( IS-CRATE ?auto_8198 ) ( not ( = ?auto_8207 ?auto_8206 ) ) ( HOIST-AT ?auto_8219 ?auto_8207 ) ( SURFACE-AT ?auto_8198 ?auto_8207 ) ( ON ?auto_8198 ?auto_8211 ) ( CLEAR ?auto_8198 ) ( not ( = ?auto_8197 ?auto_8198 ) ) ( not ( = ?auto_8197 ?auto_8211 ) ) ( not ( = ?auto_8198 ?auto_8211 ) ) ( not ( = ?auto_8204 ?auto_8219 ) ) ( IS-CRATE ?auto_8197 ) ( not ( = ?auto_8209 ?auto_8206 ) ) ( HOIST-AT ?auto_8227 ?auto_8209 ) ( AVAILABLE ?auto_8227 ) ( SURFACE-AT ?auto_8197 ?auto_8209 ) ( ON ?auto_8197 ?auto_8218 ) ( CLEAR ?auto_8197 ) ( not ( = ?auto_8196 ?auto_8197 ) ) ( not ( = ?auto_8196 ?auto_8218 ) ) ( not ( = ?auto_8197 ?auto_8218 ) ) ( not ( = ?auto_8204 ?auto_8227 ) ) ( IS-CRATE ?auto_8196 ) ( AVAILABLE ?auto_8219 ) ( SURFACE-AT ?auto_8196 ?auto_8207 ) ( ON ?auto_8196 ?auto_8208 ) ( CLEAR ?auto_8196 ) ( not ( = ?auto_8195 ?auto_8196 ) ) ( not ( = ?auto_8195 ?auto_8208 ) ) ( not ( = ?auto_8196 ?auto_8208 ) ) ( IS-CRATE ?auto_8195 ) ( not ( = ?auto_8214 ?auto_8206 ) ) ( HOIST-AT ?auto_8221 ?auto_8214 ) ( AVAILABLE ?auto_8221 ) ( SURFACE-AT ?auto_8195 ?auto_8214 ) ( ON ?auto_8195 ?auto_8217 ) ( CLEAR ?auto_8195 ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( not ( = ?auto_8194 ?auto_8217 ) ) ( not ( = ?auto_8195 ?auto_8217 ) ) ( not ( = ?auto_8204 ?auto_8221 ) ) ( IS-CRATE ?auto_8194 ) ( not ( = ?auto_8210 ?auto_8206 ) ) ( HOIST-AT ?auto_8213 ?auto_8210 ) ( AVAILABLE ?auto_8213 ) ( SURFACE-AT ?auto_8194 ?auto_8210 ) ( ON ?auto_8194 ?auto_8224 ) ( CLEAR ?auto_8194 ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8193 ?auto_8224 ) ) ( not ( = ?auto_8194 ?auto_8224 ) ) ( not ( = ?auto_8204 ?auto_8213 ) ) ( IS-CRATE ?auto_8193 ) ( not ( = ?auto_8220 ?auto_8206 ) ) ( HOIST-AT ?auto_8222 ?auto_8220 ) ( SURFACE-AT ?auto_8193 ?auto_8220 ) ( ON ?auto_8193 ?auto_8216 ) ( CLEAR ?auto_8193 ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8216 ) ) ( not ( = ?auto_8193 ?auto_8216 ) ) ( not ( = ?auto_8204 ?auto_8222 ) ) ( IS-CRATE ?auto_8192 ) ( AVAILABLE ?auto_8222 ) ( SURFACE-AT ?auto_8192 ?auto_8220 ) ( ON ?auto_8192 ?auto_8226 ) ( CLEAR ?auto_8192 ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8226 ) ) ( not ( = ?auto_8192 ?auto_8226 ) ) ( SURFACE-AT ?auto_8190 ?auto_8206 ) ( CLEAR ?auto_8190 ) ( IS-CRATE ?auto_8191 ) ( AVAILABLE ?auto_8204 ) ( AVAILABLE ?auto_8201 ) ( SURFACE-AT ?auto_8191 ?auto_8202 ) ( ON ?auto_8191 ?auto_8225 ) ( CLEAR ?auto_8191 ) ( TRUCK-AT ?auto_8205 ?auto_8206 ) ( not ( = ?auto_8190 ?auto_8191 ) ) ( not ( = ?auto_8190 ?auto_8225 ) ) ( not ( = ?auto_8191 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8192 ) ) ( not ( = ?auto_8190 ?auto_8226 ) ) ( not ( = ?auto_8192 ?auto_8225 ) ) ( not ( = ?auto_8220 ?auto_8202 ) ) ( not ( = ?auto_8222 ?auto_8201 ) ) ( not ( = ?auto_8226 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8193 ) ) ( not ( = ?auto_8190 ?auto_8216 ) ) ( not ( = ?auto_8191 ?auto_8193 ) ) ( not ( = ?auto_8191 ?auto_8216 ) ) ( not ( = ?auto_8193 ?auto_8226 ) ) ( not ( = ?auto_8193 ?auto_8225 ) ) ( not ( = ?auto_8216 ?auto_8226 ) ) ( not ( = ?auto_8216 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8194 ) ) ( not ( = ?auto_8190 ?auto_8224 ) ) ( not ( = ?auto_8191 ?auto_8194 ) ) ( not ( = ?auto_8191 ?auto_8224 ) ) ( not ( = ?auto_8192 ?auto_8194 ) ) ( not ( = ?auto_8192 ?auto_8224 ) ) ( not ( = ?auto_8194 ?auto_8216 ) ) ( not ( = ?auto_8194 ?auto_8226 ) ) ( not ( = ?auto_8194 ?auto_8225 ) ) ( not ( = ?auto_8210 ?auto_8220 ) ) ( not ( = ?auto_8210 ?auto_8202 ) ) ( not ( = ?auto_8213 ?auto_8222 ) ) ( not ( = ?auto_8213 ?auto_8201 ) ) ( not ( = ?auto_8224 ?auto_8216 ) ) ( not ( = ?auto_8224 ?auto_8226 ) ) ( not ( = ?auto_8224 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8195 ) ) ( not ( = ?auto_8190 ?auto_8217 ) ) ( not ( = ?auto_8191 ?auto_8195 ) ) ( not ( = ?auto_8191 ?auto_8217 ) ) ( not ( = ?auto_8192 ?auto_8195 ) ) ( not ( = ?auto_8192 ?auto_8217 ) ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( not ( = ?auto_8193 ?auto_8217 ) ) ( not ( = ?auto_8195 ?auto_8224 ) ) ( not ( = ?auto_8195 ?auto_8216 ) ) ( not ( = ?auto_8195 ?auto_8226 ) ) ( not ( = ?auto_8195 ?auto_8225 ) ) ( not ( = ?auto_8214 ?auto_8210 ) ) ( not ( = ?auto_8214 ?auto_8220 ) ) ( not ( = ?auto_8214 ?auto_8202 ) ) ( not ( = ?auto_8221 ?auto_8213 ) ) ( not ( = ?auto_8221 ?auto_8222 ) ) ( not ( = ?auto_8221 ?auto_8201 ) ) ( not ( = ?auto_8217 ?auto_8224 ) ) ( not ( = ?auto_8217 ?auto_8216 ) ) ( not ( = ?auto_8217 ?auto_8226 ) ) ( not ( = ?auto_8217 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8196 ) ) ( not ( = ?auto_8190 ?auto_8208 ) ) ( not ( = ?auto_8191 ?auto_8196 ) ) ( not ( = ?auto_8191 ?auto_8208 ) ) ( not ( = ?auto_8192 ?auto_8196 ) ) ( not ( = ?auto_8192 ?auto_8208 ) ) ( not ( = ?auto_8193 ?auto_8196 ) ) ( not ( = ?auto_8193 ?auto_8208 ) ) ( not ( = ?auto_8194 ?auto_8196 ) ) ( not ( = ?auto_8194 ?auto_8208 ) ) ( not ( = ?auto_8196 ?auto_8217 ) ) ( not ( = ?auto_8196 ?auto_8224 ) ) ( not ( = ?auto_8196 ?auto_8216 ) ) ( not ( = ?auto_8196 ?auto_8226 ) ) ( not ( = ?auto_8196 ?auto_8225 ) ) ( not ( = ?auto_8207 ?auto_8214 ) ) ( not ( = ?auto_8207 ?auto_8210 ) ) ( not ( = ?auto_8207 ?auto_8220 ) ) ( not ( = ?auto_8207 ?auto_8202 ) ) ( not ( = ?auto_8219 ?auto_8221 ) ) ( not ( = ?auto_8219 ?auto_8213 ) ) ( not ( = ?auto_8219 ?auto_8222 ) ) ( not ( = ?auto_8219 ?auto_8201 ) ) ( not ( = ?auto_8208 ?auto_8217 ) ) ( not ( = ?auto_8208 ?auto_8224 ) ) ( not ( = ?auto_8208 ?auto_8216 ) ) ( not ( = ?auto_8208 ?auto_8226 ) ) ( not ( = ?auto_8208 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8197 ) ) ( not ( = ?auto_8190 ?auto_8218 ) ) ( not ( = ?auto_8191 ?auto_8197 ) ) ( not ( = ?auto_8191 ?auto_8218 ) ) ( not ( = ?auto_8192 ?auto_8197 ) ) ( not ( = ?auto_8192 ?auto_8218 ) ) ( not ( = ?auto_8193 ?auto_8197 ) ) ( not ( = ?auto_8193 ?auto_8218 ) ) ( not ( = ?auto_8194 ?auto_8197 ) ) ( not ( = ?auto_8194 ?auto_8218 ) ) ( not ( = ?auto_8195 ?auto_8197 ) ) ( not ( = ?auto_8195 ?auto_8218 ) ) ( not ( = ?auto_8197 ?auto_8208 ) ) ( not ( = ?auto_8197 ?auto_8217 ) ) ( not ( = ?auto_8197 ?auto_8224 ) ) ( not ( = ?auto_8197 ?auto_8216 ) ) ( not ( = ?auto_8197 ?auto_8226 ) ) ( not ( = ?auto_8197 ?auto_8225 ) ) ( not ( = ?auto_8209 ?auto_8207 ) ) ( not ( = ?auto_8209 ?auto_8214 ) ) ( not ( = ?auto_8209 ?auto_8210 ) ) ( not ( = ?auto_8209 ?auto_8220 ) ) ( not ( = ?auto_8209 ?auto_8202 ) ) ( not ( = ?auto_8227 ?auto_8219 ) ) ( not ( = ?auto_8227 ?auto_8221 ) ) ( not ( = ?auto_8227 ?auto_8213 ) ) ( not ( = ?auto_8227 ?auto_8222 ) ) ( not ( = ?auto_8227 ?auto_8201 ) ) ( not ( = ?auto_8218 ?auto_8208 ) ) ( not ( = ?auto_8218 ?auto_8217 ) ) ( not ( = ?auto_8218 ?auto_8224 ) ) ( not ( = ?auto_8218 ?auto_8216 ) ) ( not ( = ?auto_8218 ?auto_8226 ) ) ( not ( = ?auto_8218 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8198 ) ) ( not ( = ?auto_8190 ?auto_8211 ) ) ( not ( = ?auto_8191 ?auto_8198 ) ) ( not ( = ?auto_8191 ?auto_8211 ) ) ( not ( = ?auto_8192 ?auto_8198 ) ) ( not ( = ?auto_8192 ?auto_8211 ) ) ( not ( = ?auto_8193 ?auto_8198 ) ) ( not ( = ?auto_8193 ?auto_8211 ) ) ( not ( = ?auto_8194 ?auto_8198 ) ) ( not ( = ?auto_8194 ?auto_8211 ) ) ( not ( = ?auto_8195 ?auto_8198 ) ) ( not ( = ?auto_8195 ?auto_8211 ) ) ( not ( = ?auto_8196 ?auto_8198 ) ) ( not ( = ?auto_8196 ?auto_8211 ) ) ( not ( = ?auto_8198 ?auto_8218 ) ) ( not ( = ?auto_8198 ?auto_8208 ) ) ( not ( = ?auto_8198 ?auto_8217 ) ) ( not ( = ?auto_8198 ?auto_8224 ) ) ( not ( = ?auto_8198 ?auto_8216 ) ) ( not ( = ?auto_8198 ?auto_8226 ) ) ( not ( = ?auto_8198 ?auto_8225 ) ) ( not ( = ?auto_8211 ?auto_8218 ) ) ( not ( = ?auto_8211 ?auto_8208 ) ) ( not ( = ?auto_8211 ?auto_8217 ) ) ( not ( = ?auto_8211 ?auto_8224 ) ) ( not ( = ?auto_8211 ?auto_8216 ) ) ( not ( = ?auto_8211 ?auto_8226 ) ) ( not ( = ?auto_8211 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8199 ) ) ( not ( = ?auto_8190 ?auto_8215 ) ) ( not ( = ?auto_8191 ?auto_8199 ) ) ( not ( = ?auto_8191 ?auto_8215 ) ) ( not ( = ?auto_8192 ?auto_8199 ) ) ( not ( = ?auto_8192 ?auto_8215 ) ) ( not ( = ?auto_8193 ?auto_8199 ) ) ( not ( = ?auto_8193 ?auto_8215 ) ) ( not ( = ?auto_8194 ?auto_8199 ) ) ( not ( = ?auto_8194 ?auto_8215 ) ) ( not ( = ?auto_8195 ?auto_8199 ) ) ( not ( = ?auto_8195 ?auto_8215 ) ) ( not ( = ?auto_8196 ?auto_8199 ) ) ( not ( = ?auto_8196 ?auto_8215 ) ) ( not ( = ?auto_8197 ?auto_8199 ) ) ( not ( = ?auto_8197 ?auto_8215 ) ) ( not ( = ?auto_8199 ?auto_8211 ) ) ( not ( = ?auto_8199 ?auto_8218 ) ) ( not ( = ?auto_8199 ?auto_8208 ) ) ( not ( = ?auto_8199 ?auto_8217 ) ) ( not ( = ?auto_8199 ?auto_8224 ) ) ( not ( = ?auto_8199 ?auto_8216 ) ) ( not ( = ?auto_8199 ?auto_8226 ) ) ( not ( = ?auto_8199 ?auto_8225 ) ) ( not ( = ?auto_8223 ?auto_8207 ) ) ( not ( = ?auto_8223 ?auto_8209 ) ) ( not ( = ?auto_8223 ?auto_8214 ) ) ( not ( = ?auto_8223 ?auto_8210 ) ) ( not ( = ?auto_8223 ?auto_8220 ) ) ( not ( = ?auto_8223 ?auto_8202 ) ) ( not ( = ?auto_8212 ?auto_8219 ) ) ( not ( = ?auto_8212 ?auto_8227 ) ) ( not ( = ?auto_8212 ?auto_8221 ) ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8212 ?auto_8222 ) ) ( not ( = ?auto_8212 ?auto_8201 ) ) ( not ( = ?auto_8215 ?auto_8211 ) ) ( not ( = ?auto_8215 ?auto_8218 ) ) ( not ( = ?auto_8215 ?auto_8208 ) ) ( not ( = ?auto_8215 ?auto_8217 ) ) ( not ( = ?auto_8215 ?auto_8224 ) ) ( not ( = ?auto_8215 ?auto_8216 ) ) ( not ( = ?auto_8215 ?auto_8226 ) ) ( not ( = ?auto_8215 ?auto_8225 ) ) ( not ( = ?auto_8190 ?auto_8200 ) ) ( not ( = ?auto_8190 ?auto_8203 ) ) ( not ( = ?auto_8191 ?auto_8200 ) ) ( not ( = ?auto_8191 ?auto_8203 ) ) ( not ( = ?auto_8192 ?auto_8200 ) ) ( not ( = ?auto_8192 ?auto_8203 ) ) ( not ( = ?auto_8193 ?auto_8200 ) ) ( not ( = ?auto_8193 ?auto_8203 ) ) ( not ( = ?auto_8194 ?auto_8200 ) ) ( not ( = ?auto_8194 ?auto_8203 ) ) ( not ( = ?auto_8195 ?auto_8200 ) ) ( not ( = ?auto_8195 ?auto_8203 ) ) ( not ( = ?auto_8196 ?auto_8200 ) ) ( not ( = ?auto_8196 ?auto_8203 ) ) ( not ( = ?auto_8197 ?auto_8200 ) ) ( not ( = ?auto_8197 ?auto_8203 ) ) ( not ( = ?auto_8198 ?auto_8200 ) ) ( not ( = ?auto_8198 ?auto_8203 ) ) ( not ( = ?auto_8200 ?auto_8215 ) ) ( not ( = ?auto_8200 ?auto_8211 ) ) ( not ( = ?auto_8200 ?auto_8218 ) ) ( not ( = ?auto_8200 ?auto_8208 ) ) ( not ( = ?auto_8200 ?auto_8217 ) ) ( not ( = ?auto_8200 ?auto_8224 ) ) ( not ( = ?auto_8200 ?auto_8216 ) ) ( not ( = ?auto_8200 ?auto_8226 ) ) ( not ( = ?auto_8200 ?auto_8225 ) ) ( not ( = ?auto_8203 ?auto_8215 ) ) ( not ( = ?auto_8203 ?auto_8211 ) ) ( not ( = ?auto_8203 ?auto_8218 ) ) ( not ( = ?auto_8203 ?auto_8208 ) ) ( not ( = ?auto_8203 ?auto_8217 ) ) ( not ( = ?auto_8203 ?auto_8224 ) ) ( not ( = ?auto_8203 ?auto_8216 ) ) ( not ( = ?auto_8203 ?auto_8226 ) ) ( not ( = ?auto_8203 ?auto_8225 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8194 ?auto_8195 ?auto_8196 ?auto_8197 ?auto_8198 ?auto_8199 )
      ( MAKE-1CRATE ?auto_8199 ?auto_8200 )
      ( MAKE-10CRATE-VERIFY ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8194 ?auto_8195 ?auto_8196 ?auto_8197 ?auto_8198 ?auto_8199 ?auto_8200 ) )
  )

)

