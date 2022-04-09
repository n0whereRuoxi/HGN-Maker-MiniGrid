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
      ?auto_7787 - SURFACE
      ?auto_7788 - SURFACE
    )
    :vars
    (
      ?auto_7789 - HOIST
      ?auto_7790 - PLACE
      ?auto_7792 - PLACE
      ?auto_7793 - HOIST
      ?auto_7794 - SURFACE
      ?auto_7791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7789 ?auto_7790 ) ( SURFACE-AT ?auto_7787 ?auto_7790 ) ( CLEAR ?auto_7787 ) ( IS-CRATE ?auto_7788 ) ( AVAILABLE ?auto_7789 ) ( not ( = ?auto_7792 ?auto_7790 ) ) ( HOIST-AT ?auto_7793 ?auto_7792 ) ( AVAILABLE ?auto_7793 ) ( SURFACE-AT ?auto_7788 ?auto_7792 ) ( ON ?auto_7788 ?auto_7794 ) ( CLEAR ?auto_7788 ) ( TRUCK-AT ?auto_7791 ?auto_7790 ) ( not ( = ?auto_7787 ?auto_7788 ) ) ( not ( = ?auto_7787 ?auto_7794 ) ) ( not ( = ?auto_7788 ?auto_7794 ) ) ( not ( = ?auto_7789 ?auto_7793 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7791 ?auto_7790 ?auto_7792 )
      ( !LIFT ?auto_7793 ?auto_7788 ?auto_7794 ?auto_7792 )
      ( !LOAD ?auto_7793 ?auto_7788 ?auto_7791 ?auto_7792 )
      ( !DRIVE ?auto_7791 ?auto_7792 ?auto_7790 )
      ( !UNLOAD ?auto_7789 ?auto_7788 ?auto_7791 ?auto_7790 )
      ( !DROP ?auto_7789 ?auto_7788 ?auto_7787 ?auto_7790 )
      ( MAKE-1CRATE-VERIFY ?auto_7787 ?auto_7788 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7808 - SURFACE
      ?auto_7809 - SURFACE
      ?auto_7810 - SURFACE
    )
    :vars
    (
      ?auto_7816 - HOIST
      ?auto_7811 - PLACE
      ?auto_7815 - PLACE
      ?auto_7812 - HOIST
      ?auto_7813 - SURFACE
      ?auto_7819 - PLACE
      ?auto_7817 - HOIST
      ?auto_7818 - SURFACE
      ?auto_7814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7816 ?auto_7811 ) ( IS-CRATE ?auto_7810 ) ( not ( = ?auto_7815 ?auto_7811 ) ) ( HOIST-AT ?auto_7812 ?auto_7815 ) ( AVAILABLE ?auto_7812 ) ( SURFACE-AT ?auto_7810 ?auto_7815 ) ( ON ?auto_7810 ?auto_7813 ) ( CLEAR ?auto_7810 ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( not ( = ?auto_7809 ?auto_7813 ) ) ( not ( = ?auto_7810 ?auto_7813 ) ) ( not ( = ?auto_7816 ?auto_7812 ) ) ( SURFACE-AT ?auto_7808 ?auto_7811 ) ( CLEAR ?auto_7808 ) ( IS-CRATE ?auto_7809 ) ( AVAILABLE ?auto_7816 ) ( not ( = ?auto_7819 ?auto_7811 ) ) ( HOIST-AT ?auto_7817 ?auto_7819 ) ( AVAILABLE ?auto_7817 ) ( SURFACE-AT ?auto_7809 ?auto_7819 ) ( ON ?auto_7809 ?auto_7818 ) ( CLEAR ?auto_7809 ) ( TRUCK-AT ?auto_7814 ?auto_7811 ) ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7818 ) ) ( not ( = ?auto_7809 ?auto_7818 ) ) ( not ( = ?auto_7816 ?auto_7817 ) ) ( not ( = ?auto_7808 ?auto_7810 ) ) ( not ( = ?auto_7808 ?auto_7813 ) ) ( not ( = ?auto_7810 ?auto_7818 ) ) ( not ( = ?auto_7815 ?auto_7819 ) ) ( not ( = ?auto_7812 ?auto_7817 ) ) ( not ( = ?auto_7813 ?auto_7818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7808 ?auto_7809 )
      ( MAKE-1CRATE ?auto_7809 ?auto_7810 )
      ( MAKE-2CRATE-VERIFY ?auto_7808 ?auto_7809 ?auto_7810 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7834 - SURFACE
      ?auto_7835 - SURFACE
      ?auto_7836 - SURFACE
      ?auto_7837 - SURFACE
    )
    :vars
    (
      ?auto_7840 - HOIST
      ?auto_7838 - PLACE
      ?auto_7842 - PLACE
      ?auto_7841 - HOIST
      ?auto_7839 - SURFACE
      ?auto_7845 - PLACE
      ?auto_7844 - HOIST
      ?auto_7847 - SURFACE
      ?auto_7846 - SURFACE
      ?auto_7843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7840 ?auto_7838 ) ( IS-CRATE ?auto_7837 ) ( not ( = ?auto_7842 ?auto_7838 ) ) ( HOIST-AT ?auto_7841 ?auto_7842 ) ( SURFACE-AT ?auto_7837 ?auto_7842 ) ( ON ?auto_7837 ?auto_7839 ) ( CLEAR ?auto_7837 ) ( not ( = ?auto_7836 ?auto_7837 ) ) ( not ( = ?auto_7836 ?auto_7839 ) ) ( not ( = ?auto_7837 ?auto_7839 ) ) ( not ( = ?auto_7840 ?auto_7841 ) ) ( IS-CRATE ?auto_7836 ) ( not ( = ?auto_7845 ?auto_7838 ) ) ( HOIST-AT ?auto_7844 ?auto_7845 ) ( AVAILABLE ?auto_7844 ) ( SURFACE-AT ?auto_7836 ?auto_7845 ) ( ON ?auto_7836 ?auto_7847 ) ( CLEAR ?auto_7836 ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( not ( = ?auto_7835 ?auto_7847 ) ) ( not ( = ?auto_7836 ?auto_7847 ) ) ( not ( = ?auto_7840 ?auto_7844 ) ) ( SURFACE-AT ?auto_7834 ?auto_7838 ) ( CLEAR ?auto_7834 ) ( IS-CRATE ?auto_7835 ) ( AVAILABLE ?auto_7840 ) ( AVAILABLE ?auto_7841 ) ( SURFACE-AT ?auto_7835 ?auto_7842 ) ( ON ?auto_7835 ?auto_7846 ) ( CLEAR ?auto_7835 ) ( TRUCK-AT ?auto_7843 ?auto_7838 ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7846 ) ) ( not ( = ?auto_7835 ?auto_7846 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7834 ?auto_7847 ) ) ( not ( = ?auto_7836 ?auto_7846 ) ) ( not ( = ?auto_7845 ?auto_7842 ) ) ( not ( = ?auto_7844 ?auto_7841 ) ) ( not ( = ?auto_7847 ?auto_7846 ) ) ( not ( = ?auto_7834 ?auto_7837 ) ) ( not ( = ?auto_7834 ?auto_7839 ) ) ( not ( = ?auto_7835 ?auto_7837 ) ) ( not ( = ?auto_7835 ?auto_7839 ) ) ( not ( = ?auto_7837 ?auto_7847 ) ) ( not ( = ?auto_7837 ?auto_7846 ) ) ( not ( = ?auto_7839 ?auto_7847 ) ) ( not ( = ?auto_7839 ?auto_7846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7834 ?auto_7835 ?auto_7836 )
      ( MAKE-1CRATE ?auto_7836 ?auto_7837 )
      ( MAKE-3CRATE-VERIFY ?auto_7834 ?auto_7835 ?auto_7836 ?auto_7837 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7863 - SURFACE
      ?auto_7864 - SURFACE
      ?auto_7865 - SURFACE
      ?auto_7866 - SURFACE
      ?auto_7867 - SURFACE
    )
    :vars
    (
      ?auto_7872 - HOIST
      ?auto_7868 - PLACE
      ?auto_7869 - PLACE
      ?auto_7871 - HOIST
      ?auto_7870 - SURFACE
      ?auto_7878 - PLACE
      ?auto_7879 - HOIST
      ?auto_7880 - SURFACE
      ?auto_7874 - PLACE
      ?auto_7875 - HOIST
      ?auto_7876 - SURFACE
      ?auto_7877 - SURFACE
      ?auto_7873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7872 ?auto_7868 ) ( IS-CRATE ?auto_7867 ) ( not ( = ?auto_7869 ?auto_7868 ) ) ( HOIST-AT ?auto_7871 ?auto_7869 ) ( AVAILABLE ?auto_7871 ) ( SURFACE-AT ?auto_7867 ?auto_7869 ) ( ON ?auto_7867 ?auto_7870 ) ( CLEAR ?auto_7867 ) ( not ( = ?auto_7866 ?auto_7867 ) ) ( not ( = ?auto_7866 ?auto_7870 ) ) ( not ( = ?auto_7867 ?auto_7870 ) ) ( not ( = ?auto_7872 ?auto_7871 ) ) ( IS-CRATE ?auto_7866 ) ( not ( = ?auto_7878 ?auto_7868 ) ) ( HOIST-AT ?auto_7879 ?auto_7878 ) ( SURFACE-AT ?auto_7866 ?auto_7878 ) ( ON ?auto_7866 ?auto_7880 ) ( CLEAR ?auto_7866 ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( not ( = ?auto_7865 ?auto_7880 ) ) ( not ( = ?auto_7866 ?auto_7880 ) ) ( not ( = ?auto_7872 ?auto_7879 ) ) ( IS-CRATE ?auto_7865 ) ( not ( = ?auto_7874 ?auto_7868 ) ) ( HOIST-AT ?auto_7875 ?auto_7874 ) ( AVAILABLE ?auto_7875 ) ( SURFACE-AT ?auto_7865 ?auto_7874 ) ( ON ?auto_7865 ?auto_7876 ) ( CLEAR ?auto_7865 ) ( not ( = ?auto_7864 ?auto_7865 ) ) ( not ( = ?auto_7864 ?auto_7876 ) ) ( not ( = ?auto_7865 ?auto_7876 ) ) ( not ( = ?auto_7872 ?auto_7875 ) ) ( SURFACE-AT ?auto_7863 ?auto_7868 ) ( CLEAR ?auto_7863 ) ( IS-CRATE ?auto_7864 ) ( AVAILABLE ?auto_7872 ) ( AVAILABLE ?auto_7879 ) ( SURFACE-AT ?auto_7864 ?auto_7878 ) ( ON ?auto_7864 ?auto_7877 ) ( CLEAR ?auto_7864 ) ( TRUCK-AT ?auto_7873 ?auto_7868 ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7877 ) ) ( not ( = ?auto_7864 ?auto_7877 ) ) ( not ( = ?auto_7863 ?auto_7865 ) ) ( not ( = ?auto_7863 ?auto_7876 ) ) ( not ( = ?auto_7865 ?auto_7877 ) ) ( not ( = ?auto_7874 ?auto_7878 ) ) ( not ( = ?auto_7875 ?auto_7879 ) ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( not ( = ?auto_7863 ?auto_7866 ) ) ( not ( = ?auto_7863 ?auto_7880 ) ) ( not ( = ?auto_7864 ?auto_7866 ) ) ( not ( = ?auto_7864 ?auto_7880 ) ) ( not ( = ?auto_7866 ?auto_7876 ) ) ( not ( = ?auto_7866 ?auto_7877 ) ) ( not ( = ?auto_7880 ?auto_7876 ) ) ( not ( = ?auto_7880 ?auto_7877 ) ) ( not ( = ?auto_7863 ?auto_7867 ) ) ( not ( = ?auto_7863 ?auto_7870 ) ) ( not ( = ?auto_7864 ?auto_7867 ) ) ( not ( = ?auto_7864 ?auto_7870 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7865 ?auto_7870 ) ) ( not ( = ?auto_7867 ?auto_7880 ) ) ( not ( = ?auto_7867 ?auto_7876 ) ) ( not ( = ?auto_7867 ?auto_7877 ) ) ( not ( = ?auto_7869 ?auto_7878 ) ) ( not ( = ?auto_7869 ?auto_7874 ) ) ( not ( = ?auto_7871 ?auto_7879 ) ) ( not ( = ?auto_7871 ?auto_7875 ) ) ( not ( = ?auto_7870 ?auto_7880 ) ) ( not ( = ?auto_7870 ?auto_7876 ) ) ( not ( = ?auto_7870 ?auto_7877 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7863 ?auto_7864 ?auto_7865 ?auto_7866 )
      ( MAKE-1CRATE ?auto_7866 ?auto_7867 )
      ( MAKE-4CRATE-VERIFY ?auto_7863 ?auto_7864 ?auto_7865 ?auto_7866 ?auto_7867 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7897 - SURFACE
      ?auto_7898 - SURFACE
      ?auto_7899 - SURFACE
      ?auto_7900 - SURFACE
      ?auto_7901 - SURFACE
      ?auto_7902 - SURFACE
    )
    :vars
    (
      ?auto_7908 - HOIST
      ?auto_7903 - PLACE
      ?auto_7906 - PLACE
      ?auto_7905 - HOIST
      ?auto_7907 - SURFACE
      ?auto_7913 - PLACE
      ?auto_7912 - HOIST
      ?auto_7914 - SURFACE
      ?auto_7909 - SURFACE
      ?auto_7910 - PLACE
      ?auto_7915 - HOIST
      ?auto_7911 - SURFACE
      ?auto_7916 - SURFACE
      ?auto_7904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7908 ?auto_7903 ) ( IS-CRATE ?auto_7902 ) ( not ( = ?auto_7906 ?auto_7903 ) ) ( HOIST-AT ?auto_7905 ?auto_7906 ) ( SURFACE-AT ?auto_7902 ?auto_7906 ) ( ON ?auto_7902 ?auto_7907 ) ( CLEAR ?auto_7902 ) ( not ( = ?auto_7901 ?auto_7902 ) ) ( not ( = ?auto_7901 ?auto_7907 ) ) ( not ( = ?auto_7902 ?auto_7907 ) ) ( not ( = ?auto_7908 ?auto_7905 ) ) ( IS-CRATE ?auto_7901 ) ( not ( = ?auto_7913 ?auto_7903 ) ) ( HOIST-AT ?auto_7912 ?auto_7913 ) ( AVAILABLE ?auto_7912 ) ( SURFACE-AT ?auto_7901 ?auto_7913 ) ( ON ?auto_7901 ?auto_7914 ) ( CLEAR ?auto_7901 ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( not ( = ?auto_7900 ?auto_7914 ) ) ( not ( = ?auto_7901 ?auto_7914 ) ) ( not ( = ?auto_7908 ?auto_7912 ) ) ( IS-CRATE ?auto_7900 ) ( SURFACE-AT ?auto_7900 ?auto_7906 ) ( ON ?auto_7900 ?auto_7909 ) ( CLEAR ?auto_7900 ) ( not ( = ?auto_7899 ?auto_7900 ) ) ( not ( = ?auto_7899 ?auto_7909 ) ) ( not ( = ?auto_7900 ?auto_7909 ) ) ( IS-CRATE ?auto_7899 ) ( not ( = ?auto_7910 ?auto_7903 ) ) ( HOIST-AT ?auto_7915 ?auto_7910 ) ( AVAILABLE ?auto_7915 ) ( SURFACE-AT ?auto_7899 ?auto_7910 ) ( ON ?auto_7899 ?auto_7911 ) ( CLEAR ?auto_7899 ) ( not ( = ?auto_7898 ?auto_7899 ) ) ( not ( = ?auto_7898 ?auto_7911 ) ) ( not ( = ?auto_7899 ?auto_7911 ) ) ( not ( = ?auto_7908 ?auto_7915 ) ) ( SURFACE-AT ?auto_7897 ?auto_7903 ) ( CLEAR ?auto_7897 ) ( IS-CRATE ?auto_7898 ) ( AVAILABLE ?auto_7908 ) ( AVAILABLE ?auto_7905 ) ( SURFACE-AT ?auto_7898 ?auto_7906 ) ( ON ?auto_7898 ?auto_7916 ) ( CLEAR ?auto_7898 ) ( TRUCK-AT ?auto_7904 ?auto_7903 ) ( not ( = ?auto_7897 ?auto_7898 ) ) ( not ( = ?auto_7897 ?auto_7916 ) ) ( not ( = ?auto_7898 ?auto_7916 ) ) ( not ( = ?auto_7897 ?auto_7899 ) ) ( not ( = ?auto_7897 ?auto_7911 ) ) ( not ( = ?auto_7899 ?auto_7916 ) ) ( not ( = ?auto_7910 ?auto_7906 ) ) ( not ( = ?auto_7915 ?auto_7905 ) ) ( not ( = ?auto_7911 ?auto_7916 ) ) ( not ( = ?auto_7897 ?auto_7900 ) ) ( not ( = ?auto_7897 ?auto_7909 ) ) ( not ( = ?auto_7898 ?auto_7900 ) ) ( not ( = ?auto_7898 ?auto_7909 ) ) ( not ( = ?auto_7900 ?auto_7911 ) ) ( not ( = ?auto_7900 ?auto_7916 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( not ( = ?auto_7909 ?auto_7916 ) ) ( not ( = ?auto_7897 ?auto_7901 ) ) ( not ( = ?auto_7897 ?auto_7914 ) ) ( not ( = ?auto_7898 ?auto_7901 ) ) ( not ( = ?auto_7898 ?auto_7914 ) ) ( not ( = ?auto_7899 ?auto_7901 ) ) ( not ( = ?auto_7899 ?auto_7914 ) ) ( not ( = ?auto_7901 ?auto_7909 ) ) ( not ( = ?auto_7901 ?auto_7911 ) ) ( not ( = ?auto_7901 ?auto_7916 ) ) ( not ( = ?auto_7913 ?auto_7906 ) ) ( not ( = ?auto_7913 ?auto_7910 ) ) ( not ( = ?auto_7912 ?auto_7905 ) ) ( not ( = ?auto_7912 ?auto_7915 ) ) ( not ( = ?auto_7914 ?auto_7909 ) ) ( not ( = ?auto_7914 ?auto_7911 ) ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( not ( = ?auto_7897 ?auto_7902 ) ) ( not ( = ?auto_7897 ?auto_7907 ) ) ( not ( = ?auto_7898 ?auto_7902 ) ) ( not ( = ?auto_7898 ?auto_7907 ) ) ( not ( = ?auto_7899 ?auto_7902 ) ) ( not ( = ?auto_7899 ?auto_7907 ) ) ( not ( = ?auto_7900 ?auto_7902 ) ) ( not ( = ?auto_7900 ?auto_7907 ) ) ( not ( = ?auto_7902 ?auto_7914 ) ) ( not ( = ?auto_7902 ?auto_7909 ) ) ( not ( = ?auto_7902 ?auto_7911 ) ) ( not ( = ?auto_7902 ?auto_7916 ) ) ( not ( = ?auto_7907 ?auto_7914 ) ) ( not ( = ?auto_7907 ?auto_7909 ) ) ( not ( = ?auto_7907 ?auto_7911 ) ) ( not ( = ?auto_7907 ?auto_7916 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7897 ?auto_7898 ?auto_7899 ?auto_7900 ?auto_7901 )
      ( MAKE-1CRATE ?auto_7901 ?auto_7902 )
      ( MAKE-5CRATE-VERIFY ?auto_7897 ?auto_7898 ?auto_7899 ?auto_7900 ?auto_7901 ?auto_7902 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7934 - SURFACE
      ?auto_7935 - SURFACE
      ?auto_7936 - SURFACE
      ?auto_7937 - SURFACE
      ?auto_7938 - SURFACE
      ?auto_7939 - SURFACE
      ?auto_7940 - SURFACE
    )
    :vars
    (
      ?auto_7941 - HOIST
      ?auto_7943 - PLACE
      ?auto_7944 - PLACE
      ?auto_7945 - HOIST
      ?auto_7946 - SURFACE
      ?auto_7947 - PLACE
      ?auto_7954 - HOIST
      ?auto_7949 - SURFACE
      ?auto_7952 - PLACE
      ?auto_7950 - HOIST
      ?auto_7948 - SURFACE
      ?auto_7951 - SURFACE
      ?auto_7953 - SURFACE
      ?auto_7955 - SURFACE
      ?auto_7942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7941 ?auto_7943 ) ( IS-CRATE ?auto_7940 ) ( not ( = ?auto_7944 ?auto_7943 ) ) ( HOIST-AT ?auto_7945 ?auto_7944 ) ( SURFACE-AT ?auto_7940 ?auto_7944 ) ( ON ?auto_7940 ?auto_7946 ) ( CLEAR ?auto_7940 ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( not ( = ?auto_7939 ?auto_7946 ) ) ( not ( = ?auto_7940 ?auto_7946 ) ) ( not ( = ?auto_7941 ?auto_7945 ) ) ( IS-CRATE ?auto_7939 ) ( not ( = ?auto_7947 ?auto_7943 ) ) ( HOIST-AT ?auto_7954 ?auto_7947 ) ( SURFACE-AT ?auto_7939 ?auto_7947 ) ( ON ?auto_7939 ?auto_7949 ) ( CLEAR ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7939 ) ) ( not ( = ?auto_7938 ?auto_7949 ) ) ( not ( = ?auto_7939 ?auto_7949 ) ) ( not ( = ?auto_7941 ?auto_7954 ) ) ( IS-CRATE ?auto_7938 ) ( not ( = ?auto_7952 ?auto_7943 ) ) ( HOIST-AT ?auto_7950 ?auto_7952 ) ( AVAILABLE ?auto_7950 ) ( SURFACE-AT ?auto_7938 ?auto_7952 ) ( ON ?auto_7938 ?auto_7948 ) ( CLEAR ?auto_7938 ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7948 ) ) ( not ( = ?auto_7938 ?auto_7948 ) ) ( not ( = ?auto_7941 ?auto_7950 ) ) ( IS-CRATE ?auto_7937 ) ( SURFACE-AT ?auto_7937 ?auto_7947 ) ( ON ?auto_7937 ?auto_7951 ) ( CLEAR ?auto_7937 ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7936 ?auto_7951 ) ) ( not ( = ?auto_7937 ?auto_7951 ) ) ( IS-CRATE ?auto_7936 ) ( AVAILABLE ?auto_7945 ) ( SURFACE-AT ?auto_7936 ?auto_7944 ) ( ON ?auto_7936 ?auto_7953 ) ( CLEAR ?auto_7936 ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7953 ) ) ( not ( = ?auto_7936 ?auto_7953 ) ) ( SURFACE-AT ?auto_7934 ?auto_7943 ) ( CLEAR ?auto_7934 ) ( IS-CRATE ?auto_7935 ) ( AVAILABLE ?auto_7941 ) ( AVAILABLE ?auto_7954 ) ( SURFACE-AT ?auto_7935 ?auto_7947 ) ( ON ?auto_7935 ?auto_7955 ) ( CLEAR ?auto_7935 ) ( TRUCK-AT ?auto_7942 ?auto_7943 ) ( not ( = ?auto_7934 ?auto_7935 ) ) ( not ( = ?auto_7934 ?auto_7955 ) ) ( not ( = ?auto_7935 ?auto_7955 ) ) ( not ( = ?auto_7934 ?auto_7936 ) ) ( not ( = ?auto_7934 ?auto_7953 ) ) ( not ( = ?auto_7936 ?auto_7955 ) ) ( not ( = ?auto_7944 ?auto_7947 ) ) ( not ( = ?auto_7945 ?auto_7954 ) ) ( not ( = ?auto_7953 ?auto_7955 ) ) ( not ( = ?auto_7934 ?auto_7937 ) ) ( not ( = ?auto_7934 ?auto_7951 ) ) ( not ( = ?auto_7935 ?auto_7937 ) ) ( not ( = ?auto_7935 ?auto_7951 ) ) ( not ( = ?auto_7937 ?auto_7953 ) ) ( not ( = ?auto_7937 ?auto_7955 ) ) ( not ( = ?auto_7951 ?auto_7953 ) ) ( not ( = ?auto_7951 ?auto_7955 ) ) ( not ( = ?auto_7934 ?auto_7938 ) ) ( not ( = ?auto_7934 ?auto_7948 ) ) ( not ( = ?auto_7935 ?auto_7938 ) ) ( not ( = ?auto_7935 ?auto_7948 ) ) ( not ( = ?auto_7936 ?auto_7938 ) ) ( not ( = ?auto_7936 ?auto_7948 ) ) ( not ( = ?auto_7938 ?auto_7951 ) ) ( not ( = ?auto_7938 ?auto_7953 ) ) ( not ( = ?auto_7938 ?auto_7955 ) ) ( not ( = ?auto_7952 ?auto_7947 ) ) ( not ( = ?auto_7952 ?auto_7944 ) ) ( not ( = ?auto_7950 ?auto_7954 ) ) ( not ( = ?auto_7950 ?auto_7945 ) ) ( not ( = ?auto_7948 ?auto_7951 ) ) ( not ( = ?auto_7948 ?auto_7953 ) ) ( not ( = ?auto_7948 ?auto_7955 ) ) ( not ( = ?auto_7934 ?auto_7939 ) ) ( not ( = ?auto_7934 ?auto_7949 ) ) ( not ( = ?auto_7935 ?auto_7939 ) ) ( not ( = ?auto_7935 ?auto_7949 ) ) ( not ( = ?auto_7936 ?auto_7939 ) ) ( not ( = ?auto_7936 ?auto_7949 ) ) ( not ( = ?auto_7937 ?auto_7939 ) ) ( not ( = ?auto_7937 ?auto_7949 ) ) ( not ( = ?auto_7939 ?auto_7948 ) ) ( not ( = ?auto_7939 ?auto_7951 ) ) ( not ( = ?auto_7939 ?auto_7953 ) ) ( not ( = ?auto_7939 ?auto_7955 ) ) ( not ( = ?auto_7949 ?auto_7948 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7949 ?auto_7953 ) ) ( not ( = ?auto_7949 ?auto_7955 ) ) ( not ( = ?auto_7934 ?auto_7940 ) ) ( not ( = ?auto_7934 ?auto_7946 ) ) ( not ( = ?auto_7935 ?auto_7940 ) ) ( not ( = ?auto_7935 ?auto_7946 ) ) ( not ( = ?auto_7936 ?auto_7940 ) ) ( not ( = ?auto_7936 ?auto_7946 ) ) ( not ( = ?auto_7937 ?auto_7940 ) ) ( not ( = ?auto_7937 ?auto_7946 ) ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( not ( = ?auto_7938 ?auto_7946 ) ) ( not ( = ?auto_7940 ?auto_7949 ) ) ( not ( = ?auto_7940 ?auto_7948 ) ) ( not ( = ?auto_7940 ?auto_7951 ) ) ( not ( = ?auto_7940 ?auto_7953 ) ) ( not ( = ?auto_7940 ?auto_7955 ) ) ( not ( = ?auto_7946 ?auto_7949 ) ) ( not ( = ?auto_7946 ?auto_7948 ) ) ( not ( = ?auto_7946 ?auto_7951 ) ) ( not ( = ?auto_7946 ?auto_7953 ) ) ( not ( = ?auto_7946 ?auto_7955 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7934 ?auto_7935 ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 )
      ( MAKE-1CRATE ?auto_7939 ?auto_7940 )
      ( MAKE-6CRATE-VERIFY ?auto_7934 ?auto_7935 ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 ?auto_7940 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7974 - SURFACE
      ?auto_7975 - SURFACE
      ?auto_7976 - SURFACE
      ?auto_7977 - SURFACE
      ?auto_7978 - SURFACE
      ?auto_7979 - SURFACE
      ?auto_7980 - SURFACE
      ?auto_7981 - SURFACE
    )
    :vars
    (
      ?auto_7983 - HOIST
      ?auto_7982 - PLACE
      ?auto_7985 - PLACE
      ?auto_7986 - HOIST
      ?auto_7987 - SURFACE
      ?auto_7996 - SURFACE
      ?auto_7988 - PLACE
      ?auto_7989 - HOIST
      ?auto_7992 - SURFACE
      ?auto_7991 - PLACE
      ?auto_7995 - HOIST
      ?auto_7993 - SURFACE
      ?auto_7990 - SURFACE
      ?auto_7994 - SURFACE
      ?auto_7997 - SURFACE
      ?auto_7984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7983 ?auto_7982 ) ( IS-CRATE ?auto_7981 ) ( not ( = ?auto_7985 ?auto_7982 ) ) ( HOIST-AT ?auto_7986 ?auto_7985 ) ( SURFACE-AT ?auto_7981 ?auto_7985 ) ( ON ?auto_7981 ?auto_7987 ) ( CLEAR ?auto_7981 ) ( not ( = ?auto_7980 ?auto_7981 ) ) ( not ( = ?auto_7980 ?auto_7987 ) ) ( not ( = ?auto_7981 ?auto_7987 ) ) ( not ( = ?auto_7983 ?auto_7986 ) ) ( IS-CRATE ?auto_7980 ) ( SURFACE-AT ?auto_7980 ?auto_7985 ) ( ON ?auto_7980 ?auto_7996 ) ( CLEAR ?auto_7980 ) ( not ( = ?auto_7979 ?auto_7980 ) ) ( not ( = ?auto_7979 ?auto_7996 ) ) ( not ( = ?auto_7980 ?auto_7996 ) ) ( IS-CRATE ?auto_7979 ) ( not ( = ?auto_7988 ?auto_7982 ) ) ( HOIST-AT ?auto_7989 ?auto_7988 ) ( SURFACE-AT ?auto_7979 ?auto_7988 ) ( ON ?auto_7979 ?auto_7992 ) ( CLEAR ?auto_7979 ) ( not ( = ?auto_7978 ?auto_7979 ) ) ( not ( = ?auto_7978 ?auto_7992 ) ) ( not ( = ?auto_7979 ?auto_7992 ) ) ( not ( = ?auto_7983 ?auto_7989 ) ) ( IS-CRATE ?auto_7978 ) ( not ( = ?auto_7991 ?auto_7982 ) ) ( HOIST-AT ?auto_7995 ?auto_7991 ) ( AVAILABLE ?auto_7995 ) ( SURFACE-AT ?auto_7978 ?auto_7991 ) ( ON ?auto_7978 ?auto_7993 ) ( CLEAR ?auto_7978 ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7993 ) ) ( not ( = ?auto_7978 ?auto_7993 ) ) ( not ( = ?auto_7983 ?auto_7995 ) ) ( IS-CRATE ?auto_7977 ) ( SURFACE-AT ?auto_7977 ?auto_7988 ) ( ON ?auto_7977 ?auto_7990 ) ( CLEAR ?auto_7977 ) ( not ( = ?auto_7976 ?auto_7977 ) ) ( not ( = ?auto_7976 ?auto_7990 ) ) ( not ( = ?auto_7977 ?auto_7990 ) ) ( IS-CRATE ?auto_7976 ) ( AVAILABLE ?auto_7986 ) ( SURFACE-AT ?auto_7976 ?auto_7985 ) ( ON ?auto_7976 ?auto_7994 ) ( CLEAR ?auto_7976 ) ( not ( = ?auto_7975 ?auto_7976 ) ) ( not ( = ?auto_7975 ?auto_7994 ) ) ( not ( = ?auto_7976 ?auto_7994 ) ) ( SURFACE-AT ?auto_7974 ?auto_7982 ) ( CLEAR ?auto_7974 ) ( IS-CRATE ?auto_7975 ) ( AVAILABLE ?auto_7983 ) ( AVAILABLE ?auto_7989 ) ( SURFACE-AT ?auto_7975 ?auto_7988 ) ( ON ?auto_7975 ?auto_7997 ) ( CLEAR ?auto_7975 ) ( TRUCK-AT ?auto_7984 ?auto_7982 ) ( not ( = ?auto_7974 ?auto_7975 ) ) ( not ( = ?auto_7974 ?auto_7997 ) ) ( not ( = ?auto_7975 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7976 ) ) ( not ( = ?auto_7974 ?auto_7994 ) ) ( not ( = ?auto_7976 ?auto_7997 ) ) ( not ( = ?auto_7985 ?auto_7988 ) ) ( not ( = ?auto_7986 ?auto_7989 ) ) ( not ( = ?auto_7994 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7977 ) ) ( not ( = ?auto_7974 ?auto_7990 ) ) ( not ( = ?auto_7975 ?auto_7977 ) ) ( not ( = ?auto_7975 ?auto_7990 ) ) ( not ( = ?auto_7977 ?auto_7994 ) ) ( not ( = ?auto_7977 ?auto_7997 ) ) ( not ( = ?auto_7990 ?auto_7994 ) ) ( not ( = ?auto_7990 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7978 ) ) ( not ( = ?auto_7974 ?auto_7993 ) ) ( not ( = ?auto_7975 ?auto_7978 ) ) ( not ( = ?auto_7975 ?auto_7993 ) ) ( not ( = ?auto_7976 ?auto_7978 ) ) ( not ( = ?auto_7976 ?auto_7993 ) ) ( not ( = ?auto_7978 ?auto_7990 ) ) ( not ( = ?auto_7978 ?auto_7994 ) ) ( not ( = ?auto_7978 ?auto_7997 ) ) ( not ( = ?auto_7991 ?auto_7988 ) ) ( not ( = ?auto_7991 ?auto_7985 ) ) ( not ( = ?auto_7995 ?auto_7989 ) ) ( not ( = ?auto_7995 ?auto_7986 ) ) ( not ( = ?auto_7993 ?auto_7990 ) ) ( not ( = ?auto_7993 ?auto_7994 ) ) ( not ( = ?auto_7993 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7979 ) ) ( not ( = ?auto_7974 ?auto_7992 ) ) ( not ( = ?auto_7975 ?auto_7979 ) ) ( not ( = ?auto_7975 ?auto_7992 ) ) ( not ( = ?auto_7976 ?auto_7979 ) ) ( not ( = ?auto_7976 ?auto_7992 ) ) ( not ( = ?auto_7977 ?auto_7979 ) ) ( not ( = ?auto_7977 ?auto_7992 ) ) ( not ( = ?auto_7979 ?auto_7993 ) ) ( not ( = ?auto_7979 ?auto_7990 ) ) ( not ( = ?auto_7979 ?auto_7994 ) ) ( not ( = ?auto_7979 ?auto_7997 ) ) ( not ( = ?auto_7992 ?auto_7993 ) ) ( not ( = ?auto_7992 ?auto_7990 ) ) ( not ( = ?auto_7992 ?auto_7994 ) ) ( not ( = ?auto_7992 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7980 ) ) ( not ( = ?auto_7974 ?auto_7996 ) ) ( not ( = ?auto_7975 ?auto_7980 ) ) ( not ( = ?auto_7975 ?auto_7996 ) ) ( not ( = ?auto_7976 ?auto_7980 ) ) ( not ( = ?auto_7976 ?auto_7996 ) ) ( not ( = ?auto_7977 ?auto_7980 ) ) ( not ( = ?auto_7977 ?auto_7996 ) ) ( not ( = ?auto_7978 ?auto_7980 ) ) ( not ( = ?auto_7978 ?auto_7996 ) ) ( not ( = ?auto_7980 ?auto_7992 ) ) ( not ( = ?auto_7980 ?auto_7993 ) ) ( not ( = ?auto_7980 ?auto_7990 ) ) ( not ( = ?auto_7980 ?auto_7994 ) ) ( not ( = ?auto_7980 ?auto_7997 ) ) ( not ( = ?auto_7996 ?auto_7992 ) ) ( not ( = ?auto_7996 ?auto_7993 ) ) ( not ( = ?auto_7996 ?auto_7990 ) ) ( not ( = ?auto_7996 ?auto_7994 ) ) ( not ( = ?auto_7996 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7981 ) ) ( not ( = ?auto_7974 ?auto_7987 ) ) ( not ( = ?auto_7975 ?auto_7981 ) ) ( not ( = ?auto_7975 ?auto_7987 ) ) ( not ( = ?auto_7976 ?auto_7981 ) ) ( not ( = ?auto_7976 ?auto_7987 ) ) ( not ( = ?auto_7977 ?auto_7981 ) ) ( not ( = ?auto_7977 ?auto_7987 ) ) ( not ( = ?auto_7978 ?auto_7981 ) ) ( not ( = ?auto_7978 ?auto_7987 ) ) ( not ( = ?auto_7979 ?auto_7981 ) ) ( not ( = ?auto_7979 ?auto_7987 ) ) ( not ( = ?auto_7981 ?auto_7996 ) ) ( not ( = ?auto_7981 ?auto_7992 ) ) ( not ( = ?auto_7981 ?auto_7993 ) ) ( not ( = ?auto_7981 ?auto_7990 ) ) ( not ( = ?auto_7981 ?auto_7994 ) ) ( not ( = ?auto_7981 ?auto_7997 ) ) ( not ( = ?auto_7987 ?auto_7996 ) ) ( not ( = ?auto_7987 ?auto_7992 ) ) ( not ( = ?auto_7987 ?auto_7993 ) ) ( not ( = ?auto_7987 ?auto_7990 ) ) ( not ( = ?auto_7987 ?auto_7994 ) ) ( not ( = ?auto_7987 ?auto_7997 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7979 ?auto_7980 )
      ( MAKE-1CRATE ?auto_7980 ?auto_7981 )
      ( MAKE-7CRATE-VERIFY ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7979 ?auto_7980 ?auto_7981 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8017 - SURFACE
      ?auto_8018 - SURFACE
      ?auto_8019 - SURFACE
      ?auto_8020 - SURFACE
      ?auto_8021 - SURFACE
      ?auto_8022 - SURFACE
      ?auto_8023 - SURFACE
      ?auto_8024 - SURFACE
      ?auto_8025 - SURFACE
    )
    :vars
    (
      ?auto_8031 - HOIST
      ?auto_8028 - PLACE
      ?auto_8030 - PLACE
      ?auto_8029 - HOIST
      ?auto_8026 - SURFACE
      ?auto_8032 - PLACE
      ?auto_8040 - HOIST
      ?auto_8033 - SURFACE
      ?auto_8042 - SURFACE
      ?auto_8038 - PLACE
      ?auto_8037 - HOIST
      ?auto_8043 - SURFACE
      ?auto_8039 - PLACE
      ?auto_8035 - HOIST
      ?auto_8041 - SURFACE
      ?auto_8036 - SURFACE
      ?auto_8044 - SURFACE
      ?auto_8034 - SURFACE
      ?auto_8027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8031 ?auto_8028 ) ( IS-CRATE ?auto_8025 ) ( not ( = ?auto_8030 ?auto_8028 ) ) ( HOIST-AT ?auto_8029 ?auto_8030 ) ( AVAILABLE ?auto_8029 ) ( SURFACE-AT ?auto_8025 ?auto_8030 ) ( ON ?auto_8025 ?auto_8026 ) ( CLEAR ?auto_8025 ) ( not ( = ?auto_8024 ?auto_8025 ) ) ( not ( = ?auto_8024 ?auto_8026 ) ) ( not ( = ?auto_8025 ?auto_8026 ) ) ( not ( = ?auto_8031 ?auto_8029 ) ) ( IS-CRATE ?auto_8024 ) ( not ( = ?auto_8032 ?auto_8028 ) ) ( HOIST-AT ?auto_8040 ?auto_8032 ) ( SURFACE-AT ?auto_8024 ?auto_8032 ) ( ON ?auto_8024 ?auto_8033 ) ( CLEAR ?auto_8024 ) ( not ( = ?auto_8023 ?auto_8024 ) ) ( not ( = ?auto_8023 ?auto_8033 ) ) ( not ( = ?auto_8024 ?auto_8033 ) ) ( not ( = ?auto_8031 ?auto_8040 ) ) ( IS-CRATE ?auto_8023 ) ( SURFACE-AT ?auto_8023 ?auto_8032 ) ( ON ?auto_8023 ?auto_8042 ) ( CLEAR ?auto_8023 ) ( not ( = ?auto_8022 ?auto_8023 ) ) ( not ( = ?auto_8022 ?auto_8042 ) ) ( not ( = ?auto_8023 ?auto_8042 ) ) ( IS-CRATE ?auto_8022 ) ( not ( = ?auto_8038 ?auto_8028 ) ) ( HOIST-AT ?auto_8037 ?auto_8038 ) ( SURFACE-AT ?auto_8022 ?auto_8038 ) ( ON ?auto_8022 ?auto_8043 ) ( CLEAR ?auto_8022 ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( not ( = ?auto_8021 ?auto_8043 ) ) ( not ( = ?auto_8022 ?auto_8043 ) ) ( not ( = ?auto_8031 ?auto_8037 ) ) ( IS-CRATE ?auto_8021 ) ( not ( = ?auto_8039 ?auto_8028 ) ) ( HOIST-AT ?auto_8035 ?auto_8039 ) ( AVAILABLE ?auto_8035 ) ( SURFACE-AT ?auto_8021 ?auto_8039 ) ( ON ?auto_8021 ?auto_8041 ) ( CLEAR ?auto_8021 ) ( not ( = ?auto_8020 ?auto_8021 ) ) ( not ( = ?auto_8020 ?auto_8041 ) ) ( not ( = ?auto_8021 ?auto_8041 ) ) ( not ( = ?auto_8031 ?auto_8035 ) ) ( IS-CRATE ?auto_8020 ) ( SURFACE-AT ?auto_8020 ?auto_8038 ) ( ON ?auto_8020 ?auto_8036 ) ( CLEAR ?auto_8020 ) ( not ( = ?auto_8019 ?auto_8020 ) ) ( not ( = ?auto_8019 ?auto_8036 ) ) ( not ( = ?auto_8020 ?auto_8036 ) ) ( IS-CRATE ?auto_8019 ) ( AVAILABLE ?auto_8040 ) ( SURFACE-AT ?auto_8019 ?auto_8032 ) ( ON ?auto_8019 ?auto_8044 ) ( CLEAR ?auto_8019 ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( not ( = ?auto_8018 ?auto_8044 ) ) ( not ( = ?auto_8019 ?auto_8044 ) ) ( SURFACE-AT ?auto_8017 ?auto_8028 ) ( CLEAR ?auto_8017 ) ( IS-CRATE ?auto_8018 ) ( AVAILABLE ?auto_8031 ) ( AVAILABLE ?auto_8037 ) ( SURFACE-AT ?auto_8018 ?auto_8038 ) ( ON ?auto_8018 ?auto_8034 ) ( CLEAR ?auto_8018 ) ( TRUCK-AT ?auto_8027 ?auto_8028 ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8034 ) ) ( not ( = ?auto_8018 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8019 ) ) ( not ( = ?auto_8017 ?auto_8044 ) ) ( not ( = ?auto_8019 ?auto_8034 ) ) ( not ( = ?auto_8032 ?auto_8038 ) ) ( not ( = ?auto_8040 ?auto_8037 ) ) ( not ( = ?auto_8044 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8020 ) ) ( not ( = ?auto_8017 ?auto_8036 ) ) ( not ( = ?auto_8018 ?auto_8020 ) ) ( not ( = ?auto_8018 ?auto_8036 ) ) ( not ( = ?auto_8020 ?auto_8044 ) ) ( not ( = ?auto_8020 ?auto_8034 ) ) ( not ( = ?auto_8036 ?auto_8044 ) ) ( not ( = ?auto_8036 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8021 ) ) ( not ( = ?auto_8017 ?auto_8041 ) ) ( not ( = ?auto_8018 ?auto_8021 ) ) ( not ( = ?auto_8018 ?auto_8041 ) ) ( not ( = ?auto_8019 ?auto_8021 ) ) ( not ( = ?auto_8019 ?auto_8041 ) ) ( not ( = ?auto_8021 ?auto_8036 ) ) ( not ( = ?auto_8021 ?auto_8044 ) ) ( not ( = ?auto_8021 ?auto_8034 ) ) ( not ( = ?auto_8039 ?auto_8038 ) ) ( not ( = ?auto_8039 ?auto_8032 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8040 ) ) ( not ( = ?auto_8041 ?auto_8036 ) ) ( not ( = ?auto_8041 ?auto_8044 ) ) ( not ( = ?auto_8041 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8022 ) ) ( not ( = ?auto_8017 ?auto_8043 ) ) ( not ( = ?auto_8018 ?auto_8022 ) ) ( not ( = ?auto_8018 ?auto_8043 ) ) ( not ( = ?auto_8019 ?auto_8022 ) ) ( not ( = ?auto_8019 ?auto_8043 ) ) ( not ( = ?auto_8020 ?auto_8022 ) ) ( not ( = ?auto_8020 ?auto_8043 ) ) ( not ( = ?auto_8022 ?auto_8041 ) ) ( not ( = ?auto_8022 ?auto_8036 ) ) ( not ( = ?auto_8022 ?auto_8044 ) ) ( not ( = ?auto_8022 ?auto_8034 ) ) ( not ( = ?auto_8043 ?auto_8041 ) ) ( not ( = ?auto_8043 ?auto_8036 ) ) ( not ( = ?auto_8043 ?auto_8044 ) ) ( not ( = ?auto_8043 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8023 ) ) ( not ( = ?auto_8017 ?auto_8042 ) ) ( not ( = ?auto_8018 ?auto_8023 ) ) ( not ( = ?auto_8018 ?auto_8042 ) ) ( not ( = ?auto_8019 ?auto_8023 ) ) ( not ( = ?auto_8019 ?auto_8042 ) ) ( not ( = ?auto_8020 ?auto_8023 ) ) ( not ( = ?auto_8020 ?auto_8042 ) ) ( not ( = ?auto_8021 ?auto_8023 ) ) ( not ( = ?auto_8021 ?auto_8042 ) ) ( not ( = ?auto_8023 ?auto_8043 ) ) ( not ( = ?auto_8023 ?auto_8041 ) ) ( not ( = ?auto_8023 ?auto_8036 ) ) ( not ( = ?auto_8023 ?auto_8044 ) ) ( not ( = ?auto_8023 ?auto_8034 ) ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8042 ?auto_8041 ) ) ( not ( = ?auto_8042 ?auto_8036 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8024 ) ) ( not ( = ?auto_8017 ?auto_8033 ) ) ( not ( = ?auto_8018 ?auto_8024 ) ) ( not ( = ?auto_8018 ?auto_8033 ) ) ( not ( = ?auto_8019 ?auto_8024 ) ) ( not ( = ?auto_8019 ?auto_8033 ) ) ( not ( = ?auto_8020 ?auto_8024 ) ) ( not ( = ?auto_8020 ?auto_8033 ) ) ( not ( = ?auto_8021 ?auto_8024 ) ) ( not ( = ?auto_8021 ?auto_8033 ) ) ( not ( = ?auto_8022 ?auto_8024 ) ) ( not ( = ?auto_8022 ?auto_8033 ) ) ( not ( = ?auto_8024 ?auto_8042 ) ) ( not ( = ?auto_8024 ?auto_8043 ) ) ( not ( = ?auto_8024 ?auto_8041 ) ) ( not ( = ?auto_8024 ?auto_8036 ) ) ( not ( = ?auto_8024 ?auto_8044 ) ) ( not ( = ?auto_8024 ?auto_8034 ) ) ( not ( = ?auto_8033 ?auto_8042 ) ) ( not ( = ?auto_8033 ?auto_8043 ) ) ( not ( = ?auto_8033 ?auto_8041 ) ) ( not ( = ?auto_8033 ?auto_8036 ) ) ( not ( = ?auto_8033 ?auto_8044 ) ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( not ( = ?auto_8017 ?auto_8025 ) ) ( not ( = ?auto_8017 ?auto_8026 ) ) ( not ( = ?auto_8018 ?auto_8025 ) ) ( not ( = ?auto_8018 ?auto_8026 ) ) ( not ( = ?auto_8019 ?auto_8025 ) ) ( not ( = ?auto_8019 ?auto_8026 ) ) ( not ( = ?auto_8020 ?auto_8025 ) ) ( not ( = ?auto_8020 ?auto_8026 ) ) ( not ( = ?auto_8021 ?auto_8025 ) ) ( not ( = ?auto_8021 ?auto_8026 ) ) ( not ( = ?auto_8022 ?auto_8025 ) ) ( not ( = ?auto_8022 ?auto_8026 ) ) ( not ( = ?auto_8023 ?auto_8025 ) ) ( not ( = ?auto_8023 ?auto_8026 ) ) ( not ( = ?auto_8025 ?auto_8033 ) ) ( not ( = ?auto_8025 ?auto_8042 ) ) ( not ( = ?auto_8025 ?auto_8043 ) ) ( not ( = ?auto_8025 ?auto_8041 ) ) ( not ( = ?auto_8025 ?auto_8036 ) ) ( not ( = ?auto_8025 ?auto_8044 ) ) ( not ( = ?auto_8025 ?auto_8034 ) ) ( not ( = ?auto_8030 ?auto_8032 ) ) ( not ( = ?auto_8030 ?auto_8038 ) ) ( not ( = ?auto_8030 ?auto_8039 ) ) ( not ( = ?auto_8029 ?auto_8040 ) ) ( not ( = ?auto_8029 ?auto_8037 ) ) ( not ( = ?auto_8029 ?auto_8035 ) ) ( not ( = ?auto_8026 ?auto_8033 ) ) ( not ( = ?auto_8026 ?auto_8042 ) ) ( not ( = ?auto_8026 ?auto_8043 ) ) ( not ( = ?auto_8026 ?auto_8041 ) ) ( not ( = ?auto_8026 ?auto_8036 ) ) ( not ( = ?auto_8026 ?auto_8044 ) ) ( not ( = ?auto_8026 ?auto_8034 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8017 ?auto_8018 ?auto_8019 ?auto_8020 ?auto_8021 ?auto_8022 ?auto_8023 ?auto_8024 )
      ( MAKE-1CRATE ?auto_8024 ?auto_8025 )
      ( MAKE-8CRATE-VERIFY ?auto_8017 ?auto_8018 ?auto_8019 ?auto_8020 ?auto_8021 ?auto_8022 ?auto_8023 ?auto_8024 ?auto_8025 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8065 - SURFACE
      ?auto_8066 - SURFACE
      ?auto_8067 - SURFACE
      ?auto_8068 - SURFACE
      ?auto_8069 - SURFACE
      ?auto_8070 - SURFACE
      ?auto_8071 - SURFACE
      ?auto_8072 - SURFACE
      ?auto_8073 - SURFACE
      ?auto_8074 - SURFACE
    )
    :vars
    (
      ?auto_8075 - HOIST
      ?auto_8078 - PLACE
      ?auto_8079 - PLACE
      ?auto_8077 - HOIST
      ?auto_8076 - SURFACE
      ?auto_8084 - PLACE
      ?auto_8092 - HOIST
      ?auto_8091 - SURFACE
      ?auto_8082 - PLACE
      ?auto_8085 - HOIST
      ?auto_8093 - SURFACE
      ?auto_8088 - SURFACE
      ?auto_8081 - PLACE
      ?auto_8087 - HOIST
      ?auto_8086 - SURFACE
      ?auto_8096 - PLACE
      ?auto_8094 - HOIST
      ?auto_8083 - SURFACE
      ?auto_8089 - SURFACE
      ?auto_8090 - SURFACE
      ?auto_8095 - SURFACE
      ?auto_8080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8075 ?auto_8078 ) ( IS-CRATE ?auto_8074 ) ( not ( = ?auto_8079 ?auto_8078 ) ) ( HOIST-AT ?auto_8077 ?auto_8079 ) ( AVAILABLE ?auto_8077 ) ( SURFACE-AT ?auto_8074 ?auto_8079 ) ( ON ?auto_8074 ?auto_8076 ) ( CLEAR ?auto_8074 ) ( not ( = ?auto_8073 ?auto_8074 ) ) ( not ( = ?auto_8073 ?auto_8076 ) ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( not ( = ?auto_8075 ?auto_8077 ) ) ( IS-CRATE ?auto_8073 ) ( not ( = ?auto_8084 ?auto_8078 ) ) ( HOIST-AT ?auto_8092 ?auto_8084 ) ( AVAILABLE ?auto_8092 ) ( SURFACE-AT ?auto_8073 ?auto_8084 ) ( ON ?auto_8073 ?auto_8091 ) ( CLEAR ?auto_8073 ) ( not ( = ?auto_8072 ?auto_8073 ) ) ( not ( = ?auto_8072 ?auto_8091 ) ) ( not ( = ?auto_8073 ?auto_8091 ) ) ( not ( = ?auto_8075 ?auto_8092 ) ) ( IS-CRATE ?auto_8072 ) ( not ( = ?auto_8082 ?auto_8078 ) ) ( HOIST-AT ?auto_8085 ?auto_8082 ) ( SURFACE-AT ?auto_8072 ?auto_8082 ) ( ON ?auto_8072 ?auto_8093 ) ( CLEAR ?auto_8072 ) ( not ( = ?auto_8071 ?auto_8072 ) ) ( not ( = ?auto_8071 ?auto_8093 ) ) ( not ( = ?auto_8072 ?auto_8093 ) ) ( not ( = ?auto_8075 ?auto_8085 ) ) ( IS-CRATE ?auto_8071 ) ( SURFACE-AT ?auto_8071 ?auto_8082 ) ( ON ?auto_8071 ?auto_8088 ) ( CLEAR ?auto_8071 ) ( not ( = ?auto_8070 ?auto_8071 ) ) ( not ( = ?auto_8070 ?auto_8088 ) ) ( not ( = ?auto_8071 ?auto_8088 ) ) ( IS-CRATE ?auto_8070 ) ( not ( = ?auto_8081 ?auto_8078 ) ) ( HOIST-AT ?auto_8087 ?auto_8081 ) ( SURFACE-AT ?auto_8070 ?auto_8081 ) ( ON ?auto_8070 ?auto_8086 ) ( CLEAR ?auto_8070 ) ( not ( = ?auto_8069 ?auto_8070 ) ) ( not ( = ?auto_8069 ?auto_8086 ) ) ( not ( = ?auto_8070 ?auto_8086 ) ) ( not ( = ?auto_8075 ?auto_8087 ) ) ( IS-CRATE ?auto_8069 ) ( not ( = ?auto_8096 ?auto_8078 ) ) ( HOIST-AT ?auto_8094 ?auto_8096 ) ( AVAILABLE ?auto_8094 ) ( SURFACE-AT ?auto_8069 ?auto_8096 ) ( ON ?auto_8069 ?auto_8083 ) ( CLEAR ?auto_8069 ) ( not ( = ?auto_8068 ?auto_8069 ) ) ( not ( = ?auto_8068 ?auto_8083 ) ) ( not ( = ?auto_8069 ?auto_8083 ) ) ( not ( = ?auto_8075 ?auto_8094 ) ) ( IS-CRATE ?auto_8068 ) ( SURFACE-AT ?auto_8068 ?auto_8081 ) ( ON ?auto_8068 ?auto_8089 ) ( CLEAR ?auto_8068 ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8089 ) ) ( not ( = ?auto_8068 ?auto_8089 ) ) ( IS-CRATE ?auto_8067 ) ( AVAILABLE ?auto_8085 ) ( SURFACE-AT ?auto_8067 ?auto_8082 ) ( ON ?auto_8067 ?auto_8090 ) ( CLEAR ?auto_8067 ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8090 ) ) ( not ( = ?auto_8067 ?auto_8090 ) ) ( SURFACE-AT ?auto_8065 ?auto_8078 ) ( CLEAR ?auto_8065 ) ( IS-CRATE ?auto_8066 ) ( AVAILABLE ?auto_8075 ) ( AVAILABLE ?auto_8087 ) ( SURFACE-AT ?auto_8066 ?auto_8081 ) ( ON ?auto_8066 ?auto_8095 ) ( CLEAR ?auto_8066 ) ( TRUCK-AT ?auto_8080 ?auto_8078 ) ( not ( = ?auto_8065 ?auto_8066 ) ) ( not ( = ?auto_8065 ?auto_8095 ) ) ( not ( = ?auto_8066 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8067 ) ) ( not ( = ?auto_8065 ?auto_8090 ) ) ( not ( = ?auto_8067 ?auto_8095 ) ) ( not ( = ?auto_8082 ?auto_8081 ) ) ( not ( = ?auto_8085 ?auto_8087 ) ) ( not ( = ?auto_8090 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8068 ) ) ( not ( = ?auto_8065 ?auto_8089 ) ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( not ( = ?auto_8066 ?auto_8089 ) ) ( not ( = ?auto_8068 ?auto_8090 ) ) ( not ( = ?auto_8068 ?auto_8095 ) ) ( not ( = ?auto_8089 ?auto_8090 ) ) ( not ( = ?auto_8089 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8069 ) ) ( not ( = ?auto_8065 ?auto_8083 ) ) ( not ( = ?auto_8066 ?auto_8069 ) ) ( not ( = ?auto_8066 ?auto_8083 ) ) ( not ( = ?auto_8067 ?auto_8069 ) ) ( not ( = ?auto_8067 ?auto_8083 ) ) ( not ( = ?auto_8069 ?auto_8089 ) ) ( not ( = ?auto_8069 ?auto_8090 ) ) ( not ( = ?auto_8069 ?auto_8095 ) ) ( not ( = ?auto_8096 ?auto_8081 ) ) ( not ( = ?auto_8096 ?auto_8082 ) ) ( not ( = ?auto_8094 ?auto_8087 ) ) ( not ( = ?auto_8094 ?auto_8085 ) ) ( not ( = ?auto_8083 ?auto_8089 ) ) ( not ( = ?auto_8083 ?auto_8090 ) ) ( not ( = ?auto_8083 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8070 ) ) ( not ( = ?auto_8065 ?auto_8086 ) ) ( not ( = ?auto_8066 ?auto_8070 ) ) ( not ( = ?auto_8066 ?auto_8086 ) ) ( not ( = ?auto_8067 ?auto_8070 ) ) ( not ( = ?auto_8067 ?auto_8086 ) ) ( not ( = ?auto_8068 ?auto_8070 ) ) ( not ( = ?auto_8068 ?auto_8086 ) ) ( not ( = ?auto_8070 ?auto_8083 ) ) ( not ( = ?auto_8070 ?auto_8089 ) ) ( not ( = ?auto_8070 ?auto_8090 ) ) ( not ( = ?auto_8070 ?auto_8095 ) ) ( not ( = ?auto_8086 ?auto_8083 ) ) ( not ( = ?auto_8086 ?auto_8089 ) ) ( not ( = ?auto_8086 ?auto_8090 ) ) ( not ( = ?auto_8086 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8071 ) ) ( not ( = ?auto_8065 ?auto_8088 ) ) ( not ( = ?auto_8066 ?auto_8071 ) ) ( not ( = ?auto_8066 ?auto_8088 ) ) ( not ( = ?auto_8067 ?auto_8071 ) ) ( not ( = ?auto_8067 ?auto_8088 ) ) ( not ( = ?auto_8068 ?auto_8071 ) ) ( not ( = ?auto_8068 ?auto_8088 ) ) ( not ( = ?auto_8069 ?auto_8071 ) ) ( not ( = ?auto_8069 ?auto_8088 ) ) ( not ( = ?auto_8071 ?auto_8086 ) ) ( not ( = ?auto_8071 ?auto_8083 ) ) ( not ( = ?auto_8071 ?auto_8089 ) ) ( not ( = ?auto_8071 ?auto_8090 ) ) ( not ( = ?auto_8071 ?auto_8095 ) ) ( not ( = ?auto_8088 ?auto_8086 ) ) ( not ( = ?auto_8088 ?auto_8083 ) ) ( not ( = ?auto_8088 ?auto_8089 ) ) ( not ( = ?auto_8088 ?auto_8090 ) ) ( not ( = ?auto_8088 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8072 ) ) ( not ( = ?auto_8065 ?auto_8093 ) ) ( not ( = ?auto_8066 ?auto_8072 ) ) ( not ( = ?auto_8066 ?auto_8093 ) ) ( not ( = ?auto_8067 ?auto_8072 ) ) ( not ( = ?auto_8067 ?auto_8093 ) ) ( not ( = ?auto_8068 ?auto_8072 ) ) ( not ( = ?auto_8068 ?auto_8093 ) ) ( not ( = ?auto_8069 ?auto_8072 ) ) ( not ( = ?auto_8069 ?auto_8093 ) ) ( not ( = ?auto_8070 ?auto_8072 ) ) ( not ( = ?auto_8070 ?auto_8093 ) ) ( not ( = ?auto_8072 ?auto_8088 ) ) ( not ( = ?auto_8072 ?auto_8086 ) ) ( not ( = ?auto_8072 ?auto_8083 ) ) ( not ( = ?auto_8072 ?auto_8089 ) ) ( not ( = ?auto_8072 ?auto_8090 ) ) ( not ( = ?auto_8072 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8088 ) ) ( not ( = ?auto_8093 ?auto_8086 ) ) ( not ( = ?auto_8093 ?auto_8083 ) ) ( not ( = ?auto_8093 ?auto_8089 ) ) ( not ( = ?auto_8093 ?auto_8090 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8073 ) ) ( not ( = ?auto_8065 ?auto_8091 ) ) ( not ( = ?auto_8066 ?auto_8073 ) ) ( not ( = ?auto_8066 ?auto_8091 ) ) ( not ( = ?auto_8067 ?auto_8073 ) ) ( not ( = ?auto_8067 ?auto_8091 ) ) ( not ( = ?auto_8068 ?auto_8073 ) ) ( not ( = ?auto_8068 ?auto_8091 ) ) ( not ( = ?auto_8069 ?auto_8073 ) ) ( not ( = ?auto_8069 ?auto_8091 ) ) ( not ( = ?auto_8070 ?auto_8073 ) ) ( not ( = ?auto_8070 ?auto_8091 ) ) ( not ( = ?auto_8071 ?auto_8073 ) ) ( not ( = ?auto_8071 ?auto_8091 ) ) ( not ( = ?auto_8073 ?auto_8093 ) ) ( not ( = ?auto_8073 ?auto_8088 ) ) ( not ( = ?auto_8073 ?auto_8086 ) ) ( not ( = ?auto_8073 ?auto_8083 ) ) ( not ( = ?auto_8073 ?auto_8089 ) ) ( not ( = ?auto_8073 ?auto_8090 ) ) ( not ( = ?auto_8073 ?auto_8095 ) ) ( not ( = ?auto_8084 ?auto_8082 ) ) ( not ( = ?auto_8084 ?auto_8081 ) ) ( not ( = ?auto_8084 ?auto_8096 ) ) ( not ( = ?auto_8092 ?auto_8085 ) ) ( not ( = ?auto_8092 ?auto_8087 ) ) ( not ( = ?auto_8092 ?auto_8094 ) ) ( not ( = ?auto_8091 ?auto_8093 ) ) ( not ( = ?auto_8091 ?auto_8088 ) ) ( not ( = ?auto_8091 ?auto_8086 ) ) ( not ( = ?auto_8091 ?auto_8083 ) ) ( not ( = ?auto_8091 ?auto_8089 ) ) ( not ( = ?auto_8091 ?auto_8090 ) ) ( not ( = ?auto_8091 ?auto_8095 ) ) ( not ( = ?auto_8065 ?auto_8074 ) ) ( not ( = ?auto_8065 ?auto_8076 ) ) ( not ( = ?auto_8066 ?auto_8074 ) ) ( not ( = ?auto_8066 ?auto_8076 ) ) ( not ( = ?auto_8067 ?auto_8074 ) ) ( not ( = ?auto_8067 ?auto_8076 ) ) ( not ( = ?auto_8068 ?auto_8074 ) ) ( not ( = ?auto_8068 ?auto_8076 ) ) ( not ( = ?auto_8069 ?auto_8074 ) ) ( not ( = ?auto_8069 ?auto_8076 ) ) ( not ( = ?auto_8070 ?auto_8074 ) ) ( not ( = ?auto_8070 ?auto_8076 ) ) ( not ( = ?auto_8071 ?auto_8074 ) ) ( not ( = ?auto_8071 ?auto_8076 ) ) ( not ( = ?auto_8072 ?auto_8074 ) ) ( not ( = ?auto_8072 ?auto_8076 ) ) ( not ( = ?auto_8074 ?auto_8091 ) ) ( not ( = ?auto_8074 ?auto_8093 ) ) ( not ( = ?auto_8074 ?auto_8088 ) ) ( not ( = ?auto_8074 ?auto_8086 ) ) ( not ( = ?auto_8074 ?auto_8083 ) ) ( not ( = ?auto_8074 ?auto_8089 ) ) ( not ( = ?auto_8074 ?auto_8090 ) ) ( not ( = ?auto_8074 ?auto_8095 ) ) ( not ( = ?auto_8079 ?auto_8084 ) ) ( not ( = ?auto_8079 ?auto_8082 ) ) ( not ( = ?auto_8079 ?auto_8081 ) ) ( not ( = ?auto_8079 ?auto_8096 ) ) ( not ( = ?auto_8077 ?auto_8092 ) ) ( not ( = ?auto_8077 ?auto_8085 ) ) ( not ( = ?auto_8077 ?auto_8087 ) ) ( not ( = ?auto_8077 ?auto_8094 ) ) ( not ( = ?auto_8076 ?auto_8091 ) ) ( not ( = ?auto_8076 ?auto_8093 ) ) ( not ( = ?auto_8076 ?auto_8088 ) ) ( not ( = ?auto_8076 ?auto_8086 ) ) ( not ( = ?auto_8076 ?auto_8083 ) ) ( not ( = ?auto_8076 ?auto_8089 ) ) ( not ( = ?auto_8076 ?auto_8090 ) ) ( not ( = ?auto_8076 ?auto_8095 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8065 ?auto_8066 ?auto_8067 ?auto_8068 ?auto_8069 ?auto_8070 ?auto_8071 ?auto_8072 ?auto_8073 )
      ( MAKE-1CRATE ?auto_8073 ?auto_8074 )
      ( MAKE-9CRATE-VERIFY ?auto_8065 ?auto_8066 ?auto_8067 ?auto_8068 ?auto_8069 ?auto_8070 ?auto_8071 ?auto_8072 ?auto_8073 ?auto_8074 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8118 - SURFACE
      ?auto_8119 - SURFACE
      ?auto_8120 - SURFACE
      ?auto_8121 - SURFACE
      ?auto_8122 - SURFACE
      ?auto_8123 - SURFACE
      ?auto_8124 - SURFACE
      ?auto_8125 - SURFACE
      ?auto_8126 - SURFACE
      ?auto_8127 - SURFACE
      ?auto_8128 - SURFACE
    )
    :vars
    (
      ?auto_8134 - HOIST
      ?auto_8132 - PLACE
      ?auto_8129 - PLACE
      ?auto_8131 - HOIST
      ?auto_8130 - SURFACE
      ?auto_8149 - PLACE
      ?auto_8144 - HOIST
      ?auto_8139 - SURFACE
      ?auto_8143 - PLACE
      ?auto_8140 - HOIST
      ?auto_8153 - SURFACE
      ?auto_8137 - PLACE
      ?auto_8142 - HOIST
      ?auto_8147 - SURFACE
      ?auto_8135 - SURFACE
      ?auto_8136 - PLACE
      ?auto_8145 - HOIST
      ?auto_8146 - SURFACE
      ?auto_8151 - PLACE
      ?auto_8150 - HOIST
      ?auto_8141 - SURFACE
      ?auto_8148 - SURFACE
      ?auto_8138 - SURFACE
      ?auto_8152 - SURFACE
      ?auto_8133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8134 ?auto_8132 ) ( IS-CRATE ?auto_8128 ) ( not ( = ?auto_8129 ?auto_8132 ) ) ( HOIST-AT ?auto_8131 ?auto_8129 ) ( AVAILABLE ?auto_8131 ) ( SURFACE-AT ?auto_8128 ?auto_8129 ) ( ON ?auto_8128 ?auto_8130 ) ( CLEAR ?auto_8128 ) ( not ( = ?auto_8127 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( not ( = ?auto_8134 ?auto_8131 ) ) ( IS-CRATE ?auto_8127 ) ( not ( = ?auto_8149 ?auto_8132 ) ) ( HOIST-AT ?auto_8144 ?auto_8149 ) ( AVAILABLE ?auto_8144 ) ( SURFACE-AT ?auto_8127 ?auto_8149 ) ( ON ?auto_8127 ?auto_8139 ) ( CLEAR ?auto_8127 ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8126 ?auto_8139 ) ) ( not ( = ?auto_8127 ?auto_8139 ) ) ( not ( = ?auto_8134 ?auto_8144 ) ) ( IS-CRATE ?auto_8126 ) ( not ( = ?auto_8143 ?auto_8132 ) ) ( HOIST-AT ?auto_8140 ?auto_8143 ) ( AVAILABLE ?auto_8140 ) ( SURFACE-AT ?auto_8126 ?auto_8143 ) ( ON ?auto_8126 ?auto_8153 ) ( CLEAR ?auto_8126 ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( not ( = ?auto_8125 ?auto_8153 ) ) ( not ( = ?auto_8126 ?auto_8153 ) ) ( not ( = ?auto_8134 ?auto_8140 ) ) ( IS-CRATE ?auto_8125 ) ( not ( = ?auto_8137 ?auto_8132 ) ) ( HOIST-AT ?auto_8142 ?auto_8137 ) ( SURFACE-AT ?auto_8125 ?auto_8137 ) ( ON ?auto_8125 ?auto_8147 ) ( CLEAR ?auto_8125 ) ( not ( = ?auto_8124 ?auto_8125 ) ) ( not ( = ?auto_8124 ?auto_8147 ) ) ( not ( = ?auto_8125 ?auto_8147 ) ) ( not ( = ?auto_8134 ?auto_8142 ) ) ( IS-CRATE ?auto_8124 ) ( SURFACE-AT ?auto_8124 ?auto_8137 ) ( ON ?auto_8124 ?auto_8135 ) ( CLEAR ?auto_8124 ) ( not ( = ?auto_8123 ?auto_8124 ) ) ( not ( = ?auto_8123 ?auto_8135 ) ) ( not ( = ?auto_8124 ?auto_8135 ) ) ( IS-CRATE ?auto_8123 ) ( not ( = ?auto_8136 ?auto_8132 ) ) ( HOIST-AT ?auto_8145 ?auto_8136 ) ( SURFACE-AT ?auto_8123 ?auto_8136 ) ( ON ?auto_8123 ?auto_8146 ) ( CLEAR ?auto_8123 ) ( not ( = ?auto_8122 ?auto_8123 ) ) ( not ( = ?auto_8122 ?auto_8146 ) ) ( not ( = ?auto_8123 ?auto_8146 ) ) ( not ( = ?auto_8134 ?auto_8145 ) ) ( IS-CRATE ?auto_8122 ) ( not ( = ?auto_8151 ?auto_8132 ) ) ( HOIST-AT ?auto_8150 ?auto_8151 ) ( AVAILABLE ?auto_8150 ) ( SURFACE-AT ?auto_8122 ?auto_8151 ) ( ON ?auto_8122 ?auto_8141 ) ( CLEAR ?auto_8122 ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( not ( = ?auto_8121 ?auto_8141 ) ) ( not ( = ?auto_8122 ?auto_8141 ) ) ( not ( = ?auto_8134 ?auto_8150 ) ) ( IS-CRATE ?auto_8121 ) ( SURFACE-AT ?auto_8121 ?auto_8136 ) ( ON ?auto_8121 ?auto_8148 ) ( CLEAR ?auto_8121 ) ( not ( = ?auto_8120 ?auto_8121 ) ) ( not ( = ?auto_8120 ?auto_8148 ) ) ( not ( = ?auto_8121 ?auto_8148 ) ) ( IS-CRATE ?auto_8120 ) ( AVAILABLE ?auto_8142 ) ( SURFACE-AT ?auto_8120 ?auto_8137 ) ( ON ?auto_8120 ?auto_8138 ) ( CLEAR ?auto_8120 ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8138 ) ) ( not ( = ?auto_8120 ?auto_8138 ) ) ( SURFACE-AT ?auto_8118 ?auto_8132 ) ( CLEAR ?auto_8118 ) ( IS-CRATE ?auto_8119 ) ( AVAILABLE ?auto_8134 ) ( AVAILABLE ?auto_8145 ) ( SURFACE-AT ?auto_8119 ?auto_8136 ) ( ON ?auto_8119 ?auto_8152 ) ( CLEAR ?auto_8119 ) ( TRUCK-AT ?auto_8133 ?auto_8132 ) ( not ( = ?auto_8118 ?auto_8119 ) ) ( not ( = ?auto_8118 ?auto_8152 ) ) ( not ( = ?auto_8119 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8120 ) ) ( not ( = ?auto_8118 ?auto_8138 ) ) ( not ( = ?auto_8120 ?auto_8152 ) ) ( not ( = ?auto_8137 ?auto_8136 ) ) ( not ( = ?auto_8142 ?auto_8145 ) ) ( not ( = ?auto_8138 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8121 ) ) ( not ( = ?auto_8118 ?auto_8148 ) ) ( not ( = ?auto_8119 ?auto_8121 ) ) ( not ( = ?auto_8119 ?auto_8148 ) ) ( not ( = ?auto_8121 ?auto_8138 ) ) ( not ( = ?auto_8121 ?auto_8152 ) ) ( not ( = ?auto_8148 ?auto_8138 ) ) ( not ( = ?auto_8148 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8122 ) ) ( not ( = ?auto_8118 ?auto_8141 ) ) ( not ( = ?auto_8119 ?auto_8122 ) ) ( not ( = ?auto_8119 ?auto_8141 ) ) ( not ( = ?auto_8120 ?auto_8122 ) ) ( not ( = ?auto_8120 ?auto_8141 ) ) ( not ( = ?auto_8122 ?auto_8148 ) ) ( not ( = ?auto_8122 ?auto_8138 ) ) ( not ( = ?auto_8122 ?auto_8152 ) ) ( not ( = ?auto_8151 ?auto_8136 ) ) ( not ( = ?auto_8151 ?auto_8137 ) ) ( not ( = ?auto_8150 ?auto_8145 ) ) ( not ( = ?auto_8150 ?auto_8142 ) ) ( not ( = ?auto_8141 ?auto_8148 ) ) ( not ( = ?auto_8141 ?auto_8138 ) ) ( not ( = ?auto_8141 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8123 ) ) ( not ( = ?auto_8118 ?auto_8146 ) ) ( not ( = ?auto_8119 ?auto_8123 ) ) ( not ( = ?auto_8119 ?auto_8146 ) ) ( not ( = ?auto_8120 ?auto_8123 ) ) ( not ( = ?auto_8120 ?auto_8146 ) ) ( not ( = ?auto_8121 ?auto_8123 ) ) ( not ( = ?auto_8121 ?auto_8146 ) ) ( not ( = ?auto_8123 ?auto_8141 ) ) ( not ( = ?auto_8123 ?auto_8148 ) ) ( not ( = ?auto_8123 ?auto_8138 ) ) ( not ( = ?auto_8123 ?auto_8152 ) ) ( not ( = ?auto_8146 ?auto_8141 ) ) ( not ( = ?auto_8146 ?auto_8148 ) ) ( not ( = ?auto_8146 ?auto_8138 ) ) ( not ( = ?auto_8146 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8124 ) ) ( not ( = ?auto_8118 ?auto_8135 ) ) ( not ( = ?auto_8119 ?auto_8124 ) ) ( not ( = ?auto_8119 ?auto_8135 ) ) ( not ( = ?auto_8120 ?auto_8124 ) ) ( not ( = ?auto_8120 ?auto_8135 ) ) ( not ( = ?auto_8121 ?auto_8124 ) ) ( not ( = ?auto_8121 ?auto_8135 ) ) ( not ( = ?auto_8122 ?auto_8124 ) ) ( not ( = ?auto_8122 ?auto_8135 ) ) ( not ( = ?auto_8124 ?auto_8146 ) ) ( not ( = ?auto_8124 ?auto_8141 ) ) ( not ( = ?auto_8124 ?auto_8148 ) ) ( not ( = ?auto_8124 ?auto_8138 ) ) ( not ( = ?auto_8124 ?auto_8152 ) ) ( not ( = ?auto_8135 ?auto_8146 ) ) ( not ( = ?auto_8135 ?auto_8141 ) ) ( not ( = ?auto_8135 ?auto_8148 ) ) ( not ( = ?auto_8135 ?auto_8138 ) ) ( not ( = ?auto_8135 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8125 ) ) ( not ( = ?auto_8118 ?auto_8147 ) ) ( not ( = ?auto_8119 ?auto_8125 ) ) ( not ( = ?auto_8119 ?auto_8147 ) ) ( not ( = ?auto_8120 ?auto_8125 ) ) ( not ( = ?auto_8120 ?auto_8147 ) ) ( not ( = ?auto_8121 ?auto_8125 ) ) ( not ( = ?auto_8121 ?auto_8147 ) ) ( not ( = ?auto_8122 ?auto_8125 ) ) ( not ( = ?auto_8122 ?auto_8147 ) ) ( not ( = ?auto_8123 ?auto_8125 ) ) ( not ( = ?auto_8123 ?auto_8147 ) ) ( not ( = ?auto_8125 ?auto_8135 ) ) ( not ( = ?auto_8125 ?auto_8146 ) ) ( not ( = ?auto_8125 ?auto_8141 ) ) ( not ( = ?auto_8125 ?auto_8148 ) ) ( not ( = ?auto_8125 ?auto_8138 ) ) ( not ( = ?auto_8125 ?auto_8152 ) ) ( not ( = ?auto_8147 ?auto_8135 ) ) ( not ( = ?auto_8147 ?auto_8146 ) ) ( not ( = ?auto_8147 ?auto_8141 ) ) ( not ( = ?auto_8147 ?auto_8148 ) ) ( not ( = ?auto_8147 ?auto_8138 ) ) ( not ( = ?auto_8147 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8126 ) ) ( not ( = ?auto_8118 ?auto_8153 ) ) ( not ( = ?auto_8119 ?auto_8126 ) ) ( not ( = ?auto_8119 ?auto_8153 ) ) ( not ( = ?auto_8120 ?auto_8126 ) ) ( not ( = ?auto_8120 ?auto_8153 ) ) ( not ( = ?auto_8121 ?auto_8126 ) ) ( not ( = ?auto_8121 ?auto_8153 ) ) ( not ( = ?auto_8122 ?auto_8126 ) ) ( not ( = ?auto_8122 ?auto_8153 ) ) ( not ( = ?auto_8123 ?auto_8126 ) ) ( not ( = ?auto_8123 ?auto_8153 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8153 ) ) ( not ( = ?auto_8126 ?auto_8147 ) ) ( not ( = ?auto_8126 ?auto_8135 ) ) ( not ( = ?auto_8126 ?auto_8146 ) ) ( not ( = ?auto_8126 ?auto_8141 ) ) ( not ( = ?auto_8126 ?auto_8148 ) ) ( not ( = ?auto_8126 ?auto_8138 ) ) ( not ( = ?auto_8126 ?auto_8152 ) ) ( not ( = ?auto_8143 ?auto_8137 ) ) ( not ( = ?auto_8143 ?auto_8136 ) ) ( not ( = ?auto_8143 ?auto_8151 ) ) ( not ( = ?auto_8140 ?auto_8142 ) ) ( not ( = ?auto_8140 ?auto_8145 ) ) ( not ( = ?auto_8140 ?auto_8150 ) ) ( not ( = ?auto_8153 ?auto_8147 ) ) ( not ( = ?auto_8153 ?auto_8135 ) ) ( not ( = ?auto_8153 ?auto_8146 ) ) ( not ( = ?auto_8153 ?auto_8141 ) ) ( not ( = ?auto_8153 ?auto_8148 ) ) ( not ( = ?auto_8153 ?auto_8138 ) ) ( not ( = ?auto_8153 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8127 ) ) ( not ( = ?auto_8118 ?auto_8139 ) ) ( not ( = ?auto_8119 ?auto_8127 ) ) ( not ( = ?auto_8119 ?auto_8139 ) ) ( not ( = ?auto_8120 ?auto_8127 ) ) ( not ( = ?auto_8120 ?auto_8139 ) ) ( not ( = ?auto_8121 ?auto_8127 ) ) ( not ( = ?auto_8121 ?auto_8139 ) ) ( not ( = ?auto_8122 ?auto_8127 ) ) ( not ( = ?auto_8122 ?auto_8139 ) ) ( not ( = ?auto_8123 ?auto_8127 ) ) ( not ( = ?auto_8123 ?auto_8139 ) ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8139 ) ) ( not ( = ?auto_8125 ?auto_8127 ) ) ( not ( = ?auto_8125 ?auto_8139 ) ) ( not ( = ?auto_8127 ?auto_8153 ) ) ( not ( = ?auto_8127 ?auto_8147 ) ) ( not ( = ?auto_8127 ?auto_8135 ) ) ( not ( = ?auto_8127 ?auto_8146 ) ) ( not ( = ?auto_8127 ?auto_8141 ) ) ( not ( = ?auto_8127 ?auto_8148 ) ) ( not ( = ?auto_8127 ?auto_8138 ) ) ( not ( = ?auto_8127 ?auto_8152 ) ) ( not ( = ?auto_8149 ?auto_8143 ) ) ( not ( = ?auto_8149 ?auto_8137 ) ) ( not ( = ?auto_8149 ?auto_8136 ) ) ( not ( = ?auto_8149 ?auto_8151 ) ) ( not ( = ?auto_8144 ?auto_8140 ) ) ( not ( = ?auto_8144 ?auto_8142 ) ) ( not ( = ?auto_8144 ?auto_8145 ) ) ( not ( = ?auto_8144 ?auto_8150 ) ) ( not ( = ?auto_8139 ?auto_8153 ) ) ( not ( = ?auto_8139 ?auto_8147 ) ) ( not ( = ?auto_8139 ?auto_8135 ) ) ( not ( = ?auto_8139 ?auto_8146 ) ) ( not ( = ?auto_8139 ?auto_8141 ) ) ( not ( = ?auto_8139 ?auto_8148 ) ) ( not ( = ?auto_8139 ?auto_8138 ) ) ( not ( = ?auto_8139 ?auto_8152 ) ) ( not ( = ?auto_8118 ?auto_8128 ) ) ( not ( = ?auto_8118 ?auto_8130 ) ) ( not ( = ?auto_8119 ?auto_8128 ) ) ( not ( = ?auto_8119 ?auto_8130 ) ) ( not ( = ?auto_8120 ?auto_8128 ) ) ( not ( = ?auto_8120 ?auto_8130 ) ) ( not ( = ?auto_8121 ?auto_8128 ) ) ( not ( = ?auto_8121 ?auto_8130 ) ) ( not ( = ?auto_8122 ?auto_8128 ) ) ( not ( = ?auto_8122 ?auto_8130 ) ) ( not ( = ?auto_8123 ?auto_8128 ) ) ( not ( = ?auto_8123 ?auto_8130 ) ) ( not ( = ?auto_8124 ?auto_8128 ) ) ( not ( = ?auto_8124 ?auto_8130 ) ) ( not ( = ?auto_8125 ?auto_8128 ) ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( not ( = ?auto_8126 ?auto_8128 ) ) ( not ( = ?auto_8126 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8139 ) ) ( not ( = ?auto_8128 ?auto_8153 ) ) ( not ( = ?auto_8128 ?auto_8147 ) ) ( not ( = ?auto_8128 ?auto_8135 ) ) ( not ( = ?auto_8128 ?auto_8146 ) ) ( not ( = ?auto_8128 ?auto_8141 ) ) ( not ( = ?auto_8128 ?auto_8148 ) ) ( not ( = ?auto_8128 ?auto_8138 ) ) ( not ( = ?auto_8128 ?auto_8152 ) ) ( not ( = ?auto_8129 ?auto_8149 ) ) ( not ( = ?auto_8129 ?auto_8143 ) ) ( not ( = ?auto_8129 ?auto_8137 ) ) ( not ( = ?auto_8129 ?auto_8136 ) ) ( not ( = ?auto_8129 ?auto_8151 ) ) ( not ( = ?auto_8131 ?auto_8144 ) ) ( not ( = ?auto_8131 ?auto_8140 ) ) ( not ( = ?auto_8131 ?auto_8142 ) ) ( not ( = ?auto_8131 ?auto_8145 ) ) ( not ( = ?auto_8131 ?auto_8150 ) ) ( not ( = ?auto_8130 ?auto_8139 ) ) ( not ( = ?auto_8130 ?auto_8153 ) ) ( not ( = ?auto_8130 ?auto_8147 ) ) ( not ( = ?auto_8130 ?auto_8135 ) ) ( not ( = ?auto_8130 ?auto_8146 ) ) ( not ( = ?auto_8130 ?auto_8141 ) ) ( not ( = ?auto_8130 ?auto_8148 ) ) ( not ( = ?auto_8130 ?auto_8138 ) ) ( not ( = ?auto_8130 ?auto_8152 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8118 ?auto_8119 ?auto_8120 ?auto_8121 ?auto_8122 ?auto_8123 ?auto_8124 ?auto_8125 ?auto_8126 ?auto_8127 )
      ( MAKE-1CRATE ?auto_8127 ?auto_8128 )
      ( MAKE-10CRATE-VERIFY ?auto_8118 ?auto_8119 ?auto_8120 ?auto_8121 ?auto_8122 ?auto_8123 ?auto_8124 ?auto_8125 ?auto_8126 ?auto_8127 ?auto_8128 ) )
  )

)

