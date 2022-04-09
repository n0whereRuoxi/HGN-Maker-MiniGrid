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
      ?auto_125786 - SURFACE
      ?auto_125787 - SURFACE
    )
    :vars
    (
      ?auto_125788 - HOIST
      ?auto_125789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125788 ?auto_125789 ) ( SURFACE-AT ?auto_125786 ?auto_125789 ) ( CLEAR ?auto_125786 ) ( LIFTING ?auto_125788 ?auto_125787 ) ( IS-CRATE ?auto_125787 ) ( not ( = ?auto_125786 ?auto_125787 ) ) )
    :subtasks
    ( ( !DROP ?auto_125788 ?auto_125787 ?auto_125786 ?auto_125789 )
      ( MAKE-1CRATE-VERIFY ?auto_125786 ?auto_125787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125790 - SURFACE
      ?auto_125791 - SURFACE
    )
    :vars
    (
      ?auto_125793 - HOIST
      ?auto_125792 - PLACE
      ?auto_125794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125793 ?auto_125792 ) ( SURFACE-AT ?auto_125790 ?auto_125792 ) ( CLEAR ?auto_125790 ) ( IS-CRATE ?auto_125791 ) ( not ( = ?auto_125790 ?auto_125791 ) ) ( TRUCK-AT ?auto_125794 ?auto_125792 ) ( AVAILABLE ?auto_125793 ) ( IN ?auto_125791 ?auto_125794 ) )
    :subtasks
    ( ( !UNLOAD ?auto_125793 ?auto_125791 ?auto_125794 ?auto_125792 )
      ( MAKE-1CRATE ?auto_125790 ?auto_125791 )
      ( MAKE-1CRATE-VERIFY ?auto_125790 ?auto_125791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125795 - SURFACE
      ?auto_125796 - SURFACE
    )
    :vars
    (
      ?auto_125799 - HOIST
      ?auto_125797 - PLACE
      ?auto_125798 - TRUCK
      ?auto_125800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125799 ?auto_125797 ) ( SURFACE-AT ?auto_125795 ?auto_125797 ) ( CLEAR ?auto_125795 ) ( IS-CRATE ?auto_125796 ) ( not ( = ?auto_125795 ?auto_125796 ) ) ( AVAILABLE ?auto_125799 ) ( IN ?auto_125796 ?auto_125798 ) ( TRUCK-AT ?auto_125798 ?auto_125800 ) ( not ( = ?auto_125800 ?auto_125797 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_125798 ?auto_125800 ?auto_125797 )
      ( MAKE-1CRATE ?auto_125795 ?auto_125796 )
      ( MAKE-1CRATE-VERIFY ?auto_125795 ?auto_125796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125801 - SURFACE
      ?auto_125802 - SURFACE
    )
    :vars
    (
      ?auto_125803 - HOIST
      ?auto_125805 - PLACE
      ?auto_125804 - TRUCK
      ?auto_125806 - PLACE
      ?auto_125807 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125803 ?auto_125805 ) ( SURFACE-AT ?auto_125801 ?auto_125805 ) ( CLEAR ?auto_125801 ) ( IS-CRATE ?auto_125802 ) ( not ( = ?auto_125801 ?auto_125802 ) ) ( AVAILABLE ?auto_125803 ) ( TRUCK-AT ?auto_125804 ?auto_125806 ) ( not ( = ?auto_125806 ?auto_125805 ) ) ( HOIST-AT ?auto_125807 ?auto_125806 ) ( LIFTING ?auto_125807 ?auto_125802 ) ( not ( = ?auto_125803 ?auto_125807 ) ) )
    :subtasks
    ( ( !LOAD ?auto_125807 ?auto_125802 ?auto_125804 ?auto_125806 )
      ( MAKE-1CRATE ?auto_125801 ?auto_125802 )
      ( MAKE-1CRATE-VERIFY ?auto_125801 ?auto_125802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125808 - SURFACE
      ?auto_125809 - SURFACE
    )
    :vars
    (
      ?auto_125814 - HOIST
      ?auto_125812 - PLACE
      ?auto_125811 - TRUCK
      ?auto_125810 - PLACE
      ?auto_125813 - HOIST
      ?auto_125815 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125814 ?auto_125812 ) ( SURFACE-AT ?auto_125808 ?auto_125812 ) ( CLEAR ?auto_125808 ) ( IS-CRATE ?auto_125809 ) ( not ( = ?auto_125808 ?auto_125809 ) ) ( AVAILABLE ?auto_125814 ) ( TRUCK-AT ?auto_125811 ?auto_125810 ) ( not ( = ?auto_125810 ?auto_125812 ) ) ( HOIST-AT ?auto_125813 ?auto_125810 ) ( not ( = ?auto_125814 ?auto_125813 ) ) ( AVAILABLE ?auto_125813 ) ( SURFACE-AT ?auto_125809 ?auto_125810 ) ( ON ?auto_125809 ?auto_125815 ) ( CLEAR ?auto_125809 ) ( not ( = ?auto_125808 ?auto_125815 ) ) ( not ( = ?auto_125809 ?auto_125815 ) ) )
    :subtasks
    ( ( !LIFT ?auto_125813 ?auto_125809 ?auto_125815 ?auto_125810 )
      ( MAKE-1CRATE ?auto_125808 ?auto_125809 )
      ( MAKE-1CRATE-VERIFY ?auto_125808 ?auto_125809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125816 - SURFACE
      ?auto_125817 - SURFACE
    )
    :vars
    (
      ?auto_125819 - HOIST
      ?auto_125823 - PLACE
      ?auto_125821 - PLACE
      ?auto_125818 - HOIST
      ?auto_125822 - SURFACE
      ?auto_125820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125819 ?auto_125823 ) ( SURFACE-AT ?auto_125816 ?auto_125823 ) ( CLEAR ?auto_125816 ) ( IS-CRATE ?auto_125817 ) ( not ( = ?auto_125816 ?auto_125817 ) ) ( AVAILABLE ?auto_125819 ) ( not ( = ?auto_125821 ?auto_125823 ) ) ( HOIST-AT ?auto_125818 ?auto_125821 ) ( not ( = ?auto_125819 ?auto_125818 ) ) ( AVAILABLE ?auto_125818 ) ( SURFACE-AT ?auto_125817 ?auto_125821 ) ( ON ?auto_125817 ?auto_125822 ) ( CLEAR ?auto_125817 ) ( not ( = ?auto_125816 ?auto_125822 ) ) ( not ( = ?auto_125817 ?auto_125822 ) ) ( TRUCK-AT ?auto_125820 ?auto_125823 ) )
    :subtasks
    ( ( !DRIVE ?auto_125820 ?auto_125823 ?auto_125821 )
      ( MAKE-1CRATE ?auto_125816 ?auto_125817 )
      ( MAKE-1CRATE-VERIFY ?auto_125816 ?auto_125817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125833 - SURFACE
      ?auto_125834 - SURFACE
      ?auto_125835 - SURFACE
    )
    :vars
    (
      ?auto_125837 - HOIST
      ?auto_125836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125837 ?auto_125836 ) ( SURFACE-AT ?auto_125834 ?auto_125836 ) ( CLEAR ?auto_125834 ) ( LIFTING ?auto_125837 ?auto_125835 ) ( IS-CRATE ?auto_125835 ) ( not ( = ?auto_125834 ?auto_125835 ) ) ( ON ?auto_125834 ?auto_125833 ) ( not ( = ?auto_125833 ?auto_125834 ) ) ( not ( = ?auto_125833 ?auto_125835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125834 ?auto_125835 )
      ( MAKE-2CRATE-VERIFY ?auto_125833 ?auto_125834 ?auto_125835 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125843 - SURFACE
      ?auto_125844 - SURFACE
      ?auto_125845 - SURFACE
    )
    :vars
    (
      ?auto_125846 - HOIST
      ?auto_125847 - PLACE
      ?auto_125848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125846 ?auto_125847 ) ( SURFACE-AT ?auto_125844 ?auto_125847 ) ( CLEAR ?auto_125844 ) ( IS-CRATE ?auto_125845 ) ( not ( = ?auto_125844 ?auto_125845 ) ) ( TRUCK-AT ?auto_125848 ?auto_125847 ) ( AVAILABLE ?auto_125846 ) ( IN ?auto_125845 ?auto_125848 ) ( ON ?auto_125844 ?auto_125843 ) ( not ( = ?auto_125843 ?auto_125844 ) ) ( not ( = ?auto_125843 ?auto_125845 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125844 ?auto_125845 )
      ( MAKE-2CRATE-VERIFY ?auto_125843 ?auto_125844 ?auto_125845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125849 - SURFACE
      ?auto_125850 - SURFACE
    )
    :vars
    (
      ?auto_125853 - HOIST
      ?auto_125854 - PLACE
      ?auto_125852 - TRUCK
      ?auto_125851 - SURFACE
      ?auto_125855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125853 ?auto_125854 ) ( SURFACE-AT ?auto_125849 ?auto_125854 ) ( CLEAR ?auto_125849 ) ( IS-CRATE ?auto_125850 ) ( not ( = ?auto_125849 ?auto_125850 ) ) ( AVAILABLE ?auto_125853 ) ( IN ?auto_125850 ?auto_125852 ) ( ON ?auto_125849 ?auto_125851 ) ( not ( = ?auto_125851 ?auto_125849 ) ) ( not ( = ?auto_125851 ?auto_125850 ) ) ( TRUCK-AT ?auto_125852 ?auto_125855 ) ( not ( = ?auto_125855 ?auto_125854 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_125852 ?auto_125855 ?auto_125854 )
      ( MAKE-2CRATE ?auto_125851 ?auto_125849 ?auto_125850 )
      ( MAKE-1CRATE-VERIFY ?auto_125849 ?auto_125850 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125856 - SURFACE
      ?auto_125857 - SURFACE
      ?auto_125858 - SURFACE
    )
    :vars
    (
      ?auto_125860 - HOIST
      ?auto_125861 - PLACE
      ?auto_125859 - TRUCK
      ?auto_125862 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125860 ?auto_125861 ) ( SURFACE-AT ?auto_125857 ?auto_125861 ) ( CLEAR ?auto_125857 ) ( IS-CRATE ?auto_125858 ) ( not ( = ?auto_125857 ?auto_125858 ) ) ( AVAILABLE ?auto_125860 ) ( IN ?auto_125858 ?auto_125859 ) ( ON ?auto_125857 ?auto_125856 ) ( not ( = ?auto_125856 ?auto_125857 ) ) ( not ( = ?auto_125856 ?auto_125858 ) ) ( TRUCK-AT ?auto_125859 ?auto_125862 ) ( not ( = ?auto_125862 ?auto_125861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125857 ?auto_125858 )
      ( MAKE-2CRATE-VERIFY ?auto_125856 ?auto_125857 ?auto_125858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125863 - SURFACE
      ?auto_125864 - SURFACE
    )
    :vars
    (
      ?auto_125867 - HOIST
      ?auto_125868 - PLACE
      ?auto_125869 - SURFACE
      ?auto_125865 - TRUCK
      ?auto_125866 - PLACE
      ?auto_125870 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125867 ?auto_125868 ) ( SURFACE-AT ?auto_125863 ?auto_125868 ) ( CLEAR ?auto_125863 ) ( IS-CRATE ?auto_125864 ) ( not ( = ?auto_125863 ?auto_125864 ) ) ( AVAILABLE ?auto_125867 ) ( ON ?auto_125863 ?auto_125869 ) ( not ( = ?auto_125869 ?auto_125863 ) ) ( not ( = ?auto_125869 ?auto_125864 ) ) ( TRUCK-AT ?auto_125865 ?auto_125866 ) ( not ( = ?auto_125866 ?auto_125868 ) ) ( HOIST-AT ?auto_125870 ?auto_125866 ) ( LIFTING ?auto_125870 ?auto_125864 ) ( not ( = ?auto_125867 ?auto_125870 ) ) )
    :subtasks
    ( ( !LOAD ?auto_125870 ?auto_125864 ?auto_125865 ?auto_125866 )
      ( MAKE-2CRATE ?auto_125869 ?auto_125863 ?auto_125864 )
      ( MAKE-1CRATE-VERIFY ?auto_125863 ?auto_125864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125871 - SURFACE
      ?auto_125872 - SURFACE
      ?auto_125873 - SURFACE
    )
    :vars
    (
      ?auto_125874 - HOIST
      ?auto_125877 - PLACE
      ?auto_125875 - TRUCK
      ?auto_125876 - PLACE
      ?auto_125878 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_125874 ?auto_125877 ) ( SURFACE-AT ?auto_125872 ?auto_125877 ) ( CLEAR ?auto_125872 ) ( IS-CRATE ?auto_125873 ) ( not ( = ?auto_125872 ?auto_125873 ) ) ( AVAILABLE ?auto_125874 ) ( ON ?auto_125872 ?auto_125871 ) ( not ( = ?auto_125871 ?auto_125872 ) ) ( not ( = ?auto_125871 ?auto_125873 ) ) ( TRUCK-AT ?auto_125875 ?auto_125876 ) ( not ( = ?auto_125876 ?auto_125877 ) ) ( HOIST-AT ?auto_125878 ?auto_125876 ) ( LIFTING ?auto_125878 ?auto_125873 ) ( not ( = ?auto_125874 ?auto_125878 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125872 ?auto_125873 )
      ( MAKE-2CRATE-VERIFY ?auto_125871 ?auto_125872 ?auto_125873 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125879 - SURFACE
      ?auto_125880 - SURFACE
    )
    :vars
    (
      ?auto_125886 - HOIST
      ?auto_125885 - PLACE
      ?auto_125882 - SURFACE
      ?auto_125884 - TRUCK
      ?auto_125883 - PLACE
      ?auto_125881 - HOIST
      ?auto_125887 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125886 ?auto_125885 ) ( SURFACE-AT ?auto_125879 ?auto_125885 ) ( CLEAR ?auto_125879 ) ( IS-CRATE ?auto_125880 ) ( not ( = ?auto_125879 ?auto_125880 ) ) ( AVAILABLE ?auto_125886 ) ( ON ?auto_125879 ?auto_125882 ) ( not ( = ?auto_125882 ?auto_125879 ) ) ( not ( = ?auto_125882 ?auto_125880 ) ) ( TRUCK-AT ?auto_125884 ?auto_125883 ) ( not ( = ?auto_125883 ?auto_125885 ) ) ( HOIST-AT ?auto_125881 ?auto_125883 ) ( not ( = ?auto_125886 ?auto_125881 ) ) ( AVAILABLE ?auto_125881 ) ( SURFACE-AT ?auto_125880 ?auto_125883 ) ( ON ?auto_125880 ?auto_125887 ) ( CLEAR ?auto_125880 ) ( not ( = ?auto_125879 ?auto_125887 ) ) ( not ( = ?auto_125880 ?auto_125887 ) ) ( not ( = ?auto_125882 ?auto_125887 ) ) )
    :subtasks
    ( ( !LIFT ?auto_125881 ?auto_125880 ?auto_125887 ?auto_125883 )
      ( MAKE-2CRATE ?auto_125882 ?auto_125879 ?auto_125880 )
      ( MAKE-1CRATE-VERIFY ?auto_125879 ?auto_125880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125888 - SURFACE
      ?auto_125889 - SURFACE
      ?auto_125890 - SURFACE
    )
    :vars
    (
      ?auto_125895 - HOIST
      ?auto_125896 - PLACE
      ?auto_125892 - TRUCK
      ?auto_125894 - PLACE
      ?auto_125893 - HOIST
      ?auto_125891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125895 ?auto_125896 ) ( SURFACE-AT ?auto_125889 ?auto_125896 ) ( CLEAR ?auto_125889 ) ( IS-CRATE ?auto_125890 ) ( not ( = ?auto_125889 ?auto_125890 ) ) ( AVAILABLE ?auto_125895 ) ( ON ?auto_125889 ?auto_125888 ) ( not ( = ?auto_125888 ?auto_125889 ) ) ( not ( = ?auto_125888 ?auto_125890 ) ) ( TRUCK-AT ?auto_125892 ?auto_125894 ) ( not ( = ?auto_125894 ?auto_125896 ) ) ( HOIST-AT ?auto_125893 ?auto_125894 ) ( not ( = ?auto_125895 ?auto_125893 ) ) ( AVAILABLE ?auto_125893 ) ( SURFACE-AT ?auto_125890 ?auto_125894 ) ( ON ?auto_125890 ?auto_125891 ) ( CLEAR ?auto_125890 ) ( not ( = ?auto_125889 ?auto_125891 ) ) ( not ( = ?auto_125890 ?auto_125891 ) ) ( not ( = ?auto_125888 ?auto_125891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125889 ?auto_125890 )
      ( MAKE-2CRATE-VERIFY ?auto_125888 ?auto_125889 ?auto_125890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125897 - SURFACE
      ?auto_125898 - SURFACE
    )
    :vars
    (
      ?auto_125905 - HOIST
      ?auto_125902 - PLACE
      ?auto_125900 - SURFACE
      ?auto_125903 - PLACE
      ?auto_125904 - HOIST
      ?auto_125901 - SURFACE
      ?auto_125899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125905 ?auto_125902 ) ( SURFACE-AT ?auto_125897 ?auto_125902 ) ( CLEAR ?auto_125897 ) ( IS-CRATE ?auto_125898 ) ( not ( = ?auto_125897 ?auto_125898 ) ) ( AVAILABLE ?auto_125905 ) ( ON ?auto_125897 ?auto_125900 ) ( not ( = ?auto_125900 ?auto_125897 ) ) ( not ( = ?auto_125900 ?auto_125898 ) ) ( not ( = ?auto_125903 ?auto_125902 ) ) ( HOIST-AT ?auto_125904 ?auto_125903 ) ( not ( = ?auto_125905 ?auto_125904 ) ) ( AVAILABLE ?auto_125904 ) ( SURFACE-AT ?auto_125898 ?auto_125903 ) ( ON ?auto_125898 ?auto_125901 ) ( CLEAR ?auto_125898 ) ( not ( = ?auto_125897 ?auto_125901 ) ) ( not ( = ?auto_125898 ?auto_125901 ) ) ( not ( = ?auto_125900 ?auto_125901 ) ) ( TRUCK-AT ?auto_125899 ?auto_125902 ) )
    :subtasks
    ( ( !DRIVE ?auto_125899 ?auto_125902 ?auto_125903 )
      ( MAKE-2CRATE ?auto_125900 ?auto_125897 ?auto_125898 )
      ( MAKE-1CRATE-VERIFY ?auto_125897 ?auto_125898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125906 - SURFACE
      ?auto_125907 - SURFACE
      ?auto_125908 - SURFACE
    )
    :vars
    (
      ?auto_125911 - HOIST
      ?auto_125912 - PLACE
      ?auto_125914 - PLACE
      ?auto_125909 - HOIST
      ?auto_125910 - SURFACE
      ?auto_125913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125911 ?auto_125912 ) ( SURFACE-AT ?auto_125907 ?auto_125912 ) ( CLEAR ?auto_125907 ) ( IS-CRATE ?auto_125908 ) ( not ( = ?auto_125907 ?auto_125908 ) ) ( AVAILABLE ?auto_125911 ) ( ON ?auto_125907 ?auto_125906 ) ( not ( = ?auto_125906 ?auto_125907 ) ) ( not ( = ?auto_125906 ?auto_125908 ) ) ( not ( = ?auto_125914 ?auto_125912 ) ) ( HOIST-AT ?auto_125909 ?auto_125914 ) ( not ( = ?auto_125911 ?auto_125909 ) ) ( AVAILABLE ?auto_125909 ) ( SURFACE-AT ?auto_125908 ?auto_125914 ) ( ON ?auto_125908 ?auto_125910 ) ( CLEAR ?auto_125908 ) ( not ( = ?auto_125907 ?auto_125910 ) ) ( not ( = ?auto_125908 ?auto_125910 ) ) ( not ( = ?auto_125906 ?auto_125910 ) ) ( TRUCK-AT ?auto_125913 ?auto_125912 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125907 ?auto_125908 )
      ( MAKE-2CRATE-VERIFY ?auto_125906 ?auto_125907 ?auto_125908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125915 - SURFACE
      ?auto_125916 - SURFACE
    )
    :vars
    (
      ?auto_125923 - HOIST
      ?auto_125922 - PLACE
      ?auto_125921 - SURFACE
      ?auto_125917 - PLACE
      ?auto_125918 - HOIST
      ?auto_125919 - SURFACE
      ?auto_125920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125923 ?auto_125922 ) ( IS-CRATE ?auto_125916 ) ( not ( = ?auto_125915 ?auto_125916 ) ) ( not ( = ?auto_125921 ?auto_125915 ) ) ( not ( = ?auto_125921 ?auto_125916 ) ) ( not ( = ?auto_125917 ?auto_125922 ) ) ( HOIST-AT ?auto_125918 ?auto_125917 ) ( not ( = ?auto_125923 ?auto_125918 ) ) ( AVAILABLE ?auto_125918 ) ( SURFACE-AT ?auto_125916 ?auto_125917 ) ( ON ?auto_125916 ?auto_125919 ) ( CLEAR ?auto_125916 ) ( not ( = ?auto_125915 ?auto_125919 ) ) ( not ( = ?auto_125916 ?auto_125919 ) ) ( not ( = ?auto_125921 ?auto_125919 ) ) ( TRUCK-AT ?auto_125920 ?auto_125922 ) ( SURFACE-AT ?auto_125921 ?auto_125922 ) ( CLEAR ?auto_125921 ) ( LIFTING ?auto_125923 ?auto_125915 ) ( IS-CRATE ?auto_125915 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125921 ?auto_125915 )
      ( MAKE-2CRATE ?auto_125921 ?auto_125915 ?auto_125916 )
      ( MAKE-1CRATE-VERIFY ?auto_125915 ?auto_125916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125924 - SURFACE
      ?auto_125925 - SURFACE
      ?auto_125926 - SURFACE
    )
    :vars
    (
      ?auto_125932 - HOIST
      ?auto_125931 - PLACE
      ?auto_125930 - PLACE
      ?auto_125928 - HOIST
      ?auto_125927 - SURFACE
      ?auto_125929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125932 ?auto_125931 ) ( IS-CRATE ?auto_125926 ) ( not ( = ?auto_125925 ?auto_125926 ) ) ( not ( = ?auto_125924 ?auto_125925 ) ) ( not ( = ?auto_125924 ?auto_125926 ) ) ( not ( = ?auto_125930 ?auto_125931 ) ) ( HOIST-AT ?auto_125928 ?auto_125930 ) ( not ( = ?auto_125932 ?auto_125928 ) ) ( AVAILABLE ?auto_125928 ) ( SURFACE-AT ?auto_125926 ?auto_125930 ) ( ON ?auto_125926 ?auto_125927 ) ( CLEAR ?auto_125926 ) ( not ( = ?auto_125925 ?auto_125927 ) ) ( not ( = ?auto_125926 ?auto_125927 ) ) ( not ( = ?auto_125924 ?auto_125927 ) ) ( TRUCK-AT ?auto_125929 ?auto_125931 ) ( SURFACE-AT ?auto_125924 ?auto_125931 ) ( CLEAR ?auto_125924 ) ( LIFTING ?auto_125932 ?auto_125925 ) ( IS-CRATE ?auto_125925 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125925 ?auto_125926 )
      ( MAKE-2CRATE-VERIFY ?auto_125924 ?auto_125925 ?auto_125926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125933 - SURFACE
      ?auto_125934 - SURFACE
    )
    :vars
    (
      ?auto_125941 - HOIST
      ?auto_125939 - PLACE
      ?auto_125940 - SURFACE
      ?auto_125935 - PLACE
      ?auto_125937 - HOIST
      ?auto_125938 - SURFACE
      ?auto_125936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125941 ?auto_125939 ) ( IS-CRATE ?auto_125934 ) ( not ( = ?auto_125933 ?auto_125934 ) ) ( not ( = ?auto_125940 ?auto_125933 ) ) ( not ( = ?auto_125940 ?auto_125934 ) ) ( not ( = ?auto_125935 ?auto_125939 ) ) ( HOIST-AT ?auto_125937 ?auto_125935 ) ( not ( = ?auto_125941 ?auto_125937 ) ) ( AVAILABLE ?auto_125937 ) ( SURFACE-AT ?auto_125934 ?auto_125935 ) ( ON ?auto_125934 ?auto_125938 ) ( CLEAR ?auto_125934 ) ( not ( = ?auto_125933 ?auto_125938 ) ) ( not ( = ?auto_125934 ?auto_125938 ) ) ( not ( = ?auto_125940 ?auto_125938 ) ) ( TRUCK-AT ?auto_125936 ?auto_125939 ) ( SURFACE-AT ?auto_125940 ?auto_125939 ) ( CLEAR ?auto_125940 ) ( IS-CRATE ?auto_125933 ) ( AVAILABLE ?auto_125941 ) ( IN ?auto_125933 ?auto_125936 ) )
    :subtasks
    ( ( !UNLOAD ?auto_125941 ?auto_125933 ?auto_125936 ?auto_125939 )
      ( MAKE-2CRATE ?auto_125940 ?auto_125933 ?auto_125934 )
      ( MAKE-1CRATE-VERIFY ?auto_125933 ?auto_125934 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_125942 - SURFACE
      ?auto_125943 - SURFACE
      ?auto_125944 - SURFACE
    )
    :vars
    (
      ?auto_125948 - HOIST
      ?auto_125950 - PLACE
      ?auto_125945 - PLACE
      ?auto_125946 - HOIST
      ?auto_125949 - SURFACE
      ?auto_125947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_125948 ?auto_125950 ) ( IS-CRATE ?auto_125944 ) ( not ( = ?auto_125943 ?auto_125944 ) ) ( not ( = ?auto_125942 ?auto_125943 ) ) ( not ( = ?auto_125942 ?auto_125944 ) ) ( not ( = ?auto_125945 ?auto_125950 ) ) ( HOIST-AT ?auto_125946 ?auto_125945 ) ( not ( = ?auto_125948 ?auto_125946 ) ) ( AVAILABLE ?auto_125946 ) ( SURFACE-AT ?auto_125944 ?auto_125945 ) ( ON ?auto_125944 ?auto_125949 ) ( CLEAR ?auto_125944 ) ( not ( = ?auto_125943 ?auto_125949 ) ) ( not ( = ?auto_125944 ?auto_125949 ) ) ( not ( = ?auto_125942 ?auto_125949 ) ) ( TRUCK-AT ?auto_125947 ?auto_125950 ) ( SURFACE-AT ?auto_125942 ?auto_125950 ) ( CLEAR ?auto_125942 ) ( IS-CRATE ?auto_125943 ) ( AVAILABLE ?auto_125948 ) ( IN ?auto_125943 ?auto_125947 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_125943 ?auto_125944 )
      ( MAKE-2CRATE-VERIFY ?auto_125942 ?auto_125943 ?auto_125944 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_125987 - SURFACE
      ?auto_125988 - SURFACE
    )
    :vars
    (
      ?auto_125992 - HOIST
      ?auto_125991 - PLACE
      ?auto_125993 - SURFACE
      ?auto_125989 - PLACE
      ?auto_125994 - HOIST
      ?auto_125995 - SURFACE
      ?auto_125990 - TRUCK
      ?auto_125996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_125992 ?auto_125991 ) ( SURFACE-AT ?auto_125987 ?auto_125991 ) ( CLEAR ?auto_125987 ) ( IS-CRATE ?auto_125988 ) ( not ( = ?auto_125987 ?auto_125988 ) ) ( AVAILABLE ?auto_125992 ) ( ON ?auto_125987 ?auto_125993 ) ( not ( = ?auto_125993 ?auto_125987 ) ) ( not ( = ?auto_125993 ?auto_125988 ) ) ( not ( = ?auto_125989 ?auto_125991 ) ) ( HOIST-AT ?auto_125994 ?auto_125989 ) ( not ( = ?auto_125992 ?auto_125994 ) ) ( AVAILABLE ?auto_125994 ) ( SURFACE-AT ?auto_125988 ?auto_125989 ) ( ON ?auto_125988 ?auto_125995 ) ( CLEAR ?auto_125988 ) ( not ( = ?auto_125987 ?auto_125995 ) ) ( not ( = ?auto_125988 ?auto_125995 ) ) ( not ( = ?auto_125993 ?auto_125995 ) ) ( TRUCK-AT ?auto_125990 ?auto_125996 ) ( not ( = ?auto_125996 ?auto_125991 ) ) ( not ( = ?auto_125989 ?auto_125996 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_125990 ?auto_125996 ?auto_125991 )
      ( MAKE-1CRATE ?auto_125987 ?auto_125988 )
      ( MAKE-1CRATE-VERIFY ?auto_125987 ?auto_125988 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126026 - SURFACE
      ?auto_126027 - SURFACE
      ?auto_126028 - SURFACE
      ?auto_126029 - SURFACE
    )
    :vars
    (
      ?auto_126030 - HOIST
      ?auto_126031 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126030 ?auto_126031 ) ( SURFACE-AT ?auto_126028 ?auto_126031 ) ( CLEAR ?auto_126028 ) ( LIFTING ?auto_126030 ?auto_126029 ) ( IS-CRATE ?auto_126029 ) ( not ( = ?auto_126028 ?auto_126029 ) ) ( ON ?auto_126027 ?auto_126026 ) ( ON ?auto_126028 ?auto_126027 ) ( not ( = ?auto_126026 ?auto_126027 ) ) ( not ( = ?auto_126026 ?auto_126028 ) ) ( not ( = ?auto_126026 ?auto_126029 ) ) ( not ( = ?auto_126027 ?auto_126028 ) ) ( not ( = ?auto_126027 ?auto_126029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126028 ?auto_126029 )
      ( MAKE-3CRATE-VERIFY ?auto_126026 ?auto_126027 ?auto_126028 ?auto_126029 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126043 - SURFACE
      ?auto_126044 - SURFACE
      ?auto_126045 - SURFACE
      ?auto_126046 - SURFACE
    )
    :vars
    (
      ?auto_126048 - HOIST
      ?auto_126049 - PLACE
      ?auto_126047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126048 ?auto_126049 ) ( SURFACE-AT ?auto_126045 ?auto_126049 ) ( CLEAR ?auto_126045 ) ( IS-CRATE ?auto_126046 ) ( not ( = ?auto_126045 ?auto_126046 ) ) ( TRUCK-AT ?auto_126047 ?auto_126049 ) ( AVAILABLE ?auto_126048 ) ( IN ?auto_126046 ?auto_126047 ) ( ON ?auto_126045 ?auto_126044 ) ( not ( = ?auto_126044 ?auto_126045 ) ) ( not ( = ?auto_126044 ?auto_126046 ) ) ( ON ?auto_126044 ?auto_126043 ) ( not ( = ?auto_126043 ?auto_126044 ) ) ( not ( = ?auto_126043 ?auto_126045 ) ) ( not ( = ?auto_126043 ?auto_126046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126044 ?auto_126045 ?auto_126046 )
      ( MAKE-3CRATE-VERIFY ?auto_126043 ?auto_126044 ?auto_126045 ?auto_126046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126064 - SURFACE
      ?auto_126065 - SURFACE
      ?auto_126066 - SURFACE
      ?auto_126067 - SURFACE
    )
    :vars
    (
      ?auto_126069 - HOIST
      ?auto_126070 - PLACE
      ?auto_126071 - TRUCK
      ?auto_126068 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126069 ?auto_126070 ) ( SURFACE-AT ?auto_126066 ?auto_126070 ) ( CLEAR ?auto_126066 ) ( IS-CRATE ?auto_126067 ) ( not ( = ?auto_126066 ?auto_126067 ) ) ( AVAILABLE ?auto_126069 ) ( IN ?auto_126067 ?auto_126071 ) ( ON ?auto_126066 ?auto_126065 ) ( not ( = ?auto_126065 ?auto_126066 ) ) ( not ( = ?auto_126065 ?auto_126067 ) ) ( TRUCK-AT ?auto_126071 ?auto_126068 ) ( not ( = ?auto_126068 ?auto_126070 ) ) ( ON ?auto_126065 ?auto_126064 ) ( not ( = ?auto_126064 ?auto_126065 ) ) ( not ( = ?auto_126064 ?auto_126066 ) ) ( not ( = ?auto_126064 ?auto_126067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126065 ?auto_126066 ?auto_126067 )
      ( MAKE-3CRATE-VERIFY ?auto_126064 ?auto_126065 ?auto_126066 ?auto_126067 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126088 - SURFACE
      ?auto_126089 - SURFACE
      ?auto_126090 - SURFACE
      ?auto_126091 - SURFACE
    )
    :vars
    (
      ?auto_126095 - HOIST
      ?auto_126093 - PLACE
      ?auto_126094 - TRUCK
      ?auto_126096 - PLACE
      ?auto_126092 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126095 ?auto_126093 ) ( SURFACE-AT ?auto_126090 ?auto_126093 ) ( CLEAR ?auto_126090 ) ( IS-CRATE ?auto_126091 ) ( not ( = ?auto_126090 ?auto_126091 ) ) ( AVAILABLE ?auto_126095 ) ( ON ?auto_126090 ?auto_126089 ) ( not ( = ?auto_126089 ?auto_126090 ) ) ( not ( = ?auto_126089 ?auto_126091 ) ) ( TRUCK-AT ?auto_126094 ?auto_126096 ) ( not ( = ?auto_126096 ?auto_126093 ) ) ( HOIST-AT ?auto_126092 ?auto_126096 ) ( LIFTING ?auto_126092 ?auto_126091 ) ( not ( = ?auto_126095 ?auto_126092 ) ) ( ON ?auto_126089 ?auto_126088 ) ( not ( = ?auto_126088 ?auto_126089 ) ) ( not ( = ?auto_126088 ?auto_126090 ) ) ( not ( = ?auto_126088 ?auto_126091 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126089 ?auto_126090 ?auto_126091 )
      ( MAKE-3CRATE-VERIFY ?auto_126088 ?auto_126089 ?auto_126090 ?auto_126091 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126115 - SURFACE
      ?auto_126116 - SURFACE
      ?auto_126117 - SURFACE
      ?auto_126118 - SURFACE
    )
    :vars
    (
      ?auto_126120 - HOIST
      ?auto_126121 - PLACE
      ?auto_126124 - TRUCK
      ?auto_126123 - PLACE
      ?auto_126122 - HOIST
      ?auto_126119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126120 ?auto_126121 ) ( SURFACE-AT ?auto_126117 ?auto_126121 ) ( CLEAR ?auto_126117 ) ( IS-CRATE ?auto_126118 ) ( not ( = ?auto_126117 ?auto_126118 ) ) ( AVAILABLE ?auto_126120 ) ( ON ?auto_126117 ?auto_126116 ) ( not ( = ?auto_126116 ?auto_126117 ) ) ( not ( = ?auto_126116 ?auto_126118 ) ) ( TRUCK-AT ?auto_126124 ?auto_126123 ) ( not ( = ?auto_126123 ?auto_126121 ) ) ( HOIST-AT ?auto_126122 ?auto_126123 ) ( not ( = ?auto_126120 ?auto_126122 ) ) ( AVAILABLE ?auto_126122 ) ( SURFACE-AT ?auto_126118 ?auto_126123 ) ( ON ?auto_126118 ?auto_126119 ) ( CLEAR ?auto_126118 ) ( not ( = ?auto_126117 ?auto_126119 ) ) ( not ( = ?auto_126118 ?auto_126119 ) ) ( not ( = ?auto_126116 ?auto_126119 ) ) ( ON ?auto_126116 ?auto_126115 ) ( not ( = ?auto_126115 ?auto_126116 ) ) ( not ( = ?auto_126115 ?auto_126117 ) ) ( not ( = ?auto_126115 ?auto_126118 ) ) ( not ( = ?auto_126115 ?auto_126119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126116 ?auto_126117 ?auto_126118 )
      ( MAKE-3CRATE-VERIFY ?auto_126115 ?auto_126116 ?auto_126117 ?auto_126118 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126143 - SURFACE
      ?auto_126144 - SURFACE
      ?auto_126145 - SURFACE
      ?auto_126146 - SURFACE
    )
    :vars
    (
      ?auto_126149 - HOIST
      ?auto_126147 - PLACE
      ?auto_126152 - PLACE
      ?auto_126148 - HOIST
      ?auto_126151 - SURFACE
      ?auto_126150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126149 ?auto_126147 ) ( SURFACE-AT ?auto_126145 ?auto_126147 ) ( CLEAR ?auto_126145 ) ( IS-CRATE ?auto_126146 ) ( not ( = ?auto_126145 ?auto_126146 ) ) ( AVAILABLE ?auto_126149 ) ( ON ?auto_126145 ?auto_126144 ) ( not ( = ?auto_126144 ?auto_126145 ) ) ( not ( = ?auto_126144 ?auto_126146 ) ) ( not ( = ?auto_126152 ?auto_126147 ) ) ( HOIST-AT ?auto_126148 ?auto_126152 ) ( not ( = ?auto_126149 ?auto_126148 ) ) ( AVAILABLE ?auto_126148 ) ( SURFACE-AT ?auto_126146 ?auto_126152 ) ( ON ?auto_126146 ?auto_126151 ) ( CLEAR ?auto_126146 ) ( not ( = ?auto_126145 ?auto_126151 ) ) ( not ( = ?auto_126146 ?auto_126151 ) ) ( not ( = ?auto_126144 ?auto_126151 ) ) ( TRUCK-AT ?auto_126150 ?auto_126147 ) ( ON ?auto_126144 ?auto_126143 ) ( not ( = ?auto_126143 ?auto_126144 ) ) ( not ( = ?auto_126143 ?auto_126145 ) ) ( not ( = ?auto_126143 ?auto_126146 ) ) ( not ( = ?auto_126143 ?auto_126151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126144 ?auto_126145 ?auto_126146 )
      ( MAKE-3CRATE-VERIFY ?auto_126143 ?auto_126144 ?auto_126145 ?auto_126146 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126171 - SURFACE
      ?auto_126172 - SURFACE
      ?auto_126173 - SURFACE
      ?auto_126174 - SURFACE
    )
    :vars
    (
      ?auto_126179 - HOIST
      ?auto_126177 - PLACE
      ?auto_126180 - PLACE
      ?auto_126175 - HOIST
      ?auto_126178 - SURFACE
      ?auto_126176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126179 ?auto_126177 ) ( IS-CRATE ?auto_126174 ) ( not ( = ?auto_126173 ?auto_126174 ) ) ( not ( = ?auto_126172 ?auto_126173 ) ) ( not ( = ?auto_126172 ?auto_126174 ) ) ( not ( = ?auto_126180 ?auto_126177 ) ) ( HOIST-AT ?auto_126175 ?auto_126180 ) ( not ( = ?auto_126179 ?auto_126175 ) ) ( AVAILABLE ?auto_126175 ) ( SURFACE-AT ?auto_126174 ?auto_126180 ) ( ON ?auto_126174 ?auto_126178 ) ( CLEAR ?auto_126174 ) ( not ( = ?auto_126173 ?auto_126178 ) ) ( not ( = ?auto_126174 ?auto_126178 ) ) ( not ( = ?auto_126172 ?auto_126178 ) ) ( TRUCK-AT ?auto_126176 ?auto_126177 ) ( SURFACE-AT ?auto_126172 ?auto_126177 ) ( CLEAR ?auto_126172 ) ( LIFTING ?auto_126179 ?auto_126173 ) ( IS-CRATE ?auto_126173 ) ( ON ?auto_126172 ?auto_126171 ) ( not ( = ?auto_126171 ?auto_126172 ) ) ( not ( = ?auto_126171 ?auto_126173 ) ) ( not ( = ?auto_126171 ?auto_126174 ) ) ( not ( = ?auto_126171 ?auto_126178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126172 ?auto_126173 ?auto_126174 )
      ( MAKE-3CRATE-VERIFY ?auto_126171 ?auto_126172 ?auto_126173 ?auto_126174 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126199 - SURFACE
      ?auto_126200 - SURFACE
      ?auto_126201 - SURFACE
      ?auto_126202 - SURFACE
    )
    :vars
    (
      ?auto_126208 - HOIST
      ?auto_126203 - PLACE
      ?auto_126204 - PLACE
      ?auto_126207 - HOIST
      ?auto_126206 - SURFACE
      ?auto_126205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126208 ?auto_126203 ) ( IS-CRATE ?auto_126202 ) ( not ( = ?auto_126201 ?auto_126202 ) ) ( not ( = ?auto_126200 ?auto_126201 ) ) ( not ( = ?auto_126200 ?auto_126202 ) ) ( not ( = ?auto_126204 ?auto_126203 ) ) ( HOIST-AT ?auto_126207 ?auto_126204 ) ( not ( = ?auto_126208 ?auto_126207 ) ) ( AVAILABLE ?auto_126207 ) ( SURFACE-AT ?auto_126202 ?auto_126204 ) ( ON ?auto_126202 ?auto_126206 ) ( CLEAR ?auto_126202 ) ( not ( = ?auto_126201 ?auto_126206 ) ) ( not ( = ?auto_126202 ?auto_126206 ) ) ( not ( = ?auto_126200 ?auto_126206 ) ) ( TRUCK-AT ?auto_126205 ?auto_126203 ) ( SURFACE-AT ?auto_126200 ?auto_126203 ) ( CLEAR ?auto_126200 ) ( IS-CRATE ?auto_126201 ) ( AVAILABLE ?auto_126208 ) ( IN ?auto_126201 ?auto_126205 ) ( ON ?auto_126200 ?auto_126199 ) ( not ( = ?auto_126199 ?auto_126200 ) ) ( not ( = ?auto_126199 ?auto_126201 ) ) ( not ( = ?auto_126199 ?auto_126202 ) ) ( not ( = ?auto_126199 ?auto_126206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126200 ?auto_126201 ?auto_126202 )
      ( MAKE-3CRATE-VERIFY ?auto_126199 ?auto_126200 ?auto_126201 ?auto_126202 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126490 - SURFACE
      ?auto_126491 - SURFACE
      ?auto_126492 - SURFACE
      ?auto_126494 - SURFACE
      ?auto_126493 - SURFACE
    )
    :vars
    (
      ?auto_126496 - HOIST
      ?auto_126495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126496 ?auto_126495 ) ( SURFACE-AT ?auto_126494 ?auto_126495 ) ( CLEAR ?auto_126494 ) ( LIFTING ?auto_126496 ?auto_126493 ) ( IS-CRATE ?auto_126493 ) ( not ( = ?auto_126494 ?auto_126493 ) ) ( ON ?auto_126491 ?auto_126490 ) ( ON ?auto_126492 ?auto_126491 ) ( ON ?auto_126494 ?auto_126492 ) ( not ( = ?auto_126490 ?auto_126491 ) ) ( not ( = ?auto_126490 ?auto_126492 ) ) ( not ( = ?auto_126490 ?auto_126494 ) ) ( not ( = ?auto_126490 ?auto_126493 ) ) ( not ( = ?auto_126491 ?auto_126492 ) ) ( not ( = ?auto_126491 ?auto_126494 ) ) ( not ( = ?auto_126491 ?auto_126493 ) ) ( not ( = ?auto_126492 ?auto_126494 ) ) ( not ( = ?auto_126492 ?auto_126493 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126494 ?auto_126493 )
      ( MAKE-4CRATE-VERIFY ?auto_126490 ?auto_126491 ?auto_126492 ?auto_126494 ?auto_126493 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126515 - SURFACE
      ?auto_126516 - SURFACE
      ?auto_126517 - SURFACE
      ?auto_126519 - SURFACE
      ?auto_126518 - SURFACE
    )
    :vars
    (
      ?auto_126521 - HOIST
      ?auto_126522 - PLACE
      ?auto_126520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126521 ?auto_126522 ) ( SURFACE-AT ?auto_126519 ?auto_126522 ) ( CLEAR ?auto_126519 ) ( IS-CRATE ?auto_126518 ) ( not ( = ?auto_126519 ?auto_126518 ) ) ( TRUCK-AT ?auto_126520 ?auto_126522 ) ( AVAILABLE ?auto_126521 ) ( IN ?auto_126518 ?auto_126520 ) ( ON ?auto_126519 ?auto_126517 ) ( not ( = ?auto_126517 ?auto_126519 ) ) ( not ( = ?auto_126517 ?auto_126518 ) ) ( ON ?auto_126516 ?auto_126515 ) ( ON ?auto_126517 ?auto_126516 ) ( not ( = ?auto_126515 ?auto_126516 ) ) ( not ( = ?auto_126515 ?auto_126517 ) ) ( not ( = ?auto_126515 ?auto_126519 ) ) ( not ( = ?auto_126515 ?auto_126518 ) ) ( not ( = ?auto_126516 ?auto_126517 ) ) ( not ( = ?auto_126516 ?auto_126519 ) ) ( not ( = ?auto_126516 ?auto_126518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126517 ?auto_126519 ?auto_126518 )
      ( MAKE-4CRATE-VERIFY ?auto_126515 ?auto_126516 ?auto_126517 ?auto_126519 ?auto_126518 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126545 - SURFACE
      ?auto_126546 - SURFACE
      ?auto_126547 - SURFACE
      ?auto_126549 - SURFACE
      ?auto_126548 - SURFACE
    )
    :vars
    (
      ?auto_126551 - HOIST
      ?auto_126550 - PLACE
      ?auto_126553 - TRUCK
      ?auto_126552 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126551 ?auto_126550 ) ( SURFACE-AT ?auto_126549 ?auto_126550 ) ( CLEAR ?auto_126549 ) ( IS-CRATE ?auto_126548 ) ( not ( = ?auto_126549 ?auto_126548 ) ) ( AVAILABLE ?auto_126551 ) ( IN ?auto_126548 ?auto_126553 ) ( ON ?auto_126549 ?auto_126547 ) ( not ( = ?auto_126547 ?auto_126549 ) ) ( not ( = ?auto_126547 ?auto_126548 ) ) ( TRUCK-AT ?auto_126553 ?auto_126552 ) ( not ( = ?auto_126552 ?auto_126550 ) ) ( ON ?auto_126546 ?auto_126545 ) ( ON ?auto_126547 ?auto_126546 ) ( not ( = ?auto_126545 ?auto_126546 ) ) ( not ( = ?auto_126545 ?auto_126547 ) ) ( not ( = ?auto_126545 ?auto_126549 ) ) ( not ( = ?auto_126545 ?auto_126548 ) ) ( not ( = ?auto_126546 ?auto_126547 ) ) ( not ( = ?auto_126546 ?auto_126549 ) ) ( not ( = ?auto_126546 ?auto_126548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126547 ?auto_126549 ?auto_126548 )
      ( MAKE-4CRATE-VERIFY ?auto_126545 ?auto_126546 ?auto_126547 ?auto_126549 ?auto_126548 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126579 - SURFACE
      ?auto_126580 - SURFACE
      ?auto_126581 - SURFACE
      ?auto_126583 - SURFACE
      ?auto_126582 - SURFACE
    )
    :vars
    (
      ?auto_126588 - HOIST
      ?auto_126587 - PLACE
      ?auto_126586 - TRUCK
      ?auto_126584 - PLACE
      ?auto_126585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_126588 ?auto_126587 ) ( SURFACE-AT ?auto_126583 ?auto_126587 ) ( CLEAR ?auto_126583 ) ( IS-CRATE ?auto_126582 ) ( not ( = ?auto_126583 ?auto_126582 ) ) ( AVAILABLE ?auto_126588 ) ( ON ?auto_126583 ?auto_126581 ) ( not ( = ?auto_126581 ?auto_126583 ) ) ( not ( = ?auto_126581 ?auto_126582 ) ) ( TRUCK-AT ?auto_126586 ?auto_126584 ) ( not ( = ?auto_126584 ?auto_126587 ) ) ( HOIST-AT ?auto_126585 ?auto_126584 ) ( LIFTING ?auto_126585 ?auto_126582 ) ( not ( = ?auto_126588 ?auto_126585 ) ) ( ON ?auto_126580 ?auto_126579 ) ( ON ?auto_126581 ?auto_126580 ) ( not ( = ?auto_126579 ?auto_126580 ) ) ( not ( = ?auto_126579 ?auto_126581 ) ) ( not ( = ?auto_126579 ?auto_126583 ) ) ( not ( = ?auto_126579 ?auto_126582 ) ) ( not ( = ?auto_126580 ?auto_126581 ) ) ( not ( = ?auto_126580 ?auto_126583 ) ) ( not ( = ?auto_126580 ?auto_126582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126581 ?auto_126583 ?auto_126582 )
      ( MAKE-4CRATE-VERIFY ?auto_126579 ?auto_126580 ?auto_126581 ?auto_126583 ?auto_126582 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126617 - SURFACE
      ?auto_126618 - SURFACE
      ?auto_126619 - SURFACE
      ?auto_126621 - SURFACE
      ?auto_126620 - SURFACE
    )
    :vars
    (
      ?auto_126625 - HOIST
      ?auto_126623 - PLACE
      ?auto_126626 - TRUCK
      ?auto_126622 - PLACE
      ?auto_126624 - HOIST
      ?auto_126627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126625 ?auto_126623 ) ( SURFACE-AT ?auto_126621 ?auto_126623 ) ( CLEAR ?auto_126621 ) ( IS-CRATE ?auto_126620 ) ( not ( = ?auto_126621 ?auto_126620 ) ) ( AVAILABLE ?auto_126625 ) ( ON ?auto_126621 ?auto_126619 ) ( not ( = ?auto_126619 ?auto_126621 ) ) ( not ( = ?auto_126619 ?auto_126620 ) ) ( TRUCK-AT ?auto_126626 ?auto_126622 ) ( not ( = ?auto_126622 ?auto_126623 ) ) ( HOIST-AT ?auto_126624 ?auto_126622 ) ( not ( = ?auto_126625 ?auto_126624 ) ) ( AVAILABLE ?auto_126624 ) ( SURFACE-AT ?auto_126620 ?auto_126622 ) ( ON ?auto_126620 ?auto_126627 ) ( CLEAR ?auto_126620 ) ( not ( = ?auto_126621 ?auto_126627 ) ) ( not ( = ?auto_126620 ?auto_126627 ) ) ( not ( = ?auto_126619 ?auto_126627 ) ) ( ON ?auto_126618 ?auto_126617 ) ( ON ?auto_126619 ?auto_126618 ) ( not ( = ?auto_126617 ?auto_126618 ) ) ( not ( = ?auto_126617 ?auto_126619 ) ) ( not ( = ?auto_126617 ?auto_126621 ) ) ( not ( = ?auto_126617 ?auto_126620 ) ) ( not ( = ?auto_126617 ?auto_126627 ) ) ( not ( = ?auto_126618 ?auto_126619 ) ) ( not ( = ?auto_126618 ?auto_126621 ) ) ( not ( = ?auto_126618 ?auto_126620 ) ) ( not ( = ?auto_126618 ?auto_126627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126619 ?auto_126621 ?auto_126620 )
      ( MAKE-4CRATE-VERIFY ?auto_126617 ?auto_126618 ?auto_126619 ?auto_126621 ?auto_126620 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126656 - SURFACE
      ?auto_126657 - SURFACE
      ?auto_126658 - SURFACE
      ?auto_126660 - SURFACE
      ?auto_126659 - SURFACE
    )
    :vars
    (
      ?auto_126662 - HOIST
      ?auto_126661 - PLACE
      ?auto_126663 - PLACE
      ?auto_126664 - HOIST
      ?auto_126666 - SURFACE
      ?auto_126665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126662 ?auto_126661 ) ( SURFACE-AT ?auto_126660 ?auto_126661 ) ( CLEAR ?auto_126660 ) ( IS-CRATE ?auto_126659 ) ( not ( = ?auto_126660 ?auto_126659 ) ) ( AVAILABLE ?auto_126662 ) ( ON ?auto_126660 ?auto_126658 ) ( not ( = ?auto_126658 ?auto_126660 ) ) ( not ( = ?auto_126658 ?auto_126659 ) ) ( not ( = ?auto_126663 ?auto_126661 ) ) ( HOIST-AT ?auto_126664 ?auto_126663 ) ( not ( = ?auto_126662 ?auto_126664 ) ) ( AVAILABLE ?auto_126664 ) ( SURFACE-AT ?auto_126659 ?auto_126663 ) ( ON ?auto_126659 ?auto_126666 ) ( CLEAR ?auto_126659 ) ( not ( = ?auto_126660 ?auto_126666 ) ) ( not ( = ?auto_126659 ?auto_126666 ) ) ( not ( = ?auto_126658 ?auto_126666 ) ) ( TRUCK-AT ?auto_126665 ?auto_126661 ) ( ON ?auto_126657 ?auto_126656 ) ( ON ?auto_126658 ?auto_126657 ) ( not ( = ?auto_126656 ?auto_126657 ) ) ( not ( = ?auto_126656 ?auto_126658 ) ) ( not ( = ?auto_126656 ?auto_126660 ) ) ( not ( = ?auto_126656 ?auto_126659 ) ) ( not ( = ?auto_126656 ?auto_126666 ) ) ( not ( = ?auto_126657 ?auto_126658 ) ) ( not ( = ?auto_126657 ?auto_126660 ) ) ( not ( = ?auto_126657 ?auto_126659 ) ) ( not ( = ?auto_126657 ?auto_126666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126658 ?auto_126660 ?auto_126659 )
      ( MAKE-4CRATE-VERIFY ?auto_126656 ?auto_126657 ?auto_126658 ?auto_126660 ?auto_126659 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126695 - SURFACE
      ?auto_126696 - SURFACE
      ?auto_126697 - SURFACE
      ?auto_126699 - SURFACE
      ?auto_126698 - SURFACE
    )
    :vars
    (
      ?auto_126705 - HOIST
      ?auto_126701 - PLACE
      ?auto_126703 - PLACE
      ?auto_126704 - HOIST
      ?auto_126700 - SURFACE
      ?auto_126702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126705 ?auto_126701 ) ( IS-CRATE ?auto_126698 ) ( not ( = ?auto_126699 ?auto_126698 ) ) ( not ( = ?auto_126697 ?auto_126699 ) ) ( not ( = ?auto_126697 ?auto_126698 ) ) ( not ( = ?auto_126703 ?auto_126701 ) ) ( HOIST-AT ?auto_126704 ?auto_126703 ) ( not ( = ?auto_126705 ?auto_126704 ) ) ( AVAILABLE ?auto_126704 ) ( SURFACE-AT ?auto_126698 ?auto_126703 ) ( ON ?auto_126698 ?auto_126700 ) ( CLEAR ?auto_126698 ) ( not ( = ?auto_126699 ?auto_126700 ) ) ( not ( = ?auto_126698 ?auto_126700 ) ) ( not ( = ?auto_126697 ?auto_126700 ) ) ( TRUCK-AT ?auto_126702 ?auto_126701 ) ( SURFACE-AT ?auto_126697 ?auto_126701 ) ( CLEAR ?auto_126697 ) ( LIFTING ?auto_126705 ?auto_126699 ) ( IS-CRATE ?auto_126699 ) ( ON ?auto_126696 ?auto_126695 ) ( ON ?auto_126697 ?auto_126696 ) ( not ( = ?auto_126695 ?auto_126696 ) ) ( not ( = ?auto_126695 ?auto_126697 ) ) ( not ( = ?auto_126695 ?auto_126699 ) ) ( not ( = ?auto_126695 ?auto_126698 ) ) ( not ( = ?auto_126695 ?auto_126700 ) ) ( not ( = ?auto_126696 ?auto_126697 ) ) ( not ( = ?auto_126696 ?auto_126699 ) ) ( not ( = ?auto_126696 ?auto_126698 ) ) ( not ( = ?auto_126696 ?auto_126700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126697 ?auto_126699 ?auto_126698 )
      ( MAKE-4CRATE-VERIFY ?auto_126695 ?auto_126696 ?auto_126697 ?auto_126699 ?auto_126698 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126734 - SURFACE
      ?auto_126735 - SURFACE
      ?auto_126736 - SURFACE
      ?auto_126738 - SURFACE
      ?auto_126737 - SURFACE
    )
    :vars
    (
      ?auto_126742 - HOIST
      ?auto_126740 - PLACE
      ?auto_126744 - PLACE
      ?auto_126741 - HOIST
      ?auto_126739 - SURFACE
      ?auto_126743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126742 ?auto_126740 ) ( IS-CRATE ?auto_126737 ) ( not ( = ?auto_126738 ?auto_126737 ) ) ( not ( = ?auto_126736 ?auto_126738 ) ) ( not ( = ?auto_126736 ?auto_126737 ) ) ( not ( = ?auto_126744 ?auto_126740 ) ) ( HOIST-AT ?auto_126741 ?auto_126744 ) ( not ( = ?auto_126742 ?auto_126741 ) ) ( AVAILABLE ?auto_126741 ) ( SURFACE-AT ?auto_126737 ?auto_126744 ) ( ON ?auto_126737 ?auto_126739 ) ( CLEAR ?auto_126737 ) ( not ( = ?auto_126738 ?auto_126739 ) ) ( not ( = ?auto_126737 ?auto_126739 ) ) ( not ( = ?auto_126736 ?auto_126739 ) ) ( TRUCK-AT ?auto_126743 ?auto_126740 ) ( SURFACE-AT ?auto_126736 ?auto_126740 ) ( CLEAR ?auto_126736 ) ( IS-CRATE ?auto_126738 ) ( AVAILABLE ?auto_126742 ) ( IN ?auto_126738 ?auto_126743 ) ( ON ?auto_126735 ?auto_126734 ) ( ON ?auto_126736 ?auto_126735 ) ( not ( = ?auto_126734 ?auto_126735 ) ) ( not ( = ?auto_126734 ?auto_126736 ) ) ( not ( = ?auto_126734 ?auto_126738 ) ) ( not ( = ?auto_126734 ?auto_126737 ) ) ( not ( = ?auto_126734 ?auto_126739 ) ) ( not ( = ?auto_126735 ?auto_126736 ) ) ( not ( = ?auto_126735 ?auto_126738 ) ) ( not ( = ?auto_126735 ?auto_126737 ) ) ( not ( = ?auto_126735 ?auto_126739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126736 ?auto_126738 ?auto_126737 )
      ( MAKE-4CRATE-VERIFY ?auto_126734 ?auto_126735 ?auto_126736 ?auto_126738 ?auto_126737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126745 - SURFACE
      ?auto_126746 - SURFACE
    )
    :vars
    (
      ?auto_126751 - HOIST
      ?auto_126749 - PLACE
      ?auto_126748 - SURFACE
      ?auto_126753 - PLACE
      ?auto_126750 - HOIST
      ?auto_126747 - SURFACE
      ?auto_126752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126751 ?auto_126749 ) ( IS-CRATE ?auto_126746 ) ( not ( = ?auto_126745 ?auto_126746 ) ) ( not ( = ?auto_126748 ?auto_126745 ) ) ( not ( = ?auto_126748 ?auto_126746 ) ) ( not ( = ?auto_126753 ?auto_126749 ) ) ( HOIST-AT ?auto_126750 ?auto_126753 ) ( not ( = ?auto_126751 ?auto_126750 ) ) ( AVAILABLE ?auto_126750 ) ( SURFACE-AT ?auto_126746 ?auto_126753 ) ( ON ?auto_126746 ?auto_126747 ) ( CLEAR ?auto_126746 ) ( not ( = ?auto_126745 ?auto_126747 ) ) ( not ( = ?auto_126746 ?auto_126747 ) ) ( not ( = ?auto_126748 ?auto_126747 ) ) ( SURFACE-AT ?auto_126748 ?auto_126749 ) ( CLEAR ?auto_126748 ) ( IS-CRATE ?auto_126745 ) ( AVAILABLE ?auto_126751 ) ( IN ?auto_126745 ?auto_126752 ) ( TRUCK-AT ?auto_126752 ?auto_126753 ) )
    :subtasks
    ( ( !DRIVE ?auto_126752 ?auto_126753 ?auto_126749 )
      ( MAKE-2CRATE ?auto_126748 ?auto_126745 ?auto_126746 )
      ( MAKE-1CRATE-VERIFY ?auto_126745 ?auto_126746 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126754 - SURFACE
      ?auto_126755 - SURFACE
      ?auto_126756 - SURFACE
    )
    :vars
    (
      ?auto_126761 - HOIST
      ?auto_126760 - PLACE
      ?auto_126759 - PLACE
      ?auto_126757 - HOIST
      ?auto_126758 - SURFACE
      ?auto_126762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126761 ?auto_126760 ) ( IS-CRATE ?auto_126756 ) ( not ( = ?auto_126755 ?auto_126756 ) ) ( not ( = ?auto_126754 ?auto_126755 ) ) ( not ( = ?auto_126754 ?auto_126756 ) ) ( not ( = ?auto_126759 ?auto_126760 ) ) ( HOIST-AT ?auto_126757 ?auto_126759 ) ( not ( = ?auto_126761 ?auto_126757 ) ) ( AVAILABLE ?auto_126757 ) ( SURFACE-AT ?auto_126756 ?auto_126759 ) ( ON ?auto_126756 ?auto_126758 ) ( CLEAR ?auto_126756 ) ( not ( = ?auto_126755 ?auto_126758 ) ) ( not ( = ?auto_126756 ?auto_126758 ) ) ( not ( = ?auto_126754 ?auto_126758 ) ) ( SURFACE-AT ?auto_126754 ?auto_126760 ) ( CLEAR ?auto_126754 ) ( IS-CRATE ?auto_126755 ) ( AVAILABLE ?auto_126761 ) ( IN ?auto_126755 ?auto_126762 ) ( TRUCK-AT ?auto_126762 ?auto_126759 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126755 ?auto_126756 )
      ( MAKE-2CRATE-VERIFY ?auto_126754 ?auto_126755 ?auto_126756 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126763 - SURFACE
      ?auto_126764 - SURFACE
      ?auto_126765 - SURFACE
      ?auto_126766 - SURFACE
    )
    :vars
    (
      ?auto_126771 - HOIST
      ?auto_126767 - PLACE
      ?auto_126769 - PLACE
      ?auto_126770 - HOIST
      ?auto_126772 - SURFACE
      ?auto_126768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126771 ?auto_126767 ) ( IS-CRATE ?auto_126766 ) ( not ( = ?auto_126765 ?auto_126766 ) ) ( not ( = ?auto_126764 ?auto_126765 ) ) ( not ( = ?auto_126764 ?auto_126766 ) ) ( not ( = ?auto_126769 ?auto_126767 ) ) ( HOIST-AT ?auto_126770 ?auto_126769 ) ( not ( = ?auto_126771 ?auto_126770 ) ) ( AVAILABLE ?auto_126770 ) ( SURFACE-AT ?auto_126766 ?auto_126769 ) ( ON ?auto_126766 ?auto_126772 ) ( CLEAR ?auto_126766 ) ( not ( = ?auto_126765 ?auto_126772 ) ) ( not ( = ?auto_126766 ?auto_126772 ) ) ( not ( = ?auto_126764 ?auto_126772 ) ) ( SURFACE-AT ?auto_126764 ?auto_126767 ) ( CLEAR ?auto_126764 ) ( IS-CRATE ?auto_126765 ) ( AVAILABLE ?auto_126771 ) ( IN ?auto_126765 ?auto_126768 ) ( TRUCK-AT ?auto_126768 ?auto_126769 ) ( ON ?auto_126764 ?auto_126763 ) ( not ( = ?auto_126763 ?auto_126764 ) ) ( not ( = ?auto_126763 ?auto_126765 ) ) ( not ( = ?auto_126763 ?auto_126766 ) ) ( not ( = ?auto_126763 ?auto_126772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126764 ?auto_126765 ?auto_126766 )
      ( MAKE-3CRATE-VERIFY ?auto_126763 ?auto_126764 ?auto_126765 ?auto_126766 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126773 - SURFACE
      ?auto_126774 - SURFACE
      ?auto_126775 - SURFACE
      ?auto_126777 - SURFACE
      ?auto_126776 - SURFACE
    )
    :vars
    (
      ?auto_126782 - HOIST
      ?auto_126778 - PLACE
      ?auto_126780 - PLACE
      ?auto_126781 - HOIST
      ?auto_126783 - SURFACE
      ?auto_126779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126782 ?auto_126778 ) ( IS-CRATE ?auto_126776 ) ( not ( = ?auto_126777 ?auto_126776 ) ) ( not ( = ?auto_126775 ?auto_126777 ) ) ( not ( = ?auto_126775 ?auto_126776 ) ) ( not ( = ?auto_126780 ?auto_126778 ) ) ( HOIST-AT ?auto_126781 ?auto_126780 ) ( not ( = ?auto_126782 ?auto_126781 ) ) ( AVAILABLE ?auto_126781 ) ( SURFACE-AT ?auto_126776 ?auto_126780 ) ( ON ?auto_126776 ?auto_126783 ) ( CLEAR ?auto_126776 ) ( not ( = ?auto_126777 ?auto_126783 ) ) ( not ( = ?auto_126776 ?auto_126783 ) ) ( not ( = ?auto_126775 ?auto_126783 ) ) ( SURFACE-AT ?auto_126775 ?auto_126778 ) ( CLEAR ?auto_126775 ) ( IS-CRATE ?auto_126777 ) ( AVAILABLE ?auto_126782 ) ( IN ?auto_126777 ?auto_126779 ) ( TRUCK-AT ?auto_126779 ?auto_126780 ) ( ON ?auto_126774 ?auto_126773 ) ( ON ?auto_126775 ?auto_126774 ) ( not ( = ?auto_126773 ?auto_126774 ) ) ( not ( = ?auto_126773 ?auto_126775 ) ) ( not ( = ?auto_126773 ?auto_126777 ) ) ( not ( = ?auto_126773 ?auto_126776 ) ) ( not ( = ?auto_126773 ?auto_126783 ) ) ( not ( = ?auto_126774 ?auto_126775 ) ) ( not ( = ?auto_126774 ?auto_126777 ) ) ( not ( = ?auto_126774 ?auto_126776 ) ) ( not ( = ?auto_126774 ?auto_126783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126775 ?auto_126777 ?auto_126776 )
      ( MAKE-4CRATE-VERIFY ?auto_126773 ?auto_126774 ?auto_126775 ?auto_126777 ?auto_126776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126784 - SURFACE
      ?auto_126785 - SURFACE
    )
    :vars
    (
      ?auto_126790 - HOIST
      ?auto_126786 - PLACE
      ?auto_126791 - SURFACE
      ?auto_126788 - PLACE
      ?auto_126789 - HOIST
      ?auto_126792 - SURFACE
      ?auto_126787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126790 ?auto_126786 ) ( IS-CRATE ?auto_126785 ) ( not ( = ?auto_126784 ?auto_126785 ) ) ( not ( = ?auto_126791 ?auto_126784 ) ) ( not ( = ?auto_126791 ?auto_126785 ) ) ( not ( = ?auto_126788 ?auto_126786 ) ) ( HOIST-AT ?auto_126789 ?auto_126788 ) ( not ( = ?auto_126790 ?auto_126789 ) ) ( SURFACE-AT ?auto_126785 ?auto_126788 ) ( ON ?auto_126785 ?auto_126792 ) ( CLEAR ?auto_126785 ) ( not ( = ?auto_126784 ?auto_126792 ) ) ( not ( = ?auto_126785 ?auto_126792 ) ) ( not ( = ?auto_126791 ?auto_126792 ) ) ( SURFACE-AT ?auto_126791 ?auto_126786 ) ( CLEAR ?auto_126791 ) ( IS-CRATE ?auto_126784 ) ( AVAILABLE ?auto_126790 ) ( TRUCK-AT ?auto_126787 ?auto_126788 ) ( LIFTING ?auto_126789 ?auto_126784 ) )
    :subtasks
    ( ( !LOAD ?auto_126789 ?auto_126784 ?auto_126787 ?auto_126788 )
      ( MAKE-2CRATE ?auto_126791 ?auto_126784 ?auto_126785 )
      ( MAKE-1CRATE-VERIFY ?auto_126784 ?auto_126785 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126793 - SURFACE
      ?auto_126794 - SURFACE
      ?auto_126795 - SURFACE
    )
    :vars
    (
      ?auto_126801 - HOIST
      ?auto_126799 - PLACE
      ?auto_126797 - PLACE
      ?auto_126798 - HOIST
      ?auto_126796 - SURFACE
      ?auto_126800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126801 ?auto_126799 ) ( IS-CRATE ?auto_126795 ) ( not ( = ?auto_126794 ?auto_126795 ) ) ( not ( = ?auto_126793 ?auto_126794 ) ) ( not ( = ?auto_126793 ?auto_126795 ) ) ( not ( = ?auto_126797 ?auto_126799 ) ) ( HOIST-AT ?auto_126798 ?auto_126797 ) ( not ( = ?auto_126801 ?auto_126798 ) ) ( SURFACE-AT ?auto_126795 ?auto_126797 ) ( ON ?auto_126795 ?auto_126796 ) ( CLEAR ?auto_126795 ) ( not ( = ?auto_126794 ?auto_126796 ) ) ( not ( = ?auto_126795 ?auto_126796 ) ) ( not ( = ?auto_126793 ?auto_126796 ) ) ( SURFACE-AT ?auto_126793 ?auto_126799 ) ( CLEAR ?auto_126793 ) ( IS-CRATE ?auto_126794 ) ( AVAILABLE ?auto_126801 ) ( TRUCK-AT ?auto_126800 ?auto_126797 ) ( LIFTING ?auto_126798 ?auto_126794 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126794 ?auto_126795 )
      ( MAKE-2CRATE-VERIFY ?auto_126793 ?auto_126794 ?auto_126795 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126802 - SURFACE
      ?auto_126803 - SURFACE
      ?auto_126804 - SURFACE
      ?auto_126805 - SURFACE
    )
    :vars
    (
      ?auto_126808 - HOIST
      ?auto_126806 - PLACE
      ?auto_126811 - PLACE
      ?auto_126809 - HOIST
      ?auto_126807 - SURFACE
      ?auto_126810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126808 ?auto_126806 ) ( IS-CRATE ?auto_126805 ) ( not ( = ?auto_126804 ?auto_126805 ) ) ( not ( = ?auto_126803 ?auto_126804 ) ) ( not ( = ?auto_126803 ?auto_126805 ) ) ( not ( = ?auto_126811 ?auto_126806 ) ) ( HOIST-AT ?auto_126809 ?auto_126811 ) ( not ( = ?auto_126808 ?auto_126809 ) ) ( SURFACE-AT ?auto_126805 ?auto_126811 ) ( ON ?auto_126805 ?auto_126807 ) ( CLEAR ?auto_126805 ) ( not ( = ?auto_126804 ?auto_126807 ) ) ( not ( = ?auto_126805 ?auto_126807 ) ) ( not ( = ?auto_126803 ?auto_126807 ) ) ( SURFACE-AT ?auto_126803 ?auto_126806 ) ( CLEAR ?auto_126803 ) ( IS-CRATE ?auto_126804 ) ( AVAILABLE ?auto_126808 ) ( TRUCK-AT ?auto_126810 ?auto_126811 ) ( LIFTING ?auto_126809 ?auto_126804 ) ( ON ?auto_126803 ?auto_126802 ) ( not ( = ?auto_126802 ?auto_126803 ) ) ( not ( = ?auto_126802 ?auto_126804 ) ) ( not ( = ?auto_126802 ?auto_126805 ) ) ( not ( = ?auto_126802 ?auto_126807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126803 ?auto_126804 ?auto_126805 )
      ( MAKE-3CRATE-VERIFY ?auto_126802 ?auto_126803 ?auto_126804 ?auto_126805 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126812 - SURFACE
      ?auto_126813 - SURFACE
      ?auto_126814 - SURFACE
      ?auto_126816 - SURFACE
      ?auto_126815 - SURFACE
    )
    :vars
    (
      ?auto_126819 - HOIST
      ?auto_126817 - PLACE
      ?auto_126822 - PLACE
      ?auto_126820 - HOIST
      ?auto_126818 - SURFACE
      ?auto_126821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126819 ?auto_126817 ) ( IS-CRATE ?auto_126815 ) ( not ( = ?auto_126816 ?auto_126815 ) ) ( not ( = ?auto_126814 ?auto_126816 ) ) ( not ( = ?auto_126814 ?auto_126815 ) ) ( not ( = ?auto_126822 ?auto_126817 ) ) ( HOIST-AT ?auto_126820 ?auto_126822 ) ( not ( = ?auto_126819 ?auto_126820 ) ) ( SURFACE-AT ?auto_126815 ?auto_126822 ) ( ON ?auto_126815 ?auto_126818 ) ( CLEAR ?auto_126815 ) ( not ( = ?auto_126816 ?auto_126818 ) ) ( not ( = ?auto_126815 ?auto_126818 ) ) ( not ( = ?auto_126814 ?auto_126818 ) ) ( SURFACE-AT ?auto_126814 ?auto_126817 ) ( CLEAR ?auto_126814 ) ( IS-CRATE ?auto_126816 ) ( AVAILABLE ?auto_126819 ) ( TRUCK-AT ?auto_126821 ?auto_126822 ) ( LIFTING ?auto_126820 ?auto_126816 ) ( ON ?auto_126813 ?auto_126812 ) ( ON ?auto_126814 ?auto_126813 ) ( not ( = ?auto_126812 ?auto_126813 ) ) ( not ( = ?auto_126812 ?auto_126814 ) ) ( not ( = ?auto_126812 ?auto_126816 ) ) ( not ( = ?auto_126812 ?auto_126815 ) ) ( not ( = ?auto_126812 ?auto_126818 ) ) ( not ( = ?auto_126813 ?auto_126814 ) ) ( not ( = ?auto_126813 ?auto_126816 ) ) ( not ( = ?auto_126813 ?auto_126815 ) ) ( not ( = ?auto_126813 ?auto_126818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126814 ?auto_126816 ?auto_126815 )
      ( MAKE-4CRATE-VERIFY ?auto_126812 ?auto_126813 ?auto_126814 ?auto_126816 ?auto_126815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126823 - SURFACE
      ?auto_126824 - SURFACE
    )
    :vars
    (
      ?auto_126828 - HOIST
      ?auto_126826 - PLACE
      ?auto_126825 - SURFACE
      ?auto_126831 - PLACE
      ?auto_126829 - HOIST
      ?auto_126827 - SURFACE
      ?auto_126830 - TRUCK
      ?auto_126832 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126828 ?auto_126826 ) ( IS-CRATE ?auto_126824 ) ( not ( = ?auto_126823 ?auto_126824 ) ) ( not ( = ?auto_126825 ?auto_126823 ) ) ( not ( = ?auto_126825 ?auto_126824 ) ) ( not ( = ?auto_126831 ?auto_126826 ) ) ( HOIST-AT ?auto_126829 ?auto_126831 ) ( not ( = ?auto_126828 ?auto_126829 ) ) ( SURFACE-AT ?auto_126824 ?auto_126831 ) ( ON ?auto_126824 ?auto_126827 ) ( CLEAR ?auto_126824 ) ( not ( = ?auto_126823 ?auto_126827 ) ) ( not ( = ?auto_126824 ?auto_126827 ) ) ( not ( = ?auto_126825 ?auto_126827 ) ) ( SURFACE-AT ?auto_126825 ?auto_126826 ) ( CLEAR ?auto_126825 ) ( IS-CRATE ?auto_126823 ) ( AVAILABLE ?auto_126828 ) ( TRUCK-AT ?auto_126830 ?auto_126831 ) ( AVAILABLE ?auto_126829 ) ( SURFACE-AT ?auto_126823 ?auto_126831 ) ( ON ?auto_126823 ?auto_126832 ) ( CLEAR ?auto_126823 ) ( not ( = ?auto_126823 ?auto_126832 ) ) ( not ( = ?auto_126824 ?auto_126832 ) ) ( not ( = ?auto_126825 ?auto_126832 ) ) ( not ( = ?auto_126827 ?auto_126832 ) ) )
    :subtasks
    ( ( !LIFT ?auto_126829 ?auto_126823 ?auto_126832 ?auto_126831 )
      ( MAKE-2CRATE ?auto_126825 ?auto_126823 ?auto_126824 )
      ( MAKE-1CRATE-VERIFY ?auto_126823 ?auto_126824 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126833 - SURFACE
      ?auto_126834 - SURFACE
      ?auto_126835 - SURFACE
    )
    :vars
    (
      ?auto_126837 - HOIST
      ?auto_126838 - PLACE
      ?auto_126841 - PLACE
      ?auto_126836 - HOIST
      ?auto_126840 - SURFACE
      ?auto_126839 - TRUCK
      ?auto_126842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126837 ?auto_126838 ) ( IS-CRATE ?auto_126835 ) ( not ( = ?auto_126834 ?auto_126835 ) ) ( not ( = ?auto_126833 ?auto_126834 ) ) ( not ( = ?auto_126833 ?auto_126835 ) ) ( not ( = ?auto_126841 ?auto_126838 ) ) ( HOIST-AT ?auto_126836 ?auto_126841 ) ( not ( = ?auto_126837 ?auto_126836 ) ) ( SURFACE-AT ?auto_126835 ?auto_126841 ) ( ON ?auto_126835 ?auto_126840 ) ( CLEAR ?auto_126835 ) ( not ( = ?auto_126834 ?auto_126840 ) ) ( not ( = ?auto_126835 ?auto_126840 ) ) ( not ( = ?auto_126833 ?auto_126840 ) ) ( SURFACE-AT ?auto_126833 ?auto_126838 ) ( CLEAR ?auto_126833 ) ( IS-CRATE ?auto_126834 ) ( AVAILABLE ?auto_126837 ) ( TRUCK-AT ?auto_126839 ?auto_126841 ) ( AVAILABLE ?auto_126836 ) ( SURFACE-AT ?auto_126834 ?auto_126841 ) ( ON ?auto_126834 ?auto_126842 ) ( CLEAR ?auto_126834 ) ( not ( = ?auto_126834 ?auto_126842 ) ) ( not ( = ?auto_126835 ?auto_126842 ) ) ( not ( = ?auto_126833 ?auto_126842 ) ) ( not ( = ?auto_126840 ?auto_126842 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126834 ?auto_126835 )
      ( MAKE-2CRATE-VERIFY ?auto_126833 ?auto_126834 ?auto_126835 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126843 - SURFACE
      ?auto_126844 - SURFACE
      ?auto_126845 - SURFACE
      ?auto_126846 - SURFACE
    )
    :vars
    (
      ?auto_126852 - HOIST
      ?auto_126849 - PLACE
      ?auto_126847 - PLACE
      ?auto_126850 - HOIST
      ?auto_126853 - SURFACE
      ?auto_126851 - TRUCK
      ?auto_126848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126852 ?auto_126849 ) ( IS-CRATE ?auto_126846 ) ( not ( = ?auto_126845 ?auto_126846 ) ) ( not ( = ?auto_126844 ?auto_126845 ) ) ( not ( = ?auto_126844 ?auto_126846 ) ) ( not ( = ?auto_126847 ?auto_126849 ) ) ( HOIST-AT ?auto_126850 ?auto_126847 ) ( not ( = ?auto_126852 ?auto_126850 ) ) ( SURFACE-AT ?auto_126846 ?auto_126847 ) ( ON ?auto_126846 ?auto_126853 ) ( CLEAR ?auto_126846 ) ( not ( = ?auto_126845 ?auto_126853 ) ) ( not ( = ?auto_126846 ?auto_126853 ) ) ( not ( = ?auto_126844 ?auto_126853 ) ) ( SURFACE-AT ?auto_126844 ?auto_126849 ) ( CLEAR ?auto_126844 ) ( IS-CRATE ?auto_126845 ) ( AVAILABLE ?auto_126852 ) ( TRUCK-AT ?auto_126851 ?auto_126847 ) ( AVAILABLE ?auto_126850 ) ( SURFACE-AT ?auto_126845 ?auto_126847 ) ( ON ?auto_126845 ?auto_126848 ) ( CLEAR ?auto_126845 ) ( not ( = ?auto_126845 ?auto_126848 ) ) ( not ( = ?auto_126846 ?auto_126848 ) ) ( not ( = ?auto_126844 ?auto_126848 ) ) ( not ( = ?auto_126853 ?auto_126848 ) ) ( ON ?auto_126844 ?auto_126843 ) ( not ( = ?auto_126843 ?auto_126844 ) ) ( not ( = ?auto_126843 ?auto_126845 ) ) ( not ( = ?auto_126843 ?auto_126846 ) ) ( not ( = ?auto_126843 ?auto_126853 ) ) ( not ( = ?auto_126843 ?auto_126848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126844 ?auto_126845 ?auto_126846 )
      ( MAKE-3CRATE-VERIFY ?auto_126843 ?auto_126844 ?auto_126845 ?auto_126846 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126854 - SURFACE
      ?auto_126855 - SURFACE
      ?auto_126856 - SURFACE
      ?auto_126858 - SURFACE
      ?auto_126857 - SURFACE
    )
    :vars
    (
      ?auto_126864 - HOIST
      ?auto_126861 - PLACE
      ?auto_126859 - PLACE
      ?auto_126862 - HOIST
      ?auto_126865 - SURFACE
      ?auto_126863 - TRUCK
      ?auto_126860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126864 ?auto_126861 ) ( IS-CRATE ?auto_126857 ) ( not ( = ?auto_126858 ?auto_126857 ) ) ( not ( = ?auto_126856 ?auto_126858 ) ) ( not ( = ?auto_126856 ?auto_126857 ) ) ( not ( = ?auto_126859 ?auto_126861 ) ) ( HOIST-AT ?auto_126862 ?auto_126859 ) ( not ( = ?auto_126864 ?auto_126862 ) ) ( SURFACE-AT ?auto_126857 ?auto_126859 ) ( ON ?auto_126857 ?auto_126865 ) ( CLEAR ?auto_126857 ) ( not ( = ?auto_126858 ?auto_126865 ) ) ( not ( = ?auto_126857 ?auto_126865 ) ) ( not ( = ?auto_126856 ?auto_126865 ) ) ( SURFACE-AT ?auto_126856 ?auto_126861 ) ( CLEAR ?auto_126856 ) ( IS-CRATE ?auto_126858 ) ( AVAILABLE ?auto_126864 ) ( TRUCK-AT ?auto_126863 ?auto_126859 ) ( AVAILABLE ?auto_126862 ) ( SURFACE-AT ?auto_126858 ?auto_126859 ) ( ON ?auto_126858 ?auto_126860 ) ( CLEAR ?auto_126858 ) ( not ( = ?auto_126858 ?auto_126860 ) ) ( not ( = ?auto_126857 ?auto_126860 ) ) ( not ( = ?auto_126856 ?auto_126860 ) ) ( not ( = ?auto_126865 ?auto_126860 ) ) ( ON ?auto_126855 ?auto_126854 ) ( ON ?auto_126856 ?auto_126855 ) ( not ( = ?auto_126854 ?auto_126855 ) ) ( not ( = ?auto_126854 ?auto_126856 ) ) ( not ( = ?auto_126854 ?auto_126858 ) ) ( not ( = ?auto_126854 ?auto_126857 ) ) ( not ( = ?auto_126854 ?auto_126865 ) ) ( not ( = ?auto_126854 ?auto_126860 ) ) ( not ( = ?auto_126855 ?auto_126856 ) ) ( not ( = ?auto_126855 ?auto_126858 ) ) ( not ( = ?auto_126855 ?auto_126857 ) ) ( not ( = ?auto_126855 ?auto_126865 ) ) ( not ( = ?auto_126855 ?auto_126860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126856 ?auto_126858 ?auto_126857 )
      ( MAKE-4CRATE-VERIFY ?auto_126854 ?auto_126855 ?auto_126856 ?auto_126858 ?auto_126857 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126866 - SURFACE
      ?auto_126867 - SURFACE
    )
    :vars
    (
      ?auto_126873 - HOIST
      ?auto_126870 - PLACE
      ?auto_126874 - SURFACE
      ?auto_126868 - PLACE
      ?auto_126871 - HOIST
      ?auto_126875 - SURFACE
      ?auto_126869 - SURFACE
      ?auto_126872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126873 ?auto_126870 ) ( IS-CRATE ?auto_126867 ) ( not ( = ?auto_126866 ?auto_126867 ) ) ( not ( = ?auto_126874 ?auto_126866 ) ) ( not ( = ?auto_126874 ?auto_126867 ) ) ( not ( = ?auto_126868 ?auto_126870 ) ) ( HOIST-AT ?auto_126871 ?auto_126868 ) ( not ( = ?auto_126873 ?auto_126871 ) ) ( SURFACE-AT ?auto_126867 ?auto_126868 ) ( ON ?auto_126867 ?auto_126875 ) ( CLEAR ?auto_126867 ) ( not ( = ?auto_126866 ?auto_126875 ) ) ( not ( = ?auto_126867 ?auto_126875 ) ) ( not ( = ?auto_126874 ?auto_126875 ) ) ( SURFACE-AT ?auto_126874 ?auto_126870 ) ( CLEAR ?auto_126874 ) ( IS-CRATE ?auto_126866 ) ( AVAILABLE ?auto_126873 ) ( AVAILABLE ?auto_126871 ) ( SURFACE-AT ?auto_126866 ?auto_126868 ) ( ON ?auto_126866 ?auto_126869 ) ( CLEAR ?auto_126866 ) ( not ( = ?auto_126866 ?auto_126869 ) ) ( not ( = ?auto_126867 ?auto_126869 ) ) ( not ( = ?auto_126874 ?auto_126869 ) ) ( not ( = ?auto_126875 ?auto_126869 ) ) ( TRUCK-AT ?auto_126872 ?auto_126870 ) )
    :subtasks
    ( ( !DRIVE ?auto_126872 ?auto_126870 ?auto_126868 )
      ( MAKE-2CRATE ?auto_126874 ?auto_126866 ?auto_126867 )
      ( MAKE-1CRATE-VERIFY ?auto_126866 ?auto_126867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126876 - SURFACE
      ?auto_126877 - SURFACE
      ?auto_126878 - SURFACE
    )
    :vars
    (
      ?auto_126885 - HOIST
      ?auto_126883 - PLACE
      ?auto_126884 - PLACE
      ?auto_126880 - HOIST
      ?auto_126881 - SURFACE
      ?auto_126879 - SURFACE
      ?auto_126882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126885 ?auto_126883 ) ( IS-CRATE ?auto_126878 ) ( not ( = ?auto_126877 ?auto_126878 ) ) ( not ( = ?auto_126876 ?auto_126877 ) ) ( not ( = ?auto_126876 ?auto_126878 ) ) ( not ( = ?auto_126884 ?auto_126883 ) ) ( HOIST-AT ?auto_126880 ?auto_126884 ) ( not ( = ?auto_126885 ?auto_126880 ) ) ( SURFACE-AT ?auto_126878 ?auto_126884 ) ( ON ?auto_126878 ?auto_126881 ) ( CLEAR ?auto_126878 ) ( not ( = ?auto_126877 ?auto_126881 ) ) ( not ( = ?auto_126878 ?auto_126881 ) ) ( not ( = ?auto_126876 ?auto_126881 ) ) ( SURFACE-AT ?auto_126876 ?auto_126883 ) ( CLEAR ?auto_126876 ) ( IS-CRATE ?auto_126877 ) ( AVAILABLE ?auto_126885 ) ( AVAILABLE ?auto_126880 ) ( SURFACE-AT ?auto_126877 ?auto_126884 ) ( ON ?auto_126877 ?auto_126879 ) ( CLEAR ?auto_126877 ) ( not ( = ?auto_126877 ?auto_126879 ) ) ( not ( = ?auto_126878 ?auto_126879 ) ) ( not ( = ?auto_126876 ?auto_126879 ) ) ( not ( = ?auto_126881 ?auto_126879 ) ) ( TRUCK-AT ?auto_126882 ?auto_126883 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126877 ?auto_126878 )
      ( MAKE-2CRATE-VERIFY ?auto_126876 ?auto_126877 ?auto_126878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126886 - SURFACE
      ?auto_126887 - SURFACE
      ?auto_126888 - SURFACE
      ?auto_126889 - SURFACE
    )
    :vars
    (
      ?auto_126892 - HOIST
      ?auto_126896 - PLACE
      ?auto_126894 - PLACE
      ?auto_126895 - HOIST
      ?auto_126890 - SURFACE
      ?auto_126893 - SURFACE
      ?auto_126891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126892 ?auto_126896 ) ( IS-CRATE ?auto_126889 ) ( not ( = ?auto_126888 ?auto_126889 ) ) ( not ( = ?auto_126887 ?auto_126888 ) ) ( not ( = ?auto_126887 ?auto_126889 ) ) ( not ( = ?auto_126894 ?auto_126896 ) ) ( HOIST-AT ?auto_126895 ?auto_126894 ) ( not ( = ?auto_126892 ?auto_126895 ) ) ( SURFACE-AT ?auto_126889 ?auto_126894 ) ( ON ?auto_126889 ?auto_126890 ) ( CLEAR ?auto_126889 ) ( not ( = ?auto_126888 ?auto_126890 ) ) ( not ( = ?auto_126889 ?auto_126890 ) ) ( not ( = ?auto_126887 ?auto_126890 ) ) ( SURFACE-AT ?auto_126887 ?auto_126896 ) ( CLEAR ?auto_126887 ) ( IS-CRATE ?auto_126888 ) ( AVAILABLE ?auto_126892 ) ( AVAILABLE ?auto_126895 ) ( SURFACE-AT ?auto_126888 ?auto_126894 ) ( ON ?auto_126888 ?auto_126893 ) ( CLEAR ?auto_126888 ) ( not ( = ?auto_126888 ?auto_126893 ) ) ( not ( = ?auto_126889 ?auto_126893 ) ) ( not ( = ?auto_126887 ?auto_126893 ) ) ( not ( = ?auto_126890 ?auto_126893 ) ) ( TRUCK-AT ?auto_126891 ?auto_126896 ) ( ON ?auto_126887 ?auto_126886 ) ( not ( = ?auto_126886 ?auto_126887 ) ) ( not ( = ?auto_126886 ?auto_126888 ) ) ( not ( = ?auto_126886 ?auto_126889 ) ) ( not ( = ?auto_126886 ?auto_126890 ) ) ( not ( = ?auto_126886 ?auto_126893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126887 ?auto_126888 ?auto_126889 )
      ( MAKE-3CRATE-VERIFY ?auto_126886 ?auto_126887 ?auto_126888 ?auto_126889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126897 - SURFACE
      ?auto_126898 - SURFACE
      ?auto_126899 - SURFACE
      ?auto_126901 - SURFACE
      ?auto_126900 - SURFACE
    )
    :vars
    (
      ?auto_126904 - HOIST
      ?auto_126908 - PLACE
      ?auto_126906 - PLACE
      ?auto_126907 - HOIST
      ?auto_126902 - SURFACE
      ?auto_126905 - SURFACE
      ?auto_126903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126904 ?auto_126908 ) ( IS-CRATE ?auto_126900 ) ( not ( = ?auto_126901 ?auto_126900 ) ) ( not ( = ?auto_126899 ?auto_126901 ) ) ( not ( = ?auto_126899 ?auto_126900 ) ) ( not ( = ?auto_126906 ?auto_126908 ) ) ( HOIST-AT ?auto_126907 ?auto_126906 ) ( not ( = ?auto_126904 ?auto_126907 ) ) ( SURFACE-AT ?auto_126900 ?auto_126906 ) ( ON ?auto_126900 ?auto_126902 ) ( CLEAR ?auto_126900 ) ( not ( = ?auto_126901 ?auto_126902 ) ) ( not ( = ?auto_126900 ?auto_126902 ) ) ( not ( = ?auto_126899 ?auto_126902 ) ) ( SURFACE-AT ?auto_126899 ?auto_126908 ) ( CLEAR ?auto_126899 ) ( IS-CRATE ?auto_126901 ) ( AVAILABLE ?auto_126904 ) ( AVAILABLE ?auto_126907 ) ( SURFACE-AT ?auto_126901 ?auto_126906 ) ( ON ?auto_126901 ?auto_126905 ) ( CLEAR ?auto_126901 ) ( not ( = ?auto_126901 ?auto_126905 ) ) ( not ( = ?auto_126900 ?auto_126905 ) ) ( not ( = ?auto_126899 ?auto_126905 ) ) ( not ( = ?auto_126902 ?auto_126905 ) ) ( TRUCK-AT ?auto_126903 ?auto_126908 ) ( ON ?auto_126898 ?auto_126897 ) ( ON ?auto_126899 ?auto_126898 ) ( not ( = ?auto_126897 ?auto_126898 ) ) ( not ( = ?auto_126897 ?auto_126899 ) ) ( not ( = ?auto_126897 ?auto_126901 ) ) ( not ( = ?auto_126897 ?auto_126900 ) ) ( not ( = ?auto_126897 ?auto_126902 ) ) ( not ( = ?auto_126897 ?auto_126905 ) ) ( not ( = ?auto_126898 ?auto_126899 ) ) ( not ( = ?auto_126898 ?auto_126901 ) ) ( not ( = ?auto_126898 ?auto_126900 ) ) ( not ( = ?auto_126898 ?auto_126902 ) ) ( not ( = ?auto_126898 ?auto_126905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126899 ?auto_126901 ?auto_126900 )
      ( MAKE-4CRATE-VERIFY ?auto_126897 ?auto_126898 ?auto_126899 ?auto_126901 ?auto_126900 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_126909 - SURFACE
      ?auto_126910 - SURFACE
    )
    :vars
    (
      ?auto_126914 - HOIST
      ?auto_126918 - PLACE
      ?auto_126913 - SURFACE
      ?auto_126916 - PLACE
      ?auto_126917 - HOIST
      ?auto_126911 - SURFACE
      ?auto_126915 - SURFACE
      ?auto_126912 - TRUCK
      ?auto_126919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126914 ?auto_126918 ) ( IS-CRATE ?auto_126910 ) ( not ( = ?auto_126909 ?auto_126910 ) ) ( not ( = ?auto_126913 ?auto_126909 ) ) ( not ( = ?auto_126913 ?auto_126910 ) ) ( not ( = ?auto_126916 ?auto_126918 ) ) ( HOIST-AT ?auto_126917 ?auto_126916 ) ( not ( = ?auto_126914 ?auto_126917 ) ) ( SURFACE-AT ?auto_126910 ?auto_126916 ) ( ON ?auto_126910 ?auto_126911 ) ( CLEAR ?auto_126910 ) ( not ( = ?auto_126909 ?auto_126911 ) ) ( not ( = ?auto_126910 ?auto_126911 ) ) ( not ( = ?auto_126913 ?auto_126911 ) ) ( IS-CRATE ?auto_126909 ) ( AVAILABLE ?auto_126917 ) ( SURFACE-AT ?auto_126909 ?auto_126916 ) ( ON ?auto_126909 ?auto_126915 ) ( CLEAR ?auto_126909 ) ( not ( = ?auto_126909 ?auto_126915 ) ) ( not ( = ?auto_126910 ?auto_126915 ) ) ( not ( = ?auto_126913 ?auto_126915 ) ) ( not ( = ?auto_126911 ?auto_126915 ) ) ( TRUCK-AT ?auto_126912 ?auto_126918 ) ( SURFACE-AT ?auto_126919 ?auto_126918 ) ( CLEAR ?auto_126919 ) ( LIFTING ?auto_126914 ?auto_126913 ) ( IS-CRATE ?auto_126913 ) ( not ( = ?auto_126919 ?auto_126913 ) ) ( not ( = ?auto_126909 ?auto_126919 ) ) ( not ( = ?auto_126910 ?auto_126919 ) ) ( not ( = ?auto_126911 ?auto_126919 ) ) ( not ( = ?auto_126915 ?auto_126919 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126919 ?auto_126913 )
      ( MAKE-2CRATE ?auto_126913 ?auto_126909 ?auto_126910 )
      ( MAKE-1CRATE-VERIFY ?auto_126909 ?auto_126910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126920 - SURFACE
      ?auto_126921 - SURFACE
      ?auto_126922 - SURFACE
    )
    :vars
    (
      ?auto_126923 - HOIST
      ?auto_126924 - PLACE
      ?auto_126926 - PLACE
      ?auto_126930 - HOIST
      ?auto_126925 - SURFACE
      ?auto_126927 - SURFACE
      ?auto_126929 - TRUCK
      ?auto_126928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126923 ?auto_126924 ) ( IS-CRATE ?auto_126922 ) ( not ( = ?auto_126921 ?auto_126922 ) ) ( not ( = ?auto_126920 ?auto_126921 ) ) ( not ( = ?auto_126920 ?auto_126922 ) ) ( not ( = ?auto_126926 ?auto_126924 ) ) ( HOIST-AT ?auto_126930 ?auto_126926 ) ( not ( = ?auto_126923 ?auto_126930 ) ) ( SURFACE-AT ?auto_126922 ?auto_126926 ) ( ON ?auto_126922 ?auto_126925 ) ( CLEAR ?auto_126922 ) ( not ( = ?auto_126921 ?auto_126925 ) ) ( not ( = ?auto_126922 ?auto_126925 ) ) ( not ( = ?auto_126920 ?auto_126925 ) ) ( IS-CRATE ?auto_126921 ) ( AVAILABLE ?auto_126930 ) ( SURFACE-AT ?auto_126921 ?auto_126926 ) ( ON ?auto_126921 ?auto_126927 ) ( CLEAR ?auto_126921 ) ( not ( = ?auto_126921 ?auto_126927 ) ) ( not ( = ?auto_126922 ?auto_126927 ) ) ( not ( = ?auto_126920 ?auto_126927 ) ) ( not ( = ?auto_126925 ?auto_126927 ) ) ( TRUCK-AT ?auto_126929 ?auto_126924 ) ( SURFACE-AT ?auto_126928 ?auto_126924 ) ( CLEAR ?auto_126928 ) ( LIFTING ?auto_126923 ?auto_126920 ) ( IS-CRATE ?auto_126920 ) ( not ( = ?auto_126928 ?auto_126920 ) ) ( not ( = ?auto_126921 ?auto_126928 ) ) ( not ( = ?auto_126922 ?auto_126928 ) ) ( not ( = ?auto_126925 ?auto_126928 ) ) ( not ( = ?auto_126927 ?auto_126928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126921 ?auto_126922 )
      ( MAKE-2CRATE-VERIFY ?auto_126920 ?auto_126921 ?auto_126922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_126931 - SURFACE
      ?auto_126932 - SURFACE
      ?auto_126933 - SURFACE
      ?auto_126934 - SURFACE
    )
    :vars
    (
      ?auto_126936 - HOIST
      ?auto_126935 - PLACE
      ?auto_126940 - PLACE
      ?auto_126937 - HOIST
      ?auto_126941 - SURFACE
      ?auto_126938 - SURFACE
      ?auto_126939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126936 ?auto_126935 ) ( IS-CRATE ?auto_126934 ) ( not ( = ?auto_126933 ?auto_126934 ) ) ( not ( = ?auto_126932 ?auto_126933 ) ) ( not ( = ?auto_126932 ?auto_126934 ) ) ( not ( = ?auto_126940 ?auto_126935 ) ) ( HOIST-AT ?auto_126937 ?auto_126940 ) ( not ( = ?auto_126936 ?auto_126937 ) ) ( SURFACE-AT ?auto_126934 ?auto_126940 ) ( ON ?auto_126934 ?auto_126941 ) ( CLEAR ?auto_126934 ) ( not ( = ?auto_126933 ?auto_126941 ) ) ( not ( = ?auto_126934 ?auto_126941 ) ) ( not ( = ?auto_126932 ?auto_126941 ) ) ( IS-CRATE ?auto_126933 ) ( AVAILABLE ?auto_126937 ) ( SURFACE-AT ?auto_126933 ?auto_126940 ) ( ON ?auto_126933 ?auto_126938 ) ( CLEAR ?auto_126933 ) ( not ( = ?auto_126933 ?auto_126938 ) ) ( not ( = ?auto_126934 ?auto_126938 ) ) ( not ( = ?auto_126932 ?auto_126938 ) ) ( not ( = ?auto_126941 ?auto_126938 ) ) ( TRUCK-AT ?auto_126939 ?auto_126935 ) ( SURFACE-AT ?auto_126931 ?auto_126935 ) ( CLEAR ?auto_126931 ) ( LIFTING ?auto_126936 ?auto_126932 ) ( IS-CRATE ?auto_126932 ) ( not ( = ?auto_126931 ?auto_126932 ) ) ( not ( = ?auto_126933 ?auto_126931 ) ) ( not ( = ?auto_126934 ?auto_126931 ) ) ( not ( = ?auto_126941 ?auto_126931 ) ) ( not ( = ?auto_126938 ?auto_126931 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126932 ?auto_126933 ?auto_126934 )
      ( MAKE-3CRATE-VERIFY ?auto_126931 ?auto_126932 ?auto_126933 ?auto_126934 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_126942 - SURFACE
      ?auto_126943 - SURFACE
      ?auto_126944 - SURFACE
      ?auto_126946 - SURFACE
      ?auto_126945 - SURFACE
    )
    :vars
    (
      ?auto_126948 - HOIST
      ?auto_126947 - PLACE
      ?auto_126952 - PLACE
      ?auto_126949 - HOIST
      ?auto_126953 - SURFACE
      ?auto_126950 - SURFACE
      ?auto_126951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126948 ?auto_126947 ) ( IS-CRATE ?auto_126945 ) ( not ( = ?auto_126946 ?auto_126945 ) ) ( not ( = ?auto_126944 ?auto_126946 ) ) ( not ( = ?auto_126944 ?auto_126945 ) ) ( not ( = ?auto_126952 ?auto_126947 ) ) ( HOIST-AT ?auto_126949 ?auto_126952 ) ( not ( = ?auto_126948 ?auto_126949 ) ) ( SURFACE-AT ?auto_126945 ?auto_126952 ) ( ON ?auto_126945 ?auto_126953 ) ( CLEAR ?auto_126945 ) ( not ( = ?auto_126946 ?auto_126953 ) ) ( not ( = ?auto_126945 ?auto_126953 ) ) ( not ( = ?auto_126944 ?auto_126953 ) ) ( IS-CRATE ?auto_126946 ) ( AVAILABLE ?auto_126949 ) ( SURFACE-AT ?auto_126946 ?auto_126952 ) ( ON ?auto_126946 ?auto_126950 ) ( CLEAR ?auto_126946 ) ( not ( = ?auto_126946 ?auto_126950 ) ) ( not ( = ?auto_126945 ?auto_126950 ) ) ( not ( = ?auto_126944 ?auto_126950 ) ) ( not ( = ?auto_126953 ?auto_126950 ) ) ( TRUCK-AT ?auto_126951 ?auto_126947 ) ( SURFACE-AT ?auto_126943 ?auto_126947 ) ( CLEAR ?auto_126943 ) ( LIFTING ?auto_126948 ?auto_126944 ) ( IS-CRATE ?auto_126944 ) ( not ( = ?auto_126943 ?auto_126944 ) ) ( not ( = ?auto_126946 ?auto_126943 ) ) ( not ( = ?auto_126945 ?auto_126943 ) ) ( not ( = ?auto_126953 ?auto_126943 ) ) ( not ( = ?auto_126950 ?auto_126943 ) ) ( ON ?auto_126943 ?auto_126942 ) ( not ( = ?auto_126942 ?auto_126943 ) ) ( not ( = ?auto_126942 ?auto_126944 ) ) ( not ( = ?auto_126942 ?auto_126946 ) ) ( not ( = ?auto_126942 ?auto_126945 ) ) ( not ( = ?auto_126942 ?auto_126953 ) ) ( not ( = ?auto_126942 ?auto_126950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_126944 ?auto_126946 ?auto_126945 )
      ( MAKE-4CRATE-VERIFY ?auto_126942 ?auto_126943 ?auto_126944 ?auto_126946 ?auto_126945 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127389 - SURFACE
      ?auto_127390 - SURFACE
      ?auto_127391 - SURFACE
      ?auto_127393 - SURFACE
      ?auto_127392 - SURFACE
      ?auto_127394 - SURFACE
    )
    :vars
    (
      ?auto_127396 - HOIST
      ?auto_127395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127396 ?auto_127395 ) ( SURFACE-AT ?auto_127392 ?auto_127395 ) ( CLEAR ?auto_127392 ) ( LIFTING ?auto_127396 ?auto_127394 ) ( IS-CRATE ?auto_127394 ) ( not ( = ?auto_127392 ?auto_127394 ) ) ( ON ?auto_127390 ?auto_127389 ) ( ON ?auto_127391 ?auto_127390 ) ( ON ?auto_127393 ?auto_127391 ) ( ON ?auto_127392 ?auto_127393 ) ( not ( = ?auto_127389 ?auto_127390 ) ) ( not ( = ?auto_127389 ?auto_127391 ) ) ( not ( = ?auto_127389 ?auto_127393 ) ) ( not ( = ?auto_127389 ?auto_127392 ) ) ( not ( = ?auto_127389 ?auto_127394 ) ) ( not ( = ?auto_127390 ?auto_127391 ) ) ( not ( = ?auto_127390 ?auto_127393 ) ) ( not ( = ?auto_127390 ?auto_127392 ) ) ( not ( = ?auto_127390 ?auto_127394 ) ) ( not ( = ?auto_127391 ?auto_127393 ) ) ( not ( = ?auto_127391 ?auto_127392 ) ) ( not ( = ?auto_127391 ?auto_127394 ) ) ( not ( = ?auto_127393 ?auto_127392 ) ) ( not ( = ?auto_127393 ?auto_127394 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_127392 ?auto_127394 )
      ( MAKE-5CRATE-VERIFY ?auto_127389 ?auto_127390 ?auto_127391 ?auto_127393 ?auto_127392 ?auto_127394 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127423 - SURFACE
      ?auto_127424 - SURFACE
      ?auto_127425 - SURFACE
      ?auto_127427 - SURFACE
      ?auto_127426 - SURFACE
      ?auto_127428 - SURFACE
    )
    :vars
    (
      ?auto_127431 - HOIST
      ?auto_127430 - PLACE
      ?auto_127429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127431 ?auto_127430 ) ( SURFACE-AT ?auto_127426 ?auto_127430 ) ( CLEAR ?auto_127426 ) ( IS-CRATE ?auto_127428 ) ( not ( = ?auto_127426 ?auto_127428 ) ) ( TRUCK-AT ?auto_127429 ?auto_127430 ) ( AVAILABLE ?auto_127431 ) ( IN ?auto_127428 ?auto_127429 ) ( ON ?auto_127426 ?auto_127427 ) ( not ( = ?auto_127427 ?auto_127426 ) ) ( not ( = ?auto_127427 ?auto_127428 ) ) ( ON ?auto_127424 ?auto_127423 ) ( ON ?auto_127425 ?auto_127424 ) ( ON ?auto_127427 ?auto_127425 ) ( not ( = ?auto_127423 ?auto_127424 ) ) ( not ( = ?auto_127423 ?auto_127425 ) ) ( not ( = ?auto_127423 ?auto_127427 ) ) ( not ( = ?auto_127423 ?auto_127426 ) ) ( not ( = ?auto_127423 ?auto_127428 ) ) ( not ( = ?auto_127424 ?auto_127425 ) ) ( not ( = ?auto_127424 ?auto_127427 ) ) ( not ( = ?auto_127424 ?auto_127426 ) ) ( not ( = ?auto_127424 ?auto_127428 ) ) ( not ( = ?auto_127425 ?auto_127427 ) ) ( not ( = ?auto_127425 ?auto_127426 ) ) ( not ( = ?auto_127425 ?auto_127428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127427 ?auto_127426 ?auto_127428 )
      ( MAKE-5CRATE-VERIFY ?auto_127423 ?auto_127424 ?auto_127425 ?auto_127427 ?auto_127426 ?auto_127428 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127463 - SURFACE
      ?auto_127464 - SURFACE
      ?auto_127465 - SURFACE
      ?auto_127467 - SURFACE
      ?auto_127466 - SURFACE
      ?auto_127468 - SURFACE
    )
    :vars
    (
      ?auto_127472 - HOIST
      ?auto_127471 - PLACE
      ?auto_127470 - TRUCK
      ?auto_127469 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127472 ?auto_127471 ) ( SURFACE-AT ?auto_127466 ?auto_127471 ) ( CLEAR ?auto_127466 ) ( IS-CRATE ?auto_127468 ) ( not ( = ?auto_127466 ?auto_127468 ) ) ( AVAILABLE ?auto_127472 ) ( IN ?auto_127468 ?auto_127470 ) ( ON ?auto_127466 ?auto_127467 ) ( not ( = ?auto_127467 ?auto_127466 ) ) ( not ( = ?auto_127467 ?auto_127468 ) ) ( TRUCK-AT ?auto_127470 ?auto_127469 ) ( not ( = ?auto_127469 ?auto_127471 ) ) ( ON ?auto_127464 ?auto_127463 ) ( ON ?auto_127465 ?auto_127464 ) ( ON ?auto_127467 ?auto_127465 ) ( not ( = ?auto_127463 ?auto_127464 ) ) ( not ( = ?auto_127463 ?auto_127465 ) ) ( not ( = ?auto_127463 ?auto_127467 ) ) ( not ( = ?auto_127463 ?auto_127466 ) ) ( not ( = ?auto_127463 ?auto_127468 ) ) ( not ( = ?auto_127464 ?auto_127465 ) ) ( not ( = ?auto_127464 ?auto_127467 ) ) ( not ( = ?auto_127464 ?auto_127466 ) ) ( not ( = ?auto_127464 ?auto_127468 ) ) ( not ( = ?auto_127465 ?auto_127467 ) ) ( not ( = ?auto_127465 ?auto_127466 ) ) ( not ( = ?auto_127465 ?auto_127468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127467 ?auto_127466 ?auto_127468 )
      ( MAKE-5CRATE-VERIFY ?auto_127463 ?auto_127464 ?auto_127465 ?auto_127467 ?auto_127466 ?auto_127468 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127508 - SURFACE
      ?auto_127509 - SURFACE
      ?auto_127510 - SURFACE
      ?auto_127512 - SURFACE
      ?auto_127511 - SURFACE
      ?auto_127513 - SURFACE
    )
    :vars
    (
      ?auto_127517 - HOIST
      ?auto_127516 - PLACE
      ?auto_127514 - TRUCK
      ?auto_127518 - PLACE
      ?auto_127515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_127517 ?auto_127516 ) ( SURFACE-AT ?auto_127511 ?auto_127516 ) ( CLEAR ?auto_127511 ) ( IS-CRATE ?auto_127513 ) ( not ( = ?auto_127511 ?auto_127513 ) ) ( AVAILABLE ?auto_127517 ) ( ON ?auto_127511 ?auto_127512 ) ( not ( = ?auto_127512 ?auto_127511 ) ) ( not ( = ?auto_127512 ?auto_127513 ) ) ( TRUCK-AT ?auto_127514 ?auto_127518 ) ( not ( = ?auto_127518 ?auto_127516 ) ) ( HOIST-AT ?auto_127515 ?auto_127518 ) ( LIFTING ?auto_127515 ?auto_127513 ) ( not ( = ?auto_127517 ?auto_127515 ) ) ( ON ?auto_127509 ?auto_127508 ) ( ON ?auto_127510 ?auto_127509 ) ( ON ?auto_127512 ?auto_127510 ) ( not ( = ?auto_127508 ?auto_127509 ) ) ( not ( = ?auto_127508 ?auto_127510 ) ) ( not ( = ?auto_127508 ?auto_127512 ) ) ( not ( = ?auto_127508 ?auto_127511 ) ) ( not ( = ?auto_127508 ?auto_127513 ) ) ( not ( = ?auto_127509 ?auto_127510 ) ) ( not ( = ?auto_127509 ?auto_127512 ) ) ( not ( = ?auto_127509 ?auto_127511 ) ) ( not ( = ?auto_127509 ?auto_127513 ) ) ( not ( = ?auto_127510 ?auto_127512 ) ) ( not ( = ?auto_127510 ?auto_127511 ) ) ( not ( = ?auto_127510 ?auto_127513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127512 ?auto_127511 ?auto_127513 )
      ( MAKE-5CRATE-VERIFY ?auto_127508 ?auto_127509 ?auto_127510 ?auto_127512 ?auto_127511 ?auto_127513 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127558 - SURFACE
      ?auto_127559 - SURFACE
      ?auto_127560 - SURFACE
      ?auto_127562 - SURFACE
      ?auto_127561 - SURFACE
      ?auto_127563 - SURFACE
    )
    :vars
    (
      ?auto_127564 - HOIST
      ?auto_127565 - PLACE
      ?auto_127567 - TRUCK
      ?auto_127566 - PLACE
      ?auto_127568 - HOIST
      ?auto_127569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_127564 ?auto_127565 ) ( SURFACE-AT ?auto_127561 ?auto_127565 ) ( CLEAR ?auto_127561 ) ( IS-CRATE ?auto_127563 ) ( not ( = ?auto_127561 ?auto_127563 ) ) ( AVAILABLE ?auto_127564 ) ( ON ?auto_127561 ?auto_127562 ) ( not ( = ?auto_127562 ?auto_127561 ) ) ( not ( = ?auto_127562 ?auto_127563 ) ) ( TRUCK-AT ?auto_127567 ?auto_127566 ) ( not ( = ?auto_127566 ?auto_127565 ) ) ( HOIST-AT ?auto_127568 ?auto_127566 ) ( not ( = ?auto_127564 ?auto_127568 ) ) ( AVAILABLE ?auto_127568 ) ( SURFACE-AT ?auto_127563 ?auto_127566 ) ( ON ?auto_127563 ?auto_127569 ) ( CLEAR ?auto_127563 ) ( not ( = ?auto_127561 ?auto_127569 ) ) ( not ( = ?auto_127563 ?auto_127569 ) ) ( not ( = ?auto_127562 ?auto_127569 ) ) ( ON ?auto_127559 ?auto_127558 ) ( ON ?auto_127560 ?auto_127559 ) ( ON ?auto_127562 ?auto_127560 ) ( not ( = ?auto_127558 ?auto_127559 ) ) ( not ( = ?auto_127558 ?auto_127560 ) ) ( not ( = ?auto_127558 ?auto_127562 ) ) ( not ( = ?auto_127558 ?auto_127561 ) ) ( not ( = ?auto_127558 ?auto_127563 ) ) ( not ( = ?auto_127558 ?auto_127569 ) ) ( not ( = ?auto_127559 ?auto_127560 ) ) ( not ( = ?auto_127559 ?auto_127562 ) ) ( not ( = ?auto_127559 ?auto_127561 ) ) ( not ( = ?auto_127559 ?auto_127563 ) ) ( not ( = ?auto_127559 ?auto_127569 ) ) ( not ( = ?auto_127560 ?auto_127562 ) ) ( not ( = ?auto_127560 ?auto_127561 ) ) ( not ( = ?auto_127560 ?auto_127563 ) ) ( not ( = ?auto_127560 ?auto_127569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127562 ?auto_127561 ?auto_127563 )
      ( MAKE-5CRATE-VERIFY ?auto_127558 ?auto_127559 ?auto_127560 ?auto_127562 ?auto_127561 ?auto_127563 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127609 - SURFACE
      ?auto_127610 - SURFACE
      ?auto_127611 - SURFACE
      ?auto_127613 - SURFACE
      ?auto_127612 - SURFACE
      ?auto_127614 - SURFACE
    )
    :vars
    (
      ?auto_127615 - HOIST
      ?auto_127619 - PLACE
      ?auto_127620 - PLACE
      ?auto_127617 - HOIST
      ?auto_127618 - SURFACE
      ?auto_127616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127615 ?auto_127619 ) ( SURFACE-AT ?auto_127612 ?auto_127619 ) ( CLEAR ?auto_127612 ) ( IS-CRATE ?auto_127614 ) ( not ( = ?auto_127612 ?auto_127614 ) ) ( AVAILABLE ?auto_127615 ) ( ON ?auto_127612 ?auto_127613 ) ( not ( = ?auto_127613 ?auto_127612 ) ) ( not ( = ?auto_127613 ?auto_127614 ) ) ( not ( = ?auto_127620 ?auto_127619 ) ) ( HOIST-AT ?auto_127617 ?auto_127620 ) ( not ( = ?auto_127615 ?auto_127617 ) ) ( AVAILABLE ?auto_127617 ) ( SURFACE-AT ?auto_127614 ?auto_127620 ) ( ON ?auto_127614 ?auto_127618 ) ( CLEAR ?auto_127614 ) ( not ( = ?auto_127612 ?auto_127618 ) ) ( not ( = ?auto_127614 ?auto_127618 ) ) ( not ( = ?auto_127613 ?auto_127618 ) ) ( TRUCK-AT ?auto_127616 ?auto_127619 ) ( ON ?auto_127610 ?auto_127609 ) ( ON ?auto_127611 ?auto_127610 ) ( ON ?auto_127613 ?auto_127611 ) ( not ( = ?auto_127609 ?auto_127610 ) ) ( not ( = ?auto_127609 ?auto_127611 ) ) ( not ( = ?auto_127609 ?auto_127613 ) ) ( not ( = ?auto_127609 ?auto_127612 ) ) ( not ( = ?auto_127609 ?auto_127614 ) ) ( not ( = ?auto_127609 ?auto_127618 ) ) ( not ( = ?auto_127610 ?auto_127611 ) ) ( not ( = ?auto_127610 ?auto_127613 ) ) ( not ( = ?auto_127610 ?auto_127612 ) ) ( not ( = ?auto_127610 ?auto_127614 ) ) ( not ( = ?auto_127610 ?auto_127618 ) ) ( not ( = ?auto_127611 ?auto_127613 ) ) ( not ( = ?auto_127611 ?auto_127612 ) ) ( not ( = ?auto_127611 ?auto_127614 ) ) ( not ( = ?auto_127611 ?auto_127618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127613 ?auto_127612 ?auto_127614 )
      ( MAKE-5CRATE-VERIFY ?auto_127609 ?auto_127610 ?auto_127611 ?auto_127613 ?auto_127612 ?auto_127614 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127660 - SURFACE
      ?auto_127661 - SURFACE
      ?auto_127662 - SURFACE
      ?auto_127664 - SURFACE
      ?auto_127663 - SURFACE
      ?auto_127665 - SURFACE
    )
    :vars
    (
      ?auto_127666 - HOIST
      ?auto_127671 - PLACE
      ?auto_127670 - PLACE
      ?auto_127669 - HOIST
      ?auto_127668 - SURFACE
      ?auto_127667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127666 ?auto_127671 ) ( IS-CRATE ?auto_127665 ) ( not ( = ?auto_127663 ?auto_127665 ) ) ( not ( = ?auto_127664 ?auto_127663 ) ) ( not ( = ?auto_127664 ?auto_127665 ) ) ( not ( = ?auto_127670 ?auto_127671 ) ) ( HOIST-AT ?auto_127669 ?auto_127670 ) ( not ( = ?auto_127666 ?auto_127669 ) ) ( AVAILABLE ?auto_127669 ) ( SURFACE-AT ?auto_127665 ?auto_127670 ) ( ON ?auto_127665 ?auto_127668 ) ( CLEAR ?auto_127665 ) ( not ( = ?auto_127663 ?auto_127668 ) ) ( not ( = ?auto_127665 ?auto_127668 ) ) ( not ( = ?auto_127664 ?auto_127668 ) ) ( TRUCK-AT ?auto_127667 ?auto_127671 ) ( SURFACE-AT ?auto_127664 ?auto_127671 ) ( CLEAR ?auto_127664 ) ( LIFTING ?auto_127666 ?auto_127663 ) ( IS-CRATE ?auto_127663 ) ( ON ?auto_127661 ?auto_127660 ) ( ON ?auto_127662 ?auto_127661 ) ( ON ?auto_127664 ?auto_127662 ) ( not ( = ?auto_127660 ?auto_127661 ) ) ( not ( = ?auto_127660 ?auto_127662 ) ) ( not ( = ?auto_127660 ?auto_127664 ) ) ( not ( = ?auto_127660 ?auto_127663 ) ) ( not ( = ?auto_127660 ?auto_127665 ) ) ( not ( = ?auto_127660 ?auto_127668 ) ) ( not ( = ?auto_127661 ?auto_127662 ) ) ( not ( = ?auto_127661 ?auto_127664 ) ) ( not ( = ?auto_127661 ?auto_127663 ) ) ( not ( = ?auto_127661 ?auto_127665 ) ) ( not ( = ?auto_127661 ?auto_127668 ) ) ( not ( = ?auto_127662 ?auto_127664 ) ) ( not ( = ?auto_127662 ?auto_127663 ) ) ( not ( = ?auto_127662 ?auto_127665 ) ) ( not ( = ?auto_127662 ?auto_127668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127664 ?auto_127663 ?auto_127665 )
      ( MAKE-5CRATE-VERIFY ?auto_127660 ?auto_127661 ?auto_127662 ?auto_127664 ?auto_127663 ?auto_127665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_127711 - SURFACE
      ?auto_127712 - SURFACE
      ?auto_127713 - SURFACE
      ?auto_127715 - SURFACE
      ?auto_127714 - SURFACE
      ?auto_127716 - SURFACE
    )
    :vars
    (
      ?auto_127718 - HOIST
      ?auto_127721 - PLACE
      ?auto_127722 - PLACE
      ?auto_127717 - HOIST
      ?auto_127720 - SURFACE
      ?auto_127719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_127718 ?auto_127721 ) ( IS-CRATE ?auto_127716 ) ( not ( = ?auto_127714 ?auto_127716 ) ) ( not ( = ?auto_127715 ?auto_127714 ) ) ( not ( = ?auto_127715 ?auto_127716 ) ) ( not ( = ?auto_127722 ?auto_127721 ) ) ( HOIST-AT ?auto_127717 ?auto_127722 ) ( not ( = ?auto_127718 ?auto_127717 ) ) ( AVAILABLE ?auto_127717 ) ( SURFACE-AT ?auto_127716 ?auto_127722 ) ( ON ?auto_127716 ?auto_127720 ) ( CLEAR ?auto_127716 ) ( not ( = ?auto_127714 ?auto_127720 ) ) ( not ( = ?auto_127716 ?auto_127720 ) ) ( not ( = ?auto_127715 ?auto_127720 ) ) ( TRUCK-AT ?auto_127719 ?auto_127721 ) ( SURFACE-AT ?auto_127715 ?auto_127721 ) ( CLEAR ?auto_127715 ) ( IS-CRATE ?auto_127714 ) ( AVAILABLE ?auto_127718 ) ( IN ?auto_127714 ?auto_127719 ) ( ON ?auto_127712 ?auto_127711 ) ( ON ?auto_127713 ?auto_127712 ) ( ON ?auto_127715 ?auto_127713 ) ( not ( = ?auto_127711 ?auto_127712 ) ) ( not ( = ?auto_127711 ?auto_127713 ) ) ( not ( = ?auto_127711 ?auto_127715 ) ) ( not ( = ?auto_127711 ?auto_127714 ) ) ( not ( = ?auto_127711 ?auto_127716 ) ) ( not ( = ?auto_127711 ?auto_127720 ) ) ( not ( = ?auto_127712 ?auto_127713 ) ) ( not ( = ?auto_127712 ?auto_127715 ) ) ( not ( = ?auto_127712 ?auto_127714 ) ) ( not ( = ?auto_127712 ?auto_127716 ) ) ( not ( = ?auto_127712 ?auto_127720 ) ) ( not ( = ?auto_127713 ?auto_127715 ) ) ( not ( = ?auto_127713 ?auto_127714 ) ) ( not ( = ?auto_127713 ?auto_127716 ) ) ( not ( = ?auto_127713 ?auto_127720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_127715 ?auto_127714 ?auto_127716 )
      ( MAKE-5CRATE-VERIFY ?auto_127711 ?auto_127712 ?auto_127713 ?auto_127715 ?auto_127714 ?auto_127716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_128079 - SURFACE
      ?auto_128080 - SURFACE
    )
    :vars
    (
      ?auto_128085 - HOIST
      ?auto_128083 - PLACE
      ?auto_128084 - SURFACE
      ?auto_128086 - PLACE
      ?auto_128082 - HOIST
      ?auto_128087 - SURFACE
      ?auto_128081 - TRUCK
      ?auto_128088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_128085 ?auto_128083 ) ( SURFACE-AT ?auto_128079 ?auto_128083 ) ( CLEAR ?auto_128079 ) ( IS-CRATE ?auto_128080 ) ( not ( = ?auto_128079 ?auto_128080 ) ) ( ON ?auto_128079 ?auto_128084 ) ( not ( = ?auto_128084 ?auto_128079 ) ) ( not ( = ?auto_128084 ?auto_128080 ) ) ( not ( = ?auto_128086 ?auto_128083 ) ) ( HOIST-AT ?auto_128082 ?auto_128086 ) ( not ( = ?auto_128085 ?auto_128082 ) ) ( AVAILABLE ?auto_128082 ) ( SURFACE-AT ?auto_128080 ?auto_128086 ) ( ON ?auto_128080 ?auto_128087 ) ( CLEAR ?auto_128080 ) ( not ( = ?auto_128079 ?auto_128087 ) ) ( not ( = ?auto_128080 ?auto_128087 ) ) ( not ( = ?auto_128084 ?auto_128087 ) ) ( TRUCK-AT ?auto_128081 ?auto_128083 ) ( LIFTING ?auto_128085 ?auto_128088 ) ( IS-CRATE ?auto_128088 ) ( not ( = ?auto_128079 ?auto_128088 ) ) ( not ( = ?auto_128080 ?auto_128088 ) ) ( not ( = ?auto_128084 ?auto_128088 ) ) ( not ( = ?auto_128087 ?auto_128088 ) ) )
    :subtasks
    ( ( !LOAD ?auto_128085 ?auto_128088 ?auto_128081 ?auto_128083 )
      ( MAKE-1CRATE ?auto_128079 ?auto_128080 )
      ( MAKE-1CRATE-VERIFY ?auto_128079 ?auto_128080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_128387 - SURFACE
      ?auto_128388 - SURFACE
    )
    :vars
    (
      ?auto_128393 - HOIST
      ?auto_128392 - PLACE
      ?auto_128390 - SURFACE
      ?auto_128389 - TRUCK
      ?auto_128391 - PLACE
      ?auto_128395 - HOIST
      ?auto_128394 - SURFACE
      ?auto_128396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_128393 ?auto_128392 ) ( SURFACE-AT ?auto_128387 ?auto_128392 ) ( CLEAR ?auto_128387 ) ( IS-CRATE ?auto_128388 ) ( not ( = ?auto_128387 ?auto_128388 ) ) ( AVAILABLE ?auto_128393 ) ( ON ?auto_128387 ?auto_128390 ) ( not ( = ?auto_128390 ?auto_128387 ) ) ( not ( = ?auto_128390 ?auto_128388 ) ) ( TRUCK-AT ?auto_128389 ?auto_128391 ) ( not ( = ?auto_128391 ?auto_128392 ) ) ( HOIST-AT ?auto_128395 ?auto_128391 ) ( not ( = ?auto_128393 ?auto_128395 ) ) ( SURFACE-AT ?auto_128388 ?auto_128391 ) ( ON ?auto_128388 ?auto_128394 ) ( CLEAR ?auto_128388 ) ( not ( = ?auto_128387 ?auto_128394 ) ) ( not ( = ?auto_128388 ?auto_128394 ) ) ( not ( = ?auto_128390 ?auto_128394 ) ) ( LIFTING ?auto_128395 ?auto_128396 ) ( IS-CRATE ?auto_128396 ) ( not ( = ?auto_128387 ?auto_128396 ) ) ( not ( = ?auto_128388 ?auto_128396 ) ) ( not ( = ?auto_128390 ?auto_128396 ) ) ( not ( = ?auto_128394 ?auto_128396 ) ) )
    :subtasks
    ( ( !LOAD ?auto_128395 ?auto_128396 ?auto_128389 ?auto_128391 )
      ( MAKE-1CRATE ?auto_128387 ?auto_128388 )
      ( MAKE-1CRATE-VERIFY ?auto_128387 ?auto_128388 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_128913 - SURFACE
      ?auto_128914 - SURFACE
      ?auto_128915 - SURFACE
      ?auto_128917 - SURFACE
      ?auto_128916 - SURFACE
      ?auto_128918 - SURFACE
      ?auto_128919 - SURFACE
    )
    :vars
    (
      ?auto_128921 - HOIST
      ?auto_128920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_128921 ?auto_128920 ) ( SURFACE-AT ?auto_128918 ?auto_128920 ) ( CLEAR ?auto_128918 ) ( LIFTING ?auto_128921 ?auto_128919 ) ( IS-CRATE ?auto_128919 ) ( not ( = ?auto_128918 ?auto_128919 ) ) ( ON ?auto_128914 ?auto_128913 ) ( ON ?auto_128915 ?auto_128914 ) ( ON ?auto_128917 ?auto_128915 ) ( ON ?auto_128916 ?auto_128917 ) ( ON ?auto_128918 ?auto_128916 ) ( not ( = ?auto_128913 ?auto_128914 ) ) ( not ( = ?auto_128913 ?auto_128915 ) ) ( not ( = ?auto_128913 ?auto_128917 ) ) ( not ( = ?auto_128913 ?auto_128916 ) ) ( not ( = ?auto_128913 ?auto_128918 ) ) ( not ( = ?auto_128913 ?auto_128919 ) ) ( not ( = ?auto_128914 ?auto_128915 ) ) ( not ( = ?auto_128914 ?auto_128917 ) ) ( not ( = ?auto_128914 ?auto_128916 ) ) ( not ( = ?auto_128914 ?auto_128918 ) ) ( not ( = ?auto_128914 ?auto_128919 ) ) ( not ( = ?auto_128915 ?auto_128917 ) ) ( not ( = ?auto_128915 ?auto_128916 ) ) ( not ( = ?auto_128915 ?auto_128918 ) ) ( not ( = ?auto_128915 ?auto_128919 ) ) ( not ( = ?auto_128917 ?auto_128916 ) ) ( not ( = ?auto_128917 ?auto_128918 ) ) ( not ( = ?auto_128917 ?auto_128919 ) ) ( not ( = ?auto_128916 ?auto_128918 ) ) ( not ( = ?auto_128916 ?auto_128919 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_128918 ?auto_128919 )
      ( MAKE-6CRATE-VERIFY ?auto_128913 ?auto_128914 ?auto_128915 ?auto_128917 ?auto_128916 ?auto_128918 ?auto_128919 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_128957 - SURFACE
      ?auto_128958 - SURFACE
      ?auto_128959 - SURFACE
      ?auto_128961 - SURFACE
      ?auto_128960 - SURFACE
      ?auto_128962 - SURFACE
      ?auto_128963 - SURFACE
    )
    :vars
    (
      ?auto_128965 - HOIST
      ?auto_128966 - PLACE
      ?auto_128964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_128965 ?auto_128966 ) ( SURFACE-AT ?auto_128962 ?auto_128966 ) ( CLEAR ?auto_128962 ) ( IS-CRATE ?auto_128963 ) ( not ( = ?auto_128962 ?auto_128963 ) ) ( TRUCK-AT ?auto_128964 ?auto_128966 ) ( AVAILABLE ?auto_128965 ) ( IN ?auto_128963 ?auto_128964 ) ( ON ?auto_128962 ?auto_128960 ) ( not ( = ?auto_128960 ?auto_128962 ) ) ( not ( = ?auto_128960 ?auto_128963 ) ) ( ON ?auto_128958 ?auto_128957 ) ( ON ?auto_128959 ?auto_128958 ) ( ON ?auto_128961 ?auto_128959 ) ( ON ?auto_128960 ?auto_128961 ) ( not ( = ?auto_128957 ?auto_128958 ) ) ( not ( = ?auto_128957 ?auto_128959 ) ) ( not ( = ?auto_128957 ?auto_128961 ) ) ( not ( = ?auto_128957 ?auto_128960 ) ) ( not ( = ?auto_128957 ?auto_128962 ) ) ( not ( = ?auto_128957 ?auto_128963 ) ) ( not ( = ?auto_128958 ?auto_128959 ) ) ( not ( = ?auto_128958 ?auto_128961 ) ) ( not ( = ?auto_128958 ?auto_128960 ) ) ( not ( = ?auto_128958 ?auto_128962 ) ) ( not ( = ?auto_128958 ?auto_128963 ) ) ( not ( = ?auto_128959 ?auto_128961 ) ) ( not ( = ?auto_128959 ?auto_128960 ) ) ( not ( = ?auto_128959 ?auto_128962 ) ) ( not ( = ?auto_128959 ?auto_128963 ) ) ( not ( = ?auto_128961 ?auto_128960 ) ) ( not ( = ?auto_128961 ?auto_128962 ) ) ( not ( = ?auto_128961 ?auto_128963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_128960 ?auto_128962 ?auto_128963 )
      ( MAKE-6CRATE-VERIFY ?auto_128957 ?auto_128958 ?auto_128959 ?auto_128961 ?auto_128960 ?auto_128962 ?auto_128963 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129008 - SURFACE
      ?auto_129009 - SURFACE
      ?auto_129010 - SURFACE
      ?auto_129012 - SURFACE
      ?auto_129011 - SURFACE
      ?auto_129013 - SURFACE
      ?auto_129014 - SURFACE
    )
    :vars
    (
      ?auto_129016 - HOIST
      ?auto_129017 - PLACE
      ?auto_129018 - TRUCK
      ?auto_129015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129016 ?auto_129017 ) ( SURFACE-AT ?auto_129013 ?auto_129017 ) ( CLEAR ?auto_129013 ) ( IS-CRATE ?auto_129014 ) ( not ( = ?auto_129013 ?auto_129014 ) ) ( AVAILABLE ?auto_129016 ) ( IN ?auto_129014 ?auto_129018 ) ( ON ?auto_129013 ?auto_129011 ) ( not ( = ?auto_129011 ?auto_129013 ) ) ( not ( = ?auto_129011 ?auto_129014 ) ) ( TRUCK-AT ?auto_129018 ?auto_129015 ) ( not ( = ?auto_129015 ?auto_129017 ) ) ( ON ?auto_129009 ?auto_129008 ) ( ON ?auto_129010 ?auto_129009 ) ( ON ?auto_129012 ?auto_129010 ) ( ON ?auto_129011 ?auto_129012 ) ( not ( = ?auto_129008 ?auto_129009 ) ) ( not ( = ?auto_129008 ?auto_129010 ) ) ( not ( = ?auto_129008 ?auto_129012 ) ) ( not ( = ?auto_129008 ?auto_129011 ) ) ( not ( = ?auto_129008 ?auto_129013 ) ) ( not ( = ?auto_129008 ?auto_129014 ) ) ( not ( = ?auto_129009 ?auto_129010 ) ) ( not ( = ?auto_129009 ?auto_129012 ) ) ( not ( = ?auto_129009 ?auto_129011 ) ) ( not ( = ?auto_129009 ?auto_129013 ) ) ( not ( = ?auto_129009 ?auto_129014 ) ) ( not ( = ?auto_129010 ?auto_129012 ) ) ( not ( = ?auto_129010 ?auto_129011 ) ) ( not ( = ?auto_129010 ?auto_129013 ) ) ( not ( = ?auto_129010 ?auto_129014 ) ) ( not ( = ?auto_129012 ?auto_129011 ) ) ( not ( = ?auto_129012 ?auto_129013 ) ) ( not ( = ?auto_129012 ?auto_129014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129011 ?auto_129013 ?auto_129014 )
      ( MAKE-6CRATE-VERIFY ?auto_129008 ?auto_129009 ?auto_129010 ?auto_129012 ?auto_129011 ?auto_129013 ?auto_129014 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129065 - SURFACE
      ?auto_129066 - SURFACE
      ?auto_129067 - SURFACE
      ?auto_129069 - SURFACE
      ?auto_129068 - SURFACE
      ?auto_129070 - SURFACE
      ?auto_129071 - SURFACE
    )
    :vars
    (
      ?auto_129076 - HOIST
      ?auto_129072 - PLACE
      ?auto_129074 - TRUCK
      ?auto_129073 - PLACE
      ?auto_129075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_129076 ?auto_129072 ) ( SURFACE-AT ?auto_129070 ?auto_129072 ) ( CLEAR ?auto_129070 ) ( IS-CRATE ?auto_129071 ) ( not ( = ?auto_129070 ?auto_129071 ) ) ( AVAILABLE ?auto_129076 ) ( ON ?auto_129070 ?auto_129068 ) ( not ( = ?auto_129068 ?auto_129070 ) ) ( not ( = ?auto_129068 ?auto_129071 ) ) ( TRUCK-AT ?auto_129074 ?auto_129073 ) ( not ( = ?auto_129073 ?auto_129072 ) ) ( HOIST-AT ?auto_129075 ?auto_129073 ) ( LIFTING ?auto_129075 ?auto_129071 ) ( not ( = ?auto_129076 ?auto_129075 ) ) ( ON ?auto_129066 ?auto_129065 ) ( ON ?auto_129067 ?auto_129066 ) ( ON ?auto_129069 ?auto_129067 ) ( ON ?auto_129068 ?auto_129069 ) ( not ( = ?auto_129065 ?auto_129066 ) ) ( not ( = ?auto_129065 ?auto_129067 ) ) ( not ( = ?auto_129065 ?auto_129069 ) ) ( not ( = ?auto_129065 ?auto_129068 ) ) ( not ( = ?auto_129065 ?auto_129070 ) ) ( not ( = ?auto_129065 ?auto_129071 ) ) ( not ( = ?auto_129066 ?auto_129067 ) ) ( not ( = ?auto_129066 ?auto_129069 ) ) ( not ( = ?auto_129066 ?auto_129068 ) ) ( not ( = ?auto_129066 ?auto_129070 ) ) ( not ( = ?auto_129066 ?auto_129071 ) ) ( not ( = ?auto_129067 ?auto_129069 ) ) ( not ( = ?auto_129067 ?auto_129068 ) ) ( not ( = ?auto_129067 ?auto_129070 ) ) ( not ( = ?auto_129067 ?auto_129071 ) ) ( not ( = ?auto_129069 ?auto_129068 ) ) ( not ( = ?auto_129069 ?auto_129070 ) ) ( not ( = ?auto_129069 ?auto_129071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129068 ?auto_129070 ?auto_129071 )
      ( MAKE-6CRATE-VERIFY ?auto_129065 ?auto_129066 ?auto_129067 ?auto_129069 ?auto_129068 ?auto_129070 ?auto_129071 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129128 - SURFACE
      ?auto_129129 - SURFACE
      ?auto_129130 - SURFACE
      ?auto_129132 - SURFACE
      ?auto_129131 - SURFACE
      ?auto_129133 - SURFACE
      ?auto_129134 - SURFACE
    )
    :vars
    (
      ?auto_129138 - HOIST
      ?auto_129135 - PLACE
      ?auto_129137 - TRUCK
      ?auto_129140 - PLACE
      ?auto_129136 - HOIST
      ?auto_129139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129138 ?auto_129135 ) ( SURFACE-AT ?auto_129133 ?auto_129135 ) ( CLEAR ?auto_129133 ) ( IS-CRATE ?auto_129134 ) ( not ( = ?auto_129133 ?auto_129134 ) ) ( AVAILABLE ?auto_129138 ) ( ON ?auto_129133 ?auto_129131 ) ( not ( = ?auto_129131 ?auto_129133 ) ) ( not ( = ?auto_129131 ?auto_129134 ) ) ( TRUCK-AT ?auto_129137 ?auto_129140 ) ( not ( = ?auto_129140 ?auto_129135 ) ) ( HOIST-AT ?auto_129136 ?auto_129140 ) ( not ( = ?auto_129138 ?auto_129136 ) ) ( AVAILABLE ?auto_129136 ) ( SURFACE-AT ?auto_129134 ?auto_129140 ) ( ON ?auto_129134 ?auto_129139 ) ( CLEAR ?auto_129134 ) ( not ( = ?auto_129133 ?auto_129139 ) ) ( not ( = ?auto_129134 ?auto_129139 ) ) ( not ( = ?auto_129131 ?auto_129139 ) ) ( ON ?auto_129129 ?auto_129128 ) ( ON ?auto_129130 ?auto_129129 ) ( ON ?auto_129132 ?auto_129130 ) ( ON ?auto_129131 ?auto_129132 ) ( not ( = ?auto_129128 ?auto_129129 ) ) ( not ( = ?auto_129128 ?auto_129130 ) ) ( not ( = ?auto_129128 ?auto_129132 ) ) ( not ( = ?auto_129128 ?auto_129131 ) ) ( not ( = ?auto_129128 ?auto_129133 ) ) ( not ( = ?auto_129128 ?auto_129134 ) ) ( not ( = ?auto_129128 ?auto_129139 ) ) ( not ( = ?auto_129129 ?auto_129130 ) ) ( not ( = ?auto_129129 ?auto_129132 ) ) ( not ( = ?auto_129129 ?auto_129131 ) ) ( not ( = ?auto_129129 ?auto_129133 ) ) ( not ( = ?auto_129129 ?auto_129134 ) ) ( not ( = ?auto_129129 ?auto_129139 ) ) ( not ( = ?auto_129130 ?auto_129132 ) ) ( not ( = ?auto_129130 ?auto_129131 ) ) ( not ( = ?auto_129130 ?auto_129133 ) ) ( not ( = ?auto_129130 ?auto_129134 ) ) ( not ( = ?auto_129130 ?auto_129139 ) ) ( not ( = ?auto_129132 ?auto_129131 ) ) ( not ( = ?auto_129132 ?auto_129133 ) ) ( not ( = ?auto_129132 ?auto_129134 ) ) ( not ( = ?auto_129132 ?auto_129139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129131 ?auto_129133 ?auto_129134 )
      ( MAKE-6CRATE-VERIFY ?auto_129128 ?auto_129129 ?auto_129130 ?auto_129132 ?auto_129131 ?auto_129133 ?auto_129134 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129192 - SURFACE
      ?auto_129193 - SURFACE
      ?auto_129194 - SURFACE
      ?auto_129196 - SURFACE
      ?auto_129195 - SURFACE
      ?auto_129197 - SURFACE
      ?auto_129198 - SURFACE
    )
    :vars
    (
      ?auto_129201 - HOIST
      ?auto_129203 - PLACE
      ?auto_129204 - PLACE
      ?auto_129200 - HOIST
      ?auto_129199 - SURFACE
      ?auto_129202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129201 ?auto_129203 ) ( SURFACE-AT ?auto_129197 ?auto_129203 ) ( CLEAR ?auto_129197 ) ( IS-CRATE ?auto_129198 ) ( not ( = ?auto_129197 ?auto_129198 ) ) ( AVAILABLE ?auto_129201 ) ( ON ?auto_129197 ?auto_129195 ) ( not ( = ?auto_129195 ?auto_129197 ) ) ( not ( = ?auto_129195 ?auto_129198 ) ) ( not ( = ?auto_129204 ?auto_129203 ) ) ( HOIST-AT ?auto_129200 ?auto_129204 ) ( not ( = ?auto_129201 ?auto_129200 ) ) ( AVAILABLE ?auto_129200 ) ( SURFACE-AT ?auto_129198 ?auto_129204 ) ( ON ?auto_129198 ?auto_129199 ) ( CLEAR ?auto_129198 ) ( not ( = ?auto_129197 ?auto_129199 ) ) ( not ( = ?auto_129198 ?auto_129199 ) ) ( not ( = ?auto_129195 ?auto_129199 ) ) ( TRUCK-AT ?auto_129202 ?auto_129203 ) ( ON ?auto_129193 ?auto_129192 ) ( ON ?auto_129194 ?auto_129193 ) ( ON ?auto_129196 ?auto_129194 ) ( ON ?auto_129195 ?auto_129196 ) ( not ( = ?auto_129192 ?auto_129193 ) ) ( not ( = ?auto_129192 ?auto_129194 ) ) ( not ( = ?auto_129192 ?auto_129196 ) ) ( not ( = ?auto_129192 ?auto_129195 ) ) ( not ( = ?auto_129192 ?auto_129197 ) ) ( not ( = ?auto_129192 ?auto_129198 ) ) ( not ( = ?auto_129192 ?auto_129199 ) ) ( not ( = ?auto_129193 ?auto_129194 ) ) ( not ( = ?auto_129193 ?auto_129196 ) ) ( not ( = ?auto_129193 ?auto_129195 ) ) ( not ( = ?auto_129193 ?auto_129197 ) ) ( not ( = ?auto_129193 ?auto_129198 ) ) ( not ( = ?auto_129193 ?auto_129199 ) ) ( not ( = ?auto_129194 ?auto_129196 ) ) ( not ( = ?auto_129194 ?auto_129195 ) ) ( not ( = ?auto_129194 ?auto_129197 ) ) ( not ( = ?auto_129194 ?auto_129198 ) ) ( not ( = ?auto_129194 ?auto_129199 ) ) ( not ( = ?auto_129196 ?auto_129195 ) ) ( not ( = ?auto_129196 ?auto_129197 ) ) ( not ( = ?auto_129196 ?auto_129198 ) ) ( not ( = ?auto_129196 ?auto_129199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129195 ?auto_129197 ?auto_129198 )
      ( MAKE-6CRATE-VERIFY ?auto_129192 ?auto_129193 ?auto_129194 ?auto_129196 ?auto_129195 ?auto_129197 ?auto_129198 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129256 - SURFACE
      ?auto_129257 - SURFACE
      ?auto_129258 - SURFACE
      ?auto_129260 - SURFACE
      ?auto_129259 - SURFACE
      ?auto_129261 - SURFACE
      ?auto_129262 - SURFACE
    )
    :vars
    (
      ?auto_129264 - HOIST
      ?auto_129263 - PLACE
      ?auto_129267 - PLACE
      ?auto_129265 - HOIST
      ?auto_129266 - SURFACE
      ?auto_129268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129264 ?auto_129263 ) ( IS-CRATE ?auto_129262 ) ( not ( = ?auto_129261 ?auto_129262 ) ) ( not ( = ?auto_129259 ?auto_129261 ) ) ( not ( = ?auto_129259 ?auto_129262 ) ) ( not ( = ?auto_129267 ?auto_129263 ) ) ( HOIST-AT ?auto_129265 ?auto_129267 ) ( not ( = ?auto_129264 ?auto_129265 ) ) ( AVAILABLE ?auto_129265 ) ( SURFACE-AT ?auto_129262 ?auto_129267 ) ( ON ?auto_129262 ?auto_129266 ) ( CLEAR ?auto_129262 ) ( not ( = ?auto_129261 ?auto_129266 ) ) ( not ( = ?auto_129262 ?auto_129266 ) ) ( not ( = ?auto_129259 ?auto_129266 ) ) ( TRUCK-AT ?auto_129268 ?auto_129263 ) ( SURFACE-AT ?auto_129259 ?auto_129263 ) ( CLEAR ?auto_129259 ) ( LIFTING ?auto_129264 ?auto_129261 ) ( IS-CRATE ?auto_129261 ) ( ON ?auto_129257 ?auto_129256 ) ( ON ?auto_129258 ?auto_129257 ) ( ON ?auto_129260 ?auto_129258 ) ( ON ?auto_129259 ?auto_129260 ) ( not ( = ?auto_129256 ?auto_129257 ) ) ( not ( = ?auto_129256 ?auto_129258 ) ) ( not ( = ?auto_129256 ?auto_129260 ) ) ( not ( = ?auto_129256 ?auto_129259 ) ) ( not ( = ?auto_129256 ?auto_129261 ) ) ( not ( = ?auto_129256 ?auto_129262 ) ) ( not ( = ?auto_129256 ?auto_129266 ) ) ( not ( = ?auto_129257 ?auto_129258 ) ) ( not ( = ?auto_129257 ?auto_129260 ) ) ( not ( = ?auto_129257 ?auto_129259 ) ) ( not ( = ?auto_129257 ?auto_129261 ) ) ( not ( = ?auto_129257 ?auto_129262 ) ) ( not ( = ?auto_129257 ?auto_129266 ) ) ( not ( = ?auto_129258 ?auto_129260 ) ) ( not ( = ?auto_129258 ?auto_129259 ) ) ( not ( = ?auto_129258 ?auto_129261 ) ) ( not ( = ?auto_129258 ?auto_129262 ) ) ( not ( = ?auto_129258 ?auto_129266 ) ) ( not ( = ?auto_129260 ?auto_129259 ) ) ( not ( = ?auto_129260 ?auto_129261 ) ) ( not ( = ?auto_129260 ?auto_129262 ) ) ( not ( = ?auto_129260 ?auto_129266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129259 ?auto_129261 ?auto_129262 )
      ( MAKE-6CRATE-VERIFY ?auto_129256 ?auto_129257 ?auto_129258 ?auto_129260 ?auto_129259 ?auto_129261 ?auto_129262 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_129320 - SURFACE
      ?auto_129321 - SURFACE
      ?auto_129322 - SURFACE
      ?auto_129324 - SURFACE
      ?auto_129323 - SURFACE
      ?auto_129325 - SURFACE
      ?auto_129326 - SURFACE
    )
    :vars
    (
      ?auto_129332 - HOIST
      ?auto_129331 - PLACE
      ?auto_129329 - PLACE
      ?auto_129327 - HOIST
      ?auto_129328 - SURFACE
      ?auto_129330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129332 ?auto_129331 ) ( IS-CRATE ?auto_129326 ) ( not ( = ?auto_129325 ?auto_129326 ) ) ( not ( = ?auto_129323 ?auto_129325 ) ) ( not ( = ?auto_129323 ?auto_129326 ) ) ( not ( = ?auto_129329 ?auto_129331 ) ) ( HOIST-AT ?auto_129327 ?auto_129329 ) ( not ( = ?auto_129332 ?auto_129327 ) ) ( AVAILABLE ?auto_129327 ) ( SURFACE-AT ?auto_129326 ?auto_129329 ) ( ON ?auto_129326 ?auto_129328 ) ( CLEAR ?auto_129326 ) ( not ( = ?auto_129325 ?auto_129328 ) ) ( not ( = ?auto_129326 ?auto_129328 ) ) ( not ( = ?auto_129323 ?auto_129328 ) ) ( TRUCK-AT ?auto_129330 ?auto_129331 ) ( SURFACE-AT ?auto_129323 ?auto_129331 ) ( CLEAR ?auto_129323 ) ( IS-CRATE ?auto_129325 ) ( AVAILABLE ?auto_129332 ) ( IN ?auto_129325 ?auto_129330 ) ( ON ?auto_129321 ?auto_129320 ) ( ON ?auto_129322 ?auto_129321 ) ( ON ?auto_129324 ?auto_129322 ) ( ON ?auto_129323 ?auto_129324 ) ( not ( = ?auto_129320 ?auto_129321 ) ) ( not ( = ?auto_129320 ?auto_129322 ) ) ( not ( = ?auto_129320 ?auto_129324 ) ) ( not ( = ?auto_129320 ?auto_129323 ) ) ( not ( = ?auto_129320 ?auto_129325 ) ) ( not ( = ?auto_129320 ?auto_129326 ) ) ( not ( = ?auto_129320 ?auto_129328 ) ) ( not ( = ?auto_129321 ?auto_129322 ) ) ( not ( = ?auto_129321 ?auto_129324 ) ) ( not ( = ?auto_129321 ?auto_129323 ) ) ( not ( = ?auto_129321 ?auto_129325 ) ) ( not ( = ?auto_129321 ?auto_129326 ) ) ( not ( = ?auto_129321 ?auto_129328 ) ) ( not ( = ?auto_129322 ?auto_129324 ) ) ( not ( = ?auto_129322 ?auto_129323 ) ) ( not ( = ?auto_129322 ?auto_129325 ) ) ( not ( = ?auto_129322 ?auto_129326 ) ) ( not ( = ?auto_129322 ?auto_129328 ) ) ( not ( = ?auto_129324 ?auto_129323 ) ) ( not ( = ?auto_129324 ?auto_129325 ) ) ( not ( = ?auto_129324 ?auto_129326 ) ) ( not ( = ?auto_129324 ?auto_129328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_129323 ?auto_129325 ?auto_129326 )
      ( MAKE-6CRATE-VERIFY ?auto_129320 ?auto_129321 ?auto_129322 ?auto_129324 ?auto_129323 ?auto_129325 ?auto_129326 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131263 - SURFACE
      ?auto_131264 - SURFACE
      ?auto_131265 - SURFACE
      ?auto_131267 - SURFACE
      ?auto_131266 - SURFACE
      ?auto_131268 - SURFACE
      ?auto_131269 - SURFACE
      ?auto_131270 - SURFACE
    )
    :vars
    (
      ?auto_131271 - HOIST
      ?auto_131272 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131271 ?auto_131272 ) ( SURFACE-AT ?auto_131269 ?auto_131272 ) ( CLEAR ?auto_131269 ) ( LIFTING ?auto_131271 ?auto_131270 ) ( IS-CRATE ?auto_131270 ) ( not ( = ?auto_131269 ?auto_131270 ) ) ( ON ?auto_131264 ?auto_131263 ) ( ON ?auto_131265 ?auto_131264 ) ( ON ?auto_131267 ?auto_131265 ) ( ON ?auto_131266 ?auto_131267 ) ( ON ?auto_131268 ?auto_131266 ) ( ON ?auto_131269 ?auto_131268 ) ( not ( = ?auto_131263 ?auto_131264 ) ) ( not ( = ?auto_131263 ?auto_131265 ) ) ( not ( = ?auto_131263 ?auto_131267 ) ) ( not ( = ?auto_131263 ?auto_131266 ) ) ( not ( = ?auto_131263 ?auto_131268 ) ) ( not ( = ?auto_131263 ?auto_131269 ) ) ( not ( = ?auto_131263 ?auto_131270 ) ) ( not ( = ?auto_131264 ?auto_131265 ) ) ( not ( = ?auto_131264 ?auto_131267 ) ) ( not ( = ?auto_131264 ?auto_131266 ) ) ( not ( = ?auto_131264 ?auto_131268 ) ) ( not ( = ?auto_131264 ?auto_131269 ) ) ( not ( = ?auto_131264 ?auto_131270 ) ) ( not ( = ?auto_131265 ?auto_131267 ) ) ( not ( = ?auto_131265 ?auto_131266 ) ) ( not ( = ?auto_131265 ?auto_131268 ) ) ( not ( = ?auto_131265 ?auto_131269 ) ) ( not ( = ?auto_131265 ?auto_131270 ) ) ( not ( = ?auto_131267 ?auto_131266 ) ) ( not ( = ?auto_131267 ?auto_131268 ) ) ( not ( = ?auto_131267 ?auto_131269 ) ) ( not ( = ?auto_131267 ?auto_131270 ) ) ( not ( = ?auto_131266 ?auto_131268 ) ) ( not ( = ?auto_131266 ?auto_131269 ) ) ( not ( = ?auto_131266 ?auto_131270 ) ) ( not ( = ?auto_131268 ?auto_131269 ) ) ( not ( = ?auto_131268 ?auto_131270 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_131269 ?auto_131270 )
      ( MAKE-7CRATE-VERIFY ?auto_131263 ?auto_131264 ?auto_131265 ?auto_131267 ?auto_131266 ?auto_131268 ?auto_131269 ?auto_131270 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131318 - SURFACE
      ?auto_131319 - SURFACE
      ?auto_131320 - SURFACE
      ?auto_131322 - SURFACE
      ?auto_131321 - SURFACE
      ?auto_131323 - SURFACE
      ?auto_131324 - SURFACE
      ?auto_131325 - SURFACE
    )
    :vars
    (
      ?auto_131327 - HOIST
      ?auto_131326 - PLACE
      ?auto_131328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131327 ?auto_131326 ) ( SURFACE-AT ?auto_131324 ?auto_131326 ) ( CLEAR ?auto_131324 ) ( IS-CRATE ?auto_131325 ) ( not ( = ?auto_131324 ?auto_131325 ) ) ( TRUCK-AT ?auto_131328 ?auto_131326 ) ( AVAILABLE ?auto_131327 ) ( IN ?auto_131325 ?auto_131328 ) ( ON ?auto_131324 ?auto_131323 ) ( not ( = ?auto_131323 ?auto_131324 ) ) ( not ( = ?auto_131323 ?auto_131325 ) ) ( ON ?auto_131319 ?auto_131318 ) ( ON ?auto_131320 ?auto_131319 ) ( ON ?auto_131322 ?auto_131320 ) ( ON ?auto_131321 ?auto_131322 ) ( ON ?auto_131323 ?auto_131321 ) ( not ( = ?auto_131318 ?auto_131319 ) ) ( not ( = ?auto_131318 ?auto_131320 ) ) ( not ( = ?auto_131318 ?auto_131322 ) ) ( not ( = ?auto_131318 ?auto_131321 ) ) ( not ( = ?auto_131318 ?auto_131323 ) ) ( not ( = ?auto_131318 ?auto_131324 ) ) ( not ( = ?auto_131318 ?auto_131325 ) ) ( not ( = ?auto_131319 ?auto_131320 ) ) ( not ( = ?auto_131319 ?auto_131322 ) ) ( not ( = ?auto_131319 ?auto_131321 ) ) ( not ( = ?auto_131319 ?auto_131323 ) ) ( not ( = ?auto_131319 ?auto_131324 ) ) ( not ( = ?auto_131319 ?auto_131325 ) ) ( not ( = ?auto_131320 ?auto_131322 ) ) ( not ( = ?auto_131320 ?auto_131321 ) ) ( not ( = ?auto_131320 ?auto_131323 ) ) ( not ( = ?auto_131320 ?auto_131324 ) ) ( not ( = ?auto_131320 ?auto_131325 ) ) ( not ( = ?auto_131322 ?auto_131321 ) ) ( not ( = ?auto_131322 ?auto_131323 ) ) ( not ( = ?auto_131322 ?auto_131324 ) ) ( not ( = ?auto_131322 ?auto_131325 ) ) ( not ( = ?auto_131321 ?auto_131323 ) ) ( not ( = ?auto_131321 ?auto_131324 ) ) ( not ( = ?auto_131321 ?auto_131325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131323 ?auto_131324 ?auto_131325 )
      ( MAKE-7CRATE-VERIFY ?auto_131318 ?auto_131319 ?auto_131320 ?auto_131322 ?auto_131321 ?auto_131323 ?auto_131324 ?auto_131325 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131381 - SURFACE
      ?auto_131382 - SURFACE
      ?auto_131383 - SURFACE
      ?auto_131385 - SURFACE
      ?auto_131384 - SURFACE
      ?auto_131386 - SURFACE
      ?auto_131387 - SURFACE
      ?auto_131388 - SURFACE
    )
    :vars
    (
      ?auto_131390 - HOIST
      ?auto_131389 - PLACE
      ?auto_131391 - TRUCK
      ?auto_131392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131390 ?auto_131389 ) ( SURFACE-AT ?auto_131387 ?auto_131389 ) ( CLEAR ?auto_131387 ) ( IS-CRATE ?auto_131388 ) ( not ( = ?auto_131387 ?auto_131388 ) ) ( AVAILABLE ?auto_131390 ) ( IN ?auto_131388 ?auto_131391 ) ( ON ?auto_131387 ?auto_131386 ) ( not ( = ?auto_131386 ?auto_131387 ) ) ( not ( = ?auto_131386 ?auto_131388 ) ) ( TRUCK-AT ?auto_131391 ?auto_131392 ) ( not ( = ?auto_131392 ?auto_131389 ) ) ( ON ?auto_131382 ?auto_131381 ) ( ON ?auto_131383 ?auto_131382 ) ( ON ?auto_131385 ?auto_131383 ) ( ON ?auto_131384 ?auto_131385 ) ( ON ?auto_131386 ?auto_131384 ) ( not ( = ?auto_131381 ?auto_131382 ) ) ( not ( = ?auto_131381 ?auto_131383 ) ) ( not ( = ?auto_131381 ?auto_131385 ) ) ( not ( = ?auto_131381 ?auto_131384 ) ) ( not ( = ?auto_131381 ?auto_131386 ) ) ( not ( = ?auto_131381 ?auto_131387 ) ) ( not ( = ?auto_131381 ?auto_131388 ) ) ( not ( = ?auto_131382 ?auto_131383 ) ) ( not ( = ?auto_131382 ?auto_131385 ) ) ( not ( = ?auto_131382 ?auto_131384 ) ) ( not ( = ?auto_131382 ?auto_131386 ) ) ( not ( = ?auto_131382 ?auto_131387 ) ) ( not ( = ?auto_131382 ?auto_131388 ) ) ( not ( = ?auto_131383 ?auto_131385 ) ) ( not ( = ?auto_131383 ?auto_131384 ) ) ( not ( = ?auto_131383 ?auto_131386 ) ) ( not ( = ?auto_131383 ?auto_131387 ) ) ( not ( = ?auto_131383 ?auto_131388 ) ) ( not ( = ?auto_131385 ?auto_131384 ) ) ( not ( = ?auto_131385 ?auto_131386 ) ) ( not ( = ?auto_131385 ?auto_131387 ) ) ( not ( = ?auto_131385 ?auto_131388 ) ) ( not ( = ?auto_131384 ?auto_131386 ) ) ( not ( = ?auto_131384 ?auto_131387 ) ) ( not ( = ?auto_131384 ?auto_131388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131386 ?auto_131387 ?auto_131388 )
      ( MAKE-7CRATE-VERIFY ?auto_131381 ?auto_131382 ?auto_131383 ?auto_131385 ?auto_131384 ?auto_131386 ?auto_131387 ?auto_131388 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131451 - SURFACE
      ?auto_131452 - SURFACE
      ?auto_131453 - SURFACE
      ?auto_131455 - SURFACE
      ?auto_131454 - SURFACE
      ?auto_131456 - SURFACE
      ?auto_131457 - SURFACE
      ?auto_131458 - SURFACE
    )
    :vars
    (
      ?auto_131460 - HOIST
      ?auto_131459 - PLACE
      ?auto_131463 - TRUCK
      ?auto_131461 - PLACE
      ?auto_131462 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_131460 ?auto_131459 ) ( SURFACE-AT ?auto_131457 ?auto_131459 ) ( CLEAR ?auto_131457 ) ( IS-CRATE ?auto_131458 ) ( not ( = ?auto_131457 ?auto_131458 ) ) ( AVAILABLE ?auto_131460 ) ( ON ?auto_131457 ?auto_131456 ) ( not ( = ?auto_131456 ?auto_131457 ) ) ( not ( = ?auto_131456 ?auto_131458 ) ) ( TRUCK-AT ?auto_131463 ?auto_131461 ) ( not ( = ?auto_131461 ?auto_131459 ) ) ( HOIST-AT ?auto_131462 ?auto_131461 ) ( LIFTING ?auto_131462 ?auto_131458 ) ( not ( = ?auto_131460 ?auto_131462 ) ) ( ON ?auto_131452 ?auto_131451 ) ( ON ?auto_131453 ?auto_131452 ) ( ON ?auto_131455 ?auto_131453 ) ( ON ?auto_131454 ?auto_131455 ) ( ON ?auto_131456 ?auto_131454 ) ( not ( = ?auto_131451 ?auto_131452 ) ) ( not ( = ?auto_131451 ?auto_131453 ) ) ( not ( = ?auto_131451 ?auto_131455 ) ) ( not ( = ?auto_131451 ?auto_131454 ) ) ( not ( = ?auto_131451 ?auto_131456 ) ) ( not ( = ?auto_131451 ?auto_131457 ) ) ( not ( = ?auto_131451 ?auto_131458 ) ) ( not ( = ?auto_131452 ?auto_131453 ) ) ( not ( = ?auto_131452 ?auto_131455 ) ) ( not ( = ?auto_131452 ?auto_131454 ) ) ( not ( = ?auto_131452 ?auto_131456 ) ) ( not ( = ?auto_131452 ?auto_131457 ) ) ( not ( = ?auto_131452 ?auto_131458 ) ) ( not ( = ?auto_131453 ?auto_131455 ) ) ( not ( = ?auto_131453 ?auto_131454 ) ) ( not ( = ?auto_131453 ?auto_131456 ) ) ( not ( = ?auto_131453 ?auto_131457 ) ) ( not ( = ?auto_131453 ?auto_131458 ) ) ( not ( = ?auto_131455 ?auto_131454 ) ) ( not ( = ?auto_131455 ?auto_131456 ) ) ( not ( = ?auto_131455 ?auto_131457 ) ) ( not ( = ?auto_131455 ?auto_131458 ) ) ( not ( = ?auto_131454 ?auto_131456 ) ) ( not ( = ?auto_131454 ?auto_131457 ) ) ( not ( = ?auto_131454 ?auto_131458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131456 ?auto_131457 ?auto_131458 )
      ( MAKE-7CRATE-VERIFY ?auto_131451 ?auto_131452 ?auto_131453 ?auto_131455 ?auto_131454 ?auto_131456 ?auto_131457 ?auto_131458 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131528 - SURFACE
      ?auto_131529 - SURFACE
      ?auto_131530 - SURFACE
      ?auto_131532 - SURFACE
      ?auto_131531 - SURFACE
      ?auto_131533 - SURFACE
      ?auto_131534 - SURFACE
      ?auto_131535 - SURFACE
    )
    :vars
    (
      ?auto_131538 - HOIST
      ?auto_131537 - PLACE
      ?auto_131540 - TRUCK
      ?auto_131539 - PLACE
      ?auto_131541 - HOIST
      ?auto_131536 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_131538 ?auto_131537 ) ( SURFACE-AT ?auto_131534 ?auto_131537 ) ( CLEAR ?auto_131534 ) ( IS-CRATE ?auto_131535 ) ( not ( = ?auto_131534 ?auto_131535 ) ) ( AVAILABLE ?auto_131538 ) ( ON ?auto_131534 ?auto_131533 ) ( not ( = ?auto_131533 ?auto_131534 ) ) ( not ( = ?auto_131533 ?auto_131535 ) ) ( TRUCK-AT ?auto_131540 ?auto_131539 ) ( not ( = ?auto_131539 ?auto_131537 ) ) ( HOIST-AT ?auto_131541 ?auto_131539 ) ( not ( = ?auto_131538 ?auto_131541 ) ) ( AVAILABLE ?auto_131541 ) ( SURFACE-AT ?auto_131535 ?auto_131539 ) ( ON ?auto_131535 ?auto_131536 ) ( CLEAR ?auto_131535 ) ( not ( = ?auto_131534 ?auto_131536 ) ) ( not ( = ?auto_131535 ?auto_131536 ) ) ( not ( = ?auto_131533 ?auto_131536 ) ) ( ON ?auto_131529 ?auto_131528 ) ( ON ?auto_131530 ?auto_131529 ) ( ON ?auto_131532 ?auto_131530 ) ( ON ?auto_131531 ?auto_131532 ) ( ON ?auto_131533 ?auto_131531 ) ( not ( = ?auto_131528 ?auto_131529 ) ) ( not ( = ?auto_131528 ?auto_131530 ) ) ( not ( = ?auto_131528 ?auto_131532 ) ) ( not ( = ?auto_131528 ?auto_131531 ) ) ( not ( = ?auto_131528 ?auto_131533 ) ) ( not ( = ?auto_131528 ?auto_131534 ) ) ( not ( = ?auto_131528 ?auto_131535 ) ) ( not ( = ?auto_131528 ?auto_131536 ) ) ( not ( = ?auto_131529 ?auto_131530 ) ) ( not ( = ?auto_131529 ?auto_131532 ) ) ( not ( = ?auto_131529 ?auto_131531 ) ) ( not ( = ?auto_131529 ?auto_131533 ) ) ( not ( = ?auto_131529 ?auto_131534 ) ) ( not ( = ?auto_131529 ?auto_131535 ) ) ( not ( = ?auto_131529 ?auto_131536 ) ) ( not ( = ?auto_131530 ?auto_131532 ) ) ( not ( = ?auto_131530 ?auto_131531 ) ) ( not ( = ?auto_131530 ?auto_131533 ) ) ( not ( = ?auto_131530 ?auto_131534 ) ) ( not ( = ?auto_131530 ?auto_131535 ) ) ( not ( = ?auto_131530 ?auto_131536 ) ) ( not ( = ?auto_131532 ?auto_131531 ) ) ( not ( = ?auto_131532 ?auto_131533 ) ) ( not ( = ?auto_131532 ?auto_131534 ) ) ( not ( = ?auto_131532 ?auto_131535 ) ) ( not ( = ?auto_131532 ?auto_131536 ) ) ( not ( = ?auto_131531 ?auto_131533 ) ) ( not ( = ?auto_131531 ?auto_131534 ) ) ( not ( = ?auto_131531 ?auto_131535 ) ) ( not ( = ?auto_131531 ?auto_131536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131533 ?auto_131534 ?auto_131535 )
      ( MAKE-7CRATE-VERIFY ?auto_131528 ?auto_131529 ?auto_131530 ?auto_131532 ?auto_131531 ?auto_131533 ?auto_131534 ?auto_131535 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131606 - SURFACE
      ?auto_131607 - SURFACE
      ?auto_131608 - SURFACE
      ?auto_131610 - SURFACE
      ?auto_131609 - SURFACE
      ?auto_131611 - SURFACE
      ?auto_131612 - SURFACE
      ?auto_131613 - SURFACE
    )
    :vars
    (
      ?auto_131614 - HOIST
      ?auto_131619 - PLACE
      ?auto_131616 - PLACE
      ?auto_131617 - HOIST
      ?auto_131618 - SURFACE
      ?auto_131615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131614 ?auto_131619 ) ( SURFACE-AT ?auto_131612 ?auto_131619 ) ( CLEAR ?auto_131612 ) ( IS-CRATE ?auto_131613 ) ( not ( = ?auto_131612 ?auto_131613 ) ) ( AVAILABLE ?auto_131614 ) ( ON ?auto_131612 ?auto_131611 ) ( not ( = ?auto_131611 ?auto_131612 ) ) ( not ( = ?auto_131611 ?auto_131613 ) ) ( not ( = ?auto_131616 ?auto_131619 ) ) ( HOIST-AT ?auto_131617 ?auto_131616 ) ( not ( = ?auto_131614 ?auto_131617 ) ) ( AVAILABLE ?auto_131617 ) ( SURFACE-AT ?auto_131613 ?auto_131616 ) ( ON ?auto_131613 ?auto_131618 ) ( CLEAR ?auto_131613 ) ( not ( = ?auto_131612 ?auto_131618 ) ) ( not ( = ?auto_131613 ?auto_131618 ) ) ( not ( = ?auto_131611 ?auto_131618 ) ) ( TRUCK-AT ?auto_131615 ?auto_131619 ) ( ON ?auto_131607 ?auto_131606 ) ( ON ?auto_131608 ?auto_131607 ) ( ON ?auto_131610 ?auto_131608 ) ( ON ?auto_131609 ?auto_131610 ) ( ON ?auto_131611 ?auto_131609 ) ( not ( = ?auto_131606 ?auto_131607 ) ) ( not ( = ?auto_131606 ?auto_131608 ) ) ( not ( = ?auto_131606 ?auto_131610 ) ) ( not ( = ?auto_131606 ?auto_131609 ) ) ( not ( = ?auto_131606 ?auto_131611 ) ) ( not ( = ?auto_131606 ?auto_131612 ) ) ( not ( = ?auto_131606 ?auto_131613 ) ) ( not ( = ?auto_131606 ?auto_131618 ) ) ( not ( = ?auto_131607 ?auto_131608 ) ) ( not ( = ?auto_131607 ?auto_131610 ) ) ( not ( = ?auto_131607 ?auto_131609 ) ) ( not ( = ?auto_131607 ?auto_131611 ) ) ( not ( = ?auto_131607 ?auto_131612 ) ) ( not ( = ?auto_131607 ?auto_131613 ) ) ( not ( = ?auto_131607 ?auto_131618 ) ) ( not ( = ?auto_131608 ?auto_131610 ) ) ( not ( = ?auto_131608 ?auto_131609 ) ) ( not ( = ?auto_131608 ?auto_131611 ) ) ( not ( = ?auto_131608 ?auto_131612 ) ) ( not ( = ?auto_131608 ?auto_131613 ) ) ( not ( = ?auto_131608 ?auto_131618 ) ) ( not ( = ?auto_131610 ?auto_131609 ) ) ( not ( = ?auto_131610 ?auto_131611 ) ) ( not ( = ?auto_131610 ?auto_131612 ) ) ( not ( = ?auto_131610 ?auto_131613 ) ) ( not ( = ?auto_131610 ?auto_131618 ) ) ( not ( = ?auto_131609 ?auto_131611 ) ) ( not ( = ?auto_131609 ?auto_131612 ) ) ( not ( = ?auto_131609 ?auto_131613 ) ) ( not ( = ?auto_131609 ?auto_131618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131611 ?auto_131612 ?auto_131613 )
      ( MAKE-7CRATE-VERIFY ?auto_131606 ?auto_131607 ?auto_131608 ?auto_131610 ?auto_131609 ?auto_131611 ?auto_131612 ?auto_131613 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131684 - SURFACE
      ?auto_131685 - SURFACE
      ?auto_131686 - SURFACE
      ?auto_131688 - SURFACE
      ?auto_131687 - SURFACE
      ?auto_131689 - SURFACE
      ?auto_131690 - SURFACE
      ?auto_131691 - SURFACE
    )
    :vars
    (
      ?auto_131695 - HOIST
      ?auto_131693 - PLACE
      ?auto_131694 - PLACE
      ?auto_131697 - HOIST
      ?auto_131696 - SURFACE
      ?auto_131692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131695 ?auto_131693 ) ( IS-CRATE ?auto_131691 ) ( not ( = ?auto_131690 ?auto_131691 ) ) ( not ( = ?auto_131689 ?auto_131690 ) ) ( not ( = ?auto_131689 ?auto_131691 ) ) ( not ( = ?auto_131694 ?auto_131693 ) ) ( HOIST-AT ?auto_131697 ?auto_131694 ) ( not ( = ?auto_131695 ?auto_131697 ) ) ( AVAILABLE ?auto_131697 ) ( SURFACE-AT ?auto_131691 ?auto_131694 ) ( ON ?auto_131691 ?auto_131696 ) ( CLEAR ?auto_131691 ) ( not ( = ?auto_131690 ?auto_131696 ) ) ( not ( = ?auto_131691 ?auto_131696 ) ) ( not ( = ?auto_131689 ?auto_131696 ) ) ( TRUCK-AT ?auto_131692 ?auto_131693 ) ( SURFACE-AT ?auto_131689 ?auto_131693 ) ( CLEAR ?auto_131689 ) ( LIFTING ?auto_131695 ?auto_131690 ) ( IS-CRATE ?auto_131690 ) ( ON ?auto_131685 ?auto_131684 ) ( ON ?auto_131686 ?auto_131685 ) ( ON ?auto_131688 ?auto_131686 ) ( ON ?auto_131687 ?auto_131688 ) ( ON ?auto_131689 ?auto_131687 ) ( not ( = ?auto_131684 ?auto_131685 ) ) ( not ( = ?auto_131684 ?auto_131686 ) ) ( not ( = ?auto_131684 ?auto_131688 ) ) ( not ( = ?auto_131684 ?auto_131687 ) ) ( not ( = ?auto_131684 ?auto_131689 ) ) ( not ( = ?auto_131684 ?auto_131690 ) ) ( not ( = ?auto_131684 ?auto_131691 ) ) ( not ( = ?auto_131684 ?auto_131696 ) ) ( not ( = ?auto_131685 ?auto_131686 ) ) ( not ( = ?auto_131685 ?auto_131688 ) ) ( not ( = ?auto_131685 ?auto_131687 ) ) ( not ( = ?auto_131685 ?auto_131689 ) ) ( not ( = ?auto_131685 ?auto_131690 ) ) ( not ( = ?auto_131685 ?auto_131691 ) ) ( not ( = ?auto_131685 ?auto_131696 ) ) ( not ( = ?auto_131686 ?auto_131688 ) ) ( not ( = ?auto_131686 ?auto_131687 ) ) ( not ( = ?auto_131686 ?auto_131689 ) ) ( not ( = ?auto_131686 ?auto_131690 ) ) ( not ( = ?auto_131686 ?auto_131691 ) ) ( not ( = ?auto_131686 ?auto_131696 ) ) ( not ( = ?auto_131688 ?auto_131687 ) ) ( not ( = ?auto_131688 ?auto_131689 ) ) ( not ( = ?auto_131688 ?auto_131690 ) ) ( not ( = ?auto_131688 ?auto_131691 ) ) ( not ( = ?auto_131688 ?auto_131696 ) ) ( not ( = ?auto_131687 ?auto_131689 ) ) ( not ( = ?auto_131687 ?auto_131690 ) ) ( not ( = ?auto_131687 ?auto_131691 ) ) ( not ( = ?auto_131687 ?auto_131696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131689 ?auto_131690 ?auto_131691 )
      ( MAKE-7CRATE-VERIFY ?auto_131684 ?auto_131685 ?auto_131686 ?auto_131688 ?auto_131687 ?auto_131689 ?auto_131690 ?auto_131691 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_131762 - SURFACE
      ?auto_131763 - SURFACE
      ?auto_131764 - SURFACE
      ?auto_131766 - SURFACE
      ?auto_131765 - SURFACE
      ?auto_131767 - SURFACE
      ?auto_131768 - SURFACE
      ?auto_131769 - SURFACE
    )
    :vars
    (
      ?auto_131773 - HOIST
      ?auto_131772 - PLACE
      ?auto_131770 - PLACE
      ?auto_131771 - HOIST
      ?auto_131774 - SURFACE
      ?auto_131775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_131773 ?auto_131772 ) ( IS-CRATE ?auto_131769 ) ( not ( = ?auto_131768 ?auto_131769 ) ) ( not ( = ?auto_131767 ?auto_131768 ) ) ( not ( = ?auto_131767 ?auto_131769 ) ) ( not ( = ?auto_131770 ?auto_131772 ) ) ( HOIST-AT ?auto_131771 ?auto_131770 ) ( not ( = ?auto_131773 ?auto_131771 ) ) ( AVAILABLE ?auto_131771 ) ( SURFACE-AT ?auto_131769 ?auto_131770 ) ( ON ?auto_131769 ?auto_131774 ) ( CLEAR ?auto_131769 ) ( not ( = ?auto_131768 ?auto_131774 ) ) ( not ( = ?auto_131769 ?auto_131774 ) ) ( not ( = ?auto_131767 ?auto_131774 ) ) ( TRUCK-AT ?auto_131775 ?auto_131772 ) ( SURFACE-AT ?auto_131767 ?auto_131772 ) ( CLEAR ?auto_131767 ) ( IS-CRATE ?auto_131768 ) ( AVAILABLE ?auto_131773 ) ( IN ?auto_131768 ?auto_131775 ) ( ON ?auto_131763 ?auto_131762 ) ( ON ?auto_131764 ?auto_131763 ) ( ON ?auto_131766 ?auto_131764 ) ( ON ?auto_131765 ?auto_131766 ) ( ON ?auto_131767 ?auto_131765 ) ( not ( = ?auto_131762 ?auto_131763 ) ) ( not ( = ?auto_131762 ?auto_131764 ) ) ( not ( = ?auto_131762 ?auto_131766 ) ) ( not ( = ?auto_131762 ?auto_131765 ) ) ( not ( = ?auto_131762 ?auto_131767 ) ) ( not ( = ?auto_131762 ?auto_131768 ) ) ( not ( = ?auto_131762 ?auto_131769 ) ) ( not ( = ?auto_131762 ?auto_131774 ) ) ( not ( = ?auto_131763 ?auto_131764 ) ) ( not ( = ?auto_131763 ?auto_131766 ) ) ( not ( = ?auto_131763 ?auto_131765 ) ) ( not ( = ?auto_131763 ?auto_131767 ) ) ( not ( = ?auto_131763 ?auto_131768 ) ) ( not ( = ?auto_131763 ?auto_131769 ) ) ( not ( = ?auto_131763 ?auto_131774 ) ) ( not ( = ?auto_131764 ?auto_131766 ) ) ( not ( = ?auto_131764 ?auto_131765 ) ) ( not ( = ?auto_131764 ?auto_131767 ) ) ( not ( = ?auto_131764 ?auto_131768 ) ) ( not ( = ?auto_131764 ?auto_131769 ) ) ( not ( = ?auto_131764 ?auto_131774 ) ) ( not ( = ?auto_131766 ?auto_131765 ) ) ( not ( = ?auto_131766 ?auto_131767 ) ) ( not ( = ?auto_131766 ?auto_131768 ) ) ( not ( = ?auto_131766 ?auto_131769 ) ) ( not ( = ?auto_131766 ?auto_131774 ) ) ( not ( = ?auto_131765 ?auto_131767 ) ) ( not ( = ?auto_131765 ?auto_131768 ) ) ( not ( = ?auto_131765 ?auto_131769 ) ) ( not ( = ?auto_131765 ?auto_131774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_131767 ?auto_131768 ?auto_131769 )
      ( MAKE-7CRATE-VERIFY ?auto_131762 ?auto_131763 ?auto_131764 ?auto_131766 ?auto_131765 ?auto_131767 ?auto_131768 ?auto_131769 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134656 - SURFACE
      ?auto_134657 - SURFACE
      ?auto_134658 - SURFACE
      ?auto_134660 - SURFACE
      ?auto_134659 - SURFACE
      ?auto_134661 - SURFACE
      ?auto_134662 - SURFACE
      ?auto_134663 - SURFACE
      ?auto_134664 - SURFACE
    )
    :vars
    (
      ?auto_134666 - HOIST
      ?auto_134665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_134666 ?auto_134665 ) ( SURFACE-AT ?auto_134663 ?auto_134665 ) ( CLEAR ?auto_134663 ) ( LIFTING ?auto_134666 ?auto_134664 ) ( IS-CRATE ?auto_134664 ) ( not ( = ?auto_134663 ?auto_134664 ) ) ( ON ?auto_134657 ?auto_134656 ) ( ON ?auto_134658 ?auto_134657 ) ( ON ?auto_134660 ?auto_134658 ) ( ON ?auto_134659 ?auto_134660 ) ( ON ?auto_134661 ?auto_134659 ) ( ON ?auto_134662 ?auto_134661 ) ( ON ?auto_134663 ?auto_134662 ) ( not ( = ?auto_134656 ?auto_134657 ) ) ( not ( = ?auto_134656 ?auto_134658 ) ) ( not ( = ?auto_134656 ?auto_134660 ) ) ( not ( = ?auto_134656 ?auto_134659 ) ) ( not ( = ?auto_134656 ?auto_134661 ) ) ( not ( = ?auto_134656 ?auto_134662 ) ) ( not ( = ?auto_134656 ?auto_134663 ) ) ( not ( = ?auto_134656 ?auto_134664 ) ) ( not ( = ?auto_134657 ?auto_134658 ) ) ( not ( = ?auto_134657 ?auto_134660 ) ) ( not ( = ?auto_134657 ?auto_134659 ) ) ( not ( = ?auto_134657 ?auto_134661 ) ) ( not ( = ?auto_134657 ?auto_134662 ) ) ( not ( = ?auto_134657 ?auto_134663 ) ) ( not ( = ?auto_134657 ?auto_134664 ) ) ( not ( = ?auto_134658 ?auto_134660 ) ) ( not ( = ?auto_134658 ?auto_134659 ) ) ( not ( = ?auto_134658 ?auto_134661 ) ) ( not ( = ?auto_134658 ?auto_134662 ) ) ( not ( = ?auto_134658 ?auto_134663 ) ) ( not ( = ?auto_134658 ?auto_134664 ) ) ( not ( = ?auto_134660 ?auto_134659 ) ) ( not ( = ?auto_134660 ?auto_134661 ) ) ( not ( = ?auto_134660 ?auto_134662 ) ) ( not ( = ?auto_134660 ?auto_134663 ) ) ( not ( = ?auto_134660 ?auto_134664 ) ) ( not ( = ?auto_134659 ?auto_134661 ) ) ( not ( = ?auto_134659 ?auto_134662 ) ) ( not ( = ?auto_134659 ?auto_134663 ) ) ( not ( = ?auto_134659 ?auto_134664 ) ) ( not ( = ?auto_134661 ?auto_134662 ) ) ( not ( = ?auto_134661 ?auto_134663 ) ) ( not ( = ?auto_134661 ?auto_134664 ) ) ( not ( = ?auto_134662 ?auto_134663 ) ) ( not ( = ?auto_134662 ?auto_134664 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_134663 ?auto_134664 )
      ( MAKE-8CRATE-VERIFY ?auto_134656 ?auto_134657 ?auto_134658 ?auto_134660 ?auto_134659 ?auto_134661 ?auto_134662 ?auto_134663 ?auto_134664 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134723 - SURFACE
      ?auto_134724 - SURFACE
      ?auto_134725 - SURFACE
      ?auto_134727 - SURFACE
      ?auto_134726 - SURFACE
      ?auto_134728 - SURFACE
      ?auto_134729 - SURFACE
      ?auto_134730 - SURFACE
      ?auto_134731 - SURFACE
    )
    :vars
    (
      ?auto_134733 - HOIST
      ?auto_134734 - PLACE
      ?auto_134732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_134733 ?auto_134734 ) ( SURFACE-AT ?auto_134730 ?auto_134734 ) ( CLEAR ?auto_134730 ) ( IS-CRATE ?auto_134731 ) ( not ( = ?auto_134730 ?auto_134731 ) ) ( TRUCK-AT ?auto_134732 ?auto_134734 ) ( AVAILABLE ?auto_134733 ) ( IN ?auto_134731 ?auto_134732 ) ( ON ?auto_134730 ?auto_134729 ) ( not ( = ?auto_134729 ?auto_134730 ) ) ( not ( = ?auto_134729 ?auto_134731 ) ) ( ON ?auto_134724 ?auto_134723 ) ( ON ?auto_134725 ?auto_134724 ) ( ON ?auto_134727 ?auto_134725 ) ( ON ?auto_134726 ?auto_134727 ) ( ON ?auto_134728 ?auto_134726 ) ( ON ?auto_134729 ?auto_134728 ) ( not ( = ?auto_134723 ?auto_134724 ) ) ( not ( = ?auto_134723 ?auto_134725 ) ) ( not ( = ?auto_134723 ?auto_134727 ) ) ( not ( = ?auto_134723 ?auto_134726 ) ) ( not ( = ?auto_134723 ?auto_134728 ) ) ( not ( = ?auto_134723 ?auto_134729 ) ) ( not ( = ?auto_134723 ?auto_134730 ) ) ( not ( = ?auto_134723 ?auto_134731 ) ) ( not ( = ?auto_134724 ?auto_134725 ) ) ( not ( = ?auto_134724 ?auto_134727 ) ) ( not ( = ?auto_134724 ?auto_134726 ) ) ( not ( = ?auto_134724 ?auto_134728 ) ) ( not ( = ?auto_134724 ?auto_134729 ) ) ( not ( = ?auto_134724 ?auto_134730 ) ) ( not ( = ?auto_134724 ?auto_134731 ) ) ( not ( = ?auto_134725 ?auto_134727 ) ) ( not ( = ?auto_134725 ?auto_134726 ) ) ( not ( = ?auto_134725 ?auto_134728 ) ) ( not ( = ?auto_134725 ?auto_134729 ) ) ( not ( = ?auto_134725 ?auto_134730 ) ) ( not ( = ?auto_134725 ?auto_134731 ) ) ( not ( = ?auto_134727 ?auto_134726 ) ) ( not ( = ?auto_134727 ?auto_134728 ) ) ( not ( = ?auto_134727 ?auto_134729 ) ) ( not ( = ?auto_134727 ?auto_134730 ) ) ( not ( = ?auto_134727 ?auto_134731 ) ) ( not ( = ?auto_134726 ?auto_134728 ) ) ( not ( = ?auto_134726 ?auto_134729 ) ) ( not ( = ?auto_134726 ?auto_134730 ) ) ( not ( = ?auto_134726 ?auto_134731 ) ) ( not ( = ?auto_134728 ?auto_134729 ) ) ( not ( = ?auto_134728 ?auto_134730 ) ) ( not ( = ?auto_134728 ?auto_134731 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134729 ?auto_134730 ?auto_134731 )
      ( MAKE-8CRATE-VERIFY ?auto_134723 ?auto_134724 ?auto_134725 ?auto_134727 ?auto_134726 ?auto_134728 ?auto_134729 ?auto_134730 ?auto_134731 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134799 - SURFACE
      ?auto_134800 - SURFACE
      ?auto_134801 - SURFACE
      ?auto_134803 - SURFACE
      ?auto_134802 - SURFACE
      ?auto_134804 - SURFACE
      ?auto_134805 - SURFACE
      ?auto_134806 - SURFACE
      ?auto_134807 - SURFACE
    )
    :vars
    (
      ?auto_134809 - HOIST
      ?auto_134811 - PLACE
      ?auto_134810 - TRUCK
      ?auto_134808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_134809 ?auto_134811 ) ( SURFACE-AT ?auto_134806 ?auto_134811 ) ( CLEAR ?auto_134806 ) ( IS-CRATE ?auto_134807 ) ( not ( = ?auto_134806 ?auto_134807 ) ) ( AVAILABLE ?auto_134809 ) ( IN ?auto_134807 ?auto_134810 ) ( ON ?auto_134806 ?auto_134805 ) ( not ( = ?auto_134805 ?auto_134806 ) ) ( not ( = ?auto_134805 ?auto_134807 ) ) ( TRUCK-AT ?auto_134810 ?auto_134808 ) ( not ( = ?auto_134808 ?auto_134811 ) ) ( ON ?auto_134800 ?auto_134799 ) ( ON ?auto_134801 ?auto_134800 ) ( ON ?auto_134803 ?auto_134801 ) ( ON ?auto_134802 ?auto_134803 ) ( ON ?auto_134804 ?auto_134802 ) ( ON ?auto_134805 ?auto_134804 ) ( not ( = ?auto_134799 ?auto_134800 ) ) ( not ( = ?auto_134799 ?auto_134801 ) ) ( not ( = ?auto_134799 ?auto_134803 ) ) ( not ( = ?auto_134799 ?auto_134802 ) ) ( not ( = ?auto_134799 ?auto_134804 ) ) ( not ( = ?auto_134799 ?auto_134805 ) ) ( not ( = ?auto_134799 ?auto_134806 ) ) ( not ( = ?auto_134799 ?auto_134807 ) ) ( not ( = ?auto_134800 ?auto_134801 ) ) ( not ( = ?auto_134800 ?auto_134803 ) ) ( not ( = ?auto_134800 ?auto_134802 ) ) ( not ( = ?auto_134800 ?auto_134804 ) ) ( not ( = ?auto_134800 ?auto_134805 ) ) ( not ( = ?auto_134800 ?auto_134806 ) ) ( not ( = ?auto_134800 ?auto_134807 ) ) ( not ( = ?auto_134801 ?auto_134803 ) ) ( not ( = ?auto_134801 ?auto_134802 ) ) ( not ( = ?auto_134801 ?auto_134804 ) ) ( not ( = ?auto_134801 ?auto_134805 ) ) ( not ( = ?auto_134801 ?auto_134806 ) ) ( not ( = ?auto_134801 ?auto_134807 ) ) ( not ( = ?auto_134803 ?auto_134802 ) ) ( not ( = ?auto_134803 ?auto_134804 ) ) ( not ( = ?auto_134803 ?auto_134805 ) ) ( not ( = ?auto_134803 ?auto_134806 ) ) ( not ( = ?auto_134803 ?auto_134807 ) ) ( not ( = ?auto_134802 ?auto_134804 ) ) ( not ( = ?auto_134802 ?auto_134805 ) ) ( not ( = ?auto_134802 ?auto_134806 ) ) ( not ( = ?auto_134802 ?auto_134807 ) ) ( not ( = ?auto_134804 ?auto_134805 ) ) ( not ( = ?auto_134804 ?auto_134806 ) ) ( not ( = ?auto_134804 ?auto_134807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134805 ?auto_134806 ?auto_134807 )
      ( MAKE-8CRATE-VERIFY ?auto_134799 ?auto_134800 ?auto_134801 ?auto_134803 ?auto_134802 ?auto_134804 ?auto_134805 ?auto_134806 ?auto_134807 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134883 - SURFACE
      ?auto_134884 - SURFACE
      ?auto_134885 - SURFACE
      ?auto_134887 - SURFACE
      ?auto_134886 - SURFACE
      ?auto_134888 - SURFACE
      ?auto_134889 - SURFACE
      ?auto_134890 - SURFACE
      ?auto_134891 - SURFACE
    )
    :vars
    (
      ?auto_134896 - HOIST
      ?auto_134892 - PLACE
      ?auto_134894 - TRUCK
      ?auto_134895 - PLACE
      ?auto_134893 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_134896 ?auto_134892 ) ( SURFACE-AT ?auto_134890 ?auto_134892 ) ( CLEAR ?auto_134890 ) ( IS-CRATE ?auto_134891 ) ( not ( = ?auto_134890 ?auto_134891 ) ) ( AVAILABLE ?auto_134896 ) ( ON ?auto_134890 ?auto_134889 ) ( not ( = ?auto_134889 ?auto_134890 ) ) ( not ( = ?auto_134889 ?auto_134891 ) ) ( TRUCK-AT ?auto_134894 ?auto_134895 ) ( not ( = ?auto_134895 ?auto_134892 ) ) ( HOIST-AT ?auto_134893 ?auto_134895 ) ( LIFTING ?auto_134893 ?auto_134891 ) ( not ( = ?auto_134896 ?auto_134893 ) ) ( ON ?auto_134884 ?auto_134883 ) ( ON ?auto_134885 ?auto_134884 ) ( ON ?auto_134887 ?auto_134885 ) ( ON ?auto_134886 ?auto_134887 ) ( ON ?auto_134888 ?auto_134886 ) ( ON ?auto_134889 ?auto_134888 ) ( not ( = ?auto_134883 ?auto_134884 ) ) ( not ( = ?auto_134883 ?auto_134885 ) ) ( not ( = ?auto_134883 ?auto_134887 ) ) ( not ( = ?auto_134883 ?auto_134886 ) ) ( not ( = ?auto_134883 ?auto_134888 ) ) ( not ( = ?auto_134883 ?auto_134889 ) ) ( not ( = ?auto_134883 ?auto_134890 ) ) ( not ( = ?auto_134883 ?auto_134891 ) ) ( not ( = ?auto_134884 ?auto_134885 ) ) ( not ( = ?auto_134884 ?auto_134887 ) ) ( not ( = ?auto_134884 ?auto_134886 ) ) ( not ( = ?auto_134884 ?auto_134888 ) ) ( not ( = ?auto_134884 ?auto_134889 ) ) ( not ( = ?auto_134884 ?auto_134890 ) ) ( not ( = ?auto_134884 ?auto_134891 ) ) ( not ( = ?auto_134885 ?auto_134887 ) ) ( not ( = ?auto_134885 ?auto_134886 ) ) ( not ( = ?auto_134885 ?auto_134888 ) ) ( not ( = ?auto_134885 ?auto_134889 ) ) ( not ( = ?auto_134885 ?auto_134890 ) ) ( not ( = ?auto_134885 ?auto_134891 ) ) ( not ( = ?auto_134887 ?auto_134886 ) ) ( not ( = ?auto_134887 ?auto_134888 ) ) ( not ( = ?auto_134887 ?auto_134889 ) ) ( not ( = ?auto_134887 ?auto_134890 ) ) ( not ( = ?auto_134887 ?auto_134891 ) ) ( not ( = ?auto_134886 ?auto_134888 ) ) ( not ( = ?auto_134886 ?auto_134889 ) ) ( not ( = ?auto_134886 ?auto_134890 ) ) ( not ( = ?auto_134886 ?auto_134891 ) ) ( not ( = ?auto_134888 ?auto_134889 ) ) ( not ( = ?auto_134888 ?auto_134890 ) ) ( not ( = ?auto_134888 ?auto_134891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134889 ?auto_134890 ?auto_134891 )
      ( MAKE-8CRATE-VERIFY ?auto_134883 ?auto_134884 ?auto_134885 ?auto_134887 ?auto_134886 ?auto_134888 ?auto_134889 ?auto_134890 ?auto_134891 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_134975 - SURFACE
      ?auto_134976 - SURFACE
      ?auto_134977 - SURFACE
      ?auto_134979 - SURFACE
      ?auto_134978 - SURFACE
      ?auto_134980 - SURFACE
      ?auto_134981 - SURFACE
      ?auto_134982 - SURFACE
      ?auto_134983 - SURFACE
    )
    :vars
    (
      ?auto_134989 - HOIST
      ?auto_134984 - PLACE
      ?auto_134985 - TRUCK
      ?auto_134986 - PLACE
      ?auto_134988 - HOIST
      ?auto_134987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_134989 ?auto_134984 ) ( SURFACE-AT ?auto_134982 ?auto_134984 ) ( CLEAR ?auto_134982 ) ( IS-CRATE ?auto_134983 ) ( not ( = ?auto_134982 ?auto_134983 ) ) ( AVAILABLE ?auto_134989 ) ( ON ?auto_134982 ?auto_134981 ) ( not ( = ?auto_134981 ?auto_134982 ) ) ( not ( = ?auto_134981 ?auto_134983 ) ) ( TRUCK-AT ?auto_134985 ?auto_134986 ) ( not ( = ?auto_134986 ?auto_134984 ) ) ( HOIST-AT ?auto_134988 ?auto_134986 ) ( not ( = ?auto_134989 ?auto_134988 ) ) ( AVAILABLE ?auto_134988 ) ( SURFACE-AT ?auto_134983 ?auto_134986 ) ( ON ?auto_134983 ?auto_134987 ) ( CLEAR ?auto_134983 ) ( not ( = ?auto_134982 ?auto_134987 ) ) ( not ( = ?auto_134983 ?auto_134987 ) ) ( not ( = ?auto_134981 ?auto_134987 ) ) ( ON ?auto_134976 ?auto_134975 ) ( ON ?auto_134977 ?auto_134976 ) ( ON ?auto_134979 ?auto_134977 ) ( ON ?auto_134978 ?auto_134979 ) ( ON ?auto_134980 ?auto_134978 ) ( ON ?auto_134981 ?auto_134980 ) ( not ( = ?auto_134975 ?auto_134976 ) ) ( not ( = ?auto_134975 ?auto_134977 ) ) ( not ( = ?auto_134975 ?auto_134979 ) ) ( not ( = ?auto_134975 ?auto_134978 ) ) ( not ( = ?auto_134975 ?auto_134980 ) ) ( not ( = ?auto_134975 ?auto_134981 ) ) ( not ( = ?auto_134975 ?auto_134982 ) ) ( not ( = ?auto_134975 ?auto_134983 ) ) ( not ( = ?auto_134975 ?auto_134987 ) ) ( not ( = ?auto_134976 ?auto_134977 ) ) ( not ( = ?auto_134976 ?auto_134979 ) ) ( not ( = ?auto_134976 ?auto_134978 ) ) ( not ( = ?auto_134976 ?auto_134980 ) ) ( not ( = ?auto_134976 ?auto_134981 ) ) ( not ( = ?auto_134976 ?auto_134982 ) ) ( not ( = ?auto_134976 ?auto_134983 ) ) ( not ( = ?auto_134976 ?auto_134987 ) ) ( not ( = ?auto_134977 ?auto_134979 ) ) ( not ( = ?auto_134977 ?auto_134978 ) ) ( not ( = ?auto_134977 ?auto_134980 ) ) ( not ( = ?auto_134977 ?auto_134981 ) ) ( not ( = ?auto_134977 ?auto_134982 ) ) ( not ( = ?auto_134977 ?auto_134983 ) ) ( not ( = ?auto_134977 ?auto_134987 ) ) ( not ( = ?auto_134979 ?auto_134978 ) ) ( not ( = ?auto_134979 ?auto_134980 ) ) ( not ( = ?auto_134979 ?auto_134981 ) ) ( not ( = ?auto_134979 ?auto_134982 ) ) ( not ( = ?auto_134979 ?auto_134983 ) ) ( not ( = ?auto_134979 ?auto_134987 ) ) ( not ( = ?auto_134978 ?auto_134980 ) ) ( not ( = ?auto_134978 ?auto_134981 ) ) ( not ( = ?auto_134978 ?auto_134982 ) ) ( not ( = ?auto_134978 ?auto_134983 ) ) ( not ( = ?auto_134978 ?auto_134987 ) ) ( not ( = ?auto_134980 ?auto_134981 ) ) ( not ( = ?auto_134980 ?auto_134982 ) ) ( not ( = ?auto_134980 ?auto_134983 ) ) ( not ( = ?auto_134980 ?auto_134987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_134981 ?auto_134982 ?auto_134983 )
      ( MAKE-8CRATE-VERIFY ?auto_134975 ?auto_134976 ?auto_134977 ?auto_134979 ?auto_134978 ?auto_134980 ?auto_134981 ?auto_134982 ?auto_134983 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135068 - SURFACE
      ?auto_135069 - SURFACE
      ?auto_135070 - SURFACE
      ?auto_135072 - SURFACE
      ?auto_135071 - SURFACE
      ?auto_135073 - SURFACE
      ?auto_135074 - SURFACE
      ?auto_135075 - SURFACE
      ?auto_135076 - SURFACE
    )
    :vars
    (
      ?auto_135077 - HOIST
      ?auto_135082 - PLACE
      ?auto_135078 - PLACE
      ?auto_135080 - HOIST
      ?auto_135079 - SURFACE
      ?auto_135081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135077 ?auto_135082 ) ( SURFACE-AT ?auto_135075 ?auto_135082 ) ( CLEAR ?auto_135075 ) ( IS-CRATE ?auto_135076 ) ( not ( = ?auto_135075 ?auto_135076 ) ) ( AVAILABLE ?auto_135077 ) ( ON ?auto_135075 ?auto_135074 ) ( not ( = ?auto_135074 ?auto_135075 ) ) ( not ( = ?auto_135074 ?auto_135076 ) ) ( not ( = ?auto_135078 ?auto_135082 ) ) ( HOIST-AT ?auto_135080 ?auto_135078 ) ( not ( = ?auto_135077 ?auto_135080 ) ) ( AVAILABLE ?auto_135080 ) ( SURFACE-AT ?auto_135076 ?auto_135078 ) ( ON ?auto_135076 ?auto_135079 ) ( CLEAR ?auto_135076 ) ( not ( = ?auto_135075 ?auto_135079 ) ) ( not ( = ?auto_135076 ?auto_135079 ) ) ( not ( = ?auto_135074 ?auto_135079 ) ) ( TRUCK-AT ?auto_135081 ?auto_135082 ) ( ON ?auto_135069 ?auto_135068 ) ( ON ?auto_135070 ?auto_135069 ) ( ON ?auto_135072 ?auto_135070 ) ( ON ?auto_135071 ?auto_135072 ) ( ON ?auto_135073 ?auto_135071 ) ( ON ?auto_135074 ?auto_135073 ) ( not ( = ?auto_135068 ?auto_135069 ) ) ( not ( = ?auto_135068 ?auto_135070 ) ) ( not ( = ?auto_135068 ?auto_135072 ) ) ( not ( = ?auto_135068 ?auto_135071 ) ) ( not ( = ?auto_135068 ?auto_135073 ) ) ( not ( = ?auto_135068 ?auto_135074 ) ) ( not ( = ?auto_135068 ?auto_135075 ) ) ( not ( = ?auto_135068 ?auto_135076 ) ) ( not ( = ?auto_135068 ?auto_135079 ) ) ( not ( = ?auto_135069 ?auto_135070 ) ) ( not ( = ?auto_135069 ?auto_135072 ) ) ( not ( = ?auto_135069 ?auto_135071 ) ) ( not ( = ?auto_135069 ?auto_135073 ) ) ( not ( = ?auto_135069 ?auto_135074 ) ) ( not ( = ?auto_135069 ?auto_135075 ) ) ( not ( = ?auto_135069 ?auto_135076 ) ) ( not ( = ?auto_135069 ?auto_135079 ) ) ( not ( = ?auto_135070 ?auto_135072 ) ) ( not ( = ?auto_135070 ?auto_135071 ) ) ( not ( = ?auto_135070 ?auto_135073 ) ) ( not ( = ?auto_135070 ?auto_135074 ) ) ( not ( = ?auto_135070 ?auto_135075 ) ) ( not ( = ?auto_135070 ?auto_135076 ) ) ( not ( = ?auto_135070 ?auto_135079 ) ) ( not ( = ?auto_135072 ?auto_135071 ) ) ( not ( = ?auto_135072 ?auto_135073 ) ) ( not ( = ?auto_135072 ?auto_135074 ) ) ( not ( = ?auto_135072 ?auto_135075 ) ) ( not ( = ?auto_135072 ?auto_135076 ) ) ( not ( = ?auto_135072 ?auto_135079 ) ) ( not ( = ?auto_135071 ?auto_135073 ) ) ( not ( = ?auto_135071 ?auto_135074 ) ) ( not ( = ?auto_135071 ?auto_135075 ) ) ( not ( = ?auto_135071 ?auto_135076 ) ) ( not ( = ?auto_135071 ?auto_135079 ) ) ( not ( = ?auto_135073 ?auto_135074 ) ) ( not ( = ?auto_135073 ?auto_135075 ) ) ( not ( = ?auto_135073 ?auto_135076 ) ) ( not ( = ?auto_135073 ?auto_135079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135074 ?auto_135075 ?auto_135076 )
      ( MAKE-8CRATE-VERIFY ?auto_135068 ?auto_135069 ?auto_135070 ?auto_135072 ?auto_135071 ?auto_135073 ?auto_135074 ?auto_135075 ?auto_135076 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135161 - SURFACE
      ?auto_135162 - SURFACE
      ?auto_135163 - SURFACE
      ?auto_135165 - SURFACE
      ?auto_135164 - SURFACE
      ?auto_135166 - SURFACE
      ?auto_135167 - SURFACE
      ?auto_135168 - SURFACE
      ?auto_135169 - SURFACE
    )
    :vars
    (
      ?auto_135175 - HOIST
      ?auto_135171 - PLACE
      ?auto_135172 - PLACE
      ?auto_135170 - HOIST
      ?auto_135174 - SURFACE
      ?auto_135173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135175 ?auto_135171 ) ( IS-CRATE ?auto_135169 ) ( not ( = ?auto_135168 ?auto_135169 ) ) ( not ( = ?auto_135167 ?auto_135168 ) ) ( not ( = ?auto_135167 ?auto_135169 ) ) ( not ( = ?auto_135172 ?auto_135171 ) ) ( HOIST-AT ?auto_135170 ?auto_135172 ) ( not ( = ?auto_135175 ?auto_135170 ) ) ( AVAILABLE ?auto_135170 ) ( SURFACE-AT ?auto_135169 ?auto_135172 ) ( ON ?auto_135169 ?auto_135174 ) ( CLEAR ?auto_135169 ) ( not ( = ?auto_135168 ?auto_135174 ) ) ( not ( = ?auto_135169 ?auto_135174 ) ) ( not ( = ?auto_135167 ?auto_135174 ) ) ( TRUCK-AT ?auto_135173 ?auto_135171 ) ( SURFACE-AT ?auto_135167 ?auto_135171 ) ( CLEAR ?auto_135167 ) ( LIFTING ?auto_135175 ?auto_135168 ) ( IS-CRATE ?auto_135168 ) ( ON ?auto_135162 ?auto_135161 ) ( ON ?auto_135163 ?auto_135162 ) ( ON ?auto_135165 ?auto_135163 ) ( ON ?auto_135164 ?auto_135165 ) ( ON ?auto_135166 ?auto_135164 ) ( ON ?auto_135167 ?auto_135166 ) ( not ( = ?auto_135161 ?auto_135162 ) ) ( not ( = ?auto_135161 ?auto_135163 ) ) ( not ( = ?auto_135161 ?auto_135165 ) ) ( not ( = ?auto_135161 ?auto_135164 ) ) ( not ( = ?auto_135161 ?auto_135166 ) ) ( not ( = ?auto_135161 ?auto_135167 ) ) ( not ( = ?auto_135161 ?auto_135168 ) ) ( not ( = ?auto_135161 ?auto_135169 ) ) ( not ( = ?auto_135161 ?auto_135174 ) ) ( not ( = ?auto_135162 ?auto_135163 ) ) ( not ( = ?auto_135162 ?auto_135165 ) ) ( not ( = ?auto_135162 ?auto_135164 ) ) ( not ( = ?auto_135162 ?auto_135166 ) ) ( not ( = ?auto_135162 ?auto_135167 ) ) ( not ( = ?auto_135162 ?auto_135168 ) ) ( not ( = ?auto_135162 ?auto_135169 ) ) ( not ( = ?auto_135162 ?auto_135174 ) ) ( not ( = ?auto_135163 ?auto_135165 ) ) ( not ( = ?auto_135163 ?auto_135164 ) ) ( not ( = ?auto_135163 ?auto_135166 ) ) ( not ( = ?auto_135163 ?auto_135167 ) ) ( not ( = ?auto_135163 ?auto_135168 ) ) ( not ( = ?auto_135163 ?auto_135169 ) ) ( not ( = ?auto_135163 ?auto_135174 ) ) ( not ( = ?auto_135165 ?auto_135164 ) ) ( not ( = ?auto_135165 ?auto_135166 ) ) ( not ( = ?auto_135165 ?auto_135167 ) ) ( not ( = ?auto_135165 ?auto_135168 ) ) ( not ( = ?auto_135165 ?auto_135169 ) ) ( not ( = ?auto_135165 ?auto_135174 ) ) ( not ( = ?auto_135164 ?auto_135166 ) ) ( not ( = ?auto_135164 ?auto_135167 ) ) ( not ( = ?auto_135164 ?auto_135168 ) ) ( not ( = ?auto_135164 ?auto_135169 ) ) ( not ( = ?auto_135164 ?auto_135174 ) ) ( not ( = ?auto_135166 ?auto_135167 ) ) ( not ( = ?auto_135166 ?auto_135168 ) ) ( not ( = ?auto_135166 ?auto_135169 ) ) ( not ( = ?auto_135166 ?auto_135174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135167 ?auto_135168 ?auto_135169 )
      ( MAKE-8CRATE-VERIFY ?auto_135161 ?auto_135162 ?auto_135163 ?auto_135165 ?auto_135164 ?auto_135166 ?auto_135167 ?auto_135168 ?auto_135169 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_135254 - SURFACE
      ?auto_135255 - SURFACE
      ?auto_135256 - SURFACE
      ?auto_135258 - SURFACE
      ?auto_135257 - SURFACE
      ?auto_135259 - SURFACE
      ?auto_135260 - SURFACE
      ?auto_135261 - SURFACE
      ?auto_135262 - SURFACE
    )
    :vars
    (
      ?auto_135267 - HOIST
      ?auto_135268 - PLACE
      ?auto_135263 - PLACE
      ?auto_135265 - HOIST
      ?auto_135264 - SURFACE
      ?auto_135266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135267 ?auto_135268 ) ( IS-CRATE ?auto_135262 ) ( not ( = ?auto_135261 ?auto_135262 ) ) ( not ( = ?auto_135260 ?auto_135261 ) ) ( not ( = ?auto_135260 ?auto_135262 ) ) ( not ( = ?auto_135263 ?auto_135268 ) ) ( HOIST-AT ?auto_135265 ?auto_135263 ) ( not ( = ?auto_135267 ?auto_135265 ) ) ( AVAILABLE ?auto_135265 ) ( SURFACE-AT ?auto_135262 ?auto_135263 ) ( ON ?auto_135262 ?auto_135264 ) ( CLEAR ?auto_135262 ) ( not ( = ?auto_135261 ?auto_135264 ) ) ( not ( = ?auto_135262 ?auto_135264 ) ) ( not ( = ?auto_135260 ?auto_135264 ) ) ( TRUCK-AT ?auto_135266 ?auto_135268 ) ( SURFACE-AT ?auto_135260 ?auto_135268 ) ( CLEAR ?auto_135260 ) ( IS-CRATE ?auto_135261 ) ( AVAILABLE ?auto_135267 ) ( IN ?auto_135261 ?auto_135266 ) ( ON ?auto_135255 ?auto_135254 ) ( ON ?auto_135256 ?auto_135255 ) ( ON ?auto_135258 ?auto_135256 ) ( ON ?auto_135257 ?auto_135258 ) ( ON ?auto_135259 ?auto_135257 ) ( ON ?auto_135260 ?auto_135259 ) ( not ( = ?auto_135254 ?auto_135255 ) ) ( not ( = ?auto_135254 ?auto_135256 ) ) ( not ( = ?auto_135254 ?auto_135258 ) ) ( not ( = ?auto_135254 ?auto_135257 ) ) ( not ( = ?auto_135254 ?auto_135259 ) ) ( not ( = ?auto_135254 ?auto_135260 ) ) ( not ( = ?auto_135254 ?auto_135261 ) ) ( not ( = ?auto_135254 ?auto_135262 ) ) ( not ( = ?auto_135254 ?auto_135264 ) ) ( not ( = ?auto_135255 ?auto_135256 ) ) ( not ( = ?auto_135255 ?auto_135258 ) ) ( not ( = ?auto_135255 ?auto_135257 ) ) ( not ( = ?auto_135255 ?auto_135259 ) ) ( not ( = ?auto_135255 ?auto_135260 ) ) ( not ( = ?auto_135255 ?auto_135261 ) ) ( not ( = ?auto_135255 ?auto_135262 ) ) ( not ( = ?auto_135255 ?auto_135264 ) ) ( not ( = ?auto_135256 ?auto_135258 ) ) ( not ( = ?auto_135256 ?auto_135257 ) ) ( not ( = ?auto_135256 ?auto_135259 ) ) ( not ( = ?auto_135256 ?auto_135260 ) ) ( not ( = ?auto_135256 ?auto_135261 ) ) ( not ( = ?auto_135256 ?auto_135262 ) ) ( not ( = ?auto_135256 ?auto_135264 ) ) ( not ( = ?auto_135258 ?auto_135257 ) ) ( not ( = ?auto_135258 ?auto_135259 ) ) ( not ( = ?auto_135258 ?auto_135260 ) ) ( not ( = ?auto_135258 ?auto_135261 ) ) ( not ( = ?auto_135258 ?auto_135262 ) ) ( not ( = ?auto_135258 ?auto_135264 ) ) ( not ( = ?auto_135257 ?auto_135259 ) ) ( not ( = ?auto_135257 ?auto_135260 ) ) ( not ( = ?auto_135257 ?auto_135261 ) ) ( not ( = ?auto_135257 ?auto_135262 ) ) ( not ( = ?auto_135257 ?auto_135264 ) ) ( not ( = ?auto_135259 ?auto_135260 ) ) ( not ( = ?auto_135259 ?auto_135261 ) ) ( not ( = ?auto_135259 ?auto_135262 ) ) ( not ( = ?auto_135259 ?auto_135264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_135260 ?auto_135261 ?auto_135262 )
      ( MAKE-8CRATE-VERIFY ?auto_135254 ?auto_135255 ?auto_135256 ?auto_135258 ?auto_135257 ?auto_135259 ?auto_135260 ?auto_135261 ?auto_135262 ) )
  )

)

