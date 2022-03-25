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
      ?auto_7609 - OBJ
      ?auto_7608 - LOCATION
    )
    :vars
    (
      ?auto_7610 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7610 ?auto_7608 ) ( IN-TRUCK ?auto_7609 ?auto_7610 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7609 ?auto_7610 ?auto_7608 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7621 - OBJ
      ?auto_7620 - LOCATION
    )
    :vars
    (
      ?auto_7622 - TRUCK
      ?auto_7623 - LOCATION
      ?auto_7624 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7621 ?auto_7622 ) ( TRUCK-AT ?auto_7622 ?auto_7623 ) ( IN-CITY ?auto_7623 ?auto_7624 ) ( IN-CITY ?auto_7620 ?auto_7624 ) ( not ( = ?auto_7620 ?auto_7623 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7622 ?auto_7623 ?auto_7620 ?auto_7624 )
      ( DELIVER-1PKG ?auto_7621 ?auto_7620 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7639 - OBJ
      ?auto_7638 - LOCATION
    )
    :vars
    (
      ?auto_7642 - TRUCK
      ?auto_7641 - LOCATION
      ?auto_7640 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7642 ?auto_7641 ) ( IN-CITY ?auto_7641 ?auto_7640 ) ( IN-CITY ?auto_7638 ?auto_7640 ) ( not ( = ?auto_7638 ?auto_7641 ) ) ( OBJ-AT ?auto_7639 ?auto_7641 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7639 ?auto_7642 ?auto_7641 )
      ( DELIVER-1PKG ?auto_7639 ?auto_7638 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7657 - OBJ
      ?auto_7656 - LOCATION
    )
    :vars
    (
      ?auto_7660 - LOCATION
      ?auto_7659 - CITY
      ?auto_7658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7660 ?auto_7659 ) ( IN-CITY ?auto_7656 ?auto_7659 ) ( not ( = ?auto_7656 ?auto_7660 ) ) ( OBJ-AT ?auto_7657 ?auto_7660 ) ( TRUCK-AT ?auto_7658 ?auto_7656 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7658 ?auto_7656 ?auto_7660 ?auto_7659 )
      ( DELIVER-1PKG ?auto_7657 ?auto_7656 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7714 - OBJ
      ?auto_7713 - LOCATION
    )
    :vars
    (
      ?auto_7715 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7715 ?auto_7713 ) ( IN-TRUCK ?auto_7714 ?auto_7715 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7714 ?auto_7715 ?auto_7713 ) )
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
      ?auto_7719 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7719 ?auto_7716 ) ( IN-TRUCK ?auto_7718 ?auto_7719 ) ( OBJ-AT ?auto_7717 ?auto_7716 ) ( not ( = ?auto_7717 ?auto_7718 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7718 ?auto_7716 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7721 - OBJ
      ?auto_7722 - OBJ
      ?auto_7720 - LOCATION
    )
    :vars
    (
      ?auto_7723 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7723 ?auto_7720 ) ( IN-TRUCK ?auto_7721 ?auto_7723 ) ( OBJ-AT ?auto_7722 ?auto_7720 ) ( not ( = ?auto_7721 ?auto_7722 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7721 ?auto_7720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7729 - OBJ
      ?auto_7730 - OBJ
      ?auto_7731 - OBJ
      ?auto_7728 - LOCATION
    )
    :vars
    (
      ?auto_7732 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7732 ?auto_7728 ) ( IN-TRUCK ?auto_7731 ?auto_7732 ) ( OBJ-AT ?auto_7729 ?auto_7728 ) ( OBJ-AT ?auto_7730 ?auto_7728 ) ( not ( = ?auto_7729 ?auto_7730 ) ) ( not ( = ?auto_7729 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7731 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7731 ?auto_7728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7734 - OBJ
      ?auto_7735 - OBJ
      ?auto_7736 - OBJ
      ?auto_7733 - LOCATION
    )
    :vars
    (
      ?auto_7737 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7737 ?auto_7733 ) ( IN-TRUCK ?auto_7735 ?auto_7737 ) ( OBJ-AT ?auto_7734 ?auto_7733 ) ( OBJ-AT ?auto_7736 ?auto_7733 ) ( not ( = ?auto_7734 ?auto_7735 ) ) ( not ( = ?auto_7734 ?auto_7736 ) ) ( not ( = ?auto_7735 ?auto_7736 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7735 ?auto_7733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7744 - OBJ
      ?auto_7745 - OBJ
      ?auto_7746 - OBJ
      ?auto_7743 - LOCATION
    )
    :vars
    (
      ?auto_7747 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7747 ?auto_7743 ) ( IN-TRUCK ?auto_7744 ?auto_7747 ) ( OBJ-AT ?auto_7745 ?auto_7743 ) ( OBJ-AT ?auto_7746 ?auto_7743 ) ( not ( = ?auto_7744 ?auto_7745 ) ) ( not ( = ?auto_7744 ?auto_7746 ) ) ( not ( = ?auto_7745 ?auto_7746 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7744 ?auto_7743 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7764 - OBJ
      ?auto_7763 - LOCATION
    )
    :vars
    (
      ?auto_7765 - TRUCK
      ?auto_7766 - LOCATION
      ?auto_7767 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7764 ?auto_7765 ) ( TRUCK-AT ?auto_7765 ?auto_7766 ) ( IN-CITY ?auto_7766 ?auto_7767 ) ( IN-CITY ?auto_7763 ?auto_7767 ) ( not ( = ?auto_7763 ?auto_7766 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7765 ?auto_7766 ?auto_7763 ?auto_7767 )
      ( DELIVER-1PKG ?auto_7764 ?auto_7763 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7769 - OBJ
      ?auto_7770 - OBJ
      ?auto_7768 - LOCATION
    )
    :vars
    (
      ?auto_7773 - TRUCK
      ?auto_7772 - LOCATION
      ?auto_7771 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7770 ?auto_7773 ) ( TRUCK-AT ?auto_7773 ?auto_7772 ) ( IN-CITY ?auto_7772 ?auto_7771 ) ( IN-CITY ?auto_7768 ?auto_7771 ) ( not ( = ?auto_7768 ?auto_7772 ) ) ( OBJ-AT ?auto_7769 ?auto_7768 ) ( not ( = ?auto_7769 ?auto_7770 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7770 ?auto_7768 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7775 - OBJ
      ?auto_7776 - OBJ
      ?auto_7774 - LOCATION
    )
    :vars
    (
      ?auto_7777 - TRUCK
      ?auto_7778 - LOCATION
      ?auto_7779 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7775 ?auto_7777 ) ( TRUCK-AT ?auto_7777 ?auto_7778 ) ( IN-CITY ?auto_7778 ?auto_7779 ) ( IN-CITY ?auto_7774 ?auto_7779 ) ( not ( = ?auto_7774 ?auto_7778 ) ) ( OBJ-AT ?auto_7776 ?auto_7774 ) ( not ( = ?auto_7776 ?auto_7775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7776 ?auto_7775 ?auto_7774 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7788 - OBJ
      ?auto_7789 - OBJ
      ?auto_7790 - OBJ
      ?auto_7787 - LOCATION
    )
    :vars
    (
      ?auto_7791 - TRUCK
      ?auto_7792 - LOCATION
      ?auto_7793 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7790 ?auto_7791 ) ( TRUCK-AT ?auto_7791 ?auto_7792 ) ( IN-CITY ?auto_7792 ?auto_7793 ) ( IN-CITY ?auto_7787 ?auto_7793 ) ( not ( = ?auto_7787 ?auto_7792 ) ) ( OBJ-AT ?auto_7788 ?auto_7787 ) ( not ( = ?auto_7788 ?auto_7790 ) ) ( OBJ-AT ?auto_7789 ?auto_7787 ) ( not ( = ?auto_7788 ?auto_7789 ) ) ( not ( = ?auto_7789 ?auto_7790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7788 ?auto_7790 ?auto_7787 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7795 - OBJ
      ?auto_7796 - OBJ
      ?auto_7797 - OBJ
      ?auto_7794 - LOCATION
    )
    :vars
    (
      ?auto_7798 - TRUCK
      ?auto_7799 - LOCATION
      ?auto_7800 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7796 ?auto_7798 ) ( TRUCK-AT ?auto_7798 ?auto_7799 ) ( IN-CITY ?auto_7799 ?auto_7800 ) ( IN-CITY ?auto_7794 ?auto_7800 ) ( not ( = ?auto_7794 ?auto_7799 ) ) ( OBJ-AT ?auto_7797 ?auto_7794 ) ( not ( = ?auto_7797 ?auto_7796 ) ) ( OBJ-AT ?auto_7795 ?auto_7794 ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7797 ?auto_7796 ?auto_7794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7809 - OBJ
      ?auto_7810 - OBJ
      ?auto_7811 - OBJ
      ?auto_7808 - LOCATION
    )
    :vars
    (
      ?auto_7812 - TRUCK
      ?auto_7813 - LOCATION
      ?auto_7814 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7809 ?auto_7812 ) ( TRUCK-AT ?auto_7812 ?auto_7813 ) ( IN-CITY ?auto_7813 ?auto_7814 ) ( IN-CITY ?auto_7808 ?auto_7814 ) ( not ( = ?auto_7808 ?auto_7813 ) ) ( OBJ-AT ?auto_7810 ?auto_7808 ) ( not ( = ?auto_7810 ?auto_7809 ) ) ( OBJ-AT ?auto_7811 ?auto_7808 ) ( not ( = ?auto_7809 ?auto_7811 ) ) ( not ( = ?auto_7810 ?auto_7811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7810 ?auto_7809 ?auto_7808 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7838 - OBJ
      ?auto_7837 - LOCATION
    )
    :vars
    (
      ?auto_7839 - TRUCK
      ?auto_7840 - LOCATION
      ?auto_7842 - CITY
      ?auto_7841 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7839 ?auto_7840 ) ( IN-CITY ?auto_7840 ?auto_7842 ) ( IN-CITY ?auto_7837 ?auto_7842 ) ( not ( = ?auto_7837 ?auto_7840 ) ) ( OBJ-AT ?auto_7841 ?auto_7837 ) ( not ( = ?auto_7841 ?auto_7838 ) ) ( OBJ-AT ?auto_7838 ?auto_7840 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7838 ?auto_7839 ?auto_7840 )
      ( DELIVER-2PKG ?auto_7841 ?auto_7838 ?auto_7837 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7844 - OBJ
      ?auto_7845 - OBJ
      ?auto_7843 - LOCATION
    )
    :vars
    (
      ?auto_7846 - TRUCK
      ?auto_7848 - LOCATION
      ?auto_7847 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7846 ?auto_7848 ) ( IN-CITY ?auto_7848 ?auto_7847 ) ( IN-CITY ?auto_7843 ?auto_7847 ) ( not ( = ?auto_7843 ?auto_7848 ) ) ( OBJ-AT ?auto_7844 ?auto_7843 ) ( not ( = ?auto_7844 ?auto_7845 ) ) ( OBJ-AT ?auto_7845 ?auto_7848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7845 ?auto_7843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7850 - OBJ
      ?auto_7851 - OBJ
      ?auto_7849 - LOCATION
    )
    :vars
    (
      ?auto_7854 - TRUCK
      ?auto_7852 - LOCATION
      ?auto_7853 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7854 ?auto_7852 ) ( IN-CITY ?auto_7852 ?auto_7853 ) ( IN-CITY ?auto_7849 ?auto_7853 ) ( not ( = ?auto_7849 ?auto_7852 ) ) ( OBJ-AT ?auto_7851 ?auto_7849 ) ( not ( = ?auto_7851 ?auto_7850 ) ) ( OBJ-AT ?auto_7850 ?auto_7852 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7851 ?auto_7850 ?auto_7849 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7863 - OBJ
      ?auto_7864 - OBJ
      ?auto_7865 - OBJ
      ?auto_7862 - LOCATION
    )
    :vars
    (
      ?auto_7868 - TRUCK
      ?auto_7866 - LOCATION
      ?auto_7867 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7868 ?auto_7866 ) ( IN-CITY ?auto_7866 ?auto_7867 ) ( IN-CITY ?auto_7862 ?auto_7867 ) ( not ( = ?auto_7862 ?auto_7866 ) ) ( OBJ-AT ?auto_7864 ?auto_7862 ) ( not ( = ?auto_7864 ?auto_7865 ) ) ( OBJ-AT ?auto_7865 ?auto_7866 ) ( OBJ-AT ?auto_7863 ?auto_7862 ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7864 ?auto_7865 ?auto_7862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7870 - OBJ
      ?auto_7871 - OBJ
      ?auto_7872 - OBJ
      ?auto_7869 - LOCATION
    )
    :vars
    (
      ?auto_7875 - TRUCK
      ?auto_7873 - LOCATION
      ?auto_7874 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7875 ?auto_7873 ) ( IN-CITY ?auto_7873 ?auto_7874 ) ( IN-CITY ?auto_7869 ?auto_7874 ) ( not ( = ?auto_7869 ?auto_7873 ) ) ( OBJ-AT ?auto_7872 ?auto_7869 ) ( not ( = ?auto_7872 ?auto_7871 ) ) ( OBJ-AT ?auto_7871 ?auto_7873 ) ( OBJ-AT ?auto_7870 ?auto_7869 ) ( not ( = ?auto_7870 ?auto_7871 ) ) ( not ( = ?auto_7870 ?auto_7872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7872 ?auto_7871 ?auto_7869 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7884 - OBJ
      ?auto_7885 - OBJ
      ?auto_7886 - OBJ
      ?auto_7883 - LOCATION
    )
    :vars
    (
      ?auto_7889 - TRUCK
      ?auto_7887 - LOCATION
      ?auto_7888 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7889 ?auto_7887 ) ( IN-CITY ?auto_7887 ?auto_7888 ) ( IN-CITY ?auto_7883 ?auto_7888 ) ( not ( = ?auto_7883 ?auto_7887 ) ) ( OBJ-AT ?auto_7885 ?auto_7883 ) ( not ( = ?auto_7885 ?auto_7884 ) ) ( OBJ-AT ?auto_7884 ?auto_7887 ) ( OBJ-AT ?auto_7886 ?auto_7883 ) ( not ( = ?auto_7884 ?auto_7886 ) ) ( not ( = ?auto_7885 ?auto_7886 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7885 ?auto_7884 ?auto_7883 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7913 - OBJ
      ?auto_7912 - LOCATION
    )
    :vars
    (
      ?auto_7914 - LOCATION
      ?auto_7916 - CITY
      ?auto_7915 - OBJ
      ?auto_7917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7914 ?auto_7916 ) ( IN-CITY ?auto_7912 ?auto_7916 ) ( not ( = ?auto_7912 ?auto_7914 ) ) ( OBJ-AT ?auto_7915 ?auto_7912 ) ( not ( = ?auto_7915 ?auto_7913 ) ) ( OBJ-AT ?auto_7913 ?auto_7914 ) ( TRUCK-AT ?auto_7917 ?auto_7912 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7917 ?auto_7912 ?auto_7914 ?auto_7916 )
      ( DELIVER-2PKG ?auto_7915 ?auto_7913 ?auto_7912 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7919 - OBJ
      ?auto_7920 - OBJ
      ?auto_7918 - LOCATION
    )
    :vars
    (
      ?auto_7921 - LOCATION
      ?auto_7923 - CITY
      ?auto_7922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7921 ?auto_7923 ) ( IN-CITY ?auto_7918 ?auto_7923 ) ( not ( = ?auto_7918 ?auto_7921 ) ) ( OBJ-AT ?auto_7919 ?auto_7918 ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( OBJ-AT ?auto_7920 ?auto_7921 ) ( TRUCK-AT ?auto_7922 ?auto_7918 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7920 ?auto_7918 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7925 - OBJ
      ?auto_7926 - OBJ
      ?auto_7924 - LOCATION
    )
    :vars
    (
      ?auto_7927 - LOCATION
      ?auto_7929 - CITY
      ?auto_7928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7927 ?auto_7929 ) ( IN-CITY ?auto_7924 ?auto_7929 ) ( not ( = ?auto_7924 ?auto_7927 ) ) ( OBJ-AT ?auto_7926 ?auto_7924 ) ( not ( = ?auto_7926 ?auto_7925 ) ) ( OBJ-AT ?auto_7925 ?auto_7927 ) ( TRUCK-AT ?auto_7928 ?auto_7924 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7926 ?auto_7925 ?auto_7924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7938 - OBJ
      ?auto_7939 - OBJ
      ?auto_7940 - OBJ
      ?auto_7937 - LOCATION
    )
    :vars
    (
      ?auto_7941 - LOCATION
      ?auto_7943 - CITY
      ?auto_7942 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7941 ?auto_7943 ) ( IN-CITY ?auto_7937 ?auto_7943 ) ( not ( = ?auto_7937 ?auto_7941 ) ) ( OBJ-AT ?auto_7938 ?auto_7937 ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( OBJ-AT ?auto_7940 ?auto_7941 ) ( TRUCK-AT ?auto_7942 ?auto_7937 ) ( OBJ-AT ?auto_7939 ?auto_7937 ) ( not ( = ?auto_7938 ?auto_7939 ) ) ( not ( = ?auto_7939 ?auto_7940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7938 ?auto_7940 ?auto_7937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7945 - OBJ
      ?auto_7946 - OBJ
      ?auto_7947 - OBJ
      ?auto_7944 - LOCATION
    )
    :vars
    (
      ?auto_7948 - LOCATION
      ?auto_7950 - CITY
      ?auto_7949 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7948 ?auto_7950 ) ( IN-CITY ?auto_7944 ?auto_7950 ) ( not ( = ?auto_7944 ?auto_7948 ) ) ( OBJ-AT ?auto_7947 ?auto_7944 ) ( not ( = ?auto_7947 ?auto_7946 ) ) ( OBJ-AT ?auto_7946 ?auto_7948 ) ( TRUCK-AT ?auto_7949 ?auto_7944 ) ( OBJ-AT ?auto_7945 ?auto_7944 ) ( not ( = ?auto_7945 ?auto_7946 ) ) ( not ( = ?auto_7945 ?auto_7947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7947 ?auto_7946 ?auto_7944 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7959 - OBJ
      ?auto_7960 - OBJ
      ?auto_7961 - OBJ
      ?auto_7958 - LOCATION
    )
    :vars
    (
      ?auto_7962 - LOCATION
      ?auto_7964 - CITY
      ?auto_7963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7962 ?auto_7964 ) ( IN-CITY ?auto_7958 ?auto_7964 ) ( not ( = ?auto_7958 ?auto_7962 ) ) ( OBJ-AT ?auto_7960 ?auto_7958 ) ( not ( = ?auto_7960 ?auto_7959 ) ) ( OBJ-AT ?auto_7959 ?auto_7962 ) ( TRUCK-AT ?auto_7963 ?auto_7958 ) ( OBJ-AT ?auto_7961 ?auto_7958 ) ( not ( = ?auto_7959 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7960 ?auto_7959 ?auto_7958 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7988 - OBJ
      ?auto_7987 - LOCATION
    )
    :vars
    (
      ?auto_7989 - LOCATION
      ?auto_7991 - CITY
      ?auto_7992 - OBJ
      ?auto_7990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7989 ?auto_7991 ) ( IN-CITY ?auto_7987 ?auto_7991 ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7992 ?auto_7988 ) ) ( OBJ-AT ?auto_7988 ?auto_7989 ) ( TRUCK-AT ?auto_7990 ?auto_7987 ) ( IN-TRUCK ?auto_7992 ?auto_7990 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7992 ?auto_7987 )
      ( DELIVER-2PKG ?auto_7992 ?auto_7988 ?auto_7987 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7994 - OBJ
      ?auto_7995 - OBJ
      ?auto_7993 - LOCATION
    )
    :vars
    (
      ?auto_7996 - LOCATION
      ?auto_7998 - CITY
      ?auto_7997 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7996 ?auto_7998 ) ( IN-CITY ?auto_7993 ?auto_7998 ) ( not ( = ?auto_7993 ?auto_7996 ) ) ( not ( = ?auto_7994 ?auto_7995 ) ) ( OBJ-AT ?auto_7995 ?auto_7996 ) ( TRUCK-AT ?auto_7997 ?auto_7993 ) ( IN-TRUCK ?auto_7994 ?auto_7997 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7995 ?auto_7993 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8000 - OBJ
      ?auto_8001 - OBJ
      ?auto_7999 - LOCATION
    )
    :vars
    (
      ?auto_8002 - LOCATION
      ?auto_8004 - CITY
      ?auto_8003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8002 ?auto_8004 ) ( IN-CITY ?auto_7999 ?auto_8004 ) ( not ( = ?auto_7999 ?auto_8002 ) ) ( not ( = ?auto_8001 ?auto_8000 ) ) ( OBJ-AT ?auto_8000 ?auto_8002 ) ( TRUCK-AT ?auto_8003 ?auto_7999 ) ( IN-TRUCK ?auto_8001 ?auto_8003 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8001 ?auto_8000 ?auto_7999 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8063 - OBJ
      ?auto_8062 - LOCATION
    )
    :vars
    (
      ?auto_8064 - LOCATION
      ?auto_8067 - CITY
      ?auto_8066 - OBJ
      ?auto_8065 - TRUCK
      ?auto_8068 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8064 ?auto_8067 ) ( IN-CITY ?auto_8062 ?auto_8067 ) ( not ( = ?auto_8062 ?auto_8064 ) ) ( not ( = ?auto_8066 ?auto_8063 ) ) ( OBJ-AT ?auto_8063 ?auto_8064 ) ( IN-TRUCK ?auto_8066 ?auto_8065 ) ( TRUCK-AT ?auto_8065 ?auto_8068 ) ( IN-CITY ?auto_8068 ?auto_8067 ) ( not ( = ?auto_8062 ?auto_8068 ) ) ( not ( = ?auto_8064 ?auto_8068 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8065 ?auto_8068 ?auto_8062 ?auto_8067 )
      ( DELIVER-2PKG ?auto_8066 ?auto_8063 ?auto_8062 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8070 - OBJ
      ?auto_8071 - OBJ
      ?auto_8069 - LOCATION
    )
    :vars
    (
      ?auto_8072 - LOCATION
      ?auto_8075 - CITY
      ?auto_8074 - TRUCK
      ?auto_8073 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8072 ?auto_8075 ) ( IN-CITY ?auto_8069 ?auto_8075 ) ( not ( = ?auto_8069 ?auto_8072 ) ) ( not ( = ?auto_8070 ?auto_8071 ) ) ( OBJ-AT ?auto_8071 ?auto_8072 ) ( IN-TRUCK ?auto_8070 ?auto_8074 ) ( TRUCK-AT ?auto_8074 ?auto_8073 ) ( IN-CITY ?auto_8073 ?auto_8075 ) ( not ( = ?auto_8069 ?auto_8073 ) ) ( not ( = ?auto_8072 ?auto_8073 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8071 ?auto_8069 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8077 - OBJ
      ?auto_8078 - OBJ
      ?auto_8076 - LOCATION
    )
    :vars
    (
      ?auto_8081 - LOCATION
      ?auto_8082 - CITY
      ?auto_8080 - TRUCK
      ?auto_8079 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8081 ?auto_8082 ) ( IN-CITY ?auto_8076 ?auto_8082 ) ( not ( = ?auto_8076 ?auto_8081 ) ) ( not ( = ?auto_8078 ?auto_8077 ) ) ( OBJ-AT ?auto_8077 ?auto_8081 ) ( IN-TRUCK ?auto_8078 ?auto_8080 ) ( TRUCK-AT ?auto_8080 ?auto_8079 ) ( IN-CITY ?auto_8079 ?auto_8082 ) ( not ( = ?auto_8076 ?auto_8079 ) ) ( not ( = ?auto_8081 ?auto_8079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8078 ?auto_8077 ?auto_8076 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8149 - OBJ
      ?auto_8148 - LOCATION
    )
    :vars
    (
      ?auto_8153 - LOCATION
      ?auto_8154 - CITY
      ?auto_8151 - OBJ
      ?auto_8152 - TRUCK
      ?auto_8150 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8153 ?auto_8154 ) ( IN-CITY ?auto_8148 ?auto_8154 ) ( not ( = ?auto_8148 ?auto_8153 ) ) ( not ( = ?auto_8151 ?auto_8149 ) ) ( OBJ-AT ?auto_8149 ?auto_8153 ) ( TRUCK-AT ?auto_8152 ?auto_8150 ) ( IN-CITY ?auto_8150 ?auto_8154 ) ( not ( = ?auto_8148 ?auto_8150 ) ) ( not ( = ?auto_8153 ?auto_8150 ) ) ( OBJ-AT ?auto_8151 ?auto_8150 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8151 ?auto_8152 ?auto_8150 )
      ( DELIVER-2PKG ?auto_8151 ?auto_8149 ?auto_8148 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8156 - OBJ
      ?auto_8157 - OBJ
      ?auto_8155 - LOCATION
    )
    :vars
    (
      ?auto_8159 - LOCATION
      ?auto_8160 - CITY
      ?auto_8158 - TRUCK
      ?auto_8161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8159 ?auto_8160 ) ( IN-CITY ?auto_8155 ?auto_8160 ) ( not ( = ?auto_8155 ?auto_8159 ) ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( OBJ-AT ?auto_8157 ?auto_8159 ) ( TRUCK-AT ?auto_8158 ?auto_8161 ) ( IN-CITY ?auto_8161 ?auto_8160 ) ( not ( = ?auto_8155 ?auto_8161 ) ) ( not ( = ?auto_8159 ?auto_8161 ) ) ( OBJ-AT ?auto_8156 ?auto_8161 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8157 ?auto_8155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8163 - OBJ
      ?auto_8164 - OBJ
      ?auto_8162 - LOCATION
    )
    :vars
    (
      ?auto_8167 - LOCATION
      ?auto_8165 - CITY
      ?auto_8166 - TRUCK
      ?auto_8168 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8167 ?auto_8165 ) ( IN-CITY ?auto_8162 ?auto_8165 ) ( not ( = ?auto_8162 ?auto_8167 ) ) ( not ( = ?auto_8164 ?auto_8163 ) ) ( OBJ-AT ?auto_8163 ?auto_8167 ) ( TRUCK-AT ?auto_8166 ?auto_8168 ) ( IN-CITY ?auto_8168 ?auto_8165 ) ( not ( = ?auto_8162 ?auto_8168 ) ) ( not ( = ?auto_8167 ?auto_8168 ) ) ( OBJ-AT ?auto_8164 ?auto_8168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8164 ?auto_8163 ?auto_8162 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8235 - OBJ
      ?auto_8234 - LOCATION
    )
    :vars
    (
      ?auto_8238 - LOCATION
      ?auto_8236 - CITY
      ?auto_8240 - OBJ
      ?auto_8239 - LOCATION
      ?auto_8237 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8238 ?auto_8236 ) ( IN-CITY ?auto_8234 ?auto_8236 ) ( not ( = ?auto_8234 ?auto_8238 ) ) ( not ( = ?auto_8240 ?auto_8235 ) ) ( OBJ-AT ?auto_8235 ?auto_8238 ) ( IN-CITY ?auto_8239 ?auto_8236 ) ( not ( = ?auto_8234 ?auto_8239 ) ) ( not ( = ?auto_8238 ?auto_8239 ) ) ( OBJ-AT ?auto_8240 ?auto_8239 ) ( TRUCK-AT ?auto_8237 ?auto_8234 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8237 ?auto_8234 ?auto_8239 ?auto_8236 )
      ( DELIVER-2PKG ?auto_8240 ?auto_8235 ?auto_8234 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8242 - OBJ
      ?auto_8243 - OBJ
      ?auto_8241 - LOCATION
    )
    :vars
    (
      ?auto_8245 - LOCATION
      ?auto_8244 - CITY
      ?auto_8246 - LOCATION
      ?auto_8247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8245 ?auto_8244 ) ( IN-CITY ?auto_8241 ?auto_8244 ) ( not ( = ?auto_8241 ?auto_8245 ) ) ( not ( = ?auto_8242 ?auto_8243 ) ) ( OBJ-AT ?auto_8243 ?auto_8245 ) ( IN-CITY ?auto_8246 ?auto_8244 ) ( not ( = ?auto_8241 ?auto_8246 ) ) ( not ( = ?auto_8245 ?auto_8246 ) ) ( OBJ-AT ?auto_8242 ?auto_8246 ) ( TRUCK-AT ?auto_8247 ?auto_8241 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8243 ?auto_8241 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8249 - OBJ
      ?auto_8250 - OBJ
      ?auto_8248 - LOCATION
    )
    :vars
    (
      ?auto_8251 - LOCATION
      ?auto_8254 - CITY
      ?auto_8253 - LOCATION
      ?auto_8252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8251 ?auto_8254 ) ( IN-CITY ?auto_8248 ?auto_8254 ) ( not ( = ?auto_8248 ?auto_8251 ) ) ( not ( = ?auto_8250 ?auto_8249 ) ) ( OBJ-AT ?auto_8249 ?auto_8251 ) ( IN-CITY ?auto_8253 ?auto_8254 ) ( not ( = ?auto_8248 ?auto_8253 ) ) ( not ( = ?auto_8251 ?auto_8253 ) ) ( OBJ-AT ?auto_8250 ?auto_8253 ) ( TRUCK-AT ?auto_8252 ?auto_8248 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8250 ?auto_8249 ?auto_8248 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8414 - OBJ
      ?auto_8413 - LOCATION
    )
    :vars
    (
      ?auto_8415 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8415 ?auto_8413 ) ( IN-TRUCK ?auto_8414 ?auto_8415 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_8414 ?auto_8415 ?auto_8413 ) )
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
      ?auto_8419 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8419 ?auto_8416 ) ( IN-TRUCK ?auto_8418 ?auto_8419 ) ( OBJ-AT ?auto_8417 ?auto_8416 ) ( not ( = ?auto_8417 ?auto_8418 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8418 ?auto_8416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8421 - OBJ
      ?auto_8422 - OBJ
      ?auto_8420 - LOCATION
    )
    :vars
    (
      ?auto_8423 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8423 ?auto_8420 ) ( IN-TRUCK ?auto_8422 ?auto_8423 ) ( OBJ-AT ?auto_8421 ?auto_8420 ) ( not ( = ?auto_8421 ?auto_8422 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8422 ?auto_8420 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8425 - OBJ
      ?auto_8426 - OBJ
      ?auto_8424 - LOCATION
    )
    :vars
    (
      ?auto_8427 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8427 ?auto_8424 ) ( IN-TRUCK ?auto_8425 ?auto_8427 ) ( OBJ-AT ?auto_8426 ?auto_8424 ) ( not ( = ?auto_8425 ?auto_8426 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8425 ?auto_8424 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8429 - OBJ
      ?auto_8430 - OBJ
      ?auto_8428 - LOCATION
    )
    :vars
    (
      ?auto_8431 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8431 ?auto_8428 ) ( IN-TRUCK ?auto_8429 ?auto_8431 ) ( OBJ-AT ?auto_8430 ?auto_8428 ) ( not ( = ?auto_8429 ?auto_8430 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8429 ?auto_8428 ) )
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
      ?auto_8440 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8440 ?auto_8436 ) ( IN-TRUCK ?auto_8439 ?auto_8440 ) ( OBJ-AT ?auto_8437 ?auto_8436 ) ( OBJ-AT ?auto_8438 ?auto_8436 ) ( not ( = ?auto_8437 ?auto_8438 ) ) ( not ( = ?auto_8437 ?auto_8439 ) ) ( not ( = ?auto_8438 ?auto_8439 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8439 ?auto_8436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8442 - OBJ
      ?auto_8443 - OBJ
      ?auto_8444 - OBJ
      ?auto_8441 - LOCATION
    )
    :vars
    (
      ?auto_8445 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8445 ?auto_8441 ) ( IN-TRUCK ?auto_8444 ?auto_8445 ) ( OBJ-AT ?auto_8442 ?auto_8441 ) ( OBJ-AT ?auto_8443 ?auto_8441 ) ( not ( = ?auto_8442 ?auto_8443 ) ) ( not ( = ?auto_8442 ?auto_8444 ) ) ( not ( = ?auto_8443 ?auto_8444 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8444 ?auto_8441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8447 - OBJ
      ?auto_8448 - OBJ
      ?auto_8449 - OBJ
      ?auto_8446 - LOCATION
    )
    :vars
    (
      ?auto_8450 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8450 ?auto_8446 ) ( IN-TRUCK ?auto_8448 ?auto_8450 ) ( OBJ-AT ?auto_8447 ?auto_8446 ) ( OBJ-AT ?auto_8449 ?auto_8446 ) ( not ( = ?auto_8447 ?auto_8448 ) ) ( not ( = ?auto_8447 ?auto_8449 ) ) ( not ( = ?auto_8448 ?auto_8449 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8448 ?auto_8446 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8452 - OBJ
      ?auto_8453 - OBJ
      ?auto_8454 - OBJ
      ?auto_8451 - LOCATION
    )
    :vars
    (
      ?auto_8455 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8455 ?auto_8451 ) ( IN-TRUCK ?auto_8453 ?auto_8455 ) ( OBJ-AT ?auto_8452 ?auto_8451 ) ( OBJ-AT ?auto_8454 ?auto_8451 ) ( not ( = ?auto_8452 ?auto_8453 ) ) ( not ( = ?auto_8452 ?auto_8454 ) ) ( not ( = ?auto_8453 ?auto_8454 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8453 ?auto_8451 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8462 - OBJ
      ?auto_8463 - OBJ
      ?auto_8464 - OBJ
      ?auto_8461 - LOCATION
    )
    :vars
    (
      ?auto_8465 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8465 ?auto_8461 ) ( IN-TRUCK ?auto_8464 ?auto_8465 ) ( OBJ-AT ?auto_8462 ?auto_8461 ) ( OBJ-AT ?auto_8463 ?auto_8461 ) ( not ( = ?auto_8462 ?auto_8463 ) ) ( not ( = ?auto_8462 ?auto_8464 ) ) ( not ( = ?auto_8463 ?auto_8464 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8464 ?auto_8461 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8467 - OBJ
      ?auto_8468 - OBJ
      ?auto_8469 - OBJ
      ?auto_8466 - LOCATION
    )
    :vars
    (
      ?auto_8470 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8470 ?auto_8466 ) ( IN-TRUCK ?auto_8469 ?auto_8470 ) ( OBJ-AT ?auto_8467 ?auto_8466 ) ( OBJ-AT ?auto_8468 ?auto_8466 ) ( not ( = ?auto_8467 ?auto_8468 ) ) ( not ( = ?auto_8467 ?auto_8469 ) ) ( not ( = ?auto_8468 ?auto_8469 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8469 ?auto_8466 ) )
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
      ?auto_8475 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8475 ?auto_8471 ) ( IN-TRUCK ?auto_8473 ?auto_8475 ) ( OBJ-AT ?auto_8472 ?auto_8471 ) ( OBJ-AT ?auto_8474 ?auto_8471 ) ( not ( = ?auto_8472 ?auto_8473 ) ) ( not ( = ?auto_8472 ?auto_8474 ) ) ( not ( = ?auto_8473 ?auto_8474 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8473 ?auto_8471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8477 - OBJ
      ?auto_8478 - OBJ
      ?auto_8479 - OBJ
      ?auto_8476 - LOCATION
    )
    :vars
    (
      ?auto_8480 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8480 ?auto_8476 ) ( IN-TRUCK ?auto_8478 ?auto_8480 ) ( OBJ-AT ?auto_8477 ?auto_8476 ) ( OBJ-AT ?auto_8479 ?auto_8476 ) ( not ( = ?auto_8477 ?auto_8478 ) ) ( not ( = ?auto_8477 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8479 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8478 ?auto_8476 ) )
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
      ?auto_8490 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8490 ?auto_8486 ) ( IN-TRUCK ?auto_8487 ?auto_8490 ) ( OBJ-AT ?auto_8488 ?auto_8486 ) ( OBJ-AT ?auto_8489 ?auto_8486 ) ( not ( = ?auto_8487 ?auto_8488 ) ) ( not ( = ?auto_8487 ?auto_8489 ) ) ( not ( = ?auto_8488 ?auto_8489 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8487 ?auto_8486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8492 - OBJ
      ?auto_8493 - OBJ
      ?auto_8494 - OBJ
      ?auto_8491 - LOCATION
    )
    :vars
    (
      ?auto_8495 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8495 ?auto_8491 ) ( IN-TRUCK ?auto_8492 ?auto_8495 ) ( OBJ-AT ?auto_8493 ?auto_8491 ) ( OBJ-AT ?auto_8494 ?auto_8491 ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( not ( = ?auto_8492 ?auto_8494 ) ) ( not ( = ?auto_8493 ?auto_8494 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8492 ?auto_8491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8502 - OBJ
      ?auto_8503 - OBJ
      ?auto_8504 - OBJ
      ?auto_8501 - LOCATION
    )
    :vars
    (
      ?auto_8505 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8505 ?auto_8501 ) ( IN-TRUCK ?auto_8502 ?auto_8505 ) ( OBJ-AT ?auto_8503 ?auto_8501 ) ( OBJ-AT ?auto_8504 ?auto_8501 ) ( not ( = ?auto_8502 ?auto_8503 ) ) ( not ( = ?auto_8502 ?auto_8504 ) ) ( not ( = ?auto_8503 ?auto_8504 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8502 ?auto_8501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8507 - OBJ
      ?auto_8508 - OBJ
      ?auto_8509 - OBJ
      ?auto_8506 - LOCATION
    )
    :vars
    (
      ?auto_8510 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8510 ?auto_8506 ) ( IN-TRUCK ?auto_8507 ?auto_8510 ) ( OBJ-AT ?auto_8508 ?auto_8506 ) ( OBJ-AT ?auto_8509 ?auto_8506 ) ( not ( = ?auto_8507 ?auto_8508 ) ) ( not ( = ?auto_8507 ?auto_8509 ) ) ( not ( = ?auto_8508 ?auto_8509 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8507 ?auto_8506 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8532 - OBJ
      ?auto_8531 - LOCATION
    )
    :vars
    (
      ?auto_8533 - TRUCK
      ?auto_8534 - LOCATION
      ?auto_8535 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8532 ?auto_8533 ) ( TRUCK-AT ?auto_8533 ?auto_8534 ) ( IN-CITY ?auto_8534 ?auto_8535 ) ( IN-CITY ?auto_8531 ?auto_8535 ) ( not ( = ?auto_8531 ?auto_8534 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8533 ?auto_8534 ?auto_8531 ?auto_8535 )
      ( DELIVER-1PKG ?auto_8532 ?auto_8531 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8537 - OBJ
      ?auto_8538 - OBJ
      ?auto_8536 - LOCATION
    )
    :vars
    (
      ?auto_8540 - TRUCK
      ?auto_8541 - LOCATION
      ?auto_8539 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8538 ?auto_8540 ) ( TRUCK-AT ?auto_8540 ?auto_8541 ) ( IN-CITY ?auto_8541 ?auto_8539 ) ( IN-CITY ?auto_8536 ?auto_8539 ) ( not ( = ?auto_8536 ?auto_8541 ) ) ( OBJ-AT ?auto_8537 ?auto_8536 ) ( not ( = ?auto_8537 ?auto_8538 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8538 ?auto_8536 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8543 - OBJ
      ?auto_8544 - OBJ
      ?auto_8542 - LOCATION
    )
    :vars
    (
      ?auto_8548 - TRUCK
      ?auto_8546 - LOCATION
      ?auto_8547 - CITY
      ?auto_8545 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8544 ?auto_8548 ) ( TRUCK-AT ?auto_8548 ?auto_8546 ) ( IN-CITY ?auto_8546 ?auto_8547 ) ( IN-CITY ?auto_8542 ?auto_8547 ) ( not ( = ?auto_8542 ?auto_8546 ) ) ( OBJ-AT ?auto_8545 ?auto_8542 ) ( not ( = ?auto_8545 ?auto_8544 ) ) ( OBJ-AT ?auto_8543 ?auto_8542 ) ( not ( = ?auto_8543 ?auto_8544 ) ) ( not ( = ?auto_8543 ?auto_8545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8545 ?auto_8544 ?auto_8542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8550 - OBJ
      ?auto_8551 - OBJ
      ?auto_8549 - LOCATION
    )
    :vars
    (
      ?auto_8554 - TRUCK
      ?auto_8552 - LOCATION
      ?auto_8553 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8550 ?auto_8554 ) ( TRUCK-AT ?auto_8554 ?auto_8552 ) ( IN-CITY ?auto_8552 ?auto_8553 ) ( IN-CITY ?auto_8549 ?auto_8553 ) ( not ( = ?auto_8549 ?auto_8552 ) ) ( OBJ-AT ?auto_8551 ?auto_8549 ) ( not ( = ?auto_8551 ?auto_8550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8551 ?auto_8550 ?auto_8549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8556 - OBJ
      ?auto_8557 - OBJ
      ?auto_8555 - LOCATION
    )
    :vars
    (
      ?auto_8561 - TRUCK
      ?auto_8559 - LOCATION
      ?auto_8560 - CITY
      ?auto_8558 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8556 ?auto_8561 ) ( TRUCK-AT ?auto_8561 ?auto_8559 ) ( IN-CITY ?auto_8559 ?auto_8560 ) ( IN-CITY ?auto_8555 ?auto_8560 ) ( not ( = ?auto_8555 ?auto_8559 ) ) ( OBJ-AT ?auto_8558 ?auto_8555 ) ( not ( = ?auto_8558 ?auto_8556 ) ) ( OBJ-AT ?auto_8557 ?auto_8555 ) ( not ( = ?auto_8556 ?auto_8557 ) ) ( not ( = ?auto_8557 ?auto_8558 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8558 ?auto_8556 ?auto_8555 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8570 - OBJ
      ?auto_8571 - OBJ
      ?auto_8572 - OBJ
      ?auto_8569 - LOCATION
    )
    :vars
    (
      ?auto_8575 - TRUCK
      ?auto_8573 - LOCATION
      ?auto_8574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8572 ?auto_8575 ) ( TRUCK-AT ?auto_8575 ?auto_8573 ) ( IN-CITY ?auto_8573 ?auto_8574 ) ( IN-CITY ?auto_8569 ?auto_8574 ) ( not ( = ?auto_8569 ?auto_8573 ) ) ( OBJ-AT ?auto_8570 ?auto_8569 ) ( not ( = ?auto_8570 ?auto_8572 ) ) ( OBJ-AT ?auto_8571 ?auto_8569 ) ( not ( = ?auto_8570 ?auto_8571 ) ) ( not ( = ?auto_8571 ?auto_8572 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8570 ?auto_8572 ?auto_8569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8577 - OBJ
      ?auto_8578 - OBJ
      ?auto_8579 - OBJ
      ?auto_8576 - LOCATION
    )
    :vars
    (
      ?auto_8582 - TRUCK
      ?auto_8580 - LOCATION
      ?auto_8581 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8579 ?auto_8582 ) ( TRUCK-AT ?auto_8582 ?auto_8580 ) ( IN-CITY ?auto_8580 ?auto_8581 ) ( IN-CITY ?auto_8576 ?auto_8581 ) ( not ( = ?auto_8576 ?auto_8580 ) ) ( OBJ-AT ?auto_8577 ?auto_8576 ) ( not ( = ?auto_8577 ?auto_8579 ) ) ( OBJ-AT ?auto_8578 ?auto_8576 ) ( not ( = ?auto_8577 ?auto_8578 ) ) ( not ( = ?auto_8578 ?auto_8579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8577 ?auto_8579 ?auto_8576 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8584 - OBJ
      ?auto_8585 - OBJ
      ?auto_8586 - OBJ
      ?auto_8583 - LOCATION
    )
    :vars
    (
      ?auto_8589 - TRUCK
      ?auto_8587 - LOCATION
      ?auto_8588 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8585 ?auto_8589 ) ( TRUCK-AT ?auto_8589 ?auto_8587 ) ( IN-CITY ?auto_8587 ?auto_8588 ) ( IN-CITY ?auto_8583 ?auto_8588 ) ( not ( = ?auto_8583 ?auto_8587 ) ) ( OBJ-AT ?auto_8586 ?auto_8583 ) ( not ( = ?auto_8586 ?auto_8585 ) ) ( OBJ-AT ?auto_8584 ?auto_8583 ) ( not ( = ?auto_8584 ?auto_8585 ) ) ( not ( = ?auto_8584 ?auto_8586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8586 ?auto_8585 ?auto_8583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8591 - OBJ
      ?auto_8592 - OBJ
      ?auto_8593 - OBJ
      ?auto_8590 - LOCATION
    )
    :vars
    (
      ?auto_8596 - TRUCK
      ?auto_8594 - LOCATION
      ?auto_8595 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8592 ?auto_8596 ) ( TRUCK-AT ?auto_8596 ?auto_8594 ) ( IN-CITY ?auto_8594 ?auto_8595 ) ( IN-CITY ?auto_8590 ?auto_8595 ) ( not ( = ?auto_8590 ?auto_8594 ) ) ( OBJ-AT ?auto_8591 ?auto_8590 ) ( not ( = ?auto_8591 ?auto_8592 ) ) ( OBJ-AT ?auto_8593 ?auto_8590 ) ( not ( = ?auto_8591 ?auto_8593 ) ) ( not ( = ?auto_8592 ?auto_8593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8591 ?auto_8592 ?auto_8590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8605 - OBJ
      ?auto_8606 - OBJ
      ?auto_8607 - OBJ
      ?auto_8604 - LOCATION
    )
    :vars
    (
      ?auto_8610 - TRUCK
      ?auto_8608 - LOCATION
      ?auto_8609 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8607 ?auto_8610 ) ( TRUCK-AT ?auto_8610 ?auto_8608 ) ( IN-CITY ?auto_8608 ?auto_8609 ) ( IN-CITY ?auto_8604 ?auto_8609 ) ( not ( = ?auto_8604 ?auto_8608 ) ) ( OBJ-AT ?auto_8606 ?auto_8604 ) ( not ( = ?auto_8606 ?auto_8607 ) ) ( OBJ-AT ?auto_8605 ?auto_8604 ) ( not ( = ?auto_8605 ?auto_8606 ) ) ( not ( = ?auto_8605 ?auto_8607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8606 ?auto_8607 ?auto_8604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8612 - OBJ
      ?auto_8613 - OBJ
      ?auto_8614 - OBJ
      ?auto_8611 - LOCATION
    )
    :vars
    (
      ?auto_8618 - TRUCK
      ?auto_8616 - LOCATION
      ?auto_8617 - CITY
      ?auto_8615 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8614 ?auto_8618 ) ( TRUCK-AT ?auto_8618 ?auto_8616 ) ( IN-CITY ?auto_8616 ?auto_8617 ) ( IN-CITY ?auto_8611 ?auto_8617 ) ( not ( = ?auto_8611 ?auto_8616 ) ) ( OBJ-AT ?auto_8615 ?auto_8611 ) ( not ( = ?auto_8615 ?auto_8614 ) ) ( OBJ-AT ?auto_8612 ?auto_8611 ) ( OBJ-AT ?auto_8613 ?auto_8611 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( not ( = ?auto_8612 ?auto_8615 ) ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8615 ?auto_8614 ?auto_8611 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8620 - OBJ
      ?auto_8621 - OBJ
      ?auto_8622 - OBJ
      ?auto_8619 - LOCATION
    )
    :vars
    (
      ?auto_8625 - TRUCK
      ?auto_8623 - LOCATION
      ?auto_8624 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8621 ?auto_8625 ) ( TRUCK-AT ?auto_8625 ?auto_8623 ) ( IN-CITY ?auto_8623 ?auto_8624 ) ( IN-CITY ?auto_8619 ?auto_8624 ) ( not ( = ?auto_8619 ?auto_8623 ) ) ( OBJ-AT ?auto_8622 ?auto_8619 ) ( not ( = ?auto_8622 ?auto_8621 ) ) ( OBJ-AT ?auto_8620 ?auto_8619 ) ( not ( = ?auto_8620 ?auto_8621 ) ) ( not ( = ?auto_8620 ?auto_8622 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8622 ?auto_8621 ?auto_8619 ) )
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
      ?auto_8633 - TRUCK
      ?auto_8631 - LOCATION
      ?auto_8632 - CITY
      ?auto_8630 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8628 ?auto_8633 ) ( TRUCK-AT ?auto_8633 ?auto_8631 ) ( IN-CITY ?auto_8631 ?auto_8632 ) ( IN-CITY ?auto_8626 ?auto_8632 ) ( not ( = ?auto_8626 ?auto_8631 ) ) ( OBJ-AT ?auto_8630 ?auto_8626 ) ( not ( = ?auto_8630 ?auto_8628 ) ) ( OBJ-AT ?auto_8627 ?auto_8626 ) ( OBJ-AT ?auto_8629 ?auto_8626 ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8627 ?auto_8629 ) ) ( not ( = ?auto_8627 ?auto_8630 ) ) ( not ( = ?auto_8628 ?auto_8629 ) ) ( not ( = ?auto_8629 ?auto_8630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8630 ?auto_8628 ?auto_8626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8643 - OBJ
      ?auto_8644 - OBJ
      ?auto_8645 - OBJ
      ?auto_8642 - LOCATION
    )
    :vars
    (
      ?auto_8648 - TRUCK
      ?auto_8646 - LOCATION
      ?auto_8647 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8643 ?auto_8648 ) ( TRUCK-AT ?auto_8648 ?auto_8646 ) ( IN-CITY ?auto_8646 ?auto_8647 ) ( IN-CITY ?auto_8642 ?auto_8647 ) ( not ( = ?auto_8642 ?auto_8646 ) ) ( OBJ-AT ?auto_8644 ?auto_8642 ) ( not ( = ?auto_8644 ?auto_8643 ) ) ( OBJ-AT ?auto_8645 ?auto_8642 ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8644 ?auto_8643 ?auto_8642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8650 - OBJ
      ?auto_8651 - OBJ
      ?auto_8652 - OBJ
      ?auto_8649 - LOCATION
    )
    :vars
    (
      ?auto_8655 - TRUCK
      ?auto_8653 - LOCATION
      ?auto_8654 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8650 ?auto_8655 ) ( TRUCK-AT ?auto_8655 ?auto_8653 ) ( IN-CITY ?auto_8653 ?auto_8654 ) ( IN-CITY ?auto_8649 ?auto_8654 ) ( not ( = ?auto_8649 ?auto_8653 ) ) ( OBJ-AT ?auto_8651 ?auto_8649 ) ( not ( = ?auto_8651 ?auto_8650 ) ) ( OBJ-AT ?auto_8652 ?auto_8649 ) ( not ( = ?auto_8650 ?auto_8652 ) ) ( not ( = ?auto_8651 ?auto_8652 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8651 ?auto_8650 ?auto_8649 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8664 - OBJ
      ?auto_8665 - OBJ
      ?auto_8666 - OBJ
      ?auto_8663 - LOCATION
    )
    :vars
    (
      ?auto_8669 - TRUCK
      ?auto_8667 - LOCATION
      ?auto_8668 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8664 ?auto_8669 ) ( TRUCK-AT ?auto_8669 ?auto_8667 ) ( IN-CITY ?auto_8667 ?auto_8668 ) ( IN-CITY ?auto_8663 ?auto_8668 ) ( not ( = ?auto_8663 ?auto_8667 ) ) ( OBJ-AT ?auto_8666 ?auto_8663 ) ( not ( = ?auto_8666 ?auto_8664 ) ) ( OBJ-AT ?auto_8665 ?auto_8663 ) ( not ( = ?auto_8664 ?auto_8665 ) ) ( not ( = ?auto_8665 ?auto_8666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8666 ?auto_8664 ?auto_8663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8671 - OBJ
      ?auto_8672 - OBJ
      ?auto_8673 - OBJ
      ?auto_8670 - LOCATION
    )
    :vars
    (
      ?auto_8677 - TRUCK
      ?auto_8675 - LOCATION
      ?auto_8676 - CITY
      ?auto_8674 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8671 ?auto_8677 ) ( TRUCK-AT ?auto_8677 ?auto_8675 ) ( IN-CITY ?auto_8675 ?auto_8676 ) ( IN-CITY ?auto_8670 ?auto_8676 ) ( not ( = ?auto_8670 ?auto_8675 ) ) ( OBJ-AT ?auto_8674 ?auto_8670 ) ( not ( = ?auto_8674 ?auto_8671 ) ) ( OBJ-AT ?auto_8672 ?auto_8670 ) ( OBJ-AT ?auto_8673 ?auto_8670 ) ( not ( = ?auto_8671 ?auto_8672 ) ) ( not ( = ?auto_8671 ?auto_8673 ) ) ( not ( = ?auto_8672 ?auto_8673 ) ) ( not ( = ?auto_8672 ?auto_8674 ) ) ( not ( = ?auto_8673 ?auto_8674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8674 ?auto_8671 ?auto_8670 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8710 - OBJ
      ?auto_8709 - LOCATION
    )
    :vars
    (
      ?auto_8714 - TRUCK
      ?auto_8712 - LOCATION
      ?auto_8713 - CITY
      ?auto_8711 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8714 ?auto_8712 ) ( IN-CITY ?auto_8712 ?auto_8713 ) ( IN-CITY ?auto_8709 ?auto_8713 ) ( not ( = ?auto_8709 ?auto_8712 ) ) ( OBJ-AT ?auto_8711 ?auto_8709 ) ( not ( = ?auto_8711 ?auto_8710 ) ) ( OBJ-AT ?auto_8710 ?auto_8712 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8710 ?auto_8714 ?auto_8712 )
      ( DELIVER-2PKG ?auto_8711 ?auto_8710 ?auto_8709 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8716 - OBJ
      ?auto_8717 - OBJ
      ?auto_8715 - LOCATION
    )
    :vars
    (
      ?auto_8718 - TRUCK
      ?auto_8719 - LOCATION
      ?auto_8720 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8718 ?auto_8719 ) ( IN-CITY ?auto_8719 ?auto_8720 ) ( IN-CITY ?auto_8715 ?auto_8720 ) ( not ( = ?auto_8715 ?auto_8719 ) ) ( OBJ-AT ?auto_8716 ?auto_8715 ) ( not ( = ?auto_8716 ?auto_8717 ) ) ( OBJ-AT ?auto_8717 ?auto_8719 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8717 ?auto_8715 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8722 - OBJ
      ?auto_8723 - OBJ
      ?auto_8721 - LOCATION
    )
    :vars
    (
      ?auto_8726 - TRUCK
      ?auto_8725 - LOCATION
      ?auto_8724 - CITY
      ?auto_8727 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8726 ?auto_8725 ) ( IN-CITY ?auto_8725 ?auto_8724 ) ( IN-CITY ?auto_8721 ?auto_8724 ) ( not ( = ?auto_8721 ?auto_8725 ) ) ( OBJ-AT ?auto_8727 ?auto_8721 ) ( not ( = ?auto_8727 ?auto_8723 ) ) ( OBJ-AT ?auto_8723 ?auto_8725 ) ( OBJ-AT ?auto_8722 ?auto_8721 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8727 ?auto_8723 ?auto_8721 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8729 - OBJ
      ?auto_8730 - OBJ
      ?auto_8728 - LOCATION
    )
    :vars
    (
      ?auto_8733 - TRUCK
      ?auto_8732 - LOCATION
      ?auto_8731 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8733 ?auto_8732 ) ( IN-CITY ?auto_8732 ?auto_8731 ) ( IN-CITY ?auto_8728 ?auto_8731 ) ( not ( = ?auto_8728 ?auto_8732 ) ) ( OBJ-AT ?auto_8730 ?auto_8728 ) ( not ( = ?auto_8730 ?auto_8729 ) ) ( OBJ-AT ?auto_8729 ?auto_8732 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8730 ?auto_8729 ?auto_8728 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8735 - OBJ
      ?auto_8736 - OBJ
      ?auto_8734 - LOCATION
    )
    :vars
    (
      ?auto_8739 - TRUCK
      ?auto_8738 - LOCATION
      ?auto_8737 - CITY
      ?auto_8740 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8739 ?auto_8738 ) ( IN-CITY ?auto_8738 ?auto_8737 ) ( IN-CITY ?auto_8734 ?auto_8737 ) ( not ( = ?auto_8734 ?auto_8738 ) ) ( OBJ-AT ?auto_8740 ?auto_8734 ) ( not ( = ?auto_8740 ?auto_8735 ) ) ( OBJ-AT ?auto_8735 ?auto_8738 ) ( OBJ-AT ?auto_8736 ?auto_8734 ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8736 ?auto_8740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8740 ?auto_8735 ?auto_8734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8749 - OBJ
      ?auto_8750 - OBJ
      ?auto_8751 - OBJ
      ?auto_8748 - LOCATION
    )
    :vars
    (
      ?auto_8754 - TRUCK
      ?auto_8753 - LOCATION
      ?auto_8752 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8754 ?auto_8753 ) ( IN-CITY ?auto_8753 ?auto_8752 ) ( IN-CITY ?auto_8748 ?auto_8752 ) ( not ( = ?auto_8748 ?auto_8753 ) ) ( OBJ-AT ?auto_8749 ?auto_8748 ) ( not ( = ?auto_8749 ?auto_8751 ) ) ( OBJ-AT ?auto_8751 ?auto_8753 ) ( OBJ-AT ?auto_8750 ?auto_8748 ) ( not ( = ?auto_8749 ?auto_8750 ) ) ( not ( = ?auto_8750 ?auto_8751 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8749 ?auto_8751 ?auto_8748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8756 - OBJ
      ?auto_8757 - OBJ
      ?auto_8758 - OBJ
      ?auto_8755 - LOCATION
    )
    :vars
    (
      ?auto_8761 - TRUCK
      ?auto_8760 - LOCATION
      ?auto_8759 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8761 ?auto_8760 ) ( IN-CITY ?auto_8760 ?auto_8759 ) ( IN-CITY ?auto_8755 ?auto_8759 ) ( not ( = ?auto_8755 ?auto_8760 ) ) ( OBJ-AT ?auto_8756 ?auto_8755 ) ( not ( = ?auto_8756 ?auto_8758 ) ) ( OBJ-AT ?auto_8758 ?auto_8760 ) ( OBJ-AT ?auto_8757 ?auto_8755 ) ( not ( = ?auto_8756 ?auto_8757 ) ) ( not ( = ?auto_8757 ?auto_8758 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8756 ?auto_8758 ?auto_8755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8763 - OBJ
      ?auto_8764 - OBJ
      ?auto_8765 - OBJ
      ?auto_8762 - LOCATION
    )
    :vars
    (
      ?auto_8768 - TRUCK
      ?auto_8767 - LOCATION
      ?auto_8766 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8768 ?auto_8767 ) ( IN-CITY ?auto_8767 ?auto_8766 ) ( IN-CITY ?auto_8762 ?auto_8766 ) ( not ( = ?auto_8762 ?auto_8767 ) ) ( OBJ-AT ?auto_8765 ?auto_8762 ) ( not ( = ?auto_8765 ?auto_8764 ) ) ( OBJ-AT ?auto_8764 ?auto_8767 ) ( OBJ-AT ?auto_8763 ?auto_8762 ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8765 ?auto_8764 ?auto_8762 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8770 - OBJ
      ?auto_8771 - OBJ
      ?auto_8772 - OBJ
      ?auto_8769 - LOCATION
    )
    :vars
    (
      ?auto_8775 - TRUCK
      ?auto_8774 - LOCATION
      ?auto_8773 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8775 ?auto_8774 ) ( IN-CITY ?auto_8774 ?auto_8773 ) ( IN-CITY ?auto_8769 ?auto_8773 ) ( not ( = ?auto_8769 ?auto_8774 ) ) ( OBJ-AT ?auto_8770 ?auto_8769 ) ( not ( = ?auto_8770 ?auto_8771 ) ) ( OBJ-AT ?auto_8771 ?auto_8774 ) ( OBJ-AT ?auto_8772 ?auto_8769 ) ( not ( = ?auto_8770 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8770 ?auto_8771 ?auto_8769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8784 - OBJ
      ?auto_8785 - OBJ
      ?auto_8786 - OBJ
      ?auto_8783 - LOCATION
    )
    :vars
    (
      ?auto_8789 - TRUCK
      ?auto_8788 - LOCATION
      ?auto_8787 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8789 ?auto_8788 ) ( IN-CITY ?auto_8788 ?auto_8787 ) ( IN-CITY ?auto_8783 ?auto_8787 ) ( not ( = ?auto_8783 ?auto_8788 ) ) ( OBJ-AT ?auto_8785 ?auto_8783 ) ( not ( = ?auto_8785 ?auto_8786 ) ) ( OBJ-AT ?auto_8786 ?auto_8788 ) ( OBJ-AT ?auto_8784 ?auto_8783 ) ( not ( = ?auto_8784 ?auto_8785 ) ) ( not ( = ?auto_8784 ?auto_8786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8785 ?auto_8786 ?auto_8783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8791 - OBJ
      ?auto_8792 - OBJ
      ?auto_8793 - OBJ
      ?auto_8790 - LOCATION
    )
    :vars
    (
      ?auto_8796 - TRUCK
      ?auto_8795 - LOCATION
      ?auto_8794 - CITY
      ?auto_8797 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8796 ?auto_8795 ) ( IN-CITY ?auto_8795 ?auto_8794 ) ( IN-CITY ?auto_8790 ?auto_8794 ) ( not ( = ?auto_8790 ?auto_8795 ) ) ( OBJ-AT ?auto_8797 ?auto_8790 ) ( not ( = ?auto_8797 ?auto_8793 ) ) ( OBJ-AT ?auto_8793 ?auto_8795 ) ( OBJ-AT ?auto_8791 ?auto_8790 ) ( OBJ-AT ?auto_8792 ?auto_8790 ) ( not ( = ?auto_8791 ?auto_8792 ) ) ( not ( = ?auto_8791 ?auto_8793 ) ) ( not ( = ?auto_8791 ?auto_8797 ) ) ( not ( = ?auto_8792 ?auto_8793 ) ) ( not ( = ?auto_8792 ?auto_8797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8797 ?auto_8793 ?auto_8790 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8799 - OBJ
      ?auto_8800 - OBJ
      ?auto_8801 - OBJ
      ?auto_8798 - LOCATION
    )
    :vars
    (
      ?auto_8804 - TRUCK
      ?auto_8803 - LOCATION
      ?auto_8802 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8804 ?auto_8803 ) ( IN-CITY ?auto_8803 ?auto_8802 ) ( IN-CITY ?auto_8798 ?auto_8802 ) ( not ( = ?auto_8798 ?auto_8803 ) ) ( OBJ-AT ?auto_8801 ?auto_8798 ) ( not ( = ?auto_8801 ?auto_8800 ) ) ( OBJ-AT ?auto_8800 ?auto_8803 ) ( OBJ-AT ?auto_8799 ?auto_8798 ) ( not ( = ?auto_8799 ?auto_8800 ) ) ( not ( = ?auto_8799 ?auto_8801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8801 ?auto_8800 ?auto_8798 ) )
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
      ?auto_8810 - LOCATION
      ?auto_8809 - CITY
      ?auto_8812 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8811 ?auto_8810 ) ( IN-CITY ?auto_8810 ?auto_8809 ) ( IN-CITY ?auto_8805 ?auto_8809 ) ( not ( = ?auto_8805 ?auto_8810 ) ) ( OBJ-AT ?auto_8812 ?auto_8805 ) ( not ( = ?auto_8812 ?auto_8807 ) ) ( OBJ-AT ?auto_8807 ?auto_8810 ) ( OBJ-AT ?auto_8806 ?auto_8805 ) ( OBJ-AT ?auto_8808 ?auto_8805 ) ( not ( = ?auto_8806 ?auto_8807 ) ) ( not ( = ?auto_8806 ?auto_8808 ) ) ( not ( = ?auto_8806 ?auto_8812 ) ) ( not ( = ?auto_8807 ?auto_8808 ) ) ( not ( = ?auto_8808 ?auto_8812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8812 ?auto_8807 ?auto_8805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8822 - OBJ
      ?auto_8823 - OBJ
      ?auto_8824 - OBJ
      ?auto_8821 - LOCATION
    )
    :vars
    (
      ?auto_8827 - TRUCK
      ?auto_8826 - LOCATION
      ?auto_8825 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8827 ?auto_8826 ) ( IN-CITY ?auto_8826 ?auto_8825 ) ( IN-CITY ?auto_8821 ?auto_8825 ) ( not ( = ?auto_8821 ?auto_8826 ) ) ( OBJ-AT ?auto_8823 ?auto_8821 ) ( not ( = ?auto_8823 ?auto_8822 ) ) ( OBJ-AT ?auto_8822 ?auto_8826 ) ( OBJ-AT ?auto_8824 ?auto_8821 ) ( not ( = ?auto_8822 ?auto_8824 ) ) ( not ( = ?auto_8823 ?auto_8824 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8823 ?auto_8822 ?auto_8821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8829 - OBJ
      ?auto_8830 - OBJ
      ?auto_8831 - OBJ
      ?auto_8828 - LOCATION
    )
    :vars
    (
      ?auto_8834 - TRUCK
      ?auto_8833 - LOCATION
      ?auto_8832 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8834 ?auto_8833 ) ( IN-CITY ?auto_8833 ?auto_8832 ) ( IN-CITY ?auto_8828 ?auto_8832 ) ( not ( = ?auto_8828 ?auto_8833 ) ) ( OBJ-AT ?auto_8830 ?auto_8828 ) ( not ( = ?auto_8830 ?auto_8829 ) ) ( OBJ-AT ?auto_8829 ?auto_8833 ) ( OBJ-AT ?auto_8831 ?auto_8828 ) ( not ( = ?auto_8829 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8831 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8830 ?auto_8829 ?auto_8828 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8843 - OBJ
      ?auto_8844 - OBJ
      ?auto_8845 - OBJ
      ?auto_8842 - LOCATION
    )
    :vars
    (
      ?auto_8848 - TRUCK
      ?auto_8847 - LOCATION
      ?auto_8846 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8848 ?auto_8847 ) ( IN-CITY ?auto_8847 ?auto_8846 ) ( IN-CITY ?auto_8842 ?auto_8846 ) ( not ( = ?auto_8842 ?auto_8847 ) ) ( OBJ-AT ?auto_8845 ?auto_8842 ) ( not ( = ?auto_8845 ?auto_8843 ) ) ( OBJ-AT ?auto_8843 ?auto_8847 ) ( OBJ-AT ?auto_8844 ?auto_8842 ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8844 ?auto_8845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8845 ?auto_8843 ?auto_8842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8850 - OBJ
      ?auto_8851 - OBJ
      ?auto_8852 - OBJ
      ?auto_8849 - LOCATION
    )
    :vars
    (
      ?auto_8855 - TRUCK
      ?auto_8854 - LOCATION
      ?auto_8853 - CITY
      ?auto_8856 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8855 ?auto_8854 ) ( IN-CITY ?auto_8854 ?auto_8853 ) ( IN-CITY ?auto_8849 ?auto_8853 ) ( not ( = ?auto_8849 ?auto_8854 ) ) ( OBJ-AT ?auto_8856 ?auto_8849 ) ( not ( = ?auto_8856 ?auto_8850 ) ) ( OBJ-AT ?auto_8850 ?auto_8854 ) ( OBJ-AT ?auto_8851 ?auto_8849 ) ( OBJ-AT ?auto_8852 ?auto_8849 ) ( not ( = ?auto_8850 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8852 ) ) ( not ( = ?auto_8851 ?auto_8852 ) ) ( not ( = ?auto_8851 ?auto_8856 ) ) ( not ( = ?auto_8852 ?auto_8856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8856 ?auto_8850 ?auto_8849 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8889 - OBJ
      ?auto_8888 - LOCATION
    )
    :vars
    (
      ?auto_8891 - LOCATION
      ?auto_8890 - CITY
      ?auto_8893 - OBJ
      ?auto_8892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8891 ?auto_8890 ) ( IN-CITY ?auto_8888 ?auto_8890 ) ( not ( = ?auto_8888 ?auto_8891 ) ) ( OBJ-AT ?auto_8893 ?auto_8888 ) ( not ( = ?auto_8893 ?auto_8889 ) ) ( OBJ-AT ?auto_8889 ?auto_8891 ) ( TRUCK-AT ?auto_8892 ?auto_8888 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8892 ?auto_8888 ?auto_8891 ?auto_8890 )
      ( DELIVER-2PKG ?auto_8893 ?auto_8889 ?auto_8888 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8895 - OBJ
      ?auto_8896 - OBJ
      ?auto_8894 - LOCATION
    )
    :vars
    (
      ?auto_8897 - LOCATION
      ?auto_8898 - CITY
      ?auto_8899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8897 ?auto_8898 ) ( IN-CITY ?auto_8894 ?auto_8898 ) ( not ( = ?auto_8894 ?auto_8897 ) ) ( OBJ-AT ?auto_8895 ?auto_8894 ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( OBJ-AT ?auto_8896 ?auto_8897 ) ( TRUCK-AT ?auto_8899 ?auto_8894 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8896 ?auto_8894 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8901 - OBJ
      ?auto_8902 - OBJ
      ?auto_8900 - LOCATION
    )
    :vars
    (
      ?auto_8904 - LOCATION
      ?auto_8905 - CITY
      ?auto_8906 - OBJ
      ?auto_8903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8904 ?auto_8905 ) ( IN-CITY ?auto_8900 ?auto_8905 ) ( not ( = ?auto_8900 ?auto_8904 ) ) ( OBJ-AT ?auto_8906 ?auto_8900 ) ( not ( = ?auto_8906 ?auto_8902 ) ) ( OBJ-AT ?auto_8902 ?auto_8904 ) ( TRUCK-AT ?auto_8903 ?auto_8900 ) ( OBJ-AT ?auto_8901 ?auto_8900 ) ( not ( = ?auto_8901 ?auto_8902 ) ) ( not ( = ?auto_8901 ?auto_8906 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8906 ?auto_8902 ?auto_8900 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8908 - OBJ
      ?auto_8909 - OBJ
      ?auto_8907 - LOCATION
    )
    :vars
    (
      ?auto_8911 - LOCATION
      ?auto_8912 - CITY
      ?auto_8910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8911 ?auto_8912 ) ( IN-CITY ?auto_8907 ?auto_8912 ) ( not ( = ?auto_8907 ?auto_8911 ) ) ( OBJ-AT ?auto_8909 ?auto_8907 ) ( not ( = ?auto_8909 ?auto_8908 ) ) ( OBJ-AT ?auto_8908 ?auto_8911 ) ( TRUCK-AT ?auto_8910 ?auto_8907 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8909 ?auto_8908 ?auto_8907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8914 - OBJ
      ?auto_8915 - OBJ
      ?auto_8913 - LOCATION
    )
    :vars
    (
      ?auto_8917 - LOCATION
      ?auto_8918 - CITY
      ?auto_8919 - OBJ
      ?auto_8916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8917 ?auto_8918 ) ( IN-CITY ?auto_8913 ?auto_8918 ) ( not ( = ?auto_8913 ?auto_8917 ) ) ( OBJ-AT ?auto_8919 ?auto_8913 ) ( not ( = ?auto_8919 ?auto_8914 ) ) ( OBJ-AT ?auto_8914 ?auto_8917 ) ( TRUCK-AT ?auto_8916 ?auto_8913 ) ( OBJ-AT ?auto_8915 ?auto_8913 ) ( not ( = ?auto_8914 ?auto_8915 ) ) ( not ( = ?auto_8915 ?auto_8919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8919 ?auto_8914 ?auto_8913 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8928 - OBJ
      ?auto_8929 - OBJ
      ?auto_8930 - OBJ
      ?auto_8927 - LOCATION
    )
    :vars
    (
      ?auto_8932 - LOCATION
      ?auto_8933 - CITY
      ?auto_8931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8932 ?auto_8933 ) ( IN-CITY ?auto_8927 ?auto_8933 ) ( not ( = ?auto_8927 ?auto_8932 ) ) ( OBJ-AT ?auto_8928 ?auto_8927 ) ( not ( = ?auto_8928 ?auto_8930 ) ) ( OBJ-AT ?auto_8930 ?auto_8932 ) ( TRUCK-AT ?auto_8931 ?auto_8927 ) ( OBJ-AT ?auto_8929 ?auto_8927 ) ( not ( = ?auto_8928 ?auto_8929 ) ) ( not ( = ?auto_8929 ?auto_8930 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8928 ?auto_8930 ?auto_8927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8935 - OBJ
      ?auto_8936 - OBJ
      ?auto_8937 - OBJ
      ?auto_8934 - LOCATION
    )
    :vars
    (
      ?auto_8939 - LOCATION
      ?auto_8940 - CITY
      ?auto_8938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8939 ?auto_8940 ) ( IN-CITY ?auto_8934 ?auto_8940 ) ( not ( = ?auto_8934 ?auto_8939 ) ) ( OBJ-AT ?auto_8935 ?auto_8934 ) ( not ( = ?auto_8935 ?auto_8937 ) ) ( OBJ-AT ?auto_8937 ?auto_8939 ) ( TRUCK-AT ?auto_8938 ?auto_8934 ) ( OBJ-AT ?auto_8936 ?auto_8934 ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8936 ?auto_8937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8935 ?auto_8937 ?auto_8934 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8942 - OBJ
      ?auto_8943 - OBJ
      ?auto_8944 - OBJ
      ?auto_8941 - LOCATION
    )
    :vars
    (
      ?auto_8946 - LOCATION
      ?auto_8947 - CITY
      ?auto_8945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8946 ?auto_8947 ) ( IN-CITY ?auto_8941 ?auto_8947 ) ( not ( = ?auto_8941 ?auto_8946 ) ) ( OBJ-AT ?auto_8944 ?auto_8941 ) ( not ( = ?auto_8944 ?auto_8943 ) ) ( OBJ-AT ?auto_8943 ?auto_8946 ) ( TRUCK-AT ?auto_8945 ?auto_8941 ) ( OBJ-AT ?auto_8942 ?auto_8941 ) ( not ( = ?auto_8942 ?auto_8943 ) ) ( not ( = ?auto_8942 ?auto_8944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8944 ?auto_8943 ?auto_8941 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8949 - OBJ
      ?auto_8950 - OBJ
      ?auto_8951 - OBJ
      ?auto_8948 - LOCATION
    )
    :vars
    (
      ?auto_8953 - LOCATION
      ?auto_8954 - CITY
      ?auto_8952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8953 ?auto_8954 ) ( IN-CITY ?auto_8948 ?auto_8954 ) ( not ( = ?auto_8948 ?auto_8953 ) ) ( OBJ-AT ?auto_8949 ?auto_8948 ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( OBJ-AT ?auto_8950 ?auto_8953 ) ( TRUCK-AT ?auto_8952 ?auto_8948 ) ( OBJ-AT ?auto_8951 ?auto_8948 ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8950 ?auto_8951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8949 ?auto_8950 ?auto_8948 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8963 - OBJ
      ?auto_8964 - OBJ
      ?auto_8965 - OBJ
      ?auto_8962 - LOCATION
    )
    :vars
    (
      ?auto_8967 - LOCATION
      ?auto_8968 - CITY
      ?auto_8966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8967 ?auto_8968 ) ( IN-CITY ?auto_8962 ?auto_8968 ) ( not ( = ?auto_8962 ?auto_8967 ) ) ( OBJ-AT ?auto_8964 ?auto_8962 ) ( not ( = ?auto_8964 ?auto_8965 ) ) ( OBJ-AT ?auto_8965 ?auto_8967 ) ( TRUCK-AT ?auto_8966 ?auto_8962 ) ( OBJ-AT ?auto_8963 ?auto_8962 ) ( not ( = ?auto_8963 ?auto_8964 ) ) ( not ( = ?auto_8963 ?auto_8965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8964 ?auto_8965 ?auto_8962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8970 - OBJ
      ?auto_8971 - OBJ
      ?auto_8972 - OBJ
      ?auto_8969 - LOCATION
    )
    :vars
    (
      ?auto_8974 - LOCATION
      ?auto_8975 - CITY
      ?auto_8976 - OBJ
      ?auto_8973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8974 ?auto_8975 ) ( IN-CITY ?auto_8969 ?auto_8975 ) ( not ( = ?auto_8969 ?auto_8974 ) ) ( OBJ-AT ?auto_8976 ?auto_8969 ) ( not ( = ?auto_8976 ?auto_8972 ) ) ( OBJ-AT ?auto_8972 ?auto_8974 ) ( TRUCK-AT ?auto_8973 ?auto_8969 ) ( OBJ-AT ?auto_8970 ?auto_8969 ) ( OBJ-AT ?auto_8971 ?auto_8969 ) ( not ( = ?auto_8970 ?auto_8971 ) ) ( not ( = ?auto_8970 ?auto_8972 ) ) ( not ( = ?auto_8970 ?auto_8976 ) ) ( not ( = ?auto_8971 ?auto_8972 ) ) ( not ( = ?auto_8971 ?auto_8976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8976 ?auto_8972 ?auto_8969 ) )
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
      ?auto_8982 - LOCATION
      ?auto_8983 - CITY
      ?auto_8981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8982 ?auto_8983 ) ( IN-CITY ?auto_8977 ?auto_8983 ) ( not ( = ?auto_8977 ?auto_8982 ) ) ( OBJ-AT ?auto_8980 ?auto_8977 ) ( not ( = ?auto_8980 ?auto_8979 ) ) ( OBJ-AT ?auto_8979 ?auto_8982 ) ( TRUCK-AT ?auto_8981 ?auto_8977 ) ( OBJ-AT ?auto_8978 ?auto_8977 ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8980 ?auto_8979 ?auto_8977 ) )
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
      ?auto_8990 - CITY
      ?auto_8991 - OBJ
      ?auto_8988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8989 ?auto_8990 ) ( IN-CITY ?auto_8984 ?auto_8990 ) ( not ( = ?auto_8984 ?auto_8989 ) ) ( OBJ-AT ?auto_8991 ?auto_8984 ) ( not ( = ?auto_8991 ?auto_8986 ) ) ( OBJ-AT ?auto_8986 ?auto_8989 ) ( TRUCK-AT ?auto_8988 ?auto_8984 ) ( OBJ-AT ?auto_8985 ?auto_8984 ) ( OBJ-AT ?auto_8987 ?auto_8984 ) ( not ( = ?auto_8985 ?auto_8986 ) ) ( not ( = ?auto_8985 ?auto_8987 ) ) ( not ( = ?auto_8985 ?auto_8991 ) ) ( not ( = ?auto_8986 ?auto_8987 ) ) ( not ( = ?auto_8987 ?auto_8991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8991 ?auto_8986 ?auto_8984 ) )
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
      ?auto_9005 - LOCATION
      ?auto_9006 - CITY
      ?auto_9004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9005 ?auto_9006 ) ( IN-CITY ?auto_9000 ?auto_9006 ) ( not ( = ?auto_9000 ?auto_9005 ) ) ( OBJ-AT ?auto_9002 ?auto_9000 ) ( not ( = ?auto_9002 ?auto_9001 ) ) ( OBJ-AT ?auto_9001 ?auto_9005 ) ( TRUCK-AT ?auto_9004 ?auto_9000 ) ( OBJ-AT ?auto_9003 ?auto_9000 ) ( not ( = ?auto_9001 ?auto_9003 ) ) ( not ( = ?auto_9002 ?auto_9003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9002 ?auto_9001 ?auto_9000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9008 - OBJ
      ?auto_9009 - OBJ
      ?auto_9010 - OBJ
      ?auto_9007 - LOCATION
    )
    :vars
    (
      ?auto_9012 - LOCATION
      ?auto_9013 - CITY
      ?auto_9011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9012 ?auto_9013 ) ( IN-CITY ?auto_9007 ?auto_9013 ) ( not ( = ?auto_9007 ?auto_9012 ) ) ( OBJ-AT ?auto_9009 ?auto_9007 ) ( not ( = ?auto_9009 ?auto_9008 ) ) ( OBJ-AT ?auto_9008 ?auto_9012 ) ( TRUCK-AT ?auto_9011 ?auto_9007 ) ( OBJ-AT ?auto_9010 ?auto_9007 ) ( not ( = ?auto_9008 ?auto_9010 ) ) ( not ( = ?auto_9009 ?auto_9010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9009 ?auto_9008 ?auto_9007 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9022 - OBJ
      ?auto_9023 - OBJ
      ?auto_9024 - OBJ
      ?auto_9021 - LOCATION
    )
    :vars
    (
      ?auto_9026 - LOCATION
      ?auto_9027 - CITY
      ?auto_9025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9026 ?auto_9027 ) ( IN-CITY ?auto_9021 ?auto_9027 ) ( not ( = ?auto_9021 ?auto_9026 ) ) ( OBJ-AT ?auto_9024 ?auto_9021 ) ( not ( = ?auto_9024 ?auto_9022 ) ) ( OBJ-AT ?auto_9022 ?auto_9026 ) ( TRUCK-AT ?auto_9025 ?auto_9021 ) ( OBJ-AT ?auto_9023 ?auto_9021 ) ( not ( = ?auto_9022 ?auto_9023 ) ) ( not ( = ?auto_9023 ?auto_9024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9024 ?auto_9022 ?auto_9021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9029 - OBJ
      ?auto_9030 - OBJ
      ?auto_9031 - OBJ
      ?auto_9028 - LOCATION
    )
    :vars
    (
      ?auto_9033 - LOCATION
      ?auto_9034 - CITY
      ?auto_9035 - OBJ
      ?auto_9032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9033 ?auto_9034 ) ( IN-CITY ?auto_9028 ?auto_9034 ) ( not ( = ?auto_9028 ?auto_9033 ) ) ( OBJ-AT ?auto_9035 ?auto_9028 ) ( not ( = ?auto_9035 ?auto_9029 ) ) ( OBJ-AT ?auto_9029 ?auto_9033 ) ( TRUCK-AT ?auto_9032 ?auto_9028 ) ( OBJ-AT ?auto_9030 ?auto_9028 ) ( OBJ-AT ?auto_9031 ?auto_9028 ) ( not ( = ?auto_9029 ?auto_9030 ) ) ( not ( = ?auto_9029 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9035 ) ) ( not ( = ?auto_9031 ?auto_9035 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9035 ?auto_9029 ?auto_9028 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9068 - OBJ
      ?auto_9067 - LOCATION
    )
    :vars
    (
      ?auto_9070 - LOCATION
      ?auto_9071 - CITY
      ?auto_9072 - OBJ
      ?auto_9069 - TRUCK
      ?auto_9073 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9070 ?auto_9071 ) ( IN-CITY ?auto_9067 ?auto_9071 ) ( not ( = ?auto_9067 ?auto_9070 ) ) ( OBJ-AT ?auto_9072 ?auto_9067 ) ( not ( = ?auto_9072 ?auto_9068 ) ) ( OBJ-AT ?auto_9068 ?auto_9070 ) ( TRUCK-AT ?auto_9069 ?auto_9067 ) ( IN-TRUCK ?auto_9073 ?auto_9069 ) ( not ( = ?auto_9072 ?auto_9073 ) ) ( not ( = ?auto_9068 ?auto_9073 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9072 ?auto_9073 ?auto_9067 )
      ( DELIVER-2PKG ?auto_9072 ?auto_9068 ?auto_9067 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9075 - OBJ
      ?auto_9076 - OBJ
      ?auto_9074 - LOCATION
    )
    :vars
    (
      ?auto_9079 - LOCATION
      ?auto_9080 - CITY
      ?auto_9078 - TRUCK
      ?auto_9077 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9079 ?auto_9080 ) ( IN-CITY ?auto_9074 ?auto_9080 ) ( not ( = ?auto_9074 ?auto_9079 ) ) ( OBJ-AT ?auto_9075 ?auto_9074 ) ( not ( = ?auto_9075 ?auto_9076 ) ) ( OBJ-AT ?auto_9076 ?auto_9079 ) ( TRUCK-AT ?auto_9078 ?auto_9074 ) ( IN-TRUCK ?auto_9077 ?auto_9078 ) ( not ( = ?auto_9075 ?auto_9077 ) ) ( not ( = ?auto_9076 ?auto_9077 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9076 ?auto_9074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9082 - OBJ
      ?auto_9083 - OBJ
      ?auto_9081 - LOCATION
    )
    :vars
    (
      ?auto_9086 - LOCATION
      ?auto_9085 - CITY
      ?auto_9087 - OBJ
      ?auto_9084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9086 ?auto_9085 ) ( IN-CITY ?auto_9081 ?auto_9085 ) ( not ( = ?auto_9081 ?auto_9086 ) ) ( OBJ-AT ?auto_9087 ?auto_9081 ) ( not ( = ?auto_9087 ?auto_9083 ) ) ( OBJ-AT ?auto_9083 ?auto_9086 ) ( TRUCK-AT ?auto_9084 ?auto_9081 ) ( IN-TRUCK ?auto_9082 ?auto_9084 ) ( not ( = ?auto_9087 ?auto_9082 ) ) ( not ( = ?auto_9083 ?auto_9082 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9087 ?auto_9083 ?auto_9081 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9089 - OBJ
      ?auto_9090 - OBJ
      ?auto_9088 - LOCATION
    )
    :vars
    (
      ?auto_9094 - LOCATION
      ?auto_9092 - CITY
      ?auto_9091 - TRUCK
      ?auto_9093 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9094 ?auto_9092 ) ( IN-CITY ?auto_9088 ?auto_9092 ) ( not ( = ?auto_9088 ?auto_9094 ) ) ( OBJ-AT ?auto_9090 ?auto_9088 ) ( not ( = ?auto_9090 ?auto_9089 ) ) ( OBJ-AT ?auto_9089 ?auto_9094 ) ( TRUCK-AT ?auto_9091 ?auto_9088 ) ( IN-TRUCK ?auto_9093 ?auto_9091 ) ( not ( = ?auto_9090 ?auto_9093 ) ) ( not ( = ?auto_9089 ?auto_9093 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9090 ?auto_9089 ?auto_9088 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9096 - OBJ
      ?auto_9097 - OBJ
      ?auto_9095 - LOCATION
    )
    :vars
    (
      ?auto_9100 - LOCATION
      ?auto_9099 - CITY
      ?auto_9101 - OBJ
      ?auto_9098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9100 ?auto_9099 ) ( IN-CITY ?auto_9095 ?auto_9099 ) ( not ( = ?auto_9095 ?auto_9100 ) ) ( OBJ-AT ?auto_9101 ?auto_9095 ) ( not ( = ?auto_9101 ?auto_9096 ) ) ( OBJ-AT ?auto_9096 ?auto_9100 ) ( TRUCK-AT ?auto_9098 ?auto_9095 ) ( IN-TRUCK ?auto_9097 ?auto_9098 ) ( not ( = ?auto_9101 ?auto_9097 ) ) ( not ( = ?auto_9096 ?auto_9097 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9101 ?auto_9096 ?auto_9095 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9111 - OBJ
      ?auto_9112 - OBJ
      ?auto_9113 - OBJ
      ?auto_9110 - LOCATION
    )
    :vars
    (
      ?auto_9117 - LOCATION
      ?auto_9115 - CITY
      ?auto_9114 - TRUCK
      ?auto_9116 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9117 ?auto_9115 ) ( IN-CITY ?auto_9110 ?auto_9115 ) ( not ( = ?auto_9110 ?auto_9117 ) ) ( OBJ-AT ?auto_9111 ?auto_9110 ) ( not ( = ?auto_9111 ?auto_9113 ) ) ( OBJ-AT ?auto_9113 ?auto_9117 ) ( TRUCK-AT ?auto_9114 ?auto_9110 ) ( IN-TRUCK ?auto_9116 ?auto_9114 ) ( not ( = ?auto_9111 ?auto_9116 ) ) ( not ( = ?auto_9113 ?auto_9116 ) ) ( OBJ-AT ?auto_9112 ?auto_9110 ) ( not ( = ?auto_9111 ?auto_9112 ) ) ( not ( = ?auto_9112 ?auto_9113 ) ) ( not ( = ?auto_9112 ?auto_9116 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9111 ?auto_9113 ?auto_9110 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9119 - OBJ
      ?auto_9120 - OBJ
      ?auto_9121 - OBJ
      ?auto_9118 - LOCATION
    )
    :vars
    (
      ?auto_9124 - LOCATION
      ?auto_9123 - CITY
      ?auto_9122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9124 ?auto_9123 ) ( IN-CITY ?auto_9118 ?auto_9123 ) ( not ( = ?auto_9118 ?auto_9124 ) ) ( OBJ-AT ?auto_9119 ?auto_9118 ) ( not ( = ?auto_9119 ?auto_9121 ) ) ( OBJ-AT ?auto_9121 ?auto_9124 ) ( TRUCK-AT ?auto_9122 ?auto_9118 ) ( IN-TRUCK ?auto_9120 ?auto_9122 ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( not ( = ?auto_9121 ?auto_9120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9119 ?auto_9121 ?auto_9118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9126 - OBJ
      ?auto_9127 - OBJ
      ?auto_9128 - OBJ
      ?auto_9125 - LOCATION
    )
    :vars
    (
      ?auto_9132 - LOCATION
      ?auto_9130 - CITY
      ?auto_9129 - TRUCK
      ?auto_9131 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9132 ?auto_9130 ) ( IN-CITY ?auto_9125 ?auto_9130 ) ( not ( = ?auto_9125 ?auto_9132 ) ) ( OBJ-AT ?auto_9128 ?auto_9125 ) ( not ( = ?auto_9128 ?auto_9127 ) ) ( OBJ-AT ?auto_9127 ?auto_9132 ) ( TRUCK-AT ?auto_9129 ?auto_9125 ) ( IN-TRUCK ?auto_9131 ?auto_9129 ) ( not ( = ?auto_9128 ?auto_9131 ) ) ( not ( = ?auto_9127 ?auto_9131 ) ) ( OBJ-AT ?auto_9126 ?auto_9125 ) ( not ( = ?auto_9126 ?auto_9127 ) ) ( not ( = ?auto_9126 ?auto_9128 ) ) ( not ( = ?auto_9126 ?auto_9131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9128 ?auto_9127 ?auto_9125 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9134 - OBJ
      ?auto_9135 - OBJ
      ?auto_9136 - OBJ
      ?auto_9133 - LOCATION
    )
    :vars
    (
      ?auto_9139 - LOCATION
      ?auto_9138 - CITY
      ?auto_9137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9139 ?auto_9138 ) ( IN-CITY ?auto_9133 ?auto_9138 ) ( not ( = ?auto_9133 ?auto_9139 ) ) ( OBJ-AT ?auto_9134 ?auto_9133 ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( OBJ-AT ?auto_9135 ?auto_9139 ) ( TRUCK-AT ?auto_9137 ?auto_9133 ) ( IN-TRUCK ?auto_9136 ?auto_9137 ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9135 ?auto_9136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9134 ?auto_9135 ?auto_9133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9149 - OBJ
      ?auto_9150 - OBJ
      ?auto_9151 - OBJ
      ?auto_9148 - LOCATION
    )
    :vars
    (
      ?auto_9154 - LOCATION
      ?auto_9153 - CITY
      ?auto_9152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9154 ?auto_9153 ) ( IN-CITY ?auto_9148 ?auto_9153 ) ( not ( = ?auto_9148 ?auto_9154 ) ) ( OBJ-AT ?auto_9150 ?auto_9148 ) ( not ( = ?auto_9150 ?auto_9151 ) ) ( OBJ-AT ?auto_9151 ?auto_9154 ) ( TRUCK-AT ?auto_9152 ?auto_9148 ) ( IN-TRUCK ?auto_9149 ?auto_9152 ) ( not ( = ?auto_9150 ?auto_9149 ) ) ( not ( = ?auto_9151 ?auto_9149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9150 ?auto_9151 ?auto_9148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9164 - OBJ
      ?auto_9165 - OBJ
      ?auto_9166 - OBJ
      ?auto_9163 - LOCATION
    )
    :vars
    (
      ?auto_9169 - LOCATION
      ?auto_9168 - CITY
      ?auto_9167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9169 ?auto_9168 ) ( IN-CITY ?auto_9163 ?auto_9168 ) ( not ( = ?auto_9163 ?auto_9169 ) ) ( OBJ-AT ?auto_9166 ?auto_9163 ) ( not ( = ?auto_9166 ?auto_9165 ) ) ( OBJ-AT ?auto_9165 ?auto_9169 ) ( TRUCK-AT ?auto_9167 ?auto_9163 ) ( IN-TRUCK ?auto_9164 ?auto_9167 ) ( not ( = ?auto_9166 ?auto_9164 ) ) ( not ( = ?auto_9165 ?auto_9164 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9166 ?auto_9165 ?auto_9163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9187 - OBJ
      ?auto_9188 - OBJ
      ?auto_9189 - OBJ
      ?auto_9186 - LOCATION
    )
    :vars
    (
      ?auto_9193 - LOCATION
      ?auto_9191 - CITY
      ?auto_9190 - TRUCK
      ?auto_9192 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_9193 ?auto_9191 ) ( IN-CITY ?auto_9186 ?auto_9191 ) ( not ( = ?auto_9186 ?auto_9193 ) ) ( OBJ-AT ?auto_9188 ?auto_9186 ) ( not ( = ?auto_9188 ?auto_9187 ) ) ( OBJ-AT ?auto_9187 ?auto_9193 ) ( TRUCK-AT ?auto_9190 ?auto_9186 ) ( IN-TRUCK ?auto_9192 ?auto_9190 ) ( not ( = ?auto_9188 ?auto_9192 ) ) ( not ( = ?auto_9187 ?auto_9192 ) ) ( OBJ-AT ?auto_9189 ?auto_9186 ) ( not ( = ?auto_9187 ?auto_9189 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( not ( = ?auto_9189 ?auto_9192 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9188 ?auto_9187 ?auto_9186 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9195 - OBJ
      ?auto_9196 - OBJ
      ?auto_9197 - OBJ
      ?auto_9194 - LOCATION
    )
    :vars
    (
      ?auto_9200 - LOCATION
      ?auto_9199 - CITY
      ?auto_9198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9200 ?auto_9199 ) ( IN-CITY ?auto_9194 ?auto_9199 ) ( not ( = ?auto_9194 ?auto_9200 ) ) ( OBJ-AT ?auto_9196 ?auto_9194 ) ( not ( = ?auto_9196 ?auto_9195 ) ) ( OBJ-AT ?auto_9195 ?auto_9200 ) ( TRUCK-AT ?auto_9198 ?auto_9194 ) ( IN-TRUCK ?auto_9197 ?auto_9198 ) ( not ( = ?auto_9196 ?auto_9197 ) ) ( not ( = ?auto_9195 ?auto_9197 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9196 ?auto_9195 ?auto_9194 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9210 - OBJ
      ?auto_9211 - OBJ
      ?auto_9212 - OBJ
      ?auto_9209 - LOCATION
    )
    :vars
    (
      ?auto_9215 - LOCATION
      ?auto_9214 - CITY
      ?auto_9213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9215 ?auto_9214 ) ( IN-CITY ?auto_9209 ?auto_9214 ) ( not ( = ?auto_9209 ?auto_9215 ) ) ( OBJ-AT ?auto_9212 ?auto_9209 ) ( not ( = ?auto_9212 ?auto_9210 ) ) ( OBJ-AT ?auto_9210 ?auto_9215 ) ( TRUCK-AT ?auto_9213 ?auto_9209 ) ( IN-TRUCK ?auto_9211 ?auto_9213 ) ( not ( = ?auto_9212 ?auto_9211 ) ) ( not ( = ?auto_9210 ?auto_9211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9212 ?auto_9210 ?auto_9209 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9258 - OBJ
      ?auto_9257 - LOCATION
    )
    :vars
    (
      ?auto_9262 - LOCATION
      ?auto_9260 - CITY
      ?auto_9263 - OBJ
      ?auto_9261 - OBJ
      ?auto_9259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9262 ?auto_9260 ) ( IN-CITY ?auto_9257 ?auto_9260 ) ( not ( = ?auto_9257 ?auto_9262 ) ) ( OBJ-AT ?auto_9263 ?auto_9257 ) ( not ( = ?auto_9263 ?auto_9258 ) ) ( OBJ-AT ?auto_9258 ?auto_9262 ) ( IN-TRUCK ?auto_9261 ?auto_9259 ) ( not ( = ?auto_9263 ?auto_9261 ) ) ( not ( = ?auto_9258 ?auto_9261 ) ) ( TRUCK-AT ?auto_9259 ?auto_9262 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9259 ?auto_9262 ?auto_9257 ?auto_9260 )
      ( DELIVER-2PKG ?auto_9263 ?auto_9258 ?auto_9257 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9265 - OBJ
      ?auto_9266 - OBJ
      ?auto_9264 - LOCATION
    )
    :vars
    (
      ?auto_9270 - LOCATION
      ?auto_9267 - CITY
      ?auto_9268 - OBJ
      ?auto_9269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9270 ?auto_9267 ) ( IN-CITY ?auto_9264 ?auto_9267 ) ( not ( = ?auto_9264 ?auto_9270 ) ) ( OBJ-AT ?auto_9265 ?auto_9264 ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( OBJ-AT ?auto_9266 ?auto_9270 ) ( IN-TRUCK ?auto_9268 ?auto_9269 ) ( not ( = ?auto_9265 ?auto_9268 ) ) ( not ( = ?auto_9266 ?auto_9268 ) ) ( TRUCK-AT ?auto_9269 ?auto_9270 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9266 ?auto_9264 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9272 - OBJ
      ?auto_9273 - OBJ
      ?auto_9271 - LOCATION
    )
    :vars
    (
      ?auto_9276 - LOCATION
      ?auto_9277 - CITY
      ?auto_9275 - OBJ
      ?auto_9274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9276 ?auto_9277 ) ( IN-CITY ?auto_9271 ?auto_9277 ) ( not ( = ?auto_9271 ?auto_9276 ) ) ( OBJ-AT ?auto_9275 ?auto_9271 ) ( not ( = ?auto_9275 ?auto_9273 ) ) ( OBJ-AT ?auto_9273 ?auto_9276 ) ( IN-TRUCK ?auto_9272 ?auto_9274 ) ( not ( = ?auto_9275 ?auto_9272 ) ) ( not ( = ?auto_9273 ?auto_9272 ) ) ( TRUCK-AT ?auto_9274 ?auto_9276 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9275 ?auto_9273 ?auto_9271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9279 - OBJ
      ?auto_9280 - OBJ
      ?auto_9278 - LOCATION
    )
    :vars
    (
      ?auto_9283 - LOCATION
      ?auto_9284 - CITY
      ?auto_9282 - OBJ
      ?auto_9281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9283 ?auto_9284 ) ( IN-CITY ?auto_9278 ?auto_9284 ) ( not ( = ?auto_9278 ?auto_9283 ) ) ( OBJ-AT ?auto_9280 ?auto_9278 ) ( not ( = ?auto_9280 ?auto_9279 ) ) ( OBJ-AT ?auto_9279 ?auto_9283 ) ( IN-TRUCK ?auto_9282 ?auto_9281 ) ( not ( = ?auto_9280 ?auto_9282 ) ) ( not ( = ?auto_9279 ?auto_9282 ) ) ( TRUCK-AT ?auto_9281 ?auto_9283 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9280 ?auto_9279 ?auto_9278 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9286 - OBJ
      ?auto_9287 - OBJ
      ?auto_9285 - LOCATION
    )
    :vars
    (
      ?auto_9290 - LOCATION
      ?auto_9291 - CITY
      ?auto_9289 - OBJ
      ?auto_9288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9290 ?auto_9291 ) ( IN-CITY ?auto_9285 ?auto_9291 ) ( not ( = ?auto_9285 ?auto_9290 ) ) ( OBJ-AT ?auto_9289 ?auto_9285 ) ( not ( = ?auto_9289 ?auto_9286 ) ) ( OBJ-AT ?auto_9286 ?auto_9290 ) ( IN-TRUCK ?auto_9287 ?auto_9288 ) ( not ( = ?auto_9289 ?auto_9287 ) ) ( not ( = ?auto_9286 ?auto_9287 ) ) ( TRUCK-AT ?auto_9288 ?auto_9290 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9289 ?auto_9286 ?auto_9285 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9301 - OBJ
      ?auto_9302 - OBJ
      ?auto_9303 - OBJ
      ?auto_9300 - LOCATION
    )
    :vars
    (
      ?auto_9306 - LOCATION
      ?auto_9307 - CITY
      ?auto_9305 - OBJ
      ?auto_9304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9306 ?auto_9307 ) ( IN-CITY ?auto_9300 ?auto_9307 ) ( not ( = ?auto_9300 ?auto_9306 ) ) ( OBJ-AT ?auto_9301 ?auto_9300 ) ( not ( = ?auto_9301 ?auto_9303 ) ) ( OBJ-AT ?auto_9303 ?auto_9306 ) ( IN-TRUCK ?auto_9305 ?auto_9304 ) ( not ( = ?auto_9301 ?auto_9305 ) ) ( not ( = ?auto_9303 ?auto_9305 ) ) ( TRUCK-AT ?auto_9304 ?auto_9306 ) ( OBJ-AT ?auto_9302 ?auto_9300 ) ( not ( = ?auto_9301 ?auto_9302 ) ) ( not ( = ?auto_9302 ?auto_9303 ) ) ( not ( = ?auto_9302 ?auto_9305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9301 ?auto_9303 ?auto_9300 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9309 - OBJ
      ?auto_9310 - OBJ
      ?auto_9311 - OBJ
      ?auto_9308 - LOCATION
    )
    :vars
    (
      ?auto_9313 - LOCATION
      ?auto_9314 - CITY
      ?auto_9312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9313 ?auto_9314 ) ( IN-CITY ?auto_9308 ?auto_9314 ) ( not ( = ?auto_9308 ?auto_9313 ) ) ( OBJ-AT ?auto_9309 ?auto_9308 ) ( not ( = ?auto_9309 ?auto_9311 ) ) ( OBJ-AT ?auto_9311 ?auto_9313 ) ( IN-TRUCK ?auto_9310 ?auto_9312 ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9311 ?auto_9310 ) ) ( TRUCK-AT ?auto_9312 ?auto_9313 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9309 ?auto_9311 ?auto_9308 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9316 - OBJ
      ?auto_9317 - OBJ
      ?auto_9318 - OBJ
      ?auto_9315 - LOCATION
    )
    :vars
    (
      ?auto_9321 - LOCATION
      ?auto_9322 - CITY
      ?auto_9320 - OBJ
      ?auto_9319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9321 ?auto_9322 ) ( IN-CITY ?auto_9315 ?auto_9322 ) ( not ( = ?auto_9315 ?auto_9321 ) ) ( OBJ-AT ?auto_9318 ?auto_9315 ) ( not ( = ?auto_9318 ?auto_9317 ) ) ( OBJ-AT ?auto_9317 ?auto_9321 ) ( IN-TRUCK ?auto_9320 ?auto_9319 ) ( not ( = ?auto_9318 ?auto_9320 ) ) ( not ( = ?auto_9317 ?auto_9320 ) ) ( TRUCK-AT ?auto_9319 ?auto_9321 ) ( OBJ-AT ?auto_9316 ?auto_9315 ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9318 ) ) ( not ( = ?auto_9316 ?auto_9320 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9318 ?auto_9317 ?auto_9315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9324 - OBJ
      ?auto_9325 - OBJ
      ?auto_9326 - OBJ
      ?auto_9323 - LOCATION
    )
    :vars
    (
      ?auto_9328 - LOCATION
      ?auto_9329 - CITY
      ?auto_9327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9328 ?auto_9329 ) ( IN-CITY ?auto_9323 ?auto_9329 ) ( not ( = ?auto_9323 ?auto_9328 ) ) ( OBJ-AT ?auto_9324 ?auto_9323 ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( OBJ-AT ?auto_9325 ?auto_9328 ) ( IN-TRUCK ?auto_9326 ?auto_9327 ) ( not ( = ?auto_9324 ?auto_9326 ) ) ( not ( = ?auto_9325 ?auto_9326 ) ) ( TRUCK-AT ?auto_9327 ?auto_9328 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9324 ?auto_9325 ?auto_9323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9339 - OBJ
      ?auto_9340 - OBJ
      ?auto_9341 - OBJ
      ?auto_9338 - LOCATION
    )
    :vars
    (
      ?auto_9343 - LOCATION
      ?auto_9344 - CITY
      ?auto_9342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9343 ?auto_9344 ) ( IN-CITY ?auto_9338 ?auto_9344 ) ( not ( = ?auto_9338 ?auto_9343 ) ) ( OBJ-AT ?auto_9340 ?auto_9338 ) ( not ( = ?auto_9340 ?auto_9341 ) ) ( OBJ-AT ?auto_9341 ?auto_9343 ) ( IN-TRUCK ?auto_9339 ?auto_9342 ) ( not ( = ?auto_9340 ?auto_9339 ) ) ( not ( = ?auto_9341 ?auto_9339 ) ) ( TRUCK-AT ?auto_9342 ?auto_9343 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9340 ?auto_9341 ?auto_9338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9354 - OBJ
      ?auto_9355 - OBJ
      ?auto_9356 - OBJ
      ?auto_9353 - LOCATION
    )
    :vars
    (
      ?auto_9358 - LOCATION
      ?auto_9359 - CITY
      ?auto_9357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9358 ?auto_9359 ) ( IN-CITY ?auto_9353 ?auto_9359 ) ( not ( = ?auto_9353 ?auto_9358 ) ) ( OBJ-AT ?auto_9356 ?auto_9353 ) ( not ( = ?auto_9356 ?auto_9355 ) ) ( OBJ-AT ?auto_9355 ?auto_9358 ) ( IN-TRUCK ?auto_9354 ?auto_9357 ) ( not ( = ?auto_9356 ?auto_9354 ) ) ( not ( = ?auto_9355 ?auto_9354 ) ) ( TRUCK-AT ?auto_9357 ?auto_9358 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9356 ?auto_9355 ?auto_9353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9377 - OBJ
      ?auto_9378 - OBJ
      ?auto_9379 - OBJ
      ?auto_9376 - LOCATION
    )
    :vars
    (
      ?auto_9382 - LOCATION
      ?auto_9383 - CITY
      ?auto_9381 - OBJ
      ?auto_9380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9382 ?auto_9383 ) ( IN-CITY ?auto_9376 ?auto_9383 ) ( not ( = ?auto_9376 ?auto_9382 ) ) ( OBJ-AT ?auto_9378 ?auto_9376 ) ( not ( = ?auto_9378 ?auto_9377 ) ) ( OBJ-AT ?auto_9377 ?auto_9382 ) ( IN-TRUCK ?auto_9381 ?auto_9380 ) ( not ( = ?auto_9378 ?auto_9381 ) ) ( not ( = ?auto_9377 ?auto_9381 ) ) ( TRUCK-AT ?auto_9380 ?auto_9382 ) ( OBJ-AT ?auto_9379 ?auto_9376 ) ( not ( = ?auto_9377 ?auto_9379 ) ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9379 ?auto_9381 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9378 ?auto_9377 ?auto_9376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9385 - OBJ
      ?auto_9386 - OBJ
      ?auto_9387 - OBJ
      ?auto_9384 - LOCATION
    )
    :vars
    (
      ?auto_9389 - LOCATION
      ?auto_9390 - CITY
      ?auto_9388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9389 ?auto_9390 ) ( IN-CITY ?auto_9384 ?auto_9390 ) ( not ( = ?auto_9384 ?auto_9389 ) ) ( OBJ-AT ?auto_9386 ?auto_9384 ) ( not ( = ?auto_9386 ?auto_9385 ) ) ( OBJ-AT ?auto_9385 ?auto_9389 ) ( IN-TRUCK ?auto_9387 ?auto_9388 ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( not ( = ?auto_9385 ?auto_9387 ) ) ( TRUCK-AT ?auto_9388 ?auto_9389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9386 ?auto_9385 ?auto_9384 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9400 - OBJ
      ?auto_9401 - OBJ
      ?auto_9402 - OBJ
      ?auto_9399 - LOCATION
    )
    :vars
    (
      ?auto_9404 - LOCATION
      ?auto_9405 - CITY
      ?auto_9403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9404 ?auto_9405 ) ( IN-CITY ?auto_9399 ?auto_9405 ) ( not ( = ?auto_9399 ?auto_9404 ) ) ( OBJ-AT ?auto_9402 ?auto_9399 ) ( not ( = ?auto_9402 ?auto_9400 ) ) ( OBJ-AT ?auto_9400 ?auto_9404 ) ( IN-TRUCK ?auto_9401 ?auto_9403 ) ( not ( = ?auto_9402 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( TRUCK-AT ?auto_9403 ?auto_9404 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9402 ?auto_9400 ?auto_9399 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9448 - OBJ
      ?auto_9447 - LOCATION
    )
    :vars
    (
      ?auto_9452 - LOCATION
      ?auto_9453 - CITY
      ?auto_9450 - OBJ
      ?auto_9451 - OBJ
      ?auto_9449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9452 ?auto_9453 ) ( IN-CITY ?auto_9447 ?auto_9453 ) ( not ( = ?auto_9447 ?auto_9452 ) ) ( OBJ-AT ?auto_9450 ?auto_9447 ) ( not ( = ?auto_9450 ?auto_9448 ) ) ( OBJ-AT ?auto_9448 ?auto_9452 ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( not ( = ?auto_9448 ?auto_9451 ) ) ( TRUCK-AT ?auto_9449 ?auto_9452 ) ( OBJ-AT ?auto_9451 ?auto_9452 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9451 ?auto_9449 ?auto_9452 )
      ( DELIVER-2PKG ?auto_9450 ?auto_9448 ?auto_9447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9455 - OBJ
      ?auto_9456 - OBJ
      ?auto_9454 - LOCATION
    )
    :vars
    (
      ?auto_9459 - LOCATION
      ?auto_9457 - CITY
      ?auto_9458 - OBJ
      ?auto_9460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9459 ?auto_9457 ) ( IN-CITY ?auto_9454 ?auto_9457 ) ( not ( = ?auto_9454 ?auto_9459 ) ) ( OBJ-AT ?auto_9455 ?auto_9454 ) ( not ( = ?auto_9455 ?auto_9456 ) ) ( OBJ-AT ?auto_9456 ?auto_9459 ) ( not ( = ?auto_9455 ?auto_9458 ) ) ( not ( = ?auto_9456 ?auto_9458 ) ) ( TRUCK-AT ?auto_9460 ?auto_9459 ) ( OBJ-AT ?auto_9458 ?auto_9459 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9456 ?auto_9454 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9462 - OBJ
      ?auto_9463 - OBJ
      ?auto_9461 - LOCATION
    )
    :vars
    (
      ?auto_9467 - LOCATION
      ?auto_9465 - CITY
      ?auto_9464 - OBJ
      ?auto_9466 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9467 ?auto_9465 ) ( IN-CITY ?auto_9461 ?auto_9465 ) ( not ( = ?auto_9461 ?auto_9467 ) ) ( OBJ-AT ?auto_9464 ?auto_9461 ) ( not ( = ?auto_9464 ?auto_9463 ) ) ( OBJ-AT ?auto_9463 ?auto_9467 ) ( not ( = ?auto_9464 ?auto_9462 ) ) ( not ( = ?auto_9463 ?auto_9462 ) ) ( TRUCK-AT ?auto_9466 ?auto_9467 ) ( OBJ-AT ?auto_9462 ?auto_9467 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9464 ?auto_9463 ?auto_9461 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9469 - OBJ
      ?auto_9470 - OBJ
      ?auto_9468 - LOCATION
    )
    :vars
    (
      ?auto_9474 - LOCATION
      ?auto_9471 - CITY
      ?auto_9472 - OBJ
      ?auto_9473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9474 ?auto_9471 ) ( IN-CITY ?auto_9468 ?auto_9471 ) ( not ( = ?auto_9468 ?auto_9474 ) ) ( OBJ-AT ?auto_9470 ?auto_9468 ) ( not ( = ?auto_9470 ?auto_9469 ) ) ( OBJ-AT ?auto_9469 ?auto_9474 ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( not ( = ?auto_9469 ?auto_9472 ) ) ( TRUCK-AT ?auto_9473 ?auto_9474 ) ( OBJ-AT ?auto_9472 ?auto_9474 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9470 ?auto_9469 ?auto_9468 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9476 - OBJ
      ?auto_9477 - OBJ
      ?auto_9475 - LOCATION
    )
    :vars
    (
      ?auto_9481 - LOCATION
      ?auto_9479 - CITY
      ?auto_9478 - OBJ
      ?auto_9480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9481 ?auto_9479 ) ( IN-CITY ?auto_9475 ?auto_9479 ) ( not ( = ?auto_9475 ?auto_9481 ) ) ( OBJ-AT ?auto_9478 ?auto_9475 ) ( not ( = ?auto_9478 ?auto_9476 ) ) ( OBJ-AT ?auto_9476 ?auto_9481 ) ( not ( = ?auto_9478 ?auto_9477 ) ) ( not ( = ?auto_9476 ?auto_9477 ) ) ( TRUCK-AT ?auto_9480 ?auto_9481 ) ( OBJ-AT ?auto_9477 ?auto_9481 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9478 ?auto_9476 ?auto_9475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9491 - OBJ
      ?auto_9492 - OBJ
      ?auto_9493 - OBJ
      ?auto_9490 - LOCATION
    )
    :vars
    (
      ?auto_9497 - LOCATION
      ?auto_9494 - CITY
      ?auto_9495 - OBJ
      ?auto_9496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9497 ?auto_9494 ) ( IN-CITY ?auto_9490 ?auto_9494 ) ( not ( = ?auto_9490 ?auto_9497 ) ) ( OBJ-AT ?auto_9491 ?auto_9490 ) ( not ( = ?auto_9491 ?auto_9493 ) ) ( OBJ-AT ?auto_9493 ?auto_9497 ) ( not ( = ?auto_9491 ?auto_9495 ) ) ( not ( = ?auto_9493 ?auto_9495 ) ) ( TRUCK-AT ?auto_9496 ?auto_9497 ) ( OBJ-AT ?auto_9495 ?auto_9497 ) ( OBJ-AT ?auto_9492 ?auto_9490 ) ( not ( = ?auto_9491 ?auto_9492 ) ) ( not ( = ?auto_9492 ?auto_9493 ) ) ( not ( = ?auto_9492 ?auto_9495 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9491 ?auto_9493 ?auto_9490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9499 - OBJ
      ?auto_9500 - OBJ
      ?auto_9501 - OBJ
      ?auto_9498 - LOCATION
    )
    :vars
    (
      ?auto_9504 - LOCATION
      ?auto_9502 - CITY
      ?auto_9503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9504 ?auto_9502 ) ( IN-CITY ?auto_9498 ?auto_9502 ) ( not ( = ?auto_9498 ?auto_9504 ) ) ( OBJ-AT ?auto_9499 ?auto_9498 ) ( not ( = ?auto_9499 ?auto_9501 ) ) ( OBJ-AT ?auto_9501 ?auto_9504 ) ( not ( = ?auto_9499 ?auto_9500 ) ) ( not ( = ?auto_9501 ?auto_9500 ) ) ( TRUCK-AT ?auto_9503 ?auto_9504 ) ( OBJ-AT ?auto_9500 ?auto_9504 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9499 ?auto_9501 ?auto_9498 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9506 - OBJ
      ?auto_9507 - OBJ
      ?auto_9508 - OBJ
      ?auto_9505 - LOCATION
    )
    :vars
    (
      ?auto_9512 - LOCATION
      ?auto_9509 - CITY
      ?auto_9510 - OBJ
      ?auto_9511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9512 ?auto_9509 ) ( IN-CITY ?auto_9505 ?auto_9509 ) ( not ( = ?auto_9505 ?auto_9512 ) ) ( OBJ-AT ?auto_9508 ?auto_9505 ) ( not ( = ?auto_9508 ?auto_9507 ) ) ( OBJ-AT ?auto_9507 ?auto_9512 ) ( not ( = ?auto_9508 ?auto_9510 ) ) ( not ( = ?auto_9507 ?auto_9510 ) ) ( TRUCK-AT ?auto_9511 ?auto_9512 ) ( OBJ-AT ?auto_9510 ?auto_9512 ) ( OBJ-AT ?auto_9506 ?auto_9505 ) ( not ( = ?auto_9506 ?auto_9507 ) ) ( not ( = ?auto_9506 ?auto_9508 ) ) ( not ( = ?auto_9506 ?auto_9510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9508 ?auto_9507 ?auto_9505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9514 - OBJ
      ?auto_9515 - OBJ
      ?auto_9516 - OBJ
      ?auto_9513 - LOCATION
    )
    :vars
    (
      ?auto_9519 - LOCATION
      ?auto_9517 - CITY
      ?auto_9518 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9519 ?auto_9517 ) ( IN-CITY ?auto_9513 ?auto_9517 ) ( not ( = ?auto_9513 ?auto_9519 ) ) ( OBJ-AT ?auto_9514 ?auto_9513 ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( OBJ-AT ?auto_9515 ?auto_9519 ) ( not ( = ?auto_9514 ?auto_9516 ) ) ( not ( = ?auto_9515 ?auto_9516 ) ) ( TRUCK-AT ?auto_9518 ?auto_9519 ) ( OBJ-AT ?auto_9516 ?auto_9519 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9514 ?auto_9515 ?auto_9513 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9529 - OBJ
      ?auto_9530 - OBJ
      ?auto_9531 - OBJ
      ?auto_9528 - LOCATION
    )
    :vars
    (
      ?auto_9534 - LOCATION
      ?auto_9532 - CITY
      ?auto_9533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9534 ?auto_9532 ) ( IN-CITY ?auto_9528 ?auto_9532 ) ( not ( = ?auto_9528 ?auto_9534 ) ) ( OBJ-AT ?auto_9530 ?auto_9528 ) ( not ( = ?auto_9530 ?auto_9531 ) ) ( OBJ-AT ?auto_9531 ?auto_9534 ) ( not ( = ?auto_9530 ?auto_9529 ) ) ( not ( = ?auto_9531 ?auto_9529 ) ) ( TRUCK-AT ?auto_9533 ?auto_9534 ) ( OBJ-AT ?auto_9529 ?auto_9534 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9530 ?auto_9531 ?auto_9528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9544 - OBJ
      ?auto_9545 - OBJ
      ?auto_9546 - OBJ
      ?auto_9543 - LOCATION
    )
    :vars
    (
      ?auto_9549 - LOCATION
      ?auto_9547 - CITY
      ?auto_9548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9549 ?auto_9547 ) ( IN-CITY ?auto_9543 ?auto_9547 ) ( not ( = ?auto_9543 ?auto_9549 ) ) ( OBJ-AT ?auto_9546 ?auto_9543 ) ( not ( = ?auto_9546 ?auto_9545 ) ) ( OBJ-AT ?auto_9545 ?auto_9549 ) ( not ( = ?auto_9546 ?auto_9544 ) ) ( not ( = ?auto_9545 ?auto_9544 ) ) ( TRUCK-AT ?auto_9548 ?auto_9549 ) ( OBJ-AT ?auto_9544 ?auto_9549 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9546 ?auto_9545 ?auto_9543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9567 - OBJ
      ?auto_9568 - OBJ
      ?auto_9569 - OBJ
      ?auto_9566 - LOCATION
    )
    :vars
    (
      ?auto_9573 - LOCATION
      ?auto_9570 - CITY
      ?auto_9571 - OBJ
      ?auto_9572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9573 ?auto_9570 ) ( IN-CITY ?auto_9566 ?auto_9570 ) ( not ( = ?auto_9566 ?auto_9573 ) ) ( OBJ-AT ?auto_9568 ?auto_9566 ) ( not ( = ?auto_9568 ?auto_9567 ) ) ( OBJ-AT ?auto_9567 ?auto_9573 ) ( not ( = ?auto_9568 ?auto_9571 ) ) ( not ( = ?auto_9567 ?auto_9571 ) ) ( TRUCK-AT ?auto_9572 ?auto_9573 ) ( OBJ-AT ?auto_9571 ?auto_9573 ) ( OBJ-AT ?auto_9569 ?auto_9566 ) ( not ( = ?auto_9567 ?auto_9569 ) ) ( not ( = ?auto_9568 ?auto_9569 ) ) ( not ( = ?auto_9569 ?auto_9571 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9568 ?auto_9567 ?auto_9566 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9575 - OBJ
      ?auto_9576 - OBJ
      ?auto_9577 - OBJ
      ?auto_9574 - LOCATION
    )
    :vars
    (
      ?auto_9580 - LOCATION
      ?auto_9578 - CITY
      ?auto_9579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9580 ?auto_9578 ) ( IN-CITY ?auto_9574 ?auto_9578 ) ( not ( = ?auto_9574 ?auto_9580 ) ) ( OBJ-AT ?auto_9576 ?auto_9574 ) ( not ( = ?auto_9576 ?auto_9575 ) ) ( OBJ-AT ?auto_9575 ?auto_9580 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( TRUCK-AT ?auto_9579 ?auto_9580 ) ( OBJ-AT ?auto_9577 ?auto_9580 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9576 ?auto_9575 ?auto_9574 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9590 - OBJ
      ?auto_9591 - OBJ
      ?auto_9592 - OBJ
      ?auto_9589 - LOCATION
    )
    :vars
    (
      ?auto_9595 - LOCATION
      ?auto_9593 - CITY
      ?auto_9594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9595 ?auto_9593 ) ( IN-CITY ?auto_9589 ?auto_9593 ) ( not ( = ?auto_9589 ?auto_9595 ) ) ( OBJ-AT ?auto_9592 ?auto_9589 ) ( not ( = ?auto_9592 ?auto_9590 ) ) ( OBJ-AT ?auto_9590 ?auto_9595 ) ( not ( = ?auto_9592 ?auto_9591 ) ) ( not ( = ?auto_9590 ?auto_9591 ) ) ( TRUCK-AT ?auto_9594 ?auto_9595 ) ( OBJ-AT ?auto_9591 ?auto_9595 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9592 ?auto_9590 ?auto_9589 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9638 - OBJ
      ?auto_9637 - LOCATION
    )
    :vars
    (
      ?auto_9643 - LOCATION
      ?auto_9640 - CITY
      ?auto_9639 - OBJ
      ?auto_9641 - OBJ
      ?auto_9642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9643 ?auto_9640 ) ( IN-CITY ?auto_9637 ?auto_9640 ) ( not ( = ?auto_9637 ?auto_9643 ) ) ( OBJ-AT ?auto_9639 ?auto_9637 ) ( not ( = ?auto_9639 ?auto_9638 ) ) ( OBJ-AT ?auto_9638 ?auto_9643 ) ( not ( = ?auto_9639 ?auto_9641 ) ) ( not ( = ?auto_9638 ?auto_9641 ) ) ( OBJ-AT ?auto_9641 ?auto_9643 ) ( TRUCK-AT ?auto_9642 ?auto_9637 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9642 ?auto_9637 ?auto_9643 ?auto_9640 )
      ( DELIVER-2PKG ?auto_9639 ?auto_9638 ?auto_9637 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9645 - OBJ
      ?auto_9646 - OBJ
      ?auto_9644 - LOCATION
    )
    :vars
    (
      ?auto_9647 - LOCATION
      ?auto_9650 - CITY
      ?auto_9649 - OBJ
      ?auto_9648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9647 ?auto_9650 ) ( IN-CITY ?auto_9644 ?auto_9650 ) ( not ( = ?auto_9644 ?auto_9647 ) ) ( OBJ-AT ?auto_9645 ?auto_9644 ) ( not ( = ?auto_9645 ?auto_9646 ) ) ( OBJ-AT ?auto_9646 ?auto_9647 ) ( not ( = ?auto_9645 ?auto_9649 ) ) ( not ( = ?auto_9646 ?auto_9649 ) ) ( OBJ-AT ?auto_9649 ?auto_9647 ) ( TRUCK-AT ?auto_9648 ?auto_9644 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9646 ?auto_9644 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9652 - OBJ
      ?auto_9653 - OBJ
      ?auto_9651 - LOCATION
    )
    :vars
    (
      ?auto_9656 - LOCATION
      ?auto_9654 - CITY
      ?auto_9655 - OBJ
      ?auto_9657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9656 ?auto_9654 ) ( IN-CITY ?auto_9651 ?auto_9654 ) ( not ( = ?auto_9651 ?auto_9656 ) ) ( OBJ-AT ?auto_9655 ?auto_9651 ) ( not ( = ?auto_9655 ?auto_9653 ) ) ( OBJ-AT ?auto_9653 ?auto_9656 ) ( not ( = ?auto_9655 ?auto_9652 ) ) ( not ( = ?auto_9653 ?auto_9652 ) ) ( OBJ-AT ?auto_9652 ?auto_9656 ) ( TRUCK-AT ?auto_9657 ?auto_9651 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9655 ?auto_9653 ?auto_9651 ) )
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
      ?auto_9661 - CITY
      ?auto_9663 - OBJ
      ?auto_9664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9662 ?auto_9661 ) ( IN-CITY ?auto_9658 ?auto_9661 ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( OBJ-AT ?auto_9660 ?auto_9658 ) ( not ( = ?auto_9660 ?auto_9659 ) ) ( OBJ-AT ?auto_9659 ?auto_9662 ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) ( OBJ-AT ?auto_9663 ?auto_9662 ) ( TRUCK-AT ?auto_9664 ?auto_9658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9660 ?auto_9659 ?auto_9658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9666 - OBJ
      ?auto_9667 - OBJ
      ?auto_9665 - LOCATION
    )
    :vars
    (
      ?auto_9670 - LOCATION
      ?auto_9668 - CITY
      ?auto_9669 - OBJ
      ?auto_9671 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9670 ?auto_9668 ) ( IN-CITY ?auto_9665 ?auto_9668 ) ( not ( = ?auto_9665 ?auto_9670 ) ) ( OBJ-AT ?auto_9669 ?auto_9665 ) ( not ( = ?auto_9669 ?auto_9666 ) ) ( OBJ-AT ?auto_9666 ?auto_9670 ) ( not ( = ?auto_9669 ?auto_9667 ) ) ( not ( = ?auto_9666 ?auto_9667 ) ) ( OBJ-AT ?auto_9667 ?auto_9670 ) ( TRUCK-AT ?auto_9671 ?auto_9665 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9669 ?auto_9666 ?auto_9665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9681 - OBJ
      ?auto_9682 - OBJ
      ?auto_9683 - OBJ
      ?auto_9680 - LOCATION
    )
    :vars
    (
      ?auto_9685 - LOCATION
      ?auto_9684 - CITY
      ?auto_9686 - OBJ
      ?auto_9687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9685 ?auto_9684 ) ( IN-CITY ?auto_9680 ?auto_9684 ) ( not ( = ?auto_9680 ?auto_9685 ) ) ( OBJ-AT ?auto_9682 ?auto_9680 ) ( not ( = ?auto_9682 ?auto_9683 ) ) ( OBJ-AT ?auto_9683 ?auto_9685 ) ( not ( = ?auto_9682 ?auto_9686 ) ) ( not ( = ?auto_9683 ?auto_9686 ) ) ( OBJ-AT ?auto_9686 ?auto_9685 ) ( TRUCK-AT ?auto_9687 ?auto_9680 ) ( OBJ-AT ?auto_9681 ?auto_9680 ) ( not ( = ?auto_9681 ?auto_9682 ) ) ( not ( = ?auto_9681 ?auto_9683 ) ) ( not ( = ?auto_9681 ?auto_9686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9682 ?auto_9683 ?auto_9680 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9689 - OBJ
      ?auto_9690 - OBJ
      ?auto_9691 - OBJ
      ?auto_9688 - LOCATION
    )
    :vars
    (
      ?auto_9693 - LOCATION
      ?auto_9692 - CITY
      ?auto_9694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9693 ?auto_9692 ) ( IN-CITY ?auto_9688 ?auto_9692 ) ( not ( = ?auto_9688 ?auto_9693 ) ) ( OBJ-AT ?auto_9689 ?auto_9688 ) ( not ( = ?auto_9689 ?auto_9691 ) ) ( OBJ-AT ?auto_9691 ?auto_9693 ) ( not ( = ?auto_9689 ?auto_9690 ) ) ( not ( = ?auto_9691 ?auto_9690 ) ) ( OBJ-AT ?auto_9690 ?auto_9693 ) ( TRUCK-AT ?auto_9694 ?auto_9688 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9689 ?auto_9691 ?auto_9688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9696 - OBJ
      ?auto_9697 - OBJ
      ?auto_9698 - OBJ
      ?auto_9695 - LOCATION
    )
    :vars
    (
      ?auto_9700 - LOCATION
      ?auto_9699 - CITY
      ?auto_9701 - OBJ
      ?auto_9702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9700 ?auto_9699 ) ( IN-CITY ?auto_9695 ?auto_9699 ) ( not ( = ?auto_9695 ?auto_9700 ) ) ( OBJ-AT ?auto_9698 ?auto_9695 ) ( not ( = ?auto_9698 ?auto_9697 ) ) ( OBJ-AT ?auto_9697 ?auto_9700 ) ( not ( = ?auto_9698 ?auto_9701 ) ) ( not ( = ?auto_9697 ?auto_9701 ) ) ( OBJ-AT ?auto_9701 ?auto_9700 ) ( TRUCK-AT ?auto_9702 ?auto_9695 ) ( OBJ-AT ?auto_9696 ?auto_9695 ) ( not ( = ?auto_9696 ?auto_9697 ) ) ( not ( = ?auto_9696 ?auto_9698 ) ) ( not ( = ?auto_9696 ?auto_9701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9698 ?auto_9697 ?auto_9695 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9704 - OBJ
      ?auto_9705 - OBJ
      ?auto_9706 - OBJ
      ?auto_9703 - LOCATION
    )
    :vars
    (
      ?auto_9708 - LOCATION
      ?auto_9707 - CITY
      ?auto_9709 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9708 ?auto_9707 ) ( IN-CITY ?auto_9703 ?auto_9707 ) ( not ( = ?auto_9703 ?auto_9708 ) ) ( OBJ-AT ?auto_9704 ?auto_9703 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( OBJ-AT ?auto_9705 ?auto_9708 ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( OBJ-AT ?auto_9706 ?auto_9708 ) ( TRUCK-AT ?auto_9709 ?auto_9703 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9704 ?auto_9705 ?auto_9703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9719 - OBJ
      ?auto_9720 - OBJ
      ?auto_9721 - OBJ
      ?auto_9718 - LOCATION
    )
    :vars
    (
      ?auto_9723 - LOCATION
      ?auto_9722 - CITY
      ?auto_9724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9723 ?auto_9722 ) ( IN-CITY ?auto_9718 ?auto_9722 ) ( not ( = ?auto_9718 ?auto_9723 ) ) ( OBJ-AT ?auto_9720 ?auto_9718 ) ( not ( = ?auto_9720 ?auto_9721 ) ) ( OBJ-AT ?auto_9721 ?auto_9723 ) ( not ( = ?auto_9720 ?auto_9719 ) ) ( not ( = ?auto_9721 ?auto_9719 ) ) ( OBJ-AT ?auto_9719 ?auto_9723 ) ( TRUCK-AT ?auto_9724 ?auto_9718 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9720 ?auto_9721 ?auto_9718 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9734 - OBJ
      ?auto_9735 - OBJ
      ?auto_9736 - OBJ
      ?auto_9733 - LOCATION
    )
    :vars
    (
      ?auto_9738 - LOCATION
      ?auto_9737 - CITY
      ?auto_9739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9738 ?auto_9737 ) ( IN-CITY ?auto_9733 ?auto_9737 ) ( not ( = ?auto_9733 ?auto_9738 ) ) ( OBJ-AT ?auto_9736 ?auto_9733 ) ( not ( = ?auto_9736 ?auto_9735 ) ) ( OBJ-AT ?auto_9735 ?auto_9738 ) ( not ( = ?auto_9736 ?auto_9734 ) ) ( not ( = ?auto_9735 ?auto_9734 ) ) ( OBJ-AT ?auto_9734 ?auto_9738 ) ( TRUCK-AT ?auto_9739 ?auto_9733 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9736 ?auto_9735 ?auto_9733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9757 - OBJ
      ?auto_9758 - OBJ
      ?auto_9759 - OBJ
      ?auto_9756 - LOCATION
    )
    :vars
    (
      ?auto_9761 - LOCATION
      ?auto_9760 - CITY
      ?auto_9762 - OBJ
      ?auto_9763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9761 ?auto_9760 ) ( IN-CITY ?auto_9756 ?auto_9760 ) ( not ( = ?auto_9756 ?auto_9761 ) ) ( OBJ-AT ?auto_9758 ?auto_9756 ) ( not ( = ?auto_9758 ?auto_9757 ) ) ( OBJ-AT ?auto_9757 ?auto_9761 ) ( not ( = ?auto_9758 ?auto_9762 ) ) ( not ( = ?auto_9757 ?auto_9762 ) ) ( OBJ-AT ?auto_9762 ?auto_9761 ) ( TRUCK-AT ?auto_9763 ?auto_9756 ) ( OBJ-AT ?auto_9759 ?auto_9756 ) ( not ( = ?auto_9757 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9759 ?auto_9762 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9758 ?auto_9757 ?auto_9756 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9765 - OBJ
      ?auto_9766 - OBJ
      ?auto_9767 - OBJ
      ?auto_9764 - LOCATION
    )
    :vars
    (
      ?auto_9769 - LOCATION
      ?auto_9768 - CITY
      ?auto_9770 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9769 ?auto_9768 ) ( IN-CITY ?auto_9764 ?auto_9768 ) ( not ( = ?auto_9764 ?auto_9769 ) ) ( OBJ-AT ?auto_9766 ?auto_9764 ) ( not ( = ?auto_9766 ?auto_9765 ) ) ( OBJ-AT ?auto_9765 ?auto_9769 ) ( not ( = ?auto_9766 ?auto_9767 ) ) ( not ( = ?auto_9765 ?auto_9767 ) ) ( OBJ-AT ?auto_9767 ?auto_9769 ) ( TRUCK-AT ?auto_9770 ?auto_9764 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9766 ?auto_9765 ?auto_9764 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9780 - OBJ
      ?auto_9781 - OBJ
      ?auto_9782 - OBJ
      ?auto_9779 - LOCATION
    )
    :vars
    (
      ?auto_9784 - LOCATION
      ?auto_9783 - CITY
      ?auto_9785 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9784 ?auto_9783 ) ( IN-CITY ?auto_9779 ?auto_9783 ) ( not ( = ?auto_9779 ?auto_9784 ) ) ( OBJ-AT ?auto_9782 ?auto_9779 ) ( not ( = ?auto_9782 ?auto_9780 ) ) ( OBJ-AT ?auto_9780 ?auto_9784 ) ( not ( = ?auto_9782 ?auto_9781 ) ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( OBJ-AT ?auto_9781 ?auto_9784 ) ( TRUCK-AT ?auto_9785 ?auto_9779 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9782 ?auto_9780 ?auto_9779 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9828 - OBJ
      ?auto_9827 - LOCATION
    )
    :vars
    (
      ?auto_9831 - LOCATION
      ?auto_9829 - CITY
      ?auto_9830 - OBJ
      ?auto_9832 - OBJ
      ?auto_9833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9831 ?auto_9829 ) ( IN-CITY ?auto_9827 ?auto_9829 ) ( not ( = ?auto_9827 ?auto_9831 ) ) ( not ( = ?auto_9830 ?auto_9828 ) ) ( OBJ-AT ?auto_9828 ?auto_9831 ) ( not ( = ?auto_9830 ?auto_9832 ) ) ( not ( = ?auto_9828 ?auto_9832 ) ) ( OBJ-AT ?auto_9832 ?auto_9831 ) ( TRUCK-AT ?auto_9833 ?auto_9827 ) ( IN-TRUCK ?auto_9830 ?auto_9833 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9830 ?auto_9827 )
      ( DELIVER-2PKG ?auto_9830 ?auto_9828 ?auto_9827 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9835 - OBJ
      ?auto_9836 - OBJ
      ?auto_9834 - LOCATION
    )
    :vars
    (
      ?auto_9837 - LOCATION
      ?auto_9839 - CITY
      ?auto_9838 - OBJ
      ?auto_9840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9837 ?auto_9839 ) ( IN-CITY ?auto_9834 ?auto_9839 ) ( not ( = ?auto_9834 ?auto_9837 ) ) ( not ( = ?auto_9835 ?auto_9836 ) ) ( OBJ-AT ?auto_9836 ?auto_9837 ) ( not ( = ?auto_9835 ?auto_9838 ) ) ( not ( = ?auto_9836 ?auto_9838 ) ) ( OBJ-AT ?auto_9838 ?auto_9837 ) ( TRUCK-AT ?auto_9840 ?auto_9834 ) ( IN-TRUCK ?auto_9835 ?auto_9840 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9836 ?auto_9834 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9842 - OBJ
      ?auto_9843 - OBJ
      ?auto_9841 - LOCATION
    )
    :vars
    (
      ?auto_9846 - LOCATION
      ?auto_9844 - CITY
      ?auto_9847 - OBJ
      ?auto_9845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9846 ?auto_9844 ) ( IN-CITY ?auto_9841 ?auto_9844 ) ( not ( = ?auto_9841 ?auto_9846 ) ) ( not ( = ?auto_9847 ?auto_9843 ) ) ( OBJ-AT ?auto_9843 ?auto_9846 ) ( not ( = ?auto_9847 ?auto_9842 ) ) ( not ( = ?auto_9843 ?auto_9842 ) ) ( OBJ-AT ?auto_9842 ?auto_9846 ) ( TRUCK-AT ?auto_9845 ?auto_9841 ) ( IN-TRUCK ?auto_9847 ?auto_9845 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9847 ?auto_9843 ?auto_9841 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9849 - OBJ
      ?auto_9850 - OBJ
      ?auto_9848 - LOCATION
    )
    :vars
    (
      ?auto_9854 - LOCATION
      ?auto_9851 - CITY
      ?auto_9853 - OBJ
      ?auto_9852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9854 ?auto_9851 ) ( IN-CITY ?auto_9848 ?auto_9851 ) ( not ( = ?auto_9848 ?auto_9854 ) ) ( not ( = ?auto_9850 ?auto_9849 ) ) ( OBJ-AT ?auto_9849 ?auto_9854 ) ( not ( = ?auto_9850 ?auto_9853 ) ) ( not ( = ?auto_9849 ?auto_9853 ) ) ( OBJ-AT ?auto_9853 ?auto_9854 ) ( TRUCK-AT ?auto_9852 ?auto_9848 ) ( IN-TRUCK ?auto_9850 ?auto_9852 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9850 ?auto_9849 ?auto_9848 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9856 - OBJ
      ?auto_9857 - OBJ
      ?auto_9855 - LOCATION
    )
    :vars
    (
      ?auto_9860 - LOCATION
      ?auto_9858 - CITY
      ?auto_9861 - OBJ
      ?auto_9859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9860 ?auto_9858 ) ( IN-CITY ?auto_9855 ?auto_9858 ) ( not ( = ?auto_9855 ?auto_9860 ) ) ( not ( = ?auto_9861 ?auto_9856 ) ) ( OBJ-AT ?auto_9856 ?auto_9860 ) ( not ( = ?auto_9861 ?auto_9857 ) ) ( not ( = ?auto_9856 ?auto_9857 ) ) ( OBJ-AT ?auto_9857 ?auto_9860 ) ( TRUCK-AT ?auto_9859 ?auto_9855 ) ( IN-TRUCK ?auto_9861 ?auto_9859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9861 ?auto_9856 ?auto_9855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9879 - OBJ
      ?auto_9880 - OBJ
      ?auto_9881 - OBJ
      ?auto_9878 - LOCATION
    )
    :vars
    (
      ?auto_9884 - LOCATION
      ?auto_9882 - CITY
      ?auto_9883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9884 ?auto_9882 ) ( IN-CITY ?auto_9878 ?auto_9882 ) ( not ( = ?auto_9878 ?auto_9884 ) ) ( not ( = ?auto_9879 ?auto_9881 ) ) ( OBJ-AT ?auto_9881 ?auto_9884 ) ( not ( = ?auto_9879 ?auto_9880 ) ) ( not ( = ?auto_9881 ?auto_9880 ) ) ( OBJ-AT ?auto_9880 ?auto_9884 ) ( TRUCK-AT ?auto_9883 ?auto_9878 ) ( IN-TRUCK ?auto_9879 ?auto_9883 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9879 ?auto_9881 ?auto_9878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9894 - OBJ
      ?auto_9895 - OBJ
      ?auto_9896 - OBJ
      ?auto_9893 - LOCATION
    )
    :vars
    (
      ?auto_9899 - LOCATION
      ?auto_9897 - CITY
      ?auto_9898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9899 ?auto_9897 ) ( IN-CITY ?auto_9893 ?auto_9897 ) ( not ( = ?auto_9893 ?auto_9899 ) ) ( not ( = ?auto_9894 ?auto_9895 ) ) ( OBJ-AT ?auto_9895 ?auto_9899 ) ( not ( = ?auto_9894 ?auto_9896 ) ) ( not ( = ?auto_9895 ?auto_9896 ) ) ( OBJ-AT ?auto_9896 ?auto_9899 ) ( TRUCK-AT ?auto_9898 ?auto_9893 ) ( IN-TRUCK ?auto_9894 ?auto_9898 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9894 ?auto_9895 ?auto_9893 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9909 - OBJ
      ?auto_9910 - OBJ
      ?auto_9911 - OBJ
      ?auto_9908 - LOCATION
    )
    :vars
    (
      ?auto_9914 - LOCATION
      ?auto_9912 - CITY
      ?auto_9913 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9914 ?auto_9912 ) ( IN-CITY ?auto_9908 ?auto_9912 ) ( not ( = ?auto_9908 ?auto_9914 ) ) ( not ( = ?auto_9910 ?auto_9911 ) ) ( OBJ-AT ?auto_9911 ?auto_9914 ) ( not ( = ?auto_9910 ?auto_9909 ) ) ( not ( = ?auto_9911 ?auto_9909 ) ) ( OBJ-AT ?auto_9909 ?auto_9914 ) ( TRUCK-AT ?auto_9913 ?auto_9908 ) ( IN-TRUCK ?auto_9910 ?auto_9913 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9910 ?auto_9911 ?auto_9908 ) )
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
      ?auto_9927 - CITY
      ?auto_9928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9929 ?auto_9927 ) ( IN-CITY ?auto_9923 ?auto_9927 ) ( not ( = ?auto_9923 ?auto_9929 ) ) ( not ( = ?auto_9926 ?auto_9925 ) ) ( OBJ-AT ?auto_9925 ?auto_9929 ) ( not ( = ?auto_9926 ?auto_9924 ) ) ( not ( = ?auto_9925 ?auto_9924 ) ) ( OBJ-AT ?auto_9924 ?auto_9929 ) ( TRUCK-AT ?auto_9928 ?auto_9923 ) ( IN-TRUCK ?auto_9926 ?auto_9928 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9926 ?auto_9925 ?auto_9923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9955 - OBJ
      ?auto_9956 - OBJ
      ?auto_9957 - OBJ
      ?auto_9954 - LOCATION
    )
    :vars
    (
      ?auto_9960 - LOCATION
      ?auto_9958 - CITY
      ?auto_9959 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9960 ?auto_9958 ) ( IN-CITY ?auto_9954 ?auto_9958 ) ( not ( = ?auto_9954 ?auto_9960 ) ) ( not ( = ?auto_9956 ?auto_9955 ) ) ( OBJ-AT ?auto_9955 ?auto_9960 ) ( not ( = ?auto_9956 ?auto_9957 ) ) ( not ( = ?auto_9955 ?auto_9957 ) ) ( OBJ-AT ?auto_9957 ?auto_9960 ) ( TRUCK-AT ?auto_9959 ?auto_9954 ) ( IN-TRUCK ?auto_9956 ?auto_9959 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9956 ?auto_9955 ?auto_9954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9970 - OBJ
      ?auto_9971 - OBJ
      ?auto_9972 - OBJ
      ?auto_9969 - LOCATION
    )
    :vars
    (
      ?auto_9975 - LOCATION
      ?auto_9973 - CITY
      ?auto_9974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9975 ?auto_9973 ) ( IN-CITY ?auto_9969 ?auto_9973 ) ( not ( = ?auto_9969 ?auto_9975 ) ) ( not ( = ?auto_9972 ?auto_9970 ) ) ( OBJ-AT ?auto_9970 ?auto_9975 ) ( not ( = ?auto_9972 ?auto_9971 ) ) ( not ( = ?auto_9970 ?auto_9971 ) ) ( OBJ-AT ?auto_9971 ?auto_9975 ) ( TRUCK-AT ?auto_9974 ?auto_9969 ) ( IN-TRUCK ?auto_9972 ?auto_9974 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9972 ?auto_9970 ?auto_9969 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10018 - OBJ
      ?auto_10017 - LOCATION
    )
    :vars
    (
      ?auto_10022 - LOCATION
      ?auto_10019 - CITY
      ?auto_10023 - OBJ
      ?auto_10021 - OBJ
      ?auto_10020 - TRUCK
      ?auto_10024 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10022 ?auto_10019 ) ( IN-CITY ?auto_10017 ?auto_10019 ) ( not ( = ?auto_10017 ?auto_10022 ) ) ( not ( = ?auto_10023 ?auto_10018 ) ) ( OBJ-AT ?auto_10018 ?auto_10022 ) ( not ( = ?auto_10023 ?auto_10021 ) ) ( not ( = ?auto_10018 ?auto_10021 ) ) ( OBJ-AT ?auto_10021 ?auto_10022 ) ( IN-TRUCK ?auto_10023 ?auto_10020 ) ( TRUCK-AT ?auto_10020 ?auto_10024 ) ( IN-CITY ?auto_10024 ?auto_10019 ) ( not ( = ?auto_10017 ?auto_10024 ) ) ( not ( = ?auto_10022 ?auto_10024 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10020 ?auto_10024 ?auto_10017 ?auto_10019 )
      ( DELIVER-2PKG ?auto_10023 ?auto_10018 ?auto_10017 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10026 - OBJ
      ?auto_10027 - OBJ
      ?auto_10025 - LOCATION
    )
    :vars
    (
      ?auto_10032 - LOCATION
      ?auto_10030 - CITY
      ?auto_10028 - OBJ
      ?auto_10029 - TRUCK
      ?auto_10031 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10032 ?auto_10030 ) ( IN-CITY ?auto_10025 ?auto_10030 ) ( not ( = ?auto_10025 ?auto_10032 ) ) ( not ( = ?auto_10026 ?auto_10027 ) ) ( OBJ-AT ?auto_10027 ?auto_10032 ) ( not ( = ?auto_10026 ?auto_10028 ) ) ( not ( = ?auto_10027 ?auto_10028 ) ) ( OBJ-AT ?auto_10028 ?auto_10032 ) ( IN-TRUCK ?auto_10026 ?auto_10029 ) ( TRUCK-AT ?auto_10029 ?auto_10031 ) ( IN-CITY ?auto_10031 ?auto_10030 ) ( not ( = ?auto_10025 ?auto_10031 ) ) ( not ( = ?auto_10032 ?auto_10031 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10027 ?auto_10025 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10034 - OBJ
      ?auto_10035 - OBJ
      ?auto_10033 - LOCATION
    )
    :vars
    (
      ?auto_10036 - LOCATION
      ?auto_10037 - CITY
      ?auto_10040 - OBJ
      ?auto_10038 - TRUCK
      ?auto_10039 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10036 ?auto_10037 ) ( IN-CITY ?auto_10033 ?auto_10037 ) ( not ( = ?auto_10033 ?auto_10036 ) ) ( not ( = ?auto_10040 ?auto_10035 ) ) ( OBJ-AT ?auto_10035 ?auto_10036 ) ( not ( = ?auto_10040 ?auto_10034 ) ) ( not ( = ?auto_10035 ?auto_10034 ) ) ( OBJ-AT ?auto_10034 ?auto_10036 ) ( IN-TRUCK ?auto_10040 ?auto_10038 ) ( TRUCK-AT ?auto_10038 ?auto_10039 ) ( IN-CITY ?auto_10039 ?auto_10037 ) ( not ( = ?auto_10033 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10040 ?auto_10035 ?auto_10033 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10042 - OBJ
      ?auto_10043 - OBJ
      ?auto_10041 - LOCATION
    )
    :vars
    (
      ?auto_10044 - LOCATION
      ?auto_10045 - CITY
      ?auto_10048 - OBJ
      ?auto_10046 - TRUCK
      ?auto_10047 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10044 ?auto_10045 ) ( IN-CITY ?auto_10041 ?auto_10045 ) ( not ( = ?auto_10041 ?auto_10044 ) ) ( not ( = ?auto_10043 ?auto_10042 ) ) ( OBJ-AT ?auto_10042 ?auto_10044 ) ( not ( = ?auto_10043 ?auto_10048 ) ) ( not ( = ?auto_10042 ?auto_10048 ) ) ( OBJ-AT ?auto_10048 ?auto_10044 ) ( IN-TRUCK ?auto_10043 ?auto_10046 ) ( TRUCK-AT ?auto_10046 ?auto_10047 ) ( IN-CITY ?auto_10047 ?auto_10045 ) ( not ( = ?auto_10041 ?auto_10047 ) ) ( not ( = ?auto_10044 ?auto_10047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10043 ?auto_10042 ?auto_10041 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10050 - OBJ
      ?auto_10051 - OBJ
      ?auto_10049 - LOCATION
    )
    :vars
    (
      ?auto_10052 - LOCATION
      ?auto_10053 - CITY
      ?auto_10056 - OBJ
      ?auto_10054 - TRUCK
      ?auto_10055 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10052 ?auto_10053 ) ( IN-CITY ?auto_10049 ?auto_10053 ) ( not ( = ?auto_10049 ?auto_10052 ) ) ( not ( = ?auto_10056 ?auto_10050 ) ) ( OBJ-AT ?auto_10050 ?auto_10052 ) ( not ( = ?auto_10056 ?auto_10051 ) ) ( not ( = ?auto_10050 ?auto_10051 ) ) ( OBJ-AT ?auto_10051 ?auto_10052 ) ( IN-TRUCK ?auto_10056 ?auto_10054 ) ( TRUCK-AT ?auto_10054 ?auto_10055 ) ( IN-CITY ?auto_10055 ?auto_10053 ) ( not ( = ?auto_10049 ?auto_10055 ) ) ( not ( = ?auto_10052 ?auto_10055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10056 ?auto_10050 ?auto_10049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10076 - OBJ
      ?auto_10077 - OBJ
      ?auto_10078 - OBJ
      ?auto_10075 - LOCATION
    )
    :vars
    (
      ?auto_10079 - LOCATION
      ?auto_10080 - CITY
      ?auto_10081 - TRUCK
      ?auto_10082 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10079 ?auto_10080 ) ( IN-CITY ?auto_10075 ?auto_10080 ) ( not ( = ?auto_10075 ?auto_10079 ) ) ( not ( = ?auto_10076 ?auto_10078 ) ) ( OBJ-AT ?auto_10078 ?auto_10079 ) ( not ( = ?auto_10076 ?auto_10077 ) ) ( not ( = ?auto_10078 ?auto_10077 ) ) ( OBJ-AT ?auto_10077 ?auto_10079 ) ( IN-TRUCK ?auto_10076 ?auto_10081 ) ( TRUCK-AT ?auto_10081 ?auto_10082 ) ( IN-CITY ?auto_10082 ?auto_10080 ) ( not ( = ?auto_10075 ?auto_10082 ) ) ( not ( = ?auto_10079 ?auto_10082 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10076 ?auto_10078 ?auto_10075 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10093 - OBJ
      ?auto_10094 - OBJ
      ?auto_10095 - OBJ
      ?auto_10092 - LOCATION
    )
    :vars
    (
      ?auto_10096 - LOCATION
      ?auto_10097 - CITY
      ?auto_10098 - TRUCK
      ?auto_10099 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10096 ?auto_10097 ) ( IN-CITY ?auto_10092 ?auto_10097 ) ( not ( = ?auto_10092 ?auto_10096 ) ) ( not ( = ?auto_10093 ?auto_10094 ) ) ( OBJ-AT ?auto_10094 ?auto_10096 ) ( not ( = ?auto_10093 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( OBJ-AT ?auto_10095 ?auto_10096 ) ( IN-TRUCK ?auto_10093 ?auto_10098 ) ( TRUCK-AT ?auto_10098 ?auto_10099 ) ( IN-CITY ?auto_10099 ?auto_10097 ) ( not ( = ?auto_10092 ?auto_10099 ) ) ( not ( = ?auto_10096 ?auto_10099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10093 ?auto_10094 ?auto_10092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10110 - OBJ
      ?auto_10111 - OBJ
      ?auto_10112 - OBJ
      ?auto_10109 - LOCATION
    )
    :vars
    (
      ?auto_10113 - LOCATION
      ?auto_10114 - CITY
      ?auto_10115 - TRUCK
      ?auto_10116 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10113 ?auto_10114 ) ( IN-CITY ?auto_10109 ?auto_10114 ) ( not ( = ?auto_10109 ?auto_10113 ) ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( OBJ-AT ?auto_10112 ?auto_10113 ) ( not ( = ?auto_10111 ?auto_10110 ) ) ( not ( = ?auto_10112 ?auto_10110 ) ) ( OBJ-AT ?auto_10110 ?auto_10113 ) ( IN-TRUCK ?auto_10111 ?auto_10115 ) ( TRUCK-AT ?auto_10115 ?auto_10116 ) ( IN-CITY ?auto_10116 ?auto_10114 ) ( not ( = ?auto_10109 ?auto_10116 ) ) ( not ( = ?auto_10113 ?auto_10116 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10111 ?auto_10112 ?auto_10109 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10127 - OBJ
      ?auto_10128 - OBJ
      ?auto_10129 - OBJ
      ?auto_10126 - LOCATION
    )
    :vars
    (
      ?auto_10130 - LOCATION
      ?auto_10131 - CITY
      ?auto_10132 - TRUCK
      ?auto_10133 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10130 ?auto_10131 ) ( IN-CITY ?auto_10126 ?auto_10131 ) ( not ( = ?auto_10126 ?auto_10130 ) ) ( not ( = ?auto_10129 ?auto_10128 ) ) ( OBJ-AT ?auto_10128 ?auto_10130 ) ( not ( = ?auto_10129 ?auto_10127 ) ) ( not ( = ?auto_10128 ?auto_10127 ) ) ( OBJ-AT ?auto_10127 ?auto_10130 ) ( IN-TRUCK ?auto_10129 ?auto_10132 ) ( TRUCK-AT ?auto_10132 ?auto_10133 ) ( IN-CITY ?auto_10133 ?auto_10131 ) ( not ( = ?auto_10126 ?auto_10133 ) ) ( not ( = ?auto_10130 ?auto_10133 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10129 ?auto_10128 ?auto_10126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10162 - OBJ
      ?auto_10163 - OBJ
      ?auto_10164 - OBJ
      ?auto_10161 - LOCATION
    )
    :vars
    (
      ?auto_10165 - LOCATION
      ?auto_10166 - CITY
      ?auto_10167 - TRUCK
      ?auto_10168 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10165 ?auto_10166 ) ( IN-CITY ?auto_10161 ?auto_10166 ) ( not ( = ?auto_10161 ?auto_10165 ) ) ( not ( = ?auto_10163 ?auto_10162 ) ) ( OBJ-AT ?auto_10162 ?auto_10165 ) ( not ( = ?auto_10163 ?auto_10164 ) ) ( not ( = ?auto_10162 ?auto_10164 ) ) ( OBJ-AT ?auto_10164 ?auto_10165 ) ( IN-TRUCK ?auto_10163 ?auto_10167 ) ( TRUCK-AT ?auto_10167 ?auto_10168 ) ( IN-CITY ?auto_10168 ?auto_10166 ) ( not ( = ?auto_10161 ?auto_10168 ) ) ( not ( = ?auto_10165 ?auto_10168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10163 ?auto_10162 ?auto_10161 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10179 - OBJ
      ?auto_10180 - OBJ
      ?auto_10181 - OBJ
      ?auto_10178 - LOCATION
    )
    :vars
    (
      ?auto_10182 - LOCATION
      ?auto_10183 - CITY
      ?auto_10184 - TRUCK
      ?auto_10185 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10182 ?auto_10183 ) ( IN-CITY ?auto_10178 ?auto_10183 ) ( not ( = ?auto_10178 ?auto_10182 ) ) ( not ( = ?auto_10181 ?auto_10179 ) ) ( OBJ-AT ?auto_10179 ?auto_10182 ) ( not ( = ?auto_10181 ?auto_10180 ) ) ( not ( = ?auto_10179 ?auto_10180 ) ) ( OBJ-AT ?auto_10180 ?auto_10182 ) ( IN-TRUCK ?auto_10181 ?auto_10184 ) ( TRUCK-AT ?auto_10184 ?auto_10185 ) ( IN-CITY ?auto_10185 ?auto_10183 ) ( not ( = ?auto_10178 ?auto_10185 ) ) ( not ( = ?auto_10182 ?auto_10185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10181 ?auto_10179 ?auto_10178 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10233 - OBJ
      ?auto_10232 - LOCATION
    )
    :vars
    (
      ?auto_10234 - LOCATION
      ?auto_10235 - CITY
      ?auto_10239 - OBJ
      ?auto_10238 - OBJ
      ?auto_10236 - TRUCK
      ?auto_10237 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10234 ?auto_10235 ) ( IN-CITY ?auto_10232 ?auto_10235 ) ( not ( = ?auto_10232 ?auto_10234 ) ) ( not ( = ?auto_10239 ?auto_10233 ) ) ( OBJ-AT ?auto_10233 ?auto_10234 ) ( not ( = ?auto_10239 ?auto_10238 ) ) ( not ( = ?auto_10233 ?auto_10238 ) ) ( OBJ-AT ?auto_10238 ?auto_10234 ) ( TRUCK-AT ?auto_10236 ?auto_10237 ) ( IN-CITY ?auto_10237 ?auto_10235 ) ( not ( = ?auto_10232 ?auto_10237 ) ) ( not ( = ?auto_10234 ?auto_10237 ) ) ( OBJ-AT ?auto_10239 ?auto_10237 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10239 ?auto_10236 ?auto_10237 )
      ( DELIVER-2PKG ?auto_10239 ?auto_10233 ?auto_10232 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10241 - OBJ
      ?auto_10242 - OBJ
      ?auto_10240 - LOCATION
    )
    :vars
    (
      ?auto_10245 - LOCATION
      ?auto_10243 - CITY
      ?auto_10246 - OBJ
      ?auto_10244 - TRUCK
      ?auto_10247 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10245 ?auto_10243 ) ( IN-CITY ?auto_10240 ?auto_10243 ) ( not ( = ?auto_10240 ?auto_10245 ) ) ( not ( = ?auto_10241 ?auto_10242 ) ) ( OBJ-AT ?auto_10242 ?auto_10245 ) ( not ( = ?auto_10241 ?auto_10246 ) ) ( not ( = ?auto_10242 ?auto_10246 ) ) ( OBJ-AT ?auto_10246 ?auto_10245 ) ( TRUCK-AT ?auto_10244 ?auto_10247 ) ( IN-CITY ?auto_10247 ?auto_10243 ) ( not ( = ?auto_10240 ?auto_10247 ) ) ( not ( = ?auto_10245 ?auto_10247 ) ) ( OBJ-AT ?auto_10241 ?auto_10247 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10242 ?auto_10240 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10249 - OBJ
      ?auto_10250 - OBJ
      ?auto_10248 - LOCATION
    )
    :vars
    (
      ?auto_10254 - LOCATION
      ?auto_10252 - CITY
      ?auto_10253 - OBJ
      ?auto_10255 - TRUCK
      ?auto_10251 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10254 ?auto_10252 ) ( IN-CITY ?auto_10248 ?auto_10252 ) ( not ( = ?auto_10248 ?auto_10254 ) ) ( not ( = ?auto_10253 ?auto_10250 ) ) ( OBJ-AT ?auto_10250 ?auto_10254 ) ( not ( = ?auto_10253 ?auto_10249 ) ) ( not ( = ?auto_10250 ?auto_10249 ) ) ( OBJ-AT ?auto_10249 ?auto_10254 ) ( TRUCK-AT ?auto_10255 ?auto_10251 ) ( IN-CITY ?auto_10251 ?auto_10252 ) ( not ( = ?auto_10248 ?auto_10251 ) ) ( not ( = ?auto_10254 ?auto_10251 ) ) ( OBJ-AT ?auto_10253 ?auto_10251 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10253 ?auto_10250 ?auto_10248 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10257 - OBJ
      ?auto_10258 - OBJ
      ?auto_10256 - LOCATION
    )
    :vars
    (
      ?auto_10261 - LOCATION
      ?auto_10260 - CITY
      ?auto_10262 - OBJ
      ?auto_10263 - TRUCK
      ?auto_10259 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10261 ?auto_10260 ) ( IN-CITY ?auto_10256 ?auto_10260 ) ( not ( = ?auto_10256 ?auto_10261 ) ) ( not ( = ?auto_10258 ?auto_10257 ) ) ( OBJ-AT ?auto_10257 ?auto_10261 ) ( not ( = ?auto_10258 ?auto_10262 ) ) ( not ( = ?auto_10257 ?auto_10262 ) ) ( OBJ-AT ?auto_10262 ?auto_10261 ) ( TRUCK-AT ?auto_10263 ?auto_10259 ) ( IN-CITY ?auto_10259 ?auto_10260 ) ( not ( = ?auto_10256 ?auto_10259 ) ) ( not ( = ?auto_10261 ?auto_10259 ) ) ( OBJ-AT ?auto_10258 ?auto_10259 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10258 ?auto_10257 ?auto_10256 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10265 - OBJ
      ?auto_10266 - OBJ
      ?auto_10264 - LOCATION
    )
    :vars
    (
      ?auto_10270 - LOCATION
      ?auto_10268 - CITY
      ?auto_10269 - OBJ
      ?auto_10271 - TRUCK
      ?auto_10267 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10270 ?auto_10268 ) ( IN-CITY ?auto_10264 ?auto_10268 ) ( not ( = ?auto_10264 ?auto_10270 ) ) ( not ( = ?auto_10269 ?auto_10265 ) ) ( OBJ-AT ?auto_10265 ?auto_10270 ) ( not ( = ?auto_10269 ?auto_10266 ) ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( OBJ-AT ?auto_10266 ?auto_10270 ) ( TRUCK-AT ?auto_10271 ?auto_10267 ) ( IN-CITY ?auto_10267 ?auto_10268 ) ( not ( = ?auto_10264 ?auto_10267 ) ) ( not ( = ?auto_10270 ?auto_10267 ) ) ( OBJ-AT ?auto_10269 ?auto_10267 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10269 ?auto_10265 ?auto_10264 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10291 - OBJ
      ?auto_10292 - OBJ
      ?auto_10293 - OBJ
      ?auto_10290 - LOCATION
    )
    :vars
    (
      ?auto_10296 - LOCATION
      ?auto_10295 - CITY
      ?auto_10297 - TRUCK
      ?auto_10294 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10296 ?auto_10295 ) ( IN-CITY ?auto_10290 ?auto_10295 ) ( not ( = ?auto_10290 ?auto_10296 ) ) ( not ( = ?auto_10291 ?auto_10293 ) ) ( OBJ-AT ?auto_10293 ?auto_10296 ) ( not ( = ?auto_10291 ?auto_10292 ) ) ( not ( = ?auto_10293 ?auto_10292 ) ) ( OBJ-AT ?auto_10292 ?auto_10296 ) ( TRUCK-AT ?auto_10297 ?auto_10294 ) ( IN-CITY ?auto_10294 ?auto_10295 ) ( not ( = ?auto_10290 ?auto_10294 ) ) ( not ( = ?auto_10296 ?auto_10294 ) ) ( OBJ-AT ?auto_10291 ?auto_10294 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10291 ?auto_10293 ?auto_10290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10308 - OBJ
      ?auto_10309 - OBJ
      ?auto_10310 - OBJ
      ?auto_10307 - LOCATION
    )
    :vars
    (
      ?auto_10313 - LOCATION
      ?auto_10312 - CITY
      ?auto_10314 - TRUCK
      ?auto_10311 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10313 ?auto_10312 ) ( IN-CITY ?auto_10307 ?auto_10312 ) ( not ( = ?auto_10307 ?auto_10313 ) ) ( not ( = ?auto_10308 ?auto_10309 ) ) ( OBJ-AT ?auto_10309 ?auto_10313 ) ( not ( = ?auto_10308 ?auto_10310 ) ) ( not ( = ?auto_10309 ?auto_10310 ) ) ( OBJ-AT ?auto_10310 ?auto_10313 ) ( TRUCK-AT ?auto_10314 ?auto_10311 ) ( IN-CITY ?auto_10311 ?auto_10312 ) ( not ( = ?auto_10307 ?auto_10311 ) ) ( not ( = ?auto_10313 ?auto_10311 ) ) ( OBJ-AT ?auto_10308 ?auto_10311 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10308 ?auto_10309 ?auto_10307 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10325 - OBJ
      ?auto_10326 - OBJ
      ?auto_10327 - OBJ
      ?auto_10324 - LOCATION
    )
    :vars
    (
      ?auto_10330 - LOCATION
      ?auto_10329 - CITY
      ?auto_10331 - TRUCK
      ?auto_10328 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10330 ?auto_10329 ) ( IN-CITY ?auto_10324 ?auto_10329 ) ( not ( = ?auto_10324 ?auto_10330 ) ) ( not ( = ?auto_10326 ?auto_10327 ) ) ( OBJ-AT ?auto_10327 ?auto_10330 ) ( not ( = ?auto_10326 ?auto_10325 ) ) ( not ( = ?auto_10327 ?auto_10325 ) ) ( OBJ-AT ?auto_10325 ?auto_10330 ) ( TRUCK-AT ?auto_10331 ?auto_10328 ) ( IN-CITY ?auto_10328 ?auto_10329 ) ( not ( = ?auto_10324 ?auto_10328 ) ) ( not ( = ?auto_10330 ?auto_10328 ) ) ( OBJ-AT ?auto_10326 ?auto_10328 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10326 ?auto_10327 ?auto_10324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10342 - OBJ
      ?auto_10343 - OBJ
      ?auto_10344 - OBJ
      ?auto_10341 - LOCATION
    )
    :vars
    (
      ?auto_10347 - LOCATION
      ?auto_10346 - CITY
      ?auto_10348 - TRUCK
      ?auto_10345 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10347 ?auto_10346 ) ( IN-CITY ?auto_10341 ?auto_10346 ) ( not ( = ?auto_10341 ?auto_10347 ) ) ( not ( = ?auto_10344 ?auto_10343 ) ) ( OBJ-AT ?auto_10343 ?auto_10347 ) ( not ( = ?auto_10344 ?auto_10342 ) ) ( not ( = ?auto_10343 ?auto_10342 ) ) ( OBJ-AT ?auto_10342 ?auto_10347 ) ( TRUCK-AT ?auto_10348 ?auto_10345 ) ( IN-CITY ?auto_10345 ?auto_10346 ) ( not ( = ?auto_10341 ?auto_10345 ) ) ( not ( = ?auto_10347 ?auto_10345 ) ) ( OBJ-AT ?auto_10344 ?auto_10345 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10344 ?auto_10343 ?auto_10341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10377 - OBJ
      ?auto_10378 - OBJ
      ?auto_10379 - OBJ
      ?auto_10376 - LOCATION
    )
    :vars
    (
      ?auto_10382 - LOCATION
      ?auto_10381 - CITY
      ?auto_10383 - TRUCK
      ?auto_10380 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10382 ?auto_10381 ) ( IN-CITY ?auto_10376 ?auto_10381 ) ( not ( = ?auto_10376 ?auto_10382 ) ) ( not ( = ?auto_10378 ?auto_10377 ) ) ( OBJ-AT ?auto_10377 ?auto_10382 ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( not ( = ?auto_10377 ?auto_10379 ) ) ( OBJ-AT ?auto_10379 ?auto_10382 ) ( TRUCK-AT ?auto_10383 ?auto_10380 ) ( IN-CITY ?auto_10380 ?auto_10381 ) ( not ( = ?auto_10376 ?auto_10380 ) ) ( not ( = ?auto_10382 ?auto_10380 ) ) ( OBJ-AT ?auto_10378 ?auto_10380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10378 ?auto_10377 ?auto_10376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10394 - OBJ
      ?auto_10395 - OBJ
      ?auto_10396 - OBJ
      ?auto_10393 - LOCATION
    )
    :vars
    (
      ?auto_10399 - LOCATION
      ?auto_10398 - CITY
      ?auto_10400 - TRUCK
      ?auto_10397 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10399 ?auto_10398 ) ( IN-CITY ?auto_10393 ?auto_10398 ) ( not ( = ?auto_10393 ?auto_10399 ) ) ( not ( = ?auto_10396 ?auto_10394 ) ) ( OBJ-AT ?auto_10394 ?auto_10399 ) ( not ( = ?auto_10396 ?auto_10395 ) ) ( not ( = ?auto_10394 ?auto_10395 ) ) ( OBJ-AT ?auto_10395 ?auto_10399 ) ( TRUCK-AT ?auto_10400 ?auto_10397 ) ( IN-CITY ?auto_10397 ?auto_10398 ) ( not ( = ?auto_10393 ?auto_10397 ) ) ( not ( = ?auto_10399 ?auto_10397 ) ) ( OBJ-AT ?auto_10396 ?auto_10397 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10396 ?auto_10394 ?auto_10393 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10448 - OBJ
      ?auto_10447 - LOCATION
    )
    :vars
    (
      ?auto_10452 - LOCATION
      ?auto_10450 - CITY
      ?auto_10451 - OBJ
      ?auto_10453 - OBJ
      ?auto_10449 - LOCATION
      ?auto_10454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10452 ?auto_10450 ) ( IN-CITY ?auto_10447 ?auto_10450 ) ( not ( = ?auto_10447 ?auto_10452 ) ) ( not ( = ?auto_10451 ?auto_10448 ) ) ( OBJ-AT ?auto_10448 ?auto_10452 ) ( not ( = ?auto_10451 ?auto_10453 ) ) ( not ( = ?auto_10448 ?auto_10453 ) ) ( OBJ-AT ?auto_10453 ?auto_10452 ) ( IN-CITY ?auto_10449 ?auto_10450 ) ( not ( = ?auto_10447 ?auto_10449 ) ) ( not ( = ?auto_10452 ?auto_10449 ) ) ( OBJ-AT ?auto_10451 ?auto_10449 ) ( TRUCK-AT ?auto_10454 ?auto_10447 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10454 ?auto_10447 ?auto_10449 ?auto_10450 )
      ( DELIVER-2PKG ?auto_10451 ?auto_10448 ?auto_10447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10456 - OBJ
      ?auto_10457 - OBJ
      ?auto_10455 - LOCATION
    )
    :vars
    (
      ?auto_10461 - LOCATION
      ?auto_10462 - CITY
      ?auto_10460 - OBJ
      ?auto_10458 - LOCATION
      ?auto_10459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10461 ?auto_10462 ) ( IN-CITY ?auto_10455 ?auto_10462 ) ( not ( = ?auto_10455 ?auto_10461 ) ) ( not ( = ?auto_10456 ?auto_10457 ) ) ( OBJ-AT ?auto_10457 ?auto_10461 ) ( not ( = ?auto_10456 ?auto_10460 ) ) ( not ( = ?auto_10457 ?auto_10460 ) ) ( OBJ-AT ?auto_10460 ?auto_10461 ) ( IN-CITY ?auto_10458 ?auto_10462 ) ( not ( = ?auto_10455 ?auto_10458 ) ) ( not ( = ?auto_10461 ?auto_10458 ) ) ( OBJ-AT ?auto_10456 ?auto_10458 ) ( TRUCK-AT ?auto_10459 ?auto_10455 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10457 ?auto_10455 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10464 - OBJ
      ?auto_10465 - OBJ
      ?auto_10463 - LOCATION
    )
    :vars
    (
      ?auto_10468 - LOCATION
      ?auto_10467 - CITY
      ?auto_10470 - OBJ
      ?auto_10466 - LOCATION
      ?auto_10469 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10468 ?auto_10467 ) ( IN-CITY ?auto_10463 ?auto_10467 ) ( not ( = ?auto_10463 ?auto_10468 ) ) ( not ( = ?auto_10470 ?auto_10465 ) ) ( OBJ-AT ?auto_10465 ?auto_10468 ) ( not ( = ?auto_10470 ?auto_10464 ) ) ( not ( = ?auto_10465 ?auto_10464 ) ) ( OBJ-AT ?auto_10464 ?auto_10468 ) ( IN-CITY ?auto_10466 ?auto_10467 ) ( not ( = ?auto_10463 ?auto_10466 ) ) ( not ( = ?auto_10468 ?auto_10466 ) ) ( OBJ-AT ?auto_10470 ?auto_10466 ) ( TRUCK-AT ?auto_10469 ?auto_10463 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10470 ?auto_10465 ?auto_10463 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10472 - OBJ
      ?auto_10473 - OBJ
      ?auto_10471 - LOCATION
    )
    :vars
    (
      ?auto_10477 - LOCATION
      ?auto_10476 - CITY
      ?auto_10474 - OBJ
      ?auto_10475 - LOCATION
      ?auto_10478 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10477 ?auto_10476 ) ( IN-CITY ?auto_10471 ?auto_10476 ) ( not ( = ?auto_10471 ?auto_10477 ) ) ( not ( = ?auto_10473 ?auto_10472 ) ) ( OBJ-AT ?auto_10472 ?auto_10477 ) ( not ( = ?auto_10473 ?auto_10474 ) ) ( not ( = ?auto_10472 ?auto_10474 ) ) ( OBJ-AT ?auto_10474 ?auto_10477 ) ( IN-CITY ?auto_10475 ?auto_10476 ) ( not ( = ?auto_10471 ?auto_10475 ) ) ( not ( = ?auto_10477 ?auto_10475 ) ) ( OBJ-AT ?auto_10473 ?auto_10475 ) ( TRUCK-AT ?auto_10478 ?auto_10471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10473 ?auto_10472 ?auto_10471 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10480 - OBJ
      ?auto_10481 - OBJ
      ?auto_10479 - LOCATION
    )
    :vars
    (
      ?auto_10484 - LOCATION
      ?auto_10483 - CITY
      ?auto_10486 - OBJ
      ?auto_10482 - LOCATION
      ?auto_10485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10484 ?auto_10483 ) ( IN-CITY ?auto_10479 ?auto_10483 ) ( not ( = ?auto_10479 ?auto_10484 ) ) ( not ( = ?auto_10486 ?auto_10480 ) ) ( OBJ-AT ?auto_10480 ?auto_10484 ) ( not ( = ?auto_10486 ?auto_10481 ) ) ( not ( = ?auto_10480 ?auto_10481 ) ) ( OBJ-AT ?auto_10481 ?auto_10484 ) ( IN-CITY ?auto_10482 ?auto_10483 ) ( not ( = ?auto_10479 ?auto_10482 ) ) ( not ( = ?auto_10484 ?auto_10482 ) ) ( OBJ-AT ?auto_10486 ?auto_10482 ) ( TRUCK-AT ?auto_10485 ?auto_10479 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10486 ?auto_10480 ?auto_10479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10506 - OBJ
      ?auto_10507 - OBJ
      ?auto_10508 - OBJ
      ?auto_10505 - LOCATION
    )
    :vars
    (
      ?auto_10511 - LOCATION
      ?auto_10510 - CITY
      ?auto_10509 - LOCATION
      ?auto_10512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10511 ?auto_10510 ) ( IN-CITY ?auto_10505 ?auto_10510 ) ( not ( = ?auto_10505 ?auto_10511 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( OBJ-AT ?auto_10508 ?auto_10511 ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10508 ?auto_10507 ) ) ( OBJ-AT ?auto_10507 ?auto_10511 ) ( IN-CITY ?auto_10509 ?auto_10510 ) ( not ( = ?auto_10505 ?auto_10509 ) ) ( not ( = ?auto_10511 ?auto_10509 ) ) ( OBJ-AT ?auto_10506 ?auto_10509 ) ( TRUCK-AT ?auto_10512 ?auto_10505 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10506 ?auto_10508 ?auto_10505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10523 - OBJ
      ?auto_10524 - OBJ
      ?auto_10525 - OBJ
      ?auto_10522 - LOCATION
    )
    :vars
    (
      ?auto_10528 - LOCATION
      ?auto_10527 - CITY
      ?auto_10526 - LOCATION
      ?auto_10529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10528 ?auto_10527 ) ( IN-CITY ?auto_10522 ?auto_10527 ) ( not ( = ?auto_10522 ?auto_10528 ) ) ( not ( = ?auto_10523 ?auto_10524 ) ) ( OBJ-AT ?auto_10524 ?auto_10528 ) ( not ( = ?auto_10523 ?auto_10525 ) ) ( not ( = ?auto_10524 ?auto_10525 ) ) ( OBJ-AT ?auto_10525 ?auto_10528 ) ( IN-CITY ?auto_10526 ?auto_10527 ) ( not ( = ?auto_10522 ?auto_10526 ) ) ( not ( = ?auto_10528 ?auto_10526 ) ) ( OBJ-AT ?auto_10523 ?auto_10526 ) ( TRUCK-AT ?auto_10529 ?auto_10522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10523 ?auto_10524 ?auto_10522 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10540 - OBJ
      ?auto_10541 - OBJ
      ?auto_10542 - OBJ
      ?auto_10539 - LOCATION
    )
    :vars
    (
      ?auto_10545 - LOCATION
      ?auto_10544 - CITY
      ?auto_10543 - LOCATION
      ?auto_10546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10545 ?auto_10544 ) ( IN-CITY ?auto_10539 ?auto_10544 ) ( not ( = ?auto_10539 ?auto_10545 ) ) ( not ( = ?auto_10541 ?auto_10542 ) ) ( OBJ-AT ?auto_10542 ?auto_10545 ) ( not ( = ?auto_10541 ?auto_10540 ) ) ( not ( = ?auto_10542 ?auto_10540 ) ) ( OBJ-AT ?auto_10540 ?auto_10545 ) ( IN-CITY ?auto_10543 ?auto_10544 ) ( not ( = ?auto_10539 ?auto_10543 ) ) ( not ( = ?auto_10545 ?auto_10543 ) ) ( OBJ-AT ?auto_10541 ?auto_10543 ) ( TRUCK-AT ?auto_10546 ?auto_10539 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10541 ?auto_10542 ?auto_10539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10557 - OBJ
      ?auto_10558 - OBJ
      ?auto_10559 - OBJ
      ?auto_10556 - LOCATION
    )
    :vars
    (
      ?auto_10562 - LOCATION
      ?auto_10561 - CITY
      ?auto_10560 - LOCATION
      ?auto_10563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10562 ?auto_10561 ) ( IN-CITY ?auto_10556 ?auto_10561 ) ( not ( = ?auto_10556 ?auto_10562 ) ) ( not ( = ?auto_10559 ?auto_10558 ) ) ( OBJ-AT ?auto_10558 ?auto_10562 ) ( not ( = ?auto_10559 ?auto_10557 ) ) ( not ( = ?auto_10558 ?auto_10557 ) ) ( OBJ-AT ?auto_10557 ?auto_10562 ) ( IN-CITY ?auto_10560 ?auto_10561 ) ( not ( = ?auto_10556 ?auto_10560 ) ) ( not ( = ?auto_10562 ?auto_10560 ) ) ( OBJ-AT ?auto_10559 ?auto_10560 ) ( TRUCK-AT ?auto_10563 ?auto_10556 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10559 ?auto_10558 ?auto_10556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10592 - OBJ
      ?auto_10593 - OBJ
      ?auto_10594 - OBJ
      ?auto_10591 - LOCATION
    )
    :vars
    (
      ?auto_10597 - LOCATION
      ?auto_10596 - CITY
      ?auto_10595 - LOCATION
      ?auto_10598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10597 ?auto_10596 ) ( IN-CITY ?auto_10591 ?auto_10596 ) ( not ( = ?auto_10591 ?auto_10597 ) ) ( not ( = ?auto_10593 ?auto_10592 ) ) ( OBJ-AT ?auto_10592 ?auto_10597 ) ( not ( = ?auto_10593 ?auto_10594 ) ) ( not ( = ?auto_10592 ?auto_10594 ) ) ( OBJ-AT ?auto_10594 ?auto_10597 ) ( IN-CITY ?auto_10595 ?auto_10596 ) ( not ( = ?auto_10591 ?auto_10595 ) ) ( not ( = ?auto_10597 ?auto_10595 ) ) ( OBJ-AT ?auto_10593 ?auto_10595 ) ( TRUCK-AT ?auto_10598 ?auto_10591 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10593 ?auto_10592 ?auto_10591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10609 - OBJ
      ?auto_10610 - OBJ
      ?auto_10611 - OBJ
      ?auto_10608 - LOCATION
    )
    :vars
    (
      ?auto_10614 - LOCATION
      ?auto_10613 - CITY
      ?auto_10612 - LOCATION
      ?auto_10615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10614 ?auto_10613 ) ( IN-CITY ?auto_10608 ?auto_10613 ) ( not ( = ?auto_10608 ?auto_10614 ) ) ( not ( = ?auto_10611 ?auto_10609 ) ) ( OBJ-AT ?auto_10609 ?auto_10614 ) ( not ( = ?auto_10611 ?auto_10610 ) ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( OBJ-AT ?auto_10610 ?auto_10614 ) ( IN-CITY ?auto_10612 ?auto_10613 ) ( not ( = ?auto_10608 ?auto_10612 ) ) ( not ( = ?auto_10614 ?auto_10612 ) ) ( OBJ-AT ?auto_10611 ?auto_10612 ) ( TRUCK-AT ?auto_10615 ?auto_10608 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10611 ?auto_10609 ?auto_10608 ) )
  )

)

