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
      ?auto_7476 - OBJ
      ?auto_7475 - LOCATION
    )
    :vars
    (
      ?auto_7477 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7477 ?auto_7475 ) ( IN-TRUCK ?auto_7476 ?auto_7477 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7476 ?auto_7477 ?auto_7475 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7488 - OBJ
      ?auto_7487 - LOCATION
    )
    :vars
    (
      ?auto_7489 - TRUCK
      ?auto_7490 - LOCATION
      ?auto_7491 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7488 ?auto_7489 ) ( TRUCK-AT ?auto_7489 ?auto_7490 ) ( IN-CITY ?auto_7490 ?auto_7491 ) ( IN-CITY ?auto_7487 ?auto_7491 ) ( not ( = ?auto_7487 ?auto_7490 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7489 ?auto_7490 ?auto_7487 ?auto_7491 )
      ( DELIVER-1PKG ?auto_7488 ?auto_7487 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7506 - OBJ
      ?auto_7505 - LOCATION
    )
    :vars
    (
      ?auto_7507 - TRUCK
      ?auto_7508 - LOCATION
      ?auto_7509 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7507 ?auto_7508 ) ( IN-CITY ?auto_7508 ?auto_7509 ) ( IN-CITY ?auto_7505 ?auto_7509 ) ( not ( = ?auto_7505 ?auto_7508 ) ) ( OBJ-AT ?auto_7506 ?auto_7508 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7506 ?auto_7507 ?auto_7508 )
      ( DELIVER-1PKG ?auto_7506 ?auto_7505 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7524 - OBJ
      ?auto_7523 - LOCATION
    )
    :vars
    (
      ?auto_7527 - LOCATION
      ?auto_7526 - CITY
      ?auto_7525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7527 ?auto_7526 ) ( IN-CITY ?auto_7523 ?auto_7526 ) ( not ( = ?auto_7523 ?auto_7527 ) ) ( OBJ-AT ?auto_7524 ?auto_7527 ) ( TRUCK-AT ?auto_7525 ?auto_7523 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7525 ?auto_7523 ?auto_7527 ?auto_7526 )
      ( DELIVER-1PKG ?auto_7524 ?auto_7523 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7581 - OBJ
      ?auto_7580 - LOCATION
    )
    :vars
    (
      ?auto_7582 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7582 ?auto_7580 ) ( IN-TRUCK ?auto_7581 ?auto_7582 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7581 ?auto_7582 ?auto_7580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7584 - OBJ
      ?auto_7585 - OBJ
      ?auto_7583 - LOCATION
    )
    :vars
    (
      ?auto_7586 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7586 ?auto_7583 ) ( IN-TRUCK ?auto_7585 ?auto_7586 ) ( OBJ-AT ?auto_7584 ?auto_7583 ) ( not ( = ?auto_7584 ?auto_7585 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7585 ?auto_7583 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7588 - OBJ
      ?auto_7589 - OBJ
      ?auto_7587 - LOCATION
    )
    :vars
    (
      ?auto_7590 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7590 ?auto_7587 ) ( IN-TRUCK ?auto_7588 ?auto_7590 ) ( OBJ-AT ?auto_7589 ?auto_7587 ) ( not ( = ?auto_7588 ?auto_7589 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7588 ?auto_7587 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7596 - OBJ
      ?auto_7597 - OBJ
      ?auto_7598 - OBJ
      ?auto_7595 - LOCATION
    )
    :vars
    (
      ?auto_7599 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7599 ?auto_7595 ) ( IN-TRUCK ?auto_7598 ?auto_7599 ) ( OBJ-AT ?auto_7596 ?auto_7595 ) ( OBJ-AT ?auto_7597 ?auto_7595 ) ( not ( = ?auto_7596 ?auto_7597 ) ) ( not ( = ?auto_7596 ?auto_7598 ) ) ( not ( = ?auto_7597 ?auto_7598 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7598 ?auto_7595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7601 - OBJ
      ?auto_7602 - OBJ
      ?auto_7603 - OBJ
      ?auto_7600 - LOCATION
    )
    :vars
    (
      ?auto_7604 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7604 ?auto_7600 ) ( IN-TRUCK ?auto_7602 ?auto_7604 ) ( OBJ-AT ?auto_7601 ?auto_7600 ) ( OBJ-AT ?auto_7603 ?auto_7600 ) ( not ( = ?auto_7601 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7603 ) ) ( not ( = ?auto_7602 ?auto_7603 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7602 ?auto_7600 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7611 - OBJ
      ?auto_7612 - OBJ
      ?auto_7613 - OBJ
      ?auto_7610 - LOCATION
    )
    :vars
    (
      ?auto_7614 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7614 ?auto_7610 ) ( IN-TRUCK ?auto_7611 ?auto_7614 ) ( OBJ-AT ?auto_7612 ?auto_7610 ) ( OBJ-AT ?auto_7613 ?auto_7610 ) ( not ( = ?auto_7611 ?auto_7612 ) ) ( not ( = ?auto_7611 ?auto_7613 ) ) ( not ( = ?auto_7612 ?auto_7613 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7611 ?auto_7610 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7631 - OBJ
      ?auto_7630 - LOCATION
    )
    :vars
    (
      ?auto_7632 - TRUCK
      ?auto_7633 - LOCATION
      ?auto_7634 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7631 ?auto_7632 ) ( TRUCK-AT ?auto_7632 ?auto_7633 ) ( IN-CITY ?auto_7633 ?auto_7634 ) ( IN-CITY ?auto_7630 ?auto_7634 ) ( not ( = ?auto_7630 ?auto_7633 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7632 ?auto_7633 ?auto_7630 ?auto_7634 )
      ( DELIVER-1PKG ?auto_7631 ?auto_7630 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7636 - OBJ
      ?auto_7637 - OBJ
      ?auto_7635 - LOCATION
    )
    :vars
    (
      ?auto_7640 - TRUCK
      ?auto_7638 - LOCATION
      ?auto_7639 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7637 ?auto_7640 ) ( TRUCK-AT ?auto_7640 ?auto_7638 ) ( IN-CITY ?auto_7638 ?auto_7639 ) ( IN-CITY ?auto_7635 ?auto_7639 ) ( not ( = ?auto_7635 ?auto_7638 ) ) ( OBJ-AT ?auto_7636 ?auto_7635 ) ( not ( = ?auto_7636 ?auto_7637 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7637 ?auto_7635 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7642 - OBJ
      ?auto_7643 - OBJ
      ?auto_7641 - LOCATION
    )
    :vars
    (
      ?auto_7645 - TRUCK
      ?auto_7646 - LOCATION
      ?auto_7644 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7642 ?auto_7645 ) ( TRUCK-AT ?auto_7645 ?auto_7646 ) ( IN-CITY ?auto_7646 ?auto_7644 ) ( IN-CITY ?auto_7641 ?auto_7644 ) ( not ( = ?auto_7641 ?auto_7646 ) ) ( OBJ-AT ?auto_7643 ?auto_7641 ) ( not ( = ?auto_7643 ?auto_7642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7643 ?auto_7642 ?auto_7641 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7655 - OBJ
      ?auto_7656 - OBJ
      ?auto_7657 - OBJ
      ?auto_7654 - LOCATION
    )
    :vars
    (
      ?auto_7659 - TRUCK
      ?auto_7660 - LOCATION
      ?auto_7658 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7657 ?auto_7659 ) ( TRUCK-AT ?auto_7659 ?auto_7660 ) ( IN-CITY ?auto_7660 ?auto_7658 ) ( IN-CITY ?auto_7654 ?auto_7658 ) ( not ( = ?auto_7654 ?auto_7660 ) ) ( OBJ-AT ?auto_7656 ?auto_7654 ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( OBJ-AT ?auto_7655 ?auto_7654 ) ( not ( = ?auto_7655 ?auto_7656 ) ) ( not ( = ?auto_7655 ?auto_7657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7656 ?auto_7657 ?auto_7654 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7662 - OBJ
      ?auto_7663 - OBJ
      ?auto_7664 - OBJ
      ?auto_7661 - LOCATION
    )
    :vars
    (
      ?auto_7666 - TRUCK
      ?auto_7667 - LOCATION
      ?auto_7665 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7663 ?auto_7666 ) ( TRUCK-AT ?auto_7666 ?auto_7667 ) ( IN-CITY ?auto_7667 ?auto_7665 ) ( IN-CITY ?auto_7661 ?auto_7665 ) ( not ( = ?auto_7661 ?auto_7667 ) ) ( OBJ-AT ?auto_7662 ?auto_7661 ) ( not ( = ?auto_7662 ?auto_7663 ) ) ( OBJ-AT ?auto_7664 ?auto_7661 ) ( not ( = ?auto_7662 ?auto_7664 ) ) ( not ( = ?auto_7663 ?auto_7664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7662 ?auto_7663 ?auto_7661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7676 - OBJ
      ?auto_7677 - OBJ
      ?auto_7678 - OBJ
      ?auto_7675 - LOCATION
    )
    :vars
    (
      ?auto_7680 - TRUCK
      ?auto_7681 - LOCATION
      ?auto_7679 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7676 ?auto_7680 ) ( TRUCK-AT ?auto_7680 ?auto_7681 ) ( IN-CITY ?auto_7681 ?auto_7679 ) ( IN-CITY ?auto_7675 ?auto_7679 ) ( not ( = ?auto_7675 ?auto_7681 ) ) ( OBJ-AT ?auto_7677 ?auto_7675 ) ( not ( = ?auto_7677 ?auto_7676 ) ) ( OBJ-AT ?auto_7678 ?auto_7675 ) ( not ( = ?auto_7676 ?auto_7678 ) ) ( not ( = ?auto_7677 ?auto_7678 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7677 ?auto_7676 ?auto_7675 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7705 - OBJ
      ?auto_7704 - LOCATION
    )
    :vars
    (
      ?auto_7707 - TRUCK
      ?auto_7708 - LOCATION
      ?auto_7706 - CITY
      ?auto_7709 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7707 ?auto_7708 ) ( IN-CITY ?auto_7708 ?auto_7706 ) ( IN-CITY ?auto_7704 ?auto_7706 ) ( not ( = ?auto_7704 ?auto_7708 ) ) ( OBJ-AT ?auto_7709 ?auto_7704 ) ( not ( = ?auto_7709 ?auto_7705 ) ) ( OBJ-AT ?auto_7705 ?auto_7708 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7705 ?auto_7707 ?auto_7708 )
      ( DELIVER-2PKG ?auto_7709 ?auto_7705 ?auto_7704 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7711 - OBJ
      ?auto_7712 - OBJ
      ?auto_7710 - LOCATION
    )
    :vars
    (
      ?auto_7715 - TRUCK
      ?auto_7714 - LOCATION
      ?auto_7713 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7715 ?auto_7714 ) ( IN-CITY ?auto_7714 ?auto_7713 ) ( IN-CITY ?auto_7710 ?auto_7713 ) ( not ( = ?auto_7710 ?auto_7714 ) ) ( OBJ-AT ?auto_7711 ?auto_7710 ) ( not ( = ?auto_7711 ?auto_7712 ) ) ( OBJ-AT ?auto_7712 ?auto_7714 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7712 ?auto_7710 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7717 - OBJ
      ?auto_7718 - OBJ
      ?auto_7716 - LOCATION
    )
    :vars
    (
      ?auto_7721 - TRUCK
      ?auto_7720 - LOCATION
      ?auto_7719 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7721 ?auto_7720 ) ( IN-CITY ?auto_7720 ?auto_7719 ) ( IN-CITY ?auto_7716 ?auto_7719 ) ( not ( = ?auto_7716 ?auto_7720 ) ) ( OBJ-AT ?auto_7718 ?auto_7716 ) ( not ( = ?auto_7718 ?auto_7717 ) ) ( OBJ-AT ?auto_7717 ?auto_7720 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7718 ?auto_7717 ?auto_7716 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7730 - OBJ
      ?auto_7731 - OBJ
      ?auto_7732 - OBJ
      ?auto_7729 - LOCATION
    )
    :vars
    (
      ?auto_7735 - TRUCK
      ?auto_7734 - LOCATION
      ?auto_7733 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7735 ?auto_7734 ) ( IN-CITY ?auto_7734 ?auto_7733 ) ( IN-CITY ?auto_7729 ?auto_7733 ) ( not ( = ?auto_7729 ?auto_7734 ) ) ( OBJ-AT ?auto_7731 ?auto_7729 ) ( not ( = ?auto_7731 ?auto_7732 ) ) ( OBJ-AT ?auto_7732 ?auto_7734 ) ( OBJ-AT ?auto_7730 ?auto_7729 ) ( not ( = ?auto_7730 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7732 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7731 ?auto_7732 ?auto_7729 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7737 - OBJ
      ?auto_7738 - OBJ
      ?auto_7739 - OBJ
      ?auto_7736 - LOCATION
    )
    :vars
    (
      ?auto_7742 - TRUCK
      ?auto_7741 - LOCATION
      ?auto_7740 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7742 ?auto_7741 ) ( IN-CITY ?auto_7741 ?auto_7740 ) ( IN-CITY ?auto_7736 ?auto_7740 ) ( not ( = ?auto_7736 ?auto_7741 ) ) ( OBJ-AT ?auto_7739 ?auto_7736 ) ( not ( = ?auto_7739 ?auto_7738 ) ) ( OBJ-AT ?auto_7738 ?auto_7741 ) ( OBJ-AT ?auto_7737 ?auto_7736 ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( not ( = ?auto_7737 ?auto_7739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7739 ?auto_7738 ?auto_7736 ) )
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
      ?auto_7756 - TRUCK
      ?auto_7755 - LOCATION
      ?auto_7754 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7756 ?auto_7755 ) ( IN-CITY ?auto_7755 ?auto_7754 ) ( IN-CITY ?auto_7750 ?auto_7754 ) ( not ( = ?auto_7750 ?auto_7755 ) ) ( OBJ-AT ?auto_7752 ?auto_7750 ) ( not ( = ?auto_7752 ?auto_7751 ) ) ( OBJ-AT ?auto_7751 ?auto_7755 ) ( OBJ-AT ?auto_7753 ?auto_7750 ) ( not ( = ?auto_7751 ?auto_7753 ) ) ( not ( = ?auto_7752 ?auto_7753 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7752 ?auto_7751 ?auto_7750 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7780 - OBJ
      ?auto_7779 - LOCATION
    )
    :vars
    (
      ?auto_7782 - LOCATION
      ?auto_7781 - CITY
      ?auto_7784 - OBJ
      ?auto_7783 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7782 ?auto_7781 ) ( IN-CITY ?auto_7779 ?auto_7781 ) ( not ( = ?auto_7779 ?auto_7782 ) ) ( OBJ-AT ?auto_7784 ?auto_7779 ) ( not ( = ?auto_7784 ?auto_7780 ) ) ( OBJ-AT ?auto_7780 ?auto_7782 ) ( TRUCK-AT ?auto_7783 ?auto_7779 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7783 ?auto_7779 ?auto_7782 ?auto_7781 )
      ( DELIVER-2PKG ?auto_7784 ?auto_7780 ?auto_7779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7786 - OBJ
      ?auto_7787 - OBJ
      ?auto_7785 - LOCATION
    )
    :vars
    (
      ?auto_7790 - LOCATION
      ?auto_7788 - CITY
      ?auto_7789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7790 ?auto_7788 ) ( IN-CITY ?auto_7785 ?auto_7788 ) ( not ( = ?auto_7785 ?auto_7790 ) ) ( OBJ-AT ?auto_7786 ?auto_7785 ) ( not ( = ?auto_7786 ?auto_7787 ) ) ( OBJ-AT ?auto_7787 ?auto_7790 ) ( TRUCK-AT ?auto_7789 ?auto_7785 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7787 ?auto_7785 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7792 - OBJ
      ?auto_7793 - OBJ
      ?auto_7791 - LOCATION
    )
    :vars
    (
      ?auto_7796 - LOCATION
      ?auto_7795 - CITY
      ?auto_7794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7796 ?auto_7795 ) ( IN-CITY ?auto_7791 ?auto_7795 ) ( not ( = ?auto_7791 ?auto_7796 ) ) ( OBJ-AT ?auto_7793 ?auto_7791 ) ( not ( = ?auto_7793 ?auto_7792 ) ) ( OBJ-AT ?auto_7792 ?auto_7796 ) ( TRUCK-AT ?auto_7794 ?auto_7791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7793 ?auto_7792 ?auto_7791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7805 - OBJ
      ?auto_7806 - OBJ
      ?auto_7807 - OBJ
      ?auto_7804 - LOCATION
    )
    :vars
    (
      ?auto_7810 - LOCATION
      ?auto_7809 - CITY
      ?auto_7808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7810 ?auto_7809 ) ( IN-CITY ?auto_7804 ?auto_7809 ) ( not ( = ?auto_7804 ?auto_7810 ) ) ( OBJ-AT ?auto_7806 ?auto_7804 ) ( not ( = ?auto_7806 ?auto_7807 ) ) ( OBJ-AT ?auto_7807 ?auto_7810 ) ( TRUCK-AT ?auto_7808 ?auto_7804 ) ( OBJ-AT ?auto_7805 ?auto_7804 ) ( not ( = ?auto_7805 ?auto_7806 ) ) ( not ( = ?auto_7805 ?auto_7807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7806 ?auto_7807 ?auto_7804 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7812 - OBJ
      ?auto_7813 - OBJ
      ?auto_7814 - OBJ
      ?auto_7811 - LOCATION
    )
    :vars
    (
      ?auto_7817 - LOCATION
      ?auto_7816 - CITY
      ?auto_7815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7817 ?auto_7816 ) ( IN-CITY ?auto_7811 ?auto_7816 ) ( not ( = ?auto_7811 ?auto_7817 ) ) ( OBJ-AT ?auto_7812 ?auto_7811 ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( OBJ-AT ?auto_7813 ?auto_7817 ) ( TRUCK-AT ?auto_7815 ?auto_7811 ) ( OBJ-AT ?auto_7814 ?auto_7811 ) ( not ( = ?auto_7812 ?auto_7814 ) ) ( not ( = ?auto_7813 ?auto_7814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7812 ?auto_7813 ?auto_7811 ) )
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
      ?auto_7831 - LOCATION
      ?auto_7830 - CITY
      ?auto_7829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7831 ?auto_7830 ) ( IN-CITY ?auto_7825 ?auto_7830 ) ( not ( = ?auto_7825 ?auto_7831 ) ) ( OBJ-AT ?auto_7828 ?auto_7825 ) ( not ( = ?auto_7828 ?auto_7826 ) ) ( OBJ-AT ?auto_7826 ?auto_7831 ) ( TRUCK-AT ?auto_7829 ?auto_7825 ) ( OBJ-AT ?auto_7827 ?auto_7825 ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7827 ?auto_7828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7828 ?auto_7826 ?auto_7825 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7855 - OBJ
      ?auto_7854 - LOCATION
    )
    :vars
    (
      ?auto_7858 - LOCATION
      ?auto_7857 - CITY
      ?auto_7859 - OBJ
      ?auto_7856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7858 ?auto_7857 ) ( IN-CITY ?auto_7854 ?auto_7857 ) ( not ( = ?auto_7854 ?auto_7858 ) ) ( not ( = ?auto_7859 ?auto_7855 ) ) ( OBJ-AT ?auto_7855 ?auto_7858 ) ( TRUCK-AT ?auto_7856 ?auto_7854 ) ( IN-TRUCK ?auto_7859 ?auto_7856 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7859 ?auto_7854 )
      ( DELIVER-2PKG ?auto_7859 ?auto_7855 ?auto_7854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7861 - OBJ
      ?auto_7862 - OBJ
      ?auto_7860 - LOCATION
    )
    :vars
    (
      ?auto_7863 - LOCATION
      ?auto_7864 - CITY
      ?auto_7865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7863 ?auto_7864 ) ( IN-CITY ?auto_7860 ?auto_7864 ) ( not ( = ?auto_7860 ?auto_7863 ) ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( OBJ-AT ?auto_7862 ?auto_7863 ) ( TRUCK-AT ?auto_7865 ?auto_7860 ) ( IN-TRUCK ?auto_7861 ?auto_7865 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7862 ?auto_7860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7867 - OBJ
      ?auto_7868 - OBJ
      ?auto_7866 - LOCATION
    )
    :vars
    (
      ?auto_7869 - LOCATION
      ?auto_7870 - CITY
      ?auto_7871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7869 ?auto_7870 ) ( IN-CITY ?auto_7866 ?auto_7870 ) ( not ( = ?auto_7866 ?auto_7869 ) ) ( not ( = ?auto_7868 ?auto_7867 ) ) ( OBJ-AT ?auto_7867 ?auto_7869 ) ( TRUCK-AT ?auto_7871 ?auto_7866 ) ( IN-TRUCK ?auto_7868 ?auto_7871 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7868 ?auto_7867 ?auto_7866 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7930 - OBJ
      ?auto_7929 - LOCATION
    )
    :vars
    (
      ?auto_7932 - LOCATION
      ?auto_7933 - CITY
      ?auto_7931 - OBJ
      ?auto_7934 - TRUCK
      ?auto_7935 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7932 ?auto_7933 ) ( IN-CITY ?auto_7929 ?auto_7933 ) ( not ( = ?auto_7929 ?auto_7932 ) ) ( not ( = ?auto_7931 ?auto_7930 ) ) ( OBJ-AT ?auto_7930 ?auto_7932 ) ( IN-TRUCK ?auto_7931 ?auto_7934 ) ( TRUCK-AT ?auto_7934 ?auto_7935 ) ( IN-CITY ?auto_7935 ?auto_7933 ) ( not ( = ?auto_7929 ?auto_7935 ) ) ( not ( = ?auto_7932 ?auto_7935 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7934 ?auto_7935 ?auto_7929 ?auto_7933 )
      ( DELIVER-2PKG ?auto_7931 ?auto_7930 ?auto_7929 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7937 - OBJ
      ?auto_7938 - OBJ
      ?auto_7936 - LOCATION
    )
    :vars
    (
      ?auto_7941 - LOCATION
      ?auto_7940 - CITY
      ?auto_7942 - TRUCK
      ?auto_7939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7941 ?auto_7940 ) ( IN-CITY ?auto_7936 ?auto_7940 ) ( not ( = ?auto_7936 ?auto_7941 ) ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( OBJ-AT ?auto_7938 ?auto_7941 ) ( IN-TRUCK ?auto_7937 ?auto_7942 ) ( TRUCK-AT ?auto_7942 ?auto_7939 ) ( IN-CITY ?auto_7939 ?auto_7940 ) ( not ( = ?auto_7936 ?auto_7939 ) ) ( not ( = ?auto_7941 ?auto_7939 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7938 ?auto_7936 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7944 - OBJ
      ?auto_7945 - OBJ
      ?auto_7943 - LOCATION
    )
    :vars
    (
      ?auto_7948 - LOCATION
      ?auto_7946 - CITY
      ?auto_7947 - TRUCK
      ?auto_7949 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7948 ?auto_7946 ) ( IN-CITY ?auto_7943 ?auto_7946 ) ( not ( = ?auto_7943 ?auto_7948 ) ) ( not ( = ?auto_7945 ?auto_7944 ) ) ( OBJ-AT ?auto_7944 ?auto_7948 ) ( IN-TRUCK ?auto_7945 ?auto_7947 ) ( TRUCK-AT ?auto_7947 ?auto_7949 ) ( IN-CITY ?auto_7949 ?auto_7946 ) ( not ( = ?auto_7943 ?auto_7949 ) ) ( not ( = ?auto_7948 ?auto_7949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7945 ?auto_7944 ?auto_7943 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8016 - OBJ
      ?auto_8015 - LOCATION
    )
    :vars
    (
      ?auto_8020 - LOCATION
      ?auto_8018 - CITY
      ?auto_8017 - OBJ
      ?auto_8019 - TRUCK
      ?auto_8021 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8020 ?auto_8018 ) ( IN-CITY ?auto_8015 ?auto_8018 ) ( not ( = ?auto_8015 ?auto_8020 ) ) ( not ( = ?auto_8017 ?auto_8016 ) ) ( OBJ-AT ?auto_8016 ?auto_8020 ) ( TRUCK-AT ?auto_8019 ?auto_8021 ) ( IN-CITY ?auto_8021 ?auto_8018 ) ( not ( = ?auto_8015 ?auto_8021 ) ) ( not ( = ?auto_8020 ?auto_8021 ) ) ( OBJ-AT ?auto_8017 ?auto_8021 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8017 ?auto_8019 ?auto_8021 )
      ( DELIVER-2PKG ?auto_8017 ?auto_8016 ?auto_8015 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8023 - OBJ
      ?auto_8024 - OBJ
      ?auto_8022 - LOCATION
    )
    :vars
    (
      ?auto_8028 - LOCATION
      ?auto_8026 - CITY
      ?auto_8025 - TRUCK
      ?auto_8027 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8028 ?auto_8026 ) ( IN-CITY ?auto_8022 ?auto_8026 ) ( not ( = ?auto_8022 ?auto_8028 ) ) ( not ( = ?auto_8023 ?auto_8024 ) ) ( OBJ-AT ?auto_8024 ?auto_8028 ) ( TRUCK-AT ?auto_8025 ?auto_8027 ) ( IN-CITY ?auto_8027 ?auto_8026 ) ( not ( = ?auto_8022 ?auto_8027 ) ) ( not ( = ?auto_8028 ?auto_8027 ) ) ( OBJ-AT ?auto_8023 ?auto_8027 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8024 ?auto_8022 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8030 - OBJ
      ?auto_8031 - OBJ
      ?auto_8029 - LOCATION
    )
    :vars
    (
      ?auto_8033 - LOCATION
      ?auto_8035 - CITY
      ?auto_8032 - TRUCK
      ?auto_8034 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8033 ?auto_8035 ) ( IN-CITY ?auto_8029 ?auto_8035 ) ( not ( = ?auto_8029 ?auto_8033 ) ) ( not ( = ?auto_8031 ?auto_8030 ) ) ( OBJ-AT ?auto_8030 ?auto_8033 ) ( TRUCK-AT ?auto_8032 ?auto_8034 ) ( IN-CITY ?auto_8034 ?auto_8035 ) ( not ( = ?auto_8029 ?auto_8034 ) ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( OBJ-AT ?auto_8031 ?auto_8034 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8031 ?auto_8030 ?auto_8029 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8102 - OBJ
      ?auto_8101 - LOCATION
    )
    :vars
    (
      ?auto_8104 - LOCATION
      ?auto_8107 - CITY
      ?auto_8105 - OBJ
      ?auto_8106 - LOCATION
      ?auto_8103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8104 ?auto_8107 ) ( IN-CITY ?auto_8101 ?auto_8107 ) ( not ( = ?auto_8101 ?auto_8104 ) ) ( not ( = ?auto_8105 ?auto_8102 ) ) ( OBJ-AT ?auto_8102 ?auto_8104 ) ( IN-CITY ?auto_8106 ?auto_8107 ) ( not ( = ?auto_8101 ?auto_8106 ) ) ( not ( = ?auto_8104 ?auto_8106 ) ) ( OBJ-AT ?auto_8105 ?auto_8106 ) ( TRUCK-AT ?auto_8103 ?auto_8101 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8103 ?auto_8101 ?auto_8106 ?auto_8107 )
      ( DELIVER-2PKG ?auto_8105 ?auto_8102 ?auto_8101 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8109 - OBJ
      ?auto_8110 - OBJ
      ?auto_8108 - LOCATION
    )
    :vars
    (
      ?auto_8112 - LOCATION
      ?auto_8113 - CITY
      ?auto_8114 - LOCATION
      ?auto_8111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8112 ?auto_8113 ) ( IN-CITY ?auto_8108 ?auto_8113 ) ( not ( = ?auto_8108 ?auto_8112 ) ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( OBJ-AT ?auto_8110 ?auto_8112 ) ( IN-CITY ?auto_8114 ?auto_8113 ) ( not ( = ?auto_8108 ?auto_8114 ) ) ( not ( = ?auto_8112 ?auto_8114 ) ) ( OBJ-AT ?auto_8109 ?auto_8114 ) ( TRUCK-AT ?auto_8111 ?auto_8108 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8110 ?auto_8108 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8116 - OBJ
      ?auto_8117 - OBJ
      ?auto_8115 - LOCATION
    )
    :vars
    (
      ?auto_8121 - LOCATION
      ?auto_8119 - CITY
      ?auto_8120 - LOCATION
      ?auto_8118 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8121 ?auto_8119 ) ( IN-CITY ?auto_8115 ?auto_8119 ) ( not ( = ?auto_8115 ?auto_8121 ) ) ( not ( = ?auto_8117 ?auto_8116 ) ) ( OBJ-AT ?auto_8116 ?auto_8121 ) ( IN-CITY ?auto_8120 ?auto_8119 ) ( not ( = ?auto_8115 ?auto_8120 ) ) ( not ( = ?auto_8121 ?auto_8120 ) ) ( OBJ-AT ?auto_8117 ?auto_8120 ) ( TRUCK-AT ?auto_8118 ?auto_8115 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8117 ?auto_8116 ?auto_8115 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8281 - OBJ
      ?auto_8280 - LOCATION
    )
    :vars
    (
      ?auto_8282 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8282 ?auto_8280 ) ( IN-TRUCK ?auto_8281 ?auto_8282 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_8281 ?auto_8282 ?auto_8280 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8284 - OBJ
      ?auto_8285 - OBJ
      ?auto_8283 - LOCATION
    )
    :vars
    (
      ?auto_8286 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8286 ?auto_8283 ) ( IN-TRUCK ?auto_8285 ?auto_8286 ) ( OBJ-AT ?auto_8284 ?auto_8283 ) ( not ( = ?auto_8284 ?auto_8285 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8285 ?auto_8283 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8288 - OBJ
      ?auto_8289 - OBJ
      ?auto_8287 - LOCATION
    )
    :vars
    (
      ?auto_8290 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8290 ?auto_8287 ) ( IN-TRUCK ?auto_8289 ?auto_8290 ) ( OBJ-AT ?auto_8288 ?auto_8287 ) ( not ( = ?auto_8288 ?auto_8289 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8289 ?auto_8287 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8292 - OBJ
      ?auto_8293 - OBJ
      ?auto_8291 - LOCATION
    )
    :vars
    (
      ?auto_8294 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8294 ?auto_8291 ) ( IN-TRUCK ?auto_8292 ?auto_8294 ) ( OBJ-AT ?auto_8293 ?auto_8291 ) ( not ( = ?auto_8292 ?auto_8293 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8292 ?auto_8291 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8296 - OBJ
      ?auto_8297 - OBJ
      ?auto_8295 - LOCATION
    )
    :vars
    (
      ?auto_8298 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8298 ?auto_8295 ) ( IN-TRUCK ?auto_8296 ?auto_8298 ) ( OBJ-AT ?auto_8297 ?auto_8295 ) ( not ( = ?auto_8296 ?auto_8297 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8296 ?auto_8295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8304 - OBJ
      ?auto_8305 - OBJ
      ?auto_8306 - OBJ
      ?auto_8303 - LOCATION
    )
    :vars
    (
      ?auto_8307 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8307 ?auto_8303 ) ( IN-TRUCK ?auto_8306 ?auto_8307 ) ( OBJ-AT ?auto_8304 ?auto_8303 ) ( OBJ-AT ?auto_8305 ?auto_8303 ) ( not ( = ?auto_8304 ?auto_8305 ) ) ( not ( = ?auto_8304 ?auto_8306 ) ) ( not ( = ?auto_8305 ?auto_8306 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8306 ?auto_8303 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8309 - OBJ
      ?auto_8310 - OBJ
      ?auto_8311 - OBJ
      ?auto_8308 - LOCATION
    )
    :vars
    (
      ?auto_8312 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8312 ?auto_8308 ) ( IN-TRUCK ?auto_8311 ?auto_8312 ) ( OBJ-AT ?auto_8309 ?auto_8308 ) ( OBJ-AT ?auto_8310 ?auto_8308 ) ( not ( = ?auto_8309 ?auto_8310 ) ) ( not ( = ?auto_8309 ?auto_8311 ) ) ( not ( = ?auto_8310 ?auto_8311 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8311 ?auto_8308 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8314 - OBJ
      ?auto_8315 - OBJ
      ?auto_8316 - OBJ
      ?auto_8313 - LOCATION
    )
    :vars
    (
      ?auto_8317 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8317 ?auto_8313 ) ( IN-TRUCK ?auto_8315 ?auto_8317 ) ( OBJ-AT ?auto_8314 ?auto_8313 ) ( OBJ-AT ?auto_8316 ?auto_8313 ) ( not ( = ?auto_8314 ?auto_8315 ) ) ( not ( = ?auto_8314 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8316 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8315 ?auto_8313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8319 - OBJ
      ?auto_8320 - OBJ
      ?auto_8321 - OBJ
      ?auto_8318 - LOCATION
    )
    :vars
    (
      ?auto_8322 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8322 ?auto_8318 ) ( IN-TRUCK ?auto_8320 ?auto_8322 ) ( OBJ-AT ?auto_8319 ?auto_8318 ) ( OBJ-AT ?auto_8321 ?auto_8318 ) ( not ( = ?auto_8319 ?auto_8320 ) ) ( not ( = ?auto_8319 ?auto_8321 ) ) ( not ( = ?auto_8320 ?auto_8321 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8320 ?auto_8318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8329 - OBJ
      ?auto_8330 - OBJ
      ?auto_8331 - OBJ
      ?auto_8328 - LOCATION
    )
    :vars
    (
      ?auto_8332 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8332 ?auto_8328 ) ( IN-TRUCK ?auto_8331 ?auto_8332 ) ( OBJ-AT ?auto_8329 ?auto_8328 ) ( OBJ-AT ?auto_8330 ?auto_8328 ) ( not ( = ?auto_8329 ?auto_8330 ) ) ( not ( = ?auto_8329 ?auto_8331 ) ) ( not ( = ?auto_8330 ?auto_8331 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8331 ?auto_8328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8334 - OBJ
      ?auto_8335 - OBJ
      ?auto_8336 - OBJ
      ?auto_8333 - LOCATION
    )
    :vars
    (
      ?auto_8337 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8337 ?auto_8333 ) ( IN-TRUCK ?auto_8336 ?auto_8337 ) ( OBJ-AT ?auto_8334 ?auto_8333 ) ( OBJ-AT ?auto_8335 ?auto_8333 ) ( not ( = ?auto_8334 ?auto_8335 ) ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8335 ?auto_8336 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8336 ?auto_8333 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8339 - OBJ
      ?auto_8340 - OBJ
      ?auto_8341 - OBJ
      ?auto_8338 - LOCATION
    )
    :vars
    (
      ?auto_8342 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8342 ?auto_8338 ) ( IN-TRUCK ?auto_8340 ?auto_8342 ) ( OBJ-AT ?auto_8339 ?auto_8338 ) ( OBJ-AT ?auto_8341 ?auto_8338 ) ( not ( = ?auto_8339 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8341 ) ) ( not ( = ?auto_8340 ?auto_8341 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8340 ?auto_8338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8344 - OBJ
      ?auto_8345 - OBJ
      ?auto_8346 - OBJ
      ?auto_8343 - LOCATION
    )
    :vars
    (
      ?auto_8347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8347 ?auto_8343 ) ( IN-TRUCK ?auto_8345 ?auto_8347 ) ( OBJ-AT ?auto_8344 ?auto_8343 ) ( OBJ-AT ?auto_8346 ?auto_8343 ) ( not ( = ?auto_8344 ?auto_8345 ) ) ( not ( = ?auto_8344 ?auto_8346 ) ) ( not ( = ?auto_8345 ?auto_8346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8345 ?auto_8343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8354 - OBJ
      ?auto_8355 - OBJ
      ?auto_8356 - OBJ
      ?auto_8353 - LOCATION
    )
    :vars
    (
      ?auto_8357 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8357 ?auto_8353 ) ( IN-TRUCK ?auto_8354 ?auto_8357 ) ( OBJ-AT ?auto_8355 ?auto_8353 ) ( OBJ-AT ?auto_8356 ?auto_8353 ) ( not ( = ?auto_8354 ?auto_8355 ) ) ( not ( = ?auto_8354 ?auto_8356 ) ) ( not ( = ?auto_8355 ?auto_8356 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8354 ?auto_8353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8359 - OBJ
      ?auto_8360 - OBJ
      ?auto_8361 - OBJ
      ?auto_8358 - LOCATION
    )
    :vars
    (
      ?auto_8362 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8362 ?auto_8358 ) ( IN-TRUCK ?auto_8359 ?auto_8362 ) ( OBJ-AT ?auto_8360 ?auto_8358 ) ( OBJ-AT ?auto_8361 ?auto_8358 ) ( not ( = ?auto_8359 ?auto_8360 ) ) ( not ( = ?auto_8359 ?auto_8361 ) ) ( not ( = ?auto_8360 ?auto_8361 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8359 ?auto_8358 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8369 - OBJ
      ?auto_8370 - OBJ
      ?auto_8371 - OBJ
      ?auto_8368 - LOCATION
    )
    :vars
    (
      ?auto_8372 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8372 ?auto_8368 ) ( IN-TRUCK ?auto_8369 ?auto_8372 ) ( OBJ-AT ?auto_8370 ?auto_8368 ) ( OBJ-AT ?auto_8371 ?auto_8368 ) ( not ( = ?auto_8369 ?auto_8370 ) ) ( not ( = ?auto_8369 ?auto_8371 ) ) ( not ( = ?auto_8370 ?auto_8371 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8369 ?auto_8368 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8374 - OBJ
      ?auto_8375 - OBJ
      ?auto_8376 - OBJ
      ?auto_8373 - LOCATION
    )
    :vars
    (
      ?auto_8377 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8377 ?auto_8373 ) ( IN-TRUCK ?auto_8374 ?auto_8377 ) ( OBJ-AT ?auto_8375 ?auto_8373 ) ( OBJ-AT ?auto_8376 ?auto_8373 ) ( not ( = ?auto_8374 ?auto_8375 ) ) ( not ( = ?auto_8374 ?auto_8376 ) ) ( not ( = ?auto_8375 ?auto_8376 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8374 ?auto_8373 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8399 - OBJ
      ?auto_8398 - LOCATION
    )
    :vars
    (
      ?auto_8400 - TRUCK
      ?auto_8401 - LOCATION
      ?auto_8402 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8399 ?auto_8400 ) ( TRUCK-AT ?auto_8400 ?auto_8401 ) ( IN-CITY ?auto_8401 ?auto_8402 ) ( IN-CITY ?auto_8398 ?auto_8402 ) ( not ( = ?auto_8398 ?auto_8401 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8400 ?auto_8401 ?auto_8398 ?auto_8402 )
      ( DELIVER-1PKG ?auto_8399 ?auto_8398 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8404 - OBJ
      ?auto_8405 - OBJ
      ?auto_8403 - LOCATION
    )
    :vars
    (
      ?auto_8407 - TRUCK
      ?auto_8406 - LOCATION
      ?auto_8408 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8405 ?auto_8407 ) ( TRUCK-AT ?auto_8407 ?auto_8406 ) ( IN-CITY ?auto_8406 ?auto_8408 ) ( IN-CITY ?auto_8403 ?auto_8408 ) ( not ( = ?auto_8403 ?auto_8406 ) ) ( OBJ-AT ?auto_8404 ?auto_8403 ) ( not ( = ?auto_8404 ?auto_8405 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8405 ?auto_8403 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8410 - OBJ
      ?auto_8411 - OBJ
      ?auto_8409 - LOCATION
    )
    :vars
    (
      ?auto_8413 - TRUCK
      ?auto_8412 - LOCATION
      ?auto_8414 - CITY
      ?auto_8415 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8411 ?auto_8413 ) ( TRUCK-AT ?auto_8413 ?auto_8412 ) ( IN-CITY ?auto_8412 ?auto_8414 ) ( IN-CITY ?auto_8409 ?auto_8414 ) ( not ( = ?auto_8409 ?auto_8412 ) ) ( OBJ-AT ?auto_8415 ?auto_8409 ) ( not ( = ?auto_8415 ?auto_8411 ) ) ( OBJ-AT ?auto_8410 ?auto_8409 ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( not ( = ?auto_8410 ?auto_8415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8415 ?auto_8411 ?auto_8409 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8417 - OBJ
      ?auto_8418 - OBJ
      ?auto_8416 - LOCATION
    )
    :vars
    (
      ?auto_8420 - TRUCK
      ?auto_8419 - LOCATION
      ?auto_8421 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8417 ?auto_8420 ) ( TRUCK-AT ?auto_8420 ?auto_8419 ) ( IN-CITY ?auto_8419 ?auto_8421 ) ( IN-CITY ?auto_8416 ?auto_8421 ) ( not ( = ?auto_8416 ?auto_8419 ) ) ( OBJ-AT ?auto_8418 ?auto_8416 ) ( not ( = ?auto_8418 ?auto_8417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8418 ?auto_8417 ?auto_8416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8423 - OBJ
      ?auto_8424 - OBJ
      ?auto_8422 - LOCATION
    )
    :vars
    (
      ?auto_8426 - TRUCK
      ?auto_8425 - LOCATION
      ?auto_8427 - CITY
      ?auto_8428 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8423 ?auto_8426 ) ( TRUCK-AT ?auto_8426 ?auto_8425 ) ( IN-CITY ?auto_8425 ?auto_8427 ) ( IN-CITY ?auto_8422 ?auto_8427 ) ( not ( = ?auto_8422 ?auto_8425 ) ) ( OBJ-AT ?auto_8428 ?auto_8422 ) ( not ( = ?auto_8428 ?auto_8423 ) ) ( OBJ-AT ?auto_8424 ?auto_8422 ) ( not ( = ?auto_8423 ?auto_8424 ) ) ( not ( = ?auto_8424 ?auto_8428 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8428 ?auto_8423 ?auto_8422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8437 - OBJ
      ?auto_8438 - OBJ
      ?auto_8439 - OBJ
      ?auto_8436 - LOCATION
    )
    :vars
    (
      ?auto_8441 - TRUCK
      ?auto_8440 - LOCATION
      ?auto_8442 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8439 ?auto_8441 ) ( TRUCK-AT ?auto_8441 ?auto_8440 ) ( IN-CITY ?auto_8440 ?auto_8442 ) ( IN-CITY ?auto_8436 ?auto_8442 ) ( not ( = ?auto_8436 ?auto_8440 ) ) ( OBJ-AT ?auto_8437 ?auto_8436 ) ( not ( = ?auto_8437 ?auto_8439 ) ) ( OBJ-AT ?auto_8438 ?auto_8436 ) ( not ( = ?auto_8437 ?auto_8438 ) ) ( not ( = ?auto_8438 ?auto_8439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8437 ?auto_8439 ?auto_8436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8444 - OBJ
      ?auto_8445 - OBJ
      ?auto_8446 - OBJ
      ?auto_8443 - LOCATION
    )
    :vars
    (
      ?auto_8448 - TRUCK
      ?auto_8447 - LOCATION
      ?auto_8449 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8446 ?auto_8448 ) ( TRUCK-AT ?auto_8448 ?auto_8447 ) ( IN-CITY ?auto_8447 ?auto_8449 ) ( IN-CITY ?auto_8443 ?auto_8449 ) ( not ( = ?auto_8443 ?auto_8447 ) ) ( OBJ-AT ?auto_8444 ?auto_8443 ) ( not ( = ?auto_8444 ?auto_8446 ) ) ( OBJ-AT ?auto_8445 ?auto_8443 ) ( not ( = ?auto_8444 ?auto_8445 ) ) ( not ( = ?auto_8445 ?auto_8446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8444 ?auto_8446 ?auto_8443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8451 - OBJ
      ?auto_8452 - OBJ
      ?auto_8453 - OBJ
      ?auto_8450 - LOCATION
    )
    :vars
    (
      ?auto_8455 - TRUCK
      ?auto_8454 - LOCATION
      ?auto_8456 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8452 ?auto_8455 ) ( TRUCK-AT ?auto_8455 ?auto_8454 ) ( IN-CITY ?auto_8454 ?auto_8456 ) ( IN-CITY ?auto_8450 ?auto_8456 ) ( not ( = ?auto_8450 ?auto_8454 ) ) ( OBJ-AT ?auto_8453 ?auto_8450 ) ( not ( = ?auto_8453 ?auto_8452 ) ) ( OBJ-AT ?auto_8451 ?auto_8450 ) ( not ( = ?auto_8451 ?auto_8452 ) ) ( not ( = ?auto_8451 ?auto_8453 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8453 ?auto_8452 ?auto_8450 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8458 - OBJ
      ?auto_8459 - OBJ
      ?auto_8460 - OBJ
      ?auto_8457 - LOCATION
    )
    :vars
    (
      ?auto_8462 - TRUCK
      ?auto_8461 - LOCATION
      ?auto_8463 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8459 ?auto_8462 ) ( TRUCK-AT ?auto_8462 ?auto_8461 ) ( IN-CITY ?auto_8461 ?auto_8463 ) ( IN-CITY ?auto_8457 ?auto_8463 ) ( not ( = ?auto_8457 ?auto_8461 ) ) ( OBJ-AT ?auto_8458 ?auto_8457 ) ( not ( = ?auto_8458 ?auto_8459 ) ) ( OBJ-AT ?auto_8460 ?auto_8457 ) ( not ( = ?auto_8458 ?auto_8460 ) ) ( not ( = ?auto_8459 ?auto_8460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8458 ?auto_8459 ?auto_8457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8472 - OBJ
      ?auto_8473 - OBJ
      ?auto_8474 - OBJ
      ?auto_8471 - LOCATION
    )
    :vars
    (
      ?auto_8476 - TRUCK
      ?auto_8475 - LOCATION
      ?auto_8477 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8474 ?auto_8476 ) ( TRUCK-AT ?auto_8476 ?auto_8475 ) ( IN-CITY ?auto_8475 ?auto_8477 ) ( IN-CITY ?auto_8471 ?auto_8477 ) ( not ( = ?auto_8471 ?auto_8475 ) ) ( OBJ-AT ?auto_8473 ?auto_8471 ) ( not ( = ?auto_8473 ?auto_8474 ) ) ( OBJ-AT ?auto_8472 ?auto_8471 ) ( not ( = ?auto_8472 ?auto_8473 ) ) ( not ( = ?auto_8472 ?auto_8474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8473 ?auto_8474 ?auto_8471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8479 - OBJ
      ?auto_8480 - OBJ
      ?auto_8481 - OBJ
      ?auto_8478 - LOCATION
    )
    :vars
    (
      ?auto_8483 - TRUCK
      ?auto_8482 - LOCATION
      ?auto_8484 - CITY
      ?auto_8485 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8481 ?auto_8483 ) ( TRUCK-AT ?auto_8483 ?auto_8482 ) ( IN-CITY ?auto_8482 ?auto_8484 ) ( IN-CITY ?auto_8478 ?auto_8484 ) ( not ( = ?auto_8478 ?auto_8482 ) ) ( OBJ-AT ?auto_8485 ?auto_8478 ) ( not ( = ?auto_8485 ?auto_8481 ) ) ( OBJ-AT ?auto_8479 ?auto_8478 ) ( OBJ-AT ?auto_8480 ?auto_8478 ) ( not ( = ?auto_8479 ?auto_8480 ) ) ( not ( = ?auto_8479 ?auto_8481 ) ) ( not ( = ?auto_8479 ?auto_8485 ) ) ( not ( = ?auto_8480 ?auto_8481 ) ) ( not ( = ?auto_8480 ?auto_8485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8485 ?auto_8481 ?auto_8478 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8487 - OBJ
      ?auto_8488 - OBJ
      ?auto_8489 - OBJ
      ?auto_8486 - LOCATION
    )
    :vars
    (
      ?auto_8491 - TRUCK
      ?auto_8490 - LOCATION
      ?auto_8492 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8488 ?auto_8491 ) ( TRUCK-AT ?auto_8491 ?auto_8490 ) ( IN-CITY ?auto_8490 ?auto_8492 ) ( IN-CITY ?auto_8486 ?auto_8492 ) ( not ( = ?auto_8486 ?auto_8490 ) ) ( OBJ-AT ?auto_8489 ?auto_8486 ) ( not ( = ?auto_8489 ?auto_8488 ) ) ( OBJ-AT ?auto_8487 ?auto_8486 ) ( not ( = ?auto_8487 ?auto_8488 ) ) ( not ( = ?auto_8487 ?auto_8489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8489 ?auto_8488 ?auto_8486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8494 - OBJ
      ?auto_8495 - OBJ
      ?auto_8496 - OBJ
      ?auto_8493 - LOCATION
    )
    :vars
    (
      ?auto_8498 - TRUCK
      ?auto_8497 - LOCATION
      ?auto_8499 - CITY
      ?auto_8500 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8495 ?auto_8498 ) ( TRUCK-AT ?auto_8498 ?auto_8497 ) ( IN-CITY ?auto_8497 ?auto_8499 ) ( IN-CITY ?auto_8493 ?auto_8499 ) ( not ( = ?auto_8493 ?auto_8497 ) ) ( OBJ-AT ?auto_8500 ?auto_8493 ) ( not ( = ?auto_8500 ?auto_8495 ) ) ( OBJ-AT ?auto_8494 ?auto_8493 ) ( OBJ-AT ?auto_8496 ?auto_8493 ) ( not ( = ?auto_8494 ?auto_8495 ) ) ( not ( = ?auto_8494 ?auto_8496 ) ) ( not ( = ?auto_8494 ?auto_8500 ) ) ( not ( = ?auto_8495 ?auto_8496 ) ) ( not ( = ?auto_8496 ?auto_8500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8500 ?auto_8495 ?auto_8493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8510 - OBJ
      ?auto_8511 - OBJ
      ?auto_8512 - OBJ
      ?auto_8509 - LOCATION
    )
    :vars
    (
      ?auto_8514 - TRUCK
      ?auto_8513 - LOCATION
      ?auto_8515 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8510 ?auto_8514 ) ( TRUCK-AT ?auto_8514 ?auto_8513 ) ( IN-CITY ?auto_8513 ?auto_8515 ) ( IN-CITY ?auto_8509 ?auto_8515 ) ( not ( = ?auto_8509 ?auto_8513 ) ) ( OBJ-AT ?auto_8511 ?auto_8509 ) ( not ( = ?auto_8511 ?auto_8510 ) ) ( OBJ-AT ?auto_8512 ?auto_8509 ) ( not ( = ?auto_8510 ?auto_8512 ) ) ( not ( = ?auto_8511 ?auto_8512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8511 ?auto_8510 ?auto_8509 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8517 - OBJ
      ?auto_8518 - OBJ
      ?auto_8519 - OBJ
      ?auto_8516 - LOCATION
    )
    :vars
    (
      ?auto_8521 - TRUCK
      ?auto_8520 - LOCATION
      ?auto_8522 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8517 ?auto_8521 ) ( TRUCK-AT ?auto_8521 ?auto_8520 ) ( IN-CITY ?auto_8520 ?auto_8522 ) ( IN-CITY ?auto_8516 ?auto_8522 ) ( not ( = ?auto_8516 ?auto_8520 ) ) ( OBJ-AT ?auto_8518 ?auto_8516 ) ( not ( = ?auto_8518 ?auto_8517 ) ) ( OBJ-AT ?auto_8519 ?auto_8516 ) ( not ( = ?auto_8517 ?auto_8519 ) ) ( not ( = ?auto_8518 ?auto_8519 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8518 ?auto_8517 ?auto_8516 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8531 - OBJ
      ?auto_8532 - OBJ
      ?auto_8533 - OBJ
      ?auto_8530 - LOCATION
    )
    :vars
    (
      ?auto_8535 - TRUCK
      ?auto_8534 - LOCATION
      ?auto_8536 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8531 ?auto_8535 ) ( TRUCK-AT ?auto_8535 ?auto_8534 ) ( IN-CITY ?auto_8534 ?auto_8536 ) ( IN-CITY ?auto_8530 ?auto_8536 ) ( not ( = ?auto_8530 ?auto_8534 ) ) ( OBJ-AT ?auto_8533 ?auto_8530 ) ( not ( = ?auto_8533 ?auto_8531 ) ) ( OBJ-AT ?auto_8532 ?auto_8530 ) ( not ( = ?auto_8531 ?auto_8532 ) ) ( not ( = ?auto_8532 ?auto_8533 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8533 ?auto_8531 ?auto_8530 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8538 - OBJ
      ?auto_8539 - OBJ
      ?auto_8540 - OBJ
      ?auto_8537 - LOCATION
    )
    :vars
    (
      ?auto_8542 - TRUCK
      ?auto_8541 - LOCATION
      ?auto_8543 - CITY
      ?auto_8544 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8538 ?auto_8542 ) ( TRUCK-AT ?auto_8542 ?auto_8541 ) ( IN-CITY ?auto_8541 ?auto_8543 ) ( IN-CITY ?auto_8537 ?auto_8543 ) ( not ( = ?auto_8537 ?auto_8541 ) ) ( OBJ-AT ?auto_8544 ?auto_8537 ) ( not ( = ?auto_8544 ?auto_8538 ) ) ( OBJ-AT ?auto_8539 ?auto_8537 ) ( OBJ-AT ?auto_8540 ?auto_8537 ) ( not ( = ?auto_8538 ?auto_8539 ) ) ( not ( = ?auto_8538 ?auto_8540 ) ) ( not ( = ?auto_8539 ?auto_8540 ) ) ( not ( = ?auto_8539 ?auto_8544 ) ) ( not ( = ?auto_8540 ?auto_8544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8544 ?auto_8538 ?auto_8537 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8577 - OBJ
      ?auto_8576 - LOCATION
    )
    :vars
    (
      ?auto_8579 - TRUCK
      ?auto_8578 - LOCATION
      ?auto_8580 - CITY
      ?auto_8581 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8579 ?auto_8578 ) ( IN-CITY ?auto_8578 ?auto_8580 ) ( IN-CITY ?auto_8576 ?auto_8580 ) ( not ( = ?auto_8576 ?auto_8578 ) ) ( OBJ-AT ?auto_8581 ?auto_8576 ) ( not ( = ?auto_8581 ?auto_8577 ) ) ( OBJ-AT ?auto_8577 ?auto_8578 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8577 ?auto_8579 ?auto_8578 )
      ( DELIVER-2PKG ?auto_8581 ?auto_8577 ?auto_8576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8583 - OBJ
      ?auto_8584 - OBJ
      ?auto_8582 - LOCATION
    )
    :vars
    (
      ?auto_8586 - TRUCK
      ?auto_8587 - LOCATION
      ?auto_8585 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8586 ?auto_8587 ) ( IN-CITY ?auto_8587 ?auto_8585 ) ( IN-CITY ?auto_8582 ?auto_8585 ) ( not ( = ?auto_8582 ?auto_8587 ) ) ( OBJ-AT ?auto_8583 ?auto_8582 ) ( not ( = ?auto_8583 ?auto_8584 ) ) ( OBJ-AT ?auto_8584 ?auto_8587 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8584 ?auto_8582 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8589 - OBJ
      ?auto_8590 - OBJ
      ?auto_8588 - LOCATION
    )
    :vars
    (
      ?auto_8592 - TRUCK
      ?auto_8591 - LOCATION
      ?auto_8593 - CITY
      ?auto_8594 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8592 ?auto_8591 ) ( IN-CITY ?auto_8591 ?auto_8593 ) ( IN-CITY ?auto_8588 ?auto_8593 ) ( not ( = ?auto_8588 ?auto_8591 ) ) ( OBJ-AT ?auto_8594 ?auto_8588 ) ( not ( = ?auto_8594 ?auto_8590 ) ) ( OBJ-AT ?auto_8590 ?auto_8591 ) ( OBJ-AT ?auto_8589 ?auto_8588 ) ( not ( = ?auto_8589 ?auto_8590 ) ) ( not ( = ?auto_8589 ?auto_8594 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8594 ?auto_8590 ?auto_8588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8596 - OBJ
      ?auto_8597 - OBJ
      ?auto_8595 - LOCATION
    )
    :vars
    (
      ?auto_8599 - TRUCK
      ?auto_8598 - LOCATION
      ?auto_8600 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8599 ?auto_8598 ) ( IN-CITY ?auto_8598 ?auto_8600 ) ( IN-CITY ?auto_8595 ?auto_8600 ) ( not ( = ?auto_8595 ?auto_8598 ) ) ( OBJ-AT ?auto_8597 ?auto_8595 ) ( not ( = ?auto_8597 ?auto_8596 ) ) ( OBJ-AT ?auto_8596 ?auto_8598 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8597 ?auto_8596 ?auto_8595 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8602 - OBJ
      ?auto_8603 - OBJ
      ?auto_8601 - LOCATION
    )
    :vars
    (
      ?auto_8605 - TRUCK
      ?auto_8604 - LOCATION
      ?auto_8606 - CITY
      ?auto_8607 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8605 ?auto_8604 ) ( IN-CITY ?auto_8604 ?auto_8606 ) ( IN-CITY ?auto_8601 ?auto_8606 ) ( not ( = ?auto_8601 ?auto_8604 ) ) ( OBJ-AT ?auto_8607 ?auto_8601 ) ( not ( = ?auto_8607 ?auto_8602 ) ) ( OBJ-AT ?auto_8602 ?auto_8604 ) ( OBJ-AT ?auto_8603 ?auto_8601 ) ( not ( = ?auto_8602 ?auto_8603 ) ) ( not ( = ?auto_8603 ?auto_8607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8607 ?auto_8602 ?auto_8601 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8616 - OBJ
      ?auto_8617 - OBJ
      ?auto_8618 - OBJ
      ?auto_8615 - LOCATION
    )
    :vars
    (
      ?auto_8620 - TRUCK
      ?auto_8619 - LOCATION
      ?auto_8621 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8620 ?auto_8619 ) ( IN-CITY ?auto_8619 ?auto_8621 ) ( IN-CITY ?auto_8615 ?auto_8621 ) ( not ( = ?auto_8615 ?auto_8619 ) ) ( OBJ-AT ?auto_8616 ?auto_8615 ) ( not ( = ?auto_8616 ?auto_8618 ) ) ( OBJ-AT ?auto_8618 ?auto_8619 ) ( OBJ-AT ?auto_8617 ?auto_8615 ) ( not ( = ?auto_8616 ?auto_8617 ) ) ( not ( = ?auto_8617 ?auto_8618 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8616 ?auto_8618 ?auto_8615 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8623 - OBJ
      ?auto_8624 - OBJ
      ?auto_8625 - OBJ
      ?auto_8622 - LOCATION
    )
    :vars
    (
      ?auto_8627 - TRUCK
      ?auto_8626 - LOCATION
      ?auto_8628 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8627 ?auto_8626 ) ( IN-CITY ?auto_8626 ?auto_8628 ) ( IN-CITY ?auto_8622 ?auto_8628 ) ( not ( = ?auto_8622 ?auto_8626 ) ) ( OBJ-AT ?auto_8623 ?auto_8622 ) ( not ( = ?auto_8623 ?auto_8625 ) ) ( OBJ-AT ?auto_8625 ?auto_8626 ) ( OBJ-AT ?auto_8624 ?auto_8622 ) ( not ( = ?auto_8623 ?auto_8624 ) ) ( not ( = ?auto_8624 ?auto_8625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8623 ?auto_8625 ?auto_8622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8630 - OBJ
      ?auto_8631 - OBJ
      ?auto_8632 - OBJ
      ?auto_8629 - LOCATION
    )
    :vars
    (
      ?auto_8634 - TRUCK
      ?auto_8633 - LOCATION
      ?auto_8635 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8634 ?auto_8633 ) ( IN-CITY ?auto_8633 ?auto_8635 ) ( IN-CITY ?auto_8629 ?auto_8635 ) ( not ( = ?auto_8629 ?auto_8633 ) ) ( OBJ-AT ?auto_8632 ?auto_8629 ) ( not ( = ?auto_8632 ?auto_8631 ) ) ( OBJ-AT ?auto_8631 ?auto_8633 ) ( OBJ-AT ?auto_8630 ?auto_8629 ) ( not ( = ?auto_8630 ?auto_8631 ) ) ( not ( = ?auto_8630 ?auto_8632 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8632 ?auto_8631 ?auto_8629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8637 - OBJ
      ?auto_8638 - OBJ
      ?auto_8639 - OBJ
      ?auto_8636 - LOCATION
    )
    :vars
    (
      ?auto_8641 - TRUCK
      ?auto_8640 - LOCATION
      ?auto_8642 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8641 ?auto_8640 ) ( IN-CITY ?auto_8640 ?auto_8642 ) ( IN-CITY ?auto_8636 ?auto_8642 ) ( not ( = ?auto_8636 ?auto_8640 ) ) ( OBJ-AT ?auto_8637 ?auto_8636 ) ( not ( = ?auto_8637 ?auto_8638 ) ) ( OBJ-AT ?auto_8638 ?auto_8640 ) ( OBJ-AT ?auto_8639 ?auto_8636 ) ( not ( = ?auto_8637 ?auto_8639 ) ) ( not ( = ?auto_8638 ?auto_8639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8637 ?auto_8638 ?auto_8636 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8651 - OBJ
      ?auto_8652 - OBJ
      ?auto_8653 - OBJ
      ?auto_8650 - LOCATION
    )
    :vars
    (
      ?auto_8655 - TRUCK
      ?auto_8654 - LOCATION
      ?auto_8656 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8655 ?auto_8654 ) ( IN-CITY ?auto_8654 ?auto_8656 ) ( IN-CITY ?auto_8650 ?auto_8656 ) ( not ( = ?auto_8650 ?auto_8654 ) ) ( OBJ-AT ?auto_8652 ?auto_8650 ) ( not ( = ?auto_8652 ?auto_8653 ) ) ( OBJ-AT ?auto_8653 ?auto_8654 ) ( OBJ-AT ?auto_8651 ?auto_8650 ) ( not ( = ?auto_8651 ?auto_8652 ) ) ( not ( = ?auto_8651 ?auto_8653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8652 ?auto_8653 ?auto_8650 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8658 - OBJ
      ?auto_8659 - OBJ
      ?auto_8660 - OBJ
      ?auto_8657 - LOCATION
    )
    :vars
    (
      ?auto_8662 - TRUCK
      ?auto_8661 - LOCATION
      ?auto_8663 - CITY
      ?auto_8664 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8662 ?auto_8661 ) ( IN-CITY ?auto_8661 ?auto_8663 ) ( IN-CITY ?auto_8657 ?auto_8663 ) ( not ( = ?auto_8657 ?auto_8661 ) ) ( OBJ-AT ?auto_8664 ?auto_8657 ) ( not ( = ?auto_8664 ?auto_8660 ) ) ( OBJ-AT ?auto_8660 ?auto_8661 ) ( OBJ-AT ?auto_8658 ?auto_8657 ) ( OBJ-AT ?auto_8659 ?auto_8657 ) ( not ( = ?auto_8658 ?auto_8659 ) ) ( not ( = ?auto_8658 ?auto_8660 ) ) ( not ( = ?auto_8658 ?auto_8664 ) ) ( not ( = ?auto_8659 ?auto_8660 ) ) ( not ( = ?auto_8659 ?auto_8664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8664 ?auto_8660 ?auto_8657 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8666 - OBJ
      ?auto_8667 - OBJ
      ?auto_8668 - OBJ
      ?auto_8665 - LOCATION
    )
    :vars
    (
      ?auto_8670 - TRUCK
      ?auto_8669 - LOCATION
      ?auto_8671 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8670 ?auto_8669 ) ( IN-CITY ?auto_8669 ?auto_8671 ) ( IN-CITY ?auto_8665 ?auto_8671 ) ( not ( = ?auto_8665 ?auto_8669 ) ) ( OBJ-AT ?auto_8668 ?auto_8665 ) ( not ( = ?auto_8668 ?auto_8667 ) ) ( OBJ-AT ?auto_8667 ?auto_8669 ) ( OBJ-AT ?auto_8666 ?auto_8665 ) ( not ( = ?auto_8666 ?auto_8667 ) ) ( not ( = ?auto_8666 ?auto_8668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8668 ?auto_8667 ?auto_8665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8673 - OBJ
      ?auto_8674 - OBJ
      ?auto_8675 - OBJ
      ?auto_8672 - LOCATION
    )
    :vars
    (
      ?auto_8677 - TRUCK
      ?auto_8676 - LOCATION
      ?auto_8678 - CITY
      ?auto_8679 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8677 ?auto_8676 ) ( IN-CITY ?auto_8676 ?auto_8678 ) ( IN-CITY ?auto_8672 ?auto_8678 ) ( not ( = ?auto_8672 ?auto_8676 ) ) ( OBJ-AT ?auto_8679 ?auto_8672 ) ( not ( = ?auto_8679 ?auto_8674 ) ) ( OBJ-AT ?auto_8674 ?auto_8676 ) ( OBJ-AT ?auto_8673 ?auto_8672 ) ( OBJ-AT ?auto_8675 ?auto_8672 ) ( not ( = ?auto_8673 ?auto_8674 ) ) ( not ( = ?auto_8673 ?auto_8675 ) ) ( not ( = ?auto_8673 ?auto_8679 ) ) ( not ( = ?auto_8674 ?auto_8675 ) ) ( not ( = ?auto_8675 ?auto_8679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8679 ?auto_8674 ?auto_8672 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8689 - OBJ
      ?auto_8690 - OBJ
      ?auto_8691 - OBJ
      ?auto_8688 - LOCATION
    )
    :vars
    (
      ?auto_8693 - TRUCK
      ?auto_8692 - LOCATION
      ?auto_8694 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8693 ?auto_8692 ) ( IN-CITY ?auto_8692 ?auto_8694 ) ( IN-CITY ?auto_8688 ?auto_8694 ) ( not ( = ?auto_8688 ?auto_8692 ) ) ( OBJ-AT ?auto_8690 ?auto_8688 ) ( not ( = ?auto_8690 ?auto_8689 ) ) ( OBJ-AT ?auto_8689 ?auto_8692 ) ( OBJ-AT ?auto_8691 ?auto_8688 ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8690 ?auto_8689 ?auto_8688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8696 - OBJ
      ?auto_8697 - OBJ
      ?auto_8698 - OBJ
      ?auto_8695 - LOCATION
    )
    :vars
    (
      ?auto_8700 - TRUCK
      ?auto_8699 - LOCATION
      ?auto_8701 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8700 ?auto_8699 ) ( IN-CITY ?auto_8699 ?auto_8701 ) ( IN-CITY ?auto_8695 ?auto_8701 ) ( not ( = ?auto_8695 ?auto_8699 ) ) ( OBJ-AT ?auto_8697 ?auto_8695 ) ( not ( = ?auto_8697 ?auto_8696 ) ) ( OBJ-AT ?auto_8696 ?auto_8699 ) ( OBJ-AT ?auto_8698 ?auto_8695 ) ( not ( = ?auto_8696 ?auto_8698 ) ) ( not ( = ?auto_8697 ?auto_8698 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8697 ?auto_8696 ?auto_8695 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8710 - OBJ
      ?auto_8711 - OBJ
      ?auto_8712 - OBJ
      ?auto_8709 - LOCATION
    )
    :vars
    (
      ?auto_8714 - TRUCK
      ?auto_8713 - LOCATION
      ?auto_8715 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8714 ?auto_8713 ) ( IN-CITY ?auto_8713 ?auto_8715 ) ( IN-CITY ?auto_8709 ?auto_8715 ) ( not ( = ?auto_8709 ?auto_8713 ) ) ( OBJ-AT ?auto_8712 ?auto_8709 ) ( not ( = ?auto_8712 ?auto_8710 ) ) ( OBJ-AT ?auto_8710 ?auto_8713 ) ( OBJ-AT ?auto_8711 ?auto_8709 ) ( not ( = ?auto_8710 ?auto_8711 ) ) ( not ( = ?auto_8711 ?auto_8712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8712 ?auto_8710 ?auto_8709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8717 - OBJ
      ?auto_8718 - OBJ
      ?auto_8719 - OBJ
      ?auto_8716 - LOCATION
    )
    :vars
    (
      ?auto_8721 - TRUCK
      ?auto_8720 - LOCATION
      ?auto_8722 - CITY
      ?auto_8723 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8721 ?auto_8720 ) ( IN-CITY ?auto_8720 ?auto_8722 ) ( IN-CITY ?auto_8716 ?auto_8722 ) ( not ( = ?auto_8716 ?auto_8720 ) ) ( OBJ-AT ?auto_8723 ?auto_8716 ) ( not ( = ?auto_8723 ?auto_8717 ) ) ( OBJ-AT ?auto_8717 ?auto_8720 ) ( OBJ-AT ?auto_8718 ?auto_8716 ) ( OBJ-AT ?auto_8719 ?auto_8716 ) ( not ( = ?auto_8717 ?auto_8718 ) ) ( not ( = ?auto_8717 ?auto_8719 ) ) ( not ( = ?auto_8718 ?auto_8719 ) ) ( not ( = ?auto_8718 ?auto_8723 ) ) ( not ( = ?auto_8719 ?auto_8723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8723 ?auto_8717 ?auto_8716 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8756 - OBJ
      ?auto_8755 - LOCATION
    )
    :vars
    (
      ?auto_8757 - LOCATION
      ?auto_8759 - CITY
      ?auto_8760 - OBJ
      ?auto_8758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8757 ?auto_8759 ) ( IN-CITY ?auto_8755 ?auto_8759 ) ( not ( = ?auto_8755 ?auto_8757 ) ) ( OBJ-AT ?auto_8760 ?auto_8755 ) ( not ( = ?auto_8760 ?auto_8756 ) ) ( OBJ-AT ?auto_8756 ?auto_8757 ) ( TRUCK-AT ?auto_8758 ?auto_8755 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8758 ?auto_8755 ?auto_8757 ?auto_8759 )
      ( DELIVER-2PKG ?auto_8760 ?auto_8756 ?auto_8755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8762 - OBJ
      ?auto_8763 - OBJ
      ?auto_8761 - LOCATION
    )
    :vars
    (
      ?auto_8764 - LOCATION
      ?auto_8765 - CITY
      ?auto_8766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8764 ?auto_8765 ) ( IN-CITY ?auto_8761 ?auto_8765 ) ( not ( = ?auto_8761 ?auto_8764 ) ) ( OBJ-AT ?auto_8762 ?auto_8761 ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( OBJ-AT ?auto_8763 ?auto_8764 ) ( TRUCK-AT ?auto_8766 ?auto_8761 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8763 ?auto_8761 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8768 - OBJ
      ?auto_8769 - OBJ
      ?auto_8767 - LOCATION
    )
    :vars
    (
      ?auto_8770 - LOCATION
      ?auto_8771 - CITY
      ?auto_8772 - OBJ
      ?auto_8773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8770 ?auto_8771 ) ( IN-CITY ?auto_8767 ?auto_8771 ) ( not ( = ?auto_8767 ?auto_8770 ) ) ( OBJ-AT ?auto_8772 ?auto_8767 ) ( not ( = ?auto_8772 ?auto_8769 ) ) ( OBJ-AT ?auto_8769 ?auto_8770 ) ( TRUCK-AT ?auto_8773 ?auto_8767 ) ( OBJ-AT ?auto_8768 ?auto_8767 ) ( not ( = ?auto_8768 ?auto_8769 ) ) ( not ( = ?auto_8768 ?auto_8772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8772 ?auto_8769 ?auto_8767 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8775 - OBJ
      ?auto_8776 - OBJ
      ?auto_8774 - LOCATION
    )
    :vars
    (
      ?auto_8777 - LOCATION
      ?auto_8778 - CITY
      ?auto_8779 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8777 ?auto_8778 ) ( IN-CITY ?auto_8774 ?auto_8778 ) ( not ( = ?auto_8774 ?auto_8777 ) ) ( OBJ-AT ?auto_8776 ?auto_8774 ) ( not ( = ?auto_8776 ?auto_8775 ) ) ( OBJ-AT ?auto_8775 ?auto_8777 ) ( TRUCK-AT ?auto_8779 ?auto_8774 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8776 ?auto_8775 ?auto_8774 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8781 - OBJ
      ?auto_8782 - OBJ
      ?auto_8780 - LOCATION
    )
    :vars
    (
      ?auto_8783 - LOCATION
      ?auto_8784 - CITY
      ?auto_8785 - OBJ
      ?auto_8786 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8783 ?auto_8784 ) ( IN-CITY ?auto_8780 ?auto_8784 ) ( not ( = ?auto_8780 ?auto_8783 ) ) ( OBJ-AT ?auto_8785 ?auto_8780 ) ( not ( = ?auto_8785 ?auto_8781 ) ) ( OBJ-AT ?auto_8781 ?auto_8783 ) ( TRUCK-AT ?auto_8786 ?auto_8780 ) ( OBJ-AT ?auto_8782 ?auto_8780 ) ( not ( = ?auto_8781 ?auto_8782 ) ) ( not ( = ?auto_8782 ?auto_8785 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8785 ?auto_8781 ?auto_8780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8795 - OBJ
      ?auto_8796 - OBJ
      ?auto_8797 - OBJ
      ?auto_8794 - LOCATION
    )
    :vars
    (
      ?auto_8798 - LOCATION
      ?auto_8799 - CITY
      ?auto_8800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8798 ?auto_8799 ) ( IN-CITY ?auto_8794 ?auto_8799 ) ( not ( = ?auto_8794 ?auto_8798 ) ) ( OBJ-AT ?auto_8795 ?auto_8794 ) ( not ( = ?auto_8795 ?auto_8797 ) ) ( OBJ-AT ?auto_8797 ?auto_8798 ) ( TRUCK-AT ?auto_8800 ?auto_8794 ) ( OBJ-AT ?auto_8796 ?auto_8794 ) ( not ( = ?auto_8795 ?auto_8796 ) ) ( not ( = ?auto_8796 ?auto_8797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8795 ?auto_8797 ?auto_8794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8802 - OBJ
      ?auto_8803 - OBJ
      ?auto_8804 - OBJ
      ?auto_8801 - LOCATION
    )
    :vars
    (
      ?auto_8805 - LOCATION
      ?auto_8806 - CITY
      ?auto_8807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8805 ?auto_8806 ) ( IN-CITY ?auto_8801 ?auto_8806 ) ( not ( = ?auto_8801 ?auto_8805 ) ) ( OBJ-AT ?auto_8802 ?auto_8801 ) ( not ( = ?auto_8802 ?auto_8804 ) ) ( OBJ-AT ?auto_8804 ?auto_8805 ) ( TRUCK-AT ?auto_8807 ?auto_8801 ) ( OBJ-AT ?auto_8803 ?auto_8801 ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( not ( = ?auto_8803 ?auto_8804 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8802 ?auto_8804 ?auto_8801 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8809 - OBJ
      ?auto_8810 - OBJ
      ?auto_8811 - OBJ
      ?auto_8808 - LOCATION
    )
    :vars
    (
      ?auto_8812 - LOCATION
      ?auto_8813 - CITY
      ?auto_8814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8812 ?auto_8813 ) ( IN-CITY ?auto_8808 ?auto_8813 ) ( not ( = ?auto_8808 ?auto_8812 ) ) ( OBJ-AT ?auto_8811 ?auto_8808 ) ( not ( = ?auto_8811 ?auto_8810 ) ) ( OBJ-AT ?auto_8810 ?auto_8812 ) ( TRUCK-AT ?auto_8814 ?auto_8808 ) ( OBJ-AT ?auto_8809 ?auto_8808 ) ( not ( = ?auto_8809 ?auto_8810 ) ) ( not ( = ?auto_8809 ?auto_8811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8811 ?auto_8810 ?auto_8808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8816 - OBJ
      ?auto_8817 - OBJ
      ?auto_8818 - OBJ
      ?auto_8815 - LOCATION
    )
    :vars
    (
      ?auto_8819 - LOCATION
      ?auto_8820 - CITY
      ?auto_8821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8819 ?auto_8820 ) ( IN-CITY ?auto_8815 ?auto_8820 ) ( not ( = ?auto_8815 ?auto_8819 ) ) ( OBJ-AT ?auto_8816 ?auto_8815 ) ( not ( = ?auto_8816 ?auto_8817 ) ) ( OBJ-AT ?auto_8817 ?auto_8819 ) ( TRUCK-AT ?auto_8821 ?auto_8815 ) ( OBJ-AT ?auto_8818 ?auto_8815 ) ( not ( = ?auto_8816 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8816 ?auto_8817 ?auto_8815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8830 - OBJ
      ?auto_8831 - OBJ
      ?auto_8832 - OBJ
      ?auto_8829 - LOCATION
    )
    :vars
    (
      ?auto_8833 - LOCATION
      ?auto_8834 - CITY
      ?auto_8835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8833 ?auto_8834 ) ( IN-CITY ?auto_8829 ?auto_8834 ) ( not ( = ?auto_8829 ?auto_8833 ) ) ( OBJ-AT ?auto_8831 ?auto_8829 ) ( not ( = ?auto_8831 ?auto_8832 ) ) ( OBJ-AT ?auto_8832 ?auto_8833 ) ( TRUCK-AT ?auto_8835 ?auto_8829 ) ( OBJ-AT ?auto_8830 ?auto_8829 ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8832 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8831 ?auto_8832 ?auto_8829 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8837 - OBJ
      ?auto_8838 - OBJ
      ?auto_8839 - OBJ
      ?auto_8836 - LOCATION
    )
    :vars
    (
      ?auto_8840 - LOCATION
      ?auto_8841 - CITY
      ?auto_8842 - OBJ
      ?auto_8843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8840 ?auto_8841 ) ( IN-CITY ?auto_8836 ?auto_8841 ) ( not ( = ?auto_8836 ?auto_8840 ) ) ( OBJ-AT ?auto_8842 ?auto_8836 ) ( not ( = ?auto_8842 ?auto_8839 ) ) ( OBJ-AT ?auto_8839 ?auto_8840 ) ( TRUCK-AT ?auto_8843 ?auto_8836 ) ( OBJ-AT ?auto_8837 ?auto_8836 ) ( OBJ-AT ?auto_8838 ?auto_8836 ) ( not ( = ?auto_8837 ?auto_8838 ) ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( not ( = ?auto_8837 ?auto_8842 ) ) ( not ( = ?auto_8838 ?auto_8839 ) ) ( not ( = ?auto_8838 ?auto_8842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8842 ?auto_8839 ?auto_8836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8845 - OBJ
      ?auto_8846 - OBJ
      ?auto_8847 - OBJ
      ?auto_8844 - LOCATION
    )
    :vars
    (
      ?auto_8848 - LOCATION
      ?auto_8849 - CITY
      ?auto_8850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8848 ?auto_8849 ) ( IN-CITY ?auto_8844 ?auto_8849 ) ( not ( = ?auto_8844 ?auto_8848 ) ) ( OBJ-AT ?auto_8847 ?auto_8844 ) ( not ( = ?auto_8847 ?auto_8846 ) ) ( OBJ-AT ?auto_8846 ?auto_8848 ) ( TRUCK-AT ?auto_8850 ?auto_8844 ) ( OBJ-AT ?auto_8845 ?auto_8844 ) ( not ( = ?auto_8845 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8847 ?auto_8846 ?auto_8844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8852 - OBJ
      ?auto_8853 - OBJ
      ?auto_8854 - OBJ
      ?auto_8851 - LOCATION
    )
    :vars
    (
      ?auto_8855 - LOCATION
      ?auto_8856 - CITY
      ?auto_8857 - OBJ
      ?auto_8858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8855 ?auto_8856 ) ( IN-CITY ?auto_8851 ?auto_8856 ) ( not ( = ?auto_8851 ?auto_8855 ) ) ( OBJ-AT ?auto_8857 ?auto_8851 ) ( not ( = ?auto_8857 ?auto_8853 ) ) ( OBJ-AT ?auto_8853 ?auto_8855 ) ( TRUCK-AT ?auto_8858 ?auto_8851 ) ( OBJ-AT ?auto_8852 ?auto_8851 ) ( OBJ-AT ?auto_8854 ?auto_8851 ) ( not ( = ?auto_8852 ?auto_8853 ) ) ( not ( = ?auto_8852 ?auto_8854 ) ) ( not ( = ?auto_8852 ?auto_8857 ) ) ( not ( = ?auto_8853 ?auto_8854 ) ) ( not ( = ?auto_8854 ?auto_8857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8857 ?auto_8853 ?auto_8851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8868 - OBJ
      ?auto_8869 - OBJ
      ?auto_8870 - OBJ
      ?auto_8867 - LOCATION
    )
    :vars
    (
      ?auto_8871 - LOCATION
      ?auto_8872 - CITY
      ?auto_8873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8871 ?auto_8872 ) ( IN-CITY ?auto_8867 ?auto_8872 ) ( not ( = ?auto_8867 ?auto_8871 ) ) ( OBJ-AT ?auto_8869 ?auto_8867 ) ( not ( = ?auto_8869 ?auto_8868 ) ) ( OBJ-AT ?auto_8868 ?auto_8871 ) ( TRUCK-AT ?auto_8873 ?auto_8867 ) ( OBJ-AT ?auto_8870 ?auto_8867 ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8869 ?auto_8870 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8869 ?auto_8868 ?auto_8867 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8875 - OBJ
      ?auto_8876 - OBJ
      ?auto_8877 - OBJ
      ?auto_8874 - LOCATION
    )
    :vars
    (
      ?auto_8878 - LOCATION
      ?auto_8879 - CITY
      ?auto_8880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8878 ?auto_8879 ) ( IN-CITY ?auto_8874 ?auto_8879 ) ( not ( = ?auto_8874 ?auto_8878 ) ) ( OBJ-AT ?auto_8876 ?auto_8874 ) ( not ( = ?auto_8876 ?auto_8875 ) ) ( OBJ-AT ?auto_8875 ?auto_8878 ) ( TRUCK-AT ?auto_8880 ?auto_8874 ) ( OBJ-AT ?auto_8877 ?auto_8874 ) ( not ( = ?auto_8875 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8876 ?auto_8875 ?auto_8874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8889 - OBJ
      ?auto_8890 - OBJ
      ?auto_8891 - OBJ
      ?auto_8888 - LOCATION
    )
    :vars
    (
      ?auto_8892 - LOCATION
      ?auto_8893 - CITY
      ?auto_8894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8892 ?auto_8893 ) ( IN-CITY ?auto_8888 ?auto_8893 ) ( not ( = ?auto_8888 ?auto_8892 ) ) ( OBJ-AT ?auto_8891 ?auto_8888 ) ( not ( = ?auto_8891 ?auto_8889 ) ) ( OBJ-AT ?auto_8889 ?auto_8892 ) ( TRUCK-AT ?auto_8894 ?auto_8888 ) ( OBJ-AT ?auto_8890 ?auto_8888 ) ( not ( = ?auto_8889 ?auto_8890 ) ) ( not ( = ?auto_8890 ?auto_8891 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8891 ?auto_8889 ?auto_8888 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8896 - OBJ
      ?auto_8897 - OBJ
      ?auto_8898 - OBJ
      ?auto_8895 - LOCATION
    )
    :vars
    (
      ?auto_8899 - LOCATION
      ?auto_8900 - CITY
      ?auto_8901 - OBJ
      ?auto_8902 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8899 ?auto_8900 ) ( IN-CITY ?auto_8895 ?auto_8900 ) ( not ( = ?auto_8895 ?auto_8899 ) ) ( OBJ-AT ?auto_8901 ?auto_8895 ) ( not ( = ?auto_8901 ?auto_8896 ) ) ( OBJ-AT ?auto_8896 ?auto_8899 ) ( TRUCK-AT ?auto_8902 ?auto_8895 ) ( OBJ-AT ?auto_8897 ?auto_8895 ) ( OBJ-AT ?auto_8898 ?auto_8895 ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8901 ) ) ( not ( = ?auto_8898 ?auto_8901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8901 ?auto_8896 ?auto_8895 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8935 - OBJ
      ?auto_8934 - LOCATION
    )
    :vars
    (
      ?auto_8936 - LOCATION
      ?auto_8937 - CITY
      ?auto_8938 - OBJ
      ?auto_8939 - TRUCK
      ?auto_8940 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_8936 ?auto_8937 ) ( IN-CITY ?auto_8934 ?auto_8937 ) ( not ( = ?auto_8934 ?auto_8936 ) ) ( OBJ-AT ?auto_8938 ?auto_8934 ) ( not ( = ?auto_8938 ?auto_8935 ) ) ( OBJ-AT ?auto_8935 ?auto_8936 ) ( TRUCK-AT ?auto_8939 ?auto_8934 ) ( IN-TRUCK ?auto_8940 ?auto_8939 ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8935 ?auto_8940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8938 ?auto_8940 ?auto_8934 )
      ( DELIVER-2PKG ?auto_8938 ?auto_8935 ?auto_8934 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8942 - OBJ
      ?auto_8943 - OBJ
      ?auto_8941 - LOCATION
    )
    :vars
    (
      ?auto_8944 - LOCATION
      ?auto_8946 - CITY
      ?auto_8945 - TRUCK
      ?auto_8947 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_8944 ?auto_8946 ) ( IN-CITY ?auto_8941 ?auto_8946 ) ( not ( = ?auto_8941 ?auto_8944 ) ) ( OBJ-AT ?auto_8942 ?auto_8941 ) ( not ( = ?auto_8942 ?auto_8943 ) ) ( OBJ-AT ?auto_8943 ?auto_8944 ) ( TRUCK-AT ?auto_8945 ?auto_8941 ) ( IN-TRUCK ?auto_8947 ?auto_8945 ) ( not ( = ?auto_8942 ?auto_8947 ) ) ( not ( = ?auto_8943 ?auto_8947 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8943 ?auto_8941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8949 - OBJ
      ?auto_8950 - OBJ
      ?auto_8948 - LOCATION
    )
    :vars
    (
      ?auto_8951 - LOCATION
      ?auto_8952 - CITY
      ?auto_8953 - OBJ
      ?auto_8954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8951 ?auto_8952 ) ( IN-CITY ?auto_8948 ?auto_8952 ) ( not ( = ?auto_8948 ?auto_8951 ) ) ( OBJ-AT ?auto_8953 ?auto_8948 ) ( not ( = ?auto_8953 ?auto_8950 ) ) ( OBJ-AT ?auto_8950 ?auto_8951 ) ( TRUCK-AT ?auto_8954 ?auto_8948 ) ( IN-TRUCK ?auto_8949 ?auto_8954 ) ( not ( = ?auto_8953 ?auto_8949 ) ) ( not ( = ?auto_8950 ?auto_8949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8953 ?auto_8950 ?auto_8948 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8956 - OBJ
      ?auto_8957 - OBJ
      ?auto_8955 - LOCATION
    )
    :vars
    (
      ?auto_8958 - LOCATION
      ?auto_8959 - CITY
      ?auto_8960 - TRUCK
      ?auto_8961 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_8958 ?auto_8959 ) ( IN-CITY ?auto_8955 ?auto_8959 ) ( not ( = ?auto_8955 ?auto_8958 ) ) ( OBJ-AT ?auto_8957 ?auto_8955 ) ( not ( = ?auto_8957 ?auto_8956 ) ) ( OBJ-AT ?auto_8956 ?auto_8958 ) ( TRUCK-AT ?auto_8960 ?auto_8955 ) ( IN-TRUCK ?auto_8961 ?auto_8960 ) ( not ( = ?auto_8957 ?auto_8961 ) ) ( not ( = ?auto_8956 ?auto_8961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8957 ?auto_8956 ?auto_8955 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8963 - OBJ
      ?auto_8964 - OBJ
      ?auto_8962 - LOCATION
    )
    :vars
    (
      ?auto_8965 - LOCATION
      ?auto_8966 - CITY
      ?auto_8967 - OBJ
      ?auto_8968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8965 ?auto_8966 ) ( IN-CITY ?auto_8962 ?auto_8966 ) ( not ( = ?auto_8962 ?auto_8965 ) ) ( OBJ-AT ?auto_8967 ?auto_8962 ) ( not ( = ?auto_8967 ?auto_8963 ) ) ( OBJ-AT ?auto_8963 ?auto_8965 ) ( TRUCK-AT ?auto_8968 ?auto_8962 ) ( IN-TRUCK ?auto_8964 ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8964 ) ) ( not ( = ?auto_8963 ?auto_8964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8967 ?auto_8963 ?auto_8962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8978 - OBJ
      ?auto_8979 - OBJ
      ?auto_8980 - OBJ
      ?auto_8977 - LOCATION
    )
    :vars
    (
      ?auto_8981 - LOCATION
      ?auto_8982 - CITY
      ?auto_8983 - TRUCK
      ?auto_8984 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_8981 ?auto_8982 ) ( IN-CITY ?auto_8977 ?auto_8982 ) ( not ( = ?auto_8977 ?auto_8981 ) ) ( OBJ-AT ?auto_8978 ?auto_8977 ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( OBJ-AT ?auto_8980 ?auto_8981 ) ( TRUCK-AT ?auto_8983 ?auto_8977 ) ( IN-TRUCK ?auto_8984 ?auto_8983 ) ( not ( = ?auto_8978 ?auto_8984 ) ) ( not ( = ?auto_8980 ?auto_8984 ) ) ( OBJ-AT ?auto_8979 ?auto_8977 ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_8984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8978 ?auto_8980 ?auto_8977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8986 - OBJ
      ?auto_8987 - OBJ
      ?auto_8988 - OBJ
      ?auto_8985 - LOCATION
    )
    :vars
    (
      ?auto_8989 - LOCATION
      ?auto_8990 - CITY
      ?auto_8991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8989 ?auto_8990 ) ( IN-CITY ?auto_8985 ?auto_8990 ) ( not ( = ?auto_8985 ?auto_8989 ) ) ( OBJ-AT ?auto_8986 ?auto_8985 ) ( not ( = ?auto_8986 ?auto_8988 ) ) ( OBJ-AT ?auto_8988 ?auto_8989 ) ( TRUCK-AT ?auto_8991 ?auto_8985 ) ( IN-TRUCK ?auto_8987 ?auto_8991 ) ( not ( = ?auto_8986 ?auto_8987 ) ) ( not ( = ?auto_8988 ?auto_8987 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8986 ?auto_8988 ?auto_8985 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8993 - OBJ
      ?auto_8994 - OBJ
      ?auto_8995 - OBJ
      ?auto_8992 - LOCATION
    )
    :vars
    (
      ?auto_8996 - LOCATION
      ?auto_8997 - CITY
      ?auto_8998 - TRUCK
      ?auto_8999 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_8996 ?auto_8997 ) ( IN-CITY ?auto_8992 ?auto_8997 ) ( not ( = ?auto_8992 ?auto_8996 ) ) ( OBJ-AT ?auto_8995 ?auto_8992 ) ( not ( = ?auto_8995 ?auto_8994 ) ) ( OBJ-AT ?auto_8994 ?auto_8996 ) ( TRUCK-AT ?auto_8998 ?auto_8992 ) ( IN-TRUCK ?auto_8999 ?auto_8998 ) ( not ( = ?auto_8995 ?auto_8999 ) ) ( not ( = ?auto_8994 ?auto_8999 ) ) ( OBJ-AT ?auto_8993 ?auto_8992 ) ( not ( = ?auto_8993 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8995 ) ) ( not ( = ?auto_8993 ?auto_8999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8995 ?auto_8994 ?auto_8992 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9001 - OBJ
      ?auto_9002 - OBJ
      ?auto_9003 - OBJ
      ?auto_9000 - LOCATION
    )
    :vars
    (
      ?auto_9004 - LOCATION
      ?auto_9005 - CITY
      ?auto_9006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9004 ?auto_9005 ) ( IN-CITY ?auto_9000 ?auto_9005 ) ( not ( = ?auto_9000 ?auto_9004 ) ) ( OBJ-AT ?auto_9001 ?auto_9000 ) ( not ( = ?auto_9001 ?auto_9002 ) ) ( OBJ-AT ?auto_9002 ?auto_9004 ) ( TRUCK-AT ?auto_9006 ?auto_9000 ) ( IN-TRUCK ?auto_9003 ?auto_9006 ) ( not ( = ?auto_9001 ?auto_9003 ) ) ( not ( = ?auto_9002 ?auto_9003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9001 ?auto_9002 ?auto_9000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9016 - OBJ
      ?auto_9017 - OBJ
      ?auto_9018 - OBJ
      ?auto_9015 - LOCATION
    )
    :vars
    (
      ?auto_9019 - LOCATION
      ?auto_9020 - CITY
      ?auto_9021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9019 ?auto_9020 ) ( IN-CITY ?auto_9015 ?auto_9020 ) ( not ( = ?auto_9015 ?auto_9019 ) ) ( OBJ-AT ?auto_9017 ?auto_9015 ) ( not ( = ?auto_9017 ?auto_9018 ) ) ( OBJ-AT ?auto_9018 ?auto_9019 ) ( TRUCK-AT ?auto_9021 ?auto_9015 ) ( IN-TRUCK ?auto_9016 ?auto_9021 ) ( not ( = ?auto_9017 ?auto_9016 ) ) ( not ( = ?auto_9018 ?auto_9016 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9017 ?auto_9018 ?auto_9015 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9031 - OBJ
      ?auto_9032 - OBJ
      ?auto_9033 - OBJ
      ?auto_9030 - LOCATION
    )
    :vars
    (
      ?auto_9034 - LOCATION
      ?auto_9035 - CITY
      ?auto_9036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9034 ?auto_9035 ) ( IN-CITY ?auto_9030 ?auto_9035 ) ( not ( = ?auto_9030 ?auto_9034 ) ) ( OBJ-AT ?auto_9033 ?auto_9030 ) ( not ( = ?auto_9033 ?auto_9032 ) ) ( OBJ-AT ?auto_9032 ?auto_9034 ) ( TRUCK-AT ?auto_9036 ?auto_9030 ) ( IN-TRUCK ?auto_9031 ?auto_9036 ) ( not ( = ?auto_9033 ?auto_9031 ) ) ( not ( = ?auto_9032 ?auto_9031 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9033 ?auto_9032 ?auto_9030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9054 - OBJ
      ?auto_9055 - OBJ
      ?auto_9056 - OBJ
      ?auto_9053 - LOCATION
    )
    :vars
    (
      ?auto_9057 - LOCATION
      ?auto_9058 - CITY
      ?auto_9059 - TRUCK
      ?auto_9060 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9057 ?auto_9058 ) ( IN-CITY ?auto_9053 ?auto_9058 ) ( not ( = ?auto_9053 ?auto_9057 ) ) ( OBJ-AT ?auto_9055 ?auto_9053 ) ( not ( = ?auto_9055 ?auto_9054 ) ) ( OBJ-AT ?auto_9054 ?auto_9057 ) ( TRUCK-AT ?auto_9059 ?auto_9053 ) ( IN-TRUCK ?auto_9060 ?auto_9059 ) ( not ( = ?auto_9055 ?auto_9060 ) ) ( not ( = ?auto_9054 ?auto_9060 ) ) ( OBJ-AT ?auto_9056 ?auto_9053 ) ( not ( = ?auto_9054 ?auto_9056 ) ) ( not ( = ?auto_9055 ?auto_9056 ) ) ( not ( = ?auto_9056 ?auto_9060 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9055 ?auto_9054 ?auto_9053 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9062 - OBJ
      ?auto_9063 - OBJ
      ?auto_9064 - OBJ
      ?auto_9061 - LOCATION
    )
    :vars
    (
      ?auto_9065 - LOCATION
      ?auto_9066 - CITY
      ?auto_9067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9065 ?auto_9066 ) ( IN-CITY ?auto_9061 ?auto_9066 ) ( not ( = ?auto_9061 ?auto_9065 ) ) ( OBJ-AT ?auto_9063 ?auto_9061 ) ( not ( = ?auto_9063 ?auto_9062 ) ) ( OBJ-AT ?auto_9062 ?auto_9065 ) ( TRUCK-AT ?auto_9067 ?auto_9061 ) ( IN-TRUCK ?auto_9064 ?auto_9067 ) ( not ( = ?auto_9063 ?auto_9064 ) ) ( not ( = ?auto_9062 ?auto_9064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9063 ?auto_9062 ?auto_9061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9077 - OBJ
      ?auto_9078 - OBJ
      ?auto_9079 - OBJ
      ?auto_9076 - LOCATION
    )
    :vars
    (
      ?auto_9080 - LOCATION
      ?auto_9081 - CITY
      ?auto_9082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9080 ?auto_9081 ) ( IN-CITY ?auto_9076 ?auto_9081 ) ( not ( = ?auto_9076 ?auto_9080 ) ) ( OBJ-AT ?auto_9079 ?auto_9076 ) ( not ( = ?auto_9079 ?auto_9077 ) ) ( OBJ-AT ?auto_9077 ?auto_9080 ) ( TRUCK-AT ?auto_9082 ?auto_9076 ) ( IN-TRUCK ?auto_9078 ?auto_9082 ) ( not ( = ?auto_9079 ?auto_9078 ) ) ( not ( = ?auto_9077 ?auto_9078 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9079 ?auto_9077 ?auto_9076 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9125 - OBJ
      ?auto_9124 - LOCATION
    )
    :vars
    (
      ?auto_9126 - LOCATION
      ?auto_9127 - CITY
      ?auto_9128 - OBJ
      ?auto_9130 - OBJ
      ?auto_9129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9126 ?auto_9127 ) ( IN-CITY ?auto_9124 ?auto_9127 ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( OBJ-AT ?auto_9128 ?auto_9124 ) ( not ( = ?auto_9128 ?auto_9125 ) ) ( OBJ-AT ?auto_9125 ?auto_9126 ) ( IN-TRUCK ?auto_9130 ?auto_9129 ) ( not ( = ?auto_9128 ?auto_9130 ) ) ( not ( = ?auto_9125 ?auto_9130 ) ) ( TRUCK-AT ?auto_9129 ?auto_9126 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9129 ?auto_9126 ?auto_9124 ?auto_9127 )
      ( DELIVER-2PKG ?auto_9128 ?auto_9125 ?auto_9124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9132 - OBJ
      ?auto_9133 - OBJ
      ?auto_9131 - LOCATION
    )
    :vars
    (
      ?auto_9135 - LOCATION
      ?auto_9134 - CITY
      ?auto_9137 - OBJ
      ?auto_9136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9135 ?auto_9134 ) ( IN-CITY ?auto_9131 ?auto_9134 ) ( not ( = ?auto_9131 ?auto_9135 ) ) ( OBJ-AT ?auto_9132 ?auto_9131 ) ( not ( = ?auto_9132 ?auto_9133 ) ) ( OBJ-AT ?auto_9133 ?auto_9135 ) ( IN-TRUCK ?auto_9137 ?auto_9136 ) ( not ( = ?auto_9132 ?auto_9137 ) ) ( not ( = ?auto_9133 ?auto_9137 ) ) ( TRUCK-AT ?auto_9136 ?auto_9135 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9133 ?auto_9131 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9139 - OBJ
      ?auto_9140 - OBJ
      ?auto_9138 - LOCATION
    )
    :vars
    (
      ?auto_9144 - LOCATION
      ?auto_9143 - CITY
      ?auto_9142 - OBJ
      ?auto_9141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9144 ?auto_9143 ) ( IN-CITY ?auto_9138 ?auto_9143 ) ( not ( = ?auto_9138 ?auto_9144 ) ) ( OBJ-AT ?auto_9142 ?auto_9138 ) ( not ( = ?auto_9142 ?auto_9140 ) ) ( OBJ-AT ?auto_9140 ?auto_9144 ) ( IN-TRUCK ?auto_9139 ?auto_9141 ) ( not ( = ?auto_9142 ?auto_9139 ) ) ( not ( = ?auto_9140 ?auto_9139 ) ) ( TRUCK-AT ?auto_9141 ?auto_9144 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9142 ?auto_9140 ?auto_9138 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9146 - OBJ
      ?auto_9147 - OBJ
      ?auto_9145 - LOCATION
    )
    :vars
    (
      ?auto_9151 - LOCATION
      ?auto_9150 - CITY
      ?auto_9149 - OBJ
      ?auto_9148 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9151 ?auto_9150 ) ( IN-CITY ?auto_9145 ?auto_9150 ) ( not ( = ?auto_9145 ?auto_9151 ) ) ( OBJ-AT ?auto_9147 ?auto_9145 ) ( not ( = ?auto_9147 ?auto_9146 ) ) ( OBJ-AT ?auto_9146 ?auto_9151 ) ( IN-TRUCK ?auto_9149 ?auto_9148 ) ( not ( = ?auto_9147 ?auto_9149 ) ) ( not ( = ?auto_9146 ?auto_9149 ) ) ( TRUCK-AT ?auto_9148 ?auto_9151 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9147 ?auto_9146 ?auto_9145 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9153 - OBJ
      ?auto_9154 - OBJ
      ?auto_9152 - LOCATION
    )
    :vars
    (
      ?auto_9158 - LOCATION
      ?auto_9157 - CITY
      ?auto_9156 - OBJ
      ?auto_9155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9158 ?auto_9157 ) ( IN-CITY ?auto_9152 ?auto_9157 ) ( not ( = ?auto_9152 ?auto_9158 ) ) ( OBJ-AT ?auto_9156 ?auto_9152 ) ( not ( = ?auto_9156 ?auto_9153 ) ) ( OBJ-AT ?auto_9153 ?auto_9158 ) ( IN-TRUCK ?auto_9154 ?auto_9155 ) ( not ( = ?auto_9156 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9154 ) ) ( TRUCK-AT ?auto_9155 ?auto_9158 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9156 ?auto_9153 ?auto_9152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9168 - OBJ
      ?auto_9169 - OBJ
      ?auto_9170 - OBJ
      ?auto_9167 - LOCATION
    )
    :vars
    (
      ?auto_9174 - LOCATION
      ?auto_9173 - CITY
      ?auto_9172 - OBJ
      ?auto_9171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9174 ?auto_9173 ) ( IN-CITY ?auto_9167 ?auto_9173 ) ( not ( = ?auto_9167 ?auto_9174 ) ) ( OBJ-AT ?auto_9169 ?auto_9167 ) ( not ( = ?auto_9169 ?auto_9170 ) ) ( OBJ-AT ?auto_9170 ?auto_9174 ) ( IN-TRUCK ?auto_9172 ?auto_9171 ) ( not ( = ?auto_9169 ?auto_9172 ) ) ( not ( = ?auto_9170 ?auto_9172 ) ) ( TRUCK-AT ?auto_9171 ?auto_9174 ) ( OBJ-AT ?auto_9168 ?auto_9167 ) ( not ( = ?auto_9168 ?auto_9169 ) ) ( not ( = ?auto_9168 ?auto_9170 ) ) ( not ( = ?auto_9168 ?auto_9172 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9169 ?auto_9170 ?auto_9167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9176 - OBJ
      ?auto_9177 - OBJ
      ?auto_9178 - OBJ
      ?auto_9175 - LOCATION
    )
    :vars
    (
      ?auto_9181 - LOCATION
      ?auto_9180 - CITY
      ?auto_9179 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9181 ?auto_9180 ) ( IN-CITY ?auto_9175 ?auto_9180 ) ( not ( = ?auto_9175 ?auto_9181 ) ) ( OBJ-AT ?auto_9176 ?auto_9175 ) ( not ( = ?auto_9176 ?auto_9178 ) ) ( OBJ-AT ?auto_9178 ?auto_9181 ) ( IN-TRUCK ?auto_9177 ?auto_9179 ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( not ( = ?auto_9178 ?auto_9177 ) ) ( TRUCK-AT ?auto_9179 ?auto_9181 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9176 ?auto_9178 ?auto_9175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9183 - OBJ
      ?auto_9184 - OBJ
      ?auto_9185 - OBJ
      ?auto_9182 - LOCATION
    )
    :vars
    (
      ?auto_9189 - LOCATION
      ?auto_9188 - CITY
      ?auto_9187 - OBJ
      ?auto_9186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9189 ?auto_9188 ) ( IN-CITY ?auto_9182 ?auto_9188 ) ( not ( = ?auto_9182 ?auto_9189 ) ) ( OBJ-AT ?auto_9185 ?auto_9182 ) ( not ( = ?auto_9185 ?auto_9184 ) ) ( OBJ-AT ?auto_9184 ?auto_9189 ) ( IN-TRUCK ?auto_9187 ?auto_9186 ) ( not ( = ?auto_9185 ?auto_9187 ) ) ( not ( = ?auto_9184 ?auto_9187 ) ) ( TRUCK-AT ?auto_9186 ?auto_9189 ) ( OBJ-AT ?auto_9183 ?auto_9182 ) ( not ( = ?auto_9183 ?auto_9184 ) ) ( not ( = ?auto_9183 ?auto_9185 ) ) ( not ( = ?auto_9183 ?auto_9187 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9185 ?auto_9184 ?auto_9182 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9191 - OBJ
      ?auto_9192 - OBJ
      ?auto_9193 - OBJ
      ?auto_9190 - LOCATION
    )
    :vars
    (
      ?auto_9196 - LOCATION
      ?auto_9195 - CITY
      ?auto_9194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9196 ?auto_9195 ) ( IN-CITY ?auto_9190 ?auto_9195 ) ( not ( = ?auto_9190 ?auto_9196 ) ) ( OBJ-AT ?auto_9191 ?auto_9190 ) ( not ( = ?auto_9191 ?auto_9192 ) ) ( OBJ-AT ?auto_9192 ?auto_9196 ) ( IN-TRUCK ?auto_9193 ?auto_9194 ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( not ( = ?auto_9192 ?auto_9193 ) ) ( TRUCK-AT ?auto_9194 ?auto_9196 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9191 ?auto_9192 ?auto_9190 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9206 - OBJ
      ?auto_9207 - OBJ
      ?auto_9208 - OBJ
      ?auto_9205 - LOCATION
    )
    :vars
    (
      ?auto_9211 - LOCATION
      ?auto_9210 - CITY
      ?auto_9209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9211 ?auto_9210 ) ( IN-CITY ?auto_9205 ?auto_9210 ) ( not ( = ?auto_9205 ?auto_9211 ) ) ( OBJ-AT ?auto_9207 ?auto_9205 ) ( not ( = ?auto_9207 ?auto_9208 ) ) ( OBJ-AT ?auto_9208 ?auto_9211 ) ( IN-TRUCK ?auto_9206 ?auto_9209 ) ( not ( = ?auto_9207 ?auto_9206 ) ) ( not ( = ?auto_9208 ?auto_9206 ) ) ( TRUCK-AT ?auto_9209 ?auto_9211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9207 ?auto_9208 ?auto_9205 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9221 - OBJ
      ?auto_9222 - OBJ
      ?auto_9223 - OBJ
      ?auto_9220 - LOCATION
    )
    :vars
    (
      ?auto_9226 - LOCATION
      ?auto_9225 - CITY
      ?auto_9224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9226 ?auto_9225 ) ( IN-CITY ?auto_9220 ?auto_9225 ) ( not ( = ?auto_9220 ?auto_9226 ) ) ( OBJ-AT ?auto_9223 ?auto_9220 ) ( not ( = ?auto_9223 ?auto_9222 ) ) ( OBJ-AT ?auto_9222 ?auto_9226 ) ( IN-TRUCK ?auto_9221 ?auto_9224 ) ( not ( = ?auto_9223 ?auto_9221 ) ) ( not ( = ?auto_9222 ?auto_9221 ) ) ( TRUCK-AT ?auto_9224 ?auto_9226 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9223 ?auto_9222 ?auto_9220 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9244 - OBJ
      ?auto_9245 - OBJ
      ?auto_9246 - OBJ
      ?auto_9243 - LOCATION
    )
    :vars
    (
      ?auto_9250 - LOCATION
      ?auto_9249 - CITY
      ?auto_9248 - OBJ
      ?auto_9247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9250 ?auto_9249 ) ( IN-CITY ?auto_9243 ?auto_9249 ) ( not ( = ?auto_9243 ?auto_9250 ) ) ( OBJ-AT ?auto_9245 ?auto_9243 ) ( not ( = ?auto_9245 ?auto_9244 ) ) ( OBJ-AT ?auto_9244 ?auto_9250 ) ( IN-TRUCK ?auto_9248 ?auto_9247 ) ( not ( = ?auto_9245 ?auto_9248 ) ) ( not ( = ?auto_9244 ?auto_9248 ) ) ( TRUCK-AT ?auto_9247 ?auto_9250 ) ( OBJ-AT ?auto_9246 ?auto_9243 ) ( not ( = ?auto_9244 ?auto_9246 ) ) ( not ( = ?auto_9245 ?auto_9246 ) ) ( not ( = ?auto_9246 ?auto_9248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9245 ?auto_9244 ?auto_9243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9252 - OBJ
      ?auto_9253 - OBJ
      ?auto_9254 - OBJ
      ?auto_9251 - LOCATION
    )
    :vars
    (
      ?auto_9257 - LOCATION
      ?auto_9256 - CITY
      ?auto_9255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9257 ?auto_9256 ) ( IN-CITY ?auto_9251 ?auto_9256 ) ( not ( = ?auto_9251 ?auto_9257 ) ) ( OBJ-AT ?auto_9253 ?auto_9251 ) ( not ( = ?auto_9253 ?auto_9252 ) ) ( OBJ-AT ?auto_9252 ?auto_9257 ) ( IN-TRUCK ?auto_9254 ?auto_9255 ) ( not ( = ?auto_9253 ?auto_9254 ) ) ( not ( = ?auto_9252 ?auto_9254 ) ) ( TRUCK-AT ?auto_9255 ?auto_9257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9253 ?auto_9252 ?auto_9251 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9267 - OBJ
      ?auto_9268 - OBJ
      ?auto_9269 - OBJ
      ?auto_9266 - LOCATION
    )
    :vars
    (
      ?auto_9272 - LOCATION
      ?auto_9271 - CITY
      ?auto_9270 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9272 ?auto_9271 ) ( IN-CITY ?auto_9266 ?auto_9271 ) ( not ( = ?auto_9266 ?auto_9272 ) ) ( OBJ-AT ?auto_9269 ?auto_9266 ) ( not ( = ?auto_9269 ?auto_9267 ) ) ( OBJ-AT ?auto_9267 ?auto_9272 ) ( IN-TRUCK ?auto_9268 ?auto_9270 ) ( not ( = ?auto_9269 ?auto_9268 ) ) ( not ( = ?auto_9267 ?auto_9268 ) ) ( TRUCK-AT ?auto_9270 ?auto_9272 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9269 ?auto_9267 ?auto_9266 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9315 - OBJ
      ?auto_9314 - LOCATION
    )
    :vars
    (
      ?auto_9320 - LOCATION
      ?auto_9319 - CITY
      ?auto_9317 - OBJ
      ?auto_9318 - OBJ
      ?auto_9316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9320 ?auto_9319 ) ( IN-CITY ?auto_9314 ?auto_9319 ) ( not ( = ?auto_9314 ?auto_9320 ) ) ( OBJ-AT ?auto_9317 ?auto_9314 ) ( not ( = ?auto_9317 ?auto_9315 ) ) ( OBJ-AT ?auto_9315 ?auto_9320 ) ( not ( = ?auto_9317 ?auto_9318 ) ) ( not ( = ?auto_9315 ?auto_9318 ) ) ( TRUCK-AT ?auto_9316 ?auto_9320 ) ( OBJ-AT ?auto_9318 ?auto_9320 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9318 ?auto_9316 ?auto_9320 )
      ( DELIVER-2PKG ?auto_9317 ?auto_9315 ?auto_9314 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9322 - OBJ
      ?auto_9323 - OBJ
      ?auto_9321 - LOCATION
    )
    :vars
    (
      ?auto_9324 - LOCATION
      ?auto_9325 - CITY
      ?auto_9327 - OBJ
      ?auto_9326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9324 ?auto_9325 ) ( IN-CITY ?auto_9321 ?auto_9325 ) ( not ( = ?auto_9321 ?auto_9324 ) ) ( OBJ-AT ?auto_9322 ?auto_9321 ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( OBJ-AT ?auto_9323 ?auto_9324 ) ( not ( = ?auto_9322 ?auto_9327 ) ) ( not ( = ?auto_9323 ?auto_9327 ) ) ( TRUCK-AT ?auto_9326 ?auto_9324 ) ( OBJ-AT ?auto_9327 ?auto_9324 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9323 ?auto_9321 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9329 - OBJ
      ?auto_9330 - OBJ
      ?auto_9328 - LOCATION
    )
    :vars
    (
      ?auto_9331 - LOCATION
      ?auto_9332 - CITY
      ?auto_9334 - OBJ
      ?auto_9333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9331 ?auto_9332 ) ( IN-CITY ?auto_9328 ?auto_9332 ) ( not ( = ?auto_9328 ?auto_9331 ) ) ( OBJ-AT ?auto_9334 ?auto_9328 ) ( not ( = ?auto_9334 ?auto_9330 ) ) ( OBJ-AT ?auto_9330 ?auto_9331 ) ( not ( = ?auto_9334 ?auto_9329 ) ) ( not ( = ?auto_9330 ?auto_9329 ) ) ( TRUCK-AT ?auto_9333 ?auto_9331 ) ( OBJ-AT ?auto_9329 ?auto_9331 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9334 ?auto_9330 ?auto_9328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9336 - OBJ
      ?auto_9337 - OBJ
      ?auto_9335 - LOCATION
    )
    :vars
    (
      ?auto_9338 - LOCATION
      ?auto_9339 - CITY
      ?auto_9340 - OBJ
      ?auto_9341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9338 ?auto_9339 ) ( IN-CITY ?auto_9335 ?auto_9339 ) ( not ( = ?auto_9335 ?auto_9338 ) ) ( OBJ-AT ?auto_9337 ?auto_9335 ) ( not ( = ?auto_9337 ?auto_9336 ) ) ( OBJ-AT ?auto_9336 ?auto_9338 ) ( not ( = ?auto_9337 ?auto_9340 ) ) ( not ( = ?auto_9336 ?auto_9340 ) ) ( TRUCK-AT ?auto_9341 ?auto_9338 ) ( OBJ-AT ?auto_9340 ?auto_9338 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9337 ?auto_9336 ?auto_9335 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9343 - OBJ
      ?auto_9344 - OBJ
      ?auto_9342 - LOCATION
    )
    :vars
    (
      ?auto_9345 - LOCATION
      ?auto_9346 - CITY
      ?auto_9348 - OBJ
      ?auto_9347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9345 ?auto_9346 ) ( IN-CITY ?auto_9342 ?auto_9346 ) ( not ( = ?auto_9342 ?auto_9345 ) ) ( OBJ-AT ?auto_9348 ?auto_9342 ) ( not ( = ?auto_9348 ?auto_9343 ) ) ( OBJ-AT ?auto_9343 ?auto_9345 ) ( not ( = ?auto_9348 ?auto_9344 ) ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( TRUCK-AT ?auto_9347 ?auto_9345 ) ( OBJ-AT ?auto_9344 ?auto_9345 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9348 ?auto_9343 ?auto_9342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9358 - OBJ
      ?auto_9359 - OBJ
      ?auto_9360 - OBJ
      ?auto_9357 - LOCATION
    )
    :vars
    (
      ?auto_9361 - LOCATION
      ?auto_9362 - CITY
      ?auto_9363 - OBJ
      ?auto_9364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9361 ?auto_9362 ) ( IN-CITY ?auto_9357 ?auto_9362 ) ( not ( = ?auto_9357 ?auto_9361 ) ) ( OBJ-AT ?auto_9358 ?auto_9357 ) ( not ( = ?auto_9358 ?auto_9360 ) ) ( OBJ-AT ?auto_9360 ?auto_9361 ) ( not ( = ?auto_9358 ?auto_9363 ) ) ( not ( = ?auto_9360 ?auto_9363 ) ) ( TRUCK-AT ?auto_9364 ?auto_9361 ) ( OBJ-AT ?auto_9363 ?auto_9361 ) ( OBJ-AT ?auto_9359 ?auto_9357 ) ( not ( = ?auto_9358 ?auto_9359 ) ) ( not ( = ?auto_9359 ?auto_9360 ) ) ( not ( = ?auto_9359 ?auto_9363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9358 ?auto_9360 ?auto_9357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9366 - OBJ
      ?auto_9367 - OBJ
      ?auto_9368 - OBJ
      ?auto_9365 - LOCATION
    )
    :vars
    (
      ?auto_9369 - LOCATION
      ?auto_9370 - CITY
      ?auto_9371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9369 ?auto_9370 ) ( IN-CITY ?auto_9365 ?auto_9370 ) ( not ( = ?auto_9365 ?auto_9369 ) ) ( OBJ-AT ?auto_9366 ?auto_9365 ) ( not ( = ?auto_9366 ?auto_9368 ) ) ( OBJ-AT ?auto_9368 ?auto_9369 ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9368 ?auto_9367 ) ) ( TRUCK-AT ?auto_9371 ?auto_9369 ) ( OBJ-AT ?auto_9367 ?auto_9369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9366 ?auto_9368 ?auto_9365 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9373 - OBJ
      ?auto_9374 - OBJ
      ?auto_9375 - OBJ
      ?auto_9372 - LOCATION
    )
    :vars
    (
      ?auto_9376 - LOCATION
      ?auto_9377 - CITY
      ?auto_9378 - OBJ
      ?auto_9379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9376 ?auto_9377 ) ( IN-CITY ?auto_9372 ?auto_9377 ) ( not ( = ?auto_9372 ?auto_9376 ) ) ( OBJ-AT ?auto_9375 ?auto_9372 ) ( not ( = ?auto_9375 ?auto_9374 ) ) ( OBJ-AT ?auto_9374 ?auto_9376 ) ( not ( = ?auto_9375 ?auto_9378 ) ) ( not ( = ?auto_9374 ?auto_9378 ) ) ( TRUCK-AT ?auto_9379 ?auto_9376 ) ( OBJ-AT ?auto_9378 ?auto_9376 ) ( OBJ-AT ?auto_9373 ?auto_9372 ) ( not ( = ?auto_9373 ?auto_9374 ) ) ( not ( = ?auto_9373 ?auto_9375 ) ) ( not ( = ?auto_9373 ?auto_9378 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9375 ?auto_9374 ?auto_9372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9381 - OBJ
      ?auto_9382 - OBJ
      ?auto_9383 - OBJ
      ?auto_9380 - LOCATION
    )
    :vars
    (
      ?auto_9384 - LOCATION
      ?auto_9385 - CITY
      ?auto_9386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9384 ?auto_9385 ) ( IN-CITY ?auto_9380 ?auto_9385 ) ( not ( = ?auto_9380 ?auto_9384 ) ) ( OBJ-AT ?auto_9381 ?auto_9380 ) ( not ( = ?auto_9381 ?auto_9382 ) ) ( OBJ-AT ?auto_9382 ?auto_9384 ) ( not ( = ?auto_9381 ?auto_9383 ) ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( TRUCK-AT ?auto_9386 ?auto_9384 ) ( OBJ-AT ?auto_9383 ?auto_9384 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9381 ?auto_9382 ?auto_9380 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9396 - OBJ
      ?auto_9397 - OBJ
      ?auto_9398 - OBJ
      ?auto_9395 - LOCATION
    )
    :vars
    (
      ?auto_9399 - LOCATION
      ?auto_9400 - CITY
      ?auto_9401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9399 ?auto_9400 ) ( IN-CITY ?auto_9395 ?auto_9400 ) ( not ( = ?auto_9395 ?auto_9399 ) ) ( OBJ-AT ?auto_9397 ?auto_9395 ) ( not ( = ?auto_9397 ?auto_9398 ) ) ( OBJ-AT ?auto_9398 ?auto_9399 ) ( not ( = ?auto_9397 ?auto_9396 ) ) ( not ( = ?auto_9398 ?auto_9396 ) ) ( TRUCK-AT ?auto_9401 ?auto_9399 ) ( OBJ-AT ?auto_9396 ?auto_9399 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9397 ?auto_9398 ?auto_9395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9411 - OBJ
      ?auto_9412 - OBJ
      ?auto_9413 - OBJ
      ?auto_9410 - LOCATION
    )
    :vars
    (
      ?auto_9414 - LOCATION
      ?auto_9415 - CITY
      ?auto_9416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9414 ?auto_9415 ) ( IN-CITY ?auto_9410 ?auto_9415 ) ( not ( = ?auto_9410 ?auto_9414 ) ) ( OBJ-AT ?auto_9413 ?auto_9410 ) ( not ( = ?auto_9413 ?auto_9412 ) ) ( OBJ-AT ?auto_9412 ?auto_9414 ) ( not ( = ?auto_9413 ?auto_9411 ) ) ( not ( = ?auto_9412 ?auto_9411 ) ) ( TRUCK-AT ?auto_9416 ?auto_9414 ) ( OBJ-AT ?auto_9411 ?auto_9414 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9413 ?auto_9412 ?auto_9410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9434 - OBJ
      ?auto_9435 - OBJ
      ?auto_9436 - OBJ
      ?auto_9433 - LOCATION
    )
    :vars
    (
      ?auto_9437 - LOCATION
      ?auto_9438 - CITY
      ?auto_9439 - OBJ
      ?auto_9440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9437 ?auto_9438 ) ( IN-CITY ?auto_9433 ?auto_9438 ) ( not ( = ?auto_9433 ?auto_9437 ) ) ( OBJ-AT ?auto_9435 ?auto_9433 ) ( not ( = ?auto_9435 ?auto_9434 ) ) ( OBJ-AT ?auto_9434 ?auto_9437 ) ( not ( = ?auto_9435 ?auto_9439 ) ) ( not ( = ?auto_9434 ?auto_9439 ) ) ( TRUCK-AT ?auto_9440 ?auto_9437 ) ( OBJ-AT ?auto_9439 ?auto_9437 ) ( OBJ-AT ?auto_9436 ?auto_9433 ) ( not ( = ?auto_9434 ?auto_9436 ) ) ( not ( = ?auto_9435 ?auto_9436 ) ) ( not ( = ?auto_9436 ?auto_9439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9435 ?auto_9434 ?auto_9433 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9442 - OBJ
      ?auto_9443 - OBJ
      ?auto_9444 - OBJ
      ?auto_9441 - LOCATION
    )
    :vars
    (
      ?auto_9445 - LOCATION
      ?auto_9446 - CITY
      ?auto_9447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9445 ?auto_9446 ) ( IN-CITY ?auto_9441 ?auto_9446 ) ( not ( = ?auto_9441 ?auto_9445 ) ) ( OBJ-AT ?auto_9443 ?auto_9441 ) ( not ( = ?auto_9443 ?auto_9442 ) ) ( OBJ-AT ?auto_9442 ?auto_9445 ) ( not ( = ?auto_9443 ?auto_9444 ) ) ( not ( = ?auto_9442 ?auto_9444 ) ) ( TRUCK-AT ?auto_9447 ?auto_9445 ) ( OBJ-AT ?auto_9444 ?auto_9445 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9443 ?auto_9442 ?auto_9441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9457 - OBJ
      ?auto_9458 - OBJ
      ?auto_9459 - OBJ
      ?auto_9456 - LOCATION
    )
    :vars
    (
      ?auto_9460 - LOCATION
      ?auto_9461 - CITY
      ?auto_9462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9460 ?auto_9461 ) ( IN-CITY ?auto_9456 ?auto_9461 ) ( not ( = ?auto_9456 ?auto_9460 ) ) ( OBJ-AT ?auto_9459 ?auto_9456 ) ( not ( = ?auto_9459 ?auto_9457 ) ) ( OBJ-AT ?auto_9457 ?auto_9460 ) ( not ( = ?auto_9459 ?auto_9458 ) ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( TRUCK-AT ?auto_9462 ?auto_9460 ) ( OBJ-AT ?auto_9458 ?auto_9460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9459 ?auto_9457 ?auto_9456 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9505 - OBJ
      ?auto_9504 - LOCATION
    )
    :vars
    (
      ?auto_9506 - LOCATION
      ?auto_9507 - CITY
      ?auto_9510 - OBJ
      ?auto_9508 - OBJ
      ?auto_9509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9506 ?auto_9507 ) ( IN-CITY ?auto_9504 ?auto_9507 ) ( not ( = ?auto_9504 ?auto_9506 ) ) ( OBJ-AT ?auto_9510 ?auto_9504 ) ( not ( = ?auto_9510 ?auto_9505 ) ) ( OBJ-AT ?auto_9505 ?auto_9506 ) ( not ( = ?auto_9510 ?auto_9508 ) ) ( not ( = ?auto_9505 ?auto_9508 ) ) ( OBJ-AT ?auto_9508 ?auto_9506 ) ( TRUCK-AT ?auto_9509 ?auto_9504 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9509 ?auto_9504 ?auto_9506 ?auto_9507 )
      ( DELIVER-2PKG ?auto_9510 ?auto_9505 ?auto_9504 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9512 - OBJ
      ?auto_9513 - OBJ
      ?auto_9511 - LOCATION
    )
    :vars
    (
      ?auto_9517 - LOCATION
      ?auto_9516 - CITY
      ?auto_9515 - OBJ
      ?auto_9514 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9517 ?auto_9516 ) ( IN-CITY ?auto_9511 ?auto_9516 ) ( not ( = ?auto_9511 ?auto_9517 ) ) ( OBJ-AT ?auto_9512 ?auto_9511 ) ( not ( = ?auto_9512 ?auto_9513 ) ) ( OBJ-AT ?auto_9513 ?auto_9517 ) ( not ( = ?auto_9512 ?auto_9515 ) ) ( not ( = ?auto_9513 ?auto_9515 ) ) ( OBJ-AT ?auto_9515 ?auto_9517 ) ( TRUCK-AT ?auto_9514 ?auto_9511 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9513 ?auto_9511 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9519 - OBJ
      ?auto_9520 - OBJ
      ?auto_9518 - LOCATION
    )
    :vars
    (
      ?auto_9521 - LOCATION
      ?auto_9523 - CITY
      ?auto_9524 - OBJ
      ?auto_9522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9521 ?auto_9523 ) ( IN-CITY ?auto_9518 ?auto_9523 ) ( not ( = ?auto_9518 ?auto_9521 ) ) ( OBJ-AT ?auto_9524 ?auto_9518 ) ( not ( = ?auto_9524 ?auto_9520 ) ) ( OBJ-AT ?auto_9520 ?auto_9521 ) ( not ( = ?auto_9524 ?auto_9519 ) ) ( not ( = ?auto_9520 ?auto_9519 ) ) ( OBJ-AT ?auto_9519 ?auto_9521 ) ( TRUCK-AT ?auto_9522 ?auto_9518 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9524 ?auto_9520 ?auto_9518 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9526 - OBJ
      ?auto_9527 - OBJ
      ?auto_9525 - LOCATION
    )
    :vars
    (
      ?auto_9528 - LOCATION
      ?auto_9530 - CITY
      ?auto_9531 - OBJ
      ?auto_9529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9528 ?auto_9530 ) ( IN-CITY ?auto_9525 ?auto_9530 ) ( not ( = ?auto_9525 ?auto_9528 ) ) ( OBJ-AT ?auto_9527 ?auto_9525 ) ( not ( = ?auto_9527 ?auto_9526 ) ) ( OBJ-AT ?auto_9526 ?auto_9528 ) ( not ( = ?auto_9527 ?auto_9531 ) ) ( not ( = ?auto_9526 ?auto_9531 ) ) ( OBJ-AT ?auto_9531 ?auto_9528 ) ( TRUCK-AT ?auto_9529 ?auto_9525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9527 ?auto_9526 ?auto_9525 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9533 - OBJ
      ?auto_9534 - OBJ
      ?auto_9532 - LOCATION
    )
    :vars
    (
      ?auto_9535 - LOCATION
      ?auto_9537 - CITY
      ?auto_9538 - OBJ
      ?auto_9536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9535 ?auto_9537 ) ( IN-CITY ?auto_9532 ?auto_9537 ) ( not ( = ?auto_9532 ?auto_9535 ) ) ( OBJ-AT ?auto_9538 ?auto_9532 ) ( not ( = ?auto_9538 ?auto_9533 ) ) ( OBJ-AT ?auto_9533 ?auto_9535 ) ( not ( = ?auto_9538 ?auto_9534 ) ) ( not ( = ?auto_9533 ?auto_9534 ) ) ( OBJ-AT ?auto_9534 ?auto_9535 ) ( TRUCK-AT ?auto_9536 ?auto_9532 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9538 ?auto_9533 ?auto_9532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9548 - OBJ
      ?auto_9549 - OBJ
      ?auto_9550 - OBJ
      ?auto_9547 - LOCATION
    )
    :vars
    (
      ?auto_9551 - LOCATION
      ?auto_9553 - CITY
      ?auto_9554 - OBJ
      ?auto_9552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9551 ?auto_9553 ) ( IN-CITY ?auto_9547 ?auto_9553 ) ( not ( = ?auto_9547 ?auto_9551 ) ) ( OBJ-AT ?auto_9548 ?auto_9547 ) ( not ( = ?auto_9548 ?auto_9550 ) ) ( OBJ-AT ?auto_9550 ?auto_9551 ) ( not ( = ?auto_9548 ?auto_9554 ) ) ( not ( = ?auto_9550 ?auto_9554 ) ) ( OBJ-AT ?auto_9554 ?auto_9551 ) ( TRUCK-AT ?auto_9552 ?auto_9547 ) ( OBJ-AT ?auto_9549 ?auto_9547 ) ( not ( = ?auto_9548 ?auto_9549 ) ) ( not ( = ?auto_9549 ?auto_9550 ) ) ( not ( = ?auto_9549 ?auto_9554 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9548 ?auto_9550 ?auto_9547 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9556 - OBJ
      ?auto_9557 - OBJ
      ?auto_9558 - OBJ
      ?auto_9555 - LOCATION
    )
    :vars
    (
      ?auto_9559 - LOCATION
      ?auto_9561 - CITY
      ?auto_9560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9559 ?auto_9561 ) ( IN-CITY ?auto_9555 ?auto_9561 ) ( not ( = ?auto_9555 ?auto_9559 ) ) ( OBJ-AT ?auto_9556 ?auto_9555 ) ( not ( = ?auto_9556 ?auto_9558 ) ) ( OBJ-AT ?auto_9558 ?auto_9559 ) ( not ( = ?auto_9556 ?auto_9557 ) ) ( not ( = ?auto_9558 ?auto_9557 ) ) ( OBJ-AT ?auto_9557 ?auto_9559 ) ( TRUCK-AT ?auto_9560 ?auto_9555 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9556 ?auto_9558 ?auto_9555 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9563 - OBJ
      ?auto_9564 - OBJ
      ?auto_9565 - OBJ
      ?auto_9562 - LOCATION
    )
    :vars
    (
      ?auto_9566 - LOCATION
      ?auto_9568 - CITY
      ?auto_9569 - OBJ
      ?auto_9567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9566 ?auto_9568 ) ( IN-CITY ?auto_9562 ?auto_9568 ) ( not ( = ?auto_9562 ?auto_9566 ) ) ( OBJ-AT ?auto_9565 ?auto_9562 ) ( not ( = ?auto_9565 ?auto_9564 ) ) ( OBJ-AT ?auto_9564 ?auto_9566 ) ( not ( = ?auto_9565 ?auto_9569 ) ) ( not ( = ?auto_9564 ?auto_9569 ) ) ( OBJ-AT ?auto_9569 ?auto_9566 ) ( TRUCK-AT ?auto_9567 ?auto_9562 ) ( OBJ-AT ?auto_9563 ?auto_9562 ) ( not ( = ?auto_9563 ?auto_9564 ) ) ( not ( = ?auto_9563 ?auto_9565 ) ) ( not ( = ?auto_9563 ?auto_9569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9565 ?auto_9564 ?auto_9562 ) )
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
      ?auto_9576 - CITY
      ?auto_9575 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9574 ?auto_9576 ) ( IN-CITY ?auto_9570 ?auto_9576 ) ( not ( = ?auto_9570 ?auto_9574 ) ) ( OBJ-AT ?auto_9571 ?auto_9570 ) ( not ( = ?auto_9571 ?auto_9572 ) ) ( OBJ-AT ?auto_9572 ?auto_9574 ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( not ( = ?auto_9572 ?auto_9573 ) ) ( OBJ-AT ?auto_9573 ?auto_9574 ) ( TRUCK-AT ?auto_9575 ?auto_9570 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9571 ?auto_9572 ?auto_9570 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9586 - OBJ
      ?auto_9587 - OBJ
      ?auto_9588 - OBJ
      ?auto_9585 - LOCATION
    )
    :vars
    (
      ?auto_9589 - LOCATION
      ?auto_9591 - CITY
      ?auto_9590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9589 ?auto_9591 ) ( IN-CITY ?auto_9585 ?auto_9591 ) ( not ( = ?auto_9585 ?auto_9589 ) ) ( OBJ-AT ?auto_9587 ?auto_9585 ) ( not ( = ?auto_9587 ?auto_9588 ) ) ( OBJ-AT ?auto_9588 ?auto_9589 ) ( not ( = ?auto_9587 ?auto_9586 ) ) ( not ( = ?auto_9588 ?auto_9586 ) ) ( OBJ-AT ?auto_9586 ?auto_9589 ) ( TRUCK-AT ?auto_9590 ?auto_9585 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9587 ?auto_9588 ?auto_9585 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9601 - OBJ
      ?auto_9602 - OBJ
      ?auto_9603 - OBJ
      ?auto_9600 - LOCATION
    )
    :vars
    (
      ?auto_9604 - LOCATION
      ?auto_9606 - CITY
      ?auto_9605 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9604 ?auto_9606 ) ( IN-CITY ?auto_9600 ?auto_9606 ) ( not ( = ?auto_9600 ?auto_9604 ) ) ( OBJ-AT ?auto_9603 ?auto_9600 ) ( not ( = ?auto_9603 ?auto_9602 ) ) ( OBJ-AT ?auto_9602 ?auto_9604 ) ( not ( = ?auto_9603 ?auto_9601 ) ) ( not ( = ?auto_9602 ?auto_9601 ) ) ( OBJ-AT ?auto_9601 ?auto_9604 ) ( TRUCK-AT ?auto_9605 ?auto_9600 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9603 ?auto_9602 ?auto_9600 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9624 - OBJ
      ?auto_9625 - OBJ
      ?auto_9626 - OBJ
      ?auto_9623 - LOCATION
    )
    :vars
    (
      ?auto_9627 - LOCATION
      ?auto_9629 - CITY
      ?auto_9630 - OBJ
      ?auto_9628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9627 ?auto_9629 ) ( IN-CITY ?auto_9623 ?auto_9629 ) ( not ( = ?auto_9623 ?auto_9627 ) ) ( OBJ-AT ?auto_9625 ?auto_9623 ) ( not ( = ?auto_9625 ?auto_9624 ) ) ( OBJ-AT ?auto_9624 ?auto_9627 ) ( not ( = ?auto_9625 ?auto_9630 ) ) ( not ( = ?auto_9624 ?auto_9630 ) ) ( OBJ-AT ?auto_9630 ?auto_9627 ) ( TRUCK-AT ?auto_9628 ?auto_9623 ) ( OBJ-AT ?auto_9626 ?auto_9623 ) ( not ( = ?auto_9624 ?auto_9626 ) ) ( not ( = ?auto_9625 ?auto_9626 ) ) ( not ( = ?auto_9626 ?auto_9630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9625 ?auto_9624 ?auto_9623 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9632 - OBJ
      ?auto_9633 - OBJ
      ?auto_9634 - OBJ
      ?auto_9631 - LOCATION
    )
    :vars
    (
      ?auto_9635 - LOCATION
      ?auto_9637 - CITY
      ?auto_9636 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9635 ?auto_9637 ) ( IN-CITY ?auto_9631 ?auto_9637 ) ( not ( = ?auto_9631 ?auto_9635 ) ) ( OBJ-AT ?auto_9633 ?auto_9631 ) ( not ( = ?auto_9633 ?auto_9632 ) ) ( OBJ-AT ?auto_9632 ?auto_9635 ) ( not ( = ?auto_9633 ?auto_9634 ) ) ( not ( = ?auto_9632 ?auto_9634 ) ) ( OBJ-AT ?auto_9634 ?auto_9635 ) ( TRUCK-AT ?auto_9636 ?auto_9631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9633 ?auto_9632 ?auto_9631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9647 - OBJ
      ?auto_9648 - OBJ
      ?auto_9649 - OBJ
      ?auto_9646 - LOCATION
    )
    :vars
    (
      ?auto_9650 - LOCATION
      ?auto_9652 - CITY
      ?auto_9651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9650 ?auto_9652 ) ( IN-CITY ?auto_9646 ?auto_9652 ) ( not ( = ?auto_9646 ?auto_9650 ) ) ( OBJ-AT ?auto_9649 ?auto_9646 ) ( not ( = ?auto_9649 ?auto_9647 ) ) ( OBJ-AT ?auto_9647 ?auto_9650 ) ( not ( = ?auto_9649 ?auto_9648 ) ) ( not ( = ?auto_9647 ?auto_9648 ) ) ( OBJ-AT ?auto_9648 ?auto_9650 ) ( TRUCK-AT ?auto_9651 ?auto_9646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9649 ?auto_9647 ?auto_9646 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9695 - OBJ
      ?auto_9694 - LOCATION
    )
    :vars
    (
      ?auto_9696 - LOCATION
      ?auto_9698 - CITY
      ?auto_9700 - OBJ
      ?auto_9699 - OBJ
      ?auto_9697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9696 ?auto_9698 ) ( IN-CITY ?auto_9694 ?auto_9698 ) ( not ( = ?auto_9694 ?auto_9696 ) ) ( not ( = ?auto_9700 ?auto_9695 ) ) ( OBJ-AT ?auto_9695 ?auto_9696 ) ( not ( = ?auto_9700 ?auto_9699 ) ) ( not ( = ?auto_9695 ?auto_9699 ) ) ( OBJ-AT ?auto_9699 ?auto_9696 ) ( TRUCK-AT ?auto_9697 ?auto_9694 ) ( IN-TRUCK ?auto_9700 ?auto_9697 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9700 ?auto_9694 )
      ( DELIVER-2PKG ?auto_9700 ?auto_9695 ?auto_9694 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9702 - OBJ
      ?auto_9703 - OBJ
      ?auto_9701 - LOCATION
    )
    :vars
    (
      ?auto_9707 - LOCATION
      ?auto_9705 - CITY
      ?auto_9706 - OBJ
      ?auto_9704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9707 ?auto_9705 ) ( IN-CITY ?auto_9701 ?auto_9705 ) ( not ( = ?auto_9701 ?auto_9707 ) ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( OBJ-AT ?auto_9703 ?auto_9707 ) ( not ( = ?auto_9702 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( OBJ-AT ?auto_9706 ?auto_9707 ) ( TRUCK-AT ?auto_9704 ?auto_9701 ) ( IN-TRUCK ?auto_9702 ?auto_9704 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9703 ?auto_9701 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9709 - OBJ
      ?auto_9710 - OBJ
      ?auto_9708 - LOCATION
    )
    :vars
    (
      ?auto_9711 - LOCATION
      ?auto_9712 - CITY
      ?auto_9714 - OBJ
      ?auto_9713 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9711 ?auto_9712 ) ( IN-CITY ?auto_9708 ?auto_9712 ) ( not ( = ?auto_9708 ?auto_9711 ) ) ( not ( = ?auto_9714 ?auto_9710 ) ) ( OBJ-AT ?auto_9710 ?auto_9711 ) ( not ( = ?auto_9714 ?auto_9709 ) ) ( not ( = ?auto_9710 ?auto_9709 ) ) ( OBJ-AT ?auto_9709 ?auto_9711 ) ( TRUCK-AT ?auto_9713 ?auto_9708 ) ( IN-TRUCK ?auto_9714 ?auto_9713 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9714 ?auto_9710 ?auto_9708 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9716 - OBJ
      ?auto_9717 - OBJ
      ?auto_9715 - LOCATION
    )
    :vars
    (
      ?auto_9719 - LOCATION
      ?auto_9720 - CITY
      ?auto_9718 - OBJ
      ?auto_9721 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9719 ?auto_9720 ) ( IN-CITY ?auto_9715 ?auto_9720 ) ( not ( = ?auto_9715 ?auto_9719 ) ) ( not ( = ?auto_9717 ?auto_9716 ) ) ( OBJ-AT ?auto_9716 ?auto_9719 ) ( not ( = ?auto_9717 ?auto_9718 ) ) ( not ( = ?auto_9716 ?auto_9718 ) ) ( OBJ-AT ?auto_9718 ?auto_9719 ) ( TRUCK-AT ?auto_9721 ?auto_9715 ) ( IN-TRUCK ?auto_9717 ?auto_9721 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9717 ?auto_9716 ?auto_9715 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9723 - OBJ
      ?auto_9724 - OBJ
      ?auto_9722 - LOCATION
    )
    :vars
    (
      ?auto_9725 - LOCATION
      ?auto_9726 - CITY
      ?auto_9728 - OBJ
      ?auto_9727 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9725 ?auto_9726 ) ( IN-CITY ?auto_9722 ?auto_9726 ) ( not ( = ?auto_9722 ?auto_9725 ) ) ( not ( = ?auto_9728 ?auto_9723 ) ) ( OBJ-AT ?auto_9723 ?auto_9725 ) ( not ( = ?auto_9728 ?auto_9724 ) ) ( not ( = ?auto_9723 ?auto_9724 ) ) ( OBJ-AT ?auto_9724 ?auto_9725 ) ( TRUCK-AT ?auto_9727 ?auto_9722 ) ( IN-TRUCK ?auto_9728 ?auto_9727 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9728 ?auto_9723 ?auto_9722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9746 - OBJ
      ?auto_9747 - OBJ
      ?auto_9748 - OBJ
      ?auto_9745 - LOCATION
    )
    :vars
    (
      ?auto_9749 - LOCATION
      ?auto_9750 - CITY
      ?auto_9751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9749 ?auto_9750 ) ( IN-CITY ?auto_9745 ?auto_9750 ) ( not ( = ?auto_9745 ?auto_9749 ) ) ( not ( = ?auto_9746 ?auto_9748 ) ) ( OBJ-AT ?auto_9748 ?auto_9749 ) ( not ( = ?auto_9746 ?auto_9747 ) ) ( not ( = ?auto_9748 ?auto_9747 ) ) ( OBJ-AT ?auto_9747 ?auto_9749 ) ( TRUCK-AT ?auto_9751 ?auto_9745 ) ( IN-TRUCK ?auto_9746 ?auto_9751 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9746 ?auto_9748 ?auto_9745 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9761 - OBJ
      ?auto_9762 - OBJ
      ?auto_9763 - OBJ
      ?auto_9760 - LOCATION
    )
    :vars
    (
      ?auto_9764 - LOCATION
      ?auto_9765 - CITY
      ?auto_9766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9764 ?auto_9765 ) ( IN-CITY ?auto_9760 ?auto_9765 ) ( not ( = ?auto_9760 ?auto_9764 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( OBJ-AT ?auto_9762 ?auto_9764 ) ( not ( = ?auto_9761 ?auto_9763 ) ) ( not ( = ?auto_9762 ?auto_9763 ) ) ( OBJ-AT ?auto_9763 ?auto_9764 ) ( TRUCK-AT ?auto_9766 ?auto_9760 ) ( IN-TRUCK ?auto_9761 ?auto_9766 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9761 ?auto_9762 ?auto_9760 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9776 - OBJ
      ?auto_9777 - OBJ
      ?auto_9778 - OBJ
      ?auto_9775 - LOCATION
    )
    :vars
    (
      ?auto_9779 - LOCATION
      ?auto_9780 - CITY
      ?auto_9781 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9779 ?auto_9780 ) ( IN-CITY ?auto_9775 ?auto_9780 ) ( not ( = ?auto_9775 ?auto_9779 ) ) ( not ( = ?auto_9777 ?auto_9778 ) ) ( OBJ-AT ?auto_9778 ?auto_9779 ) ( not ( = ?auto_9777 ?auto_9776 ) ) ( not ( = ?auto_9778 ?auto_9776 ) ) ( OBJ-AT ?auto_9776 ?auto_9779 ) ( TRUCK-AT ?auto_9781 ?auto_9775 ) ( IN-TRUCK ?auto_9777 ?auto_9781 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9777 ?auto_9778 ?auto_9775 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9791 - OBJ
      ?auto_9792 - OBJ
      ?auto_9793 - OBJ
      ?auto_9790 - LOCATION
    )
    :vars
    (
      ?auto_9794 - LOCATION
      ?auto_9795 - CITY
      ?auto_9796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9794 ?auto_9795 ) ( IN-CITY ?auto_9790 ?auto_9795 ) ( not ( = ?auto_9790 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9792 ) ) ( OBJ-AT ?auto_9792 ?auto_9794 ) ( not ( = ?auto_9793 ?auto_9791 ) ) ( not ( = ?auto_9792 ?auto_9791 ) ) ( OBJ-AT ?auto_9791 ?auto_9794 ) ( TRUCK-AT ?auto_9796 ?auto_9790 ) ( IN-TRUCK ?auto_9793 ?auto_9796 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9793 ?auto_9792 ?auto_9790 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9822 - OBJ
      ?auto_9823 - OBJ
      ?auto_9824 - OBJ
      ?auto_9821 - LOCATION
    )
    :vars
    (
      ?auto_9825 - LOCATION
      ?auto_9826 - CITY
      ?auto_9827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9825 ?auto_9826 ) ( IN-CITY ?auto_9821 ?auto_9826 ) ( not ( = ?auto_9821 ?auto_9825 ) ) ( not ( = ?auto_9823 ?auto_9822 ) ) ( OBJ-AT ?auto_9822 ?auto_9825 ) ( not ( = ?auto_9823 ?auto_9824 ) ) ( not ( = ?auto_9822 ?auto_9824 ) ) ( OBJ-AT ?auto_9824 ?auto_9825 ) ( TRUCK-AT ?auto_9827 ?auto_9821 ) ( IN-TRUCK ?auto_9823 ?auto_9827 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9823 ?auto_9822 ?auto_9821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9837 - OBJ
      ?auto_9838 - OBJ
      ?auto_9839 - OBJ
      ?auto_9836 - LOCATION
    )
    :vars
    (
      ?auto_9840 - LOCATION
      ?auto_9841 - CITY
      ?auto_9842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9840 ?auto_9841 ) ( IN-CITY ?auto_9836 ?auto_9841 ) ( not ( = ?auto_9836 ?auto_9840 ) ) ( not ( = ?auto_9839 ?auto_9837 ) ) ( OBJ-AT ?auto_9837 ?auto_9840 ) ( not ( = ?auto_9839 ?auto_9838 ) ) ( not ( = ?auto_9837 ?auto_9838 ) ) ( OBJ-AT ?auto_9838 ?auto_9840 ) ( TRUCK-AT ?auto_9842 ?auto_9836 ) ( IN-TRUCK ?auto_9839 ?auto_9842 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9839 ?auto_9837 ?auto_9836 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9885 - OBJ
      ?auto_9884 - LOCATION
    )
    :vars
    (
      ?auto_9887 - LOCATION
      ?auto_9888 - CITY
      ?auto_9890 - OBJ
      ?auto_9886 - OBJ
      ?auto_9889 - TRUCK
      ?auto_9891 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9887 ?auto_9888 ) ( IN-CITY ?auto_9884 ?auto_9888 ) ( not ( = ?auto_9884 ?auto_9887 ) ) ( not ( = ?auto_9890 ?auto_9885 ) ) ( OBJ-AT ?auto_9885 ?auto_9887 ) ( not ( = ?auto_9890 ?auto_9886 ) ) ( not ( = ?auto_9885 ?auto_9886 ) ) ( OBJ-AT ?auto_9886 ?auto_9887 ) ( IN-TRUCK ?auto_9890 ?auto_9889 ) ( TRUCK-AT ?auto_9889 ?auto_9891 ) ( IN-CITY ?auto_9891 ?auto_9888 ) ( not ( = ?auto_9884 ?auto_9891 ) ) ( not ( = ?auto_9887 ?auto_9891 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9889 ?auto_9891 ?auto_9884 ?auto_9888 )
      ( DELIVER-2PKG ?auto_9890 ?auto_9885 ?auto_9884 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9893 - OBJ
      ?auto_9894 - OBJ
      ?auto_9892 - LOCATION
    )
    :vars
    (
      ?auto_9896 - LOCATION
      ?auto_9895 - CITY
      ?auto_9897 - OBJ
      ?auto_9899 - TRUCK
      ?auto_9898 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9896 ?auto_9895 ) ( IN-CITY ?auto_9892 ?auto_9895 ) ( not ( = ?auto_9892 ?auto_9896 ) ) ( not ( = ?auto_9893 ?auto_9894 ) ) ( OBJ-AT ?auto_9894 ?auto_9896 ) ( not ( = ?auto_9893 ?auto_9897 ) ) ( not ( = ?auto_9894 ?auto_9897 ) ) ( OBJ-AT ?auto_9897 ?auto_9896 ) ( IN-TRUCK ?auto_9893 ?auto_9899 ) ( TRUCK-AT ?auto_9899 ?auto_9898 ) ( IN-CITY ?auto_9898 ?auto_9895 ) ( not ( = ?auto_9892 ?auto_9898 ) ) ( not ( = ?auto_9896 ?auto_9898 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9894 ?auto_9892 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9901 - OBJ
      ?auto_9902 - OBJ
      ?auto_9900 - LOCATION
    )
    :vars
    (
      ?auto_9904 - LOCATION
      ?auto_9906 - CITY
      ?auto_9907 - OBJ
      ?auto_9903 - TRUCK
      ?auto_9905 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9904 ?auto_9906 ) ( IN-CITY ?auto_9900 ?auto_9906 ) ( not ( = ?auto_9900 ?auto_9904 ) ) ( not ( = ?auto_9907 ?auto_9902 ) ) ( OBJ-AT ?auto_9902 ?auto_9904 ) ( not ( = ?auto_9907 ?auto_9901 ) ) ( not ( = ?auto_9902 ?auto_9901 ) ) ( OBJ-AT ?auto_9901 ?auto_9904 ) ( IN-TRUCK ?auto_9907 ?auto_9903 ) ( TRUCK-AT ?auto_9903 ?auto_9905 ) ( IN-CITY ?auto_9905 ?auto_9906 ) ( not ( = ?auto_9900 ?auto_9905 ) ) ( not ( = ?auto_9904 ?auto_9905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9907 ?auto_9902 ?auto_9900 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9909 - OBJ
      ?auto_9910 - OBJ
      ?auto_9908 - LOCATION
    )
    :vars
    (
      ?auto_9913 - LOCATION
      ?auto_9915 - CITY
      ?auto_9912 - OBJ
      ?auto_9911 - TRUCK
      ?auto_9914 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9913 ?auto_9915 ) ( IN-CITY ?auto_9908 ?auto_9915 ) ( not ( = ?auto_9908 ?auto_9913 ) ) ( not ( = ?auto_9910 ?auto_9909 ) ) ( OBJ-AT ?auto_9909 ?auto_9913 ) ( not ( = ?auto_9910 ?auto_9912 ) ) ( not ( = ?auto_9909 ?auto_9912 ) ) ( OBJ-AT ?auto_9912 ?auto_9913 ) ( IN-TRUCK ?auto_9910 ?auto_9911 ) ( TRUCK-AT ?auto_9911 ?auto_9914 ) ( IN-CITY ?auto_9914 ?auto_9915 ) ( not ( = ?auto_9908 ?auto_9914 ) ) ( not ( = ?auto_9913 ?auto_9914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9910 ?auto_9909 ?auto_9908 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9917 - OBJ
      ?auto_9918 - OBJ
      ?auto_9916 - LOCATION
    )
    :vars
    (
      ?auto_9920 - LOCATION
      ?auto_9922 - CITY
      ?auto_9923 - OBJ
      ?auto_9919 - TRUCK
      ?auto_9921 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9920 ?auto_9922 ) ( IN-CITY ?auto_9916 ?auto_9922 ) ( not ( = ?auto_9916 ?auto_9920 ) ) ( not ( = ?auto_9923 ?auto_9917 ) ) ( OBJ-AT ?auto_9917 ?auto_9920 ) ( not ( = ?auto_9923 ?auto_9918 ) ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( OBJ-AT ?auto_9918 ?auto_9920 ) ( IN-TRUCK ?auto_9923 ?auto_9919 ) ( TRUCK-AT ?auto_9919 ?auto_9921 ) ( IN-CITY ?auto_9921 ?auto_9922 ) ( not ( = ?auto_9916 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9921 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9923 ?auto_9917 ?auto_9916 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9943 - OBJ
      ?auto_9944 - OBJ
      ?auto_9945 - OBJ
      ?auto_9942 - LOCATION
    )
    :vars
    (
      ?auto_9947 - LOCATION
      ?auto_9949 - CITY
      ?auto_9946 - TRUCK
      ?auto_9948 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9947 ?auto_9949 ) ( IN-CITY ?auto_9942 ?auto_9949 ) ( not ( = ?auto_9942 ?auto_9947 ) ) ( not ( = ?auto_9943 ?auto_9945 ) ) ( OBJ-AT ?auto_9945 ?auto_9947 ) ( not ( = ?auto_9943 ?auto_9944 ) ) ( not ( = ?auto_9945 ?auto_9944 ) ) ( OBJ-AT ?auto_9944 ?auto_9947 ) ( IN-TRUCK ?auto_9943 ?auto_9946 ) ( TRUCK-AT ?auto_9946 ?auto_9948 ) ( IN-CITY ?auto_9948 ?auto_9949 ) ( not ( = ?auto_9942 ?auto_9948 ) ) ( not ( = ?auto_9947 ?auto_9948 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9943 ?auto_9945 ?auto_9942 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9960 - OBJ
      ?auto_9961 - OBJ
      ?auto_9962 - OBJ
      ?auto_9959 - LOCATION
    )
    :vars
    (
      ?auto_9964 - LOCATION
      ?auto_9966 - CITY
      ?auto_9963 - TRUCK
      ?auto_9965 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9964 ?auto_9966 ) ( IN-CITY ?auto_9959 ?auto_9966 ) ( not ( = ?auto_9959 ?auto_9964 ) ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( OBJ-AT ?auto_9961 ?auto_9964 ) ( not ( = ?auto_9960 ?auto_9962 ) ) ( not ( = ?auto_9961 ?auto_9962 ) ) ( OBJ-AT ?auto_9962 ?auto_9964 ) ( IN-TRUCK ?auto_9960 ?auto_9963 ) ( TRUCK-AT ?auto_9963 ?auto_9965 ) ( IN-CITY ?auto_9965 ?auto_9966 ) ( not ( = ?auto_9959 ?auto_9965 ) ) ( not ( = ?auto_9964 ?auto_9965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9960 ?auto_9961 ?auto_9959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9977 - OBJ
      ?auto_9978 - OBJ
      ?auto_9979 - OBJ
      ?auto_9976 - LOCATION
    )
    :vars
    (
      ?auto_9981 - LOCATION
      ?auto_9983 - CITY
      ?auto_9980 - TRUCK
      ?auto_9982 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9981 ?auto_9983 ) ( IN-CITY ?auto_9976 ?auto_9983 ) ( not ( = ?auto_9976 ?auto_9981 ) ) ( not ( = ?auto_9978 ?auto_9979 ) ) ( OBJ-AT ?auto_9979 ?auto_9981 ) ( not ( = ?auto_9978 ?auto_9977 ) ) ( not ( = ?auto_9979 ?auto_9977 ) ) ( OBJ-AT ?auto_9977 ?auto_9981 ) ( IN-TRUCK ?auto_9978 ?auto_9980 ) ( TRUCK-AT ?auto_9980 ?auto_9982 ) ( IN-CITY ?auto_9982 ?auto_9983 ) ( not ( = ?auto_9976 ?auto_9982 ) ) ( not ( = ?auto_9981 ?auto_9982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9978 ?auto_9979 ?auto_9976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9994 - OBJ
      ?auto_9995 - OBJ
      ?auto_9996 - OBJ
      ?auto_9993 - LOCATION
    )
    :vars
    (
      ?auto_9998 - LOCATION
      ?auto_10000 - CITY
      ?auto_9997 - TRUCK
      ?auto_9999 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9998 ?auto_10000 ) ( IN-CITY ?auto_9993 ?auto_10000 ) ( not ( = ?auto_9993 ?auto_9998 ) ) ( not ( = ?auto_9996 ?auto_9995 ) ) ( OBJ-AT ?auto_9995 ?auto_9998 ) ( not ( = ?auto_9996 ?auto_9994 ) ) ( not ( = ?auto_9995 ?auto_9994 ) ) ( OBJ-AT ?auto_9994 ?auto_9998 ) ( IN-TRUCK ?auto_9996 ?auto_9997 ) ( TRUCK-AT ?auto_9997 ?auto_9999 ) ( IN-CITY ?auto_9999 ?auto_10000 ) ( not ( = ?auto_9993 ?auto_9999 ) ) ( not ( = ?auto_9998 ?auto_9999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9996 ?auto_9995 ?auto_9993 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10029 - OBJ
      ?auto_10030 - OBJ
      ?auto_10031 - OBJ
      ?auto_10028 - LOCATION
    )
    :vars
    (
      ?auto_10033 - LOCATION
      ?auto_10035 - CITY
      ?auto_10032 - TRUCK
      ?auto_10034 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10033 ?auto_10035 ) ( IN-CITY ?auto_10028 ?auto_10035 ) ( not ( = ?auto_10028 ?auto_10033 ) ) ( not ( = ?auto_10030 ?auto_10029 ) ) ( OBJ-AT ?auto_10029 ?auto_10033 ) ( not ( = ?auto_10030 ?auto_10031 ) ) ( not ( = ?auto_10029 ?auto_10031 ) ) ( OBJ-AT ?auto_10031 ?auto_10033 ) ( IN-TRUCK ?auto_10030 ?auto_10032 ) ( TRUCK-AT ?auto_10032 ?auto_10034 ) ( IN-CITY ?auto_10034 ?auto_10035 ) ( not ( = ?auto_10028 ?auto_10034 ) ) ( not ( = ?auto_10033 ?auto_10034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10030 ?auto_10029 ?auto_10028 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10046 - OBJ
      ?auto_10047 - OBJ
      ?auto_10048 - OBJ
      ?auto_10045 - LOCATION
    )
    :vars
    (
      ?auto_10050 - LOCATION
      ?auto_10052 - CITY
      ?auto_10049 - TRUCK
      ?auto_10051 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10050 ?auto_10052 ) ( IN-CITY ?auto_10045 ?auto_10052 ) ( not ( = ?auto_10045 ?auto_10050 ) ) ( not ( = ?auto_10048 ?auto_10046 ) ) ( OBJ-AT ?auto_10046 ?auto_10050 ) ( not ( = ?auto_10048 ?auto_10047 ) ) ( not ( = ?auto_10046 ?auto_10047 ) ) ( OBJ-AT ?auto_10047 ?auto_10050 ) ( IN-TRUCK ?auto_10048 ?auto_10049 ) ( TRUCK-AT ?auto_10049 ?auto_10051 ) ( IN-CITY ?auto_10051 ?auto_10052 ) ( not ( = ?auto_10045 ?auto_10051 ) ) ( not ( = ?auto_10050 ?auto_10051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10048 ?auto_10046 ?auto_10045 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10100 - OBJ
      ?auto_10099 - LOCATION
    )
    :vars
    (
      ?auto_10103 - LOCATION
      ?auto_10105 - CITY
      ?auto_10106 - OBJ
      ?auto_10102 - OBJ
      ?auto_10101 - TRUCK
      ?auto_10104 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10103 ?auto_10105 ) ( IN-CITY ?auto_10099 ?auto_10105 ) ( not ( = ?auto_10099 ?auto_10103 ) ) ( not ( = ?auto_10106 ?auto_10100 ) ) ( OBJ-AT ?auto_10100 ?auto_10103 ) ( not ( = ?auto_10106 ?auto_10102 ) ) ( not ( = ?auto_10100 ?auto_10102 ) ) ( OBJ-AT ?auto_10102 ?auto_10103 ) ( TRUCK-AT ?auto_10101 ?auto_10104 ) ( IN-CITY ?auto_10104 ?auto_10105 ) ( not ( = ?auto_10099 ?auto_10104 ) ) ( not ( = ?auto_10103 ?auto_10104 ) ) ( OBJ-AT ?auto_10106 ?auto_10104 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10106 ?auto_10101 ?auto_10104 )
      ( DELIVER-2PKG ?auto_10106 ?auto_10100 ?auto_10099 ) )
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
      ?auto_10110 - LOCATION
      ?auto_10114 - CITY
      ?auto_10112 - OBJ
      ?auto_10113 - TRUCK
      ?auto_10111 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10110 ?auto_10114 ) ( IN-CITY ?auto_10107 ?auto_10114 ) ( not ( = ?auto_10107 ?auto_10110 ) ) ( not ( = ?auto_10108 ?auto_10109 ) ) ( OBJ-AT ?auto_10109 ?auto_10110 ) ( not ( = ?auto_10108 ?auto_10112 ) ) ( not ( = ?auto_10109 ?auto_10112 ) ) ( OBJ-AT ?auto_10112 ?auto_10110 ) ( TRUCK-AT ?auto_10113 ?auto_10111 ) ( IN-CITY ?auto_10111 ?auto_10114 ) ( not ( = ?auto_10107 ?auto_10111 ) ) ( not ( = ?auto_10110 ?auto_10111 ) ) ( OBJ-AT ?auto_10108 ?auto_10111 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10109 ?auto_10107 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10116 - OBJ
      ?auto_10117 - OBJ
      ?auto_10115 - LOCATION
    )
    :vars
    (
      ?auto_10121 - LOCATION
      ?auto_10120 - CITY
      ?auto_10122 - OBJ
      ?auto_10118 - TRUCK
      ?auto_10119 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10121 ?auto_10120 ) ( IN-CITY ?auto_10115 ?auto_10120 ) ( not ( = ?auto_10115 ?auto_10121 ) ) ( not ( = ?auto_10122 ?auto_10117 ) ) ( OBJ-AT ?auto_10117 ?auto_10121 ) ( not ( = ?auto_10122 ?auto_10116 ) ) ( not ( = ?auto_10117 ?auto_10116 ) ) ( OBJ-AT ?auto_10116 ?auto_10121 ) ( TRUCK-AT ?auto_10118 ?auto_10119 ) ( IN-CITY ?auto_10119 ?auto_10120 ) ( not ( = ?auto_10115 ?auto_10119 ) ) ( not ( = ?auto_10121 ?auto_10119 ) ) ( OBJ-AT ?auto_10122 ?auto_10119 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10122 ?auto_10117 ?auto_10115 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10124 - OBJ
      ?auto_10125 - OBJ
      ?auto_10123 - LOCATION
    )
    :vars
    (
      ?auto_10130 - LOCATION
      ?auto_10129 - CITY
      ?auto_10128 - OBJ
      ?auto_10126 - TRUCK
      ?auto_10127 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10130 ?auto_10129 ) ( IN-CITY ?auto_10123 ?auto_10129 ) ( not ( = ?auto_10123 ?auto_10130 ) ) ( not ( = ?auto_10125 ?auto_10124 ) ) ( OBJ-AT ?auto_10124 ?auto_10130 ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( not ( = ?auto_10124 ?auto_10128 ) ) ( OBJ-AT ?auto_10128 ?auto_10130 ) ( TRUCK-AT ?auto_10126 ?auto_10127 ) ( IN-CITY ?auto_10127 ?auto_10129 ) ( not ( = ?auto_10123 ?auto_10127 ) ) ( not ( = ?auto_10130 ?auto_10127 ) ) ( OBJ-AT ?auto_10125 ?auto_10127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10125 ?auto_10124 ?auto_10123 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10132 - OBJ
      ?auto_10133 - OBJ
      ?auto_10131 - LOCATION
    )
    :vars
    (
      ?auto_10137 - LOCATION
      ?auto_10136 - CITY
      ?auto_10138 - OBJ
      ?auto_10134 - TRUCK
      ?auto_10135 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10137 ?auto_10136 ) ( IN-CITY ?auto_10131 ?auto_10136 ) ( not ( = ?auto_10131 ?auto_10137 ) ) ( not ( = ?auto_10138 ?auto_10132 ) ) ( OBJ-AT ?auto_10132 ?auto_10137 ) ( not ( = ?auto_10138 ?auto_10133 ) ) ( not ( = ?auto_10132 ?auto_10133 ) ) ( OBJ-AT ?auto_10133 ?auto_10137 ) ( TRUCK-AT ?auto_10134 ?auto_10135 ) ( IN-CITY ?auto_10135 ?auto_10136 ) ( not ( = ?auto_10131 ?auto_10135 ) ) ( not ( = ?auto_10137 ?auto_10135 ) ) ( OBJ-AT ?auto_10138 ?auto_10135 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10138 ?auto_10132 ?auto_10131 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10158 - OBJ
      ?auto_10159 - OBJ
      ?auto_10160 - OBJ
      ?auto_10157 - LOCATION
    )
    :vars
    (
      ?auto_10164 - LOCATION
      ?auto_10163 - CITY
      ?auto_10161 - TRUCK
      ?auto_10162 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10164 ?auto_10163 ) ( IN-CITY ?auto_10157 ?auto_10163 ) ( not ( = ?auto_10157 ?auto_10164 ) ) ( not ( = ?auto_10158 ?auto_10160 ) ) ( OBJ-AT ?auto_10160 ?auto_10164 ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10160 ?auto_10159 ) ) ( OBJ-AT ?auto_10159 ?auto_10164 ) ( TRUCK-AT ?auto_10161 ?auto_10162 ) ( IN-CITY ?auto_10162 ?auto_10163 ) ( not ( = ?auto_10157 ?auto_10162 ) ) ( not ( = ?auto_10164 ?auto_10162 ) ) ( OBJ-AT ?auto_10158 ?auto_10162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10158 ?auto_10160 ?auto_10157 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10175 - OBJ
      ?auto_10176 - OBJ
      ?auto_10177 - OBJ
      ?auto_10174 - LOCATION
    )
    :vars
    (
      ?auto_10181 - LOCATION
      ?auto_10180 - CITY
      ?auto_10178 - TRUCK
      ?auto_10179 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10181 ?auto_10180 ) ( IN-CITY ?auto_10174 ?auto_10180 ) ( not ( = ?auto_10174 ?auto_10181 ) ) ( not ( = ?auto_10175 ?auto_10176 ) ) ( OBJ-AT ?auto_10176 ?auto_10181 ) ( not ( = ?auto_10175 ?auto_10177 ) ) ( not ( = ?auto_10176 ?auto_10177 ) ) ( OBJ-AT ?auto_10177 ?auto_10181 ) ( TRUCK-AT ?auto_10178 ?auto_10179 ) ( IN-CITY ?auto_10179 ?auto_10180 ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( not ( = ?auto_10181 ?auto_10179 ) ) ( OBJ-AT ?auto_10175 ?auto_10179 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10175 ?auto_10176 ?auto_10174 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10192 - OBJ
      ?auto_10193 - OBJ
      ?auto_10194 - OBJ
      ?auto_10191 - LOCATION
    )
    :vars
    (
      ?auto_10198 - LOCATION
      ?auto_10197 - CITY
      ?auto_10195 - TRUCK
      ?auto_10196 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10198 ?auto_10197 ) ( IN-CITY ?auto_10191 ?auto_10197 ) ( not ( = ?auto_10191 ?auto_10198 ) ) ( not ( = ?auto_10193 ?auto_10194 ) ) ( OBJ-AT ?auto_10194 ?auto_10198 ) ( not ( = ?auto_10193 ?auto_10192 ) ) ( not ( = ?auto_10194 ?auto_10192 ) ) ( OBJ-AT ?auto_10192 ?auto_10198 ) ( TRUCK-AT ?auto_10195 ?auto_10196 ) ( IN-CITY ?auto_10196 ?auto_10197 ) ( not ( = ?auto_10191 ?auto_10196 ) ) ( not ( = ?auto_10198 ?auto_10196 ) ) ( OBJ-AT ?auto_10193 ?auto_10196 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10193 ?auto_10194 ?auto_10191 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10209 - OBJ
      ?auto_10210 - OBJ
      ?auto_10211 - OBJ
      ?auto_10208 - LOCATION
    )
    :vars
    (
      ?auto_10215 - LOCATION
      ?auto_10214 - CITY
      ?auto_10212 - TRUCK
      ?auto_10213 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10215 ?auto_10214 ) ( IN-CITY ?auto_10208 ?auto_10214 ) ( not ( = ?auto_10208 ?auto_10215 ) ) ( not ( = ?auto_10211 ?auto_10210 ) ) ( OBJ-AT ?auto_10210 ?auto_10215 ) ( not ( = ?auto_10211 ?auto_10209 ) ) ( not ( = ?auto_10210 ?auto_10209 ) ) ( OBJ-AT ?auto_10209 ?auto_10215 ) ( TRUCK-AT ?auto_10212 ?auto_10213 ) ( IN-CITY ?auto_10213 ?auto_10214 ) ( not ( = ?auto_10208 ?auto_10213 ) ) ( not ( = ?auto_10215 ?auto_10213 ) ) ( OBJ-AT ?auto_10211 ?auto_10213 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10211 ?auto_10210 ?auto_10208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10244 - OBJ
      ?auto_10245 - OBJ
      ?auto_10246 - OBJ
      ?auto_10243 - LOCATION
    )
    :vars
    (
      ?auto_10250 - LOCATION
      ?auto_10249 - CITY
      ?auto_10247 - TRUCK
      ?auto_10248 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10250 ?auto_10249 ) ( IN-CITY ?auto_10243 ?auto_10249 ) ( not ( = ?auto_10243 ?auto_10250 ) ) ( not ( = ?auto_10245 ?auto_10244 ) ) ( OBJ-AT ?auto_10244 ?auto_10250 ) ( not ( = ?auto_10245 ?auto_10246 ) ) ( not ( = ?auto_10244 ?auto_10246 ) ) ( OBJ-AT ?auto_10246 ?auto_10250 ) ( TRUCK-AT ?auto_10247 ?auto_10248 ) ( IN-CITY ?auto_10248 ?auto_10249 ) ( not ( = ?auto_10243 ?auto_10248 ) ) ( not ( = ?auto_10250 ?auto_10248 ) ) ( OBJ-AT ?auto_10245 ?auto_10248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10245 ?auto_10244 ?auto_10243 ) )
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
      ?auto_10267 - LOCATION
      ?auto_10266 - CITY
      ?auto_10264 - TRUCK
      ?auto_10265 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10267 ?auto_10266 ) ( IN-CITY ?auto_10260 ?auto_10266 ) ( not ( = ?auto_10260 ?auto_10267 ) ) ( not ( = ?auto_10263 ?auto_10261 ) ) ( OBJ-AT ?auto_10261 ?auto_10267 ) ( not ( = ?auto_10263 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( OBJ-AT ?auto_10262 ?auto_10267 ) ( TRUCK-AT ?auto_10264 ?auto_10265 ) ( IN-CITY ?auto_10265 ?auto_10266 ) ( not ( = ?auto_10260 ?auto_10265 ) ) ( not ( = ?auto_10267 ?auto_10265 ) ) ( OBJ-AT ?auto_10263 ?auto_10265 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10263 ?auto_10261 ?auto_10260 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10315 - OBJ
      ?auto_10314 - LOCATION
    )
    :vars
    (
      ?auto_10320 - LOCATION
      ?auto_10319 - CITY
      ?auto_10321 - OBJ
      ?auto_10318 - OBJ
      ?auto_10317 - LOCATION
      ?auto_10316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10320 ?auto_10319 ) ( IN-CITY ?auto_10314 ?auto_10319 ) ( not ( = ?auto_10314 ?auto_10320 ) ) ( not ( = ?auto_10321 ?auto_10315 ) ) ( OBJ-AT ?auto_10315 ?auto_10320 ) ( not ( = ?auto_10321 ?auto_10318 ) ) ( not ( = ?auto_10315 ?auto_10318 ) ) ( OBJ-AT ?auto_10318 ?auto_10320 ) ( IN-CITY ?auto_10317 ?auto_10319 ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10320 ?auto_10317 ) ) ( OBJ-AT ?auto_10321 ?auto_10317 ) ( TRUCK-AT ?auto_10316 ?auto_10314 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10316 ?auto_10314 ?auto_10317 ?auto_10319 )
      ( DELIVER-2PKG ?auto_10321 ?auto_10315 ?auto_10314 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10323 - OBJ
      ?auto_10324 - OBJ
      ?auto_10322 - LOCATION
    )
    :vars
    (
      ?auto_10327 - LOCATION
      ?auto_10328 - CITY
      ?auto_10326 - OBJ
      ?auto_10329 - LOCATION
      ?auto_10325 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10327 ?auto_10328 ) ( IN-CITY ?auto_10322 ?auto_10328 ) ( not ( = ?auto_10322 ?auto_10327 ) ) ( not ( = ?auto_10323 ?auto_10324 ) ) ( OBJ-AT ?auto_10324 ?auto_10327 ) ( not ( = ?auto_10323 ?auto_10326 ) ) ( not ( = ?auto_10324 ?auto_10326 ) ) ( OBJ-AT ?auto_10326 ?auto_10327 ) ( IN-CITY ?auto_10329 ?auto_10328 ) ( not ( = ?auto_10322 ?auto_10329 ) ) ( not ( = ?auto_10327 ?auto_10329 ) ) ( OBJ-AT ?auto_10323 ?auto_10329 ) ( TRUCK-AT ?auto_10325 ?auto_10322 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10324 ?auto_10322 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10331 - OBJ
      ?auto_10332 - OBJ
      ?auto_10330 - LOCATION
    )
    :vars
    (
      ?auto_10333 - LOCATION
      ?auto_10336 - CITY
      ?auto_10337 - OBJ
      ?auto_10335 - LOCATION
      ?auto_10334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10333 ?auto_10336 ) ( IN-CITY ?auto_10330 ?auto_10336 ) ( not ( = ?auto_10330 ?auto_10333 ) ) ( not ( = ?auto_10337 ?auto_10332 ) ) ( OBJ-AT ?auto_10332 ?auto_10333 ) ( not ( = ?auto_10337 ?auto_10331 ) ) ( not ( = ?auto_10332 ?auto_10331 ) ) ( OBJ-AT ?auto_10331 ?auto_10333 ) ( IN-CITY ?auto_10335 ?auto_10336 ) ( not ( = ?auto_10330 ?auto_10335 ) ) ( not ( = ?auto_10333 ?auto_10335 ) ) ( OBJ-AT ?auto_10337 ?auto_10335 ) ( TRUCK-AT ?auto_10334 ?auto_10330 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10337 ?auto_10332 ?auto_10330 ) )
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
      ?auto_10344 - CITY
      ?auto_10345 - OBJ
      ?auto_10343 - LOCATION
      ?auto_10342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10341 ?auto_10344 ) ( IN-CITY ?auto_10338 ?auto_10344 ) ( not ( = ?auto_10338 ?auto_10341 ) ) ( not ( = ?auto_10340 ?auto_10339 ) ) ( OBJ-AT ?auto_10339 ?auto_10341 ) ( not ( = ?auto_10340 ?auto_10345 ) ) ( not ( = ?auto_10339 ?auto_10345 ) ) ( OBJ-AT ?auto_10345 ?auto_10341 ) ( IN-CITY ?auto_10343 ?auto_10344 ) ( not ( = ?auto_10338 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10343 ) ) ( OBJ-AT ?auto_10340 ?auto_10343 ) ( TRUCK-AT ?auto_10342 ?auto_10338 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10340 ?auto_10339 ?auto_10338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10347 - OBJ
      ?auto_10348 - OBJ
      ?auto_10346 - LOCATION
    )
    :vars
    (
      ?auto_10349 - LOCATION
      ?auto_10352 - CITY
      ?auto_10353 - OBJ
      ?auto_10351 - LOCATION
      ?auto_10350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10349 ?auto_10352 ) ( IN-CITY ?auto_10346 ?auto_10352 ) ( not ( = ?auto_10346 ?auto_10349 ) ) ( not ( = ?auto_10353 ?auto_10347 ) ) ( OBJ-AT ?auto_10347 ?auto_10349 ) ( not ( = ?auto_10353 ?auto_10348 ) ) ( not ( = ?auto_10347 ?auto_10348 ) ) ( OBJ-AT ?auto_10348 ?auto_10349 ) ( IN-CITY ?auto_10351 ?auto_10352 ) ( not ( = ?auto_10346 ?auto_10351 ) ) ( not ( = ?auto_10349 ?auto_10351 ) ) ( OBJ-AT ?auto_10353 ?auto_10351 ) ( TRUCK-AT ?auto_10350 ?auto_10346 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10353 ?auto_10347 ?auto_10346 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10373 - OBJ
      ?auto_10374 - OBJ
      ?auto_10375 - OBJ
      ?auto_10372 - LOCATION
    )
    :vars
    (
      ?auto_10376 - LOCATION
      ?auto_10379 - CITY
      ?auto_10378 - LOCATION
      ?auto_10377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10376 ?auto_10379 ) ( IN-CITY ?auto_10372 ?auto_10379 ) ( not ( = ?auto_10372 ?auto_10376 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( OBJ-AT ?auto_10375 ?auto_10376 ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10375 ?auto_10374 ) ) ( OBJ-AT ?auto_10374 ?auto_10376 ) ( IN-CITY ?auto_10378 ?auto_10379 ) ( not ( = ?auto_10372 ?auto_10378 ) ) ( not ( = ?auto_10376 ?auto_10378 ) ) ( OBJ-AT ?auto_10373 ?auto_10378 ) ( TRUCK-AT ?auto_10377 ?auto_10372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10373 ?auto_10375 ?auto_10372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10390 - OBJ
      ?auto_10391 - OBJ
      ?auto_10392 - OBJ
      ?auto_10389 - LOCATION
    )
    :vars
    (
      ?auto_10393 - LOCATION
      ?auto_10396 - CITY
      ?auto_10395 - LOCATION
      ?auto_10394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10393 ?auto_10396 ) ( IN-CITY ?auto_10389 ?auto_10396 ) ( not ( = ?auto_10389 ?auto_10393 ) ) ( not ( = ?auto_10390 ?auto_10391 ) ) ( OBJ-AT ?auto_10391 ?auto_10393 ) ( not ( = ?auto_10390 ?auto_10392 ) ) ( not ( = ?auto_10391 ?auto_10392 ) ) ( OBJ-AT ?auto_10392 ?auto_10393 ) ( IN-CITY ?auto_10395 ?auto_10396 ) ( not ( = ?auto_10389 ?auto_10395 ) ) ( not ( = ?auto_10393 ?auto_10395 ) ) ( OBJ-AT ?auto_10390 ?auto_10395 ) ( TRUCK-AT ?auto_10394 ?auto_10389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10390 ?auto_10391 ?auto_10389 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10407 - OBJ
      ?auto_10408 - OBJ
      ?auto_10409 - OBJ
      ?auto_10406 - LOCATION
    )
    :vars
    (
      ?auto_10410 - LOCATION
      ?auto_10413 - CITY
      ?auto_10412 - LOCATION
      ?auto_10411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10410 ?auto_10413 ) ( IN-CITY ?auto_10406 ?auto_10413 ) ( not ( = ?auto_10406 ?auto_10410 ) ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( OBJ-AT ?auto_10409 ?auto_10410 ) ( not ( = ?auto_10408 ?auto_10407 ) ) ( not ( = ?auto_10409 ?auto_10407 ) ) ( OBJ-AT ?auto_10407 ?auto_10410 ) ( IN-CITY ?auto_10412 ?auto_10413 ) ( not ( = ?auto_10406 ?auto_10412 ) ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( OBJ-AT ?auto_10408 ?auto_10412 ) ( TRUCK-AT ?auto_10411 ?auto_10406 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10408 ?auto_10409 ?auto_10406 ) )
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
      ?auto_10430 - CITY
      ?auto_10429 - LOCATION
      ?auto_10428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10427 ?auto_10430 ) ( IN-CITY ?auto_10423 ?auto_10430 ) ( not ( = ?auto_10423 ?auto_10427 ) ) ( not ( = ?auto_10426 ?auto_10425 ) ) ( OBJ-AT ?auto_10425 ?auto_10427 ) ( not ( = ?auto_10426 ?auto_10424 ) ) ( not ( = ?auto_10425 ?auto_10424 ) ) ( OBJ-AT ?auto_10424 ?auto_10427 ) ( IN-CITY ?auto_10429 ?auto_10430 ) ( not ( = ?auto_10423 ?auto_10429 ) ) ( not ( = ?auto_10427 ?auto_10429 ) ) ( OBJ-AT ?auto_10426 ?auto_10429 ) ( TRUCK-AT ?auto_10428 ?auto_10423 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10426 ?auto_10425 ?auto_10423 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10459 - OBJ
      ?auto_10460 - OBJ
      ?auto_10461 - OBJ
      ?auto_10458 - LOCATION
    )
    :vars
    (
      ?auto_10462 - LOCATION
      ?auto_10465 - CITY
      ?auto_10464 - LOCATION
      ?auto_10463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10462 ?auto_10465 ) ( IN-CITY ?auto_10458 ?auto_10465 ) ( not ( = ?auto_10458 ?auto_10462 ) ) ( not ( = ?auto_10460 ?auto_10459 ) ) ( OBJ-AT ?auto_10459 ?auto_10462 ) ( not ( = ?auto_10460 ?auto_10461 ) ) ( not ( = ?auto_10459 ?auto_10461 ) ) ( OBJ-AT ?auto_10461 ?auto_10462 ) ( IN-CITY ?auto_10464 ?auto_10465 ) ( not ( = ?auto_10458 ?auto_10464 ) ) ( not ( = ?auto_10462 ?auto_10464 ) ) ( OBJ-AT ?auto_10460 ?auto_10464 ) ( TRUCK-AT ?auto_10463 ?auto_10458 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10460 ?auto_10459 ?auto_10458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10476 - OBJ
      ?auto_10477 - OBJ
      ?auto_10478 - OBJ
      ?auto_10475 - LOCATION
    )
    :vars
    (
      ?auto_10479 - LOCATION
      ?auto_10482 - CITY
      ?auto_10481 - LOCATION
      ?auto_10480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10479 ?auto_10482 ) ( IN-CITY ?auto_10475 ?auto_10482 ) ( not ( = ?auto_10475 ?auto_10479 ) ) ( not ( = ?auto_10478 ?auto_10476 ) ) ( OBJ-AT ?auto_10476 ?auto_10479 ) ( not ( = ?auto_10478 ?auto_10477 ) ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( OBJ-AT ?auto_10477 ?auto_10479 ) ( IN-CITY ?auto_10481 ?auto_10482 ) ( not ( = ?auto_10475 ?auto_10481 ) ) ( not ( = ?auto_10479 ?auto_10481 ) ) ( OBJ-AT ?auto_10478 ?auto_10481 ) ( TRUCK-AT ?auto_10480 ?auto_10475 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10478 ?auto_10476 ?auto_10475 ) )
  )

)

