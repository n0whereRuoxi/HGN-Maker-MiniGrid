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
      ?auto_32524 - SURFACE
      ?auto_32525 - SURFACE
    )
    :vars
    (
      ?auto_32526 - HOIST
      ?auto_32527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32526 ?auto_32527 ) ( SURFACE-AT ?auto_32524 ?auto_32527 ) ( CLEAR ?auto_32524 ) ( LIFTING ?auto_32526 ?auto_32525 ) ( IS-CRATE ?auto_32525 ) ( not ( = ?auto_32524 ?auto_32525 ) ) )
    :subtasks
    ( ( !DROP ?auto_32526 ?auto_32525 ?auto_32524 ?auto_32527 )
      ( MAKE-1CRATE-VERIFY ?auto_32524 ?auto_32525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32528 - SURFACE
      ?auto_32529 - SURFACE
    )
    :vars
    (
      ?auto_32530 - HOIST
      ?auto_32531 - PLACE
      ?auto_32532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32530 ?auto_32531 ) ( SURFACE-AT ?auto_32528 ?auto_32531 ) ( CLEAR ?auto_32528 ) ( IS-CRATE ?auto_32529 ) ( not ( = ?auto_32528 ?auto_32529 ) ) ( TRUCK-AT ?auto_32532 ?auto_32531 ) ( AVAILABLE ?auto_32530 ) ( IN ?auto_32529 ?auto_32532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32530 ?auto_32529 ?auto_32532 ?auto_32531 )
      ( MAKE-1CRATE ?auto_32528 ?auto_32529 )
      ( MAKE-1CRATE-VERIFY ?auto_32528 ?auto_32529 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32533 - SURFACE
      ?auto_32534 - SURFACE
    )
    :vars
    (
      ?auto_32535 - HOIST
      ?auto_32536 - PLACE
      ?auto_32537 - TRUCK
      ?auto_32538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32535 ?auto_32536 ) ( SURFACE-AT ?auto_32533 ?auto_32536 ) ( CLEAR ?auto_32533 ) ( IS-CRATE ?auto_32534 ) ( not ( = ?auto_32533 ?auto_32534 ) ) ( AVAILABLE ?auto_32535 ) ( IN ?auto_32534 ?auto_32537 ) ( TRUCK-AT ?auto_32537 ?auto_32538 ) ( not ( = ?auto_32538 ?auto_32536 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32537 ?auto_32538 ?auto_32536 )
      ( MAKE-1CRATE ?auto_32533 ?auto_32534 )
      ( MAKE-1CRATE-VERIFY ?auto_32533 ?auto_32534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32539 - SURFACE
      ?auto_32540 - SURFACE
    )
    :vars
    (
      ?auto_32544 - HOIST
      ?auto_32541 - PLACE
      ?auto_32542 - TRUCK
      ?auto_32543 - PLACE
      ?auto_32545 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32544 ?auto_32541 ) ( SURFACE-AT ?auto_32539 ?auto_32541 ) ( CLEAR ?auto_32539 ) ( IS-CRATE ?auto_32540 ) ( not ( = ?auto_32539 ?auto_32540 ) ) ( AVAILABLE ?auto_32544 ) ( TRUCK-AT ?auto_32542 ?auto_32543 ) ( not ( = ?auto_32543 ?auto_32541 ) ) ( HOIST-AT ?auto_32545 ?auto_32543 ) ( LIFTING ?auto_32545 ?auto_32540 ) ( not ( = ?auto_32544 ?auto_32545 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32545 ?auto_32540 ?auto_32542 ?auto_32543 )
      ( MAKE-1CRATE ?auto_32539 ?auto_32540 )
      ( MAKE-1CRATE-VERIFY ?auto_32539 ?auto_32540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32546 - SURFACE
      ?auto_32547 - SURFACE
    )
    :vars
    (
      ?auto_32550 - HOIST
      ?auto_32552 - PLACE
      ?auto_32548 - TRUCK
      ?auto_32551 - PLACE
      ?auto_32549 - HOIST
      ?auto_32553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32550 ?auto_32552 ) ( SURFACE-AT ?auto_32546 ?auto_32552 ) ( CLEAR ?auto_32546 ) ( IS-CRATE ?auto_32547 ) ( not ( = ?auto_32546 ?auto_32547 ) ) ( AVAILABLE ?auto_32550 ) ( TRUCK-AT ?auto_32548 ?auto_32551 ) ( not ( = ?auto_32551 ?auto_32552 ) ) ( HOIST-AT ?auto_32549 ?auto_32551 ) ( not ( = ?auto_32550 ?auto_32549 ) ) ( AVAILABLE ?auto_32549 ) ( SURFACE-AT ?auto_32547 ?auto_32551 ) ( ON ?auto_32547 ?auto_32553 ) ( CLEAR ?auto_32547 ) ( not ( = ?auto_32546 ?auto_32553 ) ) ( not ( = ?auto_32547 ?auto_32553 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32549 ?auto_32547 ?auto_32553 ?auto_32551 )
      ( MAKE-1CRATE ?auto_32546 ?auto_32547 )
      ( MAKE-1CRATE-VERIFY ?auto_32546 ?auto_32547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32554 - SURFACE
      ?auto_32555 - SURFACE
    )
    :vars
    (
      ?auto_32557 - HOIST
      ?auto_32561 - PLACE
      ?auto_32558 - PLACE
      ?auto_32556 - HOIST
      ?auto_32560 - SURFACE
      ?auto_32559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32557 ?auto_32561 ) ( SURFACE-AT ?auto_32554 ?auto_32561 ) ( CLEAR ?auto_32554 ) ( IS-CRATE ?auto_32555 ) ( not ( = ?auto_32554 ?auto_32555 ) ) ( AVAILABLE ?auto_32557 ) ( not ( = ?auto_32558 ?auto_32561 ) ) ( HOIST-AT ?auto_32556 ?auto_32558 ) ( not ( = ?auto_32557 ?auto_32556 ) ) ( AVAILABLE ?auto_32556 ) ( SURFACE-AT ?auto_32555 ?auto_32558 ) ( ON ?auto_32555 ?auto_32560 ) ( CLEAR ?auto_32555 ) ( not ( = ?auto_32554 ?auto_32560 ) ) ( not ( = ?auto_32555 ?auto_32560 ) ) ( TRUCK-AT ?auto_32559 ?auto_32561 ) )
    :subtasks
    ( ( !DRIVE ?auto_32559 ?auto_32561 ?auto_32558 )
      ( MAKE-1CRATE ?auto_32554 ?auto_32555 )
      ( MAKE-1CRATE-VERIFY ?auto_32554 ?auto_32555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32567 - SURFACE
      ?auto_32568 - SURFACE
    )
    :vars
    (
      ?auto_32569 - HOIST
      ?auto_32570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32569 ?auto_32570 ) ( SURFACE-AT ?auto_32567 ?auto_32570 ) ( CLEAR ?auto_32567 ) ( LIFTING ?auto_32569 ?auto_32568 ) ( IS-CRATE ?auto_32568 ) ( not ( = ?auto_32567 ?auto_32568 ) ) )
    :subtasks
    ( ( !DROP ?auto_32569 ?auto_32568 ?auto_32567 ?auto_32570 )
      ( MAKE-1CRATE-VERIFY ?auto_32567 ?auto_32568 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32571 - SURFACE
      ?auto_32572 - SURFACE
      ?auto_32573 - SURFACE
    )
    :vars
    (
      ?auto_32574 - HOIST
      ?auto_32575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32574 ?auto_32575 ) ( SURFACE-AT ?auto_32572 ?auto_32575 ) ( CLEAR ?auto_32572 ) ( LIFTING ?auto_32574 ?auto_32573 ) ( IS-CRATE ?auto_32573 ) ( not ( = ?auto_32572 ?auto_32573 ) ) ( ON ?auto_32572 ?auto_32571 ) ( not ( = ?auto_32571 ?auto_32572 ) ) ( not ( = ?auto_32571 ?auto_32573 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32572 ?auto_32573 )
      ( MAKE-2CRATE-VERIFY ?auto_32571 ?auto_32572 ?auto_32573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32576 - SURFACE
      ?auto_32577 - SURFACE
    )
    :vars
    (
      ?auto_32578 - HOIST
      ?auto_32579 - PLACE
      ?auto_32580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32578 ?auto_32579 ) ( SURFACE-AT ?auto_32576 ?auto_32579 ) ( CLEAR ?auto_32576 ) ( IS-CRATE ?auto_32577 ) ( not ( = ?auto_32576 ?auto_32577 ) ) ( TRUCK-AT ?auto_32580 ?auto_32579 ) ( AVAILABLE ?auto_32578 ) ( IN ?auto_32577 ?auto_32580 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32578 ?auto_32577 ?auto_32580 ?auto_32579 )
      ( MAKE-1CRATE ?auto_32576 ?auto_32577 )
      ( MAKE-1CRATE-VERIFY ?auto_32576 ?auto_32577 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32581 - SURFACE
      ?auto_32582 - SURFACE
      ?auto_32583 - SURFACE
    )
    :vars
    (
      ?auto_32585 - HOIST
      ?auto_32584 - PLACE
      ?auto_32586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32585 ?auto_32584 ) ( SURFACE-AT ?auto_32582 ?auto_32584 ) ( CLEAR ?auto_32582 ) ( IS-CRATE ?auto_32583 ) ( not ( = ?auto_32582 ?auto_32583 ) ) ( TRUCK-AT ?auto_32586 ?auto_32584 ) ( AVAILABLE ?auto_32585 ) ( IN ?auto_32583 ?auto_32586 ) ( ON ?auto_32582 ?auto_32581 ) ( not ( = ?auto_32581 ?auto_32582 ) ) ( not ( = ?auto_32581 ?auto_32583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32582 ?auto_32583 )
      ( MAKE-2CRATE-VERIFY ?auto_32581 ?auto_32582 ?auto_32583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32587 - SURFACE
      ?auto_32588 - SURFACE
    )
    :vars
    (
      ?auto_32591 - HOIST
      ?auto_32589 - PLACE
      ?auto_32592 - TRUCK
      ?auto_32590 - SURFACE
      ?auto_32593 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32591 ?auto_32589 ) ( SURFACE-AT ?auto_32587 ?auto_32589 ) ( CLEAR ?auto_32587 ) ( IS-CRATE ?auto_32588 ) ( not ( = ?auto_32587 ?auto_32588 ) ) ( AVAILABLE ?auto_32591 ) ( IN ?auto_32588 ?auto_32592 ) ( ON ?auto_32587 ?auto_32590 ) ( not ( = ?auto_32590 ?auto_32587 ) ) ( not ( = ?auto_32590 ?auto_32588 ) ) ( TRUCK-AT ?auto_32592 ?auto_32593 ) ( not ( = ?auto_32593 ?auto_32589 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32592 ?auto_32593 ?auto_32589 )
      ( MAKE-2CRATE ?auto_32590 ?auto_32587 ?auto_32588 )
      ( MAKE-1CRATE-VERIFY ?auto_32587 ?auto_32588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32594 - SURFACE
      ?auto_32595 - SURFACE
      ?auto_32596 - SURFACE
    )
    :vars
    (
      ?auto_32598 - HOIST
      ?auto_32600 - PLACE
      ?auto_32597 - TRUCK
      ?auto_32599 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32598 ?auto_32600 ) ( SURFACE-AT ?auto_32595 ?auto_32600 ) ( CLEAR ?auto_32595 ) ( IS-CRATE ?auto_32596 ) ( not ( = ?auto_32595 ?auto_32596 ) ) ( AVAILABLE ?auto_32598 ) ( IN ?auto_32596 ?auto_32597 ) ( ON ?auto_32595 ?auto_32594 ) ( not ( = ?auto_32594 ?auto_32595 ) ) ( not ( = ?auto_32594 ?auto_32596 ) ) ( TRUCK-AT ?auto_32597 ?auto_32599 ) ( not ( = ?auto_32599 ?auto_32600 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32595 ?auto_32596 )
      ( MAKE-2CRATE-VERIFY ?auto_32594 ?auto_32595 ?auto_32596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32601 - SURFACE
      ?auto_32602 - SURFACE
    )
    :vars
    (
      ?auto_32606 - HOIST
      ?auto_32604 - PLACE
      ?auto_32603 - SURFACE
      ?auto_32607 - TRUCK
      ?auto_32605 - PLACE
      ?auto_32608 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32606 ?auto_32604 ) ( SURFACE-AT ?auto_32601 ?auto_32604 ) ( CLEAR ?auto_32601 ) ( IS-CRATE ?auto_32602 ) ( not ( = ?auto_32601 ?auto_32602 ) ) ( AVAILABLE ?auto_32606 ) ( ON ?auto_32601 ?auto_32603 ) ( not ( = ?auto_32603 ?auto_32601 ) ) ( not ( = ?auto_32603 ?auto_32602 ) ) ( TRUCK-AT ?auto_32607 ?auto_32605 ) ( not ( = ?auto_32605 ?auto_32604 ) ) ( HOIST-AT ?auto_32608 ?auto_32605 ) ( LIFTING ?auto_32608 ?auto_32602 ) ( not ( = ?auto_32606 ?auto_32608 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32608 ?auto_32602 ?auto_32607 ?auto_32605 )
      ( MAKE-2CRATE ?auto_32603 ?auto_32601 ?auto_32602 )
      ( MAKE-1CRATE-VERIFY ?auto_32601 ?auto_32602 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32609 - SURFACE
      ?auto_32610 - SURFACE
      ?auto_32611 - SURFACE
    )
    :vars
    (
      ?auto_32614 - HOIST
      ?auto_32613 - PLACE
      ?auto_32616 - TRUCK
      ?auto_32612 - PLACE
      ?auto_32615 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32614 ?auto_32613 ) ( SURFACE-AT ?auto_32610 ?auto_32613 ) ( CLEAR ?auto_32610 ) ( IS-CRATE ?auto_32611 ) ( not ( = ?auto_32610 ?auto_32611 ) ) ( AVAILABLE ?auto_32614 ) ( ON ?auto_32610 ?auto_32609 ) ( not ( = ?auto_32609 ?auto_32610 ) ) ( not ( = ?auto_32609 ?auto_32611 ) ) ( TRUCK-AT ?auto_32616 ?auto_32612 ) ( not ( = ?auto_32612 ?auto_32613 ) ) ( HOIST-AT ?auto_32615 ?auto_32612 ) ( LIFTING ?auto_32615 ?auto_32611 ) ( not ( = ?auto_32614 ?auto_32615 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32610 ?auto_32611 )
      ( MAKE-2CRATE-VERIFY ?auto_32609 ?auto_32610 ?auto_32611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32617 - SURFACE
      ?auto_32618 - SURFACE
    )
    :vars
    (
      ?auto_32624 - HOIST
      ?auto_32622 - PLACE
      ?auto_32619 - SURFACE
      ?auto_32620 - TRUCK
      ?auto_32623 - PLACE
      ?auto_32621 - HOIST
      ?auto_32625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32624 ?auto_32622 ) ( SURFACE-AT ?auto_32617 ?auto_32622 ) ( CLEAR ?auto_32617 ) ( IS-CRATE ?auto_32618 ) ( not ( = ?auto_32617 ?auto_32618 ) ) ( AVAILABLE ?auto_32624 ) ( ON ?auto_32617 ?auto_32619 ) ( not ( = ?auto_32619 ?auto_32617 ) ) ( not ( = ?auto_32619 ?auto_32618 ) ) ( TRUCK-AT ?auto_32620 ?auto_32623 ) ( not ( = ?auto_32623 ?auto_32622 ) ) ( HOIST-AT ?auto_32621 ?auto_32623 ) ( not ( = ?auto_32624 ?auto_32621 ) ) ( AVAILABLE ?auto_32621 ) ( SURFACE-AT ?auto_32618 ?auto_32623 ) ( ON ?auto_32618 ?auto_32625 ) ( CLEAR ?auto_32618 ) ( not ( = ?auto_32617 ?auto_32625 ) ) ( not ( = ?auto_32618 ?auto_32625 ) ) ( not ( = ?auto_32619 ?auto_32625 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32621 ?auto_32618 ?auto_32625 ?auto_32623 )
      ( MAKE-2CRATE ?auto_32619 ?auto_32617 ?auto_32618 )
      ( MAKE-1CRATE-VERIFY ?auto_32617 ?auto_32618 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32626 - SURFACE
      ?auto_32627 - SURFACE
      ?auto_32628 - SURFACE
    )
    :vars
    (
      ?auto_32629 - HOIST
      ?auto_32632 - PLACE
      ?auto_32631 - TRUCK
      ?auto_32633 - PLACE
      ?auto_32634 - HOIST
      ?auto_32630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32629 ?auto_32632 ) ( SURFACE-AT ?auto_32627 ?auto_32632 ) ( CLEAR ?auto_32627 ) ( IS-CRATE ?auto_32628 ) ( not ( = ?auto_32627 ?auto_32628 ) ) ( AVAILABLE ?auto_32629 ) ( ON ?auto_32627 ?auto_32626 ) ( not ( = ?auto_32626 ?auto_32627 ) ) ( not ( = ?auto_32626 ?auto_32628 ) ) ( TRUCK-AT ?auto_32631 ?auto_32633 ) ( not ( = ?auto_32633 ?auto_32632 ) ) ( HOIST-AT ?auto_32634 ?auto_32633 ) ( not ( = ?auto_32629 ?auto_32634 ) ) ( AVAILABLE ?auto_32634 ) ( SURFACE-AT ?auto_32628 ?auto_32633 ) ( ON ?auto_32628 ?auto_32630 ) ( CLEAR ?auto_32628 ) ( not ( = ?auto_32627 ?auto_32630 ) ) ( not ( = ?auto_32628 ?auto_32630 ) ) ( not ( = ?auto_32626 ?auto_32630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32627 ?auto_32628 )
      ( MAKE-2CRATE-VERIFY ?auto_32626 ?auto_32627 ?auto_32628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32635 - SURFACE
      ?auto_32636 - SURFACE
    )
    :vars
    (
      ?auto_32637 - HOIST
      ?auto_32638 - PLACE
      ?auto_32640 - SURFACE
      ?auto_32642 - PLACE
      ?auto_32641 - HOIST
      ?auto_32643 - SURFACE
      ?auto_32639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32637 ?auto_32638 ) ( SURFACE-AT ?auto_32635 ?auto_32638 ) ( CLEAR ?auto_32635 ) ( IS-CRATE ?auto_32636 ) ( not ( = ?auto_32635 ?auto_32636 ) ) ( AVAILABLE ?auto_32637 ) ( ON ?auto_32635 ?auto_32640 ) ( not ( = ?auto_32640 ?auto_32635 ) ) ( not ( = ?auto_32640 ?auto_32636 ) ) ( not ( = ?auto_32642 ?auto_32638 ) ) ( HOIST-AT ?auto_32641 ?auto_32642 ) ( not ( = ?auto_32637 ?auto_32641 ) ) ( AVAILABLE ?auto_32641 ) ( SURFACE-AT ?auto_32636 ?auto_32642 ) ( ON ?auto_32636 ?auto_32643 ) ( CLEAR ?auto_32636 ) ( not ( = ?auto_32635 ?auto_32643 ) ) ( not ( = ?auto_32636 ?auto_32643 ) ) ( not ( = ?auto_32640 ?auto_32643 ) ) ( TRUCK-AT ?auto_32639 ?auto_32638 ) )
    :subtasks
    ( ( !DRIVE ?auto_32639 ?auto_32638 ?auto_32642 )
      ( MAKE-2CRATE ?auto_32640 ?auto_32635 ?auto_32636 )
      ( MAKE-1CRATE-VERIFY ?auto_32635 ?auto_32636 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32644 - SURFACE
      ?auto_32645 - SURFACE
      ?auto_32646 - SURFACE
    )
    :vars
    (
      ?auto_32652 - HOIST
      ?auto_32649 - PLACE
      ?auto_32648 - PLACE
      ?auto_32651 - HOIST
      ?auto_32647 - SURFACE
      ?auto_32650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32652 ?auto_32649 ) ( SURFACE-AT ?auto_32645 ?auto_32649 ) ( CLEAR ?auto_32645 ) ( IS-CRATE ?auto_32646 ) ( not ( = ?auto_32645 ?auto_32646 ) ) ( AVAILABLE ?auto_32652 ) ( ON ?auto_32645 ?auto_32644 ) ( not ( = ?auto_32644 ?auto_32645 ) ) ( not ( = ?auto_32644 ?auto_32646 ) ) ( not ( = ?auto_32648 ?auto_32649 ) ) ( HOIST-AT ?auto_32651 ?auto_32648 ) ( not ( = ?auto_32652 ?auto_32651 ) ) ( AVAILABLE ?auto_32651 ) ( SURFACE-AT ?auto_32646 ?auto_32648 ) ( ON ?auto_32646 ?auto_32647 ) ( CLEAR ?auto_32646 ) ( not ( = ?auto_32645 ?auto_32647 ) ) ( not ( = ?auto_32646 ?auto_32647 ) ) ( not ( = ?auto_32644 ?auto_32647 ) ) ( TRUCK-AT ?auto_32650 ?auto_32649 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32645 ?auto_32646 )
      ( MAKE-2CRATE-VERIFY ?auto_32644 ?auto_32645 ?auto_32646 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32653 - SURFACE
      ?auto_32654 - SURFACE
    )
    :vars
    (
      ?auto_32660 - HOIST
      ?auto_32658 - PLACE
      ?auto_32656 - SURFACE
      ?auto_32657 - PLACE
      ?auto_32661 - HOIST
      ?auto_32659 - SURFACE
      ?auto_32655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32660 ?auto_32658 ) ( IS-CRATE ?auto_32654 ) ( not ( = ?auto_32653 ?auto_32654 ) ) ( not ( = ?auto_32656 ?auto_32653 ) ) ( not ( = ?auto_32656 ?auto_32654 ) ) ( not ( = ?auto_32657 ?auto_32658 ) ) ( HOIST-AT ?auto_32661 ?auto_32657 ) ( not ( = ?auto_32660 ?auto_32661 ) ) ( AVAILABLE ?auto_32661 ) ( SURFACE-AT ?auto_32654 ?auto_32657 ) ( ON ?auto_32654 ?auto_32659 ) ( CLEAR ?auto_32654 ) ( not ( = ?auto_32653 ?auto_32659 ) ) ( not ( = ?auto_32654 ?auto_32659 ) ) ( not ( = ?auto_32656 ?auto_32659 ) ) ( TRUCK-AT ?auto_32655 ?auto_32658 ) ( SURFACE-AT ?auto_32656 ?auto_32658 ) ( CLEAR ?auto_32656 ) ( LIFTING ?auto_32660 ?auto_32653 ) ( IS-CRATE ?auto_32653 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32656 ?auto_32653 )
      ( MAKE-2CRATE ?auto_32656 ?auto_32653 ?auto_32654 )
      ( MAKE-1CRATE-VERIFY ?auto_32653 ?auto_32654 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32662 - SURFACE
      ?auto_32663 - SURFACE
      ?auto_32664 - SURFACE
    )
    :vars
    (
      ?auto_32670 - HOIST
      ?auto_32669 - PLACE
      ?auto_32666 - PLACE
      ?auto_32668 - HOIST
      ?auto_32667 - SURFACE
      ?auto_32665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32670 ?auto_32669 ) ( IS-CRATE ?auto_32664 ) ( not ( = ?auto_32663 ?auto_32664 ) ) ( not ( = ?auto_32662 ?auto_32663 ) ) ( not ( = ?auto_32662 ?auto_32664 ) ) ( not ( = ?auto_32666 ?auto_32669 ) ) ( HOIST-AT ?auto_32668 ?auto_32666 ) ( not ( = ?auto_32670 ?auto_32668 ) ) ( AVAILABLE ?auto_32668 ) ( SURFACE-AT ?auto_32664 ?auto_32666 ) ( ON ?auto_32664 ?auto_32667 ) ( CLEAR ?auto_32664 ) ( not ( = ?auto_32663 ?auto_32667 ) ) ( not ( = ?auto_32664 ?auto_32667 ) ) ( not ( = ?auto_32662 ?auto_32667 ) ) ( TRUCK-AT ?auto_32665 ?auto_32669 ) ( SURFACE-AT ?auto_32662 ?auto_32669 ) ( CLEAR ?auto_32662 ) ( LIFTING ?auto_32670 ?auto_32663 ) ( IS-CRATE ?auto_32663 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32663 ?auto_32664 )
      ( MAKE-2CRATE-VERIFY ?auto_32662 ?auto_32663 ?auto_32664 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32671 - SURFACE
      ?auto_32672 - SURFACE
    )
    :vars
    (
      ?auto_32679 - HOIST
      ?auto_32674 - PLACE
      ?auto_32675 - SURFACE
      ?auto_32673 - PLACE
      ?auto_32677 - HOIST
      ?auto_32676 - SURFACE
      ?auto_32678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32679 ?auto_32674 ) ( IS-CRATE ?auto_32672 ) ( not ( = ?auto_32671 ?auto_32672 ) ) ( not ( = ?auto_32675 ?auto_32671 ) ) ( not ( = ?auto_32675 ?auto_32672 ) ) ( not ( = ?auto_32673 ?auto_32674 ) ) ( HOIST-AT ?auto_32677 ?auto_32673 ) ( not ( = ?auto_32679 ?auto_32677 ) ) ( AVAILABLE ?auto_32677 ) ( SURFACE-AT ?auto_32672 ?auto_32673 ) ( ON ?auto_32672 ?auto_32676 ) ( CLEAR ?auto_32672 ) ( not ( = ?auto_32671 ?auto_32676 ) ) ( not ( = ?auto_32672 ?auto_32676 ) ) ( not ( = ?auto_32675 ?auto_32676 ) ) ( TRUCK-AT ?auto_32678 ?auto_32674 ) ( SURFACE-AT ?auto_32675 ?auto_32674 ) ( CLEAR ?auto_32675 ) ( IS-CRATE ?auto_32671 ) ( AVAILABLE ?auto_32679 ) ( IN ?auto_32671 ?auto_32678 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32679 ?auto_32671 ?auto_32678 ?auto_32674 )
      ( MAKE-2CRATE ?auto_32675 ?auto_32671 ?auto_32672 )
      ( MAKE-1CRATE-VERIFY ?auto_32671 ?auto_32672 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32680 - SURFACE
      ?auto_32681 - SURFACE
      ?auto_32682 - SURFACE
    )
    :vars
    (
      ?auto_32684 - HOIST
      ?auto_32685 - PLACE
      ?auto_32686 - PLACE
      ?auto_32683 - HOIST
      ?auto_32688 - SURFACE
      ?auto_32687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32684 ?auto_32685 ) ( IS-CRATE ?auto_32682 ) ( not ( = ?auto_32681 ?auto_32682 ) ) ( not ( = ?auto_32680 ?auto_32681 ) ) ( not ( = ?auto_32680 ?auto_32682 ) ) ( not ( = ?auto_32686 ?auto_32685 ) ) ( HOIST-AT ?auto_32683 ?auto_32686 ) ( not ( = ?auto_32684 ?auto_32683 ) ) ( AVAILABLE ?auto_32683 ) ( SURFACE-AT ?auto_32682 ?auto_32686 ) ( ON ?auto_32682 ?auto_32688 ) ( CLEAR ?auto_32682 ) ( not ( = ?auto_32681 ?auto_32688 ) ) ( not ( = ?auto_32682 ?auto_32688 ) ) ( not ( = ?auto_32680 ?auto_32688 ) ) ( TRUCK-AT ?auto_32687 ?auto_32685 ) ( SURFACE-AT ?auto_32680 ?auto_32685 ) ( CLEAR ?auto_32680 ) ( IS-CRATE ?auto_32681 ) ( AVAILABLE ?auto_32684 ) ( IN ?auto_32681 ?auto_32687 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32681 ?auto_32682 )
      ( MAKE-2CRATE-VERIFY ?auto_32680 ?auto_32681 ?auto_32682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32689 - SURFACE
      ?auto_32690 - SURFACE
    )
    :vars
    (
      ?auto_32696 - HOIST
      ?auto_32697 - PLACE
      ?auto_32692 - SURFACE
      ?auto_32695 - PLACE
      ?auto_32694 - HOIST
      ?auto_32693 - SURFACE
      ?auto_32691 - TRUCK
      ?auto_32698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32696 ?auto_32697 ) ( IS-CRATE ?auto_32690 ) ( not ( = ?auto_32689 ?auto_32690 ) ) ( not ( = ?auto_32692 ?auto_32689 ) ) ( not ( = ?auto_32692 ?auto_32690 ) ) ( not ( = ?auto_32695 ?auto_32697 ) ) ( HOIST-AT ?auto_32694 ?auto_32695 ) ( not ( = ?auto_32696 ?auto_32694 ) ) ( AVAILABLE ?auto_32694 ) ( SURFACE-AT ?auto_32690 ?auto_32695 ) ( ON ?auto_32690 ?auto_32693 ) ( CLEAR ?auto_32690 ) ( not ( = ?auto_32689 ?auto_32693 ) ) ( not ( = ?auto_32690 ?auto_32693 ) ) ( not ( = ?auto_32692 ?auto_32693 ) ) ( SURFACE-AT ?auto_32692 ?auto_32697 ) ( CLEAR ?auto_32692 ) ( IS-CRATE ?auto_32689 ) ( AVAILABLE ?auto_32696 ) ( IN ?auto_32689 ?auto_32691 ) ( TRUCK-AT ?auto_32691 ?auto_32698 ) ( not ( = ?auto_32698 ?auto_32697 ) ) ( not ( = ?auto_32695 ?auto_32698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32691 ?auto_32698 ?auto_32697 )
      ( MAKE-2CRATE ?auto_32692 ?auto_32689 ?auto_32690 )
      ( MAKE-1CRATE-VERIFY ?auto_32689 ?auto_32690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32699 - SURFACE
      ?auto_32700 - SURFACE
      ?auto_32701 - SURFACE
    )
    :vars
    (
      ?auto_32708 - HOIST
      ?auto_32705 - PLACE
      ?auto_32707 - PLACE
      ?auto_32702 - HOIST
      ?auto_32703 - SURFACE
      ?auto_32706 - TRUCK
      ?auto_32704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32708 ?auto_32705 ) ( IS-CRATE ?auto_32701 ) ( not ( = ?auto_32700 ?auto_32701 ) ) ( not ( = ?auto_32699 ?auto_32700 ) ) ( not ( = ?auto_32699 ?auto_32701 ) ) ( not ( = ?auto_32707 ?auto_32705 ) ) ( HOIST-AT ?auto_32702 ?auto_32707 ) ( not ( = ?auto_32708 ?auto_32702 ) ) ( AVAILABLE ?auto_32702 ) ( SURFACE-AT ?auto_32701 ?auto_32707 ) ( ON ?auto_32701 ?auto_32703 ) ( CLEAR ?auto_32701 ) ( not ( = ?auto_32700 ?auto_32703 ) ) ( not ( = ?auto_32701 ?auto_32703 ) ) ( not ( = ?auto_32699 ?auto_32703 ) ) ( SURFACE-AT ?auto_32699 ?auto_32705 ) ( CLEAR ?auto_32699 ) ( IS-CRATE ?auto_32700 ) ( AVAILABLE ?auto_32708 ) ( IN ?auto_32700 ?auto_32706 ) ( TRUCK-AT ?auto_32706 ?auto_32704 ) ( not ( = ?auto_32704 ?auto_32705 ) ) ( not ( = ?auto_32707 ?auto_32704 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32700 ?auto_32701 )
      ( MAKE-2CRATE-VERIFY ?auto_32699 ?auto_32700 ?auto_32701 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32709 - SURFACE
      ?auto_32710 - SURFACE
    )
    :vars
    (
      ?auto_32716 - HOIST
      ?auto_32714 - PLACE
      ?auto_32713 - SURFACE
      ?auto_32717 - PLACE
      ?auto_32715 - HOIST
      ?auto_32712 - SURFACE
      ?auto_32718 - TRUCK
      ?auto_32711 - PLACE
      ?auto_32719 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32716 ?auto_32714 ) ( IS-CRATE ?auto_32710 ) ( not ( = ?auto_32709 ?auto_32710 ) ) ( not ( = ?auto_32713 ?auto_32709 ) ) ( not ( = ?auto_32713 ?auto_32710 ) ) ( not ( = ?auto_32717 ?auto_32714 ) ) ( HOIST-AT ?auto_32715 ?auto_32717 ) ( not ( = ?auto_32716 ?auto_32715 ) ) ( AVAILABLE ?auto_32715 ) ( SURFACE-AT ?auto_32710 ?auto_32717 ) ( ON ?auto_32710 ?auto_32712 ) ( CLEAR ?auto_32710 ) ( not ( = ?auto_32709 ?auto_32712 ) ) ( not ( = ?auto_32710 ?auto_32712 ) ) ( not ( = ?auto_32713 ?auto_32712 ) ) ( SURFACE-AT ?auto_32713 ?auto_32714 ) ( CLEAR ?auto_32713 ) ( IS-CRATE ?auto_32709 ) ( AVAILABLE ?auto_32716 ) ( TRUCK-AT ?auto_32718 ?auto_32711 ) ( not ( = ?auto_32711 ?auto_32714 ) ) ( not ( = ?auto_32717 ?auto_32711 ) ) ( HOIST-AT ?auto_32719 ?auto_32711 ) ( LIFTING ?auto_32719 ?auto_32709 ) ( not ( = ?auto_32716 ?auto_32719 ) ) ( not ( = ?auto_32715 ?auto_32719 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32719 ?auto_32709 ?auto_32718 ?auto_32711 )
      ( MAKE-2CRATE ?auto_32713 ?auto_32709 ?auto_32710 )
      ( MAKE-1CRATE-VERIFY ?auto_32709 ?auto_32710 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32720 - SURFACE
      ?auto_32721 - SURFACE
      ?auto_32722 - SURFACE
    )
    :vars
    (
      ?auto_32723 - HOIST
      ?auto_32730 - PLACE
      ?auto_32727 - PLACE
      ?auto_32726 - HOIST
      ?auto_32729 - SURFACE
      ?auto_32728 - TRUCK
      ?auto_32724 - PLACE
      ?auto_32725 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32723 ?auto_32730 ) ( IS-CRATE ?auto_32722 ) ( not ( = ?auto_32721 ?auto_32722 ) ) ( not ( = ?auto_32720 ?auto_32721 ) ) ( not ( = ?auto_32720 ?auto_32722 ) ) ( not ( = ?auto_32727 ?auto_32730 ) ) ( HOIST-AT ?auto_32726 ?auto_32727 ) ( not ( = ?auto_32723 ?auto_32726 ) ) ( AVAILABLE ?auto_32726 ) ( SURFACE-AT ?auto_32722 ?auto_32727 ) ( ON ?auto_32722 ?auto_32729 ) ( CLEAR ?auto_32722 ) ( not ( = ?auto_32721 ?auto_32729 ) ) ( not ( = ?auto_32722 ?auto_32729 ) ) ( not ( = ?auto_32720 ?auto_32729 ) ) ( SURFACE-AT ?auto_32720 ?auto_32730 ) ( CLEAR ?auto_32720 ) ( IS-CRATE ?auto_32721 ) ( AVAILABLE ?auto_32723 ) ( TRUCK-AT ?auto_32728 ?auto_32724 ) ( not ( = ?auto_32724 ?auto_32730 ) ) ( not ( = ?auto_32727 ?auto_32724 ) ) ( HOIST-AT ?auto_32725 ?auto_32724 ) ( LIFTING ?auto_32725 ?auto_32721 ) ( not ( = ?auto_32723 ?auto_32725 ) ) ( not ( = ?auto_32726 ?auto_32725 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32721 ?auto_32722 )
      ( MAKE-2CRATE-VERIFY ?auto_32720 ?auto_32721 ?auto_32722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32731 - SURFACE
      ?auto_32732 - SURFACE
    )
    :vars
    (
      ?auto_32741 - HOIST
      ?auto_32735 - PLACE
      ?auto_32736 - SURFACE
      ?auto_32740 - PLACE
      ?auto_32739 - HOIST
      ?auto_32733 - SURFACE
      ?auto_32737 - TRUCK
      ?auto_32738 - PLACE
      ?auto_32734 - HOIST
      ?auto_32742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32741 ?auto_32735 ) ( IS-CRATE ?auto_32732 ) ( not ( = ?auto_32731 ?auto_32732 ) ) ( not ( = ?auto_32736 ?auto_32731 ) ) ( not ( = ?auto_32736 ?auto_32732 ) ) ( not ( = ?auto_32740 ?auto_32735 ) ) ( HOIST-AT ?auto_32739 ?auto_32740 ) ( not ( = ?auto_32741 ?auto_32739 ) ) ( AVAILABLE ?auto_32739 ) ( SURFACE-AT ?auto_32732 ?auto_32740 ) ( ON ?auto_32732 ?auto_32733 ) ( CLEAR ?auto_32732 ) ( not ( = ?auto_32731 ?auto_32733 ) ) ( not ( = ?auto_32732 ?auto_32733 ) ) ( not ( = ?auto_32736 ?auto_32733 ) ) ( SURFACE-AT ?auto_32736 ?auto_32735 ) ( CLEAR ?auto_32736 ) ( IS-CRATE ?auto_32731 ) ( AVAILABLE ?auto_32741 ) ( TRUCK-AT ?auto_32737 ?auto_32738 ) ( not ( = ?auto_32738 ?auto_32735 ) ) ( not ( = ?auto_32740 ?auto_32738 ) ) ( HOIST-AT ?auto_32734 ?auto_32738 ) ( not ( = ?auto_32741 ?auto_32734 ) ) ( not ( = ?auto_32739 ?auto_32734 ) ) ( AVAILABLE ?auto_32734 ) ( SURFACE-AT ?auto_32731 ?auto_32738 ) ( ON ?auto_32731 ?auto_32742 ) ( CLEAR ?auto_32731 ) ( not ( = ?auto_32731 ?auto_32742 ) ) ( not ( = ?auto_32732 ?auto_32742 ) ) ( not ( = ?auto_32736 ?auto_32742 ) ) ( not ( = ?auto_32733 ?auto_32742 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32734 ?auto_32731 ?auto_32742 ?auto_32738 )
      ( MAKE-2CRATE ?auto_32736 ?auto_32731 ?auto_32732 )
      ( MAKE-1CRATE-VERIFY ?auto_32731 ?auto_32732 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32743 - SURFACE
      ?auto_32744 - SURFACE
      ?auto_32745 - SURFACE
    )
    :vars
    (
      ?auto_32754 - HOIST
      ?auto_32747 - PLACE
      ?auto_32751 - PLACE
      ?auto_32750 - HOIST
      ?auto_32748 - SURFACE
      ?auto_32749 - TRUCK
      ?auto_32752 - PLACE
      ?auto_32753 - HOIST
      ?auto_32746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32754 ?auto_32747 ) ( IS-CRATE ?auto_32745 ) ( not ( = ?auto_32744 ?auto_32745 ) ) ( not ( = ?auto_32743 ?auto_32744 ) ) ( not ( = ?auto_32743 ?auto_32745 ) ) ( not ( = ?auto_32751 ?auto_32747 ) ) ( HOIST-AT ?auto_32750 ?auto_32751 ) ( not ( = ?auto_32754 ?auto_32750 ) ) ( AVAILABLE ?auto_32750 ) ( SURFACE-AT ?auto_32745 ?auto_32751 ) ( ON ?auto_32745 ?auto_32748 ) ( CLEAR ?auto_32745 ) ( not ( = ?auto_32744 ?auto_32748 ) ) ( not ( = ?auto_32745 ?auto_32748 ) ) ( not ( = ?auto_32743 ?auto_32748 ) ) ( SURFACE-AT ?auto_32743 ?auto_32747 ) ( CLEAR ?auto_32743 ) ( IS-CRATE ?auto_32744 ) ( AVAILABLE ?auto_32754 ) ( TRUCK-AT ?auto_32749 ?auto_32752 ) ( not ( = ?auto_32752 ?auto_32747 ) ) ( not ( = ?auto_32751 ?auto_32752 ) ) ( HOIST-AT ?auto_32753 ?auto_32752 ) ( not ( = ?auto_32754 ?auto_32753 ) ) ( not ( = ?auto_32750 ?auto_32753 ) ) ( AVAILABLE ?auto_32753 ) ( SURFACE-AT ?auto_32744 ?auto_32752 ) ( ON ?auto_32744 ?auto_32746 ) ( CLEAR ?auto_32744 ) ( not ( = ?auto_32744 ?auto_32746 ) ) ( not ( = ?auto_32745 ?auto_32746 ) ) ( not ( = ?auto_32743 ?auto_32746 ) ) ( not ( = ?auto_32748 ?auto_32746 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32744 ?auto_32745 )
      ( MAKE-2CRATE-VERIFY ?auto_32743 ?auto_32744 ?auto_32745 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32755 - SURFACE
      ?auto_32756 - SURFACE
    )
    :vars
    (
      ?auto_32758 - HOIST
      ?auto_32765 - PLACE
      ?auto_32763 - SURFACE
      ?auto_32757 - PLACE
      ?auto_32762 - HOIST
      ?auto_32766 - SURFACE
      ?auto_32764 - PLACE
      ?auto_32759 - HOIST
      ?auto_32761 - SURFACE
      ?auto_32760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32758 ?auto_32765 ) ( IS-CRATE ?auto_32756 ) ( not ( = ?auto_32755 ?auto_32756 ) ) ( not ( = ?auto_32763 ?auto_32755 ) ) ( not ( = ?auto_32763 ?auto_32756 ) ) ( not ( = ?auto_32757 ?auto_32765 ) ) ( HOIST-AT ?auto_32762 ?auto_32757 ) ( not ( = ?auto_32758 ?auto_32762 ) ) ( AVAILABLE ?auto_32762 ) ( SURFACE-AT ?auto_32756 ?auto_32757 ) ( ON ?auto_32756 ?auto_32766 ) ( CLEAR ?auto_32756 ) ( not ( = ?auto_32755 ?auto_32766 ) ) ( not ( = ?auto_32756 ?auto_32766 ) ) ( not ( = ?auto_32763 ?auto_32766 ) ) ( SURFACE-AT ?auto_32763 ?auto_32765 ) ( CLEAR ?auto_32763 ) ( IS-CRATE ?auto_32755 ) ( AVAILABLE ?auto_32758 ) ( not ( = ?auto_32764 ?auto_32765 ) ) ( not ( = ?auto_32757 ?auto_32764 ) ) ( HOIST-AT ?auto_32759 ?auto_32764 ) ( not ( = ?auto_32758 ?auto_32759 ) ) ( not ( = ?auto_32762 ?auto_32759 ) ) ( AVAILABLE ?auto_32759 ) ( SURFACE-AT ?auto_32755 ?auto_32764 ) ( ON ?auto_32755 ?auto_32761 ) ( CLEAR ?auto_32755 ) ( not ( = ?auto_32755 ?auto_32761 ) ) ( not ( = ?auto_32756 ?auto_32761 ) ) ( not ( = ?auto_32763 ?auto_32761 ) ) ( not ( = ?auto_32766 ?auto_32761 ) ) ( TRUCK-AT ?auto_32760 ?auto_32765 ) )
    :subtasks
    ( ( !DRIVE ?auto_32760 ?auto_32765 ?auto_32764 )
      ( MAKE-2CRATE ?auto_32763 ?auto_32755 ?auto_32756 )
      ( MAKE-1CRATE-VERIFY ?auto_32755 ?auto_32756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32767 - SURFACE
      ?auto_32768 - SURFACE
      ?auto_32769 - SURFACE
    )
    :vars
    (
      ?auto_32774 - HOIST
      ?auto_32772 - PLACE
      ?auto_32778 - PLACE
      ?auto_32770 - HOIST
      ?auto_32771 - SURFACE
      ?auto_32773 - PLACE
      ?auto_32775 - HOIST
      ?auto_32776 - SURFACE
      ?auto_32777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32774 ?auto_32772 ) ( IS-CRATE ?auto_32769 ) ( not ( = ?auto_32768 ?auto_32769 ) ) ( not ( = ?auto_32767 ?auto_32768 ) ) ( not ( = ?auto_32767 ?auto_32769 ) ) ( not ( = ?auto_32778 ?auto_32772 ) ) ( HOIST-AT ?auto_32770 ?auto_32778 ) ( not ( = ?auto_32774 ?auto_32770 ) ) ( AVAILABLE ?auto_32770 ) ( SURFACE-AT ?auto_32769 ?auto_32778 ) ( ON ?auto_32769 ?auto_32771 ) ( CLEAR ?auto_32769 ) ( not ( = ?auto_32768 ?auto_32771 ) ) ( not ( = ?auto_32769 ?auto_32771 ) ) ( not ( = ?auto_32767 ?auto_32771 ) ) ( SURFACE-AT ?auto_32767 ?auto_32772 ) ( CLEAR ?auto_32767 ) ( IS-CRATE ?auto_32768 ) ( AVAILABLE ?auto_32774 ) ( not ( = ?auto_32773 ?auto_32772 ) ) ( not ( = ?auto_32778 ?auto_32773 ) ) ( HOIST-AT ?auto_32775 ?auto_32773 ) ( not ( = ?auto_32774 ?auto_32775 ) ) ( not ( = ?auto_32770 ?auto_32775 ) ) ( AVAILABLE ?auto_32775 ) ( SURFACE-AT ?auto_32768 ?auto_32773 ) ( ON ?auto_32768 ?auto_32776 ) ( CLEAR ?auto_32768 ) ( not ( = ?auto_32768 ?auto_32776 ) ) ( not ( = ?auto_32769 ?auto_32776 ) ) ( not ( = ?auto_32767 ?auto_32776 ) ) ( not ( = ?auto_32771 ?auto_32776 ) ) ( TRUCK-AT ?auto_32777 ?auto_32772 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32768 ?auto_32769 )
      ( MAKE-2CRATE-VERIFY ?auto_32767 ?auto_32768 ?auto_32769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32788 - SURFACE
      ?auto_32789 - SURFACE
    )
    :vars
    (
      ?auto_32790 - HOIST
      ?auto_32791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32790 ?auto_32791 ) ( SURFACE-AT ?auto_32788 ?auto_32791 ) ( CLEAR ?auto_32788 ) ( LIFTING ?auto_32790 ?auto_32789 ) ( IS-CRATE ?auto_32789 ) ( not ( = ?auto_32788 ?auto_32789 ) ) )
    :subtasks
    ( ( !DROP ?auto_32790 ?auto_32789 ?auto_32788 ?auto_32791 )
      ( MAKE-1CRATE-VERIFY ?auto_32788 ?auto_32789 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32792 - SURFACE
      ?auto_32793 - SURFACE
      ?auto_32794 - SURFACE
    )
    :vars
    (
      ?auto_32796 - HOIST
      ?auto_32795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32796 ?auto_32795 ) ( SURFACE-AT ?auto_32793 ?auto_32795 ) ( CLEAR ?auto_32793 ) ( LIFTING ?auto_32796 ?auto_32794 ) ( IS-CRATE ?auto_32794 ) ( not ( = ?auto_32793 ?auto_32794 ) ) ( ON ?auto_32793 ?auto_32792 ) ( not ( = ?auto_32792 ?auto_32793 ) ) ( not ( = ?auto_32792 ?auto_32794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32793 ?auto_32794 )
      ( MAKE-2CRATE-VERIFY ?auto_32792 ?auto_32793 ?auto_32794 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32797 - SURFACE
      ?auto_32798 - SURFACE
      ?auto_32799 - SURFACE
      ?auto_32800 - SURFACE
    )
    :vars
    (
      ?auto_32802 - HOIST
      ?auto_32801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32802 ?auto_32801 ) ( SURFACE-AT ?auto_32799 ?auto_32801 ) ( CLEAR ?auto_32799 ) ( LIFTING ?auto_32802 ?auto_32800 ) ( IS-CRATE ?auto_32800 ) ( not ( = ?auto_32799 ?auto_32800 ) ) ( ON ?auto_32798 ?auto_32797 ) ( ON ?auto_32799 ?auto_32798 ) ( not ( = ?auto_32797 ?auto_32798 ) ) ( not ( = ?auto_32797 ?auto_32799 ) ) ( not ( = ?auto_32797 ?auto_32800 ) ) ( not ( = ?auto_32798 ?auto_32799 ) ) ( not ( = ?auto_32798 ?auto_32800 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32799 ?auto_32800 )
      ( MAKE-3CRATE-VERIFY ?auto_32797 ?auto_32798 ?auto_32799 ?auto_32800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32803 - SURFACE
      ?auto_32804 - SURFACE
    )
    :vars
    (
      ?auto_32806 - HOIST
      ?auto_32805 - PLACE
      ?auto_32807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32806 ?auto_32805 ) ( SURFACE-AT ?auto_32803 ?auto_32805 ) ( CLEAR ?auto_32803 ) ( IS-CRATE ?auto_32804 ) ( not ( = ?auto_32803 ?auto_32804 ) ) ( TRUCK-AT ?auto_32807 ?auto_32805 ) ( AVAILABLE ?auto_32806 ) ( IN ?auto_32804 ?auto_32807 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32806 ?auto_32804 ?auto_32807 ?auto_32805 )
      ( MAKE-1CRATE ?auto_32803 ?auto_32804 )
      ( MAKE-1CRATE-VERIFY ?auto_32803 ?auto_32804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32808 - SURFACE
      ?auto_32809 - SURFACE
      ?auto_32810 - SURFACE
    )
    :vars
    (
      ?auto_32812 - HOIST
      ?auto_32811 - PLACE
      ?auto_32813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32812 ?auto_32811 ) ( SURFACE-AT ?auto_32809 ?auto_32811 ) ( CLEAR ?auto_32809 ) ( IS-CRATE ?auto_32810 ) ( not ( = ?auto_32809 ?auto_32810 ) ) ( TRUCK-AT ?auto_32813 ?auto_32811 ) ( AVAILABLE ?auto_32812 ) ( IN ?auto_32810 ?auto_32813 ) ( ON ?auto_32809 ?auto_32808 ) ( not ( = ?auto_32808 ?auto_32809 ) ) ( not ( = ?auto_32808 ?auto_32810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32809 ?auto_32810 )
      ( MAKE-2CRATE-VERIFY ?auto_32808 ?auto_32809 ?auto_32810 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32814 - SURFACE
      ?auto_32815 - SURFACE
      ?auto_32816 - SURFACE
      ?auto_32817 - SURFACE
    )
    :vars
    (
      ?auto_32819 - HOIST
      ?auto_32820 - PLACE
      ?auto_32818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32819 ?auto_32820 ) ( SURFACE-AT ?auto_32816 ?auto_32820 ) ( CLEAR ?auto_32816 ) ( IS-CRATE ?auto_32817 ) ( not ( = ?auto_32816 ?auto_32817 ) ) ( TRUCK-AT ?auto_32818 ?auto_32820 ) ( AVAILABLE ?auto_32819 ) ( IN ?auto_32817 ?auto_32818 ) ( ON ?auto_32816 ?auto_32815 ) ( not ( = ?auto_32815 ?auto_32816 ) ) ( not ( = ?auto_32815 ?auto_32817 ) ) ( ON ?auto_32815 ?auto_32814 ) ( not ( = ?auto_32814 ?auto_32815 ) ) ( not ( = ?auto_32814 ?auto_32816 ) ) ( not ( = ?auto_32814 ?auto_32817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32815 ?auto_32816 ?auto_32817 )
      ( MAKE-3CRATE-VERIFY ?auto_32814 ?auto_32815 ?auto_32816 ?auto_32817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32821 - SURFACE
      ?auto_32822 - SURFACE
    )
    :vars
    (
      ?auto_32825 - HOIST
      ?auto_32826 - PLACE
      ?auto_32824 - TRUCK
      ?auto_32823 - SURFACE
      ?auto_32827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32825 ?auto_32826 ) ( SURFACE-AT ?auto_32821 ?auto_32826 ) ( CLEAR ?auto_32821 ) ( IS-CRATE ?auto_32822 ) ( not ( = ?auto_32821 ?auto_32822 ) ) ( AVAILABLE ?auto_32825 ) ( IN ?auto_32822 ?auto_32824 ) ( ON ?auto_32821 ?auto_32823 ) ( not ( = ?auto_32823 ?auto_32821 ) ) ( not ( = ?auto_32823 ?auto_32822 ) ) ( TRUCK-AT ?auto_32824 ?auto_32827 ) ( not ( = ?auto_32827 ?auto_32826 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32824 ?auto_32827 ?auto_32826 )
      ( MAKE-2CRATE ?auto_32823 ?auto_32821 ?auto_32822 )
      ( MAKE-1CRATE-VERIFY ?auto_32821 ?auto_32822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32828 - SURFACE
      ?auto_32829 - SURFACE
      ?auto_32830 - SURFACE
    )
    :vars
    (
      ?auto_32831 - HOIST
      ?auto_32834 - PLACE
      ?auto_32833 - TRUCK
      ?auto_32832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32831 ?auto_32834 ) ( SURFACE-AT ?auto_32829 ?auto_32834 ) ( CLEAR ?auto_32829 ) ( IS-CRATE ?auto_32830 ) ( not ( = ?auto_32829 ?auto_32830 ) ) ( AVAILABLE ?auto_32831 ) ( IN ?auto_32830 ?auto_32833 ) ( ON ?auto_32829 ?auto_32828 ) ( not ( = ?auto_32828 ?auto_32829 ) ) ( not ( = ?auto_32828 ?auto_32830 ) ) ( TRUCK-AT ?auto_32833 ?auto_32832 ) ( not ( = ?auto_32832 ?auto_32834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32829 ?auto_32830 )
      ( MAKE-2CRATE-VERIFY ?auto_32828 ?auto_32829 ?auto_32830 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32835 - SURFACE
      ?auto_32836 - SURFACE
      ?auto_32837 - SURFACE
      ?auto_32838 - SURFACE
    )
    :vars
    (
      ?auto_32839 - HOIST
      ?auto_32842 - PLACE
      ?auto_32841 - TRUCK
      ?auto_32840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32839 ?auto_32842 ) ( SURFACE-AT ?auto_32837 ?auto_32842 ) ( CLEAR ?auto_32837 ) ( IS-CRATE ?auto_32838 ) ( not ( = ?auto_32837 ?auto_32838 ) ) ( AVAILABLE ?auto_32839 ) ( IN ?auto_32838 ?auto_32841 ) ( ON ?auto_32837 ?auto_32836 ) ( not ( = ?auto_32836 ?auto_32837 ) ) ( not ( = ?auto_32836 ?auto_32838 ) ) ( TRUCK-AT ?auto_32841 ?auto_32840 ) ( not ( = ?auto_32840 ?auto_32842 ) ) ( ON ?auto_32836 ?auto_32835 ) ( not ( = ?auto_32835 ?auto_32836 ) ) ( not ( = ?auto_32835 ?auto_32837 ) ) ( not ( = ?auto_32835 ?auto_32838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32836 ?auto_32837 ?auto_32838 )
      ( MAKE-3CRATE-VERIFY ?auto_32835 ?auto_32836 ?auto_32837 ?auto_32838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32843 - SURFACE
      ?auto_32844 - SURFACE
    )
    :vars
    (
      ?auto_32845 - HOIST
      ?auto_32849 - PLACE
      ?auto_32846 - SURFACE
      ?auto_32848 - TRUCK
      ?auto_32847 - PLACE
      ?auto_32850 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32845 ?auto_32849 ) ( SURFACE-AT ?auto_32843 ?auto_32849 ) ( CLEAR ?auto_32843 ) ( IS-CRATE ?auto_32844 ) ( not ( = ?auto_32843 ?auto_32844 ) ) ( AVAILABLE ?auto_32845 ) ( ON ?auto_32843 ?auto_32846 ) ( not ( = ?auto_32846 ?auto_32843 ) ) ( not ( = ?auto_32846 ?auto_32844 ) ) ( TRUCK-AT ?auto_32848 ?auto_32847 ) ( not ( = ?auto_32847 ?auto_32849 ) ) ( HOIST-AT ?auto_32850 ?auto_32847 ) ( LIFTING ?auto_32850 ?auto_32844 ) ( not ( = ?auto_32845 ?auto_32850 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32850 ?auto_32844 ?auto_32848 ?auto_32847 )
      ( MAKE-2CRATE ?auto_32846 ?auto_32843 ?auto_32844 )
      ( MAKE-1CRATE-VERIFY ?auto_32843 ?auto_32844 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32851 - SURFACE
      ?auto_32852 - SURFACE
      ?auto_32853 - SURFACE
    )
    :vars
    (
      ?auto_32854 - HOIST
      ?auto_32858 - PLACE
      ?auto_32856 - TRUCK
      ?auto_32857 - PLACE
      ?auto_32855 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32854 ?auto_32858 ) ( SURFACE-AT ?auto_32852 ?auto_32858 ) ( CLEAR ?auto_32852 ) ( IS-CRATE ?auto_32853 ) ( not ( = ?auto_32852 ?auto_32853 ) ) ( AVAILABLE ?auto_32854 ) ( ON ?auto_32852 ?auto_32851 ) ( not ( = ?auto_32851 ?auto_32852 ) ) ( not ( = ?auto_32851 ?auto_32853 ) ) ( TRUCK-AT ?auto_32856 ?auto_32857 ) ( not ( = ?auto_32857 ?auto_32858 ) ) ( HOIST-AT ?auto_32855 ?auto_32857 ) ( LIFTING ?auto_32855 ?auto_32853 ) ( not ( = ?auto_32854 ?auto_32855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32852 ?auto_32853 )
      ( MAKE-2CRATE-VERIFY ?auto_32851 ?auto_32852 ?auto_32853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32859 - SURFACE
      ?auto_32860 - SURFACE
      ?auto_32861 - SURFACE
      ?auto_32862 - SURFACE
    )
    :vars
    (
      ?auto_32865 - HOIST
      ?auto_32863 - PLACE
      ?auto_32866 - TRUCK
      ?auto_32864 - PLACE
      ?auto_32867 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32865 ?auto_32863 ) ( SURFACE-AT ?auto_32861 ?auto_32863 ) ( CLEAR ?auto_32861 ) ( IS-CRATE ?auto_32862 ) ( not ( = ?auto_32861 ?auto_32862 ) ) ( AVAILABLE ?auto_32865 ) ( ON ?auto_32861 ?auto_32860 ) ( not ( = ?auto_32860 ?auto_32861 ) ) ( not ( = ?auto_32860 ?auto_32862 ) ) ( TRUCK-AT ?auto_32866 ?auto_32864 ) ( not ( = ?auto_32864 ?auto_32863 ) ) ( HOIST-AT ?auto_32867 ?auto_32864 ) ( LIFTING ?auto_32867 ?auto_32862 ) ( not ( = ?auto_32865 ?auto_32867 ) ) ( ON ?auto_32860 ?auto_32859 ) ( not ( = ?auto_32859 ?auto_32860 ) ) ( not ( = ?auto_32859 ?auto_32861 ) ) ( not ( = ?auto_32859 ?auto_32862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32860 ?auto_32861 ?auto_32862 )
      ( MAKE-3CRATE-VERIFY ?auto_32859 ?auto_32860 ?auto_32861 ?auto_32862 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32868 - SURFACE
      ?auto_32869 - SURFACE
    )
    :vars
    (
      ?auto_32872 - HOIST
      ?auto_32870 - PLACE
      ?auto_32874 - SURFACE
      ?auto_32873 - TRUCK
      ?auto_32871 - PLACE
      ?auto_32875 - HOIST
      ?auto_32876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32872 ?auto_32870 ) ( SURFACE-AT ?auto_32868 ?auto_32870 ) ( CLEAR ?auto_32868 ) ( IS-CRATE ?auto_32869 ) ( not ( = ?auto_32868 ?auto_32869 ) ) ( AVAILABLE ?auto_32872 ) ( ON ?auto_32868 ?auto_32874 ) ( not ( = ?auto_32874 ?auto_32868 ) ) ( not ( = ?auto_32874 ?auto_32869 ) ) ( TRUCK-AT ?auto_32873 ?auto_32871 ) ( not ( = ?auto_32871 ?auto_32870 ) ) ( HOIST-AT ?auto_32875 ?auto_32871 ) ( not ( = ?auto_32872 ?auto_32875 ) ) ( AVAILABLE ?auto_32875 ) ( SURFACE-AT ?auto_32869 ?auto_32871 ) ( ON ?auto_32869 ?auto_32876 ) ( CLEAR ?auto_32869 ) ( not ( = ?auto_32868 ?auto_32876 ) ) ( not ( = ?auto_32869 ?auto_32876 ) ) ( not ( = ?auto_32874 ?auto_32876 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32875 ?auto_32869 ?auto_32876 ?auto_32871 )
      ( MAKE-2CRATE ?auto_32874 ?auto_32868 ?auto_32869 )
      ( MAKE-1CRATE-VERIFY ?auto_32868 ?auto_32869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32877 - SURFACE
      ?auto_32878 - SURFACE
      ?auto_32879 - SURFACE
    )
    :vars
    (
      ?auto_32882 - HOIST
      ?auto_32883 - PLACE
      ?auto_32885 - TRUCK
      ?auto_32884 - PLACE
      ?auto_32881 - HOIST
      ?auto_32880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32882 ?auto_32883 ) ( SURFACE-AT ?auto_32878 ?auto_32883 ) ( CLEAR ?auto_32878 ) ( IS-CRATE ?auto_32879 ) ( not ( = ?auto_32878 ?auto_32879 ) ) ( AVAILABLE ?auto_32882 ) ( ON ?auto_32878 ?auto_32877 ) ( not ( = ?auto_32877 ?auto_32878 ) ) ( not ( = ?auto_32877 ?auto_32879 ) ) ( TRUCK-AT ?auto_32885 ?auto_32884 ) ( not ( = ?auto_32884 ?auto_32883 ) ) ( HOIST-AT ?auto_32881 ?auto_32884 ) ( not ( = ?auto_32882 ?auto_32881 ) ) ( AVAILABLE ?auto_32881 ) ( SURFACE-AT ?auto_32879 ?auto_32884 ) ( ON ?auto_32879 ?auto_32880 ) ( CLEAR ?auto_32879 ) ( not ( = ?auto_32878 ?auto_32880 ) ) ( not ( = ?auto_32879 ?auto_32880 ) ) ( not ( = ?auto_32877 ?auto_32880 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32878 ?auto_32879 )
      ( MAKE-2CRATE-VERIFY ?auto_32877 ?auto_32878 ?auto_32879 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32886 - SURFACE
      ?auto_32887 - SURFACE
      ?auto_32888 - SURFACE
      ?auto_32889 - SURFACE
    )
    :vars
    (
      ?auto_32892 - HOIST
      ?auto_32890 - PLACE
      ?auto_32895 - TRUCK
      ?auto_32893 - PLACE
      ?auto_32894 - HOIST
      ?auto_32891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32892 ?auto_32890 ) ( SURFACE-AT ?auto_32888 ?auto_32890 ) ( CLEAR ?auto_32888 ) ( IS-CRATE ?auto_32889 ) ( not ( = ?auto_32888 ?auto_32889 ) ) ( AVAILABLE ?auto_32892 ) ( ON ?auto_32888 ?auto_32887 ) ( not ( = ?auto_32887 ?auto_32888 ) ) ( not ( = ?auto_32887 ?auto_32889 ) ) ( TRUCK-AT ?auto_32895 ?auto_32893 ) ( not ( = ?auto_32893 ?auto_32890 ) ) ( HOIST-AT ?auto_32894 ?auto_32893 ) ( not ( = ?auto_32892 ?auto_32894 ) ) ( AVAILABLE ?auto_32894 ) ( SURFACE-AT ?auto_32889 ?auto_32893 ) ( ON ?auto_32889 ?auto_32891 ) ( CLEAR ?auto_32889 ) ( not ( = ?auto_32888 ?auto_32891 ) ) ( not ( = ?auto_32889 ?auto_32891 ) ) ( not ( = ?auto_32887 ?auto_32891 ) ) ( ON ?auto_32887 ?auto_32886 ) ( not ( = ?auto_32886 ?auto_32887 ) ) ( not ( = ?auto_32886 ?auto_32888 ) ) ( not ( = ?auto_32886 ?auto_32889 ) ) ( not ( = ?auto_32886 ?auto_32891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32887 ?auto_32888 ?auto_32889 )
      ( MAKE-3CRATE-VERIFY ?auto_32886 ?auto_32887 ?auto_32888 ?auto_32889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32896 - SURFACE
      ?auto_32897 - SURFACE
    )
    :vars
    (
      ?auto_32900 - HOIST
      ?auto_32898 - PLACE
      ?auto_32904 - SURFACE
      ?auto_32901 - PLACE
      ?auto_32902 - HOIST
      ?auto_32899 - SURFACE
      ?auto_32903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32900 ?auto_32898 ) ( SURFACE-AT ?auto_32896 ?auto_32898 ) ( CLEAR ?auto_32896 ) ( IS-CRATE ?auto_32897 ) ( not ( = ?auto_32896 ?auto_32897 ) ) ( AVAILABLE ?auto_32900 ) ( ON ?auto_32896 ?auto_32904 ) ( not ( = ?auto_32904 ?auto_32896 ) ) ( not ( = ?auto_32904 ?auto_32897 ) ) ( not ( = ?auto_32901 ?auto_32898 ) ) ( HOIST-AT ?auto_32902 ?auto_32901 ) ( not ( = ?auto_32900 ?auto_32902 ) ) ( AVAILABLE ?auto_32902 ) ( SURFACE-AT ?auto_32897 ?auto_32901 ) ( ON ?auto_32897 ?auto_32899 ) ( CLEAR ?auto_32897 ) ( not ( = ?auto_32896 ?auto_32899 ) ) ( not ( = ?auto_32897 ?auto_32899 ) ) ( not ( = ?auto_32904 ?auto_32899 ) ) ( TRUCK-AT ?auto_32903 ?auto_32898 ) )
    :subtasks
    ( ( !DRIVE ?auto_32903 ?auto_32898 ?auto_32901 )
      ( MAKE-2CRATE ?auto_32904 ?auto_32896 ?auto_32897 )
      ( MAKE-1CRATE-VERIFY ?auto_32896 ?auto_32897 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32905 - SURFACE
      ?auto_32906 - SURFACE
      ?auto_32907 - SURFACE
    )
    :vars
    (
      ?auto_32913 - HOIST
      ?auto_32908 - PLACE
      ?auto_32909 - PLACE
      ?auto_32912 - HOIST
      ?auto_32910 - SURFACE
      ?auto_32911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32913 ?auto_32908 ) ( SURFACE-AT ?auto_32906 ?auto_32908 ) ( CLEAR ?auto_32906 ) ( IS-CRATE ?auto_32907 ) ( not ( = ?auto_32906 ?auto_32907 ) ) ( AVAILABLE ?auto_32913 ) ( ON ?auto_32906 ?auto_32905 ) ( not ( = ?auto_32905 ?auto_32906 ) ) ( not ( = ?auto_32905 ?auto_32907 ) ) ( not ( = ?auto_32909 ?auto_32908 ) ) ( HOIST-AT ?auto_32912 ?auto_32909 ) ( not ( = ?auto_32913 ?auto_32912 ) ) ( AVAILABLE ?auto_32912 ) ( SURFACE-AT ?auto_32907 ?auto_32909 ) ( ON ?auto_32907 ?auto_32910 ) ( CLEAR ?auto_32907 ) ( not ( = ?auto_32906 ?auto_32910 ) ) ( not ( = ?auto_32907 ?auto_32910 ) ) ( not ( = ?auto_32905 ?auto_32910 ) ) ( TRUCK-AT ?auto_32911 ?auto_32908 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32906 ?auto_32907 )
      ( MAKE-2CRATE-VERIFY ?auto_32905 ?auto_32906 ?auto_32907 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32914 - SURFACE
      ?auto_32915 - SURFACE
      ?auto_32916 - SURFACE
      ?auto_32917 - SURFACE
    )
    :vars
    (
      ?auto_32921 - HOIST
      ?auto_32923 - PLACE
      ?auto_32919 - PLACE
      ?auto_32922 - HOIST
      ?auto_32920 - SURFACE
      ?auto_32918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32921 ?auto_32923 ) ( SURFACE-AT ?auto_32916 ?auto_32923 ) ( CLEAR ?auto_32916 ) ( IS-CRATE ?auto_32917 ) ( not ( = ?auto_32916 ?auto_32917 ) ) ( AVAILABLE ?auto_32921 ) ( ON ?auto_32916 ?auto_32915 ) ( not ( = ?auto_32915 ?auto_32916 ) ) ( not ( = ?auto_32915 ?auto_32917 ) ) ( not ( = ?auto_32919 ?auto_32923 ) ) ( HOIST-AT ?auto_32922 ?auto_32919 ) ( not ( = ?auto_32921 ?auto_32922 ) ) ( AVAILABLE ?auto_32922 ) ( SURFACE-AT ?auto_32917 ?auto_32919 ) ( ON ?auto_32917 ?auto_32920 ) ( CLEAR ?auto_32917 ) ( not ( = ?auto_32916 ?auto_32920 ) ) ( not ( = ?auto_32917 ?auto_32920 ) ) ( not ( = ?auto_32915 ?auto_32920 ) ) ( TRUCK-AT ?auto_32918 ?auto_32923 ) ( ON ?auto_32915 ?auto_32914 ) ( not ( = ?auto_32914 ?auto_32915 ) ) ( not ( = ?auto_32914 ?auto_32916 ) ) ( not ( = ?auto_32914 ?auto_32917 ) ) ( not ( = ?auto_32914 ?auto_32920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32915 ?auto_32916 ?auto_32917 )
      ( MAKE-3CRATE-VERIFY ?auto_32914 ?auto_32915 ?auto_32916 ?auto_32917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32924 - SURFACE
      ?auto_32925 - SURFACE
    )
    :vars
    (
      ?auto_32930 - HOIST
      ?auto_32932 - PLACE
      ?auto_32929 - SURFACE
      ?auto_32927 - PLACE
      ?auto_32931 - HOIST
      ?auto_32928 - SURFACE
      ?auto_32926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32930 ?auto_32932 ) ( IS-CRATE ?auto_32925 ) ( not ( = ?auto_32924 ?auto_32925 ) ) ( not ( = ?auto_32929 ?auto_32924 ) ) ( not ( = ?auto_32929 ?auto_32925 ) ) ( not ( = ?auto_32927 ?auto_32932 ) ) ( HOIST-AT ?auto_32931 ?auto_32927 ) ( not ( = ?auto_32930 ?auto_32931 ) ) ( AVAILABLE ?auto_32931 ) ( SURFACE-AT ?auto_32925 ?auto_32927 ) ( ON ?auto_32925 ?auto_32928 ) ( CLEAR ?auto_32925 ) ( not ( = ?auto_32924 ?auto_32928 ) ) ( not ( = ?auto_32925 ?auto_32928 ) ) ( not ( = ?auto_32929 ?auto_32928 ) ) ( TRUCK-AT ?auto_32926 ?auto_32932 ) ( SURFACE-AT ?auto_32929 ?auto_32932 ) ( CLEAR ?auto_32929 ) ( LIFTING ?auto_32930 ?auto_32924 ) ( IS-CRATE ?auto_32924 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32929 ?auto_32924 )
      ( MAKE-2CRATE ?auto_32929 ?auto_32924 ?auto_32925 )
      ( MAKE-1CRATE-VERIFY ?auto_32924 ?auto_32925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32933 - SURFACE
      ?auto_32934 - SURFACE
      ?auto_32935 - SURFACE
    )
    :vars
    (
      ?auto_32938 - HOIST
      ?auto_32937 - PLACE
      ?auto_32940 - PLACE
      ?auto_32936 - HOIST
      ?auto_32941 - SURFACE
      ?auto_32939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32938 ?auto_32937 ) ( IS-CRATE ?auto_32935 ) ( not ( = ?auto_32934 ?auto_32935 ) ) ( not ( = ?auto_32933 ?auto_32934 ) ) ( not ( = ?auto_32933 ?auto_32935 ) ) ( not ( = ?auto_32940 ?auto_32937 ) ) ( HOIST-AT ?auto_32936 ?auto_32940 ) ( not ( = ?auto_32938 ?auto_32936 ) ) ( AVAILABLE ?auto_32936 ) ( SURFACE-AT ?auto_32935 ?auto_32940 ) ( ON ?auto_32935 ?auto_32941 ) ( CLEAR ?auto_32935 ) ( not ( = ?auto_32934 ?auto_32941 ) ) ( not ( = ?auto_32935 ?auto_32941 ) ) ( not ( = ?auto_32933 ?auto_32941 ) ) ( TRUCK-AT ?auto_32939 ?auto_32937 ) ( SURFACE-AT ?auto_32933 ?auto_32937 ) ( CLEAR ?auto_32933 ) ( LIFTING ?auto_32938 ?auto_32934 ) ( IS-CRATE ?auto_32934 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32934 ?auto_32935 )
      ( MAKE-2CRATE-VERIFY ?auto_32933 ?auto_32934 ?auto_32935 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32942 - SURFACE
      ?auto_32943 - SURFACE
      ?auto_32944 - SURFACE
      ?auto_32945 - SURFACE
    )
    :vars
    (
      ?auto_32946 - HOIST
      ?auto_32950 - PLACE
      ?auto_32947 - PLACE
      ?auto_32949 - HOIST
      ?auto_32948 - SURFACE
      ?auto_32951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32946 ?auto_32950 ) ( IS-CRATE ?auto_32945 ) ( not ( = ?auto_32944 ?auto_32945 ) ) ( not ( = ?auto_32943 ?auto_32944 ) ) ( not ( = ?auto_32943 ?auto_32945 ) ) ( not ( = ?auto_32947 ?auto_32950 ) ) ( HOIST-AT ?auto_32949 ?auto_32947 ) ( not ( = ?auto_32946 ?auto_32949 ) ) ( AVAILABLE ?auto_32949 ) ( SURFACE-AT ?auto_32945 ?auto_32947 ) ( ON ?auto_32945 ?auto_32948 ) ( CLEAR ?auto_32945 ) ( not ( = ?auto_32944 ?auto_32948 ) ) ( not ( = ?auto_32945 ?auto_32948 ) ) ( not ( = ?auto_32943 ?auto_32948 ) ) ( TRUCK-AT ?auto_32951 ?auto_32950 ) ( SURFACE-AT ?auto_32943 ?auto_32950 ) ( CLEAR ?auto_32943 ) ( LIFTING ?auto_32946 ?auto_32944 ) ( IS-CRATE ?auto_32944 ) ( ON ?auto_32943 ?auto_32942 ) ( not ( = ?auto_32942 ?auto_32943 ) ) ( not ( = ?auto_32942 ?auto_32944 ) ) ( not ( = ?auto_32942 ?auto_32945 ) ) ( not ( = ?auto_32942 ?auto_32948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32943 ?auto_32944 ?auto_32945 )
      ( MAKE-3CRATE-VERIFY ?auto_32942 ?auto_32943 ?auto_32944 ?auto_32945 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32952 - SURFACE
      ?auto_32953 - SURFACE
    )
    :vars
    (
      ?auto_32954 - HOIST
      ?auto_32959 - PLACE
      ?auto_32957 - SURFACE
      ?auto_32955 - PLACE
      ?auto_32958 - HOIST
      ?auto_32956 - SURFACE
      ?auto_32960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32954 ?auto_32959 ) ( IS-CRATE ?auto_32953 ) ( not ( = ?auto_32952 ?auto_32953 ) ) ( not ( = ?auto_32957 ?auto_32952 ) ) ( not ( = ?auto_32957 ?auto_32953 ) ) ( not ( = ?auto_32955 ?auto_32959 ) ) ( HOIST-AT ?auto_32958 ?auto_32955 ) ( not ( = ?auto_32954 ?auto_32958 ) ) ( AVAILABLE ?auto_32958 ) ( SURFACE-AT ?auto_32953 ?auto_32955 ) ( ON ?auto_32953 ?auto_32956 ) ( CLEAR ?auto_32953 ) ( not ( = ?auto_32952 ?auto_32956 ) ) ( not ( = ?auto_32953 ?auto_32956 ) ) ( not ( = ?auto_32957 ?auto_32956 ) ) ( TRUCK-AT ?auto_32960 ?auto_32959 ) ( SURFACE-AT ?auto_32957 ?auto_32959 ) ( CLEAR ?auto_32957 ) ( IS-CRATE ?auto_32952 ) ( AVAILABLE ?auto_32954 ) ( IN ?auto_32952 ?auto_32960 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32954 ?auto_32952 ?auto_32960 ?auto_32959 )
      ( MAKE-2CRATE ?auto_32957 ?auto_32952 ?auto_32953 )
      ( MAKE-1CRATE-VERIFY ?auto_32952 ?auto_32953 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32961 - SURFACE
      ?auto_32962 - SURFACE
      ?auto_32963 - SURFACE
    )
    :vars
    (
      ?auto_32966 - HOIST
      ?auto_32965 - PLACE
      ?auto_32964 - PLACE
      ?auto_32968 - HOIST
      ?auto_32969 - SURFACE
      ?auto_32967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32966 ?auto_32965 ) ( IS-CRATE ?auto_32963 ) ( not ( = ?auto_32962 ?auto_32963 ) ) ( not ( = ?auto_32961 ?auto_32962 ) ) ( not ( = ?auto_32961 ?auto_32963 ) ) ( not ( = ?auto_32964 ?auto_32965 ) ) ( HOIST-AT ?auto_32968 ?auto_32964 ) ( not ( = ?auto_32966 ?auto_32968 ) ) ( AVAILABLE ?auto_32968 ) ( SURFACE-AT ?auto_32963 ?auto_32964 ) ( ON ?auto_32963 ?auto_32969 ) ( CLEAR ?auto_32963 ) ( not ( = ?auto_32962 ?auto_32969 ) ) ( not ( = ?auto_32963 ?auto_32969 ) ) ( not ( = ?auto_32961 ?auto_32969 ) ) ( TRUCK-AT ?auto_32967 ?auto_32965 ) ( SURFACE-AT ?auto_32961 ?auto_32965 ) ( CLEAR ?auto_32961 ) ( IS-CRATE ?auto_32962 ) ( AVAILABLE ?auto_32966 ) ( IN ?auto_32962 ?auto_32967 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32962 ?auto_32963 )
      ( MAKE-2CRATE-VERIFY ?auto_32961 ?auto_32962 ?auto_32963 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_32970 - SURFACE
      ?auto_32971 - SURFACE
      ?auto_32972 - SURFACE
      ?auto_32973 - SURFACE
    )
    :vars
    (
      ?auto_32974 - HOIST
      ?auto_32976 - PLACE
      ?auto_32978 - PLACE
      ?auto_32975 - HOIST
      ?auto_32977 - SURFACE
      ?auto_32979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32974 ?auto_32976 ) ( IS-CRATE ?auto_32973 ) ( not ( = ?auto_32972 ?auto_32973 ) ) ( not ( = ?auto_32971 ?auto_32972 ) ) ( not ( = ?auto_32971 ?auto_32973 ) ) ( not ( = ?auto_32978 ?auto_32976 ) ) ( HOIST-AT ?auto_32975 ?auto_32978 ) ( not ( = ?auto_32974 ?auto_32975 ) ) ( AVAILABLE ?auto_32975 ) ( SURFACE-AT ?auto_32973 ?auto_32978 ) ( ON ?auto_32973 ?auto_32977 ) ( CLEAR ?auto_32973 ) ( not ( = ?auto_32972 ?auto_32977 ) ) ( not ( = ?auto_32973 ?auto_32977 ) ) ( not ( = ?auto_32971 ?auto_32977 ) ) ( TRUCK-AT ?auto_32979 ?auto_32976 ) ( SURFACE-AT ?auto_32971 ?auto_32976 ) ( CLEAR ?auto_32971 ) ( IS-CRATE ?auto_32972 ) ( AVAILABLE ?auto_32974 ) ( IN ?auto_32972 ?auto_32979 ) ( ON ?auto_32971 ?auto_32970 ) ( not ( = ?auto_32970 ?auto_32971 ) ) ( not ( = ?auto_32970 ?auto_32972 ) ) ( not ( = ?auto_32970 ?auto_32973 ) ) ( not ( = ?auto_32970 ?auto_32977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_32971 ?auto_32972 ?auto_32973 )
      ( MAKE-3CRATE-VERIFY ?auto_32970 ?auto_32971 ?auto_32972 ?auto_32973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32980 - SURFACE
      ?auto_32981 - SURFACE
    )
    :vars
    (
      ?auto_32982 - HOIST
      ?auto_32984 - PLACE
      ?auto_32987 - SURFACE
      ?auto_32986 - PLACE
      ?auto_32983 - HOIST
      ?auto_32985 - SURFACE
      ?auto_32988 - TRUCK
      ?auto_32989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32982 ?auto_32984 ) ( IS-CRATE ?auto_32981 ) ( not ( = ?auto_32980 ?auto_32981 ) ) ( not ( = ?auto_32987 ?auto_32980 ) ) ( not ( = ?auto_32987 ?auto_32981 ) ) ( not ( = ?auto_32986 ?auto_32984 ) ) ( HOIST-AT ?auto_32983 ?auto_32986 ) ( not ( = ?auto_32982 ?auto_32983 ) ) ( AVAILABLE ?auto_32983 ) ( SURFACE-AT ?auto_32981 ?auto_32986 ) ( ON ?auto_32981 ?auto_32985 ) ( CLEAR ?auto_32981 ) ( not ( = ?auto_32980 ?auto_32985 ) ) ( not ( = ?auto_32981 ?auto_32985 ) ) ( not ( = ?auto_32987 ?auto_32985 ) ) ( SURFACE-AT ?auto_32987 ?auto_32984 ) ( CLEAR ?auto_32987 ) ( IS-CRATE ?auto_32980 ) ( AVAILABLE ?auto_32982 ) ( IN ?auto_32980 ?auto_32988 ) ( TRUCK-AT ?auto_32988 ?auto_32989 ) ( not ( = ?auto_32989 ?auto_32984 ) ) ( not ( = ?auto_32986 ?auto_32989 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32988 ?auto_32989 ?auto_32984 )
      ( MAKE-2CRATE ?auto_32987 ?auto_32980 ?auto_32981 )
      ( MAKE-1CRATE-VERIFY ?auto_32980 ?auto_32981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_32990 - SURFACE
      ?auto_32991 - SURFACE
      ?auto_32992 - SURFACE
    )
    :vars
    (
      ?auto_32994 - HOIST
      ?auto_32993 - PLACE
      ?auto_32997 - PLACE
      ?auto_32998 - HOIST
      ?auto_32995 - SURFACE
      ?auto_32999 - TRUCK
      ?auto_32996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32994 ?auto_32993 ) ( IS-CRATE ?auto_32992 ) ( not ( = ?auto_32991 ?auto_32992 ) ) ( not ( = ?auto_32990 ?auto_32991 ) ) ( not ( = ?auto_32990 ?auto_32992 ) ) ( not ( = ?auto_32997 ?auto_32993 ) ) ( HOIST-AT ?auto_32998 ?auto_32997 ) ( not ( = ?auto_32994 ?auto_32998 ) ) ( AVAILABLE ?auto_32998 ) ( SURFACE-AT ?auto_32992 ?auto_32997 ) ( ON ?auto_32992 ?auto_32995 ) ( CLEAR ?auto_32992 ) ( not ( = ?auto_32991 ?auto_32995 ) ) ( not ( = ?auto_32992 ?auto_32995 ) ) ( not ( = ?auto_32990 ?auto_32995 ) ) ( SURFACE-AT ?auto_32990 ?auto_32993 ) ( CLEAR ?auto_32990 ) ( IS-CRATE ?auto_32991 ) ( AVAILABLE ?auto_32994 ) ( IN ?auto_32991 ?auto_32999 ) ( TRUCK-AT ?auto_32999 ?auto_32996 ) ( not ( = ?auto_32996 ?auto_32993 ) ) ( not ( = ?auto_32997 ?auto_32996 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_32991 ?auto_32992 )
      ( MAKE-2CRATE-VERIFY ?auto_32990 ?auto_32991 ?auto_32992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33000 - SURFACE
      ?auto_33001 - SURFACE
      ?auto_33002 - SURFACE
      ?auto_33003 - SURFACE
    )
    :vars
    (
      ?auto_33006 - HOIST
      ?auto_33004 - PLACE
      ?auto_33009 - PLACE
      ?auto_33008 - HOIST
      ?auto_33007 - SURFACE
      ?auto_33010 - TRUCK
      ?auto_33005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33006 ?auto_33004 ) ( IS-CRATE ?auto_33003 ) ( not ( = ?auto_33002 ?auto_33003 ) ) ( not ( = ?auto_33001 ?auto_33002 ) ) ( not ( = ?auto_33001 ?auto_33003 ) ) ( not ( = ?auto_33009 ?auto_33004 ) ) ( HOIST-AT ?auto_33008 ?auto_33009 ) ( not ( = ?auto_33006 ?auto_33008 ) ) ( AVAILABLE ?auto_33008 ) ( SURFACE-AT ?auto_33003 ?auto_33009 ) ( ON ?auto_33003 ?auto_33007 ) ( CLEAR ?auto_33003 ) ( not ( = ?auto_33002 ?auto_33007 ) ) ( not ( = ?auto_33003 ?auto_33007 ) ) ( not ( = ?auto_33001 ?auto_33007 ) ) ( SURFACE-AT ?auto_33001 ?auto_33004 ) ( CLEAR ?auto_33001 ) ( IS-CRATE ?auto_33002 ) ( AVAILABLE ?auto_33006 ) ( IN ?auto_33002 ?auto_33010 ) ( TRUCK-AT ?auto_33010 ?auto_33005 ) ( not ( = ?auto_33005 ?auto_33004 ) ) ( not ( = ?auto_33009 ?auto_33005 ) ) ( ON ?auto_33001 ?auto_33000 ) ( not ( = ?auto_33000 ?auto_33001 ) ) ( not ( = ?auto_33000 ?auto_33002 ) ) ( not ( = ?auto_33000 ?auto_33003 ) ) ( not ( = ?auto_33000 ?auto_33007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33001 ?auto_33002 ?auto_33003 )
      ( MAKE-3CRATE-VERIFY ?auto_33000 ?auto_33001 ?auto_33002 ?auto_33003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33011 - SURFACE
      ?auto_33012 - SURFACE
    )
    :vars
    (
      ?auto_33015 - HOIST
      ?auto_33013 - PLACE
      ?auto_33019 - SURFACE
      ?auto_33018 - PLACE
      ?auto_33017 - HOIST
      ?auto_33016 - SURFACE
      ?auto_33020 - TRUCK
      ?auto_33014 - PLACE
      ?auto_33021 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33015 ?auto_33013 ) ( IS-CRATE ?auto_33012 ) ( not ( = ?auto_33011 ?auto_33012 ) ) ( not ( = ?auto_33019 ?auto_33011 ) ) ( not ( = ?auto_33019 ?auto_33012 ) ) ( not ( = ?auto_33018 ?auto_33013 ) ) ( HOIST-AT ?auto_33017 ?auto_33018 ) ( not ( = ?auto_33015 ?auto_33017 ) ) ( AVAILABLE ?auto_33017 ) ( SURFACE-AT ?auto_33012 ?auto_33018 ) ( ON ?auto_33012 ?auto_33016 ) ( CLEAR ?auto_33012 ) ( not ( = ?auto_33011 ?auto_33016 ) ) ( not ( = ?auto_33012 ?auto_33016 ) ) ( not ( = ?auto_33019 ?auto_33016 ) ) ( SURFACE-AT ?auto_33019 ?auto_33013 ) ( CLEAR ?auto_33019 ) ( IS-CRATE ?auto_33011 ) ( AVAILABLE ?auto_33015 ) ( TRUCK-AT ?auto_33020 ?auto_33014 ) ( not ( = ?auto_33014 ?auto_33013 ) ) ( not ( = ?auto_33018 ?auto_33014 ) ) ( HOIST-AT ?auto_33021 ?auto_33014 ) ( LIFTING ?auto_33021 ?auto_33011 ) ( not ( = ?auto_33015 ?auto_33021 ) ) ( not ( = ?auto_33017 ?auto_33021 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33021 ?auto_33011 ?auto_33020 ?auto_33014 )
      ( MAKE-2CRATE ?auto_33019 ?auto_33011 ?auto_33012 )
      ( MAKE-1CRATE-VERIFY ?auto_33011 ?auto_33012 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33022 - SURFACE
      ?auto_33023 - SURFACE
      ?auto_33024 - SURFACE
    )
    :vars
    (
      ?auto_33025 - HOIST
      ?auto_33028 - PLACE
      ?auto_33031 - PLACE
      ?auto_33032 - HOIST
      ?auto_33029 - SURFACE
      ?auto_33030 - TRUCK
      ?auto_33027 - PLACE
      ?auto_33026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33025 ?auto_33028 ) ( IS-CRATE ?auto_33024 ) ( not ( = ?auto_33023 ?auto_33024 ) ) ( not ( = ?auto_33022 ?auto_33023 ) ) ( not ( = ?auto_33022 ?auto_33024 ) ) ( not ( = ?auto_33031 ?auto_33028 ) ) ( HOIST-AT ?auto_33032 ?auto_33031 ) ( not ( = ?auto_33025 ?auto_33032 ) ) ( AVAILABLE ?auto_33032 ) ( SURFACE-AT ?auto_33024 ?auto_33031 ) ( ON ?auto_33024 ?auto_33029 ) ( CLEAR ?auto_33024 ) ( not ( = ?auto_33023 ?auto_33029 ) ) ( not ( = ?auto_33024 ?auto_33029 ) ) ( not ( = ?auto_33022 ?auto_33029 ) ) ( SURFACE-AT ?auto_33022 ?auto_33028 ) ( CLEAR ?auto_33022 ) ( IS-CRATE ?auto_33023 ) ( AVAILABLE ?auto_33025 ) ( TRUCK-AT ?auto_33030 ?auto_33027 ) ( not ( = ?auto_33027 ?auto_33028 ) ) ( not ( = ?auto_33031 ?auto_33027 ) ) ( HOIST-AT ?auto_33026 ?auto_33027 ) ( LIFTING ?auto_33026 ?auto_33023 ) ( not ( = ?auto_33025 ?auto_33026 ) ) ( not ( = ?auto_33032 ?auto_33026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33023 ?auto_33024 )
      ( MAKE-2CRATE-VERIFY ?auto_33022 ?auto_33023 ?auto_33024 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33033 - SURFACE
      ?auto_33034 - SURFACE
      ?auto_33035 - SURFACE
      ?auto_33036 - SURFACE
    )
    :vars
    (
      ?auto_33038 - HOIST
      ?auto_33042 - PLACE
      ?auto_33044 - PLACE
      ?auto_33041 - HOIST
      ?auto_33037 - SURFACE
      ?auto_33043 - TRUCK
      ?auto_33040 - PLACE
      ?auto_33039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33038 ?auto_33042 ) ( IS-CRATE ?auto_33036 ) ( not ( = ?auto_33035 ?auto_33036 ) ) ( not ( = ?auto_33034 ?auto_33035 ) ) ( not ( = ?auto_33034 ?auto_33036 ) ) ( not ( = ?auto_33044 ?auto_33042 ) ) ( HOIST-AT ?auto_33041 ?auto_33044 ) ( not ( = ?auto_33038 ?auto_33041 ) ) ( AVAILABLE ?auto_33041 ) ( SURFACE-AT ?auto_33036 ?auto_33044 ) ( ON ?auto_33036 ?auto_33037 ) ( CLEAR ?auto_33036 ) ( not ( = ?auto_33035 ?auto_33037 ) ) ( not ( = ?auto_33036 ?auto_33037 ) ) ( not ( = ?auto_33034 ?auto_33037 ) ) ( SURFACE-AT ?auto_33034 ?auto_33042 ) ( CLEAR ?auto_33034 ) ( IS-CRATE ?auto_33035 ) ( AVAILABLE ?auto_33038 ) ( TRUCK-AT ?auto_33043 ?auto_33040 ) ( not ( = ?auto_33040 ?auto_33042 ) ) ( not ( = ?auto_33044 ?auto_33040 ) ) ( HOIST-AT ?auto_33039 ?auto_33040 ) ( LIFTING ?auto_33039 ?auto_33035 ) ( not ( = ?auto_33038 ?auto_33039 ) ) ( not ( = ?auto_33041 ?auto_33039 ) ) ( ON ?auto_33034 ?auto_33033 ) ( not ( = ?auto_33033 ?auto_33034 ) ) ( not ( = ?auto_33033 ?auto_33035 ) ) ( not ( = ?auto_33033 ?auto_33036 ) ) ( not ( = ?auto_33033 ?auto_33037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33034 ?auto_33035 ?auto_33036 )
      ( MAKE-3CRATE-VERIFY ?auto_33033 ?auto_33034 ?auto_33035 ?auto_33036 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33045 - SURFACE
      ?auto_33046 - SURFACE
    )
    :vars
    (
      ?auto_33049 - HOIST
      ?auto_33053 - PLACE
      ?auto_33047 - SURFACE
      ?auto_33055 - PLACE
      ?auto_33052 - HOIST
      ?auto_33048 - SURFACE
      ?auto_33054 - TRUCK
      ?auto_33051 - PLACE
      ?auto_33050 - HOIST
      ?auto_33056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33049 ?auto_33053 ) ( IS-CRATE ?auto_33046 ) ( not ( = ?auto_33045 ?auto_33046 ) ) ( not ( = ?auto_33047 ?auto_33045 ) ) ( not ( = ?auto_33047 ?auto_33046 ) ) ( not ( = ?auto_33055 ?auto_33053 ) ) ( HOIST-AT ?auto_33052 ?auto_33055 ) ( not ( = ?auto_33049 ?auto_33052 ) ) ( AVAILABLE ?auto_33052 ) ( SURFACE-AT ?auto_33046 ?auto_33055 ) ( ON ?auto_33046 ?auto_33048 ) ( CLEAR ?auto_33046 ) ( not ( = ?auto_33045 ?auto_33048 ) ) ( not ( = ?auto_33046 ?auto_33048 ) ) ( not ( = ?auto_33047 ?auto_33048 ) ) ( SURFACE-AT ?auto_33047 ?auto_33053 ) ( CLEAR ?auto_33047 ) ( IS-CRATE ?auto_33045 ) ( AVAILABLE ?auto_33049 ) ( TRUCK-AT ?auto_33054 ?auto_33051 ) ( not ( = ?auto_33051 ?auto_33053 ) ) ( not ( = ?auto_33055 ?auto_33051 ) ) ( HOIST-AT ?auto_33050 ?auto_33051 ) ( not ( = ?auto_33049 ?auto_33050 ) ) ( not ( = ?auto_33052 ?auto_33050 ) ) ( AVAILABLE ?auto_33050 ) ( SURFACE-AT ?auto_33045 ?auto_33051 ) ( ON ?auto_33045 ?auto_33056 ) ( CLEAR ?auto_33045 ) ( not ( = ?auto_33045 ?auto_33056 ) ) ( not ( = ?auto_33046 ?auto_33056 ) ) ( not ( = ?auto_33047 ?auto_33056 ) ) ( not ( = ?auto_33048 ?auto_33056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33050 ?auto_33045 ?auto_33056 ?auto_33051 )
      ( MAKE-2CRATE ?auto_33047 ?auto_33045 ?auto_33046 )
      ( MAKE-1CRATE-VERIFY ?auto_33045 ?auto_33046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33057 - SURFACE
      ?auto_33058 - SURFACE
      ?auto_33059 - SURFACE
    )
    :vars
    (
      ?auto_33062 - HOIST
      ?auto_33063 - PLACE
      ?auto_33060 - PLACE
      ?auto_33067 - HOIST
      ?auto_33068 - SURFACE
      ?auto_33065 - TRUCK
      ?auto_33064 - PLACE
      ?auto_33066 - HOIST
      ?auto_33061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33062 ?auto_33063 ) ( IS-CRATE ?auto_33059 ) ( not ( = ?auto_33058 ?auto_33059 ) ) ( not ( = ?auto_33057 ?auto_33058 ) ) ( not ( = ?auto_33057 ?auto_33059 ) ) ( not ( = ?auto_33060 ?auto_33063 ) ) ( HOIST-AT ?auto_33067 ?auto_33060 ) ( not ( = ?auto_33062 ?auto_33067 ) ) ( AVAILABLE ?auto_33067 ) ( SURFACE-AT ?auto_33059 ?auto_33060 ) ( ON ?auto_33059 ?auto_33068 ) ( CLEAR ?auto_33059 ) ( not ( = ?auto_33058 ?auto_33068 ) ) ( not ( = ?auto_33059 ?auto_33068 ) ) ( not ( = ?auto_33057 ?auto_33068 ) ) ( SURFACE-AT ?auto_33057 ?auto_33063 ) ( CLEAR ?auto_33057 ) ( IS-CRATE ?auto_33058 ) ( AVAILABLE ?auto_33062 ) ( TRUCK-AT ?auto_33065 ?auto_33064 ) ( not ( = ?auto_33064 ?auto_33063 ) ) ( not ( = ?auto_33060 ?auto_33064 ) ) ( HOIST-AT ?auto_33066 ?auto_33064 ) ( not ( = ?auto_33062 ?auto_33066 ) ) ( not ( = ?auto_33067 ?auto_33066 ) ) ( AVAILABLE ?auto_33066 ) ( SURFACE-AT ?auto_33058 ?auto_33064 ) ( ON ?auto_33058 ?auto_33061 ) ( CLEAR ?auto_33058 ) ( not ( = ?auto_33058 ?auto_33061 ) ) ( not ( = ?auto_33059 ?auto_33061 ) ) ( not ( = ?auto_33057 ?auto_33061 ) ) ( not ( = ?auto_33068 ?auto_33061 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33058 ?auto_33059 )
      ( MAKE-2CRATE-VERIFY ?auto_33057 ?auto_33058 ?auto_33059 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33069 - SURFACE
      ?auto_33070 - SURFACE
      ?auto_33071 - SURFACE
      ?auto_33072 - SURFACE
    )
    :vars
    (
      ?auto_33081 - HOIST
      ?auto_33076 - PLACE
      ?auto_33079 - PLACE
      ?auto_33075 - HOIST
      ?auto_33077 - SURFACE
      ?auto_33073 - TRUCK
      ?auto_33078 - PLACE
      ?auto_33074 - HOIST
      ?auto_33080 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33081 ?auto_33076 ) ( IS-CRATE ?auto_33072 ) ( not ( = ?auto_33071 ?auto_33072 ) ) ( not ( = ?auto_33070 ?auto_33071 ) ) ( not ( = ?auto_33070 ?auto_33072 ) ) ( not ( = ?auto_33079 ?auto_33076 ) ) ( HOIST-AT ?auto_33075 ?auto_33079 ) ( not ( = ?auto_33081 ?auto_33075 ) ) ( AVAILABLE ?auto_33075 ) ( SURFACE-AT ?auto_33072 ?auto_33079 ) ( ON ?auto_33072 ?auto_33077 ) ( CLEAR ?auto_33072 ) ( not ( = ?auto_33071 ?auto_33077 ) ) ( not ( = ?auto_33072 ?auto_33077 ) ) ( not ( = ?auto_33070 ?auto_33077 ) ) ( SURFACE-AT ?auto_33070 ?auto_33076 ) ( CLEAR ?auto_33070 ) ( IS-CRATE ?auto_33071 ) ( AVAILABLE ?auto_33081 ) ( TRUCK-AT ?auto_33073 ?auto_33078 ) ( not ( = ?auto_33078 ?auto_33076 ) ) ( not ( = ?auto_33079 ?auto_33078 ) ) ( HOIST-AT ?auto_33074 ?auto_33078 ) ( not ( = ?auto_33081 ?auto_33074 ) ) ( not ( = ?auto_33075 ?auto_33074 ) ) ( AVAILABLE ?auto_33074 ) ( SURFACE-AT ?auto_33071 ?auto_33078 ) ( ON ?auto_33071 ?auto_33080 ) ( CLEAR ?auto_33071 ) ( not ( = ?auto_33071 ?auto_33080 ) ) ( not ( = ?auto_33072 ?auto_33080 ) ) ( not ( = ?auto_33070 ?auto_33080 ) ) ( not ( = ?auto_33077 ?auto_33080 ) ) ( ON ?auto_33070 ?auto_33069 ) ( not ( = ?auto_33069 ?auto_33070 ) ) ( not ( = ?auto_33069 ?auto_33071 ) ) ( not ( = ?auto_33069 ?auto_33072 ) ) ( not ( = ?auto_33069 ?auto_33077 ) ) ( not ( = ?auto_33069 ?auto_33080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33070 ?auto_33071 ?auto_33072 )
      ( MAKE-3CRATE-VERIFY ?auto_33069 ?auto_33070 ?auto_33071 ?auto_33072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33082 - SURFACE
      ?auto_33083 - SURFACE
    )
    :vars
    (
      ?auto_33093 - HOIST
      ?auto_33087 - PLACE
      ?auto_33089 - SURFACE
      ?auto_33091 - PLACE
      ?auto_33086 - HOIST
      ?auto_33088 - SURFACE
      ?auto_33090 - PLACE
      ?auto_33085 - HOIST
      ?auto_33092 - SURFACE
      ?auto_33084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33093 ?auto_33087 ) ( IS-CRATE ?auto_33083 ) ( not ( = ?auto_33082 ?auto_33083 ) ) ( not ( = ?auto_33089 ?auto_33082 ) ) ( not ( = ?auto_33089 ?auto_33083 ) ) ( not ( = ?auto_33091 ?auto_33087 ) ) ( HOIST-AT ?auto_33086 ?auto_33091 ) ( not ( = ?auto_33093 ?auto_33086 ) ) ( AVAILABLE ?auto_33086 ) ( SURFACE-AT ?auto_33083 ?auto_33091 ) ( ON ?auto_33083 ?auto_33088 ) ( CLEAR ?auto_33083 ) ( not ( = ?auto_33082 ?auto_33088 ) ) ( not ( = ?auto_33083 ?auto_33088 ) ) ( not ( = ?auto_33089 ?auto_33088 ) ) ( SURFACE-AT ?auto_33089 ?auto_33087 ) ( CLEAR ?auto_33089 ) ( IS-CRATE ?auto_33082 ) ( AVAILABLE ?auto_33093 ) ( not ( = ?auto_33090 ?auto_33087 ) ) ( not ( = ?auto_33091 ?auto_33090 ) ) ( HOIST-AT ?auto_33085 ?auto_33090 ) ( not ( = ?auto_33093 ?auto_33085 ) ) ( not ( = ?auto_33086 ?auto_33085 ) ) ( AVAILABLE ?auto_33085 ) ( SURFACE-AT ?auto_33082 ?auto_33090 ) ( ON ?auto_33082 ?auto_33092 ) ( CLEAR ?auto_33082 ) ( not ( = ?auto_33082 ?auto_33092 ) ) ( not ( = ?auto_33083 ?auto_33092 ) ) ( not ( = ?auto_33089 ?auto_33092 ) ) ( not ( = ?auto_33088 ?auto_33092 ) ) ( TRUCK-AT ?auto_33084 ?auto_33087 ) )
    :subtasks
    ( ( !DRIVE ?auto_33084 ?auto_33087 ?auto_33090 )
      ( MAKE-2CRATE ?auto_33089 ?auto_33082 ?auto_33083 )
      ( MAKE-1CRATE-VERIFY ?auto_33082 ?auto_33083 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33094 - SURFACE
      ?auto_33095 - SURFACE
      ?auto_33096 - SURFACE
    )
    :vars
    (
      ?auto_33098 - HOIST
      ?auto_33100 - PLACE
      ?auto_33103 - PLACE
      ?auto_33104 - HOIST
      ?auto_33102 - SURFACE
      ?auto_33099 - PLACE
      ?auto_33101 - HOIST
      ?auto_33097 - SURFACE
      ?auto_33105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33098 ?auto_33100 ) ( IS-CRATE ?auto_33096 ) ( not ( = ?auto_33095 ?auto_33096 ) ) ( not ( = ?auto_33094 ?auto_33095 ) ) ( not ( = ?auto_33094 ?auto_33096 ) ) ( not ( = ?auto_33103 ?auto_33100 ) ) ( HOIST-AT ?auto_33104 ?auto_33103 ) ( not ( = ?auto_33098 ?auto_33104 ) ) ( AVAILABLE ?auto_33104 ) ( SURFACE-AT ?auto_33096 ?auto_33103 ) ( ON ?auto_33096 ?auto_33102 ) ( CLEAR ?auto_33096 ) ( not ( = ?auto_33095 ?auto_33102 ) ) ( not ( = ?auto_33096 ?auto_33102 ) ) ( not ( = ?auto_33094 ?auto_33102 ) ) ( SURFACE-AT ?auto_33094 ?auto_33100 ) ( CLEAR ?auto_33094 ) ( IS-CRATE ?auto_33095 ) ( AVAILABLE ?auto_33098 ) ( not ( = ?auto_33099 ?auto_33100 ) ) ( not ( = ?auto_33103 ?auto_33099 ) ) ( HOIST-AT ?auto_33101 ?auto_33099 ) ( not ( = ?auto_33098 ?auto_33101 ) ) ( not ( = ?auto_33104 ?auto_33101 ) ) ( AVAILABLE ?auto_33101 ) ( SURFACE-AT ?auto_33095 ?auto_33099 ) ( ON ?auto_33095 ?auto_33097 ) ( CLEAR ?auto_33095 ) ( not ( = ?auto_33095 ?auto_33097 ) ) ( not ( = ?auto_33096 ?auto_33097 ) ) ( not ( = ?auto_33094 ?auto_33097 ) ) ( not ( = ?auto_33102 ?auto_33097 ) ) ( TRUCK-AT ?auto_33105 ?auto_33100 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33095 ?auto_33096 )
      ( MAKE-2CRATE-VERIFY ?auto_33094 ?auto_33095 ?auto_33096 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33106 - SURFACE
      ?auto_33107 - SURFACE
      ?auto_33108 - SURFACE
      ?auto_33109 - SURFACE
    )
    :vars
    (
      ?auto_33117 - HOIST
      ?auto_33115 - PLACE
      ?auto_33112 - PLACE
      ?auto_33116 - HOIST
      ?auto_33118 - SURFACE
      ?auto_33114 - PLACE
      ?auto_33111 - HOIST
      ?auto_33113 - SURFACE
      ?auto_33110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33117 ?auto_33115 ) ( IS-CRATE ?auto_33109 ) ( not ( = ?auto_33108 ?auto_33109 ) ) ( not ( = ?auto_33107 ?auto_33108 ) ) ( not ( = ?auto_33107 ?auto_33109 ) ) ( not ( = ?auto_33112 ?auto_33115 ) ) ( HOIST-AT ?auto_33116 ?auto_33112 ) ( not ( = ?auto_33117 ?auto_33116 ) ) ( AVAILABLE ?auto_33116 ) ( SURFACE-AT ?auto_33109 ?auto_33112 ) ( ON ?auto_33109 ?auto_33118 ) ( CLEAR ?auto_33109 ) ( not ( = ?auto_33108 ?auto_33118 ) ) ( not ( = ?auto_33109 ?auto_33118 ) ) ( not ( = ?auto_33107 ?auto_33118 ) ) ( SURFACE-AT ?auto_33107 ?auto_33115 ) ( CLEAR ?auto_33107 ) ( IS-CRATE ?auto_33108 ) ( AVAILABLE ?auto_33117 ) ( not ( = ?auto_33114 ?auto_33115 ) ) ( not ( = ?auto_33112 ?auto_33114 ) ) ( HOIST-AT ?auto_33111 ?auto_33114 ) ( not ( = ?auto_33117 ?auto_33111 ) ) ( not ( = ?auto_33116 ?auto_33111 ) ) ( AVAILABLE ?auto_33111 ) ( SURFACE-AT ?auto_33108 ?auto_33114 ) ( ON ?auto_33108 ?auto_33113 ) ( CLEAR ?auto_33108 ) ( not ( = ?auto_33108 ?auto_33113 ) ) ( not ( = ?auto_33109 ?auto_33113 ) ) ( not ( = ?auto_33107 ?auto_33113 ) ) ( not ( = ?auto_33118 ?auto_33113 ) ) ( TRUCK-AT ?auto_33110 ?auto_33115 ) ( ON ?auto_33107 ?auto_33106 ) ( not ( = ?auto_33106 ?auto_33107 ) ) ( not ( = ?auto_33106 ?auto_33108 ) ) ( not ( = ?auto_33106 ?auto_33109 ) ) ( not ( = ?auto_33106 ?auto_33118 ) ) ( not ( = ?auto_33106 ?auto_33113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33107 ?auto_33108 ?auto_33109 )
      ( MAKE-3CRATE-VERIFY ?auto_33106 ?auto_33107 ?auto_33108 ?auto_33109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33119 - SURFACE
      ?auto_33120 - SURFACE
    )
    :vars
    (
      ?auto_33129 - HOIST
      ?auto_33126 - PLACE
      ?auto_33127 - SURFACE
      ?auto_33123 - PLACE
      ?auto_33128 - HOIST
      ?auto_33130 - SURFACE
      ?auto_33125 - PLACE
      ?auto_33122 - HOIST
      ?auto_33124 - SURFACE
      ?auto_33121 - TRUCK
      ?auto_33131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33129 ?auto_33126 ) ( IS-CRATE ?auto_33120 ) ( not ( = ?auto_33119 ?auto_33120 ) ) ( not ( = ?auto_33127 ?auto_33119 ) ) ( not ( = ?auto_33127 ?auto_33120 ) ) ( not ( = ?auto_33123 ?auto_33126 ) ) ( HOIST-AT ?auto_33128 ?auto_33123 ) ( not ( = ?auto_33129 ?auto_33128 ) ) ( AVAILABLE ?auto_33128 ) ( SURFACE-AT ?auto_33120 ?auto_33123 ) ( ON ?auto_33120 ?auto_33130 ) ( CLEAR ?auto_33120 ) ( not ( = ?auto_33119 ?auto_33130 ) ) ( not ( = ?auto_33120 ?auto_33130 ) ) ( not ( = ?auto_33127 ?auto_33130 ) ) ( IS-CRATE ?auto_33119 ) ( not ( = ?auto_33125 ?auto_33126 ) ) ( not ( = ?auto_33123 ?auto_33125 ) ) ( HOIST-AT ?auto_33122 ?auto_33125 ) ( not ( = ?auto_33129 ?auto_33122 ) ) ( not ( = ?auto_33128 ?auto_33122 ) ) ( AVAILABLE ?auto_33122 ) ( SURFACE-AT ?auto_33119 ?auto_33125 ) ( ON ?auto_33119 ?auto_33124 ) ( CLEAR ?auto_33119 ) ( not ( = ?auto_33119 ?auto_33124 ) ) ( not ( = ?auto_33120 ?auto_33124 ) ) ( not ( = ?auto_33127 ?auto_33124 ) ) ( not ( = ?auto_33130 ?auto_33124 ) ) ( TRUCK-AT ?auto_33121 ?auto_33126 ) ( SURFACE-AT ?auto_33131 ?auto_33126 ) ( CLEAR ?auto_33131 ) ( LIFTING ?auto_33129 ?auto_33127 ) ( IS-CRATE ?auto_33127 ) ( not ( = ?auto_33131 ?auto_33127 ) ) ( not ( = ?auto_33119 ?auto_33131 ) ) ( not ( = ?auto_33120 ?auto_33131 ) ) ( not ( = ?auto_33130 ?auto_33131 ) ) ( not ( = ?auto_33124 ?auto_33131 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33131 ?auto_33127 )
      ( MAKE-2CRATE ?auto_33127 ?auto_33119 ?auto_33120 )
      ( MAKE-1CRATE-VERIFY ?auto_33119 ?auto_33120 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33132 - SURFACE
      ?auto_33133 - SURFACE
      ?auto_33134 - SURFACE
    )
    :vars
    (
      ?auto_33144 - HOIST
      ?auto_33139 - PLACE
      ?auto_33137 - PLACE
      ?auto_33140 - HOIST
      ?auto_33136 - SURFACE
      ?auto_33138 - PLACE
      ?auto_33135 - HOIST
      ?auto_33141 - SURFACE
      ?auto_33142 - TRUCK
      ?auto_33143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33144 ?auto_33139 ) ( IS-CRATE ?auto_33134 ) ( not ( = ?auto_33133 ?auto_33134 ) ) ( not ( = ?auto_33132 ?auto_33133 ) ) ( not ( = ?auto_33132 ?auto_33134 ) ) ( not ( = ?auto_33137 ?auto_33139 ) ) ( HOIST-AT ?auto_33140 ?auto_33137 ) ( not ( = ?auto_33144 ?auto_33140 ) ) ( AVAILABLE ?auto_33140 ) ( SURFACE-AT ?auto_33134 ?auto_33137 ) ( ON ?auto_33134 ?auto_33136 ) ( CLEAR ?auto_33134 ) ( not ( = ?auto_33133 ?auto_33136 ) ) ( not ( = ?auto_33134 ?auto_33136 ) ) ( not ( = ?auto_33132 ?auto_33136 ) ) ( IS-CRATE ?auto_33133 ) ( not ( = ?auto_33138 ?auto_33139 ) ) ( not ( = ?auto_33137 ?auto_33138 ) ) ( HOIST-AT ?auto_33135 ?auto_33138 ) ( not ( = ?auto_33144 ?auto_33135 ) ) ( not ( = ?auto_33140 ?auto_33135 ) ) ( AVAILABLE ?auto_33135 ) ( SURFACE-AT ?auto_33133 ?auto_33138 ) ( ON ?auto_33133 ?auto_33141 ) ( CLEAR ?auto_33133 ) ( not ( = ?auto_33133 ?auto_33141 ) ) ( not ( = ?auto_33134 ?auto_33141 ) ) ( not ( = ?auto_33132 ?auto_33141 ) ) ( not ( = ?auto_33136 ?auto_33141 ) ) ( TRUCK-AT ?auto_33142 ?auto_33139 ) ( SURFACE-AT ?auto_33143 ?auto_33139 ) ( CLEAR ?auto_33143 ) ( LIFTING ?auto_33144 ?auto_33132 ) ( IS-CRATE ?auto_33132 ) ( not ( = ?auto_33143 ?auto_33132 ) ) ( not ( = ?auto_33133 ?auto_33143 ) ) ( not ( = ?auto_33134 ?auto_33143 ) ) ( not ( = ?auto_33136 ?auto_33143 ) ) ( not ( = ?auto_33141 ?auto_33143 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33133 ?auto_33134 )
      ( MAKE-2CRATE-VERIFY ?auto_33132 ?auto_33133 ?auto_33134 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33145 - SURFACE
      ?auto_33146 - SURFACE
      ?auto_33147 - SURFACE
      ?auto_33148 - SURFACE
    )
    :vars
    (
      ?auto_33154 - HOIST
      ?auto_33156 - PLACE
      ?auto_33150 - PLACE
      ?auto_33149 - HOIST
      ?auto_33152 - SURFACE
      ?auto_33151 - PLACE
      ?auto_33155 - HOIST
      ?auto_33157 - SURFACE
      ?auto_33153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33154 ?auto_33156 ) ( IS-CRATE ?auto_33148 ) ( not ( = ?auto_33147 ?auto_33148 ) ) ( not ( = ?auto_33146 ?auto_33147 ) ) ( not ( = ?auto_33146 ?auto_33148 ) ) ( not ( = ?auto_33150 ?auto_33156 ) ) ( HOIST-AT ?auto_33149 ?auto_33150 ) ( not ( = ?auto_33154 ?auto_33149 ) ) ( AVAILABLE ?auto_33149 ) ( SURFACE-AT ?auto_33148 ?auto_33150 ) ( ON ?auto_33148 ?auto_33152 ) ( CLEAR ?auto_33148 ) ( not ( = ?auto_33147 ?auto_33152 ) ) ( not ( = ?auto_33148 ?auto_33152 ) ) ( not ( = ?auto_33146 ?auto_33152 ) ) ( IS-CRATE ?auto_33147 ) ( not ( = ?auto_33151 ?auto_33156 ) ) ( not ( = ?auto_33150 ?auto_33151 ) ) ( HOIST-AT ?auto_33155 ?auto_33151 ) ( not ( = ?auto_33154 ?auto_33155 ) ) ( not ( = ?auto_33149 ?auto_33155 ) ) ( AVAILABLE ?auto_33155 ) ( SURFACE-AT ?auto_33147 ?auto_33151 ) ( ON ?auto_33147 ?auto_33157 ) ( CLEAR ?auto_33147 ) ( not ( = ?auto_33147 ?auto_33157 ) ) ( not ( = ?auto_33148 ?auto_33157 ) ) ( not ( = ?auto_33146 ?auto_33157 ) ) ( not ( = ?auto_33152 ?auto_33157 ) ) ( TRUCK-AT ?auto_33153 ?auto_33156 ) ( SURFACE-AT ?auto_33145 ?auto_33156 ) ( CLEAR ?auto_33145 ) ( LIFTING ?auto_33154 ?auto_33146 ) ( IS-CRATE ?auto_33146 ) ( not ( = ?auto_33145 ?auto_33146 ) ) ( not ( = ?auto_33147 ?auto_33145 ) ) ( not ( = ?auto_33148 ?auto_33145 ) ) ( not ( = ?auto_33152 ?auto_33145 ) ) ( not ( = ?auto_33157 ?auto_33145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33146 ?auto_33147 ?auto_33148 )
      ( MAKE-3CRATE-VERIFY ?auto_33145 ?auto_33146 ?auto_33147 ?auto_33148 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33158 - SURFACE
      ?auto_33159 - SURFACE
    )
    :vars
    (
      ?auto_33166 - HOIST
      ?auto_33169 - PLACE
      ?auto_33168 - SURFACE
      ?auto_33162 - PLACE
      ?auto_33160 - HOIST
      ?auto_33164 - SURFACE
      ?auto_33163 - PLACE
      ?auto_33167 - HOIST
      ?auto_33170 - SURFACE
      ?auto_33165 - TRUCK
      ?auto_33161 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33166 ?auto_33169 ) ( IS-CRATE ?auto_33159 ) ( not ( = ?auto_33158 ?auto_33159 ) ) ( not ( = ?auto_33168 ?auto_33158 ) ) ( not ( = ?auto_33168 ?auto_33159 ) ) ( not ( = ?auto_33162 ?auto_33169 ) ) ( HOIST-AT ?auto_33160 ?auto_33162 ) ( not ( = ?auto_33166 ?auto_33160 ) ) ( AVAILABLE ?auto_33160 ) ( SURFACE-AT ?auto_33159 ?auto_33162 ) ( ON ?auto_33159 ?auto_33164 ) ( CLEAR ?auto_33159 ) ( not ( = ?auto_33158 ?auto_33164 ) ) ( not ( = ?auto_33159 ?auto_33164 ) ) ( not ( = ?auto_33168 ?auto_33164 ) ) ( IS-CRATE ?auto_33158 ) ( not ( = ?auto_33163 ?auto_33169 ) ) ( not ( = ?auto_33162 ?auto_33163 ) ) ( HOIST-AT ?auto_33167 ?auto_33163 ) ( not ( = ?auto_33166 ?auto_33167 ) ) ( not ( = ?auto_33160 ?auto_33167 ) ) ( AVAILABLE ?auto_33167 ) ( SURFACE-AT ?auto_33158 ?auto_33163 ) ( ON ?auto_33158 ?auto_33170 ) ( CLEAR ?auto_33158 ) ( not ( = ?auto_33158 ?auto_33170 ) ) ( not ( = ?auto_33159 ?auto_33170 ) ) ( not ( = ?auto_33168 ?auto_33170 ) ) ( not ( = ?auto_33164 ?auto_33170 ) ) ( TRUCK-AT ?auto_33165 ?auto_33169 ) ( SURFACE-AT ?auto_33161 ?auto_33169 ) ( CLEAR ?auto_33161 ) ( IS-CRATE ?auto_33168 ) ( not ( = ?auto_33161 ?auto_33168 ) ) ( not ( = ?auto_33158 ?auto_33161 ) ) ( not ( = ?auto_33159 ?auto_33161 ) ) ( not ( = ?auto_33164 ?auto_33161 ) ) ( not ( = ?auto_33170 ?auto_33161 ) ) ( AVAILABLE ?auto_33166 ) ( IN ?auto_33168 ?auto_33165 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33166 ?auto_33168 ?auto_33165 ?auto_33169 )
      ( MAKE-2CRATE ?auto_33168 ?auto_33158 ?auto_33159 )
      ( MAKE-1CRATE-VERIFY ?auto_33158 ?auto_33159 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33171 - SURFACE
      ?auto_33172 - SURFACE
      ?auto_33173 - SURFACE
    )
    :vars
    (
      ?auto_33179 - HOIST
      ?auto_33180 - PLACE
      ?auto_33183 - PLACE
      ?auto_33174 - HOIST
      ?auto_33181 - SURFACE
      ?auto_33182 - PLACE
      ?auto_33178 - HOIST
      ?auto_33177 - SURFACE
      ?auto_33176 - TRUCK
      ?auto_33175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33179 ?auto_33180 ) ( IS-CRATE ?auto_33173 ) ( not ( = ?auto_33172 ?auto_33173 ) ) ( not ( = ?auto_33171 ?auto_33172 ) ) ( not ( = ?auto_33171 ?auto_33173 ) ) ( not ( = ?auto_33183 ?auto_33180 ) ) ( HOIST-AT ?auto_33174 ?auto_33183 ) ( not ( = ?auto_33179 ?auto_33174 ) ) ( AVAILABLE ?auto_33174 ) ( SURFACE-AT ?auto_33173 ?auto_33183 ) ( ON ?auto_33173 ?auto_33181 ) ( CLEAR ?auto_33173 ) ( not ( = ?auto_33172 ?auto_33181 ) ) ( not ( = ?auto_33173 ?auto_33181 ) ) ( not ( = ?auto_33171 ?auto_33181 ) ) ( IS-CRATE ?auto_33172 ) ( not ( = ?auto_33182 ?auto_33180 ) ) ( not ( = ?auto_33183 ?auto_33182 ) ) ( HOIST-AT ?auto_33178 ?auto_33182 ) ( not ( = ?auto_33179 ?auto_33178 ) ) ( not ( = ?auto_33174 ?auto_33178 ) ) ( AVAILABLE ?auto_33178 ) ( SURFACE-AT ?auto_33172 ?auto_33182 ) ( ON ?auto_33172 ?auto_33177 ) ( CLEAR ?auto_33172 ) ( not ( = ?auto_33172 ?auto_33177 ) ) ( not ( = ?auto_33173 ?auto_33177 ) ) ( not ( = ?auto_33171 ?auto_33177 ) ) ( not ( = ?auto_33181 ?auto_33177 ) ) ( TRUCK-AT ?auto_33176 ?auto_33180 ) ( SURFACE-AT ?auto_33175 ?auto_33180 ) ( CLEAR ?auto_33175 ) ( IS-CRATE ?auto_33171 ) ( not ( = ?auto_33175 ?auto_33171 ) ) ( not ( = ?auto_33172 ?auto_33175 ) ) ( not ( = ?auto_33173 ?auto_33175 ) ) ( not ( = ?auto_33181 ?auto_33175 ) ) ( not ( = ?auto_33177 ?auto_33175 ) ) ( AVAILABLE ?auto_33179 ) ( IN ?auto_33171 ?auto_33176 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33172 ?auto_33173 )
      ( MAKE-2CRATE-VERIFY ?auto_33171 ?auto_33172 ?auto_33173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33184 - SURFACE
      ?auto_33185 - SURFACE
      ?auto_33186 - SURFACE
      ?auto_33187 - SURFACE
    )
    :vars
    (
      ?auto_33194 - HOIST
      ?auto_33191 - PLACE
      ?auto_33193 - PLACE
      ?auto_33190 - HOIST
      ?auto_33189 - SURFACE
      ?auto_33195 - PLACE
      ?auto_33188 - HOIST
      ?auto_33196 - SURFACE
      ?auto_33192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33194 ?auto_33191 ) ( IS-CRATE ?auto_33187 ) ( not ( = ?auto_33186 ?auto_33187 ) ) ( not ( = ?auto_33185 ?auto_33186 ) ) ( not ( = ?auto_33185 ?auto_33187 ) ) ( not ( = ?auto_33193 ?auto_33191 ) ) ( HOIST-AT ?auto_33190 ?auto_33193 ) ( not ( = ?auto_33194 ?auto_33190 ) ) ( AVAILABLE ?auto_33190 ) ( SURFACE-AT ?auto_33187 ?auto_33193 ) ( ON ?auto_33187 ?auto_33189 ) ( CLEAR ?auto_33187 ) ( not ( = ?auto_33186 ?auto_33189 ) ) ( not ( = ?auto_33187 ?auto_33189 ) ) ( not ( = ?auto_33185 ?auto_33189 ) ) ( IS-CRATE ?auto_33186 ) ( not ( = ?auto_33195 ?auto_33191 ) ) ( not ( = ?auto_33193 ?auto_33195 ) ) ( HOIST-AT ?auto_33188 ?auto_33195 ) ( not ( = ?auto_33194 ?auto_33188 ) ) ( not ( = ?auto_33190 ?auto_33188 ) ) ( AVAILABLE ?auto_33188 ) ( SURFACE-AT ?auto_33186 ?auto_33195 ) ( ON ?auto_33186 ?auto_33196 ) ( CLEAR ?auto_33186 ) ( not ( = ?auto_33186 ?auto_33196 ) ) ( not ( = ?auto_33187 ?auto_33196 ) ) ( not ( = ?auto_33185 ?auto_33196 ) ) ( not ( = ?auto_33189 ?auto_33196 ) ) ( TRUCK-AT ?auto_33192 ?auto_33191 ) ( SURFACE-AT ?auto_33184 ?auto_33191 ) ( CLEAR ?auto_33184 ) ( IS-CRATE ?auto_33185 ) ( not ( = ?auto_33184 ?auto_33185 ) ) ( not ( = ?auto_33186 ?auto_33184 ) ) ( not ( = ?auto_33187 ?auto_33184 ) ) ( not ( = ?auto_33189 ?auto_33184 ) ) ( not ( = ?auto_33196 ?auto_33184 ) ) ( AVAILABLE ?auto_33194 ) ( IN ?auto_33185 ?auto_33192 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33185 ?auto_33186 ?auto_33187 )
      ( MAKE-3CRATE-VERIFY ?auto_33184 ?auto_33185 ?auto_33186 ?auto_33187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33197 - SURFACE
      ?auto_33198 - SURFACE
    )
    :vars
    (
      ?auto_33207 - HOIST
      ?auto_33204 - PLACE
      ?auto_33201 - SURFACE
      ?auto_33206 - PLACE
      ?auto_33202 - HOIST
      ?auto_33200 - SURFACE
      ?auto_33208 - PLACE
      ?auto_33199 - HOIST
      ?auto_33209 - SURFACE
      ?auto_33203 - SURFACE
      ?auto_33205 - TRUCK
      ?auto_33210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33207 ?auto_33204 ) ( IS-CRATE ?auto_33198 ) ( not ( = ?auto_33197 ?auto_33198 ) ) ( not ( = ?auto_33201 ?auto_33197 ) ) ( not ( = ?auto_33201 ?auto_33198 ) ) ( not ( = ?auto_33206 ?auto_33204 ) ) ( HOIST-AT ?auto_33202 ?auto_33206 ) ( not ( = ?auto_33207 ?auto_33202 ) ) ( AVAILABLE ?auto_33202 ) ( SURFACE-AT ?auto_33198 ?auto_33206 ) ( ON ?auto_33198 ?auto_33200 ) ( CLEAR ?auto_33198 ) ( not ( = ?auto_33197 ?auto_33200 ) ) ( not ( = ?auto_33198 ?auto_33200 ) ) ( not ( = ?auto_33201 ?auto_33200 ) ) ( IS-CRATE ?auto_33197 ) ( not ( = ?auto_33208 ?auto_33204 ) ) ( not ( = ?auto_33206 ?auto_33208 ) ) ( HOIST-AT ?auto_33199 ?auto_33208 ) ( not ( = ?auto_33207 ?auto_33199 ) ) ( not ( = ?auto_33202 ?auto_33199 ) ) ( AVAILABLE ?auto_33199 ) ( SURFACE-AT ?auto_33197 ?auto_33208 ) ( ON ?auto_33197 ?auto_33209 ) ( CLEAR ?auto_33197 ) ( not ( = ?auto_33197 ?auto_33209 ) ) ( not ( = ?auto_33198 ?auto_33209 ) ) ( not ( = ?auto_33201 ?auto_33209 ) ) ( not ( = ?auto_33200 ?auto_33209 ) ) ( SURFACE-AT ?auto_33203 ?auto_33204 ) ( CLEAR ?auto_33203 ) ( IS-CRATE ?auto_33201 ) ( not ( = ?auto_33203 ?auto_33201 ) ) ( not ( = ?auto_33197 ?auto_33203 ) ) ( not ( = ?auto_33198 ?auto_33203 ) ) ( not ( = ?auto_33200 ?auto_33203 ) ) ( not ( = ?auto_33209 ?auto_33203 ) ) ( AVAILABLE ?auto_33207 ) ( IN ?auto_33201 ?auto_33205 ) ( TRUCK-AT ?auto_33205 ?auto_33210 ) ( not ( = ?auto_33210 ?auto_33204 ) ) ( not ( = ?auto_33206 ?auto_33210 ) ) ( not ( = ?auto_33208 ?auto_33210 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33205 ?auto_33210 ?auto_33204 )
      ( MAKE-2CRATE ?auto_33201 ?auto_33197 ?auto_33198 )
      ( MAKE-1CRATE-VERIFY ?auto_33197 ?auto_33198 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33211 - SURFACE
      ?auto_33212 - SURFACE
      ?auto_33213 - SURFACE
    )
    :vars
    (
      ?auto_33216 - HOIST
      ?auto_33219 - PLACE
      ?auto_33221 - PLACE
      ?auto_33214 - HOIST
      ?auto_33223 - SURFACE
      ?auto_33217 - PLACE
      ?auto_33224 - HOIST
      ?auto_33220 - SURFACE
      ?auto_33215 - SURFACE
      ?auto_33218 - TRUCK
      ?auto_33222 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33216 ?auto_33219 ) ( IS-CRATE ?auto_33213 ) ( not ( = ?auto_33212 ?auto_33213 ) ) ( not ( = ?auto_33211 ?auto_33212 ) ) ( not ( = ?auto_33211 ?auto_33213 ) ) ( not ( = ?auto_33221 ?auto_33219 ) ) ( HOIST-AT ?auto_33214 ?auto_33221 ) ( not ( = ?auto_33216 ?auto_33214 ) ) ( AVAILABLE ?auto_33214 ) ( SURFACE-AT ?auto_33213 ?auto_33221 ) ( ON ?auto_33213 ?auto_33223 ) ( CLEAR ?auto_33213 ) ( not ( = ?auto_33212 ?auto_33223 ) ) ( not ( = ?auto_33213 ?auto_33223 ) ) ( not ( = ?auto_33211 ?auto_33223 ) ) ( IS-CRATE ?auto_33212 ) ( not ( = ?auto_33217 ?auto_33219 ) ) ( not ( = ?auto_33221 ?auto_33217 ) ) ( HOIST-AT ?auto_33224 ?auto_33217 ) ( not ( = ?auto_33216 ?auto_33224 ) ) ( not ( = ?auto_33214 ?auto_33224 ) ) ( AVAILABLE ?auto_33224 ) ( SURFACE-AT ?auto_33212 ?auto_33217 ) ( ON ?auto_33212 ?auto_33220 ) ( CLEAR ?auto_33212 ) ( not ( = ?auto_33212 ?auto_33220 ) ) ( not ( = ?auto_33213 ?auto_33220 ) ) ( not ( = ?auto_33211 ?auto_33220 ) ) ( not ( = ?auto_33223 ?auto_33220 ) ) ( SURFACE-AT ?auto_33215 ?auto_33219 ) ( CLEAR ?auto_33215 ) ( IS-CRATE ?auto_33211 ) ( not ( = ?auto_33215 ?auto_33211 ) ) ( not ( = ?auto_33212 ?auto_33215 ) ) ( not ( = ?auto_33213 ?auto_33215 ) ) ( not ( = ?auto_33223 ?auto_33215 ) ) ( not ( = ?auto_33220 ?auto_33215 ) ) ( AVAILABLE ?auto_33216 ) ( IN ?auto_33211 ?auto_33218 ) ( TRUCK-AT ?auto_33218 ?auto_33222 ) ( not ( = ?auto_33222 ?auto_33219 ) ) ( not ( = ?auto_33221 ?auto_33222 ) ) ( not ( = ?auto_33217 ?auto_33222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33212 ?auto_33213 )
      ( MAKE-2CRATE-VERIFY ?auto_33211 ?auto_33212 ?auto_33213 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33225 - SURFACE
      ?auto_33226 - SURFACE
      ?auto_33227 - SURFACE
      ?auto_33228 - SURFACE
    )
    :vars
    (
      ?auto_33230 - HOIST
      ?auto_33238 - PLACE
      ?auto_33236 - PLACE
      ?auto_33229 - HOIST
      ?auto_33231 - SURFACE
      ?auto_33235 - PLACE
      ?auto_33237 - HOIST
      ?auto_33232 - SURFACE
      ?auto_33234 - TRUCK
      ?auto_33233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33230 ?auto_33238 ) ( IS-CRATE ?auto_33228 ) ( not ( = ?auto_33227 ?auto_33228 ) ) ( not ( = ?auto_33226 ?auto_33227 ) ) ( not ( = ?auto_33226 ?auto_33228 ) ) ( not ( = ?auto_33236 ?auto_33238 ) ) ( HOIST-AT ?auto_33229 ?auto_33236 ) ( not ( = ?auto_33230 ?auto_33229 ) ) ( AVAILABLE ?auto_33229 ) ( SURFACE-AT ?auto_33228 ?auto_33236 ) ( ON ?auto_33228 ?auto_33231 ) ( CLEAR ?auto_33228 ) ( not ( = ?auto_33227 ?auto_33231 ) ) ( not ( = ?auto_33228 ?auto_33231 ) ) ( not ( = ?auto_33226 ?auto_33231 ) ) ( IS-CRATE ?auto_33227 ) ( not ( = ?auto_33235 ?auto_33238 ) ) ( not ( = ?auto_33236 ?auto_33235 ) ) ( HOIST-AT ?auto_33237 ?auto_33235 ) ( not ( = ?auto_33230 ?auto_33237 ) ) ( not ( = ?auto_33229 ?auto_33237 ) ) ( AVAILABLE ?auto_33237 ) ( SURFACE-AT ?auto_33227 ?auto_33235 ) ( ON ?auto_33227 ?auto_33232 ) ( CLEAR ?auto_33227 ) ( not ( = ?auto_33227 ?auto_33232 ) ) ( not ( = ?auto_33228 ?auto_33232 ) ) ( not ( = ?auto_33226 ?auto_33232 ) ) ( not ( = ?auto_33231 ?auto_33232 ) ) ( SURFACE-AT ?auto_33225 ?auto_33238 ) ( CLEAR ?auto_33225 ) ( IS-CRATE ?auto_33226 ) ( not ( = ?auto_33225 ?auto_33226 ) ) ( not ( = ?auto_33227 ?auto_33225 ) ) ( not ( = ?auto_33228 ?auto_33225 ) ) ( not ( = ?auto_33231 ?auto_33225 ) ) ( not ( = ?auto_33232 ?auto_33225 ) ) ( AVAILABLE ?auto_33230 ) ( IN ?auto_33226 ?auto_33234 ) ( TRUCK-AT ?auto_33234 ?auto_33233 ) ( not ( = ?auto_33233 ?auto_33238 ) ) ( not ( = ?auto_33236 ?auto_33233 ) ) ( not ( = ?auto_33235 ?auto_33233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33226 ?auto_33227 ?auto_33228 )
      ( MAKE-3CRATE-VERIFY ?auto_33225 ?auto_33226 ?auto_33227 ?auto_33228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33239 - SURFACE
      ?auto_33240 - SURFACE
    )
    :vars
    (
      ?auto_33243 - HOIST
      ?auto_33252 - PLACE
      ?auto_33241 - SURFACE
      ?auto_33249 - PLACE
      ?auto_33242 - HOIST
      ?auto_33244 - SURFACE
      ?auto_33248 - PLACE
      ?auto_33251 - HOIST
      ?auto_33245 - SURFACE
      ?auto_33250 - SURFACE
      ?auto_33247 - TRUCK
      ?auto_33246 - PLACE
      ?auto_33253 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33243 ?auto_33252 ) ( IS-CRATE ?auto_33240 ) ( not ( = ?auto_33239 ?auto_33240 ) ) ( not ( = ?auto_33241 ?auto_33239 ) ) ( not ( = ?auto_33241 ?auto_33240 ) ) ( not ( = ?auto_33249 ?auto_33252 ) ) ( HOIST-AT ?auto_33242 ?auto_33249 ) ( not ( = ?auto_33243 ?auto_33242 ) ) ( AVAILABLE ?auto_33242 ) ( SURFACE-AT ?auto_33240 ?auto_33249 ) ( ON ?auto_33240 ?auto_33244 ) ( CLEAR ?auto_33240 ) ( not ( = ?auto_33239 ?auto_33244 ) ) ( not ( = ?auto_33240 ?auto_33244 ) ) ( not ( = ?auto_33241 ?auto_33244 ) ) ( IS-CRATE ?auto_33239 ) ( not ( = ?auto_33248 ?auto_33252 ) ) ( not ( = ?auto_33249 ?auto_33248 ) ) ( HOIST-AT ?auto_33251 ?auto_33248 ) ( not ( = ?auto_33243 ?auto_33251 ) ) ( not ( = ?auto_33242 ?auto_33251 ) ) ( AVAILABLE ?auto_33251 ) ( SURFACE-AT ?auto_33239 ?auto_33248 ) ( ON ?auto_33239 ?auto_33245 ) ( CLEAR ?auto_33239 ) ( not ( = ?auto_33239 ?auto_33245 ) ) ( not ( = ?auto_33240 ?auto_33245 ) ) ( not ( = ?auto_33241 ?auto_33245 ) ) ( not ( = ?auto_33244 ?auto_33245 ) ) ( SURFACE-AT ?auto_33250 ?auto_33252 ) ( CLEAR ?auto_33250 ) ( IS-CRATE ?auto_33241 ) ( not ( = ?auto_33250 ?auto_33241 ) ) ( not ( = ?auto_33239 ?auto_33250 ) ) ( not ( = ?auto_33240 ?auto_33250 ) ) ( not ( = ?auto_33244 ?auto_33250 ) ) ( not ( = ?auto_33245 ?auto_33250 ) ) ( AVAILABLE ?auto_33243 ) ( TRUCK-AT ?auto_33247 ?auto_33246 ) ( not ( = ?auto_33246 ?auto_33252 ) ) ( not ( = ?auto_33249 ?auto_33246 ) ) ( not ( = ?auto_33248 ?auto_33246 ) ) ( HOIST-AT ?auto_33253 ?auto_33246 ) ( LIFTING ?auto_33253 ?auto_33241 ) ( not ( = ?auto_33243 ?auto_33253 ) ) ( not ( = ?auto_33242 ?auto_33253 ) ) ( not ( = ?auto_33251 ?auto_33253 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33253 ?auto_33241 ?auto_33247 ?auto_33246 )
      ( MAKE-2CRATE ?auto_33241 ?auto_33239 ?auto_33240 )
      ( MAKE-1CRATE-VERIFY ?auto_33239 ?auto_33240 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33254 - SURFACE
      ?auto_33255 - SURFACE
      ?auto_33256 - SURFACE
    )
    :vars
    (
      ?auto_33266 - HOIST
      ?auto_33262 - PLACE
      ?auto_33265 - PLACE
      ?auto_33267 - HOIST
      ?auto_33257 - SURFACE
      ?auto_33259 - PLACE
      ?auto_33268 - HOIST
      ?auto_33258 - SURFACE
      ?auto_33261 - SURFACE
      ?auto_33263 - TRUCK
      ?auto_33260 - PLACE
      ?auto_33264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33266 ?auto_33262 ) ( IS-CRATE ?auto_33256 ) ( not ( = ?auto_33255 ?auto_33256 ) ) ( not ( = ?auto_33254 ?auto_33255 ) ) ( not ( = ?auto_33254 ?auto_33256 ) ) ( not ( = ?auto_33265 ?auto_33262 ) ) ( HOIST-AT ?auto_33267 ?auto_33265 ) ( not ( = ?auto_33266 ?auto_33267 ) ) ( AVAILABLE ?auto_33267 ) ( SURFACE-AT ?auto_33256 ?auto_33265 ) ( ON ?auto_33256 ?auto_33257 ) ( CLEAR ?auto_33256 ) ( not ( = ?auto_33255 ?auto_33257 ) ) ( not ( = ?auto_33256 ?auto_33257 ) ) ( not ( = ?auto_33254 ?auto_33257 ) ) ( IS-CRATE ?auto_33255 ) ( not ( = ?auto_33259 ?auto_33262 ) ) ( not ( = ?auto_33265 ?auto_33259 ) ) ( HOIST-AT ?auto_33268 ?auto_33259 ) ( not ( = ?auto_33266 ?auto_33268 ) ) ( not ( = ?auto_33267 ?auto_33268 ) ) ( AVAILABLE ?auto_33268 ) ( SURFACE-AT ?auto_33255 ?auto_33259 ) ( ON ?auto_33255 ?auto_33258 ) ( CLEAR ?auto_33255 ) ( not ( = ?auto_33255 ?auto_33258 ) ) ( not ( = ?auto_33256 ?auto_33258 ) ) ( not ( = ?auto_33254 ?auto_33258 ) ) ( not ( = ?auto_33257 ?auto_33258 ) ) ( SURFACE-AT ?auto_33261 ?auto_33262 ) ( CLEAR ?auto_33261 ) ( IS-CRATE ?auto_33254 ) ( not ( = ?auto_33261 ?auto_33254 ) ) ( not ( = ?auto_33255 ?auto_33261 ) ) ( not ( = ?auto_33256 ?auto_33261 ) ) ( not ( = ?auto_33257 ?auto_33261 ) ) ( not ( = ?auto_33258 ?auto_33261 ) ) ( AVAILABLE ?auto_33266 ) ( TRUCK-AT ?auto_33263 ?auto_33260 ) ( not ( = ?auto_33260 ?auto_33262 ) ) ( not ( = ?auto_33265 ?auto_33260 ) ) ( not ( = ?auto_33259 ?auto_33260 ) ) ( HOIST-AT ?auto_33264 ?auto_33260 ) ( LIFTING ?auto_33264 ?auto_33254 ) ( not ( = ?auto_33266 ?auto_33264 ) ) ( not ( = ?auto_33267 ?auto_33264 ) ) ( not ( = ?auto_33268 ?auto_33264 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33255 ?auto_33256 )
      ( MAKE-2CRATE-VERIFY ?auto_33254 ?auto_33255 ?auto_33256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33269 - SURFACE
      ?auto_33270 - SURFACE
      ?auto_33271 - SURFACE
      ?auto_33272 - SURFACE
    )
    :vars
    (
      ?auto_33275 - HOIST
      ?auto_33274 - PLACE
      ?auto_33281 - PLACE
      ?auto_33278 - HOIST
      ?auto_33276 - SURFACE
      ?auto_33273 - PLACE
      ?auto_33280 - HOIST
      ?auto_33283 - SURFACE
      ?auto_33279 - TRUCK
      ?auto_33282 - PLACE
      ?auto_33277 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33275 ?auto_33274 ) ( IS-CRATE ?auto_33272 ) ( not ( = ?auto_33271 ?auto_33272 ) ) ( not ( = ?auto_33270 ?auto_33271 ) ) ( not ( = ?auto_33270 ?auto_33272 ) ) ( not ( = ?auto_33281 ?auto_33274 ) ) ( HOIST-AT ?auto_33278 ?auto_33281 ) ( not ( = ?auto_33275 ?auto_33278 ) ) ( AVAILABLE ?auto_33278 ) ( SURFACE-AT ?auto_33272 ?auto_33281 ) ( ON ?auto_33272 ?auto_33276 ) ( CLEAR ?auto_33272 ) ( not ( = ?auto_33271 ?auto_33276 ) ) ( not ( = ?auto_33272 ?auto_33276 ) ) ( not ( = ?auto_33270 ?auto_33276 ) ) ( IS-CRATE ?auto_33271 ) ( not ( = ?auto_33273 ?auto_33274 ) ) ( not ( = ?auto_33281 ?auto_33273 ) ) ( HOIST-AT ?auto_33280 ?auto_33273 ) ( not ( = ?auto_33275 ?auto_33280 ) ) ( not ( = ?auto_33278 ?auto_33280 ) ) ( AVAILABLE ?auto_33280 ) ( SURFACE-AT ?auto_33271 ?auto_33273 ) ( ON ?auto_33271 ?auto_33283 ) ( CLEAR ?auto_33271 ) ( not ( = ?auto_33271 ?auto_33283 ) ) ( not ( = ?auto_33272 ?auto_33283 ) ) ( not ( = ?auto_33270 ?auto_33283 ) ) ( not ( = ?auto_33276 ?auto_33283 ) ) ( SURFACE-AT ?auto_33269 ?auto_33274 ) ( CLEAR ?auto_33269 ) ( IS-CRATE ?auto_33270 ) ( not ( = ?auto_33269 ?auto_33270 ) ) ( not ( = ?auto_33271 ?auto_33269 ) ) ( not ( = ?auto_33272 ?auto_33269 ) ) ( not ( = ?auto_33276 ?auto_33269 ) ) ( not ( = ?auto_33283 ?auto_33269 ) ) ( AVAILABLE ?auto_33275 ) ( TRUCK-AT ?auto_33279 ?auto_33282 ) ( not ( = ?auto_33282 ?auto_33274 ) ) ( not ( = ?auto_33281 ?auto_33282 ) ) ( not ( = ?auto_33273 ?auto_33282 ) ) ( HOIST-AT ?auto_33277 ?auto_33282 ) ( LIFTING ?auto_33277 ?auto_33270 ) ( not ( = ?auto_33275 ?auto_33277 ) ) ( not ( = ?auto_33278 ?auto_33277 ) ) ( not ( = ?auto_33280 ?auto_33277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33270 ?auto_33271 ?auto_33272 )
      ( MAKE-3CRATE-VERIFY ?auto_33269 ?auto_33270 ?auto_33271 ?auto_33272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33284 - SURFACE
      ?auto_33285 - SURFACE
    )
    :vars
    (
      ?auto_33290 - HOIST
      ?auto_33289 - PLACE
      ?auto_33287 - SURFACE
      ?auto_33296 - PLACE
      ?auto_33293 - HOIST
      ?auto_33291 - SURFACE
      ?auto_33288 - PLACE
      ?auto_33295 - HOIST
      ?auto_33298 - SURFACE
      ?auto_33286 - SURFACE
      ?auto_33294 - TRUCK
      ?auto_33297 - PLACE
      ?auto_33292 - HOIST
      ?auto_33299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33290 ?auto_33289 ) ( IS-CRATE ?auto_33285 ) ( not ( = ?auto_33284 ?auto_33285 ) ) ( not ( = ?auto_33287 ?auto_33284 ) ) ( not ( = ?auto_33287 ?auto_33285 ) ) ( not ( = ?auto_33296 ?auto_33289 ) ) ( HOIST-AT ?auto_33293 ?auto_33296 ) ( not ( = ?auto_33290 ?auto_33293 ) ) ( AVAILABLE ?auto_33293 ) ( SURFACE-AT ?auto_33285 ?auto_33296 ) ( ON ?auto_33285 ?auto_33291 ) ( CLEAR ?auto_33285 ) ( not ( = ?auto_33284 ?auto_33291 ) ) ( not ( = ?auto_33285 ?auto_33291 ) ) ( not ( = ?auto_33287 ?auto_33291 ) ) ( IS-CRATE ?auto_33284 ) ( not ( = ?auto_33288 ?auto_33289 ) ) ( not ( = ?auto_33296 ?auto_33288 ) ) ( HOIST-AT ?auto_33295 ?auto_33288 ) ( not ( = ?auto_33290 ?auto_33295 ) ) ( not ( = ?auto_33293 ?auto_33295 ) ) ( AVAILABLE ?auto_33295 ) ( SURFACE-AT ?auto_33284 ?auto_33288 ) ( ON ?auto_33284 ?auto_33298 ) ( CLEAR ?auto_33284 ) ( not ( = ?auto_33284 ?auto_33298 ) ) ( not ( = ?auto_33285 ?auto_33298 ) ) ( not ( = ?auto_33287 ?auto_33298 ) ) ( not ( = ?auto_33291 ?auto_33298 ) ) ( SURFACE-AT ?auto_33286 ?auto_33289 ) ( CLEAR ?auto_33286 ) ( IS-CRATE ?auto_33287 ) ( not ( = ?auto_33286 ?auto_33287 ) ) ( not ( = ?auto_33284 ?auto_33286 ) ) ( not ( = ?auto_33285 ?auto_33286 ) ) ( not ( = ?auto_33291 ?auto_33286 ) ) ( not ( = ?auto_33298 ?auto_33286 ) ) ( AVAILABLE ?auto_33290 ) ( TRUCK-AT ?auto_33294 ?auto_33297 ) ( not ( = ?auto_33297 ?auto_33289 ) ) ( not ( = ?auto_33296 ?auto_33297 ) ) ( not ( = ?auto_33288 ?auto_33297 ) ) ( HOIST-AT ?auto_33292 ?auto_33297 ) ( not ( = ?auto_33290 ?auto_33292 ) ) ( not ( = ?auto_33293 ?auto_33292 ) ) ( not ( = ?auto_33295 ?auto_33292 ) ) ( AVAILABLE ?auto_33292 ) ( SURFACE-AT ?auto_33287 ?auto_33297 ) ( ON ?auto_33287 ?auto_33299 ) ( CLEAR ?auto_33287 ) ( not ( = ?auto_33284 ?auto_33299 ) ) ( not ( = ?auto_33285 ?auto_33299 ) ) ( not ( = ?auto_33287 ?auto_33299 ) ) ( not ( = ?auto_33291 ?auto_33299 ) ) ( not ( = ?auto_33298 ?auto_33299 ) ) ( not ( = ?auto_33286 ?auto_33299 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33292 ?auto_33287 ?auto_33299 ?auto_33297 )
      ( MAKE-2CRATE ?auto_33287 ?auto_33284 ?auto_33285 )
      ( MAKE-1CRATE-VERIFY ?auto_33284 ?auto_33285 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33300 - SURFACE
      ?auto_33301 - SURFACE
      ?auto_33302 - SURFACE
    )
    :vars
    (
      ?auto_33311 - HOIST
      ?auto_33312 - PLACE
      ?auto_33306 - PLACE
      ?auto_33310 - HOIST
      ?auto_33308 - SURFACE
      ?auto_33313 - PLACE
      ?auto_33303 - HOIST
      ?auto_33314 - SURFACE
      ?auto_33305 - SURFACE
      ?auto_33315 - TRUCK
      ?auto_33307 - PLACE
      ?auto_33304 - HOIST
      ?auto_33309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33311 ?auto_33312 ) ( IS-CRATE ?auto_33302 ) ( not ( = ?auto_33301 ?auto_33302 ) ) ( not ( = ?auto_33300 ?auto_33301 ) ) ( not ( = ?auto_33300 ?auto_33302 ) ) ( not ( = ?auto_33306 ?auto_33312 ) ) ( HOIST-AT ?auto_33310 ?auto_33306 ) ( not ( = ?auto_33311 ?auto_33310 ) ) ( AVAILABLE ?auto_33310 ) ( SURFACE-AT ?auto_33302 ?auto_33306 ) ( ON ?auto_33302 ?auto_33308 ) ( CLEAR ?auto_33302 ) ( not ( = ?auto_33301 ?auto_33308 ) ) ( not ( = ?auto_33302 ?auto_33308 ) ) ( not ( = ?auto_33300 ?auto_33308 ) ) ( IS-CRATE ?auto_33301 ) ( not ( = ?auto_33313 ?auto_33312 ) ) ( not ( = ?auto_33306 ?auto_33313 ) ) ( HOIST-AT ?auto_33303 ?auto_33313 ) ( not ( = ?auto_33311 ?auto_33303 ) ) ( not ( = ?auto_33310 ?auto_33303 ) ) ( AVAILABLE ?auto_33303 ) ( SURFACE-AT ?auto_33301 ?auto_33313 ) ( ON ?auto_33301 ?auto_33314 ) ( CLEAR ?auto_33301 ) ( not ( = ?auto_33301 ?auto_33314 ) ) ( not ( = ?auto_33302 ?auto_33314 ) ) ( not ( = ?auto_33300 ?auto_33314 ) ) ( not ( = ?auto_33308 ?auto_33314 ) ) ( SURFACE-AT ?auto_33305 ?auto_33312 ) ( CLEAR ?auto_33305 ) ( IS-CRATE ?auto_33300 ) ( not ( = ?auto_33305 ?auto_33300 ) ) ( not ( = ?auto_33301 ?auto_33305 ) ) ( not ( = ?auto_33302 ?auto_33305 ) ) ( not ( = ?auto_33308 ?auto_33305 ) ) ( not ( = ?auto_33314 ?auto_33305 ) ) ( AVAILABLE ?auto_33311 ) ( TRUCK-AT ?auto_33315 ?auto_33307 ) ( not ( = ?auto_33307 ?auto_33312 ) ) ( not ( = ?auto_33306 ?auto_33307 ) ) ( not ( = ?auto_33313 ?auto_33307 ) ) ( HOIST-AT ?auto_33304 ?auto_33307 ) ( not ( = ?auto_33311 ?auto_33304 ) ) ( not ( = ?auto_33310 ?auto_33304 ) ) ( not ( = ?auto_33303 ?auto_33304 ) ) ( AVAILABLE ?auto_33304 ) ( SURFACE-AT ?auto_33300 ?auto_33307 ) ( ON ?auto_33300 ?auto_33309 ) ( CLEAR ?auto_33300 ) ( not ( = ?auto_33301 ?auto_33309 ) ) ( not ( = ?auto_33302 ?auto_33309 ) ) ( not ( = ?auto_33300 ?auto_33309 ) ) ( not ( = ?auto_33308 ?auto_33309 ) ) ( not ( = ?auto_33314 ?auto_33309 ) ) ( not ( = ?auto_33305 ?auto_33309 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33301 ?auto_33302 )
      ( MAKE-2CRATE-VERIFY ?auto_33300 ?auto_33301 ?auto_33302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33316 - SURFACE
      ?auto_33317 - SURFACE
      ?auto_33318 - SURFACE
      ?auto_33319 - SURFACE
    )
    :vars
    (
      ?auto_33324 - HOIST
      ?auto_33331 - PLACE
      ?auto_33325 - PLACE
      ?auto_33328 - HOIST
      ?auto_33323 - SURFACE
      ?auto_33329 - PLACE
      ?auto_33320 - HOIST
      ?auto_33322 - SURFACE
      ?auto_33330 - TRUCK
      ?auto_33326 - PLACE
      ?auto_33327 - HOIST
      ?auto_33321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33324 ?auto_33331 ) ( IS-CRATE ?auto_33319 ) ( not ( = ?auto_33318 ?auto_33319 ) ) ( not ( = ?auto_33317 ?auto_33318 ) ) ( not ( = ?auto_33317 ?auto_33319 ) ) ( not ( = ?auto_33325 ?auto_33331 ) ) ( HOIST-AT ?auto_33328 ?auto_33325 ) ( not ( = ?auto_33324 ?auto_33328 ) ) ( AVAILABLE ?auto_33328 ) ( SURFACE-AT ?auto_33319 ?auto_33325 ) ( ON ?auto_33319 ?auto_33323 ) ( CLEAR ?auto_33319 ) ( not ( = ?auto_33318 ?auto_33323 ) ) ( not ( = ?auto_33319 ?auto_33323 ) ) ( not ( = ?auto_33317 ?auto_33323 ) ) ( IS-CRATE ?auto_33318 ) ( not ( = ?auto_33329 ?auto_33331 ) ) ( not ( = ?auto_33325 ?auto_33329 ) ) ( HOIST-AT ?auto_33320 ?auto_33329 ) ( not ( = ?auto_33324 ?auto_33320 ) ) ( not ( = ?auto_33328 ?auto_33320 ) ) ( AVAILABLE ?auto_33320 ) ( SURFACE-AT ?auto_33318 ?auto_33329 ) ( ON ?auto_33318 ?auto_33322 ) ( CLEAR ?auto_33318 ) ( not ( = ?auto_33318 ?auto_33322 ) ) ( not ( = ?auto_33319 ?auto_33322 ) ) ( not ( = ?auto_33317 ?auto_33322 ) ) ( not ( = ?auto_33323 ?auto_33322 ) ) ( SURFACE-AT ?auto_33316 ?auto_33331 ) ( CLEAR ?auto_33316 ) ( IS-CRATE ?auto_33317 ) ( not ( = ?auto_33316 ?auto_33317 ) ) ( not ( = ?auto_33318 ?auto_33316 ) ) ( not ( = ?auto_33319 ?auto_33316 ) ) ( not ( = ?auto_33323 ?auto_33316 ) ) ( not ( = ?auto_33322 ?auto_33316 ) ) ( AVAILABLE ?auto_33324 ) ( TRUCK-AT ?auto_33330 ?auto_33326 ) ( not ( = ?auto_33326 ?auto_33331 ) ) ( not ( = ?auto_33325 ?auto_33326 ) ) ( not ( = ?auto_33329 ?auto_33326 ) ) ( HOIST-AT ?auto_33327 ?auto_33326 ) ( not ( = ?auto_33324 ?auto_33327 ) ) ( not ( = ?auto_33328 ?auto_33327 ) ) ( not ( = ?auto_33320 ?auto_33327 ) ) ( AVAILABLE ?auto_33327 ) ( SURFACE-AT ?auto_33317 ?auto_33326 ) ( ON ?auto_33317 ?auto_33321 ) ( CLEAR ?auto_33317 ) ( not ( = ?auto_33318 ?auto_33321 ) ) ( not ( = ?auto_33319 ?auto_33321 ) ) ( not ( = ?auto_33317 ?auto_33321 ) ) ( not ( = ?auto_33323 ?auto_33321 ) ) ( not ( = ?auto_33322 ?auto_33321 ) ) ( not ( = ?auto_33316 ?auto_33321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33317 ?auto_33318 ?auto_33319 )
      ( MAKE-3CRATE-VERIFY ?auto_33316 ?auto_33317 ?auto_33318 ?auto_33319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33332 - SURFACE
      ?auto_33333 - SURFACE
    )
    :vars
    (
      ?auto_33338 - HOIST
      ?auto_33347 - PLACE
      ?auto_33340 - SURFACE
      ?auto_33339 - PLACE
      ?auto_33343 - HOIST
      ?auto_33337 - SURFACE
      ?auto_33344 - PLACE
      ?auto_33334 - HOIST
      ?auto_33336 - SURFACE
      ?auto_33345 - SURFACE
      ?auto_33341 - PLACE
      ?auto_33342 - HOIST
      ?auto_33335 - SURFACE
      ?auto_33346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33338 ?auto_33347 ) ( IS-CRATE ?auto_33333 ) ( not ( = ?auto_33332 ?auto_33333 ) ) ( not ( = ?auto_33340 ?auto_33332 ) ) ( not ( = ?auto_33340 ?auto_33333 ) ) ( not ( = ?auto_33339 ?auto_33347 ) ) ( HOIST-AT ?auto_33343 ?auto_33339 ) ( not ( = ?auto_33338 ?auto_33343 ) ) ( AVAILABLE ?auto_33343 ) ( SURFACE-AT ?auto_33333 ?auto_33339 ) ( ON ?auto_33333 ?auto_33337 ) ( CLEAR ?auto_33333 ) ( not ( = ?auto_33332 ?auto_33337 ) ) ( not ( = ?auto_33333 ?auto_33337 ) ) ( not ( = ?auto_33340 ?auto_33337 ) ) ( IS-CRATE ?auto_33332 ) ( not ( = ?auto_33344 ?auto_33347 ) ) ( not ( = ?auto_33339 ?auto_33344 ) ) ( HOIST-AT ?auto_33334 ?auto_33344 ) ( not ( = ?auto_33338 ?auto_33334 ) ) ( not ( = ?auto_33343 ?auto_33334 ) ) ( AVAILABLE ?auto_33334 ) ( SURFACE-AT ?auto_33332 ?auto_33344 ) ( ON ?auto_33332 ?auto_33336 ) ( CLEAR ?auto_33332 ) ( not ( = ?auto_33332 ?auto_33336 ) ) ( not ( = ?auto_33333 ?auto_33336 ) ) ( not ( = ?auto_33340 ?auto_33336 ) ) ( not ( = ?auto_33337 ?auto_33336 ) ) ( SURFACE-AT ?auto_33345 ?auto_33347 ) ( CLEAR ?auto_33345 ) ( IS-CRATE ?auto_33340 ) ( not ( = ?auto_33345 ?auto_33340 ) ) ( not ( = ?auto_33332 ?auto_33345 ) ) ( not ( = ?auto_33333 ?auto_33345 ) ) ( not ( = ?auto_33337 ?auto_33345 ) ) ( not ( = ?auto_33336 ?auto_33345 ) ) ( AVAILABLE ?auto_33338 ) ( not ( = ?auto_33341 ?auto_33347 ) ) ( not ( = ?auto_33339 ?auto_33341 ) ) ( not ( = ?auto_33344 ?auto_33341 ) ) ( HOIST-AT ?auto_33342 ?auto_33341 ) ( not ( = ?auto_33338 ?auto_33342 ) ) ( not ( = ?auto_33343 ?auto_33342 ) ) ( not ( = ?auto_33334 ?auto_33342 ) ) ( AVAILABLE ?auto_33342 ) ( SURFACE-AT ?auto_33340 ?auto_33341 ) ( ON ?auto_33340 ?auto_33335 ) ( CLEAR ?auto_33340 ) ( not ( = ?auto_33332 ?auto_33335 ) ) ( not ( = ?auto_33333 ?auto_33335 ) ) ( not ( = ?auto_33340 ?auto_33335 ) ) ( not ( = ?auto_33337 ?auto_33335 ) ) ( not ( = ?auto_33336 ?auto_33335 ) ) ( not ( = ?auto_33345 ?auto_33335 ) ) ( TRUCK-AT ?auto_33346 ?auto_33347 ) )
    :subtasks
    ( ( !DRIVE ?auto_33346 ?auto_33347 ?auto_33341 )
      ( MAKE-2CRATE ?auto_33340 ?auto_33332 ?auto_33333 )
      ( MAKE-1CRATE-VERIFY ?auto_33332 ?auto_33333 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33348 - SURFACE
      ?auto_33349 - SURFACE
      ?auto_33350 - SURFACE
    )
    :vars
    (
      ?auto_33358 - HOIST
      ?auto_33354 - PLACE
      ?auto_33352 - PLACE
      ?auto_33359 - HOIST
      ?auto_33363 - SURFACE
      ?auto_33362 - PLACE
      ?auto_33351 - HOIST
      ?auto_33356 - SURFACE
      ?auto_33361 - SURFACE
      ?auto_33355 - PLACE
      ?auto_33357 - HOIST
      ?auto_33353 - SURFACE
      ?auto_33360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33358 ?auto_33354 ) ( IS-CRATE ?auto_33350 ) ( not ( = ?auto_33349 ?auto_33350 ) ) ( not ( = ?auto_33348 ?auto_33349 ) ) ( not ( = ?auto_33348 ?auto_33350 ) ) ( not ( = ?auto_33352 ?auto_33354 ) ) ( HOIST-AT ?auto_33359 ?auto_33352 ) ( not ( = ?auto_33358 ?auto_33359 ) ) ( AVAILABLE ?auto_33359 ) ( SURFACE-AT ?auto_33350 ?auto_33352 ) ( ON ?auto_33350 ?auto_33363 ) ( CLEAR ?auto_33350 ) ( not ( = ?auto_33349 ?auto_33363 ) ) ( not ( = ?auto_33350 ?auto_33363 ) ) ( not ( = ?auto_33348 ?auto_33363 ) ) ( IS-CRATE ?auto_33349 ) ( not ( = ?auto_33362 ?auto_33354 ) ) ( not ( = ?auto_33352 ?auto_33362 ) ) ( HOIST-AT ?auto_33351 ?auto_33362 ) ( not ( = ?auto_33358 ?auto_33351 ) ) ( not ( = ?auto_33359 ?auto_33351 ) ) ( AVAILABLE ?auto_33351 ) ( SURFACE-AT ?auto_33349 ?auto_33362 ) ( ON ?auto_33349 ?auto_33356 ) ( CLEAR ?auto_33349 ) ( not ( = ?auto_33349 ?auto_33356 ) ) ( not ( = ?auto_33350 ?auto_33356 ) ) ( not ( = ?auto_33348 ?auto_33356 ) ) ( not ( = ?auto_33363 ?auto_33356 ) ) ( SURFACE-AT ?auto_33361 ?auto_33354 ) ( CLEAR ?auto_33361 ) ( IS-CRATE ?auto_33348 ) ( not ( = ?auto_33361 ?auto_33348 ) ) ( not ( = ?auto_33349 ?auto_33361 ) ) ( not ( = ?auto_33350 ?auto_33361 ) ) ( not ( = ?auto_33363 ?auto_33361 ) ) ( not ( = ?auto_33356 ?auto_33361 ) ) ( AVAILABLE ?auto_33358 ) ( not ( = ?auto_33355 ?auto_33354 ) ) ( not ( = ?auto_33352 ?auto_33355 ) ) ( not ( = ?auto_33362 ?auto_33355 ) ) ( HOIST-AT ?auto_33357 ?auto_33355 ) ( not ( = ?auto_33358 ?auto_33357 ) ) ( not ( = ?auto_33359 ?auto_33357 ) ) ( not ( = ?auto_33351 ?auto_33357 ) ) ( AVAILABLE ?auto_33357 ) ( SURFACE-AT ?auto_33348 ?auto_33355 ) ( ON ?auto_33348 ?auto_33353 ) ( CLEAR ?auto_33348 ) ( not ( = ?auto_33349 ?auto_33353 ) ) ( not ( = ?auto_33350 ?auto_33353 ) ) ( not ( = ?auto_33348 ?auto_33353 ) ) ( not ( = ?auto_33363 ?auto_33353 ) ) ( not ( = ?auto_33356 ?auto_33353 ) ) ( not ( = ?auto_33361 ?auto_33353 ) ) ( TRUCK-AT ?auto_33360 ?auto_33354 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33349 ?auto_33350 )
      ( MAKE-2CRATE-VERIFY ?auto_33348 ?auto_33349 ?auto_33350 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33364 - SURFACE
      ?auto_33365 - SURFACE
      ?auto_33366 - SURFACE
      ?auto_33367 - SURFACE
    )
    :vars
    (
      ?auto_33377 - HOIST
      ?auto_33372 - PLACE
      ?auto_33376 - PLACE
      ?auto_33378 - HOIST
      ?auto_33373 - SURFACE
      ?auto_33379 - PLACE
      ?auto_33369 - HOIST
      ?auto_33375 - SURFACE
      ?auto_33368 - PLACE
      ?auto_33370 - HOIST
      ?auto_33371 - SURFACE
      ?auto_33374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33377 ?auto_33372 ) ( IS-CRATE ?auto_33367 ) ( not ( = ?auto_33366 ?auto_33367 ) ) ( not ( = ?auto_33365 ?auto_33366 ) ) ( not ( = ?auto_33365 ?auto_33367 ) ) ( not ( = ?auto_33376 ?auto_33372 ) ) ( HOIST-AT ?auto_33378 ?auto_33376 ) ( not ( = ?auto_33377 ?auto_33378 ) ) ( AVAILABLE ?auto_33378 ) ( SURFACE-AT ?auto_33367 ?auto_33376 ) ( ON ?auto_33367 ?auto_33373 ) ( CLEAR ?auto_33367 ) ( not ( = ?auto_33366 ?auto_33373 ) ) ( not ( = ?auto_33367 ?auto_33373 ) ) ( not ( = ?auto_33365 ?auto_33373 ) ) ( IS-CRATE ?auto_33366 ) ( not ( = ?auto_33379 ?auto_33372 ) ) ( not ( = ?auto_33376 ?auto_33379 ) ) ( HOIST-AT ?auto_33369 ?auto_33379 ) ( not ( = ?auto_33377 ?auto_33369 ) ) ( not ( = ?auto_33378 ?auto_33369 ) ) ( AVAILABLE ?auto_33369 ) ( SURFACE-AT ?auto_33366 ?auto_33379 ) ( ON ?auto_33366 ?auto_33375 ) ( CLEAR ?auto_33366 ) ( not ( = ?auto_33366 ?auto_33375 ) ) ( not ( = ?auto_33367 ?auto_33375 ) ) ( not ( = ?auto_33365 ?auto_33375 ) ) ( not ( = ?auto_33373 ?auto_33375 ) ) ( SURFACE-AT ?auto_33364 ?auto_33372 ) ( CLEAR ?auto_33364 ) ( IS-CRATE ?auto_33365 ) ( not ( = ?auto_33364 ?auto_33365 ) ) ( not ( = ?auto_33366 ?auto_33364 ) ) ( not ( = ?auto_33367 ?auto_33364 ) ) ( not ( = ?auto_33373 ?auto_33364 ) ) ( not ( = ?auto_33375 ?auto_33364 ) ) ( AVAILABLE ?auto_33377 ) ( not ( = ?auto_33368 ?auto_33372 ) ) ( not ( = ?auto_33376 ?auto_33368 ) ) ( not ( = ?auto_33379 ?auto_33368 ) ) ( HOIST-AT ?auto_33370 ?auto_33368 ) ( not ( = ?auto_33377 ?auto_33370 ) ) ( not ( = ?auto_33378 ?auto_33370 ) ) ( not ( = ?auto_33369 ?auto_33370 ) ) ( AVAILABLE ?auto_33370 ) ( SURFACE-AT ?auto_33365 ?auto_33368 ) ( ON ?auto_33365 ?auto_33371 ) ( CLEAR ?auto_33365 ) ( not ( = ?auto_33366 ?auto_33371 ) ) ( not ( = ?auto_33367 ?auto_33371 ) ) ( not ( = ?auto_33365 ?auto_33371 ) ) ( not ( = ?auto_33373 ?auto_33371 ) ) ( not ( = ?auto_33375 ?auto_33371 ) ) ( not ( = ?auto_33364 ?auto_33371 ) ) ( TRUCK-AT ?auto_33374 ?auto_33372 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33365 ?auto_33366 ?auto_33367 )
      ( MAKE-3CRATE-VERIFY ?auto_33364 ?auto_33365 ?auto_33366 ?auto_33367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33394 - SURFACE
      ?auto_33395 - SURFACE
    )
    :vars
    (
      ?auto_33396 - HOIST
      ?auto_33397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33396 ?auto_33397 ) ( SURFACE-AT ?auto_33394 ?auto_33397 ) ( CLEAR ?auto_33394 ) ( LIFTING ?auto_33396 ?auto_33395 ) ( IS-CRATE ?auto_33395 ) ( not ( = ?auto_33394 ?auto_33395 ) ) )
    :subtasks
    ( ( !DROP ?auto_33396 ?auto_33395 ?auto_33394 ?auto_33397 )
      ( MAKE-1CRATE-VERIFY ?auto_33394 ?auto_33395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33398 - SURFACE
      ?auto_33399 - SURFACE
      ?auto_33400 - SURFACE
    )
    :vars
    (
      ?auto_33401 - HOIST
      ?auto_33402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33401 ?auto_33402 ) ( SURFACE-AT ?auto_33399 ?auto_33402 ) ( CLEAR ?auto_33399 ) ( LIFTING ?auto_33401 ?auto_33400 ) ( IS-CRATE ?auto_33400 ) ( not ( = ?auto_33399 ?auto_33400 ) ) ( ON ?auto_33399 ?auto_33398 ) ( not ( = ?auto_33398 ?auto_33399 ) ) ( not ( = ?auto_33398 ?auto_33400 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33399 ?auto_33400 )
      ( MAKE-2CRATE-VERIFY ?auto_33398 ?auto_33399 ?auto_33400 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33403 - SURFACE
      ?auto_33404 - SURFACE
      ?auto_33405 - SURFACE
      ?auto_33406 - SURFACE
    )
    :vars
    (
      ?auto_33407 - HOIST
      ?auto_33408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33407 ?auto_33408 ) ( SURFACE-AT ?auto_33405 ?auto_33408 ) ( CLEAR ?auto_33405 ) ( LIFTING ?auto_33407 ?auto_33406 ) ( IS-CRATE ?auto_33406 ) ( not ( = ?auto_33405 ?auto_33406 ) ) ( ON ?auto_33404 ?auto_33403 ) ( ON ?auto_33405 ?auto_33404 ) ( not ( = ?auto_33403 ?auto_33404 ) ) ( not ( = ?auto_33403 ?auto_33405 ) ) ( not ( = ?auto_33403 ?auto_33406 ) ) ( not ( = ?auto_33404 ?auto_33405 ) ) ( not ( = ?auto_33404 ?auto_33406 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33405 ?auto_33406 )
      ( MAKE-3CRATE-VERIFY ?auto_33403 ?auto_33404 ?auto_33405 ?auto_33406 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33409 - SURFACE
      ?auto_33410 - SURFACE
      ?auto_33411 - SURFACE
      ?auto_33412 - SURFACE
      ?auto_33413 - SURFACE
    )
    :vars
    (
      ?auto_33414 - HOIST
      ?auto_33415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33414 ?auto_33415 ) ( SURFACE-AT ?auto_33412 ?auto_33415 ) ( CLEAR ?auto_33412 ) ( LIFTING ?auto_33414 ?auto_33413 ) ( IS-CRATE ?auto_33413 ) ( not ( = ?auto_33412 ?auto_33413 ) ) ( ON ?auto_33410 ?auto_33409 ) ( ON ?auto_33411 ?auto_33410 ) ( ON ?auto_33412 ?auto_33411 ) ( not ( = ?auto_33409 ?auto_33410 ) ) ( not ( = ?auto_33409 ?auto_33411 ) ) ( not ( = ?auto_33409 ?auto_33412 ) ) ( not ( = ?auto_33409 ?auto_33413 ) ) ( not ( = ?auto_33410 ?auto_33411 ) ) ( not ( = ?auto_33410 ?auto_33412 ) ) ( not ( = ?auto_33410 ?auto_33413 ) ) ( not ( = ?auto_33411 ?auto_33412 ) ) ( not ( = ?auto_33411 ?auto_33413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33412 ?auto_33413 )
      ( MAKE-4CRATE-VERIFY ?auto_33409 ?auto_33410 ?auto_33411 ?auto_33412 ?auto_33413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33416 - SURFACE
      ?auto_33417 - SURFACE
    )
    :vars
    (
      ?auto_33418 - HOIST
      ?auto_33419 - PLACE
      ?auto_33420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33418 ?auto_33419 ) ( SURFACE-AT ?auto_33416 ?auto_33419 ) ( CLEAR ?auto_33416 ) ( IS-CRATE ?auto_33417 ) ( not ( = ?auto_33416 ?auto_33417 ) ) ( TRUCK-AT ?auto_33420 ?auto_33419 ) ( AVAILABLE ?auto_33418 ) ( IN ?auto_33417 ?auto_33420 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33418 ?auto_33417 ?auto_33420 ?auto_33419 )
      ( MAKE-1CRATE ?auto_33416 ?auto_33417 )
      ( MAKE-1CRATE-VERIFY ?auto_33416 ?auto_33417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33421 - SURFACE
      ?auto_33422 - SURFACE
      ?auto_33423 - SURFACE
    )
    :vars
    (
      ?auto_33425 - HOIST
      ?auto_33426 - PLACE
      ?auto_33424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33425 ?auto_33426 ) ( SURFACE-AT ?auto_33422 ?auto_33426 ) ( CLEAR ?auto_33422 ) ( IS-CRATE ?auto_33423 ) ( not ( = ?auto_33422 ?auto_33423 ) ) ( TRUCK-AT ?auto_33424 ?auto_33426 ) ( AVAILABLE ?auto_33425 ) ( IN ?auto_33423 ?auto_33424 ) ( ON ?auto_33422 ?auto_33421 ) ( not ( = ?auto_33421 ?auto_33422 ) ) ( not ( = ?auto_33421 ?auto_33423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33422 ?auto_33423 )
      ( MAKE-2CRATE-VERIFY ?auto_33421 ?auto_33422 ?auto_33423 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33427 - SURFACE
      ?auto_33428 - SURFACE
      ?auto_33429 - SURFACE
      ?auto_33430 - SURFACE
    )
    :vars
    (
      ?auto_33432 - HOIST
      ?auto_33433 - PLACE
      ?auto_33431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33432 ?auto_33433 ) ( SURFACE-AT ?auto_33429 ?auto_33433 ) ( CLEAR ?auto_33429 ) ( IS-CRATE ?auto_33430 ) ( not ( = ?auto_33429 ?auto_33430 ) ) ( TRUCK-AT ?auto_33431 ?auto_33433 ) ( AVAILABLE ?auto_33432 ) ( IN ?auto_33430 ?auto_33431 ) ( ON ?auto_33429 ?auto_33428 ) ( not ( = ?auto_33428 ?auto_33429 ) ) ( not ( = ?auto_33428 ?auto_33430 ) ) ( ON ?auto_33428 ?auto_33427 ) ( not ( = ?auto_33427 ?auto_33428 ) ) ( not ( = ?auto_33427 ?auto_33429 ) ) ( not ( = ?auto_33427 ?auto_33430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33428 ?auto_33429 ?auto_33430 )
      ( MAKE-3CRATE-VERIFY ?auto_33427 ?auto_33428 ?auto_33429 ?auto_33430 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33434 - SURFACE
      ?auto_33435 - SURFACE
      ?auto_33436 - SURFACE
      ?auto_33437 - SURFACE
      ?auto_33438 - SURFACE
    )
    :vars
    (
      ?auto_33440 - HOIST
      ?auto_33441 - PLACE
      ?auto_33439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33440 ?auto_33441 ) ( SURFACE-AT ?auto_33437 ?auto_33441 ) ( CLEAR ?auto_33437 ) ( IS-CRATE ?auto_33438 ) ( not ( = ?auto_33437 ?auto_33438 ) ) ( TRUCK-AT ?auto_33439 ?auto_33441 ) ( AVAILABLE ?auto_33440 ) ( IN ?auto_33438 ?auto_33439 ) ( ON ?auto_33437 ?auto_33436 ) ( not ( = ?auto_33436 ?auto_33437 ) ) ( not ( = ?auto_33436 ?auto_33438 ) ) ( ON ?auto_33435 ?auto_33434 ) ( ON ?auto_33436 ?auto_33435 ) ( not ( = ?auto_33434 ?auto_33435 ) ) ( not ( = ?auto_33434 ?auto_33436 ) ) ( not ( = ?auto_33434 ?auto_33437 ) ) ( not ( = ?auto_33434 ?auto_33438 ) ) ( not ( = ?auto_33435 ?auto_33436 ) ) ( not ( = ?auto_33435 ?auto_33437 ) ) ( not ( = ?auto_33435 ?auto_33438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33436 ?auto_33437 ?auto_33438 )
      ( MAKE-4CRATE-VERIFY ?auto_33434 ?auto_33435 ?auto_33436 ?auto_33437 ?auto_33438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33442 - SURFACE
      ?auto_33443 - SURFACE
    )
    :vars
    (
      ?auto_33445 - HOIST
      ?auto_33447 - PLACE
      ?auto_33444 - TRUCK
      ?auto_33446 - SURFACE
      ?auto_33448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33445 ?auto_33447 ) ( SURFACE-AT ?auto_33442 ?auto_33447 ) ( CLEAR ?auto_33442 ) ( IS-CRATE ?auto_33443 ) ( not ( = ?auto_33442 ?auto_33443 ) ) ( AVAILABLE ?auto_33445 ) ( IN ?auto_33443 ?auto_33444 ) ( ON ?auto_33442 ?auto_33446 ) ( not ( = ?auto_33446 ?auto_33442 ) ) ( not ( = ?auto_33446 ?auto_33443 ) ) ( TRUCK-AT ?auto_33444 ?auto_33448 ) ( not ( = ?auto_33448 ?auto_33447 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33444 ?auto_33448 ?auto_33447 )
      ( MAKE-2CRATE ?auto_33446 ?auto_33442 ?auto_33443 )
      ( MAKE-1CRATE-VERIFY ?auto_33442 ?auto_33443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33449 - SURFACE
      ?auto_33450 - SURFACE
      ?auto_33451 - SURFACE
    )
    :vars
    (
      ?auto_33453 - HOIST
      ?auto_33454 - PLACE
      ?auto_33455 - TRUCK
      ?auto_33452 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33453 ?auto_33454 ) ( SURFACE-AT ?auto_33450 ?auto_33454 ) ( CLEAR ?auto_33450 ) ( IS-CRATE ?auto_33451 ) ( not ( = ?auto_33450 ?auto_33451 ) ) ( AVAILABLE ?auto_33453 ) ( IN ?auto_33451 ?auto_33455 ) ( ON ?auto_33450 ?auto_33449 ) ( not ( = ?auto_33449 ?auto_33450 ) ) ( not ( = ?auto_33449 ?auto_33451 ) ) ( TRUCK-AT ?auto_33455 ?auto_33452 ) ( not ( = ?auto_33452 ?auto_33454 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33450 ?auto_33451 )
      ( MAKE-2CRATE-VERIFY ?auto_33449 ?auto_33450 ?auto_33451 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33456 - SURFACE
      ?auto_33457 - SURFACE
      ?auto_33458 - SURFACE
      ?auto_33459 - SURFACE
    )
    :vars
    (
      ?auto_33462 - HOIST
      ?auto_33461 - PLACE
      ?auto_33460 - TRUCK
      ?auto_33463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33462 ?auto_33461 ) ( SURFACE-AT ?auto_33458 ?auto_33461 ) ( CLEAR ?auto_33458 ) ( IS-CRATE ?auto_33459 ) ( not ( = ?auto_33458 ?auto_33459 ) ) ( AVAILABLE ?auto_33462 ) ( IN ?auto_33459 ?auto_33460 ) ( ON ?auto_33458 ?auto_33457 ) ( not ( = ?auto_33457 ?auto_33458 ) ) ( not ( = ?auto_33457 ?auto_33459 ) ) ( TRUCK-AT ?auto_33460 ?auto_33463 ) ( not ( = ?auto_33463 ?auto_33461 ) ) ( ON ?auto_33457 ?auto_33456 ) ( not ( = ?auto_33456 ?auto_33457 ) ) ( not ( = ?auto_33456 ?auto_33458 ) ) ( not ( = ?auto_33456 ?auto_33459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33457 ?auto_33458 ?auto_33459 )
      ( MAKE-3CRATE-VERIFY ?auto_33456 ?auto_33457 ?auto_33458 ?auto_33459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33464 - SURFACE
      ?auto_33465 - SURFACE
      ?auto_33466 - SURFACE
      ?auto_33467 - SURFACE
      ?auto_33468 - SURFACE
    )
    :vars
    (
      ?auto_33471 - HOIST
      ?auto_33470 - PLACE
      ?auto_33469 - TRUCK
      ?auto_33472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33471 ?auto_33470 ) ( SURFACE-AT ?auto_33467 ?auto_33470 ) ( CLEAR ?auto_33467 ) ( IS-CRATE ?auto_33468 ) ( not ( = ?auto_33467 ?auto_33468 ) ) ( AVAILABLE ?auto_33471 ) ( IN ?auto_33468 ?auto_33469 ) ( ON ?auto_33467 ?auto_33466 ) ( not ( = ?auto_33466 ?auto_33467 ) ) ( not ( = ?auto_33466 ?auto_33468 ) ) ( TRUCK-AT ?auto_33469 ?auto_33472 ) ( not ( = ?auto_33472 ?auto_33470 ) ) ( ON ?auto_33465 ?auto_33464 ) ( ON ?auto_33466 ?auto_33465 ) ( not ( = ?auto_33464 ?auto_33465 ) ) ( not ( = ?auto_33464 ?auto_33466 ) ) ( not ( = ?auto_33464 ?auto_33467 ) ) ( not ( = ?auto_33464 ?auto_33468 ) ) ( not ( = ?auto_33465 ?auto_33466 ) ) ( not ( = ?auto_33465 ?auto_33467 ) ) ( not ( = ?auto_33465 ?auto_33468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33466 ?auto_33467 ?auto_33468 )
      ( MAKE-4CRATE-VERIFY ?auto_33464 ?auto_33465 ?auto_33466 ?auto_33467 ?auto_33468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33473 - SURFACE
      ?auto_33474 - SURFACE
    )
    :vars
    (
      ?auto_33478 - HOIST
      ?auto_33476 - PLACE
      ?auto_33477 - SURFACE
      ?auto_33475 - TRUCK
      ?auto_33479 - PLACE
      ?auto_33480 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33478 ?auto_33476 ) ( SURFACE-AT ?auto_33473 ?auto_33476 ) ( CLEAR ?auto_33473 ) ( IS-CRATE ?auto_33474 ) ( not ( = ?auto_33473 ?auto_33474 ) ) ( AVAILABLE ?auto_33478 ) ( ON ?auto_33473 ?auto_33477 ) ( not ( = ?auto_33477 ?auto_33473 ) ) ( not ( = ?auto_33477 ?auto_33474 ) ) ( TRUCK-AT ?auto_33475 ?auto_33479 ) ( not ( = ?auto_33479 ?auto_33476 ) ) ( HOIST-AT ?auto_33480 ?auto_33479 ) ( LIFTING ?auto_33480 ?auto_33474 ) ( not ( = ?auto_33478 ?auto_33480 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33480 ?auto_33474 ?auto_33475 ?auto_33479 )
      ( MAKE-2CRATE ?auto_33477 ?auto_33473 ?auto_33474 )
      ( MAKE-1CRATE-VERIFY ?auto_33473 ?auto_33474 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33481 - SURFACE
      ?auto_33482 - SURFACE
      ?auto_33483 - SURFACE
    )
    :vars
    (
      ?auto_33487 - HOIST
      ?auto_33485 - PLACE
      ?auto_33486 - TRUCK
      ?auto_33484 - PLACE
      ?auto_33488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33487 ?auto_33485 ) ( SURFACE-AT ?auto_33482 ?auto_33485 ) ( CLEAR ?auto_33482 ) ( IS-CRATE ?auto_33483 ) ( not ( = ?auto_33482 ?auto_33483 ) ) ( AVAILABLE ?auto_33487 ) ( ON ?auto_33482 ?auto_33481 ) ( not ( = ?auto_33481 ?auto_33482 ) ) ( not ( = ?auto_33481 ?auto_33483 ) ) ( TRUCK-AT ?auto_33486 ?auto_33484 ) ( not ( = ?auto_33484 ?auto_33485 ) ) ( HOIST-AT ?auto_33488 ?auto_33484 ) ( LIFTING ?auto_33488 ?auto_33483 ) ( not ( = ?auto_33487 ?auto_33488 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33482 ?auto_33483 )
      ( MAKE-2CRATE-VERIFY ?auto_33481 ?auto_33482 ?auto_33483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33489 - SURFACE
      ?auto_33490 - SURFACE
      ?auto_33491 - SURFACE
      ?auto_33492 - SURFACE
    )
    :vars
    (
      ?auto_33496 - HOIST
      ?auto_33497 - PLACE
      ?auto_33494 - TRUCK
      ?auto_33495 - PLACE
      ?auto_33493 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33496 ?auto_33497 ) ( SURFACE-AT ?auto_33491 ?auto_33497 ) ( CLEAR ?auto_33491 ) ( IS-CRATE ?auto_33492 ) ( not ( = ?auto_33491 ?auto_33492 ) ) ( AVAILABLE ?auto_33496 ) ( ON ?auto_33491 ?auto_33490 ) ( not ( = ?auto_33490 ?auto_33491 ) ) ( not ( = ?auto_33490 ?auto_33492 ) ) ( TRUCK-AT ?auto_33494 ?auto_33495 ) ( not ( = ?auto_33495 ?auto_33497 ) ) ( HOIST-AT ?auto_33493 ?auto_33495 ) ( LIFTING ?auto_33493 ?auto_33492 ) ( not ( = ?auto_33496 ?auto_33493 ) ) ( ON ?auto_33490 ?auto_33489 ) ( not ( = ?auto_33489 ?auto_33490 ) ) ( not ( = ?auto_33489 ?auto_33491 ) ) ( not ( = ?auto_33489 ?auto_33492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33490 ?auto_33491 ?auto_33492 )
      ( MAKE-3CRATE-VERIFY ?auto_33489 ?auto_33490 ?auto_33491 ?auto_33492 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33498 - SURFACE
      ?auto_33499 - SURFACE
      ?auto_33500 - SURFACE
      ?auto_33501 - SURFACE
      ?auto_33502 - SURFACE
    )
    :vars
    (
      ?auto_33506 - HOIST
      ?auto_33507 - PLACE
      ?auto_33504 - TRUCK
      ?auto_33505 - PLACE
      ?auto_33503 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33506 ?auto_33507 ) ( SURFACE-AT ?auto_33501 ?auto_33507 ) ( CLEAR ?auto_33501 ) ( IS-CRATE ?auto_33502 ) ( not ( = ?auto_33501 ?auto_33502 ) ) ( AVAILABLE ?auto_33506 ) ( ON ?auto_33501 ?auto_33500 ) ( not ( = ?auto_33500 ?auto_33501 ) ) ( not ( = ?auto_33500 ?auto_33502 ) ) ( TRUCK-AT ?auto_33504 ?auto_33505 ) ( not ( = ?auto_33505 ?auto_33507 ) ) ( HOIST-AT ?auto_33503 ?auto_33505 ) ( LIFTING ?auto_33503 ?auto_33502 ) ( not ( = ?auto_33506 ?auto_33503 ) ) ( ON ?auto_33499 ?auto_33498 ) ( ON ?auto_33500 ?auto_33499 ) ( not ( = ?auto_33498 ?auto_33499 ) ) ( not ( = ?auto_33498 ?auto_33500 ) ) ( not ( = ?auto_33498 ?auto_33501 ) ) ( not ( = ?auto_33498 ?auto_33502 ) ) ( not ( = ?auto_33499 ?auto_33500 ) ) ( not ( = ?auto_33499 ?auto_33501 ) ) ( not ( = ?auto_33499 ?auto_33502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33500 ?auto_33501 ?auto_33502 )
      ( MAKE-4CRATE-VERIFY ?auto_33498 ?auto_33499 ?auto_33500 ?auto_33501 ?auto_33502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33508 - SURFACE
      ?auto_33509 - SURFACE
    )
    :vars
    (
      ?auto_33514 - HOIST
      ?auto_33515 - PLACE
      ?auto_33512 - SURFACE
      ?auto_33511 - TRUCK
      ?auto_33513 - PLACE
      ?auto_33510 - HOIST
      ?auto_33516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33514 ?auto_33515 ) ( SURFACE-AT ?auto_33508 ?auto_33515 ) ( CLEAR ?auto_33508 ) ( IS-CRATE ?auto_33509 ) ( not ( = ?auto_33508 ?auto_33509 ) ) ( AVAILABLE ?auto_33514 ) ( ON ?auto_33508 ?auto_33512 ) ( not ( = ?auto_33512 ?auto_33508 ) ) ( not ( = ?auto_33512 ?auto_33509 ) ) ( TRUCK-AT ?auto_33511 ?auto_33513 ) ( not ( = ?auto_33513 ?auto_33515 ) ) ( HOIST-AT ?auto_33510 ?auto_33513 ) ( not ( = ?auto_33514 ?auto_33510 ) ) ( AVAILABLE ?auto_33510 ) ( SURFACE-AT ?auto_33509 ?auto_33513 ) ( ON ?auto_33509 ?auto_33516 ) ( CLEAR ?auto_33509 ) ( not ( = ?auto_33508 ?auto_33516 ) ) ( not ( = ?auto_33509 ?auto_33516 ) ) ( not ( = ?auto_33512 ?auto_33516 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33510 ?auto_33509 ?auto_33516 ?auto_33513 )
      ( MAKE-2CRATE ?auto_33512 ?auto_33508 ?auto_33509 )
      ( MAKE-1CRATE-VERIFY ?auto_33508 ?auto_33509 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33517 - SURFACE
      ?auto_33518 - SURFACE
      ?auto_33519 - SURFACE
    )
    :vars
    (
      ?auto_33525 - HOIST
      ?auto_33522 - PLACE
      ?auto_33524 - TRUCK
      ?auto_33520 - PLACE
      ?auto_33523 - HOIST
      ?auto_33521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33525 ?auto_33522 ) ( SURFACE-AT ?auto_33518 ?auto_33522 ) ( CLEAR ?auto_33518 ) ( IS-CRATE ?auto_33519 ) ( not ( = ?auto_33518 ?auto_33519 ) ) ( AVAILABLE ?auto_33525 ) ( ON ?auto_33518 ?auto_33517 ) ( not ( = ?auto_33517 ?auto_33518 ) ) ( not ( = ?auto_33517 ?auto_33519 ) ) ( TRUCK-AT ?auto_33524 ?auto_33520 ) ( not ( = ?auto_33520 ?auto_33522 ) ) ( HOIST-AT ?auto_33523 ?auto_33520 ) ( not ( = ?auto_33525 ?auto_33523 ) ) ( AVAILABLE ?auto_33523 ) ( SURFACE-AT ?auto_33519 ?auto_33520 ) ( ON ?auto_33519 ?auto_33521 ) ( CLEAR ?auto_33519 ) ( not ( = ?auto_33518 ?auto_33521 ) ) ( not ( = ?auto_33519 ?auto_33521 ) ) ( not ( = ?auto_33517 ?auto_33521 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33518 ?auto_33519 )
      ( MAKE-2CRATE-VERIFY ?auto_33517 ?auto_33518 ?auto_33519 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33526 - SURFACE
      ?auto_33527 - SURFACE
      ?auto_33528 - SURFACE
      ?auto_33529 - SURFACE
    )
    :vars
    (
      ?auto_33534 - HOIST
      ?auto_33535 - PLACE
      ?auto_33532 - TRUCK
      ?auto_33530 - PLACE
      ?auto_33533 - HOIST
      ?auto_33531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33534 ?auto_33535 ) ( SURFACE-AT ?auto_33528 ?auto_33535 ) ( CLEAR ?auto_33528 ) ( IS-CRATE ?auto_33529 ) ( not ( = ?auto_33528 ?auto_33529 ) ) ( AVAILABLE ?auto_33534 ) ( ON ?auto_33528 ?auto_33527 ) ( not ( = ?auto_33527 ?auto_33528 ) ) ( not ( = ?auto_33527 ?auto_33529 ) ) ( TRUCK-AT ?auto_33532 ?auto_33530 ) ( not ( = ?auto_33530 ?auto_33535 ) ) ( HOIST-AT ?auto_33533 ?auto_33530 ) ( not ( = ?auto_33534 ?auto_33533 ) ) ( AVAILABLE ?auto_33533 ) ( SURFACE-AT ?auto_33529 ?auto_33530 ) ( ON ?auto_33529 ?auto_33531 ) ( CLEAR ?auto_33529 ) ( not ( = ?auto_33528 ?auto_33531 ) ) ( not ( = ?auto_33529 ?auto_33531 ) ) ( not ( = ?auto_33527 ?auto_33531 ) ) ( ON ?auto_33527 ?auto_33526 ) ( not ( = ?auto_33526 ?auto_33527 ) ) ( not ( = ?auto_33526 ?auto_33528 ) ) ( not ( = ?auto_33526 ?auto_33529 ) ) ( not ( = ?auto_33526 ?auto_33531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33527 ?auto_33528 ?auto_33529 )
      ( MAKE-3CRATE-VERIFY ?auto_33526 ?auto_33527 ?auto_33528 ?auto_33529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33536 - SURFACE
      ?auto_33537 - SURFACE
      ?auto_33538 - SURFACE
      ?auto_33539 - SURFACE
      ?auto_33540 - SURFACE
    )
    :vars
    (
      ?auto_33545 - HOIST
      ?auto_33546 - PLACE
      ?auto_33543 - TRUCK
      ?auto_33541 - PLACE
      ?auto_33544 - HOIST
      ?auto_33542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33545 ?auto_33546 ) ( SURFACE-AT ?auto_33539 ?auto_33546 ) ( CLEAR ?auto_33539 ) ( IS-CRATE ?auto_33540 ) ( not ( = ?auto_33539 ?auto_33540 ) ) ( AVAILABLE ?auto_33545 ) ( ON ?auto_33539 ?auto_33538 ) ( not ( = ?auto_33538 ?auto_33539 ) ) ( not ( = ?auto_33538 ?auto_33540 ) ) ( TRUCK-AT ?auto_33543 ?auto_33541 ) ( not ( = ?auto_33541 ?auto_33546 ) ) ( HOIST-AT ?auto_33544 ?auto_33541 ) ( not ( = ?auto_33545 ?auto_33544 ) ) ( AVAILABLE ?auto_33544 ) ( SURFACE-AT ?auto_33540 ?auto_33541 ) ( ON ?auto_33540 ?auto_33542 ) ( CLEAR ?auto_33540 ) ( not ( = ?auto_33539 ?auto_33542 ) ) ( not ( = ?auto_33540 ?auto_33542 ) ) ( not ( = ?auto_33538 ?auto_33542 ) ) ( ON ?auto_33537 ?auto_33536 ) ( ON ?auto_33538 ?auto_33537 ) ( not ( = ?auto_33536 ?auto_33537 ) ) ( not ( = ?auto_33536 ?auto_33538 ) ) ( not ( = ?auto_33536 ?auto_33539 ) ) ( not ( = ?auto_33536 ?auto_33540 ) ) ( not ( = ?auto_33536 ?auto_33542 ) ) ( not ( = ?auto_33537 ?auto_33538 ) ) ( not ( = ?auto_33537 ?auto_33539 ) ) ( not ( = ?auto_33537 ?auto_33540 ) ) ( not ( = ?auto_33537 ?auto_33542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33538 ?auto_33539 ?auto_33540 )
      ( MAKE-4CRATE-VERIFY ?auto_33536 ?auto_33537 ?auto_33538 ?auto_33539 ?auto_33540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33547 - SURFACE
      ?auto_33548 - SURFACE
    )
    :vars
    (
      ?auto_33553 - HOIST
      ?auto_33555 - PLACE
      ?auto_33554 - SURFACE
      ?auto_33549 - PLACE
      ?auto_33552 - HOIST
      ?auto_33550 - SURFACE
      ?auto_33551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33553 ?auto_33555 ) ( SURFACE-AT ?auto_33547 ?auto_33555 ) ( CLEAR ?auto_33547 ) ( IS-CRATE ?auto_33548 ) ( not ( = ?auto_33547 ?auto_33548 ) ) ( AVAILABLE ?auto_33553 ) ( ON ?auto_33547 ?auto_33554 ) ( not ( = ?auto_33554 ?auto_33547 ) ) ( not ( = ?auto_33554 ?auto_33548 ) ) ( not ( = ?auto_33549 ?auto_33555 ) ) ( HOIST-AT ?auto_33552 ?auto_33549 ) ( not ( = ?auto_33553 ?auto_33552 ) ) ( AVAILABLE ?auto_33552 ) ( SURFACE-AT ?auto_33548 ?auto_33549 ) ( ON ?auto_33548 ?auto_33550 ) ( CLEAR ?auto_33548 ) ( not ( = ?auto_33547 ?auto_33550 ) ) ( not ( = ?auto_33548 ?auto_33550 ) ) ( not ( = ?auto_33554 ?auto_33550 ) ) ( TRUCK-AT ?auto_33551 ?auto_33555 ) )
    :subtasks
    ( ( !DRIVE ?auto_33551 ?auto_33555 ?auto_33549 )
      ( MAKE-2CRATE ?auto_33554 ?auto_33547 ?auto_33548 )
      ( MAKE-1CRATE-VERIFY ?auto_33547 ?auto_33548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33556 - SURFACE
      ?auto_33557 - SURFACE
      ?auto_33558 - SURFACE
    )
    :vars
    (
      ?auto_33564 - HOIST
      ?auto_33561 - PLACE
      ?auto_33560 - PLACE
      ?auto_33562 - HOIST
      ?auto_33559 - SURFACE
      ?auto_33563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33564 ?auto_33561 ) ( SURFACE-AT ?auto_33557 ?auto_33561 ) ( CLEAR ?auto_33557 ) ( IS-CRATE ?auto_33558 ) ( not ( = ?auto_33557 ?auto_33558 ) ) ( AVAILABLE ?auto_33564 ) ( ON ?auto_33557 ?auto_33556 ) ( not ( = ?auto_33556 ?auto_33557 ) ) ( not ( = ?auto_33556 ?auto_33558 ) ) ( not ( = ?auto_33560 ?auto_33561 ) ) ( HOIST-AT ?auto_33562 ?auto_33560 ) ( not ( = ?auto_33564 ?auto_33562 ) ) ( AVAILABLE ?auto_33562 ) ( SURFACE-AT ?auto_33558 ?auto_33560 ) ( ON ?auto_33558 ?auto_33559 ) ( CLEAR ?auto_33558 ) ( not ( = ?auto_33557 ?auto_33559 ) ) ( not ( = ?auto_33558 ?auto_33559 ) ) ( not ( = ?auto_33556 ?auto_33559 ) ) ( TRUCK-AT ?auto_33563 ?auto_33561 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33557 ?auto_33558 )
      ( MAKE-2CRATE-VERIFY ?auto_33556 ?auto_33557 ?auto_33558 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33565 - SURFACE
      ?auto_33566 - SURFACE
      ?auto_33567 - SURFACE
      ?auto_33568 - SURFACE
    )
    :vars
    (
      ?auto_33569 - HOIST
      ?auto_33574 - PLACE
      ?auto_33572 - PLACE
      ?auto_33573 - HOIST
      ?auto_33571 - SURFACE
      ?auto_33570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33569 ?auto_33574 ) ( SURFACE-AT ?auto_33567 ?auto_33574 ) ( CLEAR ?auto_33567 ) ( IS-CRATE ?auto_33568 ) ( not ( = ?auto_33567 ?auto_33568 ) ) ( AVAILABLE ?auto_33569 ) ( ON ?auto_33567 ?auto_33566 ) ( not ( = ?auto_33566 ?auto_33567 ) ) ( not ( = ?auto_33566 ?auto_33568 ) ) ( not ( = ?auto_33572 ?auto_33574 ) ) ( HOIST-AT ?auto_33573 ?auto_33572 ) ( not ( = ?auto_33569 ?auto_33573 ) ) ( AVAILABLE ?auto_33573 ) ( SURFACE-AT ?auto_33568 ?auto_33572 ) ( ON ?auto_33568 ?auto_33571 ) ( CLEAR ?auto_33568 ) ( not ( = ?auto_33567 ?auto_33571 ) ) ( not ( = ?auto_33568 ?auto_33571 ) ) ( not ( = ?auto_33566 ?auto_33571 ) ) ( TRUCK-AT ?auto_33570 ?auto_33574 ) ( ON ?auto_33566 ?auto_33565 ) ( not ( = ?auto_33565 ?auto_33566 ) ) ( not ( = ?auto_33565 ?auto_33567 ) ) ( not ( = ?auto_33565 ?auto_33568 ) ) ( not ( = ?auto_33565 ?auto_33571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33566 ?auto_33567 ?auto_33568 )
      ( MAKE-3CRATE-VERIFY ?auto_33565 ?auto_33566 ?auto_33567 ?auto_33568 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33575 - SURFACE
      ?auto_33576 - SURFACE
      ?auto_33577 - SURFACE
      ?auto_33578 - SURFACE
      ?auto_33579 - SURFACE
    )
    :vars
    (
      ?auto_33580 - HOIST
      ?auto_33585 - PLACE
      ?auto_33583 - PLACE
      ?auto_33584 - HOIST
      ?auto_33582 - SURFACE
      ?auto_33581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33580 ?auto_33585 ) ( SURFACE-AT ?auto_33578 ?auto_33585 ) ( CLEAR ?auto_33578 ) ( IS-CRATE ?auto_33579 ) ( not ( = ?auto_33578 ?auto_33579 ) ) ( AVAILABLE ?auto_33580 ) ( ON ?auto_33578 ?auto_33577 ) ( not ( = ?auto_33577 ?auto_33578 ) ) ( not ( = ?auto_33577 ?auto_33579 ) ) ( not ( = ?auto_33583 ?auto_33585 ) ) ( HOIST-AT ?auto_33584 ?auto_33583 ) ( not ( = ?auto_33580 ?auto_33584 ) ) ( AVAILABLE ?auto_33584 ) ( SURFACE-AT ?auto_33579 ?auto_33583 ) ( ON ?auto_33579 ?auto_33582 ) ( CLEAR ?auto_33579 ) ( not ( = ?auto_33578 ?auto_33582 ) ) ( not ( = ?auto_33579 ?auto_33582 ) ) ( not ( = ?auto_33577 ?auto_33582 ) ) ( TRUCK-AT ?auto_33581 ?auto_33585 ) ( ON ?auto_33576 ?auto_33575 ) ( ON ?auto_33577 ?auto_33576 ) ( not ( = ?auto_33575 ?auto_33576 ) ) ( not ( = ?auto_33575 ?auto_33577 ) ) ( not ( = ?auto_33575 ?auto_33578 ) ) ( not ( = ?auto_33575 ?auto_33579 ) ) ( not ( = ?auto_33575 ?auto_33582 ) ) ( not ( = ?auto_33576 ?auto_33577 ) ) ( not ( = ?auto_33576 ?auto_33578 ) ) ( not ( = ?auto_33576 ?auto_33579 ) ) ( not ( = ?auto_33576 ?auto_33582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33577 ?auto_33578 ?auto_33579 )
      ( MAKE-4CRATE-VERIFY ?auto_33575 ?auto_33576 ?auto_33577 ?auto_33578 ?auto_33579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33586 - SURFACE
      ?auto_33587 - SURFACE
    )
    :vars
    (
      ?auto_33588 - HOIST
      ?auto_33594 - PLACE
      ?auto_33591 - SURFACE
      ?auto_33592 - PLACE
      ?auto_33593 - HOIST
      ?auto_33590 - SURFACE
      ?auto_33589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33588 ?auto_33594 ) ( IS-CRATE ?auto_33587 ) ( not ( = ?auto_33586 ?auto_33587 ) ) ( not ( = ?auto_33591 ?auto_33586 ) ) ( not ( = ?auto_33591 ?auto_33587 ) ) ( not ( = ?auto_33592 ?auto_33594 ) ) ( HOIST-AT ?auto_33593 ?auto_33592 ) ( not ( = ?auto_33588 ?auto_33593 ) ) ( AVAILABLE ?auto_33593 ) ( SURFACE-AT ?auto_33587 ?auto_33592 ) ( ON ?auto_33587 ?auto_33590 ) ( CLEAR ?auto_33587 ) ( not ( = ?auto_33586 ?auto_33590 ) ) ( not ( = ?auto_33587 ?auto_33590 ) ) ( not ( = ?auto_33591 ?auto_33590 ) ) ( TRUCK-AT ?auto_33589 ?auto_33594 ) ( SURFACE-AT ?auto_33591 ?auto_33594 ) ( CLEAR ?auto_33591 ) ( LIFTING ?auto_33588 ?auto_33586 ) ( IS-CRATE ?auto_33586 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33591 ?auto_33586 )
      ( MAKE-2CRATE ?auto_33591 ?auto_33586 ?auto_33587 )
      ( MAKE-1CRATE-VERIFY ?auto_33586 ?auto_33587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33595 - SURFACE
      ?auto_33596 - SURFACE
      ?auto_33597 - SURFACE
    )
    :vars
    (
      ?auto_33599 - HOIST
      ?auto_33598 - PLACE
      ?auto_33601 - PLACE
      ?auto_33600 - HOIST
      ?auto_33603 - SURFACE
      ?auto_33602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33599 ?auto_33598 ) ( IS-CRATE ?auto_33597 ) ( not ( = ?auto_33596 ?auto_33597 ) ) ( not ( = ?auto_33595 ?auto_33596 ) ) ( not ( = ?auto_33595 ?auto_33597 ) ) ( not ( = ?auto_33601 ?auto_33598 ) ) ( HOIST-AT ?auto_33600 ?auto_33601 ) ( not ( = ?auto_33599 ?auto_33600 ) ) ( AVAILABLE ?auto_33600 ) ( SURFACE-AT ?auto_33597 ?auto_33601 ) ( ON ?auto_33597 ?auto_33603 ) ( CLEAR ?auto_33597 ) ( not ( = ?auto_33596 ?auto_33603 ) ) ( not ( = ?auto_33597 ?auto_33603 ) ) ( not ( = ?auto_33595 ?auto_33603 ) ) ( TRUCK-AT ?auto_33602 ?auto_33598 ) ( SURFACE-AT ?auto_33595 ?auto_33598 ) ( CLEAR ?auto_33595 ) ( LIFTING ?auto_33599 ?auto_33596 ) ( IS-CRATE ?auto_33596 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33596 ?auto_33597 )
      ( MAKE-2CRATE-VERIFY ?auto_33595 ?auto_33596 ?auto_33597 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33604 - SURFACE
      ?auto_33605 - SURFACE
      ?auto_33606 - SURFACE
      ?auto_33607 - SURFACE
    )
    :vars
    (
      ?auto_33611 - HOIST
      ?auto_33609 - PLACE
      ?auto_33608 - PLACE
      ?auto_33613 - HOIST
      ?auto_33612 - SURFACE
      ?auto_33610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33611 ?auto_33609 ) ( IS-CRATE ?auto_33607 ) ( not ( = ?auto_33606 ?auto_33607 ) ) ( not ( = ?auto_33605 ?auto_33606 ) ) ( not ( = ?auto_33605 ?auto_33607 ) ) ( not ( = ?auto_33608 ?auto_33609 ) ) ( HOIST-AT ?auto_33613 ?auto_33608 ) ( not ( = ?auto_33611 ?auto_33613 ) ) ( AVAILABLE ?auto_33613 ) ( SURFACE-AT ?auto_33607 ?auto_33608 ) ( ON ?auto_33607 ?auto_33612 ) ( CLEAR ?auto_33607 ) ( not ( = ?auto_33606 ?auto_33612 ) ) ( not ( = ?auto_33607 ?auto_33612 ) ) ( not ( = ?auto_33605 ?auto_33612 ) ) ( TRUCK-AT ?auto_33610 ?auto_33609 ) ( SURFACE-AT ?auto_33605 ?auto_33609 ) ( CLEAR ?auto_33605 ) ( LIFTING ?auto_33611 ?auto_33606 ) ( IS-CRATE ?auto_33606 ) ( ON ?auto_33605 ?auto_33604 ) ( not ( = ?auto_33604 ?auto_33605 ) ) ( not ( = ?auto_33604 ?auto_33606 ) ) ( not ( = ?auto_33604 ?auto_33607 ) ) ( not ( = ?auto_33604 ?auto_33612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33605 ?auto_33606 ?auto_33607 )
      ( MAKE-3CRATE-VERIFY ?auto_33604 ?auto_33605 ?auto_33606 ?auto_33607 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33614 - SURFACE
      ?auto_33615 - SURFACE
      ?auto_33616 - SURFACE
      ?auto_33617 - SURFACE
      ?auto_33618 - SURFACE
    )
    :vars
    (
      ?auto_33622 - HOIST
      ?auto_33620 - PLACE
      ?auto_33619 - PLACE
      ?auto_33624 - HOIST
      ?auto_33623 - SURFACE
      ?auto_33621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33622 ?auto_33620 ) ( IS-CRATE ?auto_33618 ) ( not ( = ?auto_33617 ?auto_33618 ) ) ( not ( = ?auto_33616 ?auto_33617 ) ) ( not ( = ?auto_33616 ?auto_33618 ) ) ( not ( = ?auto_33619 ?auto_33620 ) ) ( HOIST-AT ?auto_33624 ?auto_33619 ) ( not ( = ?auto_33622 ?auto_33624 ) ) ( AVAILABLE ?auto_33624 ) ( SURFACE-AT ?auto_33618 ?auto_33619 ) ( ON ?auto_33618 ?auto_33623 ) ( CLEAR ?auto_33618 ) ( not ( = ?auto_33617 ?auto_33623 ) ) ( not ( = ?auto_33618 ?auto_33623 ) ) ( not ( = ?auto_33616 ?auto_33623 ) ) ( TRUCK-AT ?auto_33621 ?auto_33620 ) ( SURFACE-AT ?auto_33616 ?auto_33620 ) ( CLEAR ?auto_33616 ) ( LIFTING ?auto_33622 ?auto_33617 ) ( IS-CRATE ?auto_33617 ) ( ON ?auto_33615 ?auto_33614 ) ( ON ?auto_33616 ?auto_33615 ) ( not ( = ?auto_33614 ?auto_33615 ) ) ( not ( = ?auto_33614 ?auto_33616 ) ) ( not ( = ?auto_33614 ?auto_33617 ) ) ( not ( = ?auto_33614 ?auto_33618 ) ) ( not ( = ?auto_33614 ?auto_33623 ) ) ( not ( = ?auto_33615 ?auto_33616 ) ) ( not ( = ?auto_33615 ?auto_33617 ) ) ( not ( = ?auto_33615 ?auto_33618 ) ) ( not ( = ?auto_33615 ?auto_33623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33616 ?auto_33617 ?auto_33618 )
      ( MAKE-4CRATE-VERIFY ?auto_33614 ?auto_33615 ?auto_33616 ?auto_33617 ?auto_33618 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33625 - SURFACE
      ?auto_33626 - SURFACE
    )
    :vars
    (
      ?auto_33630 - HOIST
      ?auto_33628 - PLACE
      ?auto_33631 - SURFACE
      ?auto_33627 - PLACE
      ?auto_33633 - HOIST
      ?auto_33632 - SURFACE
      ?auto_33629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33630 ?auto_33628 ) ( IS-CRATE ?auto_33626 ) ( not ( = ?auto_33625 ?auto_33626 ) ) ( not ( = ?auto_33631 ?auto_33625 ) ) ( not ( = ?auto_33631 ?auto_33626 ) ) ( not ( = ?auto_33627 ?auto_33628 ) ) ( HOIST-AT ?auto_33633 ?auto_33627 ) ( not ( = ?auto_33630 ?auto_33633 ) ) ( AVAILABLE ?auto_33633 ) ( SURFACE-AT ?auto_33626 ?auto_33627 ) ( ON ?auto_33626 ?auto_33632 ) ( CLEAR ?auto_33626 ) ( not ( = ?auto_33625 ?auto_33632 ) ) ( not ( = ?auto_33626 ?auto_33632 ) ) ( not ( = ?auto_33631 ?auto_33632 ) ) ( TRUCK-AT ?auto_33629 ?auto_33628 ) ( SURFACE-AT ?auto_33631 ?auto_33628 ) ( CLEAR ?auto_33631 ) ( IS-CRATE ?auto_33625 ) ( AVAILABLE ?auto_33630 ) ( IN ?auto_33625 ?auto_33629 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33630 ?auto_33625 ?auto_33629 ?auto_33628 )
      ( MAKE-2CRATE ?auto_33631 ?auto_33625 ?auto_33626 )
      ( MAKE-1CRATE-VERIFY ?auto_33625 ?auto_33626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33634 - SURFACE
      ?auto_33635 - SURFACE
      ?auto_33636 - SURFACE
    )
    :vars
    (
      ?auto_33640 - HOIST
      ?auto_33637 - PLACE
      ?auto_33642 - PLACE
      ?auto_33639 - HOIST
      ?auto_33641 - SURFACE
      ?auto_33638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33640 ?auto_33637 ) ( IS-CRATE ?auto_33636 ) ( not ( = ?auto_33635 ?auto_33636 ) ) ( not ( = ?auto_33634 ?auto_33635 ) ) ( not ( = ?auto_33634 ?auto_33636 ) ) ( not ( = ?auto_33642 ?auto_33637 ) ) ( HOIST-AT ?auto_33639 ?auto_33642 ) ( not ( = ?auto_33640 ?auto_33639 ) ) ( AVAILABLE ?auto_33639 ) ( SURFACE-AT ?auto_33636 ?auto_33642 ) ( ON ?auto_33636 ?auto_33641 ) ( CLEAR ?auto_33636 ) ( not ( = ?auto_33635 ?auto_33641 ) ) ( not ( = ?auto_33636 ?auto_33641 ) ) ( not ( = ?auto_33634 ?auto_33641 ) ) ( TRUCK-AT ?auto_33638 ?auto_33637 ) ( SURFACE-AT ?auto_33634 ?auto_33637 ) ( CLEAR ?auto_33634 ) ( IS-CRATE ?auto_33635 ) ( AVAILABLE ?auto_33640 ) ( IN ?auto_33635 ?auto_33638 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33635 ?auto_33636 )
      ( MAKE-2CRATE-VERIFY ?auto_33634 ?auto_33635 ?auto_33636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33643 - SURFACE
      ?auto_33644 - SURFACE
      ?auto_33645 - SURFACE
      ?auto_33646 - SURFACE
    )
    :vars
    (
      ?auto_33647 - HOIST
      ?auto_33648 - PLACE
      ?auto_33649 - PLACE
      ?auto_33651 - HOIST
      ?auto_33652 - SURFACE
      ?auto_33650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33647 ?auto_33648 ) ( IS-CRATE ?auto_33646 ) ( not ( = ?auto_33645 ?auto_33646 ) ) ( not ( = ?auto_33644 ?auto_33645 ) ) ( not ( = ?auto_33644 ?auto_33646 ) ) ( not ( = ?auto_33649 ?auto_33648 ) ) ( HOIST-AT ?auto_33651 ?auto_33649 ) ( not ( = ?auto_33647 ?auto_33651 ) ) ( AVAILABLE ?auto_33651 ) ( SURFACE-AT ?auto_33646 ?auto_33649 ) ( ON ?auto_33646 ?auto_33652 ) ( CLEAR ?auto_33646 ) ( not ( = ?auto_33645 ?auto_33652 ) ) ( not ( = ?auto_33646 ?auto_33652 ) ) ( not ( = ?auto_33644 ?auto_33652 ) ) ( TRUCK-AT ?auto_33650 ?auto_33648 ) ( SURFACE-AT ?auto_33644 ?auto_33648 ) ( CLEAR ?auto_33644 ) ( IS-CRATE ?auto_33645 ) ( AVAILABLE ?auto_33647 ) ( IN ?auto_33645 ?auto_33650 ) ( ON ?auto_33644 ?auto_33643 ) ( not ( = ?auto_33643 ?auto_33644 ) ) ( not ( = ?auto_33643 ?auto_33645 ) ) ( not ( = ?auto_33643 ?auto_33646 ) ) ( not ( = ?auto_33643 ?auto_33652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33644 ?auto_33645 ?auto_33646 )
      ( MAKE-3CRATE-VERIFY ?auto_33643 ?auto_33644 ?auto_33645 ?auto_33646 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33653 - SURFACE
      ?auto_33654 - SURFACE
      ?auto_33655 - SURFACE
      ?auto_33656 - SURFACE
      ?auto_33657 - SURFACE
    )
    :vars
    (
      ?auto_33658 - HOIST
      ?auto_33659 - PLACE
      ?auto_33660 - PLACE
      ?auto_33662 - HOIST
      ?auto_33663 - SURFACE
      ?auto_33661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33658 ?auto_33659 ) ( IS-CRATE ?auto_33657 ) ( not ( = ?auto_33656 ?auto_33657 ) ) ( not ( = ?auto_33655 ?auto_33656 ) ) ( not ( = ?auto_33655 ?auto_33657 ) ) ( not ( = ?auto_33660 ?auto_33659 ) ) ( HOIST-AT ?auto_33662 ?auto_33660 ) ( not ( = ?auto_33658 ?auto_33662 ) ) ( AVAILABLE ?auto_33662 ) ( SURFACE-AT ?auto_33657 ?auto_33660 ) ( ON ?auto_33657 ?auto_33663 ) ( CLEAR ?auto_33657 ) ( not ( = ?auto_33656 ?auto_33663 ) ) ( not ( = ?auto_33657 ?auto_33663 ) ) ( not ( = ?auto_33655 ?auto_33663 ) ) ( TRUCK-AT ?auto_33661 ?auto_33659 ) ( SURFACE-AT ?auto_33655 ?auto_33659 ) ( CLEAR ?auto_33655 ) ( IS-CRATE ?auto_33656 ) ( AVAILABLE ?auto_33658 ) ( IN ?auto_33656 ?auto_33661 ) ( ON ?auto_33654 ?auto_33653 ) ( ON ?auto_33655 ?auto_33654 ) ( not ( = ?auto_33653 ?auto_33654 ) ) ( not ( = ?auto_33653 ?auto_33655 ) ) ( not ( = ?auto_33653 ?auto_33656 ) ) ( not ( = ?auto_33653 ?auto_33657 ) ) ( not ( = ?auto_33653 ?auto_33663 ) ) ( not ( = ?auto_33654 ?auto_33655 ) ) ( not ( = ?auto_33654 ?auto_33656 ) ) ( not ( = ?auto_33654 ?auto_33657 ) ) ( not ( = ?auto_33654 ?auto_33663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33655 ?auto_33656 ?auto_33657 )
      ( MAKE-4CRATE-VERIFY ?auto_33653 ?auto_33654 ?auto_33655 ?auto_33656 ?auto_33657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33664 - SURFACE
      ?auto_33665 - SURFACE
    )
    :vars
    (
      ?auto_33666 - HOIST
      ?auto_33667 - PLACE
      ?auto_33672 - SURFACE
      ?auto_33668 - PLACE
      ?auto_33670 - HOIST
      ?auto_33671 - SURFACE
      ?auto_33669 - TRUCK
      ?auto_33673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33666 ?auto_33667 ) ( IS-CRATE ?auto_33665 ) ( not ( = ?auto_33664 ?auto_33665 ) ) ( not ( = ?auto_33672 ?auto_33664 ) ) ( not ( = ?auto_33672 ?auto_33665 ) ) ( not ( = ?auto_33668 ?auto_33667 ) ) ( HOIST-AT ?auto_33670 ?auto_33668 ) ( not ( = ?auto_33666 ?auto_33670 ) ) ( AVAILABLE ?auto_33670 ) ( SURFACE-AT ?auto_33665 ?auto_33668 ) ( ON ?auto_33665 ?auto_33671 ) ( CLEAR ?auto_33665 ) ( not ( = ?auto_33664 ?auto_33671 ) ) ( not ( = ?auto_33665 ?auto_33671 ) ) ( not ( = ?auto_33672 ?auto_33671 ) ) ( SURFACE-AT ?auto_33672 ?auto_33667 ) ( CLEAR ?auto_33672 ) ( IS-CRATE ?auto_33664 ) ( AVAILABLE ?auto_33666 ) ( IN ?auto_33664 ?auto_33669 ) ( TRUCK-AT ?auto_33669 ?auto_33673 ) ( not ( = ?auto_33673 ?auto_33667 ) ) ( not ( = ?auto_33668 ?auto_33673 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33669 ?auto_33673 ?auto_33667 )
      ( MAKE-2CRATE ?auto_33672 ?auto_33664 ?auto_33665 )
      ( MAKE-1CRATE-VERIFY ?auto_33664 ?auto_33665 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33674 - SURFACE
      ?auto_33675 - SURFACE
      ?auto_33676 - SURFACE
    )
    :vars
    (
      ?auto_33677 - HOIST
      ?auto_33682 - PLACE
      ?auto_33683 - PLACE
      ?auto_33681 - HOIST
      ?auto_33678 - SURFACE
      ?auto_33680 - TRUCK
      ?auto_33679 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33677 ?auto_33682 ) ( IS-CRATE ?auto_33676 ) ( not ( = ?auto_33675 ?auto_33676 ) ) ( not ( = ?auto_33674 ?auto_33675 ) ) ( not ( = ?auto_33674 ?auto_33676 ) ) ( not ( = ?auto_33683 ?auto_33682 ) ) ( HOIST-AT ?auto_33681 ?auto_33683 ) ( not ( = ?auto_33677 ?auto_33681 ) ) ( AVAILABLE ?auto_33681 ) ( SURFACE-AT ?auto_33676 ?auto_33683 ) ( ON ?auto_33676 ?auto_33678 ) ( CLEAR ?auto_33676 ) ( not ( = ?auto_33675 ?auto_33678 ) ) ( not ( = ?auto_33676 ?auto_33678 ) ) ( not ( = ?auto_33674 ?auto_33678 ) ) ( SURFACE-AT ?auto_33674 ?auto_33682 ) ( CLEAR ?auto_33674 ) ( IS-CRATE ?auto_33675 ) ( AVAILABLE ?auto_33677 ) ( IN ?auto_33675 ?auto_33680 ) ( TRUCK-AT ?auto_33680 ?auto_33679 ) ( not ( = ?auto_33679 ?auto_33682 ) ) ( not ( = ?auto_33683 ?auto_33679 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33675 ?auto_33676 )
      ( MAKE-2CRATE-VERIFY ?auto_33674 ?auto_33675 ?auto_33676 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33684 - SURFACE
      ?auto_33685 - SURFACE
      ?auto_33686 - SURFACE
      ?auto_33687 - SURFACE
    )
    :vars
    (
      ?auto_33690 - HOIST
      ?auto_33691 - PLACE
      ?auto_33693 - PLACE
      ?auto_33688 - HOIST
      ?auto_33692 - SURFACE
      ?auto_33689 - TRUCK
      ?auto_33694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33690 ?auto_33691 ) ( IS-CRATE ?auto_33687 ) ( not ( = ?auto_33686 ?auto_33687 ) ) ( not ( = ?auto_33685 ?auto_33686 ) ) ( not ( = ?auto_33685 ?auto_33687 ) ) ( not ( = ?auto_33693 ?auto_33691 ) ) ( HOIST-AT ?auto_33688 ?auto_33693 ) ( not ( = ?auto_33690 ?auto_33688 ) ) ( AVAILABLE ?auto_33688 ) ( SURFACE-AT ?auto_33687 ?auto_33693 ) ( ON ?auto_33687 ?auto_33692 ) ( CLEAR ?auto_33687 ) ( not ( = ?auto_33686 ?auto_33692 ) ) ( not ( = ?auto_33687 ?auto_33692 ) ) ( not ( = ?auto_33685 ?auto_33692 ) ) ( SURFACE-AT ?auto_33685 ?auto_33691 ) ( CLEAR ?auto_33685 ) ( IS-CRATE ?auto_33686 ) ( AVAILABLE ?auto_33690 ) ( IN ?auto_33686 ?auto_33689 ) ( TRUCK-AT ?auto_33689 ?auto_33694 ) ( not ( = ?auto_33694 ?auto_33691 ) ) ( not ( = ?auto_33693 ?auto_33694 ) ) ( ON ?auto_33685 ?auto_33684 ) ( not ( = ?auto_33684 ?auto_33685 ) ) ( not ( = ?auto_33684 ?auto_33686 ) ) ( not ( = ?auto_33684 ?auto_33687 ) ) ( not ( = ?auto_33684 ?auto_33692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33685 ?auto_33686 ?auto_33687 )
      ( MAKE-3CRATE-VERIFY ?auto_33684 ?auto_33685 ?auto_33686 ?auto_33687 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33695 - SURFACE
      ?auto_33696 - SURFACE
      ?auto_33697 - SURFACE
      ?auto_33698 - SURFACE
      ?auto_33699 - SURFACE
    )
    :vars
    (
      ?auto_33702 - HOIST
      ?auto_33703 - PLACE
      ?auto_33705 - PLACE
      ?auto_33700 - HOIST
      ?auto_33704 - SURFACE
      ?auto_33701 - TRUCK
      ?auto_33706 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33702 ?auto_33703 ) ( IS-CRATE ?auto_33699 ) ( not ( = ?auto_33698 ?auto_33699 ) ) ( not ( = ?auto_33697 ?auto_33698 ) ) ( not ( = ?auto_33697 ?auto_33699 ) ) ( not ( = ?auto_33705 ?auto_33703 ) ) ( HOIST-AT ?auto_33700 ?auto_33705 ) ( not ( = ?auto_33702 ?auto_33700 ) ) ( AVAILABLE ?auto_33700 ) ( SURFACE-AT ?auto_33699 ?auto_33705 ) ( ON ?auto_33699 ?auto_33704 ) ( CLEAR ?auto_33699 ) ( not ( = ?auto_33698 ?auto_33704 ) ) ( not ( = ?auto_33699 ?auto_33704 ) ) ( not ( = ?auto_33697 ?auto_33704 ) ) ( SURFACE-AT ?auto_33697 ?auto_33703 ) ( CLEAR ?auto_33697 ) ( IS-CRATE ?auto_33698 ) ( AVAILABLE ?auto_33702 ) ( IN ?auto_33698 ?auto_33701 ) ( TRUCK-AT ?auto_33701 ?auto_33706 ) ( not ( = ?auto_33706 ?auto_33703 ) ) ( not ( = ?auto_33705 ?auto_33706 ) ) ( ON ?auto_33696 ?auto_33695 ) ( ON ?auto_33697 ?auto_33696 ) ( not ( = ?auto_33695 ?auto_33696 ) ) ( not ( = ?auto_33695 ?auto_33697 ) ) ( not ( = ?auto_33695 ?auto_33698 ) ) ( not ( = ?auto_33695 ?auto_33699 ) ) ( not ( = ?auto_33695 ?auto_33704 ) ) ( not ( = ?auto_33696 ?auto_33697 ) ) ( not ( = ?auto_33696 ?auto_33698 ) ) ( not ( = ?auto_33696 ?auto_33699 ) ) ( not ( = ?auto_33696 ?auto_33704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33697 ?auto_33698 ?auto_33699 )
      ( MAKE-4CRATE-VERIFY ?auto_33695 ?auto_33696 ?auto_33697 ?auto_33698 ?auto_33699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33707 - SURFACE
      ?auto_33708 - SURFACE
    )
    :vars
    (
      ?auto_33711 - HOIST
      ?auto_33712 - PLACE
      ?auto_33714 - SURFACE
      ?auto_33715 - PLACE
      ?auto_33709 - HOIST
      ?auto_33713 - SURFACE
      ?auto_33710 - TRUCK
      ?auto_33716 - PLACE
      ?auto_33717 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33711 ?auto_33712 ) ( IS-CRATE ?auto_33708 ) ( not ( = ?auto_33707 ?auto_33708 ) ) ( not ( = ?auto_33714 ?auto_33707 ) ) ( not ( = ?auto_33714 ?auto_33708 ) ) ( not ( = ?auto_33715 ?auto_33712 ) ) ( HOIST-AT ?auto_33709 ?auto_33715 ) ( not ( = ?auto_33711 ?auto_33709 ) ) ( AVAILABLE ?auto_33709 ) ( SURFACE-AT ?auto_33708 ?auto_33715 ) ( ON ?auto_33708 ?auto_33713 ) ( CLEAR ?auto_33708 ) ( not ( = ?auto_33707 ?auto_33713 ) ) ( not ( = ?auto_33708 ?auto_33713 ) ) ( not ( = ?auto_33714 ?auto_33713 ) ) ( SURFACE-AT ?auto_33714 ?auto_33712 ) ( CLEAR ?auto_33714 ) ( IS-CRATE ?auto_33707 ) ( AVAILABLE ?auto_33711 ) ( TRUCK-AT ?auto_33710 ?auto_33716 ) ( not ( = ?auto_33716 ?auto_33712 ) ) ( not ( = ?auto_33715 ?auto_33716 ) ) ( HOIST-AT ?auto_33717 ?auto_33716 ) ( LIFTING ?auto_33717 ?auto_33707 ) ( not ( = ?auto_33711 ?auto_33717 ) ) ( not ( = ?auto_33709 ?auto_33717 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33717 ?auto_33707 ?auto_33710 ?auto_33716 )
      ( MAKE-2CRATE ?auto_33714 ?auto_33707 ?auto_33708 )
      ( MAKE-1CRATE-VERIFY ?auto_33707 ?auto_33708 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33718 - SURFACE
      ?auto_33719 - SURFACE
      ?auto_33720 - SURFACE
    )
    :vars
    (
      ?auto_33722 - HOIST
      ?auto_33725 - PLACE
      ?auto_33724 - PLACE
      ?auto_33727 - HOIST
      ?auto_33726 - SURFACE
      ?auto_33723 - TRUCK
      ?auto_33721 - PLACE
      ?auto_33728 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33722 ?auto_33725 ) ( IS-CRATE ?auto_33720 ) ( not ( = ?auto_33719 ?auto_33720 ) ) ( not ( = ?auto_33718 ?auto_33719 ) ) ( not ( = ?auto_33718 ?auto_33720 ) ) ( not ( = ?auto_33724 ?auto_33725 ) ) ( HOIST-AT ?auto_33727 ?auto_33724 ) ( not ( = ?auto_33722 ?auto_33727 ) ) ( AVAILABLE ?auto_33727 ) ( SURFACE-AT ?auto_33720 ?auto_33724 ) ( ON ?auto_33720 ?auto_33726 ) ( CLEAR ?auto_33720 ) ( not ( = ?auto_33719 ?auto_33726 ) ) ( not ( = ?auto_33720 ?auto_33726 ) ) ( not ( = ?auto_33718 ?auto_33726 ) ) ( SURFACE-AT ?auto_33718 ?auto_33725 ) ( CLEAR ?auto_33718 ) ( IS-CRATE ?auto_33719 ) ( AVAILABLE ?auto_33722 ) ( TRUCK-AT ?auto_33723 ?auto_33721 ) ( not ( = ?auto_33721 ?auto_33725 ) ) ( not ( = ?auto_33724 ?auto_33721 ) ) ( HOIST-AT ?auto_33728 ?auto_33721 ) ( LIFTING ?auto_33728 ?auto_33719 ) ( not ( = ?auto_33722 ?auto_33728 ) ) ( not ( = ?auto_33727 ?auto_33728 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33719 ?auto_33720 )
      ( MAKE-2CRATE-VERIFY ?auto_33718 ?auto_33719 ?auto_33720 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33729 - SURFACE
      ?auto_33730 - SURFACE
      ?auto_33731 - SURFACE
      ?auto_33732 - SURFACE
    )
    :vars
    (
      ?auto_33733 - HOIST
      ?auto_33739 - PLACE
      ?auto_33734 - PLACE
      ?auto_33738 - HOIST
      ?auto_33735 - SURFACE
      ?auto_33736 - TRUCK
      ?auto_33740 - PLACE
      ?auto_33737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33733 ?auto_33739 ) ( IS-CRATE ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33732 ) ) ( not ( = ?auto_33730 ?auto_33731 ) ) ( not ( = ?auto_33730 ?auto_33732 ) ) ( not ( = ?auto_33734 ?auto_33739 ) ) ( HOIST-AT ?auto_33738 ?auto_33734 ) ( not ( = ?auto_33733 ?auto_33738 ) ) ( AVAILABLE ?auto_33738 ) ( SURFACE-AT ?auto_33732 ?auto_33734 ) ( ON ?auto_33732 ?auto_33735 ) ( CLEAR ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33735 ) ) ( not ( = ?auto_33732 ?auto_33735 ) ) ( not ( = ?auto_33730 ?auto_33735 ) ) ( SURFACE-AT ?auto_33730 ?auto_33739 ) ( CLEAR ?auto_33730 ) ( IS-CRATE ?auto_33731 ) ( AVAILABLE ?auto_33733 ) ( TRUCK-AT ?auto_33736 ?auto_33740 ) ( not ( = ?auto_33740 ?auto_33739 ) ) ( not ( = ?auto_33734 ?auto_33740 ) ) ( HOIST-AT ?auto_33737 ?auto_33740 ) ( LIFTING ?auto_33737 ?auto_33731 ) ( not ( = ?auto_33733 ?auto_33737 ) ) ( not ( = ?auto_33738 ?auto_33737 ) ) ( ON ?auto_33730 ?auto_33729 ) ( not ( = ?auto_33729 ?auto_33730 ) ) ( not ( = ?auto_33729 ?auto_33731 ) ) ( not ( = ?auto_33729 ?auto_33732 ) ) ( not ( = ?auto_33729 ?auto_33735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33730 ?auto_33731 ?auto_33732 )
      ( MAKE-3CRATE-VERIFY ?auto_33729 ?auto_33730 ?auto_33731 ?auto_33732 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33741 - SURFACE
      ?auto_33742 - SURFACE
      ?auto_33743 - SURFACE
      ?auto_33744 - SURFACE
      ?auto_33745 - SURFACE
    )
    :vars
    (
      ?auto_33746 - HOIST
      ?auto_33752 - PLACE
      ?auto_33747 - PLACE
      ?auto_33751 - HOIST
      ?auto_33748 - SURFACE
      ?auto_33749 - TRUCK
      ?auto_33753 - PLACE
      ?auto_33750 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33746 ?auto_33752 ) ( IS-CRATE ?auto_33745 ) ( not ( = ?auto_33744 ?auto_33745 ) ) ( not ( = ?auto_33743 ?auto_33744 ) ) ( not ( = ?auto_33743 ?auto_33745 ) ) ( not ( = ?auto_33747 ?auto_33752 ) ) ( HOIST-AT ?auto_33751 ?auto_33747 ) ( not ( = ?auto_33746 ?auto_33751 ) ) ( AVAILABLE ?auto_33751 ) ( SURFACE-AT ?auto_33745 ?auto_33747 ) ( ON ?auto_33745 ?auto_33748 ) ( CLEAR ?auto_33745 ) ( not ( = ?auto_33744 ?auto_33748 ) ) ( not ( = ?auto_33745 ?auto_33748 ) ) ( not ( = ?auto_33743 ?auto_33748 ) ) ( SURFACE-AT ?auto_33743 ?auto_33752 ) ( CLEAR ?auto_33743 ) ( IS-CRATE ?auto_33744 ) ( AVAILABLE ?auto_33746 ) ( TRUCK-AT ?auto_33749 ?auto_33753 ) ( not ( = ?auto_33753 ?auto_33752 ) ) ( not ( = ?auto_33747 ?auto_33753 ) ) ( HOIST-AT ?auto_33750 ?auto_33753 ) ( LIFTING ?auto_33750 ?auto_33744 ) ( not ( = ?auto_33746 ?auto_33750 ) ) ( not ( = ?auto_33751 ?auto_33750 ) ) ( ON ?auto_33742 ?auto_33741 ) ( ON ?auto_33743 ?auto_33742 ) ( not ( = ?auto_33741 ?auto_33742 ) ) ( not ( = ?auto_33741 ?auto_33743 ) ) ( not ( = ?auto_33741 ?auto_33744 ) ) ( not ( = ?auto_33741 ?auto_33745 ) ) ( not ( = ?auto_33741 ?auto_33748 ) ) ( not ( = ?auto_33742 ?auto_33743 ) ) ( not ( = ?auto_33742 ?auto_33744 ) ) ( not ( = ?auto_33742 ?auto_33745 ) ) ( not ( = ?auto_33742 ?auto_33748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33743 ?auto_33744 ?auto_33745 )
      ( MAKE-4CRATE-VERIFY ?auto_33741 ?auto_33742 ?auto_33743 ?auto_33744 ?auto_33745 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33754 - SURFACE
      ?auto_33755 - SURFACE
    )
    :vars
    (
      ?auto_33757 - HOIST
      ?auto_33763 - PLACE
      ?auto_33756 - SURFACE
      ?auto_33758 - PLACE
      ?auto_33762 - HOIST
      ?auto_33759 - SURFACE
      ?auto_33760 - TRUCK
      ?auto_33764 - PLACE
      ?auto_33761 - HOIST
      ?auto_33765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33757 ?auto_33763 ) ( IS-CRATE ?auto_33755 ) ( not ( = ?auto_33754 ?auto_33755 ) ) ( not ( = ?auto_33756 ?auto_33754 ) ) ( not ( = ?auto_33756 ?auto_33755 ) ) ( not ( = ?auto_33758 ?auto_33763 ) ) ( HOIST-AT ?auto_33762 ?auto_33758 ) ( not ( = ?auto_33757 ?auto_33762 ) ) ( AVAILABLE ?auto_33762 ) ( SURFACE-AT ?auto_33755 ?auto_33758 ) ( ON ?auto_33755 ?auto_33759 ) ( CLEAR ?auto_33755 ) ( not ( = ?auto_33754 ?auto_33759 ) ) ( not ( = ?auto_33755 ?auto_33759 ) ) ( not ( = ?auto_33756 ?auto_33759 ) ) ( SURFACE-AT ?auto_33756 ?auto_33763 ) ( CLEAR ?auto_33756 ) ( IS-CRATE ?auto_33754 ) ( AVAILABLE ?auto_33757 ) ( TRUCK-AT ?auto_33760 ?auto_33764 ) ( not ( = ?auto_33764 ?auto_33763 ) ) ( not ( = ?auto_33758 ?auto_33764 ) ) ( HOIST-AT ?auto_33761 ?auto_33764 ) ( not ( = ?auto_33757 ?auto_33761 ) ) ( not ( = ?auto_33762 ?auto_33761 ) ) ( AVAILABLE ?auto_33761 ) ( SURFACE-AT ?auto_33754 ?auto_33764 ) ( ON ?auto_33754 ?auto_33765 ) ( CLEAR ?auto_33754 ) ( not ( = ?auto_33754 ?auto_33765 ) ) ( not ( = ?auto_33755 ?auto_33765 ) ) ( not ( = ?auto_33756 ?auto_33765 ) ) ( not ( = ?auto_33759 ?auto_33765 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33761 ?auto_33754 ?auto_33765 ?auto_33764 )
      ( MAKE-2CRATE ?auto_33756 ?auto_33754 ?auto_33755 )
      ( MAKE-1CRATE-VERIFY ?auto_33754 ?auto_33755 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33766 - SURFACE
      ?auto_33767 - SURFACE
      ?auto_33768 - SURFACE
    )
    :vars
    (
      ?auto_33776 - HOIST
      ?auto_33771 - PLACE
      ?auto_33769 - PLACE
      ?auto_33773 - HOIST
      ?auto_33774 - SURFACE
      ?auto_33775 - TRUCK
      ?auto_33772 - PLACE
      ?auto_33777 - HOIST
      ?auto_33770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33776 ?auto_33771 ) ( IS-CRATE ?auto_33768 ) ( not ( = ?auto_33767 ?auto_33768 ) ) ( not ( = ?auto_33766 ?auto_33767 ) ) ( not ( = ?auto_33766 ?auto_33768 ) ) ( not ( = ?auto_33769 ?auto_33771 ) ) ( HOIST-AT ?auto_33773 ?auto_33769 ) ( not ( = ?auto_33776 ?auto_33773 ) ) ( AVAILABLE ?auto_33773 ) ( SURFACE-AT ?auto_33768 ?auto_33769 ) ( ON ?auto_33768 ?auto_33774 ) ( CLEAR ?auto_33768 ) ( not ( = ?auto_33767 ?auto_33774 ) ) ( not ( = ?auto_33768 ?auto_33774 ) ) ( not ( = ?auto_33766 ?auto_33774 ) ) ( SURFACE-AT ?auto_33766 ?auto_33771 ) ( CLEAR ?auto_33766 ) ( IS-CRATE ?auto_33767 ) ( AVAILABLE ?auto_33776 ) ( TRUCK-AT ?auto_33775 ?auto_33772 ) ( not ( = ?auto_33772 ?auto_33771 ) ) ( not ( = ?auto_33769 ?auto_33772 ) ) ( HOIST-AT ?auto_33777 ?auto_33772 ) ( not ( = ?auto_33776 ?auto_33777 ) ) ( not ( = ?auto_33773 ?auto_33777 ) ) ( AVAILABLE ?auto_33777 ) ( SURFACE-AT ?auto_33767 ?auto_33772 ) ( ON ?auto_33767 ?auto_33770 ) ( CLEAR ?auto_33767 ) ( not ( = ?auto_33767 ?auto_33770 ) ) ( not ( = ?auto_33768 ?auto_33770 ) ) ( not ( = ?auto_33766 ?auto_33770 ) ) ( not ( = ?auto_33774 ?auto_33770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33767 ?auto_33768 )
      ( MAKE-2CRATE-VERIFY ?auto_33766 ?auto_33767 ?auto_33768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33778 - SURFACE
      ?auto_33779 - SURFACE
      ?auto_33780 - SURFACE
      ?auto_33781 - SURFACE
    )
    :vars
    (
      ?auto_33788 - HOIST
      ?auto_33784 - PLACE
      ?auto_33790 - PLACE
      ?auto_33786 - HOIST
      ?auto_33783 - SURFACE
      ?auto_33789 - TRUCK
      ?auto_33785 - PLACE
      ?auto_33782 - HOIST
      ?auto_33787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33788 ?auto_33784 ) ( IS-CRATE ?auto_33781 ) ( not ( = ?auto_33780 ?auto_33781 ) ) ( not ( = ?auto_33779 ?auto_33780 ) ) ( not ( = ?auto_33779 ?auto_33781 ) ) ( not ( = ?auto_33790 ?auto_33784 ) ) ( HOIST-AT ?auto_33786 ?auto_33790 ) ( not ( = ?auto_33788 ?auto_33786 ) ) ( AVAILABLE ?auto_33786 ) ( SURFACE-AT ?auto_33781 ?auto_33790 ) ( ON ?auto_33781 ?auto_33783 ) ( CLEAR ?auto_33781 ) ( not ( = ?auto_33780 ?auto_33783 ) ) ( not ( = ?auto_33781 ?auto_33783 ) ) ( not ( = ?auto_33779 ?auto_33783 ) ) ( SURFACE-AT ?auto_33779 ?auto_33784 ) ( CLEAR ?auto_33779 ) ( IS-CRATE ?auto_33780 ) ( AVAILABLE ?auto_33788 ) ( TRUCK-AT ?auto_33789 ?auto_33785 ) ( not ( = ?auto_33785 ?auto_33784 ) ) ( not ( = ?auto_33790 ?auto_33785 ) ) ( HOIST-AT ?auto_33782 ?auto_33785 ) ( not ( = ?auto_33788 ?auto_33782 ) ) ( not ( = ?auto_33786 ?auto_33782 ) ) ( AVAILABLE ?auto_33782 ) ( SURFACE-AT ?auto_33780 ?auto_33785 ) ( ON ?auto_33780 ?auto_33787 ) ( CLEAR ?auto_33780 ) ( not ( = ?auto_33780 ?auto_33787 ) ) ( not ( = ?auto_33781 ?auto_33787 ) ) ( not ( = ?auto_33779 ?auto_33787 ) ) ( not ( = ?auto_33783 ?auto_33787 ) ) ( ON ?auto_33779 ?auto_33778 ) ( not ( = ?auto_33778 ?auto_33779 ) ) ( not ( = ?auto_33778 ?auto_33780 ) ) ( not ( = ?auto_33778 ?auto_33781 ) ) ( not ( = ?auto_33778 ?auto_33783 ) ) ( not ( = ?auto_33778 ?auto_33787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33779 ?auto_33780 ?auto_33781 )
      ( MAKE-3CRATE-VERIFY ?auto_33778 ?auto_33779 ?auto_33780 ?auto_33781 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33791 - SURFACE
      ?auto_33792 - SURFACE
      ?auto_33793 - SURFACE
      ?auto_33794 - SURFACE
      ?auto_33795 - SURFACE
    )
    :vars
    (
      ?auto_33802 - HOIST
      ?auto_33798 - PLACE
      ?auto_33804 - PLACE
      ?auto_33800 - HOIST
      ?auto_33797 - SURFACE
      ?auto_33803 - TRUCK
      ?auto_33799 - PLACE
      ?auto_33796 - HOIST
      ?auto_33801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33802 ?auto_33798 ) ( IS-CRATE ?auto_33795 ) ( not ( = ?auto_33794 ?auto_33795 ) ) ( not ( = ?auto_33793 ?auto_33794 ) ) ( not ( = ?auto_33793 ?auto_33795 ) ) ( not ( = ?auto_33804 ?auto_33798 ) ) ( HOIST-AT ?auto_33800 ?auto_33804 ) ( not ( = ?auto_33802 ?auto_33800 ) ) ( AVAILABLE ?auto_33800 ) ( SURFACE-AT ?auto_33795 ?auto_33804 ) ( ON ?auto_33795 ?auto_33797 ) ( CLEAR ?auto_33795 ) ( not ( = ?auto_33794 ?auto_33797 ) ) ( not ( = ?auto_33795 ?auto_33797 ) ) ( not ( = ?auto_33793 ?auto_33797 ) ) ( SURFACE-AT ?auto_33793 ?auto_33798 ) ( CLEAR ?auto_33793 ) ( IS-CRATE ?auto_33794 ) ( AVAILABLE ?auto_33802 ) ( TRUCK-AT ?auto_33803 ?auto_33799 ) ( not ( = ?auto_33799 ?auto_33798 ) ) ( not ( = ?auto_33804 ?auto_33799 ) ) ( HOIST-AT ?auto_33796 ?auto_33799 ) ( not ( = ?auto_33802 ?auto_33796 ) ) ( not ( = ?auto_33800 ?auto_33796 ) ) ( AVAILABLE ?auto_33796 ) ( SURFACE-AT ?auto_33794 ?auto_33799 ) ( ON ?auto_33794 ?auto_33801 ) ( CLEAR ?auto_33794 ) ( not ( = ?auto_33794 ?auto_33801 ) ) ( not ( = ?auto_33795 ?auto_33801 ) ) ( not ( = ?auto_33793 ?auto_33801 ) ) ( not ( = ?auto_33797 ?auto_33801 ) ) ( ON ?auto_33792 ?auto_33791 ) ( ON ?auto_33793 ?auto_33792 ) ( not ( = ?auto_33791 ?auto_33792 ) ) ( not ( = ?auto_33791 ?auto_33793 ) ) ( not ( = ?auto_33791 ?auto_33794 ) ) ( not ( = ?auto_33791 ?auto_33795 ) ) ( not ( = ?auto_33791 ?auto_33797 ) ) ( not ( = ?auto_33791 ?auto_33801 ) ) ( not ( = ?auto_33792 ?auto_33793 ) ) ( not ( = ?auto_33792 ?auto_33794 ) ) ( not ( = ?auto_33792 ?auto_33795 ) ) ( not ( = ?auto_33792 ?auto_33797 ) ) ( not ( = ?auto_33792 ?auto_33801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33793 ?auto_33794 ?auto_33795 )
      ( MAKE-4CRATE-VERIFY ?auto_33791 ?auto_33792 ?auto_33793 ?auto_33794 ?auto_33795 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33805 - SURFACE
      ?auto_33806 - SURFACE
    )
    :vars
    (
      ?auto_33814 - HOIST
      ?auto_33809 - PLACE
      ?auto_33813 - SURFACE
      ?auto_33816 - PLACE
      ?auto_33811 - HOIST
      ?auto_33808 - SURFACE
      ?auto_33810 - PLACE
      ?auto_33807 - HOIST
      ?auto_33812 - SURFACE
      ?auto_33815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33814 ?auto_33809 ) ( IS-CRATE ?auto_33806 ) ( not ( = ?auto_33805 ?auto_33806 ) ) ( not ( = ?auto_33813 ?auto_33805 ) ) ( not ( = ?auto_33813 ?auto_33806 ) ) ( not ( = ?auto_33816 ?auto_33809 ) ) ( HOIST-AT ?auto_33811 ?auto_33816 ) ( not ( = ?auto_33814 ?auto_33811 ) ) ( AVAILABLE ?auto_33811 ) ( SURFACE-AT ?auto_33806 ?auto_33816 ) ( ON ?auto_33806 ?auto_33808 ) ( CLEAR ?auto_33806 ) ( not ( = ?auto_33805 ?auto_33808 ) ) ( not ( = ?auto_33806 ?auto_33808 ) ) ( not ( = ?auto_33813 ?auto_33808 ) ) ( SURFACE-AT ?auto_33813 ?auto_33809 ) ( CLEAR ?auto_33813 ) ( IS-CRATE ?auto_33805 ) ( AVAILABLE ?auto_33814 ) ( not ( = ?auto_33810 ?auto_33809 ) ) ( not ( = ?auto_33816 ?auto_33810 ) ) ( HOIST-AT ?auto_33807 ?auto_33810 ) ( not ( = ?auto_33814 ?auto_33807 ) ) ( not ( = ?auto_33811 ?auto_33807 ) ) ( AVAILABLE ?auto_33807 ) ( SURFACE-AT ?auto_33805 ?auto_33810 ) ( ON ?auto_33805 ?auto_33812 ) ( CLEAR ?auto_33805 ) ( not ( = ?auto_33805 ?auto_33812 ) ) ( not ( = ?auto_33806 ?auto_33812 ) ) ( not ( = ?auto_33813 ?auto_33812 ) ) ( not ( = ?auto_33808 ?auto_33812 ) ) ( TRUCK-AT ?auto_33815 ?auto_33809 ) )
    :subtasks
    ( ( !DRIVE ?auto_33815 ?auto_33809 ?auto_33810 )
      ( MAKE-2CRATE ?auto_33813 ?auto_33805 ?auto_33806 )
      ( MAKE-1CRATE-VERIFY ?auto_33805 ?auto_33806 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33817 - SURFACE
      ?auto_33818 - SURFACE
      ?auto_33819 - SURFACE
    )
    :vars
    (
      ?auto_33820 - HOIST
      ?auto_33821 - PLACE
      ?auto_33825 - PLACE
      ?auto_33823 - HOIST
      ?auto_33827 - SURFACE
      ?auto_33822 - PLACE
      ?auto_33824 - HOIST
      ?auto_33826 - SURFACE
      ?auto_33828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33820 ?auto_33821 ) ( IS-CRATE ?auto_33819 ) ( not ( = ?auto_33818 ?auto_33819 ) ) ( not ( = ?auto_33817 ?auto_33818 ) ) ( not ( = ?auto_33817 ?auto_33819 ) ) ( not ( = ?auto_33825 ?auto_33821 ) ) ( HOIST-AT ?auto_33823 ?auto_33825 ) ( not ( = ?auto_33820 ?auto_33823 ) ) ( AVAILABLE ?auto_33823 ) ( SURFACE-AT ?auto_33819 ?auto_33825 ) ( ON ?auto_33819 ?auto_33827 ) ( CLEAR ?auto_33819 ) ( not ( = ?auto_33818 ?auto_33827 ) ) ( not ( = ?auto_33819 ?auto_33827 ) ) ( not ( = ?auto_33817 ?auto_33827 ) ) ( SURFACE-AT ?auto_33817 ?auto_33821 ) ( CLEAR ?auto_33817 ) ( IS-CRATE ?auto_33818 ) ( AVAILABLE ?auto_33820 ) ( not ( = ?auto_33822 ?auto_33821 ) ) ( not ( = ?auto_33825 ?auto_33822 ) ) ( HOIST-AT ?auto_33824 ?auto_33822 ) ( not ( = ?auto_33820 ?auto_33824 ) ) ( not ( = ?auto_33823 ?auto_33824 ) ) ( AVAILABLE ?auto_33824 ) ( SURFACE-AT ?auto_33818 ?auto_33822 ) ( ON ?auto_33818 ?auto_33826 ) ( CLEAR ?auto_33818 ) ( not ( = ?auto_33818 ?auto_33826 ) ) ( not ( = ?auto_33819 ?auto_33826 ) ) ( not ( = ?auto_33817 ?auto_33826 ) ) ( not ( = ?auto_33827 ?auto_33826 ) ) ( TRUCK-AT ?auto_33828 ?auto_33821 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33818 ?auto_33819 )
      ( MAKE-2CRATE-VERIFY ?auto_33817 ?auto_33818 ?auto_33819 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33829 - SURFACE
      ?auto_33830 - SURFACE
      ?auto_33831 - SURFACE
      ?auto_33832 - SURFACE
    )
    :vars
    (
      ?auto_33840 - HOIST
      ?auto_33841 - PLACE
      ?auto_33836 - PLACE
      ?auto_33835 - HOIST
      ?auto_33838 - SURFACE
      ?auto_33833 - PLACE
      ?auto_33837 - HOIST
      ?auto_33839 - SURFACE
      ?auto_33834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33840 ?auto_33841 ) ( IS-CRATE ?auto_33832 ) ( not ( = ?auto_33831 ?auto_33832 ) ) ( not ( = ?auto_33830 ?auto_33831 ) ) ( not ( = ?auto_33830 ?auto_33832 ) ) ( not ( = ?auto_33836 ?auto_33841 ) ) ( HOIST-AT ?auto_33835 ?auto_33836 ) ( not ( = ?auto_33840 ?auto_33835 ) ) ( AVAILABLE ?auto_33835 ) ( SURFACE-AT ?auto_33832 ?auto_33836 ) ( ON ?auto_33832 ?auto_33838 ) ( CLEAR ?auto_33832 ) ( not ( = ?auto_33831 ?auto_33838 ) ) ( not ( = ?auto_33832 ?auto_33838 ) ) ( not ( = ?auto_33830 ?auto_33838 ) ) ( SURFACE-AT ?auto_33830 ?auto_33841 ) ( CLEAR ?auto_33830 ) ( IS-CRATE ?auto_33831 ) ( AVAILABLE ?auto_33840 ) ( not ( = ?auto_33833 ?auto_33841 ) ) ( not ( = ?auto_33836 ?auto_33833 ) ) ( HOIST-AT ?auto_33837 ?auto_33833 ) ( not ( = ?auto_33840 ?auto_33837 ) ) ( not ( = ?auto_33835 ?auto_33837 ) ) ( AVAILABLE ?auto_33837 ) ( SURFACE-AT ?auto_33831 ?auto_33833 ) ( ON ?auto_33831 ?auto_33839 ) ( CLEAR ?auto_33831 ) ( not ( = ?auto_33831 ?auto_33839 ) ) ( not ( = ?auto_33832 ?auto_33839 ) ) ( not ( = ?auto_33830 ?auto_33839 ) ) ( not ( = ?auto_33838 ?auto_33839 ) ) ( TRUCK-AT ?auto_33834 ?auto_33841 ) ( ON ?auto_33830 ?auto_33829 ) ( not ( = ?auto_33829 ?auto_33830 ) ) ( not ( = ?auto_33829 ?auto_33831 ) ) ( not ( = ?auto_33829 ?auto_33832 ) ) ( not ( = ?auto_33829 ?auto_33838 ) ) ( not ( = ?auto_33829 ?auto_33839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33830 ?auto_33831 ?auto_33832 )
      ( MAKE-3CRATE-VERIFY ?auto_33829 ?auto_33830 ?auto_33831 ?auto_33832 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33842 - SURFACE
      ?auto_33843 - SURFACE
      ?auto_33844 - SURFACE
      ?auto_33845 - SURFACE
      ?auto_33846 - SURFACE
    )
    :vars
    (
      ?auto_33854 - HOIST
      ?auto_33855 - PLACE
      ?auto_33850 - PLACE
      ?auto_33849 - HOIST
      ?auto_33852 - SURFACE
      ?auto_33847 - PLACE
      ?auto_33851 - HOIST
      ?auto_33853 - SURFACE
      ?auto_33848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33854 ?auto_33855 ) ( IS-CRATE ?auto_33846 ) ( not ( = ?auto_33845 ?auto_33846 ) ) ( not ( = ?auto_33844 ?auto_33845 ) ) ( not ( = ?auto_33844 ?auto_33846 ) ) ( not ( = ?auto_33850 ?auto_33855 ) ) ( HOIST-AT ?auto_33849 ?auto_33850 ) ( not ( = ?auto_33854 ?auto_33849 ) ) ( AVAILABLE ?auto_33849 ) ( SURFACE-AT ?auto_33846 ?auto_33850 ) ( ON ?auto_33846 ?auto_33852 ) ( CLEAR ?auto_33846 ) ( not ( = ?auto_33845 ?auto_33852 ) ) ( not ( = ?auto_33846 ?auto_33852 ) ) ( not ( = ?auto_33844 ?auto_33852 ) ) ( SURFACE-AT ?auto_33844 ?auto_33855 ) ( CLEAR ?auto_33844 ) ( IS-CRATE ?auto_33845 ) ( AVAILABLE ?auto_33854 ) ( not ( = ?auto_33847 ?auto_33855 ) ) ( not ( = ?auto_33850 ?auto_33847 ) ) ( HOIST-AT ?auto_33851 ?auto_33847 ) ( not ( = ?auto_33854 ?auto_33851 ) ) ( not ( = ?auto_33849 ?auto_33851 ) ) ( AVAILABLE ?auto_33851 ) ( SURFACE-AT ?auto_33845 ?auto_33847 ) ( ON ?auto_33845 ?auto_33853 ) ( CLEAR ?auto_33845 ) ( not ( = ?auto_33845 ?auto_33853 ) ) ( not ( = ?auto_33846 ?auto_33853 ) ) ( not ( = ?auto_33844 ?auto_33853 ) ) ( not ( = ?auto_33852 ?auto_33853 ) ) ( TRUCK-AT ?auto_33848 ?auto_33855 ) ( ON ?auto_33843 ?auto_33842 ) ( ON ?auto_33844 ?auto_33843 ) ( not ( = ?auto_33842 ?auto_33843 ) ) ( not ( = ?auto_33842 ?auto_33844 ) ) ( not ( = ?auto_33842 ?auto_33845 ) ) ( not ( = ?auto_33842 ?auto_33846 ) ) ( not ( = ?auto_33842 ?auto_33852 ) ) ( not ( = ?auto_33842 ?auto_33853 ) ) ( not ( = ?auto_33843 ?auto_33844 ) ) ( not ( = ?auto_33843 ?auto_33845 ) ) ( not ( = ?auto_33843 ?auto_33846 ) ) ( not ( = ?auto_33843 ?auto_33852 ) ) ( not ( = ?auto_33843 ?auto_33853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33844 ?auto_33845 ?auto_33846 )
      ( MAKE-4CRATE-VERIFY ?auto_33842 ?auto_33843 ?auto_33844 ?auto_33845 ?auto_33846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33856 - SURFACE
      ?auto_33857 - SURFACE
    )
    :vars
    (
      ?auto_33865 - HOIST
      ?auto_33866 - PLACE
      ?auto_33867 - SURFACE
      ?auto_33861 - PLACE
      ?auto_33860 - HOIST
      ?auto_33863 - SURFACE
      ?auto_33858 - PLACE
      ?auto_33862 - HOIST
      ?auto_33864 - SURFACE
      ?auto_33859 - TRUCK
      ?auto_33868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33865 ?auto_33866 ) ( IS-CRATE ?auto_33857 ) ( not ( = ?auto_33856 ?auto_33857 ) ) ( not ( = ?auto_33867 ?auto_33856 ) ) ( not ( = ?auto_33867 ?auto_33857 ) ) ( not ( = ?auto_33861 ?auto_33866 ) ) ( HOIST-AT ?auto_33860 ?auto_33861 ) ( not ( = ?auto_33865 ?auto_33860 ) ) ( AVAILABLE ?auto_33860 ) ( SURFACE-AT ?auto_33857 ?auto_33861 ) ( ON ?auto_33857 ?auto_33863 ) ( CLEAR ?auto_33857 ) ( not ( = ?auto_33856 ?auto_33863 ) ) ( not ( = ?auto_33857 ?auto_33863 ) ) ( not ( = ?auto_33867 ?auto_33863 ) ) ( IS-CRATE ?auto_33856 ) ( not ( = ?auto_33858 ?auto_33866 ) ) ( not ( = ?auto_33861 ?auto_33858 ) ) ( HOIST-AT ?auto_33862 ?auto_33858 ) ( not ( = ?auto_33865 ?auto_33862 ) ) ( not ( = ?auto_33860 ?auto_33862 ) ) ( AVAILABLE ?auto_33862 ) ( SURFACE-AT ?auto_33856 ?auto_33858 ) ( ON ?auto_33856 ?auto_33864 ) ( CLEAR ?auto_33856 ) ( not ( = ?auto_33856 ?auto_33864 ) ) ( not ( = ?auto_33857 ?auto_33864 ) ) ( not ( = ?auto_33867 ?auto_33864 ) ) ( not ( = ?auto_33863 ?auto_33864 ) ) ( TRUCK-AT ?auto_33859 ?auto_33866 ) ( SURFACE-AT ?auto_33868 ?auto_33866 ) ( CLEAR ?auto_33868 ) ( LIFTING ?auto_33865 ?auto_33867 ) ( IS-CRATE ?auto_33867 ) ( not ( = ?auto_33868 ?auto_33867 ) ) ( not ( = ?auto_33856 ?auto_33868 ) ) ( not ( = ?auto_33857 ?auto_33868 ) ) ( not ( = ?auto_33863 ?auto_33868 ) ) ( not ( = ?auto_33864 ?auto_33868 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33868 ?auto_33867 )
      ( MAKE-2CRATE ?auto_33867 ?auto_33856 ?auto_33857 )
      ( MAKE-1CRATE-VERIFY ?auto_33856 ?auto_33857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33869 - SURFACE
      ?auto_33870 - SURFACE
      ?auto_33871 - SURFACE
    )
    :vars
    (
      ?auto_33873 - HOIST
      ?auto_33877 - PLACE
      ?auto_33880 - PLACE
      ?auto_33875 - HOIST
      ?auto_33874 - SURFACE
      ?auto_33872 - PLACE
      ?auto_33876 - HOIST
      ?auto_33879 - SURFACE
      ?auto_33878 - TRUCK
      ?auto_33881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33873 ?auto_33877 ) ( IS-CRATE ?auto_33871 ) ( not ( = ?auto_33870 ?auto_33871 ) ) ( not ( = ?auto_33869 ?auto_33870 ) ) ( not ( = ?auto_33869 ?auto_33871 ) ) ( not ( = ?auto_33880 ?auto_33877 ) ) ( HOIST-AT ?auto_33875 ?auto_33880 ) ( not ( = ?auto_33873 ?auto_33875 ) ) ( AVAILABLE ?auto_33875 ) ( SURFACE-AT ?auto_33871 ?auto_33880 ) ( ON ?auto_33871 ?auto_33874 ) ( CLEAR ?auto_33871 ) ( not ( = ?auto_33870 ?auto_33874 ) ) ( not ( = ?auto_33871 ?auto_33874 ) ) ( not ( = ?auto_33869 ?auto_33874 ) ) ( IS-CRATE ?auto_33870 ) ( not ( = ?auto_33872 ?auto_33877 ) ) ( not ( = ?auto_33880 ?auto_33872 ) ) ( HOIST-AT ?auto_33876 ?auto_33872 ) ( not ( = ?auto_33873 ?auto_33876 ) ) ( not ( = ?auto_33875 ?auto_33876 ) ) ( AVAILABLE ?auto_33876 ) ( SURFACE-AT ?auto_33870 ?auto_33872 ) ( ON ?auto_33870 ?auto_33879 ) ( CLEAR ?auto_33870 ) ( not ( = ?auto_33870 ?auto_33879 ) ) ( not ( = ?auto_33871 ?auto_33879 ) ) ( not ( = ?auto_33869 ?auto_33879 ) ) ( not ( = ?auto_33874 ?auto_33879 ) ) ( TRUCK-AT ?auto_33878 ?auto_33877 ) ( SURFACE-AT ?auto_33881 ?auto_33877 ) ( CLEAR ?auto_33881 ) ( LIFTING ?auto_33873 ?auto_33869 ) ( IS-CRATE ?auto_33869 ) ( not ( = ?auto_33881 ?auto_33869 ) ) ( not ( = ?auto_33870 ?auto_33881 ) ) ( not ( = ?auto_33871 ?auto_33881 ) ) ( not ( = ?auto_33874 ?auto_33881 ) ) ( not ( = ?auto_33879 ?auto_33881 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33870 ?auto_33871 )
      ( MAKE-2CRATE-VERIFY ?auto_33869 ?auto_33870 ?auto_33871 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33882 - SURFACE
      ?auto_33883 - SURFACE
      ?auto_33884 - SURFACE
      ?auto_33885 - SURFACE
    )
    :vars
    (
      ?auto_33890 - HOIST
      ?auto_33893 - PLACE
      ?auto_33889 - PLACE
      ?auto_33894 - HOIST
      ?auto_33886 - SURFACE
      ?auto_33888 - PLACE
      ?auto_33891 - HOIST
      ?auto_33887 - SURFACE
      ?auto_33892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33890 ?auto_33893 ) ( IS-CRATE ?auto_33885 ) ( not ( = ?auto_33884 ?auto_33885 ) ) ( not ( = ?auto_33883 ?auto_33884 ) ) ( not ( = ?auto_33883 ?auto_33885 ) ) ( not ( = ?auto_33889 ?auto_33893 ) ) ( HOIST-AT ?auto_33894 ?auto_33889 ) ( not ( = ?auto_33890 ?auto_33894 ) ) ( AVAILABLE ?auto_33894 ) ( SURFACE-AT ?auto_33885 ?auto_33889 ) ( ON ?auto_33885 ?auto_33886 ) ( CLEAR ?auto_33885 ) ( not ( = ?auto_33884 ?auto_33886 ) ) ( not ( = ?auto_33885 ?auto_33886 ) ) ( not ( = ?auto_33883 ?auto_33886 ) ) ( IS-CRATE ?auto_33884 ) ( not ( = ?auto_33888 ?auto_33893 ) ) ( not ( = ?auto_33889 ?auto_33888 ) ) ( HOIST-AT ?auto_33891 ?auto_33888 ) ( not ( = ?auto_33890 ?auto_33891 ) ) ( not ( = ?auto_33894 ?auto_33891 ) ) ( AVAILABLE ?auto_33891 ) ( SURFACE-AT ?auto_33884 ?auto_33888 ) ( ON ?auto_33884 ?auto_33887 ) ( CLEAR ?auto_33884 ) ( not ( = ?auto_33884 ?auto_33887 ) ) ( not ( = ?auto_33885 ?auto_33887 ) ) ( not ( = ?auto_33883 ?auto_33887 ) ) ( not ( = ?auto_33886 ?auto_33887 ) ) ( TRUCK-AT ?auto_33892 ?auto_33893 ) ( SURFACE-AT ?auto_33882 ?auto_33893 ) ( CLEAR ?auto_33882 ) ( LIFTING ?auto_33890 ?auto_33883 ) ( IS-CRATE ?auto_33883 ) ( not ( = ?auto_33882 ?auto_33883 ) ) ( not ( = ?auto_33884 ?auto_33882 ) ) ( not ( = ?auto_33885 ?auto_33882 ) ) ( not ( = ?auto_33886 ?auto_33882 ) ) ( not ( = ?auto_33887 ?auto_33882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33883 ?auto_33884 ?auto_33885 )
      ( MAKE-3CRATE-VERIFY ?auto_33882 ?auto_33883 ?auto_33884 ?auto_33885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33895 - SURFACE
      ?auto_33896 - SURFACE
      ?auto_33897 - SURFACE
      ?auto_33898 - SURFACE
      ?auto_33899 - SURFACE
    )
    :vars
    (
      ?auto_33904 - HOIST
      ?auto_33907 - PLACE
      ?auto_33903 - PLACE
      ?auto_33908 - HOIST
      ?auto_33900 - SURFACE
      ?auto_33902 - PLACE
      ?auto_33905 - HOIST
      ?auto_33901 - SURFACE
      ?auto_33906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33904 ?auto_33907 ) ( IS-CRATE ?auto_33899 ) ( not ( = ?auto_33898 ?auto_33899 ) ) ( not ( = ?auto_33897 ?auto_33898 ) ) ( not ( = ?auto_33897 ?auto_33899 ) ) ( not ( = ?auto_33903 ?auto_33907 ) ) ( HOIST-AT ?auto_33908 ?auto_33903 ) ( not ( = ?auto_33904 ?auto_33908 ) ) ( AVAILABLE ?auto_33908 ) ( SURFACE-AT ?auto_33899 ?auto_33903 ) ( ON ?auto_33899 ?auto_33900 ) ( CLEAR ?auto_33899 ) ( not ( = ?auto_33898 ?auto_33900 ) ) ( not ( = ?auto_33899 ?auto_33900 ) ) ( not ( = ?auto_33897 ?auto_33900 ) ) ( IS-CRATE ?auto_33898 ) ( not ( = ?auto_33902 ?auto_33907 ) ) ( not ( = ?auto_33903 ?auto_33902 ) ) ( HOIST-AT ?auto_33905 ?auto_33902 ) ( not ( = ?auto_33904 ?auto_33905 ) ) ( not ( = ?auto_33908 ?auto_33905 ) ) ( AVAILABLE ?auto_33905 ) ( SURFACE-AT ?auto_33898 ?auto_33902 ) ( ON ?auto_33898 ?auto_33901 ) ( CLEAR ?auto_33898 ) ( not ( = ?auto_33898 ?auto_33901 ) ) ( not ( = ?auto_33899 ?auto_33901 ) ) ( not ( = ?auto_33897 ?auto_33901 ) ) ( not ( = ?auto_33900 ?auto_33901 ) ) ( TRUCK-AT ?auto_33906 ?auto_33907 ) ( SURFACE-AT ?auto_33896 ?auto_33907 ) ( CLEAR ?auto_33896 ) ( LIFTING ?auto_33904 ?auto_33897 ) ( IS-CRATE ?auto_33897 ) ( not ( = ?auto_33896 ?auto_33897 ) ) ( not ( = ?auto_33898 ?auto_33896 ) ) ( not ( = ?auto_33899 ?auto_33896 ) ) ( not ( = ?auto_33900 ?auto_33896 ) ) ( not ( = ?auto_33901 ?auto_33896 ) ) ( ON ?auto_33896 ?auto_33895 ) ( not ( = ?auto_33895 ?auto_33896 ) ) ( not ( = ?auto_33895 ?auto_33897 ) ) ( not ( = ?auto_33895 ?auto_33898 ) ) ( not ( = ?auto_33895 ?auto_33899 ) ) ( not ( = ?auto_33895 ?auto_33900 ) ) ( not ( = ?auto_33895 ?auto_33901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33897 ?auto_33898 ?auto_33899 )
      ( MAKE-4CRATE-VERIFY ?auto_33895 ?auto_33896 ?auto_33897 ?auto_33898 ?auto_33899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33909 - SURFACE
      ?auto_33910 - SURFACE
    )
    :vars
    (
      ?auto_33917 - HOIST
      ?auto_33920 - PLACE
      ?auto_33911 - SURFACE
      ?auto_33916 - PLACE
      ?auto_33921 - HOIST
      ?auto_33912 - SURFACE
      ?auto_33915 - PLACE
      ?auto_33918 - HOIST
      ?auto_33913 - SURFACE
      ?auto_33919 - TRUCK
      ?auto_33914 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33917 ?auto_33920 ) ( IS-CRATE ?auto_33910 ) ( not ( = ?auto_33909 ?auto_33910 ) ) ( not ( = ?auto_33911 ?auto_33909 ) ) ( not ( = ?auto_33911 ?auto_33910 ) ) ( not ( = ?auto_33916 ?auto_33920 ) ) ( HOIST-AT ?auto_33921 ?auto_33916 ) ( not ( = ?auto_33917 ?auto_33921 ) ) ( AVAILABLE ?auto_33921 ) ( SURFACE-AT ?auto_33910 ?auto_33916 ) ( ON ?auto_33910 ?auto_33912 ) ( CLEAR ?auto_33910 ) ( not ( = ?auto_33909 ?auto_33912 ) ) ( not ( = ?auto_33910 ?auto_33912 ) ) ( not ( = ?auto_33911 ?auto_33912 ) ) ( IS-CRATE ?auto_33909 ) ( not ( = ?auto_33915 ?auto_33920 ) ) ( not ( = ?auto_33916 ?auto_33915 ) ) ( HOIST-AT ?auto_33918 ?auto_33915 ) ( not ( = ?auto_33917 ?auto_33918 ) ) ( not ( = ?auto_33921 ?auto_33918 ) ) ( AVAILABLE ?auto_33918 ) ( SURFACE-AT ?auto_33909 ?auto_33915 ) ( ON ?auto_33909 ?auto_33913 ) ( CLEAR ?auto_33909 ) ( not ( = ?auto_33909 ?auto_33913 ) ) ( not ( = ?auto_33910 ?auto_33913 ) ) ( not ( = ?auto_33911 ?auto_33913 ) ) ( not ( = ?auto_33912 ?auto_33913 ) ) ( TRUCK-AT ?auto_33919 ?auto_33920 ) ( SURFACE-AT ?auto_33914 ?auto_33920 ) ( CLEAR ?auto_33914 ) ( IS-CRATE ?auto_33911 ) ( not ( = ?auto_33914 ?auto_33911 ) ) ( not ( = ?auto_33909 ?auto_33914 ) ) ( not ( = ?auto_33910 ?auto_33914 ) ) ( not ( = ?auto_33912 ?auto_33914 ) ) ( not ( = ?auto_33913 ?auto_33914 ) ) ( AVAILABLE ?auto_33917 ) ( IN ?auto_33911 ?auto_33919 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33917 ?auto_33911 ?auto_33919 ?auto_33920 )
      ( MAKE-2CRATE ?auto_33911 ?auto_33909 ?auto_33910 )
      ( MAKE-1CRATE-VERIFY ?auto_33909 ?auto_33910 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33922 - SURFACE
      ?auto_33923 - SURFACE
      ?auto_33924 - SURFACE
    )
    :vars
    (
      ?auto_33928 - HOIST
      ?auto_33931 - PLACE
      ?auto_33933 - PLACE
      ?auto_33932 - HOIST
      ?auto_33926 - SURFACE
      ?auto_33929 - PLACE
      ?auto_33934 - HOIST
      ?auto_33925 - SURFACE
      ?auto_33930 - TRUCK
      ?auto_33927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33928 ?auto_33931 ) ( IS-CRATE ?auto_33924 ) ( not ( = ?auto_33923 ?auto_33924 ) ) ( not ( = ?auto_33922 ?auto_33923 ) ) ( not ( = ?auto_33922 ?auto_33924 ) ) ( not ( = ?auto_33933 ?auto_33931 ) ) ( HOIST-AT ?auto_33932 ?auto_33933 ) ( not ( = ?auto_33928 ?auto_33932 ) ) ( AVAILABLE ?auto_33932 ) ( SURFACE-AT ?auto_33924 ?auto_33933 ) ( ON ?auto_33924 ?auto_33926 ) ( CLEAR ?auto_33924 ) ( not ( = ?auto_33923 ?auto_33926 ) ) ( not ( = ?auto_33924 ?auto_33926 ) ) ( not ( = ?auto_33922 ?auto_33926 ) ) ( IS-CRATE ?auto_33923 ) ( not ( = ?auto_33929 ?auto_33931 ) ) ( not ( = ?auto_33933 ?auto_33929 ) ) ( HOIST-AT ?auto_33934 ?auto_33929 ) ( not ( = ?auto_33928 ?auto_33934 ) ) ( not ( = ?auto_33932 ?auto_33934 ) ) ( AVAILABLE ?auto_33934 ) ( SURFACE-AT ?auto_33923 ?auto_33929 ) ( ON ?auto_33923 ?auto_33925 ) ( CLEAR ?auto_33923 ) ( not ( = ?auto_33923 ?auto_33925 ) ) ( not ( = ?auto_33924 ?auto_33925 ) ) ( not ( = ?auto_33922 ?auto_33925 ) ) ( not ( = ?auto_33926 ?auto_33925 ) ) ( TRUCK-AT ?auto_33930 ?auto_33931 ) ( SURFACE-AT ?auto_33927 ?auto_33931 ) ( CLEAR ?auto_33927 ) ( IS-CRATE ?auto_33922 ) ( not ( = ?auto_33927 ?auto_33922 ) ) ( not ( = ?auto_33923 ?auto_33927 ) ) ( not ( = ?auto_33924 ?auto_33927 ) ) ( not ( = ?auto_33926 ?auto_33927 ) ) ( not ( = ?auto_33925 ?auto_33927 ) ) ( AVAILABLE ?auto_33928 ) ( IN ?auto_33922 ?auto_33930 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33923 ?auto_33924 )
      ( MAKE-2CRATE-VERIFY ?auto_33922 ?auto_33923 ?auto_33924 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33935 - SURFACE
      ?auto_33936 - SURFACE
      ?auto_33937 - SURFACE
      ?auto_33938 - SURFACE
    )
    :vars
    (
      ?auto_33944 - HOIST
      ?auto_33945 - PLACE
      ?auto_33942 - PLACE
      ?auto_33940 - HOIST
      ?auto_33943 - SURFACE
      ?auto_33947 - PLACE
      ?auto_33941 - HOIST
      ?auto_33939 - SURFACE
      ?auto_33946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33944 ?auto_33945 ) ( IS-CRATE ?auto_33938 ) ( not ( = ?auto_33937 ?auto_33938 ) ) ( not ( = ?auto_33936 ?auto_33937 ) ) ( not ( = ?auto_33936 ?auto_33938 ) ) ( not ( = ?auto_33942 ?auto_33945 ) ) ( HOIST-AT ?auto_33940 ?auto_33942 ) ( not ( = ?auto_33944 ?auto_33940 ) ) ( AVAILABLE ?auto_33940 ) ( SURFACE-AT ?auto_33938 ?auto_33942 ) ( ON ?auto_33938 ?auto_33943 ) ( CLEAR ?auto_33938 ) ( not ( = ?auto_33937 ?auto_33943 ) ) ( not ( = ?auto_33938 ?auto_33943 ) ) ( not ( = ?auto_33936 ?auto_33943 ) ) ( IS-CRATE ?auto_33937 ) ( not ( = ?auto_33947 ?auto_33945 ) ) ( not ( = ?auto_33942 ?auto_33947 ) ) ( HOIST-AT ?auto_33941 ?auto_33947 ) ( not ( = ?auto_33944 ?auto_33941 ) ) ( not ( = ?auto_33940 ?auto_33941 ) ) ( AVAILABLE ?auto_33941 ) ( SURFACE-AT ?auto_33937 ?auto_33947 ) ( ON ?auto_33937 ?auto_33939 ) ( CLEAR ?auto_33937 ) ( not ( = ?auto_33937 ?auto_33939 ) ) ( not ( = ?auto_33938 ?auto_33939 ) ) ( not ( = ?auto_33936 ?auto_33939 ) ) ( not ( = ?auto_33943 ?auto_33939 ) ) ( TRUCK-AT ?auto_33946 ?auto_33945 ) ( SURFACE-AT ?auto_33935 ?auto_33945 ) ( CLEAR ?auto_33935 ) ( IS-CRATE ?auto_33936 ) ( not ( = ?auto_33935 ?auto_33936 ) ) ( not ( = ?auto_33937 ?auto_33935 ) ) ( not ( = ?auto_33938 ?auto_33935 ) ) ( not ( = ?auto_33943 ?auto_33935 ) ) ( not ( = ?auto_33939 ?auto_33935 ) ) ( AVAILABLE ?auto_33944 ) ( IN ?auto_33936 ?auto_33946 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33936 ?auto_33937 ?auto_33938 )
      ( MAKE-3CRATE-VERIFY ?auto_33935 ?auto_33936 ?auto_33937 ?auto_33938 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_33948 - SURFACE
      ?auto_33949 - SURFACE
      ?auto_33950 - SURFACE
      ?auto_33951 - SURFACE
      ?auto_33952 - SURFACE
    )
    :vars
    (
      ?auto_33958 - HOIST
      ?auto_33959 - PLACE
      ?auto_33956 - PLACE
      ?auto_33954 - HOIST
      ?auto_33957 - SURFACE
      ?auto_33961 - PLACE
      ?auto_33955 - HOIST
      ?auto_33953 - SURFACE
      ?auto_33960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33958 ?auto_33959 ) ( IS-CRATE ?auto_33952 ) ( not ( = ?auto_33951 ?auto_33952 ) ) ( not ( = ?auto_33950 ?auto_33951 ) ) ( not ( = ?auto_33950 ?auto_33952 ) ) ( not ( = ?auto_33956 ?auto_33959 ) ) ( HOIST-AT ?auto_33954 ?auto_33956 ) ( not ( = ?auto_33958 ?auto_33954 ) ) ( AVAILABLE ?auto_33954 ) ( SURFACE-AT ?auto_33952 ?auto_33956 ) ( ON ?auto_33952 ?auto_33957 ) ( CLEAR ?auto_33952 ) ( not ( = ?auto_33951 ?auto_33957 ) ) ( not ( = ?auto_33952 ?auto_33957 ) ) ( not ( = ?auto_33950 ?auto_33957 ) ) ( IS-CRATE ?auto_33951 ) ( not ( = ?auto_33961 ?auto_33959 ) ) ( not ( = ?auto_33956 ?auto_33961 ) ) ( HOIST-AT ?auto_33955 ?auto_33961 ) ( not ( = ?auto_33958 ?auto_33955 ) ) ( not ( = ?auto_33954 ?auto_33955 ) ) ( AVAILABLE ?auto_33955 ) ( SURFACE-AT ?auto_33951 ?auto_33961 ) ( ON ?auto_33951 ?auto_33953 ) ( CLEAR ?auto_33951 ) ( not ( = ?auto_33951 ?auto_33953 ) ) ( not ( = ?auto_33952 ?auto_33953 ) ) ( not ( = ?auto_33950 ?auto_33953 ) ) ( not ( = ?auto_33957 ?auto_33953 ) ) ( TRUCK-AT ?auto_33960 ?auto_33959 ) ( SURFACE-AT ?auto_33949 ?auto_33959 ) ( CLEAR ?auto_33949 ) ( IS-CRATE ?auto_33950 ) ( not ( = ?auto_33949 ?auto_33950 ) ) ( not ( = ?auto_33951 ?auto_33949 ) ) ( not ( = ?auto_33952 ?auto_33949 ) ) ( not ( = ?auto_33957 ?auto_33949 ) ) ( not ( = ?auto_33953 ?auto_33949 ) ) ( AVAILABLE ?auto_33958 ) ( IN ?auto_33950 ?auto_33960 ) ( ON ?auto_33949 ?auto_33948 ) ( not ( = ?auto_33948 ?auto_33949 ) ) ( not ( = ?auto_33948 ?auto_33950 ) ) ( not ( = ?auto_33948 ?auto_33951 ) ) ( not ( = ?auto_33948 ?auto_33952 ) ) ( not ( = ?auto_33948 ?auto_33957 ) ) ( not ( = ?auto_33948 ?auto_33953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33950 ?auto_33951 ?auto_33952 )
      ( MAKE-4CRATE-VERIFY ?auto_33948 ?auto_33949 ?auto_33950 ?auto_33951 ?auto_33952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_33962 - SURFACE
      ?auto_33963 - SURFACE
    )
    :vars
    (
      ?auto_33970 - HOIST
      ?auto_33971 - PLACE
      ?auto_33968 - SURFACE
      ?auto_33967 - PLACE
      ?auto_33965 - HOIST
      ?auto_33969 - SURFACE
      ?auto_33974 - PLACE
      ?auto_33966 - HOIST
      ?auto_33964 - SURFACE
      ?auto_33973 - SURFACE
      ?auto_33972 - TRUCK
      ?auto_33975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33970 ?auto_33971 ) ( IS-CRATE ?auto_33963 ) ( not ( = ?auto_33962 ?auto_33963 ) ) ( not ( = ?auto_33968 ?auto_33962 ) ) ( not ( = ?auto_33968 ?auto_33963 ) ) ( not ( = ?auto_33967 ?auto_33971 ) ) ( HOIST-AT ?auto_33965 ?auto_33967 ) ( not ( = ?auto_33970 ?auto_33965 ) ) ( AVAILABLE ?auto_33965 ) ( SURFACE-AT ?auto_33963 ?auto_33967 ) ( ON ?auto_33963 ?auto_33969 ) ( CLEAR ?auto_33963 ) ( not ( = ?auto_33962 ?auto_33969 ) ) ( not ( = ?auto_33963 ?auto_33969 ) ) ( not ( = ?auto_33968 ?auto_33969 ) ) ( IS-CRATE ?auto_33962 ) ( not ( = ?auto_33974 ?auto_33971 ) ) ( not ( = ?auto_33967 ?auto_33974 ) ) ( HOIST-AT ?auto_33966 ?auto_33974 ) ( not ( = ?auto_33970 ?auto_33966 ) ) ( not ( = ?auto_33965 ?auto_33966 ) ) ( AVAILABLE ?auto_33966 ) ( SURFACE-AT ?auto_33962 ?auto_33974 ) ( ON ?auto_33962 ?auto_33964 ) ( CLEAR ?auto_33962 ) ( not ( = ?auto_33962 ?auto_33964 ) ) ( not ( = ?auto_33963 ?auto_33964 ) ) ( not ( = ?auto_33968 ?auto_33964 ) ) ( not ( = ?auto_33969 ?auto_33964 ) ) ( SURFACE-AT ?auto_33973 ?auto_33971 ) ( CLEAR ?auto_33973 ) ( IS-CRATE ?auto_33968 ) ( not ( = ?auto_33973 ?auto_33968 ) ) ( not ( = ?auto_33962 ?auto_33973 ) ) ( not ( = ?auto_33963 ?auto_33973 ) ) ( not ( = ?auto_33969 ?auto_33973 ) ) ( not ( = ?auto_33964 ?auto_33973 ) ) ( AVAILABLE ?auto_33970 ) ( IN ?auto_33968 ?auto_33972 ) ( TRUCK-AT ?auto_33972 ?auto_33975 ) ( not ( = ?auto_33975 ?auto_33971 ) ) ( not ( = ?auto_33967 ?auto_33975 ) ) ( not ( = ?auto_33974 ?auto_33975 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33972 ?auto_33975 ?auto_33971 )
      ( MAKE-2CRATE ?auto_33968 ?auto_33962 ?auto_33963 )
      ( MAKE-1CRATE-VERIFY ?auto_33962 ?auto_33963 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_33976 - SURFACE
      ?auto_33977 - SURFACE
      ?auto_33978 - SURFACE
    )
    :vars
    (
      ?auto_33987 - HOIST
      ?auto_33988 - PLACE
      ?auto_33984 - PLACE
      ?auto_33985 - HOIST
      ?auto_33986 - SURFACE
      ?auto_33982 - PLACE
      ?auto_33979 - HOIST
      ?auto_33983 - SURFACE
      ?auto_33980 - SURFACE
      ?auto_33989 - TRUCK
      ?auto_33981 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33987 ?auto_33988 ) ( IS-CRATE ?auto_33978 ) ( not ( = ?auto_33977 ?auto_33978 ) ) ( not ( = ?auto_33976 ?auto_33977 ) ) ( not ( = ?auto_33976 ?auto_33978 ) ) ( not ( = ?auto_33984 ?auto_33988 ) ) ( HOIST-AT ?auto_33985 ?auto_33984 ) ( not ( = ?auto_33987 ?auto_33985 ) ) ( AVAILABLE ?auto_33985 ) ( SURFACE-AT ?auto_33978 ?auto_33984 ) ( ON ?auto_33978 ?auto_33986 ) ( CLEAR ?auto_33978 ) ( not ( = ?auto_33977 ?auto_33986 ) ) ( not ( = ?auto_33978 ?auto_33986 ) ) ( not ( = ?auto_33976 ?auto_33986 ) ) ( IS-CRATE ?auto_33977 ) ( not ( = ?auto_33982 ?auto_33988 ) ) ( not ( = ?auto_33984 ?auto_33982 ) ) ( HOIST-AT ?auto_33979 ?auto_33982 ) ( not ( = ?auto_33987 ?auto_33979 ) ) ( not ( = ?auto_33985 ?auto_33979 ) ) ( AVAILABLE ?auto_33979 ) ( SURFACE-AT ?auto_33977 ?auto_33982 ) ( ON ?auto_33977 ?auto_33983 ) ( CLEAR ?auto_33977 ) ( not ( = ?auto_33977 ?auto_33983 ) ) ( not ( = ?auto_33978 ?auto_33983 ) ) ( not ( = ?auto_33976 ?auto_33983 ) ) ( not ( = ?auto_33986 ?auto_33983 ) ) ( SURFACE-AT ?auto_33980 ?auto_33988 ) ( CLEAR ?auto_33980 ) ( IS-CRATE ?auto_33976 ) ( not ( = ?auto_33980 ?auto_33976 ) ) ( not ( = ?auto_33977 ?auto_33980 ) ) ( not ( = ?auto_33978 ?auto_33980 ) ) ( not ( = ?auto_33986 ?auto_33980 ) ) ( not ( = ?auto_33983 ?auto_33980 ) ) ( AVAILABLE ?auto_33987 ) ( IN ?auto_33976 ?auto_33989 ) ( TRUCK-AT ?auto_33989 ?auto_33981 ) ( not ( = ?auto_33981 ?auto_33988 ) ) ( not ( = ?auto_33984 ?auto_33981 ) ) ( not ( = ?auto_33982 ?auto_33981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_33977 ?auto_33978 )
      ( MAKE-2CRATE-VERIFY ?auto_33976 ?auto_33977 ?auto_33978 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_33990 - SURFACE
      ?auto_33991 - SURFACE
      ?auto_33992 - SURFACE
      ?auto_33993 - SURFACE
    )
    :vars
    (
      ?auto_33998 - HOIST
      ?auto_33994 - PLACE
      ?auto_34003 - PLACE
      ?auto_34002 - HOIST
      ?auto_33996 - SURFACE
      ?auto_34001 - PLACE
      ?auto_33995 - HOIST
      ?auto_33997 - SURFACE
      ?auto_34000 - TRUCK
      ?auto_33999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33998 ?auto_33994 ) ( IS-CRATE ?auto_33993 ) ( not ( = ?auto_33992 ?auto_33993 ) ) ( not ( = ?auto_33991 ?auto_33992 ) ) ( not ( = ?auto_33991 ?auto_33993 ) ) ( not ( = ?auto_34003 ?auto_33994 ) ) ( HOIST-AT ?auto_34002 ?auto_34003 ) ( not ( = ?auto_33998 ?auto_34002 ) ) ( AVAILABLE ?auto_34002 ) ( SURFACE-AT ?auto_33993 ?auto_34003 ) ( ON ?auto_33993 ?auto_33996 ) ( CLEAR ?auto_33993 ) ( not ( = ?auto_33992 ?auto_33996 ) ) ( not ( = ?auto_33993 ?auto_33996 ) ) ( not ( = ?auto_33991 ?auto_33996 ) ) ( IS-CRATE ?auto_33992 ) ( not ( = ?auto_34001 ?auto_33994 ) ) ( not ( = ?auto_34003 ?auto_34001 ) ) ( HOIST-AT ?auto_33995 ?auto_34001 ) ( not ( = ?auto_33998 ?auto_33995 ) ) ( not ( = ?auto_34002 ?auto_33995 ) ) ( AVAILABLE ?auto_33995 ) ( SURFACE-AT ?auto_33992 ?auto_34001 ) ( ON ?auto_33992 ?auto_33997 ) ( CLEAR ?auto_33992 ) ( not ( = ?auto_33992 ?auto_33997 ) ) ( not ( = ?auto_33993 ?auto_33997 ) ) ( not ( = ?auto_33991 ?auto_33997 ) ) ( not ( = ?auto_33996 ?auto_33997 ) ) ( SURFACE-AT ?auto_33990 ?auto_33994 ) ( CLEAR ?auto_33990 ) ( IS-CRATE ?auto_33991 ) ( not ( = ?auto_33990 ?auto_33991 ) ) ( not ( = ?auto_33992 ?auto_33990 ) ) ( not ( = ?auto_33993 ?auto_33990 ) ) ( not ( = ?auto_33996 ?auto_33990 ) ) ( not ( = ?auto_33997 ?auto_33990 ) ) ( AVAILABLE ?auto_33998 ) ( IN ?auto_33991 ?auto_34000 ) ( TRUCK-AT ?auto_34000 ?auto_33999 ) ( not ( = ?auto_33999 ?auto_33994 ) ) ( not ( = ?auto_34003 ?auto_33999 ) ) ( not ( = ?auto_34001 ?auto_33999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_33991 ?auto_33992 ?auto_33993 )
      ( MAKE-3CRATE-VERIFY ?auto_33990 ?auto_33991 ?auto_33992 ?auto_33993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34004 - SURFACE
      ?auto_34005 - SURFACE
      ?auto_34006 - SURFACE
      ?auto_34007 - SURFACE
      ?auto_34008 - SURFACE
    )
    :vars
    (
      ?auto_34013 - HOIST
      ?auto_34009 - PLACE
      ?auto_34018 - PLACE
      ?auto_34017 - HOIST
      ?auto_34011 - SURFACE
      ?auto_34016 - PLACE
      ?auto_34010 - HOIST
      ?auto_34012 - SURFACE
      ?auto_34015 - TRUCK
      ?auto_34014 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34013 ?auto_34009 ) ( IS-CRATE ?auto_34008 ) ( not ( = ?auto_34007 ?auto_34008 ) ) ( not ( = ?auto_34006 ?auto_34007 ) ) ( not ( = ?auto_34006 ?auto_34008 ) ) ( not ( = ?auto_34018 ?auto_34009 ) ) ( HOIST-AT ?auto_34017 ?auto_34018 ) ( not ( = ?auto_34013 ?auto_34017 ) ) ( AVAILABLE ?auto_34017 ) ( SURFACE-AT ?auto_34008 ?auto_34018 ) ( ON ?auto_34008 ?auto_34011 ) ( CLEAR ?auto_34008 ) ( not ( = ?auto_34007 ?auto_34011 ) ) ( not ( = ?auto_34008 ?auto_34011 ) ) ( not ( = ?auto_34006 ?auto_34011 ) ) ( IS-CRATE ?auto_34007 ) ( not ( = ?auto_34016 ?auto_34009 ) ) ( not ( = ?auto_34018 ?auto_34016 ) ) ( HOIST-AT ?auto_34010 ?auto_34016 ) ( not ( = ?auto_34013 ?auto_34010 ) ) ( not ( = ?auto_34017 ?auto_34010 ) ) ( AVAILABLE ?auto_34010 ) ( SURFACE-AT ?auto_34007 ?auto_34016 ) ( ON ?auto_34007 ?auto_34012 ) ( CLEAR ?auto_34007 ) ( not ( = ?auto_34007 ?auto_34012 ) ) ( not ( = ?auto_34008 ?auto_34012 ) ) ( not ( = ?auto_34006 ?auto_34012 ) ) ( not ( = ?auto_34011 ?auto_34012 ) ) ( SURFACE-AT ?auto_34005 ?auto_34009 ) ( CLEAR ?auto_34005 ) ( IS-CRATE ?auto_34006 ) ( not ( = ?auto_34005 ?auto_34006 ) ) ( not ( = ?auto_34007 ?auto_34005 ) ) ( not ( = ?auto_34008 ?auto_34005 ) ) ( not ( = ?auto_34011 ?auto_34005 ) ) ( not ( = ?auto_34012 ?auto_34005 ) ) ( AVAILABLE ?auto_34013 ) ( IN ?auto_34006 ?auto_34015 ) ( TRUCK-AT ?auto_34015 ?auto_34014 ) ( not ( = ?auto_34014 ?auto_34009 ) ) ( not ( = ?auto_34018 ?auto_34014 ) ) ( not ( = ?auto_34016 ?auto_34014 ) ) ( ON ?auto_34005 ?auto_34004 ) ( not ( = ?auto_34004 ?auto_34005 ) ) ( not ( = ?auto_34004 ?auto_34006 ) ) ( not ( = ?auto_34004 ?auto_34007 ) ) ( not ( = ?auto_34004 ?auto_34008 ) ) ( not ( = ?auto_34004 ?auto_34011 ) ) ( not ( = ?auto_34004 ?auto_34012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34006 ?auto_34007 ?auto_34008 )
      ( MAKE-4CRATE-VERIFY ?auto_34004 ?auto_34005 ?auto_34006 ?auto_34007 ?auto_34008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34019 - SURFACE
      ?auto_34020 - SURFACE
    )
    :vars
    (
      ?auto_34027 - HOIST
      ?auto_34021 - PLACE
      ?auto_34023 - SURFACE
      ?auto_34032 - PLACE
      ?auto_34031 - HOIST
      ?auto_34025 - SURFACE
      ?auto_34030 - PLACE
      ?auto_34024 - HOIST
      ?auto_34026 - SURFACE
      ?auto_34022 - SURFACE
      ?auto_34029 - TRUCK
      ?auto_34028 - PLACE
      ?auto_34033 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34027 ?auto_34021 ) ( IS-CRATE ?auto_34020 ) ( not ( = ?auto_34019 ?auto_34020 ) ) ( not ( = ?auto_34023 ?auto_34019 ) ) ( not ( = ?auto_34023 ?auto_34020 ) ) ( not ( = ?auto_34032 ?auto_34021 ) ) ( HOIST-AT ?auto_34031 ?auto_34032 ) ( not ( = ?auto_34027 ?auto_34031 ) ) ( AVAILABLE ?auto_34031 ) ( SURFACE-AT ?auto_34020 ?auto_34032 ) ( ON ?auto_34020 ?auto_34025 ) ( CLEAR ?auto_34020 ) ( not ( = ?auto_34019 ?auto_34025 ) ) ( not ( = ?auto_34020 ?auto_34025 ) ) ( not ( = ?auto_34023 ?auto_34025 ) ) ( IS-CRATE ?auto_34019 ) ( not ( = ?auto_34030 ?auto_34021 ) ) ( not ( = ?auto_34032 ?auto_34030 ) ) ( HOIST-AT ?auto_34024 ?auto_34030 ) ( not ( = ?auto_34027 ?auto_34024 ) ) ( not ( = ?auto_34031 ?auto_34024 ) ) ( AVAILABLE ?auto_34024 ) ( SURFACE-AT ?auto_34019 ?auto_34030 ) ( ON ?auto_34019 ?auto_34026 ) ( CLEAR ?auto_34019 ) ( not ( = ?auto_34019 ?auto_34026 ) ) ( not ( = ?auto_34020 ?auto_34026 ) ) ( not ( = ?auto_34023 ?auto_34026 ) ) ( not ( = ?auto_34025 ?auto_34026 ) ) ( SURFACE-AT ?auto_34022 ?auto_34021 ) ( CLEAR ?auto_34022 ) ( IS-CRATE ?auto_34023 ) ( not ( = ?auto_34022 ?auto_34023 ) ) ( not ( = ?auto_34019 ?auto_34022 ) ) ( not ( = ?auto_34020 ?auto_34022 ) ) ( not ( = ?auto_34025 ?auto_34022 ) ) ( not ( = ?auto_34026 ?auto_34022 ) ) ( AVAILABLE ?auto_34027 ) ( TRUCK-AT ?auto_34029 ?auto_34028 ) ( not ( = ?auto_34028 ?auto_34021 ) ) ( not ( = ?auto_34032 ?auto_34028 ) ) ( not ( = ?auto_34030 ?auto_34028 ) ) ( HOIST-AT ?auto_34033 ?auto_34028 ) ( LIFTING ?auto_34033 ?auto_34023 ) ( not ( = ?auto_34027 ?auto_34033 ) ) ( not ( = ?auto_34031 ?auto_34033 ) ) ( not ( = ?auto_34024 ?auto_34033 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34033 ?auto_34023 ?auto_34029 ?auto_34028 )
      ( MAKE-2CRATE ?auto_34023 ?auto_34019 ?auto_34020 )
      ( MAKE-1CRATE-VERIFY ?auto_34019 ?auto_34020 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34034 - SURFACE
      ?auto_34035 - SURFACE
      ?auto_34036 - SURFACE
    )
    :vars
    (
      ?auto_34041 - HOIST
      ?auto_34044 - PLACE
      ?auto_34037 - PLACE
      ?auto_34046 - HOIST
      ?auto_34048 - SURFACE
      ?auto_34038 - PLACE
      ?auto_34045 - HOIST
      ?auto_34040 - SURFACE
      ?auto_34043 - SURFACE
      ?auto_34039 - TRUCK
      ?auto_34042 - PLACE
      ?auto_34047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34041 ?auto_34044 ) ( IS-CRATE ?auto_34036 ) ( not ( = ?auto_34035 ?auto_34036 ) ) ( not ( = ?auto_34034 ?auto_34035 ) ) ( not ( = ?auto_34034 ?auto_34036 ) ) ( not ( = ?auto_34037 ?auto_34044 ) ) ( HOIST-AT ?auto_34046 ?auto_34037 ) ( not ( = ?auto_34041 ?auto_34046 ) ) ( AVAILABLE ?auto_34046 ) ( SURFACE-AT ?auto_34036 ?auto_34037 ) ( ON ?auto_34036 ?auto_34048 ) ( CLEAR ?auto_34036 ) ( not ( = ?auto_34035 ?auto_34048 ) ) ( not ( = ?auto_34036 ?auto_34048 ) ) ( not ( = ?auto_34034 ?auto_34048 ) ) ( IS-CRATE ?auto_34035 ) ( not ( = ?auto_34038 ?auto_34044 ) ) ( not ( = ?auto_34037 ?auto_34038 ) ) ( HOIST-AT ?auto_34045 ?auto_34038 ) ( not ( = ?auto_34041 ?auto_34045 ) ) ( not ( = ?auto_34046 ?auto_34045 ) ) ( AVAILABLE ?auto_34045 ) ( SURFACE-AT ?auto_34035 ?auto_34038 ) ( ON ?auto_34035 ?auto_34040 ) ( CLEAR ?auto_34035 ) ( not ( = ?auto_34035 ?auto_34040 ) ) ( not ( = ?auto_34036 ?auto_34040 ) ) ( not ( = ?auto_34034 ?auto_34040 ) ) ( not ( = ?auto_34048 ?auto_34040 ) ) ( SURFACE-AT ?auto_34043 ?auto_34044 ) ( CLEAR ?auto_34043 ) ( IS-CRATE ?auto_34034 ) ( not ( = ?auto_34043 ?auto_34034 ) ) ( not ( = ?auto_34035 ?auto_34043 ) ) ( not ( = ?auto_34036 ?auto_34043 ) ) ( not ( = ?auto_34048 ?auto_34043 ) ) ( not ( = ?auto_34040 ?auto_34043 ) ) ( AVAILABLE ?auto_34041 ) ( TRUCK-AT ?auto_34039 ?auto_34042 ) ( not ( = ?auto_34042 ?auto_34044 ) ) ( not ( = ?auto_34037 ?auto_34042 ) ) ( not ( = ?auto_34038 ?auto_34042 ) ) ( HOIST-AT ?auto_34047 ?auto_34042 ) ( LIFTING ?auto_34047 ?auto_34034 ) ( not ( = ?auto_34041 ?auto_34047 ) ) ( not ( = ?auto_34046 ?auto_34047 ) ) ( not ( = ?auto_34045 ?auto_34047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34035 ?auto_34036 )
      ( MAKE-2CRATE-VERIFY ?auto_34034 ?auto_34035 ?auto_34036 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34049 - SURFACE
      ?auto_34050 - SURFACE
      ?auto_34051 - SURFACE
      ?auto_34052 - SURFACE
    )
    :vars
    (
      ?auto_34060 - HOIST
      ?auto_34061 - PLACE
      ?auto_34062 - PLACE
      ?auto_34054 - HOIST
      ?auto_34053 - SURFACE
      ?auto_34057 - PLACE
      ?auto_34058 - HOIST
      ?auto_34056 - SURFACE
      ?auto_34059 - TRUCK
      ?auto_34063 - PLACE
      ?auto_34055 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34060 ?auto_34061 ) ( IS-CRATE ?auto_34052 ) ( not ( = ?auto_34051 ?auto_34052 ) ) ( not ( = ?auto_34050 ?auto_34051 ) ) ( not ( = ?auto_34050 ?auto_34052 ) ) ( not ( = ?auto_34062 ?auto_34061 ) ) ( HOIST-AT ?auto_34054 ?auto_34062 ) ( not ( = ?auto_34060 ?auto_34054 ) ) ( AVAILABLE ?auto_34054 ) ( SURFACE-AT ?auto_34052 ?auto_34062 ) ( ON ?auto_34052 ?auto_34053 ) ( CLEAR ?auto_34052 ) ( not ( = ?auto_34051 ?auto_34053 ) ) ( not ( = ?auto_34052 ?auto_34053 ) ) ( not ( = ?auto_34050 ?auto_34053 ) ) ( IS-CRATE ?auto_34051 ) ( not ( = ?auto_34057 ?auto_34061 ) ) ( not ( = ?auto_34062 ?auto_34057 ) ) ( HOIST-AT ?auto_34058 ?auto_34057 ) ( not ( = ?auto_34060 ?auto_34058 ) ) ( not ( = ?auto_34054 ?auto_34058 ) ) ( AVAILABLE ?auto_34058 ) ( SURFACE-AT ?auto_34051 ?auto_34057 ) ( ON ?auto_34051 ?auto_34056 ) ( CLEAR ?auto_34051 ) ( not ( = ?auto_34051 ?auto_34056 ) ) ( not ( = ?auto_34052 ?auto_34056 ) ) ( not ( = ?auto_34050 ?auto_34056 ) ) ( not ( = ?auto_34053 ?auto_34056 ) ) ( SURFACE-AT ?auto_34049 ?auto_34061 ) ( CLEAR ?auto_34049 ) ( IS-CRATE ?auto_34050 ) ( not ( = ?auto_34049 ?auto_34050 ) ) ( not ( = ?auto_34051 ?auto_34049 ) ) ( not ( = ?auto_34052 ?auto_34049 ) ) ( not ( = ?auto_34053 ?auto_34049 ) ) ( not ( = ?auto_34056 ?auto_34049 ) ) ( AVAILABLE ?auto_34060 ) ( TRUCK-AT ?auto_34059 ?auto_34063 ) ( not ( = ?auto_34063 ?auto_34061 ) ) ( not ( = ?auto_34062 ?auto_34063 ) ) ( not ( = ?auto_34057 ?auto_34063 ) ) ( HOIST-AT ?auto_34055 ?auto_34063 ) ( LIFTING ?auto_34055 ?auto_34050 ) ( not ( = ?auto_34060 ?auto_34055 ) ) ( not ( = ?auto_34054 ?auto_34055 ) ) ( not ( = ?auto_34058 ?auto_34055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34050 ?auto_34051 ?auto_34052 )
      ( MAKE-3CRATE-VERIFY ?auto_34049 ?auto_34050 ?auto_34051 ?auto_34052 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34064 - SURFACE
      ?auto_34065 - SURFACE
      ?auto_34066 - SURFACE
      ?auto_34067 - SURFACE
      ?auto_34068 - SURFACE
    )
    :vars
    (
      ?auto_34076 - HOIST
      ?auto_34077 - PLACE
      ?auto_34078 - PLACE
      ?auto_34070 - HOIST
      ?auto_34069 - SURFACE
      ?auto_34073 - PLACE
      ?auto_34074 - HOIST
      ?auto_34072 - SURFACE
      ?auto_34075 - TRUCK
      ?auto_34079 - PLACE
      ?auto_34071 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34076 ?auto_34077 ) ( IS-CRATE ?auto_34068 ) ( not ( = ?auto_34067 ?auto_34068 ) ) ( not ( = ?auto_34066 ?auto_34067 ) ) ( not ( = ?auto_34066 ?auto_34068 ) ) ( not ( = ?auto_34078 ?auto_34077 ) ) ( HOIST-AT ?auto_34070 ?auto_34078 ) ( not ( = ?auto_34076 ?auto_34070 ) ) ( AVAILABLE ?auto_34070 ) ( SURFACE-AT ?auto_34068 ?auto_34078 ) ( ON ?auto_34068 ?auto_34069 ) ( CLEAR ?auto_34068 ) ( not ( = ?auto_34067 ?auto_34069 ) ) ( not ( = ?auto_34068 ?auto_34069 ) ) ( not ( = ?auto_34066 ?auto_34069 ) ) ( IS-CRATE ?auto_34067 ) ( not ( = ?auto_34073 ?auto_34077 ) ) ( not ( = ?auto_34078 ?auto_34073 ) ) ( HOIST-AT ?auto_34074 ?auto_34073 ) ( not ( = ?auto_34076 ?auto_34074 ) ) ( not ( = ?auto_34070 ?auto_34074 ) ) ( AVAILABLE ?auto_34074 ) ( SURFACE-AT ?auto_34067 ?auto_34073 ) ( ON ?auto_34067 ?auto_34072 ) ( CLEAR ?auto_34067 ) ( not ( = ?auto_34067 ?auto_34072 ) ) ( not ( = ?auto_34068 ?auto_34072 ) ) ( not ( = ?auto_34066 ?auto_34072 ) ) ( not ( = ?auto_34069 ?auto_34072 ) ) ( SURFACE-AT ?auto_34065 ?auto_34077 ) ( CLEAR ?auto_34065 ) ( IS-CRATE ?auto_34066 ) ( not ( = ?auto_34065 ?auto_34066 ) ) ( not ( = ?auto_34067 ?auto_34065 ) ) ( not ( = ?auto_34068 ?auto_34065 ) ) ( not ( = ?auto_34069 ?auto_34065 ) ) ( not ( = ?auto_34072 ?auto_34065 ) ) ( AVAILABLE ?auto_34076 ) ( TRUCK-AT ?auto_34075 ?auto_34079 ) ( not ( = ?auto_34079 ?auto_34077 ) ) ( not ( = ?auto_34078 ?auto_34079 ) ) ( not ( = ?auto_34073 ?auto_34079 ) ) ( HOIST-AT ?auto_34071 ?auto_34079 ) ( LIFTING ?auto_34071 ?auto_34066 ) ( not ( = ?auto_34076 ?auto_34071 ) ) ( not ( = ?auto_34070 ?auto_34071 ) ) ( not ( = ?auto_34074 ?auto_34071 ) ) ( ON ?auto_34065 ?auto_34064 ) ( not ( = ?auto_34064 ?auto_34065 ) ) ( not ( = ?auto_34064 ?auto_34066 ) ) ( not ( = ?auto_34064 ?auto_34067 ) ) ( not ( = ?auto_34064 ?auto_34068 ) ) ( not ( = ?auto_34064 ?auto_34069 ) ) ( not ( = ?auto_34064 ?auto_34072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34066 ?auto_34067 ?auto_34068 )
      ( MAKE-4CRATE-VERIFY ?auto_34064 ?auto_34065 ?auto_34066 ?auto_34067 ?auto_34068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34080 - SURFACE
      ?auto_34081 - SURFACE
    )
    :vars
    (
      ?auto_34091 - HOIST
      ?auto_34092 - PLACE
      ?auto_34085 - SURFACE
      ?auto_34093 - PLACE
      ?auto_34083 - HOIST
      ?auto_34082 - SURFACE
      ?auto_34087 - PLACE
      ?auto_34088 - HOIST
      ?auto_34086 - SURFACE
      ?auto_34090 - SURFACE
      ?auto_34089 - TRUCK
      ?auto_34094 - PLACE
      ?auto_34084 - HOIST
      ?auto_34095 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34091 ?auto_34092 ) ( IS-CRATE ?auto_34081 ) ( not ( = ?auto_34080 ?auto_34081 ) ) ( not ( = ?auto_34085 ?auto_34080 ) ) ( not ( = ?auto_34085 ?auto_34081 ) ) ( not ( = ?auto_34093 ?auto_34092 ) ) ( HOIST-AT ?auto_34083 ?auto_34093 ) ( not ( = ?auto_34091 ?auto_34083 ) ) ( AVAILABLE ?auto_34083 ) ( SURFACE-AT ?auto_34081 ?auto_34093 ) ( ON ?auto_34081 ?auto_34082 ) ( CLEAR ?auto_34081 ) ( not ( = ?auto_34080 ?auto_34082 ) ) ( not ( = ?auto_34081 ?auto_34082 ) ) ( not ( = ?auto_34085 ?auto_34082 ) ) ( IS-CRATE ?auto_34080 ) ( not ( = ?auto_34087 ?auto_34092 ) ) ( not ( = ?auto_34093 ?auto_34087 ) ) ( HOIST-AT ?auto_34088 ?auto_34087 ) ( not ( = ?auto_34091 ?auto_34088 ) ) ( not ( = ?auto_34083 ?auto_34088 ) ) ( AVAILABLE ?auto_34088 ) ( SURFACE-AT ?auto_34080 ?auto_34087 ) ( ON ?auto_34080 ?auto_34086 ) ( CLEAR ?auto_34080 ) ( not ( = ?auto_34080 ?auto_34086 ) ) ( not ( = ?auto_34081 ?auto_34086 ) ) ( not ( = ?auto_34085 ?auto_34086 ) ) ( not ( = ?auto_34082 ?auto_34086 ) ) ( SURFACE-AT ?auto_34090 ?auto_34092 ) ( CLEAR ?auto_34090 ) ( IS-CRATE ?auto_34085 ) ( not ( = ?auto_34090 ?auto_34085 ) ) ( not ( = ?auto_34080 ?auto_34090 ) ) ( not ( = ?auto_34081 ?auto_34090 ) ) ( not ( = ?auto_34082 ?auto_34090 ) ) ( not ( = ?auto_34086 ?auto_34090 ) ) ( AVAILABLE ?auto_34091 ) ( TRUCK-AT ?auto_34089 ?auto_34094 ) ( not ( = ?auto_34094 ?auto_34092 ) ) ( not ( = ?auto_34093 ?auto_34094 ) ) ( not ( = ?auto_34087 ?auto_34094 ) ) ( HOIST-AT ?auto_34084 ?auto_34094 ) ( not ( = ?auto_34091 ?auto_34084 ) ) ( not ( = ?auto_34083 ?auto_34084 ) ) ( not ( = ?auto_34088 ?auto_34084 ) ) ( AVAILABLE ?auto_34084 ) ( SURFACE-AT ?auto_34085 ?auto_34094 ) ( ON ?auto_34085 ?auto_34095 ) ( CLEAR ?auto_34085 ) ( not ( = ?auto_34080 ?auto_34095 ) ) ( not ( = ?auto_34081 ?auto_34095 ) ) ( not ( = ?auto_34085 ?auto_34095 ) ) ( not ( = ?auto_34082 ?auto_34095 ) ) ( not ( = ?auto_34086 ?auto_34095 ) ) ( not ( = ?auto_34090 ?auto_34095 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34084 ?auto_34085 ?auto_34095 ?auto_34094 )
      ( MAKE-2CRATE ?auto_34085 ?auto_34080 ?auto_34081 )
      ( MAKE-1CRATE-VERIFY ?auto_34080 ?auto_34081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34096 - SURFACE
      ?auto_34097 - SURFACE
      ?auto_34098 - SURFACE
    )
    :vars
    (
      ?auto_34105 - HOIST
      ?auto_34111 - PLACE
      ?auto_34101 - PLACE
      ?auto_34106 - HOIST
      ?auto_34107 - SURFACE
      ?auto_34099 - PLACE
      ?auto_34100 - HOIST
      ?auto_34103 - SURFACE
      ?auto_34110 - SURFACE
      ?auto_34102 - TRUCK
      ?auto_34104 - PLACE
      ?auto_34108 - HOIST
      ?auto_34109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34105 ?auto_34111 ) ( IS-CRATE ?auto_34098 ) ( not ( = ?auto_34097 ?auto_34098 ) ) ( not ( = ?auto_34096 ?auto_34097 ) ) ( not ( = ?auto_34096 ?auto_34098 ) ) ( not ( = ?auto_34101 ?auto_34111 ) ) ( HOIST-AT ?auto_34106 ?auto_34101 ) ( not ( = ?auto_34105 ?auto_34106 ) ) ( AVAILABLE ?auto_34106 ) ( SURFACE-AT ?auto_34098 ?auto_34101 ) ( ON ?auto_34098 ?auto_34107 ) ( CLEAR ?auto_34098 ) ( not ( = ?auto_34097 ?auto_34107 ) ) ( not ( = ?auto_34098 ?auto_34107 ) ) ( not ( = ?auto_34096 ?auto_34107 ) ) ( IS-CRATE ?auto_34097 ) ( not ( = ?auto_34099 ?auto_34111 ) ) ( not ( = ?auto_34101 ?auto_34099 ) ) ( HOIST-AT ?auto_34100 ?auto_34099 ) ( not ( = ?auto_34105 ?auto_34100 ) ) ( not ( = ?auto_34106 ?auto_34100 ) ) ( AVAILABLE ?auto_34100 ) ( SURFACE-AT ?auto_34097 ?auto_34099 ) ( ON ?auto_34097 ?auto_34103 ) ( CLEAR ?auto_34097 ) ( not ( = ?auto_34097 ?auto_34103 ) ) ( not ( = ?auto_34098 ?auto_34103 ) ) ( not ( = ?auto_34096 ?auto_34103 ) ) ( not ( = ?auto_34107 ?auto_34103 ) ) ( SURFACE-AT ?auto_34110 ?auto_34111 ) ( CLEAR ?auto_34110 ) ( IS-CRATE ?auto_34096 ) ( not ( = ?auto_34110 ?auto_34096 ) ) ( not ( = ?auto_34097 ?auto_34110 ) ) ( not ( = ?auto_34098 ?auto_34110 ) ) ( not ( = ?auto_34107 ?auto_34110 ) ) ( not ( = ?auto_34103 ?auto_34110 ) ) ( AVAILABLE ?auto_34105 ) ( TRUCK-AT ?auto_34102 ?auto_34104 ) ( not ( = ?auto_34104 ?auto_34111 ) ) ( not ( = ?auto_34101 ?auto_34104 ) ) ( not ( = ?auto_34099 ?auto_34104 ) ) ( HOIST-AT ?auto_34108 ?auto_34104 ) ( not ( = ?auto_34105 ?auto_34108 ) ) ( not ( = ?auto_34106 ?auto_34108 ) ) ( not ( = ?auto_34100 ?auto_34108 ) ) ( AVAILABLE ?auto_34108 ) ( SURFACE-AT ?auto_34096 ?auto_34104 ) ( ON ?auto_34096 ?auto_34109 ) ( CLEAR ?auto_34096 ) ( not ( = ?auto_34097 ?auto_34109 ) ) ( not ( = ?auto_34098 ?auto_34109 ) ) ( not ( = ?auto_34096 ?auto_34109 ) ) ( not ( = ?auto_34107 ?auto_34109 ) ) ( not ( = ?auto_34103 ?auto_34109 ) ) ( not ( = ?auto_34110 ?auto_34109 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34097 ?auto_34098 )
      ( MAKE-2CRATE-VERIFY ?auto_34096 ?auto_34097 ?auto_34098 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34112 - SURFACE
      ?auto_34113 - SURFACE
      ?auto_34114 - SURFACE
      ?auto_34115 - SURFACE
    )
    :vars
    (
      ?auto_34125 - HOIST
      ?auto_34126 - PLACE
      ?auto_34116 - PLACE
      ?auto_34118 - HOIST
      ?auto_34124 - SURFACE
      ?auto_34121 - PLACE
      ?auto_34123 - HOIST
      ?auto_34122 - SURFACE
      ?auto_34119 - TRUCK
      ?auto_34120 - PLACE
      ?auto_34127 - HOIST
      ?auto_34117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34125 ?auto_34126 ) ( IS-CRATE ?auto_34115 ) ( not ( = ?auto_34114 ?auto_34115 ) ) ( not ( = ?auto_34113 ?auto_34114 ) ) ( not ( = ?auto_34113 ?auto_34115 ) ) ( not ( = ?auto_34116 ?auto_34126 ) ) ( HOIST-AT ?auto_34118 ?auto_34116 ) ( not ( = ?auto_34125 ?auto_34118 ) ) ( AVAILABLE ?auto_34118 ) ( SURFACE-AT ?auto_34115 ?auto_34116 ) ( ON ?auto_34115 ?auto_34124 ) ( CLEAR ?auto_34115 ) ( not ( = ?auto_34114 ?auto_34124 ) ) ( not ( = ?auto_34115 ?auto_34124 ) ) ( not ( = ?auto_34113 ?auto_34124 ) ) ( IS-CRATE ?auto_34114 ) ( not ( = ?auto_34121 ?auto_34126 ) ) ( not ( = ?auto_34116 ?auto_34121 ) ) ( HOIST-AT ?auto_34123 ?auto_34121 ) ( not ( = ?auto_34125 ?auto_34123 ) ) ( not ( = ?auto_34118 ?auto_34123 ) ) ( AVAILABLE ?auto_34123 ) ( SURFACE-AT ?auto_34114 ?auto_34121 ) ( ON ?auto_34114 ?auto_34122 ) ( CLEAR ?auto_34114 ) ( not ( = ?auto_34114 ?auto_34122 ) ) ( not ( = ?auto_34115 ?auto_34122 ) ) ( not ( = ?auto_34113 ?auto_34122 ) ) ( not ( = ?auto_34124 ?auto_34122 ) ) ( SURFACE-AT ?auto_34112 ?auto_34126 ) ( CLEAR ?auto_34112 ) ( IS-CRATE ?auto_34113 ) ( not ( = ?auto_34112 ?auto_34113 ) ) ( not ( = ?auto_34114 ?auto_34112 ) ) ( not ( = ?auto_34115 ?auto_34112 ) ) ( not ( = ?auto_34124 ?auto_34112 ) ) ( not ( = ?auto_34122 ?auto_34112 ) ) ( AVAILABLE ?auto_34125 ) ( TRUCK-AT ?auto_34119 ?auto_34120 ) ( not ( = ?auto_34120 ?auto_34126 ) ) ( not ( = ?auto_34116 ?auto_34120 ) ) ( not ( = ?auto_34121 ?auto_34120 ) ) ( HOIST-AT ?auto_34127 ?auto_34120 ) ( not ( = ?auto_34125 ?auto_34127 ) ) ( not ( = ?auto_34118 ?auto_34127 ) ) ( not ( = ?auto_34123 ?auto_34127 ) ) ( AVAILABLE ?auto_34127 ) ( SURFACE-AT ?auto_34113 ?auto_34120 ) ( ON ?auto_34113 ?auto_34117 ) ( CLEAR ?auto_34113 ) ( not ( = ?auto_34114 ?auto_34117 ) ) ( not ( = ?auto_34115 ?auto_34117 ) ) ( not ( = ?auto_34113 ?auto_34117 ) ) ( not ( = ?auto_34124 ?auto_34117 ) ) ( not ( = ?auto_34122 ?auto_34117 ) ) ( not ( = ?auto_34112 ?auto_34117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34113 ?auto_34114 ?auto_34115 )
      ( MAKE-3CRATE-VERIFY ?auto_34112 ?auto_34113 ?auto_34114 ?auto_34115 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34128 - SURFACE
      ?auto_34129 - SURFACE
      ?auto_34130 - SURFACE
      ?auto_34131 - SURFACE
      ?auto_34132 - SURFACE
    )
    :vars
    (
      ?auto_34142 - HOIST
      ?auto_34143 - PLACE
      ?auto_34133 - PLACE
      ?auto_34135 - HOIST
      ?auto_34141 - SURFACE
      ?auto_34138 - PLACE
      ?auto_34140 - HOIST
      ?auto_34139 - SURFACE
      ?auto_34136 - TRUCK
      ?auto_34137 - PLACE
      ?auto_34144 - HOIST
      ?auto_34134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34142 ?auto_34143 ) ( IS-CRATE ?auto_34132 ) ( not ( = ?auto_34131 ?auto_34132 ) ) ( not ( = ?auto_34130 ?auto_34131 ) ) ( not ( = ?auto_34130 ?auto_34132 ) ) ( not ( = ?auto_34133 ?auto_34143 ) ) ( HOIST-AT ?auto_34135 ?auto_34133 ) ( not ( = ?auto_34142 ?auto_34135 ) ) ( AVAILABLE ?auto_34135 ) ( SURFACE-AT ?auto_34132 ?auto_34133 ) ( ON ?auto_34132 ?auto_34141 ) ( CLEAR ?auto_34132 ) ( not ( = ?auto_34131 ?auto_34141 ) ) ( not ( = ?auto_34132 ?auto_34141 ) ) ( not ( = ?auto_34130 ?auto_34141 ) ) ( IS-CRATE ?auto_34131 ) ( not ( = ?auto_34138 ?auto_34143 ) ) ( not ( = ?auto_34133 ?auto_34138 ) ) ( HOIST-AT ?auto_34140 ?auto_34138 ) ( not ( = ?auto_34142 ?auto_34140 ) ) ( not ( = ?auto_34135 ?auto_34140 ) ) ( AVAILABLE ?auto_34140 ) ( SURFACE-AT ?auto_34131 ?auto_34138 ) ( ON ?auto_34131 ?auto_34139 ) ( CLEAR ?auto_34131 ) ( not ( = ?auto_34131 ?auto_34139 ) ) ( not ( = ?auto_34132 ?auto_34139 ) ) ( not ( = ?auto_34130 ?auto_34139 ) ) ( not ( = ?auto_34141 ?auto_34139 ) ) ( SURFACE-AT ?auto_34129 ?auto_34143 ) ( CLEAR ?auto_34129 ) ( IS-CRATE ?auto_34130 ) ( not ( = ?auto_34129 ?auto_34130 ) ) ( not ( = ?auto_34131 ?auto_34129 ) ) ( not ( = ?auto_34132 ?auto_34129 ) ) ( not ( = ?auto_34141 ?auto_34129 ) ) ( not ( = ?auto_34139 ?auto_34129 ) ) ( AVAILABLE ?auto_34142 ) ( TRUCK-AT ?auto_34136 ?auto_34137 ) ( not ( = ?auto_34137 ?auto_34143 ) ) ( not ( = ?auto_34133 ?auto_34137 ) ) ( not ( = ?auto_34138 ?auto_34137 ) ) ( HOIST-AT ?auto_34144 ?auto_34137 ) ( not ( = ?auto_34142 ?auto_34144 ) ) ( not ( = ?auto_34135 ?auto_34144 ) ) ( not ( = ?auto_34140 ?auto_34144 ) ) ( AVAILABLE ?auto_34144 ) ( SURFACE-AT ?auto_34130 ?auto_34137 ) ( ON ?auto_34130 ?auto_34134 ) ( CLEAR ?auto_34130 ) ( not ( = ?auto_34131 ?auto_34134 ) ) ( not ( = ?auto_34132 ?auto_34134 ) ) ( not ( = ?auto_34130 ?auto_34134 ) ) ( not ( = ?auto_34141 ?auto_34134 ) ) ( not ( = ?auto_34139 ?auto_34134 ) ) ( not ( = ?auto_34129 ?auto_34134 ) ) ( ON ?auto_34129 ?auto_34128 ) ( not ( = ?auto_34128 ?auto_34129 ) ) ( not ( = ?auto_34128 ?auto_34130 ) ) ( not ( = ?auto_34128 ?auto_34131 ) ) ( not ( = ?auto_34128 ?auto_34132 ) ) ( not ( = ?auto_34128 ?auto_34141 ) ) ( not ( = ?auto_34128 ?auto_34139 ) ) ( not ( = ?auto_34128 ?auto_34134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34130 ?auto_34131 ?auto_34132 )
      ( MAKE-4CRATE-VERIFY ?auto_34128 ?auto_34129 ?auto_34130 ?auto_34131 ?auto_34132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34145 - SURFACE
      ?auto_34146 - SURFACE
    )
    :vars
    (
      ?auto_34158 - HOIST
      ?auto_34159 - PLACE
      ?auto_34155 - SURFACE
      ?auto_34147 - PLACE
      ?auto_34149 - HOIST
      ?auto_34157 - SURFACE
      ?auto_34152 - PLACE
      ?auto_34156 - HOIST
      ?auto_34153 - SURFACE
      ?auto_34154 - SURFACE
      ?auto_34151 - PLACE
      ?auto_34160 - HOIST
      ?auto_34148 - SURFACE
      ?auto_34150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34158 ?auto_34159 ) ( IS-CRATE ?auto_34146 ) ( not ( = ?auto_34145 ?auto_34146 ) ) ( not ( = ?auto_34155 ?auto_34145 ) ) ( not ( = ?auto_34155 ?auto_34146 ) ) ( not ( = ?auto_34147 ?auto_34159 ) ) ( HOIST-AT ?auto_34149 ?auto_34147 ) ( not ( = ?auto_34158 ?auto_34149 ) ) ( AVAILABLE ?auto_34149 ) ( SURFACE-AT ?auto_34146 ?auto_34147 ) ( ON ?auto_34146 ?auto_34157 ) ( CLEAR ?auto_34146 ) ( not ( = ?auto_34145 ?auto_34157 ) ) ( not ( = ?auto_34146 ?auto_34157 ) ) ( not ( = ?auto_34155 ?auto_34157 ) ) ( IS-CRATE ?auto_34145 ) ( not ( = ?auto_34152 ?auto_34159 ) ) ( not ( = ?auto_34147 ?auto_34152 ) ) ( HOIST-AT ?auto_34156 ?auto_34152 ) ( not ( = ?auto_34158 ?auto_34156 ) ) ( not ( = ?auto_34149 ?auto_34156 ) ) ( AVAILABLE ?auto_34156 ) ( SURFACE-AT ?auto_34145 ?auto_34152 ) ( ON ?auto_34145 ?auto_34153 ) ( CLEAR ?auto_34145 ) ( not ( = ?auto_34145 ?auto_34153 ) ) ( not ( = ?auto_34146 ?auto_34153 ) ) ( not ( = ?auto_34155 ?auto_34153 ) ) ( not ( = ?auto_34157 ?auto_34153 ) ) ( SURFACE-AT ?auto_34154 ?auto_34159 ) ( CLEAR ?auto_34154 ) ( IS-CRATE ?auto_34155 ) ( not ( = ?auto_34154 ?auto_34155 ) ) ( not ( = ?auto_34145 ?auto_34154 ) ) ( not ( = ?auto_34146 ?auto_34154 ) ) ( not ( = ?auto_34157 ?auto_34154 ) ) ( not ( = ?auto_34153 ?auto_34154 ) ) ( AVAILABLE ?auto_34158 ) ( not ( = ?auto_34151 ?auto_34159 ) ) ( not ( = ?auto_34147 ?auto_34151 ) ) ( not ( = ?auto_34152 ?auto_34151 ) ) ( HOIST-AT ?auto_34160 ?auto_34151 ) ( not ( = ?auto_34158 ?auto_34160 ) ) ( not ( = ?auto_34149 ?auto_34160 ) ) ( not ( = ?auto_34156 ?auto_34160 ) ) ( AVAILABLE ?auto_34160 ) ( SURFACE-AT ?auto_34155 ?auto_34151 ) ( ON ?auto_34155 ?auto_34148 ) ( CLEAR ?auto_34155 ) ( not ( = ?auto_34145 ?auto_34148 ) ) ( not ( = ?auto_34146 ?auto_34148 ) ) ( not ( = ?auto_34155 ?auto_34148 ) ) ( not ( = ?auto_34157 ?auto_34148 ) ) ( not ( = ?auto_34153 ?auto_34148 ) ) ( not ( = ?auto_34154 ?auto_34148 ) ) ( TRUCK-AT ?auto_34150 ?auto_34159 ) )
    :subtasks
    ( ( !DRIVE ?auto_34150 ?auto_34159 ?auto_34151 )
      ( MAKE-2CRATE ?auto_34155 ?auto_34145 ?auto_34146 )
      ( MAKE-1CRATE-VERIFY ?auto_34145 ?auto_34146 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34161 - SURFACE
      ?auto_34162 - SURFACE
      ?auto_34163 - SURFACE
    )
    :vars
    (
      ?auto_34165 - HOIST
      ?auto_34170 - PLACE
      ?auto_34176 - PLACE
      ?auto_34172 - HOIST
      ?auto_34174 - SURFACE
      ?auto_34175 - PLACE
      ?auto_34173 - HOIST
      ?auto_34167 - SURFACE
      ?auto_34164 - SURFACE
      ?auto_34171 - PLACE
      ?auto_34169 - HOIST
      ?auto_34168 - SURFACE
      ?auto_34166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34165 ?auto_34170 ) ( IS-CRATE ?auto_34163 ) ( not ( = ?auto_34162 ?auto_34163 ) ) ( not ( = ?auto_34161 ?auto_34162 ) ) ( not ( = ?auto_34161 ?auto_34163 ) ) ( not ( = ?auto_34176 ?auto_34170 ) ) ( HOIST-AT ?auto_34172 ?auto_34176 ) ( not ( = ?auto_34165 ?auto_34172 ) ) ( AVAILABLE ?auto_34172 ) ( SURFACE-AT ?auto_34163 ?auto_34176 ) ( ON ?auto_34163 ?auto_34174 ) ( CLEAR ?auto_34163 ) ( not ( = ?auto_34162 ?auto_34174 ) ) ( not ( = ?auto_34163 ?auto_34174 ) ) ( not ( = ?auto_34161 ?auto_34174 ) ) ( IS-CRATE ?auto_34162 ) ( not ( = ?auto_34175 ?auto_34170 ) ) ( not ( = ?auto_34176 ?auto_34175 ) ) ( HOIST-AT ?auto_34173 ?auto_34175 ) ( not ( = ?auto_34165 ?auto_34173 ) ) ( not ( = ?auto_34172 ?auto_34173 ) ) ( AVAILABLE ?auto_34173 ) ( SURFACE-AT ?auto_34162 ?auto_34175 ) ( ON ?auto_34162 ?auto_34167 ) ( CLEAR ?auto_34162 ) ( not ( = ?auto_34162 ?auto_34167 ) ) ( not ( = ?auto_34163 ?auto_34167 ) ) ( not ( = ?auto_34161 ?auto_34167 ) ) ( not ( = ?auto_34174 ?auto_34167 ) ) ( SURFACE-AT ?auto_34164 ?auto_34170 ) ( CLEAR ?auto_34164 ) ( IS-CRATE ?auto_34161 ) ( not ( = ?auto_34164 ?auto_34161 ) ) ( not ( = ?auto_34162 ?auto_34164 ) ) ( not ( = ?auto_34163 ?auto_34164 ) ) ( not ( = ?auto_34174 ?auto_34164 ) ) ( not ( = ?auto_34167 ?auto_34164 ) ) ( AVAILABLE ?auto_34165 ) ( not ( = ?auto_34171 ?auto_34170 ) ) ( not ( = ?auto_34176 ?auto_34171 ) ) ( not ( = ?auto_34175 ?auto_34171 ) ) ( HOIST-AT ?auto_34169 ?auto_34171 ) ( not ( = ?auto_34165 ?auto_34169 ) ) ( not ( = ?auto_34172 ?auto_34169 ) ) ( not ( = ?auto_34173 ?auto_34169 ) ) ( AVAILABLE ?auto_34169 ) ( SURFACE-AT ?auto_34161 ?auto_34171 ) ( ON ?auto_34161 ?auto_34168 ) ( CLEAR ?auto_34161 ) ( not ( = ?auto_34162 ?auto_34168 ) ) ( not ( = ?auto_34163 ?auto_34168 ) ) ( not ( = ?auto_34161 ?auto_34168 ) ) ( not ( = ?auto_34174 ?auto_34168 ) ) ( not ( = ?auto_34167 ?auto_34168 ) ) ( not ( = ?auto_34164 ?auto_34168 ) ) ( TRUCK-AT ?auto_34166 ?auto_34170 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34162 ?auto_34163 )
      ( MAKE-2CRATE-VERIFY ?auto_34161 ?auto_34162 ?auto_34163 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34177 - SURFACE
      ?auto_34178 - SURFACE
      ?auto_34179 - SURFACE
      ?auto_34180 - SURFACE
    )
    :vars
    (
      ?auto_34189 - HOIST
      ?auto_34184 - PLACE
      ?auto_34190 - PLACE
      ?auto_34191 - HOIST
      ?auto_34181 - SURFACE
      ?auto_34183 - PLACE
      ?auto_34188 - HOIST
      ?auto_34185 - SURFACE
      ?auto_34187 - PLACE
      ?auto_34186 - HOIST
      ?auto_34192 - SURFACE
      ?auto_34182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34189 ?auto_34184 ) ( IS-CRATE ?auto_34180 ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( not ( = ?auto_34178 ?auto_34179 ) ) ( not ( = ?auto_34178 ?auto_34180 ) ) ( not ( = ?auto_34190 ?auto_34184 ) ) ( HOIST-AT ?auto_34191 ?auto_34190 ) ( not ( = ?auto_34189 ?auto_34191 ) ) ( AVAILABLE ?auto_34191 ) ( SURFACE-AT ?auto_34180 ?auto_34190 ) ( ON ?auto_34180 ?auto_34181 ) ( CLEAR ?auto_34180 ) ( not ( = ?auto_34179 ?auto_34181 ) ) ( not ( = ?auto_34180 ?auto_34181 ) ) ( not ( = ?auto_34178 ?auto_34181 ) ) ( IS-CRATE ?auto_34179 ) ( not ( = ?auto_34183 ?auto_34184 ) ) ( not ( = ?auto_34190 ?auto_34183 ) ) ( HOIST-AT ?auto_34188 ?auto_34183 ) ( not ( = ?auto_34189 ?auto_34188 ) ) ( not ( = ?auto_34191 ?auto_34188 ) ) ( AVAILABLE ?auto_34188 ) ( SURFACE-AT ?auto_34179 ?auto_34183 ) ( ON ?auto_34179 ?auto_34185 ) ( CLEAR ?auto_34179 ) ( not ( = ?auto_34179 ?auto_34185 ) ) ( not ( = ?auto_34180 ?auto_34185 ) ) ( not ( = ?auto_34178 ?auto_34185 ) ) ( not ( = ?auto_34181 ?auto_34185 ) ) ( SURFACE-AT ?auto_34177 ?auto_34184 ) ( CLEAR ?auto_34177 ) ( IS-CRATE ?auto_34178 ) ( not ( = ?auto_34177 ?auto_34178 ) ) ( not ( = ?auto_34179 ?auto_34177 ) ) ( not ( = ?auto_34180 ?auto_34177 ) ) ( not ( = ?auto_34181 ?auto_34177 ) ) ( not ( = ?auto_34185 ?auto_34177 ) ) ( AVAILABLE ?auto_34189 ) ( not ( = ?auto_34187 ?auto_34184 ) ) ( not ( = ?auto_34190 ?auto_34187 ) ) ( not ( = ?auto_34183 ?auto_34187 ) ) ( HOIST-AT ?auto_34186 ?auto_34187 ) ( not ( = ?auto_34189 ?auto_34186 ) ) ( not ( = ?auto_34191 ?auto_34186 ) ) ( not ( = ?auto_34188 ?auto_34186 ) ) ( AVAILABLE ?auto_34186 ) ( SURFACE-AT ?auto_34178 ?auto_34187 ) ( ON ?auto_34178 ?auto_34192 ) ( CLEAR ?auto_34178 ) ( not ( = ?auto_34179 ?auto_34192 ) ) ( not ( = ?auto_34180 ?auto_34192 ) ) ( not ( = ?auto_34178 ?auto_34192 ) ) ( not ( = ?auto_34181 ?auto_34192 ) ) ( not ( = ?auto_34185 ?auto_34192 ) ) ( not ( = ?auto_34177 ?auto_34192 ) ) ( TRUCK-AT ?auto_34182 ?auto_34184 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34178 ?auto_34179 ?auto_34180 )
      ( MAKE-3CRATE-VERIFY ?auto_34177 ?auto_34178 ?auto_34179 ?auto_34180 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34193 - SURFACE
      ?auto_34194 - SURFACE
      ?auto_34195 - SURFACE
      ?auto_34196 - SURFACE
      ?auto_34197 - SURFACE
    )
    :vars
    (
      ?auto_34206 - HOIST
      ?auto_34201 - PLACE
      ?auto_34207 - PLACE
      ?auto_34208 - HOIST
      ?auto_34198 - SURFACE
      ?auto_34200 - PLACE
      ?auto_34205 - HOIST
      ?auto_34202 - SURFACE
      ?auto_34204 - PLACE
      ?auto_34203 - HOIST
      ?auto_34209 - SURFACE
      ?auto_34199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34206 ?auto_34201 ) ( IS-CRATE ?auto_34197 ) ( not ( = ?auto_34196 ?auto_34197 ) ) ( not ( = ?auto_34195 ?auto_34196 ) ) ( not ( = ?auto_34195 ?auto_34197 ) ) ( not ( = ?auto_34207 ?auto_34201 ) ) ( HOIST-AT ?auto_34208 ?auto_34207 ) ( not ( = ?auto_34206 ?auto_34208 ) ) ( AVAILABLE ?auto_34208 ) ( SURFACE-AT ?auto_34197 ?auto_34207 ) ( ON ?auto_34197 ?auto_34198 ) ( CLEAR ?auto_34197 ) ( not ( = ?auto_34196 ?auto_34198 ) ) ( not ( = ?auto_34197 ?auto_34198 ) ) ( not ( = ?auto_34195 ?auto_34198 ) ) ( IS-CRATE ?auto_34196 ) ( not ( = ?auto_34200 ?auto_34201 ) ) ( not ( = ?auto_34207 ?auto_34200 ) ) ( HOIST-AT ?auto_34205 ?auto_34200 ) ( not ( = ?auto_34206 ?auto_34205 ) ) ( not ( = ?auto_34208 ?auto_34205 ) ) ( AVAILABLE ?auto_34205 ) ( SURFACE-AT ?auto_34196 ?auto_34200 ) ( ON ?auto_34196 ?auto_34202 ) ( CLEAR ?auto_34196 ) ( not ( = ?auto_34196 ?auto_34202 ) ) ( not ( = ?auto_34197 ?auto_34202 ) ) ( not ( = ?auto_34195 ?auto_34202 ) ) ( not ( = ?auto_34198 ?auto_34202 ) ) ( SURFACE-AT ?auto_34194 ?auto_34201 ) ( CLEAR ?auto_34194 ) ( IS-CRATE ?auto_34195 ) ( not ( = ?auto_34194 ?auto_34195 ) ) ( not ( = ?auto_34196 ?auto_34194 ) ) ( not ( = ?auto_34197 ?auto_34194 ) ) ( not ( = ?auto_34198 ?auto_34194 ) ) ( not ( = ?auto_34202 ?auto_34194 ) ) ( AVAILABLE ?auto_34206 ) ( not ( = ?auto_34204 ?auto_34201 ) ) ( not ( = ?auto_34207 ?auto_34204 ) ) ( not ( = ?auto_34200 ?auto_34204 ) ) ( HOIST-AT ?auto_34203 ?auto_34204 ) ( not ( = ?auto_34206 ?auto_34203 ) ) ( not ( = ?auto_34208 ?auto_34203 ) ) ( not ( = ?auto_34205 ?auto_34203 ) ) ( AVAILABLE ?auto_34203 ) ( SURFACE-AT ?auto_34195 ?auto_34204 ) ( ON ?auto_34195 ?auto_34209 ) ( CLEAR ?auto_34195 ) ( not ( = ?auto_34196 ?auto_34209 ) ) ( not ( = ?auto_34197 ?auto_34209 ) ) ( not ( = ?auto_34195 ?auto_34209 ) ) ( not ( = ?auto_34198 ?auto_34209 ) ) ( not ( = ?auto_34202 ?auto_34209 ) ) ( not ( = ?auto_34194 ?auto_34209 ) ) ( TRUCK-AT ?auto_34199 ?auto_34201 ) ( ON ?auto_34194 ?auto_34193 ) ( not ( = ?auto_34193 ?auto_34194 ) ) ( not ( = ?auto_34193 ?auto_34195 ) ) ( not ( = ?auto_34193 ?auto_34196 ) ) ( not ( = ?auto_34193 ?auto_34197 ) ) ( not ( = ?auto_34193 ?auto_34198 ) ) ( not ( = ?auto_34193 ?auto_34202 ) ) ( not ( = ?auto_34193 ?auto_34209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34195 ?auto_34196 ?auto_34197 )
      ( MAKE-4CRATE-VERIFY ?auto_34193 ?auto_34194 ?auto_34195 ?auto_34196 ?auto_34197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34210 - SURFACE
      ?auto_34211 - SURFACE
    )
    :vars
    (
      ?auto_34221 - HOIST
      ?auto_34215 - PLACE
      ?auto_34216 - SURFACE
      ?auto_34222 - PLACE
      ?auto_34223 - HOIST
      ?auto_34212 - SURFACE
      ?auto_34214 - PLACE
      ?auto_34220 - HOIST
      ?auto_34217 - SURFACE
      ?auto_34224 - SURFACE
      ?auto_34219 - PLACE
      ?auto_34218 - HOIST
      ?auto_34225 - SURFACE
      ?auto_34213 - TRUCK
      ?auto_34226 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34221 ?auto_34215 ) ( IS-CRATE ?auto_34211 ) ( not ( = ?auto_34210 ?auto_34211 ) ) ( not ( = ?auto_34216 ?auto_34210 ) ) ( not ( = ?auto_34216 ?auto_34211 ) ) ( not ( = ?auto_34222 ?auto_34215 ) ) ( HOIST-AT ?auto_34223 ?auto_34222 ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( AVAILABLE ?auto_34223 ) ( SURFACE-AT ?auto_34211 ?auto_34222 ) ( ON ?auto_34211 ?auto_34212 ) ( CLEAR ?auto_34211 ) ( not ( = ?auto_34210 ?auto_34212 ) ) ( not ( = ?auto_34211 ?auto_34212 ) ) ( not ( = ?auto_34216 ?auto_34212 ) ) ( IS-CRATE ?auto_34210 ) ( not ( = ?auto_34214 ?auto_34215 ) ) ( not ( = ?auto_34222 ?auto_34214 ) ) ( HOIST-AT ?auto_34220 ?auto_34214 ) ( not ( = ?auto_34221 ?auto_34220 ) ) ( not ( = ?auto_34223 ?auto_34220 ) ) ( AVAILABLE ?auto_34220 ) ( SURFACE-AT ?auto_34210 ?auto_34214 ) ( ON ?auto_34210 ?auto_34217 ) ( CLEAR ?auto_34210 ) ( not ( = ?auto_34210 ?auto_34217 ) ) ( not ( = ?auto_34211 ?auto_34217 ) ) ( not ( = ?auto_34216 ?auto_34217 ) ) ( not ( = ?auto_34212 ?auto_34217 ) ) ( IS-CRATE ?auto_34216 ) ( not ( = ?auto_34224 ?auto_34216 ) ) ( not ( = ?auto_34210 ?auto_34224 ) ) ( not ( = ?auto_34211 ?auto_34224 ) ) ( not ( = ?auto_34212 ?auto_34224 ) ) ( not ( = ?auto_34217 ?auto_34224 ) ) ( not ( = ?auto_34219 ?auto_34215 ) ) ( not ( = ?auto_34222 ?auto_34219 ) ) ( not ( = ?auto_34214 ?auto_34219 ) ) ( HOIST-AT ?auto_34218 ?auto_34219 ) ( not ( = ?auto_34221 ?auto_34218 ) ) ( not ( = ?auto_34223 ?auto_34218 ) ) ( not ( = ?auto_34220 ?auto_34218 ) ) ( AVAILABLE ?auto_34218 ) ( SURFACE-AT ?auto_34216 ?auto_34219 ) ( ON ?auto_34216 ?auto_34225 ) ( CLEAR ?auto_34216 ) ( not ( = ?auto_34210 ?auto_34225 ) ) ( not ( = ?auto_34211 ?auto_34225 ) ) ( not ( = ?auto_34216 ?auto_34225 ) ) ( not ( = ?auto_34212 ?auto_34225 ) ) ( not ( = ?auto_34217 ?auto_34225 ) ) ( not ( = ?auto_34224 ?auto_34225 ) ) ( TRUCK-AT ?auto_34213 ?auto_34215 ) ( SURFACE-AT ?auto_34226 ?auto_34215 ) ( CLEAR ?auto_34226 ) ( LIFTING ?auto_34221 ?auto_34224 ) ( IS-CRATE ?auto_34224 ) ( not ( = ?auto_34226 ?auto_34224 ) ) ( not ( = ?auto_34210 ?auto_34226 ) ) ( not ( = ?auto_34211 ?auto_34226 ) ) ( not ( = ?auto_34216 ?auto_34226 ) ) ( not ( = ?auto_34212 ?auto_34226 ) ) ( not ( = ?auto_34217 ?auto_34226 ) ) ( not ( = ?auto_34225 ?auto_34226 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34226 ?auto_34224 )
      ( MAKE-2CRATE ?auto_34216 ?auto_34210 ?auto_34211 )
      ( MAKE-1CRATE-VERIFY ?auto_34210 ?auto_34211 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34227 - SURFACE
      ?auto_34228 - SURFACE
      ?auto_34229 - SURFACE
    )
    :vars
    (
      ?auto_34232 - HOIST
      ?auto_34237 - PLACE
      ?auto_34235 - PLACE
      ?auto_34243 - HOIST
      ?auto_34231 - SURFACE
      ?auto_34236 - PLACE
      ?auto_34240 - HOIST
      ?auto_34241 - SURFACE
      ?auto_34239 - SURFACE
      ?auto_34234 - PLACE
      ?auto_34242 - HOIST
      ?auto_34238 - SURFACE
      ?auto_34230 - TRUCK
      ?auto_34233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34232 ?auto_34237 ) ( IS-CRATE ?auto_34229 ) ( not ( = ?auto_34228 ?auto_34229 ) ) ( not ( = ?auto_34227 ?auto_34228 ) ) ( not ( = ?auto_34227 ?auto_34229 ) ) ( not ( = ?auto_34235 ?auto_34237 ) ) ( HOIST-AT ?auto_34243 ?auto_34235 ) ( not ( = ?auto_34232 ?auto_34243 ) ) ( AVAILABLE ?auto_34243 ) ( SURFACE-AT ?auto_34229 ?auto_34235 ) ( ON ?auto_34229 ?auto_34231 ) ( CLEAR ?auto_34229 ) ( not ( = ?auto_34228 ?auto_34231 ) ) ( not ( = ?auto_34229 ?auto_34231 ) ) ( not ( = ?auto_34227 ?auto_34231 ) ) ( IS-CRATE ?auto_34228 ) ( not ( = ?auto_34236 ?auto_34237 ) ) ( not ( = ?auto_34235 ?auto_34236 ) ) ( HOIST-AT ?auto_34240 ?auto_34236 ) ( not ( = ?auto_34232 ?auto_34240 ) ) ( not ( = ?auto_34243 ?auto_34240 ) ) ( AVAILABLE ?auto_34240 ) ( SURFACE-AT ?auto_34228 ?auto_34236 ) ( ON ?auto_34228 ?auto_34241 ) ( CLEAR ?auto_34228 ) ( not ( = ?auto_34228 ?auto_34241 ) ) ( not ( = ?auto_34229 ?auto_34241 ) ) ( not ( = ?auto_34227 ?auto_34241 ) ) ( not ( = ?auto_34231 ?auto_34241 ) ) ( IS-CRATE ?auto_34227 ) ( not ( = ?auto_34239 ?auto_34227 ) ) ( not ( = ?auto_34228 ?auto_34239 ) ) ( not ( = ?auto_34229 ?auto_34239 ) ) ( not ( = ?auto_34231 ?auto_34239 ) ) ( not ( = ?auto_34241 ?auto_34239 ) ) ( not ( = ?auto_34234 ?auto_34237 ) ) ( not ( = ?auto_34235 ?auto_34234 ) ) ( not ( = ?auto_34236 ?auto_34234 ) ) ( HOIST-AT ?auto_34242 ?auto_34234 ) ( not ( = ?auto_34232 ?auto_34242 ) ) ( not ( = ?auto_34243 ?auto_34242 ) ) ( not ( = ?auto_34240 ?auto_34242 ) ) ( AVAILABLE ?auto_34242 ) ( SURFACE-AT ?auto_34227 ?auto_34234 ) ( ON ?auto_34227 ?auto_34238 ) ( CLEAR ?auto_34227 ) ( not ( = ?auto_34228 ?auto_34238 ) ) ( not ( = ?auto_34229 ?auto_34238 ) ) ( not ( = ?auto_34227 ?auto_34238 ) ) ( not ( = ?auto_34231 ?auto_34238 ) ) ( not ( = ?auto_34241 ?auto_34238 ) ) ( not ( = ?auto_34239 ?auto_34238 ) ) ( TRUCK-AT ?auto_34230 ?auto_34237 ) ( SURFACE-AT ?auto_34233 ?auto_34237 ) ( CLEAR ?auto_34233 ) ( LIFTING ?auto_34232 ?auto_34239 ) ( IS-CRATE ?auto_34239 ) ( not ( = ?auto_34233 ?auto_34239 ) ) ( not ( = ?auto_34228 ?auto_34233 ) ) ( not ( = ?auto_34229 ?auto_34233 ) ) ( not ( = ?auto_34227 ?auto_34233 ) ) ( not ( = ?auto_34231 ?auto_34233 ) ) ( not ( = ?auto_34241 ?auto_34233 ) ) ( not ( = ?auto_34238 ?auto_34233 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34228 ?auto_34229 )
      ( MAKE-2CRATE-VERIFY ?auto_34227 ?auto_34228 ?auto_34229 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34244 - SURFACE
      ?auto_34245 - SURFACE
      ?auto_34246 - SURFACE
      ?auto_34247 - SURFACE
    )
    :vars
    (
      ?auto_34257 - HOIST
      ?auto_34249 - PLACE
      ?auto_34256 - PLACE
      ?auto_34259 - HOIST
      ?auto_34258 - SURFACE
      ?auto_34255 - PLACE
      ?auto_34252 - HOIST
      ?auto_34253 - SURFACE
      ?auto_34254 - PLACE
      ?auto_34251 - HOIST
      ?auto_34260 - SURFACE
      ?auto_34248 - TRUCK
      ?auto_34250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34257 ?auto_34249 ) ( IS-CRATE ?auto_34247 ) ( not ( = ?auto_34246 ?auto_34247 ) ) ( not ( = ?auto_34245 ?auto_34246 ) ) ( not ( = ?auto_34245 ?auto_34247 ) ) ( not ( = ?auto_34256 ?auto_34249 ) ) ( HOIST-AT ?auto_34259 ?auto_34256 ) ( not ( = ?auto_34257 ?auto_34259 ) ) ( AVAILABLE ?auto_34259 ) ( SURFACE-AT ?auto_34247 ?auto_34256 ) ( ON ?auto_34247 ?auto_34258 ) ( CLEAR ?auto_34247 ) ( not ( = ?auto_34246 ?auto_34258 ) ) ( not ( = ?auto_34247 ?auto_34258 ) ) ( not ( = ?auto_34245 ?auto_34258 ) ) ( IS-CRATE ?auto_34246 ) ( not ( = ?auto_34255 ?auto_34249 ) ) ( not ( = ?auto_34256 ?auto_34255 ) ) ( HOIST-AT ?auto_34252 ?auto_34255 ) ( not ( = ?auto_34257 ?auto_34252 ) ) ( not ( = ?auto_34259 ?auto_34252 ) ) ( AVAILABLE ?auto_34252 ) ( SURFACE-AT ?auto_34246 ?auto_34255 ) ( ON ?auto_34246 ?auto_34253 ) ( CLEAR ?auto_34246 ) ( not ( = ?auto_34246 ?auto_34253 ) ) ( not ( = ?auto_34247 ?auto_34253 ) ) ( not ( = ?auto_34245 ?auto_34253 ) ) ( not ( = ?auto_34258 ?auto_34253 ) ) ( IS-CRATE ?auto_34245 ) ( not ( = ?auto_34244 ?auto_34245 ) ) ( not ( = ?auto_34246 ?auto_34244 ) ) ( not ( = ?auto_34247 ?auto_34244 ) ) ( not ( = ?auto_34258 ?auto_34244 ) ) ( not ( = ?auto_34253 ?auto_34244 ) ) ( not ( = ?auto_34254 ?auto_34249 ) ) ( not ( = ?auto_34256 ?auto_34254 ) ) ( not ( = ?auto_34255 ?auto_34254 ) ) ( HOIST-AT ?auto_34251 ?auto_34254 ) ( not ( = ?auto_34257 ?auto_34251 ) ) ( not ( = ?auto_34259 ?auto_34251 ) ) ( not ( = ?auto_34252 ?auto_34251 ) ) ( AVAILABLE ?auto_34251 ) ( SURFACE-AT ?auto_34245 ?auto_34254 ) ( ON ?auto_34245 ?auto_34260 ) ( CLEAR ?auto_34245 ) ( not ( = ?auto_34246 ?auto_34260 ) ) ( not ( = ?auto_34247 ?auto_34260 ) ) ( not ( = ?auto_34245 ?auto_34260 ) ) ( not ( = ?auto_34258 ?auto_34260 ) ) ( not ( = ?auto_34253 ?auto_34260 ) ) ( not ( = ?auto_34244 ?auto_34260 ) ) ( TRUCK-AT ?auto_34248 ?auto_34249 ) ( SURFACE-AT ?auto_34250 ?auto_34249 ) ( CLEAR ?auto_34250 ) ( LIFTING ?auto_34257 ?auto_34244 ) ( IS-CRATE ?auto_34244 ) ( not ( = ?auto_34250 ?auto_34244 ) ) ( not ( = ?auto_34246 ?auto_34250 ) ) ( not ( = ?auto_34247 ?auto_34250 ) ) ( not ( = ?auto_34245 ?auto_34250 ) ) ( not ( = ?auto_34258 ?auto_34250 ) ) ( not ( = ?auto_34253 ?auto_34250 ) ) ( not ( = ?auto_34260 ?auto_34250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34245 ?auto_34246 ?auto_34247 )
      ( MAKE-3CRATE-VERIFY ?auto_34244 ?auto_34245 ?auto_34246 ?auto_34247 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34261 - SURFACE
      ?auto_34262 - SURFACE
      ?auto_34263 - SURFACE
      ?auto_34264 - SURFACE
      ?auto_34265 - SURFACE
    )
    :vars
    (
      ?auto_34274 - HOIST
      ?auto_34267 - PLACE
      ?auto_34273 - PLACE
      ?auto_34276 - HOIST
      ?auto_34275 - SURFACE
      ?auto_34272 - PLACE
      ?auto_34269 - HOIST
      ?auto_34270 - SURFACE
      ?auto_34271 - PLACE
      ?auto_34268 - HOIST
      ?auto_34277 - SURFACE
      ?auto_34266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34274 ?auto_34267 ) ( IS-CRATE ?auto_34265 ) ( not ( = ?auto_34264 ?auto_34265 ) ) ( not ( = ?auto_34263 ?auto_34264 ) ) ( not ( = ?auto_34263 ?auto_34265 ) ) ( not ( = ?auto_34273 ?auto_34267 ) ) ( HOIST-AT ?auto_34276 ?auto_34273 ) ( not ( = ?auto_34274 ?auto_34276 ) ) ( AVAILABLE ?auto_34276 ) ( SURFACE-AT ?auto_34265 ?auto_34273 ) ( ON ?auto_34265 ?auto_34275 ) ( CLEAR ?auto_34265 ) ( not ( = ?auto_34264 ?auto_34275 ) ) ( not ( = ?auto_34265 ?auto_34275 ) ) ( not ( = ?auto_34263 ?auto_34275 ) ) ( IS-CRATE ?auto_34264 ) ( not ( = ?auto_34272 ?auto_34267 ) ) ( not ( = ?auto_34273 ?auto_34272 ) ) ( HOIST-AT ?auto_34269 ?auto_34272 ) ( not ( = ?auto_34274 ?auto_34269 ) ) ( not ( = ?auto_34276 ?auto_34269 ) ) ( AVAILABLE ?auto_34269 ) ( SURFACE-AT ?auto_34264 ?auto_34272 ) ( ON ?auto_34264 ?auto_34270 ) ( CLEAR ?auto_34264 ) ( not ( = ?auto_34264 ?auto_34270 ) ) ( not ( = ?auto_34265 ?auto_34270 ) ) ( not ( = ?auto_34263 ?auto_34270 ) ) ( not ( = ?auto_34275 ?auto_34270 ) ) ( IS-CRATE ?auto_34263 ) ( not ( = ?auto_34262 ?auto_34263 ) ) ( not ( = ?auto_34264 ?auto_34262 ) ) ( not ( = ?auto_34265 ?auto_34262 ) ) ( not ( = ?auto_34275 ?auto_34262 ) ) ( not ( = ?auto_34270 ?auto_34262 ) ) ( not ( = ?auto_34271 ?auto_34267 ) ) ( not ( = ?auto_34273 ?auto_34271 ) ) ( not ( = ?auto_34272 ?auto_34271 ) ) ( HOIST-AT ?auto_34268 ?auto_34271 ) ( not ( = ?auto_34274 ?auto_34268 ) ) ( not ( = ?auto_34276 ?auto_34268 ) ) ( not ( = ?auto_34269 ?auto_34268 ) ) ( AVAILABLE ?auto_34268 ) ( SURFACE-AT ?auto_34263 ?auto_34271 ) ( ON ?auto_34263 ?auto_34277 ) ( CLEAR ?auto_34263 ) ( not ( = ?auto_34264 ?auto_34277 ) ) ( not ( = ?auto_34265 ?auto_34277 ) ) ( not ( = ?auto_34263 ?auto_34277 ) ) ( not ( = ?auto_34275 ?auto_34277 ) ) ( not ( = ?auto_34270 ?auto_34277 ) ) ( not ( = ?auto_34262 ?auto_34277 ) ) ( TRUCK-AT ?auto_34266 ?auto_34267 ) ( SURFACE-AT ?auto_34261 ?auto_34267 ) ( CLEAR ?auto_34261 ) ( LIFTING ?auto_34274 ?auto_34262 ) ( IS-CRATE ?auto_34262 ) ( not ( = ?auto_34261 ?auto_34262 ) ) ( not ( = ?auto_34264 ?auto_34261 ) ) ( not ( = ?auto_34265 ?auto_34261 ) ) ( not ( = ?auto_34263 ?auto_34261 ) ) ( not ( = ?auto_34275 ?auto_34261 ) ) ( not ( = ?auto_34270 ?auto_34261 ) ) ( not ( = ?auto_34277 ?auto_34261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34263 ?auto_34264 ?auto_34265 )
      ( MAKE-4CRATE-VERIFY ?auto_34261 ?auto_34262 ?auto_34263 ?auto_34264 ?auto_34265 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34278 - SURFACE
      ?auto_34279 - SURFACE
    )
    :vars
    (
      ?auto_34291 - HOIST
      ?auto_34283 - PLACE
      ?auto_34280 - SURFACE
      ?auto_34290 - PLACE
      ?auto_34293 - HOIST
      ?auto_34292 - SURFACE
      ?auto_34289 - PLACE
      ?auto_34286 - HOIST
      ?auto_34287 - SURFACE
      ?auto_34281 - SURFACE
      ?auto_34288 - PLACE
      ?auto_34285 - HOIST
      ?auto_34294 - SURFACE
      ?auto_34282 - TRUCK
      ?auto_34284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34291 ?auto_34283 ) ( IS-CRATE ?auto_34279 ) ( not ( = ?auto_34278 ?auto_34279 ) ) ( not ( = ?auto_34280 ?auto_34278 ) ) ( not ( = ?auto_34280 ?auto_34279 ) ) ( not ( = ?auto_34290 ?auto_34283 ) ) ( HOIST-AT ?auto_34293 ?auto_34290 ) ( not ( = ?auto_34291 ?auto_34293 ) ) ( AVAILABLE ?auto_34293 ) ( SURFACE-AT ?auto_34279 ?auto_34290 ) ( ON ?auto_34279 ?auto_34292 ) ( CLEAR ?auto_34279 ) ( not ( = ?auto_34278 ?auto_34292 ) ) ( not ( = ?auto_34279 ?auto_34292 ) ) ( not ( = ?auto_34280 ?auto_34292 ) ) ( IS-CRATE ?auto_34278 ) ( not ( = ?auto_34289 ?auto_34283 ) ) ( not ( = ?auto_34290 ?auto_34289 ) ) ( HOIST-AT ?auto_34286 ?auto_34289 ) ( not ( = ?auto_34291 ?auto_34286 ) ) ( not ( = ?auto_34293 ?auto_34286 ) ) ( AVAILABLE ?auto_34286 ) ( SURFACE-AT ?auto_34278 ?auto_34289 ) ( ON ?auto_34278 ?auto_34287 ) ( CLEAR ?auto_34278 ) ( not ( = ?auto_34278 ?auto_34287 ) ) ( not ( = ?auto_34279 ?auto_34287 ) ) ( not ( = ?auto_34280 ?auto_34287 ) ) ( not ( = ?auto_34292 ?auto_34287 ) ) ( IS-CRATE ?auto_34280 ) ( not ( = ?auto_34281 ?auto_34280 ) ) ( not ( = ?auto_34278 ?auto_34281 ) ) ( not ( = ?auto_34279 ?auto_34281 ) ) ( not ( = ?auto_34292 ?auto_34281 ) ) ( not ( = ?auto_34287 ?auto_34281 ) ) ( not ( = ?auto_34288 ?auto_34283 ) ) ( not ( = ?auto_34290 ?auto_34288 ) ) ( not ( = ?auto_34289 ?auto_34288 ) ) ( HOIST-AT ?auto_34285 ?auto_34288 ) ( not ( = ?auto_34291 ?auto_34285 ) ) ( not ( = ?auto_34293 ?auto_34285 ) ) ( not ( = ?auto_34286 ?auto_34285 ) ) ( AVAILABLE ?auto_34285 ) ( SURFACE-AT ?auto_34280 ?auto_34288 ) ( ON ?auto_34280 ?auto_34294 ) ( CLEAR ?auto_34280 ) ( not ( = ?auto_34278 ?auto_34294 ) ) ( not ( = ?auto_34279 ?auto_34294 ) ) ( not ( = ?auto_34280 ?auto_34294 ) ) ( not ( = ?auto_34292 ?auto_34294 ) ) ( not ( = ?auto_34287 ?auto_34294 ) ) ( not ( = ?auto_34281 ?auto_34294 ) ) ( TRUCK-AT ?auto_34282 ?auto_34283 ) ( SURFACE-AT ?auto_34284 ?auto_34283 ) ( CLEAR ?auto_34284 ) ( IS-CRATE ?auto_34281 ) ( not ( = ?auto_34284 ?auto_34281 ) ) ( not ( = ?auto_34278 ?auto_34284 ) ) ( not ( = ?auto_34279 ?auto_34284 ) ) ( not ( = ?auto_34280 ?auto_34284 ) ) ( not ( = ?auto_34292 ?auto_34284 ) ) ( not ( = ?auto_34287 ?auto_34284 ) ) ( not ( = ?auto_34294 ?auto_34284 ) ) ( AVAILABLE ?auto_34291 ) ( IN ?auto_34281 ?auto_34282 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34291 ?auto_34281 ?auto_34282 ?auto_34283 )
      ( MAKE-2CRATE ?auto_34280 ?auto_34278 ?auto_34279 )
      ( MAKE-1CRATE-VERIFY ?auto_34278 ?auto_34279 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34295 - SURFACE
      ?auto_34296 - SURFACE
      ?auto_34297 - SURFACE
    )
    :vars
    (
      ?auto_34307 - HOIST
      ?auto_34298 - PLACE
      ?auto_34301 - PLACE
      ?auto_34306 - HOIST
      ?auto_34310 - SURFACE
      ?auto_34311 - PLACE
      ?auto_34299 - HOIST
      ?auto_34305 - SURFACE
      ?auto_34308 - SURFACE
      ?auto_34304 - PLACE
      ?auto_34300 - HOIST
      ?auto_34302 - SURFACE
      ?auto_34303 - TRUCK
      ?auto_34309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34307 ?auto_34298 ) ( IS-CRATE ?auto_34297 ) ( not ( = ?auto_34296 ?auto_34297 ) ) ( not ( = ?auto_34295 ?auto_34296 ) ) ( not ( = ?auto_34295 ?auto_34297 ) ) ( not ( = ?auto_34301 ?auto_34298 ) ) ( HOIST-AT ?auto_34306 ?auto_34301 ) ( not ( = ?auto_34307 ?auto_34306 ) ) ( AVAILABLE ?auto_34306 ) ( SURFACE-AT ?auto_34297 ?auto_34301 ) ( ON ?auto_34297 ?auto_34310 ) ( CLEAR ?auto_34297 ) ( not ( = ?auto_34296 ?auto_34310 ) ) ( not ( = ?auto_34297 ?auto_34310 ) ) ( not ( = ?auto_34295 ?auto_34310 ) ) ( IS-CRATE ?auto_34296 ) ( not ( = ?auto_34311 ?auto_34298 ) ) ( not ( = ?auto_34301 ?auto_34311 ) ) ( HOIST-AT ?auto_34299 ?auto_34311 ) ( not ( = ?auto_34307 ?auto_34299 ) ) ( not ( = ?auto_34306 ?auto_34299 ) ) ( AVAILABLE ?auto_34299 ) ( SURFACE-AT ?auto_34296 ?auto_34311 ) ( ON ?auto_34296 ?auto_34305 ) ( CLEAR ?auto_34296 ) ( not ( = ?auto_34296 ?auto_34305 ) ) ( not ( = ?auto_34297 ?auto_34305 ) ) ( not ( = ?auto_34295 ?auto_34305 ) ) ( not ( = ?auto_34310 ?auto_34305 ) ) ( IS-CRATE ?auto_34295 ) ( not ( = ?auto_34308 ?auto_34295 ) ) ( not ( = ?auto_34296 ?auto_34308 ) ) ( not ( = ?auto_34297 ?auto_34308 ) ) ( not ( = ?auto_34310 ?auto_34308 ) ) ( not ( = ?auto_34305 ?auto_34308 ) ) ( not ( = ?auto_34304 ?auto_34298 ) ) ( not ( = ?auto_34301 ?auto_34304 ) ) ( not ( = ?auto_34311 ?auto_34304 ) ) ( HOIST-AT ?auto_34300 ?auto_34304 ) ( not ( = ?auto_34307 ?auto_34300 ) ) ( not ( = ?auto_34306 ?auto_34300 ) ) ( not ( = ?auto_34299 ?auto_34300 ) ) ( AVAILABLE ?auto_34300 ) ( SURFACE-AT ?auto_34295 ?auto_34304 ) ( ON ?auto_34295 ?auto_34302 ) ( CLEAR ?auto_34295 ) ( not ( = ?auto_34296 ?auto_34302 ) ) ( not ( = ?auto_34297 ?auto_34302 ) ) ( not ( = ?auto_34295 ?auto_34302 ) ) ( not ( = ?auto_34310 ?auto_34302 ) ) ( not ( = ?auto_34305 ?auto_34302 ) ) ( not ( = ?auto_34308 ?auto_34302 ) ) ( TRUCK-AT ?auto_34303 ?auto_34298 ) ( SURFACE-AT ?auto_34309 ?auto_34298 ) ( CLEAR ?auto_34309 ) ( IS-CRATE ?auto_34308 ) ( not ( = ?auto_34309 ?auto_34308 ) ) ( not ( = ?auto_34296 ?auto_34309 ) ) ( not ( = ?auto_34297 ?auto_34309 ) ) ( not ( = ?auto_34295 ?auto_34309 ) ) ( not ( = ?auto_34310 ?auto_34309 ) ) ( not ( = ?auto_34305 ?auto_34309 ) ) ( not ( = ?auto_34302 ?auto_34309 ) ) ( AVAILABLE ?auto_34307 ) ( IN ?auto_34308 ?auto_34303 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34296 ?auto_34297 )
      ( MAKE-2CRATE-VERIFY ?auto_34295 ?auto_34296 ?auto_34297 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34312 - SURFACE
      ?auto_34313 - SURFACE
      ?auto_34314 - SURFACE
      ?auto_34315 - SURFACE
    )
    :vars
    (
      ?auto_34320 - HOIST
      ?auto_34316 - PLACE
      ?auto_34324 - PLACE
      ?auto_34321 - HOIST
      ?auto_34318 - SURFACE
      ?auto_34317 - PLACE
      ?auto_34327 - HOIST
      ?auto_34323 - SURFACE
      ?auto_34328 - PLACE
      ?auto_34322 - HOIST
      ?auto_34325 - SURFACE
      ?auto_34326 - TRUCK
      ?auto_34319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34320 ?auto_34316 ) ( IS-CRATE ?auto_34315 ) ( not ( = ?auto_34314 ?auto_34315 ) ) ( not ( = ?auto_34313 ?auto_34314 ) ) ( not ( = ?auto_34313 ?auto_34315 ) ) ( not ( = ?auto_34324 ?auto_34316 ) ) ( HOIST-AT ?auto_34321 ?auto_34324 ) ( not ( = ?auto_34320 ?auto_34321 ) ) ( AVAILABLE ?auto_34321 ) ( SURFACE-AT ?auto_34315 ?auto_34324 ) ( ON ?auto_34315 ?auto_34318 ) ( CLEAR ?auto_34315 ) ( not ( = ?auto_34314 ?auto_34318 ) ) ( not ( = ?auto_34315 ?auto_34318 ) ) ( not ( = ?auto_34313 ?auto_34318 ) ) ( IS-CRATE ?auto_34314 ) ( not ( = ?auto_34317 ?auto_34316 ) ) ( not ( = ?auto_34324 ?auto_34317 ) ) ( HOIST-AT ?auto_34327 ?auto_34317 ) ( not ( = ?auto_34320 ?auto_34327 ) ) ( not ( = ?auto_34321 ?auto_34327 ) ) ( AVAILABLE ?auto_34327 ) ( SURFACE-AT ?auto_34314 ?auto_34317 ) ( ON ?auto_34314 ?auto_34323 ) ( CLEAR ?auto_34314 ) ( not ( = ?auto_34314 ?auto_34323 ) ) ( not ( = ?auto_34315 ?auto_34323 ) ) ( not ( = ?auto_34313 ?auto_34323 ) ) ( not ( = ?auto_34318 ?auto_34323 ) ) ( IS-CRATE ?auto_34313 ) ( not ( = ?auto_34312 ?auto_34313 ) ) ( not ( = ?auto_34314 ?auto_34312 ) ) ( not ( = ?auto_34315 ?auto_34312 ) ) ( not ( = ?auto_34318 ?auto_34312 ) ) ( not ( = ?auto_34323 ?auto_34312 ) ) ( not ( = ?auto_34328 ?auto_34316 ) ) ( not ( = ?auto_34324 ?auto_34328 ) ) ( not ( = ?auto_34317 ?auto_34328 ) ) ( HOIST-AT ?auto_34322 ?auto_34328 ) ( not ( = ?auto_34320 ?auto_34322 ) ) ( not ( = ?auto_34321 ?auto_34322 ) ) ( not ( = ?auto_34327 ?auto_34322 ) ) ( AVAILABLE ?auto_34322 ) ( SURFACE-AT ?auto_34313 ?auto_34328 ) ( ON ?auto_34313 ?auto_34325 ) ( CLEAR ?auto_34313 ) ( not ( = ?auto_34314 ?auto_34325 ) ) ( not ( = ?auto_34315 ?auto_34325 ) ) ( not ( = ?auto_34313 ?auto_34325 ) ) ( not ( = ?auto_34318 ?auto_34325 ) ) ( not ( = ?auto_34323 ?auto_34325 ) ) ( not ( = ?auto_34312 ?auto_34325 ) ) ( TRUCK-AT ?auto_34326 ?auto_34316 ) ( SURFACE-AT ?auto_34319 ?auto_34316 ) ( CLEAR ?auto_34319 ) ( IS-CRATE ?auto_34312 ) ( not ( = ?auto_34319 ?auto_34312 ) ) ( not ( = ?auto_34314 ?auto_34319 ) ) ( not ( = ?auto_34315 ?auto_34319 ) ) ( not ( = ?auto_34313 ?auto_34319 ) ) ( not ( = ?auto_34318 ?auto_34319 ) ) ( not ( = ?auto_34323 ?auto_34319 ) ) ( not ( = ?auto_34325 ?auto_34319 ) ) ( AVAILABLE ?auto_34320 ) ( IN ?auto_34312 ?auto_34326 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34313 ?auto_34314 ?auto_34315 )
      ( MAKE-3CRATE-VERIFY ?auto_34312 ?auto_34313 ?auto_34314 ?auto_34315 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34329 - SURFACE
      ?auto_34330 - SURFACE
      ?auto_34331 - SURFACE
      ?auto_34332 - SURFACE
      ?auto_34333 - SURFACE
    )
    :vars
    (
      ?auto_34337 - HOIST
      ?auto_34334 - PLACE
      ?auto_34341 - PLACE
      ?auto_34338 - HOIST
      ?auto_34336 - SURFACE
      ?auto_34335 - PLACE
      ?auto_34344 - HOIST
      ?auto_34340 - SURFACE
      ?auto_34345 - PLACE
      ?auto_34339 - HOIST
      ?auto_34342 - SURFACE
      ?auto_34343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34337 ?auto_34334 ) ( IS-CRATE ?auto_34333 ) ( not ( = ?auto_34332 ?auto_34333 ) ) ( not ( = ?auto_34331 ?auto_34332 ) ) ( not ( = ?auto_34331 ?auto_34333 ) ) ( not ( = ?auto_34341 ?auto_34334 ) ) ( HOIST-AT ?auto_34338 ?auto_34341 ) ( not ( = ?auto_34337 ?auto_34338 ) ) ( AVAILABLE ?auto_34338 ) ( SURFACE-AT ?auto_34333 ?auto_34341 ) ( ON ?auto_34333 ?auto_34336 ) ( CLEAR ?auto_34333 ) ( not ( = ?auto_34332 ?auto_34336 ) ) ( not ( = ?auto_34333 ?auto_34336 ) ) ( not ( = ?auto_34331 ?auto_34336 ) ) ( IS-CRATE ?auto_34332 ) ( not ( = ?auto_34335 ?auto_34334 ) ) ( not ( = ?auto_34341 ?auto_34335 ) ) ( HOIST-AT ?auto_34344 ?auto_34335 ) ( not ( = ?auto_34337 ?auto_34344 ) ) ( not ( = ?auto_34338 ?auto_34344 ) ) ( AVAILABLE ?auto_34344 ) ( SURFACE-AT ?auto_34332 ?auto_34335 ) ( ON ?auto_34332 ?auto_34340 ) ( CLEAR ?auto_34332 ) ( not ( = ?auto_34332 ?auto_34340 ) ) ( not ( = ?auto_34333 ?auto_34340 ) ) ( not ( = ?auto_34331 ?auto_34340 ) ) ( not ( = ?auto_34336 ?auto_34340 ) ) ( IS-CRATE ?auto_34331 ) ( not ( = ?auto_34330 ?auto_34331 ) ) ( not ( = ?auto_34332 ?auto_34330 ) ) ( not ( = ?auto_34333 ?auto_34330 ) ) ( not ( = ?auto_34336 ?auto_34330 ) ) ( not ( = ?auto_34340 ?auto_34330 ) ) ( not ( = ?auto_34345 ?auto_34334 ) ) ( not ( = ?auto_34341 ?auto_34345 ) ) ( not ( = ?auto_34335 ?auto_34345 ) ) ( HOIST-AT ?auto_34339 ?auto_34345 ) ( not ( = ?auto_34337 ?auto_34339 ) ) ( not ( = ?auto_34338 ?auto_34339 ) ) ( not ( = ?auto_34344 ?auto_34339 ) ) ( AVAILABLE ?auto_34339 ) ( SURFACE-AT ?auto_34331 ?auto_34345 ) ( ON ?auto_34331 ?auto_34342 ) ( CLEAR ?auto_34331 ) ( not ( = ?auto_34332 ?auto_34342 ) ) ( not ( = ?auto_34333 ?auto_34342 ) ) ( not ( = ?auto_34331 ?auto_34342 ) ) ( not ( = ?auto_34336 ?auto_34342 ) ) ( not ( = ?auto_34340 ?auto_34342 ) ) ( not ( = ?auto_34330 ?auto_34342 ) ) ( TRUCK-AT ?auto_34343 ?auto_34334 ) ( SURFACE-AT ?auto_34329 ?auto_34334 ) ( CLEAR ?auto_34329 ) ( IS-CRATE ?auto_34330 ) ( not ( = ?auto_34329 ?auto_34330 ) ) ( not ( = ?auto_34332 ?auto_34329 ) ) ( not ( = ?auto_34333 ?auto_34329 ) ) ( not ( = ?auto_34331 ?auto_34329 ) ) ( not ( = ?auto_34336 ?auto_34329 ) ) ( not ( = ?auto_34340 ?auto_34329 ) ) ( not ( = ?auto_34342 ?auto_34329 ) ) ( AVAILABLE ?auto_34337 ) ( IN ?auto_34330 ?auto_34343 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34331 ?auto_34332 ?auto_34333 )
      ( MAKE-4CRATE-VERIFY ?auto_34329 ?auto_34330 ?auto_34331 ?auto_34332 ?auto_34333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34346 - SURFACE
      ?auto_34347 - SURFACE
    )
    :vars
    (
      ?auto_34353 - HOIST
      ?auto_34348 - PLACE
      ?auto_34355 - SURFACE
      ?auto_34358 - PLACE
      ?auto_34354 - HOIST
      ?auto_34351 - SURFACE
      ?auto_34350 - PLACE
      ?auto_34361 - HOIST
      ?auto_34357 - SURFACE
      ?auto_34349 - SURFACE
      ?auto_34362 - PLACE
      ?auto_34356 - HOIST
      ?auto_34359 - SURFACE
      ?auto_34352 - SURFACE
      ?auto_34360 - TRUCK
      ?auto_34363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34353 ?auto_34348 ) ( IS-CRATE ?auto_34347 ) ( not ( = ?auto_34346 ?auto_34347 ) ) ( not ( = ?auto_34355 ?auto_34346 ) ) ( not ( = ?auto_34355 ?auto_34347 ) ) ( not ( = ?auto_34358 ?auto_34348 ) ) ( HOIST-AT ?auto_34354 ?auto_34358 ) ( not ( = ?auto_34353 ?auto_34354 ) ) ( AVAILABLE ?auto_34354 ) ( SURFACE-AT ?auto_34347 ?auto_34358 ) ( ON ?auto_34347 ?auto_34351 ) ( CLEAR ?auto_34347 ) ( not ( = ?auto_34346 ?auto_34351 ) ) ( not ( = ?auto_34347 ?auto_34351 ) ) ( not ( = ?auto_34355 ?auto_34351 ) ) ( IS-CRATE ?auto_34346 ) ( not ( = ?auto_34350 ?auto_34348 ) ) ( not ( = ?auto_34358 ?auto_34350 ) ) ( HOIST-AT ?auto_34361 ?auto_34350 ) ( not ( = ?auto_34353 ?auto_34361 ) ) ( not ( = ?auto_34354 ?auto_34361 ) ) ( AVAILABLE ?auto_34361 ) ( SURFACE-AT ?auto_34346 ?auto_34350 ) ( ON ?auto_34346 ?auto_34357 ) ( CLEAR ?auto_34346 ) ( not ( = ?auto_34346 ?auto_34357 ) ) ( not ( = ?auto_34347 ?auto_34357 ) ) ( not ( = ?auto_34355 ?auto_34357 ) ) ( not ( = ?auto_34351 ?auto_34357 ) ) ( IS-CRATE ?auto_34355 ) ( not ( = ?auto_34349 ?auto_34355 ) ) ( not ( = ?auto_34346 ?auto_34349 ) ) ( not ( = ?auto_34347 ?auto_34349 ) ) ( not ( = ?auto_34351 ?auto_34349 ) ) ( not ( = ?auto_34357 ?auto_34349 ) ) ( not ( = ?auto_34362 ?auto_34348 ) ) ( not ( = ?auto_34358 ?auto_34362 ) ) ( not ( = ?auto_34350 ?auto_34362 ) ) ( HOIST-AT ?auto_34356 ?auto_34362 ) ( not ( = ?auto_34353 ?auto_34356 ) ) ( not ( = ?auto_34354 ?auto_34356 ) ) ( not ( = ?auto_34361 ?auto_34356 ) ) ( AVAILABLE ?auto_34356 ) ( SURFACE-AT ?auto_34355 ?auto_34362 ) ( ON ?auto_34355 ?auto_34359 ) ( CLEAR ?auto_34355 ) ( not ( = ?auto_34346 ?auto_34359 ) ) ( not ( = ?auto_34347 ?auto_34359 ) ) ( not ( = ?auto_34355 ?auto_34359 ) ) ( not ( = ?auto_34351 ?auto_34359 ) ) ( not ( = ?auto_34357 ?auto_34359 ) ) ( not ( = ?auto_34349 ?auto_34359 ) ) ( SURFACE-AT ?auto_34352 ?auto_34348 ) ( CLEAR ?auto_34352 ) ( IS-CRATE ?auto_34349 ) ( not ( = ?auto_34352 ?auto_34349 ) ) ( not ( = ?auto_34346 ?auto_34352 ) ) ( not ( = ?auto_34347 ?auto_34352 ) ) ( not ( = ?auto_34355 ?auto_34352 ) ) ( not ( = ?auto_34351 ?auto_34352 ) ) ( not ( = ?auto_34357 ?auto_34352 ) ) ( not ( = ?auto_34359 ?auto_34352 ) ) ( AVAILABLE ?auto_34353 ) ( IN ?auto_34349 ?auto_34360 ) ( TRUCK-AT ?auto_34360 ?auto_34363 ) ( not ( = ?auto_34363 ?auto_34348 ) ) ( not ( = ?auto_34358 ?auto_34363 ) ) ( not ( = ?auto_34350 ?auto_34363 ) ) ( not ( = ?auto_34362 ?auto_34363 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34360 ?auto_34363 ?auto_34348 )
      ( MAKE-2CRATE ?auto_34355 ?auto_34346 ?auto_34347 )
      ( MAKE-1CRATE-VERIFY ?auto_34346 ?auto_34347 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34364 - SURFACE
      ?auto_34365 - SURFACE
      ?auto_34366 - SURFACE
    )
    :vars
    (
      ?auto_34373 - HOIST
      ?auto_34372 - PLACE
      ?auto_34375 - PLACE
      ?auto_34376 - HOIST
      ?auto_34377 - SURFACE
      ?auto_34369 - PLACE
      ?auto_34371 - HOIST
      ?auto_34367 - SURFACE
      ?auto_34379 - SURFACE
      ?auto_34368 - PLACE
      ?auto_34381 - HOIST
      ?auto_34378 - SURFACE
      ?auto_34380 - SURFACE
      ?auto_34370 - TRUCK
      ?auto_34374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34373 ?auto_34372 ) ( IS-CRATE ?auto_34366 ) ( not ( = ?auto_34365 ?auto_34366 ) ) ( not ( = ?auto_34364 ?auto_34365 ) ) ( not ( = ?auto_34364 ?auto_34366 ) ) ( not ( = ?auto_34375 ?auto_34372 ) ) ( HOIST-AT ?auto_34376 ?auto_34375 ) ( not ( = ?auto_34373 ?auto_34376 ) ) ( AVAILABLE ?auto_34376 ) ( SURFACE-AT ?auto_34366 ?auto_34375 ) ( ON ?auto_34366 ?auto_34377 ) ( CLEAR ?auto_34366 ) ( not ( = ?auto_34365 ?auto_34377 ) ) ( not ( = ?auto_34366 ?auto_34377 ) ) ( not ( = ?auto_34364 ?auto_34377 ) ) ( IS-CRATE ?auto_34365 ) ( not ( = ?auto_34369 ?auto_34372 ) ) ( not ( = ?auto_34375 ?auto_34369 ) ) ( HOIST-AT ?auto_34371 ?auto_34369 ) ( not ( = ?auto_34373 ?auto_34371 ) ) ( not ( = ?auto_34376 ?auto_34371 ) ) ( AVAILABLE ?auto_34371 ) ( SURFACE-AT ?auto_34365 ?auto_34369 ) ( ON ?auto_34365 ?auto_34367 ) ( CLEAR ?auto_34365 ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( not ( = ?auto_34366 ?auto_34367 ) ) ( not ( = ?auto_34364 ?auto_34367 ) ) ( not ( = ?auto_34377 ?auto_34367 ) ) ( IS-CRATE ?auto_34364 ) ( not ( = ?auto_34379 ?auto_34364 ) ) ( not ( = ?auto_34365 ?auto_34379 ) ) ( not ( = ?auto_34366 ?auto_34379 ) ) ( not ( = ?auto_34377 ?auto_34379 ) ) ( not ( = ?auto_34367 ?auto_34379 ) ) ( not ( = ?auto_34368 ?auto_34372 ) ) ( not ( = ?auto_34375 ?auto_34368 ) ) ( not ( = ?auto_34369 ?auto_34368 ) ) ( HOIST-AT ?auto_34381 ?auto_34368 ) ( not ( = ?auto_34373 ?auto_34381 ) ) ( not ( = ?auto_34376 ?auto_34381 ) ) ( not ( = ?auto_34371 ?auto_34381 ) ) ( AVAILABLE ?auto_34381 ) ( SURFACE-AT ?auto_34364 ?auto_34368 ) ( ON ?auto_34364 ?auto_34378 ) ( CLEAR ?auto_34364 ) ( not ( = ?auto_34365 ?auto_34378 ) ) ( not ( = ?auto_34366 ?auto_34378 ) ) ( not ( = ?auto_34364 ?auto_34378 ) ) ( not ( = ?auto_34377 ?auto_34378 ) ) ( not ( = ?auto_34367 ?auto_34378 ) ) ( not ( = ?auto_34379 ?auto_34378 ) ) ( SURFACE-AT ?auto_34380 ?auto_34372 ) ( CLEAR ?auto_34380 ) ( IS-CRATE ?auto_34379 ) ( not ( = ?auto_34380 ?auto_34379 ) ) ( not ( = ?auto_34365 ?auto_34380 ) ) ( not ( = ?auto_34366 ?auto_34380 ) ) ( not ( = ?auto_34364 ?auto_34380 ) ) ( not ( = ?auto_34377 ?auto_34380 ) ) ( not ( = ?auto_34367 ?auto_34380 ) ) ( not ( = ?auto_34378 ?auto_34380 ) ) ( AVAILABLE ?auto_34373 ) ( IN ?auto_34379 ?auto_34370 ) ( TRUCK-AT ?auto_34370 ?auto_34374 ) ( not ( = ?auto_34374 ?auto_34372 ) ) ( not ( = ?auto_34375 ?auto_34374 ) ) ( not ( = ?auto_34369 ?auto_34374 ) ) ( not ( = ?auto_34368 ?auto_34374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34365 ?auto_34366 )
      ( MAKE-2CRATE-VERIFY ?auto_34364 ?auto_34365 ?auto_34366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34382 - SURFACE
      ?auto_34383 - SURFACE
      ?auto_34384 - SURFACE
      ?auto_34385 - SURFACE
    )
    :vars
    (
      ?auto_34391 - HOIST
      ?auto_34392 - PLACE
      ?auto_34387 - PLACE
      ?auto_34390 - HOIST
      ?auto_34386 - SURFACE
      ?auto_34397 - PLACE
      ?auto_34388 - HOIST
      ?auto_34399 - SURFACE
      ?auto_34393 - PLACE
      ?auto_34396 - HOIST
      ?auto_34398 - SURFACE
      ?auto_34394 - SURFACE
      ?auto_34389 - TRUCK
      ?auto_34395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34391 ?auto_34392 ) ( IS-CRATE ?auto_34385 ) ( not ( = ?auto_34384 ?auto_34385 ) ) ( not ( = ?auto_34383 ?auto_34384 ) ) ( not ( = ?auto_34383 ?auto_34385 ) ) ( not ( = ?auto_34387 ?auto_34392 ) ) ( HOIST-AT ?auto_34390 ?auto_34387 ) ( not ( = ?auto_34391 ?auto_34390 ) ) ( AVAILABLE ?auto_34390 ) ( SURFACE-AT ?auto_34385 ?auto_34387 ) ( ON ?auto_34385 ?auto_34386 ) ( CLEAR ?auto_34385 ) ( not ( = ?auto_34384 ?auto_34386 ) ) ( not ( = ?auto_34385 ?auto_34386 ) ) ( not ( = ?auto_34383 ?auto_34386 ) ) ( IS-CRATE ?auto_34384 ) ( not ( = ?auto_34397 ?auto_34392 ) ) ( not ( = ?auto_34387 ?auto_34397 ) ) ( HOIST-AT ?auto_34388 ?auto_34397 ) ( not ( = ?auto_34391 ?auto_34388 ) ) ( not ( = ?auto_34390 ?auto_34388 ) ) ( AVAILABLE ?auto_34388 ) ( SURFACE-AT ?auto_34384 ?auto_34397 ) ( ON ?auto_34384 ?auto_34399 ) ( CLEAR ?auto_34384 ) ( not ( = ?auto_34384 ?auto_34399 ) ) ( not ( = ?auto_34385 ?auto_34399 ) ) ( not ( = ?auto_34383 ?auto_34399 ) ) ( not ( = ?auto_34386 ?auto_34399 ) ) ( IS-CRATE ?auto_34383 ) ( not ( = ?auto_34382 ?auto_34383 ) ) ( not ( = ?auto_34384 ?auto_34382 ) ) ( not ( = ?auto_34385 ?auto_34382 ) ) ( not ( = ?auto_34386 ?auto_34382 ) ) ( not ( = ?auto_34399 ?auto_34382 ) ) ( not ( = ?auto_34393 ?auto_34392 ) ) ( not ( = ?auto_34387 ?auto_34393 ) ) ( not ( = ?auto_34397 ?auto_34393 ) ) ( HOIST-AT ?auto_34396 ?auto_34393 ) ( not ( = ?auto_34391 ?auto_34396 ) ) ( not ( = ?auto_34390 ?auto_34396 ) ) ( not ( = ?auto_34388 ?auto_34396 ) ) ( AVAILABLE ?auto_34396 ) ( SURFACE-AT ?auto_34383 ?auto_34393 ) ( ON ?auto_34383 ?auto_34398 ) ( CLEAR ?auto_34383 ) ( not ( = ?auto_34384 ?auto_34398 ) ) ( not ( = ?auto_34385 ?auto_34398 ) ) ( not ( = ?auto_34383 ?auto_34398 ) ) ( not ( = ?auto_34386 ?auto_34398 ) ) ( not ( = ?auto_34399 ?auto_34398 ) ) ( not ( = ?auto_34382 ?auto_34398 ) ) ( SURFACE-AT ?auto_34394 ?auto_34392 ) ( CLEAR ?auto_34394 ) ( IS-CRATE ?auto_34382 ) ( not ( = ?auto_34394 ?auto_34382 ) ) ( not ( = ?auto_34384 ?auto_34394 ) ) ( not ( = ?auto_34385 ?auto_34394 ) ) ( not ( = ?auto_34383 ?auto_34394 ) ) ( not ( = ?auto_34386 ?auto_34394 ) ) ( not ( = ?auto_34399 ?auto_34394 ) ) ( not ( = ?auto_34398 ?auto_34394 ) ) ( AVAILABLE ?auto_34391 ) ( IN ?auto_34382 ?auto_34389 ) ( TRUCK-AT ?auto_34389 ?auto_34395 ) ( not ( = ?auto_34395 ?auto_34392 ) ) ( not ( = ?auto_34387 ?auto_34395 ) ) ( not ( = ?auto_34397 ?auto_34395 ) ) ( not ( = ?auto_34393 ?auto_34395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34383 ?auto_34384 ?auto_34385 )
      ( MAKE-3CRATE-VERIFY ?auto_34382 ?auto_34383 ?auto_34384 ?auto_34385 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34400 - SURFACE
      ?auto_34401 - SURFACE
      ?auto_34402 - SURFACE
      ?auto_34403 - SURFACE
      ?auto_34404 - SURFACE
    )
    :vars
    (
      ?auto_34410 - HOIST
      ?auto_34411 - PLACE
      ?auto_34406 - PLACE
      ?auto_34409 - HOIST
      ?auto_34405 - SURFACE
      ?auto_34415 - PLACE
      ?auto_34407 - HOIST
      ?auto_34417 - SURFACE
      ?auto_34412 - PLACE
      ?auto_34414 - HOIST
      ?auto_34416 - SURFACE
      ?auto_34408 - TRUCK
      ?auto_34413 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34410 ?auto_34411 ) ( IS-CRATE ?auto_34404 ) ( not ( = ?auto_34403 ?auto_34404 ) ) ( not ( = ?auto_34402 ?auto_34403 ) ) ( not ( = ?auto_34402 ?auto_34404 ) ) ( not ( = ?auto_34406 ?auto_34411 ) ) ( HOIST-AT ?auto_34409 ?auto_34406 ) ( not ( = ?auto_34410 ?auto_34409 ) ) ( AVAILABLE ?auto_34409 ) ( SURFACE-AT ?auto_34404 ?auto_34406 ) ( ON ?auto_34404 ?auto_34405 ) ( CLEAR ?auto_34404 ) ( not ( = ?auto_34403 ?auto_34405 ) ) ( not ( = ?auto_34404 ?auto_34405 ) ) ( not ( = ?auto_34402 ?auto_34405 ) ) ( IS-CRATE ?auto_34403 ) ( not ( = ?auto_34415 ?auto_34411 ) ) ( not ( = ?auto_34406 ?auto_34415 ) ) ( HOIST-AT ?auto_34407 ?auto_34415 ) ( not ( = ?auto_34410 ?auto_34407 ) ) ( not ( = ?auto_34409 ?auto_34407 ) ) ( AVAILABLE ?auto_34407 ) ( SURFACE-AT ?auto_34403 ?auto_34415 ) ( ON ?auto_34403 ?auto_34417 ) ( CLEAR ?auto_34403 ) ( not ( = ?auto_34403 ?auto_34417 ) ) ( not ( = ?auto_34404 ?auto_34417 ) ) ( not ( = ?auto_34402 ?auto_34417 ) ) ( not ( = ?auto_34405 ?auto_34417 ) ) ( IS-CRATE ?auto_34402 ) ( not ( = ?auto_34401 ?auto_34402 ) ) ( not ( = ?auto_34403 ?auto_34401 ) ) ( not ( = ?auto_34404 ?auto_34401 ) ) ( not ( = ?auto_34405 ?auto_34401 ) ) ( not ( = ?auto_34417 ?auto_34401 ) ) ( not ( = ?auto_34412 ?auto_34411 ) ) ( not ( = ?auto_34406 ?auto_34412 ) ) ( not ( = ?auto_34415 ?auto_34412 ) ) ( HOIST-AT ?auto_34414 ?auto_34412 ) ( not ( = ?auto_34410 ?auto_34414 ) ) ( not ( = ?auto_34409 ?auto_34414 ) ) ( not ( = ?auto_34407 ?auto_34414 ) ) ( AVAILABLE ?auto_34414 ) ( SURFACE-AT ?auto_34402 ?auto_34412 ) ( ON ?auto_34402 ?auto_34416 ) ( CLEAR ?auto_34402 ) ( not ( = ?auto_34403 ?auto_34416 ) ) ( not ( = ?auto_34404 ?auto_34416 ) ) ( not ( = ?auto_34402 ?auto_34416 ) ) ( not ( = ?auto_34405 ?auto_34416 ) ) ( not ( = ?auto_34417 ?auto_34416 ) ) ( not ( = ?auto_34401 ?auto_34416 ) ) ( SURFACE-AT ?auto_34400 ?auto_34411 ) ( CLEAR ?auto_34400 ) ( IS-CRATE ?auto_34401 ) ( not ( = ?auto_34400 ?auto_34401 ) ) ( not ( = ?auto_34403 ?auto_34400 ) ) ( not ( = ?auto_34404 ?auto_34400 ) ) ( not ( = ?auto_34402 ?auto_34400 ) ) ( not ( = ?auto_34405 ?auto_34400 ) ) ( not ( = ?auto_34417 ?auto_34400 ) ) ( not ( = ?auto_34416 ?auto_34400 ) ) ( AVAILABLE ?auto_34410 ) ( IN ?auto_34401 ?auto_34408 ) ( TRUCK-AT ?auto_34408 ?auto_34413 ) ( not ( = ?auto_34413 ?auto_34411 ) ) ( not ( = ?auto_34406 ?auto_34413 ) ) ( not ( = ?auto_34415 ?auto_34413 ) ) ( not ( = ?auto_34412 ?auto_34413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34402 ?auto_34403 ?auto_34404 )
      ( MAKE-4CRATE-VERIFY ?auto_34400 ?auto_34401 ?auto_34402 ?auto_34403 ?auto_34404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34418 - SURFACE
      ?auto_34419 - SURFACE
    )
    :vars
    (
      ?auto_34427 - HOIST
      ?auto_34428 - PLACE
      ?auto_34424 - SURFACE
      ?auto_34421 - PLACE
      ?auto_34426 - HOIST
      ?auto_34420 - SURFACE
      ?auto_34433 - PLACE
      ?auto_34423 - HOIST
      ?auto_34435 - SURFACE
      ?auto_34422 - SURFACE
      ?auto_34429 - PLACE
      ?auto_34432 - HOIST
      ?auto_34434 - SURFACE
      ?auto_34430 - SURFACE
      ?auto_34425 - TRUCK
      ?auto_34431 - PLACE
      ?auto_34436 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34427 ?auto_34428 ) ( IS-CRATE ?auto_34419 ) ( not ( = ?auto_34418 ?auto_34419 ) ) ( not ( = ?auto_34424 ?auto_34418 ) ) ( not ( = ?auto_34424 ?auto_34419 ) ) ( not ( = ?auto_34421 ?auto_34428 ) ) ( HOIST-AT ?auto_34426 ?auto_34421 ) ( not ( = ?auto_34427 ?auto_34426 ) ) ( AVAILABLE ?auto_34426 ) ( SURFACE-AT ?auto_34419 ?auto_34421 ) ( ON ?auto_34419 ?auto_34420 ) ( CLEAR ?auto_34419 ) ( not ( = ?auto_34418 ?auto_34420 ) ) ( not ( = ?auto_34419 ?auto_34420 ) ) ( not ( = ?auto_34424 ?auto_34420 ) ) ( IS-CRATE ?auto_34418 ) ( not ( = ?auto_34433 ?auto_34428 ) ) ( not ( = ?auto_34421 ?auto_34433 ) ) ( HOIST-AT ?auto_34423 ?auto_34433 ) ( not ( = ?auto_34427 ?auto_34423 ) ) ( not ( = ?auto_34426 ?auto_34423 ) ) ( AVAILABLE ?auto_34423 ) ( SURFACE-AT ?auto_34418 ?auto_34433 ) ( ON ?auto_34418 ?auto_34435 ) ( CLEAR ?auto_34418 ) ( not ( = ?auto_34418 ?auto_34435 ) ) ( not ( = ?auto_34419 ?auto_34435 ) ) ( not ( = ?auto_34424 ?auto_34435 ) ) ( not ( = ?auto_34420 ?auto_34435 ) ) ( IS-CRATE ?auto_34424 ) ( not ( = ?auto_34422 ?auto_34424 ) ) ( not ( = ?auto_34418 ?auto_34422 ) ) ( not ( = ?auto_34419 ?auto_34422 ) ) ( not ( = ?auto_34420 ?auto_34422 ) ) ( not ( = ?auto_34435 ?auto_34422 ) ) ( not ( = ?auto_34429 ?auto_34428 ) ) ( not ( = ?auto_34421 ?auto_34429 ) ) ( not ( = ?auto_34433 ?auto_34429 ) ) ( HOIST-AT ?auto_34432 ?auto_34429 ) ( not ( = ?auto_34427 ?auto_34432 ) ) ( not ( = ?auto_34426 ?auto_34432 ) ) ( not ( = ?auto_34423 ?auto_34432 ) ) ( AVAILABLE ?auto_34432 ) ( SURFACE-AT ?auto_34424 ?auto_34429 ) ( ON ?auto_34424 ?auto_34434 ) ( CLEAR ?auto_34424 ) ( not ( = ?auto_34418 ?auto_34434 ) ) ( not ( = ?auto_34419 ?auto_34434 ) ) ( not ( = ?auto_34424 ?auto_34434 ) ) ( not ( = ?auto_34420 ?auto_34434 ) ) ( not ( = ?auto_34435 ?auto_34434 ) ) ( not ( = ?auto_34422 ?auto_34434 ) ) ( SURFACE-AT ?auto_34430 ?auto_34428 ) ( CLEAR ?auto_34430 ) ( IS-CRATE ?auto_34422 ) ( not ( = ?auto_34430 ?auto_34422 ) ) ( not ( = ?auto_34418 ?auto_34430 ) ) ( not ( = ?auto_34419 ?auto_34430 ) ) ( not ( = ?auto_34424 ?auto_34430 ) ) ( not ( = ?auto_34420 ?auto_34430 ) ) ( not ( = ?auto_34435 ?auto_34430 ) ) ( not ( = ?auto_34434 ?auto_34430 ) ) ( AVAILABLE ?auto_34427 ) ( TRUCK-AT ?auto_34425 ?auto_34431 ) ( not ( = ?auto_34431 ?auto_34428 ) ) ( not ( = ?auto_34421 ?auto_34431 ) ) ( not ( = ?auto_34433 ?auto_34431 ) ) ( not ( = ?auto_34429 ?auto_34431 ) ) ( HOIST-AT ?auto_34436 ?auto_34431 ) ( LIFTING ?auto_34436 ?auto_34422 ) ( not ( = ?auto_34427 ?auto_34436 ) ) ( not ( = ?auto_34426 ?auto_34436 ) ) ( not ( = ?auto_34423 ?auto_34436 ) ) ( not ( = ?auto_34432 ?auto_34436 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34436 ?auto_34422 ?auto_34425 ?auto_34431 )
      ( MAKE-2CRATE ?auto_34424 ?auto_34418 ?auto_34419 )
      ( MAKE-1CRATE-VERIFY ?auto_34418 ?auto_34419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34437 - SURFACE
      ?auto_34438 - SURFACE
      ?auto_34439 - SURFACE
    )
    :vars
    (
      ?auto_34442 - HOIST
      ?auto_34449 - PLACE
      ?auto_34451 - PLACE
      ?auto_34446 - HOIST
      ?auto_34450 - SURFACE
      ?auto_34454 - PLACE
      ?auto_34445 - HOIST
      ?auto_34452 - SURFACE
      ?auto_34440 - SURFACE
      ?auto_34455 - PLACE
      ?auto_34447 - HOIST
      ?auto_34443 - SURFACE
      ?auto_34444 - SURFACE
      ?auto_34441 - TRUCK
      ?auto_34448 - PLACE
      ?auto_34453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34442 ?auto_34449 ) ( IS-CRATE ?auto_34439 ) ( not ( = ?auto_34438 ?auto_34439 ) ) ( not ( = ?auto_34437 ?auto_34438 ) ) ( not ( = ?auto_34437 ?auto_34439 ) ) ( not ( = ?auto_34451 ?auto_34449 ) ) ( HOIST-AT ?auto_34446 ?auto_34451 ) ( not ( = ?auto_34442 ?auto_34446 ) ) ( AVAILABLE ?auto_34446 ) ( SURFACE-AT ?auto_34439 ?auto_34451 ) ( ON ?auto_34439 ?auto_34450 ) ( CLEAR ?auto_34439 ) ( not ( = ?auto_34438 ?auto_34450 ) ) ( not ( = ?auto_34439 ?auto_34450 ) ) ( not ( = ?auto_34437 ?auto_34450 ) ) ( IS-CRATE ?auto_34438 ) ( not ( = ?auto_34454 ?auto_34449 ) ) ( not ( = ?auto_34451 ?auto_34454 ) ) ( HOIST-AT ?auto_34445 ?auto_34454 ) ( not ( = ?auto_34442 ?auto_34445 ) ) ( not ( = ?auto_34446 ?auto_34445 ) ) ( AVAILABLE ?auto_34445 ) ( SURFACE-AT ?auto_34438 ?auto_34454 ) ( ON ?auto_34438 ?auto_34452 ) ( CLEAR ?auto_34438 ) ( not ( = ?auto_34438 ?auto_34452 ) ) ( not ( = ?auto_34439 ?auto_34452 ) ) ( not ( = ?auto_34437 ?auto_34452 ) ) ( not ( = ?auto_34450 ?auto_34452 ) ) ( IS-CRATE ?auto_34437 ) ( not ( = ?auto_34440 ?auto_34437 ) ) ( not ( = ?auto_34438 ?auto_34440 ) ) ( not ( = ?auto_34439 ?auto_34440 ) ) ( not ( = ?auto_34450 ?auto_34440 ) ) ( not ( = ?auto_34452 ?auto_34440 ) ) ( not ( = ?auto_34455 ?auto_34449 ) ) ( not ( = ?auto_34451 ?auto_34455 ) ) ( not ( = ?auto_34454 ?auto_34455 ) ) ( HOIST-AT ?auto_34447 ?auto_34455 ) ( not ( = ?auto_34442 ?auto_34447 ) ) ( not ( = ?auto_34446 ?auto_34447 ) ) ( not ( = ?auto_34445 ?auto_34447 ) ) ( AVAILABLE ?auto_34447 ) ( SURFACE-AT ?auto_34437 ?auto_34455 ) ( ON ?auto_34437 ?auto_34443 ) ( CLEAR ?auto_34437 ) ( not ( = ?auto_34438 ?auto_34443 ) ) ( not ( = ?auto_34439 ?auto_34443 ) ) ( not ( = ?auto_34437 ?auto_34443 ) ) ( not ( = ?auto_34450 ?auto_34443 ) ) ( not ( = ?auto_34452 ?auto_34443 ) ) ( not ( = ?auto_34440 ?auto_34443 ) ) ( SURFACE-AT ?auto_34444 ?auto_34449 ) ( CLEAR ?auto_34444 ) ( IS-CRATE ?auto_34440 ) ( not ( = ?auto_34444 ?auto_34440 ) ) ( not ( = ?auto_34438 ?auto_34444 ) ) ( not ( = ?auto_34439 ?auto_34444 ) ) ( not ( = ?auto_34437 ?auto_34444 ) ) ( not ( = ?auto_34450 ?auto_34444 ) ) ( not ( = ?auto_34452 ?auto_34444 ) ) ( not ( = ?auto_34443 ?auto_34444 ) ) ( AVAILABLE ?auto_34442 ) ( TRUCK-AT ?auto_34441 ?auto_34448 ) ( not ( = ?auto_34448 ?auto_34449 ) ) ( not ( = ?auto_34451 ?auto_34448 ) ) ( not ( = ?auto_34454 ?auto_34448 ) ) ( not ( = ?auto_34455 ?auto_34448 ) ) ( HOIST-AT ?auto_34453 ?auto_34448 ) ( LIFTING ?auto_34453 ?auto_34440 ) ( not ( = ?auto_34442 ?auto_34453 ) ) ( not ( = ?auto_34446 ?auto_34453 ) ) ( not ( = ?auto_34445 ?auto_34453 ) ) ( not ( = ?auto_34447 ?auto_34453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34438 ?auto_34439 )
      ( MAKE-2CRATE-VERIFY ?auto_34437 ?auto_34438 ?auto_34439 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34456 - SURFACE
      ?auto_34457 - SURFACE
      ?auto_34458 - SURFACE
      ?auto_34459 - SURFACE
    )
    :vars
    (
      ?auto_34474 - HOIST
      ?auto_34473 - PLACE
      ?auto_34465 - PLACE
      ?auto_34463 - HOIST
      ?auto_34470 - SURFACE
      ?auto_34461 - PLACE
      ?auto_34469 - HOIST
      ?auto_34467 - SURFACE
      ?auto_34460 - PLACE
      ?auto_34462 - HOIST
      ?auto_34472 - SURFACE
      ?auto_34464 - SURFACE
      ?auto_34468 - TRUCK
      ?auto_34466 - PLACE
      ?auto_34471 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34474 ?auto_34473 ) ( IS-CRATE ?auto_34459 ) ( not ( = ?auto_34458 ?auto_34459 ) ) ( not ( = ?auto_34457 ?auto_34458 ) ) ( not ( = ?auto_34457 ?auto_34459 ) ) ( not ( = ?auto_34465 ?auto_34473 ) ) ( HOIST-AT ?auto_34463 ?auto_34465 ) ( not ( = ?auto_34474 ?auto_34463 ) ) ( AVAILABLE ?auto_34463 ) ( SURFACE-AT ?auto_34459 ?auto_34465 ) ( ON ?auto_34459 ?auto_34470 ) ( CLEAR ?auto_34459 ) ( not ( = ?auto_34458 ?auto_34470 ) ) ( not ( = ?auto_34459 ?auto_34470 ) ) ( not ( = ?auto_34457 ?auto_34470 ) ) ( IS-CRATE ?auto_34458 ) ( not ( = ?auto_34461 ?auto_34473 ) ) ( not ( = ?auto_34465 ?auto_34461 ) ) ( HOIST-AT ?auto_34469 ?auto_34461 ) ( not ( = ?auto_34474 ?auto_34469 ) ) ( not ( = ?auto_34463 ?auto_34469 ) ) ( AVAILABLE ?auto_34469 ) ( SURFACE-AT ?auto_34458 ?auto_34461 ) ( ON ?auto_34458 ?auto_34467 ) ( CLEAR ?auto_34458 ) ( not ( = ?auto_34458 ?auto_34467 ) ) ( not ( = ?auto_34459 ?auto_34467 ) ) ( not ( = ?auto_34457 ?auto_34467 ) ) ( not ( = ?auto_34470 ?auto_34467 ) ) ( IS-CRATE ?auto_34457 ) ( not ( = ?auto_34456 ?auto_34457 ) ) ( not ( = ?auto_34458 ?auto_34456 ) ) ( not ( = ?auto_34459 ?auto_34456 ) ) ( not ( = ?auto_34470 ?auto_34456 ) ) ( not ( = ?auto_34467 ?auto_34456 ) ) ( not ( = ?auto_34460 ?auto_34473 ) ) ( not ( = ?auto_34465 ?auto_34460 ) ) ( not ( = ?auto_34461 ?auto_34460 ) ) ( HOIST-AT ?auto_34462 ?auto_34460 ) ( not ( = ?auto_34474 ?auto_34462 ) ) ( not ( = ?auto_34463 ?auto_34462 ) ) ( not ( = ?auto_34469 ?auto_34462 ) ) ( AVAILABLE ?auto_34462 ) ( SURFACE-AT ?auto_34457 ?auto_34460 ) ( ON ?auto_34457 ?auto_34472 ) ( CLEAR ?auto_34457 ) ( not ( = ?auto_34458 ?auto_34472 ) ) ( not ( = ?auto_34459 ?auto_34472 ) ) ( not ( = ?auto_34457 ?auto_34472 ) ) ( not ( = ?auto_34470 ?auto_34472 ) ) ( not ( = ?auto_34467 ?auto_34472 ) ) ( not ( = ?auto_34456 ?auto_34472 ) ) ( SURFACE-AT ?auto_34464 ?auto_34473 ) ( CLEAR ?auto_34464 ) ( IS-CRATE ?auto_34456 ) ( not ( = ?auto_34464 ?auto_34456 ) ) ( not ( = ?auto_34458 ?auto_34464 ) ) ( not ( = ?auto_34459 ?auto_34464 ) ) ( not ( = ?auto_34457 ?auto_34464 ) ) ( not ( = ?auto_34470 ?auto_34464 ) ) ( not ( = ?auto_34467 ?auto_34464 ) ) ( not ( = ?auto_34472 ?auto_34464 ) ) ( AVAILABLE ?auto_34474 ) ( TRUCK-AT ?auto_34468 ?auto_34466 ) ( not ( = ?auto_34466 ?auto_34473 ) ) ( not ( = ?auto_34465 ?auto_34466 ) ) ( not ( = ?auto_34461 ?auto_34466 ) ) ( not ( = ?auto_34460 ?auto_34466 ) ) ( HOIST-AT ?auto_34471 ?auto_34466 ) ( LIFTING ?auto_34471 ?auto_34456 ) ( not ( = ?auto_34474 ?auto_34471 ) ) ( not ( = ?auto_34463 ?auto_34471 ) ) ( not ( = ?auto_34469 ?auto_34471 ) ) ( not ( = ?auto_34462 ?auto_34471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34457 ?auto_34458 ?auto_34459 )
      ( MAKE-3CRATE-VERIFY ?auto_34456 ?auto_34457 ?auto_34458 ?auto_34459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34475 - SURFACE
      ?auto_34476 - SURFACE
      ?auto_34477 - SURFACE
      ?auto_34478 - SURFACE
      ?auto_34479 - SURFACE
    )
    :vars
    (
      ?auto_34493 - HOIST
      ?auto_34492 - PLACE
      ?auto_34484 - PLACE
      ?auto_34483 - HOIST
      ?auto_34489 - SURFACE
      ?auto_34481 - PLACE
      ?auto_34488 - HOIST
      ?auto_34486 - SURFACE
      ?auto_34480 - PLACE
      ?auto_34482 - HOIST
      ?auto_34491 - SURFACE
      ?auto_34487 - TRUCK
      ?auto_34485 - PLACE
      ?auto_34490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34493 ?auto_34492 ) ( IS-CRATE ?auto_34479 ) ( not ( = ?auto_34478 ?auto_34479 ) ) ( not ( = ?auto_34477 ?auto_34478 ) ) ( not ( = ?auto_34477 ?auto_34479 ) ) ( not ( = ?auto_34484 ?auto_34492 ) ) ( HOIST-AT ?auto_34483 ?auto_34484 ) ( not ( = ?auto_34493 ?auto_34483 ) ) ( AVAILABLE ?auto_34483 ) ( SURFACE-AT ?auto_34479 ?auto_34484 ) ( ON ?auto_34479 ?auto_34489 ) ( CLEAR ?auto_34479 ) ( not ( = ?auto_34478 ?auto_34489 ) ) ( not ( = ?auto_34479 ?auto_34489 ) ) ( not ( = ?auto_34477 ?auto_34489 ) ) ( IS-CRATE ?auto_34478 ) ( not ( = ?auto_34481 ?auto_34492 ) ) ( not ( = ?auto_34484 ?auto_34481 ) ) ( HOIST-AT ?auto_34488 ?auto_34481 ) ( not ( = ?auto_34493 ?auto_34488 ) ) ( not ( = ?auto_34483 ?auto_34488 ) ) ( AVAILABLE ?auto_34488 ) ( SURFACE-AT ?auto_34478 ?auto_34481 ) ( ON ?auto_34478 ?auto_34486 ) ( CLEAR ?auto_34478 ) ( not ( = ?auto_34478 ?auto_34486 ) ) ( not ( = ?auto_34479 ?auto_34486 ) ) ( not ( = ?auto_34477 ?auto_34486 ) ) ( not ( = ?auto_34489 ?auto_34486 ) ) ( IS-CRATE ?auto_34477 ) ( not ( = ?auto_34476 ?auto_34477 ) ) ( not ( = ?auto_34478 ?auto_34476 ) ) ( not ( = ?auto_34479 ?auto_34476 ) ) ( not ( = ?auto_34489 ?auto_34476 ) ) ( not ( = ?auto_34486 ?auto_34476 ) ) ( not ( = ?auto_34480 ?auto_34492 ) ) ( not ( = ?auto_34484 ?auto_34480 ) ) ( not ( = ?auto_34481 ?auto_34480 ) ) ( HOIST-AT ?auto_34482 ?auto_34480 ) ( not ( = ?auto_34493 ?auto_34482 ) ) ( not ( = ?auto_34483 ?auto_34482 ) ) ( not ( = ?auto_34488 ?auto_34482 ) ) ( AVAILABLE ?auto_34482 ) ( SURFACE-AT ?auto_34477 ?auto_34480 ) ( ON ?auto_34477 ?auto_34491 ) ( CLEAR ?auto_34477 ) ( not ( = ?auto_34478 ?auto_34491 ) ) ( not ( = ?auto_34479 ?auto_34491 ) ) ( not ( = ?auto_34477 ?auto_34491 ) ) ( not ( = ?auto_34489 ?auto_34491 ) ) ( not ( = ?auto_34486 ?auto_34491 ) ) ( not ( = ?auto_34476 ?auto_34491 ) ) ( SURFACE-AT ?auto_34475 ?auto_34492 ) ( CLEAR ?auto_34475 ) ( IS-CRATE ?auto_34476 ) ( not ( = ?auto_34475 ?auto_34476 ) ) ( not ( = ?auto_34478 ?auto_34475 ) ) ( not ( = ?auto_34479 ?auto_34475 ) ) ( not ( = ?auto_34477 ?auto_34475 ) ) ( not ( = ?auto_34489 ?auto_34475 ) ) ( not ( = ?auto_34486 ?auto_34475 ) ) ( not ( = ?auto_34491 ?auto_34475 ) ) ( AVAILABLE ?auto_34493 ) ( TRUCK-AT ?auto_34487 ?auto_34485 ) ( not ( = ?auto_34485 ?auto_34492 ) ) ( not ( = ?auto_34484 ?auto_34485 ) ) ( not ( = ?auto_34481 ?auto_34485 ) ) ( not ( = ?auto_34480 ?auto_34485 ) ) ( HOIST-AT ?auto_34490 ?auto_34485 ) ( LIFTING ?auto_34490 ?auto_34476 ) ( not ( = ?auto_34493 ?auto_34490 ) ) ( not ( = ?auto_34483 ?auto_34490 ) ) ( not ( = ?auto_34488 ?auto_34490 ) ) ( not ( = ?auto_34482 ?auto_34490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34477 ?auto_34478 ?auto_34479 )
      ( MAKE-4CRATE-VERIFY ?auto_34475 ?auto_34476 ?auto_34477 ?auto_34478 ?auto_34479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34494 - SURFACE
      ?auto_34495 - SURFACE
    )
    :vars
    (
      ?auto_34512 - HOIST
      ?auto_34511 - PLACE
      ?auto_34507 - SURFACE
      ?auto_34502 - PLACE
      ?auto_34500 - HOIST
      ?auto_34508 - SURFACE
      ?auto_34498 - PLACE
      ?auto_34506 - HOIST
      ?auto_34504 - SURFACE
      ?auto_34496 - SURFACE
      ?auto_34497 - PLACE
      ?auto_34499 - HOIST
      ?auto_34510 - SURFACE
      ?auto_34501 - SURFACE
      ?auto_34505 - TRUCK
      ?auto_34503 - PLACE
      ?auto_34509 - HOIST
      ?auto_34513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34512 ?auto_34511 ) ( IS-CRATE ?auto_34495 ) ( not ( = ?auto_34494 ?auto_34495 ) ) ( not ( = ?auto_34507 ?auto_34494 ) ) ( not ( = ?auto_34507 ?auto_34495 ) ) ( not ( = ?auto_34502 ?auto_34511 ) ) ( HOIST-AT ?auto_34500 ?auto_34502 ) ( not ( = ?auto_34512 ?auto_34500 ) ) ( AVAILABLE ?auto_34500 ) ( SURFACE-AT ?auto_34495 ?auto_34502 ) ( ON ?auto_34495 ?auto_34508 ) ( CLEAR ?auto_34495 ) ( not ( = ?auto_34494 ?auto_34508 ) ) ( not ( = ?auto_34495 ?auto_34508 ) ) ( not ( = ?auto_34507 ?auto_34508 ) ) ( IS-CRATE ?auto_34494 ) ( not ( = ?auto_34498 ?auto_34511 ) ) ( not ( = ?auto_34502 ?auto_34498 ) ) ( HOIST-AT ?auto_34506 ?auto_34498 ) ( not ( = ?auto_34512 ?auto_34506 ) ) ( not ( = ?auto_34500 ?auto_34506 ) ) ( AVAILABLE ?auto_34506 ) ( SURFACE-AT ?auto_34494 ?auto_34498 ) ( ON ?auto_34494 ?auto_34504 ) ( CLEAR ?auto_34494 ) ( not ( = ?auto_34494 ?auto_34504 ) ) ( not ( = ?auto_34495 ?auto_34504 ) ) ( not ( = ?auto_34507 ?auto_34504 ) ) ( not ( = ?auto_34508 ?auto_34504 ) ) ( IS-CRATE ?auto_34507 ) ( not ( = ?auto_34496 ?auto_34507 ) ) ( not ( = ?auto_34494 ?auto_34496 ) ) ( not ( = ?auto_34495 ?auto_34496 ) ) ( not ( = ?auto_34508 ?auto_34496 ) ) ( not ( = ?auto_34504 ?auto_34496 ) ) ( not ( = ?auto_34497 ?auto_34511 ) ) ( not ( = ?auto_34502 ?auto_34497 ) ) ( not ( = ?auto_34498 ?auto_34497 ) ) ( HOIST-AT ?auto_34499 ?auto_34497 ) ( not ( = ?auto_34512 ?auto_34499 ) ) ( not ( = ?auto_34500 ?auto_34499 ) ) ( not ( = ?auto_34506 ?auto_34499 ) ) ( AVAILABLE ?auto_34499 ) ( SURFACE-AT ?auto_34507 ?auto_34497 ) ( ON ?auto_34507 ?auto_34510 ) ( CLEAR ?auto_34507 ) ( not ( = ?auto_34494 ?auto_34510 ) ) ( not ( = ?auto_34495 ?auto_34510 ) ) ( not ( = ?auto_34507 ?auto_34510 ) ) ( not ( = ?auto_34508 ?auto_34510 ) ) ( not ( = ?auto_34504 ?auto_34510 ) ) ( not ( = ?auto_34496 ?auto_34510 ) ) ( SURFACE-AT ?auto_34501 ?auto_34511 ) ( CLEAR ?auto_34501 ) ( IS-CRATE ?auto_34496 ) ( not ( = ?auto_34501 ?auto_34496 ) ) ( not ( = ?auto_34494 ?auto_34501 ) ) ( not ( = ?auto_34495 ?auto_34501 ) ) ( not ( = ?auto_34507 ?auto_34501 ) ) ( not ( = ?auto_34508 ?auto_34501 ) ) ( not ( = ?auto_34504 ?auto_34501 ) ) ( not ( = ?auto_34510 ?auto_34501 ) ) ( AVAILABLE ?auto_34512 ) ( TRUCK-AT ?auto_34505 ?auto_34503 ) ( not ( = ?auto_34503 ?auto_34511 ) ) ( not ( = ?auto_34502 ?auto_34503 ) ) ( not ( = ?auto_34498 ?auto_34503 ) ) ( not ( = ?auto_34497 ?auto_34503 ) ) ( HOIST-AT ?auto_34509 ?auto_34503 ) ( not ( = ?auto_34512 ?auto_34509 ) ) ( not ( = ?auto_34500 ?auto_34509 ) ) ( not ( = ?auto_34506 ?auto_34509 ) ) ( not ( = ?auto_34499 ?auto_34509 ) ) ( AVAILABLE ?auto_34509 ) ( SURFACE-AT ?auto_34496 ?auto_34503 ) ( ON ?auto_34496 ?auto_34513 ) ( CLEAR ?auto_34496 ) ( not ( = ?auto_34494 ?auto_34513 ) ) ( not ( = ?auto_34495 ?auto_34513 ) ) ( not ( = ?auto_34507 ?auto_34513 ) ) ( not ( = ?auto_34508 ?auto_34513 ) ) ( not ( = ?auto_34504 ?auto_34513 ) ) ( not ( = ?auto_34496 ?auto_34513 ) ) ( not ( = ?auto_34510 ?auto_34513 ) ) ( not ( = ?auto_34501 ?auto_34513 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34509 ?auto_34496 ?auto_34513 ?auto_34503 )
      ( MAKE-2CRATE ?auto_34507 ?auto_34494 ?auto_34495 )
      ( MAKE-1CRATE-VERIFY ?auto_34494 ?auto_34495 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34514 - SURFACE
      ?auto_34515 - SURFACE
      ?auto_34516 - SURFACE
    )
    :vars
    (
      ?auto_34525 - HOIST
      ?auto_34528 - PLACE
      ?auto_34532 - PLACE
      ?auto_34518 - HOIST
      ?auto_34531 - SURFACE
      ?auto_34523 - PLACE
      ?auto_34520 - HOIST
      ?auto_34530 - SURFACE
      ?auto_34524 - SURFACE
      ?auto_34533 - PLACE
      ?auto_34521 - HOIST
      ?auto_34519 - SURFACE
      ?auto_34517 - SURFACE
      ?auto_34526 - TRUCK
      ?auto_34527 - PLACE
      ?auto_34529 - HOIST
      ?auto_34522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34525 ?auto_34528 ) ( IS-CRATE ?auto_34516 ) ( not ( = ?auto_34515 ?auto_34516 ) ) ( not ( = ?auto_34514 ?auto_34515 ) ) ( not ( = ?auto_34514 ?auto_34516 ) ) ( not ( = ?auto_34532 ?auto_34528 ) ) ( HOIST-AT ?auto_34518 ?auto_34532 ) ( not ( = ?auto_34525 ?auto_34518 ) ) ( AVAILABLE ?auto_34518 ) ( SURFACE-AT ?auto_34516 ?auto_34532 ) ( ON ?auto_34516 ?auto_34531 ) ( CLEAR ?auto_34516 ) ( not ( = ?auto_34515 ?auto_34531 ) ) ( not ( = ?auto_34516 ?auto_34531 ) ) ( not ( = ?auto_34514 ?auto_34531 ) ) ( IS-CRATE ?auto_34515 ) ( not ( = ?auto_34523 ?auto_34528 ) ) ( not ( = ?auto_34532 ?auto_34523 ) ) ( HOIST-AT ?auto_34520 ?auto_34523 ) ( not ( = ?auto_34525 ?auto_34520 ) ) ( not ( = ?auto_34518 ?auto_34520 ) ) ( AVAILABLE ?auto_34520 ) ( SURFACE-AT ?auto_34515 ?auto_34523 ) ( ON ?auto_34515 ?auto_34530 ) ( CLEAR ?auto_34515 ) ( not ( = ?auto_34515 ?auto_34530 ) ) ( not ( = ?auto_34516 ?auto_34530 ) ) ( not ( = ?auto_34514 ?auto_34530 ) ) ( not ( = ?auto_34531 ?auto_34530 ) ) ( IS-CRATE ?auto_34514 ) ( not ( = ?auto_34524 ?auto_34514 ) ) ( not ( = ?auto_34515 ?auto_34524 ) ) ( not ( = ?auto_34516 ?auto_34524 ) ) ( not ( = ?auto_34531 ?auto_34524 ) ) ( not ( = ?auto_34530 ?auto_34524 ) ) ( not ( = ?auto_34533 ?auto_34528 ) ) ( not ( = ?auto_34532 ?auto_34533 ) ) ( not ( = ?auto_34523 ?auto_34533 ) ) ( HOIST-AT ?auto_34521 ?auto_34533 ) ( not ( = ?auto_34525 ?auto_34521 ) ) ( not ( = ?auto_34518 ?auto_34521 ) ) ( not ( = ?auto_34520 ?auto_34521 ) ) ( AVAILABLE ?auto_34521 ) ( SURFACE-AT ?auto_34514 ?auto_34533 ) ( ON ?auto_34514 ?auto_34519 ) ( CLEAR ?auto_34514 ) ( not ( = ?auto_34515 ?auto_34519 ) ) ( not ( = ?auto_34516 ?auto_34519 ) ) ( not ( = ?auto_34514 ?auto_34519 ) ) ( not ( = ?auto_34531 ?auto_34519 ) ) ( not ( = ?auto_34530 ?auto_34519 ) ) ( not ( = ?auto_34524 ?auto_34519 ) ) ( SURFACE-AT ?auto_34517 ?auto_34528 ) ( CLEAR ?auto_34517 ) ( IS-CRATE ?auto_34524 ) ( not ( = ?auto_34517 ?auto_34524 ) ) ( not ( = ?auto_34515 ?auto_34517 ) ) ( not ( = ?auto_34516 ?auto_34517 ) ) ( not ( = ?auto_34514 ?auto_34517 ) ) ( not ( = ?auto_34531 ?auto_34517 ) ) ( not ( = ?auto_34530 ?auto_34517 ) ) ( not ( = ?auto_34519 ?auto_34517 ) ) ( AVAILABLE ?auto_34525 ) ( TRUCK-AT ?auto_34526 ?auto_34527 ) ( not ( = ?auto_34527 ?auto_34528 ) ) ( not ( = ?auto_34532 ?auto_34527 ) ) ( not ( = ?auto_34523 ?auto_34527 ) ) ( not ( = ?auto_34533 ?auto_34527 ) ) ( HOIST-AT ?auto_34529 ?auto_34527 ) ( not ( = ?auto_34525 ?auto_34529 ) ) ( not ( = ?auto_34518 ?auto_34529 ) ) ( not ( = ?auto_34520 ?auto_34529 ) ) ( not ( = ?auto_34521 ?auto_34529 ) ) ( AVAILABLE ?auto_34529 ) ( SURFACE-AT ?auto_34524 ?auto_34527 ) ( ON ?auto_34524 ?auto_34522 ) ( CLEAR ?auto_34524 ) ( not ( = ?auto_34515 ?auto_34522 ) ) ( not ( = ?auto_34516 ?auto_34522 ) ) ( not ( = ?auto_34514 ?auto_34522 ) ) ( not ( = ?auto_34531 ?auto_34522 ) ) ( not ( = ?auto_34530 ?auto_34522 ) ) ( not ( = ?auto_34524 ?auto_34522 ) ) ( not ( = ?auto_34519 ?auto_34522 ) ) ( not ( = ?auto_34517 ?auto_34522 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34515 ?auto_34516 )
      ( MAKE-2CRATE-VERIFY ?auto_34514 ?auto_34515 ?auto_34516 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34534 - SURFACE
      ?auto_34535 - SURFACE
      ?auto_34536 - SURFACE
      ?auto_34537 - SURFACE
    )
    :vars
    (
      ?auto_34547 - HOIST
      ?auto_34548 - PLACE
      ?auto_34549 - PLACE
      ?auto_34538 - HOIST
      ?auto_34552 - SURFACE
      ?auto_34541 - PLACE
      ?auto_34542 - HOIST
      ?auto_34545 - SURFACE
      ?auto_34539 - PLACE
      ?auto_34551 - HOIST
      ?auto_34546 - SURFACE
      ?auto_34550 - SURFACE
      ?auto_34540 - TRUCK
      ?auto_34543 - PLACE
      ?auto_34544 - HOIST
      ?auto_34553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34547 ?auto_34548 ) ( IS-CRATE ?auto_34537 ) ( not ( = ?auto_34536 ?auto_34537 ) ) ( not ( = ?auto_34535 ?auto_34536 ) ) ( not ( = ?auto_34535 ?auto_34537 ) ) ( not ( = ?auto_34549 ?auto_34548 ) ) ( HOIST-AT ?auto_34538 ?auto_34549 ) ( not ( = ?auto_34547 ?auto_34538 ) ) ( AVAILABLE ?auto_34538 ) ( SURFACE-AT ?auto_34537 ?auto_34549 ) ( ON ?auto_34537 ?auto_34552 ) ( CLEAR ?auto_34537 ) ( not ( = ?auto_34536 ?auto_34552 ) ) ( not ( = ?auto_34537 ?auto_34552 ) ) ( not ( = ?auto_34535 ?auto_34552 ) ) ( IS-CRATE ?auto_34536 ) ( not ( = ?auto_34541 ?auto_34548 ) ) ( not ( = ?auto_34549 ?auto_34541 ) ) ( HOIST-AT ?auto_34542 ?auto_34541 ) ( not ( = ?auto_34547 ?auto_34542 ) ) ( not ( = ?auto_34538 ?auto_34542 ) ) ( AVAILABLE ?auto_34542 ) ( SURFACE-AT ?auto_34536 ?auto_34541 ) ( ON ?auto_34536 ?auto_34545 ) ( CLEAR ?auto_34536 ) ( not ( = ?auto_34536 ?auto_34545 ) ) ( not ( = ?auto_34537 ?auto_34545 ) ) ( not ( = ?auto_34535 ?auto_34545 ) ) ( not ( = ?auto_34552 ?auto_34545 ) ) ( IS-CRATE ?auto_34535 ) ( not ( = ?auto_34534 ?auto_34535 ) ) ( not ( = ?auto_34536 ?auto_34534 ) ) ( not ( = ?auto_34537 ?auto_34534 ) ) ( not ( = ?auto_34552 ?auto_34534 ) ) ( not ( = ?auto_34545 ?auto_34534 ) ) ( not ( = ?auto_34539 ?auto_34548 ) ) ( not ( = ?auto_34549 ?auto_34539 ) ) ( not ( = ?auto_34541 ?auto_34539 ) ) ( HOIST-AT ?auto_34551 ?auto_34539 ) ( not ( = ?auto_34547 ?auto_34551 ) ) ( not ( = ?auto_34538 ?auto_34551 ) ) ( not ( = ?auto_34542 ?auto_34551 ) ) ( AVAILABLE ?auto_34551 ) ( SURFACE-AT ?auto_34535 ?auto_34539 ) ( ON ?auto_34535 ?auto_34546 ) ( CLEAR ?auto_34535 ) ( not ( = ?auto_34536 ?auto_34546 ) ) ( not ( = ?auto_34537 ?auto_34546 ) ) ( not ( = ?auto_34535 ?auto_34546 ) ) ( not ( = ?auto_34552 ?auto_34546 ) ) ( not ( = ?auto_34545 ?auto_34546 ) ) ( not ( = ?auto_34534 ?auto_34546 ) ) ( SURFACE-AT ?auto_34550 ?auto_34548 ) ( CLEAR ?auto_34550 ) ( IS-CRATE ?auto_34534 ) ( not ( = ?auto_34550 ?auto_34534 ) ) ( not ( = ?auto_34536 ?auto_34550 ) ) ( not ( = ?auto_34537 ?auto_34550 ) ) ( not ( = ?auto_34535 ?auto_34550 ) ) ( not ( = ?auto_34552 ?auto_34550 ) ) ( not ( = ?auto_34545 ?auto_34550 ) ) ( not ( = ?auto_34546 ?auto_34550 ) ) ( AVAILABLE ?auto_34547 ) ( TRUCK-AT ?auto_34540 ?auto_34543 ) ( not ( = ?auto_34543 ?auto_34548 ) ) ( not ( = ?auto_34549 ?auto_34543 ) ) ( not ( = ?auto_34541 ?auto_34543 ) ) ( not ( = ?auto_34539 ?auto_34543 ) ) ( HOIST-AT ?auto_34544 ?auto_34543 ) ( not ( = ?auto_34547 ?auto_34544 ) ) ( not ( = ?auto_34538 ?auto_34544 ) ) ( not ( = ?auto_34542 ?auto_34544 ) ) ( not ( = ?auto_34551 ?auto_34544 ) ) ( AVAILABLE ?auto_34544 ) ( SURFACE-AT ?auto_34534 ?auto_34543 ) ( ON ?auto_34534 ?auto_34553 ) ( CLEAR ?auto_34534 ) ( not ( = ?auto_34536 ?auto_34553 ) ) ( not ( = ?auto_34537 ?auto_34553 ) ) ( not ( = ?auto_34535 ?auto_34553 ) ) ( not ( = ?auto_34552 ?auto_34553 ) ) ( not ( = ?auto_34545 ?auto_34553 ) ) ( not ( = ?auto_34534 ?auto_34553 ) ) ( not ( = ?auto_34546 ?auto_34553 ) ) ( not ( = ?auto_34550 ?auto_34553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34535 ?auto_34536 ?auto_34537 )
      ( MAKE-3CRATE-VERIFY ?auto_34534 ?auto_34535 ?auto_34536 ?auto_34537 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34554 - SURFACE
      ?auto_34555 - SURFACE
      ?auto_34556 - SURFACE
      ?auto_34557 - SURFACE
      ?auto_34558 - SURFACE
    )
    :vars
    (
      ?auto_34568 - HOIST
      ?auto_34569 - PLACE
      ?auto_34570 - PLACE
      ?auto_34559 - HOIST
      ?auto_34572 - SURFACE
      ?auto_34562 - PLACE
      ?auto_34563 - HOIST
      ?auto_34566 - SURFACE
      ?auto_34560 - PLACE
      ?auto_34571 - HOIST
      ?auto_34567 - SURFACE
      ?auto_34561 - TRUCK
      ?auto_34564 - PLACE
      ?auto_34565 - HOIST
      ?auto_34573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34568 ?auto_34569 ) ( IS-CRATE ?auto_34558 ) ( not ( = ?auto_34557 ?auto_34558 ) ) ( not ( = ?auto_34556 ?auto_34557 ) ) ( not ( = ?auto_34556 ?auto_34558 ) ) ( not ( = ?auto_34570 ?auto_34569 ) ) ( HOIST-AT ?auto_34559 ?auto_34570 ) ( not ( = ?auto_34568 ?auto_34559 ) ) ( AVAILABLE ?auto_34559 ) ( SURFACE-AT ?auto_34558 ?auto_34570 ) ( ON ?auto_34558 ?auto_34572 ) ( CLEAR ?auto_34558 ) ( not ( = ?auto_34557 ?auto_34572 ) ) ( not ( = ?auto_34558 ?auto_34572 ) ) ( not ( = ?auto_34556 ?auto_34572 ) ) ( IS-CRATE ?auto_34557 ) ( not ( = ?auto_34562 ?auto_34569 ) ) ( not ( = ?auto_34570 ?auto_34562 ) ) ( HOIST-AT ?auto_34563 ?auto_34562 ) ( not ( = ?auto_34568 ?auto_34563 ) ) ( not ( = ?auto_34559 ?auto_34563 ) ) ( AVAILABLE ?auto_34563 ) ( SURFACE-AT ?auto_34557 ?auto_34562 ) ( ON ?auto_34557 ?auto_34566 ) ( CLEAR ?auto_34557 ) ( not ( = ?auto_34557 ?auto_34566 ) ) ( not ( = ?auto_34558 ?auto_34566 ) ) ( not ( = ?auto_34556 ?auto_34566 ) ) ( not ( = ?auto_34572 ?auto_34566 ) ) ( IS-CRATE ?auto_34556 ) ( not ( = ?auto_34555 ?auto_34556 ) ) ( not ( = ?auto_34557 ?auto_34555 ) ) ( not ( = ?auto_34558 ?auto_34555 ) ) ( not ( = ?auto_34572 ?auto_34555 ) ) ( not ( = ?auto_34566 ?auto_34555 ) ) ( not ( = ?auto_34560 ?auto_34569 ) ) ( not ( = ?auto_34570 ?auto_34560 ) ) ( not ( = ?auto_34562 ?auto_34560 ) ) ( HOIST-AT ?auto_34571 ?auto_34560 ) ( not ( = ?auto_34568 ?auto_34571 ) ) ( not ( = ?auto_34559 ?auto_34571 ) ) ( not ( = ?auto_34563 ?auto_34571 ) ) ( AVAILABLE ?auto_34571 ) ( SURFACE-AT ?auto_34556 ?auto_34560 ) ( ON ?auto_34556 ?auto_34567 ) ( CLEAR ?auto_34556 ) ( not ( = ?auto_34557 ?auto_34567 ) ) ( not ( = ?auto_34558 ?auto_34567 ) ) ( not ( = ?auto_34556 ?auto_34567 ) ) ( not ( = ?auto_34572 ?auto_34567 ) ) ( not ( = ?auto_34566 ?auto_34567 ) ) ( not ( = ?auto_34555 ?auto_34567 ) ) ( SURFACE-AT ?auto_34554 ?auto_34569 ) ( CLEAR ?auto_34554 ) ( IS-CRATE ?auto_34555 ) ( not ( = ?auto_34554 ?auto_34555 ) ) ( not ( = ?auto_34557 ?auto_34554 ) ) ( not ( = ?auto_34558 ?auto_34554 ) ) ( not ( = ?auto_34556 ?auto_34554 ) ) ( not ( = ?auto_34572 ?auto_34554 ) ) ( not ( = ?auto_34566 ?auto_34554 ) ) ( not ( = ?auto_34567 ?auto_34554 ) ) ( AVAILABLE ?auto_34568 ) ( TRUCK-AT ?auto_34561 ?auto_34564 ) ( not ( = ?auto_34564 ?auto_34569 ) ) ( not ( = ?auto_34570 ?auto_34564 ) ) ( not ( = ?auto_34562 ?auto_34564 ) ) ( not ( = ?auto_34560 ?auto_34564 ) ) ( HOIST-AT ?auto_34565 ?auto_34564 ) ( not ( = ?auto_34568 ?auto_34565 ) ) ( not ( = ?auto_34559 ?auto_34565 ) ) ( not ( = ?auto_34563 ?auto_34565 ) ) ( not ( = ?auto_34571 ?auto_34565 ) ) ( AVAILABLE ?auto_34565 ) ( SURFACE-AT ?auto_34555 ?auto_34564 ) ( ON ?auto_34555 ?auto_34573 ) ( CLEAR ?auto_34555 ) ( not ( = ?auto_34557 ?auto_34573 ) ) ( not ( = ?auto_34558 ?auto_34573 ) ) ( not ( = ?auto_34556 ?auto_34573 ) ) ( not ( = ?auto_34572 ?auto_34573 ) ) ( not ( = ?auto_34566 ?auto_34573 ) ) ( not ( = ?auto_34555 ?auto_34573 ) ) ( not ( = ?auto_34567 ?auto_34573 ) ) ( not ( = ?auto_34554 ?auto_34573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34556 ?auto_34557 ?auto_34558 )
      ( MAKE-4CRATE-VERIFY ?auto_34554 ?auto_34555 ?auto_34556 ?auto_34557 ?auto_34558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34574 - SURFACE
      ?auto_34575 - SURFACE
    )
    :vars
    (
      ?auto_34587 - HOIST
      ?auto_34588 - PLACE
      ?auto_34576 - SURFACE
      ?auto_34589 - PLACE
      ?auto_34577 - HOIST
      ?auto_34592 - SURFACE
      ?auto_34581 - PLACE
      ?auto_34582 - HOIST
      ?auto_34585 - SURFACE
      ?auto_34580 - SURFACE
      ?auto_34578 - PLACE
      ?auto_34591 - HOIST
      ?auto_34586 - SURFACE
      ?auto_34590 - SURFACE
      ?auto_34583 - PLACE
      ?auto_34584 - HOIST
      ?auto_34593 - SURFACE
      ?auto_34579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34587 ?auto_34588 ) ( IS-CRATE ?auto_34575 ) ( not ( = ?auto_34574 ?auto_34575 ) ) ( not ( = ?auto_34576 ?auto_34574 ) ) ( not ( = ?auto_34576 ?auto_34575 ) ) ( not ( = ?auto_34589 ?auto_34588 ) ) ( HOIST-AT ?auto_34577 ?auto_34589 ) ( not ( = ?auto_34587 ?auto_34577 ) ) ( AVAILABLE ?auto_34577 ) ( SURFACE-AT ?auto_34575 ?auto_34589 ) ( ON ?auto_34575 ?auto_34592 ) ( CLEAR ?auto_34575 ) ( not ( = ?auto_34574 ?auto_34592 ) ) ( not ( = ?auto_34575 ?auto_34592 ) ) ( not ( = ?auto_34576 ?auto_34592 ) ) ( IS-CRATE ?auto_34574 ) ( not ( = ?auto_34581 ?auto_34588 ) ) ( not ( = ?auto_34589 ?auto_34581 ) ) ( HOIST-AT ?auto_34582 ?auto_34581 ) ( not ( = ?auto_34587 ?auto_34582 ) ) ( not ( = ?auto_34577 ?auto_34582 ) ) ( AVAILABLE ?auto_34582 ) ( SURFACE-AT ?auto_34574 ?auto_34581 ) ( ON ?auto_34574 ?auto_34585 ) ( CLEAR ?auto_34574 ) ( not ( = ?auto_34574 ?auto_34585 ) ) ( not ( = ?auto_34575 ?auto_34585 ) ) ( not ( = ?auto_34576 ?auto_34585 ) ) ( not ( = ?auto_34592 ?auto_34585 ) ) ( IS-CRATE ?auto_34576 ) ( not ( = ?auto_34580 ?auto_34576 ) ) ( not ( = ?auto_34574 ?auto_34580 ) ) ( not ( = ?auto_34575 ?auto_34580 ) ) ( not ( = ?auto_34592 ?auto_34580 ) ) ( not ( = ?auto_34585 ?auto_34580 ) ) ( not ( = ?auto_34578 ?auto_34588 ) ) ( not ( = ?auto_34589 ?auto_34578 ) ) ( not ( = ?auto_34581 ?auto_34578 ) ) ( HOIST-AT ?auto_34591 ?auto_34578 ) ( not ( = ?auto_34587 ?auto_34591 ) ) ( not ( = ?auto_34577 ?auto_34591 ) ) ( not ( = ?auto_34582 ?auto_34591 ) ) ( AVAILABLE ?auto_34591 ) ( SURFACE-AT ?auto_34576 ?auto_34578 ) ( ON ?auto_34576 ?auto_34586 ) ( CLEAR ?auto_34576 ) ( not ( = ?auto_34574 ?auto_34586 ) ) ( not ( = ?auto_34575 ?auto_34586 ) ) ( not ( = ?auto_34576 ?auto_34586 ) ) ( not ( = ?auto_34592 ?auto_34586 ) ) ( not ( = ?auto_34585 ?auto_34586 ) ) ( not ( = ?auto_34580 ?auto_34586 ) ) ( SURFACE-AT ?auto_34590 ?auto_34588 ) ( CLEAR ?auto_34590 ) ( IS-CRATE ?auto_34580 ) ( not ( = ?auto_34590 ?auto_34580 ) ) ( not ( = ?auto_34574 ?auto_34590 ) ) ( not ( = ?auto_34575 ?auto_34590 ) ) ( not ( = ?auto_34576 ?auto_34590 ) ) ( not ( = ?auto_34592 ?auto_34590 ) ) ( not ( = ?auto_34585 ?auto_34590 ) ) ( not ( = ?auto_34586 ?auto_34590 ) ) ( AVAILABLE ?auto_34587 ) ( not ( = ?auto_34583 ?auto_34588 ) ) ( not ( = ?auto_34589 ?auto_34583 ) ) ( not ( = ?auto_34581 ?auto_34583 ) ) ( not ( = ?auto_34578 ?auto_34583 ) ) ( HOIST-AT ?auto_34584 ?auto_34583 ) ( not ( = ?auto_34587 ?auto_34584 ) ) ( not ( = ?auto_34577 ?auto_34584 ) ) ( not ( = ?auto_34582 ?auto_34584 ) ) ( not ( = ?auto_34591 ?auto_34584 ) ) ( AVAILABLE ?auto_34584 ) ( SURFACE-AT ?auto_34580 ?auto_34583 ) ( ON ?auto_34580 ?auto_34593 ) ( CLEAR ?auto_34580 ) ( not ( = ?auto_34574 ?auto_34593 ) ) ( not ( = ?auto_34575 ?auto_34593 ) ) ( not ( = ?auto_34576 ?auto_34593 ) ) ( not ( = ?auto_34592 ?auto_34593 ) ) ( not ( = ?auto_34585 ?auto_34593 ) ) ( not ( = ?auto_34580 ?auto_34593 ) ) ( not ( = ?auto_34586 ?auto_34593 ) ) ( not ( = ?auto_34590 ?auto_34593 ) ) ( TRUCK-AT ?auto_34579 ?auto_34588 ) )
    :subtasks
    ( ( !DRIVE ?auto_34579 ?auto_34588 ?auto_34583 )
      ( MAKE-2CRATE ?auto_34576 ?auto_34574 ?auto_34575 )
      ( MAKE-1CRATE-VERIFY ?auto_34574 ?auto_34575 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34594 - SURFACE
      ?auto_34595 - SURFACE
      ?auto_34596 - SURFACE
    )
    :vars
    (
      ?auto_34604 - HOIST
      ?auto_34608 - PLACE
      ?auto_34609 - PLACE
      ?auto_34599 - HOIST
      ?auto_34602 - SURFACE
      ?auto_34598 - PLACE
      ?auto_34600 - HOIST
      ?auto_34607 - SURFACE
      ?auto_34597 - SURFACE
      ?auto_34601 - PLACE
      ?auto_34606 - HOIST
      ?auto_34605 - SURFACE
      ?auto_34610 - SURFACE
      ?auto_34603 - PLACE
      ?auto_34613 - HOIST
      ?auto_34612 - SURFACE
      ?auto_34611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34604 ?auto_34608 ) ( IS-CRATE ?auto_34596 ) ( not ( = ?auto_34595 ?auto_34596 ) ) ( not ( = ?auto_34594 ?auto_34595 ) ) ( not ( = ?auto_34594 ?auto_34596 ) ) ( not ( = ?auto_34609 ?auto_34608 ) ) ( HOIST-AT ?auto_34599 ?auto_34609 ) ( not ( = ?auto_34604 ?auto_34599 ) ) ( AVAILABLE ?auto_34599 ) ( SURFACE-AT ?auto_34596 ?auto_34609 ) ( ON ?auto_34596 ?auto_34602 ) ( CLEAR ?auto_34596 ) ( not ( = ?auto_34595 ?auto_34602 ) ) ( not ( = ?auto_34596 ?auto_34602 ) ) ( not ( = ?auto_34594 ?auto_34602 ) ) ( IS-CRATE ?auto_34595 ) ( not ( = ?auto_34598 ?auto_34608 ) ) ( not ( = ?auto_34609 ?auto_34598 ) ) ( HOIST-AT ?auto_34600 ?auto_34598 ) ( not ( = ?auto_34604 ?auto_34600 ) ) ( not ( = ?auto_34599 ?auto_34600 ) ) ( AVAILABLE ?auto_34600 ) ( SURFACE-AT ?auto_34595 ?auto_34598 ) ( ON ?auto_34595 ?auto_34607 ) ( CLEAR ?auto_34595 ) ( not ( = ?auto_34595 ?auto_34607 ) ) ( not ( = ?auto_34596 ?auto_34607 ) ) ( not ( = ?auto_34594 ?auto_34607 ) ) ( not ( = ?auto_34602 ?auto_34607 ) ) ( IS-CRATE ?auto_34594 ) ( not ( = ?auto_34597 ?auto_34594 ) ) ( not ( = ?auto_34595 ?auto_34597 ) ) ( not ( = ?auto_34596 ?auto_34597 ) ) ( not ( = ?auto_34602 ?auto_34597 ) ) ( not ( = ?auto_34607 ?auto_34597 ) ) ( not ( = ?auto_34601 ?auto_34608 ) ) ( not ( = ?auto_34609 ?auto_34601 ) ) ( not ( = ?auto_34598 ?auto_34601 ) ) ( HOIST-AT ?auto_34606 ?auto_34601 ) ( not ( = ?auto_34604 ?auto_34606 ) ) ( not ( = ?auto_34599 ?auto_34606 ) ) ( not ( = ?auto_34600 ?auto_34606 ) ) ( AVAILABLE ?auto_34606 ) ( SURFACE-AT ?auto_34594 ?auto_34601 ) ( ON ?auto_34594 ?auto_34605 ) ( CLEAR ?auto_34594 ) ( not ( = ?auto_34595 ?auto_34605 ) ) ( not ( = ?auto_34596 ?auto_34605 ) ) ( not ( = ?auto_34594 ?auto_34605 ) ) ( not ( = ?auto_34602 ?auto_34605 ) ) ( not ( = ?auto_34607 ?auto_34605 ) ) ( not ( = ?auto_34597 ?auto_34605 ) ) ( SURFACE-AT ?auto_34610 ?auto_34608 ) ( CLEAR ?auto_34610 ) ( IS-CRATE ?auto_34597 ) ( not ( = ?auto_34610 ?auto_34597 ) ) ( not ( = ?auto_34595 ?auto_34610 ) ) ( not ( = ?auto_34596 ?auto_34610 ) ) ( not ( = ?auto_34594 ?auto_34610 ) ) ( not ( = ?auto_34602 ?auto_34610 ) ) ( not ( = ?auto_34607 ?auto_34610 ) ) ( not ( = ?auto_34605 ?auto_34610 ) ) ( AVAILABLE ?auto_34604 ) ( not ( = ?auto_34603 ?auto_34608 ) ) ( not ( = ?auto_34609 ?auto_34603 ) ) ( not ( = ?auto_34598 ?auto_34603 ) ) ( not ( = ?auto_34601 ?auto_34603 ) ) ( HOIST-AT ?auto_34613 ?auto_34603 ) ( not ( = ?auto_34604 ?auto_34613 ) ) ( not ( = ?auto_34599 ?auto_34613 ) ) ( not ( = ?auto_34600 ?auto_34613 ) ) ( not ( = ?auto_34606 ?auto_34613 ) ) ( AVAILABLE ?auto_34613 ) ( SURFACE-AT ?auto_34597 ?auto_34603 ) ( ON ?auto_34597 ?auto_34612 ) ( CLEAR ?auto_34597 ) ( not ( = ?auto_34595 ?auto_34612 ) ) ( not ( = ?auto_34596 ?auto_34612 ) ) ( not ( = ?auto_34594 ?auto_34612 ) ) ( not ( = ?auto_34602 ?auto_34612 ) ) ( not ( = ?auto_34607 ?auto_34612 ) ) ( not ( = ?auto_34597 ?auto_34612 ) ) ( not ( = ?auto_34605 ?auto_34612 ) ) ( not ( = ?auto_34610 ?auto_34612 ) ) ( TRUCK-AT ?auto_34611 ?auto_34608 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34595 ?auto_34596 )
      ( MAKE-2CRATE-VERIFY ?auto_34594 ?auto_34595 ?auto_34596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34614 - SURFACE
      ?auto_34615 - SURFACE
      ?auto_34616 - SURFACE
      ?auto_34617 - SURFACE
    )
    :vars
    (
      ?auto_34621 - HOIST
      ?auto_34623 - PLACE
      ?auto_34632 - PLACE
      ?auto_34625 - HOIST
      ?auto_34629 - SURFACE
      ?auto_34620 - PLACE
      ?auto_34626 - HOIST
      ?auto_34633 - SURFACE
      ?auto_34619 - PLACE
      ?auto_34631 - HOIST
      ?auto_34618 - SURFACE
      ?auto_34622 - SURFACE
      ?auto_34627 - PLACE
      ?auto_34628 - HOIST
      ?auto_34624 - SURFACE
      ?auto_34630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34621 ?auto_34623 ) ( IS-CRATE ?auto_34617 ) ( not ( = ?auto_34616 ?auto_34617 ) ) ( not ( = ?auto_34615 ?auto_34616 ) ) ( not ( = ?auto_34615 ?auto_34617 ) ) ( not ( = ?auto_34632 ?auto_34623 ) ) ( HOIST-AT ?auto_34625 ?auto_34632 ) ( not ( = ?auto_34621 ?auto_34625 ) ) ( AVAILABLE ?auto_34625 ) ( SURFACE-AT ?auto_34617 ?auto_34632 ) ( ON ?auto_34617 ?auto_34629 ) ( CLEAR ?auto_34617 ) ( not ( = ?auto_34616 ?auto_34629 ) ) ( not ( = ?auto_34617 ?auto_34629 ) ) ( not ( = ?auto_34615 ?auto_34629 ) ) ( IS-CRATE ?auto_34616 ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( not ( = ?auto_34632 ?auto_34620 ) ) ( HOIST-AT ?auto_34626 ?auto_34620 ) ( not ( = ?auto_34621 ?auto_34626 ) ) ( not ( = ?auto_34625 ?auto_34626 ) ) ( AVAILABLE ?auto_34626 ) ( SURFACE-AT ?auto_34616 ?auto_34620 ) ( ON ?auto_34616 ?auto_34633 ) ( CLEAR ?auto_34616 ) ( not ( = ?auto_34616 ?auto_34633 ) ) ( not ( = ?auto_34617 ?auto_34633 ) ) ( not ( = ?auto_34615 ?auto_34633 ) ) ( not ( = ?auto_34629 ?auto_34633 ) ) ( IS-CRATE ?auto_34615 ) ( not ( = ?auto_34614 ?auto_34615 ) ) ( not ( = ?auto_34616 ?auto_34614 ) ) ( not ( = ?auto_34617 ?auto_34614 ) ) ( not ( = ?auto_34629 ?auto_34614 ) ) ( not ( = ?auto_34633 ?auto_34614 ) ) ( not ( = ?auto_34619 ?auto_34623 ) ) ( not ( = ?auto_34632 ?auto_34619 ) ) ( not ( = ?auto_34620 ?auto_34619 ) ) ( HOIST-AT ?auto_34631 ?auto_34619 ) ( not ( = ?auto_34621 ?auto_34631 ) ) ( not ( = ?auto_34625 ?auto_34631 ) ) ( not ( = ?auto_34626 ?auto_34631 ) ) ( AVAILABLE ?auto_34631 ) ( SURFACE-AT ?auto_34615 ?auto_34619 ) ( ON ?auto_34615 ?auto_34618 ) ( CLEAR ?auto_34615 ) ( not ( = ?auto_34616 ?auto_34618 ) ) ( not ( = ?auto_34617 ?auto_34618 ) ) ( not ( = ?auto_34615 ?auto_34618 ) ) ( not ( = ?auto_34629 ?auto_34618 ) ) ( not ( = ?auto_34633 ?auto_34618 ) ) ( not ( = ?auto_34614 ?auto_34618 ) ) ( SURFACE-AT ?auto_34622 ?auto_34623 ) ( CLEAR ?auto_34622 ) ( IS-CRATE ?auto_34614 ) ( not ( = ?auto_34622 ?auto_34614 ) ) ( not ( = ?auto_34616 ?auto_34622 ) ) ( not ( = ?auto_34617 ?auto_34622 ) ) ( not ( = ?auto_34615 ?auto_34622 ) ) ( not ( = ?auto_34629 ?auto_34622 ) ) ( not ( = ?auto_34633 ?auto_34622 ) ) ( not ( = ?auto_34618 ?auto_34622 ) ) ( AVAILABLE ?auto_34621 ) ( not ( = ?auto_34627 ?auto_34623 ) ) ( not ( = ?auto_34632 ?auto_34627 ) ) ( not ( = ?auto_34620 ?auto_34627 ) ) ( not ( = ?auto_34619 ?auto_34627 ) ) ( HOIST-AT ?auto_34628 ?auto_34627 ) ( not ( = ?auto_34621 ?auto_34628 ) ) ( not ( = ?auto_34625 ?auto_34628 ) ) ( not ( = ?auto_34626 ?auto_34628 ) ) ( not ( = ?auto_34631 ?auto_34628 ) ) ( AVAILABLE ?auto_34628 ) ( SURFACE-AT ?auto_34614 ?auto_34627 ) ( ON ?auto_34614 ?auto_34624 ) ( CLEAR ?auto_34614 ) ( not ( = ?auto_34616 ?auto_34624 ) ) ( not ( = ?auto_34617 ?auto_34624 ) ) ( not ( = ?auto_34615 ?auto_34624 ) ) ( not ( = ?auto_34629 ?auto_34624 ) ) ( not ( = ?auto_34633 ?auto_34624 ) ) ( not ( = ?auto_34614 ?auto_34624 ) ) ( not ( = ?auto_34618 ?auto_34624 ) ) ( not ( = ?auto_34622 ?auto_34624 ) ) ( TRUCK-AT ?auto_34630 ?auto_34623 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34615 ?auto_34616 ?auto_34617 )
      ( MAKE-3CRATE-VERIFY ?auto_34614 ?auto_34615 ?auto_34616 ?auto_34617 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34634 - SURFACE
      ?auto_34635 - SURFACE
      ?auto_34636 - SURFACE
      ?auto_34637 - SURFACE
      ?auto_34638 - SURFACE
    )
    :vars
    (
      ?auto_34642 - HOIST
      ?auto_34643 - PLACE
      ?auto_34652 - PLACE
      ?auto_34645 - HOIST
      ?auto_34649 - SURFACE
      ?auto_34641 - PLACE
      ?auto_34646 - HOIST
      ?auto_34653 - SURFACE
      ?auto_34640 - PLACE
      ?auto_34651 - HOIST
      ?auto_34639 - SURFACE
      ?auto_34647 - PLACE
      ?auto_34648 - HOIST
      ?auto_34644 - SURFACE
      ?auto_34650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34642 ?auto_34643 ) ( IS-CRATE ?auto_34638 ) ( not ( = ?auto_34637 ?auto_34638 ) ) ( not ( = ?auto_34636 ?auto_34637 ) ) ( not ( = ?auto_34636 ?auto_34638 ) ) ( not ( = ?auto_34652 ?auto_34643 ) ) ( HOIST-AT ?auto_34645 ?auto_34652 ) ( not ( = ?auto_34642 ?auto_34645 ) ) ( AVAILABLE ?auto_34645 ) ( SURFACE-AT ?auto_34638 ?auto_34652 ) ( ON ?auto_34638 ?auto_34649 ) ( CLEAR ?auto_34638 ) ( not ( = ?auto_34637 ?auto_34649 ) ) ( not ( = ?auto_34638 ?auto_34649 ) ) ( not ( = ?auto_34636 ?auto_34649 ) ) ( IS-CRATE ?auto_34637 ) ( not ( = ?auto_34641 ?auto_34643 ) ) ( not ( = ?auto_34652 ?auto_34641 ) ) ( HOIST-AT ?auto_34646 ?auto_34641 ) ( not ( = ?auto_34642 ?auto_34646 ) ) ( not ( = ?auto_34645 ?auto_34646 ) ) ( AVAILABLE ?auto_34646 ) ( SURFACE-AT ?auto_34637 ?auto_34641 ) ( ON ?auto_34637 ?auto_34653 ) ( CLEAR ?auto_34637 ) ( not ( = ?auto_34637 ?auto_34653 ) ) ( not ( = ?auto_34638 ?auto_34653 ) ) ( not ( = ?auto_34636 ?auto_34653 ) ) ( not ( = ?auto_34649 ?auto_34653 ) ) ( IS-CRATE ?auto_34636 ) ( not ( = ?auto_34635 ?auto_34636 ) ) ( not ( = ?auto_34637 ?auto_34635 ) ) ( not ( = ?auto_34638 ?auto_34635 ) ) ( not ( = ?auto_34649 ?auto_34635 ) ) ( not ( = ?auto_34653 ?auto_34635 ) ) ( not ( = ?auto_34640 ?auto_34643 ) ) ( not ( = ?auto_34652 ?auto_34640 ) ) ( not ( = ?auto_34641 ?auto_34640 ) ) ( HOIST-AT ?auto_34651 ?auto_34640 ) ( not ( = ?auto_34642 ?auto_34651 ) ) ( not ( = ?auto_34645 ?auto_34651 ) ) ( not ( = ?auto_34646 ?auto_34651 ) ) ( AVAILABLE ?auto_34651 ) ( SURFACE-AT ?auto_34636 ?auto_34640 ) ( ON ?auto_34636 ?auto_34639 ) ( CLEAR ?auto_34636 ) ( not ( = ?auto_34637 ?auto_34639 ) ) ( not ( = ?auto_34638 ?auto_34639 ) ) ( not ( = ?auto_34636 ?auto_34639 ) ) ( not ( = ?auto_34649 ?auto_34639 ) ) ( not ( = ?auto_34653 ?auto_34639 ) ) ( not ( = ?auto_34635 ?auto_34639 ) ) ( SURFACE-AT ?auto_34634 ?auto_34643 ) ( CLEAR ?auto_34634 ) ( IS-CRATE ?auto_34635 ) ( not ( = ?auto_34634 ?auto_34635 ) ) ( not ( = ?auto_34637 ?auto_34634 ) ) ( not ( = ?auto_34638 ?auto_34634 ) ) ( not ( = ?auto_34636 ?auto_34634 ) ) ( not ( = ?auto_34649 ?auto_34634 ) ) ( not ( = ?auto_34653 ?auto_34634 ) ) ( not ( = ?auto_34639 ?auto_34634 ) ) ( AVAILABLE ?auto_34642 ) ( not ( = ?auto_34647 ?auto_34643 ) ) ( not ( = ?auto_34652 ?auto_34647 ) ) ( not ( = ?auto_34641 ?auto_34647 ) ) ( not ( = ?auto_34640 ?auto_34647 ) ) ( HOIST-AT ?auto_34648 ?auto_34647 ) ( not ( = ?auto_34642 ?auto_34648 ) ) ( not ( = ?auto_34645 ?auto_34648 ) ) ( not ( = ?auto_34646 ?auto_34648 ) ) ( not ( = ?auto_34651 ?auto_34648 ) ) ( AVAILABLE ?auto_34648 ) ( SURFACE-AT ?auto_34635 ?auto_34647 ) ( ON ?auto_34635 ?auto_34644 ) ( CLEAR ?auto_34635 ) ( not ( = ?auto_34637 ?auto_34644 ) ) ( not ( = ?auto_34638 ?auto_34644 ) ) ( not ( = ?auto_34636 ?auto_34644 ) ) ( not ( = ?auto_34649 ?auto_34644 ) ) ( not ( = ?auto_34653 ?auto_34644 ) ) ( not ( = ?auto_34635 ?auto_34644 ) ) ( not ( = ?auto_34639 ?auto_34644 ) ) ( not ( = ?auto_34634 ?auto_34644 ) ) ( TRUCK-AT ?auto_34650 ?auto_34643 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34636 ?auto_34637 ?auto_34638 )
      ( MAKE-4CRATE-VERIFY ?auto_34634 ?auto_34635 ?auto_34636 ?auto_34637 ?auto_34638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34674 - SURFACE
      ?auto_34675 - SURFACE
    )
    :vars
    (
      ?auto_34676 - HOIST
      ?auto_34677 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34676 ?auto_34677 ) ( SURFACE-AT ?auto_34674 ?auto_34677 ) ( CLEAR ?auto_34674 ) ( LIFTING ?auto_34676 ?auto_34675 ) ( IS-CRATE ?auto_34675 ) ( not ( = ?auto_34674 ?auto_34675 ) ) )
    :subtasks
    ( ( !DROP ?auto_34676 ?auto_34675 ?auto_34674 ?auto_34677 )
      ( MAKE-1CRATE-VERIFY ?auto_34674 ?auto_34675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34678 - SURFACE
      ?auto_34679 - SURFACE
      ?auto_34680 - SURFACE
    )
    :vars
    (
      ?auto_34682 - HOIST
      ?auto_34681 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34682 ?auto_34681 ) ( SURFACE-AT ?auto_34679 ?auto_34681 ) ( CLEAR ?auto_34679 ) ( LIFTING ?auto_34682 ?auto_34680 ) ( IS-CRATE ?auto_34680 ) ( not ( = ?auto_34679 ?auto_34680 ) ) ( ON ?auto_34679 ?auto_34678 ) ( not ( = ?auto_34678 ?auto_34679 ) ) ( not ( = ?auto_34678 ?auto_34680 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34679 ?auto_34680 )
      ( MAKE-2CRATE-VERIFY ?auto_34678 ?auto_34679 ?auto_34680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34683 - SURFACE
      ?auto_34684 - SURFACE
      ?auto_34685 - SURFACE
      ?auto_34686 - SURFACE
    )
    :vars
    (
      ?auto_34688 - HOIST
      ?auto_34687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34688 ?auto_34687 ) ( SURFACE-AT ?auto_34685 ?auto_34687 ) ( CLEAR ?auto_34685 ) ( LIFTING ?auto_34688 ?auto_34686 ) ( IS-CRATE ?auto_34686 ) ( not ( = ?auto_34685 ?auto_34686 ) ) ( ON ?auto_34684 ?auto_34683 ) ( ON ?auto_34685 ?auto_34684 ) ( not ( = ?auto_34683 ?auto_34684 ) ) ( not ( = ?auto_34683 ?auto_34685 ) ) ( not ( = ?auto_34683 ?auto_34686 ) ) ( not ( = ?auto_34684 ?auto_34685 ) ) ( not ( = ?auto_34684 ?auto_34686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34685 ?auto_34686 )
      ( MAKE-3CRATE-VERIFY ?auto_34683 ?auto_34684 ?auto_34685 ?auto_34686 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34689 - SURFACE
      ?auto_34690 - SURFACE
      ?auto_34691 - SURFACE
      ?auto_34692 - SURFACE
      ?auto_34693 - SURFACE
    )
    :vars
    (
      ?auto_34695 - HOIST
      ?auto_34694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34695 ?auto_34694 ) ( SURFACE-AT ?auto_34692 ?auto_34694 ) ( CLEAR ?auto_34692 ) ( LIFTING ?auto_34695 ?auto_34693 ) ( IS-CRATE ?auto_34693 ) ( not ( = ?auto_34692 ?auto_34693 ) ) ( ON ?auto_34690 ?auto_34689 ) ( ON ?auto_34691 ?auto_34690 ) ( ON ?auto_34692 ?auto_34691 ) ( not ( = ?auto_34689 ?auto_34690 ) ) ( not ( = ?auto_34689 ?auto_34691 ) ) ( not ( = ?auto_34689 ?auto_34692 ) ) ( not ( = ?auto_34689 ?auto_34693 ) ) ( not ( = ?auto_34690 ?auto_34691 ) ) ( not ( = ?auto_34690 ?auto_34692 ) ) ( not ( = ?auto_34690 ?auto_34693 ) ) ( not ( = ?auto_34691 ?auto_34692 ) ) ( not ( = ?auto_34691 ?auto_34693 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34692 ?auto_34693 )
      ( MAKE-4CRATE-VERIFY ?auto_34689 ?auto_34690 ?auto_34691 ?auto_34692 ?auto_34693 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34696 - SURFACE
      ?auto_34697 - SURFACE
      ?auto_34698 - SURFACE
      ?auto_34699 - SURFACE
      ?auto_34700 - SURFACE
      ?auto_34701 - SURFACE
    )
    :vars
    (
      ?auto_34703 - HOIST
      ?auto_34702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34703 ?auto_34702 ) ( SURFACE-AT ?auto_34700 ?auto_34702 ) ( CLEAR ?auto_34700 ) ( LIFTING ?auto_34703 ?auto_34701 ) ( IS-CRATE ?auto_34701 ) ( not ( = ?auto_34700 ?auto_34701 ) ) ( ON ?auto_34697 ?auto_34696 ) ( ON ?auto_34698 ?auto_34697 ) ( ON ?auto_34699 ?auto_34698 ) ( ON ?auto_34700 ?auto_34699 ) ( not ( = ?auto_34696 ?auto_34697 ) ) ( not ( = ?auto_34696 ?auto_34698 ) ) ( not ( = ?auto_34696 ?auto_34699 ) ) ( not ( = ?auto_34696 ?auto_34700 ) ) ( not ( = ?auto_34696 ?auto_34701 ) ) ( not ( = ?auto_34697 ?auto_34698 ) ) ( not ( = ?auto_34697 ?auto_34699 ) ) ( not ( = ?auto_34697 ?auto_34700 ) ) ( not ( = ?auto_34697 ?auto_34701 ) ) ( not ( = ?auto_34698 ?auto_34699 ) ) ( not ( = ?auto_34698 ?auto_34700 ) ) ( not ( = ?auto_34698 ?auto_34701 ) ) ( not ( = ?auto_34699 ?auto_34700 ) ) ( not ( = ?auto_34699 ?auto_34701 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34700 ?auto_34701 )
      ( MAKE-5CRATE-VERIFY ?auto_34696 ?auto_34697 ?auto_34698 ?auto_34699 ?auto_34700 ?auto_34701 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34704 - SURFACE
      ?auto_34705 - SURFACE
    )
    :vars
    (
      ?auto_34707 - HOIST
      ?auto_34706 - PLACE
      ?auto_34708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34707 ?auto_34706 ) ( SURFACE-AT ?auto_34704 ?auto_34706 ) ( CLEAR ?auto_34704 ) ( IS-CRATE ?auto_34705 ) ( not ( = ?auto_34704 ?auto_34705 ) ) ( TRUCK-AT ?auto_34708 ?auto_34706 ) ( AVAILABLE ?auto_34707 ) ( IN ?auto_34705 ?auto_34708 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34707 ?auto_34705 ?auto_34708 ?auto_34706 )
      ( MAKE-1CRATE ?auto_34704 ?auto_34705 )
      ( MAKE-1CRATE-VERIFY ?auto_34704 ?auto_34705 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34709 - SURFACE
      ?auto_34710 - SURFACE
      ?auto_34711 - SURFACE
    )
    :vars
    (
      ?auto_34712 - HOIST
      ?auto_34713 - PLACE
      ?auto_34714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34712 ?auto_34713 ) ( SURFACE-AT ?auto_34710 ?auto_34713 ) ( CLEAR ?auto_34710 ) ( IS-CRATE ?auto_34711 ) ( not ( = ?auto_34710 ?auto_34711 ) ) ( TRUCK-AT ?auto_34714 ?auto_34713 ) ( AVAILABLE ?auto_34712 ) ( IN ?auto_34711 ?auto_34714 ) ( ON ?auto_34710 ?auto_34709 ) ( not ( = ?auto_34709 ?auto_34710 ) ) ( not ( = ?auto_34709 ?auto_34711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34710 ?auto_34711 )
      ( MAKE-2CRATE-VERIFY ?auto_34709 ?auto_34710 ?auto_34711 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34715 - SURFACE
      ?auto_34716 - SURFACE
      ?auto_34717 - SURFACE
      ?auto_34718 - SURFACE
    )
    :vars
    (
      ?auto_34719 - HOIST
      ?auto_34721 - PLACE
      ?auto_34720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34719 ?auto_34721 ) ( SURFACE-AT ?auto_34717 ?auto_34721 ) ( CLEAR ?auto_34717 ) ( IS-CRATE ?auto_34718 ) ( not ( = ?auto_34717 ?auto_34718 ) ) ( TRUCK-AT ?auto_34720 ?auto_34721 ) ( AVAILABLE ?auto_34719 ) ( IN ?auto_34718 ?auto_34720 ) ( ON ?auto_34717 ?auto_34716 ) ( not ( = ?auto_34716 ?auto_34717 ) ) ( not ( = ?auto_34716 ?auto_34718 ) ) ( ON ?auto_34716 ?auto_34715 ) ( not ( = ?auto_34715 ?auto_34716 ) ) ( not ( = ?auto_34715 ?auto_34717 ) ) ( not ( = ?auto_34715 ?auto_34718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34716 ?auto_34717 ?auto_34718 )
      ( MAKE-3CRATE-VERIFY ?auto_34715 ?auto_34716 ?auto_34717 ?auto_34718 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34722 - SURFACE
      ?auto_34723 - SURFACE
      ?auto_34724 - SURFACE
      ?auto_34725 - SURFACE
      ?auto_34726 - SURFACE
    )
    :vars
    (
      ?auto_34727 - HOIST
      ?auto_34729 - PLACE
      ?auto_34728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34727 ?auto_34729 ) ( SURFACE-AT ?auto_34725 ?auto_34729 ) ( CLEAR ?auto_34725 ) ( IS-CRATE ?auto_34726 ) ( not ( = ?auto_34725 ?auto_34726 ) ) ( TRUCK-AT ?auto_34728 ?auto_34729 ) ( AVAILABLE ?auto_34727 ) ( IN ?auto_34726 ?auto_34728 ) ( ON ?auto_34725 ?auto_34724 ) ( not ( = ?auto_34724 ?auto_34725 ) ) ( not ( = ?auto_34724 ?auto_34726 ) ) ( ON ?auto_34723 ?auto_34722 ) ( ON ?auto_34724 ?auto_34723 ) ( not ( = ?auto_34722 ?auto_34723 ) ) ( not ( = ?auto_34722 ?auto_34724 ) ) ( not ( = ?auto_34722 ?auto_34725 ) ) ( not ( = ?auto_34722 ?auto_34726 ) ) ( not ( = ?auto_34723 ?auto_34724 ) ) ( not ( = ?auto_34723 ?auto_34725 ) ) ( not ( = ?auto_34723 ?auto_34726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34724 ?auto_34725 ?auto_34726 )
      ( MAKE-4CRATE-VERIFY ?auto_34722 ?auto_34723 ?auto_34724 ?auto_34725 ?auto_34726 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34730 - SURFACE
      ?auto_34731 - SURFACE
      ?auto_34732 - SURFACE
      ?auto_34733 - SURFACE
      ?auto_34734 - SURFACE
      ?auto_34735 - SURFACE
    )
    :vars
    (
      ?auto_34736 - HOIST
      ?auto_34738 - PLACE
      ?auto_34737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34736 ?auto_34738 ) ( SURFACE-AT ?auto_34734 ?auto_34738 ) ( CLEAR ?auto_34734 ) ( IS-CRATE ?auto_34735 ) ( not ( = ?auto_34734 ?auto_34735 ) ) ( TRUCK-AT ?auto_34737 ?auto_34738 ) ( AVAILABLE ?auto_34736 ) ( IN ?auto_34735 ?auto_34737 ) ( ON ?auto_34734 ?auto_34733 ) ( not ( = ?auto_34733 ?auto_34734 ) ) ( not ( = ?auto_34733 ?auto_34735 ) ) ( ON ?auto_34731 ?auto_34730 ) ( ON ?auto_34732 ?auto_34731 ) ( ON ?auto_34733 ?auto_34732 ) ( not ( = ?auto_34730 ?auto_34731 ) ) ( not ( = ?auto_34730 ?auto_34732 ) ) ( not ( = ?auto_34730 ?auto_34733 ) ) ( not ( = ?auto_34730 ?auto_34734 ) ) ( not ( = ?auto_34730 ?auto_34735 ) ) ( not ( = ?auto_34731 ?auto_34732 ) ) ( not ( = ?auto_34731 ?auto_34733 ) ) ( not ( = ?auto_34731 ?auto_34734 ) ) ( not ( = ?auto_34731 ?auto_34735 ) ) ( not ( = ?auto_34732 ?auto_34733 ) ) ( not ( = ?auto_34732 ?auto_34734 ) ) ( not ( = ?auto_34732 ?auto_34735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34733 ?auto_34734 ?auto_34735 )
      ( MAKE-5CRATE-VERIFY ?auto_34730 ?auto_34731 ?auto_34732 ?auto_34733 ?auto_34734 ?auto_34735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34739 - SURFACE
      ?auto_34740 - SURFACE
    )
    :vars
    (
      ?auto_34741 - HOIST
      ?auto_34744 - PLACE
      ?auto_34743 - TRUCK
      ?auto_34742 - SURFACE
      ?auto_34745 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34741 ?auto_34744 ) ( SURFACE-AT ?auto_34739 ?auto_34744 ) ( CLEAR ?auto_34739 ) ( IS-CRATE ?auto_34740 ) ( not ( = ?auto_34739 ?auto_34740 ) ) ( AVAILABLE ?auto_34741 ) ( IN ?auto_34740 ?auto_34743 ) ( ON ?auto_34739 ?auto_34742 ) ( not ( = ?auto_34742 ?auto_34739 ) ) ( not ( = ?auto_34742 ?auto_34740 ) ) ( TRUCK-AT ?auto_34743 ?auto_34745 ) ( not ( = ?auto_34745 ?auto_34744 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34743 ?auto_34745 ?auto_34744 )
      ( MAKE-2CRATE ?auto_34742 ?auto_34739 ?auto_34740 )
      ( MAKE-1CRATE-VERIFY ?auto_34739 ?auto_34740 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34746 - SURFACE
      ?auto_34747 - SURFACE
      ?auto_34748 - SURFACE
    )
    :vars
    (
      ?auto_34750 - HOIST
      ?auto_34752 - PLACE
      ?auto_34749 - TRUCK
      ?auto_34751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34750 ?auto_34752 ) ( SURFACE-AT ?auto_34747 ?auto_34752 ) ( CLEAR ?auto_34747 ) ( IS-CRATE ?auto_34748 ) ( not ( = ?auto_34747 ?auto_34748 ) ) ( AVAILABLE ?auto_34750 ) ( IN ?auto_34748 ?auto_34749 ) ( ON ?auto_34747 ?auto_34746 ) ( not ( = ?auto_34746 ?auto_34747 ) ) ( not ( = ?auto_34746 ?auto_34748 ) ) ( TRUCK-AT ?auto_34749 ?auto_34751 ) ( not ( = ?auto_34751 ?auto_34752 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34747 ?auto_34748 )
      ( MAKE-2CRATE-VERIFY ?auto_34746 ?auto_34747 ?auto_34748 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34753 - SURFACE
      ?auto_34754 - SURFACE
      ?auto_34755 - SURFACE
      ?auto_34756 - SURFACE
    )
    :vars
    (
      ?auto_34760 - HOIST
      ?auto_34758 - PLACE
      ?auto_34757 - TRUCK
      ?auto_34759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34760 ?auto_34758 ) ( SURFACE-AT ?auto_34755 ?auto_34758 ) ( CLEAR ?auto_34755 ) ( IS-CRATE ?auto_34756 ) ( not ( = ?auto_34755 ?auto_34756 ) ) ( AVAILABLE ?auto_34760 ) ( IN ?auto_34756 ?auto_34757 ) ( ON ?auto_34755 ?auto_34754 ) ( not ( = ?auto_34754 ?auto_34755 ) ) ( not ( = ?auto_34754 ?auto_34756 ) ) ( TRUCK-AT ?auto_34757 ?auto_34759 ) ( not ( = ?auto_34759 ?auto_34758 ) ) ( ON ?auto_34754 ?auto_34753 ) ( not ( = ?auto_34753 ?auto_34754 ) ) ( not ( = ?auto_34753 ?auto_34755 ) ) ( not ( = ?auto_34753 ?auto_34756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34754 ?auto_34755 ?auto_34756 )
      ( MAKE-3CRATE-VERIFY ?auto_34753 ?auto_34754 ?auto_34755 ?auto_34756 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34761 - SURFACE
      ?auto_34762 - SURFACE
      ?auto_34763 - SURFACE
      ?auto_34764 - SURFACE
      ?auto_34765 - SURFACE
    )
    :vars
    (
      ?auto_34769 - HOIST
      ?auto_34767 - PLACE
      ?auto_34766 - TRUCK
      ?auto_34768 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34769 ?auto_34767 ) ( SURFACE-AT ?auto_34764 ?auto_34767 ) ( CLEAR ?auto_34764 ) ( IS-CRATE ?auto_34765 ) ( not ( = ?auto_34764 ?auto_34765 ) ) ( AVAILABLE ?auto_34769 ) ( IN ?auto_34765 ?auto_34766 ) ( ON ?auto_34764 ?auto_34763 ) ( not ( = ?auto_34763 ?auto_34764 ) ) ( not ( = ?auto_34763 ?auto_34765 ) ) ( TRUCK-AT ?auto_34766 ?auto_34768 ) ( not ( = ?auto_34768 ?auto_34767 ) ) ( ON ?auto_34762 ?auto_34761 ) ( ON ?auto_34763 ?auto_34762 ) ( not ( = ?auto_34761 ?auto_34762 ) ) ( not ( = ?auto_34761 ?auto_34763 ) ) ( not ( = ?auto_34761 ?auto_34764 ) ) ( not ( = ?auto_34761 ?auto_34765 ) ) ( not ( = ?auto_34762 ?auto_34763 ) ) ( not ( = ?auto_34762 ?auto_34764 ) ) ( not ( = ?auto_34762 ?auto_34765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34763 ?auto_34764 ?auto_34765 )
      ( MAKE-4CRATE-VERIFY ?auto_34761 ?auto_34762 ?auto_34763 ?auto_34764 ?auto_34765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34770 - SURFACE
      ?auto_34771 - SURFACE
      ?auto_34772 - SURFACE
      ?auto_34773 - SURFACE
      ?auto_34774 - SURFACE
      ?auto_34775 - SURFACE
    )
    :vars
    (
      ?auto_34779 - HOIST
      ?auto_34777 - PLACE
      ?auto_34776 - TRUCK
      ?auto_34778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34779 ?auto_34777 ) ( SURFACE-AT ?auto_34774 ?auto_34777 ) ( CLEAR ?auto_34774 ) ( IS-CRATE ?auto_34775 ) ( not ( = ?auto_34774 ?auto_34775 ) ) ( AVAILABLE ?auto_34779 ) ( IN ?auto_34775 ?auto_34776 ) ( ON ?auto_34774 ?auto_34773 ) ( not ( = ?auto_34773 ?auto_34774 ) ) ( not ( = ?auto_34773 ?auto_34775 ) ) ( TRUCK-AT ?auto_34776 ?auto_34778 ) ( not ( = ?auto_34778 ?auto_34777 ) ) ( ON ?auto_34771 ?auto_34770 ) ( ON ?auto_34772 ?auto_34771 ) ( ON ?auto_34773 ?auto_34772 ) ( not ( = ?auto_34770 ?auto_34771 ) ) ( not ( = ?auto_34770 ?auto_34772 ) ) ( not ( = ?auto_34770 ?auto_34773 ) ) ( not ( = ?auto_34770 ?auto_34774 ) ) ( not ( = ?auto_34770 ?auto_34775 ) ) ( not ( = ?auto_34771 ?auto_34772 ) ) ( not ( = ?auto_34771 ?auto_34773 ) ) ( not ( = ?auto_34771 ?auto_34774 ) ) ( not ( = ?auto_34771 ?auto_34775 ) ) ( not ( = ?auto_34772 ?auto_34773 ) ) ( not ( = ?auto_34772 ?auto_34774 ) ) ( not ( = ?auto_34772 ?auto_34775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34773 ?auto_34774 ?auto_34775 )
      ( MAKE-5CRATE-VERIFY ?auto_34770 ?auto_34771 ?auto_34772 ?auto_34773 ?auto_34774 ?auto_34775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34780 - SURFACE
      ?auto_34781 - SURFACE
    )
    :vars
    (
      ?auto_34786 - HOIST
      ?auto_34784 - PLACE
      ?auto_34782 - SURFACE
      ?auto_34783 - TRUCK
      ?auto_34785 - PLACE
      ?auto_34787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34786 ?auto_34784 ) ( SURFACE-AT ?auto_34780 ?auto_34784 ) ( CLEAR ?auto_34780 ) ( IS-CRATE ?auto_34781 ) ( not ( = ?auto_34780 ?auto_34781 ) ) ( AVAILABLE ?auto_34786 ) ( ON ?auto_34780 ?auto_34782 ) ( not ( = ?auto_34782 ?auto_34780 ) ) ( not ( = ?auto_34782 ?auto_34781 ) ) ( TRUCK-AT ?auto_34783 ?auto_34785 ) ( not ( = ?auto_34785 ?auto_34784 ) ) ( HOIST-AT ?auto_34787 ?auto_34785 ) ( LIFTING ?auto_34787 ?auto_34781 ) ( not ( = ?auto_34786 ?auto_34787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34787 ?auto_34781 ?auto_34783 ?auto_34785 )
      ( MAKE-2CRATE ?auto_34782 ?auto_34780 ?auto_34781 )
      ( MAKE-1CRATE-VERIFY ?auto_34780 ?auto_34781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34788 - SURFACE
      ?auto_34789 - SURFACE
      ?auto_34790 - SURFACE
    )
    :vars
    (
      ?auto_34794 - HOIST
      ?auto_34792 - PLACE
      ?auto_34791 - TRUCK
      ?auto_34793 - PLACE
      ?auto_34795 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34794 ?auto_34792 ) ( SURFACE-AT ?auto_34789 ?auto_34792 ) ( CLEAR ?auto_34789 ) ( IS-CRATE ?auto_34790 ) ( not ( = ?auto_34789 ?auto_34790 ) ) ( AVAILABLE ?auto_34794 ) ( ON ?auto_34789 ?auto_34788 ) ( not ( = ?auto_34788 ?auto_34789 ) ) ( not ( = ?auto_34788 ?auto_34790 ) ) ( TRUCK-AT ?auto_34791 ?auto_34793 ) ( not ( = ?auto_34793 ?auto_34792 ) ) ( HOIST-AT ?auto_34795 ?auto_34793 ) ( LIFTING ?auto_34795 ?auto_34790 ) ( not ( = ?auto_34794 ?auto_34795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34789 ?auto_34790 )
      ( MAKE-2CRATE-VERIFY ?auto_34788 ?auto_34789 ?auto_34790 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34796 - SURFACE
      ?auto_34797 - SURFACE
      ?auto_34798 - SURFACE
      ?auto_34799 - SURFACE
    )
    :vars
    (
      ?auto_34803 - HOIST
      ?auto_34802 - PLACE
      ?auto_34801 - TRUCK
      ?auto_34800 - PLACE
      ?auto_34804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34803 ?auto_34802 ) ( SURFACE-AT ?auto_34798 ?auto_34802 ) ( CLEAR ?auto_34798 ) ( IS-CRATE ?auto_34799 ) ( not ( = ?auto_34798 ?auto_34799 ) ) ( AVAILABLE ?auto_34803 ) ( ON ?auto_34798 ?auto_34797 ) ( not ( = ?auto_34797 ?auto_34798 ) ) ( not ( = ?auto_34797 ?auto_34799 ) ) ( TRUCK-AT ?auto_34801 ?auto_34800 ) ( not ( = ?auto_34800 ?auto_34802 ) ) ( HOIST-AT ?auto_34804 ?auto_34800 ) ( LIFTING ?auto_34804 ?auto_34799 ) ( not ( = ?auto_34803 ?auto_34804 ) ) ( ON ?auto_34797 ?auto_34796 ) ( not ( = ?auto_34796 ?auto_34797 ) ) ( not ( = ?auto_34796 ?auto_34798 ) ) ( not ( = ?auto_34796 ?auto_34799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34797 ?auto_34798 ?auto_34799 )
      ( MAKE-3CRATE-VERIFY ?auto_34796 ?auto_34797 ?auto_34798 ?auto_34799 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34805 - SURFACE
      ?auto_34806 - SURFACE
      ?auto_34807 - SURFACE
      ?auto_34808 - SURFACE
      ?auto_34809 - SURFACE
    )
    :vars
    (
      ?auto_34813 - HOIST
      ?auto_34812 - PLACE
      ?auto_34811 - TRUCK
      ?auto_34810 - PLACE
      ?auto_34814 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34813 ?auto_34812 ) ( SURFACE-AT ?auto_34808 ?auto_34812 ) ( CLEAR ?auto_34808 ) ( IS-CRATE ?auto_34809 ) ( not ( = ?auto_34808 ?auto_34809 ) ) ( AVAILABLE ?auto_34813 ) ( ON ?auto_34808 ?auto_34807 ) ( not ( = ?auto_34807 ?auto_34808 ) ) ( not ( = ?auto_34807 ?auto_34809 ) ) ( TRUCK-AT ?auto_34811 ?auto_34810 ) ( not ( = ?auto_34810 ?auto_34812 ) ) ( HOIST-AT ?auto_34814 ?auto_34810 ) ( LIFTING ?auto_34814 ?auto_34809 ) ( not ( = ?auto_34813 ?auto_34814 ) ) ( ON ?auto_34806 ?auto_34805 ) ( ON ?auto_34807 ?auto_34806 ) ( not ( = ?auto_34805 ?auto_34806 ) ) ( not ( = ?auto_34805 ?auto_34807 ) ) ( not ( = ?auto_34805 ?auto_34808 ) ) ( not ( = ?auto_34805 ?auto_34809 ) ) ( not ( = ?auto_34806 ?auto_34807 ) ) ( not ( = ?auto_34806 ?auto_34808 ) ) ( not ( = ?auto_34806 ?auto_34809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34807 ?auto_34808 ?auto_34809 )
      ( MAKE-4CRATE-VERIFY ?auto_34805 ?auto_34806 ?auto_34807 ?auto_34808 ?auto_34809 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34815 - SURFACE
      ?auto_34816 - SURFACE
      ?auto_34817 - SURFACE
      ?auto_34818 - SURFACE
      ?auto_34819 - SURFACE
      ?auto_34820 - SURFACE
    )
    :vars
    (
      ?auto_34824 - HOIST
      ?auto_34823 - PLACE
      ?auto_34822 - TRUCK
      ?auto_34821 - PLACE
      ?auto_34825 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34824 ?auto_34823 ) ( SURFACE-AT ?auto_34819 ?auto_34823 ) ( CLEAR ?auto_34819 ) ( IS-CRATE ?auto_34820 ) ( not ( = ?auto_34819 ?auto_34820 ) ) ( AVAILABLE ?auto_34824 ) ( ON ?auto_34819 ?auto_34818 ) ( not ( = ?auto_34818 ?auto_34819 ) ) ( not ( = ?auto_34818 ?auto_34820 ) ) ( TRUCK-AT ?auto_34822 ?auto_34821 ) ( not ( = ?auto_34821 ?auto_34823 ) ) ( HOIST-AT ?auto_34825 ?auto_34821 ) ( LIFTING ?auto_34825 ?auto_34820 ) ( not ( = ?auto_34824 ?auto_34825 ) ) ( ON ?auto_34816 ?auto_34815 ) ( ON ?auto_34817 ?auto_34816 ) ( ON ?auto_34818 ?auto_34817 ) ( not ( = ?auto_34815 ?auto_34816 ) ) ( not ( = ?auto_34815 ?auto_34817 ) ) ( not ( = ?auto_34815 ?auto_34818 ) ) ( not ( = ?auto_34815 ?auto_34819 ) ) ( not ( = ?auto_34815 ?auto_34820 ) ) ( not ( = ?auto_34816 ?auto_34817 ) ) ( not ( = ?auto_34816 ?auto_34818 ) ) ( not ( = ?auto_34816 ?auto_34819 ) ) ( not ( = ?auto_34816 ?auto_34820 ) ) ( not ( = ?auto_34817 ?auto_34818 ) ) ( not ( = ?auto_34817 ?auto_34819 ) ) ( not ( = ?auto_34817 ?auto_34820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34818 ?auto_34819 ?auto_34820 )
      ( MAKE-5CRATE-VERIFY ?auto_34815 ?auto_34816 ?auto_34817 ?auto_34818 ?auto_34819 ?auto_34820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34826 - SURFACE
      ?auto_34827 - SURFACE
    )
    :vars
    (
      ?auto_34832 - HOIST
      ?auto_34831 - PLACE
      ?auto_34828 - SURFACE
      ?auto_34830 - TRUCK
      ?auto_34829 - PLACE
      ?auto_34833 - HOIST
      ?auto_34834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34832 ?auto_34831 ) ( SURFACE-AT ?auto_34826 ?auto_34831 ) ( CLEAR ?auto_34826 ) ( IS-CRATE ?auto_34827 ) ( not ( = ?auto_34826 ?auto_34827 ) ) ( AVAILABLE ?auto_34832 ) ( ON ?auto_34826 ?auto_34828 ) ( not ( = ?auto_34828 ?auto_34826 ) ) ( not ( = ?auto_34828 ?auto_34827 ) ) ( TRUCK-AT ?auto_34830 ?auto_34829 ) ( not ( = ?auto_34829 ?auto_34831 ) ) ( HOIST-AT ?auto_34833 ?auto_34829 ) ( not ( = ?auto_34832 ?auto_34833 ) ) ( AVAILABLE ?auto_34833 ) ( SURFACE-AT ?auto_34827 ?auto_34829 ) ( ON ?auto_34827 ?auto_34834 ) ( CLEAR ?auto_34827 ) ( not ( = ?auto_34826 ?auto_34834 ) ) ( not ( = ?auto_34827 ?auto_34834 ) ) ( not ( = ?auto_34828 ?auto_34834 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34833 ?auto_34827 ?auto_34834 ?auto_34829 )
      ( MAKE-2CRATE ?auto_34828 ?auto_34826 ?auto_34827 )
      ( MAKE-1CRATE-VERIFY ?auto_34826 ?auto_34827 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34835 - SURFACE
      ?auto_34836 - SURFACE
      ?auto_34837 - SURFACE
    )
    :vars
    (
      ?auto_34842 - HOIST
      ?auto_34838 - PLACE
      ?auto_34839 - TRUCK
      ?auto_34840 - PLACE
      ?auto_34841 - HOIST
      ?auto_34843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34842 ?auto_34838 ) ( SURFACE-AT ?auto_34836 ?auto_34838 ) ( CLEAR ?auto_34836 ) ( IS-CRATE ?auto_34837 ) ( not ( = ?auto_34836 ?auto_34837 ) ) ( AVAILABLE ?auto_34842 ) ( ON ?auto_34836 ?auto_34835 ) ( not ( = ?auto_34835 ?auto_34836 ) ) ( not ( = ?auto_34835 ?auto_34837 ) ) ( TRUCK-AT ?auto_34839 ?auto_34840 ) ( not ( = ?auto_34840 ?auto_34838 ) ) ( HOIST-AT ?auto_34841 ?auto_34840 ) ( not ( = ?auto_34842 ?auto_34841 ) ) ( AVAILABLE ?auto_34841 ) ( SURFACE-AT ?auto_34837 ?auto_34840 ) ( ON ?auto_34837 ?auto_34843 ) ( CLEAR ?auto_34837 ) ( not ( = ?auto_34836 ?auto_34843 ) ) ( not ( = ?auto_34837 ?auto_34843 ) ) ( not ( = ?auto_34835 ?auto_34843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34836 ?auto_34837 )
      ( MAKE-2CRATE-VERIFY ?auto_34835 ?auto_34836 ?auto_34837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34844 - SURFACE
      ?auto_34845 - SURFACE
      ?auto_34846 - SURFACE
      ?auto_34847 - SURFACE
    )
    :vars
    (
      ?auto_34851 - HOIST
      ?auto_34848 - PLACE
      ?auto_34850 - TRUCK
      ?auto_34849 - PLACE
      ?auto_34852 - HOIST
      ?auto_34853 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34851 ?auto_34848 ) ( SURFACE-AT ?auto_34846 ?auto_34848 ) ( CLEAR ?auto_34846 ) ( IS-CRATE ?auto_34847 ) ( not ( = ?auto_34846 ?auto_34847 ) ) ( AVAILABLE ?auto_34851 ) ( ON ?auto_34846 ?auto_34845 ) ( not ( = ?auto_34845 ?auto_34846 ) ) ( not ( = ?auto_34845 ?auto_34847 ) ) ( TRUCK-AT ?auto_34850 ?auto_34849 ) ( not ( = ?auto_34849 ?auto_34848 ) ) ( HOIST-AT ?auto_34852 ?auto_34849 ) ( not ( = ?auto_34851 ?auto_34852 ) ) ( AVAILABLE ?auto_34852 ) ( SURFACE-AT ?auto_34847 ?auto_34849 ) ( ON ?auto_34847 ?auto_34853 ) ( CLEAR ?auto_34847 ) ( not ( = ?auto_34846 ?auto_34853 ) ) ( not ( = ?auto_34847 ?auto_34853 ) ) ( not ( = ?auto_34845 ?auto_34853 ) ) ( ON ?auto_34845 ?auto_34844 ) ( not ( = ?auto_34844 ?auto_34845 ) ) ( not ( = ?auto_34844 ?auto_34846 ) ) ( not ( = ?auto_34844 ?auto_34847 ) ) ( not ( = ?auto_34844 ?auto_34853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34845 ?auto_34846 ?auto_34847 )
      ( MAKE-3CRATE-VERIFY ?auto_34844 ?auto_34845 ?auto_34846 ?auto_34847 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34854 - SURFACE
      ?auto_34855 - SURFACE
      ?auto_34856 - SURFACE
      ?auto_34857 - SURFACE
      ?auto_34858 - SURFACE
    )
    :vars
    (
      ?auto_34862 - HOIST
      ?auto_34859 - PLACE
      ?auto_34861 - TRUCK
      ?auto_34860 - PLACE
      ?auto_34863 - HOIST
      ?auto_34864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34862 ?auto_34859 ) ( SURFACE-AT ?auto_34857 ?auto_34859 ) ( CLEAR ?auto_34857 ) ( IS-CRATE ?auto_34858 ) ( not ( = ?auto_34857 ?auto_34858 ) ) ( AVAILABLE ?auto_34862 ) ( ON ?auto_34857 ?auto_34856 ) ( not ( = ?auto_34856 ?auto_34857 ) ) ( not ( = ?auto_34856 ?auto_34858 ) ) ( TRUCK-AT ?auto_34861 ?auto_34860 ) ( not ( = ?auto_34860 ?auto_34859 ) ) ( HOIST-AT ?auto_34863 ?auto_34860 ) ( not ( = ?auto_34862 ?auto_34863 ) ) ( AVAILABLE ?auto_34863 ) ( SURFACE-AT ?auto_34858 ?auto_34860 ) ( ON ?auto_34858 ?auto_34864 ) ( CLEAR ?auto_34858 ) ( not ( = ?auto_34857 ?auto_34864 ) ) ( not ( = ?auto_34858 ?auto_34864 ) ) ( not ( = ?auto_34856 ?auto_34864 ) ) ( ON ?auto_34855 ?auto_34854 ) ( ON ?auto_34856 ?auto_34855 ) ( not ( = ?auto_34854 ?auto_34855 ) ) ( not ( = ?auto_34854 ?auto_34856 ) ) ( not ( = ?auto_34854 ?auto_34857 ) ) ( not ( = ?auto_34854 ?auto_34858 ) ) ( not ( = ?auto_34854 ?auto_34864 ) ) ( not ( = ?auto_34855 ?auto_34856 ) ) ( not ( = ?auto_34855 ?auto_34857 ) ) ( not ( = ?auto_34855 ?auto_34858 ) ) ( not ( = ?auto_34855 ?auto_34864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34856 ?auto_34857 ?auto_34858 )
      ( MAKE-4CRATE-VERIFY ?auto_34854 ?auto_34855 ?auto_34856 ?auto_34857 ?auto_34858 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34865 - SURFACE
      ?auto_34866 - SURFACE
      ?auto_34867 - SURFACE
      ?auto_34868 - SURFACE
      ?auto_34869 - SURFACE
      ?auto_34870 - SURFACE
    )
    :vars
    (
      ?auto_34874 - HOIST
      ?auto_34871 - PLACE
      ?auto_34873 - TRUCK
      ?auto_34872 - PLACE
      ?auto_34875 - HOIST
      ?auto_34876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34874 ?auto_34871 ) ( SURFACE-AT ?auto_34869 ?auto_34871 ) ( CLEAR ?auto_34869 ) ( IS-CRATE ?auto_34870 ) ( not ( = ?auto_34869 ?auto_34870 ) ) ( AVAILABLE ?auto_34874 ) ( ON ?auto_34869 ?auto_34868 ) ( not ( = ?auto_34868 ?auto_34869 ) ) ( not ( = ?auto_34868 ?auto_34870 ) ) ( TRUCK-AT ?auto_34873 ?auto_34872 ) ( not ( = ?auto_34872 ?auto_34871 ) ) ( HOIST-AT ?auto_34875 ?auto_34872 ) ( not ( = ?auto_34874 ?auto_34875 ) ) ( AVAILABLE ?auto_34875 ) ( SURFACE-AT ?auto_34870 ?auto_34872 ) ( ON ?auto_34870 ?auto_34876 ) ( CLEAR ?auto_34870 ) ( not ( = ?auto_34869 ?auto_34876 ) ) ( not ( = ?auto_34870 ?auto_34876 ) ) ( not ( = ?auto_34868 ?auto_34876 ) ) ( ON ?auto_34866 ?auto_34865 ) ( ON ?auto_34867 ?auto_34866 ) ( ON ?auto_34868 ?auto_34867 ) ( not ( = ?auto_34865 ?auto_34866 ) ) ( not ( = ?auto_34865 ?auto_34867 ) ) ( not ( = ?auto_34865 ?auto_34868 ) ) ( not ( = ?auto_34865 ?auto_34869 ) ) ( not ( = ?auto_34865 ?auto_34870 ) ) ( not ( = ?auto_34865 ?auto_34876 ) ) ( not ( = ?auto_34866 ?auto_34867 ) ) ( not ( = ?auto_34866 ?auto_34868 ) ) ( not ( = ?auto_34866 ?auto_34869 ) ) ( not ( = ?auto_34866 ?auto_34870 ) ) ( not ( = ?auto_34866 ?auto_34876 ) ) ( not ( = ?auto_34867 ?auto_34868 ) ) ( not ( = ?auto_34867 ?auto_34869 ) ) ( not ( = ?auto_34867 ?auto_34870 ) ) ( not ( = ?auto_34867 ?auto_34876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34868 ?auto_34869 ?auto_34870 )
      ( MAKE-5CRATE-VERIFY ?auto_34865 ?auto_34866 ?auto_34867 ?auto_34868 ?auto_34869 ?auto_34870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34877 - SURFACE
      ?auto_34878 - SURFACE
    )
    :vars
    (
      ?auto_34883 - HOIST
      ?auto_34879 - PLACE
      ?auto_34880 - SURFACE
      ?auto_34881 - PLACE
      ?auto_34884 - HOIST
      ?auto_34885 - SURFACE
      ?auto_34882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34883 ?auto_34879 ) ( SURFACE-AT ?auto_34877 ?auto_34879 ) ( CLEAR ?auto_34877 ) ( IS-CRATE ?auto_34878 ) ( not ( = ?auto_34877 ?auto_34878 ) ) ( AVAILABLE ?auto_34883 ) ( ON ?auto_34877 ?auto_34880 ) ( not ( = ?auto_34880 ?auto_34877 ) ) ( not ( = ?auto_34880 ?auto_34878 ) ) ( not ( = ?auto_34881 ?auto_34879 ) ) ( HOIST-AT ?auto_34884 ?auto_34881 ) ( not ( = ?auto_34883 ?auto_34884 ) ) ( AVAILABLE ?auto_34884 ) ( SURFACE-AT ?auto_34878 ?auto_34881 ) ( ON ?auto_34878 ?auto_34885 ) ( CLEAR ?auto_34878 ) ( not ( = ?auto_34877 ?auto_34885 ) ) ( not ( = ?auto_34878 ?auto_34885 ) ) ( not ( = ?auto_34880 ?auto_34885 ) ) ( TRUCK-AT ?auto_34882 ?auto_34879 ) )
    :subtasks
    ( ( !DRIVE ?auto_34882 ?auto_34879 ?auto_34881 )
      ( MAKE-2CRATE ?auto_34880 ?auto_34877 ?auto_34878 )
      ( MAKE-1CRATE-VERIFY ?auto_34877 ?auto_34878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34886 - SURFACE
      ?auto_34887 - SURFACE
      ?auto_34888 - SURFACE
    )
    :vars
    (
      ?auto_34889 - HOIST
      ?auto_34893 - PLACE
      ?auto_34891 - PLACE
      ?auto_34892 - HOIST
      ?auto_34890 - SURFACE
      ?auto_34894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34889 ?auto_34893 ) ( SURFACE-AT ?auto_34887 ?auto_34893 ) ( CLEAR ?auto_34887 ) ( IS-CRATE ?auto_34888 ) ( not ( = ?auto_34887 ?auto_34888 ) ) ( AVAILABLE ?auto_34889 ) ( ON ?auto_34887 ?auto_34886 ) ( not ( = ?auto_34886 ?auto_34887 ) ) ( not ( = ?auto_34886 ?auto_34888 ) ) ( not ( = ?auto_34891 ?auto_34893 ) ) ( HOIST-AT ?auto_34892 ?auto_34891 ) ( not ( = ?auto_34889 ?auto_34892 ) ) ( AVAILABLE ?auto_34892 ) ( SURFACE-AT ?auto_34888 ?auto_34891 ) ( ON ?auto_34888 ?auto_34890 ) ( CLEAR ?auto_34888 ) ( not ( = ?auto_34887 ?auto_34890 ) ) ( not ( = ?auto_34888 ?auto_34890 ) ) ( not ( = ?auto_34886 ?auto_34890 ) ) ( TRUCK-AT ?auto_34894 ?auto_34893 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34887 ?auto_34888 )
      ( MAKE-2CRATE-VERIFY ?auto_34886 ?auto_34887 ?auto_34888 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34895 - SURFACE
      ?auto_34896 - SURFACE
      ?auto_34897 - SURFACE
      ?auto_34898 - SURFACE
    )
    :vars
    (
      ?auto_34902 - HOIST
      ?auto_34903 - PLACE
      ?auto_34899 - PLACE
      ?auto_34901 - HOIST
      ?auto_34904 - SURFACE
      ?auto_34900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34902 ?auto_34903 ) ( SURFACE-AT ?auto_34897 ?auto_34903 ) ( CLEAR ?auto_34897 ) ( IS-CRATE ?auto_34898 ) ( not ( = ?auto_34897 ?auto_34898 ) ) ( AVAILABLE ?auto_34902 ) ( ON ?auto_34897 ?auto_34896 ) ( not ( = ?auto_34896 ?auto_34897 ) ) ( not ( = ?auto_34896 ?auto_34898 ) ) ( not ( = ?auto_34899 ?auto_34903 ) ) ( HOIST-AT ?auto_34901 ?auto_34899 ) ( not ( = ?auto_34902 ?auto_34901 ) ) ( AVAILABLE ?auto_34901 ) ( SURFACE-AT ?auto_34898 ?auto_34899 ) ( ON ?auto_34898 ?auto_34904 ) ( CLEAR ?auto_34898 ) ( not ( = ?auto_34897 ?auto_34904 ) ) ( not ( = ?auto_34898 ?auto_34904 ) ) ( not ( = ?auto_34896 ?auto_34904 ) ) ( TRUCK-AT ?auto_34900 ?auto_34903 ) ( ON ?auto_34896 ?auto_34895 ) ( not ( = ?auto_34895 ?auto_34896 ) ) ( not ( = ?auto_34895 ?auto_34897 ) ) ( not ( = ?auto_34895 ?auto_34898 ) ) ( not ( = ?auto_34895 ?auto_34904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34896 ?auto_34897 ?auto_34898 )
      ( MAKE-3CRATE-VERIFY ?auto_34895 ?auto_34896 ?auto_34897 ?auto_34898 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34905 - SURFACE
      ?auto_34906 - SURFACE
      ?auto_34907 - SURFACE
      ?auto_34908 - SURFACE
      ?auto_34909 - SURFACE
    )
    :vars
    (
      ?auto_34913 - HOIST
      ?auto_34914 - PLACE
      ?auto_34910 - PLACE
      ?auto_34912 - HOIST
      ?auto_34915 - SURFACE
      ?auto_34911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34913 ?auto_34914 ) ( SURFACE-AT ?auto_34908 ?auto_34914 ) ( CLEAR ?auto_34908 ) ( IS-CRATE ?auto_34909 ) ( not ( = ?auto_34908 ?auto_34909 ) ) ( AVAILABLE ?auto_34913 ) ( ON ?auto_34908 ?auto_34907 ) ( not ( = ?auto_34907 ?auto_34908 ) ) ( not ( = ?auto_34907 ?auto_34909 ) ) ( not ( = ?auto_34910 ?auto_34914 ) ) ( HOIST-AT ?auto_34912 ?auto_34910 ) ( not ( = ?auto_34913 ?auto_34912 ) ) ( AVAILABLE ?auto_34912 ) ( SURFACE-AT ?auto_34909 ?auto_34910 ) ( ON ?auto_34909 ?auto_34915 ) ( CLEAR ?auto_34909 ) ( not ( = ?auto_34908 ?auto_34915 ) ) ( not ( = ?auto_34909 ?auto_34915 ) ) ( not ( = ?auto_34907 ?auto_34915 ) ) ( TRUCK-AT ?auto_34911 ?auto_34914 ) ( ON ?auto_34906 ?auto_34905 ) ( ON ?auto_34907 ?auto_34906 ) ( not ( = ?auto_34905 ?auto_34906 ) ) ( not ( = ?auto_34905 ?auto_34907 ) ) ( not ( = ?auto_34905 ?auto_34908 ) ) ( not ( = ?auto_34905 ?auto_34909 ) ) ( not ( = ?auto_34905 ?auto_34915 ) ) ( not ( = ?auto_34906 ?auto_34907 ) ) ( not ( = ?auto_34906 ?auto_34908 ) ) ( not ( = ?auto_34906 ?auto_34909 ) ) ( not ( = ?auto_34906 ?auto_34915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34907 ?auto_34908 ?auto_34909 )
      ( MAKE-4CRATE-VERIFY ?auto_34905 ?auto_34906 ?auto_34907 ?auto_34908 ?auto_34909 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34916 - SURFACE
      ?auto_34917 - SURFACE
      ?auto_34918 - SURFACE
      ?auto_34919 - SURFACE
      ?auto_34920 - SURFACE
      ?auto_34921 - SURFACE
    )
    :vars
    (
      ?auto_34925 - HOIST
      ?auto_34926 - PLACE
      ?auto_34922 - PLACE
      ?auto_34924 - HOIST
      ?auto_34927 - SURFACE
      ?auto_34923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34925 ?auto_34926 ) ( SURFACE-AT ?auto_34920 ?auto_34926 ) ( CLEAR ?auto_34920 ) ( IS-CRATE ?auto_34921 ) ( not ( = ?auto_34920 ?auto_34921 ) ) ( AVAILABLE ?auto_34925 ) ( ON ?auto_34920 ?auto_34919 ) ( not ( = ?auto_34919 ?auto_34920 ) ) ( not ( = ?auto_34919 ?auto_34921 ) ) ( not ( = ?auto_34922 ?auto_34926 ) ) ( HOIST-AT ?auto_34924 ?auto_34922 ) ( not ( = ?auto_34925 ?auto_34924 ) ) ( AVAILABLE ?auto_34924 ) ( SURFACE-AT ?auto_34921 ?auto_34922 ) ( ON ?auto_34921 ?auto_34927 ) ( CLEAR ?auto_34921 ) ( not ( = ?auto_34920 ?auto_34927 ) ) ( not ( = ?auto_34921 ?auto_34927 ) ) ( not ( = ?auto_34919 ?auto_34927 ) ) ( TRUCK-AT ?auto_34923 ?auto_34926 ) ( ON ?auto_34917 ?auto_34916 ) ( ON ?auto_34918 ?auto_34917 ) ( ON ?auto_34919 ?auto_34918 ) ( not ( = ?auto_34916 ?auto_34917 ) ) ( not ( = ?auto_34916 ?auto_34918 ) ) ( not ( = ?auto_34916 ?auto_34919 ) ) ( not ( = ?auto_34916 ?auto_34920 ) ) ( not ( = ?auto_34916 ?auto_34921 ) ) ( not ( = ?auto_34916 ?auto_34927 ) ) ( not ( = ?auto_34917 ?auto_34918 ) ) ( not ( = ?auto_34917 ?auto_34919 ) ) ( not ( = ?auto_34917 ?auto_34920 ) ) ( not ( = ?auto_34917 ?auto_34921 ) ) ( not ( = ?auto_34917 ?auto_34927 ) ) ( not ( = ?auto_34918 ?auto_34919 ) ) ( not ( = ?auto_34918 ?auto_34920 ) ) ( not ( = ?auto_34918 ?auto_34921 ) ) ( not ( = ?auto_34918 ?auto_34927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34919 ?auto_34920 ?auto_34921 )
      ( MAKE-5CRATE-VERIFY ?auto_34916 ?auto_34917 ?auto_34918 ?auto_34919 ?auto_34920 ?auto_34921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34928 - SURFACE
      ?auto_34929 - SURFACE
    )
    :vars
    (
      ?auto_34934 - HOIST
      ?auto_34935 - PLACE
      ?auto_34933 - SURFACE
      ?auto_34930 - PLACE
      ?auto_34932 - HOIST
      ?auto_34936 - SURFACE
      ?auto_34931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34934 ?auto_34935 ) ( IS-CRATE ?auto_34929 ) ( not ( = ?auto_34928 ?auto_34929 ) ) ( not ( = ?auto_34933 ?auto_34928 ) ) ( not ( = ?auto_34933 ?auto_34929 ) ) ( not ( = ?auto_34930 ?auto_34935 ) ) ( HOIST-AT ?auto_34932 ?auto_34930 ) ( not ( = ?auto_34934 ?auto_34932 ) ) ( AVAILABLE ?auto_34932 ) ( SURFACE-AT ?auto_34929 ?auto_34930 ) ( ON ?auto_34929 ?auto_34936 ) ( CLEAR ?auto_34929 ) ( not ( = ?auto_34928 ?auto_34936 ) ) ( not ( = ?auto_34929 ?auto_34936 ) ) ( not ( = ?auto_34933 ?auto_34936 ) ) ( TRUCK-AT ?auto_34931 ?auto_34935 ) ( SURFACE-AT ?auto_34933 ?auto_34935 ) ( CLEAR ?auto_34933 ) ( LIFTING ?auto_34934 ?auto_34928 ) ( IS-CRATE ?auto_34928 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34933 ?auto_34928 )
      ( MAKE-2CRATE ?auto_34933 ?auto_34928 ?auto_34929 )
      ( MAKE-1CRATE-VERIFY ?auto_34928 ?auto_34929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34937 - SURFACE
      ?auto_34938 - SURFACE
      ?auto_34939 - SURFACE
    )
    :vars
    (
      ?auto_34942 - HOIST
      ?auto_34941 - PLACE
      ?auto_34945 - PLACE
      ?auto_34940 - HOIST
      ?auto_34943 - SURFACE
      ?auto_34944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34942 ?auto_34941 ) ( IS-CRATE ?auto_34939 ) ( not ( = ?auto_34938 ?auto_34939 ) ) ( not ( = ?auto_34937 ?auto_34938 ) ) ( not ( = ?auto_34937 ?auto_34939 ) ) ( not ( = ?auto_34945 ?auto_34941 ) ) ( HOIST-AT ?auto_34940 ?auto_34945 ) ( not ( = ?auto_34942 ?auto_34940 ) ) ( AVAILABLE ?auto_34940 ) ( SURFACE-AT ?auto_34939 ?auto_34945 ) ( ON ?auto_34939 ?auto_34943 ) ( CLEAR ?auto_34939 ) ( not ( = ?auto_34938 ?auto_34943 ) ) ( not ( = ?auto_34939 ?auto_34943 ) ) ( not ( = ?auto_34937 ?auto_34943 ) ) ( TRUCK-AT ?auto_34944 ?auto_34941 ) ( SURFACE-AT ?auto_34937 ?auto_34941 ) ( CLEAR ?auto_34937 ) ( LIFTING ?auto_34942 ?auto_34938 ) ( IS-CRATE ?auto_34938 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34938 ?auto_34939 )
      ( MAKE-2CRATE-VERIFY ?auto_34937 ?auto_34938 ?auto_34939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34946 - SURFACE
      ?auto_34947 - SURFACE
      ?auto_34948 - SURFACE
      ?auto_34949 - SURFACE
    )
    :vars
    (
      ?auto_34953 - HOIST
      ?auto_34955 - PLACE
      ?auto_34951 - PLACE
      ?auto_34950 - HOIST
      ?auto_34952 - SURFACE
      ?auto_34954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34953 ?auto_34955 ) ( IS-CRATE ?auto_34949 ) ( not ( = ?auto_34948 ?auto_34949 ) ) ( not ( = ?auto_34947 ?auto_34948 ) ) ( not ( = ?auto_34947 ?auto_34949 ) ) ( not ( = ?auto_34951 ?auto_34955 ) ) ( HOIST-AT ?auto_34950 ?auto_34951 ) ( not ( = ?auto_34953 ?auto_34950 ) ) ( AVAILABLE ?auto_34950 ) ( SURFACE-AT ?auto_34949 ?auto_34951 ) ( ON ?auto_34949 ?auto_34952 ) ( CLEAR ?auto_34949 ) ( not ( = ?auto_34948 ?auto_34952 ) ) ( not ( = ?auto_34949 ?auto_34952 ) ) ( not ( = ?auto_34947 ?auto_34952 ) ) ( TRUCK-AT ?auto_34954 ?auto_34955 ) ( SURFACE-AT ?auto_34947 ?auto_34955 ) ( CLEAR ?auto_34947 ) ( LIFTING ?auto_34953 ?auto_34948 ) ( IS-CRATE ?auto_34948 ) ( ON ?auto_34947 ?auto_34946 ) ( not ( = ?auto_34946 ?auto_34947 ) ) ( not ( = ?auto_34946 ?auto_34948 ) ) ( not ( = ?auto_34946 ?auto_34949 ) ) ( not ( = ?auto_34946 ?auto_34952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34947 ?auto_34948 ?auto_34949 )
      ( MAKE-3CRATE-VERIFY ?auto_34946 ?auto_34947 ?auto_34948 ?auto_34949 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_34956 - SURFACE
      ?auto_34957 - SURFACE
      ?auto_34958 - SURFACE
      ?auto_34959 - SURFACE
      ?auto_34960 - SURFACE
    )
    :vars
    (
      ?auto_34964 - HOIST
      ?auto_34966 - PLACE
      ?auto_34962 - PLACE
      ?auto_34961 - HOIST
      ?auto_34963 - SURFACE
      ?auto_34965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34964 ?auto_34966 ) ( IS-CRATE ?auto_34960 ) ( not ( = ?auto_34959 ?auto_34960 ) ) ( not ( = ?auto_34958 ?auto_34959 ) ) ( not ( = ?auto_34958 ?auto_34960 ) ) ( not ( = ?auto_34962 ?auto_34966 ) ) ( HOIST-AT ?auto_34961 ?auto_34962 ) ( not ( = ?auto_34964 ?auto_34961 ) ) ( AVAILABLE ?auto_34961 ) ( SURFACE-AT ?auto_34960 ?auto_34962 ) ( ON ?auto_34960 ?auto_34963 ) ( CLEAR ?auto_34960 ) ( not ( = ?auto_34959 ?auto_34963 ) ) ( not ( = ?auto_34960 ?auto_34963 ) ) ( not ( = ?auto_34958 ?auto_34963 ) ) ( TRUCK-AT ?auto_34965 ?auto_34966 ) ( SURFACE-AT ?auto_34958 ?auto_34966 ) ( CLEAR ?auto_34958 ) ( LIFTING ?auto_34964 ?auto_34959 ) ( IS-CRATE ?auto_34959 ) ( ON ?auto_34957 ?auto_34956 ) ( ON ?auto_34958 ?auto_34957 ) ( not ( = ?auto_34956 ?auto_34957 ) ) ( not ( = ?auto_34956 ?auto_34958 ) ) ( not ( = ?auto_34956 ?auto_34959 ) ) ( not ( = ?auto_34956 ?auto_34960 ) ) ( not ( = ?auto_34956 ?auto_34963 ) ) ( not ( = ?auto_34957 ?auto_34958 ) ) ( not ( = ?auto_34957 ?auto_34959 ) ) ( not ( = ?auto_34957 ?auto_34960 ) ) ( not ( = ?auto_34957 ?auto_34963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34958 ?auto_34959 ?auto_34960 )
      ( MAKE-4CRATE-VERIFY ?auto_34956 ?auto_34957 ?auto_34958 ?auto_34959 ?auto_34960 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_34967 - SURFACE
      ?auto_34968 - SURFACE
      ?auto_34969 - SURFACE
      ?auto_34970 - SURFACE
      ?auto_34971 - SURFACE
      ?auto_34972 - SURFACE
    )
    :vars
    (
      ?auto_34976 - HOIST
      ?auto_34978 - PLACE
      ?auto_34974 - PLACE
      ?auto_34973 - HOIST
      ?auto_34975 - SURFACE
      ?auto_34977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34976 ?auto_34978 ) ( IS-CRATE ?auto_34972 ) ( not ( = ?auto_34971 ?auto_34972 ) ) ( not ( = ?auto_34970 ?auto_34971 ) ) ( not ( = ?auto_34970 ?auto_34972 ) ) ( not ( = ?auto_34974 ?auto_34978 ) ) ( HOIST-AT ?auto_34973 ?auto_34974 ) ( not ( = ?auto_34976 ?auto_34973 ) ) ( AVAILABLE ?auto_34973 ) ( SURFACE-AT ?auto_34972 ?auto_34974 ) ( ON ?auto_34972 ?auto_34975 ) ( CLEAR ?auto_34972 ) ( not ( = ?auto_34971 ?auto_34975 ) ) ( not ( = ?auto_34972 ?auto_34975 ) ) ( not ( = ?auto_34970 ?auto_34975 ) ) ( TRUCK-AT ?auto_34977 ?auto_34978 ) ( SURFACE-AT ?auto_34970 ?auto_34978 ) ( CLEAR ?auto_34970 ) ( LIFTING ?auto_34976 ?auto_34971 ) ( IS-CRATE ?auto_34971 ) ( ON ?auto_34968 ?auto_34967 ) ( ON ?auto_34969 ?auto_34968 ) ( ON ?auto_34970 ?auto_34969 ) ( not ( = ?auto_34967 ?auto_34968 ) ) ( not ( = ?auto_34967 ?auto_34969 ) ) ( not ( = ?auto_34967 ?auto_34970 ) ) ( not ( = ?auto_34967 ?auto_34971 ) ) ( not ( = ?auto_34967 ?auto_34972 ) ) ( not ( = ?auto_34967 ?auto_34975 ) ) ( not ( = ?auto_34968 ?auto_34969 ) ) ( not ( = ?auto_34968 ?auto_34970 ) ) ( not ( = ?auto_34968 ?auto_34971 ) ) ( not ( = ?auto_34968 ?auto_34972 ) ) ( not ( = ?auto_34968 ?auto_34975 ) ) ( not ( = ?auto_34969 ?auto_34970 ) ) ( not ( = ?auto_34969 ?auto_34971 ) ) ( not ( = ?auto_34969 ?auto_34972 ) ) ( not ( = ?auto_34969 ?auto_34975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34970 ?auto_34971 ?auto_34972 )
      ( MAKE-5CRATE-VERIFY ?auto_34967 ?auto_34968 ?auto_34969 ?auto_34970 ?auto_34971 ?auto_34972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_34979 - SURFACE
      ?auto_34980 - SURFACE
    )
    :vars
    (
      ?auto_34985 - HOIST
      ?auto_34987 - PLACE
      ?auto_34981 - SURFACE
      ?auto_34983 - PLACE
      ?auto_34982 - HOIST
      ?auto_34984 - SURFACE
      ?auto_34986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34985 ?auto_34987 ) ( IS-CRATE ?auto_34980 ) ( not ( = ?auto_34979 ?auto_34980 ) ) ( not ( = ?auto_34981 ?auto_34979 ) ) ( not ( = ?auto_34981 ?auto_34980 ) ) ( not ( = ?auto_34983 ?auto_34987 ) ) ( HOIST-AT ?auto_34982 ?auto_34983 ) ( not ( = ?auto_34985 ?auto_34982 ) ) ( AVAILABLE ?auto_34982 ) ( SURFACE-AT ?auto_34980 ?auto_34983 ) ( ON ?auto_34980 ?auto_34984 ) ( CLEAR ?auto_34980 ) ( not ( = ?auto_34979 ?auto_34984 ) ) ( not ( = ?auto_34980 ?auto_34984 ) ) ( not ( = ?auto_34981 ?auto_34984 ) ) ( TRUCK-AT ?auto_34986 ?auto_34987 ) ( SURFACE-AT ?auto_34981 ?auto_34987 ) ( CLEAR ?auto_34981 ) ( IS-CRATE ?auto_34979 ) ( AVAILABLE ?auto_34985 ) ( IN ?auto_34979 ?auto_34986 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34985 ?auto_34979 ?auto_34986 ?auto_34987 )
      ( MAKE-2CRATE ?auto_34981 ?auto_34979 ?auto_34980 )
      ( MAKE-1CRATE-VERIFY ?auto_34979 ?auto_34980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_34988 - SURFACE
      ?auto_34989 - SURFACE
      ?auto_34990 - SURFACE
    )
    :vars
    (
      ?auto_34993 - HOIST
      ?auto_34995 - PLACE
      ?auto_34991 - PLACE
      ?auto_34996 - HOIST
      ?auto_34994 - SURFACE
      ?auto_34992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34993 ?auto_34995 ) ( IS-CRATE ?auto_34990 ) ( not ( = ?auto_34989 ?auto_34990 ) ) ( not ( = ?auto_34988 ?auto_34989 ) ) ( not ( = ?auto_34988 ?auto_34990 ) ) ( not ( = ?auto_34991 ?auto_34995 ) ) ( HOIST-AT ?auto_34996 ?auto_34991 ) ( not ( = ?auto_34993 ?auto_34996 ) ) ( AVAILABLE ?auto_34996 ) ( SURFACE-AT ?auto_34990 ?auto_34991 ) ( ON ?auto_34990 ?auto_34994 ) ( CLEAR ?auto_34990 ) ( not ( = ?auto_34989 ?auto_34994 ) ) ( not ( = ?auto_34990 ?auto_34994 ) ) ( not ( = ?auto_34988 ?auto_34994 ) ) ( TRUCK-AT ?auto_34992 ?auto_34995 ) ( SURFACE-AT ?auto_34988 ?auto_34995 ) ( CLEAR ?auto_34988 ) ( IS-CRATE ?auto_34989 ) ( AVAILABLE ?auto_34993 ) ( IN ?auto_34989 ?auto_34992 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_34989 ?auto_34990 )
      ( MAKE-2CRATE-VERIFY ?auto_34988 ?auto_34989 ?auto_34990 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_34997 - SURFACE
      ?auto_34998 - SURFACE
      ?auto_34999 - SURFACE
      ?auto_35000 - SURFACE
    )
    :vars
    (
      ?auto_35006 - HOIST
      ?auto_35004 - PLACE
      ?auto_35002 - PLACE
      ?auto_35003 - HOIST
      ?auto_35005 - SURFACE
      ?auto_35001 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35006 ?auto_35004 ) ( IS-CRATE ?auto_35000 ) ( not ( = ?auto_34999 ?auto_35000 ) ) ( not ( = ?auto_34998 ?auto_34999 ) ) ( not ( = ?auto_34998 ?auto_35000 ) ) ( not ( = ?auto_35002 ?auto_35004 ) ) ( HOIST-AT ?auto_35003 ?auto_35002 ) ( not ( = ?auto_35006 ?auto_35003 ) ) ( AVAILABLE ?auto_35003 ) ( SURFACE-AT ?auto_35000 ?auto_35002 ) ( ON ?auto_35000 ?auto_35005 ) ( CLEAR ?auto_35000 ) ( not ( = ?auto_34999 ?auto_35005 ) ) ( not ( = ?auto_35000 ?auto_35005 ) ) ( not ( = ?auto_34998 ?auto_35005 ) ) ( TRUCK-AT ?auto_35001 ?auto_35004 ) ( SURFACE-AT ?auto_34998 ?auto_35004 ) ( CLEAR ?auto_34998 ) ( IS-CRATE ?auto_34999 ) ( AVAILABLE ?auto_35006 ) ( IN ?auto_34999 ?auto_35001 ) ( ON ?auto_34998 ?auto_34997 ) ( not ( = ?auto_34997 ?auto_34998 ) ) ( not ( = ?auto_34997 ?auto_34999 ) ) ( not ( = ?auto_34997 ?auto_35000 ) ) ( not ( = ?auto_34997 ?auto_35005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_34998 ?auto_34999 ?auto_35000 )
      ( MAKE-3CRATE-VERIFY ?auto_34997 ?auto_34998 ?auto_34999 ?auto_35000 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35007 - SURFACE
      ?auto_35008 - SURFACE
      ?auto_35009 - SURFACE
      ?auto_35010 - SURFACE
      ?auto_35011 - SURFACE
    )
    :vars
    (
      ?auto_35017 - HOIST
      ?auto_35015 - PLACE
      ?auto_35013 - PLACE
      ?auto_35014 - HOIST
      ?auto_35016 - SURFACE
      ?auto_35012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35017 ?auto_35015 ) ( IS-CRATE ?auto_35011 ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( not ( = ?auto_35009 ?auto_35010 ) ) ( not ( = ?auto_35009 ?auto_35011 ) ) ( not ( = ?auto_35013 ?auto_35015 ) ) ( HOIST-AT ?auto_35014 ?auto_35013 ) ( not ( = ?auto_35017 ?auto_35014 ) ) ( AVAILABLE ?auto_35014 ) ( SURFACE-AT ?auto_35011 ?auto_35013 ) ( ON ?auto_35011 ?auto_35016 ) ( CLEAR ?auto_35011 ) ( not ( = ?auto_35010 ?auto_35016 ) ) ( not ( = ?auto_35011 ?auto_35016 ) ) ( not ( = ?auto_35009 ?auto_35016 ) ) ( TRUCK-AT ?auto_35012 ?auto_35015 ) ( SURFACE-AT ?auto_35009 ?auto_35015 ) ( CLEAR ?auto_35009 ) ( IS-CRATE ?auto_35010 ) ( AVAILABLE ?auto_35017 ) ( IN ?auto_35010 ?auto_35012 ) ( ON ?auto_35008 ?auto_35007 ) ( ON ?auto_35009 ?auto_35008 ) ( not ( = ?auto_35007 ?auto_35008 ) ) ( not ( = ?auto_35007 ?auto_35009 ) ) ( not ( = ?auto_35007 ?auto_35010 ) ) ( not ( = ?auto_35007 ?auto_35011 ) ) ( not ( = ?auto_35007 ?auto_35016 ) ) ( not ( = ?auto_35008 ?auto_35009 ) ) ( not ( = ?auto_35008 ?auto_35010 ) ) ( not ( = ?auto_35008 ?auto_35011 ) ) ( not ( = ?auto_35008 ?auto_35016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35009 ?auto_35010 ?auto_35011 )
      ( MAKE-4CRATE-VERIFY ?auto_35007 ?auto_35008 ?auto_35009 ?auto_35010 ?auto_35011 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35018 - SURFACE
      ?auto_35019 - SURFACE
      ?auto_35020 - SURFACE
      ?auto_35021 - SURFACE
      ?auto_35022 - SURFACE
      ?auto_35023 - SURFACE
    )
    :vars
    (
      ?auto_35029 - HOIST
      ?auto_35027 - PLACE
      ?auto_35025 - PLACE
      ?auto_35026 - HOIST
      ?auto_35028 - SURFACE
      ?auto_35024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35029 ?auto_35027 ) ( IS-CRATE ?auto_35023 ) ( not ( = ?auto_35022 ?auto_35023 ) ) ( not ( = ?auto_35021 ?auto_35022 ) ) ( not ( = ?auto_35021 ?auto_35023 ) ) ( not ( = ?auto_35025 ?auto_35027 ) ) ( HOIST-AT ?auto_35026 ?auto_35025 ) ( not ( = ?auto_35029 ?auto_35026 ) ) ( AVAILABLE ?auto_35026 ) ( SURFACE-AT ?auto_35023 ?auto_35025 ) ( ON ?auto_35023 ?auto_35028 ) ( CLEAR ?auto_35023 ) ( not ( = ?auto_35022 ?auto_35028 ) ) ( not ( = ?auto_35023 ?auto_35028 ) ) ( not ( = ?auto_35021 ?auto_35028 ) ) ( TRUCK-AT ?auto_35024 ?auto_35027 ) ( SURFACE-AT ?auto_35021 ?auto_35027 ) ( CLEAR ?auto_35021 ) ( IS-CRATE ?auto_35022 ) ( AVAILABLE ?auto_35029 ) ( IN ?auto_35022 ?auto_35024 ) ( ON ?auto_35019 ?auto_35018 ) ( ON ?auto_35020 ?auto_35019 ) ( ON ?auto_35021 ?auto_35020 ) ( not ( = ?auto_35018 ?auto_35019 ) ) ( not ( = ?auto_35018 ?auto_35020 ) ) ( not ( = ?auto_35018 ?auto_35021 ) ) ( not ( = ?auto_35018 ?auto_35022 ) ) ( not ( = ?auto_35018 ?auto_35023 ) ) ( not ( = ?auto_35018 ?auto_35028 ) ) ( not ( = ?auto_35019 ?auto_35020 ) ) ( not ( = ?auto_35019 ?auto_35021 ) ) ( not ( = ?auto_35019 ?auto_35022 ) ) ( not ( = ?auto_35019 ?auto_35023 ) ) ( not ( = ?auto_35019 ?auto_35028 ) ) ( not ( = ?auto_35020 ?auto_35021 ) ) ( not ( = ?auto_35020 ?auto_35022 ) ) ( not ( = ?auto_35020 ?auto_35023 ) ) ( not ( = ?auto_35020 ?auto_35028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35021 ?auto_35022 ?auto_35023 )
      ( MAKE-5CRATE-VERIFY ?auto_35018 ?auto_35019 ?auto_35020 ?auto_35021 ?auto_35022 ?auto_35023 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35030 - SURFACE
      ?auto_35031 - SURFACE
    )
    :vars
    (
      ?auto_35037 - HOIST
      ?auto_35035 - PLACE
      ?auto_35038 - SURFACE
      ?auto_35033 - PLACE
      ?auto_35034 - HOIST
      ?auto_35036 - SURFACE
      ?auto_35032 - TRUCK
      ?auto_35039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35037 ?auto_35035 ) ( IS-CRATE ?auto_35031 ) ( not ( = ?auto_35030 ?auto_35031 ) ) ( not ( = ?auto_35038 ?auto_35030 ) ) ( not ( = ?auto_35038 ?auto_35031 ) ) ( not ( = ?auto_35033 ?auto_35035 ) ) ( HOIST-AT ?auto_35034 ?auto_35033 ) ( not ( = ?auto_35037 ?auto_35034 ) ) ( AVAILABLE ?auto_35034 ) ( SURFACE-AT ?auto_35031 ?auto_35033 ) ( ON ?auto_35031 ?auto_35036 ) ( CLEAR ?auto_35031 ) ( not ( = ?auto_35030 ?auto_35036 ) ) ( not ( = ?auto_35031 ?auto_35036 ) ) ( not ( = ?auto_35038 ?auto_35036 ) ) ( SURFACE-AT ?auto_35038 ?auto_35035 ) ( CLEAR ?auto_35038 ) ( IS-CRATE ?auto_35030 ) ( AVAILABLE ?auto_35037 ) ( IN ?auto_35030 ?auto_35032 ) ( TRUCK-AT ?auto_35032 ?auto_35039 ) ( not ( = ?auto_35039 ?auto_35035 ) ) ( not ( = ?auto_35033 ?auto_35039 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35032 ?auto_35039 ?auto_35035 )
      ( MAKE-2CRATE ?auto_35038 ?auto_35030 ?auto_35031 )
      ( MAKE-1CRATE-VERIFY ?auto_35030 ?auto_35031 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35040 - SURFACE
      ?auto_35041 - SURFACE
      ?auto_35042 - SURFACE
    )
    :vars
    (
      ?auto_35047 - HOIST
      ?auto_35046 - PLACE
      ?auto_35044 - PLACE
      ?auto_35048 - HOIST
      ?auto_35049 - SURFACE
      ?auto_35043 - TRUCK
      ?auto_35045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35047 ?auto_35046 ) ( IS-CRATE ?auto_35042 ) ( not ( = ?auto_35041 ?auto_35042 ) ) ( not ( = ?auto_35040 ?auto_35041 ) ) ( not ( = ?auto_35040 ?auto_35042 ) ) ( not ( = ?auto_35044 ?auto_35046 ) ) ( HOIST-AT ?auto_35048 ?auto_35044 ) ( not ( = ?auto_35047 ?auto_35048 ) ) ( AVAILABLE ?auto_35048 ) ( SURFACE-AT ?auto_35042 ?auto_35044 ) ( ON ?auto_35042 ?auto_35049 ) ( CLEAR ?auto_35042 ) ( not ( = ?auto_35041 ?auto_35049 ) ) ( not ( = ?auto_35042 ?auto_35049 ) ) ( not ( = ?auto_35040 ?auto_35049 ) ) ( SURFACE-AT ?auto_35040 ?auto_35046 ) ( CLEAR ?auto_35040 ) ( IS-CRATE ?auto_35041 ) ( AVAILABLE ?auto_35047 ) ( IN ?auto_35041 ?auto_35043 ) ( TRUCK-AT ?auto_35043 ?auto_35045 ) ( not ( = ?auto_35045 ?auto_35046 ) ) ( not ( = ?auto_35044 ?auto_35045 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35041 ?auto_35042 )
      ( MAKE-2CRATE-VERIFY ?auto_35040 ?auto_35041 ?auto_35042 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35050 - SURFACE
      ?auto_35051 - SURFACE
      ?auto_35052 - SURFACE
      ?auto_35053 - SURFACE
    )
    :vars
    (
      ?auto_35060 - HOIST
      ?auto_35058 - PLACE
      ?auto_35055 - PLACE
      ?auto_35059 - HOIST
      ?auto_35057 - SURFACE
      ?auto_35056 - TRUCK
      ?auto_35054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35060 ?auto_35058 ) ( IS-CRATE ?auto_35053 ) ( not ( = ?auto_35052 ?auto_35053 ) ) ( not ( = ?auto_35051 ?auto_35052 ) ) ( not ( = ?auto_35051 ?auto_35053 ) ) ( not ( = ?auto_35055 ?auto_35058 ) ) ( HOIST-AT ?auto_35059 ?auto_35055 ) ( not ( = ?auto_35060 ?auto_35059 ) ) ( AVAILABLE ?auto_35059 ) ( SURFACE-AT ?auto_35053 ?auto_35055 ) ( ON ?auto_35053 ?auto_35057 ) ( CLEAR ?auto_35053 ) ( not ( = ?auto_35052 ?auto_35057 ) ) ( not ( = ?auto_35053 ?auto_35057 ) ) ( not ( = ?auto_35051 ?auto_35057 ) ) ( SURFACE-AT ?auto_35051 ?auto_35058 ) ( CLEAR ?auto_35051 ) ( IS-CRATE ?auto_35052 ) ( AVAILABLE ?auto_35060 ) ( IN ?auto_35052 ?auto_35056 ) ( TRUCK-AT ?auto_35056 ?auto_35054 ) ( not ( = ?auto_35054 ?auto_35058 ) ) ( not ( = ?auto_35055 ?auto_35054 ) ) ( ON ?auto_35051 ?auto_35050 ) ( not ( = ?auto_35050 ?auto_35051 ) ) ( not ( = ?auto_35050 ?auto_35052 ) ) ( not ( = ?auto_35050 ?auto_35053 ) ) ( not ( = ?auto_35050 ?auto_35057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35051 ?auto_35052 ?auto_35053 )
      ( MAKE-3CRATE-VERIFY ?auto_35050 ?auto_35051 ?auto_35052 ?auto_35053 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35061 - SURFACE
      ?auto_35062 - SURFACE
      ?auto_35063 - SURFACE
      ?auto_35064 - SURFACE
      ?auto_35065 - SURFACE
    )
    :vars
    (
      ?auto_35072 - HOIST
      ?auto_35070 - PLACE
      ?auto_35067 - PLACE
      ?auto_35071 - HOIST
      ?auto_35069 - SURFACE
      ?auto_35068 - TRUCK
      ?auto_35066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35072 ?auto_35070 ) ( IS-CRATE ?auto_35065 ) ( not ( = ?auto_35064 ?auto_35065 ) ) ( not ( = ?auto_35063 ?auto_35064 ) ) ( not ( = ?auto_35063 ?auto_35065 ) ) ( not ( = ?auto_35067 ?auto_35070 ) ) ( HOIST-AT ?auto_35071 ?auto_35067 ) ( not ( = ?auto_35072 ?auto_35071 ) ) ( AVAILABLE ?auto_35071 ) ( SURFACE-AT ?auto_35065 ?auto_35067 ) ( ON ?auto_35065 ?auto_35069 ) ( CLEAR ?auto_35065 ) ( not ( = ?auto_35064 ?auto_35069 ) ) ( not ( = ?auto_35065 ?auto_35069 ) ) ( not ( = ?auto_35063 ?auto_35069 ) ) ( SURFACE-AT ?auto_35063 ?auto_35070 ) ( CLEAR ?auto_35063 ) ( IS-CRATE ?auto_35064 ) ( AVAILABLE ?auto_35072 ) ( IN ?auto_35064 ?auto_35068 ) ( TRUCK-AT ?auto_35068 ?auto_35066 ) ( not ( = ?auto_35066 ?auto_35070 ) ) ( not ( = ?auto_35067 ?auto_35066 ) ) ( ON ?auto_35062 ?auto_35061 ) ( ON ?auto_35063 ?auto_35062 ) ( not ( = ?auto_35061 ?auto_35062 ) ) ( not ( = ?auto_35061 ?auto_35063 ) ) ( not ( = ?auto_35061 ?auto_35064 ) ) ( not ( = ?auto_35061 ?auto_35065 ) ) ( not ( = ?auto_35061 ?auto_35069 ) ) ( not ( = ?auto_35062 ?auto_35063 ) ) ( not ( = ?auto_35062 ?auto_35064 ) ) ( not ( = ?auto_35062 ?auto_35065 ) ) ( not ( = ?auto_35062 ?auto_35069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35063 ?auto_35064 ?auto_35065 )
      ( MAKE-4CRATE-VERIFY ?auto_35061 ?auto_35062 ?auto_35063 ?auto_35064 ?auto_35065 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35073 - SURFACE
      ?auto_35074 - SURFACE
      ?auto_35075 - SURFACE
      ?auto_35076 - SURFACE
      ?auto_35077 - SURFACE
      ?auto_35078 - SURFACE
    )
    :vars
    (
      ?auto_35085 - HOIST
      ?auto_35083 - PLACE
      ?auto_35080 - PLACE
      ?auto_35084 - HOIST
      ?auto_35082 - SURFACE
      ?auto_35081 - TRUCK
      ?auto_35079 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35085 ?auto_35083 ) ( IS-CRATE ?auto_35078 ) ( not ( = ?auto_35077 ?auto_35078 ) ) ( not ( = ?auto_35076 ?auto_35077 ) ) ( not ( = ?auto_35076 ?auto_35078 ) ) ( not ( = ?auto_35080 ?auto_35083 ) ) ( HOIST-AT ?auto_35084 ?auto_35080 ) ( not ( = ?auto_35085 ?auto_35084 ) ) ( AVAILABLE ?auto_35084 ) ( SURFACE-AT ?auto_35078 ?auto_35080 ) ( ON ?auto_35078 ?auto_35082 ) ( CLEAR ?auto_35078 ) ( not ( = ?auto_35077 ?auto_35082 ) ) ( not ( = ?auto_35078 ?auto_35082 ) ) ( not ( = ?auto_35076 ?auto_35082 ) ) ( SURFACE-AT ?auto_35076 ?auto_35083 ) ( CLEAR ?auto_35076 ) ( IS-CRATE ?auto_35077 ) ( AVAILABLE ?auto_35085 ) ( IN ?auto_35077 ?auto_35081 ) ( TRUCK-AT ?auto_35081 ?auto_35079 ) ( not ( = ?auto_35079 ?auto_35083 ) ) ( not ( = ?auto_35080 ?auto_35079 ) ) ( ON ?auto_35074 ?auto_35073 ) ( ON ?auto_35075 ?auto_35074 ) ( ON ?auto_35076 ?auto_35075 ) ( not ( = ?auto_35073 ?auto_35074 ) ) ( not ( = ?auto_35073 ?auto_35075 ) ) ( not ( = ?auto_35073 ?auto_35076 ) ) ( not ( = ?auto_35073 ?auto_35077 ) ) ( not ( = ?auto_35073 ?auto_35078 ) ) ( not ( = ?auto_35073 ?auto_35082 ) ) ( not ( = ?auto_35074 ?auto_35075 ) ) ( not ( = ?auto_35074 ?auto_35076 ) ) ( not ( = ?auto_35074 ?auto_35077 ) ) ( not ( = ?auto_35074 ?auto_35078 ) ) ( not ( = ?auto_35074 ?auto_35082 ) ) ( not ( = ?auto_35075 ?auto_35076 ) ) ( not ( = ?auto_35075 ?auto_35077 ) ) ( not ( = ?auto_35075 ?auto_35078 ) ) ( not ( = ?auto_35075 ?auto_35082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35076 ?auto_35077 ?auto_35078 )
      ( MAKE-5CRATE-VERIFY ?auto_35073 ?auto_35074 ?auto_35075 ?auto_35076 ?auto_35077 ?auto_35078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35086 - SURFACE
      ?auto_35087 - SURFACE
    )
    :vars
    (
      ?auto_35095 - HOIST
      ?auto_35093 - PLACE
      ?auto_35091 - SURFACE
      ?auto_35089 - PLACE
      ?auto_35094 - HOIST
      ?auto_35092 - SURFACE
      ?auto_35090 - TRUCK
      ?auto_35088 - PLACE
      ?auto_35096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35095 ?auto_35093 ) ( IS-CRATE ?auto_35087 ) ( not ( = ?auto_35086 ?auto_35087 ) ) ( not ( = ?auto_35091 ?auto_35086 ) ) ( not ( = ?auto_35091 ?auto_35087 ) ) ( not ( = ?auto_35089 ?auto_35093 ) ) ( HOIST-AT ?auto_35094 ?auto_35089 ) ( not ( = ?auto_35095 ?auto_35094 ) ) ( AVAILABLE ?auto_35094 ) ( SURFACE-AT ?auto_35087 ?auto_35089 ) ( ON ?auto_35087 ?auto_35092 ) ( CLEAR ?auto_35087 ) ( not ( = ?auto_35086 ?auto_35092 ) ) ( not ( = ?auto_35087 ?auto_35092 ) ) ( not ( = ?auto_35091 ?auto_35092 ) ) ( SURFACE-AT ?auto_35091 ?auto_35093 ) ( CLEAR ?auto_35091 ) ( IS-CRATE ?auto_35086 ) ( AVAILABLE ?auto_35095 ) ( TRUCK-AT ?auto_35090 ?auto_35088 ) ( not ( = ?auto_35088 ?auto_35093 ) ) ( not ( = ?auto_35089 ?auto_35088 ) ) ( HOIST-AT ?auto_35096 ?auto_35088 ) ( LIFTING ?auto_35096 ?auto_35086 ) ( not ( = ?auto_35095 ?auto_35096 ) ) ( not ( = ?auto_35094 ?auto_35096 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35096 ?auto_35086 ?auto_35090 ?auto_35088 )
      ( MAKE-2CRATE ?auto_35091 ?auto_35086 ?auto_35087 )
      ( MAKE-1CRATE-VERIFY ?auto_35086 ?auto_35087 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35097 - SURFACE
      ?auto_35098 - SURFACE
      ?auto_35099 - SURFACE
    )
    :vars
    (
      ?auto_35100 - HOIST
      ?auto_35102 - PLACE
      ?auto_35107 - PLACE
      ?auto_35101 - HOIST
      ?auto_35104 - SURFACE
      ?auto_35106 - TRUCK
      ?auto_35103 - PLACE
      ?auto_35105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35100 ?auto_35102 ) ( IS-CRATE ?auto_35099 ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35097 ?auto_35098 ) ) ( not ( = ?auto_35097 ?auto_35099 ) ) ( not ( = ?auto_35107 ?auto_35102 ) ) ( HOIST-AT ?auto_35101 ?auto_35107 ) ( not ( = ?auto_35100 ?auto_35101 ) ) ( AVAILABLE ?auto_35101 ) ( SURFACE-AT ?auto_35099 ?auto_35107 ) ( ON ?auto_35099 ?auto_35104 ) ( CLEAR ?auto_35099 ) ( not ( = ?auto_35098 ?auto_35104 ) ) ( not ( = ?auto_35099 ?auto_35104 ) ) ( not ( = ?auto_35097 ?auto_35104 ) ) ( SURFACE-AT ?auto_35097 ?auto_35102 ) ( CLEAR ?auto_35097 ) ( IS-CRATE ?auto_35098 ) ( AVAILABLE ?auto_35100 ) ( TRUCK-AT ?auto_35106 ?auto_35103 ) ( not ( = ?auto_35103 ?auto_35102 ) ) ( not ( = ?auto_35107 ?auto_35103 ) ) ( HOIST-AT ?auto_35105 ?auto_35103 ) ( LIFTING ?auto_35105 ?auto_35098 ) ( not ( = ?auto_35100 ?auto_35105 ) ) ( not ( = ?auto_35101 ?auto_35105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35098 ?auto_35099 )
      ( MAKE-2CRATE-VERIFY ?auto_35097 ?auto_35098 ?auto_35099 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35108 - SURFACE
      ?auto_35109 - SURFACE
      ?auto_35110 - SURFACE
      ?auto_35111 - SURFACE
    )
    :vars
    (
      ?auto_35117 - HOIST
      ?auto_35116 - PLACE
      ?auto_35118 - PLACE
      ?auto_35115 - HOIST
      ?auto_35113 - SURFACE
      ?auto_35112 - TRUCK
      ?auto_35119 - PLACE
      ?auto_35114 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35117 ?auto_35116 ) ( IS-CRATE ?auto_35111 ) ( not ( = ?auto_35110 ?auto_35111 ) ) ( not ( = ?auto_35109 ?auto_35110 ) ) ( not ( = ?auto_35109 ?auto_35111 ) ) ( not ( = ?auto_35118 ?auto_35116 ) ) ( HOIST-AT ?auto_35115 ?auto_35118 ) ( not ( = ?auto_35117 ?auto_35115 ) ) ( AVAILABLE ?auto_35115 ) ( SURFACE-AT ?auto_35111 ?auto_35118 ) ( ON ?auto_35111 ?auto_35113 ) ( CLEAR ?auto_35111 ) ( not ( = ?auto_35110 ?auto_35113 ) ) ( not ( = ?auto_35111 ?auto_35113 ) ) ( not ( = ?auto_35109 ?auto_35113 ) ) ( SURFACE-AT ?auto_35109 ?auto_35116 ) ( CLEAR ?auto_35109 ) ( IS-CRATE ?auto_35110 ) ( AVAILABLE ?auto_35117 ) ( TRUCK-AT ?auto_35112 ?auto_35119 ) ( not ( = ?auto_35119 ?auto_35116 ) ) ( not ( = ?auto_35118 ?auto_35119 ) ) ( HOIST-AT ?auto_35114 ?auto_35119 ) ( LIFTING ?auto_35114 ?auto_35110 ) ( not ( = ?auto_35117 ?auto_35114 ) ) ( not ( = ?auto_35115 ?auto_35114 ) ) ( ON ?auto_35109 ?auto_35108 ) ( not ( = ?auto_35108 ?auto_35109 ) ) ( not ( = ?auto_35108 ?auto_35110 ) ) ( not ( = ?auto_35108 ?auto_35111 ) ) ( not ( = ?auto_35108 ?auto_35113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35109 ?auto_35110 ?auto_35111 )
      ( MAKE-3CRATE-VERIFY ?auto_35108 ?auto_35109 ?auto_35110 ?auto_35111 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35120 - SURFACE
      ?auto_35121 - SURFACE
      ?auto_35122 - SURFACE
      ?auto_35123 - SURFACE
      ?auto_35124 - SURFACE
    )
    :vars
    (
      ?auto_35130 - HOIST
      ?auto_35129 - PLACE
      ?auto_35131 - PLACE
      ?auto_35128 - HOIST
      ?auto_35126 - SURFACE
      ?auto_35125 - TRUCK
      ?auto_35132 - PLACE
      ?auto_35127 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35130 ?auto_35129 ) ( IS-CRATE ?auto_35124 ) ( not ( = ?auto_35123 ?auto_35124 ) ) ( not ( = ?auto_35122 ?auto_35123 ) ) ( not ( = ?auto_35122 ?auto_35124 ) ) ( not ( = ?auto_35131 ?auto_35129 ) ) ( HOIST-AT ?auto_35128 ?auto_35131 ) ( not ( = ?auto_35130 ?auto_35128 ) ) ( AVAILABLE ?auto_35128 ) ( SURFACE-AT ?auto_35124 ?auto_35131 ) ( ON ?auto_35124 ?auto_35126 ) ( CLEAR ?auto_35124 ) ( not ( = ?auto_35123 ?auto_35126 ) ) ( not ( = ?auto_35124 ?auto_35126 ) ) ( not ( = ?auto_35122 ?auto_35126 ) ) ( SURFACE-AT ?auto_35122 ?auto_35129 ) ( CLEAR ?auto_35122 ) ( IS-CRATE ?auto_35123 ) ( AVAILABLE ?auto_35130 ) ( TRUCK-AT ?auto_35125 ?auto_35132 ) ( not ( = ?auto_35132 ?auto_35129 ) ) ( not ( = ?auto_35131 ?auto_35132 ) ) ( HOIST-AT ?auto_35127 ?auto_35132 ) ( LIFTING ?auto_35127 ?auto_35123 ) ( not ( = ?auto_35130 ?auto_35127 ) ) ( not ( = ?auto_35128 ?auto_35127 ) ) ( ON ?auto_35121 ?auto_35120 ) ( ON ?auto_35122 ?auto_35121 ) ( not ( = ?auto_35120 ?auto_35121 ) ) ( not ( = ?auto_35120 ?auto_35122 ) ) ( not ( = ?auto_35120 ?auto_35123 ) ) ( not ( = ?auto_35120 ?auto_35124 ) ) ( not ( = ?auto_35120 ?auto_35126 ) ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35123 ) ) ( not ( = ?auto_35121 ?auto_35124 ) ) ( not ( = ?auto_35121 ?auto_35126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35122 ?auto_35123 ?auto_35124 )
      ( MAKE-4CRATE-VERIFY ?auto_35120 ?auto_35121 ?auto_35122 ?auto_35123 ?auto_35124 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35133 - SURFACE
      ?auto_35134 - SURFACE
      ?auto_35135 - SURFACE
      ?auto_35136 - SURFACE
      ?auto_35137 - SURFACE
      ?auto_35138 - SURFACE
    )
    :vars
    (
      ?auto_35144 - HOIST
      ?auto_35143 - PLACE
      ?auto_35145 - PLACE
      ?auto_35142 - HOIST
      ?auto_35140 - SURFACE
      ?auto_35139 - TRUCK
      ?auto_35146 - PLACE
      ?auto_35141 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35144 ?auto_35143 ) ( IS-CRATE ?auto_35138 ) ( not ( = ?auto_35137 ?auto_35138 ) ) ( not ( = ?auto_35136 ?auto_35137 ) ) ( not ( = ?auto_35136 ?auto_35138 ) ) ( not ( = ?auto_35145 ?auto_35143 ) ) ( HOIST-AT ?auto_35142 ?auto_35145 ) ( not ( = ?auto_35144 ?auto_35142 ) ) ( AVAILABLE ?auto_35142 ) ( SURFACE-AT ?auto_35138 ?auto_35145 ) ( ON ?auto_35138 ?auto_35140 ) ( CLEAR ?auto_35138 ) ( not ( = ?auto_35137 ?auto_35140 ) ) ( not ( = ?auto_35138 ?auto_35140 ) ) ( not ( = ?auto_35136 ?auto_35140 ) ) ( SURFACE-AT ?auto_35136 ?auto_35143 ) ( CLEAR ?auto_35136 ) ( IS-CRATE ?auto_35137 ) ( AVAILABLE ?auto_35144 ) ( TRUCK-AT ?auto_35139 ?auto_35146 ) ( not ( = ?auto_35146 ?auto_35143 ) ) ( not ( = ?auto_35145 ?auto_35146 ) ) ( HOIST-AT ?auto_35141 ?auto_35146 ) ( LIFTING ?auto_35141 ?auto_35137 ) ( not ( = ?auto_35144 ?auto_35141 ) ) ( not ( = ?auto_35142 ?auto_35141 ) ) ( ON ?auto_35134 ?auto_35133 ) ( ON ?auto_35135 ?auto_35134 ) ( ON ?auto_35136 ?auto_35135 ) ( not ( = ?auto_35133 ?auto_35134 ) ) ( not ( = ?auto_35133 ?auto_35135 ) ) ( not ( = ?auto_35133 ?auto_35136 ) ) ( not ( = ?auto_35133 ?auto_35137 ) ) ( not ( = ?auto_35133 ?auto_35138 ) ) ( not ( = ?auto_35133 ?auto_35140 ) ) ( not ( = ?auto_35134 ?auto_35135 ) ) ( not ( = ?auto_35134 ?auto_35136 ) ) ( not ( = ?auto_35134 ?auto_35137 ) ) ( not ( = ?auto_35134 ?auto_35138 ) ) ( not ( = ?auto_35134 ?auto_35140 ) ) ( not ( = ?auto_35135 ?auto_35136 ) ) ( not ( = ?auto_35135 ?auto_35137 ) ) ( not ( = ?auto_35135 ?auto_35138 ) ) ( not ( = ?auto_35135 ?auto_35140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35136 ?auto_35137 ?auto_35138 )
      ( MAKE-5CRATE-VERIFY ?auto_35133 ?auto_35134 ?auto_35135 ?auto_35136 ?auto_35137 ?auto_35138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35147 - SURFACE
      ?auto_35148 - SURFACE
    )
    :vars
    (
      ?auto_35155 - HOIST
      ?auto_35154 - PLACE
      ?auto_35151 - SURFACE
      ?auto_35156 - PLACE
      ?auto_35153 - HOIST
      ?auto_35150 - SURFACE
      ?auto_35149 - TRUCK
      ?auto_35157 - PLACE
      ?auto_35152 - HOIST
      ?auto_35158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35155 ?auto_35154 ) ( IS-CRATE ?auto_35148 ) ( not ( = ?auto_35147 ?auto_35148 ) ) ( not ( = ?auto_35151 ?auto_35147 ) ) ( not ( = ?auto_35151 ?auto_35148 ) ) ( not ( = ?auto_35156 ?auto_35154 ) ) ( HOIST-AT ?auto_35153 ?auto_35156 ) ( not ( = ?auto_35155 ?auto_35153 ) ) ( AVAILABLE ?auto_35153 ) ( SURFACE-AT ?auto_35148 ?auto_35156 ) ( ON ?auto_35148 ?auto_35150 ) ( CLEAR ?auto_35148 ) ( not ( = ?auto_35147 ?auto_35150 ) ) ( not ( = ?auto_35148 ?auto_35150 ) ) ( not ( = ?auto_35151 ?auto_35150 ) ) ( SURFACE-AT ?auto_35151 ?auto_35154 ) ( CLEAR ?auto_35151 ) ( IS-CRATE ?auto_35147 ) ( AVAILABLE ?auto_35155 ) ( TRUCK-AT ?auto_35149 ?auto_35157 ) ( not ( = ?auto_35157 ?auto_35154 ) ) ( not ( = ?auto_35156 ?auto_35157 ) ) ( HOIST-AT ?auto_35152 ?auto_35157 ) ( not ( = ?auto_35155 ?auto_35152 ) ) ( not ( = ?auto_35153 ?auto_35152 ) ) ( AVAILABLE ?auto_35152 ) ( SURFACE-AT ?auto_35147 ?auto_35157 ) ( ON ?auto_35147 ?auto_35158 ) ( CLEAR ?auto_35147 ) ( not ( = ?auto_35147 ?auto_35158 ) ) ( not ( = ?auto_35148 ?auto_35158 ) ) ( not ( = ?auto_35151 ?auto_35158 ) ) ( not ( = ?auto_35150 ?auto_35158 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35152 ?auto_35147 ?auto_35158 ?auto_35157 )
      ( MAKE-2CRATE ?auto_35151 ?auto_35147 ?auto_35148 )
      ( MAKE-1CRATE-VERIFY ?auto_35147 ?auto_35148 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35159 - SURFACE
      ?auto_35160 - SURFACE
      ?auto_35161 - SURFACE
    )
    :vars
    (
      ?auto_35166 - HOIST
      ?auto_35169 - PLACE
      ?auto_35170 - PLACE
      ?auto_35163 - HOIST
      ?auto_35162 - SURFACE
      ?auto_35167 - TRUCK
      ?auto_35168 - PLACE
      ?auto_35165 - HOIST
      ?auto_35164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35166 ?auto_35169 ) ( IS-CRATE ?auto_35161 ) ( not ( = ?auto_35160 ?auto_35161 ) ) ( not ( = ?auto_35159 ?auto_35160 ) ) ( not ( = ?auto_35159 ?auto_35161 ) ) ( not ( = ?auto_35170 ?auto_35169 ) ) ( HOIST-AT ?auto_35163 ?auto_35170 ) ( not ( = ?auto_35166 ?auto_35163 ) ) ( AVAILABLE ?auto_35163 ) ( SURFACE-AT ?auto_35161 ?auto_35170 ) ( ON ?auto_35161 ?auto_35162 ) ( CLEAR ?auto_35161 ) ( not ( = ?auto_35160 ?auto_35162 ) ) ( not ( = ?auto_35161 ?auto_35162 ) ) ( not ( = ?auto_35159 ?auto_35162 ) ) ( SURFACE-AT ?auto_35159 ?auto_35169 ) ( CLEAR ?auto_35159 ) ( IS-CRATE ?auto_35160 ) ( AVAILABLE ?auto_35166 ) ( TRUCK-AT ?auto_35167 ?auto_35168 ) ( not ( = ?auto_35168 ?auto_35169 ) ) ( not ( = ?auto_35170 ?auto_35168 ) ) ( HOIST-AT ?auto_35165 ?auto_35168 ) ( not ( = ?auto_35166 ?auto_35165 ) ) ( not ( = ?auto_35163 ?auto_35165 ) ) ( AVAILABLE ?auto_35165 ) ( SURFACE-AT ?auto_35160 ?auto_35168 ) ( ON ?auto_35160 ?auto_35164 ) ( CLEAR ?auto_35160 ) ( not ( = ?auto_35160 ?auto_35164 ) ) ( not ( = ?auto_35161 ?auto_35164 ) ) ( not ( = ?auto_35159 ?auto_35164 ) ) ( not ( = ?auto_35162 ?auto_35164 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35160 ?auto_35161 )
      ( MAKE-2CRATE-VERIFY ?auto_35159 ?auto_35160 ?auto_35161 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35171 - SURFACE
      ?auto_35172 - SURFACE
      ?auto_35173 - SURFACE
      ?auto_35174 - SURFACE
    )
    :vars
    (
      ?auto_35175 - HOIST
      ?auto_35180 - PLACE
      ?auto_35179 - PLACE
      ?auto_35177 - HOIST
      ?auto_35176 - SURFACE
      ?auto_35181 - TRUCK
      ?auto_35183 - PLACE
      ?auto_35182 - HOIST
      ?auto_35178 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35175 ?auto_35180 ) ( IS-CRATE ?auto_35174 ) ( not ( = ?auto_35173 ?auto_35174 ) ) ( not ( = ?auto_35172 ?auto_35173 ) ) ( not ( = ?auto_35172 ?auto_35174 ) ) ( not ( = ?auto_35179 ?auto_35180 ) ) ( HOIST-AT ?auto_35177 ?auto_35179 ) ( not ( = ?auto_35175 ?auto_35177 ) ) ( AVAILABLE ?auto_35177 ) ( SURFACE-AT ?auto_35174 ?auto_35179 ) ( ON ?auto_35174 ?auto_35176 ) ( CLEAR ?auto_35174 ) ( not ( = ?auto_35173 ?auto_35176 ) ) ( not ( = ?auto_35174 ?auto_35176 ) ) ( not ( = ?auto_35172 ?auto_35176 ) ) ( SURFACE-AT ?auto_35172 ?auto_35180 ) ( CLEAR ?auto_35172 ) ( IS-CRATE ?auto_35173 ) ( AVAILABLE ?auto_35175 ) ( TRUCK-AT ?auto_35181 ?auto_35183 ) ( not ( = ?auto_35183 ?auto_35180 ) ) ( not ( = ?auto_35179 ?auto_35183 ) ) ( HOIST-AT ?auto_35182 ?auto_35183 ) ( not ( = ?auto_35175 ?auto_35182 ) ) ( not ( = ?auto_35177 ?auto_35182 ) ) ( AVAILABLE ?auto_35182 ) ( SURFACE-AT ?auto_35173 ?auto_35183 ) ( ON ?auto_35173 ?auto_35178 ) ( CLEAR ?auto_35173 ) ( not ( = ?auto_35173 ?auto_35178 ) ) ( not ( = ?auto_35174 ?auto_35178 ) ) ( not ( = ?auto_35172 ?auto_35178 ) ) ( not ( = ?auto_35176 ?auto_35178 ) ) ( ON ?auto_35172 ?auto_35171 ) ( not ( = ?auto_35171 ?auto_35172 ) ) ( not ( = ?auto_35171 ?auto_35173 ) ) ( not ( = ?auto_35171 ?auto_35174 ) ) ( not ( = ?auto_35171 ?auto_35176 ) ) ( not ( = ?auto_35171 ?auto_35178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35172 ?auto_35173 ?auto_35174 )
      ( MAKE-3CRATE-VERIFY ?auto_35171 ?auto_35172 ?auto_35173 ?auto_35174 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35184 - SURFACE
      ?auto_35185 - SURFACE
      ?auto_35186 - SURFACE
      ?auto_35187 - SURFACE
      ?auto_35188 - SURFACE
    )
    :vars
    (
      ?auto_35189 - HOIST
      ?auto_35194 - PLACE
      ?auto_35193 - PLACE
      ?auto_35191 - HOIST
      ?auto_35190 - SURFACE
      ?auto_35195 - TRUCK
      ?auto_35197 - PLACE
      ?auto_35196 - HOIST
      ?auto_35192 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35189 ?auto_35194 ) ( IS-CRATE ?auto_35188 ) ( not ( = ?auto_35187 ?auto_35188 ) ) ( not ( = ?auto_35186 ?auto_35187 ) ) ( not ( = ?auto_35186 ?auto_35188 ) ) ( not ( = ?auto_35193 ?auto_35194 ) ) ( HOIST-AT ?auto_35191 ?auto_35193 ) ( not ( = ?auto_35189 ?auto_35191 ) ) ( AVAILABLE ?auto_35191 ) ( SURFACE-AT ?auto_35188 ?auto_35193 ) ( ON ?auto_35188 ?auto_35190 ) ( CLEAR ?auto_35188 ) ( not ( = ?auto_35187 ?auto_35190 ) ) ( not ( = ?auto_35188 ?auto_35190 ) ) ( not ( = ?auto_35186 ?auto_35190 ) ) ( SURFACE-AT ?auto_35186 ?auto_35194 ) ( CLEAR ?auto_35186 ) ( IS-CRATE ?auto_35187 ) ( AVAILABLE ?auto_35189 ) ( TRUCK-AT ?auto_35195 ?auto_35197 ) ( not ( = ?auto_35197 ?auto_35194 ) ) ( not ( = ?auto_35193 ?auto_35197 ) ) ( HOIST-AT ?auto_35196 ?auto_35197 ) ( not ( = ?auto_35189 ?auto_35196 ) ) ( not ( = ?auto_35191 ?auto_35196 ) ) ( AVAILABLE ?auto_35196 ) ( SURFACE-AT ?auto_35187 ?auto_35197 ) ( ON ?auto_35187 ?auto_35192 ) ( CLEAR ?auto_35187 ) ( not ( = ?auto_35187 ?auto_35192 ) ) ( not ( = ?auto_35188 ?auto_35192 ) ) ( not ( = ?auto_35186 ?auto_35192 ) ) ( not ( = ?auto_35190 ?auto_35192 ) ) ( ON ?auto_35185 ?auto_35184 ) ( ON ?auto_35186 ?auto_35185 ) ( not ( = ?auto_35184 ?auto_35185 ) ) ( not ( = ?auto_35184 ?auto_35186 ) ) ( not ( = ?auto_35184 ?auto_35187 ) ) ( not ( = ?auto_35184 ?auto_35188 ) ) ( not ( = ?auto_35184 ?auto_35190 ) ) ( not ( = ?auto_35184 ?auto_35192 ) ) ( not ( = ?auto_35185 ?auto_35186 ) ) ( not ( = ?auto_35185 ?auto_35187 ) ) ( not ( = ?auto_35185 ?auto_35188 ) ) ( not ( = ?auto_35185 ?auto_35190 ) ) ( not ( = ?auto_35185 ?auto_35192 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35186 ?auto_35187 ?auto_35188 )
      ( MAKE-4CRATE-VERIFY ?auto_35184 ?auto_35185 ?auto_35186 ?auto_35187 ?auto_35188 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35198 - SURFACE
      ?auto_35199 - SURFACE
      ?auto_35200 - SURFACE
      ?auto_35201 - SURFACE
      ?auto_35202 - SURFACE
      ?auto_35203 - SURFACE
    )
    :vars
    (
      ?auto_35204 - HOIST
      ?auto_35209 - PLACE
      ?auto_35208 - PLACE
      ?auto_35206 - HOIST
      ?auto_35205 - SURFACE
      ?auto_35210 - TRUCK
      ?auto_35212 - PLACE
      ?auto_35211 - HOIST
      ?auto_35207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35204 ?auto_35209 ) ( IS-CRATE ?auto_35203 ) ( not ( = ?auto_35202 ?auto_35203 ) ) ( not ( = ?auto_35201 ?auto_35202 ) ) ( not ( = ?auto_35201 ?auto_35203 ) ) ( not ( = ?auto_35208 ?auto_35209 ) ) ( HOIST-AT ?auto_35206 ?auto_35208 ) ( not ( = ?auto_35204 ?auto_35206 ) ) ( AVAILABLE ?auto_35206 ) ( SURFACE-AT ?auto_35203 ?auto_35208 ) ( ON ?auto_35203 ?auto_35205 ) ( CLEAR ?auto_35203 ) ( not ( = ?auto_35202 ?auto_35205 ) ) ( not ( = ?auto_35203 ?auto_35205 ) ) ( not ( = ?auto_35201 ?auto_35205 ) ) ( SURFACE-AT ?auto_35201 ?auto_35209 ) ( CLEAR ?auto_35201 ) ( IS-CRATE ?auto_35202 ) ( AVAILABLE ?auto_35204 ) ( TRUCK-AT ?auto_35210 ?auto_35212 ) ( not ( = ?auto_35212 ?auto_35209 ) ) ( not ( = ?auto_35208 ?auto_35212 ) ) ( HOIST-AT ?auto_35211 ?auto_35212 ) ( not ( = ?auto_35204 ?auto_35211 ) ) ( not ( = ?auto_35206 ?auto_35211 ) ) ( AVAILABLE ?auto_35211 ) ( SURFACE-AT ?auto_35202 ?auto_35212 ) ( ON ?auto_35202 ?auto_35207 ) ( CLEAR ?auto_35202 ) ( not ( = ?auto_35202 ?auto_35207 ) ) ( not ( = ?auto_35203 ?auto_35207 ) ) ( not ( = ?auto_35201 ?auto_35207 ) ) ( not ( = ?auto_35205 ?auto_35207 ) ) ( ON ?auto_35199 ?auto_35198 ) ( ON ?auto_35200 ?auto_35199 ) ( ON ?auto_35201 ?auto_35200 ) ( not ( = ?auto_35198 ?auto_35199 ) ) ( not ( = ?auto_35198 ?auto_35200 ) ) ( not ( = ?auto_35198 ?auto_35201 ) ) ( not ( = ?auto_35198 ?auto_35202 ) ) ( not ( = ?auto_35198 ?auto_35203 ) ) ( not ( = ?auto_35198 ?auto_35205 ) ) ( not ( = ?auto_35198 ?auto_35207 ) ) ( not ( = ?auto_35199 ?auto_35200 ) ) ( not ( = ?auto_35199 ?auto_35201 ) ) ( not ( = ?auto_35199 ?auto_35202 ) ) ( not ( = ?auto_35199 ?auto_35203 ) ) ( not ( = ?auto_35199 ?auto_35205 ) ) ( not ( = ?auto_35199 ?auto_35207 ) ) ( not ( = ?auto_35200 ?auto_35201 ) ) ( not ( = ?auto_35200 ?auto_35202 ) ) ( not ( = ?auto_35200 ?auto_35203 ) ) ( not ( = ?auto_35200 ?auto_35205 ) ) ( not ( = ?auto_35200 ?auto_35207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35201 ?auto_35202 ?auto_35203 )
      ( MAKE-5CRATE-VERIFY ?auto_35198 ?auto_35199 ?auto_35200 ?auto_35201 ?auto_35202 ?auto_35203 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35213 - SURFACE
      ?auto_35214 - SURFACE
    )
    :vars
    (
      ?auto_35215 - HOIST
      ?auto_35220 - PLACE
      ?auto_35222 - SURFACE
      ?auto_35219 - PLACE
      ?auto_35217 - HOIST
      ?auto_35216 - SURFACE
      ?auto_35224 - PLACE
      ?auto_35223 - HOIST
      ?auto_35218 - SURFACE
      ?auto_35221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35215 ?auto_35220 ) ( IS-CRATE ?auto_35214 ) ( not ( = ?auto_35213 ?auto_35214 ) ) ( not ( = ?auto_35222 ?auto_35213 ) ) ( not ( = ?auto_35222 ?auto_35214 ) ) ( not ( = ?auto_35219 ?auto_35220 ) ) ( HOIST-AT ?auto_35217 ?auto_35219 ) ( not ( = ?auto_35215 ?auto_35217 ) ) ( AVAILABLE ?auto_35217 ) ( SURFACE-AT ?auto_35214 ?auto_35219 ) ( ON ?auto_35214 ?auto_35216 ) ( CLEAR ?auto_35214 ) ( not ( = ?auto_35213 ?auto_35216 ) ) ( not ( = ?auto_35214 ?auto_35216 ) ) ( not ( = ?auto_35222 ?auto_35216 ) ) ( SURFACE-AT ?auto_35222 ?auto_35220 ) ( CLEAR ?auto_35222 ) ( IS-CRATE ?auto_35213 ) ( AVAILABLE ?auto_35215 ) ( not ( = ?auto_35224 ?auto_35220 ) ) ( not ( = ?auto_35219 ?auto_35224 ) ) ( HOIST-AT ?auto_35223 ?auto_35224 ) ( not ( = ?auto_35215 ?auto_35223 ) ) ( not ( = ?auto_35217 ?auto_35223 ) ) ( AVAILABLE ?auto_35223 ) ( SURFACE-AT ?auto_35213 ?auto_35224 ) ( ON ?auto_35213 ?auto_35218 ) ( CLEAR ?auto_35213 ) ( not ( = ?auto_35213 ?auto_35218 ) ) ( not ( = ?auto_35214 ?auto_35218 ) ) ( not ( = ?auto_35222 ?auto_35218 ) ) ( not ( = ?auto_35216 ?auto_35218 ) ) ( TRUCK-AT ?auto_35221 ?auto_35220 ) )
    :subtasks
    ( ( !DRIVE ?auto_35221 ?auto_35220 ?auto_35224 )
      ( MAKE-2CRATE ?auto_35222 ?auto_35213 ?auto_35214 )
      ( MAKE-1CRATE-VERIFY ?auto_35213 ?auto_35214 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35225 - SURFACE
      ?auto_35226 - SURFACE
      ?auto_35227 - SURFACE
    )
    :vars
    (
      ?auto_35236 - HOIST
      ?auto_35228 - PLACE
      ?auto_35231 - PLACE
      ?auto_35233 - HOIST
      ?auto_35232 - SURFACE
      ?auto_35234 - PLACE
      ?auto_35230 - HOIST
      ?auto_35235 - SURFACE
      ?auto_35229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35236 ?auto_35228 ) ( IS-CRATE ?auto_35227 ) ( not ( = ?auto_35226 ?auto_35227 ) ) ( not ( = ?auto_35225 ?auto_35226 ) ) ( not ( = ?auto_35225 ?auto_35227 ) ) ( not ( = ?auto_35231 ?auto_35228 ) ) ( HOIST-AT ?auto_35233 ?auto_35231 ) ( not ( = ?auto_35236 ?auto_35233 ) ) ( AVAILABLE ?auto_35233 ) ( SURFACE-AT ?auto_35227 ?auto_35231 ) ( ON ?auto_35227 ?auto_35232 ) ( CLEAR ?auto_35227 ) ( not ( = ?auto_35226 ?auto_35232 ) ) ( not ( = ?auto_35227 ?auto_35232 ) ) ( not ( = ?auto_35225 ?auto_35232 ) ) ( SURFACE-AT ?auto_35225 ?auto_35228 ) ( CLEAR ?auto_35225 ) ( IS-CRATE ?auto_35226 ) ( AVAILABLE ?auto_35236 ) ( not ( = ?auto_35234 ?auto_35228 ) ) ( not ( = ?auto_35231 ?auto_35234 ) ) ( HOIST-AT ?auto_35230 ?auto_35234 ) ( not ( = ?auto_35236 ?auto_35230 ) ) ( not ( = ?auto_35233 ?auto_35230 ) ) ( AVAILABLE ?auto_35230 ) ( SURFACE-AT ?auto_35226 ?auto_35234 ) ( ON ?auto_35226 ?auto_35235 ) ( CLEAR ?auto_35226 ) ( not ( = ?auto_35226 ?auto_35235 ) ) ( not ( = ?auto_35227 ?auto_35235 ) ) ( not ( = ?auto_35225 ?auto_35235 ) ) ( not ( = ?auto_35232 ?auto_35235 ) ) ( TRUCK-AT ?auto_35229 ?auto_35228 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35226 ?auto_35227 )
      ( MAKE-2CRATE-VERIFY ?auto_35225 ?auto_35226 ?auto_35227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35237 - SURFACE
      ?auto_35238 - SURFACE
      ?auto_35239 - SURFACE
      ?auto_35240 - SURFACE
    )
    :vars
    (
      ?auto_35248 - HOIST
      ?auto_35249 - PLACE
      ?auto_35244 - PLACE
      ?auto_35245 - HOIST
      ?auto_35241 - SURFACE
      ?auto_35242 - PLACE
      ?auto_35246 - HOIST
      ?auto_35243 - SURFACE
      ?auto_35247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35248 ?auto_35249 ) ( IS-CRATE ?auto_35240 ) ( not ( = ?auto_35239 ?auto_35240 ) ) ( not ( = ?auto_35238 ?auto_35239 ) ) ( not ( = ?auto_35238 ?auto_35240 ) ) ( not ( = ?auto_35244 ?auto_35249 ) ) ( HOIST-AT ?auto_35245 ?auto_35244 ) ( not ( = ?auto_35248 ?auto_35245 ) ) ( AVAILABLE ?auto_35245 ) ( SURFACE-AT ?auto_35240 ?auto_35244 ) ( ON ?auto_35240 ?auto_35241 ) ( CLEAR ?auto_35240 ) ( not ( = ?auto_35239 ?auto_35241 ) ) ( not ( = ?auto_35240 ?auto_35241 ) ) ( not ( = ?auto_35238 ?auto_35241 ) ) ( SURFACE-AT ?auto_35238 ?auto_35249 ) ( CLEAR ?auto_35238 ) ( IS-CRATE ?auto_35239 ) ( AVAILABLE ?auto_35248 ) ( not ( = ?auto_35242 ?auto_35249 ) ) ( not ( = ?auto_35244 ?auto_35242 ) ) ( HOIST-AT ?auto_35246 ?auto_35242 ) ( not ( = ?auto_35248 ?auto_35246 ) ) ( not ( = ?auto_35245 ?auto_35246 ) ) ( AVAILABLE ?auto_35246 ) ( SURFACE-AT ?auto_35239 ?auto_35242 ) ( ON ?auto_35239 ?auto_35243 ) ( CLEAR ?auto_35239 ) ( not ( = ?auto_35239 ?auto_35243 ) ) ( not ( = ?auto_35240 ?auto_35243 ) ) ( not ( = ?auto_35238 ?auto_35243 ) ) ( not ( = ?auto_35241 ?auto_35243 ) ) ( TRUCK-AT ?auto_35247 ?auto_35249 ) ( ON ?auto_35238 ?auto_35237 ) ( not ( = ?auto_35237 ?auto_35238 ) ) ( not ( = ?auto_35237 ?auto_35239 ) ) ( not ( = ?auto_35237 ?auto_35240 ) ) ( not ( = ?auto_35237 ?auto_35241 ) ) ( not ( = ?auto_35237 ?auto_35243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35238 ?auto_35239 ?auto_35240 )
      ( MAKE-3CRATE-VERIFY ?auto_35237 ?auto_35238 ?auto_35239 ?auto_35240 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35250 - SURFACE
      ?auto_35251 - SURFACE
      ?auto_35252 - SURFACE
      ?auto_35253 - SURFACE
      ?auto_35254 - SURFACE
    )
    :vars
    (
      ?auto_35262 - HOIST
      ?auto_35263 - PLACE
      ?auto_35258 - PLACE
      ?auto_35259 - HOIST
      ?auto_35255 - SURFACE
      ?auto_35256 - PLACE
      ?auto_35260 - HOIST
      ?auto_35257 - SURFACE
      ?auto_35261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35262 ?auto_35263 ) ( IS-CRATE ?auto_35254 ) ( not ( = ?auto_35253 ?auto_35254 ) ) ( not ( = ?auto_35252 ?auto_35253 ) ) ( not ( = ?auto_35252 ?auto_35254 ) ) ( not ( = ?auto_35258 ?auto_35263 ) ) ( HOIST-AT ?auto_35259 ?auto_35258 ) ( not ( = ?auto_35262 ?auto_35259 ) ) ( AVAILABLE ?auto_35259 ) ( SURFACE-AT ?auto_35254 ?auto_35258 ) ( ON ?auto_35254 ?auto_35255 ) ( CLEAR ?auto_35254 ) ( not ( = ?auto_35253 ?auto_35255 ) ) ( not ( = ?auto_35254 ?auto_35255 ) ) ( not ( = ?auto_35252 ?auto_35255 ) ) ( SURFACE-AT ?auto_35252 ?auto_35263 ) ( CLEAR ?auto_35252 ) ( IS-CRATE ?auto_35253 ) ( AVAILABLE ?auto_35262 ) ( not ( = ?auto_35256 ?auto_35263 ) ) ( not ( = ?auto_35258 ?auto_35256 ) ) ( HOIST-AT ?auto_35260 ?auto_35256 ) ( not ( = ?auto_35262 ?auto_35260 ) ) ( not ( = ?auto_35259 ?auto_35260 ) ) ( AVAILABLE ?auto_35260 ) ( SURFACE-AT ?auto_35253 ?auto_35256 ) ( ON ?auto_35253 ?auto_35257 ) ( CLEAR ?auto_35253 ) ( not ( = ?auto_35253 ?auto_35257 ) ) ( not ( = ?auto_35254 ?auto_35257 ) ) ( not ( = ?auto_35252 ?auto_35257 ) ) ( not ( = ?auto_35255 ?auto_35257 ) ) ( TRUCK-AT ?auto_35261 ?auto_35263 ) ( ON ?auto_35251 ?auto_35250 ) ( ON ?auto_35252 ?auto_35251 ) ( not ( = ?auto_35250 ?auto_35251 ) ) ( not ( = ?auto_35250 ?auto_35252 ) ) ( not ( = ?auto_35250 ?auto_35253 ) ) ( not ( = ?auto_35250 ?auto_35254 ) ) ( not ( = ?auto_35250 ?auto_35255 ) ) ( not ( = ?auto_35250 ?auto_35257 ) ) ( not ( = ?auto_35251 ?auto_35252 ) ) ( not ( = ?auto_35251 ?auto_35253 ) ) ( not ( = ?auto_35251 ?auto_35254 ) ) ( not ( = ?auto_35251 ?auto_35255 ) ) ( not ( = ?auto_35251 ?auto_35257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35252 ?auto_35253 ?auto_35254 )
      ( MAKE-4CRATE-VERIFY ?auto_35250 ?auto_35251 ?auto_35252 ?auto_35253 ?auto_35254 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35264 - SURFACE
      ?auto_35265 - SURFACE
      ?auto_35266 - SURFACE
      ?auto_35267 - SURFACE
      ?auto_35268 - SURFACE
      ?auto_35269 - SURFACE
    )
    :vars
    (
      ?auto_35277 - HOIST
      ?auto_35278 - PLACE
      ?auto_35273 - PLACE
      ?auto_35274 - HOIST
      ?auto_35270 - SURFACE
      ?auto_35271 - PLACE
      ?auto_35275 - HOIST
      ?auto_35272 - SURFACE
      ?auto_35276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35277 ?auto_35278 ) ( IS-CRATE ?auto_35269 ) ( not ( = ?auto_35268 ?auto_35269 ) ) ( not ( = ?auto_35267 ?auto_35268 ) ) ( not ( = ?auto_35267 ?auto_35269 ) ) ( not ( = ?auto_35273 ?auto_35278 ) ) ( HOIST-AT ?auto_35274 ?auto_35273 ) ( not ( = ?auto_35277 ?auto_35274 ) ) ( AVAILABLE ?auto_35274 ) ( SURFACE-AT ?auto_35269 ?auto_35273 ) ( ON ?auto_35269 ?auto_35270 ) ( CLEAR ?auto_35269 ) ( not ( = ?auto_35268 ?auto_35270 ) ) ( not ( = ?auto_35269 ?auto_35270 ) ) ( not ( = ?auto_35267 ?auto_35270 ) ) ( SURFACE-AT ?auto_35267 ?auto_35278 ) ( CLEAR ?auto_35267 ) ( IS-CRATE ?auto_35268 ) ( AVAILABLE ?auto_35277 ) ( not ( = ?auto_35271 ?auto_35278 ) ) ( not ( = ?auto_35273 ?auto_35271 ) ) ( HOIST-AT ?auto_35275 ?auto_35271 ) ( not ( = ?auto_35277 ?auto_35275 ) ) ( not ( = ?auto_35274 ?auto_35275 ) ) ( AVAILABLE ?auto_35275 ) ( SURFACE-AT ?auto_35268 ?auto_35271 ) ( ON ?auto_35268 ?auto_35272 ) ( CLEAR ?auto_35268 ) ( not ( = ?auto_35268 ?auto_35272 ) ) ( not ( = ?auto_35269 ?auto_35272 ) ) ( not ( = ?auto_35267 ?auto_35272 ) ) ( not ( = ?auto_35270 ?auto_35272 ) ) ( TRUCK-AT ?auto_35276 ?auto_35278 ) ( ON ?auto_35265 ?auto_35264 ) ( ON ?auto_35266 ?auto_35265 ) ( ON ?auto_35267 ?auto_35266 ) ( not ( = ?auto_35264 ?auto_35265 ) ) ( not ( = ?auto_35264 ?auto_35266 ) ) ( not ( = ?auto_35264 ?auto_35267 ) ) ( not ( = ?auto_35264 ?auto_35268 ) ) ( not ( = ?auto_35264 ?auto_35269 ) ) ( not ( = ?auto_35264 ?auto_35270 ) ) ( not ( = ?auto_35264 ?auto_35272 ) ) ( not ( = ?auto_35265 ?auto_35266 ) ) ( not ( = ?auto_35265 ?auto_35267 ) ) ( not ( = ?auto_35265 ?auto_35268 ) ) ( not ( = ?auto_35265 ?auto_35269 ) ) ( not ( = ?auto_35265 ?auto_35270 ) ) ( not ( = ?auto_35265 ?auto_35272 ) ) ( not ( = ?auto_35266 ?auto_35267 ) ) ( not ( = ?auto_35266 ?auto_35268 ) ) ( not ( = ?auto_35266 ?auto_35269 ) ) ( not ( = ?auto_35266 ?auto_35270 ) ) ( not ( = ?auto_35266 ?auto_35272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35267 ?auto_35268 ?auto_35269 )
      ( MAKE-5CRATE-VERIFY ?auto_35264 ?auto_35265 ?auto_35266 ?auto_35267 ?auto_35268 ?auto_35269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35279 - SURFACE
      ?auto_35280 - SURFACE
    )
    :vars
    (
      ?auto_35289 - HOIST
      ?auto_35290 - PLACE
      ?auto_35286 - SURFACE
      ?auto_35284 - PLACE
      ?auto_35285 - HOIST
      ?auto_35281 - SURFACE
      ?auto_35282 - PLACE
      ?auto_35287 - HOIST
      ?auto_35283 - SURFACE
      ?auto_35288 - TRUCK
      ?auto_35291 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35289 ?auto_35290 ) ( IS-CRATE ?auto_35280 ) ( not ( = ?auto_35279 ?auto_35280 ) ) ( not ( = ?auto_35286 ?auto_35279 ) ) ( not ( = ?auto_35286 ?auto_35280 ) ) ( not ( = ?auto_35284 ?auto_35290 ) ) ( HOIST-AT ?auto_35285 ?auto_35284 ) ( not ( = ?auto_35289 ?auto_35285 ) ) ( AVAILABLE ?auto_35285 ) ( SURFACE-AT ?auto_35280 ?auto_35284 ) ( ON ?auto_35280 ?auto_35281 ) ( CLEAR ?auto_35280 ) ( not ( = ?auto_35279 ?auto_35281 ) ) ( not ( = ?auto_35280 ?auto_35281 ) ) ( not ( = ?auto_35286 ?auto_35281 ) ) ( IS-CRATE ?auto_35279 ) ( not ( = ?auto_35282 ?auto_35290 ) ) ( not ( = ?auto_35284 ?auto_35282 ) ) ( HOIST-AT ?auto_35287 ?auto_35282 ) ( not ( = ?auto_35289 ?auto_35287 ) ) ( not ( = ?auto_35285 ?auto_35287 ) ) ( AVAILABLE ?auto_35287 ) ( SURFACE-AT ?auto_35279 ?auto_35282 ) ( ON ?auto_35279 ?auto_35283 ) ( CLEAR ?auto_35279 ) ( not ( = ?auto_35279 ?auto_35283 ) ) ( not ( = ?auto_35280 ?auto_35283 ) ) ( not ( = ?auto_35286 ?auto_35283 ) ) ( not ( = ?auto_35281 ?auto_35283 ) ) ( TRUCK-AT ?auto_35288 ?auto_35290 ) ( SURFACE-AT ?auto_35291 ?auto_35290 ) ( CLEAR ?auto_35291 ) ( LIFTING ?auto_35289 ?auto_35286 ) ( IS-CRATE ?auto_35286 ) ( not ( = ?auto_35291 ?auto_35286 ) ) ( not ( = ?auto_35279 ?auto_35291 ) ) ( not ( = ?auto_35280 ?auto_35291 ) ) ( not ( = ?auto_35281 ?auto_35291 ) ) ( not ( = ?auto_35283 ?auto_35291 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35291 ?auto_35286 )
      ( MAKE-2CRATE ?auto_35286 ?auto_35279 ?auto_35280 )
      ( MAKE-1CRATE-VERIFY ?auto_35279 ?auto_35280 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35292 - SURFACE
      ?auto_35293 - SURFACE
      ?auto_35294 - SURFACE
    )
    :vars
    (
      ?auto_35302 - HOIST
      ?auto_35298 - PLACE
      ?auto_35296 - PLACE
      ?auto_35297 - HOIST
      ?auto_35299 - SURFACE
      ?auto_35303 - PLACE
      ?auto_35300 - HOIST
      ?auto_35301 - SURFACE
      ?auto_35304 - TRUCK
      ?auto_35295 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35302 ?auto_35298 ) ( IS-CRATE ?auto_35294 ) ( not ( = ?auto_35293 ?auto_35294 ) ) ( not ( = ?auto_35292 ?auto_35293 ) ) ( not ( = ?auto_35292 ?auto_35294 ) ) ( not ( = ?auto_35296 ?auto_35298 ) ) ( HOIST-AT ?auto_35297 ?auto_35296 ) ( not ( = ?auto_35302 ?auto_35297 ) ) ( AVAILABLE ?auto_35297 ) ( SURFACE-AT ?auto_35294 ?auto_35296 ) ( ON ?auto_35294 ?auto_35299 ) ( CLEAR ?auto_35294 ) ( not ( = ?auto_35293 ?auto_35299 ) ) ( not ( = ?auto_35294 ?auto_35299 ) ) ( not ( = ?auto_35292 ?auto_35299 ) ) ( IS-CRATE ?auto_35293 ) ( not ( = ?auto_35303 ?auto_35298 ) ) ( not ( = ?auto_35296 ?auto_35303 ) ) ( HOIST-AT ?auto_35300 ?auto_35303 ) ( not ( = ?auto_35302 ?auto_35300 ) ) ( not ( = ?auto_35297 ?auto_35300 ) ) ( AVAILABLE ?auto_35300 ) ( SURFACE-AT ?auto_35293 ?auto_35303 ) ( ON ?auto_35293 ?auto_35301 ) ( CLEAR ?auto_35293 ) ( not ( = ?auto_35293 ?auto_35301 ) ) ( not ( = ?auto_35294 ?auto_35301 ) ) ( not ( = ?auto_35292 ?auto_35301 ) ) ( not ( = ?auto_35299 ?auto_35301 ) ) ( TRUCK-AT ?auto_35304 ?auto_35298 ) ( SURFACE-AT ?auto_35295 ?auto_35298 ) ( CLEAR ?auto_35295 ) ( LIFTING ?auto_35302 ?auto_35292 ) ( IS-CRATE ?auto_35292 ) ( not ( = ?auto_35295 ?auto_35292 ) ) ( not ( = ?auto_35293 ?auto_35295 ) ) ( not ( = ?auto_35294 ?auto_35295 ) ) ( not ( = ?auto_35299 ?auto_35295 ) ) ( not ( = ?auto_35301 ?auto_35295 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35293 ?auto_35294 )
      ( MAKE-2CRATE-VERIFY ?auto_35292 ?auto_35293 ?auto_35294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35305 - SURFACE
      ?auto_35306 - SURFACE
      ?auto_35307 - SURFACE
      ?auto_35308 - SURFACE
    )
    :vars
    (
      ?auto_35314 - HOIST
      ?auto_35317 - PLACE
      ?auto_35312 - PLACE
      ?auto_35313 - HOIST
      ?auto_35311 - SURFACE
      ?auto_35315 - PLACE
      ?auto_35316 - HOIST
      ?auto_35310 - SURFACE
      ?auto_35309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35314 ?auto_35317 ) ( IS-CRATE ?auto_35308 ) ( not ( = ?auto_35307 ?auto_35308 ) ) ( not ( = ?auto_35306 ?auto_35307 ) ) ( not ( = ?auto_35306 ?auto_35308 ) ) ( not ( = ?auto_35312 ?auto_35317 ) ) ( HOIST-AT ?auto_35313 ?auto_35312 ) ( not ( = ?auto_35314 ?auto_35313 ) ) ( AVAILABLE ?auto_35313 ) ( SURFACE-AT ?auto_35308 ?auto_35312 ) ( ON ?auto_35308 ?auto_35311 ) ( CLEAR ?auto_35308 ) ( not ( = ?auto_35307 ?auto_35311 ) ) ( not ( = ?auto_35308 ?auto_35311 ) ) ( not ( = ?auto_35306 ?auto_35311 ) ) ( IS-CRATE ?auto_35307 ) ( not ( = ?auto_35315 ?auto_35317 ) ) ( not ( = ?auto_35312 ?auto_35315 ) ) ( HOIST-AT ?auto_35316 ?auto_35315 ) ( not ( = ?auto_35314 ?auto_35316 ) ) ( not ( = ?auto_35313 ?auto_35316 ) ) ( AVAILABLE ?auto_35316 ) ( SURFACE-AT ?auto_35307 ?auto_35315 ) ( ON ?auto_35307 ?auto_35310 ) ( CLEAR ?auto_35307 ) ( not ( = ?auto_35307 ?auto_35310 ) ) ( not ( = ?auto_35308 ?auto_35310 ) ) ( not ( = ?auto_35306 ?auto_35310 ) ) ( not ( = ?auto_35311 ?auto_35310 ) ) ( TRUCK-AT ?auto_35309 ?auto_35317 ) ( SURFACE-AT ?auto_35305 ?auto_35317 ) ( CLEAR ?auto_35305 ) ( LIFTING ?auto_35314 ?auto_35306 ) ( IS-CRATE ?auto_35306 ) ( not ( = ?auto_35305 ?auto_35306 ) ) ( not ( = ?auto_35307 ?auto_35305 ) ) ( not ( = ?auto_35308 ?auto_35305 ) ) ( not ( = ?auto_35311 ?auto_35305 ) ) ( not ( = ?auto_35310 ?auto_35305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35306 ?auto_35307 ?auto_35308 )
      ( MAKE-3CRATE-VERIFY ?auto_35305 ?auto_35306 ?auto_35307 ?auto_35308 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35318 - SURFACE
      ?auto_35319 - SURFACE
      ?auto_35320 - SURFACE
      ?auto_35321 - SURFACE
      ?auto_35322 - SURFACE
    )
    :vars
    (
      ?auto_35328 - HOIST
      ?auto_35331 - PLACE
      ?auto_35326 - PLACE
      ?auto_35327 - HOIST
      ?auto_35325 - SURFACE
      ?auto_35329 - PLACE
      ?auto_35330 - HOIST
      ?auto_35324 - SURFACE
      ?auto_35323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35328 ?auto_35331 ) ( IS-CRATE ?auto_35322 ) ( not ( = ?auto_35321 ?auto_35322 ) ) ( not ( = ?auto_35320 ?auto_35321 ) ) ( not ( = ?auto_35320 ?auto_35322 ) ) ( not ( = ?auto_35326 ?auto_35331 ) ) ( HOIST-AT ?auto_35327 ?auto_35326 ) ( not ( = ?auto_35328 ?auto_35327 ) ) ( AVAILABLE ?auto_35327 ) ( SURFACE-AT ?auto_35322 ?auto_35326 ) ( ON ?auto_35322 ?auto_35325 ) ( CLEAR ?auto_35322 ) ( not ( = ?auto_35321 ?auto_35325 ) ) ( not ( = ?auto_35322 ?auto_35325 ) ) ( not ( = ?auto_35320 ?auto_35325 ) ) ( IS-CRATE ?auto_35321 ) ( not ( = ?auto_35329 ?auto_35331 ) ) ( not ( = ?auto_35326 ?auto_35329 ) ) ( HOIST-AT ?auto_35330 ?auto_35329 ) ( not ( = ?auto_35328 ?auto_35330 ) ) ( not ( = ?auto_35327 ?auto_35330 ) ) ( AVAILABLE ?auto_35330 ) ( SURFACE-AT ?auto_35321 ?auto_35329 ) ( ON ?auto_35321 ?auto_35324 ) ( CLEAR ?auto_35321 ) ( not ( = ?auto_35321 ?auto_35324 ) ) ( not ( = ?auto_35322 ?auto_35324 ) ) ( not ( = ?auto_35320 ?auto_35324 ) ) ( not ( = ?auto_35325 ?auto_35324 ) ) ( TRUCK-AT ?auto_35323 ?auto_35331 ) ( SURFACE-AT ?auto_35319 ?auto_35331 ) ( CLEAR ?auto_35319 ) ( LIFTING ?auto_35328 ?auto_35320 ) ( IS-CRATE ?auto_35320 ) ( not ( = ?auto_35319 ?auto_35320 ) ) ( not ( = ?auto_35321 ?auto_35319 ) ) ( not ( = ?auto_35322 ?auto_35319 ) ) ( not ( = ?auto_35325 ?auto_35319 ) ) ( not ( = ?auto_35324 ?auto_35319 ) ) ( ON ?auto_35319 ?auto_35318 ) ( not ( = ?auto_35318 ?auto_35319 ) ) ( not ( = ?auto_35318 ?auto_35320 ) ) ( not ( = ?auto_35318 ?auto_35321 ) ) ( not ( = ?auto_35318 ?auto_35322 ) ) ( not ( = ?auto_35318 ?auto_35325 ) ) ( not ( = ?auto_35318 ?auto_35324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35320 ?auto_35321 ?auto_35322 )
      ( MAKE-4CRATE-VERIFY ?auto_35318 ?auto_35319 ?auto_35320 ?auto_35321 ?auto_35322 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35332 - SURFACE
      ?auto_35333 - SURFACE
      ?auto_35334 - SURFACE
      ?auto_35335 - SURFACE
      ?auto_35336 - SURFACE
      ?auto_35337 - SURFACE
    )
    :vars
    (
      ?auto_35343 - HOIST
      ?auto_35346 - PLACE
      ?auto_35341 - PLACE
      ?auto_35342 - HOIST
      ?auto_35340 - SURFACE
      ?auto_35344 - PLACE
      ?auto_35345 - HOIST
      ?auto_35339 - SURFACE
      ?auto_35338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35343 ?auto_35346 ) ( IS-CRATE ?auto_35337 ) ( not ( = ?auto_35336 ?auto_35337 ) ) ( not ( = ?auto_35335 ?auto_35336 ) ) ( not ( = ?auto_35335 ?auto_35337 ) ) ( not ( = ?auto_35341 ?auto_35346 ) ) ( HOIST-AT ?auto_35342 ?auto_35341 ) ( not ( = ?auto_35343 ?auto_35342 ) ) ( AVAILABLE ?auto_35342 ) ( SURFACE-AT ?auto_35337 ?auto_35341 ) ( ON ?auto_35337 ?auto_35340 ) ( CLEAR ?auto_35337 ) ( not ( = ?auto_35336 ?auto_35340 ) ) ( not ( = ?auto_35337 ?auto_35340 ) ) ( not ( = ?auto_35335 ?auto_35340 ) ) ( IS-CRATE ?auto_35336 ) ( not ( = ?auto_35344 ?auto_35346 ) ) ( not ( = ?auto_35341 ?auto_35344 ) ) ( HOIST-AT ?auto_35345 ?auto_35344 ) ( not ( = ?auto_35343 ?auto_35345 ) ) ( not ( = ?auto_35342 ?auto_35345 ) ) ( AVAILABLE ?auto_35345 ) ( SURFACE-AT ?auto_35336 ?auto_35344 ) ( ON ?auto_35336 ?auto_35339 ) ( CLEAR ?auto_35336 ) ( not ( = ?auto_35336 ?auto_35339 ) ) ( not ( = ?auto_35337 ?auto_35339 ) ) ( not ( = ?auto_35335 ?auto_35339 ) ) ( not ( = ?auto_35340 ?auto_35339 ) ) ( TRUCK-AT ?auto_35338 ?auto_35346 ) ( SURFACE-AT ?auto_35334 ?auto_35346 ) ( CLEAR ?auto_35334 ) ( LIFTING ?auto_35343 ?auto_35335 ) ( IS-CRATE ?auto_35335 ) ( not ( = ?auto_35334 ?auto_35335 ) ) ( not ( = ?auto_35336 ?auto_35334 ) ) ( not ( = ?auto_35337 ?auto_35334 ) ) ( not ( = ?auto_35340 ?auto_35334 ) ) ( not ( = ?auto_35339 ?auto_35334 ) ) ( ON ?auto_35333 ?auto_35332 ) ( ON ?auto_35334 ?auto_35333 ) ( not ( = ?auto_35332 ?auto_35333 ) ) ( not ( = ?auto_35332 ?auto_35334 ) ) ( not ( = ?auto_35332 ?auto_35335 ) ) ( not ( = ?auto_35332 ?auto_35336 ) ) ( not ( = ?auto_35332 ?auto_35337 ) ) ( not ( = ?auto_35332 ?auto_35340 ) ) ( not ( = ?auto_35332 ?auto_35339 ) ) ( not ( = ?auto_35333 ?auto_35334 ) ) ( not ( = ?auto_35333 ?auto_35335 ) ) ( not ( = ?auto_35333 ?auto_35336 ) ) ( not ( = ?auto_35333 ?auto_35337 ) ) ( not ( = ?auto_35333 ?auto_35340 ) ) ( not ( = ?auto_35333 ?auto_35339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35335 ?auto_35336 ?auto_35337 )
      ( MAKE-5CRATE-VERIFY ?auto_35332 ?auto_35333 ?auto_35334 ?auto_35335 ?auto_35336 ?auto_35337 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35347 - SURFACE
      ?auto_35348 - SURFACE
    )
    :vars
    (
      ?auto_35356 - HOIST
      ?auto_35359 - PLACE
      ?auto_35350 - SURFACE
      ?auto_35354 - PLACE
      ?auto_35355 - HOIST
      ?auto_35352 - SURFACE
      ?auto_35357 - PLACE
      ?auto_35358 - HOIST
      ?auto_35351 - SURFACE
      ?auto_35349 - TRUCK
      ?auto_35353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35356 ?auto_35359 ) ( IS-CRATE ?auto_35348 ) ( not ( = ?auto_35347 ?auto_35348 ) ) ( not ( = ?auto_35350 ?auto_35347 ) ) ( not ( = ?auto_35350 ?auto_35348 ) ) ( not ( = ?auto_35354 ?auto_35359 ) ) ( HOIST-AT ?auto_35355 ?auto_35354 ) ( not ( = ?auto_35356 ?auto_35355 ) ) ( AVAILABLE ?auto_35355 ) ( SURFACE-AT ?auto_35348 ?auto_35354 ) ( ON ?auto_35348 ?auto_35352 ) ( CLEAR ?auto_35348 ) ( not ( = ?auto_35347 ?auto_35352 ) ) ( not ( = ?auto_35348 ?auto_35352 ) ) ( not ( = ?auto_35350 ?auto_35352 ) ) ( IS-CRATE ?auto_35347 ) ( not ( = ?auto_35357 ?auto_35359 ) ) ( not ( = ?auto_35354 ?auto_35357 ) ) ( HOIST-AT ?auto_35358 ?auto_35357 ) ( not ( = ?auto_35356 ?auto_35358 ) ) ( not ( = ?auto_35355 ?auto_35358 ) ) ( AVAILABLE ?auto_35358 ) ( SURFACE-AT ?auto_35347 ?auto_35357 ) ( ON ?auto_35347 ?auto_35351 ) ( CLEAR ?auto_35347 ) ( not ( = ?auto_35347 ?auto_35351 ) ) ( not ( = ?auto_35348 ?auto_35351 ) ) ( not ( = ?auto_35350 ?auto_35351 ) ) ( not ( = ?auto_35352 ?auto_35351 ) ) ( TRUCK-AT ?auto_35349 ?auto_35359 ) ( SURFACE-AT ?auto_35353 ?auto_35359 ) ( CLEAR ?auto_35353 ) ( IS-CRATE ?auto_35350 ) ( not ( = ?auto_35353 ?auto_35350 ) ) ( not ( = ?auto_35347 ?auto_35353 ) ) ( not ( = ?auto_35348 ?auto_35353 ) ) ( not ( = ?auto_35352 ?auto_35353 ) ) ( not ( = ?auto_35351 ?auto_35353 ) ) ( AVAILABLE ?auto_35356 ) ( IN ?auto_35350 ?auto_35349 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35356 ?auto_35350 ?auto_35349 ?auto_35359 )
      ( MAKE-2CRATE ?auto_35350 ?auto_35347 ?auto_35348 )
      ( MAKE-1CRATE-VERIFY ?auto_35347 ?auto_35348 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35360 - SURFACE
      ?auto_35361 - SURFACE
      ?auto_35362 - SURFACE
    )
    :vars
    (
      ?auto_35364 - HOIST
      ?auto_35372 - PLACE
      ?auto_35368 - PLACE
      ?auto_35367 - HOIST
      ?auto_35365 - SURFACE
      ?auto_35366 - PLACE
      ?auto_35363 - HOIST
      ?auto_35371 - SURFACE
      ?auto_35370 - TRUCK
      ?auto_35369 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35364 ?auto_35372 ) ( IS-CRATE ?auto_35362 ) ( not ( = ?auto_35361 ?auto_35362 ) ) ( not ( = ?auto_35360 ?auto_35361 ) ) ( not ( = ?auto_35360 ?auto_35362 ) ) ( not ( = ?auto_35368 ?auto_35372 ) ) ( HOIST-AT ?auto_35367 ?auto_35368 ) ( not ( = ?auto_35364 ?auto_35367 ) ) ( AVAILABLE ?auto_35367 ) ( SURFACE-AT ?auto_35362 ?auto_35368 ) ( ON ?auto_35362 ?auto_35365 ) ( CLEAR ?auto_35362 ) ( not ( = ?auto_35361 ?auto_35365 ) ) ( not ( = ?auto_35362 ?auto_35365 ) ) ( not ( = ?auto_35360 ?auto_35365 ) ) ( IS-CRATE ?auto_35361 ) ( not ( = ?auto_35366 ?auto_35372 ) ) ( not ( = ?auto_35368 ?auto_35366 ) ) ( HOIST-AT ?auto_35363 ?auto_35366 ) ( not ( = ?auto_35364 ?auto_35363 ) ) ( not ( = ?auto_35367 ?auto_35363 ) ) ( AVAILABLE ?auto_35363 ) ( SURFACE-AT ?auto_35361 ?auto_35366 ) ( ON ?auto_35361 ?auto_35371 ) ( CLEAR ?auto_35361 ) ( not ( = ?auto_35361 ?auto_35371 ) ) ( not ( = ?auto_35362 ?auto_35371 ) ) ( not ( = ?auto_35360 ?auto_35371 ) ) ( not ( = ?auto_35365 ?auto_35371 ) ) ( TRUCK-AT ?auto_35370 ?auto_35372 ) ( SURFACE-AT ?auto_35369 ?auto_35372 ) ( CLEAR ?auto_35369 ) ( IS-CRATE ?auto_35360 ) ( not ( = ?auto_35369 ?auto_35360 ) ) ( not ( = ?auto_35361 ?auto_35369 ) ) ( not ( = ?auto_35362 ?auto_35369 ) ) ( not ( = ?auto_35365 ?auto_35369 ) ) ( not ( = ?auto_35371 ?auto_35369 ) ) ( AVAILABLE ?auto_35364 ) ( IN ?auto_35360 ?auto_35370 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35361 ?auto_35362 )
      ( MAKE-2CRATE-VERIFY ?auto_35360 ?auto_35361 ?auto_35362 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35373 - SURFACE
      ?auto_35374 - SURFACE
      ?auto_35375 - SURFACE
      ?auto_35376 - SURFACE
    )
    :vars
    (
      ?auto_35385 - HOIST
      ?auto_35377 - PLACE
      ?auto_35379 - PLACE
      ?auto_35382 - HOIST
      ?auto_35378 - SURFACE
      ?auto_35384 - PLACE
      ?auto_35381 - HOIST
      ?auto_35383 - SURFACE
      ?auto_35380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35385 ?auto_35377 ) ( IS-CRATE ?auto_35376 ) ( not ( = ?auto_35375 ?auto_35376 ) ) ( not ( = ?auto_35374 ?auto_35375 ) ) ( not ( = ?auto_35374 ?auto_35376 ) ) ( not ( = ?auto_35379 ?auto_35377 ) ) ( HOIST-AT ?auto_35382 ?auto_35379 ) ( not ( = ?auto_35385 ?auto_35382 ) ) ( AVAILABLE ?auto_35382 ) ( SURFACE-AT ?auto_35376 ?auto_35379 ) ( ON ?auto_35376 ?auto_35378 ) ( CLEAR ?auto_35376 ) ( not ( = ?auto_35375 ?auto_35378 ) ) ( not ( = ?auto_35376 ?auto_35378 ) ) ( not ( = ?auto_35374 ?auto_35378 ) ) ( IS-CRATE ?auto_35375 ) ( not ( = ?auto_35384 ?auto_35377 ) ) ( not ( = ?auto_35379 ?auto_35384 ) ) ( HOIST-AT ?auto_35381 ?auto_35384 ) ( not ( = ?auto_35385 ?auto_35381 ) ) ( not ( = ?auto_35382 ?auto_35381 ) ) ( AVAILABLE ?auto_35381 ) ( SURFACE-AT ?auto_35375 ?auto_35384 ) ( ON ?auto_35375 ?auto_35383 ) ( CLEAR ?auto_35375 ) ( not ( = ?auto_35375 ?auto_35383 ) ) ( not ( = ?auto_35376 ?auto_35383 ) ) ( not ( = ?auto_35374 ?auto_35383 ) ) ( not ( = ?auto_35378 ?auto_35383 ) ) ( TRUCK-AT ?auto_35380 ?auto_35377 ) ( SURFACE-AT ?auto_35373 ?auto_35377 ) ( CLEAR ?auto_35373 ) ( IS-CRATE ?auto_35374 ) ( not ( = ?auto_35373 ?auto_35374 ) ) ( not ( = ?auto_35375 ?auto_35373 ) ) ( not ( = ?auto_35376 ?auto_35373 ) ) ( not ( = ?auto_35378 ?auto_35373 ) ) ( not ( = ?auto_35383 ?auto_35373 ) ) ( AVAILABLE ?auto_35385 ) ( IN ?auto_35374 ?auto_35380 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35374 ?auto_35375 ?auto_35376 )
      ( MAKE-3CRATE-VERIFY ?auto_35373 ?auto_35374 ?auto_35375 ?auto_35376 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35386 - SURFACE
      ?auto_35387 - SURFACE
      ?auto_35388 - SURFACE
      ?auto_35389 - SURFACE
      ?auto_35390 - SURFACE
    )
    :vars
    (
      ?auto_35399 - HOIST
      ?auto_35391 - PLACE
      ?auto_35393 - PLACE
      ?auto_35396 - HOIST
      ?auto_35392 - SURFACE
      ?auto_35398 - PLACE
      ?auto_35395 - HOIST
      ?auto_35397 - SURFACE
      ?auto_35394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35399 ?auto_35391 ) ( IS-CRATE ?auto_35390 ) ( not ( = ?auto_35389 ?auto_35390 ) ) ( not ( = ?auto_35388 ?auto_35389 ) ) ( not ( = ?auto_35388 ?auto_35390 ) ) ( not ( = ?auto_35393 ?auto_35391 ) ) ( HOIST-AT ?auto_35396 ?auto_35393 ) ( not ( = ?auto_35399 ?auto_35396 ) ) ( AVAILABLE ?auto_35396 ) ( SURFACE-AT ?auto_35390 ?auto_35393 ) ( ON ?auto_35390 ?auto_35392 ) ( CLEAR ?auto_35390 ) ( not ( = ?auto_35389 ?auto_35392 ) ) ( not ( = ?auto_35390 ?auto_35392 ) ) ( not ( = ?auto_35388 ?auto_35392 ) ) ( IS-CRATE ?auto_35389 ) ( not ( = ?auto_35398 ?auto_35391 ) ) ( not ( = ?auto_35393 ?auto_35398 ) ) ( HOIST-AT ?auto_35395 ?auto_35398 ) ( not ( = ?auto_35399 ?auto_35395 ) ) ( not ( = ?auto_35396 ?auto_35395 ) ) ( AVAILABLE ?auto_35395 ) ( SURFACE-AT ?auto_35389 ?auto_35398 ) ( ON ?auto_35389 ?auto_35397 ) ( CLEAR ?auto_35389 ) ( not ( = ?auto_35389 ?auto_35397 ) ) ( not ( = ?auto_35390 ?auto_35397 ) ) ( not ( = ?auto_35388 ?auto_35397 ) ) ( not ( = ?auto_35392 ?auto_35397 ) ) ( TRUCK-AT ?auto_35394 ?auto_35391 ) ( SURFACE-AT ?auto_35387 ?auto_35391 ) ( CLEAR ?auto_35387 ) ( IS-CRATE ?auto_35388 ) ( not ( = ?auto_35387 ?auto_35388 ) ) ( not ( = ?auto_35389 ?auto_35387 ) ) ( not ( = ?auto_35390 ?auto_35387 ) ) ( not ( = ?auto_35392 ?auto_35387 ) ) ( not ( = ?auto_35397 ?auto_35387 ) ) ( AVAILABLE ?auto_35399 ) ( IN ?auto_35388 ?auto_35394 ) ( ON ?auto_35387 ?auto_35386 ) ( not ( = ?auto_35386 ?auto_35387 ) ) ( not ( = ?auto_35386 ?auto_35388 ) ) ( not ( = ?auto_35386 ?auto_35389 ) ) ( not ( = ?auto_35386 ?auto_35390 ) ) ( not ( = ?auto_35386 ?auto_35392 ) ) ( not ( = ?auto_35386 ?auto_35397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35388 ?auto_35389 ?auto_35390 )
      ( MAKE-4CRATE-VERIFY ?auto_35386 ?auto_35387 ?auto_35388 ?auto_35389 ?auto_35390 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35400 - SURFACE
      ?auto_35401 - SURFACE
      ?auto_35402 - SURFACE
      ?auto_35403 - SURFACE
      ?auto_35404 - SURFACE
      ?auto_35405 - SURFACE
    )
    :vars
    (
      ?auto_35414 - HOIST
      ?auto_35406 - PLACE
      ?auto_35408 - PLACE
      ?auto_35411 - HOIST
      ?auto_35407 - SURFACE
      ?auto_35413 - PLACE
      ?auto_35410 - HOIST
      ?auto_35412 - SURFACE
      ?auto_35409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35414 ?auto_35406 ) ( IS-CRATE ?auto_35405 ) ( not ( = ?auto_35404 ?auto_35405 ) ) ( not ( = ?auto_35403 ?auto_35404 ) ) ( not ( = ?auto_35403 ?auto_35405 ) ) ( not ( = ?auto_35408 ?auto_35406 ) ) ( HOIST-AT ?auto_35411 ?auto_35408 ) ( not ( = ?auto_35414 ?auto_35411 ) ) ( AVAILABLE ?auto_35411 ) ( SURFACE-AT ?auto_35405 ?auto_35408 ) ( ON ?auto_35405 ?auto_35407 ) ( CLEAR ?auto_35405 ) ( not ( = ?auto_35404 ?auto_35407 ) ) ( not ( = ?auto_35405 ?auto_35407 ) ) ( not ( = ?auto_35403 ?auto_35407 ) ) ( IS-CRATE ?auto_35404 ) ( not ( = ?auto_35413 ?auto_35406 ) ) ( not ( = ?auto_35408 ?auto_35413 ) ) ( HOIST-AT ?auto_35410 ?auto_35413 ) ( not ( = ?auto_35414 ?auto_35410 ) ) ( not ( = ?auto_35411 ?auto_35410 ) ) ( AVAILABLE ?auto_35410 ) ( SURFACE-AT ?auto_35404 ?auto_35413 ) ( ON ?auto_35404 ?auto_35412 ) ( CLEAR ?auto_35404 ) ( not ( = ?auto_35404 ?auto_35412 ) ) ( not ( = ?auto_35405 ?auto_35412 ) ) ( not ( = ?auto_35403 ?auto_35412 ) ) ( not ( = ?auto_35407 ?auto_35412 ) ) ( TRUCK-AT ?auto_35409 ?auto_35406 ) ( SURFACE-AT ?auto_35402 ?auto_35406 ) ( CLEAR ?auto_35402 ) ( IS-CRATE ?auto_35403 ) ( not ( = ?auto_35402 ?auto_35403 ) ) ( not ( = ?auto_35404 ?auto_35402 ) ) ( not ( = ?auto_35405 ?auto_35402 ) ) ( not ( = ?auto_35407 ?auto_35402 ) ) ( not ( = ?auto_35412 ?auto_35402 ) ) ( AVAILABLE ?auto_35414 ) ( IN ?auto_35403 ?auto_35409 ) ( ON ?auto_35401 ?auto_35400 ) ( ON ?auto_35402 ?auto_35401 ) ( not ( = ?auto_35400 ?auto_35401 ) ) ( not ( = ?auto_35400 ?auto_35402 ) ) ( not ( = ?auto_35400 ?auto_35403 ) ) ( not ( = ?auto_35400 ?auto_35404 ) ) ( not ( = ?auto_35400 ?auto_35405 ) ) ( not ( = ?auto_35400 ?auto_35407 ) ) ( not ( = ?auto_35400 ?auto_35412 ) ) ( not ( = ?auto_35401 ?auto_35402 ) ) ( not ( = ?auto_35401 ?auto_35403 ) ) ( not ( = ?auto_35401 ?auto_35404 ) ) ( not ( = ?auto_35401 ?auto_35405 ) ) ( not ( = ?auto_35401 ?auto_35407 ) ) ( not ( = ?auto_35401 ?auto_35412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35403 ?auto_35404 ?auto_35405 )
      ( MAKE-5CRATE-VERIFY ?auto_35400 ?auto_35401 ?auto_35402 ?auto_35403 ?auto_35404 ?auto_35405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35415 - SURFACE
      ?auto_35416 - SURFACE
    )
    :vars
    (
      ?auto_35426 - HOIST
      ?auto_35417 - PLACE
      ?auto_35427 - SURFACE
      ?auto_35419 - PLACE
      ?auto_35422 - HOIST
      ?auto_35418 - SURFACE
      ?auto_35424 - PLACE
      ?auto_35421 - HOIST
      ?auto_35423 - SURFACE
      ?auto_35425 - SURFACE
      ?auto_35420 - TRUCK
      ?auto_35428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35426 ?auto_35417 ) ( IS-CRATE ?auto_35416 ) ( not ( = ?auto_35415 ?auto_35416 ) ) ( not ( = ?auto_35427 ?auto_35415 ) ) ( not ( = ?auto_35427 ?auto_35416 ) ) ( not ( = ?auto_35419 ?auto_35417 ) ) ( HOIST-AT ?auto_35422 ?auto_35419 ) ( not ( = ?auto_35426 ?auto_35422 ) ) ( AVAILABLE ?auto_35422 ) ( SURFACE-AT ?auto_35416 ?auto_35419 ) ( ON ?auto_35416 ?auto_35418 ) ( CLEAR ?auto_35416 ) ( not ( = ?auto_35415 ?auto_35418 ) ) ( not ( = ?auto_35416 ?auto_35418 ) ) ( not ( = ?auto_35427 ?auto_35418 ) ) ( IS-CRATE ?auto_35415 ) ( not ( = ?auto_35424 ?auto_35417 ) ) ( not ( = ?auto_35419 ?auto_35424 ) ) ( HOIST-AT ?auto_35421 ?auto_35424 ) ( not ( = ?auto_35426 ?auto_35421 ) ) ( not ( = ?auto_35422 ?auto_35421 ) ) ( AVAILABLE ?auto_35421 ) ( SURFACE-AT ?auto_35415 ?auto_35424 ) ( ON ?auto_35415 ?auto_35423 ) ( CLEAR ?auto_35415 ) ( not ( = ?auto_35415 ?auto_35423 ) ) ( not ( = ?auto_35416 ?auto_35423 ) ) ( not ( = ?auto_35427 ?auto_35423 ) ) ( not ( = ?auto_35418 ?auto_35423 ) ) ( SURFACE-AT ?auto_35425 ?auto_35417 ) ( CLEAR ?auto_35425 ) ( IS-CRATE ?auto_35427 ) ( not ( = ?auto_35425 ?auto_35427 ) ) ( not ( = ?auto_35415 ?auto_35425 ) ) ( not ( = ?auto_35416 ?auto_35425 ) ) ( not ( = ?auto_35418 ?auto_35425 ) ) ( not ( = ?auto_35423 ?auto_35425 ) ) ( AVAILABLE ?auto_35426 ) ( IN ?auto_35427 ?auto_35420 ) ( TRUCK-AT ?auto_35420 ?auto_35428 ) ( not ( = ?auto_35428 ?auto_35417 ) ) ( not ( = ?auto_35419 ?auto_35428 ) ) ( not ( = ?auto_35424 ?auto_35428 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35420 ?auto_35428 ?auto_35417 )
      ( MAKE-2CRATE ?auto_35427 ?auto_35415 ?auto_35416 )
      ( MAKE-1CRATE-VERIFY ?auto_35415 ?auto_35416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35429 - SURFACE
      ?auto_35430 - SURFACE
      ?auto_35431 - SURFACE
    )
    :vars
    (
      ?auto_35442 - HOIST
      ?auto_35434 - PLACE
      ?auto_35438 - PLACE
      ?auto_35432 - HOIST
      ?auto_35437 - SURFACE
      ?auto_35435 - PLACE
      ?auto_35433 - HOIST
      ?auto_35436 - SURFACE
      ?auto_35441 - SURFACE
      ?auto_35439 - TRUCK
      ?auto_35440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35442 ?auto_35434 ) ( IS-CRATE ?auto_35431 ) ( not ( = ?auto_35430 ?auto_35431 ) ) ( not ( = ?auto_35429 ?auto_35430 ) ) ( not ( = ?auto_35429 ?auto_35431 ) ) ( not ( = ?auto_35438 ?auto_35434 ) ) ( HOIST-AT ?auto_35432 ?auto_35438 ) ( not ( = ?auto_35442 ?auto_35432 ) ) ( AVAILABLE ?auto_35432 ) ( SURFACE-AT ?auto_35431 ?auto_35438 ) ( ON ?auto_35431 ?auto_35437 ) ( CLEAR ?auto_35431 ) ( not ( = ?auto_35430 ?auto_35437 ) ) ( not ( = ?auto_35431 ?auto_35437 ) ) ( not ( = ?auto_35429 ?auto_35437 ) ) ( IS-CRATE ?auto_35430 ) ( not ( = ?auto_35435 ?auto_35434 ) ) ( not ( = ?auto_35438 ?auto_35435 ) ) ( HOIST-AT ?auto_35433 ?auto_35435 ) ( not ( = ?auto_35442 ?auto_35433 ) ) ( not ( = ?auto_35432 ?auto_35433 ) ) ( AVAILABLE ?auto_35433 ) ( SURFACE-AT ?auto_35430 ?auto_35435 ) ( ON ?auto_35430 ?auto_35436 ) ( CLEAR ?auto_35430 ) ( not ( = ?auto_35430 ?auto_35436 ) ) ( not ( = ?auto_35431 ?auto_35436 ) ) ( not ( = ?auto_35429 ?auto_35436 ) ) ( not ( = ?auto_35437 ?auto_35436 ) ) ( SURFACE-AT ?auto_35441 ?auto_35434 ) ( CLEAR ?auto_35441 ) ( IS-CRATE ?auto_35429 ) ( not ( = ?auto_35441 ?auto_35429 ) ) ( not ( = ?auto_35430 ?auto_35441 ) ) ( not ( = ?auto_35431 ?auto_35441 ) ) ( not ( = ?auto_35437 ?auto_35441 ) ) ( not ( = ?auto_35436 ?auto_35441 ) ) ( AVAILABLE ?auto_35442 ) ( IN ?auto_35429 ?auto_35439 ) ( TRUCK-AT ?auto_35439 ?auto_35440 ) ( not ( = ?auto_35440 ?auto_35434 ) ) ( not ( = ?auto_35438 ?auto_35440 ) ) ( not ( = ?auto_35435 ?auto_35440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35430 ?auto_35431 )
      ( MAKE-2CRATE-VERIFY ?auto_35429 ?auto_35430 ?auto_35431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35443 - SURFACE
      ?auto_35444 - SURFACE
      ?auto_35445 - SURFACE
      ?auto_35446 - SURFACE
    )
    :vars
    (
      ?auto_35447 - HOIST
      ?auto_35448 - PLACE
      ?auto_35453 - PLACE
      ?auto_35452 - HOIST
      ?auto_35451 - SURFACE
      ?auto_35449 - PLACE
      ?auto_35456 - HOIST
      ?auto_35455 - SURFACE
      ?auto_35450 - TRUCK
      ?auto_35454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35447 ?auto_35448 ) ( IS-CRATE ?auto_35446 ) ( not ( = ?auto_35445 ?auto_35446 ) ) ( not ( = ?auto_35444 ?auto_35445 ) ) ( not ( = ?auto_35444 ?auto_35446 ) ) ( not ( = ?auto_35453 ?auto_35448 ) ) ( HOIST-AT ?auto_35452 ?auto_35453 ) ( not ( = ?auto_35447 ?auto_35452 ) ) ( AVAILABLE ?auto_35452 ) ( SURFACE-AT ?auto_35446 ?auto_35453 ) ( ON ?auto_35446 ?auto_35451 ) ( CLEAR ?auto_35446 ) ( not ( = ?auto_35445 ?auto_35451 ) ) ( not ( = ?auto_35446 ?auto_35451 ) ) ( not ( = ?auto_35444 ?auto_35451 ) ) ( IS-CRATE ?auto_35445 ) ( not ( = ?auto_35449 ?auto_35448 ) ) ( not ( = ?auto_35453 ?auto_35449 ) ) ( HOIST-AT ?auto_35456 ?auto_35449 ) ( not ( = ?auto_35447 ?auto_35456 ) ) ( not ( = ?auto_35452 ?auto_35456 ) ) ( AVAILABLE ?auto_35456 ) ( SURFACE-AT ?auto_35445 ?auto_35449 ) ( ON ?auto_35445 ?auto_35455 ) ( CLEAR ?auto_35445 ) ( not ( = ?auto_35445 ?auto_35455 ) ) ( not ( = ?auto_35446 ?auto_35455 ) ) ( not ( = ?auto_35444 ?auto_35455 ) ) ( not ( = ?auto_35451 ?auto_35455 ) ) ( SURFACE-AT ?auto_35443 ?auto_35448 ) ( CLEAR ?auto_35443 ) ( IS-CRATE ?auto_35444 ) ( not ( = ?auto_35443 ?auto_35444 ) ) ( not ( = ?auto_35445 ?auto_35443 ) ) ( not ( = ?auto_35446 ?auto_35443 ) ) ( not ( = ?auto_35451 ?auto_35443 ) ) ( not ( = ?auto_35455 ?auto_35443 ) ) ( AVAILABLE ?auto_35447 ) ( IN ?auto_35444 ?auto_35450 ) ( TRUCK-AT ?auto_35450 ?auto_35454 ) ( not ( = ?auto_35454 ?auto_35448 ) ) ( not ( = ?auto_35453 ?auto_35454 ) ) ( not ( = ?auto_35449 ?auto_35454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35444 ?auto_35445 ?auto_35446 )
      ( MAKE-3CRATE-VERIFY ?auto_35443 ?auto_35444 ?auto_35445 ?auto_35446 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35457 - SURFACE
      ?auto_35458 - SURFACE
      ?auto_35459 - SURFACE
      ?auto_35460 - SURFACE
      ?auto_35461 - SURFACE
    )
    :vars
    (
      ?auto_35462 - HOIST
      ?auto_35463 - PLACE
      ?auto_35468 - PLACE
      ?auto_35467 - HOIST
      ?auto_35466 - SURFACE
      ?auto_35464 - PLACE
      ?auto_35471 - HOIST
      ?auto_35470 - SURFACE
      ?auto_35465 - TRUCK
      ?auto_35469 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35462 ?auto_35463 ) ( IS-CRATE ?auto_35461 ) ( not ( = ?auto_35460 ?auto_35461 ) ) ( not ( = ?auto_35459 ?auto_35460 ) ) ( not ( = ?auto_35459 ?auto_35461 ) ) ( not ( = ?auto_35468 ?auto_35463 ) ) ( HOIST-AT ?auto_35467 ?auto_35468 ) ( not ( = ?auto_35462 ?auto_35467 ) ) ( AVAILABLE ?auto_35467 ) ( SURFACE-AT ?auto_35461 ?auto_35468 ) ( ON ?auto_35461 ?auto_35466 ) ( CLEAR ?auto_35461 ) ( not ( = ?auto_35460 ?auto_35466 ) ) ( not ( = ?auto_35461 ?auto_35466 ) ) ( not ( = ?auto_35459 ?auto_35466 ) ) ( IS-CRATE ?auto_35460 ) ( not ( = ?auto_35464 ?auto_35463 ) ) ( not ( = ?auto_35468 ?auto_35464 ) ) ( HOIST-AT ?auto_35471 ?auto_35464 ) ( not ( = ?auto_35462 ?auto_35471 ) ) ( not ( = ?auto_35467 ?auto_35471 ) ) ( AVAILABLE ?auto_35471 ) ( SURFACE-AT ?auto_35460 ?auto_35464 ) ( ON ?auto_35460 ?auto_35470 ) ( CLEAR ?auto_35460 ) ( not ( = ?auto_35460 ?auto_35470 ) ) ( not ( = ?auto_35461 ?auto_35470 ) ) ( not ( = ?auto_35459 ?auto_35470 ) ) ( not ( = ?auto_35466 ?auto_35470 ) ) ( SURFACE-AT ?auto_35458 ?auto_35463 ) ( CLEAR ?auto_35458 ) ( IS-CRATE ?auto_35459 ) ( not ( = ?auto_35458 ?auto_35459 ) ) ( not ( = ?auto_35460 ?auto_35458 ) ) ( not ( = ?auto_35461 ?auto_35458 ) ) ( not ( = ?auto_35466 ?auto_35458 ) ) ( not ( = ?auto_35470 ?auto_35458 ) ) ( AVAILABLE ?auto_35462 ) ( IN ?auto_35459 ?auto_35465 ) ( TRUCK-AT ?auto_35465 ?auto_35469 ) ( not ( = ?auto_35469 ?auto_35463 ) ) ( not ( = ?auto_35468 ?auto_35469 ) ) ( not ( = ?auto_35464 ?auto_35469 ) ) ( ON ?auto_35458 ?auto_35457 ) ( not ( = ?auto_35457 ?auto_35458 ) ) ( not ( = ?auto_35457 ?auto_35459 ) ) ( not ( = ?auto_35457 ?auto_35460 ) ) ( not ( = ?auto_35457 ?auto_35461 ) ) ( not ( = ?auto_35457 ?auto_35466 ) ) ( not ( = ?auto_35457 ?auto_35470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35459 ?auto_35460 ?auto_35461 )
      ( MAKE-4CRATE-VERIFY ?auto_35457 ?auto_35458 ?auto_35459 ?auto_35460 ?auto_35461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35472 - SURFACE
      ?auto_35473 - SURFACE
      ?auto_35474 - SURFACE
      ?auto_35475 - SURFACE
      ?auto_35476 - SURFACE
      ?auto_35477 - SURFACE
    )
    :vars
    (
      ?auto_35478 - HOIST
      ?auto_35479 - PLACE
      ?auto_35484 - PLACE
      ?auto_35483 - HOIST
      ?auto_35482 - SURFACE
      ?auto_35480 - PLACE
      ?auto_35487 - HOIST
      ?auto_35486 - SURFACE
      ?auto_35481 - TRUCK
      ?auto_35485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35478 ?auto_35479 ) ( IS-CRATE ?auto_35477 ) ( not ( = ?auto_35476 ?auto_35477 ) ) ( not ( = ?auto_35475 ?auto_35476 ) ) ( not ( = ?auto_35475 ?auto_35477 ) ) ( not ( = ?auto_35484 ?auto_35479 ) ) ( HOIST-AT ?auto_35483 ?auto_35484 ) ( not ( = ?auto_35478 ?auto_35483 ) ) ( AVAILABLE ?auto_35483 ) ( SURFACE-AT ?auto_35477 ?auto_35484 ) ( ON ?auto_35477 ?auto_35482 ) ( CLEAR ?auto_35477 ) ( not ( = ?auto_35476 ?auto_35482 ) ) ( not ( = ?auto_35477 ?auto_35482 ) ) ( not ( = ?auto_35475 ?auto_35482 ) ) ( IS-CRATE ?auto_35476 ) ( not ( = ?auto_35480 ?auto_35479 ) ) ( not ( = ?auto_35484 ?auto_35480 ) ) ( HOIST-AT ?auto_35487 ?auto_35480 ) ( not ( = ?auto_35478 ?auto_35487 ) ) ( not ( = ?auto_35483 ?auto_35487 ) ) ( AVAILABLE ?auto_35487 ) ( SURFACE-AT ?auto_35476 ?auto_35480 ) ( ON ?auto_35476 ?auto_35486 ) ( CLEAR ?auto_35476 ) ( not ( = ?auto_35476 ?auto_35486 ) ) ( not ( = ?auto_35477 ?auto_35486 ) ) ( not ( = ?auto_35475 ?auto_35486 ) ) ( not ( = ?auto_35482 ?auto_35486 ) ) ( SURFACE-AT ?auto_35474 ?auto_35479 ) ( CLEAR ?auto_35474 ) ( IS-CRATE ?auto_35475 ) ( not ( = ?auto_35474 ?auto_35475 ) ) ( not ( = ?auto_35476 ?auto_35474 ) ) ( not ( = ?auto_35477 ?auto_35474 ) ) ( not ( = ?auto_35482 ?auto_35474 ) ) ( not ( = ?auto_35486 ?auto_35474 ) ) ( AVAILABLE ?auto_35478 ) ( IN ?auto_35475 ?auto_35481 ) ( TRUCK-AT ?auto_35481 ?auto_35485 ) ( not ( = ?auto_35485 ?auto_35479 ) ) ( not ( = ?auto_35484 ?auto_35485 ) ) ( not ( = ?auto_35480 ?auto_35485 ) ) ( ON ?auto_35473 ?auto_35472 ) ( ON ?auto_35474 ?auto_35473 ) ( not ( = ?auto_35472 ?auto_35473 ) ) ( not ( = ?auto_35472 ?auto_35474 ) ) ( not ( = ?auto_35472 ?auto_35475 ) ) ( not ( = ?auto_35472 ?auto_35476 ) ) ( not ( = ?auto_35472 ?auto_35477 ) ) ( not ( = ?auto_35472 ?auto_35482 ) ) ( not ( = ?auto_35472 ?auto_35486 ) ) ( not ( = ?auto_35473 ?auto_35474 ) ) ( not ( = ?auto_35473 ?auto_35475 ) ) ( not ( = ?auto_35473 ?auto_35476 ) ) ( not ( = ?auto_35473 ?auto_35477 ) ) ( not ( = ?auto_35473 ?auto_35482 ) ) ( not ( = ?auto_35473 ?auto_35486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35475 ?auto_35476 ?auto_35477 )
      ( MAKE-5CRATE-VERIFY ?auto_35472 ?auto_35473 ?auto_35474 ?auto_35475 ?auto_35476 ?auto_35477 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35488 - SURFACE
      ?auto_35489 - SURFACE
    )
    :vars
    (
      ?auto_35490 - HOIST
      ?auto_35491 - PLACE
      ?auto_35499 - SURFACE
      ?auto_35497 - PLACE
      ?auto_35496 - HOIST
      ?auto_35495 - SURFACE
      ?auto_35493 - PLACE
      ?auto_35501 - HOIST
      ?auto_35500 - SURFACE
      ?auto_35492 - SURFACE
      ?auto_35494 - TRUCK
      ?auto_35498 - PLACE
      ?auto_35502 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35490 ?auto_35491 ) ( IS-CRATE ?auto_35489 ) ( not ( = ?auto_35488 ?auto_35489 ) ) ( not ( = ?auto_35499 ?auto_35488 ) ) ( not ( = ?auto_35499 ?auto_35489 ) ) ( not ( = ?auto_35497 ?auto_35491 ) ) ( HOIST-AT ?auto_35496 ?auto_35497 ) ( not ( = ?auto_35490 ?auto_35496 ) ) ( AVAILABLE ?auto_35496 ) ( SURFACE-AT ?auto_35489 ?auto_35497 ) ( ON ?auto_35489 ?auto_35495 ) ( CLEAR ?auto_35489 ) ( not ( = ?auto_35488 ?auto_35495 ) ) ( not ( = ?auto_35489 ?auto_35495 ) ) ( not ( = ?auto_35499 ?auto_35495 ) ) ( IS-CRATE ?auto_35488 ) ( not ( = ?auto_35493 ?auto_35491 ) ) ( not ( = ?auto_35497 ?auto_35493 ) ) ( HOIST-AT ?auto_35501 ?auto_35493 ) ( not ( = ?auto_35490 ?auto_35501 ) ) ( not ( = ?auto_35496 ?auto_35501 ) ) ( AVAILABLE ?auto_35501 ) ( SURFACE-AT ?auto_35488 ?auto_35493 ) ( ON ?auto_35488 ?auto_35500 ) ( CLEAR ?auto_35488 ) ( not ( = ?auto_35488 ?auto_35500 ) ) ( not ( = ?auto_35489 ?auto_35500 ) ) ( not ( = ?auto_35499 ?auto_35500 ) ) ( not ( = ?auto_35495 ?auto_35500 ) ) ( SURFACE-AT ?auto_35492 ?auto_35491 ) ( CLEAR ?auto_35492 ) ( IS-CRATE ?auto_35499 ) ( not ( = ?auto_35492 ?auto_35499 ) ) ( not ( = ?auto_35488 ?auto_35492 ) ) ( not ( = ?auto_35489 ?auto_35492 ) ) ( not ( = ?auto_35495 ?auto_35492 ) ) ( not ( = ?auto_35500 ?auto_35492 ) ) ( AVAILABLE ?auto_35490 ) ( TRUCK-AT ?auto_35494 ?auto_35498 ) ( not ( = ?auto_35498 ?auto_35491 ) ) ( not ( = ?auto_35497 ?auto_35498 ) ) ( not ( = ?auto_35493 ?auto_35498 ) ) ( HOIST-AT ?auto_35502 ?auto_35498 ) ( LIFTING ?auto_35502 ?auto_35499 ) ( not ( = ?auto_35490 ?auto_35502 ) ) ( not ( = ?auto_35496 ?auto_35502 ) ) ( not ( = ?auto_35501 ?auto_35502 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35502 ?auto_35499 ?auto_35494 ?auto_35498 )
      ( MAKE-2CRATE ?auto_35499 ?auto_35488 ?auto_35489 )
      ( MAKE-1CRATE-VERIFY ?auto_35488 ?auto_35489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35503 - SURFACE
      ?auto_35504 - SURFACE
      ?auto_35505 - SURFACE
    )
    :vars
    (
      ?auto_35512 - HOIST
      ?auto_35508 - PLACE
      ?auto_35509 - PLACE
      ?auto_35517 - HOIST
      ?auto_35514 - SURFACE
      ?auto_35510 - PLACE
      ?auto_35507 - HOIST
      ?auto_35513 - SURFACE
      ?auto_35506 - SURFACE
      ?auto_35516 - TRUCK
      ?auto_35511 - PLACE
      ?auto_35515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35512 ?auto_35508 ) ( IS-CRATE ?auto_35505 ) ( not ( = ?auto_35504 ?auto_35505 ) ) ( not ( = ?auto_35503 ?auto_35504 ) ) ( not ( = ?auto_35503 ?auto_35505 ) ) ( not ( = ?auto_35509 ?auto_35508 ) ) ( HOIST-AT ?auto_35517 ?auto_35509 ) ( not ( = ?auto_35512 ?auto_35517 ) ) ( AVAILABLE ?auto_35517 ) ( SURFACE-AT ?auto_35505 ?auto_35509 ) ( ON ?auto_35505 ?auto_35514 ) ( CLEAR ?auto_35505 ) ( not ( = ?auto_35504 ?auto_35514 ) ) ( not ( = ?auto_35505 ?auto_35514 ) ) ( not ( = ?auto_35503 ?auto_35514 ) ) ( IS-CRATE ?auto_35504 ) ( not ( = ?auto_35510 ?auto_35508 ) ) ( not ( = ?auto_35509 ?auto_35510 ) ) ( HOIST-AT ?auto_35507 ?auto_35510 ) ( not ( = ?auto_35512 ?auto_35507 ) ) ( not ( = ?auto_35517 ?auto_35507 ) ) ( AVAILABLE ?auto_35507 ) ( SURFACE-AT ?auto_35504 ?auto_35510 ) ( ON ?auto_35504 ?auto_35513 ) ( CLEAR ?auto_35504 ) ( not ( = ?auto_35504 ?auto_35513 ) ) ( not ( = ?auto_35505 ?auto_35513 ) ) ( not ( = ?auto_35503 ?auto_35513 ) ) ( not ( = ?auto_35514 ?auto_35513 ) ) ( SURFACE-AT ?auto_35506 ?auto_35508 ) ( CLEAR ?auto_35506 ) ( IS-CRATE ?auto_35503 ) ( not ( = ?auto_35506 ?auto_35503 ) ) ( not ( = ?auto_35504 ?auto_35506 ) ) ( not ( = ?auto_35505 ?auto_35506 ) ) ( not ( = ?auto_35514 ?auto_35506 ) ) ( not ( = ?auto_35513 ?auto_35506 ) ) ( AVAILABLE ?auto_35512 ) ( TRUCK-AT ?auto_35516 ?auto_35511 ) ( not ( = ?auto_35511 ?auto_35508 ) ) ( not ( = ?auto_35509 ?auto_35511 ) ) ( not ( = ?auto_35510 ?auto_35511 ) ) ( HOIST-AT ?auto_35515 ?auto_35511 ) ( LIFTING ?auto_35515 ?auto_35503 ) ( not ( = ?auto_35512 ?auto_35515 ) ) ( not ( = ?auto_35517 ?auto_35515 ) ) ( not ( = ?auto_35507 ?auto_35515 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35504 ?auto_35505 )
      ( MAKE-2CRATE-VERIFY ?auto_35503 ?auto_35504 ?auto_35505 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35518 - SURFACE
      ?auto_35519 - SURFACE
      ?auto_35520 - SURFACE
      ?auto_35521 - SURFACE
    )
    :vars
    (
      ?auto_35525 - HOIST
      ?auto_35526 - PLACE
      ?auto_35531 - PLACE
      ?auto_35529 - HOIST
      ?auto_35527 - SURFACE
      ?auto_35522 - PLACE
      ?auto_35528 - HOIST
      ?auto_35532 - SURFACE
      ?auto_35523 - TRUCK
      ?auto_35524 - PLACE
      ?auto_35530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35525 ?auto_35526 ) ( IS-CRATE ?auto_35521 ) ( not ( = ?auto_35520 ?auto_35521 ) ) ( not ( = ?auto_35519 ?auto_35520 ) ) ( not ( = ?auto_35519 ?auto_35521 ) ) ( not ( = ?auto_35531 ?auto_35526 ) ) ( HOIST-AT ?auto_35529 ?auto_35531 ) ( not ( = ?auto_35525 ?auto_35529 ) ) ( AVAILABLE ?auto_35529 ) ( SURFACE-AT ?auto_35521 ?auto_35531 ) ( ON ?auto_35521 ?auto_35527 ) ( CLEAR ?auto_35521 ) ( not ( = ?auto_35520 ?auto_35527 ) ) ( not ( = ?auto_35521 ?auto_35527 ) ) ( not ( = ?auto_35519 ?auto_35527 ) ) ( IS-CRATE ?auto_35520 ) ( not ( = ?auto_35522 ?auto_35526 ) ) ( not ( = ?auto_35531 ?auto_35522 ) ) ( HOIST-AT ?auto_35528 ?auto_35522 ) ( not ( = ?auto_35525 ?auto_35528 ) ) ( not ( = ?auto_35529 ?auto_35528 ) ) ( AVAILABLE ?auto_35528 ) ( SURFACE-AT ?auto_35520 ?auto_35522 ) ( ON ?auto_35520 ?auto_35532 ) ( CLEAR ?auto_35520 ) ( not ( = ?auto_35520 ?auto_35532 ) ) ( not ( = ?auto_35521 ?auto_35532 ) ) ( not ( = ?auto_35519 ?auto_35532 ) ) ( not ( = ?auto_35527 ?auto_35532 ) ) ( SURFACE-AT ?auto_35518 ?auto_35526 ) ( CLEAR ?auto_35518 ) ( IS-CRATE ?auto_35519 ) ( not ( = ?auto_35518 ?auto_35519 ) ) ( not ( = ?auto_35520 ?auto_35518 ) ) ( not ( = ?auto_35521 ?auto_35518 ) ) ( not ( = ?auto_35527 ?auto_35518 ) ) ( not ( = ?auto_35532 ?auto_35518 ) ) ( AVAILABLE ?auto_35525 ) ( TRUCK-AT ?auto_35523 ?auto_35524 ) ( not ( = ?auto_35524 ?auto_35526 ) ) ( not ( = ?auto_35531 ?auto_35524 ) ) ( not ( = ?auto_35522 ?auto_35524 ) ) ( HOIST-AT ?auto_35530 ?auto_35524 ) ( LIFTING ?auto_35530 ?auto_35519 ) ( not ( = ?auto_35525 ?auto_35530 ) ) ( not ( = ?auto_35529 ?auto_35530 ) ) ( not ( = ?auto_35528 ?auto_35530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35519 ?auto_35520 ?auto_35521 )
      ( MAKE-3CRATE-VERIFY ?auto_35518 ?auto_35519 ?auto_35520 ?auto_35521 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35533 - SURFACE
      ?auto_35534 - SURFACE
      ?auto_35535 - SURFACE
      ?auto_35536 - SURFACE
      ?auto_35537 - SURFACE
    )
    :vars
    (
      ?auto_35541 - HOIST
      ?auto_35542 - PLACE
      ?auto_35547 - PLACE
      ?auto_35545 - HOIST
      ?auto_35543 - SURFACE
      ?auto_35538 - PLACE
      ?auto_35544 - HOIST
      ?auto_35548 - SURFACE
      ?auto_35539 - TRUCK
      ?auto_35540 - PLACE
      ?auto_35546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35541 ?auto_35542 ) ( IS-CRATE ?auto_35537 ) ( not ( = ?auto_35536 ?auto_35537 ) ) ( not ( = ?auto_35535 ?auto_35536 ) ) ( not ( = ?auto_35535 ?auto_35537 ) ) ( not ( = ?auto_35547 ?auto_35542 ) ) ( HOIST-AT ?auto_35545 ?auto_35547 ) ( not ( = ?auto_35541 ?auto_35545 ) ) ( AVAILABLE ?auto_35545 ) ( SURFACE-AT ?auto_35537 ?auto_35547 ) ( ON ?auto_35537 ?auto_35543 ) ( CLEAR ?auto_35537 ) ( not ( = ?auto_35536 ?auto_35543 ) ) ( not ( = ?auto_35537 ?auto_35543 ) ) ( not ( = ?auto_35535 ?auto_35543 ) ) ( IS-CRATE ?auto_35536 ) ( not ( = ?auto_35538 ?auto_35542 ) ) ( not ( = ?auto_35547 ?auto_35538 ) ) ( HOIST-AT ?auto_35544 ?auto_35538 ) ( not ( = ?auto_35541 ?auto_35544 ) ) ( not ( = ?auto_35545 ?auto_35544 ) ) ( AVAILABLE ?auto_35544 ) ( SURFACE-AT ?auto_35536 ?auto_35538 ) ( ON ?auto_35536 ?auto_35548 ) ( CLEAR ?auto_35536 ) ( not ( = ?auto_35536 ?auto_35548 ) ) ( not ( = ?auto_35537 ?auto_35548 ) ) ( not ( = ?auto_35535 ?auto_35548 ) ) ( not ( = ?auto_35543 ?auto_35548 ) ) ( SURFACE-AT ?auto_35534 ?auto_35542 ) ( CLEAR ?auto_35534 ) ( IS-CRATE ?auto_35535 ) ( not ( = ?auto_35534 ?auto_35535 ) ) ( not ( = ?auto_35536 ?auto_35534 ) ) ( not ( = ?auto_35537 ?auto_35534 ) ) ( not ( = ?auto_35543 ?auto_35534 ) ) ( not ( = ?auto_35548 ?auto_35534 ) ) ( AVAILABLE ?auto_35541 ) ( TRUCK-AT ?auto_35539 ?auto_35540 ) ( not ( = ?auto_35540 ?auto_35542 ) ) ( not ( = ?auto_35547 ?auto_35540 ) ) ( not ( = ?auto_35538 ?auto_35540 ) ) ( HOIST-AT ?auto_35546 ?auto_35540 ) ( LIFTING ?auto_35546 ?auto_35535 ) ( not ( = ?auto_35541 ?auto_35546 ) ) ( not ( = ?auto_35545 ?auto_35546 ) ) ( not ( = ?auto_35544 ?auto_35546 ) ) ( ON ?auto_35534 ?auto_35533 ) ( not ( = ?auto_35533 ?auto_35534 ) ) ( not ( = ?auto_35533 ?auto_35535 ) ) ( not ( = ?auto_35533 ?auto_35536 ) ) ( not ( = ?auto_35533 ?auto_35537 ) ) ( not ( = ?auto_35533 ?auto_35543 ) ) ( not ( = ?auto_35533 ?auto_35548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35535 ?auto_35536 ?auto_35537 )
      ( MAKE-4CRATE-VERIFY ?auto_35533 ?auto_35534 ?auto_35535 ?auto_35536 ?auto_35537 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35549 - SURFACE
      ?auto_35550 - SURFACE
      ?auto_35551 - SURFACE
      ?auto_35552 - SURFACE
      ?auto_35553 - SURFACE
      ?auto_35554 - SURFACE
    )
    :vars
    (
      ?auto_35558 - HOIST
      ?auto_35559 - PLACE
      ?auto_35564 - PLACE
      ?auto_35562 - HOIST
      ?auto_35560 - SURFACE
      ?auto_35555 - PLACE
      ?auto_35561 - HOIST
      ?auto_35565 - SURFACE
      ?auto_35556 - TRUCK
      ?auto_35557 - PLACE
      ?auto_35563 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35558 ?auto_35559 ) ( IS-CRATE ?auto_35554 ) ( not ( = ?auto_35553 ?auto_35554 ) ) ( not ( = ?auto_35552 ?auto_35553 ) ) ( not ( = ?auto_35552 ?auto_35554 ) ) ( not ( = ?auto_35564 ?auto_35559 ) ) ( HOIST-AT ?auto_35562 ?auto_35564 ) ( not ( = ?auto_35558 ?auto_35562 ) ) ( AVAILABLE ?auto_35562 ) ( SURFACE-AT ?auto_35554 ?auto_35564 ) ( ON ?auto_35554 ?auto_35560 ) ( CLEAR ?auto_35554 ) ( not ( = ?auto_35553 ?auto_35560 ) ) ( not ( = ?auto_35554 ?auto_35560 ) ) ( not ( = ?auto_35552 ?auto_35560 ) ) ( IS-CRATE ?auto_35553 ) ( not ( = ?auto_35555 ?auto_35559 ) ) ( not ( = ?auto_35564 ?auto_35555 ) ) ( HOIST-AT ?auto_35561 ?auto_35555 ) ( not ( = ?auto_35558 ?auto_35561 ) ) ( not ( = ?auto_35562 ?auto_35561 ) ) ( AVAILABLE ?auto_35561 ) ( SURFACE-AT ?auto_35553 ?auto_35555 ) ( ON ?auto_35553 ?auto_35565 ) ( CLEAR ?auto_35553 ) ( not ( = ?auto_35553 ?auto_35565 ) ) ( not ( = ?auto_35554 ?auto_35565 ) ) ( not ( = ?auto_35552 ?auto_35565 ) ) ( not ( = ?auto_35560 ?auto_35565 ) ) ( SURFACE-AT ?auto_35551 ?auto_35559 ) ( CLEAR ?auto_35551 ) ( IS-CRATE ?auto_35552 ) ( not ( = ?auto_35551 ?auto_35552 ) ) ( not ( = ?auto_35553 ?auto_35551 ) ) ( not ( = ?auto_35554 ?auto_35551 ) ) ( not ( = ?auto_35560 ?auto_35551 ) ) ( not ( = ?auto_35565 ?auto_35551 ) ) ( AVAILABLE ?auto_35558 ) ( TRUCK-AT ?auto_35556 ?auto_35557 ) ( not ( = ?auto_35557 ?auto_35559 ) ) ( not ( = ?auto_35564 ?auto_35557 ) ) ( not ( = ?auto_35555 ?auto_35557 ) ) ( HOIST-AT ?auto_35563 ?auto_35557 ) ( LIFTING ?auto_35563 ?auto_35552 ) ( not ( = ?auto_35558 ?auto_35563 ) ) ( not ( = ?auto_35562 ?auto_35563 ) ) ( not ( = ?auto_35561 ?auto_35563 ) ) ( ON ?auto_35550 ?auto_35549 ) ( ON ?auto_35551 ?auto_35550 ) ( not ( = ?auto_35549 ?auto_35550 ) ) ( not ( = ?auto_35549 ?auto_35551 ) ) ( not ( = ?auto_35549 ?auto_35552 ) ) ( not ( = ?auto_35549 ?auto_35553 ) ) ( not ( = ?auto_35549 ?auto_35554 ) ) ( not ( = ?auto_35549 ?auto_35560 ) ) ( not ( = ?auto_35549 ?auto_35565 ) ) ( not ( = ?auto_35550 ?auto_35551 ) ) ( not ( = ?auto_35550 ?auto_35552 ) ) ( not ( = ?auto_35550 ?auto_35553 ) ) ( not ( = ?auto_35550 ?auto_35554 ) ) ( not ( = ?auto_35550 ?auto_35560 ) ) ( not ( = ?auto_35550 ?auto_35565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35552 ?auto_35553 ?auto_35554 )
      ( MAKE-5CRATE-VERIFY ?auto_35549 ?auto_35550 ?auto_35551 ?auto_35552 ?auto_35553 ?auto_35554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35566 - SURFACE
      ?auto_35567 - SURFACE
    )
    :vars
    (
      ?auto_35571 - HOIST
      ?auto_35572 - PLACE
      ?auto_35573 - SURFACE
      ?auto_35578 - PLACE
      ?auto_35576 - HOIST
      ?auto_35574 - SURFACE
      ?auto_35568 - PLACE
      ?auto_35575 - HOIST
      ?auto_35580 - SURFACE
      ?auto_35579 - SURFACE
      ?auto_35569 - TRUCK
      ?auto_35570 - PLACE
      ?auto_35577 - HOIST
      ?auto_35581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35571 ?auto_35572 ) ( IS-CRATE ?auto_35567 ) ( not ( = ?auto_35566 ?auto_35567 ) ) ( not ( = ?auto_35573 ?auto_35566 ) ) ( not ( = ?auto_35573 ?auto_35567 ) ) ( not ( = ?auto_35578 ?auto_35572 ) ) ( HOIST-AT ?auto_35576 ?auto_35578 ) ( not ( = ?auto_35571 ?auto_35576 ) ) ( AVAILABLE ?auto_35576 ) ( SURFACE-AT ?auto_35567 ?auto_35578 ) ( ON ?auto_35567 ?auto_35574 ) ( CLEAR ?auto_35567 ) ( not ( = ?auto_35566 ?auto_35574 ) ) ( not ( = ?auto_35567 ?auto_35574 ) ) ( not ( = ?auto_35573 ?auto_35574 ) ) ( IS-CRATE ?auto_35566 ) ( not ( = ?auto_35568 ?auto_35572 ) ) ( not ( = ?auto_35578 ?auto_35568 ) ) ( HOIST-AT ?auto_35575 ?auto_35568 ) ( not ( = ?auto_35571 ?auto_35575 ) ) ( not ( = ?auto_35576 ?auto_35575 ) ) ( AVAILABLE ?auto_35575 ) ( SURFACE-AT ?auto_35566 ?auto_35568 ) ( ON ?auto_35566 ?auto_35580 ) ( CLEAR ?auto_35566 ) ( not ( = ?auto_35566 ?auto_35580 ) ) ( not ( = ?auto_35567 ?auto_35580 ) ) ( not ( = ?auto_35573 ?auto_35580 ) ) ( not ( = ?auto_35574 ?auto_35580 ) ) ( SURFACE-AT ?auto_35579 ?auto_35572 ) ( CLEAR ?auto_35579 ) ( IS-CRATE ?auto_35573 ) ( not ( = ?auto_35579 ?auto_35573 ) ) ( not ( = ?auto_35566 ?auto_35579 ) ) ( not ( = ?auto_35567 ?auto_35579 ) ) ( not ( = ?auto_35574 ?auto_35579 ) ) ( not ( = ?auto_35580 ?auto_35579 ) ) ( AVAILABLE ?auto_35571 ) ( TRUCK-AT ?auto_35569 ?auto_35570 ) ( not ( = ?auto_35570 ?auto_35572 ) ) ( not ( = ?auto_35578 ?auto_35570 ) ) ( not ( = ?auto_35568 ?auto_35570 ) ) ( HOIST-AT ?auto_35577 ?auto_35570 ) ( not ( = ?auto_35571 ?auto_35577 ) ) ( not ( = ?auto_35576 ?auto_35577 ) ) ( not ( = ?auto_35575 ?auto_35577 ) ) ( AVAILABLE ?auto_35577 ) ( SURFACE-AT ?auto_35573 ?auto_35570 ) ( ON ?auto_35573 ?auto_35581 ) ( CLEAR ?auto_35573 ) ( not ( = ?auto_35566 ?auto_35581 ) ) ( not ( = ?auto_35567 ?auto_35581 ) ) ( not ( = ?auto_35573 ?auto_35581 ) ) ( not ( = ?auto_35574 ?auto_35581 ) ) ( not ( = ?auto_35580 ?auto_35581 ) ) ( not ( = ?auto_35579 ?auto_35581 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35577 ?auto_35573 ?auto_35581 ?auto_35570 )
      ( MAKE-2CRATE ?auto_35573 ?auto_35566 ?auto_35567 )
      ( MAKE-1CRATE-VERIFY ?auto_35566 ?auto_35567 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35582 - SURFACE
      ?auto_35583 - SURFACE
      ?auto_35584 - SURFACE
    )
    :vars
    (
      ?auto_35590 - HOIST
      ?auto_35585 - PLACE
      ?auto_35594 - PLACE
      ?auto_35593 - HOIST
      ?auto_35595 - SURFACE
      ?auto_35586 - PLACE
      ?auto_35592 - HOIST
      ?auto_35596 - SURFACE
      ?auto_35589 - SURFACE
      ?auto_35587 - TRUCK
      ?auto_35597 - PLACE
      ?auto_35591 - HOIST
      ?auto_35588 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35590 ?auto_35585 ) ( IS-CRATE ?auto_35584 ) ( not ( = ?auto_35583 ?auto_35584 ) ) ( not ( = ?auto_35582 ?auto_35583 ) ) ( not ( = ?auto_35582 ?auto_35584 ) ) ( not ( = ?auto_35594 ?auto_35585 ) ) ( HOIST-AT ?auto_35593 ?auto_35594 ) ( not ( = ?auto_35590 ?auto_35593 ) ) ( AVAILABLE ?auto_35593 ) ( SURFACE-AT ?auto_35584 ?auto_35594 ) ( ON ?auto_35584 ?auto_35595 ) ( CLEAR ?auto_35584 ) ( not ( = ?auto_35583 ?auto_35595 ) ) ( not ( = ?auto_35584 ?auto_35595 ) ) ( not ( = ?auto_35582 ?auto_35595 ) ) ( IS-CRATE ?auto_35583 ) ( not ( = ?auto_35586 ?auto_35585 ) ) ( not ( = ?auto_35594 ?auto_35586 ) ) ( HOIST-AT ?auto_35592 ?auto_35586 ) ( not ( = ?auto_35590 ?auto_35592 ) ) ( not ( = ?auto_35593 ?auto_35592 ) ) ( AVAILABLE ?auto_35592 ) ( SURFACE-AT ?auto_35583 ?auto_35586 ) ( ON ?auto_35583 ?auto_35596 ) ( CLEAR ?auto_35583 ) ( not ( = ?auto_35583 ?auto_35596 ) ) ( not ( = ?auto_35584 ?auto_35596 ) ) ( not ( = ?auto_35582 ?auto_35596 ) ) ( not ( = ?auto_35595 ?auto_35596 ) ) ( SURFACE-AT ?auto_35589 ?auto_35585 ) ( CLEAR ?auto_35589 ) ( IS-CRATE ?auto_35582 ) ( not ( = ?auto_35589 ?auto_35582 ) ) ( not ( = ?auto_35583 ?auto_35589 ) ) ( not ( = ?auto_35584 ?auto_35589 ) ) ( not ( = ?auto_35595 ?auto_35589 ) ) ( not ( = ?auto_35596 ?auto_35589 ) ) ( AVAILABLE ?auto_35590 ) ( TRUCK-AT ?auto_35587 ?auto_35597 ) ( not ( = ?auto_35597 ?auto_35585 ) ) ( not ( = ?auto_35594 ?auto_35597 ) ) ( not ( = ?auto_35586 ?auto_35597 ) ) ( HOIST-AT ?auto_35591 ?auto_35597 ) ( not ( = ?auto_35590 ?auto_35591 ) ) ( not ( = ?auto_35593 ?auto_35591 ) ) ( not ( = ?auto_35592 ?auto_35591 ) ) ( AVAILABLE ?auto_35591 ) ( SURFACE-AT ?auto_35582 ?auto_35597 ) ( ON ?auto_35582 ?auto_35588 ) ( CLEAR ?auto_35582 ) ( not ( = ?auto_35583 ?auto_35588 ) ) ( not ( = ?auto_35584 ?auto_35588 ) ) ( not ( = ?auto_35582 ?auto_35588 ) ) ( not ( = ?auto_35595 ?auto_35588 ) ) ( not ( = ?auto_35596 ?auto_35588 ) ) ( not ( = ?auto_35589 ?auto_35588 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35583 ?auto_35584 )
      ( MAKE-2CRATE-VERIFY ?auto_35582 ?auto_35583 ?auto_35584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35598 - SURFACE
      ?auto_35599 - SURFACE
      ?auto_35600 - SURFACE
      ?auto_35601 - SURFACE
    )
    :vars
    (
      ?auto_35608 - HOIST
      ?auto_35612 - PLACE
      ?auto_35602 - PLACE
      ?auto_35613 - HOIST
      ?auto_35605 - SURFACE
      ?auto_35606 - PLACE
      ?auto_35609 - HOIST
      ?auto_35604 - SURFACE
      ?auto_35603 - TRUCK
      ?auto_35607 - PLACE
      ?auto_35611 - HOIST
      ?auto_35610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35608 ?auto_35612 ) ( IS-CRATE ?auto_35601 ) ( not ( = ?auto_35600 ?auto_35601 ) ) ( not ( = ?auto_35599 ?auto_35600 ) ) ( not ( = ?auto_35599 ?auto_35601 ) ) ( not ( = ?auto_35602 ?auto_35612 ) ) ( HOIST-AT ?auto_35613 ?auto_35602 ) ( not ( = ?auto_35608 ?auto_35613 ) ) ( AVAILABLE ?auto_35613 ) ( SURFACE-AT ?auto_35601 ?auto_35602 ) ( ON ?auto_35601 ?auto_35605 ) ( CLEAR ?auto_35601 ) ( not ( = ?auto_35600 ?auto_35605 ) ) ( not ( = ?auto_35601 ?auto_35605 ) ) ( not ( = ?auto_35599 ?auto_35605 ) ) ( IS-CRATE ?auto_35600 ) ( not ( = ?auto_35606 ?auto_35612 ) ) ( not ( = ?auto_35602 ?auto_35606 ) ) ( HOIST-AT ?auto_35609 ?auto_35606 ) ( not ( = ?auto_35608 ?auto_35609 ) ) ( not ( = ?auto_35613 ?auto_35609 ) ) ( AVAILABLE ?auto_35609 ) ( SURFACE-AT ?auto_35600 ?auto_35606 ) ( ON ?auto_35600 ?auto_35604 ) ( CLEAR ?auto_35600 ) ( not ( = ?auto_35600 ?auto_35604 ) ) ( not ( = ?auto_35601 ?auto_35604 ) ) ( not ( = ?auto_35599 ?auto_35604 ) ) ( not ( = ?auto_35605 ?auto_35604 ) ) ( SURFACE-AT ?auto_35598 ?auto_35612 ) ( CLEAR ?auto_35598 ) ( IS-CRATE ?auto_35599 ) ( not ( = ?auto_35598 ?auto_35599 ) ) ( not ( = ?auto_35600 ?auto_35598 ) ) ( not ( = ?auto_35601 ?auto_35598 ) ) ( not ( = ?auto_35605 ?auto_35598 ) ) ( not ( = ?auto_35604 ?auto_35598 ) ) ( AVAILABLE ?auto_35608 ) ( TRUCK-AT ?auto_35603 ?auto_35607 ) ( not ( = ?auto_35607 ?auto_35612 ) ) ( not ( = ?auto_35602 ?auto_35607 ) ) ( not ( = ?auto_35606 ?auto_35607 ) ) ( HOIST-AT ?auto_35611 ?auto_35607 ) ( not ( = ?auto_35608 ?auto_35611 ) ) ( not ( = ?auto_35613 ?auto_35611 ) ) ( not ( = ?auto_35609 ?auto_35611 ) ) ( AVAILABLE ?auto_35611 ) ( SURFACE-AT ?auto_35599 ?auto_35607 ) ( ON ?auto_35599 ?auto_35610 ) ( CLEAR ?auto_35599 ) ( not ( = ?auto_35600 ?auto_35610 ) ) ( not ( = ?auto_35601 ?auto_35610 ) ) ( not ( = ?auto_35599 ?auto_35610 ) ) ( not ( = ?auto_35605 ?auto_35610 ) ) ( not ( = ?auto_35604 ?auto_35610 ) ) ( not ( = ?auto_35598 ?auto_35610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35599 ?auto_35600 ?auto_35601 )
      ( MAKE-3CRATE-VERIFY ?auto_35598 ?auto_35599 ?auto_35600 ?auto_35601 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35614 - SURFACE
      ?auto_35615 - SURFACE
      ?auto_35616 - SURFACE
      ?auto_35617 - SURFACE
      ?auto_35618 - SURFACE
    )
    :vars
    (
      ?auto_35625 - HOIST
      ?auto_35629 - PLACE
      ?auto_35619 - PLACE
      ?auto_35630 - HOIST
      ?auto_35622 - SURFACE
      ?auto_35623 - PLACE
      ?auto_35626 - HOIST
      ?auto_35621 - SURFACE
      ?auto_35620 - TRUCK
      ?auto_35624 - PLACE
      ?auto_35628 - HOIST
      ?auto_35627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35625 ?auto_35629 ) ( IS-CRATE ?auto_35618 ) ( not ( = ?auto_35617 ?auto_35618 ) ) ( not ( = ?auto_35616 ?auto_35617 ) ) ( not ( = ?auto_35616 ?auto_35618 ) ) ( not ( = ?auto_35619 ?auto_35629 ) ) ( HOIST-AT ?auto_35630 ?auto_35619 ) ( not ( = ?auto_35625 ?auto_35630 ) ) ( AVAILABLE ?auto_35630 ) ( SURFACE-AT ?auto_35618 ?auto_35619 ) ( ON ?auto_35618 ?auto_35622 ) ( CLEAR ?auto_35618 ) ( not ( = ?auto_35617 ?auto_35622 ) ) ( not ( = ?auto_35618 ?auto_35622 ) ) ( not ( = ?auto_35616 ?auto_35622 ) ) ( IS-CRATE ?auto_35617 ) ( not ( = ?auto_35623 ?auto_35629 ) ) ( not ( = ?auto_35619 ?auto_35623 ) ) ( HOIST-AT ?auto_35626 ?auto_35623 ) ( not ( = ?auto_35625 ?auto_35626 ) ) ( not ( = ?auto_35630 ?auto_35626 ) ) ( AVAILABLE ?auto_35626 ) ( SURFACE-AT ?auto_35617 ?auto_35623 ) ( ON ?auto_35617 ?auto_35621 ) ( CLEAR ?auto_35617 ) ( not ( = ?auto_35617 ?auto_35621 ) ) ( not ( = ?auto_35618 ?auto_35621 ) ) ( not ( = ?auto_35616 ?auto_35621 ) ) ( not ( = ?auto_35622 ?auto_35621 ) ) ( SURFACE-AT ?auto_35615 ?auto_35629 ) ( CLEAR ?auto_35615 ) ( IS-CRATE ?auto_35616 ) ( not ( = ?auto_35615 ?auto_35616 ) ) ( not ( = ?auto_35617 ?auto_35615 ) ) ( not ( = ?auto_35618 ?auto_35615 ) ) ( not ( = ?auto_35622 ?auto_35615 ) ) ( not ( = ?auto_35621 ?auto_35615 ) ) ( AVAILABLE ?auto_35625 ) ( TRUCK-AT ?auto_35620 ?auto_35624 ) ( not ( = ?auto_35624 ?auto_35629 ) ) ( not ( = ?auto_35619 ?auto_35624 ) ) ( not ( = ?auto_35623 ?auto_35624 ) ) ( HOIST-AT ?auto_35628 ?auto_35624 ) ( not ( = ?auto_35625 ?auto_35628 ) ) ( not ( = ?auto_35630 ?auto_35628 ) ) ( not ( = ?auto_35626 ?auto_35628 ) ) ( AVAILABLE ?auto_35628 ) ( SURFACE-AT ?auto_35616 ?auto_35624 ) ( ON ?auto_35616 ?auto_35627 ) ( CLEAR ?auto_35616 ) ( not ( = ?auto_35617 ?auto_35627 ) ) ( not ( = ?auto_35618 ?auto_35627 ) ) ( not ( = ?auto_35616 ?auto_35627 ) ) ( not ( = ?auto_35622 ?auto_35627 ) ) ( not ( = ?auto_35621 ?auto_35627 ) ) ( not ( = ?auto_35615 ?auto_35627 ) ) ( ON ?auto_35615 ?auto_35614 ) ( not ( = ?auto_35614 ?auto_35615 ) ) ( not ( = ?auto_35614 ?auto_35616 ) ) ( not ( = ?auto_35614 ?auto_35617 ) ) ( not ( = ?auto_35614 ?auto_35618 ) ) ( not ( = ?auto_35614 ?auto_35622 ) ) ( not ( = ?auto_35614 ?auto_35621 ) ) ( not ( = ?auto_35614 ?auto_35627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35616 ?auto_35617 ?auto_35618 )
      ( MAKE-4CRATE-VERIFY ?auto_35614 ?auto_35615 ?auto_35616 ?auto_35617 ?auto_35618 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35631 - SURFACE
      ?auto_35632 - SURFACE
      ?auto_35633 - SURFACE
      ?auto_35634 - SURFACE
      ?auto_35635 - SURFACE
      ?auto_35636 - SURFACE
    )
    :vars
    (
      ?auto_35643 - HOIST
      ?auto_35647 - PLACE
      ?auto_35637 - PLACE
      ?auto_35648 - HOIST
      ?auto_35640 - SURFACE
      ?auto_35641 - PLACE
      ?auto_35644 - HOIST
      ?auto_35639 - SURFACE
      ?auto_35638 - TRUCK
      ?auto_35642 - PLACE
      ?auto_35646 - HOIST
      ?auto_35645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35643 ?auto_35647 ) ( IS-CRATE ?auto_35636 ) ( not ( = ?auto_35635 ?auto_35636 ) ) ( not ( = ?auto_35634 ?auto_35635 ) ) ( not ( = ?auto_35634 ?auto_35636 ) ) ( not ( = ?auto_35637 ?auto_35647 ) ) ( HOIST-AT ?auto_35648 ?auto_35637 ) ( not ( = ?auto_35643 ?auto_35648 ) ) ( AVAILABLE ?auto_35648 ) ( SURFACE-AT ?auto_35636 ?auto_35637 ) ( ON ?auto_35636 ?auto_35640 ) ( CLEAR ?auto_35636 ) ( not ( = ?auto_35635 ?auto_35640 ) ) ( not ( = ?auto_35636 ?auto_35640 ) ) ( not ( = ?auto_35634 ?auto_35640 ) ) ( IS-CRATE ?auto_35635 ) ( not ( = ?auto_35641 ?auto_35647 ) ) ( not ( = ?auto_35637 ?auto_35641 ) ) ( HOIST-AT ?auto_35644 ?auto_35641 ) ( not ( = ?auto_35643 ?auto_35644 ) ) ( not ( = ?auto_35648 ?auto_35644 ) ) ( AVAILABLE ?auto_35644 ) ( SURFACE-AT ?auto_35635 ?auto_35641 ) ( ON ?auto_35635 ?auto_35639 ) ( CLEAR ?auto_35635 ) ( not ( = ?auto_35635 ?auto_35639 ) ) ( not ( = ?auto_35636 ?auto_35639 ) ) ( not ( = ?auto_35634 ?auto_35639 ) ) ( not ( = ?auto_35640 ?auto_35639 ) ) ( SURFACE-AT ?auto_35633 ?auto_35647 ) ( CLEAR ?auto_35633 ) ( IS-CRATE ?auto_35634 ) ( not ( = ?auto_35633 ?auto_35634 ) ) ( not ( = ?auto_35635 ?auto_35633 ) ) ( not ( = ?auto_35636 ?auto_35633 ) ) ( not ( = ?auto_35640 ?auto_35633 ) ) ( not ( = ?auto_35639 ?auto_35633 ) ) ( AVAILABLE ?auto_35643 ) ( TRUCK-AT ?auto_35638 ?auto_35642 ) ( not ( = ?auto_35642 ?auto_35647 ) ) ( not ( = ?auto_35637 ?auto_35642 ) ) ( not ( = ?auto_35641 ?auto_35642 ) ) ( HOIST-AT ?auto_35646 ?auto_35642 ) ( not ( = ?auto_35643 ?auto_35646 ) ) ( not ( = ?auto_35648 ?auto_35646 ) ) ( not ( = ?auto_35644 ?auto_35646 ) ) ( AVAILABLE ?auto_35646 ) ( SURFACE-AT ?auto_35634 ?auto_35642 ) ( ON ?auto_35634 ?auto_35645 ) ( CLEAR ?auto_35634 ) ( not ( = ?auto_35635 ?auto_35645 ) ) ( not ( = ?auto_35636 ?auto_35645 ) ) ( not ( = ?auto_35634 ?auto_35645 ) ) ( not ( = ?auto_35640 ?auto_35645 ) ) ( not ( = ?auto_35639 ?auto_35645 ) ) ( not ( = ?auto_35633 ?auto_35645 ) ) ( ON ?auto_35632 ?auto_35631 ) ( ON ?auto_35633 ?auto_35632 ) ( not ( = ?auto_35631 ?auto_35632 ) ) ( not ( = ?auto_35631 ?auto_35633 ) ) ( not ( = ?auto_35631 ?auto_35634 ) ) ( not ( = ?auto_35631 ?auto_35635 ) ) ( not ( = ?auto_35631 ?auto_35636 ) ) ( not ( = ?auto_35631 ?auto_35640 ) ) ( not ( = ?auto_35631 ?auto_35639 ) ) ( not ( = ?auto_35631 ?auto_35645 ) ) ( not ( = ?auto_35632 ?auto_35633 ) ) ( not ( = ?auto_35632 ?auto_35634 ) ) ( not ( = ?auto_35632 ?auto_35635 ) ) ( not ( = ?auto_35632 ?auto_35636 ) ) ( not ( = ?auto_35632 ?auto_35640 ) ) ( not ( = ?auto_35632 ?auto_35639 ) ) ( not ( = ?auto_35632 ?auto_35645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35634 ?auto_35635 ?auto_35636 )
      ( MAKE-5CRATE-VERIFY ?auto_35631 ?auto_35632 ?auto_35633 ?auto_35634 ?auto_35635 ?auto_35636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35649 - SURFACE
      ?auto_35650 - SURFACE
    )
    :vars
    (
      ?auto_35658 - HOIST
      ?auto_35663 - PLACE
      ?auto_35656 - SURFACE
      ?auto_35651 - PLACE
      ?auto_35664 - HOIST
      ?auto_35654 - SURFACE
      ?auto_35655 - PLACE
      ?auto_35659 - HOIST
      ?auto_35653 - SURFACE
      ?auto_35660 - SURFACE
      ?auto_35657 - PLACE
      ?auto_35662 - HOIST
      ?auto_35661 - SURFACE
      ?auto_35652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35658 ?auto_35663 ) ( IS-CRATE ?auto_35650 ) ( not ( = ?auto_35649 ?auto_35650 ) ) ( not ( = ?auto_35656 ?auto_35649 ) ) ( not ( = ?auto_35656 ?auto_35650 ) ) ( not ( = ?auto_35651 ?auto_35663 ) ) ( HOIST-AT ?auto_35664 ?auto_35651 ) ( not ( = ?auto_35658 ?auto_35664 ) ) ( AVAILABLE ?auto_35664 ) ( SURFACE-AT ?auto_35650 ?auto_35651 ) ( ON ?auto_35650 ?auto_35654 ) ( CLEAR ?auto_35650 ) ( not ( = ?auto_35649 ?auto_35654 ) ) ( not ( = ?auto_35650 ?auto_35654 ) ) ( not ( = ?auto_35656 ?auto_35654 ) ) ( IS-CRATE ?auto_35649 ) ( not ( = ?auto_35655 ?auto_35663 ) ) ( not ( = ?auto_35651 ?auto_35655 ) ) ( HOIST-AT ?auto_35659 ?auto_35655 ) ( not ( = ?auto_35658 ?auto_35659 ) ) ( not ( = ?auto_35664 ?auto_35659 ) ) ( AVAILABLE ?auto_35659 ) ( SURFACE-AT ?auto_35649 ?auto_35655 ) ( ON ?auto_35649 ?auto_35653 ) ( CLEAR ?auto_35649 ) ( not ( = ?auto_35649 ?auto_35653 ) ) ( not ( = ?auto_35650 ?auto_35653 ) ) ( not ( = ?auto_35656 ?auto_35653 ) ) ( not ( = ?auto_35654 ?auto_35653 ) ) ( SURFACE-AT ?auto_35660 ?auto_35663 ) ( CLEAR ?auto_35660 ) ( IS-CRATE ?auto_35656 ) ( not ( = ?auto_35660 ?auto_35656 ) ) ( not ( = ?auto_35649 ?auto_35660 ) ) ( not ( = ?auto_35650 ?auto_35660 ) ) ( not ( = ?auto_35654 ?auto_35660 ) ) ( not ( = ?auto_35653 ?auto_35660 ) ) ( AVAILABLE ?auto_35658 ) ( not ( = ?auto_35657 ?auto_35663 ) ) ( not ( = ?auto_35651 ?auto_35657 ) ) ( not ( = ?auto_35655 ?auto_35657 ) ) ( HOIST-AT ?auto_35662 ?auto_35657 ) ( not ( = ?auto_35658 ?auto_35662 ) ) ( not ( = ?auto_35664 ?auto_35662 ) ) ( not ( = ?auto_35659 ?auto_35662 ) ) ( AVAILABLE ?auto_35662 ) ( SURFACE-AT ?auto_35656 ?auto_35657 ) ( ON ?auto_35656 ?auto_35661 ) ( CLEAR ?auto_35656 ) ( not ( = ?auto_35649 ?auto_35661 ) ) ( not ( = ?auto_35650 ?auto_35661 ) ) ( not ( = ?auto_35656 ?auto_35661 ) ) ( not ( = ?auto_35654 ?auto_35661 ) ) ( not ( = ?auto_35653 ?auto_35661 ) ) ( not ( = ?auto_35660 ?auto_35661 ) ) ( TRUCK-AT ?auto_35652 ?auto_35663 ) )
    :subtasks
    ( ( !DRIVE ?auto_35652 ?auto_35663 ?auto_35657 )
      ( MAKE-2CRATE ?auto_35656 ?auto_35649 ?auto_35650 )
      ( MAKE-1CRATE-VERIFY ?auto_35649 ?auto_35650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35665 - SURFACE
      ?auto_35666 - SURFACE
      ?auto_35667 - SURFACE
    )
    :vars
    (
      ?auto_35672 - HOIST
      ?auto_35680 - PLACE
      ?auto_35670 - PLACE
      ?auto_35676 - HOIST
      ?auto_35671 - SURFACE
      ?auto_35678 - PLACE
      ?auto_35675 - HOIST
      ?auto_35669 - SURFACE
      ?auto_35677 - SURFACE
      ?auto_35679 - PLACE
      ?auto_35674 - HOIST
      ?auto_35673 - SURFACE
      ?auto_35668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35672 ?auto_35680 ) ( IS-CRATE ?auto_35667 ) ( not ( = ?auto_35666 ?auto_35667 ) ) ( not ( = ?auto_35665 ?auto_35666 ) ) ( not ( = ?auto_35665 ?auto_35667 ) ) ( not ( = ?auto_35670 ?auto_35680 ) ) ( HOIST-AT ?auto_35676 ?auto_35670 ) ( not ( = ?auto_35672 ?auto_35676 ) ) ( AVAILABLE ?auto_35676 ) ( SURFACE-AT ?auto_35667 ?auto_35670 ) ( ON ?auto_35667 ?auto_35671 ) ( CLEAR ?auto_35667 ) ( not ( = ?auto_35666 ?auto_35671 ) ) ( not ( = ?auto_35667 ?auto_35671 ) ) ( not ( = ?auto_35665 ?auto_35671 ) ) ( IS-CRATE ?auto_35666 ) ( not ( = ?auto_35678 ?auto_35680 ) ) ( not ( = ?auto_35670 ?auto_35678 ) ) ( HOIST-AT ?auto_35675 ?auto_35678 ) ( not ( = ?auto_35672 ?auto_35675 ) ) ( not ( = ?auto_35676 ?auto_35675 ) ) ( AVAILABLE ?auto_35675 ) ( SURFACE-AT ?auto_35666 ?auto_35678 ) ( ON ?auto_35666 ?auto_35669 ) ( CLEAR ?auto_35666 ) ( not ( = ?auto_35666 ?auto_35669 ) ) ( not ( = ?auto_35667 ?auto_35669 ) ) ( not ( = ?auto_35665 ?auto_35669 ) ) ( not ( = ?auto_35671 ?auto_35669 ) ) ( SURFACE-AT ?auto_35677 ?auto_35680 ) ( CLEAR ?auto_35677 ) ( IS-CRATE ?auto_35665 ) ( not ( = ?auto_35677 ?auto_35665 ) ) ( not ( = ?auto_35666 ?auto_35677 ) ) ( not ( = ?auto_35667 ?auto_35677 ) ) ( not ( = ?auto_35671 ?auto_35677 ) ) ( not ( = ?auto_35669 ?auto_35677 ) ) ( AVAILABLE ?auto_35672 ) ( not ( = ?auto_35679 ?auto_35680 ) ) ( not ( = ?auto_35670 ?auto_35679 ) ) ( not ( = ?auto_35678 ?auto_35679 ) ) ( HOIST-AT ?auto_35674 ?auto_35679 ) ( not ( = ?auto_35672 ?auto_35674 ) ) ( not ( = ?auto_35676 ?auto_35674 ) ) ( not ( = ?auto_35675 ?auto_35674 ) ) ( AVAILABLE ?auto_35674 ) ( SURFACE-AT ?auto_35665 ?auto_35679 ) ( ON ?auto_35665 ?auto_35673 ) ( CLEAR ?auto_35665 ) ( not ( = ?auto_35666 ?auto_35673 ) ) ( not ( = ?auto_35667 ?auto_35673 ) ) ( not ( = ?auto_35665 ?auto_35673 ) ) ( not ( = ?auto_35671 ?auto_35673 ) ) ( not ( = ?auto_35669 ?auto_35673 ) ) ( not ( = ?auto_35677 ?auto_35673 ) ) ( TRUCK-AT ?auto_35668 ?auto_35680 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35666 ?auto_35667 )
      ( MAKE-2CRATE-VERIFY ?auto_35665 ?auto_35666 ?auto_35667 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35681 - SURFACE
      ?auto_35682 - SURFACE
      ?auto_35683 - SURFACE
      ?auto_35684 - SURFACE
    )
    :vars
    (
      ?auto_35696 - HOIST
      ?auto_35685 - PLACE
      ?auto_35691 - PLACE
      ?auto_35689 - HOIST
      ?auto_35694 - SURFACE
      ?auto_35687 - PLACE
      ?auto_35688 - HOIST
      ?auto_35692 - SURFACE
      ?auto_35686 - PLACE
      ?auto_35693 - HOIST
      ?auto_35690 - SURFACE
      ?auto_35695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35696 ?auto_35685 ) ( IS-CRATE ?auto_35684 ) ( not ( = ?auto_35683 ?auto_35684 ) ) ( not ( = ?auto_35682 ?auto_35683 ) ) ( not ( = ?auto_35682 ?auto_35684 ) ) ( not ( = ?auto_35691 ?auto_35685 ) ) ( HOIST-AT ?auto_35689 ?auto_35691 ) ( not ( = ?auto_35696 ?auto_35689 ) ) ( AVAILABLE ?auto_35689 ) ( SURFACE-AT ?auto_35684 ?auto_35691 ) ( ON ?auto_35684 ?auto_35694 ) ( CLEAR ?auto_35684 ) ( not ( = ?auto_35683 ?auto_35694 ) ) ( not ( = ?auto_35684 ?auto_35694 ) ) ( not ( = ?auto_35682 ?auto_35694 ) ) ( IS-CRATE ?auto_35683 ) ( not ( = ?auto_35687 ?auto_35685 ) ) ( not ( = ?auto_35691 ?auto_35687 ) ) ( HOIST-AT ?auto_35688 ?auto_35687 ) ( not ( = ?auto_35696 ?auto_35688 ) ) ( not ( = ?auto_35689 ?auto_35688 ) ) ( AVAILABLE ?auto_35688 ) ( SURFACE-AT ?auto_35683 ?auto_35687 ) ( ON ?auto_35683 ?auto_35692 ) ( CLEAR ?auto_35683 ) ( not ( = ?auto_35683 ?auto_35692 ) ) ( not ( = ?auto_35684 ?auto_35692 ) ) ( not ( = ?auto_35682 ?auto_35692 ) ) ( not ( = ?auto_35694 ?auto_35692 ) ) ( SURFACE-AT ?auto_35681 ?auto_35685 ) ( CLEAR ?auto_35681 ) ( IS-CRATE ?auto_35682 ) ( not ( = ?auto_35681 ?auto_35682 ) ) ( not ( = ?auto_35683 ?auto_35681 ) ) ( not ( = ?auto_35684 ?auto_35681 ) ) ( not ( = ?auto_35694 ?auto_35681 ) ) ( not ( = ?auto_35692 ?auto_35681 ) ) ( AVAILABLE ?auto_35696 ) ( not ( = ?auto_35686 ?auto_35685 ) ) ( not ( = ?auto_35691 ?auto_35686 ) ) ( not ( = ?auto_35687 ?auto_35686 ) ) ( HOIST-AT ?auto_35693 ?auto_35686 ) ( not ( = ?auto_35696 ?auto_35693 ) ) ( not ( = ?auto_35689 ?auto_35693 ) ) ( not ( = ?auto_35688 ?auto_35693 ) ) ( AVAILABLE ?auto_35693 ) ( SURFACE-AT ?auto_35682 ?auto_35686 ) ( ON ?auto_35682 ?auto_35690 ) ( CLEAR ?auto_35682 ) ( not ( = ?auto_35683 ?auto_35690 ) ) ( not ( = ?auto_35684 ?auto_35690 ) ) ( not ( = ?auto_35682 ?auto_35690 ) ) ( not ( = ?auto_35694 ?auto_35690 ) ) ( not ( = ?auto_35692 ?auto_35690 ) ) ( not ( = ?auto_35681 ?auto_35690 ) ) ( TRUCK-AT ?auto_35695 ?auto_35685 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35682 ?auto_35683 ?auto_35684 )
      ( MAKE-3CRATE-VERIFY ?auto_35681 ?auto_35682 ?auto_35683 ?auto_35684 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35697 - SURFACE
      ?auto_35698 - SURFACE
      ?auto_35699 - SURFACE
      ?auto_35700 - SURFACE
      ?auto_35701 - SURFACE
    )
    :vars
    (
      ?auto_35713 - HOIST
      ?auto_35702 - PLACE
      ?auto_35708 - PLACE
      ?auto_35706 - HOIST
      ?auto_35711 - SURFACE
      ?auto_35704 - PLACE
      ?auto_35705 - HOIST
      ?auto_35709 - SURFACE
      ?auto_35703 - PLACE
      ?auto_35710 - HOIST
      ?auto_35707 - SURFACE
      ?auto_35712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35713 ?auto_35702 ) ( IS-CRATE ?auto_35701 ) ( not ( = ?auto_35700 ?auto_35701 ) ) ( not ( = ?auto_35699 ?auto_35700 ) ) ( not ( = ?auto_35699 ?auto_35701 ) ) ( not ( = ?auto_35708 ?auto_35702 ) ) ( HOIST-AT ?auto_35706 ?auto_35708 ) ( not ( = ?auto_35713 ?auto_35706 ) ) ( AVAILABLE ?auto_35706 ) ( SURFACE-AT ?auto_35701 ?auto_35708 ) ( ON ?auto_35701 ?auto_35711 ) ( CLEAR ?auto_35701 ) ( not ( = ?auto_35700 ?auto_35711 ) ) ( not ( = ?auto_35701 ?auto_35711 ) ) ( not ( = ?auto_35699 ?auto_35711 ) ) ( IS-CRATE ?auto_35700 ) ( not ( = ?auto_35704 ?auto_35702 ) ) ( not ( = ?auto_35708 ?auto_35704 ) ) ( HOIST-AT ?auto_35705 ?auto_35704 ) ( not ( = ?auto_35713 ?auto_35705 ) ) ( not ( = ?auto_35706 ?auto_35705 ) ) ( AVAILABLE ?auto_35705 ) ( SURFACE-AT ?auto_35700 ?auto_35704 ) ( ON ?auto_35700 ?auto_35709 ) ( CLEAR ?auto_35700 ) ( not ( = ?auto_35700 ?auto_35709 ) ) ( not ( = ?auto_35701 ?auto_35709 ) ) ( not ( = ?auto_35699 ?auto_35709 ) ) ( not ( = ?auto_35711 ?auto_35709 ) ) ( SURFACE-AT ?auto_35698 ?auto_35702 ) ( CLEAR ?auto_35698 ) ( IS-CRATE ?auto_35699 ) ( not ( = ?auto_35698 ?auto_35699 ) ) ( not ( = ?auto_35700 ?auto_35698 ) ) ( not ( = ?auto_35701 ?auto_35698 ) ) ( not ( = ?auto_35711 ?auto_35698 ) ) ( not ( = ?auto_35709 ?auto_35698 ) ) ( AVAILABLE ?auto_35713 ) ( not ( = ?auto_35703 ?auto_35702 ) ) ( not ( = ?auto_35708 ?auto_35703 ) ) ( not ( = ?auto_35704 ?auto_35703 ) ) ( HOIST-AT ?auto_35710 ?auto_35703 ) ( not ( = ?auto_35713 ?auto_35710 ) ) ( not ( = ?auto_35706 ?auto_35710 ) ) ( not ( = ?auto_35705 ?auto_35710 ) ) ( AVAILABLE ?auto_35710 ) ( SURFACE-AT ?auto_35699 ?auto_35703 ) ( ON ?auto_35699 ?auto_35707 ) ( CLEAR ?auto_35699 ) ( not ( = ?auto_35700 ?auto_35707 ) ) ( not ( = ?auto_35701 ?auto_35707 ) ) ( not ( = ?auto_35699 ?auto_35707 ) ) ( not ( = ?auto_35711 ?auto_35707 ) ) ( not ( = ?auto_35709 ?auto_35707 ) ) ( not ( = ?auto_35698 ?auto_35707 ) ) ( TRUCK-AT ?auto_35712 ?auto_35702 ) ( ON ?auto_35698 ?auto_35697 ) ( not ( = ?auto_35697 ?auto_35698 ) ) ( not ( = ?auto_35697 ?auto_35699 ) ) ( not ( = ?auto_35697 ?auto_35700 ) ) ( not ( = ?auto_35697 ?auto_35701 ) ) ( not ( = ?auto_35697 ?auto_35711 ) ) ( not ( = ?auto_35697 ?auto_35709 ) ) ( not ( = ?auto_35697 ?auto_35707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35699 ?auto_35700 ?auto_35701 )
      ( MAKE-4CRATE-VERIFY ?auto_35697 ?auto_35698 ?auto_35699 ?auto_35700 ?auto_35701 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35714 - SURFACE
      ?auto_35715 - SURFACE
      ?auto_35716 - SURFACE
      ?auto_35717 - SURFACE
      ?auto_35718 - SURFACE
      ?auto_35719 - SURFACE
    )
    :vars
    (
      ?auto_35731 - HOIST
      ?auto_35720 - PLACE
      ?auto_35726 - PLACE
      ?auto_35724 - HOIST
      ?auto_35729 - SURFACE
      ?auto_35722 - PLACE
      ?auto_35723 - HOIST
      ?auto_35727 - SURFACE
      ?auto_35721 - PLACE
      ?auto_35728 - HOIST
      ?auto_35725 - SURFACE
      ?auto_35730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35731 ?auto_35720 ) ( IS-CRATE ?auto_35719 ) ( not ( = ?auto_35718 ?auto_35719 ) ) ( not ( = ?auto_35717 ?auto_35718 ) ) ( not ( = ?auto_35717 ?auto_35719 ) ) ( not ( = ?auto_35726 ?auto_35720 ) ) ( HOIST-AT ?auto_35724 ?auto_35726 ) ( not ( = ?auto_35731 ?auto_35724 ) ) ( AVAILABLE ?auto_35724 ) ( SURFACE-AT ?auto_35719 ?auto_35726 ) ( ON ?auto_35719 ?auto_35729 ) ( CLEAR ?auto_35719 ) ( not ( = ?auto_35718 ?auto_35729 ) ) ( not ( = ?auto_35719 ?auto_35729 ) ) ( not ( = ?auto_35717 ?auto_35729 ) ) ( IS-CRATE ?auto_35718 ) ( not ( = ?auto_35722 ?auto_35720 ) ) ( not ( = ?auto_35726 ?auto_35722 ) ) ( HOIST-AT ?auto_35723 ?auto_35722 ) ( not ( = ?auto_35731 ?auto_35723 ) ) ( not ( = ?auto_35724 ?auto_35723 ) ) ( AVAILABLE ?auto_35723 ) ( SURFACE-AT ?auto_35718 ?auto_35722 ) ( ON ?auto_35718 ?auto_35727 ) ( CLEAR ?auto_35718 ) ( not ( = ?auto_35718 ?auto_35727 ) ) ( not ( = ?auto_35719 ?auto_35727 ) ) ( not ( = ?auto_35717 ?auto_35727 ) ) ( not ( = ?auto_35729 ?auto_35727 ) ) ( SURFACE-AT ?auto_35716 ?auto_35720 ) ( CLEAR ?auto_35716 ) ( IS-CRATE ?auto_35717 ) ( not ( = ?auto_35716 ?auto_35717 ) ) ( not ( = ?auto_35718 ?auto_35716 ) ) ( not ( = ?auto_35719 ?auto_35716 ) ) ( not ( = ?auto_35729 ?auto_35716 ) ) ( not ( = ?auto_35727 ?auto_35716 ) ) ( AVAILABLE ?auto_35731 ) ( not ( = ?auto_35721 ?auto_35720 ) ) ( not ( = ?auto_35726 ?auto_35721 ) ) ( not ( = ?auto_35722 ?auto_35721 ) ) ( HOIST-AT ?auto_35728 ?auto_35721 ) ( not ( = ?auto_35731 ?auto_35728 ) ) ( not ( = ?auto_35724 ?auto_35728 ) ) ( not ( = ?auto_35723 ?auto_35728 ) ) ( AVAILABLE ?auto_35728 ) ( SURFACE-AT ?auto_35717 ?auto_35721 ) ( ON ?auto_35717 ?auto_35725 ) ( CLEAR ?auto_35717 ) ( not ( = ?auto_35718 ?auto_35725 ) ) ( not ( = ?auto_35719 ?auto_35725 ) ) ( not ( = ?auto_35717 ?auto_35725 ) ) ( not ( = ?auto_35729 ?auto_35725 ) ) ( not ( = ?auto_35727 ?auto_35725 ) ) ( not ( = ?auto_35716 ?auto_35725 ) ) ( TRUCK-AT ?auto_35730 ?auto_35720 ) ( ON ?auto_35715 ?auto_35714 ) ( ON ?auto_35716 ?auto_35715 ) ( not ( = ?auto_35714 ?auto_35715 ) ) ( not ( = ?auto_35714 ?auto_35716 ) ) ( not ( = ?auto_35714 ?auto_35717 ) ) ( not ( = ?auto_35714 ?auto_35718 ) ) ( not ( = ?auto_35714 ?auto_35719 ) ) ( not ( = ?auto_35714 ?auto_35729 ) ) ( not ( = ?auto_35714 ?auto_35727 ) ) ( not ( = ?auto_35714 ?auto_35725 ) ) ( not ( = ?auto_35715 ?auto_35716 ) ) ( not ( = ?auto_35715 ?auto_35717 ) ) ( not ( = ?auto_35715 ?auto_35718 ) ) ( not ( = ?auto_35715 ?auto_35719 ) ) ( not ( = ?auto_35715 ?auto_35729 ) ) ( not ( = ?auto_35715 ?auto_35727 ) ) ( not ( = ?auto_35715 ?auto_35725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35717 ?auto_35718 ?auto_35719 )
      ( MAKE-5CRATE-VERIFY ?auto_35714 ?auto_35715 ?auto_35716 ?auto_35717 ?auto_35718 ?auto_35719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35732 - SURFACE
      ?auto_35733 - SURFACE
    )
    :vars
    (
      ?auto_35746 - HOIST
      ?auto_35734 - PLACE
      ?auto_35747 - SURFACE
      ?auto_35740 - PLACE
      ?auto_35738 - HOIST
      ?auto_35744 - SURFACE
      ?auto_35736 - PLACE
      ?auto_35737 - HOIST
      ?auto_35741 - SURFACE
      ?auto_35742 - SURFACE
      ?auto_35735 - PLACE
      ?auto_35743 - HOIST
      ?auto_35739 - SURFACE
      ?auto_35745 - TRUCK
      ?auto_35748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35746 ?auto_35734 ) ( IS-CRATE ?auto_35733 ) ( not ( = ?auto_35732 ?auto_35733 ) ) ( not ( = ?auto_35747 ?auto_35732 ) ) ( not ( = ?auto_35747 ?auto_35733 ) ) ( not ( = ?auto_35740 ?auto_35734 ) ) ( HOIST-AT ?auto_35738 ?auto_35740 ) ( not ( = ?auto_35746 ?auto_35738 ) ) ( AVAILABLE ?auto_35738 ) ( SURFACE-AT ?auto_35733 ?auto_35740 ) ( ON ?auto_35733 ?auto_35744 ) ( CLEAR ?auto_35733 ) ( not ( = ?auto_35732 ?auto_35744 ) ) ( not ( = ?auto_35733 ?auto_35744 ) ) ( not ( = ?auto_35747 ?auto_35744 ) ) ( IS-CRATE ?auto_35732 ) ( not ( = ?auto_35736 ?auto_35734 ) ) ( not ( = ?auto_35740 ?auto_35736 ) ) ( HOIST-AT ?auto_35737 ?auto_35736 ) ( not ( = ?auto_35746 ?auto_35737 ) ) ( not ( = ?auto_35738 ?auto_35737 ) ) ( AVAILABLE ?auto_35737 ) ( SURFACE-AT ?auto_35732 ?auto_35736 ) ( ON ?auto_35732 ?auto_35741 ) ( CLEAR ?auto_35732 ) ( not ( = ?auto_35732 ?auto_35741 ) ) ( not ( = ?auto_35733 ?auto_35741 ) ) ( not ( = ?auto_35747 ?auto_35741 ) ) ( not ( = ?auto_35744 ?auto_35741 ) ) ( IS-CRATE ?auto_35747 ) ( not ( = ?auto_35742 ?auto_35747 ) ) ( not ( = ?auto_35732 ?auto_35742 ) ) ( not ( = ?auto_35733 ?auto_35742 ) ) ( not ( = ?auto_35744 ?auto_35742 ) ) ( not ( = ?auto_35741 ?auto_35742 ) ) ( not ( = ?auto_35735 ?auto_35734 ) ) ( not ( = ?auto_35740 ?auto_35735 ) ) ( not ( = ?auto_35736 ?auto_35735 ) ) ( HOIST-AT ?auto_35743 ?auto_35735 ) ( not ( = ?auto_35746 ?auto_35743 ) ) ( not ( = ?auto_35738 ?auto_35743 ) ) ( not ( = ?auto_35737 ?auto_35743 ) ) ( AVAILABLE ?auto_35743 ) ( SURFACE-AT ?auto_35747 ?auto_35735 ) ( ON ?auto_35747 ?auto_35739 ) ( CLEAR ?auto_35747 ) ( not ( = ?auto_35732 ?auto_35739 ) ) ( not ( = ?auto_35733 ?auto_35739 ) ) ( not ( = ?auto_35747 ?auto_35739 ) ) ( not ( = ?auto_35744 ?auto_35739 ) ) ( not ( = ?auto_35741 ?auto_35739 ) ) ( not ( = ?auto_35742 ?auto_35739 ) ) ( TRUCK-AT ?auto_35745 ?auto_35734 ) ( SURFACE-AT ?auto_35748 ?auto_35734 ) ( CLEAR ?auto_35748 ) ( LIFTING ?auto_35746 ?auto_35742 ) ( IS-CRATE ?auto_35742 ) ( not ( = ?auto_35748 ?auto_35742 ) ) ( not ( = ?auto_35732 ?auto_35748 ) ) ( not ( = ?auto_35733 ?auto_35748 ) ) ( not ( = ?auto_35747 ?auto_35748 ) ) ( not ( = ?auto_35744 ?auto_35748 ) ) ( not ( = ?auto_35741 ?auto_35748 ) ) ( not ( = ?auto_35739 ?auto_35748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35748 ?auto_35742 )
      ( MAKE-2CRATE ?auto_35747 ?auto_35732 ?auto_35733 )
      ( MAKE-1CRATE-VERIFY ?auto_35732 ?auto_35733 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35749 - SURFACE
      ?auto_35750 - SURFACE
      ?auto_35751 - SURFACE
    )
    :vars
    (
      ?auto_35764 - HOIST
      ?auto_35757 - PLACE
      ?auto_35761 - PLACE
      ?auto_35752 - HOIST
      ?auto_35759 - SURFACE
      ?auto_35756 - PLACE
      ?auto_35760 - HOIST
      ?auto_35763 - SURFACE
      ?auto_35762 - SURFACE
      ?auto_35758 - PLACE
      ?auto_35765 - HOIST
      ?auto_35754 - SURFACE
      ?auto_35755 - TRUCK
      ?auto_35753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35764 ?auto_35757 ) ( IS-CRATE ?auto_35751 ) ( not ( = ?auto_35750 ?auto_35751 ) ) ( not ( = ?auto_35749 ?auto_35750 ) ) ( not ( = ?auto_35749 ?auto_35751 ) ) ( not ( = ?auto_35761 ?auto_35757 ) ) ( HOIST-AT ?auto_35752 ?auto_35761 ) ( not ( = ?auto_35764 ?auto_35752 ) ) ( AVAILABLE ?auto_35752 ) ( SURFACE-AT ?auto_35751 ?auto_35761 ) ( ON ?auto_35751 ?auto_35759 ) ( CLEAR ?auto_35751 ) ( not ( = ?auto_35750 ?auto_35759 ) ) ( not ( = ?auto_35751 ?auto_35759 ) ) ( not ( = ?auto_35749 ?auto_35759 ) ) ( IS-CRATE ?auto_35750 ) ( not ( = ?auto_35756 ?auto_35757 ) ) ( not ( = ?auto_35761 ?auto_35756 ) ) ( HOIST-AT ?auto_35760 ?auto_35756 ) ( not ( = ?auto_35764 ?auto_35760 ) ) ( not ( = ?auto_35752 ?auto_35760 ) ) ( AVAILABLE ?auto_35760 ) ( SURFACE-AT ?auto_35750 ?auto_35756 ) ( ON ?auto_35750 ?auto_35763 ) ( CLEAR ?auto_35750 ) ( not ( = ?auto_35750 ?auto_35763 ) ) ( not ( = ?auto_35751 ?auto_35763 ) ) ( not ( = ?auto_35749 ?auto_35763 ) ) ( not ( = ?auto_35759 ?auto_35763 ) ) ( IS-CRATE ?auto_35749 ) ( not ( = ?auto_35762 ?auto_35749 ) ) ( not ( = ?auto_35750 ?auto_35762 ) ) ( not ( = ?auto_35751 ?auto_35762 ) ) ( not ( = ?auto_35759 ?auto_35762 ) ) ( not ( = ?auto_35763 ?auto_35762 ) ) ( not ( = ?auto_35758 ?auto_35757 ) ) ( not ( = ?auto_35761 ?auto_35758 ) ) ( not ( = ?auto_35756 ?auto_35758 ) ) ( HOIST-AT ?auto_35765 ?auto_35758 ) ( not ( = ?auto_35764 ?auto_35765 ) ) ( not ( = ?auto_35752 ?auto_35765 ) ) ( not ( = ?auto_35760 ?auto_35765 ) ) ( AVAILABLE ?auto_35765 ) ( SURFACE-AT ?auto_35749 ?auto_35758 ) ( ON ?auto_35749 ?auto_35754 ) ( CLEAR ?auto_35749 ) ( not ( = ?auto_35750 ?auto_35754 ) ) ( not ( = ?auto_35751 ?auto_35754 ) ) ( not ( = ?auto_35749 ?auto_35754 ) ) ( not ( = ?auto_35759 ?auto_35754 ) ) ( not ( = ?auto_35763 ?auto_35754 ) ) ( not ( = ?auto_35762 ?auto_35754 ) ) ( TRUCK-AT ?auto_35755 ?auto_35757 ) ( SURFACE-AT ?auto_35753 ?auto_35757 ) ( CLEAR ?auto_35753 ) ( LIFTING ?auto_35764 ?auto_35762 ) ( IS-CRATE ?auto_35762 ) ( not ( = ?auto_35753 ?auto_35762 ) ) ( not ( = ?auto_35750 ?auto_35753 ) ) ( not ( = ?auto_35751 ?auto_35753 ) ) ( not ( = ?auto_35749 ?auto_35753 ) ) ( not ( = ?auto_35759 ?auto_35753 ) ) ( not ( = ?auto_35763 ?auto_35753 ) ) ( not ( = ?auto_35754 ?auto_35753 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35750 ?auto_35751 )
      ( MAKE-2CRATE-VERIFY ?auto_35749 ?auto_35750 ?auto_35751 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35766 - SURFACE
      ?auto_35767 - SURFACE
      ?auto_35768 - SURFACE
      ?auto_35769 - SURFACE
    )
    :vars
    (
      ?auto_35771 - HOIST
      ?auto_35772 - PLACE
      ?auto_35782 - PLACE
      ?auto_35774 - HOIST
      ?auto_35770 - SURFACE
      ?auto_35777 - PLACE
      ?auto_35778 - HOIST
      ?auto_35780 - SURFACE
      ?auto_35775 - PLACE
      ?auto_35781 - HOIST
      ?auto_35773 - SURFACE
      ?auto_35779 - TRUCK
      ?auto_35776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35771 ?auto_35772 ) ( IS-CRATE ?auto_35769 ) ( not ( = ?auto_35768 ?auto_35769 ) ) ( not ( = ?auto_35767 ?auto_35768 ) ) ( not ( = ?auto_35767 ?auto_35769 ) ) ( not ( = ?auto_35782 ?auto_35772 ) ) ( HOIST-AT ?auto_35774 ?auto_35782 ) ( not ( = ?auto_35771 ?auto_35774 ) ) ( AVAILABLE ?auto_35774 ) ( SURFACE-AT ?auto_35769 ?auto_35782 ) ( ON ?auto_35769 ?auto_35770 ) ( CLEAR ?auto_35769 ) ( not ( = ?auto_35768 ?auto_35770 ) ) ( not ( = ?auto_35769 ?auto_35770 ) ) ( not ( = ?auto_35767 ?auto_35770 ) ) ( IS-CRATE ?auto_35768 ) ( not ( = ?auto_35777 ?auto_35772 ) ) ( not ( = ?auto_35782 ?auto_35777 ) ) ( HOIST-AT ?auto_35778 ?auto_35777 ) ( not ( = ?auto_35771 ?auto_35778 ) ) ( not ( = ?auto_35774 ?auto_35778 ) ) ( AVAILABLE ?auto_35778 ) ( SURFACE-AT ?auto_35768 ?auto_35777 ) ( ON ?auto_35768 ?auto_35780 ) ( CLEAR ?auto_35768 ) ( not ( = ?auto_35768 ?auto_35780 ) ) ( not ( = ?auto_35769 ?auto_35780 ) ) ( not ( = ?auto_35767 ?auto_35780 ) ) ( not ( = ?auto_35770 ?auto_35780 ) ) ( IS-CRATE ?auto_35767 ) ( not ( = ?auto_35766 ?auto_35767 ) ) ( not ( = ?auto_35768 ?auto_35766 ) ) ( not ( = ?auto_35769 ?auto_35766 ) ) ( not ( = ?auto_35770 ?auto_35766 ) ) ( not ( = ?auto_35780 ?auto_35766 ) ) ( not ( = ?auto_35775 ?auto_35772 ) ) ( not ( = ?auto_35782 ?auto_35775 ) ) ( not ( = ?auto_35777 ?auto_35775 ) ) ( HOIST-AT ?auto_35781 ?auto_35775 ) ( not ( = ?auto_35771 ?auto_35781 ) ) ( not ( = ?auto_35774 ?auto_35781 ) ) ( not ( = ?auto_35778 ?auto_35781 ) ) ( AVAILABLE ?auto_35781 ) ( SURFACE-AT ?auto_35767 ?auto_35775 ) ( ON ?auto_35767 ?auto_35773 ) ( CLEAR ?auto_35767 ) ( not ( = ?auto_35768 ?auto_35773 ) ) ( not ( = ?auto_35769 ?auto_35773 ) ) ( not ( = ?auto_35767 ?auto_35773 ) ) ( not ( = ?auto_35770 ?auto_35773 ) ) ( not ( = ?auto_35780 ?auto_35773 ) ) ( not ( = ?auto_35766 ?auto_35773 ) ) ( TRUCK-AT ?auto_35779 ?auto_35772 ) ( SURFACE-AT ?auto_35776 ?auto_35772 ) ( CLEAR ?auto_35776 ) ( LIFTING ?auto_35771 ?auto_35766 ) ( IS-CRATE ?auto_35766 ) ( not ( = ?auto_35776 ?auto_35766 ) ) ( not ( = ?auto_35768 ?auto_35776 ) ) ( not ( = ?auto_35769 ?auto_35776 ) ) ( not ( = ?auto_35767 ?auto_35776 ) ) ( not ( = ?auto_35770 ?auto_35776 ) ) ( not ( = ?auto_35780 ?auto_35776 ) ) ( not ( = ?auto_35773 ?auto_35776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35767 ?auto_35768 ?auto_35769 )
      ( MAKE-3CRATE-VERIFY ?auto_35766 ?auto_35767 ?auto_35768 ?auto_35769 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35783 - SURFACE
      ?auto_35784 - SURFACE
      ?auto_35785 - SURFACE
      ?auto_35786 - SURFACE
      ?auto_35787 - SURFACE
    )
    :vars
    (
      ?auto_35789 - HOIST
      ?auto_35790 - PLACE
      ?auto_35799 - PLACE
      ?auto_35792 - HOIST
      ?auto_35788 - SURFACE
      ?auto_35794 - PLACE
      ?auto_35795 - HOIST
      ?auto_35797 - SURFACE
      ?auto_35793 - PLACE
      ?auto_35798 - HOIST
      ?auto_35791 - SURFACE
      ?auto_35796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35789 ?auto_35790 ) ( IS-CRATE ?auto_35787 ) ( not ( = ?auto_35786 ?auto_35787 ) ) ( not ( = ?auto_35785 ?auto_35786 ) ) ( not ( = ?auto_35785 ?auto_35787 ) ) ( not ( = ?auto_35799 ?auto_35790 ) ) ( HOIST-AT ?auto_35792 ?auto_35799 ) ( not ( = ?auto_35789 ?auto_35792 ) ) ( AVAILABLE ?auto_35792 ) ( SURFACE-AT ?auto_35787 ?auto_35799 ) ( ON ?auto_35787 ?auto_35788 ) ( CLEAR ?auto_35787 ) ( not ( = ?auto_35786 ?auto_35788 ) ) ( not ( = ?auto_35787 ?auto_35788 ) ) ( not ( = ?auto_35785 ?auto_35788 ) ) ( IS-CRATE ?auto_35786 ) ( not ( = ?auto_35794 ?auto_35790 ) ) ( not ( = ?auto_35799 ?auto_35794 ) ) ( HOIST-AT ?auto_35795 ?auto_35794 ) ( not ( = ?auto_35789 ?auto_35795 ) ) ( not ( = ?auto_35792 ?auto_35795 ) ) ( AVAILABLE ?auto_35795 ) ( SURFACE-AT ?auto_35786 ?auto_35794 ) ( ON ?auto_35786 ?auto_35797 ) ( CLEAR ?auto_35786 ) ( not ( = ?auto_35786 ?auto_35797 ) ) ( not ( = ?auto_35787 ?auto_35797 ) ) ( not ( = ?auto_35785 ?auto_35797 ) ) ( not ( = ?auto_35788 ?auto_35797 ) ) ( IS-CRATE ?auto_35785 ) ( not ( = ?auto_35784 ?auto_35785 ) ) ( not ( = ?auto_35786 ?auto_35784 ) ) ( not ( = ?auto_35787 ?auto_35784 ) ) ( not ( = ?auto_35788 ?auto_35784 ) ) ( not ( = ?auto_35797 ?auto_35784 ) ) ( not ( = ?auto_35793 ?auto_35790 ) ) ( not ( = ?auto_35799 ?auto_35793 ) ) ( not ( = ?auto_35794 ?auto_35793 ) ) ( HOIST-AT ?auto_35798 ?auto_35793 ) ( not ( = ?auto_35789 ?auto_35798 ) ) ( not ( = ?auto_35792 ?auto_35798 ) ) ( not ( = ?auto_35795 ?auto_35798 ) ) ( AVAILABLE ?auto_35798 ) ( SURFACE-AT ?auto_35785 ?auto_35793 ) ( ON ?auto_35785 ?auto_35791 ) ( CLEAR ?auto_35785 ) ( not ( = ?auto_35786 ?auto_35791 ) ) ( not ( = ?auto_35787 ?auto_35791 ) ) ( not ( = ?auto_35785 ?auto_35791 ) ) ( not ( = ?auto_35788 ?auto_35791 ) ) ( not ( = ?auto_35797 ?auto_35791 ) ) ( not ( = ?auto_35784 ?auto_35791 ) ) ( TRUCK-AT ?auto_35796 ?auto_35790 ) ( SURFACE-AT ?auto_35783 ?auto_35790 ) ( CLEAR ?auto_35783 ) ( LIFTING ?auto_35789 ?auto_35784 ) ( IS-CRATE ?auto_35784 ) ( not ( = ?auto_35783 ?auto_35784 ) ) ( not ( = ?auto_35786 ?auto_35783 ) ) ( not ( = ?auto_35787 ?auto_35783 ) ) ( not ( = ?auto_35785 ?auto_35783 ) ) ( not ( = ?auto_35788 ?auto_35783 ) ) ( not ( = ?auto_35797 ?auto_35783 ) ) ( not ( = ?auto_35791 ?auto_35783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35785 ?auto_35786 ?auto_35787 )
      ( MAKE-4CRATE-VERIFY ?auto_35783 ?auto_35784 ?auto_35785 ?auto_35786 ?auto_35787 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35800 - SURFACE
      ?auto_35801 - SURFACE
      ?auto_35802 - SURFACE
      ?auto_35803 - SURFACE
      ?auto_35804 - SURFACE
      ?auto_35805 - SURFACE
    )
    :vars
    (
      ?auto_35807 - HOIST
      ?auto_35808 - PLACE
      ?auto_35817 - PLACE
      ?auto_35810 - HOIST
      ?auto_35806 - SURFACE
      ?auto_35812 - PLACE
      ?auto_35813 - HOIST
      ?auto_35815 - SURFACE
      ?auto_35811 - PLACE
      ?auto_35816 - HOIST
      ?auto_35809 - SURFACE
      ?auto_35814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35807 ?auto_35808 ) ( IS-CRATE ?auto_35805 ) ( not ( = ?auto_35804 ?auto_35805 ) ) ( not ( = ?auto_35803 ?auto_35804 ) ) ( not ( = ?auto_35803 ?auto_35805 ) ) ( not ( = ?auto_35817 ?auto_35808 ) ) ( HOIST-AT ?auto_35810 ?auto_35817 ) ( not ( = ?auto_35807 ?auto_35810 ) ) ( AVAILABLE ?auto_35810 ) ( SURFACE-AT ?auto_35805 ?auto_35817 ) ( ON ?auto_35805 ?auto_35806 ) ( CLEAR ?auto_35805 ) ( not ( = ?auto_35804 ?auto_35806 ) ) ( not ( = ?auto_35805 ?auto_35806 ) ) ( not ( = ?auto_35803 ?auto_35806 ) ) ( IS-CRATE ?auto_35804 ) ( not ( = ?auto_35812 ?auto_35808 ) ) ( not ( = ?auto_35817 ?auto_35812 ) ) ( HOIST-AT ?auto_35813 ?auto_35812 ) ( not ( = ?auto_35807 ?auto_35813 ) ) ( not ( = ?auto_35810 ?auto_35813 ) ) ( AVAILABLE ?auto_35813 ) ( SURFACE-AT ?auto_35804 ?auto_35812 ) ( ON ?auto_35804 ?auto_35815 ) ( CLEAR ?auto_35804 ) ( not ( = ?auto_35804 ?auto_35815 ) ) ( not ( = ?auto_35805 ?auto_35815 ) ) ( not ( = ?auto_35803 ?auto_35815 ) ) ( not ( = ?auto_35806 ?auto_35815 ) ) ( IS-CRATE ?auto_35803 ) ( not ( = ?auto_35802 ?auto_35803 ) ) ( not ( = ?auto_35804 ?auto_35802 ) ) ( not ( = ?auto_35805 ?auto_35802 ) ) ( not ( = ?auto_35806 ?auto_35802 ) ) ( not ( = ?auto_35815 ?auto_35802 ) ) ( not ( = ?auto_35811 ?auto_35808 ) ) ( not ( = ?auto_35817 ?auto_35811 ) ) ( not ( = ?auto_35812 ?auto_35811 ) ) ( HOIST-AT ?auto_35816 ?auto_35811 ) ( not ( = ?auto_35807 ?auto_35816 ) ) ( not ( = ?auto_35810 ?auto_35816 ) ) ( not ( = ?auto_35813 ?auto_35816 ) ) ( AVAILABLE ?auto_35816 ) ( SURFACE-AT ?auto_35803 ?auto_35811 ) ( ON ?auto_35803 ?auto_35809 ) ( CLEAR ?auto_35803 ) ( not ( = ?auto_35804 ?auto_35809 ) ) ( not ( = ?auto_35805 ?auto_35809 ) ) ( not ( = ?auto_35803 ?auto_35809 ) ) ( not ( = ?auto_35806 ?auto_35809 ) ) ( not ( = ?auto_35815 ?auto_35809 ) ) ( not ( = ?auto_35802 ?auto_35809 ) ) ( TRUCK-AT ?auto_35814 ?auto_35808 ) ( SURFACE-AT ?auto_35801 ?auto_35808 ) ( CLEAR ?auto_35801 ) ( LIFTING ?auto_35807 ?auto_35802 ) ( IS-CRATE ?auto_35802 ) ( not ( = ?auto_35801 ?auto_35802 ) ) ( not ( = ?auto_35804 ?auto_35801 ) ) ( not ( = ?auto_35805 ?auto_35801 ) ) ( not ( = ?auto_35803 ?auto_35801 ) ) ( not ( = ?auto_35806 ?auto_35801 ) ) ( not ( = ?auto_35815 ?auto_35801 ) ) ( not ( = ?auto_35809 ?auto_35801 ) ) ( ON ?auto_35801 ?auto_35800 ) ( not ( = ?auto_35800 ?auto_35801 ) ) ( not ( = ?auto_35800 ?auto_35802 ) ) ( not ( = ?auto_35800 ?auto_35803 ) ) ( not ( = ?auto_35800 ?auto_35804 ) ) ( not ( = ?auto_35800 ?auto_35805 ) ) ( not ( = ?auto_35800 ?auto_35806 ) ) ( not ( = ?auto_35800 ?auto_35815 ) ) ( not ( = ?auto_35800 ?auto_35809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35803 ?auto_35804 ?auto_35805 )
      ( MAKE-5CRATE-VERIFY ?auto_35800 ?auto_35801 ?auto_35802 ?auto_35803 ?auto_35804 ?auto_35805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35818 - SURFACE
      ?auto_35819 - SURFACE
    )
    :vars
    (
      ?auto_35821 - HOIST
      ?auto_35822 - PLACE
      ?auto_35834 - SURFACE
      ?auto_35833 - PLACE
      ?auto_35824 - HOIST
      ?auto_35820 - SURFACE
      ?auto_35827 - PLACE
      ?auto_35828 - HOIST
      ?auto_35830 - SURFACE
      ?auto_35832 - SURFACE
      ?auto_35825 - PLACE
      ?auto_35831 - HOIST
      ?auto_35823 - SURFACE
      ?auto_35829 - TRUCK
      ?auto_35826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35821 ?auto_35822 ) ( IS-CRATE ?auto_35819 ) ( not ( = ?auto_35818 ?auto_35819 ) ) ( not ( = ?auto_35834 ?auto_35818 ) ) ( not ( = ?auto_35834 ?auto_35819 ) ) ( not ( = ?auto_35833 ?auto_35822 ) ) ( HOIST-AT ?auto_35824 ?auto_35833 ) ( not ( = ?auto_35821 ?auto_35824 ) ) ( AVAILABLE ?auto_35824 ) ( SURFACE-AT ?auto_35819 ?auto_35833 ) ( ON ?auto_35819 ?auto_35820 ) ( CLEAR ?auto_35819 ) ( not ( = ?auto_35818 ?auto_35820 ) ) ( not ( = ?auto_35819 ?auto_35820 ) ) ( not ( = ?auto_35834 ?auto_35820 ) ) ( IS-CRATE ?auto_35818 ) ( not ( = ?auto_35827 ?auto_35822 ) ) ( not ( = ?auto_35833 ?auto_35827 ) ) ( HOIST-AT ?auto_35828 ?auto_35827 ) ( not ( = ?auto_35821 ?auto_35828 ) ) ( not ( = ?auto_35824 ?auto_35828 ) ) ( AVAILABLE ?auto_35828 ) ( SURFACE-AT ?auto_35818 ?auto_35827 ) ( ON ?auto_35818 ?auto_35830 ) ( CLEAR ?auto_35818 ) ( not ( = ?auto_35818 ?auto_35830 ) ) ( not ( = ?auto_35819 ?auto_35830 ) ) ( not ( = ?auto_35834 ?auto_35830 ) ) ( not ( = ?auto_35820 ?auto_35830 ) ) ( IS-CRATE ?auto_35834 ) ( not ( = ?auto_35832 ?auto_35834 ) ) ( not ( = ?auto_35818 ?auto_35832 ) ) ( not ( = ?auto_35819 ?auto_35832 ) ) ( not ( = ?auto_35820 ?auto_35832 ) ) ( not ( = ?auto_35830 ?auto_35832 ) ) ( not ( = ?auto_35825 ?auto_35822 ) ) ( not ( = ?auto_35833 ?auto_35825 ) ) ( not ( = ?auto_35827 ?auto_35825 ) ) ( HOIST-AT ?auto_35831 ?auto_35825 ) ( not ( = ?auto_35821 ?auto_35831 ) ) ( not ( = ?auto_35824 ?auto_35831 ) ) ( not ( = ?auto_35828 ?auto_35831 ) ) ( AVAILABLE ?auto_35831 ) ( SURFACE-AT ?auto_35834 ?auto_35825 ) ( ON ?auto_35834 ?auto_35823 ) ( CLEAR ?auto_35834 ) ( not ( = ?auto_35818 ?auto_35823 ) ) ( not ( = ?auto_35819 ?auto_35823 ) ) ( not ( = ?auto_35834 ?auto_35823 ) ) ( not ( = ?auto_35820 ?auto_35823 ) ) ( not ( = ?auto_35830 ?auto_35823 ) ) ( not ( = ?auto_35832 ?auto_35823 ) ) ( TRUCK-AT ?auto_35829 ?auto_35822 ) ( SURFACE-AT ?auto_35826 ?auto_35822 ) ( CLEAR ?auto_35826 ) ( IS-CRATE ?auto_35832 ) ( not ( = ?auto_35826 ?auto_35832 ) ) ( not ( = ?auto_35818 ?auto_35826 ) ) ( not ( = ?auto_35819 ?auto_35826 ) ) ( not ( = ?auto_35834 ?auto_35826 ) ) ( not ( = ?auto_35820 ?auto_35826 ) ) ( not ( = ?auto_35830 ?auto_35826 ) ) ( not ( = ?auto_35823 ?auto_35826 ) ) ( AVAILABLE ?auto_35821 ) ( IN ?auto_35832 ?auto_35829 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35821 ?auto_35832 ?auto_35829 ?auto_35822 )
      ( MAKE-2CRATE ?auto_35834 ?auto_35818 ?auto_35819 )
      ( MAKE-1CRATE-VERIFY ?auto_35818 ?auto_35819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35835 - SURFACE
      ?auto_35836 - SURFACE
      ?auto_35837 - SURFACE
    )
    :vars
    (
      ?auto_35846 - HOIST
      ?auto_35843 - PLACE
      ?auto_35840 - PLACE
      ?auto_35844 - HOIST
      ?auto_35848 - SURFACE
      ?auto_35849 - PLACE
      ?auto_35842 - HOIST
      ?auto_35847 - SURFACE
      ?auto_35851 - SURFACE
      ?auto_35845 - PLACE
      ?auto_35850 - HOIST
      ?auto_35838 - SURFACE
      ?auto_35839 - TRUCK
      ?auto_35841 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35846 ?auto_35843 ) ( IS-CRATE ?auto_35837 ) ( not ( = ?auto_35836 ?auto_35837 ) ) ( not ( = ?auto_35835 ?auto_35836 ) ) ( not ( = ?auto_35835 ?auto_35837 ) ) ( not ( = ?auto_35840 ?auto_35843 ) ) ( HOIST-AT ?auto_35844 ?auto_35840 ) ( not ( = ?auto_35846 ?auto_35844 ) ) ( AVAILABLE ?auto_35844 ) ( SURFACE-AT ?auto_35837 ?auto_35840 ) ( ON ?auto_35837 ?auto_35848 ) ( CLEAR ?auto_35837 ) ( not ( = ?auto_35836 ?auto_35848 ) ) ( not ( = ?auto_35837 ?auto_35848 ) ) ( not ( = ?auto_35835 ?auto_35848 ) ) ( IS-CRATE ?auto_35836 ) ( not ( = ?auto_35849 ?auto_35843 ) ) ( not ( = ?auto_35840 ?auto_35849 ) ) ( HOIST-AT ?auto_35842 ?auto_35849 ) ( not ( = ?auto_35846 ?auto_35842 ) ) ( not ( = ?auto_35844 ?auto_35842 ) ) ( AVAILABLE ?auto_35842 ) ( SURFACE-AT ?auto_35836 ?auto_35849 ) ( ON ?auto_35836 ?auto_35847 ) ( CLEAR ?auto_35836 ) ( not ( = ?auto_35836 ?auto_35847 ) ) ( not ( = ?auto_35837 ?auto_35847 ) ) ( not ( = ?auto_35835 ?auto_35847 ) ) ( not ( = ?auto_35848 ?auto_35847 ) ) ( IS-CRATE ?auto_35835 ) ( not ( = ?auto_35851 ?auto_35835 ) ) ( not ( = ?auto_35836 ?auto_35851 ) ) ( not ( = ?auto_35837 ?auto_35851 ) ) ( not ( = ?auto_35848 ?auto_35851 ) ) ( not ( = ?auto_35847 ?auto_35851 ) ) ( not ( = ?auto_35845 ?auto_35843 ) ) ( not ( = ?auto_35840 ?auto_35845 ) ) ( not ( = ?auto_35849 ?auto_35845 ) ) ( HOIST-AT ?auto_35850 ?auto_35845 ) ( not ( = ?auto_35846 ?auto_35850 ) ) ( not ( = ?auto_35844 ?auto_35850 ) ) ( not ( = ?auto_35842 ?auto_35850 ) ) ( AVAILABLE ?auto_35850 ) ( SURFACE-AT ?auto_35835 ?auto_35845 ) ( ON ?auto_35835 ?auto_35838 ) ( CLEAR ?auto_35835 ) ( not ( = ?auto_35836 ?auto_35838 ) ) ( not ( = ?auto_35837 ?auto_35838 ) ) ( not ( = ?auto_35835 ?auto_35838 ) ) ( not ( = ?auto_35848 ?auto_35838 ) ) ( not ( = ?auto_35847 ?auto_35838 ) ) ( not ( = ?auto_35851 ?auto_35838 ) ) ( TRUCK-AT ?auto_35839 ?auto_35843 ) ( SURFACE-AT ?auto_35841 ?auto_35843 ) ( CLEAR ?auto_35841 ) ( IS-CRATE ?auto_35851 ) ( not ( = ?auto_35841 ?auto_35851 ) ) ( not ( = ?auto_35836 ?auto_35841 ) ) ( not ( = ?auto_35837 ?auto_35841 ) ) ( not ( = ?auto_35835 ?auto_35841 ) ) ( not ( = ?auto_35848 ?auto_35841 ) ) ( not ( = ?auto_35847 ?auto_35841 ) ) ( not ( = ?auto_35838 ?auto_35841 ) ) ( AVAILABLE ?auto_35846 ) ( IN ?auto_35851 ?auto_35839 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35836 ?auto_35837 )
      ( MAKE-2CRATE-VERIFY ?auto_35835 ?auto_35836 ?auto_35837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35852 - SURFACE
      ?auto_35853 - SURFACE
      ?auto_35854 - SURFACE
      ?auto_35855 - SURFACE
    )
    :vars
    (
      ?auto_35865 - HOIST
      ?auto_35860 - PLACE
      ?auto_35856 - PLACE
      ?auto_35859 - HOIST
      ?auto_35868 - SURFACE
      ?auto_35863 - PLACE
      ?auto_35867 - HOIST
      ?auto_35857 - SURFACE
      ?auto_35861 - PLACE
      ?auto_35864 - HOIST
      ?auto_35858 - SURFACE
      ?auto_35862 - TRUCK
      ?auto_35866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35865 ?auto_35860 ) ( IS-CRATE ?auto_35855 ) ( not ( = ?auto_35854 ?auto_35855 ) ) ( not ( = ?auto_35853 ?auto_35854 ) ) ( not ( = ?auto_35853 ?auto_35855 ) ) ( not ( = ?auto_35856 ?auto_35860 ) ) ( HOIST-AT ?auto_35859 ?auto_35856 ) ( not ( = ?auto_35865 ?auto_35859 ) ) ( AVAILABLE ?auto_35859 ) ( SURFACE-AT ?auto_35855 ?auto_35856 ) ( ON ?auto_35855 ?auto_35868 ) ( CLEAR ?auto_35855 ) ( not ( = ?auto_35854 ?auto_35868 ) ) ( not ( = ?auto_35855 ?auto_35868 ) ) ( not ( = ?auto_35853 ?auto_35868 ) ) ( IS-CRATE ?auto_35854 ) ( not ( = ?auto_35863 ?auto_35860 ) ) ( not ( = ?auto_35856 ?auto_35863 ) ) ( HOIST-AT ?auto_35867 ?auto_35863 ) ( not ( = ?auto_35865 ?auto_35867 ) ) ( not ( = ?auto_35859 ?auto_35867 ) ) ( AVAILABLE ?auto_35867 ) ( SURFACE-AT ?auto_35854 ?auto_35863 ) ( ON ?auto_35854 ?auto_35857 ) ( CLEAR ?auto_35854 ) ( not ( = ?auto_35854 ?auto_35857 ) ) ( not ( = ?auto_35855 ?auto_35857 ) ) ( not ( = ?auto_35853 ?auto_35857 ) ) ( not ( = ?auto_35868 ?auto_35857 ) ) ( IS-CRATE ?auto_35853 ) ( not ( = ?auto_35852 ?auto_35853 ) ) ( not ( = ?auto_35854 ?auto_35852 ) ) ( not ( = ?auto_35855 ?auto_35852 ) ) ( not ( = ?auto_35868 ?auto_35852 ) ) ( not ( = ?auto_35857 ?auto_35852 ) ) ( not ( = ?auto_35861 ?auto_35860 ) ) ( not ( = ?auto_35856 ?auto_35861 ) ) ( not ( = ?auto_35863 ?auto_35861 ) ) ( HOIST-AT ?auto_35864 ?auto_35861 ) ( not ( = ?auto_35865 ?auto_35864 ) ) ( not ( = ?auto_35859 ?auto_35864 ) ) ( not ( = ?auto_35867 ?auto_35864 ) ) ( AVAILABLE ?auto_35864 ) ( SURFACE-AT ?auto_35853 ?auto_35861 ) ( ON ?auto_35853 ?auto_35858 ) ( CLEAR ?auto_35853 ) ( not ( = ?auto_35854 ?auto_35858 ) ) ( not ( = ?auto_35855 ?auto_35858 ) ) ( not ( = ?auto_35853 ?auto_35858 ) ) ( not ( = ?auto_35868 ?auto_35858 ) ) ( not ( = ?auto_35857 ?auto_35858 ) ) ( not ( = ?auto_35852 ?auto_35858 ) ) ( TRUCK-AT ?auto_35862 ?auto_35860 ) ( SURFACE-AT ?auto_35866 ?auto_35860 ) ( CLEAR ?auto_35866 ) ( IS-CRATE ?auto_35852 ) ( not ( = ?auto_35866 ?auto_35852 ) ) ( not ( = ?auto_35854 ?auto_35866 ) ) ( not ( = ?auto_35855 ?auto_35866 ) ) ( not ( = ?auto_35853 ?auto_35866 ) ) ( not ( = ?auto_35868 ?auto_35866 ) ) ( not ( = ?auto_35857 ?auto_35866 ) ) ( not ( = ?auto_35858 ?auto_35866 ) ) ( AVAILABLE ?auto_35865 ) ( IN ?auto_35852 ?auto_35862 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35853 ?auto_35854 ?auto_35855 )
      ( MAKE-3CRATE-VERIFY ?auto_35852 ?auto_35853 ?auto_35854 ?auto_35855 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35869 - SURFACE
      ?auto_35870 - SURFACE
      ?auto_35871 - SURFACE
      ?auto_35872 - SURFACE
      ?auto_35873 - SURFACE
    )
    :vars
    (
      ?auto_35883 - HOIST
      ?auto_35878 - PLACE
      ?auto_35874 - PLACE
      ?auto_35877 - HOIST
      ?auto_35885 - SURFACE
      ?auto_35881 - PLACE
      ?auto_35884 - HOIST
      ?auto_35875 - SURFACE
      ?auto_35879 - PLACE
      ?auto_35882 - HOIST
      ?auto_35876 - SURFACE
      ?auto_35880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35883 ?auto_35878 ) ( IS-CRATE ?auto_35873 ) ( not ( = ?auto_35872 ?auto_35873 ) ) ( not ( = ?auto_35871 ?auto_35872 ) ) ( not ( = ?auto_35871 ?auto_35873 ) ) ( not ( = ?auto_35874 ?auto_35878 ) ) ( HOIST-AT ?auto_35877 ?auto_35874 ) ( not ( = ?auto_35883 ?auto_35877 ) ) ( AVAILABLE ?auto_35877 ) ( SURFACE-AT ?auto_35873 ?auto_35874 ) ( ON ?auto_35873 ?auto_35885 ) ( CLEAR ?auto_35873 ) ( not ( = ?auto_35872 ?auto_35885 ) ) ( not ( = ?auto_35873 ?auto_35885 ) ) ( not ( = ?auto_35871 ?auto_35885 ) ) ( IS-CRATE ?auto_35872 ) ( not ( = ?auto_35881 ?auto_35878 ) ) ( not ( = ?auto_35874 ?auto_35881 ) ) ( HOIST-AT ?auto_35884 ?auto_35881 ) ( not ( = ?auto_35883 ?auto_35884 ) ) ( not ( = ?auto_35877 ?auto_35884 ) ) ( AVAILABLE ?auto_35884 ) ( SURFACE-AT ?auto_35872 ?auto_35881 ) ( ON ?auto_35872 ?auto_35875 ) ( CLEAR ?auto_35872 ) ( not ( = ?auto_35872 ?auto_35875 ) ) ( not ( = ?auto_35873 ?auto_35875 ) ) ( not ( = ?auto_35871 ?auto_35875 ) ) ( not ( = ?auto_35885 ?auto_35875 ) ) ( IS-CRATE ?auto_35871 ) ( not ( = ?auto_35870 ?auto_35871 ) ) ( not ( = ?auto_35872 ?auto_35870 ) ) ( not ( = ?auto_35873 ?auto_35870 ) ) ( not ( = ?auto_35885 ?auto_35870 ) ) ( not ( = ?auto_35875 ?auto_35870 ) ) ( not ( = ?auto_35879 ?auto_35878 ) ) ( not ( = ?auto_35874 ?auto_35879 ) ) ( not ( = ?auto_35881 ?auto_35879 ) ) ( HOIST-AT ?auto_35882 ?auto_35879 ) ( not ( = ?auto_35883 ?auto_35882 ) ) ( not ( = ?auto_35877 ?auto_35882 ) ) ( not ( = ?auto_35884 ?auto_35882 ) ) ( AVAILABLE ?auto_35882 ) ( SURFACE-AT ?auto_35871 ?auto_35879 ) ( ON ?auto_35871 ?auto_35876 ) ( CLEAR ?auto_35871 ) ( not ( = ?auto_35872 ?auto_35876 ) ) ( not ( = ?auto_35873 ?auto_35876 ) ) ( not ( = ?auto_35871 ?auto_35876 ) ) ( not ( = ?auto_35885 ?auto_35876 ) ) ( not ( = ?auto_35875 ?auto_35876 ) ) ( not ( = ?auto_35870 ?auto_35876 ) ) ( TRUCK-AT ?auto_35880 ?auto_35878 ) ( SURFACE-AT ?auto_35869 ?auto_35878 ) ( CLEAR ?auto_35869 ) ( IS-CRATE ?auto_35870 ) ( not ( = ?auto_35869 ?auto_35870 ) ) ( not ( = ?auto_35872 ?auto_35869 ) ) ( not ( = ?auto_35873 ?auto_35869 ) ) ( not ( = ?auto_35871 ?auto_35869 ) ) ( not ( = ?auto_35885 ?auto_35869 ) ) ( not ( = ?auto_35875 ?auto_35869 ) ) ( not ( = ?auto_35876 ?auto_35869 ) ) ( AVAILABLE ?auto_35883 ) ( IN ?auto_35870 ?auto_35880 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35871 ?auto_35872 ?auto_35873 )
      ( MAKE-4CRATE-VERIFY ?auto_35869 ?auto_35870 ?auto_35871 ?auto_35872 ?auto_35873 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35886 - SURFACE
      ?auto_35887 - SURFACE
      ?auto_35888 - SURFACE
      ?auto_35889 - SURFACE
      ?auto_35890 - SURFACE
      ?auto_35891 - SURFACE
    )
    :vars
    (
      ?auto_35901 - HOIST
      ?auto_35896 - PLACE
      ?auto_35892 - PLACE
      ?auto_35895 - HOIST
      ?auto_35903 - SURFACE
      ?auto_35899 - PLACE
      ?auto_35902 - HOIST
      ?auto_35893 - SURFACE
      ?auto_35897 - PLACE
      ?auto_35900 - HOIST
      ?auto_35894 - SURFACE
      ?auto_35898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35901 ?auto_35896 ) ( IS-CRATE ?auto_35891 ) ( not ( = ?auto_35890 ?auto_35891 ) ) ( not ( = ?auto_35889 ?auto_35890 ) ) ( not ( = ?auto_35889 ?auto_35891 ) ) ( not ( = ?auto_35892 ?auto_35896 ) ) ( HOIST-AT ?auto_35895 ?auto_35892 ) ( not ( = ?auto_35901 ?auto_35895 ) ) ( AVAILABLE ?auto_35895 ) ( SURFACE-AT ?auto_35891 ?auto_35892 ) ( ON ?auto_35891 ?auto_35903 ) ( CLEAR ?auto_35891 ) ( not ( = ?auto_35890 ?auto_35903 ) ) ( not ( = ?auto_35891 ?auto_35903 ) ) ( not ( = ?auto_35889 ?auto_35903 ) ) ( IS-CRATE ?auto_35890 ) ( not ( = ?auto_35899 ?auto_35896 ) ) ( not ( = ?auto_35892 ?auto_35899 ) ) ( HOIST-AT ?auto_35902 ?auto_35899 ) ( not ( = ?auto_35901 ?auto_35902 ) ) ( not ( = ?auto_35895 ?auto_35902 ) ) ( AVAILABLE ?auto_35902 ) ( SURFACE-AT ?auto_35890 ?auto_35899 ) ( ON ?auto_35890 ?auto_35893 ) ( CLEAR ?auto_35890 ) ( not ( = ?auto_35890 ?auto_35893 ) ) ( not ( = ?auto_35891 ?auto_35893 ) ) ( not ( = ?auto_35889 ?auto_35893 ) ) ( not ( = ?auto_35903 ?auto_35893 ) ) ( IS-CRATE ?auto_35889 ) ( not ( = ?auto_35888 ?auto_35889 ) ) ( not ( = ?auto_35890 ?auto_35888 ) ) ( not ( = ?auto_35891 ?auto_35888 ) ) ( not ( = ?auto_35903 ?auto_35888 ) ) ( not ( = ?auto_35893 ?auto_35888 ) ) ( not ( = ?auto_35897 ?auto_35896 ) ) ( not ( = ?auto_35892 ?auto_35897 ) ) ( not ( = ?auto_35899 ?auto_35897 ) ) ( HOIST-AT ?auto_35900 ?auto_35897 ) ( not ( = ?auto_35901 ?auto_35900 ) ) ( not ( = ?auto_35895 ?auto_35900 ) ) ( not ( = ?auto_35902 ?auto_35900 ) ) ( AVAILABLE ?auto_35900 ) ( SURFACE-AT ?auto_35889 ?auto_35897 ) ( ON ?auto_35889 ?auto_35894 ) ( CLEAR ?auto_35889 ) ( not ( = ?auto_35890 ?auto_35894 ) ) ( not ( = ?auto_35891 ?auto_35894 ) ) ( not ( = ?auto_35889 ?auto_35894 ) ) ( not ( = ?auto_35903 ?auto_35894 ) ) ( not ( = ?auto_35893 ?auto_35894 ) ) ( not ( = ?auto_35888 ?auto_35894 ) ) ( TRUCK-AT ?auto_35898 ?auto_35896 ) ( SURFACE-AT ?auto_35887 ?auto_35896 ) ( CLEAR ?auto_35887 ) ( IS-CRATE ?auto_35888 ) ( not ( = ?auto_35887 ?auto_35888 ) ) ( not ( = ?auto_35890 ?auto_35887 ) ) ( not ( = ?auto_35891 ?auto_35887 ) ) ( not ( = ?auto_35889 ?auto_35887 ) ) ( not ( = ?auto_35903 ?auto_35887 ) ) ( not ( = ?auto_35893 ?auto_35887 ) ) ( not ( = ?auto_35894 ?auto_35887 ) ) ( AVAILABLE ?auto_35901 ) ( IN ?auto_35888 ?auto_35898 ) ( ON ?auto_35887 ?auto_35886 ) ( not ( = ?auto_35886 ?auto_35887 ) ) ( not ( = ?auto_35886 ?auto_35888 ) ) ( not ( = ?auto_35886 ?auto_35889 ) ) ( not ( = ?auto_35886 ?auto_35890 ) ) ( not ( = ?auto_35886 ?auto_35891 ) ) ( not ( = ?auto_35886 ?auto_35903 ) ) ( not ( = ?auto_35886 ?auto_35893 ) ) ( not ( = ?auto_35886 ?auto_35894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35889 ?auto_35890 ?auto_35891 )
      ( MAKE-5CRATE-VERIFY ?auto_35886 ?auto_35887 ?auto_35888 ?auto_35889 ?auto_35890 ?auto_35891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35904 - SURFACE
      ?auto_35905 - SURFACE
    )
    :vars
    (
      ?auto_35917 - HOIST
      ?auto_35912 - PLACE
      ?auto_35908 - SURFACE
      ?auto_35906 - PLACE
      ?auto_35911 - HOIST
      ?auto_35920 - SURFACE
      ?auto_35915 - PLACE
      ?auto_35919 - HOIST
      ?auto_35907 - SURFACE
      ?auto_35910 - SURFACE
      ?auto_35913 - PLACE
      ?auto_35916 - HOIST
      ?auto_35909 - SURFACE
      ?auto_35918 - SURFACE
      ?auto_35914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35917 ?auto_35912 ) ( IS-CRATE ?auto_35905 ) ( not ( = ?auto_35904 ?auto_35905 ) ) ( not ( = ?auto_35908 ?auto_35904 ) ) ( not ( = ?auto_35908 ?auto_35905 ) ) ( not ( = ?auto_35906 ?auto_35912 ) ) ( HOIST-AT ?auto_35911 ?auto_35906 ) ( not ( = ?auto_35917 ?auto_35911 ) ) ( AVAILABLE ?auto_35911 ) ( SURFACE-AT ?auto_35905 ?auto_35906 ) ( ON ?auto_35905 ?auto_35920 ) ( CLEAR ?auto_35905 ) ( not ( = ?auto_35904 ?auto_35920 ) ) ( not ( = ?auto_35905 ?auto_35920 ) ) ( not ( = ?auto_35908 ?auto_35920 ) ) ( IS-CRATE ?auto_35904 ) ( not ( = ?auto_35915 ?auto_35912 ) ) ( not ( = ?auto_35906 ?auto_35915 ) ) ( HOIST-AT ?auto_35919 ?auto_35915 ) ( not ( = ?auto_35917 ?auto_35919 ) ) ( not ( = ?auto_35911 ?auto_35919 ) ) ( AVAILABLE ?auto_35919 ) ( SURFACE-AT ?auto_35904 ?auto_35915 ) ( ON ?auto_35904 ?auto_35907 ) ( CLEAR ?auto_35904 ) ( not ( = ?auto_35904 ?auto_35907 ) ) ( not ( = ?auto_35905 ?auto_35907 ) ) ( not ( = ?auto_35908 ?auto_35907 ) ) ( not ( = ?auto_35920 ?auto_35907 ) ) ( IS-CRATE ?auto_35908 ) ( not ( = ?auto_35910 ?auto_35908 ) ) ( not ( = ?auto_35904 ?auto_35910 ) ) ( not ( = ?auto_35905 ?auto_35910 ) ) ( not ( = ?auto_35920 ?auto_35910 ) ) ( not ( = ?auto_35907 ?auto_35910 ) ) ( not ( = ?auto_35913 ?auto_35912 ) ) ( not ( = ?auto_35906 ?auto_35913 ) ) ( not ( = ?auto_35915 ?auto_35913 ) ) ( HOIST-AT ?auto_35916 ?auto_35913 ) ( not ( = ?auto_35917 ?auto_35916 ) ) ( not ( = ?auto_35911 ?auto_35916 ) ) ( not ( = ?auto_35919 ?auto_35916 ) ) ( AVAILABLE ?auto_35916 ) ( SURFACE-AT ?auto_35908 ?auto_35913 ) ( ON ?auto_35908 ?auto_35909 ) ( CLEAR ?auto_35908 ) ( not ( = ?auto_35904 ?auto_35909 ) ) ( not ( = ?auto_35905 ?auto_35909 ) ) ( not ( = ?auto_35908 ?auto_35909 ) ) ( not ( = ?auto_35920 ?auto_35909 ) ) ( not ( = ?auto_35907 ?auto_35909 ) ) ( not ( = ?auto_35910 ?auto_35909 ) ) ( SURFACE-AT ?auto_35918 ?auto_35912 ) ( CLEAR ?auto_35918 ) ( IS-CRATE ?auto_35910 ) ( not ( = ?auto_35918 ?auto_35910 ) ) ( not ( = ?auto_35904 ?auto_35918 ) ) ( not ( = ?auto_35905 ?auto_35918 ) ) ( not ( = ?auto_35908 ?auto_35918 ) ) ( not ( = ?auto_35920 ?auto_35918 ) ) ( not ( = ?auto_35907 ?auto_35918 ) ) ( not ( = ?auto_35909 ?auto_35918 ) ) ( AVAILABLE ?auto_35917 ) ( IN ?auto_35910 ?auto_35914 ) ( TRUCK-AT ?auto_35914 ?auto_35906 ) )
    :subtasks
    ( ( !DRIVE ?auto_35914 ?auto_35906 ?auto_35912 )
      ( MAKE-2CRATE ?auto_35908 ?auto_35904 ?auto_35905 )
      ( MAKE-1CRATE-VERIFY ?auto_35904 ?auto_35905 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_35921 - SURFACE
      ?auto_35922 - SURFACE
      ?auto_35923 - SURFACE
    )
    :vars
    (
      ?auto_35937 - HOIST
      ?auto_35925 - PLACE
      ?auto_35934 - PLACE
      ?auto_35936 - HOIST
      ?auto_35927 - SURFACE
      ?auto_35926 - PLACE
      ?auto_35929 - HOIST
      ?auto_35931 - SURFACE
      ?auto_35932 - SURFACE
      ?auto_35933 - PLACE
      ?auto_35928 - HOIST
      ?auto_35935 - SURFACE
      ?auto_35924 - SURFACE
      ?auto_35930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35937 ?auto_35925 ) ( IS-CRATE ?auto_35923 ) ( not ( = ?auto_35922 ?auto_35923 ) ) ( not ( = ?auto_35921 ?auto_35922 ) ) ( not ( = ?auto_35921 ?auto_35923 ) ) ( not ( = ?auto_35934 ?auto_35925 ) ) ( HOIST-AT ?auto_35936 ?auto_35934 ) ( not ( = ?auto_35937 ?auto_35936 ) ) ( AVAILABLE ?auto_35936 ) ( SURFACE-AT ?auto_35923 ?auto_35934 ) ( ON ?auto_35923 ?auto_35927 ) ( CLEAR ?auto_35923 ) ( not ( = ?auto_35922 ?auto_35927 ) ) ( not ( = ?auto_35923 ?auto_35927 ) ) ( not ( = ?auto_35921 ?auto_35927 ) ) ( IS-CRATE ?auto_35922 ) ( not ( = ?auto_35926 ?auto_35925 ) ) ( not ( = ?auto_35934 ?auto_35926 ) ) ( HOIST-AT ?auto_35929 ?auto_35926 ) ( not ( = ?auto_35937 ?auto_35929 ) ) ( not ( = ?auto_35936 ?auto_35929 ) ) ( AVAILABLE ?auto_35929 ) ( SURFACE-AT ?auto_35922 ?auto_35926 ) ( ON ?auto_35922 ?auto_35931 ) ( CLEAR ?auto_35922 ) ( not ( = ?auto_35922 ?auto_35931 ) ) ( not ( = ?auto_35923 ?auto_35931 ) ) ( not ( = ?auto_35921 ?auto_35931 ) ) ( not ( = ?auto_35927 ?auto_35931 ) ) ( IS-CRATE ?auto_35921 ) ( not ( = ?auto_35932 ?auto_35921 ) ) ( not ( = ?auto_35922 ?auto_35932 ) ) ( not ( = ?auto_35923 ?auto_35932 ) ) ( not ( = ?auto_35927 ?auto_35932 ) ) ( not ( = ?auto_35931 ?auto_35932 ) ) ( not ( = ?auto_35933 ?auto_35925 ) ) ( not ( = ?auto_35934 ?auto_35933 ) ) ( not ( = ?auto_35926 ?auto_35933 ) ) ( HOIST-AT ?auto_35928 ?auto_35933 ) ( not ( = ?auto_35937 ?auto_35928 ) ) ( not ( = ?auto_35936 ?auto_35928 ) ) ( not ( = ?auto_35929 ?auto_35928 ) ) ( AVAILABLE ?auto_35928 ) ( SURFACE-AT ?auto_35921 ?auto_35933 ) ( ON ?auto_35921 ?auto_35935 ) ( CLEAR ?auto_35921 ) ( not ( = ?auto_35922 ?auto_35935 ) ) ( not ( = ?auto_35923 ?auto_35935 ) ) ( not ( = ?auto_35921 ?auto_35935 ) ) ( not ( = ?auto_35927 ?auto_35935 ) ) ( not ( = ?auto_35931 ?auto_35935 ) ) ( not ( = ?auto_35932 ?auto_35935 ) ) ( SURFACE-AT ?auto_35924 ?auto_35925 ) ( CLEAR ?auto_35924 ) ( IS-CRATE ?auto_35932 ) ( not ( = ?auto_35924 ?auto_35932 ) ) ( not ( = ?auto_35922 ?auto_35924 ) ) ( not ( = ?auto_35923 ?auto_35924 ) ) ( not ( = ?auto_35921 ?auto_35924 ) ) ( not ( = ?auto_35927 ?auto_35924 ) ) ( not ( = ?auto_35931 ?auto_35924 ) ) ( not ( = ?auto_35935 ?auto_35924 ) ) ( AVAILABLE ?auto_35937 ) ( IN ?auto_35932 ?auto_35930 ) ( TRUCK-AT ?auto_35930 ?auto_35934 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_35922 ?auto_35923 )
      ( MAKE-2CRATE-VERIFY ?auto_35921 ?auto_35922 ?auto_35923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_35938 - SURFACE
      ?auto_35939 - SURFACE
      ?auto_35940 - SURFACE
      ?auto_35941 - SURFACE
    )
    :vars
    (
      ?auto_35949 - HOIST
      ?auto_35944 - PLACE
      ?auto_35947 - PLACE
      ?auto_35946 - HOIST
      ?auto_35945 - SURFACE
      ?auto_35952 - PLACE
      ?auto_35942 - HOIST
      ?auto_35943 - SURFACE
      ?auto_35950 - PLACE
      ?auto_35948 - HOIST
      ?auto_35951 - SURFACE
      ?auto_35953 - SURFACE
      ?auto_35954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35949 ?auto_35944 ) ( IS-CRATE ?auto_35941 ) ( not ( = ?auto_35940 ?auto_35941 ) ) ( not ( = ?auto_35939 ?auto_35940 ) ) ( not ( = ?auto_35939 ?auto_35941 ) ) ( not ( = ?auto_35947 ?auto_35944 ) ) ( HOIST-AT ?auto_35946 ?auto_35947 ) ( not ( = ?auto_35949 ?auto_35946 ) ) ( AVAILABLE ?auto_35946 ) ( SURFACE-AT ?auto_35941 ?auto_35947 ) ( ON ?auto_35941 ?auto_35945 ) ( CLEAR ?auto_35941 ) ( not ( = ?auto_35940 ?auto_35945 ) ) ( not ( = ?auto_35941 ?auto_35945 ) ) ( not ( = ?auto_35939 ?auto_35945 ) ) ( IS-CRATE ?auto_35940 ) ( not ( = ?auto_35952 ?auto_35944 ) ) ( not ( = ?auto_35947 ?auto_35952 ) ) ( HOIST-AT ?auto_35942 ?auto_35952 ) ( not ( = ?auto_35949 ?auto_35942 ) ) ( not ( = ?auto_35946 ?auto_35942 ) ) ( AVAILABLE ?auto_35942 ) ( SURFACE-AT ?auto_35940 ?auto_35952 ) ( ON ?auto_35940 ?auto_35943 ) ( CLEAR ?auto_35940 ) ( not ( = ?auto_35940 ?auto_35943 ) ) ( not ( = ?auto_35941 ?auto_35943 ) ) ( not ( = ?auto_35939 ?auto_35943 ) ) ( not ( = ?auto_35945 ?auto_35943 ) ) ( IS-CRATE ?auto_35939 ) ( not ( = ?auto_35938 ?auto_35939 ) ) ( not ( = ?auto_35940 ?auto_35938 ) ) ( not ( = ?auto_35941 ?auto_35938 ) ) ( not ( = ?auto_35945 ?auto_35938 ) ) ( not ( = ?auto_35943 ?auto_35938 ) ) ( not ( = ?auto_35950 ?auto_35944 ) ) ( not ( = ?auto_35947 ?auto_35950 ) ) ( not ( = ?auto_35952 ?auto_35950 ) ) ( HOIST-AT ?auto_35948 ?auto_35950 ) ( not ( = ?auto_35949 ?auto_35948 ) ) ( not ( = ?auto_35946 ?auto_35948 ) ) ( not ( = ?auto_35942 ?auto_35948 ) ) ( AVAILABLE ?auto_35948 ) ( SURFACE-AT ?auto_35939 ?auto_35950 ) ( ON ?auto_35939 ?auto_35951 ) ( CLEAR ?auto_35939 ) ( not ( = ?auto_35940 ?auto_35951 ) ) ( not ( = ?auto_35941 ?auto_35951 ) ) ( not ( = ?auto_35939 ?auto_35951 ) ) ( not ( = ?auto_35945 ?auto_35951 ) ) ( not ( = ?auto_35943 ?auto_35951 ) ) ( not ( = ?auto_35938 ?auto_35951 ) ) ( SURFACE-AT ?auto_35953 ?auto_35944 ) ( CLEAR ?auto_35953 ) ( IS-CRATE ?auto_35938 ) ( not ( = ?auto_35953 ?auto_35938 ) ) ( not ( = ?auto_35940 ?auto_35953 ) ) ( not ( = ?auto_35941 ?auto_35953 ) ) ( not ( = ?auto_35939 ?auto_35953 ) ) ( not ( = ?auto_35945 ?auto_35953 ) ) ( not ( = ?auto_35943 ?auto_35953 ) ) ( not ( = ?auto_35951 ?auto_35953 ) ) ( AVAILABLE ?auto_35949 ) ( IN ?auto_35938 ?auto_35954 ) ( TRUCK-AT ?auto_35954 ?auto_35947 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35939 ?auto_35940 ?auto_35941 )
      ( MAKE-3CRATE-VERIFY ?auto_35938 ?auto_35939 ?auto_35940 ?auto_35941 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_35955 - SURFACE
      ?auto_35956 - SURFACE
      ?auto_35957 - SURFACE
      ?auto_35958 - SURFACE
      ?auto_35959 - SURFACE
    )
    :vars
    (
      ?auto_35967 - HOIST
      ?auto_35962 - PLACE
      ?auto_35965 - PLACE
      ?auto_35964 - HOIST
      ?auto_35963 - SURFACE
      ?auto_35970 - PLACE
      ?auto_35960 - HOIST
      ?auto_35961 - SURFACE
      ?auto_35968 - PLACE
      ?auto_35966 - HOIST
      ?auto_35969 - SURFACE
      ?auto_35971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35967 ?auto_35962 ) ( IS-CRATE ?auto_35959 ) ( not ( = ?auto_35958 ?auto_35959 ) ) ( not ( = ?auto_35957 ?auto_35958 ) ) ( not ( = ?auto_35957 ?auto_35959 ) ) ( not ( = ?auto_35965 ?auto_35962 ) ) ( HOIST-AT ?auto_35964 ?auto_35965 ) ( not ( = ?auto_35967 ?auto_35964 ) ) ( AVAILABLE ?auto_35964 ) ( SURFACE-AT ?auto_35959 ?auto_35965 ) ( ON ?auto_35959 ?auto_35963 ) ( CLEAR ?auto_35959 ) ( not ( = ?auto_35958 ?auto_35963 ) ) ( not ( = ?auto_35959 ?auto_35963 ) ) ( not ( = ?auto_35957 ?auto_35963 ) ) ( IS-CRATE ?auto_35958 ) ( not ( = ?auto_35970 ?auto_35962 ) ) ( not ( = ?auto_35965 ?auto_35970 ) ) ( HOIST-AT ?auto_35960 ?auto_35970 ) ( not ( = ?auto_35967 ?auto_35960 ) ) ( not ( = ?auto_35964 ?auto_35960 ) ) ( AVAILABLE ?auto_35960 ) ( SURFACE-AT ?auto_35958 ?auto_35970 ) ( ON ?auto_35958 ?auto_35961 ) ( CLEAR ?auto_35958 ) ( not ( = ?auto_35958 ?auto_35961 ) ) ( not ( = ?auto_35959 ?auto_35961 ) ) ( not ( = ?auto_35957 ?auto_35961 ) ) ( not ( = ?auto_35963 ?auto_35961 ) ) ( IS-CRATE ?auto_35957 ) ( not ( = ?auto_35956 ?auto_35957 ) ) ( not ( = ?auto_35958 ?auto_35956 ) ) ( not ( = ?auto_35959 ?auto_35956 ) ) ( not ( = ?auto_35963 ?auto_35956 ) ) ( not ( = ?auto_35961 ?auto_35956 ) ) ( not ( = ?auto_35968 ?auto_35962 ) ) ( not ( = ?auto_35965 ?auto_35968 ) ) ( not ( = ?auto_35970 ?auto_35968 ) ) ( HOIST-AT ?auto_35966 ?auto_35968 ) ( not ( = ?auto_35967 ?auto_35966 ) ) ( not ( = ?auto_35964 ?auto_35966 ) ) ( not ( = ?auto_35960 ?auto_35966 ) ) ( AVAILABLE ?auto_35966 ) ( SURFACE-AT ?auto_35957 ?auto_35968 ) ( ON ?auto_35957 ?auto_35969 ) ( CLEAR ?auto_35957 ) ( not ( = ?auto_35958 ?auto_35969 ) ) ( not ( = ?auto_35959 ?auto_35969 ) ) ( not ( = ?auto_35957 ?auto_35969 ) ) ( not ( = ?auto_35963 ?auto_35969 ) ) ( not ( = ?auto_35961 ?auto_35969 ) ) ( not ( = ?auto_35956 ?auto_35969 ) ) ( SURFACE-AT ?auto_35955 ?auto_35962 ) ( CLEAR ?auto_35955 ) ( IS-CRATE ?auto_35956 ) ( not ( = ?auto_35955 ?auto_35956 ) ) ( not ( = ?auto_35958 ?auto_35955 ) ) ( not ( = ?auto_35959 ?auto_35955 ) ) ( not ( = ?auto_35957 ?auto_35955 ) ) ( not ( = ?auto_35963 ?auto_35955 ) ) ( not ( = ?auto_35961 ?auto_35955 ) ) ( not ( = ?auto_35969 ?auto_35955 ) ) ( AVAILABLE ?auto_35967 ) ( IN ?auto_35956 ?auto_35971 ) ( TRUCK-AT ?auto_35971 ?auto_35965 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35957 ?auto_35958 ?auto_35959 )
      ( MAKE-4CRATE-VERIFY ?auto_35955 ?auto_35956 ?auto_35957 ?auto_35958 ?auto_35959 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_35972 - SURFACE
      ?auto_35973 - SURFACE
      ?auto_35974 - SURFACE
      ?auto_35975 - SURFACE
      ?auto_35976 - SURFACE
      ?auto_35977 - SURFACE
    )
    :vars
    (
      ?auto_35985 - HOIST
      ?auto_35980 - PLACE
      ?auto_35983 - PLACE
      ?auto_35982 - HOIST
      ?auto_35981 - SURFACE
      ?auto_35988 - PLACE
      ?auto_35978 - HOIST
      ?auto_35979 - SURFACE
      ?auto_35986 - PLACE
      ?auto_35984 - HOIST
      ?auto_35987 - SURFACE
      ?auto_35989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35985 ?auto_35980 ) ( IS-CRATE ?auto_35977 ) ( not ( = ?auto_35976 ?auto_35977 ) ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( not ( = ?auto_35975 ?auto_35977 ) ) ( not ( = ?auto_35983 ?auto_35980 ) ) ( HOIST-AT ?auto_35982 ?auto_35983 ) ( not ( = ?auto_35985 ?auto_35982 ) ) ( AVAILABLE ?auto_35982 ) ( SURFACE-AT ?auto_35977 ?auto_35983 ) ( ON ?auto_35977 ?auto_35981 ) ( CLEAR ?auto_35977 ) ( not ( = ?auto_35976 ?auto_35981 ) ) ( not ( = ?auto_35977 ?auto_35981 ) ) ( not ( = ?auto_35975 ?auto_35981 ) ) ( IS-CRATE ?auto_35976 ) ( not ( = ?auto_35988 ?auto_35980 ) ) ( not ( = ?auto_35983 ?auto_35988 ) ) ( HOIST-AT ?auto_35978 ?auto_35988 ) ( not ( = ?auto_35985 ?auto_35978 ) ) ( not ( = ?auto_35982 ?auto_35978 ) ) ( AVAILABLE ?auto_35978 ) ( SURFACE-AT ?auto_35976 ?auto_35988 ) ( ON ?auto_35976 ?auto_35979 ) ( CLEAR ?auto_35976 ) ( not ( = ?auto_35976 ?auto_35979 ) ) ( not ( = ?auto_35977 ?auto_35979 ) ) ( not ( = ?auto_35975 ?auto_35979 ) ) ( not ( = ?auto_35981 ?auto_35979 ) ) ( IS-CRATE ?auto_35975 ) ( not ( = ?auto_35974 ?auto_35975 ) ) ( not ( = ?auto_35976 ?auto_35974 ) ) ( not ( = ?auto_35977 ?auto_35974 ) ) ( not ( = ?auto_35981 ?auto_35974 ) ) ( not ( = ?auto_35979 ?auto_35974 ) ) ( not ( = ?auto_35986 ?auto_35980 ) ) ( not ( = ?auto_35983 ?auto_35986 ) ) ( not ( = ?auto_35988 ?auto_35986 ) ) ( HOIST-AT ?auto_35984 ?auto_35986 ) ( not ( = ?auto_35985 ?auto_35984 ) ) ( not ( = ?auto_35982 ?auto_35984 ) ) ( not ( = ?auto_35978 ?auto_35984 ) ) ( AVAILABLE ?auto_35984 ) ( SURFACE-AT ?auto_35975 ?auto_35986 ) ( ON ?auto_35975 ?auto_35987 ) ( CLEAR ?auto_35975 ) ( not ( = ?auto_35976 ?auto_35987 ) ) ( not ( = ?auto_35977 ?auto_35987 ) ) ( not ( = ?auto_35975 ?auto_35987 ) ) ( not ( = ?auto_35981 ?auto_35987 ) ) ( not ( = ?auto_35979 ?auto_35987 ) ) ( not ( = ?auto_35974 ?auto_35987 ) ) ( SURFACE-AT ?auto_35973 ?auto_35980 ) ( CLEAR ?auto_35973 ) ( IS-CRATE ?auto_35974 ) ( not ( = ?auto_35973 ?auto_35974 ) ) ( not ( = ?auto_35976 ?auto_35973 ) ) ( not ( = ?auto_35977 ?auto_35973 ) ) ( not ( = ?auto_35975 ?auto_35973 ) ) ( not ( = ?auto_35981 ?auto_35973 ) ) ( not ( = ?auto_35979 ?auto_35973 ) ) ( not ( = ?auto_35987 ?auto_35973 ) ) ( AVAILABLE ?auto_35985 ) ( IN ?auto_35974 ?auto_35989 ) ( TRUCK-AT ?auto_35989 ?auto_35983 ) ( ON ?auto_35973 ?auto_35972 ) ( not ( = ?auto_35972 ?auto_35973 ) ) ( not ( = ?auto_35972 ?auto_35974 ) ) ( not ( = ?auto_35972 ?auto_35975 ) ) ( not ( = ?auto_35972 ?auto_35976 ) ) ( not ( = ?auto_35972 ?auto_35977 ) ) ( not ( = ?auto_35972 ?auto_35981 ) ) ( not ( = ?auto_35972 ?auto_35979 ) ) ( not ( = ?auto_35972 ?auto_35987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_35975 ?auto_35976 ?auto_35977 )
      ( MAKE-5CRATE-VERIFY ?auto_35972 ?auto_35973 ?auto_35974 ?auto_35975 ?auto_35976 ?auto_35977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35990 - SURFACE
      ?auto_35991 - SURFACE
    )
    :vars
    (
      ?auto_36001 - HOIST
      ?auto_35995 - PLACE
      ?auto_35992 - SURFACE
      ?auto_35999 - PLACE
      ?auto_35998 - HOIST
      ?auto_35997 - SURFACE
      ?auto_36004 - PLACE
      ?auto_35993 - HOIST
      ?auto_35994 - SURFACE
      ?auto_35996 - SURFACE
      ?auto_36002 - PLACE
      ?auto_36000 - HOIST
      ?auto_36003 - SURFACE
      ?auto_36005 - SURFACE
      ?auto_36006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36001 ?auto_35995 ) ( IS-CRATE ?auto_35991 ) ( not ( = ?auto_35990 ?auto_35991 ) ) ( not ( = ?auto_35992 ?auto_35990 ) ) ( not ( = ?auto_35992 ?auto_35991 ) ) ( not ( = ?auto_35999 ?auto_35995 ) ) ( HOIST-AT ?auto_35998 ?auto_35999 ) ( not ( = ?auto_36001 ?auto_35998 ) ) ( SURFACE-AT ?auto_35991 ?auto_35999 ) ( ON ?auto_35991 ?auto_35997 ) ( CLEAR ?auto_35991 ) ( not ( = ?auto_35990 ?auto_35997 ) ) ( not ( = ?auto_35991 ?auto_35997 ) ) ( not ( = ?auto_35992 ?auto_35997 ) ) ( IS-CRATE ?auto_35990 ) ( not ( = ?auto_36004 ?auto_35995 ) ) ( not ( = ?auto_35999 ?auto_36004 ) ) ( HOIST-AT ?auto_35993 ?auto_36004 ) ( not ( = ?auto_36001 ?auto_35993 ) ) ( not ( = ?auto_35998 ?auto_35993 ) ) ( AVAILABLE ?auto_35993 ) ( SURFACE-AT ?auto_35990 ?auto_36004 ) ( ON ?auto_35990 ?auto_35994 ) ( CLEAR ?auto_35990 ) ( not ( = ?auto_35990 ?auto_35994 ) ) ( not ( = ?auto_35991 ?auto_35994 ) ) ( not ( = ?auto_35992 ?auto_35994 ) ) ( not ( = ?auto_35997 ?auto_35994 ) ) ( IS-CRATE ?auto_35992 ) ( not ( = ?auto_35996 ?auto_35992 ) ) ( not ( = ?auto_35990 ?auto_35996 ) ) ( not ( = ?auto_35991 ?auto_35996 ) ) ( not ( = ?auto_35997 ?auto_35996 ) ) ( not ( = ?auto_35994 ?auto_35996 ) ) ( not ( = ?auto_36002 ?auto_35995 ) ) ( not ( = ?auto_35999 ?auto_36002 ) ) ( not ( = ?auto_36004 ?auto_36002 ) ) ( HOIST-AT ?auto_36000 ?auto_36002 ) ( not ( = ?auto_36001 ?auto_36000 ) ) ( not ( = ?auto_35998 ?auto_36000 ) ) ( not ( = ?auto_35993 ?auto_36000 ) ) ( AVAILABLE ?auto_36000 ) ( SURFACE-AT ?auto_35992 ?auto_36002 ) ( ON ?auto_35992 ?auto_36003 ) ( CLEAR ?auto_35992 ) ( not ( = ?auto_35990 ?auto_36003 ) ) ( not ( = ?auto_35991 ?auto_36003 ) ) ( not ( = ?auto_35992 ?auto_36003 ) ) ( not ( = ?auto_35997 ?auto_36003 ) ) ( not ( = ?auto_35994 ?auto_36003 ) ) ( not ( = ?auto_35996 ?auto_36003 ) ) ( SURFACE-AT ?auto_36005 ?auto_35995 ) ( CLEAR ?auto_36005 ) ( IS-CRATE ?auto_35996 ) ( not ( = ?auto_36005 ?auto_35996 ) ) ( not ( = ?auto_35990 ?auto_36005 ) ) ( not ( = ?auto_35991 ?auto_36005 ) ) ( not ( = ?auto_35992 ?auto_36005 ) ) ( not ( = ?auto_35997 ?auto_36005 ) ) ( not ( = ?auto_35994 ?auto_36005 ) ) ( not ( = ?auto_36003 ?auto_36005 ) ) ( AVAILABLE ?auto_36001 ) ( TRUCK-AT ?auto_36006 ?auto_35999 ) ( LIFTING ?auto_35998 ?auto_35996 ) )
    :subtasks
    ( ( !LOAD ?auto_35998 ?auto_35996 ?auto_36006 ?auto_35999 )
      ( MAKE-2CRATE ?auto_35992 ?auto_35990 ?auto_35991 )
      ( MAKE-1CRATE-VERIFY ?auto_35990 ?auto_35991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36007 - SURFACE
      ?auto_36008 - SURFACE
      ?auto_36009 - SURFACE
    )
    :vars
    (
      ?auto_36021 - HOIST
      ?auto_36022 - PLACE
      ?auto_36023 - PLACE
      ?auto_36015 - HOIST
      ?auto_36016 - SURFACE
      ?auto_36018 - PLACE
      ?auto_36020 - HOIST
      ?auto_36012 - SURFACE
      ?auto_36011 - SURFACE
      ?auto_36017 - PLACE
      ?auto_36019 - HOIST
      ?auto_36013 - SURFACE
      ?auto_36014 - SURFACE
      ?auto_36010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36021 ?auto_36022 ) ( IS-CRATE ?auto_36009 ) ( not ( = ?auto_36008 ?auto_36009 ) ) ( not ( = ?auto_36007 ?auto_36008 ) ) ( not ( = ?auto_36007 ?auto_36009 ) ) ( not ( = ?auto_36023 ?auto_36022 ) ) ( HOIST-AT ?auto_36015 ?auto_36023 ) ( not ( = ?auto_36021 ?auto_36015 ) ) ( SURFACE-AT ?auto_36009 ?auto_36023 ) ( ON ?auto_36009 ?auto_36016 ) ( CLEAR ?auto_36009 ) ( not ( = ?auto_36008 ?auto_36016 ) ) ( not ( = ?auto_36009 ?auto_36016 ) ) ( not ( = ?auto_36007 ?auto_36016 ) ) ( IS-CRATE ?auto_36008 ) ( not ( = ?auto_36018 ?auto_36022 ) ) ( not ( = ?auto_36023 ?auto_36018 ) ) ( HOIST-AT ?auto_36020 ?auto_36018 ) ( not ( = ?auto_36021 ?auto_36020 ) ) ( not ( = ?auto_36015 ?auto_36020 ) ) ( AVAILABLE ?auto_36020 ) ( SURFACE-AT ?auto_36008 ?auto_36018 ) ( ON ?auto_36008 ?auto_36012 ) ( CLEAR ?auto_36008 ) ( not ( = ?auto_36008 ?auto_36012 ) ) ( not ( = ?auto_36009 ?auto_36012 ) ) ( not ( = ?auto_36007 ?auto_36012 ) ) ( not ( = ?auto_36016 ?auto_36012 ) ) ( IS-CRATE ?auto_36007 ) ( not ( = ?auto_36011 ?auto_36007 ) ) ( not ( = ?auto_36008 ?auto_36011 ) ) ( not ( = ?auto_36009 ?auto_36011 ) ) ( not ( = ?auto_36016 ?auto_36011 ) ) ( not ( = ?auto_36012 ?auto_36011 ) ) ( not ( = ?auto_36017 ?auto_36022 ) ) ( not ( = ?auto_36023 ?auto_36017 ) ) ( not ( = ?auto_36018 ?auto_36017 ) ) ( HOIST-AT ?auto_36019 ?auto_36017 ) ( not ( = ?auto_36021 ?auto_36019 ) ) ( not ( = ?auto_36015 ?auto_36019 ) ) ( not ( = ?auto_36020 ?auto_36019 ) ) ( AVAILABLE ?auto_36019 ) ( SURFACE-AT ?auto_36007 ?auto_36017 ) ( ON ?auto_36007 ?auto_36013 ) ( CLEAR ?auto_36007 ) ( not ( = ?auto_36008 ?auto_36013 ) ) ( not ( = ?auto_36009 ?auto_36013 ) ) ( not ( = ?auto_36007 ?auto_36013 ) ) ( not ( = ?auto_36016 ?auto_36013 ) ) ( not ( = ?auto_36012 ?auto_36013 ) ) ( not ( = ?auto_36011 ?auto_36013 ) ) ( SURFACE-AT ?auto_36014 ?auto_36022 ) ( CLEAR ?auto_36014 ) ( IS-CRATE ?auto_36011 ) ( not ( = ?auto_36014 ?auto_36011 ) ) ( not ( = ?auto_36008 ?auto_36014 ) ) ( not ( = ?auto_36009 ?auto_36014 ) ) ( not ( = ?auto_36007 ?auto_36014 ) ) ( not ( = ?auto_36016 ?auto_36014 ) ) ( not ( = ?auto_36012 ?auto_36014 ) ) ( not ( = ?auto_36013 ?auto_36014 ) ) ( AVAILABLE ?auto_36021 ) ( TRUCK-AT ?auto_36010 ?auto_36023 ) ( LIFTING ?auto_36015 ?auto_36011 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36008 ?auto_36009 )
      ( MAKE-2CRATE-VERIFY ?auto_36007 ?auto_36008 ?auto_36009 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36024 - SURFACE
      ?auto_36025 - SURFACE
      ?auto_36026 - SURFACE
      ?auto_36027 - SURFACE
    )
    :vars
    (
      ?auto_36035 - HOIST
      ?auto_36040 - PLACE
      ?auto_36029 - PLACE
      ?auto_36034 - HOIST
      ?auto_36031 - SURFACE
      ?auto_36038 - PLACE
      ?auto_36028 - HOIST
      ?auto_36036 - SURFACE
      ?auto_36033 - PLACE
      ?auto_36037 - HOIST
      ?auto_36030 - SURFACE
      ?auto_36032 - SURFACE
      ?auto_36039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36035 ?auto_36040 ) ( IS-CRATE ?auto_36027 ) ( not ( = ?auto_36026 ?auto_36027 ) ) ( not ( = ?auto_36025 ?auto_36026 ) ) ( not ( = ?auto_36025 ?auto_36027 ) ) ( not ( = ?auto_36029 ?auto_36040 ) ) ( HOIST-AT ?auto_36034 ?auto_36029 ) ( not ( = ?auto_36035 ?auto_36034 ) ) ( SURFACE-AT ?auto_36027 ?auto_36029 ) ( ON ?auto_36027 ?auto_36031 ) ( CLEAR ?auto_36027 ) ( not ( = ?auto_36026 ?auto_36031 ) ) ( not ( = ?auto_36027 ?auto_36031 ) ) ( not ( = ?auto_36025 ?auto_36031 ) ) ( IS-CRATE ?auto_36026 ) ( not ( = ?auto_36038 ?auto_36040 ) ) ( not ( = ?auto_36029 ?auto_36038 ) ) ( HOIST-AT ?auto_36028 ?auto_36038 ) ( not ( = ?auto_36035 ?auto_36028 ) ) ( not ( = ?auto_36034 ?auto_36028 ) ) ( AVAILABLE ?auto_36028 ) ( SURFACE-AT ?auto_36026 ?auto_36038 ) ( ON ?auto_36026 ?auto_36036 ) ( CLEAR ?auto_36026 ) ( not ( = ?auto_36026 ?auto_36036 ) ) ( not ( = ?auto_36027 ?auto_36036 ) ) ( not ( = ?auto_36025 ?auto_36036 ) ) ( not ( = ?auto_36031 ?auto_36036 ) ) ( IS-CRATE ?auto_36025 ) ( not ( = ?auto_36024 ?auto_36025 ) ) ( not ( = ?auto_36026 ?auto_36024 ) ) ( not ( = ?auto_36027 ?auto_36024 ) ) ( not ( = ?auto_36031 ?auto_36024 ) ) ( not ( = ?auto_36036 ?auto_36024 ) ) ( not ( = ?auto_36033 ?auto_36040 ) ) ( not ( = ?auto_36029 ?auto_36033 ) ) ( not ( = ?auto_36038 ?auto_36033 ) ) ( HOIST-AT ?auto_36037 ?auto_36033 ) ( not ( = ?auto_36035 ?auto_36037 ) ) ( not ( = ?auto_36034 ?auto_36037 ) ) ( not ( = ?auto_36028 ?auto_36037 ) ) ( AVAILABLE ?auto_36037 ) ( SURFACE-AT ?auto_36025 ?auto_36033 ) ( ON ?auto_36025 ?auto_36030 ) ( CLEAR ?auto_36025 ) ( not ( = ?auto_36026 ?auto_36030 ) ) ( not ( = ?auto_36027 ?auto_36030 ) ) ( not ( = ?auto_36025 ?auto_36030 ) ) ( not ( = ?auto_36031 ?auto_36030 ) ) ( not ( = ?auto_36036 ?auto_36030 ) ) ( not ( = ?auto_36024 ?auto_36030 ) ) ( SURFACE-AT ?auto_36032 ?auto_36040 ) ( CLEAR ?auto_36032 ) ( IS-CRATE ?auto_36024 ) ( not ( = ?auto_36032 ?auto_36024 ) ) ( not ( = ?auto_36026 ?auto_36032 ) ) ( not ( = ?auto_36027 ?auto_36032 ) ) ( not ( = ?auto_36025 ?auto_36032 ) ) ( not ( = ?auto_36031 ?auto_36032 ) ) ( not ( = ?auto_36036 ?auto_36032 ) ) ( not ( = ?auto_36030 ?auto_36032 ) ) ( AVAILABLE ?auto_36035 ) ( TRUCK-AT ?auto_36039 ?auto_36029 ) ( LIFTING ?auto_36034 ?auto_36024 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36025 ?auto_36026 ?auto_36027 )
      ( MAKE-3CRATE-VERIFY ?auto_36024 ?auto_36025 ?auto_36026 ?auto_36027 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36041 - SURFACE
      ?auto_36042 - SURFACE
      ?auto_36043 - SURFACE
      ?auto_36044 - SURFACE
      ?auto_36045 - SURFACE
    )
    :vars
    (
      ?auto_36052 - HOIST
      ?auto_36057 - PLACE
      ?auto_36047 - PLACE
      ?auto_36051 - HOIST
      ?auto_36049 - SURFACE
      ?auto_36055 - PLACE
      ?auto_36046 - HOIST
      ?auto_36053 - SURFACE
      ?auto_36050 - PLACE
      ?auto_36054 - HOIST
      ?auto_36048 - SURFACE
      ?auto_36056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36052 ?auto_36057 ) ( IS-CRATE ?auto_36045 ) ( not ( = ?auto_36044 ?auto_36045 ) ) ( not ( = ?auto_36043 ?auto_36044 ) ) ( not ( = ?auto_36043 ?auto_36045 ) ) ( not ( = ?auto_36047 ?auto_36057 ) ) ( HOIST-AT ?auto_36051 ?auto_36047 ) ( not ( = ?auto_36052 ?auto_36051 ) ) ( SURFACE-AT ?auto_36045 ?auto_36047 ) ( ON ?auto_36045 ?auto_36049 ) ( CLEAR ?auto_36045 ) ( not ( = ?auto_36044 ?auto_36049 ) ) ( not ( = ?auto_36045 ?auto_36049 ) ) ( not ( = ?auto_36043 ?auto_36049 ) ) ( IS-CRATE ?auto_36044 ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36047 ?auto_36055 ) ) ( HOIST-AT ?auto_36046 ?auto_36055 ) ( not ( = ?auto_36052 ?auto_36046 ) ) ( not ( = ?auto_36051 ?auto_36046 ) ) ( AVAILABLE ?auto_36046 ) ( SURFACE-AT ?auto_36044 ?auto_36055 ) ( ON ?auto_36044 ?auto_36053 ) ( CLEAR ?auto_36044 ) ( not ( = ?auto_36044 ?auto_36053 ) ) ( not ( = ?auto_36045 ?auto_36053 ) ) ( not ( = ?auto_36043 ?auto_36053 ) ) ( not ( = ?auto_36049 ?auto_36053 ) ) ( IS-CRATE ?auto_36043 ) ( not ( = ?auto_36042 ?auto_36043 ) ) ( not ( = ?auto_36044 ?auto_36042 ) ) ( not ( = ?auto_36045 ?auto_36042 ) ) ( not ( = ?auto_36049 ?auto_36042 ) ) ( not ( = ?auto_36053 ?auto_36042 ) ) ( not ( = ?auto_36050 ?auto_36057 ) ) ( not ( = ?auto_36047 ?auto_36050 ) ) ( not ( = ?auto_36055 ?auto_36050 ) ) ( HOIST-AT ?auto_36054 ?auto_36050 ) ( not ( = ?auto_36052 ?auto_36054 ) ) ( not ( = ?auto_36051 ?auto_36054 ) ) ( not ( = ?auto_36046 ?auto_36054 ) ) ( AVAILABLE ?auto_36054 ) ( SURFACE-AT ?auto_36043 ?auto_36050 ) ( ON ?auto_36043 ?auto_36048 ) ( CLEAR ?auto_36043 ) ( not ( = ?auto_36044 ?auto_36048 ) ) ( not ( = ?auto_36045 ?auto_36048 ) ) ( not ( = ?auto_36043 ?auto_36048 ) ) ( not ( = ?auto_36049 ?auto_36048 ) ) ( not ( = ?auto_36053 ?auto_36048 ) ) ( not ( = ?auto_36042 ?auto_36048 ) ) ( SURFACE-AT ?auto_36041 ?auto_36057 ) ( CLEAR ?auto_36041 ) ( IS-CRATE ?auto_36042 ) ( not ( = ?auto_36041 ?auto_36042 ) ) ( not ( = ?auto_36044 ?auto_36041 ) ) ( not ( = ?auto_36045 ?auto_36041 ) ) ( not ( = ?auto_36043 ?auto_36041 ) ) ( not ( = ?auto_36049 ?auto_36041 ) ) ( not ( = ?auto_36053 ?auto_36041 ) ) ( not ( = ?auto_36048 ?auto_36041 ) ) ( AVAILABLE ?auto_36052 ) ( TRUCK-AT ?auto_36056 ?auto_36047 ) ( LIFTING ?auto_36051 ?auto_36042 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36043 ?auto_36044 ?auto_36045 )
      ( MAKE-4CRATE-VERIFY ?auto_36041 ?auto_36042 ?auto_36043 ?auto_36044 ?auto_36045 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36058 - SURFACE
      ?auto_36059 - SURFACE
      ?auto_36060 - SURFACE
      ?auto_36061 - SURFACE
      ?auto_36062 - SURFACE
      ?auto_36063 - SURFACE
    )
    :vars
    (
      ?auto_36070 - HOIST
      ?auto_36075 - PLACE
      ?auto_36065 - PLACE
      ?auto_36069 - HOIST
      ?auto_36067 - SURFACE
      ?auto_36073 - PLACE
      ?auto_36064 - HOIST
      ?auto_36071 - SURFACE
      ?auto_36068 - PLACE
      ?auto_36072 - HOIST
      ?auto_36066 - SURFACE
      ?auto_36074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36070 ?auto_36075 ) ( IS-CRATE ?auto_36063 ) ( not ( = ?auto_36062 ?auto_36063 ) ) ( not ( = ?auto_36061 ?auto_36062 ) ) ( not ( = ?auto_36061 ?auto_36063 ) ) ( not ( = ?auto_36065 ?auto_36075 ) ) ( HOIST-AT ?auto_36069 ?auto_36065 ) ( not ( = ?auto_36070 ?auto_36069 ) ) ( SURFACE-AT ?auto_36063 ?auto_36065 ) ( ON ?auto_36063 ?auto_36067 ) ( CLEAR ?auto_36063 ) ( not ( = ?auto_36062 ?auto_36067 ) ) ( not ( = ?auto_36063 ?auto_36067 ) ) ( not ( = ?auto_36061 ?auto_36067 ) ) ( IS-CRATE ?auto_36062 ) ( not ( = ?auto_36073 ?auto_36075 ) ) ( not ( = ?auto_36065 ?auto_36073 ) ) ( HOIST-AT ?auto_36064 ?auto_36073 ) ( not ( = ?auto_36070 ?auto_36064 ) ) ( not ( = ?auto_36069 ?auto_36064 ) ) ( AVAILABLE ?auto_36064 ) ( SURFACE-AT ?auto_36062 ?auto_36073 ) ( ON ?auto_36062 ?auto_36071 ) ( CLEAR ?auto_36062 ) ( not ( = ?auto_36062 ?auto_36071 ) ) ( not ( = ?auto_36063 ?auto_36071 ) ) ( not ( = ?auto_36061 ?auto_36071 ) ) ( not ( = ?auto_36067 ?auto_36071 ) ) ( IS-CRATE ?auto_36061 ) ( not ( = ?auto_36060 ?auto_36061 ) ) ( not ( = ?auto_36062 ?auto_36060 ) ) ( not ( = ?auto_36063 ?auto_36060 ) ) ( not ( = ?auto_36067 ?auto_36060 ) ) ( not ( = ?auto_36071 ?auto_36060 ) ) ( not ( = ?auto_36068 ?auto_36075 ) ) ( not ( = ?auto_36065 ?auto_36068 ) ) ( not ( = ?auto_36073 ?auto_36068 ) ) ( HOIST-AT ?auto_36072 ?auto_36068 ) ( not ( = ?auto_36070 ?auto_36072 ) ) ( not ( = ?auto_36069 ?auto_36072 ) ) ( not ( = ?auto_36064 ?auto_36072 ) ) ( AVAILABLE ?auto_36072 ) ( SURFACE-AT ?auto_36061 ?auto_36068 ) ( ON ?auto_36061 ?auto_36066 ) ( CLEAR ?auto_36061 ) ( not ( = ?auto_36062 ?auto_36066 ) ) ( not ( = ?auto_36063 ?auto_36066 ) ) ( not ( = ?auto_36061 ?auto_36066 ) ) ( not ( = ?auto_36067 ?auto_36066 ) ) ( not ( = ?auto_36071 ?auto_36066 ) ) ( not ( = ?auto_36060 ?auto_36066 ) ) ( SURFACE-AT ?auto_36059 ?auto_36075 ) ( CLEAR ?auto_36059 ) ( IS-CRATE ?auto_36060 ) ( not ( = ?auto_36059 ?auto_36060 ) ) ( not ( = ?auto_36062 ?auto_36059 ) ) ( not ( = ?auto_36063 ?auto_36059 ) ) ( not ( = ?auto_36061 ?auto_36059 ) ) ( not ( = ?auto_36067 ?auto_36059 ) ) ( not ( = ?auto_36071 ?auto_36059 ) ) ( not ( = ?auto_36066 ?auto_36059 ) ) ( AVAILABLE ?auto_36070 ) ( TRUCK-AT ?auto_36074 ?auto_36065 ) ( LIFTING ?auto_36069 ?auto_36060 ) ( ON ?auto_36059 ?auto_36058 ) ( not ( = ?auto_36058 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36060 ) ) ( not ( = ?auto_36058 ?auto_36061 ) ) ( not ( = ?auto_36058 ?auto_36062 ) ) ( not ( = ?auto_36058 ?auto_36063 ) ) ( not ( = ?auto_36058 ?auto_36067 ) ) ( not ( = ?auto_36058 ?auto_36071 ) ) ( not ( = ?auto_36058 ?auto_36066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36061 ?auto_36062 ?auto_36063 )
      ( MAKE-5CRATE-VERIFY ?auto_36058 ?auto_36059 ?auto_36060 ?auto_36061 ?auto_36062 ?auto_36063 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36076 - SURFACE
      ?auto_36077 - SURFACE
    )
    :vars
    (
      ?auto_36086 - HOIST
      ?auto_36092 - PLACE
      ?auto_36088 - SURFACE
      ?auto_36079 - PLACE
      ?auto_36085 - HOIST
      ?auto_36081 - SURFACE
      ?auto_36090 - PLACE
      ?auto_36078 - HOIST
      ?auto_36087 - SURFACE
      ?auto_36083 - SURFACE
      ?auto_36084 - PLACE
      ?auto_36089 - HOIST
      ?auto_36080 - SURFACE
      ?auto_36082 - SURFACE
      ?auto_36091 - TRUCK
      ?auto_36093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36086 ?auto_36092 ) ( IS-CRATE ?auto_36077 ) ( not ( = ?auto_36076 ?auto_36077 ) ) ( not ( = ?auto_36088 ?auto_36076 ) ) ( not ( = ?auto_36088 ?auto_36077 ) ) ( not ( = ?auto_36079 ?auto_36092 ) ) ( HOIST-AT ?auto_36085 ?auto_36079 ) ( not ( = ?auto_36086 ?auto_36085 ) ) ( SURFACE-AT ?auto_36077 ?auto_36079 ) ( ON ?auto_36077 ?auto_36081 ) ( CLEAR ?auto_36077 ) ( not ( = ?auto_36076 ?auto_36081 ) ) ( not ( = ?auto_36077 ?auto_36081 ) ) ( not ( = ?auto_36088 ?auto_36081 ) ) ( IS-CRATE ?auto_36076 ) ( not ( = ?auto_36090 ?auto_36092 ) ) ( not ( = ?auto_36079 ?auto_36090 ) ) ( HOIST-AT ?auto_36078 ?auto_36090 ) ( not ( = ?auto_36086 ?auto_36078 ) ) ( not ( = ?auto_36085 ?auto_36078 ) ) ( AVAILABLE ?auto_36078 ) ( SURFACE-AT ?auto_36076 ?auto_36090 ) ( ON ?auto_36076 ?auto_36087 ) ( CLEAR ?auto_36076 ) ( not ( = ?auto_36076 ?auto_36087 ) ) ( not ( = ?auto_36077 ?auto_36087 ) ) ( not ( = ?auto_36088 ?auto_36087 ) ) ( not ( = ?auto_36081 ?auto_36087 ) ) ( IS-CRATE ?auto_36088 ) ( not ( = ?auto_36083 ?auto_36088 ) ) ( not ( = ?auto_36076 ?auto_36083 ) ) ( not ( = ?auto_36077 ?auto_36083 ) ) ( not ( = ?auto_36081 ?auto_36083 ) ) ( not ( = ?auto_36087 ?auto_36083 ) ) ( not ( = ?auto_36084 ?auto_36092 ) ) ( not ( = ?auto_36079 ?auto_36084 ) ) ( not ( = ?auto_36090 ?auto_36084 ) ) ( HOIST-AT ?auto_36089 ?auto_36084 ) ( not ( = ?auto_36086 ?auto_36089 ) ) ( not ( = ?auto_36085 ?auto_36089 ) ) ( not ( = ?auto_36078 ?auto_36089 ) ) ( AVAILABLE ?auto_36089 ) ( SURFACE-AT ?auto_36088 ?auto_36084 ) ( ON ?auto_36088 ?auto_36080 ) ( CLEAR ?auto_36088 ) ( not ( = ?auto_36076 ?auto_36080 ) ) ( not ( = ?auto_36077 ?auto_36080 ) ) ( not ( = ?auto_36088 ?auto_36080 ) ) ( not ( = ?auto_36081 ?auto_36080 ) ) ( not ( = ?auto_36087 ?auto_36080 ) ) ( not ( = ?auto_36083 ?auto_36080 ) ) ( SURFACE-AT ?auto_36082 ?auto_36092 ) ( CLEAR ?auto_36082 ) ( IS-CRATE ?auto_36083 ) ( not ( = ?auto_36082 ?auto_36083 ) ) ( not ( = ?auto_36076 ?auto_36082 ) ) ( not ( = ?auto_36077 ?auto_36082 ) ) ( not ( = ?auto_36088 ?auto_36082 ) ) ( not ( = ?auto_36081 ?auto_36082 ) ) ( not ( = ?auto_36087 ?auto_36082 ) ) ( not ( = ?auto_36080 ?auto_36082 ) ) ( AVAILABLE ?auto_36086 ) ( TRUCK-AT ?auto_36091 ?auto_36079 ) ( AVAILABLE ?auto_36085 ) ( SURFACE-AT ?auto_36083 ?auto_36079 ) ( ON ?auto_36083 ?auto_36093 ) ( CLEAR ?auto_36083 ) ( not ( = ?auto_36076 ?auto_36093 ) ) ( not ( = ?auto_36077 ?auto_36093 ) ) ( not ( = ?auto_36088 ?auto_36093 ) ) ( not ( = ?auto_36081 ?auto_36093 ) ) ( not ( = ?auto_36087 ?auto_36093 ) ) ( not ( = ?auto_36083 ?auto_36093 ) ) ( not ( = ?auto_36080 ?auto_36093 ) ) ( not ( = ?auto_36082 ?auto_36093 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36085 ?auto_36083 ?auto_36093 ?auto_36079 )
      ( MAKE-2CRATE ?auto_36088 ?auto_36076 ?auto_36077 )
      ( MAKE-1CRATE-VERIFY ?auto_36076 ?auto_36077 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36094 - SURFACE
      ?auto_36095 - SURFACE
      ?auto_36096 - SURFACE
    )
    :vars
    (
      ?auto_36100 - HOIST
      ?auto_36097 - PLACE
      ?auto_36107 - PLACE
      ?auto_36108 - HOIST
      ?auto_36101 - SURFACE
      ?auto_36098 - PLACE
      ?auto_36106 - HOIST
      ?auto_36111 - SURFACE
      ?auto_36102 - SURFACE
      ?auto_36099 - PLACE
      ?auto_36104 - HOIST
      ?auto_36110 - SURFACE
      ?auto_36105 - SURFACE
      ?auto_36103 - TRUCK
      ?auto_36109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36100 ?auto_36097 ) ( IS-CRATE ?auto_36096 ) ( not ( = ?auto_36095 ?auto_36096 ) ) ( not ( = ?auto_36094 ?auto_36095 ) ) ( not ( = ?auto_36094 ?auto_36096 ) ) ( not ( = ?auto_36107 ?auto_36097 ) ) ( HOIST-AT ?auto_36108 ?auto_36107 ) ( not ( = ?auto_36100 ?auto_36108 ) ) ( SURFACE-AT ?auto_36096 ?auto_36107 ) ( ON ?auto_36096 ?auto_36101 ) ( CLEAR ?auto_36096 ) ( not ( = ?auto_36095 ?auto_36101 ) ) ( not ( = ?auto_36096 ?auto_36101 ) ) ( not ( = ?auto_36094 ?auto_36101 ) ) ( IS-CRATE ?auto_36095 ) ( not ( = ?auto_36098 ?auto_36097 ) ) ( not ( = ?auto_36107 ?auto_36098 ) ) ( HOIST-AT ?auto_36106 ?auto_36098 ) ( not ( = ?auto_36100 ?auto_36106 ) ) ( not ( = ?auto_36108 ?auto_36106 ) ) ( AVAILABLE ?auto_36106 ) ( SURFACE-AT ?auto_36095 ?auto_36098 ) ( ON ?auto_36095 ?auto_36111 ) ( CLEAR ?auto_36095 ) ( not ( = ?auto_36095 ?auto_36111 ) ) ( not ( = ?auto_36096 ?auto_36111 ) ) ( not ( = ?auto_36094 ?auto_36111 ) ) ( not ( = ?auto_36101 ?auto_36111 ) ) ( IS-CRATE ?auto_36094 ) ( not ( = ?auto_36102 ?auto_36094 ) ) ( not ( = ?auto_36095 ?auto_36102 ) ) ( not ( = ?auto_36096 ?auto_36102 ) ) ( not ( = ?auto_36101 ?auto_36102 ) ) ( not ( = ?auto_36111 ?auto_36102 ) ) ( not ( = ?auto_36099 ?auto_36097 ) ) ( not ( = ?auto_36107 ?auto_36099 ) ) ( not ( = ?auto_36098 ?auto_36099 ) ) ( HOIST-AT ?auto_36104 ?auto_36099 ) ( not ( = ?auto_36100 ?auto_36104 ) ) ( not ( = ?auto_36108 ?auto_36104 ) ) ( not ( = ?auto_36106 ?auto_36104 ) ) ( AVAILABLE ?auto_36104 ) ( SURFACE-AT ?auto_36094 ?auto_36099 ) ( ON ?auto_36094 ?auto_36110 ) ( CLEAR ?auto_36094 ) ( not ( = ?auto_36095 ?auto_36110 ) ) ( not ( = ?auto_36096 ?auto_36110 ) ) ( not ( = ?auto_36094 ?auto_36110 ) ) ( not ( = ?auto_36101 ?auto_36110 ) ) ( not ( = ?auto_36111 ?auto_36110 ) ) ( not ( = ?auto_36102 ?auto_36110 ) ) ( SURFACE-AT ?auto_36105 ?auto_36097 ) ( CLEAR ?auto_36105 ) ( IS-CRATE ?auto_36102 ) ( not ( = ?auto_36105 ?auto_36102 ) ) ( not ( = ?auto_36095 ?auto_36105 ) ) ( not ( = ?auto_36096 ?auto_36105 ) ) ( not ( = ?auto_36094 ?auto_36105 ) ) ( not ( = ?auto_36101 ?auto_36105 ) ) ( not ( = ?auto_36111 ?auto_36105 ) ) ( not ( = ?auto_36110 ?auto_36105 ) ) ( AVAILABLE ?auto_36100 ) ( TRUCK-AT ?auto_36103 ?auto_36107 ) ( AVAILABLE ?auto_36108 ) ( SURFACE-AT ?auto_36102 ?auto_36107 ) ( ON ?auto_36102 ?auto_36109 ) ( CLEAR ?auto_36102 ) ( not ( = ?auto_36095 ?auto_36109 ) ) ( not ( = ?auto_36096 ?auto_36109 ) ) ( not ( = ?auto_36094 ?auto_36109 ) ) ( not ( = ?auto_36101 ?auto_36109 ) ) ( not ( = ?auto_36111 ?auto_36109 ) ) ( not ( = ?auto_36102 ?auto_36109 ) ) ( not ( = ?auto_36110 ?auto_36109 ) ) ( not ( = ?auto_36105 ?auto_36109 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36095 ?auto_36096 )
      ( MAKE-2CRATE-VERIFY ?auto_36094 ?auto_36095 ?auto_36096 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36112 - SURFACE
      ?auto_36113 - SURFACE
      ?auto_36114 - SURFACE
      ?auto_36115 - SURFACE
    )
    :vars
    (
      ?auto_36117 - HOIST
      ?auto_36123 - PLACE
      ?auto_36124 - PLACE
      ?auto_36127 - HOIST
      ?auto_36125 - SURFACE
      ?auto_36129 - PLACE
      ?auto_36126 - HOIST
      ?auto_36119 - SURFACE
      ?auto_36116 - PLACE
      ?auto_36121 - HOIST
      ?auto_36128 - SURFACE
      ?auto_36120 - SURFACE
      ?auto_36118 - TRUCK
      ?auto_36122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36117 ?auto_36123 ) ( IS-CRATE ?auto_36115 ) ( not ( = ?auto_36114 ?auto_36115 ) ) ( not ( = ?auto_36113 ?auto_36114 ) ) ( not ( = ?auto_36113 ?auto_36115 ) ) ( not ( = ?auto_36124 ?auto_36123 ) ) ( HOIST-AT ?auto_36127 ?auto_36124 ) ( not ( = ?auto_36117 ?auto_36127 ) ) ( SURFACE-AT ?auto_36115 ?auto_36124 ) ( ON ?auto_36115 ?auto_36125 ) ( CLEAR ?auto_36115 ) ( not ( = ?auto_36114 ?auto_36125 ) ) ( not ( = ?auto_36115 ?auto_36125 ) ) ( not ( = ?auto_36113 ?auto_36125 ) ) ( IS-CRATE ?auto_36114 ) ( not ( = ?auto_36129 ?auto_36123 ) ) ( not ( = ?auto_36124 ?auto_36129 ) ) ( HOIST-AT ?auto_36126 ?auto_36129 ) ( not ( = ?auto_36117 ?auto_36126 ) ) ( not ( = ?auto_36127 ?auto_36126 ) ) ( AVAILABLE ?auto_36126 ) ( SURFACE-AT ?auto_36114 ?auto_36129 ) ( ON ?auto_36114 ?auto_36119 ) ( CLEAR ?auto_36114 ) ( not ( = ?auto_36114 ?auto_36119 ) ) ( not ( = ?auto_36115 ?auto_36119 ) ) ( not ( = ?auto_36113 ?auto_36119 ) ) ( not ( = ?auto_36125 ?auto_36119 ) ) ( IS-CRATE ?auto_36113 ) ( not ( = ?auto_36112 ?auto_36113 ) ) ( not ( = ?auto_36114 ?auto_36112 ) ) ( not ( = ?auto_36115 ?auto_36112 ) ) ( not ( = ?auto_36125 ?auto_36112 ) ) ( not ( = ?auto_36119 ?auto_36112 ) ) ( not ( = ?auto_36116 ?auto_36123 ) ) ( not ( = ?auto_36124 ?auto_36116 ) ) ( not ( = ?auto_36129 ?auto_36116 ) ) ( HOIST-AT ?auto_36121 ?auto_36116 ) ( not ( = ?auto_36117 ?auto_36121 ) ) ( not ( = ?auto_36127 ?auto_36121 ) ) ( not ( = ?auto_36126 ?auto_36121 ) ) ( AVAILABLE ?auto_36121 ) ( SURFACE-AT ?auto_36113 ?auto_36116 ) ( ON ?auto_36113 ?auto_36128 ) ( CLEAR ?auto_36113 ) ( not ( = ?auto_36114 ?auto_36128 ) ) ( not ( = ?auto_36115 ?auto_36128 ) ) ( not ( = ?auto_36113 ?auto_36128 ) ) ( not ( = ?auto_36125 ?auto_36128 ) ) ( not ( = ?auto_36119 ?auto_36128 ) ) ( not ( = ?auto_36112 ?auto_36128 ) ) ( SURFACE-AT ?auto_36120 ?auto_36123 ) ( CLEAR ?auto_36120 ) ( IS-CRATE ?auto_36112 ) ( not ( = ?auto_36120 ?auto_36112 ) ) ( not ( = ?auto_36114 ?auto_36120 ) ) ( not ( = ?auto_36115 ?auto_36120 ) ) ( not ( = ?auto_36113 ?auto_36120 ) ) ( not ( = ?auto_36125 ?auto_36120 ) ) ( not ( = ?auto_36119 ?auto_36120 ) ) ( not ( = ?auto_36128 ?auto_36120 ) ) ( AVAILABLE ?auto_36117 ) ( TRUCK-AT ?auto_36118 ?auto_36124 ) ( AVAILABLE ?auto_36127 ) ( SURFACE-AT ?auto_36112 ?auto_36124 ) ( ON ?auto_36112 ?auto_36122 ) ( CLEAR ?auto_36112 ) ( not ( = ?auto_36114 ?auto_36122 ) ) ( not ( = ?auto_36115 ?auto_36122 ) ) ( not ( = ?auto_36113 ?auto_36122 ) ) ( not ( = ?auto_36125 ?auto_36122 ) ) ( not ( = ?auto_36119 ?auto_36122 ) ) ( not ( = ?auto_36112 ?auto_36122 ) ) ( not ( = ?auto_36128 ?auto_36122 ) ) ( not ( = ?auto_36120 ?auto_36122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36113 ?auto_36114 ?auto_36115 )
      ( MAKE-3CRATE-VERIFY ?auto_36112 ?auto_36113 ?auto_36114 ?auto_36115 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36130 - SURFACE
      ?auto_36131 - SURFACE
      ?auto_36132 - SURFACE
      ?auto_36133 - SURFACE
      ?auto_36134 - SURFACE
    )
    :vars
    (
      ?auto_36136 - HOIST
      ?auto_36141 - PLACE
      ?auto_36142 - PLACE
      ?auto_36145 - HOIST
      ?auto_36143 - SURFACE
      ?auto_36147 - PLACE
      ?auto_36144 - HOIST
      ?auto_36138 - SURFACE
      ?auto_36135 - PLACE
      ?auto_36139 - HOIST
      ?auto_36146 - SURFACE
      ?auto_36137 - TRUCK
      ?auto_36140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36136 ?auto_36141 ) ( IS-CRATE ?auto_36134 ) ( not ( = ?auto_36133 ?auto_36134 ) ) ( not ( = ?auto_36132 ?auto_36133 ) ) ( not ( = ?auto_36132 ?auto_36134 ) ) ( not ( = ?auto_36142 ?auto_36141 ) ) ( HOIST-AT ?auto_36145 ?auto_36142 ) ( not ( = ?auto_36136 ?auto_36145 ) ) ( SURFACE-AT ?auto_36134 ?auto_36142 ) ( ON ?auto_36134 ?auto_36143 ) ( CLEAR ?auto_36134 ) ( not ( = ?auto_36133 ?auto_36143 ) ) ( not ( = ?auto_36134 ?auto_36143 ) ) ( not ( = ?auto_36132 ?auto_36143 ) ) ( IS-CRATE ?auto_36133 ) ( not ( = ?auto_36147 ?auto_36141 ) ) ( not ( = ?auto_36142 ?auto_36147 ) ) ( HOIST-AT ?auto_36144 ?auto_36147 ) ( not ( = ?auto_36136 ?auto_36144 ) ) ( not ( = ?auto_36145 ?auto_36144 ) ) ( AVAILABLE ?auto_36144 ) ( SURFACE-AT ?auto_36133 ?auto_36147 ) ( ON ?auto_36133 ?auto_36138 ) ( CLEAR ?auto_36133 ) ( not ( = ?auto_36133 ?auto_36138 ) ) ( not ( = ?auto_36134 ?auto_36138 ) ) ( not ( = ?auto_36132 ?auto_36138 ) ) ( not ( = ?auto_36143 ?auto_36138 ) ) ( IS-CRATE ?auto_36132 ) ( not ( = ?auto_36131 ?auto_36132 ) ) ( not ( = ?auto_36133 ?auto_36131 ) ) ( not ( = ?auto_36134 ?auto_36131 ) ) ( not ( = ?auto_36143 ?auto_36131 ) ) ( not ( = ?auto_36138 ?auto_36131 ) ) ( not ( = ?auto_36135 ?auto_36141 ) ) ( not ( = ?auto_36142 ?auto_36135 ) ) ( not ( = ?auto_36147 ?auto_36135 ) ) ( HOIST-AT ?auto_36139 ?auto_36135 ) ( not ( = ?auto_36136 ?auto_36139 ) ) ( not ( = ?auto_36145 ?auto_36139 ) ) ( not ( = ?auto_36144 ?auto_36139 ) ) ( AVAILABLE ?auto_36139 ) ( SURFACE-AT ?auto_36132 ?auto_36135 ) ( ON ?auto_36132 ?auto_36146 ) ( CLEAR ?auto_36132 ) ( not ( = ?auto_36133 ?auto_36146 ) ) ( not ( = ?auto_36134 ?auto_36146 ) ) ( not ( = ?auto_36132 ?auto_36146 ) ) ( not ( = ?auto_36143 ?auto_36146 ) ) ( not ( = ?auto_36138 ?auto_36146 ) ) ( not ( = ?auto_36131 ?auto_36146 ) ) ( SURFACE-AT ?auto_36130 ?auto_36141 ) ( CLEAR ?auto_36130 ) ( IS-CRATE ?auto_36131 ) ( not ( = ?auto_36130 ?auto_36131 ) ) ( not ( = ?auto_36133 ?auto_36130 ) ) ( not ( = ?auto_36134 ?auto_36130 ) ) ( not ( = ?auto_36132 ?auto_36130 ) ) ( not ( = ?auto_36143 ?auto_36130 ) ) ( not ( = ?auto_36138 ?auto_36130 ) ) ( not ( = ?auto_36146 ?auto_36130 ) ) ( AVAILABLE ?auto_36136 ) ( TRUCK-AT ?auto_36137 ?auto_36142 ) ( AVAILABLE ?auto_36145 ) ( SURFACE-AT ?auto_36131 ?auto_36142 ) ( ON ?auto_36131 ?auto_36140 ) ( CLEAR ?auto_36131 ) ( not ( = ?auto_36133 ?auto_36140 ) ) ( not ( = ?auto_36134 ?auto_36140 ) ) ( not ( = ?auto_36132 ?auto_36140 ) ) ( not ( = ?auto_36143 ?auto_36140 ) ) ( not ( = ?auto_36138 ?auto_36140 ) ) ( not ( = ?auto_36131 ?auto_36140 ) ) ( not ( = ?auto_36146 ?auto_36140 ) ) ( not ( = ?auto_36130 ?auto_36140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36132 ?auto_36133 ?auto_36134 )
      ( MAKE-4CRATE-VERIFY ?auto_36130 ?auto_36131 ?auto_36132 ?auto_36133 ?auto_36134 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36148 - SURFACE
      ?auto_36149 - SURFACE
      ?auto_36150 - SURFACE
      ?auto_36151 - SURFACE
      ?auto_36152 - SURFACE
      ?auto_36153 - SURFACE
    )
    :vars
    (
      ?auto_36155 - HOIST
      ?auto_36160 - PLACE
      ?auto_36161 - PLACE
      ?auto_36164 - HOIST
      ?auto_36162 - SURFACE
      ?auto_36166 - PLACE
      ?auto_36163 - HOIST
      ?auto_36157 - SURFACE
      ?auto_36154 - PLACE
      ?auto_36158 - HOIST
      ?auto_36165 - SURFACE
      ?auto_36156 - TRUCK
      ?auto_36159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36155 ?auto_36160 ) ( IS-CRATE ?auto_36153 ) ( not ( = ?auto_36152 ?auto_36153 ) ) ( not ( = ?auto_36151 ?auto_36152 ) ) ( not ( = ?auto_36151 ?auto_36153 ) ) ( not ( = ?auto_36161 ?auto_36160 ) ) ( HOIST-AT ?auto_36164 ?auto_36161 ) ( not ( = ?auto_36155 ?auto_36164 ) ) ( SURFACE-AT ?auto_36153 ?auto_36161 ) ( ON ?auto_36153 ?auto_36162 ) ( CLEAR ?auto_36153 ) ( not ( = ?auto_36152 ?auto_36162 ) ) ( not ( = ?auto_36153 ?auto_36162 ) ) ( not ( = ?auto_36151 ?auto_36162 ) ) ( IS-CRATE ?auto_36152 ) ( not ( = ?auto_36166 ?auto_36160 ) ) ( not ( = ?auto_36161 ?auto_36166 ) ) ( HOIST-AT ?auto_36163 ?auto_36166 ) ( not ( = ?auto_36155 ?auto_36163 ) ) ( not ( = ?auto_36164 ?auto_36163 ) ) ( AVAILABLE ?auto_36163 ) ( SURFACE-AT ?auto_36152 ?auto_36166 ) ( ON ?auto_36152 ?auto_36157 ) ( CLEAR ?auto_36152 ) ( not ( = ?auto_36152 ?auto_36157 ) ) ( not ( = ?auto_36153 ?auto_36157 ) ) ( not ( = ?auto_36151 ?auto_36157 ) ) ( not ( = ?auto_36162 ?auto_36157 ) ) ( IS-CRATE ?auto_36151 ) ( not ( = ?auto_36150 ?auto_36151 ) ) ( not ( = ?auto_36152 ?auto_36150 ) ) ( not ( = ?auto_36153 ?auto_36150 ) ) ( not ( = ?auto_36162 ?auto_36150 ) ) ( not ( = ?auto_36157 ?auto_36150 ) ) ( not ( = ?auto_36154 ?auto_36160 ) ) ( not ( = ?auto_36161 ?auto_36154 ) ) ( not ( = ?auto_36166 ?auto_36154 ) ) ( HOIST-AT ?auto_36158 ?auto_36154 ) ( not ( = ?auto_36155 ?auto_36158 ) ) ( not ( = ?auto_36164 ?auto_36158 ) ) ( not ( = ?auto_36163 ?auto_36158 ) ) ( AVAILABLE ?auto_36158 ) ( SURFACE-AT ?auto_36151 ?auto_36154 ) ( ON ?auto_36151 ?auto_36165 ) ( CLEAR ?auto_36151 ) ( not ( = ?auto_36152 ?auto_36165 ) ) ( not ( = ?auto_36153 ?auto_36165 ) ) ( not ( = ?auto_36151 ?auto_36165 ) ) ( not ( = ?auto_36162 ?auto_36165 ) ) ( not ( = ?auto_36157 ?auto_36165 ) ) ( not ( = ?auto_36150 ?auto_36165 ) ) ( SURFACE-AT ?auto_36149 ?auto_36160 ) ( CLEAR ?auto_36149 ) ( IS-CRATE ?auto_36150 ) ( not ( = ?auto_36149 ?auto_36150 ) ) ( not ( = ?auto_36152 ?auto_36149 ) ) ( not ( = ?auto_36153 ?auto_36149 ) ) ( not ( = ?auto_36151 ?auto_36149 ) ) ( not ( = ?auto_36162 ?auto_36149 ) ) ( not ( = ?auto_36157 ?auto_36149 ) ) ( not ( = ?auto_36165 ?auto_36149 ) ) ( AVAILABLE ?auto_36155 ) ( TRUCK-AT ?auto_36156 ?auto_36161 ) ( AVAILABLE ?auto_36164 ) ( SURFACE-AT ?auto_36150 ?auto_36161 ) ( ON ?auto_36150 ?auto_36159 ) ( CLEAR ?auto_36150 ) ( not ( = ?auto_36152 ?auto_36159 ) ) ( not ( = ?auto_36153 ?auto_36159 ) ) ( not ( = ?auto_36151 ?auto_36159 ) ) ( not ( = ?auto_36162 ?auto_36159 ) ) ( not ( = ?auto_36157 ?auto_36159 ) ) ( not ( = ?auto_36150 ?auto_36159 ) ) ( not ( = ?auto_36165 ?auto_36159 ) ) ( not ( = ?auto_36149 ?auto_36159 ) ) ( ON ?auto_36149 ?auto_36148 ) ( not ( = ?auto_36148 ?auto_36149 ) ) ( not ( = ?auto_36148 ?auto_36150 ) ) ( not ( = ?auto_36148 ?auto_36151 ) ) ( not ( = ?auto_36148 ?auto_36152 ) ) ( not ( = ?auto_36148 ?auto_36153 ) ) ( not ( = ?auto_36148 ?auto_36162 ) ) ( not ( = ?auto_36148 ?auto_36157 ) ) ( not ( = ?auto_36148 ?auto_36165 ) ) ( not ( = ?auto_36148 ?auto_36159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36151 ?auto_36152 ?auto_36153 )
      ( MAKE-5CRATE-VERIFY ?auto_36148 ?auto_36149 ?auto_36150 ?auto_36151 ?auto_36152 ?auto_36153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36167 - SURFACE
      ?auto_36168 - SURFACE
    )
    :vars
    (
      ?auto_36170 - HOIST
      ?auto_36176 - PLACE
      ?auto_36182 - SURFACE
      ?auto_36177 - PLACE
      ?auto_36181 - HOIST
      ?auto_36178 - SURFACE
      ?auto_36184 - PLACE
      ?auto_36179 - HOIST
      ?auto_36172 - SURFACE
      ?auto_36180 - SURFACE
      ?auto_36169 - PLACE
      ?auto_36174 - HOIST
      ?auto_36183 - SURFACE
      ?auto_36173 - SURFACE
      ?auto_36175 - SURFACE
      ?auto_36171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36170 ?auto_36176 ) ( IS-CRATE ?auto_36168 ) ( not ( = ?auto_36167 ?auto_36168 ) ) ( not ( = ?auto_36182 ?auto_36167 ) ) ( not ( = ?auto_36182 ?auto_36168 ) ) ( not ( = ?auto_36177 ?auto_36176 ) ) ( HOIST-AT ?auto_36181 ?auto_36177 ) ( not ( = ?auto_36170 ?auto_36181 ) ) ( SURFACE-AT ?auto_36168 ?auto_36177 ) ( ON ?auto_36168 ?auto_36178 ) ( CLEAR ?auto_36168 ) ( not ( = ?auto_36167 ?auto_36178 ) ) ( not ( = ?auto_36168 ?auto_36178 ) ) ( not ( = ?auto_36182 ?auto_36178 ) ) ( IS-CRATE ?auto_36167 ) ( not ( = ?auto_36184 ?auto_36176 ) ) ( not ( = ?auto_36177 ?auto_36184 ) ) ( HOIST-AT ?auto_36179 ?auto_36184 ) ( not ( = ?auto_36170 ?auto_36179 ) ) ( not ( = ?auto_36181 ?auto_36179 ) ) ( AVAILABLE ?auto_36179 ) ( SURFACE-AT ?auto_36167 ?auto_36184 ) ( ON ?auto_36167 ?auto_36172 ) ( CLEAR ?auto_36167 ) ( not ( = ?auto_36167 ?auto_36172 ) ) ( not ( = ?auto_36168 ?auto_36172 ) ) ( not ( = ?auto_36182 ?auto_36172 ) ) ( not ( = ?auto_36178 ?auto_36172 ) ) ( IS-CRATE ?auto_36182 ) ( not ( = ?auto_36180 ?auto_36182 ) ) ( not ( = ?auto_36167 ?auto_36180 ) ) ( not ( = ?auto_36168 ?auto_36180 ) ) ( not ( = ?auto_36178 ?auto_36180 ) ) ( not ( = ?auto_36172 ?auto_36180 ) ) ( not ( = ?auto_36169 ?auto_36176 ) ) ( not ( = ?auto_36177 ?auto_36169 ) ) ( not ( = ?auto_36184 ?auto_36169 ) ) ( HOIST-AT ?auto_36174 ?auto_36169 ) ( not ( = ?auto_36170 ?auto_36174 ) ) ( not ( = ?auto_36181 ?auto_36174 ) ) ( not ( = ?auto_36179 ?auto_36174 ) ) ( AVAILABLE ?auto_36174 ) ( SURFACE-AT ?auto_36182 ?auto_36169 ) ( ON ?auto_36182 ?auto_36183 ) ( CLEAR ?auto_36182 ) ( not ( = ?auto_36167 ?auto_36183 ) ) ( not ( = ?auto_36168 ?auto_36183 ) ) ( not ( = ?auto_36182 ?auto_36183 ) ) ( not ( = ?auto_36178 ?auto_36183 ) ) ( not ( = ?auto_36172 ?auto_36183 ) ) ( not ( = ?auto_36180 ?auto_36183 ) ) ( SURFACE-AT ?auto_36173 ?auto_36176 ) ( CLEAR ?auto_36173 ) ( IS-CRATE ?auto_36180 ) ( not ( = ?auto_36173 ?auto_36180 ) ) ( not ( = ?auto_36167 ?auto_36173 ) ) ( not ( = ?auto_36168 ?auto_36173 ) ) ( not ( = ?auto_36182 ?auto_36173 ) ) ( not ( = ?auto_36178 ?auto_36173 ) ) ( not ( = ?auto_36172 ?auto_36173 ) ) ( not ( = ?auto_36183 ?auto_36173 ) ) ( AVAILABLE ?auto_36170 ) ( AVAILABLE ?auto_36181 ) ( SURFACE-AT ?auto_36180 ?auto_36177 ) ( ON ?auto_36180 ?auto_36175 ) ( CLEAR ?auto_36180 ) ( not ( = ?auto_36167 ?auto_36175 ) ) ( not ( = ?auto_36168 ?auto_36175 ) ) ( not ( = ?auto_36182 ?auto_36175 ) ) ( not ( = ?auto_36178 ?auto_36175 ) ) ( not ( = ?auto_36172 ?auto_36175 ) ) ( not ( = ?auto_36180 ?auto_36175 ) ) ( not ( = ?auto_36183 ?auto_36175 ) ) ( not ( = ?auto_36173 ?auto_36175 ) ) ( TRUCK-AT ?auto_36171 ?auto_36176 ) )
    :subtasks
    ( ( !DRIVE ?auto_36171 ?auto_36176 ?auto_36177 )
      ( MAKE-2CRATE ?auto_36182 ?auto_36167 ?auto_36168 )
      ( MAKE-1CRATE-VERIFY ?auto_36167 ?auto_36168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36185 - SURFACE
      ?auto_36186 - SURFACE
      ?auto_36187 - SURFACE
    )
    :vars
    (
      ?auto_36202 - HOIST
      ?auto_36197 - PLACE
      ?auto_36198 - PLACE
      ?auto_36196 - HOIST
      ?auto_36191 - SURFACE
      ?auto_36201 - PLACE
      ?auto_36189 - HOIST
      ?auto_36188 - SURFACE
      ?auto_36192 - SURFACE
      ?auto_36193 - PLACE
      ?auto_36190 - HOIST
      ?auto_36199 - SURFACE
      ?auto_36194 - SURFACE
      ?auto_36200 - SURFACE
      ?auto_36195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36202 ?auto_36197 ) ( IS-CRATE ?auto_36187 ) ( not ( = ?auto_36186 ?auto_36187 ) ) ( not ( = ?auto_36185 ?auto_36186 ) ) ( not ( = ?auto_36185 ?auto_36187 ) ) ( not ( = ?auto_36198 ?auto_36197 ) ) ( HOIST-AT ?auto_36196 ?auto_36198 ) ( not ( = ?auto_36202 ?auto_36196 ) ) ( SURFACE-AT ?auto_36187 ?auto_36198 ) ( ON ?auto_36187 ?auto_36191 ) ( CLEAR ?auto_36187 ) ( not ( = ?auto_36186 ?auto_36191 ) ) ( not ( = ?auto_36187 ?auto_36191 ) ) ( not ( = ?auto_36185 ?auto_36191 ) ) ( IS-CRATE ?auto_36186 ) ( not ( = ?auto_36201 ?auto_36197 ) ) ( not ( = ?auto_36198 ?auto_36201 ) ) ( HOIST-AT ?auto_36189 ?auto_36201 ) ( not ( = ?auto_36202 ?auto_36189 ) ) ( not ( = ?auto_36196 ?auto_36189 ) ) ( AVAILABLE ?auto_36189 ) ( SURFACE-AT ?auto_36186 ?auto_36201 ) ( ON ?auto_36186 ?auto_36188 ) ( CLEAR ?auto_36186 ) ( not ( = ?auto_36186 ?auto_36188 ) ) ( not ( = ?auto_36187 ?auto_36188 ) ) ( not ( = ?auto_36185 ?auto_36188 ) ) ( not ( = ?auto_36191 ?auto_36188 ) ) ( IS-CRATE ?auto_36185 ) ( not ( = ?auto_36192 ?auto_36185 ) ) ( not ( = ?auto_36186 ?auto_36192 ) ) ( not ( = ?auto_36187 ?auto_36192 ) ) ( not ( = ?auto_36191 ?auto_36192 ) ) ( not ( = ?auto_36188 ?auto_36192 ) ) ( not ( = ?auto_36193 ?auto_36197 ) ) ( not ( = ?auto_36198 ?auto_36193 ) ) ( not ( = ?auto_36201 ?auto_36193 ) ) ( HOIST-AT ?auto_36190 ?auto_36193 ) ( not ( = ?auto_36202 ?auto_36190 ) ) ( not ( = ?auto_36196 ?auto_36190 ) ) ( not ( = ?auto_36189 ?auto_36190 ) ) ( AVAILABLE ?auto_36190 ) ( SURFACE-AT ?auto_36185 ?auto_36193 ) ( ON ?auto_36185 ?auto_36199 ) ( CLEAR ?auto_36185 ) ( not ( = ?auto_36186 ?auto_36199 ) ) ( not ( = ?auto_36187 ?auto_36199 ) ) ( not ( = ?auto_36185 ?auto_36199 ) ) ( not ( = ?auto_36191 ?auto_36199 ) ) ( not ( = ?auto_36188 ?auto_36199 ) ) ( not ( = ?auto_36192 ?auto_36199 ) ) ( SURFACE-AT ?auto_36194 ?auto_36197 ) ( CLEAR ?auto_36194 ) ( IS-CRATE ?auto_36192 ) ( not ( = ?auto_36194 ?auto_36192 ) ) ( not ( = ?auto_36186 ?auto_36194 ) ) ( not ( = ?auto_36187 ?auto_36194 ) ) ( not ( = ?auto_36185 ?auto_36194 ) ) ( not ( = ?auto_36191 ?auto_36194 ) ) ( not ( = ?auto_36188 ?auto_36194 ) ) ( not ( = ?auto_36199 ?auto_36194 ) ) ( AVAILABLE ?auto_36202 ) ( AVAILABLE ?auto_36196 ) ( SURFACE-AT ?auto_36192 ?auto_36198 ) ( ON ?auto_36192 ?auto_36200 ) ( CLEAR ?auto_36192 ) ( not ( = ?auto_36186 ?auto_36200 ) ) ( not ( = ?auto_36187 ?auto_36200 ) ) ( not ( = ?auto_36185 ?auto_36200 ) ) ( not ( = ?auto_36191 ?auto_36200 ) ) ( not ( = ?auto_36188 ?auto_36200 ) ) ( not ( = ?auto_36192 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36200 ) ) ( not ( = ?auto_36194 ?auto_36200 ) ) ( TRUCK-AT ?auto_36195 ?auto_36197 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36186 ?auto_36187 )
      ( MAKE-2CRATE-VERIFY ?auto_36185 ?auto_36186 ?auto_36187 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36203 - SURFACE
      ?auto_36204 - SURFACE
      ?auto_36205 - SURFACE
      ?auto_36206 - SURFACE
    )
    :vars
    (
      ?auto_36208 - HOIST
      ?auto_36213 - PLACE
      ?auto_36207 - PLACE
      ?auto_36209 - HOIST
      ?auto_36219 - SURFACE
      ?auto_36217 - PLACE
      ?auto_36215 - HOIST
      ?auto_36210 - SURFACE
      ?auto_36218 - PLACE
      ?auto_36211 - HOIST
      ?auto_36214 - SURFACE
      ?auto_36220 - SURFACE
      ?auto_36216 - SURFACE
      ?auto_36212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36208 ?auto_36213 ) ( IS-CRATE ?auto_36206 ) ( not ( = ?auto_36205 ?auto_36206 ) ) ( not ( = ?auto_36204 ?auto_36205 ) ) ( not ( = ?auto_36204 ?auto_36206 ) ) ( not ( = ?auto_36207 ?auto_36213 ) ) ( HOIST-AT ?auto_36209 ?auto_36207 ) ( not ( = ?auto_36208 ?auto_36209 ) ) ( SURFACE-AT ?auto_36206 ?auto_36207 ) ( ON ?auto_36206 ?auto_36219 ) ( CLEAR ?auto_36206 ) ( not ( = ?auto_36205 ?auto_36219 ) ) ( not ( = ?auto_36206 ?auto_36219 ) ) ( not ( = ?auto_36204 ?auto_36219 ) ) ( IS-CRATE ?auto_36205 ) ( not ( = ?auto_36217 ?auto_36213 ) ) ( not ( = ?auto_36207 ?auto_36217 ) ) ( HOIST-AT ?auto_36215 ?auto_36217 ) ( not ( = ?auto_36208 ?auto_36215 ) ) ( not ( = ?auto_36209 ?auto_36215 ) ) ( AVAILABLE ?auto_36215 ) ( SURFACE-AT ?auto_36205 ?auto_36217 ) ( ON ?auto_36205 ?auto_36210 ) ( CLEAR ?auto_36205 ) ( not ( = ?auto_36205 ?auto_36210 ) ) ( not ( = ?auto_36206 ?auto_36210 ) ) ( not ( = ?auto_36204 ?auto_36210 ) ) ( not ( = ?auto_36219 ?auto_36210 ) ) ( IS-CRATE ?auto_36204 ) ( not ( = ?auto_36203 ?auto_36204 ) ) ( not ( = ?auto_36205 ?auto_36203 ) ) ( not ( = ?auto_36206 ?auto_36203 ) ) ( not ( = ?auto_36219 ?auto_36203 ) ) ( not ( = ?auto_36210 ?auto_36203 ) ) ( not ( = ?auto_36218 ?auto_36213 ) ) ( not ( = ?auto_36207 ?auto_36218 ) ) ( not ( = ?auto_36217 ?auto_36218 ) ) ( HOIST-AT ?auto_36211 ?auto_36218 ) ( not ( = ?auto_36208 ?auto_36211 ) ) ( not ( = ?auto_36209 ?auto_36211 ) ) ( not ( = ?auto_36215 ?auto_36211 ) ) ( AVAILABLE ?auto_36211 ) ( SURFACE-AT ?auto_36204 ?auto_36218 ) ( ON ?auto_36204 ?auto_36214 ) ( CLEAR ?auto_36204 ) ( not ( = ?auto_36205 ?auto_36214 ) ) ( not ( = ?auto_36206 ?auto_36214 ) ) ( not ( = ?auto_36204 ?auto_36214 ) ) ( not ( = ?auto_36219 ?auto_36214 ) ) ( not ( = ?auto_36210 ?auto_36214 ) ) ( not ( = ?auto_36203 ?auto_36214 ) ) ( SURFACE-AT ?auto_36220 ?auto_36213 ) ( CLEAR ?auto_36220 ) ( IS-CRATE ?auto_36203 ) ( not ( = ?auto_36220 ?auto_36203 ) ) ( not ( = ?auto_36205 ?auto_36220 ) ) ( not ( = ?auto_36206 ?auto_36220 ) ) ( not ( = ?auto_36204 ?auto_36220 ) ) ( not ( = ?auto_36219 ?auto_36220 ) ) ( not ( = ?auto_36210 ?auto_36220 ) ) ( not ( = ?auto_36214 ?auto_36220 ) ) ( AVAILABLE ?auto_36208 ) ( AVAILABLE ?auto_36209 ) ( SURFACE-AT ?auto_36203 ?auto_36207 ) ( ON ?auto_36203 ?auto_36216 ) ( CLEAR ?auto_36203 ) ( not ( = ?auto_36205 ?auto_36216 ) ) ( not ( = ?auto_36206 ?auto_36216 ) ) ( not ( = ?auto_36204 ?auto_36216 ) ) ( not ( = ?auto_36219 ?auto_36216 ) ) ( not ( = ?auto_36210 ?auto_36216 ) ) ( not ( = ?auto_36203 ?auto_36216 ) ) ( not ( = ?auto_36214 ?auto_36216 ) ) ( not ( = ?auto_36220 ?auto_36216 ) ) ( TRUCK-AT ?auto_36212 ?auto_36213 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36204 ?auto_36205 ?auto_36206 )
      ( MAKE-3CRATE-VERIFY ?auto_36203 ?auto_36204 ?auto_36205 ?auto_36206 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36221 - SURFACE
      ?auto_36222 - SURFACE
      ?auto_36223 - SURFACE
      ?auto_36224 - SURFACE
      ?auto_36225 - SURFACE
    )
    :vars
    (
      ?auto_36227 - HOIST
      ?auto_36232 - PLACE
      ?auto_36226 - PLACE
      ?auto_36228 - HOIST
      ?auto_36238 - SURFACE
      ?auto_36236 - PLACE
      ?auto_36234 - HOIST
      ?auto_36229 - SURFACE
      ?auto_36237 - PLACE
      ?auto_36230 - HOIST
      ?auto_36233 - SURFACE
      ?auto_36235 - SURFACE
      ?auto_36231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36227 ?auto_36232 ) ( IS-CRATE ?auto_36225 ) ( not ( = ?auto_36224 ?auto_36225 ) ) ( not ( = ?auto_36223 ?auto_36224 ) ) ( not ( = ?auto_36223 ?auto_36225 ) ) ( not ( = ?auto_36226 ?auto_36232 ) ) ( HOIST-AT ?auto_36228 ?auto_36226 ) ( not ( = ?auto_36227 ?auto_36228 ) ) ( SURFACE-AT ?auto_36225 ?auto_36226 ) ( ON ?auto_36225 ?auto_36238 ) ( CLEAR ?auto_36225 ) ( not ( = ?auto_36224 ?auto_36238 ) ) ( not ( = ?auto_36225 ?auto_36238 ) ) ( not ( = ?auto_36223 ?auto_36238 ) ) ( IS-CRATE ?auto_36224 ) ( not ( = ?auto_36236 ?auto_36232 ) ) ( not ( = ?auto_36226 ?auto_36236 ) ) ( HOIST-AT ?auto_36234 ?auto_36236 ) ( not ( = ?auto_36227 ?auto_36234 ) ) ( not ( = ?auto_36228 ?auto_36234 ) ) ( AVAILABLE ?auto_36234 ) ( SURFACE-AT ?auto_36224 ?auto_36236 ) ( ON ?auto_36224 ?auto_36229 ) ( CLEAR ?auto_36224 ) ( not ( = ?auto_36224 ?auto_36229 ) ) ( not ( = ?auto_36225 ?auto_36229 ) ) ( not ( = ?auto_36223 ?auto_36229 ) ) ( not ( = ?auto_36238 ?auto_36229 ) ) ( IS-CRATE ?auto_36223 ) ( not ( = ?auto_36222 ?auto_36223 ) ) ( not ( = ?auto_36224 ?auto_36222 ) ) ( not ( = ?auto_36225 ?auto_36222 ) ) ( not ( = ?auto_36238 ?auto_36222 ) ) ( not ( = ?auto_36229 ?auto_36222 ) ) ( not ( = ?auto_36237 ?auto_36232 ) ) ( not ( = ?auto_36226 ?auto_36237 ) ) ( not ( = ?auto_36236 ?auto_36237 ) ) ( HOIST-AT ?auto_36230 ?auto_36237 ) ( not ( = ?auto_36227 ?auto_36230 ) ) ( not ( = ?auto_36228 ?auto_36230 ) ) ( not ( = ?auto_36234 ?auto_36230 ) ) ( AVAILABLE ?auto_36230 ) ( SURFACE-AT ?auto_36223 ?auto_36237 ) ( ON ?auto_36223 ?auto_36233 ) ( CLEAR ?auto_36223 ) ( not ( = ?auto_36224 ?auto_36233 ) ) ( not ( = ?auto_36225 ?auto_36233 ) ) ( not ( = ?auto_36223 ?auto_36233 ) ) ( not ( = ?auto_36238 ?auto_36233 ) ) ( not ( = ?auto_36229 ?auto_36233 ) ) ( not ( = ?auto_36222 ?auto_36233 ) ) ( SURFACE-AT ?auto_36221 ?auto_36232 ) ( CLEAR ?auto_36221 ) ( IS-CRATE ?auto_36222 ) ( not ( = ?auto_36221 ?auto_36222 ) ) ( not ( = ?auto_36224 ?auto_36221 ) ) ( not ( = ?auto_36225 ?auto_36221 ) ) ( not ( = ?auto_36223 ?auto_36221 ) ) ( not ( = ?auto_36238 ?auto_36221 ) ) ( not ( = ?auto_36229 ?auto_36221 ) ) ( not ( = ?auto_36233 ?auto_36221 ) ) ( AVAILABLE ?auto_36227 ) ( AVAILABLE ?auto_36228 ) ( SURFACE-AT ?auto_36222 ?auto_36226 ) ( ON ?auto_36222 ?auto_36235 ) ( CLEAR ?auto_36222 ) ( not ( = ?auto_36224 ?auto_36235 ) ) ( not ( = ?auto_36225 ?auto_36235 ) ) ( not ( = ?auto_36223 ?auto_36235 ) ) ( not ( = ?auto_36238 ?auto_36235 ) ) ( not ( = ?auto_36229 ?auto_36235 ) ) ( not ( = ?auto_36222 ?auto_36235 ) ) ( not ( = ?auto_36233 ?auto_36235 ) ) ( not ( = ?auto_36221 ?auto_36235 ) ) ( TRUCK-AT ?auto_36231 ?auto_36232 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36223 ?auto_36224 ?auto_36225 )
      ( MAKE-4CRATE-VERIFY ?auto_36221 ?auto_36222 ?auto_36223 ?auto_36224 ?auto_36225 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36239 - SURFACE
      ?auto_36240 - SURFACE
      ?auto_36241 - SURFACE
      ?auto_36242 - SURFACE
      ?auto_36243 - SURFACE
      ?auto_36244 - SURFACE
    )
    :vars
    (
      ?auto_36246 - HOIST
      ?auto_36251 - PLACE
      ?auto_36245 - PLACE
      ?auto_36247 - HOIST
      ?auto_36257 - SURFACE
      ?auto_36255 - PLACE
      ?auto_36253 - HOIST
      ?auto_36248 - SURFACE
      ?auto_36256 - PLACE
      ?auto_36249 - HOIST
      ?auto_36252 - SURFACE
      ?auto_36254 - SURFACE
      ?auto_36250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36246 ?auto_36251 ) ( IS-CRATE ?auto_36244 ) ( not ( = ?auto_36243 ?auto_36244 ) ) ( not ( = ?auto_36242 ?auto_36243 ) ) ( not ( = ?auto_36242 ?auto_36244 ) ) ( not ( = ?auto_36245 ?auto_36251 ) ) ( HOIST-AT ?auto_36247 ?auto_36245 ) ( not ( = ?auto_36246 ?auto_36247 ) ) ( SURFACE-AT ?auto_36244 ?auto_36245 ) ( ON ?auto_36244 ?auto_36257 ) ( CLEAR ?auto_36244 ) ( not ( = ?auto_36243 ?auto_36257 ) ) ( not ( = ?auto_36244 ?auto_36257 ) ) ( not ( = ?auto_36242 ?auto_36257 ) ) ( IS-CRATE ?auto_36243 ) ( not ( = ?auto_36255 ?auto_36251 ) ) ( not ( = ?auto_36245 ?auto_36255 ) ) ( HOIST-AT ?auto_36253 ?auto_36255 ) ( not ( = ?auto_36246 ?auto_36253 ) ) ( not ( = ?auto_36247 ?auto_36253 ) ) ( AVAILABLE ?auto_36253 ) ( SURFACE-AT ?auto_36243 ?auto_36255 ) ( ON ?auto_36243 ?auto_36248 ) ( CLEAR ?auto_36243 ) ( not ( = ?auto_36243 ?auto_36248 ) ) ( not ( = ?auto_36244 ?auto_36248 ) ) ( not ( = ?auto_36242 ?auto_36248 ) ) ( not ( = ?auto_36257 ?auto_36248 ) ) ( IS-CRATE ?auto_36242 ) ( not ( = ?auto_36241 ?auto_36242 ) ) ( not ( = ?auto_36243 ?auto_36241 ) ) ( not ( = ?auto_36244 ?auto_36241 ) ) ( not ( = ?auto_36257 ?auto_36241 ) ) ( not ( = ?auto_36248 ?auto_36241 ) ) ( not ( = ?auto_36256 ?auto_36251 ) ) ( not ( = ?auto_36245 ?auto_36256 ) ) ( not ( = ?auto_36255 ?auto_36256 ) ) ( HOIST-AT ?auto_36249 ?auto_36256 ) ( not ( = ?auto_36246 ?auto_36249 ) ) ( not ( = ?auto_36247 ?auto_36249 ) ) ( not ( = ?auto_36253 ?auto_36249 ) ) ( AVAILABLE ?auto_36249 ) ( SURFACE-AT ?auto_36242 ?auto_36256 ) ( ON ?auto_36242 ?auto_36252 ) ( CLEAR ?auto_36242 ) ( not ( = ?auto_36243 ?auto_36252 ) ) ( not ( = ?auto_36244 ?auto_36252 ) ) ( not ( = ?auto_36242 ?auto_36252 ) ) ( not ( = ?auto_36257 ?auto_36252 ) ) ( not ( = ?auto_36248 ?auto_36252 ) ) ( not ( = ?auto_36241 ?auto_36252 ) ) ( SURFACE-AT ?auto_36240 ?auto_36251 ) ( CLEAR ?auto_36240 ) ( IS-CRATE ?auto_36241 ) ( not ( = ?auto_36240 ?auto_36241 ) ) ( not ( = ?auto_36243 ?auto_36240 ) ) ( not ( = ?auto_36244 ?auto_36240 ) ) ( not ( = ?auto_36242 ?auto_36240 ) ) ( not ( = ?auto_36257 ?auto_36240 ) ) ( not ( = ?auto_36248 ?auto_36240 ) ) ( not ( = ?auto_36252 ?auto_36240 ) ) ( AVAILABLE ?auto_36246 ) ( AVAILABLE ?auto_36247 ) ( SURFACE-AT ?auto_36241 ?auto_36245 ) ( ON ?auto_36241 ?auto_36254 ) ( CLEAR ?auto_36241 ) ( not ( = ?auto_36243 ?auto_36254 ) ) ( not ( = ?auto_36244 ?auto_36254 ) ) ( not ( = ?auto_36242 ?auto_36254 ) ) ( not ( = ?auto_36257 ?auto_36254 ) ) ( not ( = ?auto_36248 ?auto_36254 ) ) ( not ( = ?auto_36241 ?auto_36254 ) ) ( not ( = ?auto_36252 ?auto_36254 ) ) ( not ( = ?auto_36240 ?auto_36254 ) ) ( TRUCK-AT ?auto_36250 ?auto_36251 ) ( ON ?auto_36240 ?auto_36239 ) ( not ( = ?auto_36239 ?auto_36240 ) ) ( not ( = ?auto_36239 ?auto_36241 ) ) ( not ( = ?auto_36239 ?auto_36242 ) ) ( not ( = ?auto_36239 ?auto_36243 ) ) ( not ( = ?auto_36239 ?auto_36244 ) ) ( not ( = ?auto_36239 ?auto_36257 ) ) ( not ( = ?auto_36239 ?auto_36248 ) ) ( not ( = ?auto_36239 ?auto_36252 ) ) ( not ( = ?auto_36239 ?auto_36254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36242 ?auto_36243 ?auto_36244 )
      ( MAKE-5CRATE-VERIFY ?auto_36239 ?auto_36240 ?auto_36241 ?auto_36242 ?auto_36243 ?auto_36244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36258 - SURFACE
      ?auto_36259 - SURFACE
    )
    :vars
    (
      ?auto_36261 - HOIST
      ?auto_36266 - PLACE
      ?auto_36268 - SURFACE
      ?auto_36260 - PLACE
      ?auto_36262 - HOIST
      ?auto_36274 - SURFACE
      ?auto_36272 - PLACE
      ?auto_36269 - HOIST
      ?auto_36263 - SURFACE
      ?auto_36270 - SURFACE
      ?auto_36273 - PLACE
      ?auto_36264 - HOIST
      ?auto_36267 - SURFACE
      ?auto_36275 - SURFACE
      ?auto_36271 - SURFACE
      ?auto_36265 - TRUCK
      ?auto_36276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36261 ?auto_36266 ) ( IS-CRATE ?auto_36259 ) ( not ( = ?auto_36258 ?auto_36259 ) ) ( not ( = ?auto_36268 ?auto_36258 ) ) ( not ( = ?auto_36268 ?auto_36259 ) ) ( not ( = ?auto_36260 ?auto_36266 ) ) ( HOIST-AT ?auto_36262 ?auto_36260 ) ( not ( = ?auto_36261 ?auto_36262 ) ) ( SURFACE-AT ?auto_36259 ?auto_36260 ) ( ON ?auto_36259 ?auto_36274 ) ( CLEAR ?auto_36259 ) ( not ( = ?auto_36258 ?auto_36274 ) ) ( not ( = ?auto_36259 ?auto_36274 ) ) ( not ( = ?auto_36268 ?auto_36274 ) ) ( IS-CRATE ?auto_36258 ) ( not ( = ?auto_36272 ?auto_36266 ) ) ( not ( = ?auto_36260 ?auto_36272 ) ) ( HOIST-AT ?auto_36269 ?auto_36272 ) ( not ( = ?auto_36261 ?auto_36269 ) ) ( not ( = ?auto_36262 ?auto_36269 ) ) ( AVAILABLE ?auto_36269 ) ( SURFACE-AT ?auto_36258 ?auto_36272 ) ( ON ?auto_36258 ?auto_36263 ) ( CLEAR ?auto_36258 ) ( not ( = ?auto_36258 ?auto_36263 ) ) ( not ( = ?auto_36259 ?auto_36263 ) ) ( not ( = ?auto_36268 ?auto_36263 ) ) ( not ( = ?auto_36274 ?auto_36263 ) ) ( IS-CRATE ?auto_36268 ) ( not ( = ?auto_36270 ?auto_36268 ) ) ( not ( = ?auto_36258 ?auto_36270 ) ) ( not ( = ?auto_36259 ?auto_36270 ) ) ( not ( = ?auto_36274 ?auto_36270 ) ) ( not ( = ?auto_36263 ?auto_36270 ) ) ( not ( = ?auto_36273 ?auto_36266 ) ) ( not ( = ?auto_36260 ?auto_36273 ) ) ( not ( = ?auto_36272 ?auto_36273 ) ) ( HOIST-AT ?auto_36264 ?auto_36273 ) ( not ( = ?auto_36261 ?auto_36264 ) ) ( not ( = ?auto_36262 ?auto_36264 ) ) ( not ( = ?auto_36269 ?auto_36264 ) ) ( AVAILABLE ?auto_36264 ) ( SURFACE-AT ?auto_36268 ?auto_36273 ) ( ON ?auto_36268 ?auto_36267 ) ( CLEAR ?auto_36268 ) ( not ( = ?auto_36258 ?auto_36267 ) ) ( not ( = ?auto_36259 ?auto_36267 ) ) ( not ( = ?auto_36268 ?auto_36267 ) ) ( not ( = ?auto_36274 ?auto_36267 ) ) ( not ( = ?auto_36263 ?auto_36267 ) ) ( not ( = ?auto_36270 ?auto_36267 ) ) ( IS-CRATE ?auto_36270 ) ( not ( = ?auto_36275 ?auto_36270 ) ) ( not ( = ?auto_36258 ?auto_36275 ) ) ( not ( = ?auto_36259 ?auto_36275 ) ) ( not ( = ?auto_36268 ?auto_36275 ) ) ( not ( = ?auto_36274 ?auto_36275 ) ) ( not ( = ?auto_36263 ?auto_36275 ) ) ( not ( = ?auto_36267 ?auto_36275 ) ) ( AVAILABLE ?auto_36262 ) ( SURFACE-AT ?auto_36270 ?auto_36260 ) ( ON ?auto_36270 ?auto_36271 ) ( CLEAR ?auto_36270 ) ( not ( = ?auto_36258 ?auto_36271 ) ) ( not ( = ?auto_36259 ?auto_36271 ) ) ( not ( = ?auto_36268 ?auto_36271 ) ) ( not ( = ?auto_36274 ?auto_36271 ) ) ( not ( = ?auto_36263 ?auto_36271 ) ) ( not ( = ?auto_36270 ?auto_36271 ) ) ( not ( = ?auto_36267 ?auto_36271 ) ) ( not ( = ?auto_36275 ?auto_36271 ) ) ( TRUCK-AT ?auto_36265 ?auto_36266 ) ( SURFACE-AT ?auto_36276 ?auto_36266 ) ( CLEAR ?auto_36276 ) ( LIFTING ?auto_36261 ?auto_36275 ) ( IS-CRATE ?auto_36275 ) ( not ( = ?auto_36276 ?auto_36275 ) ) ( not ( = ?auto_36258 ?auto_36276 ) ) ( not ( = ?auto_36259 ?auto_36276 ) ) ( not ( = ?auto_36268 ?auto_36276 ) ) ( not ( = ?auto_36274 ?auto_36276 ) ) ( not ( = ?auto_36263 ?auto_36276 ) ) ( not ( = ?auto_36270 ?auto_36276 ) ) ( not ( = ?auto_36267 ?auto_36276 ) ) ( not ( = ?auto_36271 ?auto_36276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36276 ?auto_36275 )
      ( MAKE-2CRATE ?auto_36268 ?auto_36258 ?auto_36259 )
      ( MAKE-1CRATE-VERIFY ?auto_36258 ?auto_36259 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36277 - SURFACE
      ?auto_36278 - SURFACE
      ?auto_36279 - SURFACE
    )
    :vars
    (
      ?auto_36295 - HOIST
      ?auto_36292 - PLACE
      ?auto_36280 - PLACE
      ?auto_36284 - HOIST
      ?auto_36290 - SURFACE
      ?auto_36282 - PLACE
      ?auto_36293 - HOIST
      ?auto_36291 - SURFACE
      ?auto_36287 - SURFACE
      ?auto_36288 - PLACE
      ?auto_36285 - HOIST
      ?auto_36289 - SURFACE
      ?auto_36281 - SURFACE
      ?auto_36286 - SURFACE
      ?auto_36283 - TRUCK
      ?auto_36294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36295 ?auto_36292 ) ( IS-CRATE ?auto_36279 ) ( not ( = ?auto_36278 ?auto_36279 ) ) ( not ( = ?auto_36277 ?auto_36278 ) ) ( not ( = ?auto_36277 ?auto_36279 ) ) ( not ( = ?auto_36280 ?auto_36292 ) ) ( HOIST-AT ?auto_36284 ?auto_36280 ) ( not ( = ?auto_36295 ?auto_36284 ) ) ( SURFACE-AT ?auto_36279 ?auto_36280 ) ( ON ?auto_36279 ?auto_36290 ) ( CLEAR ?auto_36279 ) ( not ( = ?auto_36278 ?auto_36290 ) ) ( not ( = ?auto_36279 ?auto_36290 ) ) ( not ( = ?auto_36277 ?auto_36290 ) ) ( IS-CRATE ?auto_36278 ) ( not ( = ?auto_36282 ?auto_36292 ) ) ( not ( = ?auto_36280 ?auto_36282 ) ) ( HOIST-AT ?auto_36293 ?auto_36282 ) ( not ( = ?auto_36295 ?auto_36293 ) ) ( not ( = ?auto_36284 ?auto_36293 ) ) ( AVAILABLE ?auto_36293 ) ( SURFACE-AT ?auto_36278 ?auto_36282 ) ( ON ?auto_36278 ?auto_36291 ) ( CLEAR ?auto_36278 ) ( not ( = ?auto_36278 ?auto_36291 ) ) ( not ( = ?auto_36279 ?auto_36291 ) ) ( not ( = ?auto_36277 ?auto_36291 ) ) ( not ( = ?auto_36290 ?auto_36291 ) ) ( IS-CRATE ?auto_36277 ) ( not ( = ?auto_36287 ?auto_36277 ) ) ( not ( = ?auto_36278 ?auto_36287 ) ) ( not ( = ?auto_36279 ?auto_36287 ) ) ( not ( = ?auto_36290 ?auto_36287 ) ) ( not ( = ?auto_36291 ?auto_36287 ) ) ( not ( = ?auto_36288 ?auto_36292 ) ) ( not ( = ?auto_36280 ?auto_36288 ) ) ( not ( = ?auto_36282 ?auto_36288 ) ) ( HOIST-AT ?auto_36285 ?auto_36288 ) ( not ( = ?auto_36295 ?auto_36285 ) ) ( not ( = ?auto_36284 ?auto_36285 ) ) ( not ( = ?auto_36293 ?auto_36285 ) ) ( AVAILABLE ?auto_36285 ) ( SURFACE-AT ?auto_36277 ?auto_36288 ) ( ON ?auto_36277 ?auto_36289 ) ( CLEAR ?auto_36277 ) ( not ( = ?auto_36278 ?auto_36289 ) ) ( not ( = ?auto_36279 ?auto_36289 ) ) ( not ( = ?auto_36277 ?auto_36289 ) ) ( not ( = ?auto_36290 ?auto_36289 ) ) ( not ( = ?auto_36291 ?auto_36289 ) ) ( not ( = ?auto_36287 ?auto_36289 ) ) ( IS-CRATE ?auto_36287 ) ( not ( = ?auto_36281 ?auto_36287 ) ) ( not ( = ?auto_36278 ?auto_36281 ) ) ( not ( = ?auto_36279 ?auto_36281 ) ) ( not ( = ?auto_36277 ?auto_36281 ) ) ( not ( = ?auto_36290 ?auto_36281 ) ) ( not ( = ?auto_36291 ?auto_36281 ) ) ( not ( = ?auto_36289 ?auto_36281 ) ) ( AVAILABLE ?auto_36284 ) ( SURFACE-AT ?auto_36287 ?auto_36280 ) ( ON ?auto_36287 ?auto_36286 ) ( CLEAR ?auto_36287 ) ( not ( = ?auto_36278 ?auto_36286 ) ) ( not ( = ?auto_36279 ?auto_36286 ) ) ( not ( = ?auto_36277 ?auto_36286 ) ) ( not ( = ?auto_36290 ?auto_36286 ) ) ( not ( = ?auto_36291 ?auto_36286 ) ) ( not ( = ?auto_36287 ?auto_36286 ) ) ( not ( = ?auto_36289 ?auto_36286 ) ) ( not ( = ?auto_36281 ?auto_36286 ) ) ( TRUCK-AT ?auto_36283 ?auto_36292 ) ( SURFACE-AT ?auto_36294 ?auto_36292 ) ( CLEAR ?auto_36294 ) ( LIFTING ?auto_36295 ?auto_36281 ) ( IS-CRATE ?auto_36281 ) ( not ( = ?auto_36294 ?auto_36281 ) ) ( not ( = ?auto_36278 ?auto_36294 ) ) ( not ( = ?auto_36279 ?auto_36294 ) ) ( not ( = ?auto_36277 ?auto_36294 ) ) ( not ( = ?auto_36290 ?auto_36294 ) ) ( not ( = ?auto_36291 ?auto_36294 ) ) ( not ( = ?auto_36287 ?auto_36294 ) ) ( not ( = ?auto_36289 ?auto_36294 ) ) ( not ( = ?auto_36286 ?auto_36294 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36278 ?auto_36279 )
      ( MAKE-2CRATE-VERIFY ?auto_36277 ?auto_36278 ?auto_36279 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36296 - SURFACE
      ?auto_36297 - SURFACE
      ?auto_36298 - SURFACE
      ?auto_36299 - SURFACE
    )
    :vars
    (
      ?auto_36314 - HOIST
      ?auto_36313 - PLACE
      ?auto_36305 - PLACE
      ?auto_36308 - HOIST
      ?auto_36310 - SURFACE
      ?auto_36302 - PLACE
      ?auto_36309 - HOIST
      ?auto_36303 - SURFACE
      ?auto_36304 - PLACE
      ?auto_36312 - HOIST
      ?auto_36311 - SURFACE
      ?auto_36301 - SURFACE
      ?auto_36306 - SURFACE
      ?auto_36300 - TRUCK
      ?auto_36307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36314 ?auto_36313 ) ( IS-CRATE ?auto_36299 ) ( not ( = ?auto_36298 ?auto_36299 ) ) ( not ( = ?auto_36297 ?auto_36298 ) ) ( not ( = ?auto_36297 ?auto_36299 ) ) ( not ( = ?auto_36305 ?auto_36313 ) ) ( HOIST-AT ?auto_36308 ?auto_36305 ) ( not ( = ?auto_36314 ?auto_36308 ) ) ( SURFACE-AT ?auto_36299 ?auto_36305 ) ( ON ?auto_36299 ?auto_36310 ) ( CLEAR ?auto_36299 ) ( not ( = ?auto_36298 ?auto_36310 ) ) ( not ( = ?auto_36299 ?auto_36310 ) ) ( not ( = ?auto_36297 ?auto_36310 ) ) ( IS-CRATE ?auto_36298 ) ( not ( = ?auto_36302 ?auto_36313 ) ) ( not ( = ?auto_36305 ?auto_36302 ) ) ( HOIST-AT ?auto_36309 ?auto_36302 ) ( not ( = ?auto_36314 ?auto_36309 ) ) ( not ( = ?auto_36308 ?auto_36309 ) ) ( AVAILABLE ?auto_36309 ) ( SURFACE-AT ?auto_36298 ?auto_36302 ) ( ON ?auto_36298 ?auto_36303 ) ( CLEAR ?auto_36298 ) ( not ( = ?auto_36298 ?auto_36303 ) ) ( not ( = ?auto_36299 ?auto_36303 ) ) ( not ( = ?auto_36297 ?auto_36303 ) ) ( not ( = ?auto_36310 ?auto_36303 ) ) ( IS-CRATE ?auto_36297 ) ( not ( = ?auto_36296 ?auto_36297 ) ) ( not ( = ?auto_36298 ?auto_36296 ) ) ( not ( = ?auto_36299 ?auto_36296 ) ) ( not ( = ?auto_36310 ?auto_36296 ) ) ( not ( = ?auto_36303 ?auto_36296 ) ) ( not ( = ?auto_36304 ?auto_36313 ) ) ( not ( = ?auto_36305 ?auto_36304 ) ) ( not ( = ?auto_36302 ?auto_36304 ) ) ( HOIST-AT ?auto_36312 ?auto_36304 ) ( not ( = ?auto_36314 ?auto_36312 ) ) ( not ( = ?auto_36308 ?auto_36312 ) ) ( not ( = ?auto_36309 ?auto_36312 ) ) ( AVAILABLE ?auto_36312 ) ( SURFACE-AT ?auto_36297 ?auto_36304 ) ( ON ?auto_36297 ?auto_36311 ) ( CLEAR ?auto_36297 ) ( not ( = ?auto_36298 ?auto_36311 ) ) ( not ( = ?auto_36299 ?auto_36311 ) ) ( not ( = ?auto_36297 ?auto_36311 ) ) ( not ( = ?auto_36310 ?auto_36311 ) ) ( not ( = ?auto_36303 ?auto_36311 ) ) ( not ( = ?auto_36296 ?auto_36311 ) ) ( IS-CRATE ?auto_36296 ) ( not ( = ?auto_36301 ?auto_36296 ) ) ( not ( = ?auto_36298 ?auto_36301 ) ) ( not ( = ?auto_36299 ?auto_36301 ) ) ( not ( = ?auto_36297 ?auto_36301 ) ) ( not ( = ?auto_36310 ?auto_36301 ) ) ( not ( = ?auto_36303 ?auto_36301 ) ) ( not ( = ?auto_36311 ?auto_36301 ) ) ( AVAILABLE ?auto_36308 ) ( SURFACE-AT ?auto_36296 ?auto_36305 ) ( ON ?auto_36296 ?auto_36306 ) ( CLEAR ?auto_36296 ) ( not ( = ?auto_36298 ?auto_36306 ) ) ( not ( = ?auto_36299 ?auto_36306 ) ) ( not ( = ?auto_36297 ?auto_36306 ) ) ( not ( = ?auto_36310 ?auto_36306 ) ) ( not ( = ?auto_36303 ?auto_36306 ) ) ( not ( = ?auto_36296 ?auto_36306 ) ) ( not ( = ?auto_36311 ?auto_36306 ) ) ( not ( = ?auto_36301 ?auto_36306 ) ) ( TRUCK-AT ?auto_36300 ?auto_36313 ) ( SURFACE-AT ?auto_36307 ?auto_36313 ) ( CLEAR ?auto_36307 ) ( LIFTING ?auto_36314 ?auto_36301 ) ( IS-CRATE ?auto_36301 ) ( not ( = ?auto_36307 ?auto_36301 ) ) ( not ( = ?auto_36298 ?auto_36307 ) ) ( not ( = ?auto_36299 ?auto_36307 ) ) ( not ( = ?auto_36297 ?auto_36307 ) ) ( not ( = ?auto_36310 ?auto_36307 ) ) ( not ( = ?auto_36303 ?auto_36307 ) ) ( not ( = ?auto_36296 ?auto_36307 ) ) ( not ( = ?auto_36311 ?auto_36307 ) ) ( not ( = ?auto_36306 ?auto_36307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36297 ?auto_36298 ?auto_36299 )
      ( MAKE-3CRATE-VERIFY ?auto_36296 ?auto_36297 ?auto_36298 ?auto_36299 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36315 - SURFACE
      ?auto_36316 - SURFACE
      ?auto_36317 - SURFACE
      ?auto_36318 - SURFACE
      ?auto_36319 - SURFACE
    )
    :vars
    (
      ?auto_36333 - HOIST
      ?auto_36332 - PLACE
      ?auto_36324 - PLACE
      ?auto_36327 - HOIST
      ?auto_36329 - SURFACE
      ?auto_36321 - PLACE
      ?auto_36328 - HOIST
      ?auto_36322 - SURFACE
      ?auto_36323 - PLACE
      ?auto_36331 - HOIST
      ?auto_36330 - SURFACE
      ?auto_36325 - SURFACE
      ?auto_36320 - TRUCK
      ?auto_36326 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36333 ?auto_36332 ) ( IS-CRATE ?auto_36319 ) ( not ( = ?auto_36318 ?auto_36319 ) ) ( not ( = ?auto_36317 ?auto_36318 ) ) ( not ( = ?auto_36317 ?auto_36319 ) ) ( not ( = ?auto_36324 ?auto_36332 ) ) ( HOIST-AT ?auto_36327 ?auto_36324 ) ( not ( = ?auto_36333 ?auto_36327 ) ) ( SURFACE-AT ?auto_36319 ?auto_36324 ) ( ON ?auto_36319 ?auto_36329 ) ( CLEAR ?auto_36319 ) ( not ( = ?auto_36318 ?auto_36329 ) ) ( not ( = ?auto_36319 ?auto_36329 ) ) ( not ( = ?auto_36317 ?auto_36329 ) ) ( IS-CRATE ?auto_36318 ) ( not ( = ?auto_36321 ?auto_36332 ) ) ( not ( = ?auto_36324 ?auto_36321 ) ) ( HOIST-AT ?auto_36328 ?auto_36321 ) ( not ( = ?auto_36333 ?auto_36328 ) ) ( not ( = ?auto_36327 ?auto_36328 ) ) ( AVAILABLE ?auto_36328 ) ( SURFACE-AT ?auto_36318 ?auto_36321 ) ( ON ?auto_36318 ?auto_36322 ) ( CLEAR ?auto_36318 ) ( not ( = ?auto_36318 ?auto_36322 ) ) ( not ( = ?auto_36319 ?auto_36322 ) ) ( not ( = ?auto_36317 ?auto_36322 ) ) ( not ( = ?auto_36329 ?auto_36322 ) ) ( IS-CRATE ?auto_36317 ) ( not ( = ?auto_36316 ?auto_36317 ) ) ( not ( = ?auto_36318 ?auto_36316 ) ) ( not ( = ?auto_36319 ?auto_36316 ) ) ( not ( = ?auto_36329 ?auto_36316 ) ) ( not ( = ?auto_36322 ?auto_36316 ) ) ( not ( = ?auto_36323 ?auto_36332 ) ) ( not ( = ?auto_36324 ?auto_36323 ) ) ( not ( = ?auto_36321 ?auto_36323 ) ) ( HOIST-AT ?auto_36331 ?auto_36323 ) ( not ( = ?auto_36333 ?auto_36331 ) ) ( not ( = ?auto_36327 ?auto_36331 ) ) ( not ( = ?auto_36328 ?auto_36331 ) ) ( AVAILABLE ?auto_36331 ) ( SURFACE-AT ?auto_36317 ?auto_36323 ) ( ON ?auto_36317 ?auto_36330 ) ( CLEAR ?auto_36317 ) ( not ( = ?auto_36318 ?auto_36330 ) ) ( not ( = ?auto_36319 ?auto_36330 ) ) ( not ( = ?auto_36317 ?auto_36330 ) ) ( not ( = ?auto_36329 ?auto_36330 ) ) ( not ( = ?auto_36322 ?auto_36330 ) ) ( not ( = ?auto_36316 ?auto_36330 ) ) ( IS-CRATE ?auto_36316 ) ( not ( = ?auto_36315 ?auto_36316 ) ) ( not ( = ?auto_36318 ?auto_36315 ) ) ( not ( = ?auto_36319 ?auto_36315 ) ) ( not ( = ?auto_36317 ?auto_36315 ) ) ( not ( = ?auto_36329 ?auto_36315 ) ) ( not ( = ?auto_36322 ?auto_36315 ) ) ( not ( = ?auto_36330 ?auto_36315 ) ) ( AVAILABLE ?auto_36327 ) ( SURFACE-AT ?auto_36316 ?auto_36324 ) ( ON ?auto_36316 ?auto_36325 ) ( CLEAR ?auto_36316 ) ( not ( = ?auto_36318 ?auto_36325 ) ) ( not ( = ?auto_36319 ?auto_36325 ) ) ( not ( = ?auto_36317 ?auto_36325 ) ) ( not ( = ?auto_36329 ?auto_36325 ) ) ( not ( = ?auto_36322 ?auto_36325 ) ) ( not ( = ?auto_36316 ?auto_36325 ) ) ( not ( = ?auto_36330 ?auto_36325 ) ) ( not ( = ?auto_36315 ?auto_36325 ) ) ( TRUCK-AT ?auto_36320 ?auto_36332 ) ( SURFACE-AT ?auto_36326 ?auto_36332 ) ( CLEAR ?auto_36326 ) ( LIFTING ?auto_36333 ?auto_36315 ) ( IS-CRATE ?auto_36315 ) ( not ( = ?auto_36326 ?auto_36315 ) ) ( not ( = ?auto_36318 ?auto_36326 ) ) ( not ( = ?auto_36319 ?auto_36326 ) ) ( not ( = ?auto_36317 ?auto_36326 ) ) ( not ( = ?auto_36329 ?auto_36326 ) ) ( not ( = ?auto_36322 ?auto_36326 ) ) ( not ( = ?auto_36316 ?auto_36326 ) ) ( not ( = ?auto_36330 ?auto_36326 ) ) ( not ( = ?auto_36325 ?auto_36326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36317 ?auto_36318 ?auto_36319 )
      ( MAKE-4CRATE-VERIFY ?auto_36315 ?auto_36316 ?auto_36317 ?auto_36318 ?auto_36319 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36334 - SURFACE
      ?auto_36335 - SURFACE
      ?auto_36336 - SURFACE
      ?auto_36337 - SURFACE
      ?auto_36338 - SURFACE
      ?auto_36339 - SURFACE
    )
    :vars
    (
      ?auto_36352 - HOIST
      ?auto_36351 - PLACE
      ?auto_36344 - PLACE
      ?auto_36346 - HOIST
      ?auto_36348 - SURFACE
      ?auto_36341 - PLACE
      ?auto_36347 - HOIST
      ?auto_36342 - SURFACE
      ?auto_36343 - PLACE
      ?auto_36350 - HOIST
      ?auto_36349 - SURFACE
      ?auto_36345 - SURFACE
      ?auto_36340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36352 ?auto_36351 ) ( IS-CRATE ?auto_36339 ) ( not ( = ?auto_36338 ?auto_36339 ) ) ( not ( = ?auto_36337 ?auto_36338 ) ) ( not ( = ?auto_36337 ?auto_36339 ) ) ( not ( = ?auto_36344 ?auto_36351 ) ) ( HOIST-AT ?auto_36346 ?auto_36344 ) ( not ( = ?auto_36352 ?auto_36346 ) ) ( SURFACE-AT ?auto_36339 ?auto_36344 ) ( ON ?auto_36339 ?auto_36348 ) ( CLEAR ?auto_36339 ) ( not ( = ?auto_36338 ?auto_36348 ) ) ( not ( = ?auto_36339 ?auto_36348 ) ) ( not ( = ?auto_36337 ?auto_36348 ) ) ( IS-CRATE ?auto_36338 ) ( not ( = ?auto_36341 ?auto_36351 ) ) ( not ( = ?auto_36344 ?auto_36341 ) ) ( HOIST-AT ?auto_36347 ?auto_36341 ) ( not ( = ?auto_36352 ?auto_36347 ) ) ( not ( = ?auto_36346 ?auto_36347 ) ) ( AVAILABLE ?auto_36347 ) ( SURFACE-AT ?auto_36338 ?auto_36341 ) ( ON ?auto_36338 ?auto_36342 ) ( CLEAR ?auto_36338 ) ( not ( = ?auto_36338 ?auto_36342 ) ) ( not ( = ?auto_36339 ?auto_36342 ) ) ( not ( = ?auto_36337 ?auto_36342 ) ) ( not ( = ?auto_36348 ?auto_36342 ) ) ( IS-CRATE ?auto_36337 ) ( not ( = ?auto_36336 ?auto_36337 ) ) ( not ( = ?auto_36338 ?auto_36336 ) ) ( not ( = ?auto_36339 ?auto_36336 ) ) ( not ( = ?auto_36348 ?auto_36336 ) ) ( not ( = ?auto_36342 ?auto_36336 ) ) ( not ( = ?auto_36343 ?auto_36351 ) ) ( not ( = ?auto_36344 ?auto_36343 ) ) ( not ( = ?auto_36341 ?auto_36343 ) ) ( HOIST-AT ?auto_36350 ?auto_36343 ) ( not ( = ?auto_36352 ?auto_36350 ) ) ( not ( = ?auto_36346 ?auto_36350 ) ) ( not ( = ?auto_36347 ?auto_36350 ) ) ( AVAILABLE ?auto_36350 ) ( SURFACE-AT ?auto_36337 ?auto_36343 ) ( ON ?auto_36337 ?auto_36349 ) ( CLEAR ?auto_36337 ) ( not ( = ?auto_36338 ?auto_36349 ) ) ( not ( = ?auto_36339 ?auto_36349 ) ) ( not ( = ?auto_36337 ?auto_36349 ) ) ( not ( = ?auto_36348 ?auto_36349 ) ) ( not ( = ?auto_36342 ?auto_36349 ) ) ( not ( = ?auto_36336 ?auto_36349 ) ) ( IS-CRATE ?auto_36336 ) ( not ( = ?auto_36335 ?auto_36336 ) ) ( not ( = ?auto_36338 ?auto_36335 ) ) ( not ( = ?auto_36339 ?auto_36335 ) ) ( not ( = ?auto_36337 ?auto_36335 ) ) ( not ( = ?auto_36348 ?auto_36335 ) ) ( not ( = ?auto_36342 ?auto_36335 ) ) ( not ( = ?auto_36349 ?auto_36335 ) ) ( AVAILABLE ?auto_36346 ) ( SURFACE-AT ?auto_36336 ?auto_36344 ) ( ON ?auto_36336 ?auto_36345 ) ( CLEAR ?auto_36336 ) ( not ( = ?auto_36338 ?auto_36345 ) ) ( not ( = ?auto_36339 ?auto_36345 ) ) ( not ( = ?auto_36337 ?auto_36345 ) ) ( not ( = ?auto_36348 ?auto_36345 ) ) ( not ( = ?auto_36342 ?auto_36345 ) ) ( not ( = ?auto_36336 ?auto_36345 ) ) ( not ( = ?auto_36349 ?auto_36345 ) ) ( not ( = ?auto_36335 ?auto_36345 ) ) ( TRUCK-AT ?auto_36340 ?auto_36351 ) ( SURFACE-AT ?auto_36334 ?auto_36351 ) ( CLEAR ?auto_36334 ) ( LIFTING ?auto_36352 ?auto_36335 ) ( IS-CRATE ?auto_36335 ) ( not ( = ?auto_36334 ?auto_36335 ) ) ( not ( = ?auto_36338 ?auto_36334 ) ) ( not ( = ?auto_36339 ?auto_36334 ) ) ( not ( = ?auto_36337 ?auto_36334 ) ) ( not ( = ?auto_36348 ?auto_36334 ) ) ( not ( = ?auto_36342 ?auto_36334 ) ) ( not ( = ?auto_36336 ?auto_36334 ) ) ( not ( = ?auto_36349 ?auto_36334 ) ) ( not ( = ?auto_36345 ?auto_36334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36337 ?auto_36338 ?auto_36339 )
      ( MAKE-5CRATE-VERIFY ?auto_36334 ?auto_36335 ?auto_36336 ?auto_36337 ?auto_36338 ?auto_36339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36353 - SURFACE
      ?auto_36354 - SURFACE
    )
    :vars
    (
      ?auto_36371 - HOIST
      ?auto_36369 - PLACE
      ?auto_36365 - SURFACE
      ?auto_36360 - PLACE
      ?auto_36363 - HOIST
      ?auto_36366 - SURFACE
      ?auto_36357 - PLACE
      ?auto_36364 - HOIST
      ?auto_36358 - SURFACE
      ?auto_36370 - SURFACE
      ?auto_36359 - PLACE
      ?auto_36368 - HOIST
      ?auto_36367 - SURFACE
      ?auto_36356 - SURFACE
      ?auto_36361 - SURFACE
      ?auto_36355 - TRUCK
      ?auto_36362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36371 ?auto_36369 ) ( IS-CRATE ?auto_36354 ) ( not ( = ?auto_36353 ?auto_36354 ) ) ( not ( = ?auto_36365 ?auto_36353 ) ) ( not ( = ?auto_36365 ?auto_36354 ) ) ( not ( = ?auto_36360 ?auto_36369 ) ) ( HOIST-AT ?auto_36363 ?auto_36360 ) ( not ( = ?auto_36371 ?auto_36363 ) ) ( SURFACE-AT ?auto_36354 ?auto_36360 ) ( ON ?auto_36354 ?auto_36366 ) ( CLEAR ?auto_36354 ) ( not ( = ?auto_36353 ?auto_36366 ) ) ( not ( = ?auto_36354 ?auto_36366 ) ) ( not ( = ?auto_36365 ?auto_36366 ) ) ( IS-CRATE ?auto_36353 ) ( not ( = ?auto_36357 ?auto_36369 ) ) ( not ( = ?auto_36360 ?auto_36357 ) ) ( HOIST-AT ?auto_36364 ?auto_36357 ) ( not ( = ?auto_36371 ?auto_36364 ) ) ( not ( = ?auto_36363 ?auto_36364 ) ) ( AVAILABLE ?auto_36364 ) ( SURFACE-AT ?auto_36353 ?auto_36357 ) ( ON ?auto_36353 ?auto_36358 ) ( CLEAR ?auto_36353 ) ( not ( = ?auto_36353 ?auto_36358 ) ) ( not ( = ?auto_36354 ?auto_36358 ) ) ( not ( = ?auto_36365 ?auto_36358 ) ) ( not ( = ?auto_36366 ?auto_36358 ) ) ( IS-CRATE ?auto_36365 ) ( not ( = ?auto_36370 ?auto_36365 ) ) ( not ( = ?auto_36353 ?auto_36370 ) ) ( not ( = ?auto_36354 ?auto_36370 ) ) ( not ( = ?auto_36366 ?auto_36370 ) ) ( not ( = ?auto_36358 ?auto_36370 ) ) ( not ( = ?auto_36359 ?auto_36369 ) ) ( not ( = ?auto_36360 ?auto_36359 ) ) ( not ( = ?auto_36357 ?auto_36359 ) ) ( HOIST-AT ?auto_36368 ?auto_36359 ) ( not ( = ?auto_36371 ?auto_36368 ) ) ( not ( = ?auto_36363 ?auto_36368 ) ) ( not ( = ?auto_36364 ?auto_36368 ) ) ( AVAILABLE ?auto_36368 ) ( SURFACE-AT ?auto_36365 ?auto_36359 ) ( ON ?auto_36365 ?auto_36367 ) ( CLEAR ?auto_36365 ) ( not ( = ?auto_36353 ?auto_36367 ) ) ( not ( = ?auto_36354 ?auto_36367 ) ) ( not ( = ?auto_36365 ?auto_36367 ) ) ( not ( = ?auto_36366 ?auto_36367 ) ) ( not ( = ?auto_36358 ?auto_36367 ) ) ( not ( = ?auto_36370 ?auto_36367 ) ) ( IS-CRATE ?auto_36370 ) ( not ( = ?auto_36356 ?auto_36370 ) ) ( not ( = ?auto_36353 ?auto_36356 ) ) ( not ( = ?auto_36354 ?auto_36356 ) ) ( not ( = ?auto_36365 ?auto_36356 ) ) ( not ( = ?auto_36366 ?auto_36356 ) ) ( not ( = ?auto_36358 ?auto_36356 ) ) ( not ( = ?auto_36367 ?auto_36356 ) ) ( AVAILABLE ?auto_36363 ) ( SURFACE-AT ?auto_36370 ?auto_36360 ) ( ON ?auto_36370 ?auto_36361 ) ( CLEAR ?auto_36370 ) ( not ( = ?auto_36353 ?auto_36361 ) ) ( not ( = ?auto_36354 ?auto_36361 ) ) ( not ( = ?auto_36365 ?auto_36361 ) ) ( not ( = ?auto_36366 ?auto_36361 ) ) ( not ( = ?auto_36358 ?auto_36361 ) ) ( not ( = ?auto_36370 ?auto_36361 ) ) ( not ( = ?auto_36367 ?auto_36361 ) ) ( not ( = ?auto_36356 ?auto_36361 ) ) ( TRUCK-AT ?auto_36355 ?auto_36369 ) ( SURFACE-AT ?auto_36362 ?auto_36369 ) ( CLEAR ?auto_36362 ) ( IS-CRATE ?auto_36356 ) ( not ( = ?auto_36362 ?auto_36356 ) ) ( not ( = ?auto_36353 ?auto_36362 ) ) ( not ( = ?auto_36354 ?auto_36362 ) ) ( not ( = ?auto_36365 ?auto_36362 ) ) ( not ( = ?auto_36366 ?auto_36362 ) ) ( not ( = ?auto_36358 ?auto_36362 ) ) ( not ( = ?auto_36370 ?auto_36362 ) ) ( not ( = ?auto_36367 ?auto_36362 ) ) ( not ( = ?auto_36361 ?auto_36362 ) ) ( AVAILABLE ?auto_36371 ) ( IN ?auto_36356 ?auto_36355 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36371 ?auto_36356 ?auto_36355 ?auto_36369 )
      ( MAKE-2CRATE ?auto_36365 ?auto_36353 ?auto_36354 )
      ( MAKE-1CRATE-VERIFY ?auto_36353 ?auto_36354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36372 - SURFACE
      ?auto_36373 - SURFACE
      ?auto_36374 - SURFACE
    )
    :vars
    (
      ?auto_36385 - HOIST
      ?auto_36382 - PLACE
      ?auto_36376 - PLACE
      ?auto_36388 - HOIST
      ?auto_36384 - SURFACE
      ?auto_36383 - PLACE
      ?auto_36390 - HOIST
      ?auto_36375 - SURFACE
      ?auto_36386 - SURFACE
      ?auto_36377 - PLACE
      ?auto_36381 - HOIST
      ?auto_36379 - SURFACE
      ?auto_36389 - SURFACE
      ?auto_36380 - SURFACE
      ?auto_36387 - TRUCK
      ?auto_36378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36385 ?auto_36382 ) ( IS-CRATE ?auto_36374 ) ( not ( = ?auto_36373 ?auto_36374 ) ) ( not ( = ?auto_36372 ?auto_36373 ) ) ( not ( = ?auto_36372 ?auto_36374 ) ) ( not ( = ?auto_36376 ?auto_36382 ) ) ( HOIST-AT ?auto_36388 ?auto_36376 ) ( not ( = ?auto_36385 ?auto_36388 ) ) ( SURFACE-AT ?auto_36374 ?auto_36376 ) ( ON ?auto_36374 ?auto_36384 ) ( CLEAR ?auto_36374 ) ( not ( = ?auto_36373 ?auto_36384 ) ) ( not ( = ?auto_36374 ?auto_36384 ) ) ( not ( = ?auto_36372 ?auto_36384 ) ) ( IS-CRATE ?auto_36373 ) ( not ( = ?auto_36383 ?auto_36382 ) ) ( not ( = ?auto_36376 ?auto_36383 ) ) ( HOIST-AT ?auto_36390 ?auto_36383 ) ( not ( = ?auto_36385 ?auto_36390 ) ) ( not ( = ?auto_36388 ?auto_36390 ) ) ( AVAILABLE ?auto_36390 ) ( SURFACE-AT ?auto_36373 ?auto_36383 ) ( ON ?auto_36373 ?auto_36375 ) ( CLEAR ?auto_36373 ) ( not ( = ?auto_36373 ?auto_36375 ) ) ( not ( = ?auto_36374 ?auto_36375 ) ) ( not ( = ?auto_36372 ?auto_36375 ) ) ( not ( = ?auto_36384 ?auto_36375 ) ) ( IS-CRATE ?auto_36372 ) ( not ( = ?auto_36386 ?auto_36372 ) ) ( not ( = ?auto_36373 ?auto_36386 ) ) ( not ( = ?auto_36374 ?auto_36386 ) ) ( not ( = ?auto_36384 ?auto_36386 ) ) ( not ( = ?auto_36375 ?auto_36386 ) ) ( not ( = ?auto_36377 ?auto_36382 ) ) ( not ( = ?auto_36376 ?auto_36377 ) ) ( not ( = ?auto_36383 ?auto_36377 ) ) ( HOIST-AT ?auto_36381 ?auto_36377 ) ( not ( = ?auto_36385 ?auto_36381 ) ) ( not ( = ?auto_36388 ?auto_36381 ) ) ( not ( = ?auto_36390 ?auto_36381 ) ) ( AVAILABLE ?auto_36381 ) ( SURFACE-AT ?auto_36372 ?auto_36377 ) ( ON ?auto_36372 ?auto_36379 ) ( CLEAR ?auto_36372 ) ( not ( = ?auto_36373 ?auto_36379 ) ) ( not ( = ?auto_36374 ?auto_36379 ) ) ( not ( = ?auto_36372 ?auto_36379 ) ) ( not ( = ?auto_36384 ?auto_36379 ) ) ( not ( = ?auto_36375 ?auto_36379 ) ) ( not ( = ?auto_36386 ?auto_36379 ) ) ( IS-CRATE ?auto_36386 ) ( not ( = ?auto_36389 ?auto_36386 ) ) ( not ( = ?auto_36373 ?auto_36389 ) ) ( not ( = ?auto_36374 ?auto_36389 ) ) ( not ( = ?auto_36372 ?auto_36389 ) ) ( not ( = ?auto_36384 ?auto_36389 ) ) ( not ( = ?auto_36375 ?auto_36389 ) ) ( not ( = ?auto_36379 ?auto_36389 ) ) ( AVAILABLE ?auto_36388 ) ( SURFACE-AT ?auto_36386 ?auto_36376 ) ( ON ?auto_36386 ?auto_36380 ) ( CLEAR ?auto_36386 ) ( not ( = ?auto_36373 ?auto_36380 ) ) ( not ( = ?auto_36374 ?auto_36380 ) ) ( not ( = ?auto_36372 ?auto_36380 ) ) ( not ( = ?auto_36384 ?auto_36380 ) ) ( not ( = ?auto_36375 ?auto_36380 ) ) ( not ( = ?auto_36386 ?auto_36380 ) ) ( not ( = ?auto_36379 ?auto_36380 ) ) ( not ( = ?auto_36389 ?auto_36380 ) ) ( TRUCK-AT ?auto_36387 ?auto_36382 ) ( SURFACE-AT ?auto_36378 ?auto_36382 ) ( CLEAR ?auto_36378 ) ( IS-CRATE ?auto_36389 ) ( not ( = ?auto_36378 ?auto_36389 ) ) ( not ( = ?auto_36373 ?auto_36378 ) ) ( not ( = ?auto_36374 ?auto_36378 ) ) ( not ( = ?auto_36372 ?auto_36378 ) ) ( not ( = ?auto_36384 ?auto_36378 ) ) ( not ( = ?auto_36375 ?auto_36378 ) ) ( not ( = ?auto_36386 ?auto_36378 ) ) ( not ( = ?auto_36379 ?auto_36378 ) ) ( not ( = ?auto_36380 ?auto_36378 ) ) ( AVAILABLE ?auto_36385 ) ( IN ?auto_36389 ?auto_36387 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36373 ?auto_36374 )
      ( MAKE-2CRATE-VERIFY ?auto_36372 ?auto_36373 ?auto_36374 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36391 - SURFACE
      ?auto_36392 - SURFACE
      ?auto_36393 - SURFACE
      ?auto_36394 - SURFACE
    )
    :vars
    (
      ?auto_36408 - HOIST
      ?auto_36401 - PLACE
      ?auto_36407 - PLACE
      ?auto_36404 - HOIST
      ?auto_36409 - SURFACE
      ?auto_36399 - PLACE
      ?auto_36396 - HOIST
      ?auto_36402 - SURFACE
      ?auto_36406 - PLACE
      ?auto_36405 - HOIST
      ?auto_36398 - SURFACE
      ?auto_36397 - SURFACE
      ?auto_36395 - SURFACE
      ?auto_36403 - TRUCK
      ?auto_36400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36408 ?auto_36401 ) ( IS-CRATE ?auto_36394 ) ( not ( = ?auto_36393 ?auto_36394 ) ) ( not ( = ?auto_36392 ?auto_36393 ) ) ( not ( = ?auto_36392 ?auto_36394 ) ) ( not ( = ?auto_36407 ?auto_36401 ) ) ( HOIST-AT ?auto_36404 ?auto_36407 ) ( not ( = ?auto_36408 ?auto_36404 ) ) ( SURFACE-AT ?auto_36394 ?auto_36407 ) ( ON ?auto_36394 ?auto_36409 ) ( CLEAR ?auto_36394 ) ( not ( = ?auto_36393 ?auto_36409 ) ) ( not ( = ?auto_36394 ?auto_36409 ) ) ( not ( = ?auto_36392 ?auto_36409 ) ) ( IS-CRATE ?auto_36393 ) ( not ( = ?auto_36399 ?auto_36401 ) ) ( not ( = ?auto_36407 ?auto_36399 ) ) ( HOIST-AT ?auto_36396 ?auto_36399 ) ( not ( = ?auto_36408 ?auto_36396 ) ) ( not ( = ?auto_36404 ?auto_36396 ) ) ( AVAILABLE ?auto_36396 ) ( SURFACE-AT ?auto_36393 ?auto_36399 ) ( ON ?auto_36393 ?auto_36402 ) ( CLEAR ?auto_36393 ) ( not ( = ?auto_36393 ?auto_36402 ) ) ( not ( = ?auto_36394 ?auto_36402 ) ) ( not ( = ?auto_36392 ?auto_36402 ) ) ( not ( = ?auto_36409 ?auto_36402 ) ) ( IS-CRATE ?auto_36392 ) ( not ( = ?auto_36391 ?auto_36392 ) ) ( not ( = ?auto_36393 ?auto_36391 ) ) ( not ( = ?auto_36394 ?auto_36391 ) ) ( not ( = ?auto_36409 ?auto_36391 ) ) ( not ( = ?auto_36402 ?auto_36391 ) ) ( not ( = ?auto_36406 ?auto_36401 ) ) ( not ( = ?auto_36407 ?auto_36406 ) ) ( not ( = ?auto_36399 ?auto_36406 ) ) ( HOIST-AT ?auto_36405 ?auto_36406 ) ( not ( = ?auto_36408 ?auto_36405 ) ) ( not ( = ?auto_36404 ?auto_36405 ) ) ( not ( = ?auto_36396 ?auto_36405 ) ) ( AVAILABLE ?auto_36405 ) ( SURFACE-AT ?auto_36392 ?auto_36406 ) ( ON ?auto_36392 ?auto_36398 ) ( CLEAR ?auto_36392 ) ( not ( = ?auto_36393 ?auto_36398 ) ) ( not ( = ?auto_36394 ?auto_36398 ) ) ( not ( = ?auto_36392 ?auto_36398 ) ) ( not ( = ?auto_36409 ?auto_36398 ) ) ( not ( = ?auto_36402 ?auto_36398 ) ) ( not ( = ?auto_36391 ?auto_36398 ) ) ( IS-CRATE ?auto_36391 ) ( not ( = ?auto_36397 ?auto_36391 ) ) ( not ( = ?auto_36393 ?auto_36397 ) ) ( not ( = ?auto_36394 ?auto_36397 ) ) ( not ( = ?auto_36392 ?auto_36397 ) ) ( not ( = ?auto_36409 ?auto_36397 ) ) ( not ( = ?auto_36402 ?auto_36397 ) ) ( not ( = ?auto_36398 ?auto_36397 ) ) ( AVAILABLE ?auto_36404 ) ( SURFACE-AT ?auto_36391 ?auto_36407 ) ( ON ?auto_36391 ?auto_36395 ) ( CLEAR ?auto_36391 ) ( not ( = ?auto_36393 ?auto_36395 ) ) ( not ( = ?auto_36394 ?auto_36395 ) ) ( not ( = ?auto_36392 ?auto_36395 ) ) ( not ( = ?auto_36409 ?auto_36395 ) ) ( not ( = ?auto_36402 ?auto_36395 ) ) ( not ( = ?auto_36391 ?auto_36395 ) ) ( not ( = ?auto_36398 ?auto_36395 ) ) ( not ( = ?auto_36397 ?auto_36395 ) ) ( TRUCK-AT ?auto_36403 ?auto_36401 ) ( SURFACE-AT ?auto_36400 ?auto_36401 ) ( CLEAR ?auto_36400 ) ( IS-CRATE ?auto_36397 ) ( not ( = ?auto_36400 ?auto_36397 ) ) ( not ( = ?auto_36393 ?auto_36400 ) ) ( not ( = ?auto_36394 ?auto_36400 ) ) ( not ( = ?auto_36392 ?auto_36400 ) ) ( not ( = ?auto_36409 ?auto_36400 ) ) ( not ( = ?auto_36402 ?auto_36400 ) ) ( not ( = ?auto_36391 ?auto_36400 ) ) ( not ( = ?auto_36398 ?auto_36400 ) ) ( not ( = ?auto_36395 ?auto_36400 ) ) ( AVAILABLE ?auto_36408 ) ( IN ?auto_36397 ?auto_36403 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36392 ?auto_36393 ?auto_36394 )
      ( MAKE-3CRATE-VERIFY ?auto_36391 ?auto_36392 ?auto_36393 ?auto_36394 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36410 - SURFACE
      ?auto_36411 - SURFACE
      ?auto_36412 - SURFACE
      ?auto_36413 - SURFACE
      ?auto_36414 - SURFACE
    )
    :vars
    (
      ?auto_36427 - HOIST
      ?auto_36420 - PLACE
      ?auto_36426 - PLACE
      ?auto_36423 - HOIST
      ?auto_36428 - SURFACE
      ?auto_36418 - PLACE
      ?auto_36416 - HOIST
      ?auto_36421 - SURFACE
      ?auto_36425 - PLACE
      ?auto_36424 - HOIST
      ?auto_36417 - SURFACE
      ?auto_36415 - SURFACE
      ?auto_36422 - TRUCK
      ?auto_36419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36427 ?auto_36420 ) ( IS-CRATE ?auto_36414 ) ( not ( = ?auto_36413 ?auto_36414 ) ) ( not ( = ?auto_36412 ?auto_36413 ) ) ( not ( = ?auto_36412 ?auto_36414 ) ) ( not ( = ?auto_36426 ?auto_36420 ) ) ( HOIST-AT ?auto_36423 ?auto_36426 ) ( not ( = ?auto_36427 ?auto_36423 ) ) ( SURFACE-AT ?auto_36414 ?auto_36426 ) ( ON ?auto_36414 ?auto_36428 ) ( CLEAR ?auto_36414 ) ( not ( = ?auto_36413 ?auto_36428 ) ) ( not ( = ?auto_36414 ?auto_36428 ) ) ( not ( = ?auto_36412 ?auto_36428 ) ) ( IS-CRATE ?auto_36413 ) ( not ( = ?auto_36418 ?auto_36420 ) ) ( not ( = ?auto_36426 ?auto_36418 ) ) ( HOIST-AT ?auto_36416 ?auto_36418 ) ( not ( = ?auto_36427 ?auto_36416 ) ) ( not ( = ?auto_36423 ?auto_36416 ) ) ( AVAILABLE ?auto_36416 ) ( SURFACE-AT ?auto_36413 ?auto_36418 ) ( ON ?auto_36413 ?auto_36421 ) ( CLEAR ?auto_36413 ) ( not ( = ?auto_36413 ?auto_36421 ) ) ( not ( = ?auto_36414 ?auto_36421 ) ) ( not ( = ?auto_36412 ?auto_36421 ) ) ( not ( = ?auto_36428 ?auto_36421 ) ) ( IS-CRATE ?auto_36412 ) ( not ( = ?auto_36411 ?auto_36412 ) ) ( not ( = ?auto_36413 ?auto_36411 ) ) ( not ( = ?auto_36414 ?auto_36411 ) ) ( not ( = ?auto_36428 ?auto_36411 ) ) ( not ( = ?auto_36421 ?auto_36411 ) ) ( not ( = ?auto_36425 ?auto_36420 ) ) ( not ( = ?auto_36426 ?auto_36425 ) ) ( not ( = ?auto_36418 ?auto_36425 ) ) ( HOIST-AT ?auto_36424 ?auto_36425 ) ( not ( = ?auto_36427 ?auto_36424 ) ) ( not ( = ?auto_36423 ?auto_36424 ) ) ( not ( = ?auto_36416 ?auto_36424 ) ) ( AVAILABLE ?auto_36424 ) ( SURFACE-AT ?auto_36412 ?auto_36425 ) ( ON ?auto_36412 ?auto_36417 ) ( CLEAR ?auto_36412 ) ( not ( = ?auto_36413 ?auto_36417 ) ) ( not ( = ?auto_36414 ?auto_36417 ) ) ( not ( = ?auto_36412 ?auto_36417 ) ) ( not ( = ?auto_36428 ?auto_36417 ) ) ( not ( = ?auto_36421 ?auto_36417 ) ) ( not ( = ?auto_36411 ?auto_36417 ) ) ( IS-CRATE ?auto_36411 ) ( not ( = ?auto_36410 ?auto_36411 ) ) ( not ( = ?auto_36413 ?auto_36410 ) ) ( not ( = ?auto_36414 ?auto_36410 ) ) ( not ( = ?auto_36412 ?auto_36410 ) ) ( not ( = ?auto_36428 ?auto_36410 ) ) ( not ( = ?auto_36421 ?auto_36410 ) ) ( not ( = ?auto_36417 ?auto_36410 ) ) ( AVAILABLE ?auto_36423 ) ( SURFACE-AT ?auto_36411 ?auto_36426 ) ( ON ?auto_36411 ?auto_36415 ) ( CLEAR ?auto_36411 ) ( not ( = ?auto_36413 ?auto_36415 ) ) ( not ( = ?auto_36414 ?auto_36415 ) ) ( not ( = ?auto_36412 ?auto_36415 ) ) ( not ( = ?auto_36428 ?auto_36415 ) ) ( not ( = ?auto_36421 ?auto_36415 ) ) ( not ( = ?auto_36411 ?auto_36415 ) ) ( not ( = ?auto_36417 ?auto_36415 ) ) ( not ( = ?auto_36410 ?auto_36415 ) ) ( TRUCK-AT ?auto_36422 ?auto_36420 ) ( SURFACE-AT ?auto_36419 ?auto_36420 ) ( CLEAR ?auto_36419 ) ( IS-CRATE ?auto_36410 ) ( not ( = ?auto_36419 ?auto_36410 ) ) ( not ( = ?auto_36413 ?auto_36419 ) ) ( not ( = ?auto_36414 ?auto_36419 ) ) ( not ( = ?auto_36412 ?auto_36419 ) ) ( not ( = ?auto_36428 ?auto_36419 ) ) ( not ( = ?auto_36421 ?auto_36419 ) ) ( not ( = ?auto_36411 ?auto_36419 ) ) ( not ( = ?auto_36417 ?auto_36419 ) ) ( not ( = ?auto_36415 ?auto_36419 ) ) ( AVAILABLE ?auto_36427 ) ( IN ?auto_36410 ?auto_36422 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36412 ?auto_36413 ?auto_36414 )
      ( MAKE-4CRATE-VERIFY ?auto_36410 ?auto_36411 ?auto_36412 ?auto_36413 ?auto_36414 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36429 - SURFACE
      ?auto_36430 - SURFACE
      ?auto_36431 - SURFACE
      ?auto_36432 - SURFACE
      ?auto_36433 - SURFACE
      ?auto_36434 - SURFACE
    )
    :vars
    (
      ?auto_36446 - HOIST
      ?auto_36439 - PLACE
      ?auto_36445 - PLACE
      ?auto_36442 - HOIST
      ?auto_36447 - SURFACE
      ?auto_36438 - PLACE
      ?auto_36436 - HOIST
      ?auto_36440 - SURFACE
      ?auto_36444 - PLACE
      ?auto_36443 - HOIST
      ?auto_36437 - SURFACE
      ?auto_36435 - SURFACE
      ?auto_36441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36446 ?auto_36439 ) ( IS-CRATE ?auto_36434 ) ( not ( = ?auto_36433 ?auto_36434 ) ) ( not ( = ?auto_36432 ?auto_36433 ) ) ( not ( = ?auto_36432 ?auto_36434 ) ) ( not ( = ?auto_36445 ?auto_36439 ) ) ( HOIST-AT ?auto_36442 ?auto_36445 ) ( not ( = ?auto_36446 ?auto_36442 ) ) ( SURFACE-AT ?auto_36434 ?auto_36445 ) ( ON ?auto_36434 ?auto_36447 ) ( CLEAR ?auto_36434 ) ( not ( = ?auto_36433 ?auto_36447 ) ) ( not ( = ?auto_36434 ?auto_36447 ) ) ( not ( = ?auto_36432 ?auto_36447 ) ) ( IS-CRATE ?auto_36433 ) ( not ( = ?auto_36438 ?auto_36439 ) ) ( not ( = ?auto_36445 ?auto_36438 ) ) ( HOIST-AT ?auto_36436 ?auto_36438 ) ( not ( = ?auto_36446 ?auto_36436 ) ) ( not ( = ?auto_36442 ?auto_36436 ) ) ( AVAILABLE ?auto_36436 ) ( SURFACE-AT ?auto_36433 ?auto_36438 ) ( ON ?auto_36433 ?auto_36440 ) ( CLEAR ?auto_36433 ) ( not ( = ?auto_36433 ?auto_36440 ) ) ( not ( = ?auto_36434 ?auto_36440 ) ) ( not ( = ?auto_36432 ?auto_36440 ) ) ( not ( = ?auto_36447 ?auto_36440 ) ) ( IS-CRATE ?auto_36432 ) ( not ( = ?auto_36431 ?auto_36432 ) ) ( not ( = ?auto_36433 ?auto_36431 ) ) ( not ( = ?auto_36434 ?auto_36431 ) ) ( not ( = ?auto_36447 ?auto_36431 ) ) ( not ( = ?auto_36440 ?auto_36431 ) ) ( not ( = ?auto_36444 ?auto_36439 ) ) ( not ( = ?auto_36445 ?auto_36444 ) ) ( not ( = ?auto_36438 ?auto_36444 ) ) ( HOIST-AT ?auto_36443 ?auto_36444 ) ( not ( = ?auto_36446 ?auto_36443 ) ) ( not ( = ?auto_36442 ?auto_36443 ) ) ( not ( = ?auto_36436 ?auto_36443 ) ) ( AVAILABLE ?auto_36443 ) ( SURFACE-AT ?auto_36432 ?auto_36444 ) ( ON ?auto_36432 ?auto_36437 ) ( CLEAR ?auto_36432 ) ( not ( = ?auto_36433 ?auto_36437 ) ) ( not ( = ?auto_36434 ?auto_36437 ) ) ( not ( = ?auto_36432 ?auto_36437 ) ) ( not ( = ?auto_36447 ?auto_36437 ) ) ( not ( = ?auto_36440 ?auto_36437 ) ) ( not ( = ?auto_36431 ?auto_36437 ) ) ( IS-CRATE ?auto_36431 ) ( not ( = ?auto_36430 ?auto_36431 ) ) ( not ( = ?auto_36433 ?auto_36430 ) ) ( not ( = ?auto_36434 ?auto_36430 ) ) ( not ( = ?auto_36432 ?auto_36430 ) ) ( not ( = ?auto_36447 ?auto_36430 ) ) ( not ( = ?auto_36440 ?auto_36430 ) ) ( not ( = ?auto_36437 ?auto_36430 ) ) ( AVAILABLE ?auto_36442 ) ( SURFACE-AT ?auto_36431 ?auto_36445 ) ( ON ?auto_36431 ?auto_36435 ) ( CLEAR ?auto_36431 ) ( not ( = ?auto_36433 ?auto_36435 ) ) ( not ( = ?auto_36434 ?auto_36435 ) ) ( not ( = ?auto_36432 ?auto_36435 ) ) ( not ( = ?auto_36447 ?auto_36435 ) ) ( not ( = ?auto_36440 ?auto_36435 ) ) ( not ( = ?auto_36431 ?auto_36435 ) ) ( not ( = ?auto_36437 ?auto_36435 ) ) ( not ( = ?auto_36430 ?auto_36435 ) ) ( TRUCK-AT ?auto_36441 ?auto_36439 ) ( SURFACE-AT ?auto_36429 ?auto_36439 ) ( CLEAR ?auto_36429 ) ( IS-CRATE ?auto_36430 ) ( not ( = ?auto_36429 ?auto_36430 ) ) ( not ( = ?auto_36433 ?auto_36429 ) ) ( not ( = ?auto_36434 ?auto_36429 ) ) ( not ( = ?auto_36432 ?auto_36429 ) ) ( not ( = ?auto_36447 ?auto_36429 ) ) ( not ( = ?auto_36440 ?auto_36429 ) ) ( not ( = ?auto_36431 ?auto_36429 ) ) ( not ( = ?auto_36437 ?auto_36429 ) ) ( not ( = ?auto_36435 ?auto_36429 ) ) ( AVAILABLE ?auto_36446 ) ( IN ?auto_36430 ?auto_36441 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36432 ?auto_36433 ?auto_36434 )
      ( MAKE-5CRATE-VERIFY ?auto_36429 ?auto_36430 ?auto_36431 ?auto_36432 ?auto_36433 ?auto_36434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36448 - SURFACE
      ?auto_36449 - SURFACE
    )
    :vars
    (
      ?auto_36465 - HOIST
      ?auto_36457 - PLACE
      ?auto_36464 - SURFACE
      ?auto_36463 - PLACE
      ?auto_36460 - HOIST
      ?auto_36466 - SURFACE
      ?auto_36455 - PLACE
      ?auto_36451 - HOIST
      ?auto_36458 - SURFACE
      ?auto_36454 - SURFACE
      ?auto_36462 - PLACE
      ?auto_36461 - HOIST
      ?auto_36453 - SURFACE
      ?auto_36452 - SURFACE
      ?auto_36450 - SURFACE
      ?auto_36456 - SURFACE
      ?auto_36459 - TRUCK
      ?auto_36467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36465 ?auto_36457 ) ( IS-CRATE ?auto_36449 ) ( not ( = ?auto_36448 ?auto_36449 ) ) ( not ( = ?auto_36464 ?auto_36448 ) ) ( not ( = ?auto_36464 ?auto_36449 ) ) ( not ( = ?auto_36463 ?auto_36457 ) ) ( HOIST-AT ?auto_36460 ?auto_36463 ) ( not ( = ?auto_36465 ?auto_36460 ) ) ( SURFACE-AT ?auto_36449 ?auto_36463 ) ( ON ?auto_36449 ?auto_36466 ) ( CLEAR ?auto_36449 ) ( not ( = ?auto_36448 ?auto_36466 ) ) ( not ( = ?auto_36449 ?auto_36466 ) ) ( not ( = ?auto_36464 ?auto_36466 ) ) ( IS-CRATE ?auto_36448 ) ( not ( = ?auto_36455 ?auto_36457 ) ) ( not ( = ?auto_36463 ?auto_36455 ) ) ( HOIST-AT ?auto_36451 ?auto_36455 ) ( not ( = ?auto_36465 ?auto_36451 ) ) ( not ( = ?auto_36460 ?auto_36451 ) ) ( AVAILABLE ?auto_36451 ) ( SURFACE-AT ?auto_36448 ?auto_36455 ) ( ON ?auto_36448 ?auto_36458 ) ( CLEAR ?auto_36448 ) ( not ( = ?auto_36448 ?auto_36458 ) ) ( not ( = ?auto_36449 ?auto_36458 ) ) ( not ( = ?auto_36464 ?auto_36458 ) ) ( not ( = ?auto_36466 ?auto_36458 ) ) ( IS-CRATE ?auto_36464 ) ( not ( = ?auto_36454 ?auto_36464 ) ) ( not ( = ?auto_36448 ?auto_36454 ) ) ( not ( = ?auto_36449 ?auto_36454 ) ) ( not ( = ?auto_36466 ?auto_36454 ) ) ( not ( = ?auto_36458 ?auto_36454 ) ) ( not ( = ?auto_36462 ?auto_36457 ) ) ( not ( = ?auto_36463 ?auto_36462 ) ) ( not ( = ?auto_36455 ?auto_36462 ) ) ( HOIST-AT ?auto_36461 ?auto_36462 ) ( not ( = ?auto_36465 ?auto_36461 ) ) ( not ( = ?auto_36460 ?auto_36461 ) ) ( not ( = ?auto_36451 ?auto_36461 ) ) ( AVAILABLE ?auto_36461 ) ( SURFACE-AT ?auto_36464 ?auto_36462 ) ( ON ?auto_36464 ?auto_36453 ) ( CLEAR ?auto_36464 ) ( not ( = ?auto_36448 ?auto_36453 ) ) ( not ( = ?auto_36449 ?auto_36453 ) ) ( not ( = ?auto_36464 ?auto_36453 ) ) ( not ( = ?auto_36466 ?auto_36453 ) ) ( not ( = ?auto_36458 ?auto_36453 ) ) ( not ( = ?auto_36454 ?auto_36453 ) ) ( IS-CRATE ?auto_36454 ) ( not ( = ?auto_36452 ?auto_36454 ) ) ( not ( = ?auto_36448 ?auto_36452 ) ) ( not ( = ?auto_36449 ?auto_36452 ) ) ( not ( = ?auto_36464 ?auto_36452 ) ) ( not ( = ?auto_36466 ?auto_36452 ) ) ( not ( = ?auto_36458 ?auto_36452 ) ) ( not ( = ?auto_36453 ?auto_36452 ) ) ( AVAILABLE ?auto_36460 ) ( SURFACE-AT ?auto_36454 ?auto_36463 ) ( ON ?auto_36454 ?auto_36450 ) ( CLEAR ?auto_36454 ) ( not ( = ?auto_36448 ?auto_36450 ) ) ( not ( = ?auto_36449 ?auto_36450 ) ) ( not ( = ?auto_36464 ?auto_36450 ) ) ( not ( = ?auto_36466 ?auto_36450 ) ) ( not ( = ?auto_36458 ?auto_36450 ) ) ( not ( = ?auto_36454 ?auto_36450 ) ) ( not ( = ?auto_36453 ?auto_36450 ) ) ( not ( = ?auto_36452 ?auto_36450 ) ) ( SURFACE-AT ?auto_36456 ?auto_36457 ) ( CLEAR ?auto_36456 ) ( IS-CRATE ?auto_36452 ) ( not ( = ?auto_36456 ?auto_36452 ) ) ( not ( = ?auto_36448 ?auto_36456 ) ) ( not ( = ?auto_36449 ?auto_36456 ) ) ( not ( = ?auto_36464 ?auto_36456 ) ) ( not ( = ?auto_36466 ?auto_36456 ) ) ( not ( = ?auto_36458 ?auto_36456 ) ) ( not ( = ?auto_36454 ?auto_36456 ) ) ( not ( = ?auto_36453 ?auto_36456 ) ) ( not ( = ?auto_36450 ?auto_36456 ) ) ( AVAILABLE ?auto_36465 ) ( IN ?auto_36452 ?auto_36459 ) ( TRUCK-AT ?auto_36459 ?auto_36467 ) ( not ( = ?auto_36467 ?auto_36457 ) ) ( not ( = ?auto_36463 ?auto_36467 ) ) ( not ( = ?auto_36455 ?auto_36467 ) ) ( not ( = ?auto_36462 ?auto_36467 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36459 ?auto_36467 ?auto_36457 )
      ( MAKE-2CRATE ?auto_36464 ?auto_36448 ?auto_36449 )
      ( MAKE-1CRATE-VERIFY ?auto_36448 ?auto_36449 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36468 - SURFACE
      ?auto_36469 - SURFACE
      ?auto_36470 - SURFACE
    )
    :vars
    (
      ?auto_36479 - HOIST
      ?auto_36487 - PLACE
      ?auto_36486 - PLACE
      ?auto_36483 - HOIST
      ?auto_36477 - SURFACE
      ?auto_36480 - PLACE
      ?auto_36471 - HOIST
      ?auto_36473 - SURFACE
      ?auto_36485 - SURFACE
      ?auto_36475 - PLACE
      ?auto_36474 - HOIST
      ?auto_36482 - SURFACE
      ?auto_36472 - SURFACE
      ?auto_36478 - SURFACE
      ?auto_36476 - SURFACE
      ?auto_36484 - TRUCK
      ?auto_36481 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36479 ?auto_36487 ) ( IS-CRATE ?auto_36470 ) ( not ( = ?auto_36469 ?auto_36470 ) ) ( not ( = ?auto_36468 ?auto_36469 ) ) ( not ( = ?auto_36468 ?auto_36470 ) ) ( not ( = ?auto_36486 ?auto_36487 ) ) ( HOIST-AT ?auto_36483 ?auto_36486 ) ( not ( = ?auto_36479 ?auto_36483 ) ) ( SURFACE-AT ?auto_36470 ?auto_36486 ) ( ON ?auto_36470 ?auto_36477 ) ( CLEAR ?auto_36470 ) ( not ( = ?auto_36469 ?auto_36477 ) ) ( not ( = ?auto_36470 ?auto_36477 ) ) ( not ( = ?auto_36468 ?auto_36477 ) ) ( IS-CRATE ?auto_36469 ) ( not ( = ?auto_36480 ?auto_36487 ) ) ( not ( = ?auto_36486 ?auto_36480 ) ) ( HOIST-AT ?auto_36471 ?auto_36480 ) ( not ( = ?auto_36479 ?auto_36471 ) ) ( not ( = ?auto_36483 ?auto_36471 ) ) ( AVAILABLE ?auto_36471 ) ( SURFACE-AT ?auto_36469 ?auto_36480 ) ( ON ?auto_36469 ?auto_36473 ) ( CLEAR ?auto_36469 ) ( not ( = ?auto_36469 ?auto_36473 ) ) ( not ( = ?auto_36470 ?auto_36473 ) ) ( not ( = ?auto_36468 ?auto_36473 ) ) ( not ( = ?auto_36477 ?auto_36473 ) ) ( IS-CRATE ?auto_36468 ) ( not ( = ?auto_36485 ?auto_36468 ) ) ( not ( = ?auto_36469 ?auto_36485 ) ) ( not ( = ?auto_36470 ?auto_36485 ) ) ( not ( = ?auto_36477 ?auto_36485 ) ) ( not ( = ?auto_36473 ?auto_36485 ) ) ( not ( = ?auto_36475 ?auto_36487 ) ) ( not ( = ?auto_36486 ?auto_36475 ) ) ( not ( = ?auto_36480 ?auto_36475 ) ) ( HOIST-AT ?auto_36474 ?auto_36475 ) ( not ( = ?auto_36479 ?auto_36474 ) ) ( not ( = ?auto_36483 ?auto_36474 ) ) ( not ( = ?auto_36471 ?auto_36474 ) ) ( AVAILABLE ?auto_36474 ) ( SURFACE-AT ?auto_36468 ?auto_36475 ) ( ON ?auto_36468 ?auto_36482 ) ( CLEAR ?auto_36468 ) ( not ( = ?auto_36469 ?auto_36482 ) ) ( not ( = ?auto_36470 ?auto_36482 ) ) ( not ( = ?auto_36468 ?auto_36482 ) ) ( not ( = ?auto_36477 ?auto_36482 ) ) ( not ( = ?auto_36473 ?auto_36482 ) ) ( not ( = ?auto_36485 ?auto_36482 ) ) ( IS-CRATE ?auto_36485 ) ( not ( = ?auto_36472 ?auto_36485 ) ) ( not ( = ?auto_36469 ?auto_36472 ) ) ( not ( = ?auto_36470 ?auto_36472 ) ) ( not ( = ?auto_36468 ?auto_36472 ) ) ( not ( = ?auto_36477 ?auto_36472 ) ) ( not ( = ?auto_36473 ?auto_36472 ) ) ( not ( = ?auto_36482 ?auto_36472 ) ) ( AVAILABLE ?auto_36483 ) ( SURFACE-AT ?auto_36485 ?auto_36486 ) ( ON ?auto_36485 ?auto_36478 ) ( CLEAR ?auto_36485 ) ( not ( = ?auto_36469 ?auto_36478 ) ) ( not ( = ?auto_36470 ?auto_36478 ) ) ( not ( = ?auto_36468 ?auto_36478 ) ) ( not ( = ?auto_36477 ?auto_36478 ) ) ( not ( = ?auto_36473 ?auto_36478 ) ) ( not ( = ?auto_36485 ?auto_36478 ) ) ( not ( = ?auto_36482 ?auto_36478 ) ) ( not ( = ?auto_36472 ?auto_36478 ) ) ( SURFACE-AT ?auto_36476 ?auto_36487 ) ( CLEAR ?auto_36476 ) ( IS-CRATE ?auto_36472 ) ( not ( = ?auto_36476 ?auto_36472 ) ) ( not ( = ?auto_36469 ?auto_36476 ) ) ( not ( = ?auto_36470 ?auto_36476 ) ) ( not ( = ?auto_36468 ?auto_36476 ) ) ( not ( = ?auto_36477 ?auto_36476 ) ) ( not ( = ?auto_36473 ?auto_36476 ) ) ( not ( = ?auto_36485 ?auto_36476 ) ) ( not ( = ?auto_36482 ?auto_36476 ) ) ( not ( = ?auto_36478 ?auto_36476 ) ) ( AVAILABLE ?auto_36479 ) ( IN ?auto_36472 ?auto_36484 ) ( TRUCK-AT ?auto_36484 ?auto_36481 ) ( not ( = ?auto_36481 ?auto_36487 ) ) ( not ( = ?auto_36486 ?auto_36481 ) ) ( not ( = ?auto_36480 ?auto_36481 ) ) ( not ( = ?auto_36475 ?auto_36481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36469 ?auto_36470 )
      ( MAKE-2CRATE-VERIFY ?auto_36468 ?auto_36469 ?auto_36470 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36488 - SURFACE
      ?auto_36489 - SURFACE
      ?auto_36490 - SURFACE
      ?auto_36491 - SURFACE
    )
    :vars
    (
      ?auto_36504 - HOIST
      ?auto_36507 - PLACE
      ?auto_36494 - PLACE
      ?auto_36503 - HOIST
      ?auto_36500 - SURFACE
      ?auto_36499 - PLACE
      ?auto_36496 - HOIST
      ?auto_36493 - SURFACE
      ?auto_36505 - PLACE
      ?auto_36497 - HOIST
      ?auto_36492 - SURFACE
      ?auto_36495 - SURFACE
      ?auto_36506 - SURFACE
      ?auto_36502 - SURFACE
      ?auto_36501 - TRUCK
      ?auto_36498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36504 ?auto_36507 ) ( IS-CRATE ?auto_36491 ) ( not ( = ?auto_36490 ?auto_36491 ) ) ( not ( = ?auto_36489 ?auto_36490 ) ) ( not ( = ?auto_36489 ?auto_36491 ) ) ( not ( = ?auto_36494 ?auto_36507 ) ) ( HOIST-AT ?auto_36503 ?auto_36494 ) ( not ( = ?auto_36504 ?auto_36503 ) ) ( SURFACE-AT ?auto_36491 ?auto_36494 ) ( ON ?auto_36491 ?auto_36500 ) ( CLEAR ?auto_36491 ) ( not ( = ?auto_36490 ?auto_36500 ) ) ( not ( = ?auto_36491 ?auto_36500 ) ) ( not ( = ?auto_36489 ?auto_36500 ) ) ( IS-CRATE ?auto_36490 ) ( not ( = ?auto_36499 ?auto_36507 ) ) ( not ( = ?auto_36494 ?auto_36499 ) ) ( HOIST-AT ?auto_36496 ?auto_36499 ) ( not ( = ?auto_36504 ?auto_36496 ) ) ( not ( = ?auto_36503 ?auto_36496 ) ) ( AVAILABLE ?auto_36496 ) ( SURFACE-AT ?auto_36490 ?auto_36499 ) ( ON ?auto_36490 ?auto_36493 ) ( CLEAR ?auto_36490 ) ( not ( = ?auto_36490 ?auto_36493 ) ) ( not ( = ?auto_36491 ?auto_36493 ) ) ( not ( = ?auto_36489 ?auto_36493 ) ) ( not ( = ?auto_36500 ?auto_36493 ) ) ( IS-CRATE ?auto_36489 ) ( not ( = ?auto_36488 ?auto_36489 ) ) ( not ( = ?auto_36490 ?auto_36488 ) ) ( not ( = ?auto_36491 ?auto_36488 ) ) ( not ( = ?auto_36500 ?auto_36488 ) ) ( not ( = ?auto_36493 ?auto_36488 ) ) ( not ( = ?auto_36505 ?auto_36507 ) ) ( not ( = ?auto_36494 ?auto_36505 ) ) ( not ( = ?auto_36499 ?auto_36505 ) ) ( HOIST-AT ?auto_36497 ?auto_36505 ) ( not ( = ?auto_36504 ?auto_36497 ) ) ( not ( = ?auto_36503 ?auto_36497 ) ) ( not ( = ?auto_36496 ?auto_36497 ) ) ( AVAILABLE ?auto_36497 ) ( SURFACE-AT ?auto_36489 ?auto_36505 ) ( ON ?auto_36489 ?auto_36492 ) ( CLEAR ?auto_36489 ) ( not ( = ?auto_36490 ?auto_36492 ) ) ( not ( = ?auto_36491 ?auto_36492 ) ) ( not ( = ?auto_36489 ?auto_36492 ) ) ( not ( = ?auto_36500 ?auto_36492 ) ) ( not ( = ?auto_36493 ?auto_36492 ) ) ( not ( = ?auto_36488 ?auto_36492 ) ) ( IS-CRATE ?auto_36488 ) ( not ( = ?auto_36495 ?auto_36488 ) ) ( not ( = ?auto_36490 ?auto_36495 ) ) ( not ( = ?auto_36491 ?auto_36495 ) ) ( not ( = ?auto_36489 ?auto_36495 ) ) ( not ( = ?auto_36500 ?auto_36495 ) ) ( not ( = ?auto_36493 ?auto_36495 ) ) ( not ( = ?auto_36492 ?auto_36495 ) ) ( AVAILABLE ?auto_36503 ) ( SURFACE-AT ?auto_36488 ?auto_36494 ) ( ON ?auto_36488 ?auto_36506 ) ( CLEAR ?auto_36488 ) ( not ( = ?auto_36490 ?auto_36506 ) ) ( not ( = ?auto_36491 ?auto_36506 ) ) ( not ( = ?auto_36489 ?auto_36506 ) ) ( not ( = ?auto_36500 ?auto_36506 ) ) ( not ( = ?auto_36493 ?auto_36506 ) ) ( not ( = ?auto_36488 ?auto_36506 ) ) ( not ( = ?auto_36492 ?auto_36506 ) ) ( not ( = ?auto_36495 ?auto_36506 ) ) ( SURFACE-AT ?auto_36502 ?auto_36507 ) ( CLEAR ?auto_36502 ) ( IS-CRATE ?auto_36495 ) ( not ( = ?auto_36502 ?auto_36495 ) ) ( not ( = ?auto_36490 ?auto_36502 ) ) ( not ( = ?auto_36491 ?auto_36502 ) ) ( not ( = ?auto_36489 ?auto_36502 ) ) ( not ( = ?auto_36500 ?auto_36502 ) ) ( not ( = ?auto_36493 ?auto_36502 ) ) ( not ( = ?auto_36488 ?auto_36502 ) ) ( not ( = ?auto_36492 ?auto_36502 ) ) ( not ( = ?auto_36506 ?auto_36502 ) ) ( AVAILABLE ?auto_36504 ) ( IN ?auto_36495 ?auto_36501 ) ( TRUCK-AT ?auto_36501 ?auto_36498 ) ( not ( = ?auto_36498 ?auto_36507 ) ) ( not ( = ?auto_36494 ?auto_36498 ) ) ( not ( = ?auto_36499 ?auto_36498 ) ) ( not ( = ?auto_36505 ?auto_36498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36489 ?auto_36490 ?auto_36491 )
      ( MAKE-3CRATE-VERIFY ?auto_36488 ?auto_36489 ?auto_36490 ?auto_36491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36508 - SURFACE
      ?auto_36509 - SURFACE
      ?auto_36510 - SURFACE
      ?auto_36511 - SURFACE
      ?auto_36512 - SURFACE
    )
    :vars
    (
      ?auto_36524 - HOIST
      ?auto_36527 - PLACE
      ?auto_36515 - PLACE
      ?auto_36523 - HOIST
      ?auto_36520 - SURFACE
      ?auto_36519 - PLACE
      ?auto_36516 - HOIST
      ?auto_36514 - SURFACE
      ?auto_36525 - PLACE
      ?auto_36517 - HOIST
      ?auto_36513 - SURFACE
      ?auto_36526 - SURFACE
      ?auto_36522 - SURFACE
      ?auto_36521 - TRUCK
      ?auto_36518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36524 ?auto_36527 ) ( IS-CRATE ?auto_36512 ) ( not ( = ?auto_36511 ?auto_36512 ) ) ( not ( = ?auto_36510 ?auto_36511 ) ) ( not ( = ?auto_36510 ?auto_36512 ) ) ( not ( = ?auto_36515 ?auto_36527 ) ) ( HOIST-AT ?auto_36523 ?auto_36515 ) ( not ( = ?auto_36524 ?auto_36523 ) ) ( SURFACE-AT ?auto_36512 ?auto_36515 ) ( ON ?auto_36512 ?auto_36520 ) ( CLEAR ?auto_36512 ) ( not ( = ?auto_36511 ?auto_36520 ) ) ( not ( = ?auto_36512 ?auto_36520 ) ) ( not ( = ?auto_36510 ?auto_36520 ) ) ( IS-CRATE ?auto_36511 ) ( not ( = ?auto_36519 ?auto_36527 ) ) ( not ( = ?auto_36515 ?auto_36519 ) ) ( HOIST-AT ?auto_36516 ?auto_36519 ) ( not ( = ?auto_36524 ?auto_36516 ) ) ( not ( = ?auto_36523 ?auto_36516 ) ) ( AVAILABLE ?auto_36516 ) ( SURFACE-AT ?auto_36511 ?auto_36519 ) ( ON ?auto_36511 ?auto_36514 ) ( CLEAR ?auto_36511 ) ( not ( = ?auto_36511 ?auto_36514 ) ) ( not ( = ?auto_36512 ?auto_36514 ) ) ( not ( = ?auto_36510 ?auto_36514 ) ) ( not ( = ?auto_36520 ?auto_36514 ) ) ( IS-CRATE ?auto_36510 ) ( not ( = ?auto_36509 ?auto_36510 ) ) ( not ( = ?auto_36511 ?auto_36509 ) ) ( not ( = ?auto_36512 ?auto_36509 ) ) ( not ( = ?auto_36520 ?auto_36509 ) ) ( not ( = ?auto_36514 ?auto_36509 ) ) ( not ( = ?auto_36525 ?auto_36527 ) ) ( not ( = ?auto_36515 ?auto_36525 ) ) ( not ( = ?auto_36519 ?auto_36525 ) ) ( HOIST-AT ?auto_36517 ?auto_36525 ) ( not ( = ?auto_36524 ?auto_36517 ) ) ( not ( = ?auto_36523 ?auto_36517 ) ) ( not ( = ?auto_36516 ?auto_36517 ) ) ( AVAILABLE ?auto_36517 ) ( SURFACE-AT ?auto_36510 ?auto_36525 ) ( ON ?auto_36510 ?auto_36513 ) ( CLEAR ?auto_36510 ) ( not ( = ?auto_36511 ?auto_36513 ) ) ( not ( = ?auto_36512 ?auto_36513 ) ) ( not ( = ?auto_36510 ?auto_36513 ) ) ( not ( = ?auto_36520 ?auto_36513 ) ) ( not ( = ?auto_36514 ?auto_36513 ) ) ( not ( = ?auto_36509 ?auto_36513 ) ) ( IS-CRATE ?auto_36509 ) ( not ( = ?auto_36508 ?auto_36509 ) ) ( not ( = ?auto_36511 ?auto_36508 ) ) ( not ( = ?auto_36512 ?auto_36508 ) ) ( not ( = ?auto_36510 ?auto_36508 ) ) ( not ( = ?auto_36520 ?auto_36508 ) ) ( not ( = ?auto_36514 ?auto_36508 ) ) ( not ( = ?auto_36513 ?auto_36508 ) ) ( AVAILABLE ?auto_36523 ) ( SURFACE-AT ?auto_36509 ?auto_36515 ) ( ON ?auto_36509 ?auto_36526 ) ( CLEAR ?auto_36509 ) ( not ( = ?auto_36511 ?auto_36526 ) ) ( not ( = ?auto_36512 ?auto_36526 ) ) ( not ( = ?auto_36510 ?auto_36526 ) ) ( not ( = ?auto_36520 ?auto_36526 ) ) ( not ( = ?auto_36514 ?auto_36526 ) ) ( not ( = ?auto_36509 ?auto_36526 ) ) ( not ( = ?auto_36513 ?auto_36526 ) ) ( not ( = ?auto_36508 ?auto_36526 ) ) ( SURFACE-AT ?auto_36522 ?auto_36527 ) ( CLEAR ?auto_36522 ) ( IS-CRATE ?auto_36508 ) ( not ( = ?auto_36522 ?auto_36508 ) ) ( not ( = ?auto_36511 ?auto_36522 ) ) ( not ( = ?auto_36512 ?auto_36522 ) ) ( not ( = ?auto_36510 ?auto_36522 ) ) ( not ( = ?auto_36520 ?auto_36522 ) ) ( not ( = ?auto_36514 ?auto_36522 ) ) ( not ( = ?auto_36509 ?auto_36522 ) ) ( not ( = ?auto_36513 ?auto_36522 ) ) ( not ( = ?auto_36526 ?auto_36522 ) ) ( AVAILABLE ?auto_36524 ) ( IN ?auto_36508 ?auto_36521 ) ( TRUCK-AT ?auto_36521 ?auto_36518 ) ( not ( = ?auto_36518 ?auto_36527 ) ) ( not ( = ?auto_36515 ?auto_36518 ) ) ( not ( = ?auto_36519 ?auto_36518 ) ) ( not ( = ?auto_36525 ?auto_36518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36510 ?auto_36511 ?auto_36512 )
      ( MAKE-4CRATE-VERIFY ?auto_36508 ?auto_36509 ?auto_36510 ?auto_36511 ?auto_36512 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36528 - SURFACE
      ?auto_36529 - SURFACE
      ?auto_36530 - SURFACE
      ?auto_36531 - SURFACE
      ?auto_36532 - SURFACE
      ?auto_36533 - SURFACE
    )
    :vars
    (
      ?auto_36544 - HOIST
      ?auto_36547 - PLACE
      ?auto_36536 - PLACE
      ?auto_36543 - HOIST
      ?auto_36541 - SURFACE
      ?auto_36540 - PLACE
      ?auto_36537 - HOIST
      ?auto_36535 - SURFACE
      ?auto_36545 - PLACE
      ?auto_36538 - HOIST
      ?auto_36534 - SURFACE
      ?auto_36546 - SURFACE
      ?auto_36542 - TRUCK
      ?auto_36539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36544 ?auto_36547 ) ( IS-CRATE ?auto_36533 ) ( not ( = ?auto_36532 ?auto_36533 ) ) ( not ( = ?auto_36531 ?auto_36532 ) ) ( not ( = ?auto_36531 ?auto_36533 ) ) ( not ( = ?auto_36536 ?auto_36547 ) ) ( HOIST-AT ?auto_36543 ?auto_36536 ) ( not ( = ?auto_36544 ?auto_36543 ) ) ( SURFACE-AT ?auto_36533 ?auto_36536 ) ( ON ?auto_36533 ?auto_36541 ) ( CLEAR ?auto_36533 ) ( not ( = ?auto_36532 ?auto_36541 ) ) ( not ( = ?auto_36533 ?auto_36541 ) ) ( not ( = ?auto_36531 ?auto_36541 ) ) ( IS-CRATE ?auto_36532 ) ( not ( = ?auto_36540 ?auto_36547 ) ) ( not ( = ?auto_36536 ?auto_36540 ) ) ( HOIST-AT ?auto_36537 ?auto_36540 ) ( not ( = ?auto_36544 ?auto_36537 ) ) ( not ( = ?auto_36543 ?auto_36537 ) ) ( AVAILABLE ?auto_36537 ) ( SURFACE-AT ?auto_36532 ?auto_36540 ) ( ON ?auto_36532 ?auto_36535 ) ( CLEAR ?auto_36532 ) ( not ( = ?auto_36532 ?auto_36535 ) ) ( not ( = ?auto_36533 ?auto_36535 ) ) ( not ( = ?auto_36531 ?auto_36535 ) ) ( not ( = ?auto_36541 ?auto_36535 ) ) ( IS-CRATE ?auto_36531 ) ( not ( = ?auto_36530 ?auto_36531 ) ) ( not ( = ?auto_36532 ?auto_36530 ) ) ( not ( = ?auto_36533 ?auto_36530 ) ) ( not ( = ?auto_36541 ?auto_36530 ) ) ( not ( = ?auto_36535 ?auto_36530 ) ) ( not ( = ?auto_36545 ?auto_36547 ) ) ( not ( = ?auto_36536 ?auto_36545 ) ) ( not ( = ?auto_36540 ?auto_36545 ) ) ( HOIST-AT ?auto_36538 ?auto_36545 ) ( not ( = ?auto_36544 ?auto_36538 ) ) ( not ( = ?auto_36543 ?auto_36538 ) ) ( not ( = ?auto_36537 ?auto_36538 ) ) ( AVAILABLE ?auto_36538 ) ( SURFACE-AT ?auto_36531 ?auto_36545 ) ( ON ?auto_36531 ?auto_36534 ) ( CLEAR ?auto_36531 ) ( not ( = ?auto_36532 ?auto_36534 ) ) ( not ( = ?auto_36533 ?auto_36534 ) ) ( not ( = ?auto_36531 ?auto_36534 ) ) ( not ( = ?auto_36541 ?auto_36534 ) ) ( not ( = ?auto_36535 ?auto_36534 ) ) ( not ( = ?auto_36530 ?auto_36534 ) ) ( IS-CRATE ?auto_36530 ) ( not ( = ?auto_36529 ?auto_36530 ) ) ( not ( = ?auto_36532 ?auto_36529 ) ) ( not ( = ?auto_36533 ?auto_36529 ) ) ( not ( = ?auto_36531 ?auto_36529 ) ) ( not ( = ?auto_36541 ?auto_36529 ) ) ( not ( = ?auto_36535 ?auto_36529 ) ) ( not ( = ?auto_36534 ?auto_36529 ) ) ( AVAILABLE ?auto_36543 ) ( SURFACE-AT ?auto_36530 ?auto_36536 ) ( ON ?auto_36530 ?auto_36546 ) ( CLEAR ?auto_36530 ) ( not ( = ?auto_36532 ?auto_36546 ) ) ( not ( = ?auto_36533 ?auto_36546 ) ) ( not ( = ?auto_36531 ?auto_36546 ) ) ( not ( = ?auto_36541 ?auto_36546 ) ) ( not ( = ?auto_36535 ?auto_36546 ) ) ( not ( = ?auto_36530 ?auto_36546 ) ) ( not ( = ?auto_36534 ?auto_36546 ) ) ( not ( = ?auto_36529 ?auto_36546 ) ) ( SURFACE-AT ?auto_36528 ?auto_36547 ) ( CLEAR ?auto_36528 ) ( IS-CRATE ?auto_36529 ) ( not ( = ?auto_36528 ?auto_36529 ) ) ( not ( = ?auto_36532 ?auto_36528 ) ) ( not ( = ?auto_36533 ?auto_36528 ) ) ( not ( = ?auto_36531 ?auto_36528 ) ) ( not ( = ?auto_36541 ?auto_36528 ) ) ( not ( = ?auto_36535 ?auto_36528 ) ) ( not ( = ?auto_36530 ?auto_36528 ) ) ( not ( = ?auto_36534 ?auto_36528 ) ) ( not ( = ?auto_36546 ?auto_36528 ) ) ( AVAILABLE ?auto_36544 ) ( IN ?auto_36529 ?auto_36542 ) ( TRUCK-AT ?auto_36542 ?auto_36539 ) ( not ( = ?auto_36539 ?auto_36547 ) ) ( not ( = ?auto_36536 ?auto_36539 ) ) ( not ( = ?auto_36540 ?auto_36539 ) ) ( not ( = ?auto_36545 ?auto_36539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36531 ?auto_36532 ?auto_36533 )
      ( MAKE-5CRATE-VERIFY ?auto_36528 ?auto_36529 ?auto_36530 ?auto_36531 ?auto_36532 ?auto_36533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36548 - SURFACE
      ?auto_36549 - SURFACE
    )
    :vars
    (
      ?auto_36564 - HOIST
      ?auto_36567 - PLACE
      ?auto_36562 - SURFACE
      ?auto_36552 - PLACE
      ?auto_36563 - HOIST
      ?auto_36559 - SURFACE
      ?auto_36558 - PLACE
      ?auto_36555 - HOIST
      ?auto_36551 - SURFACE
      ?auto_36553 - SURFACE
      ?auto_36565 - PLACE
      ?auto_36556 - HOIST
      ?auto_36550 - SURFACE
      ?auto_36554 - SURFACE
      ?auto_36566 - SURFACE
      ?auto_36561 - SURFACE
      ?auto_36560 - TRUCK
      ?auto_36557 - PLACE
      ?auto_36568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36564 ?auto_36567 ) ( IS-CRATE ?auto_36549 ) ( not ( = ?auto_36548 ?auto_36549 ) ) ( not ( = ?auto_36562 ?auto_36548 ) ) ( not ( = ?auto_36562 ?auto_36549 ) ) ( not ( = ?auto_36552 ?auto_36567 ) ) ( HOIST-AT ?auto_36563 ?auto_36552 ) ( not ( = ?auto_36564 ?auto_36563 ) ) ( SURFACE-AT ?auto_36549 ?auto_36552 ) ( ON ?auto_36549 ?auto_36559 ) ( CLEAR ?auto_36549 ) ( not ( = ?auto_36548 ?auto_36559 ) ) ( not ( = ?auto_36549 ?auto_36559 ) ) ( not ( = ?auto_36562 ?auto_36559 ) ) ( IS-CRATE ?auto_36548 ) ( not ( = ?auto_36558 ?auto_36567 ) ) ( not ( = ?auto_36552 ?auto_36558 ) ) ( HOIST-AT ?auto_36555 ?auto_36558 ) ( not ( = ?auto_36564 ?auto_36555 ) ) ( not ( = ?auto_36563 ?auto_36555 ) ) ( AVAILABLE ?auto_36555 ) ( SURFACE-AT ?auto_36548 ?auto_36558 ) ( ON ?auto_36548 ?auto_36551 ) ( CLEAR ?auto_36548 ) ( not ( = ?auto_36548 ?auto_36551 ) ) ( not ( = ?auto_36549 ?auto_36551 ) ) ( not ( = ?auto_36562 ?auto_36551 ) ) ( not ( = ?auto_36559 ?auto_36551 ) ) ( IS-CRATE ?auto_36562 ) ( not ( = ?auto_36553 ?auto_36562 ) ) ( not ( = ?auto_36548 ?auto_36553 ) ) ( not ( = ?auto_36549 ?auto_36553 ) ) ( not ( = ?auto_36559 ?auto_36553 ) ) ( not ( = ?auto_36551 ?auto_36553 ) ) ( not ( = ?auto_36565 ?auto_36567 ) ) ( not ( = ?auto_36552 ?auto_36565 ) ) ( not ( = ?auto_36558 ?auto_36565 ) ) ( HOIST-AT ?auto_36556 ?auto_36565 ) ( not ( = ?auto_36564 ?auto_36556 ) ) ( not ( = ?auto_36563 ?auto_36556 ) ) ( not ( = ?auto_36555 ?auto_36556 ) ) ( AVAILABLE ?auto_36556 ) ( SURFACE-AT ?auto_36562 ?auto_36565 ) ( ON ?auto_36562 ?auto_36550 ) ( CLEAR ?auto_36562 ) ( not ( = ?auto_36548 ?auto_36550 ) ) ( not ( = ?auto_36549 ?auto_36550 ) ) ( not ( = ?auto_36562 ?auto_36550 ) ) ( not ( = ?auto_36559 ?auto_36550 ) ) ( not ( = ?auto_36551 ?auto_36550 ) ) ( not ( = ?auto_36553 ?auto_36550 ) ) ( IS-CRATE ?auto_36553 ) ( not ( = ?auto_36554 ?auto_36553 ) ) ( not ( = ?auto_36548 ?auto_36554 ) ) ( not ( = ?auto_36549 ?auto_36554 ) ) ( not ( = ?auto_36562 ?auto_36554 ) ) ( not ( = ?auto_36559 ?auto_36554 ) ) ( not ( = ?auto_36551 ?auto_36554 ) ) ( not ( = ?auto_36550 ?auto_36554 ) ) ( AVAILABLE ?auto_36563 ) ( SURFACE-AT ?auto_36553 ?auto_36552 ) ( ON ?auto_36553 ?auto_36566 ) ( CLEAR ?auto_36553 ) ( not ( = ?auto_36548 ?auto_36566 ) ) ( not ( = ?auto_36549 ?auto_36566 ) ) ( not ( = ?auto_36562 ?auto_36566 ) ) ( not ( = ?auto_36559 ?auto_36566 ) ) ( not ( = ?auto_36551 ?auto_36566 ) ) ( not ( = ?auto_36553 ?auto_36566 ) ) ( not ( = ?auto_36550 ?auto_36566 ) ) ( not ( = ?auto_36554 ?auto_36566 ) ) ( SURFACE-AT ?auto_36561 ?auto_36567 ) ( CLEAR ?auto_36561 ) ( IS-CRATE ?auto_36554 ) ( not ( = ?auto_36561 ?auto_36554 ) ) ( not ( = ?auto_36548 ?auto_36561 ) ) ( not ( = ?auto_36549 ?auto_36561 ) ) ( not ( = ?auto_36562 ?auto_36561 ) ) ( not ( = ?auto_36559 ?auto_36561 ) ) ( not ( = ?auto_36551 ?auto_36561 ) ) ( not ( = ?auto_36553 ?auto_36561 ) ) ( not ( = ?auto_36550 ?auto_36561 ) ) ( not ( = ?auto_36566 ?auto_36561 ) ) ( AVAILABLE ?auto_36564 ) ( TRUCK-AT ?auto_36560 ?auto_36557 ) ( not ( = ?auto_36557 ?auto_36567 ) ) ( not ( = ?auto_36552 ?auto_36557 ) ) ( not ( = ?auto_36558 ?auto_36557 ) ) ( not ( = ?auto_36565 ?auto_36557 ) ) ( HOIST-AT ?auto_36568 ?auto_36557 ) ( LIFTING ?auto_36568 ?auto_36554 ) ( not ( = ?auto_36564 ?auto_36568 ) ) ( not ( = ?auto_36563 ?auto_36568 ) ) ( not ( = ?auto_36555 ?auto_36568 ) ) ( not ( = ?auto_36556 ?auto_36568 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36568 ?auto_36554 ?auto_36560 ?auto_36557 )
      ( MAKE-2CRATE ?auto_36562 ?auto_36548 ?auto_36549 )
      ( MAKE-1CRATE-VERIFY ?auto_36548 ?auto_36549 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36569 - SURFACE
      ?auto_36570 - SURFACE
      ?auto_36571 - SURFACE
    )
    :vars
    (
      ?auto_36574 - HOIST
      ?auto_36585 - PLACE
      ?auto_36581 - PLACE
      ?auto_36579 - HOIST
      ?auto_36577 - SURFACE
      ?auto_36583 - PLACE
      ?auto_36588 - HOIST
      ?auto_36584 - SURFACE
      ?auto_36572 - SURFACE
      ?auto_36586 - PLACE
      ?auto_36582 - HOIST
      ?auto_36573 - SURFACE
      ?auto_36587 - SURFACE
      ?auto_36575 - SURFACE
      ?auto_36578 - SURFACE
      ?auto_36576 - TRUCK
      ?auto_36580 - PLACE
      ?auto_36589 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36574 ?auto_36585 ) ( IS-CRATE ?auto_36571 ) ( not ( = ?auto_36570 ?auto_36571 ) ) ( not ( = ?auto_36569 ?auto_36570 ) ) ( not ( = ?auto_36569 ?auto_36571 ) ) ( not ( = ?auto_36581 ?auto_36585 ) ) ( HOIST-AT ?auto_36579 ?auto_36581 ) ( not ( = ?auto_36574 ?auto_36579 ) ) ( SURFACE-AT ?auto_36571 ?auto_36581 ) ( ON ?auto_36571 ?auto_36577 ) ( CLEAR ?auto_36571 ) ( not ( = ?auto_36570 ?auto_36577 ) ) ( not ( = ?auto_36571 ?auto_36577 ) ) ( not ( = ?auto_36569 ?auto_36577 ) ) ( IS-CRATE ?auto_36570 ) ( not ( = ?auto_36583 ?auto_36585 ) ) ( not ( = ?auto_36581 ?auto_36583 ) ) ( HOIST-AT ?auto_36588 ?auto_36583 ) ( not ( = ?auto_36574 ?auto_36588 ) ) ( not ( = ?auto_36579 ?auto_36588 ) ) ( AVAILABLE ?auto_36588 ) ( SURFACE-AT ?auto_36570 ?auto_36583 ) ( ON ?auto_36570 ?auto_36584 ) ( CLEAR ?auto_36570 ) ( not ( = ?auto_36570 ?auto_36584 ) ) ( not ( = ?auto_36571 ?auto_36584 ) ) ( not ( = ?auto_36569 ?auto_36584 ) ) ( not ( = ?auto_36577 ?auto_36584 ) ) ( IS-CRATE ?auto_36569 ) ( not ( = ?auto_36572 ?auto_36569 ) ) ( not ( = ?auto_36570 ?auto_36572 ) ) ( not ( = ?auto_36571 ?auto_36572 ) ) ( not ( = ?auto_36577 ?auto_36572 ) ) ( not ( = ?auto_36584 ?auto_36572 ) ) ( not ( = ?auto_36586 ?auto_36585 ) ) ( not ( = ?auto_36581 ?auto_36586 ) ) ( not ( = ?auto_36583 ?auto_36586 ) ) ( HOIST-AT ?auto_36582 ?auto_36586 ) ( not ( = ?auto_36574 ?auto_36582 ) ) ( not ( = ?auto_36579 ?auto_36582 ) ) ( not ( = ?auto_36588 ?auto_36582 ) ) ( AVAILABLE ?auto_36582 ) ( SURFACE-AT ?auto_36569 ?auto_36586 ) ( ON ?auto_36569 ?auto_36573 ) ( CLEAR ?auto_36569 ) ( not ( = ?auto_36570 ?auto_36573 ) ) ( not ( = ?auto_36571 ?auto_36573 ) ) ( not ( = ?auto_36569 ?auto_36573 ) ) ( not ( = ?auto_36577 ?auto_36573 ) ) ( not ( = ?auto_36584 ?auto_36573 ) ) ( not ( = ?auto_36572 ?auto_36573 ) ) ( IS-CRATE ?auto_36572 ) ( not ( = ?auto_36587 ?auto_36572 ) ) ( not ( = ?auto_36570 ?auto_36587 ) ) ( not ( = ?auto_36571 ?auto_36587 ) ) ( not ( = ?auto_36569 ?auto_36587 ) ) ( not ( = ?auto_36577 ?auto_36587 ) ) ( not ( = ?auto_36584 ?auto_36587 ) ) ( not ( = ?auto_36573 ?auto_36587 ) ) ( AVAILABLE ?auto_36579 ) ( SURFACE-AT ?auto_36572 ?auto_36581 ) ( ON ?auto_36572 ?auto_36575 ) ( CLEAR ?auto_36572 ) ( not ( = ?auto_36570 ?auto_36575 ) ) ( not ( = ?auto_36571 ?auto_36575 ) ) ( not ( = ?auto_36569 ?auto_36575 ) ) ( not ( = ?auto_36577 ?auto_36575 ) ) ( not ( = ?auto_36584 ?auto_36575 ) ) ( not ( = ?auto_36572 ?auto_36575 ) ) ( not ( = ?auto_36573 ?auto_36575 ) ) ( not ( = ?auto_36587 ?auto_36575 ) ) ( SURFACE-AT ?auto_36578 ?auto_36585 ) ( CLEAR ?auto_36578 ) ( IS-CRATE ?auto_36587 ) ( not ( = ?auto_36578 ?auto_36587 ) ) ( not ( = ?auto_36570 ?auto_36578 ) ) ( not ( = ?auto_36571 ?auto_36578 ) ) ( not ( = ?auto_36569 ?auto_36578 ) ) ( not ( = ?auto_36577 ?auto_36578 ) ) ( not ( = ?auto_36584 ?auto_36578 ) ) ( not ( = ?auto_36572 ?auto_36578 ) ) ( not ( = ?auto_36573 ?auto_36578 ) ) ( not ( = ?auto_36575 ?auto_36578 ) ) ( AVAILABLE ?auto_36574 ) ( TRUCK-AT ?auto_36576 ?auto_36580 ) ( not ( = ?auto_36580 ?auto_36585 ) ) ( not ( = ?auto_36581 ?auto_36580 ) ) ( not ( = ?auto_36583 ?auto_36580 ) ) ( not ( = ?auto_36586 ?auto_36580 ) ) ( HOIST-AT ?auto_36589 ?auto_36580 ) ( LIFTING ?auto_36589 ?auto_36587 ) ( not ( = ?auto_36574 ?auto_36589 ) ) ( not ( = ?auto_36579 ?auto_36589 ) ) ( not ( = ?auto_36588 ?auto_36589 ) ) ( not ( = ?auto_36582 ?auto_36589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36570 ?auto_36571 )
      ( MAKE-2CRATE-VERIFY ?auto_36569 ?auto_36570 ?auto_36571 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36590 - SURFACE
      ?auto_36591 - SURFACE
      ?auto_36592 - SURFACE
      ?auto_36593 - SURFACE
    )
    :vars
    (
      ?auto_36606 - HOIST
      ?auto_36605 - PLACE
      ?auto_36607 - PLACE
      ?auto_36609 - HOIST
      ?auto_36597 - SURFACE
      ?auto_36599 - PLACE
      ?auto_36598 - HOIST
      ?auto_36603 - SURFACE
      ?auto_36610 - PLACE
      ?auto_36604 - HOIST
      ?auto_36594 - SURFACE
      ?auto_36608 - SURFACE
      ?auto_36600 - SURFACE
      ?auto_36601 - SURFACE
      ?auto_36596 - TRUCK
      ?auto_36595 - PLACE
      ?auto_36602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36606 ?auto_36605 ) ( IS-CRATE ?auto_36593 ) ( not ( = ?auto_36592 ?auto_36593 ) ) ( not ( = ?auto_36591 ?auto_36592 ) ) ( not ( = ?auto_36591 ?auto_36593 ) ) ( not ( = ?auto_36607 ?auto_36605 ) ) ( HOIST-AT ?auto_36609 ?auto_36607 ) ( not ( = ?auto_36606 ?auto_36609 ) ) ( SURFACE-AT ?auto_36593 ?auto_36607 ) ( ON ?auto_36593 ?auto_36597 ) ( CLEAR ?auto_36593 ) ( not ( = ?auto_36592 ?auto_36597 ) ) ( not ( = ?auto_36593 ?auto_36597 ) ) ( not ( = ?auto_36591 ?auto_36597 ) ) ( IS-CRATE ?auto_36592 ) ( not ( = ?auto_36599 ?auto_36605 ) ) ( not ( = ?auto_36607 ?auto_36599 ) ) ( HOIST-AT ?auto_36598 ?auto_36599 ) ( not ( = ?auto_36606 ?auto_36598 ) ) ( not ( = ?auto_36609 ?auto_36598 ) ) ( AVAILABLE ?auto_36598 ) ( SURFACE-AT ?auto_36592 ?auto_36599 ) ( ON ?auto_36592 ?auto_36603 ) ( CLEAR ?auto_36592 ) ( not ( = ?auto_36592 ?auto_36603 ) ) ( not ( = ?auto_36593 ?auto_36603 ) ) ( not ( = ?auto_36591 ?auto_36603 ) ) ( not ( = ?auto_36597 ?auto_36603 ) ) ( IS-CRATE ?auto_36591 ) ( not ( = ?auto_36590 ?auto_36591 ) ) ( not ( = ?auto_36592 ?auto_36590 ) ) ( not ( = ?auto_36593 ?auto_36590 ) ) ( not ( = ?auto_36597 ?auto_36590 ) ) ( not ( = ?auto_36603 ?auto_36590 ) ) ( not ( = ?auto_36610 ?auto_36605 ) ) ( not ( = ?auto_36607 ?auto_36610 ) ) ( not ( = ?auto_36599 ?auto_36610 ) ) ( HOIST-AT ?auto_36604 ?auto_36610 ) ( not ( = ?auto_36606 ?auto_36604 ) ) ( not ( = ?auto_36609 ?auto_36604 ) ) ( not ( = ?auto_36598 ?auto_36604 ) ) ( AVAILABLE ?auto_36604 ) ( SURFACE-AT ?auto_36591 ?auto_36610 ) ( ON ?auto_36591 ?auto_36594 ) ( CLEAR ?auto_36591 ) ( not ( = ?auto_36592 ?auto_36594 ) ) ( not ( = ?auto_36593 ?auto_36594 ) ) ( not ( = ?auto_36591 ?auto_36594 ) ) ( not ( = ?auto_36597 ?auto_36594 ) ) ( not ( = ?auto_36603 ?auto_36594 ) ) ( not ( = ?auto_36590 ?auto_36594 ) ) ( IS-CRATE ?auto_36590 ) ( not ( = ?auto_36608 ?auto_36590 ) ) ( not ( = ?auto_36592 ?auto_36608 ) ) ( not ( = ?auto_36593 ?auto_36608 ) ) ( not ( = ?auto_36591 ?auto_36608 ) ) ( not ( = ?auto_36597 ?auto_36608 ) ) ( not ( = ?auto_36603 ?auto_36608 ) ) ( not ( = ?auto_36594 ?auto_36608 ) ) ( AVAILABLE ?auto_36609 ) ( SURFACE-AT ?auto_36590 ?auto_36607 ) ( ON ?auto_36590 ?auto_36600 ) ( CLEAR ?auto_36590 ) ( not ( = ?auto_36592 ?auto_36600 ) ) ( not ( = ?auto_36593 ?auto_36600 ) ) ( not ( = ?auto_36591 ?auto_36600 ) ) ( not ( = ?auto_36597 ?auto_36600 ) ) ( not ( = ?auto_36603 ?auto_36600 ) ) ( not ( = ?auto_36590 ?auto_36600 ) ) ( not ( = ?auto_36594 ?auto_36600 ) ) ( not ( = ?auto_36608 ?auto_36600 ) ) ( SURFACE-AT ?auto_36601 ?auto_36605 ) ( CLEAR ?auto_36601 ) ( IS-CRATE ?auto_36608 ) ( not ( = ?auto_36601 ?auto_36608 ) ) ( not ( = ?auto_36592 ?auto_36601 ) ) ( not ( = ?auto_36593 ?auto_36601 ) ) ( not ( = ?auto_36591 ?auto_36601 ) ) ( not ( = ?auto_36597 ?auto_36601 ) ) ( not ( = ?auto_36603 ?auto_36601 ) ) ( not ( = ?auto_36590 ?auto_36601 ) ) ( not ( = ?auto_36594 ?auto_36601 ) ) ( not ( = ?auto_36600 ?auto_36601 ) ) ( AVAILABLE ?auto_36606 ) ( TRUCK-AT ?auto_36596 ?auto_36595 ) ( not ( = ?auto_36595 ?auto_36605 ) ) ( not ( = ?auto_36607 ?auto_36595 ) ) ( not ( = ?auto_36599 ?auto_36595 ) ) ( not ( = ?auto_36610 ?auto_36595 ) ) ( HOIST-AT ?auto_36602 ?auto_36595 ) ( LIFTING ?auto_36602 ?auto_36608 ) ( not ( = ?auto_36606 ?auto_36602 ) ) ( not ( = ?auto_36609 ?auto_36602 ) ) ( not ( = ?auto_36598 ?auto_36602 ) ) ( not ( = ?auto_36604 ?auto_36602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36591 ?auto_36592 ?auto_36593 )
      ( MAKE-3CRATE-VERIFY ?auto_36590 ?auto_36591 ?auto_36592 ?auto_36593 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36611 - SURFACE
      ?auto_36612 - SURFACE
      ?auto_36613 - SURFACE
      ?auto_36614 - SURFACE
      ?auto_36615 - SURFACE
    )
    :vars
    (
      ?auto_36628 - HOIST
      ?auto_36627 - PLACE
      ?auto_36629 - PLACE
      ?auto_36630 - HOIST
      ?auto_36619 - SURFACE
      ?auto_36621 - PLACE
      ?auto_36620 - HOIST
      ?auto_36625 - SURFACE
      ?auto_36631 - PLACE
      ?auto_36626 - HOIST
      ?auto_36616 - SURFACE
      ?auto_36622 - SURFACE
      ?auto_36623 - SURFACE
      ?auto_36618 - TRUCK
      ?auto_36617 - PLACE
      ?auto_36624 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36628 ?auto_36627 ) ( IS-CRATE ?auto_36615 ) ( not ( = ?auto_36614 ?auto_36615 ) ) ( not ( = ?auto_36613 ?auto_36614 ) ) ( not ( = ?auto_36613 ?auto_36615 ) ) ( not ( = ?auto_36629 ?auto_36627 ) ) ( HOIST-AT ?auto_36630 ?auto_36629 ) ( not ( = ?auto_36628 ?auto_36630 ) ) ( SURFACE-AT ?auto_36615 ?auto_36629 ) ( ON ?auto_36615 ?auto_36619 ) ( CLEAR ?auto_36615 ) ( not ( = ?auto_36614 ?auto_36619 ) ) ( not ( = ?auto_36615 ?auto_36619 ) ) ( not ( = ?auto_36613 ?auto_36619 ) ) ( IS-CRATE ?auto_36614 ) ( not ( = ?auto_36621 ?auto_36627 ) ) ( not ( = ?auto_36629 ?auto_36621 ) ) ( HOIST-AT ?auto_36620 ?auto_36621 ) ( not ( = ?auto_36628 ?auto_36620 ) ) ( not ( = ?auto_36630 ?auto_36620 ) ) ( AVAILABLE ?auto_36620 ) ( SURFACE-AT ?auto_36614 ?auto_36621 ) ( ON ?auto_36614 ?auto_36625 ) ( CLEAR ?auto_36614 ) ( not ( = ?auto_36614 ?auto_36625 ) ) ( not ( = ?auto_36615 ?auto_36625 ) ) ( not ( = ?auto_36613 ?auto_36625 ) ) ( not ( = ?auto_36619 ?auto_36625 ) ) ( IS-CRATE ?auto_36613 ) ( not ( = ?auto_36612 ?auto_36613 ) ) ( not ( = ?auto_36614 ?auto_36612 ) ) ( not ( = ?auto_36615 ?auto_36612 ) ) ( not ( = ?auto_36619 ?auto_36612 ) ) ( not ( = ?auto_36625 ?auto_36612 ) ) ( not ( = ?auto_36631 ?auto_36627 ) ) ( not ( = ?auto_36629 ?auto_36631 ) ) ( not ( = ?auto_36621 ?auto_36631 ) ) ( HOIST-AT ?auto_36626 ?auto_36631 ) ( not ( = ?auto_36628 ?auto_36626 ) ) ( not ( = ?auto_36630 ?auto_36626 ) ) ( not ( = ?auto_36620 ?auto_36626 ) ) ( AVAILABLE ?auto_36626 ) ( SURFACE-AT ?auto_36613 ?auto_36631 ) ( ON ?auto_36613 ?auto_36616 ) ( CLEAR ?auto_36613 ) ( not ( = ?auto_36614 ?auto_36616 ) ) ( not ( = ?auto_36615 ?auto_36616 ) ) ( not ( = ?auto_36613 ?auto_36616 ) ) ( not ( = ?auto_36619 ?auto_36616 ) ) ( not ( = ?auto_36625 ?auto_36616 ) ) ( not ( = ?auto_36612 ?auto_36616 ) ) ( IS-CRATE ?auto_36612 ) ( not ( = ?auto_36611 ?auto_36612 ) ) ( not ( = ?auto_36614 ?auto_36611 ) ) ( not ( = ?auto_36615 ?auto_36611 ) ) ( not ( = ?auto_36613 ?auto_36611 ) ) ( not ( = ?auto_36619 ?auto_36611 ) ) ( not ( = ?auto_36625 ?auto_36611 ) ) ( not ( = ?auto_36616 ?auto_36611 ) ) ( AVAILABLE ?auto_36630 ) ( SURFACE-AT ?auto_36612 ?auto_36629 ) ( ON ?auto_36612 ?auto_36622 ) ( CLEAR ?auto_36612 ) ( not ( = ?auto_36614 ?auto_36622 ) ) ( not ( = ?auto_36615 ?auto_36622 ) ) ( not ( = ?auto_36613 ?auto_36622 ) ) ( not ( = ?auto_36619 ?auto_36622 ) ) ( not ( = ?auto_36625 ?auto_36622 ) ) ( not ( = ?auto_36612 ?auto_36622 ) ) ( not ( = ?auto_36616 ?auto_36622 ) ) ( not ( = ?auto_36611 ?auto_36622 ) ) ( SURFACE-AT ?auto_36623 ?auto_36627 ) ( CLEAR ?auto_36623 ) ( IS-CRATE ?auto_36611 ) ( not ( = ?auto_36623 ?auto_36611 ) ) ( not ( = ?auto_36614 ?auto_36623 ) ) ( not ( = ?auto_36615 ?auto_36623 ) ) ( not ( = ?auto_36613 ?auto_36623 ) ) ( not ( = ?auto_36619 ?auto_36623 ) ) ( not ( = ?auto_36625 ?auto_36623 ) ) ( not ( = ?auto_36612 ?auto_36623 ) ) ( not ( = ?auto_36616 ?auto_36623 ) ) ( not ( = ?auto_36622 ?auto_36623 ) ) ( AVAILABLE ?auto_36628 ) ( TRUCK-AT ?auto_36618 ?auto_36617 ) ( not ( = ?auto_36617 ?auto_36627 ) ) ( not ( = ?auto_36629 ?auto_36617 ) ) ( not ( = ?auto_36621 ?auto_36617 ) ) ( not ( = ?auto_36631 ?auto_36617 ) ) ( HOIST-AT ?auto_36624 ?auto_36617 ) ( LIFTING ?auto_36624 ?auto_36611 ) ( not ( = ?auto_36628 ?auto_36624 ) ) ( not ( = ?auto_36630 ?auto_36624 ) ) ( not ( = ?auto_36620 ?auto_36624 ) ) ( not ( = ?auto_36626 ?auto_36624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36613 ?auto_36614 ?auto_36615 )
      ( MAKE-4CRATE-VERIFY ?auto_36611 ?auto_36612 ?auto_36613 ?auto_36614 ?auto_36615 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36632 - SURFACE
      ?auto_36633 - SURFACE
      ?auto_36634 - SURFACE
      ?auto_36635 - SURFACE
      ?auto_36636 - SURFACE
      ?auto_36637 - SURFACE
    )
    :vars
    (
      ?auto_36649 - HOIST
      ?auto_36648 - PLACE
      ?auto_36650 - PLACE
      ?auto_36651 - HOIST
      ?auto_36641 - SURFACE
      ?auto_36643 - PLACE
      ?auto_36642 - HOIST
      ?auto_36646 - SURFACE
      ?auto_36652 - PLACE
      ?auto_36647 - HOIST
      ?auto_36638 - SURFACE
      ?auto_36644 - SURFACE
      ?auto_36640 - TRUCK
      ?auto_36639 - PLACE
      ?auto_36645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36649 ?auto_36648 ) ( IS-CRATE ?auto_36637 ) ( not ( = ?auto_36636 ?auto_36637 ) ) ( not ( = ?auto_36635 ?auto_36636 ) ) ( not ( = ?auto_36635 ?auto_36637 ) ) ( not ( = ?auto_36650 ?auto_36648 ) ) ( HOIST-AT ?auto_36651 ?auto_36650 ) ( not ( = ?auto_36649 ?auto_36651 ) ) ( SURFACE-AT ?auto_36637 ?auto_36650 ) ( ON ?auto_36637 ?auto_36641 ) ( CLEAR ?auto_36637 ) ( not ( = ?auto_36636 ?auto_36641 ) ) ( not ( = ?auto_36637 ?auto_36641 ) ) ( not ( = ?auto_36635 ?auto_36641 ) ) ( IS-CRATE ?auto_36636 ) ( not ( = ?auto_36643 ?auto_36648 ) ) ( not ( = ?auto_36650 ?auto_36643 ) ) ( HOIST-AT ?auto_36642 ?auto_36643 ) ( not ( = ?auto_36649 ?auto_36642 ) ) ( not ( = ?auto_36651 ?auto_36642 ) ) ( AVAILABLE ?auto_36642 ) ( SURFACE-AT ?auto_36636 ?auto_36643 ) ( ON ?auto_36636 ?auto_36646 ) ( CLEAR ?auto_36636 ) ( not ( = ?auto_36636 ?auto_36646 ) ) ( not ( = ?auto_36637 ?auto_36646 ) ) ( not ( = ?auto_36635 ?auto_36646 ) ) ( not ( = ?auto_36641 ?auto_36646 ) ) ( IS-CRATE ?auto_36635 ) ( not ( = ?auto_36634 ?auto_36635 ) ) ( not ( = ?auto_36636 ?auto_36634 ) ) ( not ( = ?auto_36637 ?auto_36634 ) ) ( not ( = ?auto_36641 ?auto_36634 ) ) ( not ( = ?auto_36646 ?auto_36634 ) ) ( not ( = ?auto_36652 ?auto_36648 ) ) ( not ( = ?auto_36650 ?auto_36652 ) ) ( not ( = ?auto_36643 ?auto_36652 ) ) ( HOIST-AT ?auto_36647 ?auto_36652 ) ( not ( = ?auto_36649 ?auto_36647 ) ) ( not ( = ?auto_36651 ?auto_36647 ) ) ( not ( = ?auto_36642 ?auto_36647 ) ) ( AVAILABLE ?auto_36647 ) ( SURFACE-AT ?auto_36635 ?auto_36652 ) ( ON ?auto_36635 ?auto_36638 ) ( CLEAR ?auto_36635 ) ( not ( = ?auto_36636 ?auto_36638 ) ) ( not ( = ?auto_36637 ?auto_36638 ) ) ( not ( = ?auto_36635 ?auto_36638 ) ) ( not ( = ?auto_36641 ?auto_36638 ) ) ( not ( = ?auto_36646 ?auto_36638 ) ) ( not ( = ?auto_36634 ?auto_36638 ) ) ( IS-CRATE ?auto_36634 ) ( not ( = ?auto_36633 ?auto_36634 ) ) ( not ( = ?auto_36636 ?auto_36633 ) ) ( not ( = ?auto_36637 ?auto_36633 ) ) ( not ( = ?auto_36635 ?auto_36633 ) ) ( not ( = ?auto_36641 ?auto_36633 ) ) ( not ( = ?auto_36646 ?auto_36633 ) ) ( not ( = ?auto_36638 ?auto_36633 ) ) ( AVAILABLE ?auto_36651 ) ( SURFACE-AT ?auto_36634 ?auto_36650 ) ( ON ?auto_36634 ?auto_36644 ) ( CLEAR ?auto_36634 ) ( not ( = ?auto_36636 ?auto_36644 ) ) ( not ( = ?auto_36637 ?auto_36644 ) ) ( not ( = ?auto_36635 ?auto_36644 ) ) ( not ( = ?auto_36641 ?auto_36644 ) ) ( not ( = ?auto_36646 ?auto_36644 ) ) ( not ( = ?auto_36634 ?auto_36644 ) ) ( not ( = ?auto_36638 ?auto_36644 ) ) ( not ( = ?auto_36633 ?auto_36644 ) ) ( SURFACE-AT ?auto_36632 ?auto_36648 ) ( CLEAR ?auto_36632 ) ( IS-CRATE ?auto_36633 ) ( not ( = ?auto_36632 ?auto_36633 ) ) ( not ( = ?auto_36636 ?auto_36632 ) ) ( not ( = ?auto_36637 ?auto_36632 ) ) ( not ( = ?auto_36635 ?auto_36632 ) ) ( not ( = ?auto_36641 ?auto_36632 ) ) ( not ( = ?auto_36646 ?auto_36632 ) ) ( not ( = ?auto_36634 ?auto_36632 ) ) ( not ( = ?auto_36638 ?auto_36632 ) ) ( not ( = ?auto_36644 ?auto_36632 ) ) ( AVAILABLE ?auto_36649 ) ( TRUCK-AT ?auto_36640 ?auto_36639 ) ( not ( = ?auto_36639 ?auto_36648 ) ) ( not ( = ?auto_36650 ?auto_36639 ) ) ( not ( = ?auto_36643 ?auto_36639 ) ) ( not ( = ?auto_36652 ?auto_36639 ) ) ( HOIST-AT ?auto_36645 ?auto_36639 ) ( LIFTING ?auto_36645 ?auto_36633 ) ( not ( = ?auto_36649 ?auto_36645 ) ) ( not ( = ?auto_36651 ?auto_36645 ) ) ( not ( = ?auto_36642 ?auto_36645 ) ) ( not ( = ?auto_36647 ?auto_36645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36635 ?auto_36636 ?auto_36637 )
      ( MAKE-5CRATE-VERIFY ?auto_36632 ?auto_36633 ?auto_36634 ?auto_36635 ?auto_36636 ?auto_36637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36653 - SURFACE
      ?auto_36654 - SURFACE
    )
    :vars
    (
      ?auto_36668 - HOIST
      ?auto_36667 - PLACE
      ?auto_36666 - SURFACE
      ?auto_36669 - PLACE
      ?auto_36671 - HOIST
      ?auto_36658 - SURFACE
      ?auto_36660 - PLACE
      ?auto_36659 - HOIST
      ?auto_36664 - SURFACE
      ?auto_36672 - SURFACE
      ?auto_36673 - PLACE
      ?auto_36665 - HOIST
      ?auto_36655 - SURFACE
      ?auto_36670 - SURFACE
      ?auto_36661 - SURFACE
      ?auto_36662 - SURFACE
      ?auto_36657 - TRUCK
      ?auto_36656 - PLACE
      ?auto_36663 - HOIST
      ?auto_36674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36668 ?auto_36667 ) ( IS-CRATE ?auto_36654 ) ( not ( = ?auto_36653 ?auto_36654 ) ) ( not ( = ?auto_36666 ?auto_36653 ) ) ( not ( = ?auto_36666 ?auto_36654 ) ) ( not ( = ?auto_36669 ?auto_36667 ) ) ( HOIST-AT ?auto_36671 ?auto_36669 ) ( not ( = ?auto_36668 ?auto_36671 ) ) ( SURFACE-AT ?auto_36654 ?auto_36669 ) ( ON ?auto_36654 ?auto_36658 ) ( CLEAR ?auto_36654 ) ( not ( = ?auto_36653 ?auto_36658 ) ) ( not ( = ?auto_36654 ?auto_36658 ) ) ( not ( = ?auto_36666 ?auto_36658 ) ) ( IS-CRATE ?auto_36653 ) ( not ( = ?auto_36660 ?auto_36667 ) ) ( not ( = ?auto_36669 ?auto_36660 ) ) ( HOIST-AT ?auto_36659 ?auto_36660 ) ( not ( = ?auto_36668 ?auto_36659 ) ) ( not ( = ?auto_36671 ?auto_36659 ) ) ( AVAILABLE ?auto_36659 ) ( SURFACE-AT ?auto_36653 ?auto_36660 ) ( ON ?auto_36653 ?auto_36664 ) ( CLEAR ?auto_36653 ) ( not ( = ?auto_36653 ?auto_36664 ) ) ( not ( = ?auto_36654 ?auto_36664 ) ) ( not ( = ?auto_36666 ?auto_36664 ) ) ( not ( = ?auto_36658 ?auto_36664 ) ) ( IS-CRATE ?auto_36666 ) ( not ( = ?auto_36672 ?auto_36666 ) ) ( not ( = ?auto_36653 ?auto_36672 ) ) ( not ( = ?auto_36654 ?auto_36672 ) ) ( not ( = ?auto_36658 ?auto_36672 ) ) ( not ( = ?auto_36664 ?auto_36672 ) ) ( not ( = ?auto_36673 ?auto_36667 ) ) ( not ( = ?auto_36669 ?auto_36673 ) ) ( not ( = ?auto_36660 ?auto_36673 ) ) ( HOIST-AT ?auto_36665 ?auto_36673 ) ( not ( = ?auto_36668 ?auto_36665 ) ) ( not ( = ?auto_36671 ?auto_36665 ) ) ( not ( = ?auto_36659 ?auto_36665 ) ) ( AVAILABLE ?auto_36665 ) ( SURFACE-AT ?auto_36666 ?auto_36673 ) ( ON ?auto_36666 ?auto_36655 ) ( CLEAR ?auto_36666 ) ( not ( = ?auto_36653 ?auto_36655 ) ) ( not ( = ?auto_36654 ?auto_36655 ) ) ( not ( = ?auto_36666 ?auto_36655 ) ) ( not ( = ?auto_36658 ?auto_36655 ) ) ( not ( = ?auto_36664 ?auto_36655 ) ) ( not ( = ?auto_36672 ?auto_36655 ) ) ( IS-CRATE ?auto_36672 ) ( not ( = ?auto_36670 ?auto_36672 ) ) ( not ( = ?auto_36653 ?auto_36670 ) ) ( not ( = ?auto_36654 ?auto_36670 ) ) ( not ( = ?auto_36666 ?auto_36670 ) ) ( not ( = ?auto_36658 ?auto_36670 ) ) ( not ( = ?auto_36664 ?auto_36670 ) ) ( not ( = ?auto_36655 ?auto_36670 ) ) ( AVAILABLE ?auto_36671 ) ( SURFACE-AT ?auto_36672 ?auto_36669 ) ( ON ?auto_36672 ?auto_36661 ) ( CLEAR ?auto_36672 ) ( not ( = ?auto_36653 ?auto_36661 ) ) ( not ( = ?auto_36654 ?auto_36661 ) ) ( not ( = ?auto_36666 ?auto_36661 ) ) ( not ( = ?auto_36658 ?auto_36661 ) ) ( not ( = ?auto_36664 ?auto_36661 ) ) ( not ( = ?auto_36672 ?auto_36661 ) ) ( not ( = ?auto_36655 ?auto_36661 ) ) ( not ( = ?auto_36670 ?auto_36661 ) ) ( SURFACE-AT ?auto_36662 ?auto_36667 ) ( CLEAR ?auto_36662 ) ( IS-CRATE ?auto_36670 ) ( not ( = ?auto_36662 ?auto_36670 ) ) ( not ( = ?auto_36653 ?auto_36662 ) ) ( not ( = ?auto_36654 ?auto_36662 ) ) ( not ( = ?auto_36666 ?auto_36662 ) ) ( not ( = ?auto_36658 ?auto_36662 ) ) ( not ( = ?auto_36664 ?auto_36662 ) ) ( not ( = ?auto_36672 ?auto_36662 ) ) ( not ( = ?auto_36655 ?auto_36662 ) ) ( not ( = ?auto_36661 ?auto_36662 ) ) ( AVAILABLE ?auto_36668 ) ( TRUCK-AT ?auto_36657 ?auto_36656 ) ( not ( = ?auto_36656 ?auto_36667 ) ) ( not ( = ?auto_36669 ?auto_36656 ) ) ( not ( = ?auto_36660 ?auto_36656 ) ) ( not ( = ?auto_36673 ?auto_36656 ) ) ( HOIST-AT ?auto_36663 ?auto_36656 ) ( not ( = ?auto_36668 ?auto_36663 ) ) ( not ( = ?auto_36671 ?auto_36663 ) ) ( not ( = ?auto_36659 ?auto_36663 ) ) ( not ( = ?auto_36665 ?auto_36663 ) ) ( AVAILABLE ?auto_36663 ) ( SURFACE-AT ?auto_36670 ?auto_36656 ) ( ON ?auto_36670 ?auto_36674 ) ( CLEAR ?auto_36670 ) ( not ( = ?auto_36653 ?auto_36674 ) ) ( not ( = ?auto_36654 ?auto_36674 ) ) ( not ( = ?auto_36666 ?auto_36674 ) ) ( not ( = ?auto_36658 ?auto_36674 ) ) ( not ( = ?auto_36664 ?auto_36674 ) ) ( not ( = ?auto_36672 ?auto_36674 ) ) ( not ( = ?auto_36655 ?auto_36674 ) ) ( not ( = ?auto_36670 ?auto_36674 ) ) ( not ( = ?auto_36661 ?auto_36674 ) ) ( not ( = ?auto_36662 ?auto_36674 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36663 ?auto_36670 ?auto_36674 ?auto_36656 )
      ( MAKE-2CRATE ?auto_36666 ?auto_36653 ?auto_36654 )
      ( MAKE-1CRATE-VERIFY ?auto_36653 ?auto_36654 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36675 - SURFACE
      ?auto_36676 - SURFACE
      ?auto_36677 - SURFACE
    )
    :vars
    (
      ?auto_36689 - HOIST
      ?auto_36679 - PLACE
      ?auto_36690 - PLACE
      ?auto_36684 - HOIST
      ?auto_36694 - SURFACE
      ?auto_36693 - PLACE
      ?auto_36686 - HOIST
      ?auto_36685 - SURFACE
      ?auto_36682 - SURFACE
      ?auto_36691 - PLACE
      ?auto_36692 - HOIST
      ?auto_36696 - SURFACE
      ?auto_36695 - SURFACE
      ?auto_36683 - SURFACE
      ?auto_36681 - SURFACE
      ?auto_36688 - TRUCK
      ?auto_36678 - PLACE
      ?auto_36680 - HOIST
      ?auto_36687 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36689 ?auto_36679 ) ( IS-CRATE ?auto_36677 ) ( not ( = ?auto_36676 ?auto_36677 ) ) ( not ( = ?auto_36675 ?auto_36676 ) ) ( not ( = ?auto_36675 ?auto_36677 ) ) ( not ( = ?auto_36690 ?auto_36679 ) ) ( HOIST-AT ?auto_36684 ?auto_36690 ) ( not ( = ?auto_36689 ?auto_36684 ) ) ( SURFACE-AT ?auto_36677 ?auto_36690 ) ( ON ?auto_36677 ?auto_36694 ) ( CLEAR ?auto_36677 ) ( not ( = ?auto_36676 ?auto_36694 ) ) ( not ( = ?auto_36677 ?auto_36694 ) ) ( not ( = ?auto_36675 ?auto_36694 ) ) ( IS-CRATE ?auto_36676 ) ( not ( = ?auto_36693 ?auto_36679 ) ) ( not ( = ?auto_36690 ?auto_36693 ) ) ( HOIST-AT ?auto_36686 ?auto_36693 ) ( not ( = ?auto_36689 ?auto_36686 ) ) ( not ( = ?auto_36684 ?auto_36686 ) ) ( AVAILABLE ?auto_36686 ) ( SURFACE-AT ?auto_36676 ?auto_36693 ) ( ON ?auto_36676 ?auto_36685 ) ( CLEAR ?auto_36676 ) ( not ( = ?auto_36676 ?auto_36685 ) ) ( not ( = ?auto_36677 ?auto_36685 ) ) ( not ( = ?auto_36675 ?auto_36685 ) ) ( not ( = ?auto_36694 ?auto_36685 ) ) ( IS-CRATE ?auto_36675 ) ( not ( = ?auto_36682 ?auto_36675 ) ) ( not ( = ?auto_36676 ?auto_36682 ) ) ( not ( = ?auto_36677 ?auto_36682 ) ) ( not ( = ?auto_36694 ?auto_36682 ) ) ( not ( = ?auto_36685 ?auto_36682 ) ) ( not ( = ?auto_36691 ?auto_36679 ) ) ( not ( = ?auto_36690 ?auto_36691 ) ) ( not ( = ?auto_36693 ?auto_36691 ) ) ( HOIST-AT ?auto_36692 ?auto_36691 ) ( not ( = ?auto_36689 ?auto_36692 ) ) ( not ( = ?auto_36684 ?auto_36692 ) ) ( not ( = ?auto_36686 ?auto_36692 ) ) ( AVAILABLE ?auto_36692 ) ( SURFACE-AT ?auto_36675 ?auto_36691 ) ( ON ?auto_36675 ?auto_36696 ) ( CLEAR ?auto_36675 ) ( not ( = ?auto_36676 ?auto_36696 ) ) ( not ( = ?auto_36677 ?auto_36696 ) ) ( not ( = ?auto_36675 ?auto_36696 ) ) ( not ( = ?auto_36694 ?auto_36696 ) ) ( not ( = ?auto_36685 ?auto_36696 ) ) ( not ( = ?auto_36682 ?auto_36696 ) ) ( IS-CRATE ?auto_36682 ) ( not ( = ?auto_36695 ?auto_36682 ) ) ( not ( = ?auto_36676 ?auto_36695 ) ) ( not ( = ?auto_36677 ?auto_36695 ) ) ( not ( = ?auto_36675 ?auto_36695 ) ) ( not ( = ?auto_36694 ?auto_36695 ) ) ( not ( = ?auto_36685 ?auto_36695 ) ) ( not ( = ?auto_36696 ?auto_36695 ) ) ( AVAILABLE ?auto_36684 ) ( SURFACE-AT ?auto_36682 ?auto_36690 ) ( ON ?auto_36682 ?auto_36683 ) ( CLEAR ?auto_36682 ) ( not ( = ?auto_36676 ?auto_36683 ) ) ( not ( = ?auto_36677 ?auto_36683 ) ) ( not ( = ?auto_36675 ?auto_36683 ) ) ( not ( = ?auto_36694 ?auto_36683 ) ) ( not ( = ?auto_36685 ?auto_36683 ) ) ( not ( = ?auto_36682 ?auto_36683 ) ) ( not ( = ?auto_36696 ?auto_36683 ) ) ( not ( = ?auto_36695 ?auto_36683 ) ) ( SURFACE-AT ?auto_36681 ?auto_36679 ) ( CLEAR ?auto_36681 ) ( IS-CRATE ?auto_36695 ) ( not ( = ?auto_36681 ?auto_36695 ) ) ( not ( = ?auto_36676 ?auto_36681 ) ) ( not ( = ?auto_36677 ?auto_36681 ) ) ( not ( = ?auto_36675 ?auto_36681 ) ) ( not ( = ?auto_36694 ?auto_36681 ) ) ( not ( = ?auto_36685 ?auto_36681 ) ) ( not ( = ?auto_36682 ?auto_36681 ) ) ( not ( = ?auto_36696 ?auto_36681 ) ) ( not ( = ?auto_36683 ?auto_36681 ) ) ( AVAILABLE ?auto_36689 ) ( TRUCK-AT ?auto_36688 ?auto_36678 ) ( not ( = ?auto_36678 ?auto_36679 ) ) ( not ( = ?auto_36690 ?auto_36678 ) ) ( not ( = ?auto_36693 ?auto_36678 ) ) ( not ( = ?auto_36691 ?auto_36678 ) ) ( HOIST-AT ?auto_36680 ?auto_36678 ) ( not ( = ?auto_36689 ?auto_36680 ) ) ( not ( = ?auto_36684 ?auto_36680 ) ) ( not ( = ?auto_36686 ?auto_36680 ) ) ( not ( = ?auto_36692 ?auto_36680 ) ) ( AVAILABLE ?auto_36680 ) ( SURFACE-AT ?auto_36695 ?auto_36678 ) ( ON ?auto_36695 ?auto_36687 ) ( CLEAR ?auto_36695 ) ( not ( = ?auto_36676 ?auto_36687 ) ) ( not ( = ?auto_36677 ?auto_36687 ) ) ( not ( = ?auto_36675 ?auto_36687 ) ) ( not ( = ?auto_36694 ?auto_36687 ) ) ( not ( = ?auto_36685 ?auto_36687 ) ) ( not ( = ?auto_36682 ?auto_36687 ) ) ( not ( = ?auto_36696 ?auto_36687 ) ) ( not ( = ?auto_36695 ?auto_36687 ) ) ( not ( = ?auto_36683 ?auto_36687 ) ) ( not ( = ?auto_36681 ?auto_36687 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36676 ?auto_36677 )
      ( MAKE-2CRATE-VERIFY ?auto_36675 ?auto_36676 ?auto_36677 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36697 - SURFACE
      ?auto_36698 - SURFACE
      ?auto_36699 - SURFACE
      ?auto_36700 - SURFACE
    )
    :vars
    (
      ?auto_36704 - HOIST
      ?auto_36707 - PLACE
      ?auto_36713 - PLACE
      ?auto_36716 - HOIST
      ?auto_36708 - SURFACE
      ?auto_36710 - PLACE
      ?auto_36715 - HOIST
      ?auto_36703 - SURFACE
      ?auto_36709 - PLACE
      ?auto_36706 - HOIST
      ?auto_36711 - SURFACE
      ?auto_36712 - SURFACE
      ?auto_36702 - SURFACE
      ?auto_36718 - SURFACE
      ?auto_36705 - TRUCK
      ?auto_36701 - PLACE
      ?auto_36714 - HOIST
      ?auto_36717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36704 ?auto_36707 ) ( IS-CRATE ?auto_36700 ) ( not ( = ?auto_36699 ?auto_36700 ) ) ( not ( = ?auto_36698 ?auto_36699 ) ) ( not ( = ?auto_36698 ?auto_36700 ) ) ( not ( = ?auto_36713 ?auto_36707 ) ) ( HOIST-AT ?auto_36716 ?auto_36713 ) ( not ( = ?auto_36704 ?auto_36716 ) ) ( SURFACE-AT ?auto_36700 ?auto_36713 ) ( ON ?auto_36700 ?auto_36708 ) ( CLEAR ?auto_36700 ) ( not ( = ?auto_36699 ?auto_36708 ) ) ( not ( = ?auto_36700 ?auto_36708 ) ) ( not ( = ?auto_36698 ?auto_36708 ) ) ( IS-CRATE ?auto_36699 ) ( not ( = ?auto_36710 ?auto_36707 ) ) ( not ( = ?auto_36713 ?auto_36710 ) ) ( HOIST-AT ?auto_36715 ?auto_36710 ) ( not ( = ?auto_36704 ?auto_36715 ) ) ( not ( = ?auto_36716 ?auto_36715 ) ) ( AVAILABLE ?auto_36715 ) ( SURFACE-AT ?auto_36699 ?auto_36710 ) ( ON ?auto_36699 ?auto_36703 ) ( CLEAR ?auto_36699 ) ( not ( = ?auto_36699 ?auto_36703 ) ) ( not ( = ?auto_36700 ?auto_36703 ) ) ( not ( = ?auto_36698 ?auto_36703 ) ) ( not ( = ?auto_36708 ?auto_36703 ) ) ( IS-CRATE ?auto_36698 ) ( not ( = ?auto_36697 ?auto_36698 ) ) ( not ( = ?auto_36699 ?auto_36697 ) ) ( not ( = ?auto_36700 ?auto_36697 ) ) ( not ( = ?auto_36708 ?auto_36697 ) ) ( not ( = ?auto_36703 ?auto_36697 ) ) ( not ( = ?auto_36709 ?auto_36707 ) ) ( not ( = ?auto_36713 ?auto_36709 ) ) ( not ( = ?auto_36710 ?auto_36709 ) ) ( HOIST-AT ?auto_36706 ?auto_36709 ) ( not ( = ?auto_36704 ?auto_36706 ) ) ( not ( = ?auto_36716 ?auto_36706 ) ) ( not ( = ?auto_36715 ?auto_36706 ) ) ( AVAILABLE ?auto_36706 ) ( SURFACE-AT ?auto_36698 ?auto_36709 ) ( ON ?auto_36698 ?auto_36711 ) ( CLEAR ?auto_36698 ) ( not ( = ?auto_36699 ?auto_36711 ) ) ( not ( = ?auto_36700 ?auto_36711 ) ) ( not ( = ?auto_36698 ?auto_36711 ) ) ( not ( = ?auto_36708 ?auto_36711 ) ) ( not ( = ?auto_36703 ?auto_36711 ) ) ( not ( = ?auto_36697 ?auto_36711 ) ) ( IS-CRATE ?auto_36697 ) ( not ( = ?auto_36712 ?auto_36697 ) ) ( not ( = ?auto_36699 ?auto_36712 ) ) ( not ( = ?auto_36700 ?auto_36712 ) ) ( not ( = ?auto_36698 ?auto_36712 ) ) ( not ( = ?auto_36708 ?auto_36712 ) ) ( not ( = ?auto_36703 ?auto_36712 ) ) ( not ( = ?auto_36711 ?auto_36712 ) ) ( AVAILABLE ?auto_36716 ) ( SURFACE-AT ?auto_36697 ?auto_36713 ) ( ON ?auto_36697 ?auto_36702 ) ( CLEAR ?auto_36697 ) ( not ( = ?auto_36699 ?auto_36702 ) ) ( not ( = ?auto_36700 ?auto_36702 ) ) ( not ( = ?auto_36698 ?auto_36702 ) ) ( not ( = ?auto_36708 ?auto_36702 ) ) ( not ( = ?auto_36703 ?auto_36702 ) ) ( not ( = ?auto_36697 ?auto_36702 ) ) ( not ( = ?auto_36711 ?auto_36702 ) ) ( not ( = ?auto_36712 ?auto_36702 ) ) ( SURFACE-AT ?auto_36718 ?auto_36707 ) ( CLEAR ?auto_36718 ) ( IS-CRATE ?auto_36712 ) ( not ( = ?auto_36718 ?auto_36712 ) ) ( not ( = ?auto_36699 ?auto_36718 ) ) ( not ( = ?auto_36700 ?auto_36718 ) ) ( not ( = ?auto_36698 ?auto_36718 ) ) ( not ( = ?auto_36708 ?auto_36718 ) ) ( not ( = ?auto_36703 ?auto_36718 ) ) ( not ( = ?auto_36697 ?auto_36718 ) ) ( not ( = ?auto_36711 ?auto_36718 ) ) ( not ( = ?auto_36702 ?auto_36718 ) ) ( AVAILABLE ?auto_36704 ) ( TRUCK-AT ?auto_36705 ?auto_36701 ) ( not ( = ?auto_36701 ?auto_36707 ) ) ( not ( = ?auto_36713 ?auto_36701 ) ) ( not ( = ?auto_36710 ?auto_36701 ) ) ( not ( = ?auto_36709 ?auto_36701 ) ) ( HOIST-AT ?auto_36714 ?auto_36701 ) ( not ( = ?auto_36704 ?auto_36714 ) ) ( not ( = ?auto_36716 ?auto_36714 ) ) ( not ( = ?auto_36715 ?auto_36714 ) ) ( not ( = ?auto_36706 ?auto_36714 ) ) ( AVAILABLE ?auto_36714 ) ( SURFACE-AT ?auto_36712 ?auto_36701 ) ( ON ?auto_36712 ?auto_36717 ) ( CLEAR ?auto_36712 ) ( not ( = ?auto_36699 ?auto_36717 ) ) ( not ( = ?auto_36700 ?auto_36717 ) ) ( not ( = ?auto_36698 ?auto_36717 ) ) ( not ( = ?auto_36708 ?auto_36717 ) ) ( not ( = ?auto_36703 ?auto_36717 ) ) ( not ( = ?auto_36697 ?auto_36717 ) ) ( not ( = ?auto_36711 ?auto_36717 ) ) ( not ( = ?auto_36712 ?auto_36717 ) ) ( not ( = ?auto_36702 ?auto_36717 ) ) ( not ( = ?auto_36718 ?auto_36717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36698 ?auto_36699 ?auto_36700 )
      ( MAKE-3CRATE-VERIFY ?auto_36697 ?auto_36698 ?auto_36699 ?auto_36700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36719 - SURFACE
      ?auto_36720 - SURFACE
      ?auto_36721 - SURFACE
      ?auto_36722 - SURFACE
      ?auto_36723 - SURFACE
    )
    :vars
    (
      ?auto_36727 - HOIST
      ?auto_36730 - PLACE
      ?auto_36735 - PLACE
      ?auto_36738 - HOIST
      ?auto_36731 - SURFACE
      ?auto_36733 - PLACE
      ?auto_36737 - HOIST
      ?auto_36726 - SURFACE
      ?auto_36732 - PLACE
      ?auto_36729 - HOIST
      ?auto_36734 - SURFACE
      ?auto_36725 - SURFACE
      ?auto_36740 - SURFACE
      ?auto_36728 - TRUCK
      ?auto_36724 - PLACE
      ?auto_36736 - HOIST
      ?auto_36739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36727 ?auto_36730 ) ( IS-CRATE ?auto_36723 ) ( not ( = ?auto_36722 ?auto_36723 ) ) ( not ( = ?auto_36721 ?auto_36722 ) ) ( not ( = ?auto_36721 ?auto_36723 ) ) ( not ( = ?auto_36735 ?auto_36730 ) ) ( HOIST-AT ?auto_36738 ?auto_36735 ) ( not ( = ?auto_36727 ?auto_36738 ) ) ( SURFACE-AT ?auto_36723 ?auto_36735 ) ( ON ?auto_36723 ?auto_36731 ) ( CLEAR ?auto_36723 ) ( not ( = ?auto_36722 ?auto_36731 ) ) ( not ( = ?auto_36723 ?auto_36731 ) ) ( not ( = ?auto_36721 ?auto_36731 ) ) ( IS-CRATE ?auto_36722 ) ( not ( = ?auto_36733 ?auto_36730 ) ) ( not ( = ?auto_36735 ?auto_36733 ) ) ( HOIST-AT ?auto_36737 ?auto_36733 ) ( not ( = ?auto_36727 ?auto_36737 ) ) ( not ( = ?auto_36738 ?auto_36737 ) ) ( AVAILABLE ?auto_36737 ) ( SURFACE-AT ?auto_36722 ?auto_36733 ) ( ON ?auto_36722 ?auto_36726 ) ( CLEAR ?auto_36722 ) ( not ( = ?auto_36722 ?auto_36726 ) ) ( not ( = ?auto_36723 ?auto_36726 ) ) ( not ( = ?auto_36721 ?auto_36726 ) ) ( not ( = ?auto_36731 ?auto_36726 ) ) ( IS-CRATE ?auto_36721 ) ( not ( = ?auto_36720 ?auto_36721 ) ) ( not ( = ?auto_36722 ?auto_36720 ) ) ( not ( = ?auto_36723 ?auto_36720 ) ) ( not ( = ?auto_36731 ?auto_36720 ) ) ( not ( = ?auto_36726 ?auto_36720 ) ) ( not ( = ?auto_36732 ?auto_36730 ) ) ( not ( = ?auto_36735 ?auto_36732 ) ) ( not ( = ?auto_36733 ?auto_36732 ) ) ( HOIST-AT ?auto_36729 ?auto_36732 ) ( not ( = ?auto_36727 ?auto_36729 ) ) ( not ( = ?auto_36738 ?auto_36729 ) ) ( not ( = ?auto_36737 ?auto_36729 ) ) ( AVAILABLE ?auto_36729 ) ( SURFACE-AT ?auto_36721 ?auto_36732 ) ( ON ?auto_36721 ?auto_36734 ) ( CLEAR ?auto_36721 ) ( not ( = ?auto_36722 ?auto_36734 ) ) ( not ( = ?auto_36723 ?auto_36734 ) ) ( not ( = ?auto_36721 ?auto_36734 ) ) ( not ( = ?auto_36731 ?auto_36734 ) ) ( not ( = ?auto_36726 ?auto_36734 ) ) ( not ( = ?auto_36720 ?auto_36734 ) ) ( IS-CRATE ?auto_36720 ) ( not ( = ?auto_36719 ?auto_36720 ) ) ( not ( = ?auto_36722 ?auto_36719 ) ) ( not ( = ?auto_36723 ?auto_36719 ) ) ( not ( = ?auto_36721 ?auto_36719 ) ) ( not ( = ?auto_36731 ?auto_36719 ) ) ( not ( = ?auto_36726 ?auto_36719 ) ) ( not ( = ?auto_36734 ?auto_36719 ) ) ( AVAILABLE ?auto_36738 ) ( SURFACE-AT ?auto_36720 ?auto_36735 ) ( ON ?auto_36720 ?auto_36725 ) ( CLEAR ?auto_36720 ) ( not ( = ?auto_36722 ?auto_36725 ) ) ( not ( = ?auto_36723 ?auto_36725 ) ) ( not ( = ?auto_36721 ?auto_36725 ) ) ( not ( = ?auto_36731 ?auto_36725 ) ) ( not ( = ?auto_36726 ?auto_36725 ) ) ( not ( = ?auto_36720 ?auto_36725 ) ) ( not ( = ?auto_36734 ?auto_36725 ) ) ( not ( = ?auto_36719 ?auto_36725 ) ) ( SURFACE-AT ?auto_36740 ?auto_36730 ) ( CLEAR ?auto_36740 ) ( IS-CRATE ?auto_36719 ) ( not ( = ?auto_36740 ?auto_36719 ) ) ( not ( = ?auto_36722 ?auto_36740 ) ) ( not ( = ?auto_36723 ?auto_36740 ) ) ( not ( = ?auto_36721 ?auto_36740 ) ) ( not ( = ?auto_36731 ?auto_36740 ) ) ( not ( = ?auto_36726 ?auto_36740 ) ) ( not ( = ?auto_36720 ?auto_36740 ) ) ( not ( = ?auto_36734 ?auto_36740 ) ) ( not ( = ?auto_36725 ?auto_36740 ) ) ( AVAILABLE ?auto_36727 ) ( TRUCK-AT ?auto_36728 ?auto_36724 ) ( not ( = ?auto_36724 ?auto_36730 ) ) ( not ( = ?auto_36735 ?auto_36724 ) ) ( not ( = ?auto_36733 ?auto_36724 ) ) ( not ( = ?auto_36732 ?auto_36724 ) ) ( HOIST-AT ?auto_36736 ?auto_36724 ) ( not ( = ?auto_36727 ?auto_36736 ) ) ( not ( = ?auto_36738 ?auto_36736 ) ) ( not ( = ?auto_36737 ?auto_36736 ) ) ( not ( = ?auto_36729 ?auto_36736 ) ) ( AVAILABLE ?auto_36736 ) ( SURFACE-AT ?auto_36719 ?auto_36724 ) ( ON ?auto_36719 ?auto_36739 ) ( CLEAR ?auto_36719 ) ( not ( = ?auto_36722 ?auto_36739 ) ) ( not ( = ?auto_36723 ?auto_36739 ) ) ( not ( = ?auto_36721 ?auto_36739 ) ) ( not ( = ?auto_36731 ?auto_36739 ) ) ( not ( = ?auto_36726 ?auto_36739 ) ) ( not ( = ?auto_36720 ?auto_36739 ) ) ( not ( = ?auto_36734 ?auto_36739 ) ) ( not ( = ?auto_36719 ?auto_36739 ) ) ( not ( = ?auto_36725 ?auto_36739 ) ) ( not ( = ?auto_36740 ?auto_36739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36721 ?auto_36722 ?auto_36723 )
      ( MAKE-4CRATE-VERIFY ?auto_36719 ?auto_36720 ?auto_36721 ?auto_36722 ?auto_36723 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36741 - SURFACE
      ?auto_36742 - SURFACE
      ?auto_36743 - SURFACE
      ?auto_36744 - SURFACE
      ?auto_36745 - SURFACE
      ?auto_36746 - SURFACE
    )
    :vars
    (
      ?auto_36750 - HOIST
      ?auto_36753 - PLACE
      ?auto_36758 - PLACE
      ?auto_36761 - HOIST
      ?auto_36754 - SURFACE
      ?auto_36756 - PLACE
      ?auto_36760 - HOIST
      ?auto_36749 - SURFACE
      ?auto_36755 - PLACE
      ?auto_36752 - HOIST
      ?auto_36757 - SURFACE
      ?auto_36748 - SURFACE
      ?auto_36751 - TRUCK
      ?auto_36747 - PLACE
      ?auto_36759 - HOIST
      ?auto_36762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36750 ?auto_36753 ) ( IS-CRATE ?auto_36746 ) ( not ( = ?auto_36745 ?auto_36746 ) ) ( not ( = ?auto_36744 ?auto_36745 ) ) ( not ( = ?auto_36744 ?auto_36746 ) ) ( not ( = ?auto_36758 ?auto_36753 ) ) ( HOIST-AT ?auto_36761 ?auto_36758 ) ( not ( = ?auto_36750 ?auto_36761 ) ) ( SURFACE-AT ?auto_36746 ?auto_36758 ) ( ON ?auto_36746 ?auto_36754 ) ( CLEAR ?auto_36746 ) ( not ( = ?auto_36745 ?auto_36754 ) ) ( not ( = ?auto_36746 ?auto_36754 ) ) ( not ( = ?auto_36744 ?auto_36754 ) ) ( IS-CRATE ?auto_36745 ) ( not ( = ?auto_36756 ?auto_36753 ) ) ( not ( = ?auto_36758 ?auto_36756 ) ) ( HOIST-AT ?auto_36760 ?auto_36756 ) ( not ( = ?auto_36750 ?auto_36760 ) ) ( not ( = ?auto_36761 ?auto_36760 ) ) ( AVAILABLE ?auto_36760 ) ( SURFACE-AT ?auto_36745 ?auto_36756 ) ( ON ?auto_36745 ?auto_36749 ) ( CLEAR ?auto_36745 ) ( not ( = ?auto_36745 ?auto_36749 ) ) ( not ( = ?auto_36746 ?auto_36749 ) ) ( not ( = ?auto_36744 ?auto_36749 ) ) ( not ( = ?auto_36754 ?auto_36749 ) ) ( IS-CRATE ?auto_36744 ) ( not ( = ?auto_36743 ?auto_36744 ) ) ( not ( = ?auto_36745 ?auto_36743 ) ) ( not ( = ?auto_36746 ?auto_36743 ) ) ( not ( = ?auto_36754 ?auto_36743 ) ) ( not ( = ?auto_36749 ?auto_36743 ) ) ( not ( = ?auto_36755 ?auto_36753 ) ) ( not ( = ?auto_36758 ?auto_36755 ) ) ( not ( = ?auto_36756 ?auto_36755 ) ) ( HOIST-AT ?auto_36752 ?auto_36755 ) ( not ( = ?auto_36750 ?auto_36752 ) ) ( not ( = ?auto_36761 ?auto_36752 ) ) ( not ( = ?auto_36760 ?auto_36752 ) ) ( AVAILABLE ?auto_36752 ) ( SURFACE-AT ?auto_36744 ?auto_36755 ) ( ON ?auto_36744 ?auto_36757 ) ( CLEAR ?auto_36744 ) ( not ( = ?auto_36745 ?auto_36757 ) ) ( not ( = ?auto_36746 ?auto_36757 ) ) ( not ( = ?auto_36744 ?auto_36757 ) ) ( not ( = ?auto_36754 ?auto_36757 ) ) ( not ( = ?auto_36749 ?auto_36757 ) ) ( not ( = ?auto_36743 ?auto_36757 ) ) ( IS-CRATE ?auto_36743 ) ( not ( = ?auto_36742 ?auto_36743 ) ) ( not ( = ?auto_36745 ?auto_36742 ) ) ( not ( = ?auto_36746 ?auto_36742 ) ) ( not ( = ?auto_36744 ?auto_36742 ) ) ( not ( = ?auto_36754 ?auto_36742 ) ) ( not ( = ?auto_36749 ?auto_36742 ) ) ( not ( = ?auto_36757 ?auto_36742 ) ) ( AVAILABLE ?auto_36761 ) ( SURFACE-AT ?auto_36743 ?auto_36758 ) ( ON ?auto_36743 ?auto_36748 ) ( CLEAR ?auto_36743 ) ( not ( = ?auto_36745 ?auto_36748 ) ) ( not ( = ?auto_36746 ?auto_36748 ) ) ( not ( = ?auto_36744 ?auto_36748 ) ) ( not ( = ?auto_36754 ?auto_36748 ) ) ( not ( = ?auto_36749 ?auto_36748 ) ) ( not ( = ?auto_36743 ?auto_36748 ) ) ( not ( = ?auto_36757 ?auto_36748 ) ) ( not ( = ?auto_36742 ?auto_36748 ) ) ( SURFACE-AT ?auto_36741 ?auto_36753 ) ( CLEAR ?auto_36741 ) ( IS-CRATE ?auto_36742 ) ( not ( = ?auto_36741 ?auto_36742 ) ) ( not ( = ?auto_36745 ?auto_36741 ) ) ( not ( = ?auto_36746 ?auto_36741 ) ) ( not ( = ?auto_36744 ?auto_36741 ) ) ( not ( = ?auto_36754 ?auto_36741 ) ) ( not ( = ?auto_36749 ?auto_36741 ) ) ( not ( = ?auto_36743 ?auto_36741 ) ) ( not ( = ?auto_36757 ?auto_36741 ) ) ( not ( = ?auto_36748 ?auto_36741 ) ) ( AVAILABLE ?auto_36750 ) ( TRUCK-AT ?auto_36751 ?auto_36747 ) ( not ( = ?auto_36747 ?auto_36753 ) ) ( not ( = ?auto_36758 ?auto_36747 ) ) ( not ( = ?auto_36756 ?auto_36747 ) ) ( not ( = ?auto_36755 ?auto_36747 ) ) ( HOIST-AT ?auto_36759 ?auto_36747 ) ( not ( = ?auto_36750 ?auto_36759 ) ) ( not ( = ?auto_36761 ?auto_36759 ) ) ( not ( = ?auto_36760 ?auto_36759 ) ) ( not ( = ?auto_36752 ?auto_36759 ) ) ( AVAILABLE ?auto_36759 ) ( SURFACE-AT ?auto_36742 ?auto_36747 ) ( ON ?auto_36742 ?auto_36762 ) ( CLEAR ?auto_36742 ) ( not ( = ?auto_36745 ?auto_36762 ) ) ( not ( = ?auto_36746 ?auto_36762 ) ) ( not ( = ?auto_36744 ?auto_36762 ) ) ( not ( = ?auto_36754 ?auto_36762 ) ) ( not ( = ?auto_36749 ?auto_36762 ) ) ( not ( = ?auto_36743 ?auto_36762 ) ) ( not ( = ?auto_36757 ?auto_36762 ) ) ( not ( = ?auto_36742 ?auto_36762 ) ) ( not ( = ?auto_36748 ?auto_36762 ) ) ( not ( = ?auto_36741 ?auto_36762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36744 ?auto_36745 ?auto_36746 )
      ( MAKE-5CRATE-VERIFY ?auto_36741 ?auto_36742 ?auto_36743 ?auto_36744 ?auto_36745 ?auto_36746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_36763 - SURFACE
      ?auto_36764 - SURFACE
    )
    :vars
    (
      ?auto_36768 - HOIST
      ?auto_36771 - PLACE
      ?auto_36775 - SURFACE
      ?auto_36779 - PLACE
      ?auto_36782 - HOIST
      ?auto_36772 - SURFACE
      ?auto_36774 - PLACE
      ?auto_36781 - HOIST
      ?auto_36767 - SURFACE
      ?auto_36776 - SURFACE
      ?auto_36773 - PLACE
      ?auto_36770 - HOIST
      ?auto_36777 - SURFACE
      ?auto_36778 - SURFACE
      ?auto_36766 - SURFACE
      ?auto_36784 - SURFACE
      ?auto_36765 - PLACE
      ?auto_36780 - HOIST
      ?auto_36783 - SURFACE
      ?auto_36769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36768 ?auto_36771 ) ( IS-CRATE ?auto_36764 ) ( not ( = ?auto_36763 ?auto_36764 ) ) ( not ( = ?auto_36775 ?auto_36763 ) ) ( not ( = ?auto_36775 ?auto_36764 ) ) ( not ( = ?auto_36779 ?auto_36771 ) ) ( HOIST-AT ?auto_36782 ?auto_36779 ) ( not ( = ?auto_36768 ?auto_36782 ) ) ( SURFACE-AT ?auto_36764 ?auto_36779 ) ( ON ?auto_36764 ?auto_36772 ) ( CLEAR ?auto_36764 ) ( not ( = ?auto_36763 ?auto_36772 ) ) ( not ( = ?auto_36764 ?auto_36772 ) ) ( not ( = ?auto_36775 ?auto_36772 ) ) ( IS-CRATE ?auto_36763 ) ( not ( = ?auto_36774 ?auto_36771 ) ) ( not ( = ?auto_36779 ?auto_36774 ) ) ( HOIST-AT ?auto_36781 ?auto_36774 ) ( not ( = ?auto_36768 ?auto_36781 ) ) ( not ( = ?auto_36782 ?auto_36781 ) ) ( AVAILABLE ?auto_36781 ) ( SURFACE-AT ?auto_36763 ?auto_36774 ) ( ON ?auto_36763 ?auto_36767 ) ( CLEAR ?auto_36763 ) ( not ( = ?auto_36763 ?auto_36767 ) ) ( not ( = ?auto_36764 ?auto_36767 ) ) ( not ( = ?auto_36775 ?auto_36767 ) ) ( not ( = ?auto_36772 ?auto_36767 ) ) ( IS-CRATE ?auto_36775 ) ( not ( = ?auto_36776 ?auto_36775 ) ) ( not ( = ?auto_36763 ?auto_36776 ) ) ( not ( = ?auto_36764 ?auto_36776 ) ) ( not ( = ?auto_36772 ?auto_36776 ) ) ( not ( = ?auto_36767 ?auto_36776 ) ) ( not ( = ?auto_36773 ?auto_36771 ) ) ( not ( = ?auto_36779 ?auto_36773 ) ) ( not ( = ?auto_36774 ?auto_36773 ) ) ( HOIST-AT ?auto_36770 ?auto_36773 ) ( not ( = ?auto_36768 ?auto_36770 ) ) ( not ( = ?auto_36782 ?auto_36770 ) ) ( not ( = ?auto_36781 ?auto_36770 ) ) ( AVAILABLE ?auto_36770 ) ( SURFACE-AT ?auto_36775 ?auto_36773 ) ( ON ?auto_36775 ?auto_36777 ) ( CLEAR ?auto_36775 ) ( not ( = ?auto_36763 ?auto_36777 ) ) ( not ( = ?auto_36764 ?auto_36777 ) ) ( not ( = ?auto_36775 ?auto_36777 ) ) ( not ( = ?auto_36772 ?auto_36777 ) ) ( not ( = ?auto_36767 ?auto_36777 ) ) ( not ( = ?auto_36776 ?auto_36777 ) ) ( IS-CRATE ?auto_36776 ) ( not ( = ?auto_36778 ?auto_36776 ) ) ( not ( = ?auto_36763 ?auto_36778 ) ) ( not ( = ?auto_36764 ?auto_36778 ) ) ( not ( = ?auto_36775 ?auto_36778 ) ) ( not ( = ?auto_36772 ?auto_36778 ) ) ( not ( = ?auto_36767 ?auto_36778 ) ) ( not ( = ?auto_36777 ?auto_36778 ) ) ( AVAILABLE ?auto_36782 ) ( SURFACE-AT ?auto_36776 ?auto_36779 ) ( ON ?auto_36776 ?auto_36766 ) ( CLEAR ?auto_36776 ) ( not ( = ?auto_36763 ?auto_36766 ) ) ( not ( = ?auto_36764 ?auto_36766 ) ) ( not ( = ?auto_36775 ?auto_36766 ) ) ( not ( = ?auto_36772 ?auto_36766 ) ) ( not ( = ?auto_36767 ?auto_36766 ) ) ( not ( = ?auto_36776 ?auto_36766 ) ) ( not ( = ?auto_36777 ?auto_36766 ) ) ( not ( = ?auto_36778 ?auto_36766 ) ) ( SURFACE-AT ?auto_36784 ?auto_36771 ) ( CLEAR ?auto_36784 ) ( IS-CRATE ?auto_36778 ) ( not ( = ?auto_36784 ?auto_36778 ) ) ( not ( = ?auto_36763 ?auto_36784 ) ) ( not ( = ?auto_36764 ?auto_36784 ) ) ( not ( = ?auto_36775 ?auto_36784 ) ) ( not ( = ?auto_36772 ?auto_36784 ) ) ( not ( = ?auto_36767 ?auto_36784 ) ) ( not ( = ?auto_36776 ?auto_36784 ) ) ( not ( = ?auto_36777 ?auto_36784 ) ) ( not ( = ?auto_36766 ?auto_36784 ) ) ( AVAILABLE ?auto_36768 ) ( not ( = ?auto_36765 ?auto_36771 ) ) ( not ( = ?auto_36779 ?auto_36765 ) ) ( not ( = ?auto_36774 ?auto_36765 ) ) ( not ( = ?auto_36773 ?auto_36765 ) ) ( HOIST-AT ?auto_36780 ?auto_36765 ) ( not ( = ?auto_36768 ?auto_36780 ) ) ( not ( = ?auto_36782 ?auto_36780 ) ) ( not ( = ?auto_36781 ?auto_36780 ) ) ( not ( = ?auto_36770 ?auto_36780 ) ) ( AVAILABLE ?auto_36780 ) ( SURFACE-AT ?auto_36778 ?auto_36765 ) ( ON ?auto_36778 ?auto_36783 ) ( CLEAR ?auto_36778 ) ( not ( = ?auto_36763 ?auto_36783 ) ) ( not ( = ?auto_36764 ?auto_36783 ) ) ( not ( = ?auto_36775 ?auto_36783 ) ) ( not ( = ?auto_36772 ?auto_36783 ) ) ( not ( = ?auto_36767 ?auto_36783 ) ) ( not ( = ?auto_36776 ?auto_36783 ) ) ( not ( = ?auto_36777 ?auto_36783 ) ) ( not ( = ?auto_36778 ?auto_36783 ) ) ( not ( = ?auto_36766 ?auto_36783 ) ) ( not ( = ?auto_36784 ?auto_36783 ) ) ( TRUCK-AT ?auto_36769 ?auto_36771 ) )
    :subtasks
    ( ( !DRIVE ?auto_36769 ?auto_36771 ?auto_36765 )
      ( MAKE-2CRATE ?auto_36775 ?auto_36763 ?auto_36764 )
      ( MAKE-1CRATE-VERIFY ?auto_36763 ?auto_36764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_36785 - SURFACE
      ?auto_36786 - SURFACE
      ?auto_36787 - SURFACE
    )
    :vars
    (
      ?auto_36799 - HOIST
      ?auto_36798 - PLACE
      ?auto_36805 - PLACE
      ?auto_36788 - HOIST
      ?auto_36790 - SURFACE
      ?auto_36789 - PLACE
      ?auto_36804 - HOIST
      ?auto_36796 - SURFACE
      ?auto_36806 - SURFACE
      ?auto_36800 - PLACE
      ?auto_36797 - HOIST
      ?auto_36801 - SURFACE
      ?auto_36792 - SURFACE
      ?auto_36802 - SURFACE
      ?auto_36795 - SURFACE
      ?auto_36803 - PLACE
      ?auto_36794 - HOIST
      ?auto_36793 - SURFACE
      ?auto_36791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36799 ?auto_36798 ) ( IS-CRATE ?auto_36787 ) ( not ( = ?auto_36786 ?auto_36787 ) ) ( not ( = ?auto_36785 ?auto_36786 ) ) ( not ( = ?auto_36785 ?auto_36787 ) ) ( not ( = ?auto_36805 ?auto_36798 ) ) ( HOIST-AT ?auto_36788 ?auto_36805 ) ( not ( = ?auto_36799 ?auto_36788 ) ) ( SURFACE-AT ?auto_36787 ?auto_36805 ) ( ON ?auto_36787 ?auto_36790 ) ( CLEAR ?auto_36787 ) ( not ( = ?auto_36786 ?auto_36790 ) ) ( not ( = ?auto_36787 ?auto_36790 ) ) ( not ( = ?auto_36785 ?auto_36790 ) ) ( IS-CRATE ?auto_36786 ) ( not ( = ?auto_36789 ?auto_36798 ) ) ( not ( = ?auto_36805 ?auto_36789 ) ) ( HOIST-AT ?auto_36804 ?auto_36789 ) ( not ( = ?auto_36799 ?auto_36804 ) ) ( not ( = ?auto_36788 ?auto_36804 ) ) ( AVAILABLE ?auto_36804 ) ( SURFACE-AT ?auto_36786 ?auto_36789 ) ( ON ?auto_36786 ?auto_36796 ) ( CLEAR ?auto_36786 ) ( not ( = ?auto_36786 ?auto_36796 ) ) ( not ( = ?auto_36787 ?auto_36796 ) ) ( not ( = ?auto_36785 ?auto_36796 ) ) ( not ( = ?auto_36790 ?auto_36796 ) ) ( IS-CRATE ?auto_36785 ) ( not ( = ?auto_36806 ?auto_36785 ) ) ( not ( = ?auto_36786 ?auto_36806 ) ) ( not ( = ?auto_36787 ?auto_36806 ) ) ( not ( = ?auto_36790 ?auto_36806 ) ) ( not ( = ?auto_36796 ?auto_36806 ) ) ( not ( = ?auto_36800 ?auto_36798 ) ) ( not ( = ?auto_36805 ?auto_36800 ) ) ( not ( = ?auto_36789 ?auto_36800 ) ) ( HOIST-AT ?auto_36797 ?auto_36800 ) ( not ( = ?auto_36799 ?auto_36797 ) ) ( not ( = ?auto_36788 ?auto_36797 ) ) ( not ( = ?auto_36804 ?auto_36797 ) ) ( AVAILABLE ?auto_36797 ) ( SURFACE-AT ?auto_36785 ?auto_36800 ) ( ON ?auto_36785 ?auto_36801 ) ( CLEAR ?auto_36785 ) ( not ( = ?auto_36786 ?auto_36801 ) ) ( not ( = ?auto_36787 ?auto_36801 ) ) ( not ( = ?auto_36785 ?auto_36801 ) ) ( not ( = ?auto_36790 ?auto_36801 ) ) ( not ( = ?auto_36796 ?auto_36801 ) ) ( not ( = ?auto_36806 ?auto_36801 ) ) ( IS-CRATE ?auto_36806 ) ( not ( = ?auto_36792 ?auto_36806 ) ) ( not ( = ?auto_36786 ?auto_36792 ) ) ( not ( = ?auto_36787 ?auto_36792 ) ) ( not ( = ?auto_36785 ?auto_36792 ) ) ( not ( = ?auto_36790 ?auto_36792 ) ) ( not ( = ?auto_36796 ?auto_36792 ) ) ( not ( = ?auto_36801 ?auto_36792 ) ) ( AVAILABLE ?auto_36788 ) ( SURFACE-AT ?auto_36806 ?auto_36805 ) ( ON ?auto_36806 ?auto_36802 ) ( CLEAR ?auto_36806 ) ( not ( = ?auto_36786 ?auto_36802 ) ) ( not ( = ?auto_36787 ?auto_36802 ) ) ( not ( = ?auto_36785 ?auto_36802 ) ) ( not ( = ?auto_36790 ?auto_36802 ) ) ( not ( = ?auto_36796 ?auto_36802 ) ) ( not ( = ?auto_36806 ?auto_36802 ) ) ( not ( = ?auto_36801 ?auto_36802 ) ) ( not ( = ?auto_36792 ?auto_36802 ) ) ( SURFACE-AT ?auto_36795 ?auto_36798 ) ( CLEAR ?auto_36795 ) ( IS-CRATE ?auto_36792 ) ( not ( = ?auto_36795 ?auto_36792 ) ) ( not ( = ?auto_36786 ?auto_36795 ) ) ( not ( = ?auto_36787 ?auto_36795 ) ) ( not ( = ?auto_36785 ?auto_36795 ) ) ( not ( = ?auto_36790 ?auto_36795 ) ) ( not ( = ?auto_36796 ?auto_36795 ) ) ( not ( = ?auto_36806 ?auto_36795 ) ) ( not ( = ?auto_36801 ?auto_36795 ) ) ( not ( = ?auto_36802 ?auto_36795 ) ) ( AVAILABLE ?auto_36799 ) ( not ( = ?auto_36803 ?auto_36798 ) ) ( not ( = ?auto_36805 ?auto_36803 ) ) ( not ( = ?auto_36789 ?auto_36803 ) ) ( not ( = ?auto_36800 ?auto_36803 ) ) ( HOIST-AT ?auto_36794 ?auto_36803 ) ( not ( = ?auto_36799 ?auto_36794 ) ) ( not ( = ?auto_36788 ?auto_36794 ) ) ( not ( = ?auto_36804 ?auto_36794 ) ) ( not ( = ?auto_36797 ?auto_36794 ) ) ( AVAILABLE ?auto_36794 ) ( SURFACE-AT ?auto_36792 ?auto_36803 ) ( ON ?auto_36792 ?auto_36793 ) ( CLEAR ?auto_36792 ) ( not ( = ?auto_36786 ?auto_36793 ) ) ( not ( = ?auto_36787 ?auto_36793 ) ) ( not ( = ?auto_36785 ?auto_36793 ) ) ( not ( = ?auto_36790 ?auto_36793 ) ) ( not ( = ?auto_36796 ?auto_36793 ) ) ( not ( = ?auto_36806 ?auto_36793 ) ) ( not ( = ?auto_36801 ?auto_36793 ) ) ( not ( = ?auto_36792 ?auto_36793 ) ) ( not ( = ?auto_36802 ?auto_36793 ) ) ( not ( = ?auto_36795 ?auto_36793 ) ) ( TRUCK-AT ?auto_36791 ?auto_36798 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_36786 ?auto_36787 )
      ( MAKE-2CRATE-VERIFY ?auto_36785 ?auto_36786 ?auto_36787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_36807 - SURFACE
      ?auto_36808 - SURFACE
      ?auto_36809 - SURFACE
      ?auto_36810 - SURFACE
    )
    :vars
    (
      ?auto_36822 - HOIST
      ?auto_36824 - PLACE
      ?auto_36819 - PLACE
      ?auto_36827 - HOIST
      ?auto_36823 - SURFACE
      ?auto_36826 - PLACE
      ?auto_36814 - HOIST
      ?auto_36816 - SURFACE
      ?auto_36825 - PLACE
      ?auto_36820 - HOIST
      ?auto_36815 - SURFACE
      ?auto_36821 - SURFACE
      ?auto_36817 - SURFACE
      ?auto_36818 - SURFACE
      ?auto_36813 - PLACE
      ?auto_36812 - HOIST
      ?auto_36811 - SURFACE
      ?auto_36828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36822 ?auto_36824 ) ( IS-CRATE ?auto_36810 ) ( not ( = ?auto_36809 ?auto_36810 ) ) ( not ( = ?auto_36808 ?auto_36809 ) ) ( not ( = ?auto_36808 ?auto_36810 ) ) ( not ( = ?auto_36819 ?auto_36824 ) ) ( HOIST-AT ?auto_36827 ?auto_36819 ) ( not ( = ?auto_36822 ?auto_36827 ) ) ( SURFACE-AT ?auto_36810 ?auto_36819 ) ( ON ?auto_36810 ?auto_36823 ) ( CLEAR ?auto_36810 ) ( not ( = ?auto_36809 ?auto_36823 ) ) ( not ( = ?auto_36810 ?auto_36823 ) ) ( not ( = ?auto_36808 ?auto_36823 ) ) ( IS-CRATE ?auto_36809 ) ( not ( = ?auto_36826 ?auto_36824 ) ) ( not ( = ?auto_36819 ?auto_36826 ) ) ( HOIST-AT ?auto_36814 ?auto_36826 ) ( not ( = ?auto_36822 ?auto_36814 ) ) ( not ( = ?auto_36827 ?auto_36814 ) ) ( AVAILABLE ?auto_36814 ) ( SURFACE-AT ?auto_36809 ?auto_36826 ) ( ON ?auto_36809 ?auto_36816 ) ( CLEAR ?auto_36809 ) ( not ( = ?auto_36809 ?auto_36816 ) ) ( not ( = ?auto_36810 ?auto_36816 ) ) ( not ( = ?auto_36808 ?auto_36816 ) ) ( not ( = ?auto_36823 ?auto_36816 ) ) ( IS-CRATE ?auto_36808 ) ( not ( = ?auto_36807 ?auto_36808 ) ) ( not ( = ?auto_36809 ?auto_36807 ) ) ( not ( = ?auto_36810 ?auto_36807 ) ) ( not ( = ?auto_36823 ?auto_36807 ) ) ( not ( = ?auto_36816 ?auto_36807 ) ) ( not ( = ?auto_36825 ?auto_36824 ) ) ( not ( = ?auto_36819 ?auto_36825 ) ) ( not ( = ?auto_36826 ?auto_36825 ) ) ( HOIST-AT ?auto_36820 ?auto_36825 ) ( not ( = ?auto_36822 ?auto_36820 ) ) ( not ( = ?auto_36827 ?auto_36820 ) ) ( not ( = ?auto_36814 ?auto_36820 ) ) ( AVAILABLE ?auto_36820 ) ( SURFACE-AT ?auto_36808 ?auto_36825 ) ( ON ?auto_36808 ?auto_36815 ) ( CLEAR ?auto_36808 ) ( not ( = ?auto_36809 ?auto_36815 ) ) ( not ( = ?auto_36810 ?auto_36815 ) ) ( not ( = ?auto_36808 ?auto_36815 ) ) ( not ( = ?auto_36823 ?auto_36815 ) ) ( not ( = ?auto_36816 ?auto_36815 ) ) ( not ( = ?auto_36807 ?auto_36815 ) ) ( IS-CRATE ?auto_36807 ) ( not ( = ?auto_36821 ?auto_36807 ) ) ( not ( = ?auto_36809 ?auto_36821 ) ) ( not ( = ?auto_36810 ?auto_36821 ) ) ( not ( = ?auto_36808 ?auto_36821 ) ) ( not ( = ?auto_36823 ?auto_36821 ) ) ( not ( = ?auto_36816 ?auto_36821 ) ) ( not ( = ?auto_36815 ?auto_36821 ) ) ( AVAILABLE ?auto_36827 ) ( SURFACE-AT ?auto_36807 ?auto_36819 ) ( ON ?auto_36807 ?auto_36817 ) ( CLEAR ?auto_36807 ) ( not ( = ?auto_36809 ?auto_36817 ) ) ( not ( = ?auto_36810 ?auto_36817 ) ) ( not ( = ?auto_36808 ?auto_36817 ) ) ( not ( = ?auto_36823 ?auto_36817 ) ) ( not ( = ?auto_36816 ?auto_36817 ) ) ( not ( = ?auto_36807 ?auto_36817 ) ) ( not ( = ?auto_36815 ?auto_36817 ) ) ( not ( = ?auto_36821 ?auto_36817 ) ) ( SURFACE-AT ?auto_36818 ?auto_36824 ) ( CLEAR ?auto_36818 ) ( IS-CRATE ?auto_36821 ) ( not ( = ?auto_36818 ?auto_36821 ) ) ( not ( = ?auto_36809 ?auto_36818 ) ) ( not ( = ?auto_36810 ?auto_36818 ) ) ( not ( = ?auto_36808 ?auto_36818 ) ) ( not ( = ?auto_36823 ?auto_36818 ) ) ( not ( = ?auto_36816 ?auto_36818 ) ) ( not ( = ?auto_36807 ?auto_36818 ) ) ( not ( = ?auto_36815 ?auto_36818 ) ) ( not ( = ?auto_36817 ?auto_36818 ) ) ( AVAILABLE ?auto_36822 ) ( not ( = ?auto_36813 ?auto_36824 ) ) ( not ( = ?auto_36819 ?auto_36813 ) ) ( not ( = ?auto_36826 ?auto_36813 ) ) ( not ( = ?auto_36825 ?auto_36813 ) ) ( HOIST-AT ?auto_36812 ?auto_36813 ) ( not ( = ?auto_36822 ?auto_36812 ) ) ( not ( = ?auto_36827 ?auto_36812 ) ) ( not ( = ?auto_36814 ?auto_36812 ) ) ( not ( = ?auto_36820 ?auto_36812 ) ) ( AVAILABLE ?auto_36812 ) ( SURFACE-AT ?auto_36821 ?auto_36813 ) ( ON ?auto_36821 ?auto_36811 ) ( CLEAR ?auto_36821 ) ( not ( = ?auto_36809 ?auto_36811 ) ) ( not ( = ?auto_36810 ?auto_36811 ) ) ( not ( = ?auto_36808 ?auto_36811 ) ) ( not ( = ?auto_36823 ?auto_36811 ) ) ( not ( = ?auto_36816 ?auto_36811 ) ) ( not ( = ?auto_36807 ?auto_36811 ) ) ( not ( = ?auto_36815 ?auto_36811 ) ) ( not ( = ?auto_36821 ?auto_36811 ) ) ( not ( = ?auto_36817 ?auto_36811 ) ) ( not ( = ?auto_36818 ?auto_36811 ) ) ( TRUCK-AT ?auto_36828 ?auto_36824 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36808 ?auto_36809 ?auto_36810 )
      ( MAKE-3CRATE-VERIFY ?auto_36807 ?auto_36808 ?auto_36809 ?auto_36810 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_36829 - SURFACE
      ?auto_36830 - SURFACE
      ?auto_36831 - SURFACE
      ?auto_36832 - SURFACE
      ?auto_36833 - SURFACE
    )
    :vars
    (
      ?auto_36844 - HOIST
      ?auto_36846 - PLACE
      ?auto_36842 - PLACE
      ?auto_36849 - HOIST
      ?auto_36845 - SURFACE
      ?auto_36848 - PLACE
      ?auto_36837 - HOIST
      ?auto_36839 - SURFACE
      ?auto_36847 - PLACE
      ?auto_36843 - HOIST
      ?auto_36838 - SURFACE
      ?auto_36840 - SURFACE
      ?auto_36841 - SURFACE
      ?auto_36836 - PLACE
      ?auto_36835 - HOIST
      ?auto_36834 - SURFACE
      ?auto_36850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36844 ?auto_36846 ) ( IS-CRATE ?auto_36833 ) ( not ( = ?auto_36832 ?auto_36833 ) ) ( not ( = ?auto_36831 ?auto_36832 ) ) ( not ( = ?auto_36831 ?auto_36833 ) ) ( not ( = ?auto_36842 ?auto_36846 ) ) ( HOIST-AT ?auto_36849 ?auto_36842 ) ( not ( = ?auto_36844 ?auto_36849 ) ) ( SURFACE-AT ?auto_36833 ?auto_36842 ) ( ON ?auto_36833 ?auto_36845 ) ( CLEAR ?auto_36833 ) ( not ( = ?auto_36832 ?auto_36845 ) ) ( not ( = ?auto_36833 ?auto_36845 ) ) ( not ( = ?auto_36831 ?auto_36845 ) ) ( IS-CRATE ?auto_36832 ) ( not ( = ?auto_36848 ?auto_36846 ) ) ( not ( = ?auto_36842 ?auto_36848 ) ) ( HOIST-AT ?auto_36837 ?auto_36848 ) ( not ( = ?auto_36844 ?auto_36837 ) ) ( not ( = ?auto_36849 ?auto_36837 ) ) ( AVAILABLE ?auto_36837 ) ( SURFACE-AT ?auto_36832 ?auto_36848 ) ( ON ?auto_36832 ?auto_36839 ) ( CLEAR ?auto_36832 ) ( not ( = ?auto_36832 ?auto_36839 ) ) ( not ( = ?auto_36833 ?auto_36839 ) ) ( not ( = ?auto_36831 ?auto_36839 ) ) ( not ( = ?auto_36845 ?auto_36839 ) ) ( IS-CRATE ?auto_36831 ) ( not ( = ?auto_36830 ?auto_36831 ) ) ( not ( = ?auto_36832 ?auto_36830 ) ) ( not ( = ?auto_36833 ?auto_36830 ) ) ( not ( = ?auto_36845 ?auto_36830 ) ) ( not ( = ?auto_36839 ?auto_36830 ) ) ( not ( = ?auto_36847 ?auto_36846 ) ) ( not ( = ?auto_36842 ?auto_36847 ) ) ( not ( = ?auto_36848 ?auto_36847 ) ) ( HOIST-AT ?auto_36843 ?auto_36847 ) ( not ( = ?auto_36844 ?auto_36843 ) ) ( not ( = ?auto_36849 ?auto_36843 ) ) ( not ( = ?auto_36837 ?auto_36843 ) ) ( AVAILABLE ?auto_36843 ) ( SURFACE-AT ?auto_36831 ?auto_36847 ) ( ON ?auto_36831 ?auto_36838 ) ( CLEAR ?auto_36831 ) ( not ( = ?auto_36832 ?auto_36838 ) ) ( not ( = ?auto_36833 ?auto_36838 ) ) ( not ( = ?auto_36831 ?auto_36838 ) ) ( not ( = ?auto_36845 ?auto_36838 ) ) ( not ( = ?auto_36839 ?auto_36838 ) ) ( not ( = ?auto_36830 ?auto_36838 ) ) ( IS-CRATE ?auto_36830 ) ( not ( = ?auto_36829 ?auto_36830 ) ) ( not ( = ?auto_36832 ?auto_36829 ) ) ( not ( = ?auto_36833 ?auto_36829 ) ) ( not ( = ?auto_36831 ?auto_36829 ) ) ( not ( = ?auto_36845 ?auto_36829 ) ) ( not ( = ?auto_36839 ?auto_36829 ) ) ( not ( = ?auto_36838 ?auto_36829 ) ) ( AVAILABLE ?auto_36849 ) ( SURFACE-AT ?auto_36830 ?auto_36842 ) ( ON ?auto_36830 ?auto_36840 ) ( CLEAR ?auto_36830 ) ( not ( = ?auto_36832 ?auto_36840 ) ) ( not ( = ?auto_36833 ?auto_36840 ) ) ( not ( = ?auto_36831 ?auto_36840 ) ) ( not ( = ?auto_36845 ?auto_36840 ) ) ( not ( = ?auto_36839 ?auto_36840 ) ) ( not ( = ?auto_36830 ?auto_36840 ) ) ( not ( = ?auto_36838 ?auto_36840 ) ) ( not ( = ?auto_36829 ?auto_36840 ) ) ( SURFACE-AT ?auto_36841 ?auto_36846 ) ( CLEAR ?auto_36841 ) ( IS-CRATE ?auto_36829 ) ( not ( = ?auto_36841 ?auto_36829 ) ) ( not ( = ?auto_36832 ?auto_36841 ) ) ( not ( = ?auto_36833 ?auto_36841 ) ) ( not ( = ?auto_36831 ?auto_36841 ) ) ( not ( = ?auto_36845 ?auto_36841 ) ) ( not ( = ?auto_36839 ?auto_36841 ) ) ( not ( = ?auto_36830 ?auto_36841 ) ) ( not ( = ?auto_36838 ?auto_36841 ) ) ( not ( = ?auto_36840 ?auto_36841 ) ) ( AVAILABLE ?auto_36844 ) ( not ( = ?auto_36836 ?auto_36846 ) ) ( not ( = ?auto_36842 ?auto_36836 ) ) ( not ( = ?auto_36848 ?auto_36836 ) ) ( not ( = ?auto_36847 ?auto_36836 ) ) ( HOIST-AT ?auto_36835 ?auto_36836 ) ( not ( = ?auto_36844 ?auto_36835 ) ) ( not ( = ?auto_36849 ?auto_36835 ) ) ( not ( = ?auto_36837 ?auto_36835 ) ) ( not ( = ?auto_36843 ?auto_36835 ) ) ( AVAILABLE ?auto_36835 ) ( SURFACE-AT ?auto_36829 ?auto_36836 ) ( ON ?auto_36829 ?auto_36834 ) ( CLEAR ?auto_36829 ) ( not ( = ?auto_36832 ?auto_36834 ) ) ( not ( = ?auto_36833 ?auto_36834 ) ) ( not ( = ?auto_36831 ?auto_36834 ) ) ( not ( = ?auto_36845 ?auto_36834 ) ) ( not ( = ?auto_36839 ?auto_36834 ) ) ( not ( = ?auto_36830 ?auto_36834 ) ) ( not ( = ?auto_36838 ?auto_36834 ) ) ( not ( = ?auto_36829 ?auto_36834 ) ) ( not ( = ?auto_36840 ?auto_36834 ) ) ( not ( = ?auto_36841 ?auto_36834 ) ) ( TRUCK-AT ?auto_36850 ?auto_36846 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36831 ?auto_36832 ?auto_36833 )
      ( MAKE-4CRATE-VERIFY ?auto_36829 ?auto_36830 ?auto_36831 ?auto_36832 ?auto_36833 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_36851 - SURFACE
      ?auto_36852 - SURFACE
      ?auto_36853 - SURFACE
      ?auto_36854 - SURFACE
      ?auto_36855 - SURFACE
      ?auto_36856 - SURFACE
    )
    :vars
    (
      ?auto_36866 - HOIST
      ?auto_36868 - PLACE
      ?auto_36864 - PLACE
      ?auto_36871 - HOIST
      ?auto_36867 - SURFACE
      ?auto_36870 - PLACE
      ?auto_36860 - HOIST
      ?auto_36862 - SURFACE
      ?auto_36869 - PLACE
      ?auto_36865 - HOIST
      ?auto_36861 - SURFACE
      ?auto_36863 - SURFACE
      ?auto_36859 - PLACE
      ?auto_36858 - HOIST
      ?auto_36857 - SURFACE
      ?auto_36872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36866 ?auto_36868 ) ( IS-CRATE ?auto_36856 ) ( not ( = ?auto_36855 ?auto_36856 ) ) ( not ( = ?auto_36854 ?auto_36855 ) ) ( not ( = ?auto_36854 ?auto_36856 ) ) ( not ( = ?auto_36864 ?auto_36868 ) ) ( HOIST-AT ?auto_36871 ?auto_36864 ) ( not ( = ?auto_36866 ?auto_36871 ) ) ( SURFACE-AT ?auto_36856 ?auto_36864 ) ( ON ?auto_36856 ?auto_36867 ) ( CLEAR ?auto_36856 ) ( not ( = ?auto_36855 ?auto_36867 ) ) ( not ( = ?auto_36856 ?auto_36867 ) ) ( not ( = ?auto_36854 ?auto_36867 ) ) ( IS-CRATE ?auto_36855 ) ( not ( = ?auto_36870 ?auto_36868 ) ) ( not ( = ?auto_36864 ?auto_36870 ) ) ( HOIST-AT ?auto_36860 ?auto_36870 ) ( not ( = ?auto_36866 ?auto_36860 ) ) ( not ( = ?auto_36871 ?auto_36860 ) ) ( AVAILABLE ?auto_36860 ) ( SURFACE-AT ?auto_36855 ?auto_36870 ) ( ON ?auto_36855 ?auto_36862 ) ( CLEAR ?auto_36855 ) ( not ( = ?auto_36855 ?auto_36862 ) ) ( not ( = ?auto_36856 ?auto_36862 ) ) ( not ( = ?auto_36854 ?auto_36862 ) ) ( not ( = ?auto_36867 ?auto_36862 ) ) ( IS-CRATE ?auto_36854 ) ( not ( = ?auto_36853 ?auto_36854 ) ) ( not ( = ?auto_36855 ?auto_36853 ) ) ( not ( = ?auto_36856 ?auto_36853 ) ) ( not ( = ?auto_36867 ?auto_36853 ) ) ( not ( = ?auto_36862 ?auto_36853 ) ) ( not ( = ?auto_36869 ?auto_36868 ) ) ( not ( = ?auto_36864 ?auto_36869 ) ) ( not ( = ?auto_36870 ?auto_36869 ) ) ( HOIST-AT ?auto_36865 ?auto_36869 ) ( not ( = ?auto_36866 ?auto_36865 ) ) ( not ( = ?auto_36871 ?auto_36865 ) ) ( not ( = ?auto_36860 ?auto_36865 ) ) ( AVAILABLE ?auto_36865 ) ( SURFACE-AT ?auto_36854 ?auto_36869 ) ( ON ?auto_36854 ?auto_36861 ) ( CLEAR ?auto_36854 ) ( not ( = ?auto_36855 ?auto_36861 ) ) ( not ( = ?auto_36856 ?auto_36861 ) ) ( not ( = ?auto_36854 ?auto_36861 ) ) ( not ( = ?auto_36867 ?auto_36861 ) ) ( not ( = ?auto_36862 ?auto_36861 ) ) ( not ( = ?auto_36853 ?auto_36861 ) ) ( IS-CRATE ?auto_36853 ) ( not ( = ?auto_36852 ?auto_36853 ) ) ( not ( = ?auto_36855 ?auto_36852 ) ) ( not ( = ?auto_36856 ?auto_36852 ) ) ( not ( = ?auto_36854 ?auto_36852 ) ) ( not ( = ?auto_36867 ?auto_36852 ) ) ( not ( = ?auto_36862 ?auto_36852 ) ) ( not ( = ?auto_36861 ?auto_36852 ) ) ( AVAILABLE ?auto_36871 ) ( SURFACE-AT ?auto_36853 ?auto_36864 ) ( ON ?auto_36853 ?auto_36863 ) ( CLEAR ?auto_36853 ) ( not ( = ?auto_36855 ?auto_36863 ) ) ( not ( = ?auto_36856 ?auto_36863 ) ) ( not ( = ?auto_36854 ?auto_36863 ) ) ( not ( = ?auto_36867 ?auto_36863 ) ) ( not ( = ?auto_36862 ?auto_36863 ) ) ( not ( = ?auto_36853 ?auto_36863 ) ) ( not ( = ?auto_36861 ?auto_36863 ) ) ( not ( = ?auto_36852 ?auto_36863 ) ) ( SURFACE-AT ?auto_36851 ?auto_36868 ) ( CLEAR ?auto_36851 ) ( IS-CRATE ?auto_36852 ) ( not ( = ?auto_36851 ?auto_36852 ) ) ( not ( = ?auto_36855 ?auto_36851 ) ) ( not ( = ?auto_36856 ?auto_36851 ) ) ( not ( = ?auto_36854 ?auto_36851 ) ) ( not ( = ?auto_36867 ?auto_36851 ) ) ( not ( = ?auto_36862 ?auto_36851 ) ) ( not ( = ?auto_36853 ?auto_36851 ) ) ( not ( = ?auto_36861 ?auto_36851 ) ) ( not ( = ?auto_36863 ?auto_36851 ) ) ( AVAILABLE ?auto_36866 ) ( not ( = ?auto_36859 ?auto_36868 ) ) ( not ( = ?auto_36864 ?auto_36859 ) ) ( not ( = ?auto_36870 ?auto_36859 ) ) ( not ( = ?auto_36869 ?auto_36859 ) ) ( HOIST-AT ?auto_36858 ?auto_36859 ) ( not ( = ?auto_36866 ?auto_36858 ) ) ( not ( = ?auto_36871 ?auto_36858 ) ) ( not ( = ?auto_36860 ?auto_36858 ) ) ( not ( = ?auto_36865 ?auto_36858 ) ) ( AVAILABLE ?auto_36858 ) ( SURFACE-AT ?auto_36852 ?auto_36859 ) ( ON ?auto_36852 ?auto_36857 ) ( CLEAR ?auto_36852 ) ( not ( = ?auto_36855 ?auto_36857 ) ) ( not ( = ?auto_36856 ?auto_36857 ) ) ( not ( = ?auto_36854 ?auto_36857 ) ) ( not ( = ?auto_36867 ?auto_36857 ) ) ( not ( = ?auto_36862 ?auto_36857 ) ) ( not ( = ?auto_36853 ?auto_36857 ) ) ( not ( = ?auto_36861 ?auto_36857 ) ) ( not ( = ?auto_36852 ?auto_36857 ) ) ( not ( = ?auto_36863 ?auto_36857 ) ) ( not ( = ?auto_36851 ?auto_36857 ) ) ( TRUCK-AT ?auto_36872 ?auto_36868 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_36854 ?auto_36855 ?auto_36856 )
      ( MAKE-5CRATE-VERIFY ?auto_36851 ?auto_36852 ?auto_36853 ?auto_36854 ?auto_36855 ?auto_36856 ) )
  )

)

