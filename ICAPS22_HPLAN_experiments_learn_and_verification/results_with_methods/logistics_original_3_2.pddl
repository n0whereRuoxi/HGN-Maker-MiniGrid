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
      ?auto_7572 - OBJ
      ?auto_7571 - LOCATION
    )
    :vars
    (
      ?auto_7573 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7573 ?auto_7571 ) ( IN-TRUCK ?auto_7572 ?auto_7573 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7572 ?auto_7573 ?auto_7571 )
      ( DELIVER-1PKG-VERIFY ?auto_7572 ?auto_7571 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7584 - OBJ
      ?auto_7583 - LOCATION
    )
    :vars
    (
      ?auto_7585 - TRUCK
      ?auto_7586 - LOCATION
      ?auto_7587 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7584 ?auto_7585 ) ( TRUCK-AT ?auto_7585 ?auto_7586 ) ( IN-CITY ?auto_7586 ?auto_7587 ) ( IN-CITY ?auto_7583 ?auto_7587 ) ( not ( = ?auto_7583 ?auto_7586 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7585 ?auto_7586 ?auto_7583 ?auto_7587 )
      ( DELIVER-1PKG ?auto_7584 ?auto_7583 )
      ( DELIVER-1PKG-VERIFY ?auto_7584 ?auto_7583 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7602 - OBJ
      ?auto_7601 - LOCATION
    )
    :vars
    (
      ?auto_7605 - TRUCK
      ?auto_7604 - LOCATION
      ?auto_7603 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7605 ?auto_7604 ) ( IN-CITY ?auto_7604 ?auto_7603 ) ( IN-CITY ?auto_7601 ?auto_7603 ) ( not ( = ?auto_7601 ?auto_7604 ) ) ( OBJ-AT ?auto_7602 ?auto_7604 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7602 ?auto_7605 ?auto_7604 )
      ( DELIVER-1PKG ?auto_7602 ?auto_7601 )
      ( DELIVER-1PKG-VERIFY ?auto_7602 ?auto_7601 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7620 - OBJ
      ?auto_7619 - LOCATION
    )
    :vars
    (
      ?auto_7621 - LOCATION
      ?auto_7622 - CITY
      ?auto_7623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7621 ?auto_7622 ) ( IN-CITY ?auto_7619 ?auto_7622 ) ( not ( = ?auto_7619 ?auto_7621 ) ) ( OBJ-AT ?auto_7620 ?auto_7621 ) ( TRUCK-AT ?auto_7623 ?auto_7619 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7623 ?auto_7619 ?auto_7621 ?auto_7622 )
      ( DELIVER-1PKG ?auto_7620 ?auto_7619 )
      ( DELIVER-1PKG-VERIFY ?auto_7620 ?auto_7619 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7677 - OBJ
      ?auto_7676 - LOCATION
    )
    :vars
    (
      ?auto_7678 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7678 ?auto_7676 ) ( IN-TRUCK ?auto_7677 ?auto_7678 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7677 ?auto_7678 ?auto_7676 )
      ( DELIVER-1PKG-VERIFY ?auto_7677 ?auto_7676 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7680 - OBJ
      ?auto_7681 - OBJ
      ?auto_7679 - LOCATION
    )
    :vars
    (
      ?auto_7682 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7682 ?auto_7679 ) ( IN-TRUCK ?auto_7681 ?auto_7682 ) ( OBJ-AT ?auto_7680 ?auto_7679 ) ( not ( = ?auto_7680 ?auto_7681 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7681 ?auto_7679 )
      ( DELIVER-2PKG-VERIFY ?auto_7680 ?auto_7681 ?auto_7679 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7684 - OBJ
      ?auto_7685 - OBJ
      ?auto_7683 - LOCATION
    )
    :vars
    (
      ?auto_7686 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7686 ?auto_7683 ) ( IN-TRUCK ?auto_7684 ?auto_7686 ) ( OBJ-AT ?auto_7685 ?auto_7683 ) ( not ( = ?auto_7684 ?auto_7685 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7684 ?auto_7683 )
      ( DELIVER-2PKG-VERIFY ?auto_7684 ?auto_7685 ?auto_7683 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7692 - OBJ
      ?auto_7693 - OBJ
      ?auto_7694 - OBJ
      ?auto_7691 - LOCATION
    )
    :vars
    (
      ?auto_7695 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7695 ?auto_7691 ) ( IN-TRUCK ?auto_7694 ?auto_7695 ) ( OBJ-AT ?auto_7692 ?auto_7691 ) ( OBJ-AT ?auto_7693 ?auto_7691 ) ( not ( = ?auto_7692 ?auto_7693 ) ) ( not ( = ?auto_7692 ?auto_7694 ) ) ( not ( = ?auto_7693 ?auto_7694 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7694 ?auto_7691 )
      ( DELIVER-3PKG-VERIFY ?auto_7692 ?auto_7693 ?auto_7694 ?auto_7691 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7697 - OBJ
      ?auto_7698 - OBJ
      ?auto_7699 - OBJ
      ?auto_7696 - LOCATION
    )
    :vars
    (
      ?auto_7700 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7700 ?auto_7696 ) ( IN-TRUCK ?auto_7698 ?auto_7700 ) ( OBJ-AT ?auto_7697 ?auto_7696 ) ( OBJ-AT ?auto_7699 ?auto_7696 ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( not ( = ?auto_7697 ?auto_7699 ) ) ( not ( = ?auto_7698 ?auto_7699 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7698 ?auto_7696 )
      ( DELIVER-3PKG-VERIFY ?auto_7697 ?auto_7698 ?auto_7699 ?auto_7696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7707 - OBJ
      ?auto_7708 - OBJ
      ?auto_7709 - OBJ
      ?auto_7706 - LOCATION
    )
    :vars
    (
      ?auto_7710 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7710 ?auto_7706 ) ( IN-TRUCK ?auto_7707 ?auto_7710 ) ( OBJ-AT ?auto_7708 ?auto_7706 ) ( OBJ-AT ?auto_7709 ?auto_7706 ) ( not ( = ?auto_7707 ?auto_7708 ) ) ( not ( = ?auto_7707 ?auto_7709 ) ) ( not ( = ?auto_7708 ?auto_7709 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7707 ?auto_7706 )
      ( DELIVER-3PKG-VERIFY ?auto_7707 ?auto_7708 ?auto_7709 ?auto_7706 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7727 - OBJ
      ?auto_7726 - LOCATION
    )
    :vars
    (
      ?auto_7728 - TRUCK
      ?auto_7729 - LOCATION
      ?auto_7730 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7727 ?auto_7728 ) ( TRUCK-AT ?auto_7728 ?auto_7729 ) ( IN-CITY ?auto_7729 ?auto_7730 ) ( IN-CITY ?auto_7726 ?auto_7730 ) ( not ( = ?auto_7726 ?auto_7729 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7728 ?auto_7729 ?auto_7726 ?auto_7730 )
      ( DELIVER-1PKG ?auto_7727 ?auto_7726 )
      ( DELIVER-1PKG-VERIFY ?auto_7727 ?auto_7726 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7732 - OBJ
      ?auto_7733 - OBJ
      ?auto_7731 - LOCATION
    )
    :vars
    (
      ?auto_7735 - TRUCK
      ?auto_7734 - LOCATION
      ?auto_7736 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7733 ?auto_7735 ) ( TRUCK-AT ?auto_7735 ?auto_7734 ) ( IN-CITY ?auto_7734 ?auto_7736 ) ( IN-CITY ?auto_7731 ?auto_7736 ) ( not ( = ?auto_7731 ?auto_7734 ) ) ( OBJ-AT ?auto_7732 ?auto_7731 ) ( not ( = ?auto_7732 ?auto_7733 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7733 ?auto_7731 )
      ( DELIVER-2PKG-VERIFY ?auto_7732 ?auto_7733 ?auto_7731 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7738 - OBJ
      ?auto_7739 - OBJ
      ?auto_7737 - LOCATION
    )
    :vars
    (
      ?auto_7740 - TRUCK
      ?auto_7742 - LOCATION
      ?auto_7741 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7738 ?auto_7740 ) ( TRUCK-AT ?auto_7740 ?auto_7742 ) ( IN-CITY ?auto_7742 ?auto_7741 ) ( IN-CITY ?auto_7737 ?auto_7741 ) ( not ( = ?auto_7737 ?auto_7742 ) ) ( OBJ-AT ?auto_7739 ?auto_7737 ) ( not ( = ?auto_7739 ?auto_7738 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7739 ?auto_7738 ?auto_7737 )
      ( DELIVER-2PKG-VERIFY ?auto_7738 ?auto_7739 ?auto_7737 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7751 - OBJ
      ?auto_7752 - OBJ
      ?auto_7753 - OBJ
      ?auto_7750 - LOCATION
    )
    :vars
    (
      ?auto_7754 - TRUCK
      ?auto_7756 - LOCATION
      ?auto_7755 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7753 ?auto_7754 ) ( TRUCK-AT ?auto_7754 ?auto_7756 ) ( IN-CITY ?auto_7756 ?auto_7755 ) ( IN-CITY ?auto_7750 ?auto_7755 ) ( not ( = ?auto_7750 ?auto_7756 ) ) ( OBJ-AT ?auto_7751 ?auto_7750 ) ( not ( = ?auto_7751 ?auto_7753 ) ) ( OBJ-AT ?auto_7752 ?auto_7750 ) ( not ( = ?auto_7751 ?auto_7752 ) ) ( not ( = ?auto_7752 ?auto_7753 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7751 ?auto_7753 ?auto_7750 )
      ( DELIVER-3PKG-VERIFY ?auto_7751 ?auto_7752 ?auto_7753 ?auto_7750 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7758 - OBJ
      ?auto_7759 - OBJ
      ?auto_7760 - OBJ
      ?auto_7757 - LOCATION
    )
    :vars
    (
      ?auto_7761 - TRUCK
      ?auto_7763 - LOCATION
      ?auto_7762 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7759 ?auto_7761 ) ( TRUCK-AT ?auto_7761 ?auto_7763 ) ( IN-CITY ?auto_7763 ?auto_7762 ) ( IN-CITY ?auto_7757 ?auto_7762 ) ( not ( = ?auto_7757 ?auto_7763 ) ) ( OBJ-AT ?auto_7760 ?auto_7757 ) ( not ( = ?auto_7760 ?auto_7759 ) ) ( OBJ-AT ?auto_7758 ?auto_7757 ) ( not ( = ?auto_7758 ?auto_7759 ) ) ( not ( = ?auto_7758 ?auto_7760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7760 ?auto_7759 ?auto_7757 )
      ( DELIVER-3PKG-VERIFY ?auto_7758 ?auto_7759 ?auto_7760 ?auto_7757 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7772 - OBJ
      ?auto_7773 - OBJ
      ?auto_7774 - OBJ
      ?auto_7771 - LOCATION
    )
    :vars
    (
      ?auto_7775 - TRUCK
      ?auto_7777 - LOCATION
      ?auto_7776 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7772 ?auto_7775 ) ( TRUCK-AT ?auto_7775 ?auto_7777 ) ( IN-CITY ?auto_7777 ?auto_7776 ) ( IN-CITY ?auto_7771 ?auto_7776 ) ( not ( = ?auto_7771 ?auto_7777 ) ) ( OBJ-AT ?auto_7773 ?auto_7771 ) ( not ( = ?auto_7773 ?auto_7772 ) ) ( OBJ-AT ?auto_7774 ?auto_7771 ) ( not ( = ?auto_7772 ?auto_7774 ) ) ( not ( = ?auto_7773 ?auto_7774 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7773 ?auto_7772 ?auto_7771 )
      ( DELIVER-3PKG-VERIFY ?auto_7772 ?auto_7773 ?auto_7774 ?auto_7771 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7801 - OBJ
      ?auto_7800 - LOCATION
    )
    :vars
    (
      ?auto_7802 - TRUCK
      ?auto_7804 - LOCATION
      ?auto_7803 - CITY
      ?auto_7805 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7802 ?auto_7804 ) ( IN-CITY ?auto_7804 ?auto_7803 ) ( IN-CITY ?auto_7800 ?auto_7803 ) ( not ( = ?auto_7800 ?auto_7804 ) ) ( OBJ-AT ?auto_7805 ?auto_7800 ) ( not ( = ?auto_7805 ?auto_7801 ) ) ( OBJ-AT ?auto_7801 ?auto_7804 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7801 ?auto_7802 ?auto_7804 )
      ( DELIVER-2PKG ?auto_7805 ?auto_7801 ?auto_7800 )
      ( DELIVER-1PKG-VERIFY ?auto_7801 ?auto_7800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7807 - OBJ
      ?auto_7808 - OBJ
      ?auto_7806 - LOCATION
    )
    :vars
    (
      ?auto_7810 - TRUCK
      ?auto_7809 - LOCATION
      ?auto_7811 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7810 ?auto_7809 ) ( IN-CITY ?auto_7809 ?auto_7811 ) ( IN-CITY ?auto_7806 ?auto_7811 ) ( not ( = ?auto_7806 ?auto_7809 ) ) ( OBJ-AT ?auto_7807 ?auto_7806 ) ( not ( = ?auto_7807 ?auto_7808 ) ) ( OBJ-AT ?auto_7808 ?auto_7809 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7808 ?auto_7806 )
      ( DELIVER-2PKG-VERIFY ?auto_7807 ?auto_7808 ?auto_7806 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7813 - OBJ
      ?auto_7814 - OBJ
      ?auto_7812 - LOCATION
    )
    :vars
    (
      ?auto_7815 - TRUCK
      ?auto_7817 - LOCATION
      ?auto_7816 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7815 ?auto_7817 ) ( IN-CITY ?auto_7817 ?auto_7816 ) ( IN-CITY ?auto_7812 ?auto_7816 ) ( not ( = ?auto_7812 ?auto_7817 ) ) ( OBJ-AT ?auto_7814 ?auto_7812 ) ( not ( = ?auto_7814 ?auto_7813 ) ) ( OBJ-AT ?auto_7813 ?auto_7817 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7814 ?auto_7813 ?auto_7812 )
      ( DELIVER-2PKG-VERIFY ?auto_7813 ?auto_7814 ?auto_7812 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7826 - OBJ
      ?auto_7827 - OBJ
      ?auto_7828 - OBJ
      ?auto_7825 - LOCATION
    )
    :vars
    (
      ?auto_7829 - TRUCK
      ?auto_7831 - LOCATION
      ?auto_7830 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7829 ?auto_7831 ) ( IN-CITY ?auto_7831 ?auto_7830 ) ( IN-CITY ?auto_7825 ?auto_7830 ) ( not ( = ?auto_7825 ?auto_7831 ) ) ( OBJ-AT ?auto_7826 ?auto_7825 ) ( not ( = ?auto_7826 ?auto_7828 ) ) ( OBJ-AT ?auto_7828 ?auto_7831 ) ( OBJ-AT ?auto_7827 ?auto_7825 ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7827 ?auto_7828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7826 ?auto_7828 ?auto_7825 )
      ( DELIVER-3PKG-VERIFY ?auto_7826 ?auto_7827 ?auto_7828 ?auto_7825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7833 - OBJ
      ?auto_7834 - OBJ
      ?auto_7835 - OBJ
      ?auto_7832 - LOCATION
    )
    :vars
    (
      ?auto_7836 - TRUCK
      ?auto_7838 - LOCATION
      ?auto_7837 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7836 ?auto_7838 ) ( IN-CITY ?auto_7838 ?auto_7837 ) ( IN-CITY ?auto_7832 ?auto_7837 ) ( not ( = ?auto_7832 ?auto_7838 ) ) ( OBJ-AT ?auto_7835 ?auto_7832 ) ( not ( = ?auto_7835 ?auto_7834 ) ) ( OBJ-AT ?auto_7834 ?auto_7838 ) ( OBJ-AT ?auto_7833 ?auto_7832 ) ( not ( = ?auto_7833 ?auto_7834 ) ) ( not ( = ?auto_7833 ?auto_7835 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7835 ?auto_7834 ?auto_7832 )
      ( DELIVER-3PKG-VERIFY ?auto_7833 ?auto_7834 ?auto_7835 ?auto_7832 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7847 - OBJ
      ?auto_7848 - OBJ
      ?auto_7849 - OBJ
      ?auto_7846 - LOCATION
    )
    :vars
    (
      ?auto_7850 - TRUCK
      ?auto_7852 - LOCATION
      ?auto_7851 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7850 ?auto_7852 ) ( IN-CITY ?auto_7852 ?auto_7851 ) ( IN-CITY ?auto_7846 ?auto_7851 ) ( not ( = ?auto_7846 ?auto_7852 ) ) ( OBJ-AT ?auto_7848 ?auto_7846 ) ( not ( = ?auto_7848 ?auto_7847 ) ) ( OBJ-AT ?auto_7847 ?auto_7852 ) ( OBJ-AT ?auto_7849 ?auto_7846 ) ( not ( = ?auto_7847 ?auto_7849 ) ) ( not ( = ?auto_7848 ?auto_7849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7848 ?auto_7847 ?auto_7846 )
      ( DELIVER-3PKG-VERIFY ?auto_7847 ?auto_7848 ?auto_7849 ?auto_7846 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7876 - OBJ
      ?auto_7875 - LOCATION
    )
    :vars
    (
      ?auto_7880 - LOCATION
      ?auto_7879 - CITY
      ?auto_7877 - OBJ
      ?auto_7878 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7880 ?auto_7879 ) ( IN-CITY ?auto_7875 ?auto_7879 ) ( not ( = ?auto_7875 ?auto_7880 ) ) ( OBJ-AT ?auto_7877 ?auto_7875 ) ( not ( = ?auto_7877 ?auto_7876 ) ) ( OBJ-AT ?auto_7876 ?auto_7880 ) ( TRUCK-AT ?auto_7878 ?auto_7875 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7878 ?auto_7875 ?auto_7880 ?auto_7879 )
      ( DELIVER-2PKG ?auto_7877 ?auto_7876 ?auto_7875 )
      ( DELIVER-1PKG-VERIFY ?auto_7876 ?auto_7875 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7882 - OBJ
      ?auto_7883 - OBJ
      ?auto_7881 - LOCATION
    )
    :vars
    (
      ?auto_7884 - LOCATION
      ?auto_7885 - CITY
      ?auto_7886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7884 ?auto_7885 ) ( IN-CITY ?auto_7881 ?auto_7885 ) ( not ( = ?auto_7881 ?auto_7884 ) ) ( OBJ-AT ?auto_7882 ?auto_7881 ) ( not ( = ?auto_7882 ?auto_7883 ) ) ( OBJ-AT ?auto_7883 ?auto_7884 ) ( TRUCK-AT ?auto_7886 ?auto_7881 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7883 ?auto_7881 )
      ( DELIVER-2PKG-VERIFY ?auto_7882 ?auto_7883 ?auto_7881 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7888 - OBJ
      ?auto_7889 - OBJ
      ?auto_7887 - LOCATION
    )
    :vars
    (
      ?auto_7892 - LOCATION
      ?auto_7891 - CITY
      ?auto_7890 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7892 ?auto_7891 ) ( IN-CITY ?auto_7887 ?auto_7891 ) ( not ( = ?auto_7887 ?auto_7892 ) ) ( OBJ-AT ?auto_7889 ?auto_7887 ) ( not ( = ?auto_7889 ?auto_7888 ) ) ( OBJ-AT ?auto_7888 ?auto_7892 ) ( TRUCK-AT ?auto_7890 ?auto_7887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7889 ?auto_7888 ?auto_7887 )
      ( DELIVER-2PKG-VERIFY ?auto_7888 ?auto_7889 ?auto_7887 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7901 - OBJ
      ?auto_7902 - OBJ
      ?auto_7903 - OBJ
      ?auto_7900 - LOCATION
    )
    :vars
    (
      ?auto_7906 - LOCATION
      ?auto_7905 - CITY
      ?auto_7904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7906 ?auto_7905 ) ( IN-CITY ?auto_7900 ?auto_7905 ) ( not ( = ?auto_7900 ?auto_7906 ) ) ( OBJ-AT ?auto_7902 ?auto_7900 ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( OBJ-AT ?auto_7903 ?auto_7906 ) ( TRUCK-AT ?auto_7904 ?auto_7900 ) ( OBJ-AT ?auto_7901 ?auto_7900 ) ( not ( = ?auto_7901 ?auto_7902 ) ) ( not ( = ?auto_7901 ?auto_7903 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7902 ?auto_7903 ?auto_7900 )
      ( DELIVER-3PKG-VERIFY ?auto_7901 ?auto_7902 ?auto_7903 ?auto_7900 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7908 - OBJ
      ?auto_7909 - OBJ
      ?auto_7910 - OBJ
      ?auto_7907 - LOCATION
    )
    :vars
    (
      ?auto_7913 - LOCATION
      ?auto_7912 - CITY
      ?auto_7911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7913 ?auto_7912 ) ( IN-CITY ?auto_7907 ?auto_7912 ) ( not ( = ?auto_7907 ?auto_7913 ) ) ( OBJ-AT ?auto_7910 ?auto_7907 ) ( not ( = ?auto_7910 ?auto_7909 ) ) ( OBJ-AT ?auto_7909 ?auto_7913 ) ( TRUCK-AT ?auto_7911 ?auto_7907 ) ( OBJ-AT ?auto_7908 ?auto_7907 ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( not ( = ?auto_7908 ?auto_7910 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7910 ?auto_7909 ?auto_7907 )
      ( DELIVER-3PKG-VERIFY ?auto_7908 ?auto_7909 ?auto_7910 ?auto_7907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7922 - OBJ
      ?auto_7923 - OBJ
      ?auto_7924 - OBJ
      ?auto_7921 - LOCATION
    )
    :vars
    (
      ?auto_7927 - LOCATION
      ?auto_7926 - CITY
      ?auto_7925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7927 ?auto_7926 ) ( IN-CITY ?auto_7921 ?auto_7926 ) ( not ( = ?auto_7921 ?auto_7927 ) ) ( OBJ-AT ?auto_7923 ?auto_7921 ) ( not ( = ?auto_7923 ?auto_7922 ) ) ( OBJ-AT ?auto_7922 ?auto_7927 ) ( TRUCK-AT ?auto_7925 ?auto_7921 ) ( OBJ-AT ?auto_7924 ?auto_7921 ) ( not ( = ?auto_7922 ?auto_7924 ) ) ( not ( = ?auto_7923 ?auto_7924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7923 ?auto_7922 ?auto_7921 )
      ( DELIVER-3PKG-VERIFY ?auto_7922 ?auto_7923 ?auto_7924 ?auto_7921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7951 - OBJ
      ?auto_7950 - LOCATION
    )
    :vars
    (
      ?auto_7955 - LOCATION
      ?auto_7954 - CITY
      ?auto_7953 - OBJ
      ?auto_7952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7955 ?auto_7954 ) ( IN-CITY ?auto_7950 ?auto_7954 ) ( not ( = ?auto_7950 ?auto_7955 ) ) ( not ( = ?auto_7953 ?auto_7951 ) ) ( OBJ-AT ?auto_7951 ?auto_7955 ) ( TRUCK-AT ?auto_7952 ?auto_7950 ) ( IN-TRUCK ?auto_7953 ?auto_7952 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7953 ?auto_7950 )
      ( DELIVER-2PKG ?auto_7953 ?auto_7951 ?auto_7950 )
      ( DELIVER-1PKG-VERIFY ?auto_7951 ?auto_7950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7957 - OBJ
      ?auto_7958 - OBJ
      ?auto_7956 - LOCATION
    )
    :vars
    (
      ?auto_7960 - LOCATION
      ?auto_7959 - CITY
      ?auto_7961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7960 ?auto_7959 ) ( IN-CITY ?auto_7956 ?auto_7959 ) ( not ( = ?auto_7956 ?auto_7960 ) ) ( not ( = ?auto_7957 ?auto_7958 ) ) ( OBJ-AT ?auto_7958 ?auto_7960 ) ( TRUCK-AT ?auto_7961 ?auto_7956 ) ( IN-TRUCK ?auto_7957 ?auto_7961 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7958 ?auto_7956 )
      ( DELIVER-2PKG-VERIFY ?auto_7957 ?auto_7958 ?auto_7956 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7963 - OBJ
      ?auto_7964 - OBJ
      ?auto_7962 - LOCATION
    )
    :vars
    (
      ?auto_7965 - LOCATION
      ?auto_7966 - CITY
      ?auto_7967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7965 ?auto_7966 ) ( IN-CITY ?auto_7962 ?auto_7966 ) ( not ( = ?auto_7962 ?auto_7965 ) ) ( not ( = ?auto_7964 ?auto_7963 ) ) ( OBJ-AT ?auto_7963 ?auto_7965 ) ( TRUCK-AT ?auto_7967 ?auto_7962 ) ( IN-TRUCK ?auto_7964 ?auto_7967 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7964 ?auto_7963 ?auto_7962 )
      ( DELIVER-2PKG-VERIFY ?auto_7963 ?auto_7964 ?auto_7962 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8026 - OBJ
      ?auto_8025 - LOCATION
    )
    :vars
    (
      ?auto_8028 - LOCATION
      ?auto_8029 - CITY
      ?auto_8027 - OBJ
      ?auto_8030 - TRUCK
      ?auto_8031 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8028 ?auto_8029 ) ( IN-CITY ?auto_8025 ?auto_8029 ) ( not ( = ?auto_8025 ?auto_8028 ) ) ( not ( = ?auto_8027 ?auto_8026 ) ) ( OBJ-AT ?auto_8026 ?auto_8028 ) ( IN-TRUCK ?auto_8027 ?auto_8030 ) ( TRUCK-AT ?auto_8030 ?auto_8031 ) ( IN-CITY ?auto_8031 ?auto_8029 ) ( not ( = ?auto_8025 ?auto_8031 ) ) ( not ( = ?auto_8028 ?auto_8031 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8030 ?auto_8031 ?auto_8025 ?auto_8029 )
      ( DELIVER-2PKG ?auto_8027 ?auto_8026 ?auto_8025 )
      ( DELIVER-1PKG-VERIFY ?auto_8026 ?auto_8025 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8033 - OBJ
      ?auto_8034 - OBJ
      ?auto_8032 - LOCATION
    )
    :vars
    (
      ?auto_8037 - LOCATION
      ?auto_8035 - CITY
      ?auto_8038 - TRUCK
      ?auto_8036 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8037 ?auto_8035 ) ( IN-CITY ?auto_8032 ?auto_8035 ) ( not ( = ?auto_8032 ?auto_8037 ) ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( OBJ-AT ?auto_8034 ?auto_8037 ) ( IN-TRUCK ?auto_8033 ?auto_8038 ) ( TRUCK-AT ?auto_8038 ?auto_8036 ) ( IN-CITY ?auto_8036 ?auto_8035 ) ( not ( = ?auto_8032 ?auto_8036 ) ) ( not ( = ?auto_8037 ?auto_8036 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8034 ?auto_8032 )
      ( DELIVER-2PKG-VERIFY ?auto_8033 ?auto_8034 ?auto_8032 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8040 - OBJ
      ?auto_8041 - OBJ
      ?auto_8039 - LOCATION
    )
    :vars
    (
      ?auto_8043 - LOCATION
      ?auto_8044 - CITY
      ?auto_8045 - TRUCK
      ?auto_8042 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8043 ?auto_8044 ) ( IN-CITY ?auto_8039 ?auto_8044 ) ( not ( = ?auto_8039 ?auto_8043 ) ) ( not ( = ?auto_8041 ?auto_8040 ) ) ( OBJ-AT ?auto_8040 ?auto_8043 ) ( IN-TRUCK ?auto_8041 ?auto_8045 ) ( TRUCK-AT ?auto_8045 ?auto_8042 ) ( IN-CITY ?auto_8042 ?auto_8044 ) ( not ( = ?auto_8039 ?auto_8042 ) ) ( not ( = ?auto_8043 ?auto_8042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8041 ?auto_8040 ?auto_8039 )
      ( DELIVER-2PKG-VERIFY ?auto_8040 ?auto_8041 ?auto_8039 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8112 - OBJ
      ?auto_8111 - LOCATION
    )
    :vars
    (
      ?auto_8114 - LOCATION
      ?auto_8115 - CITY
      ?auto_8117 - OBJ
      ?auto_8116 - TRUCK
      ?auto_8113 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8114 ?auto_8115 ) ( IN-CITY ?auto_8111 ?auto_8115 ) ( not ( = ?auto_8111 ?auto_8114 ) ) ( not ( = ?auto_8117 ?auto_8112 ) ) ( OBJ-AT ?auto_8112 ?auto_8114 ) ( TRUCK-AT ?auto_8116 ?auto_8113 ) ( IN-CITY ?auto_8113 ?auto_8115 ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8114 ?auto_8113 ) ) ( OBJ-AT ?auto_8117 ?auto_8113 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8117 ?auto_8116 ?auto_8113 )
      ( DELIVER-2PKG ?auto_8117 ?auto_8112 ?auto_8111 )
      ( DELIVER-1PKG-VERIFY ?auto_8112 ?auto_8111 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8119 - OBJ
      ?auto_8120 - OBJ
      ?auto_8118 - LOCATION
    )
    :vars
    (
      ?auto_8124 - LOCATION
      ?auto_8121 - CITY
      ?auto_8122 - TRUCK
      ?auto_8123 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8124 ?auto_8121 ) ( IN-CITY ?auto_8118 ?auto_8121 ) ( not ( = ?auto_8118 ?auto_8124 ) ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( OBJ-AT ?auto_8120 ?auto_8124 ) ( TRUCK-AT ?auto_8122 ?auto_8123 ) ( IN-CITY ?auto_8123 ?auto_8121 ) ( not ( = ?auto_8118 ?auto_8123 ) ) ( not ( = ?auto_8124 ?auto_8123 ) ) ( OBJ-AT ?auto_8119 ?auto_8123 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8120 ?auto_8118 )
      ( DELIVER-2PKG-VERIFY ?auto_8119 ?auto_8120 ?auto_8118 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8126 - OBJ
      ?auto_8127 - OBJ
      ?auto_8125 - LOCATION
    )
    :vars
    (
      ?auto_8128 - LOCATION
      ?auto_8129 - CITY
      ?auto_8131 - TRUCK
      ?auto_8130 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8128 ?auto_8129 ) ( IN-CITY ?auto_8125 ?auto_8129 ) ( not ( = ?auto_8125 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8126 ) ) ( OBJ-AT ?auto_8126 ?auto_8128 ) ( TRUCK-AT ?auto_8131 ?auto_8130 ) ( IN-CITY ?auto_8130 ?auto_8129 ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( not ( = ?auto_8128 ?auto_8130 ) ) ( OBJ-AT ?auto_8127 ?auto_8130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8127 ?auto_8126 ?auto_8125 )
      ( DELIVER-2PKG-VERIFY ?auto_8126 ?auto_8127 ?auto_8125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8198 - OBJ
      ?auto_8197 - LOCATION
    )
    :vars
    (
      ?auto_8199 - LOCATION
      ?auto_8200 - CITY
      ?auto_8202 - OBJ
      ?auto_8201 - LOCATION
      ?auto_8203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8199 ?auto_8200 ) ( IN-CITY ?auto_8197 ?auto_8200 ) ( not ( = ?auto_8197 ?auto_8199 ) ) ( not ( = ?auto_8202 ?auto_8198 ) ) ( OBJ-AT ?auto_8198 ?auto_8199 ) ( IN-CITY ?auto_8201 ?auto_8200 ) ( not ( = ?auto_8197 ?auto_8201 ) ) ( not ( = ?auto_8199 ?auto_8201 ) ) ( OBJ-AT ?auto_8202 ?auto_8201 ) ( TRUCK-AT ?auto_8203 ?auto_8197 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8203 ?auto_8197 ?auto_8201 ?auto_8200 )
      ( DELIVER-2PKG ?auto_8202 ?auto_8198 ?auto_8197 )
      ( DELIVER-1PKG-VERIFY ?auto_8198 ?auto_8197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8205 - OBJ
      ?auto_8206 - OBJ
      ?auto_8204 - LOCATION
    )
    :vars
    (
      ?auto_8207 - LOCATION
      ?auto_8209 - CITY
      ?auto_8208 - LOCATION
      ?auto_8210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8207 ?auto_8209 ) ( IN-CITY ?auto_8204 ?auto_8209 ) ( not ( = ?auto_8204 ?auto_8207 ) ) ( not ( = ?auto_8205 ?auto_8206 ) ) ( OBJ-AT ?auto_8206 ?auto_8207 ) ( IN-CITY ?auto_8208 ?auto_8209 ) ( not ( = ?auto_8204 ?auto_8208 ) ) ( not ( = ?auto_8207 ?auto_8208 ) ) ( OBJ-AT ?auto_8205 ?auto_8208 ) ( TRUCK-AT ?auto_8210 ?auto_8204 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8206 ?auto_8204 )
      ( DELIVER-2PKG-VERIFY ?auto_8205 ?auto_8206 ?auto_8204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8212 - OBJ
      ?auto_8213 - OBJ
      ?auto_8211 - LOCATION
    )
    :vars
    (
      ?auto_8217 - LOCATION
      ?auto_8216 - CITY
      ?auto_8215 - LOCATION
      ?auto_8214 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8217 ?auto_8216 ) ( IN-CITY ?auto_8211 ?auto_8216 ) ( not ( = ?auto_8211 ?auto_8217 ) ) ( not ( = ?auto_8213 ?auto_8212 ) ) ( OBJ-AT ?auto_8212 ?auto_8217 ) ( IN-CITY ?auto_8215 ?auto_8216 ) ( not ( = ?auto_8211 ?auto_8215 ) ) ( not ( = ?auto_8217 ?auto_8215 ) ) ( OBJ-AT ?auto_8213 ?auto_8215 ) ( TRUCK-AT ?auto_8214 ?auto_8211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8213 ?auto_8212 ?auto_8211 )
      ( DELIVER-2PKG-VERIFY ?auto_8212 ?auto_8213 ?auto_8211 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8377 - OBJ
      ?auto_8376 - LOCATION
    )
    :vars
    (
      ?auto_8378 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8378 ?auto_8376 ) ( IN-TRUCK ?auto_8377 ?auto_8378 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_8377 ?auto_8378 ?auto_8376 )
      ( DELIVER-1PKG-VERIFY ?auto_8377 ?auto_8376 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8380 - OBJ
      ?auto_8381 - OBJ
      ?auto_8379 - LOCATION
    )
    :vars
    (
      ?auto_8382 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8382 ?auto_8379 ) ( IN-TRUCK ?auto_8381 ?auto_8382 ) ( OBJ-AT ?auto_8380 ?auto_8379 ) ( not ( = ?auto_8380 ?auto_8381 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8381 ?auto_8379 )
      ( DELIVER-2PKG-VERIFY ?auto_8380 ?auto_8381 ?auto_8379 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8384 - OBJ
      ?auto_8385 - OBJ
      ?auto_8383 - LOCATION
    )
    :vars
    (
      ?auto_8386 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8386 ?auto_8383 ) ( IN-TRUCK ?auto_8385 ?auto_8386 ) ( OBJ-AT ?auto_8384 ?auto_8383 ) ( not ( = ?auto_8384 ?auto_8385 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8385 ?auto_8383 )
      ( DELIVER-2PKG-VERIFY ?auto_8384 ?auto_8385 ?auto_8383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8388 - OBJ
      ?auto_8389 - OBJ
      ?auto_8387 - LOCATION
    )
    :vars
    (
      ?auto_8390 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8390 ?auto_8387 ) ( IN-TRUCK ?auto_8388 ?auto_8390 ) ( OBJ-AT ?auto_8389 ?auto_8387 ) ( not ( = ?auto_8388 ?auto_8389 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8388 ?auto_8387 )
      ( DELIVER-2PKG-VERIFY ?auto_8388 ?auto_8389 ?auto_8387 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8392 - OBJ
      ?auto_8393 - OBJ
      ?auto_8391 - LOCATION
    )
    :vars
    (
      ?auto_8394 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8394 ?auto_8391 ) ( IN-TRUCK ?auto_8392 ?auto_8394 ) ( OBJ-AT ?auto_8393 ?auto_8391 ) ( not ( = ?auto_8392 ?auto_8393 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8392 ?auto_8391 )
      ( DELIVER-2PKG-VERIFY ?auto_8392 ?auto_8393 ?auto_8391 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8400 - OBJ
      ?auto_8401 - OBJ
      ?auto_8402 - OBJ
      ?auto_8399 - LOCATION
    )
    :vars
    (
      ?auto_8403 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8403 ?auto_8399 ) ( IN-TRUCK ?auto_8402 ?auto_8403 ) ( OBJ-AT ?auto_8400 ?auto_8399 ) ( OBJ-AT ?auto_8401 ?auto_8399 ) ( not ( = ?auto_8400 ?auto_8401 ) ) ( not ( = ?auto_8400 ?auto_8402 ) ) ( not ( = ?auto_8401 ?auto_8402 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8402 ?auto_8399 )
      ( DELIVER-3PKG-VERIFY ?auto_8400 ?auto_8401 ?auto_8402 ?auto_8399 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8405 - OBJ
      ?auto_8406 - OBJ
      ?auto_8407 - OBJ
      ?auto_8404 - LOCATION
    )
    :vars
    (
      ?auto_8408 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8408 ?auto_8404 ) ( IN-TRUCK ?auto_8407 ?auto_8408 ) ( OBJ-AT ?auto_8405 ?auto_8404 ) ( OBJ-AT ?auto_8406 ?auto_8404 ) ( not ( = ?auto_8405 ?auto_8406 ) ) ( not ( = ?auto_8405 ?auto_8407 ) ) ( not ( = ?auto_8406 ?auto_8407 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8407 ?auto_8404 )
      ( DELIVER-3PKG-VERIFY ?auto_8405 ?auto_8406 ?auto_8407 ?auto_8404 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8410 - OBJ
      ?auto_8411 - OBJ
      ?auto_8412 - OBJ
      ?auto_8409 - LOCATION
    )
    :vars
    (
      ?auto_8413 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8413 ?auto_8409 ) ( IN-TRUCK ?auto_8411 ?auto_8413 ) ( OBJ-AT ?auto_8410 ?auto_8409 ) ( OBJ-AT ?auto_8412 ?auto_8409 ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( not ( = ?auto_8410 ?auto_8412 ) ) ( not ( = ?auto_8411 ?auto_8412 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8411 ?auto_8409 )
      ( DELIVER-3PKG-VERIFY ?auto_8410 ?auto_8411 ?auto_8412 ?auto_8409 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8415 - OBJ
      ?auto_8416 - OBJ
      ?auto_8417 - OBJ
      ?auto_8414 - LOCATION
    )
    :vars
    (
      ?auto_8418 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8418 ?auto_8414 ) ( IN-TRUCK ?auto_8416 ?auto_8418 ) ( OBJ-AT ?auto_8415 ?auto_8414 ) ( OBJ-AT ?auto_8417 ?auto_8414 ) ( not ( = ?auto_8415 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8417 ) ) ( not ( = ?auto_8416 ?auto_8417 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8416 ?auto_8414 )
      ( DELIVER-3PKG-VERIFY ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8414 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8425 - OBJ
      ?auto_8426 - OBJ
      ?auto_8427 - OBJ
      ?auto_8424 - LOCATION
    )
    :vars
    (
      ?auto_8428 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8428 ?auto_8424 ) ( IN-TRUCK ?auto_8427 ?auto_8428 ) ( OBJ-AT ?auto_8425 ?auto_8424 ) ( OBJ-AT ?auto_8426 ?auto_8424 ) ( not ( = ?auto_8425 ?auto_8426 ) ) ( not ( = ?auto_8425 ?auto_8427 ) ) ( not ( = ?auto_8426 ?auto_8427 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8427 ?auto_8424 )
      ( DELIVER-3PKG-VERIFY ?auto_8425 ?auto_8426 ?auto_8427 ?auto_8424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8430 - OBJ
      ?auto_8431 - OBJ
      ?auto_8432 - OBJ
      ?auto_8429 - LOCATION
    )
    :vars
    (
      ?auto_8433 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8433 ?auto_8429 ) ( IN-TRUCK ?auto_8432 ?auto_8433 ) ( OBJ-AT ?auto_8430 ?auto_8429 ) ( OBJ-AT ?auto_8431 ?auto_8429 ) ( not ( = ?auto_8430 ?auto_8431 ) ) ( not ( = ?auto_8430 ?auto_8432 ) ) ( not ( = ?auto_8431 ?auto_8432 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8432 ?auto_8429 )
      ( DELIVER-3PKG-VERIFY ?auto_8430 ?auto_8431 ?auto_8432 ?auto_8429 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8435 - OBJ
      ?auto_8436 - OBJ
      ?auto_8437 - OBJ
      ?auto_8434 - LOCATION
    )
    :vars
    (
      ?auto_8438 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8438 ?auto_8434 ) ( IN-TRUCK ?auto_8436 ?auto_8438 ) ( OBJ-AT ?auto_8435 ?auto_8434 ) ( OBJ-AT ?auto_8437 ?auto_8434 ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) ( not ( = ?auto_8436 ?auto_8437 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8436 ?auto_8434 )
      ( DELIVER-3PKG-VERIFY ?auto_8435 ?auto_8436 ?auto_8437 ?auto_8434 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8440 - OBJ
      ?auto_8441 - OBJ
      ?auto_8442 - OBJ
      ?auto_8439 - LOCATION
    )
    :vars
    (
      ?auto_8443 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8443 ?auto_8439 ) ( IN-TRUCK ?auto_8441 ?auto_8443 ) ( OBJ-AT ?auto_8440 ?auto_8439 ) ( OBJ-AT ?auto_8442 ?auto_8439 ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8442 ) ) ( not ( = ?auto_8441 ?auto_8442 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8441 ?auto_8439 )
      ( DELIVER-3PKG-VERIFY ?auto_8440 ?auto_8441 ?auto_8442 ?auto_8439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8450 - OBJ
      ?auto_8451 - OBJ
      ?auto_8452 - OBJ
      ?auto_8449 - LOCATION
    )
    :vars
    (
      ?auto_8453 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8453 ?auto_8449 ) ( IN-TRUCK ?auto_8450 ?auto_8453 ) ( OBJ-AT ?auto_8451 ?auto_8449 ) ( OBJ-AT ?auto_8452 ?auto_8449 ) ( not ( = ?auto_8450 ?auto_8451 ) ) ( not ( = ?auto_8450 ?auto_8452 ) ) ( not ( = ?auto_8451 ?auto_8452 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8450 ?auto_8449 )
      ( DELIVER-3PKG-VERIFY ?auto_8450 ?auto_8451 ?auto_8452 ?auto_8449 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8455 - OBJ
      ?auto_8456 - OBJ
      ?auto_8457 - OBJ
      ?auto_8454 - LOCATION
    )
    :vars
    (
      ?auto_8458 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8458 ?auto_8454 ) ( IN-TRUCK ?auto_8455 ?auto_8458 ) ( OBJ-AT ?auto_8456 ?auto_8454 ) ( OBJ-AT ?auto_8457 ?auto_8454 ) ( not ( = ?auto_8455 ?auto_8456 ) ) ( not ( = ?auto_8455 ?auto_8457 ) ) ( not ( = ?auto_8456 ?auto_8457 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8455 ?auto_8454 )
      ( DELIVER-3PKG-VERIFY ?auto_8455 ?auto_8456 ?auto_8457 ?auto_8454 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8465 - OBJ
      ?auto_8466 - OBJ
      ?auto_8467 - OBJ
      ?auto_8464 - LOCATION
    )
    :vars
    (
      ?auto_8468 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8468 ?auto_8464 ) ( IN-TRUCK ?auto_8465 ?auto_8468 ) ( OBJ-AT ?auto_8466 ?auto_8464 ) ( OBJ-AT ?auto_8467 ?auto_8464 ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8465 ?auto_8467 ) ) ( not ( = ?auto_8466 ?auto_8467 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8465 ?auto_8464 )
      ( DELIVER-3PKG-VERIFY ?auto_8465 ?auto_8466 ?auto_8467 ?auto_8464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8470 - OBJ
      ?auto_8471 - OBJ
      ?auto_8472 - OBJ
      ?auto_8469 - LOCATION
    )
    :vars
    (
      ?auto_8473 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8473 ?auto_8469 ) ( IN-TRUCK ?auto_8470 ?auto_8473 ) ( OBJ-AT ?auto_8471 ?auto_8469 ) ( OBJ-AT ?auto_8472 ?auto_8469 ) ( not ( = ?auto_8470 ?auto_8471 ) ) ( not ( = ?auto_8470 ?auto_8472 ) ) ( not ( = ?auto_8471 ?auto_8472 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8470 ?auto_8469 )
      ( DELIVER-3PKG-VERIFY ?auto_8470 ?auto_8471 ?auto_8472 ?auto_8469 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8495 - OBJ
      ?auto_8494 - LOCATION
    )
    :vars
    (
      ?auto_8496 - TRUCK
      ?auto_8497 - LOCATION
      ?auto_8498 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8495 ?auto_8496 ) ( TRUCK-AT ?auto_8496 ?auto_8497 ) ( IN-CITY ?auto_8497 ?auto_8498 ) ( IN-CITY ?auto_8494 ?auto_8498 ) ( not ( = ?auto_8494 ?auto_8497 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8496 ?auto_8497 ?auto_8494 ?auto_8498 )
      ( DELIVER-1PKG ?auto_8495 ?auto_8494 )
      ( DELIVER-1PKG-VERIFY ?auto_8495 ?auto_8494 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8500 - OBJ
      ?auto_8501 - OBJ
      ?auto_8499 - LOCATION
    )
    :vars
    (
      ?auto_8503 - TRUCK
      ?auto_8504 - LOCATION
      ?auto_8502 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8501 ?auto_8503 ) ( TRUCK-AT ?auto_8503 ?auto_8504 ) ( IN-CITY ?auto_8504 ?auto_8502 ) ( IN-CITY ?auto_8499 ?auto_8502 ) ( not ( = ?auto_8499 ?auto_8504 ) ) ( OBJ-AT ?auto_8500 ?auto_8499 ) ( not ( = ?auto_8500 ?auto_8501 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8501 ?auto_8499 )
      ( DELIVER-2PKG-VERIFY ?auto_8500 ?auto_8501 ?auto_8499 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8506 - OBJ
      ?auto_8507 - OBJ
      ?auto_8505 - LOCATION
    )
    :vars
    (
      ?auto_8511 - TRUCK
      ?auto_8509 - LOCATION
      ?auto_8508 - CITY
      ?auto_8510 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8507 ?auto_8511 ) ( TRUCK-AT ?auto_8511 ?auto_8509 ) ( IN-CITY ?auto_8509 ?auto_8508 ) ( IN-CITY ?auto_8505 ?auto_8508 ) ( not ( = ?auto_8505 ?auto_8509 ) ) ( OBJ-AT ?auto_8510 ?auto_8505 ) ( not ( = ?auto_8510 ?auto_8507 ) ) ( OBJ-AT ?auto_8506 ?auto_8505 ) ( not ( = ?auto_8506 ?auto_8507 ) ) ( not ( = ?auto_8506 ?auto_8510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8510 ?auto_8507 ?auto_8505 )
      ( DELIVER-2PKG-VERIFY ?auto_8506 ?auto_8507 ?auto_8505 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8513 - OBJ
      ?auto_8514 - OBJ
      ?auto_8512 - LOCATION
    )
    :vars
    (
      ?auto_8517 - TRUCK
      ?auto_8516 - LOCATION
      ?auto_8515 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8513 ?auto_8517 ) ( TRUCK-AT ?auto_8517 ?auto_8516 ) ( IN-CITY ?auto_8516 ?auto_8515 ) ( IN-CITY ?auto_8512 ?auto_8515 ) ( not ( = ?auto_8512 ?auto_8516 ) ) ( OBJ-AT ?auto_8514 ?auto_8512 ) ( not ( = ?auto_8514 ?auto_8513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8514 ?auto_8513 ?auto_8512 )
      ( DELIVER-2PKG-VERIFY ?auto_8513 ?auto_8514 ?auto_8512 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8519 - OBJ
      ?auto_8520 - OBJ
      ?auto_8518 - LOCATION
    )
    :vars
    (
      ?auto_8524 - TRUCK
      ?auto_8522 - LOCATION
      ?auto_8521 - CITY
      ?auto_8523 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8519 ?auto_8524 ) ( TRUCK-AT ?auto_8524 ?auto_8522 ) ( IN-CITY ?auto_8522 ?auto_8521 ) ( IN-CITY ?auto_8518 ?auto_8521 ) ( not ( = ?auto_8518 ?auto_8522 ) ) ( OBJ-AT ?auto_8523 ?auto_8518 ) ( not ( = ?auto_8523 ?auto_8519 ) ) ( OBJ-AT ?auto_8520 ?auto_8518 ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( not ( = ?auto_8520 ?auto_8523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8523 ?auto_8519 ?auto_8518 )
      ( DELIVER-2PKG-VERIFY ?auto_8519 ?auto_8520 ?auto_8518 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8533 - OBJ
      ?auto_8534 - OBJ
      ?auto_8535 - OBJ
      ?auto_8532 - LOCATION
    )
    :vars
    (
      ?auto_8538 - TRUCK
      ?auto_8537 - LOCATION
      ?auto_8536 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8535 ?auto_8538 ) ( TRUCK-AT ?auto_8538 ?auto_8537 ) ( IN-CITY ?auto_8537 ?auto_8536 ) ( IN-CITY ?auto_8532 ?auto_8536 ) ( not ( = ?auto_8532 ?auto_8537 ) ) ( OBJ-AT ?auto_8534 ?auto_8532 ) ( not ( = ?auto_8534 ?auto_8535 ) ) ( OBJ-AT ?auto_8533 ?auto_8532 ) ( not ( = ?auto_8533 ?auto_8534 ) ) ( not ( = ?auto_8533 ?auto_8535 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8534 ?auto_8535 ?auto_8532 )
      ( DELIVER-3PKG-VERIFY ?auto_8533 ?auto_8534 ?auto_8535 ?auto_8532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8540 - OBJ
      ?auto_8541 - OBJ
      ?auto_8542 - OBJ
      ?auto_8539 - LOCATION
    )
    :vars
    (
      ?auto_8545 - TRUCK
      ?auto_8544 - LOCATION
      ?auto_8543 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8542 ?auto_8545 ) ( TRUCK-AT ?auto_8545 ?auto_8544 ) ( IN-CITY ?auto_8544 ?auto_8543 ) ( IN-CITY ?auto_8539 ?auto_8543 ) ( not ( = ?auto_8539 ?auto_8544 ) ) ( OBJ-AT ?auto_8540 ?auto_8539 ) ( not ( = ?auto_8540 ?auto_8542 ) ) ( OBJ-AT ?auto_8541 ?auto_8539 ) ( not ( = ?auto_8540 ?auto_8541 ) ) ( not ( = ?auto_8541 ?auto_8542 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8540 ?auto_8542 ?auto_8539 )
      ( DELIVER-3PKG-VERIFY ?auto_8540 ?auto_8541 ?auto_8542 ?auto_8539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8547 - OBJ
      ?auto_8548 - OBJ
      ?auto_8549 - OBJ
      ?auto_8546 - LOCATION
    )
    :vars
    (
      ?auto_8552 - TRUCK
      ?auto_8551 - LOCATION
      ?auto_8550 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8548 ?auto_8552 ) ( TRUCK-AT ?auto_8552 ?auto_8551 ) ( IN-CITY ?auto_8551 ?auto_8550 ) ( IN-CITY ?auto_8546 ?auto_8550 ) ( not ( = ?auto_8546 ?auto_8551 ) ) ( OBJ-AT ?auto_8549 ?auto_8546 ) ( not ( = ?auto_8549 ?auto_8548 ) ) ( OBJ-AT ?auto_8547 ?auto_8546 ) ( not ( = ?auto_8547 ?auto_8548 ) ) ( not ( = ?auto_8547 ?auto_8549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8549 ?auto_8548 ?auto_8546 )
      ( DELIVER-3PKG-VERIFY ?auto_8547 ?auto_8548 ?auto_8549 ?auto_8546 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8554 - OBJ
      ?auto_8555 - OBJ
      ?auto_8556 - OBJ
      ?auto_8553 - LOCATION
    )
    :vars
    (
      ?auto_8559 - TRUCK
      ?auto_8558 - LOCATION
      ?auto_8557 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8555 ?auto_8559 ) ( TRUCK-AT ?auto_8559 ?auto_8558 ) ( IN-CITY ?auto_8558 ?auto_8557 ) ( IN-CITY ?auto_8553 ?auto_8557 ) ( not ( = ?auto_8553 ?auto_8558 ) ) ( OBJ-AT ?auto_8554 ?auto_8553 ) ( not ( = ?auto_8554 ?auto_8555 ) ) ( OBJ-AT ?auto_8556 ?auto_8553 ) ( not ( = ?auto_8554 ?auto_8556 ) ) ( not ( = ?auto_8555 ?auto_8556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8554 ?auto_8555 ?auto_8553 )
      ( DELIVER-3PKG-VERIFY ?auto_8554 ?auto_8555 ?auto_8556 ?auto_8553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8568 - OBJ
      ?auto_8569 - OBJ
      ?auto_8570 - OBJ
      ?auto_8567 - LOCATION
    )
    :vars
    (
      ?auto_8573 - TRUCK
      ?auto_8572 - LOCATION
      ?auto_8571 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8570 ?auto_8573 ) ( TRUCK-AT ?auto_8573 ?auto_8572 ) ( IN-CITY ?auto_8572 ?auto_8571 ) ( IN-CITY ?auto_8567 ?auto_8571 ) ( not ( = ?auto_8567 ?auto_8572 ) ) ( OBJ-AT ?auto_8569 ?auto_8567 ) ( not ( = ?auto_8569 ?auto_8570 ) ) ( OBJ-AT ?auto_8568 ?auto_8567 ) ( not ( = ?auto_8568 ?auto_8569 ) ) ( not ( = ?auto_8568 ?auto_8570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8569 ?auto_8570 ?auto_8567 )
      ( DELIVER-3PKG-VERIFY ?auto_8568 ?auto_8569 ?auto_8570 ?auto_8567 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8575 - OBJ
      ?auto_8576 - OBJ
      ?auto_8577 - OBJ
      ?auto_8574 - LOCATION
    )
    :vars
    (
      ?auto_8581 - TRUCK
      ?auto_8579 - LOCATION
      ?auto_8578 - CITY
      ?auto_8580 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8577 ?auto_8581 ) ( TRUCK-AT ?auto_8581 ?auto_8579 ) ( IN-CITY ?auto_8579 ?auto_8578 ) ( IN-CITY ?auto_8574 ?auto_8578 ) ( not ( = ?auto_8574 ?auto_8579 ) ) ( OBJ-AT ?auto_8580 ?auto_8574 ) ( not ( = ?auto_8580 ?auto_8577 ) ) ( OBJ-AT ?auto_8575 ?auto_8574 ) ( OBJ-AT ?auto_8576 ?auto_8574 ) ( not ( = ?auto_8575 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8577 ) ) ( not ( = ?auto_8575 ?auto_8580 ) ) ( not ( = ?auto_8576 ?auto_8577 ) ) ( not ( = ?auto_8576 ?auto_8580 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8580 ?auto_8577 ?auto_8574 )
      ( DELIVER-3PKG-VERIFY ?auto_8575 ?auto_8576 ?auto_8577 ?auto_8574 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8583 - OBJ
      ?auto_8584 - OBJ
      ?auto_8585 - OBJ
      ?auto_8582 - LOCATION
    )
    :vars
    (
      ?auto_8588 - TRUCK
      ?auto_8587 - LOCATION
      ?auto_8586 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8584 ?auto_8588 ) ( TRUCK-AT ?auto_8588 ?auto_8587 ) ( IN-CITY ?auto_8587 ?auto_8586 ) ( IN-CITY ?auto_8582 ?auto_8586 ) ( not ( = ?auto_8582 ?auto_8587 ) ) ( OBJ-AT ?auto_8585 ?auto_8582 ) ( not ( = ?auto_8585 ?auto_8584 ) ) ( OBJ-AT ?auto_8583 ?auto_8582 ) ( not ( = ?auto_8583 ?auto_8584 ) ) ( not ( = ?auto_8583 ?auto_8585 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8585 ?auto_8584 ?auto_8582 )
      ( DELIVER-3PKG-VERIFY ?auto_8583 ?auto_8584 ?auto_8585 ?auto_8582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8590 - OBJ
      ?auto_8591 - OBJ
      ?auto_8592 - OBJ
      ?auto_8589 - LOCATION
    )
    :vars
    (
      ?auto_8596 - TRUCK
      ?auto_8594 - LOCATION
      ?auto_8593 - CITY
      ?auto_8595 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8591 ?auto_8596 ) ( TRUCK-AT ?auto_8596 ?auto_8594 ) ( IN-CITY ?auto_8594 ?auto_8593 ) ( IN-CITY ?auto_8589 ?auto_8593 ) ( not ( = ?auto_8589 ?auto_8594 ) ) ( OBJ-AT ?auto_8595 ?auto_8589 ) ( not ( = ?auto_8595 ?auto_8591 ) ) ( OBJ-AT ?auto_8590 ?auto_8589 ) ( OBJ-AT ?auto_8592 ?auto_8589 ) ( not ( = ?auto_8590 ?auto_8591 ) ) ( not ( = ?auto_8590 ?auto_8592 ) ) ( not ( = ?auto_8590 ?auto_8595 ) ) ( not ( = ?auto_8591 ?auto_8592 ) ) ( not ( = ?auto_8592 ?auto_8595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8595 ?auto_8591 ?auto_8589 )
      ( DELIVER-3PKG-VERIFY ?auto_8590 ?auto_8591 ?auto_8592 ?auto_8589 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8606 - OBJ
      ?auto_8607 - OBJ
      ?auto_8608 - OBJ
      ?auto_8605 - LOCATION
    )
    :vars
    (
      ?auto_8611 - TRUCK
      ?auto_8610 - LOCATION
      ?auto_8609 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8606 ?auto_8611 ) ( TRUCK-AT ?auto_8611 ?auto_8610 ) ( IN-CITY ?auto_8610 ?auto_8609 ) ( IN-CITY ?auto_8605 ?auto_8609 ) ( not ( = ?auto_8605 ?auto_8610 ) ) ( OBJ-AT ?auto_8607 ?auto_8605 ) ( not ( = ?auto_8607 ?auto_8606 ) ) ( OBJ-AT ?auto_8608 ?auto_8605 ) ( not ( = ?auto_8606 ?auto_8608 ) ) ( not ( = ?auto_8607 ?auto_8608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8607 ?auto_8606 ?auto_8605 )
      ( DELIVER-3PKG-VERIFY ?auto_8606 ?auto_8607 ?auto_8608 ?auto_8605 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8613 - OBJ
      ?auto_8614 - OBJ
      ?auto_8615 - OBJ
      ?auto_8612 - LOCATION
    )
    :vars
    (
      ?auto_8618 - TRUCK
      ?auto_8617 - LOCATION
      ?auto_8616 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8613 ?auto_8618 ) ( TRUCK-AT ?auto_8618 ?auto_8617 ) ( IN-CITY ?auto_8617 ?auto_8616 ) ( IN-CITY ?auto_8612 ?auto_8616 ) ( not ( = ?auto_8612 ?auto_8617 ) ) ( OBJ-AT ?auto_8614 ?auto_8612 ) ( not ( = ?auto_8614 ?auto_8613 ) ) ( OBJ-AT ?auto_8615 ?auto_8612 ) ( not ( = ?auto_8613 ?auto_8615 ) ) ( not ( = ?auto_8614 ?auto_8615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8614 ?auto_8613 ?auto_8612 )
      ( DELIVER-3PKG-VERIFY ?auto_8613 ?auto_8614 ?auto_8615 ?auto_8612 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8627 - OBJ
      ?auto_8628 - OBJ
      ?auto_8629 - OBJ
      ?auto_8626 - LOCATION
    )
    :vars
    (
      ?auto_8632 - TRUCK
      ?auto_8631 - LOCATION
      ?auto_8630 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8627 ?auto_8632 ) ( TRUCK-AT ?auto_8632 ?auto_8631 ) ( IN-CITY ?auto_8631 ?auto_8630 ) ( IN-CITY ?auto_8626 ?auto_8630 ) ( not ( = ?auto_8626 ?auto_8631 ) ) ( OBJ-AT ?auto_8629 ?auto_8626 ) ( not ( = ?auto_8629 ?auto_8627 ) ) ( OBJ-AT ?auto_8628 ?auto_8626 ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8628 ?auto_8629 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8629 ?auto_8627 ?auto_8626 )
      ( DELIVER-3PKG-VERIFY ?auto_8627 ?auto_8628 ?auto_8629 ?auto_8626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8634 - OBJ
      ?auto_8635 - OBJ
      ?auto_8636 - OBJ
      ?auto_8633 - LOCATION
    )
    :vars
    (
      ?auto_8640 - TRUCK
      ?auto_8638 - LOCATION
      ?auto_8637 - CITY
      ?auto_8639 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8634 ?auto_8640 ) ( TRUCK-AT ?auto_8640 ?auto_8638 ) ( IN-CITY ?auto_8638 ?auto_8637 ) ( IN-CITY ?auto_8633 ?auto_8637 ) ( not ( = ?auto_8633 ?auto_8638 ) ) ( OBJ-AT ?auto_8639 ?auto_8633 ) ( not ( = ?auto_8639 ?auto_8634 ) ) ( OBJ-AT ?auto_8635 ?auto_8633 ) ( OBJ-AT ?auto_8636 ?auto_8633 ) ( not ( = ?auto_8634 ?auto_8635 ) ) ( not ( = ?auto_8634 ?auto_8636 ) ) ( not ( = ?auto_8635 ?auto_8636 ) ) ( not ( = ?auto_8635 ?auto_8639 ) ) ( not ( = ?auto_8636 ?auto_8639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8639 ?auto_8634 ?auto_8633 )
      ( DELIVER-3PKG-VERIFY ?auto_8634 ?auto_8635 ?auto_8636 ?auto_8633 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8673 - OBJ
      ?auto_8672 - LOCATION
    )
    :vars
    (
      ?auto_8677 - TRUCK
      ?auto_8675 - LOCATION
      ?auto_8674 - CITY
      ?auto_8676 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8677 ?auto_8675 ) ( IN-CITY ?auto_8675 ?auto_8674 ) ( IN-CITY ?auto_8672 ?auto_8674 ) ( not ( = ?auto_8672 ?auto_8675 ) ) ( OBJ-AT ?auto_8676 ?auto_8672 ) ( not ( = ?auto_8676 ?auto_8673 ) ) ( OBJ-AT ?auto_8673 ?auto_8675 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8673 ?auto_8677 ?auto_8675 )
      ( DELIVER-2PKG ?auto_8676 ?auto_8673 ?auto_8672 )
      ( DELIVER-1PKG-VERIFY ?auto_8673 ?auto_8672 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8679 - OBJ
      ?auto_8680 - OBJ
      ?auto_8678 - LOCATION
    )
    :vars
    (
      ?auto_8683 - TRUCK
      ?auto_8682 - LOCATION
      ?auto_8681 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8683 ?auto_8682 ) ( IN-CITY ?auto_8682 ?auto_8681 ) ( IN-CITY ?auto_8678 ?auto_8681 ) ( not ( = ?auto_8678 ?auto_8682 ) ) ( OBJ-AT ?auto_8679 ?auto_8678 ) ( not ( = ?auto_8679 ?auto_8680 ) ) ( OBJ-AT ?auto_8680 ?auto_8682 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8680 ?auto_8678 )
      ( DELIVER-2PKG-VERIFY ?auto_8679 ?auto_8680 ?auto_8678 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8685 - OBJ
      ?auto_8686 - OBJ
      ?auto_8684 - LOCATION
    )
    :vars
    (
      ?auto_8690 - TRUCK
      ?auto_8687 - LOCATION
      ?auto_8689 - CITY
      ?auto_8688 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8690 ?auto_8687 ) ( IN-CITY ?auto_8687 ?auto_8689 ) ( IN-CITY ?auto_8684 ?auto_8689 ) ( not ( = ?auto_8684 ?auto_8687 ) ) ( OBJ-AT ?auto_8688 ?auto_8684 ) ( not ( = ?auto_8688 ?auto_8686 ) ) ( OBJ-AT ?auto_8686 ?auto_8687 ) ( OBJ-AT ?auto_8685 ?auto_8684 ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( not ( = ?auto_8685 ?auto_8688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8688 ?auto_8686 ?auto_8684 )
      ( DELIVER-2PKG-VERIFY ?auto_8685 ?auto_8686 ?auto_8684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8692 - OBJ
      ?auto_8693 - OBJ
      ?auto_8691 - LOCATION
    )
    :vars
    (
      ?auto_8696 - TRUCK
      ?auto_8694 - LOCATION
      ?auto_8695 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8696 ?auto_8694 ) ( IN-CITY ?auto_8694 ?auto_8695 ) ( IN-CITY ?auto_8691 ?auto_8695 ) ( not ( = ?auto_8691 ?auto_8694 ) ) ( OBJ-AT ?auto_8693 ?auto_8691 ) ( not ( = ?auto_8693 ?auto_8692 ) ) ( OBJ-AT ?auto_8692 ?auto_8694 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8693 ?auto_8692 ?auto_8691 )
      ( DELIVER-2PKG-VERIFY ?auto_8692 ?auto_8693 ?auto_8691 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8698 - OBJ
      ?auto_8699 - OBJ
      ?auto_8697 - LOCATION
    )
    :vars
    (
      ?auto_8703 - TRUCK
      ?auto_8700 - LOCATION
      ?auto_8702 - CITY
      ?auto_8701 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8703 ?auto_8700 ) ( IN-CITY ?auto_8700 ?auto_8702 ) ( IN-CITY ?auto_8697 ?auto_8702 ) ( not ( = ?auto_8697 ?auto_8700 ) ) ( OBJ-AT ?auto_8701 ?auto_8697 ) ( not ( = ?auto_8701 ?auto_8698 ) ) ( OBJ-AT ?auto_8698 ?auto_8700 ) ( OBJ-AT ?auto_8699 ?auto_8697 ) ( not ( = ?auto_8698 ?auto_8699 ) ) ( not ( = ?auto_8699 ?auto_8701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8701 ?auto_8698 ?auto_8697 )
      ( DELIVER-2PKG-VERIFY ?auto_8698 ?auto_8699 ?auto_8697 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8712 - OBJ
      ?auto_8713 - OBJ
      ?auto_8714 - OBJ
      ?auto_8711 - LOCATION
    )
    :vars
    (
      ?auto_8717 - TRUCK
      ?auto_8715 - LOCATION
      ?auto_8716 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8717 ?auto_8715 ) ( IN-CITY ?auto_8715 ?auto_8716 ) ( IN-CITY ?auto_8711 ?auto_8716 ) ( not ( = ?auto_8711 ?auto_8715 ) ) ( OBJ-AT ?auto_8713 ?auto_8711 ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( OBJ-AT ?auto_8714 ?auto_8715 ) ( OBJ-AT ?auto_8712 ?auto_8711 ) ( not ( = ?auto_8712 ?auto_8713 ) ) ( not ( = ?auto_8712 ?auto_8714 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8713 ?auto_8714 ?auto_8711 )
      ( DELIVER-3PKG-VERIFY ?auto_8712 ?auto_8713 ?auto_8714 ?auto_8711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8719 - OBJ
      ?auto_8720 - OBJ
      ?auto_8721 - OBJ
      ?auto_8718 - LOCATION
    )
    :vars
    (
      ?auto_8724 - TRUCK
      ?auto_8722 - LOCATION
      ?auto_8723 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8724 ?auto_8722 ) ( IN-CITY ?auto_8722 ?auto_8723 ) ( IN-CITY ?auto_8718 ?auto_8723 ) ( not ( = ?auto_8718 ?auto_8722 ) ) ( OBJ-AT ?auto_8719 ?auto_8718 ) ( not ( = ?auto_8719 ?auto_8721 ) ) ( OBJ-AT ?auto_8721 ?auto_8722 ) ( OBJ-AT ?auto_8720 ?auto_8718 ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( not ( = ?auto_8720 ?auto_8721 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8719 ?auto_8721 ?auto_8718 )
      ( DELIVER-3PKG-VERIFY ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8718 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8726 - OBJ
      ?auto_8727 - OBJ
      ?auto_8728 - OBJ
      ?auto_8725 - LOCATION
    )
    :vars
    (
      ?auto_8731 - TRUCK
      ?auto_8729 - LOCATION
      ?auto_8730 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8731 ?auto_8729 ) ( IN-CITY ?auto_8729 ?auto_8730 ) ( IN-CITY ?auto_8725 ?auto_8730 ) ( not ( = ?auto_8725 ?auto_8729 ) ) ( OBJ-AT ?auto_8728 ?auto_8725 ) ( not ( = ?auto_8728 ?auto_8727 ) ) ( OBJ-AT ?auto_8727 ?auto_8729 ) ( OBJ-AT ?auto_8726 ?auto_8725 ) ( not ( = ?auto_8726 ?auto_8727 ) ) ( not ( = ?auto_8726 ?auto_8728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8728 ?auto_8727 ?auto_8725 )
      ( DELIVER-3PKG-VERIFY ?auto_8726 ?auto_8727 ?auto_8728 ?auto_8725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8733 - OBJ
      ?auto_8734 - OBJ
      ?auto_8735 - OBJ
      ?auto_8732 - LOCATION
    )
    :vars
    (
      ?auto_8738 - TRUCK
      ?auto_8736 - LOCATION
      ?auto_8737 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8738 ?auto_8736 ) ( IN-CITY ?auto_8736 ?auto_8737 ) ( IN-CITY ?auto_8732 ?auto_8737 ) ( not ( = ?auto_8732 ?auto_8736 ) ) ( OBJ-AT ?auto_8733 ?auto_8732 ) ( not ( = ?auto_8733 ?auto_8734 ) ) ( OBJ-AT ?auto_8734 ?auto_8736 ) ( OBJ-AT ?auto_8735 ?auto_8732 ) ( not ( = ?auto_8733 ?auto_8735 ) ) ( not ( = ?auto_8734 ?auto_8735 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8733 ?auto_8734 ?auto_8732 )
      ( DELIVER-3PKG-VERIFY ?auto_8733 ?auto_8734 ?auto_8735 ?auto_8732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8747 - OBJ
      ?auto_8748 - OBJ
      ?auto_8749 - OBJ
      ?auto_8746 - LOCATION
    )
    :vars
    (
      ?auto_8752 - TRUCK
      ?auto_8750 - LOCATION
      ?auto_8751 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8752 ?auto_8750 ) ( IN-CITY ?auto_8750 ?auto_8751 ) ( IN-CITY ?auto_8746 ?auto_8751 ) ( not ( = ?auto_8746 ?auto_8750 ) ) ( OBJ-AT ?auto_8748 ?auto_8746 ) ( not ( = ?auto_8748 ?auto_8749 ) ) ( OBJ-AT ?auto_8749 ?auto_8750 ) ( OBJ-AT ?auto_8747 ?auto_8746 ) ( not ( = ?auto_8747 ?auto_8748 ) ) ( not ( = ?auto_8747 ?auto_8749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8748 ?auto_8749 ?auto_8746 )
      ( DELIVER-3PKG-VERIFY ?auto_8747 ?auto_8748 ?auto_8749 ?auto_8746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8754 - OBJ
      ?auto_8755 - OBJ
      ?auto_8756 - OBJ
      ?auto_8753 - LOCATION
    )
    :vars
    (
      ?auto_8760 - TRUCK
      ?auto_8757 - LOCATION
      ?auto_8759 - CITY
      ?auto_8758 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8760 ?auto_8757 ) ( IN-CITY ?auto_8757 ?auto_8759 ) ( IN-CITY ?auto_8753 ?auto_8759 ) ( not ( = ?auto_8753 ?auto_8757 ) ) ( OBJ-AT ?auto_8758 ?auto_8753 ) ( not ( = ?auto_8758 ?auto_8756 ) ) ( OBJ-AT ?auto_8756 ?auto_8757 ) ( OBJ-AT ?auto_8754 ?auto_8753 ) ( OBJ-AT ?auto_8755 ?auto_8753 ) ( not ( = ?auto_8754 ?auto_8755 ) ) ( not ( = ?auto_8754 ?auto_8756 ) ) ( not ( = ?auto_8754 ?auto_8758 ) ) ( not ( = ?auto_8755 ?auto_8756 ) ) ( not ( = ?auto_8755 ?auto_8758 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8758 ?auto_8756 ?auto_8753 )
      ( DELIVER-3PKG-VERIFY ?auto_8754 ?auto_8755 ?auto_8756 ?auto_8753 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8762 - OBJ
      ?auto_8763 - OBJ
      ?auto_8764 - OBJ
      ?auto_8761 - LOCATION
    )
    :vars
    (
      ?auto_8767 - TRUCK
      ?auto_8765 - LOCATION
      ?auto_8766 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8767 ?auto_8765 ) ( IN-CITY ?auto_8765 ?auto_8766 ) ( IN-CITY ?auto_8761 ?auto_8766 ) ( not ( = ?auto_8761 ?auto_8765 ) ) ( OBJ-AT ?auto_8764 ?auto_8761 ) ( not ( = ?auto_8764 ?auto_8763 ) ) ( OBJ-AT ?auto_8763 ?auto_8765 ) ( OBJ-AT ?auto_8762 ?auto_8761 ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8764 ?auto_8763 ?auto_8761 )
      ( DELIVER-3PKG-VERIFY ?auto_8762 ?auto_8763 ?auto_8764 ?auto_8761 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8769 - OBJ
      ?auto_8770 - OBJ
      ?auto_8771 - OBJ
      ?auto_8768 - LOCATION
    )
    :vars
    (
      ?auto_8775 - TRUCK
      ?auto_8772 - LOCATION
      ?auto_8774 - CITY
      ?auto_8773 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8775 ?auto_8772 ) ( IN-CITY ?auto_8772 ?auto_8774 ) ( IN-CITY ?auto_8768 ?auto_8774 ) ( not ( = ?auto_8768 ?auto_8772 ) ) ( OBJ-AT ?auto_8773 ?auto_8768 ) ( not ( = ?auto_8773 ?auto_8770 ) ) ( OBJ-AT ?auto_8770 ?auto_8772 ) ( OBJ-AT ?auto_8769 ?auto_8768 ) ( OBJ-AT ?auto_8771 ?auto_8768 ) ( not ( = ?auto_8769 ?auto_8770 ) ) ( not ( = ?auto_8769 ?auto_8771 ) ) ( not ( = ?auto_8769 ?auto_8773 ) ) ( not ( = ?auto_8770 ?auto_8771 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8773 ?auto_8770 ?auto_8768 )
      ( DELIVER-3PKG-VERIFY ?auto_8769 ?auto_8770 ?auto_8771 ?auto_8768 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8785 - OBJ
      ?auto_8786 - OBJ
      ?auto_8787 - OBJ
      ?auto_8784 - LOCATION
    )
    :vars
    (
      ?auto_8790 - TRUCK
      ?auto_8788 - LOCATION
      ?auto_8789 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8790 ?auto_8788 ) ( IN-CITY ?auto_8788 ?auto_8789 ) ( IN-CITY ?auto_8784 ?auto_8789 ) ( not ( = ?auto_8784 ?auto_8788 ) ) ( OBJ-AT ?auto_8787 ?auto_8784 ) ( not ( = ?auto_8787 ?auto_8785 ) ) ( OBJ-AT ?auto_8785 ?auto_8788 ) ( OBJ-AT ?auto_8786 ?auto_8784 ) ( not ( = ?auto_8785 ?auto_8786 ) ) ( not ( = ?auto_8786 ?auto_8787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8787 ?auto_8785 ?auto_8784 )
      ( DELIVER-3PKG-VERIFY ?auto_8785 ?auto_8786 ?auto_8787 ?auto_8784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8792 - OBJ
      ?auto_8793 - OBJ
      ?auto_8794 - OBJ
      ?auto_8791 - LOCATION
    )
    :vars
    (
      ?auto_8797 - TRUCK
      ?auto_8795 - LOCATION
      ?auto_8796 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8797 ?auto_8795 ) ( IN-CITY ?auto_8795 ?auto_8796 ) ( IN-CITY ?auto_8791 ?auto_8796 ) ( not ( = ?auto_8791 ?auto_8795 ) ) ( OBJ-AT ?auto_8793 ?auto_8791 ) ( not ( = ?auto_8793 ?auto_8792 ) ) ( OBJ-AT ?auto_8792 ?auto_8795 ) ( OBJ-AT ?auto_8794 ?auto_8791 ) ( not ( = ?auto_8792 ?auto_8794 ) ) ( not ( = ?auto_8793 ?auto_8794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8793 ?auto_8792 ?auto_8791 )
      ( DELIVER-3PKG-VERIFY ?auto_8792 ?auto_8793 ?auto_8794 ?auto_8791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8806 - OBJ
      ?auto_8807 - OBJ
      ?auto_8808 - OBJ
      ?auto_8805 - LOCATION
    )
    :vars
    (
      ?auto_8811 - TRUCK
      ?auto_8809 - LOCATION
      ?auto_8810 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8811 ?auto_8809 ) ( IN-CITY ?auto_8809 ?auto_8810 ) ( IN-CITY ?auto_8805 ?auto_8810 ) ( not ( = ?auto_8805 ?auto_8809 ) ) ( OBJ-AT ?auto_8808 ?auto_8805 ) ( not ( = ?auto_8808 ?auto_8806 ) ) ( OBJ-AT ?auto_8806 ?auto_8809 ) ( OBJ-AT ?auto_8807 ?auto_8805 ) ( not ( = ?auto_8806 ?auto_8807 ) ) ( not ( = ?auto_8807 ?auto_8808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8808 ?auto_8806 ?auto_8805 )
      ( DELIVER-3PKG-VERIFY ?auto_8806 ?auto_8807 ?auto_8808 ?auto_8805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8813 - OBJ
      ?auto_8814 - OBJ
      ?auto_8815 - OBJ
      ?auto_8812 - LOCATION
    )
    :vars
    (
      ?auto_8819 - TRUCK
      ?auto_8816 - LOCATION
      ?auto_8818 - CITY
      ?auto_8817 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8819 ?auto_8816 ) ( IN-CITY ?auto_8816 ?auto_8818 ) ( IN-CITY ?auto_8812 ?auto_8818 ) ( not ( = ?auto_8812 ?auto_8816 ) ) ( OBJ-AT ?auto_8817 ?auto_8812 ) ( not ( = ?auto_8817 ?auto_8813 ) ) ( OBJ-AT ?auto_8813 ?auto_8816 ) ( OBJ-AT ?auto_8814 ?auto_8812 ) ( OBJ-AT ?auto_8815 ?auto_8812 ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8814 ?auto_8817 ) ) ( not ( = ?auto_8815 ?auto_8817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8817 ?auto_8813 ?auto_8812 )
      ( DELIVER-3PKG-VERIFY ?auto_8813 ?auto_8814 ?auto_8815 ?auto_8812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8852 - OBJ
      ?auto_8851 - LOCATION
    )
    :vars
    (
      ?auto_8853 - LOCATION
      ?auto_8855 - CITY
      ?auto_8854 - OBJ
      ?auto_8856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8853 ?auto_8855 ) ( IN-CITY ?auto_8851 ?auto_8855 ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( OBJ-AT ?auto_8854 ?auto_8851 ) ( not ( = ?auto_8854 ?auto_8852 ) ) ( OBJ-AT ?auto_8852 ?auto_8853 ) ( TRUCK-AT ?auto_8856 ?auto_8851 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8856 ?auto_8851 ?auto_8853 ?auto_8855 )
      ( DELIVER-2PKG ?auto_8854 ?auto_8852 ?auto_8851 )
      ( DELIVER-1PKG-VERIFY ?auto_8852 ?auto_8851 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8858 - OBJ
      ?auto_8859 - OBJ
      ?auto_8857 - LOCATION
    )
    :vars
    (
      ?auto_8862 - LOCATION
      ?auto_8861 - CITY
      ?auto_8860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8862 ?auto_8861 ) ( IN-CITY ?auto_8857 ?auto_8861 ) ( not ( = ?auto_8857 ?auto_8862 ) ) ( OBJ-AT ?auto_8858 ?auto_8857 ) ( not ( = ?auto_8858 ?auto_8859 ) ) ( OBJ-AT ?auto_8859 ?auto_8862 ) ( TRUCK-AT ?auto_8860 ?auto_8857 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8859 ?auto_8857 )
      ( DELIVER-2PKG-VERIFY ?auto_8858 ?auto_8859 ?auto_8857 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8864 - OBJ
      ?auto_8865 - OBJ
      ?auto_8863 - LOCATION
    )
    :vars
    (
      ?auto_8867 - LOCATION
      ?auto_8866 - CITY
      ?auto_8869 - OBJ
      ?auto_8868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8867 ?auto_8866 ) ( IN-CITY ?auto_8863 ?auto_8866 ) ( not ( = ?auto_8863 ?auto_8867 ) ) ( OBJ-AT ?auto_8869 ?auto_8863 ) ( not ( = ?auto_8869 ?auto_8865 ) ) ( OBJ-AT ?auto_8865 ?auto_8867 ) ( TRUCK-AT ?auto_8868 ?auto_8863 ) ( OBJ-AT ?auto_8864 ?auto_8863 ) ( not ( = ?auto_8864 ?auto_8865 ) ) ( not ( = ?auto_8864 ?auto_8869 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8869 ?auto_8865 ?auto_8863 )
      ( DELIVER-2PKG-VERIFY ?auto_8864 ?auto_8865 ?auto_8863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8871 - OBJ
      ?auto_8872 - OBJ
      ?auto_8870 - LOCATION
    )
    :vars
    (
      ?auto_8874 - LOCATION
      ?auto_8873 - CITY
      ?auto_8875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8874 ?auto_8873 ) ( IN-CITY ?auto_8870 ?auto_8873 ) ( not ( = ?auto_8870 ?auto_8874 ) ) ( OBJ-AT ?auto_8872 ?auto_8870 ) ( not ( = ?auto_8872 ?auto_8871 ) ) ( OBJ-AT ?auto_8871 ?auto_8874 ) ( TRUCK-AT ?auto_8875 ?auto_8870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8872 ?auto_8871 ?auto_8870 )
      ( DELIVER-2PKG-VERIFY ?auto_8871 ?auto_8872 ?auto_8870 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8877 - OBJ
      ?auto_8878 - OBJ
      ?auto_8876 - LOCATION
    )
    :vars
    (
      ?auto_8880 - LOCATION
      ?auto_8879 - CITY
      ?auto_8882 - OBJ
      ?auto_8881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8880 ?auto_8879 ) ( IN-CITY ?auto_8876 ?auto_8879 ) ( not ( = ?auto_8876 ?auto_8880 ) ) ( OBJ-AT ?auto_8882 ?auto_8876 ) ( not ( = ?auto_8882 ?auto_8877 ) ) ( OBJ-AT ?auto_8877 ?auto_8880 ) ( TRUCK-AT ?auto_8881 ?auto_8876 ) ( OBJ-AT ?auto_8878 ?auto_8876 ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( not ( = ?auto_8878 ?auto_8882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8882 ?auto_8877 ?auto_8876 )
      ( DELIVER-2PKG-VERIFY ?auto_8877 ?auto_8878 ?auto_8876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8891 - OBJ
      ?auto_8892 - OBJ
      ?auto_8893 - OBJ
      ?auto_8890 - LOCATION
    )
    :vars
    (
      ?auto_8895 - LOCATION
      ?auto_8894 - CITY
      ?auto_8896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8895 ?auto_8894 ) ( IN-CITY ?auto_8890 ?auto_8894 ) ( not ( = ?auto_8890 ?auto_8895 ) ) ( OBJ-AT ?auto_8892 ?auto_8890 ) ( not ( = ?auto_8892 ?auto_8893 ) ) ( OBJ-AT ?auto_8893 ?auto_8895 ) ( TRUCK-AT ?auto_8896 ?auto_8890 ) ( OBJ-AT ?auto_8891 ?auto_8890 ) ( not ( = ?auto_8891 ?auto_8892 ) ) ( not ( = ?auto_8891 ?auto_8893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8892 ?auto_8893 ?auto_8890 )
      ( DELIVER-3PKG-VERIFY ?auto_8891 ?auto_8892 ?auto_8893 ?auto_8890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8898 - OBJ
      ?auto_8899 - OBJ
      ?auto_8900 - OBJ
      ?auto_8897 - LOCATION
    )
    :vars
    (
      ?auto_8902 - LOCATION
      ?auto_8901 - CITY
      ?auto_8903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8902 ?auto_8901 ) ( IN-CITY ?auto_8897 ?auto_8901 ) ( not ( = ?auto_8897 ?auto_8902 ) ) ( OBJ-AT ?auto_8898 ?auto_8897 ) ( not ( = ?auto_8898 ?auto_8900 ) ) ( OBJ-AT ?auto_8900 ?auto_8902 ) ( TRUCK-AT ?auto_8903 ?auto_8897 ) ( OBJ-AT ?auto_8899 ?auto_8897 ) ( not ( = ?auto_8898 ?auto_8899 ) ) ( not ( = ?auto_8899 ?auto_8900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8898 ?auto_8900 ?auto_8897 )
      ( DELIVER-3PKG-VERIFY ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8905 - OBJ
      ?auto_8906 - OBJ
      ?auto_8907 - OBJ
      ?auto_8904 - LOCATION
    )
    :vars
    (
      ?auto_8909 - LOCATION
      ?auto_8908 - CITY
      ?auto_8910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8909 ?auto_8908 ) ( IN-CITY ?auto_8904 ?auto_8908 ) ( not ( = ?auto_8904 ?auto_8909 ) ) ( OBJ-AT ?auto_8907 ?auto_8904 ) ( not ( = ?auto_8907 ?auto_8906 ) ) ( OBJ-AT ?auto_8906 ?auto_8909 ) ( TRUCK-AT ?auto_8910 ?auto_8904 ) ( OBJ-AT ?auto_8905 ?auto_8904 ) ( not ( = ?auto_8905 ?auto_8906 ) ) ( not ( = ?auto_8905 ?auto_8907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8907 ?auto_8906 ?auto_8904 )
      ( DELIVER-3PKG-VERIFY ?auto_8905 ?auto_8906 ?auto_8907 ?auto_8904 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8912 - OBJ
      ?auto_8913 - OBJ
      ?auto_8914 - OBJ
      ?auto_8911 - LOCATION
    )
    :vars
    (
      ?auto_8916 - LOCATION
      ?auto_8915 - CITY
      ?auto_8917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8916 ?auto_8915 ) ( IN-CITY ?auto_8911 ?auto_8915 ) ( not ( = ?auto_8911 ?auto_8916 ) ) ( OBJ-AT ?auto_8912 ?auto_8911 ) ( not ( = ?auto_8912 ?auto_8913 ) ) ( OBJ-AT ?auto_8913 ?auto_8916 ) ( TRUCK-AT ?auto_8917 ?auto_8911 ) ( OBJ-AT ?auto_8914 ?auto_8911 ) ( not ( = ?auto_8912 ?auto_8914 ) ) ( not ( = ?auto_8913 ?auto_8914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8912 ?auto_8913 ?auto_8911 )
      ( DELIVER-3PKG-VERIFY ?auto_8912 ?auto_8913 ?auto_8914 ?auto_8911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8926 - OBJ
      ?auto_8927 - OBJ
      ?auto_8928 - OBJ
      ?auto_8925 - LOCATION
    )
    :vars
    (
      ?auto_8930 - LOCATION
      ?auto_8929 - CITY
      ?auto_8931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8930 ?auto_8929 ) ( IN-CITY ?auto_8925 ?auto_8929 ) ( not ( = ?auto_8925 ?auto_8930 ) ) ( OBJ-AT ?auto_8927 ?auto_8925 ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( OBJ-AT ?auto_8928 ?auto_8930 ) ( TRUCK-AT ?auto_8931 ?auto_8925 ) ( OBJ-AT ?auto_8926 ?auto_8925 ) ( not ( = ?auto_8926 ?auto_8927 ) ) ( not ( = ?auto_8926 ?auto_8928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8927 ?auto_8928 ?auto_8925 )
      ( DELIVER-3PKG-VERIFY ?auto_8926 ?auto_8927 ?auto_8928 ?auto_8925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8933 - OBJ
      ?auto_8934 - OBJ
      ?auto_8935 - OBJ
      ?auto_8932 - LOCATION
    )
    :vars
    (
      ?auto_8937 - LOCATION
      ?auto_8936 - CITY
      ?auto_8939 - OBJ
      ?auto_8938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8937 ?auto_8936 ) ( IN-CITY ?auto_8932 ?auto_8936 ) ( not ( = ?auto_8932 ?auto_8937 ) ) ( OBJ-AT ?auto_8939 ?auto_8932 ) ( not ( = ?auto_8939 ?auto_8935 ) ) ( OBJ-AT ?auto_8935 ?auto_8937 ) ( TRUCK-AT ?auto_8938 ?auto_8932 ) ( OBJ-AT ?auto_8933 ?auto_8932 ) ( OBJ-AT ?auto_8934 ?auto_8932 ) ( not ( = ?auto_8933 ?auto_8934 ) ) ( not ( = ?auto_8933 ?auto_8935 ) ) ( not ( = ?auto_8933 ?auto_8939 ) ) ( not ( = ?auto_8934 ?auto_8935 ) ) ( not ( = ?auto_8934 ?auto_8939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8939 ?auto_8935 ?auto_8932 )
      ( DELIVER-3PKG-VERIFY ?auto_8933 ?auto_8934 ?auto_8935 ?auto_8932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8941 - OBJ
      ?auto_8942 - OBJ
      ?auto_8943 - OBJ
      ?auto_8940 - LOCATION
    )
    :vars
    (
      ?auto_8945 - LOCATION
      ?auto_8944 - CITY
      ?auto_8946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8945 ?auto_8944 ) ( IN-CITY ?auto_8940 ?auto_8944 ) ( not ( = ?auto_8940 ?auto_8945 ) ) ( OBJ-AT ?auto_8943 ?auto_8940 ) ( not ( = ?auto_8943 ?auto_8942 ) ) ( OBJ-AT ?auto_8942 ?auto_8945 ) ( TRUCK-AT ?auto_8946 ?auto_8940 ) ( OBJ-AT ?auto_8941 ?auto_8940 ) ( not ( = ?auto_8941 ?auto_8942 ) ) ( not ( = ?auto_8941 ?auto_8943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8943 ?auto_8942 ?auto_8940 )
      ( DELIVER-3PKG-VERIFY ?auto_8941 ?auto_8942 ?auto_8943 ?auto_8940 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8948 - OBJ
      ?auto_8949 - OBJ
      ?auto_8950 - OBJ
      ?auto_8947 - LOCATION
    )
    :vars
    (
      ?auto_8952 - LOCATION
      ?auto_8951 - CITY
      ?auto_8954 - OBJ
      ?auto_8953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8952 ?auto_8951 ) ( IN-CITY ?auto_8947 ?auto_8951 ) ( not ( = ?auto_8947 ?auto_8952 ) ) ( OBJ-AT ?auto_8954 ?auto_8947 ) ( not ( = ?auto_8954 ?auto_8949 ) ) ( OBJ-AT ?auto_8949 ?auto_8952 ) ( TRUCK-AT ?auto_8953 ?auto_8947 ) ( OBJ-AT ?auto_8948 ?auto_8947 ) ( OBJ-AT ?auto_8950 ?auto_8947 ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8950 ) ) ( not ( = ?auto_8948 ?auto_8954 ) ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( not ( = ?auto_8950 ?auto_8954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8954 ?auto_8949 ?auto_8947 )
      ( DELIVER-3PKG-VERIFY ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8947 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8964 - OBJ
      ?auto_8965 - OBJ
      ?auto_8966 - OBJ
      ?auto_8963 - LOCATION
    )
    :vars
    (
      ?auto_8968 - LOCATION
      ?auto_8967 - CITY
      ?auto_8969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8968 ?auto_8967 ) ( IN-CITY ?auto_8963 ?auto_8967 ) ( not ( = ?auto_8963 ?auto_8968 ) ) ( OBJ-AT ?auto_8966 ?auto_8963 ) ( not ( = ?auto_8966 ?auto_8964 ) ) ( OBJ-AT ?auto_8964 ?auto_8968 ) ( TRUCK-AT ?auto_8969 ?auto_8963 ) ( OBJ-AT ?auto_8965 ?auto_8963 ) ( not ( = ?auto_8964 ?auto_8965 ) ) ( not ( = ?auto_8965 ?auto_8966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8966 ?auto_8964 ?auto_8963 )
      ( DELIVER-3PKG-VERIFY ?auto_8964 ?auto_8965 ?auto_8966 ?auto_8963 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8971 - OBJ
      ?auto_8972 - OBJ
      ?auto_8973 - OBJ
      ?auto_8970 - LOCATION
    )
    :vars
    (
      ?auto_8975 - LOCATION
      ?auto_8974 - CITY
      ?auto_8976 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8975 ?auto_8974 ) ( IN-CITY ?auto_8970 ?auto_8974 ) ( not ( = ?auto_8970 ?auto_8975 ) ) ( OBJ-AT ?auto_8972 ?auto_8970 ) ( not ( = ?auto_8972 ?auto_8971 ) ) ( OBJ-AT ?auto_8971 ?auto_8975 ) ( TRUCK-AT ?auto_8976 ?auto_8970 ) ( OBJ-AT ?auto_8973 ?auto_8970 ) ( not ( = ?auto_8971 ?auto_8973 ) ) ( not ( = ?auto_8972 ?auto_8973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8972 ?auto_8971 ?auto_8970 )
      ( DELIVER-3PKG-VERIFY ?auto_8971 ?auto_8972 ?auto_8973 ?auto_8970 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8985 - OBJ
      ?auto_8986 - OBJ
      ?auto_8987 - OBJ
      ?auto_8984 - LOCATION
    )
    :vars
    (
      ?auto_8989 - LOCATION
      ?auto_8988 - CITY
      ?auto_8990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8989 ?auto_8988 ) ( IN-CITY ?auto_8984 ?auto_8988 ) ( not ( = ?auto_8984 ?auto_8989 ) ) ( OBJ-AT ?auto_8987 ?auto_8984 ) ( not ( = ?auto_8987 ?auto_8985 ) ) ( OBJ-AT ?auto_8985 ?auto_8989 ) ( TRUCK-AT ?auto_8990 ?auto_8984 ) ( OBJ-AT ?auto_8986 ?auto_8984 ) ( not ( = ?auto_8985 ?auto_8986 ) ) ( not ( = ?auto_8986 ?auto_8987 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8987 ?auto_8985 ?auto_8984 )
      ( DELIVER-3PKG-VERIFY ?auto_8985 ?auto_8986 ?auto_8987 ?auto_8984 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8992 - OBJ
      ?auto_8993 - OBJ
      ?auto_8994 - OBJ
      ?auto_8991 - LOCATION
    )
    :vars
    (
      ?auto_8996 - LOCATION
      ?auto_8995 - CITY
      ?auto_8998 - OBJ
      ?auto_8997 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8996 ?auto_8995 ) ( IN-CITY ?auto_8991 ?auto_8995 ) ( not ( = ?auto_8991 ?auto_8996 ) ) ( OBJ-AT ?auto_8998 ?auto_8991 ) ( not ( = ?auto_8998 ?auto_8992 ) ) ( OBJ-AT ?auto_8992 ?auto_8996 ) ( TRUCK-AT ?auto_8997 ?auto_8991 ) ( OBJ-AT ?auto_8993 ?auto_8991 ) ( OBJ-AT ?auto_8994 ?auto_8991 ) ( not ( = ?auto_8992 ?auto_8993 ) ) ( not ( = ?auto_8992 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8998 ) ) ( not ( = ?auto_8994 ?auto_8998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8998 ?auto_8992 ?auto_8991 )
      ( DELIVER-3PKG-VERIFY ?auto_8992 ?auto_8993 ?auto_8994 ?auto_8991 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9031 - OBJ
      ?auto_9030 - LOCATION
    )
    :vars
    (
      ?auto_9033 - LOCATION
      ?auto_9032 - CITY
      ?auto_9035 - OBJ
      ?auto_9034 - TRUCK
      ?auto_9036 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9033 ?auto_9032 ) ( IN-CITY ?auto_9030 ?auto_9032 ) ( not ( = ?auto_9030 ?auto_9033 ) ) ( OBJ-AT ?auto_9035 ?auto_9030 ) ( not ( = ?auto_9035 ?auto_9031 ) ) ( OBJ-AT ?auto_9031 ?auto_9033 ) ( TRUCK-AT ?auto_9034 ?auto_9030 ) ( IN-TRUCK ?auto_9036 ?auto_9034 ) ( not ( = ?auto_9035 ?auto_9036 ) ) ( not ( = ?auto_9031 ?auto_9036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9035 ?auto_9036 ?auto_9030 )
      ( DELIVER-2PKG ?auto_9035 ?auto_9031 ?auto_9030 )
      ( DELIVER-1PKG-VERIFY ?auto_9031 ?auto_9030 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9038 - OBJ
      ?auto_9039 - OBJ
      ?auto_9037 - LOCATION
    )
    :vars
    (
      ?auto_9040 - LOCATION
      ?auto_9042 - CITY
      ?auto_9043 - TRUCK
      ?auto_9041 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9040 ?auto_9042 ) ( IN-CITY ?auto_9037 ?auto_9042 ) ( not ( = ?auto_9037 ?auto_9040 ) ) ( OBJ-AT ?auto_9038 ?auto_9037 ) ( not ( = ?auto_9038 ?auto_9039 ) ) ( OBJ-AT ?auto_9039 ?auto_9040 ) ( TRUCK-AT ?auto_9043 ?auto_9037 ) ( IN-TRUCK ?auto_9041 ?auto_9043 ) ( not ( = ?auto_9038 ?auto_9041 ) ) ( not ( = ?auto_9039 ?auto_9041 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9039 ?auto_9037 )
      ( DELIVER-2PKG-VERIFY ?auto_9038 ?auto_9039 ?auto_9037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9045 - OBJ
      ?auto_9046 - OBJ
      ?auto_9044 - LOCATION
    )
    :vars
    (
      ?auto_9049 - LOCATION
      ?auto_9047 - CITY
      ?auto_9048 - OBJ
      ?auto_9050 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9049 ?auto_9047 ) ( IN-CITY ?auto_9044 ?auto_9047 ) ( not ( = ?auto_9044 ?auto_9049 ) ) ( OBJ-AT ?auto_9048 ?auto_9044 ) ( not ( = ?auto_9048 ?auto_9046 ) ) ( OBJ-AT ?auto_9046 ?auto_9049 ) ( TRUCK-AT ?auto_9050 ?auto_9044 ) ( IN-TRUCK ?auto_9045 ?auto_9050 ) ( not ( = ?auto_9048 ?auto_9045 ) ) ( not ( = ?auto_9046 ?auto_9045 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9048 ?auto_9046 ?auto_9044 )
      ( DELIVER-2PKG-VERIFY ?auto_9045 ?auto_9046 ?auto_9044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9052 - OBJ
      ?auto_9053 - OBJ
      ?auto_9051 - LOCATION
    )
    :vars
    (
      ?auto_9055 - LOCATION
      ?auto_9054 - CITY
      ?auto_9056 - TRUCK
      ?auto_9057 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9055 ?auto_9054 ) ( IN-CITY ?auto_9051 ?auto_9054 ) ( not ( = ?auto_9051 ?auto_9055 ) ) ( OBJ-AT ?auto_9053 ?auto_9051 ) ( not ( = ?auto_9053 ?auto_9052 ) ) ( OBJ-AT ?auto_9052 ?auto_9055 ) ( TRUCK-AT ?auto_9056 ?auto_9051 ) ( IN-TRUCK ?auto_9057 ?auto_9056 ) ( not ( = ?auto_9053 ?auto_9057 ) ) ( not ( = ?auto_9052 ?auto_9057 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9053 ?auto_9052 ?auto_9051 )
      ( DELIVER-2PKG-VERIFY ?auto_9052 ?auto_9053 ?auto_9051 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9059 - OBJ
      ?auto_9060 - OBJ
      ?auto_9058 - LOCATION
    )
    :vars
    (
      ?auto_9063 - LOCATION
      ?auto_9061 - CITY
      ?auto_9062 - OBJ
      ?auto_9064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9063 ?auto_9061 ) ( IN-CITY ?auto_9058 ?auto_9061 ) ( not ( = ?auto_9058 ?auto_9063 ) ) ( OBJ-AT ?auto_9062 ?auto_9058 ) ( not ( = ?auto_9062 ?auto_9059 ) ) ( OBJ-AT ?auto_9059 ?auto_9063 ) ( TRUCK-AT ?auto_9064 ?auto_9058 ) ( IN-TRUCK ?auto_9060 ?auto_9064 ) ( not ( = ?auto_9062 ?auto_9060 ) ) ( not ( = ?auto_9059 ?auto_9060 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9062 ?auto_9059 ?auto_9058 )
      ( DELIVER-2PKG-VERIFY ?auto_9059 ?auto_9060 ?auto_9058 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9074 - OBJ
      ?auto_9075 - OBJ
      ?auto_9076 - OBJ
      ?auto_9073 - LOCATION
    )
    :vars
    (
      ?auto_9078 - LOCATION
      ?auto_9077 - CITY
      ?auto_9079 - TRUCK
      ?auto_9080 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9078 ?auto_9077 ) ( IN-CITY ?auto_9073 ?auto_9077 ) ( not ( = ?auto_9073 ?auto_9078 ) ) ( OBJ-AT ?auto_9074 ?auto_9073 ) ( not ( = ?auto_9074 ?auto_9076 ) ) ( OBJ-AT ?auto_9076 ?auto_9078 ) ( TRUCK-AT ?auto_9079 ?auto_9073 ) ( IN-TRUCK ?auto_9080 ?auto_9079 ) ( not ( = ?auto_9074 ?auto_9080 ) ) ( not ( = ?auto_9076 ?auto_9080 ) ) ( OBJ-AT ?auto_9075 ?auto_9073 ) ( not ( = ?auto_9074 ?auto_9075 ) ) ( not ( = ?auto_9075 ?auto_9076 ) ) ( not ( = ?auto_9075 ?auto_9080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9074 ?auto_9076 ?auto_9073 )
      ( DELIVER-3PKG-VERIFY ?auto_9074 ?auto_9075 ?auto_9076 ?auto_9073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9082 - OBJ
      ?auto_9083 - OBJ
      ?auto_9084 - OBJ
      ?auto_9081 - LOCATION
    )
    :vars
    (
      ?auto_9086 - LOCATION
      ?auto_9085 - CITY
      ?auto_9087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9086 ?auto_9085 ) ( IN-CITY ?auto_9081 ?auto_9085 ) ( not ( = ?auto_9081 ?auto_9086 ) ) ( OBJ-AT ?auto_9082 ?auto_9081 ) ( not ( = ?auto_9082 ?auto_9084 ) ) ( OBJ-AT ?auto_9084 ?auto_9086 ) ( TRUCK-AT ?auto_9087 ?auto_9081 ) ( IN-TRUCK ?auto_9083 ?auto_9087 ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( not ( = ?auto_9084 ?auto_9083 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9082 ?auto_9084 ?auto_9081 )
      ( DELIVER-3PKG-VERIFY ?auto_9082 ?auto_9083 ?auto_9084 ?auto_9081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9089 - OBJ
      ?auto_9090 - OBJ
      ?auto_9091 - OBJ
      ?auto_9088 - LOCATION
    )
    :vars
    (
      ?auto_9093 - LOCATION
      ?auto_9092 - CITY
      ?auto_9094 - TRUCK
      ?auto_9095 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9093 ?auto_9092 ) ( IN-CITY ?auto_9088 ?auto_9092 ) ( not ( = ?auto_9088 ?auto_9093 ) ) ( OBJ-AT ?auto_9091 ?auto_9088 ) ( not ( = ?auto_9091 ?auto_9090 ) ) ( OBJ-AT ?auto_9090 ?auto_9093 ) ( TRUCK-AT ?auto_9094 ?auto_9088 ) ( IN-TRUCK ?auto_9095 ?auto_9094 ) ( not ( = ?auto_9091 ?auto_9095 ) ) ( not ( = ?auto_9090 ?auto_9095 ) ) ( OBJ-AT ?auto_9089 ?auto_9088 ) ( not ( = ?auto_9089 ?auto_9090 ) ) ( not ( = ?auto_9089 ?auto_9091 ) ) ( not ( = ?auto_9089 ?auto_9095 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9091 ?auto_9090 ?auto_9088 )
      ( DELIVER-3PKG-VERIFY ?auto_9089 ?auto_9090 ?auto_9091 ?auto_9088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9097 - OBJ
      ?auto_9098 - OBJ
      ?auto_9099 - OBJ
      ?auto_9096 - LOCATION
    )
    :vars
    (
      ?auto_9101 - LOCATION
      ?auto_9100 - CITY
      ?auto_9102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9101 ?auto_9100 ) ( IN-CITY ?auto_9096 ?auto_9100 ) ( not ( = ?auto_9096 ?auto_9101 ) ) ( OBJ-AT ?auto_9097 ?auto_9096 ) ( not ( = ?auto_9097 ?auto_9098 ) ) ( OBJ-AT ?auto_9098 ?auto_9101 ) ( TRUCK-AT ?auto_9102 ?auto_9096 ) ( IN-TRUCK ?auto_9099 ?auto_9102 ) ( not ( = ?auto_9097 ?auto_9099 ) ) ( not ( = ?auto_9098 ?auto_9099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9097 ?auto_9098 ?auto_9096 )
      ( DELIVER-3PKG-VERIFY ?auto_9097 ?auto_9098 ?auto_9099 ?auto_9096 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9112 - OBJ
      ?auto_9113 - OBJ
      ?auto_9114 - OBJ
      ?auto_9111 - LOCATION
    )
    :vars
    (
      ?auto_9116 - LOCATION
      ?auto_9115 - CITY
      ?auto_9117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9116 ?auto_9115 ) ( IN-CITY ?auto_9111 ?auto_9115 ) ( not ( = ?auto_9111 ?auto_9116 ) ) ( OBJ-AT ?auto_9113 ?auto_9111 ) ( not ( = ?auto_9113 ?auto_9114 ) ) ( OBJ-AT ?auto_9114 ?auto_9116 ) ( TRUCK-AT ?auto_9117 ?auto_9111 ) ( IN-TRUCK ?auto_9112 ?auto_9117 ) ( not ( = ?auto_9113 ?auto_9112 ) ) ( not ( = ?auto_9114 ?auto_9112 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9113 ?auto_9114 ?auto_9111 )
      ( DELIVER-3PKG-VERIFY ?auto_9112 ?auto_9113 ?auto_9114 ?auto_9111 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9127 - OBJ
      ?auto_9128 - OBJ
      ?auto_9129 - OBJ
      ?auto_9126 - LOCATION
    )
    :vars
    (
      ?auto_9131 - LOCATION
      ?auto_9130 - CITY
      ?auto_9132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9131 ?auto_9130 ) ( IN-CITY ?auto_9126 ?auto_9130 ) ( not ( = ?auto_9126 ?auto_9131 ) ) ( OBJ-AT ?auto_9129 ?auto_9126 ) ( not ( = ?auto_9129 ?auto_9128 ) ) ( OBJ-AT ?auto_9128 ?auto_9131 ) ( TRUCK-AT ?auto_9132 ?auto_9126 ) ( IN-TRUCK ?auto_9127 ?auto_9132 ) ( not ( = ?auto_9129 ?auto_9127 ) ) ( not ( = ?auto_9128 ?auto_9127 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9129 ?auto_9128 ?auto_9126 )
      ( DELIVER-3PKG-VERIFY ?auto_9127 ?auto_9128 ?auto_9129 ?auto_9126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9150 - OBJ
      ?auto_9151 - OBJ
      ?auto_9152 - OBJ
      ?auto_9149 - LOCATION
    )
    :vars
    (
      ?auto_9154 - LOCATION
      ?auto_9153 - CITY
      ?auto_9155 - TRUCK
      ?auto_9156 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9154 ?auto_9153 ) ( IN-CITY ?auto_9149 ?auto_9153 ) ( not ( = ?auto_9149 ?auto_9154 ) ) ( OBJ-AT ?auto_9151 ?auto_9149 ) ( not ( = ?auto_9151 ?auto_9150 ) ) ( OBJ-AT ?auto_9150 ?auto_9154 ) ( TRUCK-AT ?auto_9155 ?auto_9149 ) ( IN-TRUCK ?auto_9156 ?auto_9155 ) ( not ( = ?auto_9151 ?auto_9156 ) ) ( not ( = ?auto_9150 ?auto_9156 ) ) ( OBJ-AT ?auto_9152 ?auto_9149 ) ( not ( = ?auto_9150 ?auto_9152 ) ) ( not ( = ?auto_9151 ?auto_9152 ) ) ( not ( = ?auto_9152 ?auto_9156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9151 ?auto_9150 ?auto_9149 )
      ( DELIVER-3PKG-VERIFY ?auto_9150 ?auto_9151 ?auto_9152 ?auto_9149 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9158 - OBJ
      ?auto_9159 - OBJ
      ?auto_9160 - OBJ
      ?auto_9157 - LOCATION
    )
    :vars
    (
      ?auto_9162 - LOCATION
      ?auto_9161 - CITY
      ?auto_9163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9162 ?auto_9161 ) ( IN-CITY ?auto_9157 ?auto_9161 ) ( not ( = ?auto_9157 ?auto_9162 ) ) ( OBJ-AT ?auto_9159 ?auto_9157 ) ( not ( = ?auto_9159 ?auto_9158 ) ) ( OBJ-AT ?auto_9158 ?auto_9162 ) ( TRUCK-AT ?auto_9163 ?auto_9157 ) ( IN-TRUCK ?auto_9160 ?auto_9163 ) ( not ( = ?auto_9159 ?auto_9160 ) ) ( not ( = ?auto_9158 ?auto_9160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9159 ?auto_9158 ?auto_9157 )
      ( DELIVER-3PKG-VERIFY ?auto_9158 ?auto_9159 ?auto_9160 ?auto_9157 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9173 - OBJ
      ?auto_9174 - OBJ
      ?auto_9175 - OBJ
      ?auto_9172 - LOCATION
    )
    :vars
    (
      ?auto_9177 - LOCATION
      ?auto_9176 - CITY
      ?auto_9178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9177 ?auto_9176 ) ( IN-CITY ?auto_9172 ?auto_9176 ) ( not ( = ?auto_9172 ?auto_9177 ) ) ( OBJ-AT ?auto_9175 ?auto_9172 ) ( not ( = ?auto_9175 ?auto_9173 ) ) ( OBJ-AT ?auto_9173 ?auto_9177 ) ( TRUCK-AT ?auto_9178 ?auto_9172 ) ( IN-TRUCK ?auto_9174 ?auto_9178 ) ( not ( = ?auto_9175 ?auto_9174 ) ) ( not ( = ?auto_9173 ?auto_9174 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9175 ?auto_9173 ?auto_9172 )
      ( DELIVER-3PKG-VERIFY ?auto_9173 ?auto_9174 ?auto_9175 ?auto_9172 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9221 - OBJ
      ?auto_9220 - LOCATION
    )
    :vars
    (
      ?auto_9224 - LOCATION
      ?auto_9222 - CITY
      ?auto_9223 - OBJ
      ?auto_9226 - OBJ
      ?auto_9225 - TRUCK
      ?auto_9227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9224 ?auto_9222 ) ( IN-CITY ?auto_9220 ?auto_9222 ) ( not ( = ?auto_9220 ?auto_9224 ) ) ( OBJ-AT ?auto_9223 ?auto_9220 ) ( not ( = ?auto_9223 ?auto_9221 ) ) ( OBJ-AT ?auto_9221 ?auto_9224 ) ( IN-TRUCK ?auto_9226 ?auto_9225 ) ( not ( = ?auto_9223 ?auto_9226 ) ) ( not ( = ?auto_9221 ?auto_9226 ) ) ( TRUCK-AT ?auto_9225 ?auto_9227 ) ( IN-CITY ?auto_9227 ?auto_9222 ) ( not ( = ?auto_9220 ?auto_9227 ) ) ( not ( = ?auto_9224 ?auto_9227 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9225 ?auto_9227 ?auto_9220 ?auto_9222 )
      ( DELIVER-2PKG ?auto_9223 ?auto_9221 ?auto_9220 )
      ( DELIVER-1PKG-VERIFY ?auto_9221 ?auto_9220 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9229 - OBJ
      ?auto_9230 - OBJ
      ?auto_9228 - LOCATION
    )
    :vars
    (
      ?auto_9233 - LOCATION
      ?auto_9232 - CITY
      ?auto_9234 - OBJ
      ?auto_9235 - TRUCK
      ?auto_9231 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9233 ?auto_9232 ) ( IN-CITY ?auto_9228 ?auto_9232 ) ( not ( = ?auto_9228 ?auto_9233 ) ) ( OBJ-AT ?auto_9229 ?auto_9228 ) ( not ( = ?auto_9229 ?auto_9230 ) ) ( OBJ-AT ?auto_9230 ?auto_9233 ) ( IN-TRUCK ?auto_9234 ?auto_9235 ) ( not ( = ?auto_9229 ?auto_9234 ) ) ( not ( = ?auto_9230 ?auto_9234 ) ) ( TRUCK-AT ?auto_9235 ?auto_9231 ) ( IN-CITY ?auto_9231 ?auto_9232 ) ( not ( = ?auto_9228 ?auto_9231 ) ) ( not ( = ?auto_9233 ?auto_9231 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9230 ?auto_9228 )
      ( DELIVER-2PKG-VERIFY ?auto_9229 ?auto_9230 ?auto_9228 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9237 - OBJ
      ?auto_9238 - OBJ
      ?auto_9236 - LOCATION
    )
    :vars
    (
      ?auto_9241 - LOCATION
      ?auto_9240 - CITY
      ?auto_9243 - OBJ
      ?auto_9242 - TRUCK
      ?auto_9239 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9241 ?auto_9240 ) ( IN-CITY ?auto_9236 ?auto_9240 ) ( not ( = ?auto_9236 ?auto_9241 ) ) ( OBJ-AT ?auto_9243 ?auto_9236 ) ( not ( = ?auto_9243 ?auto_9238 ) ) ( OBJ-AT ?auto_9238 ?auto_9241 ) ( IN-TRUCK ?auto_9237 ?auto_9242 ) ( not ( = ?auto_9243 ?auto_9237 ) ) ( not ( = ?auto_9238 ?auto_9237 ) ) ( TRUCK-AT ?auto_9242 ?auto_9239 ) ( IN-CITY ?auto_9239 ?auto_9240 ) ( not ( = ?auto_9236 ?auto_9239 ) ) ( not ( = ?auto_9241 ?auto_9239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9243 ?auto_9238 ?auto_9236 )
      ( DELIVER-2PKG-VERIFY ?auto_9237 ?auto_9238 ?auto_9236 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9245 - OBJ
      ?auto_9246 - OBJ
      ?auto_9244 - LOCATION
    )
    :vars
    (
      ?auto_9250 - LOCATION
      ?auto_9249 - CITY
      ?auto_9248 - OBJ
      ?auto_9251 - TRUCK
      ?auto_9247 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9250 ?auto_9249 ) ( IN-CITY ?auto_9244 ?auto_9249 ) ( not ( = ?auto_9244 ?auto_9250 ) ) ( OBJ-AT ?auto_9246 ?auto_9244 ) ( not ( = ?auto_9246 ?auto_9245 ) ) ( OBJ-AT ?auto_9245 ?auto_9250 ) ( IN-TRUCK ?auto_9248 ?auto_9251 ) ( not ( = ?auto_9246 ?auto_9248 ) ) ( not ( = ?auto_9245 ?auto_9248 ) ) ( TRUCK-AT ?auto_9251 ?auto_9247 ) ( IN-CITY ?auto_9247 ?auto_9249 ) ( not ( = ?auto_9244 ?auto_9247 ) ) ( not ( = ?auto_9250 ?auto_9247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9246 ?auto_9245 ?auto_9244 )
      ( DELIVER-2PKG-VERIFY ?auto_9245 ?auto_9246 ?auto_9244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9253 - OBJ
      ?auto_9254 - OBJ
      ?auto_9252 - LOCATION
    )
    :vars
    (
      ?auto_9257 - LOCATION
      ?auto_9256 - CITY
      ?auto_9259 - OBJ
      ?auto_9258 - TRUCK
      ?auto_9255 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9257 ?auto_9256 ) ( IN-CITY ?auto_9252 ?auto_9256 ) ( not ( = ?auto_9252 ?auto_9257 ) ) ( OBJ-AT ?auto_9259 ?auto_9252 ) ( not ( = ?auto_9259 ?auto_9253 ) ) ( OBJ-AT ?auto_9253 ?auto_9257 ) ( IN-TRUCK ?auto_9254 ?auto_9258 ) ( not ( = ?auto_9259 ?auto_9254 ) ) ( not ( = ?auto_9253 ?auto_9254 ) ) ( TRUCK-AT ?auto_9258 ?auto_9255 ) ( IN-CITY ?auto_9255 ?auto_9256 ) ( not ( = ?auto_9252 ?auto_9255 ) ) ( not ( = ?auto_9257 ?auto_9255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9259 ?auto_9253 ?auto_9252 )
      ( DELIVER-2PKG-VERIFY ?auto_9253 ?auto_9254 ?auto_9252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9270 - OBJ
      ?auto_9271 - OBJ
      ?auto_9272 - OBJ
      ?auto_9269 - LOCATION
    )
    :vars
    (
      ?auto_9276 - LOCATION
      ?auto_9275 - CITY
      ?auto_9274 - OBJ
      ?auto_9277 - TRUCK
      ?auto_9273 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9276 ?auto_9275 ) ( IN-CITY ?auto_9269 ?auto_9275 ) ( not ( = ?auto_9269 ?auto_9276 ) ) ( OBJ-AT ?auto_9271 ?auto_9269 ) ( not ( = ?auto_9271 ?auto_9272 ) ) ( OBJ-AT ?auto_9272 ?auto_9276 ) ( IN-TRUCK ?auto_9274 ?auto_9277 ) ( not ( = ?auto_9271 ?auto_9274 ) ) ( not ( = ?auto_9272 ?auto_9274 ) ) ( TRUCK-AT ?auto_9277 ?auto_9273 ) ( IN-CITY ?auto_9273 ?auto_9275 ) ( not ( = ?auto_9269 ?auto_9273 ) ) ( not ( = ?auto_9276 ?auto_9273 ) ) ( OBJ-AT ?auto_9270 ?auto_9269 ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9272 ) ) ( not ( = ?auto_9270 ?auto_9274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9271 ?auto_9272 ?auto_9269 )
      ( DELIVER-3PKG-VERIFY ?auto_9270 ?auto_9271 ?auto_9272 ?auto_9269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9279 - OBJ
      ?auto_9280 - OBJ
      ?auto_9281 - OBJ
      ?auto_9278 - LOCATION
    )
    :vars
    (
      ?auto_9284 - LOCATION
      ?auto_9283 - CITY
      ?auto_9285 - TRUCK
      ?auto_9282 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9284 ?auto_9283 ) ( IN-CITY ?auto_9278 ?auto_9283 ) ( not ( = ?auto_9278 ?auto_9284 ) ) ( OBJ-AT ?auto_9279 ?auto_9278 ) ( not ( = ?auto_9279 ?auto_9281 ) ) ( OBJ-AT ?auto_9281 ?auto_9284 ) ( IN-TRUCK ?auto_9280 ?auto_9285 ) ( not ( = ?auto_9279 ?auto_9280 ) ) ( not ( = ?auto_9281 ?auto_9280 ) ) ( TRUCK-AT ?auto_9285 ?auto_9282 ) ( IN-CITY ?auto_9282 ?auto_9283 ) ( not ( = ?auto_9278 ?auto_9282 ) ) ( not ( = ?auto_9284 ?auto_9282 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9279 ?auto_9281 ?auto_9278 )
      ( DELIVER-3PKG-VERIFY ?auto_9279 ?auto_9280 ?auto_9281 ?auto_9278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9287 - OBJ
      ?auto_9288 - OBJ
      ?auto_9289 - OBJ
      ?auto_9286 - LOCATION
    )
    :vars
    (
      ?auto_9293 - LOCATION
      ?auto_9292 - CITY
      ?auto_9291 - OBJ
      ?auto_9294 - TRUCK
      ?auto_9290 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9293 ?auto_9292 ) ( IN-CITY ?auto_9286 ?auto_9292 ) ( not ( = ?auto_9286 ?auto_9293 ) ) ( OBJ-AT ?auto_9289 ?auto_9286 ) ( not ( = ?auto_9289 ?auto_9288 ) ) ( OBJ-AT ?auto_9288 ?auto_9293 ) ( IN-TRUCK ?auto_9291 ?auto_9294 ) ( not ( = ?auto_9289 ?auto_9291 ) ) ( not ( = ?auto_9288 ?auto_9291 ) ) ( TRUCK-AT ?auto_9294 ?auto_9290 ) ( IN-CITY ?auto_9290 ?auto_9292 ) ( not ( = ?auto_9286 ?auto_9290 ) ) ( not ( = ?auto_9293 ?auto_9290 ) ) ( OBJ-AT ?auto_9287 ?auto_9286 ) ( not ( = ?auto_9287 ?auto_9288 ) ) ( not ( = ?auto_9287 ?auto_9289 ) ) ( not ( = ?auto_9287 ?auto_9291 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9289 ?auto_9288 ?auto_9286 )
      ( DELIVER-3PKG-VERIFY ?auto_9287 ?auto_9288 ?auto_9289 ?auto_9286 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9296 - OBJ
      ?auto_9297 - OBJ
      ?auto_9298 - OBJ
      ?auto_9295 - LOCATION
    )
    :vars
    (
      ?auto_9301 - LOCATION
      ?auto_9300 - CITY
      ?auto_9302 - TRUCK
      ?auto_9299 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9301 ?auto_9300 ) ( IN-CITY ?auto_9295 ?auto_9300 ) ( not ( = ?auto_9295 ?auto_9301 ) ) ( OBJ-AT ?auto_9296 ?auto_9295 ) ( not ( = ?auto_9296 ?auto_9297 ) ) ( OBJ-AT ?auto_9297 ?auto_9301 ) ( IN-TRUCK ?auto_9298 ?auto_9302 ) ( not ( = ?auto_9296 ?auto_9298 ) ) ( not ( = ?auto_9297 ?auto_9298 ) ) ( TRUCK-AT ?auto_9302 ?auto_9299 ) ( IN-CITY ?auto_9299 ?auto_9300 ) ( not ( = ?auto_9295 ?auto_9299 ) ) ( not ( = ?auto_9301 ?auto_9299 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9296 ?auto_9297 ?auto_9295 )
      ( DELIVER-3PKG-VERIFY ?auto_9296 ?auto_9297 ?auto_9298 ?auto_9295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9313 - OBJ
      ?auto_9314 - OBJ
      ?auto_9315 - OBJ
      ?auto_9312 - LOCATION
    )
    :vars
    (
      ?auto_9318 - LOCATION
      ?auto_9317 - CITY
      ?auto_9319 - TRUCK
      ?auto_9316 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9318 ?auto_9317 ) ( IN-CITY ?auto_9312 ?auto_9317 ) ( not ( = ?auto_9312 ?auto_9318 ) ) ( OBJ-AT ?auto_9314 ?auto_9312 ) ( not ( = ?auto_9314 ?auto_9315 ) ) ( OBJ-AT ?auto_9315 ?auto_9318 ) ( IN-TRUCK ?auto_9313 ?auto_9319 ) ( not ( = ?auto_9314 ?auto_9313 ) ) ( not ( = ?auto_9315 ?auto_9313 ) ) ( TRUCK-AT ?auto_9319 ?auto_9316 ) ( IN-CITY ?auto_9316 ?auto_9317 ) ( not ( = ?auto_9312 ?auto_9316 ) ) ( not ( = ?auto_9318 ?auto_9316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9314 ?auto_9315 ?auto_9312 )
      ( DELIVER-3PKG-VERIFY ?auto_9313 ?auto_9314 ?auto_9315 ?auto_9312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9330 - OBJ
      ?auto_9331 - OBJ
      ?auto_9332 - OBJ
      ?auto_9329 - LOCATION
    )
    :vars
    (
      ?auto_9335 - LOCATION
      ?auto_9334 - CITY
      ?auto_9336 - TRUCK
      ?auto_9333 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9335 ?auto_9334 ) ( IN-CITY ?auto_9329 ?auto_9334 ) ( not ( = ?auto_9329 ?auto_9335 ) ) ( OBJ-AT ?auto_9332 ?auto_9329 ) ( not ( = ?auto_9332 ?auto_9331 ) ) ( OBJ-AT ?auto_9331 ?auto_9335 ) ( IN-TRUCK ?auto_9330 ?auto_9336 ) ( not ( = ?auto_9332 ?auto_9330 ) ) ( not ( = ?auto_9331 ?auto_9330 ) ) ( TRUCK-AT ?auto_9336 ?auto_9333 ) ( IN-CITY ?auto_9333 ?auto_9334 ) ( not ( = ?auto_9329 ?auto_9333 ) ) ( not ( = ?auto_9335 ?auto_9333 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9332 ?auto_9331 ?auto_9329 )
      ( DELIVER-3PKG-VERIFY ?auto_9330 ?auto_9331 ?auto_9332 ?auto_9329 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9356 - OBJ
      ?auto_9357 - OBJ
      ?auto_9358 - OBJ
      ?auto_9355 - LOCATION
    )
    :vars
    (
      ?auto_9362 - LOCATION
      ?auto_9361 - CITY
      ?auto_9360 - OBJ
      ?auto_9363 - TRUCK
      ?auto_9359 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9362 ?auto_9361 ) ( IN-CITY ?auto_9355 ?auto_9361 ) ( not ( = ?auto_9355 ?auto_9362 ) ) ( OBJ-AT ?auto_9358 ?auto_9355 ) ( not ( = ?auto_9358 ?auto_9356 ) ) ( OBJ-AT ?auto_9356 ?auto_9362 ) ( IN-TRUCK ?auto_9360 ?auto_9363 ) ( not ( = ?auto_9358 ?auto_9360 ) ) ( not ( = ?auto_9356 ?auto_9360 ) ) ( TRUCK-AT ?auto_9363 ?auto_9359 ) ( IN-CITY ?auto_9359 ?auto_9361 ) ( not ( = ?auto_9355 ?auto_9359 ) ) ( not ( = ?auto_9362 ?auto_9359 ) ) ( OBJ-AT ?auto_9357 ?auto_9355 ) ( not ( = ?auto_9356 ?auto_9357 ) ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9360 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9358 ?auto_9356 ?auto_9355 )
      ( DELIVER-3PKG-VERIFY ?auto_9356 ?auto_9357 ?auto_9358 ?auto_9355 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9365 - OBJ
      ?auto_9366 - OBJ
      ?auto_9367 - OBJ
      ?auto_9364 - LOCATION
    )
    :vars
    (
      ?auto_9370 - LOCATION
      ?auto_9369 - CITY
      ?auto_9371 - TRUCK
      ?auto_9368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9370 ?auto_9369 ) ( IN-CITY ?auto_9364 ?auto_9369 ) ( not ( = ?auto_9364 ?auto_9370 ) ) ( OBJ-AT ?auto_9366 ?auto_9364 ) ( not ( = ?auto_9366 ?auto_9365 ) ) ( OBJ-AT ?auto_9365 ?auto_9370 ) ( IN-TRUCK ?auto_9367 ?auto_9371 ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9365 ?auto_9367 ) ) ( TRUCK-AT ?auto_9371 ?auto_9368 ) ( IN-CITY ?auto_9368 ?auto_9369 ) ( not ( = ?auto_9364 ?auto_9368 ) ) ( not ( = ?auto_9370 ?auto_9368 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9366 ?auto_9365 ?auto_9364 )
      ( DELIVER-3PKG-VERIFY ?auto_9365 ?auto_9366 ?auto_9367 ?auto_9364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9382 - OBJ
      ?auto_9383 - OBJ
      ?auto_9384 - OBJ
      ?auto_9381 - LOCATION
    )
    :vars
    (
      ?auto_9387 - LOCATION
      ?auto_9386 - CITY
      ?auto_9388 - TRUCK
      ?auto_9385 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9387 ?auto_9386 ) ( IN-CITY ?auto_9381 ?auto_9386 ) ( not ( = ?auto_9381 ?auto_9387 ) ) ( OBJ-AT ?auto_9384 ?auto_9381 ) ( not ( = ?auto_9384 ?auto_9382 ) ) ( OBJ-AT ?auto_9382 ?auto_9387 ) ( IN-TRUCK ?auto_9383 ?auto_9388 ) ( not ( = ?auto_9384 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( TRUCK-AT ?auto_9388 ?auto_9385 ) ( IN-CITY ?auto_9385 ?auto_9386 ) ( not ( = ?auto_9381 ?auto_9385 ) ) ( not ( = ?auto_9387 ?auto_9385 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9384 ?auto_9382 ?auto_9381 )
      ( DELIVER-3PKG-VERIFY ?auto_9382 ?auto_9383 ?auto_9384 ?auto_9381 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9436 - OBJ
      ?auto_9435 - LOCATION
    )
    :vars
    (
      ?auto_9440 - LOCATION
      ?auto_9439 - CITY
      ?auto_9442 - OBJ
      ?auto_9438 - OBJ
      ?auto_9441 - TRUCK
      ?auto_9437 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9440 ?auto_9439 ) ( IN-CITY ?auto_9435 ?auto_9439 ) ( not ( = ?auto_9435 ?auto_9440 ) ) ( OBJ-AT ?auto_9442 ?auto_9435 ) ( not ( = ?auto_9442 ?auto_9436 ) ) ( OBJ-AT ?auto_9436 ?auto_9440 ) ( not ( = ?auto_9442 ?auto_9438 ) ) ( not ( = ?auto_9436 ?auto_9438 ) ) ( TRUCK-AT ?auto_9441 ?auto_9437 ) ( IN-CITY ?auto_9437 ?auto_9439 ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( not ( = ?auto_9440 ?auto_9437 ) ) ( OBJ-AT ?auto_9438 ?auto_9437 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9438 ?auto_9441 ?auto_9437 )
      ( DELIVER-2PKG ?auto_9442 ?auto_9436 ?auto_9435 )
      ( DELIVER-1PKG-VERIFY ?auto_9436 ?auto_9435 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9444 - OBJ
      ?auto_9445 - OBJ
      ?auto_9443 - LOCATION
    )
    :vars
    (
      ?auto_9450 - LOCATION
      ?auto_9447 - CITY
      ?auto_9448 - OBJ
      ?auto_9449 - TRUCK
      ?auto_9446 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9450 ?auto_9447 ) ( IN-CITY ?auto_9443 ?auto_9447 ) ( not ( = ?auto_9443 ?auto_9450 ) ) ( OBJ-AT ?auto_9444 ?auto_9443 ) ( not ( = ?auto_9444 ?auto_9445 ) ) ( OBJ-AT ?auto_9445 ?auto_9450 ) ( not ( = ?auto_9444 ?auto_9448 ) ) ( not ( = ?auto_9445 ?auto_9448 ) ) ( TRUCK-AT ?auto_9449 ?auto_9446 ) ( IN-CITY ?auto_9446 ?auto_9447 ) ( not ( = ?auto_9443 ?auto_9446 ) ) ( not ( = ?auto_9450 ?auto_9446 ) ) ( OBJ-AT ?auto_9448 ?auto_9446 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9445 ?auto_9443 )
      ( DELIVER-2PKG-VERIFY ?auto_9444 ?auto_9445 ?auto_9443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9452 - OBJ
      ?auto_9453 - OBJ
      ?auto_9451 - LOCATION
    )
    :vars
    (
      ?auto_9454 - LOCATION
      ?auto_9458 - CITY
      ?auto_9457 - OBJ
      ?auto_9456 - TRUCK
      ?auto_9455 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9454 ?auto_9458 ) ( IN-CITY ?auto_9451 ?auto_9458 ) ( not ( = ?auto_9451 ?auto_9454 ) ) ( OBJ-AT ?auto_9457 ?auto_9451 ) ( not ( = ?auto_9457 ?auto_9453 ) ) ( OBJ-AT ?auto_9453 ?auto_9454 ) ( not ( = ?auto_9457 ?auto_9452 ) ) ( not ( = ?auto_9453 ?auto_9452 ) ) ( TRUCK-AT ?auto_9456 ?auto_9455 ) ( IN-CITY ?auto_9455 ?auto_9458 ) ( not ( = ?auto_9451 ?auto_9455 ) ) ( not ( = ?auto_9454 ?auto_9455 ) ) ( OBJ-AT ?auto_9452 ?auto_9455 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9457 ?auto_9453 ?auto_9451 )
      ( DELIVER-2PKG-VERIFY ?auto_9452 ?auto_9453 ?auto_9451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9460 - OBJ
      ?auto_9461 - OBJ
      ?auto_9459 - LOCATION
    )
    :vars
    (
      ?auto_9462 - LOCATION
      ?auto_9466 - CITY
      ?auto_9463 - OBJ
      ?auto_9465 - TRUCK
      ?auto_9464 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9462 ?auto_9466 ) ( IN-CITY ?auto_9459 ?auto_9466 ) ( not ( = ?auto_9459 ?auto_9462 ) ) ( OBJ-AT ?auto_9461 ?auto_9459 ) ( not ( = ?auto_9461 ?auto_9460 ) ) ( OBJ-AT ?auto_9460 ?auto_9462 ) ( not ( = ?auto_9461 ?auto_9463 ) ) ( not ( = ?auto_9460 ?auto_9463 ) ) ( TRUCK-AT ?auto_9465 ?auto_9464 ) ( IN-CITY ?auto_9464 ?auto_9466 ) ( not ( = ?auto_9459 ?auto_9464 ) ) ( not ( = ?auto_9462 ?auto_9464 ) ) ( OBJ-AT ?auto_9463 ?auto_9464 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9461 ?auto_9460 ?auto_9459 )
      ( DELIVER-2PKG-VERIFY ?auto_9460 ?auto_9461 ?auto_9459 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9468 - OBJ
      ?auto_9469 - OBJ
      ?auto_9467 - LOCATION
    )
    :vars
    (
      ?auto_9470 - LOCATION
      ?auto_9474 - CITY
      ?auto_9473 - OBJ
      ?auto_9472 - TRUCK
      ?auto_9471 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9470 ?auto_9474 ) ( IN-CITY ?auto_9467 ?auto_9474 ) ( not ( = ?auto_9467 ?auto_9470 ) ) ( OBJ-AT ?auto_9473 ?auto_9467 ) ( not ( = ?auto_9473 ?auto_9468 ) ) ( OBJ-AT ?auto_9468 ?auto_9470 ) ( not ( = ?auto_9473 ?auto_9469 ) ) ( not ( = ?auto_9468 ?auto_9469 ) ) ( TRUCK-AT ?auto_9472 ?auto_9471 ) ( IN-CITY ?auto_9471 ?auto_9474 ) ( not ( = ?auto_9467 ?auto_9471 ) ) ( not ( = ?auto_9470 ?auto_9471 ) ) ( OBJ-AT ?auto_9469 ?auto_9471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9473 ?auto_9468 ?auto_9467 )
      ( DELIVER-2PKG-VERIFY ?auto_9468 ?auto_9469 ?auto_9467 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9485 - OBJ
      ?auto_9486 - OBJ
      ?auto_9487 - OBJ
      ?auto_9484 - LOCATION
    )
    :vars
    (
      ?auto_9488 - LOCATION
      ?auto_9492 - CITY
      ?auto_9489 - OBJ
      ?auto_9491 - TRUCK
      ?auto_9490 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9488 ?auto_9492 ) ( IN-CITY ?auto_9484 ?auto_9492 ) ( not ( = ?auto_9484 ?auto_9488 ) ) ( OBJ-AT ?auto_9486 ?auto_9484 ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( OBJ-AT ?auto_9487 ?auto_9488 ) ( not ( = ?auto_9486 ?auto_9489 ) ) ( not ( = ?auto_9487 ?auto_9489 ) ) ( TRUCK-AT ?auto_9491 ?auto_9490 ) ( IN-CITY ?auto_9490 ?auto_9492 ) ( not ( = ?auto_9484 ?auto_9490 ) ) ( not ( = ?auto_9488 ?auto_9490 ) ) ( OBJ-AT ?auto_9489 ?auto_9490 ) ( OBJ-AT ?auto_9485 ?auto_9484 ) ( not ( = ?auto_9485 ?auto_9486 ) ) ( not ( = ?auto_9485 ?auto_9487 ) ) ( not ( = ?auto_9485 ?auto_9489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9486 ?auto_9487 ?auto_9484 )
      ( DELIVER-3PKG-VERIFY ?auto_9485 ?auto_9486 ?auto_9487 ?auto_9484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9494 - OBJ
      ?auto_9495 - OBJ
      ?auto_9496 - OBJ
      ?auto_9493 - LOCATION
    )
    :vars
    (
      ?auto_9497 - LOCATION
      ?auto_9500 - CITY
      ?auto_9499 - TRUCK
      ?auto_9498 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9497 ?auto_9500 ) ( IN-CITY ?auto_9493 ?auto_9500 ) ( not ( = ?auto_9493 ?auto_9497 ) ) ( OBJ-AT ?auto_9494 ?auto_9493 ) ( not ( = ?auto_9494 ?auto_9496 ) ) ( OBJ-AT ?auto_9496 ?auto_9497 ) ( not ( = ?auto_9494 ?auto_9495 ) ) ( not ( = ?auto_9496 ?auto_9495 ) ) ( TRUCK-AT ?auto_9499 ?auto_9498 ) ( IN-CITY ?auto_9498 ?auto_9500 ) ( not ( = ?auto_9493 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( OBJ-AT ?auto_9495 ?auto_9498 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9494 ?auto_9496 ?auto_9493 )
      ( DELIVER-3PKG-VERIFY ?auto_9494 ?auto_9495 ?auto_9496 ?auto_9493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9502 - OBJ
      ?auto_9503 - OBJ
      ?auto_9504 - OBJ
      ?auto_9501 - LOCATION
    )
    :vars
    (
      ?auto_9505 - LOCATION
      ?auto_9509 - CITY
      ?auto_9506 - OBJ
      ?auto_9508 - TRUCK
      ?auto_9507 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9505 ?auto_9509 ) ( IN-CITY ?auto_9501 ?auto_9509 ) ( not ( = ?auto_9501 ?auto_9505 ) ) ( OBJ-AT ?auto_9504 ?auto_9501 ) ( not ( = ?auto_9504 ?auto_9503 ) ) ( OBJ-AT ?auto_9503 ?auto_9505 ) ( not ( = ?auto_9504 ?auto_9506 ) ) ( not ( = ?auto_9503 ?auto_9506 ) ) ( TRUCK-AT ?auto_9508 ?auto_9507 ) ( IN-CITY ?auto_9507 ?auto_9509 ) ( not ( = ?auto_9501 ?auto_9507 ) ) ( not ( = ?auto_9505 ?auto_9507 ) ) ( OBJ-AT ?auto_9506 ?auto_9507 ) ( OBJ-AT ?auto_9502 ?auto_9501 ) ( not ( = ?auto_9502 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9504 ) ) ( not ( = ?auto_9502 ?auto_9506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9504 ?auto_9503 ?auto_9501 )
      ( DELIVER-3PKG-VERIFY ?auto_9502 ?auto_9503 ?auto_9504 ?auto_9501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9511 - OBJ
      ?auto_9512 - OBJ
      ?auto_9513 - OBJ
      ?auto_9510 - LOCATION
    )
    :vars
    (
      ?auto_9514 - LOCATION
      ?auto_9517 - CITY
      ?auto_9516 - TRUCK
      ?auto_9515 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9514 ?auto_9517 ) ( IN-CITY ?auto_9510 ?auto_9517 ) ( not ( = ?auto_9510 ?auto_9514 ) ) ( OBJ-AT ?auto_9511 ?auto_9510 ) ( not ( = ?auto_9511 ?auto_9512 ) ) ( OBJ-AT ?auto_9512 ?auto_9514 ) ( not ( = ?auto_9511 ?auto_9513 ) ) ( not ( = ?auto_9512 ?auto_9513 ) ) ( TRUCK-AT ?auto_9516 ?auto_9515 ) ( IN-CITY ?auto_9515 ?auto_9517 ) ( not ( = ?auto_9510 ?auto_9515 ) ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( OBJ-AT ?auto_9513 ?auto_9515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9511 ?auto_9512 ?auto_9510 )
      ( DELIVER-3PKG-VERIFY ?auto_9511 ?auto_9512 ?auto_9513 ?auto_9510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9528 - OBJ
      ?auto_9529 - OBJ
      ?auto_9530 - OBJ
      ?auto_9527 - LOCATION
    )
    :vars
    (
      ?auto_9531 - LOCATION
      ?auto_9534 - CITY
      ?auto_9533 - TRUCK
      ?auto_9532 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9531 ?auto_9534 ) ( IN-CITY ?auto_9527 ?auto_9534 ) ( not ( = ?auto_9527 ?auto_9531 ) ) ( OBJ-AT ?auto_9529 ?auto_9527 ) ( not ( = ?auto_9529 ?auto_9530 ) ) ( OBJ-AT ?auto_9530 ?auto_9531 ) ( not ( = ?auto_9529 ?auto_9528 ) ) ( not ( = ?auto_9530 ?auto_9528 ) ) ( TRUCK-AT ?auto_9533 ?auto_9532 ) ( IN-CITY ?auto_9532 ?auto_9534 ) ( not ( = ?auto_9527 ?auto_9532 ) ) ( not ( = ?auto_9531 ?auto_9532 ) ) ( OBJ-AT ?auto_9528 ?auto_9532 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9529 ?auto_9530 ?auto_9527 )
      ( DELIVER-3PKG-VERIFY ?auto_9528 ?auto_9529 ?auto_9530 ?auto_9527 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9545 - OBJ
      ?auto_9546 - OBJ
      ?auto_9547 - OBJ
      ?auto_9544 - LOCATION
    )
    :vars
    (
      ?auto_9548 - LOCATION
      ?auto_9551 - CITY
      ?auto_9550 - TRUCK
      ?auto_9549 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9548 ?auto_9551 ) ( IN-CITY ?auto_9544 ?auto_9551 ) ( not ( = ?auto_9544 ?auto_9548 ) ) ( OBJ-AT ?auto_9547 ?auto_9544 ) ( not ( = ?auto_9547 ?auto_9546 ) ) ( OBJ-AT ?auto_9546 ?auto_9548 ) ( not ( = ?auto_9547 ?auto_9545 ) ) ( not ( = ?auto_9546 ?auto_9545 ) ) ( TRUCK-AT ?auto_9550 ?auto_9549 ) ( IN-CITY ?auto_9549 ?auto_9551 ) ( not ( = ?auto_9544 ?auto_9549 ) ) ( not ( = ?auto_9548 ?auto_9549 ) ) ( OBJ-AT ?auto_9545 ?auto_9549 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9547 ?auto_9546 ?auto_9544 )
      ( DELIVER-3PKG-VERIFY ?auto_9545 ?auto_9546 ?auto_9547 ?auto_9544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9571 - OBJ
      ?auto_9572 - OBJ
      ?auto_9573 - OBJ
      ?auto_9570 - LOCATION
    )
    :vars
    (
      ?auto_9574 - LOCATION
      ?auto_9578 - CITY
      ?auto_9575 - OBJ
      ?auto_9577 - TRUCK
      ?auto_9576 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9574 ?auto_9578 ) ( IN-CITY ?auto_9570 ?auto_9578 ) ( not ( = ?auto_9570 ?auto_9574 ) ) ( OBJ-AT ?auto_9573 ?auto_9570 ) ( not ( = ?auto_9573 ?auto_9571 ) ) ( OBJ-AT ?auto_9571 ?auto_9574 ) ( not ( = ?auto_9573 ?auto_9575 ) ) ( not ( = ?auto_9571 ?auto_9575 ) ) ( TRUCK-AT ?auto_9577 ?auto_9576 ) ( IN-CITY ?auto_9576 ?auto_9578 ) ( not ( = ?auto_9570 ?auto_9576 ) ) ( not ( = ?auto_9574 ?auto_9576 ) ) ( OBJ-AT ?auto_9575 ?auto_9576 ) ( OBJ-AT ?auto_9572 ?auto_9570 ) ( not ( = ?auto_9571 ?auto_9572 ) ) ( not ( = ?auto_9572 ?auto_9573 ) ) ( not ( = ?auto_9572 ?auto_9575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9573 ?auto_9571 ?auto_9570 )
      ( DELIVER-3PKG-VERIFY ?auto_9571 ?auto_9572 ?auto_9573 ?auto_9570 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9580 - OBJ
      ?auto_9581 - OBJ
      ?auto_9582 - OBJ
      ?auto_9579 - LOCATION
    )
    :vars
    (
      ?auto_9583 - LOCATION
      ?auto_9586 - CITY
      ?auto_9585 - TRUCK
      ?auto_9584 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9583 ?auto_9586 ) ( IN-CITY ?auto_9579 ?auto_9586 ) ( not ( = ?auto_9579 ?auto_9583 ) ) ( OBJ-AT ?auto_9581 ?auto_9579 ) ( not ( = ?auto_9581 ?auto_9580 ) ) ( OBJ-AT ?auto_9580 ?auto_9583 ) ( not ( = ?auto_9581 ?auto_9582 ) ) ( not ( = ?auto_9580 ?auto_9582 ) ) ( TRUCK-AT ?auto_9585 ?auto_9584 ) ( IN-CITY ?auto_9584 ?auto_9586 ) ( not ( = ?auto_9579 ?auto_9584 ) ) ( not ( = ?auto_9583 ?auto_9584 ) ) ( OBJ-AT ?auto_9582 ?auto_9584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9581 ?auto_9580 ?auto_9579 )
      ( DELIVER-3PKG-VERIFY ?auto_9580 ?auto_9581 ?auto_9582 ?auto_9579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9597 - OBJ
      ?auto_9598 - OBJ
      ?auto_9599 - OBJ
      ?auto_9596 - LOCATION
    )
    :vars
    (
      ?auto_9600 - LOCATION
      ?auto_9603 - CITY
      ?auto_9602 - TRUCK
      ?auto_9601 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9600 ?auto_9603 ) ( IN-CITY ?auto_9596 ?auto_9603 ) ( not ( = ?auto_9596 ?auto_9600 ) ) ( OBJ-AT ?auto_9599 ?auto_9596 ) ( not ( = ?auto_9599 ?auto_9597 ) ) ( OBJ-AT ?auto_9597 ?auto_9600 ) ( not ( = ?auto_9599 ?auto_9598 ) ) ( not ( = ?auto_9597 ?auto_9598 ) ) ( TRUCK-AT ?auto_9602 ?auto_9601 ) ( IN-CITY ?auto_9601 ?auto_9603 ) ( not ( = ?auto_9596 ?auto_9601 ) ) ( not ( = ?auto_9600 ?auto_9601 ) ) ( OBJ-AT ?auto_9598 ?auto_9601 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9599 ?auto_9597 ?auto_9596 )
      ( DELIVER-3PKG-VERIFY ?auto_9597 ?auto_9598 ?auto_9599 ?auto_9596 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9651 - OBJ
      ?auto_9650 - LOCATION
    )
    :vars
    (
      ?auto_9652 - LOCATION
      ?auto_9657 - CITY
      ?auto_9656 - OBJ
      ?auto_9653 - OBJ
      ?auto_9654 - LOCATION
      ?auto_9655 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9652 ?auto_9657 ) ( IN-CITY ?auto_9650 ?auto_9657 ) ( not ( = ?auto_9650 ?auto_9652 ) ) ( OBJ-AT ?auto_9656 ?auto_9650 ) ( not ( = ?auto_9656 ?auto_9651 ) ) ( OBJ-AT ?auto_9651 ?auto_9652 ) ( not ( = ?auto_9656 ?auto_9653 ) ) ( not ( = ?auto_9651 ?auto_9653 ) ) ( IN-CITY ?auto_9654 ?auto_9657 ) ( not ( = ?auto_9650 ?auto_9654 ) ) ( not ( = ?auto_9652 ?auto_9654 ) ) ( OBJ-AT ?auto_9653 ?auto_9654 ) ( TRUCK-AT ?auto_9655 ?auto_9650 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9655 ?auto_9650 ?auto_9654 ?auto_9657 )
      ( DELIVER-2PKG ?auto_9656 ?auto_9651 ?auto_9650 )
      ( DELIVER-1PKG-VERIFY ?auto_9651 ?auto_9650 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9659 - OBJ
      ?auto_9660 - OBJ
      ?auto_9658 - LOCATION
    )
    :vars
    (
      ?auto_9662 - LOCATION
      ?auto_9665 - CITY
      ?auto_9664 - OBJ
      ?auto_9661 - LOCATION
      ?auto_9663 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9662 ?auto_9665 ) ( IN-CITY ?auto_9658 ?auto_9665 ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( OBJ-AT ?auto_9659 ?auto_9658 ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( OBJ-AT ?auto_9660 ?auto_9662 ) ( not ( = ?auto_9659 ?auto_9664 ) ) ( not ( = ?auto_9660 ?auto_9664 ) ) ( IN-CITY ?auto_9661 ?auto_9665 ) ( not ( = ?auto_9658 ?auto_9661 ) ) ( not ( = ?auto_9662 ?auto_9661 ) ) ( OBJ-AT ?auto_9664 ?auto_9661 ) ( TRUCK-AT ?auto_9663 ?auto_9658 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9660 ?auto_9658 )
      ( DELIVER-2PKG-VERIFY ?auto_9659 ?auto_9660 ?auto_9658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9667 - OBJ
      ?auto_9668 - OBJ
      ?auto_9666 - LOCATION
    )
    :vars
    (
      ?auto_9671 - LOCATION
      ?auto_9670 - CITY
      ?auto_9673 - OBJ
      ?auto_9669 - LOCATION
      ?auto_9672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9671 ?auto_9670 ) ( IN-CITY ?auto_9666 ?auto_9670 ) ( not ( = ?auto_9666 ?auto_9671 ) ) ( OBJ-AT ?auto_9673 ?auto_9666 ) ( not ( = ?auto_9673 ?auto_9668 ) ) ( OBJ-AT ?auto_9668 ?auto_9671 ) ( not ( = ?auto_9673 ?auto_9667 ) ) ( not ( = ?auto_9668 ?auto_9667 ) ) ( IN-CITY ?auto_9669 ?auto_9670 ) ( not ( = ?auto_9666 ?auto_9669 ) ) ( not ( = ?auto_9671 ?auto_9669 ) ) ( OBJ-AT ?auto_9667 ?auto_9669 ) ( TRUCK-AT ?auto_9672 ?auto_9666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9673 ?auto_9668 ?auto_9666 )
      ( DELIVER-2PKG-VERIFY ?auto_9667 ?auto_9668 ?auto_9666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9675 - OBJ
      ?auto_9676 - OBJ
      ?auto_9674 - LOCATION
    )
    :vars
    (
      ?auto_9679 - LOCATION
      ?auto_9678 - CITY
      ?auto_9680 - OBJ
      ?auto_9677 - LOCATION
      ?auto_9681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9679 ?auto_9678 ) ( IN-CITY ?auto_9674 ?auto_9678 ) ( not ( = ?auto_9674 ?auto_9679 ) ) ( OBJ-AT ?auto_9676 ?auto_9674 ) ( not ( = ?auto_9676 ?auto_9675 ) ) ( OBJ-AT ?auto_9675 ?auto_9679 ) ( not ( = ?auto_9676 ?auto_9680 ) ) ( not ( = ?auto_9675 ?auto_9680 ) ) ( IN-CITY ?auto_9677 ?auto_9678 ) ( not ( = ?auto_9674 ?auto_9677 ) ) ( not ( = ?auto_9679 ?auto_9677 ) ) ( OBJ-AT ?auto_9680 ?auto_9677 ) ( TRUCK-AT ?auto_9681 ?auto_9674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9676 ?auto_9675 ?auto_9674 )
      ( DELIVER-2PKG-VERIFY ?auto_9675 ?auto_9676 ?auto_9674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9683 - OBJ
      ?auto_9684 - OBJ
      ?auto_9682 - LOCATION
    )
    :vars
    (
      ?auto_9687 - LOCATION
      ?auto_9686 - CITY
      ?auto_9689 - OBJ
      ?auto_9685 - LOCATION
      ?auto_9688 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9687 ?auto_9686 ) ( IN-CITY ?auto_9682 ?auto_9686 ) ( not ( = ?auto_9682 ?auto_9687 ) ) ( OBJ-AT ?auto_9689 ?auto_9682 ) ( not ( = ?auto_9689 ?auto_9683 ) ) ( OBJ-AT ?auto_9683 ?auto_9687 ) ( not ( = ?auto_9689 ?auto_9684 ) ) ( not ( = ?auto_9683 ?auto_9684 ) ) ( IN-CITY ?auto_9685 ?auto_9686 ) ( not ( = ?auto_9682 ?auto_9685 ) ) ( not ( = ?auto_9687 ?auto_9685 ) ) ( OBJ-AT ?auto_9684 ?auto_9685 ) ( TRUCK-AT ?auto_9688 ?auto_9682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9689 ?auto_9683 ?auto_9682 )
      ( DELIVER-2PKG-VERIFY ?auto_9683 ?auto_9684 ?auto_9682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9700 - OBJ
      ?auto_9701 - OBJ
      ?auto_9702 - OBJ
      ?auto_9699 - LOCATION
    )
    :vars
    (
      ?auto_9705 - LOCATION
      ?auto_9704 - CITY
      ?auto_9706 - OBJ
      ?auto_9703 - LOCATION
      ?auto_9707 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9705 ?auto_9704 ) ( IN-CITY ?auto_9699 ?auto_9704 ) ( not ( = ?auto_9699 ?auto_9705 ) ) ( OBJ-AT ?auto_9701 ?auto_9699 ) ( not ( = ?auto_9701 ?auto_9702 ) ) ( OBJ-AT ?auto_9702 ?auto_9705 ) ( not ( = ?auto_9701 ?auto_9706 ) ) ( not ( = ?auto_9702 ?auto_9706 ) ) ( IN-CITY ?auto_9703 ?auto_9704 ) ( not ( = ?auto_9699 ?auto_9703 ) ) ( not ( = ?auto_9705 ?auto_9703 ) ) ( OBJ-AT ?auto_9706 ?auto_9703 ) ( TRUCK-AT ?auto_9707 ?auto_9699 ) ( OBJ-AT ?auto_9700 ?auto_9699 ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( not ( = ?auto_9700 ?auto_9702 ) ) ( not ( = ?auto_9700 ?auto_9706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9701 ?auto_9702 ?auto_9699 )
      ( DELIVER-3PKG-VERIFY ?auto_9700 ?auto_9701 ?auto_9702 ?auto_9699 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9709 - OBJ
      ?auto_9710 - OBJ
      ?auto_9711 - OBJ
      ?auto_9708 - LOCATION
    )
    :vars
    (
      ?auto_9714 - LOCATION
      ?auto_9713 - CITY
      ?auto_9712 - LOCATION
      ?auto_9715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9714 ?auto_9713 ) ( IN-CITY ?auto_9708 ?auto_9713 ) ( not ( = ?auto_9708 ?auto_9714 ) ) ( OBJ-AT ?auto_9709 ?auto_9708 ) ( not ( = ?auto_9709 ?auto_9711 ) ) ( OBJ-AT ?auto_9711 ?auto_9714 ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( not ( = ?auto_9711 ?auto_9710 ) ) ( IN-CITY ?auto_9712 ?auto_9713 ) ( not ( = ?auto_9708 ?auto_9712 ) ) ( not ( = ?auto_9714 ?auto_9712 ) ) ( OBJ-AT ?auto_9710 ?auto_9712 ) ( TRUCK-AT ?auto_9715 ?auto_9708 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9709 ?auto_9711 ?auto_9708 )
      ( DELIVER-3PKG-VERIFY ?auto_9709 ?auto_9710 ?auto_9711 ?auto_9708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9717 - OBJ
      ?auto_9718 - OBJ
      ?auto_9719 - OBJ
      ?auto_9716 - LOCATION
    )
    :vars
    (
      ?auto_9722 - LOCATION
      ?auto_9721 - CITY
      ?auto_9723 - OBJ
      ?auto_9720 - LOCATION
      ?auto_9724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9722 ?auto_9721 ) ( IN-CITY ?auto_9716 ?auto_9721 ) ( not ( = ?auto_9716 ?auto_9722 ) ) ( OBJ-AT ?auto_9719 ?auto_9716 ) ( not ( = ?auto_9719 ?auto_9718 ) ) ( OBJ-AT ?auto_9718 ?auto_9722 ) ( not ( = ?auto_9719 ?auto_9723 ) ) ( not ( = ?auto_9718 ?auto_9723 ) ) ( IN-CITY ?auto_9720 ?auto_9721 ) ( not ( = ?auto_9716 ?auto_9720 ) ) ( not ( = ?auto_9722 ?auto_9720 ) ) ( OBJ-AT ?auto_9723 ?auto_9720 ) ( TRUCK-AT ?auto_9724 ?auto_9716 ) ( OBJ-AT ?auto_9717 ?auto_9716 ) ( not ( = ?auto_9717 ?auto_9718 ) ) ( not ( = ?auto_9717 ?auto_9719 ) ) ( not ( = ?auto_9717 ?auto_9723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9719 ?auto_9718 ?auto_9716 )
      ( DELIVER-3PKG-VERIFY ?auto_9717 ?auto_9718 ?auto_9719 ?auto_9716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9726 - OBJ
      ?auto_9727 - OBJ
      ?auto_9728 - OBJ
      ?auto_9725 - LOCATION
    )
    :vars
    (
      ?auto_9731 - LOCATION
      ?auto_9730 - CITY
      ?auto_9729 - LOCATION
      ?auto_9732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9731 ?auto_9730 ) ( IN-CITY ?auto_9725 ?auto_9730 ) ( not ( = ?auto_9725 ?auto_9731 ) ) ( OBJ-AT ?auto_9726 ?auto_9725 ) ( not ( = ?auto_9726 ?auto_9727 ) ) ( OBJ-AT ?auto_9727 ?auto_9731 ) ( not ( = ?auto_9726 ?auto_9728 ) ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( IN-CITY ?auto_9729 ?auto_9730 ) ( not ( = ?auto_9725 ?auto_9729 ) ) ( not ( = ?auto_9731 ?auto_9729 ) ) ( OBJ-AT ?auto_9728 ?auto_9729 ) ( TRUCK-AT ?auto_9732 ?auto_9725 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9726 ?auto_9727 ?auto_9725 )
      ( DELIVER-3PKG-VERIFY ?auto_9726 ?auto_9727 ?auto_9728 ?auto_9725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9743 - OBJ
      ?auto_9744 - OBJ
      ?auto_9745 - OBJ
      ?auto_9742 - LOCATION
    )
    :vars
    (
      ?auto_9748 - LOCATION
      ?auto_9747 - CITY
      ?auto_9746 - LOCATION
      ?auto_9749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9748 ?auto_9747 ) ( IN-CITY ?auto_9742 ?auto_9747 ) ( not ( = ?auto_9742 ?auto_9748 ) ) ( OBJ-AT ?auto_9744 ?auto_9742 ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( OBJ-AT ?auto_9745 ?auto_9748 ) ( not ( = ?auto_9744 ?auto_9743 ) ) ( not ( = ?auto_9745 ?auto_9743 ) ) ( IN-CITY ?auto_9746 ?auto_9747 ) ( not ( = ?auto_9742 ?auto_9746 ) ) ( not ( = ?auto_9748 ?auto_9746 ) ) ( OBJ-AT ?auto_9743 ?auto_9746 ) ( TRUCK-AT ?auto_9749 ?auto_9742 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9744 ?auto_9745 ?auto_9742 )
      ( DELIVER-3PKG-VERIFY ?auto_9743 ?auto_9744 ?auto_9745 ?auto_9742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9760 - OBJ
      ?auto_9761 - OBJ
      ?auto_9762 - OBJ
      ?auto_9759 - LOCATION
    )
    :vars
    (
      ?auto_9765 - LOCATION
      ?auto_9764 - CITY
      ?auto_9763 - LOCATION
      ?auto_9766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9765 ?auto_9764 ) ( IN-CITY ?auto_9759 ?auto_9764 ) ( not ( = ?auto_9759 ?auto_9765 ) ) ( OBJ-AT ?auto_9762 ?auto_9759 ) ( not ( = ?auto_9762 ?auto_9761 ) ) ( OBJ-AT ?auto_9761 ?auto_9765 ) ( not ( = ?auto_9762 ?auto_9760 ) ) ( not ( = ?auto_9761 ?auto_9760 ) ) ( IN-CITY ?auto_9763 ?auto_9764 ) ( not ( = ?auto_9759 ?auto_9763 ) ) ( not ( = ?auto_9765 ?auto_9763 ) ) ( OBJ-AT ?auto_9760 ?auto_9763 ) ( TRUCK-AT ?auto_9766 ?auto_9759 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9762 ?auto_9761 ?auto_9759 )
      ( DELIVER-3PKG-VERIFY ?auto_9760 ?auto_9761 ?auto_9762 ?auto_9759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9786 - OBJ
      ?auto_9787 - OBJ
      ?auto_9788 - OBJ
      ?auto_9785 - LOCATION
    )
    :vars
    (
      ?auto_9791 - LOCATION
      ?auto_9790 - CITY
      ?auto_9792 - OBJ
      ?auto_9789 - LOCATION
      ?auto_9793 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9791 ?auto_9790 ) ( IN-CITY ?auto_9785 ?auto_9790 ) ( not ( = ?auto_9785 ?auto_9791 ) ) ( OBJ-AT ?auto_9788 ?auto_9785 ) ( not ( = ?auto_9788 ?auto_9786 ) ) ( OBJ-AT ?auto_9786 ?auto_9791 ) ( not ( = ?auto_9788 ?auto_9792 ) ) ( not ( = ?auto_9786 ?auto_9792 ) ) ( IN-CITY ?auto_9789 ?auto_9790 ) ( not ( = ?auto_9785 ?auto_9789 ) ) ( not ( = ?auto_9791 ?auto_9789 ) ) ( OBJ-AT ?auto_9792 ?auto_9789 ) ( TRUCK-AT ?auto_9793 ?auto_9785 ) ( OBJ-AT ?auto_9787 ?auto_9785 ) ( not ( = ?auto_9786 ?auto_9787 ) ) ( not ( = ?auto_9787 ?auto_9788 ) ) ( not ( = ?auto_9787 ?auto_9792 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9788 ?auto_9786 ?auto_9785 )
      ( DELIVER-3PKG-VERIFY ?auto_9786 ?auto_9787 ?auto_9788 ?auto_9785 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9795 - OBJ
      ?auto_9796 - OBJ
      ?auto_9797 - OBJ
      ?auto_9794 - LOCATION
    )
    :vars
    (
      ?auto_9800 - LOCATION
      ?auto_9799 - CITY
      ?auto_9798 - LOCATION
      ?auto_9801 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9800 ?auto_9799 ) ( IN-CITY ?auto_9794 ?auto_9799 ) ( not ( = ?auto_9794 ?auto_9800 ) ) ( OBJ-AT ?auto_9796 ?auto_9794 ) ( not ( = ?auto_9796 ?auto_9795 ) ) ( OBJ-AT ?auto_9795 ?auto_9800 ) ( not ( = ?auto_9796 ?auto_9797 ) ) ( not ( = ?auto_9795 ?auto_9797 ) ) ( IN-CITY ?auto_9798 ?auto_9799 ) ( not ( = ?auto_9794 ?auto_9798 ) ) ( not ( = ?auto_9800 ?auto_9798 ) ) ( OBJ-AT ?auto_9797 ?auto_9798 ) ( TRUCK-AT ?auto_9801 ?auto_9794 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9796 ?auto_9795 ?auto_9794 )
      ( DELIVER-3PKG-VERIFY ?auto_9795 ?auto_9796 ?auto_9797 ?auto_9794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9812 - OBJ
      ?auto_9813 - OBJ
      ?auto_9814 - OBJ
      ?auto_9811 - LOCATION
    )
    :vars
    (
      ?auto_9817 - LOCATION
      ?auto_9816 - CITY
      ?auto_9815 - LOCATION
      ?auto_9818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9817 ?auto_9816 ) ( IN-CITY ?auto_9811 ?auto_9816 ) ( not ( = ?auto_9811 ?auto_9817 ) ) ( OBJ-AT ?auto_9814 ?auto_9811 ) ( not ( = ?auto_9814 ?auto_9812 ) ) ( OBJ-AT ?auto_9812 ?auto_9817 ) ( not ( = ?auto_9814 ?auto_9813 ) ) ( not ( = ?auto_9812 ?auto_9813 ) ) ( IN-CITY ?auto_9815 ?auto_9816 ) ( not ( = ?auto_9811 ?auto_9815 ) ) ( not ( = ?auto_9817 ?auto_9815 ) ) ( OBJ-AT ?auto_9813 ?auto_9815 ) ( TRUCK-AT ?auto_9818 ?auto_9811 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9814 ?auto_9812 ?auto_9811 )
      ( DELIVER-3PKG-VERIFY ?auto_9812 ?auto_9813 ?auto_9814 ?auto_9811 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9866 - OBJ
      ?auto_9865 - LOCATION
    )
    :vars
    (
      ?auto_9869 - LOCATION
      ?auto_9868 - CITY
      ?auto_9872 - OBJ
      ?auto_9870 - OBJ
      ?auto_9867 - LOCATION
      ?auto_9871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9869 ?auto_9868 ) ( IN-CITY ?auto_9865 ?auto_9868 ) ( not ( = ?auto_9865 ?auto_9869 ) ) ( not ( = ?auto_9872 ?auto_9866 ) ) ( OBJ-AT ?auto_9866 ?auto_9869 ) ( not ( = ?auto_9872 ?auto_9870 ) ) ( not ( = ?auto_9866 ?auto_9870 ) ) ( IN-CITY ?auto_9867 ?auto_9868 ) ( not ( = ?auto_9865 ?auto_9867 ) ) ( not ( = ?auto_9869 ?auto_9867 ) ) ( OBJ-AT ?auto_9870 ?auto_9867 ) ( TRUCK-AT ?auto_9871 ?auto_9865 ) ( IN-TRUCK ?auto_9872 ?auto_9871 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9872 ?auto_9865 )
      ( DELIVER-2PKG ?auto_9872 ?auto_9866 ?auto_9865 )
      ( DELIVER-1PKG-VERIFY ?auto_9866 ?auto_9865 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9874 - OBJ
      ?auto_9875 - OBJ
      ?auto_9873 - LOCATION
    )
    :vars
    (
      ?auto_9877 - LOCATION
      ?auto_9876 - CITY
      ?auto_9878 - OBJ
      ?auto_9879 - LOCATION
      ?auto_9880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9877 ?auto_9876 ) ( IN-CITY ?auto_9873 ?auto_9876 ) ( not ( = ?auto_9873 ?auto_9877 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( OBJ-AT ?auto_9875 ?auto_9877 ) ( not ( = ?auto_9874 ?auto_9878 ) ) ( not ( = ?auto_9875 ?auto_9878 ) ) ( IN-CITY ?auto_9879 ?auto_9876 ) ( not ( = ?auto_9873 ?auto_9879 ) ) ( not ( = ?auto_9877 ?auto_9879 ) ) ( OBJ-AT ?auto_9878 ?auto_9879 ) ( TRUCK-AT ?auto_9880 ?auto_9873 ) ( IN-TRUCK ?auto_9874 ?auto_9880 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9875 ?auto_9873 )
      ( DELIVER-2PKG-VERIFY ?auto_9874 ?auto_9875 ?auto_9873 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9882 - OBJ
      ?auto_9883 - OBJ
      ?auto_9881 - LOCATION
    )
    :vars
    (
      ?auto_9886 - LOCATION
      ?auto_9887 - CITY
      ?auto_9888 - OBJ
      ?auto_9885 - LOCATION
      ?auto_9884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9886 ?auto_9887 ) ( IN-CITY ?auto_9881 ?auto_9887 ) ( not ( = ?auto_9881 ?auto_9886 ) ) ( not ( = ?auto_9888 ?auto_9883 ) ) ( OBJ-AT ?auto_9883 ?auto_9886 ) ( not ( = ?auto_9888 ?auto_9882 ) ) ( not ( = ?auto_9883 ?auto_9882 ) ) ( IN-CITY ?auto_9885 ?auto_9887 ) ( not ( = ?auto_9881 ?auto_9885 ) ) ( not ( = ?auto_9886 ?auto_9885 ) ) ( OBJ-AT ?auto_9882 ?auto_9885 ) ( TRUCK-AT ?auto_9884 ?auto_9881 ) ( IN-TRUCK ?auto_9888 ?auto_9884 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9888 ?auto_9883 ?auto_9881 )
      ( DELIVER-2PKG-VERIFY ?auto_9882 ?auto_9883 ?auto_9881 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9890 - OBJ
      ?auto_9891 - OBJ
      ?auto_9889 - LOCATION
    )
    :vars
    (
      ?auto_9895 - LOCATION
      ?auto_9896 - CITY
      ?auto_9894 - OBJ
      ?auto_9893 - LOCATION
      ?auto_9892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9895 ?auto_9896 ) ( IN-CITY ?auto_9889 ?auto_9896 ) ( not ( = ?auto_9889 ?auto_9895 ) ) ( not ( = ?auto_9891 ?auto_9890 ) ) ( OBJ-AT ?auto_9890 ?auto_9895 ) ( not ( = ?auto_9891 ?auto_9894 ) ) ( not ( = ?auto_9890 ?auto_9894 ) ) ( IN-CITY ?auto_9893 ?auto_9896 ) ( not ( = ?auto_9889 ?auto_9893 ) ) ( not ( = ?auto_9895 ?auto_9893 ) ) ( OBJ-AT ?auto_9894 ?auto_9893 ) ( TRUCK-AT ?auto_9892 ?auto_9889 ) ( IN-TRUCK ?auto_9891 ?auto_9892 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9891 ?auto_9890 ?auto_9889 )
      ( DELIVER-2PKG-VERIFY ?auto_9890 ?auto_9891 ?auto_9889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9898 - OBJ
      ?auto_9899 - OBJ
      ?auto_9897 - LOCATION
    )
    :vars
    (
      ?auto_9902 - LOCATION
      ?auto_9903 - CITY
      ?auto_9904 - OBJ
      ?auto_9901 - LOCATION
      ?auto_9900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9902 ?auto_9903 ) ( IN-CITY ?auto_9897 ?auto_9903 ) ( not ( = ?auto_9897 ?auto_9902 ) ) ( not ( = ?auto_9904 ?auto_9898 ) ) ( OBJ-AT ?auto_9898 ?auto_9902 ) ( not ( = ?auto_9904 ?auto_9899 ) ) ( not ( = ?auto_9898 ?auto_9899 ) ) ( IN-CITY ?auto_9901 ?auto_9903 ) ( not ( = ?auto_9897 ?auto_9901 ) ) ( not ( = ?auto_9902 ?auto_9901 ) ) ( OBJ-AT ?auto_9899 ?auto_9901 ) ( TRUCK-AT ?auto_9900 ?auto_9897 ) ( IN-TRUCK ?auto_9904 ?auto_9900 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9904 ?auto_9898 ?auto_9897 )
      ( DELIVER-2PKG-VERIFY ?auto_9898 ?auto_9899 ?auto_9897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9924 - OBJ
      ?auto_9925 - OBJ
      ?auto_9926 - OBJ
      ?auto_9923 - LOCATION
    )
    :vars
    (
      ?auto_9929 - LOCATION
      ?auto_9930 - CITY
      ?auto_9928 - LOCATION
      ?auto_9927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9929 ?auto_9930 ) ( IN-CITY ?auto_9923 ?auto_9930 ) ( not ( = ?auto_9923 ?auto_9929 ) ) ( not ( = ?auto_9924 ?auto_9926 ) ) ( OBJ-AT ?auto_9926 ?auto_9929 ) ( not ( = ?auto_9924 ?auto_9925 ) ) ( not ( = ?auto_9926 ?auto_9925 ) ) ( IN-CITY ?auto_9928 ?auto_9930 ) ( not ( = ?auto_9923 ?auto_9928 ) ) ( not ( = ?auto_9929 ?auto_9928 ) ) ( OBJ-AT ?auto_9925 ?auto_9928 ) ( TRUCK-AT ?auto_9927 ?auto_9923 ) ( IN-TRUCK ?auto_9924 ?auto_9927 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9924 ?auto_9926 ?auto_9923 )
      ( DELIVER-3PKG-VERIFY ?auto_9924 ?auto_9925 ?auto_9926 ?auto_9923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9941 - OBJ
      ?auto_9942 - OBJ
      ?auto_9943 - OBJ
      ?auto_9940 - LOCATION
    )
    :vars
    (
      ?auto_9946 - LOCATION
      ?auto_9947 - CITY
      ?auto_9945 - LOCATION
      ?auto_9944 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9946 ?auto_9947 ) ( IN-CITY ?auto_9940 ?auto_9947 ) ( not ( = ?auto_9940 ?auto_9946 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) ( OBJ-AT ?auto_9942 ?auto_9946 ) ( not ( = ?auto_9941 ?auto_9943 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) ( IN-CITY ?auto_9945 ?auto_9947 ) ( not ( = ?auto_9940 ?auto_9945 ) ) ( not ( = ?auto_9946 ?auto_9945 ) ) ( OBJ-AT ?auto_9943 ?auto_9945 ) ( TRUCK-AT ?auto_9944 ?auto_9940 ) ( IN-TRUCK ?auto_9941 ?auto_9944 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9941 ?auto_9942 ?auto_9940 )
      ( DELIVER-3PKG-VERIFY ?auto_9941 ?auto_9942 ?auto_9943 ?auto_9940 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9958 - OBJ
      ?auto_9959 - OBJ
      ?auto_9960 - OBJ
      ?auto_9957 - LOCATION
    )
    :vars
    (
      ?auto_9963 - LOCATION
      ?auto_9964 - CITY
      ?auto_9962 - LOCATION
      ?auto_9961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9963 ?auto_9964 ) ( IN-CITY ?auto_9957 ?auto_9964 ) ( not ( = ?auto_9957 ?auto_9963 ) ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( OBJ-AT ?auto_9960 ?auto_9963 ) ( not ( = ?auto_9959 ?auto_9958 ) ) ( not ( = ?auto_9960 ?auto_9958 ) ) ( IN-CITY ?auto_9962 ?auto_9964 ) ( not ( = ?auto_9957 ?auto_9962 ) ) ( not ( = ?auto_9963 ?auto_9962 ) ) ( OBJ-AT ?auto_9958 ?auto_9962 ) ( TRUCK-AT ?auto_9961 ?auto_9957 ) ( IN-TRUCK ?auto_9959 ?auto_9961 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9959 ?auto_9960 ?auto_9957 )
      ( DELIVER-3PKG-VERIFY ?auto_9958 ?auto_9959 ?auto_9960 ?auto_9957 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9975 - OBJ
      ?auto_9976 - OBJ
      ?auto_9977 - OBJ
      ?auto_9974 - LOCATION
    )
    :vars
    (
      ?auto_9980 - LOCATION
      ?auto_9981 - CITY
      ?auto_9979 - LOCATION
      ?auto_9978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9980 ?auto_9981 ) ( IN-CITY ?auto_9974 ?auto_9981 ) ( not ( = ?auto_9974 ?auto_9980 ) ) ( not ( = ?auto_9977 ?auto_9976 ) ) ( OBJ-AT ?auto_9976 ?auto_9980 ) ( not ( = ?auto_9977 ?auto_9975 ) ) ( not ( = ?auto_9976 ?auto_9975 ) ) ( IN-CITY ?auto_9979 ?auto_9981 ) ( not ( = ?auto_9974 ?auto_9979 ) ) ( not ( = ?auto_9980 ?auto_9979 ) ) ( OBJ-AT ?auto_9975 ?auto_9979 ) ( TRUCK-AT ?auto_9978 ?auto_9974 ) ( IN-TRUCK ?auto_9977 ?auto_9978 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9977 ?auto_9976 ?auto_9974 )
      ( DELIVER-3PKG-VERIFY ?auto_9975 ?auto_9976 ?auto_9977 ?auto_9974 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10010 - OBJ
      ?auto_10011 - OBJ
      ?auto_10012 - OBJ
      ?auto_10009 - LOCATION
    )
    :vars
    (
      ?auto_10015 - LOCATION
      ?auto_10016 - CITY
      ?auto_10014 - LOCATION
      ?auto_10013 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10015 ?auto_10016 ) ( IN-CITY ?auto_10009 ?auto_10016 ) ( not ( = ?auto_10009 ?auto_10015 ) ) ( not ( = ?auto_10011 ?auto_10010 ) ) ( OBJ-AT ?auto_10010 ?auto_10015 ) ( not ( = ?auto_10011 ?auto_10012 ) ) ( not ( = ?auto_10010 ?auto_10012 ) ) ( IN-CITY ?auto_10014 ?auto_10016 ) ( not ( = ?auto_10009 ?auto_10014 ) ) ( not ( = ?auto_10015 ?auto_10014 ) ) ( OBJ-AT ?auto_10012 ?auto_10014 ) ( TRUCK-AT ?auto_10013 ?auto_10009 ) ( IN-TRUCK ?auto_10011 ?auto_10013 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10011 ?auto_10010 ?auto_10009 )
      ( DELIVER-3PKG-VERIFY ?auto_10010 ?auto_10011 ?auto_10012 ?auto_10009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10027 - OBJ
      ?auto_10028 - OBJ
      ?auto_10029 - OBJ
      ?auto_10026 - LOCATION
    )
    :vars
    (
      ?auto_10032 - LOCATION
      ?auto_10033 - CITY
      ?auto_10031 - LOCATION
      ?auto_10030 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10032 ?auto_10033 ) ( IN-CITY ?auto_10026 ?auto_10033 ) ( not ( = ?auto_10026 ?auto_10032 ) ) ( not ( = ?auto_10029 ?auto_10027 ) ) ( OBJ-AT ?auto_10027 ?auto_10032 ) ( not ( = ?auto_10029 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( IN-CITY ?auto_10031 ?auto_10033 ) ( not ( = ?auto_10026 ?auto_10031 ) ) ( not ( = ?auto_10032 ?auto_10031 ) ) ( OBJ-AT ?auto_10028 ?auto_10031 ) ( TRUCK-AT ?auto_10030 ?auto_10026 ) ( IN-TRUCK ?auto_10029 ?auto_10030 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10029 ?auto_10027 ?auto_10026 )
      ( DELIVER-3PKG-VERIFY ?auto_10027 ?auto_10028 ?auto_10029 ?auto_10026 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10081 - OBJ
      ?auto_10080 - LOCATION
    )
    :vars
    (
      ?auto_10085 - LOCATION
      ?auto_10086 - CITY
      ?auto_10087 - OBJ
      ?auto_10084 - OBJ
      ?auto_10083 - LOCATION
      ?auto_10082 - TRUCK
      ?auto_10088 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10085 ?auto_10086 ) ( IN-CITY ?auto_10080 ?auto_10086 ) ( not ( = ?auto_10080 ?auto_10085 ) ) ( not ( = ?auto_10087 ?auto_10081 ) ) ( OBJ-AT ?auto_10081 ?auto_10085 ) ( not ( = ?auto_10087 ?auto_10084 ) ) ( not ( = ?auto_10081 ?auto_10084 ) ) ( IN-CITY ?auto_10083 ?auto_10086 ) ( not ( = ?auto_10080 ?auto_10083 ) ) ( not ( = ?auto_10085 ?auto_10083 ) ) ( OBJ-AT ?auto_10084 ?auto_10083 ) ( IN-TRUCK ?auto_10087 ?auto_10082 ) ( TRUCK-AT ?auto_10082 ?auto_10088 ) ( IN-CITY ?auto_10088 ?auto_10086 ) ( not ( = ?auto_10080 ?auto_10088 ) ) ( not ( = ?auto_10085 ?auto_10088 ) ) ( not ( = ?auto_10083 ?auto_10088 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10082 ?auto_10088 ?auto_10080 ?auto_10086 )
      ( DELIVER-2PKG ?auto_10087 ?auto_10081 ?auto_10080 )
      ( DELIVER-1PKG-VERIFY ?auto_10081 ?auto_10080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10090 - OBJ
      ?auto_10091 - OBJ
      ?auto_10089 - LOCATION
    )
    :vars
    (
      ?auto_10097 - LOCATION
      ?auto_10094 - CITY
      ?auto_10092 - OBJ
      ?auto_10096 - LOCATION
      ?auto_10093 - TRUCK
      ?auto_10095 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10097 ?auto_10094 ) ( IN-CITY ?auto_10089 ?auto_10094 ) ( not ( = ?auto_10089 ?auto_10097 ) ) ( not ( = ?auto_10090 ?auto_10091 ) ) ( OBJ-AT ?auto_10091 ?auto_10097 ) ( not ( = ?auto_10090 ?auto_10092 ) ) ( not ( = ?auto_10091 ?auto_10092 ) ) ( IN-CITY ?auto_10096 ?auto_10094 ) ( not ( = ?auto_10089 ?auto_10096 ) ) ( not ( = ?auto_10097 ?auto_10096 ) ) ( OBJ-AT ?auto_10092 ?auto_10096 ) ( IN-TRUCK ?auto_10090 ?auto_10093 ) ( TRUCK-AT ?auto_10093 ?auto_10095 ) ( IN-CITY ?auto_10095 ?auto_10094 ) ( not ( = ?auto_10089 ?auto_10095 ) ) ( not ( = ?auto_10097 ?auto_10095 ) ) ( not ( = ?auto_10096 ?auto_10095 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10091 ?auto_10089 )
      ( DELIVER-2PKG-VERIFY ?auto_10090 ?auto_10091 ?auto_10089 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10099 - OBJ
      ?auto_10100 - OBJ
      ?auto_10098 - LOCATION
    )
    :vars
    (
      ?auto_10103 - LOCATION
      ?auto_10105 - CITY
      ?auto_10106 - OBJ
      ?auto_10104 - LOCATION
      ?auto_10102 - TRUCK
      ?auto_10101 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10103 ?auto_10105 ) ( IN-CITY ?auto_10098 ?auto_10105 ) ( not ( = ?auto_10098 ?auto_10103 ) ) ( not ( = ?auto_10106 ?auto_10100 ) ) ( OBJ-AT ?auto_10100 ?auto_10103 ) ( not ( = ?auto_10106 ?auto_10099 ) ) ( not ( = ?auto_10100 ?auto_10099 ) ) ( IN-CITY ?auto_10104 ?auto_10105 ) ( not ( = ?auto_10098 ?auto_10104 ) ) ( not ( = ?auto_10103 ?auto_10104 ) ) ( OBJ-AT ?auto_10099 ?auto_10104 ) ( IN-TRUCK ?auto_10106 ?auto_10102 ) ( TRUCK-AT ?auto_10102 ?auto_10101 ) ( IN-CITY ?auto_10101 ?auto_10105 ) ( not ( = ?auto_10098 ?auto_10101 ) ) ( not ( = ?auto_10103 ?auto_10101 ) ) ( not ( = ?auto_10104 ?auto_10101 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10106 ?auto_10100 ?auto_10098 )
      ( DELIVER-2PKG-VERIFY ?auto_10099 ?auto_10100 ?auto_10098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10108 - OBJ
      ?auto_10109 - OBJ
      ?auto_10107 - LOCATION
    )
    :vars
    (
      ?auto_10113 - LOCATION
      ?auto_10115 - CITY
      ?auto_10111 - OBJ
      ?auto_10114 - LOCATION
      ?auto_10112 - TRUCK
      ?auto_10110 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10113 ?auto_10115 ) ( IN-CITY ?auto_10107 ?auto_10115 ) ( not ( = ?auto_10107 ?auto_10113 ) ) ( not ( = ?auto_10109 ?auto_10108 ) ) ( OBJ-AT ?auto_10108 ?auto_10113 ) ( not ( = ?auto_10109 ?auto_10111 ) ) ( not ( = ?auto_10108 ?auto_10111 ) ) ( IN-CITY ?auto_10114 ?auto_10115 ) ( not ( = ?auto_10107 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( OBJ-AT ?auto_10111 ?auto_10114 ) ( IN-TRUCK ?auto_10109 ?auto_10112 ) ( TRUCK-AT ?auto_10112 ?auto_10110 ) ( IN-CITY ?auto_10110 ?auto_10115 ) ( not ( = ?auto_10107 ?auto_10110 ) ) ( not ( = ?auto_10113 ?auto_10110 ) ) ( not ( = ?auto_10114 ?auto_10110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10109 ?auto_10108 ?auto_10107 )
      ( DELIVER-2PKG-VERIFY ?auto_10108 ?auto_10109 ?auto_10107 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10117 - OBJ
      ?auto_10118 - OBJ
      ?auto_10116 - LOCATION
    )
    :vars
    (
      ?auto_10121 - LOCATION
      ?auto_10123 - CITY
      ?auto_10124 - OBJ
      ?auto_10122 - LOCATION
      ?auto_10120 - TRUCK
      ?auto_10119 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10121 ?auto_10123 ) ( IN-CITY ?auto_10116 ?auto_10123 ) ( not ( = ?auto_10116 ?auto_10121 ) ) ( not ( = ?auto_10124 ?auto_10117 ) ) ( OBJ-AT ?auto_10117 ?auto_10121 ) ( not ( = ?auto_10124 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( IN-CITY ?auto_10122 ?auto_10123 ) ( not ( = ?auto_10116 ?auto_10122 ) ) ( not ( = ?auto_10121 ?auto_10122 ) ) ( OBJ-AT ?auto_10118 ?auto_10122 ) ( IN-TRUCK ?auto_10124 ?auto_10120 ) ( TRUCK-AT ?auto_10120 ?auto_10119 ) ( IN-CITY ?auto_10119 ?auto_10123 ) ( not ( = ?auto_10116 ?auto_10119 ) ) ( not ( = ?auto_10121 ?auto_10119 ) ) ( not ( = ?auto_10122 ?auto_10119 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10124 ?auto_10117 ?auto_10116 )
      ( DELIVER-2PKG-VERIFY ?auto_10117 ?auto_10118 ?auto_10116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10146 - OBJ
      ?auto_10147 - OBJ
      ?auto_10148 - OBJ
      ?auto_10145 - LOCATION
    )
    :vars
    (
      ?auto_10151 - LOCATION
      ?auto_10153 - CITY
      ?auto_10152 - LOCATION
      ?auto_10150 - TRUCK
      ?auto_10149 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10151 ?auto_10153 ) ( IN-CITY ?auto_10145 ?auto_10153 ) ( not ( = ?auto_10145 ?auto_10151 ) ) ( not ( = ?auto_10146 ?auto_10148 ) ) ( OBJ-AT ?auto_10148 ?auto_10151 ) ( not ( = ?auto_10146 ?auto_10147 ) ) ( not ( = ?auto_10148 ?auto_10147 ) ) ( IN-CITY ?auto_10152 ?auto_10153 ) ( not ( = ?auto_10145 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) ( OBJ-AT ?auto_10147 ?auto_10152 ) ( IN-TRUCK ?auto_10146 ?auto_10150 ) ( TRUCK-AT ?auto_10150 ?auto_10149 ) ( IN-CITY ?auto_10149 ?auto_10153 ) ( not ( = ?auto_10145 ?auto_10149 ) ) ( not ( = ?auto_10151 ?auto_10149 ) ) ( not ( = ?auto_10152 ?auto_10149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10146 ?auto_10148 ?auto_10145 )
      ( DELIVER-3PKG-VERIFY ?auto_10146 ?auto_10147 ?auto_10148 ?auto_10145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10165 - OBJ
      ?auto_10166 - OBJ
      ?auto_10167 - OBJ
      ?auto_10164 - LOCATION
    )
    :vars
    (
      ?auto_10170 - LOCATION
      ?auto_10172 - CITY
      ?auto_10171 - LOCATION
      ?auto_10169 - TRUCK
      ?auto_10168 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10170 ?auto_10172 ) ( IN-CITY ?auto_10164 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10170 ) ) ( not ( = ?auto_10165 ?auto_10166 ) ) ( OBJ-AT ?auto_10166 ?auto_10170 ) ( not ( = ?auto_10165 ?auto_10167 ) ) ( not ( = ?auto_10166 ?auto_10167 ) ) ( IN-CITY ?auto_10171 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10171 ) ) ( not ( = ?auto_10170 ?auto_10171 ) ) ( OBJ-AT ?auto_10167 ?auto_10171 ) ( IN-TRUCK ?auto_10165 ?auto_10169 ) ( TRUCK-AT ?auto_10169 ?auto_10168 ) ( IN-CITY ?auto_10168 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10168 ) ) ( not ( = ?auto_10170 ?auto_10168 ) ) ( not ( = ?auto_10171 ?auto_10168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10165 ?auto_10166 ?auto_10164 )
      ( DELIVER-3PKG-VERIFY ?auto_10165 ?auto_10166 ?auto_10167 ?auto_10164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10184 - OBJ
      ?auto_10185 - OBJ
      ?auto_10186 - OBJ
      ?auto_10183 - LOCATION
    )
    :vars
    (
      ?auto_10189 - LOCATION
      ?auto_10191 - CITY
      ?auto_10190 - LOCATION
      ?auto_10188 - TRUCK
      ?auto_10187 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10189 ?auto_10191 ) ( IN-CITY ?auto_10183 ?auto_10191 ) ( not ( = ?auto_10183 ?auto_10189 ) ) ( not ( = ?auto_10185 ?auto_10186 ) ) ( OBJ-AT ?auto_10186 ?auto_10189 ) ( not ( = ?auto_10185 ?auto_10184 ) ) ( not ( = ?auto_10186 ?auto_10184 ) ) ( IN-CITY ?auto_10190 ?auto_10191 ) ( not ( = ?auto_10183 ?auto_10190 ) ) ( not ( = ?auto_10189 ?auto_10190 ) ) ( OBJ-AT ?auto_10184 ?auto_10190 ) ( IN-TRUCK ?auto_10185 ?auto_10188 ) ( TRUCK-AT ?auto_10188 ?auto_10187 ) ( IN-CITY ?auto_10187 ?auto_10191 ) ( not ( = ?auto_10183 ?auto_10187 ) ) ( not ( = ?auto_10189 ?auto_10187 ) ) ( not ( = ?auto_10190 ?auto_10187 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10185 ?auto_10186 ?auto_10183 )
      ( DELIVER-3PKG-VERIFY ?auto_10184 ?auto_10185 ?auto_10186 ?auto_10183 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10203 - OBJ
      ?auto_10204 - OBJ
      ?auto_10205 - OBJ
      ?auto_10202 - LOCATION
    )
    :vars
    (
      ?auto_10208 - LOCATION
      ?auto_10210 - CITY
      ?auto_10209 - LOCATION
      ?auto_10207 - TRUCK
      ?auto_10206 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10208 ?auto_10210 ) ( IN-CITY ?auto_10202 ?auto_10210 ) ( not ( = ?auto_10202 ?auto_10208 ) ) ( not ( = ?auto_10205 ?auto_10204 ) ) ( OBJ-AT ?auto_10204 ?auto_10208 ) ( not ( = ?auto_10205 ?auto_10203 ) ) ( not ( = ?auto_10204 ?auto_10203 ) ) ( IN-CITY ?auto_10209 ?auto_10210 ) ( not ( = ?auto_10202 ?auto_10209 ) ) ( not ( = ?auto_10208 ?auto_10209 ) ) ( OBJ-AT ?auto_10203 ?auto_10209 ) ( IN-TRUCK ?auto_10205 ?auto_10207 ) ( TRUCK-AT ?auto_10207 ?auto_10206 ) ( IN-CITY ?auto_10206 ?auto_10210 ) ( not ( = ?auto_10202 ?auto_10206 ) ) ( not ( = ?auto_10208 ?auto_10206 ) ) ( not ( = ?auto_10209 ?auto_10206 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10205 ?auto_10204 ?auto_10202 )
      ( DELIVER-3PKG-VERIFY ?auto_10203 ?auto_10204 ?auto_10205 ?auto_10202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10242 - OBJ
      ?auto_10243 - OBJ
      ?auto_10244 - OBJ
      ?auto_10241 - LOCATION
    )
    :vars
    (
      ?auto_10247 - LOCATION
      ?auto_10249 - CITY
      ?auto_10248 - LOCATION
      ?auto_10246 - TRUCK
      ?auto_10245 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10247 ?auto_10249 ) ( IN-CITY ?auto_10241 ?auto_10249 ) ( not ( = ?auto_10241 ?auto_10247 ) ) ( not ( = ?auto_10243 ?auto_10242 ) ) ( OBJ-AT ?auto_10242 ?auto_10247 ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( not ( = ?auto_10242 ?auto_10244 ) ) ( IN-CITY ?auto_10248 ?auto_10249 ) ( not ( = ?auto_10241 ?auto_10248 ) ) ( not ( = ?auto_10247 ?auto_10248 ) ) ( OBJ-AT ?auto_10244 ?auto_10248 ) ( IN-TRUCK ?auto_10243 ?auto_10246 ) ( TRUCK-AT ?auto_10246 ?auto_10245 ) ( IN-CITY ?auto_10245 ?auto_10249 ) ( not ( = ?auto_10241 ?auto_10245 ) ) ( not ( = ?auto_10247 ?auto_10245 ) ) ( not ( = ?auto_10248 ?auto_10245 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10243 ?auto_10242 ?auto_10241 )
      ( DELIVER-3PKG-VERIFY ?auto_10242 ?auto_10243 ?auto_10244 ?auto_10241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10261 - OBJ
      ?auto_10262 - OBJ
      ?auto_10263 - OBJ
      ?auto_10260 - LOCATION
    )
    :vars
    (
      ?auto_10266 - LOCATION
      ?auto_10268 - CITY
      ?auto_10267 - LOCATION
      ?auto_10265 - TRUCK
      ?auto_10264 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10266 ?auto_10268 ) ( IN-CITY ?auto_10260 ?auto_10268 ) ( not ( = ?auto_10260 ?auto_10266 ) ) ( not ( = ?auto_10263 ?auto_10261 ) ) ( OBJ-AT ?auto_10261 ?auto_10266 ) ( not ( = ?auto_10263 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( IN-CITY ?auto_10267 ?auto_10268 ) ( not ( = ?auto_10260 ?auto_10267 ) ) ( not ( = ?auto_10266 ?auto_10267 ) ) ( OBJ-AT ?auto_10262 ?auto_10267 ) ( IN-TRUCK ?auto_10263 ?auto_10265 ) ( TRUCK-AT ?auto_10265 ?auto_10264 ) ( IN-CITY ?auto_10264 ?auto_10268 ) ( not ( = ?auto_10260 ?auto_10264 ) ) ( not ( = ?auto_10266 ?auto_10264 ) ) ( not ( = ?auto_10267 ?auto_10264 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10263 ?auto_10261 ?auto_10260 )
      ( DELIVER-3PKG-VERIFY ?auto_10261 ?auto_10262 ?auto_10263 ?auto_10260 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10321 - OBJ
      ?auto_10320 - LOCATION
    )
    :vars
    (
      ?auto_10325 - LOCATION
      ?auto_10327 - CITY
      ?auto_10328 - OBJ
      ?auto_10323 - OBJ
      ?auto_10326 - LOCATION
      ?auto_10324 - TRUCK
      ?auto_10322 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10325 ?auto_10327 ) ( IN-CITY ?auto_10320 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10325 ) ) ( not ( = ?auto_10328 ?auto_10321 ) ) ( OBJ-AT ?auto_10321 ?auto_10325 ) ( not ( = ?auto_10328 ?auto_10323 ) ) ( not ( = ?auto_10321 ?auto_10323 ) ) ( IN-CITY ?auto_10326 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( OBJ-AT ?auto_10323 ?auto_10326 ) ( TRUCK-AT ?auto_10324 ?auto_10322 ) ( IN-CITY ?auto_10322 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10322 ) ) ( not ( = ?auto_10325 ?auto_10322 ) ) ( not ( = ?auto_10326 ?auto_10322 ) ) ( OBJ-AT ?auto_10328 ?auto_10322 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10328 ?auto_10324 ?auto_10322 )
      ( DELIVER-2PKG ?auto_10328 ?auto_10321 ?auto_10320 )
      ( DELIVER-1PKG-VERIFY ?auto_10321 ?auto_10320 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10330 - OBJ
      ?auto_10331 - OBJ
      ?auto_10329 - LOCATION
    )
    :vars
    (
      ?auto_10337 - LOCATION
      ?auto_10334 - CITY
      ?auto_10332 - OBJ
      ?auto_10333 - LOCATION
      ?auto_10336 - TRUCK
      ?auto_10335 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10337 ?auto_10334 ) ( IN-CITY ?auto_10329 ?auto_10334 ) ( not ( = ?auto_10329 ?auto_10337 ) ) ( not ( = ?auto_10330 ?auto_10331 ) ) ( OBJ-AT ?auto_10331 ?auto_10337 ) ( not ( = ?auto_10330 ?auto_10332 ) ) ( not ( = ?auto_10331 ?auto_10332 ) ) ( IN-CITY ?auto_10333 ?auto_10334 ) ( not ( = ?auto_10329 ?auto_10333 ) ) ( not ( = ?auto_10337 ?auto_10333 ) ) ( OBJ-AT ?auto_10332 ?auto_10333 ) ( TRUCK-AT ?auto_10336 ?auto_10335 ) ( IN-CITY ?auto_10335 ?auto_10334 ) ( not ( = ?auto_10329 ?auto_10335 ) ) ( not ( = ?auto_10337 ?auto_10335 ) ) ( not ( = ?auto_10333 ?auto_10335 ) ) ( OBJ-AT ?auto_10330 ?auto_10335 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10331 ?auto_10329 )
      ( DELIVER-2PKG-VERIFY ?auto_10330 ?auto_10331 ?auto_10329 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10339 - OBJ
      ?auto_10340 - OBJ
      ?auto_10338 - LOCATION
    )
    :vars
    (
      ?auto_10341 - LOCATION
      ?auto_10345 - CITY
      ?auto_10346 - OBJ
      ?auto_10344 - LOCATION
      ?auto_10342 - TRUCK
      ?auto_10343 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10341 ?auto_10345 ) ( IN-CITY ?auto_10338 ?auto_10345 ) ( not ( = ?auto_10338 ?auto_10341 ) ) ( not ( = ?auto_10346 ?auto_10340 ) ) ( OBJ-AT ?auto_10340 ?auto_10341 ) ( not ( = ?auto_10346 ?auto_10339 ) ) ( not ( = ?auto_10340 ?auto_10339 ) ) ( IN-CITY ?auto_10344 ?auto_10345 ) ( not ( = ?auto_10338 ?auto_10344 ) ) ( not ( = ?auto_10341 ?auto_10344 ) ) ( OBJ-AT ?auto_10339 ?auto_10344 ) ( TRUCK-AT ?auto_10342 ?auto_10343 ) ( IN-CITY ?auto_10343 ?auto_10345 ) ( not ( = ?auto_10338 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10343 ) ) ( not ( = ?auto_10344 ?auto_10343 ) ) ( OBJ-AT ?auto_10346 ?auto_10343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10346 ?auto_10340 ?auto_10338 )
      ( DELIVER-2PKG-VERIFY ?auto_10339 ?auto_10340 ?auto_10338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10348 - OBJ
      ?auto_10349 - OBJ
      ?auto_10347 - LOCATION
    )
    :vars
    (
      ?auto_10350 - LOCATION
      ?auto_10355 - CITY
      ?auto_10351 - OBJ
      ?auto_10354 - LOCATION
      ?auto_10352 - TRUCK
      ?auto_10353 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10350 ?auto_10355 ) ( IN-CITY ?auto_10347 ?auto_10355 ) ( not ( = ?auto_10347 ?auto_10350 ) ) ( not ( = ?auto_10349 ?auto_10348 ) ) ( OBJ-AT ?auto_10348 ?auto_10350 ) ( not ( = ?auto_10349 ?auto_10351 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( IN-CITY ?auto_10354 ?auto_10355 ) ( not ( = ?auto_10347 ?auto_10354 ) ) ( not ( = ?auto_10350 ?auto_10354 ) ) ( OBJ-AT ?auto_10351 ?auto_10354 ) ( TRUCK-AT ?auto_10352 ?auto_10353 ) ( IN-CITY ?auto_10353 ?auto_10355 ) ( not ( = ?auto_10347 ?auto_10353 ) ) ( not ( = ?auto_10350 ?auto_10353 ) ) ( not ( = ?auto_10354 ?auto_10353 ) ) ( OBJ-AT ?auto_10349 ?auto_10353 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10349 ?auto_10348 ?auto_10347 )
      ( DELIVER-2PKG-VERIFY ?auto_10348 ?auto_10349 ?auto_10347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10357 - OBJ
      ?auto_10358 - OBJ
      ?auto_10356 - LOCATION
    )
    :vars
    (
      ?auto_10359 - LOCATION
      ?auto_10363 - CITY
      ?auto_10364 - OBJ
      ?auto_10362 - LOCATION
      ?auto_10360 - TRUCK
      ?auto_10361 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10359 ?auto_10363 ) ( IN-CITY ?auto_10356 ?auto_10363 ) ( not ( = ?auto_10356 ?auto_10359 ) ) ( not ( = ?auto_10364 ?auto_10357 ) ) ( OBJ-AT ?auto_10357 ?auto_10359 ) ( not ( = ?auto_10364 ?auto_10358 ) ) ( not ( = ?auto_10357 ?auto_10358 ) ) ( IN-CITY ?auto_10362 ?auto_10363 ) ( not ( = ?auto_10356 ?auto_10362 ) ) ( not ( = ?auto_10359 ?auto_10362 ) ) ( OBJ-AT ?auto_10358 ?auto_10362 ) ( TRUCK-AT ?auto_10360 ?auto_10361 ) ( IN-CITY ?auto_10361 ?auto_10363 ) ( not ( = ?auto_10356 ?auto_10361 ) ) ( not ( = ?auto_10359 ?auto_10361 ) ) ( not ( = ?auto_10362 ?auto_10361 ) ) ( OBJ-AT ?auto_10364 ?auto_10361 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10364 ?auto_10357 ?auto_10356 )
      ( DELIVER-2PKG-VERIFY ?auto_10357 ?auto_10358 ?auto_10356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10386 - OBJ
      ?auto_10387 - OBJ
      ?auto_10388 - OBJ
      ?auto_10385 - LOCATION
    )
    :vars
    (
      ?auto_10389 - LOCATION
      ?auto_10393 - CITY
      ?auto_10392 - LOCATION
      ?auto_10390 - TRUCK
      ?auto_10391 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10389 ?auto_10393 ) ( IN-CITY ?auto_10385 ?auto_10393 ) ( not ( = ?auto_10385 ?auto_10389 ) ) ( not ( = ?auto_10386 ?auto_10388 ) ) ( OBJ-AT ?auto_10388 ?auto_10389 ) ( not ( = ?auto_10386 ?auto_10387 ) ) ( not ( = ?auto_10388 ?auto_10387 ) ) ( IN-CITY ?auto_10392 ?auto_10393 ) ( not ( = ?auto_10385 ?auto_10392 ) ) ( not ( = ?auto_10389 ?auto_10392 ) ) ( OBJ-AT ?auto_10387 ?auto_10392 ) ( TRUCK-AT ?auto_10390 ?auto_10391 ) ( IN-CITY ?auto_10391 ?auto_10393 ) ( not ( = ?auto_10385 ?auto_10391 ) ) ( not ( = ?auto_10389 ?auto_10391 ) ) ( not ( = ?auto_10392 ?auto_10391 ) ) ( OBJ-AT ?auto_10386 ?auto_10391 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10386 ?auto_10388 ?auto_10385 )
      ( DELIVER-3PKG-VERIFY ?auto_10386 ?auto_10387 ?auto_10388 ?auto_10385 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10405 - OBJ
      ?auto_10406 - OBJ
      ?auto_10407 - OBJ
      ?auto_10404 - LOCATION
    )
    :vars
    (
      ?auto_10408 - LOCATION
      ?auto_10412 - CITY
      ?auto_10411 - LOCATION
      ?auto_10409 - TRUCK
      ?auto_10410 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10408 ?auto_10412 ) ( IN-CITY ?auto_10404 ?auto_10412 ) ( not ( = ?auto_10404 ?auto_10408 ) ) ( not ( = ?auto_10405 ?auto_10406 ) ) ( OBJ-AT ?auto_10406 ?auto_10408 ) ( not ( = ?auto_10405 ?auto_10407 ) ) ( not ( = ?auto_10406 ?auto_10407 ) ) ( IN-CITY ?auto_10411 ?auto_10412 ) ( not ( = ?auto_10404 ?auto_10411 ) ) ( not ( = ?auto_10408 ?auto_10411 ) ) ( OBJ-AT ?auto_10407 ?auto_10411 ) ( TRUCK-AT ?auto_10409 ?auto_10410 ) ( IN-CITY ?auto_10410 ?auto_10412 ) ( not ( = ?auto_10404 ?auto_10410 ) ) ( not ( = ?auto_10408 ?auto_10410 ) ) ( not ( = ?auto_10411 ?auto_10410 ) ) ( OBJ-AT ?auto_10405 ?auto_10410 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10405 ?auto_10406 ?auto_10404 )
      ( DELIVER-3PKG-VERIFY ?auto_10405 ?auto_10406 ?auto_10407 ?auto_10404 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10424 - OBJ
      ?auto_10425 - OBJ
      ?auto_10426 - OBJ
      ?auto_10423 - LOCATION
    )
    :vars
    (
      ?auto_10427 - LOCATION
      ?auto_10431 - CITY
      ?auto_10430 - LOCATION
      ?auto_10428 - TRUCK
      ?auto_10429 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10427 ?auto_10431 ) ( IN-CITY ?auto_10423 ?auto_10431 ) ( not ( = ?auto_10423 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10426 ) ) ( OBJ-AT ?auto_10426 ?auto_10427 ) ( not ( = ?auto_10425 ?auto_10424 ) ) ( not ( = ?auto_10426 ?auto_10424 ) ) ( IN-CITY ?auto_10430 ?auto_10431 ) ( not ( = ?auto_10423 ?auto_10430 ) ) ( not ( = ?auto_10427 ?auto_10430 ) ) ( OBJ-AT ?auto_10424 ?auto_10430 ) ( TRUCK-AT ?auto_10428 ?auto_10429 ) ( IN-CITY ?auto_10429 ?auto_10431 ) ( not ( = ?auto_10423 ?auto_10429 ) ) ( not ( = ?auto_10427 ?auto_10429 ) ) ( not ( = ?auto_10430 ?auto_10429 ) ) ( OBJ-AT ?auto_10425 ?auto_10429 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10425 ?auto_10426 ?auto_10423 )
      ( DELIVER-3PKG-VERIFY ?auto_10424 ?auto_10425 ?auto_10426 ?auto_10423 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10443 - OBJ
      ?auto_10444 - OBJ
      ?auto_10445 - OBJ
      ?auto_10442 - LOCATION
    )
    :vars
    (
      ?auto_10446 - LOCATION
      ?auto_10450 - CITY
      ?auto_10449 - LOCATION
      ?auto_10447 - TRUCK
      ?auto_10448 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10446 ?auto_10450 ) ( IN-CITY ?auto_10442 ?auto_10450 ) ( not ( = ?auto_10442 ?auto_10446 ) ) ( not ( = ?auto_10445 ?auto_10444 ) ) ( OBJ-AT ?auto_10444 ?auto_10446 ) ( not ( = ?auto_10445 ?auto_10443 ) ) ( not ( = ?auto_10444 ?auto_10443 ) ) ( IN-CITY ?auto_10449 ?auto_10450 ) ( not ( = ?auto_10442 ?auto_10449 ) ) ( not ( = ?auto_10446 ?auto_10449 ) ) ( OBJ-AT ?auto_10443 ?auto_10449 ) ( TRUCK-AT ?auto_10447 ?auto_10448 ) ( IN-CITY ?auto_10448 ?auto_10450 ) ( not ( = ?auto_10442 ?auto_10448 ) ) ( not ( = ?auto_10446 ?auto_10448 ) ) ( not ( = ?auto_10449 ?auto_10448 ) ) ( OBJ-AT ?auto_10445 ?auto_10448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10445 ?auto_10444 ?auto_10442 )
      ( DELIVER-3PKG-VERIFY ?auto_10443 ?auto_10444 ?auto_10445 ?auto_10442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10482 - OBJ
      ?auto_10483 - OBJ
      ?auto_10484 - OBJ
      ?auto_10481 - LOCATION
    )
    :vars
    (
      ?auto_10485 - LOCATION
      ?auto_10489 - CITY
      ?auto_10488 - LOCATION
      ?auto_10486 - TRUCK
      ?auto_10487 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10485 ?auto_10489 ) ( IN-CITY ?auto_10481 ?auto_10489 ) ( not ( = ?auto_10481 ?auto_10485 ) ) ( not ( = ?auto_10483 ?auto_10482 ) ) ( OBJ-AT ?auto_10482 ?auto_10485 ) ( not ( = ?auto_10483 ?auto_10484 ) ) ( not ( = ?auto_10482 ?auto_10484 ) ) ( IN-CITY ?auto_10488 ?auto_10489 ) ( not ( = ?auto_10481 ?auto_10488 ) ) ( not ( = ?auto_10485 ?auto_10488 ) ) ( OBJ-AT ?auto_10484 ?auto_10488 ) ( TRUCK-AT ?auto_10486 ?auto_10487 ) ( IN-CITY ?auto_10487 ?auto_10489 ) ( not ( = ?auto_10481 ?auto_10487 ) ) ( not ( = ?auto_10485 ?auto_10487 ) ) ( not ( = ?auto_10488 ?auto_10487 ) ) ( OBJ-AT ?auto_10483 ?auto_10487 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10483 ?auto_10482 ?auto_10481 )
      ( DELIVER-3PKG-VERIFY ?auto_10482 ?auto_10483 ?auto_10484 ?auto_10481 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10501 - OBJ
      ?auto_10502 - OBJ
      ?auto_10503 - OBJ
      ?auto_10500 - LOCATION
    )
    :vars
    (
      ?auto_10504 - LOCATION
      ?auto_10508 - CITY
      ?auto_10507 - LOCATION
      ?auto_10505 - TRUCK
      ?auto_10506 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10504 ?auto_10508 ) ( IN-CITY ?auto_10500 ?auto_10508 ) ( not ( = ?auto_10500 ?auto_10504 ) ) ( not ( = ?auto_10503 ?auto_10501 ) ) ( OBJ-AT ?auto_10501 ?auto_10504 ) ( not ( = ?auto_10503 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10502 ) ) ( IN-CITY ?auto_10507 ?auto_10508 ) ( not ( = ?auto_10500 ?auto_10507 ) ) ( not ( = ?auto_10504 ?auto_10507 ) ) ( OBJ-AT ?auto_10502 ?auto_10507 ) ( TRUCK-AT ?auto_10505 ?auto_10506 ) ( IN-CITY ?auto_10506 ?auto_10508 ) ( not ( = ?auto_10500 ?auto_10506 ) ) ( not ( = ?auto_10504 ?auto_10506 ) ) ( not ( = ?auto_10507 ?auto_10506 ) ) ( OBJ-AT ?auto_10503 ?auto_10506 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10503 ?auto_10501 ?auto_10500 )
      ( DELIVER-3PKG-VERIFY ?auto_10501 ?auto_10502 ?auto_10503 ?auto_10500 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10561 - OBJ
      ?auto_10560 - LOCATION
    )
    :vars
    (
      ?auto_10562 - LOCATION
      ?auto_10567 - CITY
      ?auto_10568 - OBJ
      ?auto_10563 - OBJ
      ?auto_10566 - LOCATION
      ?auto_10565 - LOCATION
      ?auto_10564 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10562 ?auto_10567 ) ( IN-CITY ?auto_10560 ?auto_10567 ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( not ( = ?auto_10568 ?auto_10561 ) ) ( OBJ-AT ?auto_10561 ?auto_10562 ) ( not ( = ?auto_10568 ?auto_10563 ) ) ( not ( = ?auto_10561 ?auto_10563 ) ) ( IN-CITY ?auto_10566 ?auto_10567 ) ( not ( = ?auto_10560 ?auto_10566 ) ) ( not ( = ?auto_10562 ?auto_10566 ) ) ( OBJ-AT ?auto_10563 ?auto_10566 ) ( IN-CITY ?auto_10565 ?auto_10567 ) ( not ( = ?auto_10560 ?auto_10565 ) ) ( not ( = ?auto_10562 ?auto_10565 ) ) ( not ( = ?auto_10566 ?auto_10565 ) ) ( OBJ-AT ?auto_10568 ?auto_10565 ) ( TRUCK-AT ?auto_10564 ?auto_10560 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10564 ?auto_10560 ?auto_10565 ?auto_10567 )
      ( DELIVER-2PKG ?auto_10568 ?auto_10561 ?auto_10560 )
      ( DELIVER-1PKG-VERIFY ?auto_10561 ?auto_10560 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10570 - OBJ
      ?auto_10571 - OBJ
      ?auto_10569 - LOCATION
    )
    :vars
    (
      ?auto_10574 - LOCATION
      ?auto_10576 - CITY
      ?auto_10575 - OBJ
      ?auto_10573 - LOCATION
      ?auto_10577 - LOCATION
      ?auto_10572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10574 ?auto_10576 ) ( IN-CITY ?auto_10569 ?auto_10576 ) ( not ( = ?auto_10569 ?auto_10574 ) ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( OBJ-AT ?auto_10571 ?auto_10574 ) ( not ( = ?auto_10570 ?auto_10575 ) ) ( not ( = ?auto_10571 ?auto_10575 ) ) ( IN-CITY ?auto_10573 ?auto_10576 ) ( not ( = ?auto_10569 ?auto_10573 ) ) ( not ( = ?auto_10574 ?auto_10573 ) ) ( OBJ-AT ?auto_10575 ?auto_10573 ) ( IN-CITY ?auto_10577 ?auto_10576 ) ( not ( = ?auto_10569 ?auto_10577 ) ) ( not ( = ?auto_10574 ?auto_10577 ) ) ( not ( = ?auto_10573 ?auto_10577 ) ) ( OBJ-AT ?auto_10570 ?auto_10577 ) ( TRUCK-AT ?auto_10572 ?auto_10569 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10571 ?auto_10569 )
      ( DELIVER-2PKG-VERIFY ?auto_10570 ?auto_10571 ?auto_10569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10579 - OBJ
      ?auto_10580 - OBJ
      ?auto_10578 - LOCATION
    )
    :vars
    (
      ?auto_10583 - LOCATION
      ?auto_10584 - CITY
      ?auto_10586 - OBJ
      ?auto_10585 - LOCATION
      ?auto_10581 - LOCATION
      ?auto_10582 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10583 ?auto_10584 ) ( IN-CITY ?auto_10578 ?auto_10584 ) ( not ( = ?auto_10578 ?auto_10583 ) ) ( not ( = ?auto_10586 ?auto_10580 ) ) ( OBJ-AT ?auto_10580 ?auto_10583 ) ( not ( = ?auto_10586 ?auto_10579 ) ) ( not ( = ?auto_10580 ?auto_10579 ) ) ( IN-CITY ?auto_10585 ?auto_10584 ) ( not ( = ?auto_10578 ?auto_10585 ) ) ( not ( = ?auto_10583 ?auto_10585 ) ) ( OBJ-AT ?auto_10579 ?auto_10585 ) ( IN-CITY ?auto_10581 ?auto_10584 ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( not ( = ?auto_10583 ?auto_10581 ) ) ( not ( = ?auto_10585 ?auto_10581 ) ) ( OBJ-AT ?auto_10586 ?auto_10581 ) ( TRUCK-AT ?auto_10582 ?auto_10578 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10586 ?auto_10580 ?auto_10578 )
      ( DELIVER-2PKG-VERIFY ?auto_10579 ?auto_10580 ?auto_10578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10588 - OBJ
      ?auto_10589 - OBJ
      ?auto_10587 - LOCATION
    )
    :vars
    (
      ?auto_10593 - LOCATION
      ?auto_10594 - CITY
      ?auto_10590 - OBJ
      ?auto_10595 - LOCATION
      ?auto_10591 - LOCATION
      ?auto_10592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10593 ?auto_10594 ) ( IN-CITY ?auto_10587 ?auto_10594 ) ( not ( = ?auto_10587 ?auto_10593 ) ) ( not ( = ?auto_10589 ?auto_10588 ) ) ( OBJ-AT ?auto_10588 ?auto_10593 ) ( not ( = ?auto_10589 ?auto_10590 ) ) ( not ( = ?auto_10588 ?auto_10590 ) ) ( IN-CITY ?auto_10595 ?auto_10594 ) ( not ( = ?auto_10587 ?auto_10595 ) ) ( not ( = ?auto_10593 ?auto_10595 ) ) ( OBJ-AT ?auto_10590 ?auto_10595 ) ( IN-CITY ?auto_10591 ?auto_10594 ) ( not ( = ?auto_10587 ?auto_10591 ) ) ( not ( = ?auto_10593 ?auto_10591 ) ) ( not ( = ?auto_10595 ?auto_10591 ) ) ( OBJ-AT ?auto_10589 ?auto_10591 ) ( TRUCK-AT ?auto_10592 ?auto_10587 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10589 ?auto_10588 ?auto_10587 )
      ( DELIVER-2PKG-VERIFY ?auto_10588 ?auto_10589 ?auto_10587 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10597 - OBJ
      ?auto_10598 - OBJ
      ?auto_10596 - LOCATION
    )
    :vars
    (
      ?auto_10601 - LOCATION
      ?auto_10602 - CITY
      ?auto_10604 - OBJ
      ?auto_10603 - LOCATION
      ?auto_10599 - LOCATION
      ?auto_10600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10601 ?auto_10602 ) ( IN-CITY ?auto_10596 ?auto_10602 ) ( not ( = ?auto_10596 ?auto_10601 ) ) ( not ( = ?auto_10604 ?auto_10597 ) ) ( OBJ-AT ?auto_10597 ?auto_10601 ) ( not ( = ?auto_10604 ?auto_10598 ) ) ( not ( = ?auto_10597 ?auto_10598 ) ) ( IN-CITY ?auto_10603 ?auto_10602 ) ( not ( = ?auto_10596 ?auto_10603 ) ) ( not ( = ?auto_10601 ?auto_10603 ) ) ( OBJ-AT ?auto_10598 ?auto_10603 ) ( IN-CITY ?auto_10599 ?auto_10602 ) ( not ( = ?auto_10596 ?auto_10599 ) ) ( not ( = ?auto_10601 ?auto_10599 ) ) ( not ( = ?auto_10603 ?auto_10599 ) ) ( OBJ-AT ?auto_10604 ?auto_10599 ) ( TRUCK-AT ?auto_10600 ?auto_10596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10604 ?auto_10597 ?auto_10596 )
      ( DELIVER-2PKG-VERIFY ?auto_10597 ?auto_10598 ?auto_10596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10626 - OBJ
      ?auto_10627 - OBJ
      ?auto_10628 - OBJ
      ?auto_10625 - LOCATION
    )
    :vars
    (
      ?auto_10631 - LOCATION
      ?auto_10632 - CITY
      ?auto_10633 - LOCATION
      ?auto_10629 - LOCATION
      ?auto_10630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10631 ?auto_10632 ) ( IN-CITY ?auto_10625 ?auto_10632 ) ( not ( = ?auto_10625 ?auto_10631 ) ) ( not ( = ?auto_10626 ?auto_10628 ) ) ( OBJ-AT ?auto_10628 ?auto_10631 ) ( not ( = ?auto_10626 ?auto_10627 ) ) ( not ( = ?auto_10628 ?auto_10627 ) ) ( IN-CITY ?auto_10633 ?auto_10632 ) ( not ( = ?auto_10625 ?auto_10633 ) ) ( not ( = ?auto_10631 ?auto_10633 ) ) ( OBJ-AT ?auto_10627 ?auto_10633 ) ( IN-CITY ?auto_10629 ?auto_10632 ) ( not ( = ?auto_10625 ?auto_10629 ) ) ( not ( = ?auto_10631 ?auto_10629 ) ) ( not ( = ?auto_10633 ?auto_10629 ) ) ( OBJ-AT ?auto_10626 ?auto_10629 ) ( TRUCK-AT ?auto_10630 ?auto_10625 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10626 ?auto_10628 ?auto_10625 )
      ( DELIVER-3PKG-VERIFY ?auto_10626 ?auto_10627 ?auto_10628 ?auto_10625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10645 - OBJ
      ?auto_10646 - OBJ
      ?auto_10647 - OBJ
      ?auto_10644 - LOCATION
    )
    :vars
    (
      ?auto_10650 - LOCATION
      ?auto_10651 - CITY
      ?auto_10652 - LOCATION
      ?auto_10648 - LOCATION
      ?auto_10649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10650 ?auto_10651 ) ( IN-CITY ?auto_10644 ?auto_10651 ) ( not ( = ?auto_10644 ?auto_10650 ) ) ( not ( = ?auto_10645 ?auto_10646 ) ) ( OBJ-AT ?auto_10646 ?auto_10650 ) ( not ( = ?auto_10645 ?auto_10647 ) ) ( not ( = ?auto_10646 ?auto_10647 ) ) ( IN-CITY ?auto_10652 ?auto_10651 ) ( not ( = ?auto_10644 ?auto_10652 ) ) ( not ( = ?auto_10650 ?auto_10652 ) ) ( OBJ-AT ?auto_10647 ?auto_10652 ) ( IN-CITY ?auto_10648 ?auto_10651 ) ( not ( = ?auto_10644 ?auto_10648 ) ) ( not ( = ?auto_10650 ?auto_10648 ) ) ( not ( = ?auto_10652 ?auto_10648 ) ) ( OBJ-AT ?auto_10645 ?auto_10648 ) ( TRUCK-AT ?auto_10649 ?auto_10644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10645 ?auto_10646 ?auto_10644 )
      ( DELIVER-3PKG-VERIFY ?auto_10645 ?auto_10646 ?auto_10647 ?auto_10644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10664 - OBJ
      ?auto_10665 - OBJ
      ?auto_10666 - OBJ
      ?auto_10663 - LOCATION
    )
    :vars
    (
      ?auto_10669 - LOCATION
      ?auto_10670 - CITY
      ?auto_10671 - LOCATION
      ?auto_10667 - LOCATION
      ?auto_10668 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10669 ?auto_10670 ) ( IN-CITY ?auto_10663 ?auto_10670 ) ( not ( = ?auto_10663 ?auto_10669 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( OBJ-AT ?auto_10666 ?auto_10669 ) ( not ( = ?auto_10665 ?auto_10664 ) ) ( not ( = ?auto_10666 ?auto_10664 ) ) ( IN-CITY ?auto_10671 ?auto_10670 ) ( not ( = ?auto_10663 ?auto_10671 ) ) ( not ( = ?auto_10669 ?auto_10671 ) ) ( OBJ-AT ?auto_10664 ?auto_10671 ) ( IN-CITY ?auto_10667 ?auto_10670 ) ( not ( = ?auto_10663 ?auto_10667 ) ) ( not ( = ?auto_10669 ?auto_10667 ) ) ( not ( = ?auto_10671 ?auto_10667 ) ) ( OBJ-AT ?auto_10665 ?auto_10667 ) ( TRUCK-AT ?auto_10668 ?auto_10663 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10665 ?auto_10666 ?auto_10663 )
      ( DELIVER-3PKG-VERIFY ?auto_10664 ?auto_10665 ?auto_10666 ?auto_10663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10683 - OBJ
      ?auto_10684 - OBJ
      ?auto_10685 - OBJ
      ?auto_10682 - LOCATION
    )
    :vars
    (
      ?auto_10688 - LOCATION
      ?auto_10689 - CITY
      ?auto_10690 - LOCATION
      ?auto_10686 - LOCATION
      ?auto_10687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10688 ?auto_10689 ) ( IN-CITY ?auto_10682 ?auto_10689 ) ( not ( = ?auto_10682 ?auto_10688 ) ) ( not ( = ?auto_10685 ?auto_10684 ) ) ( OBJ-AT ?auto_10684 ?auto_10688 ) ( not ( = ?auto_10685 ?auto_10683 ) ) ( not ( = ?auto_10684 ?auto_10683 ) ) ( IN-CITY ?auto_10690 ?auto_10689 ) ( not ( = ?auto_10682 ?auto_10690 ) ) ( not ( = ?auto_10688 ?auto_10690 ) ) ( OBJ-AT ?auto_10683 ?auto_10690 ) ( IN-CITY ?auto_10686 ?auto_10689 ) ( not ( = ?auto_10682 ?auto_10686 ) ) ( not ( = ?auto_10688 ?auto_10686 ) ) ( not ( = ?auto_10690 ?auto_10686 ) ) ( OBJ-AT ?auto_10685 ?auto_10686 ) ( TRUCK-AT ?auto_10687 ?auto_10682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10685 ?auto_10684 ?auto_10682 )
      ( DELIVER-3PKG-VERIFY ?auto_10683 ?auto_10684 ?auto_10685 ?auto_10682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10722 - OBJ
      ?auto_10723 - OBJ
      ?auto_10724 - OBJ
      ?auto_10721 - LOCATION
    )
    :vars
    (
      ?auto_10727 - LOCATION
      ?auto_10728 - CITY
      ?auto_10729 - LOCATION
      ?auto_10725 - LOCATION
      ?auto_10726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10727 ?auto_10728 ) ( IN-CITY ?auto_10721 ?auto_10728 ) ( not ( = ?auto_10721 ?auto_10727 ) ) ( not ( = ?auto_10723 ?auto_10722 ) ) ( OBJ-AT ?auto_10722 ?auto_10727 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10722 ?auto_10724 ) ) ( IN-CITY ?auto_10729 ?auto_10728 ) ( not ( = ?auto_10721 ?auto_10729 ) ) ( not ( = ?auto_10727 ?auto_10729 ) ) ( OBJ-AT ?auto_10724 ?auto_10729 ) ( IN-CITY ?auto_10725 ?auto_10728 ) ( not ( = ?auto_10721 ?auto_10725 ) ) ( not ( = ?auto_10727 ?auto_10725 ) ) ( not ( = ?auto_10729 ?auto_10725 ) ) ( OBJ-AT ?auto_10723 ?auto_10725 ) ( TRUCK-AT ?auto_10726 ?auto_10721 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10723 ?auto_10722 ?auto_10721 )
      ( DELIVER-3PKG-VERIFY ?auto_10722 ?auto_10723 ?auto_10724 ?auto_10721 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10741 - OBJ
      ?auto_10742 - OBJ
      ?auto_10743 - OBJ
      ?auto_10740 - LOCATION
    )
    :vars
    (
      ?auto_10746 - LOCATION
      ?auto_10747 - CITY
      ?auto_10748 - LOCATION
      ?auto_10744 - LOCATION
      ?auto_10745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10746 ?auto_10747 ) ( IN-CITY ?auto_10740 ?auto_10747 ) ( not ( = ?auto_10740 ?auto_10746 ) ) ( not ( = ?auto_10743 ?auto_10741 ) ) ( OBJ-AT ?auto_10741 ?auto_10746 ) ( not ( = ?auto_10743 ?auto_10742 ) ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( IN-CITY ?auto_10748 ?auto_10747 ) ( not ( = ?auto_10740 ?auto_10748 ) ) ( not ( = ?auto_10746 ?auto_10748 ) ) ( OBJ-AT ?auto_10742 ?auto_10748 ) ( IN-CITY ?auto_10744 ?auto_10747 ) ( not ( = ?auto_10740 ?auto_10744 ) ) ( not ( = ?auto_10746 ?auto_10744 ) ) ( not ( = ?auto_10748 ?auto_10744 ) ) ( OBJ-AT ?auto_10743 ?auto_10744 ) ( TRUCK-AT ?auto_10745 ?auto_10740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10743 ?auto_10741 ?auto_10740 )
      ( DELIVER-3PKG-VERIFY ?auto_10741 ?auto_10742 ?auto_10743 ?auto_10740 ) )
  )

)

