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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4521 - OBJ
      ?auto_4520 - LOCATION
    )
    :vars
    (
      ?auto_4522 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4522 ?auto_4520 ) ( IN-TRUCK ?auto_4521 ?auto_4522 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4521 ?auto_4522 ?auto_4520 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4533 - OBJ
      ?auto_4532 - LOCATION
    )
    :vars
    (
      ?auto_4534 - TRUCK
      ?auto_4535 - LOCATION
      ?auto_4536 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4533 ?auto_4534 ) ( TRUCK-AT ?auto_4534 ?auto_4535 ) ( IN-CITY ?auto_4535 ?auto_4536 ) ( IN-CITY ?auto_4532 ?auto_4536 ) ( not ( = ?auto_4532 ?auto_4535 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4534 ?auto_4535 ?auto_4532 ?auto_4536 )
      ( DELIVER-1PKG ?auto_4533 ?auto_4532 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4551 - OBJ
      ?auto_4550 - LOCATION
    )
    :vars
    (
      ?auto_4553 - TRUCK
      ?auto_4552 - LOCATION
      ?auto_4554 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4553 ?auto_4552 ) ( IN-CITY ?auto_4552 ?auto_4554 ) ( IN-CITY ?auto_4550 ?auto_4554 ) ( not ( = ?auto_4550 ?auto_4552 ) ) ( OBJ-AT ?auto_4551 ?auto_4552 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4551 ?auto_4553 ?auto_4552 )
      ( DELIVER-1PKG ?auto_4551 ?auto_4550 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4569 - OBJ
      ?auto_4568 - LOCATION
    )
    :vars
    (
      ?auto_4570 - LOCATION
      ?auto_4571 - CITY
      ?auto_4572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4570 ?auto_4571 ) ( IN-CITY ?auto_4568 ?auto_4571 ) ( not ( = ?auto_4568 ?auto_4570 ) ) ( OBJ-AT ?auto_4569 ?auto_4570 ) ( TRUCK-AT ?auto_4572 ?auto_4568 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4572 ?auto_4568 ?auto_4570 ?auto_4571 )
      ( DELIVER-1PKG ?auto_4569 ?auto_4568 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4626 - OBJ
      ?auto_4625 - LOCATION
    )
    :vars
    (
      ?auto_4627 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4627 ?auto_4625 ) ( IN-TRUCK ?auto_4626 ?auto_4627 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4626 ?auto_4627 ?auto_4625 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4629 - OBJ
      ?auto_4630 - OBJ
      ?auto_4628 - LOCATION
    )
    :vars
    (
      ?auto_4631 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4631 ?auto_4628 ) ( IN-TRUCK ?auto_4630 ?auto_4631 ) ( OBJ-AT ?auto_4629 ?auto_4628 ) ( not ( = ?auto_4629 ?auto_4630 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4630 ?auto_4628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4633 - OBJ
      ?auto_4634 - OBJ
      ?auto_4632 - LOCATION
    )
    :vars
    (
      ?auto_4635 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4635 ?auto_4632 ) ( IN-TRUCK ?auto_4633 ?auto_4635 ) ( OBJ-AT ?auto_4634 ?auto_4632 ) ( not ( = ?auto_4633 ?auto_4634 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4633 ?auto_4632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4641 - OBJ
      ?auto_4642 - OBJ
      ?auto_4643 - OBJ
      ?auto_4640 - LOCATION
    )
    :vars
    (
      ?auto_4644 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4644 ?auto_4640 ) ( IN-TRUCK ?auto_4643 ?auto_4644 ) ( OBJ-AT ?auto_4641 ?auto_4640 ) ( OBJ-AT ?auto_4642 ?auto_4640 ) ( not ( = ?auto_4641 ?auto_4642 ) ) ( not ( = ?auto_4641 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4643 ?auto_4640 ) )
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
      ?auto_4649 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4649 ?auto_4645 ) ( IN-TRUCK ?auto_4647 ?auto_4649 ) ( OBJ-AT ?auto_4646 ?auto_4645 ) ( OBJ-AT ?auto_4648 ?auto_4645 ) ( not ( = ?auto_4646 ?auto_4647 ) ) ( not ( = ?auto_4646 ?auto_4648 ) ) ( not ( = ?auto_4647 ?auto_4648 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4647 ?auto_4645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4656 - OBJ
      ?auto_4657 - OBJ
      ?auto_4658 - OBJ
      ?auto_4655 - LOCATION
    )
    :vars
    (
      ?auto_4659 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4659 ?auto_4655 ) ( IN-TRUCK ?auto_4656 ?auto_4659 ) ( OBJ-AT ?auto_4657 ?auto_4655 ) ( OBJ-AT ?auto_4658 ?auto_4655 ) ( not ( = ?auto_4656 ?auto_4657 ) ) ( not ( = ?auto_4656 ?auto_4658 ) ) ( not ( = ?auto_4657 ?auto_4658 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4656 ?auto_4655 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4676 - OBJ
      ?auto_4675 - LOCATION
    )
    :vars
    (
      ?auto_4677 - TRUCK
      ?auto_4678 - LOCATION
      ?auto_4679 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4676 ?auto_4677 ) ( TRUCK-AT ?auto_4677 ?auto_4678 ) ( IN-CITY ?auto_4678 ?auto_4679 ) ( IN-CITY ?auto_4675 ?auto_4679 ) ( not ( = ?auto_4675 ?auto_4678 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4677 ?auto_4678 ?auto_4675 ?auto_4679 )
      ( DELIVER-1PKG ?auto_4676 ?auto_4675 ) )
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
      ?auto_4684 - LOCATION
      ?auto_4685 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4682 ?auto_4683 ) ( TRUCK-AT ?auto_4683 ?auto_4684 ) ( IN-CITY ?auto_4684 ?auto_4685 ) ( IN-CITY ?auto_4680 ?auto_4685 ) ( not ( = ?auto_4680 ?auto_4684 ) ) ( OBJ-AT ?auto_4681 ?auto_4680 ) ( not ( = ?auto_4681 ?auto_4682 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4682 ?auto_4680 ) )
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
      ?auto_4690 - TRUCK
      ?auto_4689 - LOCATION
      ?auto_4691 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4687 ?auto_4690 ) ( TRUCK-AT ?auto_4690 ?auto_4689 ) ( IN-CITY ?auto_4689 ?auto_4691 ) ( IN-CITY ?auto_4686 ?auto_4691 ) ( not ( = ?auto_4686 ?auto_4689 ) ) ( OBJ-AT ?auto_4688 ?auto_4686 ) ( not ( = ?auto_4688 ?auto_4687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4688 ?auto_4687 ?auto_4686 ) )
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
      ?auto_4704 - TRUCK
      ?auto_4703 - LOCATION
      ?auto_4705 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4702 ?auto_4704 ) ( TRUCK-AT ?auto_4704 ?auto_4703 ) ( IN-CITY ?auto_4703 ?auto_4705 ) ( IN-CITY ?auto_4699 ?auto_4705 ) ( not ( = ?auto_4699 ?auto_4703 ) ) ( OBJ-AT ?auto_4700 ?auto_4699 ) ( not ( = ?auto_4700 ?auto_4702 ) ) ( OBJ-AT ?auto_4701 ?auto_4699 ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4701 ?auto_4702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4700 ?auto_4702 ?auto_4699 ) )
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
      ?auto_4711 - TRUCK
      ?auto_4710 - LOCATION
      ?auto_4712 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4708 ?auto_4711 ) ( TRUCK-AT ?auto_4711 ?auto_4710 ) ( IN-CITY ?auto_4710 ?auto_4712 ) ( IN-CITY ?auto_4706 ?auto_4712 ) ( not ( = ?auto_4706 ?auto_4710 ) ) ( OBJ-AT ?auto_4707 ?auto_4706 ) ( not ( = ?auto_4707 ?auto_4708 ) ) ( OBJ-AT ?auto_4709 ?auto_4706 ) ( not ( = ?auto_4707 ?auto_4709 ) ) ( not ( = ?auto_4708 ?auto_4709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4707 ?auto_4708 ?auto_4706 ) )
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
      ?auto_4725 - TRUCK
      ?auto_4724 - LOCATION
      ?auto_4726 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4721 ?auto_4725 ) ( TRUCK-AT ?auto_4725 ?auto_4724 ) ( IN-CITY ?auto_4724 ?auto_4726 ) ( IN-CITY ?auto_4720 ?auto_4726 ) ( not ( = ?auto_4720 ?auto_4724 ) ) ( OBJ-AT ?auto_4722 ?auto_4720 ) ( not ( = ?auto_4722 ?auto_4721 ) ) ( OBJ-AT ?auto_4723 ?auto_4720 ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4722 ?auto_4721 ?auto_4720 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4750 - OBJ
      ?auto_4749 - LOCATION
    )
    :vars
    (
      ?auto_4752 - TRUCK
      ?auto_4751 - LOCATION
      ?auto_4753 - CITY
      ?auto_4754 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4752 ?auto_4751 ) ( IN-CITY ?auto_4751 ?auto_4753 ) ( IN-CITY ?auto_4749 ?auto_4753 ) ( not ( = ?auto_4749 ?auto_4751 ) ) ( OBJ-AT ?auto_4754 ?auto_4749 ) ( not ( = ?auto_4754 ?auto_4750 ) ) ( OBJ-AT ?auto_4750 ?auto_4751 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4750 ?auto_4752 ?auto_4751 )
      ( DELIVER-2PKG ?auto_4754 ?auto_4750 ?auto_4749 ) )
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
      ?auto_4758 - TRUCK
      ?auto_4760 - LOCATION
      ?auto_4759 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4758 ?auto_4760 ) ( IN-CITY ?auto_4760 ?auto_4759 ) ( IN-CITY ?auto_4755 ?auto_4759 ) ( not ( = ?auto_4755 ?auto_4760 ) ) ( OBJ-AT ?auto_4756 ?auto_4755 ) ( not ( = ?auto_4756 ?auto_4757 ) ) ( OBJ-AT ?auto_4757 ?auto_4760 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4757 ?auto_4755 ) )
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
      ?auto_4766 - TRUCK
      ?auto_4764 - LOCATION
      ?auto_4765 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4766 ?auto_4764 ) ( IN-CITY ?auto_4764 ?auto_4765 ) ( IN-CITY ?auto_4761 ?auto_4765 ) ( not ( = ?auto_4761 ?auto_4764 ) ) ( OBJ-AT ?auto_4763 ?auto_4761 ) ( not ( = ?auto_4763 ?auto_4762 ) ) ( OBJ-AT ?auto_4762 ?auto_4764 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4763 ?auto_4762 ?auto_4761 ) )
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
      ?auto_4780 - TRUCK
      ?auto_4778 - LOCATION
      ?auto_4779 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4780 ?auto_4778 ) ( IN-CITY ?auto_4778 ?auto_4779 ) ( IN-CITY ?auto_4774 ?auto_4779 ) ( not ( = ?auto_4774 ?auto_4778 ) ) ( OBJ-AT ?auto_4776 ?auto_4774 ) ( not ( = ?auto_4776 ?auto_4777 ) ) ( OBJ-AT ?auto_4777 ?auto_4778 ) ( OBJ-AT ?auto_4775 ?auto_4774 ) ( not ( = ?auto_4775 ?auto_4776 ) ) ( not ( = ?auto_4775 ?auto_4777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4776 ?auto_4777 ?auto_4774 ) )
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
      ?auto_4787 - TRUCK
      ?auto_4785 - LOCATION
      ?auto_4786 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4787 ?auto_4785 ) ( IN-CITY ?auto_4785 ?auto_4786 ) ( IN-CITY ?auto_4781 ?auto_4786 ) ( not ( = ?auto_4781 ?auto_4785 ) ) ( OBJ-AT ?auto_4784 ?auto_4781 ) ( not ( = ?auto_4784 ?auto_4783 ) ) ( OBJ-AT ?auto_4783 ?auto_4785 ) ( OBJ-AT ?auto_4782 ?auto_4781 ) ( not ( = ?auto_4782 ?auto_4783 ) ) ( not ( = ?auto_4782 ?auto_4784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4784 ?auto_4783 ?auto_4781 ) )
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
      ?auto_4801 - TRUCK
      ?auto_4799 - LOCATION
      ?auto_4800 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4801 ?auto_4799 ) ( IN-CITY ?auto_4799 ?auto_4800 ) ( IN-CITY ?auto_4795 ?auto_4800 ) ( not ( = ?auto_4795 ?auto_4799 ) ) ( OBJ-AT ?auto_4798 ?auto_4795 ) ( not ( = ?auto_4798 ?auto_4796 ) ) ( OBJ-AT ?auto_4796 ?auto_4799 ) ( OBJ-AT ?auto_4797 ?auto_4795 ) ( not ( = ?auto_4796 ?auto_4797 ) ) ( not ( = ?auto_4797 ?auto_4798 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4798 ?auto_4796 ?auto_4795 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4825 - OBJ
      ?auto_4824 - LOCATION
    )
    :vars
    (
      ?auto_4826 - LOCATION
      ?auto_4828 - CITY
      ?auto_4827 - OBJ
      ?auto_4829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4826 ?auto_4828 ) ( IN-CITY ?auto_4824 ?auto_4828 ) ( not ( = ?auto_4824 ?auto_4826 ) ) ( OBJ-AT ?auto_4827 ?auto_4824 ) ( not ( = ?auto_4827 ?auto_4825 ) ) ( OBJ-AT ?auto_4825 ?auto_4826 ) ( TRUCK-AT ?auto_4829 ?auto_4824 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4829 ?auto_4824 ?auto_4826 ?auto_4828 )
      ( DELIVER-2PKG ?auto_4827 ?auto_4825 ?auto_4824 ) )
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
      ?auto_4834 - LOCATION
      ?auto_4833 - CITY
      ?auto_4835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4834 ?auto_4833 ) ( IN-CITY ?auto_4830 ?auto_4833 ) ( not ( = ?auto_4830 ?auto_4834 ) ) ( OBJ-AT ?auto_4831 ?auto_4830 ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( OBJ-AT ?auto_4832 ?auto_4834 ) ( TRUCK-AT ?auto_4835 ?auto_4830 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4832 ?auto_4830 ) )
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
      ?auto_4840 - LOCATION
      ?auto_4839 - CITY
      ?auto_4841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4840 ?auto_4839 ) ( IN-CITY ?auto_4836 ?auto_4839 ) ( not ( = ?auto_4836 ?auto_4840 ) ) ( OBJ-AT ?auto_4838 ?auto_4836 ) ( not ( = ?auto_4838 ?auto_4837 ) ) ( OBJ-AT ?auto_4837 ?auto_4840 ) ( TRUCK-AT ?auto_4841 ?auto_4836 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4838 ?auto_4837 ?auto_4836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4850 - OBJ
      ?auto_4851 - OBJ
      ?auto_4852 - OBJ
      ?auto_4849 - LOCATION
    )
    :vars
    (
      ?auto_4854 - LOCATION
      ?auto_4853 - CITY
      ?auto_4855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4854 ?auto_4853 ) ( IN-CITY ?auto_4849 ?auto_4853 ) ( not ( = ?auto_4849 ?auto_4854 ) ) ( OBJ-AT ?auto_4851 ?auto_4849 ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( OBJ-AT ?auto_4852 ?auto_4854 ) ( TRUCK-AT ?auto_4855 ?auto_4849 ) ( OBJ-AT ?auto_4850 ?auto_4849 ) ( not ( = ?auto_4850 ?auto_4851 ) ) ( not ( = ?auto_4850 ?auto_4852 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4851 ?auto_4852 ?auto_4849 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4857 - OBJ
      ?auto_4858 - OBJ
      ?auto_4859 - OBJ
      ?auto_4856 - LOCATION
    )
    :vars
    (
      ?auto_4861 - LOCATION
      ?auto_4860 - CITY
      ?auto_4862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4861 ?auto_4860 ) ( IN-CITY ?auto_4856 ?auto_4860 ) ( not ( = ?auto_4856 ?auto_4861 ) ) ( OBJ-AT ?auto_4857 ?auto_4856 ) ( not ( = ?auto_4857 ?auto_4858 ) ) ( OBJ-AT ?auto_4858 ?auto_4861 ) ( TRUCK-AT ?auto_4862 ?auto_4856 ) ( OBJ-AT ?auto_4859 ?auto_4856 ) ( not ( = ?auto_4857 ?auto_4859 ) ) ( not ( = ?auto_4858 ?auto_4859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4857 ?auto_4858 ?auto_4856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4871 - OBJ
      ?auto_4872 - OBJ
      ?auto_4873 - OBJ
      ?auto_4870 - LOCATION
    )
    :vars
    (
      ?auto_4875 - LOCATION
      ?auto_4874 - CITY
      ?auto_4876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4875 ?auto_4874 ) ( IN-CITY ?auto_4870 ?auto_4874 ) ( not ( = ?auto_4870 ?auto_4875 ) ) ( OBJ-AT ?auto_4873 ?auto_4870 ) ( not ( = ?auto_4873 ?auto_4871 ) ) ( OBJ-AT ?auto_4871 ?auto_4875 ) ( TRUCK-AT ?auto_4876 ?auto_4870 ) ( OBJ-AT ?auto_4872 ?auto_4870 ) ( not ( = ?auto_4871 ?auto_4872 ) ) ( not ( = ?auto_4872 ?auto_4873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4873 ?auto_4871 ?auto_4870 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4900 - OBJ
      ?auto_4899 - LOCATION
    )
    :vars
    (
      ?auto_4902 - LOCATION
      ?auto_4901 - CITY
      ?auto_4903 - OBJ
      ?auto_4904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4902 ?auto_4901 ) ( IN-CITY ?auto_4899 ?auto_4901 ) ( not ( = ?auto_4899 ?auto_4902 ) ) ( not ( = ?auto_4903 ?auto_4900 ) ) ( OBJ-AT ?auto_4900 ?auto_4902 ) ( TRUCK-AT ?auto_4904 ?auto_4899 ) ( IN-TRUCK ?auto_4903 ?auto_4904 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4903 ?auto_4899 )
      ( DELIVER-2PKG ?auto_4903 ?auto_4900 ?auto_4899 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4906 - OBJ
      ?auto_4907 - OBJ
      ?auto_4905 - LOCATION
    )
    :vars
    (
      ?auto_4909 - LOCATION
      ?auto_4908 - CITY
      ?auto_4910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4909 ?auto_4908 ) ( IN-CITY ?auto_4905 ?auto_4908 ) ( not ( = ?auto_4905 ?auto_4909 ) ) ( not ( = ?auto_4906 ?auto_4907 ) ) ( OBJ-AT ?auto_4907 ?auto_4909 ) ( TRUCK-AT ?auto_4910 ?auto_4905 ) ( IN-TRUCK ?auto_4906 ?auto_4910 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4907 ?auto_4905 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4912 - OBJ
      ?auto_4913 - OBJ
      ?auto_4911 - LOCATION
    )
    :vars
    (
      ?auto_4915 - LOCATION
      ?auto_4914 - CITY
      ?auto_4916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4915 ?auto_4914 ) ( IN-CITY ?auto_4911 ?auto_4914 ) ( not ( = ?auto_4911 ?auto_4915 ) ) ( not ( = ?auto_4913 ?auto_4912 ) ) ( OBJ-AT ?auto_4912 ?auto_4915 ) ( TRUCK-AT ?auto_4916 ?auto_4911 ) ( IN-TRUCK ?auto_4913 ?auto_4916 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4913 ?auto_4912 ?auto_4911 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4975 - OBJ
      ?auto_4974 - LOCATION
    )
    :vars
    (
      ?auto_4977 - LOCATION
      ?auto_4976 - CITY
      ?auto_4978 - OBJ
      ?auto_4979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4977 ?auto_4976 ) ( IN-CITY ?auto_4974 ?auto_4976 ) ( not ( = ?auto_4974 ?auto_4977 ) ) ( not ( = ?auto_4978 ?auto_4975 ) ) ( OBJ-AT ?auto_4975 ?auto_4977 ) ( IN-TRUCK ?auto_4978 ?auto_4979 ) ( TRUCK-AT ?auto_4979 ?auto_4977 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4979 ?auto_4977 ?auto_4974 ?auto_4976 )
      ( DELIVER-2PKG ?auto_4978 ?auto_4975 ?auto_4974 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4981 - OBJ
      ?auto_4982 - OBJ
      ?auto_4980 - LOCATION
    )
    :vars
    (
      ?auto_4984 - LOCATION
      ?auto_4985 - CITY
      ?auto_4983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4984 ?auto_4985 ) ( IN-CITY ?auto_4980 ?auto_4985 ) ( not ( = ?auto_4980 ?auto_4984 ) ) ( not ( = ?auto_4981 ?auto_4982 ) ) ( OBJ-AT ?auto_4982 ?auto_4984 ) ( IN-TRUCK ?auto_4981 ?auto_4983 ) ( TRUCK-AT ?auto_4983 ?auto_4984 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4982 ?auto_4980 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4987 - OBJ
      ?auto_4988 - OBJ
      ?auto_4986 - LOCATION
    )
    :vars
    (
      ?auto_4989 - LOCATION
      ?auto_4991 - CITY
      ?auto_4990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4989 ?auto_4991 ) ( IN-CITY ?auto_4986 ?auto_4991 ) ( not ( = ?auto_4986 ?auto_4989 ) ) ( not ( = ?auto_4988 ?auto_4987 ) ) ( OBJ-AT ?auto_4987 ?auto_4989 ) ( IN-TRUCK ?auto_4988 ?auto_4990 ) ( TRUCK-AT ?auto_4990 ?auto_4989 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4988 ?auto_4987 ?auto_4986 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5050 - OBJ
      ?auto_5049 - LOCATION
    )
    :vars
    (
      ?auto_5052 - LOCATION
      ?auto_5054 - CITY
      ?auto_5051 - OBJ
      ?auto_5053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5052 ?auto_5054 ) ( IN-CITY ?auto_5049 ?auto_5054 ) ( not ( = ?auto_5049 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5050 ) ) ( OBJ-AT ?auto_5050 ?auto_5052 ) ( TRUCK-AT ?auto_5053 ?auto_5052 ) ( OBJ-AT ?auto_5051 ?auto_5052 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5051 ?auto_5053 ?auto_5052 )
      ( DELIVER-2PKG ?auto_5051 ?auto_5050 ?auto_5049 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5056 - OBJ
      ?auto_5057 - OBJ
      ?auto_5055 - LOCATION
    )
    :vars
    (
      ?auto_5058 - LOCATION
      ?auto_5060 - CITY
      ?auto_5059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5058 ?auto_5060 ) ( IN-CITY ?auto_5055 ?auto_5060 ) ( not ( = ?auto_5055 ?auto_5058 ) ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( OBJ-AT ?auto_5057 ?auto_5058 ) ( TRUCK-AT ?auto_5059 ?auto_5058 ) ( OBJ-AT ?auto_5056 ?auto_5058 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5057 ?auto_5055 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5062 - OBJ
      ?auto_5063 - OBJ
      ?auto_5061 - LOCATION
    )
    :vars
    (
      ?auto_5066 - LOCATION
      ?auto_5065 - CITY
      ?auto_5064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5066 ?auto_5065 ) ( IN-CITY ?auto_5061 ?auto_5065 ) ( not ( = ?auto_5061 ?auto_5066 ) ) ( not ( = ?auto_5063 ?auto_5062 ) ) ( OBJ-AT ?auto_5062 ?auto_5066 ) ( TRUCK-AT ?auto_5064 ?auto_5066 ) ( OBJ-AT ?auto_5063 ?auto_5066 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5063 ?auto_5062 ?auto_5061 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5125 - OBJ
      ?auto_5124 - LOCATION
    )
    :vars
    (
      ?auto_5128 - LOCATION
      ?auto_5127 - CITY
      ?auto_5129 - OBJ
      ?auto_5126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5128 ?auto_5127 ) ( IN-CITY ?auto_5124 ?auto_5127 ) ( not ( = ?auto_5124 ?auto_5128 ) ) ( not ( = ?auto_5129 ?auto_5125 ) ) ( OBJ-AT ?auto_5125 ?auto_5128 ) ( OBJ-AT ?auto_5129 ?auto_5128 ) ( TRUCK-AT ?auto_5126 ?auto_5124 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5126 ?auto_5124 ?auto_5128 ?auto_5127 )
      ( DELIVER-2PKG ?auto_5129 ?auto_5125 ?auto_5124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5131 - OBJ
      ?auto_5132 - OBJ
      ?auto_5130 - LOCATION
    )
    :vars
    (
      ?auto_5134 - LOCATION
      ?auto_5135 - CITY
      ?auto_5133 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5134 ?auto_5135 ) ( IN-CITY ?auto_5130 ?auto_5135 ) ( not ( = ?auto_5130 ?auto_5134 ) ) ( not ( = ?auto_5131 ?auto_5132 ) ) ( OBJ-AT ?auto_5132 ?auto_5134 ) ( OBJ-AT ?auto_5131 ?auto_5134 ) ( TRUCK-AT ?auto_5133 ?auto_5130 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5132 ?auto_5130 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5137 - OBJ
      ?auto_5138 - OBJ
      ?auto_5136 - LOCATION
    )
    :vars
    (
      ?auto_5139 - LOCATION
      ?auto_5140 - CITY
      ?auto_5141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5139 ?auto_5140 ) ( IN-CITY ?auto_5136 ?auto_5140 ) ( not ( = ?auto_5136 ?auto_5139 ) ) ( not ( = ?auto_5138 ?auto_5137 ) ) ( OBJ-AT ?auto_5137 ?auto_5139 ) ( OBJ-AT ?auto_5138 ?auto_5139 ) ( TRUCK-AT ?auto_5141 ?auto_5136 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5138 ?auto_5137 ?auto_5136 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5293 - OBJ
      ?auto_5292 - LOCATION
    )
    :vars
    (
      ?auto_5294 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5294 ?auto_5292 ) ( IN-TRUCK ?auto_5293 ?auto_5294 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_5293 ?auto_5294 ?auto_5292 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5296 - OBJ
      ?auto_5297 - OBJ
      ?auto_5295 - LOCATION
    )
    :vars
    (
      ?auto_5298 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5298 ?auto_5295 ) ( IN-TRUCK ?auto_5297 ?auto_5298 ) ( OBJ-AT ?auto_5296 ?auto_5295 ) ( not ( = ?auto_5296 ?auto_5297 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5297 ?auto_5295 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5300 - OBJ
      ?auto_5301 - OBJ
      ?auto_5299 - LOCATION
    )
    :vars
    (
      ?auto_5302 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5302 ?auto_5299 ) ( IN-TRUCK ?auto_5301 ?auto_5302 ) ( OBJ-AT ?auto_5300 ?auto_5299 ) ( not ( = ?auto_5300 ?auto_5301 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5301 ?auto_5299 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5304 - OBJ
      ?auto_5305 - OBJ
      ?auto_5303 - LOCATION
    )
    :vars
    (
      ?auto_5306 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5306 ?auto_5303 ) ( IN-TRUCK ?auto_5304 ?auto_5306 ) ( OBJ-AT ?auto_5305 ?auto_5303 ) ( not ( = ?auto_5304 ?auto_5305 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5304 ?auto_5303 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5308 - OBJ
      ?auto_5309 - OBJ
      ?auto_5307 - LOCATION
    )
    :vars
    (
      ?auto_5310 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5310 ?auto_5307 ) ( IN-TRUCK ?auto_5308 ?auto_5310 ) ( OBJ-AT ?auto_5309 ?auto_5307 ) ( not ( = ?auto_5308 ?auto_5309 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5308 ?auto_5307 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5316 - OBJ
      ?auto_5317 - OBJ
      ?auto_5318 - OBJ
      ?auto_5315 - LOCATION
    )
    :vars
    (
      ?auto_5319 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5319 ?auto_5315 ) ( IN-TRUCK ?auto_5318 ?auto_5319 ) ( OBJ-AT ?auto_5316 ?auto_5315 ) ( OBJ-AT ?auto_5317 ?auto_5315 ) ( not ( = ?auto_5316 ?auto_5317 ) ) ( not ( = ?auto_5316 ?auto_5318 ) ) ( not ( = ?auto_5317 ?auto_5318 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5318 ?auto_5315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5321 - OBJ
      ?auto_5322 - OBJ
      ?auto_5323 - OBJ
      ?auto_5320 - LOCATION
    )
    :vars
    (
      ?auto_5324 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5324 ?auto_5320 ) ( IN-TRUCK ?auto_5323 ?auto_5324 ) ( OBJ-AT ?auto_5321 ?auto_5320 ) ( OBJ-AT ?auto_5322 ?auto_5320 ) ( not ( = ?auto_5321 ?auto_5322 ) ) ( not ( = ?auto_5321 ?auto_5323 ) ) ( not ( = ?auto_5322 ?auto_5323 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5323 ?auto_5320 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5326 - OBJ
      ?auto_5327 - OBJ
      ?auto_5328 - OBJ
      ?auto_5325 - LOCATION
    )
    :vars
    (
      ?auto_5329 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5329 ?auto_5325 ) ( IN-TRUCK ?auto_5327 ?auto_5329 ) ( OBJ-AT ?auto_5326 ?auto_5325 ) ( OBJ-AT ?auto_5328 ?auto_5325 ) ( not ( = ?auto_5326 ?auto_5327 ) ) ( not ( = ?auto_5326 ?auto_5328 ) ) ( not ( = ?auto_5327 ?auto_5328 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5327 ?auto_5325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5331 - OBJ
      ?auto_5332 - OBJ
      ?auto_5333 - OBJ
      ?auto_5330 - LOCATION
    )
    :vars
    (
      ?auto_5334 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5334 ?auto_5330 ) ( IN-TRUCK ?auto_5332 ?auto_5334 ) ( OBJ-AT ?auto_5331 ?auto_5330 ) ( OBJ-AT ?auto_5333 ?auto_5330 ) ( not ( = ?auto_5331 ?auto_5332 ) ) ( not ( = ?auto_5331 ?auto_5333 ) ) ( not ( = ?auto_5332 ?auto_5333 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5332 ?auto_5330 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5341 - OBJ
      ?auto_5342 - OBJ
      ?auto_5343 - OBJ
      ?auto_5340 - LOCATION
    )
    :vars
    (
      ?auto_5344 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5344 ?auto_5340 ) ( IN-TRUCK ?auto_5343 ?auto_5344 ) ( OBJ-AT ?auto_5341 ?auto_5340 ) ( OBJ-AT ?auto_5342 ?auto_5340 ) ( not ( = ?auto_5341 ?auto_5342 ) ) ( not ( = ?auto_5341 ?auto_5343 ) ) ( not ( = ?auto_5342 ?auto_5343 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5343 ?auto_5340 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5346 - OBJ
      ?auto_5347 - OBJ
      ?auto_5348 - OBJ
      ?auto_5345 - LOCATION
    )
    :vars
    (
      ?auto_5349 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5349 ?auto_5345 ) ( IN-TRUCK ?auto_5348 ?auto_5349 ) ( OBJ-AT ?auto_5346 ?auto_5345 ) ( OBJ-AT ?auto_5347 ?auto_5345 ) ( not ( = ?auto_5346 ?auto_5347 ) ) ( not ( = ?auto_5346 ?auto_5348 ) ) ( not ( = ?auto_5347 ?auto_5348 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5348 ?auto_5345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5351 - OBJ
      ?auto_5352 - OBJ
      ?auto_5353 - OBJ
      ?auto_5350 - LOCATION
    )
    :vars
    (
      ?auto_5354 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5354 ?auto_5350 ) ( IN-TRUCK ?auto_5352 ?auto_5354 ) ( OBJ-AT ?auto_5351 ?auto_5350 ) ( OBJ-AT ?auto_5353 ?auto_5350 ) ( not ( = ?auto_5351 ?auto_5352 ) ) ( not ( = ?auto_5351 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5353 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5352 ?auto_5350 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5356 - OBJ
      ?auto_5357 - OBJ
      ?auto_5358 - OBJ
      ?auto_5355 - LOCATION
    )
    :vars
    (
      ?auto_5359 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5359 ?auto_5355 ) ( IN-TRUCK ?auto_5357 ?auto_5359 ) ( OBJ-AT ?auto_5356 ?auto_5355 ) ( OBJ-AT ?auto_5358 ?auto_5355 ) ( not ( = ?auto_5356 ?auto_5357 ) ) ( not ( = ?auto_5356 ?auto_5358 ) ) ( not ( = ?auto_5357 ?auto_5358 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5357 ?auto_5355 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5366 - OBJ
      ?auto_5367 - OBJ
      ?auto_5368 - OBJ
      ?auto_5365 - LOCATION
    )
    :vars
    (
      ?auto_5369 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5369 ?auto_5365 ) ( IN-TRUCK ?auto_5366 ?auto_5369 ) ( OBJ-AT ?auto_5367 ?auto_5365 ) ( OBJ-AT ?auto_5368 ?auto_5365 ) ( not ( = ?auto_5366 ?auto_5367 ) ) ( not ( = ?auto_5366 ?auto_5368 ) ) ( not ( = ?auto_5367 ?auto_5368 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5366 ?auto_5365 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5371 - OBJ
      ?auto_5372 - OBJ
      ?auto_5373 - OBJ
      ?auto_5370 - LOCATION
    )
    :vars
    (
      ?auto_5374 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5374 ?auto_5370 ) ( IN-TRUCK ?auto_5371 ?auto_5374 ) ( OBJ-AT ?auto_5372 ?auto_5370 ) ( OBJ-AT ?auto_5373 ?auto_5370 ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( not ( = ?auto_5371 ?auto_5373 ) ) ( not ( = ?auto_5372 ?auto_5373 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5371 ?auto_5370 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5381 - OBJ
      ?auto_5382 - OBJ
      ?auto_5383 - OBJ
      ?auto_5380 - LOCATION
    )
    :vars
    (
      ?auto_5384 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5384 ?auto_5380 ) ( IN-TRUCK ?auto_5381 ?auto_5384 ) ( OBJ-AT ?auto_5382 ?auto_5380 ) ( OBJ-AT ?auto_5383 ?auto_5380 ) ( not ( = ?auto_5381 ?auto_5382 ) ) ( not ( = ?auto_5381 ?auto_5383 ) ) ( not ( = ?auto_5382 ?auto_5383 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5381 ?auto_5380 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5386 - OBJ
      ?auto_5387 - OBJ
      ?auto_5388 - OBJ
      ?auto_5385 - LOCATION
    )
    :vars
    (
      ?auto_5389 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5389 ?auto_5385 ) ( IN-TRUCK ?auto_5386 ?auto_5389 ) ( OBJ-AT ?auto_5387 ?auto_5385 ) ( OBJ-AT ?auto_5388 ?auto_5385 ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5388 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5386 ?auto_5385 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5411 - OBJ
      ?auto_5410 - LOCATION
    )
    :vars
    (
      ?auto_5412 - TRUCK
      ?auto_5413 - LOCATION
      ?auto_5414 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5411 ?auto_5412 ) ( TRUCK-AT ?auto_5412 ?auto_5413 ) ( IN-CITY ?auto_5413 ?auto_5414 ) ( IN-CITY ?auto_5410 ?auto_5414 ) ( not ( = ?auto_5410 ?auto_5413 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5412 ?auto_5413 ?auto_5410 ?auto_5414 )
      ( DELIVER-1PKG ?auto_5411 ?auto_5410 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5416 - OBJ
      ?auto_5417 - OBJ
      ?auto_5415 - LOCATION
    )
    :vars
    (
      ?auto_5420 - TRUCK
      ?auto_5419 - LOCATION
      ?auto_5418 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5417 ?auto_5420 ) ( TRUCK-AT ?auto_5420 ?auto_5419 ) ( IN-CITY ?auto_5419 ?auto_5418 ) ( IN-CITY ?auto_5415 ?auto_5418 ) ( not ( = ?auto_5415 ?auto_5419 ) ) ( OBJ-AT ?auto_5416 ?auto_5415 ) ( not ( = ?auto_5416 ?auto_5417 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5417 ?auto_5415 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5422 - OBJ
      ?auto_5423 - OBJ
      ?auto_5421 - LOCATION
    )
    :vars
    (
      ?auto_5426 - TRUCK
      ?auto_5424 - LOCATION
      ?auto_5425 - CITY
      ?auto_5427 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5423 ?auto_5426 ) ( TRUCK-AT ?auto_5426 ?auto_5424 ) ( IN-CITY ?auto_5424 ?auto_5425 ) ( IN-CITY ?auto_5421 ?auto_5425 ) ( not ( = ?auto_5421 ?auto_5424 ) ) ( OBJ-AT ?auto_5427 ?auto_5421 ) ( not ( = ?auto_5427 ?auto_5423 ) ) ( OBJ-AT ?auto_5422 ?auto_5421 ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5427 ?auto_5423 ?auto_5421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5429 - OBJ
      ?auto_5430 - OBJ
      ?auto_5428 - LOCATION
    )
    :vars
    (
      ?auto_5433 - TRUCK
      ?auto_5431 - LOCATION
      ?auto_5432 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5429 ?auto_5433 ) ( TRUCK-AT ?auto_5433 ?auto_5431 ) ( IN-CITY ?auto_5431 ?auto_5432 ) ( IN-CITY ?auto_5428 ?auto_5432 ) ( not ( = ?auto_5428 ?auto_5431 ) ) ( OBJ-AT ?auto_5430 ?auto_5428 ) ( not ( = ?auto_5430 ?auto_5429 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5430 ?auto_5429 ?auto_5428 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5435 - OBJ
      ?auto_5436 - OBJ
      ?auto_5434 - LOCATION
    )
    :vars
    (
      ?auto_5439 - TRUCK
      ?auto_5437 - LOCATION
      ?auto_5438 - CITY
      ?auto_5440 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5435 ?auto_5439 ) ( TRUCK-AT ?auto_5439 ?auto_5437 ) ( IN-CITY ?auto_5437 ?auto_5438 ) ( IN-CITY ?auto_5434 ?auto_5438 ) ( not ( = ?auto_5434 ?auto_5437 ) ) ( OBJ-AT ?auto_5440 ?auto_5434 ) ( not ( = ?auto_5440 ?auto_5435 ) ) ( OBJ-AT ?auto_5436 ?auto_5434 ) ( not ( = ?auto_5435 ?auto_5436 ) ) ( not ( = ?auto_5436 ?auto_5440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5440 ?auto_5435 ?auto_5434 ) )
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
      ?auto_5454 - TRUCK
      ?auto_5452 - LOCATION
      ?auto_5453 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5451 ?auto_5454 ) ( TRUCK-AT ?auto_5454 ?auto_5452 ) ( IN-CITY ?auto_5452 ?auto_5453 ) ( IN-CITY ?auto_5448 ?auto_5453 ) ( not ( = ?auto_5448 ?auto_5452 ) ) ( OBJ-AT ?auto_5449 ?auto_5448 ) ( not ( = ?auto_5449 ?auto_5451 ) ) ( OBJ-AT ?auto_5450 ?auto_5448 ) ( not ( = ?auto_5449 ?auto_5450 ) ) ( not ( = ?auto_5450 ?auto_5451 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5449 ?auto_5451 ?auto_5448 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5456 - OBJ
      ?auto_5457 - OBJ
      ?auto_5458 - OBJ
      ?auto_5455 - LOCATION
    )
    :vars
    (
      ?auto_5461 - TRUCK
      ?auto_5459 - LOCATION
      ?auto_5460 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5458 ?auto_5461 ) ( TRUCK-AT ?auto_5461 ?auto_5459 ) ( IN-CITY ?auto_5459 ?auto_5460 ) ( IN-CITY ?auto_5455 ?auto_5460 ) ( not ( = ?auto_5455 ?auto_5459 ) ) ( OBJ-AT ?auto_5456 ?auto_5455 ) ( not ( = ?auto_5456 ?auto_5458 ) ) ( OBJ-AT ?auto_5457 ?auto_5455 ) ( not ( = ?auto_5456 ?auto_5457 ) ) ( not ( = ?auto_5457 ?auto_5458 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5456 ?auto_5458 ?auto_5455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5463 - OBJ
      ?auto_5464 - OBJ
      ?auto_5465 - OBJ
      ?auto_5462 - LOCATION
    )
    :vars
    (
      ?auto_5468 - TRUCK
      ?auto_5466 - LOCATION
      ?auto_5467 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5464 ?auto_5468 ) ( TRUCK-AT ?auto_5468 ?auto_5466 ) ( IN-CITY ?auto_5466 ?auto_5467 ) ( IN-CITY ?auto_5462 ?auto_5467 ) ( not ( = ?auto_5462 ?auto_5466 ) ) ( OBJ-AT ?auto_5465 ?auto_5462 ) ( not ( = ?auto_5465 ?auto_5464 ) ) ( OBJ-AT ?auto_5463 ?auto_5462 ) ( not ( = ?auto_5463 ?auto_5464 ) ) ( not ( = ?auto_5463 ?auto_5465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5465 ?auto_5464 ?auto_5462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5470 - OBJ
      ?auto_5471 - OBJ
      ?auto_5472 - OBJ
      ?auto_5469 - LOCATION
    )
    :vars
    (
      ?auto_5475 - TRUCK
      ?auto_5473 - LOCATION
      ?auto_5474 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5471 ?auto_5475 ) ( TRUCK-AT ?auto_5475 ?auto_5473 ) ( IN-CITY ?auto_5473 ?auto_5474 ) ( IN-CITY ?auto_5469 ?auto_5474 ) ( not ( = ?auto_5469 ?auto_5473 ) ) ( OBJ-AT ?auto_5470 ?auto_5469 ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( OBJ-AT ?auto_5472 ?auto_5469 ) ( not ( = ?auto_5470 ?auto_5472 ) ) ( not ( = ?auto_5471 ?auto_5472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5470 ?auto_5471 ?auto_5469 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5484 - OBJ
      ?auto_5485 - OBJ
      ?auto_5486 - OBJ
      ?auto_5483 - LOCATION
    )
    :vars
    (
      ?auto_5489 - TRUCK
      ?auto_5487 - LOCATION
      ?auto_5488 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5486 ?auto_5489 ) ( TRUCK-AT ?auto_5489 ?auto_5487 ) ( IN-CITY ?auto_5487 ?auto_5488 ) ( IN-CITY ?auto_5483 ?auto_5488 ) ( not ( = ?auto_5483 ?auto_5487 ) ) ( OBJ-AT ?auto_5485 ?auto_5483 ) ( not ( = ?auto_5485 ?auto_5486 ) ) ( OBJ-AT ?auto_5484 ?auto_5483 ) ( not ( = ?auto_5484 ?auto_5485 ) ) ( not ( = ?auto_5484 ?auto_5486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5485 ?auto_5486 ?auto_5483 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5491 - OBJ
      ?auto_5492 - OBJ
      ?auto_5493 - OBJ
      ?auto_5490 - LOCATION
    )
    :vars
    (
      ?auto_5496 - TRUCK
      ?auto_5494 - LOCATION
      ?auto_5495 - CITY
      ?auto_5497 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5493 ?auto_5496 ) ( TRUCK-AT ?auto_5496 ?auto_5494 ) ( IN-CITY ?auto_5494 ?auto_5495 ) ( IN-CITY ?auto_5490 ?auto_5495 ) ( not ( = ?auto_5490 ?auto_5494 ) ) ( OBJ-AT ?auto_5497 ?auto_5490 ) ( not ( = ?auto_5497 ?auto_5493 ) ) ( OBJ-AT ?auto_5491 ?auto_5490 ) ( OBJ-AT ?auto_5492 ?auto_5490 ) ( not ( = ?auto_5491 ?auto_5492 ) ) ( not ( = ?auto_5491 ?auto_5493 ) ) ( not ( = ?auto_5491 ?auto_5497 ) ) ( not ( = ?auto_5492 ?auto_5493 ) ) ( not ( = ?auto_5492 ?auto_5497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5497 ?auto_5493 ?auto_5490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5499 - OBJ
      ?auto_5500 - OBJ
      ?auto_5501 - OBJ
      ?auto_5498 - LOCATION
    )
    :vars
    (
      ?auto_5504 - TRUCK
      ?auto_5502 - LOCATION
      ?auto_5503 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5500 ?auto_5504 ) ( TRUCK-AT ?auto_5504 ?auto_5502 ) ( IN-CITY ?auto_5502 ?auto_5503 ) ( IN-CITY ?auto_5498 ?auto_5503 ) ( not ( = ?auto_5498 ?auto_5502 ) ) ( OBJ-AT ?auto_5501 ?auto_5498 ) ( not ( = ?auto_5501 ?auto_5500 ) ) ( OBJ-AT ?auto_5499 ?auto_5498 ) ( not ( = ?auto_5499 ?auto_5500 ) ) ( not ( = ?auto_5499 ?auto_5501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5501 ?auto_5500 ?auto_5498 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5506 - OBJ
      ?auto_5507 - OBJ
      ?auto_5508 - OBJ
      ?auto_5505 - LOCATION
    )
    :vars
    (
      ?auto_5511 - TRUCK
      ?auto_5509 - LOCATION
      ?auto_5510 - CITY
      ?auto_5512 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5507 ?auto_5511 ) ( TRUCK-AT ?auto_5511 ?auto_5509 ) ( IN-CITY ?auto_5509 ?auto_5510 ) ( IN-CITY ?auto_5505 ?auto_5510 ) ( not ( = ?auto_5505 ?auto_5509 ) ) ( OBJ-AT ?auto_5512 ?auto_5505 ) ( not ( = ?auto_5512 ?auto_5507 ) ) ( OBJ-AT ?auto_5506 ?auto_5505 ) ( OBJ-AT ?auto_5508 ?auto_5505 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( not ( = ?auto_5506 ?auto_5508 ) ) ( not ( = ?auto_5506 ?auto_5512 ) ) ( not ( = ?auto_5507 ?auto_5508 ) ) ( not ( = ?auto_5508 ?auto_5512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5512 ?auto_5507 ?auto_5505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5522 - OBJ
      ?auto_5523 - OBJ
      ?auto_5524 - OBJ
      ?auto_5521 - LOCATION
    )
    :vars
    (
      ?auto_5527 - TRUCK
      ?auto_5525 - LOCATION
      ?auto_5526 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5522 ?auto_5527 ) ( TRUCK-AT ?auto_5527 ?auto_5525 ) ( IN-CITY ?auto_5525 ?auto_5526 ) ( IN-CITY ?auto_5521 ?auto_5526 ) ( not ( = ?auto_5521 ?auto_5525 ) ) ( OBJ-AT ?auto_5523 ?auto_5521 ) ( not ( = ?auto_5523 ?auto_5522 ) ) ( OBJ-AT ?auto_5524 ?auto_5521 ) ( not ( = ?auto_5522 ?auto_5524 ) ) ( not ( = ?auto_5523 ?auto_5524 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5523 ?auto_5522 ?auto_5521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5529 - OBJ
      ?auto_5530 - OBJ
      ?auto_5531 - OBJ
      ?auto_5528 - LOCATION
    )
    :vars
    (
      ?auto_5534 - TRUCK
      ?auto_5532 - LOCATION
      ?auto_5533 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5529 ?auto_5534 ) ( TRUCK-AT ?auto_5534 ?auto_5532 ) ( IN-CITY ?auto_5532 ?auto_5533 ) ( IN-CITY ?auto_5528 ?auto_5533 ) ( not ( = ?auto_5528 ?auto_5532 ) ) ( OBJ-AT ?auto_5530 ?auto_5528 ) ( not ( = ?auto_5530 ?auto_5529 ) ) ( OBJ-AT ?auto_5531 ?auto_5528 ) ( not ( = ?auto_5529 ?auto_5531 ) ) ( not ( = ?auto_5530 ?auto_5531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5530 ?auto_5529 ?auto_5528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5543 - OBJ
      ?auto_5544 - OBJ
      ?auto_5545 - OBJ
      ?auto_5542 - LOCATION
    )
    :vars
    (
      ?auto_5548 - TRUCK
      ?auto_5546 - LOCATION
      ?auto_5547 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5543 ?auto_5548 ) ( TRUCK-AT ?auto_5548 ?auto_5546 ) ( IN-CITY ?auto_5546 ?auto_5547 ) ( IN-CITY ?auto_5542 ?auto_5547 ) ( not ( = ?auto_5542 ?auto_5546 ) ) ( OBJ-AT ?auto_5545 ?auto_5542 ) ( not ( = ?auto_5545 ?auto_5543 ) ) ( OBJ-AT ?auto_5544 ?auto_5542 ) ( not ( = ?auto_5543 ?auto_5544 ) ) ( not ( = ?auto_5544 ?auto_5545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5545 ?auto_5543 ?auto_5542 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5550 - OBJ
      ?auto_5551 - OBJ
      ?auto_5552 - OBJ
      ?auto_5549 - LOCATION
    )
    :vars
    (
      ?auto_5555 - TRUCK
      ?auto_5553 - LOCATION
      ?auto_5554 - CITY
      ?auto_5556 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5550 ?auto_5555 ) ( TRUCK-AT ?auto_5555 ?auto_5553 ) ( IN-CITY ?auto_5553 ?auto_5554 ) ( IN-CITY ?auto_5549 ?auto_5554 ) ( not ( = ?auto_5549 ?auto_5553 ) ) ( OBJ-AT ?auto_5556 ?auto_5549 ) ( not ( = ?auto_5556 ?auto_5550 ) ) ( OBJ-AT ?auto_5551 ?auto_5549 ) ( OBJ-AT ?auto_5552 ?auto_5549 ) ( not ( = ?auto_5550 ?auto_5551 ) ) ( not ( = ?auto_5550 ?auto_5552 ) ) ( not ( = ?auto_5551 ?auto_5552 ) ) ( not ( = ?auto_5551 ?auto_5556 ) ) ( not ( = ?auto_5552 ?auto_5556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5556 ?auto_5550 ?auto_5549 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5589 - OBJ
      ?auto_5588 - LOCATION
    )
    :vars
    (
      ?auto_5592 - TRUCK
      ?auto_5590 - LOCATION
      ?auto_5591 - CITY
      ?auto_5593 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5592 ?auto_5590 ) ( IN-CITY ?auto_5590 ?auto_5591 ) ( IN-CITY ?auto_5588 ?auto_5591 ) ( not ( = ?auto_5588 ?auto_5590 ) ) ( OBJ-AT ?auto_5593 ?auto_5588 ) ( not ( = ?auto_5593 ?auto_5589 ) ) ( OBJ-AT ?auto_5589 ?auto_5590 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5589 ?auto_5592 ?auto_5590 )
      ( DELIVER-2PKG ?auto_5593 ?auto_5589 ?auto_5588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5595 - OBJ
      ?auto_5596 - OBJ
      ?auto_5594 - LOCATION
    )
    :vars
    (
      ?auto_5599 - TRUCK
      ?auto_5597 - LOCATION
      ?auto_5598 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5599 ?auto_5597 ) ( IN-CITY ?auto_5597 ?auto_5598 ) ( IN-CITY ?auto_5594 ?auto_5598 ) ( not ( = ?auto_5594 ?auto_5597 ) ) ( OBJ-AT ?auto_5595 ?auto_5594 ) ( not ( = ?auto_5595 ?auto_5596 ) ) ( OBJ-AT ?auto_5596 ?auto_5597 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5596 ?auto_5594 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5601 - OBJ
      ?auto_5602 - OBJ
      ?auto_5600 - LOCATION
    )
    :vars
    (
      ?auto_5605 - TRUCK
      ?auto_5606 - LOCATION
      ?auto_5603 - CITY
      ?auto_5604 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5605 ?auto_5606 ) ( IN-CITY ?auto_5606 ?auto_5603 ) ( IN-CITY ?auto_5600 ?auto_5603 ) ( not ( = ?auto_5600 ?auto_5606 ) ) ( OBJ-AT ?auto_5604 ?auto_5600 ) ( not ( = ?auto_5604 ?auto_5602 ) ) ( OBJ-AT ?auto_5602 ?auto_5606 ) ( OBJ-AT ?auto_5601 ?auto_5600 ) ( not ( = ?auto_5601 ?auto_5602 ) ) ( not ( = ?auto_5601 ?auto_5604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5604 ?auto_5602 ?auto_5600 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5608 - OBJ
      ?auto_5609 - OBJ
      ?auto_5607 - LOCATION
    )
    :vars
    (
      ?auto_5611 - TRUCK
      ?auto_5612 - LOCATION
      ?auto_5610 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5611 ?auto_5612 ) ( IN-CITY ?auto_5612 ?auto_5610 ) ( IN-CITY ?auto_5607 ?auto_5610 ) ( not ( = ?auto_5607 ?auto_5612 ) ) ( OBJ-AT ?auto_5609 ?auto_5607 ) ( not ( = ?auto_5609 ?auto_5608 ) ) ( OBJ-AT ?auto_5608 ?auto_5612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5609 ?auto_5608 ?auto_5607 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5614 - OBJ
      ?auto_5615 - OBJ
      ?auto_5613 - LOCATION
    )
    :vars
    (
      ?auto_5618 - TRUCK
      ?auto_5619 - LOCATION
      ?auto_5616 - CITY
      ?auto_5617 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5618 ?auto_5619 ) ( IN-CITY ?auto_5619 ?auto_5616 ) ( IN-CITY ?auto_5613 ?auto_5616 ) ( not ( = ?auto_5613 ?auto_5619 ) ) ( OBJ-AT ?auto_5617 ?auto_5613 ) ( not ( = ?auto_5617 ?auto_5614 ) ) ( OBJ-AT ?auto_5614 ?auto_5619 ) ( OBJ-AT ?auto_5615 ?auto_5613 ) ( not ( = ?auto_5614 ?auto_5615 ) ) ( not ( = ?auto_5615 ?auto_5617 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5617 ?auto_5614 ?auto_5613 ) )
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
      ?auto_5631 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5632 ?auto_5633 ) ( IN-CITY ?auto_5633 ?auto_5631 ) ( IN-CITY ?auto_5627 ?auto_5631 ) ( not ( = ?auto_5627 ?auto_5633 ) ) ( OBJ-AT ?auto_5628 ?auto_5627 ) ( not ( = ?auto_5628 ?auto_5630 ) ) ( OBJ-AT ?auto_5630 ?auto_5633 ) ( OBJ-AT ?auto_5629 ?auto_5627 ) ( not ( = ?auto_5628 ?auto_5629 ) ) ( not ( = ?auto_5629 ?auto_5630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5628 ?auto_5630 ?auto_5627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5635 - OBJ
      ?auto_5636 - OBJ
      ?auto_5637 - OBJ
      ?auto_5634 - LOCATION
    )
    :vars
    (
      ?auto_5639 - TRUCK
      ?auto_5640 - LOCATION
      ?auto_5638 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5639 ?auto_5640 ) ( IN-CITY ?auto_5640 ?auto_5638 ) ( IN-CITY ?auto_5634 ?auto_5638 ) ( not ( = ?auto_5634 ?auto_5640 ) ) ( OBJ-AT ?auto_5635 ?auto_5634 ) ( not ( = ?auto_5635 ?auto_5637 ) ) ( OBJ-AT ?auto_5637 ?auto_5640 ) ( OBJ-AT ?auto_5636 ?auto_5634 ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( not ( = ?auto_5636 ?auto_5637 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5635 ?auto_5637 ?auto_5634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5642 - OBJ
      ?auto_5643 - OBJ
      ?auto_5644 - OBJ
      ?auto_5641 - LOCATION
    )
    :vars
    (
      ?auto_5646 - TRUCK
      ?auto_5647 - LOCATION
      ?auto_5645 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5646 ?auto_5647 ) ( IN-CITY ?auto_5647 ?auto_5645 ) ( IN-CITY ?auto_5641 ?auto_5645 ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( OBJ-AT ?auto_5644 ?auto_5641 ) ( not ( = ?auto_5644 ?auto_5643 ) ) ( OBJ-AT ?auto_5643 ?auto_5647 ) ( OBJ-AT ?auto_5642 ?auto_5641 ) ( not ( = ?auto_5642 ?auto_5643 ) ) ( not ( = ?auto_5642 ?auto_5644 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5644 ?auto_5643 ?auto_5641 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5649 - OBJ
      ?auto_5650 - OBJ
      ?auto_5651 - OBJ
      ?auto_5648 - LOCATION
    )
    :vars
    (
      ?auto_5653 - TRUCK
      ?auto_5654 - LOCATION
      ?auto_5652 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5653 ?auto_5654 ) ( IN-CITY ?auto_5654 ?auto_5652 ) ( IN-CITY ?auto_5648 ?auto_5652 ) ( not ( = ?auto_5648 ?auto_5654 ) ) ( OBJ-AT ?auto_5649 ?auto_5648 ) ( not ( = ?auto_5649 ?auto_5650 ) ) ( OBJ-AT ?auto_5650 ?auto_5654 ) ( OBJ-AT ?auto_5651 ?auto_5648 ) ( not ( = ?auto_5649 ?auto_5651 ) ) ( not ( = ?auto_5650 ?auto_5651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5649 ?auto_5650 ?auto_5648 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5663 - OBJ
      ?auto_5664 - OBJ
      ?auto_5665 - OBJ
      ?auto_5662 - LOCATION
    )
    :vars
    (
      ?auto_5667 - TRUCK
      ?auto_5668 - LOCATION
      ?auto_5666 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5667 ?auto_5668 ) ( IN-CITY ?auto_5668 ?auto_5666 ) ( IN-CITY ?auto_5662 ?auto_5666 ) ( not ( = ?auto_5662 ?auto_5668 ) ) ( OBJ-AT ?auto_5664 ?auto_5662 ) ( not ( = ?auto_5664 ?auto_5665 ) ) ( OBJ-AT ?auto_5665 ?auto_5668 ) ( OBJ-AT ?auto_5663 ?auto_5662 ) ( not ( = ?auto_5663 ?auto_5664 ) ) ( not ( = ?auto_5663 ?auto_5665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5664 ?auto_5665 ?auto_5662 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5670 - OBJ
      ?auto_5671 - OBJ
      ?auto_5672 - OBJ
      ?auto_5669 - LOCATION
    )
    :vars
    (
      ?auto_5675 - TRUCK
      ?auto_5676 - LOCATION
      ?auto_5673 - CITY
      ?auto_5674 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5675 ?auto_5676 ) ( IN-CITY ?auto_5676 ?auto_5673 ) ( IN-CITY ?auto_5669 ?auto_5673 ) ( not ( = ?auto_5669 ?auto_5676 ) ) ( OBJ-AT ?auto_5674 ?auto_5669 ) ( not ( = ?auto_5674 ?auto_5672 ) ) ( OBJ-AT ?auto_5672 ?auto_5676 ) ( OBJ-AT ?auto_5670 ?auto_5669 ) ( OBJ-AT ?auto_5671 ?auto_5669 ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( not ( = ?auto_5670 ?auto_5672 ) ) ( not ( = ?auto_5670 ?auto_5674 ) ) ( not ( = ?auto_5671 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5674 ?auto_5672 ?auto_5669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5678 - OBJ
      ?auto_5679 - OBJ
      ?auto_5680 - OBJ
      ?auto_5677 - LOCATION
    )
    :vars
    (
      ?auto_5682 - TRUCK
      ?auto_5683 - LOCATION
      ?auto_5681 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5682 ?auto_5683 ) ( IN-CITY ?auto_5683 ?auto_5681 ) ( IN-CITY ?auto_5677 ?auto_5681 ) ( not ( = ?auto_5677 ?auto_5683 ) ) ( OBJ-AT ?auto_5680 ?auto_5677 ) ( not ( = ?auto_5680 ?auto_5679 ) ) ( OBJ-AT ?auto_5679 ?auto_5683 ) ( OBJ-AT ?auto_5678 ?auto_5677 ) ( not ( = ?auto_5678 ?auto_5679 ) ) ( not ( = ?auto_5678 ?auto_5680 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5680 ?auto_5679 ?auto_5677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5685 - OBJ
      ?auto_5686 - OBJ
      ?auto_5687 - OBJ
      ?auto_5684 - LOCATION
    )
    :vars
    (
      ?auto_5690 - TRUCK
      ?auto_5691 - LOCATION
      ?auto_5688 - CITY
      ?auto_5689 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5690 ?auto_5691 ) ( IN-CITY ?auto_5691 ?auto_5688 ) ( IN-CITY ?auto_5684 ?auto_5688 ) ( not ( = ?auto_5684 ?auto_5691 ) ) ( OBJ-AT ?auto_5689 ?auto_5684 ) ( not ( = ?auto_5689 ?auto_5686 ) ) ( OBJ-AT ?auto_5686 ?auto_5691 ) ( OBJ-AT ?auto_5685 ?auto_5684 ) ( OBJ-AT ?auto_5687 ?auto_5684 ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( not ( = ?auto_5685 ?auto_5687 ) ) ( not ( = ?auto_5685 ?auto_5689 ) ) ( not ( = ?auto_5686 ?auto_5687 ) ) ( not ( = ?auto_5687 ?auto_5689 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5689 ?auto_5686 ?auto_5684 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5701 - OBJ
      ?auto_5702 - OBJ
      ?auto_5703 - OBJ
      ?auto_5700 - LOCATION
    )
    :vars
    (
      ?auto_5705 - TRUCK
      ?auto_5706 - LOCATION
      ?auto_5704 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5705 ?auto_5706 ) ( IN-CITY ?auto_5706 ?auto_5704 ) ( IN-CITY ?auto_5700 ?auto_5704 ) ( not ( = ?auto_5700 ?auto_5706 ) ) ( OBJ-AT ?auto_5702 ?auto_5700 ) ( not ( = ?auto_5702 ?auto_5701 ) ) ( OBJ-AT ?auto_5701 ?auto_5706 ) ( OBJ-AT ?auto_5703 ?auto_5700 ) ( not ( = ?auto_5701 ?auto_5703 ) ) ( not ( = ?auto_5702 ?auto_5703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5702 ?auto_5701 ?auto_5700 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5708 - OBJ
      ?auto_5709 - OBJ
      ?auto_5710 - OBJ
      ?auto_5707 - LOCATION
    )
    :vars
    (
      ?auto_5712 - TRUCK
      ?auto_5713 - LOCATION
      ?auto_5711 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5712 ?auto_5713 ) ( IN-CITY ?auto_5713 ?auto_5711 ) ( IN-CITY ?auto_5707 ?auto_5711 ) ( not ( = ?auto_5707 ?auto_5713 ) ) ( OBJ-AT ?auto_5709 ?auto_5707 ) ( not ( = ?auto_5709 ?auto_5708 ) ) ( OBJ-AT ?auto_5708 ?auto_5713 ) ( OBJ-AT ?auto_5710 ?auto_5707 ) ( not ( = ?auto_5708 ?auto_5710 ) ) ( not ( = ?auto_5709 ?auto_5710 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5709 ?auto_5708 ?auto_5707 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5722 - OBJ
      ?auto_5723 - OBJ
      ?auto_5724 - OBJ
      ?auto_5721 - LOCATION
    )
    :vars
    (
      ?auto_5726 - TRUCK
      ?auto_5727 - LOCATION
      ?auto_5725 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5726 ?auto_5727 ) ( IN-CITY ?auto_5727 ?auto_5725 ) ( IN-CITY ?auto_5721 ?auto_5725 ) ( not ( = ?auto_5721 ?auto_5727 ) ) ( OBJ-AT ?auto_5724 ?auto_5721 ) ( not ( = ?auto_5724 ?auto_5722 ) ) ( OBJ-AT ?auto_5722 ?auto_5727 ) ( OBJ-AT ?auto_5723 ?auto_5721 ) ( not ( = ?auto_5722 ?auto_5723 ) ) ( not ( = ?auto_5723 ?auto_5724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5724 ?auto_5722 ?auto_5721 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5729 - OBJ
      ?auto_5730 - OBJ
      ?auto_5731 - OBJ
      ?auto_5728 - LOCATION
    )
    :vars
    (
      ?auto_5734 - TRUCK
      ?auto_5735 - LOCATION
      ?auto_5732 - CITY
      ?auto_5733 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5734 ?auto_5735 ) ( IN-CITY ?auto_5735 ?auto_5732 ) ( IN-CITY ?auto_5728 ?auto_5732 ) ( not ( = ?auto_5728 ?auto_5735 ) ) ( OBJ-AT ?auto_5733 ?auto_5728 ) ( not ( = ?auto_5733 ?auto_5729 ) ) ( OBJ-AT ?auto_5729 ?auto_5735 ) ( OBJ-AT ?auto_5730 ?auto_5728 ) ( OBJ-AT ?auto_5731 ?auto_5728 ) ( not ( = ?auto_5729 ?auto_5730 ) ) ( not ( = ?auto_5729 ?auto_5731 ) ) ( not ( = ?auto_5730 ?auto_5731 ) ) ( not ( = ?auto_5730 ?auto_5733 ) ) ( not ( = ?auto_5731 ?auto_5733 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5733 ?auto_5729 ?auto_5728 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5768 - OBJ
      ?auto_5767 - LOCATION
    )
    :vars
    (
      ?auto_5772 - LOCATION
      ?auto_5769 - CITY
      ?auto_5770 - OBJ
      ?auto_5771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5772 ?auto_5769 ) ( IN-CITY ?auto_5767 ?auto_5769 ) ( not ( = ?auto_5767 ?auto_5772 ) ) ( OBJ-AT ?auto_5770 ?auto_5767 ) ( not ( = ?auto_5770 ?auto_5768 ) ) ( OBJ-AT ?auto_5768 ?auto_5772 ) ( TRUCK-AT ?auto_5771 ?auto_5767 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5771 ?auto_5767 ?auto_5772 ?auto_5769 )
      ( DELIVER-2PKG ?auto_5770 ?auto_5768 ?auto_5767 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5774 - OBJ
      ?auto_5775 - OBJ
      ?auto_5773 - LOCATION
    )
    :vars
    (
      ?auto_5776 - LOCATION
      ?auto_5777 - CITY
      ?auto_5778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5776 ?auto_5777 ) ( IN-CITY ?auto_5773 ?auto_5777 ) ( not ( = ?auto_5773 ?auto_5776 ) ) ( OBJ-AT ?auto_5774 ?auto_5773 ) ( not ( = ?auto_5774 ?auto_5775 ) ) ( OBJ-AT ?auto_5775 ?auto_5776 ) ( TRUCK-AT ?auto_5778 ?auto_5773 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5775 ?auto_5773 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5780 - OBJ
      ?auto_5781 - OBJ
      ?auto_5779 - LOCATION
    )
    :vars
    (
      ?auto_5783 - LOCATION
      ?auto_5784 - CITY
      ?auto_5782 - OBJ
      ?auto_5785 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5783 ?auto_5784 ) ( IN-CITY ?auto_5779 ?auto_5784 ) ( not ( = ?auto_5779 ?auto_5783 ) ) ( OBJ-AT ?auto_5782 ?auto_5779 ) ( not ( = ?auto_5782 ?auto_5781 ) ) ( OBJ-AT ?auto_5781 ?auto_5783 ) ( TRUCK-AT ?auto_5785 ?auto_5779 ) ( OBJ-AT ?auto_5780 ?auto_5779 ) ( not ( = ?auto_5780 ?auto_5781 ) ) ( not ( = ?auto_5780 ?auto_5782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5782 ?auto_5781 ?auto_5779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5787 - OBJ
      ?auto_5788 - OBJ
      ?auto_5786 - LOCATION
    )
    :vars
    (
      ?auto_5789 - LOCATION
      ?auto_5790 - CITY
      ?auto_5791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5789 ?auto_5790 ) ( IN-CITY ?auto_5786 ?auto_5790 ) ( not ( = ?auto_5786 ?auto_5789 ) ) ( OBJ-AT ?auto_5788 ?auto_5786 ) ( not ( = ?auto_5788 ?auto_5787 ) ) ( OBJ-AT ?auto_5787 ?auto_5789 ) ( TRUCK-AT ?auto_5791 ?auto_5786 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5788 ?auto_5787 ?auto_5786 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5793 - OBJ
      ?auto_5794 - OBJ
      ?auto_5792 - LOCATION
    )
    :vars
    (
      ?auto_5796 - LOCATION
      ?auto_5797 - CITY
      ?auto_5795 - OBJ
      ?auto_5798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5796 ?auto_5797 ) ( IN-CITY ?auto_5792 ?auto_5797 ) ( not ( = ?auto_5792 ?auto_5796 ) ) ( OBJ-AT ?auto_5795 ?auto_5792 ) ( not ( = ?auto_5795 ?auto_5793 ) ) ( OBJ-AT ?auto_5793 ?auto_5796 ) ( TRUCK-AT ?auto_5798 ?auto_5792 ) ( OBJ-AT ?auto_5794 ?auto_5792 ) ( not ( = ?auto_5793 ?auto_5794 ) ) ( not ( = ?auto_5794 ?auto_5795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5795 ?auto_5793 ?auto_5792 ) )
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
      ?auto_5810 - LOCATION
      ?auto_5811 - CITY
      ?auto_5812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5810 ?auto_5811 ) ( IN-CITY ?auto_5806 ?auto_5811 ) ( not ( = ?auto_5806 ?auto_5810 ) ) ( OBJ-AT ?auto_5807 ?auto_5806 ) ( not ( = ?auto_5807 ?auto_5809 ) ) ( OBJ-AT ?auto_5809 ?auto_5810 ) ( TRUCK-AT ?auto_5812 ?auto_5806 ) ( OBJ-AT ?auto_5808 ?auto_5806 ) ( not ( = ?auto_5807 ?auto_5808 ) ) ( not ( = ?auto_5808 ?auto_5809 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5807 ?auto_5809 ?auto_5806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5814 - OBJ
      ?auto_5815 - OBJ
      ?auto_5816 - OBJ
      ?auto_5813 - LOCATION
    )
    :vars
    (
      ?auto_5817 - LOCATION
      ?auto_5818 - CITY
      ?auto_5819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5817 ?auto_5818 ) ( IN-CITY ?auto_5813 ?auto_5818 ) ( not ( = ?auto_5813 ?auto_5817 ) ) ( OBJ-AT ?auto_5814 ?auto_5813 ) ( not ( = ?auto_5814 ?auto_5816 ) ) ( OBJ-AT ?auto_5816 ?auto_5817 ) ( TRUCK-AT ?auto_5819 ?auto_5813 ) ( OBJ-AT ?auto_5815 ?auto_5813 ) ( not ( = ?auto_5814 ?auto_5815 ) ) ( not ( = ?auto_5815 ?auto_5816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5814 ?auto_5816 ?auto_5813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5821 - OBJ
      ?auto_5822 - OBJ
      ?auto_5823 - OBJ
      ?auto_5820 - LOCATION
    )
    :vars
    (
      ?auto_5824 - LOCATION
      ?auto_5825 - CITY
      ?auto_5826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5824 ?auto_5825 ) ( IN-CITY ?auto_5820 ?auto_5825 ) ( not ( = ?auto_5820 ?auto_5824 ) ) ( OBJ-AT ?auto_5823 ?auto_5820 ) ( not ( = ?auto_5823 ?auto_5822 ) ) ( OBJ-AT ?auto_5822 ?auto_5824 ) ( TRUCK-AT ?auto_5826 ?auto_5820 ) ( OBJ-AT ?auto_5821 ?auto_5820 ) ( not ( = ?auto_5821 ?auto_5822 ) ) ( not ( = ?auto_5821 ?auto_5823 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5823 ?auto_5822 ?auto_5820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5828 - OBJ
      ?auto_5829 - OBJ
      ?auto_5830 - OBJ
      ?auto_5827 - LOCATION
    )
    :vars
    (
      ?auto_5831 - LOCATION
      ?auto_5832 - CITY
      ?auto_5833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5831 ?auto_5832 ) ( IN-CITY ?auto_5827 ?auto_5832 ) ( not ( = ?auto_5827 ?auto_5831 ) ) ( OBJ-AT ?auto_5828 ?auto_5827 ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( OBJ-AT ?auto_5829 ?auto_5831 ) ( TRUCK-AT ?auto_5833 ?auto_5827 ) ( OBJ-AT ?auto_5830 ?auto_5827 ) ( not ( = ?auto_5828 ?auto_5830 ) ) ( not ( = ?auto_5829 ?auto_5830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5828 ?auto_5829 ?auto_5827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5842 - OBJ
      ?auto_5843 - OBJ
      ?auto_5844 - OBJ
      ?auto_5841 - LOCATION
    )
    :vars
    (
      ?auto_5845 - LOCATION
      ?auto_5846 - CITY
      ?auto_5847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5845 ?auto_5846 ) ( IN-CITY ?auto_5841 ?auto_5846 ) ( not ( = ?auto_5841 ?auto_5845 ) ) ( OBJ-AT ?auto_5843 ?auto_5841 ) ( not ( = ?auto_5843 ?auto_5844 ) ) ( OBJ-AT ?auto_5844 ?auto_5845 ) ( TRUCK-AT ?auto_5847 ?auto_5841 ) ( OBJ-AT ?auto_5842 ?auto_5841 ) ( not ( = ?auto_5842 ?auto_5843 ) ) ( not ( = ?auto_5842 ?auto_5844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5843 ?auto_5844 ?auto_5841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5849 - OBJ
      ?auto_5850 - OBJ
      ?auto_5851 - OBJ
      ?auto_5848 - LOCATION
    )
    :vars
    (
      ?auto_5853 - LOCATION
      ?auto_5854 - CITY
      ?auto_5852 - OBJ
      ?auto_5855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5853 ?auto_5854 ) ( IN-CITY ?auto_5848 ?auto_5854 ) ( not ( = ?auto_5848 ?auto_5853 ) ) ( OBJ-AT ?auto_5852 ?auto_5848 ) ( not ( = ?auto_5852 ?auto_5851 ) ) ( OBJ-AT ?auto_5851 ?auto_5853 ) ( TRUCK-AT ?auto_5855 ?auto_5848 ) ( OBJ-AT ?auto_5849 ?auto_5848 ) ( OBJ-AT ?auto_5850 ?auto_5848 ) ( not ( = ?auto_5849 ?auto_5850 ) ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( not ( = ?auto_5849 ?auto_5852 ) ) ( not ( = ?auto_5850 ?auto_5851 ) ) ( not ( = ?auto_5850 ?auto_5852 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5852 ?auto_5851 ?auto_5848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5857 - OBJ
      ?auto_5858 - OBJ
      ?auto_5859 - OBJ
      ?auto_5856 - LOCATION
    )
    :vars
    (
      ?auto_5860 - LOCATION
      ?auto_5861 - CITY
      ?auto_5862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5860 ?auto_5861 ) ( IN-CITY ?auto_5856 ?auto_5861 ) ( not ( = ?auto_5856 ?auto_5860 ) ) ( OBJ-AT ?auto_5859 ?auto_5856 ) ( not ( = ?auto_5859 ?auto_5858 ) ) ( OBJ-AT ?auto_5858 ?auto_5860 ) ( TRUCK-AT ?auto_5862 ?auto_5856 ) ( OBJ-AT ?auto_5857 ?auto_5856 ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( not ( = ?auto_5857 ?auto_5859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5859 ?auto_5858 ?auto_5856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5864 - OBJ
      ?auto_5865 - OBJ
      ?auto_5866 - OBJ
      ?auto_5863 - LOCATION
    )
    :vars
    (
      ?auto_5868 - LOCATION
      ?auto_5869 - CITY
      ?auto_5867 - OBJ
      ?auto_5870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5868 ?auto_5869 ) ( IN-CITY ?auto_5863 ?auto_5869 ) ( not ( = ?auto_5863 ?auto_5868 ) ) ( OBJ-AT ?auto_5867 ?auto_5863 ) ( not ( = ?auto_5867 ?auto_5865 ) ) ( OBJ-AT ?auto_5865 ?auto_5868 ) ( TRUCK-AT ?auto_5870 ?auto_5863 ) ( OBJ-AT ?auto_5864 ?auto_5863 ) ( OBJ-AT ?auto_5866 ?auto_5863 ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5864 ?auto_5866 ) ) ( not ( = ?auto_5864 ?auto_5867 ) ) ( not ( = ?auto_5865 ?auto_5866 ) ) ( not ( = ?auto_5866 ?auto_5867 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5867 ?auto_5865 ?auto_5863 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5880 - OBJ
      ?auto_5881 - OBJ
      ?auto_5882 - OBJ
      ?auto_5879 - LOCATION
    )
    :vars
    (
      ?auto_5883 - LOCATION
      ?auto_5884 - CITY
      ?auto_5885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5883 ?auto_5884 ) ( IN-CITY ?auto_5879 ?auto_5884 ) ( not ( = ?auto_5879 ?auto_5883 ) ) ( OBJ-AT ?auto_5881 ?auto_5879 ) ( not ( = ?auto_5881 ?auto_5880 ) ) ( OBJ-AT ?auto_5880 ?auto_5883 ) ( TRUCK-AT ?auto_5885 ?auto_5879 ) ( OBJ-AT ?auto_5882 ?auto_5879 ) ( not ( = ?auto_5880 ?auto_5882 ) ) ( not ( = ?auto_5881 ?auto_5882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5881 ?auto_5880 ?auto_5879 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5887 - OBJ
      ?auto_5888 - OBJ
      ?auto_5889 - OBJ
      ?auto_5886 - LOCATION
    )
    :vars
    (
      ?auto_5890 - LOCATION
      ?auto_5891 - CITY
      ?auto_5892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5890 ?auto_5891 ) ( IN-CITY ?auto_5886 ?auto_5891 ) ( not ( = ?auto_5886 ?auto_5890 ) ) ( OBJ-AT ?auto_5888 ?auto_5886 ) ( not ( = ?auto_5888 ?auto_5887 ) ) ( OBJ-AT ?auto_5887 ?auto_5890 ) ( TRUCK-AT ?auto_5892 ?auto_5886 ) ( OBJ-AT ?auto_5889 ?auto_5886 ) ( not ( = ?auto_5887 ?auto_5889 ) ) ( not ( = ?auto_5888 ?auto_5889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5888 ?auto_5887 ?auto_5886 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5901 - OBJ
      ?auto_5902 - OBJ
      ?auto_5903 - OBJ
      ?auto_5900 - LOCATION
    )
    :vars
    (
      ?auto_5904 - LOCATION
      ?auto_5905 - CITY
      ?auto_5906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5904 ?auto_5905 ) ( IN-CITY ?auto_5900 ?auto_5905 ) ( not ( = ?auto_5900 ?auto_5904 ) ) ( OBJ-AT ?auto_5903 ?auto_5900 ) ( not ( = ?auto_5903 ?auto_5901 ) ) ( OBJ-AT ?auto_5901 ?auto_5904 ) ( TRUCK-AT ?auto_5906 ?auto_5900 ) ( OBJ-AT ?auto_5902 ?auto_5900 ) ( not ( = ?auto_5901 ?auto_5902 ) ) ( not ( = ?auto_5902 ?auto_5903 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5903 ?auto_5901 ?auto_5900 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5908 - OBJ
      ?auto_5909 - OBJ
      ?auto_5910 - OBJ
      ?auto_5907 - LOCATION
    )
    :vars
    (
      ?auto_5912 - LOCATION
      ?auto_5913 - CITY
      ?auto_5911 - OBJ
      ?auto_5914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5912 ?auto_5913 ) ( IN-CITY ?auto_5907 ?auto_5913 ) ( not ( = ?auto_5907 ?auto_5912 ) ) ( OBJ-AT ?auto_5911 ?auto_5907 ) ( not ( = ?auto_5911 ?auto_5908 ) ) ( OBJ-AT ?auto_5908 ?auto_5912 ) ( TRUCK-AT ?auto_5914 ?auto_5907 ) ( OBJ-AT ?auto_5909 ?auto_5907 ) ( OBJ-AT ?auto_5910 ?auto_5907 ) ( not ( = ?auto_5908 ?auto_5909 ) ) ( not ( = ?auto_5908 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5911 ) ) ( not ( = ?auto_5910 ?auto_5911 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5911 ?auto_5908 ?auto_5907 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5947 - OBJ
      ?auto_5946 - LOCATION
    )
    :vars
    (
      ?auto_5949 - LOCATION
      ?auto_5950 - CITY
      ?auto_5948 - OBJ
      ?auto_5951 - TRUCK
      ?auto_5952 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5949 ?auto_5950 ) ( IN-CITY ?auto_5946 ?auto_5950 ) ( not ( = ?auto_5946 ?auto_5949 ) ) ( OBJ-AT ?auto_5948 ?auto_5946 ) ( not ( = ?auto_5948 ?auto_5947 ) ) ( OBJ-AT ?auto_5947 ?auto_5949 ) ( TRUCK-AT ?auto_5951 ?auto_5946 ) ( IN-TRUCK ?auto_5952 ?auto_5951 ) ( not ( = ?auto_5948 ?auto_5952 ) ) ( not ( = ?auto_5947 ?auto_5952 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5948 ?auto_5952 ?auto_5946 )
      ( DELIVER-2PKG ?auto_5948 ?auto_5947 ?auto_5946 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5954 - OBJ
      ?auto_5955 - OBJ
      ?auto_5953 - LOCATION
    )
    :vars
    (
      ?auto_5957 - LOCATION
      ?auto_5958 - CITY
      ?auto_5959 - TRUCK
      ?auto_5956 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5957 ?auto_5958 ) ( IN-CITY ?auto_5953 ?auto_5958 ) ( not ( = ?auto_5953 ?auto_5957 ) ) ( OBJ-AT ?auto_5954 ?auto_5953 ) ( not ( = ?auto_5954 ?auto_5955 ) ) ( OBJ-AT ?auto_5955 ?auto_5957 ) ( TRUCK-AT ?auto_5959 ?auto_5953 ) ( IN-TRUCK ?auto_5956 ?auto_5959 ) ( not ( = ?auto_5954 ?auto_5956 ) ) ( not ( = ?auto_5955 ?auto_5956 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5955 ?auto_5953 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5961 - OBJ
      ?auto_5962 - OBJ
      ?auto_5960 - LOCATION
    )
    :vars
    (
      ?auto_5963 - LOCATION
      ?auto_5965 - CITY
      ?auto_5966 - OBJ
      ?auto_5964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5963 ?auto_5965 ) ( IN-CITY ?auto_5960 ?auto_5965 ) ( not ( = ?auto_5960 ?auto_5963 ) ) ( OBJ-AT ?auto_5966 ?auto_5960 ) ( not ( = ?auto_5966 ?auto_5962 ) ) ( OBJ-AT ?auto_5962 ?auto_5963 ) ( TRUCK-AT ?auto_5964 ?auto_5960 ) ( IN-TRUCK ?auto_5961 ?auto_5964 ) ( not ( = ?auto_5966 ?auto_5961 ) ) ( not ( = ?auto_5962 ?auto_5961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5966 ?auto_5962 ?auto_5960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5968 - OBJ
      ?auto_5969 - OBJ
      ?auto_5967 - LOCATION
    )
    :vars
    (
      ?auto_5970 - LOCATION
      ?auto_5973 - CITY
      ?auto_5971 - TRUCK
      ?auto_5972 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5970 ?auto_5973 ) ( IN-CITY ?auto_5967 ?auto_5973 ) ( not ( = ?auto_5967 ?auto_5970 ) ) ( OBJ-AT ?auto_5969 ?auto_5967 ) ( not ( = ?auto_5969 ?auto_5968 ) ) ( OBJ-AT ?auto_5968 ?auto_5970 ) ( TRUCK-AT ?auto_5971 ?auto_5967 ) ( IN-TRUCK ?auto_5972 ?auto_5971 ) ( not ( = ?auto_5969 ?auto_5972 ) ) ( not ( = ?auto_5968 ?auto_5972 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5969 ?auto_5968 ?auto_5967 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5975 - OBJ
      ?auto_5976 - OBJ
      ?auto_5974 - LOCATION
    )
    :vars
    (
      ?auto_5977 - LOCATION
      ?auto_5979 - CITY
      ?auto_5980 - OBJ
      ?auto_5978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5977 ?auto_5979 ) ( IN-CITY ?auto_5974 ?auto_5979 ) ( not ( = ?auto_5974 ?auto_5977 ) ) ( OBJ-AT ?auto_5980 ?auto_5974 ) ( not ( = ?auto_5980 ?auto_5975 ) ) ( OBJ-AT ?auto_5975 ?auto_5977 ) ( TRUCK-AT ?auto_5978 ?auto_5974 ) ( IN-TRUCK ?auto_5976 ?auto_5978 ) ( not ( = ?auto_5980 ?auto_5976 ) ) ( not ( = ?auto_5975 ?auto_5976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5980 ?auto_5975 ?auto_5974 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5990 - OBJ
      ?auto_5991 - OBJ
      ?auto_5992 - OBJ
      ?auto_5989 - LOCATION
    )
    :vars
    (
      ?auto_5993 - LOCATION
      ?auto_5996 - CITY
      ?auto_5994 - TRUCK
      ?auto_5995 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5993 ?auto_5996 ) ( IN-CITY ?auto_5989 ?auto_5996 ) ( not ( = ?auto_5989 ?auto_5993 ) ) ( OBJ-AT ?auto_5990 ?auto_5989 ) ( not ( = ?auto_5990 ?auto_5992 ) ) ( OBJ-AT ?auto_5992 ?auto_5993 ) ( TRUCK-AT ?auto_5994 ?auto_5989 ) ( IN-TRUCK ?auto_5995 ?auto_5994 ) ( not ( = ?auto_5990 ?auto_5995 ) ) ( not ( = ?auto_5992 ?auto_5995 ) ) ( OBJ-AT ?auto_5991 ?auto_5989 ) ( not ( = ?auto_5990 ?auto_5991 ) ) ( not ( = ?auto_5991 ?auto_5992 ) ) ( not ( = ?auto_5991 ?auto_5995 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5990 ?auto_5992 ?auto_5989 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5998 - OBJ
      ?auto_5999 - OBJ
      ?auto_6000 - OBJ
      ?auto_5997 - LOCATION
    )
    :vars
    (
      ?auto_6001 - LOCATION
      ?auto_6003 - CITY
      ?auto_6002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6001 ?auto_6003 ) ( IN-CITY ?auto_5997 ?auto_6003 ) ( not ( = ?auto_5997 ?auto_6001 ) ) ( OBJ-AT ?auto_5998 ?auto_5997 ) ( not ( = ?auto_5998 ?auto_6000 ) ) ( OBJ-AT ?auto_6000 ?auto_6001 ) ( TRUCK-AT ?auto_6002 ?auto_5997 ) ( IN-TRUCK ?auto_5999 ?auto_6002 ) ( not ( = ?auto_5998 ?auto_5999 ) ) ( not ( = ?auto_6000 ?auto_5999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5998 ?auto_6000 ?auto_5997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6005 - OBJ
      ?auto_6006 - OBJ
      ?auto_6007 - OBJ
      ?auto_6004 - LOCATION
    )
    :vars
    (
      ?auto_6008 - LOCATION
      ?auto_6011 - CITY
      ?auto_6009 - TRUCK
      ?auto_6010 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_6008 ?auto_6011 ) ( IN-CITY ?auto_6004 ?auto_6011 ) ( not ( = ?auto_6004 ?auto_6008 ) ) ( OBJ-AT ?auto_6007 ?auto_6004 ) ( not ( = ?auto_6007 ?auto_6006 ) ) ( OBJ-AT ?auto_6006 ?auto_6008 ) ( TRUCK-AT ?auto_6009 ?auto_6004 ) ( IN-TRUCK ?auto_6010 ?auto_6009 ) ( not ( = ?auto_6007 ?auto_6010 ) ) ( not ( = ?auto_6006 ?auto_6010 ) ) ( OBJ-AT ?auto_6005 ?auto_6004 ) ( not ( = ?auto_6005 ?auto_6006 ) ) ( not ( = ?auto_6005 ?auto_6007 ) ) ( not ( = ?auto_6005 ?auto_6010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6007 ?auto_6006 ?auto_6004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6013 - OBJ
      ?auto_6014 - OBJ
      ?auto_6015 - OBJ
      ?auto_6012 - LOCATION
    )
    :vars
    (
      ?auto_6016 - LOCATION
      ?auto_6018 - CITY
      ?auto_6017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6016 ?auto_6018 ) ( IN-CITY ?auto_6012 ?auto_6018 ) ( not ( = ?auto_6012 ?auto_6016 ) ) ( OBJ-AT ?auto_6013 ?auto_6012 ) ( not ( = ?auto_6013 ?auto_6014 ) ) ( OBJ-AT ?auto_6014 ?auto_6016 ) ( TRUCK-AT ?auto_6017 ?auto_6012 ) ( IN-TRUCK ?auto_6015 ?auto_6017 ) ( not ( = ?auto_6013 ?auto_6015 ) ) ( not ( = ?auto_6014 ?auto_6015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6013 ?auto_6014 ?auto_6012 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6028 - OBJ
      ?auto_6029 - OBJ
      ?auto_6030 - OBJ
      ?auto_6027 - LOCATION
    )
    :vars
    (
      ?auto_6031 - LOCATION
      ?auto_6033 - CITY
      ?auto_6032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6031 ?auto_6033 ) ( IN-CITY ?auto_6027 ?auto_6033 ) ( not ( = ?auto_6027 ?auto_6031 ) ) ( OBJ-AT ?auto_6029 ?auto_6027 ) ( not ( = ?auto_6029 ?auto_6030 ) ) ( OBJ-AT ?auto_6030 ?auto_6031 ) ( TRUCK-AT ?auto_6032 ?auto_6027 ) ( IN-TRUCK ?auto_6028 ?auto_6032 ) ( not ( = ?auto_6029 ?auto_6028 ) ) ( not ( = ?auto_6030 ?auto_6028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6029 ?auto_6030 ?auto_6027 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6043 - OBJ
      ?auto_6044 - OBJ
      ?auto_6045 - OBJ
      ?auto_6042 - LOCATION
    )
    :vars
    (
      ?auto_6046 - LOCATION
      ?auto_6048 - CITY
      ?auto_6047 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6046 ?auto_6048 ) ( IN-CITY ?auto_6042 ?auto_6048 ) ( not ( = ?auto_6042 ?auto_6046 ) ) ( OBJ-AT ?auto_6045 ?auto_6042 ) ( not ( = ?auto_6045 ?auto_6044 ) ) ( OBJ-AT ?auto_6044 ?auto_6046 ) ( TRUCK-AT ?auto_6047 ?auto_6042 ) ( IN-TRUCK ?auto_6043 ?auto_6047 ) ( not ( = ?auto_6045 ?auto_6043 ) ) ( not ( = ?auto_6044 ?auto_6043 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6045 ?auto_6044 ?auto_6042 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6066 - OBJ
      ?auto_6067 - OBJ
      ?auto_6068 - OBJ
      ?auto_6065 - LOCATION
    )
    :vars
    (
      ?auto_6069 - LOCATION
      ?auto_6072 - CITY
      ?auto_6070 - TRUCK
      ?auto_6071 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_6069 ?auto_6072 ) ( IN-CITY ?auto_6065 ?auto_6072 ) ( not ( = ?auto_6065 ?auto_6069 ) ) ( OBJ-AT ?auto_6067 ?auto_6065 ) ( not ( = ?auto_6067 ?auto_6066 ) ) ( OBJ-AT ?auto_6066 ?auto_6069 ) ( TRUCK-AT ?auto_6070 ?auto_6065 ) ( IN-TRUCK ?auto_6071 ?auto_6070 ) ( not ( = ?auto_6067 ?auto_6071 ) ) ( not ( = ?auto_6066 ?auto_6071 ) ) ( OBJ-AT ?auto_6068 ?auto_6065 ) ( not ( = ?auto_6066 ?auto_6068 ) ) ( not ( = ?auto_6067 ?auto_6068 ) ) ( not ( = ?auto_6068 ?auto_6071 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6067 ?auto_6066 ?auto_6065 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6074 - OBJ
      ?auto_6075 - OBJ
      ?auto_6076 - OBJ
      ?auto_6073 - LOCATION
    )
    :vars
    (
      ?auto_6077 - LOCATION
      ?auto_6079 - CITY
      ?auto_6078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6077 ?auto_6079 ) ( IN-CITY ?auto_6073 ?auto_6079 ) ( not ( = ?auto_6073 ?auto_6077 ) ) ( OBJ-AT ?auto_6075 ?auto_6073 ) ( not ( = ?auto_6075 ?auto_6074 ) ) ( OBJ-AT ?auto_6074 ?auto_6077 ) ( TRUCK-AT ?auto_6078 ?auto_6073 ) ( IN-TRUCK ?auto_6076 ?auto_6078 ) ( not ( = ?auto_6075 ?auto_6076 ) ) ( not ( = ?auto_6074 ?auto_6076 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6075 ?auto_6074 ?auto_6073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6089 - OBJ
      ?auto_6090 - OBJ
      ?auto_6091 - OBJ
      ?auto_6088 - LOCATION
    )
    :vars
    (
      ?auto_6092 - LOCATION
      ?auto_6094 - CITY
      ?auto_6093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6092 ?auto_6094 ) ( IN-CITY ?auto_6088 ?auto_6094 ) ( not ( = ?auto_6088 ?auto_6092 ) ) ( OBJ-AT ?auto_6091 ?auto_6088 ) ( not ( = ?auto_6091 ?auto_6089 ) ) ( OBJ-AT ?auto_6089 ?auto_6092 ) ( TRUCK-AT ?auto_6093 ?auto_6088 ) ( IN-TRUCK ?auto_6090 ?auto_6093 ) ( not ( = ?auto_6091 ?auto_6090 ) ) ( not ( = ?auto_6089 ?auto_6090 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6091 ?auto_6089 ?auto_6088 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6137 - OBJ
      ?auto_6136 - LOCATION
    )
    :vars
    (
      ?auto_6138 - LOCATION
      ?auto_6141 - CITY
      ?auto_6142 - OBJ
      ?auto_6140 - OBJ
      ?auto_6139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6138 ?auto_6141 ) ( IN-CITY ?auto_6136 ?auto_6141 ) ( not ( = ?auto_6136 ?auto_6138 ) ) ( OBJ-AT ?auto_6142 ?auto_6136 ) ( not ( = ?auto_6142 ?auto_6137 ) ) ( OBJ-AT ?auto_6137 ?auto_6138 ) ( IN-TRUCK ?auto_6140 ?auto_6139 ) ( not ( = ?auto_6142 ?auto_6140 ) ) ( not ( = ?auto_6137 ?auto_6140 ) ) ( TRUCK-AT ?auto_6139 ?auto_6138 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6139 ?auto_6138 ?auto_6136 ?auto_6141 )
      ( DELIVER-2PKG ?auto_6142 ?auto_6137 ?auto_6136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6144 - OBJ
      ?auto_6145 - OBJ
      ?auto_6143 - LOCATION
    )
    :vars
    (
      ?auto_6148 - LOCATION
      ?auto_6146 - CITY
      ?auto_6149 - OBJ
      ?auto_6147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6148 ?auto_6146 ) ( IN-CITY ?auto_6143 ?auto_6146 ) ( not ( = ?auto_6143 ?auto_6148 ) ) ( OBJ-AT ?auto_6144 ?auto_6143 ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( OBJ-AT ?auto_6145 ?auto_6148 ) ( IN-TRUCK ?auto_6149 ?auto_6147 ) ( not ( = ?auto_6144 ?auto_6149 ) ) ( not ( = ?auto_6145 ?auto_6149 ) ) ( TRUCK-AT ?auto_6147 ?auto_6148 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6145 ?auto_6143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6151 - OBJ
      ?auto_6152 - OBJ
      ?auto_6150 - LOCATION
    )
    :vars
    (
      ?auto_6153 - LOCATION
      ?auto_6156 - CITY
      ?auto_6154 - OBJ
      ?auto_6155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6153 ?auto_6156 ) ( IN-CITY ?auto_6150 ?auto_6156 ) ( not ( = ?auto_6150 ?auto_6153 ) ) ( OBJ-AT ?auto_6154 ?auto_6150 ) ( not ( = ?auto_6154 ?auto_6152 ) ) ( OBJ-AT ?auto_6152 ?auto_6153 ) ( IN-TRUCK ?auto_6151 ?auto_6155 ) ( not ( = ?auto_6154 ?auto_6151 ) ) ( not ( = ?auto_6152 ?auto_6151 ) ) ( TRUCK-AT ?auto_6155 ?auto_6153 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6154 ?auto_6152 ?auto_6150 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6158 - OBJ
      ?auto_6159 - OBJ
      ?auto_6157 - LOCATION
    )
    :vars
    (
      ?auto_6160 - LOCATION
      ?auto_6163 - CITY
      ?auto_6161 - OBJ
      ?auto_6162 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6160 ?auto_6163 ) ( IN-CITY ?auto_6157 ?auto_6163 ) ( not ( = ?auto_6157 ?auto_6160 ) ) ( OBJ-AT ?auto_6159 ?auto_6157 ) ( not ( = ?auto_6159 ?auto_6158 ) ) ( OBJ-AT ?auto_6158 ?auto_6160 ) ( IN-TRUCK ?auto_6161 ?auto_6162 ) ( not ( = ?auto_6159 ?auto_6161 ) ) ( not ( = ?auto_6158 ?auto_6161 ) ) ( TRUCK-AT ?auto_6162 ?auto_6160 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6159 ?auto_6158 ?auto_6157 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6165 - OBJ
      ?auto_6166 - OBJ
      ?auto_6164 - LOCATION
    )
    :vars
    (
      ?auto_6167 - LOCATION
      ?auto_6170 - CITY
      ?auto_6168 - OBJ
      ?auto_6169 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6167 ?auto_6170 ) ( IN-CITY ?auto_6164 ?auto_6170 ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( OBJ-AT ?auto_6168 ?auto_6164 ) ( not ( = ?auto_6168 ?auto_6165 ) ) ( OBJ-AT ?auto_6165 ?auto_6167 ) ( IN-TRUCK ?auto_6166 ?auto_6169 ) ( not ( = ?auto_6168 ?auto_6166 ) ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( TRUCK-AT ?auto_6169 ?auto_6167 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6168 ?auto_6165 ?auto_6164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6180 - OBJ
      ?auto_6181 - OBJ
      ?auto_6182 - OBJ
      ?auto_6179 - LOCATION
    )
    :vars
    (
      ?auto_6183 - LOCATION
      ?auto_6186 - CITY
      ?auto_6184 - OBJ
      ?auto_6185 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6183 ?auto_6186 ) ( IN-CITY ?auto_6179 ?auto_6186 ) ( not ( = ?auto_6179 ?auto_6183 ) ) ( OBJ-AT ?auto_6180 ?auto_6179 ) ( not ( = ?auto_6180 ?auto_6182 ) ) ( OBJ-AT ?auto_6182 ?auto_6183 ) ( IN-TRUCK ?auto_6184 ?auto_6185 ) ( not ( = ?auto_6180 ?auto_6184 ) ) ( not ( = ?auto_6182 ?auto_6184 ) ) ( TRUCK-AT ?auto_6185 ?auto_6183 ) ( OBJ-AT ?auto_6181 ?auto_6179 ) ( not ( = ?auto_6180 ?auto_6181 ) ) ( not ( = ?auto_6181 ?auto_6182 ) ) ( not ( = ?auto_6181 ?auto_6184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6180 ?auto_6182 ?auto_6179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6188 - OBJ
      ?auto_6189 - OBJ
      ?auto_6190 - OBJ
      ?auto_6187 - LOCATION
    )
    :vars
    (
      ?auto_6191 - LOCATION
      ?auto_6193 - CITY
      ?auto_6192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6191 ?auto_6193 ) ( IN-CITY ?auto_6187 ?auto_6193 ) ( not ( = ?auto_6187 ?auto_6191 ) ) ( OBJ-AT ?auto_6188 ?auto_6187 ) ( not ( = ?auto_6188 ?auto_6190 ) ) ( OBJ-AT ?auto_6190 ?auto_6191 ) ( IN-TRUCK ?auto_6189 ?auto_6192 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( not ( = ?auto_6190 ?auto_6189 ) ) ( TRUCK-AT ?auto_6192 ?auto_6191 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6188 ?auto_6190 ?auto_6187 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6195 - OBJ
      ?auto_6196 - OBJ
      ?auto_6197 - OBJ
      ?auto_6194 - LOCATION
    )
    :vars
    (
      ?auto_6198 - LOCATION
      ?auto_6201 - CITY
      ?auto_6199 - OBJ
      ?auto_6200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6198 ?auto_6201 ) ( IN-CITY ?auto_6194 ?auto_6201 ) ( not ( = ?auto_6194 ?auto_6198 ) ) ( OBJ-AT ?auto_6197 ?auto_6194 ) ( not ( = ?auto_6197 ?auto_6196 ) ) ( OBJ-AT ?auto_6196 ?auto_6198 ) ( IN-TRUCK ?auto_6199 ?auto_6200 ) ( not ( = ?auto_6197 ?auto_6199 ) ) ( not ( = ?auto_6196 ?auto_6199 ) ) ( TRUCK-AT ?auto_6200 ?auto_6198 ) ( OBJ-AT ?auto_6195 ?auto_6194 ) ( not ( = ?auto_6195 ?auto_6196 ) ) ( not ( = ?auto_6195 ?auto_6197 ) ) ( not ( = ?auto_6195 ?auto_6199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6197 ?auto_6196 ?auto_6194 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6203 - OBJ
      ?auto_6204 - OBJ
      ?auto_6205 - OBJ
      ?auto_6202 - LOCATION
    )
    :vars
    (
      ?auto_6206 - LOCATION
      ?auto_6208 - CITY
      ?auto_6207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6206 ?auto_6208 ) ( IN-CITY ?auto_6202 ?auto_6208 ) ( not ( = ?auto_6202 ?auto_6206 ) ) ( OBJ-AT ?auto_6203 ?auto_6202 ) ( not ( = ?auto_6203 ?auto_6204 ) ) ( OBJ-AT ?auto_6204 ?auto_6206 ) ( IN-TRUCK ?auto_6205 ?auto_6207 ) ( not ( = ?auto_6203 ?auto_6205 ) ) ( not ( = ?auto_6204 ?auto_6205 ) ) ( TRUCK-AT ?auto_6207 ?auto_6206 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6203 ?auto_6204 ?auto_6202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6218 - OBJ
      ?auto_6219 - OBJ
      ?auto_6220 - OBJ
      ?auto_6217 - LOCATION
    )
    :vars
    (
      ?auto_6221 - LOCATION
      ?auto_6223 - CITY
      ?auto_6222 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6221 ?auto_6223 ) ( IN-CITY ?auto_6217 ?auto_6223 ) ( not ( = ?auto_6217 ?auto_6221 ) ) ( OBJ-AT ?auto_6219 ?auto_6217 ) ( not ( = ?auto_6219 ?auto_6220 ) ) ( OBJ-AT ?auto_6220 ?auto_6221 ) ( IN-TRUCK ?auto_6218 ?auto_6222 ) ( not ( = ?auto_6219 ?auto_6218 ) ) ( not ( = ?auto_6220 ?auto_6218 ) ) ( TRUCK-AT ?auto_6222 ?auto_6221 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6219 ?auto_6220 ?auto_6217 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6233 - OBJ
      ?auto_6234 - OBJ
      ?auto_6235 - OBJ
      ?auto_6232 - LOCATION
    )
    :vars
    (
      ?auto_6236 - LOCATION
      ?auto_6238 - CITY
      ?auto_6237 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6236 ?auto_6238 ) ( IN-CITY ?auto_6232 ?auto_6238 ) ( not ( = ?auto_6232 ?auto_6236 ) ) ( OBJ-AT ?auto_6235 ?auto_6232 ) ( not ( = ?auto_6235 ?auto_6234 ) ) ( OBJ-AT ?auto_6234 ?auto_6236 ) ( IN-TRUCK ?auto_6233 ?auto_6237 ) ( not ( = ?auto_6235 ?auto_6233 ) ) ( not ( = ?auto_6234 ?auto_6233 ) ) ( TRUCK-AT ?auto_6237 ?auto_6236 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6235 ?auto_6234 ?auto_6232 ) )
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
      ?auto_6259 - LOCATION
      ?auto_6262 - CITY
      ?auto_6260 - OBJ
      ?auto_6261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6259 ?auto_6262 ) ( IN-CITY ?auto_6255 ?auto_6262 ) ( not ( = ?auto_6255 ?auto_6259 ) ) ( OBJ-AT ?auto_6257 ?auto_6255 ) ( not ( = ?auto_6257 ?auto_6256 ) ) ( OBJ-AT ?auto_6256 ?auto_6259 ) ( IN-TRUCK ?auto_6260 ?auto_6261 ) ( not ( = ?auto_6257 ?auto_6260 ) ) ( not ( = ?auto_6256 ?auto_6260 ) ) ( TRUCK-AT ?auto_6261 ?auto_6259 ) ( OBJ-AT ?auto_6258 ?auto_6255 ) ( not ( = ?auto_6256 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( not ( = ?auto_6258 ?auto_6260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6257 ?auto_6256 ?auto_6255 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6264 - OBJ
      ?auto_6265 - OBJ
      ?auto_6266 - OBJ
      ?auto_6263 - LOCATION
    )
    :vars
    (
      ?auto_6267 - LOCATION
      ?auto_6269 - CITY
      ?auto_6268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6267 ?auto_6269 ) ( IN-CITY ?auto_6263 ?auto_6269 ) ( not ( = ?auto_6263 ?auto_6267 ) ) ( OBJ-AT ?auto_6265 ?auto_6263 ) ( not ( = ?auto_6265 ?auto_6264 ) ) ( OBJ-AT ?auto_6264 ?auto_6267 ) ( IN-TRUCK ?auto_6266 ?auto_6268 ) ( not ( = ?auto_6265 ?auto_6266 ) ) ( not ( = ?auto_6264 ?auto_6266 ) ) ( TRUCK-AT ?auto_6268 ?auto_6267 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6265 ?auto_6264 ?auto_6263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6279 - OBJ
      ?auto_6280 - OBJ
      ?auto_6281 - OBJ
      ?auto_6278 - LOCATION
    )
    :vars
    (
      ?auto_6282 - LOCATION
      ?auto_6284 - CITY
      ?auto_6283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6282 ?auto_6284 ) ( IN-CITY ?auto_6278 ?auto_6284 ) ( not ( = ?auto_6278 ?auto_6282 ) ) ( OBJ-AT ?auto_6281 ?auto_6278 ) ( not ( = ?auto_6281 ?auto_6279 ) ) ( OBJ-AT ?auto_6279 ?auto_6282 ) ( IN-TRUCK ?auto_6280 ?auto_6283 ) ( not ( = ?auto_6281 ?auto_6280 ) ) ( not ( = ?auto_6279 ?auto_6280 ) ) ( TRUCK-AT ?auto_6283 ?auto_6282 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6281 ?auto_6279 ?auto_6278 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6327 - OBJ
      ?auto_6326 - LOCATION
    )
    :vars
    (
      ?auto_6328 - LOCATION
      ?auto_6332 - CITY
      ?auto_6330 - OBJ
      ?auto_6329 - OBJ
      ?auto_6331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6328 ?auto_6332 ) ( IN-CITY ?auto_6326 ?auto_6332 ) ( not ( = ?auto_6326 ?auto_6328 ) ) ( OBJ-AT ?auto_6330 ?auto_6326 ) ( not ( = ?auto_6330 ?auto_6327 ) ) ( OBJ-AT ?auto_6327 ?auto_6328 ) ( not ( = ?auto_6330 ?auto_6329 ) ) ( not ( = ?auto_6327 ?auto_6329 ) ) ( TRUCK-AT ?auto_6331 ?auto_6328 ) ( OBJ-AT ?auto_6329 ?auto_6328 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6329 ?auto_6331 ?auto_6328 )
      ( DELIVER-2PKG ?auto_6330 ?auto_6327 ?auto_6326 ) )
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
      ?auto_6336 - CITY
      ?auto_6337 - OBJ
      ?auto_6339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6338 ?auto_6336 ) ( IN-CITY ?auto_6333 ?auto_6336 ) ( not ( = ?auto_6333 ?auto_6338 ) ) ( OBJ-AT ?auto_6334 ?auto_6333 ) ( not ( = ?auto_6334 ?auto_6335 ) ) ( OBJ-AT ?auto_6335 ?auto_6338 ) ( not ( = ?auto_6334 ?auto_6337 ) ) ( not ( = ?auto_6335 ?auto_6337 ) ) ( TRUCK-AT ?auto_6339 ?auto_6338 ) ( OBJ-AT ?auto_6337 ?auto_6338 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6335 ?auto_6333 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6341 - OBJ
      ?auto_6342 - OBJ
      ?auto_6340 - LOCATION
    )
    :vars
    (
      ?auto_6346 - LOCATION
      ?auto_6344 - CITY
      ?auto_6343 - OBJ
      ?auto_6345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6346 ?auto_6344 ) ( IN-CITY ?auto_6340 ?auto_6344 ) ( not ( = ?auto_6340 ?auto_6346 ) ) ( OBJ-AT ?auto_6343 ?auto_6340 ) ( not ( = ?auto_6343 ?auto_6342 ) ) ( OBJ-AT ?auto_6342 ?auto_6346 ) ( not ( = ?auto_6343 ?auto_6341 ) ) ( not ( = ?auto_6342 ?auto_6341 ) ) ( TRUCK-AT ?auto_6345 ?auto_6346 ) ( OBJ-AT ?auto_6341 ?auto_6346 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6343 ?auto_6342 ?auto_6340 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6348 - OBJ
      ?auto_6349 - OBJ
      ?auto_6347 - LOCATION
    )
    :vars
    (
      ?auto_6353 - LOCATION
      ?auto_6350 - CITY
      ?auto_6351 - OBJ
      ?auto_6352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6353 ?auto_6350 ) ( IN-CITY ?auto_6347 ?auto_6350 ) ( not ( = ?auto_6347 ?auto_6353 ) ) ( OBJ-AT ?auto_6349 ?auto_6347 ) ( not ( = ?auto_6349 ?auto_6348 ) ) ( OBJ-AT ?auto_6348 ?auto_6353 ) ( not ( = ?auto_6349 ?auto_6351 ) ) ( not ( = ?auto_6348 ?auto_6351 ) ) ( TRUCK-AT ?auto_6352 ?auto_6353 ) ( OBJ-AT ?auto_6351 ?auto_6353 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6349 ?auto_6348 ?auto_6347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6355 - OBJ
      ?auto_6356 - OBJ
      ?auto_6354 - LOCATION
    )
    :vars
    (
      ?auto_6360 - LOCATION
      ?auto_6358 - CITY
      ?auto_6357 - OBJ
      ?auto_6359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6360 ?auto_6358 ) ( IN-CITY ?auto_6354 ?auto_6358 ) ( not ( = ?auto_6354 ?auto_6360 ) ) ( OBJ-AT ?auto_6357 ?auto_6354 ) ( not ( = ?auto_6357 ?auto_6355 ) ) ( OBJ-AT ?auto_6355 ?auto_6360 ) ( not ( = ?auto_6357 ?auto_6356 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( TRUCK-AT ?auto_6359 ?auto_6360 ) ( OBJ-AT ?auto_6356 ?auto_6360 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6357 ?auto_6355 ?auto_6354 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6370 - OBJ
      ?auto_6371 - OBJ
      ?auto_6372 - OBJ
      ?auto_6369 - LOCATION
    )
    :vars
    (
      ?auto_6376 - LOCATION
      ?auto_6373 - CITY
      ?auto_6374 - OBJ
      ?auto_6375 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6376 ?auto_6373 ) ( IN-CITY ?auto_6369 ?auto_6373 ) ( not ( = ?auto_6369 ?auto_6376 ) ) ( OBJ-AT ?auto_6370 ?auto_6369 ) ( not ( = ?auto_6370 ?auto_6372 ) ) ( OBJ-AT ?auto_6372 ?auto_6376 ) ( not ( = ?auto_6370 ?auto_6374 ) ) ( not ( = ?auto_6372 ?auto_6374 ) ) ( TRUCK-AT ?auto_6375 ?auto_6376 ) ( OBJ-AT ?auto_6374 ?auto_6376 ) ( OBJ-AT ?auto_6371 ?auto_6369 ) ( not ( = ?auto_6370 ?auto_6371 ) ) ( not ( = ?auto_6371 ?auto_6372 ) ) ( not ( = ?auto_6371 ?auto_6374 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6370 ?auto_6372 ?auto_6369 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6378 - OBJ
      ?auto_6379 - OBJ
      ?auto_6380 - OBJ
      ?auto_6377 - LOCATION
    )
    :vars
    (
      ?auto_6383 - LOCATION
      ?auto_6381 - CITY
      ?auto_6382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6383 ?auto_6381 ) ( IN-CITY ?auto_6377 ?auto_6381 ) ( not ( = ?auto_6377 ?auto_6383 ) ) ( OBJ-AT ?auto_6378 ?auto_6377 ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( OBJ-AT ?auto_6380 ?auto_6383 ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6380 ?auto_6379 ) ) ( TRUCK-AT ?auto_6382 ?auto_6383 ) ( OBJ-AT ?auto_6379 ?auto_6383 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6378 ?auto_6380 ?auto_6377 ) )
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
      ?auto_6391 - LOCATION
      ?auto_6388 - CITY
      ?auto_6389 - OBJ
      ?auto_6390 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6391 ?auto_6388 ) ( IN-CITY ?auto_6384 ?auto_6388 ) ( not ( = ?auto_6384 ?auto_6391 ) ) ( OBJ-AT ?auto_6387 ?auto_6384 ) ( not ( = ?auto_6387 ?auto_6386 ) ) ( OBJ-AT ?auto_6386 ?auto_6391 ) ( not ( = ?auto_6387 ?auto_6389 ) ) ( not ( = ?auto_6386 ?auto_6389 ) ) ( TRUCK-AT ?auto_6390 ?auto_6391 ) ( OBJ-AT ?auto_6389 ?auto_6391 ) ( OBJ-AT ?auto_6385 ?auto_6384 ) ( not ( = ?auto_6385 ?auto_6386 ) ) ( not ( = ?auto_6385 ?auto_6387 ) ) ( not ( = ?auto_6385 ?auto_6389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6387 ?auto_6386 ?auto_6384 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6393 - OBJ
      ?auto_6394 - OBJ
      ?auto_6395 - OBJ
      ?auto_6392 - LOCATION
    )
    :vars
    (
      ?auto_6398 - LOCATION
      ?auto_6396 - CITY
      ?auto_6397 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6398 ?auto_6396 ) ( IN-CITY ?auto_6392 ?auto_6396 ) ( not ( = ?auto_6392 ?auto_6398 ) ) ( OBJ-AT ?auto_6393 ?auto_6392 ) ( not ( = ?auto_6393 ?auto_6394 ) ) ( OBJ-AT ?auto_6394 ?auto_6398 ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6394 ?auto_6395 ) ) ( TRUCK-AT ?auto_6397 ?auto_6398 ) ( OBJ-AT ?auto_6395 ?auto_6398 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6393 ?auto_6394 ?auto_6392 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6408 - OBJ
      ?auto_6409 - OBJ
      ?auto_6410 - OBJ
      ?auto_6407 - LOCATION
    )
    :vars
    (
      ?auto_6413 - LOCATION
      ?auto_6411 - CITY
      ?auto_6412 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6413 ?auto_6411 ) ( IN-CITY ?auto_6407 ?auto_6411 ) ( not ( = ?auto_6407 ?auto_6413 ) ) ( OBJ-AT ?auto_6409 ?auto_6407 ) ( not ( = ?auto_6409 ?auto_6410 ) ) ( OBJ-AT ?auto_6410 ?auto_6413 ) ( not ( = ?auto_6409 ?auto_6408 ) ) ( not ( = ?auto_6410 ?auto_6408 ) ) ( TRUCK-AT ?auto_6412 ?auto_6413 ) ( OBJ-AT ?auto_6408 ?auto_6413 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6409 ?auto_6410 ?auto_6407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6423 - OBJ
      ?auto_6424 - OBJ
      ?auto_6425 - OBJ
      ?auto_6422 - LOCATION
    )
    :vars
    (
      ?auto_6428 - LOCATION
      ?auto_6426 - CITY
      ?auto_6427 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6428 ?auto_6426 ) ( IN-CITY ?auto_6422 ?auto_6426 ) ( not ( = ?auto_6422 ?auto_6428 ) ) ( OBJ-AT ?auto_6425 ?auto_6422 ) ( not ( = ?auto_6425 ?auto_6424 ) ) ( OBJ-AT ?auto_6424 ?auto_6428 ) ( not ( = ?auto_6425 ?auto_6423 ) ) ( not ( = ?auto_6424 ?auto_6423 ) ) ( TRUCK-AT ?auto_6427 ?auto_6428 ) ( OBJ-AT ?auto_6423 ?auto_6428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6425 ?auto_6424 ?auto_6422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6446 - OBJ
      ?auto_6447 - OBJ
      ?auto_6448 - OBJ
      ?auto_6445 - LOCATION
    )
    :vars
    (
      ?auto_6452 - LOCATION
      ?auto_6449 - CITY
      ?auto_6450 - OBJ
      ?auto_6451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6452 ?auto_6449 ) ( IN-CITY ?auto_6445 ?auto_6449 ) ( not ( = ?auto_6445 ?auto_6452 ) ) ( OBJ-AT ?auto_6447 ?auto_6445 ) ( not ( = ?auto_6447 ?auto_6446 ) ) ( OBJ-AT ?auto_6446 ?auto_6452 ) ( not ( = ?auto_6447 ?auto_6450 ) ) ( not ( = ?auto_6446 ?auto_6450 ) ) ( TRUCK-AT ?auto_6451 ?auto_6452 ) ( OBJ-AT ?auto_6450 ?auto_6452 ) ( OBJ-AT ?auto_6448 ?auto_6445 ) ( not ( = ?auto_6446 ?auto_6448 ) ) ( not ( = ?auto_6447 ?auto_6448 ) ) ( not ( = ?auto_6448 ?auto_6450 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6447 ?auto_6446 ?auto_6445 ) )
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
      ?auto_6459 - LOCATION
      ?auto_6457 - CITY
      ?auto_6458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6459 ?auto_6457 ) ( IN-CITY ?auto_6453 ?auto_6457 ) ( not ( = ?auto_6453 ?auto_6459 ) ) ( OBJ-AT ?auto_6455 ?auto_6453 ) ( not ( = ?auto_6455 ?auto_6454 ) ) ( OBJ-AT ?auto_6454 ?auto_6459 ) ( not ( = ?auto_6455 ?auto_6456 ) ) ( not ( = ?auto_6454 ?auto_6456 ) ) ( TRUCK-AT ?auto_6458 ?auto_6459 ) ( OBJ-AT ?auto_6456 ?auto_6459 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6455 ?auto_6454 ?auto_6453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6469 - OBJ
      ?auto_6470 - OBJ
      ?auto_6471 - OBJ
      ?auto_6468 - LOCATION
    )
    :vars
    (
      ?auto_6474 - LOCATION
      ?auto_6472 - CITY
      ?auto_6473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6474 ?auto_6472 ) ( IN-CITY ?auto_6468 ?auto_6472 ) ( not ( = ?auto_6468 ?auto_6474 ) ) ( OBJ-AT ?auto_6471 ?auto_6468 ) ( not ( = ?auto_6471 ?auto_6469 ) ) ( OBJ-AT ?auto_6469 ?auto_6474 ) ( not ( = ?auto_6471 ?auto_6470 ) ) ( not ( = ?auto_6469 ?auto_6470 ) ) ( TRUCK-AT ?auto_6473 ?auto_6474 ) ( OBJ-AT ?auto_6470 ?auto_6474 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6471 ?auto_6469 ?auto_6468 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6517 - OBJ
      ?auto_6516 - LOCATION
    )
    :vars
    (
      ?auto_6522 - LOCATION
      ?auto_6519 - CITY
      ?auto_6518 - OBJ
      ?auto_6520 - OBJ
      ?auto_6521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6522 ?auto_6519 ) ( IN-CITY ?auto_6516 ?auto_6519 ) ( not ( = ?auto_6516 ?auto_6522 ) ) ( OBJ-AT ?auto_6518 ?auto_6516 ) ( not ( = ?auto_6518 ?auto_6517 ) ) ( OBJ-AT ?auto_6517 ?auto_6522 ) ( not ( = ?auto_6518 ?auto_6520 ) ) ( not ( = ?auto_6517 ?auto_6520 ) ) ( OBJ-AT ?auto_6520 ?auto_6522 ) ( TRUCK-AT ?auto_6521 ?auto_6516 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6521 ?auto_6516 ?auto_6522 ?auto_6519 )
      ( DELIVER-2PKG ?auto_6518 ?auto_6517 ?auto_6516 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6524 - OBJ
      ?auto_6525 - OBJ
      ?auto_6523 - LOCATION
    )
    :vars
    (
      ?auto_6529 - LOCATION
      ?auto_6528 - CITY
      ?auto_6527 - OBJ
      ?auto_6526 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6529 ?auto_6528 ) ( IN-CITY ?auto_6523 ?auto_6528 ) ( not ( = ?auto_6523 ?auto_6529 ) ) ( OBJ-AT ?auto_6524 ?auto_6523 ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( OBJ-AT ?auto_6525 ?auto_6529 ) ( not ( = ?auto_6524 ?auto_6527 ) ) ( not ( = ?auto_6525 ?auto_6527 ) ) ( OBJ-AT ?auto_6527 ?auto_6529 ) ( TRUCK-AT ?auto_6526 ?auto_6523 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6525 ?auto_6523 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6531 - OBJ
      ?auto_6532 - OBJ
      ?auto_6530 - LOCATION
    )
    :vars
    (
      ?auto_6534 - LOCATION
      ?auto_6533 - CITY
      ?auto_6535 - OBJ
      ?auto_6536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6534 ?auto_6533 ) ( IN-CITY ?auto_6530 ?auto_6533 ) ( not ( = ?auto_6530 ?auto_6534 ) ) ( OBJ-AT ?auto_6535 ?auto_6530 ) ( not ( = ?auto_6535 ?auto_6532 ) ) ( OBJ-AT ?auto_6532 ?auto_6534 ) ( not ( = ?auto_6535 ?auto_6531 ) ) ( not ( = ?auto_6532 ?auto_6531 ) ) ( OBJ-AT ?auto_6531 ?auto_6534 ) ( TRUCK-AT ?auto_6536 ?auto_6530 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6535 ?auto_6532 ?auto_6530 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6538 - OBJ
      ?auto_6539 - OBJ
      ?auto_6537 - LOCATION
    )
    :vars
    (
      ?auto_6542 - LOCATION
      ?auto_6541 - CITY
      ?auto_6540 - OBJ
      ?auto_6543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6542 ?auto_6541 ) ( IN-CITY ?auto_6537 ?auto_6541 ) ( not ( = ?auto_6537 ?auto_6542 ) ) ( OBJ-AT ?auto_6539 ?auto_6537 ) ( not ( = ?auto_6539 ?auto_6538 ) ) ( OBJ-AT ?auto_6538 ?auto_6542 ) ( not ( = ?auto_6539 ?auto_6540 ) ) ( not ( = ?auto_6538 ?auto_6540 ) ) ( OBJ-AT ?auto_6540 ?auto_6542 ) ( TRUCK-AT ?auto_6543 ?auto_6537 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6539 ?auto_6538 ?auto_6537 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6545 - OBJ
      ?auto_6546 - OBJ
      ?auto_6544 - LOCATION
    )
    :vars
    (
      ?auto_6548 - LOCATION
      ?auto_6547 - CITY
      ?auto_6549 - OBJ
      ?auto_6550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6548 ?auto_6547 ) ( IN-CITY ?auto_6544 ?auto_6547 ) ( not ( = ?auto_6544 ?auto_6548 ) ) ( OBJ-AT ?auto_6549 ?auto_6544 ) ( not ( = ?auto_6549 ?auto_6545 ) ) ( OBJ-AT ?auto_6545 ?auto_6548 ) ( not ( = ?auto_6549 ?auto_6546 ) ) ( not ( = ?auto_6545 ?auto_6546 ) ) ( OBJ-AT ?auto_6546 ?auto_6548 ) ( TRUCK-AT ?auto_6550 ?auto_6544 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6549 ?auto_6545 ?auto_6544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6560 - OBJ
      ?auto_6561 - OBJ
      ?auto_6562 - OBJ
      ?auto_6559 - LOCATION
    )
    :vars
    (
      ?auto_6565 - LOCATION
      ?auto_6564 - CITY
      ?auto_6563 - OBJ
      ?auto_6566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6565 ?auto_6564 ) ( IN-CITY ?auto_6559 ?auto_6564 ) ( not ( = ?auto_6559 ?auto_6565 ) ) ( OBJ-AT ?auto_6560 ?auto_6559 ) ( not ( = ?auto_6560 ?auto_6562 ) ) ( OBJ-AT ?auto_6562 ?auto_6565 ) ( not ( = ?auto_6560 ?auto_6563 ) ) ( not ( = ?auto_6562 ?auto_6563 ) ) ( OBJ-AT ?auto_6563 ?auto_6565 ) ( TRUCK-AT ?auto_6566 ?auto_6559 ) ( OBJ-AT ?auto_6561 ?auto_6559 ) ( not ( = ?auto_6560 ?auto_6561 ) ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( not ( = ?auto_6561 ?auto_6563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6560 ?auto_6562 ?auto_6559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6568 - OBJ
      ?auto_6569 - OBJ
      ?auto_6570 - OBJ
      ?auto_6567 - LOCATION
    )
    :vars
    (
      ?auto_6572 - LOCATION
      ?auto_6571 - CITY
      ?auto_6573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6572 ?auto_6571 ) ( IN-CITY ?auto_6567 ?auto_6571 ) ( not ( = ?auto_6567 ?auto_6572 ) ) ( OBJ-AT ?auto_6568 ?auto_6567 ) ( not ( = ?auto_6568 ?auto_6570 ) ) ( OBJ-AT ?auto_6570 ?auto_6572 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6570 ?auto_6569 ) ) ( OBJ-AT ?auto_6569 ?auto_6572 ) ( TRUCK-AT ?auto_6573 ?auto_6567 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6568 ?auto_6570 ?auto_6567 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6575 - OBJ
      ?auto_6576 - OBJ
      ?auto_6577 - OBJ
      ?auto_6574 - LOCATION
    )
    :vars
    (
      ?auto_6580 - LOCATION
      ?auto_6579 - CITY
      ?auto_6578 - OBJ
      ?auto_6581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6580 ?auto_6579 ) ( IN-CITY ?auto_6574 ?auto_6579 ) ( not ( = ?auto_6574 ?auto_6580 ) ) ( OBJ-AT ?auto_6577 ?auto_6574 ) ( not ( = ?auto_6577 ?auto_6576 ) ) ( OBJ-AT ?auto_6576 ?auto_6580 ) ( not ( = ?auto_6577 ?auto_6578 ) ) ( not ( = ?auto_6576 ?auto_6578 ) ) ( OBJ-AT ?auto_6578 ?auto_6580 ) ( TRUCK-AT ?auto_6581 ?auto_6574 ) ( OBJ-AT ?auto_6575 ?auto_6574 ) ( not ( = ?auto_6575 ?auto_6576 ) ) ( not ( = ?auto_6575 ?auto_6577 ) ) ( not ( = ?auto_6575 ?auto_6578 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6577 ?auto_6576 ?auto_6574 ) )
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
      ?auto_6587 - LOCATION
      ?auto_6586 - CITY
      ?auto_6588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6587 ?auto_6586 ) ( IN-CITY ?auto_6582 ?auto_6586 ) ( not ( = ?auto_6582 ?auto_6587 ) ) ( OBJ-AT ?auto_6583 ?auto_6582 ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( OBJ-AT ?auto_6584 ?auto_6587 ) ( not ( = ?auto_6583 ?auto_6585 ) ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( OBJ-AT ?auto_6585 ?auto_6587 ) ( TRUCK-AT ?auto_6588 ?auto_6582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6583 ?auto_6584 ?auto_6582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6598 - OBJ
      ?auto_6599 - OBJ
      ?auto_6600 - OBJ
      ?auto_6597 - LOCATION
    )
    :vars
    (
      ?auto_6602 - LOCATION
      ?auto_6601 - CITY
      ?auto_6603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6602 ?auto_6601 ) ( IN-CITY ?auto_6597 ?auto_6601 ) ( not ( = ?auto_6597 ?auto_6602 ) ) ( OBJ-AT ?auto_6599 ?auto_6597 ) ( not ( = ?auto_6599 ?auto_6600 ) ) ( OBJ-AT ?auto_6600 ?auto_6602 ) ( not ( = ?auto_6599 ?auto_6598 ) ) ( not ( = ?auto_6600 ?auto_6598 ) ) ( OBJ-AT ?auto_6598 ?auto_6602 ) ( TRUCK-AT ?auto_6603 ?auto_6597 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6599 ?auto_6600 ?auto_6597 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6613 - OBJ
      ?auto_6614 - OBJ
      ?auto_6615 - OBJ
      ?auto_6612 - LOCATION
    )
    :vars
    (
      ?auto_6617 - LOCATION
      ?auto_6616 - CITY
      ?auto_6618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6617 ?auto_6616 ) ( IN-CITY ?auto_6612 ?auto_6616 ) ( not ( = ?auto_6612 ?auto_6617 ) ) ( OBJ-AT ?auto_6615 ?auto_6612 ) ( not ( = ?auto_6615 ?auto_6614 ) ) ( OBJ-AT ?auto_6614 ?auto_6617 ) ( not ( = ?auto_6615 ?auto_6613 ) ) ( not ( = ?auto_6614 ?auto_6613 ) ) ( OBJ-AT ?auto_6613 ?auto_6617 ) ( TRUCK-AT ?auto_6618 ?auto_6612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6615 ?auto_6614 ?auto_6612 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6636 - OBJ
      ?auto_6637 - OBJ
      ?auto_6638 - OBJ
      ?auto_6635 - LOCATION
    )
    :vars
    (
      ?auto_6641 - LOCATION
      ?auto_6640 - CITY
      ?auto_6639 - OBJ
      ?auto_6642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6641 ?auto_6640 ) ( IN-CITY ?auto_6635 ?auto_6640 ) ( not ( = ?auto_6635 ?auto_6641 ) ) ( OBJ-AT ?auto_6637 ?auto_6635 ) ( not ( = ?auto_6637 ?auto_6636 ) ) ( OBJ-AT ?auto_6636 ?auto_6641 ) ( not ( = ?auto_6637 ?auto_6639 ) ) ( not ( = ?auto_6636 ?auto_6639 ) ) ( OBJ-AT ?auto_6639 ?auto_6641 ) ( TRUCK-AT ?auto_6642 ?auto_6635 ) ( OBJ-AT ?auto_6638 ?auto_6635 ) ( not ( = ?auto_6636 ?auto_6638 ) ) ( not ( = ?auto_6637 ?auto_6638 ) ) ( not ( = ?auto_6638 ?auto_6639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6637 ?auto_6636 ?auto_6635 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6644 - OBJ
      ?auto_6645 - OBJ
      ?auto_6646 - OBJ
      ?auto_6643 - LOCATION
    )
    :vars
    (
      ?auto_6648 - LOCATION
      ?auto_6647 - CITY
      ?auto_6649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6648 ?auto_6647 ) ( IN-CITY ?auto_6643 ?auto_6647 ) ( not ( = ?auto_6643 ?auto_6648 ) ) ( OBJ-AT ?auto_6645 ?auto_6643 ) ( not ( = ?auto_6645 ?auto_6644 ) ) ( OBJ-AT ?auto_6644 ?auto_6648 ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( not ( = ?auto_6644 ?auto_6646 ) ) ( OBJ-AT ?auto_6646 ?auto_6648 ) ( TRUCK-AT ?auto_6649 ?auto_6643 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6645 ?auto_6644 ?auto_6643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6659 - OBJ
      ?auto_6660 - OBJ
      ?auto_6661 - OBJ
      ?auto_6658 - LOCATION
    )
    :vars
    (
      ?auto_6663 - LOCATION
      ?auto_6662 - CITY
      ?auto_6664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6663 ?auto_6662 ) ( IN-CITY ?auto_6658 ?auto_6662 ) ( not ( = ?auto_6658 ?auto_6663 ) ) ( OBJ-AT ?auto_6661 ?auto_6658 ) ( not ( = ?auto_6661 ?auto_6659 ) ) ( OBJ-AT ?auto_6659 ?auto_6663 ) ( not ( = ?auto_6661 ?auto_6660 ) ) ( not ( = ?auto_6659 ?auto_6660 ) ) ( OBJ-AT ?auto_6660 ?auto_6663 ) ( TRUCK-AT ?auto_6664 ?auto_6658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6661 ?auto_6659 ?auto_6658 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6707 - OBJ
      ?auto_6706 - LOCATION
    )
    :vars
    (
      ?auto_6710 - LOCATION
      ?auto_6709 - CITY
      ?auto_6711 - OBJ
      ?auto_6708 - OBJ
      ?auto_6712 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6710 ?auto_6709 ) ( IN-CITY ?auto_6706 ?auto_6709 ) ( not ( = ?auto_6706 ?auto_6710 ) ) ( not ( = ?auto_6711 ?auto_6707 ) ) ( OBJ-AT ?auto_6707 ?auto_6710 ) ( not ( = ?auto_6711 ?auto_6708 ) ) ( not ( = ?auto_6707 ?auto_6708 ) ) ( OBJ-AT ?auto_6708 ?auto_6710 ) ( TRUCK-AT ?auto_6712 ?auto_6706 ) ( IN-TRUCK ?auto_6711 ?auto_6712 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6711 ?auto_6706 )
      ( DELIVER-2PKG ?auto_6711 ?auto_6707 ?auto_6706 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6714 - OBJ
      ?auto_6715 - OBJ
      ?auto_6713 - LOCATION
    )
    :vars
    (
      ?auto_6719 - LOCATION
      ?auto_6718 - CITY
      ?auto_6716 - OBJ
      ?auto_6717 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6719 ?auto_6718 ) ( IN-CITY ?auto_6713 ?auto_6718 ) ( not ( = ?auto_6713 ?auto_6719 ) ) ( not ( = ?auto_6714 ?auto_6715 ) ) ( OBJ-AT ?auto_6715 ?auto_6719 ) ( not ( = ?auto_6714 ?auto_6716 ) ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( OBJ-AT ?auto_6716 ?auto_6719 ) ( TRUCK-AT ?auto_6717 ?auto_6713 ) ( IN-TRUCK ?auto_6714 ?auto_6717 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6715 ?auto_6713 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6721 - OBJ
      ?auto_6722 - OBJ
      ?auto_6720 - LOCATION
    )
    :vars
    (
      ?auto_6726 - LOCATION
      ?auto_6725 - CITY
      ?auto_6724 - OBJ
      ?auto_6723 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6726 ?auto_6725 ) ( IN-CITY ?auto_6720 ?auto_6725 ) ( not ( = ?auto_6720 ?auto_6726 ) ) ( not ( = ?auto_6724 ?auto_6722 ) ) ( OBJ-AT ?auto_6722 ?auto_6726 ) ( not ( = ?auto_6724 ?auto_6721 ) ) ( not ( = ?auto_6722 ?auto_6721 ) ) ( OBJ-AT ?auto_6721 ?auto_6726 ) ( TRUCK-AT ?auto_6723 ?auto_6720 ) ( IN-TRUCK ?auto_6724 ?auto_6723 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6724 ?auto_6722 ?auto_6720 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6728 - OBJ
      ?auto_6729 - OBJ
      ?auto_6727 - LOCATION
    )
    :vars
    (
      ?auto_6733 - LOCATION
      ?auto_6732 - CITY
      ?auto_6731 - OBJ
      ?auto_6730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6733 ?auto_6732 ) ( IN-CITY ?auto_6727 ?auto_6732 ) ( not ( = ?auto_6727 ?auto_6733 ) ) ( not ( = ?auto_6729 ?auto_6728 ) ) ( OBJ-AT ?auto_6728 ?auto_6733 ) ( not ( = ?auto_6729 ?auto_6731 ) ) ( not ( = ?auto_6728 ?auto_6731 ) ) ( OBJ-AT ?auto_6731 ?auto_6733 ) ( TRUCK-AT ?auto_6730 ?auto_6727 ) ( IN-TRUCK ?auto_6729 ?auto_6730 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6729 ?auto_6728 ?auto_6727 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6735 - OBJ
      ?auto_6736 - OBJ
      ?auto_6734 - LOCATION
    )
    :vars
    (
      ?auto_6740 - LOCATION
      ?auto_6739 - CITY
      ?auto_6738 - OBJ
      ?auto_6737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6740 ?auto_6739 ) ( IN-CITY ?auto_6734 ?auto_6739 ) ( not ( = ?auto_6734 ?auto_6740 ) ) ( not ( = ?auto_6738 ?auto_6735 ) ) ( OBJ-AT ?auto_6735 ?auto_6740 ) ( not ( = ?auto_6738 ?auto_6736 ) ) ( not ( = ?auto_6735 ?auto_6736 ) ) ( OBJ-AT ?auto_6736 ?auto_6740 ) ( TRUCK-AT ?auto_6737 ?auto_6734 ) ( IN-TRUCK ?auto_6738 ?auto_6737 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6738 ?auto_6735 ?auto_6734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6758 - OBJ
      ?auto_6759 - OBJ
      ?auto_6760 - OBJ
      ?auto_6757 - LOCATION
    )
    :vars
    (
      ?auto_6763 - LOCATION
      ?auto_6762 - CITY
      ?auto_6761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6763 ?auto_6762 ) ( IN-CITY ?auto_6757 ?auto_6762 ) ( not ( = ?auto_6757 ?auto_6763 ) ) ( not ( = ?auto_6758 ?auto_6760 ) ) ( OBJ-AT ?auto_6760 ?auto_6763 ) ( not ( = ?auto_6758 ?auto_6759 ) ) ( not ( = ?auto_6760 ?auto_6759 ) ) ( OBJ-AT ?auto_6759 ?auto_6763 ) ( TRUCK-AT ?auto_6761 ?auto_6757 ) ( IN-TRUCK ?auto_6758 ?auto_6761 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6758 ?auto_6760 ?auto_6757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6773 - OBJ
      ?auto_6774 - OBJ
      ?auto_6775 - OBJ
      ?auto_6772 - LOCATION
    )
    :vars
    (
      ?auto_6778 - LOCATION
      ?auto_6777 - CITY
      ?auto_6776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6778 ?auto_6777 ) ( IN-CITY ?auto_6772 ?auto_6777 ) ( not ( = ?auto_6772 ?auto_6778 ) ) ( not ( = ?auto_6773 ?auto_6774 ) ) ( OBJ-AT ?auto_6774 ?auto_6778 ) ( not ( = ?auto_6773 ?auto_6775 ) ) ( not ( = ?auto_6774 ?auto_6775 ) ) ( OBJ-AT ?auto_6775 ?auto_6778 ) ( TRUCK-AT ?auto_6776 ?auto_6772 ) ( IN-TRUCK ?auto_6773 ?auto_6776 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6773 ?auto_6774 ?auto_6772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6788 - OBJ
      ?auto_6789 - OBJ
      ?auto_6790 - OBJ
      ?auto_6787 - LOCATION
    )
    :vars
    (
      ?auto_6793 - LOCATION
      ?auto_6792 - CITY
      ?auto_6791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6793 ?auto_6792 ) ( IN-CITY ?auto_6787 ?auto_6792 ) ( not ( = ?auto_6787 ?auto_6793 ) ) ( not ( = ?auto_6789 ?auto_6790 ) ) ( OBJ-AT ?auto_6790 ?auto_6793 ) ( not ( = ?auto_6789 ?auto_6788 ) ) ( not ( = ?auto_6790 ?auto_6788 ) ) ( OBJ-AT ?auto_6788 ?auto_6793 ) ( TRUCK-AT ?auto_6791 ?auto_6787 ) ( IN-TRUCK ?auto_6789 ?auto_6791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6789 ?auto_6790 ?auto_6787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6803 - OBJ
      ?auto_6804 - OBJ
      ?auto_6805 - OBJ
      ?auto_6802 - LOCATION
    )
    :vars
    (
      ?auto_6808 - LOCATION
      ?auto_6807 - CITY
      ?auto_6806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6808 ?auto_6807 ) ( IN-CITY ?auto_6802 ?auto_6807 ) ( not ( = ?auto_6802 ?auto_6808 ) ) ( not ( = ?auto_6805 ?auto_6804 ) ) ( OBJ-AT ?auto_6804 ?auto_6808 ) ( not ( = ?auto_6805 ?auto_6803 ) ) ( not ( = ?auto_6804 ?auto_6803 ) ) ( OBJ-AT ?auto_6803 ?auto_6808 ) ( TRUCK-AT ?auto_6806 ?auto_6802 ) ( IN-TRUCK ?auto_6805 ?auto_6806 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6805 ?auto_6804 ?auto_6802 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6834 - OBJ
      ?auto_6835 - OBJ
      ?auto_6836 - OBJ
      ?auto_6833 - LOCATION
    )
    :vars
    (
      ?auto_6839 - LOCATION
      ?auto_6838 - CITY
      ?auto_6837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6839 ?auto_6838 ) ( IN-CITY ?auto_6833 ?auto_6838 ) ( not ( = ?auto_6833 ?auto_6839 ) ) ( not ( = ?auto_6835 ?auto_6834 ) ) ( OBJ-AT ?auto_6834 ?auto_6839 ) ( not ( = ?auto_6835 ?auto_6836 ) ) ( not ( = ?auto_6834 ?auto_6836 ) ) ( OBJ-AT ?auto_6836 ?auto_6839 ) ( TRUCK-AT ?auto_6837 ?auto_6833 ) ( IN-TRUCK ?auto_6835 ?auto_6837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6835 ?auto_6834 ?auto_6833 ) )
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
      ?auto_6854 - LOCATION
      ?auto_6853 - CITY
      ?auto_6852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6854 ?auto_6853 ) ( IN-CITY ?auto_6848 ?auto_6853 ) ( not ( = ?auto_6848 ?auto_6854 ) ) ( not ( = ?auto_6851 ?auto_6849 ) ) ( OBJ-AT ?auto_6849 ?auto_6854 ) ( not ( = ?auto_6851 ?auto_6850 ) ) ( not ( = ?auto_6849 ?auto_6850 ) ) ( OBJ-AT ?auto_6850 ?auto_6854 ) ( TRUCK-AT ?auto_6852 ?auto_6848 ) ( IN-TRUCK ?auto_6851 ?auto_6852 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6851 ?auto_6849 ?auto_6848 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6897 - OBJ
      ?auto_6896 - LOCATION
    )
    :vars
    (
      ?auto_6902 - LOCATION
      ?auto_6901 - CITY
      ?auto_6900 - OBJ
      ?auto_6899 - OBJ
      ?auto_6898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6902 ?auto_6901 ) ( IN-CITY ?auto_6896 ?auto_6901 ) ( not ( = ?auto_6896 ?auto_6902 ) ) ( not ( = ?auto_6900 ?auto_6897 ) ) ( OBJ-AT ?auto_6897 ?auto_6902 ) ( not ( = ?auto_6900 ?auto_6899 ) ) ( not ( = ?auto_6897 ?auto_6899 ) ) ( OBJ-AT ?auto_6899 ?auto_6902 ) ( IN-TRUCK ?auto_6900 ?auto_6898 ) ( TRUCK-AT ?auto_6898 ?auto_6902 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6898 ?auto_6902 ?auto_6896 ?auto_6901 )
      ( DELIVER-2PKG ?auto_6900 ?auto_6897 ?auto_6896 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6904 - OBJ
      ?auto_6905 - OBJ
      ?auto_6903 - LOCATION
    )
    :vars
    (
      ?auto_6906 - LOCATION
      ?auto_6909 - CITY
      ?auto_6907 - OBJ
      ?auto_6908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6906 ?auto_6909 ) ( IN-CITY ?auto_6903 ?auto_6909 ) ( not ( = ?auto_6903 ?auto_6906 ) ) ( not ( = ?auto_6904 ?auto_6905 ) ) ( OBJ-AT ?auto_6905 ?auto_6906 ) ( not ( = ?auto_6904 ?auto_6907 ) ) ( not ( = ?auto_6905 ?auto_6907 ) ) ( OBJ-AT ?auto_6907 ?auto_6906 ) ( IN-TRUCK ?auto_6904 ?auto_6908 ) ( TRUCK-AT ?auto_6908 ?auto_6906 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6905 ?auto_6903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6911 - OBJ
      ?auto_6912 - OBJ
      ?auto_6910 - LOCATION
    )
    :vars
    (
      ?auto_6915 - LOCATION
      ?auto_6914 - CITY
      ?auto_6916 - OBJ
      ?auto_6913 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6915 ?auto_6914 ) ( IN-CITY ?auto_6910 ?auto_6914 ) ( not ( = ?auto_6910 ?auto_6915 ) ) ( not ( = ?auto_6916 ?auto_6912 ) ) ( OBJ-AT ?auto_6912 ?auto_6915 ) ( not ( = ?auto_6916 ?auto_6911 ) ) ( not ( = ?auto_6912 ?auto_6911 ) ) ( OBJ-AT ?auto_6911 ?auto_6915 ) ( IN-TRUCK ?auto_6916 ?auto_6913 ) ( TRUCK-AT ?auto_6913 ?auto_6915 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6916 ?auto_6912 ?auto_6910 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6918 - OBJ
      ?auto_6919 - OBJ
      ?auto_6917 - LOCATION
    )
    :vars
    (
      ?auto_6923 - LOCATION
      ?auto_6922 - CITY
      ?auto_6920 - OBJ
      ?auto_6921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6923 ?auto_6922 ) ( IN-CITY ?auto_6917 ?auto_6922 ) ( not ( = ?auto_6917 ?auto_6923 ) ) ( not ( = ?auto_6919 ?auto_6918 ) ) ( OBJ-AT ?auto_6918 ?auto_6923 ) ( not ( = ?auto_6919 ?auto_6920 ) ) ( not ( = ?auto_6918 ?auto_6920 ) ) ( OBJ-AT ?auto_6920 ?auto_6923 ) ( IN-TRUCK ?auto_6919 ?auto_6921 ) ( TRUCK-AT ?auto_6921 ?auto_6923 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6919 ?auto_6918 ?auto_6917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6925 - OBJ
      ?auto_6926 - OBJ
      ?auto_6924 - LOCATION
    )
    :vars
    (
      ?auto_6929 - LOCATION
      ?auto_6928 - CITY
      ?auto_6930 - OBJ
      ?auto_6927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6929 ?auto_6928 ) ( IN-CITY ?auto_6924 ?auto_6928 ) ( not ( = ?auto_6924 ?auto_6929 ) ) ( not ( = ?auto_6930 ?auto_6925 ) ) ( OBJ-AT ?auto_6925 ?auto_6929 ) ( not ( = ?auto_6930 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( OBJ-AT ?auto_6926 ?auto_6929 ) ( IN-TRUCK ?auto_6930 ?auto_6927 ) ( TRUCK-AT ?auto_6927 ?auto_6929 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6930 ?auto_6925 ?auto_6924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6948 - OBJ
      ?auto_6949 - OBJ
      ?auto_6950 - OBJ
      ?auto_6947 - LOCATION
    )
    :vars
    (
      ?auto_6953 - LOCATION
      ?auto_6952 - CITY
      ?auto_6951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6953 ?auto_6952 ) ( IN-CITY ?auto_6947 ?auto_6952 ) ( not ( = ?auto_6947 ?auto_6953 ) ) ( not ( = ?auto_6948 ?auto_6950 ) ) ( OBJ-AT ?auto_6950 ?auto_6953 ) ( not ( = ?auto_6948 ?auto_6949 ) ) ( not ( = ?auto_6950 ?auto_6949 ) ) ( OBJ-AT ?auto_6949 ?auto_6953 ) ( IN-TRUCK ?auto_6948 ?auto_6951 ) ( TRUCK-AT ?auto_6951 ?auto_6953 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6948 ?auto_6950 ?auto_6947 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6963 - OBJ
      ?auto_6964 - OBJ
      ?auto_6965 - OBJ
      ?auto_6962 - LOCATION
    )
    :vars
    (
      ?auto_6968 - LOCATION
      ?auto_6967 - CITY
      ?auto_6966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6968 ?auto_6967 ) ( IN-CITY ?auto_6962 ?auto_6967 ) ( not ( = ?auto_6962 ?auto_6968 ) ) ( not ( = ?auto_6963 ?auto_6964 ) ) ( OBJ-AT ?auto_6964 ?auto_6968 ) ( not ( = ?auto_6963 ?auto_6965 ) ) ( not ( = ?auto_6964 ?auto_6965 ) ) ( OBJ-AT ?auto_6965 ?auto_6968 ) ( IN-TRUCK ?auto_6963 ?auto_6966 ) ( TRUCK-AT ?auto_6966 ?auto_6968 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6963 ?auto_6964 ?auto_6962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6978 - OBJ
      ?auto_6979 - OBJ
      ?auto_6980 - OBJ
      ?auto_6977 - LOCATION
    )
    :vars
    (
      ?auto_6983 - LOCATION
      ?auto_6982 - CITY
      ?auto_6981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6983 ?auto_6982 ) ( IN-CITY ?auto_6977 ?auto_6982 ) ( not ( = ?auto_6977 ?auto_6983 ) ) ( not ( = ?auto_6979 ?auto_6980 ) ) ( OBJ-AT ?auto_6980 ?auto_6983 ) ( not ( = ?auto_6979 ?auto_6978 ) ) ( not ( = ?auto_6980 ?auto_6978 ) ) ( OBJ-AT ?auto_6978 ?auto_6983 ) ( IN-TRUCK ?auto_6979 ?auto_6981 ) ( TRUCK-AT ?auto_6981 ?auto_6983 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6979 ?auto_6980 ?auto_6977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6993 - OBJ
      ?auto_6994 - OBJ
      ?auto_6995 - OBJ
      ?auto_6992 - LOCATION
    )
    :vars
    (
      ?auto_6998 - LOCATION
      ?auto_6997 - CITY
      ?auto_6996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6998 ?auto_6997 ) ( IN-CITY ?auto_6992 ?auto_6997 ) ( not ( = ?auto_6992 ?auto_6998 ) ) ( not ( = ?auto_6995 ?auto_6994 ) ) ( OBJ-AT ?auto_6994 ?auto_6998 ) ( not ( = ?auto_6995 ?auto_6993 ) ) ( not ( = ?auto_6994 ?auto_6993 ) ) ( OBJ-AT ?auto_6993 ?auto_6998 ) ( IN-TRUCK ?auto_6995 ?auto_6996 ) ( TRUCK-AT ?auto_6996 ?auto_6998 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6995 ?auto_6994 ?auto_6992 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7024 - OBJ
      ?auto_7025 - OBJ
      ?auto_7026 - OBJ
      ?auto_7023 - LOCATION
    )
    :vars
    (
      ?auto_7029 - LOCATION
      ?auto_7028 - CITY
      ?auto_7027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7029 ?auto_7028 ) ( IN-CITY ?auto_7023 ?auto_7028 ) ( not ( = ?auto_7023 ?auto_7029 ) ) ( not ( = ?auto_7025 ?auto_7024 ) ) ( OBJ-AT ?auto_7024 ?auto_7029 ) ( not ( = ?auto_7025 ?auto_7026 ) ) ( not ( = ?auto_7024 ?auto_7026 ) ) ( OBJ-AT ?auto_7026 ?auto_7029 ) ( IN-TRUCK ?auto_7025 ?auto_7027 ) ( TRUCK-AT ?auto_7027 ?auto_7029 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7025 ?auto_7024 ?auto_7023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7039 - OBJ
      ?auto_7040 - OBJ
      ?auto_7041 - OBJ
      ?auto_7038 - LOCATION
    )
    :vars
    (
      ?auto_7044 - LOCATION
      ?auto_7043 - CITY
      ?auto_7042 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7044 ?auto_7043 ) ( IN-CITY ?auto_7038 ?auto_7043 ) ( not ( = ?auto_7038 ?auto_7044 ) ) ( not ( = ?auto_7041 ?auto_7039 ) ) ( OBJ-AT ?auto_7039 ?auto_7044 ) ( not ( = ?auto_7041 ?auto_7040 ) ) ( not ( = ?auto_7039 ?auto_7040 ) ) ( OBJ-AT ?auto_7040 ?auto_7044 ) ( IN-TRUCK ?auto_7041 ?auto_7042 ) ( TRUCK-AT ?auto_7042 ?auto_7044 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7041 ?auto_7039 ?auto_7038 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7087 - OBJ
      ?auto_7086 - LOCATION
    )
    :vars
    (
      ?auto_7091 - LOCATION
      ?auto_7090 - CITY
      ?auto_7092 - OBJ
      ?auto_7088 - OBJ
      ?auto_7089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7091 ?auto_7090 ) ( IN-CITY ?auto_7086 ?auto_7090 ) ( not ( = ?auto_7086 ?auto_7091 ) ) ( not ( = ?auto_7092 ?auto_7087 ) ) ( OBJ-AT ?auto_7087 ?auto_7091 ) ( not ( = ?auto_7092 ?auto_7088 ) ) ( not ( = ?auto_7087 ?auto_7088 ) ) ( OBJ-AT ?auto_7088 ?auto_7091 ) ( TRUCK-AT ?auto_7089 ?auto_7091 ) ( OBJ-AT ?auto_7092 ?auto_7091 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7092 ?auto_7089 ?auto_7091 )
      ( DELIVER-2PKG ?auto_7092 ?auto_7087 ?auto_7086 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7094 - OBJ
      ?auto_7095 - OBJ
      ?auto_7093 - LOCATION
    )
    :vars
    (
      ?auto_7097 - LOCATION
      ?auto_7096 - CITY
      ?auto_7099 - OBJ
      ?auto_7098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7097 ?auto_7096 ) ( IN-CITY ?auto_7093 ?auto_7096 ) ( not ( = ?auto_7093 ?auto_7097 ) ) ( not ( = ?auto_7094 ?auto_7095 ) ) ( OBJ-AT ?auto_7095 ?auto_7097 ) ( not ( = ?auto_7094 ?auto_7099 ) ) ( not ( = ?auto_7095 ?auto_7099 ) ) ( OBJ-AT ?auto_7099 ?auto_7097 ) ( TRUCK-AT ?auto_7098 ?auto_7097 ) ( OBJ-AT ?auto_7094 ?auto_7097 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7095 ?auto_7093 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7101 - OBJ
      ?auto_7102 - OBJ
      ?auto_7100 - LOCATION
    )
    :vars
    (
      ?auto_7105 - LOCATION
      ?auto_7103 - CITY
      ?auto_7106 - OBJ
      ?auto_7104 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7105 ?auto_7103 ) ( IN-CITY ?auto_7100 ?auto_7103 ) ( not ( = ?auto_7100 ?auto_7105 ) ) ( not ( = ?auto_7106 ?auto_7102 ) ) ( OBJ-AT ?auto_7102 ?auto_7105 ) ( not ( = ?auto_7106 ?auto_7101 ) ) ( not ( = ?auto_7102 ?auto_7101 ) ) ( OBJ-AT ?auto_7101 ?auto_7105 ) ( TRUCK-AT ?auto_7104 ?auto_7105 ) ( OBJ-AT ?auto_7106 ?auto_7105 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7106 ?auto_7102 ?auto_7100 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7108 - OBJ
      ?auto_7109 - OBJ
      ?auto_7107 - LOCATION
    )
    :vars
    (
      ?auto_7113 - LOCATION
      ?auto_7110 - CITY
      ?auto_7112 - OBJ
      ?auto_7111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7113 ?auto_7110 ) ( IN-CITY ?auto_7107 ?auto_7110 ) ( not ( = ?auto_7107 ?auto_7113 ) ) ( not ( = ?auto_7109 ?auto_7108 ) ) ( OBJ-AT ?auto_7108 ?auto_7113 ) ( not ( = ?auto_7109 ?auto_7112 ) ) ( not ( = ?auto_7108 ?auto_7112 ) ) ( OBJ-AT ?auto_7112 ?auto_7113 ) ( TRUCK-AT ?auto_7111 ?auto_7113 ) ( OBJ-AT ?auto_7109 ?auto_7113 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7109 ?auto_7108 ?auto_7107 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7115 - OBJ
      ?auto_7116 - OBJ
      ?auto_7114 - LOCATION
    )
    :vars
    (
      ?auto_7119 - LOCATION
      ?auto_7117 - CITY
      ?auto_7120 - OBJ
      ?auto_7118 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7119 ?auto_7117 ) ( IN-CITY ?auto_7114 ?auto_7117 ) ( not ( = ?auto_7114 ?auto_7119 ) ) ( not ( = ?auto_7120 ?auto_7115 ) ) ( OBJ-AT ?auto_7115 ?auto_7119 ) ( not ( = ?auto_7120 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( OBJ-AT ?auto_7116 ?auto_7119 ) ( TRUCK-AT ?auto_7118 ?auto_7119 ) ( OBJ-AT ?auto_7120 ?auto_7119 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7120 ?auto_7115 ?auto_7114 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7138 - OBJ
      ?auto_7139 - OBJ
      ?auto_7140 - OBJ
      ?auto_7137 - LOCATION
    )
    :vars
    (
      ?auto_7143 - LOCATION
      ?auto_7141 - CITY
      ?auto_7142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7143 ?auto_7141 ) ( IN-CITY ?auto_7137 ?auto_7141 ) ( not ( = ?auto_7137 ?auto_7143 ) ) ( not ( = ?auto_7138 ?auto_7140 ) ) ( OBJ-AT ?auto_7140 ?auto_7143 ) ( not ( = ?auto_7138 ?auto_7139 ) ) ( not ( = ?auto_7140 ?auto_7139 ) ) ( OBJ-AT ?auto_7139 ?auto_7143 ) ( TRUCK-AT ?auto_7142 ?auto_7143 ) ( OBJ-AT ?auto_7138 ?auto_7143 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7138 ?auto_7140 ?auto_7137 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7153 - OBJ
      ?auto_7154 - OBJ
      ?auto_7155 - OBJ
      ?auto_7152 - LOCATION
    )
    :vars
    (
      ?auto_7158 - LOCATION
      ?auto_7156 - CITY
      ?auto_7157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7158 ?auto_7156 ) ( IN-CITY ?auto_7152 ?auto_7156 ) ( not ( = ?auto_7152 ?auto_7158 ) ) ( not ( = ?auto_7153 ?auto_7154 ) ) ( OBJ-AT ?auto_7154 ?auto_7158 ) ( not ( = ?auto_7153 ?auto_7155 ) ) ( not ( = ?auto_7154 ?auto_7155 ) ) ( OBJ-AT ?auto_7155 ?auto_7158 ) ( TRUCK-AT ?auto_7157 ?auto_7158 ) ( OBJ-AT ?auto_7153 ?auto_7158 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7153 ?auto_7154 ?auto_7152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7168 - OBJ
      ?auto_7169 - OBJ
      ?auto_7170 - OBJ
      ?auto_7167 - LOCATION
    )
    :vars
    (
      ?auto_7173 - LOCATION
      ?auto_7171 - CITY
      ?auto_7172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7173 ?auto_7171 ) ( IN-CITY ?auto_7167 ?auto_7171 ) ( not ( = ?auto_7167 ?auto_7173 ) ) ( not ( = ?auto_7169 ?auto_7170 ) ) ( OBJ-AT ?auto_7170 ?auto_7173 ) ( not ( = ?auto_7169 ?auto_7168 ) ) ( not ( = ?auto_7170 ?auto_7168 ) ) ( OBJ-AT ?auto_7168 ?auto_7173 ) ( TRUCK-AT ?auto_7172 ?auto_7173 ) ( OBJ-AT ?auto_7169 ?auto_7173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7169 ?auto_7170 ?auto_7167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7183 - OBJ
      ?auto_7184 - OBJ
      ?auto_7185 - OBJ
      ?auto_7182 - LOCATION
    )
    :vars
    (
      ?auto_7188 - LOCATION
      ?auto_7186 - CITY
      ?auto_7187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7188 ?auto_7186 ) ( IN-CITY ?auto_7182 ?auto_7186 ) ( not ( = ?auto_7182 ?auto_7188 ) ) ( not ( = ?auto_7185 ?auto_7184 ) ) ( OBJ-AT ?auto_7184 ?auto_7188 ) ( not ( = ?auto_7185 ?auto_7183 ) ) ( not ( = ?auto_7184 ?auto_7183 ) ) ( OBJ-AT ?auto_7183 ?auto_7188 ) ( TRUCK-AT ?auto_7187 ?auto_7188 ) ( OBJ-AT ?auto_7185 ?auto_7188 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7185 ?auto_7184 ?auto_7182 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7214 - OBJ
      ?auto_7215 - OBJ
      ?auto_7216 - OBJ
      ?auto_7213 - LOCATION
    )
    :vars
    (
      ?auto_7219 - LOCATION
      ?auto_7217 - CITY
      ?auto_7218 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7219 ?auto_7217 ) ( IN-CITY ?auto_7213 ?auto_7217 ) ( not ( = ?auto_7213 ?auto_7219 ) ) ( not ( = ?auto_7215 ?auto_7214 ) ) ( OBJ-AT ?auto_7214 ?auto_7219 ) ( not ( = ?auto_7215 ?auto_7216 ) ) ( not ( = ?auto_7214 ?auto_7216 ) ) ( OBJ-AT ?auto_7216 ?auto_7219 ) ( TRUCK-AT ?auto_7218 ?auto_7219 ) ( OBJ-AT ?auto_7215 ?auto_7219 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7215 ?auto_7214 ?auto_7213 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7229 - OBJ
      ?auto_7230 - OBJ
      ?auto_7231 - OBJ
      ?auto_7228 - LOCATION
    )
    :vars
    (
      ?auto_7234 - LOCATION
      ?auto_7232 - CITY
      ?auto_7233 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7234 ?auto_7232 ) ( IN-CITY ?auto_7228 ?auto_7232 ) ( not ( = ?auto_7228 ?auto_7234 ) ) ( not ( = ?auto_7231 ?auto_7229 ) ) ( OBJ-AT ?auto_7229 ?auto_7234 ) ( not ( = ?auto_7231 ?auto_7230 ) ) ( not ( = ?auto_7229 ?auto_7230 ) ) ( OBJ-AT ?auto_7230 ?auto_7234 ) ( TRUCK-AT ?auto_7233 ?auto_7234 ) ( OBJ-AT ?auto_7231 ?auto_7234 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7231 ?auto_7229 ?auto_7228 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7277 - OBJ
      ?auto_7276 - LOCATION
    )
    :vars
    (
      ?auto_7281 - LOCATION
      ?auto_7278 - CITY
      ?auto_7282 - OBJ
      ?auto_7280 - OBJ
      ?auto_7279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7281 ?auto_7278 ) ( IN-CITY ?auto_7276 ?auto_7278 ) ( not ( = ?auto_7276 ?auto_7281 ) ) ( not ( = ?auto_7282 ?auto_7277 ) ) ( OBJ-AT ?auto_7277 ?auto_7281 ) ( not ( = ?auto_7282 ?auto_7280 ) ) ( not ( = ?auto_7277 ?auto_7280 ) ) ( OBJ-AT ?auto_7280 ?auto_7281 ) ( OBJ-AT ?auto_7282 ?auto_7281 ) ( TRUCK-AT ?auto_7279 ?auto_7276 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7279 ?auto_7276 ?auto_7281 ?auto_7278 )
      ( DELIVER-2PKG ?auto_7282 ?auto_7277 ?auto_7276 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7284 - OBJ
      ?auto_7285 - OBJ
      ?auto_7283 - LOCATION
    )
    :vars
    (
      ?auto_7286 - LOCATION
      ?auto_7288 - CITY
      ?auto_7287 - OBJ
      ?auto_7289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7286 ?auto_7288 ) ( IN-CITY ?auto_7283 ?auto_7288 ) ( not ( = ?auto_7283 ?auto_7286 ) ) ( not ( = ?auto_7284 ?auto_7285 ) ) ( OBJ-AT ?auto_7285 ?auto_7286 ) ( not ( = ?auto_7284 ?auto_7287 ) ) ( not ( = ?auto_7285 ?auto_7287 ) ) ( OBJ-AT ?auto_7287 ?auto_7286 ) ( OBJ-AT ?auto_7284 ?auto_7286 ) ( TRUCK-AT ?auto_7289 ?auto_7283 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7285 ?auto_7283 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7291 - OBJ
      ?auto_7292 - OBJ
      ?auto_7290 - LOCATION
    )
    :vars
    (
      ?auto_7294 - LOCATION
      ?auto_7293 - CITY
      ?auto_7296 - OBJ
      ?auto_7295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7294 ?auto_7293 ) ( IN-CITY ?auto_7290 ?auto_7293 ) ( not ( = ?auto_7290 ?auto_7294 ) ) ( not ( = ?auto_7296 ?auto_7292 ) ) ( OBJ-AT ?auto_7292 ?auto_7294 ) ( not ( = ?auto_7296 ?auto_7291 ) ) ( not ( = ?auto_7292 ?auto_7291 ) ) ( OBJ-AT ?auto_7291 ?auto_7294 ) ( OBJ-AT ?auto_7296 ?auto_7294 ) ( TRUCK-AT ?auto_7295 ?auto_7290 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7296 ?auto_7292 ?auto_7290 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7298 - OBJ
      ?auto_7299 - OBJ
      ?auto_7297 - LOCATION
    )
    :vars
    (
      ?auto_7301 - LOCATION
      ?auto_7300 - CITY
      ?auto_7303 - OBJ
      ?auto_7302 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7301 ?auto_7300 ) ( IN-CITY ?auto_7297 ?auto_7300 ) ( not ( = ?auto_7297 ?auto_7301 ) ) ( not ( = ?auto_7299 ?auto_7298 ) ) ( OBJ-AT ?auto_7298 ?auto_7301 ) ( not ( = ?auto_7299 ?auto_7303 ) ) ( not ( = ?auto_7298 ?auto_7303 ) ) ( OBJ-AT ?auto_7303 ?auto_7301 ) ( OBJ-AT ?auto_7299 ?auto_7301 ) ( TRUCK-AT ?auto_7302 ?auto_7297 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7299 ?auto_7298 ?auto_7297 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7305 - OBJ
      ?auto_7306 - OBJ
      ?auto_7304 - LOCATION
    )
    :vars
    (
      ?auto_7308 - LOCATION
      ?auto_7307 - CITY
      ?auto_7310 - OBJ
      ?auto_7309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7308 ?auto_7307 ) ( IN-CITY ?auto_7304 ?auto_7307 ) ( not ( = ?auto_7304 ?auto_7308 ) ) ( not ( = ?auto_7310 ?auto_7305 ) ) ( OBJ-AT ?auto_7305 ?auto_7308 ) ( not ( = ?auto_7310 ?auto_7306 ) ) ( not ( = ?auto_7305 ?auto_7306 ) ) ( OBJ-AT ?auto_7306 ?auto_7308 ) ( OBJ-AT ?auto_7310 ?auto_7308 ) ( TRUCK-AT ?auto_7309 ?auto_7304 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7310 ?auto_7305 ?auto_7304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7328 - OBJ
      ?auto_7329 - OBJ
      ?auto_7330 - OBJ
      ?auto_7327 - LOCATION
    )
    :vars
    (
      ?auto_7332 - LOCATION
      ?auto_7331 - CITY
      ?auto_7333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7332 ?auto_7331 ) ( IN-CITY ?auto_7327 ?auto_7331 ) ( not ( = ?auto_7327 ?auto_7332 ) ) ( not ( = ?auto_7328 ?auto_7330 ) ) ( OBJ-AT ?auto_7330 ?auto_7332 ) ( not ( = ?auto_7328 ?auto_7329 ) ) ( not ( = ?auto_7330 ?auto_7329 ) ) ( OBJ-AT ?auto_7329 ?auto_7332 ) ( OBJ-AT ?auto_7328 ?auto_7332 ) ( TRUCK-AT ?auto_7333 ?auto_7327 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7328 ?auto_7330 ?auto_7327 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7343 - OBJ
      ?auto_7344 - OBJ
      ?auto_7345 - OBJ
      ?auto_7342 - LOCATION
    )
    :vars
    (
      ?auto_7347 - LOCATION
      ?auto_7346 - CITY
      ?auto_7348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7347 ?auto_7346 ) ( IN-CITY ?auto_7342 ?auto_7346 ) ( not ( = ?auto_7342 ?auto_7347 ) ) ( not ( = ?auto_7343 ?auto_7344 ) ) ( OBJ-AT ?auto_7344 ?auto_7347 ) ( not ( = ?auto_7343 ?auto_7345 ) ) ( not ( = ?auto_7344 ?auto_7345 ) ) ( OBJ-AT ?auto_7345 ?auto_7347 ) ( OBJ-AT ?auto_7343 ?auto_7347 ) ( TRUCK-AT ?auto_7348 ?auto_7342 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7343 ?auto_7344 ?auto_7342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7358 - OBJ
      ?auto_7359 - OBJ
      ?auto_7360 - OBJ
      ?auto_7357 - LOCATION
    )
    :vars
    (
      ?auto_7362 - LOCATION
      ?auto_7361 - CITY
      ?auto_7363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7362 ?auto_7361 ) ( IN-CITY ?auto_7357 ?auto_7361 ) ( not ( = ?auto_7357 ?auto_7362 ) ) ( not ( = ?auto_7359 ?auto_7360 ) ) ( OBJ-AT ?auto_7360 ?auto_7362 ) ( not ( = ?auto_7359 ?auto_7358 ) ) ( not ( = ?auto_7360 ?auto_7358 ) ) ( OBJ-AT ?auto_7358 ?auto_7362 ) ( OBJ-AT ?auto_7359 ?auto_7362 ) ( TRUCK-AT ?auto_7363 ?auto_7357 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7359 ?auto_7360 ?auto_7357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7373 - OBJ
      ?auto_7374 - OBJ
      ?auto_7375 - OBJ
      ?auto_7372 - LOCATION
    )
    :vars
    (
      ?auto_7377 - LOCATION
      ?auto_7376 - CITY
      ?auto_7378 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7377 ?auto_7376 ) ( IN-CITY ?auto_7372 ?auto_7376 ) ( not ( = ?auto_7372 ?auto_7377 ) ) ( not ( = ?auto_7375 ?auto_7374 ) ) ( OBJ-AT ?auto_7374 ?auto_7377 ) ( not ( = ?auto_7375 ?auto_7373 ) ) ( not ( = ?auto_7374 ?auto_7373 ) ) ( OBJ-AT ?auto_7373 ?auto_7377 ) ( OBJ-AT ?auto_7375 ?auto_7377 ) ( TRUCK-AT ?auto_7378 ?auto_7372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7375 ?auto_7374 ?auto_7372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7404 - OBJ
      ?auto_7405 - OBJ
      ?auto_7406 - OBJ
      ?auto_7403 - LOCATION
    )
    :vars
    (
      ?auto_7408 - LOCATION
      ?auto_7407 - CITY
      ?auto_7409 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7408 ?auto_7407 ) ( IN-CITY ?auto_7403 ?auto_7407 ) ( not ( = ?auto_7403 ?auto_7408 ) ) ( not ( = ?auto_7405 ?auto_7404 ) ) ( OBJ-AT ?auto_7404 ?auto_7408 ) ( not ( = ?auto_7405 ?auto_7406 ) ) ( not ( = ?auto_7404 ?auto_7406 ) ) ( OBJ-AT ?auto_7406 ?auto_7408 ) ( OBJ-AT ?auto_7405 ?auto_7408 ) ( TRUCK-AT ?auto_7409 ?auto_7403 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7405 ?auto_7404 ?auto_7403 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7419 - OBJ
      ?auto_7420 - OBJ
      ?auto_7421 - OBJ
      ?auto_7418 - LOCATION
    )
    :vars
    (
      ?auto_7423 - LOCATION
      ?auto_7422 - CITY
      ?auto_7424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7423 ?auto_7422 ) ( IN-CITY ?auto_7418 ?auto_7422 ) ( not ( = ?auto_7418 ?auto_7423 ) ) ( not ( = ?auto_7421 ?auto_7419 ) ) ( OBJ-AT ?auto_7419 ?auto_7423 ) ( not ( = ?auto_7421 ?auto_7420 ) ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( OBJ-AT ?auto_7420 ?auto_7423 ) ( OBJ-AT ?auto_7421 ?auto_7423 ) ( TRUCK-AT ?auto_7424 ?auto_7418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7421 ?auto_7419 ?auto_7418 ) )
  )

)

