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
      ?auto_7802 - PLACE
      ?auto_7803 - HOIST
      ?auto_7804 - SURFACE
      ?auto_7801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7799 ?auto_7800 ) ( SURFACE-AT ?auto_7797 ?auto_7800 ) ( CLEAR ?auto_7797 ) ( IS-CRATE ?auto_7798 ) ( AVAILABLE ?auto_7799 ) ( not ( = ?auto_7802 ?auto_7800 ) ) ( HOIST-AT ?auto_7803 ?auto_7802 ) ( AVAILABLE ?auto_7803 ) ( SURFACE-AT ?auto_7798 ?auto_7802 ) ( ON ?auto_7798 ?auto_7804 ) ( CLEAR ?auto_7798 ) ( TRUCK-AT ?auto_7801 ?auto_7800 ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( not ( = ?auto_7797 ?auto_7804 ) ) ( not ( = ?auto_7798 ?auto_7804 ) ) ( not ( = ?auto_7799 ?auto_7803 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7801 ?auto_7800 ?auto_7802 )
      ( !LIFT ?auto_7803 ?auto_7798 ?auto_7804 ?auto_7802 )
      ( !LOAD ?auto_7803 ?auto_7798 ?auto_7801 ?auto_7802 )
      ( !DRIVE ?auto_7801 ?auto_7802 ?auto_7800 )
      ( !UNLOAD ?auto_7799 ?auto_7798 ?auto_7801 ?auto_7800 )
      ( !DROP ?auto_7799 ?auto_7798 ?auto_7797 ?auto_7800 )
      ( MAKE-1CRATE-VERIFY ?auto_7797 ?auto_7798 ) )
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
      ?auto_7813 - HOIST
      ?auto_7816 - PLACE
      ?auto_7815 - PLACE
      ?auto_7814 - HOIST
      ?auto_7812 - SURFACE
      ?auto_7818 - PLACE
      ?auto_7819 - HOIST
      ?auto_7817 - SURFACE
      ?auto_7811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7813 ?auto_7816 ) ( IS-CRATE ?auto_7810 ) ( not ( = ?auto_7815 ?auto_7816 ) ) ( HOIST-AT ?auto_7814 ?auto_7815 ) ( AVAILABLE ?auto_7814 ) ( SURFACE-AT ?auto_7810 ?auto_7815 ) ( ON ?auto_7810 ?auto_7812 ) ( CLEAR ?auto_7810 ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( not ( = ?auto_7809 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( not ( = ?auto_7813 ?auto_7814 ) ) ( SURFACE-AT ?auto_7808 ?auto_7816 ) ( CLEAR ?auto_7808 ) ( IS-CRATE ?auto_7809 ) ( AVAILABLE ?auto_7813 ) ( not ( = ?auto_7818 ?auto_7816 ) ) ( HOIST-AT ?auto_7819 ?auto_7818 ) ( AVAILABLE ?auto_7819 ) ( SURFACE-AT ?auto_7809 ?auto_7818 ) ( ON ?auto_7809 ?auto_7817 ) ( CLEAR ?auto_7809 ) ( TRUCK-AT ?auto_7811 ?auto_7816 ) ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7817 ) ) ( not ( = ?auto_7809 ?auto_7817 ) ) ( not ( = ?auto_7813 ?auto_7819 ) ) ( not ( = ?auto_7808 ?auto_7810 ) ) ( not ( = ?auto_7808 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7817 ) ) ( not ( = ?auto_7815 ?auto_7818 ) ) ( not ( = ?auto_7814 ?auto_7819 ) ) ( not ( = ?auto_7812 ?auto_7817 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7808 ?auto_7809 )
      ( MAKE-1CRATE ?auto_7809 ?auto_7810 )
      ( MAKE-2CRATE-VERIFY ?auto_7808 ?auto_7809 ?auto_7810 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7822 - SURFACE
      ?auto_7823 - SURFACE
    )
    :vars
    (
      ?auto_7824 - HOIST
      ?auto_7825 - PLACE
      ?auto_7827 - PLACE
      ?auto_7828 - HOIST
      ?auto_7829 - SURFACE
      ?auto_7826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7824 ?auto_7825 ) ( SURFACE-AT ?auto_7822 ?auto_7825 ) ( CLEAR ?auto_7822 ) ( IS-CRATE ?auto_7823 ) ( AVAILABLE ?auto_7824 ) ( not ( = ?auto_7827 ?auto_7825 ) ) ( HOIST-AT ?auto_7828 ?auto_7827 ) ( AVAILABLE ?auto_7828 ) ( SURFACE-AT ?auto_7823 ?auto_7827 ) ( ON ?auto_7823 ?auto_7829 ) ( CLEAR ?auto_7823 ) ( TRUCK-AT ?auto_7826 ?auto_7825 ) ( not ( = ?auto_7822 ?auto_7823 ) ) ( not ( = ?auto_7822 ?auto_7829 ) ) ( not ( = ?auto_7823 ?auto_7829 ) ) ( not ( = ?auto_7824 ?auto_7828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7826 ?auto_7825 ?auto_7827 )
      ( !LIFT ?auto_7828 ?auto_7823 ?auto_7829 ?auto_7827 )
      ( !LOAD ?auto_7828 ?auto_7823 ?auto_7826 ?auto_7827 )
      ( !DRIVE ?auto_7826 ?auto_7827 ?auto_7825 )
      ( !UNLOAD ?auto_7824 ?auto_7823 ?auto_7826 ?auto_7825 )
      ( !DROP ?auto_7824 ?auto_7823 ?auto_7822 ?auto_7825 )
      ( MAKE-1CRATE-VERIFY ?auto_7822 ?auto_7823 ) )
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
      ?auto_7841 - HOIST
      ?auto_7840 - PLACE
      ?auto_7839 - PLACE
      ?auto_7838 - HOIST
      ?auto_7842 - SURFACE
      ?auto_7844 - PLACE
      ?auto_7846 - HOIST
      ?auto_7845 - SURFACE
      ?auto_7847 - SURFACE
      ?auto_7843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7841 ?auto_7840 ) ( IS-CRATE ?auto_7837 ) ( not ( = ?auto_7839 ?auto_7840 ) ) ( HOIST-AT ?auto_7838 ?auto_7839 ) ( SURFACE-AT ?auto_7837 ?auto_7839 ) ( ON ?auto_7837 ?auto_7842 ) ( CLEAR ?auto_7837 ) ( not ( = ?auto_7836 ?auto_7837 ) ) ( not ( = ?auto_7836 ?auto_7842 ) ) ( not ( = ?auto_7837 ?auto_7842 ) ) ( not ( = ?auto_7841 ?auto_7838 ) ) ( IS-CRATE ?auto_7836 ) ( not ( = ?auto_7844 ?auto_7840 ) ) ( HOIST-AT ?auto_7846 ?auto_7844 ) ( AVAILABLE ?auto_7846 ) ( SURFACE-AT ?auto_7836 ?auto_7844 ) ( ON ?auto_7836 ?auto_7845 ) ( CLEAR ?auto_7836 ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( not ( = ?auto_7835 ?auto_7845 ) ) ( not ( = ?auto_7836 ?auto_7845 ) ) ( not ( = ?auto_7841 ?auto_7846 ) ) ( SURFACE-AT ?auto_7834 ?auto_7840 ) ( CLEAR ?auto_7834 ) ( IS-CRATE ?auto_7835 ) ( AVAILABLE ?auto_7841 ) ( AVAILABLE ?auto_7838 ) ( SURFACE-AT ?auto_7835 ?auto_7839 ) ( ON ?auto_7835 ?auto_7847 ) ( CLEAR ?auto_7835 ) ( TRUCK-AT ?auto_7843 ?auto_7840 ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7847 ) ) ( not ( = ?auto_7835 ?auto_7847 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7834 ?auto_7845 ) ) ( not ( = ?auto_7836 ?auto_7847 ) ) ( not ( = ?auto_7844 ?auto_7839 ) ) ( not ( = ?auto_7846 ?auto_7838 ) ) ( not ( = ?auto_7845 ?auto_7847 ) ) ( not ( = ?auto_7834 ?auto_7837 ) ) ( not ( = ?auto_7834 ?auto_7842 ) ) ( not ( = ?auto_7835 ?auto_7837 ) ) ( not ( = ?auto_7835 ?auto_7842 ) ) ( not ( = ?auto_7837 ?auto_7845 ) ) ( not ( = ?auto_7837 ?auto_7847 ) ) ( not ( = ?auto_7842 ?auto_7845 ) ) ( not ( = ?auto_7842 ?auto_7847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7834 ?auto_7835 ?auto_7836 )
      ( MAKE-1CRATE ?auto_7836 ?auto_7837 )
      ( MAKE-3CRATE-VERIFY ?auto_7834 ?auto_7835 ?auto_7836 ?auto_7837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7850 - SURFACE
      ?auto_7851 - SURFACE
    )
    :vars
    (
      ?auto_7852 - HOIST
      ?auto_7853 - PLACE
      ?auto_7855 - PLACE
      ?auto_7856 - HOIST
      ?auto_7857 - SURFACE
      ?auto_7854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7852 ?auto_7853 ) ( SURFACE-AT ?auto_7850 ?auto_7853 ) ( CLEAR ?auto_7850 ) ( IS-CRATE ?auto_7851 ) ( AVAILABLE ?auto_7852 ) ( not ( = ?auto_7855 ?auto_7853 ) ) ( HOIST-AT ?auto_7856 ?auto_7855 ) ( AVAILABLE ?auto_7856 ) ( SURFACE-AT ?auto_7851 ?auto_7855 ) ( ON ?auto_7851 ?auto_7857 ) ( CLEAR ?auto_7851 ) ( TRUCK-AT ?auto_7854 ?auto_7853 ) ( not ( = ?auto_7850 ?auto_7851 ) ) ( not ( = ?auto_7850 ?auto_7857 ) ) ( not ( = ?auto_7851 ?auto_7857 ) ) ( not ( = ?auto_7852 ?auto_7856 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7854 ?auto_7853 ?auto_7855 )
      ( !LIFT ?auto_7856 ?auto_7851 ?auto_7857 ?auto_7855 )
      ( !LOAD ?auto_7856 ?auto_7851 ?auto_7854 ?auto_7855 )
      ( !DRIVE ?auto_7854 ?auto_7855 ?auto_7853 )
      ( !UNLOAD ?auto_7852 ?auto_7851 ?auto_7854 ?auto_7853 )
      ( !DROP ?auto_7852 ?auto_7851 ?auto_7850 ?auto_7853 )
      ( MAKE-1CRATE-VERIFY ?auto_7850 ?auto_7851 ) )
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
      ?auto_7873 - HOIST
      ?auto_7869 - PLACE
      ?auto_7868 - PLACE
      ?auto_7870 - HOIST
      ?auto_7871 - SURFACE
      ?auto_7876 - PLACE
      ?auto_7878 - HOIST
      ?auto_7879 - SURFACE
      ?auto_7874 - PLACE
      ?auto_7880 - HOIST
      ?auto_7877 - SURFACE
      ?auto_7875 - SURFACE
      ?auto_7872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7873 ?auto_7869 ) ( IS-CRATE ?auto_7867 ) ( not ( = ?auto_7868 ?auto_7869 ) ) ( HOIST-AT ?auto_7870 ?auto_7868 ) ( AVAILABLE ?auto_7870 ) ( SURFACE-AT ?auto_7867 ?auto_7868 ) ( ON ?auto_7867 ?auto_7871 ) ( CLEAR ?auto_7867 ) ( not ( = ?auto_7866 ?auto_7867 ) ) ( not ( = ?auto_7866 ?auto_7871 ) ) ( not ( = ?auto_7867 ?auto_7871 ) ) ( not ( = ?auto_7873 ?auto_7870 ) ) ( IS-CRATE ?auto_7866 ) ( not ( = ?auto_7876 ?auto_7869 ) ) ( HOIST-AT ?auto_7878 ?auto_7876 ) ( SURFACE-AT ?auto_7866 ?auto_7876 ) ( ON ?auto_7866 ?auto_7879 ) ( CLEAR ?auto_7866 ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( not ( = ?auto_7865 ?auto_7879 ) ) ( not ( = ?auto_7866 ?auto_7879 ) ) ( not ( = ?auto_7873 ?auto_7878 ) ) ( IS-CRATE ?auto_7865 ) ( not ( = ?auto_7874 ?auto_7869 ) ) ( HOIST-AT ?auto_7880 ?auto_7874 ) ( AVAILABLE ?auto_7880 ) ( SURFACE-AT ?auto_7865 ?auto_7874 ) ( ON ?auto_7865 ?auto_7877 ) ( CLEAR ?auto_7865 ) ( not ( = ?auto_7864 ?auto_7865 ) ) ( not ( = ?auto_7864 ?auto_7877 ) ) ( not ( = ?auto_7865 ?auto_7877 ) ) ( not ( = ?auto_7873 ?auto_7880 ) ) ( SURFACE-AT ?auto_7863 ?auto_7869 ) ( CLEAR ?auto_7863 ) ( IS-CRATE ?auto_7864 ) ( AVAILABLE ?auto_7873 ) ( AVAILABLE ?auto_7878 ) ( SURFACE-AT ?auto_7864 ?auto_7876 ) ( ON ?auto_7864 ?auto_7875 ) ( CLEAR ?auto_7864 ) ( TRUCK-AT ?auto_7872 ?auto_7869 ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7875 ) ) ( not ( = ?auto_7864 ?auto_7875 ) ) ( not ( = ?auto_7863 ?auto_7865 ) ) ( not ( = ?auto_7863 ?auto_7877 ) ) ( not ( = ?auto_7865 ?auto_7875 ) ) ( not ( = ?auto_7874 ?auto_7876 ) ) ( not ( = ?auto_7880 ?auto_7878 ) ) ( not ( = ?auto_7877 ?auto_7875 ) ) ( not ( = ?auto_7863 ?auto_7866 ) ) ( not ( = ?auto_7863 ?auto_7879 ) ) ( not ( = ?auto_7864 ?auto_7866 ) ) ( not ( = ?auto_7864 ?auto_7879 ) ) ( not ( = ?auto_7866 ?auto_7877 ) ) ( not ( = ?auto_7866 ?auto_7875 ) ) ( not ( = ?auto_7879 ?auto_7877 ) ) ( not ( = ?auto_7879 ?auto_7875 ) ) ( not ( = ?auto_7863 ?auto_7867 ) ) ( not ( = ?auto_7863 ?auto_7871 ) ) ( not ( = ?auto_7864 ?auto_7867 ) ) ( not ( = ?auto_7864 ?auto_7871 ) ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7865 ?auto_7871 ) ) ( not ( = ?auto_7867 ?auto_7879 ) ) ( not ( = ?auto_7867 ?auto_7877 ) ) ( not ( = ?auto_7867 ?auto_7875 ) ) ( not ( = ?auto_7868 ?auto_7876 ) ) ( not ( = ?auto_7868 ?auto_7874 ) ) ( not ( = ?auto_7870 ?auto_7878 ) ) ( not ( = ?auto_7870 ?auto_7880 ) ) ( not ( = ?auto_7871 ?auto_7879 ) ) ( not ( = ?auto_7871 ?auto_7877 ) ) ( not ( = ?auto_7871 ?auto_7875 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7863 ?auto_7864 ?auto_7865 ?auto_7866 )
      ( MAKE-1CRATE ?auto_7866 ?auto_7867 )
      ( MAKE-4CRATE-VERIFY ?auto_7863 ?auto_7864 ?auto_7865 ?auto_7866 ?auto_7867 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7883 - SURFACE
      ?auto_7884 - SURFACE
    )
    :vars
    (
      ?auto_7885 - HOIST
      ?auto_7886 - PLACE
      ?auto_7888 - PLACE
      ?auto_7889 - HOIST
      ?auto_7890 - SURFACE
      ?auto_7887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7885 ?auto_7886 ) ( SURFACE-AT ?auto_7883 ?auto_7886 ) ( CLEAR ?auto_7883 ) ( IS-CRATE ?auto_7884 ) ( AVAILABLE ?auto_7885 ) ( not ( = ?auto_7888 ?auto_7886 ) ) ( HOIST-AT ?auto_7889 ?auto_7888 ) ( AVAILABLE ?auto_7889 ) ( SURFACE-AT ?auto_7884 ?auto_7888 ) ( ON ?auto_7884 ?auto_7890 ) ( CLEAR ?auto_7884 ) ( TRUCK-AT ?auto_7887 ?auto_7886 ) ( not ( = ?auto_7883 ?auto_7884 ) ) ( not ( = ?auto_7883 ?auto_7890 ) ) ( not ( = ?auto_7884 ?auto_7890 ) ) ( not ( = ?auto_7885 ?auto_7889 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7887 ?auto_7886 ?auto_7888 )
      ( !LIFT ?auto_7889 ?auto_7884 ?auto_7890 ?auto_7888 )
      ( !LOAD ?auto_7889 ?auto_7884 ?auto_7887 ?auto_7888 )
      ( !DRIVE ?auto_7887 ?auto_7888 ?auto_7886 )
      ( !UNLOAD ?auto_7885 ?auto_7884 ?auto_7887 ?auto_7886 )
      ( !DROP ?auto_7885 ?auto_7884 ?auto_7883 ?auto_7886 )
      ( MAKE-1CRATE-VERIFY ?auto_7883 ?auto_7884 ) )
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
      ?auto_7905 - HOIST
      ?auto_7906 - PLACE
      ?auto_7904 - PLACE
      ?auto_7903 - HOIST
      ?auto_7908 - SURFACE
      ?auto_7911 - PLACE
      ?auto_7915 - HOIST
      ?auto_7912 - SURFACE
      ?auto_7916 - SURFACE
      ?auto_7909 - PLACE
      ?auto_7913 - HOIST
      ?auto_7914 - SURFACE
      ?auto_7910 - SURFACE
      ?auto_7907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7905 ?auto_7906 ) ( IS-CRATE ?auto_7902 ) ( not ( = ?auto_7904 ?auto_7906 ) ) ( HOIST-AT ?auto_7903 ?auto_7904 ) ( SURFACE-AT ?auto_7902 ?auto_7904 ) ( ON ?auto_7902 ?auto_7908 ) ( CLEAR ?auto_7902 ) ( not ( = ?auto_7901 ?auto_7902 ) ) ( not ( = ?auto_7901 ?auto_7908 ) ) ( not ( = ?auto_7902 ?auto_7908 ) ) ( not ( = ?auto_7905 ?auto_7903 ) ) ( IS-CRATE ?auto_7901 ) ( not ( = ?auto_7911 ?auto_7906 ) ) ( HOIST-AT ?auto_7915 ?auto_7911 ) ( AVAILABLE ?auto_7915 ) ( SURFACE-AT ?auto_7901 ?auto_7911 ) ( ON ?auto_7901 ?auto_7912 ) ( CLEAR ?auto_7901 ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( not ( = ?auto_7900 ?auto_7912 ) ) ( not ( = ?auto_7901 ?auto_7912 ) ) ( not ( = ?auto_7905 ?auto_7915 ) ) ( IS-CRATE ?auto_7900 ) ( SURFACE-AT ?auto_7900 ?auto_7904 ) ( ON ?auto_7900 ?auto_7916 ) ( CLEAR ?auto_7900 ) ( not ( = ?auto_7899 ?auto_7900 ) ) ( not ( = ?auto_7899 ?auto_7916 ) ) ( not ( = ?auto_7900 ?auto_7916 ) ) ( IS-CRATE ?auto_7899 ) ( not ( = ?auto_7909 ?auto_7906 ) ) ( HOIST-AT ?auto_7913 ?auto_7909 ) ( AVAILABLE ?auto_7913 ) ( SURFACE-AT ?auto_7899 ?auto_7909 ) ( ON ?auto_7899 ?auto_7914 ) ( CLEAR ?auto_7899 ) ( not ( = ?auto_7898 ?auto_7899 ) ) ( not ( = ?auto_7898 ?auto_7914 ) ) ( not ( = ?auto_7899 ?auto_7914 ) ) ( not ( = ?auto_7905 ?auto_7913 ) ) ( SURFACE-AT ?auto_7897 ?auto_7906 ) ( CLEAR ?auto_7897 ) ( IS-CRATE ?auto_7898 ) ( AVAILABLE ?auto_7905 ) ( AVAILABLE ?auto_7903 ) ( SURFACE-AT ?auto_7898 ?auto_7904 ) ( ON ?auto_7898 ?auto_7910 ) ( CLEAR ?auto_7898 ) ( TRUCK-AT ?auto_7907 ?auto_7906 ) ( not ( = ?auto_7897 ?auto_7898 ) ) ( not ( = ?auto_7897 ?auto_7910 ) ) ( not ( = ?auto_7898 ?auto_7910 ) ) ( not ( = ?auto_7897 ?auto_7899 ) ) ( not ( = ?auto_7897 ?auto_7914 ) ) ( not ( = ?auto_7899 ?auto_7910 ) ) ( not ( = ?auto_7909 ?auto_7904 ) ) ( not ( = ?auto_7913 ?auto_7903 ) ) ( not ( = ?auto_7914 ?auto_7910 ) ) ( not ( = ?auto_7897 ?auto_7900 ) ) ( not ( = ?auto_7897 ?auto_7916 ) ) ( not ( = ?auto_7898 ?auto_7900 ) ) ( not ( = ?auto_7898 ?auto_7916 ) ) ( not ( = ?auto_7900 ?auto_7914 ) ) ( not ( = ?auto_7900 ?auto_7910 ) ) ( not ( = ?auto_7916 ?auto_7914 ) ) ( not ( = ?auto_7916 ?auto_7910 ) ) ( not ( = ?auto_7897 ?auto_7901 ) ) ( not ( = ?auto_7897 ?auto_7912 ) ) ( not ( = ?auto_7898 ?auto_7901 ) ) ( not ( = ?auto_7898 ?auto_7912 ) ) ( not ( = ?auto_7899 ?auto_7901 ) ) ( not ( = ?auto_7899 ?auto_7912 ) ) ( not ( = ?auto_7901 ?auto_7916 ) ) ( not ( = ?auto_7901 ?auto_7914 ) ) ( not ( = ?auto_7901 ?auto_7910 ) ) ( not ( = ?auto_7911 ?auto_7904 ) ) ( not ( = ?auto_7911 ?auto_7909 ) ) ( not ( = ?auto_7915 ?auto_7903 ) ) ( not ( = ?auto_7915 ?auto_7913 ) ) ( not ( = ?auto_7912 ?auto_7916 ) ) ( not ( = ?auto_7912 ?auto_7914 ) ) ( not ( = ?auto_7912 ?auto_7910 ) ) ( not ( = ?auto_7897 ?auto_7902 ) ) ( not ( = ?auto_7897 ?auto_7908 ) ) ( not ( = ?auto_7898 ?auto_7902 ) ) ( not ( = ?auto_7898 ?auto_7908 ) ) ( not ( = ?auto_7899 ?auto_7902 ) ) ( not ( = ?auto_7899 ?auto_7908 ) ) ( not ( = ?auto_7900 ?auto_7902 ) ) ( not ( = ?auto_7900 ?auto_7908 ) ) ( not ( = ?auto_7902 ?auto_7912 ) ) ( not ( = ?auto_7902 ?auto_7916 ) ) ( not ( = ?auto_7902 ?auto_7914 ) ) ( not ( = ?auto_7902 ?auto_7910 ) ) ( not ( = ?auto_7908 ?auto_7912 ) ) ( not ( = ?auto_7908 ?auto_7916 ) ) ( not ( = ?auto_7908 ?auto_7914 ) ) ( not ( = ?auto_7908 ?auto_7910 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7897 ?auto_7898 ?auto_7899 ?auto_7900 ?auto_7901 )
      ( MAKE-1CRATE ?auto_7901 ?auto_7902 )
      ( MAKE-5CRATE-VERIFY ?auto_7897 ?auto_7898 ?auto_7899 ?auto_7900 ?auto_7901 ?auto_7902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7919 - SURFACE
      ?auto_7920 - SURFACE
    )
    :vars
    (
      ?auto_7921 - HOIST
      ?auto_7922 - PLACE
      ?auto_7924 - PLACE
      ?auto_7925 - HOIST
      ?auto_7926 - SURFACE
      ?auto_7923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7921 ?auto_7922 ) ( SURFACE-AT ?auto_7919 ?auto_7922 ) ( CLEAR ?auto_7919 ) ( IS-CRATE ?auto_7920 ) ( AVAILABLE ?auto_7921 ) ( not ( = ?auto_7924 ?auto_7922 ) ) ( HOIST-AT ?auto_7925 ?auto_7924 ) ( AVAILABLE ?auto_7925 ) ( SURFACE-AT ?auto_7920 ?auto_7924 ) ( ON ?auto_7920 ?auto_7926 ) ( CLEAR ?auto_7920 ) ( TRUCK-AT ?auto_7923 ?auto_7922 ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( not ( = ?auto_7919 ?auto_7926 ) ) ( not ( = ?auto_7920 ?auto_7926 ) ) ( not ( = ?auto_7921 ?auto_7925 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7923 ?auto_7922 ?auto_7924 )
      ( !LIFT ?auto_7925 ?auto_7920 ?auto_7926 ?auto_7924 )
      ( !LOAD ?auto_7925 ?auto_7920 ?auto_7923 ?auto_7924 )
      ( !DRIVE ?auto_7923 ?auto_7924 ?auto_7922 )
      ( !UNLOAD ?auto_7921 ?auto_7920 ?auto_7923 ?auto_7922 )
      ( !DROP ?auto_7921 ?auto_7920 ?auto_7919 ?auto_7922 )
      ( MAKE-1CRATE-VERIFY ?auto_7919 ?auto_7920 ) )
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
      ?auto_7946 - HOIST
      ?auto_7945 - PLACE
      ?auto_7943 - PLACE
      ?auto_7941 - HOIST
      ?auto_7942 - SURFACE
      ?auto_7953 - PLACE
      ?auto_7954 - HOIST
      ?auto_7952 - SURFACE
      ?auto_7955 - PLACE
      ?auto_7947 - HOIST
      ?auto_7949 - SURFACE
      ?auto_7950 - SURFACE
      ?auto_7948 - SURFACE
      ?auto_7951 - SURFACE
      ?auto_7944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7946 ?auto_7945 ) ( IS-CRATE ?auto_7940 ) ( not ( = ?auto_7943 ?auto_7945 ) ) ( HOIST-AT ?auto_7941 ?auto_7943 ) ( SURFACE-AT ?auto_7940 ?auto_7943 ) ( ON ?auto_7940 ?auto_7942 ) ( CLEAR ?auto_7940 ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( not ( = ?auto_7939 ?auto_7942 ) ) ( not ( = ?auto_7940 ?auto_7942 ) ) ( not ( = ?auto_7946 ?auto_7941 ) ) ( IS-CRATE ?auto_7939 ) ( not ( = ?auto_7953 ?auto_7945 ) ) ( HOIST-AT ?auto_7954 ?auto_7953 ) ( SURFACE-AT ?auto_7939 ?auto_7953 ) ( ON ?auto_7939 ?auto_7952 ) ( CLEAR ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7939 ) ) ( not ( = ?auto_7938 ?auto_7952 ) ) ( not ( = ?auto_7939 ?auto_7952 ) ) ( not ( = ?auto_7946 ?auto_7954 ) ) ( IS-CRATE ?auto_7938 ) ( not ( = ?auto_7955 ?auto_7945 ) ) ( HOIST-AT ?auto_7947 ?auto_7955 ) ( AVAILABLE ?auto_7947 ) ( SURFACE-AT ?auto_7938 ?auto_7955 ) ( ON ?auto_7938 ?auto_7949 ) ( CLEAR ?auto_7938 ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7949 ) ) ( not ( = ?auto_7938 ?auto_7949 ) ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( IS-CRATE ?auto_7937 ) ( SURFACE-AT ?auto_7937 ?auto_7953 ) ( ON ?auto_7937 ?auto_7950 ) ( CLEAR ?auto_7937 ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7936 ?auto_7950 ) ) ( not ( = ?auto_7937 ?auto_7950 ) ) ( IS-CRATE ?auto_7936 ) ( AVAILABLE ?auto_7941 ) ( SURFACE-AT ?auto_7936 ?auto_7943 ) ( ON ?auto_7936 ?auto_7948 ) ( CLEAR ?auto_7936 ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7948 ) ) ( not ( = ?auto_7936 ?auto_7948 ) ) ( SURFACE-AT ?auto_7934 ?auto_7945 ) ( CLEAR ?auto_7934 ) ( IS-CRATE ?auto_7935 ) ( AVAILABLE ?auto_7946 ) ( AVAILABLE ?auto_7954 ) ( SURFACE-AT ?auto_7935 ?auto_7953 ) ( ON ?auto_7935 ?auto_7951 ) ( CLEAR ?auto_7935 ) ( TRUCK-AT ?auto_7944 ?auto_7945 ) ( not ( = ?auto_7934 ?auto_7935 ) ) ( not ( = ?auto_7934 ?auto_7951 ) ) ( not ( = ?auto_7935 ?auto_7951 ) ) ( not ( = ?auto_7934 ?auto_7936 ) ) ( not ( = ?auto_7934 ?auto_7948 ) ) ( not ( = ?auto_7936 ?auto_7951 ) ) ( not ( = ?auto_7943 ?auto_7953 ) ) ( not ( = ?auto_7941 ?auto_7954 ) ) ( not ( = ?auto_7948 ?auto_7951 ) ) ( not ( = ?auto_7934 ?auto_7937 ) ) ( not ( = ?auto_7934 ?auto_7950 ) ) ( not ( = ?auto_7935 ?auto_7937 ) ) ( not ( = ?auto_7935 ?auto_7950 ) ) ( not ( = ?auto_7937 ?auto_7948 ) ) ( not ( = ?auto_7937 ?auto_7951 ) ) ( not ( = ?auto_7950 ?auto_7948 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7934 ?auto_7938 ) ) ( not ( = ?auto_7934 ?auto_7949 ) ) ( not ( = ?auto_7935 ?auto_7938 ) ) ( not ( = ?auto_7935 ?auto_7949 ) ) ( not ( = ?auto_7936 ?auto_7938 ) ) ( not ( = ?auto_7936 ?auto_7949 ) ) ( not ( = ?auto_7938 ?auto_7950 ) ) ( not ( = ?auto_7938 ?auto_7948 ) ) ( not ( = ?auto_7938 ?auto_7951 ) ) ( not ( = ?auto_7955 ?auto_7953 ) ) ( not ( = ?auto_7955 ?auto_7943 ) ) ( not ( = ?auto_7947 ?auto_7954 ) ) ( not ( = ?auto_7947 ?auto_7941 ) ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7948 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7934 ?auto_7939 ) ) ( not ( = ?auto_7934 ?auto_7952 ) ) ( not ( = ?auto_7935 ?auto_7939 ) ) ( not ( = ?auto_7935 ?auto_7952 ) ) ( not ( = ?auto_7936 ?auto_7939 ) ) ( not ( = ?auto_7936 ?auto_7952 ) ) ( not ( = ?auto_7937 ?auto_7939 ) ) ( not ( = ?auto_7937 ?auto_7952 ) ) ( not ( = ?auto_7939 ?auto_7949 ) ) ( not ( = ?auto_7939 ?auto_7950 ) ) ( not ( = ?auto_7939 ?auto_7948 ) ) ( not ( = ?auto_7939 ?auto_7951 ) ) ( not ( = ?auto_7952 ?auto_7949 ) ) ( not ( = ?auto_7952 ?auto_7950 ) ) ( not ( = ?auto_7952 ?auto_7948 ) ) ( not ( = ?auto_7952 ?auto_7951 ) ) ( not ( = ?auto_7934 ?auto_7940 ) ) ( not ( = ?auto_7934 ?auto_7942 ) ) ( not ( = ?auto_7935 ?auto_7940 ) ) ( not ( = ?auto_7935 ?auto_7942 ) ) ( not ( = ?auto_7936 ?auto_7940 ) ) ( not ( = ?auto_7936 ?auto_7942 ) ) ( not ( = ?auto_7937 ?auto_7940 ) ) ( not ( = ?auto_7937 ?auto_7942 ) ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( not ( = ?auto_7938 ?auto_7942 ) ) ( not ( = ?auto_7940 ?auto_7952 ) ) ( not ( = ?auto_7940 ?auto_7949 ) ) ( not ( = ?auto_7940 ?auto_7950 ) ) ( not ( = ?auto_7940 ?auto_7948 ) ) ( not ( = ?auto_7940 ?auto_7951 ) ) ( not ( = ?auto_7942 ?auto_7952 ) ) ( not ( = ?auto_7942 ?auto_7949 ) ) ( not ( = ?auto_7942 ?auto_7950 ) ) ( not ( = ?auto_7942 ?auto_7948 ) ) ( not ( = ?auto_7942 ?auto_7951 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7934 ?auto_7935 ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 )
      ( MAKE-1CRATE ?auto_7939 ?auto_7940 )
      ( MAKE-6CRATE-VERIFY ?auto_7934 ?auto_7935 ?auto_7936 ?auto_7937 ?auto_7938 ?auto_7939 ?auto_7940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7958 - SURFACE
      ?auto_7959 - SURFACE
    )
    :vars
    (
      ?auto_7960 - HOIST
      ?auto_7961 - PLACE
      ?auto_7963 - PLACE
      ?auto_7964 - HOIST
      ?auto_7965 - SURFACE
      ?auto_7962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7960 ?auto_7961 ) ( SURFACE-AT ?auto_7958 ?auto_7961 ) ( CLEAR ?auto_7958 ) ( IS-CRATE ?auto_7959 ) ( AVAILABLE ?auto_7960 ) ( not ( = ?auto_7963 ?auto_7961 ) ) ( HOIST-AT ?auto_7964 ?auto_7963 ) ( AVAILABLE ?auto_7964 ) ( SURFACE-AT ?auto_7959 ?auto_7963 ) ( ON ?auto_7959 ?auto_7965 ) ( CLEAR ?auto_7959 ) ( TRUCK-AT ?auto_7962 ?auto_7961 ) ( not ( = ?auto_7958 ?auto_7959 ) ) ( not ( = ?auto_7958 ?auto_7965 ) ) ( not ( = ?auto_7959 ?auto_7965 ) ) ( not ( = ?auto_7960 ?auto_7964 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7962 ?auto_7961 ?auto_7963 )
      ( !LIFT ?auto_7964 ?auto_7959 ?auto_7965 ?auto_7963 )
      ( !LOAD ?auto_7964 ?auto_7959 ?auto_7962 ?auto_7963 )
      ( !DRIVE ?auto_7962 ?auto_7963 ?auto_7961 )
      ( !UNLOAD ?auto_7960 ?auto_7959 ?auto_7962 ?auto_7961 )
      ( !DROP ?auto_7960 ?auto_7959 ?auto_7958 ?auto_7961 )
      ( MAKE-1CRATE-VERIFY ?auto_7958 ?auto_7959 ) )
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
      ?auto_7981 - SURFACE
      ?auto_7980 - SURFACE
    )
    :vars
    (
      ?auto_7984 - HOIST
      ?auto_7985 - PLACE
      ?auto_7983 - PLACE
      ?auto_7987 - HOIST
      ?auto_7986 - SURFACE
      ?auto_7991 - SURFACE
      ?auto_7995 - PLACE
      ?auto_7994 - HOIST
      ?auto_7996 - SURFACE
      ?auto_7993 - PLACE
      ?auto_7988 - HOIST
      ?auto_7992 - SURFACE
      ?auto_7989 - SURFACE
      ?auto_7990 - SURFACE
      ?auto_7997 - SURFACE
      ?auto_7982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7984 ?auto_7985 ) ( IS-CRATE ?auto_7980 ) ( not ( = ?auto_7983 ?auto_7985 ) ) ( HOIST-AT ?auto_7987 ?auto_7983 ) ( SURFACE-AT ?auto_7980 ?auto_7983 ) ( ON ?auto_7980 ?auto_7986 ) ( CLEAR ?auto_7980 ) ( not ( = ?auto_7981 ?auto_7980 ) ) ( not ( = ?auto_7981 ?auto_7986 ) ) ( not ( = ?auto_7980 ?auto_7986 ) ) ( not ( = ?auto_7984 ?auto_7987 ) ) ( IS-CRATE ?auto_7981 ) ( SURFACE-AT ?auto_7981 ?auto_7983 ) ( ON ?auto_7981 ?auto_7991 ) ( CLEAR ?auto_7981 ) ( not ( = ?auto_7979 ?auto_7981 ) ) ( not ( = ?auto_7979 ?auto_7991 ) ) ( not ( = ?auto_7981 ?auto_7991 ) ) ( IS-CRATE ?auto_7979 ) ( not ( = ?auto_7995 ?auto_7985 ) ) ( HOIST-AT ?auto_7994 ?auto_7995 ) ( SURFACE-AT ?auto_7979 ?auto_7995 ) ( ON ?auto_7979 ?auto_7996 ) ( CLEAR ?auto_7979 ) ( not ( = ?auto_7978 ?auto_7979 ) ) ( not ( = ?auto_7978 ?auto_7996 ) ) ( not ( = ?auto_7979 ?auto_7996 ) ) ( not ( = ?auto_7984 ?auto_7994 ) ) ( IS-CRATE ?auto_7978 ) ( not ( = ?auto_7993 ?auto_7985 ) ) ( HOIST-AT ?auto_7988 ?auto_7993 ) ( AVAILABLE ?auto_7988 ) ( SURFACE-AT ?auto_7978 ?auto_7993 ) ( ON ?auto_7978 ?auto_7992 ) ( CLEAR ?auto_7978 ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7992 ) ) ( not ( = ?auto_7978 ?auto_7992 ) ) ( not ( = ?auto_7984 ?auto_7988 ) ) ( IS-CRATE ?auto_7977 ) ( SURFACE-AT ?auto_7977 ?auto_7995 ) ( ON ?auto_7977 ?auto_7989 ) ( CLEAR ?auto_7977 ) ( not ( = ?auto_7976 ?auto_7977 ) ) ( not ( = ?auto_7976 ?auto_7989 ) ) ( not ( = ?auto_7977 ?auto_7989 ) ) ( IS-CRATE ?auto_7976 ) ( AVAILABLE ?auto_7987 ) ( SURFACE-AT ?auto_7976 ?auto_7983 ) ( ON ?auto_7976 ?auto_7990 ) ( CLEAR ?auto_7976 ) ( not ( = ?auto_7975 ?auto_7976 ) ) ( not ( = ?auto_7975 ?auto_7990 ) ) ( not ( = ?auto_7976 ?auto_7990 ) ) ( SURFACE-AT ?auto_7974 ?auto_7985 ) ( CLEAR ?auto_7974 ) ( IS-CRATE ?auto_7975 ) ( AVAILABLE ?auto_7984 ) ( AVAILABLE ?auto_7994 ) ( SURFACE-AT ?auto_7975 ?auto_7995 ) ( ON ?auto_7975 ?auto_7997 ) ( CLEAR ?auto_7975 ) ( TRUCK-AT ?auto_7982 ?auto_7985 ) ( not ( = ?auto_7974 ?auto_7975 ) ) ( not ( = ?auto_7974 ?auto_7997 ) ) ( not ( = ?auto_7975 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7976 ) ) ( not ( = ?auto_7974 ?auto_7990 ) ) ( not ( = ?auto_7976 ?auto_7997 ) ) ( not ( = ?auto_7983 ?auto_7995 ) ) ( not ( = ?auto_7987 ?auto_7994 ) ) ( not ( = ?auto_7990 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7977 ) ) ( not ( = ?auto_7974 ?auto_7989 ) ) ( not ( = ?auto_7975 ?auto_7977 ) ) ( not ( = ?auto_7975 ?auto_7989 ) ) ( not ( = ?auto_7977 ?auto_7990 ) ) ( not ( = ?auto_7977 ?auto_7997 ) ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7978 ) ) ( not ( = ?auto_7974 ?auto_7992 ) ) ( not ( = ?auto_7975 ?auto_7978 ) ) ( not ( = ?auto_7975 ?auto_7992 ) ) ( not ( = ?auto_7976 ?auto_7978 ) ) ( not ( = ?auto_7976 ?auto_7992 ) ) ( not ( = ?auto_7978 ?auto_7989 ) ) ( not ( = ?auto_7978 ?auto_7990 ) ) ( not ( = ?auto_7978 ?auto_7997 ) ) ( not ( = ?auto_7993 ?auto_7995 ) ) ( not ( = ?auto_7993 ?auto_7983 ) ) ( not ( = ?auto_7988 ?auto_7994 ) ) ( not ( = ?auto_7988 ?auto_7987 ) ) ( not ( = ?auto_7992 ?auto_7989 ) ) ( not ( = ?auto_7992 ?auto_7990 ) ) ( not ( = ?auto_7992 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7979 ) ) ( not ( = ?auto_7974 ?auto_7996 ) ) ( not ( = ?auto_7975 ?auto_7979 ) ) ( not ( = ?auto_7975 ?auto_7996 ) ) ( not ( = ?auto_7976 ?auto_7979 ) ) ( not ( = ?auto_7976 ?auto_7996 ) ) ( not ( = ?auto_7977 ?auto_7979 ) ) ( not ( = ?auto_7977 ?auto_7996 ) ) ( not ( = ?auto_7979 ?auto_7992 ) ) ( not ( = ?auto_7979 ?auto_7989 ) ) ( not ( = ?auto_7979 ?auto_7990 ) ) ( not ( = ?auto_7979 ?auto_7997 ) ) ( not ( = ?auto_7996 ?auto_7992 ) ) ( not ( = ?auto_7996 ?auto_7989 ) ) ( not ( = ?auto_7996 ?auto_7990 ) ) ( not ( = ?auto_7996 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7981 ) ) ( not ( = ?auto_7974 ?auto_7991 ) ) ( not ( = ?auto_7975 ?auto_7981 ) ) ( not ( = ?auto_7975 ?auto_7991 ) ) ( not ( = ?auto_7976 ?auto_7981 ) ) ( not ( = ?auto_7976 ?auto_7991 ) ) ( not ( = ?auto_7977 ?auto_7981 ) ) ( not ( = ?auto_7977 ?auto_7991 ) ) ( not ( = ?auto_7978 ?auto_7981 ) ) ( not ( = ?auto_7978 ?auto_7991 ) ) ( not ( = ?auto_7981 ?auto_7996 ) ) ( not ( = ?auto_7981 ?auto_7992 ) ) ( not ( = ?auto_7981 ?auto_7989 ) ) ( not ( = ?auto_7981 ?auto_7990 ) ) ( not ( = ?auto_7981 ?auto_7997 ) ) ( not ( = ?auto_7991 ?auto_7996 ) ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( not ( = ?auto_7991 ?auto_7989 ) ) ( not ( = ?auto_7991 ?auto_7990 ) ) ( not ( = ?auto_7991 ?auto_7997 ) ) ( not ( = ?auto_7974 ?auto_7980 ) ) ( not ( = ?auto_7974 ?auto_7986 ) ) ( not ( = ?auto_7975 ?auto_7980 ) ) ( not ( = ?auto_7975 ?auto_7986 ) ) ( not ( = ?auto_7976 ?auto_7980 ) ) ( not ( = ?auto_7976 ?auto_7986 ) ) ( not ( = ?auto_7977 ?auto_7980 ) ) ( not ( = ?auto_7977 ?auto_7986 ) ) ( not ( = ?auto_7978 ?auto_7980 ) ) ( not ( = ?auto_7978 ?auto_7986 ) ) ( not ( = ?auto_7979 ?auto_7980 ) ) ( not ( = ?auto_7979 ?auto_7986 ) ) ( not ( = ?auto_7980 ?auto_7991 ) ) ( not ( = ?auto_7980 ?auto_7996 ) ) ( not ( = ?auto_7980 ?auto_7992 ) ) ( not ( = ?auto_7980 ?auto_7989 ) ) ( not ( = ?auto_7980 ?auto_7990 ) ) ( not ( = ?auto_7980 ?auto_7997 ) ) ( not ( = ?auto_7986 ?auto_7991 ) ) ( not ( = ?auto_7986 ?auto_7996 ) ) ( not ( = ?auto_7986 ?auto_7992 ) ) ( not ( = ?auto_7986 ?auto_7989 ) ) ( not ( = ?auto_7986 ?auto_7990 ) ) ( not ( = ?auto_7986 ?auto_7997 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7979 ?auto_7981 )
      ( MAKE-1CRATE ?auto_7981 ?auto_7980 )
      ( MAKE-7CRATE-VERIFY ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7979 ?auto_7981 ?auto_7980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8000 - SURFACE
      ?auto_8001 - SURFACE
    )
    :vars
    (
      ?auto_8002 - HOIST
      ?auto_8003 - PLACE
      ?auto_8005 - PLACE
      ?auto_8006 - HOIST
      ?auto_8007 - SURFACE
      ?auto_8004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8002 ?auto_8003 ) ( SURFACE-AT ?auto_8000 ?auto_8003 ) ( CLEAR ?auto_8000 ) ( IS-CRATE ?auto_8001 ) ( AVAILABLE ?auto_8002 ) ( not ( = ?auto_8005 ?auto_8003 ) ) ( HOIST-AT ?auto_8006 ?auto_8005 ) ( AVAILABLE ?auto_8006 ) ( SURFACE-AT ?auto_8001 ?auto_8005 ) ( ON ?auto_8001 ?auto_8007 ) ( CLEAR ?auto_8001 ) ( TRUCK-AT ?auto_8004 ?auto_8003 ) ( not ( = ?auto_8000 ?auto_8001 ) ) ( not ( = ?auto_8000 ?auto_8007 ) ) ( not ( = ?auto_8001 ?auto_8007 ) ) ( not ( = ?auto_8002 ?auto_8006 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8004 ?auto_8003 ?auto_8005 )
      ( !LIFT ?auto_8006 ?auto_8001 ?auto_8007 ?auto_8005 )
      ( !LOAD ?auto_8006 ?auto_8001 ?auto_8004 ?auto_8005 )
      ( !DRIVE ?auto_8004 ?auto_8005 ?auto_8003 )
      ( !UNLOAD ?auto_8002 ?auto_8001 ?auto_8004 ?auto_8003 )
      ( !DROP ?auto_8002 ?auto_8001 ?auto_8000 ?auto_8003 )
      ( MAKE-1CRATE-VERIFY ?auto_8000 ?auto_8001 ) )
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
      ?auto_8025 - SURFACE
      ?auto_8024 - SURFACE
      ?auto_8023 - SURFACE
    )
    :vars
    (
      ?auto_8031 - HOIST
      ?auto_8030 - PLACE
      ?auto_8026 - PLACE
      ?auto_8027 - HOIST
      ?auto_8028 - SURFACE
      ?auto_8034 - PLACE
      ?auto_8033 - HOIST
      ?auto_8035 - SURFACE
      ?auto_8040 - SURFACE
      ?auto_8036 - PLACE
      ?auto_8042 - HOIST
      ?auto_8032 - SURFACE
      ?auto_8043 - PLACE
      ?auto_8037 - HOIST
      ?auto_8044 - SURFACE
      ?auto_8039 - SURFACE
      ?auto_8038 - SURFACE
      ?auto_8041 - SURFACE
      ?auto_8029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8031 ?auto_8030 ) ( IS-CRATE ?auto_8023 ) ( not ( = ?auto_8026 ?auto_8030 ) ) ( HOIST-AT ?auto_8027 ?auto_8026 ) ( AVAILABLE ?auto_8027 ) ( SURFACE-AT ?auto_8023 ?auto_8026 ) ( ON ?auto_8023 ?auto_8028 ) ( CLEAR ?auto_8023 ) ( not ( = ?auto_8024 ?auto_8023 ) ) ( not ( = ?auto_8024 ?auto_8028 ) ) ( not ( = ?auto_8023 ?auto_8028 ) ) ( not ( = ?auto_8031 ?auto_8027 ) ) ( IS-CRATE ?auto_8024 ) ( not ( = ?auto_8034 ?auto_8030 ) ) ( HOIST-AT ?auto_8033 ?auto_8034 ) ( SURFACE-AT ?auto_8024 ?auto_8034 ) ( ON ?auto_8024 ?auto_8035 ) ( CLEAR ?auto_8024 ) ( not ( = ?auto_8025 ?auto_8024 ) ) ( not ( = ?auto_8025 ?auto_8035 ) ) ( not ( = ?auto_8024 ?auto_8035 ) ) ( not ( = ?auto_8031 ?auto_8033 ) ) ( IS-CRATE ?auto_8025 ) ( SURFACE-AT ?auto_8025 ?auto_8034 ) ( ON ?auto_8025 ?auto_8040 ) ( CLEAR ?auto_8025 ) ( not ( = ?auto_8022 ?auto_8025 ) ) ( not ( = ?auto_8022 ?auto_8040 ) ) ( not ( = ?auto_8025 ?auto_8040 ) ) ( IS-CRATE ?auto_8022 ) ( not ( = ?auto_8036 ?auto_8030 ) ) ( HOIST-AT ?auto_8042 ?auto_8036 ) ( SURFACE-AT ?auto_8022 ?auto_8036 ) ( ON ?auto_8022 ?auto_8032 ) ( CLEAR ?auto_8022 ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( not ( = ?auto_8021 ?auto_8032 ) ) ( not ( = ?auto_8022 ?auto_8032 ) ) ( not ( = ?auto_8031 ?auto_8042 ) ) ( IS-CRATE ?auto_8021 ) ( not ( = ?auto_8043 ?auto_8030 ) ) ( HOIST-AT ?auto_8037 ?auto_8043 ) ( AVAILABLE ?auto_8037 ) ( SURFACE-AT ?auto_8021 ?auto_8043 ) ( ON ?auto_8021 ?auto_8044 ) ( CLEAR ?auto_8021 ) ( not ( = ?auto_8020 ?auto_8021 ) ) ( not ( = ?auto_8020 ?auto_8044 ) ) ( not ( = ?auto_8021 ?auto_8044 ) ) ( not ( = ?auto_8031 ?auto_8037 ) ) ( IS-CRATE ?auto_8020 ) ( SURFACE-AT ?auto_8020 ?auto_8036 ) ( ON ?auto_8020 ?auto_8039 ) ( CLEAR ?auto_8020 ) ( not ( = ?auto_8019 ?auto_8020 ) ) ( not ( = ?auto_8019 ?auto_8039 ) ) ( not ( = ?auto_8020 ?auto_8039 ) ) ( IS-CRATE ?auto_8019 ) ( AVAILABLE ?auto_8033 ) ( SURFACE-AT ?auto_8019 ?auto_8034 ) ( ON ?auto_8019 ?auto_8038 ) ( CLEAR ?auto_8019 ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( not ( = ?auto_8018 ?auto_8038 ) ) ( not ( = ?auto_8019 ?auto_8038 ) ) ( SURFACE-AT ?auto_8017 ?auto_8030 ) ( CLEAR ?auto_8017 ) ( IS-CRATE ?auto_8018 ) ( AVAILABLE ?auto_8031 ) ( AVAILABLE ?auto_8042 ) ( SURFACE-AT ?auto_8018 ?auto_8036 ) ( ON ?auto_8018 ?auto_8041 ) ( CLEAR ?auto_8018 ) ( TRUCK-AT ?auto_8029 ?auto_8030 ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8041 ) ) ( not ( = ?auto_8018 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8019 ) ) ( not ( = ?auto_8017 ?auto_8038 ) ) ( not ( = ?auto_8019 ?auto_8041 ) ) ( not ( = ?auto_8034 ?auto_8036 ) ) ( not ( = ?auto_8033 ?auto_8042 ) ) ( not ( = ?auto_8038 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8020 ) ) ( not ( = ?auto_8017 ?auto_8039 ) ) ( not ( = ?auto_8018 ?auto_8020 ) ) ( not ( = ?auto_8018 ?auto_8039 ) ) ( not ( = ?auto_8020 ?auto_8038 ) ) ( not ( = ?auto_8020 ?auto_8041 ) ) ( not ( = ?auto_8039 ?auto_8038 ) ) ( not ( = ?auto_8039 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8021 ) ) ( not ( = ?auto_8017 ?auto_8044 ) ) ( not ( = ?auto_8018 ?auto_8021 ) ) ( not ( = ?auto_8018 ?auto_8044 ) ) ( not ( = ?auto_8019 ?auto_8021 ) ) ( not ( = ?auto_8019 ?auto_8044 ) ) ( not ( = ?auto_8021 ?auto_8039 ) ) ( not ( = ?auto_8021 ?auto_8038 ) ) ( not ( = ?auto_8021 ?auto_8041 ) ) ( not ( = ?auto_8043 ?auto_8036 ) ) ( not ( = ?auto_8043 ?auto_8034 ) ) ( not ( = ?auto_8037 ?auto_8042 ) ) ( not ( = ?auto_8037 ?auto_8033 ) ) ( not ( = ?auto_8044 ?auto_8039 ) ) ( not ( = ?auto_8044 ?auto_8038 ) ) ( not ( = ?auto_8044 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8022 ) ) ( not ( = ?auto_8017 ?auto_8032 ) ) ( not ( = ?auto_8018 ?auto_8022 ) ) ( not ( = ?auto_8018 ?auto_8032 ) ) ( not ( = ?auto_8019 ?auto_8022 ) ) ( not ( = ?auto_8019 ?auto_8032 ) ) ( not ( = ?auto_8020 ?auto_8022 ) ) ( not ( = ?auto_8020 ?auto_8032 ) ) ( not ( = ?auto_8022 ?auto_8044 ) ) ( not ( = ?auto_8022 ?auto_8039 ) ) ( not ( = ?auto_8022 ?auto_8038 ) ) ( not ( = ?auto_8022 ?auto_8041 ) ) ( not ( = ?auto_8032 ?auto_8044 ) ) ( not ( = ?auto_8032 ?auto_8039 ) ) ( not ( = ?auto_8032 ?auto_8038 ) ) ( not ( = ?auto_8032 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8025 ) ) ( not ( = ?auto_8017 ?auto_8040 ) ) ( not ( = ?auto_8018 ?auto_8025 ) ) ( not ( = ?auto_8018 ?auto_8040 ) ) ( not ( = ?auto_8019 ?auto_8025 ) ) ( not ( = ?auto_8019 ?auto_8040 ) ) ( not ( = ?auto_8020 ?auto_8025 ) ) ( not ( = ?auto_8020 ?auto_8040 ) ) ( not ( = ?auto_8021 ?auto_8025 ) ) ( not ( = ?auto_8021 ?auto_8040 ) ) ( not ( = ?auto_8025 ?auto_8032 ) ) ( not ( = ?auto_8025 ?auto_8044 ) ) ( not ( = ?auto_8025 ?auto_8039 ) ) ( not ( = ?auto_8025 ?auto_8038 ) ) ( not ( = ?auto_8025 ?auto_8041 ) ) ( not ( = ?auto_8040 ?auto_8032 ) ) ( not ( = ?auto_8040 ?auto_8044 ) ) ( not ( = ?auto_8040 ?auto_8039 ) ) ( not ( = ?auto_8040 ?auto_8038 ) ) ( not ( = ?auto_8040 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8024 ) ) ( not ( = ?auto_8017 ?auto_8035 ) ) ( not ( = ?auto_8018 ?auto_8024 ) ) ( not ( = ?auto_8018 ?auto_8035 ) ) ( not ( = ?auto_8019 ?auto_8024 ) ) ( not ( = ?auto_8019 ?auto_8035 ) ) ( not ( = ?auto_8020 ?auto_8024 ) ) ( not ( = ?auto_8020 ?auto_8035 ) ) ( not ( = ?auto_8021 ?auto_8024 ) ) ( not ( = ?auto_8021 ?auto_8035 ) ) ( not ( = ?auto_8022 ?auto_8024 ) ) ( not ( = ?auto_8022 ?auto_8035 ) ) ( not ( = ?auto_8024 ?auto_8040 ) ) ( not ( = ?auto_8024 ?auto_8032 ) ) ( not ( = ?auto_8024 ?auto_8044 ) ) ( not ( = ?auto_8024 ?auto_8039 ) ) ( not ( = ?auto_8024 ?auto_8038 ) ) ( not ( = ?auto_8024 ?auto_8041 ) ) ( not ( = ?auto_8035 ?auto_8040 ) ) ( not ( = ?auto_8035 ?auto_8032 ) ) ( not ( = ?auto_8035 ?auto_8044 ) ) ( not ( = ?auto_8035 ?auto_8039 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8035 ?auto_8041 ) ) ( not ( = ?auto_8017 ?auto_8023 ) ) ( not ( = ?auto_8017 ?auto_8028 ) ) ( not ( = ?auto_8018 ?auto_8023 ) ) ( not ( = ?auto_8018 ?auto_8028 ) ) ( not ( = ?auto_8019 ?auto_8023 ) ) ( not ( = ?auto_8019 ?auto_8028 ) ) ( not ( = ?auto_8020 ?auto_8023 ) ) ( not ( = ?auto_8020 ?auto_8028 ) ) ( not ( = ?auto_8021 ?auto_8023 ) ) ( not ( = ?auto_8021 ?auto_8028 ) ) ( not ( = ?auto_8022 ?auto_8023 ) ) ( not ( = ?auto_8022 ?auto_8028 ) ) ( not ( = ?auto_8025 ?auto_8023 ) ) ( not ( = ?auto_8025 ?auto_8028 ) ) ( not ( = ?auto_8023 ?auto_8035 ) ) ( not ( = ?auto_8023 ?auto_8040 ) ) ( not ( = ?auto_8023 ?auto_8032 ) ) ( not ( = ?auto_8023 ?auto_8044 ) ) ( not ( = ?auto_8023 ?auto_8039 ) ) ( not ( = ?auto_8023 ?auto_8038 ) ) ( not ( = ?auto_8023 ?auto_8041 ) ) ( not ( = ?auto_8026 ?auto_8034 ) ) ( not ( = ?auto_8026 ?auto_8036 ) ) ( not ( = ?auto_8026 ?auto_8043 ) ) ( not ( = ?auto_8027 ?auto_8033 ) ) ( not ( = ?auto_8027 ?auto_8042 ) ) ( not ( = ?auto_8027 ?auto_8037 ) ) ( not ( = ?auto_8028 ?auto_8035 ) ) ( not ( = ?auto_8028 ?auto_8040 ) ) ( not ( = ?auto_8028 ?auto_8032 ) ) ( not ( = ?auto_8028 ?auto_8044 ) ) ( not ( = ?auto_8028 ?auto_8039 ) ) ( not ( = ?auto_8028 ?auto_8038 ) ) ( not ( = ?auto_8028 ?auto_8041 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8017 ?auto_8018 ?auto_8019 ?auto_8020 ?auto_8021 ?auto_8022 ?auto_8025 ?auto_8024 )
      ( MAKE-1CRATE ?auto_8024 ?auto_8023 )
      ( MAKE-8CRATE-VERIFY ?auto_8017 ?auto_8018 ?auto_8019 ?auto_8020 ?auto_8021 ?auto_8022 ?auto_8025 ?auto_8024 ?auto_8023 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8047 - SURFACE
      ?auto_8048 - SURFACE
    )
    :vars
    (
      ?auto_8049 - HOIST
      ?auto_8050 - PLACE
      ?auto_8052 - PLACE
      ?auto_8053 - HOIST
      ?auto_8054 - SURFACE
      ?auto_8051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8049 ?auto_8050 ) ( SURFACE-AT ?auto_8047 ?auto_8050 ) ( CLEAR ?auto_8047 ) ( IS-CRATE ?auto_8048 ) ( AVAILABLE ?auto_8049 ) ( not ( = ?auto_8052 ?auto_8050 ) ) ( HOIST-AT ?auto_8053 ?auto_8052 ) ( AVAILABLE ?auto_8053 ) ( SURFACE-AT ?auto_8048 ?auto_8052 ) ( ON ?auto_8048 ?auto_8054 ) ( CLEAR ?auto_8048 ) ( TRUCK-AT ?auto_8051 ?auto_8050 ) ( not ( = ?auto_8047 ?auto_8048 ) ) ( not ( = ?auto_8047 ?auto_8054 ) ) ( not ( = ?auto_8048 ?auto_8054 ) ) ( not ( = ?auto_8049 ?auto_8053 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8051 ?auto_8050 ?auto_8052 )
      ( !LIFT ?auto_8053 ?auto_8048 ?auto_8054 ?auto_8052 )
      ( !LOAD ?auto_8053 ?auto_8048 ?auto_8051 ?auto_8052 )
      ( !DRIVE ?auto_8051 ?auto_8052 ?auto_8050 )
      ( !UNLOAD ?auto_8049 ?auto_8048 ?auto_8051 ?auto_8050 )
      ( !DROP ?auto_8049 ?auto_8048 ?auto_8047 ?auto_8050 )
      ( MAKE-1CRATE-VERIFY ?auto_8047 ?auto_8048 ) )
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
      ?auto_8073 - SURFACE
      ?auto_8072 - SURFACE
      ?auto_8071 - SURFACE
      ?auto_8074 - SURFACE
    )
    :vars
    (
      ?auto_8078 - HOIST
      ?auto_8079 - PLACE
      ?auto_8080 - PLACE
      ?auto_8077 - HOIST
      ?auto_8076 - SURFACE
      ?auto_8096 - PLACE
      ?auto_8081 - HOIST
      ?auto_8085 - SURFACE
      ?auto_8084 - PLACE
      ?auto_8083 - HOIST
      ?auto_8082 - SURFACE
      ?auto_8087 - SURFACE
      ?auto_8095 - PLACE
      ?auto_8090 - HOIST
      ?auto_8086 - SURFACE
      ?auto_8089 - PLACE
      ?auto_8094 - HOIST
      ?auto_8091 - SURFACE
      ?auto_8092 - SURFACE
      ?auto_8093 - SURFACE
      ?auto_8088 - SURFACE
      ?auto_8075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8078 ?auto_8079 ) ( IS-CRATE ?auto_8074 ) ( not ( = ?auto_8080 ?auto_8079 ) ) ( HOIST-AT ?auto_8077 ?auto_8080 ) ( AVAILABLE ?auto_8077 ) ( SURFACE-AT ?auto_8074 ?auto_8080 ) ( ON ?auto_8074 ?auto_8076 ) ( CLEAR ?auto_8074 ) ( not ( = ?auto_8071 ?auto_8074 ) ) ( not ( = ?auto_8071 ?auto_8076 ) ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( not ( = ?auto_8078 ?auto_8077 ) ) ( IS-CRATE ?auto_8071 ) ( not ( = ?auto_8096 ?auto_8079 ) ) ( HOIST-AT ?auto_8081 ?auto_8096 ) ( AVAILABLE ?auto_8081 ) ( SURFACE-AT ?auto_8071 ?auto_8096 ) ( ON ?auto_8071 ?auto_8085 ) ( CLEAR ?auto_8071 ) ( not ( = ?auto_8072 ?auto_8071 ) ) ( not ( = ?auto_8072 ?auto_8085 ) ) ( not ( = ?auto_8071 ?auto_8085 ) ) ( not ( = ?auto_8078 ?auto_8081 ) ) ( IS-CRATE ?auto_8072 ) ( not ( = ?auto_8084 ?auto_8079 ) ) ( HOIST-AT ?auto_8083 ?auto_8084 ) ( SURFACE-AT ?auto_8072 ?auto_8084 ) ( ON ?auto_8072 ?auto_8082 ) ( CLEAR ?auto_8072 ) ( not ( = ?auto_8073 ?auto_8072 ) ) ( not ( = ?auto_8073 ?auto_8082 ) ) ( not ( = ?auto_8072 ?auto_8082 ) ) ( not ( = ?auto_8078 ?auto_8083 ) ) ( IS-CRATE ?auto_8073 ) ( SURFACE-AT ?auto_8073 ?auto_8084 ) ( ON ?auto_8073 ?auto_8087 ) ( CLEAR ?auto_8073 ) ( not ( = ?auto_8070 ?auto_8073 ) ) ( not ( = ?auto_8070 ?auto_8087 ) ) ( not ( = ?auto_8073 ?auto_8087 ) ) ( IS-CRATE ?auto_8070 ) ( not ( = ?auto_8095 ?auto_8079 ) ) ( HOIST-AT ?auto_8090 ?auto_8095 ) ( SURFACE-AT ?auto_8070 ?auto_8095 ) ( ON ?auto_8070 ?auto_8086 ) ( CLEAR ?auto_8070 ) ( not ( = ?auto_8069 ?auto_8070 ) ) ( not ( = ?auto_8069 ?auto_8086 ) ) ( not ( = ?auto_8070 ?auto_8086 ) ) ( not ( = ?auto_8078 ?auto_8090 ) ) ( IS-CRATE ?auto_8069 ) ( not ( = ?auto_8089 ?auto_8079 ) ) ( HOIST-AT ?auto_8094 ?auto_8089 ) ( AVAILABLE ?auto_8094 ) ( SURFACE-AT ?auto_8069 ?auto_8089 ) ( ON ?auto_8069 ?auto_8091 ) ( CLEAR ?auto_8069 ) ( not ( = ?auto_8068 ?auto_8069 ) ) ( not ( = ?auto_8068 ?auto_8091 ) ) ( not ( = ?auto_8069 ?auto_8091 ) ) ( not ( = ?auto_8078 ?auto_8094 ) ) ( IS-CRATE ?auto_8068 ) ( SURFACE-AT ?auto_8068 ?auto_8095 ) ( ON ?auto_8068 ?auto_8092 ) ( CLEAR ?auto_8068 ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8092 ) ) ( not ( = ?auto_8068 ?auto_8092 ) ) ( IS-CRATE ?auto_8067 ) ( AVAILABLE ?auto_8083 ) ( SURFACE-AT ?auto_8067 ?auto_8084 ) ( ON ?auto_8067 ?auto_8093 ) ( CLEAR ?auto_8067 ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8066 ?auto_8093 ) ) ( not ( = ?auto_8067 ?auto_8093 ) ) ( SURFACE-AT ?auto_8065 ?auto_8079 ) ( CLEAR ?auto_8065 ) ( IS-CRATE ?auto_8066 ) ( AVAILABLE ?auto_8078 ) ( AVAILABLE ?auto_8090 ) ( SURFACE-AT ?auto_8066 ?auto_8095 ) ( ON ?auto_8066 ?auto_8088 ) ( CLEAR ?auto_8066 ) ( TRUCK-AT ?auto_8075 ?auto_8079 ) ( not ( = ?auto_8065 ?auto_8066 ) ) ( not ( = ?auto_8065 ?auto_8088 ) ) ( not ( = ?auto_8066 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8067 ) ) ( not ( = ?auto_8065 ?auto_8093 ) ) ( not ( = ?auto_8067 ?auto_8088 ) ) ( not ( = ?auto_8084 ?auto_8095 ) ) ( not ( = ?auto_8083 ?auto_8090 ) ) ( not ( = ?auto_8093 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8068 ) ) ( not ( = ?auto_8065 ?auto_8092 ) ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( not ( = ?auto_8066 ?auto_8092 ) ) ( not ( = ?auto_8068 ?auto_8093 ) ) ( not ( = ?auto_8068 ?auto_8088 ) ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8092 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8069 ) ) ( not ( = ?auto_8065 ?auto_8091 ) ) ( not ( = ?auto_8066 ?auto_8069 ) ) ( not ( = ?auto_8066 ?auto_8091 ) ) ( not ( = ?auto_8067 ?auto_8069 ) ) ( not ( = ?auto_8067 ?auto_8091 ) ) ( not ( = ?auto_8069 ?auto_8092 ) ) ( not ( = ?auto_8069 ?auto_8093 ) ) ( not ( = ?auto_8069 ?auto_8088 ) ) ( not ( = ?auto_8089 ?auto_8095 ) ) ( not ( = ?auto_8089 ?auto_8084 ) ) ( not ( = ?auto_8094 ?auto_8090 ) ) ( not ( = ?auto_8094 ?auto_8083 ) ) ( not ( = ?auto_8091 ?auto_8092 ) ) ( not ( = ?auto_8091 ?auto_8093 ) ) ( not ( = ?auto_8091 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8070 ) ) ( not ( = ?auto_8065 ?auto_8086 ) ) ( not ( = ?auto_8066 ?auto_8070 ) ) ( not ( = ?auto_8066 ?auto_8086 ) ) ( not ( = ?auto_8067 ?auto_8070 ) ) ( not ( = ?auto_8067 ?auto_8086 ) ) ( not ( = ?auto_8068 ?auto_8070 ) ) ( not ( = ?auto_8068 ?auto_8086 ) ) ( not ( = ?auto_8070 ?auto_8091 ) ) ( not ( = ?auto_8070 ?auto_8092 ) ) ( not ( = ?auto_8070 ?auto_8093 ) ) ( not ( = ?auto_8070 ?auto_8088 ) ) ( not ( = ?auto_8086 ?auto_8091 ) ) ( not ( = ?auto_8086 ?auto_8092 ) ) ( not ( = ?auto_8086 ?auto_8093 ) ) ( not ( = ?auto_8086 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8073 ) ) ( not ( = ?auto_8065 ?auto_8087 ) ) ( not ( = ?auto_8066 ?auto_8073 ) ) ( not ( = ?auto_8066 ?auto_8087 ) ) ( not ( = ?auto_8067 ?auto_8073 ) ) ( not ( = ?auto_8067 ?auto_8087 ) ) ( not ( = ?auto_8068 ?auto_8073 ) ) ( not ( = ?auto_8068 ?auto_8087 ) ) ( not ( = ?auto_8069 ?auto_8073 ) ) ( not ( = ?auto_8069 ?auto_8087 ) ) ( not ( = ?auto_8073 ?auto_8086 ) ) ( not ( = ?auto_8073 ?auto_8091 ) ) ( not ( = ?auto_8073 ?auto_8092 ) ) ( not ( = ?auto_8073 ?auto_8093 ) ) ( not ( = ?auto_8073 ?auto_8088 ) ) ( not ( = ?auto_8087 ?auto_8086 ) ) ( not ( = ?auto_8087 ?auto_8091 ) ) ( not ( = ?auto_8087 ?auto_8092 ) ) ( not ( = ?auto_8087 ?auto_8093 ) ) ( not ( = ?auto_8087 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8072 ) ) ( not ( = ?auto_8065 ?auto_8082 ) ) ( not ( = ?auto_8066 ?auto_8072 ) ) ( not ( = ?auto_8066 ?auto_8082 ) ) ( not ( = ?auto_8067 ?auto_8072 ) ) ( not ( = ?auto_8067 ?auto_8082 ) ) ( not ( = ?auto_8068 ?auto_8072 ) ) ( not ( = ?auto_8068 ?auto_8082 ) ) ( not ( = ?auto_8069 ?auto_8072 ) ) ( not ( = ?auto_8069 ?auto_8082 ) ) ( not ( = ?auto_8070 ?auto_8072 ) ) ( not ( = ?auto_8070 ?auto_8082 ) ) ( not ( = ?auto_8072 ?auto_8087 ) ) ( not ( = ?auto_8072 ?auto_8086 ) ) ( not ( = ?auto_8072 ?auto_8091 ) ) ( not ( = ?auto_8072 ?auto_8092 ) ) ( not ( = ?auto_8072 ?auto_8093 ) ) ( not ( = ?auto_8072 ?auto_8088 ) ) ( not ( = ?auto_8082 ?auto_8087 ) ) ( not ( = ?auto_8082 ?auto_8086 ) ) ( not ( = ?auto_8082 ?auto_8091 ) ) ( not ( = ?auto_8082 ?auto_8092 ) ) ( not ( = ?auto_8082 ?auto_8093 ) ) ( not ( = ?auto_8082 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8071 ) ) ( not ( = ?auto_8065 ?auto_8085 ) ) ( not ( = ?auto_8066 ?auto_8071 ) ) ( not ( = ?auto_8066 ?auto_8085 ) ) ( not ( = ?auto_8067 ?auto_8071 ) ) ( not ( = ?auto_8067 ?auto_8085 ) ) ( not ( = ?auto_8068 ?auto_8071 ) ) ( not ( = ?auto_8068 ?auto_8085 ) ) ( not ( = ?auto_8069 ?auto_8071 ) ) ( not ( = ?auto_8069 ?auto_8085 ) ) ( not ( = ?auto_8070 ?auto_8071 ) ) ( not ( = ?auto_8070 ?auto_8085 ) ) ( not ( = ?auto_8073 ?auto_8071 ) ) ( not ( = ?auto_8073 ?auto_8085 ) ) ( not ( = ?auto_8071 ?auto_8082 ) ) ( not ( = ?auto_8071 ?auto_8087 ) ) ( not ( = ?auto_8071 ?auto_8086 ) ) ( not ( = ?auto_8071 ?auto_8091 ) ) ( not ( = ?auto_8071 ?auto_8092 ) ) ( not ( = ?auto_8071 ?auto_8093 ) ) ( not ( = ?auto_8071 ?auto_8088 ) ) ( not ( = ?auto_8096 ?auto_8084 ) ) ( not ( = ?auto_8096 ?auto_8095 ) ) ( not ( = ?auto_8096 ?auto_8089 ) ) ( not ( = ?auto_8081 ?auto_8083 ) ) ( not ( = ?auto_8081 ?auto_8090 ) ) ( not ( = ?auto_8081 ?auto_8094 ) ) ( not ( = ?auto_8085 ?auto_8082 ) ) ( not ( = ?auto_8085 ?auto_8087 ) ) ( not ( = ?auto_8085 ?auto_8086 ) ) ( not ( = ?auto_8085 ?auto_8091 ) ) ( not ( = ?auto_8085 ?auto_8092 ) ) ( not ( = ?auto_8085 ?auto_8093 ) ) ( not ( = ?auto_8085 ?auto_8088 ) ) ( not ( = ?auto_8065 ?auto_8074 ) ) ( not ( = ?auto_8065 ?auto_8076 ) ) ( not ( = ?auto_8066 ?auto_8074 ) ) ( not ( = ?auto_8066 ?auto_8076 ) ) ( not ( = ?auto_8067 ?auto_8074 ) ) ( not ( = ?auto_8067 ?auto_8076 ) ) ( not ( = ?auto_8068 ?auto_8074 ) ) ( not ( = ?auto_8068 ?auto_8076 ) ) ( not ( = ?auto_8069 ?auto_8074 ) ) ( not ( = ?auto_8069 ?auto_8076 ) ) ( not ( = ?auto_8070 ?auto_8074 ) ) ( not ( = ?auto_8070 ?auto_8076 ) ) ( not ( = ?auto_8073 ?auto_8074 ) ) ( not ( = ?auto_8073 ?auto_8076 ) ) ( not ( = ?auto_8072 ?auto_8074 ) ) ( not ( = ?auto_8072 ?auto_8076 ) ) ( not ( = ?auto_8074 ?auto_8085 ) ) ( not ( = ?auto_8074 ?auto_8082 ) ) ( not ( = ?auto_8074 ?auto_8087 ) ) ( not ( = ?auto_8074 ?auto_8086 ) ) ( not ( = ?auto_8074 ?auto_8091 ) ) ( not ( = ?auto_8074 ?auto_8092 ) ) ( not ( = ?auto_8074 ?auto_8093 ) ) ( not ( = ?auto_8074 ?auto_8088 ) ) ( not ( = ?auto_8080 ?auto_8096 ) ) ( not ( = ?auto_8080 ?auto_8084 ) ) ( not ( = ?auto_8080 ?auto_8095 ) ) ( not ( = ?auto_8080 ?auto_8089 ) ) ( not ( = ?auto_8077 ?auto_8081 ) ) ( not ( = ?auto_8077 ?auto_8083 ) ) ( not ( = ?auto_8077 ?auto_8090 ) ) ( not ( = ?auto_8077 ?auto_8094 ) ) ( not ( = ?auto_8076 ?auto_8085 ) ) ( not ( = ?auto_8076 ?auto_8082 ) ) ( not ( = ?auto_8076 ?auto_8087 ) ) ( not ( = ?auto_8076 ?auto_8086 ) ) ( not ( = ?auto_8076 ?auto_8091 ) ) ( not ( = ?auto_8076 ?auto_8092 ) ) ( not ( = ?auto_8076 ?auto_8093 ) ) ( not ( = ?auto_8076 ?auto_8088 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8065 ?auto_8066 ?auto_8067 ?auto_8068 ?auto_8069 ?auto_8070 ?auto_8073 ?auto_8072 ?auto_8071 )
      ( MAKE-1CRATE ?auto_8071 ?auto_8074 )
      ( MAKE-9CRATE-VERIFY ?auto_8065 ?auto_8066 ?auto_8067 ?auto_8068 ?auto_8069 ?auto_8070 ?auto_8073 ?auto_8072 ?auto_8071 ?auto_8074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8099 - SURFACE
      ?auto_8100 - SURFACE
    )
    :vars
    (
      ?auto_8101 - HOIST
      ?auto_8102 - PLACE
      ?auto_8104 - PLACE
      ?auto_8105 - HOIST
      ?auto_8106 - SURFACE
      ?auto_8103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8101 ?auto_8102 ) ( SURFACE-AT ?auto_8099 ?auto_8102 ) ( CLEAR ?auto_8099 ) ( IS-CRATE ?auto_8100 ) ( AVAILABLE ?auto_8101 ) ( not ( = ?auto_8104 ?auto_8102 ) ) ( HOIST-AT ?auto_8105 ?auto_8104 ) ( AVAILABLE ?auto_8105 ) ( SURFACE-AT ?auto_8100 ?auto_8104 ) ( ON ?auto_8100 ?auto_8106 ) ( CLEAR ?auto_8100 ) ( TRUCK-AT ?auto_8103 ?auto_8102 ) ( not ( = ?auto_8099 ?auto_8100 ) ) ( not ( = ?auto_8099 ?auto_8106 ) ) ( not ( = ?auto_8100 ?auto_8106 ) ) ( not ( = ?auto_8101 ?auto_8105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8103 ?auto_8102 ?auto_8104 )
      ( !LIFT ?auto_8105 ?auto_8100 ?auto_8106 ?auto_8104 )
      ( !LOAD ?auto_8105 ?auto_8100 ?auto_8103 ?auto_8104 )
      ( !DRIVE ?auto_8103 ?auto_8104 ?auto_8102 )
      ( !UNLOAD ?auto_8101 ?auto_8100 ?auto_8103 ?auto_8102 )
      ( !DROP ?auto_8101 ?auto_8100 ?auto_8099 ?auto_8102 )
      ( MAKE-1CRATE-VERIFY ?auto_8099 ?auto_8100 ) )
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
      ?auto_8126 - SURFACE
      ?auto_8125 - SURFACE
      ?auto_8124 - SURFACE
      ?auto_8127 - SURFACE
      ?auto_8128 - SURFACE
    )
    :vars
    (
      ?auto_8132 - HOIST
      ?auto_8129 - PLACE
      ?auto_8134 - PLACE
      ?auto_8131 - HOIST
      ?auto_8130 - SURFACE
      ?auto_8146 - PLACE
      ?auto_8135 - HOIST
      ?auto_8147 - SURFACE
      ?auto_8149 - PLACE
      ?auto_8136 - HOIST
      ?auto_8152 - SURFACE
      ?auto_8137 - PLACE
      ?auto_8139 - HOIST
      ?auto_8140 - SURFACE
      ?auto_8153 - SURFACE
      ?auto_8138 - PLACE
      ?auto_8143 - HOIST
      ?auto_8151 - SURFACE
      ?auto_8142 - PLACE
      ?auto_8144 - HOIST
      ?auto_8141 - SURFACE
      ?auto_8148 - SURFACE
      ?auto_8150 - SURFACE
      ?auto_8145 - SURFACE
      ?auto_8133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8132 ?auto_8129 ) ( IS-CRATE ?auto_8128 ) ( not ( = ?auto_8134 ?auto_8129 ) ) ( HOIST-AT ?auto_8131 ?auto_8134 ) ( AVAILABLE ?auto_8131 ) ( SURFACE-AT ?auto_8128 ?auto_8134 ) ( ON ?auto_8128 ?auto_8130 ) ( CLEAR ?auto_8128 ) ( not ( = ?auto_8127 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( not ( = ?auto_8132 ?auto_8131 ) ) ( IS-CRATE ?auto_8127 ) ( not ( = ?auto_8146 ?auto_8129 ) ) ( HOIST-AT ?auto_8135 ?auto_8146 ) ( AVAILABLE ?auto_8135 ) ( SURFACE-AT ?auto_8127 ?auto_8146 ) ( ON ?auto_8127 ?auto_8147 ) ( CLEAR ?auto_8127 ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8147 ) ) ( not ( = ?auto_8127 ?auto_8147 ) ) ( not ( = ?auto_8132 ?auto_8135 ) ) ( IS-CRATE ?auto_8124 ) ( not ( = ?auto_8149 ?auto_8129 ) ) ( HOIST-AT ?auto_8136 ?auto_8149 ) ( AVAILABLE ?auto_8136 ) ( SURFACE-AT ?auto_8124 ?auto_8149 ) ( ON ?auto_8124 ?auto_8152 ) ( CLEAR ?auto_8124 ) ( not ( = ?auto_8125 ?auto_8124 ) ) ( not ( = ?auto_8125 ?auto_8152 ) ) ( not ( = ?auto_8124 ?auto_8152 ) ) ( not ( = ?auto_8132 ?auto_8136 ) ) ( IS-CRATE ?auto_8125 ) ( not ( = ?auto_8137 ?auto_8129 ) ) ( HOIST-AT ?auto_8139 ?auto_8137 ) ( SURFACE-AT ?auto_8125 ?auto_8137 ) ( ON ?auto_8125 ?auto_8140 ) ( CLEAR ?auto_8125 ) ( not ( = ?auto_8126 ?auto_8125 ) ) ( not ( = ?auto_8126 ?auto_8140 ) ) ( not ( = ?auto_8125 ?auto_8140 ) ) ( not ( = ?auto_8132 ?auto_8139 ) ) ( IS-CRATE ?auto_8126 ) ( SURFACE-AT ?auto_8126 ?auto_8137 ) ( ON ?auto_8126 ?auto_8153 ) ( CLEAR ?auto_8126 ) ( not ( = ?auto_8123 ?auto_8126 ) ) ( not ( = ?auto_8123 ?auto_8153 ) ) ( not ( = ?auto_8126 ?auto_8153 ) ) ( IS-CRATE ?auto_8123 ) ( not ( = ?auto_8138 ?auto_8129 ) ) ( HOIST-AT ?auto_8143 ?auto_8138 ) ( SURFACE-AT ?auto_8123 ?auto_8138 ) ( ON ?auto_8123 ?auto_8151 ) ( CLEAR ?auto_8123 ) ( not ( = ?auto_8122 ?auto_8123 ) ) ( not ( = ?auto_8122 ?auto_8151 ) ) ( not ( = ?auto_8123 ?auto_8151 ) ) ( not ( = ?auto_8132 ?auto_8143 ) ) ( IS-CRATE ?auto_8122 ) ( not ( = ?auto_8142 ?auto_8129 ) ) ( HOIST-AT ?auto_8144 ?auto_8142 ) ( AVAILABLE ?auto_8144 ) ( SURFACE-AT ?auto_8122 ?auto_8142 ) ( ON ?auto_8122 ?auto_8141 ) ( CLEAR ?auto_8122 ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( not ( = ?auto_8121 ?auto_8141 ) ) ( not ( = ?auto_8122 ?auto_8141 ) ) ( not ( = ?auto_8132 ?auto_8144 ) ) ( IS-CRATE ?auto_8121 ) ( SURFACE-AT ?auto_8121 ?auto_8138 ) ( ON ?auto_8121 ?auto_8148 ) ( CLEAR ?auto_8121 ) ( not ( = ?auto_8120 ?auto_8121 ) ) ( not ( = ?auto_8120 ?auto_8148 ) ) ( not ( = ?auto_8121 ?auto_8148 ) ) ( IS-CRATE ?auto_8120 ) ( AVAILABLE ?auto_8139 ) ( SURFACE-AT ?auto_8120 ?auto_8137 ) ( ON ?auto_8120 ?auto_8150 ) ( CLEAR ?auto_8120 ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8150 ) ) ( not ( = ?auto_8120 ?auto_8150 ) ) ( SURFACE-AT ?auto_8118 ?auto_8129 ) ( CLEAR ?auto_8118 ) ( IS-CRATE ?auto_8119 ) ( AVAILABLE ?auto_8132 ) ( AVAILABLE ?auto_8143 ) ( SURFACE-AT ?auto_8119 ?auto_8138 ) ( ON ?auto_8119 ?auto_8145 ) ( CLEAR ?auto_8119 ) ( TRUCK-AT ?auto_8133 ?auto_8129 ) ( not ( = ?auto_8118 ?auto_8119 ) ) ( not ( = ?auto_8118 ?auto_8145 ) ) ( not ( = ?auto_8119 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8120 ) ) ( not ( = ?auto_8118 ?auto_8150 ) ) ( not ( = ?auto_8120 ?auto_8145 ) ) ( not ( = ?auto_8137 ?auto_8138 ) ) ( not ( = ?auto_8139 ?auto_8143 ) ) ( not ( = ?auto_8150 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8121 ) ) ( not ( = ?auto_8118 ?auto_8148 ) ) ( not ( = ?auto_8119 ?auto_8121 ) ) ( not ( = ?auto_8119 ?auto_8148 ) ) ( not ( = ?auto_8121 ?auto_8150 ) ) ( not ( = ?auto_8121 ?auto_8145 ) ) ( not ( = ?auto_8148 ?auto_8150 ) ) ( not ( = ?auto_8148 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8122 ) ) ( not ( = ?auto_8118 ?auto_8141 ) ) ( not ( = ?auto_8119 ?auto_8122 ) ) ( not ( = ?auto_8119 ?auto_8141 ) ) ( not ( = ?auto_8120 ?auto_8122 ) ) ( not ( = ?auto_8120 ?auto_8141 ) ) ( not ( = ?auto_8122 ?auto_8148 ) ) ( not ( = ?auto_8122 ?auto_8150 ) ) ( not ( = ?auto_8122 ?auto_8145 ) ) ( not ( = ?auto_8142 ?auto_8138 ) ) ( not ( = ?auto_8142 ?auto_8137 ) ) ( not ( = ?auto_8144 ?auto_8143 ) ) ( not ( = ?auto_8144 ?auto_8139 ) ) ( not ( = ?auto_8141 ?auto_8148 ) ) ( not ( = ?auto_8141 ?auto_8150 ) ) ( not ( = ?auto_8141 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8123 ) ) ( not ( = ?auto_8118 ?auto_8151 ) ) ( not ( = ?auto_8119 ?auto_8123 ) ) ( not ( = ?auto_8119 ?auto_8151 ) ) ( not ( = ?auto_8120 ?auto_8123 ) ) ( not ( = ?auto_8120 ?auto_8151 ) ) ( not ( = ?auto_8121 ?auto_8123 ) ) ( not ( = ?auto_8121 ?auto_8151 ) ) ( not ( = ?auto_8123 ?auto_8141 ) ) ( not ( = ?auto_8123 ?auto_8148 ) ) ( not ( = ?auto_8123 ?auto_8150 ) ) ( not ( = ?auto_8123 ?auto_8145 ) ) ( not ( = ?auto_8151 ?auto_8141 ) ) ( not ( = ?auto_8151 ?auto_8148 ) ) ( not ( = ?auto_8151 ?auto_8150 ) ) ( not ( = ?auto_8151 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8126 ) ) ( not ( = ?auto_8118 ?auto_8153 ) ) ( not ( = ?auto_8119 ?auto_8126 ) ) ( not ( = ?auto_8119 ?auto_8153 ) ) ( not ( = ?auto_8120 ?auto_8126 ) ) ( not ( = ?auto_8120 ?auto_8153 ) ) ( not ( = ?auto_8121 ?auto_8126 ) ) ( not ( = ?auto_8121 ?auto_8153 ) ) ( not ( = ?auto_8122 ?auto_8126 ) ) ( not ( = ?auto_8122 ?auto_8153 ) ) ( not ( = ?auto_8126 ?auto_8151 ) ) ( not ( = ?auto_8126 ?auto_8141 ) ) ( not ( = ?auto_8126 ?auto_8148 ) ) ( not ( = ?auto_8126 ?auto_8150 ) ) ( not ( = ?auto_8126 ?auto_8145 ) ) ( not ( = ?auto_8153 ?auto_8151 ) ) ( not ( = ?auto_8153 ?auto_8141 ) ) ( not ( = ?auto_8153 ?auto_8148 ) ) ( not ( = ?auto_8153 ?auto_8150 ) ) ( not ( = ?auto_8153 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8125 ) ) ( not ( = ?auto_8118 ?auto_8140 ) ) ( not ( = ?auto_8119 ?auto_8125 ) ) ( not ( = ?auto_8119 ?auto_8140 ) ) ( not ( = ?auto_8120 ?auto_8125 ) ) ( not ( = ?auto_8120 ?auto_8140 ) ) ( not ( = ?auto_8121 ?auto_8125 ) ) ( not ( = ?auto_8121 ?auto_8140 ) ) ( not ( = ?auto_8122 ?auto_8125 ) ) ( not ( = ?auto_8122 ?auto_8140 ) ) ( not ( = ?auto_8123 ?auto_8125 ) ) ( not ( = ?auto_8123 ?auto_8140 ) ) ( not ( = ?auto_8125 ?auto_8153 ) ) ( not ( = ?auto_8125 ?auto_8151 ) ) ( not ( = ?auto_8125 ?auto_8141 ) ) ( not ( = ?auto_8125 ?auto_8148 ) ) ( not ( = ?auto_8125 ?auto_8150 ) ) ( not ( = ?auto_8125 ?auto_8145 ) ) ( not ( = ?auto_8140 ?auto_8153 ) ) ( not ( = ?auto_8140 ?auto_8151 ) ) ( not ( = ?auto_8140 ?auto_8141 ) ) ( not ( = ?auto_8140 ?auto_8148 ) ) ( not ( = ?auto_8140 ?auto_8150 ) ) ( not ( = ?auto_8140 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8124 ) ) ( not ( = ?auto_8118 ?auto_8152 ) ) ( not ( = ?auto_8119 ?auto_8124 ) ) ( not ( = ?auto_8119 ?auto_8152 ) ) ( not ( = ?auto_8120 ?auto_8124 ) ) ( not ( = ?auto_8120 ?auto_8152 ) ) ( not ( = ?auto_8121 ?auto_8124 ) ) ( not ( = ?auto_8121 ?auto_8152 ) ) ( not ( = ?auto_8122 ?auto_8124 ) ) ( not ( = ?auto_8122 ?auto_8152 ) ) ( not ( = ?auto_8123 ?auto_8124 ) ) ( not ( = ?auto_8123 ?auto_8152 ) ) ( not ( = ?auto_8126 ?auto_8124 ) ) ( not ( = ?auto_8126 ?auto_8152 ) ) ( not ( = ?auto_8124 ?auto_8140 ) ) ( not ( = ?auto_8124 ?auto_8153 ) ) ( not ( = ?auto_8124 ?auto_8151 ) ) ( not ( = ?auto_8124 ?auto_8141 ) ) ( not ( = ?auto_8124 ?auto_8148 ) ) ( not ( = ?auto_8124 ?auto_8150 ) ) ( not ( = ?auto_8124 ?auto_8145 ) ) ( not ( = ?auto_8149 ?auto_8137 ) ) ( not ( = ?auto_8149 ?auto_8138 ) ) ( not ( = ?auto_8149 ?auto_8142 ) ) ( not ( = ?auto_8136 ?auto_8139 ) ) ( not ( = ?auto_8136 ?auto_8143 ) ) ( not ( = ?auto_8136 ?auto_8144 ) ) ( not ( = ?auto_8152 ?auto_8140 ) ) ( not ( = ?auto_8152 ?auto_8153 ) ) ( not ( = ?auto_8152 ?auto_8151 ) ) ( not ( = ?auto_8152 ?auto_8141 ) ) ( not ( = ?auto_8152 ?auto_8148 ) ) ( not ( = ?auto_8152 ?auto_8150 ) ) ( not ( = ?auto_8152 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8127 ) ) ( not ( = ?auto_8118 ?auto_8147 ) ) ( not ( = ?auto_8119 ?auto_8127 ) ) ( not ( = ?auto_8119 ?auto_8147 ) ) ( not ( = ?auto_8120 ?auto_8127 ) ) ( not ( = ?auto_8120 ?auto_8147 ) ) ( not ( = ?auto_8121 ?auto_8127 ) ) ( not ( = ?auto_8121 ?auto_8147 ) ) ( not ( = ?auto_8122 ?auto_8127 ) ) ( not ( = ?auto_8122 ?auto_8147 ) ) ( not ( = ?auto_8123 ?auto_8127 ) ) ( not ( = ?auto_8123 ?auto_8147 ) ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8126 ?auto_8147 ) ) ( not ( = ?auto_8125 ?auto_8127 ) ) ( not ( = ?auto_8125 ?auto_8147 ) ) ( not ( = ?auto_8127 ?auto_8152 ) ) ( not ( = ?auto_8127 ?auto_8140 ) ) ( not ( = ?auto_8127 ?auto_8153 ) ) ( not ( = ?auto_8127 ?auto_8151 ) ) ( not ( = ?auto_8127 ?auto_8141 ) ) ( not ( = ?auto_8127 ?auto_8148 ) ) ( not ( = ?auto_8127 ?auto_8150 ) ) ( not ( = ?auto_8127 ?auto_8145 ) ) ( not ( = ?auto_8146 ?auto_8149 ) ) ( not ( = ?auto_8146 ?auto_8137 ) ) ( not ( = ?auto_8146 ?auto_8138 ) ) ( not ( = ?auto_8146 ?auto_8142 ) ) ( not ( = ?auto_8135 ?auto_8136 ) ) ( not ( = ?auto_8135 ?auto_8139 ) ) ( not ( = ?auto_8135 ?auto_8143 ) ) ( not ( = ?auto_8135 ?auto_8144 ) ) ( not ( = ?auto_8147 ?auto_8152 ) ) ( not ( = ?auto_8147 ?auto_8140 ) ) ( not ( = ?auto_8147 ?auto_8153 ) ) ( not ( = ?auto_8147 ?auto_8151 ) ) ( not ( = ?auto_8147 ?auto_8141 ) ) ( not ( = ?auto_8147 ?auto_8148 ) ) ( not ( = ?auto_8147 ?auto_8150 ) ) ( not ( = ?auto_8147 ?auto_8145 ) ) ( not ( = ?auto_8118 ?auto_8128 ) ) ( not ( = ?auto_8118 ?auto_8130 ) ) ( not ( = ?auto_8119 ?auto_8128 ) ) ( not ( = ?auto_8119 ?auto_8130 ) ) ( not ( = ?auto_8120 ?auto_8128 ) ) ( not ( = ?auto_8120 ?auto_8130 ) ) ( not ( = ?auto_8121 ?auto_8128 ) ) ( not ( = ?auto_8121 ?auto_8130 ) ) ( not ( = ?auto_8122 ?auto_8128 ) ) ( not ( = ?auto_8122 ?auto_8130 ) ) ( not ( = ?auto_8123 ?auto_8128 ) ) ( not ( = ?auto_8123 ?auto_8130 ) ) ( not ( = ?auto_8126 ?auto_8128 ) ) ( not ( = ?auto_8126 ?auto_8130 ) ) ( not ( = ?auto_8125 ?auto_8128 ) ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( not ( = ?auto_8124 ?auto_8128 ) ) ( not ( = ?auto_8124 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8147 ) ) ( not ( = ?auto_8128 ?auto_8152 ) ) ( not ( = ?auto_8128 ?auto_8140 ) ) ( not ( = ?auto_8128 ?auto_8153 ) ) ( not ( = ?auto_8128 ?auto_8151 ) ) ( not ( = ?auto_8128 ?auto_8141 ) ) ( not ( = ?auto_8128 ?auto_8148 ) ) ( not ( = ?auto_8128 ?auto_8150 ) ) ( not ( = ?auto_8128 ?auto_8145 ) ) ( not ( = ?auto_8134 ?auto_8146 ) ) ( not ( = ?auto_8134 ?auto_8149 ) ) ( not ( = ?auto_8134 ?auto_8137 ) ) ( not ( = ?auto_8134 ?auto_8138 ) ) ( not ( = ?auto_8134 ?auto_8142 ) ) ( not ( = ?auto_8131 ?auto_8135 ) ) ( not ( = ?auto_8131 ?auto_8136 ) ) ( not ( = ?auto_8131 ?auto_8139 ) ) ( not ( = ?auto_8131 ?auto_8143 ) ) ( not ( = ?auto_8131 ?auto_8144 ) ) ( not ( = ?auto_8130 ?auto_8147 ) ) ( not ( = ?auto_8130 ?auto_8152 ) ) ( not ( = ?auto_8130 ?auto_8140 ) ) ( not ( = ?auto_8130 ?auto_8153 ) ) ( not ( = ?auto_8130 ?auto_8151 ) ) ( not ( = ?auto_8130 ?auto_8141 ) ) ( not ( = ?auto_8130 ?auto_8148 ) ) ( not ( = ?auto_8130 ?auto_8150 ) ) ( not ( = ?auto_8130 ?auto_8145 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8118 ?auto_8119 ?auto_8120 ?auto_8121 ?auto_8122 ?auto_8123 ?auto_8126 ?auto_8125 ?auto_8124 ?auto_8127 )
      ( MAKE-1CRATE ?auto_8127 ?auto_8128 )
      ( MAKE-10CRATE-VERIFY ?auto_8118 ?auto_8119 ?auto_8120 ?auto_8121 ?auto_8122 ?auto_8123 ?auto_8126 ?auto_8125 ?auto_8124 ?auto_8127 ?auto_8128 ) )
  )

)

