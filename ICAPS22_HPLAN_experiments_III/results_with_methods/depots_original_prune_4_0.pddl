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
      ?auto_4639 - SURFACE
      ?auto_4640 - SURFACE
    )
    :vars
    (
      ?auto_4641 - HOIST
      ?auto_4642 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4641 ?auto_4642 ) ( SURFACE-AT ?auto_4639 ?auto_4642 ) ( CLEAR ?auto_4639 ) ( LIFTING ?auto_4641 ?auto_4640 ) ( IS-CRATE ?auto_4640 ) ( not ( = ?auto_4639 ?auto_4640 ) ) )
    :subtasks
    ( ( !DROP ?auto_4641 ?auto_4640 ?auto_4639 ?auto_4642 )
      ( MAKE-1CRATE-VERIFY ?auto_4639 ?auto_4640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4643 - SURFACE
      ?auto_4644 - SURFACE
    )
    :vars
    (
      ?auto_4645 - HOIST
      ?auto_4646 - PLACE
      ?auto_4647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4645 ?auto_4646 ) ( SURFACE-AT ?auto_4643 ?auto_4646 ) ( CLEAR ?auto_4643 ) ( IS-CRATE ?auto_4644 ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( TRUCK-AT ?auto_4647 ?auto_4646 ) ( AVAILABLE ?auto_4645 ) ( IN ?auto_4644 ?auto_4647 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4645 ?auto_4644 ?auto_4647 ?auto_4646 )
      ( MAKE-1CRATE ?auto_4643 ?auto_4644 )
      ( MAKE-1CRATE-VERIFY ?auto_4643 ?auto_4644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4648 - SURFACE
      ?auto_4649 - SURFACE
    )
    :vars
    (
      ?auto_4650 - HOIST
      ?auto_4652 - PLACE
      ?auto_4651 - TRUCK
      ?auto_4653 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4650 ?auto_4652 ) ( SURFACE-AT ?auto_4648 ?auto_4652 ) ( CLEAR ?auto_4648 ) ( IS-CRATE ?auto_4649 ) ( not ( = ?auto_4648 ?auto_4649 ) ) ( AVAILABLE ?auto_4650 ) ( IN ?auto_4649 ?auto_4651 ) ( TRUCK-AT ?auto_4651 ?auto_4653 ) ( not ( = ?auto_4653 ?auto_4652 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4651 ?auto_4653 ?auto_4652 )
      ( MAKE-1CRATE ?auto_4648 ?auto_4649 )
      ( MAKE-1CRATE-VERIFY ?auto_4648 ?auto_4649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4654 - SURFACE
      ?auto_4655 - SURFACE
    )
    :vars
    (
      ?auto_4656 - HOIST
      ?auto_4657 - PLACE
      ?auto_4658 - TRUCK
      ?auto_4659 - PLACE
      ?auto_4660 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4656 ?auto_4657 ) ( SURFACE-AT ?auto_4654 ?auto_4657 ) ( CLEAR ?auto_4654 ) ( IS-CRATE ?auto_4655 ) ( not ( = ?auto_4654 ?auto_4655 ) ) ( AVAILABLE ?auto_4656 ) ( TRUCK-AT ?auto_4658 ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4657 ) ) ( HOIST-AT ?auto_4660 ?auto_4659 ) ( LIFTING ?auto_4660 ?auto_4655 ) ( not ( = ?auto_4656 ?auto_4660 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4660 ?auto_4655 ?auto_4658 ?auto_4659 )
      ( MAKE-1CRATE ?auto_4654 ?auto_4655 )
      ( MAKE-1CRATE-VERIFY ?auto_4654 ?auto_4655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4661 - SURFACE
      ?auto_4662 - SURFACE
    )
    :vars
    (
      ?auto_4667 - HOIST
      ?auto_4664 - PLACE
      ?auto_4665 - TRUCK
      ?auto_4663 - PLACE
      ?auto_4666 - HOIST
      ?auto_4668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4667 ?auto_4664 ) ( SURFACE-AT ?auto_4661 ?auto_4664 ) ( CLEAR ?auto_4661 ) ( IS-CRATE ?auto_4662 ) ( not ( = ?auto_4661 ?auto_4662 ) ) ( AVAILABLE ?auto_4667 ) ( TRUCK-AT ?auto_4665 ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4664 ) ) ( HOIST-AT ?auto_4666 ?auto_4663 ) ( not ( = ?auto_4667 ?auto_4666 ) ) ( AVAILABLE ?auto_4666 ) ( SURFACE-AT ?auto_4662 ?auto_4663 ) ( ON ?auto_4662 ?auto_4668 ) ( CLEAR ?auto_4662 ) ( not ( = ?auto_4661 ?auto_4668 ) ) ( not ( = ?auto_4662 ?auto_4668 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4666 ?auto_4662 ?auto_4668 ?auto_4663 )
      ( MAKE-1CRATE ?auto_4661 ?auto_4662 )
      ( MAKE-1CRATE-VERIFY ?auto_4661 ?auto_4662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4669 - SURFACE
      ?auto_4670 - SURFACE
    )
    :vars
    (
      ?auto_4673 - HOIST
      ?auto_4674 - PLACE
      ?auto_4676 - PLACE
      ?auto_4675 - HOIST
      ?auto_4672 - SURFACE
      ?auto_4671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4673 ?auto_4674 ) ( SURFACE-AT ?auto_4669 ?auto_4674 ) ( CLEAR ?auto_4669 ) ( IS-CRATE ?auto_4670 ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( AVAILABLE ?auto_4673 ) ( not ( = ?auto_4676 ?auto_4674 ) ) ( HOIST-AT ?auto_4675 ?auto_4676 ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( AVAILABLE ?auto_4675 ) ( SURFACE-AT ?auto_4670 ?auto_4676 ) ( ON ?auto_4670 ?auto_4672 ) ( CLEAR ?auto_4670 ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( not ( = ?auto_4670 ?auto_4672 ) ) ( TRUCK-AT ?auto_4671 ?auto_4674 ) )
    :subtasks
    ( ( !DRIVE ?auto_4671 ?auto_4674 ?auto_4676 )
      ( MAKE-1CRATE ?auto_4669 ?auto_4670 )
      ( MAKE-1CRATE-VERIFY ?auto_4669 ?auto_4670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4686 - SURFACE
      ?auto_4687 - SURFACE
      ?auto_4688 - SURFACE
    )
    :vars
    (
      ?auto_4690 - HOIST
      ?auto_4689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4690 ?auto_4689 ) ( SURFACE-AT ?auto_4687 ?auto_4689 ) ( CLEAR ?auto_4687 ) ( LIFTING ?auto_4690 ?auto_4688 ) ( IS-CRATE ?auto_4688 ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( ON ?auto_4687 ?auto_4686 ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( not ( = ?auto_4686 ?auto_4688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4687 ?auto_4688 )
      ( MAKE-2CRATE-VERIFY ?auto_4686 ?auto_4687 ?auto_4688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4696 - SURFACE
      ?auto_4697 - SURFACE
      ?auto_4698 - SURFACE
    )
    :vars
    (
      ?auto_4701 - HOIST
      ?auto_4699 - PLACE
      ?auto_4700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4701 ?auto_4699 ) ( SURFACE-AT ?auto_4697 ?auto_4699 ) ( CLEAR ?auto_4697 ) ( IS-CRATE ?auto_4698 ) ( not ( = ?auto_4697 ?auto_4698 ) ) ( TRUCK-AT ?auto_4700 ?auto_4699 ) ( AVAILABLE ?auto_4701 ) ( IN ?auto_4698 ?auto_4700 ) ( ON ?auto_4697 ?auto_4696 ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4698 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4697 ?auto_4698 )
      ( MAKE-2CRATE-VERIFY ?auto_4696 ?auto_4697 ?auto_4698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4702 - SURFACE
      ?auto_4703 - SURFACE
    )
    :vars
    (
      ?auto_4705 - HOIST
      ?auto_4704 - PLACE
      ?auto_4707 - TRUCK
      ?auto_4706 - SURFACE
      ?auto_4708 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4705 ?auto_4704 ) ( SURFACE-AT ?auto_4702 ?auto_4704 ) ( CLEAR ?auto_4702 ) ( IS-CRATE ?auto_4703 ) ( not ( = ?auto_4702 ?auto_4703 ) ) ( AVAILABLE ?auto_4705 ) ( IN ?auto_4703 ?auto_4707 ) ( ON ?auto_4702 ?auto_4706 ) ( not ( = ?auto_4706 ?auto_4702 ) ) ( not ( = ?auto_4706 ?auto_4703 ) ) ( TRUCK-AT ?auto_4707 ?auto_4708 ) ( not ( = ?auto_4708 ?auto_4704 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4707 ?auto_4708 ?auto_4704 )
      ( MAKE-2CRATE ?auto_4706 ?auto_4702 ?auto_4703 )
      ( MAKE-1CRATE-VERIFY ?auto_4702 ?auto_4703 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4709 - SURFACE
      ?auto_4710 - SURFACE
      ?auto_4711 - SURFACE
    )
    :vars
    (
      ?auto_4715 - HOIST
      ?auto_4712 - PLACE
      ?auto_4714 - TRUCK
      ?auto_4713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4715 ?auto_4712 ) ( SURFACE-AT ?auto_4710 ?auto_4712 ) ( CLEAR ?auto_4710 ) ( IS-CRATE ?auto_4711 ) ( not ( = ?auto_4710 ?auto_4711 ) ) ( AVAILABLE ?auto_4715 ) ( IN ?auto_4711 ?auto_4714 ) ( ON ?auto_4710 ?auto_4709 ) ( not ( = ?auto_4709 ?auto_4710 ) ) ( not ( = ?auto_4709 ?auto_4711 ) ) ( TRUCK-AT ?auto_4714 ?auto_4713 ) ( not ( = ?auto_4713 ?auto_4712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4710 ?auto_4711 )
      ( MAKE-2CRATE-VERIFY ?auto_4709 ?auto_4710 ?auto_4711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4716 - SURFACE
      ?auto_4717 - SURFACE
    )
    :vars
    (
      ?auto_4718 - HOIST
      ?auto_4719 - PLACE
      ?auto_4721 - SURFACE
      ?auto_4720 - TRUCK
      ?auto_4722 - PLACE
      ?auto_4723 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4718 ?auto_4719 ) ( SURFACE-AT ?auto_4716 ?auto_4719 ) ( CLEAR ?auto_4716 ) ( IS-CRATE ?auto_4717 ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( AVAILABLE ?auto_4718 ) ( ON ?auto_4716 ?auto_4721 ) ( not ( = ?auto_4721 ?auto_4716 ) ) ( not ( = ?auto_4721 ?auto_4717 ) ) ( TRUCK-AT ?auto_4720 ?auto_4722 ) ( not ( = ?auto_4722 ?auto_4719 ) ) ( HOIST-AT ?auto_4723 ?auto_4722 ) ( LIFTING ?auto_4723 ?auto_4717 ) ( not ( = ?auto_4718 ?auto_4723 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4723 ?auto_4717 ?auto_4720 ?auto_4722 )
      ( MAKE-2CRATE ?auto_4721 ?auto_4716 ?auto_4717 )
      ( MAKE-1CRATE-VERIFY ?auto_4716 ?auto_4717 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4724 - SURFACE
      ?auto_4725 - SURFACE
      ?auto_4726 - SURFACE
    )
    :vars
    (
      ?auto_4727 - HOIST
      ?auto_4730 - PLACE
      ?auto_4729 - TRUCK
      ?auto_4728 - PLACE
      ?auto_4731 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4727 ?auto_4730 ) ( SURFACE-AT ?auto_4725 ?auto_4730 ) ( CLEAR ?auto_4725 ) ( IS-CRATE ?auto_4726 ) ( not ( = ?auto_4725 ?auto_4726 ) ) ( AVAILABLE ?auto_4727 ) ( ON ?auto_4725 ?auto_4724 ) ( not ( = ?auto_4724 ?auto_4725 ) ) ( not ( = ?auto_4724 ?auto_4726 ) ) ( TRUCK-AT ?auto_4729 ?auto_4728 ) ( not ( = ?auto_4728 ?auto_4730 ) ) ( HOIST-AT ?auto_4731 ?auto_4728 ) ( LIFTING ?auto_4731 ?auto_4726 ) ( not ( = ?auto_4727 ?auto_4731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4725 ?auto_4726 )
      ( MAKE-2CRATE-VERIFY ?auto_4724 ?auto_4725 ?auto_4726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4732 - SURFACE
      ?auto_4733 - SURFACE
    )
    :vars
    (
      ?auto_4737 - HOIST
      ?auto_4736 - PLACE
      ?auto_4738 - SURFACE
      ?auto_4734 - TRUCK
      ?auto_4735 - PLACE
      ?auto_4739 - HOIST
      ?auto_4740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4737 ?auto_4736 ) ( SURFACE-AT ?auto_4732 ?auto_4736 ) ( CLEAR ?auto_4732 ) ( IS-CRATE ?auto_4733 ) ( not ( = ?auto_4732 ?auto_4733 ) ) ( AVAILABLE ?auto_4737 ) ( ON ?auto_4732 ?auto_4738 ) ( not ( = ?auto_4738 ?auto_4732 ) ) ( not ( = ?auto_4738 ?auto_4733 ) ) ( TRUCK-AT ?auto_4734 ?auto_4735 ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( HOIST-AT ?auto_4739 ?auto_4735 ) ( not ( = ?auto_4737 ?auto_4739 ) ) ( AVAILABLE ?auto_4739 ) ( SURFACE-AT ?auto_4733 ?auto_4735 ) ( ON ?auto_4733 ?auto_4740 ) ( CLEAR ?auto_4733 ) ( not ( = ?auto_4732 ?auto_4740 ) ) ( not ( = ?auto_4733 ?auto_4740 ) ) ( not ( = ?auto_4738 ?auto_4740 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4739 ?auto_4733 ?auto_4740 ?auto_4735 )
      ( MAKE-2CRATE ?auto_4738 ?auto_4732 ?auto_4733 )
      ( MAKE-1CRATE-VERIFY ?auto_4732 ?auto_4733 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4741 - SURFACE
      ?auto_4742 - SURFACE
      ?auto_4743 - SURFACE
    )
    :vars
    (
      ?auto_4747 - HOIST
      ?auto_4749 - PLACE
      ?auto_4744 - TRUCK
      ?auto_4746 - PLACE
      ?auto_4745 - HOIST
      ?auto_4748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4747 ?auto_4749 ) ( SURFACE-AT ?auto_4742 ?auto_4749 ) ( CLEAR ?auto_4742 ) ( IS-CRATE ?auto_4743 ) ( not ( = ?auto_4742 ?auto_4743 ) ) ( AVAILABLE ?auto_4747 ) ( ON ?auto_4742 ?auto_4741 ) ( not ( = ?auto_4741 ?auto_4742 ) ) ( not ( = ?auto_4741 ?auto_4743 ) ) ( TRUCK-AT ?auto_4744 ?auto_4746 ) ( not ( = ?auto_4746 ?auto_4749 ) ) ( HOIST-AT ?auto_4745 ?auto_4746 ) ( not ( = ?auto_4747 ?auto_4745 ) ) ( AVAILABLE ?auto_4745 ) ( SURFACE-AT ?auto_4743 ?auto_4746 ) ( ON ?auto_4743 ?auto_4748 ) ( CLEAR ?auto_4743 ) ( not ( = ?auto_4742 ?auto_4748 ) ) ( not ( = ?auto_4743 ?auto_4748 ) ) ( not ( = ?auto_4741 ?auto_4748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4742 ?auto_4743 )
      ( MAKE-2CRATE-VERIFY ?auto_4741 ?auto_4742 ?auto_4743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4750 - SURFACE
      ?auto_4751 - SURFACE
    )
    :vars
    (
      ?auto_4753 - HOIST
      ?auto_4754 - PLACE
      ?auto_4752 - SURFACE
      ?auto_4757 - PLACE
      ?auto_4755 - HOIST
      ?auto_4758 - SURFACE
      ?auto_4756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4753 ?auto_4754 ) ( SURFACE-AT ?auto_4750 ?auto_4754 ) ( CLEAR ?auto_4750 ) ( IS-CRATE ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( AVAILABLE ?auto_4753 ) ( ON ?auto_4750 ?auto_4752 ) ( not ( = ?auto_4752 ?auto_4750 ) ) ( not ( = ?auto_4752 ?auto_4751 ) ) ( not ( = ?auto_4757 ?auto_4754 ) ) ( HOIST-AT ?auto_4755 ?auto_4757 ) ( not ( = ?auto_4753 ?auto_4755 ) ) ( AVAILABLE ?auto_4755 ) ( SURFACE-AT ?auto_4751 ?auto_4757 ) ( ON ?auto_4751 ?auto_4758 ) ( CLEAR ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4758 ) ) ( not ( = ?auto_4751 ?auto_4758 ) ) ( not ( = ?auto_4752 ?auto_4758 ) ) ( TRUCK-AT ?auto_4756 ?auto_4754 ) )
    :subtasks
    ( ( !DRIVE ?auto_4756 ?auto_4754 ?auto_4757 )
      ( MAKE-2CRATE ?auto_4752 ?auto_4750 ?auto_4751 )
      ( MAKE-1CRATE-VERIFY ?auto_4750 ?auto_4751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4759 - SURFACE
      ?auto_4760 - SURFACE
      ?auto_4761 - SURFACE
    )
    :vars
    (
      ?auto_4767 - HOIST
      ?auto_4764 - PLACE
      ?auto_4765 - PLACE
      ?auto_4763 - HOIST
      ?auto_4762 - SURFACE
      ?auto_4766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4767 ?auto_4764 ) ( SURFACE-AT ?auto_4760 ?auto_4764 ) ( CLEAR ?auto_4760 ) ( IS-CRATE ?auto_4761 ) ( not ( = ?auto_4760 ?auto_4761 ) ) ( AVAILABLE ?auto_4767 ) ( ON ?auto_4760 ?auto_4759 ) ( not ( = ?auto_4759 ?auto_4760 ) ) ( not ( = ?auto_4759 ?auto_4761 ) ) ( not ( = ?auto_4765 ?auto_4764 ) ) ( HOIST-AT ?auto_4763 ?auto_4765 ) ( not ( = ?auto_4767 ?auto_4763 ) ) ( AVAILABLE ?auto_4763 ) ( SURFACE-AT ?auto_4761 ?auto_4765 ) ( ON ?auto_4761 ?auto_4762 ) ( CLEAR ?auto_4761 ) ( not ( = ?auto_4760 ?auto_4762 ) ) ( not ( = ?auto_4761 ?auto_4762 ) ) ( not ( = ?auto_4759 ?auto_4762 ) ) ( TRUCK-AT ?auto_4766 ?auto_4764 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4760 ?auto_4761 )
      ( MAKE-2CRATE-VERIFY ?auto_4759 ?auto_4760 ?auto_4761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4768 - SURFACE
      ?auto_4769 - SURFACE
    )
    :vars
    (
      ?auto_4774 - HOIST
      ?auto_4770 - PLACE
      ?auto_4773 - SURFACE
      ?auto_4776 - PLACE
      ?auto_4772 - HOIST
      ?auto_4771 - SURFACE
      ?auto_4775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4774 ?auto_4770 ) ( IS-CRATE ?auto_4769 ) ( not ( = ?auto_4768 ?auto_4769 ) ) ( not ( = ?auto_4773 ?auto_4768 ) ) ( not ( = ?auto_4773 ?auto_4769 ) ) ( not ( = ?auto_4776 ?auto_4770 ) ) ( HOIST-AT ?auto_4772 ?auto_4776 ) ( not ( = ?auto_4774 ?auto_4772 ) ) ( AVAILABLE ?auto_4772 ) ( SURFACE-AT ?auto_4769 ?auto_4776 ) ( ON ?auto_4769 ?auto_4771 ) ( CLEAR ?auto_4769 ) ( not ( = ?auto_4768 ?auto_4771 ) ) ( not ( = ?auto_4769 ?auto_4771 ) ) ( not ( = ?auto_4773 ?auto_4771 ) ) ( TRUCK-AT ?auto_4775 ?auto_4770 ) ( SURFACE-AT ?auto_4773 ?auto_4770 ) ( CLEAR ?auto_4773 ) ( LIFTING ?auto_4774 ?auto_4768 ) ( IS-CRATE ?auto_4768 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4773 ?auto_4768 )
      ( MAKE-2CRATE ?auto_4773 ?auto_4768 ?auto_4769 )
      ( MAKE-1CRATE-VERIFY ?auto_4768 ?auto_4769 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4777 - SURFACE
      ?auto_4778 - SURFACE
      ?auto_4779 - SURFACE
    )
    :vars
    (
      ?auto_4783 - HOIST
      ?auto_4782 - PLACE
      ?auto_4785 - PLACE
      ?auto_4781 - HOIST
      ?auto_4780 - SURFACE
      ?auto_4784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4783 ?auto_4782 ) ( IS-CRATE ?auto_4779 ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( not ( = ?auto_4777 ?auto_4778 ) ) ( not ( = ?auto_4777 ?auto_4779 ) ) ( not ( = ?auto_4785 ?auto_4782 ) ) ( HOIST-AT ?auto_4781 ?auto_4785 ) ( not ( = ?auto_4783 ?auto_4781 ) ) ( AVAILABLE ?auto_4781 ) ( SURFACE-AT ?auto_4779 ?auto_4785 ) ( ON ?auto_4779 ?auto_4780 ) ( CLEAR ?auto_4779 ) ( not ( = ?auto_4778 ?auto_4780 ) ) ( not ( = ?auto_4779 ?auto_4780 ) ) ( not ( = ?auto_4777 ?auto_4780 ) ) ( TRUCK-AT ?auto_4784 ?auto_4782 ) ( SURFACE-AT ?auto_4777 ?auto_4782 ) ( CLEAR ?auto_4777 ) ( LIFTING ?auto_4783 ?auto_4778 ) ( IS-CRATE ?auto_4778 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4778 ?auto_4779 )
      ( MAKE-2CRATE-VERIFY ?auto_4777 ?auto_4778 ?auto_4779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4786 - SURFACE
      ?auto_4787 - SURFACE
    )
    :vars
    (
      ?auto_4789 - HOIST
      ?auto_4791 - PLACE
      ?auto_4790 - SURFACE
      ?auto_4788 - PLACE
      ?auto_4794 - HOIST
      ?auto_4793 - SURFACE
      ?auto_4792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4789 ?auto_4791 ) ( IS-CRATE ?auto_4787 ) ( not ( = ?auto_4786 ?auto_4787 ) ) ( not ( = ?auto_4790 ?auto_4786 ) ) ( not ( = ?auto_4790 ?auto_4787 ) ) ( not ( = ?auto_4788 ?auto_4791 ) ) ( HOIST-AT ?auto_4794 ?auto_4788 ) ( not ( = ?auto_4789 ?auto_4794 ) ) ( AVAILABLE ?auto_4794 ) ( SURFACE-AT ?auto_4787 ?auto_4788 ) ( ON ?auto_4787 ?auto_4793 ) ( CLEAR ?auto_4787 ) ( not ( = ?auto_4786 ?auto_4793 ) ) ( not ( = ?auto_4787 ?auto_4793 ) ) ( not ( = ?auto_4790 ?auto_4793 ) ) ( TRUCK-AT ?auto_4792 ?auto_4791 ) ( SURFACE-AT ?auto_4790 ?auto_4791 ) ( CLEAR ?auto_4790 ) ( IS-CRATE ?auto_4786 ) ( AVAILABLE ?auto_4789 ) ( IN ?auto_4786 ?auto_4792 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4789 ?auto_4786 ?auto_4792 ?auto_4791 )
      ( MAKE-2CRATE ?auto_4790 ?auto_4786 ?auto_4787 )
      ( MAKE-1CRATE-VERIFY ?auto_4786 ?auto_4787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4795 - SURFACE
      ?auto_4796 - SURFACE
      ?auto_4797 - SURFACE
    )
    :vars
    (
      ?auto_4800 - HOIST
      ?auto_4802 - PLACE
      ?auto_4799 - PLACE
      ?auto_4798 - HOIST
      ?auto_4803 - SURFACE
      ?auto_4801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4800 ?auto_4802 ) ( IS-CRATE ?auto_4797 ) ( not ( = ?auto_4796 ?auto_4797 ) ) ( not ( = ?auto_4795 ?auto_4796 ) ) ( not ( = ?auto_4795 ?auto_4797 ) ) ( not ( = ?auto_4799 ?auto_4802 ) ) ( HOIST-AT ?auto_4798 ?auto_4799 ) ( not ( = ?auto_4800 ?auto_4798 ) ) ( AVAILABLE ?auto_4798 ) ( SURFACE-AT ?auto_4797 ?auto_4799 ) ( ON ?auto_4797 ?auto_4803 ) ( CLEAR ?auto_4797 ) ( not ( = ?auto_4796 ?auto_4803 ) ) ( not ( = ?auto_4797 ?auto_4803 ) ) ( not ( = ?auto_4795 ?auto_4803 ) ) ( TRUCK-AT ?auto_4801 ?auto_4802 ) ( SURFACE-AT ?auto_4795 ?auto_4802 ) ( CLEAR ?auto_4795 ) ( IS-CRATE ?auto_4796 ) ( AVAILABLE ?auto_4800 ) ( IN ?auto_4796 ?auto_4801 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4796 ?auto_4797 )
      ( MAKE-2CRATE-VERIFY ?auto_4795 ?auto_4796 ?auto_4797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4840 - SURFACE
      ?auto_4841 - SURFACE
    )
    :vars
    (
      ?auto_4848 - HOIST
      ?auto_4842 - PLACE
      ?auto_4845 - SURFACE
      ?auto_4846 - PLACE
      ?auto_4843 - HOIST
      ?auto_4844 - SURFACE
      ?auto_4847 - TRUCK
      ?auto_4849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4848 ?auto_4842 ) ( SURFACE-AT ?auto_4840 ?auto_4842 ) ( CLEAR ?auto_4840 ) ( IS-CRATE ?auto_4841 ) ( not ( = ?auto_4840 ?auto_4841 ) ) ( AVAILABLE ?auto_4848 ) ( ON ?auto_4840 ?auto_4845 ) ( not ( = ?auto_4845 ?auto_4840 ) ) ( not ( = ?auto_4845 ?auto_4841 ) ) ( not ( = ?auto_4846 ?auto_4842 ) ) ( HOIST-AT ?auto_4843 ?auto_4846 ) ( not ( = ?auto_4848 ?auto_4843 ) ) ( AVAILABLE ?auto_4843 ) ( SURFACE-AT ?auto_4841 ?auto_4846 ) ( ON ?auto_4841 ?auto_4844 ) ( CLEAR ?auto_4841 ) ( not ( = ?auto_4840 ?auto_4844 ) ) ( not ( = ?auto_4841 ?auto_4844 ) ) ( not ( = ?auto_4845 ?auto_4844 ) ) ( TRUCK-AT ?auto_4847 ?auto_4849 ) ( not ( = ?auto_4849 ?auto_4842 ) ) ( not ( = ?auto_4846 ?auto_4849 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4847 ?auto_4849 ?auto_4842 )
      ( MAKE-1CRATE ?auto_4840 ?auto_4841 )
      ( MAKE-1CRATE-VERIFY ?auto_4840 ?auto_4841 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4879 - SURFACE
      ?auto_4880 - SURFACE
      ?auto_4881 - SURFACE
      ?auto_4882 - SURFACE
    )
    :vars
    (
      ?auto_4883 - HOIST
      ?auto_4884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4883 ?auto_4884 ) ( SURFACE-AT ?auto_4881 ?auto_4884 ) ( CLEAR ?auto_4881 ) ( LIFTING ?auto_4883 ?auto_4882 ) ( IS-CRATE ?auto_4882 ) ( not ( = ?auto_4881 ?auto_4882 ) ) ( ON ?auto_4880 ?auto_4879 ) ( ON ?auto_4881 ?auto_4880 ) ( not ( = ?auto_4879 ?auto_4880 ) ) ( not ( = ?auto_4879 ?auto_4881 ) ) ( not ( = ?auto_4879 ?auto_4882 ) ) ( not ( = ?auto_4880 ?auto_4881 ) ) ( not ( = ?auto_4880 ?auto_4882 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4881 ?auto_4882 )
      ( MAKE-3CRATE-VERIFY ?auto_4879 ?auto_4880 ?auto_4881 ?auto_4882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4896 - SURFACE
      ?auto_4897 - SURFACE
      ?auto_4898 - SURFACE
      ?auto_4899 - SURFACE
    )
    :vars
    (
      ?auto_4901 - HOIST
      ?auto_4900 - PLACE
      ?auto_4902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4901 ?auto_4900 ) ( SURFACE-AT ?auto_4898 ?auto_4900 ) ( CLEAR ?auto_4898 ) ( IS-CRATE ?auto_4899 ) ( not ( = ?auto_4898 ?auto_4899 ) ) ( TRUCK-AT ?auto_4902 ?auto_4900 ) ( AVAILABLE ?auto_4901 ) ( IN ?auto_4899 ?auto_4902 ) ( ON ?auto_4898 ?auto_4897 ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( not ( = ?auto_4897 ?auto_4899 ) ) ( ON ?auto_4897 ?auto_4896 ) ( not ( = ?auto_4896 ?auto_4897 ) ) ( not ( = ?auto_4896 ?auto_4898 ) ) ( not ( = ?auto_4896 ?auto_4899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4897 ?auto_4898 ?auto_4899 )
      ( MAKE-3CRATE-VERIFY ?auto_4896 ?auto_4897 ?auto_4898 ?auto_4899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4917 - SURFACE
      ?auto_4918 - SURFACE
      ?auto_4919 - SURFACE
      ?auto_4920 - SURFACE
    )
    :vars
    (
      ?auto_4922 - HOIST
      ?auto_4921 - PLACE
      ?auto_4924 - TRUCK
      ?auto_4923 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4922 ?auto_4921 ) ( SURFACE-AT ?auto_4919 ?auto_4921 ) ( CLEAR ?auto_4919 ) ( IS-CRATE ?auto_4920 ) ( not ( = ?auto_4919 ?auto_4920 ) ) ( AVAILABLE ?auto_4922 ) ( IN ?auto_4920 ?auto_4924 ) ( ON ?auto_4919 ?auto_4918 ) ( not ( = ?auto_4918 ?auto_4919 ) ) ( not ( = ?auto_4918 ?auto_4920 ) ) ( TRUCK-AT ?auto_4924 ?auto_4923 ) ( not ( = ?auto_4923 ?auto_4921 ) ) ( ON ?auto_4918 ?auto_4917 ) ( not ( = ?auto_4917 ?auto_4918 ) ) ( not ( = ?auto_4917 ?auto_4919 ) ) ( not ( = ?auto_4917 ?auto_4920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4918 ?auto_4919 ?auto_4920 )
      ( MAKE-3CRATE-VERIFY ?auto_4917 ?auto_4918 ?auto_4919 ?auto_4920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4941 - SURFACE
      ?auto_4942 - SURFACE
      ?auto_4943 - SURFACE
      ?auto_4944 - SURFACE
    )
    :vars
    (
      ?auto_4949 - HOIST
      ?auto_4948 - PLACE
      ?auto_4946 - TRUCK
      ?auto_4947 - PLACE
      ?auto_4945 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4949 ?auto_4948 ) ( SURFACE-AT ?auto_4943 ?auto_4948 ) ( CLEAR ?auto_4943 ) ( IS-CRATE ?auto_4944 ) ( not ( = ?auto_4943 ?auto_4944 ) ) ( AVAILABLE ?auto_4949 ) ( ON ?auto_4943 ?auto_4942 ) ( not ( = ?auto_4942 ?auto_4943 ) ) ( not ( = ?auto_4942 ?auto_4944 ) ) ( TRUCK-AT ?auto_4946 ?auto_4947 ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( HOIST-AT ?auto_4945 ?auto_4947 ) ( LIFTING ?auto_4945 ?auto_4944 ) ( not ( = ?auto_4949 ?auto_4945 ) ) ( ON ?auto_4942 ?auto_4941 ) ( not ( = ?auto_4941 ?auto_4942 ) ) ( not ( = ?auto_4941 ?auto_4943 ) ) ( not ( = ?auto_4941 ?auto_4944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4942 ?auto_4943 ?auto_4944 )
      ( MAKE-3CRATE-VERIFY ?auto_4941 ?auto_4942 ?auto_4943 ?auto_4944 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4968 - SURFACE
      ?auto_4969 - SURFACE
      ?auto_4970 - SURFACE
      ?auto_4971 - SURFACE
    )
    :vars
    (
      ?auto_4976 - HOIST
      ?auto_4975 - PLACE
      ?auto_4973 - TRUCK
      ?auto_4974 - PLACE
      ?auto_4972 - HOIST
      ?auto_4977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4976 ?auto_4975 ) ( SURFACE-AT ?auto_4970 ?auto_4975 ) ( CLEAR ?auto_4970 ) ( IS-CRATE ?auto_4971 ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( AVAILABLE ?auto_4976 ) ( ON ?auto_4970 ?auto_4969 ) ( not ( = ?auto_4969 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4971 ) ) ( TRUCK-AT ?auto_4973 ?auto_4974 ) ( not ( = ?auto_4974 ?auto_4975 ) ) ( HOIST-AT ?auto_4972 ?auto_4974 ) ( not ( = ?auto_4976 ?auto_4972 ) ) ( AVAILABLE ?auto_4972 ) ( SURFACE-AT ?auto_4971 ?auto_4974 ) ( ON ?auto_4971 ?auto_4977 ) ( CLEAR ?auto_4971 ) ( not ( = ?auto_4970 ?auto_4977 ) ) ( not ( = ?auto_4971 ?auto_4977 ) ) ( not ( = ?auto_4969 ?auto_4977 ) ) ( ON ?auto_4969 ?auto_4968 ) ( not ( = ?auto_4968 ?auto_4969 ) ) ( not ( = ?auto_4968 ?auto_4970 ) ) ( not ( = ?auto_4968 ?auto_4971 ) ) ( not ( = ?auto_4968 ?auto_4977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4969 ?auto_4970 ?auto_4971 )
      ( MAKE-3CRATE-VERIFY ?auto_4968 ?auto_4969 ?auto_4970 ?auto_4971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4996 - SURFACE
      ?auto_4997 - SURFACE
      ?auto_4998 - SURFACE
      ?auto_4999 - SURFACE
    )
    :vars
    (
      ?auto_5005 - HOIST
      ?auto_5004 - PLACE
      ?auto_5001 - PLACE
      ?auto_5000 - HOIST
      ?auto_5002 - SURFACE
      ?auto_5003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5005 ?auto_5004 ) ( SURFACE-AT ?auto_4998 ?auto_5004 ) ( CLEAR ?auto_4998 ) ( IS-CRATE ?auto_4999 ) ( not ( = ?auto_4998 ?auto_4999 ) ) ( AVAILABLE ?auto_5005 ) ( ON ?auto_4998 ?auto_4997 ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( not ( = ?auto_4997 ?auto_4999 ) ) ( not ( = ?auto_5001 ?auto_5004 ) ) ( HOIST-AT ?auto_5000 ?auto_5001 ) ( not ( = ?auto_5005 ?auto_5000 ) ) ( AVAILABLE ?auto_5000 ) ( SURFACE-AT ?auto_4999 ?auto_5001 ) ( ON ?auto_4999 ?auto_5002 ) ( CLEAR ?auto_4999 ) ( not ( = ?auto_4998 ?auto_5002 ) ) ( not ( = ?auto_4999 ?auto_5002 ) ) ( not ( = ?auto_4997 ?auto_5002 ) ) ( TRUCK-AT ?auto_5003 ?auto_5004 ) ( ON ?auto_4997 ?auto_4996 ) ( not ( = ?auto_4996 ?auto_4997 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_4999 ) ) ( not ( = ?auto_4996 ?auto_5002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4997 ?auto_4998 ?auto_4999 )
      ( MAKE-3CRATE-VERIFY ?auto_4996 ?auto_4997 ?auto_4998 ?auto_4999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5024 - SURFACE
      ?auto_5025 - SURFACE
      ?auto_5026 - SURFACE
      ?auto_5027 - SURFACE
    )
    :vars
    (
      ?auto_5031 - HOIST
      ?auto_5029 - PLACE
      ?auto_5033 - PLACE
      ?auto_5028 - HOIST
      ?auto_5030 - SURFACE
      ?auto_5032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5031 ?auto_5029 ) ( IS-CRATE ?auto_5027 ) ( not ( = ?auto_5026 ?auto_5027 ) ) ( not ( = ?auto_5025 ?auto_5026 ) ) ( not ( = ?auto_5025 ?auto_5027 ) ) ( not ( = ?auto_5033 ?auto_5029 ) ) ( HOIST-AT ?auto_5028 ?auto_5033 ) ( not ( = ?auto_5031 ?auto_5028 ) ) ( AVAILABLE ?auto_5028 ) ( SURFACE-AT ?auto_5027 ?auto_5033 ) ( ON ?auto_5027 ?auto_5030 ) ( CLEAR ?auto_5027 ) ( not ( = ?auto_5026 ?auto_5030 ) ) ( not ( = ?auto_5027 ?auto_5030 ) ) ( not ( = ?auto_5025 ?auto_5030 ) ) ( TRUCK-AT ?auto_5032 ?auto_5029 ) ( SURFACE-AT ?auto_5025 ?auto_5029 ) ( CLEAR ?auto_5025 ) ( LIFTING ?auto_5031 ?auto_5026 ) ( IS-CRATE ?auto_5026 ) ( ON ?auto_5025 ?auto_5024 ) ( not ( = ?auto_5024 ?auto_5025 ) ) ( not ( = ?auto_5024 ?auto_5026 ) ) ( not ( = ?auto_5024 ?auto_5027 ) ) ( not ( = ?auto_5024 ?auto_5030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5025 ?auto_5026 ?auto_5027 )
      ( MAKE-3CRATE-VERIFY ?auto_5024 ?auto_5025 ?auto_5026 ?auto_5027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5052 - SURFACE
      ?auto_5053 - SURFACE
      ?auto_5054 - SURFACE
      ?auto_5055 - SURFACE
    )
    :vars
    (
      ?auto_5060 - HOIST
      ?auto_5058 - PLACE
      ?auto_5059 - PLACE
      ?auto_5056 - HOIST
      ?auto_5061 - SURFACE
      ?auto_5057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5060 ?auto_5058 ) ( IS-CRATE ?auto_5055 ) ( not ( = ?auto_5054 ?auto_5055 ) ) ( not ( = ?auto_5053 ?auto_5054 ) ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( not ( = ?auto_5059 ?auto_5058 ) ) ( HOIST-AT ?auto_5056 ?auto_5059 ) ( not ( = ?auto_5060 ?auto_5056 ) ) ( AVAILABLE ?auto_5056 ) ( SURFACE-AT ?auto_5055 ?auto_5059 ) ( ON ?auto_5055 ?auto_5061 ) ( CLEAR ?auto_5055 ) ( not ( = ?auto_5054 ?auto_5061 ) ) ( not ( = ?auto_5055 ?auto_5061 ) ) ( not ( = ?auto_5053 ?auto_5061 ) ) ( TRUCK-AT ?auto_5057 ?auto_5058 ) ( SURFACE-AT ?auto_5053 ?auto_5058 ) ( CLEAR ?auto_5053 ) ( IS-CRATE ?auto_5054 ) ( AVAILABLE ?auto_5060 ) ( IN ?auto_5054 ?auto_5057 ) ( ON ?auto_5053 ?auto_5052 ) ( not ( = ?auto_5052 ?auto_5053 ) ) ( not ( = ?auto_5052 ?auto_5054 ) ) ( not ( = ?auto_5052 ?auto_5055 ) ) ( not ( = ?auto_5052 ?auto_5061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5053 ?auto_5054 ?auto_5055 )
      ( MAKE-3CRATE-VERIFY ?auto_5052 ?auto_5053 ?auto_5054 ?auto_5055 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5343 - SURFACE
      ?auto_5344 - SURFACE
      ?auto_5345 - SURFACE
      ?auto_5346 - SURFACE
      ?auto_5347 - SURFACE
    )
    :vars
    (
      ?auto_5349 - HOIST
      ?auto_5348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5349 ?auto_5348 ) ( SURFACE-AT ?auto_5346 ?auto_5348 ) ( CLEAR ?auto_5346 ) ( LIFTING ?auto_5349 ?auto_5347 ) ( IS-CRATE ?auto_5347 ) ( not ( = ?auto_5346 ?auto_5347 ) ) ( ON ?auto_5344 ?auto_5343 ) ( ON ?auto_5345 ?auto_5344 ) ( ON ?auto_5346 ?auto_5345 ) ( not ( = ?auto_5343 ?auto_5344 ) ) ( not ( = ?auto_5343 ?auto_5345 ) ) ( not ( = ?auto_5343 ?auto_5346 ) ) ( not ( = ?auto_5343 ?auto_5347 ) ) ( not ( = ?auto_5344 ?auto_5345 ) ) ( not ( = ?auto_5344 ?auto_5346 ) ) ( not ( = ?auto_5344 ?auto_5347 ) ) ( not ( = ?auto_5345 ?auto_5346 ) ) ( not ( = ?auto_5345 ?auto_5347 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5346 ?auto_5347 )
      ( MAKE-4CRATE-VERIFY ?auto_5343 ?auto_5344 ?auto_5345 ?auto_5346 ?auto_5347 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5368 - SURFACE
      ?auto_5369 - SURFACE
      ?auto_5370 - SURFACE
      ?auto_5371 - SURFACE
      ?auto_5372 - SURFACE
    )
    :vars
    (
      ?auto_5373 - HOIST
      ?auto_5374 - PLACE
      ?auto_5375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5373 ?auto_5374 ) ( SURFACE-AT ?auto_5371 ?auto_5374 ) ( CLEAR ?auto_5371 ) ( IS-CRATE ?auto_5372 ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( TRUCK-AT ?auto_5375 ?auto_5374 ) ( AVAILABLE ?auto_5373 ) ( IN ?auto_5372 ?auto_5375 ) ( ON ?auto_5371 ?auto_5370 ) ( not ( = ?auto_5370 ?auto_5371 ) ) ( not ( = ?auto_5370 ?auto_5372 ) ) ( ON ?auto_5369 ?auto_5368 ) ( ON ?auto_5370 ?auto_5369 ) ( not ( = ?auto_5368 ?auto_5369 ) ) ( not ( = ?auto_5368 ?auto_5370 ) ) ( not ( = ?auto_5368 ?auto_5371 ) ) ( not ( = ?auto_5368 ?auto_5372 ) ) ( not ( = ?auto_5369 ?auto_5370 ) ) ( not ( = ?auto_5369 ?auto_5371 ) ) ( not ( = ?auto_5369 ?auto_5372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5370 ?auto_5371 ?auto_5372 )
      ( MAKE-4CRATE-VERIFY ?auto_5368 ?auto_5369 ?auto_5370 ?auto_5371 ?auto_5372 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5398 - SURFACE
      ?auto_5399 - SURFACE
      ?auto_5400 - SURFACE
      ?auto_5401 - SURFACE
      ?auto_5402 - SURFACE
    )
    :vars
    (
      ?auto_5404 - HOIST
      ?auto_5406 - PLACE
      ?auto_5403 - TRUCK
      ?auto_5405 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5404 ?auto_5406 ) ( SURFACE-AT ?auto_5401 ?auto_5406 ) ( CLEAR ?auto_5401 ) ( IS-CRATE ?auto_5402 ) ( not ( = ?auto_5401 ?auto_5402 ) ) ( AVAILABLE ?auto_5404 ) ( IN ?auto_5402 ?auto_5403 ) ( ON ?auto_5401 ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5401 ) ) ( not ( = ?auto_5400 ?auto_5402 ) ) ( TRUCK-AT ?auto_5403 ?auto_5405 ) ( not ( = ?auto_5405 ?auto_5406 ) ) ( ON ?auto_5399 ?auto_5398 ) ( ON ?auto_5400 ?auto_5399 ) ( not ( = ?auto_5398 ?auto_5399 ) ) ( not ( = ?auto_5398 ?auto_5400 ) ) ( not ( = ?auto_5398 ?auto_5401 ) ) ( not ( = ?auto_5398 ?auto_5402 ) ) ( not ( = ?auto_5399 ?auto_5400 ) ) ( not ( = ?auto_5399 ?auto_5401 ) ) ( not ( = ?auto_5399 ?auto_5402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5400 ?auto_5401 ?auto_5402 )
      ( MAKE-4CRATE-VERIFY ?auto_5398 ?auto_5399 ?auto_5400 ?auto_5401 ?auto_5402 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5432 - SURFACE
      ?auto_5433 - SURFACE
      ?auto_5434 - SURFACE
      ?auto_5435 - SURFACE
      ?auto_5436 - SURFACE
    )
    :vars
    (
      ?auto_5439 - HOIST
      ?auto_5437 - PLACE
      ?auto_5441 - TRUCK
      ?auto_5438 - PLACE
      ?auto_5440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5439 ?auto_5437 ) ( SURFACE-AT ?auto_5435 ?auto_5437 ) ( CLEAR ?auto_5435 ) ( IS-CRATE ?auto_5436 ) ( not ( = ?auto_5435 ?auto_5436 ) ) ( AVAILABLE ?auto_5439 ) ( ON ?auto_5435 ?auto_5434 ) ( not ( = ?auto_5434 ?auto_5435 ) ) ( not ( = ?auto_5434 ?auto_5436 ) ) ( TRUCK-AT ?auto_5441 ?auto_5438 ) ( not ( = ?auto_5438 ?auto_5437 ) ) ( HOIST-AT ?auto_5440 ?auto_5438 ) ( LIFTING ?auto_5440 ?auto_5436 ) ( not ( = ?auto_5439 ?auto_5440 ) ) ( ON ?auto_5433 ?auto_5432 ) ( ON ?auto_5434 ?auto_5433 ) ( not ( = ?auto_5432 ?auto_5433 ) ) ( not ( = ?auto_5432 ?auto_5434 ) ) ( not ( = ?auto_5432 ?auto_5435 ) ) ( not ( = ?auto_5432 ?auto_5436 ) ) ( not ( = ?auto_5433 ?auto_5434 ) ) ( not ( = ?auto_5433 ?auto_5435 ) ) ( not ( = ?auto_5433 ?auto_5436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5434 ?auto_5435 ?auto_5436 )
      ( MAKE-4CRATE-VERIFY ?auto_5432 ?auto_5433 ?auto_5434 ?auto_5435 ?auto_5436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5470 - SURFACE
      ?auto_5471 - SURFACE
      ?auto_5472 - SURFACE
      ?auto_5473 - SURFACE
      ?auto_5474 - SURFACE
    )
    :vars
    (
      ?auto_5475 - HOIST
      ?auto_5476 - PLACE
      ?auto_5479 - TRUCK
      ?auto_5480 - PLACE
      ?auto_5478 - HOIST
      ?auto_5477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5475 ?auto_5476 ) ( SURFACE-AT ?auto_5473 ?auto_5476 ) ( CLEAR ?auto_5473 ) ( IS-CRATE ?auto_5474 ) ( not ( = ?auto_5473 ?auto_5474 ) ) ( AVAILABLE ?auto_5475 ) ( ON ?auto_5473 ?auto_5472 ) ( not ( = ?auto_5472 ?auto_5473 ) ) ( not ( = ?auto_5472 ?auto_5474 ) ) ( TRUCK-AT ?auto_5479 ?auto_5480 ) ( not ( = ?auto_5480 ?auto_5476 ) ) ( HOIST-AT ?auto_5478 ?auto_5480 ) ( not ( = ?auto_5475 ?auto_5478 ) ) ( AVAILABLE ?auto_5478 ) ( SURFACE-AT ?auto_5474 ?auto_5480 ) ( ON ?auto_5474 ?auto_5477 ) ( CLEAR ?auto_5474 ) ( not ( = ?auto_5473 ?auto_5477 ) ) ( not ( = ?auto_5474 ?auto_5477 ) ) ( not ( = ?auto_5472 ?auto_5477 ) ) ( ON ?auto_5471 ?auto_5470 ) ( ON ?auto_5472 ?auto_5471 ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5472 ) ) ( not ( = ?auto_5470 ?auto_5473 ) ) ( not ( = ?auto_5470 ?auto_5474 ) ) ( not ( = ?auto_5470 ?auto_5477 ) ) ( not ( = ?auto_5471 ?auto_5472 ) ) ( not ( = ?auto_5471 ?auto_5473 ) ) ( not ( = ?auto_5471 ?auto_5474 ) ) ( not ( = ?auto_5471 ?auto_5477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5472 ?auto_5473 ?auto_5474 )
      ( MAKE-4CRATE-VERIFY ?auto_5470 ?auto_5471 ?auto_5472 ?auto_5473 ?auto_5474 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5509 - SURFACE
      ?auto_5510 - SURFACE
      ?auto_5511 - SURFACE
      ?auto_5512 - SURFACE
      ?auto_5513 - SURFACE
    )
    :vars
    (
      ?auto_5516 - HOIST
      ?auto_5519 - PLACE
      ?auto_5518 - PLACE
      ?auto_5515 - HOIST
      ?auto_5514 - SURFACE
      ?auto_5517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5516 ?auto_5519 ) ( SURFACE-AT ?auto_5512 ?auto_5519 ) ( CLEAR ?auto_5512 ) ( IS-CRATE ?auto_5513 ) ( not ( = ?auto_5512 ?auto_5513 ) ) ( AVAILABLE ?auto_5516 ) ( ON ?auto_5512 ?auto_5511 ) ( not ( = ?auto_5511 ?auto_5512 ) ) ( not ( = ?auto_5511 ?auto_5513 ) ) ( not ( = ?auto_5518 ?auto_5519 ) ) ( HOIST-AT ?auto_5515 ?auto_5518 ) ( not ( = ?auto_5516 ?auto_5515 ) ) ( AVAILABLE ?auto_5515 ) ( SURFACE-AT ?auto_5513 ?auto_5518 ) ( ON ?auto_5513 ?auto_5514 ) ( CLEAR ?auto_5513 ) ( not ( = ?auto_5512 ?auto_5514 ) ) ( not ( = ?auto_5513 ?auto_5514 ) ) ( not ( = ?auto_5511 ?auto_5514 ) ) ( TRUCK-AT ?auto_5517 ?auto_5519 ) ( ON ?auto_5510 ?auto_5509 ) ( ON ?auto_5511 ?auto_5510 ) ( not ( = ?auto_5509 ?auto_5510 ) ) ( not ( = ?auto_5509 ?auto_5511 ) ) ( not ( = ?auto_5509 ?auto_5512 ) ) ( not ( = ?auto_5509 ?auto_5513 ) ) ( not ( = ?auto_5509 ?auto_5514 ) ) ( not ( = ?auto_5510 ?auto_5511 ) ) ( not ( = ?auto_5510 ?auto_5512 ) ) ( not ( = ?auto_5510 ?auto_5513 ) ) ( not ( = ?auto_5510 ?auto_5514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5511 ?auto_5512 ?auto_5513 )
      ( MAKE-4CRATE-VERIFY ?auto_5509 ?auto_5510 ?auto_5511 ?auto_5512 ?auto_5513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5548 - SURFACE
      ?auto_5549 - SURFACE
      ?auto_5550 - SURFACE
      ?auto_5551 - SURFACE
      ?auto_5552 - SURFACE
    )
    :vars
    (
      ?auto_5557 - HOIST
      ?auto_5553 - PLACE
      ?auto_5556 - PLACE
      ?auto_5555 - HOIST
      ?auto_5558 - SURFACE
      ?auto_5554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5557 ?auto_5553 ) ( IS-CRATE ?auto_5552 ) ( not ( = ?auto_5551 ?auto_5552 ) ) ( not ( = ?auto_5550 ?auto_5551 ) ) ( not ( = ?auto_5550 ?auto_5552 ) ) ( not ( = ?auto_5556 ?auto_5553 ) ) ( HOIST-AT ?auto_5555 ?auto_5556 ) ( not ( = ?auto_5557 ?auto_5555 ) ) ( AVAILABLE ?auto_5555 ) ( SURFACE-AT ?auto_5552 ?auto_5556 ) ( ON ?auto_5552 ?auto_5558 ) ( CLEAR ?auto_5552 ) ( not ( = ?auto_5551 ?auto_5558 ) ) ( not ( = ?auto_5552 ?auto_5558 ) ) ( not ( = ?auto_5550 ?auto_5558 ) ) ( TRUCK-AT ?auto_5554 ?auto_5553 ) ( SURFACE-AT ?auto_5550 ?auto_5553 ) ( CLEAR ?auto_5550 ) ( LIFTING ?auto_5557 ?auto_5551 ) ( IS-CRATE ?auto_5551 ) ( ON ?auto_5549 ?auto_5548 ) ( ON ?auto_5550 ?auto_5549 ) ( not ( = ?auto_5548 ?auto_5549 ) ) ( not ( = ?auto_5548 ?auto_5550 ) ) ( not ( = ?auto_5548 ?auto_5551 ) ) ( not ( = ?auto_5548 ?auto_5552 ) ) ( not ( = ?auto_5548 ?auto_5558 ) ) ( not ( = ?auto_5549 ?auto_5550 ) ) ( not ( = ?auto_5549 ?auto_5551 ) ) ( not ( = ?auto_5549 ?auto_5552 ) ) ( not ( = ?auto_5549 ?auto_5558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5550 ?auto_5551 ?auto_5552 )
      ( MAKE-4CRATE-VERIFY ?auto_5548 ?auto_5549 ?auto_5550 ?auto_5551 ?auto_5552 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5587 - SURFACE
      ?auto_5588 - SURFACE
      ?auto_5589 - SURFACE
      ?auto_5590 - SURFACE
      ?auto_5591 - SURFACE
    )
    :vars
    (
      ?auto_5592 - HOIST
      ?auto_5593 - PLACE
      ?auto_5597 - PLACE
      ?auto_5594 - HOIST
      ?auto_5595 - SURFACE
      ?auto_5596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5592 ?auto_5593 ) ( IS-CRATE ?auto_5591 ) ( not ( = ?auto_5590 ?auto_5591 ) ) ( not ( = ?auto_5589 ?auto_5590 ) ) ( not ( = ?auto_5589 ?auto_5591 ) ) ( not ( = ?auto_5597 ?auto_5593 ) ) ( HOIST-AT ?auto_5594 ?auto_5597 ) ( not ( = ?auto_5592 ?auto_5594 ) ) ( AVAILABLE ?auto_5594 ) ( SURFACE-AT ?auto_5591 ?auto_5597 ) ( ON ?auto_5591 ?auto_5595 ) ( CLEAR ?auto_5591 ) ( not ( = ?auto_5590 ?auto_5595 ) ) ( not ( = ?auto_5591 ?auto_5595 ) ) ( not ( = ?auto_5589 ?auto_5595 ) ) ( TRUCK-AT ?auto_5596 ?auto_5593 ) ( SURFACE-AT ?auto_5589 ?auto_5593 ) ( CLEAR ?auto_5589 ) ( IS-CRATE ?auto_5590 ) ( AVAILABLE ?auto_5592 ) ( IN ?auto_5590 ?auto_5596 ) ( ON ?auto_5588 ?auto_5587 ) ( ON ?auto_5589 ?auto_5588 ) ( not ( = ?auto_5587 ?auto_5588 ) ) ( not ( = ?auto_5587 ?auto_5589 ) ) ( not ( = ?auto_5587 ?auto_5590 ) ) ( not ( = ?auto_5587 ?auto_5591 ) ) ( not ( = ?auto_5587 ?auto_5595 ) ) ( not ( = ?auto_5588 ?auto_5589 ) ) ( not ( = ?auto_5588 ?auto_5590 ) ) ( not ( = ?auto_5588 ?auto_5591 ) ) ( not ( = ?auto_5588 ?auto_5595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5589 ?auto_5590 ?auto_5591 )
      ( MAKE-4CRATE-VERIFY ?auto_5587 ?auto_5588 ?auto_5589 ?auto_5590 ?auto_5591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5598 - SURFACE
      ?auto_5599 - SURFACE
    )
    :vars
    (
      ?auto_5600 - HOIST
      ?auto_5601 - PLACE
      ?auto_5606 - SURFACE
      ?auto_5605 - PLACE
      ?auto_5602 - HOIST
      ?auto_5603 - SURFACE
      ?auto_5604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5600 ?auto_5601 ) ( IS-CRATE ?auto_5599 ) ( not ( = ?auto_5598 ?auto_5599 ) ) ( not ( = ?auto_5606 ?auto_5598 ) ) ( not ( = ?auto_5606 ?auto_5599 ) ) ( not ( = ?auto_5605 ?auto_5601 ) ) ( HOIST-AT ?auto_5602 ?auto_5605 ) ( not ( = ?auto_5600 ?auto_5602 ) ) ( AVAILABLE ?auto_5602 ) ( SURFACE-AT ?auto_5599 ?auto_5605 ) ( ON ?auto_5599 ?auto_5603 ) ( CLEAR ?auto_5599 ) ( not ( = ?auto_5598 ?auto_5603 ) ) ( not ( = ?auto_5599 ?auto_5603 ) ) ( not ( = ?auto_5606 ?auto_5603 ) ) ( SURFACE-AT ?auto_5606 ?auto_5601 ) ( CLEAR ?auto_5606 ) ( IS-CRATE ?auto_5598 ) ( AVAILABLE ?auto_5600 ) ( IN ?auto_5598 ?auto_5604 ) ( TRUCK-AT ?auto_5604 ?auto_5605 ) )
    :subtasks
    ( ( !DRIVE ?auto_5604 ?auto_5605 ?auto_5601 )
      ( MAKE-2CRATE ?auto_5606 ?auto_5598 ?auto_5599 )
      ( MAKE-1CRATE-VERIFY ?auto_5598 ?auto_5599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5607 - SURFACE
      ?auto_5608 - SURFACE
      ?auto_5609 - SURFACE
    )
    :vars
    (
      ?auto_5613 - HOIST
      ?auto_5615 - PLACE
      ?auto_5611 - PLACE
      ?auto_5610 - HOIST
      ?auto_5612 - SURFACE
      ?auto_5614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5613 ?auto_5615 ) ( IS-CRATE ?auto_5609 ) ( not ( = ?auto_5608 ?auto_5609 ) ) ( not ( = ?auto_5607 ?auto_5608 ) ) ( not ( = ?auto_5607 ?auto_5609 ) ) ( not ( = ?auto_5611 ?auto_5615 ) ) ( HOIST-AT ?auto_5610 ?auto_5611 ) ( not ( = ?auto_5613 ?auto_5610 ) ) ( AVAILABLE ?auto_5610 ) ( SURFACE-AT ?auto_5609 ?auto_5611 ) ( ON ?auto_5609 ?auto_5612 ) ( CLEAR ?auto_5609 ) ( not ( = ?auto_5608 ?auto_5612 ) ) ( not ( = ?auto_5609 ?auto_5612 ) ) ( not ( = ?auto_5607 ?auto_5612 ) ) ( SURFACE-AT ?auto_5607 ?auto_5615 ) ( CLEAR ?auto_5607 ) ( IS-CRATE ?auto_5608 ) ( AVAILABLE ?auto_5613 ) ( IN ?auto_5608 ?auto_5614 ) ( TRUCK-AT ?auto_5614 ?auto_5611 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5608 ?auto_5609 )
      ( MAKE-2CRATE-VERIFY ?auto_5607 ?auto_5608 ?auto_5609 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5616 - SURFACE
      ?auto_5617 - SURFACE
      ?auto_5618 - SURFACE
      ?auto_5619 - SURFACE
    )
    :vars
    (
      ?auto_5624 - HOIST
      ?auto_5622 - PLACE
      ?auto_5625 - PLACE
      ?auto_5621 - HOIST
      ?auto_5620 - SURFACE
      ?auto_5623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5624 ?auto_5622 ) ( IS-CRATE ?auto_5619 ) ( not ( = ?auto_5618 ?auto_5619 ) ) ( not ( = ?auto_5617 ?auto_5618 ) ) ( not ( = ?auto_5617 ?auto_5619 ) ) ( not ( = ?auto_5625 ?auto_5622 ) ) ( HOIST-AT ?auto_5621 ?auto_5625 ) ( not ( = ?auto_5624 ?auto_5621 ) ) ( AVAILABLE ?auto_5621 ) ( SURFACE-AT ?auto_5619 ?auto_5625 ) ( ON ?auto_5619 ?auto_5620 ) ( CLEAR ?auto_5619 ) ( not ( = ?auto_5618 ?auto_5620 ) ) ( not ( = ?auto_5619 ?auto_5620 ) ) ( not ( = ?auto_5617 ?auto_5620 ) ) ( SURFACE-AT ?auto_5617 ?auto_5622 ) ( CLEAR ?auto_5617 ) ( IS-CRATE ?auto_5618 ) ( AVAILABLE ?auto_5624 ) ( IN ?auto_5618 ?auto_5623 ) ( TRUCK-AT ?auto_5623 ?auto_5625 ) ( ON ?auto_5617 ?auto_5616 ) ( not ( = ?auto_5616 ?auto_5617 ) ) ( not ( = ?auto_5616 ?auto_5618 ) ) ( not ( = ?auto_5616 ?auto_5619 ) ) ( not ( = ?auto_5616 ?auto_5620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5617 ?auto_5618 ?auto_5619 )
      ( MAKE-3CRATE-VERIFY ?auto_5616 ?auto_5617 ?auto_5618 ?auto_5619 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5626 - SURFACE
      ?auto_5627 - SURFACE
      ?auto_5628 - SURFACE
      ?auto_5629 - SURFACE
      ?auto_5630 - SURFACE
    )
    :vars
    (
      ?auto_5635 - HOIST
      ?auto_5633 - PLACE
      ?auto_5636 - PLACE
      ?auto_5632 - HOIST
      ?auto_5631 - SURFACE
      ?auto_5634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5635 ?auto_5633 ) ( IS-CRATE ?auto_5630 ) ( not ( = ?auto_5629 ?auto_5630 ) ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( not ( = ?auto_5636 ?auto_5633 ) ) ( HOIST-AT ?auto_5632 ?auto_5636 ) ( not ( = ?auto_5635 ?auto_5632 ) ) ( AVAILABLE ?auto_5632 ) ( SURFACE-AT ?auto_5630 ?auto_5636 ) ( ON ?auto_5630 ?auto_5631 ) ( CLEAR ?auto_5630 ) ( not ( = ?auto_5629 ?auto_5631 ) ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( SURFACE-AT ?auto_5628 ?auto_5633 ) ( CLEAR ?auto_5628 ) ( IS-CRATE ?auto_5629 ) ( AVAILABLE ?auto_5635 ) ( IN ?auto_5629 ?auto_5634 ) ( TRUCK-AT ?auto_5634 ?auto_5636 ) ( ON ?auto_5627 ?auto_5626 ) ( ON ?auto_5628 ?auto_5627 ) ( not ( = ?auto_5626 ?auto_5627 ) ) ( not ( = ?auto_5626 ?auto_5628 ) ) ( not ( = ?auto_5626 ?auto_5629 ) ) ( not ( = ?auto_5626 ?auto_5630 ) ) ( not ( = ?auto_5626 ?auto_5631 ) ) ( not ( = ?auto_5627 ?auto_5628 ) ) ( not ( = ?auto_5627 ?auto_5629 ) ) ( not ( = ?auto_5627 ?auto_5630 ) ) ( not ( = ?auto_5627 ?auto_5631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5628 ?auto_5629 ?auto_5630 )
      ( MAKE-4CRATE-VERIFY ?auto_5626 ?auto_5627 ?auto_5628 ?auto_5629 ?auto_5630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5637 - SURFACE
      ?auto_5638 - SURFACE
    )
    :vars
    (
      ?auto_5644 - HOIST
      ?auto_5642 - PLACE
      ?auto_5640 - SURFACE
      ?auto_5645 - PLACE
      ?auto_5641 - HOIST
      ?auto_5639 - SURFACE
      ?auto_5643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5644 ?auto_5642 ) ( IS-CRATE ?auto_5638 ) ( not ( = ?auto_5637 ?auto_5638 ) ) ( not ( = ?auto_5640 ?auto_5637 ) ) ( not ( = ?auto_5640 ?auto_5638 ) ) ( not ( = ?auto_5645 ?auto_5642 ) ) ( HOIST-AT ?auto_5641 ?auto_5645 ) ( not ( = ?auto_5644 ?auto_5641 ) ) ( SURFACE-AT ?auto_5638 ?auto_5645 ) ( ON ?auto_5638 ?auto_5639 ) ( CLEAR ?auto_5638 ) ( not ( = ?auto_5637 ?auto_5639 ) ) ( not ( = ?auto_5638 ?auto_5639 ) ) ( not ( = ?auto_5640 ?auto_5639 ) ) ( SURFACE-AT ?auto_5640 ?auto_5642 ) ( CLEAR ?auto_5640 ) ( IS-CRATE ?auto_5637 ) ( AVAILABLE ?auto_5644 ) ( TRUCK-AT ?auto_5643 ?auto_5645 ) ( LIFTING ?auto_5641 ?auto_5637 ) )
    :subtasks
    ( ( !LOAD ?auto_5641 ?auto_5637 ?auto_5643 ?auto_5645 )
      ( MAKE-2CRATE ?auto_5640 ?auto_5637 ?auto_5638 )
      ( MAKE-1CRATE-VERIFY ?auto_5637 ?auto_5638 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5646 - SURFACE
      ?auto_5647 - SURFACE
      ?auto_5648 - SURFACE
    )
    :vars
    (
      ?auto_5649 - HOIST
      ?auto_5650 - PLACE
      ?auto_5654 - PLACE
      ?auto_5651 - HOIST
      ?auto_5652 - SURFACE
      ?auto_5653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5649 ?auto_5650 ) ( IS-CRATE ?auto_5648 ) ( not ( = ?auto_5647 ?auto_5648 ) ) ( not ( = ?auto_5646 ?auto_5647 ) ) ( not ( = ?auto_5646 ?auto_5648 ) ) ( not ( = ?auto_5654 ?auto_5650 ) ) ( HOIST-AT ?auto_5651 ?auto_5654 ) ( not ( = ?auto_5649 ?auto_5651 ) ) ( SURFACE-AT ?auto_5648 ?auto_5654 ) ( ON ?auto_5648 ?auto_5652 ) ( CLEAR ?auto_5648 ) ( not ( = ?auto_5647 ?auto_5652 ) ) ( not ( = ?auto_5648 ?auto_5652 ) ) ( not ( = ?auto_5646 ?auto_5652 ) ) ( SURFACE-AT ?auto_5646 ?auto_5650 ) ( CLEAR ?auto_5646 ) ( IS-CRATE ?auto_5647 ) ( AVAILABLE ?auto_5649 ) ( TRUCK-AT ?auto_5653 ?auto_5654 ) ( LIFTING ?auto_5651 ?auto_5647 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5647 ?auto_5648 )
      ( MAKE-2CRATE-VERIFY ?auto_5646 ?auto_5647 ?auto_5648 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5655 - SURFACE
      ?auto_5656 - SURFACE
      ?auto_5657 - SURFACE
      ?auto_5658 - SURFACE
    )
    :vars
    (
      ?auto_5664 - HOIST
      ?auto_5659 - PLACE
      ?auto_5660 - PLACE
      ?auto_5662 - HOIST
      ?auto_5663 - SURFACE
      ?auto_5661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5664 ?auto_5659 ) ( IS-CRATE ?auto_5658 ) ( not ( = ?auto_5657 ?auto_5658 ) ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( not ( = ?auto_5656 ?auto_5658 ) ) ( not ( = ?auto_5660 ?auto_5659 ) ) ( HOIST-AT ?auto_5662 ?auto_5660 ) ( not ( = ?auto_5664 ?auto_5662 ) ) ( SURFACE-AT ?auto_5658 ?auto_5660 ) ( ON ?auto_5658 ?auto_5663 ) ( CLEAR ?auto_5658 ) ( not ( = ?auto_5657 ?auto_5663 ) ) ( not ( = ?auto_5658 ?auto_5663 ) ) ( not ( = ?auto_5656 ?auto_5663 ) ) ( SURFACE-AT ?auto_5656 ?auto_5659 ) ( CLEAR ?auto_5656 ) ( IS-CRATE ?auto_5657 ) ( AVAILABLE ?auto_5664 ) ( TRUCK-AT ?auto_5661 ?auto_5660 ) ( LIFTING ?auto_5662 ?auto_5657 ) ( ON ?auto_5656 ?auto_5655 ) ( not ( = ?auto_5655 ?auto_5656 ) ) ( not ( = ?auto_5655 ?auto_5657 ) ) ( not ( = ?auto_5655 ?auto_5658 ) ) ( not ( = ?auto_5655 ?auto_5663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5656 ?auto_5657 ?auto_5658 )
      ( MAKE-3CRATE-VERIFY ?auto_5655 ?auto_5656 ?auto_5657 ?auto_5658 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5665 - SURFACE
      ?auto_5666 - SURFACE
      ?auto_5667 - SURFACE
      ?auto_5668 - SURFACE
      ?auto_5669 - SURFACE
    )
    :vars
    (
      ?auto_5675 - HOIST
      ?auto_5670 - PLACE
      ?auto_5671 - PLACE
      ?auto_5673 - HOIST
      ?auto_5674 - SURFACE
      ?auto_5672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5675 ?auto_5670 ) ( IS-CRATE ?auto_5669 ) ( not ( = ?auto_5668 ?auto_5669 ) ) ( not ( = ?auto_5667 ?auto_5668 ) ) ( not ( = ?auto_5667 ?auto_5669 ) ) ( not ( = ?auto_5671 ?auto_5670 ) ) ( HOIST-AT ?auto_5673 ?auto_5671 ) ( not ( = ?auto_5675 ?auto_5673 ) ) ( SURFACE-AT ?auto_5669 ?auto_5671 ) ( ON ?auto_5669 ?auto_5674 ) ( CLEAR ?auto_5669 ) ( not ( = ?auto_5668 ?auto_5674 ) ) ( not ( = ?auto_5669 ?auto_5674 ) ) ( not ( = ?auto_5667 ?auto_5674 ) ) ( SURFACE-AT ?auto_5667 ?auto_5670 ) ( CLEAR ?auto_5667 ) ( IS-CRATE ?auto_5668 ) ( AVAILABLE ?auto_5675 ) ( TRUCK-AT ?auto_5672 ?auto_5671 ) ( LIFTING ?auto_5673 ?auto_5668 ) ( ON ?auto_5666 ?auto_5665 ) ( ON ?auto_5667 ?auto_5666 ) ( not ( = ?auto_5665 ?auto_5666 ) ) ( not ( = ?auto_5665 ?auto_5667 ) ) ( not ( = ?auto_5665 ?auto_5668 ) ) ( not ( = ?auto_5665 ?auto_5669 ) ) ( not ( = ?auto_5665 ?auto_5674 ) ) ( not ( = ?auto_5666 ?auto_5667 ) ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( not ( = ?auto_5666 ?auto_5669 ) ) ( not ( = ?auto_5666 ?auto_5674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5667 ?auto_5668 ?auto_5669 )
      ( MAKE-4CRATE-VERIFY ?auto_5665 ?auto_5666 ?auto_5667 ?auto_5668 ?auto_5669 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5676 - SURFACE
      ?auto_5677 - SURFACE
    )
    :vars
    (
      ?auto_5684 - HOIST
      ?auto_5678 - PLACE
      ?auto_5683 - SURFACE
      ?auto_5679 - PLACE
      ?auto_5681 - HOIST
      ?auto_5682 - SURFACE
      ?auto_5680 - TRUCK
      ?auto_5685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5684 ?auto_5678 ) ( IS-CRATE ?auto_5677 ) ( not ( = ?auto_5676 ?auto_5677 ) ) ( not ( = ?auto_5683 ?auto_5676 ) ) ( not ( = ?auto_5683 ?auto_5677 ) ) ( not ( = ?auto_5679 ?auto_5678 ) ) ( HOIST-AT ?auto_5681 ?auto_5679 ) ( not ( = ?auto_5684 ?auto_5681 ) ) ( SURFACE-AT ?auto_5677 ?auto_5679 ) ( ON ?auto_5677 ?auto_5682 ) ( CLEAR ?auto_5677 ) ( not ( = ?auto_5676 ?auto_5682 ) ) ( not ( = ?auto_5677 ?auto_5682 ) ) ( not ( = ?auto_5683 ?auto_5682 ) ) ( SURFACE-AT ?auto_5683 ?auto_5678 ) ( CLEAR ?auto_5683 ) ( IS-CRATE ?auto_5676 ) ( AVAILABLE ?auto_5684 ) ( TRUCK-AT ?auto_5680 ?auto_5679 ) ( AVAILABLE ?auto_5681 ) ( SURFACE-AT ?auto_5676 ?auto_5679 ) ( ON ?auto_5676 ?auto_5685 ) ( CLEAR ?auto_5676 ) ( not ( = ?auto_5676 ?auto_5685 ) ) ( not ( = ?auto_5677 ?auto_5685 ) ) ( not ( = ?auto_5683 ?auto_5685 ) ) ( not ( = ?auto_5682 ?auto_5685 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5681 ?auto_5676 ?auto_5685 ?auto_5679 )
      ( MAKE-2CRATE ?auto_5683 ?auto_5676 ?auto_5677 )
      ( MAKE-1CRATE-VERIFY ?auto_5676 ?auto_5677 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5686 - SURFACE
      ?auto_5687 - SURFACE
      ?auto_5688 - SURFACE
    )
    :vars
    (
      ?auto_5692 - HOIST
      ?auto_5693 - PLACE
      ?auto_5690 - PLACE
      ?auto_5695 - HOIST
      ?auto_5694 - SURFACE
      ?auto_5689 - TRUCK
      ?auto_5691 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5692 ?auto_5693 ) ( IS-CRATE ?auto_5688 ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( not ( = ?auto_5686 ?auto_5687 ) ) ( not ( = ?auto_5686 ?auto_5688 ) ) ( not ( = ?auto_5690 ?auto_5693 ) ) ( HOIST-AT ?auto_5695 ?auto_5690 ) ( not ( = ?auto_5692 ?auto_5695 ) ) ( SURFACE-AT ?auto_5688 ?auto_5690 ) ( ON ?auto_5688 ?auto_5694 ) ( CLEAR ?auto_5688 ) ( not ( = ?auto_5687 ?auto_5694 ) ) ( not ( = ?auto_5688 ?auto_5694 ) ) ( not ( = ?auto_5686 ?auto_5694 ) ) ( SURFACE-AT ?auto_5686 ?auto_5693 ) ( CLEAR ?auto_5686 ) ( IS-CRATE ?auto_5687 ) ( AVAILABLE ?auto_5692 ) ( TRUCK-AT ?auto_5689 ?auto_5690 ) ( AVAILABLE ?auto_5695 ) ( SURFACE-AT ?auto_5687 ?auto_5690 ) ( ON ?auto_5687 ?auto_5691 ) ( CLEAR ?auto_5687 ) ( not ( = ?auto_5687 ?auto_5691 ) ) ( not ( = ?auto_5688 ?auto_5691 ) ) ( not ( = ?auto_5686 ?auto_5691 ) ) ( not ( = ?auto_5694 ?auto_5691 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5687 ?auto_5688 )
      ( MAKE-2CRATE-VERIFY ?auto_5686 ?auto_5687 ?auto_5688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5696 - SURFACE
      ?auto_5697 - SURFACE
      ?auto_5698 - SURFACE
      ?auto_5699 - SURFACE
    )
    :vars
    (
      ?auto_5701 - HOIST
      ?auto_5702 - PLACE
      ?auto_5703 - PLACE
      ?auto_5705 - HOIST
      ?auto_5706 - SURFACE
      ?auto_5700 - TRUCK
      ?auto_5704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5701 ?auto_5702 ) ( IS-CRATE ?auto_5699 ) ( not ( = ?auto_5698 ?auto_5699 ) ) ( not ( = ?auto_5697 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5699 ) ) ( not ( = ?auto_5703 ?auto_5702 ) ) ( HOIST-AT ?auto_5705 ?auto_5703 ) ( not ( = ?auto_5701 ?auto_5705 ) ) ( SURFACE-AT ?auto_5699 ?auto_5703 ) ( ON ?auto_5699 ?auto_5706 ) ( CLEAR ?auto_5699 ) ( not ( = ?auto_5698 ?auto_5706 ) ) ( not ( = ?auto_5699 ?auto_5706 ) ) ( not ( = ?auto_5697 ?auto_5706 ) ) ( SURFACE-AT ?auto_5697 ?auto_5702 ) ( CLEAR ?auto_5697 ) ( IS-CRATE ?auto_5698 ) ( AVAILABLE ?auto_5701 ) ( TRUCK-AT ?auto_5700 ?auto_5703 ) ( AVAILABLE ?auto_5705 ) ( SURFACE-AT ?auto_5698 ?auto_5703 ) ( ON ?auto_5698 ?auto_5704 ) ( CLEAR ?auto_5698 ) ( not ( = ?auto_5698 ?auto_5704 ) ) ( not ( = ?auto_5699 ?auto_5704 ) ) ( not ( = ?auto_5697 ?auto_5704 ) ) ( not ( = ?auto_5706 ?auto_5704 ) ) ( ON ?auto_5697 ?auto_5696 ) ( not ( = ?auto_5696 ?auto_5697 ) ) ( not ( = ?auto_5696 ?auto_5698 ) ) ( not ( = ?auto_5696 ?auto_5699 ) ) ( not ( = ?auto_5696 ?auto_5706 ) ) ( not ( = ?auto_5696 ?auto_5704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5697 ?auto_5698 ?auto_5699 )
      ( MAKE-3CRATE-VERIFY ?auto_5696 ?auto_5697 ?auto_5698 ?auto_5699 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5707 - SURFACE
      ?auto_5708 - SURFACE
      ?auto_5709 - SURFACE
      ?auto_5710 - SURFACE
      ?auto_5711 - SURFACE
    )
    :vars
    (
      ?auto_5713 - HOIST
      ?auto_5714 - PLACE
      ?auto_5715 - PLACE
      ?auto_5717 - HOIST
      ?auto_5718 - SURFACE
      ?auto_5712 - TRUCK
      ?auto_5716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5713 ?auto_5714 ) ( IS-CRATE ?auto_5711 ) ( not ( = ?auto_5710 ?auto_5711 ) ) ( not ( = ?auto_5709 ?auto_5710 ) ) ( not ( = ?auto_5709 ?auto_5711 ) ) ( not ( = ?auto_5715 ?auto_5714 ) ) ( HOIST-AT ?auto_5717 ?auto_5715 ) ( not ( = ?auto_5713 ?auto_5717 ) ) ( SURFACE-AT ?auto_5711 ?auto_5715 ) ( ON ?auto_5711 ?auto_5718 ) ( CLEAR ?auto_5711 ) ( not ( = ?auto_5710 ?auto_5718 ) ) ( not ( = ?auto_5711 ?auto_5718 ) ) ( not ( = ?auto_5709 ?auto_5718 ) ) ( SURFACE-AT ?auto_5709 ?auto_5714 ) ( CLEAR ?auto_5709 ) ( IS-CRATE ?auto_5710 ) ( AVAILABLE ?auto_5713 ) ( TRUCK-AT ?auto_5712 ?auto_5715 ) ( AVAILABLE ?auto_5717 ) ( SURFACE-AT ?auto_5710 ?auto_5715 ) ( ON ?auto_5710 ?auto_5716 ) ( CLEAR ?auto_5710 ) ( not ( = ?auto_5710 ?auto_5716 ) ) ( not ( = ?auto_5711 ?auto_5716 ) ) ( not ( = ?auto_5709 ?auto_5716 ) ) ( not ( = ?auto_5718 ?auto_5716 ) ) ( ON ?auto_5708 ?auto_5707 ) ( ON ?auto_5709 ?auto_5708 ) ( not ( = ?auto_5707 ?auto_5708 ) ) ( not ( = ?auto_5707 ?auto_5709 ) ) ( not ( = ?auto_5707 ?auto_5710 ) ) ( not ( = ?auto_5707 ?auto_5711 ) ) ( not ( = ?auto_5707 ?auto_5718 ) ) ( not ( = ?auto_5707 ?auto_5716 ) ) ( not ( = ?auto_5708 ?auto_5709 ) ) ( not ( = ?auto_5708 ?auto_5710 ) ) ( not ( = ?auto_5708 ?auto_5711 ) ) ( not ( = ?auto_5708 ?auto_5718 ) ) ( not ( = ?auto_5708 ?auto_5716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5709 ?auto_5710 ?auto_5711 )
      ( MAKE-4CRATE-VERIFY ?auto_5707 ?auto_5708 ?auto_5709 ?auto_5710 ?auto_5711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5719 - SURFACE
      ?auto_5720 - SURFACE
    )
    :vars
    (
      ?auto_5722 - HOIST
      ?auto_5723 - PLACE
      ?auto_5728 - SURFACE
      ?auto_5724 - PLACE
      ?auto_5726 - HOIST
      ?auto_5727 - SURFACE
      ?auto_5725 - SURFACE
      ?auto_5721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5722 ?auto_5723 ) ( IS-CRATE ?auto_5720 ) ( not ( = ?auto_5719 ?auto_5720 ) ) ( not ( = ?auto_5728 ?auto_5719 ) ) ( not ( = ?auto_5728 ?auto_5720 ) ) ( not ( = ?auto_5724 ?auto_5723 ) ) ( HOIST-AT ?auto_5726 ?auto_5724 ) ( not ( = ?auto_5722 ?auto_5726 ) ) ( SURFACE-AT ?auto_5720 ?auto_5724 ) ( ON ?auto_5720 ?auto_5727 ) ( CLEAR ?auto_5720 ) ( not ( = ?auto_5719 ?auto_5727 ) ) ( not ( = ?auto_5720 ?auto_5727 ) ) ( not ( = ?auto_5728 ?auto_5727 ) ) ( SURFACE-AT ?auto_5728 ?auto_5723 ) ( CLEAR ?auto_5728 ) ( IS-CRATE ?auto_5719 ) ( AVAILABLE ?auto_5722 ) ( AVAILABLE ?auto_5726 ) ( SURFACE-AT ?auto_5719 ?auto_5724 ) ( ON ?auto_5719 ?auto_5725 ) ( CLEAR ?auto_5719 ) ( not ( = ?auto_5719 ?auto_5725 ) ) ( not ( = ?auto_5720 ?auto_5725 ) ) ( not ( = ?auto_5728 ?auto_5725 ) ) ( not ( = ?auto_5727 ?auto_5725 ) ) ( TRUCK-AT ?auto_5721 ?auto_5723 ) )
    :subtasks
    ( ( !DRIVE ?auto_5721 ?auto_5723 ?auto_5724 )
      ( MAKE-2CRATE ?auto_5728 ?auto_5719 ?auto_5720 )
      ( MAKE-1CRATE-VERIFY ?auto_5719 ?auto_5720 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5729 - SURFACE
      ?auto_5730 - SURFACE
      ?auto_5731 - SURFACE
    )
    :vars
    (
      ?auto_5733 - HOIST
      ?auto_5735 - PLACE
      ?auto_5736 - PLACE
      ?auto_5734 - HOIST
      ?auto_5732 - SURFACE
      ?auto_5737 - SURFACE
      ?auto_5738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5733 ?auto_5735 ) ( IS-CRATE ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5731 ) ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( not ( = ?auto_5729 ?auto_5731 ) ) ( not ( = ?auto_5736 ?auto_5735 ) ) ( HOIST-AT ?auto_5734 ?auto_5736 ) ( not ( = ?auto_5733 ?auto_5734 ) ) ( SURFACE-AT ?auto_5731 ?auto_5736 ) ( ON ?auto_5731 ?auto_5732 ) ( CLEAR ?auto_5731 ) ( not ( = ?auto_5730 ?auto_5732 ) ) ( not ( = ?auto_5731 ?auto_5732 ) ) ( not ( = ?auto_5729 ?auto_5732 ) ) ( SURFACE-AT ?auto_5729 ?auto_5735 ) ( CLEAR ?auto_5729 ) ( IS-CRATE ?auto_5730 ) ( AVAILABLE ?auto_5733 ) ( AVAILABLE ?auto_5734 ) ( SURFACE-AT ?auto_5730 ?auto_5736 ) ( ON ?auto_5730 ?auto_5737 ) ( CLEAR ?auto_5730 ) ( not ( = ?auto_5730 ?auto_5737 ) ) ( not ( = ?auto_5731 ?auto_5737 ) ) ( not ( = ?auto_5729 ?auto_5737 ) ) ( not ( = ?auto_5732 ?auto_5737 ) ) ( TRUCK-AT ?auto_5738 ?auto_5735 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5730 ?auto_5731 )
      ( MAKE-2CRATE-VERIFY ?auto_5729 ?auto_5730 ?auto_5731 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5739 - SURFACE
      ?auto_5740 - SURFACE
      ?auto_5741 - SURFACE
      ?auto_5742 - SURFACE
    )
    :vars
    (
      ?auto_5748 - HOIST
      ?auto_5744 - PLACE
      ?auto_5747 - PLACE
      ?auto_5745 - HOIST
      ?auto_5746 - SURFACE
      ?auto_5743 - SURFACE
      ?auto_5749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5748 ?auto_5744 ) ( IS-CRATE ?auto_5742 ) ( not ( = ?auto_5741 ?auto_5742 ) ) ( not ( = ?auto_5740 ?auto_5741 ) ) ( not ( = ?auto_5740 ?auto_5742 ) ) ( not ( = ?auto_5747 ?auto_5744 ) ) ( HOIST-AT ?auto_5745 ?auto_5747 ) ( not ( = ?auto_5748 ?auto_5745 ) ) ( SURFACE-AT ?auto_5742 ?auto_5747 ) ( ON ?auto_5742 ?auto_5746 ) ( CLEAR ?auto_5742 ) ( not ( = ?auto_5741 ?auto_5746 ) ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( not ( = ?auto_5740 ?auto_5746 ) ) ( SURFACE-AT ?auto_5740 ?auto_5744 ) ( CLEAR ?auto_5740 ) ( IS-CRATE ?auto_5741 ) ( AVAILABLE ?auto_5748 ) ( AVAILABLE ?auto_5745 ) ( SURFACE-AT ?auto_5741 ?auto_5747 ) ( ON ?auto_5741 ?auto_5743 ) ( CLEAR ?auto_5741 ) ( not ( = ?auto_5741 ?auto_5743 ) ) ( not ( = ?auto_5742 ?auto_5743 ) ) ( not ( = ?auto_5740 ?auto_5743 ) ) ( not ( = ?auto_5746 ?auto_5743 ) ) ( TRUCK-AT ?auto_5749 ?auto_5744 ) ( ON ?auto_5740 ?auto_5739 ) ( not ( = ?auto_5739 ?auto_5740 ) ) ( not ( = ?auto_5739 ?auto_5741 ) ) ( not ( = ?auto_5739 ?auto_5742 ) ) ( not ( = ?auto_5739 ?auto_5746 ) ) ( not ( = ?auto_5739 ?auto_5743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5740 ?auto_5741 ?auto_5742 )
      ( MAKE-3CRATE-VERIFY ?auto_5739 ?auto_5740 ?auto_5741 ?auto_5742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5750 - SURFACE
      ?auto_5751 - SURFACE
      ?auto_5752 - SURFACE
      ?auto_5753 - SURFACE
      ?auto_5754 - SURFACE
    )
    :vars
    (
      ?auto_5760 - HOIST
      ?auto_5756 - PLACE
      ?auto_5759 - PLACE
      ?auto_5757 - HOIST
      ?auto_5758 - SURFACE
      ?auto_5755 - SURFACE
      ?auto_5761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5760 ?auto_5756 ) ( IS-CRATE ?auto_5754 ) ( not ( = ?auto_5753 ?auto_5754 ) ) ( not ( = ?auto_5752 ?auto_5753 ) ) ( not ( = ?auto_5752 ?auto_5754 ) ) ( not ( = ?auto_5759 ?auto_5756 ) ) ( HOIST-AT ?auto_5757 ?auto_5759 ) ( not ( = ?auto_5760 ?auto_5757 ) ) ( SURFACE-AT ?auto_5754 ?auto_5759 ) ( ON ?auto_5754 ?auto_5758 ) ( CLEAR ?auto_5754 ) ( not ( = ?auto_5753 ?auto_5758 ) ) ( not ( = ?auto_5754 ?auto_5758 ) ) ( not ( = ?auto_5752 ?auto_5758 ) ) ( SURFACE-AT ?auto_5752 ?auto_5756 ) ( CLEAR ?auto_5752 ) ( IS-CRATE ?auto_5753 ) ( AVAILABLE ?auto_5760 ) ( AVAILABLE ?auto_5757 ) ( SURFACE-AT ?auto_5753 ?auto_5759 ) ( ON ?auto_5753 ?auto_5755 ) ( CLEAR ?auto_5753 ) ( not ( = ?auto_5753 ?auto_5755 ) ) ( not ( = ?auto_5754 ?auto_5755 ) ) ( not ( = ?auto_5752 ?auto_5755 ) ) ( not ( = ?auto_5758 ?auto_5755 ) ) ( TRUCK-AT ?auto_5761 ?auto_5756 ) ( ON ?auto_5751 ?auto_5750 ) ( ON ?auto_5752 ?auto_5751 ) ( not ( = ?auto_5750 ?auto_5751 ) ) ( not ( = ?auto_5750 ?auto_5752 ) ) ( not ( = ?auto_5750 ?auto_5753 ) ) ( not ( = ?auto_5750 ?auto_5754 ) ) ( not ( = ?auto_5750 ?auto_5758 ) ) ( not ( = ?auto_5750 ?auto_5755 ) ) ( not ( = ?auto_5751 ?auto_5752 ) ) ( not ( = ?auto_5751 ?auto_5753 ) ) ( not ( = ?auto_5751 ?auto_5754 ) ) ( not ( = ?auto_5751 ?auto_5758 ) ) ( not ( = ?auto_5751 ?auto_5755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5752 ?auto_5753 ?auto_5754 )
      ( MAKE-4CRATE-VERIFY ?auto_5750 ?auto_5751 ?auto_5752 ?auto_5753 ?auto_5754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5762 - SURFACE
      ?auto_5763 - SURFACE
    )
    :vars
    (
      ?auto_5769 - HOIST
      ?auto_5765 - PLACE
      ?auto_5771 - SURFACE
      ?auto_5768 - PLACE
      ?auto_5766 - HOIST
      ?auto_5767 - SURFACE
      ?auto_5764 - SURFACE
      ?auto_5770 - TRUCK
      ?auto_5772 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5769 ?auto_5765 ) ( IS-CRATE ?auto_5763 ) ( not ( = ?auto_5762 ?auto_5763 ) ) ( not ( = ?auto_5771 ?auto_5762 ) ) ( not ( = ?auto_5771 ?auto_5763 ) ) ( not ( = ?auto_5768 ?auto_5765 ) ) ( HOIST-AT ?auto_5766 ?auto_5768 ) ( not ( = ?auto_5769 ?auto_5766 ) ) ( SURFACE-AT ?auto_5763 ?auto_5768 ) ( ON ?auto_5763 ?auto_5767 ) ( CLEAR ?auto_5763 ) ( not ( = ?auto_5762 ?auto_5767 ) ) ( not ( = ?auto_5763 ?auto_5767 ) ) ( not ( = ?auto_5771 ?auto_5767 ) ) ( IS-CRATE ?auto_5762 ) ( AVAILABLE ?auto_5766 ) ( SURFACE-AT ?auto_5762 ?auto_5768 ) ( ON ?auto_5762 ?auto_5764 ) ( CLEAR ?auto_5762 ) ( not ( = ?auto_5762 ?auto_5764 ) ) ( not ( = ?auto_5763 ?auto_5764 ) ) ( not ( = ?auto_5771 ?auto_5764 ) ) ( not ( = ?auto_5767 ?auto_5764 ) ) ( TRUCK-AT ?auto_5770 ?auto_5765 ) ( SURFACE-AT ?auto_5772 ?auto_5765 ) ( CLEAR ?auto_5772 ) ( LIFTING ?auto_5769 ?auto_5771 ) ( IS-CRATE ?auto_5771 ) ( not ( = ?auto_5772 ?auto_5771 ) ) ( not ( = ?auto_5762 ?auto_5772 ) ) ( not ( = ?auto_5763 ?auto_5772 ) ) ( not ( = ?auto_5767 ?auto_5772 ) ) ( not ( = ?auto_5764 ?auto_5772 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5772 ?auto_5771 )
      ( MAKE-2CRATE ?auto_5771 ?auto_5762 ?auto_5763 )
      ( MAKE-1CRATE-VERIFY ?auto_5762 ?auto_5763 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5773 - SURFACE
      ?auto_5774 - SURFACE
      ?auto_5775 - SURFACE
    )
    :vars
    (
      ?auto_5776 - HOIST
      ?auto_5783 - PLACE
      ?auto_5782 - PLACE
      ?auto_5781 - HOIST
      ?auto_5777 - SURFACE
      ?auto_5779 - SURFACE
      ?auto_5778 - TRUCK
      ?auto_5780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5776 ?auto_5783 ) ( IS-CRATE ?auto_5775 ) ( not ( = ?auto_5774 ?auto_5775 ) ) ( not ( = ?auto_5773 ?auto_5774 ) ) ( not ( = ?auto_5773 ?auto_5775 ) ) ( not ( = ?auto_5782 ?auto_5783 ) ) ( HOIST-AT ?auto_5781 ?auto_5782 ) ( not ( = ?auto_5776 ?auto_5781 ) ) ( SURFACE-AT ?auto_5775 ?auto_5782 ) ( ON ?auto_5775 ?auto_5777 ) ( CLEAR ?auto_5775 ) ( not ( = ?auto_5774 ?auto_5777 ) ) ( not ( = ?auto_5775 ?auto_5777 ) ) ( not ( = ?auto_5773 ?auto_5777 ) ) ( IS-CRATE ?auto_5774 ) ( AVAILABLE ?auto_5781 ) ( SURFACE-AT ?auto_5774 ?auto_5782 ) ( ON ?auto_5774 ?auto_5779 ) ( CLEAR ?auto_5774 ) ( not ( = ?auto_5774 ?auto_5779 ) ) ( not ( = ?auto_5775 ?auto_5779 ) ) ( not ( = ?auto_5773 ?auto_5779 ) ) ( not ( = ?auto_5777 ?auto_5779 ) ) ( TRUCK-AT ?auto_5778 ?auto_5783 ) ( SURFACE-AT ?auto_5780 ?auto_5783 ) ( CLEAR ?auto_5780 ) ( LIFTING ?auto_5776 ?auto_5773 ) ( IS-CRATE ?auto_5773 ) ( not ( = ?auto_5780 ?auto_5773 ) ) ( not ( = ?auto_5774 ?auto_5780 ) ) ( not ( = ?auto_5775 ?auto_5780 ) ) ( not ( = ?auto_5777 ?auto_5780 ) ) ( not ( = ?auto_5779 ?auto_5780 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5774 ?auto_5775 )
      ( MAKE-2CRATE-VERIFY ?auto_5773 ?auto_5774 ?auto_5775 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5784 - SURFACE
      ?auto_5785 - SURFACE
      ?auto_5786 - SURFACE
      ?auto_5787 - SURFACE
    )
    :vars
    (
      ?auto_5789 - HOIST
      ?auto_5794 - PLACE
      ?auto_5792 - PLACE
      ?auto_5790 - HOIST
      ?auto_5788 - SURFACE
      ?auto_5793 - SURFACE
      ?auto_5791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5789 ?auto_5794 ) ( IS-CRATE ?auto_5787 ) ( not ( = ?auto_5786 ?auto_5787 ) ) ( not ( = ?auto_5785 ?auto_5786 ) ) ( not ( = ?auto_5785 ?auto_5787 ) ) ( not ( = ?auto_5792 ?auto_5794 ) ) ( HOIST-AT ?auto_5790 ?auto_5792 ) ( not ( = ?auto_5789 ?auto_5790 ) ) ( SURFACE-AT ?auto_5787 ?auto_5792 ) ( ON ?auto_5787 ?auto_5788 ) ( CLEAR ?auto_5787 ) ( not ( = ?auto_5786 ?auto_5788 ) ) ( not ( = ?auto_5787 ?auto_5788 ) ) ( not ( = ?auto_5785 ?auto_5788 ) ) ( IS-CRATE ?auto_5786 ) ( AVAILABLE ?auto_5790 ) ( SURFACE-AT ?auto_5786 ?auto_5792 ) ( ON ?auto_5786 ?auto_5793 ) ( CLEAR ?auto_5786 ) ( not ( = ?auto_5786 ?auto_5793 ) ) ( not ( = ?auto_5787 ?auto_5793 ) ) ( not ( = ?auto_5785 ?auto_5793 ) ) ( not ( = ?auto_5788 ?auto_5793 ) ) ( TRUCK-AT ?auto_5791 ?auto_5794 ) ( SURFACE-AT ?auto_5784 ?auto_5794 ) ( CLEAR ?auto_5784 ) ( LIFTING ?auto_5789 ?auto_5785 ) ( IS-CRATE ?auto_5785 ) ( not ( = ?auto_5784 ?auto_5785 ) ) ( not ( = ?auto_5786 ?auto_5784 ) ) ( not ( = ?auto_5787 ?auto_5784 ) ) ( not ( = ?auto_5788 ?auto_5784 ) ) ( not ( = ?auto_5793 ?auto_5784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5785 ?auto_5786 ?auto_5787 )
      ( MAKE-3CRATE-VERIFY ?auto_5784 ?auto_5785 ?auto_5786 ?auto_5787 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5795 - SURFACE
      ?auto_5796 - SURFACE
      ?auto_5797 - SURFACE
      ?auto_5798 - SURFACE
      ?auto_5799 - SURFACE
    )
    :vars
    (
      ?auto_5801 - HOIST
      ?auto_5806 - PLACE
      ?auto_5804 - PLACE
      ?auto_5802 - HOIST
      ?auto_5800 - SURFACE
      ?auto_5805 - SURFACE
      ?auto_5803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5801 ?auto_5806 ) ( IS-CRATE ?auto_5799 ) ( not ( = ?auto_5798 ?auto_5799 ) ) ( not ( = ?auto_5797 ?auto_5798 ) ) ( not ( = ?auto_5797 ?auto_5799 ) ) ( not ( = ?auto_5804 ?auto_5806 ) ) ( HOIST-AT ?auto_5802 ?auto_5804 ) ( not ( = ?auto_5801 ?auto_5802 ) ) ( SURFACE-AT ?auto_5799 ?auto_5804 ) ( ON ?auto_5799 ?auto_5800 ) ( CLEAR ?auto_5799 ) ( not ( = ?auto_5798 ?auto_5800 ) ) ( not ( = ?auto_5799 ?auto_5800 ) ) ( not ( = ?auto_5797 ?auto_5800 ) ) ( IS-CRATE ?auto_5798 ) ( AVAILABLE ?auto_5802 ) ( SURFACE-AT ?auto_5798 ?auto_5804 ) ( ON ?auto_5798 ?auto_5805 ) ( CLEAR ?auto_5798 ) ( not ( = ?auto_5798 ?auto_5805 ) ) ( not ( = ?auto_5799 ?auto_5805 ) ) ( not ( = ?auto_5797 ?auto_5805 ) ) ( not ( = ?auto_5800 ?auto_5805 ) ) ( TRUCK-AT ?auto_5803 ?auto_5806 ) ( SURFACE-AT ?auto_5796 ?auto_5806 ) ( CLEAR ?auto_5796 ) ( LIFTING ?auto_5801 ?auto_5797 ) ( IS-CRATE ?auto_5797 ) ( not ( = ?auto_5796 ?auto_5797 ) ) ( not ( = ?auto_5798 ?auto_5796 ) ) ( not ( = ?auto_5799 ?auto_5796 ) ) ( not ( = ?auto_5800 ?auto_5796 ) ) ( not ( = ?auto_5805 ?auto_5796 ) ) ( ON ?auto_5796 ?auto_5795 ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( not ( = ?auto_5795 ?auto_5797 ) ) ( not ( = ?auto_5795 ?auto_5798 ) ) ( not ( = ?auto_5795 ?auto_5799 ) ) ( not ( = ?auto_5795 ?auto_5800 ) ) ( not ( = ?auto_5795 ?auto_5805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5797 ?auto_5798 ?auto_5799 )
      ( MAKE-4CRATE-VERIFY ?auto_5795 ?auto_5796 ?auto_5797 ?auto_5798 ?auto_5799 ) )
  )

)

