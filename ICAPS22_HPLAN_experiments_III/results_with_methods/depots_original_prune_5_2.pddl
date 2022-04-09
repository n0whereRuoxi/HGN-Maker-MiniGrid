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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18539 - SURFACE
      ?auto_18540 - SURFACE
    )
    :vars
    (
      ?auto_18541 - HOIST
      ?auto_18542 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18541 ?auto_18542 ) ( SURFACE-AT ?auto_18539 ?auto_18542 ) ( CLEAR ?auto_18539 ) ( LIFTING ?auto_18541 ?auto_18540 ) ( IS-CRATE ?auto_18540 ) ( not ( = ?auto_18539 ?auto_18540 ) ) )
    :subtasks
    ( ( !DROP ?auto_18541 ?auto_18540 ?auto_18539 ?auto_18542 )
      ( MAKE-1CRATE-VERIFY ?auto_18539 ?auto_18540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18543 - SURFACE
      ?auto_18544 - SURFACE
    )
    :vars
    (
      ?auto_18546 - HOIST
      ?auto_18545 - PLACE
      ?auto_18547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18546 ?auto_18545 ) ( SURFACE-AT ?auto_18543 ?auto_18545 ) ( CLEAR ?auto_18543 ) ( IS-CRATE ?auto_18544 ) ( not ( = ?auto_18543 ?auto_18544 ) ) ( TRUCK-AT ?auto_18547 ?auto_18545 ) ( AVAILABLE ?auto_18546 ) ( IN ?auto_18544 ?auto_18547 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18546 ?auto_18544 ?auto_18547 ?auto_18545 )
      ( MAKE-1CRATE ?auto_18543 ?auto_18544 )
      ( MAKE-1CRATE-VERIFY ?auto_18543 ?auto_18544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18548 - SURFACE
      ?auto_18549 - SURFACE
    )
    :vars
    (
      ?auto_18550 - HOIST
      ?auto_18552 - PLACE
      ?auto_18551 - TRUCK
      ?auto_18553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18550 ?auto_18552 ) ( SURFACE-AT ?auto_18548 ?auto_18552 ) ( CLEAR ?auto_18548 ) ( IS-CRATE ?auto_18549 ) ( not ( = ?auto_18548 ?auto_18549 ) ) ( AVAILABLE ?auto_18550 ) ( IN ?auto_18549 ?auto_18551 ) ( TRUCK-AT ?auto_18551 ?auto_18553 ) ( not ( = ?auto_18553 ?auto_18552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18551 ?auto_18553 ?auto_18552 )
      ( MAKE-1CRATE ?auto_18548 ?auto_18549 )
      ( MAKE-1CRATE-VERIFY ?auto_18548 ?auto_18549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18554 - SURFACE
      ?auto_18555 - SURFACE
    )
    :vars
    (
      ?auto_18558 - HOIST
      ?auto_18556 - PLACE
      ?auto_18559 - TRUCK
      ?auto_18557 - PLACE
      ?auto_18560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18558 ?auto_18556 ) ( SURFACE-AT ?auto_18554 ?auto_18556 ) ( CLEAR ?auto_18554 ) ( IS-CRATE ?auto_18555 ) ( not ( = ?auto_18554 ?auto_18555 ) ) ( AVAILABLE ?auto_18558 ) ( TRUCK-AT ?auto_18559 ?auto_18557 ) ( not ( = ?auto_18557 ?auto_18556 ) ) ( HOIST-AT ?auto_18560 ?auto_18557 ) ( LIFTING ?auto_18560 ?auto_18555 ) ( not ( = ?auto_18558 ?auto_18560 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18560 ?auto_18555 ?auto_18559 ?auto_18557 )
      ( MAKE-1CRATE ?auto_18554 ?auto_18555 )
      ( MAKE-1CRATE-VERIFY ?auto_18554 ?auto_18555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18561 - SURFACE
      ?auto_18562 - SURFACE
    )
    :vars
    (
      ?auto_18563 - HOIST
      ?auto_18566 - PLACE
      ?auto_18567 - TRUCK
      ?auto_18564 - PLACE
      ?auto_18565 - HOIST
      ?auto_18568 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18563 ?auto_18566 ) ( SURFACE-AT ?auto_18561 ?auto_18566 ) ( CLEAR ?auto_18561 ) ( IS-CRATE ?auto_18562 ) ( not ( = ?auto_18561 ?auto_18562 ) ) ( AVAILABLE ?auto_18563 ) ( TRUCK-AT ?auto_18567 ?auto_18564 ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( HOIST-AT ?auto_18565 ?auto_18564 ) ( not ( = ?auto_18563 ?auto_18565 ) ) ( AVAILABLE ?auto_18565 ) ( SURFACE-AT ?auto_18562 ?auto_18564 ) ( ON ?auto_18562 ?auto_18568 ) ( CLEAR ?auto_18562 ) ( not ( = ?auto_18561 ?auto_18568 ) ) ( not ( = ?auto_18562 ?auto_18568 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18565 ?auto_18562 ?auto_18568 ?auto_18564 )
      ( MAKE-1CRATE ?auto_18561 ?auto_18562 )
      ( MAKE-1CRATE-VERIFY ?auto_18561 ?auto_18562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18569 - SURFACE
      ?auto_18570 - SURFACE
    )
    :vars
    (
      ?auto_18574 - HOIST
      ?auto_18573 - PLACE
      ?auto_18571 - PLACE
      ?auto_18572 - HOIST
      ?auto_18576 - SURFACE
      ?auto_18575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18574 ?auto_18573 ) ( SURFACE-AT ?auto_18569 ?auto_18573 ) ( CLEAR ?auto_18569 ) ( IS-CRATE ?auto_18570 ) ( not ( = ?auto_18569 ?auto_18570 ) ) ( AVAILABLE ?auto_18574 ) ( not ( = ?auto_18571 ?auto_18573 ) ) ( HOIST-AT ?auto_18572 ?auto_18571 ) ( not ( = ?auto_18574 ?auto_18572 ) ) ( AVAILABLE ?auto_18572 ) ( SURFACE-AT ?auto_18570 ?auto_18571 ) ( ON ?auto_18570 ?auto_18576 ) ( CLEAR ?auto_18570 ) ( not ( = ?auto_18569 ?auto_18576 ) ) ( not ( = ?auto_18570 ?auto_18576 ) ) ( TRUCK-AT ?auto_18575 ?auto_18573 ) )
    :subtasks
    ( ( !DRIVE ?auto_18575 ?auto_18573 ?auto_18571 )
      ( MAKE-1CRATE ?auto_18569 ?auto_18570 )
      ( MAKE-1CRATE-VERIFY ?auto_18569 ?auto_18570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18586 - SURFACE
      ?auto_18587 - SURFACE
      ?auto_18588 - SURFACE
    )
    :vars
    (
      ?auto_18589 - HOIST
      ?auto_18590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18589 ?auto_18590 ) ( SURFACE-AT ?auto_18587 ?auto_18590 ) ( CLEAR ?auto_18587 ) ( LIFTING ?auto_18589 ?auto_18588 ) ( IS-CRATE ?auto_18588 ) ( not ( = ?auto_18587 ?auto_18588 ) ) ( ON ?auto_18587 ?auto_18586 ) ( not ( = ?auto_18586 ?auto_18587 ) ) ( not ( = ?auto_18586 ?auto_18588 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18587 ?auto_18588 )
      ( MAKE-2CRATE-VERIFY ?auto_18586 ?auto_18587 ?auto_18588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18596 - SURFACE
      ?auto_18597 - SURFACE
      ?auto_18598 - SURFACE
    )
    :vars
    (
      ?auto_18601 - HOIST
      ?auto_18599 - PLACE
      ?auto_18600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18601 ?auto_18599 ) ( SURFACE-AT ?auto_18597 ?auto_18599 ) ( CLEAR ?auto_18597 ) ( IS-CRATE ?auto_18598 ) ( not ( = ?auto_18597 ?auto_18598 ) ) ( TRUCK-AT ?auto_18600 ?auto_18599 ) ( AVAILABLE ?auto_18601 ) ( IN ?auto_18598 ?auto_18600 ) ( ON ?auto_18597 ?auto_18596 ) ( not ( = ?auto_18596 ?auto_18597 ) ) ( not ( = ?auto_18596 ?auto_18598 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18597 ?auto_18598 )
      ( MAKE-2CRATE-VERIFY ?auto_18596 ?auto_18597 ?auto_18598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18602 - SURFACE
      ?auto_18603 - SURFACE
    )
    :vars
    (
      ?auto_18604 - HOIST
      ?auto_18605 - PLACE
      ?auto_18607 - TRUCK
      ?auto_18606 - SURFACE
      ?auto_18608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18604 ?auto_18605 ) ( SURFACE-AT ?auto_18602 ?auto_18605 ) ( CLEAR ?auto_18602 ) ( IS-CRATE ?auto_18603 ) ( not ( = ?auto_18602 ?auto_18603 ) ) ( AVAILABLE ?auto_18604 ) ( IN ?auto_18603 ?auto_18607 ) ( ON ?auto_18602 ?auto_18606 ) ( not ( = ?auto_18606 ?auto_18602 ) ) ( not ( = ?auto_18606 ?auto_18603 ) ) ( TRUCK-AT ?auto_18607 ?auto_18608 ) ( not ( = ?auto_18608 ?auto_18605 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18607 ?auto_18608 ?auto_18605 )
      ( MAKE-2CRATE ?auto_18606 ?auto_18602 ?auto_18603 )
      ( MAKE-1CRATE-VERIFY ?auto_18602 ?auto_18603 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18609 - SURFACE
      ?auto_18610 - SURFACE
      ?auto_18611 - SURFACE
    )
    :vars
    (
      ?auto_18614 - HOIST
      ?auto_18615 - PLACE
      ?auto_18612 - TRUCK
      ?auto_18613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18614 ?auto_18615 ) ( SURFACE-AT ?auto_18610 ?auto_18615 ) ( CLEAR ?auto_18610 ) ( IS-CRATE ?auto_18611 ) ( not ( = ?auto_18610 ?auto_18611 ) ) ( AVAILABLE ?auto_18614 ) ( IN ?auto_18611 ?auto_18612 ) ( ON ?auto_18610 ?auto_18609 ) ( not ( = ?auto_18609 ?auto_18610 ) ) ( not ( = ?auto_18609 ?auto_18611 ) ) ( TRUCK-AT ?auto_18612 ?auto_18613 ) ( not ( = ?auto_18613 ?auto_18615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18610 ?auto_18611 )
      ( MAKE-2CRATE-VERIFY ?auto_18609 ?auto_18610 ?auto_18611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18616 - SURFACE
      ?auto_18617 - SURFACE
    )
    :vars
    (
      ?auto_18620 - HOIST
      ?auto_18619 - PLACE
      ?auto_18621 - SURFACE
      ?auto_18618 - TRUCK
      ?auto_18622 - PLACE
      ?auto_18623 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18620 ?auto_18619 ) ( SURFACE-AT ?auto_18616 ?auto_18619 ) ( CLEAR ?auto_18616 ) ( IS-CRATE ?auto_18617 ) ( not ( = ?auto_18616 ?auto_18617 ) ) ( AVAILABLE ?auto_18620 ) ( ON ?auto_18616 ?auto_18621 ) ( not ( = ?auto_18621 ?auto_18616 ) ) ( not ( = ?auto_18621 ?auto_18617 ) ) ( TRUCK-AT ?auto_18618 ?auto_18622 ) ( not ( = ?auto_18622 ?auto_18619 ) ) ( HOIST-AT ?auto_18623 ?auto_18622 ) ( LIFTING ?auto_18623 ?auto_18617 ) ( not ( = ?auto_18620 ?auto_18623 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18623 ?auto_18617 ?auto_18618 ?auto_18622 )
      ( MAKE-2CRATE ?auto_18621 ?auto_18616 ?auto_18617 )
      ( MAKE-1CRATE-VERIFY ?auto_18616 ?auto_18617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18624 - SURFACE
      ?auto_18625 - SURFACE
      ?auto_18626 - SURFACE
    )
    :vars
    (
      ?auto_18630 - HOIST
      ?auto_18629 - PLACE
      ?auto_18631 - TRUCK
      ?auto_18628 - PLACE
      ?auto_18627 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18630 ?auto_18629 ) ( SURFACE-AT ?auto_18625 ?auto_18629 ) ( CLEAR ?auto_18625 ) ( IS-CRATE ?auto_18626 ) ( not ( = ?auto_18625 ?auto_18626 ) ) ( AVAILABLE ?auto_18630 ) ( ON ?auto_18625 ?auto_18624 ) ( not ( = ?auto_18624 ?auto_18625 ) ) ( not ( = ?auto_18624 ?auto_18626 ) ) ( TRUCK-AT ?auto_18631 ?auto_18628 ) ( not ( = ?auto_18628 ?auto_18629 ) ) ( HOIST-AT ?auto_18627 ?auto_18628 ) ( LIFTING ?auto_18627 ?auto_18626 ) ( not ( = ?auto_18630 ?auto_18627 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18625 ?auto_18626 )
      ( MAKE-2CRATE-VERIFY ?auto_18624 ?auto_18625 ?auto_18626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18632 - SURFACE
      ?auto_18633 - SURFACE
    )
    :vars
    (
      ?auto_18635 - HOIST
      ?auto_18636 - PLACE
      ?auto_18639 - SURFACE
      ?auto_18638 - TRUCK
      ?auto_18634 - PLACE
      ?auto_18637 - HOIST
      ?auto_18640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18635 ?auto_18636 ) ( SURFACE-AT ?auto_18632 ?auto_18636 ) ( CLEAR ?auto_18632 ) ( IS-CRATE ?auto_18633 ) ( not ( = ?auto_18632 ?auto_18633 ) ) ( AVAILABLE ?auto_18635 ) ( ON ?auto_18632 ?auto_18639 ) ( not ( = ?auto_18639 ?auto_18632 ) ) ( not ( = ?auto_18639 ?auto_18633 ) ) ( TRUCK-AT ?auto_18638 ?auto_18634 ) ( not ( = ?auto_18634 ?auto_18636 ) ) ( HOIST-AT ?auto_18637 ?auto_18634 ) ( not ( = ?auto_18635 ?auto_18637 ) ) ( AVAILABLE ?auto_18637 ) ( SURFACE-AT ?auto_18633 ?auto_18634 ) ( ON ?auto_18633 ?auto_18640 ) ( CLEAR ?auto_18633 ) ( not ( = ?auto_18632 ?auto_18640 ) ) ( not ( = ?auto_18633 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18640 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18637 ?auto_18633 ?auto_18640 ?auto_18634 )
      ( MAKE-2CRATE ?auto_18639 ?auto_18632 ?auto_18633 )
      ( MAKE-1CRATE-VERIFY ?auto_18632 ?auto_18633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18641 - SURFACE
      ?auto_18642 - SURFACE
      ?auto_18643 - SURFACE
    )
    :vars
    (
      ?auto_18645 - HOIST
      ?auto_18646 - PLACE
      ?auto_18648 - TRUCK
      ?auto_18649 - PLACE
      ?auto_18647 - HOIST
      ?auto_18644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18645 ?auto_18646 ) ( SURFACE-AT ?auto_18642 ?auto_18646 ) ( CLEAR ?auto_18642 ) ( IS-CRATE ?auto_18643 ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( AVAILABLE ?auto_18645 ) ( ON ?auto_18642 ?auto_18641 ) ( not ( = ?auto_18641 ?auto_18642 ) ) ( not ( = ?auto_18641 ?auto_18643 ) ) ( TRUCK-AT ?auto_18648 ?auto_18649 ) ( not ( = ?auto_18649 ?auto_18646 ) ) ( HOIST-AT ?auto_18647 ?auto_18649 ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( AVAILABLE ?auto_18647 ) ( SURFACE-AT ?auto_18643 ?auto_18649 ) ( ON ?auto_18643 ?auto_18644 ) ( CLEAR ?auto_18643 ) ( not ( = ?auto_18642 ?auto_18644 ) ) ( not ( = ?auto_18643 ?auto_18644 ) ) ( not ( = ?auto_18641 ?auto_18644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18642 ?auto_18643 )
      ( MAKE-2CRATE-VERIFY ?auto_18641 ?auto_18642 ?auto_18643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18650 - SURFACE
      ?auto_18651 - SURFACE
    )
    :vars
    (
      ?auto_18653 - HOIST
      ?auto_18657 - PLACE
      ?auto_18654 - SURFACE
      ?auto_18652 - PLACE
      ?auto_18655 - HOIST
      ?auto_18656 - SURFACE
      ?auto_18658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18653 ?auto_18657 ) ( SURFACE-AT ?auto_18650 ?auto_18657 ) ( CLEAR ?auto_18650 ) ( IS-CRATE ?auto_18651 ) ( not ( = ?auto_18650 ?auto_18651 ) ) ( AVAILABLE ?auto_18653 ) ( ON ?auto_18650 ?auto_18654 ) ( not ( = ?auto_18654 ?auto_18650 ) ) ( not ( = ?auto_18654 ?auto_18651 ) ) ( not ( = ?auto_18652 ?auto_18657 ) ) ( HOIST-AT ?auto_18655 ?auto_18652 ) ( not ( = ?auto_18653 ?auto_18655 ) ) ( AVAILABLE ?auto_18655 ) ( SURFACE-AT ?auto_18651 ?auto_18652 ) ( ON ?auto_18651 ?auto_18656 ) ( CLEAR ?auto_18651 ) ( not ( = ?auto_18650 ?auto_18656 ) ) ( not ( = ?auto_18651 ?auto_18656 ) ) ( not ( = ?auto_18654 ?auto_18656 ) ) ( TRUCK-AT ?auto_18658 ?auto_18657 ) )
    :subtasks
    ( ( !DRIVE ?auto_18658 ?auto_18657 ?auto_18652 )
      ( MAKE-2CRATE ?auto_18654 ?auto_18650 ?auto_18651 )
      ( MAKE-1CRATE-VERIFY ?auto_18650 ?auto_18651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18659 - SURFACE
      ?auto_18660 - SURFACE
      ?auto_18661 - SURFACE
    )
    :vars
    (
      ?auto_18666 - HOIST
      ?auto_18667 - PLACE
      ?auto_18664 - PLACE
      ?auto_18663 - HOIST
      ?auto_18662 - SURFACE
      ?auto_18665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18666 ?auto_18667 ) ( SURFACE-AT ?auto_18660 ?auto_18667 ) ( CLEAR ?auto_18660 ) ( IS-CRATE ?auto_18661 ) ( not ( = ?auto_18660 ?auto_18661 ) ) ( AVAILABLE ?auto_18666 ) ( ON ?auto_18660 ?auto_18659 ) ( not ( = ?auto_18659 ?auto_18660 ) ) ( not ( = ?auto_18659 ?auto_18661 ) ) ( not ( = ?auto_18664 ?auto_18667 ) ) ( HOIST-AT ?auto_18663 ?auto_18664 ) ( not ( = ?auto_18666 ?auto_18663 ) ) ( AVAILABLE ?auto_18663 ) ( SURFACE-AT ?auto_18661 ?auto_18664 ) ( ON ?auto_18661 ?auto_18662 ) ( CLEAR ?auto_18661 ) ( not ( = ?auto_18660 ?auto_18662 ) ) ( not ( = ?auto_18661 ?auto_18662 ) ) ( not ( = ?auto_18659 ?auto_18662 ) ) ( TRUCK-AT ?auto_18665 ?auto_18667 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18660 ?auto_18661 )
      ( MAKE-2CRATE-VERIFY ?auto_18659 ?auto_18660 ?auto_18661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18668 - SURFACE
      ?auto_18669 - SURFACE
    )
    :vars
    (
      ?auto_18675 - HOIST
      ?auto_18670 - PLACE
      ?auto_18674 - SURFACE
      ?auto_18671 - PLACE
      ?auto_18673 - HOIST
      ?auto_18672 - SURFACE
      ?auto_18676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18675 ?auto_18670 ) ( IS-CRATE ?auto_18669 ) ( not ( = ?auto_18668 ?auto_18669 ) ) ( not ( = ?auto_18674 ?auto_18668 ) ) ( not ( = ?auto_18674 ?auto_18669 ) ) ( not ( = ?auto_18671 ?auto_18670 ) ) ( HOIST-AT ?auto_18673 ?auto_18671 ) ( not ( = ?auto_18675 ?auto_18673 ) ) ( AVAILABLE ?auto_18673 ) ( SURFACE-AT ?auto_18669 ?auto_18671 ) ( ON ?auto_18669 ?auto_18672 ) ( CLEAR ?auto_18669 ) ( not ( = ?auto_18668 ?auto_18672 ) ) ( not ( = ?auto_18669 ?auto_18672 ) ) ( not ( = ?auto_18674 ?auto_18672 ) ) ( TRUCK-AT ?auto_18676 ?auto_18670 ) ( SURFACE-AT ?auto_18674 ?auto_18670 ) ( CLEAR ?auto_18674 ) ( LIFTING ?auto_18675 ?auto_18668 ) ( IS-CRATE ?auto_18668 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18674 ?auto_18668 )
      ( MAKE-2CRATE ?auto_18674 ?auto_18668 ?auto_18669 )
      ( MAKE-1CRATE-VERIFY ?auto_18668 ?auto_18669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18677 - SURFACE
      ?auto_18678 - SURFACE
      ?auto_18679 - SURFACE
    )
    :vars
    (
      ?auto_18681 - HOIST
      ?auto_18680 - PLACE
      ?auto_18684 - PLACE
      ?auto_18682 - HOIST
      ?auto_18685 - SURFACE
      ?auto_18683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18681 ?auto_18680 ) ( IS-CRATE ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( not ( = ?auto_18677 ?auto_18678 ) ) ( not ( = ?auto_18677 ?auto_18679 ) ) ( not ( = ?auto_18684 ?auto_18680 ) ) ( HOIST-AT ?auto_18682 ?auto_18684 ) ( not ( = ?auto_18681 ?auto_18682 ) ) ( AVAILABLE ?auto_18682 ) ( SURFACE-AT ?auto_18679 ?auto_18684 ) ( ON ?auto_18679 ?auto_18685 ) ( CLEAR ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18685 ) ) ( not ( = ?auto_18679 ?auto_18685 ) ) ( not ( = ?auto_18677 ?auto_18685 ) ) ( TRUCK-AT ?auto_18683 ?auto_18680 ) ( SURFACE-AT ?auto_18677 ?auto_18680 ) ( CLEAR ?auto_18677 ) ( LIFTING ?auto_18681 ?auto_18678 ) ( IS-CRATE ?auto_18678 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18678 ?auto_18679 )
      ( MAKE-2CRATE-VERIFY ?auto_18677 ?auto_18678 ?auto_18679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18686 - SURFACE
      ?auto_18687 - SURFACE
    )
    :vars
    (
      ?auto_18692 - HOIST
      ?auto_18689 - PLACE
      ?auto_18694 - SURFACE
      ?auto_18688 - PLACE
      ?auto_18691 - HOIST
      ?auto_18690 - SURFACE
      ?auto_18693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18692 ?auto_18689 ) ( IS-CRATE ?auto_18687 ) ( not ( = ?auto_18686 ?auto_18687 ) ) ( not ( = ?auto_18694 ?auto_18686 ) ) ( not ( = ?auto_18694 ?auto_18687 ) ) ( not ( = ?auto_18688 ?auto_18689 ) ) ( HOIST-AT ?auto_18691 ?auto_18688 ) ( not ( = ?auto_18692 ?auto_18691 ) ) ( AVAILABLE ?auto_18691 ) ( SURFACE-AT ?auto_18687 ?auto_18688 ) ( ON ?auto_18687 ?auto_18690 ) ( CLEAR ?auto_18687 ) ( not ( = ?auto_18686 ?auto_18690 ) ) ( not ( = ?auto_18687 ?auto_18690 ) ) ( not ( = ?auto_18694 ?auto_18690 ) ) ( TRUCK-AT ?auto_18693 ?auto_18689 ) ( SURFACE-AT ?auto_18694 ?auto_18689 ) ( CLEAR ?auto_18694 ) ( IS-CRATE ?auto_18686 ) ( AVAILABLE ?auto_18692 ) ( IN ?auto_18686 ?auto_18693 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18692 ?auto_18686 ?auto_18693 ?auto_18689 )
      ( MAKE-2CRATE ?auto_18694 ?auto_18686 ?auto_18687 )
      ( MAKE-1CRATE-VERIFY ?auto_18686 ?auto_18687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18695 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18697 - SURFACE
    )
    :vars
    (
      ?auto_18703 - HOIST
      ?auto_18698 - PLACE
      ?auto_18700 - PLACE
      ?auto_18699 - HOIST
      ?auto_18701 - SURFACE
      ?auto_18702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18703 ?auto_18698 ) ( IS-CRATE ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( not ( = ?auto_18700 ?auto_18698 ) ) ( HOIST-AT ?auto_18699 ?auto_18700 ) ( not ( = ?auto_18703 ?auto_18699 ) ) ( AVAILABLE ?auto_18699 ) ( SURFACE-AT ?auto_18697 ?auto_18700 ) ( ON ?auto_18697 ?auto_18701 ) ( CLEAR ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18701 ) ) ( not ( = ?auto_18697 ?auto_18701 ) ) ( not ( = ?auto_18695 ?auto_18701 ) ) ( TRUCK-AT ?auto_18702 ?auto_18698 ) ( SURFACE-AT ?auto_18695 ?auto_18698 ) ( CLEAR ?auto_18695 ) ( IS-CRATE ?auto_18696 ) ( AVAILABLE ?auto_18703 ) ( IN ?auto_18696 ?auto_18702 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18696 ?auto_18697 )
      ( MAKE-2CRATE-VERIFY ?auto_18695 ?auto_18696 ?auto_18697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18740 - SURFACE
      ?auto_18741 - SURFACE
    )
    :vars
    (
      ?auto_18747 - HOIST
      ?auto_18748 - PLACE
      ?auto_18742 - SURFACE
      ?auto_18744 - PLACE
      ?auto_18743 - HOIST
      ?auto_18745 - SURFACE
      ?auto_18746 - TRUCK
      ?auto_18749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18747 ?auto_18748 ) ( SURFACE-AT ?auto_18740 ?auto_18748 ) ( CLEAR ?auto_18740 ) ( IS-CRATE ?auto_18741 ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( AVAILABLE ?auto_18747 ) ( ON ?auto_18740 ?auto_18742 ) ( not ( = ?auto_18742 ?auto_18740 ) ) ( not ( = ?auto_18742 ?auto_18741 ) ) ( not ( = ?auto_18744 ?auto_18748 ) ) ( HOIST-AT ?auto_18743 ?auto_18744 ) ( not ( = ?auto_18747 ?auto_18743 ) ) ( AVAILABLE ?auto_18743 ) ( SURFACE-AT ?auto_18741 ?auto_18744 ) ( ON ?auto_18741 ?auto_18745 ) ( CLEAR ?auto_18741 ) ( not ( = ?auto_18740 ?auto_18745 ) ) ( not ( = ?auto_18741 ?auto_18745 ) ) ( not ( = ?auto_18742 ?auto_18745 ) ) ( TRUCK-AT ?auto_18746 ?auto_18749 ) ( not ( = ?auto_18749 ?auto_18748 ) ) ( not ( = ?auto_18744 ?auto_18749 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18746 ?auto_18749 ?auto_18748 )
      ( MAKE-1CRATE ?auto_18740 ?auto_18741 )
      ( MAKE-1CRATE-VERIFY ?auto_18740 ?auto_18741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18779 - SURFACE
      ?auto_18780 - SURFACE
      ?auto_18781 - SURFACE
      ?auto_18782 - SURFACE
    )
    :vars
    (
      ?auto_18783 - HOIST
      ?auto_18784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18783 ?auto_18784 ) ( SURFACE-AT ?auto_18781 ?auto_18784 ) ( CLEAR ?auto_18781 ) ( LIFTING ?auto_18783 ?auto_18782 ) ( IS-CRATE ?auto_18782 ) ( not ( = ?auto_18781 ?auto_18782 ) ) ( ON ?auto_18780 ?auto_18779 ) ( ON ?auto_18781 ?auto_18780 ) ( not ( = ?auto_18779 ?auto_18780 ) ) ( not ( = ?auto_18779 ?auto_18781 ) ) ( not ( = ?auto_18779 ?auto_18782 ) ) ( not ( = ?auto_18780 ?auto_18781 ) ) ( not ( = ?auto_18780 ?auto_18782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18781 ?auto_18782 )
      ( MAKE-3CRATE-VERIFY ?auto_18779 ?auto_18780 ?auto_18781 ?auto_18782 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18796 - SURFACE
      ?auto_18797 - SURFACE
      ?auto_18798 - SURFACE
      ?auto_18799 - SURFACE
    )
    :vars
    (
      ?auto_18802 - HOIST
      ?auto_18800 - PLACE
      ?auto_18801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18802 ?auto_18800 ) ( SURFACE-AT ?auto_18798 ?auto_18800 ) ( CLEAR ?auto_18798 ) ( IS-CRATE ?auto_18799 ) ( not ( = ?auto_18798 ?auto_18799 ) ) ( TRUCK-AT ?auto_18801 ?auto_18800 ) ( AVAILABLE ?auto_18802 ) ( IN ?auto_18799 ?auto_18801 ) ( ON ?auto_18798 ?auto_18797 ) ( not ( = ?auto_18797 ?auto_18798 ) ) ( not ( = ?auto_18797 ?auto_18799 ) ) ( ON ?auto_18797 ?auto_18796 ) ( not ( = ?auto_18796 ?auto_18797 ) ) ( not ( = ?auto_18796 ?auto_18798 ) ) ( not ( = ?auto_18796 ?auto_18799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18797 ?auto_18798 ?auto_18799 )
      ( MAKE-3CRATE-VERIFY ?auto_18796 ?auto_18797 ?auto_18798 ?auto_18799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18817 - SURFACE
      ?auto_18818 - SURFACE
      ?auto_18819 - SURFACE
      ?auto_18820 - SURFACE
    )
    :vars
    (
      ?auto_18822 - HOIST
      ?auto_18821 - PLACE
      ?auto_18824 - TRUCK
      ?auto_18823 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18822 ?auto_18821 ) ( SURFACE-AT ?auto_18819 ?auto_18821 ) ( CLEAR ?auto_18819 ) ( IS-CRATE ?auto_18820 ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( AVAILABLE ?auto_18822 ) ( IN ?auto_18820 ?auto_18824 ) ( ON ?auto_18819 ?auto_18818 ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18818 ?auto_18820 ) ) ( TRUCK-AT ?auto_18824 ?auto_18823 ) ( not ( = ?auto_18823 ?auto_18821 ) ) ( ON ?auto_18818 ?auto_18817 ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18818 ?auto_18819 ?auto_18820 )
      ( MAKE-3CRATE-VERIFY ?auto_18817 ?auto_18818 ?auto_18819 ?auto_18820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18841 - SURFACE
      ?auto_18842 - SURFACE
      ?auto_18843 - SURFACE
      ?auto_18844 - SURFACE
    )
    :vars
    (
      ?auto_18846 - HOIST
      ?auto_18845 - PLACE
      ?auto_18849 - TRUCK
      ?auto_18847 - PLACE
      ?auto_18848 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18846 ?auto_18845 ) ( SURFACE-AT ?auto_18843 ?auto_18845 ) ( CLEAR ?auto_18843 ) ( IS-CRATE ?auto_18844 ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( AVAILABLE ?auto_18846 ) ( ON ?auto_18843 ?auto_18842 ) ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( TRUCK-AT ?auto_18849 ?auto_18847 ) ( not ( = ?auto_18847 ?auto_18845 ) ) ( HOIST-AT ?auto_18848 ?auto_18847 ) ( LIFTING ?auto_18848 ?auto_18844 ) ( not ( = ?auto_18846 ?auto_18848 ) ) ( ON ?auto_18842 ?auto_18841 ) ( not ( = ?auto_18841 ?auto_18842 ) ) ( not ( = ?auto_18841 ?auto_18843 ) ) ( not ( = ?auto_18841 ?auto_18844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18842 ?auto_18843 ?auto_18844 )
      ( MAKE-3CRATE-VERIFY ?auto_18841 ?auto_18842 ?auto_18843 ?auto_18844 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18868 - SURFACE
      ?auto_18869 - SURFACE
      ?auto_18870 - SURFACE
      ?auto_18871 - SURFACE
    )
    :vars
    (
      ?auto_18874 - HOIST
      ?auto_18877 - PLACE
      ?auto_18873 - TRUCK
      ?auto_18875 - PLACE
      ?auto_18876 - HOIST
      ?auto_18872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18874 ?auto_18877 ) ( SURFACE-AT ?auto_18870 ?auto_18877 ) ( CLEAR ?auto_18870 ) ( IS-CRATE ?auto_18871 ) ( not ( = ?auto_18870 ?auto_18871 ) ) ( AVAILABLE ?auto_18874 ) ( ON ?auto_18870 ?auto_18869 ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( not ( = ?auto_18869 ?auto_18871 ) ) ( TRUCK-AT ?auto_18873 ?auto_18875 ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( HOIST-AT ?auto_18876 ?auto_18875 ) ( not ( = ?auto_18874 ?auto_18876 ) ) ( AVAILABLE ?auto_18876 ) ( SURFACE-AT ?auto_18871 ?auto_18875 ) ( ON ?auto_18871 ?auto_18872 ) ( CLEAR ?auto_18871 ) ( not ( = ?auto_18870 ?auto_18872 ) ) ( not ( = ?auto_18871 ?auto_18872 ) ) ( not ( = ?auto_18869 ?auto_18872 ) ) ( ON ?auto_18869 ?auto_18868 ) ( not ( = ?auto_18868 ?auto_18869 ) ) ( not ( = ?auto_18868 ?auto_18870 ) ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( not ( = ?auto_18868 ?auto_18872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18869 ?auto_18870 ?auto_18871 )
      ( MAKE-3CRATE-VERIFY ?auto_18868 ?auto_18869 ?auto_18870 ?auto_18871 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18896 - SURFACE
      ?auto_18897 - SURFACE
      ?auto_18898 - SURFACE
      ?auto_18899 - SURFACE
    )
    :vars
    (
      ?auto_18905 - HOIST
      ?auto_18904 - PLACE
      ?auto_18901 - PLACE
      ?auto_18902 - HOIST
      ?auto_18903 - SURFACE
      ?auto_18900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18905 ?auto_18904 ) ( SURFACE-AT ?auto_18898 ?auto_18904 ) ( CLEAR ?auto_18898 ) ( IS-CRATE ?auto_18899 ) ( not ( = ?auto_18898 ?auto_18899 ) ) ( AVAILABLE ?auto_18905 ) ( ON ?auto_18898 ?auto_18897 ) ( not ( = ?auto_18897 ?auto_18898 ) ) ( not ( = ?auto_18897 ?auto_18899 ) ) ( not ( = ?auto_18901 ?auto_18904 ) ) ( HOIST-AT ?auto_18902 ?auto_18901 ) ( not ( = ?auto_18905 ?auto_18902 ) ) ( AVAILABLE ?auto_18902 ) ( SURFACE-AT ?auto_18899 ?auto_18901 ) ( ON ?auto_18899 ?auto_18903 ) ( CLEAR ?auto_18899 ) ( not ( = ?auto_18898 ?auto_18903 ) ) ( not ( = ?auto_18899 ?auto_18903 ) ) ( not ( = ?auto_18897 ?auto_18903 ) ) ( TRUCK-AT ?auto_18900 ?auto_18904 ) ( ON ?auto_18897 ?auto_18896 ) ( not ( = ?auto_18896 ?auto_18897 ) ) ( not ( = ?auto_18896 ?auto_18898 ) ) ( not ( = ?auto_18896 ?auto_18899 ) ) ( not ( = ?auto_18896 ?auto_18903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18897 ?auto_18898 ?auto_18899 )
      ( MAKE-3CRATE-VERIFY ?auto_18896 ?auto_18897 ?auto_18898 ?auto_18899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18924 - SURFACE
      ?auto_18925 - SURFACE
      ?auto_18926 - SURFACE
      ?auto_18927 - SURFACE
    )
    :vars
    (
      ?auto_18930 - HOIST
      ?auto_18928 - PLACE
      ?auto_18931 - PLACE
      ?auto_18932 - HOIST
      ?auto_18929 - SURFACE
      ?auto_18933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18930 ?auto_18928 ) ( IS-CRATE ?auto_18927 ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( not ( = ?auto_18925 ?auto_18926 ) ) ( not ( = ?auto_18925 ?auto_18927 ) ) ( not ( = ?auto_18931 ?auto_18928 ) ) ( HOIST-AT ?auto_18932 ?auto_18931 ) ( not ( = ?auto_18930 ?auto_18932 ) ) ( AVAILABLE ?auto_18932 ) ( SURFACE-AT ?auto_18927 ?auto_18931 ) ( ON ?auto_18927 ?auto_18929 ) ( CLEAR ?auto_18927 ) ( not ( = ?auto_18926 ?auto_18929 ) ) ( not ( = ?auto_18927 ?auto_18929 ) ) ( not ( = ?auto_18925 ?auto_18929 ) ) ( TRUCK-AT ?auto_18933 ?auto_18928 ) ( SURFACE-AT ?auto_18925 ?auto_18928 ) ( CLEAR ?auto_18925 ) ( LIFTING ?auto_18930 ?auto_18926 ) ( IS-CRATE ?auto_18926 ) ( ON ?auto_18925 ?auto_18924 ) ( not ( = ?auto_18924 ?auto_18925 ) ) ( not ( = ?auto_18924 ?auto_18926 ) ) ( not ( = ?auto_18924 ?auto_18927 ) ) ( not ( = ?auto_18924 ?auto_18929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18925 ?auto_18926 ?auto_18927 )
      ( MAKE-3CRATE-VERIFY ?auto_18924 ?auto_18925 ?auto_18926 ?auto_18927 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18952 - SURFACE
      ?auto_18953 - SURFACE
      ?auto_18954 - SURFACE
      ?auto_18955 - SURFACE
    )
    :vars
    (
      ?auto_18960 - HOIST
      ?auto_18958 - PLACE
      ?auto_18957 - PLACE
      ?auto_18961 - HOIST
      ?auto_18959 - SURFACE
      ?auto_18956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18960 ?auto_18958 ) ( IS-CRATE ?auto_18955 ) ( not ( = ?auto_18954 ?auto_18955 ) ) ( not ( = ?auto_18953 ?auto_18954 ) ) ( not ( = ?auto_18953 ?auto_18955 ) ) ( not ( = ?auto_18957 ?auto_18958 ) ) ( HOIST-AT ?auto_18961 ?auto_18957 ) ( not ( = ?auto_18960 ?auto_18961 ) ) ( AVAILABLE ?auto_18961 ) ( SURFACE-AT ?auto_18955 ?auto_18957 ) ( ON ?auto_18955 ?auto_18959 ) ( CLEAR ?auto_18955 ) ( not ( = ?auto_18954 ?auto_18959 ) ) ( not ( = ?auto_18955 ?auto_18959 ) ) ( not ( = ?auto_18953 ?auto_18959 ) ) ( TRUCK-AT ?auto_18956 ?auto_18958 ) ( SURFACE-AT ?auto_18953 ?auto_18958 ) ( CLEAR ?auto_18953 ) ( IS-CRATE ?auto_18954 ) ( AVAILABLE ?auto_18960 ) ( IN ?auto_18954 ?auto_18956 ) ( ON ?auto_18953 ?auto_18952 ) ( not ( = ?auto_18952 ?auto_18953 ) ) ( not ( = ?auto_18952 ?auto_18954 ) ) ( not ( = ?auto_18952 ?auto_18955 ) ) ( not ( = ?auto_18952 ?auto_18959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18953 ?auto_18954 ?auto_18955 )
      ( MAKE-3CRATE-VERIFY ?auto_18952 ?auto_18953 ?auto_18954 ?auto_18955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19137 - SURFACE
      ?auto_19138 - SURFACE
    )
    :vars
    (
      ?auto_19144 - HOIST
      ?auto_19140 - PLACE
      ?auto_19142 - SURFACE
      ?auto_19143 - TRUCK
      ?auto_19145 - PLACE
      ?auto_19141 - HOIST
      ?auto_19139 - SURFACE
      ?auto_19146 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19144 ?auto_19140 ) ( SURFACE-AT ?auto_19137 ?auto_19140 ) ( CLEAR ?auto_19137 ) ( IS-CRATE ?auto_19138 ) ( not ( = ?auto_19137 ?auto_19138 ) ) ( AVAILABLE ?auto_19144 ) ( ON ?auto_19137 ?auto_19142 ) ( not ( = ?auto_19142 ?auto_19137 ) ) ( not ( = ?auto_19142 ?auto_19138 ) ) ( TRUCK-AT ?auto_19143 ?auto_19145 ) ( not ( = ?auto_19145 ?auto_19140 ) ) ( HOIST-AT ?auto_19141 ?auto_19145 ) ( not ( = ?auto_19144 ?auto_19141 ) ) ( SURFACE-AT ?auto_19138 ?auto_19145 ) ( ON ?auto_19138 ?auto_19139 ) ( CLEAR ?auto_19138 ) ( not ( = ?auto_19137 ?auto_19139 ) ) ( not ( = ?auto_19138 ?auto_19139 ) ) ( not ( = ?auto_19142 ?auto_19139 ) ) ( LIFTING ?auto_19141 ?auto_19146 ) ( IS-CRATE ?auto_19146 ) ( not ( = ?auto_19137 ?auto_19146 ) ) ( not ( = ?auto_19138 ?auto_19146 ) ) ( not ( = ?auto_19142 ?auto_19146 ) ) ( not ( = ?auto_19139 ?auto_19146 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19141 ?auto_19146 ?auto_19143 ?auto_19145 )
      ( MAKE-1CRATE ?auto_19137 ?auto_19138 )
      ( MAKE-1CRATE-VERIFY ?auto_19137 ?auto_19138 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19245 - SURFACE
      ?auto_19246 - SURFACE
      ?auto_19247 - SURFACE
      ?auto_19249 - SURFACE
      ?auto_19248 - SURFACE
    )
    :vars
    (
      ?auto_19251 - HOIST
      ?auto_19250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19251 ?auto_19250 ) ( SURFACE-AT ?auto_19249 ?auto_19250 ) ( CLEAR ?auto_19249 ) ( LIFTING ?auto_19251 ?auto_19248 ) ( IS-CRATE ?auto_19248 ) ( not ( = ?auto_19249 ?auto_19248 ) ) ( ON ?auto_19246 ?auto_19245 ) ( ON ?auto_19247 ?auto_19246 ) ( ON ?auto_19249 ?auto_19247 ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19245 ?auto_19247 ) ) ( not ( = ?auto_19245 ?auto_19249 ) ) ( not ( = ?auto_19245 ?auto_19248 ) ) ( not ( = ?auto_19246 ?auto_19247 ) ) ( not ( = ?auto_19246 ?auto_19249 ) ) ( not ( = ?auto_19246 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19249 ) ) ( not ( = ?auto_19247 ?auto_19248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19249 ?auto_19248 )
      ( MAKE-4CRATE-VERIFY ?auto_19245 ?auto_19246 ?auto_19247 ?auto_19249 ?auto_19248 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19270 - SURFACE
      ?auto_19271 - SURFACE
      ?auto_19272 - SURFACE
      ?auto_19274 - SURFACE
      ?auto_19273 - SURFACE
    )
    :vars
    (
      ?auto_19277 - HOIST
      ?auto_19276 - PLACE
      ?auto_19275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19277 ?auto_19276 ) ( SURFACE-AT ?auto_19274 ?auto_19276 ) ( CLEAR ?auto_19274 ) ( IS-CRATE ?auto_19273 ) ( not ( = ?auto_19274 ?auto_19273 ) ) ( TRUCK-AT ?auto_19275 ?auto_19276 ) ( AVAILABLE ?auto_19277 ) ( IN ?auto_19273 ?auto_19275 ) ( ON ?auto_19274 ?auto_19272 ) ( not ( = ?auto_19272 ?auto_19274 ) ) ( not ( = ?auto_19272 ?auto_19273 ) ) ( ON ?auto_19271 ?auto_19270 ) ( ON ?auto_19272 ?auto_19271 ) ( not ( = ?auto_19270 ?auto_19271 ) ) ( not ( = ?auto_19270 ?auto_19272 ) ) ( not ( = ?auto_19270 ?auto_19274 ) ) ( not ( = ?auto_19270 ?auto_19273 ) ) ( not ( = ?auto_19271 ?auto_19272 ) ) ( not ( = ?auto_19271 ?auto_19274 ) ) ( not ( = ?auto_19271 ?auto_19273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19272 ?auto_19274 ?auto_19273 )
      ( MAKE-4CRATE-VERIFY ?auto_19270 ?auto_19271 ?auto_19272 ?auto_19274 ?auto_19273 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19300 - SURFACE
      ?auto_19301 - SURFACE
      ?auto_19302 - SURFACE
      ?auto_19304 - SURFACE
      ?auto_19303 - SURFACE
    )
    :vars
    (
      ?auto_19307 - HOIST
      ?auto_19306 - PLACE
      ?auto_19305 - TRUCK
      ?auto_19308 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19307 ?auto_19306 ) ( SURFACE-AT ?auto_19304 ?auto_19306 ) ( CLEAR ?auto_19304 ) ( IS-CRATE ?auto_19303 ) ( not ( = ?auto_19304 ?auto_19303 ) ) ( AVAILABLE ?auto_19307 ) ( IN ?auto_19303 ?auto_19305 ) ( ON ?auto_19304 ?auto_19302 ) ( not ( = ?auto_19302 ?auto_19304 ) ) ( not ( = ?auto_19302 ?auto_19303 ) ) ( TRUCK-AT ?auto_19305 ?auto_19308 ) ( not ( = ?auto_19308 ?auto_19306 ) ) ( ON ?auto_19301 ?auto_19300 ) ( ON ?auto_19302 ?auto_19301 ) ( not ( = ?auto_19300 ?auto_19301 ) ) ( not ( = ?auto_19300 ?auto_19302 ) ) ( not ( = ?auto_19300 ?auto_19304 ) ) ( not ( = ?auto_19300 ?auto_19303 ) ) ( not ( = ?auto_19301 ?auto_19302 ) ) ( not ( = ?auto_19301 ?auto_19304 ) ) ( not ( = ?auto_19301 ?auto_19303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19302 ?auto_19304 ?auto_19303 )
      ( MAKE-4CRATE-VERIFY ?auto_19300 ?auto_19301 ?auto_19302 ?auto_19304 ?auto_19303 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19334 - SURFACE
      ?auto_19335 - SURFACE
      ?auto_19336 - SURFACE
      ?auto_19338 - SURFACE
      ?auto_19337 - SURFACE
    )
    :vars
    (
      ?auto_19343 - HOIST
      ?auto_19342 - PLACE
      ?auto_19340 - TRUCK
      ?auto_19341 - PLACE
      ?auto_19339 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19343 ?auto_19342 ) ( SURFACE-AT ?auto_19338 ?auto_19342 ) ( CLEAR ?auto_19338 ) ( IS-CRATE ?auto_19337 ) ( not ( = ?auto_19338 ?auto_19337 ) ) ( AVAILABLE ?auto_19343 ) ( ON ?auto_19338 ?auto_19336 ) ( not ( = ?auto_19336 ?auto_19338 ) ) ( not ( = ?auto_19336 ?auto_19337 ) ) ( TRUCK-AT ?auto_19340 ?auto_19341 ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( HOIST-AT ?auto_19339 ?auto_19341 ) ( LIFTING ?auto_19339 ?auto_19337 ) ( not ( = ?auto_19343 ?auto_19339 ) ) ( ON ?auto_19335 ?auto_19334 ) ( ON ?auto_19336 ?auto_19335 ) ( not ( = ?auto_19334 ?auto_19335 ) ) ( not ( = ?auto_19334 ?auto_19336 ) ) ( not ( = ?auto_19334 ?auto_19338 ) ) ( not ( = ?auto_19334 ?auto_19337 ) ) ( not ( = ?auto_19335 ?auto_19336 ) ) ( not ( = ?auto_19335 ?auto_19338 ) ) ( not ( = ?auto_19335 ?auto_19337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19336 ?auto_19338 ?auto_19337 )
      ( MAKE-4CRATE-VERIFY ?auto_19334 ?auto_19335 ?auto_19336 ?auto_19338 ?auto_19337 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19372 - SURFACE
      ?auto_19373 - SURFACE
      ?auto_19374 - SURFACE
      ?auto_19376 - SURFACE
      ?auto_19375 - SURFACE
    )
    :vars
    (
      ?auto_19382 - HOIST
      ?auto_19379 - PLACE
      ?auto_19377 - TRUCK
      ?auto_19381 - PLACE
      ?auto_19380 - HOIST
      ?auto_19378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19382 ?auto_19379 ) ( SURFACE-AT ?auto_19376 ?auto_19379 ) ( CLEAR ?auto_19376 ) ( IS-CRATE ?auto_19375 ) ( not ( = ?auto_19376 ?auto_19375 ) ) ( AVAILABLE ?auto_19382 ) ( ON ?auto_19376 ?auto_19374 ) ( not ( = ?auto_19374 ?auto_19376 ) ) ( not ( = ?auto_19374 ?auto_19375 ) ) ( TRUCK-AT ?auto_19377 ?auto_19381 ) ( not ( = ?auto_19381 ?auto_19379 ) ) ( HOIST-AT ?auto_19380 ?auto_19381 ) ( not ( = ?auto_19382 ?auto_19380 ) ) ( AVAILABLE ?auto_19380 ) ( SURFACE-AT ?auto_19375 ?auto_19381 ) ( ON ?auto_19375 ?auto_19378 ) ( CLEAR ?auto_19375 ) ( not ( = ?auto_19376 ?auto_19378 ) ) ( not ( = ?auto_19375 ?auto_19378 ) ) ( not ( = ?auto_19374 ?auto_19378 ) ) ( ON ?auto_19373 ?auto_19372 ) ( ON ?auto_19374 ?auto_19373 ) ( not ( = ?auto_19372 ?auto_19373 ) ) ( not ( = ?auto_19372 ?auto_19374 ) ) ( not ( = ?auto_19372 ?auto_19376 ) ) ( not ( = ?auto_19372 ?auto_19375 ) ) ( not ( = ?auto_19372 ?auto_19378 ) ) ( not ( = ?auto_19373 ?auto_19374 ) ) ( not ( = ?auto_19373 ?auto_19376 ) ) ( not ( = ?auto_19373 ?auto_19375 ) ) ( not ( = ?auto_19373 ?auto_19378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19374 ?auto_19376 ?auto_19375 )
      ( MAKE-4CRATE-VERIFY ?auto_19372 ?auto_19373 ?auto_19374 ?auto_19376 ?auto_19375 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19411 - SURFACE
      ?auto_19412 - SURFACE
      ?auto_19413 - SURFACE
      ?auto_19415 - SURFACE
      ?auto_19414 - SURFACE
    )
    :vars
    (
      ?auto_19421 - HOIST
      ?auto_19418 - PLACE
      ?auto_19416 - PLACE
      ?auto_19420 - HOIST
      ?auto_19419 - SURFACE
      ?auto_19417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19421 ?auto_19418 ) ( SURFACE-AT ?auto_19415 ?auto_19418 ) ( CLEAR ?auto_19415 ) ( IS-CRATE ?auto_19414 ) ( not ( = ?auto_19415 ?auto_19414 ) ) ( AVAILABLE ?auto_19421 ) ( ON ?auto_19415 ?auto_19413 ) ( not ( = ?auto_19413 ?auto_19415 ) ) ( not ( = ?auto_19413 ?auto_19414 ) ) ( not ( = ?auto_19416 ?auto_19418 ) ) ( HOIST-AT ?auto_19420 ?auto_19416 ) ( not ( = ?auto_19421 ?auto_19420 ) ) ( AVAILABLE ?auto_19420 ) ( SURFACE-AT ?auto_19414 ?auto_19416 ) ( ON ?auto_19414 ?auto_19419 ) ( CLEAR ?auto_19414 ) ( not ( = ?auto_19415 ?auto_19419 ) ) ( not ( = ?auto_19414 ?auto_19419 ) ) ( not ( = ?auto_19413 ?auto_19419 ) ) ( TRUCK-AT ?auto_19417 ?auto_19418 ) ( ON ?auto_19412 ?auto_19411 ) ( ON ?auto_19413 ?auto_19412 ) ( not ( = ?auto_19411 ?auto_19412 ) ) ( not ( = ?auto_19411 ?auto_19413 ) ) ( not ( = ?auto_19411 ?auto_19415 ) ) ( not ( = ?auto_19411 ?auto_19414 ) ) ( not ( = ?auto_19411 ?auto_19419 ) ) ( not ( = ?auto_19412 ?auto_19413 ) ) ( not ( = ?auto_19412 ?auto_19415 ) ) ( not ( = ?auto_19412 ?auto_19414 ) ) ( not ( = ?auto_19412 ?auto_19419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19413 ?auto_19415 ?auto_19414 )
      ( MAKE-4CRATE-VERIFY ?auto_19411 ?auto_19412 ?auto_19413 ?auto_19415 ?auto_19414 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19450 - SURFACE
      ?auto_19451 - SURFACE
      ?auto_19452 - SURFACE
      ?auto_19454 - SURFACE
      ?auto_19453 - SURFACE
    )
    :vars
    (
      ?auto_19458 - HOIST
      ?auto_19456 - PLACE
      ?auto_19460 - PLACE
      ?auto_19457 - HOIST
      ?auto_19455 - SURFACE
      ?auto_19459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19458 ?auto_19456 ) ( IS-CRATE ?auto_19453 ) ( not ( = ?auto_19454 ?auto_19453 ) ) ( not ( = ?auto_19452 ?auto_19454 ) ) ( not ( = ?auto_19452 ?auto_19453 ) ) ( not ( = ?auto_19460 ?auto_19456 ) ) ( HOIST-AT ?auto_19457 ?auto_19460 ) ( not ( = ?auto_19458 ?auto_19457 ) ) ( AVAILABLE ?auto_19457 ) ( SURFACE-AT ?auto_19453 ?auto_19460 ) ( ON ?auto_19453 ?auto_19455 ) ( CLEAR ?auto_19453 ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( not ( = ?auto_19453 ?auto_19455 ) ) ( not ( = ?auto_19452 ?auto_19455 ) ) ( TRUCK-AT ?auto_19459 ?auto_19456 ) ( SURFACE-AT ?auto_19452 ?auto_19456 ) ( CLEAR ?auto_19452 ) ( LIFTING ?auto_19458 ?auto_19454 ) ( IS-CRATE ?auto_19454 ) ( ON ?auto_19451 ?auto_19450 ) ( ON ?auto_19452 ?auto_19451 ) ( not ( = ?auto_19450 ?auto_19451 ) ) ( not ( = ?auto_19450 ?auto_19452 ) ) ( not ( = ?auto_19450 ?auto_19454 ) ) ( not ( = ?auto_19450 ?auto_19453 ) ) ( not ( = ?auto_19450 ?auto_19455 ) ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( not ( = ?auto_19451 ?auto_19454 ) ) ( not ( = ?auto_19451 ?auto_19453 ) ) ( not ( = ?auto_19451 ?auto_19455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19452 ?auto_19454 ?auto_19453 )
      ( MAKE-4CRATE-VERIFY ?auto_19450 ?auto_19451 ?auto_19452 ?auto_19454 ?auto_19453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19489 - SURFACE
      ?auto_19490 - SURFACE
      ?auto_19491 - SURFACE
      ?auto_19493 - SURFACE
      ?auto_19492 - SURFACE
    )
    :vars
    (
      ?auto_19497 - HOIST
      ?auto_19495 - PLACE
      ?auto_19499 - PLACE
      ?auto_19494 - HOIST
      ?auto_19496 - SURFACE
      ?auto_19498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19497 ?auto_19495 ) ( IS-CRATE ?auto_19492 ) ( not ( = ?auto_19493 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19493 ) ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19499 ?auto_19495 ) ) ( HOIST-AT ?auto_19494 ?auto_19499 ) ( not ( = ?auto_19497 ?auto_19494 ) ) ( AVAILABLE ?auto_19494 ) ( SURFACE-AT ?auto_19492 ?auto_19499 ) ( ON ?auto_19492 ?auto_19496 ) ( CLEAR ?auto_19492 ) ( not ( = ?auto_19493 ?auto_19496 ) ) ( not ( = ?auto_19492 ?auto_19496 ) ) ( not ( = ?auto_19491 ?auto_19496 ) ) ( TRUCK-AT ?auto_19498 ?auto_19495 ) ( SURFACE-AT ?auto_19491 ?auto_19495 ) ( CLEAR ?auto_19491 ) ( IS-CRATE ?auto_19493 ) ( AVAILABLE ?auto_19497 ) ( IN ?auto_19493 ?auto_19498 ) ( ON ?auto_19490 ?auto_19489 ) ( ON ?auto_19491 ?auto_19490 ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19491 ) ) ( not ( = ?auto_19489 ?auto_19493 ) ) ( not ( = ?auto_19489 ?auto_19492 ) ) ( not ( = ?auto_19489 ?auto_19496 ) ) ( not ( = ?auto_19490 ?auto_19491 ) ) ( not ( = ?auto_19490 ?auto_19493 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19491 ?auto_19493 ?auto_19492 )
      ( MAKE-4CRATE-VERIFY ?auto_19489 ?auto_19490 ?auto_19491 ?auto_19493 ?auto_19492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19989 - SURFACE
      ?auto_19990 - SURFACE
    )
    :vars
    (
      ?auto_19995 - HOIST
      ?auto_19994 - PLACE
      ?auto_19997 - SURFACE
      ?auto_19993 - PLACE
      ?auto_19996 - HOIST
      ?auto_19991 - SURFACE
      ?auto_19992 - TRUCK
      ?auto_19998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19995 ?auto_19994 ) ( SURFACE-AT ?auto_19989 ?auto_19994 ) ( CLEAR ?auto_19989 ) ( IS-CRATE ?auto_19990 ) ( not ( = ?auto_19989 ?auto_19990 ) ) ( ON ?auto_19989 ?auto_19997 ) ( not ( = ?auto_19997 ?auto_19989 ) ) ( not ( = ?auto_19997 ?auto_19990 ) ) ( not ( = ?auto_19993 ?auto_19994 ) ) ( HOIST-AT ?auto_19996 ?auto_19993 ) ( not ( = ?auto_19995 ?auto_19996 ) ) ( AVAILABLE ?auto_19996 ) ( SURFACE-AT ?auto_19990 ?auto_19993 ) ( ON ?auto_19990 ?auto_19991 ) ( CLEAR ?auto_19990 ) ( not ( = ?auto_19989 ?auto_19991 ) ) ( not ( = ?auto_19990 ?auto_19991 ) ) ( not ( = ?auto_19997 ?auto_19991 ) ) ( TRUCK-AT ?auto_19992 ?auto_19994 ) ( LIFTING ?auto_19995 ?auto_19998 ) ( IS-CRATE ?auto_19998 ) ( not ( = ?auto_19989 ?auto_19998 ) ) ( not ( = ?auto_19990 ?auto_19998 ) ) ( not ( = ?auto_19997 ?auto_19998 ) ) ( not ( = ?auto_19991 ?auto_19998 ) ) )
    :subtasks
    ( ( !LOAD ?auto_19995 ?auto_19998 ?auto_19992 ?auto_19994 )
      ( MAKE-1CRATE ?auto_19989 ?auto_19990 )
      ( MAKE-1CRATE-VERIFY ?auto_19989 ?auto_19990 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20148 - SURFACE
      ?auto_20149 - SURFACE
      ?auto_20150 - SURFACE
      ?auto_20152 - SURFACE
      ?auto_20151 - SURFACE
      ?auto_20153 - SURFACE
    )
    :vars
    (
      ?auto_20155 - HOIST
      ?auto_20154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20155 ?auto_20154 ) ( SURFACE-AT ?auto_20151 ?auto_20154 ) ( CLEAR ?auto_20151 ) ( LIFTING ?auto_20155 ?auto_20153 ) ( IS-CRATE ?auto_20153 ) ( not ( = ?auto_20151 ?auto_20153 ) ) ( ON ?auto_20149 ?auto_20148 ) ( ON ?auto_20150 ?auto_20149 ) ( ON ?auto_20152 ?auto_20150 ) ( ON ?auto_20151 ?auto_20152 ) ( not ( = ?auto_20148 ?auto_20149 ) ) ( not ( = ?auto_20148 ?auto_20150 ) ) ( not ( = ?auto_20148 ?auto_20152 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( not ( = ?auto_20148 ?auto_20153 ) ) ( not ( = ?auto_20149 ?auto_20150 ) ) ( not ( = ?auto_20149 ?auto_20152 ) ) ( not ( = ?auto_20149 ?auto_20151 ) ) ( not ( = ?auto_20149 ?auto_20153 ) ) ( not ( = ?auto_20150 ?auto_20152 ) ) ( not ( = ?auto_20150 ?auto_20151 ) ) ( not ( = ?auto_20150 ?auto_20153 ) ) ( not ( = ?auto_20152 ?auto_20151 ) ) ( not ( = ?auto_20152 ?auto_20153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20151 ?auto_20153 )
      ( MAKE-5CRATE-VERIFY ?auto_20148 ?auto_20149 ?auto_20150 ?auto_20152 ?auto_20151 ?auto_20153 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20182 - SURFACE
      ?auto_20183 - SURFACE
      ?auto_20184 - SURFACE
      ?auto_20186 - SURFACE
      ?auto_20185 - SURFACE
      ?auto_20187 - SURFACE
    )
    :vars
    (
      ?auto_20189 - HOIST
      ?auto_20190 - PLACE
      ?auto_20188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20189 ?auto_20190 ) ( SURFACE-AT ?auto_20185 ?auto_20190 ) ( CLEAR ?auto_20185 ) ( IS-CRATE ?auto_20187 ) ( not ( = ?auto_20185 ?auto_20187 ) ) ( TRUCK-AT ?auto_20188 ?auto_20190 ) ( AVAILABLE ?auto_20189 ) ( IN ?auto_20187 ?auto_20188 ) ( ON ?auto_20185 ?auto_20186 ) ( not ( = ?auto_20186 ?auto_20185 ) ) ( not ( = ?auto_20186 ?auto_20187 ) ) ( ON ?auto_20183 ?auto_20182 ) ( ON ?auto_20184 ?auto_20183 ) ( ON ?auto_20186 ?auto_20184 ) ( not ( = ?auto_20182 ?auto_20183 ) ) ( not ( = ?auto_20182 ?auto_20184 ) ) ( not ( = ?auto_20182 ?auto_20186 ) ) ( not ( = ?auto_20182 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20187 ) ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20183 ?auto_20187 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( not ( = ?auto_20184 ?auto_20185 ) ) ( not ( = ?auto_20184 ?auto_20187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20186 ?auto_20185 ?auto_20187 )
      ( MAKE-5CRATE-VERIFY ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20186 ?auto_20185 ?auto_20187 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20222 - SURFACE
      ?auto_20223 - SURFACE
      ?auto_20224 - SURFACE
      ?auto_20226 - SURFACE
      ?auto_20225 - SURFACE
      ?auto_20227 - SURFACE
    )
    :vars
    (
      ?auto_20231 - HOIST
      ?auto_20230 - PLACE
      ?auto_20229 - TRUCK
      ?auto_20228 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20231 ?auto_20230 ) ( SURFACE-AT ?auto_20225 ?auto_20230 ) ( CLEAR ?auto_20225 ) ( IS-CRATE ?auto_20227 ) ( not ( = ?auto_20225 ?auto_20227 ) ) ( AVAILABLE ?auto_20231 ) ( IN ?auto_20227 ?auto_20229 ) ( ON ?auto_20225 ?auto_20226 ) ( not ( = ?auto_20226 ?auto_20225 ) ) ( not ( = ?auto_20226 ?auto_20227 ) ) ( TRUCK-AT ?auto_20229 ?auto_20228 ) ( not ( = ?auto_20228 ?auto_20230 ) ) ( ON ?auto_20223 ?auto_20222 ) ( ON ?auto_20224 ?auto_20223 ) ( ON ?auto_20226 ?auto_20224 ) ( not ( = ?auto_20222 ?auto_20223 ) ) ( not ( = ?auto_20222 ?auto_20224 ) ) ( not ( = ?auto_20222 ?auto_20226 ) ) ( not ( = ?auto_20222 ?auto_20225 ) ) ( not ( = ?auto_20222 ?auto_20227 ) ) ( not ( = ?auto_20223 ?auto_20224 ) ) ( not ( = ?auto_20223 ?auto_20226 ) ) ( not ( = ?auto_20223 ?auto_20225 ) ) ( not ( = ?auto_20223 ?auto_20227 ) ) ( not ( = ?auto_20224 ?auto_20226 ) ) ( not ( = ?auto_20224 ?auto_20225 ) ) ( not ( = ?auto_20224 ?auto_20227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20226 ?auto_20225 ?auto_20227 )
      ( MAKE-5CRATE-VERIFY ?auto_20222 ?auto_20223 ?auto_20224 ?auto_20226 ?auto_20225 ?auto_20227 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20267 - SURFACE
      ?auto_20268 - SURFACE
      ?auto_20269 - SURFACE
      ?auto_20271 - SURFACE
      ?auto_20270 - SURFACE
      ?auto_20272 - SURFACE
    )
    :vars
    (
      ?auto_20277 - HOIST
      ?auto_20276 - PLACE
      ?auto_20275 - TRUCK
      ?auto_20274 - PLACE
      ?auto_20273 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20277 ?auto_20276 ) ( SURFACE-AT ?auto_20270 ?auto_20276 ) ( CLEAR ?auto_20270 ) ( IS-CRATE ?auto_20272 ) ( not ( = ?auto_20270 ?auto_20272 ) ) ( AVAILABLE ?auto_20277 ) ( ON ?auto_20270 ?auto_20271 ) ( not ( = ?auto_20271 ?auto_20270 ) ) ( not ( = ?auto_20271 ?auto_20272 ) ) ( TRUCK-AT ?auto_20275 ?auto_20274 ) ( not ( = ?auto_20274 ?auto_20276 ) ) ( HOIST-AT ?auto_20273 ?auto_20274 ) ( LIFTING ?auto_20273 ?auto_20272 ) ( not ( = ?auto_20277 ?auto_20273 ) ) ( ON ?auto_20268 ?auto_20267 ) ( ON ?auto_20269 ?auto_20268 ) ( ON ?auto_20271 ?auto_20269 ) ( not ( = ?auto_20267 ?auto_20268 ) ) ( not ( = ?auto_20267 ?auto_20269 ) ) ( not ( = ?auto_20267 ?auto_20271 ) ) ( not ( = ?auto_20267 ?auto_20270 ) ) ( not ( = ?auto_20267 ?auto_20272 ) ) ( not ( = ?auto_20268 ?auto_20269 ) ) ( not ( = ?auto_20268 ?auto_20271 ) ) ( not ( = ?auto_20268 ?auto_20270 ) ) ( not ( = ?auto_20268 ?auto_20272 ) ) ( not ( = ?auto_20269 ?auto_20271 ) ) ( not ( = ?auto_20269 ?auto_20270 ) ) ( not ( = ?auto_20269 ?auto_20272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20271 ?auto_20270 ?auto_20272 )
      ( MAKE-5CRATE-VERIFY ?auto_20267 ?auto_20268 ?auto_20269 ?auto_20271 ?auto_20270 ?auto_20272 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20317 - SURFACE
      ?auto_20318 - SURFACE
      ?auto_20319 - SURFACE
      ?auto_20321 - SURFACE
      ?auto_20320 - SURFACE
      ?auto_20322 - SURFACE
    )
    :vars
    (
      ?auto_20327 - HOIST
      ?auto_20325 - PLACE
      ?auto_20323 - TRUCK
      ?auto_20328 - PLACE
      ?auto_20326 - HOIST
      ?auto_20324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20327 ?auto_20325 ) ( SURFACE-AT ?auto_20320 ?auto_20325 ) ( CLEAR ?auto_20320 ) ( IS-CRATE ?auto_20322 ) ( not ( = ?auto_20320 ?auto_20322 ) ) ( AVAILABLE ?auto_20327 ) ( ON ?auto_20320 ?auto_20321 ) ( not ( = ?auto_20321 ?auto_20320 ) ) ( not ( = ?auto_20321 ?auto_20322 ) ) ( TRUCK-AT ?auto_20323 ?auto_20328 ) ( not ( = ?auto_20328 ?auto_20325 ) ) ( HOIST-AT ?auto_20326 ?auto_20328 ) ( not ( = ?auto_20327 ?auto_20326 ) ) ( AVAILABLE ?auto_20326 ) ( SURFACE-AT ?auto_20322 ?auto_20328 ) ( ON ?auto_20322 ?auto_20324 ) ( CLEAR ?auto_20322 ) ( not ( = ?auto_20320 ?auto_20324 ) ) ( not ( = ?auto_20322 ?auto_20324 ) ) ( not ( = ?auto_20321 ?auto_20324 ) ) ( ON ?auto_20318 ?auto_20317 ) ( ON ?auto_20319 ?auto_20318 ) ( ON ?auto_20321 ?auto_20319 ) ( not ( = ?auto_20317 ?auto_20318 ) ) ( not ( = ?auto_20317 ?auto_20319 ) ) ( not ( = ?auto_20317 ?auto_20321 ) ) ( not ( = ?auto_20317 ?auto_20320 ) ) ( not ( = ?auto_20317 ?auto_20322 ) ) ( not ( = ?auto_20317 ?auto_20324 ) ) ( not ( = ?auto_20318 ?auto_20319 ) ) ( not ( = ?auto_20318 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20320 ) ) ( not ( = ?auto_20318 ?auto_20322 ) ) ( not ( = ?auto_20318 ?auto_20324 ) ) ( not ( = ?auto_20319 ?auto_20321 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20322 ) ) ( not ( = ?auto_20319 ?auto_20324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20321 ?auto_20320 ?auto_20322 )
      ( MAKE-5CRATE-VERIFY ?auto_20317 ?auto_20318 ?auto_20319 ?auto_20321 ?auto_20320 ?auto_20322 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20368 - SURFACE
      ?auto_20369 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20372 - SURFACE
      ?auto_20371 - SURFACE
      ?auto_20373 - SURFACE
    )
    :vars
    (
      ?auto_20378 - HOIST
      ?auto_20374 - PLACE
      ?auto_20376 - PLACE
      ?auto_20377 - HOIST
      ?auto_20375 - SURFACE
      ?auto_20379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20378 ?auto_20374 ) ( SURFACE-AT ?auto_20371 ?auto_20374 ) ( CLEAR ?auto_20371 ) ( IS-CRATE ?auto_20373 ) ( not ( = ?auto_20371 ?auto_20373 ) ) ( AVAILABLE ?auto_20378 ) ( ON ?auto_20371 ?auto_20372 ) ( not ( = ?auto_20372 ?auto_20371 ) ) ( not ( = ?auto_20372 ?auto_20373 ) ) ( not ( = ?auto_20376 ?auto_20374 ) ) ( HOIST-AT ?auto_20377 ?auto_20376 ) ( not ( = ?auto_20378 ?auto_20377 ) ) ( AVAILABLE ?auto_20377 ) ( SURFACE-AT ?auto_20373 ?auto_20376 ) ( ON ?auto_20373 ?auto_20375 ) ( CLEAR ?auto_20373 ) ( not ( = ?auto_20371 ?auto_20375 ) ) ( not ( = ?auto_20373 ?auto_20375 ) ) ( not ( = ?auto_20372 ?auto_20375 ) ) ( TRUCK-AT ?auto_20379 ?auto_20374 ) ( ON ?auto_20369 ?auto_20368 ) ( ON ?auto_20370 ?auto_20369 ) ( ON ?auto_20372 ?auto_20370 ) ( not ( = ?auto_20368 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( not ( = ?auto_20368 ?auto_20372 ) ) ( not ( = ?auto_20368 ?auto_20371 ) ) ( not ( = ?auto_20368 ?auto_20373 ) ) ( not ( = ?auto_20368 ?auto_20375 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20372 ) ) ( not ( = ?auto_20369 ?auto_20371 ) ) ( not ( = ?auto_20369 ?auto_20373 ) ) ( not ( = ?auto_20369 ?auto_20375 ) ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20370 ?auto_20371 ) ) ( not ( = ?auto_20370 ?auto_20373 ) ) ( not ( = ?auto_20370 ?auto_20375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20372 ?auto_20371 ?auto_20373 )
      ( MAKE-5CRATE-VERIFY ?auto_20368 ?auto_20369 ?auto_20370 ?auto_20372 ?auto_20371 ?auto_20373 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20419 - SURFACE
      ?auto_20420 - SURFACE
      ?auto_20421 - SURFACE
      ?auto_20423 - SURFACE
      ?auto_20422 - SURFACE
      ?auto_20424 - SURFACE
    )
    :vars
    (
      ?auto_20427 - HOIST
      ?auto_20430 - PLACE
      ?auto_20426 - PLACE
      ?auto_20425 - HOIST
      ?auto_20429 - SURFACE
      ?auto_20428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20427 ?auto_20430 ) ( IS-CRATE ?auto_20424 ) ( not ( = ?auto_20422 ?auto_20424 ) ) ( not ( = ?auto_20423 ?auto_20422 ) ) ( not ( = ?auto_20423 ?auto_20424 ) ) ( not ( = ?auto_20426 ?auto_20430 ) ) ( HOIST-AT ?auto_20425 ?auto_20426 ) ( not ( = ?auto_20427 ?auto_20425 ) ) ( AVAILABLE ?auto_20425 ) ( SURFACE-AT ?auto_20424 ?auto_20426 ) ( ON ?auto_20424 ?auto_20429 ) ( CLEAR ?auto_20424 ) ( not ( = ?auto_20422 ?auto_20429 ) ) ( not ( = ?auto_20424 ?auto_20429 ) ) ( not ( = ?auto_20423 ?auto_20429 ) ) ( TRUCK-AT ?auto_20428 ?auto_20430 ) ( SURFACE-AT ?auto_20423 ?auto_20430 ) ( CLEAR ?auto_20423 ) ( LIFTING ?auto_20427 ?auto_20422 ) ( IS-CRATE ?auto_20422 ) ( ON ?auto_20420 ?auto_20419 ) ( ON ?auto_20421 ?auto_20420 ) ( ON ?auto_20423 ?auto_20421 ) ( not ( = ?auto_20419 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20421 ) ) ( not ( = ?auto_20419 ?auto_20423 ) ) ( not ( = ?auto_20419 ?auto_20422 ) ) ( not ( = ?auto_20419 ?auto_20424 ) ) ( not ( = ?auto_20419 ?auto_20429 ) ) ( not ( = ?auto_20420 ?auto_20421 ) ) ( not ( = ?auto_20420 ?auto_20423 ) ) ( not ( = ?auto_20420 ?auto_20422 ) ) ( not ( = ?auto_20420 ?auto_20424 ) ) ( not ( = ?auto_20420 ?auto_20429 ) ) ( not ( = ?auto_20421 ?auto_20423 ) ) ( not ( = ?auto_20421 ?auto_20422 ) ) ( not ( = ?auto_20421 ?auto_20424 ) ) ( not ( = ?auto_20421 ?auto_20429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20423 ?auto_20422 ?auto_20424 )
      ( MAKE-5CRATE-VERIFY ?auto_20419 ?auto_20420 ?auto_20421 ?auto_20423 ?auto_20422 ?auto_20424 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20470 - SURFACE
      ?auto_20471 - SURFACE
      ?auto_20472 - SURFACE
      ?auto_20474 - SURFACE
      ?auto_20473 - SURFACE
      ?auto_20475 - SURFACE
    )
    :vars
    (
      ?auto_20476 - HOIST
      ?auto_20481 - PLACE
      ?auto_20479 - PLACE
      ?auto_20477 - HOIST
      ?auto_20478 - SURFACE
      ?auto_20480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20476 ?auto_20481 ) ( IS-CRATE ?auto_20475 ) ( not ( = ?auto_20473 ?auto_20475 ) ) ( not ( = ?auto_20474 ?auto_20473 ) ) ( not ( = ?auto_20474 ?auto_20475 ) ) ( not ( = ?auto_20479 ?auto_20481 ) ) ( HOIST-AT ?auto_20477 ?auto_20479 ) ( not ( = ?auto_20476 ?auto_20477 ) ) ( AVAILABLE ?auto_20477 ) ( SURFACE-AT ?auto_20475 ?auto_20479 ) ( ON ?auto_20475 ?auto_20478 ) ( CLEAR ?auto_20475 ) ( not ( = ?auto_20473 ?auto_20478 ) ) ( not ( = ?auto_20475 ?auto_20478 ) ) ( not ( = ?auto_20474 ?auto_20478 ) ) ( TRUCK-AT ?auto_20480 ?auto_20481 ) ( SURFACE-AT ?auto_20474 ?auto_20481 ) ( CLEAR ?auto_20474 ) ( IS-CRATE ?auto_20473 ) ( AVAILABLE ?auto_20476 ) ( IN ?auto_20473 ?auto_20480 ) ( ON ?auto_20471 ?auto_20470 ) ( ON ?auto_20472 ?auto_20471 ) ( ON ?auto_20474 ?auto_20472 ) ( not ( = ?auto_20470 ?auto_20471 ) ) ( not ( = ?auto_20470 ?auto_20472 ) ) ( not ( = ?auto_20470 ?auto_20474 ) ) ( not ( = ?auto_20470 ?auto_20473 ) ) ( not ( = ?auto_20470 ?auto_20475 ) ) ( not ( = ?auto_20470 ?auto_20478 ) ) ( not ( = ?auto_20471 ?auto_20472 ) ) ( not ( = ?auto_20471 ?auto_20474 ) ) ( not ( = ?auto_20471 ?auto_20473 ) ) ( not ( = ?auto_20471 ?auto_20475 ) ) ( not ( = ?auto_20471 ?auto_20478 ) ) ( not ( = ?auto_20472 ?auto_20474 ) ) ( not ( = ?auto_20472 ?auto_20473 ) ) ( not ( = ?auto_20472 ?auto_20475 ) ) ( not ( = ?auto_20472 ?auto_20478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20474 ?auto_20473 ?auto_20475 )
      ( MAKE-5CRATE-VERIFY ?auto_20470 ?auto_20471 ?auto_20472 ?auto_20474 ?auto_20473 ?auto_20475 ) )
  )

)

