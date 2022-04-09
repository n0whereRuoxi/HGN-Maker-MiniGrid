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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4578 - SURFACE
      ?auto_4579 - SURFACE
    )
    :vars
    (
      ?auto_4580 - HOIST
      ?auto_4581 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4580 ?auto_4581 ) ( SURFACE-AT ?auto_4578 ?auto_4581 ) ( CLEAR ?auto_4578 ) ( LIFTING ?auto_4580 ?auto_4579 ) ( IS-CRATE ?auto_4579 ) ( not ( = ?auto_4578 ?auto_4579 ) ) )
    :subtasks
    ( ( !DROP ?auto_4580 ?auto_4579 ?auto_4578 ?auto_4581 )
      ( MAKE-1CRATE-VERIFY ?auto_4578 ?auto_4579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4582 - SURFACE
      ?auto_4583 - SURFACE
    )
    :vars
    (
      ?auto_4585 - HOIST
      ?auto_4584 - PLACE
      ?auto_4586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4585 ?auto_4584 ) ( SURFACE-AT ?auto_4582 ?auto_4584 ) ( CLEAR ?auto_4582 ) ( IS-CRATE ?auto_4583 ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( TRUCK-AT ?auto_4586 ?auto_4584 ) ( AVAILABLE ?auto_4585 ) ( IN ?auto_4583 ?auto_4586 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4585 ?auto_4583 ?auto_4586 ?auto_4584 )
      ( MAKE-1CRATE ?auto_4582 ?auto_4583 )
      ( MAKE-1CRATE-VERIFY ?auto_4582 ?auto_4583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4587 - SURFACE
      ?auto_4588 - SURFACE
    )
    :vars
    (
      ?auto_4591 - HOIST
      ?auto_4589 - PLACE
      ?auto_4590 - TRUCK
      ?auto_4592 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4591 ?auto_4589 ) ( SURFACE-AT ?auto_4587 ?auto_4589 ) ( CLEAR ?auto_4587 ) ( IS-CRATE ?auto_4588 ) ( not ( = ?auto_4587 ?auto_4588 ) ) ( AVAILABLE ?auto_4591 ) ( IN ?auto_4588 ?auto_4590 ) ( TRUCK-AT ?auto_4590 ?auto_4592 ) ( not ( = ?auto_4592 ?auto_4589 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4590 ?auto_4592 ?auto_4589 )
      ( MAKE-1CRATE ?auto_4587 ?auto_4588 )
      ( MAKE-1CRATE-VERIFY ?auto_4587 ?auto_4588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4593 - SURFACE
      ?auto_4594 - SURFACE
    )
    :vars
    (
      ?auto_4597 - HOIST
      ?auto_4598 - PLACE
      ?auto_4596 - TRUCK
      ?auto_4595 - PLACE
      ?auto_4599 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4597 ?auto_4598 ) ( SURFACE-AT ?auto_4593 ?auto_4598 ) ( CLEAR ?auto_4593 ) ( IS-CRATE ?auto_4594 ) ( not ( = ?auto_4593 ?auto_4594 ) ) ( AVAILABLE ?auto_4597 ) ( TRUCK-AT ?auto_4596 ?auto_4595 ) ( not ( = ?auto_4595 ?auto_4598 ) ) ( HOIST-AT ?auto_4599 ?auto_4595 ) ( LIFTING ?auto_4599 ?auto_4594 ) ( not ( = ?auto_4597 ?auto_4599 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4599 ?auto_4594 ?auto_4596 ?auto_4595 )
      ( MAKE-1CRATE ?auto_4593 ?auto_4594 )
      ( MAKE-1CRATE-VERIFY ?auto_4593 ?auto_4594 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4600 - SURFACE
      ?auto_4601 - SURFACE
    )
    :vars
    (
      ?auto_4604 - HOIST
      ?auto_4605 - PLACE
      ?auto_4603 - TRUCK
      ?auto_4602 - PLACE
      ?auto_4606 - HOIST
      ?auto_4607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4604 ?auto_4605 ) ( SURFACE-AT ?auto_4600 ?auto_4605 ) ( CLEAR ?auto_4600 ) ( IS-CRATE ?auto_4601 ) ( not ( = ?auto_4600 ?auto_4601 ) ) ( AVAILABLE ?auto_4604 ) ( TRUCK-AT ?auto_4603 ?auto_4602 ) ( not ( = ?auto_4602 ?auto_4605 ) ) ( HOIST-AT ?auto_4606 ?auto_4602 ) ( not ( = ?auto_4604 ?auto_4606 ) ) ( AVAILABLE ?auto_4606 ) ( SURFACE-AT ?auto_4601 ?auto_4602 ) ( ON ?auto_4601 ?auto_4607 ) ( CLEAR ?auto_4601 ) ( not ( = ?auto_4600 ?auto_4607 ) ) ( not ( = ?auto_4601 ?auto_4607 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4606 ?auto_4601 ?auto_4607 ?auto_4602 )
      ( MAKE-1CRATE ?auto_4600 ?auto_4601 )
      ( MAKE-1CRATE-VERIFY ?auto_4600 ?auto_4601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4608 - SURFACE
      ?auto_4609 - SURFACE
    )
    :vars
    (
      ?auto_4613 - HOIST
      ?auto_4615 - PLACE
      ?auto_4610 - PLACE
      ?auto_4614 - HOIST
      ?auto_4612 - SURFACE
      ?auto_4611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4613 ?auto_4615 ) ( SURFACE-AT ?auto_4608 ?auto_4615 ) ( CLEAR ?auto_4608 ) ( IS-CRATE ?auto_4609 ) ( not ( = ?auto_4608 ?auto_4609 ) ) ( AVAILABLE ?auto_4613 ) ( not ( = ?auto_4610 ?auto_4615 ) ) ( HOIST-AT ?auto_4614 ?auto_4610 ) ( not ( = ?auto_4613 ?auto_4614 ) ) ( AVAILABLE ?auto_4614 ) ( SURFACE-AT ?auto_4609 ?auto_4610 ) ( ON ?auto_4609 ?auto_4612 ) ( CLEAR ?auto_4609 ) ( not ( = ?auto_4608 ?auto_4612 ) ) ( not ( = ?auto_4609 ?auto_4612 ) ) ( TRUCK-AT ?auto_4611 ?auto_4615 ) )
    :subtasks
    ( ( !DRIVE ?auto_4611 ?auto_4615 ?auto_4610 )
      ( MAKE-1CRATE ?auto_4608 ?auto_4609 )
      ( MAKE-1CRATE-VERIFY ?auto_4608 ?auto_4609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4621 - SURFACE
      ?auto_4622 - SURFACE
    )
    :vars
    (
      ?auto_4623 - HOIST
      ?auto_4624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4623 ?auto_4624 ) ( SURFACE-AT ?auto_4621 ?auto_4624 ) ( CLEAR ?auto_4621 ) ( LIFTING ?auto_4623 ?auto_4622 ) ( IS-CRATE ?auto_4622 ) ( not ( = ?auto_4621 ?auto_4622 ) ) )
    :subtasks
    ( ( !DROP ?auto_4623 ?auto_4622 ?auto_4621 ?auto_4624 )
      ( MAKE-1CRATE-VERIFY ?auto_4621 ?auto_4622 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4625 - SURFACE
      ?auto_4626 - SURFACE
      ?auto_4627 - SURFACE
    )
    :vars
    (
      ?auto_4628 - HOIST
      ?auto_4629 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4628 ?auto_4629 ) ( SURFACE-AT ?auto_4626 ?auto_4629 ) ( CLEAR ?auto_4626 ) ( LIFTING ?auto_4628 ?auto_4627 ) ( IS-CRATE ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( ON ?auto_4626 ?auto_4625 ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4626 ?auto_4627 )
      ( MAKE-2CRATE-VERIFY ?auto_4625 ?auto_4626 ?auto_4627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4630 - SURFACE
      ?auto_4631 - SURFACE
    )
    :vars
    (
      ?auto_4632 - HOIST
      ?auto_4633 - PLACE
      ?auto_4634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4632 ?auto_4633 ) ( SURFACE-AT ?auto_4630 ?auto_4633 ) ( CLEAR ?auto_4630 ) ( IS-CRATE ?auto_4631 ) ( not ( = ?auto_4630 ?auto_4631 ) ) ( TRUCK-AT ?auto_4634 ?auto_4633 ) ( AVAILABLE ?auto_4632 ) ( IN ?auto_4631 ?auto_4634 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4632 ?auto_4631 ?auto_4634 ?auto_4633 )
      ( MAKE-1CRATE ?auto_4630 ?auto_4631 )
      ( MAKE-1CRATE-VERIFY ?auto_4630 ?auto_4631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4635 - SURFACE
      ?auto_4636 - SURFACE
      ?auto_4637 - SURFACE
    )
    :vars
    (
      ?auto_4638 - HOIST
      ?auto_4639 - PLACE
      ?auto_4640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4638 ?auto_4639 ) ( SURFACE-AT ?auto_4636 ?auto_4639 ) ( CLEAR ?auto_4636 ) ( IS-CRATE ?auto_4637 ) ( not ( = ?auto_4636 ?auto_4637 ) ) ( TRUCK-AT ?auto_4640 ?auto_4639 ) ( AVAILABLE ?auto_4638 ) ( IN ?auto_4637 ?auto_4640 ) ( ON ?auto_4636 ?auto_4635 ) ( not ( = ?auto_4635 ?auto_4636 ) ) ( not ( = ?auto_4635 ?auto_4637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4636 ?auto_4637 )
      ( MAKE-2CRATE-VERIFY ?auto_4635 ?auto_4636 ?auto_4637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4641 - SURFACE
      ?auto_4642 - SURFACE
    )
    :vars
    (
      ?auto_4646 - HOIST
      ?auto_4644 - PLACE
      ?auto_4643 - TRUCK
      ?auto_4645 - SURFACE
      ?auto_4647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4646 ?auto_4644 ) ( SURFACE-AT ?auto_4641 ?auto_4644 ) ( CLEAR ?auto_4641 ) ( IS-CRATE ?auto_4642 ) ( not ( = ?auto_4641 ?auto_4642 ) ) ( AVAILABLE ?auto_4646 ) ( IN ?auto_4642 ?auto_4643 ) ( ON ?auto_4641 ?auto_4645 ) ( not ( = ?auto_4645 ?auto_4641 ) ) ( not ( = ?auto_4645 ?auto_4642 ) ) ( TRUCK-AT ?auto_4643 ?auto_4647 ) ( not ( = ?auto_4647 ?auto_4644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4643 ?auto_4647 ?auto_4644 )
      ( MAKE-2CRATE ?auto_4645 ?auto_4641 ?auto_4642 )
      ( MAKE-1CRATE-VERIFY ?auto_4641 ?auto_4642 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4648 - SURFACE
      ?auto_4649 - SURFACE
      ?auto_4650 - SURFACE
    )
    :vars
    (
      ?auto_4652 - HOIST
      ?auto_4653 - PLACE
      ?auto_4654 - TRUCK
      ?auto_4651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4652 ?auto_4653 ) ( SURFACE-AT ?auto_4649 ?auto_4653 ) ( CLEAR ?auto_4649 ) ( IS-CRATE ?auto_4650 ) ( not ( = ?auto_4649 ?auto_4650 ) ) ( AVAILABLE ?auto_4652 ) ( IN ?auto_4650 ?auto_4654 ) ( ON ?auto_4649 ?auto_4648 ) ( not ( = ?auto_4648 ?auto_4649 ) ) ( not ( = ?auto_4648 ?auto_4650 ) ) ( TRUCK-AT ?auto_4654 ?auto_4651 ) ( not ( = ?auto_4651 ?auto_4653 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4649 ?auto_4650 )
      ( MAKE-2CRATE-VERIFY ?auto_4648 ?auto_4649 ?auto_4650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4655 - SURFACE
      ?auto_4656 - SURFACE
    )
    :vars
    (
      ?auto_4659 - HOIST
      ?auto_4657 - PLACE
      ?auto_4658 - SURFACE
      ?auto_4660 - TRUCK
      ?auto_4661 - PLACE
      ?auto_4662 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4659 ?auto_4657 ) ( SURFACE-AT ?auto_4655 ?auto_4657 ) ( CLEAR ?auto_4655 ) ( IS-CRATE ?auto_4656 ) ( not ( = ?auto_4655 ?auto_4656 ) ) ( AVAILABLE ?auto_4659 ) ( ON ?auto_4655 ?auto_4658 ) ( not ( = ?auto_4658 ?auto_4655 ) ) ( not ( = ?auto_4658 ?auto_4656 ) ) ( TRUCK-AT ?auto_4660 ?auto_4661 ) ( not ( = ?auto_4661 ?auto_4657 ) ) ( HOIST-AT ?auto_4662 ?auto_4661 ) ( LIFTING ?auto_4662 ?auto_4656 ) ( not ( = ?auto_4659 ?auto_4662 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4662 ?auto_4656 ?auto_4660 ?auto_4661 )
      ( MAKE-2CRATE ?auto_4658 ?auto_4655 ?auto_4656 )
      ( MAKE-1CRATE-VERIFY ?auto_4655 ?auto_4656 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4663 - SURFACE
      ?auto_4664 - SURFACE
      ?auto_4665 - SURFACE
    )
    :vars
    (
      ?auto_4666 - HOIST
      ?auto_4669 - PLACE
      ?auto_4667 - TRUCK
      ?auto_4668 - PLACE
      ?auto_4670 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4666 ?auto_4669 ) ( SURFACE-AT ?auto_4664 ?auto_4669 ) ( CLEAR ?auto_4664 ) ( IS-CRATE ?auto_4665 ) ( not ( = ?auto_4664 ?auto_4665 ) ) ( AVAILABLE ?auto_4666 ) ( ON ?auto_4664 ?auto_4663 ) ( not ( = ?auto_4663 ?auto_4664 ) ) ( not ( = ?auto_4663 ?auto_4665 ) ) ( TRUCK-AT ?auto_4667 ?auto_4668 ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( HOIST-AT ?auto_4670 ?auto_4668 ) ( LIFTING ?auto_4670 ?auto_4665 ) ( not ( = ?auto_4666 ?auto_4670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4664 ?auto_4665 )
      ( MAKE-2CRATE-VERIFY ?auto_4663 ?auto_4664 ?auto_4665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4671 - SURFACE
      ?auto_4672 - SURFACE
    )
    :vars
    (
      ?auto_4675 - HOIST
      ?auto_4673 - PLACE
      ?auto_4677 - SURFACE
      ?auto_4678 - TRUCK
      ?auto_4676 - PLACE
      ?auto_4674 - HOIST
      ?auto_4679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4675 ?auto_4673 ) ( SURFACE-AT ?auto_4671 ?auto_4673 ) ( CLEAR ?auto_4671 ) ( IS-CRATE ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( AVAILABLE ?auto_4675 ) ( ON ?auto_4671 ?auto_4677 ) ( not ( = ?auto_4677 ?auto_4671 ) ) ( not ( = ?auto_4677 ?auto_4672 ) ) ( TRUCK-AT ?auto_4678 ?auto_4676 ) ( not ( = ?auto_4676 ?auto_4673 ) ) ( HOIST-AT ?auto_4674 ?auto_4676 ) ( not ( = ?auto_4675 ?auto_4674 ) ) ( AVAILABLE ?auto_4674 ) ( SURFACE-AT ?auto_4672 ?auto_4676 ) ( ON ?auto_4672 ?auto_4679 ) ( CLEAR ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4679 ) ) ( not ( = ?auto_4672 ?auto_4679 ) ) ( not ( = ?auto_4677 ?auto_4679 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4674 ?auto_4672 ?auto_4679 ?auto_4676 )
      ( MAKE-2CRATE ?auto_4677 ?auto_4671 ?auto_4672 )
      ( MAKE-1CRATE-VERIFY ?auto_4671 ?auto_4672 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4680 - SURFACE
      ?auto_4681 - SURFACE
      ?auto_4682 - SURFACE
    )
    :vars
    (
      ?auto_4685 - HOIST
      ?auto_4688 - PLACE
      ?auto_4686 - TRUCK
      ?auto_4687 - PLACE
      ?auto_4683 - HOIST
      ?auto_4684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4685 ?auto_4688 ) ( SURFACE-AT ?auto_4681 ?auto_4688 ) ( CLEAR ?auto_4681 ) ( IS-CRATE ?auto_4682 ) ( not ( = ?auto_4681 ?auto_4682 ) ) ( AVAILABLE ?auto_4685 ) ( ON ?auto_4681 ?auto_4680 ) ( not ( = ?auto_4680 ?auto_4681 ) ) ( not ( = ?auto_4680 ?auto_4682 ) ) ( TRUCK-AT ?auto_4686 ?auto_4687 ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( HOIST-AT ?auto_4683 ?auto_4687 ) ( not ( = ?auto_4685 ?auto_4683 ) ) ( AVAILABLE ?auto_4683 ) ( SURFACE-AT ?auto_4682 ?auto_4687 ) ( ON ?auto_4682 ?auto_4684 ) ( CLEAR ?auto_4682 ) ( not ( = ?auto_4681 ?auto_4684 ) ) ( not ( = ?auto_4682 ?auto_4684 ) ) ( not ( = ?auto_4680 ?auto_4684 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4681 ?auto_4682 )
      ( MAKE-2CRATE-VERIFY ?auto_4680 ?auto_4681 ?auto_4682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4689 - SURFACE
      ?auto_4690 - SURFACE
    )
    :vars
    (
      ?auto_4693 - HOIST
      ?auto_4695 - PLACE
      ?auto_4691 - SURFACE
      ?auto_4694 - PLACE
      ?auto_4697 - HOIST
      ?auto_4692 - SURFACE
      ?auto_4696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4693 ?auto_4695 ) ( SURFACE-AT ?auto_4689 ?auto_4695 ) ( CLEAR ?auto_4689 ) ( IS-CRATE ?auto_4690 ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( AVAILABLE ?auto_4693 ) ( ON ?auto_4689 ?auto_4691 ) ( not ( = ?auto_4691 ?auto_4689 ) ) ( not ( = ?auto_4691 ?auto_4690 ) ) ( not ( = ?auto_4694 ?auto_4695 ) ) ( HOIST-AT ?auto_4697 ?auto_4694 ) ( not ( = ?auto_4693 ?auto_4697 ) ) ( AVAILABLE ?auto_4697 ) ( SURFACE-AT ?auto_4690 ?auto_4694 ) ( ON ?auto_4690 ?auto_4692 ) ( CLEAR ?auto_4690 ) ( not ( = ?auto_4689 ?auto_4692 ) ) ( not ( = ?auto_4690 ?auto_4692 ) ) ( not ( = ?auto_4691 ?auto_4692 ) ) ( TRUCK-AT ?auto_4696 ?auto_4695 ) )
    :subtasks
    ( ( !DRIVE ?auto_4696 ?auto_4695 ?auto_4694 )
      ( MAKE-2CRATE ?auto_4691 ?auto_4689 ?auto_4690 )
      ( MAKE-1CRATE-VERIFY ?auto_4689 ?auto_4690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4698 - SURFACE
      ?auto_4699 - SURFACE
      ?auto_4700 - SURFACE
    )
    :vars
    (
      ?auto_4702 - HOIST
      ?auto_4706 - PLACE
      ?auto_4704 - PLACE
      ?auto_4703 - HOIST
      ?auto_4701 - SURFACE
      ?auto_4705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4702 ?auto_4706 ) ( SURFACE-AT ?auto_4699 ?auto_4706 ) ( CLEAR ?auto_4699 ) ( IS-CRATE ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4700 ) ) ( AVAILABLE ?auto_4702 ) ( ON ?auto_4699 ?auto_4698 ) ( not ( = ?auto_4698 ?auto_4699 ) ) ( not ( = ?auto_4698 ?auto_4700 ) ) ( not ( = ?auto_4704 ?auto_4706 ) ) ( HOIST-AT ?auto_4703 ?auto_4704 ) ( not ( = ?auto_4702 ?auto_4703 ) ) ( AVAILABLE ?auto_4703 ) ( SURFACE-AT ?auto_4700 ?auto_4704 ) ( ON ?auto_4700 ?auto_4701 ) ( CLEAR ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4698 ?auto_4701 ) ) ( TRUCK-AT ?auto_4705 ?auto_4706 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4699 ?auto_4700 )
      ( MAKE-2CRATE-VERIFY ?auto_4698 ?auto_4699 ?auto_4700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4707 - SURFACE
      ?auto_4708 - SURFACE
    )
    :vars
    (
      ?auto_4715 - HOIST
      ?auto_4710 - PLACE
      ?auto_4712 - SURFACE
      ?auto_4714 - PLACE
      ?auto_4711 - HOIST
      ?auto_4709 - SURFACE
      ?auto_4713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4715 ?auto_4710 ) ( IS-CRATE ?auto_4708 ) ( not ( = ?auto_4707 ?auto_4708 ) ) ( not ( = ?auto_4712 ?auto_4707 ) ) ( not ( = ?auto_4712 ?auto_4708 ) ) ( not ( = ?auto_4714 ?auto_4710 ) ) ( HOIST-AT ?auto_4711 ?auto_4714 ) ( not ( = ?auto_4715 ?auto_4711 ) ) ( AVAILABLE ?auto_4711 ) ( SURFACE-AT ?auto_4708 ?auto_4714 ) ( ON ?auto_4708 ?auto_4709 ) ( CLEAR ?auto_4708 ) ( not ( = ?auto_4707 ?auto_4709 ) ) ( not ( = ?auto_4708 ?auto_4709 ) ) ( not ( = ?auto_4712 ?auto_4709 ) ) ( TRUCK-AT ?auto_4713 ?auto_4710 ) ( SURFACE-AT ?auto_4712 ?auto_4710 ) ( CLEAR ?auto_4712 ) ( LIFTING ?auto_4715 ?auto_4707 ) ( IS-CRATE ?auto_4707 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4712 ?auto_4707 )
      ( MAKE-2CRATE ?auto_4712 ?auto_4707 ?auto_4708 )
      ( MAKE-1CRATE-VERIFY ?auto_4707 ?auto_4708 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4716 - SURFACE
      ?auto_4717 - SURFACE
      ?auto_4718 - SURFACE
    )
    :vars
    (
      ?auto_4719 - HOIST
      ?auto_4723 - PLACE
      ?auto_4722 - PLACE
      ?auto_4720 - HOIST
      ?auto_4721 - SURFACE
      ?auto_4724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4719 ?auto_4723 ) ( IS-CRATE ?auto_4718 ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( HOIST-AT ?auto_4720 ?auto_4722 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( AVAILABLE ?auto_4720 ) ( SURFACE-AT ?auto_4718 ?auto_4722 ) ( ON ?auto_4718 ?auto_4721 ) ( CLEAR ?auto_4718 ) ( not ( = ?auto_4717 ?auto_4721 ) ) ( not ( = ?auto_4718 ?auto_4721 ) ) ( not ( = ?auto_4716 ?auto_4721 ) ) ( TRUCK-AT ?auto_4724 ?auto_4723 ) ( SURFACE-AT ?auto_4716 ?auto_4723 ) ( CLEAR ?auto_4716 ) ( LIFTING ?auto_4719 ?auto_4717 ) ( IS-CRATE ?auto_4717 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4717 ?auto_4718 )
      ( MAKE-2CRATE-VERIFY ?auto_4716 ?auto_4717 ?auto_4718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4725 - SURFACE
      ?auto_4726 - SURFACE
    )
    :vars
    (
      ?auto_4733 - HOIST
      ?auto_4730 - PLACE
      ?auto_4728 - SURFACE
      ?auto_4727 - PLACE
      ?auto_4729 - HOIST
      ?auto_4732 - SURFACE
      ?auto_4731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4733 ?auto_4730 ) ( IS-CRATE ?auto_4726 ) ( not ( = ?auto_4725 ?auto_4726 ) ) ( not ( = ?auto_4728 ?auto_4725 ) ) ( not ( = ?auto_4728 ?auto_4726 ) ) ( not ( = ?auto_4727 ?auto_4730 ) ) ( HOIST-AT ?auto_4729 ?auto_4727 ) ( not ( = ?auto_4733 ?auto_4729 ) ) ( AVAILABLE ?auto_4729 ) ( SURFACE-AT ?auto_4726 ?auto_4727 ) ( ON ?auto_4726 ?auto_4732 ) ( CLEAR ?auto_4726 ) ( not ( = ?auto_4725 ?auto_4732 ) ) ( not ( = ?auto_4726 ?auto_4732 ) ) ( not ( = ?auto_4728 ?auto_4732 ) ) ( TRUCK-AT ?auto_4731 ?auto_4730 ) ( SURFACE-AT ?auto_4728 ?auto_4730 ) ( CLEAR ?auto_4728 ) ( IS-CRATE ?auto_4725 ) ( AVAILABLE ?auto_4733 ) ( IN ?auto_4725 ?auto_4731 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4733 ?auto_4725 ?auto_4731 ?auto_4730 )
      ( MAKE-2CRATE ?auto_4728 ?auto_4725 ?auto_4726 )
      ( MAKE-1CRATE-VERIFY ?auto_4725 ?auto_4726 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4734 - SURFACE
      ?auto_4735 - SURFACE
      ?auto_4736 - SURFACE
    )
    :vars
    (
      ?auto_4739 - HOIST
      ?auto_4738 - PLACE
      ?auto_4741 - PLACE
      ?auto_4737 - HOIST
      ?auto_4740 - SURFACE
      ?auto_4742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4739 ?auto_4738 ) ( IS-CRATE ?auto_4736 ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( not ( = ?auto_4734 ?auto_4735 ) ) ( not ( = ?auto_4734 ?auto_4736 ) ) ( not ( = ?auto_4741 ?auto_4738 ) ) ( HOIST-AT ?auto_4737 ?auto_4741 ) ( not ( = ?auto_4739 ?auto_4737 ) ) ( AVAILABLE ?auto_4737 ) ( SURFACE-AT ?auto_4736 ?auto_4741 ) ( ON ?auto_4736 ?auto_4740 ) ( CLEAR ?auto_4736 ) ( not ( = ?auto_4735 ?auto_4740 ) ) ( not ( = ?auto_4736 ?auto_4740 ) ) ( not ( = ?auto_4734 ?auto_4740 ) ) ( TRUCK-AT ?auto_4742 ?auto_4738 ) ( SURFACE-AT ?auto_4734 ?auto_4738 ) ( CLEAR ?auto_4734 ) ( IS-CRATE ?auto_4735 ) ( AVAILABLE ?auto_4739 ) ( IN ?auto_4735 ?auto_4742 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4735 ?auto_4736 )
      ( MAKE-2CRATE-VERIFY ?auto_4734 ?auto_4735 ?auto_4736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4743 - SURFACE
      ?auto_4744 - SURFACE
    )
    :vars
    (
      ?auto_4748 - HOIST
      ?auto_4749 - PLACE
      ?auto_4751 - SURFACE
      ?auto_4746 - PLACE
      ?auto_4745 - HOIST
      ?auto_4747 - SURFACE
      ?auto_4750 - TRUCK
      ?auto_4752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4748 ?auto_4749 ) ( IS-CRATE ?auto_4744 ) ( not ( = ?auto_4743 ?auto_4744 ) ) ( not ( = ?auto_4751 ?auto_4743 ) ) ( not ( = ?auto_4751 ?auto_4744 ) ) ( not ( = ?auto_4746 ?auto_4749 ) ) ( HOIST-AT ?auto_4745 ?auto_4746 ) ( not ( = ?auto_4748 ?auto_4745 ) ) ( AVAILABLE ?auto_4745 ) ( SURFACE-AT ?auto_4744 ?auto_4746 ) ( ON ?auto_4744 ?auto_4747 ) ( CLEAR ?auto_4744 ) ( not ( = ?auto_4743 ?auto_4747 ) ) ( not ( = ?auto_4744 ?auto_4747 ) ) ( not ( = ?auto_4751 ?auto_4747 ) ) ( SURFACE-AT ?auto_4751 ?auto_4749 ) ( CLEAR ?auto_4751 ) ( IS-CRATE ?auto_4743 ) ( AVAILABLE ?auto_4748 ) ( IN ?auto_4743 ?auto_4750 ) ( TRUCK-AT ?auto_4750 ?auto_4752 ) ( not ( = ?auto_4752 ?auto_4749 ) ) ( not ( = ?auto_4746 ?auto_4752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4750 ?auto_4752 ?auto_4749 )
      ( MAKE-2CRATE ?auto_4751 ?auto_4743 ?auto_4744 )
      ( MAKE-1CRATE-VERIFY ?auto_4743 ?auto_4744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4753 - SURFACE
      ?auto_4754 - SURFACE
      ?auto_4755 - SURFACE
    )
    :vars
    (
      ?auto_4762 - HOIST
      ?auto_4757 - PLACE
      ?auto_4758 - PLACE
      ?auto_4756 - HOIST
      ?auto_4761 - SURFACE
      ?auto_4760 - TRUCK
      ?auto_4759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4762 ?auto_4757 ) ( IS-CRATE ?auto_4755 ) ( not ( = ?auto_4754 ?auto_4755 ) ) ( not ( = ?auto_4753 ?auto_4754 ) ) ( not ( = ?auto_4753 ?auto_4755 ) ) ( not ( = ?auto_4758 ?auto_4757 ) ) ( HOIST-AT ?auto_4756 ?auto_4758 ) ( not ( = ?auto_4762 ?auto_4756 ) ) ( AVAILABLE ?auto_4756 ) ( SURFACE-AT ?auto_4755 ?auto_4758 ) ( ON ?auto_4755 ?auto_4761 ) ( CLEAR ?auto_4755 ) ( not ( = ?auto_4754 ?auto_4761 ) ) ( not ( = ?auto_4755 ?auto_4761 ) ) ( not ( = ?auto_4753 ?auto_4761 ) ) ( SURFACE-AT ?auto_4753 ?auto_4757 ) ( CLEAR ?auto_4753 ) ( IS-CRATE ?auto_4754 ) ( AVAILABLE ?auto_4762 ) ( IN ?auto_4754 ?auto_4760 ) ( TRUCK-AT ?auto_4760 ?auto_4759 ) ( not ( = ?auto_4759 ?auto_4757 ) ) ( not ( = ?auto_4758 ?auto_4759 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4754 ?auto_4755 )
      ( MAKE-2CRATE-VERIFY ?auto_4753 ?auto_4754 ?auto_4755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4763 - SURFACE
      ?auto_4764 - SURFACE
    )
    :vars
    (
      ?auto_4769 - HOIST
      ?auto_4768 - PLACE
      ?auto_4770 - SURFACE
      ?auto_4772 - PLACE
      ?auto_4766 - HOIST
      ?auto_4767 - SURFACE
      ?auto_4771 - TRUCK
      ?auto_4765 - PLACE
      ?auto_4773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4769 ?auto_4768 ) ( IS-CRATE ?auto_4764 ) ( not ( = ?auto_4763 ?auto_4764 ) ) ( not ( = ?auto_4770 ?auto_4763 ) ) ( not ( = ?auto_4770 ?auto_4764 ) ) ( not ( = ?auto_4772 ?auto_4768 ) ) ( HOIST-AT ?auto_4766 ?auto_4772 ) ( not ( = ?auto_4769 ?auto_4766 ) ) ( AVAILABLE ?auto_4766 ) ( SURFACE-AT ?auto_4764 ?auto_4772 ) ( ON ?auto_4764 ?auto_4767 ) ( CLEAR ?auto_4764 ) ( not ( = ?auto_4763 ?auto_4767 ) ) ( not ( = ?auto_4764 ?auto_4767 ) ) ( not ( = ?auto_4770 ?auto_4767 ) ) ( SURFACE-AT ?auto_4770 ?auto_4768 ) ( CLEAR ?auto_4770 ) ( IS-CRATE ?auto_4763 ) ( AVAILABLE ?auto_4769 ) ( TRUCK-AT ?auto_4771 ?auto_4765 ) ( not ( = ?auto_4765 ?auto_4768 ) ) ( not ( = ?auto_4772 ?auto_4765 ) ) ( HOIST-AT ?auto_4773 ?auto_4765 ) ( LIFTING ?auto_4773 ?auto_4763 ) ( not ( = ?auto_4769 ?auto_4773 ) ) ( not ( = ?auto_4766 ?auto_4773 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4773 ?auto_4763 ?auto_4771 ?auto_4765 )
      ( MAKE-2CRATE ?auto_4770 ?auto_4763 ?auto_4764 )
      ( MAKE-1CRATE-VERIFY ?auto_4763 ?auto_4764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4774 - SURFACE
      ?auto_4775 - SURFACE
      ?auto_4776 - SURFACE
    )
    :vars
    (
      ?auto_4777 - HOIST
      ?auto_4784 - PLACE
      ?auto_4778 - PLACE
      ?auto_4781 - HOIST
      ?auto_4783 - SURFACE
      ?auto_4780 - TRUCK
      ?auto_4779 - PLACE
      ?auto_4782 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4777 ?auto_4784 ) ( IS-CRATE ?auto_4776 ) ( not ( = ?auto_4775 ?auto_4776 ) ) ( not ( = ?auto_4774 ?auto_4775 ) ) ( not ( = ?auto_4774 ?auto_4776 ) ) ( not ( = ?auto_4778 ?auto_4784 ) ) ( HOIST-AT ?auto_4781 ?auto_4778 ) ( not ( = ?auto_4777 ?auto_4781 ) ) ( AVAILABLE ?auto_4781 ) ( SURFACE-AT ?auto_4776 ?auto_4778 ) ( ON ?auto_4776 ?auto_4783 ) ( CLEAR ?auto_4776 ) ( not ( = ?auto_4775 ?auto_4783 ) ) ( not ( = ?auto_4776 ?auto_4783 ) ) ( not ( = ?auto_4774 ?auto_4783 ) ) ( SURFACE-AT ?auto_4774 ?auto_4784 ) ( CLEAR ?auto_4774 ) ( IS-CRATE ?auto_4775 ) ( AVAILABLE ?auto_4777 ) ( TRUCK-AT ?auto_4780 ?auto_4779 ) ( not ( = ?auto_4779 ?auto_4784 ) ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( HOIST-AT ?auto_4782 ?auto_4779 ) ( LIFTING ?auto_4782 ?auto_4775 ) ( not ( = ?auto_4777 ?auto_4782 ) ) ( not ( = ?auto_4781 ?auto_4782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4775 ?auto_4776 )
      ( MAKE-2CRATE-VERIFY ?auto_4774 ?auto_4775 ?auto_4776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4785 - SURFACE
      ?auto_4786 - SURFACE
    )
    :vars
    (
      ?auto_4793 - HOIST
      ?auto_4789 - PLACE
      ?auto_4788 - SURFACE
      ?auto_4792 - PLACE
      ?auto_4795 - HOIST
      ?auto_4790 - SURFACE
      ?auto_4787 - TRUCK
      ?auto_4794 - PLACE
      ?auto_4791 - HOIST
      ?auto_4796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4793 ?auto_4789 ) ( IS-CRATE ?auto_4786 ) ( not ( = ?auto_4785 ?auto_4786 ) ) ( not ( = ?auto_4788 ?auto_4785 ) ) ( not ( = ?auto_4788 ?auto_4786 ) ) ( not ( = ?auto_4792 ?auto_4789 ) ) ( HOIST-AT ?auto_4795 ?auto_4792 ) ( not ( = ?auto_4793 ?auto_4795 ) ) ( AVAILABLE ?auto_4795 ) ( SURFACE-AT ?auto_4786 ?auto_4792 ) ( ON ?auto_4786 ?auto_4790 ) ( CLEAR ?auto_4786 ) ( not ( = ?auto_4785 ?auto_4790 ) ) ( not ( = ?auto_4786 ?auto_4790 ) ) ( not ( = ?auto_4788 ?auto_4790 ) ) ( SURFACE-AT ?auto_4788 ?auto_4789 ) ( CLEAR ?auto_4788 ) ( IS-CRATE ?auto_4785 ) ( AVAILABLE ?auto_4793 ) ( TRUCK-AT ?auto_4787 ?auto_4794 ) ( not ( = ?auto_4794 ?auto_4789 ) ) ( not ( = ?auto_4792 ?auto_4794 ) ) ( HOIST-AT ?auto_4791 ?auto_4794 ) ( not ( = ?auto_4793 ?auto_4791 ) ) ( not ( = ?auto_4795 ?auto_4791 ) ) ( AVAILABLE ?auto_4791 ) ( SURFACE-AT ?auto_4785 ?auto_4794 ) ( ON ?auto_4785 ?auto_4796 ) ( CLEAR ?auto_4785 ) ( not ( = ?auto_4785 ?auto_4796 ) ) ( not ( = ?auto_4786 ?auto_4796 ) ) ( not ( = ?auto_4788 ?auto_4796 ) ) ( not ( = ?auto_4790 ?auto_4796 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4791 ?auto_4785 ?auto_4796 ?auto_4794 )
      ( MAKE-2CRATE ?auto_4788 ?auto_4785 ?auto_4786 )
      ( MAKE-1CRATE-VERIFY ?auto_4785 ?auto_4786 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4797 - SURFACE
      ?auto_4798 - SURFACE
      ?auto_4799 - SURFACE
    )
    :vars
    (
      ?auto_4805 - HOIST
      ?auto_4800 - PLACE
      ?auto_4806 - PLACE
      ?auto_4803 - HOIST
      ?auto_4808 - SURFACE
      ?auto_4804 - TRUCK
      ?auto_4801 - PLACE
      ?auto_4802 - HOIST
      ?auto_4807 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4805 ?auto_4800 ) ( IS-CRATE ?auto_4799 ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( not ( = ?auto_4806 ?auto_4800 ) ) ( HOIST-AT ?auto_4803 ?auto_4806 ) ( not ( = ?auto_4805 ?auto_4803 ) ) ( AVAILABLE ?auto_4803 ) ( SURFACE-AT ?auto_4799 ?auto_4806 ) ( ON ?auto_4799 ?auto_4808 ) ( CLEAR ?auto_4799 ) ( not ( = ?auto_4798 ?auto_4808 ) ) ( not ( = ?auto_4799 ?auto_4808 ) ) ( not ( = ?auto_4797 ?auto_4808 ) ) ( SURFACE-AT ?auto_4797 ?auto_4800 ) ( CLEAR ?auto_4797 ) ( IS-CRATE ?auto_4798 ) ( AVAILABLE ?auto_4805 ) ( TRUCK-AT ?auto_4804 ?auto_4801 ) ( not ( = ?auto_4801 ?auto_4800 ) ) ( not ( = ?auto_4806 ?auto_4801 ) ) ( HOIST-AT ?auto_4802 ?auto_4801 ) ( not ( = ?auto_4805 ?auto_4802 ) ) ( not ( = ?auto_4803 ?auto_4802 ) ) ( AVAILABLE ?auto_4802 ) ( SURFACE-AT ?auto_4798 ?auto_4801 ) ( ON ?auto_4798 ?auto_4807 ) ( CLEAR ?auto_4798 ) ( not ( = ?auto_4798 ?auto_4807 ) ) ( not ( = ?auto_4799 ?auto_4807 ) ) ( not ( = ?auto_4797 ?auto_4807 ) ) ( not ( = ?auto_4808 ?auto_4807 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4798 ?auto_4799 )
      ( MAKE-2CRATE-VERIFY ?auto_4797 ?auto_4798 ?auto_4799 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4809 - SURFACE
      ?auto_4810 - SURFACE
    )
    :vars
    (
      ?auto_4812 - HOIST
      ?auto_4817 - PLACE
      ?auto_4816 - SURFACE
      ?auto_4815 - PLACE
      ?auto_4820 - HOIST
      ?auto_4813 - SURFACE
      ?auto_4818 - PLACE
      ?auto_4811 - HOIST
      ?auto_4819 - SURFACE
      ?auto_4814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4812 ?auto_4817 ) ( IS-CRATE ?auto_4810 ) ( not ( = ?auto_4809 ?auto_4810 ) ) ( not ( = ?auto_4816 ?auto_4809 ) ) ( not ( = ?auto_4816 ?auto_4810 ) ) ( not ( = ?auto_4815 ?auto_4817 ) ) ( HOIST-AT ?auto_4820 ?auto_4815 ) ( not ( = ?auto_4812 ?auto_4820 ) ) ( AVAILABLE ?auto_4820 ) ( SURFACE-AT ?auto_4810 ?auto_4815 ) ( ON ?auto_4810 ?auto_4813 ) ( CLEAR ?auto_4810 ) ( not ( = ?auto_4809 ?auto_4813 ) ) ( not ( = ?auto_4810 ?auto_4813 ) ) ( not ( = ?auto_4816 ?auto_4813 ) ) ( SURFACE-AT ?auto_4816 ?auto_4817 ) ( CLEAR ?auto_4816 ) ( IS-CRATE ?auto_4809 ) ( AVAILABLE ?auto_4812 ) ( not ( = ?auto_4818 ?auto_4817 ) ) ( not ( = ?auto_4815 ?auto_4818 ) ) ( HOIST-AT ?auto_4811 ?auto_4818 ) ( not ( = ?auto_4812 ?auto_4811 ) ) ( not ( = ?auto_4820 ?auto_4811 ) ) ( AVAILABLE ?auto_4811 ) ( SURFACE-AT ?auto_4809 ?auto_4818 ) ( ON ?auto_4809 ?auto_4819 ) ( CLEAR ?auto_4809 ) ( not ( = ?auto_4809 ?auto_4819 ) ) ( not ( = ?auto_4810 ?auto_4819 ) ) ( not ( = ?auto_4816 ?auto_4819 ) ) ( not ( = ?auto_4813 ?auto_4819 ) ) ( TRUCK-AT ?auto_4814 ?auto_4817 ) )
    :subtasks
    ( ( !DRIVE ?auto_4814 ?auto_4817 ?auto_4818 )
      ( MAKE-2CRATE ?auto_4816 ?auto_4809 ?auto_4810 )
      ( MAKE-1CRATE-VERIFY ?auto_4809 ?auto_4810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4821 - SURFACE
      ?auto_4822 - SURFACE
      ?auto_4823 - SURFACE
    )
    :vars
    (
      ?auto_4830 - HOIST
      ?auto_4828 - PLACE
      ?auto_4832 - PLACE
      ?auto_4825 - HOIST
      ?auto_4831 - SURFACE
      ?auto_4827 - PLACE
      ?auto_4826 - HOIST
      ?auto_4829 - SURFACE
      ?auto_4824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4830 ?auto_4828 ) ( IS-CRATE ?auto_4823 ) ( not ( = ?auto_4822 ?auto_4823 ) ) ( not ( = ?auto_4821 ?auto_4822 ) ) ( not ( = ?auto_4821 ?auto_4823 ) ) ( not ( = ?auto_4832 ?auto_4828 ) ) ( HOIST-AT ?auto_4825 ?auto_4832 ) ( not ( = ?auto_4830 ?auto_4825 ) ) ( AVAILABLE ?auto_4825 ) ( SURFACE-AT ?auto_4823 ?auto_4832 ) ( ON ?auto_4823 ?auto_4831 ) ( CLEAR ?auto_4823 ) ( not ( = ?auto_4822 ?auto_4831 ) ) ( not ( = ?auto_4823 ?auto_4831 ) ) ( not ( = ?auto_4821 ?auto_4831 ) ) ( SURFACE-AT ?auto_4821 ?auto_4828 ) ( CLEAR ?auto_4821 ) ( IS-CRATE ?auto_4822 ) ( AVAILABLE ?auto_4830 ) ( not ( = ?auto_4827 ?auto_4828 ) ) ( not ( = ?auto_4832 ?auto_4827 ) ) ( HOIST-AT ?auto_4826 ?auto_4827 ) ( not ( = ?auto_4830 ?auto_4826 ) ) ( not ( = ?auto_4825 ?auto_4826 ) ) ( AVAILABLE ?auto_4826 ) ( SURFACE-AT ?auto_4822 ?auto_4827 ) ( ON ?auto_4822 ?auto_4829 ) ( CLEAR ?auto_4822 ) ( not ( = ?auto_4822 ?auto_4829 ) ) ( not ( = ?auto_4823 ?auto_4829 ) ) ( not ( = ?auto_4821 ?auto_4829 ) ) ( not ( = ?auto_4831 ?auto_4829 ) ) ( TRUCK-AT ?auto_4824 ?auto_4828 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4822 ?auto_4823 )
      ( MAKE-2CRATE-VERIFY ?auto_4821 ?auto_4822 ?auto_4823 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4842 - SURFACE
      ?auto_4843 - SURFACE
    )
    :vars
    (
      ?auto_4844 - HOIST
      ?auto_4845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4844 ?auto_4845 ) ( SURFACE-AT ?auto_4842 ?auto_4845 ) ( CLEAR ?auto_4842 ) ( LIFTING ?auto_4844 ?auto_4843 ) ( IS-CRATE ?auto_4843 ) ( not ( = ?auto_4842 ?auto_4843 ) ) )
    :subtasks
    ( ( !DROP ?auto_4844 ?auto_4843 ?auto_4842 ?auto_4845 )
      ( MAKE-1CRATE-VERIFY ?auto_4842 ?auto_4843 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4846 - SURFACE
      ?auto_4847 - SURFACE
      ?auto_4848 - SURFACE
    )
    :vars
    (
      ?auto_4849 - HOIST
      ?auto_4850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4849 ?auto_4850 ) ( SURFACE-AT ?auto_4847 ?auto_4850 ) ( CLEAR ?auto_4847 ) ( LIFTING ?auto_4849 ?auto_4848 ) ( IS-CRATE ?auto_4848 ) ( not ( = ?auto_4847 ?auto_4848 ) ) ( ON ?auto_4847 ?auto_4846 ) ( not ( = ?auto_4846 ?auto_4847 ) ) ( not ( = ?auto_4846 ?auto_4848 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4847 ?auto_4848 )
      ( MAKE-2CRATE-VERIFY ?auto_4846 ?auto_4847 ?auto_4848 ) )
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
      ?auto_4855 - HOIST
      ?auto_4856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4855 ?auto_4856 ) ( SURFACE-AT ?auto_4853 ?auto_4856 ) ( CLEAR ?auto_4853 ) ( LIFTING ?auto_4855 ?auto_4854 ) ( IS-CRATE ?auto_4854 ) ( not ( = ?auto_4853 ?auto_4854 ) ) ( ON ?auto_4852 ?auto_4851 ) ( ON ?auto_4853 ?auto_4852 ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( not ( = ?auto_4851 ?auto_4853 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4854 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4853 ?auto_4854 )
      ( MAKE-3CRATE-VERIFY ?auto_4851 ?auto_4852 ?auto_4853 ?auto_4854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4857 - SURFACE
      ?auto_4858 - SURFACE
    )
    :vars
    (
      ?auto_4859 - HOIST
      ?auto_4860 - PLACE
      ?auto_4861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4859 ?auto_4860 ) ( SURFACE-AT ?auto_4857 ?auto_4860 ) ( CLEAR ?auto_4857 ) ( IS-CRATE ?auto_4858 ) ( not ( = ?auto_4857 ?auto_4858 ) ) ( TRUCK-AT ?auto_4861 ?auto_4860 ) ( AVAILABLE ?auto_4859 ) ( IN ?auto_4858 ?auto_4861 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4859 ?auto_4858 ?auto_4861 ?auto_4860 )
      ( MAKE-1CRATE ?auto_4857 ?auto_4858 )
      ( MAKE-1CRATE-VERIFY ?auto_4857 ?auto_4858 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4862 - SURFACE
      ?auto_4863 - SURFACE
      ?auto_4864 - SURFACE
    )
    :vars
    (
      ?auto_4865 - HOIST
      ?auto_4867 - PLACE
      ?auto_4866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4865 ?auto_4867 ) ( SURFACE-AT ?auto_4863 ?auto_4867 ) ( CLEAR ?auto_4863 ) ( IS-CRATE ?auto_4864 ) ( not ( = ?auto_4863 ?auto_4864 ) ) ( TRUCK-AT ?auto_4866 ?auto_4867 ) ( AVAILABLE ?auto_4865 ) ( IN ?auto_4864 ?auto_4866 ) ( ON ?auto_4863 ?auto_4862 ) ( not ( = ?auto_4862 ?auto_4863 ) ) ( not ( = ?auto_4862 ?auto_4864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4863 ?auto_4864 )
      ( MAKE-2CRATE-VERIFY ?auto_4862 ?auto_4863 ?auto_4864 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4868 - SURFACE
      ?auto_4869 - SURFACE
      ?auto_4870 - SURFACE
      ?auto_4871 - SURFACE
    )
    :vars
    (
      ?auto_4872 - HOIST
      ?auto_4873 - PLACE
      ?auto_4874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4872 ?auto_4873 ) ( SURFACE-AT ?auto_4870 ?auto_4873 ) ( CLEAR ?auto_4870 ) ( IS-CRATE ?auto_4871 ) ( not ( = ?auto_4870 ?auto_4871 ) ) ( TRUCK-AT ?auto_4874 ?auto_4873 ) ( AVAILABLE ?auto_4872 ) ( IN ?auto_4871 ?auto_4874 ) ( ON ?auto_4870 ?auto_4869 ) ( not ( = ?auto_4869 ?auto_4870 ) ) ( not ( = ?auto_4869 ?auto_4871 ) ) ( ON ?auto_4869 ?auto_4868 ) ( not ( = ?auto_4868 ?auto_4869 ) ) ( not ( = ?auto_4868 ?auto_4870 ) ) ( not ( = ?auto_4868 ?auto_4871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4869 ?auto_4870 ?auto_4871 )
      ( MAKE-3CRATE-VERIFY ?auto_4868 ?auto_4869 ?auto_4870 ?auto_4871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4875 - SURFACE
      ?auto_4876 - SURFACE
    )
    :vars
    (
      ?auto_4878 - HOIST
      ?auto_4879 - PLACE
      ?auto_4880 - TRUCK
      ?auto_4877 - SURFACE
      ?auto_4881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4878 ?auto_4879 ) ( SURFACE-AT ?auto_4875 ?auto_4879 ) ( CLEAR ?auto_4875 ) ( IS-CRATE ?auto_4876 ) ( not ( = ?auto_4875 ?auto_4876 ) ) ( AVAILABLE ?auto_4878 ) ( IN ?auto_4876 ?auto_4880 ) ( ON ?auto_4875 ?auto_4877 ) ( not ( = ?auto_4877 ?auto_4875 ) ) ( not ( = ?auto_4877 ?auto_4876 ) ) ( TRUCK-AT ?auto_4880 ?auto_4881 ) ( not ( = ?auto_4881 ?auto_4879 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4880 ?auto_4881 ?auto_4879 )
      ( MAKE-2CRATE ?auto_4877 ?auto_4875 ?auto_4876 )
      ( MAKE-1CRATE-VERIFY ?auto_4875 ?auto_4876 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4882 - SURFACE
      ?auto_4883 - SURFACE
      ?auto_4884 - SURFACE
    )
    :vars
    (
      ?auto_4887 - HOIST
      ?auto_4886 - PLACE
      ?auto_4888 - TRUCK
      ?auto_4885 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4887 ?auto_4886 ) ( SURFACE-AT ?auto_4883 ?auto_4886 ) ( CLEAR ?auto_4883 ) ( IS-CRATE ?auto_4884 ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( AVAILABLE ?auto_4887 ) ( IN ?auto_4884 ?auto_4888 ) ( ON ?auto_4883 ?auto_4882 ) ( not ( = ?auto_4882 ?auto_4883 ) ) ( not ( = ?auto_4882 ?auto_4884 ) ) ( TRUCK-AT ?auto_4888 ?auto_4885 ) ( not ( = ?auto_4885 ?auto_4886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4883 ?auto_4884 )
      ( MAKE-2CRATE-VERIFY ?auto_4882 ?auto_4883 ?auto_4884 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4889 - SURFACE
      ?auto_4890 - SURFACE
      ?auto_4891 - SURFACE
      ?auto_4892 - SURFACE
    )
    :vars
    (
      ?auto_4893 - HOIST
      ?auto_4895 - PLACE
      ?auto_4896 - TRUCK
      ?auto_4894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4893 ?auto_4895 ) ( SURFACE-AT ?auto_4891 ?auto_4895 ) ( CLEAR ?auto_4891 ) ( IS-CRATE ?auto_4892 ) ( not ( = ?auto_4891 ?auto_4892 ) ) ( AVAILABLE ?auto_4893 ) ( IN ?auto_4892 ?auto_4896 ) ( ON ?auto_4891 ?auto_4890 ) ( not ( = ?auto_4890 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4892 ) ) ( TRUCK-AT ?auto_4896 ?auto_4894 ) ( not ( = ?auto_4894 ?auto_4895 ) ) ( ON ?auto_4890 ?auto_4889 ) ( not ( = ?auto_4889 ?auto_4890 ) ) ( not ( = ?auto_4889 ?auto_4891 ) ) ( not ( = ?auto_4889 ?auto_4892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4890 ?auto_4891 ?auto_4892 )
      ( MAKE-3CRATE-VERIFY ?auto_4889 ?auto_4890 ?auto_4891 ?auto_4892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4897 - SURFACE
      ?auto_4898 - SURFACE
    )
    :vars
    (
      ?auto_4899 - HOIST
      ?auto_4902 - PLACE
      ?auto_4901 - SURFACE
      ?auto_4903 - TRUCK
      ?auto_4900 - PLACE
      ?auto_4904 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4899 ?auto_4902 ) ( SURFACE-AT ?auto_4897 ?auto_4902 ) ( CLEAR ?auto_4897 ) ( IS-CRATE ?auto_4898 ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( AVAILABLE ?auto_4899 ) ( ON ?auto_4897 ?auto_4901 ) ( not ( = ?auto_4901 ?auto_4897 ) ) ( not ( = ?auto_4901 ?auto_4898 ) ) ( TRUCK-AT ?auto_4903 ?auto_4900 ) ( not ( = ?auto_4900 ?auto_4902 ) ) ( HOIST-AT ?auto_4904 ?auto_4900 ) ( LIFTING ?auto_4904 ?auto_4898 ) ( not ( = ?auto_4899 ?auto_4904 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4904 ?auto_4898 ?auto_4903 ?auto_4900 )
      ( MAKE-2CRATE ?auto_4901 ?auto_4897 ?auto_4898 )
      ( MAKE-1CRATE-VERIFY ?auto_4897 ?auto_4898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4905 - SURFACE
      ?auto_4906 - SURFACE
      ?auto_4907 - SURFACE
    )
    :vars
    (
      ?auto_4912 - HOIST
      ?auto_4908 - PLACE
      ?auto_4909 - TRUCK
      ?auto_4911 - PLACE
      ?auto_4910 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4912 ?auto_4908 ) ( SURFACE-AT ?auto_4906 ?auto_4908 ) ( CLEAR ?auto_4906 ) ( IS-CRATE ?auto_4907 ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( AVAILABLE ?auto_4912 ) ( ON ?auto_4906 ?auto_4905 ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( not ( = ?auto_4905 ?auto_4907 ) ) ( TRUCK-AT ?auto_4909 ?auto_4911 ) ( not ( = ?auto_4911 ?auto_4908 ) ) ( HOIST-AT ?auto_4910 ?auto_4911 ) ( LIFTING ?auto_4910 ?auto_4907 ) ( not ( = ?auto_4912 ?auto_4910 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4906 ?auto_4907 )
      ( MAKE-2CRATE-VERIFY ?auto_4905 ?auto_4906 ?auto_4907 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4913 - SURFACE
      ?auto_4914 - SURFACE
      ?auto_4915 - SURFACE
      ?auto_4916 - SURFACE
    )
    :vars
    (
      ?auto_4918 - HOIST
      ?auto_4920 - PLACE
      ?auto_4919 - TRUCK
      ?auto_4917 - PLACE
      ?auto_4921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4918 ?auto_4920 ) ( SURFACE-AT ?auto_4915 ?auto_4920 ) ( CLEAR ?auto_4915 ) ( IS-CRATE ?auto_4916 ) ( not ( = ?auto_4915 ?auto_4916 ) ) ( AVAILABLE ?auto_4918 ) ( ON ?auto_4915 ?auto_4914 ) ( not ( = ?auto_4914 ?auto_4915 ) ) ( not ( = ?auto_4914 ?auto_4916 ) ) ( TRUCK-AT ?auto_4919 ?auto_4917 ) ( not ( = ?auto_4917 ?auto_4920 ) ) ( HOIST-AT ?auto_4921 ?auto_4917 ) ( LIFTING ?auto_4921 ?auto_4916 ) ( not ( = ?auto_4918 ?auto_4921 ) ) ( ON ?auto_4914 ?auto_4913 ) ( not ( = ?auto_4913 ?auto_4914 ) ) ( not ( = ?auto_4913 ?auto_4915 ) ) ( not ( = ?auto_4913 ?auto_4916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4914 ?auto_4915 ?auto_4916 )
      ( MAKE-3CRATE-VERIFY ?auto_4913 ?auto_4914 ?auto_4915 ?auto_4916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4922 - SURFACE
      ?auto_4923 - SURFACE
    )
    :vars
    (
      ?auto_4925 - HOIST
      ?auto_4927 - PLACE
      ?auto_4929 - SURFACE
      ?auto_4926 - TRUCK
      ?auto_4924 - PLACE
      ?auto_4928 - HOIST
      ?auto_4930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4925 ?auto_4927 ) ( SURFACE-AT ?auto_4922 ?auto_4927 ) ( CLEAR ?auto_4922 ) ( IS-CRATE ?auto_4923 ) ( not ( = ?auto_4922 ?auto_4923 ) ) ( AVAILABLE ?auto_4925 ) ( ON ?auto_4922 ?auto_4929 ) ( not ( = ?auto_4929 ?auto_4922 ) ) ( not ( = ?auto_4929 ?auto_4923 ) ) ( TRUCK-AT ?auto_4926 ?auto_4924 ) ( not ( = ?auto_4924 ?auto_4927 ) ) ( HOIST-AT ?auto_4928 ?auto_4924 ) ( not ( = ?auto_4925 ?auto_4928 ) ) ( AVAILABLE ?auto_4928 ) ( SURFACE-AT ?auto_4923 ?auto_4924 ) ( ON ?auto_4923 ?auto_4930 ) ( CLEAR ?auto_4923 ) ( not ( = ?auto_4922 ?auto_4930 ) ) ( not ( = ?auto_4923 ?auto_4930 ) ) ( not ( = ?auto_4929 ?auto_4930 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4928 ?auto_4923 ?auto_4930 ?auto_4924 )
      ( MAKE-2CRATE ?auto_4929 ?auto_4922 ?auto_4923 )
      ( MAKE-1CRATE-VERIFY ?auto_4922 ?auto_4923 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4931 - SURFACE
      ?auto_4932 - SURFACE
      ?auto_4933 - SURFACE
    )
    :vars
    (
      ?auto_4938 - HOIST
      ?auto_4935 - PLACE
      ?auto_4936 - TRUCK
      ?auto_4937 - PLACE
      ?auto_4939 - HOIST
      ?auto_4934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4938 ?auto_4935 ) ( SURFACE-AT ?auto_4932 ?auto_4935 ) ( CLEAR ?auto_4932 ) ( IS-CRATE ?auto_4933 ) ( not ( = ?auto_4932 ?auto_4933 ) ) ( AVAILABLE ?auto_4938 ) ( ON ?auto_4932 ?auto_4931 ) ( not ( = ?auto_4931 ?auto_4932 ) ) ( not ( = ?auto_4931 ?auto_4933 ) ) ( TRUCK-AT ?auto_4936 ?auto_4937 ) ( not ( = ?auto_4937 ?auto_4935 ) ) ( HOIST-AT ?auto_4939 ?auto_4937 ) ( not ( = ?auto_4938 ?auto_4939 ) ) ( AVAILABLE ?auto_4939 ) ( SURFACE-AT ?auto_4933 ?auto_4937 ) ( ON ?auto_4933 ?auto_4934 ) ( CLEAR ?auto_4933 ) ( not ( = ?auto_4932 ?auto_4934 ) ) ( not ( = ?auto_4933 ?auto_4934 ) ) ( not ( = ?auto_4931 ?auto_4934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4932 ?auto_4933 )
      ( MAKE-2CRATE-VERIFY ?auto_4931 ?auto_4932 ?auto_4933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4940 - SURFACE
      ?auto_4941 - SURFACE
      ?auto_4942 - SURFACE
      ?auto_4943 - SURFACE
    )
    :vars
    (
      ?auto_4945 - HOIST
      ?auto_4946 - PLACE
      ?auto_4949 - TRUCK
      ?auto_4947 - PLACE
      ?auto_4944 - HOIST
      ?auto_4948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4945 ?auto_4946 ) ( SURFACE-AT ?auto_4942 ?auto_4946 ) ( CLEAR ?auto_4942 ) ( IS-CRATE ?auto_4943 ) ( not ( = ?auto_4942 ?auto_4943 ) ) ( AVAILABLE ?auto_4945 ) ( ON ?auto_4942 ?auto_4941 ) ( not ( = ?auto_4941 ?auto_4942 ) ) ( not ( = ?auto_4941 ?auto_4943 ) ) ( TRUCK-AT ?auto_4949 ?auto_4947 ) ( not ( = ?auto_4947 ?auto_4946 ) ) ( HOIST-AT ?auto_4944 ?auto_4947 ) ( not ( = ?auto_4945 ?auto_4944 ) ) ( AVAILABLE ?auto_4944 ) ( SURFACE-AT ?auto_4943 ?auto_4947 ) ( ON ?auto_4943 ?auto_4948 ) ( CLEAR ?auto_4943 ) ( not ( = ?auto_4942 ?auto_4948 ) ) ( not ( = ?auto_4943 ?auto_4948 ) ) ( not ( = ?auto_4941 ?auto_4948 ) ) ( ON ?auto_4941 ?auto_4940 ) ( not ( = ?auto_4940 ?auto_4941 ) ) ( not ( = ?auto_4940 ?auto_4942 ) ) ( not ( = ?auto_4940 ?auto_4943 ) ) ( not ( = ?auto_4940 ?auto_4948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4941 ?auto_4942 ?auto_4943 )
      ( MAKE-3CRATE-VERIFY ?auto_4940 ?auto_4941 ?auto_4942 ?auto_4943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4950 - SURFACE
      ?auto_4951 - SURFACE
    )
    :vars
    (
      ?auto_4954 - HOIST
      ?auto_4955 - PLACE
      ?auto_4952 - SURFACE
      ?auto_4956 - PLACE
      ?auto_4953 - HOIST
      ?auto_4957 - SURFACE
      ?auto_4958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4954 ?auto_4955 ) ( SURFACE-AT ?auto_4950 ?auto_4955 ) ( CLEAR ?auto_4950 ) ( IS-CRATE ?auto_4951 ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( AVAILABLE ?auto_4954 ) ( ON ?auto_4950 ?auto_4952 ) ( not ( = ?auto_4952 ?auto_4950 ) ) ( not ( = ?auto_4952 ?auto_4951 ) ) ( not ( = ?auto_4956 ?auto_4955 ) ) ( HOIST-AT ?auto_4953 ?auto_4956 ) ( not ( = ?auto_4954 ?auto_4953 ) ) ( AVAILABLE ?auto_4953 ) ( SURFACE-AT ?auto_4951 ?auto_4956 ) ( ON ?auto_4951 ?auto_4957 ) ( CLEAR ?auto_4951 ) ( not ( = ?auto_4950 ?auto_4957 ) ) ( not ( = ?auto_4951 ?auto_4957 ) ) ( not ( = ?auto_4952 ?auto_4957 ) ) ( TRUCK-AT ?auto_4958 ?auto_4955 ) )
    :subtasks
    ( ( !DRIVE ?auto_4958 ?auto_4955 ?auto_4956 )
      ( MAKE-2CRATE ?auto_4952 ?auto_4950 ?auto_4951 )
      ( MAKE-1CRATE-VERIFY ?auto_4950 ?auto_4951 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4959 - SURFACE
      ?auto_4960 - SURFACE
      ?auto_4961 - SURFACE
    )
    :vars
    (
      ?auto_4962 - HOIST
      ?auto_4964 - PLACE
      ?auto_4967 - PLACE
      ?auto_4966 - HOIST
      ?auto_4965 - SURFACE
      ?auto_4963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4962 ?auto_4964 ) ( SURFACE-AT ?auto_4960 ?auto_4964 ) ( CLEAR ?auto_4960 ) ( IS-CRATE ?auto_4961 ) ( not ( = ?auto_4960 ?auto_4961 ) ) ( AVAILABLE ?auto_4962 ) ( ON ?auto_4960 ?auto_4959 ) ( not ( = ?auto_4959 ?auto_4960 ) ) ( not ( = ?auto_4959 ?auto_4961 ) ) ( not ( = ?auto_4967 ?auto_4964 ) ) ( HOIST-AT ?auto_4966 ?auto_4967 ) ( not ( = ?auto_4962 ?auto_4966 ) ) ( AVAILABLE ?auto_4966 ) ( SURFACE-AT ?auto_4961 ?auto_4967 ) ( ON ?auto_4961 ?auto_4965 ) ( CLEAR ?auto_4961 ) ( not ( = ?auto_4960 ?auto_4965 ) ) ( not ( = ?auto_4961 ?auto_4965 ) ) ( not ( = ?auto_4959 ?auto_4965 ) ) ( TRUCK-AT ?auto_4963 ?auto_4964 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4960 ?auto_4961 )
      ( MAKE-2CRATE-VERIFY ?auto_4959 ?auto_4960 ?auto_4961 ) )
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
      ?auto_4977 - HOIST
      ?auto_4974 - PLACE
      ?auto_4976 - PLACE
      ?auto_4972 - HOIST
      ?auto_4975 - SURFACE
      ?auto_4973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4977 ?auto_4974 ) ( SURFACE-AT ?auto_4970 ?auto_4974 ) ( CLEAR ?auto_4970 ) ( IS-CRATE ?auto_4971 ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( AVAILABLE ?auto_4977 ) ( ON ?auto_4970 ?auto_4969 ) ( not ( = ?auto_4969 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4971 ) ) ( not ( = ?auto_4976 ?auto_4974 ) ) ( HOIST-AT ?auto_4972 ?auto_4976 ) ( not ( = ?auto_4977 ?auto_4972 ) ) ( AVAILABLE ?auto_4972 ) ( SURFACE-AT ?auto_4971 ?auto_4976 ) ( ON ?auto_4971 ?auto_4975 ) ( CLEAR ?auto_4971 ) ( not ( = ?auto_4970 ?auto_4975 ) ) ( not ( = ?auto_4971 ?auto_4975 ) ) ( not ( = ?auto_4969 ?auto_4975 ) ) ( TRUCK-AT ?auto_4973 ?auto_4974 ) ( ON ?auto_4969 ?auto_4968 ) ( not ( = ?auto_4968 ?auto_4969 ) ) ( not ( = ?auto_4968 ?auto_4970 ) ) ( not ( = ?auto_4968 ?auto_4971 ) ) ( not ( = ?auto_4968 ?auto_4975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4969 ?auto_4970 ?auto_4971 )
      ( MAKE-3CRATE-VERIFY ?auto_4968 ?auto_4969 ?auto_4970 ?auto_4971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4978 - SURFACE
      ?auto_4979 - SURFACE
    )
    :vars
    (
      ?auto_4986 - HOIST
      ?auto_4982 - PLACE
      ?auto_4983 - SURFACE
      ?auto_4985 - PLACE
      ?auto_4980 - HOIST
      ?auto_4984 - SURFACE
      ?auto_4981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4986 ?auto_4982 ) ( IS-CRATE ?auto_4979 ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( not ( = ?auto_4983 ?auto_4978 ) ) ( not ( = ?auto_4983 ?auto_4979 ) ) ( not ( = ?auto_4985 ?auto_4982 ) ) ( HOIST-AT ?auto_4980 ?auto_4985 ) ( not ( = ?auto_4986 ?auto_4980 ) ) ( AVAILABLE ?auto_4980 ) ( SURFACE-AT ?auto_4979 ?auto_4985 ) ( ON ?auto_4979 ?auto_4984 ) ( CLEAR ?auto_4979 ) ( not ( = ?auto_4978 ?auto_4984 ) ) ( not ( = ?auto_4979 ?auto_4984 ) ) ( not ( = ?auto_4983 ?auto_4984 ) ) ( TRUCK-AT ?auto_4981 ?auto_4982 ) ( SURFACE-AT ?auto_4983 ?auto_4982 ) ( CLEAR ?auto_4983 ) ( LIFTING ?auto_4986 ?auto_4978 ) ( IS-CRATE ?auto_4978 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4983 ?auto_4978 )
      ( MAKE-2CRATE ?auto_4983 ?auto_4978 ?auto_4979 )
      ( MAKE-1CRATE-VERIFY ?auto_4978 ?auto_4979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4987 - SURFACE
      ?auto_4988 - SURFACE
      ?auto_4989 - SURFACE
    )
    :vars
    (
      ?auto_4991 - HOIST
      ?auto_4994 - PLACE
      ?auto_4990 - PLACE
      ?auto_4993 - HOIST
      ?auto_4992 - SURFACE
      ?auto_4995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4991 ?auto_4994 ) ( IS-CRATE ?auto_4989 ) ( not ( = ?auto_4988 ?auto_4989 ) ) ( not ( = ?auto_4987 ?auto_4988 ) ) ( not ( = ?auto_4987 ?auto_4989 ) ) ( not ( = ?auto_4990 ?auto_4994 ) ) ( HOIST-AT ?auto_4993 ?auto_4990 ) ( not ( = ?auto_4991 ?auto_4993 ) ) ( AVAILABLE ?auto_4993 ) ( SURFACE-AT ?auto_4989 ?auto_4990 ) ( ON ?auto_4989 ?auto_4992 ) ( CLEAR ?auto_4989 ) ( not ( = ?auto_4988 ?auto_4992 ) ) ( not ( = ?auto_4989 ?auto_4992 ) ) ( not ( = ?auto_4987 ?auto_4992 ) ) ( TRUCK-AT ?auto_4995 ?auto_4994 ) ( SURFACE-AT ?auto_4987 ?auto_4994 ) ( CLEAR ?auto_4987 ) ( LIFTING ?auto_4991 ?auto_4988 ) ( IS-CRATE ?auto_4988 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4988 ?auto_4989 )
      ( MAKE-2CRATE-VERIFY ?auto_4987 ?auto_4988 ?auto_4989 ) )
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
      ?auto_5001 - HOIST
      ?auto_5003 - PLACE
      ?auto_5005 - PLACE
      ?auto_5002 - HOIST
      ?auto_5004 - SURFACE
      ?auto_5000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5001 ?auto_5003 ) ( IS-CRATE ?auto_4999 ) ( not ( = ?auto_4998 ?auto_4999 ) ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( not ( = ?auto_4997 ?auto_4999 ) ) ( not ( = ?auto_5005 ?auto_5003 ) ) ( HOIST-AT ?auto_5002 ?auto_5005 ) ( not ( = ?auto_5001 ?auto_5002 ) ) ( AVAILABLE ?auto_5002 ) ( SURFACE-AT ?auto_4999 ?auto_5005 ) ( ON ?auto_4999 ?auto_5004 ) ( CLEAR ?auto_4999 ) ( not ( = ?auto_4998 ?auto_5004 ) ) ( not ( = ?auto_4999 ?auto_5004 ) ) ( not ( = ?auto_4997 ?auto_5004 ) ) ( TRUCK-AT ?auto_5000 ?auto_5003 ) ( SURFACE-AT ?auto_4997 ?auto_5003 ) ( CLEAR ?auto_4997 ) ( LIFTING ?auto_5001 ?auto_4998 ) ( IS-CRATE ?auto_4998 ) ( ON ?auto_4997 ?auto_4996 ) ( not ( = ?auto_4996 ?auto_4997 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_4999 ) ) ( not ( = ?auto_4996 ?auto_5004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4997 ?auto_4998 ?auto_4999 )
      ( MAKE-3CRATE-VERIFY ?auto_4996 ?auto_4997 ?auto_4998 ?auto_4999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5006 - SURFACE
      ?auto_5007 - SURFACE
    )
    :vars
    (
      ?auto_5010 - HOIST
      ?auto_5012 - PLACE
      ?auto_5008 - SURFACE
      ?auto_5014 - PLACE
      ?auto_5011 - HOIST
      ?auto_5013 - SURFACE
      ?auto_5009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5010 ?auto_5012 ) ( IS-CRATE ?auto_5007 ) ( not ( = ?auto_5006 ?auto_5007 ) ) ( not ( = ?auto_5008 ?auto_5006 ) ) ( not ( = ?auto_5008 ?auto_5007 ) ) ( not ( = ?auto_5014 ?auto_5012 ) ) ( HOIST-AT ?auto_5011 ?auto_5014 ) ( not ( = ?auto_5010 ?auto_5011 ) ) ( AVAILABLE ?auto_5011 ) ( SURFACE-AT ?auto_5007 ?auto_5014 ) ( ON ?auto_5007 ?auto_5013 ) ( CLEAR ?auto_5007 ) ( not ( = ?auto_5006 ?auto_5013 ) ) ( not ( = ?auto_5007 ?auto_5013 ) ) ( not ( = ?auto_5008 ?auto_5013 ) ) ( TRUCK-AT ?auto_5009 ?auto_5012 ) ( SURFACE-AT ?auto_5008 ?auto_5012 ) ( CLEAR ?auto_5008 ) ( IS-CRATE ?auto_5006 ) ( AVAILABLE ?auto_5010 ) ( IN ?auto_5006 ?auto_5009 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5010 ?auto_5006 ?auto_5009 ?auto_5012 )
      ( MAKE-2CRATE ?auto_5008 ?auto_5006 ?auto_5007 )
      ( MAKE-1CRATE-VERIFY ?auto_5006 ?auto_5007 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5015 - SURFACE
      ?auto_5016 - SURFACE
      ?auto_5017 - SURFACE
    )
    :vars
    (
      ?auto_5019 - HOIST
      ?auto_5020 - PLACE
      ?auto_5021 - PLACE
      ?auto_5022 - HOIST
      ?auto_5018 - SURFACE
      ?auto_5023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5019 ?auto_5020 ) ( IS-CRATE ?auto_5017 ) ( not ( = ?auto_5016 ?auto_5017 ) ) ( not ( = ?auto_5015 ?auto_5016 ) ) ( not ( = ?auto_5015 ?auto_5017 ) ) ( not ( = ?auto_5021 ?auto_5020 ) ) ( HOIST-AT ?auto_5022 ?auto_5021 ) ( not ( = ?auto_5019 ?auto_5022 ) ) ( AVAILABLE ?auto_5022 ) ( SURFACE-AT ?auto_5017 ?auto_5021 ) ( ON ?auto_5017 ?auto_5018 ) ( CLEAR ?auto_5017 ) ( not ( = ?auto_5016 ?auto_5018 ) ) ( not ( = ?auto_5017 ?auto_5018 ) ) ( not ( = ?auto_5015 ?auto_5018 ) ) ( TRUCK-AT ?auto_5023 ?auto_5020 ) ( SURFACE-AT ?auto_5015 ?auto_5020 ) ( CLEAR ?auto_5015 ) ( IS-CRATE ?auto_5016 ) ( AVAILABLE ?auto_5019 ) ( IN ?auto_5016 ?auto_5023 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5016 ?auto_5017 )
      ( MAKE-2CRATE-VERIFY ?auto_5015 ?auto_5016 ?auto_5017 ) )
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
      ?auto_5029 - HOIST
      ?auto_5033 - PLACE
      ?auto_5031 - PLACE
      ?auto_5032 - HOIST
      ?auto_5028 - SURFACE
      ?auto_5030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5029 ?auto_5033 ) ( IS-CRATE ?auto_5027 ) ( not ( = ?auto_5026 ?auto_5027 ) ) ( not ( = ?auto_5025 ?auto_5026 ) ) ( not ( = ?auto_5025 ?auto_5027 ) ) ( not ( = ?auto_5031 ?auto_5033 ) ) ( HOIST-AT ?auto_5032 ?auto_5031 ) ( not ( = ?auto_5029 ?auto_5032 ) ) ( AVAILABLE ?auto_5032 ) ( SURFACE-AT ?auto_5027 ?auto_5031 ) ( ON ?auto_5027 ?auto_5028 ) ( CLEAR ?auto_5027 ) ( not ( = ?auto_5026 ?auto_5028 ) ) ( not ( = ?auto_5027 ?auto_5028 ) ) ( not ( = ?auto_5025 ?auto_5028 ) ) ( TRUCK-AT ?auto_5030 ?auto_5033 ) ( SURFACE-AT ?auto_5025 ?auto_5033 ) ( CLEAR ?auto_5025 ) ( IS-CRATE ?auto_5026 ) ( AVAILABLE ?auto_5029 ) ( IN ?auto_5026 ?auto_5030 ) ( ON ?auto_5025 ?auto_5024 ) ( not ( = ?auto_5024 ?auto_5025 ) ) ( not ( = ?auto_5024 ?auto_5026 ) ) ( not ( = ?auto_5024 ?auto_5027 ) ) ( not ( = ?auto_5024 ?auto_5028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5025 ?auto_5026 ?auto_5027 )
      ( MAKE-3CRATE-VERIFY ?auto_5024 ?auto_5025 ?auto_5026 ?auto_5027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5034 - SURFACE
      ?auto_5035 - SURFACE
    )
    :vars
    (
      ?auto_5037 - HOIST
      ?auto_5042 - PLACE
      ?auto_5038 - SURFACE
      ?auto_5040 - PLACE
      ?auto_5041 - HOIST
      ?auto_5036 - SURFACE
      ?auto_5039 - TRUCK
      ?auto_5043 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5037 ?auto_5042 ) ( IS-CRATE ?auto_5035 ) ( not ( = ?auto_5034 ?auto_5035 ) ) ( not ( = ?auto_5038 ?auto_5034 ) ) ( not ( = ?auto_5038 ?auto_5035 ) ) ( not ( = ?auto_5040 ?auto_5042 ) ) ( HOIST-AT ?auto_5041 ?auto_5040 ) ( not ( = ?auto_5037 ?auto_5041 ) ) ( AVAILABLE ?auto_5041 ) ( SURFACE-AT ?auto_5035 ?auto_5040 ) ( ON ?auto_5035 ?auto_5036 ) ( CLEAR ?auto_5035 ) ( not ( = ?auto_5034 ?auto_5036 ) ) ( not ( = ?auto_5035 ?auto_5036 ) ) ( not ( = ?auto_5038 ?auto_5036 ) ) ( SURFACE-AT ?auto_5038 ?auto_5042 ) ( CLEAR ?auto_5038 ) ( IS-CRATE ?auto_5034 ) ( AVAILABLE ?auto_5037 ) ( IN ?auto_5034 ?auto_5039 ) ( TRUCK-AT ?auto_5039 ?auto_5043 ) ( not ( = ?auto_5043 ?auto_5042 ) ) ( not ( = ?auto_5040 ?auto_5043 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5039 ?auto_5043 ?auto_5042 )
      ( MAKE-2CRATE ?auto_5038 ?auto_5034 ?auto_5035 )
      ( MAKE-1CRATE-VERIFY ?auto_5034 ?auto_5035 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5044 - SURFACE
      ?auto_5045 - SURFACE
      ?auto_5046 - SURFACE
    )
    :vars
    (
      ?auto_5048 - HOIST
      ?auto_5047 - PLACE
      ?auto_5049 - PLACE
      ?auto_5052 - HOIST
      ?auto_5051 - SURFACE
      ?auto_5050 - TRUCK
      ?auto_5053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5048 ?auto_5047 ) ( IS-CRATE ?auto_5046 ) ( not ( = ?auto_5045 ?auto_5046 ) ) ( not ( = ?auto_5044 ?auto_5045 ) ) ( not ( = ?auto_5044 ?auto_5046 ) ) ( not ( = ?auto_5049 ?auto_5047 ) ) ( HOIST-AT ?auto_5052 ?auto_5049 ) ( not ( = ?auto_5048 ?auto_5052 ) ) ( AVAILABLE ?auto_5052 ) ( SURFACE-AT ?auto_5046 ?auto_5049 ) ( ON ?auto_5046 ?auto_5051 ) ( CLEAR ?auto_5046 ) ( not ( = ?auto_5045 ?auto_5051 ) ) ( not ( = ?auto_5046 ?auto_5051 ) ) ( not ( = ?auto_5044 ?auto_5051 ) ) ( SURFACE-AT ?auto_5044 ?auto_5047 ) ( CLEAR ?auto_5044 ) ( IS-CRATE ?auto_5045 ) ( AVAILABLE ?auto_5048 ) ( IN ?auto_5045 ?auto_5050 ) ( TRUCK-AT ?auto_5050 ?auto_5053 ) ( not ( = ?auto_5053 ?auto_5047 ) ) ( not ( = ?auto_5049 ?auto_5053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5045 ?auto_5046 )
      ( MAKE-2CRATE-VERIFY ?auto_5044 ?auto_5045 ?auto_5046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5054 - SURFACE
      ?auto_5055 - SURFACE
      ?auto_5056 - SURFACE
      ?auto_5057 - SURFACE
    )
    :vars
    (
      ?auto_5064 - HOIST
      ?auto_5058 - PLACE
      ?auto_5063 - PLACE
      ?auto_5062 - HOIST
      ?auto_5060 - SURFACE
      ?auto_5061 - TRUCK
      ?auto_5059 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5064 ?auto_5058 ) ( IS-CRATE ?auto_5057 ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( not ( = ?auto_5055 ?auto_5056 ) ) ( not ( = ?auto_5055 ?auto_5057 ) ) ( not ( = ?auto_5063 ?auto_5058 ) ) ( HOIST-AT ?auto_5062 ?auto_5063 ) ( not ( = ?auto_5064 ?auto_5062 ) ) ( AVAILABLE ?auto_5062 ) ( SURFACE-AT ?auto_5057 ?auto_5063 ) ( ON ?auto_5057 ?auto_5060 ) ( CLEAR ?auto_5057 ) ( not ( = ?auto_5056 ?auto_5060 ) ) ( not ( = ?auto_5057 ?auto_5060 ) ) ( not ( = ?auto_5055 ?auto_5060 ) ) ( SURFACE-AT ?auto_5055 ?auto_5058 ) ( CLEAR ?auto_5055 ) ( IS-CRATE ?auto_5056 ) ( AVAILABLE ?auto_5064 ) ( IN ?auto_5056 ?auto_5061 ) ( TRUCK-AT ?auto_5061 ?auto_5059 ) ( not ( = ?auto_5059 ?auto_5058 ) ) ( not ( = ?auto_5063 ?auto_5059 ) ) ( ON ?auto_5055 ?auto_5054 ) ( not ( = ?auto_5054 ?auto_5055 ) ) ( not ( = ?auto_5054 ?auto_5056 ) ) ( not ( = ?auto_5054 ?auto_5057 ) ) ( not ( = ?auto_5054 ?auto_5060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5055 ?auto_5056 ?auto_5057 )
      ( MAKE-3CRATE-VERIFY ?auto_5054 ?auto_5055 ?auto_5056 ?auto_5057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5065 - SURFACE
      ?auto_5066 - SURFACE
    )
    :vars
    (
      ?auto_5074 - HOIST
      ?auto_5067 - PLACE
      ?auto_5072 - SURFACE
      ?auto_5073 - PLACE
      ?auto_5071 - HOIST
      ?auto_5069 - SURFACE
      ?auto_5070 - TRUCK
      ?auto_5068 - PLACE
      ?auto_5075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5074 ?auto_5067 ) ( IS-CRATE ?auto_5066 ) ( not ( = ?auto_5065 ?auto_5066 ) ) ( not ( = ?auto_5072 ?auto_5065 ) ) ( not ( = ?auto_5072 ?auto_5066 ) ) ( not ( = ?auto_5073 ?auto_5067 ) ) ( HOIST-AT ?auto_5071 ?auto_5073 ) ( not ( = ?auto_5074 ?auto_5071 ) ) ( AVAILABLE ?auto_5071 ) ( SURFACE-AT ?auto_5066 ?auto_5073 ) ( ON ?auto_5066 ?auto_5069 ) ( CLEAR ?auto_5066 ) ( not ( = ?auto_5065 ?auto_5069 ) ) ( not ( = ?auto_5066 ?auto_5069 ) ) ( not ( = ?auto_5072 ?auto_5069 ) ) ( SURFACE-AT ?auto_5072 ?auto_5067 ) ( CLEAR ?auto_5072 ) ( IS-CRATE ?auto_5065 ) ( AVAILABLE ?auto_5074 ) ( TRUCK-AT ?auto_5070 ?auto_5068 ) ( not ( = ?auto_5068 ?auto_5067 ) ) ( not ( = ?auto_5073 ?auto_5068 ) ) ( HOIST-AT ?auto_5075 ?auto_5068 ) ( LIFTING ?auto_5075 ?auto_5065 ) ( not ( = ?auto_5074 ?auto_5075 ) ) ( not ( = ?auto_5071 ?auto_5075 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5075 ?auto_5065 ?auto_5070 ?auto_5068 )
      ( MAKE-2CRATE ?auto_5072 ?auto_5065 ?auto_5066 )
      ( MAKE-1CRATE-VERIFY ?auto_5065 ?auto_5066 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5076 - SURFACE
      ?auto_5077 - SURFACE
      ?auto_5078 - SURFACE
    )
    :vars
    (
      ?auto_5080 - HOIST
      ?auto_5084 - PLACE
      ?auto_5083 - PLACE
      ?auto_5079 - HOIST
      ?auto_5086 - SURFACE
      ?auto_5082 - TRUCK
      ?auto_5081 - PLACE
      ?auto_5085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5080 ?auto_5084 ) ( IS-CRATE ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5083 ?auto_5084 ) ) ( HOIST-AT ?auto_5079 ?auto_5083 ) ( not ( = ?auto_5080 ?auto_5079 ) ) ( AVAILABLE ?auto_5079 ) ( SURFACE-AT ?auto_5078 ?auto_5083 ) ( ON ?auto_5078 ?auto_5086 ) ( CLEAR ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5086 ) ) ( not ( = ?auto_5078 ?auto_5086 ) ) ( not ( = ?auto_5076 ?auto_5086 ) ) ( SURFACE-AT ?auto_5076 ?auto_5084 ) ( CLEAR ?auto_5076 ) ( IS-CRATE ?auto_5077 ) ( AVAILABLE ?auto_5080 ) ( TRUCK-AT ?auto_5082 ?auto_5081 ) ( not ( = ?auto_5081 ?auto_5084 ) ) ( not ( = ?auto_5083 ?auto_5081 ) ) ( HOIST-AT ?auto_5085 ?auto_5081 ) ( LIFTING ?auto_5085 ?auto_5077 ) ( not ( = ?auto_5080 ?auto_5085 ) ) ( not ( = ?auto_5079 ?auto_5085 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5077 ?auto_5078 )
      ( MAKE-2CRATE-VERIFY ?auto_5076 ?auto_5077 ?auto_5078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5087 - SURFACE
      ?auto_5088 - SURFACE
      ?auto_5089 - SURFACE
      ?auto_5090 - SURFACE
    )
    :vars
    (
      ?auto_5092 - HOIST
      ?auto_5096 - PLACE
      ?auto_5091 - PLACE
      ?auto_5093 - HOIST
      ?auto_5094 - SURFACE
      ?auto_5095 - TRUCK
      ?auto_5097 - PLACE
      ?auto_5098 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5092 ?auto_5096 ) ( IS-CRATE ?auto_5090 ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( not ( = ?auto_5088 ?auto_5090 ) ) ( not ( = ?auto_5091 ?auto_5096 ) ) ( HOIST-AT ?auto_5093 ?auto_5091 ) ( not ( = ?auto_5092 ?auto_5093 ) ) ( AVAILABLE ?auto_5093 ) ( SURFACE-AT ?auto_5090 ?auto_5091 ) ( ON ?auto_5090 ?auto_5094 ) ( CLEAR ?auto_5090 ) ( not ( = ?auto_5089 ?auto_5094 ) ) ( not ( = ?auto_5090 ?auto_5094 ) ) ( not ( = ?auto_5088 ?auto_5094 ) ) ( SURFACE-AT ?auto_5088 ?auto_5096 ) ( CLEAR ?auto_5088 ) ( IS-CRATE ?auto_5089 ) ( AVAILABLE ?auto_5092 ) ( TRUCK-AT ?auto_5095 ?auto_5097 ) ( not ( = ?auto_5097 ?auto_5096 ) ) ( not ( = ?auto_5091 ?auto_5097 ) ) ( HOIST-AT ?auto_5098 ?auto_5097 ) ( LIFTING ?auto_5098 ?auto_5089 ) ( not ( = ?auto_5092 ?auto_5098 ) ) ( not ( = ?auto_5093 ?auto_5098 ) ) ( ON ?auto_5088 ?auto_5087 ) ( not ( = ?auto_5087 ?auto_5088 ) ) ( not ( = ?auto_5087 ?auto_5089 ) ) ( not ( = ?auto_5087 ?auto_5090 ) ) ( not ( = ?auto_5087 ?auto_5094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5088 ?auto_5089 ?auto_5090 )
      ( MAKE-3CRATE-VERIFY ?auto_5087 ?auto_5088 ?auto_5089 ?auto_5090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5099 - SURFACE
      ?auto_5100 - SURFACE
    )
    :vars
    (
      ?auto_5102 - HOIST
      ?auto_5107 - PLACE
      ?auto_5105 - SURFACE
      ?auto_5101 - PLACE
      ?auto_5103 - HOIST
      ?auto_5104 - SURFACE
      ?auto_5106 - TRUCK
      ?auto_5108 - PLACE
      ?auto_5109 - HOIST
      ?auto_5110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5102 ?auto_5107 ) ( IS-CRATE ?auto_5100 ) ( not ( = ?auto_5099 ?auto_5100 ) ) ( not ( = ?auto_5105 ?auto_5099 ) ) ( not ( = ?auto_5105 ?auto_5100 ) ) ( not ( = ?auto_5101 ?auto_5107 ) ) ( HOIST-AT ?auto_5103 ?auto_5101 ) ( not ( = ?auto_5102 ?auto_5103 ) ) ( AVAILABLE ?auto_5103 ) ( SURFACE-AT ?auto_5100 ?auto_5101 ) ( ON ?auto_5100 ?auto_5104 ) ( CLEAR ?auto_5100 ) ( not ( = ?auto_5099 ?auto_5104 ) ) ( not ( = ?auto_5100 ?auto_5104 ) ) ( not ( = ?auto_5105 ?auto_5104 ) ) ( SURFACE-AT ?auto_5105 ?auto_5107 ) ( CLEAR ?auto_5105 ) ( IS-CRATE ?auto_5099 ) ( AVAILABLE ?auto_5102 ) ( TRUCK-AT ?auto_5106 ?auto_5108 ) ( not ( = ?auto_5108 ?auto_5107 ) ) ( not ( = ?auto_5101 ?auto_5108 ) ) ( HOIST-AT ?auto_5109 ?auto_5108 ) ( not ( = ?auto_5102 ?auto_5109 ) ) ( not ( = ?auto_5103 ?auto_5109 ) ) ( AVAILABLE ?auto_5109 ) ( SURFACE-AT ?auto_5099 ?auto_5108 ) ( ON ?auto_5099 ?auto_5110 ) ( CLEAR ?auto_5099 ) ( not ( = ?auto_5099 ?auto_5110 ) ) ( not ( = ?auto_5100 ?auto_5110 ) ) ( not ( = ?auto_5105 ?auto_5110 ) ) ( not ( = ?auto_5104 ?auto_5110 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5109 ?auto_5099 ?auto_5110 ?auto_5108 )
      ( MAKE-2CRATE ?auto_5105 ?auto_5099 ?auto_5100 )
      ( MAKE-1CRATE-VERIFY ?auto_5099 ?auto_5100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5111 - SURFACE
      ?auto_5112 - SURFACE
      ?auto_5113 - SURFACE
    )
    :vars
    (
      ?auto_5114 - HOIST
      ?auto_5115 - PLACE
      ?auto_5122 - PLACE
      ?auto_5117 - HOIST
      ?auto_5116 - SURFACE
      ?auto_5121 - TRUCK
      ?auto_5118 - PLACE
      ?auto_5119 - HOIST
      ?auto_5120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5114 ?auto_5115 ) ( IS-CRATE ?auto_5113 ) ( not ( = ?auto_5112 ?auto_5113 ) ) ( not ( = ?auto_5111 ?auto_5112 ) ) ( not ( = ?auto_5111 ?auto_5113 ) ) ( not ( = ?auto_5122 ?auto_5115 ) ) ( HOIST-AT ?auto_5117 ?auto_5122 ) ( not ( = ?auto_5114 ?auto_5117 ) ) ( AVAILABLE ?auto_5117 ) ( SURFACE-AT ?auto_5113 ?auto_5122 ) ( ON ?auto_5113 ?auto_5116 ) ( CLEAR ?auto_5113 ) ( not ( = ?auto_5112 ?auto_5116 ) ) ( not ( = ?auto_5113 ?auto_5116 ) ) ( not ( = ?auto_5111 ?auto_5116 ) ) ( SURFACE-AT ?auto_5111 ?auto_5115 ) ( CLEAR ?auto_5111 ) ( IS-CRATE ?auto_5112 ) ( AVAILABLE ?auto_5114 ) ( TRUCK-AT ?auto_5121 ?auto_5118 ) ( not ( = ?auto_5118 ?auto_5115 ) ) ( not ( = ?auto_5122 ?auto_5118 ) ) ( HOIST-AT ?auto_5119 ?auto_5118 ) ( not ( = ?auto_5114 ?auto_5119 ) ) ( not ( = ?auto_5117 ?auto_5119 ) ) ( AVAILABLE ?auto_5119 ) ( SURFACE-AT ?auto_5112 ?auto_5118 ) ( ON ?auto_5112 ?auto_5120 ) ( CLEAR ?auto_5112 ) ( not ( = ?auto_5112 ?auto_5120 ) ) ( not ( = ?auto_5113 ?auto_5120 ) ) ( not ( = ?auto_5111 ?auto_5120 ) ) ( not ( = ?auto_5116 ?auto_5120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5112 ?auto_5113 )
      ( MAKE-2CRATE-VERIFY ?auto_5111 ?auto_5112 ?auto_5113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5123 - SURFACE
      ?auto_5124 - SURFACE
      ?auto_5125 - SURFACE
      ?auto_5126 - SURFACE
    )
    :vars
    (
      ?auto_5127 - HOIST
      ?auto_5129 - PLACE
      ?auto_5128 - PLACE
      ?auto_5133 - HOIST
      ?auto_5132 - SURFACE
      ?auto_5134 - TRUCK
      ?auto_5131 - PLACE
      ?auto_5135 - HOIST
      ?auto_5130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5127 ?auto_5129 ) ( IS-CRATE ?auto_5126 ) ( not ( = ?auto_5125 ?auto_5126 ) ) ( not ( = ?auto_5124 ?auto_5125 ) ) ( not ( = ?auto_5124 ?auto_5126 ) ) ( not ( = ?auto_5128 ?auto_5129 ) ) ( HOIST-AT ?auto_5133 ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5133 ) ) ( AVAILABLE ?auto_5133 ) ( SURFACE-AT ?auto_5126 ?auto_5128 ) ( ON ?auto_5126 ?auto_5132 ) ( CLEAR ?auto_5126 ) ( not ( = ?auto_5125 ?auto_5132 ) ) ( not ( = ?auto_5126 ?auto_5132 ) ) ( not ( = ?auto_5124 ?auto_5132 ) ) ( SURFACE-AT ?auto_5124 ?auto_5129 ) ( CLEAR ?auto_5124 ) ( IS-CRATE ?auto_5125 ) ( AVAILABLE ?auto_5127 ) ( TRUCK-AT ?auto_5134 ?auto_5131 ) ( not ( = ?auto_5131 ?auto_5129 ) ) ( not ( = ?auto_5128 ?auto_5131 ) ) ( HOIST-AT ?auto_5135 ?auto_5131 ) ( not ( = ?auto_5127 ?auto_5135 ) ) ( not ( = ?auto_5133 ?auto_5135 ) ) ( AVAILABLE ?auto_5135 ) ( SURFACE-AT ?auto_5125 ?auto_5131 ) ( ON ?auto_5125 ?auto_5130 ) ( CLEAR ?auto_5125 ) ( not ( = ?auto_5125 ?auto_5130 ) ) ( not ( = ?auto_5126 ?auto_5130 ) ) ( not ( = ?auto_5124 ?auto_5130 ) ) ( not ( = ?auto_5132 ?auto_5130 ) ) ( ON ?auto_5124 ?auto_5123 ) ( not ( = ?auto_5123 ?auto_5124 ) ) ( not ( = ?auto_5123 ?auto_5125 ) ) ( not ( = ?auto_5123 ?auto_5126 ) ) ( not ( = ?auto_5123 ?auto_5132 ) ) ( not ( = ?auto_5123 ?auto_5130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5124 ?auto_5125 ?auto_5126 )
      ( MAKE-3CRATE-VERIFY ?auto_5123 ?auto_5124 ?auto_5125 ?auto_5126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5136 - SURFACE
      ?auto_5137 - SURFACE
    )
    :vars
    (
      ?auto_5138 - HOIST
      ?auto_5140 - PLACE
      ?auto_5143 - SURFACE
      ?auto_5139 - PLACE
      ?auto_5145 - HOIST
      ?auto_5144 - SURFACE
      ?auto_5142 - PLACE
      ?auto_5147 - HOIST
      ?auto_5141 - SURFACE
      ?auto_5146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5138 ?auto_5140 ) ( IS-CRATE ?auto_5137 ) ( not ( = ?auto_5136 ?auto_5137 ) ) ( not ( = ?auto_5143 ?auto_5136 ) ) ( not ( = ?auto_5143 ?auto_5137 ) ) ( not ( = ?auto_5139 ?auto_5140 ) ) ( HOIST-AT ?auto_5145 ?auto_5139 ) ( not ( = ?auto_5138 ?auto_5145 ) ) ( AVAILABLE ?auto_5145 ) ( SURFACE-AT ?auto_5137 ?auto_5139 ) ( ON ?auto_5137 ?auto_5144 ) ( CLEAR ?auto_5137 ) ( not ( = ?auto_5136 ?auto_5144 ) ) ( not ( = ?auto_5137 ?auto_5144 ) ) ( not ( = ?auto_5143 ?auto_5144 ) ) ( SURFACE-AT ?auto_5143 ?auto_5140 ) ( CLEAR ?auto_5143 ) ( IS-CRATE ?auto_5136 ) ( AVAILABLE ?auto_5138 ) ( not ( = ?auto_5142 ?auto_5140 ) ) ( not ( = ?auto_5139 ?auto_5142 ) ) ( HOIST-AT ?auto_5147 ?auto_5142 ) ( not ( = ?auto_5138 ?auto_5147 ) ) ( not ( = ?auto_5145 ?auto_5147 ) ) ( AVAILABLE ?auto_5147 ) ( SURFACE-AT ?auto_5136 ?auto_5142 ) ( ON ?auto_5136 ?auto_5141 ) ( CLEAR ?auto_5136 ) ( not ( = ?auto_5136 ?auto_5141 ) ) ( not ( = ?auto_5137 ?auto_5141 ) ) ( not ( = ?auto_5143 ?auto_5141 ) ) ( not ( = ?auto_5144 ?auto_5141 ) ) ( TRUCK-AT ?auto_5146 ?auto_5140 ) )
    :subtasks
    ( ( !DRIVE ?auto_5146 ?auto_5140 ?auto_5142 )
      ( MAKE-2CRATE ?auto_5143 ?auto_5136 ?auto_5137 )
      ( MAKE-1CRATE-VERIFY ?auto_5136 ?auto_5137 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5148 - SURFACE
      ?auto_5149 - SURFACE
      ?auto_5150 - SURFACE
    )
    :vars
    (
      ?auto_5158 - HOIST
      ?auto_5153 - PLACE
      ?auto_5154 - PLACE
      ?auto_5159 - HOIST
      ?auto_5152 - SURFACE
      ?auto_5157 - PLACE
      ?auto_5156 - HOIST
      ?auto_5151 - SURFACE
      ?auto_5155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5158 ?auto_5153 ) ( IS-CRATE ?auto_5150 ) ( not ( = ?auto_5149 ?auto_5150 ) ) ( not ( = ?auto_5148 ?auto_5149 ) ) ( not ( = ?auto_5148 ?auto_5150 ) ) ( not ( = ?auto_5154 ?auto_5153 ) ) ( HOIST-AT ?auto_5159 ?auto_5154 ) ( not ( = ?auto_5158 ?auto_5159 ) ) ( AVAILABLE ?auto_5159 ) ( SURFACE-AT ?auto_5150 ?auto_5154 ) ( ON ?auto_5150 ?auto_5152 ) ( CLEAR ?auto_5150 ) ( not ( = ?auto_5149 ?auto_5152 ) ) ( not ( = ?auto_5150 ?auto_5152 ) ) ( not ( = ?auto_5148 ?auto_5152 ) ) ( SURFACE-AT ?auto_5148 ?auto_5153 ) ( CLEAR ?auto_5148 ) ( IS-CRATE ?auto_5149 ) ( AVAILABLE ?auto_5158 ) ( not ( = ?auto_5157 ?auto_5153 ) ) ( not ( = ?auto_5154 ?auto_5157 ) ) ( HOIST-AT ?auto_5156 ?auto_5157 ) ( not ( = ?auto_5158 ?auto_5156 ) ) ( not ( = ?auto_5159 ?auto_5156 ) ) ( AVAILABLE ?auto_5156 ) ( SURFACE-AT ?auto_5149 ?auto_5157 ) ( ON ?auto_5149 ?auto_5151 ) ( CLEAR ?auto_5149 ) ( not ( = ?auto_5149 ?auto_5151 ) ) ( not ( = ?auto_5150 ?auto_5151 ) ) ( not ( = ?auto_5148 ?auto_5151 ) ) ( not ( = ?auto_5152 ?auto_5151 ) ) ( TRUCK-AT ?auto_5155 ?auto_5153 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5149 ?auto_5150 )
      ( MAKE-2CRATE-VERIFY ?auto_5148 ?auto_5149 ?auto_5150 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5160 - SURFACE
      ?auto_5161 - SURFACE
      ?auto_5162 - SURFACE
      ?auto_5163 - SURFACE
    )
    :vars
    (
      ?auto_5170 - HOIST
      ?auto_5166 - PLACE
      ?auto_5169 - PLACE
      ?auto_5164 - HOIST
      ?auto_5172 - SURFACE
      ?auto_5171 - PLACE
      ?auto_5165 - HOIST
      ?auto_5167 - SURFACE
      ?auto_5168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5170 ?auto_5166 ) ( IS-CRATE ?auto_5163 ) ( not ( = ?auto_5162 ?auto_5163 ) ) ( not ( = ?auto_5161 ?auto_5162 ) ) ( not ( = ?auto_5161 ?auto_5163 ) ) ( not ( = ?auto_5169 ?auto_5166 ) ) ( HOIST-AT ?auto_5164 ?auto_5169 ) ( not ( = ?auto_5170 ?auto_5164 ) ) ( AVAILABLE ?auto_5164 ) ( SURFACE-AT ?auto_5163 ?auto_5169 ) ( ON ?auto_5163 ?auto_5172 ) ( CLEAR ?auto_5163 ) ( not ( = ?auto_5162 ?auto_5172 ) ) ( not ( = ?auto_5163 ?auto_5172 ) ) ( not ( = ?auto_5161 ?auto_5172 ) ) ( SURFACE-AT ?auto_5161 ?auto_5166 ) ( CLEAR ?auto_5161 ) ( IS-CRATE ?auto_5162 ) ( AVAILABLE ?auto_5170 ) ( not ( = ?auto_5171 ?auto_5166 ) ) ( not ( = ?auto_5169 ?auto_5171 ) ) ( HOIST-AT ?auto_5165 ?auto_5171 ) ( not ( = ?auto_5170 ?auto_5165 ) ) ( not ( = ?auto_5164 ?auto_5165 ) ) ( AVAILABLE ?auto_5165 ) ( SURFACE-AT ?auto_5162 ?auto_5171 ) ( ON ?auto_5162 ?auto_5167 ) ( CLEAR ?auto_5162 ) ( not ( = ?auto_5162 ?auto_5167 ) ) ( not ( = ?auto_5163 ?auto_5167 ) ) ( not ( = ?auto_5161 ?auto_5167 ) ) ( not ( = ?auto_5172 ?auto_5167 ) ) ( TRUCK-AT ?auto_5168 ?auto_5166 ) ( ON ?auto_5161 ?auto_5160 ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( not ( = ?auto_5160 ?auto_5162 ) ) ( not ( = ?auto_5160 ?auto_5163 ) ) ( not ( = ?auto_5160 ?auto_5172 ) ) ( not ( = ?auto_5160 ?auto_5167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5161 ?auto_5162 ?auto_5163 )
      ( MAKE-3CRATE-VERIFY ?auto_5160 ?auto_5161 ?auto_5162 ?auto_5163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5173 - SURFACE
      ?auto_5174 - SURFACE
    )
    :vars
    (
      ?auto_5182 - HOIST
      ?auto_5177 - PLACE
      ?auto_5181 - SURFACE
      ?auto_5180 - PLACE
      ?auto_5175 - HOIST
      ?auto_5184 - SURFACE
      ?auto_5183 - PLACE
      ?auto_5176 - HOIST
      ?auto_5178 - SURFACE
      ?auto_5179 - TRUCK
      ?auto_5185 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5182 ?auto_5177 ) ( IS-CRATE ?auto_5174 ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( not ( = ?auto_5181 ?auto_5173 ) ) ( not ( = ?auto_5181 ?auto_5174 ) ) ( not ( = ?auto_5180 ?auto_5177 ) ) ( HOIST-AT ?auto_5175 ?auto_5180 ) ( not ( = ?auto_5182 ?auto_5175 ) ) ( AVAILABLE ?auto_5175 ) ( SURFACE-AT ?auto_5174 ?auto_5180 ) ( ON ?auto_5174 ?auto_5184 ) ( CLEAR ?auto_5174 ) ( not ( = ?auto_5173 ?auto_5184 ) ) ( not ( = ?auto_5174 ?auto_5184 ) ) ( not ( = ?auto_5181 ?auto_5184 ) ) ( IS-CRATE ?auto_5173 ) ( not ( = ?auto_5183 ?auto_5177 ) ) ( not ( = ?auto_5180 ?auto_5183 ) ) ( HOIST-AT ?auto_5176 ?auto_5183 ) ( not ( = ?auto_5182 ?auto_5176 ) ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( AVAILABLE ?auto_5176 ) ( SURFACE-AT ?auto_5173 ?auto_5183 ) ( ON ?auto_5173 ?auto_5178 ) ( CLEAR ?auto_5173 ) ( not ( = ?auto_5173 ?auto_5178 ) ) ( not ( = ?auto_5174 ?auto_5178 ) ) ( not ( = ?auto_5181 ?auto_5178 ) ) ( not ( = ?auto_5184 ?auto_5178 ) ) ( TRUCK-AT ?auto_5179 ?auto_5177 ) ( SURFACE-AT ?auto_5185 ?auto_5177 ) ( CLEAR ?auto_5185 ) ( LIFTING ?auto_5182 ?auto_5181 ) ( IS-CRATE ?auto_5181 ) ( not ( = ?auto_5185 ?auto_5181 ) ) ( not ( = ?auto_5173 ?auto_5185 ) ) ( not ( = ?auto_5174 ?auto_5185 ) ) ( not ( = ?auto_5184 ?auto_5185 ) ) ( not ( = ?auto_5178 ?auto_5185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5185 ?auto_5181 )
      ( MAKE-2CRATE ?auto_5181 ?auto_5173 ?auto_5174 )
      ( MAKE-1CRATE-VERIFY ?auto_5173 ?auto_5174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5186 - SURFACE
      ?auto_5187 - SURFACE
      ?auto_5188 - SURFACE
    )
    :vars
    (
      ?auto_5193 - HOIST
      ?auto_5190 - PLACE
      ?auto_5196 - PLACE
      ?auto_5191 - HOIST
      ?auto_5192 - SURFACE
      ?auto_5198 - PLACE
      ?auto_5197 - HOIST
      ?auto_5195 - SURFACE
      ?auto_5189 - TRUCK
      ?auto_5194 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5193 ?auto_5190 ) ( IS-CRATE ?auto_5188 ) ( not ( = ?auto_5187 ?auto_5188 ) ) ( not ( = ?auto_5186 ?auto_5187 ) ) ( not ( = ?auto_5186 ?auto_5188 ) ) ( not ( = ?auto_5196 ?auto_5190 ) ) ( HOIST-AT ?auto_5191 ?auto_5196 ) ( not ( = ?auto_5193 ?auto_5191 ) ) ( AVAILABLE ?auto_5191 ) ( SURFACE-AT ?auto_5188 ?auto_5196 ) ( ON ?auto_5188 ?auto_5192 ) ( CLEAR ?auto_5188 ) ( not ( = ?auto_5187 ?auto_5192 ) ) ( not ( = ?auto_5188 ?auto_5192 ) ) ( not ( = ?auto_5186 ?auto_5192 ) ) ( IS-CRATE ?auto_5187 ) ( not ( = ?auto_5198 ?auto_5190 ) ) ( not ( = ?auto_5196 ?auto_5198 ) ) ( HOIST-AT ?auto_5197 ?auto_5198 ) ( not ( = ?auto_5193 ?auto_5197 ) ) ( not ( = ?auto_5191 ?auto_5197 ) ) ( AVAILABLE ?auto_5197 ) ( SURFACE-AT ?auto_5187 ?auto_5198 ) ( ON ?auto_5187 ?auto_5195 ) ( CLEAR ?auto_5187 ) ( not ( = ?auto_5187 ?auto_5195 ) ) ( not ( = ?auto_5188 ?auto_5195 ) ) ( not ( = ?auto_5186 ?auto_5195 ) ) ( not ( = ?auto_5192 ?auto_5195 ) ) ( TRUCK-AT ?auto_5189 ?auto_5190 ) ( SURFACE-AT ?auto_5194 ?auto_5190 ) ( CLEAR ?auto_5194 ) ( LIFTING ?auto_5193 ?auto_5186 ) ( IS-CRATE ?auto_5186 ) ( not ( = ?auto_5194 ?auto_5186 ) ) ( not ( = ?auto_5187 ?auto_5194 ) ) ( not ( = ?auto_5188 ?auto_5194 ) ) ( not ( = ?auto_5192 ?auto_5194 ) ) ( not ( = ?auto_5195 ?auto_5194 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5187 ?auto_5188 )
      ( MAKE-2CRATE-VERIFY ?auto_5186 ?auto_5187 ?auto_5188 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5199 - SURFACE
      ?auto_5200 - SURFACE
      ?auto_5201 - SURFACE
      ?auto_5202 - SURFACE
    )
    :vars
    (
      ?auto_5210 - HOIST
      ?auto_5211 - PLACE
      ?auto_5208 - PLACE
      ?auto_5207 - HOIST
      ?auto_5209 - SURFACE
      ?auto_5205 - PLACE
      ?auto_5204 - HOIST
      ?auto_5206 - SURFACE
      ?auto_5203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5210 ?auto_5211 ) ( IS-CRATE ?auto_5202 ) ( not ( = ?auto_5201 ?auto_5202 ) ) ( not ( = ?auto_5200 ?auto_5201 ) ) ( not ( = ?auto_5200 ?auto_5202 ) ) ( not ( = ?auto_5208 ?auto_5211 ) ) ( HOIST-AT ?auto_5207 ?auto_5208 ) ( not ( = ?auto_5210 ?auto_5207 ) ) ( AVAILABLE ?auto_5207 ) ( SURFACE-AT ?auto_5202 ?auto_5208 ) ( ON ?auto_5202 ?auto_5209 ) ( CLEAR ?auto_5202 ) ( not ( = ?auto_5201 ?auto_5209 ) ) ( not ( = ?auto_5202 ?auto_5209 ) ) ( not ( = ?auto_5200 ?auto_5209 ) ) ( IS-CRATE ?auto_5201 ) ( not ( = ?auto_5205 ?auto_5211 ) ) ( not ( = ?auto_5208 ?auto_5205 ) ) ( HOIST-AT ?auto_5204 ?auto_5205 ) ( not ( = ?auto_5210 ?auto_5204 ) ) ( not ( = ?auto_5207 ?auto_5204 ) ) ( AVAILABLE ?auto_5204 ) ( SURFACE-AT ?auto_5201 ?auto_5205 ) ( ON ?auto_5201 ?auto_5206 ) ( CLEAR ?auto_5201 ) ( not ( = ?auto_5201 ?auto_5206 ) ) ( not ( = ?auto_5202 ?auto_5206 ) ) ( not ( = ?auto_5200 ?auto_5206 ) ) ( not ( = ?auto_5209 ?auto_5206 ) ) ( TRUCK-AT ?auto_5203 ?auto_5211 ) ( SURFACE-AT ?auto_5199 ?auto_5211 ) ( CLEAR ?auto_5199 ) ( LIFTING ?auto_5210 ?auto_5200 ) ( IS-CRATE ?auto_5200 ) ( not ( = ?auto_5199 ?auto_5200 ) ) ( not ( = ?auto_5201 ?auto_5199 ) ) ( not ( = ?auto_5202 ?auto_5199 ) ) ( not ( = ?auto_5209 ?auto_5199 ) ) ( not ( = ?auto_5206 ?auto_5199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5200 ?auto_5201 ?auto_5202 )
      ( MAKE-3CRATE-VERIFY ?auto_5199 ?auto_5200 ?auto_5201 ?auto_5202 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5212 - SURFACE
      ?auto_5213 - SURFACE
    )
    :vars
    (
      ?auto_5223 - HOIST
      ?auto_5224 - PLACE
      ?auto_5219 - SURFACE
      ?auto_5220 - PLACE
      ?auto_5218 - HOIST
      ?auto_5221 - SURFACE
      ?auto_5216 - PLACE
      ?auto_5215 - HOIST
      ?auto_5217 - SURFACE
      ?auto_5214 - TRUCK
      ?auto_5222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5223 ?auto_5224 ) ( IS-CRATE ?auto_5213 ) ( not ( = ?auto_5212 ?auto_5213 ) ) ( not ( = ?auto_5219 ?auto_5212 ) ) ( not ( = ?auto_5219 ?auto_5213 ) ) ( not ( = ?auto_5220 ?auto_5224 ) ) ( HOIST-AT ?auto_5218 ?auto_5220 ) ( not ( = ?auto_5223 ?auto_5218 ) ) ( AVAILABLE ?auto_5218 ) ( SURFACE-AT ?auto_5213 ?auto_5220 ) ( ON ?auto_5213 ?auto_5221 ) ( CLEAR ?auto_5213 ) ( not ( = ?auto_5212 ?auto_5221 ) ) ( not ( = ?auto_5213 ?auto_5221 ) ) ( not ( = ?auto_5219 ?auto_5221 ) ) ( IS-CRATE ?auto_5212 ) ( not ( = ?auto_5216 ?auto_5224 ) ) ( not ( = ?auto_5220 ?auto_5216 ) ) ( HOIST-AT ?auto_5215 ?auto_5216 ) ( not ( = ?auto_5223 ?auto_5215 ) ) ( not ( = ?auto_5218 ?auto_5215 ) ) ( AVAILABLE ?auto_5215 ) ( SURFACE-AT ?auto_5212 ?auto_5216 ) ( ON ?auto_5212 ?auto_5217 ) ( CLEAR ?auto_5212 ) ( not ( = ?auto_5212 ?auto_5217 ) ) ( not ( = ?auto_5213 ?auto_5217 ) ) ( not ( = ?auto_5219 ?auto_5217 ) ) ( not ( = ?auto_5221 ?auto_5217 ) ) ( TRUCK-AT ?auto_5214 ?auto_5224 ) ( SURFACE-AT ?auto_5222 ?auto_5224 ) ( CLEAR ?auto_5222 ) ( IS-CRATE ?auto_5219 ) ( not ( = ?auto_5222 ?auto_5219 ) ) ( not ( = ?auto_5212 ?auto_5222 ) ) ( not ( = ?auto_5213 ?auto_5222 ) ) ( not ( = ?auto_5221 ?auto_5222 ) ) ( not ( = ?auto_5217 ?auto_5222 ) ) ( AVAILABLE ?auto_5223 ) ( IN ?auto_5219 ?auto_5214 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5223 ?auto_5219 ?auto_5214 ?auto_5224 )
      ( MAKE-2CRATE ?auto_5219 ?auto_5212 ?auto_5213 )
      ( MAKE-1CRATE-VERIFY ?auto_5212 ?auto_5213 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5225 - SURFACE
      ?auto_5226 - SURFACE
      ?auto_5227 - SURFACE
    )
    :vars
    (
      ?auto_5229 - HOIST
      ?auto_5228 - PLACE
      ?auto_5234 - PLACE
      ?auto_5236 - HOIST
      ?auto_5232 - SURFACE
      ?auto_5231 - PLACE
      ?auto_5235 - HOIST
      ?auto_5233 - SURFACE
      ?auto_5237 - TRUCK
      ?auto_5230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5229 ?auto_5228 ) ( IS-CRATE ?auto_5227 ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( not ( = ?auto_5225 ?auto_5226 ) ) ( not ( = ?auto_5225 ?auto_5227 ) ) ( not ( = ?auto_5234 ?auto_5228 ) ) ( HOIST-AT ?auto_5236 ?auto_5234 ) ( not ( = ?auto_5229 ?auto_5236 ) ) ( AVAILABLE ?auto_5236 ) ( SURFACE-AT ?auto_5227 ?auto_5234 ) ( ON ?auto_5227 ?auto_5232 ) ( CLEAR ?auto_5227 ) ( not ( = ?auto_5226 ?auto_5232 ) ) ( not ( = ?auto_5227 ?auto_5232 ) ) ( not ( = ?auto_5225 ?auto_5232 ) ) ( IS-CRATE ?auto_5226 ) ( not ( = ?auto_5231 ?auto_5228 ) ) ( not ( = ?auto_5234 ?auto_5231 ) ) ( HOIST-AT ?auto_5235 ?auto_5231 ) ( not ( = ?auto_5229 ?auto_5235 ) ) ( not ( = ?auto_5236 ?auto_5235 ) ) ( AVAILABLE ?auto_5235 ) ( SURFACE-AT ?auto_5226 ?auto_5231 ) ( ON ?auto_5226 ?auto_5233 ) ( CLEAR ?auto_5226 ) ( not ( = ?auto_5226 ?auto_5233 ) ) ( not ( = ?auto_5227 ?auto_5233 ) ) ( not ( = ?auto_5225 ?auto_5233 ) ) ( not ( = ?auto_5232 ?auto_5233 ) ) ( TRUCK-AT ?auto_5237 ?auto_5228 ) ( SURFACE-AT ?auto_5230 ?auto_5228 ) ( CLEAR ?auto_5230 ) ( IS-CRATE ?auto_5225 ) ( not ( = ?auto_5230 ?auto_5225 ) ) ( not ( = ?auto_5226 ?auto_5230 ) ) ( not ( = ?auto_5227 ?auto_5230 ) ) ( not ( = ?auto_5232 ?auto_5230 ) ) ( not ( = ?auto_5233 ?auto_5230 ) ) ( AVAILABLE ?auto_5229 ) ( IN ?auto_5225 ?auto_5237 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5226 ?auto_5227 )
      ( MAKE-2CRATE-VERIFY ?auto_5225 ?auto_5226 ?auto_5227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5238 - SURFACE
      ?auto_5239 - SURFACE
      ?auto_5240 - SURFACE
      ?auto_5241 - SURFACE
    )
    :vars
    (
      ?auto_5247 - HOIST
      ?auto_5248 - PLACE
      ?auto_5249 - PLACE
      ?auto_5243 - HOIST
      ?auto_5242 - SURFACE
      ?auto_5244 - PLACE
      ?auto_5245 - HOIST
      ?auto_5246 - SURFACE
      ?auto_5250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5247 ?auto_5248 ) ( IS-CRATE ?auto_5241 ) ( not ( = ?auto_5240 ?auto_5241 ) ) ( not ( = ?auto_5239 ?auto_5240 ) ) ( not ( = ?auto_5239 ?auto_5241 ) ) ( not ( = ?auto_5249 ?auto_5248 ) ) ( HOIST-AT ?auto_5243 ?auto_5249 ) ( not ( = ?auto_5247 ?auto_5243 ) ) ( AVAILABLE ?auto_5243 ) ( SURFACE-AT ?auto_5241 ?auto_5249 ) ( ON ?auto_5241 ?auto_5242 ) ( CLEAR ?auto_5241 ) ( not ( = ?auto_5240 ?auto_5242 ) ) ( not ( = ?auto_5241 ?auto_5242 ) ) ( not ( = ?auto_5239 ?auto_5242 ) ) ( IS-CRATE ?auto_5240 ) ( not ( = ?auto_5244 ?auto_5248 ) ) ( not ( = ?auto_5249 ?auto_5244 ) ) ( HOIST-AT ?auto_5245 ?auto_5244 ) ( not ( = ?auto_5247 ?auto_5245 ) ) ( not ( = ?auto_5243 ?auto_5245 ) ) ( AVAILABLE ?auto_5245 ) ( SURFACE-AT ?auto_5240 ?auto_5244 ) ( ON ?auto_5240 ?auto_5246 ) ( CLEAR ?auto_5240 ) ( not ( = ?auto_5240 ?auto_5246 ) ) ( not ( = ?auto_5241 ?auto_5246 ) ) ( not ( = ?auto_5239 ?auto_5246 ) ) ( not ( = ?auto_5242 ?auto_5246 ) ) ( TRUCK-AT ?auto_5250 ?auto_5248 ) ( SURFACE-AT ?auto_5238 ?auto_5248 ) ( CLEAR ?auto_5238 ) ( IS-CRATE ?auto_5239 ) ( not ( = ?auto_5238 ?auto_5239 ) ) ( not ( = ?auto_5240 ?auto_5238 ) ) ( not ( = ?auto_5241 ?auto_5238 ) ) ( not ( = ?auto_5242 ?auto_5238 ) ) ( not ( = ?auto_5246 ?auto_5238 ) ) ( AVAILABLE ?auto_5247 ) ( IN ?auto_5239 ?auto_5250 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5239 ?auto_5240 ?auto_5241 )
      ( MAKE-3CRATE-VERIFY ?auto_5238 ?auto_5239 ?auto_5240 ?auto_5241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5251 - SURFACE
      ?auto_5252 - SURFACE
    )
    :vars
    (
      ?auto_5259 - HOIST
      ?auto_5260 - PLACE
      ?auto_5262 - SURFACE
      ?auto_5261 - PLACE
      ?auto_5255 - HOIST
      ?auto_5253 - SURFACE
      ?auto_5256 - PLACE
      ?auto_5257 - HOIST
      ?auto_5258 - SURFACE
      ?auto_5254 - SURFACE
      ?auto_5263 - TRUCK
      ?auto_5264 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5259 ?auto_5260 ) ( IS-CRATE ?auto_5252 ) ( not ( = ?auto_5251 ?auto_5252 ) ) ( not ( = ?auto_5262 ?auto_5251 ) ) ( not ( = ?auto_5262 ?auto_5252 ) ) ( not ( = ?auto_5261 ?auto_5260 ) ) ( HOIST-AT ?auto_5255 ?auto_5261 ) ( not ( = ?auto_5259 ?auto_5255 ) ) ( AVAILABLE ?auto_5255 ) ( SURFACE-AT ?auto_5252 ?auto_5261 ) ( ON ?auto_5252 ?auto_5253 ) ( CLEAR ?auto_5252 ) ( not ( = ?auto_5251 ?auto_5253 ) ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( not ( = ?auto_5262 ?auto_5253 ) ) ( IS-CRATE ?auto_5251 ) ( not ( = ?auto_5256 ?auto_5260 ) ) ( not ( = ?auto_5261 ?auto_5256 ) ) ( HOIST-AT ?auto_5257 ?auto_5256 ) ( not ( = ?auto_5259 ?auto_5257 ) ) ( not ( = ?auto_5255 ?auto_5257 ) ) ( AVAILABLE ?auto_5257 ) ( SURFACE-AT ?auto_5251 ?auto_5256 ) ( ON ?auto_5251 ?auto_5258 ) ( CLEAR ?auto_5251 ) ( not ( = ?auto_5251 ?auto_5258 ) ) ( not ( = ?auto_5252 ?auto_5258 ) ) ( not ( = ?auto_5262 ?auto_5258 ) ) ( not ( = ?auto_5253 ?auto_5258 ) ) ( SURFACE-AT ?auto_5254 ?auto_5260 ) ( CLEAR ?auto_5254 ) ( IS-CRATE ?auto_5262 ) ( not ( = ?auto_5254 ?auto_5262 ) ) ( not ( = ?auto_5251 ?auto_5254 ) ) ( not ( = ?auto_5252 ?auto_5254 ) ) ( not ( = ?auto_5253 ?auto_5254 ) ) ( not ( = ?auto_5258 ?auto_5254 ) ) ( AVAILABLE ?auto_5259 ) ( IN ?auto_5262 ?auto_5263 ) ( TRUCK-AT ?auto_5263 ?auto_5264 ) ( not ( = ?auto_5264 ?auto_5260 ) ) ( not ( = ?auto_5261 ?auto_5264 ) ) ( not ( = ?auto_5256 ?auto_5264 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_5263 ?auto_5264 ?auto_5260 )
      ( MAKE-2CRATE ?auto_5262 ?auto_5251 ?auto_5252 )
      ( MAKE-1CRATE-VERIFY ?auto_5251 ?auto_5252 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5265 - SURFACE
      ?auto_5266 - SURFACE
      ?auto_5267 - SURFACE
    )
    :vars
    (
      ?auto_5274 - HOIST
      ?auto_5278 - PLACE
      ?auto_5270 - PLACE
      ?auto_5277 - HOIST
      ?auto_5273 - SURFACE
      ?auto_5275 - PLACE
      ?auto_5276 - HOIST
      ?auto_5272 - SURFACE
      ?auto_5268 - SURFACE
      ?auto_5271 - TRUCK
      ?auto_5269 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5274 ?auto_5278 ) ( IS-CRATE ?auto_5267 ) ( not ( = ?auto_5266 ?auto_5267 ) ) ( not ( = ?auto_5265 ?auto_5266 ) ) ( not ( = ?auto_5265 ?auto_5267 ) ) ( not ( = ?auto_5270 ?auto_5278 ) ) ( HOIST-AT ?auto_5277 ?auto_5270 ) ( not ( = ?auto_5274 ?auto_5277 ) ) ( AVAILABLE ?auto_5277 ) ( SURFACE-AT ?auto_5267 ?auto_5270 ) ( ON ?auto_5267 ?auto_5273 ) ( CLEAR ?auto_5267 ) ( not ( = ?auto_5266 ?auto_5273 ) ) ( not ( = ?auto_5267 ?auto_5273 ) ) ( not ( = ?auto_5265 ?auto_5273 ) ) ( IS-CRATE ?auto_5266 ) ( not ( = ?auto_5275 ?auto_5278 ) ) ( not ( = ?auto_5270 ?auto_5275 ) ) ( HOIST-AT ?auto_5276 ?auto_5275 ) ( not ( = ?auto_5274 ?auto_5276 ) ) ( not ( = ?auto_5277 ?auto_5276 ) ) ( AVAILABLE ?auto_5276 ) ( SURFACE-AT ?auto_5266 ?auto_5275 ) ( ON ?auto_5266 ?auto_5272 ) ( CLEAR ?auto_5266 ) ( not ( = ?auto_5266 ?auto_5272 ) ) ( not ( = ?auto_5267 ?auto_5272 ) ) ( not ( = ?auto_5265 ?auto_5272 ) ) ( not ( = ?auto_5273 ?auto_5272 ) ) ( SURFACE-AT ?auto_5268 ?auto_5278 ) ( CLEAR ?auto_5268 ) ( IS-CRATE ?auto_5265 ) ( not ( = ?auto_5268 ?auto_5265 ) ) ( not ( = ?auto_5266 ?auto_5268 ) ) ( not ( = ?auto_5267 ?auto_5268 ) ) ( not ( = ?auto_5273 ?auto_5268 ) ) ( not ( = ?auto_5272 ?auto_5268 ) ) ( AVAILABLE ?auto_5274 ) ( IN ?auto_5265 ?auto_5271 ) ( TRUCK-AT ?auto_5271 ?auto_5269 ) ( not ( = ?auto_5269 ?auto_5278 ) ) ( not ( = ?auto_5270 ?auto_5269 ) ) ( not ( = ?auto_5275 ?auto_5269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5266 ?auto_5267 )
      ( MAKE-2CRATE-VERIFY ?auto_5265 ?auto_5266 ?auto_5267 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5279 - SURFACE
      ?auto_5280 - SURFACE
      ?auto_5281 - SURFACE
      ?auto_5282 - SURFACE
    )
    :vars
    (
      ?auto_5284 - HOIST
      ?auto_5289 - PLACE
      ?auto_5286 - PLACE
      ?auto_5288 - HOIST
      ?auto_5290 - SURFACE
      ?auto_5285 - PLACE
      ?auto_5283 - HOIST
      ?auto_5287 - SURFACE
      ?auto_5291 - TRUCK
      ?auto_5292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5284 ?auto_5289 ) ( IS-CRATE ?auto_5282 ) ( not ( = ?auto_5281 ?auto_5282 ) ) ( not ( = ?auto_5280 ?auto_5281 ) ) ( not ( = ?auto_5280 ?auto_5282 ) ) ( not ( = ?auto_5286 ?auto_5289 ) ) ( HOIST-AT ?auto_5288 ?auto_5286 ) ( not ( = ?auto_5284 ?auto_5288 ) ) ( AVAILABLE ?auto_5288 ) ( SURFACE-AT ?auto_5282 ?auto_5286 ) ( ON ?auto_5282 ?auto_5290 ) ( CLEAR ?auto_5282 ) ( not ( = ?auto_5281 ?auto_5290 ) ) ( not ( = ?auto_5282 ?auto_5290 ) ) ( not ( = ?auto_5280 ?auto_5290 ) ) ( IS-CRATE ?auto_5281 ) ( not ( = ?auto_5285 ?auto_5289 ) ) ( not ( = ?auto_5286 ?auto_5285 ) ) ( HOIST-AT ?auto_5283 ?auto_5285 ) ( not ( = ?auto_5284 ?auto_5283 ) ) ( not ( = ?auto_5288 ?auto_5283 ) ) ( AVAILABLE ?auto_5283 ) ( SURFACE-AT ?auto_5281 ?auto_5285 ) ( ON ?auto_5281 ?auto_5287 ) ( CLEAR ?auto_5281 ) ( not ( = ?auto_5281 ?auto_5287 ) ) ( not ( = ?auto_5282 ?auto_5287 ) ) ( not ( = ?auto_5280 ?auto_5287 ) ) ( not ( = ?auto_5290 ?auto_5287 ) ) ( SURFACE-AT ?auto_5279 ?auto_5289 ) ( CLEAR ?auto_5279 ) ( IS-CRATE ?auto_5280 ) ( not ( = ?auto_5279 ?auto_5280 ) ) ( not ( = ?auto_5281 ?auto_5279 ) ) ( not ( = ?auto_5282 ?auto_5279 ) ) ( not ( = ?auto_5290 ?auto_5279 ) ) ( not ( = ?auto_5287 ?auto_5279 ) ) ( AVAILABLE ?auto_5284 ) ( IN ?auto_5280 ?auto_5291 ) ( TRUCK-AT ?auto_5291 ?auto_5292 ) ( not ( = ?auto_5292 ?auto_5289 ) ) ( not ( = ?auto_5286 ?auto_5292 ) ) ( not ( = ?auto_5285 ?auto_5292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5280 ?auto_5281 ?auto_5282 )
      ( MAKE-3CRATE-VERIFY ?auto_5279 ?auto_5280 ?auto_5281 ?auto_5282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5293 - SURFACE
      ?auto_5294 - SURFACE
    )
    :vars
    (
      ?auto_5296 - HOIST
      ?auto_5301 - PLACE
      ?auto_5303 - SURFACE
      ?auto_5298 - PLACE
      ?auto_5300 - HOIST
      ?auto_5304 - SURFACE
      ?auto_5297 - PLACE
      ?auto_5295 - HOIST
      ?auto_5299 - SURFACE
      ?auto_5302 - SURFACE
      ?auto_5305 - TRUCK
      ?auto_5306 - PLACE
      ?auto_5307 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5296 ?auto_5301 ) ( IS-CRATE ?auto_5294 ) ( not ( = ?auto_5293 ?auto_5294 ) ) ( not ( = ?auto_5303 ?auto_5293 ) ) ( not ( = ?auto_5303 ?auto_5294 ) ) ( not ( = ?auto_5298 ?auto_5301 ) ) ( HOIST-AT ?auto_5300 ?auto_5298 ) ( not ( = ?auto_5296 ?auto_5300 ) ) ( AVAILABLE ?auto_5300 ) ( SURFACE-AT ?auto_5294 ?auto_5298 ) ( ON ?auto_5294 ?auto_5304 ) ( CLEAR ?auto_5294 ) ( not ( = ?auto_5293 ?auto_5304 ) ) ( not ( = ?auto_5294 ?auto_5304 ) ) ( not ( = ?auto_5303 ?auto_5304 ) ) ( IS-CRATE ?auto_5293 ) ( not ( = ?auto_5297 ?auto_5301 ) ) ( not ( = ?auto_5298 ?auto_5297 ) ) ( HOIST-AT ?auto_5295 ?auto_5297 ) ( not ( = ?auto_5296 ?auto_5295 ) ) ( not ( = ?auto_5300 ?auto_5295 ) ) ( AVAILABLE ?auto_5295 ) ( SURFACE-AT ?auto_5293 ?auto_5297 ) ( ON ?auto_5293 ?auto_5299 ) ( CLEAR ?auto_5293 ) ( not ( = ?auto_5293 ?auto_5299 ) ) ( not ( = ?auto_5294 ?auto_5299 ) ) ( not ( = ?auto_5303 ?auto_5299 ) ) ( not ( = ?auto_5304 ?auto_5299 ) ) ( SURFACE-AT ?auto_5302 ?auto_5301 ) ( CLEAR ?auto_5302 ) ( IS-CRATE ?auto_5303 ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5293 ?auto_5302 ) ) ( not ( = ?auto_5294 ?auto_5302 ) ) ( not ( = ?auto_5304 ?auto_5302 ) ) ( not ( = ?auto_5299 ?auto_5302 ) ) ( AVAILABLE ?auto_5296 ) ( TRUCK-AT ?auto_5305 ?auto_5306 ) ( not ( = ?auto_5306 ?auto_5301 ) ) ( not ( = ?auto_5298 ?auto_5306 ) ) ( not ( = ?auto_5297 ?auto_5306 ) ) ( HOIST-AT ?auto_5307 ?auto_5306 ) ( LIFTING ?auto_5307 ?auto_5303 ) ( not ( = ?auto_5296 ?auto_5307 ) ) ( not ( = ?auto_5300 ?auto_5307 ) ) ( not ( = ?auto_5295 ?auto_5307 ) ) )
    :subtasks
    ( ( !LOAD ?auto_5307 ?auto_5303 ?auto_5305 ?auto_5306 )
      ( MAKE-2CRATE ?auto_5303 ?auto_5293 ?auto_5294 )
      ( MAKE-1CRATE-VERIFY ?auto_5293 ?auto_5294 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5308 - SURFACE
      ?auto_5309 - SURFACE
      ?auto_5310 - SURFACE
    )
    :vars
    (
      ?auto_5315 - HOIST
      ?auto_5314 - PLACE
      ?auto_5322 - PLACE
      ?auto_5318 - HOIST
      ?auto_5313 - SURFACE
      ?auto_5320 - PLACE
      ?auto_5317 - HOIST
      ?auto_5321 - SURFACE
      ?auto_5319 - SURFACE
      ?auto_5311 - TRUCK
      ?auto_5312 - PLACE
      ?auto_5316 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5315 ?auto_5314 ) ( IS-CRATE ?auto_5310 ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5310 ) ) ( not ( = ?auto_5322 ?auto_5314 ) ) ( HOIST-AT ?auto_5318 ?auto_5322 ) ( not ( = ?auto_5315 ?auto_5318 ) ) ( AVAILABLE ?auto_5318 ) ( SURFACE-AT ?auto_5310 ?auto_5322 ) ( ON ?auto_5310 ?auto_5313 ) ( CLEAR ?auto_5310 ) ( not ( = ?auto_5309 ?auto_5313 ) ) ( not ( = ?auto_5310 ?auto_5313 ) ) ( not ( = ?auto_5308 ?auto_5313 ) ) ( IS-CRATE ?auto_5309 ) ( not ( = ?auto_5320 ?auto_5314 ) ) ( not ( = ?auto_5322 ?auto_5320 ) ) ( HOIST-AT ?auto_5317 ?auto_5320 ) ( not ( = ?auto_5315 ?auto_5317 ) ) ( not ( = ?auto_5318 ?auto_5317 ) ) ( AVAILABLE ?auto_5317 ) ( SURFACE-AT ?auto_5309 ?auto_5320 ) ( ON ?auto_5309 ?auto_5321 ) ( CLEAR ?auto_5309 ) ( not ( = ?auto_5309 ?auto_5321 ) ) ( not ( = ?auto_5310 ?auto_5321 ) ) ( not ( = ?auto_5308 ?auto_5321 ) ) ( not ( = ?auto_5313 ?auto_5321 ) ) ( SURFACE-AT ?auto_5319 ?auto_5314 ) ( CLEAR ?auto_5319 ) ( IS-CRATE ?auto_5308 ) ( not ( = ?auto_5319 ?auto_5308 ) ) ( not ( = ?auto_5309 ?auto_5319 ) ) ( not ( = ?auto_5310 ?auto_5319 ) ) ( not ( = ?auto_5313 ?auto_5319 ) ) ( not ( = ?auto_5321 ?auto_5319 ) ) ( AVAILABLE ?auto_5315 ) ( TRUCK-AT ?auto_5311 ?auto_5312 ) ( not ( = ?auto_5312 ?auto_5314 ) ) ( not ( = ?auto_5322 ?auto_5312 ) ) ( not ( = ?auto_5320 ?auto_5312 ) ) ( HOIST-AT ?auto_5316 ?auto_5312 ) ( LIFTING ?auto_5316 ?auto_5308 ) ( not ( = ?auto_5315 ?auto_5316 ) ) ( not ( = ?auto_5318 ?auto_5316 ) ) ( not ( = ?auto_5317 ?auto_5316 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5309 ?auto_5310 )
      ( MAKE-2CRATE-VERIFY ?auto_5308 ?auto_5309 ?auto_5310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5323 - SURFACE
      ?auto_5324 - SURFACE
      ?auto_5325 - SURFACE
      ?auto_5326 - SURFACE
    )
    :vars
    (
      ?auto_5335 - HOIST
      ?auto_5329 - PLACE
      ?auto_5334 - PLACE
      ?auto_5328 - HOIST
      ?auto_5332 - SURFACE
      ?auto_5336 - PLACE
      ?auto_5337 - HOIST
      ?auto_5327 - SURFACE
      ?auto_5330 - TRUCK
      ?auto_5331 - PLACE
      ?auto_5333 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5335 ?auto_5329 ) ( IS-CRATE ?auto_5326 ) ( not ( = ?auto_5325 ?auto_5326 ) ) ( not ( = ?auto_5324 ?auto_5325 ) ) ( not ( = ?auto_5324 ?auto_5326 ) ) ( not ( = ?auto_5334 ?auto_5329 ) ) ( HOIST-AT ?auto_5328 ?auto_5334 ) ( not ( = ?auto_5335 ?auto_5328 ) ) ( AVAILABLE ?auto_5328 ) ( SURFACE-AT ?auto_5326 ?auto_5334 ) ( ON ?auto_5326 ?auto_5332 ) ( CLEAR ?auto_5326 ) ( not ( = ?auto_5325 ?auto_5332 ) ) ( not ( = ?auto_5326 ?auto_5332 ) ) ( not ( = ?auto_5324 ?auto_5332 ) ) ( IS-CRATE ?auto_5325 ) ( not ( = ?auto_5336 ?auto_5329 ) ) ( not ( = ?auto_5334 ?auto_5336 ) ) ( HOIST-AT ?auto_5337 ?auto_5336 ) ( not ( = ?auto_5335 ?auto_5337 ) ) ( not ( = ?auto_5328 ?auto_5337 ) ) ( AVAILABLE ?auto_5337 ) ( SURFACE-AT ?auto_5325 ?auto_5336 ) ( ON ?auto_5325 ?auto_5327 ) ( CLEAR ?auto_5325 ) ( not ( = ?auto_5325 ?auto_5327 ) ) ( not ( = ?auto_5326 ?auto_5327 ) ) ( not ( = ?auto_5324 ?auto_5327 ) ) ( not ( = ?auto_5332 ?auto_5327 ) ) ( SURFACE-AT ?auto_5323 ?auto_5329 ) ( CLEAR ?auto_5323 ) ( IS-CRATE ?auto_5324 ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( not ( = ?auto_5325 ?auto_5323 ) ) ( not ( = ?auto_5326 ?auto_5323 ) ) ( not ( = ?auto_5332 ?auto_5323 ) ) ( not ( = ?auto_5327 ?auto_5323 ) ) ( AVAILABLE ?auto_5335 ) ( TRUCK-AT ?auto_5330 ?auto_5331 ) ( not ( = ?auto_5331 ?auto_5329 ) ) ( not ( = ?auto_5334 ?auto_5331 ) ) ( not ( = ?auto_5336 ?auto_5331 ) ) ( HOIST-AT ?auto_5333 ?auto_5331 ) ( LIFTING ?auto_5333 ?auto_5324 ) ( not ( = ?auto_5335 ?auto_5333 ) ) ( not ( = ?auto_5328 ?auto_5333 ) ) ( not ( = ?auto_5337 ?auto_5333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5324 ?auto_5325 ?auto_5326 )
      ( MAKE-3CRATE-VERIFY ?auto_5323 ?auto_5324 ?auto_5325 ?auto_5326 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5338 - SURFACE
      ?auto_5339 - SURFACE
    )
    :vars
    (
      ?auto_5349 - HOIST
      ?auto_5342 - PLACE
      ?auto_5352 - SURFACE
      ?auto_5348 - PLACE
      ?auto_5341 - HOIST
      ?auto_5345 - SURFACE
      ?auto_5350 - PLACE
      ?auto_5351 - HOIST
      ?auto_5340 - SURFACE
      ?auto_5346 - SURFACE
      ?auto_5343 - TRUCK
      ?auto_5344 - PLACE
      ?auto_5347 - HOIST
      ?auto_5353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5349 ?auto_5342 ) ( IS-CRATE ?auto_5339 ) ( not ( = ?auto_5338 ?auto_5339 ) ) ( not ( = ?auto_5352 ?auto_5338 ) ) ( not ( = ?auto_5352 ?auto_5339 ) ) ( not ( = ?auto_5348 ?auto_5342 ) ) ( HOIST-AT ?auto_5341 ?auto_5348 ) ( not ( = ?auto_5349 ?auto_5341 ) ) ( AVAILABLE ?auto_5341 ) ( SURFACE-AT ?auto_5339 ?auto_5348 ) ( ON ?auto_5339 ?auto_5345 ) ( CLEAR ?auto_5339 ) ( not ( = ?auto_5338 ?auto_5345 ) ) ( not ( = ?auto_5339 ?auto_5345 ) ) ( not ( = ?auto_5352 ?auto_5345 ) ) ( IS-CRATE ?auto_5338 ) ( not ( = ?auto_5350 ?auto_5342 ) ) ( not ( = ?auto_5348 ?auto_5350 ) ) ( HOIST-AT ?auto_5351 ?auto_5350 ) ( not ( = ?auto_5349 ?auto_5351 ) ) ( not ( = ?auto_5341 ?auto_5351 ) ) ( AVAILABLE ?auto_5351 ) ( SURFACE-AT ?auto_5338 ?auto_5350 ) ( ON ?auto_5338 ?auto_5340 ) ( CLEAR ?auto_5338 ) ( not ( = ?auto_5338 ?auto_5340 ) ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( not ( = ?auto_5352 ?auto_5340 ) ) ( not ( = ?auto_5345 ?auto_5340 ) ) ( SURFACE-AT ?auto_5346 ?auto_5342 ) ( CLEAR ?auto_5346 ) ( IS-CRATE ?auto_5352 ) ( not ( = ?auto_5346 ?auto_5352 ) ) ( not ( = ?auto_5338 ?auto_5346 ) ) ( not ( = ?auto_5339 ?auto_5346 ) ) ( not ( = ?auto_5345 ?auto_5346 ) ) ( not ( = ?auto_5340 ?auto_5346 ) ) ( AVAILABLE ?auto_5349 ) ( TRUCK-AT ?auto_5343 ?auto_5344 ) ( not ( = ?auto_5344 ?auto_5342 ) ) ( not ( = ?auto_5348 ?auto_5344 ) ) ( not ( = ?auto_5350 ?auto_5344 ) ) ( HOIST-AT ?auto_5347 ?auto_5344 ) ( not ( = ?auto_5349 ?auto_5347 ) ) ( not ( = ?auto_5341 ?auto_5347 ) ) ( not ( = ?auto_5351 ?auto_5347 ) ) ( AVAILABLE ?auto_5347 ) ( SURFACE-AT ?auto_5352 ?auto_5344 ) ( ON ?auto_5352 ?auto_5353 ) ( CLEAR ?auto_5352 ) ( not ( = ?auto_5338 ?auto_5353 ) ) ( not ( = ?auto_5339 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5353 ) ) ( not ( = ?auto_5345 ?auto_5353 ) ) ( not ( = ?auto_5340 ?auto_5353 ) ) ( not ( = ?auto_5346 ?auto_5353 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5347 ?auto_5352 ?auto_5353 ?auto_5344 )
      ( MAKE-2CRATE ?auto_5352 ?auto_5338 ?auto_5339 )
      ( MAKE-1CRATE-VERIFY ?auto_5338 ?auto_5339 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5354 - SURFACE
      ?auto_5355 - SURFACE
      ?auto_5356 - SURFACE
    )
    :vars
    (
      ?auto_5363 - HOIST
      ?auto_5361 - PLACE
      ?auto_5369 - PLACE
      ?auto_5368 - HOIST
      ?auto_5358 - SURFACE
      ?auto_5359 - PLACE
      ?auto_5364 - HOIST
      ?auto_5360 - SURFACE
      ?auto_5365 - SURFACE
      ?auto_5357 - TRUCK
      ?auto_5362 - PLACE
      ?auto_5366 - HOIST
      ?auto_5367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5363 ?auto_5361 ) ( IS-CRATE ?auto_5356 ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( not ( = ?auto_5354 ?auto_5355 ) ) ( not ( = ?auto_5354 ?auto_5356 ) ) ( not ( = ?auto_5369 ?auto_5361 ) ) ( HOIST-AT ?auto_5368 ?auto_5369 ) ( not ( = ?auto_5363 ?auto_5368 ) ) ( AVAILABLE ?auto_5368 ) ( SURFACE-AT ?auto_5356 ?auto_5369 ) ( ON ?auto_5356 ?auto_5358 ) ( CLEAR ?auto_5356 ) ( not ( = ?auto_5355 ?auto_5358 ) ) ( not ( = ?auto_5356 ?auto_5358 ) ) ( not ( = ?auto_5354 ?auto_5358 ) ) ( IS-CRATE ?auto_5355 ) ( not ( = ?auto_5359 ?auto_5361 ) ) ( not ( = ?auto_5369 ?auto_5359 ) ) ( HOIST-AT ?auto_5364 ?auto_5359 ) ( not ( = ?auto_5363 ?auto_5364 ) ) ( not ( = ?auto_5368 ?auto_5364 ) ) ( AVAILABLE ?auto_5364 ) ( SURFACE-AT ?auto_5355 ?auto_5359 ) ( ON ?auto_5355 ?auto_5360 ) ( CLEAR ?auto_5355 ) ( not ( = ?auto_5355 ?auto_5360 ) ) ( not ( = ?auto_5356 ?auto_5360 ) ) ( not ( = ?auto_5354 ?auto_5360 ) ) ( not ( = ?auto_5358 ?auto_5360 ) ) ( SURFACE-AT ?auto_5365 ?auto_5361 ) ( CLEAR ?auto_5365 ) ( IS-CRATE ?auto_5354 ) ( not ( = ?auto_5365 ?auto_5354 ) ) ( not ( = ?auto_5355 ?auto_5365 ) ) ( not ( = ?auto_5356 ?auto_5365 ) ) ( not ( = ?auto_5358 ?auto_5365 ) ) ( not ( = ?auto_5360 ?auto_5365 ) ) ( AVAILABLE ?auto_5363 ) ( TRUCK-AT ?auto_5357 ?auto_5362 ) ( not ( = ?auto_5362 ?auto_5361 ) ) ( not ( = ?auto_5369 ?auto_5362 ) ) ( not ( = ?auto_5359 ?auto_5362 ) ) ( HOIST-AT ?auto_5366 ?auto_5362 ) ( not ( = ?auto_5363 ?auto_5366 ) ) ( not ( = ?auto_5368 ?auto_5366 ) ) ( not ( = ?auto_5364 ?auto_5366 ) ) ( AVAILABLE ?auto_5366 ) ( SURFACE-AT ?auto_5354 ?auto_5362 ) ( ON ?auto_5354 ?auto_5367 ) ( CLEAR ?auto_5354 ) ( not ( = ?auto_5355 ?auto_5367 ) ) ( not ( = ?auto_5356 ?auto_5367 ) ) ( not ( = ?auto_5354 ?auto_5367 ) ) ( not ( = ?auto_5358 ?auto_5367 ) ) ( not ( = ?auto_5360 ?auto_5367 ) ) ( not ( = ?auto_5365 ?auto_5367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5355 ?auto_5356 )
      ( MAKE-2CRATE-VERIFY ?auto_5354 ?auto_5355 ?auto_5356 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5370 - SURFACE
      ?auto_5371 - SURFACE
      ?auto_5372 - SURFACE
      ?auto_5373 - SURFACE
    )
    :vars
    (
      ?auto_5385 - HOIST
      ?auto_5380 - PLACE
      ?auto_5376 - PLACE
      ?auto_5374 - HOIST
      ?auto_5381 - SURFACE
      ?auto_5375 - PLACE
      ?auto_5377 - HOIST
      ?auto_5383 - SURFACE
      ?auto_5382 - TRUCK
      ?auto_5384 - PLACE
      ?auto_5379 - HOIST
      ?auto_5378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5385 ?auto_5380 ) ( IS-CRATE ?auto_5373 ) ( not ( = ?auto_5372 ?auto_5373 ) ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( not ( = ?auto_5371 ?auto_5373 ) ) ( not ( = ?auto_5376 ?auto_5380 ) ) ( HOIST-AT ?auto_5374 ?auto_5376 ) ( not ( = ?auto_5385 ?auto_5374 ) ) ( AVAILABLE ?auto_5374 ) ( SURFACE-AT ?auto_5373 ?auto_5376 ) ( ON ?auto_5373 ?auto_5381 ) ( CLEAR ?auto_5373 ) ( not ( = ?auto_5372 ?auto_5381 ) ) ( not ( = ?auto_5373 ?auto_5381 ) ) ( not ( = ?auto_5371 ?auto_5381 ) ) ( IS-CRATE ?auto_5372 ) ( not ( = ?auto_5375 ?auto_5380 ) ) ( not ( = ?auto_5376 ?auto_5375 ) ) ( HOIST-AT ?auto_5377 ?auto_5375 ) ( not ( = ?auto_5385 ?auto_5377 ) ) ( not ( = ?auto_5374 ?auto_5377 ) ) ( AVAILABLE ?auto_5377 ) ( SURFACE-AT ?auto_5372 ?auto_5375 ) ( ON ?auto_5372 ?auto_5383 ) ( CLEAR ?auto_5372 ) ( not ( = ?auto_5372 ?auto_5383 ) ) ( not ( = ?auto_5373 ?auto_5383 ) ) ( not ( = ?auto_5371 ?auto_5383 ) ) ( not ( = ?auto_5381 ?auto_5383 ) ) ( SURFACE-AT ?auto_5370 ?auto_5380 ) ( CLEAR ?auto_5370 ) ( IS-CRATE ?auto_5371 ) ( not ( = ?auto_5370 ?auto_5371 ) ) ( not ( = ?auto_5372 ?auto_5370 ) ) ( not ( = ?auto_5373 ?auto_5370 ) ) ( not ( = ?auto_5381 ?auto_5370 ) ) ( not ( = ?auto_5383 ?auto_5370 ) ) ( AVAILABLE ?auto_5385 ) ( TRUCK-AT ?auto_5382 ?auto_5384 ) ( not ( = ?auto_5384 ?auto_5380 ) ) ( not ( = ?auto_5376 ?auto_5384 ) ) ( not ( = ?auto_5375 ?auto_5384 ) ) ( HOIST-AT ?auto_5379 ?auto_5384 ) ( not ( = ?auto_5385 ?auto_5379 ) ) ( not ( = ?auto_5374 ?auto_5379 ) ) ( not ( = ?auto_5377 ?auto_5379 ) ) ( AVAILABLE ?auto_5379 ) ( SURFACE-AT ?auto_5371 ?auto_5384 ) ( ON ?auto_5371 ?auto_5378 ) ( CLEAR ?auto_5371 ) ( not ( = ?auto_5372 ?auto_5378 ) ) ( not ( = ?auto_5373 ?auto_5378 ) ) ( not ( = ?auto_5371 ?auto_5378 ) ) ( not ( = ?auto_5381 ?auto_5378 ) ) ( not ( = ?auto_5383 ?auto_5378 ) ) ( not ( = ?auto_5370 ?auto_5378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5371 ?auto_5372 ?auto_5373 )
      ( MAKE-3CRATE-VERIFY ?auto_5370 ?auto_5371 ?auto_5372 ?auto_5373 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5386 - SURFACE
      ?auto_5387 - SURFACE
    )
    :vars
    (
      ?auto_5400 - HOIST
      ?auto_5395 - PLACE
      ?auto_5401 - SURFACE
      ?auto_5391 - PLACE
      ?auto_5389 - HOIST
      ?auto_5396 - SURFACE
      ?auto_5390 - PLACE
      ?auto_5392 - HOIST
      ?auto_5398 - SURFACE
      ?auto_5388 - SURFACE
      ?auto_5399 - PLACE
      ?auto_5394 - HOIST
      ?auto_5393 - SURFACE
      ?auto_5397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5400 ?auto_5395 ) ( IS-CRATE ?auto_5387 ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5401 ?auto_5386 ) ) ( not ( = ?auto_5401 ?auto_5387 ) ) ( not ( = ?auto_5391 ?auto_5395 ) ) ( HOIST-AT ?auto_5389 ?auto_5391 ) ( not ( = ?auto_5400 ?auto_5389 ) ) ( AVAILABLE ?auto_5389 ) ( SURFACE-AT ?auto_5387 ?auto_5391 ) ( ON ?auto_5387 ?auto_5396 ) ( CLEAR ?auto_5387 ) ( not ( = ?auto_5386 ?auto_5396 ) ) ( not ( = ?auto_5387 ?auto_5396 ) ) ( not ( = ?auto_5401 ?auto_5396 ) ) ( IS-CRATE ?auto_5386 ) ( not ( = ?auto_5390 ?auto_5395 ) ) ( not ( = ?auto_5391 ?auto_5390 ) ) ( HOIST-AT ?auto_5392 ?auto_5390 ) ( not ( = ?auto_5400 ?auto_5392 ) ) ( not ( = ?auto_5389 ?auto_5392 ) ) ( AVAILABLE ?auto_5392 ) ( SURFACE-AT ?auto_5386 ?auto_5390 ) ( ON ?auto_5386 ?auto_5398 ) ( CLEAR ?auto_5386 ) ( not ( = ?auto_5386 ?auto_5398 ) ) ( not ( = ?auto_5387 ?auto_5398 ) ) ( not ( = ?auto_5401 ?auto_5398 ) ) ( not ( = ?auto_5396 ?auto_5398 ) ) ( SURFACE-AT ?auto_5388 ?auto_5395 ) ( CLEAR ?auto_5388 ) ( IS-CRATE ?auto_5401 ) ( not ( = ?auto_5388 ?auto_5401 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5396 ?auto_5388 ) ) ( not ( = ?auto_5398 ?auto_5388 ) ) ( AVAILABLE ?auto_5400 ) ( not ( = ?auto_5399 ?auto_5395 ) ) ( not ( = ?auto_5391 ?auto_5399 ) ) ( not ( = ?auto_5390 ?auto_5399 ) ) ( HOIST-AT ?auto_5394 ?auto_5399 ) ( not ( = ?auto_5400 ?auto_5394 ) ) ( not ( = ?auto_5389 ?auto_5394 ) ) ( not ( = ?auto_5392 ?auto_5394 ) ) ( AVAILABLE ?auto_5394 ) ( SURFACE-AT ?auto_5401 ?auto_5399 ) ( ON ?auto_5401 ?auto_5393 ) ( CLEAR ?auto_5401 ) ( not ( = ?auto_5386 ?auto_5393 ) ) ( not ( = ?auto_5387 ?auto_5393 ) ) ( not ( = ?auto_5401 ?auto_5393 ) ) ( not ( = ?auto_5396 ?auto_5393 ) ) ( not ( = ?auto_5398 ?auto_5393 ) ) ( not ( = ?auto_5388 ?auto_5393 ) ) ( TRUCK-AT ?auto_5397 ?auto_5395 ) )
    :subtasks
    ( ( !DRIVE ?auto_5397 ?auto_5395 ?auto_5399 )
      ( MAKE-2CRATE ?auto_5401 ?auto_5386 ?auto_5387 )
      ( MAKE-1CRATE-VERIFY ?auto_5386 ?auto_5387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5402 - SURFACE
      ?auto_5403 - SURFACE
      ?auto_5404 - SURFACE
    )
    :vars
    (
      ?auto_5417 - HOIST
      ?auto_5405 - PLACE
      ?auto_5411 - PLACE
      ?auto_5410 - HOIST
      ?auto_5409 - SURFACE
      ?auto_5408 - PLACE
      ?auto_5406 - HOIST
      ?auto_5414 - SURFACE
      ?auto_5413 - SURFACE
      ?auto_5415 - PLACE
      ?auto_5407 - HOIST
      ?auto_5412 - SURFACE
      ?auto_5416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5417 ?auto_5405 ) ( IS-CRATE ?auto_5404 ) ( not ( = ?auto_5403 ?auto_5404 ) ) ( not ( = ?auto_5402 ?auto_5403 ) ) ( not ( = ?auto_5402 ?auto_5404 ) ) ( not ( = ?auto_5411 ?auto_5405 ) ) ( HOIST-AT ?auto_5410 ?auto_5411 ) ( not ( = ?auto_5417 ?auto_5410 ) ) ( AVAILABLE ?auto_5410 ) ( SURFACE-AT ?auto_5404 ?auto_5411 ) ( ON ?auto_5404 ?auto_5409 ) ( CLEAR ?auto_5404 ) ( not ( = ?auto_5403 ?auto_5409 ) ) ( not ( = ?auto_5404 ?auto_5409 ) ) ( not ( = ?auto_5402 ?auto_5409 ) ) ( IS-CRATE ?auto_5403 ) ( not ( = ?auto_5408 ?auto_5405 ) ) ( not ( = ?auto_5411 ?auto_5408 ) ) ( HOIST-AT ?auto_5406 ?auto_5408 ) ( not ( = ?auto_5417 ?auto_5406 ) ) ( not ( = ?auto_5410 ?auto_5406 ) ) ( AVAILABLE ?auto_5406 ) ( SURFACE-AT ?auto_5403 ?auto_5408 ) ( ON ?auto_5403 ?auto_5414 ) ( CLEAR ?auto_5403 ) ( not ( = ?auto_5403 ?auto_5414 ) ) ( not ( = ?auto_5404 ?auto_5414 ) ) ( not ( = ?auto_5402 ?auto_5414 ) ) ( not ( = ?auto_5409 ?auto_5414 ) ) ( SURFACE-AT ?auto_5413 ?auto_5405 ) ( CLEAR ?auto_5413 ) ( IS-CRATE ?auto_5402 ) ( not ( = ?auto_5413 ?auto_5402 ) ) ( not ( = ?auto_5403 ?auto_5413 ) ) ( not ( = ?auto_5404 ?auto_5413 ) ) ( not ( = ?auto_5409 ?auto_5413 ) ) ( not ( = ?auto_5414 ?auto_5413 ) ) ( AVAILABLE ?auto_5417 ) ( not ( = ?auto_5415 ?auto_5405 ) ) ( not ( = ?auto_5411 ?auto_5415 ) ) ( not ( = ?auto_5408 ?auto_5415 ) ) ( HOIST-AT ?auto_5407 ?auto_5415 ) ( not ( = ?auto_5417 ?auto_5407 ) ) ( not ( = ?auto_5410 ?auto_5407 ) ) ( not ( = ?auto_5406 ?auto_5407 ) ) ( AVAILABLE ?auto_5407 ) ( SURFACE-AT ?auto_5402 ?auto_5415 ) ( ON ?auto_5402 ?auto_5412 ) ( CLEAR ?auto_5402 ) ( not ( = ?auto_5403 ?auto_5412 ) ) ( not ( = ?auto_5404 ?auto_5412 ) ) ( not ( = ?auto_5402 ?auto_5412 ) ) ( not ( = ?auto_5409 ?auto_5412 ) ) ( not ( = ?auto_5414 ?auto_5412 ) ) ( not ( = ?auto_5413 ?auto_5412 ) ) ( TRUCK-AT ?auto_5416 ?auto_5405 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5403 ?auto_5404 )
      ( MAKE-2CRATE-VERIFY ?auto_5402 ?auto_5403 ?auto_5404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5418 - SURFACE
      ?auto_5419 - SURFACE
      ?auto_5420 - SURFACE
      ?auto_5421 - SURFACE
    )
    :vars
    (
      ?auto_5425 - HOIST
      ?auto_5429 - PLACE
      ?auto_5430 - PLACE
      ?auto_5423 - HOIST
      ?auto_5433 - SURFACE
      ?auto_5428 - PLACE
      ?auto_5431 - HOIST
      ?auto_5424 - SURFACE
      ?auto_5427 - PLACE
      ?auto_5426 - HOIST
      ?auto_5432 - SURFACE
      ?auto_5422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5425 ?auto_5429 ) ( IS-CRATE ?auto_5421 ) ( not ( = ?auto_5420 ?auto_5421 ) ) ( not ( = ?auto_5419 ?auto_5420 ) ) ( not ( = ?auto_5419 ?auto_5421 ) ) ( not ( = ?auto_5430 ?auto_5429 ) ) ( HOIST-AT ?auto_5423 ?auto_5430 ) ( not ( = ?auto_5425 ?auto_5423 ) ) ( AVAILABLE ?auto_5423 ) ( SURFACE-AT ?auto_5421 ?auto_5430 ) ( ON ?auto_5421 ?auto_5433 ) ( CLEAR ?auto_5421 ) ( not ( = ?auto_5420 ?auto_5433 ) ) ( not ( = ?auto_5421 ?auto_5433 ) ) ( not ( = ?auto_5419 ?auto_5433 ) ) ( IS-CRATE ?auto_5420 ) ( not ( = ?auto_5428 ?auto_5429 ) ) ( not ( = ?auto_5430 ?auto_5428 ) ) ( HOIST-AT ?auto_5431 ?auto_5428 ) ( not ( = ?auto_5425 ?auto_5431 ) ) ( not ( = ?auto_5423 ?auto_5431 ) ) ( AVAILABLE ?auto_5431 ) ( SURFACE-AT ?auto_5420 ?auto_5428 ) ( ON ?auto_5420 ?auto_5424 ) ( CLEAR ?auto_5420 ) ( not ( = ?auto_5420 ?auto_5424 ) ) ( not ( = ?auto_5421 ?auto_5424 ) ) ( not ( = ?auto_5419 ?auto_5424 ) ) ( not ( = ?auto_5433 ?auto_5424 ) ) ( SURFACE-AT ?auto_5418 ?auto_5429 ) ( CLEAR ?auto_5418 ) ( IS-CRATE ?auto_5419 ) ( not ( = ?auto_5418 ?auto_5419 ) ) ( not ( = ?auto_5420 ?auto_5418 ) ) ( not ( = ?auto_5421 ?auto_5418 ) ) ( not ( = ?auto_5433 ?auto_5418 ) ) ( not ( = ?auto_5424 ?auto_5418 ) ) ( AVAILABLE ?auto_5425 ) ( not ( = ?auto_5427 ?auto_5429 ) ) ( not ( = ?auto_5430 ?auto_5427 ) ) ( not ( = ?auto_5428 ?auto_5427 ) ) ( HOIST-AT ?auto_5426 ?auto_5427 ) ( not ( = ?auto_5425 ?auto_5426 ) ) ( not ( = ?auto_5423 ?auto_5426 ) ) ( not ( = ?auto_5431 ?auto_5426 ) ) ( AVAILABLE ?auto_5426 ) ( SURFACE-AT ?auto_5419 ?auto_5427 ) ( ON ?auto_5419 ?auto_5432 ) ( CLEAR ?auto_5419 ) ( not ( = ?auto_5420 ?auto_5432 ) ) ( not ( = ?auto_5421 ?auto_5432 ) ) ( not ( = ?auto_5419 ?auto_5432 ) ) ( not ( = ?auto_5433 ?auto_5432 ) ) ( not ( = ?auto_5424 ?auto_5432 ) ) ( not ( = ?auto_5418 ?auto_5432 ) ) ( TRUCK-AT ?auto_5422 ?auto_5429 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5419 ?auto_5420 ?auto_5421 )
      ( MAKE-3CRATE-VERIFY ?auto_5418 ?auto_5419 ?auto_5420 ?auto_5421 ) )
  )

)

