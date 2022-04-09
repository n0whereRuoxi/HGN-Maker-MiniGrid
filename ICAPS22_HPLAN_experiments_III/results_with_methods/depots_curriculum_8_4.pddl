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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4760 - SURFACE
      ?auto_4761 - SURFACE
    )
    :vars
    (
      ?auto_4762 - HOIST
      ?auto_4763 - PLACE
      ?auto_4765 - PLACE
      ?auto_4766 - HOIST
      ?auto_4767 - SURFACE
      ?auto_4764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4762 ?auto_4763 ) ( SURFACE-AT ?auto_4760 ?auto_4763 ) ( CLEAR ?auto_4760 ) ( IS-CRATE ?auto_4761 ) ( AVAILABLE ?auto_4762 ) ( not ( = ?auto_4765 ?auto_4763 ) ) ( HOIST-AT ?auto_4766 ?auto_4765 ) ( AVAILABLE ?auto_4766 ) ( SURFACE-AT ?auto_4761 ?auto_4765 ) ( ON ?auto_4761 ?auto_4767 ) ( CLEAR ?auto_4761 ) ( TRUCK-AT ?auto_4764 ?auto_4763 ) ( not ( = ?auto_4760 ?auto_4761 ) ) ( not ( = ?auto_4760 ?auto_4767 ) ) ( not ( = ?auto_4761 ?auto_4767 ) ) ( not ( = ?auto_4762 ?auto_4766 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4764 ?auto_4763 ?auto_4765 )
      ( !LIFT ?auto_4766 ?auto_4761 ?auto_4767 ?auto_4765 )
      ( !LOAD ?auto_4766 ?auto_4761 ?auto_4764 ?auto_4765 )
      ( !DRIVE ?auto_4764 ?auto_4765 ?auto_4763 )
      ( !UNLOAD ?auto_4762 ?auto_4761 ?auto_4764 ?auto_4763 )
      ( !DROP ?auto_4762 ?auto_4761 ?auto_4760 ?auto_4763 )
      ( MAKE-1CRATE-VERIFY ?auto_4760 ?auto_4761 ) )
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
      ?auto_4775 - HOIST
      ?auto_4776 - PLACE
      ?auto_4779 - PLACE
      ?auto_4778 - HOIST
      ?auto_4774 - SURFACE
      ?auto_4781 - PLACE
      ?auto_4782 - HOIST
      ?auto_4780 - SURFACE
      ?auto_4777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4775 ?auto_4776 ) ( IS-CRATE ?auto_4773 ) ( not ( = ?auto_4779 ?auto_4776 ) ) ( HOIST-AT ?auto_4778 ?auto_4779 ) ( AVAILABLE ?auto_4778 ) ( SURFACE-AT ?auto_4773 ?auto_4779 ) ( ON ?auto_4773 ?auto_4774 ) ( CLEAR ?auto_4773 ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4774 ) ) ( not ( = ?auto_4773 ?auto_4774 ) ) ( not ( = ?auto_4775 ?auto_4778 ) ) ( SURFACE-AT ?auto_4771 ?auto_4776 ) ( CLEAR ?auto_4771 ) ( IS-CRATE ?auto_4772 ) ( AVAILABLE ?auto_4775 ) ( not ( = ?auto_4781 ?auto_4776 ) ) ( HOIST-AT ?auto_4782 ?auto_4781 ) ( AVAILABLE ?auto_4782 ) ( SURFACE-AT ?auto_4772 ?auto_4781 ) ( ON ?auto_4772 ?auto_4780 ) ( CLEAR ?auto_4772 ) ( TRUCK-AT ?auto_4777 ?auto_4776 ) ( not ( = ?auto_4771 ?auto_4772 ) ) ( not ( = ?auto_4771 ?auto_4780 ) ) ( not ( = ?auto_4772 ?auto_4780 ) ) ( not ( = ?auto_4775 ?auto_4782 ) ) ( not ( = ?auto_4771 ?auto_4773 ) ) ( not ( = ?auto_4771 ?auto_4774 ) ) ( not ( = ?auto_4773 ?auto_4780 ) ) ( not ( = ?auto_4779 ?auto_4781 ) ) ( not ( = ?auto_4778 ?auto_4782 ) ) ( not ( = ?auto_4774 ?auto_4780 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4771 ?auto_4772 )
      ( MAKE-1CRATE ?auto_4772 ?auto_4773 )
      ( MAKE-2CRATE-VERIFY ?auto_4771 ?auto_4772 ?auto_4773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4785 - SURFACE
      ?auto_4786 - SURFACE
    )
    :vars
    (
      ?auto_4787 - HOIST
      ?auto_4788 - PLACE
      ?auto_4790 - PLACE
      ?auto_4791 - HOIST
      ?auto_4792 - SURFACE
      ?auto_4789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4787 ?auto_4788 ) ( SURFACE-AT ?auto_4785 ?auto_4788 ) ( CLEAR ?auto_4785 ) ( IS-CRATE ?auto_4786 ) ( AVAILABLE ?auto_4787 ) ( not ( = ?auto_4790 ?auto_4788 ) ) ( HOIST-AT ?auto_4791 ?auto_4790 ) ( AVAILABLE ?auto_4791 ) ( SURFACE-AT ?auto_4786 ?auto_4790 ) ( ON ?auto_4786 ?auto_4792 ) ( CLEAR ?auto_4786 ) ( TRUCK-AT ?auto_4789 ?auto_4788 ) ( not ( = ?auto_4785 ?auto_4786 ) ) ( not ( = ?auto_4785 ?auto_4792 ) ) ( not ( = ?auto_4786 ?auto_4792 ) ) ( not ( = ?auto_4787 ?auto_4791 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4789 ?auto_4788 ?auto_4790 )
      ( !LIFT ?auto_4791 ?auto_4786 ?auto_4792 ?auto_4790 )
      ( !LOAD ?auto_4791 ?auto_4786 ?auto_4789 ?auto_4790 )
      ( !DRIVE ?auto_4789 ?auto_4790 ?auto_4788 )
      ( !UNLOAD ?auto_4787 ?auto_4786 ?auto_4789 ?auto_4788 )
      ( !DROP ?auto_4787 ?auto_4786 ?auto_4785 ?auto_4788 )
      ( MAKE-1CRATE-VERIFY ?auto_4785 ?auto_4786 ) )
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
      ?auto_4802 - PLACE
      ?auto_4801 - PLACE
      ?auto_4806 - HOIST
      ?auto_4805 - SURFACE
      ?auto_4807 - PLACE
      ?auto_4809 - HOIST
      ?auto_4808 - SURFACE
      ?auto_4812 - PLACE
      ?auto_4811 - HOIST
      ?auto_4810 - SURFACE
      ?auto_4804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4803 ?auto_4802 ) ( IS-CRATE ?auto_4800 ) ( not ( = ?auto_4801 ?auto_4802 ) ) ( HOIST-AT ?auto_4806 ?auto_4801 ) ( AVAILABLE ?auto_4806 ) ( SURFACE-AT ?auto_4800 ?auto_4801 ) ( ON ?auto_4800 ?auto_4805 ) ( CLEAR ?auto_4800 ) ( not ( = ?auto_4799 ?auto_4800 ) ) ( not ( = ?auto_4799 ?auto_4805 ) ) ( not ( = ?auto_4800 ?auto_4805 ) ) ( not ( = ?auto_4803 ?auto_4806 ) ) ( IS-CRATE ?auto_4799 ) ( not ( = ?auto_4807 ?auto_4802 ) ) ( HOIST-AT ?auto_4809 ?auto_4807 ) ( AVAILABLE ?auto_4809 ) ( SURFACE-AT ?auto_4799 ?auto_4807 ) ( ON ?auto_4799 ?auto_4808 ) ( CLEAR ?auto_4799 ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4808 ) ) ( not ( = ?auto_4799 ?auto_4808 ) ) ( not ( = ?auto_4803 ?auto_4809 ) ) ( SURFACE-AT ?auto_4797 ?auto_4802 ) ( CLEAR ?auto_4797 ) ( IS-CRATE ?auto_4798 ) ( AVAILABLE ?auto_4803 ) ( not ( = ?auto_4812 ?auto_4802 ) ) ( HOIST-AT ?auto_4811 ?auto_4812 ) ( AVAILABLE ?auto_4811 ) ( SURFACE-AT ?auto_4798 ?auto_4812 ) ( ON ?auto_4798 ?auto_4810 ) ( CLEAR ?auto_4798 ) ( TRUCK-AT ?auto_4804 ?auto_4802 ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( not ( = ?auto_4797 ?auto_4810 ) ) ( not ( = ?auto_4798 ?auto_4810 ) ) ( not ( = ?auto_4803 ?auto_4811 ) ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( not ( = ?auto_4797 ?auto_4808 ) ) ( not ( = ?auto_4799 ?auto_4810 ) ) ( not ( = ?auto_4807 ?auto_4812 ) ) ( not ( = ?auto_4809 ?auto_4811 ) ) ( not ( = ?auto_4808 ?auto_4810 ) ) ( not ( = ?auto_4797 ?auto_4800 ) ) ( not ( = ?auto_4797 ?auto_4805 ) ) ( not ( = ?auto_4798 ?auto_4800 ) ) ( not ( = ?auto_4798 ?auto_4805 ) ) ( not ( = ?auto_4800 ?auto_4808 ) ) ( not ( = ?auto_4800 ?auto_4810 ) ) ( not ( = ?auto_4801 ?auto_4807 ) ) ( not ( = ?auto_4801 ?auto_4812 ) ) ( not ( = ?auto_4806 ?auto_4809 ) ) ( not ( = ?auto_4806 ?auto_4811 ) ) ( not ( = ?auto_4805 ?auto_4808 ) ) ( not ( = ?auto_4805 ?auto_4810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4797 ?auto_4798 ?auto_4799 )
      ( MAKE-1CRATE ?auto_4799 ?auto_4800 )
      ( MAKE-3CRATE-VERIFY ?auto_4797 ?auto_4798 ?auto_4799 ?auto_4800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4815 - SURFACE
      ?auto_4816 - SURFACE
    )
    :vars
    (
      ?auto_4817 - HOIST
      ?auto_4818 - PLACE
      ?auto_4820 - PLACE
      ?auto_4821 - HOIST
      ?auto_4822 - SURFACE
      ?auto_4819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4817 ?auto_4818 ) ( SURFACE-AT ?auto_4815 ?auto_4818 ) ( CLEAR ?auto_4815 ) ( IS-CRATE ?auto_4816 ) ( AVAILABLE ?auto_4817 ) ( not ( = ?auto_4820 ?auto_4818 ) ) ( HOIST-AT ?auto_4821 ?auto_4820 ) ( AVAILABLE ?auto_4821 ) ( SURFACE-AT ?auto_4816 ?auto_4820 ) ( ON ?auto_4816 ?auto_4822 ) ( CLEAR ?auto_4816 ) ( TRUCK-AT ?auto_4819 ?auto_4818 ) ( not ( = ?auto_4815 ?auto_4816 ) ) ( not ( = ?auto_4815 ?auto_4822 ) ) ( not ( = ?auto_4816 ?auto_4822 ) ) ( not ( = ?auto_4817 ?auto_4821 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4819 ?auto_4818 ?auto_4820 )
      ( !LIFT ?auto_4821 ?auto_4816 ?auto_4822 ?auto_4820 )
      ( !LOAD ?auto_4821 ?auto_4816 ?auto_4819 ?auto_4820 )
      ( !DRIVE ?auto_4819 ?auto_4820 ?auto_4818 )
      ( !UNLOAD ?auto_4817 ?auto_4816 ?auto_4819 ?auto_4818 )
      ( !DROP ?auto_4817 ?auto_4816 ?auto_4815 ?auto_4818 )
      ( MAKE-1CRATE-VERIFY ?auto_4815 ?auto_4816 ) )
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
      ?auto_4836 - PLACE
      ?auto_4834 - PLACE
      ?auto_4833 - HOIST
      ?auto_4838 - SURFACE
      ?auto_4841 - PLACE
      ?auto_4846 - HOIST
      ?auto_4842 - SURFACE
      ?auto_4843 - PLACE
      ?auto_4839 - HOIST
      ?auto_4844 - SURFACE
      ?auto_4845 - PLACE
      ?auto_4840 - HOIST
      ?auto_4847 - SURFACE
      ?auto_4837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4835 ?auto_4836 ) ( IS-CRATE ?auto_4832 ) ( not ( = ?auto_4834 ?auto_4836 ) ) ( HOIST-AT ?auto_4833 ?auto_4834 ) ( AVAILABLE ?auto_4833 ) ( SURFACE-AT ?auto_4832 ?auto_4834 ) ( ON ?auto_4832 ?auto_4838 ) ( CLEAR ?auto_4832 ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( not ( = ?auto_4831 ?auto_4838 ) ) ( not ( = ?auto_4832 ?auto_4838 ) ) ( not ( = ?auto_4835 ?auto_4833 ) ) ( IS-CRATE ?auto_4831 ) ( not ( = ?auto_4841 ?auto_4836 ) ) ( HOIST-AT ?auto_4846 ?auto_4841 ) ( AVAILABLE ?auto_4846 ) ( SURFACE-AT ?auto_4831 ?auto_4841 ) ( ON ?auto_4831 ?auto_4842 ) ( CLEAR ?auto_4831 ) ( not ( = ?auto_4830 ?auto_4831 ) ) ( not ( = ?auto_4830 ?auto_4842 ) ) ( not ( = ?auto_4831 ?auto_4842 ) ) ( not ( = ?auto_4835 ?auto_4846 ) ) ( IS-CRATE ?auto_4830 ) ( not ( = ?auto_4843 ?auto_4836 ) ) ( HOIST-AT ?auto_4839 ?auto_4843 ) ( AVAILABLE ?auto_4839 ) ( SURFACE-AT ?auto_4830 ?auto_4843 ) ( ON ?auto_4830 ?auto_4844 ) ( CLEAR ?auto_4830 ) ( not ( = ?auto_4829 ?auto_4830 ) ) ( not ( = ?auto_4829 ?auto_4844 ) ) ( not ( = ?auto_4830 ?auto_4844 ) ) ( not ( = ?auto_4835 ?auto_4839 ) ) ( SURFACE-AT ?auto_4828 ?auto_4836 ) ( CLEAR ?auto_4828 ) ( IS-CRATE ?auto_4829 ) ( AVAILABLE ?auto_4835 ) ( not ( = ?auto_4845 ?auto_4836 ) ) ( HOIST-AT ?auto_4840 ?auto_4845 ) ( AVAILABLE ?auto_4840 ) ( SURFACE-AT ?auto_4829 ?auto_4845 ) ( ON ?auto_4829 ?auto_4847 ) ( CLEAR ?auto_4829 ) ( TRUCK-AT ?auto_4837 ?auto_4836 ) ( not ( = ?auto_4828 ?auto_4829 ) ) ( not ( = ?auto_4828 ?auto_4847 ) ) ( not ( = ?auto_4829 ?auto_4847 ) ) ( not ( = ?auto_4835 ?auto_4840 ) ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4828 ?auto_4844 ) ) ( not ( = ?auto_4830 ?auto_4847 ) ) ( not ( = ?auto_4843 ?auto_4845 ) ) ( not ( = ?auto_4839 ?auto_4840 ) ) ( not ( = ?auto_4844 ?auto_4847 ) ) ( not ( = ?auto_4828 ?auto_4831 ) ) ( not ( = ?auto_4828 ?auto_4842 ) ) ( not ( = ?auto_4829 ?auto_4831 ) ) ( not ( = ?auto_4829 ?auto_4842 ) ) ( not ( = ?auto_4831 ?auto_4844 ) ) ( not ( = ?auto_4831 ?auto_4847 ) ) ( not ( = ?auto_4841 ?auto_4843 ) ) ( not ( = ?auto_4841 ?auto_4845 ) ) ( not ( = ?auto_4846 ?auto_4839 ) ) ( not ( = ?auto_4846 ?auto_4840 ) ) ( not ( = ?auto_4842 ?auto_4844 ) ) ( not ( = ?auto_4842 ?auto_4847 ) ) ( not ( = ?auto_4828 ?auto_4832 ) ) ( not ( = ?auto_4828 ?auto_4838 ) ) ( not ( = ?auto_4829 ?auto_4832 ) ) ( not ( = ?auto_4829 ?auto_4838 ) ) ( not ( = ?auto_4830 ?auto_4832 ) ) ( not ( = ?auto_4830 ?auto_4838 ) ) ( not ( = ?auto_4832 ?auto_4842 ) ) ( not ( = ?auto_4832 ?auto_4844 ) ) ( not ( = ?auto_4832 ?auto_4847 ) ) ( not ( = ?auto_4834 ?auto_4841 ) ) ( not ( = ?auto_4834 ?auto_4843 ) ) ( not ( = ?auto_4834 ?auto_4845 ) ) ( not ( = ?auto_4833 ?auto_4846 ) ) ( not ( = ?auto_4833 ?auto_4839 ) ) ( not ( = ?auto_4833 ?auto_4840 ) ) ( not ( = ?auto_4838 ?auto_4842 ) ) ( not ( = ?auto_4838 ?auto_4844 ) ) ( not ( = ?auto_4838 ?auto_4847 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4831 )
      ( MAKE-1CRATE ?auto_4831 ?auto_4832 )
      ( MAKE-4CRATE-VERIFY ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4831 ?auto_4832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4850 - SURFACE
      ?auto_4851 - SURFACE
    )
    :vars
    (
      ?auto_4852 - HOIST
      ?auto_4853 - PLACE
      ?auto_4855 - PLACE
      ?auto_4856 - HOIST
      ?auto_4857 - SURFACE
      ?auto_4854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4852 ?auto_4853 ) ( SURFACE-AT ?auto_4850 ?auto_4853 ) ( CLEAR ?auto_4850 ) ( IS-CRATE ?auto_4851 ) ( AVAILABLE ?auto_4852 ) ( not ( = ?auto_4855 ?auto_4853 ) ) ( HOIST-AT ?auto_4856 ?auto_4855 ) ( AVAILABLE ?auto_4856 ) ( SURFACE-AT ?auto_4851 ?auto_4855 ) ( ON ?auto_4851 ?auto_4857 ) ( CLEAR ?auto_4851 ) ( TRUCK-AT ?auto_4854 ?auto_4853 ) ( not ( = ?auto_4850 ?auto_4851 ) ) ( not ( = ?auto_4850 ?auto_4857 ) ) ( not ( = ?auto_4851 ?auto_4857 ) ) ( not ( = ?auto_4852 ?auto_4856 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4854 ?auto_4853 ?auto_4855 )
      ( !LIFT ?auto_4856 ?auto_4851 ?auto_4857 ?auto_4855 )
      ( !LOAD ?auto_4856 ?auto_4851 ?auto_4854 ?auto_4855 )
      ( !DRIVE ?auto_4854 ?auto_4855 ?auto_4853 )
      ( !UNLOAD ?auto_4852 ?auto_4851 ?auto_4854 ?auto_4853 )
      ( !DROP ?auto_4852 ?auto_4851 ?auto_4850 ?auto_4853 )
      ( MAKE-1CRATE-VERIFY ?auto_4850 ?auto_4851 ) )
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
      ?auto_4872 - HOIST
      ?auto_4874 - PLACE
      ?auto_4871 - PLACE
      ?auto_4875 - HOIST
      ?auto_4870 - SURFACE
      ?auto_4878 - PLACE
      ?auto_4876 - HOIST
      ?auto_4885 - SURFACE
      ?auto_4879 - PLACE
      ?auto_4883 - HOIST
      ?auto_4877 - SURFACE
      ?auto_4880 - SURFACE
      ?auto_4882 - PLACE
      ?auto_4884 - HOIST
      ?auto_4881 - SURFACE
      ?auto_4873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4872 ?auto_4874 ) ( IS-CRATE ?auto_4869 ) ( not ( = ?auto_4871 ?auto_4874 ) ) ( HOIST-AT ?auto_4875 ?auto_4871 ) ( SURFACE-AT ?auto_4869 ?auto_4871 ) ( ON ?auto_4869 ?auto_4870 ) ( CLEAR ?auto_4869 ) ( not ( = ?auto_4868 ?auto_4869 ) ) ( not ( = ?auto_4868 ?auto_4870 ) ) ( not ( = ?auto_4869 ?auto_4870 ) ) ( not ( = ?auto_4872 ?auto_4875 ) ) ( IS-CRATE ?auto_4868 ) ( not ( = ?auto_4878 ?auto_4874 ) ) ( HOIST-AT ?auto_4876 ?auto_4878 ) ( AVAILABLE ?auto_4876 ) ( SURFACE-AT ?auto_4868 ?auto_4878 ) ( ON ?auto_4868 ?auto_4885 ) ( CLEAR ?auto_4868 ) ( not ( = ?auto_4867 ?auto_4868 ) ) ( not ( = ?auto_4867 ?auto_4885 ) ) ( not ( = ?auto_4868 ?auto_4885 ) ) ( not ( = ?auto_4872 ?auto_4876 ) ) ( IS-CRATE ?auto_4867 ) ( not ( = ?auto_4879 ?auto_4874 ) ) ( HOIST-AT ?auto_4883 ?auto_4879 ) ( AVAILABLE ?auto_4883 ) ( SURFACE-AT ?auto_4867 ?auto_4879 ) ( ON ?auto_4867 ?auto_4877 ) ( CLEAR ?auto_4867 ) ( not ( = ?auto_4866 ?auto_4867 ) ) ( not ( = ?auto_4866 ?auto_4877 ) ) ( not ( = ?auto_4867 ?auto_4877 ) ) ( not ( = ?auto_4872 ?auto_4883 ) ) ( IS-CRATE ?auto_4866 ) ( AVAILABLE ?auto_4875 ) ( SURFACE-AT ?auto_4866 ?auto_4871 ) ( ON ?auto_4866 ?auto_4880 ) ( CLEAR ?auto_4866 ) ( not ( = ?auto_4865 ?auto_4866 ) ) ( not ( = ?auto_4865 ?auto_4880 ) ) ( not ( = ?auto_4866 ?auto_4880 ) ) ( SURFACE-AT ?auto_4864 ?auto_4874 ) ( CLEAR ?auto_4864 ) ( IS-CRATE ?auto_4865 ) ( AVAILABLE ?auto_4872 ) ( not ( = ?auto_4882 ?auto_4874 ) ) ( HOIST-AT ?auto_4884 ?auto_4882 ) ( AVAILABLE ?auto_4884 ) ( SURFACE-AT ?auto_4865 ?auto_4882 ) ( ON ?auto_4865 ?auto_4881 ) ( CLEAR ?auto_4865 ) ( TRUCK-AT ?auto_4873 ?auto_4874 ) ( not ( = ?auto_4864 ?auto_4865 ) ) ( not ( = ?auto_4864 ?auto_4881 ) ) ( not ( = ?auto_4865 ?auto_4881 ) ) ( not ( = ?auto_4872 ?auto_4884 ) ) ( not ( = ?auto_4864 ?auto_4866 ) ) ( not ( = ?auto_4864 ?auto_4880 ) ) ( not ( = ?auto_4866 ?auto_4881 ) ) ( not ( = ?auto_4871 ?auto_4882 ) ) ( not ( = ?auto_4875 ?auto_4884 ) ) ( not ( = ?auto_4880 ?auto_4881 ) ) ( not ( = ?auto_4864 ?auto_4867 ) ) ( not ( = ?auto_4864 ?auto_4877 ) ) ( not ( = ?auto_4865 ?auto_4867 ) ) ( not ( = ?auto_4865 ?auto_4877 ) ) ( not ( = ?auto_4867 ?auto_4880 ) ) ( not ( = ?auto_4867 ?auto_4881 ) ) ( not ( = ?auto_4879 ?auto_4871 ) ) ( not ( = ?auto_4879 ?auto_4882 ) ) ( not ( = ?auto_4883 ?auto_4875 ) ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( not ( = ?auto_4877 ?auto_4880 ) ) ( not ( = ?auto_4877 ?auto_4881 ) ) ( not ( = ?auto_4864 ?auto_4868 ) ) ( not ( = ?auto_4864 ?auto_4885 ) ) ( not ( = ?auto_4865 ?auto_4868 ) ) ( not ( = ?auto_4865 ?auto_4885 ) ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4866 ?auto_4885 ) ) ( not ( = ?auto_4868 ?auto_4877 ) ) ( not ( = ?auto_4868 ?auto_4880 ) ) ( not ( = ?auto_4868 ?auto_4881 ) ) ( not ( = ?auto_4878 ?auto_4879 ) ) ( not ( = ?auto_4878 ?auto_4871 ) ) ( not ( = ?auto_4878 ?auto_4882 ) ) ( not ( = ?auto_4876 ?auto_4883 ) ) ( not ( = ?auto_4876 ?auto_4875 ) ) ( not ( = ?auto_4876 ?auto_4884 ) ) ( not ( = ?auto_4885 ?auto_4877 ) ) ( not ( = ?auto_4885 ?auto_4880 ) ) ( not ( = ?auto_4885 ?auto_4881 ) ) ( not ( = ?auto_4864 ?auto_4869 ) ) ( not ( = ?auto_4864 ?auto_4870 ) ) ( not ( = ?auto_4865 ?auto_4869 ) ) ( not ( = ?auto_4865 ?auto_4870 ) ) ( not ( = ?auto_4866 ?auto_4869 ) ) ( not ( = ?auto_4866 ?auto_4870 ) ) ( not ( = ?auto_4867 ?auto_4869 ) ) ( not ( = ?auto_4867 ?auto_4870 ) ) ( not ( = ?auto_4869 ?auto_4885 ) ) ( not ( = ?auto_4869 ?auto_4877 ) ) ( not ( = ?auto_4869 ?auto_4880 ) ) ( not ( = ?auto_4869 ?auto_4881 ) ) ( not ( = ?auto_4870 ?auto_4885 ) ) ( not ( = ?auto_4870 ?auto_4877 ) ) ( not ( = ?auto_4870 ?auto_4880 ) ) ( not ( = ?auto_4870 ?auto_4881 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4864 ?auto_4865 ?auto_4866 ?auto_4867 ?auto_4868 )
      ( MAKE-1CRATE ?auto_4868 ?auto_4869 )
      ( MAKE-5CRATE-VERIFY ?auto_4864 ?auto_4865 ?auto_4866 ?auto_4867 ?auto_4868 ?auto_4869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4888 - SURFACE
      ?auto_4889 - SURFACE
    )
    :vars
    (
      ?auto_4890 - HOIST
      ?auto_4891 - PLACE
      ?auto_4893 - PLACE
      ?auto_4894 - HOIST
      ?auto_4895 - SURFACE
      ?auto_4892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4890 ?auto_4891 ) ( SURFACE-AT ?auto_4888 ?auto_4891 ) ( CLEAR ?auto_4888 ) ( IS-CRATE ?auto_4889 ) ( AVAILABLE ?auto_4890 ) ( not ( = ?auto_4893 ?auto_4891 ) ) ( HOIST-AT ?auto_4894 ?auto_4893 ) ( AVAILABLE ?auto_4894 ) ( SURFACE-AT ?auto_4889 ?auto_4893 ) ( ON ?auto_4889 ?auto_4895 ) ( CLEAR ?auto_4889 ) ( TRUCK-AT ?auto_4892 ?auto_4891 ) ( not ( = ?auto_4888 ?auto_4889 ) ) ( not ( = ?auto_4888 ?auto_4895 ) ) ( not ( = ?auto_4889 ?auto_4895 ) ) ( not ( = ?auto_4890 ?auto_4894 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4892 ?auto_4891 ?auto_4893 )
      ( !LIFT ?auto_4894 ?auto_4889 ?auto_4895 ?auto_4893 )
      ( !LOAD ?auto_4894 ?auto_4889 ?auto_4892 ?auto_4893 )
      ( !DRIVE ?auto_4892 ?auto_4893 ?auto_4891 )
      ( !UNLOAD ?auto_4890 ?auto_4889 ?auto_4892 ?auto_4891 )
      ( !DROP ?auto_4890 ?auto_4889 ?auto_4888 ?auto_4891 )
      ( MAKE-1CRATE-VERIFY ?auto_4888 ?auto_4889 ) )
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
      ?auto_4914 - HOIST
      ?auto_4913 - PLACE
      ?auto_4911 - PLACE
      ?auto_4912 - HOIST
      ?auto_4910 - SURFACE
      ?auto_4922 - PLACE
      ?auto_4925 - HOIST
      ?auto_4924 - SURFACE
      ?auto_4926 - PLACE
      ?auto_4923 - HOIST
      ?auto_4928 - SURFACE
      ?auto_4917 - PLACE
      ?auto_4918 - HOIST
      ?auto_4927 - SURFACE
      ?auto_4921 - SURFACE
      ?auto_4919 - PLACE
      ?auto_4916 - HOIST
      ?auto_4920 - SURFACE
      ?auto_4915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4914 ?auto_4913 ) ( IS-CRATE ?auto_4909 ) ( not ( = ?auto_4911 ?auto_4913 ) ) ( HOIST-AT ?auto_4912 ?auto_4911 ) ( AVAILABLE ?auto_4912 ) ( SURFACE-AT ?auto_4909 ?auto_4911 ) ( ON ?auto_4909 ?auto_4910 ) ( CLEAR ?auto_4909 ) ( not ( = ?auto_4908 ?auto_4909 ) ) ( not ( = ?auto_4908 ?auto_4910 ) ) ( not ( = ?auto_4909 ?auto_4910 ) ) ( not ( = ?auto_4914 ?auto_4912 ) ) ( IS-CRATE ?auto_4908 ) ( not ( = ?auto_4922 ?auto_4913 ) ) ( HOIST-AT ?auto_4925 ?auto_4922 ) ( SURFACE-AT ?auto_4908 ?auto_4922 ) ( ON ?auto_4908 ?auto_4924 ) ( CLEAR ?auto_4908 ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( not ( = ?auto_4907 ?auto_4924 ) ) ( not ( = ?auto_4908 ?auto_4924 ) ) ( not ( = ?auto_4914 ?auto_4925 ) ) ( IS-CRATE ?auto_4907 ) ( not ( = ?auto_4926 ?auto_4913 ) ) ( HOIST-AT ?auto_4923 ?auto_4926 ) ( AVAILABLE ?auto_4923 ) ( SURFACE-AT ?auto_4907 ?auto_4926 ) ( ON ?auto_4907 ?auto_4928 ) ( CLEAR ?auto_4907 ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( not ( = ?auto_4906 ?auto_4928 ) ) ( not ( = ?auto_4907 ?auto_4928 ) ) ( not ( = ?auto_4914 ?auto_4923 ) ) ( IS-CRATE ?auto_4906 ) ( not ( = ?auto_4917 ?auto_4913 ) ) ( HOIST-AT ?auto_4918 ?auto_4917 ) ( AVAILABLE ?auto_4918 ) ( SURFACE-AT ?auto_4906 ?auto_4917 ) ( ON ?auto_4906 ?auto_4927 ) ( CLEAR ?auto_4906 ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( not ( = ?auto_4905 ?auto_4927 ) ) ( not ( = ?auto_4906 ?auto_4927 ) ) ( not ( = ?auto_4914 ?auto_4918 ) ) ( IS-CRATE ?auto_4905 ) ( AVAILABLE ?auto_4925 ) ( SURFACE-AT ?auto_4905 ?auto_4922 ) ( ON ?auto_4905 ?auto_4921 ) ( CLEAR ?auto_4905 ) ( not ( = ?auto_4904 ?auto_4905 ) ) ( not ( = ?auto_4904 ?auto_4921 ) ) ( not ( = ?auto_4905 ?auto_4921 ) ) ( SURFACE-AT ?auto_4903 ?auto_4913 ) ( CLEAR ?auto_4903 ) ( IS-CRATE ?auto_4904 ) ( AVAILABLE ?auto_4914 ) ( not ( = ?auto_4919 ?auto_4913 ) ) ( HOIST-AT ?auto_4916 ?auto_4919 ) ( AVAILABLE ?auto_4916 ) ( SURFACE-AT ?auto_4904 ?auto_4919 ) ( ON ?auto_4904 ?auto_4920 ) ( CLEAR ?auto_4904 ) ( TRUCK-AT ?auto_4915 ?auto_4913 ) ( not ( = ?auto_4903 ?auto_4904 ) ) ( not ( = ?auto_4903 ?auto_4920 ) ) ( not ( = ?auto_4904 ?auto_4920 ) ) ( not ( = ?auto_4914 ?auto_4916 ) ) ( not ( = ?auto_4903 ?auto_4905 ) ) ( not ( = ?auto_4903 ?auto_4921 ) ) ( not ( = ?auto_4905 ?auto_4920 ) ) ( not ( = ?auto_4922 ?auto_4919 ) ) ( not ( = ?auto_4925 ?auto_4916 ) ) ( not ( = ?auto_4921 ?auto_4920 ) ) ( not ( = ?auto_4903 ?auto_4906 ) ) ( not ( = ?auto_4903 ?auto_4927 ) ) ( not ( = ?auto_4904 ?auto_4906 ) ) ( not ( = ?auto_4904 ?auto_4927 ) ) ( not ( = ?auto_4906 ?auto_4921 ) ) ( not ( = ?auto_4906 ?auto_4920 ) ) ( not ( = ?auto_4917 ?auto_4922 ) ) ( not ( = ?auto_4917 ?auto_4919 ) ) ( not ( = ?auto_4918 ?auto_4925 ) ) ( not ( = ?auto_4918 ?auto_4916 ) ) ( not ( = ?auto_4927 ?auto_4921 ) ) ( not ( = ?auto_4927 ?auto_4920 ) ) ( not ( = ?auto_4903 ?auto_4907 ) ) ( not ( = ?auto_4903 ?auto_4928 ) ) ( not ( = ?auto_4904 ?auto_4907 ) ) ( not ( = ?auto_4904 ?auto_4928 ) ) ( not ( = ?auto_4905 ?auto_4907 ) ) ( not ( = ?auto_4905 ?auto_4928 ) ) ( not ( = ?auto_4907 ?auto_4927 ) ) ( not ( = ?auto_4907 ?auto_4921 ) ) ( not ( = ?auto_4907 ?auto_4920 ) ) ( not ( = ?auto_4926 ?auto_4917 ) ) ( not ( = ?auto_4926 ?auto_4922 ) ) ( not ( = ?auto_4926 ?auto_4919 ) ) ( not ( = ?auto_4923 ?auto_4918 ) ) ( not ( = ?auto_4923 ?auto_4925 ) ) ( not ( = ?auto_4923 ?auto_4916 ) ) ( not ( = ?auto_4928 ?auto_4927 ) ) ( not ( = ?auto_4928 ?auto_4921 ) ) ( not ( = ?auto_4928 ?auto_4920 ) ) ( not ( = ?auto_4903 ?auto_4908 ) ) ( not ( = ?auto_4903 ?auto_4924 ) ) ( not ( = ?auto_4904 ?auto_4908 ) ) ( not ( = ?auto_4904 ?auto_4924 ) ) ( not ( = ?auto_4905 ?auto_4908 ) ) ( not ( = ?auto_4905 ?auto_4924 ) ) ( not ( = ?auto_4906 ?auto_4908 ) ) ( not ( = ?auto_4906 ?auto_4924 ) ) ( not ( = ?auto_4908 ?auto_4928 ) ) ( not ( = ?auto_4908 ?auto_4927 ) ) ( not ( = ?auto_4908 ?auto_4921 ) ) ( not ( = ?auto_4908 ?auto_4920 ) ) ( not ( = ?auto_4924 ?auto_4928 ) ) ( not ( = ?auto_4924 ?auto_4927 ) ) ( not ( = ?auto_4924 ?auto_4921 ) ) ( not ( = ?auto_4924 ?auto_4920 ) ) ( not ( = ?auto_4903 ?auto_4909 ) ) ( not ( = ?auto_4903 ?auto_4910 ) ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( not ( = ?auto_4904 ?auto_4910 ) ) ( not ( = ?auto_4905 ?auto_4909 ) ) ( not ( = ?auto_4905 ?auto_4910 ) ) ( not ( = ?auto_4906 ?auto_4909 ) ) ( not ( = ?auto_4906 ?auto_4910 ) ) ( not ( = ?auto_4907 ?auto_4909 ) ) ( not ( = ?auto_4907 ?auto_4910 ) ) ( not ( = ?auto_4909 ?auto_4924 ) ) ( not ( = ?auto_4909 ?auto_4928 ) ) ( not ( = ?auto_4909 ?auto_4927 ) ) ( not ( = ?auto_4909 ?auto_4921 ) ) ( not ( = ?auto_4909 ?auto_4920 ) ) ( not ( = ?auto_4911 ?auto_4922 ) ) ( not ( = ?auto_4911 ?auto_4926 ) ) ( not ( = ?auto_4911 ?auto_4917 ) ) ( not ( = ?auto_4911 ?auto_4919 ) ) ( not ( = ?auto_4912 ?auto_4925 ) ) ( not ( = ?auto_4912 ?auto_4923 ) ) ( not ( = ?auto_4912 ?auto_4918 ) ) ( not ( = ?auto_4912 ?auto_4916 ) ) ( not ( = ?auto_4910 ?auto_4924 ) ) ( not ( = ?auto_4910 ?auto_4928 ) ) ( not ( = ?auto_4910 ?auto_4927 ) ) ( not ( = ?auto_4910 ?auto_4921 ) ) ( not ( = ?auto_4910 ?auto_4920 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4903 ?auto_4904 ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4908 )
      ( MAKE-1CRATE ?auto_4908 ?auto_4909 )
      ( MAKE-6CRATE-VERIFY ?auto_4903 ?auto_4904 ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4908 ?auto_4909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4931 - SURFACE
      ?auto_4932 - SURFACE
    )
    :vars
    (
      ?auto_4933 - HOIST
      ?auto_4934 - PLACE
      ?auto_4936 - PLACE
      ?auto_4937 - HOIST
      ?auto_4938 - SURFACE
      ?auto_4935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4933 ?auto_4934 ) ( SURFACE-AT ?auto_4931 ?auto_4934 ) ( CLEAR ?auto_4931 ) ( IS-CRATE ?auto_4932 ) ( AVAILABLE ?auto_4933 ) ( not ( = ?auto_4936 ?auto_4934 ) ) ( HOIST-AT ?auto_4937 ?auto_4936 ) ( AVAILABLE ?auto_4937 ) ( SURFACE-AT ?auto_4932 ?auto_4936 ) ( ON ?auto_4932 ?auto_4938 ) ( CLEAR ?auto_4932 ) ( TRUCK-AT ?auto_4935 ?auto_4934 ) ( not ( = ?auto_4931 ?auto_4932 ) ) ( not ( = ?auto_4931 ?auto_4938 ) ) ( not ( = ?auto_4932 ?auto_4938 ) ) ( not ( = ?auto_4933 ?auto_4937 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4935 ?auto_4934 ?auto_4936 )
      ( !LIFT ?auto_4937 ?auto_4932 ?auto_4938 ?auto_4936 )
      ( !LOAD ?auto_4937 ?auto_4932 ?auto_4935 ?auto_4936 )
      ( !DRIVE ?auto_4935 ?auto_4936 ?auto_4934 )
      ( !UNLOAD ?auto_4933 ?auto_4932 ?auto_4935 ?auto_4934 )
      ( !DROP ?auto_4933 ?auto_4932 ?auto_4931 ?auto_4934 )
      ( MAKE-1CRATE-VERIFY ?auto_4931 ?auto_4932 ) )
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
      ?auto_4954 - SURFACE
      ?auto_4953 - SURFACE
    )
    :vars
    (
      ?auto_4956 - HOIST
      ?auto_4955 - PLACE
      ?auto_4957 - PLACE
      ?auto_4959 - HOIST
      ?auto_4960 - SURFACE
      ?auto_4961 - PLACE
      ?auto_4972 - HOIST
      ?auto_4962 - SURFACE
      ?auto_4969 - PLACE
      ?auto_4965 - HOIST
      ?auto_4963 - SURFACE
      ?auto_4964 - PLACE
      ?auto_4968 - HOIST
      ?auto_4967 - SURFACE
      ?auto_4966 - SURFACE
      ?auto_4970 - SURFACE
      ?auto_4973 - PLACE
      ?auto_4974 - HOIST
      ?auto_4971 - SURFACE
      ?auto_4958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4956 ?auto_4955 ) ( IS-CRATE ?auto_4953 ) ( not ( = ?auto_4957 ?auto_4955 ) ) ( HOIST-AT ?auto_4959 ?auto_4957 ) ( SURFACE-AT ?auto_4953 ?auto_4957 ) ( ON ?auto_4953 ?auto_4960 ) ( CLEAR ?auto_4953 ) ( not ( = ?auto_4954 ?auto_4953 ) ) ( not ( = ?auto_4954 ?auto_4960 ) ) ( not ( = ?auto_4953 ?auto_4960 ) ) ( not ( = ?auto_4956 ?auto_4959 ) ) ( IS-CRATE ?auto_4954 ) ( not ( = ?auto_4961 ?auto_4955 ) ) ( HOIST-AT ?auto_4972 ?auto_4961 ) ( AVAILABLE ?auto_4972 ) ( SURFACE-AT ?auto_4954 ?auto_4961 ) ( ON ?auto_4954 ?auto_4962 ) ( CLEAR ?auto_4954 ) ( not ( = ?auto_4952 ?auto_4954 ) ) ( not ( = ?auto_4952 ?auto_4962 ) ) ( not ( = ?auto_4954 ?auto_4962 ) ) ( not ( = ?auto_4956 ?auto_4972 ) ) ( IS-CRATE ?auto_4952 ) ( not ( = ?auto_4969 ?auto_4955 ) ) ( HOIST-AT ?auto_4965 ?auto_4969 ) ( SURFACE-AT ?auto_4952 ?auto_4969 ) ( ON ?auto_4952 ?auto_4963 ) ( CLEAR ?auto_4952 ) ( not ( = ?auto_4951 ?auto_4952 ) ) ( not ( = ?auto_4951 ?auto_4963 ) ) ( not ( = ?auto_4952 ?auto_4963 ) ) ( not ( = ?auto_4956 ?auto_4965 ) ) ( IS-CRATE ?auto_4951 ) ( not ( = ?auto_4964 ?auto_4955 ) ) ( HOIST-AT ?auto_4968 ?auto_4964 ) ( AVAILABLE ?auto_4968 ) ( SURFACE-AT ?auto_4951 ?auto_4964 ) ( ON ?auto_4951 ?auto_4967 ) ( CLEAR ?auto_4951 ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4967 ) ) ( not ( = ?auto_4951 ?auto_4967 ) ) ( not ( = ?auto_4956 ?auto_4968 ) ) ( IS-CRATE ?auto_4950 ) ( AVAILABLE ?auto_4959 ) ( SURFACE-AT ?auto_4950 ?auto_4957 ) ( ON ?auto_4950 ?auto_4966 ) ( CLEAR ?auto_4950 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4949 ?auto_4966 ) ) ( not ( = ?auto_4950 ?auto_4966 ) ) ( IS-CRATE ?auto_4949 ) ( AVAILABLE ?auto_4965 ) ( SURFACE-AT ?auto_4949 ?auto_4969 ) ( ON ?auto_4949 ?auto_4970 ) ( CLEAR ?auto_4949 ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4970 ) ) ( not ( = ?auto_4949 ?auto_4970 ) ) ( SURFACE-AT ?auto_4947 ?auto_4955 ) ( CLEAR ?auto_4947 ) ( IS-CRATE ?auto_4948 ) ( AVAILABLE ?auto_4956 ) ( not ( = ?auto_4973 ?auto_4955 ) ) ( HOIST-AT ?auto_4974 ?auto_4973 ) ( AVAILABLE ?auto_4974 ) ( SURFACE-AT ?auto_4948 ?auto_4973 ) ( ON ?auto_4948 ?auto_4971 ) ( CLEAR ?auto_4948 ) ( TRUCK-AT ?auto_4958 ?auto_4955 ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( not ( = ?auto_4947 ?auto_4971 ) ) ( not ( = ?auto_4948 ?auto_4971 ) ) ( not ( = ?auto_4956 ?auto_4974 ) ) ( not ( = ?auto_4947 ?auto_4949 ) ) ( not ( = ?auto_4947 ?auto_4970 ) ) ( not ( = ?auto_4949 ?auto_4971 ) ) ( not ( = ?auto_4969 ?auto_4973 ) ) ( not ( = ?auto_4965 ?auto_4974 ) ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( not ( = ?auto_4947 ?auto_4950 ) ) ( not ( = ?auto_4947 ?auto_4966 ) ) ( not ( = ?auto_4948 ?auto_4950 ) ) ( not ( = ?auto_4948 ?auto_4966 ) ) ( not ( = ?auto_4950 ?auto_4970 ) ) ( not ( = ?auto_4950 ?auto_4971 ) ) ( not ( = ?auto_4957 ?auto_4969 ) ) ( not ( = ?auto_4957 ?auto_4973 ) ) ( not ( = ?auto_4959 ?auto_4965 ) ) ( not ( = ?auto_4959 ?auto_4974 ) ) ( not ( = ?auto_4966 ?auto_4970 ) ) ( not ( = ?auto_4966 ?auto_4971 ) ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( not ( = ?auto_4947 ?auto_4967 ) ) ( not ( = ?auto_4948 ?auto_4951 ) ) ( not ( = ?auto_4948 ?auto_4967 ) ) ( not ( = ?auto_4949 ?auto_4951 ) ) ( not ( = ?auto_4949 ?auto_4967 ) ) ( not ( = ?auto_4951 ?auto_4966 ) ) ( not ( = ?auto_4951 ?auto_4970 ) ) ( not ( = ?auto_4951 ?auto_4971 ) ) ( not ( = ?auto_4964 ?auto_4957 ) ) ( not ( = ?auto_4964 ?auto_4969 ) ) ( not ( = ?auto_4964 ?auto_4973 ) ) ( not ( = ?auto_4968 ?auto_4959 ) ) ( not ( = ?auto_4968 ?auto_4965 ) ) ( not ( = ?auto_4968 ?auto_4974 ) ) ( not ( = ?auto_4967 ?auto_4966 ) ) ( not ( = ?auto_4967 ?auto_4970 ) ) ( not ( = ?auto_4967 ?auto_4971 ) ) ( not ( = ?auto_4947 ?auto_4952 ) ) ( not ( = ?auto_4947 ?auto_4963 ) ) ( not ( = ?auto_4948 ?auto_4952 ) ) ( not ( = ?auto_4948 ?auto_4963 ) ) ( not ( = ?auto_4949 ?auto_4952 ) ) ( not ( = ?auto_4949 ?auto_4963 ) ) ( not ( = ?auto_4950 ?auto_4952 ) ) ( not ( = ?auto_4950 ?auto_4963 ) ) ( not ( = ?auto_4952 ?auto_4967 ) ) ( not ( = ?auto_4952 ?auto_4966 ) ) ( not ( = ?auto_4952 ?auto_4970 ) ) ( not ( = ?auto_4952 ?auto_4971 ) ) ( not ( = ?auto_4963 ?auto_4967 ) ) ( not ( = ?auto_4963 ?auto_4966 ) ) ( not ( = ?auto_4963 ?auto_4970 ) ) ( not ( = ?auto_4963 ?auto_4971 ) ) ( not ( = ?auto_4947 ?auto_4954 ) ) ( not ( = ?auto_4947 ?auto_4962 ) ) ( not ( = ?auto_4948 ?auto_4954 ) ) ( not ( = ?auto_4948 ?auto_4962 ) ) ( not ( = ?auto_4949 ?auto_4954 ) ) ( not ( = ?auto_4949 ?auto_4962 ) ) ( not ( = ?auto_4950 ?auto_4954 ) ) ( not ( = ?auto_4950 ?auto_4962 ) ) ( not ( = ?auto_4951 ?auto_4954 ) ) ( not ( = ?auto_4951 ?auto_4962 ) ) ( not ( = ?auto_4954 ?auto_4963 ) ) ( not ( = ?auto_4954 ?auto_4967 ) ) ( not ( = ?auto_4954 ?auto_4966 ) ) ( not ( = ?auto_4954 ?auto_4970 ) ) ( not ( = ?auto_4954 ?auto_4971 ) ) ( not ( = ?auto_4961 ?auto_4969 ) ) ( not ( = ?auto_4961 ?auto_4964 ) ) ( not ( = ?auto_4961 ?auto_4957 ) ) ( not ( = ?auto_4961 ?auto_4973 ) ) ( not ( = ?auto_4972 ?auto_4965 ) ) ( not ( = ?auto_4972 ?auto_4968 ) ) ( not ( = ?auto_4972 ?auto_4959 ) ) ( not ( = ?auto_4972 ?auto_4974 ) ) ( not ( = ?auto_4962 ?auto_4963 ) ) ( not ( = ?auto_4962 ?auto_4967 ) ) ( not ( = ?auto_4962 ?auto_4966 ) ) ( not ( = ?auto_4962 ?auto_4970 ) ) ( not ( = ?auto_4962 ?auto_4971 ) ) ( not ( = ?auto_4947 ?auto_4953 ) ) ( not ( = ?auto_4947 ?auto_4960 ) ) ( not ( = ?auto_4948 ?auto_4953 ) ) ( not ( = ?auto_4948 ?auto_4960 ) ) ( not ( = ?auto_4949 ?auto_4953 ) ) ( not ( = ?auto_4949 ?auto_4960 ) ) ( not ( = ?auto_4950 ?auto_4953 ) ) ( not ( = ?auto_4950 ?auto_4960 ) ) ( not ( = ?auto_4951 ?auto_4953 ) ) ( not ( = ?auto_4951 ?auto_4960 ) ) ( not ( = ?auto_4952 ?auto_4953 ) ) ( not ( = ?auto_4952 ?auto_4960 ) ) ( not ( = ?auto_4953 ?auto_4962 ) ) ( not ( = ?auto_4953 ?auto_4963 ) ) ( not ( = ?auto_4953 ?auto_4967 ) ) ( not ( = ?auto_4953 ?auto_4966 ) ) ( not ( = ?auto_4953 ?auto_4970 ) ) ( not ( = ?auto_4953 ?auto_4971 ) ) ( not ( = ?auto_4960 ?auto_4962 ) ) ( not ( = ?auto_4960 ?auto_4963 ) ) ( not ( = ?auto_4960 ?auto_4967 ) ) ( not ( = ?auto_4960 ?auto_4966 ) ) ( not ( = ?auto_4960 ?auto_4970 ) ) ( not ( = ?auto_4960 ?auto_4971 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4947 ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4951 ?auto_4952 ?auto_4954 )
      ( MAKE-1CRATE ?auto_4954 ?auto_4953 )
      ( MAKE-7CRATE-VERIFY ?auto_4947 ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4951 ?auto_4952 ?auto_4954 ?auto_4953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4977 - SURFACE
      ?auto_4978 - SURFACE
    )
    :vars
    (
      ?auto_4979 - HOIST
      ?auto_4980 - PLACE
      ?auto_4982 - PLACE
      ?auto_4983 - HOIST
      ?auto_4984 - SURFACE
      ?auto_4981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4979 ?auto_4980 ) ( SURFACE-AT ?auto_4977 ?auto_4980 ) ( CLEAR ?auto_4977 ) ( IS-CRATE ?auto_4978 ) ( AVAILABLE ?auto_4979 ) ( not ( = ?auto_4982 ?auto_4980 ) ) ( HOIST-AT ?auto_4983 ?auto_4982 ) ( AVAILABLE ?auto_4983 ) ( SURFACE-AT ?auto_4978 ?auto_4982 ) ( ON ?auto_4978 ?auto_4984 ) ( CLEAR ?auto_4978 ) ( TRUCK-AT ?auto_4981 ?auto_4980 ) ( not ( = ?auto_4977 ?auto_4978 ) ) ( not ( = ?auto_4977 ?auto_4984 ) ) ( not ( = ?auto_4978 ?auto_4984 ) ) ( not ( = ?auto_4979 ?auto_4983 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4981 ?auto_4980 ?auto_4982 )
      ( !LIFT ?auto_4983 ?auto_4978 ?auto_4984 ?auto_4982 )
      ( !LOAD ?auto_4983 ?auto_4978 ?auto_4981 ?auto_4982 )
      ( !DRIVE ?auto_4981 ?auto_4982 ?auto_4980 )
      ( !UNLOAD ?auto_4979 ?auto_4978 ?auto_4981 ?auto_4980 )
      ( !DROP ?auto_4979 ?auto_4978 ?auto_4977 ?auto_4980 )
      ( MAKE-1CRATE-VERIFY ?auto_4977 ?auto_4978 ) )
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
      ?auto_5002 - SURFACE
      ?auto_5001 - SURFACE
      ?auto_5000 - SURFACE
    )
    :vars
    (
      ?auto_5008 - HOIST
      ?auto_5007 - PLACE
      ?auto_5006 - PLACE
      ?auto_5004 - HOIST
      ?auto_5005 - SURFACE
      ?auto_5025 - PLACE
      ?auto_5010 - HOIST
      ?auto_5024 - SURFACE
      ?auto_5013 - PLACE
      ?auto_5017 - HOIST
      ?auto_5009 - SURFACE
      ?auto_5014 - PLACE
      ?auto_5023 - HOIST
      ?auto_5012 - SURFACE
      ?auto_5011 - PLACE
      ?auto_5020 - HOIST
      ?auto_5021 - SURFACE
      ?auto_5022 - SURFACE
      ?auto_5016 - SURFACE
      ?auto_5018 - PLACE
      ?auto_5019 - HOIST
      ?auto_5015 - SURFACE
      ?auto_5003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5008 ?auto_5007 ) ( IS-CRATE ?auto_5000 ) ( not ( = ?auto_5006 ?auto_5007 ) ) ( HOIST-AT ?auto_5004 ?auto_5006 ) ( AVAILABLE ?auto_5004 ) ( SURFACE-AT ?auto_5000 ?auto_5006 ) ( ON ?auto_5000 ?auto_5005 ) ( CLEAR ?auto_5000 ) ( not ( = ?auto_5001 ?auto_5000 ) ) ( not ( = ?auto_5001 ?auto_5005 ) ) ( not ( = ?auto_5000 ?auto_5005 ) ) ( not ( = ?auto_5008 ?auto_5004 ) ) ( IS-CRATE ?auto_5001 ) ( not ( = ?auto_5025 ?auto_5007 ) ) ( HOIST-AT ?auto_5010 ?auto_5025 ) ( SURFACE-AT ?auto_5001 ?auto_5025 ) ( ON ?auto_5001 ?auto_5024 ) ( CLEAR ?auto_5001 ) ( not ( = ?auto_5002 ?auto_5001 ) ) ( not ( = ?auto_5002 ?auto_5024 ) ) ( not ( = ?auto_5001 ?auto_5024 ) ) ( not ( = ?auto_5008 ?auto_5010 ) ) ( IS-CRATE ?auto_5002 ) ( not ( = ?auto_5013 ?auto_5007 ) ) ( HOIST-AT ?auto_5017 ?auto_5013 ) ( AVAILABLE ?auto_5017 ) ( SURFACE-AT ?auto_5002 ?auto_5013 ) ( ON ?auto_5002 ?auto_5009 ) ( CLEAR ?auto_5002 ) ( not ( = ?auto_4999 ?auto_5002 ) ) ( not ( = ?auto_4999 ?auto_5009 ) ) ( not ( = ?auto_5002 ?auto_5009 ) ) ( not ( = ?auto_5008 ?auto_5017 ) ) ( IS-CRATE ?auto_4999 ) ( not ( = ?auto_5014 ?auto_5007 ) ) ( HOIST-AT ?auto_5023 ?auto_5014 ) ( SURFACE-AT ?auto_4999 ?auto_5014 ) ( ON ?auto_4999 ?auto_5012 ) ( CLEAR ?auto_4999 ) ( not ( = ?auto_4998 ?auto_4999 ) ) ( not ( = ?auto_4998 ?auto_5012 ) ) ( not ( = ?auto_4999 ?auto_5012 ) ) ( not ( = ?auto_5008 ?auto_5023 ) ) ( IS-CRATE ?auto_4998 ) ( not ( = ?auto_5011 ?auto_5007 ) ) ( HOIST-AT ?auto_5020 ?auto_5011 ) ( AVAILABLE ?auto_5020 ) ( SURFACE-AT ?auto_4998 ?auto_5011 ) ( ON ?auto_4998 ?auto_5021 ) ( CLEAR ?auto_4998 ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( not ( = ?auto_4997 ?auto_5021 ) ) ( not ( = ?auto_4998 ?auto_5021 ) ) ( not ( = ?auto_5008 ?auto_5020 ) ) ( IS-CRATE ?auto_4997 ) ( AVAILABLE ?auto_5010 ) ( SURFACE-AT ?auto_4997 ?auto_5025 ) ( ON ?auto_4997 ?auto_5022 ) ( CLEAR ?auto_4997 ) ( not ( = ?auto_4996 ?auto_4997 ) ) ( not ( = ?auto_4996 ?auto_5022 ) ) ( not ( = ?auto_4997 ?auto_5022 ) ) ( IS-CRATE ?auto_4996 ) ( AVAILABLE ?auto_5023 ) ( SURFACE-AT ?auto_4996 ?auto_5014 ) ( ON ?auto_4996 ?auto_5016 ) ( CLEAR ?auto_4996 ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( not ( = ?auto_4995 ?auto_5016 ) ) ( not ( = ?auto_4996 ?auto_5016 ) ) ( SURFACE-AT ?auto_4994 ?auto_5007 ) ( CLEAR ?auto_4994 ) ( IS-CRATE ?auto_4995 ) ( AVAILABLE ?auto_5008 ) ( not ( = ?auto_5018 ?auto_5007 ) ) ( HOIST-AT ?auto_5019 ?auto_5018 ) ( AVAILABLE ?auto_5019 ) ( SURFACE-AT ?auto_4995 ?auto_5018 ) ( ON ?auto_4995 ?auto_5015 ) ( CLEAR ?auto_4995 ) ( TRUCK-AT ?auto_5003 ?auto_5007 ) ( not ( = ?auto_4994 ?auto_4995 ) ) ( not ( = ?auto_4994 ?auto_5015 ) ) ( not ( = ?auto_4995 ?auto_5015 ) ) ( not ( = ?auto_5008 ?auto_5019 ) ) ( not ( = ?auto_4994 ?auto_4996 ) ) ( not ( = ?auto_4994 ?auto_5016 ) ) ( not ( = ?auto_4996 ?auto_5015 ) ) ( not ( = ?auto_5014 ?auto_5018 ) ) ( not ( = ?auto_5023 ?auto_5019 ) ) ( not ( = ?auto_5016 ?auto_5015 ) ) ( not ( = ?auto_4994 ?auto_4997 ) ) ( not ( = ?auto_4994 ?auto_5022 ) ) ( not ( = ?auto_4995 ?auto_4997 ) ) ( not ( = ?auto_4995 ?auto_5022 ) ) ( not ( = ?auto_4997 ?auto_5016 ) ) ( not ( = ?auto_4997 ?auto_5015 ) ) ( not ( = ?auto_5025 ?auto_5014 ) ) ( not ( = ?auto_5025 ?auto_5018 ) ) ( not ( = ?auto_5010 ?auto_5023 ) ) ( not ( = ?auto_5010 ?auto_5019 ) ) ( not ( = ?auto_5022 ?auto_5016 ) ) ( not ( = ?auto_5022 ?auto_5015 ) ) ( not ( = ?auto_4994 ?auto_4998 ) ) ( not ( = ?auto_4994 ?auto_5021 ) ) ( not ( = ?auto_4995 ?auto_4998 ) ) ( not ( = ?auto_4995 ?auto_5021 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_5021 ) ) ( not ( = ?auto_4998 ?auto_5022 ) ) ( not ( = ?auto_4998 ?auto_5016 ) ) ( not ( = ?auto_4998 ?auto_5015 ) ) ( not ( = ?auto_5011 ?auto_5025 ) ) ( not ( = ?auto_5011 ?auto_5014 ) ) ( not ( = ?auto_5011 ?auto_5018 ) ) ( not ( = ?auto_5020 ?auto_5010 ) ) ( not ( = ?auto_5020 ?auto_5023 ) ) ( not ( = ?auto_5020 ?auto_5019 ) ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( not ( = ?auto_5021 ?auto_5016 ) ) ( not ( = ?auto_5021 ?auto_5015 ) ) ( not ( = ?auto_4994 ?auto_4999 ) ) ( not ( = ?auto_4994 ?auto_5012 ) ) ( not ( = ?auto_4995 ?auto_4999 ) ) ( not ( = ?auto_4995 ?auto_5012 ) ) ( not ( = ?auto_4996 ?auto_4999 ) ) ( not ( = ?auto_4996 ?auto_5012 ) ) ( not ( = ?auto_4997 ?auto_4999 ) ) ( not ( = ?auto_4997 ?auto_5012 ) ) ( not ( = ?auto_4999 ?auto_5021 ) ) ( not ( = ?auto_4999 ?auto_5022 ) ) ( not ( = ?auto_4999 ?auto_5016 ) ) ( not ( = ?auto_4999 ?auto_5015 ) ) ( not ( = ?auto_5012 ?auto_5021 ) ) ( not ( = ?auto_5012 ?auto_5022 ) ) ( not ( = ?auto_5012 ?auto_5016 ) ) ( not ( = ?auto_5012 ?auto_5015 ) ) ( not ( = ?auto_4994 ?auto_5002 ) ) ( not ( = ?auto_4994 ?auto_5009 ) ) ( not ( = ?auto_4995 ?auto_5002 ) ) ( not ( = ?auto_4995 ?auto_5009 ) ) ( not ( = ?auto_4996 ?auto_5002 ) ) ( not ( = ?auto_4996 ?auto_5009 ) ) ( not ( = ?auto_4997 ?auto_5002 ) ) ( not ( = ?auto_4997 ?auto_5009 ) ) ( not ( = ?auto_4998 ?auto_5002 ) ) ( not ( = ?auto_4998 ?auto_5009 ) ) ( not ( = ?auto_5002 ?auto_5012 ) ) ( not ( = ?auto_5002 ?auto_5021 ) ) ( not ( = ?auto_5002 ?auto_5022 ) ) ( not ( = ?auto_5002 ?auto_5016 ) ) ( not ( = ?auto_5002 ?auto_5015 ) ) ( not ( = ?auto_5013 ?auto_5014 ) ) ( not ( = ?auto_5013 ?auto_5011 ) ) ( not ( = ?auto_5013 ?auto_5025 ) ) ( not ( = ?auto_5013 ?auto_5018 ) ) ( not ( = ?auto_5017 ?auto_5023 ) ) ( not ( = ?auto_5017 ?auto_5020 ) ) ( not ( = ?auto_5017 ?auto_5010 ) ) ( not ( = ?auto_5017 ?auto_5019 ) ) ( not ( = ?auto_5009 ?auto_5012 ) ) ( not ( = ?auto_5009 ?auto_5021 ) ) ( not ( = ?auto_5009 ?auto_5022 ) ) ( not ( = ?auto_5009 ?auto_5016 ) ) ( not ( = ?auto_5009 ?auto_5015 ) ) ( not ( = ?auto_4994 ?auto_5001 ) ) ( not ( = ?auto_4994 ?auto_5024 ) ) ( not ( = ?auto_4995 ?auto_5001 ) ) ( not ( = ?auto_4995 ?auto_5024 ) ) ( not ( = ?auto_4996 ?auto_5001 ) ) ( not ( = ?auto_4996 ?auto_5024 ) ) ( not ( = ?auto_4997 ?auto_5001 ) ) ( not ( = ?auto_4997 ?auto_5024 ) ) ( not ( = ?auto_4998 ?auto_5001 ) ) ( not ( = ?auto_4998 ?auto_5024 ) ) ( not ( = ?auto_4999 ?auto_5001 ) ) ( not ( = ?auto_4999 ?auto_5024 ) ) ( not ( = ?auto_5001 ?auto_5009 ) ) ( not ( = ?auto_5001 ?auto_5012 ) ) ( not ( = ?auto_5001 ?auto_5021 ) ) ( not ( = ?auto_5001 ?auto_5022 ) ) ( not ( = ?auto_5001 ?auto_5016 ) ) ( not ( = ?auto_5001 ?auto_5015 ) ) ( not ( = ?auto_5024 ?auto_5009 ) ) ( not ( = ?auto_5024 ?auto_5012 ) ) ( not ( = ?auto_5024 ?auto_5021 ) ) ( not ( = ?auto_5024 ?auto_5022 ) ) ( not ( = ?auto_5024 ?auto_5016 ) ) ( not ( = ?auto_5024 ?auto_5015 ) ) ( not ( = ?auto_4994 ?auto_5000 ) ) ( not ( = ?auto_4994 ?auto_5005 ) ) ( not ( = ?auto_4995 ?auto_5000 ) ) ( not ( = ?auto_4995 ?auto_5005 ) ) ( not ( = ?auto_4996 ?auto_5000 ) ) ( not ( = ?auto_4996 ?auto_5005 ) ) ( not ( = ?auto_4997 ?auto_5000 ) ) ( not ( = ?auto_4997 ?auto_5005 ) ) ( not ( = ?auto_4998 ?auto_5000 ) ) ( not ( = ?auto_4998 ?auto_5005 ) ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_4999 ?auto_5005 ) ) ( not ( = ?auto_5002 ?auto_5000 ) ) ( not ( = ?auto_5002 ?auto_5005 ) ) ( not ( = ?auto_5000 ?auto_5024 ) ) ( not ( = ?auto_5000 ?auto_5009 ) ) ( not ( = ?auto_5000 ?auto_5012 ) ) ( not ( = ?auto_5000 ?auto_5021 ) ) ( not ( = ?auto_5000 ?auto_5022 ) ) ( not ( = ?auto_5000 ?auto_5016 ) ) ( not ( = ?auto_5000 ?auto_5015 ) ) ( not ( = ?auto_5006 ?auto_5025 ) ) ( not ( = ?auto_5006 ?auto_5013 ) ) ( not ( = ?auto_5006 ?auto_5014 ) ) ( not ( = ?auto_5006 ?auto_5011 ) ) ( not ( = ?auto_5006 ?auto_5018 ) ) ( not ( = ?auto_5004 ?auto_5010 ) ) ( not ( = ?auto_5004 ?auto_5017 ) ) ( not ( = ?auto_5004 ?auto_5023 ) ) ( not ( = ?auto_5004 ?auto_5020 ) ) ( not ( = ?auto_5004 ?auto_5019 ) ) ( not ( = ?auto_5005 ?auto_5024 ) ) ( not ( = ?auto_5005 ?auto_5009 ) ) ( not ( = ?auto_5005 ?auto_5012 ) ) ( not ( = ?auto_5005 ?auto_5021 ) ) ( not ( = ?auto_5005 ?auto_5022 ) ) ( not ( = ?auto_5005 ?auto_5016 ) ) ( not ( = ?auto_5005 ?auto_5015 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4994 ?auto_4995 ?auto_4996 ?auto_4997 ?auto_4998 ?auto_4999 ?auto_5002 ?auto_5001 )
      ( MAKE-1CRATE ?auto_5001 ?auto_5000 )
      ( MAKE-8CRATE-VERIFY ?auto_4994 ?auto_4995 ?auto_4996 ?auto_4997 ?auto_4998 ?auto_4999 ?auto_5002 ?auto_5001 ?auto_5000 ) )
  )

)

