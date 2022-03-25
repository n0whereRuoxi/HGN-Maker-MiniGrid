( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4446 - OBJ
      ?auto_4445 - LOCATION
    )
    :vars
    (
      ?auto_4447 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4447 ?auto_4445 ) ( IN-TRUCK ?auto_4446 ?auto_4447 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4446 ?auto_4447 ?auto_4445 )
      ( DELIVER-1PKG-VERIFY ?auto_4446 ?auto_4445 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4458 - OBJ
      ?auto_4457 - LOCATION
    )
    :vars
    (
      ?auto_4459 - TRUCK
      ?auto_4460 - LOCATION
      ?auto_4461 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4458 ?auto_4459 ) ( TRUCK-AT ?auto_4459 ?auto_4460 ) ( IN-CITY ?auto_4460 ?auto_4461 ) ( IN-CITY ?auto_4457 ?auto_4461 ) ( not ( = ?auto_4457 ?auto_4460 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4459 ?auto_4460 ?auto_4457 ?auto_4461 )
      ( DELIVER-1PKG ?auto_4458 ?auto_4457 )
      ( DELIVER-1PKG-VERIFY ?auto_4458 ?auto_4457 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4476 - OBJ
      ?auto_4475 - LOCATION
    )
    :vars
    (
      ?auto_4479 - TRUCK
      ?auto_4477 - LOCATION
      ?auto_4478 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4479 ?auto_4477 ) ( IN-CITY ?auto_4477 ?auto_4478 ) ( IN-CITY ?auto_4475 ?auto_4478 ) ( not ( = ?auto_4475 ?auto_4477 ) ) ( OBJ-AT ?auto_4476 ?auto_4477 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4476 ?auto_4479 ?auto_4477 )
      ( DELIVER-1PKG ?auto_4476 ?auto_4475 )
      ( DELIVER-1PKG-VERIFY ?auto_4476 ?auto_4475 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4494 - OBJ
      ?auto_4493 - LOCATION
    )
    :vars
    (
      ?auto_4495 - LOCATION
      ?auto_4497 - CITY
      ?auto_4496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4495 ?auto_4497 ) ( IN-CITY ?auto_4493 ?auto_4497 ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( OBJ-AT ?auto_4494 ?auto_4495 ) ( TRUCK-AT ?auto_4496 ?auto_4493 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4496 ?auto_4493 ?auto_4495 ?auto_4497 )
      ( DELIVER-1PKG ?auto_4494 ?auto_4493 )
      ( DELIVER-1PKG-VERIFY ?auto_4494 ?auto_4493 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4551 - OBJ
      ?auto_4550 - LOCATION
    )
    :vars
    (
      ?auto_4552 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4552 ?auto_4550 ) ( IN-TRUCK ?auto_4551 ?auto_4552 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4551 ?auto_4552 ?auto_4550 )
      ( DELIVER-1PKG-VERIFY ?auto_4551 ?auto_4550 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4554 - OBJ
      ?auto_4555 - OBJ
      ?auto_4553 - LOCATION
    )
    :vars
    (
      ?auto_4556 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4556 ?auto_4553 ) ( IN-TRUCK ?auto_4555 ?auto_4556 ) ( OBJ-AT ?auto_4554 ?auto_4553 ) ( not ( = ?auto_4554 ?auto_4555 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4555 ?auto_4553 )
      ( DELIVER-2PKG-VERIFY ?auto_4554 ?auto_4555 ?auto_4553 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4558 - OBJ
      ?auto_4559 - OBJ
      ?auto_4557 - LOCATION
    )
    :vars
    (
      ?auto_4560 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4560 ?auto_4557 ) ( IN-TRUCK ?auto_4558 ?auto_4560 ) ( OBJ-AT ?auto_4559 ?auto_4557 ) ( not ( = ?auto_4558 ?auto_4559 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4558 ?auto_4557 )
      ( DELIVER-2PKG-VERIFY ?auto_4558 ?auto_4559 ?auto_4557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4566 - OBJ
      ?auto_4567 - OBJ
      ?auto_4568 - OBJ
      ?auto_4565 - LOCATION
    )
    :vars
    (
      ?auto_4569 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4569 ?auto_4565 ) ( IN-TRUCK ?auto_4568 ?auto_4569 ) ( OBJ-AT ?auto_4566 ?auto_4565 ) ( OBJ-AT ?auto_4567 ?auto_4565 ) ( not ( = ?auto_4566 ?auto_4567 ) ) ( not ( = ?auto_4566 ?auto_4568 ) ) ( not ( = ?auto_4567 ?auto_4568 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4568 ?auto_4565 )
      ( DELIVER-3PKG-VERIFY ?auto_4566 ?auto_4567 ?auto_4568 ?auto_4565 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4571 - OBJ
      ?auto_4572 - OBJ
      ?auto_4573 - OBJ
      ?auto_4570 - LOCATION
    )
    :vars
    (
      ?auto_4574 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4574 ?auto_4570 ) ( IN-TRUCK ?auto_4572 ?auto_4574 ) ( OBJ-AT ?auto_4571 ?auto_4570 ) ( OBJ-AT ?auto_4573 ?auto_4570 ) ( not ( = ?auto_4571 ?auto_4572 ) ) ( not ( = ?auto_4571 ?auto_4573 ) ) ( not ( = ?auto_4572 ?auto_4573 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4572 ?auto_4570 )
      ( DELIVER-3PKG-VERIFY ?auto_4571 ?auto_4572 ?auto_4573 ?auto_4570 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4581 - OBJ
      ?auto_4582 - OBJ
      ?auto_4583 - OBJ
      ?auto_4580 - LOCATION
    )
    :vars
    (
      ?auto_4584 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4584 ?auto_4580 ) ( IN-TRUCK ?auto_4581 ?auto_4584 ) ( OBJ-AT ?auto_4582 ?auto_4580 ) ( OBJ-AT ?auto_4583 ?auto_4580 ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( not ( = ?auto_4581 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4583 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4581 ?auto_4580 )
      ( DELIVER-3PKG-VERIFY ?auto_4581 ?auto_4582 ?auto_4583 ?auto_4580 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4601 - OBJ
      ?auto_4600 - LOCATION
    )
    :vars
    (
      ?auto_4602 - TRUCK
      ?auto_4603 - LOCATION
      ?auto_4604 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4601 ?auto_4602 ) ( TRUCK-AT ?auto_4602 ?auto_4603 ) ( IN-CITY ?auto_4603 ?auto_4604 ) ( IN-CITY ?auto_4600 ?auto_4604 ) ( not ( = ?auto_4600 ?auto_4603 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4602 ?auto_4603 ?auto_4600 ?auto_4604 )
      ( DELIVER-1PKG ?auto_4601 ?auto_4600 )
      ( DELIVER-1PKG-VERIFY ?auto_4601 ?auto_4600 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4606 - OBJ
      ?auto_4607 - OBJ
      ?auto_4605 - LOCATION
    )
    :vars
    (
      ?auto_4608 - TRUCK
      ?auto_4610 - LOCATION
      ?auto_4609 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4607 ?auto_4608 ) ( TRUCK-AT ?auto_4608 ?auto_4610 ) ( IN-CITY ?auto_4610 ?auto_4609 ) ( IN-CITY ?auto_4605 ?auto_4609 ) ( not ( = ?auto_4605 ?auto_4610 ) ) ( OBJ-AT ?auto_4606 ?auto_4605 ) ( not ( = ?auto_4606 ?auto_4607 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4607 ?auto_4605 )
      ( DELIVER-2PKG-VERIFY ?auto_4606 ?auto_4607 ?auto_4605 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4612 - OBJ
      ?auto_4613 - OBJ
      ?auto_4611 - LOCATION
    )
    :vars
    (
      ?auto_4615 - TRUCK
      ?auto_4616 - LOCATION
      ?auto_4614 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4612 ?auto_4615 ) ( TRUCK-AT ?auto_4615 ?auto_4616 ) ( IN-CITY ?auto_4616 ?auto_4614 ) ( IN-CITY ?auto_4611 ?auto_4614 ) ( not ( = ?auto_4611 ?auto_4616 ) ) ( OBJ-AT ?auto_4613 ?auto_4611 ) ( not ( = ?auto_4613 ?auto_4612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4613 ?auto_4612 ?auto_4611 )
      ( DELIVER-2PKG-VERIFY ?auto_4612 ?auto_4613 ?auto_4611 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4625 - OBJ
      ?auto_4626 - OBJ
      ?auto_4627 - OBJ
      ?auto_4624 - LOCATION
    )
    :vars
    (
      ?auto_4629 - TRUCK
      ?auto_4630 - LOCATION
      ?auto_4628 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4627 ?auto_4629 ) ( TRUCK-AT ?auto_4629 ?auto_4630 ) ( IN-CITY ?auto_4630 ?auto_4628 ) ( IN-CITY ?auto_4624 ?auto_4628 ) ( not ( = ?auto_4624 ?auto_4630 ) ) ( OBJ-AT ?auto_4626 ?auto_4624 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( OBJ-AT ?auto_4625 ?auto_4624 ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4626 ?auto_4627 ?auto_4624 )
      ( DELIVER-3PKG-VERIFY ?auto_4625 ?auto_4626 ?auto_4627 ?auto_4624 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4632 - OBJ
      ?auto_4633 - OBJ
      ?auto_4634 - OBJ
      ?auto_4631 - LOCATION
    )
    :vars
    (
      ?auto_4636 - TRUCK
      ?auto_4637 - LOCATION
      ?auto_4635 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4633 ?auto_4636 ) ( TRUCK-AT ?auto_4636 ?auto_4637 ) ( IN-CITY ?auto_4637 ?auto_4635 ) ( IN-CITY ?auto_4631 ?auto_4635 ) ( not ( = ?auto_4631 ?auto_4637 ) ) ( OBJ-AT ?auto_4632 ?auto_4631 ) ( not ( = ?auto_4632 ?auto_4633 ) ) ( OBJ-AT ?auto_4634 ?auto_4631 ) ( not ( = ?auto_4632 ?auto_4634 ) ) ( not ( = ?auto_4633 ?auto_4634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4632 ?auto_4633 ?auto_4631 )
      ( DELIVER-3PKG-VERIFY ?auto_4632 ?auto_4633 ?auto_4634 ?auto_4631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4646 - OBJ
      ?auto_4647 - OBJ
      ?auto_4648 - OBJ
      ?auto_4645 - LOCATION
    )
    :vars
    (
      ?auto_4650 - TRUCK
      ?auto_4651 - LOCATION
      ?auto_4649 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4646 ?auto_4650 ) ( TRUCK-AT ?auto_4650 ?auto_4651 ) ( IN-CITY ?auto_4651 ?auto_4649 ) ( IN-CITY ?auto_4645 ?auto_4649 ) ( not ( = ?auto_4645 ?auto_4651 ) ) ( OBJ-AT ?auto_4648 ?auto_4645 ) ( not ( = ?auto_4648 ?auto_4646 ) ) ( OBJ-AT ?auto_4647 ?auto_4645 ) ( not ( = ?auto_4646 ?auto_4647 ) ) ( not ( = ?auto_4647 ?auto_4648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4648 ?auto_4646 ?auto_4645 )
      ( DELIVER-3PKG-VERIFY ?auto_4646 ?auto_4647 ?auto_4648 ?auto_4645 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4675 - OBJ
      ?auto_4674 - LOCATION
    )
    :vars
    (
      ?auto_4678 - TRUCK
      ?auto_4679 - LOCATION
      ?auto_4677 - CITY
      ?auto_4676 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4678 ?auto_4679 ) ( IN-CITY ?auto_4679 ?auto_4677 ) ( IN-CITY ?auto_4674 ?auto_4677 ) ( not ( = ?auto_4674 ?auto_4679 ) ) ( OBJ-AT ?auto_4676 ?auto_4674 ) ( not ( = ?auto_4676 ?auto_4675 ) ) ( OBJ-AT ?auto_4675 ?auto_4679 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4675 ?auto_4678 ?auto_4679 )
      ( DELIVER-2PKG ?auto_4676 ?auto_4675 ?auto_4674 )
      ( DELIVER-1PKG-VERIFY ?auto_4675 ?auto_4674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4681 - OBJ
      ?auto_4682 - OBJ
      ?auto_4680 - LOCATION
    )
    :vars
    (
      ?auto_4683 - TRUCK
      ?auto_4685 - LOCATION
      ?auto_4684 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4683 ?auto_4685 ) ( IN-CITY ?auto_4685 ?auto_4684 ) ( IN-CITY ?auto_4680 ?auto_4684 ) ( not ( = ?auto_4680 ?auto_4685 ) ) ( OBJ-AT ?auto_4681 ?auto_4680 ) ( not ( = ?auto_4681 ?auto_4682 ) ) ( OBJ-AT ?auto_4682 ?auto_4685 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4682 ?auto_4680 )
      ( DELIVER-2PKG-VERIFY ?auto_4681 ?auto_4682 ?auto_4680 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4687 - OBJ
      ?auto_4688 - OBJ
      ?auto_4686 - LOCATION
    )
    :vars
    (
      ?auto_4691 - TRUCK
      ?auto_4689 - LOCATION
      ?auto_4690 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4691 ?auto_4689 ) ( IN-CITY ?auto_4689 ?auto_4690 ) ( IN-CITY ?auto_4686 ?auto_4690 ) ( not ( = ?auto_4686 ?auto_4689 ) ) ( OBJ-AT ?auto_4688 ?auto_4686 ) ( not ( = ?auto_4688 ?auto_4687 ) ) ( OBJ-AT ?auto_4687 ?auto_4689 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4688 ?auto_4687 ?auto_4686 )
      ( DELIVER-2PKG-VERIFY ?auto_4687 ?auto_4688 ?auto_4686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4700 - OBJ
      ?auto_4701 - OBJ
      ?auto_4702 - OBJ
      ?auto_4699 - LOCATION
    )
    :vars
    (
      ?auto_4705 - TRUCK
      ?auto_4703 - LOCATION
      ?auto_4704 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4705 ?auto_4703 ) ( IN-CITY ?auto_4703 ?auto_4704 ) ( IN-CITY ?auto_4699 ?auto_4704 ) ( not ( = ?auto_4699 ?auto_4703 ) ) ( OBJ-AT ?auto_4700 ?auto_4699 ) ( not ( = ?auto_4700 ?auto_4702 ) ) ( OBJ-AT ?auto_4702 ?auto_4703 ) ( OBJ-AT ?auto_4701 ?auto_4699 ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4701 ?auto_4702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4700 ?auto_4702 ?auto_4699 )
      ( DELIVER-3PKG-VERIFY ?auto_4700 ?auto_4701 ?auto_4702 ?auto_4699 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4707 - OBJ
      ?auto_4708 - OBJ
      ?auto_4709 - OBJ
      ?auto_4706 - LOCATION
    )
    :vars
    (
      ?auto_4712 - TRUCK
      ?auto_4710 - LOCATION
      ?auto_4711 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4712 ?auto_4710 ) ( IN-CITY ?auto_4710 ?auto_4711 ) ( IN-CITY ?auto_4706 ?auto_4711 ) ( not ( = ?auto_4706 ?auto_4710 ) ) ( OBJ-AT ?auto_4707 ?auto_4706 ) ( not ( = ?auto_4707 ?auto_4708 ) ) ( OBJ-AT ?auto_4708 ?auto_4710 ) ( OBJ-AT ?auto_4709 ?auto_4706 ) ( not ( = ?auto_4707 ?auto_4709 ) ) ( not ( = ?auto_4708 ?auto_4709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4707 ?auto_4708 ?auto_4706 )
      ( DELIVER-3PKG-VERIFY ?auto_4707 ?auto_4708 ?auto_4709 ?auto_4706 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4721 - OBJ
      ?auto_4722 - OBJ
      ?auto_4723 - OBJ
      ?auto_4720 - LOCATION
    )
    :vars
    (
      ?auto_4726 - TRUCK
      ?auto_4724 - LOCATION
      ?auto_4725 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4726 ?auto_4724 ) ( IN-CITY ?auto_4724 ?auto_4725 ) ( IN-CITY ?auto_4720 ?auto_4725 ) ( not ( = ?auto_4720 ?auto_4724 ) ) ( OBJ-AT ?auto_4722 ?auto_4720 ) ( not ( = ?auto_4722 ?auto_4721 ) ) ( OBJ-AT ?auto_4721 ?auto_4724 ) ( OBJ-AT ?auto_4723 ?auto_4720 ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4722 ?auto_4721 ?auto_4720 )
      ( DELIVER-3PKG-VERIFY ?auto_4721 ?auto_4722 ?auto_4723 ?auto_4720 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4750 - OBJ
      ?auto_4749 - LOCATION
    )
    :vars
    (
      ?auto_4752 - LOCATION
      ?auto_4753 - CITY
      ?auto_4751 - OBJ
      ?auto_4754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4752 ?auto_4753 ) ( IN-CITY ?auto_4749 ?auto_4753 ) ( not ( = ?auto_4749 ?auto_4752 ) ) ( OBJ-AT ?auto_4751 ?auto_4749 ) ( not ( = ?auto_4751 ?auto_4750 ) ) ( OBJ-AT ?auto_4750 ?auto_4752 ) ( TRUCK-AT ?auto_4754 ?auto_4749 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4754 ?auto_4749 ?auto_4752 ?auto_4753 )
      ( DELIVER-2PKG ?auto_4751 ?auto_4750 ?auto_4749 )
      ( DELIVER-1PKG-VERIFY ?auto_4750 ?auto_4749 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4756 - OBJ
      ?auto_4757 - OBJ
      ?auto_4755 - LOCATION
    )
    :vars
    (
      ?auto_4760 - LOCATION
      ?auto_4758 - CITY
      ?auto_4759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4760 ?auto_4758 ) ( IN-CITY ?auto_4755 ?auto_4758 ) ( not ( = ?auto_4755 ?auto_4760 ) ) ( OBJ-AT ?auto_4756 ?auto_4755 ) ( not ( = ?auto_4756 ?auto_4757 ) ) ( OBJ-AT ?auto_4757 ?auto_4760 ) ( TRUCK-AT ?auto_4759 ?auto_4755 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4757 ?auto_4755 )
      ( DELIVER-2PKG-VERIFY ?auto_4756 ?auto_4757 ?auto_4755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4762 - OBJ
      ?auto_4763 - OBJ
      ?auto_4761 - LOCATION
    )
    :vars
    (
      ?auto_4766 - LOCATION
      ?auto_4764 - CITY
      ?auto_4765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4766 ?auto_4764 ) ( IN-CITY ?auto_4761 ?auto_4764 ) ( not ( = ?auto_4761 ?auto_4766 ) ) ( OBJ-AT ?auto_4763 ?auto_4761 ) ( not ( = ?auto_4763 ?auto_4762 ) ) ( OBJ-AT ?auto_4762 ?auto_4766 ) ( TRUCK-AT ?auto_4765 ?auto_4761 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4763 ?auto_4762 ?auto_4761 )
      ( DELIVER-2PKG-VERIFY ?auto_4762 ?auto_4763 ?auto_4761 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4775 - OBJ
      ?auto_4776 - OBJ
      ?auto_4777 - OBJ
      ?auto_4774 - LOCATION
    )
    :vars
    (
      ?auto_4780 - LOCATION
      ?auto_4778 - CITY
      ?auto_4779 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4780 ?auto_4778 ) ( IN-CITY ?auto_4774 ?auto_4778 ) ( not ( = ?auto_4774 ?auto_4780 ) ) ( OBJ-AT ?auto_4775 ?auto_4774 ) ( not ( = ?auto_4775 ?auto_4777 ) ) ( OBJ-AT ?auto_4777 ?auto_4780 ) ( TRUCK-AT ?auto_4779 ?auto_4774 ) ( OBJ-AT ?auto_4776 ?auto_4774 ) ( not ( = ?auto_4775 ?auto_4776 ) ) ( not ( = ?auto_4776 ?auto_4777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4775 ?auto_4777 ?auto_4774 )
      ( DELIVER-3PKG-VERIFY ?auto_4775 ?auto_4776 ?auto_4777 ?auto_4774 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4782 - OBJ
      ?auto_4783 - OBJ
      ?auto_4784 - OBJ
      ?auto_4781 - LOCATION
    )
    :vars
    (
      ?auto_4787 - LOCATION
      ?auto_4785 - CITY
      ?auto_4786 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4787 ?auto_4785 ) ( IN-CITY ?auto_4781 ?auto_4785 ) ( not ( = ?auto_4781 ?auto_4787 ) ) ( OBJ-AT ?auto_4784 ?auto_4781 ) ( not ( = ?auto_4784 ?auto_4783 ) ) ( OBJ-AT ?auto_4783 ?auto_4787 ) ( TRUCK-AT ?auto_4786 ?auto_4781 ) ( OBJ-AT ?auto_4782 ?auto_4781 ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4784 ?auto_4783 ?auto_4781 )
      ( DELIVER-3PKG-VERIFY ?auto_4782 ?auto_4783 ?auto_4784 ?auto_4781 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4796 - OBJ
      ?auto_4797 - OBJ
      ?auto_4798 - OBJ
      ?auto_4795 - LOCATION
    )
    :vars
    (
      ?auto_4801 - LOCATION
      ?auto_4799 - CITY
      ?auto_4800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4801 ?auto_4799 ) ( IN-CITY ?auto_4795 ?auto_4799 ) ( not ( = ?auto_4795 ?auto_4801 ) ) ( OBJ-AT ?auto_4798 ?auto_4795 ) ( not ( = ?auto_4798 ?auto_4796 ) ) ( OBJ-AT ?auto_4796 ?auto_4801 ) ( TRUCK-AT ?auto_4800 ?auto_4795 ) ( OBJ-AT ?auto_4797 ?auto_4795 ) ( not ( = ?auto_4796 ?auto_4797 ) ) ( not ( = ?auto_4797 ?auto_4798 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4798 ?auto_4796 ?auto_4795 )
      ( DELIVER-3PKG-VERIFY ?auto_4796 ?auto_4797 ?auto_4798 ?auto_4795 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4825 - OBJ
      ?auto_4824 - LOCATION
    )
    :vars
    (
      ?auto_4828 - LOCATION
      ?auto_4826 - CITY
      ?auto_4829 - OBJ
      ?auto_4827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4828 ?auto_4826 ) ( IN-CITY ?auto_4824 ?auto_4826 ) ( not ( = ?auto_4824 ?auto_4828 ) ) ( not ( = ?auto_4829 ?auto_4825 ) ) ( OBJ-AT ?auto_4825 ?auto_4828 ) ( TRUCK-AT ?auto_4827 ?auto_4824 ) ( IN-TRUCK ?auto_4829 ?auto_4827 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4829 ?auto_4824 )
      ( DELIVER-2PKG ?auto_4829 ?auto_4825 ?auto_4824 )
      ( DELIVER-1PKG-VERIFY ?auto_4825 ?auto_4824 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4831 - OBJ
      ?auto_4832 - OBJ
      ?auto_4830 - LOCATION
    )
    :vars
    (
      ?auto_4833 - LOCATION
      ?auto_4835 - CITY
      ?auto_4834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4833 ?auto_4835 ) ( IN-CITY ?auto_4830 ?auto_4835 ) ( not ( = ?auto_4830 ?auto_4833 ) ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( OBJ-AT ?auto_4832 ?auto_4833 ) ( TRUCK-AT ?auto_4834 ?auto_4830 ) ( IN-TRUCK ?auto_4831 ?auto_4834 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4832 ?auto_4830 )
      ( DELIVER-2PKG-VERIFY ?auto_4831 ?auto_4832 ?auto_4830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4837 - OBJ
      ?auto_4838 - OBJ
      ?auto_4836 - LOCATION
    )
    :vars
    (
      ?auto_4841 - LOCATION
      ?auto_4840 - CITY
      ?auto_4839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4841 ?auto_4840 ) ( IN-CITY ?auto_4836 ?auto_4840 ) ( not ( = ?auto_4836 ?auto_4841 ) ) ( not ( = ?auto_4838 ?auto_4837 ) ) ( OBJ-AT ?auto_4837 ?auto_4841 ) ( TRUCK-AT ?auto_4839 ?auto_4836 ) ( IN-TRUCK ?auto_4838 ?auto_4839 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4838 ?auto_4837 ?auto_4836 )
      ( DELIVER-2PKG-VERIFY ?auto_4837 ?auto_4838 ?auto_4836 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4900 - OBJ
      ?auto_4899 - LOCATION
    )
    :vars
    (
      ?auto_4904 - LOCATION
      ?auto_4903 - CITY
      ?auto_4901 - OBJ
      ?auto_4902 - TRUCK
      ?auto_4905 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4904 ?auto_4903 ) ( IN-CITY ?auto_4899 ?auto_4903 ) ( not ( = ?auto_4899 ?auto_4904 ) ) ( not ( = ?auto_4901 ?auto_4900 ) ) ( OBJ-AT ?auto_4900 ?auto_4904 ) ( IN-TRUCK ?auto_4901 ?auto_4902 ) ( TRUCK-AT ?auto_4902 ?auto_4905 ) ( IN-CITY ?auto_4905 ?auto_4903 ) ( not ( = ?auto_4899 ?auto_4905 ) ) ( not ( = ?auto_4904 ?auto_4905 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4902 ?auto_4905 ?auto_4899 ?auto_4903 )
      ( DELIVER-2PKG ?auto_4901 ?auto_4900 ?auto_4899 )
      ( DELIVER-1PKG-VERIFY ?auto_4900 ?auto_4899 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4907 - OBJ
      ?auto_4908 - OBJ
      ?auto_4906 - LOCATION
    )
    :vars
    (
      ?auto_4911 - LOCATION
      ?auto_4910 - CITY
      ?auto_4909 - TRUCK
      ?auto_4912 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4911 ?auto_4910 ) ( IN-CITY ?auto_4906 ?auto_4910 ) ( not ( = ?auto_4906 ?auto_4911 ) ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( OBJ-AT ?auto_4908 ?auto_4911 ) ( IN-TRUCK ?auto_4907 ?auto_4909 ) ( TRUCK-AT ?auto_4909 ?auto_4912 ) ( IN-CITY ?auto_4912 ?auto_4910 ) ( not ( = ?auto_4906 ?auto_4912 ) ) ( not ( = ?auto_4911 ?auto_4912 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4908 ?auto_4906 )
      ( DELIVER-2PKG-VERIFY ?auto_4907 ?auto_4908 ?auto_4906 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4914 - OBJ
      ?auto_4915 - OBJ
      ?auto_4913 - LOCATION
    )
    :vars
    (
      ?auto_4918 - LOCATION
      ?auto_4919 - CITY
      ?auto_4917 - TRUCK
      ?auto_4916 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4918 ?auto_4919 ) ( IN-CITY ?auto_4913 ?auto_4919 ) ( not ( = ?auto_4913 ?auto_4918 ) ) ( not ( = ?auto_4915 ?auto_4914 ) ) ( OBJ-AT ?auto_4914 ?auto_4918 ) ( IN-TRUCK ?auto_4915 ?auto_4917 ) ( TRUCK-AT ?auto_4917 ?auto_4916 ) ( IN-CITY ?auto_4916 ?auto_4919 ) ( not ( = ?auto_4913 ?auto_4916 ) ) ( not ( = ?auto_4918 ?auto_4916 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4915 ?auto_4914 ?auto_4913 )
      ( DELIVER-2PKG-VERIFY ?auto_4914 ?auto_4915 ?auto_4913 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4986 - OBJ
      ?auto_4985 - LOCATION
    )
    :vars
    (
      ?auto_4990 - LOCATION
      ?auto_4991 - CITY
      ?auto_4988 - OBJ
      ?auto_4989 - TRUCK
      ?auto_4987 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4990 ?auto_4991 ) ( IN-CITY ?auto_4985 ?auto_4991 ) ( not ( = ?auto_4985 ?auto_4990 ) ) ( not ( = ?auto_4988 ?auto_4986 ) ) ( OBJ-AT ?auto_4986 ?auto_4990 ) ( TRUCK-AT ?auto_4989 ?auto_4987 ) ( IN-CITY ?auto_4987 ?auto_4991 ) ( not ( = ?auto_4985 ?auto_4987 ) ) ( not ( = ?auto_4990 ?auto_4987 ) ) ( OBJ-AT ?auto_4988 ?auto_4987 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4988 ?auto_4989 ?auto_4987 )
      ( DELIVER-2PKG ?auto_4988 ?auto_4986 ?auto_4985 )
      ( DELIVER-1PKG-VERIFY ?auto_4986 ?auto_4985 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4993 - OBJ
      ?auto_4994 - OBJ
      ?auto_4992 - LOCATION
    )
    :vars
    (
      ?auto_4996 - LOCATION
      ?auto_4997 - CITY
      ?auto_4998 - TRUCK
      ?auto_4995 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4996 ?auto_4997 ) ( IN-CITY ?auto_4992 ?auto_4997 ) ( not ( = ?auto_4992 ?auto_4996 ) ) ( not ( = ?auto_4993 ?auto_4994 ) ) ( OBJ-AT ?auto_4994 ?auto_4996 ) ( TRUCK-AT ?auto_4998 ?auto_4995 ) ( IN-CITY ?auto_4995 ?auto_4997 ) ( not ( = ?auto_4992 ?auto_4995 ) ) ( not ( = ?auto_4996 ?auto_4995 ) ) ( OBJ-AT ?auto_4993 ?auto_4995 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4994 ?auto_4992 )
      ( DELIVER-2PKG-VERIFY ?auto_4993 ?auto_4994 ?auto_4992 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5000 - OBJ
      ?auto_5001 - OBJ
      ?auto_4999 - LOCATION
    )
    :vars
    (
      ?auto_5003 - LOCATION
      ?auto_5005 - CITY
      ?auto_5002 - TRUCK
      ?auto_5004 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5003 ?auto_5005 ) ( IN-CITY ?auto_4999 ?auto_5005 ) ( not ( = ?auto_4999 ?auto_5003 ) ) ( not ( = ?auto_5001 ?auto_5000 ) ) ( OBJ-AT ?auto_5000 ?auto_5003 ) ( TRUCK-AT ?auto_5002 ?auto_5004 ) ( IN-CITY ?auto_5004 ?auto_5005 ) ( not ( = ?auto_4999 ?auto_5004 ) ) ( not ( = ?auto_5003 ?auto_5004 ) ) ( OBJ-AT ?auto_5001 ?auto_5004 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5001 ?auto_5000 ?auto_4999 )
      ( DELIVER-2PKG-VERIFY ?auto_5000 ?auto_5001 ?auto_4999 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5072 - OBJ
      ?auto_5071 - LOCATION
    )
    :vars
    (
      ?auto_5074 - LOCATION
      ?auto_5076 - CITY
      ?auto_5077 - OBJ
      ?auto_5075 - LOCATION
      ?auto_5073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5074 ?auto_5076 ) ( IN-CITY ?auto_5071 ?auto_5076 ) ( not ( = ?auto_5071 ?auto_5074 ) ) ( not ( = ?auto_5077 ?auto_5072 ) ) ( OBJ-AT ?auto_5072 ?auto_5074 ) ( IN-CITY ?auto_5075 ?auto_5076 ) ( not ( = ?auto_5071 ?auto_5075 ) ) ( not ( = ?auto_5074 ?auto_5075 ) ) ( OBJ-AT ?auto_5077 ?auto_5075 ) ( TRUCK-AT ?auto_5073 ?auto_5071 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5073 ?auto_5071 ?auto_5075 ?auto_5076 )
      ( DELIVER-2PKG ?auto_5077 ?auto_5072 ?auto_5071 )
      ( DELIVER-1PKG-VERIFY ?auto_5072 ?auto_5071 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5079 - OBJ
      ?auto_5080 - OBJ
      ?auto_5078 - LOCATION
    )
    :vars
    (
      ?auto_5083 - LOCATION
      ?auto_5084 - CITY
      ?auto_5081 - LOCATION
      ?auto_5082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5083 ?auto_5084 ) ( IN-CITY ?auto_5078 ?auto_5084 ) ( not ( = ?auto_5078 ?auto_5083 ) ) ( not ( = ?auto_5079 ?auto_5080 ) ) ( OBJ-AT ?auto_5080 ?auto_5083 ) ( IN-CITY ?auto_5081 ?auto_5084 ) ( not ( = ?auto_5078 ?auto_5081 ) ) ( not ( = ?auto_5083 ?auto_5081 ) ) ( OBJ-AT ?auto_5079 ?auto_5081 ) ( TRUCK-AT ?auto_5082 ?auto_5078 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5080 ?auto_5078 )
      ( DELIVER-2PKG-VERIFY ?auto_5079 ?auto_5080 ?auto_5078 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5086 - OBJ
      ?auto_5087 - OBJ
      ?auto_5085 - LOCATION
    )
    :vars
    (
      ?auto_5091 - LOCATION
      ?auto_5089 - CITY
      ?auto_5088 - LOCATION
      ?auto_5090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5091 ?auto_5089 ) ( IN-CITY ?auto_5085 ?auto_5089 ) ( not ( = ?auto_5085 ?auto_5091 ) ) ( not ( = ?auto_5087 ?auto_5086 ) ) ( OBJ-AT ?auto_5086 ?auto_5091 ) ( IN-CITY ?auto_5088 ?auto_5089 ) ( not ( = ?auto_5085 ?auto_5088 ) ) ( not ( = ?auto_5091 ?auto_5088 ) ) ( OBJ-AT ?auto_5087 ?auto_5088 ) ( TRUCK-AT ?auto_5090 ?auto_5085 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5087 ?auto_5086 ?auto_5085 )
      ( DELIVER-2PKG-VERIFY ?auto_5086 ?auto_5087 ?auto_5085 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5251 - OBJ
      ?auto_5250 - LOCATION
    )
    :vars
    (
      ?auto_5252 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5252 ?auto_5250 ) ( IN-TRUCK ?auto_5251 ?auto_5252 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_5251 ?auto_5252 ?auto_5250 )
      ( DELIVER-1PKG-VERIFY ?auto_5251 ?auto_5250 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5254 - OBJ
      ?auto_5255 - OBJ
      ?auto_5253 - LOCATION
    )
    :vars
    (
      ?auto_5256 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5256 ?auto_5253 ) ( IN-TRUCK ?auto_5255 ?auto_5256 ) ( OBJ-AT ?auto_5254 ?auto_5253 ) ( not ( = ?auto_5254 ?auto_5255 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5255 ?auto_5253 )
      ( DELIVER-2PKG-VERIFY ?auto_5254 ?auto_5255 ?auto_5253 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5258 - OBJ
      ?auto_5259 - OBJ
      ?auto_5257 - LOCATION
    )
    :vars
    (
      ?auto_5260 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5260 ?auto_5257 ) ( IN-TRUCK ?auto_5259 ?auto_5260 ) ( OBJ-AT ?auto_5258 ?auto_5257 ) ( not ( = ?auto_5258 ?auto_5259 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5259 ?auto_5257 )
      ( DELIVER-2PKG-VERIFY ?auto_5258 ?auto_5259 ?auto_5257 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5262 - OBJ
      ?auto_5263 - OBJ
      ?auto_5261 - LOCATION
    )
    :vars
    (
      ?auto_5264 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5264 ?auto_5261 ) ( IN-TRUCK ?auto_5262 ?auto_5264 ) ( OBJ-AT ?auto_5263 ?auto_5261 ) ( not ( = ?auto_5262 ?auto_5263 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5262 ?auto_5261 )
      ( DELIVER-2PKG-VERIFY ?auto_5262 ?auto_5263 ?auto_5261 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5266 - OBJ
      ?auto_5267 - OBJ
      ?auto_5265 - LOCATION
    )
    :vars
    (
      ?auto_5268 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5268 ?auto_5265 ) ( IN-TRUCK ?auto_5266 ?auto_5268 ) ( OBJ-AT ?auto_5267 ?auto_5265 ) ( not ( = ?auto_5266 ?auto_5267 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5266 ?auto_5265 )
      ( DELIVER-2PKG-VERIFY ?auto_5266 ?auto_5267 ?auto_5265 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5274 - OBJ
      ?auto_5275 - OBJ
      ?auto_5276 - OBJ
      ?auto_5273 - LOCATION
    )
    :vars
    (
      ?auto_5277 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5277 ?auto_5273 ) ( IN-TRUCK ?auto_5276 ?auto_5277 ) ( OBJ-AT ?auto_5274 ?auto_5273 ) ( OBJ-AT ?auto_5275 ?auto_5273 ) ( not ( = ?auto_5274 ?auto_5275 ) ) ( not ( = ?auto_5274 ?auto_5276 ) ) ( not ( = ?auto_5275 ?auto_5276 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5276 ?auto_5273 )
      ( DELIVER-3PKG-VERIFY ?auto_5274 ?auto_5275 ?auto_5276 ?auto_5273 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5279 - OBJ
      ?auto_5280 - OBJ
      ?auto_5281 - OBJ
      ?auto_5278 - LOCATION
    )
    :vars
    (
      ?auto_5282 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5282 ?auto_5278 ) ( IN-TRUCK ?auto_5281 ?auto_5282 ) ( OBJ-AT ?auto_5279 ?auto_5278 ) ( OBJ-AT ?auto_5280 ?auto_5278 ) ( not ( = ?auto_5279 ?auto_5280 ) ) ( not ( = ?auto_5279 ?auto_5281 ) ) ( not ( = ?auto_5280 ?auto_5281 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5281 ?auto_5278 )
      ( DELIVER-3PKG-VERIFY ?auto_5279 ?auto_5280 ?auto_5281 ?auto_5278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5284 - OBJ
      ?auto_5285 - OBJ
      ?auto_5286 - OBJ
      ?auto_5283 - LOCATION
    )
    :vars
    (
      ?auto_5287 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5287 ?auto_5283 ) ( IN-TRUCK ?auto_5285 ?auto_5287 ) ( OBJ-AT ?auto_5284 ?auto_5283 ) ( OBJ-AT ?auto_5286 ?auto_5283 ) ( not ( = ?auto_5284 ?auto_5285 ) ) ( not ( = ?auto_5284 ?auto_5286 ) ) ( not ( = ?auto_5285 ?auto_5286 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5285 ?auto_5283 )
      ( DELIVER-3PKG-VERIFY ?auto_5284 ?auto_5285 ?auto_5286 ?auto_5283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5289 - OBJ
      ?auto_5290 - OBJ
      ?auto_5291 - OBJ
      ?auto_5288 - LOCATION
    )
    :vars
    (
      ?auto_5292 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5292 ?auto_5288 ) ( IN-TRUCK ?auto_5290 ?auto_5292 ) ( OBJ-AT ?auto_5289 ?auto_5288 ) ( OBJ-AT ?auto_5291 ?auto_5288 ) ( not ( = ?auto_5289 ?auto_5290 ) ) ( not ( = ?auto_5289 ?auto_5291 ) ) ( not ( = ?auto_5290 ?auto_5291 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5290 ?auto_5288 )
      ( DELIVER-3PKG-VERIFY ?auto_5289 ?auto_5290 ?auto_5291 ?auto_5288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5299 - OBJ
      ?auto_5300 - OBJ
      ?auto_5301 - OBJ
      ?auto_5298 - LOCATION
    )
    :vars
    (
      ?auto_5302 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5302 ?auto_5298 ) ( IN-TRUCK ?auto_5301 ?auto_5302 ) ( OBJ-AT ?auto_5299 ?auto_5298 ) ( OBJ-AT ?auto_5300 ?auto_5298 ) ( not ( = ?auto_5299 ?auto_5300 ) ) ( not ( = ?auto_5299 ?auto_5301 ) ) ( not ( = ?auto_5300 ?auto_5301 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5301 ?auto_5298 )
      ( DELIVER-3PKG-VERIFY ?auto_5299 ?auto_5300 ?auto_5301 ?auto_5298 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5304 - OBJ
      ?auto_5305 - OBJ
      ?auto_5306 - OBJ
      ?auto_5303 - LOCATION
    )
    :vars
    (
      ?auto_5307 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5307 ?auto_5303 ) ( IN-TRUCK ?auto_5306 ?auto_5307 ) ( OBJ-AT ?auto_5304 ?auto_5303 ) ( OBJ-AT ?auto_5305 ?auto_5303 ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5306 ) ) ( not ( = ?auto_5305 ?auto_5306 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5306 ?auto_5303 )
      ( DELIVER-3PKG-VERIFY ?auto_5304 ?auto_5305 ?auto_5306 ?auto_5303 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5309 - OBJ
      ?auto_5310 - OBJ
      ?auto_5311 - OBJ
      ?auto_5308 - LOCATION
    )
    :vars
    (
      ?auto_5312 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5312 ?auto_5308 ) ( IN-TRUCK ?auto_5310 ?auto_5312 ) ( OBJ-AT ?auto_5309 ?auto_5308 ) ( OBJ-AT ?auto_5311 ?auto_5308 ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( not ( = ?auto_5309 ?auto_5311 ) ) ( not ( = ?auto_5310 ?auto_5311 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5310 ?auto_5308 )
      ( DELIVER-3PKG-VERIFY ?auto_5309 ?auto_5310 ?auto_5311 ?auto_5308 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5314 - OBJ
      ?auto_5315 - OBJ
      ?auto_5316 - OBJ
      ?auto_5313 - LOCATION
    )
    :vars
    (
      ?auto_5317 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5317 ?auto_5313 ) ( IN-TRUCK ?auto_5315 ?auto_5317 ) ( OBJ-AT ?auto_5314 ?auto_5313 ) ( OBJ-AT ?auto_5316 ?auto_5313 ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5316 ) ) ( not ( = ?auto_5315 ?auto_5316 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5315 ?auto_5313 )
      ( DELIVER-3PKG-VERIFY ?auto_5314 ?auto_5315 ?auto_5316 ?auto_5313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5324 - OBJ
      ?auto_5325 - OBJ
      ?auto_5326 - OBJ
      ?auto_5323 - LOCATION
    )
    :vars
    (
      ?auto_5327 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5327 ?auto_5323 ) ( IN-TRUCK ?auto_5324 ?auto_5327 ) ( OBJ-AT ?auto_5325 ?auto_5323 ) ( OBJ-AT ?auto_5326 ?auto_5323 ) ( not ( = ?auto_5324 ?auto_5325 ) ) ( not ( = ?auto_5324 ?auto_5326 ) ) ( not ( = ?auto_5325 ?auto_5326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5324 ?auto_5323 )
      ( DELIVER-3PKG-VERIFY ?auto_5324 ?auto_5325 ?auto_5326 ?auto_5323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5329 - OBJ
      ?auto_5330 - OBJ
      ?auto_5331 - OBJ
      ?auto_5328 - LOCATION
    )
    :vars
    (
      ?auto_5332 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5332 ?auto_5328 ) ( IN-TRUCK ?auto_5329 ?auto_5332 ) ( OBJ-AT ?auto_5330 ?auto_5328 ) ( OBJ-AT ?auto_5331 ?auto_5328 ) ( not ( = ?auto_5329 ?auto_5330 ) ) ( not ( = ?auto_5329 ?auto_5331 ) ) ( not ( = ?auto_5330 ?auto_5331 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5329 ?auto_5328 )
      ( DELIVER-3PKG-VERIFY ?auto_5329 ?auto_5330 ?auto_5331 ?auto_5328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5339 - OBJ
      ?auto_5340 - OBJ
      ?auto_5341 - OBJ
      ?auto_5338 - LOCATION
    )
    :vars
    (
      ?auto_5342 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5342 ?auto_5338 ) ( IN-TRUCK ?auto_5339 ?auto_5342 ) ( OBJ-AT ?auto_5340 ?auto_5338 ) ( OBJ-AT ?auto_5341 ?auto_5338 ) ( not ( = ?auto_5339 ?auto_5340 ) ) ( not ( = ?auto_5339 ?auto_5341 ) ) ( not ( = ?auto_5340 ?auto_5341 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5339 ?auto_5338 )
      ( DELIVER-3PKG-VERIFY ?auto_5339 ?auto_5340 ?auto_5341 ?auto_5338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5344 - OBJ
      ?auto_5345 - OBJ
      ?auto_5346 - OBJ
      ?auto_5343 - LOCATION
    )
    :vars
    (
      ?auto_5347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5347 ?auto_5343 ) ( IN-TRUCK ?auto_5344 ?auto_5347 ) ( OBJ-AT ?auto_5345 ?auto_5343 ) ( OBJ-AT ?auto_5346 ?auto_5343 ) ( not ( = ?auto_5344 ?auto_5345 ) ) ( not ( = ?auto_5344 ?auto_5346 ) ) ( not ( = ?auto_5345 ?auto_5346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5344 ?auto_5343 )
      ( DELIVER-3PKG-VERIFY ?auto_5344 ?auto_5345 ?auto_5346 ?auto_5343 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5369 - OBJ
      ?auto_5368 - LOCATION
    )
    :vars
    (
      ?auto_5370 - TRUCK
      ?auto_5371 - LOCATION
      ?auto_5372 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5369 ?auto_5370 ) ( TRUCK-AT ?auto_5370 ?auto_5371 ) ( IN-CITY ?auto_5371 ?auto_5372 ) ( IN-CITY ?auto_5368 ?auto_5372 ) ( not ( = ?auto_5368 ?auto_5371 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5370 ?auto_5371 ?auto_5368 ?auto_5372 )
      ( DELIVER-1PKG ?auto_5369 ?auto_5368 )
      ( DELIVER-1PKG-VERIFY ?auto_5369 ?auto_5368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5374 - OBJ
      ?auto_5375 - OBJ
      ?auto_5373 - LOCATION
    )
    :vars
    (
      ?auto_5378 - TRUCK
      ?auto_5376 - LOCATION
      ?auto_5377 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5375 ?auto_5378 ) ( TRUCK-AT ?auto_5378 ?auto_5376 ) ( IN-CITY ?auto_5376 ?auto_5377 ) ( IN-CITY ?auto_5373 ?auto_5377 ) ( not ( = ?auto_5373 ?auto_5376 ) ) ( OBJ-AT ?auto_5374 ?auto_5373 ) ( not ( = ?auto_5374 ?auto_5375 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5375 ?auto_5373 )
      ( DELIVER-2PKG-VERIFY ?auto_5374 ?auto_5375 ?auto_5373 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5380 - OBJ
      ?auto_5381 - OBJ
      ?auto_5379 - LOCATION
    )
    :vars
    (
      ?auto_5383 - TRUCK
      ?auto_5385 - LOCATION
      ?auto_5384 - CITY
      ?auto_5382 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5381 ?auto_5383 ) ( TRUCK-AT ?auto_5383 ?auto_5385 ) ( IN-CITY ?auto_5385 ?auto_5384 ) ( IN-CITY ?auto_5379 ?auto_5384 ) ( not ( = ?auto_5379 ?auto_5385 ) ) ( OBJ-AT ?auto_5382 ?auto_5379 ) ( not ( = ?auto_5382 ?auto_5381 ) ) ( OBJ-AT ?auto_5380 ?auto_5379 ) ( not ( = ?auto_5380 ?auto_5381 ) ) ( not ( = ?auto_5380 ?auto_5382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5382 ?auto_5381 ?auto_5379 )
      ( DELIVER-2PKG-VERIFY ?auto_5380 ?auto_5381 ?auto_5379 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5387 - OBJ
      ?auto_5388 - OBJ
      ?auto_5386 - LOCATION
    )
    :vars
    (
      ?auto_5389 - TRUCK
      ?auto_5391 - LOCATION
      ?auto_5390 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5387 ?auto_5389 ) ( TRUCK-AT ?auto_5389 ?auto_5391 ) ( IN-CITY ?auto_5391 ?auto_5390 ) ( IN-CITY ?auto_5386 ?auto_5390 ) ( not ( = ?auto_5386 ?auto_5391 ) ) ( OBJ-AT ?auto_5388 ?auto_5386 ) ( not ( = ?auto_5388 ?auto_5387 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5388 ?auto_5387 ?auto_5386 )
      ( DELIVER-2PKG-VERIFY ?auto_5387 ?auto_5388 ?auto_5386 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5393 - OBJ
      ?auto_5394 - OBJ
      ?auto_5392 - LOCATION
    )
    :vars
    (
      ?auto_5396 - TRUCK
      ?auto_5398 - LOCATION
      ?auto_5397 - CITY
      ?auto_5395 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5393 ?auto_5396 ) ( TRUCK-AT ?auto_5396 ?auto_5398 ) ( IN-CITY ?auto_5398 ?auto_5397 ) ( IN-CITY ?auto_5392 ?auto_5397 ) ( not ( = ?auto_5392 ?auto_5398 ) ) ( OBJ-AT ?auto_5395 ?auto_5392 ) ( not ( = ?auto_5395 ?auto_5393 ) ) ( OBJ-AT ?auto_5394 ?auto_5392 ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( not ( = ?auto_5394 ?auto_5395 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5395 ?auto_5393 ?auto_5392 )
      ( DELIVER-2PKG-VERIFY ?auto_5393 ?auto_5394 ?auto_5392 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5407 - OBJ
      ?auto_5408 - OBJ
      ?auto_5409 - OBJ
      ?auto_5406 - LOCATION
    )
    :vars
    (
      ?auto_5410 - TRUCK
      ?auto_5412 - LOCATION
      ?auto_5411 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5409 ?auto_5410 ) ( TRUCK-AT ?auto_5410 ?auto_5412 ) ( IN-CITY ?auto_5412 ?auto_5411 ) ( IN-CITY ?auto_5406 ?auto_5411 ) ( not ( = ?auto_5406 ?auto_5412 ) ) ( OBJ-AT ?auto_5408 ?auto_5406 ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( OBJ-AT ?auto_5407 ?auto_5406 ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( not ( = ?auto_5407 ?auto_5409 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5408 ?auto_5409 ?auto_5406 )
      ( DELIVER-3PKG-VERIFY ?auto_5407 ?auto_5408 ?auto_5409 ?auto_5406 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5414 - OBJ
      ?auto_5415 - OBJ
      ?auto_5416 - OBJ
      ?auto_5413 - LOCATION
    )
    :vars
    (
      ?auto_5417 - TRUCK
      ?auto_5419 - LOCATION
      ?auto_5418 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5416 ?auto_5417 ) ( TRUCK-AT ?auto_5417 ?auto_5419 ) ( IN-CITY ?auto_5419 ?auto_5418 ) ( IN-CITY ?auto_5413 ?auto_5418 ) ( not ( = ?auto_5413 ?auto_5419 ) ) ( OBJ-AT ?auto_5414 ?auto_5413 ) ( not ( = ?auto_5414 ?auto_5416 ) ) ( OBJ-AT ?auto_5415 ?auto_5413 ) ( not ( = ?auto_5414 ?auto_5415 ) ) ( not ( = ?auto_5415 ?auto_5416 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5414 ?auto_5416 ?auto_5413 )
      ( DELIVER-3PKG-VERIFY ?auto_5414 ?auto_5415 ?auto_5416 ?auto_5413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5421 - OBJ
      ?auto_5422 - OBJ
      ?auto_5423 - OBJ
      ?auto_5420 - LOCATION
    )
    :vars
    (
      ?auto_5424 - TRUCK
      ?auto_5426 - LOCATION
      ?auto_5425 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5422 ?auto_5424 ) ( TRUCK-AT ?auto_5424 ?auto_5426 ) ( IN-CITY ?auto_5426 ?auto_5425 ) ( IN-CITY ?auto_5420 ?auto_5425 ) ( not ( = ?auto_5420 ?auto_5426 ) ) ( OBJ-AT ?auto_5423 ?auto_5420 ) ( not ( = ?auto_5423 ?auto_5422 ) ) ( OBJ-AT ?auto_5421 ?auto_5420 ) ( not ( = ?auto_5421 ?auto_5422 ) ) ( not ( = ?auto_5421 ?auto_5423 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5423 ?auto_5422 ?auto_5420 )
      ( DELIVER-3PKG-VERIFY ?auto_5421 ?auto_5422 ?auto_5423 ?auto_5420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5428 - OBJ
      ?auto_5429 - OBJ
      ?auto_5430 - OBJ
      ?auto_5427 - LOCATION
    )
    :vars
    (
      ?auto_5431 - TRUCK
      ?auto_5433 - LOCATION
      ?auto_5432 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5429 ?auto_5431 ) ( TRUCK-AT ?auto_5431 ?auto_5433 ) ( IN-CITY ?auto_5433 ?auto_5432 ) ( IN-CITY ?auto_5427 ?auto_5432 ) ( not ( = ?auto_5427 ?auto_5433 ) ) ( OBJ-AT ?auto_5428 ?auto_5427 ) ( not ( = ?auto_5428 ?auto_5429 ) ) ( OBJ-AT ?auto_5430 ?auto_5427 ) ( not ( = ?auto_5428 ?auto_5430 ) ) ( not ( = ?auto_5429 ?auto_5430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5428 ?auto_5429 ?auto_5427 )
      ( DELIVER-3PKG-VERIFY ?auto_5428 ?auto_5429 ?auto_5430 ?auto_5427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5442 - OBJ
      ?auto_5443 - OBJ
      ?auto_5444 - OBJ
      ?auto_5441 - LOCATION
    )
    :vars
    (
      ?auto_5445 - TRUCK
      ?auto_5447 - LOCATION
      ?auto_5446 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5444 ?auto_5445 ) ( TRUCK-AT ?auto_5445 ?auto_5447 ) ( IN-CITY ?auto_5447 ?auto_5446 ) ( IN-CITY ?auto_5441 ?auto_5446 ) ( not ( = ?auto_5441 ?auto_5447 ) ) ( OBJ-AT ?auto_5443 ?auto_5441 ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( OBJ-AT ?auto_5442 ?auto_5441 ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5444 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5443 ?auto_5444 ?auto_5441 )
      ( DELIVER-3PKG-VERIFY ?auto_5442 ?auto_5443 ?auto_5444 ?auto_5441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5449 - OBJ
      ?auto_5450 - OBJ
      ?auto_5451 - OBJ
      ?auto_5448 - LOCATION
    )
    :vars
    (
      ?auto_5453 - TRUCK
      ?auto_5455 - LOCATION
      ?auto_5454 - CITY
      ?auto_5452 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5451 ?auto_5453 ) ( TRUCK-AT ?auto_5453 ?auto_5455 ) ( IN-CITY ?auto_5455 ?auto_5454 ) ( IN-CITY ?auto_5448 ?auto_5454 ) ( not ( = ?auto_5448 ?auto_5455 ) ) ( OBJ-AT ?auto_5452 ?auto_5448 ) ( not ( = ?auto_5452 ?auto_5451 ) ) ( OBJ-AT ?auto_5449 ?auto_5448 ) ( OBJ-AT ?auto_5450 ?auto_5448 ) ( not ( = ?auto_5449 ?auto_5450 ) ) ( not ( = ?auto_5449 ?auto_5451 ) ) ( not ( = ?auto_5449 ?auto_5452 ) ) ( not ( = ?auto_5450 ?auto_5451 ) ) ( not ( = ?auto_5450 ?auto_5452 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5452 ?auto_5451 ?auto_5448 )
      ( DELIVER-3PKG-VERIFY ?auto_5449 ?auto_5450 ?auto_5451 ?auto_5448 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5457 - OBJ
      ?auto_5458 - OBJ
      ?auto_5459 - OBJ
      ?auto_5456 - LOCATION
    )
    :vars
    (
      ?auto_5460 - TRUCK
      ?auto_5462 - LOCATION
      ?auto_5461 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5458 ?auto_5460 ) ( TRUCK-AT ?auto_5460 ?auto_5462 ) ( IN-CITY ?auto_5462 ?auto_5461 ) ( IN-CITY ?auto_5456 ?auto_5461 ) ( not ( = ?auto_5456 ?auto_5462 ) ) ( OBJ-AT ?auto_5459 ?auto_5456 ) ( not ( = ?auto_5459 ?auto_5458 ) ) ( OBJ-AT ?auto_5457 ?auto_5456 ) ( not ( = ?auto_5457 ?auto_5458 ) ) ( not ( = ?auto_5457 ?auto_5459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5459 ?auto_5458 ?auto_5456 )
      ( DELIVER-3PKG-VERIFY ?auto_5457 ?auto_5458 ?auto_5459 ?auto_5456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5464 - OBJ
      ?auto_5465 - OBJ
      ?auto_5466 - OBJ
      ?auto_5463 - LOCATION
    )
    :vars
    (
      ?auto_5468 - TRUCK
      ?auto_5470 - LOCATION
      ?auto_5469 - CITY
      ?auto_5467 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5465 ?auto_5468 ) ( TRUCK-AT ?auto_5468 ?auto_5470 ) ( IN-CITY ?auto_5470 ?auto_5469 ) ( IN-CITY ?auto_5463 ?auto_5469 ) ( not ( = ?auto_5463 ?auto_5470 ) ) ( OBJ-AT ?auto_5467 ?auto_5463 ) ( not ( = ?auto_5467 ?auto_5465 ) ) ( OBJ-AT ?auto_5464 ?auto_5463 ) ( OBJ-AT ?auto_5466 ?auto_5463 ) ( not ( = ?auto_5464 ?auto_5465 ) ) ( not ( = ?auto_5464 ?auto_5466 ) ) ( not ( = ?auto_5464 ?auto_5467 ) ) ( not ( = ?auto_5465 ?auto_5466 ) ) ( not ( = ?auto_5466 ?auto_5467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5467 ?auto_5465 ?auto_5463 )
      ( DELIVER-3PKG-VERIFY ?auto_5464 ?auto_5465 ?auto_5466 ?auto_5463 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5480 - OBJ
      ?auto_5481 - OBJ
      ?auto_5482 - OBJ
      ?auto_5479 - LOCATION
    )
    :vars
    (
      ?auto_5483 - TRUCK
      ?auto_5485 - LOCATION
      ?auto_5484 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5480 ?auto_5483 ) ( TRUCK-AT ?auto_5483 ?auto_5485 ) ( IN-CITY ?auto_5485 ?auto_5484 ) ( IN-CITY ?auto_5479 ?auto_5484 ) ( not ( = ?auto_5479 ?auto_5485 ) ) ( OBJ-AT ?auto_5482 ?auto_5479 ) ( not ( = ?auto_5482 ?auto_5480 ) ) ( OBJ-AT ?auto_5481 ?auto_5479 ) ( not ( = ?auto_5480 ?auto_5481 ) ) ( not ( = ?auto_5481 ?auto_5482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5482 ?auto_5480 ?auto_5479 )
      ( DELIVER-3PKG-VERIFY ?auto_5480 ?auto_5481 ?auto_5482 ?auto_5479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5487 - OBJ
      ?auto_5488 - OBJ
      ?auto_5489 - OBJ
      ?auto_5486 - LOCATION
    )
    :vars
    (
      ?auto_5490 - TRUCK
      ?auto_5492 - LOCATION
      ?auto_5491 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5487 ?auto_5490 ) ( TRUCK-AT ?auto_5490 ?auto_5492 ) ( IN-CITY ?auto_5492 ?auto_5491 ) ( IN-CITY ?auto_5486 ?auto_5491 ) ( not ( = ?auto_5486 ?auto_5492 ) ) ( OBJ-AT ?auto_5488 ?auto_5486 ) ( not ( = ?auto_5488 ?auto_5487 ) ) ( OBJ-AT ?auto_5489 ?auto_5486 ) ( not ( = ?auto_5487 ?auto_5489 ) ) ( not ( = ?auto_5488 ?auto_5489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5488 ?auto_5487 ?auto_5486 )
      ( DELIVER-3PKG-VERIFY ?auto_5487 ?auto_5488 ?auto_5489 ?auto_5486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5501 - OBJ
      ?auto_5502 - OBJ
      ?auto_5503 - OBJ
      ?auto_5500 - LOCATION
    )
    :vars
    (
      ?auto_5504 - TRUCK
      ?auto_5506 - LOCATION
      ?auto_5505 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5501 ?auto_5504 ) ( TRUCK-AT ?auto_5504 ?auto_5506 ) ( IN-CITY ?auto_5506 ?auto_5505 ) ( IN-CITY ?auto_5500 ?auto_5505 ) ( not ( = ?auto_5500 ?auto_5506 ) ) ( OBJ-AT ?auto_5503 ?auto_5500 ) ( not ( = ?auto_5503 ?auto_5501 ) ) ( OBJ-AT ?auto_5502 ?auto_5500 ) ( not ( = ?auto_5501 ?auto_5502 ) ) ( not ( = ?auto_5502 ?auto_5503 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5503 ?auto_5501 ?auto_5500 )
      ( DELIVER-3PKG-VERIFY ?auto_5501 ?auto_5502 ?auto_5503 ?auto_5500 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5508 - OBJ
      ?auto_5509 - OBJ
      ?auto_5510 - OBJ
      ?auto_5507 - LOCATION
    )
    :vars
    (
      ?auto_5512 - TRUCK
      ?auto_5514 - LOCATION
      ?auto_5513 - CITY
      ?auto_5511 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5508 ?auto_5512 ) ( TRUCK-AT ?auto_5512 ?auto_5514 ) ( IN-CITY ?auto_5514 ?auto_5513 ) ( IN-CITY ?auto_5507 ?auto_5513 ) ( not ( = ?auto_5507 ?auto_5514 ) ) ( OBJ-AT ?auto_5511 ?auto_5507 ) ( not ( = ?auto_5511 ?auto_5508 ) ) ( OBJ-AT ?auto_5509 ?auto_5507 ) ( OBJ-AT ?auto_5510 ?auto_5507 ) ( not ( = ?auto_5508 ?auto_5509 ) ) ( not ( = ?auto_5508 ?auto_5510 ) ) ( not ( = ?auto_5509 ?auto_5510 ) ) ( not ( = ?auto_5509 ?auto_5511 ) ) ( not ( = ?auto_5510 ?auto_5511 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5511 ?auto_5508 ?auto_5507 )
      ( DELIVER-3PKG-VERIFY ?auto_5508 ?auto_5509 ?auto_5510 ?auto_5507 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5547 - OBJ
      ?auto_5546 - LOCATION
    )
    :vars
    (
      ?auto_5549 - TRUCK
      ?auto_5551 - LOCATION
      ?auto_5550 - CITY
      ?auto_5548 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5549 ?auto_5551 ) ( IN-CITY ?auto_5551 ?auto_5550 ) ( IN-CITY ?auto_5546 ?auto_5550 ) ( not ( = ?auto_5546 ?auto_5551 ) ) ( OBJ-AT ?auto_5548 ?auto_5546 ) ( not ( = ?auto_5548 ?auto_5547 ) ) ( OBJ-AT ?auto_5547 ?auto_5551 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5547 ?auto_5549 ?auto_5551 )
      ( DELIVER-2PKG ?auto_5548 ?auto_5547 ?auto_5546 )
      ( DELIVER-1PKG-VERIFY ?auto_5547 ?auto_5546 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5553 - OBJ
      ?auto_5554 - OBJ
      ?auto_5552 - LOCATION
    )
    :vars
    (
      ?auto_5557 - TRUCK
      ?auto_5556 - LOCATION
      ?auto_5555 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5557 ?auto_5556 ) ( IN-CITY ?auto_5556 ?auto_5555 ) ( IN-CITY ?auto_5552 ?auto_5555 ) ( not ( = ?auto_5552 ?auto_5556 ) ) ( OBJ-AT ?auto_5553 ?auto_5552 ) ( not ( = ?auto_5553 ?auto_5554 ) ) ( OBJ-AT ?auto_5554 ?auto_5556 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5554 ?auto_5552 )
      ( DELIVER-2PKG-VERIFY ?auto_5553 ?auto_5554 ?auto_5552 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5559 - OBJ
      ?auto_5560 - OBJ
      ?auto_5558 - LOCATION
    )
    :vars
    (
      ?auto_5562 - TRUCK
      ?auto_5563 - LOCATION
      ?auto_5564 - CITY
      ?auto_5561 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5562 ?auto_5563 ) ( IN-CITY ?auto_5563 ?auto_5564 ) ( IN-CITY ?auto_5558 ?auto_5564 ) ( not ( = ?auto_5558 ?auto_5563 ) ) ( OBJ-AT ?auto_5561 ?auto_5558 ) ( not ( = ?auto_5561 ?auto_5560 ) ) ( OBJ-AT ?auto_5560 ?auto_5563 ) ( OBJ-AT ?auto_5559 ?auto_5558 ) ( not ( = ?auto_5559 ?auto_5560 ) ) ( not ( = ?auto_5559 ?auto_5561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5561 ?auto_5560 ?auto_5558 )
      ( DELIVER-2PKG-VERIFY ?auto_5559 ?auto_5560 ?auto_5558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5566 - OBJ
      ?auto_5567 - OBJ
      ?auto_5565 - LOCATION
    )
    :vars
    (
      ?auto_5568 - TRUCK
      ?auto_5569 - LOCATION
      ?auto_5570 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5568 ?auto_5569 ) ( IN-CITY ?auto_5569 ?auto_5570 ) ( IN-CITY ?auto_5565 ?auto_5570 ) ( not ( = ?auto_5565 ?auto_5569 ) ) ( OBJ-AT ?auto_5567 ?auto_5565 ) ( not ( = ?auto_5567 ?auto_5566 ) ) ( OBJ-AT ?auto_5566 ?auto_5569 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5567 ?auto_5566 ?auto_5565 )
      ( DELIVER-2PKG-VERIFY ?auto_5566 ?auto_5567 ?auto_5565 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5572 - OBJ
      ?auto_5573 - OBJ
      ?auto_5571 - LOCATION
    )
    :vars
    (
      ?auto_5575 - TRUCK
      ?auto_5576 - LOCATION
      ?auto_5577 - CITY
      ?auto_5574 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5575 ?auto_5576 ) ( IN-CITY ?auto_5576 ?auto_5577 ) ( IN-CITY ?auto_5571 ?auto_5577 ) ( not ( = ?auto_5571 ?auto_5576 ) ) ( OBJ-AT ?auto_5574 ?auto_5571 ) ( not ( = ?auto_5574 ?auto_5572 ) ) ( OBJ-AT ?auto_5572 ?auto_5576 ) ( OBJ-AT ?auto_5573 ?auto_5571 ) ( not ( = ?auto_5572 ?auto_5573 ) ) ( not ( = ?auto_5573 ?auto_5574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5574 ?auto_5572 ?auto_5571 )
      ( DELIVER-2PKG-VERIFY ?auto_5572 ?auto_5573 ?auto_5571 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5586 - OBJ
      ?auto_5587 - OBJ
      ?auto_5588 - OBJ
      ?auto_5585 - LOCATION
    )
    :vars
    (
      ?auto_5589 - TRUCK
      ?auto_5590 - LOCATION
      ?auto_5591 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5589 ?auto_5590 ) ( IN-CITY ?auto_5590 ?auto_5591 ) ( IN-CITY ?auto_5585 ?auto_5591 ) ( not ( = ?auto_5585 ?auto_5590 ) ) ( OBJ-AT ?auto_5587 ?auto_5585 ) ( not ( = ?auto_5587 ?auto_5588 ) ) ( OBJ-AT ?auto_5588 ?auto_5590 ) ( OBJ-AT ?auto_5586 ?auto_5585 ) ( not ( = ?auto_5586 ?auto_5587 ) ) ( not ( = ?auto_5586 ?auto_5588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5587 ?auto_5588 ?auto_5585 )
      ( DELIVER-3PKG-VERIFY ?auto_5586 ?auto_5587 ?auto_5588 ?auto_5585 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5593 - OBJ
      ?auto_5594 - OBJ
      ?auto_5595 - OBJ
      ?auto_5592 - LOCATION
    )
    :vars
    (
      ?auto_5596 - TRUCK
      ?auto_5597 - LOCATION
      ?auto_5598 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5596 ?auto_5597 ) ( IN-CITY ?auto_5597 ?auto_5598 ) ( IN-CITY ?auto_5592 ?auto_5598 ) ( not ( = ?auto_5592 ?auto_5597 ) ) ( OBJ-AT ?auto_5593 ?auto_5592 ) ( not ( = ?auto_5593 ?auto_5595 ) ) ( OBJ-AT ?auto_5595 ?auto_5597 ) ( OBJ-AT ?auto_5594 ?auto_5592 ) ( not ( = ?auto_5593 ?auto_5594 ) ) ( not ( = ?auto_5594 ?auto_5595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5593 ?auto_5595 ?auto_5592 )
      ( DELIVER-3PKG-VERIFY ?auto_5593 ?auto_5594 ?auto_5595 ?auto_5592 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5600 - OBJ
      ?auto_5601 - OBJ
      ?auto_5602 - OBJ
      ?auto_5599 - LOCATION
    )
    :vars
    (
      ?auto_5603 - TRUCK
      ?auto_5604 - LOCATION
      ?auto_5605 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5603 ?auto_5604 ) ( IN-CITY ?auto_5604 ?auto_5605 ) ( IN-CITY ?auto_5599 ?auto_5605 ) ( not ( = ?auto_5599 ?auto_5604 ) ) ( OBJ-AT ?auto_5602 ?auto_5599 ) ( not ( = ?auto_5602 ?auto_5601 ) ) ( OBJ-AT ?auto_5601 ?auto_5604 ) ( OBJ-AT ?auto_5600 ?auto_5599 ) ( not ( = ?auto_5600 ?auto_5601 ) ) ( not ( = ?auto_5600 ?auto_5602 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5602 ?auto_5601 ?auto_5599 )
      ( DELIVER-3PKG-VERIFY ?auto_5600 ?auto_5601 ?auto_5602 ?auto_5599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5607 - OBJ
      ?auto_5608 - OBJ
      ?auto_5609 - OBJ
      ?auto_5606 - LOCATION
    )
    :vars
    (
      ?auto_5610 - TRUCK
      ?auto_5611 - LOCATION
      ?auto_5612 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5610 ?auto_5611 ) ( IN-CITY ?auto_5611 ?auto_5612 ) ( IN-CITY ?auto_5606 ?auto_5612 ) ( not ( = ?auto_5606 ?auto_5611 ) ) ( OBJ-AT ?auto_5607 ?auto_5606 ) ( not ( = ?auto_5607 ?auto_5608 ) ) ( OBJ-AT ?auto_5608 ?auto_5611 ) ( OBJ-AT ?auto_5609 ?auto_5606 ) ( not ( = ?auto_5607 ?auto_5609 ) ) ( not ( = ?auto_5608 ?auto_5609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5607 ?auto_5608 ?auto_5606 )
      ( DELIVER-3PKG-VERIFY ?auto_5607 ?auto_5608 ?auto_5609 ?auto_5606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5621 - OBJ
      ?auto_5622 - OBJ
      ?auto_5623 - OBJ
      ?auto_5620 - LOCATION
    )
    :vars
    (
      ?auto_5624 - TRUCK
      ?auto_5625 - LOCATION
      ?auto_5626 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5624 ?auto_5625 ) ( IN-CITY ?auto_5625 ?auto_5626 ) ( IN-CITY ?auto_5620 ?auto_5626 ) ( not ( = ?auto_5620 ?auto_5625 ) ) ( OBJ-AT ?auto_5622 ?auto_5620 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( OBJ-AT ?auto_5623 ?auto_5625 ) ( OBJ-AT ?auto_5621 ?auto_5620 ) ( not ( = ?auto_5621 ?auto_5622 ) ) ( not ( = ?auto_5621 ?auto_5623 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5622 ?auto_5623 ?auto_5620 )
      ( DELIVER-3PKG-VERIFY ?auto_5621 ?auto_5622 ?auto_5623 ?auto_5620 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5628 - OBJ
      ?auto_5629 - OBJ
      ?auto_5630 - OBJ
      ?auto_5627 - LOCATION
    )
    :vars
    (
      ?auto_5632 - TRUCK
      ?auto_5633 - LOCATION
      ?auto_5634 - CITY
      ?auto_5631 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5632 ?auto_5633 ) ( IN-CITY ?auto_5633 ?auto_5634 ) ( IN-CITY ?auto_5627 ?auto_5634 ) ( not ( = ?auto_5627 ?auto_5633 ) ) ( OBJ-AT ?auto_5631 ?auto_5627 ) ( not ( = ?auto_5631 ?auto_5630 ) ) ( OBJ-AT ?auto_5630 ?auto_5633 ) ( OBJ-AT ?auto_5628 ?auto_5627 ) ( OBJ-AT ?auto_5629 ?auto_5627 ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( not ( = ?auto_5628 ?auto_5631 ) ) ( not ( = ?auto_5629 ?auto_5630 ) ) ( not ( = ?auto_5629 ?auto_5631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5631 ?auto_5630 ?auto_5627 )
      ( DELIVER-3PKG-VERIFY ?auto_5628 ?auto_5629 ?auto_5630 ?auto_5627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5636 - OBJ
      ?auto_5637 - OBJ
      ?auto_5638 - OBJ
      ?auto_5635 - LOCATION
    )
    :vars
    (
      ?auto_5639 - TRUCK
      ?auto_5640 - LOCATION
      ?auto_5641 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5639 ?auto_5640 ) ( IN-CITY ?auto_5640 ?auto_5641 ) ( IN-CITY ?auto_5635 ?auto_5641 ) ( not ( = ?auto_5635 ?auto_5640 ) ) ( OBJ-AT ?auto_5638 ?auto_5635 ) ( not ( = ?auto_5638 ?auto_5637 ) ) ( OBJ-AT ?auto_5637 ?auto_5640 ) ( OBJ-AT ?auto_5636 ?auto_5635 ) ( not ( = ?auto_5636 ?auto_5637 ) ) ( not ( = ?auto_5636 ?auto_5638 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5638 ?auto_5637 ?auto_5635 )
      ( DELIVER-3PKG-VERIFY ?auto_5636 ?auto_5637 ?auto_5638 ?auto_5635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5643 - OBJ
      ?auto_5644 - OBJ
      ?auto_5645 - OBJ
      ?auto_5642 - LOCATION
    )
    :vars
    (
      ?auto_5647 - TRUCK
      ?auto_5648 - LOCATION
      ?auto_5649 - CITY
      ?auto_5646 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5647 ?auto_5648 ) ( IN-CITY ?auto_5648 ?auto_5649 ) ( IN-CITY ?auto_5642 ?auto_5649 ) ( not ( = ?auto_5642 ?auto_5648 ) ) ( OBJ-AT ?auto_5646 ?auto_5642 ) ( not ( = ?auto_5646 ?auto_5644 ) ) ( OBJ-AT ?auto_5644 ?auto_5648 ) ( OBJ-AT ?auto_5643 ?auto_5642 ) ( OBJ-AT ?auto_5645 ?auto_5642 ) ( not ( = ?auto_5643 ?auto_5644 ) ) ( not ( = ?auto_5643 ?auto_5645 ) ) ( not ( = ?auto_5643 ?auto_5646 ) ) ( not ( = ?auto_5644 ?auto_5645 ) ) ( not ( = ?auto_5645 ?auto_5646 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5646 ?auto_5644 ?auto_5642 )
      ( DELIVER-3PKG-VERIFY ?auto_5643 ?auto_5644 ?auto_5645 ?auto_5642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5659 - OBJ
      ?auto_5660 - OBJ
      ?auto_5661 - OBJ
      ?auto_5658 - LOCATION
    )
    :vars
    (
      ?auto_5662 - TRUCK
      ?auto_5663 - LOCATION
      ?auto_5664 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5662 ?auto_5663 ) ( IN-CITY ?auto_5663 ?auto_5664 ) ( IN-CITY ?auto_5658 ?auto_5664 ) ( not ( = ?auto_5658 ?auto_5663 ) ) ( OBJ-AT ?auto_5661 ?auto_5658 ) ( not ( = ?auto_5661 ?auto_5659 ) ) ( OBJ-AT ?auto_5659 ?auto_5663 ) ( OBJ-AT ?auto_5660 ?auto_5658 ) ( not ( = ?auto_5659 ?auto_5660 ) ) ( not ( = ?auto_5660 ?auto_5661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5661 ?auto_5659 ?auto_5658 )
      ( DELIVER-3PKG-VERIFY ?auto_5659 ?auto_5660 ?auto_5661 ?auto_5658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5666 - OBJ
      ?auto_5667 - OBJ
      ?auto_5668 - OBJ
      ?auto_5665 - LOCATION
    )
    :vars
    (
      ?auto_5669 - TRUCK
      ?auto_5670 - LOCATION
      ?auto_5671 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5669 ?auto_5670 ) ( IN-CITY ?auto_5670 ?auto_5671 ) ( IN-CITY ?auto_5665 ?auto_5671 ) ( not ( = ?auto_5665 ?auto_5670 ) ) ( OBJ-AT ?auto_5667 ?auto_5665 ) ( not ( = ?auto_5667 ?auto_5666 ) ) ( OBJ-AT ?auto_5666 ?auto_5670 ) ( OBJ-AT ?auto_5668 ?auto_5665 ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( not ( = ?auto_5667 ?auto_5668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5667 ?auto_5666 ?auto_5665 )
      ( DELIVER-3PKG-VERIFY ?auto_5666 ?auto_5667 ?auto_5668 ?auto_5665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5680 - OBJ
      ?auto_5681 - OBJ
      ?auto_5682 - OBJ
      ?auto_5679 - LOCATION
    )
    :vars
    (
      ?auto_5683 - TRUCK
      ?auto_5684 - LOCATION
      ?auto_5685 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5683 ?auto_5684 ) ( IN-CITY ?auto_5684 ?auto_5685 ) ( IN-CITY ?auto_5679 ?auto_5685 ) ( not ( = ?auto_5679 ?auto_5684 ) ) ( OBJ-AT ?auto_5682 ?auto_5679 ) ( not ( = ?auto_5682 ?auto_5680 ) ) ( OBJ-AT ?auto_5680 ?auto_5684 ) ( OBJ-AT ?auto_5681 ?auto_5679 ) ( not ( = ?auto_5680 ?auto_5681 ) ) ( not ( = ?auto_5681 ?auto_5682 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5682 ?auto_5680 ?auto_5679 )
      ( DELIVER-3PKG-VERIFY ?auto_5680 ?auto_5681 ?auto_5682 ?auto_5679 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5687 - OBJ
      ?auto_5688 - OBJ
      ?auto_5689 - OBJ
      ?auto_5686 - LOCATION
    )
    :vars
    (
      ?auto_5691 - TRUCK
      ?auto_5692 - LOCATION
      ?auto_5693 - CITY
      ?auto_5690 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5691 ?auto_5692 ) ( IN-CITY ?auto_5692 ?auto_5693 ) ( IN-CITY ?auto_5686 ?auto_5693 ) ( not ( = ?auto_5686 ?auto_5692 ) ) ( OBJ-AT ?auto_5690 ?auto_5686 ) ( not ( = ?auto_5690 ?auto_5687 ) ) ( OBJ-AT ?auto_5687 ?auto_5692 ) ( OBJ-AT ?auto_5688 ?auto_5686 ) ( OBJ-AT ?auto_5689 ?auto_5686 ) ( not ( = ?auto_5687 ?auto_5688 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( not ( = ?auto_5688 ?auto_5689 ) ) ( not ( = ?auto_5688 ?auto_5690 ) ) ( not ( = ?auto_5689 ?auto_5690 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5690 ?auto_5687 ?auto_5686 )
      ( DELIVER-3PKG-VERIFY ?auto_5687 ?auto_5688 ?auto_5689 ?auto_5686 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5726 - OBJ
      ?auto_5725 - LOCATION
    )
    :vars
    (
      ?auto_5729 - LOCATION
      ?auto_5730 - CITY
      ?auto_5727 - OBJ
      ?auto_5728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5729 ?auto_5730 ) ( IN-CITY ?auto_5725 ?auto_5730 ) ( not ( = ?auto_5725 ?auto_5729 ) ) ( OBJ-AT ?auto_5727 ?auto_5725 ) ( not ( = ?auto_5727 ?auto_5726 ) ) ( OBJ-AT ?auto_5726 ?auto_5729 ) ( TRUCK-AT ?auto_5728 ?auto_5725 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5728 ?auto_5725 ?auto_5729 ?auto_5730 )
      ( DELIVER-2PKG ?auto_5727 ?auto_5726 ?auto_5725 )
      ( DELIVER-1PKG-VERIFY ?auto_5726 ?auto_5725 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5732 - OBJ
      ?auto_5733 - OBJ
      ?auto_5731 - LOCATION
    )
    :vars
    (
      ?auto_5735 - LOCATION
      ?auto_5734 - CITY
      ?auto_5736 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5735 ?auto_5734 ) ( IN-CITY ?auto_5731 ?auto_5734 ) ( not ( = ?auto_5731 ?auto_5735 ) ) ( OBJ-AT ?auto_5732 ?auto_5731 ) ( not ( = ?auto_5732 ?auto_5733 ) ) ( OBJ-AT ?auto_5733 ?auto_5735 ) ( TRUCK-AT ?auto_5736 ?auto_5731 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5733 ?auto_5731 )
      ( DELIVER-2PKG-VERIFY ?auto_5732 ?auto_5733 ?auto_5731 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5738 - OBJ
      ?auto_5739 - OBJ
      ?auto_5737 - LOCATION
    )
    :vars
    (
      ?auto_5742 - LOCATION
      ?auto_5743 - CITY
      ?auto_5740 - OBJ
      ?auto_5741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5742 ?auto_5743 ) ( IN-CITY ?auto_5737 ?auto_5743 ) ( not ( = ?auto_5737 ?auto_5742 ) ) ( OBJ-AT ?auto_5740 ?auto_5737 ) ( not ( = ?auto_5740 ?auto_5739 ) ) ( OBJ-AT ?auto_5739 ?auto_5742 ) ( TRUCK-AT ?auto_5741 ?auto_5737 ) ( OBJ-AT ?auto_5738 ?auto_5737 ) ( not ( = ?auto_5738 ?auto_5739 ) ) ( not ( = ?auto_5738 ?auto_5740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5740 ?auto_5739 ?auto_5737 )
      ( DELIVER-2PKG-VERIFY ?auto_5738 ?auto_5739 ?auto_5737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5745 - OBJ
      ?auto_5746 - OBJ
      ?auto_5744 - LOCATION
    )
    :vars
    (
      ?auto_5748 - LOCATION
      ?auto_5749 - CITY
      ?auto_5747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5748 ?auto_5749 ) ( IN-CITY ?auto_5744 ?auto_5749 ) ( not ( = ?auto_5744 ?auto_5748 ) ) ( OBJ-AT ?auto_5746 ?auto_5744 ) ( not ( = ?auto_5746 ?auto_5745 ) ) ( OBJ-AT ?auto_5745 ?auto_5748 ) ( TRUCK-AT ?auto_5747 ?auto_5744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5746 ?auto_5745 ?auto_5744 )
      ( DELIVER-2PKG-VERIFY ?auto_5745 ?auto_5746 ?auto_5744 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5751 - OBJ
      ?auto_5752 - OBJ
      ?auto_5750 - LOCATION
    )
    :vars
    (
      ?auto_5755 - LOCATION
      ?auto_5756 - CITY
      ?auto_5753 - OBJ
      ?auto_5754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5755 ?auto_5756 ) ( IN-CITY ?auto_5750 ?auto_5756 ) ( not ( = ?auto_5750 ?auto_5755 ) ) ( OBJ-AT ?auto_5753 ?auto_5750 ) ( not ( = ?auto_5753 ?auto_5751 ) ) ( OBJ-AT ?auto_5751 ?auto_5755 ) ( TRUCK-AT ?auto_5754 ?auto_5750 ) ( OBJ-AT ?auto_5752 ?auto_5750 ) ( not ( = ?auto_5751 ?auto_5752 ) ) ( not ( = ?auto_5752 ?auto_5753 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5753 ?auto_5751 ?auto_5750 )
      ( DELIVER-2PKG-VERIFY ?auto_5751 ?auto_5752 ?auto_5750 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5765 - OBJ
      ?auto_5766 - OBJ
      ?auto_5767 - OBJ
      ?auto_5764 - LOCATION
    )
    :vars
    (
      ?auto_5769 - LOCATION
      ?auto_5770 - CITY
      ?auto_5768 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5769 ?auto_5770 ) ( IN-CITY ?auto_5764 ?auto_5770 ) ( not ( = ?auto_5764 ?auto_5769 ) ) ( OBJ-AT ?auto_5766 ?auto_5764 ) ( not ( = ?auto_5766 ?auto_5767 ) ) ( OBJ-AT ?auto_5767 ?auto_5769 ) ( TRUCK-AT ?auto_5768 ?auto_5764 ) ( OBJ-AT ?auto_5765 ?auto_5764 ) ( not ( = ?auto_5765 ?auto_5766 ) ) ( not ( = ?auto_5765 ?auto_5767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5766 ?auto_5767 ?auto_5764 )
      ( DELIVER-3PKG-VERIFY ?auto_5765 ?auto_5766 ?auto_5767 ?auto_5764 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5772 - OBJ
      ?auto_5773 - OBJ
      ?auto_5774 - OBJ
      ?auto_5771 - LOCATION
    )
    :vars
    (
      ?auto_5776 - LOCATION
      ?auto_5777 - CITY
      ?auto_5775 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5776 ?auto_5777 ) ( IN-CITY ?auto_5771 ?auto_5777 ) ( not ( = ?auto_5771 ?auto_5776 ) ) ( OBJ-AT ?auto_5772 ?auto_5771 ) ( not ( = ?auto_5772 ?auto_5774 ) ) ( OBJ-AT ?auto_5774 ?auto_5776 ) ( TRUCK-AT ?auto_5775 ?auto_5771 ) ( OBJ-AT ?auto_5773 ?auto_5771 ) ( not ( = ?auto_5772 ?auto_5773 ) ) ( not ( = ?auto_5773 ?auto_5774 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5772 ?auto_5774 ?auto_5771 )
      ( DELIVER-3PKG-VERIFY ?auto_5772 ?auto_5773 ?auto_5774 ?auto_5771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5779 - OBJ
      ?auto_5780 - OBJ
      ?auto_5781 - OBJ
      ?auto_5778 - LOCATION
    )
    :vars
    (
      ?auto_5783 - LOCATION
      ?auto_5784 - CITY
      ?auto_5782 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5783 ?auto_5784 ) ( IN-CITY ?auto_5778 ?auto_5784 ) ( not ( = ?auto_5778 ?auto_5783 ) ) ( OBJ-AT ?auto_5781 ?auto_5778 ) ( not ( = ?auto_5781 ?auto_5780 ) ) ( OBJ-AT ?auto_5780 ?auto_5783 ) ( TRUCK-AT ?auto_5782 ?auto_5778 ) ( OBJ-AT ?auto_5779 ?auto_5778 ) ( not ( = ?auto_5779 ?auto_5780 ) ) ( not ( = ?auto_5779 ?auto_5781 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5781 ?auto_5780 ?auto_5778 )
      ( DELIVER-3PKG-VERIFY ?auto_5779 ?auto_5780 ?auto_5781 ?auto_5778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5786 - OBJ
      ?auto_5787 - OBJ
      ?auto_5788 - OBJ
      ?auto_5785 - LOCATION
    )
    :vars
    (
      ?auto_5790 - LOCATION
      ?auto_5791 - CITY
      ?auto_5789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5790 ?auto_5791 ) ( IN-CITY ?auto_5785 ?auto_5791 ) ( not ( = ?auto_5785 ?auto_5790 ) ) ( OBJ-AT ?auto_5786 ?auto_5785 ) ( not ( = ?auto_5786 ?auto_5787 ) ) ( OBJ-AT ?auto_5787 ?auto_5790 ) ( TRUCK-AT ?auto_5789 ?auto_5785 ) ( OBJ-AT ?auto_5788 ?auto_5785 ) ( not ( = ?auto_5786 ?auto_5788 ) ) ( not ( = ?auto_5787 ?auto_5788 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5786 ?auto_5787 ?auto_5785 )
      ( DELIVER-3PKG-VERIFY ?auto_5786 ?auto_5787 ?auto_5788 ?auto_5785 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5800 - OBJ
      ?auto_5801 - OBJ
      ?auto_5802 - OBJ
      ?auto_5799 - LOCATION
    )
    :vars
    (
      ?auto_5804 - LOCATION
      ?auto_5805 - CITY
      ?auto_5803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5804 ?auto_5805 ) ( IN-CITY ?auto_5799 ?auto_5805 ) ( not ( = ?auto_5799 ?auto_5804 ) ) ( OBJ-AT ?auto_5801 ?auto_5799 ) ( not ( = ?auto_5801 ?auto_5802 ) ) ( OBJ-AT ?auto_5802 ?auto_5804 ) ( TRUCK-AT ?auto_5803 ?auto_5799 ) ( OBJ-AT ?auto_5800 ?auto_5799 ) ( not ( = ?auto_5800 ?auto_5801 ) ) ( not ( = ?auto_5800 ?auto_5802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5801 ?auto_5802 ?auto_5799 )
      ( DELIVER-3PKG-VERIFY ?auto_5800 ?auto_5801 ?auto_5802 ?auto_5799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5807 - OBJ
      ?auto_5808 - OBJ
      ?auto_5809 - OBJ
      ?auto_5806 - LOCATION
    )
    :vars
    (
      ?auto_5812 - LOCATION
      ?auto_5813 - CITY
      ?auto_5810 - OBJ
      ?auto_5811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5812 ?auto_5813 ) ( IN-CITY ?auto_5806 ?auto_5813 ) ( not ( = ?auto_5806 ?auto_5812 ) ) ( OBJ-AT ?auto_5810 ?auto_5806 ) ( not ( = ?auto_5810 ?auto_5809 ) ) ( OBJ-AT ?auto_5809 ?auto_5812 ) ( TRUCK-AT ?auto_5811 ?auto_5806 ) ( OBJ-AT ?auto_5807 ?auto_5806 ) ( OBJ-AT ?auto_5808 ?auto_5806 ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( not ( = ?auto_5807 ?auto_5810 ) ) ( not ( = ?auto_5808 ?auto_5809 ) ) ( not ( = ?auto_5808 ?auto_5810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5810 ?auto_5809 ?auto_5806 )
      ( DELIVER-3PKG-VERIFY ?auto_5807 ?auto_5808 ?auto_5809 ?auto_5806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5815 - OBJ
      ?auto_5816 - OBJ
      ?auto_5817 - OBJ
      ?auto_5814 - LOCATION
    )
    :vars
    (
      ?auto_5819 - LOCATION
      ?auto_5820 - CITY
      ?auto_5818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5819 ?auto_5820 ) ( IN-CITY ?auto_5814 ?auto_5820 ) ( not ( = ?auto_5814 ?auto_5819 ) ) ( OBJ-AT ?auto_5817 ?auto_5814 ) ( not ( = ?auto_5817 ?auto_5816 ) ) ( OBJ-AT ?auto_5816 ?auto_5819 ) ( TRUCK-AT ?auto_5818 ?auto_5814 ) ( OBJ-AT ?auto_5815 ?auto_5814 ) ( not ( = ?auto_5815 ?auto_5816 ) ) ( not ( = ?auto_5815 ?auto_5817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5817 ?auto_5816 ?auto_5814 )
      ( DELIVER-3PKG-VERIFY ?auto_5815 ?auto_5816 ?auto_5817 ?auto_5814 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5822 - OBJ
      ?auto_5823 - OBJ
      ?auto_5824 - OBJ
      ?auto_5821 - LOCATION
    )
    :vars
    (
      ?auto_5827 - LOCATION
      ?auto_5828 - CITY
      ?auto_5825 - OBJ
      ?auto_5826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5827 ?auto_5828 ) ( IN-CITY ?auto_5821 ?auto_5828 ) ( not ( = ?auto_5821 ?auto_5827 ) ) ( OBJ-AT ?auto_5825 ?auto_5821 ) ( not ( = ?auto_5825 ?auto_5823 ) ) ( OBJ-AT ?auto_5823 ?auto_5827 ) ( TRUCK-AT ?auto_5826 ?auto_5821 ) ( OBJ-AT ?auto_5822 ?auto_5821 ) ( OBJ-AT ?auto_5824 ?auto_5821 ) ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5822 ?auto_5824 ) ) ( not ( = ?auto_5822 ?auto_5825 ) ) ( not ( = ?auto_5823 ?auto_5824 ) ) ( not ( = ?auto_5824 ?auto_5825 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5825 ?auto_5823 ?auto_5821 )
      ( DELIVER-3PKG-VERIFY ?auto_5822 ?auto_5823 ?auto_5824 ?auto_5821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5838 - OBJ
      ?auto_5839 - OBJ
      ?auto_5840 - OBJ
      ?auto_5837 - LOCATION
    )
    :vars
    (
      ?auto_5842 - LOCATION
      ?auto_5843 - CITY
      ?auto_5841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5842 ?auto_5843 ) ( IN-CITY ?auto_5837 ?auto_5843 ) ( not ( = ?auto_5837 ?auto_5842 ) ) ( OBJ-AT ?auto_5840 ?auto_5837 ) ( not ( = ?auto_5840 ?auto_5838 ) ) ( OBJ-AT ?auto_5838 ?auto_5842 ) ( TRUCK-AT ?auto_5841 ?auto_5837 ) ( OBJ-AT ?auto_5839 ?auto_5837 ) ( not ( = ?auto_5838 ?auto_5839 ) ) ( not ( = ?auto_5839 ?auto_5840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5840 ?auto_5838 ?auto_5837 )
      ( DELIVER-3PKG-VERIFY ?auto_5838 ?auto_5839 ?auto_5840 ?auto_5837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5845 - OBJ
      ?auto_5846 - OBJ
      ?auto_5847 - OBJ
      ?auto_5844 - LOCATION
    )
    :vars
    (
      ?auto_5849 - LOCATION
      ?auto_5850 - CITY
      ?auto_5848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5849 ?auto_5850 ) ( IN-CITY ?auto_5844 ?auto_5850 ) ( not ( = ?auto_5844 ?auto_5849 ) ) ( OBJ-AT ?auto_5846 ?auto_5844 ) ( not ( = ?auto_5846 ?auto_5845 ) ) ( OBJ-AT ?auto_5845 ?auto_5849 ) ( TRUCK-AT ?auto_5848 ?auto_5844 ) ( OBJ-AT ?auto_5847 ?auto_5844 ) ( not ( = ?auto_5845 ?auto_5847 ) ) ( not ( = ?auto_5846 ?auto_5847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5846 ?auto_5845 ?auto_5844 )
      ( DELIVER-3PKG-VERIFY ?auto_5845 ?auto_5846 ?auto_5847 ?auto_5844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5859 - OBJ
      ?auto_5860 - OBJ
      ?auto_5861 - OBJ
      ?auto_5858 - LOCATION
    )
    :vars
    (
      ?auto_5863 - LOCATION
      ?auto_5864 - CITY
      ?auto_5862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5863 ?auto_5864 ) ( IN-CITY ?auto_5858 ?auto_5864 ) ( not ( = ?auto_5858 ?auto_5863 ) ) ( OBJ-AT ?auto_5861 ?auto_5858 ) ( not ( = ?auto_5861 ?auto_5859 ) ) ( OBJ-AT ?auto_5859 ?auto_5863 ) ( TRUCK-AT ?auto_5862 ?auto_5858 ) ( OBJ-AT ?auto_5860 ?auto_5858 ) ( not ( = ?auto_5859 ?auto_5860 ) ) ( not ( = ?auto_5860 ?auto_5861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5861 ?auto_5859 ?auto_5858 )
      ( DELIVER-3PKG-VERIFY ?auto_5859 ?auto_5860 ?auto_5861 ?auto_5858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5866 - OBJ
      ?auto_5867 - OBJ
      ?auto_5868 - OBJ
      ?auto_5865 - LOCATION
    )
    :vars
    (
      ?auto_5871 - LOCATION
      ?auto_5872 - CITY
      ?auto_5869 - OBJ
      ?auto_5870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5871 ?auto_5872 ) ( IN-CITY ?auto_5865 ?auto_5872 ) ( not ( = ?auto_5865 ?auto_5871 ) ) ( OBJ-AT ?auto_5869 ?auto_5865 ) ( not ( = ?auto_5869 ?auto_5866 ) ) ( OBJ-AT ?auto_5866 ?auto_5871 ) ( TRUCK-AT ?auto_5870 ?auto_5865 ) ( OBJ-AT ?auto_5867 ?auto_5865 ) ( OBJ-AT ?auto_5868 ?auto_5865 ) ( not ( = ?auto_5866 ?auto_5867 ) ) ( not ( = ?auto_5866 ?auto_5868 ) ) ( not ( = ?auto_5867 ?auto_5868 ) ) ( not ( = ?auto_5867 ?auto_5869 ) ) ( not ( = ?auto_5868 ?auto_5869 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5869 ?auto_5866 ?auto_5865 )
      ( DELIVER-3PKG-VERIFY ?auto_5866 ?auto_5867 ?auto_5868 ?auto_5865 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5905 - OBJ
      ?auto_5904 - LOCATION
    )
    :vars
    (
      ?auto_5908 - LOCATION
      ?auto_5909 - CITY
      ?auto_5906 - OBJ
      ?auto_5907 - TRUCK
      ?auto_5910 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5908 ?auto_5909 ) ( IN-CITY ?auto_5904 ?auto_5909 ) ( not ( = ?auto_5904 ?auto_5908 ) ) ( OBJ-AT ?auto_5906 ?auto_5904 ) ( not ( = ?auto_5906 ?auto_5905 ) ) ( OBJ-AT ?auto_5905 ?auto_5908 ) ( TRUCK-AT ?auto_5907 ?auto_5904 ) ( IN-TRUCK ?auto_5910 ?auto_5907 ) ( not ( = ?auto_5906 ?auto_5910 ) ) ( not ( = ?auto_5905 ?auto_5910 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5906 ?auto_5910 ?auto_5904 )
      ( DELIVER-2PKG ?auto_5906 ?auto_5905 ?auto_5904 )
      ( DELIVER-1PKG-VERIFY ?auto_5905 ?auto_5904 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5912 - OBJ
      ?auto_5913 - OBJ
      ?auto_5911 - LOCATION
    )
    :vars
    (
      ?auto_5917 - LOCATION
      ?auto_5916 - CITY
      ?auto_5914 - TRUCK
      ?auto_5915 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5917 ?auto_5916 ) ( IN-CITY ?auto_5911 ?auto_5916 ) ( not ( = ?auto_5911 ?auto_5917 ) ) ( OBJ-AT ?auto_5912 ?auto_5911 ) ( not ( = ?auto_5912 ?auto_5913 ) ) ( OBJ-AT ?auto_5913 ?auto_5917 ) ( TRUCK-AT ?auto_5914 ?auto_5911 ) ( IN-TRUCK ?auto_5915 ?auto_5914 ) ( not ( = ?auto_5912 ?auto_5915 ) ) ( not ( = ?auto_5913 ?auto_5915 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5913 ?auto_5911 )
      ( DELIVER-2PKG-VERIFY ?auto_5912 ?auto_5913 ?auto_5911 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5919 - OBJ
      ?auto_5920 - OBJ
      ?auto_5918 - LOCATION
    )
    :vars
    (
      ?auto_5924 - LOCATION
      ?auto_5922 - CITY
      ?auto_5923 - OBJ
      ?auto_5921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5924 ?auto_5922 ) ( IN-CITY ?auto_5918 ?auto_5922 ) ( not ( = ?auto_5918 ?auto_5924 ) ) ( OBJ-AT ?auto_5923 ?auto_5918 ) ( not ( = ?auto_5923 ?auto_5920 ) ) ( OBJ-AT ?auto_5920 ?auto_5924 ) ( TRUCK-AT ?auto_5921 ?auto_5918 ) ( IN-TRUCK ?auto_5919 ?auto_5921 ) ( not ( = ?auto_5923 ?auto_5919 ) ) ( not ( = ?auto_5920 ?auto_5919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5923 ?auto_5920 ?auto_5918 )
      ( DELIVER-2PKG-VERIFY ?auto_5919 ?auto_5920 ?auto_5918 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5926 - OBJ
      ?auto_5927 - OBJ
      ?auto_5925 - LOCATION
    )
    :vars
    (
      ?auto_5931 - LOCATION
      ?auto_5930 - CITY
      ?auto_5929 - TRUCK
      ?auto_5928 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5931 ?auto_5930 ) ( IN-CITY ?auto_5925 ?auto_5930 ) ( not ( = ?auto_5925 ?auto_5931 ) ) ( OBJ-AT ?auto_5927 ?auto_5925 ) ( not ( = ?auto_5927 ?auto_5926 ) ) ( OBJ-AT ?auto_5926 ?auto_5931 ) ( TRUCK-AT ?auto_5929 ?auto_5925 ) ( IN-TRUCK ?auto_5928 ?auto_5929 ) ( not ( = ?auto_5927 ?auto_5928 ) ) ( not ( = ?auto_5926 ?auto_5928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5927 ?auto_5926 ?auto_5925 )
      ( DELIVER-2PKG-VERIFY ?auto_5926 ?auto_5927 ?auto_5925 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5933 - OBJ
      ?auto_5934 - OBJ
      ?auto_5932 - LOCATION
    )
    :vars
    (
      ?auto_5938 - LOCATION
      ?auto_5936 - CITY
      ?auto_5937 - OBJ
      ?auto_5935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5938 ?auto_5936 ) ( IN-CITY ?auto_5932 ?auto_5936 ) ( not ( = ?auto_5932 ?auto_5938 ) ) ( OBJ-AT ?auto_5937 ?auto_5932 ) ( not ( = ?auto_5937 ?auto_5933 ) ) ( OBJ-AT ?auto_5933 ?auto_5938 ) ( TRUCK-AT ?auto_5935 ?auto_5932 ) ( IN-TRUCK ?auto_5934 ?auto_5935 ) ( not ( = ?auto_5937 ?auto_5934 ) ) ( not ( = ?auto_5933 ?auto_5934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5937 ?auto_5933 ?auto_5932 )
      ( DELIVER-2PKG-VERIFY ?auto_5933 ?auto_5934 ?auto_5932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5948 - OBJ
      ?auto_5949 - OBJ
      ?auto_5950 - OBJ
      ?auto_5947 - LOCATION
    )
    :vars
    (
      ?auto_5954 - LOCATION
      ?auto_5953 - CITY
      ?auto_5952 - TRUCK
      ?auto_5951 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5954 ?auto_5953 ) ( IN-CITY ?auto_5947 ?auto_5953 ) ( not ( = ?auto_5947 ?auto_5954 ) ) ( OBJ-AT ?auto_5948 ?auto_5947 ) ( not ( = ?auto_5948 ?auto_5950 ) ) ( OBJ-AT ?auto_5950 ?auto_5954 ) ( TRUCK-AT ?auto_5952 ?auto_5947 ) ( IN-TRUCK ?auto_5951 ?auto_5952 ) ( not ( = ?auto_5948 ?auto_5951 ) ) ( not ( = ?auto_5950 ?auto_5951 ) ) ( OBJ-AT ?auto_5949 ?auto_5947 ) ( not ( = ?auto_5948 ?auto_5949 ) ) ( not ( = ?auto_5949 ?auto_5950 ) ) ( not ( = ?auto_5949 ?auto_5951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5948 ?auto_5950 ?auto_5947 )
      ( DELIVER-3PKG-VERIFY ?auto_5948 ?auto_5949 ?auto_5950 ?auto_5947 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5956 - OBJ
      ?auto_5957 - OBJ
      ?auto_5958 - OBJ
      ?auto_5955 - LOCATION
    )
    :vars
    (
      ?auto_5961 - LOCATION
      ?auto_5960 - CITY
      ?auto_5959 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5961 ?auto_5960 ) ( IN-CITY ?auto_5955 ?auto_5960 ) ( not ( = ?auto_5955 ?auto_5961 ) ) ( OBJ-AT ?auto_5956 ?auto_5955 ) ( not ( = ?auto_5956 ?auto_5958 ) ) ( OBJ-AT ?auto_5958 ?auto_5961 ) ( TRUCK-AT ?auto_5959 ?auto_5955 ) ( IN-TRUCK ?auto_5957 ?auto_5959 ) ( not ( = ?auto_5956 ?auto_5957 ) ) ( not ( = ?auto_5958 ?auto_5957 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5956 ?auto_5958 ?auto_5955 )
      ( DELIVER-3PKG-VERIFY ?auto_5956 ?auto_5957 ?auto_5958 ?auto_5955 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5963 - OBJ
      ?auto_5964 - OBJ
      ?auto_5965 - OBJ
      ?auto_5962 - LOCATION
    )
    :vars
    (
      ?auto_5969 - LOCATION
      ?auto_5968 - CITY
      ?auto_5967 - TRUCK
      ?auto_5966 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5969 ?auto_5968 ) ( IN-CITY ?auto_5962 ?auto_5968 ) ( not ( = ?auto_5962 ?auto_5969 ) ) ( OBJ-AT ?auto_5965 ?auto_5962 ) ( not ( = ?auto_5965 ?auto_5964 ) ) ( OBJ-AT ?auto_5964 ?auto_5969 ) ( TRUCK-AT ?auto_5967 ?auto_5962 ) ( IN-TRUCK ?auto_5966 ?auto_5967 ) ( not ( = ?auto_5965 ?auto_5966 ) ) ( not ( = ?auto_5964 ?auto_5966 ) ) ( OBJ-AT ?auto_5963 ?auto_5962 ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5965 ) ) ( not ( = ?auto_5963 ?auto_5966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5965 ?auto_5964 ?auto_5962 )
      ( DELIVER-3PKG-VERIFY ?auto_5963 ?auto_5964 ?auto_5965 ?auto_5962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5971 - OBJ
      ?auto_5972 - OBJ
      ?auto_5973 - OBJ
      ?auto_5970 - LOCATION
    )
    :vars
    (
      ?auto_5976 - LOCATION
      ?auto_5975 - CITY
      ?auto_5974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5976 ?auto_5975 ) ( IN-CITY ?auto_5970 ?auto_5975 ) ( not ( = ?auto_5970 ?auto_5976 ) ) ( OBJ-AT ?auto_5971 ?auto_5970 ) ( not ( = ?auto_5971 ?auto_5972 ) ) ( OBJ-AT ?auto_5972 ?auto_5976 ) ( TRUCK-AT ?auto_5974 ?auto_5970 ) ( IN-TRUCK ?auto_5973 ?auto_5974 ) ( not ( = ?auto_5971 ?auto_5973 ) ) ( not ( = ?auto_5972 ?auto_5973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5971 ?auto_5972 ?auto_5970 )
      ( DELIVER-3PKG-VERIFY ?auto_5971 ?auto_5972 ?auto_5973 ?auto_5970 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5986 - OBJ
      ?auto_5987 - OBJ
      ?auto_5988 - OBJ
      ?auto_5985 - LOCATION
    )
    :vars
    (
      ?auto_5991 - LOCATION
      ?auto_5990 - CITY
      ?auto_5989 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5991 ?auto_5990 ) ( IN-CITY ?auto_5985 ?auto_5990 ) ( not ( = ?auto_5985 ?auto_5991 ) ) ( OBJ-AT ?auto_5987 ?auto_5985 ) ( not ( = ?auto_5987 ?auto_5988 ) ) ( OBJ-AT ?auto_5988 ?auto_5991 ) ( TRUCK-AT ?auto_5989 ?auto_5985 ) ( IN-TRUCK ?auto_5986 ?auto_5989 ) ( not ( = ?auto_5987 ?auto_5986 ) ) ( not ( = ?auto_5988 ?auto_5986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5987 ?auto_5988 ?auto_5985 )
      ( DELIVER-3PKG-VERIFY ?auto_5986 ?auto_5987 ?auto_5988 ?auto_5985 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6001 - OBJ
      ?auto_6002 - OBJ
      ?auto_6003 - OBJ
      ?auto_6000 - LOCATION
    )
    :vars
    (
      ?auto_6006 - LOCATION
      ?auto_6005 - CITY
      ?auto_6004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6006 ?auto_6005 ) ( IN-CITY ?auto_6000 ?auto_6005 ) ( not ( = ?auto_6000 ?auto_6006 ) ) ( OBJ-AT ?auto_6003 ?auto_6000 ) ( not ( = ?auto_6003 ?auto_6002 ) ) ( OBJ-AT ?auto_6002 ?auto_6006 ) ( TRUCK-AT ?auto_6004 ?auto_6000 ) ( IN-TRUCK ?auto_6001 ?auto_6004 ) ( not ( = ?auto_6003 ?auto_6001 ) ) ( not ( = ?auto_6002 ?auto_6001 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6003 ?auto_6002 ?auto_6000 )
      ( DELIVER-3PKG-VERIFY ?auto_6001 ?auto_6002 ?auto_6003 ?auto_6000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6024 - OBJ
      ?auto_6025 - OBJ
      ?auto_6026 - OBJ
      ?auto_6023 - LOCATION
    )
    :vars
    (
      ?auto_6030 - LOCATION
      ?auto_6029 - CITY
      ?auto_6028 - TRUCK
      ?auto_6027 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_6030 ?auto_6029 ) ( IN-CITY ?auto_6023 ?auto_6029 ) ( not ( = ?auto_6023 ?auto_6030 ) ) ( OBJ-AT ?auto_6025 ?auto_6023 ) ( not ( = ?auto_6025 ?auto_6024 ) ) ( OBJ-AT ?auto_6024 ?auto_6030 ) ( TRUCK-AT ?auto_6028 ?auto_6023 ) ( IN-TRUCK ?auto_6027 ?auto_6028 ) ( not ( = ?auto_6025 ?auto_6027 ) ) ( not ( = ?auto_6024 ?auto_6027 ) ) ( OBJ-AT ?auto_6026 ?auto_6023 ) ( not ( = ?auto_6024 ?auto_6026 ) ) ( not ( = ?auto_6025 ?auto_6026 ) ) ( not ( = ?auto_6026 ?auto_6027 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6025 ?auto_6024 ?auto_6023 )
      ( DELIVER-3PKG-VERIFY ?auto_6024 ?auto_6025 ?auto_6026 ?auto_6023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6032 - OBJ
      ?auto_6033 - OBJ
      ?auto_6034 - OBJ
      ?auto_6031 - LOCATION
    )
    :vars
    (
      ?auto_6037 - LOCATION
      ?auto_6036 - CITY
      ?auto_6035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6037 ?auto_6036 ) ( IN-CITY ?auto_6031 ?auto_6036 ) ( not ( = ?auto_6031 ?auto_6037 ) ) ( OBJ-AT ?auto_6033 ?auto_6031 ) ( not ( = ?auto_6033 ?auto_6032 ) ) ( OBJ-AT ?auto_6032 ?auto_6037 ) ( TRUCK-AT ?auto_6035 ?auto_6031 ) ( IN-TRUCK ?auto_6034 ?auto_6035 ) ( not ( = ?auto_6033 ?auto_6034 ) ) ( not ( = ?auto_6032 ?auto_6034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6033 ?auto_6032 ?auto_6031 )
      ( DELIVER-3PKG-VERIFY ?auto_6032 ?auto_6033 ?auto_6034 ?auto_6031 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6047 - OBJ
      ?auto_6048 - OBJ
      ?auto_6049 - OBJ
      ?auto_6046 - LOCATION
    )
    :vars
    (
      ?auto_6052 - LOCATION
      ?auto_6051 - CITY
      ?auto_6050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6052 ?auto_6051 ) ( IN-CITY ?auto_6046 ?auto_6051 ) ( not ( = ?auto_6046 ?auto_6052 ) ) ( OBJ-AT ?auto_6049 ?auto_6046 ) ( not ( = ?auto_6049 ?auto_6047 ) ) ( OBJ-AT ?auto_6047 ?auto_6052 ) ( TRUCK-AT ?auto_6050 ?auto_6046 ) ( IN-TRUCK ?auto_6048 ?auto_6050 ) ( not ( = ?auto_6049 ?auto_6048 ) ) ( not ( = ?auto_6047 ?auto_6048 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6049 ?auto_6047 ?auto_6046 )
      ( DELIVER-3PKG-VERIFY ?auto_6047 ?auto_6048 ?auto_6049 ?auto_6046 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6095 - OBJ
      ?auto_6094 - LOCATION
    )
    :vars
    (
      ?auto_6100 - LOCATION
      ?auto_6098 - CITY
      ?auto_6099 - OBJ
      ?auto_6096 - OBJ
      ?auto_6097 - TRUCK
      ?auto_6101 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6100 ?auto_6098 ) ( IN-CITY ?auto_6094 ?auto_6098 ) ( not ( = ?auto_6094 ?auto_6100 ) ) ( OBJ-AT ?auto_6099 ?auto_6094 ) ( not ( = ?auto_6099 ?auto_6095 ) ) ( OBJ-AT ?auto_6095 ?auto_6100 ) ( IN-TRUCK ?auto_6096 ?auto_6097 ) ( not ( = ?auto_6099 ?auto_6096 ) ) ( not ( = ?auto_6095 ?auto_6096 ) ) ( TRUCK-AT ?auto_6097 ?auto_6101 ) ( IN-CITY ?auto_6101 ?auto_6098 ) ( not ( = ?auto_6094 ?auto_6101 ) ) ( not ( = ?auto_6100 ?auto_6101 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6097 ?auto_6101 ?auto_6094 ?auto_6098 )
      ( DELIVER-2PKG ?auto_6099 ?auto_6095 ?auto_6094 )
      ( DELIVER-1PKG-VERIFY ?auto_6095 ?auto_6094 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6103 - OBJ
      ?auto_6104 - OBJ
      ?auto_6102 - LOCATION
    )
    :vars
    (
      ?auto_6109 - LOCATION
      ?auto_6108 - CITY
      ?auto_6106 - OBJ
      ?auto_6105 - TRUCK
      ?auto_6107 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6109 ?auto_6108 ) ( IN-CITY ?auto_6102 ?auto_6108 ) ( not ( = ?auto_6102 ?auto_6109 ) ) ( OBJ-AT ?auto_6103 ?auto_6102 ) ( not ( = ?auto_6103 ?auto_6104 ) ) ( OBJ-AT ?auto_6104 ?auto_6109 ) ( IN-TRUCK ?auto_6106 ?auto_6105 ) ( not ( = ?auto_6103 ?auto_6106 ) ) ( not ( = ?auto_6104 ?auto_6106 ) ) ( TRUCK-AT ?auto_6105 ?auto_6107 ) ( IN-CITY ?auto_6107 ?auto_6108 ) ( not ( = ?auto_6102 ?auto_6107 ) ) ( not ( = ?auto_6109 ?auto_6107 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6104 ?auto_6102 )
      ( DELIVER-2PKG-VERIFY ?auto_6103 ?auto_6104 ?auto_6102 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6111 - OBJ
      ?auto_6112 - OBJ
      ?auto_6110 - LOCATION
    )
    :vars
    (
      ?auto_6115 - LOCATION
      ?auto_6113 - CITY
      ?auto_6116 - OBJ
      ?auto_6117 - TRUCK
      ?auto_6114 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6115 ?auto_6113 ) ( IN-CITY ?auto_6110 ?auto_6113 ) ( not ( = ?auto_6110 ?auto_6115 ) ) ( OBJ-AT ?auto_6116 ?auto_6110 ) ( not ( = ?auto_6116 ?auto_6112 ) ) ( OBJ-AT ?auto_6112 ?auto_6115 ) ( IN-TRUCK ?auto_6111 ?auto_6117 ) ( not ( = ?auto_6116 ?auto_6111 ) ) ( not ( = ?auto_6112 ?auto_6111 ) ) ( TRUCK-AT ?auto_6117 ?auto_6114 ) ( IN-CITY ?auto_6114 ?auto_6113 ) ( not ( = ?auto_6110 ?auto_6114 ) ) ( not ( = ?auto_6115 ?auto_6114 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6116 ?auto_6112 ?auto_6110 )
      ( DELIVER-2PKG-VERIFY ?auto_6111 ?auto_6112 ?auto_6110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6119 - OBJ
      ?auto_6120 - OBJ
      ?auto_6118 - LOCATION
    )
    :vars
    (
      ?auto_6124 - LOCATION
      ?auto_6122 - CITY
      ?auto_6121 - OBJ
      ?auto_6125 - TRUCK
      ?auto_6123 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6124 ?auto_6122 ) ( IN-CITY ?auto_6118 ?auto_6122 ) ( not ( = ?auto_6118 ?auto_6124 ) ) ( OBJ-AT ?auto_6120 ?auto_6118 ) ( not ( = ?auto_6120 ?auto_6119 ) ) ( OBJ-AT ?auto_6119 ?auto_6124 ) ( IN-TRUCK ?auto_6121 ?auto_6125 ) ( not ( = ?auto_6120 ?auto_6121 ) ) ( not ( = ?auto_6119 ?auto_6121 ) ) ( TRUCK-AT ?auto_6125 ?auto_6123 ) ( IN-CITY ?auto_6123 ?auto_6122 ) ( not ( = ?auto_6118 ?auto_6123 ) ) ( not ( = ?auto_6124 ?auto_6123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6120 ?auto_6119 ?auto_6118 )
      ( DELIVER-2PKG-VERIFY ?auto_6119 ?auto_6120 ?auto_6118 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6127 - OBJ
      ?auto_6128 - OBJ
      ?auto_6126 - LOCATION
    )
    :vars
    (
      ?auto_6131 - LOCATION
      ?auto_6129 - CITY
      ?auto_6132 - OBJ
      ?auto_6133 - TRUCK
      ?auto_6130 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6131 ?auto_6129 ) ( IN-CITY ?auto_6126 ?auto_6129 ) ( not ( = ?auto_6126 ?auto_6131 ) ) ( OBJ-AT ?auto_6132 ?auto_6126 ) ( not ( = ?auto_6132 ?auto_6127 ) ) ( OBJ-AT ?auto_6127 ?auto_6131 ) ( IN-TRUCK ?auto_6128 ?auto_6133 ) ( not ( = ?auto_6132 ?auto_6128 ) ) ( not ( = ?auto_6127 ?auto_6128 ) ) ( TRUCK-AT ?auto_6133 ?auto_6130 ) ( IN-CITY ?auto_6130 ?auto_6129 ) ( not ( = ?auto_6126 ?auto_6130 ) ) ( not ( = ?auto_6131 ?auto_6130 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6132 ?auto_6127 ?auto_6126 )
      ( DELIVER-2PKG-VERIFY ?auto_6127 ?auto_6128 ?auto_6126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6144 - OBJ
      ?auto_6145 - OBJ
      ?auto_6146 - OBJ
      ?auto_6143 - LOCATION
    )
    :vars
    (
      ?auto_6150 - LOCATION
      ?auto_6148 - CITY
      ?auto_6147 - OBJ
      ?auto_6151 - TRUCK
      ?auto_6149 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6150 ?auto_6148 ) ( IN-CITY ?auto_6143 ?auto_6148 ) ( not ( = ?auto_6143 ?auto_6150 ) ) ( OBJ-AT ?auto_6145 ?auto_6143 ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( OBJ-AT ?auto_6146 ?auto_6150 ) ( IN-TRUCK ?auto_6147 ?auto_6151 ) ( not ( = ?auto_6145 ?auto_6147 ) ) ( not ( = ?auto_6146 ?auto_6147 ) ) ( TRUCK-AT ?auto_6151 ?auto_6149 ) ( IN-CITY ?auto_6149 ?auto_6148 ) ( not ( = ?auto_6143 ?auto_6149 ) ) ( not ( = ?auto_6150 ?auto_6149 ) ) ( OBJ-AT ?auto_6144 ?auto_6143 ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( not ( = ?auto_6144 ?auto_6146 ) ) ( not ( = ?auto_6144 ?auto_6147 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6145 ?auto_6146 ?auto_6143 )
      ( DELIVER-3PKG-VERIFY ?auto_6144 ?auto_6145 ?auto_6146 ?auto_6143 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6153 - OBJ
      ?auto_6154 - OBJ
      ?auto_6155 - OBJ
      ?auto_6152 - LOCATION
    )
    :vars
    (
      ?auto_6158 - LOCATION
      ?auto_6156 - CITY
      ?auto_6159 - TRUCK
      ?auto_6157 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6158 ?auto_6156 ) ( IN-CITY ?auto_6152 ?auto_6156 ) ( not ( = ?auto_6152 ?auto_6158 ) ) ( OBJ-AT ?auto_6153 ?auto_6152 ) ( not ( = ?auto_6153 ?auto_6155 ) ) ( OBJ-AT ?auto_6155 ?auto_6158 ) ( IN-TRUCK ?auto_6154 ?auto_6159 ) ( not ( = ?auto_6153 ?auto_6154 ) ) ( not ( = ?auto_6155 ?auto_6154 ) ) ( TRUCK-AT ?auto_6159 ?auto_6157 ) ( IN-CITY ?auto_6157 ?auto_6156 ) ( not ( = ?auto_6152 ?auto_6157 ) ) ( not ( = ?auto_6158 ?auto_6157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6153 ?auto_6155 ?auto_6152 )
      ( DELIVER-3PKG-VERIFY ?auto_6153 ?auto_6154 ?auto_6155 ?auto_6152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6161 - OBJ
      ?auto_6162 - OBJ
      ?auto_6163 - OBJ
      ?auto_6160 - LOCATION
    )
    :vars
    (
      ?auto_6167 - LOCATION
      ?auto_6165 - CITY
      ?auto_6164 - OBJ
      ?auto_6168 - TRUCK
      ?auto_6166 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6167 ?auto_6165 ) ( IN-CITY ?auto_6160 ?auto_6165 ) ( not ( = ?auto_6160 ?auto_6167 ) ) ( OBJ-AT ?auto_6163 ?auto_6160 ) ( not ( = ?auto_6163 ?auto_6162 ) ) ( OBJ-AT ?auto_6162 ?auto_6167 ) ( IN-TRUCK ?auto_6164 ?auto_6168 ) ( not ( = ?auto_6163 ?auto_6164 ) ) ( not ( = ?auto_6162 ?auto_6164 ) ) ( TRUCK-AT ?auto_6168 ?auto_6166 ) ( IN-CITY ?auto_6166 ?auto_6165 ) ( not ( = ?auto_6160 ?auto_6166 ) ) ( not ( = ?auto_6167 ?auto_6166 ) ) ( OBJ-AT ?auto_6161 ?auto_6160 ) ( not ( = ?auto_6161 ?auto_6162 ) ) ( not ( = ?auto_6161 ?auto_6163 ) ) ( not ( = ?auto_6161 ?auto_6164 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6163 ?auto_6162 ?auto_6160 )
      ( DELIVER-3PKG-VERIFY ?auto_6161 ?auto_6162 ?auto_6163 ?auto_6160 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6170 - OBJ
      ?auto_6171 - OBJ
      ?auto_6172 - OBJ
      ?auto_6169 - LOCATION
    )
    :vars
    (
      ?auto_6175 - LOCATION
      ?auto_6173 - CITY
      ?auto_6176 - TRUCK
      ?auto_6174 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6175 ?auto_6173 ) ( IN-CITY ?auto_6169 ?auto_6173 ) ( not ( = ?auto_6169 ?auto_6175 ) ) ( OBJ-AT ?auto_6170 ?auto_6169 ) ( not ( = ?auto_6170 ?auto_6171 ) ) ( OBJ-AT ?auto_6171 ?auto_6175 ) ( IN-TRUCK ?auto_6172 ?auto_6176 ) ( not ( = ?auto_6170 ?auto_6172 ) ) ( not ( = ?auto_6171 ?auto_6172 ) ) ( TRUCK-AT ?auto_6176 ?auto_6174 ) ( IN-CITY ?auto_6174 ?auto_6173 ) ( not ( = ?auto_6169 ?auto_6174 ) ) ( not ( = ?auto_6175 ?auto_6174 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6170 ?auto_6171 ?auto_6169 )
      ( DELIVER-3PKG-VERIFY ?auto_6170 ?auto_6171 ?auto_6172 ?auto_6169 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6187 - OBJ
      ?auto_6188 - OBJ
      ?auto_6189 - OBJ
      ?auto_6186 - LOCATION
    )
    :vars
    (
      ?auto_6192 - LOCATION
      ?auto_6190 - CITY
      ?auto_6193 - TRUCK
      ?auto_6191 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6192 ?auto_6190 ) ( IN-CITY ?auto_6186 ?auto_6190 ) ( not ( = ?auto_6186 ?auto_6192 ) ) ( OBJ-AT ?auto_6188 ?auto_6186 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( OBJ-AT ?auto_6189 ?auto_6192 ) ( IN-TRUCK ?auto_6187 ?auto_6193 ) ( not ( = ?auto_6188 ?auto_6187 ) ) ( not ( = ?auto_6189 ?auto_6187 ) ) ( TRUCK-AT ?auto_6193 ?auto_6191 ) ( IN-CITY ?auto_6191 ?auto_6190 ) ( not ( = ?auto_6186 ?auto_6191 ) ) ( not ( = ?auto_6192 ?auto_6191 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6188 ?auto_6189 ?auto_6186 )
      ( DELIVER-3PKG-VERIFY ?auto_6187 ?auto_6188 ?auto_6189 ?auto_6186 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6204 - OBJ
      ?auto_6205 - OBJ
      ?auto_6206 - OBJ
      ?auto_6203 - LOCATION
    )
    :vars
    (
      ?auto_6209 - LOCATION
      ?auto_6207 - CITY
      ?auto_6210 - TRUCK
      ?auto_6208 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6209 ?auto_6207 ) ( IN-CITY ?auto_6203 ?auto_6207 ) ( not ( = ?auto_6203 ?auto_6209 ) ) ( OBJ-AT ?auto_6206 ?auto_6203 ) ( not ( = ?auto_6206 ?auto_6205 ) ) ( OBJ-AT ?auto_6205 ?auto_6209 ) ( IN-TRUCK ?auto_6204 ?auto_6210 ) ( not ( = ?auto_6206 ?auto_6204 ) ) ( not ( = ?auto_6205 ?auto_6204 ) ) ( TRUCK-AT ?auto_6210 ?auto_6208 ) ( IN-CITY ?auto_6208 ?auto_6207 ) ( not ( = ?auto_6203 ?auto_6208 ) ) ( not ( = ?auto_6209 ?auto_6208 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6206 ?auto_6205 ?auto_6203 )
      ( DELIVER-3PKG-VERIFY ?auto_6204 ?auto_6205 ?auto_6206 ?auto_6203 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6230 - OBJ
      ?auto_6231 - OBJ
      ?auto_6232 - OBJ
      ?auto_6229 - LOCATION
    )
    :vars
    (
      ?auto_6236 - LOCATION
      ?auto_6234 - CITY
      ?auto_6233 - OBJ
      ?auto_6237 - TRUCK
      ?auto_6235 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6236 ?auto_6234 ) ( IN-CITY ?auto_6229 ?auto_6234 ) ( not ( = ?auto_6229 ?auto_6236 ) ) ( OBJ-AT ?auto_6232 ?auto_6229 ) ( not ( = ?auto_6232 ?auto_6230 ) ) ( OBJ-AT ?auto_6230 ?auto_6236 ) ( IN-TRUCK ?auto_6233 ?auto_6237 ) ( not ( = ?auto_6232 ?auto_6233 ) ) ( not ( = ?auto_6230 ?auto_6233 ) ) ( TRUCK-AT ?auto_6237 ?auto_6235 ) ( IN-CITY ?auto_6235 ?auto_6234 ) ( not ( = ?auto_6229 ?auto_6235 ) ) ( not ( = ?auto_6236 ?auto_6235 ) ) ( OBJ-AT ?auto_6231 ?auto_6229 ) ( not ( = ?auto_6230 ?auto_6231 ) ) ( not ( = ?auto_6231 ?auto_6232 ) ) ( not ( = ?auto_6231 ?auto_6233 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6232 ?auto_6230 ?auto_6229 )
      ( DELIVER-3PKG-VERIFY ?auto_6230 ?auto_6231 ?auto_6232 ?auto_6229 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6239 - OBJ
      ?auto_6240 - OBJ
      ?auto_6241 - OBJ
      ?auto_6238 - LOCATION
    )
    :vars
    (
      ?auto_6244 - LOCATION
      ?auto_6242 - CITY
      ?auto_6245 - TRUCK
      ?auto_6243 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6244 ?auto_6242 ) ( IN-CITY ?auto_6238 ?auto_6242 ) ( not ( = ?auto_6238 ?auto_6244 ) ) ( OBJ-AT ?auto_6240 ?auto_6238 ) ( not ( = ?auto_6240 ?auto_6239 ) ) ( OBJ-AT ?auto_6239 ?auto_6244 ) ( IN-TRUCK ?auto_6241 ?auto_6245 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( not ( = ?auto_6239 ?auto_6241 ) ) ( TRUCK-AT ?auto_6245 ?auto_6243 ) ( IN-CITY ?auto_6243 ?auto_6242 ) ( not ( = ?auto_6238 ?auto_6243 ) ) ( not ( = ?auto_6244 ?auto_6243 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6240 ?auto_6239 ?auto_6238 )
      ( DELIVER-3PKG-VERIFY ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6256 - OBJ
      ?auto_6257 - OBJ
      ?auto_6258 - OBJ
      ?auto_6255 - LOCATION
    )
    :vars
    (
      ?auto_6261 - LOCATION
      ?auto_6259 - CITY
      ?auto_6262 - TRUCK
      ?auto_6260 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6261 ?auto_6259 ) ( IN-CITY ?auto_6255 ?auto_6259 ) ( not ( = ?auto_6255 ?auto_6261 ) ) ( OBJ-AT ?auto_6258 ?auto_6255 ) ( not ( = ?auto_6258 ?auto_6256 ) ) ( OBJ-AT ?auto_6256 ?auto_6261 ) ( IN-TRUCK ?auto_6257 ?auto_6262 ) ( not ( = ?auto_6258 ?auto_6257 ) ) ( not ( = ?auto_6256 ?auto_6257 ) ) ( TRUCK-AT ?auto_6262 ?auto_6260 ) ( IN-CITY ?auto_6260 ?auto_6259 ) ( not ( = ?auto_6255 ?auto_6260 ) ) ( not ( = ?auto_6261 ?auto_6260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6258 ?auto_6256 ?auto_6255 )
      ( DELIVER-3PKG-VERIFY ?auto_6256 ?auto_6257 ?auto_6258 ?auto_6255 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6310 - OBJ
      ?auto_6309 - LOCATION
    )
    :vars
    (
      ?auto_6314 - LOCATION
      ?auto_6312 - CITY
      ?auto_6315 - OBJ
      ?auto_6311 - OBJ
      ?auto_6316 - TRUCK
      ?auto_6313 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6314 ?auto_6312 ) ( IN-CITY ?auto_6309 ?auto_6312 ) ( not ( = ?auto_6309 ?auto_6314 ) ) ( OBJ-AT ?auto_6315 ?auto_6309 ) ( not ( = ?auto_6315 ?auto_6310 ) ) ( OBJ-AT ?auto_6310 ?auto_6314 ) ( not ( = ?auto_6315 ?auto_6311 ) ) ( not ( = ?auto_6310 ?auto_6311 ) ) ( TRUCK-AT ?auto_6316 ?auto_6313 ) ( IN-CITY ?auto_6313 ?auto_6312 ) ( not ( = ?auto_6309 ?auto_6313 ) ) ( not ( = ?auto_6314 ?auto_6313 ) ) ( OBJ-AT ?auto_6311 ?auto_6313 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6311 ?auto_6316 ?auto_6313 )
      ( DELIVER-2PKG ?auto_6315 ?auto_6310 ?auto_6309 )
      ( DELIVER-1PKG-VERIFY ?auto_6310 ?auto_6309 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6318 - OBJ
      ?auto_6319 - OBJ
      ?auto_6317 - LOCATION
    )
    :vars
    (
      ?auto_6322 - LOCATION
      ?auto_6320 - CITY
      ?auto_6324 - OBJ
      ?auto_6321 - TRUCK
      ?auto_6323 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6322 ?auto_6320 ) ( IN-CITY ?auto_6317 ?auto_6320 ) ( not ( = ?auto_6317 ?auto_6322 ) ) ( OBJ-AT ?auto_6318 ?auto_6317 ) ( not ( = ?auto_6318 ?auto_6319 ) ) ( OBJ-AT ?auto_6319 ?auto_6322 ) ( not ( = ?auto_6318 ?auto_6324 ) ) ( not ( = ?auto_6319 ?auto_6324 ) ) ( TRUCK-AT ?auto_6321 ?auto_6323 ) ( IN-CITY ?auto_6323 ?auto_6320 ) ( not ( = ?auto_6317 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6323 ) ) ( OBJ-AT ?auto_6324 ?auto_6323 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6319 ?auto_6317 )
      ( DELIVER-2PKG-VERIFY ?auto_6318 ?auto_6319 ?auto_6317 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6326 - OBJ
      ?auto_6327 - OBJ
      ?auto_6325 - LOCATION
    )
    :vars
    (
      ?auto_6330 - LOCATION
      ?auto_6331 - CITY
      ?auto_6328 - OBJ
      ?auto_6329 - TRUCK
      ?auto_6332 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6330 ?auto_6331 ) ( IN-CITY ?auto_6325 ?auto_6331 ) ( not ( = ?auto_6325 ?auto_6330 ) ) ( OBJ-AT ?auto_6328 ?auto_6325 ) ( not ( = ?auto_6328 ?auto_6327 ) ) ( OBJ-AT ?auto_6327 ?auto_6330 ) ( not ( = ?auto_6328 ?auto_6326 ) ) ( not ( = ?auto_6327 ?auto_6326 ) ) ( TRUCK-AT ?auto_6329 ?auto_6332 ) ( IN-CITY ?auto_6332 ?auto_6331 ) ( not ( = ?auto_6325 ?auto_6332 ) ) ( not ( = ?auto_6330 ?auto_6332 ) ) ( OBJ-AT ?auto_6326 ?auto_6332 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6328 ?auto_6327 ?auto_6325 )
      ( DELIVER-2PKG-VERIFY ?auto_6326 ?auto_6327 ?auto_6325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6334 - OBJ
      ?auto_6335 - OBJ
      ?auto_6333 - LOCATION
    )
    :vars
    (
      ?auto_6338 - LOCATION
      ?auto_6339 - CITY
      ?auto_6337 - OBJ
      ?auto_6336 - TRUCK
      ?auto_6340 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6338 ?auto_6339 ) ( IN-CITY ?auto_6333 ?auto_6339 ) ( not ( = ?auto_6333 ?auto_6338 ) ) ( OBJ-AT ?auto_6335 ?auto_6333 ) ( not ( = ?auto_6335 ?auto_6334 ) ) ( OBJ-AT ?auto_6334 ?auto_6338 ) ( not ( = ?auto_6335 ?auto_6337 ) ) ( not ( = ?auto_6334 ?auto_6337 ) ) ( TRUCK-AT ?auto_6336 ?auto_6340 ) ( IN-CITY ?auto_6340 ?auto_6339 ) ( not ( = ?auto_6333 ?auto_6340 ) ) ( not ( = ?auto_6338 ?auto_6340 ) ) ( OBJ-AT ?auto_6337 ?auto_6340 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6335 ?auto_6334 ?auto_6333 )
      ( DELIVER-2PKG-VERIFY ?auto_6334 ?auto_6335 ?auto_6333 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6342 - OBJ
      ?auto_6343 - OBJ
      ?auto_6341 - LOCATION
    )
    :vars
    (
      ?auto_6346 - LOCATION
      ?auto_6347 - CITY
      ?auto_6344 - OBJ
      ?auto_6345 - TRUCK
      ?auto_6348 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6346 ?auto_6347 ) ( IN-CITY ?auto_6341 ?auto_6347 ) ( not ( = ?auto_6341 ?auto_6346 ) ) ( OBJ-AT ?auto_6344 ?auto_6341 ) ( not ( = ?auto_6344 ?auto_6342 ) ) ( OBJ-AT ?auto_6342 ?auto_6346 ) ( not ( = ?auto_6344 ?auto_6343 ) ) ( not ( = ?auto_6342 ?auto_6343 ) ) ( TRUCK-AT ?auto_6345 ?auto_6348 ) ( IN-CITY ?auto_6348 ?auto_6347 ) ( not ( = ?auto_6341 ?auto_6348 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( OBJ-AT ?auto_6343 ?auto_6348 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6344 ?auto_6342 ?auto_6341 )
      ( DELIVER-2PKG-VERIFY ?auto_6342 ?auto_6343 ?auto_6341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6359 - OBJ
      ?auto_6360 - OBJ
      ?auto_6361 - OBJ
      ?auto_6358 - LOCATION
    )
    :vars
    (
      ?auto_6364 - LOCATION
      ?auto_6365 - CITY
      ?auto_6363 - OBJ
      ?auto_6362 - TRUCK
      ?auto_6366 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6364 ?auto_6365 ) ( IN-CITY ?auto_6358 ?auto_6365 ) ( not ( = ?auto_6358 ?auto_6364 ) ) ( OBJ-AT ?auto_6360 ?auto_6358 ) ( not ( = ?auto_6360 ?auto_6361 ) ) ( OBJ-AT ?auto_6361 ?auto_6364 ) ( not ( = ?auto_6360 ?auto_6363 ) ) ( not ( = ?auto_6361 ?auto_6363 ) ) ( TRUCK-AT ?auto_6362 ?auto_6366 ) ( IN-CITY ?auto_6366 ?auto_6365 ) ( not ( = ?auto_6358 ?auto_6366 ) ) ( not ( = ?auto_6364 ?auto_6366 ) ) ( OBJ-AT ?auto_6363 ?auto_6366 ) ( OBJ-AT ?auto_6359 ?auto_6358 ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( not ( = ?auto_6359 ?auto_6361 ) ) ( not ( = ?auto_6359 ?auto_6363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6360 ?auto_6361 ?auto_6358 )
      ( DELIVER-3PKG-VERIFY ?auto_6359 ?auto_6360 ?auto_6361 ?auto_6358 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6368 - OBJ
      ?auto_6369 - OBJ
      ?auto_6370 - OBJ
      ?auto_6367 - LOCATION
    )
    :vars
    (
      ?auto_6372 - LOCATION
      ?auto_6373 - CITY
      ?auto_6371 - TRUCK
      ?auto_6374 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6372 ?auto_6373 ) ( IN-CITY ?auto_6367 ?auto_6373 ) ( not ( = ?auto_6367 ?auto_6372 ) ) ( OBJ-AT ?auto_6368 ?auto_6367 ) ( not ( = ?auto_6368 ?auto_6370 ) ) ( OBJ-AT ?auto_6370 ?auto_6372 ) ( not ( = ?auto_6368 ?auto_6369 ) ) ( not ( = ?auto_6370 ?auto_6369 ) ) ( TRUCK-AT ?auto_6371 ?auto_6374 ) ( IN-CITY ?auto_6374 ?auto_6373 ) ( not ( = ?auto_6367 ?auto_6374 ) ) ( not ( = ?auto_6372 ?auto_6374 ) ) ( OBJ-AT ?auto_6369 ?auto_6374 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6368 ?auto_6370 ?auto_6367 )
      ( DELIVER-3PKG-VERIFY ?auto_6368 ?auto_6369 ?auto_6370 ?auto_6367 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6376 - OBJ
      ?auto_6377 - OBJ
      ?auto_6378 - OBJ
      ?auto_6375 - LOCATION
    )
    :vars
    (
      ?auto_6381 - LOCATION
      ?auto_6382 - CITY
      ?auto_6380 - OBJ
      ?auto_6379 - TRUCK
      ?auto_6383 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6381 ?auto_6382 ) ( IN-CITY ?auto_6375 ?auto_6382 ) ( not ( = ?auto_6375 ?auto_6381 ) ) ( OBJ-AT ?auto_6378 ?auto_6375 ) ( not ( = ?auto_6378 ?auto_6377 ) ) ( OBJ-AT ?auto_6377 ?auto_6381 ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( not ( = ?auto_6377 ?auto_6380 ) ) ( TRUCK-AT ?auto_6379 ?auto_6383 ) ( IN-CITY ?auto_6383 ?auto_6382 ) ( not ( = ?auto_6375 ?auto_6383 ) ) ( not ( = ?auto_6381 ?auto_6383 ) ) ( OBJ-AT ?auto_6380 ?auto_6383 ) ( OBJ-AT ?auto_6376 ?auto_6375 ) ( not ( = ?auto_6376 ?auto_6377 ) ) ( not ( = ?auto_6376 ?auto_6378 ) ) ( not ( = ?auto_6376 ?auto_6380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6378 ?auto_6377 ?auto_6375 )
      ( DELIVER-3PKG-VERIFY ?auto_6376 ?auto_6377 ?auto_6378 ?auto_6375 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6385 - OBJ
      ?auto_6386 - OBJ
      ?auto_6387 - OBJ
      ?auto_6384 - LOCATION
    )
    :vars
    (
      ?auto_6389 - LOCATION
      ?auto_6390 - CITY
      ?auto_6388 - TRUCK
      ?auto_6391 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6389 ?auto_6390 ) ( IN-CITY ?auto_6384 ?auto_6390 ) ( not ( = ?auto_6384 ?auto_6389 ) ) ( OBJ-AT ?auto_6385 ?auto_6384 ) ( not ( = ?auto_6385 ?auto_6386 ) ) ( OBJ-AT ?auto_6386 ?auto_6389 ) ( not ( = ?auto_6385 ?auto_6387 ) ) ( not ( = ?auto_6386 ?auto_6387 ) ) ( TRUCK-AT ?auto_6388 ?auto_6391 ) ( IN-CITY ?auto_6391 ?auto_6390 ) ( not ( = ?auto_6384 ?auto_6391 ) ) ( not ( = ?auto_6389 ?auto_6391 ) ) ( OBJ-AT ?auto_6387 ?auto_6391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6385 ?auto_6386 ?auto_6384 )
      ( DELIVER-3PKG-VERIFY ?auto_6385 ?auto_6386 ?auto_6387 ?auto_6384 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6402 - OBJ
      ?auto_6403 - OBJ
      ?auto_6404 - OBJ
      ?auto_6401 - LOCATION
    )
    :vars
    (
      ?auto_6406 - LOCATION
      ?auto_6407 - CITY
      ?auto_6405 - TRUCK
      ?auto_6408 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6406 ?auto_6407 ) ( IN-CITY ?auto_6401 ?auto_6407 ) ( not ( = ?auto_6401 ?auto_6406 ) ) ( OBJ-AT ?auto_6403 ?auto_6401 ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( OBJ-AT ?auto_6404 ?auto_6406 ) ( not ( = ?auto_6403 ?auto_6402 ) ) ( not ( = ?auto_6404 ?auto_6402 ) ) ( TRUCK-AT ?auto_6405 ?auto_6408 ) ( IN-CITY ?auto_6408 ?auto_6407 ) ( not ( = ?auto_6401 ?auto_6408 ) ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( OBJ-AT ?auto_6402 ?auto_6408 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6403 ?auto_6404 ?auto_6401 )
      ( DELIVER-3PKG-VERIFY ?auto_6402 ?auto_6403 ?auto_6404 ?auto_6401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6419 - OBJ
      ?auto_6420 - OBJ
      ?auto_6421 - OBJ
      ?auto_6418 - LOCATION
    )
    :vars
    (
      ?auto_6423 - LOCATION
      ?auto_6424 - CITY
      ?auto_6422 - TRUCK
      ?auto_6425 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6423 ?auto_6424 ) ( IN-CITY ?auto_6418 ?auto_6424 ) ( not ( = ?auto_6418 ?auto_6423 ) ) ( OBJ-AT ?auto_6421 ?auto_6418 ) ( not ( = ?auto_6421 ?auto_6420 ) ) ( OBJ-AT ?auto_6420 ?auto_6423 ) ( not ( = ?auto_6421 ?auto_6419 ) ) ( not ( = ?auto_6420 ?auto_6419 ) ) ( TRUCK-AT ?auto_6422 ?auto_6425 ) ( IN-CITY ?auto_6425 ?auto_6424 ) ( not ( = ?auto_6418 ?auto_6425 ) ) ( not ( = ?auto_6423 ?auto_6425 ) ) ( OBJ-AT ?auto_6419 ?auto_6425 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6421 ?auto_6420 ?auto_6418 )
      ( DELIVER-3PKG-VERIFY ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6418 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6445 - OBJ
      ?auto_6446 - OBJ
      ?auto_6447 - OBJ
      ?auto_6444 - LOCATION
    )
    :vars
    (
      ?auto_6450 - LOCATION
      ?auto_6451 - CITY
      ?auto_6449 - OBJ
      ?auto_6448 - TRUCK
      ?auto_6452 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6450 ?auto_6451 ) ( IN-CITY ?auto_6444 ?auto_6451 ) ( not ( = ?auto_6444 ?auto_6450 ) ) ( OBJ-AT ?auto_6447 ?auto_6444 ) ( not ( = ?auto_6447 ?auto_6445 ) ) ( OBJ-AT ?auto_6445 ?auto_6450 ) ( not ( = ?auto_6447 ?auto_6449 ) ) ( not ( = ?auto_6445 ?auto_6449 ) ) ( TRUCK-AT ?auto_6448 ?auto_6452 ) ( IN-CITY ?auto_6452 ?auto_6451 ) ( not ( = ?auto_6444 ?auto_6452 ) ) ( not ( = ?auto_6450 ?auto_6452 ) ) ( OBJ-AT ?auto_6449 ?auto_6452 ) ( OBJ-AT ?auto_6446 ?auto_6444 ) ( not ( = ?auto_6445 ?auto_6446 ) ) ( not ( = ?auto_6446 ?auto_6447 ) ) ( not ( = ?auto_6446 ?auto_6449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6447 ?auto_6445 ?auto_6444 )
      ( DELIVER-3PKG-VERIFY ?auto_6445 ?auto_6446 ?auto_6447 ?auto_6444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6454 - OBJ
      ?auto_6455 - OBJ
      ?auto_6456 - OBJ
      ?auto_6453 - LOCATION
    )
    :vars
    (
      ?auto_6458 - LOCATION
      ?auto_6459 - CITY
      ?auto_6457 - TRUCK
      ?auto_6460 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6458 ?auto_6459 ) ( IN-CITY ?auto_6453 ?auto_6459 ) ( not ( = ?auto_6453 ?auto_6458 ) ) ( OBJ-AT ?auto_6455 ?auto_6453 ) ( not ( = ?auto_6455 ?auto_6454 ) ) ( OBJ-AT ?auto_6454 ?auto_6458 ) ( not ( = ?auto_6455 ?auto_6456 ) ) ( not ( = ?auto_6454 ?auto_6456 ) ) ( TRUCK-AT ?auto_6457 ?auto_6460 ) ( IN-CITY ?auto_6460 ?auto_6459 ) ( not ( = ?auto_6453 ?auto_6460 ) ) ( not ( = ?auto_6458 ?auto_6460 ) ) ( OBJ-AT ?auto_6456 ?auto_6460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6455 ?auto_6454 ?auto_6453 )
      ( DELIVER-3PKG-VERIFY ?auto_6454 ?auto_6455 ?auto_6456 ?auto_6453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6471 - OBJ
      ?auto_6472 - OBJ
      ?auto_6473 - OBJ
      ?auto_6470 - LOCATION
    )
    :vars
    (
      ?auto_6475 - LOCATION
      ?auto_6476 - CITY
      ?auto_6474 - TRUCK
      ?auto_6477 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6475 ?auto_6476 ) ( IN-CITY ?auto_6470 ?auto_6476 ) ( not ( = ?auto_6470 ?auto_6475 ) ) ( OBJ-AT ?auto_6473 ?auto_6470 ) ( not ( = ?auto_6473 ?auto_6471 ) ) ( OBJ-AT ?auto_6471 ?auto_6475 ) ( not ( = ?auto_6473 ?auto_6472 ) ) ( not ( = ?auto_6471 ?auto_6472 ) ) ( TRUCK-AT ?auto_6474 ?auto_6477 ) ( IN-CITY ?auto_6477 ?auto_6476 ) ( not ( = ?auto_6470 ?auto_6477 ) ) ( not ( = ?auto_6475 ?auto_6477 ) ) ( OBJ-AT ?auto_6472 ?auto_6477 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6473 ?auto_6471 ?auto_6470 )
      ( DELIVER-3PKG-VERIFY ?auto_6471 ?auto_6472 ?auto_6473 ?auto_6470 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6525 - OBJ
      ?auto_6524 - LOCATION
    )
    :vars
    (
      ?auto_6529 - LOCATION
      ?auto_6530 - CITY
      ?auto_6526 - OBJ
      ?auto_6528 - OBJ
      ?auto_6531 - LOCATION
      ?auto_6527 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6529 ?auto_6530 ) ( IN-CITY ?auto_6524 ?auto_6530 ) ( not ( = ?auto_6524 ?auto_6529 ) ) ( OBJ-AT ?auto_6526 ?auto_6524 ) ( not ( = ?auto_6526 ?auto_6525 ) ) ( OBJ-AT ?auto_6525 ?auto_6529 ) ( not ( = ?auto_6526 ?auto_6528 ) ) ( not ( = ?auto_6525 ?auto_6528 ) ) ( IN-CITY ?auto_6531 ?auto_6530 ) ( not ( = ?auto_6524 ?auto_6531 ) ) ( not ( = ?auto_6529 ?auto_6531 ) ) ( OBJ-AT ?auto_6528 ?auto_6531 ) ( TRUCK-AT ?auto_6527 ?auto_6524 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6527 ?auto_6524 ?auto_6531 ?auto_6530 )
      ( DELIVER-2PKG ?auto_6526 ?auto_6525 ?auto_6524 )
      ( DELIVER-1PKG-VERIFY ?auto_6525 ?auto_6524 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6533 - OBJ
      ?auto_6534 - OBJ
      ?auto_6532 - LOCATION
    )
    :vars
    (
      ?auto_6537 - LOCATION
      ?auto_6536 - CITY
      ?auto_6538 - OBJ
      ?auto_6539 - LOCATION
      ?auto_6535 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6537 ?auto_6536 ) ( IN-CITY ?auto_6532 ?auto_6536 ) ( not ( = ?auto_6532 ?auto_6537 ) ) ( OBJ-AT ?auto_6533 ?auto_6532 ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( OBJ-AT ?auto_6534 ?auto_6537 ) ( not ( = ?auto_6533 ?auto_6538 ) ) ( not ( = ?auto_6534 ?auto_6538 ) ) ( IN-CITY ?auto_6539 ?auto_6536 ) ( not ( = ?auto_6532 ?auto_6539 ) ) ( not ( = ?auto_6537 ?auto_6539 ) ) ( OBJ-AT ?auto_6538 ?auto_6539 ) ( TRUCK-AT ?auto_6535 ?auto_6532 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6534 ?auto_6532 )
      ( DELIVER-2PKG-VERIFY ?auto_6533 ?auto_6534 ?auto_6532 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6541 - OBJ
      ?auto_6542 - OBJ
      ?auto_6540 - LOCATION
    )
    :vars
    (
      ?auto_6546 - LOCATION
      ?auto_6545 - CITY
      ?auto_6547 - OBJ
      ?auto_6544 - LOCATION
      ?auto_6543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6546 ?auto_6545 ) ( IN-CITY ?auto_6540 ?auto_6545 ) ( not ( = ?auto_6540 ?auto_6546 ) ) ( OBJ-AT ?auto_6547 ?auto_6540 ) ( not ( = ?auto_6547 ?auto_6542 ) ) ( OBJ-AT ?auto_6542 ?auto_6546 ) ( not ( = ?auto_6547 ?auto_6541 ) ) ( not ( = ?auto_6542 ?auto_6541 ) ) ( IN-CITY ?auto_6544 ?auto_6545 ) ( not ( = ?auto_6540 ?auto_6544 ) ) ( not ( = ?auto_6546 ?auto_6544 ) ) ( OBJ-AT ?auto_6541 ?auto_6544 ) ( TRUCK-AT ?auto_6543 ?auto_6540 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6547 ?auto_6542 ?auto_6540 )
      ( DELIVER-2PKG-VERIFY ?auto_6541 ?auto_6542 ?auto_6540 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6549 - OBJ
      ?auto_6550 - OBJ
      ?auto_6548 - LOCATION
    )
    :vars
    (
      ?auto_6555 - LOCATION
      ?auto_6553 - CITY
      ?auto_6554 - OBJ
      ?auto_6552 - LOCATION
      ?auto_6551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6555 ?auto_6553 ) ( IN-CITY ?auto_6548 ?auto_6553 ) ( not ( = ?auto_6548 ?auto_6555 ) ) ( OBJ-AT ?auto_6550 ?auto_6548 ) ( not ( = ?auto_6550 ?auto_6549 ) ) ( OBJ-AT ?auto_6549 ?auto_6555 ) ( not ( = ?auto_6550 ?auto_6554 ) ) ( not ( = ?auto_6549 ?auto_6554 ) ) ( IN-CITY ?auto_6552 ?auto_6553 ) ( not ( = ?auto_6548 ?auto_6552 ) ) ( not ( = ?auto_6555 ?auto_6552 ) ) ( OBJ-AT ?auto_6554 ?auto_6552 ) ( TRUCK-AT ?auto_6551 ?auto_6548 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6550 ?auto_6549 ?auto_6548 )
      ( DELIVER-2PKG-VERIFY ?auto_6549 ?auto_6550 ?auto_6548 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6557 - OBJ
      ?auto_6558 - OBJ
      ?auto_6556 - LOCATION
    )
    :vars
    (
      ?auto_6562 - LOCATION
      ?auto_6561 - CITY
      ?auto_6563 - OBJ
      ?auto_6560 - LOCATION
      ?auto_6559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6562 ?auto_6561 ) ( IN-CITY ?auto_6556 ?auto_6561 ) ( not ( = ?auto_6556 ?auto_6562 ) ) ( OBJ-AT ?auto_6563 ?auto_6556 ) ( not ( = ?auto_6563 ?auto_6557 ) ) ( OBJ-AT ?auto_6557 ?auto_6562 ) ( not ( = ?auto_6563 ?auto_6558 ) ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( IN-CITY ?auto_6560 ?auto_6561 ) ( not ( = ?auto_6556 ?auto_6560 ) ) ( not ( = ?auto_6562 ?auto_6560 ) ) ( OBJ-AT ?auto_6558 ?auto_6560 ) ( TRUCK-AT ?auto_6559 ?auto_6556 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6563 ?auto_6557 ?auto_6556 )
      ( DELIVER-2PKG-VERIFY ?auto_6557 ?auto_6558 ?auto_6556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6574 - OBJ
      ?auto_6575 - OBJ
      ?auto_6576 - OBJ
      ?auto_6573 - LOCATION
    )
    :vars
    (
      ?auto_6581 - LOCATION
      ?auto_6579 - CITY
      ?auto_6580 - OBJ
      ?auto_6578 - LOCATION
      ?auto_6577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6581 ?auto_6579 ) ( IN-CITY ?auto_6573 ?auto_6579 ) ( not ( = ?auto_6573 ?auto_6581 ) ) ( OBJ-AT ?auto_6575 ?auto_6573 ) ( not ( = ?auto_6575 ?auto_6576 ) ) ( OBJ-AT ?auto_6576 ?auto_6581 ) ( not ( = ?auto_6575 ?auto_6580 ) ) ( not ( = ?auto_6576 ?auto_6580 ) ) ( IN-CITY ?auto_6578 ?auto_6579 ) ( not ( = ?auto_6573 ?auto_6578 ) ) ( not ( = ?auto_6581 ?auto_6578 ) ) ( OBJ-AT ?auto_6580 ?auto_6578 ) ( TRUCK-AT ?auto_6577 ?auto_6573 ) ( OBJ-AT ?auto_6574 ?auto_6573 ) ( not ( = ?auto_6574 ?auto_6575 ) ) ( not ( = ?auto_6574 ?auto_6576 ) ) ( not ( = ?auto_6574 ?auto_6580 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6575 ?auto_6576 ?auto_6573 )
      ( DELIVER-3PKG-VERIFY ?auto_6574 ?auto_6575 ?auto_6576 ?auto_6573 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6583 - OBJ
      ?auto_6584 - OBJ
      ?auto_6585 - OBJ
      ?auto_6582 - LOCATION
    )
    :vars
    (
      ?auto_6589 - LOCATION
      ?auto_6588 - CITY
      ?auto_6587 - LOCATION
      ?auto_6586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6589 ?auto_6588 ) ( IN-CITY ?auto_6582 ?auto_6588 ) ( not ( = ?auto_6582 ?auto_6589 ) ) ( OBJ-AT ?auto_6583 ?auto_6582 ) ( not ( = ?auto_6583 ?auto_6585 ) ) ( OBJ-AT ?auto_6585 ?auto_6589 ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( not ( = ?auto_6585 ?auto_6584 ) ) ( IN-CITY ?auto_6587 ?auto_6588 ) ( not ( = ?auto_6582 ?auto_6587 ) ) ( not ( = ?auto_6589 ?auto_6587 ) ) ( OBJ-AT ?auto_6584 ?auto_6587 ) ( TRUCK-AT ?auto_6586 ?auto_6582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6583 ?auto_6585 ?auto_6582 )
      ( DELIVER-3PKG-VERIFY ?auto_6583 ?auto_6584 ?auto_6585 ?auto_6582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6591 - OBJ
      ?auto_6592 - OBJ
      ?auto_6593 - OBJ
      ?auto_6590 - LOCATION
    )
    :vars
    (
      ?auto_6598 - LOCATION
      ?auto_6596 - CITY
      ?auto_6597 - OBJ
      ?auto_6595 - LOCATION
      ?auto_6594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6598 ?auto_6596 ) ( IN-CITY ?auto_6590 ?auto_6596 ) ( not ( = ?auto_6590 ?auto_6598 ) ) ( OBJ-AT ?auto_6593 ?auto_6590 ) ( not ( = ?auto_6593 ?auto_6592 ) ) ( OBJ-AT ?auto_6592 ?auto_6598 ) ( not ( = ?auto_6593 ?auto_6597 ) ) ( not ( = ?auto_6592 ?auto_6597 ) ) ( IN-CITY ?auto_6595 ?auto_6596 ) ( not ( = ?auto_6590 ?auto_6595 ) ) ( not ( = ?auto_6598 ?auto_6595 ) ) ( OBJ-AT ?auto_6597 ?auto_6595 ) ( TRUCK-AT ?auto_6594 ?auto_6590 ) ( OBJ-AT ?auto_6591 ?auto_6590 ) ( not ( = ?auto_6591 ?auto_6592 ) ) ( not ( = ?auto_6591 ?auto_6593 ) ) ( not ( = ?auto_6591 ?auto_6597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6593 ?auto_6592 ?auto_6590 )
      ( DELIVER-3PKG-VERIFY ?auto_6591 ?auto_6592 ?auto_6593 ?auto_6590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6600 - OBJ
      ?auto_6601 - OBJ
      ?auto_6602 - OBJ
      ?auto_6599 - LOCATION
    )
    :vars
    (
      ?auto_6606 - LOCATION
      ?auto_6605 - CITY
      ?auto_6604 - LOCATION
      ?auto_6603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6606 ?auto_6605 ) ( IN-CITY ?auto_6599 ?auto_6605 ) ( not ( = ?auto_6599 ?auto_6606 ) ) ( OBJ-AT ?auto_6600 ?auto_6599 ) ( not ( = ?auto_6600 ?auto_6601 ) ) ( OBJ-AT ?auto_6601 ?auto_6606 ) ( not ( = ?auto_6600 ?auto_6602 ) ) ( not ( = ?auto_6601 ?auto_6602 ) ) ( IN-CITY ?auto_6604 ?auto_6605 ) ( not ( = ?auto_6599 ?auto_6604 ) ) ( not ( = ?auto_6606 ?auto_6604 ) ) ( OBJ-AT ?auto_6602 ?auto_6604 ) ( TRUCK-AT ?auto_6603 ?auto_6599 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6600 ?auto_6601 ?auto_6599 )
      ( DELIVER-3PKG-VERIFY ?auto_6600 ?auto_6601 ?auto_6602 ?auto_6599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6617 - OBJ
      ?auto_6618 - OBJ
      ?auto_6619 - OBJ
      ?auto_6616 - LOCATION
    )
    :vars
    (
      ?auto_6623 - LOCATION
      ?auto_6622 - CITY
      ?auto_6621 - LOCATION
      ?auto_6620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6623 ?auto_6622 ) ( IN-CITY ?auto_6616 ?auto_6622 ) ( not ( = ?auto_6616 ?auto_6623 ) ) ( OBJ-AT ?auto_6618 ?auto_6616 ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( OBJ-AT ?auto_6619 ?auto_6623 ) ( not ( = ?auto_6618 ?auto_6617 ) ) ( not ( = ?auto_6619 ?auto_6617 ) ) ( IN-CITY ?auto_6621 ?auto_6622 ) ( not ( = ?auto_6616 ?auto_6621 ) ) ( not ( = ?auto_6623 ?auto_6621 ) ) ( OBJ-AT ?auto_6617 ?auto_6621 ) ( TRUCK-AT ?auto_6620 ?auto_6616 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6618 ?auto_6619 ?auto_6616 )
      ( DELIVER-3PKG-VERIFY ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6634 - OBJ
      ?auto_6635 - OBJ
      ?auto_6636 - OBJ
      ?auto_6633 - LOCATION
    )
    :vars
    (
      ?auto_6640 - LOCATION
      ?auto_6639 - CITY
      ?auto_6638 - LOCATION
      ?auto_6637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6640 ?auto_6639 ) ( IN-CITY ?auto_6633 ?auto_6639 ) ( not ( = ?auto_6633 ?auto_6640 ) ) ( OBJ-AT ?auto_6636 ?auto_6633 ) ( not ( = ?auto_6636 ?auto_6635 ) ) ( OBJ-AT ?auto_6635 ?auto_6640 ) ( not ( = ?auto_6636 ?auto_6634 ) ) ( not ( = ?auto_6635 ?auto_6634 ) ) ( IN-CITY ?auto_6638 ?auto_6639 ) ( not ( = ?auto_6633 ?auto_6638 ) ) ( not ( = ?auto_6640 ?auto_6638 ) ) ( OBJ-AT ?auto_6634 ?auto_6638 ) ( TRUCK-AT ?auto_6637 ?auto_6633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6636 ?auto_6635 ?auto_6633 )
      ( DELIVER-3PKG-VERIFY ?auto_6634 ?auto_6635 ?auto_6636 ?auto_6633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6660 - OBJ
      ?auto_6661 - OBJ
      ?auto_6662 - OBJ
      ?auto_6659 - LOCATION
    )
    :vars
    (
      ?auto_6667 - LOCATION
      ?auto_6665 - CITY
      ?auto_6666 - OBJ
      ?auto_6664 - LOCATION
      ?auto_6663 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6667 ?auto_6665 ) ( IN-CITY ?auto_6659 ?auto_6665 ) ( not ( = ?auto_6659 ?auto_6667 ) ) ( OBJ-AT ?auto_6662 ?auto_6659 ) ( not ( = ?auto_6662 ?auto_6660 ) ) ( OBJ-AT ?auto_6660 ?auto_6667 ) ( not ( = ?auto_6662 ?auto_6666 ) ) ( not ( = ?auto_6660 ?auto_6666 ) ) ( IN-CITY ?auto_6664 ?auto_6665 ) ( not ( = ?auto_6659 ?auto_6664 ) ) ( not ( = ?auto_6667 ?auto_6664 ) ) ( OBJ-AT ?auto_6666 ?auto_6664 ) ( TRUCK-AT ?auto_6663 ?auto_6659 ) ( OBJ-AT ?auto_6661 ?auto_6659 ) ( not ( = ?auto_6660 ?auto_6661 ) ) ( not ( = ?auto_6661 ?auto_6662 ) ) ( not ( = ?auto_6661 ?auto_6666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6662 ?auto_6660 ?auto_6659 )
      ( DELIVER-3PKG-VERIFY ?auto_6660 ?auto_6661 ?auto_6662 ?auto_6659 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6669 - OBJ
      ?auto_6670 - OBJ
      ?auto_6671 - OBJ
      ?auto_6668 - LOCATION
    )
    :vars
    (
      ?auto_6675 - LOCATION
      ?auto_6674 - CITY
      ?auto_6673 - LOCATION
      ?auto_6672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6675 ?auto_6674 ) ( IN-CITY ?auto_6668 ?auto_6674 ) ( not ( = ?auto_6668 ?auto_6675 ) ) ( OBJ-AT ?auto_6670 ?auto_6668 ) ( not ( = ?auto_6670 ?auto_6669 ) ) ( OBJ-AT ?auto_6669 ?auto_6675 ) ( not ( = ?auto_6670 ?auto_6671 ) ) ( not ( = ?auto_6669 ?auto_6671 ) ) ( IN-CITY ?auto_6673 ?auto_6674 ) ( not ( = ?auto_6668 ?auto_6673 ) ) ( not ( = ?auto_6675 ?auto_6673 ) ) ( OBJ-AT ?auto_6671 ?auto_6673 ) ( TRUCK-AT ?auto_6672 ?auto_6668 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6670 ?auto_6669 ?auto_6668 )
      ( DELIVER-3PKG-VERIFY ?auto_6669 ?auto_6670 ?auto_6671 ?auto_6668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6686 - OBJ
      ?auto_6687 - OBJ
      ?auto_6688 - OBJ
      ?auto_6685 - LOCATION
    )
    :vars
    (
      ?auto_6692 - LOCATION
      ?auto_6691 - CITY
      ?auto_6690 - LOCATION
      ?auto_6689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6692 ?auto_6691 ) ( IN-CITY ?auto_6685 ?auto_6691 ) ( not ( = ?auto_6685 ?auto_6692 ) ) ( OBJ-AT ?auto_6688 ?auto_6685 ) ( not ( = ?auto_6688 ?auto_6686 ) ) ( OBJ-AT ?auto_6686 ?auto_6692 ) ( not ( = ?auto_6688 ?auto_6687 ) ) ( not ( = ?auto_6686 ?auto_6687 ) ) ( IN-CITY ?auto_6690 ?auto_6691 ) ( not ( = ?auto_6685 ?auto_6690 ) ) ( not ( = ?auto_6692 ?auto_6690 ) ) ( OBJ-AT ?auto_6687 ?auto_6690 ) ( TRUCK-AT ?auto_6689 ?auto_6685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6688 ?auto_6686 ?auto_6685 )
      ( DELIVER-3PKG-VERIFY ?auto_6686 ?auto_6687 ?auto_6688 ?auto_6685 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6740 - OBJ
      ?auto_6739 - LOCATION
    )
    :vars
    (
      ?auto_6745 - LOCATION
      ?auto_6743 - CITY
      ?auto_6746 - OBJ
      ?auto_6744 - OBJ
      ?auto_6742 - LOCATION
      ?auto_6741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6745 ?auto_6743 ) ( IN-CITY ?auto_6739 ?auto_6743 ) ( not ( = ?auto_6739 ?auto_6745 ) ) ( not ( = ?auto_6746 ?auto_6740 ) ) ( OBJ-AT ?auto_6740 ?auto_6745 ) ( not ( = ?auto_6746 ?auto_6744 ) ) ( not ( = ?auto_6740 ?auto_6744 ) ) ( IN-CITY ?auto_6742 ?auto_6743 ) ( not ( = ?auto_6739 ?auto_6742 ) ) ( not ( = ?auto_6745 ?auto_6742 ) ) ( OBJ-AT ?auto_6744 ?auto_6742 ) ( TRUCK-AT ?auto_6741 ?auto_6739 ) ( IN-TRUCK ?auto_6746 ?auto_6741 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6746 ?auto_6739 )
      ( DELIVER-2PKG ?auto_6746 ?auto_6740 ?auto_6739 )
      ( DELIVER-1PKG-VERIFY ?auto_6740 ?auto_6739 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6748 - OBJ
      ?auto_6749 - OBJ
      ?auto_6747 - LOCATION
    )
    :vars
    (
      ?auto_6754 - LOCATION
      ?auto_6751 - CITY
      ?auto_6752 - OBJ
      ?auto_6750 - LOCATION
      ?auto_6753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6754 ?auto_6751 ) ( IN-CITY ?auto_6747 ?auto_6751 ) ( not ( = ?auto_6747 ?auto_6754 ) ) ( not ( = ?auto_6748 ?auto_6749 ) ) ( OBJ-AT ?auto_6749 ?auto_6754 ) ( not ( = ?auto_6748 ?auto_6752 ) ) ( not ( = ?auto_6749 ?auto_6752 ) ) ( IN-CITY ?auto_6750 ?auto_6751 ) ( not ( = ?auto_6747 ?auto_6750 ) ) ( not ( = ?auto_6754 ?auto_6750 ) ) ( OBJ-AT ?auto_6752 ?auto_6750 ) ( TRUCK-AT ?auto_6753 ?auto_6747 ) ( IN-TRUCK ?auto_6748 ?auto_6753 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6749 ?auto_6747 )
      ( DELIVER-2PKG-VERIFY ?auto_6748 ?auto_6749 ?auto_6747 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6756 - OBJ
      ?auto_6757 - OBJ
      ?auto_6755 - LOCATION
    )
    :vars
    (
      ?auto_6758 - LOCATION
      ?auto_6760 - CITY
      ?auto_6762 - OBJ
      ?auto_6761 - LOCATION
      ?auto_6759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6758 ?auto_6760 ) ( IN-CITY ?auto_6755 ?auto_6760 ) ( not ( = ?auto_6755 ?auto_6758 ) ) ( not ( = ?auto_6762 ?auto_6757 ) ) ( OBJ-AT ?auto_6757 ?auto_6758 ) ( not ( = ?auto_6762 ?auto_6756 ) ) ( not ( = ?auto_6757 ?auto_6756 ) ) ( IN-CITY ?auto_6761 ?auto_6760 ) ( not ( = ?auto_6755 ?auto_6761 ) ) ( not ( = ?auto_6758 ?auto_6761 ) ) ( OBJ-AT ?auto_6756 ?auto_6761 ) ( TRUCK-AT ?auto_6759 ?auto_6755 ) ( IN-TRUCK ?auto_6762 ?auto_6759 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6762 ?auto_6757 ?auto_6755 )
      ( DELIVER-2PKG-VERIFY ?auto_6756 ?auto_6757 ?auto_6755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6764 - OBJ
      ?auto_6765 - OBJ
      ?auto_6763 - LOCATION
    )
    :vars
    (
      ?auto_6766 - LOCATION
      ?auto_6769 - CITY
      ?auto_6768 - OBJ
      ?auto_6770 - LOCATION
      ?auto_6767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6766 ?auto_6769 ) ( IN-CITY ?auto_6763 ?auto_6769 ) ( not ( = ?auto_6763 ?auto_6766 ) ) ( not ( = ?auto_6765 ?auto_6764 ) ) ( OBJ-AT ?auto_6764 ?auto_6766 ) ( not ( = ?auto_6765 ?auto_6768 ) ) ( not ( = ?auto_6764 ?auto_6768 ) ) ( IN-CITY ?auto_6770 ?auto_6769 ) ( not ( = ?auto_6763 ?auto_6770 ) ) ( not ( = ?auto_6766 ?auto_6770 ) ) ( OBJ-AT ?auto_6768 ?auto_6770 ) ( TRUCK-AT ?auto_6767 ?auto_6763 ) ( IN-TRUCK ?auto_6765 ?auto_6767 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6765 ?auto_6764 ?auto_6763 )
      ( DELIVER-2PKG-VERIFY ?auto_6764 ?auto_6765 ?auto_6763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6772 - OBJ
      ?auto_6773 - OBJ
      ?auto_6771 - LOCATION
    )
    :vars
    (
      ?auto_6774 - LOCATION
      ?auto_6776 - CITY
      ?auto_6778 - OBJ
      ?auto_6777 - LOCATION
      ?auto_6775 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6774 ?auto_6776 ) ( IN-CITY ?auto_6771 ?auto_6776 ) ( not ( = ?auto_6771 ?auto_6774 ) ) ( not ( = ?auto_6778 ?auto_6772 ) ) ( OBJ-AT ?auto_6772 ?auto_6774 ) ( not ( = ?auto_6778 ?auto_6773 ) ) ( not ( = ?auto_6772 ?auto_6773 ) ) ( IN-CITY ?auto_6777 ?auto_6776 ) ( not ( = ?auto_6771 ?auto_6777 ) ) ( not ( = ?auto_6774 ?auto_6777 ) ) ( OBJ-AT ?auto_6773 ?auto_6777 ) ( TRUCK-AT ?auto_6775 ?auto_6771 ) ( IN-TRUCK ?auto_6778 ?auto_6775 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6778 ?auto_6772 ?auto_6771 )
      ( DELIVER-2PKG-VERIFY ?auto_6772 ?auto_6773 ?auto_6771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6798 - OBJ
      ?auto_6799 - OBJ
      ?auto_6800 - OBJ
      ?auto_6797 - LOCATION
    )
    :vars
    (
      ?auto_6801 - LOCATION
      ?auto_6803 - CITY
      ?auto_6804 - LOCATION
      ?auto_6802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6801 ?auto_6803 ) ( IN-CITY ?auto_6797 ?auto_6803 ) ( not ( = ?auto_6797 ?auto_6801 ) ) ( not ( = ?auto_6798 ?auto_6800 ) ) ( OBJ-AT ?auto_6800 ?auto_6801 ) ( not ( = ?auto_6798 ?auto_6799 ) ) ( not ( = ?auto_6800 ?auto_6799 ) ) ( IN-CITY ?auto_6804 ?auto_6803 ) ( not ( = ?auto_6797 ?auto_6804 ) ) ( not ( = ?auto_6801 ?auto_6804 ) ) ( OBJ-AT ?auto_6799 ?auto_6804 ) ( TRUCK-AT ?auto_6802 ?auto_6797 ) ( IN-TRUCK ?auto_6798 ?auto_6802 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6798 ?auto_6800 ?auto_6797 )
      ( DELIVER-3PKG-VERIFY ?auto_6798 ?auto_6799 ?auto_6800 ?auto_6797 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6815 - OBJ
      ?auto_6816 - OBJ
      ?auto_6817 - OBJ
      ?auto_6814 - LOCATION
    )
    :vars
    (
      ?auto_6818 - LOCATION
      ?auto_6820 - CITY
      ?auto_6821 - LOCATION
      ?auto_6819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6818 ?auto_6820 ) ( IN-CITY ?auto_6814 ?auto_6820 ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( not ( = ?auto_6815 ?auto_6816 ) ) ( OBJ-AT ?auto_6816 ?auto_6818 ) ( not ( = ?auto_6815 ?auto_6817 ) ) ( not ( = ?auto_6816 ?auto_6817 ) ) ( IN-CITY ?auto_6821 ?auto_6820 ) ( not ( = ?auto_6814 ?auto_6821 ) ) ( not ( = ?auto_6818 ?auto_6821 ) ) ( OBJ-AT ?auto_6817 ?auto_6821 ) ( TRUCK-AT ?auto_6819 ?auto_6814 ) ( IN-TRUCK ?auto_6815 ?auto_6819 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6815 ?auto_6816 ?auto_6814 )
      ( DELIVER-3PKG-VERIFY ?auto_6815 ?auto_6816 ?auto_6817 ?auto_6814 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6832 - OBJ
      ?auto_6833 - OBJ
      ?auto_6834 - OBJ
      ?auto_6831 - LOCATION
    )
    :vars
    (
      ?auto_6835 - LOCATION
      ?auto_6837 - CITY
      ?auto_6838 - LOCATION
      ?auto_6836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6835 ?auto_6837 ) ( IN-CITY ?auto_6831 ?auto_6837 ) ( not ( = ?auto_6831 ?auto_6835 ) ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( OBJ-AT ?auto_6834 ?auto_6835 ) ( not ( = ?auto_6833 ?auto_6832 ) ) ( not ( = ?auto_6834 ?auto_6832 ) ) ( IN-CITY ?auto_6838 ?auto_6837 ) ( not ( = ?auto_6831 ?auto_6838 ) ) ( not ( = ?auto_6835 ?auto_6838 ) ) ( OBJ-AT ?auto_6832 ?auto_6838 ) ( TRUCK-AT ?auto_6836 ?auto_6831 ) ( IN-TRUCK ?auto_6833 ?auto_6836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6833 ?auto_6834 ?auto_6831 )
      ( DELIVER-3PKG-VERIFY ?auto_6832 ?auto_6833 ?auto_6834 ?auto_6831 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6849 - OBJ
      ?auto_6850 - OBJ
      ?auto_6851 - OBJ
      ?auto_6848 - LOCATION
    )
    :vars
    (
      ?auto_6852 - LOCATION
      ?auto_6854 - CITY
      ?auto_6855 - LOCATION
      ?auto_6853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6852 ?auto_6854 ) ( IN-CITY ?auto_6848 ?auto_6854 ) ( not ( = ?auto_6848 ?auto_6852 ) ) ( not ( = ?auto_6851 ?auto_6850 ) ) ( OBJ-AT ?auto_6850 ?auto_6852 ) ( not ( = ?auto_6851 ?auto_6849 ) ) ( not ( = ?auto_6850 ?auto_6849 ) ) ( IN-CITY ?auto_6855 ?auto_6854 ) ( not ( = ?auto_6848 ?auto_6855 ) ) ( not ( = ?auto_6852 ?auto_6855 ) ) ( OBJ-AT ?auto_6849 ?auto_6855 ) ( TRUCK-AT ?auto_6853 ?auto_6848 ) ( IN-TRUCK ?auto_6851 ?auto_6853 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6851 ?auto_6850 ?auto_6848 )
      ( DELIVER-3PKG-VERIFY ?auto_6849 ?auto_6850 ?auto_6851 ?auto_6848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6884 - OBJ
      ?auto_6885 - OBJ
      ?auto_6886 - OBJ
      ?auto_6883 - LOCATION
    )
    :vars
    (
      ?auto_6887 - LOCATION
      ?auto_6889 - CITY
      ?auto_6890 - LOCATION
      ?auto_6888 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6887 ?auto_6889 ) ( IN-CITY ?auto_6883 ?auto_6889 ) ( not ( = ?auto_6883 ?auto_6887 ) ) ( not ( = ?auto_6885 ?auto_6884 ) ) ( OBJ-AT ?auto_6884 ?auto_6887 ) ( not ( = ?auto_6885 ?auto_6886 ) ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( IN-CITY ?auto_6890 ?auto_6889 ) ( not ( = ?auto_6883 ?auto_6890 ) ) ( not ( = ?auto_6887 ?auto_6890 ) ) ( OBJ-AT ?auto_6886 ?auto_6890 ) ( TRUCK-AT ?auto_6888 ?auto_6883 ) ( IN-TRUCK ?auto_6885 ?auto_6888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6885 ?auto_6884 ?auto_6883 )
      ( DELIVER-3PKG-VERIFY ?auto_6884 ?auto_6885 ?auto_6886 ?auto_6883 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6901 - OBJ
      ?auto_6902 - OBJ
      ?auto_6903 - OBJ
      ?auto_6900 - LOCATION
    )
    :vars
    (
      ?auto_6904 - LOCATION
      ?auto_6906 - CITY
      ?auto_6907 - LOCATION
      ?auto_6905 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6904 ?auto_6906 ) ( IN-CITY ?auto_6900 ?auto_6906 ) ( not ( = ?auto_6900 ?auto_6904 ) ) ( not ( = ?auto_6903 ?auto_6901 ) ) ( OBJ-AT ?auto_6901 ?auto_6904 ) ( not ( = ?auto_6903 ?auto_6902 ) ) ( not ( = ?auto_6901 ?auto_6902 ) ) ( IN-CITY ?auto_6907 ?auto_6906 ) ( not ( = ?auto_6900 ?auto_6907 ) ) ( not ( = ?auto_6904 ?auto_6907 ) ) ( OBJ-AT ?auto_6902 ?auto_6907 ) ( TRUCK-AT ?auto_6905 ?auto_6900 ) ( IN-TRUCK ?auto_6903 ?auto_6905 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6903 ?auto_6901 ?auto_6900 )
      ( DELIVER-3PKG-VERIFY ?auto_6901 ?auto_6902 ?auto_6903 ?auto_6900 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6955 - OBJ
      ?auto_6954 - LOCATION
    )
    :vars
    (
      ?auto_6956 - LOCATION
      ?auto_6959 - CITY
      ?auto_6961 - OBJ
      ?auto_6958 - OBJ
      ?auto_6960 - LOCATION
      ?auto_6957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6956 ?auto_6959 ) ( IN-CITY ?auto_6954 ?auto_6959 ) ( not ( = ?auto_6954 ?auto_6956 ) ) ( not ( = ?auto_6961 ?auto_6955 ) ) ( OBJ-AT ?auto_6955 ?auto_6956 ) ( not ( = ?auto_6961 ?auto_6958 ) ) ( not ( = ?auto_6955 ?auto_6958 ) ) ( IN-CITY ?auto_6960 ?auto_6959 ) ( not ( = ?auto_6954 ?auto_6960 ) ) ( not ( = ?auto_6956 ?auto_6960 ) ) ( OBJ-AT ?auto_6958 ?auto_6960 ) ( IN-TRUCK ?auto_6961 ?auto_6957 ) ( TRUCK-AT ?auto_6957 ?auto_6956 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6957 ?auto_6956 ?auto_6954 ?auto_6959 )
      ( DELIVER-2PKG ?auto_6961 ?auto_6955 ?auto_6954 )
      ( DELIVER-1PKG-VERIFY ?auto_6955 ?auto_6954 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6963 - OBJ
      ?auto_6964 - OBJ
      ?auto_6962 - LOCATION
    )
    :vars
    (
      ?auto_6967 - LOCATION
      ?auto_6965 - CITY
      ?auto_6966 - OBJ
      ?auto_6968 - LOCATION
      ?auto_6969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6967 ?auto_6965 ) ( IN-CITY ?auto_6962 ?auto_6965 ) ( not ( = ?auto_6962 ?auto_6967 ) ) ( not ( = ?auto_6963 ?auto_6964 ) ) ( OBJ-AT ?auto_6964 ?auto_6967 ) ( not ( = ?auto_6963 ?auto_6966 ) ) ( not ( = ?auto_6964 ?auto_6966 ) ) ( IN-CITY ?auto_6968 ?auto_6965 ) ( not ( = ?auto_6962 ?auto_6968 ) ) ( not ( = ?auto_6967 ?auto_6968 ) ) ( OBJ-AT ?auto_6966 ?auto_6968 ) ( IN-TRUCK ?auto_6963 ?auto_6969 ) ( TRUCK-AT ?auto_6969 ?auto_6967 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6964 ?auto_6962 )
      ( DELIVER-2PKG-VERIFY ?auto_6963 ?auto_6964 ?auto_6962 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6971 - OBJ
      ?auto_6972 - OBJ
      ?auto_6970 - LOCATION
    )
    :vars
    (
      ?auto_6974 - LOCATION
      ?auto_6975 - CITY
      ?auto_6977 - OBJ
      ?auto_6976 - LOCATION
      ?auto_6973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6974 ?auto_6975 ) ( IN-CITY ?auto_6970 ?auto_6975 ) ( not ( = ?auto_6970 ?auto_6974 ) ) ( not ( = ?auto_6977 ?auto_6972 ) ) ( OBJ-AT ?auto_6972 ?auto_6974 ) ( not ( = ?auto_6977 ?auto_6971 ) ) ( not ( = ?auto_6972 ?auto_6971 ) ) ( IN-CITY ?auto_6976 ?auto_6975 ) ( not ( = ?auto_6970 ?auto_6976 ) ) ( not ( = ?auto_6974 ?auto_6976 ) ) ( OBJ-AT ?auto_6971 ?auto_6976 ) ( IN-TRUCK ?auto_6977 ?auto_6973 ) ( TRUCK-AT ?auto_6973 ?auto_6974 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6977 ?auto_6972 ?auto_6970 )
      ( DELIVER-2PKG-VERIFY ?auto_6971 ?auto_6972 ?auto_6970 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6979 - OBJ
      ?auto_6980 - OBJ
      ?auto_6978 - LOCATION
    )
    :vars
    (
      ?auto_6983 - LOCATION
      ?auto_6984 - CITY
      ?auto_6982 - OBJ
      ?auto_6985 - LOCATION
      ?auto_6981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6983 ?auto_6984 ) ( IN-CITY ?auto_6978 ?auto_6984 ) ( not ( = ?auto_6978 ?auto_6983 ) ) ( not ( = ?auto_6980 ?auto_6979 ) ) ( OBJ-AT ?auto_6979 ?auto_6983 ) ( not ( = ?auto_6980 ?auto_6982 ) ) ( not ( = ?auto_6979 ?auto_6982 ) ) ( IN-CITY ?auto_6985 ?auto_6984 ) ( not ( = ?auto_6978 ?auto_6985 ) ) ( not ( = ?auto_6983 ?auto_6985 ) ) ( OBJ-AT ?auto_6982 ?auto_6985 ) ( IN-TRUCK ?auto_6980 ?auto_6981 ) ( TRUCK-AT ?auto_6981 ?auto_6983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6980 ?auto_6979 ?auto_6978 )
      ( DELIVER-2PKG-VERIFY ?auto_6979 ?auto_6980 ?auto_6978 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6987 - OBJ
      ?auto_6988 - OBJ
      ?auto_6986 - LOCATION
    )
    :vars
    (
      ?auto_6990 - LOCATION
      ?auto_6991 - CITY
      ?auto_6993 - OBJ
      ?auto_6992 - LOCATION
      ?auto_6989 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6990 ?auto_6991 ) ( IN-CITY ?auto_6986 ?auto_6991 ) ( not ( = ?auto_6986 ?auto_6990 ) ) ( not ( = ?auto_6993 ?auto_6987 ) ) ( OBJ-AT ?auto_6987 ?auto_6990 ) ( not ( = ?auto_6993 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( IN-CITY ?auto_6992 ?auto_6991 ) ( not ( = ?auto_6986 ?auto_6992 ) ) ( not ( = ?auto_6990 ?auto_6992 ) ) ( OBJ-AT ?auto_6988 ?auto_6992 ) ( IN-TRUCK ?auto_6993 ?auto_6989 ) ( TRUCK-AT ?auto_6989 ?auto_6990 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6993 ?auto_6987 ?auto_6986 )
      ( DELIVER-2PKG-VERIFY ?auto_6987 ?auto_6988 ?auto_6986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7013 - OBJ
      ?auto_7014 - OBJ
      ?auto_7015 - OBJ
      ?auto_7012 - LOCATION
    )
    :vars
    (
      ?auto_7017 - LOCATION
      ?auto_7018 - CITY
      ?auto_7019 - LOCATION
      ?auto_7016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7017 ?auto_7018 ) ( IN-CITY ?auto_7012 ?auto_7018 ) ( not ( = ?auto_7012 ?auto_7017 ) ) ( not ( = ?auto_7013 ?auto_7015 ) ) ( OBJ-AT ?auto_7015 ?auto_7017 ) ( not ( = ?auto_7013 ?auto_7014 ) ) ( not ( = ?auto_7015 ?auto_7014 ) ) ( IN-CITY ?auto_7019 ?auto_7018 ) ( not ( = ?auto_7012 ?auto_7019 ) ) ( not ( = ?auto_7017 ?auto_7019 ) ) ( OBJ-AT ?auto_7014 ?auto_7019 ) ( IN-TRUCK ?auto_7013 ?auto_7016 ) ( TRUCK-AT ?auto_7016 ?auto_7017 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7013 ?auto_7015 ?auto_7012 )
      ( DELIVER-3PKG-VERIFY ?auto_7013 ?auto_7014 ?auto_7015 ?auto_7012 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7030 - OBJ
      ?auto_7031 - OBJ
      ?auto_7032 - OBJ
      ?auto_7029 - LOCATION
    )
    :vars
    (
      ?auto_7034 - LOCATION
      ?auto_7035 - CITY
      ?auto_7036 - LOCATION
      ?auto_7033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7034 ?auto_7035 ) ( IN-CITY ?auto_7029 ?auto_7035 ) ( not ( = ?auto_7029 ?auto_7034 ) ) ( not ( = ?auto_7030 ?auto_7031 ) ) ( OBJ-AT ?auto_7031 ?auto_7034 ) ( not ( = ?auto_7030 ?auto_7032 ) ) ( not ( = ?auto_7031 ?auto_7032 ) ) ( IN-CITY ?auto_7036 ?auto_7035 ) ( not ( = ?auto_7029 ?auto_7036 ) ) ( not ( = ?auto_7034 ?auto_7036 ) ) ( OBJ-AT ?auto_7032 ?auto_7036 ) ( IN-TRUCK ?auto_7030 ?auto_7033 ) ( TRUCK-AT ?auto_7033 ?auto_7034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7030 ?auto_7031 ?auto_7029 )
      ( DELIVER-3PKG-VERIFY ?auto_7030 ?auto_7031 ?auto_7032 ?auto_7029 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7047 - OBJ
      ?auto_7048 - OBJ
      ?auto_7049 - OBJ
      ?auto_7046 - LOCATION
    )
    :vars
    (
      ?auto_7051 - LOCATION
      ?auto_7052 - CITY
      ?auto_7053 - LOCATION
      ?auto_7050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7051 ?auto_7052 ) ( IN-CITY ?auto_7046 ?auto_7052 ) ( not ( = ?auto_7046 ?auto_7051 ) ) ( not ( = ?auto_7048 ?auto_7049 ) ) ( OBJ-AT ?auto_7049 ?auto_7051 ) ( not ( = ?auto_7048 ?auto_7047 ) ) ( not ( = ?auto_7049 ?auto_7047 ) ) ( IN-CITY ?auto_7053 ?auto_7052 ) ( not ( = ?auto_7046 ?auto_7053 ) ) ( not ( = ?auto_7051 ?auto_7053 ) ) ( OBJ-AT ?auto_7047 ?auto_7053 ) ( IN-TRUCK ?auto_7048 ?auto_7050 ) ( TRUCK-AT ?auto_7050 ?auto_7051 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7048 ?auto_7049 ?auto_7046 )
      ( DELIVER-3PKG-VERIFY ?auto_7047 ?auto_7048 ?auto_7049 ?auto_7046 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7064 - OBJ
      ?auto_7065 - OBJ
      ?auto_7066 - OBJ
      ?auto_7063 - LOCATION
    )
    :vars
    (
      ?auto_7068 - LOCATION
      ?auto_7069 - CITY
      ?auto_7070 - LOCATION
      ?auto_7067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7068 ?auto_7069 ) ( IN-CITY ?auto_7063 ?auto_7069 ) ( not ( = ?auto_7063 ?auto_7068 ) ) ( not ( = ?auto_7066 ?auto_7065 ) ) ( OBJ-AT ?auto_7065 ?auto_7068 ) ( not ( = ?auto_7066 ?auto_7064 ) ) ( not ( = ?auto_7065 ?auto_7064 ) ) ( IN-CITY ?auto_7070 ?auto_7069 ) ( not ( = ?auto_7063 ?auto_7070 ) ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( OBJ-AT ?auto_7064 ?auto_7070 ) ( IN-TRUCK ?auto_7066 ?auto_7067 ) ( TRUCK-AT ?auto_7067 ?auto_7068 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7066 ?auto_7065 ?auto_7063 )
      ( DELIVER-3PKG-VERIFY ?auto_7064 ?auto_7065 ?auto_7066 ?auto_7063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7099 - OBJ
      ?auto_7100 - OBJ
      ?auto_7101 - OBJ
      ?auto_7098 - LOCATION
    )
    :vars
    (
      ?auto_7103 - LOCATION
      ?auto_7104 - CITY
      ?auto_7105 - LOCATION
      ?auto_7102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7103 ?auto_7104 ) ( IN-CITY ?auto_7098 ?auto_7104 ) ( not ( = ?auto_7098 ?auto_7103 ) ) ( not ( = ?auto_7100 ?auto_7099 ) ) ( OBJ-AT ?auto_7099 ?auto_7103 ) ( not ( = ?auto_7100 ?auto_7101 ) ) ( not ( = ?auto_7099 ?auto_7101 ) ) ( IN-CITY ?auto_7105 ?auto_7104 ) ( not ( = ?auto_7098 ?auto_7105 ) ) ( not ( = ?auto_7103 ?auto_7105 ) ) ( OBJ-AT ?auto_7101 ?auto_7105 ) ( IN-TRUCK ?auto_7100 ?auto_7102 ) ( TRUCK-AT ?auto_7102 ?auto_7103 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7100 ?auto_7099 ?auto_7098 )
      ( DELIVER-3PKG-VERIFY ?auto_7099 ?auto_7100 ?auto_7101 ?auto_7098 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7116 - OBJ
      ?auto_7117 - OBJ
      ?auto_7118 - OBJ
      ?auto_7115 - LOCATION
    )
    :vars
    (
      ?auto_7120 - LOCATION
      ?auto_7121 - CITY
      ?auto_7122 - LOCATION
      ?auto_7119 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7120 ?auto_7121 ) ( IN-CITY ?auto_7115 ?auto_7121 ) ( not ( = ?auto_7115 ?auto_7120 ) ) ( not ( = ?auto_7118 ?auto_7116 ) ) ( OBJ-AT ?auto_7116 ?auto_7120 ) ( not ( = ?auto_7118 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( IN-CITY ?auto_7122 ?auto_7121 ) ( not ( = ?auto_7115 ?auto_7122 ) ) ( not ( = ?auto_7120 ?auto_7122 ) ) ( OBJ-AT ?auto_7117 ?auto_7122 ) ( IN-TRUCK ?auto_7118 ?auto_7119 ) ( TRUCK-AT ?auto_7119 ?auto_7120 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7118 ?auto_7116 ?auto_7115 )
      ( DELIVER-3PKG-VERIFY ?auto_7116 ?auto_7117 ?auto_7118 ?auto_7115 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7170 - OBJ
      ?auto_7169 - LOCATION
    )
    :vars
    (
      ?auto_7173 - LOCATION
      ?auto_7174 - CITY
      ?auto_7176 - OBJ
      ?auto_7172 - OBJ
      ?auto_7175 - LOCATION
      ?auto_7171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7173 ?auto_7174 ) ( IN-CITY ?auto_7169 ?auto_7174 ) ( not ( = ?auto_7169 ?auto_7173 ) ) ( not ( = ?auto_7176 ?auto_7170 ) ) ( OBJ-AT ?auto_7170 ?auto_7173 ) ( not ( = ?auto_7176 ?auto_7172 ) ) ( not ( = ?auto_7170 ?auto_7172 ) ) ( IN-CITY ?auto_7175 ?auto_7174 ) ( not ( = ?auto_7169 ?auto_7175 ) ) ( not ( = ?auto_7173 ?auto_7175 ) ) ( OBJ-AT ?auto_7172 ?auto_7175 ) ( TRUCK-AT ?auto_7171 ?auto_7173 ) ( OBJ-AT ?auto_7176 ?auto_7173 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7176 ?auto_7171 ?auto_7173 )
      ( DELIVER-2PKG ?auto_7176 ?auto_7170 ?auto_7169 )
      ( DELIVER-1PKG-VERIFY ?auto_7170 ?auto_7169 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7178 - OBJ
      ?auto_7179 - OBJ
      ?auto_7177 - LOCATION
    )
    :vars
    (
      ?auto_7180 - LOCATION
      ?auto_7182 - CITY
      ?auto_7183 - OBJ
      ?auto_7181 - LOCATION
      ?auto_7184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7180 ?auto_7182 ) ( IN-CITY ?auto_7177 ?auto_7182 ) ( not ( = ?auto_7177 ?auto_7180 ) ) ( not ( = ?auto_7178 ?auto_7179 ) ) ( OBJ-AT ?auto_7179 ?auto_7180 ) ( not ( = ?auto_7178 ?auto_7183 ) ) ( not ( = ?auto_7179 ?auto_7183 ) ) ( IN-CITY ?auto_7181 ?auto_7182 ) ( not ( = ?auto_7177 ?auto_7181 ) ) ( not ( = ?auto_7180 ?auto_7181 ) ) ( OBJ-AT ?auto_7183 ?auto_7181 ) ( TRUCK-AT ?auto_7184 ?auto_7180 ) ( OBJ-AT ?auto_7178 ?auto_7180 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7179 ?auto_7177 )
      ( DELIVER-2PKG-VERIFY ?auto_7178 ?auto_7179 ?auto_7177 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7186 - OBJ
      ?auto_7187 - OBJ
      ?auto_7185 - LOCATION
    )
    :vars
    (
      ?auto_7191 - LOCATION
      ?auto_7189 - CITY
      ?auto_7192 - OBJ
      ?auto_7190 - LOCATION
      ?auto_7188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7191 ?auto_7189 ) ( IN-CITY ?auto_7185 ?auto_7189 ) ( not ( = ?auto_7185 ?auto_7191 ) ) ( not ( = ?auto_7192 ?auto_7187 ) ) ( OBJ-AT ?auto_7187 ?auto_7191 ) ( not ( = ?auto_7192 ?auto_7186 ) ) ( not ( = ?auto_7187 ?auto_7186 ) ) ( IN-CITY ?auto_7190 ?auto_7189 ) ( not ( = ?auto_7185 ?auto_7190 ) ) ( not ( = ?auto_7191 ?auto_7190 ) ) ( OBJ-AT ?auto_7186 ?auto_7190 ) ( TRUCK-AT ?auto_7188 ?auto_7191 ) ( OBJ-AT ?auto_7192 ?auto_7191 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7192 ?auto_7187 ?auto_7185 )
      ( DELIVER-2PKG-VERIFY ?auto_7186 ?auto_7187 ?auto_7185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7194 - OBJ
      ?auto_7195 - OBJ
      ?auto_7193 - LOCATION
    )
    :vars
    (
      ?auto_7200 - LOCATION
      ?auto_7197 - CITY
      ?auto_7199 - OBJ
      ?auto_7198 - LOCATION
      ?auto_7196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7200 ?auto_7197 ) ( IN-CITY ?auto_7193 ?auto_7197 ) ( not ( = ?auto_7193 ?auto_7200 ) ) ( not ( = ?auto_7195 ?auto_7194 ) ) ( OBJ-AT ?auto_7194 ?auto_7200 ) ( not ( = ?auto_7195 ?auto_7199 ) ) ( not ( = ?auto_7194 ?auto_7199 ) ) ( IN-CITY ?auto_7198 ?auto_7197 ) ( not ( = ?auto_7193 ?auto_7198 ) ) ( not ( = ?auto_7200 ?auto_7198 ) ) ( OBJ-AT ?auto_7199 ?auto_7198 ) ( TRUCK-AT ?auto_7196 ?auto_7200 ) ( OBJ-AT ?auto_7195 ?auto_7200 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7195 ?auto_7194 ?auto_7193 )
      ( DELIVER-2PKG-VERIFY ?auto_7194 ?auto_7195 ?auto_7193 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7202 - OBJ
      ?auto_7203 - OBJ
      ?auto_7201 - LOCATION
    )
    :vars
    (
      ?auto_7207 - LOCATION
      ?auto_7205 - CITY
      ?auto_7208 - OBJ
      ?auto_7206 - LOCATION
      ?auto_7204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7207 ?auto_7205 ) ( IN-CITY ?auto_7201 ?auto_7205 ) ( not ( = ?auto_7201 ?auto_7207 ) ) ( not ( = ?auto_7208 ?auto_7202 ) ) ( OBJ-AT ?auto_7202 ?auto_7207 ) ( not ( = ?auto_7208 ?auto_7203 ) ) ( not ( = ?auto_7202 ?auto_7203 ) ) ( IN-CITY ?auto_7206 ?auto_7205 ) ( not ( = ?auto_7201 ?auto_7206 ) ) ( not ( = ?auto_7207 ?auto_7206 ) ) ( OBJ-AT ?auto_7203 ?auto_7206 ) ( TRUCK-AT ?auto_7204 ?auto_7207 ) ( OBJ-AT ?auto_7208 ?auto_7207 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7208 ?auto_7202 ?auto_7201 )
      ( DELIVER-2PKG-VERIFY ?auto_7202 ?auto_7203 ?auto_7201 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7228 - OBJ
      ?auto_7229 - OBJ
      ?auto_7230 - OBJ
      ?auto_7227 - LOCATION
    )
    :vars
    (
      ?auto_7234 - LOCATION
      ?auto_7232 - CITY
      ?auto_7233 - LOCATION
      ?auto_7231 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7234 ?auto_7232 ) ( IN-CITY ?auto_7227 ?auto_7232 ) ( not ( = ?auto_7227 ?auto_7234 ) ) ( not ( = ?auto_7228 ?auto_7230 ) ) ( OBJ-AT ?auto_7230 ?auto_7234 ) ( not ( = ?auto_7228 ?auto_7229 ) ) ( not ( = ?auto_7230 ?auto_7229 ) ) ( IN-CITY ?auto_7233 ?auto_7232 ) ( not ( = ?auto_7227 ?auto_7233 ) ) ( not ( = ?auto_7234 ?auto_7233 ) ) ( OBJ-AT ?auto_7229 ?auto_7233 ) ( TRUCK-AT ?auto_7231 ?auto_7234 ) ( OBJ-AT ?auto_7228 ?auto_7234 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7228 ?auto_7230 ?auto_7227 )
      ( DELIVER-3PKG-VERIFY ?auto_7228 ?auto_7229 ?auto_7230 ?auto_7227 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7245 - OBJ
      ?auto_7246 - OBJ
      ?auto_7247 - OBJ
      ?auto_7244 - LOCATION
    )
    :vars
    (
      ?auto_7251 - LOCATION
      ?auto_7249 - CITY
      ?auto_7250 - LOCATION
      ?auto_7248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7251 ?auto_7249 ) ( IN-CITY ?auto_7244 ?auto_7249 ) ( not ( = ?auto_7244 ?auto_7251 ) ) ( not ( = ?auto_7245 ?auto_7246 ) ) ( OBJ-AT ?auto_7246 ?auto_7251 ) ( not ( = ?auto_7245 ?auto_7247 ) ) ( not ( = ?auto_7246 ?auto_7247 ) ) ( IN-CITY ?auto_7250 ?auto_7249 ) ( not ( = ?auto_7244 ?auto_7250 ) ) ( not ( = ?auto_7251 ?auto_7250 ) ) ( OBJ-AT ?auto_7247 ?auto_7250 ) ( TRUCK-AT ?auto_7248 ?auto_7251 ) ( OBJ-AT ?auto_7245 ?auto_7251 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7245 ?auto_7246 ?auto_7244 )
      ( DELIVER-3PKG-VERIFY ?auto_7245 ?auto_7246 ?auto_7247 ?auto_7244 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7262 - OBJ
      ?auto_7263 - OBJ
      ?auto_7264 - OBJ
      ?auto_7261 - LOCATION
    )
    :vars
    (
      ?auto_7268 - LOCATION
      ?auto_7266 - CITY
      ?auto_7267 - LOCATION
      ?auto_7265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7268 ?auto_7266 ) ( IN-CITY ?auto_7261 ?auto_7266 ) ( not ( = ?auto_7261 ?auto_7268 ) ) ( not ( = ?auto_7263 ?auto_7264 ) ) ( OBJ-AT ?auto_7264 ?auto_7268 ) ( not ( = ?auto_7263 ?auto_7262 ) ) ( not ( = ?auto_7264 ?auto_7262 ) ) ( IN-CITY ?auto_7267 ?auto_7266 ) ( not ( = ?auto_7261 ?auto_7267 ) ) ( not ( = ?auto_7268 ?auto_7267 ) ) ( OBJ-AT ?auto_7262 ?auto_7267 ) ( TRUCK-AT ?auto_7265 ?auto_7268 ) ( OBJ-AT ?auto_7263 ?auto_7268 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7263 ?auto_7264 ?auto_7261 )
      ( DELIVER-3PKG-VERIFY ?auto_7262 ?auto_7263 ?auto_7264 ?auto_7261 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7279 - OBJ
      ?auto_7280 - OBJ
      ?auto_7281 - OBJ
      ?auto_7278 - LOCATION
    )
    :vars
    (
      ?auto_7285 - LOCATION
      ?auto_7283 - CITY
      ?auto_7284 - LOCATION
      ?auto_7282 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7285 ?auto_7283 ) ( IN-CITY ?auto_7278 ?auto_7283 ) ( not ( = ?auto_7278 ?auto_7285 ) ) ( not ( = ?auto_7281 ?auto_7280 ) ) ( OBJ-AT ?auto_7280 ?auto_7285 ) ( not ( = ?auto_7281 ?auto_7279 ) ) ( not ( = ?auto_7280 ?auto_7279 ) ) ( IN-CITY ?auto_7284 ?auto_7283 ) ( not ( = ?auto_7278 ?auto_7284 ) ) ( not ( = ?auto_7285 ?auto_7284 ) ) ( OBJ-AT ?auto_7279 ?auto_7284 ) ( TRUCK-AT ?auto_7282 ?auto_7285 ) ( OBJ-AT ?auto_7281 ?auto_7285 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7281 ?auto_7280 ?auto_7278 )
      ( DELIVER-3PKG-VERIFY ?auto_7279 ?auto_7280 ?auto_7281 ?auto_7278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7314 - OBJ
      ?auto_7315 - OBJ
      ?auto_7316 - OBJ
      ?auto_7313 - LOCATION
    )
    :vars
    (
      ?auto_7320 - LOCATION
      ?auto_7318 - CITY
      ?auto_7319 - LOCATION
      ?auto_7317 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7320 ?auto_7318 ) ( IN-CITY ?auto_7313 ?auto_7318 ) ( not ( = ?auto_7313 ?auto_7320 ) ) ( not ( = ?auto_7315 ?auto_7314 ) ) ( OBJ-AT ?auto_7314 ?auto_7320 ) ( not ( = ?auto_7315 ?auto_7316 ) ) ( not ( = ?auto_7314 ?auto_7316 ) ) ( IN-CITY ?auto_7319 ?auto_7318 ) ( not ( = ?auto_7313 ?auto_7319 ) ) ( not ( = ?auto_7320 ?auto_7319 ) ) ( OBJ-AT ?auto_7316 ?auto_7319 ) ( TRUCK-AT ?auto_7317 ?auto_7320 ) ( OBJ-AT ?auto_7315 ?auto_7320 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7315 ?auto_7314 ?auto_7313 )
      ( DELIVER-3PKG-VERIFY ?auto_7314 ?auto_7315 ?auto_7316 ?auto_7313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7331 - OBJ
      ?auto_7332 - OBJ
      ?auto_7333 - OBJ
      ?auto_7330 - LOCATION
    )
    :vars
    (
      ?auto_7337 - LOCATION
      ?auto_7335 - CITY
      ?auto_7336 - LOCATION
      ?auto_7334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7337 ?auto_7335 ) ( IN-CITY ?auto_7330 ?auto_7335 ) ( not ( = ?auto_7330 ?auto_7337 ) ) ( not ( = ?auto_7333 ?auto_7331 ) ) ( OBJ-AT ?auto_7331 ?auto_7337 ) ( not ( = ?auto_7333 ?auto_7332 ) ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( IN-CITY ?auto_7336 ?auto_7335 ) ( not ( = ?auto_7330 ?auto_7336 ) ) ( not ( = ?auto_7337 ?auto_7336 ) ) ( OBJ-AT ?auto_7332 ?auto_7336 ) ( TRUCK-AT ?auto_7334 ?auto_7337 ) ( OBJ-AT ?auto_7333 ?auto_7337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7333 ?auto_7331 ?auto_7330 )
      ( DELIVER-3PKG-VERIFY ?auto_7331 ?auto_7332 ?auto_7333 ?auto_7330 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7385 - OBJ
      ?auto_7384 - LOCATION
    )
    :vars
    (
      ?auto_7390 - LOCATION
      ?auto_7387 - CITY
      ?auto_7391 - OBJ
      ?auto_7389 - OBJ
      ?auto_7388 - LOCATION
      ?auto_7386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7390 ?auto_7387 ) ( IN-CITY ?auto_7384 ?auto_7387 ) ( not ( = ?auto_7384 ?auto_7390 ) ) ( not ( = ?auto_7391 ?auto_7385 ) ) ( OBJ-AT ?auto_7385 ?auto_7390 ) ( not ( = ?auto_7391 ?auto_7389 ) ) ( not ( = ?auto_7385 ?auto_7389 ) ) ( IN-CITY ?auto_7388 ?auto_7387 ) ( not ( = ?auto_7384 ?auto_7388 ) ) ( not ( = ?auto_7390 ?auto_7388 ) ) ( OBJ-AT ?auto_7389 ?auto_7388 ) ( OBJ-AT ?auto_7391 ?auto_7390 ) ( TRUCK-AT ?auto_7386 ?auto_7384 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7386 ?auto_7384 ?auto_7390 ?auto_7387 )
      ( DELIVER-2PKG ?auto_7391 ?auto_7385 ?auto_7384 )
      ( DELIVER-1PKG-VERIFY ?auto_7385 ?auto_7384 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7393 - OBJ
      ?auto_7394 - OBJ
      ?auto_7392 - LOCATION
    )
    :vars
    (
      ?auto_7395 - LOCATION
      ?auto_7398 - CITY
      ?auto_7397 - OBJ
      ?auto_7396 - LOCATION
      ?auto_7399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7395 ?auto_7398 ) ( IN-CITY ?auto_7392 ?auto_7398 ) ( not ( = ?auto_7392 ?auto_7395 ) ) ( not ( = ?auto_7393 ?auto_7394 ) ) ( OBJ-AT ?auto_7394 ?auto_7395 ) ( not ( = ?auto_7393 ?auto_7397 ) ) ( not ( = ?auto_7394 ?auto_7397 ) ) ( IN-CITY ?auto_7396 ?auto_7398 ) ( not ( = ?auto_7392 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( OBJ-AT ?auto_7397 ?auto_7396 ) ( OBJ-AT ?auto_7393 ?auto_7395 ) ( TRUCK-AT ?auto_7399 ?auto_7392 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7394 ?auto_7392 )
      ( DELIVER-2PKG-VERIFY ?auto_7393 ?auto_7394 ?auto_7392 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7401 - OBJ
      ?auto_7402 - OBJ
      ?auto_7400 - LOCATION
    )
    :vars
    (
      ?auto_7404 - LOCATION
      ?auto_7403 - CITY
      ?auto_7407 - OBJ
      ?auto_7406 - LOCATION
      ?auto_7405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7404 ?auto_7403 ) ( IN-CITY ?auto_7400 ?auto_7403 ) ( not ( = ?auto_7400 ?auto_7404 ) ) ( not ( = ?auto_7407 ?auto_7402 ) ) ( OBJ-AT ?auto_7402 ?auto_7404 ) ( not ( = ?auto_7407 ?auto_7401 ) ) ( not ( = ?auto_7402 ?auto_7401 ) ) ( IN-CITY ?auto_7406 ?auto_7403 ) ( not ( = ?auto_7400 ?auto_7406 ) ) ( not ( = ?auto_7404 ?auto_7406 ) ) ( OBJ-AT ?auto_7401 ?auto_7406 ) ( OBJ-AT ?auto_7407 ?auto_7404 ) ( TRUCK-AT ?auto_7405 ?auto_7400 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7407 ?auto_7402 ?auto_7400 )
      ( DELIVER-2PKG-VERIFY ?auto_7401 ?auto_7402 ?auto_7400 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7409 - OBJ
      ?auto_7410 - OBJ
      ?auto_7408 - LOCATION
    )
    :vars
    (
      ?auto_7412 - LOCATION
      ?auto_7411 - CITY
      ?auto_7414 - OBJ
      ?auto_7415 - LOCATION
      ?auto_7413 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7412 ?auto_7411 ) ( IN-CITY ?auto_7408 ?auto_7411 ) ( not ( = ?auto_7408 ?auto_7412 ) ) ( not ( = ?auto_7410 ?auto_7409 ) ) ( OBJ-AT ?auto_7409 ?auto_7412 ) ( not ( = ?auto_7410 ?auto_7414 ) ) ( not ( = ?auto_7409 ?auto_7414 ) ) ( IN-CITY ?auto_7415 ?auto_7411 ) ( not ( = ?auto_7408 ?auto_7415 ) ) ( not ( = ?auto_7412 ?auto_7415 ) ) ( OBJ-AT ?auto_7414 ?auto_7415 ) ( OBJ-AT ?auto_7410 ?auto_7412 ) ( TRUCK-AT ?auto_7413 ?auto_7408 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7410 ?auto_7409 ?auto_7408 )
      ( DELIVER-2PKG-VERIFY ?auto_7409 ?auto_7410 ?auto_7408 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7417 - OBJ
      ?auto_7418 - OBJ
      ?auto_7416 - LOCATION
    )
    :vars
    (
      ?auto_7420 - LOCATION
      ?auto_7419 - CITY
      ?auto_7423 - OBJ
      ?auto_7422 - LOCATION
      ?auto_7421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7420 ?auto_7419 ) ( IN-CITY ?auto_7416 ?auto_7419 ) ( not ( = ?auto_7416 ?auto_7420 ) ) ( not ( = ?auto_7423 ?auto_7417 ) ) ( OBJ-AT ?auto_7417 ?auto_7420 ) ( not ( = ?auto_7423 ?auto_7418 ) ) ( not ( = ?auto_7417 ?auto_7418 ) ) ( IN-CITY ?auto_7422 ?auto_7419 ) ( not ( = ?auto_7416 ?auto_7422 ) ) ( not ( = ?auto_7420 ?auto_7422 ) ) ( OBJ-AT ?auto_7418 ?auto_7422 ) ( OBJ-AT ?auto_7423 ?auto_7420 ) ( TRUCK-AT ?auto_7421 ?auto_7416 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7423 ?auto_7417 ?auto_7416 )
      ( DELIVER-2PKG-VERIFY ?auto_7417 ?auto_7418 ?auto_7416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7443 - OBJ
      ?auto_7444 - OBJ
      ?auto_7445 - OBJ
      ?auto_7442 - LOCATION
    )
    :vars
    (
      ?auto_7447 - LOCATION
      ?auto_7446 - CITY
      ?auto_7449 - LOCATION
      ?auto_7448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7447 ?auto_7446 ) ( IN-CITY ?auto_7442 ?auto_7446 ) ( not ( = ?auto_7442 ?auto_7447 ) ) ( not ( = ?auto_7443 ?auto_7445 ) ) ( OBJ-AT ?auto_7445 ?auto_7447 ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( not ( = ?auto_7445 ?auto_7444 ) ) ( IN-CITY ?auto_7449 ?auto_7446 ) ( not ( = ?auto_7442 ?auto_7449 ) ) ( not ( = ?auto_7447 ?auto_7449 ) ) ( OBJ-AT ?auto_7444 ?auto_7449 ) ( OBJ-AT ?auto_7443 ?auto_7447 ) ( TRUCK-AT ?auto_7448 ?auto_7442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7443 ?auto_7445 ?auto_7442 )
      ( DELIVER-3PKG-VERIFY ?auto_7443 ?auto_7444 ?auto_7445 ?auto_7442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7460 - OBJ
      ?auto_7461 - OBJ
      ?auto_7462 - OBJ
      ?auto_7459 - LOCATION
    )
    :vars
    (
      ?auto_7464 - LOCATION
      ?auto_7463 - CITY
      ?auto_7466 - LOCATION
      ?auto_7465 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7464 ?auto_7463 ) ( IN-CITY ?auto_7459 ?auto_7463 ) ( not ( = ?auto_7459 ?auto_7464 ) ) ( not ( = ?auto_7460 ?auto_7461 ) ) ( OBJ-AT ?auto_7461 ?auto_7464 ) ( not ( = ?auto_7460 ?auto_7462 ) ) ( not ( = ?auto_7461 ?auto_7462 ) ) ( IN-CITY ?auto_7466 ?auto_7463 ) ( not ( = ?auto_7459 ?auto_7466 ) ) ( not ( = ?auto_7464 ?auto_7466 ) ) ( OBJ-AT ?auto_7462 ?auto_7466 ) ( OBJ-AT ?auto_7460 ?auto_7464 ) ( TRUCK-AT ?auto_7465 ?auto_7459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7460 ?auto_7461 ?auto_7459 )
      ( DELIVER-3PKG-VERIFY ?auto_7460 ?auto_7461 ?auto_7462 ?auto_7459 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7477 - OBJ
      ?auto_7478 - OBJ
      ?auto_7479 - OBJ
      ?auto_7476 - LOCATION
    )
    :vars
    (
      ?auto_7481 - LOCATION
      ?auto_7480 - CITY
      ?auto_7483 - LOCATION
      ?auto_7482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7481 ?auto_7480 ) ( IN-CITY ?auto_7476 ?auto_7480 ) ( not ( = ?auto_7476 ?auto_7481 ) ) ( not ( = ?auto_7478 ?auto_7479 ) ) ( OBJ-AT ?auto_7479 ?auto_7481 ) ( not ( = ?auto_7478 ?auto_7477 ) ) ( not ( = ?auto_7479 ?auto_7477 ) ) ( IN-CITY ?auto_7483 ?auto_7480 ) ( not ( = ?auto_7476 ?auto_7483 ) ) ( not ( = ?auto_7481 ?auto_7483 ) ) ( OBJ-AT ?auto_7477 ?auto_7483 ) ( OBJ-AT ?auto_7478 ?auto_7481 ) ( TRUCK-AT ?auto_7482 ?auto_7476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7478 ?auto_7479 ?auto_7476 )
      ( DELIVER-3PKG-VERIFY ?auto_7477 ?auto_7478 ?auto_7479 ?auto_7476 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7494 - OBJ
      ?auto_7495 - OBJ
      ?auto_7496 - OBJ
      ?auto_7493 - LOCATION
    )
    :vars
    (
      ?auto_7498 - LOCATION
      ?auto_7497 - CITY
      ?auto_7500 - LOCATION
      ?auto_7499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7498 ?auto_7497 ) ( IN-CITY ?auto_7493 ?auto_7497 ) ( not ( = ?auto_7493 ?auto_7498 ) ) ( not ( = ?auto_7496 ?auto_7495 ) ) ( OBJ-AT ?auto_7495 ?auto_7498 ) ( not ( = ?auto_7496 ?auto_7494 ) ) ( not ( = ?auto_7495 ?auto_7494 ) ) ( IN-CITY ?auto_7500 ?auto_7497 ) ( not ( = ?auto_7493 ?auto_7500 ) ) ( not ( = ?auto_7498 ?auto_7500 ) ) ( OBJ-AT ?auto_7494 ?auto_7500 ) ( OBJ-AT ?auto_7496 ?auto_7498 ) ( TRUCK-AT ?auto_7499 ?auto_7493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7496 ?auto_7495 ?auto_7493 )
      ( DELIVER-3PKG-VERIFY ?auto_7494 ?auto_7495 ?auto_7496 ?auto_7493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7529 - OBJ
      ?auto_7530 - OBJ
      ?auto_7531 - OBJ
      ?auto_7528 - LOCATION
    )
    :vars
    (
      ?auto_7533 - LOCATION
      ?auto_7532 - CITY
      ?auto_7535 - LOCATION
      ?auto_7534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7533 ?auto_7532 ) ( IN-CITY ?auto_7528 ?auto_7532 ) ( not ( = ?auto_7528 ?auto_7533 ) ) ( not ( = ?auto_7530 ?auto_7529 ) ) ( OBJ-AT ?auto_7529 ?auto_7533 ) ( not ( = ?auto_7530 ?auto_7531 ) ) ( not ( = ?auto_7529 ?auto_7531 ) ) ( IN-CITY ?auto_7535 ?auto_7532 ) ( not ( = ?auto_7528 ?auto_7535 ) ) ( not ( = ?auto_7533 ?auto_7535 ) ) ( OBJ-AT ?auto_7531 ?auto_7535 ) ( OBJ-AT ?auto_7530 ?auto_7533 ) ( TRUCK-AT ?auto_7534 ?auto_7528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7530 ?auto_7529 ?auto_7528 )
      ( DELIVER-3PKG-VERIFY ?auto_7529 ?auto_7530 ?auto_7531 ?auto_7528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7546 - OBJ
      ?auto_7547 - OBJ
      ?auto_7548 - OBJ
      ?auto_7545 - LOCATION
    )
    :vars
    (
      ?auto_7550 - LOCATION
      ?auto_7549 - CITY
      ?auto_7552 - LOCATION
      ?auto_7551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7550 ?auto_7549 ) ( IN-CITY ?auto_7545 ?auto_7549 ) ( not ( = ?auto_7545 ?auto_7550 ) ) ( not ( = ?auto_7548 ?auto_7546 ) ) ( OBJ-AT ?auto_7546 ?auto_7550 ) ( not ( = ?auto_7548 ?auto_7547 ) ) ( not ( = ?auto_7546 ?auto_7547 ) ) ( IN-CITY ?auto_7552 ?auto_7549 ) ( not ( = ?auto_7545 ?auto_7552 ) ) ( not ( = ?auto_7550 ?auto_7552 ) ) ( OBJ-AT ?auto_7547 ?auto_7552 ) ( OBJ-AT ?auto_7548 ?auto_7550 ) ( TRUCK-AT ?auto_7551 ?auto_7545 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7548 ?auto_7546 ?auto_7545 )
      ( DELIVER-3PKG-VERIFY ?auto_7546 ?auto_7547 ?auto_7548 ?auto_7545 ) )
  )

)

