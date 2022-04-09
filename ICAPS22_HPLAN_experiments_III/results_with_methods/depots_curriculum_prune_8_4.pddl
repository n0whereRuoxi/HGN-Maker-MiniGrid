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
      ?auto_4750 - SURFACE
      ?auto_4751 - SURFACE
    )
    :vars
    (
      ?auto_4752 - HOIST
      ?auto_4753 - PLACE
      ?auto_4755 - PLACE
      ?auto_4756 - HOIST
      ?auto_4757 - SURFACE
      ?auto_4754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4752 ?auto_4753 ) ( SURFACE-AT ?auto_4750 ?auto_4753 ) ( CLEAR ?auto_4750 ) ( IS-CRATE ?auto_4751 ) ( AVAILABLE ?auto_4752 ) ( not ( = ?auto_4755 ?auto_4753 ) ) ( HOIST-AT ?auto_4756 ?auto_4755 ) ( AVAILABLE ?auto_4756 ) ( SURFACE-AT ?auto_4751 ?auto_4755 ) ( ON ?auto_4751 ?auto_4757 ) ( CLEAR ?auto_4751 ) ( TRUCK-AT ?auto_4754 ?auto_4753 ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4750 ?auto_4757 ) ) ( not ( = ?auto_4751 ?auto_4757 ) ) ( not ( = ?auto_4752 ?auto_4756 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4754 ?auto_4753 ?auto_4755 )
      ( !LIFT ?auto_4756 ?auto_4751 ?auto_4757 ?auto_4755 )
      ( !LOAD ?auto_4756 ?auto_4751 ?auto_4754 ?auto_4755 )
      ( !DRIVE ?auto_4754 ?auto_4755 ?auto_4753 )
      ( !UNLOAD ?auto_4752 ?auto_4751 ?auto_4754 ?auto_4753 )
      ( !DROP ?auto_4752 ?auto_4751 ?auto_4750 ?auto_4753 )
      ( MAKE-1CRATE-VERIFY ?auto_4750 ?auto_4751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4771 - SURFACE
      ?auto_4772 - SURFACE
      ?auto_4773 - SURFACE
    )
    :vars
    (
      ?auto_4779 - HOIST
      ?auto_4774 - PLACE
      ?auto_4776 - PLACE
      ?auto_4777 - HOIST
      ?auto_4775 - SURFACE
      ?auto_4780 - PLACE
      ?auto_4782 - HOIST
      ?auto_4781 - SURFACE
      ?auto_4778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4779 ?auto_4774 ) ( IS-CRATE ?auto_4773 ) ( not ( = ?auto_4776 ?auto_4774 ) ) ( HOIST-AT ?auto_4777 ?auto_4776 ) ( AVAILABLE ?auto_4777 ) ( SURFACE-AT ?auto_4773 ?auto_4776 ) ( ON ?auto_4773 ?auto_4775 ) ( CLEAR ?auto_4773 ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4775 ) ) ( not ( = ?auto_4773 ?auto_4775 ) ) ( not ( = ?auto_4779 ?auto_4777 ) ) ( SURFACE-AT ?auto_4771 ?auto_4774 ) ( CLEAR ?auto_4771 ) ( IS-CRATE ?auto_4772 ) ( AVAILABLE ?auto_4779 ) ( not ( = ?auto_4780 ?auto_4774 ) ) ( HOIST-AT ?auto_4782 ?auto_4780 ) ( AVAILABLE ?auto_4782 ) ( SURFACE-AT ?auto_4772 ?auto_4780 ) ( ON ?auto_4772 ?auto_4781 ) ( CLEAR ?auto_4772 ) ( TRUCK-AT ?auto_4778 ?auto_4774 ) ( not ( = ?auto_4771 ?auto_4772 ) ) ( not ( = ?auto_4771 ?auto_4781 ) ) ( not ( = ?auto_4772 ?auto_4781 ) ) ( not ( = ?auto_4779 ?auto_4782 ) ) ( not ( = ?auto_4771 ?auto_4773 ) ) ( not ( = ?auto_4771 ?auto_4775 ) ) ( not ( = ?auto_4773 ?auto_4781 ) ) ( not ( = ?auto_4776 ?auto_4780 ) ) ( not ( = ?auto_4777 ?auto_4782 ) ) ( not ( = ?auto_4775 ?auto_4781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4771 ?auto_4772 )
      ( MAKE-1CRATE ?auto_4772 ?auto_4773 )
      ( MAKE-2CRATE-VERIFY ?auto_4771 ?auto_4772 ?auto_4773 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4797 - SURFACE
      ?auto_4798 - SURFACE
      ?auto_4799 - SURFACE
      ?auto_4800 - SURFACE
    )
    :vars
    (
      ?auto_4803 - HOIST
      ?auto_4805 - PLACE
      ?auto_4802 - PLACE
      ?auto_4801 - HOIST
      ?auto_4804 - SURFACE
      ?auto_4812 - PLACE
      ?auto_4811 - HOIST
      ?auto_4808 - SURFACE
      ?auto_4807 - PLACE
      ?auto_4809 - HOIST
      ?auto_4810 - SURFACE
      ?auto_4806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4803 ?auto_4805 ) ( IS-CRATE ?auto_4800 ) ( not ( = ?auto_4802 ?auto_4805 ) ) ( HOIST-AT ?auto_4801 ?auto_4802 ) ( AVAILABLE ?auto_4801 ) ( SURFACE-AT ?auto_4800 ?auto_4802 ) ( ON ?auto_4800 ?auto_4804 ) ( CLEAR ?auto_4800 ) ( not ( = ?auto_4799 ?auto_4800 ) ) ( not ( = ?auto_4799 ?auto_4804 ) ) ( not ( = ?auto_4800 ?auto_4804 ) ) ( not ( = ?auto_4803 ?auto_4801 ) ) ( IS-CRATE ?auto_4799 ) ( not ( = ?auto_4812 ?auto_4805 ) ) ( HOIST-AT ?auto_4811 ?auto_4812 ) ( AVAILABLE ?auto_4811 ) ( SURFACE-AT ?auto_4799 ?auto_4812 ) ( ON ?auto_4799 ?auto_4808 ) ( CLEAR ?auto_4799 ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4808 ) ) ( not ( = ?auto_4799 ?auto_4808 ) ) ( not ( = ?auto_4803 ?auto_4811 ) ) ( SURFACE-AT ?auto_4797 ?auto_4805 ) ( CLEAR ?auto_4797 ) ( IS-CRATE ?auto_4798 ) ( AVAILABLE ?auto_4803 ) ( not ( = ?auto_4807 ?auto_4805 ) ) ( HOIST-AT ?auto_4809 ?auto_4807 ) ( AVAILABLE ?auto_4809 ) ( SURFACE-AT ?auto_4798 ?auto_4807 ) ( ON ?auto_4798 ?auto_4810 ) ( CLEAR ?auto_4798 ) ( TRUCK-AT ?auto_4806 ?auto_4805 ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( not ( = ?auto_4797 ?auto_4810 ) ) ( not ( = ?auto_4798 ?auto_4810 ) ) ( not ( = ?auto_4803 ?auto_4809 ) ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( not ( = ?auto_4797 ?auto_4808 ) ) ( not ( = ?auto_4799 ?auto_4810 ) ) ( not ( = ?auto_4812 ?auto_4807 ) ) ( not ( = ?auto_4811 ?auto_4809 ) ) ( not ( = ?auto_4808 ?auto_4810 ) ) ( not ( = ?auto_4797 ?auto_4800 ) ) ( not ( = ?auto_4797 ?auto_4804 ) ) ( not ( = ?auto_4798 ?auto_4800 ) ) ( not ( = ?auto_4798 ?auto_4804 ) ) ( not ( = ?auto_4800 ?auto_4808 ) ) ( not ( = ?auto_4800 ?auto_4810 ) ) ( not ( = ?auto_4802 ?auto_4812 ) ) ( not ( = ?auto_4802 ?auto_4807 ) ) ( not ( = ?auto_4801 ?auto_4811 ) ) ( not ( = ?auto_4801 ?auto_4809 ) ) ( not ( = ?auto_4804 ?auto_4808 ) ) ( not ( = ?auto_4804 ?auto_4810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4797 ?auto_4798 ?auto_4799 )
      ( MAKE-1CRATE ?auto_4799 ?auto_4800 )
      ( MAKE-3CRATE-VERIFY ?auto_4797 ?auto_4798 ?auto_4799 ?auto_4800 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4828 - SURFACE
      ?auto_4829 - SURFACE
      ?auto_4830 - SURFACE
      ?auto_4831 - SURFACE
      ?auto_4832 - SURFACE
    )
    :vars
    (
      ?auto_4835 - HOIST
      ?auto_4833 - PLACE
      ?auto_4838 - PLACE
      ?auto_4836 - HOIST
      ?auto_4834 - SURFACE
      ?auto_4841 - PLACE
      ?auto_4842 - HOIST
      ?auto_4843 - SURFACE
      ?auto_4845 - PLACE
      ?auto_4839 - HOIST
      ?auto_4846 - SURFACE
      ?auto_4847 - PLACE
      ?auto_4840 - HOIST
      ?auto_4844 - SURFACE
      ?auto_4837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4835 ?auto_4833 ) ( IS-CRATE ?auto_4832 ) ( not ( = ?auto_4838 ?auto_4833 ) ) ( HOIST-AT ?auto_4836 ?auto_4838 ) ( AVAILABLE ?auto_4836 ) ( SURFACE-AT ?auto_4832 ?auto_4838 ) ( ON ?auto_4832 ?auto_4834 ) ( CLEAR ?auto_4832 ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( not ( = ?auto_4831 ?auto_4834 ) ) ( not ( = ?auto_4832 ?auto_4834 ) ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( IS-CRATE ?auto_4831 ) ( not ( = ?auto_4841 ?auto_4833 ) ) ( HOIST-AT ?auto_4842 ?auto_4841 ) ( AVAILABLE ?auto_4842 ) ( SURFACE-AT ?auto_4831 ?auto_4841 ) ( ON ?auto_4831 ?auto_4843 ) ( CLEAR ?auto_4831 ) ( not ( = ?auto_4830 ?auto_4831 ) ) ( not ( = ?auto_4830 ?auto_4843 ) ) ( not ( = ?auto_4831 ?auto_4843 ) ) ( not ( = ?auto_4835 ?auto_4842 ) ) ( IS-CRATE ?auto_4830 ) ( not ( = ?auto_4845 ?auto_4833 ) ) ( HOIST-AT ?auto_4839 ?auto_4845 ) ( AVAILABLE ?auto_4839 ) ( SURFACE-AT ?auto_4830 ?auto_4845 ) ( ON ?auto_4830 ?auto_4846 ) ( CLEAR ?auto_4830 ) ( not ( = ?auto_4829 ?auto_4830 ) ) ( not ( = ?auto_4829 ?auto_4846 ) ) ( not ( = ?auto_4830 ?auto_4846 ) ) ( not ( = ?auto_4835 ?auto_4839 ) ) ( SURFACE-AT ?auto_4828 ?auto_4833 ) ( CLEAR ?auto_4828 ) ( IS-CRATE ?auto_4829 ) ( AVAILABLE ?auto_4835 ) ( not ( = ?auto_4847 ?auto_4833 ) ) ( HOIST-AT ?auto_4840 ?auto_4847 ) ( AVAILABLE ?auto_4840 ) ( SURFACE-AT ?auto_4829 ?auto_4847 ) ( ON ?auto_4829 ?auto_4844 ) ( CLEAR ?auto_4829 ) ( TRUCK-AT ?auto_4837 ?auto_4833 ) ( not ( = ?auto_4828 ?auto_4829 ) ) ( not ( = ?auto_4828 ?auto_4844 ) ) ( not ( = ?auto_4829 ?auto_4844 ) ) ( not ( = ?auto_4835 ?auto_4840 ) ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4828 ?auto_4846 ) ) ( not ( = ?auto_4830 ?auto_4844 ) ) ( not ( = ?auto_4845 ?auto_4847 ) ) ( not ( = ?auto_4839 ?auto_4840 ) ) ( not ( = ?auto_4846 ?auto_4844 ) ) ( not ( = ?auto_4828 ?auto_4831 ) ) ( not ( = ?auto_4828 ?auto_4843 ) ) ( not ( = ?auto_4829 ?auto_4831 ) ) ( not ( = ?auto_4829 ?auto_4843 ) ) ( not ( = ?auto_4831 ?auto_4846 ) ) ( not ( = ?auto_4831 ?auto_4844 ) ) ( not ( = ?auto_4841 ?auto_4845 ) ) ( not ( = ?auto_4841 ?auto_4847 ) ) ( not ( = ?auto_4842 ?auto_4839 ) ) ( not ( = ?auto_4842 ?auto_4840 ) ) ( not ( = ?auto_4843 ?auto_4846 ) ) ( not ( = ?auto_4843 ?auto_4844 ) ) ( not ( = ?auto_4828 ?auto_4832 ) ) ( not ( = ?auto_4828 ?auto_4834 ) ) ( not ( = ?auto_4829 ?auto_4832 ) ) ( not ( = ?auto_4829 ?auto_4834 ) ) ( not ( = ?auto_4830 ?auto_4832 ) ) ( not ( = ?auto_4830 ?auto_4834 ) ) ( not ( = ?auto_4832 ?auto_4843 ) ) ( not ( = ?auto_4832 ?auto_4846 ) ) ( not ( = ?auto_4832 ?auto_4844 ) ) ( not ( = ?auto_4838 ?auto_4841 ) ) ( not ( = ?auto_4838 ?auto_4845 ) ) ( not ( = ?auto_4838 ?auto_4847 ) ) ( not ( = ?auto_4836 ?auto_4842 ) ) ( not ( = ?auto_4836 ?auto_4839 ) ) ( not ( = ?auto_4836 ?auto_4840 ) ) ( not ( = ?auto_4834 ?auto_4843 ) ) ( not ( = ?auto_4834 ?auto_4846 ) ) ( not ( = ?auto_4834 ?auto_4844 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4831 )
      ( MAKE-1CRATE ?auto_4831 ?auto_4832 )
      ( MAKE-4CRATE-VERIFY ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4831 ?auto_4832 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4864 - SURFACE
      ?auto_4865 - SURFACE
      ?auto_4866 - SURFACE
      ?auto_4867 - SURFACE
      ?auto_4868 - SURFACE
      ?auto_4869 - SURFACE
    )
    :vars
    (
      ?auto_4875 - HOIST
      ?auto_4872 - PLACE
      ?auto_4874 - PLACE
      ?auto_4870 - HOIST
      ?auto_4873 - SURFACE
      ?auto_4881 - PLACE
      ?auto_4879 - HOIST
      ?auto_4880 - SURFACE
      ?auto_4877 - PLACE
      ?auto_4882 - HOIST
      ?auto_4883 - SURFACE
      ?auto_4885 - SURFACE
      ?auto_4878 - PLACE
      ?auto_4884 - HOIST
      ?auto_4876 - SURFACE
      ?auto_4871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4875 ?auto_4872 ) ( IS-CRATE ?auto_4869 ) ( not ( = ?auto_4874 ?auto_4872 ) ) ( HOIST-AT ?auto_4870 ?auto_4874 ) ( SURFACE-AT ?auto_4869 ?auto_4874 ) ( ON ?auto_4869 ?auto_4873 ) ( CLEAR ?auto_4869 ) ( not ( = ?auto_4868 ?auto_4869 ) ) ( not ( = ?auto_4868 ?auto_4873 ) ) ( not ( = ?auto_4869 ?auto_4873 ) ) ( not ( = ?auto_4875 ?auto_4870 ) ) ( IS-CRATE ?auto_4868 ) ( not ( = ?auto_4881 ?auto_4872 ) ) ( HOIST-AT ?auto_4879 ?auto_4881 ) ( AVAILABLE ?auto_4879 ) ( SURFACE-AT ?auto_4868 ?auto_4881 ) ( ON ?auto_4868 ?auto_4880 ) ( CLEAR ?auto_4868 ) ( not ( = ?auto_4867 ?auto_4868 ) ) ( not ( = ?auto_4867 ?auto_4880 ) ) ( not ( = ?auto_4868 ?auto_4880 ) ) ( not ( = ?auto_4875 ?auto_4879 ) ) ( IS-CRATE ?auto_4867 ) ( not ( = ?auto_4877 ?auto_4872 ) ) ( HOIST-AT ?auto_4882 ?auto_4877 ) ( AVAILABLE ?auto_4882 ) ( SURFACE-AT ?auto_4867 ?auto_4877 ) ( ON ?auto_4867 ?auto_4883 ) ( CLEAR ?auto_4867 ) ( not ( = ?auto_4866 ?auto_4867 ) ) ( not ( = ?auto_4866 ?auto_4883 ) ) ( not ( = ?auto_4867 ?auto_4883 ) ) ( not ( = ?auto_4875 ?auto_4882 ) ) ( IS-CRATE ?auto_4866 ) ( AVAILABLE ?auto_4870 ) ( SURFACE-AT ?auto_4866 ?auto_4874 ) ( ON ?auto_4866 ?auto_4885 ) ( CLEAR ?auto_4866 ) ( not ( = ?auto_4865 ?auto_4866 ) ) ( not ( = ?auto_4865 ?auto_4885 ) ) ( not ( = ?auto_4866 ?auto_4885 ) ) ( SURFACE-AT ?auto_4864 ?auto_4872 ) ( CLEAR ?auto_4864 ) ( IS-CRATE ?auto_4865 ) ( AVAILABLE ?auto_4875 ) ( not ( = ?auto_4878 ?auto_4872 ) ) ( HOIST-AT ?auto_4884 ?auto_4878 ) ( AVAILABLE ?auto_4884 ) ( SURFACE-AT ?auto_4865 ?auto_4878 ) ( ON ?auto_4865 ?auto_4876 ) ( CLEAR ?auto_4865 ) ( TRUCK-AT ?auto_4871 ?auto_4872 ) ( not ( = ?auto_4864 ?auto_4865 ) ) ( not ( = ?auto_4864 ?auto_4876 ) ) ( not ( = ?auto_4865 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4884 ) ) ( not ( = ?auto_4864 ?auto_4866 ) ) ( not ( = ?auto_4864 ?auto_4885 ) ) ( not ( = ?auto_4866 ?auto_4876 ) ) ( not ( = ?auto_4874 ?auto_4878 ) ) ( not ( = ?auto_4870 ?auto_4884 ) ) ( not ( = ?auto_4885 ?auto_4876 ) ) ( not ( = ?auto_4864 ?auto_4867 ) ) ( not ( = ?auto_4864 ?auto_4883 ) ) ( not ( = ?auto_4865 ?auto_4867 ) ) ( not ( = ?auto_4865 ?auto_4883 ) ) ( not ( = ?auto_4867 ?auto_4885 ) ) ( not ( = ?auto_4867 ?auto_4876 ) ) ( not ( = ?auto_4877 ?auto_4874 ) ) ( not ( = ?auto_4877 ?auto_4878 ) ) ( not ( = ?auto_4882 ?auto_4870 ) ) ( not ( = ?auto_4882 ?auto_4884 ) ) ( not ( = ?auto_4883 ?auto_4885 ) ) ( not ( = ?auto_4883 ?auto_4876 ) ) ( not ( = ?auto_4864 ?auto_4868 ) ) ( not ( = ?auto_4864 ?auto_4880 ) ) ( not ( = ?auto_4865 ?auto_4868 ) ) ( not ( = ?auto_4865 ?auto_4880 ) ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4866 ?auto_4880 ) ) ( not ( = ?auto_4868 ?auto_4883 ) ) ( not ( = ?auto_4868 ?auto_4885 ) ) ( not ( = ?auto_4868 ?auto_4876 ) ) ( not ( = ?auto_4881 ?auto_4877 ) ) ( not ( = ?auto_4881 ?auto_4874 ) ) ( not ( = ?auto_4881 ?auto_4878 ) ) ( not ( = ?auto_4879 ?auto_4882 ) ) ( not ( = ?auto_4879 ?auto_4870 ) ) ( not ( = ?auto_4879 ?auto_4884 ) ) ( not ( = ?auto_4880 ?auto_4883 ) ) ( not ( = ?auto_4880 ?auto_4885 ) ) ( not ( = ?auto_4880 ?auto_4876 ) ) ( not ( = ?auto_4864 ?auto_4869 ) ) ( not ( = ?auto_4864 ?auto_4873 ) ) ( not ( = ?auto_4865 ?auto_4869 ) ) ( not ( = ?auto_4865 ?auto_4873 ) ) ( not ( = ?auto_4866 ?auto_4869 ) ) ( not ( = ?auto_4866 ?auto_4873 ) ) ( not ( = ?auto_4867 ?auto_4869 ) ) ( not ( = ?auto_4867 ?auto_4873 ) ) ( not ( = ?auto_4869 ?auto_4880 ) ) ( not ( = ?auto_4869 ?auto_4883 ) ) ( not ( = ?auto_4869 ?auto_4885 ) ) ( not ( = ?auto_4869 ?auto_4876 ) ) ( not ( = ?auto_4873 ?auto_4880 ) ) ( not ( = ?auto_4873 ?auto_4883 ) ) ( not ( = ?auto_4873 ?auto_4885 ) ) ( not ( = ?auto_4873 ?auto_4876 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4864 ?auto_4865 ?auto_4866 ?auto_4867 ?auto_4868 )
      ( MAKE-1CRATE ?auto_4868 ?auto_4869 )
      ( MAKE-5CRATE-VERIFY ?auto_4864 ?auto_4865 ?auto_4866 ?auto_4867 ?auto_4868 ?auto_4869 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4903 - SURFACE
      ?auto_4904 - SURFACE
      ?auto_4905 - SURFACE
      ?auto_4906 - SURFACE
      ?auto_4907 - SURFACE
      ?auto_4908 - SURFACE
      ?auto_4909 - SURFACE
    )
    :vars
    (
      ?auto_4912 - HOIST
      ?auto_4915 - PLACE
      ?auto_4910 - PLACE
      ?auto_4911 - HOIST
      ?auto_4914 - SURFACE
      ?auto_4921 - PLACE
      ?auto_4920 - HOIST
      ?auto_4919 - SURFACE
      ?auto_4924 - PLACE
      ?auto_4918 - HOIST
      ?auto_4922 - SURFACE
      ?auto_4928 - PLACE
      ?auto_4923 - HOIST
      ?auto_4925 - SURFACE
      ?auto_4926 - SURFACE
      ?auto_4917 - PLACE
      ?auto_4927 - HOIST
      ?auto_4916 - SURFACE
      ?auto_4913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4912 ?auto_4915 ) ( IS-CRATE ?auto_4909 ) ( not ( = ?auto_4910 ?auto_4915 ) ) ( HOIST-AT ?auto_4911 ?auto_4910 ) ( AVAILABLE ?auto_4911 ) ( SURFACE-AT ?auto_4909 ?auto_4910 ) ( ON ?auto_4909 ?auto_4914 ) ( CLEAR ?auto_4909 ) ( not ( = ?auto_4908 ?auto_4909 ) ) ( not ( = ?auto_4908 ?auto_4914 ) ) ( not ( = ?auto_4909 ?auto_4914 ) ) ( not ( = ?auto_4912 ?auto_4911 ) ) ( IS-CRATE ?auto_4908 ) ( not ( = ?auto_4921 ?auto_4915 ) ) ( HOIST-AT ?auto_4920 ?auto_4921 ) ( SURFACE-AT ?auto_4908 ?auto_4921 ) ( ON ?auto_4908 ?auto_4919 ) ( CLEAR ?auto_4908 ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( not ( = ?auto_4907 ?auto_4919 ) ) ( not ( = ?auto_4908 ?auto_4919 ) ) ( not ( = ?auto_4912 ?auto_4920 ) ) ( IS-CRATE ?auto_4907 ) ( not ( = ?auto_4924 ?auto_4915 ) ) ( HOIST-AT ?auto_4918 ?auto_4924 ) ( AVAILABLE ?auto_4918 ) ( SURFACE-AT ?auto_4907 ?auto_4924 ) ( ON ?auto_4907 ?auto_4922 ) ( CLEAR ?auto_4907 ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( not ( = ?auto_4906 ?auto_4922 ) ) ( not ( = ?auto_4907 ?auto_4922 ) ) ( not ( = ?auto_4912 ?auto_4918 ) ) ( IS-CRATE ?auto_4906 ) ( not ( = ?auto_4928 ?auto_4915 ) ) ( HOIST-AT ?auto_4923 ?auto_4928 ) ( AVAILABLE ?auto_4923 ) ( SURFACE-AT ?auto_4906 ?auto_4928 ) ( ON ?auto_4906 ?auto_4925 ) ( CLEAR ?auto_4906 ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( not ( = ?auto_4905 ?auto_4925 ) ) ( not ( = ?auto_4906 ?auto_4925 ) ) ( not ( = ?auto_4912 ?auto_4923 ) ) ( IS-CRATE ?auto_4905 ) ( AVAILABLE ?auto_4920 ) ( SURFACE-AT ?auto_4905 ?auto_4921 ) ( ON ?auto_4905 ?auto_4926 ) ( CLEAR ?auto_4905 ) ( not ( = ?auto_4904 ?auto_4905 ) ) ( not ( = ?auto_4904 ?auto_4926 ) ) ( not ( = ?auto_4905 ?auto_4926 ) ) ( SURFACE-AT ?auto_4903 ?auto_4915 ) ( CLEAR ?auto_4903 ) ( IS-CRATE ?auto_4904 ) ( AVAILABLE ?auto_4912 ) ( not ( = ?auto_4917 ?auto_4915 ) ) ( HOIST-AT ?auto_4927 ?auto_4917 ) ( AVAILABLE ?auto_4927 ) ( SURFACE-AT ?auto_4904 ?auto_4917 ) ( ON ?auto_4904 ?auto_4916 ) ( CLEAR ?auto_4904 ) ( TRUCK-AT ?auto_4913 ?auto_4915 ) ( not ( = ?auto_4903 ?auto_4904 ) ) ( not ( = ?auto_4903 ?auto_4916 ) ) ( not ( = ?auto_4904 ?auto_4916 ) ) ( not ( = ?auto_4912 ?auto_4927 ) ) ( not ( = ?auto_4903 ?auto_4905 ) ) ( not ( = ?auto_4903 ?auto_4926 ) ) ( not ( = ?auto_4905 ?auto_4916 ) ) ( not ( = ?auto_4921 ?auto_4917 ) ) ( not ( = ?auto_4920 ?auto_4927 ) ) ( not ( = ?auto_4926 ?auto_4916 ) ) ( not ( = ?auto_4903 ?auto_4906 ) ) ( not ( = ?auto_4903 ?auto_4925 ) ) ( not ( = ?auto_4904 ?auto_4906 ) ) ( not ( = ?auto_4904 ?auto_4925 ) ) ( not ( = ?auto_4906 ?auto_4926 ) ) ( not ( = ?auto_4906 ?auto_4916 ) ) ( not ( = ?auto_4928 ?auto_4921 ) ) ( not ( = ?auto_4928 ?auto_4917 ) ) ( not ( = ?auto_4923 ?auto_4920 ) ) ( not ( = ?auto_4923 ?auto_4927 ) ) ( not ( = ?auto_4925 ?auto_4926 ) ) ( not ( = ?auto_4925 ?auto_4916 ) ) ( not ( = ?auto_4903 ?auto_4907 ) ) ( not ( = ?auto_4903 ?auto_4922 ) ) ( not ( = ?auto_4904 ?auto_4907 ) ) ( not ( = ?auto_4904 ?auto_4922 ) ) ( not ( = ?auto_4905 ?auto_4907 ) ) ( not ( = ?auto_4905 ?auto_4922 ) ) ( not ( = ?auto_4907 ?auto_4925 ) ) ( not ( = ?auto_4907 ?auto_4926 ) ) ( not ( = ?auto_4907 ?auto_4916 ) ) ( not ( = ?auto_4924 ?auto_4928 ) ) ( not ( = ?auto_4924 ?auto_4921 ) ) ( not ( = ?auto_4924 ?auto_4917 ) ) ( not ( = ?auto_4918 ?auto_4923 ) ) ( not ( = ?auto_4918 ?auto_4920 ) ) ( not ( = ?auto_4918 ?auto_4927 ) ) ( not ( = ?auto_4922 ?auto_4925 ) ) ( not ( = ?auto_4922 ?auto_4926 ) ) ( not ( = ?auto_4922 ?auto_4916 ) ) ( not ( = ?auto_4903 ?auto_4908 ) ) ( not ( = ?auto_4903 ?auto_4919 ) ) ( not ( = ?auto_4904 ?auto_4908 ) ) ( not ( = ?auto_4904 ?auto_4919 ) ) ( not ( = ?auto_4905 ?auto_4908 ) ) ( not ( = ?auto_4905 ?auto_4919 ) ) ( not ( = ?auto_4906 ?auto_4908 ) ) ( not ( = ?auto_4906 ?auto_4919 ) ) ( not ( = ?auto_4908 ?auto_4922 ) ) ( not ( = ?auto_4908 ?auto_4925 ) ) ( not ( = ?auto_4908 ?auto_4926 ) ) ( not ( = ?auto_4908 ?auto_4916 ) ) ( not ( = ?auto_4919 ?auto_4922 ) ) ( not ( = ?auto_4919 ?auto_4925 ) ) ( not ( = ?auto_4919 ?auto_4926 ) ) ( not ( = ?auto_4919 ?auto_4916 ) ) ( not ( = ?auto_4903 ?auto_4909 ) ) ( not ( = ?auto_4903 ?auto_4914 ) ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( not ( = ?auto_4904 ?auto_4914 ) ) ( not ( = ?auto_4905 ?auto_4909 ) ) ( not ( = ?auto_4905 ?auto_4914 ) ) ( not ( = ?auto_4906 ?auto_4909 ) ) ( not ( = ?auto_4906 ?auto_4914 ) ) ( not ( = ?auto_4907 ?auto_4909 ) ) ( not ( = ?auto_4907 ?auto_4914 ) ) ( not ( = ?auto_4909 ?auto_4919 ) ) ( not ( = ?auto_4909 ?auto_4922 ) ) ( not ( = ?auto_4909 ?auto_4925 ) ) ( not ( = ?auto_4909 ?auto_4926 ) ) ( not ( = ?auto_4909 ?auto_4916 ) ) ( not ( = ?auto_4910 ?auto_4921 ) ) ( not ( = ?auto_4910 ?auto_4924 ) ) ( not ( = ?auto_4910 ?auto_4928 ) ) ( not ( = ?auto_4910 ?auto_4917 ) ) ( not ( = ?auto_4911 ?auto_4920 ) ) ( not ( = ?auto_4911 ?auto_4918 ) ) ( not ( = ?auto_4911 ?auto_4923 ) ) ( not ( = ?auto_4911 ?auto_4927 ) ) ( not ( = ?auto_4914 ?auto_4919 ) ) ( not ( = ?auto_4914 ?auto_4922 ) ) ( not ( = ?auto_4914 ?auto_4925 ) ) ( not ( = ?auto_4914 ?auto_4926 ) ) ( not ( = ?auto_4914 ?auto_4916 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4903 ?auto_4904 ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4908 )
      ( MAKE-1CRATE ?auto_4908 ?auto_4909 )
      ( MAKE-6CRATE-VERIFY ?auto_4903 ?auto_4904 ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4908 ?auto_4909 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4947 - SURFACE
      ?auto_4948 - SURFACE
      ?auto_4949 - SURFACE
      ?auto_4950 - SURFACE
      ?auto_4951 - SURFACE
      ?auto_4952 - SURFACE
      ?auto_4953 - SURFACE
      ?auto_4954 - SURFACE
    )
    :vars
    (
      ?auto_4960 - HOIST
      ?auto_4959 - PLACE
      ?auto_4955 - PLACE
      ?auto_4956 - HOIST
      ?auto_4957 - SURFACE
      ?auto_4967 - PLACE
      ?auto_4974 - HOIST
      ?auto_4968 - SURFACE
      ?auto_4962 - PLACE
      ?auto_4969 - HOIST
      ?auto_4966 - SURFACE
      ?auto_4973 - PLACE
      ?auto_4972 - HOIST
      ?auto_4965 - SURFACE
      ?auto_4971 - SURFACE
      ?auto_4964 - SURFACE
      ?auto_4970 - PLACE
      ?auto_4961 - HOIST
      ?auto_4963 - SURFACE
      ?auto_4958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4960 ?auto_4959 ) ( IS-CRATE ?auto_4954 ) ( not ( = ?auto_4955 ?auto_4959 ) ) ( HOIST-AT ?auto_4956 ?auto_4955 ) ( SURFACE-AT ?auto_4954 ?auto_4955 ) ( ON ?auto_4954 ?auto_4957 ) ( CLEAR ?auto_4954 ) ( not ( = ?auto_4953 ?auto_4954 ) ) ( not ( = ?auto_4953 ?auto_4957 ) ) ( not ( = ?auto_4954 ?auto_4957 ) ) ( not ( = ?auto_4960 ?auto_4956 ) ) ( IS-CRATE ?auto_4953 ) ( not ( = ?auto_4967 ?auto_4959 ) ) ( HOIST-AT ?auto_4974 ?auto_4967 ) ( AVAILABLE ?auto_4974 ) ( SURFACE-AT ?auto_4953 ?auto_4967 ) ( ON ?auto_4953 ?auto_4968 ) ( CLEAR ?auto_4953 ) ( not ( = ?auto_4952 ?auto_4953 ) ) ( not ( = ?auto_4952 ?auto_4968 ) ) ( not ( = ?auto_4953 ?auto_4968 ) ) ( not ( = ?auto_4960 ?auto_4974 ) ) ( IS-CRATE ?auto_4952 ) ( not ( = ?auto_4962 ?auto_4959 ) ) ( HOIST-AT ?auto_4969 ?auto_4962 ) ( SURFACE-AT ?auto_4952 ?auto_4962 ) ( ON ?auto_4952 ?auto_4966 ) ( CLEAR ?auto_4952 ) ( not ( = ?auto_4951 ?auto_4952 ) ) ( not ( = ?auto_4951 ?auto_4966 ) ) ( not ( = ?auto_4952 ?auto_4966 ) ) ( not ( = ?auto_4960 ?auto_4969 ) ) ( IS-CRATE ?auto_4951 ) ( not ( = ?auto_4973 ?auto_4959 ) ) ( HOIST-AT ?auto_4972 ?auto_4973 ) ( AVAILABLE ?auto_4972 ) ( SURFACE-AT ?auto_4951 ?auto_4973 ) ( ON ?auto_4951 ?auto_4965 ) ( CLEAR ?auto_4951 ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4965 ) ) ( not ( = ?auto_4951 ?auto_4965 ) ) ( not ( = ?auto_4960 ?auto_4972 ) ) ( IS-CRATE ?auto_4950 ) ( AVAILABLE ?auto_4956 ) ( SURFACE-AT ?auto_4950 ?auto_4955 ) ( ON ?auto_4950 ?auto_4971 ) ( CLEAR ?auto_4950 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4949 ?auto_4971 ) ) ( not ( = ?auto_4950 ?auto_4971 ) ) ( IS-CRATE ?auto_4949 ) ( AVAILABLE ?auto_4969 ) ( SURFACE-AT ?auto_4949 ?auto_4962 ) ( ON ?auto_4949 ?auto_4964 ) ( CLEAR ?auto_4949 ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4964 ) ) ( not ( = ?auto_4949 ?auto_4964 ) ) ( SURFACE-AT ?auto_4947 ?auto_4959 ) ( CLEAR ?auto_4947 ) ( IS-CRATE ?auto_4948 ) ( AVAILABLE ?auto_4960 ) ( not ( = ?auto_4970 ?auto_4959 ) ) ( HOIST-AT ?auto_4961 ?auto_4970 ) ( AVAILABLE ?auto_4961 ) ( SURFACE-AT ?auto_4948 ?auto_4970 ) ( ON ?auto_4948 ?auto_4963 ) ( CLEAR ?auto_4948 ) ( TRUCK-AT ?auto_4958 ?auto_4959 ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( not ( = ?auto_4947 ?auto_4963 ) ) ( not ( = ?auto_4948 ?auto_4963 ) ) ( not ( = ?auto_4960 ?auto_4961 ) ) ( not ( = ?auto_4947 ?auto_4949 ) ) ( not ( = ?auto_4947 ?auto_4964 ) ) ( not ( = ?auto_4949 ?auto_4963 ) ) ( not ( = ?auto_4962 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4961 ) ) ( not ( = ?auto_4964 ?auto_4963 ) ) ( not ( = ?auto_4947 ?auto_4950 ) ) ( not ( = ?auto_4947 ?auto_4971 ) ) ( not ( = ?auto_4948 ?auto_4950 ) ) ( not ( = ?auto_4948 ?auto_4971 ) ) ( not ( = ?auto_4950 ?auto_4964 ) ) ( not ( = ?auto_4950 ?auto_4963 ) ) ( not ( = ?auto_4955 ?auto_4962 ) ) ( not ( = ?auto_4955 ?auto_4970 ) ) ( not ( = ?auto_4956 ?auto_4969 ) ) ( not ( = ?auto_4956 ?auto_4961 ) ) ( not ( = ?auto_4971 ?auto_4964 ) ) ( not ( = ?auto_4971 ?auto_4963 ) ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( not ( = ?auto_4947 ?auto_4965 ) ) ( not ( = ?auto_4948 ?auto_4951 ) ) ( not ( = ?auto_4948 ?auto_4965 ) ) ( not ( = ?auto_4949 ?auto_4951 ) ) ( not ( = ?auto_4949 ?auto_4965 ) ) ( not ( = ?auto_4951 ?auto_4971 ) ) ( not ( = ?auto_4951 ?auto_4964 ) ) ( not ( = ?auto_4951 ?auto_4963 ) ) ( not ( = ?auto_4973 ?auto_4955 ) ) ( not ( = ?auto_4973 ?auto_4962 ) ) ( not ( = ?auto_4973 ?auto_4970 ) ) ( not ( = ?auto_4972 ?auto_4956 ) ) ( not ( = ?auto_4972 ?auto_4969 ) ) ( not ( = ?auto_4972 ?auto_4961 ) ) ( not ( = ?auto_4965 ?auto_4971 ) ) ( not ( = ?auto_4965 ?auto_4964 ) ) ( not ( = ?auto_4965 ?auto_4963 ) ) ( not ( = ?auto_4947 ?auto_4952 ) ) ( not ( = ?auto_4947 ?auto_4966 ) ) ( not ( = ?auto_4948 ?auto_4952 ) ) ( not ( = ?auto_4948 ?auto_4966 ) ) ( not ( = ?auto_4949 ?auto_4952 ) ) ( not ( = ?auto_4949 ?auto_4966 ) ) ( not ( = ?auto_4950 ?auto_4952 ) ) ( not ( = ?auto_4950 ?auto_4966 ) ) ( not ( = ?auto_4952 ?auto_4965 ) ) ( not ( = ?auto_4952 ?auto_4971 ) ) ( not ( = ?auto_4952 ?auto_4964 ) ) ( not ( = ?auto_4952 ?auto_4963 ) ) ( not ( = ?auto_4966 ?auto_4965 ) ) ( not ( = ?auto_4966 ?auto_4971 ) ) ( not ( = ?auto_4966 ?auto_4964 ) ) ( not ( = ?auto_4966 ?auto_4963 ) ) ( not ( = ?auto_4947 ?auto_4953 ) ) ( not ( = ?auto_4947 ?auto_4968 ) ) ( not ( = ?auto_4948 ?auto_4953 ) ) ( not ( = ?auto_4948 ?auto_4968 ) ) ( not ( = ?auto_4949 ?auto_4953 ) ) ( not ( = ?auto_4949 ?auto_4968 ) ) ( not ( = ?auto_4950 ?auto_4953 ) ) ( not ( = ?auto_4950 ?auto_4968 ) ) ( not ( = ?auto_4951 ?auto_4953 ) ) ( not ( = ?auto_4951 ?auto_4968 ) ) ( not ( = ?auto_4953 ?auto_4966 ) ) ( not ( = ?auto_4953 ?auto_4965 ) ) ( not ( = ?auto_4953 ?auto_4971 ) ) ( not ( = ?auto_4953 ?auto_4964 ) ) ( not ( = ?auto_4953 ?auto_4963 ) ) ( not ( = ?auto_4967 ?auto_4962 ) ) ( not ( = ?auto_4967 ?auto_4973 ) ) ( not ( = ?auto_4967 ?auto_4955 ) ) ( not ( = ?auto_4967 ?auto_4970 ) ) ( not ( = ?auto_4974 ?auto_4969 ) ) ( not ( = ?auto_4974 ?auto_4972 ) ) ( not ( = ?auto_4974 ?auto_4956 ) ) ( not ( = ?auto_4974 ?auto_4961 ) ) ( not ( = ?auto_4968 ?auto_4966 ) ) ( not ( = ?auto_4968 ?auto_4965 ) ) ( not ( = ?auto_4968 ?auto_4971 ) ) ( not ( = ?auto_4968 ?auto_4964 ) ) ( not ( = ?auto_4968 ?auto_4963 ) ) ( not ( = ?auto_4947 ?auto_4954 ) ) ( not ( = ?auto_4947 ?auto_4957 ) ) ( not ( = ?auto_4948 ?auto_4954 ) ) ( not ( = ?auto_4948 ?auto_4957 ) ) ( not ( = ?auto_4949 ?auto_4954 ) ) ( not ( = ?auto_4949 ?auto_4957 ) ) ( not ( = ?auto_4950 ?auto_4954 ) ) ( not ( = ?auto_4950 ?auto_4957 ) ) ( not ( = ?auto_4951 ?auto_4954 ) ) ( not ( = ?auto_4951 ?auto_4957 ) ) ( not ( = ?auto_4952 ?auto_4954 ) ) ( not ( = ?auto_4952 ?auto_4957 ) ) ( not ( = ?auto_4954 ?auto_4968 ) ) ( not ( = ?auto_4954 ?auto_4966 ) ) ( not ( = ?auto_4954 ?auto_4965 ) ) ( not ( = ?auto_4954 ?auto_4971 ) ) ( not ( = ?auto_4954 ?auto_4964 ) ) ( not ( = ?auto_4954 ?auto_4963 ) ) ( not ( = ?auto_4957 ?auto_4968 ) ) ( not ( = ?auto_4957 ?auto_4966 ) ) ( not ( = ?auto_4957 ?auto_4965 ) ) ( not ( = ?auto_4957 ?auto_4971 ) ) ( not ( = ?auto_4957 ?auto_4964 ) ) ( not ( = ?auto_4957 ?auto_4963 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4947 ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4951 ?auto_4952 ?auto_4953 )
      ( MAKE-1CRATE ?auto_4953 ?auto_4954 )
      ( MAKE-7CRATE-VERIFY ?auto_4947 ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4951 ?auto_4952 ?auto_4953 ?auto_4954 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4994 - SURFACE
      ?auto_4995 - SURFACE
      ?auto_4996 - SURFACE
      ?auto_4997 - SURFACE
      ?auto_4998 - SURFACE
      ?auto_4999 - SURFACE
      ?auto_5000 - SURFACE
      ?auto_5001 - SURFACE
      ?auto_5002 - SURFACE
    )
    :vars
    (
      ?auto_5008 - HOIST
      ?auto_5007 - PLACE
      ?auto_5003 - PLACE
      ?auto_5004 - HOIST
      ?auto_5005 - SURFACE
      ?auto_5016 - PLACE
      ?auto_5022 - HOIST
      ?auto_5023 - SURFACE
      ?auto_5009 - PLACE
      ?auto_5024 - HOIST
      ?auto_5021 - SURFACE
      ?auto_5019 - PLACE
      ?auto_5015 - HOIST
      ?auto_5017 - SURFACE
      ?auto_5018 - PLACE
      ?auto_5012 - HOIST
      ?auto_5020 - SURFACE
      ?auto_5014 - SURFACE
      ?auto_5025 - SURFACE
      ?auto_5011 - PLACE
      ?auto_5010 - HOIST
      ?auto_5013 - SURFACE
      ?auto_5006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5008 ?auto_5007 ) ( IS-CRATE ?auto_5002 ) ( not ( = ?auto_5003 ?auto_5007 ) ) ( HOIST-AT ?auto_5004 ?auto_5003 ) ( AVAILABLE ?auto_5004 ) ( SURFACE-AT ?auto_5002 ?auto_5003 ) ( ON ?auto_5002 ?auto_5005 ) ( CLEAR ?auto_5002 ) ( not ( = ?auto_5001 ?auto_5002 ) ) ( not ( = ?auto_5001 ?auto_5005 ) ) ( not ( = ?auto_5002 ?auto_5005 ) ) ( not ( = ?auto_5008 ?auto_5004 ) ) ( IS-CRATE ?auto_5001 ) ( not ( = ?auto_5016 ?auto_5007 ) ) ( HOIST-AT ?auto_5022 ?auto_5016 ) ( SURFACE-AT ?auto_5001 ?auto_5016 ) ( ON ?auto_5001 ?auto_5023 ) ( CLEAR ?auto_5001 ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5000 ?auto_5023 ) ) ( not ( = ?auto_5001 ?auto_5023 ) ) ( not ( = ?auto_5008 ?auto_5022 ) ) ( IS-CRATE ?auto_5000 ) ( not ( = ?auto_5009 ?auto_5007 ) ) ( HOIST-AT ?auto_5024 ?auto_5009 ) ( AVAILABLE ?auto_5024 ) ( SURFACE-AT ?auto_5000 ?auto_5009 ) ( ON ?auto_5000 ?auto_5021 ) ( CLEAR ?auto_5000 ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_4999 ?auto_5021 ) ) ( not ( = ?auto_5000 ?auto_5021 ) ) ( not ( = ?auto_5008 ?auto_5024 ) ) ( IS-CRATE ?auto_4999 ) ( not ( = ?auto_5019 ?auto_5007 ) ) ( HOIST-AT ?auto_5015 ?auto_5019 ) ( SURFACE-AT ?auto_4999 ?auto_5019 ) ( ON ?auto_4999 ?auto_5017 ) ( CLEAR ?auto_4999 ) ( not ( = ?auto_4998 ?auto_4999 ) ) ( not ( = ?auto_4998 ?auto_5017 ) ) ( not ( = ?auto_4999 ?auto_5017 ) ) ( not ( = ?auto_5008 ?auto_5015 ) ) ( IS-CRATE ?auto_4998 ) ( not ( = ?auto_5018 ?auto_5007 ) ) ( HOIST-AT ?auto_5012 ?auto_5018 ) ( AVAILABLE ?auto_5012 ) ( SURFACE-AT ?auto_4998 ?auto_5018 ) ( ON ?auto_4998 ?auto_5020 ) ( CLEAR ?auto_4998 ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( not ( = ?auto_4997 ?auto_5020 ) ) ( not ( = ?auto_4998 ?auto_5020 ) ) ( not ( = ?auto_5008 ?auto_5012 ) ) ( IS-CRATE ?auto_4997 ) ( AVAILABLE ?auto_5022 ) ( SURFACE-AT ?auto_4997 ?auto_5016 ) ( ON ?auto_4997 ?auto_5014 ) ( CLEAR ?auto_4997 ) ( not ( = ?auto_4996 ?auto_4997 ) ) ( not ( = ?auto_4996 ?auto_5014 ) ) ( not ( = ?auto_4997 ?auto_5014 ) ) ( IS-CRATE ?auto_4996 ) ( AVAILABLE ?auto_5015 ) ( SURFACE-AT ?auto_4996 ?auto_5019 ) ( ON ?auto_4996 ?auto_5025 ) ( CLEAR ?auto_4996 ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( not ( = ?auto_4995 ?auto_5025 ) ) ( not ( = ?auto_4996 ?auto_5025 ) ) ( SURFACE-AT ?auto_4994 ?auto_5007 ) ( CLEAR ?auto_4994 ) ( IS-CRATE ?auto_4995 ) ( AVAILABLE ?auto_5008 ) ( not ( = ?auto_5011 ?auto_5007 ) ) ( HOIST-AT ?auto_5010 ?auto_5011 ) ( AVAILABLE ?auto_5010 ) ( SURFACE-AT ?auto_4995 ?auto_5011 ) ( ON ?auto_4995 ?auto_5013 ) ( CLEAR ?auto_4995 ) ( TRUCK-AT ?auto_5006 ?auto_5007 ) ( not ( = ?auto_4994 ?auto_4995 ) ) ( not ( = ?auto_4994 ?auto_5013 ) ) ( not ( = ?auto_4995 ?auto_5013 ) ) ( not ( = ?auto_5008 ?auto_5010 ) ) ( not ( = ?auto_4994 ?auto_4996 ) ) ( not ( = ?auto_4994 ?auto_5025 ) ) ( not ( = ?auto_4996 ?auto_5013 ) ) ( not ( = ?auto_5019 ?auto_5011 ) ) ( not ( = ?auto_5015 ?auto_5010 ) ) ( not ( = ?auto_5025 ?auto_5013 ) ) ( not ( = ?auto_4994 ?auto_4997 ) ) ( not ( = ?auto_4994 ?auto_5014 ) ) ( not ( = ?auto_4995 ?auto_4997 ) ) ( not ( = ?auto_4995 ?auto_5014 ) ) ( not ( = ?auto_4997 ?auto_5025 ) ) ( not ( = ?auto_4997 ?auto_5013 ) ) ( not ( = ?auto_5016 ?auto_5019 ) ) ( not ( = ?auto_5016 ?auto_5011 ) ) ( not ( = ?auto_5022 ?auto_5015 ) ) ( not ( = ?auto_5022 ?auto_5010 ) ) ( not ( = ?auto_5014 ?auto_5025 ) ) ( not ( = ?auto_5014 ?auto_5013 ) ) ( not ( = ?auto_4994 ?auto_4998 ) ) ( not ( = ?auto_4994 ?auto_5020 ) ) ( not ( = ?auto_4995 ?auto_4998 ) ) ( not ( = ?auto_4995 ?auto_5020 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_5020 ) ) ( not ( = ?auto_4998 ?auto_5014 ) ) ( not ( = ?auto_4998 ?auto_5025 ) ) ( not ( = ?auto_4998 ?auto_5013 ) ) ( not ( = ?auto_5018 ?auto_5016 ) ) ( not ( = ?auto_5018 ?auto_5019 ) ) ( not ( = ?auto_5018 ?auto_5011 ) ) ( not ( = ?auto_5012 ?auto_5022 ) ) ( not ( = ?auto_5012 ?auto_5015 ) ) ( not ( = ?auto_5012 ?auto_5010 ) ) ( not ( = ?auto_5020 ?auto_5014 ) ) ( not ( = ?auto_5020 ?auto_5025 ) ) ( not ( = ?auto_5020 ?auto_5013 ) ) ( not ( = ?auto_4994 ?auto_4999 ) ) ( not ( = ?auto_4994 ?auto_5017 ) ) ( not ( = ?auto_4995 ?auto_4999 ) ) ( not ( = ?auto_4995 ?auto_5017 ) ) ( not ( = ?auto_4996 ?auto_4999 ) ) ( not ( = ?auto_4996 ?auto_5017 ) ) ( not ( = ?auto_4997 ?auto_4999 ) ) ( not ( = ?auto_4997 ?auto_5017 ) ) ( not ( = ?auto_4999 ?auto_5020 ) ) ( not ( = ?auto_4999 ?auto_5014 ) ) ( not ( = ?auto_4999 ?auto_5025 ) ) ( not ( = ?auto_4999 ?auto_5013 ) ) ( not ( = ?auto_5017 ?auto_5020 ) ) ( not ( = ?auto_5017 ?auto_5014 ) ) ( not ( = ?auto_5017 ?auto_5025 ) ) ( not ( = ?auto_5017 ?auto_5013 ) ) ( not ( = ?auto_4994 ?auto_5000 ) ) ( not ( = ?auto_4994 ?auto_5021 ) ) ( not ( = ?auto_4995 ?auto_5000 ) ) ( not ( = ?auto_4995 ?auto_5021 ) ) ( not ( = ?auto_4996 ?auto_5000 ) ) ( not ( = ?auto_4996 ?auto_5021 ) ) ( not ( = ?auto_4997 ?auto_5000 ) ) ( not ( = ?auto_4997 ?auto_5021 ) ) ( not ( = ?auto_4998 ?auto_5000 ) ) ( not ( = ?auto_4998 ?auto_5021 ) ) ( not ( = ?auto_5000 ?auto_5017 ) ) ( not ( = ?auto_5000 ?auto_5020 ) ) ( not ( = ?auto_5000 ?auto_5014 ) ) ( not ( = ?auto_5000 ?auto_5025 ) ) ( not ( = ?auto_5000 ?auto_5013 ) ) ( not ( = ?auto_5009 ?auto_5019 ) ) ( not ( = ?auto_5009 ?auto_5018 ) ) ( not ( = ?auto_5009 ?auto_5016 ) ) ( not ( = ?auto_5009 ?auto_5011 ) ) ( not ( = ?auto_5024 ?auto_5015 ) ) ( not ( = ?auto_5024 ?auto_5012 ) ) ( not ( = ?auto_5024 ?auto_5022 ) ) ( not ( = ?auto_5024 ?auto_5010 ) ) ( not ( = ?auto_5021 ?auto_5017 ) ) ( not ( = ?auto_5021 ?auto_5020 ) ) ( not ( = ?auto_5021 ?auto_5014 ) ) ( not ( = ?auto_5021 ?auto_5025 ) ) ( not ( = ?auto_5021 ?auto_5013 ) ) ( not ( = ?auto_4994 ?auto_5001 ) ) ( not ( = ?auto_4994 ?auto_5023 ) ) ( not ( = ?auto_4995 ?auto_5001 ) ) ( not ( = ?auto_4995 ?auto_5023 ) ) ( not ( = ?auto_4996 ?auto_5001 ) ) ( not ( = ?auto_4996 ?auto_5023 ) ) ( not ( = ?auto_4997 ?auto_5001 ) ) ( not ( = ?auto_4997 ?auto_5023 ) ) ( not ( = ?auto_4998 ?auto_5001 ) ) ( not ( = ?auto_4998 ?auto_5023 ) ) ( not ( = ?auto_4999 ?auto_5001 ) ) ( not ( = ?auto_4999 ?auto_5023 ) ) ( not ( = ?auto_5001 ?auto_5021 ) ) ( not ( = ?auto_5001 ?auto_5017 ) ) ( not ( = ?auto_5001 ?auto_5020 ) ) ( not ( = ?auto_5001 ?auto_5014 ) ) ( not ( = ?auto_5001 ?auto_5025 ) ) ( not ( = ?auto_5001 ?auto_5013 ) ) ( not ( = ?auto_5023 ?auto_5021 ) ) ( not ( = ?auto_5023 ?auto_5017 ) ) ( not ( = ?auto_5023 ?auto_5020 ) ) ( not ( = ?auto_5023 ?auto_5014 ) ) ( not ( = ?auto_5023 ?auto_5025 ) ) ( not ( = ?auto_5023 ?auto_5013 ) ) ( not ( = ?auto_4994 ?auto_5002 ) ) ( not ( = ?auto_4994 ?auto_5005 ) ) ( not ( = ?auto_4995 ?auto_5002 ) ) ( not ( = ?auto_4995 ?auto_5005 ) ) ( not ( = ?auto_4996 ?auto_5002 ) ) ( not ( = ?auto_4996 ?auto_5005 ) ) ( not ( = ?auto_4997 ?auto_5002 ) ) ( not ( = ?auto_4997 ?auto_5005 ) ) ( not ( = ?auto_4998 ?auto_5002 ) ) ( not ( = ?auto_4998 ?auto_5005 ) ) ( not ( = ?auto_4999 ?auto_5002 ) ) ( not ( = ?auto_4999 ?auto_5005 ) ) ( not ( = ?auto_5000 ?auto_5002 ) ) ( not ( = ?auto_5000 ?auto_5005 ) ) ( not ( = ?auto_5002 ?auto_5023 ) ) ( not ( = ?auto_5002 ?auto_5021 ) ) ( not ( = ?auto_5002 ?auto_5017 ) ) ( not ( = ?auto_5002 ?auto_5020 ) ) ( not ( = ?auto_5002 ?auto_5014 ) ) ( not ( = ?auto_5002 ?auto_5025 ) ) ( not ( = ?auto_5002 ?auto_5013 ) ) ( not ( = ?auto_5003 ?auto_5016 ) ) ( not ( = ?auto_5003 ?auto_5009 ) ) ( not ( = ?auto_5003 ?auto_5019 ) ) ( not ( = ?auto_5003 ?auto_5018 ) ) ( not ( = ?auto_5003 ?auto_5011 ) ) ( not ( = ?auto_5004 ?auto_5022 ) ) ( not ( = ?auto_5004 ?auto_5024 ) ) ( not ( = ?auto_5004 ?auto_5015 ) ) ( not ( = ?auto_5004 ?auto_5012 ) ) ( not ( = ?auto_5004 ?auto_5010 ) ) ( not ( = ?auto_5005 ?auto_5023 ) ) ( not ( = ?auto_5005 ?auto_5021 ) ) ( not ( = ?auto_5005 ?auto_5017 ) ) ( not ( = ?auto_5005 ?auto_5020 ) ) ( not ( = ?auto_5005 ?auto_5014 ) ) ( not ( = ?auto_5005 ?auto_5025 ) ) ( not ( = ?auto_5005 ?auto_5013 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4994 ?auto_4995 ?auto_4996 ?auto_4997 ?auto_4998 ?auto_4999 ?auto_5000 ?auto_5001 )
      ( MAKE-1CRATE ?auto_5001 ?auto_5002 )
      ( MAKE-8CRATE-VERIFY ?auto_4994 ?auto_4995 ?auto_4996 ?auto_4997 ?auto_4998 ?auto_4999 ?auto_5000 ?auto_5001 ?auto_5002 ) )
  )

)

