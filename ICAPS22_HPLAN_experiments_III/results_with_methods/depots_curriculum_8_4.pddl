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
      ?auto_4726 - SURFACE
      ?auto_4727 - SURFACE
    )
    :vars
    (
      ?auto_4728 - HOIST
      ?auto_4729 - PLACE
      ?auto_4731 - PLACE
      ?auto_4732 - HOIST
      ?auto_4733 - SURFACE
      ?auto_4730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4728 ?auto_4729 ) ( SURFACE-AT ?auto_4726 ?auto_4729 ) ( CLEAR ?auto_4726 ) ( IS-CRATE ?auto_4727 ) ( AVAILABLE ?auto_4728 ) ( not ( = ?auto_4731 ?auto_4729 ) ) ( HOIST-AT ?auto_4732 ?auto_4731 ) ( AVAILABLE ?auto_4732 ) ( SURFACE-AT ?auto_4727 ?auto_4731 ) ( ON ?auto_4727 ?auto_4733 ) ( CLEAR ?auto_4727 ) ( TRUCK-AT ?auto_4730 ?auto_4729 ) ( not ( = ?auto_4726 ?auto_4727 ) ) ( not ( = ?auto_4726 ?auto_4733 ) ) ( not ( = ?auto_4727 ?auto_4733 ) ) ( not ( = ?auto_4728 ?auto_4732 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4730 ?auto_4729 ?auto_4731 )
      ( !LIFT ?auto_4732 ?auto_4727 ?auto_4733 ?auto_4731 )
      ( !LOAD ?auto_4732 ?auto_4727 ?auto_4730 ?auto_4731 )
      ( !DRIVE ?auto_4730 ?auto_4731 ?auto_4729 )
      ( !UNLOAD ?auto_4728 ?auto_4727 ?auto_4730 ?auto_4729 )
      ( !DROP ?auto_4728 ?auto_4727 ?auto_4726 ?auto_4729 )
      ( MAKE-1CRATE-VERIFY ?auto_4726 ?auto_4727 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4736 - SURFACE
      ?auto_4737 - SURFACE
    )
    :vars
    (
      ?auto_4738 - HOIST
      ?auto_4739 - PLACE
      ?auto_4741 - PLACE
      ?auto_4742 - HOIST
      ?auto_4743 - SURFACE
      ?auto_4740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4738 ?auto_4739 ) ( SURFACE-AT ?auto_4736 ?auto_4739 ) ( CLEAR ?auto_4736 ) ( IS-CRATE ?auto_4737 ) ( AVAILABLE ?auto_4738 ) ( not ( = ?auto_4741 ?auto_4739 ) ) ( HOIST-AT ?auto_4742 ?auto_4741 ) ( AVAILABLE ?auto_4742 ) ( SURFACE-AT ?auto_4737 ?auto_4741 ) ( ON ?auto_4737 ?auto_4743 ) ( CLEAR ?auto_4737 ) ( TRUCK-AT ?auto_4740 ?auto_4739 ) ( not ( = ?auto_4736 ?auto_4737 ) ) ( not ( = ?auto_4736 ?auto_4743 ) ) ( not ( = ?auto_4737 ?auto_4743 ) ) ( not ( = ?auto_4738 ?auto_4742 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4740 ?auto_4739 ?auto_4741 )
      ( !LIFT ?auto_4742 ?auto_4737 ?auto_4743 ?auto_4741 )
      ( !LOAD ?auto_4742 ?auto_4737 ?auto_4740 ?auto_4741 )
      ( !DRIVE ?auto_4740 ?auto_4741 ?auto_4739 )
      ( !UNLOAD ?auto_4738 ?auto_4737 ?auto_4740 ?auto_4739 )
      ( !DROP ?auto_4738 ?auto_4737 ?auto_4736 ?auto_4739 )
      ( MAKE-1CRATE-VERIFY ?auto_4736 ?auto_4737 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4747 - SURFACE
      ?auto_4748 - SURFACE
      ?auto_4749 - SURFACE
    )
    :vars
    (
      ?auto_4750 - HOIST
      ?auto_4751 - PLACE
      ?auto_4753 - PLACE
      ?auto_4755 - HOIST
      ?auto_4752 - SURFACE
      ?auto_4756 - SURFACE
      ?auto_4754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4750 ?auto_4751 ) ( IS-CRATE ?auto_4749 ) ( not ( = ?auto_4753 ?auto_4751 ) ) ( HOIST-AT ?auto_4755 ?auto_4753 ) ( SURFACE-AT ?auto_4749 ?auto_4753 ) ( ON ?auto_4749 ?auto_4752 ) ( CLEAR ?auto_4749 ) ( not ( = ?auto_4748 ?auto_4749 ) ) ( not ( = ?auto_4748 ?auto_4752 ) ) ( not ( = ?auto_4749 ?auto_4752 ) ) ( not ( = ?auto_4750 ?auto_4755 ) ) ( SURFACE-AT ?auto_4747 ?auto_4751 ) ( CLEAR ?auto_4747 ) ( IS-CRATE ?auto_4748 ) ( AVAILABLE ?auto_4750 ) ( AVAILABLE ?auto_4755 ) ( SURFACE-AT ?auto_4748 ?auto_4753 ) ( ON ?auto_4748 ?auto_4756 ) ( CLEAR ?auto_4748 ) ( TRUCK-AT ?auto_4754 ?auto_4751 ) ( not ( = ?auto_4747 ?auto_4748 ) ) ( not ( = ?auto_4747 ?auto_4756 ) ) ( not ( = ?auto_4748 ?auto_4756 ) ) ( not ( = ?auto_4747 ?auto_4749 ) ) ( not ( = ?auto_4747 ?auto_4752 ) ) ( not ( = ?auto_4749 ?auto_4756 ) ) ( not ( = ?auto_4752 ?auto_4756 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4747 ?auto_4748 )
      ( MAKE-1CRATE ?auto_4748 ?auto_4749 )
      ( MAKE-2CRATE-VERIFY ?auto_4747 ?auto_4748 ?auto_4749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4759 - SURFACE
      ?auto_4760 - SURFACE
    )
    :vars
    (
      ?auto_4761 - HOIST
      ?auto_4762 - PLACE
      ?auto_4764 - PLACE
      ?auto_4765 - HOIST
      ?auto_4766 - SURFACE
      ?auto_4763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4761 ?auto_4762 ) ( SURFACE-AT ?auto_4759 ?auto_4762 ) ( CLEAR ?auto_4759 ) ( IS-CRATE ?auto_4760 ) ( AVAILABLE ?auto_4761 ) ( not ( = ?auto_4764 ?auto_4762 ) ) ( HOIST-AT ?auto_4765 ?auto_4764 ) ( AVAILABLE ?auto_4765 ) ( SURFACE-AT ?auto_4760 ?auto_4764 ) ( ON ?auto_4760 ?auto_4766 ) ( CLEAR ?auto_4760 ) ( TRUCK-AT ?auto_4763 ?auto_4762 ) ( not ( = ?auto_4759 ?auto_4760 ) ) ( not ( = ?auto_4759 ?auto_4766 ) ) ( not ( = ?auto_4760 ?auto_4766 ) ) ( not ( = ?auto_4761 ?auto_4765 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4763 ?auto_4762 ?auto_4764 )
      ( !LIFT ?auto_4765 ?auto_4760 ?auto_4766 ?auto_4764 )
      ( !LOAD ?auto_4765 ?auto_4760 ?auto_4763 ?auto_4764 )
      ( !DRIVE ?auto_4763 ?auto_4764 ?auto_4762 )
      ( !UNLOAD ?auto_4761 ?auto_4760 ?auto_4763 ?auto_4762 )
      ( !DROP ?auto_4761 ?auto_4760 ?auto_4759 ?auto_4762 )
      ( MAKE-1CRATE-VERIFY ?auto_4759 ?auto_4760 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4771 - SURFACE
      ?auto_4772 - SURFACE
      ?auto_4773 - SURFACE
      ?auto_4774 - SURFACE
    )
    :vars
    (
      ?auto_4779 - HOIST
      ?auto_4775 - PLACE
      ?auto_4780 - PLACE
      ?auto_4778 - HOIST
      ?auto_4777 - SURFACE
      ?auto_4783 - PLACE
      ?auto_4781 - HOIST
      ?auto_4782 - SURFACE
      ?auto_4784 - SURFACE
      ?auto_4776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4779 ?auto_4775 ) ( IS-CRATE ?auto_4774 ) ( not ( = ?auto_4780 ?auto_4775 ) ) ( HOIST-AT ?auto_4778 ?auto_4780 ) ( AVAILABLE ?auto_4778 ) ( SURFACE-AT ?auto_4774 ?auto_4780 ) ( ON ?auto_4774 ?auto_4777 ) ( CLEAR ?auto_4774 ) ( not ( = ?auto_4773 ?auto_4774 ) ) ( not ( = ?auto_4773 ?auto_4777 ) ) ( not ( = ?auto_4774 ?auto_4777 ) ) ( not ( = ?auto_4779 ?auto_4778 ) ) ( IS-CRATE ?auto_4773 ) ( not ( = ?auto_4783 ?auto_4775 ) ) ( HOIST-AT ?auto_4781 ?auto_4783 ) ( SURFACE-AT ?auto_4773 ?auto_4783 ) ( ON ?auto_4773 ?auto_4782 ) ( CLEAR ?auto_4773 ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4782 ) ) ( not ( = ?auto_4773 ?auto_4782 ) ) ( not ( = ?auto_4779 ?auto_4781 ) ) ( SURFACE-AT ?auto_4771 ?auto_4775 ) ( CLEAR ?auto_4771 ) ( IS-CRATE ?auto_4772 ) ( AVAILABLE ?auto_4779 ) ( AVAILABLE ?auto_4781 ) ( SURFACE-AT ?auto_4772 ?auto_4783 ) ( ON ?auto_4772 ?auto_4784 ) ( CLEAR ?auto_4772 ) ( TRUCK-AT ?auto_4776 ?auto_4775 ) ( not ( = ?auto_4771 ?auto_4772 ) ) ( not ( = ?auto_4771 ?auto_4784 ) ) ( not ( = ?auto_4772 ?auto_4784 ) ) ( not ( = ?auto_4771 ?auto_4773 ) ) ( not ( = ?auto_4771 ?auto_4782 ) ) ( not ( = ?auto_4773 ?auto_4784 ) ) ( not ( = ?auto_4782 ?auto_4784 ) ) ( not ( = ?auto_4771 ?auto_4774 ) ) ( not ( = ?auto_4771 ?auto_4777 ) ) ( not ( = ?auto_4772 ?auto_4774 ) ) ( not ( = ?auto_4772 ?auto_4777 ) ) ( not ( = ?auto_4774 ?auto_4782 ) ) ( not ( = ?auto_4774 ?auto_4784 ) ) ( not ( = ?auto_4780 ?auto_4783 ) ) ( not ( = ?auto_4778 ?auto_4781 ) ) ( not ( = ?auto_4777 ?auto_4782 ) ) ( not ( = ?auto_4777 ?auto_4784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4771 ?auto_4772 ?auto_4773 )
      ( MAKE-1CRATE ?auto_4773 ?auto_4774 )
      ( MAKE-3CRATE-VERIFY ?auto_4771 ?auto_4772 ?auto_4773 ?auto_4774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4787 - SURFACE
      ?auto_4788 - SURFACE
    )
    :vars
    (
      ?auto_4789 - HOIST
      ?auto_4790 - PLACE
      ?auto_4792 - PLACE
      ?auto_4793 - HOIST
      ?auto_4794 - SURFACE
      ?auto_4791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4789 ?auto_4790 ) ( SURFACE-AT ?auto_4787 ?auto_4790 ) ( CLEAR ?auto_4787 ) ( IS-CRATE ?auto_4788 ) ( AVAILABLE ?auto_4789 ) ( not ( = ?auto_4792 ?auto_4790 ) ) ( HOIST-AT ?auto_4793 ?auto_4792 ) ( AVAILABLE ?auto_4793 ) ( SURFACE-AT ?auto_4788 ?auto_4792 ) ( ON ?auto_4788 ?auto_4794 ) ( CLEAR ?auto_4788 ) ( TRUCK-AT ?auto_4791 ?auto_4790 ) ( not ( = ?auto_4787 ?auto_4788 ) ) ( not ( = ?auto_4787 ?auto_4794 ) ) ( not ( = ?auto_4788 ?auto_4794 ) ) ( not ( = ?auto_4789 ?auto_4793 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4791 ?auto_4790 ?auto_4792 )
      ( !LIFT ?auto_4793 ?auto_4788 ?auto_4794 ?auto_4792 )
      ( !LOAD ?auto_4793 ?auto_4788 ?auto_4791 ?auto_4792 )
      ( !DRIVE ?auto_4791 ?auto_4792 ?auto_4790 )
      ( !UNLOAD ?auto_4789 ?auto_4788 ?auto_4791 ?auto_4790 )
      ( !DROP ?auto_4789 ?auto_4788 ?auto_4787 ?auto_4790 )
      ( MAKE-1CRATE-VERIFY ?auto_4787 ?auto_4788 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4800 - SURFACE
      ?auto_4801 - SURFACE
      ?auto_4802 - SURFACE
      ?auto_4803 - SURFACE
      ?auto_4804 - SURFACE
    )
    :vars
    (
      ?auto_4810 - HOIST
      ?auto_4808 - PLACE
      ?auto_4807 - PLACE
      ?auto_4806 - HOIST
      ?auto_4805 - SURFACE
      ?auto_4811 - PLACE
      ?auto_4812 - HOIST
      ?auto_4813 - SURFACE
      ?auto_4816 - PLACE
      ?auto_4814 - HOIST
      ?auto_4815 - SURFACE
      ?auto_4817 - SURFACE
      ?auto_4809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4810 ?auto_4808 ) ( IS-CRATE ?auto_4804 ) ( not ( = ?auto_4807 ?auto_4808 ) ) ( HOIST-AT ?auto_4806 ?auto_4807 ) ( AVAILABLE ?auto_4806 ) ( SURFACE-AT ?auto_4804 ?auto_4807 ) ( ON ?auto_4804 ?auto_4805 ) ( CLEAR ?auto_4804 ) ( not ( = ?auto_4803 ?auto_4804 ) ) ( not ( = ?auto_4803 ?auto_4805 ) ) ( not ( = ?auto_4804 ?auto_4805 ) ) ( not ( = ?auto_4810 ?auto_4806 ) ) ( IS-CRATE ?auto_4803 ) ( not ( = ?auto_4811 ?auto_4808 ) ) ( HOIST-AT ?auto_4812 ?auto_4811 ) ( AVAILABLE ?auto_4812 ) ( SURFACE-AT ?auto_4803 ?auto_4811 ) ( ON ?auto_4803 ?auto_4813 ) ( CLEAR ?auto_4803 ) ( not ( = ?auto_4802 ?auto_4803 ) ) ( not ( = ?auto_4802 ?auto_4813 ) ) ( not ( = ?auto_4803 ?auto_4813 ) ) ( not ( = ?auto_4810 ?auto_4812 ) ) ( IS-CRATE ?auto_4802 ) ( not ( = ?auto_4816 ?auto_4808 ) ) ( HOIST-AT ?auto_4814 ?auto_4816 ) ( SURFACE-AT ?auto_4802 ?auto_4816 ) ( ON ?auto_4802 ?auto_4815 ) ( CLEAR ?auto_4802 ) ( not ( = ?auto_4801 ?auto_4802 ) ) ( not ( = ?auto_4801 ?auto_4815 ) ) ( not ( = ?auto_4802 ?auto_4815 ) ) ( not ( = ?auto_4810 ?auto_4814 ) ) ( SURFACE-AT ?auto_4800 ?auto_4808 ) ( CLEAR ?auto_4800 ) ( IS-CRATE ?auto_4801 ) ( AVAILABLE ?auto_4810 ) ( AVAILABLE ?auto_4814 ) ( SURFACE-AT ?auto_4801 ?auto_4816 ) ( ON ?auto_4801 ?auto_4817 ) ( CLEAR ?auto_4801 ) ( TRUCK-AT ?auto_4809 ?auto_4808 ) ( not ( = ?auto_4800 ?auto_4801 ) ) ( not ( = ?auto_4800 ?auto_4817 ) ) ( not ( = ?auto_4801 ?auto_4817 ) ) ( not ( = ?auto_4800 ?auto_4802 ) ) ( not ( = ?auto_4800 ?auto_4815 ) ) ( not ( = ?auto_4802 ?auto_4817 ) ) ( not ( = ?auto_4815 ?auto_4817 ) ) ( not ( = ?auto_4800 ?auto_4803 ) ) ( not ( = ?auto_4800 ?auto_4813 ) ) ( not ( = ?auto_4801 ?auto_4803 ) ) ( not ( = ?auto_4801 ?auto_4813 ) ) ( not ( = ?auto_4803 ?auto_4815 ) ) ( not ( = ?auto_4803 ?auto_4817 ) ) ( not ( = ?auto_4811 ?auto_4816 ) ) ( not ( = ?auto_4812 ?auto_4814 ) ) ( not ( = ?auto_4813 ?auto_4815 ) ) ( not ( = ?auto_4813 ?auto_4817 ) ) ( not ( = ?auto_4800 ?auto_4804 ) ) ( not ( = ?auto_4800 ?auto_4805 ) ) ( not ( = ?auto_4801 ?auto_4804 ) ) ( not ( = ?auto_4801 ?auto_4805 ) ) ( not ( = ?auto_4802 ?auto_4804 ) ) ( not ( = ?auto_4802 ?auto_4805 ) ) ( not ( = ?auto_4804 ?auto_4813 ) ) ( not ( = ?auto_4804 ?auto_4815 ) ) ( not ( = ?auto_4804 ?auto_4817 ) ) ( not ( = ?auto_4807 ?auto_4811 ) ) ( not ( = ?auto_4807 ?auto_4816 ) ) ( not ( = ?auto_4806 ?auto_4812 ) ) ( not ( = ?auto_4806 ?auto_4814 ) ) ( not ( = ?auto_4805 ?auto_4813 ) ) ( not ( = ?auto_4805 ?auto_4815 ) ) ( not ( = ?auto_4805 ?auto_4817 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4800 ?auto_4801 ?auto_4802 ?auto_4803 )
      ( MAKE-1CRATE ?auto_4803 ?auto_4804 )
      ( MAKE-4CRATE-VERIFY ?auto_4800 ?auto_4801 ?auto_4802 ?auto_4803 ?auto_4804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4820 - SURFACE
      ?auto_4821 - SURFACE
    )
    :vars
    (
      ?auto_4822 - HOIST
      ?auto_4823 - PLACE
      ?auto_4825 - PLACE
      ?auto_4826 - HOIST
      ?auto_4827 - SURFACE
      ?auto_4824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4822 ?auto_4823 ) ( SURFACE-AT ?auto_4820 ?auto_4823 ) ( CLEAR ?auto_4820 ) ( IS-CRATE ?auto_4821 ) ( AVAILABLE ?auto_4822 ) ( not ( = ?auto_4825 ?auto_4823 ) ) ( HOIST-AT ?auto_4826 ?auto_4825 ) ( AVAILABLE ?auto_4826 ) ( SURFACE-AT ?auto_4821 ?auto_4825 ) ( ON ?auto_4821 ?auto_4827 ) ( CLEAR ?auto_4821 ) ( TRUCK-AT ?auto_4824 ?auto_4823 ) ( not ( = ?auto_4820 ?auto_4821 ) ) ( not ( = ?auto_4820 ?auto_4827 ) ) ( not ( = ?auto_4821 ?auto_4827 ) ) ( not ( = ?auto_4822 ?auto_4826 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4824 ?auto_4823 ?auto_4825 )
      ( !LIFT ?auto_4826 ?auto_4821 ?auto_4827 ?auto_4825 )
      ( !LOAD ?auto_4826 ?auto_4821 ?auto_4824 ?auto_4825 )
      ( !DRIVE ?auto_4824 ?auto_4825 ?auto_4823 )
      ( !UNLOAD ?auto_4822 ?auto_4821 ?auto_4824 ?auto_4823 )
      ( !DROP ?auto_4822 ?auto_4821 ?auto_4820 ?auto_4823 )
      ( MAKE-1CRATE-VERIFY ?auto_4820 ?auto_4821 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4834 - SURFACE
      ?auto_4835 - SURFACE
      ?auto_4836 - SURFACE
      ?auto_4837 - SURFACE
      ?auto_4838 - SURFACE
      ?auto_4839 - SURFACE
    )
    :vars
    (
      ?auto_4843 - HOIST
      ?auto_4844 - PLACE
      ?auto_4842 - PLACE
      ?auto_4841 - HOIST
      ?auto_4845 - SURFACE
      ?auto_4850 - PLACE
      ?auto_4853 - HOIST
      ?auto_4852 - SURFACE
      ?auto_4846 - PLACE
      ?auto_4854 - HOIST
      ?auto_4851 - SURFACE
      ?auto_4849 - PLACE
      ?auto_4855 - HOIST
      ?auto_4848 - SURFACE
      ?auto_4847 - SURFACE
      ?auto_4840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4843 ?auto_4844 ) ( IS-CRATE ?auto_4839 ) ( not ( = ?auto_4842 ?auto_4844 ) ) ( HOIST-AT ?auto_4841 ?auto_4842 ) ( AVAILABLE ?auto_4841 ) ( SURFACE-AT ?auto_4839 ?auto_4842 ) ( ON ?auto_4839 ?auto_4845 ) ( CLEAR ?auto_4839 ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( not ( = ?auto_4838 ?auto_4845 ) ) ( not ( = ?auto_4839 ?auto_4845 ) ) ( not ( = ?auto_4843 ?auto_4841 ) ) ( IS-CRATE ?auto_4838 ) ( not ( = ?auto_4850 ?auto_4844 ) ) ( HOIST-AT ?auto_4853 ?auto_4850 ) ( AVAILABLE ?auto_4853 ) ( SURFACE-AT ?auto_4838 ?auto_4850 ) ( ON ?auto_4838 ?auto_4852 ) ( CLEAR ?auto_4838 ) ( not ( = ?auto_4837 ?auto_4838 ) ) ( not ( = ?auto_4837 ?auto_4852 ) ) ( not ( = ?auto_4838 ?auto_4852 ) ) ( not ( = ?auto_4843 ?auto_4853 ) ) ( IS-CRATE ?auto_4837 ) ( not ( = ?auto_4846 ?auto_4844 ) ) ( HOIST-AT ?auto_4854 ?auto_4846 ) ( AVAILABLE ?auto_4854 ) ( SURFACE-AT ?auto_4837 ?auto_4846 ) ( ON ?auto_4837 ?auto_4851 ) ( CLEAR ?auto_4837 ) ( not ( = ?auto_4836 ?auto_4837 ) ) ( not ( = ?auto_4836 ?auto_4851 ) ) ( not ( = ?auto_4837 ?auto_4851 ) ) ( not ( = ?auto_4843 ?auto_4854 ) ) ( IS-CRATE ?auto_4836 ) ( not ( = ?auto_4849 ?auto_4844 ) ) ( HOIST-AT ?auto_4855 ?auto_4849 ) ( SURFACE-AT ?auto_4836 ?auto_4849 ) ( ON ?auto_4836 ?auto_4848 ) ( CLEAR ?auto_4836 ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( not ( = ?auto_4835 ?auto_4848 ) ) ( not ( = ?auto_4836 ?auto_4848 ) ) ( not ( = ?auto_4843 ?auto_4855 ) ) ( SURFACE-AT ?auto_4834 ?auto_4844 ) ( CLEAR ?auto_4834 ) ( IS-CRATE ?auto_4835 ) ( AVAILABLE ?auto_4843 ) ( AVAILABLE ?auto_4855 ) ( SURFACE-AT ?auto_4835 ?auto_4849 ) ( ON ?auto_4835 ?auto_4847 ) ( CLEAR ?auto_4835 ) ( TRUCK-AT ?auto_4840 ?auto_4844 ) ( not ( = ?auto_4834 ?auto_4835 ) ) ( not ( = ?auto_4834 ?auto_4847 ) ) ( not ( = ?auto_4835 ?auto_4847 ) ) ( not ( = ?auto_4834 ?auto_4836 ) ) ( not ( = ?auto_4834 ?auto_4848 ) ) ( not ( = ?auto_4836 ?auto_4847 ) ) ( not ( = ?auto_4848 ?auto_4847 ) ) ( not ( = ?auto_4834 ?auto_4837 ) ) ( not ( = ?auto_4834 ?auto_4851 ) ) ( not ( = ?auto_4835 ?auto_4837 ) ) ( not ( = ?auto_4835 ?auto_4851 ) ) ( not ( = ?auto_4837 ?auto_4848 ) ) ( not ( = ?auto_4837 ?auto_4847 ) ) ( not ( = ?auto_4846 ?auto_4849 ) ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4851 ?auto_4848 ) ) ( not ( = ?auto_4851 ?auto_4847 ) ) ( not ( = ?auto_4834 ?auto_4838 ) ) ( not ( = ?auto_4834 ?auto_4852 ) ) ( not ( = ?auto_4835 ?auto_4838 ) ) ( not ( = ?auto_4835 ?auto_4852 ) ) ( not ( = ?auto_4836 ?auto_4838 ) ) ( not ( = ?auto_4836 ?auto_4852 ) ) ( not ( = ?auto_4838 ?auto_4851 ) ) ( not ( = ?auto_4838 ?auto_4848 ) ) ( not ( = ?auto_4838 ?auto_4847 ) ) ( not ( = ?auto_4850 ?auto_4846 ) ) ( not ( = ?auto_4850 ?auto_4849 ) ) ( not ( = ?auto_4853 ?auto_4854 ) ) ( not ( = ?auto_4853 ?auto_4855 ) ) ( not ( = ?auto_4852 ?auto_4851 ) ) ( not ( = ?auto_4852 ?auto_4848 ) ) ( not ( = ?auto_4852 ?auto_4847 ) ) ( not ( = ?auto_4834 ?auto_4839 ) ) ( not ( = ?auto_4834 ?auto_4845 ) ) ( not ( = ?auto_4835 ?auto_4839 ) ) ( not ( = ?auto_4835 ?auto_4845 ) ) ( not ( = ?auto_4836 ?auto_4839 ) ) ( not ( = ?auto_4836 ?auto_4845 ) ) ( not ( = ?auto_4837 ?auto_4839 ) ) ( not ( = ?auto_4837 ?auto_4845 ) ) ( not ( = ?auto_4839 ?auto_4852 ) ) ( not ( = ?auto_4839 ?auto_4851 ) ) ( not ( = ?auto_4839 ?auto_4848 ) ) ( not ( = ?auto_4839 ?auto_4847 ) ) ( not ( = ?auto_4842 ?auto_4850 ) ) ( not ( = ?auto_4842 ?auto_4846 ) ) ( not ( = ?auto_4842 ?auto_4849 ) ) ( not ( = ?auto_4841 ?auto_4853 ) ) ( not ( = ?auto_4841 ?auto_4854 ) ) ( not ( = ?auto_4841 ?auto_4855 ) ) ( not ( = ?auto_4845 ?auto_4852 ) ) ( not ( = ?auto_4845 ?auto_4851 ) ) ( not ( = ?auto_4845 ?auto_4848 ) ) ( not ( = ?auto_4845 ?auto_4847 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4834 ?auto_4835 ?auto_4836 ?auto_4837 ?auto_4838 )
      ( MAKE-1CRATE ?auto_4838 ?auto_4839 )
      ( MAKE-5CRATE-VERIFY ?auto_4834 ?auto_4835 ?auto_4836 ?auto_4837 ?auto_4838 ?auto_4839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4858 - SURFACE
      ?auto_4859 - SURFACE
    )
    :vars
    (
      ?auto_4860 - HOIST
      ?auto_4861 - PLACE
      ?auto_4863 - PLACE
      ?auto_4864 - HOIST
      ?auto_4865 - SURFACE
      ?auto_4862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4860 ?auto_4861 ) ( SURFACE-AT ?auto_4858 ?auto_4861 ) ( CLEAR ?auto_4858 ) ( IS-CRATE ?auto_4859 ) ( AVAILABLE ?auto_4860 ) ( not ( = ?auto_4863 ?auto_4861 ) ) ( HOIST-AT ?auto_4864 ?auto_4863 ) ( AVAILABLE ?auto_4864 ) ( SURFACE-AT ?auto_4859 ?auto_4863 ) ( ON ?auto_4859 ?auto_4865 ) ( CLEAR ?auto_4859 ) ( TRUCK-AT ?auto_4862 ?auto_4861 ) ( not ( = ?auto_4858 ?auto_4859 ) ) ( not ( = ?auto_4858 ?auto_4865 ) ) ( not ( = ?auto_4859 ?auto_4865 ) ) ( not ( = ?auto_4860 ?auto_4864 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4862 ?auto_4861 ?auto_4863 )
      ( !LIFT ?auto_4864 ?auto_4859 ?auto_4865 ?auto_4863 )
      ( !LOAD ?auto_4864 ?auto_4859 ?auto_4862 ?auto_4863 )
      ( !DRIVE ?auto_4862 ?auto_4863 ?auto_4861 )
      ( !UNLOAD ?auto_4860 ?auto_4859 ?auto_4862 ?auto_4861 )
      ( !DROP ?auto_4860 ?auto_4859 ?auto_4858 ?auto_4861 )
      ( MAKE-1CRATE-VERIFY ?auto_4858 ?auto_4859 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4873 - SURFACE
      ?auto_4874 - SURFACE
      ?auto_4875 - SURFACE
      ?auto_4876 - SURFACE
      ?auto_4877 - SURFACE
      ?auto_4878 - SURFACE
      ?auto_4879 - SURFACE
    )
    :vars
    (
      ?auto_4881 - HOIST
      ?auto_4880 - PLACE
      ?auto_4884 - PLACE
      ?auto_4885 - HOIST
      ?auto_4883 - SURFACE
      ?auto_4894 - PLACE
      ?auto_4897 - HOIST
      ?auto_4893 - SURFACE
      ?auto_4895 - PLACE
      ?auto_4891 - HOIST
      ?auto_4889 - SURFACE
      ?auto_4892 - PLACE
      ?auto_4898 - HOIST
      ?auto_4890 - SURFACE
      ?auto_4886 - PLACE
      ?auto_4888 - HOIST
      ?auto_4896 - SURFACE
      ?auto_4887 - SURFACE
      ?auto_4882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4881 ?auto_4880 ) ( IS-CRATE ?auto_4879 ) ( not ( = ?auto_4884 ?auto_4880 ) ) ( HOIST-AT ?auto_4885 ?auto_4884 ) ( AVAILABLE ?auto_4885 ) ( SURFACE-AT ?auto_4879 ?auto_4884 ) ( ON ?auto_4879 ?auto_4883 ) ( CLEAR ?auto_4879 ) ( not ( = ?auto_4878 ?auto_4879 ) ) ( not ( = ?auto_4878 ?auto_4883 ) ) ( not ( = ?auto_4879 ?auto_4883 ) ) ( not ( = ?auto_4881 ?auto_4885 ) ) ( IS-CRATE ?auto_4878 ) ( not ( = ?auto_4894 ?auto_4880 ) ) ( HOIST-AT ?auto_4897 ?auto_4894 ) ( AVAILABLE ?auto_4897 ) ( SURFACE-AT ?auto_4878 ?auto_4894 ) ( ON ?auto_4878 ?auto_4893 ) ( CLEAR ?auto_4878 ) ( not ( = ?auto_4877 ?auto_4878 ) ) ( not ( = ?auto_4877 ?auto_4893 ) ) ( not ( = ?auto_4878 ?auto_4893 ) ) ( not ( = ?auto_4881 ?auto_4897 ) ) ( IS-CRATE ?auto_4877 ) ( not ( = ?auto_4895 ?auto_4880 ) ) ( HOIST-AT ?auto_4891 ?auto_4895 ) ( AVAILABLE ?auto_4891 ) ( SURFACE-AT ?auto_4877 ?auto_4895 ) ( ON ?auto_4877 ?auto_4889 ) ( CLEAR ?auto_4877 ) ( not ( = ?auto_4876 ?auto_4877 ) ) ( not ( = ?auto_4876 ?auto_4889 ) ) ( not ( = ?auto_4877 ?auto_4889 ) ) ( not ( = ?auto_4881 ?auto_4891 ) ) ( IS-CRATE ?auto_4876 ) ( not ( = ?auto_4892 ?auto_4880 ) ) ( HOIST-AT ?auto_4898 ?auto_4892 ) ( AVAILABLE ?auto_4898 ) ( SURFACE-AT ?auto_4876 ?auto_4892 ) ( ON ?auto_4876 ?auto_4890 ) ( CLEAR ?auto_4876 ) ( not ( = ?auto_4875 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4890 ) ) ( not ( = ?auto_4876 ?auto_4890 ) ) ( not ( = ?auto_4881 ?auto_4898 ) ) ( IS-CRATE ?auto_4875 ) ( not ( = ?auto_4886 ?auto_4880 ) ) ( HOIST-AT ?auto_4888 ?auto_4886 ) ( SURFACE-AT ?auto_4875 ?auto_4886 ) ( ON ?auto_4875 ?auto_4896 ) ( CLEAR ?auto_4875 ) ( not ( = ?auto_4874 ?auto_4875 ) ) ( not ( = ?auto_4874 ?auto_4896 ) ) ( not ( = ?auto_4875 ?auto_4896 ) ) ( not ( = ?auto_4881 ?auto_4888 ) ) ( SURFACE-AT ?auto_4873 ?auto_4880 ) ( CLEAR ?auto_4873 ) ( IS-CRATE ?auto_4874 ) ( AVAILABLE ?auto_4881 ) ( AVAILABLE ?auto_4888 ) ( SURFACE-AT ?auto_4874 ?auto_4886 ) ( ON ?auto_4874 ?auto_4887 ) ( CLEAR ?auto_4874 ) ( TRUCK-AT ?auto_4882 ?auto_4880 ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4887 ) ) ( not ( = ?auto_4874 ?auto_4887 ) ) ( not ( = ?auto_4873 ?auto_4875 ) ) ( not ( = ?auto_4873 ?auto_4896 ) ) ( not ( = ?auto_4875 ?auto_4887 ) ) ( not ( = ?auto_4896 ?auto_4887 ) ) ( not ( = ?auto_4873 ?auto_4876 ) ) ( not ( = ?auto_4873 ?auto_4890 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( not ( = ?auto_4874 ?auto_4890 ) ) ( not ( = ?auto_4876 ?auto_4896 ) ) ( not ( = ?auto_4876 ?auto_4887 ) ) ( not ( = ?auto_4892 ?auto_4886 ) ) ( not ( = ?auto_4898 ?auto_4888 ) ) ( not ( = ?auto_4890 ?auto_4896 ) ) ( not ( = ?auto_4890 ?auto_4887 ) ) ( not ( = ?auto_4873 ?auto_4877 ) ) ( not ( = ?auto_4873 ?auto_4889 ) ) ( not ( = ?auto_4874 ?auto_4877 ) ) ( not ( = ?auto_4874 ?auto_4889 ) ) ( not ( = ?auto_4875 ?auto_4877 ) ) ( not ( = ?auto_4875 ?auto_4889 ) ) ( not ( = ?auto_4877 ?auto_4890 ) ) ( not ( = ?auto_4877 ?auto_4896 ) ) ( not ( = ?auto_4877 ?auto_4887 ) ) ( not ( = ?auto_4895 ?auto_4892 ) ) ( not ( = ?auto_4895 ?auto_4886 ) ) ( not ( = ?auto_4891 ?auto_4898 ) ) ( not ( = ?auto_4891 ?auto_4888 ) ) ( not ( = ?auto_4889 ?auto_4890 ) ) ( not ( = ?auto_4889 ?auto_4896 ) ) ( not ( = ?auto_4889 ?auto_4887 ) ) ( not ( = ?auto_4873 ?auto_4878 ) ) ( not ( = ?auto_4873 ?auto_4893 ) ) ( not ( = ?auto_4874 ?auto_4878 ) ) ( not ( = ?auto_4874 ?auto_4893 ) ) ( not ( = ?auto_4875 ?auto_4878 ) ) ( not ( = ?auto_4875 ?auto_4893 ) ) ( not ( = ?auto_4876 ?auto_4878 ) ) ( not ( = ?auto_4876 ?auto_4893 ) ) ( not ( = ?auto_4878 ?auto_4889 ) ) ( not ( = ?auto_4878 ?auto_4890 ) ) ( not ( = ?auto_4878 ?auto_4896 ) ) ( not ( = ?auto_4878 ?auto_4887 ) ) ( not ( = ?auto_4894 ?auto_4895 ) ) ( not ( = ?auto_4894 ?auto_4892 ) ) ( not ( = ?auto_4894 ?auto_4886 ) ) ( not ( = ?auto_4897 ?auto_4891 ) ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( not ( = ?auto_4897 ?auto_4888 ) ) ( not ( = ?auto_4893 ?auto_4889 ) ) ( not ( = ?auto_4893 ?auto_4890 ) ) ( not ( = ?auto_4893 ?auto_4896 ) ) ( not ( = ?auto_4893 ?auto_4887 ) ) ( not ( = ?auto_4873 ?auto_4879 ) ) ( not ( = ?auto_4873 ?auto_4883 ) ) ( not ( = ?auto_4874 ?auto_4879 ) ) ( not ( = ?auto_4874 ?auto_4883 ) ) ( not ( = ?auto_4875 ?auto_4879 ) ) ( not ( = ?auto_4875 ?auto_4883 ) ) ( not ( = ?auto_4876 ?auto_4879 ) ) ( not ( = ?auto_4876 ?auto_4883 ) ) ( not ( = ?auto_4877 ?auto_4879 ) ) ( not ( = ?auto_4877 ?auto_4883 ) ) ( not ( = ?auto_4879 ?auto_4893 ) ) ( not ( = ?auto_4879 ?auto_4889 ) ) ( not ( = ?auto_4879 ?auto_4890 ) ) ( not ( = ?auto_4879 ?auto_4896 ) ) ( not ( = ?auto_4879 ?auto_4887 ) ) ( not ( = ?auto_4884 ?auto_4894 ) ) ( not ( = ?auto_4884 ?auto_4895 ) ) ( not ( = ?auto_4884 ?auto_4892 ) ) ( not ( = ?auto_4884 ?auto_4886 ) ) ( not ( = ?auto_4885 ?auto_4897 ) ) ( not ( = ?auto_4885 ?auto_4891 ) ) ( not ( = ?auto_4885 ?auto_4898 ) ) ( not ( = ?auto_4885 ?auto_4888 ) ) ( not ( = ?auto_4883 ?auto_4893 ) ) ( not ( = ?auto_4883 ?auto_4889 ) ) ( not ( = ?auto_4883 ?auto_4890 ) ) ( not ( = ?auto_4883 ?auto_4896 ) ) ( not ( = ?auto_4883 ?auto_4887 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4873 ?auto_4874 ?auto_4875 ?auto_4876 ?auto_4877 ?auto_4878 )
      ( MAKE-1CRATE ?auto_4878 ?auto_4879 )
      ( MAKE-6CRATE-VERIFY ?auto_4873 ?auto_4874 ?auto_4875 ?auto_4876 ?auto_4877 ?auto_4878 ?auto_4879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4901 - SURFACE
      ?auto_4902 - SURFACE
    )
    :vars
    (
      ?auto_4903 - HOIST
      ?auto_4904 - PLACE
      ?auto_4906 - PLACE
      ?auto_4907 - HOIST
      ?auto_4908 - SURFACE
      ?auto_4905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4903 ?auto_4904 ) ( SURFACE-AT ?auto_4901 ?auto_4904 ) ( CLEAR ?auto_4901 ) ( IS-CRATE ?auto_4902 ) ( AVAILABLE ?auto_4903 ) ( not ( = ?auto_4906 ?auto_4904 ) ) ( HOIST-AT ?auto_4907 ?auto_4906 ) ( AVAILABLE ?auto_4907 ) ( SURFACE-AT ?auto_4902 ?auto_4906 ) ( ON ?auto_4902 ?auto_4908 ) ( CLEAR ?auto_4902 ) ( TRUCK-AT ?auto_4905 ?auto_4904 ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( not ( = ?auto_4901 ?auto_4908 ) ) ( not ( = ?auto_4902 ?auto_4908 ) ) ( not ( = ?auto_4903 ?auto_4907 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4905 ?auto_4904 ?auto_4906 )
      ( !LIFT ?auto_4907 ?auto_4902 ?auto_4908 ?auto_4906 )
      ( !LOAD ?auto_4907 ?auto_4902 ?auto_4905 ?auto_4906 )
      ( !DRIVE ?auto_4905 ?auto_4906 ?auto_4904 )
      ( !UNLOAD ?auto_4903 ?auto_4902 ?auto_4905 ?auto_4904 )
      ( !DROP ?auto_4903 ?auto_4902 ?auto_4901 ?auto_4904 )
      ( MAKE-1CRATE-VERIFY ?auto_4901 ?auto_4902 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4917 - SURFACE
      ?auto_4918 - SURFACE
      ?auto_4919 - SURFACE
      ?auto_4920 - SURFACE
      ?auto_4921 - SURFACE
      ?auto_4922 - SURFACE
      ?auto_4923 - SURFACE
      ?auto_4924 - SURFACE
    )
    :vars
    (
      ?auto_4925 - HOIST
      ?auto_4927 - PLACE
      ?auto_4929 - PLACE
      ?auto_4930 - HOIST
      ?auto_4928 - SURFACE
      ?auto_4944 - PLACE
      ?auto_4943 - HOIST
      ?auto_4940 - SURFACE
      ?auto_4935 - PLACE
      ?auto_4932 - HOIST
      ?auto_4946 - SURFACE
      ?auto_4933 - PLACE
      ?auto_4937 - HOIST
      ?auto_4942 - SURFACE
      ?auto_4931 - PLACE
      ?auto_4936 - HOIST
      ?auto_4938 - SURFACE
      ?auto_4939 - PLACE
      ?auto_4945 - HOIST
      ?auto_4934 - SURFACE
      ?auto_4941 - SURFACE
      ?auto_4926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4925 ?auto_4927 ) ( IS-CRATE ?auto_4924 ) ( not ( = ?auto_4929 ?auto_4927 ) ) ( HOIST-AT ?auto_4930 ?auto_4929 ) ( AVAILABLE ?auto_4930 ) ( SURFACE-AT ?auto_4924 ?auto_4929 ) ( ON ?auto_4924 ?auto_4928 ) ( CLEAR ?auto_4924 ) ( not ( = ?auto_4923 ?auto_4924 ) ) ( not ( = ?auto_4923 ?auto_4928 ) ) ( not ( = ?auto_4924 ?auto_4928 ) ) ( not ( = ?auto_4925 ?auto_4930 ) ) ( IS-CRATE ?auto_4923 ) ( not ( = ?auto_4944 ?auto_4927 ) ) ( HOIST-AT ?auto_4943 ?auto_4944 ) ( AVAILABLE ?auto_4943 ) ( SURFACE-AT ?auto_4923 ?auto_4944 ) ( ON ?auto_4923 ?auto_4940 ) ( CLEAR ?auto_4923 ) ( not ( = ?auto_4922 ?auto_4923 ) ) ( not ( = ?auto_4922 ?auto_4940 ) ) ( not ( = ?auto_4923 ?auto_4940 ) ) ( not ( = ?auto_4925 ?auto_4943 ) ) ( IS-CRATE ?auto_4922 ) ( not ( = ?auto_4935 ?auto_4927 ) ) ( HOIST-AT ?auto_4932 ?auto_4935 ) ( AVAILABLE ?auto_4932 ) ( SURFACE-AT ?auto_4922 ?auto_4935 ) ( ON ?auto_4922 ?auto_4946 ) ( CLEAR ?auto_4922 ) ( not ( = ?auto_4921 ?auto_4922 ) ) ( not ( = ?auto_4921 ?auto_4946 ) ) ( not ( = ?auto_4922 ?auto_4946 ) ) ( not ( = ?auto_4925 ?auto_4932 ) ) ( IS-CRATE ?auto_4921 ) ( not ( = ?auto_4933 ?auto_4927 ) ) ( HOIST-AT ?auto_4937 ?auto_4933 ) ( AVAILABLE ?auto_4937 ) ( SURFACE-AT ?auto_4921 ?auto_4933 ) ( ON ?auto_4921 ?auto_4942 ) ( CLEAR ?auto_4921 ) ( not ( = ?auto_4920 ?auto_4921 ) ) ( not ( = ?auto_4920 ?auto_4942 ) ) ( not ( = ?auto_4921 ?auto_4942 ) ) ( not ( = ?auto_4925 ?auto_4937 ) ) ( IS-CRATE ?auto_4920 ) ( not ( = ?auto_4931 ?auto_4927 ) ) ( HOIST-AT ?auto_4936 ?auto_4931 ) ( AVAILABLE ?auto_4936 ) ( SURFACE-AT ?auto_4920 ?auto_4931 ) ( ON ?auto_4920 ?auto_4938 ) ( CLEAR ?auto_4920 ) ( not ( = ?auto_4919 ?auto_4920 ) ) ( not ( = ?auto_4919 ?auto_4938 ) ) ( not ( = ?auto_4920 ?auto_4938 ) ) ( not ( = ?auto_4925 ?auto_4936 ) ) ( IS-CRATE ?auto_4919 ) ( not ( = ?auto_4939 ?auto_4927 ) ) ( HOIST-AT ?auto_4945 ?auto_4939 ) ( SURFACE-AT ?auto_4919 ?auto_4939 ) ( ON ?auto_4919 ?auto_4934 ) ( CLEAR ?auto_4919 ) ( not ( = ?auto_4918 ?auto_4919 ) ) ( not ( = ?auto_4918 ?auto_4934 ) ) ( not ( = ?auto_4919 ?auto_4934 ) ) ( not ( = ?auto_4925 ?auto_4945 ) ) ( SURFACE-AT ?auto_4917 ?auto_4927 ) ( CLEAR ?auto_4917 ) ( IS-CRATE ?auto_4918 ) ( AVAILABLE ?auto_4925 ) ( AVAILABLE ?auto_4945 ) ( SURFACE-AT ?auto_4918 ?auto_4939 ) ( ON ?auto_4918 ?auto_4941 ) ( CLEAR ?auto_4918 ) ( TRUCK-AT ?auto_4926 ?auto_4927 ) ( not ( = ?auto_4917 ?auto_4918 ) ) ( not ( = ?auto_4917 ?auto_4941 ) ) ( not ( = ?auto_4918 ?auto_4941 ) ) ( not ( = ?auto_4917 ?auto_4919 ) ) ( not ( = ?auto_4917 ?auto_4934 ) ) ( not ( = ?auto_4919 ?auto_4941 ) ) ( not ( = ?auto_4934 ?auto_4941 ) ) ( not ( = ?auto_4917 ?auto_4920 ) ) ( not ( = ?auto_4917 ?auto_4938 ) ) ( not ( = ?auto_4918 ?auto_4920 ) ) ( not ( = ?auto_4918 ?auto_4938 ) ) ( not ( = ?auto_4920 ?auto_4934 ) ) ( not ( = ?auto_4920 ?auto_4941 ) ) ( not ( = ?auto_4931 ?auto_4939 ) ) ( not ( = ?auto_4936 ?auto_4945 ) ) ( not ( = ?auto_4938 ?auto_4934 ) ) ( not ( = ?auto_4938 ?auto_4941 ) ) ( not ( = ?auto_4917 ?auto_4921 ) ) ( not ( = ?auto_4917 ?auto_4942 ) ) ( not ( = ?auto_4918 ?auto_4921 ) ) ( not ( = ?auto_4918 ?auto_4942 ) ) ( not ( = ?auto_4919 ?auto_4921 ) ) ( not ( = ?auto_4919 ?auto_4942 ) ) ( not ( = ?auto_4921 ?auto_4938 ) ) ( not ( = ?auto_4921 ?auto_4934 ) ) ( not ( = ?auto_4921 ?auto_4941 ) ) ( not ( = ?auto_4933 ?auto_4931 ) ) ( not ( = ?auto_4933 ?auto_4939 ) ) ( not ( = ?auto_4937 ?auto_4936 ) ) ( not ( = ?auto_4937 ?auto_4945 ) ) ( not ( = ?auto_4942 ?auto_4938 ) ) ( not ( = ?auto_4942 ?auto_4934 ) ) ( not ( = ?auto_4942 ?auto_4941 ) ) ( not ( = ?auto_4917 ?auto_4922 ) ) ( not ( = ?auto_4917 ?auto_4946 ) ) ( not ( = ?auto_4918 ?auto_4922 ) ) ( not ( = ?auto_4918 ?auto_4946 ) ) ( not ( = ?auto_4919 ?auto_4922 ) ) ( not ( = ?auto_4919 ?auto_4946 ) ) ( not ( = ?auto_4920 ?auto_4922 ) ) ( not ( = ?auto_4920 ?auto_4946 ) ) ( not ( = ?auto_4922 ?auto_4942 ) ) ( not ( = ?auto_4922 ?auto_4938 ) ) ( not ( = ?auto_4922 ?auto_4934 ) ) ( not ( = ?auto_4922 ?auto_4941 ) ) ( not ( = ?auto_4935 ?auto_4933 ) ) ( not ( = ?auto_4935 ?auto_4931 ) ) ( not ( = ?auto_4935 ?auto_4939 ) ) ( not ( = ?auto_4932 ?auto_4937 ) ) ( not ( = ?auto_4932 ?auto_4936 ) ) ( not ( = ?auto_4932 ?auto_4945 ) ) ( not ( = ?auto_4946 ?auto_4942 ) ) ( not ( = ?auto_4946 ?auto_4938 ) ) ( not ( = ?auto_4946 ?auto_4934 ) ) ( not ( = ?auto_4946 ?auto_4941 ) ) ( not ( = ?auto_4917 ?auto_4923 ) ) ( not ( = ?auto_4917 ?auto_4940 ) ) ( not ( = ?auto_4918 ?auto_4923 ) ) ( not ( = ?auto_4918 ?auto_4940 ) ) ( not ( = ?auto_4919 ?auto_4923 ) ) ( not ( = ?auto_4919 ?auto_4940 ) ) ( not ( = ?auto_4920 ?auto_4923 ) ) ( not ( = ?auto_4920 ?auto_4940 ) ) ( not ( = ?auto_4921 ?auto_4923 ) ) ( not ( = ?auto_4921 ?auto_4940 ) ) ( not ( = ?auto_4923 ?auto_4946 ) ) ( not ( = ?auto_4923 ?auto_4942 ) ) ( not ( = ?auto_4923 ?auto_4938 ) ) ( not ( = ?auto_4923 ?auto_4934 ) ) ( not ( = ?auto_4923 ?auto_4941 ) ) ( not ( = ?auto_4944 ?auto_4935 ) ) ( not ( = ?auto_4944 ?auto_4933 ) ) ( not ( = ?auto_4944 ?auto_4931 ) ) ( not ( = ?auto_4944 ?auto_4939 ) ) ( not ( = ?auto_4943 ?auto_4932 ) ) ( not ( = ?auto_4943 ?auto_4937 ) ) ( not ( = ?auto_4943 ?auto_4936 ) ) ( not ( = ?auto_4943 ?auto_4945 ) ) ( not ( = ?auto_4940 ?auto_4946 ) ) ( not ( = ?auto_4940 ?auto_4942 ) ) ( not ( = ?auto_4940 ?auto_4938 ) ) ( not ( = ?auto_4940 ?auto_4934 ) ) ( not ( = ?auto_4940 ?auto_4941 ) ) ( not ( = ?auto_4917 ?auto_4924 ) ) ( not ( = ?auto_4917 ?auto_4928 ) ) ( not ( = ?auto_4918 ?auto_4924 ) ) ( not ( = ?auto_4918 ?auto_4928 ) ) ( not ( = ?auto_4919 ?auto_4924 ) ) ( not ( = ?auto_4919 ?auto_4928 ) ) ( not ( = ?auto_4920 ?auto_4924 ) ) ( not ( = ?auto_4920 ?auto_4928 ) ) ( not ( = ?auto_4921 ?auto_4924 ) ) ( not ( = ?auto_4921 ?auto_4928 ) ) ( not ( = ?auto_4922 ?auto_4924 ) ) ( not ( = ?auto_4922 ?auto_4928 ) ) ( not ( = ?auto_4924 ?auto_4940 ) ) ( not ( = ?auto_4924 ?auto_4946 ) ) ( not ( = ?auto_4924 ?auto_4942 ) ) ( not ( = ?auto_4924 ?auto_4938 ) ) ( not ( = ?auto_4924 ?auto_4934 ) ) ( not ( = ?auto_4924 ?auto_4941 ) ) ( not ( = ?auto_4929 ?auto_4944 ) ) ( not ( = ?auto_4929 ?auto_4935 ) ) ( not ( = ?auto_4929 ?auto_4933 ) ) ( not ( = ?auto_4929 ?auto_4931 ) ) ( not ( = ?auto_4929 ?auto_4939 ) ) ( not ( = ?auto_4930 ?auto_4943 ) ) ( not ( = ?auto_4930 ?auto_4932 ) ) ( not ( = ?auto_4930 ?auto_4937 ) ) ( not ( = ?auto_4930 ?auto_4936 ) ) ( not ( = ?auto_4930 ?auto_4945 ) ) ( not ( = ?auto_4928 ?auto_4940 ) ) ( not ( = ?auto_4928 ?auto_4946 ) ) ( not ( = ?auto_4928 ?auto_4942 ) ) ( not ( = ?auto_4928 ?auto_4938 ) ) ( not ( = ?auto_4928 ?auto_4934 ) ) ( not ( = ?auto_4928 ?auto_4941 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4917 ?auto_4918 ?auto_4919 ?auto_4920 ?auto_4921 ?auto_4922 ?auto_4923 )
      ( MAKE-1CRATE ?auto_4923 ?auto_4924 )
      ( MAKE-7CRATE-VERIFY ?auto_4917 ?auto_4918 ?auto_4919 ?auto_4920 ?auto_4921 ?auto_4922 ?auto_4923 ?auto_4924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4949 - SURFACE
      ?auto_4950 - SURFACE
    )
    :vars
    (
      ?auto_4951 - HOIST
      ?auto_4952 - PLACE
      ?auto_4954 - PLACE
      ?auto_4955 - HOIST
      ?auto_4956 - SURFACE
      ?auto_4953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4951 ?auto_4952 ) ( SURFACE-AT ?auto_4949 ?auto_4952 ) ( CLEAR ?auto_4949 ) ( IS-CRATE ?auto_4950 ) ( AVAILABLE ?auto_4951 ) ( not ( = ?auto_4954 ?auto_4952 ) ) ( HOIST-AT ?auto_4955 ?auto_4954 ) ( AVAILABLE ?auto_4955 ) ( SURFACE-AT ?auto_4950 ?auto_4954 ) ( ON ?auto_4950 ?auto_4956 ) ( CLEAR ?auto_4950 ) ( TRUCK-AT ?auto_4953 ?auto_4952 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4949 ?auto_4956 ) ) ( not ( = ?auto_4950 ?auto_4956 ) ) ( not ( = ?auto_4951 ?auto_4955 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4953 ?auto_4952 ?auto_4954 )
      ( !LIFT ?auto_4955 ?auto_4950 ?auto_4956 ?auto_4954 )
      ( !LOAD ?auto_4955 ?auto_4950 ?auto_4953 ?auto_4954 )
      ( !DRIVE ?auto_4953 ?auto_4954 ?auto_4952 )
      ( !UNLOAD ?auto_4951 ?auto_4950 ?auto_4953 ?auto_4952 )
      ( !DROP ?auto_4951 ?auto_4950 ?auto_4949 ?auto_4952 )
      ( MAKE-1CRATE-VERIFY ?auto_4949 ?auto_4950 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4966 - SURFACE
      ?auto_4967 - SURFACE
      ?auto_4968 - SURFACE
      ?auto_4969 - SURFACE
      ?auto_4970 - SURFACE
      ?auto_4971 - SURFACE
      ?auto_4972 - SURFACE
      ?auto_4974 - SURFACE
      ?auto_4973 - SURFACE
    )
    :vars
    (
      ?auto_4975 - HOIST
      ?auto_4978 - PLACE
      ?auto_4979 - PLACE
      ?auto_4980 - HOIST
      ?auto_4977 - SURFACE
      ?auto_4996 - PLACE
      ?auto_4995 - HOIST
      ?auto_4997 - SURFACE
      ?auto_4991 - PLACE
      ?auto_4990 - HOIST
      ?auto_4988 - SURFACE
      ?auto_4985 - SURFACE
      ?auto_4983 - PLACE
      ?auto_4993 - HOIST
      ?auto_4989 - SURFACE
      ?auto_4984 - PLACE
      ?auto_4994 - HOIST
      ?auto_4992 - SURFACE
      ?auto_4986 - PLACE
      ?auto_4981 - HOIST
      ?auto_4982 - SURFACE
      ?auto_4987 - SURFACE
      ?auto_4976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4975 ?auto_4978 ) ( IS-CRATE ?auto_4973 ) ( not ( = ?auto_4979 ?auto_4978 ) ) ( HOIST-AT ?auto_4980 ?auto_4979 ) ( SURFACE-AT ?auto_4973 ?auto_4979 ) ( ON ?auto_4973 ?auto_4977 ) ( CLEAR ?auto_4973 ) ( not ( = ?auto_4974 ?auto_4973 ) ) ( not ( = ?auto_4974 ?auto_4977 ) ) ( not ( = ?auto_4973 ?auto_4977 ) ) ( not ( = ?auto_4975 ?auto_4980 ) ) ( IS-CRATE ?auto_4974 ) ( not ( = ?auto_4996 ?auto_4978 ) ) ( HOIST-AT ?auto_4995 ?auto_4996 ) ( AVAILABLE ?auto_4995 ) ( SURFACE-AT ?auto_4974 ?auto_4996 ) ( ON ?auto_4974 ?auto_4997 ) ( CLEAR ?auto_4974 ) ( not ( = ?auto_4972 ?auto_4974 ) ) ( not ( = ?auto_4972 ?auto_4997 ) ) ( not ( = ?auto_4974 ?auto_4997 ) ) ( not ( = ?auto_4975 ?auto_4995 ) ) ( IS-CRATE ?auto_4972 ) ( not ( = ?auto_4991 ?auto_4978 ) ) ( HOIST-AT ?auto_4990 ?auto_4991 ) ( AVAILABLE ?auto_4990 ) ( SURFACE-AT ?auto_4972 ?auto_4991 ) ( ON ?auto_4972 ?auto_4988 ) ( CLEAR ?auto_4972 ) ( not ( = ?auto_4971 ?auto_4972 ) ) ( not ( = ?auto_4971 ?auto_4988 ) ) ( not ( = ?auto_4972 ?auto_4988 ) ) ( not ( = ?auto_4975 ?auto_4990 ) ) ( IS-CRATE ?auto_4971 ) ( AVAILABLE ?auto_4980 ) ( SURFACE-AT ?auto_4971 ?auto_4979 ) ( ON ?auto_4971 ?auto_4985 ) ( CLEAR ?auto_4971 ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( not ( = ?auto_4970 ?auto_4985 ) ) ( not ( = ?auto_4971 ?auto_4985 ) ) ( IS-CRATE ?auto_4970 ) ( not ( = ?auto_4983 ?auto_4978 ) ) ( HOIST-AT ?auto_4993 ?auto_4983 ) ( AVAILABLE ?auto_4993 ) ( SURFACE-AT ?auto_4970 ?auto_4983 ) ( ON ?auto_4970 ?auto_4989 ) ( CLEAR ?auto_4970 ) ( not ( = ?auto_4969 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4989 ) ) ( not ( = ?auto_4970 ?auto_4989 ) ) ( not ( = ?auto_4975 ?auto_4993 ) ) ( IS-CRATE ?auto_4969 ) ( not ( = ?auto_4984 ?auto_4978 ) ) ( HOIST-AT ?auto_4994 ?auto_4984 ) ( AVAILABLE ?auto_4994 ) ( SURFACE-AT ?auto_4969 ?auto_4984 ) ( ON ?auto_4969 ?auto_4992 ) ( CLEAR ?auto_4969 ) ( not ( = ?auto_4968 ?auto_4969 ) ) ( not ( = ?auto_4968 ?auto_4992 ) ) ( not ( = ?auto_4969 ?auto_4992 ) ) ( not ( = ?auto_4975 ?auto_4994 ) ) ( IS-CRATE ?auto_4968 ) ( not ( = ?auto_4986 ?auto_4978 ) ) ( HOIST-AT ?auto_4981 ?auto_4986 ) ( SURFACE-AT ?auto_4968 ?auto_4986 ) ( ON ?auto_4968 ?auto_4982 ) ( CLEAR ?auto_4968 ) ( not ( = ?auto_4967 ?auto_4968 ) ) ( not ( = ?auto_4967 ?auto_4982 ) ) ( not ( = ?auto_4968 ?auto_4982 ) ) ( not ( = ?auto_4975 ?auto_4981 ) ) ( SURFACE-AT ?auto_4966 ?auto_4978 ) ( CLEAR ?auto_4966 ) ( IS-CRATE ?auto_4967 ) ( AVAILABLE ?auto_4975 ) ( AVAILABLE ?auto_4981 ) ( SURFACE-AT ?auto_4967 ?auto_4986 ) ( ON ?auto_4967 ?auto_4987 ) ( CLEAR ?auto_4967 ) ( TRUCK-AT ?auto_4976 ?auto_4978 ) ( not ( = ?auto_4966 ?auto_4967 ) ) ( not ( = ?auto_4966 ?auto_4987 ) ) ( not ( = ?auto_4967 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4968 ) ) ( not ( = ?auto_4966 ?auto_4982 ) ) ( not ( = ?auto_4968 ?auto_4987 ) ) ( not ( = ?auto_4982 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4969 ) ) ( not ( = ?auto_4966 ?auto_4992 ) ) ( not ( = ?auto_4967 ?auto_4969 ) ) ( not ( = ?auto_4967 ?auto_4992 ) ) ( not ( = ?auto_4969 ?auto_4982 ) ) ( not ( = ?auto_4969 ?auto_4987 ) ) ( not ( = ?auto_4984 ?auto_4986 ) ) ( not ( = ?auto_4994 ?auto_4981 ) ) ( not ( = ?auto_4992 ?auto_4982 ) ) ( not ( = ?auto_4992 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4970 ) ) ( not ( = ?auto_4966 ?auto_4989 ) ) ( not ( = ?auto_4967 ?auto_4970 ) ) ( not ( = ?auto_4967 ?auto_4989 ) ) ( not ( = ?auto_4968 ?auto_4970 ) ) ( not ( = ?auto_4968 ?auto_4989 ) ) ( not ( = ?auto_4970 ?auto_4992 ) ) ( not ( = ?auto_4970 ?auto_4982 ) ) ( not ( = ?auto_4970 ?auto_4987 ) ) ( not ( = ?auto_4983 ?auto_4984 ) ) ( not ( = ?auto_4983 ?auto_4986 ) ) ( not ( = ?auto_4993 ?auto_4994 ) ) ( not ( = ?auto_4993 ?auto_4981 ) ) ( not ( = ?auto_4989 ?auto_4992 ) ) ( not ( = ?auto_4989 ?auto_4982 ) ) ( not ( = ?auto_4989 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4971 ) ) ( not ( = ?auto_4966 ?auto_4985 ) ) ( not ( = ?auto_4967 ?auto_4971 ) ) ( not ( = ?auto_4967 ?auto_4985 ) ) ( not ( = ?auto_4968 ?auto_4971 ) ) ( not ( = ?auto_4968 ?auto_4985 ) ) ( not ( = ?auto_4969 ?auto_4971 ) ) ( not ( = ?auto_4969 ?auto_4985 ) ) ( not ( = ?auto_4971 ?auto_4989 ) ) ( not ( = ?auto_4971 ?auto_4992 ) ) ( not ( = ?auto_4971 ?auto_4982 ) ) ( not ( = ?auto_4971 ?auto_4987 ) ) ( not ( = ?auto_4979 ?auto_4983 ) ) ( not ( = ?auto_4979 ?auto_4984 ) ) ( not ( = ?auto_4979 ?auto_4986 ) ) ( not ( = ?auto_4980 ?auto_4993 ) ) ( not ( = ?auto_4980 ?auto_4994 ) ) ( not ( = ?auto_4980 ?auto_4981 ) ) ( not ( = ?auto_4985 ?auto_4989 ) ) ( not ( = ?auto_4985 ?auto_4992 ) ) ( not ( = ?auto_4985 ?auto_4982 ) ) ( not ( = ?auto_4985 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4972 ) ) ( not ( = ?auto_4966 ?auto_4988 ) ) ( not ( = ?auto_4967 ?auto_4972 ) ) ( not ( = ?auto_4967 ?auto_4988 ) ) ( not ( = ?auto_4968 ?auto_4972 ) ) ( not ( = ?auto_4968 ?auto_4988 ) ) ( not ( = ?auto_4969 ?auto_4972 ) ) ( not ( = ?auto_4969 ?auto_4988 ) ) ( not ( = ?auto_4970 ?auto_4972 ) ) ( not ( = ?auto_4970 ?auto_4988 ) ) ( not ( = ?auto_4972 ?auto_4985 ) ) ( not ( = ?auto_4972 ?auto_4989 ) ) ( not ( = ?auto_4972 ?auto_4992 ) ) ( not ( = ?auto_4972 ?auto_4982 ) ) ( not ( = ?auto_4972 ?auto_4987 ) ) ( not ( = ?auto_4991 ?auto_4979 ) ) ( not ( = ?auto_4991 ?auto_4983 ) ) ( not ( = ?auto_4991 ?auto_4984 ) ) ( not ( = ?auto_4991 ?auto_4986 ) ) ( not ( = ?auto_4990 ?auto_4980 ) ) ( not ( = ?auto_4990 ?auto_4993 ) ) ( not ( = ?auto_4990 ?auto_4994 ) ) ( not ( = ?auto_4990 ?auto_4981 ) ) ( not ( = ?auto_4988 ?auto_4985 ) ) ( not ( = ?auto_4988 ?auto_4989 ) ) ( not ( = ?auto_4988 ?auto_4992 ) ) ( not ( = ?auto_4988 ?auto_4982 ) ) ( not ( = ?auto_4988 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4974 ) ) ( not ( = ?auto_4966 ?auto_4997 ) ) ( not ( = ?auto_4967 ?auto_4974 ) ) ( not ( = ?auto_4967 ?auto_4997 ) ) ( not ( = ?auto_4968 ?auto_4974 ) ) ( not ( = ?auto_4968 ?auto_4997 ) ) ( not ( = ?auto_4969 ?auto_4974 ) ) ( not ( = ?auto_4969 ?auto_4997 ) ) ( not ( = ?auto_4970 ?auto_4974 ) ) ( not ( = ?auto_4970 ?auto_4997 ) ) ( not ( = ?auto_4971 ?auto_4974 ) ) ( not ( = ?auto_4971 ?auto_4997 ) ) ( not ( = ?auto_4974 ?auto_4988 ) ) ( not ( = ?auto_4974 ?auto_4985 ) ) ( not ( = ?auto_4974 ?auto_4989 ) ) ( not ( = ?auto_4974 ?auto_4992 ) ) ( not ( = ?auto_4974 ?auto_4982 ) ) ( not ( = ?auto_4974 ?auto_4987 ) ) ( not ( = ?auto_4996 ?auto_4991 ) ) ( not ( = ?auto_4996 ?auto_4979 ) ) ( not ( = ?auto_4996 ?auto_4983 ) ) ( not ( = ?auto_4996 ?auto_4984 ) ) ( not ( = ?auto_4996 ?auto_4986 ) ) ( not ( = ?auto_4995 ?auto_4990 ) ) ( not ( = ?auto_4995 ?auto_4980 ) ) ( not ( = ?auto_4995 ?auto_4993 ) ) ( not ( = ?auto_4995 ?auto_4994 ) ) ( not ( = ?auto_4995 ?auto_4981 ) ) ( not ( = ?auto_4997 ?auto_4988 ) ) ( not ( = ?auto_4997 ?auto_4985 ) ) ( not ( = ?auto_4997 ?auto_4989 ) ) ( not ( = ?auto_4997 ?auto_4992 ) ) ( not ( = ?auto_4997 ?auto_4982 ) ) ( not ( = ?auto_4997 ?auto_4987 ) ) ( not ( = ?auto_4966 ?auto_4973 ) ) ( not ( = ?auto_4966 ?auto_4977 ) ) ( not ( = ?auto_4967 ?auto_4973 ) ) ( not ( = ?auto_4967 ?auto_4977 ) ) ( not ( = ?auto_4968 ?auto_4973 ) ) ( not ( = ?auto_4968 ?auto_4977 ) ) ( not ( = ?auto_4969 ?auto_4973 ) ) ( not ( = ?auto_4969 ?auto_4977 ) ) ( not ( = ?auto_4970 ?auto_4973 ) ) ( not ( = ?auto_4970 ?auto_4977 ) ) ( not ( = ?auto_4971 ?auto_4973 ) ) ( not ( = ?auto_4971 ?auto_4977 ) ) ( not ( = ?auto_4972 ?auto_4973 ) ) ( not ( = ?auto_4972 ?auto_4977 ) ) ( not ( = ?auto_4973 ?auto_4997 ) ) ( not ( = ?auto_4973 ?auto_4988 ) ) ( not ( = ?auto_4973 ?auto_4985 ) ) ( not ( = ?auto_4973 ?auto_4989 ) ) ( not ( = ?auto_4973 ?auto_4992 ) ) ( not ( = ?auto_4973 ?auto_4982 ) ) ( not ( = ?auto_4973 ?auto_4987 ) ) ( not ( = ?auto_4977 ?auto_4997 ) ) ( not ( = ?auto_4977 ?auto_4988 ) ) ( not ( = ?auto_4977 ?auto_4985 ) ) ( not ( = ?auto_4977 ?auto_4989 ) ) ( not ( = ?auto_4977 ?auto_4992 ) ) ( not ( = ?auto_4977 ?auto_4982 ) ) ( not ( = ?auto_4977 ?auto_4987 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4966 ?auto_4967 ?auto_4968 ?auto_4969 ?auto_4970 ?auto_4971 ?auto_4972 ?auto_4974 )
      ( MAKE-1CRATE ?auto_4974 ?auto_4973 )
      ( MAKE-8CRATE-VERIFY ?auto_4966 ?auto_4967 ?auto_4968 ?auto_4969 ?auto_4970 ?auto_4971 ?auto_4972 ?auto_4974 ?auto_4973 ) )
  )

)

