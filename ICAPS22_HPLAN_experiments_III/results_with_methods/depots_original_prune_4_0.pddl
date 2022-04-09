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
      ?auto_4594 - SURFACE
      ?auto_4595 - SURFACE
    )
    :vars
    (
      ?auto_4596 - HOIST
      ?auto_4597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4596 ?auto_4597 ) ( SURFACE-AT ?auto_4594 ?auto_4597 ) ( CLEAR ?auto_4594 ) ( LIFTING ?auto_4596 ?auto_4595 ) ( IS-CRATE ?auto_4595 ) ( not ( = ?auto_4594 ?auto_4595 ) ) )
    :subtasks
    ( ( !DROP ?auto_4596 ?auto_4595 ?auto_4594 ?auto_4597 )
      ( MAKE-1CRATE-VERIFY ?auto_4594 ?auto_4595 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4598 - SURFACE
      ?auto_4599 - SURFACE
    )
    :vars
    (
      ?auto_4600 - HOIST
      ?auto_4601 - PLACE
      ?auto_4602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4600 ?auto_4601 ) ( SURFACE-AT ?auto_4598 ?auto_4601 ) ( CLEAR ?auto_4598 ) ( IS-CRATE ?auto_4599 ) ( not ( = ?auto_4598 ?auto_4599 ) ) ( TRUCK-AT ?auto_4602 ?auto_4601 ) ( AVAILABLE ?auto_4600 ) ( IN ?auto_4599 ?auto_4602 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4600 ?auto_4599 ?auto_4602 ?auto_4601 )
      ( MAKE-1CRATE ?auto_4598 ?auto_4599 )
      ( MAKE-1CRATE-VERIFY ?auto_4598 ?auto_4599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4603 - SURFACE
      ?auto_4604 - SURFACE
    )
    :vars
    (
      ?auto_4607 - HOIST
      ?auto_4606 - PLACE
      ?auto_4605 - TRUCK
      ?auto_4608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4607 ?auto_4606 ) ( SURFACE-AT ?auto_4603 ?auto_4606 ) ( CLEAR ?auto_4603 ) ( IS-CRATE ?auto_4604 ) ( not ( = ?auto_4603 ?auto_4604 ) ) ( AVAILABLE ?auto_4607 ) ( IN ?auto_4604 ?auto_4605 ) ( TRUCK-AT ?auto_4605 ?auto_4608 ) ( not ( = ?auto_4608 ?auto_4606 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4605 ?auto_4608 ?auto_4606 )
      ( MAKE-1CRATE ?auto_4603 ?auto_4604 )
      ( MAKE-1CRATE-VERIFY ?auto_4603 ?auto_4604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4609 - SURFACE
      ?auto_4610 - SURFACE
    )
    :vars
    (
      ?auto_4612 - HOIST
      ?auto_4611 - PLACE
      ?auto_4614 - TRUCK
      ?auto_4613 - PLACE
      ?auto_4615 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4612 ?auto_4611 ) ( SURFACE-AT ?auto_4609 ?auto_4611 ) ( CLEAR ?auto_4609 ) ( IS-CRATE ?auto_4610 ) ( not ( = ?auto_4609 ?auto_4610 ) ) ( AVAILABLE ?auto_4612 ) ( TRUCK-AT ?auto_4614 ?auto_4613 ) ( not ( = ?auto_4613 ?auto_4611 ) ) ( HOIST-AT ?auto_4615 ?auto_4613 ) ( LIFTING ?auto_4615 ?auto_4610 ) ( not ( = ?auto_4612 ?auto_4615 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4615 ?auto_4610 ?auto_4614 ?auto_4613 )
      ( MAKE-1CRATE ?auto_4609 ?auto_4610 )
      ( MAKE-1CRATE-VERIFY ?auto_4609 ?auto_4610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4616 - SURFACE
      ?auto_4617 - SURFACE
    )
    :vars
    (
      ?auto_4620 - HOIST
      ?auto_4619 - PLACE
      ?auto_4621 - TRUCK
      ?auto_4618 - PLACE
      ?auto_4622 - HOIST
      ?auto_4623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4620 ?auto_4619 ) ( SURFACE-AT ?auto_4616 ?auto_4619 ) ( CLEAR ?auto_4616 ) ( IS-CRATE ?auto_4617 ) ( not ( = ?auto_4616 ?auto_4617 ) ) ( AVAILABLE ?auto_4620 ) ( TRUCK-AT ?auto_4621 ?auto_4618 ) ( not ( = ?auto_4618 ?auto_4619 ) ) ( HOIST-AT ?auto_4622 ?auto_4618 ) ( not ( = ?auto_4620 ?auto_4622 ) ) ( AVAILABLE ?auto_4622 ) ( SURFACE-AT ?auto_4617 ?auto_4618 ) ( ON ?auto_4617 ?auto_4623 ) ( CLEAR ?auto_4617 ) ( not ( = ?auto_4616 ?auto_4623 ) ) ( not ( = ?auto_4617 ?auto_4623 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4622 ?auto_4617 ?auto_4623 ?auto_4618 )
      ( MAKE-1CRATE ?auto_4616 ?auto_4617 )
      ( MAKE-1CRATE-VERIFY ?auto_4616 ?auto_4617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4624 - SURFACE
      ?auto_4625 - SURFACE
    )
    :vars
    (
      ?auto_4626 - HOIST
      ?auto_4627 - PLACE
      ?auto_4629 - PLACE
      ?auto_4628 - HOIST
      ?auto_4631 - SURFACE
      ?auto_4630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4626 ?auto_4627 ) ( SURFACE-AT ?auto_4624 ?auto_4627 ) ( CLEAR ?auto_4624 ) ( IS-CRATE ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4625 ) ) ( AVAILABLE ?auto_4626 ) ( not ( = ?auto_4629 ?auto_4627 ) ) ( HOIST-AT ?auto_4628 ?auto_4629 ) ( not ( = ?auto_4626 ?auto_4628 ) ) ( AVAILABLE ?auto_4628 ) ( SURFACE-AT ?auto_4625 ?auto_4629 ) ( ON ?auto_4625 ?auto_4631 ) ( CLEAR ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4631 ) ) ( not ( = ?auto_4625 ?auto_4631 ) ) ( TRUCK-AT ?auto_4630 ?auto_4627 ) )
    :subtasks
    ( ( !DRIVE ?auto_4630 ?auto_4627 ?auto_4629 )
      ( MAKE-1CRATE ?auto_4624 ?auto_4625 )
      ( MAKE-1CRATE-VERIFY ?auto_4624 ?auto_4625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4641 - SURFACE
      ?auto_4642 - SURFACE
      ?auto_4643 - SURFACE
    )
    :vars
    (
      ?auto_4645 - HOIST
      ?auto_4644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4645 ?auto_4644 ) ( SURFACE-AT ?auto_4642 ?auto_4644 ) ( CLEAR ?auto_4642 ) ( LIFTING ?auto_4645 ?auto_4643 ) ( IS-CRATE ?auto_4643 ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( ON ?auto_4642 ?auto_4641 ) ( not ( = ?auto_4641 ?auto_4642 ) ) ( not ( = ?auto_4641 ?auto_4643 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4642 ?auto_4643 )
      ( MAKE-2CRATE-VERIFY ?auto_4641 ?auto_4642 ?auto_4643 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4651 - SURFACE
      ?auto_4652 - SURFACE
      ?auto_4653 - SURFACE
    )
    :vars
    (
      ?auto_4654 - HOIST
      ?auto_4655 - PLACE
      ?auto_4656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4654 ?auto_4655 ) ( SURFACE-AT ?auto_4652 ?auto_4655 ) ( CLEAR ?auto_4652 ) ( IS-CRATE ?auto_4653 ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( TRUCK-AT ?auto_4656 ?auto_4655 ) ( AVAILABLE ?auto_4654 ) ( IN ?auto_4653 ?auto_4656 ) ( ON ?auto_4652 ?auto_4651 ) ( not ( = ?auto_4651 ?auto_4652 ) ) ( not ( = ?auto_4651 ?auto_4653 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4652 ?auto_4653 )
      ( MAKE-2CRATE-VERIFY ?auto_4651 ?auto_4652 ?auto_4653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4657 - SURFACE
      ?auto_4658 - SURFACE
    )
    :vars
    (
      ?auto_4661 - HOIST
      ?auto_4660 - PLACE
      ?auto_4662 - TRUCK
      ?auto_4659 - SURFACE
      ?auto_4663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4661 ?auto_4660 ) ( SURFACE-AT ?auto_4657 ?auto_4660 ) ( CLEAR ?auto_4657 ) ( IS-CRATE ?auto_4658 ) ( not ( = ?auto_4657 ?auto_4658 ) ) ( AVAILABLE ?auto_4661 ) ( IN ?auto_4658 ?auto_4662 ) ( ON ?auto_4657 ?auto_4659 ) ( not ( = ?auto_4659 ?auto_4657 ) ) ( not ( = ?auto_4659 ?auto_4658 ) ) ( TRUCK-AT ?auto_4662 ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4660 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4662 ?auto_4663 ?auto_4660 )
      ( MAKE-2CRATE ?auto_4659 ?auto_4657 ?auto_4658 )
      ( MAKE-1CRATE-VERIFY ?auto_4657 ?auto_4658 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4664 - SURFACE
      ?auto_4665 - SURFACE
      ?auto_4666 - SURFACE
    )
    :vars
    (
      ?auto_4669 - HOIST
      ?auto_4670 - PLACE
      ?auto_4668 - TRUCK
      ?auto_4667 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4669 ?auto_4670 ) ( SURFACE-AT ?auto_4665 ?auto_4670 ) ( CLEAR ?auto_4665 ) ( IS-CRATE ?auto_4666 ) ( not ( = ?auto_4665 ?auto_4666 ) ) ( AVAILABLE ?auto_4669 ) ( IN ?auto_4666 ?auto_4668 ) ( ON ?auto_4665 ?auto_4664 ) ( not ( = ?auto_4664 ?auto_4665 ) ) ( not ( = ?auto_4664 ?auto_4666 ) ) ( TRUCK-AT ?auto_4668 ?auto_4667 ) ( not ( = ?auto_4667 ?auto_4670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4665 ?auto_4666 )
      ( MAKE-2CRATE-VERIFY ?auto_4664 ?auto_4665 ?auto_4666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4671 - SURFACE
      ?auto_4672 - SURFACE
    )
    :vars
    (
      ?auto_4677 - HOIST
      ?auto_4675 - PLACE
      ?auto_4673 - SURFACE
      ?auto_4676 - TRUCK
      ?auto_4674 - PLACE
      ?auto_4678 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4677 ?auto_4675 ) ( SURFACE-AT ?auto_4671 ?auto_4675 ) ( CLEAR ?auto_4671 ) ( IS-CRATE ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( AVAILABLE ?auto_4677 ) ( ON ?auto_4671 ?auto_4673 ) ( not ( = ?auto_4673 ?auto_4671 ) ) ( not ( = ?auto_4673 ?auto_4672 ) ) ( TRUCK-AT ?auto_4676 ?auto_4674 ) ( not ( = ?auto_4674 ?auto_4675 ) ) ( HOIST-AT ?auto_4678 ?auto_4674 ) ( LIFTING ?auto_4678 ?auto_4672 ) ( not ( = ?auto_4677 ?auto_4678 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4678 ?auto_4672 ?auto_4676 ?auto_4674 )
      ( MAKE-2CRATE ?auto_4673 ?auto_4671 ?auto_4672 )
      ( MAKE-1CRATE-VERIFY ?auto_4671 ?auto_4672 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4679 - SURFACE
      ?auto_4680 - SURFACE
      ?auto_4681 - SURFACE
    )
    :vars
    (
      ?auto_4682 - HOIST
      ?auto_4686 - PLACE
      ?auto_4685 - TRUCK
      ?auto_4684 - PLACE
      ?auto_4683 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4682 ?auto_4686 ) ( SURFACE-AT ?auto_4680 ?auto_4686 ) ( CLEAR ?auto_4680 ) ( IS-CRATE ?auto_4681 ) ( not ( = ?auto_4680 ?auto_4681 ) ) ( AVAILABLE ?auto_4682 ) ( ON ?auto_4680 ?auto_4679 ) ( not ( = ?auto_4679 ?auto_4680 ) ) ( not ( = ?auto_4679 ?auto_4681 ) ) ( TRUCK-AT ?auto_4685 ?auto_4684 ) ( not ( = ?auto_4684 ?auto_4686 ) ) ( HOIST-AT ?auto_4683 ?auto_4684 ) ( LIFTING ?auto_4683 ?auto_4681 ) ( not ( = ?auto_4682 ?auto_4683 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4680 ?auto_4681 )
      ( MAKE-2CRATE-VERIFY ?auto_4679 ?auto_4680 ?auto_4681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4687 - SURFACE
      ?auto_4688 - SURFACE
    )
    :vars
    (
      ?auto_4694 - HOIST
      ?auto_4690 - PLACE
      ?auto_4692 - SURFACE
      ?auto_4689 - TRUCK
      ?auto_4693 - PLACE
      ?auto_4691 - HOIST
      ?auto_4695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4694 ?auto_4690 ) ( SURFACE-AT ?auto_4687 ?auto_4690 ) ( CLEAR ?auto_4687 ) ( IS-CRATE ?auto_4688 ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( AVAILABLE ?auto_4694 ) ( ON ?auto_4687 ?auto_4692 ) ( not ( = ?auto_4692 ?auto_4687 ) ) ( not ( = ?auto_4692 ?auto_4688 ) ) ( TRUCK-AT ?auto_4689 ?auto_4693 ) ( not ( = ?auto_4693 ?auto_4690 ) ) ( HOIST-AT ?auto_4691 ?auto_4693 ) ( not ( = ?auto_4694 ?auto_4691 ) ) ( AVAILABLE ?auto_4691 ) ( SURFACE-AT ?auto_4688 ?auto_4693 ) ( ON ?auto_4688 ?auto_4695 ) ( CLEAR ?auto_4688 ) ( not ( = ?auto_4687 ?auto_4695 ) ) ( not ( = ?auto_4688 ?auto_4695 ) ) ( not ( = ?auto_4692 ?auto_4695 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4691 ?auto_4688 ?auto_4695 ?auto_4693 )
      ( MAKE-2CRATE ?auto_4692 ?auto_4687 ?auto_4688 )
      ( MAKE-1CRATE-VERIFY ?auto_4687 ?auto_4688 ) )
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
      ?auto_4702 - HOIST
      ?auto_4703 - PLACE
      ?auto_4700 - TRUCK
      ?auto_4701 - PLACE
      ?auto_4699 - HOIST
      ?auto_4704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4702 ?auto_4703 ) ( SURFACE-AT ?auto_4697 ?auto_4703 ) ( CLEAR ?auto_4697 ) ( IS-CRATE ?auto_4698 ) ( not ( = ?auto_4697 ?auto_4698 ) ) ( AVAILABLE ?auto_4702 ) ( ON ?auto_4697 ?auto_4696 ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4698 ) ) ( TRUCK-AT ?auto_4700 ?auto_4701 ) ( not ( = ?auto_4701 ?auto_4703 ) ) ( HOIST-AT ?auto_4699 ?auto_4701 ) ( not ( = ?auto_4702 ?auto_4699 ) ) ( AVAILABLE ?auto_4699 ) ( SURFACE-AT ?auto_4698 ?auto_4701 ) ( ON ?auto_4698 ?auto_4704 ) ( CLEAR ?auto_4698 ) ( not ( = ?auto_4697 ?auto_4704 ) ) ( not ( = ?auto_4698 ?auto_4704 ) ) ( not ( = ?auto_4696 ?auto_4704 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4697 ?auto_4698 )
      ( MAKE-2CRATE-VERIFY ?auto_4696 ?auto_4697 ?auto_4698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4705 - SURFACE
      ?auto_4706 - SURFACE
    )
    :vars
    (
      ?auto_4707 - HOIST
      ?auto_4708 - PLACE
      ?auto_4712 - SURFACE
      ?auto_4710 - PLACE
      ?auto_4711 - HOIST
      ?auto_4713 - SURFACE
      ?auto_4709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4707 ?auto_4708 ) ( SURFACE-AT ?auto_4705 ?auto_4708 ) ( CLEAR ?auto_4705 ) ( IS-CRATE ?auto_4706 ) ( not ( = ?auto_4705 ?auto_4706 ) ) ( AVAILABLE ?auto_4707 ) ( ON ?auto_4705 ?auto_4712 ) ( not ( = ?auto_4712 ?auto_4705 ) ) ( not ( = ?auto_4712 ?auto_4706 ) ) ( not ( = ?auto_4710 ?auto_4708 ) ) ( HOIST-AT ?auto_4711 ?auto_4710 ) ( not ( = ?auto_4707 ?auto_4711 ) ) ( AVAILABLE ?auto_4711 ) ( SURFACE-AT ?auto_4706 ?auto_4710 ) ( ON ?auto_4706 ?auto_4713 ) ( CLEAR ?auto_4706 ) ( not ( = ?auto_4705 ?auto_4713 ) ) ( not ( = ?auto_4706 ?auto_4713 ) ) ( not ( = ?auto_4712 ?auto_4713 ) ) ( TRUCK-AT ?auto_4709 ?auto_4708 ) )
    :subtasks
    ( ( !DRIVE ?auto_4709 ?auto_4708 ?auto_4710 )
      ( MAKE-2CRATE ?auto_4712 ?auto_4705 ?auto_4706 )
      ( MAKE-1CRATE-VERIFY ?auto_4705 ?auto_4706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4714 - SURFACE
      ?auto_4715 - SURFACE
      ?auto_4716 - SURFACE
    )
    :vars
    (
      ?auto_4719 - HOIST
      ?auto_4718 - PLACE
      ?auto_4722 - PLACE
      ?auto_4721 - HOIST
      ?auto_4720 - SURFACE
      ?auto_4717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4719 ?auto_4718 ) ( SURFACE-AT ?auto_4715 ?auto_4718 ) ( CLEAR ?auto_4715 ) ( IS-CRATE ?auto_4716 ) ( not ( = ?auto_4715 ?auto_4716 ) ) ( AVAILABLE ?auto_4719 ) ( ON ?auto_4715 ?auto_4714 ) ( not ( = ?auto_4714 ?auto_4715 ) ) ( not ( = ?auto_4714 ?auto_4716 ) ) ( not ( = ?auto_4722 ?auto_4718 ) ) ( HOIST-AT ?auto_4721 ?auto_4722 ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( AVAILABLE ?auto_4721 ) ( SURFACE-AT ?auto_4716 ?auto_4722 ) ( ON ?auto_4716 ?auto_4720 ) ( CLEAR ?auto_4716 ) ( not ( = ?auto_4715 ?auto_4720 ) ) ( not ( = ?auto_4716 ?auto_4720 ) ) ( not ( = ?auto_4714 ?auto_4720 ) ) ( TRUCK-AT ?auto_4717 ?auto_4718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4715 ?auto_4716 )
      ( MAKE-2CRATE-VERIFY ?auto_4714 ?auto_4715 ?auto_4716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4723 - SURFACE
      ?auto_4724 - SURFACE
    )
    :vars
    (
      ?auto_4731 - HOIST
      ?auto_4725 - PLACE
      ?auto_4726 - SURFACE
      ?auto_4728 - PLACE
      ?auto_4730 - HOIST
      ?auto_4727 - SURFACE
      ?auto_4729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4731 ?auto_4725 ) ( IS-CRATE ?auto_4724 ) ( not ( = ?auto_4723 ?auto_4724 ) ) ( not ( = ?auto_4726 ?auto_4723 ) ) ( not ( = ?auto_4726 ?auto_4724 ) ) ( not ( = ?auto_4728 ?auto_4725 ) ) ( HOIST-AT ?auto_4730 ?auto_4728 ) ( not ( = ?auto_4731 ?auto_4730 ) ) ( AVAILABLE ?auto_4730 ) ( SURFACE-AT ?auto_4724 ?auto_4728 ) ( ON ?auto_4724 ?auto_4727 ) ( CLEAR ?auto_4724 ) ( not ( = ?auto_4723 ?auto_4727 ) ) ( not ( = ?auto_4724 ?auto_4727 ) ) ( not ( = ?auto_4726 ?auto_4727 ) ) ( TRUCK-AT ?auto_4729 ?auto_4725 ) ( SURFACE-AT ?auto_4726 ?auto_4725 ) ( CLEAR ?auto_4726 ) ( LIFTING ?auto_4731 ?auto_4723 ) ( IS-CRATE ?auto_4723 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4726 ?auto_4723 )
      ( MAKE-2CRATE ?auto_4726 ?auto_4723 ?auto_4724 )
      ( MAKE-1CRATE-VERIFY ?auto_4723 ?auto_4724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4732 - SURFACE
      ?auto_4733 - SURFACE
      ?auto_4734 - SURFACE
    )
    :vars
    (
      ?auto_4735 - HOIST
      ?auto_4737 - PLACE
      ?auto_4736 - PLACE
      ?auto_4738 - HOIST
      ?auto_4739 - SURFACE
      ?auto_4740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4735 ?auto_4737 ) ( IS-CRATE ?auto_4734 ) ( not ( = ?auto_4733 ?auto_4734 ) ) ( not ( = ?auto_4732 ?auto_4733 ) ) ( not ( = ?auto_4732 ?auto_4734 ) ) ( not ( = ?auto_4736 ?auto_4737 ) ) ( HOIST-AT ?auto_4738 ?auto_4736 ) ( not ( = ?auto_4735 ?auto_4738 ) ) ( AVAILABLE ?auto_4738 ) ( SURFACE-AT ?auto_4734 ?auto_4736 ) ( ON ?auto_4734 ?auto_4739 ) ( CLEAR ?auto_4734 ) ( not ( = ?auto_4733 ?auto_4739 ) ) ( not ( = ?auto_4734 ?auto_4739 ) ) ( not ( = ?auto_4732 ?auto_4739 ) ) ( TRUCK-AT ?auto_4740 ?auto_4737 ) ( SURFACE-AT ?auto_4732 ?auto_4737 ) ( CLEAR ?auto_4732 ) ( LIFTING ?auto_4735 ?auto_4733 ) ( IS-CRATE ?auto_4733 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4733 ?auto_4734 )
      ( MAKE-2CRATE-VERIFY ?auto_4732 ?auto_4733 ?auto_4734 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4741 - SURFACE
      ?auto_4742 - SURFACE
    )
    :vars
    (
      ?auto_4743 - HOIST
      ?auto_4748 - PLACE
      ?auto_4746 - SURFACE
      ?auto_4749 - PLACE
      ?auto_4744 - HOIST
      ?auto_4747 - SURFACE
      ?auto_4745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4743 ?auto_4748 ) ( IS-CRATE ?auto_4742 ) ( not ( = ?auto_4741 ?auto_4742 ) ) ( not ( = ?auto_4746 ?auto_4741 ) ) ( not ( = ?auto_4746 ?auto_4742 ) ) ( not ( = ?auto_4749 ?auto_4748 ) ) ( HOIST-AT ?auto_4744 ?auto_4749 ) ( not ( = ?auto_4743 ?auto_4744 ) ) ( AVAILABLE ?auto_4744 ) ( SURFACE-AT ?auto_4742 ?auto_4749 ) ( ON ?auto_4742 ?auto_4747 ) ( CLEAR ?auto_4742 ) ( not ( = ?auto_4741 ?auto_4747 ) ) ( not ( = ?auto_4742 ?auto_4747 ) ) ( not ( = ?auto_4746 ?auto_4747 ) ) ( TRUCK-AT ?auto_4745 ?auto_4748 ) ( SURFACE-AT ?auto_4746 ?auto_4748 ) ( CLEAR ?auto_4746 ) ( IS-CRATE ?auto_4741 ) ( AVAILABLE ?auto_4743 ) ( IN ?auto_4741 ?auto_4745 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4743 ?auto_4741 ?auto_4745 ?auto_4748 )
      ( MAKE-2CRATE ?auto_4746 ?auto_4741 ?auto_4742 )
      ( MAKE-1CRATE-VERIFY ?auto_4741 ?auto_4742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4750 - SURFACE
      ?auto_4751 - SURFACE
      ?auto_4752 - SURFACE
    )
    :vars
    (
      ?auto_4754 - HOIST
      ?auto_4755 - PLACE
      ?auto_4758 - PLACE
      ?auto_4757 - HOIST
      ?auto_4753 - SURFACE
      ?auto_4756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4754 ?auto_4755 ) ( IS-CRATE ?auto_4752 ) ( not ( = ?auto_4751 ?auto_4752 ) ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4750 ?auto_4752 ) ) ( not ( = ?auto_4758 ?auto_4755 ) ) ( HOIST-AT ?auto_4757 ?auto_4758 ) ( not ( = ?auto_4754 ?auto_4757 ) ) ( AVAILABLE ?auto_4757 ) ( SURFACE-AT ?auto_4752 ?auto_4758 ) ( ON ?auto_4752 ?auto_4753 ) ( CLEAR ?auto_4752 ) ( not ( = ?auto_4751 ?auto_4753 ) ) ( not ( = ?auto_4752 ?auto_4753 ) ) ( not ( = ?auto_4750 ?auto_4753 ) ) ( TRUCK-AT ?auto_4756 ?auto_4755 ) ( SURFACE-AT ?auto_4750 ?auto_4755 ) ( CLEAR ?auto_4750 ) ( IS-CRATE ?auto_4751 ) ( AVAILABLE ?auto_4754 ) ( IN ?auto_4751 ?auto_4756 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4751 ?auto_4752 )
      ( MAKE-2CRATE-VERIFY ?auto_4750 ?auto_4751 ?auto_4752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4795 - SURFACE
      ?auto_4796 - SURFACE
    )
    :vars
    (
      ?auto_4802 - HOIST
      ?auto_4798 - PLACE
      ?auto_4800 - SURFACE
      ?auto_4797 - PLACE
      ?auto_4801 - HOIST
      ?auto_4803 - SURFACE
      ?auto_4799 - TRUCK
      ?auto_4804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4802 ?auto_4798 ) ( SURFACE-AT ?auto_4795 ?auto_4798 ) ( CLEAR ?auto_4795 ) ( IS-CRATE ?auto_4796 ) ( not ( = ?auto_4795 ?auto_4796 ) ) ( AVAILABLE ?auto_4802 ) ( ON ?auto_4795 ?auto_4800 ) ( not ( = ?auto_4800 ?auto_4795 ) ) ( not ( = ?auto_4800 ?auto_4796 ) ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( HOIST-AT ?auto_4801 ?auto_4797 ) ( not ( = ?auto_4802 ?auto_4801 ) ) ( AVAILABLE ?auto_4801 ) ( SURFACE-AT ?auto_4796 ?auto_4797 ) ( ON ?auto_4796 ?auto_4803 ) ( CLEAR ?auto_4796 ) ( not ( = ?auto_4795 ?auto_4803 ) ) ( not ( = ?auto_4796 ?auto_4803 ) ) ( not ( = ?auto_4800 ?auto_4803 ) ) ( TRUCK-AT ?auto_4799 ?auto_4804 ) ( not ( = ?auto_4804 ?auto_4798 ) ) ( not ( = ?auto_4797 ?auto_4804 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4799 ?auto_4804 ?auto_4798 )
      ( MAKE-1CRATE ?auto_4795 ?auto_4796 )
      ( MAKE-1CRATE-VERIFY ?auto_4795 ?auto_4796 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4834 - SURFACE
      ?auto_4835 - SURFACE
      ?auto_4836 - SURFACE
      ?auto_4837 - SURFACE
    )
    :vars
    (
      ?auto_4839 - HOIST
      ?auto_4838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4839 ?auto_4838 ) ( SURFACE-AT ?auto_4836 ?auto_4838 ) ( CLEAR ?auto_4836 ) ( LIFTING ?auto_4839 ?auto_4837 ) ( IS-CRATE ?auto_4837 ) ( not ( = ?auto_4836 ?auto_4837 ) ) ( ON ?auto_4835 ?auto_4834 ) ( ON ?auto_4836 ?auto_4835 ) ( not ( = ?auto_4834 ?auto_4835 ) ) ( not ( = ?auto_4834 ?auto_4836 ) ) ( not ( = ?auto_4834 ?auto_4837 ) ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( not ( = ?auto_4835 ?auto_4837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4836 ?auto_4837 )
      ( MAKE-3CRATE-VERIFY ?auto_4834 ?auto_4835 ?auto_4836 ?auto_4837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4851 - SURFACE
      ?auto_4852 - SURFACE
      ?auto_4853 - SURFACE
      ?auto_4854 - SURFACE
    )
    :vars
    (
      ?auto_4856 - HOIST
      ?auto_4857 - PLACE
      ?auto_4855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4856 ?auto_4857 ) ( SURFACE-AT ?auto_4853 ?auto_4857 ) ( CLEAR ?auto_4853 ) ( IS-CRATE ?auto_4854 ) ( not ( = ?auto_4853 ?auto_4854 ) ) ( TRUCK-AT ?auto_4855 ?auto_4857 ) ( AVAILABLE ?auto_4856 ) ( IN ?auto_4854 ?auto_4855 ) ( ON ?auto_4853 ?auto_4852 ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4854 ) ) ( ON ?auto_4852 ?auto_4851 ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( not ( = ?auto_4851 ?auto_4853 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4852 ?auto_4853 ?auto_4854 )
      ( MAKE-3CRATE-VERIFY ?auto_4851 ?auto_4852 ?auto_4853 ?auto_4854 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4872 - SURFACE
      ?auto_4873 - SURFACE
      ?auto_4874 - SURFACE
      ?auto_4875 - SURFACE
    )
    :vars
    (
      ?auto_4878 - HOIST
      ?auto_4879 - PLACE
      ?auto_4876 - TRUCK
      ?auto_4877 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4878 ?auto_4879 ) ( SURFACE-AT ?auto_4874 ?auto_4879 ) ( CLEAR ?auto_4874 ) ( IS-CRATE ?auto_4875 ) ( not ( = ?auto_4874 ?auto_4875 ) ) ( AVAILABLE ?auto_4878 ) ( IN ?auto_4875 ?auto_4876 ) ( ON ?auto_4874 ?auto_4873 ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4875 ) ) ( TRUCK-AT ?auto_4876 ?auto_4877 ) ( not ( = ?auto_4877 ?auto_4879 ) ) ( ON ?auto_4873 ?auto_4872 ) ( not ( = ?auto_4872 ?auto_4873 ) ) ( not ( = ?auto_4872 ?auto_4874 ) ) ( not ( = ?auto_4872 ?auto_4875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4873 ?auto_4874 ?auto_4875 )
      ( MAKE-3CRATE-VERIFY ?auto_4872 ?auto_4873 ?auto_4874 ?auto_4875 ) )
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
      ?auto_4903 - HOIST
      ?auto_4900 - PLACE
      ?auto_4901 - TRUCK
      ?auto_4902 - PLACE
      ?auto_4904 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4903 ?auto_4900 ) ( SURFACE-AT ?auto_4898 ?auto_4900 ) ( CLEAR ?auto_4898 ) ( IS-CRATE ?auto_4899 ) ( not ( = ?auto_4898 ?auto_4899 ) ) ( AVAILABLE ?auto_4903 ) ( ON ?auto_4898 ?auto_4897 ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( not ( = ?auto_4897 ?auto_4899 ) ) ( TRUCK-AT ?auto_4901 ?auto_4902 ) ( not ( = ?auto_4902 ?auto_4900 ) ) ( HOIST-AT ?auto_4904 ?auto_4902 ) ( LIFTING ?auto_4904 ?auto_4899 ) ( not ( = ?auto_4903 ?auto_4904 ) ) ( ON ?auto_4897 ?auto_4896 ) ( not ( = ?auto_4896 ?auto_4897 ) ) ( not ( = ?auto_4896 ?auto_4898 ) ) ( not ( = ?auto_4896 ?auto_4899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4897 ?auto_4898 ?auto_4899 )
      ( MAKE-3CRATE-VERIFY ?auto_4896 ?auto_4897 ?auto_4898 ?auto_4899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4923 - SURFACE
      ?auto_4924 - SURFACE
      ?auto_4925 - SURFACE
      ?auto_4926 - SURFACE
    )
    :vars
    (
      ?auto_4930 - HOIST
      ?auto_4927 - PLACE
      ?auto_4932 - TRUCK
      ?auto_4928 - PLACE
      ?auto_4931 - HOIST
      ?auto_4929 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4930 ?auto_4927 ) ( SURFACE-AT ?auto_4925 ?auto_4927 ) ( CLEAR ?auto_4925 ) ( IS-CRATE ?auto_4926 ) ( not ( = ?auto_4925 ?auto_4926 ) ) ( AVAILABLE ?auto_4930 ) ( ON ?auto_4925 ?auto_4924 ) ( not ( = ?auto_4924 ?auto_4925 ) ) ( not ( = ?auto_4924 ?auto_4926 ) ) ( TRUCK-AT ?auto_4932 ?auto_4928 ) ( not ( = ?auto_4928 ?auto_4927 ) ) ( HOIST-AT ?auto_4931 ?auto_4928 ) ( not ( = ?auto_4930 ?auto_4931 ) ) ( AVAILABLE ?auto_4931 ) ( SURFACE-AT ?auto_4926 ?auto_4928 ) ( ON ?auto_4926 ?auto_4929 ) ( CLEAR ?auto_4926 ) ( not ( = ?auto_4925 ?auto_4929 ) ) ( not ( = ?auto_4926 ?auto_4929 ) ) ( not ( = ?auto_4924 ?auto_4929 ) ) ( ON ?auto_4924 ?auto_4923 ) ( not ( = ?auto_4923 ?auto_4924 ) ) ( not ( = ?auto_4923 ?auto_4925 ) ) ( not ( = ?auto_4923 ?auto_4926 ) ) ( not ( = ?auto_4923 ?auto_4929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4924 ?auto_4925 ?auto_4926 )
      ( MAKE-3CRATE-VERIFY ?auto_4923 ?auto_4924 ?auto_4925 ?auto_4926 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4951 - SURFACE
      ?auto_4952 - SURFACE
      ?auto_4953 - SURFACE
      ?auto_4954 - SURFACE
    )
    :vars
    (
      ?auto_4957 - HOIST
      ?auto_4960 - PLACE
      ?auto_4955 - PLACE
      ?auto_4959 - HOIST
      ?auto_4956 - SURFACE
      ?auto_4958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4957 ?auto_4960 ) ( SURFACE-AT ?auto_4953 ?auto_4960 ) ( CLEAR ?auto_4953 ) ( IS-CRATE ?auto_4954 ) ( not ( = ?auto_4953 ?auto_4954 ) ) ( AVAILABLE ?auto_4957 ) ( ON ?auto_4953 ?auto_4952 ) ( not ( = ?auto_4952 ?auto_4953 ) ) ( not ( = ?auto_4952 ?auto_4954 ) ) ( not ( = ?auto_4955 ?auto_4960 ) ) ( HOIST-AT ?auto_4959 ?auto_4955 ) ( not ( = ?auto_4957 ?auto_4959 ) ) ( AVAILABLE ?auto_4959 ) ( SURFACE-AT ?auto_4954 ?auto_4955 ) ( ON ?auto_4954 ?auto_4956 ) ( CLEAR ?auto_4954 ) ( not ( = ?auto_4953 ?auto_4956 ) ) ( not ( = ?auto_4954 ?auto_4956 ) ) ( not ( = ?auto_4952 ?auto_4956 ) ) ( TRUCK-AT ?auto_4958 ?auto_4960 ) ( ON ?auto_4952 ?auto_4951 ) ( not ( = ?auto_4951 ?auto_4952 ) ) ( not ( = ?auto_4951 ?auto_4953 ) ) ( not ( = ?auto_4951 ?auto_4954 ) ) ( not ( = ?auto_4951 ?auto_4956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4952 ?auto_4953 ?auto_4954 )
      ( MAKE-3CRATE-VERIFY ?auto_4951 ?auto_4952 ?auto_4953 ?auto_4954 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4979 - SURFACE
      ?auto_4980 - SURFACE
      ?auto_4981 - SURFACE
      ?auto_4982 - SURFACE
    )
    :vars
    (
      ?auto_4985 - HOIST
      ?auto_4983 - PLACE
      ?auto_4987 - PLACE
      ?auto_4986 - HOIST
      ?auto_4988 - SURFACE
      ?auto_4984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4985 ?auto_4983 ) ( IS-CRATE ?auto_4982 ) ( not ( = ?auto_4981 ?auto_4982 ) ) ( not ( = ?auto_4980 ?auto_4981 ) ) ( not ( = ?auto_4980 ?auto_4982 ) ) ( not ( = ?auto_4987 ?auto_4983 ) ) ( HOIST-AT ?auto_4986 ?auto_4987 ) ( not ( = ?auto_4985 ?auto_4986 ) ) ( AVAILABLE ?auto_4986 ) ( SURFACE-AT ?auto_4982 ?auto_4987 ) ( ON ?auto_4982 ?auto_4988 ) ( CLEAR ?auto_4982 ) ( not ( = ?auto_4981 ?auto_4988 ) ) ( not ( = ?auto_4982 ?auto_4988 ) ) ( not ( = ?auto_4980 ?auto_4988 ) ) ( TRUCK-AT ?auto_4984 ?auto_4983 ) ( SURFACE-AT ?auto_4980 ?auto_4983 ) ( CLEAR ?auto_4980 ) ( LIFTING ?auto_4985 ?auto_4981 ) ( IS-CRATE ?auto_4981 ) ( ON ?auto_4980 ?auto_4979 ) ( not ( = ?auto_4979 ?auto_4980 ) ) ( not ( = ?auto_4979 ?auto_4981 ) ) ( not ( = ?auto_4979 ?auto_4982 ) ) ( not ( = ?auto_4979 ?auto_4988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4980 ?auto_4981 ?auto_4982 )
      ( MAKE-3CRATE-VERIFY ?auto_4979 ?auto_4980 ?auto_4981 ?auto_4982 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5007 - SURFACE
      ?auto_5008 - SURFACE
      ?auto_5009 - SURFACE
      ?auto_5010 - SURFACE
    )
    :vars
    (
      ?auto_5014 - HOIST
      ?auto_5015 - PLACE
      ?auto_5011 - PLACE
      ?auto_5016 - HOIST
      ?auto_5013 - SURFACE
      ?auto_5012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5014 ?auto_5015 ) ( IS-CRATE ?auto_5010 ) ( not ( = ?auto_5009 ?auto_5010 ) ) ( not ( = ?auto_5008 ?auto_5009 ) ) ( not ( = ?auto_5008 ?auto_5010 ) ) ( not ( = ?auto_5011 ?auto_5015 ) ) ( HOIST-AT ?auto_5016 ?auto_5011 ) ( not ( = ?auto_5014 ?auto_5016 ) ) ( AVAILABLE ?auto_5016 ) ( SURFACE-AT ?auto_5010 ?auto_5011 ) ( ON ?auto_5010 ?auto_5013 ) ( CLEAR ?auto_5010 ) ( not ( = ?auto_5009 ?auto_5013 ) ) ( not ( = ?auto_5010 ?auto_5013 ) ) ( not ( = ?auto_5008 ?auto_5013 ) ) ( TRUCK-AT ?auto_5012 ?auto_5015 ) ( SURFACE-AT ?auto_5008 ?auto_5015 ) ( CLEAR ?auto_5008 ) ( IS-CRATE ?auto_5009 ) ( AVAILABLE ?auto_5014 ) ( IN ?auto_5009 ?auto_5012 ) ( ON ?auto_5008 ?auto_5007 ) ( not ( = ?auto_5007 ?auto_5008 ) ) ( not ( = ?auto_5007 ?auto_5009 ) ) ( not ( = ?auto_5007 ?auto_5010 ) ) ( not ( = ?auto_5007 ?auto_5013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5008 ?auto_5009 ?auto_5010 )
      ( MAKE-3CRATE-VERIFY ?auto_5007 ?auto_5008 ?auto_5009 ?auto_5010 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5298 - SURFACE
      ?auto_5299 - SURFACE
      ?auto_5300 - SURFACE
      ?auto_5302 - SURFACE
      ?auto_5301 - SURFACE
    )
    :vars
    (
      ?auto_5304 - HOIST
      ?auto_5303 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5304 ?auto_5303 ) ( SURFACE-AT ?auto_5302 ?auto_5303 ) ( CLEAR ?auto_5302 ) ( LIFTING ?auto_5304 ?auto_5301 ) ( IS-CRATE ?auto_5301 ) ( not ( = ?auto_5302 ?auto_5301 ) ) ( ON ?auto_5299 ?auto_5298 ) ( ON ?auto_5300 ?auto_5299 ) ( ON ?auto_5302 ?auto_5300 ) ( not ( = ?auto_5298 ?auto_5299 ) ) ( not ( = ?auto_5298 ?auto_5300 ) ) ( not ( = ?auto_5298 ?auto_5302 ) ) ( not ( = ?auto_5298 ?auto_5301 ) ) ( not ( = ?auto_5299 ?auto_5300 ) ) ( not ( = ?auto_5299 ?auto_5302 ) ) ( not ( = ?auto_5299 ?auto_5301 ) ) ( not ( = ?auto_5300 ?auto_5302 ) ) ( not ( = ?auto_5300 ?auto_5301 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5302 ?auto_5301 )
      ( MAKE-4CRATE-VERIFY ?auto_5298 ?auto_5299 ?auto_5300 ?auto_5302 ?auto_5301 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5323 - SURFACE
      ?auto_5324 - SURFACE
      ?auto_5325 - SURFACE
      ?auto_5327 - SURFACE
      ?auto_5326 - SURFACE
    )
    :vars
    (
      ?auto_5328 - HOIST
      ?auto_5329 - PLACE
      ?auto_5330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5328 ?auto_5329 ) ( SURFACE-AT ?auto_5327 ?auto_5329 ) ( CLEAR ?auto_5327 ) ( IS-CRATE ?auto_5326 ) ( not ( = ?auto_5327 ?auto_5326 ) ) ( TRUCK-AT ?auto_5330 ?auto_5329 ) ( AVAILABLE ?auto_5328 ) ( IN ?auto_5326 ?auto_5330 ) ( ON ?auto_5327 ?auto_5325 ) ( not ( = ?auto_5325 ?auto_5327 ) ) ( not ( = ?auto_5325 ?auto_5326 ) ) ( ON ?auto_5324 ?auto_5323 ) ( ON ?auto_5325 ?auto_5324 ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( not ( = ?auto_5323 ?auto_5325 ) ) ( not ( = ?auto_5323 ?auto_5327 ) ) ( not ( = ?auto_5323 ?auto_5326 ) ) ( not ( = ?auto_5324 ?auto_5325 ) ) ( not ( = ?auto_5324 ?auto_5327 ) ) ( not ( = ?auto_5324 ?auto_5326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5325 ?auto_5327 ?auto_5326 )
      ( MAKE-4CRATE-VERIFY ?auto_5323 ?auto_5324 ?auto_5325 ?auto_5327 ?auto_5326 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5353 - SURFACE
      ?auto_5354 - SURFACE
      ?auto_5355 - SURFACE
      ?auto_5357 - SURFACE
      ?auto_5356 - SURFACE
    )
    :vars
    (
      ?auto_5358 - HOIST
      ?auto_5361 - PLACE
      ?auto_5359 - TRUCK
      ?auto_5360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5358 ?auto_5361 ) ( SURFACE-AT ?auto_5357 ?auto_5361 ) ( CLEAR ?auto_5357 ) ( IS-CRATE ?auto_5356 ) ( not ( = ?auto_5357 ?auto_5356 ) ) ( AVAILABLE ?auto_5358 ) ( IN ?auto_5356 ?auto_5359 ) ( ON ?auto_5357 ?auto_5355 ) ( not ( = ?auto_5355 ?auto_5357 ) ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( TRUCK-AT ?auto_5359 ?auto_5360 ) ( not ( = ?auto_5360 ?auto_5361 ) ) ( ON ?auto_5354 ?auto_5353 ) ( ON ?auto_5355 ?auto_5354 ) ( not ( = ?auto_5353 ?auto_5354 ) ) ( not ( = ?auto_5353 ?auto_5355 ) ) ( not ( = ?auto_5353 ?auto_5357 ) ) ( not ( = ?auto_5353 ?auto_5356 ) ) ( not ( = ?auto_5354 ?auto_5355 ) ) ( not ( = ?auto_5354 ?auto_5357 ) ) ( not ( = ?auto_5354 ?auto_5356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5355 ?auto_5357 ?auto_5356 )
      ( MAKE-4CRATE-VERIFY ?auto_5353 ?auto_5354 ?auto_5355 ?auto_5357 ?auto_5356 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5387 - SURFACE
      ?auto_5388 - SURFACE
      ?auto_5389 - SURFACE
      ?auto_5391 - SURFACE
      ?auto_5390 - SURFACE
    )
    :vars
    (
      ?auto_5395 - HOIST
      ?auto_5392 - PLACE
      ?auto_5396 - TRUCK
      ?auto_5393 - PLACE
      ?auto_5394 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5395 ?auto_5392 ) ( SURFACE-AT ?auto_5391 ?auto_5392 ) ( CLEAR ?auto_5391 ) ( IS-CRATE ?auto_5390 ) ( not ( = ?auto_5391 ?auto_5390 ) ) ( AVAILABLE ?auto_5395 ) ( ON ?auto_5391 ?auto_5389 ) ( not ( = ?auto_5389 ?auto_5391 ) ) ( not ( = ?auto_5389 ?auto_5390 ) ) ( TRUCK-AT ?auto_5396 ?auto_5393 ) ( not ( = ?auto_5393 ?auto_5392 ) ) ( HOIST-AT ?auto_5394 ?auto_5393 ) ( LIFTING ?auto_5394 ?auto_5390 ) ( not ( = ?auto_5395 ?auto_5394 ) ) ( ON ?auto_5388 ?auto_5387 ) ( ON ?auto_5389 ?auto_5388 ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) ( not ( = ?auto_5387 ?auto_5391 ) ) ( not ( = ?auto_5387 ?auto_5390 ) ) ( not ( = ?auto_5388 ?auto_5389 ) ) ( not ( = ?auto_5388 ?auto_5391 ) ) ( not ( = ?auto_5388 ?auto_5390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5389 ?auto_5391 ?auto_5390 )
      ( MAKE-4CRATE-VERIFY ?auto_5387 ?auto_5388 ?auto_5389 ?auto_5391 ?auto_5390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5425 - SURFACE
      ?auto_5426 - SURFACE
      ?auto_5427 - SURFACE
      ?auto_5429 - SURFACE
      ?auto_5428 - SURFACE
    )
    :vars
    (
      ?auto_5433 - HOIST
      ?auto_5432 - PLACE
      ?auto_5434 - TRUCK
      ?auto_5435 - PLACE
      ?auto_5430 - HOIST
      ?auto_5431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5433 ?auto_5432 ) ( SURFACE-AT ?auto_5429 ?auto_5432 ) ( CLEAR ?auto_5429 ) ( IS-CRATE ?auto_5428 ) ( not ( = ?auto_5429 ?auto_5428 ) ) ( AVAILABLE ?auto_5433 ) ( ON ?auto_5429 ?auto_5427 ) ( not ( = ?auto_5427 ?auto_5429 ) ) ( not ( = ?auto_5427 ?auto_5428 ) ) ( TRUCK-AT ?auto_5434 ?auto_5435 ) ( not ( = ?auto_5435 ?auto_5432 ) ) ( HOIST-AT ?auto_5430 ?auto_5435 ) ( not ( = ?auto_5433 ?auto_5430 ) ) ( AVAILABLE ?auto_5430 ) ( SURFACE-AT ?auto_5428 ?auto_5435 ) ( ON ?auto_5428 ?auto_5431 ) ( CLEAR ?auto_5428 ) ( not ( = ?auto_5429 ?auto_5431 ) ) ( not ( = ?auto_5428 ?auto_5431 ) ) ( not ( = ?auto_5427 ?auto_5431 ) ) ( ON ?auto_5426 ?auto_5425 ) ( ON ?auto_5427 ?auto_5426 ) ( not ( = ?auto_5425 ?auto_5426 ) ) ( not ( = ?auto_5425 ?auto_5427 ) ) ( not ( = ?auto_5425 ?auto_5429 ) ) ( not ( = ?auto_5425 ?auto_5428 ) ) ( not ( = ?auto_5425 ?auto_5431 ) ) ( not ( = ?auto_5426 ?auto_5427 ) ) ( not ( = ?auto_5426 ?auto_5429 ) ) ( not ( = ?auto_5426 ?auto_5428 ) ) ( not ( = ?auto_5426 ?auto_5431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5427 ?auto_5429 ?auto_5428 )
      ( MAKE-4CRATE-VERIFY ?auto_5425 ?auto_5426 ?auto_5427 ?auto_5429 ?auto_5428 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5464 - SURFACE
      ?auto_5465 - SURFACE
      ?auto_5466 - SURFACE
      ?auto_5468 - SURFACE
      ?auto_5467 - SURFACE
    )
    :vars
    (
      ?auto_5473 - HOIST
      ?auto_5469 - PLACE
      ?auto_5471 - PLACE
      ?auto_5472 - HOIST
      ?auto_5470 - SURFACE
      ?auto_5474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5473 ?auto_5469 ) ( SURFACE-AT ?auto_5468 ?auto_5469 ) ( CLEAR ?auto_5468 ) ( IS-CRATE ?auto_5467 ) ( not ( = ?auto_5468 ?auto_5467 ) ) ( AVAILABLE ?auto_5473 ) ( ON ?auto_5468 ?auto_5466 ) ( not ( = ?auto_5466 ?auto_5468 ) ) ( not ( = ?auto_5466 ?auto_5467 ) ) ( not ( = ?auto_5471 ?auto_5469 ) ) ( HOIST-AT ?auto_5472 ?auto_5471 ) ( not ( = ?auto_5473 ?auto_5472 ) ) ( AVAILABLE ?auto_5472 ) ( SURFACE-AT ?auto_5467 ?auto_5471 ) ( ON ?auto_5467 ?auto_5470 ) ( CLEAR ?auto_5467 ) ( not ( = ?auto_5468 ?auto_5470 ) ) ( not ( = ?auto_5467 ?auto_5470 ) ) ( not ( = ?auto_5466 ?auto_5470 ) ) ( TRUCK-AT ?auto_5474 ?auto_5469 ) ( ON ?auto_5465 ?auto_5464 ) ( ON ?auto_5466 ?auto_5465 ) ( not ( = ?auto_5464 ?auto_5465 ) ) ( not ( = ?auto_5464 ?auto_5466 ) ) ( not ( = ?auto_5464 ?auto_5468 ) ) ( not ( = ?auto_5464 ?auto_5467 ) ) ( not ( = ?auto_5464 ?auto_5470 ) ) ( not ( = ?auto_5465 ?auto_5466 ) ) ( not ( = ?auto_5465 ?auto_5468 ) ) ( not ( = ?auto_5465 ?auto_5467 ) ) ( not ( = ?auto_5465 ?auto_5470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5466 ?auto_5468 ?auto_5467 )
      ( MAKE-4CRATE-VERIFY ?auto_5464 ?auto_5465 ?auto_5466 ?auto_5468 ?auto_5467 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5503 - SURFACE
      ?auto_5504 - SURFACE
      ?auto_5505 - SURFACE
      ?auto_5507 - SURFACE
      ?auto_5506 - SURFACE
    )
    :vars
    (
      ?auto_5508 - HOIST
      ?auto_5513 - PLACE
      ?auto_5512 - PLACE
      ?auto_5509 - HOIST
      ?auto_5510 - SURFACE
      ?auto_5511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5508 ?auto_5513 ) ( IS-CRATE ?auto_5506 ) ( not ( = ?auto_5507 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( not ( = ?auto_5512 ?auto_5513 ) ) ( HOIST-AT ?auto_5509 ?auto_5512 ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( AVAILABLE ?auto_5509 ) ( SURFACE-AT ?auto_5506 ?auto_5512 ) ( ON ?auto_5506 ?auto_5510 ) ( CLEAR ?auto_5506 ) ( not ( = ?auto_5507 ?auto_5510 ) ) ( not ( = ?auto_5506 ?auto_5510 ) ) ( not ( = ?auto_5505 ?auto_5510 ) ) ( TRUCK-AT ?auto_5511 ?auto_5513 ) ( SURFACE-AT ?auto_5505 ?auto_5513 ) ( CLEAR ?auto_5505 ) ( LIFTING ?auto_5508 ?auto_5507 ) ( IS-CRATE ?auto_5507 ) ( ON ?auto_5504 ?auto_5503 ) ( ON ?auto_5505 ?auto_5504 ) ( not ( = ?auto_5503 ?auto_5504 ) ) ( not ( = ?auto_5503 ?auto_5505 ) ) ( not ( = ?auto_5503 ?auto_5507 ) ) ( not ( = ?auto_5503 ?auto_5506 ) ) ( not ( = ?auto_5503 ?auto_5510 ) ) ( not ( = ?auto_5504 ?auto_5505 ) ) ( not ( = ?auto_5504 ?auto_5507 ) ) ( not ( = ?auto_5504 ?auto_5506 ) ) ( not ( = ?auto_5504 ?auto_5510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5505 ?auto_5507 ?auto_5506 )
      ( MAKE-4CRATE-VERIFY ?auto_5503 ?auto_5504 ?auto_5505 ?auto_5507 ?auto_5506 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_5542 - SURFACE
      ?auto_5543 - SURFACE
      ?auto_5544 - SURFACE
      ?auto_5546 - SURFACE
      ?auto_5545 - SURFACE
    )
    :vars
    (
      ?auto_5550 - HOIST
      ?auto_5548 - PLACE
      ?auto_5549 - PLACE
      ?auto_5551 - HOIST
      ?auto_5547 - SURFACE
      ?auto_5552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5550 ?auto_5548 ) ( IS-CRATE ?auto_5545 ) ( not ( = ?auto_5546 ?auto_5545 ) ) ( not ( = ?auto_5544 ?auto_5546 ) ) ( not ( = ?auto_5544 ?auto_5545 ) ) ( not ( = ?auto_5549 ?auto_5548 ) ) ( HOIST-AT ?auto_5551 ?auto_5549 ) ( not ( = ?auto_5550 ?auto_5551 ) ) ( AVAILABLE ?auto_5551 ) ( SURFACE-AT ?auto_5545 ?auto_5549 ) ( ON ?auto_5545 ?auto_5547 ) ( CLEAR ?auto_5545 ) ( not ( = ?auto_5546 ?auto_5547 ) ) ( not ( = ?auto_5545 ?auto_5547 ) ) ( not ( = ?auto_5544 ?auto_5547 ) ) ( TRUCK-AT ?auto_5552 ?auto_5548 ) ( SURFACE-AT ?auto_5544 ?auto_5548 ) ( CLEAR ?auto_5544 ) ( IS-CRATE ?auto_5546 ) ( AVAILABLE ?auto_5550 ) ( IN ?auto_5546 ?auto_5552 ) ( ON ?auto_5543 ?auto_5542 ) ( ON ?auto_5544 ?auto_5543 ) ( not ( = ?auto_5542 ?auto_5543 ) ) ( not ( = ?auto_5542 ?auto_5544 ) ) ( not ( = ?auto_5542 ?auto_5546 ) ) ( not ( = ?auto_5542 ?auto_5545 ) ) ( not ( = ?auto_5542 ?auto_5547 ) ) ( not ( = ?auto_5543 ?auto_5544 ) ) ( not ( = ?auto_5543 ?auto_5546 ) ) ( not ( = ?auto_5543 ?auto_5545 ) ) ( not ( = ?auto_5543 ?auto_5547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5544 ?auto_5546 ?auto_5545 )
      ( MAKE-4CRATE-VERIFY ?auto_5542 ?auto_5543 ?auto_5544 ?auto_5546 ?auto_5545 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6043 - SURFACE
      ?auto_6044 - SURFACE
    )
    :vars
    (
      ?auto_6046 - HOIST
      ?auto_6048 - PLACE
      ?auto_6051 - SURFACE
      ?auto_6049 - TRUCK
      ?auto_6050 - PLACE
      ?auto_6045 - HOIST
      ?auto_6047 - SURFACE
      ?auto_6052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6046 ?auto_6048 ) ( SURFACE-AT ?auto_6043 ?auto_6048 ) ( CLEAR ?auto_6043 ) ( IS-CRATE ?auto_6044 ) ( not ( = ?auto_6043 ?auto_6044 ) ) ( AVAILABLE ?auto_6046 ) ( ON ?auto_6043 ?auto_6051 ) ( not ( = ?auto_6051 ?auto_6043 ) ) ( not ( = ?auto_6051 ?auto_6044 ) ) ( TRUCK-AT ?auto_6049 ?auto_6050 ) ( not ( = ?auto_6050 ?auto_6048 ) ) ( HOIST-AT ?auto_6045 ?auto_6050 ) ( not ( = ?auto_6046 ?auto_6045 ) ) ( SURFACE-AT ?auto_6044 ?auto_6050 ) ( ON ?auto_6044 ?auto_6047 ) ( CLEAR ?auto_6044 ) ( not ( = ?auto_6043 ?auto_6047 ) ) ( not ( = ?auto_6044 ?auto_6047 ) ) ( not ( = ?auto_6051 ?auto_6047 ) ) ( LIFTING ?auto_6045 ?auto_6052 ) ( IS-CRATE ?auto_6052 ) ( not ( = ?auto_6043 ?auto_6052 ) ) ( not ( = ?auto_6044 ?auto_6052 ) ) ( not ( = ?auto_6051 ?auto_6052 ) ) ( not ( = ?auto_6047 ?auto_6052 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6045 ?auto_6052 ?auto_6049 ?auto_6050 )
      ( MAKE-1CRATE ?auto_6043 ?auto_6044 )
      ( MAKE-1CRATE-VERIFY ?auto_6043 ?auto_6044 ) )
  )

)

