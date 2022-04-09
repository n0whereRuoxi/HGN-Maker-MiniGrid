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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7797 - SURFACE
      ?auto_7798 - SURFACE
    )
    :vars
    (
      ?auto_7799 - HOIST
      ?auto_7800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7799 ?auto_7800 ) ( SURFACE-AT ?auto_7797 ?auto_7800 ) ( CLEAR ?auto_7797 ) ( LIFTING ?auto_7799 ?auto_7798 ) ( IS-CRATE ?auto_7798 ) ( not ( = ?auto_7797 ?auto_7798 ) ) )
    :subtasks
    ( ( !DROP ?auto_7799 ?auto_7798 ?auto_7797 ?auto_7800 )
      ( MAKE-1CRATE-VERIFY ?auto_7797 ?auto_7798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7801 - SURFACE
      ?auto_7802 - SURFACE
    )
    :vars
    (
      ?auto_7803 - HOIST
      ?auto_7804 - PLACE
      ?auto_7805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7803 ?auto_7804 ) ( SURFACE-AT ?auto_7801 ?auto_7804 ) ( CLEAR ?auto_7801 ) ( IS-CRATE ?auto_7802 ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( TRUCK-AT ?auto_7805 ?auto_7804 ) ( AVAILABLE ?auto_7803 ) ( IN ?auto_7802 ?auto_7805 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7803 ?auto_7802 ?auto_7805 ?auto_7804 )
      ( MAKE-1CRATE ?auto_7801 ?auto_7802 )
      ( MAKE-1CRATE-VERIFY ?auto_7801 ?auto_7802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7806 - SURFACE
      ?auto_7807 - SURFACE
    )
    :vars
    (
      ?auto_7810 - HOIST
      ?auto_7808 - PLACE
      ?auto_7809 - TRUCK
      ?auto_7811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7810 ?auto_7808 ) ( SURFACE-AT ?auto_7806 ?auto_7808 ) ( CLEAR ?auto_7806 ) ( IS-CRATE ?auto_7807 ) ( not ( = ?auto_7806 ?auto_7807 ) ) ( AVAILABLE ?auto_7810 ) ( IN ?auto_7807 ?auto_7809 ) ( TRUCK-AT ?auto_7809 ?auto_7811 ) ( not ( = ?auto_7811 ?auto_7808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7809 ?auto_7811 ?auto_7808 )
      ( MAKE-1CRATE ?auto_7806 ?auto_7807 )
      ( MAKE-1CRATE-VERIFY ?auto_7806 ?auto_7807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7812 - SURFACE
      ?auto_7813 - SURFACE
    )
    :vars
    (
      ?auto_7815 - HOIST
      ?auto_7817 - PLACE
      ?auto_7814 - TRUCK
      ?auto_7816 - PLACE
      ?auto_7818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7815 ?auto_7817 ) ( SURFACE-AT ?auto_7812 ?auto_7817 ) ( CLEAR ?auto_7812 ) ( IS-CRATE ?auto_7813 ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( AVAILABLE ?auto_7815 ) ( TRUCK-AT ?auto_7814 ?auto_7816 ) ( not ( = ?auto_7816 ?auto_7817 ) ) ( HOIST-AT ?auto_7818 ?auto_7816 ) ( LIFTING ?auto_7818 ?auto_7813 ) ( not ( = ?auto_7815 ?auto_7818 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7818 ?auto_7813 ?auto_7814 ?auto_7816 )
      ( MAKE-1CRATE ?auto_7812 ?auto_7813 )
      ( MAKE-1CRATE-VERIFY ?auto_7812 ?auto_7813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7819 - SURFACE
      ?auto_7820 - SURFACE
    )
    :vars
    (
      ?auto_7822 - HOIST
      ?auto_7821 - PLACE
      ?auto_7823 - TRUCK
      ?auto_7825 - PLACE
      ?auto_7824 - HOIST
      ?auto_7826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7822 ?auto_7821 ) ( SURFACE-AT ?auto_7819 ?auto_7821 ) ( CLEAR ?auto_7819 ) ( IS-CRATE ?auto_7820 ) ( not ( = ?auto_7819 ?auto_7820 ) ) ( AVAILABLE ?auto_7822 ) ( TRUCK-AT ?auto_7823 ?auto_7825 ) ( not ( = ?auto_7825 ?auto_7821 ) ) ( HOIST-AT ?auto_7824 ?auto_7825 ) ( not ( = ?auto_7822 ?auto_7824 ) ) ( AVAILABLE ?auto_7824 ) ( SURFACE-AT ?auto_7820 ?auto_7825 ) ( ON ?auto_7820 ?auto_7826 ) ( CLEAR ?auto_7820 ) ( not ( = ?auto_7819 ?auto_7826 ) ) ( not ( = ?auto_7820 ?auto_7826 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7824 ?auto_7820 ?auto_7826 ?auto_7825 )
      ( MAKE-1CRATE ?auto_7819 ?auto_7820 )
      ( MAKE-1CRATE-VERIFY ?auto_7819 ?auto_7820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7827 - SURFACE
      ?auto_7828 - SURFACE
    )
    :vars
    (
      ?auto_7829 - HOIST
      ?auto_7832 - PLACE
      ?auto_7830 - PLACE
      ?auto_7833 - HOIST
      ?auto_7831 - SURFACE
      ?auto_7834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7829 ?auto_7832 ) ( SURFACE-AT ?auto_7827 ?auto_7832 ) ( CLEAR ?auto_7827 ) ( IS-CRATE ?auto_7828 ) ( not ( = ?auto_7827 ?auto_7828 ) ) ( AVAILABLE ?auto_7829 ) ( not ( = ?auto_7830 ?auto_7832 ) ) ( HOIST-AT ?auto_7833 ?auto_7830 ) ( not ( = ?auto_7829 ?auto_7833 ) ) ( AVAILABLE ?auto_7833 ) ( SURFACE-AT ?auto_7828 ?auto_7830 ) ( ON ?auto_7828 ?auto_7831 ) ( CLEAR ?auto_7828 ) ( not ( = ?auto_7827 ?auto_7831 ) ) ( not ( = ?auto_7828 ?auto_7831 ) ) ( TRUCK-AT ?auto_7834 ?auto_7832 ) )
    :subtasks
    ( ( !DRIVE ?auto_7834 ?auto_7832 ?auto_7830 )
      ( MAKE-1CRATE ?auto_7827 ?auto_7828 )
      ( MAKE-1CRATE-VERIFY ?auto_7827 ?auto_7828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7844 - SURFACE
      ?auto_7845 - SURFACE
      ?auto_7846 - SURFACE
    )
    :vars
    (
      ?auto_7848 - HOIST
      ?auto_7847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7848 ?auto_7847 ) ( SURFACE-AT ?auto_7845 ?auto_7847 ) ( CLEAR ?auto_7845 ) ( LIFTING ?auto_7848 ?auto_7846 ) ( IS-CRATE ?auto_7846 ) ( not ( = ?auto_7845 ?auto_7846 ) ) ( ON ?auto_7845 ?auto_7844 ) ( not ( = ?auto_7844 ?auto_7845 ) ) ( not ( = ?auto_7844 ?auto_7846 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7845 ?auto_7846 )
      ( MAKE-2CRATE-VERIFY ?auto_7844 ?auto_7845 ?auto_7846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7854 - SURFACE
      ?auto_7855 - SURFACE
      ?auto_7856 - SURFACE
    )
    :vars
    (
      ?auto_7857 - HOIST
      ?auto_7859 - PLACE
      ?auto_7858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7857 ?auto_7859 ) ( SURFACE-AT ?auto_7855 ?auto_7859 ) ( CLEAR ?auto_7855 ) ( IS-CRATE ?auto_7856 ) ( not ( = ?auto_7855 ?auto_7856 ) ) ( TRUCK-AT ?auto_7858 ?auto_7859 ) ( AVAILABLE ?auto_7857 ) ( IN ?auto_7856 ?auto_7858 ) ( ON ?auto_7855 ?auto_7854 ) ( not ( = ?auto_7854 ?auto_7855 ) ) ( not ( = ?auto_7854 ?auto_7856 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7855 ?auto_7856 )
      ( MAKE-2CRATE-VERIFY ?auto_7854 ?auto_7855 ?auto_7856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7860 - SURFACE
      ?auto_7861 - SURFACE
    )
    :vars
    (
      ?auto_7862 - HOIST
      ?auto_7865 - PLACE
      ?auto_7863 - TRUCK
      ?auto_7864 - SURFACE
      ?auto_7866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7862 ?auto_7865 ) ( SURFACE-AT ?auto_7860 ?auto_7865 ) ( CLEAR ?auto_7860 ) ( IS-CRATE ?auto_7861 ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( AVAILABLE ?auto_7862 ) ( IN ?auto_7861 ?auto_7863 ) ( ON ?auto_7860 ?auto_7864 ) ( not ( = ?auto_7864 ?auto_7860 ) ) ( not ( = ?auto_7864 ?auto_7861 ) ) ( TRUCK-AT ?auto_7863 ?auto_7866 ) ( not ( = ?auto_7866 ?auto_7865 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7863 ?auto_7866 ?auto_7865 )
      ( MAKE-2CRATE ?auto_7864 ?auto_7860 ?auto_7861 )
      ( MAKE-1CRATE-VERIFY ?auto_7860 ?auto_7861 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7867 - SURFACE
      ?auto_7868 - SURFACE
      ?auto_7869 - SURFACE
    )
    :vars
    (
      ?auto_7870 - HOIST
      ?auto_7873 - PLACE
      ?auto_7872 - TRUCK
      ?auto_7871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7870 ?auto_7873 ) ( SURFACE-AT ?auto_7868 ?auto_7873 ) ( CLEAR ?auto_7868 ) ( IS-CRATE ?auto_7869 ) ( not ( = ?auto_7868 ?auto_7869 ) ) ( AVAILABLE ?auto_7870 ) ( IN ?auto_7869 ?auto_7872 ) ( ON ?auto_7868 ?auto_7867 ) ( not ( = ?auto_7867 ?auto_7868 ) ) ( not ( = ?auto_7867 ?auto_7869 ) ) ( TRUCK-AT ?auto_7872 ?auto_7871 ) ( not ( = ?auto_7871 ?auto_7873 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7868 ?auto_7869 )
      ( MAKE-2CRATE-VERIFY ?auto_7867 ?auto_7868 ?auto_7869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7874 - SURFACE
      ?auto_7875 - SURFACE
    )
    :vars
    (
      ?auto_7879 - HOIST
      ?auto_7880 - PLACE
      ?auto_7878 - SURFACE
      ?auto_7877 - TRUCK
      ?auto_7876 - PLACE
      ?auto_7881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7879 ?auto_7880 ) ( SURFACE-AT ?auto_7874 ?auto_7880 ) ( CLEAR ?auto_7874 ) ( IS-CRATE ?auto_7875 ) ( not ( = ?auto_7874 ?auto_7875 ) ) ( AVAILABLE ?auto_7879 ) ( ON ?auto_7874 ?auto_7878 ) ( not ( = ?auto_7878 ?auto_7874 ) ) ( not ( = ?auto_7878 ?auto_7875 ) ) ( TRUCK-AT ?auto_7877 ?auto_7876 ) ( not ( = ?auto_7876 ?auto_7880 ) ) ( HOIST-AT ?auto_7881 ?auto_7876 ) ( LIFTING ?auto_7881 ?auto_7875 ) ( not ( = ?auto_7879 ?auto_7881 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7881 ?auto_7875 ?auto_7877 ?auto_7876 )
      ( MAKE-2CRATE ?auto_7878 ?auto_7874 ?auto_7875 )
      ( MAKE-1CRATE-VERIFY ?auto_7874 ?auto_7875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7882 - SURFACE
      ?auto_7883 - SURFACE
      ?auto_7884 - SURFACE
    )
    :vars
    (
      ?auto_7886 - HOIST
      ?auto_7885 - PLACE
      ?auto_7888 - TRUCK
      ?auto_7889 - PLACE
      ?auto_7887 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7886 ?auto_7885 ) ( SURFACE-AT ?auto_7883 ?auto_7885 ) ( CLEAR ?auto_7883 ) ( IS-CRATE ?auto_7884 ) ( not ( = ?auto_7883 ?auto_7884 ) ) ( AVAILABLE ?auto_7886 ) ( ON ?auto_7883 ?auto_7882 ) ( not ( = ?auto_7882 ?auto_7883 ) ) ( not ( = ?auto_7882 ?auto_7884 ) ) ( TRUCK-AT ?auto_7888 ?auto_7889 ) ( not ( = ?auto_7889 ?auto_7885 ) ) ( HOIST-AT ?auto_7887 ?auto_7889 ) ( LIFTING ?auto_7887 ?auto_7884 ) ( not ( = ?auto_7886 ?auto_7887 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7883 ?auto_7884 )
      ( MAKE-2CRATE-VERIFY ?auto_7882 ?auto_7883 ?auto_7884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7890 - SURFACE
      ?auto_7891 - SURFACE
    )
    :vars
    (
      ?auto_7896 - HOIST
      ?auto_7894 - PLACE
      ?auto_7895 - SURFACE
      ?auto_7897 - TRUCK
      ?auto_7892 - PLACE
      ?auto_7893 - HOIST
      ?auto_7898 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7896 ?auto_7894 ) ( SURFACE-AT ?auto_7890 ?auto_7894 ) ( CLEAR ?auto_7890 ) ( IS-CRATE ?auto_7891 ) ( not ( = ?auto_7890 ?auto_7891 ) ) ( AVAILABLE ?auto_7896 ) ( ON ?auto_7890 ?auto_7895 ) ( not ( = ?auto_7895 ?auto_7890 ) ) ( not ( = ?auto_7895 ?auto_7891 ) ) ( TRUCK-AT ?auto_7897 ?auto_7892 ) ( not ( = ?auto_7892 ?auto_7894 ) ) ( HOIST-AT ?auto_7893 ?auto_7892 ) ( not ( = ?auto_7896 ?auto_7893 ) ) ( AVAILABLE ?auto_7893 ) ( SURFACE-AT ?auto_7891 ?auto_7892 ) ( ON ?auto_7891 ?auto_7898 ) ( CLEAR ?auto_7891 ) ( not ( = ?auto_7890 ?auto_7898 ) ) ( not ( = ?auto_7891 ?auto_7898 ) ) ( not ( = ?auto_7895 ?auto_7898 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7893 ?auto_7891 ?auto_7898 ?auto_7892 )
      ( MAKE-2CRATE ?auto_7895 ?auto_7890 ?auto_7891 )
      ( MAKE-1CRATE-VERIFY ?auto_7890 ?auto_7891 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7899 - SURFACE
      ?auto_7900 - SURFACE
      ?auto_7901 - SURFACE
    )
    :vars
    (
      ?auto_7905 - HOIST
      ?auto_7902 - PLACE
      ?auto_7904 - TRUCK
      ?auto_7903 - PLACE
      ?auto_7906 - HOIST
      ?auto_7907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7905 ?auto_7902 ) ( SURFACE-AT ?auto_7900 ?auto_7902 ) ( CLEAR ?auto_7900 ) ( IS-CRATE ?auto_7901 ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( AVAILABLE ?auto_7905 ) ( ON ?auto_7900 ?auto_7899 ) ( not ( = ?auto_7899 ?auto_7900 ) ) ( not ( = ?auto_7899 ?auto_7901 ) ) ( TRUCK-AT ?auto_7904 ?auto_7903 ) ( not ( = ?auto_7903 ?auto_7902 ) ) ( HOIST-AT ?auto_7906 ?auto_7903 ) ( not ( = ?auto_7905 ?auto_7906 ) ) ( AVAILABLE ?auto_7906 ) ( SURFACE-AT ?auto_7901 ?auto_7903 ) ( ON ?auto_7901 ?auto_7907 ) ( CLEAR ?auto_7901 ) ( not ( = ?auto_7900 ?auto_7907 ) ) ( not ( = ?auto_7901 ?auto_7907 ) ) ( not ( = ?auto_7899 ?auto_7907 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7900 ?auto_7901 )
      ( MAKE-2CRATE-VERIFY ?auto_7899 ?auto_7900 ?auto_7901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7908 - SURFACE
      ?auto_7909 - SURFACE
    )
    :vars
    (
      ?auto_7912 - HOIST
      ?auto_7913 - PLACE
      ?auto_7916 - SURFACE
      ?auto_7911 - PLACE
      ?auto_7910 - HOIST
      ?auto_7914 - SURFACE
      ?auto_7915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7912 ?auto_7913 ) ( SURFACE-AT ?auto_7908 ?auto_7913 ) ( CLEAR ?auto_7908 ) ( IS-CRATE ?auto_7909 ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( AVAILABLE ?auto_7912 ) ( ON ?auto_7908 ?auto_7916 ) ( not ( = ?auto_7916 ?auto_7908 ) ) ( not ( = ?auto_7916 ?auto_7909 ) ) ( not ( = ?auto_7911 ?auto_7913 ) ) ( HOIST-AT ?auto_7910 ?auto_7911 ) ( not ( = ?auto_7912 ?auto_7910 ) ) ( AVAILABLE ?auto_7910 ) ( SURFACE-AT ?auto_7909 ?auto_7911 ) ( ON ?auto_7909 ?auto_7914 ) ( CLEAR ?auto_7909 ) ( not ( = ?auto_7908 ?auto_7914 ) ) ( not ( = ?auto_7909 ?auto_7914 ) ) ( not ( = ?auto_7916 ?auto_7914 ) ) ( TRUCK-AT ?auto_7915 ?auto_7913 ) )
    :subtasks
    ( ( !DRIVE ?auto_7915 ?auto_7913 ?auto_7911 )
      ( MAKE-2CRATE ?auto_7916 ?auto_7908 ?auto_7909 )
      ( MAKE-1CRATE-VERIFY ?auto_7908 ?auto_7909 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7917 - SURFACE
      ?auto_7918 - SURFACE
      ?auto_7919 - SURFACE
    )
    :vars
    (
      ?auto_7921 - HOIST
      ?auto_7924 - PLACE
      ?auto_7922 - PLACE
      ?auto_7925 - HOIST
      ?auto_7920 - SURFACE
      ?auto_7923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7921 ?auto_7924 ) ( SURFACE-AT ?auto_7918 ?auto_7924 ) ( CLEAR ?auto_7918 ) ( IS-CRATE ?auto_7919 ) ( not ( = ?auto_7918 ?auto_7919 ) ) ( AVAILABLE ?auto_7921 ) ( ON ?auto_7918 ?auto_7917 ) ( not ( = ?auto_7917 ?auto_7918 ) ) ( not ( = ?auto_7917 ?auto_7919 ) ) ( not ( = ?auto_7922 ?auto_7924 ) ) ( HOIST-AT ?auto_7925 ?auto_7922 ) ( not ( = ?auto_7921 ?auto_7925 ) ) ( AVAILABLE ?auto_7925 ) ( SURFACE-AT ?auto_7919 ?auto_7922 ) ( ON ?auto_7919 ?auto_7920 ) ( CLEAR ?auto_7919 ) ( not ( = ?auto_7918 ?auto_7920 ) ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( not ( = ?auto_7917 ?auto_7920 ) ) ( TRUCK-AT ?auto_7923 ?auto_7924 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7918 ?auto_7919 )
      ( MAKE-2CRATE-VERIFY ?auto_7917 ?auto_7918 ?auto_7919 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7926 - SURFACE
      ?auto_7927 - SURFACE
    )
    :vars
    (
      ?auto_7934 - HOIST
      ?auto_7928 - PLACE
      ?auto_7933 - SURFACE
      ?auto_7929 - PLACE
      ?auto_7932 - HOIST
      ?auto_7931 - SURFACE
      ?auto_7930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7934 ?auto_7928 ) ( IS-CRATE ?auto_7927 ) ( not ( = ?auto_7926 ?auto_7927 ) ) ( not ( = ?auto_7933 ?auto_7926 ) ) ( not ( = ?auto_7933 ?auto_7927 ) ) ( not ( = ?auto_7929 ?auto_7928 ) ) ( HOIST-AT ?auto_7932 ?auto_7929 ) ( not ( = ?auto_7934 ?auto_7932 ) ) ( AVAILABLE ?auto_7932 ) ( SURFACE-AT ?auto_7927 ?auto_7929 ) ( ON ?auto_7927 ?auto_7931 ) ( CLEAR ?auto_7927 ) ( not ( = ?auto_7926 ?auto_7931 ) ) ( not ( = ?auto_7927 ?auto_7931 ) ) ( not ( = ?auto_7933 ?auto_7931 ) ) ( TRUCK-AT ?auto_7930 ?auto_7928 ) ( SURFACE-AT ?auto_7933 ?auto_7928 ) ( CLEAR ?auto_7933 ) ( LIFTING ?auto_7934 ?auto_7926 ) ( IS-CRATE ?auto_7926 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7933 ?auto_7926 )
      ( MAKE-2CRATE ?auto_7933 ?auto_7926 ?auto_7927 )
      ( MAKE-1CRATE-VERIFY ?auto_7926 ?auto_7927 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7935 - SURFACE
      ?auto_7936 - SURFACE
      ?auto_7937 - SURFACE
    )
    :vars
    (
      ?auto_7943 - HOIST
      ?auto_7942 - PLACE
      ?auto_7939 - PLACE
      ?auto_7940 - HOIST
      ?auto_7938 - SURFACE
      ?auto_7941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7943 ?auto_7942 ) ( IS-CRATE ?auto_7937 ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7937 ) ) ( not ( = ?auto_7939 ?auto_7942 ) ) ( HOIST-AT ?auto_7940 ?auto_7939 ) ( not ( = ?auto_7943 ?auto_7940 ) ) ( AVAILABLE ?auto_7940 ) ( SURFACE-AT ?auto_7937 ?auto_7939 ) ( ON ?auto_7937 ?auto_7938 ) ( CLEAR ?auto_7937 ) ( not ( = ?auto_7936 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( not ( = ?auto_7935 ?auto_7938 ) ) ( TRUCK-AT ?auto_7941 ?auto_7942 ) ( SURFACE-AT ?auto_7935 ?auto_7942 ) ( CLEAR ?auto_7935 ) ( LIFTING ?auto_7943 ?auto_7936 ) ( IS-CRATE ?auto_7936 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7936 ?auto_7937 )
      ( MAKE-2CRATE-VERIFY ?auto_7935 ?auto_7936 ?auto_7937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7944 - SURFACE
      ?auto_7945 - SURFACE
    )
    :vars
    (
      ?auto_7946 - HOIST
      ?auto_7952 - PLACE
      ?auto_7951 - SURFACE
      ?auto_7950 - PLACE
      ?auto_7947 - HOIST
      ?auto_7948 - SURFACE
      ?auto_7949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7946 ?auto_7952 ) ( IS-CRATE ?auto_7945 ) ( not ( = ?auto_7944 ?auto_7945 ) ) ( not ( = ?auto_7951 ?auto_7944 ) ) ( not ( = ?auto_7951 ?auto_7945 ) ) ( not ( = ?auto_7950 ?auto_7952 ) ) ( HOIST-AT ?auto_7947 ?auto_7950 ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( AVAILABLE ?auto_7947 ) ( SURFACE-AT ?auto_7945 ?auto_7950 ) ( ON ?auto_7945 ?auto_7948 ) ( CLEAR ?auto_7945 ) ( not ( = ?auto_7944 ?auto_7948 ) ) ( not ( = ?auto_7945 ?auto_7948 ) ) ( not ( = ?auto_7951 ?auto_7948 ) ) ( TRUCK-AT ?auto_7949 ?auto_7952 ) ( SURFACE-AT ?auto_7951 ?auto_7952 ) ( CLEAR ?auto_7951 ) ( IS-CRATE ?auto_7944 ) ( AVAILABLE ?auto_7946 ) ( IN ?auto_7944 ?auto_7949 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7946 ?auto_7944 ?auto_7949 ?auto_7952 )
      ( MAKE-2CRATE ?auto_7951 ?auto_7944 ?auto_7945 )
      ( MAKE-1CRATE-VERIFY ?auto_7944 ?auto_7945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7953 - SURFACE
      ?auto_7954 - SURFACE
      ?auto_7955 - SURFACE
    )
    :vars
    (
      ?auto_7956 - HOIST
      ?auto_7961 - PLACE
      ?auto_7957 - PLACE
      ?auto_7959 - HOIST
      ?auto_7958 - SURFACE
      ?auto_7960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7956 ?auto_7961 ) ( IS-CRATE ?auto_7955 ) ( not ( = ?auto_7954 ?auto_7955 ) ) ( not ( = ?auto_7953 ?auto_7954 ) ) ( not ( = ?auto_7953 ?auto_7955 ) ) ( not ( = ?auto_7957 ?auto_7961 ) ) ( HOIST-AT ?auto_7959 ?auto_7957 ) ( not ( = ?auto_7956 ?auto_7959 ) ) ( AVAILABLE ?auto_7959 ) ( SURFACE-AT ?auto_7955 ?auto_7957 ) ( ON ?auto_7955 ?auto_7958 ) ( CLEAR ?auto_7955 ) ( not ( = ?auto_7954 ?auto_7958 ) ) ( not ( = ?auto_7955 ?auto_7958 ) ) ( not ( = ?auto_7953 ?auto_7958 ) ) ( TRUCK-AT ?auto_7960 ?auto_7961 ) ( SURFACE-AT ?auto_7953 ?auto_7961 ) ( CLEAR ?auto_7953 ) ( IS-CRATE ?auto_7954 ) ( AVAILABLE ?auto_7956 ) ( IN ?auto_7954 ?auto_7960 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7954 ?auto_7955 )
      ( MAKE-2CRATE-VERIFY ?auto_7953 ?auto_7954 ?auto_7955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7998 - SURFACE
      ?auto_7999 - SURFACE
    )
    :vars
    (
      ?auto_8003 - HOIST
      ?auto_8004 - PLACE
      ?auto_8006 - SURFACE
      ?auto_8001 - PLACE
      ?auto_8005 - HOIST
      ?auto_8000 - SURFACE
      ?auto_8002 - TRUCK
      ?auto_8007 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8003 ?auto_8004 ) ( SURFACE-AT ?auto_7998 ?auto_8004 ) ( CLEAR ?auto_7998 ) ( IS-CRATE ?auto_7999 ) ( not ( = ?auto_7998 ?auto_7999 ) ) ( AVAILABLE ?auto_8003 ) ( ON ?auto_7998 ?auto_8006 ) ( not ( = ?auto_8006 ?auto_7998 ) ) ( not ( = ?auto_8006 ?auto_7999 ) ) ( not ( = ?auto_8001 ?auto_8004 ) ) ( HOIST-AT ?auto_8005 ?auto_8001 ) ( not ( = ?auto_8003 ?auto_8005 ) ) ( AVAILABLE ?auto_8005 ) ( SURFACE-AT ?auto_7999 ?auto_8001 ) ( ON ?auto_7999 ?auto_8000 ) ( CLEAR ?auto_7999 ) ( not ( = ?auto_7998 ?auto_8000 ) ) ( not ( = ?auto_7999 ?auto_8000 ) ) ( not ( = ?auto_8006 ?auto_8000 ) ) ( TRUCK-AT ?auto_8002 ?auto_8007 ) ( not ( = ?auto_8007 ?auto_8004 ) ) ( not ( = ?auto_8001 ?auto_8007 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8002 ?auto_8007 ?auto_8004 )
      ( MAKE-1CRATE ?auto_7998 ?auto_7999 )
      ( MAKE-1CRATE-VERIFY ?auto_7998 ?auto_7999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8037 - SURFACE
      ?auto_8038 - SURFACE
      ?auto_8039 - SURFACE
      ?auto_8040 - SURFACE
    )
    :vars
    (
      ?auto_8041 - HOIST
      ?auto_8042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8041 ?auto_8042 ) ( SURFACE-AT ?auto_8039 ?auto_8042 ) ( CLEAR ?auto_8039 ) ( LIFTING ?auto_8041 ?auto_8040 ) ( IS-CRATE ?auto_8040 ) ( not ( = ?auto_8039 ?auto_8040 ) ) ( ON ?auto_8038 ?auto_8037 ) ( ON ?auto_8039 ?auto_8038 ) ( not ( = ?auto_8037 ?auto_8038 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( not ( = ?auto_8037 ?auto_8040 ) ) ( not ( = ?auto_8038 ?auto_8039 ) ) ( not ( = ?auto_8038 ?auto_8040 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8039 ?auto_8040 )
      ( MAKE-3CRATE-VERIFY ?auto_8037 ?auto_8038 ?auto_8039 ?auto_8040 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8054 - SURFACE
      ?auto_8055 - SURFACE
      ?auto_8056 - SURFACE
      ?auto_8057 - SURFACE
    )
    :vars
    (
      ?auto_8059 - HOIST
      ?auto_8060 - PLACE
      ?auto_8058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8059 ?auto_8060 ) ( SURFACE-AT ?auto_8056 ?auto_8060 ) ( CLEAR ?auto_8056 ) ( IS-CRATE ?auto_8057 ) ( not ( = ?auto_8056 ?auto_8057 ) ) ( TRUCK-AT ?auto_8058 ?auto_8060 ) ( AVAILABLE ?auto_8059 ) ( IN ?auto_8057 ?auto_8058 ) ( ON ?auto_8056 ?auto_8055 ) ( not ( = ?auto_8055 ?auto_8056 ) ) ( not ( = ?auto_8055 ?auto_8057 ) ) ( ON ?auto_8055 ?auto_8054 ) ( not ( = ?auto_8054 ?auto_8055 ) ) ( not ( = ?auto_8054 ?auto_8056 ) ) ( not ( = ?auto_8054 ?auto_8057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8055 ?auto_8056 ?auto_8057 )
      ( MAKE-3CRATE-VERIFY ?auto_8054 ?auto_8055 ?auto_8056 ?auto_8057 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8075 - SURFACE
      ?auto_8076 - SURFACE
      ?auto_8077 - SURFACE
      ?auto_8078 - SURFACE
    )
    :vars
    (
      ?auto_8080 - HOIST
      ?auto_8081 - PLACE
      ?auto_8079 - TRUCK
      ?auto_8082 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8080 ?auto_8081 ) ( SURFACE-AT ?auto_8077 ?auto_8081 ) ( CLEAR ?auto_8077 ) ( IS-CRATE ?auto_8078 ) ( not ( = ?auto_8077 ?auto_8078 ) ) ( AVAILABLE ?auto_8080 ) ( IN ?auto_8078 ?auto_8079 ) ( ON ?auto_8077 ?auto_8076 ) ( not ( = ?auto_8076 ?auto_8077 ) ) ( not ( = ?auto_8076 ?auto_8078 ) ) ( TRUCK-AT ?auto_8079 ?auto_8082 ) ( not ( = ?auto_8082 ?auto_8081 ) ) ( ON ?auto_8076 ?auto_8075 ) ( not ( = ?auto_8075 ?auto_8076 ) ) ( not ( = ?auto_8075 ?auto_8077 ) ) ( not ( = ?auto_8075 ?auto_8078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8076 ?auto_8077 ?auto_8078 )
      ( MAKE-3CRATE-VERIFY ?auto_8075 ?auto_8076 ?auto_8077 ?auto_8078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8099 - SURFACE
      ?auto_8100 - SURFACE
      ?auto_8101 - SURFACE
      ?auto_8102 - SURFACE
    )
    :vars
    (
      ?auto_8104 - HOIST
      ?auto_8103 - PLACE
      ?auto_8105 - TRUCK
      ?auto_8106 - PLACE
      ?auto_8107 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8104 ?auto_8103 ) ( SURFACE-AT ?auto_8101 ?auto_8103 ) ( CLEAR ?auto_8101 ) ( IS-CRATE ?auto_8102 ) ( not ( = ?auto_8101 ?auto_8102 ) ) ( AVAILABLE ?auto_8104 ) ( ON ?auto_8101 ?auto_8100 ) ( not ( = ?auto_8100 ?auto_8101 ) ) ( not ( = ?auto_8100 ?auto_8102 ) ) ( TRUCK-AT ?auto_8105 ?auto_8106 ) ( not ( = ?auto_8106 ?auto_8103 ) ) ( HOIST-AT ?auto_8107 ?auto_8106 ) ( LIFTING ?auto_8107 ?auto_8102 ) ( not ( = ?auto_8104 ?auto_8107 ) ) ( ON ?auto_8100 ?auto_8099 ) ( not ( = ?auto_8099 ?auto_8100 ) ) ( not ( = ?auto_8099 ?auto_8101 ) ) ( not ( = ?auto_8099 ?auto_8102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8100 ?auto_8101 ?auto_8102 )
      ( MAKE-3CRATE-VERIFY ?auto_8099 ?auto_8100 ?auto_8101 ?auto_8102 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8126 - SURFACE
      ?auto_8127 - SURFACE
      ?auto_8128 - SURFACE
      ?auto_8129 - SURFACE
    )
    :vars
    (
      ?auto_8132 - HOIST
      ?auto_8133 - PLACE
      ?auto_8131 - TRUCK
      ?auto_8135 - PLACE
      ?auto_8134 - HOIST
      ?auto_8130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8132 ?auto_8133 ) ( SURFACE-AT ?auto_8128 ?auto_8133 ) ( CLEAR ?auto_8128 ) ( IS-CRATE ?auto_8129 ) ( not ( = ?auto_8128 ?auto_8129 ) ) ( AVAILABLE ?auto_8132 ) ( ON ?auto_8128 ?auto_8127 ) ( not ( = ?auto_8127 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8129 ) ) ( TRUCK-AT ?auto_8131 ?auto_8135 ) ( not ( = ?auto_8135 ?auto_8133 ) ) ( HOIST-AT ?auto_8134 ?auto_8135 ) ( not ( = ?auto_8132 ?auto_8134 ) ) ( AVAILABLE ?auto_8134 ) ( SURFACE-AT ?auto_8129 ?auto_8135 ) ( ON ?auto_8129 ?auto_8130 ) ( CLEAR ?auto_8129 ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( not ( = ?auto_8129 ?auto_8130 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( ON ?auto_8127 ?auto_8126 ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8126 ?auto_8128 ) ) ( not ( = ?auto_8126 ?auto_8129 ) ) ( not ( = ?auto_8126 ?auto_8130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8127 ?auto_8128 ?auto_8129 )
      ( MAKE-3CRATE-VERIFY ?auto_8126 ?auto_8127 ?auto_8128 ?auto_8129 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8154 - SURFACE
      ?auto_8155 - SURFACE
      ?auto_8156 - SURFACE
      ?auto_8157 - SURFACE
    )
    :vars
    (
      ?auto_8163 - HOIST
      ?auto_8160 - PLACE
      ?auto_8159 - PLACE
      ?auto_8161 - HOIST
      ?auto_8158 - SURFACE
      ?auto_8162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8163 ?auto_8160 ) ( SURFACE-AT ?auto_8156 ?auto_8160 ) ( CLEAR ?auto_8156 ) ( IS-CRATE ?auto_8157 ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( AVAILABLE ?auto_8163 ) ( ON ?auto_8156 ?auto_8155 ) ( not ( = ?auto_8155 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8157 ) ) ( not ( = ?auto_8159 ?auto_8160 ) ) ( HOIST-AT ?auto_8161 ?auto_8159 ) ( not ( = ?auto_8163 ?auto_8161 ) ) ( AVAILABLE ?auto_8161 ) ( SURFACE-AT ?auto_8157 ?auto_8159 ) ( ON ?auto_8157 ?auto_8158 ) ( CLEAR ?auto_8157 ) ( not ( = ?auto_8156 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8155 ?auto_8158 ) ) ( TRUCK-AT ?auto_8162 ?auto_8160 ) ( ON ?auto_8155 ?auto_8154 ) ( not ( = ?auto_8154 ?auto_8155 ) ) ( not ( = ?auto_8154 ?auto_8156 ) ) ( not ( = ?auto_8154 ?auto_8157 ) ) ( not ( = ?auto_8154 ?auto_8158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8155 ?auto_8156 ?auto_8157 )
      ( MAKE-3CRATE-VERIFY ?auto_8154 ?auto_8155 ?auto_8156 ?auto_8157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8182 - SURFACE
      ?auto_8183 - SURFACE
      ?auto_8184 - SURFACE
      ?auto_8185 - SURFACE
    )
    :vars
    (
      ?auto_8188 - HOIST
      ?auto_8189 - PLACE
      ?auto_8191 - PLACE
      ?auto_8186 - HOIST
      ?auto_8187 - SURFACE
      ?auto_8190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8188 ?auto_8189 ) ( IS-CRATE ?auto_8185 ) ( not ( = ?auto_8184 ?auto_8185 ) ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8185 ) ) ( not ( = ?auto_8191 ?auto_8189 ) ) ( HOIST-AT ?auto_8186 ?auto_8191 ) ( not ( = ?auto_8188 ?auto_8186 ) ) ( AVAILABLE ?auto_8186 ) ( SURFACE-AT ?auto_8185 ?auto_8191 ) ( ON ?auto_8185 ?auto_8187 ) ( CLEAR ?auto_8185 ) ( not ( = ?auto_8184 ?auto_8187 ) ) ( not ( = ?auto_8185 ?auto_8187 ) ) ( not ( = ?auto_8183 ?auto_8187 ) ) ( TRUCK-AT ?auto_8190 ?auto_8189 ) ( SURFACE-AT ?auto_8183 ?auto_8189 ) ( CLEAR ?auto_8183 ) ( LIFTING ?auto_8188 ?auto_8184 ) ( IS-CRATE ?auto_8184 ) ( ON ?auto_8183 ?auto_8182 ) ( not ( = ?auto_8182 ?auto_8183 ) ) ( not ( = ?auto_8182 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8185 ) ) ( not ( = ?auto_8182 ?auto_8187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8183 ?auto_8184 ?auto_8185 )
      ( MAKE-3CRATE-VERIFY ?auto_8182 ?auto_8183 ?auto_8184 ?auto_8185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8210 - SURFACE
      ?auto_8211 - SURFACE
      ?auto_8212 - SURFACE
      ?auto_8213 - SURFACE
    )
    :vars
    (
      ?auto_8214 - HOIST
      ?auto_8219 - PLACE
      ?auto_8216 - PLACE
      ?auto_8215 - HOIST
      ?auto_8218 - SURFACE
      ?auto_8217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8214 ?auto_8219 ) ( IS-CRATE ?auto_8213 ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8211 ?auto_8212 ) ) ( not ( = ?auto_8211 ?auto_8213 ) ) ( not ( = ?auto_8216 ?auto_8219 ) ) ( HOIST-AT ?auto_8215 ?auto_8216 ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( AVAILABLE ?auto_8215 ) ( SURFACE-AT ?auto_8213 ?auto_8216 ) ( ON ?auto_8213 ?auto_8218 ) ( CLEAR ?auto_8213 ) ( not ( = ?auto_8212 ?auto_8218 ) ) ( not ( = ?auto_8213 ?auto_8218 ) ) ( not ( = ?auto_8211 ?auto_8218 ) ) ( TRUCK-AT ?auto_8217 ?auto_8219 ) ( SURFACE-AT ?auto_8211 ?auto_8219 ) ( CLEAR ?auto_8211 ) ( IS-CRATE ?auto_8212 ) ( AVAILABLE ?auto_8214 ) ( IN ?auto_8212 ?auto_8217 ) ( ON ?auto_8211 ?auto_8210 ) ( not ( = ?auto_8210 ?auto_8211 ) ) ( not ( = ?auto_8210 ?auto_8212 ) ) ( not ( = ?auto_8210 ?auto_8213 ) ) ( not ( = ?auto_8210 ?auto_8218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8211 ?auto_8212 ?auto_8213 )
      ( MAKE-3CRATE-VERIFY ?auto_8210 ?auto_8211 ?auto_8212 ?auto_8213 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8501 - SURFACE
      ?auto_8502 - SURFACE
      ?auto_8503 - SURFACE
      ?auto_8504 - SURFACE
      ?auto_8505 - SURFACE
    )
    :vars
    (
      ?auto_8507 - HOIST
      ?auto_8506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8507 ?auto_8506 ) ( SURFACE-AT ?auto_8504 ?auto_8506 ) ( CLEAR ?auto_8504 ) ( LIFTING ?auto_8507 ?auto_8505 ) ( IS-CRATE ?auto_8505 ) ( not ( = ?auto_8504 ?auto_8505 ) ) ( ON ?auto_8502 ?auto_8501 ) ( ON ?auto_8503 ?auto_8502 ) ( ON ?auto_8504 ?auto_8503 ) ( not ( = ?auto_8501 ?auto_8502 ) ) ( not ( = ?auto_8501 ?auto_8503 ) ) ( not ( = ?auto_8501 ?auto_8504 ) ) ( not ( = ?auto_8501 ?auto_8505 ) ) ( not ( = ?auto_8502 ?auto_8503 ) ) ( not ( = ?auto_8502 ?auto_8504 ) ) ( not ( = ?auto_8502 ?auto_8505 ) ) ( not ( = ?auto_8503 ?auto_8504 ) ) ( not ( = ?auto_8503 ?auto_8505 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8504 ?auto_8505 )
      ( MAKE-4CRATE-VERIFY ?auto_8501 ?auto_8502 ?auto_8503 ?auto_8504 ?auto_8505 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8526 - SURFACE
      ?auto_8527 - SURFACE
      ?auto_8528 - SURFACE
      ?auto_8529 - SURFACE
      ?auto_8530 - SURFACE
    )
    :vars
    (
      ?auto_8531 - HOIST
      ?auto_8533 - PLACE
      ?auto_8532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8531 ?auto_8533 ) ( SURFACE-AT ?auto_8529 ?auto_8533 ) ( CLEAR ?auto_8529 ) ( IS-CRATE ?auto_8530 ) ( not ( = ?auto_8529 ?auto_8530 ) ) ( TRUCK-AT ?auto_8532 ?auto_8533 ) ( AVAILABLE ?auto_8531 ) ( IN ?auto_8530 ?auto_8532 ) ( ON ?auto_8529 ?auto_8528 ) ( not ( = ?auto_8528 ?auto_8529 ) ) ( not ( = ?auto_8528 ?auto_8530 ) ) ( ON ?auto_8527 ?auto_8526 ) ( ON ?auto_8528 ?auto_8527 ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( not ( = ?auto_8526 ?auto_8528 ) ) ( not ( = ?auto_8526 ?auto_8529 ) ) ( not ( = ?auto_8526 ?auto_8530 ) ) ( not ( = ?auto_8527 ?auto_8528 ) ) ( not ( = ?auto_8527 ?auto_8529 ) ) ( not ( = ?auto_8527 ?auto_8530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8528 ?auto_8529 ?auto_8530 )
      ( MAKE-4CRATE-VERIFY ?auto_8526 ?auto_8527 ?auto_8528 ?auto_8529 ?auto_8530 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8556 - SURFACE
      ?auto_8557 - SURFACE
      ?auto_8558 - SURFACE
      ?auto_8559 - SURFACE
      ?auto_8560 - SURFACE
    )
    :vars
    (
      ?auto_8564 - HOIST
      ?auto_8561 - PLACE
      ?auto_8563 - TRUCK
      ?auto_8562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8564 ?auto_8561 ) ( SURFACE-AT ?auto_8559 ?auto_8561 ) ( CLEAR ?auto_8559 ) ( IS-CRATE ?auto_8560 ) ( not ( = ?auto_8559 ?auto_8560 ) ) ( AVAILABLE ?auto_8564 ) ( IN ?auto_8560 ?auto_8563 ) ( ON ?auto_8559 ?auto_8558 ) ( not ( = ?auto_8558 ?auto_8559 ) ) ( not ( = ?auto_8558 ?auto_8560 ) ) ( TRUCK-AT ?auto_8563 ?auto_8562 ) ( not ( = ?auto_8562 ?auto_8561 ) ) ( ON ?auto_8557 ?auto_8556 ) ( ON ?auto_8558 ?auto_8557 ) ( not ( = ?auto_8556 ?auto_8557 ) ) ( not ( = ?auto_8556 ?auto_8558 ) ) ( not ( = ?auto_8556 ?auto_8559 ) ) ( not ( = ?auto_8556 ?auto_8560 ) ) ( not ( = ?auto_8557 ?auto_8558 ) ) ( not ( = ?auto_8557 ?auto_8559 ) ) ( not ( = ?auto_8557 ?auto_8560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8558 ?auto_8559 ?auto_8560 )
      ( MAKE-4CRATE-VERIFY ?auto_8556 ?auto_8557 ?auto_8558 ?auto_8559 ?auto_8560 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8590 - SURFACE
      ?auto_8591 - SURFACE
      ?auto_8592 - SURFACE
      ?auto_8593 - SURFACE
      ?auto_8594 - SURFACE
    )
    :vars
    (
      ?auto_8595 - HOIST
      ?auto_8599 - PLACE
      ?auto_8596 - TRUCK
      ?auto_8598 - PLACE
      ?auto_8597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8595 ?auto_8599 ) ( SURFACE-AT ?auto_8593 ?auto_8599 ) ( CLEAR ?auto_8593 ) ( IS-CRATE ?auto_8594 ) ( not ( = ?auto_8593 ?auto_8594 ) ) ( AVAILABLE ?auto_8595 ) ( ON ?auto_8593 ?auto_8592 ) ( not ( = ?auto_8592 ?auto_8593 ) ) ( not ( = ?auto_8592 ?auto_8594 ) ) ( TRUCK-AT ?auto_8596 ?auto_8598 ) ( not ( = ?auto_8598 ?auto_8599 ) ) ( HOIST-AT ?auto_8597 ?auto_8598 ) ( LIFTING ?auto_8597 ?auto_8594 ) ( not ( = ?auto_8595 ?auto_8597 ) ) ( ON ?auto_8591 ?auto_8590 ) ( ON ?auto_8592 ?auto_8591 ) ( not ( = ?auto_8590 ?auto_8591 ) ) ( not ( = ?auto_8590 ?auto_8592 ) ) ( not ( = ?auto_8590 ?auto_8593 ) ) ( not ( = ?auto_8590 ?auto_8594 ) ) ( not ( = ?auto_8591 ?auto_8592 ) ) ( not ( = ?auto_8591 ?auto_8593 ) ) ( not ( = ?auto_8591 ?auto_8594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8592 ?auto_8593 ?auto_8594 )
      ( MAKE-4CRATE-VERIFY ?auto_8590 ?auto_8591 ?auto_8592 ?auto_8593 ?auto_8594 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8628 - SURFACE
      ?auto_8629 - SURFACE
      ?auto_8630 - SURFACE
      ?auto_8631 - SURFACE
      ?auto_8632 - SURFACE
    )
    :vars
    (
      ?auto_8638 - HOIST
      ?auto_8634 - PLACE
      ?auto_8637 - TRUCK
      ?auto_8635 - PLACE
      ?auto_8636 - HOIST
      ?auto_8633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8638 ?auto_8634 ) ( SURFACE-AT ?auto_8631 ?auto_8634 ) ( CLEAR ?auto_8631 ) ( IS-CRATE ?auto_8632 ) ( not ( = ?auto_8631 ?auto_8632 ) ) ( AVAILABLE ?auto_8638 ) ( ON ?auto_8631 ?auto_8630 ) ( not ( = ?auto_8630 ?auto_8631 ) ) ( not ( = ?auto_8630 ?auto_8632 ) ) ( TRUCK-AT ?auto_8637 ?auto_8635 ) ( not ( = ?auto_8635 ?auto_8634 ) ) ( HOIST-AT ?auto_8636 ?auto_8635 ) ( not ( = ?auto_8638 ?auto_8636 ) ) ( AVAILABLE ?auto_8636 ) ( SURFACE-AT ?auto_8632 ?auto_8635 ) ( ON ?auto_8632 ?auto_8633 ) ( CLEAR ?auto_8632 ) ( not ( = ?auto_8631 ?auto_8633 ) ) ( not ( = ?auto_8632 ?auto_8633 ) ) ( not ( = ?auto_8630 ?auto_8633 ) ) ( ON ?auto_8629 ?auto_8628 ) ( ON ?auto_8630 ?auto_8629 ) ( not ( = ?auto_8628 ?auto_8629 ) ) ( not ( = ?auto_8628 ?auto_8630 ) ) ( not ( = ?auto_8628 ?auto_8631 ) ) ( not ( = ?auto_8628 ?auto_8632 ) ) ( not ( = ?auto_8628 ?auto_8633 ) ) ( not ( = ?auto_8629 ?auto_8630 ) ) ( not ( = ?auto_8629 ?auto_8631 ) ) ( not ( = ?auto_8629 ?auto_8632 ) ) ( not ( = ?auto_8629 ?auto_8633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8630 ?auto_8631 ?auto_8632 )
      ( MAKE-4CRATE-VERIFY ?auto_8628 ?auto_8629 ?auto_8630 ?auto_8631 ?auto_8632 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8667 - SURFACE
      ?auto_8668 - SURFACE
      ?auto_8669 - SURFACE
      ?auto_8670 - SURFACE
      ?auto_8671 - SURFACE
    )
    :vars
    (
      ?auto_8676 - HOIST
      ?auto_8677 - PLACE
      ?auto_8672 - PLACE
      ?auto_8674 - HOIST
      ?auto_8675 - SURFACE
      ?auto_8673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8676 ?auto_8677 ) ( SURFACE-AT ?auto_8670 ?auto_8677 ) ( CLEAR ?auto_8670 ) ( IS-CRATE ?auto_8671 ) ( not ( = ?auto_8670 ?auto_8671 ) ) ( AVAILABLE ?auto_8676 ) ( ON ?auto_8670 ?auto_8669 ) ( not ( = ?auto_8669 ?auto_8670 ) ) ( not ( = ?auto_8669 ?auto_8671 ) ) ( not ( = ?auto_8672 ?auto_8677 ) ) ( HOIST-AT ?auto_8674 ?auto_8672 ) ( not ( = ?auto_8676 ?auto_8674 ) ) ( AVAILABLE ?auto_8674 ) ( SURFACE-AT ?auto_8671 ?auto_8672 ) ( ON ?auto_8671 ?auto_8675 ) ( CLEAR ?auto_8671 ) ( not ( = ?auto_8670 ?auto_8675 ) ) ( not ( = ?auto_8671 ?auto_8675 ) ) ( not ( = ?auto_8669 ?auto_8675 ) ) ( TRUCK-AT ?auto_8673 ?auto_8677 ) ( ON ?auto_8668 ?auto_8667 ) ( ON ?auto_8669 ?auto_8668 ) ( not ( = ?auto_8667 ?auto_8668 ) ) ( not ( = ?auto_8667 ?auto_8669 ) ) ( not ( = ?auto_8667 ?auto_8670 ) ) ( not ( = ?auto_8667 ?auto_8671 ) ) ( not ( = ?auto_8667 ?auto_8675 ) ) ( not ( = ?auto_8668 ?auto_8669 ) ) ( not ( = ?auto_8668 ?auto_8670 ) ) ( not ( = ?auto_8668 ?auto_8671 ) ) ( not ( = ?auto_8668 ?auto_8675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8669 ?auto_8670 ?auto_8671 )
      ( MAKE-4CRATE-VERIFY ?auto_8667 ?auto_8668 ?auto_8669 ?auto_8670 ?auto_8671 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8706 - SURFACE
      ?auto_8707 - SURFACE
      ?auto_8708 - SURFACE
      ?auto_8709 - SURFACE
      ?auto_8710 - SURFACE
    )
    :vars
    (
      ?auto_8711 - HOIST
      ?auto_8713 - PLACE
      ?auto_8716 - PLACE
      ?auto_8715 - HOIST
      ?auto_8714 - SURFACE
      ?auto_8712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8711 ?auto_8713 ) ( IS-CRATE ?auto_8710 ) ( not ( = ?auto_8709 ?auto_8710 ) ) ( not ( = ?auto_8708 ?auto_8709 ) ) ( not ( = ?auto_8708 ?auto_8710 ) ) ( not ( = ?auto_8716 ?auto_8713 ) ) ( HOIST-AT ?auto_8715 ?auto_8716 ) ( not ( = ?auto_8711 ?auto_8715 ) ) ( AVAILABLE ?auto_8715 ) ( SURFACE-AT ?auto_8710 ?auto_8716 ) ( ON ?auto_8710 ?auto_8714 ) ( CLEAR ?auto_8710 ) ( not ( = ?auto_8709 ?auto_8714 ) ) ( not ( = ?auto_8710 ?auto_8714 ) ) ( not ( = ?auto_8708 ?auto_8714 ) ) ( TRUCK-AT ?auto_8712 ?auto_8713 ) ( SURFACE-AT ?auto_8708 ?auto_8713 ) ( CLEAR ?auto_8708 ) ( LIFTING ?auto_8711 ?auto_8709 ) ( IS-CRATE ?auto_8709 ) ( ON ?auto_8707 ?auto_8706 ) ( ON ?auto_8708 ?auto_8707 ) ( not ( = ?auto_8706 ?auto_8707 ) ) ( not ( = ?auto_8706 ?auto_8708 ) ) ( not ( = ?auto_8706 ?auto_8709 ) ) ( not ( = ?auto_8706 ?auto_8710 ) ) ( not ( = ?auto_8706 ?auto_8714 ) ) ( not ( = ?auto_8707 ?auto_8708 ) ) ( not ( = ?auto_8707 ?auto_8709 ) ) ( not ( = ?auto_8707 ?auto_8710 ) ) ( not ( = ?auto_8707 ?auto_8714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8708 ?auto_8709 ?auto_8710 )
      ( MAKE-4CRATE-VERIFY ?auto_8706 ?auto_8707 ?auto_8708 ?auto_8709 ?auto_8710 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8745 - SURFACE
      ?auto_8746 - SURFACE
      ?auto_8747 - SURFACE
      ?auto_8748 - SURFACE
      ?auto_8749 - SURFACE
    )
    :vars
    (
      ?auto_8755 - HOIST
      ?auto_8750 - PLACE
      ?auto_8752 - PLACE
      ?auto_8754 - HOIST
      ?auto_8751 - SURFACE
      ?auto_8753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8755 ?auto_8750 ) ( IS-CRATE ?auto_8749 ) ( not ( = ?auto_8748 ?auto_8749 ) ) ( not ( = ?auto_8747 ?auto_8748 ) ) ( not ( = ?auto_8747 ?auto_8749 ) ) ( not ( = ?auto_8752 ?auto_8750 ) ) ( HOIST-AT ?auto_8754 ?auto_8752 ) ( not ( = ?auto_8755 ?auto_8754 ) ) ( AVAILABLE ?auto_8754 ) ( SURFACE-AT ?auto_8749 ?auto_8752 ) ( ON ?auto_8749 ?auto_8751 ) ( CLEAR ?auto_8749 ) ( not ( = ?auto_8748 ?auto_8751 ) ) ( not ( = ?auto_8749 ?auto_8751 ) ) ( not ( = ?auto_8747 ?auto_8751 ) ) ( TRUCK-AT ?auto_8753 ?auto_8750 ) ( SURFACE-AT ?auto_8747 ?auto_8750 ) ( CLEAR ?auto_8747 ) ( IS-CRATE ?auto_8748 ) ( AVAILABLE ?auto_8755 ) ( IN ?auto_8748 ?auto_8753 ) ( ON ?auto_8746 ?auto_8745 ) ( ON ?auto_8747 ?auto_8746 ) ( not ( = ?auto_8745 ?auto_8746 ) ) ( not ( = ?auto_8745 ?auto_8747 ) ) ( not ( = ?auto_8745 ?auto_8748 ) ) ( not ( = ?auto_8745 ?auto_8749 ) ) ( not ( = ?auto_8745 ?auto_8751 ) ) ( not ( = ?auto_8746 ?auto_8747 ) ) ( not ( = ?auto_8746 ?auto_8748 ) ) ( not ( = ?auto_8746 ?auto_8749 ) ) ( not ( = ?auto_8746 ?auto_8751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8747 ?auto_8748 ?auto_8749 )
      ( MAKE-4CRATE-VERIFY ?auto_8745 ?auto_8746 ?auto_8747 ?auto_8748 ?auto_8749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9246 - SURFACE
      ?auto_9247 - SURFACE
    )
    :vars
    (
      ?auto_9254 - HOIST
      ?auto_9248 - PLACE
      ?auto_9250 - SURFACE
      ?auto_9249 - TRUCK
      ?auto_9253 - PLACE
      ?auto_9251 - HOIST
      ?auto_9252 - SURFACE
      ?auto_9255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9254 ?auto_9248 ) ( SURFACE-AT ?auto_9246 ?auto_9248 ) ( CLEAR ?auto_9246 ) ( IS-CRATE ?auto_9247 ) ( not ( = ?auto_9246 ?auto_9247 ) ) ( AVAILABLE ?auto_9254 ) ( ON ?auto_9246 ?auto_9250 ) ( not ( = ?auto_9250 ?auto_9246 ) ) ( not ( = ?auto_9250 ?auto_9247 ) ) ( TRUCK-AT ?auto_9249 ?auto_9253 ) ( not ( = ?auto_9253 ?auto_9248 ) ) ( HOIST-AT ?auto_9251 ?auto_9253 ) ( not ( = ?auto_9254 ?auto_9251 ) ) ( SURFACE-AT ?auto_9247 ?auto_9253 ) ( ON ?auto_9247 ?auto_9252 ) ( CLEAR ?auto_9247 ) ( not ( = ?auto_9246 ?auto_9252 ) ) ( not ( = ?auto_9247 ?auto_9252 ) ) ( not ( = ?auto_9250 ?auto_9252 ) ) ( LIFTING ?auto_9251 ?auto_9255 ) ( IS-CRATE ?auto_9255 ) ( not ( = ?auto_9246 ?auto_9255 ) ) ( not ( = ?auto_9247 ?auto_9255 ) ) ( not ( = ?auto_9250 ?auto_9255 ) ) ( not ( = ?auto_9252 ?auto_9255 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9251 ?auto_9255 ?auto_9249 ?auto_9253 )
      ( MAKE-1CRATE ?auto_9246 ?auto_9247 )
      ( MAKE-1CRATE-VERIFY ?auto_9246 ?auto_9247 ) )
  )

)

