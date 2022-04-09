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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7849 - SURFACE
      ?auto_7850 - SURFACE
    )
    :vars
    (
      ?auto_7851 - HOIST
      ?auto_7852 - PLACE
      ?auto_7854 - PLACE
      ?auto_7855 - HOIST
      ?auto_7856 - SURFACE
      ?auto_7853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7851 ?auto_7852 ) ( SURFACE-AT ?auto_7849 ?auto_7852 ) ( CLEAR ?auto_7849 ) ( IS-CRATE ?auto_7850 ) ( AVAILABLE ?auto_7851 ) ( not ( = ?auto_7854 ?auto_7852 ) ) ( HOIST-AT ?auto_7855 ?auto_7854 ) ( AVAILABLE ?auto_7855 ) ( SURFACE-AT ?auto_7850 ?auto_7854 ) ( ON ?auto_7850 ?auto_7856 ) ( CLEAR ?auto_7850 ) ( TRUCK-AT ?auto_7853 ?auto_7852 ) ( not ( = ?auto_7849 ?auto_7850 ) ) ( not ( = ?auto_7849 ?auto_7856 ) ) ( not ( = ?auto_7850 ?auto_7856 ) ) ( not ( = ?auto_7851 ?auto_7855 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7853 ?auto_7852 ?auto_7854 )
      ( !LIFT ?auto_7855 ?auto_7850 ?auto_7856 ?auto_7854 )
      ( !LOAD ?auto_7855 ?auto_7850 ?auto_7853 ?auto_7854 )
      ( !DRIVE ?auto_7853 ?auto_7854 ?auto_7852 )
      ( !UNLOAD ?auto_7851 ?auto_7850 ?auto_7853 ?auto_7852 )
      ( !DROP ?auto_7851 ?auto_7850 ?auto_7849 ?auto_7852 )
      ( MAKE-1CRATE-VERIFY ?auto_7849 ?auto_7850 ) )
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
      ?auto_7864 - HOIST
      ?auto_7868 - PLACE
      ?auto_7865 - PLACE
      ?auto_7867 - HOIST
      ?auto_7866 - SURFACE
      ?auto_7871 - PLACE
      ?auto_7870 - HOIST
      ?auto_7869 - SURFACE
      ?auto_7863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7864 ?auto_7868 ) ( IS-CRATE ?auto_7862 ) ( not ( = ?auto_7865 ?auto_7868 ) ) ( HOIST-AT ?auto_7867 ?auto_7865 ) ( AVAILABLE ?auto_7867 ) ( SURFACE-AT ?auto_7862 ?auto_7865 ) ( ON ?auto_7862 ?auto_7866 ) ( CLEAR ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7861 ?auto_7866 ) ) ( not ( = ?auto_7862 ?auto_7866 ) ) ( not ( = ?auto_7864 ?auto_7867 ) ) ( SURFACE-AT ?auto_7860 ?auto_7868 ) ( CLEAR ?auto_7860 ) ( IS-CRATE ?auto_7861 ) ( AVAILABLE ?auto_7864 ) ( not ( = ?auto_7871 ?auto_7868 ) ) ( HOIST-AT ?auto_7870 ?auto_7871 ) ( AVAILABLE ?auto_7870 ) ( SURFACE-AT ?auto_7861 ?auto_7871 ) ( ON ?auto_7861 ?auto_7869 ) ( CLEAR ?auto_7861 ) ( TRUCK-AT ?auto_7863 ?auto_7868 ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7869 ) ) ( not ( = ?auto_7861 ?auto_7869 ) ) ( not ( = ?auto_7864 ?auto_7870 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7866 ) ) ( not ( = ?auto_7862 ?auto_7869 ) ) ( not ( = ?auto_7865 ?auto_7871 ) ) ( not ( = ?auto_7867 ?auto_7870 ) ) ( not ( = ?auto_7866 ?auto_7869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7860 ?auto_7861 )
      ( MAKE-1CRATE ?auto_7861 ?auto_7862 )
      ( MAKE-2CRATE-VERIFY ?auto_7860 ?auto_7861 ?auto_7862 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7874 - SURFACE
      ?auto_7875 - SURFACE
    )
    :vars
    (
      ?auto_7876 - HOIST
      ?auto_7877 - PLACE
      ?auto_7879 - PLACE
      ?auto_7880 - HOIST
      ?auto_7881 - SURFACE
      ?auto_7878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7876 ?auto_7877 ) ( SURFACE-AT ?auto_7874 ?auto_7877 ) ( CLEAR ?auto_7874 ) ( IS-CRATE ?auto_7875 ) ( AVAILABLE ?auto_7876 ) ( not ( = ?auto_7879 ?auto_7877 ) ) ( HOIST-AT ?auto_7880 ?auto_7879 ) ( AVAILABLE ?auto_7880 ) ( SURFACE-AT ?auto_7875 ?auto_7879 ) ( ON ?auto_7875 ?auto_7881 ) ( CLEAR ?auto_7875 ) ( TRUCK-AT ?auto_7878 ?auto_7877 ) ( not ( = ?auto_7874 ?auto_7875 ) ) ( not ( = ?auto_7874 ?auto_7881 ) ) ( not ( = ?auto_7875 ?auto_7881 ) ) ( not ( = ?auto_7876 ?auto_7880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7878 ?auto_7877 ?auto_7879 )
      ( !LIFT ?auto_7880 ?auto_7875 ?auto_7881 ?auto_7879 )
      ( !LOAD ?auto_7880 ?auto_7875 ?auto_7878 ?auto_7879 )
      ( !DRIVE ?auto_7878 ?auto_7879 ?auto_7877 )
      ( !UNLOAD ?auto_7876 ?auto_7875 ?auto_7878 ?auto_7877 )
      ( !DROP ?auto_7876 ?auto_7875 ?auto_7874 ?auto_7877 )
      ( MAKE-1CRATE-VERIFY ?auto_7874 ?auto_7875 ) )
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
      ?auto_7892 - HOIST
      ?auto_7891 - PLACE
      ?auto_7890 - PLACE
      ?auto_7895 - HOIST
      ?auto_7893 - SURFACE
      ?auto_7896 - SURFACE
      ?auto_7897 - PLACE
      ?auto_7898 - HOIST
      ?auto_7899 - SURFACE
      ?auto_7894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7892 ?auto_7891 ) ( IS-CRATE ?auto_7889 ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( HOIST-AT ?auto_7895 ?auto_7890 ) ( SURFACE-AT ?auto_7889 ?auto_7890 ) ( ON ?auto_7889 ?auto_7893 ) ( CLEAR ?auto_7889 ) ( not ( = ?auto_7888 ?auto_7889 ) ) ( not ( = ?auto_7888 ?auto_7893 ) ) ( not ( = ?auto_7889 ?auto_7893 ) ) ( not ( = ?auto_7892 ?auto_7895 ) ) ( IS-CRATE ?auto_7888 ) ( AVAILABLE ?auto_7895 ) ( SURFACE-AT ?auto_7888 ?auto_7890 ) ( ON ?auto_7888 ?auto_7896 ) ( CLEAR ?auto_7888 ) ( not ( = ?auto_7887 ?auto_7888 ) ) ( not ( = ?auto_7887 ?auto_7896 ) ) ( not ( = ?auto_7888 ?auto_7896 ) ) ( SURFACE-AT ?auto_7886 ?auto_7891 ) ( CLEAR ?auto_7886 ) ( IS-CRATE ?auto_7887 ) ( AVAILABLE ?auto_7892 ) ( not ( = ?auto_7897 ?auto_7891 ) ) ( HOIST-AT ?auto_7898 ?auto_7897 ) ( AVAILABLE ?auto_7898 ) ( SURFACE-AT ?auto_7887 ?auto_7897 ) ( ON ?auto_7887 ?auto_7899 ) ( CLEAR ?auto_7887 ) ( TRUCK-AT ?auto_7894 ?auto_7891 ) ( not ( = ?auto_7886 ?auto_7887 ) ) ( not ( = ?auto_7886 ?auto_7899 ) ) ( not ( = ?auto_7887 ?auto_7899 ) ) ( not ( = ?auto_7892 ?auto_7898 ) ) ( not ( = ?auto_7886 ?auto_7888 ) ) ( not ( = ?auto_7886 ?auto_7896 ) ) ( not ( = ?auto_7888 ?auto_7899 ) ) ( not ( = ?auto_7890 ?auto_7897 ) ) ( not ( = ?auto_7895 ?auto_7898 ) ) ( not ( = ?auto_7896 ?auto_7899 ) ) ( not ( = ?auto_7886 ?auto_7889 ) ) ( not ( = ?auto_7886 ?auto_7893 ) ) ( not ( = ?auto_7887 ?auto_7889 ) ) ( not ( = ?auto_7887 ?auto_7893 ) ) ( not ( = ?auto_7889 ?auto_7896 ) ) ( not ( = ?auto_7889 ?auto_7899 ) ) ( not ( = ?auto_7893 ?auto_7896 ) ) ( not ( = ?auto_7893 ?auto_7899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7886 ?auto_7887 ?auto_7888 )
      ( MAKE-1CRATE ?auto_7888 ?auto_7889 )
      ( MAKE-3CRATE-VERIFY ?auto_7886 ?auto_7887 ?auto_7888 ?auto_7889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7902 - SURFACE
      ?auto_7903 - SURFACE
    )
    :vars
    (
      ?auto_7904 - HOIST
      ?auto_7905 - PLACE
      ?auto_7907 - PLACE
      ?auto_7908 - HOIST
      ?auto_7909 - SURFACE
      ?auto_7906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7904 ?auto_7905 ) ( SURFACE-AT ?auto_7902 ?auto_7905 ) ( CLEAR ?auto_7902 ) ( IS-CRATE ?auto_7903 ) ( AVAILABLE ?auto_7904 ) ( not ( = ?auto_7907 ?auto_7905 ) ) ( HOIST-AT ?auto_7908 ?auto_7907 ) ( AVAILABLE ?auto_7908 ) ( SURFACE-AT ?auto_7903 ?auto_7907 ) ( ON ?auto_7903 ?auto_7909 ) ( CLEAR ?auto_7903 ) ( TRUCK-AT ?auto_7906 ?auto_7905 ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( not ( = ?auto_7902 ?auto_7909 ) ) ( not ( = ?auto_7903 ?auto_7909 ) ) ( not ( = ?auto_7904 ?auto_7908 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7906 ?auto_7905 ?auto_7907 )
      ( !LIFT ?auto_7908 ?auto_7903 ?auto_7909 ?auto_7907 )
      ( !LOAD ?auto_7908 ?auto_7903 ?auto_7906 ?auto_7907 )
      ( !DRIVE ?auto_7906 ?auto_7907 ?auto_7905 )
      ( !UNLOAD ?auto_7904 ?auto_7903 ?auto_7906 ?auto_7905 )
      ( !DROP ?auto_7904 ?auto_7903 ?auto_7902 ?auto_7905 )
      ( MAKE-1CRATE-VERIFY ?auto_7902 ?auto_7903 ) )
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
      ?auto_7923 - HOIST
      ?auto_7921 - PLACE
      ?auto_7924 - PLACE
      ?auto_7925 - HOIST
      ?auto_7920 - SURFACE
      ?auto_7930 - PLACE
      ?auto_7928 - HOIST
      ?auto_7926 - SURFACE
      ?auto_7929 - SURFACE
      ?auto_7932 - PLACE
      ?auto_7927 - HOIST
      ?auto_7931 - SURFACE
      ?auto_7922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7923 ?auto_7921 ) ( IS-CRATE ?auto_7919 ) ( not ( = ?auto_7924 ?auto_7921 ) ) ( HOIST-AT ?auto_7925 ?auto_7924 ) ( AVAILABLE ?auto_7925 ) ( SURFACE-AT ?auto_7919 ?auto_7924 ) ( ON ?auto_7919 ?auto_7920 ) ( CLEAR ?auto_7919 ) ( not ( = ?auto_7918 ?auto_7919 ) ) ( not ( = ?auto_7918 ?auto_7920 ) ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( not ( = ?auto_7923 ?auto_7925 ) ) ( IS-CRATE ?auto_7918 ) ( not ( = ?auto_7930 ?auto_7921 ) ) ( HOIST-AT ?auto_7928 ?auto_7930 ) ( SURFACE-AT ?auto_7918 ?auto_7930 ) ( ON ?auto_7918 ?auto_7926 ) ( CLEAR ?auto_7918 ) ( not ( = ?auto_7917 ?auto_7918 ) ) ( not ( = ?auto_7917 ?auto_7926 ) ) ( not ( = ?auto_7918 ?auto_7926 ) ) ( not ( = ?auto_7923 ?auto_7928 ) ) ( IS-CRATE ?auto_7917 ) ( AVAILABLE ?auto_7928 ) ( SURFACE-AT ?auto_7917 ?auto_7930 ) ( ON ?auto_7917 ?auto_7929 ) ( CLEAR ?auto_7917 ) ( not ( = ?auto_7916 ?auto_7917 ) ) ( not ( = ?auto_7916 ?auto_7929 ) ) ( not ( = ?auto_7917 ?auto_7929 ) ) ( SURFACE-AT ?auto_7915 ?auto_7921 ) ( CLEAR ?auto_7915 ) ( IS-CRATE ?auto_7916 ) ( AVAILABLE ?auto_7923 ) ( not ( = ?auto_7932 ?auto_7921 ) ) ( HOIST-AT ?auto_7927 ?auto_7932 ) ( AVAILABLE ?auto_7927 ) ( SURFACE-AT ?auto_7916 ?auto_7932 ) ( ON ?auto_7916 ?auto_7931 ) ( CLEAR ?auto_7916 ) ( TRUCK-AT ?auto_7922 ?auto_7921 ) ( not ( = ?auto_7915 ?auto_7916 ) ) ( not ( = ?auto_7915 ?auto_7931 ) ) ( not ( = ?auto_7916 ?auto_7931 ) ) ( not ( = ?auto_7923 ?auto_7927 ) ) ( not ( = ?auto_7915 ?auto_7917 ) ) ( not ( = ?auto_7915 ?auto_7929 ) ) ( not ( = ?auto_7917 ?auto_7931 ) ) ( not ( = ?auto_7930 ?auto_7932 ) ) ( not ( = ?auto_7928 ?auto_7927 ) ) ( not ( = ?auto_7929 ?auto_7931 ) ) ( not ( = ?auto_7915 ?auto_7918 ) ) ( not ( = ?auto_7915 ?auto_7926 ) ) ( not ( = ?auto_7916 ?auto_7918 ) ) ( not ( = ?auto_7916 ?auto_7926 ) ) ( not ( = ?auto_7918 ?auto_7929 ) ) ( not ( = ?auto_7918 ?auto_7931 ) ) ( not ( = ?auto_7926 ?auto_7929 ) ) ( not ( = ?auto_7926 ?auto_7931 ) ) ( not ( = ?auto_7915 ?auto_7919 ) ) ( not ( = ?auto_7915 ?auto_7920 ) ) ( not ( = ?auto_7916 ?auto_7919 ) ) ( not ( = ?auto_7916 ?auto_7920 ) ) ( not ( = ?auto_7917 ?auto_7919 ) ) ( not ( = ?auto_7917 ?auto_7920 ) ) ( not ( = ?auto_7919 ?auto_7926 ) ) ( not ( = ?auto_7919 ?auto_7929 ) ) ( not ( = ?auto_7919 ?auto_7931 ) ) ( not ( = ?auto_7924 ?auto_7930 ) ) ( not ( = ?auto_7924 ?auto_7932 ) ) ( not ( = ?auto_7925 ?auto_7928 ) ) ( not ( = ?auto_7925 ?auto_7927 ) ) ( not ( = ?auto_7920 ?auto_7926 ) ) ( not ( = ?auto_7920 ?auto_7929 ) ) ( not ( = ?auto_7920 ?auto_7931 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7915 ?auto_7916 ?auto_7917 ?auto_7918 )
      ( MAKE-1CRATE ?auto_7918 ?auto_7919 )
      ( MAKE-4CRATE-VERIFY ?auto_7915 ?auto_7916 ?auto_7917 ?auto_7918 ?auto_7919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7935 - SURFACE
      ?auto_7936 - SURFACE
    )
    :vars
    (
      ?auto_7937 - HOIST
      ?auto_7938 - PLACE
      ?auto_7940 - PLACE
      ?auto_7941 - HOIST
      ?auto_7942 - SURFACE
      ?auto_7939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7937 ?auto_7938 ) ( SURFACE-AT ?auto_7935 ?auto_7938 ) ( CLEAR ?auto_7935 ) ( IS-CRATE ?auto_7936 ) ( AVAILABLE ?auto_7937 ) ( not ( = ?auto_7940 ?auto_7938 ) ) ( HOIST-AT ?auto_7941 ?auto_7940 ) ( AVAILABLE ?auto_7941 ) ( SURFACE-AT ?auto_7936 ?auto_7940 ) ( ON ?auto_7936 ?auto_7942 ) ( CLEAR ?auto_7936 ) ( TRUCK-AT ?auto_7939 ?auto_7938 ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7942 ) ) ( not ( = ?auto_7936 ?auto_7942 ) ) ( not ( = ?auto_7937 ?auto_7941 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7939 ?auto_7938 ?auto_7940 )
      ( !LIFT ?auto_7941 ?auto_7936 ?auto_7942 ?auto_7940 )
      ( !LOAD ?auto_7941 ?auto_7936 ?auto_7939 ?auto_7940 )
      ( !DRIVE ?auto_7939 ?auto_7940 ?auto_7938 )
      ( !UNLOAD ?auto_7937 ?auto_7936 ?auto_7939 ?auto_7938 )
      ( !DROP ?auto_7937 ?auto_7936 ?auto_7935 ?auto_7938 )
      ( MAKE-1CRATE-VERIFY ?auto_7935 ?auto_7936 ) )
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
      ?auto_7956 - HOIST
      ?auto_7957 - PLACE
      ?auto_7955 - PLACE
      ?auto_7960 - HOIST
      ?auto_7958 - SURFACE
      ?auto_7965 - PLACE
      ?auto_7966 - HOIST
      ?auto_7970 - SURFACE
      ?auto_7967 - PLACE
      ?auto_7962 - HOIST
      ?auto_7969 - SURFACE
      ?auto_7963 - SURFACE
      ?auto_7961 - PLACE
      ?auto_7964 - HOIST
      ?auto_7968 - SURFACE
      ?auto_7959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7956 ?auto_7957 ) ( IS-CRATE ?auto_7954 ) ( not ( = ?auto_7955 ?auto_7957 ) ) ( HOIST-AT ?auto_7960 ?auto_7955 ) ( AVAILABLE ?auto_7960 ) ( SURFACE-AT ?auto_7954 ?auto_7955 ) ( ON ?auto_7954 ?auto_7958 ) ( CLEAR ?auto_7954 ) ( not ( = ?auto_7953 ?auto_7954 ) ) ( not ( = ?auto_7953 ?auto_7958 ) ) ( not ( = ?auto_7954 ?auto_7958 ) ) ( not ( = ?auto_7956 ?auto_7960 ) ) ( IS-CRATE ?auto_7953 ) ( not ( = ?auto_7965 ?auto_7957 ) ) ( HOIST-AT ?auto_7966 ?auto_7965 ) ( AVAILABLE ?auto_7966 ) ( SURFACE-AT ?auto_7953 ?auto_7965 ) ( ON ?auto_7953 ?auto_7970 ) ( CLEAR ?auto_7953 ) ( not ( = ?auto_7952 ?auto_7953 ) ) ( not ( = ?auto_7952 ?auto_7970 ) ) ( not ( = ?auto_7953 ?auto_7970 ) ) ( not ( = ?auto_7956 ?auto_7966 ) ) ( IS-CRATE ?auto_7952 ) ( not ( = ?auto_7967 ?auto_7957 ) ) ( HOIST-AT ?auto_7962 ?auto_7967 ) ( SURFACE-AT ?auto_7952 ?auto_7967 ) ( ON ?auto_7952 ?auto_7969 ) ( CLEAR ?auto_7952 ) ( not ( = ?auto_7951 ?auto_7952 ) ) ( not ( = ?auto_7951 ?auto_7969 ) ) ( not ( = ?auto_7952 ?auto_7969 ) ) ( not ( = ?auto_7956 ?auto_7962 ) ) ( IS-CRATE ?auto_7951 ) ( AVAILABLE ?auto_7962 ) ( SURFACE-AT ?auto_7951 ?auto_7967 ) ( ON ?auto_7951 ?auto_7963 ) ( CLEAR ?auto_7951 ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7963 ) ) ( not ( = ?auto_7951 ?auto_7963 ) ) ( SURFACE-AT ?auto_7949 ?auto_7957 ) ( CLEAR ?auto_7949 ) ( IS-CRATE ?auto_7950 ) ( AVAILABLE ?auto_7956 ) ( not ( = ?auto_7961 ?auto_7957 ) ) ( HOIST-AT ?auto_7964 ?auto_7961 ) ( AVAILABLE ?auto_7964 ) ( SURFACE-AT ?auto_7950 ?auto_7961 ) ( ON ?auto_7950 ?auto_7968 ) ( CLEAR ?auto_7950 ) ( TRUCK-AT ?auto_7959 ?auto_7957 ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7968 ) ) ( not ( = ?auto_7950 ?auto_7968 ) ) ( not ( = ?auto_7956 ?auto_7964 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7949 ?auto_7963 ) ) ( not ( = ?auto_7951 ?auto_7968 ) ) ( not ( = ?auto_7967 ?auto_7961 ) ) ( not ( = ?auto_7962 ?auto_7964 ) ) ( not ( = ?auto_7963 ?auto_7968 ) ) ( not ( = ?auto_7949 ?auto_7952 ) ) ( not ( = ?auto_7949 ?auto_7969 ) ) ( not ( = ?auto_7950 ?auto_7952 ) ) ( not ( = ?auto_7950 ?auto_7969 ) ) ( not ( = ?auto_7952 ?auto_7963 ) ) ( not ( = ?auto_7952 ?auto_7968 ) ) ( not ( = ?auto_7969 ?auto_7963 ) ) ( not ( = ?auto_7969 ?auto_7968 ) ) ( not ( = ?auto_7949 ?auto_7953 ) ) ( not ( = ?auto_7949 ?auto_7970 ) ) ( not ( = ?auto_7950 ?auto_7953 ) ) ( not ( = ?auto_7950 ?auto_7970 ) ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7951 ?auto_7970 ) ) ( not ( = ?auto_7953 ?auto_7969 ) ) ( not ( = ?auto_7953 ?auto_7963 ) ) ( not ( = ?auto_7953 ?auto_7968 ) ) ( not ( = ?auto_7965 ?auto_7967 ) ) ( not ( = ?auto_7965 ?auto_7961 ) ) ( not ( = ?auto_7966 ?auto_7962 ) ) ( not ( = ?auto_7966 ?auto_7964 ) ) ( not ( = ?auto_7970 ?auto_7969 ) ) ( not ( = ?auto_7970 ?auto_7963 ) ) ( not ( = ?auto_7970 ?auto_7968 ) ) ( not ( = ?auto_7949 ?auto_7954 ) ) ( not ( = ?auto_7949 ?auto_7958 ) ) ( not ( = ?auto_7950 ?auto_7954 ) ) ( not ( = ?auto_7950 ?auto_7958 ) ) ( not ( = ?auto_7951 ?auto_7954 ) ) ( not ( = ?auto_7951 ?auto_7958 ) ) ( not ( = ?auto_7952 ?auto_7954 ) ) ( not ( = ?auto_7952 ?auto_7958 ) ) ( not ( = ?auto_7954 ?auto_7970 ) ) ( not ( = ?auto_7954 ?auto_7969 ) ) ( not ( = ?auto_7954 ?auto_7963 ) ) ( not ( = ?auto_7954 ?auto_7968 ) ) ( not ( = ?auto_7955 ?auto_7965 ) ) ( not ( = ?auto_7955 ?auto_7967 ) ) ( not ( = ?auto_7955 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7966 ) ) ( not ( = ?auto_7960 ?auto_7962 ) ) ( not ( = ?auto_7960 ?auto_7964 ) ) ( not ( = ?auto_7958 ?auto_7970 ) ) ( not ( = ?auto_7958 ?auto_7969 ) ) ( not ( = ?auto_7958 ?auto_7963 ) ) ( not ( = ?auto_7958 ?auto_7968 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7949 ?auto_7950 ?auto_7951 ?auto_7952 ?auto_7953 )
      ( MAKE-1CRATE ?auto_7953 ?auto_7954 )
      ( MAKE-5CRATE-VERIFY ?auto_7949 ?auto_7950 ?auto_7951 ?auto_7952 ?auto_7953 ?auto_7954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7973 - SURFACE
      ?auto_7974 - SURFACE
    )
    :vars
    (
      ?auto_7975 - HOIST
      ?auto_7976 - PLACE
      ?auto_7978 - PLACE
      ?auto_7979 - HOIST
      ?auto_7980 - SURFACE
      ?auto_7977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7975 ?auto_7976 ) ( SURFACE-AT ?auto_7973 ?auto_7976 ) ( CLEAR ?auto_7973 ) ( IS-CRATE ?auto_7974 ) ( AVAILABLE ?auto_7975 ) ( not ( = ?auto_7978 ?auto_7976 ) ) ( HOIST-AT ?auto_7979 ?auto_7978 ) ( AVAILABLE ?auto_7979 ) ( SURFACE-AT ?auto_7974 ?auto_7978 ) ( ON ?auto_7974 ?auto_7980 ) ( CLEAR ?auto_7974 ) ( TRUCK-AT ?auto_7977 ?auto_7976 ) ( not ( = ?auto_7973 ?auto_7974 ) ) ( not ( = ?auto_7973 ?auto_7980 ) ) ( not ( = ?auto_7974 ?auto_7980 ) ) ( not ( = ?auto_7975 ?auto_7979 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7977 ?auto_7976 ?auto_7978 )
      ( !LIFT ?auto_7979 ?auto_7974 ?auto_7980 ?auto_7978 )
      ( !LOAD ?auto_7979 ?auto_7974 ?auto_7977 ?auto_7978 )
      ( !DRIVE ?auto_7977 ?auto_7978 ?auto_7976 )
      ( !UNLOAD ?auto_7975 ?auto_7974 ?auto_7977 ?auto_7976 )
      ( !DROP ?auto_7975 ?auto_7974 ?auto_7973 ?auto_7976 )
      ( MAKE-1CRATE-VERIFY ?auto_7973 ?auto_7974 ) )
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
      ?auto_7999 - HOIST
      ?auto_7997 - PLACE
      ?auto_7995 - PLACE
      ?auto_8000 - HOIST
      ?auto_7996 - SURFACE
      ?auto_8002 - PLACE
      ?auto_8010 - HOIST
      ?auto_8006 - SURFACE
      ?auto_8011 - PLACE
      ?auto_8013 - HOIST
      ?auto_8008 - SURFACE
      ?auto_8012 - PLACE
      ?auto_8007 - HOIST
      ?auto_8003 - SURFACE
      ?auto_8004 - SURFACE
      ?auto_8009 - PLACE
      ?auto_8005 - HOIST
      ?auto_8001 - SURFACE
      ?auto_7998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7999 ?auto_7997 ) ( IS-CRATE ?auto_7994 ) ( not ( = ?auto_7995 ?auto_7997 ) ) ( HOIST-AT ?auto_8000 ?auto_7995 ) ( AVAILABLE ?auto_8000 ) ( SURFACE-AT ?auto_7994 ?auto_7995 ) ( ON ?auto_7994 ?auto_7996 ) ( CLEAR ?auto_7994 ) ( not ( = ?auto_7993 ?auto_7994 ) ) ( not ( = ?auto_7993 ?auto_7996 ) ) ( not ( = ?auto_7994 ?auto_7996 ) ) ( not ( = ?auto_7999 ?auto_8000 ) ) ( IS-CRATE ?auto_7993 ) ( not ( = ?auto_8002 ?auto_7997 ) ) ( HOIST-AT ?auto_8010 ?auto_8002 ) ( AVAILABLE ?auto_8010 ) ( SURFACE-AT ?auto_7993 ?auto_8002 ) ( ON ?auto_7993 ?auto_8006 ) ( CLEAR ?auto_7993 ) ( not ( = ?auto_7992 ?auto_7993 ) ) ( not ( = ?auto_7992 ?auto_8006 ) ) ( not ( = ?auto_7993 ?auto_8006 ) ) ( not ( = ?auto_7999 ?auto_8010 ) ) ( IS-CRATE ?auto_7992 ) ( not ( = ?auto_8011 ?auto_7997 ) ) ( HOIST-AT ?auto_8013 ?auto_8011 ) ( AVAILABLE ?auto_8013 ) ( SURFACE-AT ?auto_7992 ?auto_8011 ) ( ON ?auto_7992 ?auto_8008 ) ( CLEAR ?auto_7992 ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( not ( = ?auto_7991 ?auto_8008 ) ) ( not ( = ?auto_7992 ?auto_8008 ) ) ( not ( = ?auto_7999 ?auto_8013 ) ) ( IS-CRATE ?auto_7991 ) ( not ( = ?auto_8012 ?auto_7997 ) ) ( HOIST-AT ?auto_8007 ?auto_8012 ) ( SURFACE-AT ?auto_7991 ?auto_8012 ) ( ON ?auto_7991 ?auto_8003 ) ( CLEAR ?auto_7991 ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7990 ?auto_8003 ) ) ( not ( = ?auto_7991 ?auto_8003 ) ) ( not ( = ?auto_7999 ?auto_8007 ) ) ( IS-CRATE ?auto_7990 ) ( AVAILABLE ?auto_8007 ) ( SURFACE-AT ?auto_7990 ?auto_8012 ) ( ON ?auto_7990 ?auto_8004 ) ( CLEAR ?auto_7990 ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_8004 ) ) ( not ( = ?auto_7990 ?auto_8004 ) ) ( SURFACE-AT ?auto_7988 ?auto_7997 ) ( CLEAR ?auto_7988 ) ( IS-CRATE ?auto_7989 ) ( AVAILABLE ?auto_7999 ) ( not ( = ?auto_8009 ?auto_7997 ) ) ( HOIST-AT ?auto_8005 ?auto_8009 ) ( AVAILABLE ?auto_8005 ) ( SURFACE-AT ?auto_7989 ?auto_8009 ) ( ON ?auto_7989 ?auto_8001 ) ( CLEAR ?auto_7989 ) ( TRUCK-AT ?auto_7998 ?auto_7997 ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7988 ?auto_8001 ) ) ( not ( = ?auto_7989 ?auto_8001 ) ) ( not ( = ?auto_7999 ?auto_8005 ) ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7988 ?auto_8004 ) ) ( not ( = ?auto_7990 ?auto_8001 ) ) ( not ( = ?auto_8012 ?auto_8009 ) ) ( not ( = ?auto_8007 ?auto_8005 ) ) ( not ( = ?auto_8004 ?auto_8001 ) ) ( not ( = ?auto_7988 ?auto_7991 ) ) ( not ( = ?auto_7988 ?auto_8003 ) ) ( not ( = ?auto_7989 ?auto_7991 ) ) ( not ( = ?auto_7989 ?auto_8003 ) ) ( not ( = ?auto_7991 ?auto_8004 ) ) ( not ( = ?auto_7991 ?auto_8001 ) ) ( not ( = ?auto_8003 ?auto_8004 ) ) ( not ( = ?auto_8003 ?auto_8001 ) ) ( not ( = ?auto_7988 ?auto_7992 ) ) ( not ( = ?auto_7988 ?auto_8008 ) ) ( not ( = ?auto_7989 ?auto_7992 ) ) ( not ( = ?auto_7989 ?auto_8008 ) ) ( not ( = ?auto_7990 ?auto_7992 ) ) ( not ( = ?auto_7990 ?auto_8008 ) ) ( not ( = ?auto_7992 ?auto_8003 ) ) ( not ( = ?auto_7992 ?auto_8004 ) ) ( not ( = ?auto_7992 ?auto_8001 ) ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8009 ) ) ( not ( = ?auto_8013 ?auto_8007 ) ) ( not ( = ?auto_8013 ?auto_8005 ) ) ( not ( = ?auto_8008 ?auto_8003 ) ) ( not ( = ?auto_8008 ?auto_8004 ) ) ( not ( = ?auto_8008 ?auto_8001 ) ) ( not ( = ?auto_7988 ?auto_7993 ) ) ( not ( = ?auto_7988 ?auto_8006 ) ) ( not ( = ?auto_7989 ?auto_7993 ) ) ( not ( = ?auto_7989 ?auto_8006 ) ) ( not ( = ?auto_7990 ?auto_7993 ) ) ( not ( = ?auto_7990 ?auto_8006 ) ) ( not ( = ?auto_7991 ?auto_7993 ) ) ( not ( = ?auto_7991 ?auto_8006 ) ) ( not ( = ?auto_7993 ?auto_8008 ) ) ( not ( = ?auto_7993 ?auto_8003 ) ) ( not ( = ?auto_7993 ?auto_8004 ) ) ( not ( = ?auto_7993 ?auto_8001 ) ) ( not ( = ?auto_8002 ?auto_8011 ) ) ( not ( = ?auto_8002 ?auto_8012 ) ) ( not ( = ?auto_8002 ?auto_8009 ) ) ( not ( = ?auto_8010 ?auto_8013 ) ) ( not ( = ?auto_8010 ?auto_8007 ) ) ( not ( = ?auto_8010 ?auto_8005 ) ) ( not ( = ?auto_8006 ?auto_8008 ) ) ( not ( = ?auto_8006 ?auto_8003 ) ) ( not ( = ?auto_8006 ?auto_8004 ) ) ( not ( = ?auto_8006 ?auto_8001 ) ) ( not ( = ?auto_7988 ?auto_7994 ) ) ( not ( = ?auto_7988 ?auto_7996 ) ) ( not ( = ?auto_7989 ?auto_7994 ) ) ( not ( = ?auto_7989 ?auto_7996 ) ) ( not ( = ?auto_7990 ?auto_7994 ) ) ( not ( = ?auto_7990 ?auto_7996 ) ) ( not ( = ?auto_7991 ?auto_7994 ) ) ( not ( = ?auto_7991 ?auto_7996 ) ) ( not ( = ?auto_7992 ?auto_7994 ) ) ( not ( = ?auto_7992 ?auto_7996 ) ) ( not ( = ?auto_7994 ?auto_8006 ) ) ( not ( = ?auto_7994 ?auto_8008 ) ) ( not ( = ?auto_7994 ?auto_8003 ) ) ( not ( = ?auto_7994 ?auto_8004 ) ) ( not ( = ?auto_7994 ?auto_8001 ) ) ( not ( = ?auto_7995 ?auto_8002 ) ) ( not ( = ?auto_7995 ?auto_8011 ) ) ( not ( = ?auto_7995 ?auto_8012 ) ) ( not ( = ?auto_7995 ?auto_8009 ) ) ( not ( = ?auto_8000 ?auto_8010 ) ) ( not ( = ?auto_8000 ?auto_8013 ) ) ( not ( = ?auto_8000 ?auto_8007 ) ) ( not ( = ?auto_8000 ?auto_8005 ) ) ( not ( = ?auto_7996 ?auto_8006 ) ) ( not ( = ?auto_7996 ?auto_8008 ) ) ( not ( = ?auto_7996 ?auto_8003 ) ) ( not ( = ?auto_7996 ?auto_8004 ) ) ( not ( = ?auto_7996 ?auto_8001 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7988 ?auto_7989 ?auto_7990 ?auto_7991 ?auto_7992 ?auto_7993 )
      ( MAKE-1CRATE ?auto_7993 ?auto_7994 )
      ( MAKE-6CRATE-VERIFY ?auto_7988 ?auto_7989 ?auto_7990 ?auto_7991 ?auto_7992 ?auto_7993 ?auto_7994 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8016 - SURFACE
      ?auto_8017 - SURFACE
    )
    :vars
    (
      ?auto_8018 - HOIST
      ?auto_8019 - PLACE
      ?auto_8021 - PLACE
      ?auto_8022 - HOIST
      ?auto_8023 - SURFACE
      ?auto_8020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8018 ?auto_8019 ) ( SURFACE-AT ?auto_8016 ?auto_8019 ) ( CLEAR ?auto_8016 ) ( IS-CRATE ?auto_8017 ) ( AVAILABLE ?auto_8018 ) ( not ( = ?auto_8021 ?auto_8019 ) ) ( HOIST-AT ?auto_8022 ?auto_8021 ) ( AVAILABLE ?auto_8022 ) ( SURFACE-AT ?auto_8017 ?auto_8021 ) ( ON ?auto_8017 ?auto_8023 ) ( CLEAR ?auto_8017 ) ( TRUCK-AT ?auto_8020 ?auto_8019 ) ( not ( = ?auto_8016 ?auto_8017 ) ) ( not ( = ?auto_8016 ?auto_8023 ) ) ( not ( = ?auto_8017 ?auto_8023 ) ) ( not ( = ?auto_8018 ?auto_8022 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8020 ?auto_8019 ?auto_8021 )
      ( !LIFT ?auto_8022 ?auto_8017 ?auto_8023 ?auto_8021 )
      ( !LOAD ?auto_8022 ?auto_8017 ?auto_8020 ?auto_8021 )
      ( !DRIVE ?auto_8020 ?auto_8021 ?auto_8019 )
      ( !UNLOAD ?auto_8018 ?auto_8017 ?auto_8020 ?auto_8019 )
      ( !DROP ?auto_8018 ?auto_8017 ?auto_8016 ?auto_8019 )
      ( MAKE-1CRATE-VERIFY ?auto_8016 ?auto_8017 ) )
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
      ?auto_8045 - HOIST
      ?auto_8043 - PLACE
      ?auto_8044 - PLACE
      ?auto_8042 - HOIST
      ?auto_8041 - SURFACE
      ?auto_8059 - PLACE
      ?auto_8060 - HOIST
      ?auto_8047 - SURFACE
      ?auto_8061 - PLACE
      ?auto_8050 - HOIST
      ?auto_8055 - SURFACE
      ?auto_8049 - PLACE
      ?auto_8052 - HOIST
      ?auto_8053 - SURFACE
      ?auto_8051 - PLACE
      ?auto_8054 - HOIST
      ?auto_8058 - SURFACE
      ?auto_8046 - SURFACE
      ?auto_8048 - PLACE
      ?auto_8056 - HOIST
      ?auto_8057 - SURFACE
      ?auto_8040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8045 ?auto_8043 ) ( IS-CRATE ?auto_8039 ) ( not ( = ?auto_8044 ?auto_8043 ) ) ( HOIST-AT ?auto_8042 ?auto_8044 ) ( AVAILABLE ?auto_8042 ) ( SURFACE-AT ?auto_8039 ?auto_8044 ) ( ON ?auto_8039 ?auto_8041 ) ( CLEAR ?auto_8039 ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8041 ) ) ( not ( = ?auto_8039 ?auto_8041 ) ) ( not ( = ?auto_8045 ?auto_8042 ) ) ( IS-CRATE ?auto_8038 ) ( not ( = ?auto_8059 ?auto_8043 ) ) ( HOIST-AT ?auto_8060 ?auto_8059 ) ( AVAILABLE ?auto_8060 ) ( SURFACE-AT ?auto_8038 ?auto_8059 ) ( ON ?auto_8038 ?auto_8047 ) ( CLEAR ?auto_8038 ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8047 ) ) ( not ( = ?auto_8038 ?auto_8047 ) ) ( not ( = ?auto_8045 ?auto_8060 ) ) ( IS-CRATE ?auto_8037 ) ( not ( = ?auto_8061 ?auto_8043 ) ) ( HOIST-AT ?auto_8050 ?auto_8061 ) ( AVAILABLE ?auto_8050 ) ( SURFACE-AT ?auto_8037 ?auto_8061 ) ( ON ?auto_8037 ?auto_8055 ) ( CLEAR ?auto_8037 ) ( not ( = ?auto_8036 ?auto_8037 ) ) ( not ( = ?auto_8036 ?auto_8055 ) ) ( not ( = ?auto_8037 ?auto_8055 ) ) ( not ( = ?auto_8045 ?auto_8050 ) ) ( IS-CRATE ?auto_8036 ) ( not ( = ?auto_8049 ?auto_8043 ) ) ( HOIST-AT ?auto_8052 ?auto_8049 ) ( AVAILABLE ?auto_8052 ) ( SURFACE-AT ?auto_8036 ?auto_8049 ) ( ON ?auto_8036 ?auto_8053 ) ( CLEAR ?auto_8036 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8053 ) ) ( not ( = ?auto_8036 ?auto_8053 ) ) ( not ( = ?auto_8045 ?auto_8052 ) ) ( IS-CRATE ?auto_8035 ) ( not ( = ?auto_8051 ?auto_8043 ) ) ( HOIST-AT ?auto_8054 ?auto_8051 ) ( SURFACE-AT ?auto_8035 ?auto_8051 ) ( ON ?auto_8035 ?auto_8058 ) ( CLEAR ?auto_8035 ) ( not ( = ?auto_8034 ?auto_8035 ) ) ( not ( = ?auto_8034 ?auto_8058 ) ) ( not ( = ?auto_8035 ?auto_8058 ) ) ( not ( = ?auto_8045 ?auto_8054 ) ) ( IS-CRATE ?auto_8034 ) ( AVAILABLE ?auto_8054 ) ( SURFACE-AT ?auto_8034 ?auto_8051 ) ( ON ?auto_8034 ?auto_8046 ) ( CLEAR ?auto_8034 ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( not ( = ?auto_8033 ?auto_8046 ) ) ( not ( = ?auto_8034 ?auto_8046 ) ) ( SURFACE-AT ?auto_8032 ?auto_8043 ) ( CLEAR ?auto_8032 ) ( IS-CRATE ?auto_8033 ) ( AVAILABLE ?auto_8045 ) ( not ( = ?auto_8048 ?auto_8043 ) ) ( HOIST-AT ?auto_8056 ?auto_8048 ) ( AVAILABLE ?auto_8056 ) ( SURFACE-AT ?auto_8033 ?auto_8048 ) ( ON ?auto_8033 ?auto_8057 ) ( CLEAR ?auto_8033 ) ( TRUCK-AT ?auto_8040 ?auto_8043 ) ( not ( = ?auto_8032 ?auto_8033 ) ) ( not ( = ?auto_8032 ?auto_8057 ) ) ( not ( = ?auto_8033 ?auto_8057 ) ) ( not ( = ?auto_8045 ?auto_8056 ) ) ( not ( = ?auto_8032 ?auto_8034 ) ) ( not ( = ?auto_8032 ?auto_8046 ) ) ( not ( = ?auto_8034 ?auto_8057 ) ) ( not ( = ?auto_8051 ?auto_8048 ) ) ( not ( = ?auto_8054 ?auto_8056 ) ) ( not ( = ?auto_8046 ?auto_8057 ) ) ( not ( = ?auto_8032 ?auto_8035 ) ) ( not ( = ?auto_8032 ?auto_8058 ) ) ( not ( = ?auto_8033 ?auto_8035 ) ) ( not ( = ?auto_8033 ?auto_8058 ) ) ( not ( = ?auto_8035 ?auto_8046 ) ) ( not ( = ?auto_8035 ?auto_8057 ) ) ( not ( = ?auto_8058 ?auto_8046 ) ) ( not ( = ?auto_8058 ?auto_8057 ) ) ( not ( = ?auto_8032 ?auto_8036 ) ) ( not ( = ?auto_8032 ?auto_8053 ) ) ( not ( = ?auto_8033 ?auto_8036 ) ) ( not ( = ?auto_8033 ?auto_8053 ) ) ( not ( = ?auto_8034 ?auto_8036 ) ) ( not ( = ?auto_8034 ?auto_8053 ) ) ( not ( = ?auto_8036 ?auto_8058 ) ) ( not ( = ?auto_8036 ?auto_8046 ) ) ( not ( = ?auto_8036 ?auto_8057 ) ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( not ( = ?auto_8049 ?auto_8048 ) ) ( not ( = ?auto_8052 ?auto_8054 ) ) ( not ( = ?auto_8052 ?auto_8056 ) ) ( not ( = ?auto_8053 ?auto_8058 ) ) ( not ( = ?auto_8053 ?auto_8046 ) ) ( not ( = ?auto_8053 ?auto_8057 ) ) ( not ( = ?auto_8032 ?auto_8037 ) ) ( not ( = ?auto_8032 ?auto_8055 ) ) ( not ( = ?auto_8033 ?auto_8037 ) ) ( not ( = ?auto_8033 ?auto_8055 ) ) ( not ( = ?auto_8034 ?auto_8037 ) ) ( not ( = ?auto_8034 ?auto_8055 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8055 ) ) ( not ( = ?auto_8037 ?auto_8053 ) ) ( not ( = ?auto_8037 ?auto_8058 ) ) ( not ( = ?auto_8037 ?auto_8046 ) ) ( not ( = ?auto_8037 ?auto_8057 ) ) ( not ( = ?auto_8061 ?auto_8049 ) ) ( not ( = ?auto_8061 ?auto_8051 ) ) ( not ( = ?auto_8061 ?auto_8048 ) ) ( not ( = ?auto_8050 ?auto_8052 ) ) ( not ( = ?auto_8050 ?auto_8054 ) ) ( not ( = ?auto_8050 ?auto_8056 ) ) ( not ( = ?auto_8055 ?auto_8053 ) ) ( not ( = ?auto_8055 ?auto_8058 ) ) ( not ( = ?auto_8055 ?auto_8046 ) ) ( not ( = ?auto_8055 ?auto_8057 ) ) ( not ( = ?auto_8032 ?auto_8038 ) ) ( not ( = ?auto_8032 ?auto_8047 ) ) ( not ( = ?auto_8033 ?auto_8038 ) ) ( not ( = ?auto_8033 ?auto_8047 ) ) ( not ( = ?auto_8034 ?auto_8038 ) ) ( not ( = ?auto_8034 ?auto_8047 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8035 ?auto_8047 ) ) ( not ( = ?auto_8036 ?auto_8038 ) ) ( not ( = ?auto_8036 ?auto_8047 ) ) ( not ( = ?auto_8038 ?auto_8055 ) ) ( not ( = ?auto_8038 ?auto_8053 ) ) ( not ( = ?auto_8038 ?auto_8058 ) ) ( not ( = ?auto_8038 ?auto_8046 ) ) ( not ( = ?auto_8038 ?auto_8057 ) ) ( not ( = ?auto_8059 ?auto_8061 ) ) ( not ( = ?auto_8059 ?auto_8049 ) ) ( not ( = ?auto_8059 ?auto_8051 ) ) ( not ( = ?auto_8059 ?auto_8048 ) ) ( not ( = ?auto_8060 ?auto_8050 ) ) ( not ( = ?auto_8060 ?auto_8052 ) ) ( not ( = ?auto_8060 ?auto_8054 ) ) ( not ( = ?auto_8060 ?auto_8056 ) ) ( not ( = ?auto_8047 ?auto_8055 ) ) ( not ( = ?auto_8047 ?auto_8053 ) ) ( not ( = ?auto_8047 ?auto_8058 ) ) ( not ( = ?auto_8047 ?auto_8046 ) ) ( not ( = ?auto_8047 ?auto_8057 ) ) ( not ( = ?auto_8032 ?auto_8039 ) ) ( not ( = ?auto_8032 ?auto_8041 ) ) ( not ( = ?auto_8033 ?auto_8039 ) ) ( not ( = ?auto_8033 ?auto_8041 ) ) ( not ( = ?auto_8034 ?auto_8039 ) ) ( not ( = ?auto_8034 ?auto_8041 ) ) ( not ( = ?auto_8035 ?auto_8039 ) ) ( not ( = ?auto_8035 ?auto_8041 ) ) ( not ( = ?auto_8036 ?auto_8039 ) ) ( not ( = ?auto_8036 ?auto_8041 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8037 ?auto_8041 ) ) ( not ( = ?auto_8039 ?auto_8047 ) ) ( not ( = ?auto_8039 ?auto_8055 ) ) ( not ( = ?auto_8039 ?auto_8053 ) ) ( not ( = ?auto_8039 ?auto_8058 ) ) ( not ( = ?auto_8039 ?auto_8046 ) ) ( not ( = ?auto_8039 ?auto_8057 ) ) ( not ( = ?auto_8044 ?auto_8059 ) ) ( not ( = ?auto_8044 ?auto_8061 ) ) ( not ( = ?auto_8044 ?auto_8049 ) ) ( not ( = ?auto_8044 ?auto_8051 ) ) ( not ( = ?auto_8044 ?auto_8048 ) ) ( not ( = ?auto_8042 ?auto_8060 ) ) ( not ( = ?auto_8042 ?auto_8050 ) ) ( not ( = ?auto_8042 ?auto_8052 ) ) ( not ( = ?auto_8042 ?auto_8054 ) ) ( not ( = ?auto_8042 ?auto_8056 ) ) ( not ( = ?auto_8041 ?auto_8047 ) ) ( not ( = ?auto_8041 ?auto_8055 ) ) ( not ( = ?auto_8041 ?auto_8053 ) ) ( not ( = ?auto_8041 ?auto_8058 ) ) ( not ( = ?auto_8041 ?auto_8046 ) ) ( not ( = ?auto_8041 ?auto_8057 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8032 ?auto_8033 ?auto_8034 ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 )
      ( MAKE-1CRATE ?auto_8038 ?auto_8039 )
      ( MAKE-7CRATE-VERIFY ?auto_8032 ?auto_8033 ?auto_8034 ?auto_8035 ?auto_8036 ?auto_8037 ?auto_8038 ?auto_8039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8064 - SURFACE
      ?auto_8065 - SURFACE
    )
    :vars
    (
      ?auto_8066 - HOIST
      ?auto_8067 - PLACE
      ?auto_8069 - PLACE
      ?auto_8070 - HOIST
      ?auto_8071 - SURFACE
      ?auto_8068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8066 ?auto_8067 ) ( SURFACE-AT ?auto_8064 ?auto_8067 ) ( CLEAR ?auto_8064 ) ( IS-CRATE ?auto_8065 ) ( AVAILABLE ?auto_8066 ) ( not ( = ?auto_8069 ?auto_8067 ) ) ( HOIST-AT ?auto_8070 ?auto_8069 ) ( AVAILABLE ?auto_8070 ) ( SURFACE-AT ?auto_8065 ?auto_8069 ) ( ON ?auto_8065 ?auto_8071 ) ( CLEAR ?auto_8065 ) ( TRUCK-AT ?auto_8068 ?auto_8067 ) ( not ( = ?auto_8064 ?auto_8065 ) ) ( not ( = ?auto_8064 ?auto_8071 ) ) ( not ( = ?auto_8065 ?auto_8071 ) ) ( not ( = ?auto_8066 ?auto_8070 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8068 ?auto_8067 ?auto_8069 )
      ( !LIFT ?auto_8070 ?auto_8065 ?auto_8071 ?auto_8069 )
      ( !LOAD ?auto_8070 ?auto_8065 ?auto_8068 ?auto_8069 )
      ( !DRIVE ?auto_8068 ?auto_8069 ?auto_8067 )
      ( !UNLOAD ?auto_8066 ?auto_8065 ?auto_8068 ?auto_8067 )
      ( !DROP ?auto_8066 ?auto_8065 ?auto_8064 ?auto_8067 )
      ( MAKE-1CRATE-VERIFY ?auto_8064 ?auto_8065 ) )
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
      ?auto_8089 - SURFACE
      ?auto_8088 - SURFACE
    )
    :vars
    (
      ?auto_8093 - HOIST
      ?auto_8095 - PLACE
      ?auto_8091 - PLACE
      ?auto_8092 - HOIST
      ?auto_8090 - SURFACE
      ?auto_8096 - PLACE
      ?auto_8112 - HOIST
      ?auto_8097 - SURFACE
      ?auto_8099 - SURFACE
      ?auto_8102 - PLACE
      ?auto_8111 - HOIST
      ?auto_8105 - SURFACE
      ?auto_8098 - PLACE
      ?auto_8109 - HOIST
      ?auto_8108 - SURFACE
      ?auto_8110 - PLACE
      ?auto_8103 - HOIST
      ?auto_8107 - SURFACE
      ?auto_8101 - SURFACE
      ?auto_8100 - PLACE
      ?auto_8104 - HOIST
      ?auto_8106 - SURFACE
      ?auto_8094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8093 ?auto_8095 ) ( IS-CRATE ?auto_8088 ) ( not ( = ?auto_8091 ?auto_8095 ) ) ( HOIST-AT ?auto_8092 ?auto_8091 ) ( SURFACE-AT ?auto_8088 ?auto_8091 ) ( ON ?auto_8088 ?auto_8090 ) ( CLEAR ?auto_8088 ) ( not ( = ?auto_8089 ?auto_8088 ) ) ( not ( = ?auto_8089 ?auto_8090 ) ) ( not ( = ?auto_8088 ?auto_8090 ) ) ( not ( = ?auto_8093 ?auto_8092 ) ) ( IS-CRATE ?auto_8089 ) ( not ( = ?auto_8096 ?auto_8095 ) ) ( HOIST-AT ?auto_8112 ?auto_8096 ) ( AVAILABLE ?auto_8112 ) ( SURFACE-AT ?auto_8089 ?auto_8096 ) ( ON ?auto_8089 ?auto_8097 ) ( CLEAR ?auto_8089 ) ( not ( = ?auto_8087 ?auto_8089 ) ) ( not ( = ?auto_8087 ?auto_8097 ) ) ( not ( = ?auto_8089 ?auto_8097 ) ) ( not ( = ?auto_8093 ?auto_8112 ) ) ( IS-CRATE ?auto_8087 ) ( AVAILABLE ?auto_8092 ) ( SURFACE-AT ?auto_8087 ?auto_8091 ) ( ON ?auto_8087 ?auto_8099 ) ( CLEAR ?auto_8087 ) ( not ( = ?auto_8086 ?auto_8087 ) ) ( not ( = ?auto_8086 ?auto_8099 ) ) ( not ( = ?auto_8087 ?auto_8099 ) ) ( IS-CRATE ?auto_8086 ) ( not ( = ?auto_8102 ?auto_8095 ) ) ( HOIST-AT ?auto_8111 ?auto_8102 ) ( AVAILABLE ?auto_8111 ) ( SURFACE-AT ?auto_8086 ?auto_8102 ) ( ON ?auto_8086 ?auto_8105 ) ( CLEAR ?auto_8086 ) ( not ( = ?auto_8085 ?auto_8086 ) ) ( not ( = ?auto_8085 ?auto_8105 ) ) ( not ( = ?auto_8086 ?auto_8105 ) ) ( not ( = ?auto_8093 ?auto_8111 ) ) ( IS-CRATE ?auto_8085 ) ( not ( = ?auto_8098 ?auto_8095 ) ) ( HOIST-AT ?auto_8109 ?auto_8098 ) ( AVAILABLE ?auto_8109 ) ( SURFACE-AT ?auto_8085 ?auto_8098 ) ( ON ?auto_8085 ?auto_8108 ) ( CLEAR ?auto_8085 ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( not ( = ?auto_8084 ?auto_8108 ) ) ( not ( = ?auto_8085 ?auto_8108 ) ) ( not ( = ?auto_8093 ?auto_8109 ) ) ( IS-CRATE ?auto_8084 ) ( not ( = ?auto_8110 ?auto_8095 ) ) ( HOIST-AT ?auto_8103 ?auto_8110 ) ( SURFACE-AT ?auto_8084 ?auto_8110 ) ( ON ?auto_8084 ?auto_8107 ) ( CLEAR ?auto_8084 ) ( not ( = ?auto_8083 ?auto_8084 ) ) ( not ( = ?auto_8083 ?auto_8107 ) ) ( not ( = ?auto_8084 ?auto_8107 ) ) ( not ( = ?auto_8093 ?auto_8103 ) ) ( IS-CRATE ?auto_8083 ) ( AVAILABLE ?auto_8103 ) ( SURFACE-AT ?auto_8083 ?auto_8110 ) ( ON ?auto_8083 ?auto_8101 ) ( CLEAR ?auto_8083 ) ( not ( = ?auto_8082 ?auto_8083 ) ) ( not ( = ?auto_8082 ?auto_8101 ) ) ( not ( = ?auto_8083 ?auto_8101 ) ) ( SURFACE-AT ?auto_8081 ?auto_8095 ) ( CLEAR ?auto_8081 ) ( IS-CRATE ?auto_8082 ) ( AVAILABLE ?auto_8093 ) ( not ( = ?auto_8100 ?auto_8095 ) ) ( HOIST-AT ?auto_8104 ?auto_8100 ) ( AVAILABLE ?auto_8104 ) ( SURFACE-AT ?auto_8082 ?auto_8100 ) ( ON ?auto_8082 ?auto_8106 ) ( CLEAR ?auto_8082 ) ( TRUCK-AT ?auto_8094 ?auto_8095 ) ( not ( = ?auto_8081 ?auto_8082 ) ) ( not ( = ?auto_8081 ?auto_8106 ) ) ( not ( = ?auto_8082 ?auto_8106 ) ) ( not ( = ?auto_8093 ?auto_8104 ) ) ( not ( = ?auto_8081 ?auto_8083 ) ) ( not ( = ?auto_8081 ?auto_8101 ) ) ( not ( = ?auto_8083 ?auto_8106 ) ) ( not ( = ?auto_8110 ?auto_8100 ) ) ( not ( = ?auto_8103 ?auto_8104 ) ) ( not ( = ?auto_8101 ?auto_8106 ) ) ( not ( = ?auto_8081 ?auto_8084 ) ) ( not ( = ?auto_8081 ?auto_8107 ) ) ( not ( = ?auto_8082 ?auto_8084 ) ) ( not ( = ?auto_8082 ?auto_8107 ) ) ( not ( = ?auto_8084 ?auto_8101 ) ) ( not ( = ?auto_8084 ?auto_8106 ) ) ( not ( = ?auto_8107 ?auto_8101 ) ) ( not ( = ?auto_8107 ?auto_8106 ) ) ( not ( = ?auto_8081 ?auto_8085 ) ) ( not ( = ?auto_8081 ?auto_8108 ) ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( not ( = ?auto_8082 ?auto_8108 ) ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( not ( = ?auto_8083 ?auto_8108 ) ) ( not ( = ?auto_8085 ?auto_8107 ) ) ( not ( = ?auto_8085 ?auto_8101 ) ) ( not ( = ?auto_8085 ?auto_8106 ) ) ( not ( = ?auto_8098 ?auto_8110 ) ) ( not ( = ?auto_8098 ?auto_8100 ) ) ( not ( = ?auto_8109 ?auto_8103 ) ) ( not ( = ?auto_8109 ?auto_8104 ) ) ( not ( = ?auto_8108 ?auto_8107 ) ) ( not ( = ?auto_8108 ?auto_8101 ) ) ( not ( = ?auto_8108 ?auto_8106 ) ) ( not ( = ?auto_8081 ?auto_8086 ) ) ( not ( = ?auto_8081 ?auto_8105 ) ) ( not ( = ?auto_8082 ?auto_8086 ) ) ( not ( = ?auto_8082 ?auto_8105 ) ) ( not ( = ?auto_8083 ?auto_8086 ) ) ( not ( = ?auto_8083 ?auto_8105 ) ) ( not ( = ?auto_8084 ?auto_8086 ) ) ( not ( = ?auto_8084 ?auto_8105 ) ) ( not ( = ?auto_8086 ?auto_8108 ) ) ( not ( = ?auto_8086 ?auto_8107 ) ) ( not ( = ?auto_8086 ?auto_8101 ) ) ( not ( = ?auto_8086 ?auto_8106 ) ) ( not ( = ?auto_8102 ?auto_8098 ) ) ( not ( = ?auto_8102 ?auto_8110 ) ) ( not ( = ?auto_8102 ?auto_8100 ) ) ( not ( = ?auto_8111 ?auto_8109 ) ) ( not ( = ?auto_8111 ?auto_8103 ) ) ( not ( = ?auto_8111 ?auto_8104 ) ) ( not ( = ?auto_8105 ?auto_8108 ) ) ( not ( = ?auto_8105 ?auto_8107 ) ) ( not ( = ?auto_8105 ?auto_8101 ) ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8081 ?auto_8087 ) ) ( not ( = ?auto_8081 ?auto_8099 ) ) ( not ( = ?auto_8082 ?auto_8087 ) ) ( not ( = ?auto_8082 ?auto_8099 ) ) ( not ( = ?auto_8083 ?auto_8087 ) ) ( not ( = ?auto_8083 ?auto_8099 ) ) ( not ( = ?auto_8084 ?auto_8087 ) ) ( not ( = ?auto_8084 ?auto_8099 ) ) ( not ( = ?auto_8085 ?auto_8087 ) ) ( not ( = ?auto_8085 ?auto_8099 ) ) ( not ( = ?auto_8087 ?auto_8105 ) ) ( not ( = ?auto_8087 ?auto_8108 ) ) ( not ( = ?auto_8087 ?auto_8107 ) ) ( not ( = ?auto_8087 ?auto_8101 ) ) ( not ( = ?auto_8087 ?auto_8106 ) ) ( not ( = ?auto_8091 ?auto_8102 ) ) ( not ( = ?auto_8091 ?auto_8098 ) ) ( not ( = ?auto_8091 ?auto_8110 ) ) ( not ( = ?auto_8091 ?auto_8100 ) ) ( not ( = ?auto_8092 ?auto_8111 ) ) ( not ( = ?auto_8092 ?auto_8109 ) ) ( not ( = ?auto_8092 ?auto_8103 ) ) ( not ( = ?auto_8092 ?auto_8104 ) ) ( not ( = ?auto_8099 ?auto_8105 ) ) ( not ( = ?auto_8099 ?auto_8108 ) ) ( not ( = ?auto_8099 ?auto_8107 ) ) ( not ( = ?auto_8099 ?auto_8101 ) ) ( not ( = ?auto_8099 ?auto_8106 ) ) ( not ( = ?auto_8081 ?auto_8089 ) ) ( not ( = ?auto_8081 ?auto_8097 ) ) ( not ( = ?auto_8082 ?auto_8089 ) ) ( not ( = ?auto_8082 ?auto_8097 ) ) ( not ( = ?auto_8083 ?auto_8089 ) ) ( not ( = ?auto_8083 ?auto_8097 ) ) ( not ( = ?auto_8084 ?auto_8089 ) ) ( not ( = ?auto_8084 ?auto_8097 ) ) ( not ( = ?auto_8085 ?auto_8089 ) ) ( not ( = ?auto_8085 ?auto_8097 ) ) ( not ( = ?auto_8086 ?auto_8089 ) ) ( not ( = ?auto_8086 ?auto_8097 ) ) ( not ( = ?auto_8089 ?auto_8099 ) ) ( not ( = ?auto_8089 ?auto_8105 ) ) ( not ( = ?auto_8089 ?auto_8108 ) ) ( not ( = ?auto_8089 ?auto_8107 ) ) ( not ( = ?auto_8089 ?auto_8101 ) ) ( not ( = ?auto_8089 ?auto_8106 ) ) ( not ( = ?auto_8096 ?auto_8091 ) ) ( not ( = ?auto_8096 ?auto_8102 ) ) ( not ( = ?auto_8096 ?auto_8098 ) ) ( not ( = ?auto_8096 ?auto_8110 ) ) ( not ( = ?auto_8096 ?auto_8100 ) ) ( not ( = ?auto_8112 ?auto_8092 ) ) ( not ( = ?auto_8112 ?auto_8111 ) ) ( not ( = ?auto_8112 ?auto_8109 ) ) ( not ( = ?auto_8112 ?auto_8103 ) ) ( not ( = ?auto_8112 ?auto_8104 ) ) ( not ( = ?auto_8097 ?auto_8099 ) ) ( not ( = ?auto_8097 ?auto_8105 ) ) ( not ( = ?auto_8097 ?auto_8108 ) ) ( not ( = ?auto_8097 ?auto_8107 ) ) ( not ( = ?auto_8097 ?auto_8101 ) ) ( not ( = ?auto_8097 ?auto_8106 ) ) ( not ( = ?auto_8081 ?auto_8088 ) ) ( not ( = ?auto_8081 ?auto_8090 ) ) ( not ( = ?auto_8082 ?auto_8088 ) ) ( not ( = ?auto_8082 ?auto_8090 ) ) ( not ( = ?auto_8083 ?auto_8088 ) ) ( not ( = ?auto_8083 ?auto_8090 ) ) ( not ( = ?auto_8084 ?auto_8088 ) ) ( not ( = ?auto_8084 ?auto_8090 ) ) ( not ( = ?auto_8085 ?auto_8088 ) ) ( not ( = ?auto_8085 ?auto_8090 ) ) ( not ( = ?auto_8086 ?auto_8088 ) ) ( not ( = ?auto_8086 ?auto_8090 ) ) ( not ( = ?auto_8087 ?auto_8088 ) ) ( not ( = ?auto_8087 ?auto_8090 ) ) ( not ( = ?auto_8088 ?auto_8097 ) ) ( not ( = ?auto_8088 ?auto_8099 ) ) ( not ( = ?auto_8088 ?auto_8105 ) ) ( not ( = ?auto_8088 ?auto_8108 ) ) ( not ( = ?auto_8088 ?auto_8107 ) ) ( not ( = ?auto_8088 ?auto_8101 ) ) ( not ( = ?auto_8088 ?auto_8106 ) ) ( not ( = ?auto_8090 ?auto_8097 ) ) ( not ( = ?auto_8090 ?auto_8099 ) ) ( not ( = ?auto_8090 ?auto_8105 ) ) ( not ( = ?auto_8090 ?auto_8108 ) ) ( not ( = ?auto_8090 ?auto_8107 ) ) ( not ( = ?auto_8090 ?auto_8101 ) ) ( not ( = ?auto_8090 ?auto_8106 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8081 ?auto_8082 ?auto_8083 ?auto_8084 ?auto_8085 ?auto_8086 ?auto_8087 ?auto_8089 )
      ( MAKE-1CRATE ?auto_8089 ?auto_8088 )
      ( MAKE-8CRATE-VERIFY ?auto_8081 ?auto_8082 ?auto_8083 ?auto_8084 ?auto_8085 ?auto_8086 ?auto_8087 ?auto_8089 ?auto_8088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8115 - SURFACE
      ?auto_8116 - SURFACE
    )
    :vars
    (
      ?auto_8117 - HOIST
      ?auto_8118 - PLACE
      ?auto_8120 - PLACE
      ?auto_8121 - HOIST
      ?auto_8122 - SURFACE
      ?auto_8119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8117 ?auto_8118 ) ( SURFACE-AT ?auto_8115 ?auto_8118 ) ( CLEAR ?auto_8115 ) ( IS-CRATE ?auto_8116 ) ( AVAILABLE ?auto_8117 ) ( not ( = ?auto_8120 ?auto_8118 ) ) ( HOIST-AT ?auto_8121 ?auto_8120 ) ( AVAILABLE ?auto_8121 ) ( SURFACE-AT ?auto_8116 ?auto_8120 ) ( ON ?auto_8116 ?auto_8122 ) ( CLEAR ?auto_8116 ) ( TRUCK-AT ?auto_8119 ?auto_8118 ) ( not ( = ?auto_8115 ?auto_8116 ) ) ( not ( = ?auto_8115 ?auto_8122 ) ) ( not ( = ?auto_8116 ?auto_8122 ) ) ( not ( = ?auto_8117 ?auto_8121 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8119 ?auto_8118 ?auto_8120 )
      ( !LIFT ?auto_8121 ?auto_8116 ?auto_8122 ?auto_8120 )
      ( !LOAD ?auto_8121 ?auto_8116 ?auto_8119 ?auto_8120 )
      ( !DRIVE ?auto_8119 ?auto_8120 ?auto_8118 )
      ( !UNLOAD ?auto_8117 ?auto_8116 ?auto_8119 ?auto_8118 )
      ( !DROP ?auto_8117 ?auto_8116 ?auto_8115 ?auto_8118 )
      ( MAKE-1CRATE-VERIFY ?auto_8115 ?auto_8116 ) )
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
      ?auto_8142 - SURFACE
      ?auto_8141 - SURFACE
      ?auto_8140 - SURFACE
    )
    :vars
    (
      ?auto_8145 - HOIST
      ?auto_8148 - PLACE
      ?auto_8146 - PLACE
      ?auto_8147 - HOIST
      ?auto_8143 - SURFACE
      ?auto_8165 - PLACE
      ?auto_8163 - HOIST
      ?auto_8167 - SURFACE
      ?auto_8160 - PLACE
      ?auto_8159 - HOIST
      ?auto_8166 - SURFACE
      ?auto_8157 - SURFACE
      ?auto_8154 - PLACE
      ?auto_8168 - HOIST
      ?auto_8158 - SURFACE
      ?auto_8164 - PLACE
      ?auto_8152 - HOIST
      ?auto_8151 - SURFACE
      ?auto_8161 - PLACE
      ?auto_8153 - HOIST
      ?auto_8150 - SURFACE
      ?auto_8155 - SURFACE
      ?auto_8156 - PLACE
      ?auto_8149 - HOIST
      ?auto_8162 - SURFACE
      ?auto_8144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8145 ?auto_8148 ) ( IS-CRATE ?auto_8140 ) ( not ( = ?auto_8146 ?auto_8148 ) ) ( HOIST-AT ?auto_8147 ?auto_8146 ) ( AVAILABLE ?auto_8147 ) ( SURFACE-AT ?auto_8140 ?auto_8146 ) ( ON ?auto_8140 ?auto_8143 ) ( CLEAR ?auto_8140 ) ( not ( = ?auto_8141 ?auto_8140 ) ) ( not ( = ?auto_8141 ?auto_8143 ) ) ( not ( = ?auto_8140 ?auto_8143 ) ) ( not ( = ?auto_8145 ?auto_8147 ) ) ( IS-CRATE ?auto_8141 ) ( not ( = ?auto_8165 ?auto_8148 ) ) ( HOIST-AT ?auto_8163 ?auto_8165 ) ( SURFACE-AT ?auto_8141 ?auto_8165 ) ( ON ?auto_8141 ?auto_8167 ) ( CLEAR ?auto_8141 ) ( not ( = ?auto_8142 ?auto_8141 ) ) ( not ( = ?auto_8142 ?auto_8167 ) ) ( not ( = ?auto_8141 ?auto_8167 ) ) ( not ( = ?auto_8145 ?auto_8163 ) ) ( IS-CRATE ?auto_8142 ) ( not ( = ?auto_8160 ?auto_8148 ) ) ( HOIST-AT ?auto_8159 ?auto_8160 ) ( AVAILABLE ?auto_8159 ) ( SURFACE-AT ?auto_8142 ?auto_8160 ) ( ON ?auto_8142 ?auto_8166 ) ( CLEAR ?auto_8142 ) ( not ( = ?auto_8139 ?auto_8142 ) ) ( not ( = ?auto_8139 ?auto_8166 ) ) ( not ( = ?auto_8142 ?auto_8166 ) ) ( not ( = ?auto_8145 ?auto_8159 ) ) ( IS-CRATE ?auto_8139 ) ( AVAILABLE ?auto_8163 ) ( SURFACE-AT ?auto_8139 ?auto_8165 ) ( ON ?auto_8139 ?auto_8157 ) ( CLEAR ?auto_8139 ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8138 ?auto_8157 ) ) ( not ( = ?auto_8139 ?auto_8157 ) ) ( IS-CRATE ?auto_8138 ) ( not ( = ?auto_8154 ?auto_8148 ) ) ( HOIST-AT ?auto_8168 ?auto_8154 ) ( AVAILABLE ?auto_8168 ) ( SURFACE-AT ?auto_8138 ?auto_8154 ) ( ON ?auto_8138 ?auto_8158 ) ( CLEAR ?auto_8138 ) ( not ( = ?auto_8137 ?auto_8138 ) ) ( not ( = ?auto_8137 ?auto_8158 ) ) ( not ( = ?auto_8138 ?auto_8158 ) ) ( not ( = ?auto_8145 ?auto_8168 ) ) ( IS-CRATE ?auto_8137 ) ( not ( = ?auto_8164 ?auto_8148 ) ) ( HOIST-AT ?auto_8152 ?auto_8164 ) ( AVAILABLE ?auto_8152 ) ( SURFACE-AT ?auto_8137 ?auto_8164 ) ( ON ?auto_8137 ?auto_8151 ) ( CLEAR ?auto_8137 ) ( not ( = ?auto_8136 ?auto_8137 ) ) ( not ( = ?auto_8136 ?auto_8151 ) ) ( not ( = ?auto_8137 ?auto_8151 ) ) ( not ( = ?auto_8145 ?auto_8152 ) ) ( IS-CRATE ?auto_8136 ) ( not ( = ?auto_8161 ?auto_8148 ) ) ( HOIST-AT ?auto_8153 ?auto_8161 ) ( SURFACE-AT ?auto_8136 ?auto_8161 ) ( ON ?auto_8136 ?auto_8150 ) ( CLEAR ?auto_8136 ) ( not ( = ?auto_8135 ?auto_8136 ) ) ( not ( = ?auto_8135 ?auto_8150 ) ) ( not ( = ?auto_8136 ?auto_8150 ) ) ( not ( = ?auto_8145 ?auto_8153 ) ) ( IS-CRATE ?auto_8135 ) ( AVAILABLE ?auto_8153 ) ( SURFACE-AT ?auto_8135 ?auto_8161 ) ( ON ?auto_8135 ?auto_8155 ) ( CLEAR ?auto_8135 ) ( not ( = ?auto_8134 ?auto_8135 ) ) ( not ( = ?auto_8134 ?auto_8155 ) ) ( not ( = ?auto_8135 ?auto_8155 ) ) ( SURFACE-AT ?auto_8133 ?auto_8148 ) ( CLEAR ?auto_8133 ) ( IS-CRATE ?auto_8134 ) ( AVAILABLE ?auto_8145 ) ( not ( = ?auto_8156 ?auto_8148 ) ) ( HOIST-AT ?auto_8149 ?auto_8156 ) ( AVAILABLE ?auto_8149 ) ( SURFACE-AT ?auto_8134 ?auto_8156 ) ( ON ?auto_8134 ?auto_8162 ) ( CLEAR ?auto_8134 ) ( TRUCK-AT ?auto_8144 ?auto_8148 ) ( not ( = ?auto_8133 ?auto_8134 ) ) ( not ( = ?auto_8133 ?auto_8162 ) ) ( not ( = ?auto_8134 ?auto_8162 ) ) ( not ( = ?auto_8145 ?auto_8149 ) ) ( not ( = ?auto_8133 ?auto_8135 ) ) ( not ( = ?auto_8133 ?auto_8155 ) ) ( not ( = ?auto_8135 ?auto_8162 ) ) ( not ( = ?auto_8161 ?auto_8156 ) ) ( not ( = ?auto_8153 ?auto_8149 ) ) ( not ( = ?auto_8155 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8136 ) ) ( not ( = ?auto_8133 ?auto_8150 ) ) ( not ( = ?auto_8134 ?auto_8136 ) ) ( not ( = ?auto_8134 ?auto_8150 ) ) ( not ( = ?auto_8136 ?auto_8155 ) ) ( not ( = ?auto_8136 ?auto_8162 ) ) ( not ( = ?auto_8150 ?auto_8155 ) ) ( not ( = ?auto_8150 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8137 ) ) ( not ( = ?auto_8133 ?auto_8151 ) ) ( not ( = ?auto_8134 ?auto_8137 ) ) ( not ( = ?auto_8134 ?auto_8151 ) ) ( not ( = ?auto_8135 ?auto_8137 ) ) ( not ( = ?auto_8135 ?auto_8151 ) ) ( not ( = ?auto_8137 ?auto_8150 ) ) ( not ( = ?auto_8137 ?auto_8155 ) ) ( not ( = ?auto_8137 ?auto_8162 ) ) ( not ( = ?auto_8164 ?auto_8161 ) ) ( not ( = ?auto_8164 ?auto_8156 ) ) ( not ( = ?auto_8152 ?auto_8153 ) ) ( not ( = ?auto_8152 ?auto_8149 ) ) ( not ( = ?auto_8151 ?auto_8150 ) ) ( not ( = ?auto_8151 ?auto_8155 ) ) ( not ( = ?auto_8151 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8138 ) ) ( not ( = ?auto_8133 ?auto_8158 ) ) ( not ( = ?auto_8134 ?auto_8138 ) ) ( not ( = ?auto_8134 ?auto_8158 ) ) ( not ( = ?auto_8135 ?auto_8138 ) ) ( not ( = ?auto_8135 ?auto_8158 ) ) ( not ( = ?auto_8136 ?auto_8138 ) ) ( not ( = ?auto_8136 ?auto_8158 ) ) ( not ( = ?auto_8138 ?auto_8151 ) ) ( not ( = ?auto_8138 ?auto_8150 ) ) ( not ( = ?auto_8138 ?auto_8155 ) ) ( not ( = ?auto_8138 ?auto_8162 ) ) ( not ( = ?auto_8154 ?auto_8164 ) ) ( not ( = ?auto_8154 ?auto_8161 ) ) ( not ( = ?auto_8154 ?auto_8156 ) ) ( not ( = ?auto_8168 ?auto_8152 ) ) ( not ( = ?auto_8168 ?auto_8153 ) ) ( not ( = ?auto_8168 ?auto_8149 ) ) ( not ( = ?auto_8158 ?auto_8151 ) ) ( not ( = ?auto_8158 ?auto_8150 ) ) ( not ( = ?auto_8158 ?auto_8155 ) ) ( not ( = ?auto_8158 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8139 ) ) ( not ( = ?auto_8133 ?auto_8157 ) ) ( not ( = ?auto_8134 ?auto_8139 ) ) ( not ( = ?auto_8134 ?auto_8157 ) ) ( not ( = ?auto_8135 ?auto_8139 ) ) ( not ( = ?auto_8135 ?auto_8157 ) ) ( not ( = ?auto_8136 ?auto_8139 ) ) ( not ( = ?auto_8136 ?auto_8157 ) ) ( not ( = ?auto_8137 ?auto_8139 ) ) ( not ( = ?auto_8137 ?auto_8157 ) ) ( not ( = ?auto_8139 ?auto_8158 ) ) ( not ( = ?auto_8139 ?auto_8151 ) ) ( not ( = ?auto_8139 ?auto_8150 ) ) ( not ( = ?auto_8139 ?auto_8155 ) ) ( not ( = ?auto_8139 ?auto_8162 ) ) ( not ( = ?auto_8165 ?auto_8154 ) ) ( not ( = ?auto_8165 ?auto_8164 ) ) ( not ( = ?auto_8165 ?auto_8161 ) ) ( not ( = ?auto_8165 ?auto_8156 ) ) ( not ( = ?auto_8163 ?auto_8168 ) ) ( not ( = ?auto_8163 ?auto_8152 ) ) ( not ( = ?auto_8163 ?auto_8153 ) ) ( not ( = ?auto_8163 ?auto_8149 ) ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8151 ) ) ( not ( = ?auto_8157 ?auto_8150 ) ) ( not ( = ?auto_8157 ?auto_8155 ) ) ( not ( = ?auto_8157 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8142 ) ) ( not ( = ?auto_8133 ?auto_8166 ) ) ( not ( = ?auto_8134 ?auto_8142 ) ) ( not ( = ?auto_8134 ?auto_8166 ) ) ( not ( = ?auto_8135 ?auto_8142 ) ) ( not ( = ?auto_8135 ?auto_8166 ) ) ( not ( = ?auto_8136 ?auto_8142 ) ) ( not ( = ?auto_8136 ?auto_8166 ) ) ( not ( = ?auto_8137 ?auto_8142 ) ) ( not ( = ?auto_8137 ?auto_8166 ) ) ( not ( = ?auto_8138 ?auto_8142 ) ) ( not ( = ?auto_8138 ?auto_8166 ) ) ( not ( = ?auto_8142 ?auto_8157 ) ) ( not ( = ?auto_8142 ?auto_8158 ) ) ( not ( = ?auto_8142 ?auto_8151 ) ) ( not ( = ?auto_8142 ?auto_8150 ) ) ( not ( = ?auto_8142 ?auto_8155 ) ) ( not ( = ?auto_8142 ?auto_8162 ) ) ( not ( = ?auto_8160 ?auto_8165 ) ) ( not ( = ?auto_8160 ?auto_8154 ) ) ( not ( = ?auto_8160 ?auto_8164 ) ) ( not ( = ?auto_8160 ?auto_8161 ) ) ( not ( = ?auto_8160 ?auto_8156 ) ) ( not ( = ?auto_8159 ?auto_8163 ) ) ( not ( = ?auto_8159 ?auto_8168 ) ) ( not ( = ?auto_8159 ?auto_8152 ) ) ( not ( = ?auto_8159 ?auto_8153 ) ) ( not ( = ?auto_8159 ?auto_8149 ) ) ( not ( = ?auto_8166 ?auto_8157 ) ) ( not ( = ?auto_8166 ?auto_8158 ) ) ( not ( = ?auto_8166 ?auto_8151 ) ) ( not ( = ?auto_8166 ?auto_8150 ) ) ( not ( = ?auto_8166 ?auto_8155 ) ) ( not ( = ?auto_8166 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8141 ) ) ( not ( = ?auto_8133 ?auto_8167 ) ) ( not ( = ?auto_8134 ?auto_8141 ) ) ( not ( = ?auto_8134 ?auto_8167 ) ) ( not ( = ?auto_8135 ?auto_8141 ) ) ( not ( = ?auto_8135 ?auto_8167 ) ) ( not ( = ?auto_8136 ?auto_8141 ) ) ( not ( = ?auto_8136 ?auto_8167 ) ) ( not ( = ?auto_8137 ?auto_8141 ) ) ( not ( = ?auto_8137 ?auto_8167 ) ) ( not ( = ?auto_8138 ?auto_8141 ) ) ( not ( = ?auto_8138 ?auto_8167 ) ) ( not ( = ?auto_8139 ?auto_8141 ) ) ( not ( = ?auto_8139 ?auto_8167 ) ) ( not ( = ?auto_8141 ?auto_8166 ) ) ( not ( = ?auto_8141 ?auto_8157 ) ) ( not ( = ?auto_8141 ?auto_8158 ) ) ( not ( = ?auto_8141 ?auto_8151 ) ) ( not ( = ?auto_8141 ?auto_8150 ) ) ( not ( = ?auto_8141 ?auto_8155 ) ) ( not ( = ?auto_8141 ?auto_8162 ) ) ( not ( = ?auto_8167 ?auto_8166 ) ) ( not ( = ?auto_8167 ?auto_8157 ) ) ( not ( = ?auto_8167 ?auto_8158 ) ) ( not ( = ?auto_8167 ?auto_8151 ) ) ( not ( = ?auto_8167 ?auto_8150 ) ) ( not ( = ?auto_8167 ?auto_8155 ) ) ( not ( = ?auto_8167 ?auto_8162 ) ) ( not ( = ?auto_8133 ?auto_8140 ) ) ( not ( = ?auto_8133 ?auto_8143 ) ) ( not ( = ?auto_8134 ?auto_8140 ) ) ( not ( = ?auto_8134 ?auto_8143 ) ) ( not ( = ?auto_8135 ?auto_8140 ) ) ( not ( = ?auto_8135 ?auto_8143 ) ) ( not ( = ?auto_8136 ?auto_8140 ) ) ( not ( = ?auto_8136 ?auto_8143 ) ) ( not ( = ?auto_8137 ?auto_8140 ) ) ( not ( = ?auto_8137 ?auto_8143 ) ) ( not ( = ?auto_8138 ?auto_8140 ) ) ( not ( = ?auto_8138 ?auto_8143 ) ) ( not ( = ?auto_8139 ?auto_8140 ) ) ( not ( = ?auto_8139 ?auto_8143 ) ) ( not ( = ?auto_8142 ?auto_8140 ) ) ( not ( = ?auto_8142 ?auto_8143 ) ) ( not ( = ?auto_8140 ?auto_8167 ) ) ( not ( = ?auto_8140 ?auto_8166 ) ) ( not ( = ?auto_8140 ?auto_8157 ) ) ( not ( = ?auto_8140 ?auto_8158 ) ) ( not ( = ?auto_8140 ?auto_8151 ) ) ( not ( = ?auto_8140 ?auto_8150 ) ) ( not ( = ?auto_8140 ?auto_8155 ) ) ( not ( = ?auto_8140 ?auto_8162 ) ) ( not ( = ?auto_8146 ?auto_8165 ) ) ( not ( = ?auto_8146 ?auto_8160 ) ) ( not ( = ?auto_8146 ?auto_8154 ) ) ( not ( = ?auto_8146 ?auto_8164 ) ) ( not ( = ?auto_8146 ?auto_8161 ) ) ( not ( = ?auto_8146 ?auto_8156 ) ) ( not ( = ?auto_8147 ?auto_8163 ) ) ( not ( = ?auto_8147 ?auto_8159 ) ) ( not ( = ?auto_8147 ?auto_8168 ) ) ( not ( = ?auto_8147 ?auto_8152 ) ) ( not ( = ?auto_8147 ?auto_8153 ) ) ( not ( = ?auto_8147 ?auto_8149 ) ) ( not ( = ?auto_8143 ?auto_8167 ) ) ( not ( = ?auto_8143 ?auto_8166 ) ) ( not ( = ?auto_8143 ?auto_8157 ) ) ( not ( = ?auto_8143 ?auto_8158 ) ) ( not ( = ?auto_8143 ?auto_8151 ) ) ( not ( = ?auto_8143 ?auto_8150 ) ) ( not ( = ?auto_8143 ?auto_8155 ) ) ( not ( = ?auto_8143 ?auto_8162 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8133 ?auto_8134 ?auto_8135 ?auto_8136 ?auto_8137 ?auto_8138 ?auto_8139 ?auto_8142 ?auto_8141 )
      ( MAKE-1CRATE ?auto_8141 ?auto_8140 )
      ( MAKE-9CRATE-VERIFY ?auto_8133 ?auto_8134 ?auto_8135 ?auto_8136 ?auto_8137 ?auto_8138 ?auto_8139 ?auto_8142 ?auto_8141 ?auto_8140 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8171 - SURFACE
      ?auto_8172 - SURFACE
    )
    :vars
    (
      ?auto_8173 - HOIST
      ?auto_8174 - PLACE
      ?auto_8176 - PLACE
      ?auto_8177 - HOIST
      ?auto_8178 - SURFACE
      ?auto_8175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8173 ?auto_8174 ) ( SURFACE-AT ?auto_8171 ?auto_8174 ) ( CLEAR ?auto_8171 ) ( IS-CRATE ?auto_8172 ) ( AVAILABLE ?auto_8173 ) ( not ( = ?auto_8176 ?auto_8174 ) ) ( HOIST-AT ?auto_8177 ?auto_8176 ) ( AVAILABLE ?auto_8177 ) ( SURFACE-AT ?auto_8172 ?auto_8176 ) ( ON ?auto_8172 ?auto_8178 ) ( CLEAR ?auto_8172 ) ( TRUCK-AT ?auto_8175 ?auto_8174 ) ( not ( = ?auto_8171 ?auto_8172 ) ) ( not ( = ?auto_8171 ?auto_8178 ) ) ( not ( = ?auto_8172 ?auto_8178 ) ) ( not ( = ?auto_8173 ?auto_8177 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8175 ?auto_8174 ?auto_8176 )
      ( !LIFT ?auto_8177 ?auto_8172 ?auto_8178 ?auto_8176 )
      ( !LOAD ?auto_8177 ?auto_8172 ?auto_8175 ?auto_8176 )
      ( !DRIVE ?auto_8175 ?auto_8176 ?auto_8174 )
      ( !UNLOAD ?auto_8173 ?auto_8172 ?auto_8175 ?auto_8174 )
      ( !DROP ?auto_8173 ?auto_8172 ?auto_8171 ?auto_8174 )
      ( MAKE-1CRATE-VERIFY ?auto_8171 ?auto_8172 ) )
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
      ?auto_8199 - SURFACE
      ?auto_8198 - SURFACE
      ?auto_8197 - SURFACE
      ?auto_8200 - SURFACE
    )
    :vars
    (
      ?auto_8205 - HOIST
      ?auto_8203 - PLACE
      ?auto_8201 - PLACE
      ?auto_8204 - HOIST
      ?auto_8206 - SURFACE
      ?auto_8215 - PLACE
      ?auto_8220 - HOIST
      ?auto_8210 - SURFACE
      ?auto_8207 - PLACE
      ?auto_8214 - HOIST
      ?auto_8226 - SURFACE
      ?auto_8219 - PLACE
      ?auto_8209 - HOIST
      ?auto_8224 - SURFACE
      ?auto_8211 - SURFACE
      ?auto_8222 - PLACE
      ?auto_8227 - HOIST
      ?auto_8212 - SURFACE
      ?auto_8218 - PLACE
      ?auto_8225 - HOIST
      ?auto_8208 - SURFACE
      ?auto_8217 - PLACE
      ?auto_8223 - HOIST
      ?auto_8216 - SURFACE
      ?auto_8221 - SURFACE
      ?auto_8213 - SURFACE
      ?auto_8202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8205 ?auto_8203 ) ( IS-CRATE ?auto_8200 ) ( not ( = ?auto_8201 ?auto_8203 ) ) ( HOIST-AT ?auto_8204 ?auto_8201 ) ( SURFACE-AT ?auto_8200 ?auto_8201 ) ( ON ?auto_8200 ?auto_8206 ) ( CLEAR ?auto_8200 ) ( not ( = ?auto_8197 ?auto_8200 ) ) ( not ( = ?auto_8197 ?auto_8206 ) ) ( not ( = ?auto_8200 ?auto_8206 ) ) ( not ( = ?auto_8205 ?auto_8204 ) ) ( IS-CRATE ?auto_8197 ) ( not ( = ?auto_8215 ?auto_8203 ) ) ( HOIST-AT ?auto_8220 ?auto_8215 ) ( AVAILABLE ?auto_8220 ) ( SURFACE-AT ?auto_8197 ?auto_8215 ) ( ON ?auto_8197 ?auto_8210 ) ( CLEAR ?auto_8197 ) ( not ( = ?auto_8198 ?auto_8197 ) ) ( not ( = ?auto_8198 ?auto_8210 ) ) ( not ( = ?auto_8197 ?auto_8210 ) ) ( not ( = ?auto_8205 ?auto_8220 ) ) ( IS-CRATE ?auto_8198 ) ( not ( = ?auto_8207 ?auto_8203 ) ) ( HOIST-AT ?auto_8214 ?auto_8207 ) ( SURFACE-AT ?auto_8198 ?auto_8207 ) ( ON ?auto_8198 ?auto_8226 ) ( CLEAR ?auto_8198 ) ( not ( = ?auto_8199 ?auto_8198 ) ) ( not ( = ?auto_8199 ?auto_8226 ) ) ( not ( = ?auto_8198 ?auto_8226 ) ) ( not ( = ?auto_8205 ?auto_8214 ) ) ( IS-CRATE ?auto_8199 ) ( not ( = ?auto_8219 ?auto_8203 ) ) ( HOIST-AT ?auto_8209 ?auto_8219 ) ( AVAILABLE ?auto_8209 ) ( SURFACE-AT ?auto_8199 ?auto_8219 ) ( ON ?auto_8199 ?auto_8224 ) ( CLEAR ?auto_8199 ) ( not ( = ?auto_8196 ?auto_8199 ) ) ( not ( = ?auto_8196 ?auto_8224 ) ) ( not ( = ?auto_8199 ?auto_8224 ) ) ( not ( = ?auto_8205 ?auto_8209 ) ) ( IS-CRATE ?auto_8196 ) ( AVAILABLE ?auto_8214 ) ( SURFACE-AT ?auto_8196 ?auto_8207 ) ( ON ?auto_8196 ?auto_8211 ) ( CLEAR ?auto_8196 ) ( not ( = ?auto_8195 ?auto_8196 ) ) ( not ( = ?auto_8195 ?auto_8211 ) ) ( not ( = ?auto_8196 ?auto_8211 ) ) ( IS-CRATE ?auto_8195 ) ( not ( = ?auto_8222 ?auto_8203 ) ) ( HOIST-AT ?auto_8227 ?auto_8222 ) ( AVAILABLE ?auto_8227 ) ( SURFACE-AT ?auto_8195 ?auto_8222 ) ( ON ?auto_8195 ?auto_8212 ) ( CLEAR ?auto_8195 ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( not ( = ?auto_8194 ?auto_8212 ) ) ( not ( = ?auto_8195 ?auto_8212 ) ) ( not ( = ?auto_8205 ?auto_8227 ) ) ( IS-CRATE ?auto_8194 ) ( not ( = ?auto_8218 ?auto_8203 ) ) ( HOIST-AT ?auto_8225 ?auto_8218 ) ( AVAILABLE ?auto_8225 ) ( SURFACE-AT ?auto_8194 ?auto_8218 ) ( ON ?auto_8194 ?auto_8208 ) ( CLEAR ?auto_8194 ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8193 ?auto_8208 ) ) ( not ( = ?auto_8194 ?auto_8208 ) ) ( not ( = ?auto_8205 ?auto_8225 ) ) ( IS-CRATE ?auto_8193 ) ( not ( = ?auto_8217 ?auto_8203 ) ) ( HOIST-AT ?auto_8223 ?auto_8217 ) ( SURFACE-AT ?auto_8193 ?auto_8217 ) ( ON ?auto_8193 ?auto_8216 ) ( CLEAR ?auto_8193 ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8216 ) ) ( not ( = ?auto_8193 ?auto_8216 ) ) ( not ( = ?auto_8205 ?auto_8223 ) ) ( IS-CRATE ?auto_8192 ) ( AVAILABLE ?auto_8223 ) ( SURFACE-AT ?auto_8192 ?auto_8217 ) ( ON ?auto_8192 ?auto_8221 ) ( CLEAR ?auto_8192 ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8221 ) ) ( not ( = ?auto_8192 ?auto_8221 ) ) ( SURFACE-AT ?auto_8190 ?auto_8203 ) ( CLEAR ?auto_8190 ) ( IS-CRATE ?auto_8191 ) ( AVAILABLE ?auto_8205 ) ( AVAILABLE ?auto_8204 ) ( SURFACE-AT ?auto_8191 ?auto_8201 ) ( ON ?auto_8191 ?auto_8213 ) ( CLEAR ?auto_8191 ) ( TRUCK-AT ?auto_8202 ?auto_8203 ) ( not ( = ?auto_8190 ?auto_8191 ) ) ( not ( = ?auto_8190 ?auto_8213 ) ) ( not ( = ?auto_8191 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8192 ) ) ( not ( = ?auto_8190 ?auto_8221 ) ) ( not ( = ?auto_8192 ?auto_8213 ) ) ( not ( = ?auto_8217 ?auto_8201 ) ) ( not ( = ?auto_8223 ?auto_8204 ) ) ( not ( = ?auto_8221 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8193 ) ) ( not ( = ?auto_8190 ?auto_8216 ) ) ( not ( = ?auto_8191 ?auto_8193 ) ) ( not ( = ?auto_8191 ?auto_8216 ) ) ( not ( = ?auto_8193 ?auto_8221 ) ) ( not ( = ?auto_8193 ?auto_8213 ) ) ( not ( = ?auto_8216 ?auto_8221 ) ) ( not ( = ?auto_8216 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8194 ) ) ( not ( = ?auto_8190 ?auto_8208 ) ) ( not ( = ?auto_8191 ?auto_8194 ) ) ( not ( = ?auto_8191 ?auto_8208 ) ) ( not ( = ?auto_8192 ?auto_8194 ) ) ( not ( = ?auto_8192 ?auto_8208 ) ) ( not ( = ?auto_8194 ?auto_8216 ) ) ( not ( = ?auto_8194 ?auto_8221 ) ) ( not ( = ?auto_8194 ?auto_8213 ) ) ( not ( = ?auto_8218 ?auto_8217 ) ) ( not ( = ?auto_8218 ?auto_8201 ) ) ( not ( = ?auto_8225 ?auto_8223 ) ) ( not ( = ?auto_8225 ?auto_8204 ) ) ( not ( = ?auto_8208 ?auto_8216 ) ) ( not ( = ?auto_8208 ?auto_8221 ) ) ( not ( = ?auto_8208 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8195 ) ) ( not ( = ?auto_8190 ?auto_8212 ) ) ( not ( = ?auto_8191 ?auto_8195 ) ) ( not ( = ?auto_8191 ?auto_8212 ) ) ( not ( = ?auto_8192 ?auto_8195 ) ) ( not ( = ?auto_8192 ?auto_8212 ) ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( not ( = ?auto_8193 ?auto_8212 ) ) ( not ( = ?auto_8195 ?auto_8208 ) ) ( not ( = ?auto_8195 ?auto_8216 ) ) ( not ( = ?auto_8195 ?auto_8221 ) ) ( not ( = ?auto_8195 ?auto_8213 ) ) ( not ( = ?auto_8222 ?auto_8218 ) ) ( not ( = ?auto_8222 ?auto_8217 ) ) ( not ( = ?auto_8222 ?auto_8201 ) ) ( not ( = ?auto_8227 ?auto_8225 ) ) ( not ( = ?auto_8227 ?auto_8223 ) ) ( not ( = ?auto_8227 ?auto_8204 ) ) ( not ( = ?auto_8212 ?auto_8208 ) ) ( not ( = ?auto_8212 ?auto_8216 ) ) ( not ( = ?auto_8212 ?auto_8221 ) ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8196 ) ) ( not ( = ?auto_8190 ?auto_8211 ) ) ( not ( = ?auto_8191 ?auto_8196 ) ) ( not ( = ?auto_8191 ?auto_8211 ) ) ( not ( = ?auto_8192 ?auto_8196 ) ) ( not ( = ?auto_8192 ?auto_8211 ) ) ( not ( = ?auto_8193 ?auto_8196 ) ) ( not ( = ?auto_8193 ?auto_8211 ) ) ( not ( = ?auto_8194 ?auto_8196 ) ) ( not ( = ?auto_8194 ?auto_8211 ) ) ( not ( = ?auto_8196 ?auto_8212 ) ) ( not ( = ?auto_8196 ?auto_8208 ) ) ( not ( = ?auto_8196 ?auto_8216 ) ) ( not ( = ?auto_8196 ?auto_8221 ) ) ( not ( = ?auto_8196 ?auto_8213 ) ) ( not ( = ?auto_8207 ?auto_8222 ) ) ( not ( = ?auto_8207 ?auto_8218 ) ) ( not ( = ?auto_8207 ?auto_8217 ) ) ( not ( = ?auto_8207 ?auto_8201 ) ) ( not ( = ?auto_8214 ?auto_8227 ) ) ( not ( = ?auto_8214 ?auto_8225 ) ) ( not ( = ?auto_8214 ?auto_8223 ) ) ( not ( = ?auto_8214 ?auto_8204 ) ) ( not ( = ?auto_8211 ?auto_8212 ) ) ( not ( = ?auto_8211 ?auto_8208 ) ) ( not ( = ?auto_8211 ?auto_8216 ) ) ( not ( = ?auto_8211 ?auto_8221 ) ) ( not ( = ?auto_8211 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8199 ) ) ( not ( = ?auto_8190 ?auto_8224 ) ) ( not ( = ?auto_8191 ?auto_8199 ) ) ( not ( = ?auto_8191 ?auto_8224 ) ) ( not ( = ?auto_8192 ?auto_8199 ) ) ( not ( = ?auto_8192 ?auto_8224 ) ) ( not ( = ?auto_8193 ?auto_8199 ) ) ( not ( = ?auto_8193 ?auto_8224 ) ) ( not ( = ?auto_8194 ?auto_8199 ) ) ( not ( = ?auto_8194 ?auto_8224 ) ) ( not ( = ?auto_8195 ?auto_8199 ) ) ( not ( = ?auto_8195 ?auto_8224 ) ) ( not ( = ?auto_8199 ?auto_8211 ) ) ( not ( = ?auto_8199 ?auto_8212 ) ) ( not ( = ?auto_8199 ?auto_8208 ) ) ( not ( = ?auto_8199 ?auto_8216 ) ) ( not ( = ?auto_8199 ?auto_8221 ) ) ( not ( = ?auto_8199 ?auto_8213 ) ) ( not ( = ?auto_8219 ?auto_8207 ) ) ( not ( = ?auto_8219 ?auto_8222 ) ) ( not ( = ?auto_8219 ?auto_8218 ) ) ( not ( = ?auto_8219 ?auto_8217 ) ) ( not ( = ?auto_8219 ?auto_8201 ) ) ( not ( = ?auto_8209 ?auto_8214 ) ) ( not ( = ?auto_8209 ?auto_8227 ) ) ( not ( = ?auto_8209 ?auto_8225 ) ) ( not ( = ?auto_8209 ?auto_8223 ) ) ( not ( = ?auto_8209 ?auto_8204 ) ) ( not ( = ?auto_8224 ?auto_8211 ) ) ( not ( = ?auto_8224 ?auto_8212 ) ) ( not ( = ?auto_8224 ?auto_8208 ) ) ( not ( = ?auto_8224 ?auto_8216 ) ) ( not ( = ?auto_8224 ?auto_8221 ) ) ( not ( = ?auto_8224 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8198 ) ) ( not ( = ?auto_8190 ?auto_8226 ) ) ( not ( = ?auto_8191 ?auto_8198 ) ) ( not ( = ?auto_8191 ?auto_8226 ) ) ( not ( = ?auto_8192 ?auto_8198 ) ) ( not ( = ?auto_8192 ?auto_8226 ) ) ( not ( = ?auto_8193 ?auto_8198 ) ) ( not ( = ?auto_8193 ?auto_8226 ) ) ( not ( = ?auto_8194 ?auto_8198 ) ) ( not ( = ?auto_8194 ?auto_8226 ) ) ( not ( = ?auto_8195 ?auto_8198 ) ) ( not ( = ?auto_8195 ?auto_8226 ) ) ( not ( = ?auto_8196 ?auto_8198 ) ) ( not ( = ?auto_8196 ?auto_8226 ) ) ( not ( = ?auto_8198 ?auto_8224 ) ) ( not ( = ?auto_8198 ?auto_8211 ) ) ( not ( = ?auto_8198 ?auto_8212 ) ) ( not ( = ?auto_8198 ?auto_8208 ) ) ( not ( = ?auto_8198 ?auto_8216 ) ) ( not ( = ?auto_8198 ?auto_8221 ) ) ( not ( = ?auto_8198 ?auto_8213 ) ) ( not ( = ?auto_8226 ?auto_8224 ) ) ( not ( = ?auto_8226 ?auto_8211 ) ) ( not ( = ?auto_8226 ?auto_8212 ) ) ( not ( = ?auto_8226 ?auto_8208 ) ) ( not ( = ?auto_8226 ?auto_8216 ) ) ( not ( = ?auto_8226 ?auto_8221 ) ) ( not ( = ?auto_8226 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8197 ) ) ( not ( = ?auto_8190 ?auto_8210 ) ) ( not ( = ?auto_8191 ?auto_8197 ) ) ( not ( = ?auto_8191 ?auto_8210 ) ) ( not ( = ?auto_8192 ?auto_8197 ) ) ( not ( = ?auto_8192 ?auto_8210 ) ) ( not ( = ?auto_8193 ?auto_8197 ) ) ( not ( = ?auto_8193 ?auto_8210 ) ) ( not ( = ?auto_8194 ?auto_8197 ) ) ( not ( = ?auto_8194 ?auto_8210 ) ) ( not ( = ?auto_8195 ?auto_8197 ) ) ( not ( = ?auto_8195 ?auto_8210 ) ) ( not ( = ?auto_8196 ?auto_8197 ) ) ( not ( = ?auto_8196 ?auto_8210 ) ) ( not ( = ?auto_8199 ?auto_8197 ) ) ( not ( = ?auto_8199 ?auto_8210 ) ) ( not ( = ?auto_8197 ?auto_8226 ) ) ( not ( = ?auto_8197 ?auto_8224 ) ) ( not ( = ?auto_8197 ?auto_8211 ) ) ( not ( = ?auto_8197 ?auto_8212 ) ) ( not ( = ?auto_8197 ?auto_8208 ) ) ( not ( = ?auto_8197 ?auto_8216 ) ) ( not ( = ?auto_8197 ?auto_8221 ) ) ( not ( = ?auto_8197 ?auto_8213 ) ) ( not ( = ?auto_8215 ?auto_8207 ) ) ( not ( = ?auto_8215 ?auto_8219 ) ) ( not ( = ?auto_8215 ?auto_8222 ) ) ( not ( = ?auto_8215 ?auto_8218 ) ) ( not ( = ?auto_8215 ?auto_8217 ) ) ( not ( = ?auto_8215 ?auto_8201 ) ) ( not ( = ?auto_8220 ?auto_8214 ) ) ( not ( = ?auto_8220 ?auto_8209 ) ) ( not ( = ?auto_8220 ?auto_8227 ) ) ( not ( = ?auto_8220 ?auto_8225 ) ) ( not ( = ?auto_8220 ?auto_8223 ) ) ( not ( = ?auto_8220 ?auto_8204 ) ) ( not ( = ?auto_8210 ?auto_8226 ) ) ( not ( = ?auto_8210 ?auto_8224 ) ) ( not ( = ?auto_8210 ?auto_8211 ) ) ( not ( = ?auto_8210 ?auto_8212 ) ) ( not ( = ?auto_8210 ?auto_8208 ) ) ( not ( = ?auto_8210 ?auto_8216 ) ) ( not ( = ?auto_8210 ?auto_8221 ) ) ( not ( = ?auto_8210 ?auto_8213 ) ) ( not ( = ?auto_8190 ?auto_8200 ) ) ( not ( = ?auto_8190 ?auto_8206 ) ) ( not ( = ?auto_8191 ?auto_8200 ) ) ( not ( = ?auto_8191 ?auto_8206 ) ) ( not ( = ?auto_8192 ?auto_8200 ) ) ( not ( = ?auto_8192 ?auto_8206 ) ) ( not ( = ?auto_8193 ?auto_8200 ) ) ( not ( = ?auto_8193 ?auto_8206 ) ) ( not ( = ?auto_8194 ?auto_8200 ) ) ( not ( = ?auto_8194 ?auto_8206 ) ) ( not ( = ?auto_8195 ?auto_8200 ) ) ( not ( = ?auto_8195 ?auto_8206 ) ) ( not ( = ?auto_8196 ?auto_8200 ) ) ( not ( = ?auto_8196 ?auto_8206 ) ) ( not ( = ?auto_8199 ?auto_8200 ) ) ( not ( = ?auto_8199 ?auto_8206 ) ) ( not ( = ?auto_8198 ?auto_8200 ) ) ( not ( = ?auto_8198 ?auto_8206 ) ) ( not ( = ?auto_8200 ?auto_8210 ) ) ( not ( = ?auto_8200 ?auto_8226 ) ) ( not ( = ?auto_8200 ?auto_8224 ) ) ( not ( = ?auto_8200 ?auto_8211 ) ) ( not ( = ?auto_8200 ?auto_8212 ) ) ( not ( = ?auto_8200 ?auto_8208 ) ) ( not ( = ?auto_8200 ?auto_8216 ) ) ( not ( = ?auto_8200 ?auto_8221 ) ) ( not ( = ?auto_8200 ?auto_8213 ) ) ( not ( = ?auto_8206 ?auto_8210 ) ) ( not ( = ?auto_8206 ?auto_8226 ) ) ( not ( = ?auto_8206 ?auto_8224 ) ) ( not ( = ?auto_8206 ?auto_8211 ) ) ( not ( = ?auto_8206 ?auto_8212 ) ) ( not ( = ?auto_8206 ?auto_8208 ) ) ( not ( = ?auto_8206 ?auto_8216 ) ) ( not ( = ?auto_8206 ?auto_8221 ) ) ( not ( = ?auto_8206 ?auto_8213 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8194 ?auto_8195 ?auto_8196 ?auto_8199 ?auto_8198 ?auto_8197 )
      ( MAKE-1CRATE ?auto_8197 ?auto_8200 )
      ( MAKE-10CRATE-VERIFY ?auto_8190 ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8194 ?auto_8195 ?auto_8196 ?auto_8199 ?auto_8198 ?auto_8197 ?auto_8200 ) )
  )

)

