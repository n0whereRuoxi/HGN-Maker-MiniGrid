( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_145765 - BLOCK
    )
    :vars
    (
      ?auto_145766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145765 ?auto_145766 ) ( CLEAR ?auto_145765 ) ( HAND-EMPTY ) ( not ( = ?auto_145765 ?auto_145766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145765 ?auto_145766 )
      ( !PUTDOWN ?auto_145765 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_145768 - BLOCK
    )
    :vars
    (
      ?auto_145769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145768 ?auto_145769 ) ( CLEAR ?auto_145768 ) ( HAND-EMPTY ) ( not ( = ?auto_145768 ?auto_145769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145768 ?auto_145769 )
      ( !PUTDOWN ?auto_145768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145772 - BLOCK
      ?auto_145773 - BLOCK
    )
    :vars
    (
      ?auto_145774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145772 ) ( ON ?auto_145773 ?auto_145774 ) ( CLEAR ?auto_145773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145772 ) ( not ( = ?auto_145772 ?auto_145773 ) ) ( not ( = ?auto_145772 ?auto_145774 ) ) ( not ( = ?auto_145773 ?auto_145774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145773 ?auto_145774 )
      ( !STACK ?auto_145773 ?auto_145772 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145777 - BLOCK
      ?auto_145778 - BLOCK
    )
    :vars
    (
      ?auto_145779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145777 ) ( ON ?auto_145778 ?auto_145779 ) ( CLEAR ?auto_145778 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145777 ) ( not ( = ?auto_145777 ?auto_145778 ) ) ( not ( = ?auto_145777 ?auto_145779 ) ) ( not ( = ?auto_145778 ?auto_145779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145778 ?auto_145779 )
      ( !STACK ?auto_145778 ?auto_145777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145782 - BLOCK
      ?auto_145783 - BLOCK
    )
    :vars
    (
      ?auto_145784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145783 ?auto_145784 ) ( not ( = ?auto_145782 ?auto_145783 ) ) ( not ( = ?auto_145782 ?auto_145784 ) ) ( not ( = ?auto_145783 ?auto_145784 ) ) ( ON ?auto_145782 ?auto_145783 ) ( CLEAR ?auto_145782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145782 )
      ( MAKE-2PILE ?auto_145782 ?auto_145783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145787 - BLOCK
      ?auto_145788 - BLOCK
    )
    :vars
    (
      ?auto_145789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145788 ?auto_145789 ) ( not ( = ?auto_145787 ?auto_145788 ) ) ( not ( = ?auto_145787 ?auto_145789 ) ) ( not ( = ?auto_145788 ?auto_145789 ) ) ( ON ?auto_145787 ?auto_145788 ) ( CLEAR ?auto_145787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145787 )
      ( MAKE-2PILE ?auto_145787 ?auto_145788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145793 - BLOCK
      ?auto_145794 - BLOCK
      ?auto_145795 - BLOCK
    )
    :vars
    (
      ?auto_145796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145794 ) ( ON ?auto_145795 ?auto_145796 ) ( CLEAR ?auto_145795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145793 ) ( ON ?auto_145794 ?auto_145793 ) ( not ( = ?auto_145793 ?auto_145794 ) ) ( not ( = ?auto_145793 ?auto_145795 ) ) ( not ( = ?auto_145793 ?auto_145796 ) ) ( not ( = ?auto_145794 ?auto_145795 ) ) ( not ( = ?auto_145794 ?auto_145796 ) ) ( not ( = ?auto_145795 ?auto_145796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145795 ?auto_145796 )
      ( !STACK ?auto_145795 ?auto_145794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145800 - BLOCK
      ?auto_145801 - BLOCK
      ?auto_145802 - BLOCK
    )
    :vars
    (
      ?auto_145803 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145801 ) ( ON ?auto_145802 ?auto_145803 ) ( CLEAR ?auto_145802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145800 ) ( ON ?auto_145801 ?auto_145800 ) ( not ( = ?auto_145800 ?auto_145801 ) ) ( not ( = ?auto_145800 ?auto_145802 ) ) ( not ( = ?auto_145800 ?auto_145803 ) ) ( not ( = ?auto_145801 ?auto_145802 ) ) ( not ( = ?auto_145801 ?auto_145803 ) ) ( not ( = ?auto_145802 ?auto_145803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145802 ?auto_145803 )
      ( !STACK ?auto_145802 ?auto_145801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145807 - BLOCK
      ?auto_145808 - BLOCK
      ?auto_145809 - BLOCK
    )
    :vars
    (
      ?auto_145810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145809 ?auto_145810 ) ( ON-TABLE ?auto_145807 ) ( not ( = ?auto_145807 ?auto_145808 ) ) ( not ( = ?auto_145807 ?auto_145809 ) ) ( not ( = ?auto_145807 ?auto_145810 ) ) ( not ( = ?auto_145808 ?auto_145809 ) ) ( not ( = ?auto_145808 ?auto_145810 ) ) ( not ( = ?auto_145809 ?auto_145810 ) ) ( CLEAR ?auto_145807 ) ( ON ?auto_145808 ?auto_145809 ) ( CLEAR ?auto_145808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145807 ?auto_145808 )
      ( MAKE-3PILE ?auto_145807 ?auto_145808 ?auto_145809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145814 - BLOCK
      ?auto_145815 - BLOCK
      ?auto_145816 - BLOCK
    )
    :vars
    (
      ?auto_145817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145816 ?auto_145817 ) ( ON-TABLE ?auto_145814 ) ( not ( = ?auto_145814 ?auto_145815 ) ) ( not ( = ?auto_145814 ?auto_145816 ) ) ( not ( = ?auto_145814 ?auto_145817 ) ) ( not ( = ?auto_145815 ?auto_145816 ) ) ( not ( = ?auto_145815 ?auto_145817 ) ) ( not ( = ?auto_145816 ?auto_145817 ) ) ( CLEAR ?auto_145814 ) ( ON ?auto_145815 ?auto_145816 ) ( CLEAR ?auto_145815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145814 ?auto_145815 )
      ( MAKE-3PILE ?auto_145814 ?auto_145815 ?auto_145816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145821 - BLOCK
      ?auto_145822 - BLOCK
      ?auto_145823 - BLOCK
    )
    :vars
    (
      ?auto_145824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145823 ?auto_145824 ) ( not ( = ?auto_145821 ?auto_145822 ) ) ( not ( = ?auto_145821 ?auto_145823 ) ) ( not ( = ?auto_145821 ?auto_145824 ) ) ( not ( = ?auto_145822 ?auto_145823 ) ) ( not ( = ?auto_145822 ?auto_145824 ) ) ( not ( = ?auto_145823 ?auto_145824 ) ) ( ON ?auto_145822 ?auto_145823 ) ( ON ?auto_145821 ?auto_145822 ) ( CLEAR ?auto_145821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145821 )
      ( MAKE-3PILE ?auto_145821 ?auto_145822 ?auto_145823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145828 - BLOCK
      ?auto_145829 - BLOCK
      ?auto_145830 - BLOCK
    )
    :vars
    (
      ?auto_145831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145830 ?auto_145831 ) ( not ( = ?auto_145828 ?auto_145829 ) ) ( not ( = ?auto_145828 ?auto_145830 ) ) ( not ( = ?auto_145828 ?auto_145831 ) ) ( not ( = ?auto_145829 ?auto_145830 ) ) ( not ( = ?auto_145829 ?auto_145831 ) ) ( not ( = ?auto_145830 ?auto_145831 ) ) ( ON ?auto_145829 ?auto_145830 ) ( ON ?auto_145828 ?auto_145829 ) ( CLEAR ?auto_145828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145828 )
      ( MAKE-3PILE ?auto_145828 ?auto_145829 ?auto_145830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145836 - BLOCK
      ?auto_145837 - BLOCK
      ?auto_145838 - BLOCK
      ?auto_145839 - BLOCK
    )
    :vars
    (
      ?auto_145840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145838 ) ( ON ?auto_145839 ?auto_145840 ) ( CLEAR ?auto_145839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145836 ) ( ON ?auto_145837 ?auto_145836 ) ( ON ?auto_145838 ?auto_145837 ) ( not ( = ?auto_145836 ?auto_145837 ) ) ( not ( = ?auto_145836 ?auto_145838 ) ) ( not ( = ?auto_145836 ?auto_145839 ) ) ( not ( = ?auto_145836 ?auto_145840 ) ) ( not ( = ?auto_145837 ?auto_145838 ) ) ( not ( = ?auto_145837 ?auto_145839 ) ) ( not ( = ?auto_145837 ?auto_145840 ) ) ( not ( = ?auto_145838 ?auto_145839 ) ) ( not ( = ?auto_145838 ?auto_145840 ) ) ( not ( = ?auto_145839 ?auto_145840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145839 ?auto_145840 )
      ( !STACK ?auto_145839 ?auto_145838 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145845 - BLOCK
      ?auto_145846 - BLOCK
      ?auto_145847 - BLOCK
      ?auto_145848 - BLOCK
    )
    :vars
    (
      ?auto_145849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145847 ) ( ON ?auto_145848 ?auto_145849 ) ( CLEAR ?auto_145848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145845 ) ( ON ?auto_145846 ?auto_145845 ) ( ON ?auto_145847 ?auto_145846 ) ( not ( = ?auto_145845 ?auto_145846 ) ) ( not ( = ?auto_145845 ?auto_145847 ) ) ( not ( = ?auto_145845 ?auto_145848 ) ) ( not ( = ?auto_145845 ?auto_145849 ) ) ( not ( = ?auto_145846 ?auto_145847 ) ) ( not ( = ?auto_145846 ?auto_145848 ) ) ( not ( = ?auto_145846 ?auto_145849 ) ) ( not ( = ?auto_145847 ?auto_145848 ) ) ( not ( = ?auto_145847 ?auto_145849 ) ) ( not ( = ?auto_145848 ?auto_145849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145848 ?auto_145849 )
      ( !STACK ?auto_145848 ?auto_145847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145854 - BLOCK
      ?auto_145855 - BLOCK
      ?auto_145856 - BLOCK
      ?auto_145857 - BLOCK
    )
    :vars
    (
      ?auto_145858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145857 ?auto_145858 ) ( ON-TABLE ?auto_145854 ) ( ON ?auto_145855 ?auto_145854 ) ( not ( = ?auto_145854 ?auto_145855 ) ) ( not ( = ?auto_145854 ?auto_145856 ) ) ( not ( = ?auto_145854 ?auto_145857 ) ) ( not ( = ?auto_145854 ?auto_145858 ) ) ( not ( = ?auto_145855 ?auto_145856 ) ) ( not ( = ?auto_145855 ?auto_145857 ) ) ( not ( = ?auto_145855 ?auto_145858 ) ) ( not ( = ?auto_145856 ?auto_145857 ) ) ( not ( = ?auto_145856 ?auto_145858 ) ) ( not ( = ?auto_145857 ?auto_145858 ) ) ( CLEAR ?auto_145855 ) ( ON ?auto_145856 ?auto_145857 ) ( CLEAR ?auto_145856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145854 ?auto_145855 ?auto_145856 )
      ( MAKE-4PILE ?auto_145854 ?auto_145855 ?auto_145856 ?auto_145857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145863 - BLOCK
      ?auto_145864 - BLOCK
      ?auto_145865 - BLOCK
      ?auto_145866 - BLOCK
    )
    :vars
    (
      ?auto_145867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145866 ?auto_145867 ) ( ON-TABLE ?auto_145863 ) ( ON ?auto_145864 ?auto_145863 ) ( not ( = ?auto_145863 ?auto_145864 ) ) ( not ( = ?auto_145863 ?auto_145865 ) ) ( not ( = ?auto_145863 ?auto_145866 ) ) ( not ( = ?auto_145863 ?auto_145867 ) ) ( not ( = ?auto_145864 ?auto_145865 ) ) ( not ( = ?auto_145864 ?auto_145866 ) ) ( not ( = ?auto_145864 ?auto_145867 ) ) ( not ( = ?auto_145865 ?auto_145866 ) ) ( not ( = ?auto_145865 ?auto_145867 ) ) ( not ( = ?auto_145866 ?auto_145867 ) ) ( CLEAR ?auto_145864 ) ( ON ?auto_145865 ?auto_145866 ) ( CLEAR ?auto_145865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145863 ?auto_145864 ?auto_145865 )
      ( MAKE-4PILE ?auto_145863 ?auto_145864 ?auto_145865 ?auto_145866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145872 - BLOCK
      ?auto_145873 - BLOCK
      ?auto_145874 - BLOCK
      ?auto_145875 - BLOCK
    )
    :vars
    (
      ?auto_145876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145875 ?auto_145876 ) ( ON-TABLE ?auto_145872 ) ( not ( = ?auto_145872 ?auto_145873 ) ) ( not ( = ?auto_145872 ?auto_145874 ) ) ( not ( = ?auto_145872 ?auto_145875 ) ) ( not ( = ?auto_145872 ?auto_145876 ) ) ( not ( = ?auto_145873 ?auto_145874 ) ) ( not ( = ?auto_145873 ?auto_145875 ) ) ( not ( = ?auto_145873 ?auto_145876 ) ) ( not ( = ?auto_145874 ?auto_145875 ) ) ( not ( = ?auto_145874 ?auto_145876 ) ) ( not ( = ?auto_145875 ?auto_145876 ) ) ( ON ?auto_145874 ?auto_145875 ) ( CLEAR ?auto_145872 ) ( ON ?auto_145873 ?auto_145874 ) ( CLEAR ?auto_145873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145872 ?auto_145873 )
      ( MAKE-4PILE ?auto_145872 ?auto_145873 ?auto_145874 ?auto_145875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145881 - BLOCK
      ?auto_145882 - BLOCK
      ?auto_145883 - BLOCK
      ?auto_145884 - BLOCK
    )
    :vars
    (
      ?auto_145885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145884 ?auto_145885 ) ( ON-TABLE ?auto_145881 ) ( not ( = ?auto_145881 ?auto_145882 ) ) ( not ( = ?auto_145881 ?auto_145883 ) ) ( not ( = ?auto_145881 ?auto_145884 ) ) ( not ( = ?auto_145881 ?auto_145885 ) ) ( not ( = ?auto_145882 ?auto_145883 ) ) ( not ( = ?auto_145882 ?auto_145884 ) ) ( not ( = ?auto_145882 ?auto_145885 ) ) ( not ( = ?auto_145883 ?auto_145884 ) ) ( not ( = ?auto_145883 ?auto_145885 ) ) ( not ( = ?auto_145884 ?auto_145885 ) ) ( ON ?auto_145883 ?auto_145884 ) ( CLEAR ?auto_145881 ) ( ON ?auto_145882 ?auto_145883 ) ( CLEAR ?auto_145882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145881 ?auto_145882 )
      ( MAKE-4PILE ?auto_145881 ?auto_145882 ?auto_145883 ?auto_145884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145890 - BLOCK
      ?auto_145891 - BLOCK
      ?auto_145892 - BLOCK
      ?auto_145893 - BLOCK
    )
    :vars
    (
      ?auto_145894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145893 ?auto_145894 ) ( not ( = ?auto_145890 ?auto_145891 ) ) ( not ( = ?auto_145890 ?auto_145892 ) ) ( not ( = ?auto_145890 ?auto_145893 ) ) ( not ( = ?auto_145890 ?auto_145894 ) ) ( not ( = ?auto_145891 ?auto_145892 ) ) ( not ( = ?auto_145891 ?auto_145893 ) ) ( not ( = ?auto_145891 ?auto_145894 ) ) ( not ( = ?auto_145892 ?auto_145893 ) ) ( not ( = ?auto_145892 ?auto_145894 ) ) ( not ( = ?auto_145893 ?auto_145894 ) ) ( ON ?auto_145892 ?auto_145893 ) ( ON ?auto_145891 ?auto_145892 ) ( ON ?auto_145890 ?auto_145891 ) ( CLEAR ?auto_145890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145890 )
      ( MAKE-4PILE ?auto_145890 ?auto_145891 ?auto_145892 ?auto_145893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145899 - BLOCK
      ?auto_145900 - BLOCK
      ?auto_145901 - BLOCK
      ?auto_145902 - BLOCK
    )
    :vars
    (
      ?auto_145903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145902 ?auto_145903 ) ( not ( = ?auto_145899 ?auto_145900 ) ) ( not ( = ?auto_145899 ?auto_145901 ) ) ( not ( = ?auto_145899 ?auto_145902 ) ) ( not ( = ?auto_145899 ?auto_145903 ) ) ( not ( = ?auto_145900 ?auto_145901 ) ) ( not ( = ?auto_145900 ?auto_145902 ) ) ( not ( = ?auto_145900 ?auto_145903 ) ) ( not ( = ?auto_145901 ?auto_145902 ) ) ( not ( = ?auto_145901 ?auto_145903 ) ) ( not ( = ?auto_145902 ?auto_145903 ) ) ( ON ?auto_145901 ?auto_145902 ) ( ON ?auto_145900 ?auto_145901 ) ( ON ?auto_145899 ?auto_145900 ) ( CLEAR ?auto_145899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145899 )
      ( MAKE-4PILE ?auto_145899 ?auto_145900 ?auto_145901 ?auto_145902 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145909 - BLOCK
      ?auto_145910 - BLOCK
      ?auto_145911 - BLOCK
      ?auto_145912 - BLOCK
      ?auto_145913 - BLOCK
    )
    :vars
    (
      ?auto_145914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145912 ) ( ON ?auto_145913 ?auto_145914 ) ( CLEAR ?auto_145913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145909 ) ( ON ?auto_145910 ?auto_145909 ) ( ON ?auto_145911 ?auto_145910 ) ( ON ?auto_145912 ?auto_145911 ) ( not ( = ?auto_145909 ?auto_145910 ) ) ( not ( = ?auto_145909 ?auto_145911 ) ) ( not ( = ?auto_145909 ?auto_145912 ) ) ( not ( = ?auto_145909 ?auto_145913 ) ) ( not ( = ?auto_145909 ?auto_145914 ) ) ( not ( = ?auto_145910 ?auto_145911 ) ) ( not ( = ?auto_145910 ?auto_145912 ) ) ( not ( = ?auto_145910 ?auto_145913 ) ) ( not ( = ?auto_145910 ?auto_145914 ) ) ( not ( = ?auto_145911 ?auto_145912 ) ) ( not ( = ?auto_145911 ?auto_145913 ) ) ( not ( = ?auto_145911 ?auto_145914 ) ) ( not ( = ?auto_145912 ?auto_145913 ) ) ( not ( = ?auto_145912 ?auto_145914 ) ) ( not ( = ?auto_145913 ?auto_145914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145913 ?auto_145914 )
      ( !STACK ?auto_145913 ?auto_145912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145920 - BLOCK
      ?auto_145921 - BLOCK
      ?auto_145922 - BLOCK
      ?auto_145923 - BLOCK
      ?auto_145924 - BLOCK
    )
    :vars
    (
      ?auto_145925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145923 ) ( ON ?auto_145924 ?auto_145925 ) ( CLEAR ?auto_145924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145920 ) ( ON ?auto_145921 ?auto_145920 ) ( ON ?auto_145922 ?auto_145921 ) ( ON ?auto_145923 ?auto_145922 ) ( not ( = ?auto_145920 ?auto_145921 ) ) ( not ( = ?auto_145920 ?auto_145922 ) ) ( not ( = ?auto_145920 ?auto_145923 ) ) ( not ( = ?auto_145920 ?auto_145924 ) ) ( not ( = ?auto_145920 ?auto_145925 ) ) ( not ( = ?auto_145921 ?auto_145922 ) ) ( not ( = ?auto_145921 ?auto_145923 ) ) ( not ( = ?auto_145921 ?auto_145924 ) ) ( not ( = ?auto_145921 ?auto_145925 ) ) ( not ( = ?auto_145922 ?auto_145923 ) ) ( not ( = ?auto_145922 ?auto_145924 ) ) ( not ( = ?auto_145922 ?auto_145925 ) ) ( not ( = ?auto_145923 ?auto_145924 ) ) ( not ( = ?auto_145923 ?auto_145925 ) ) ( not ( = ?auto_145924 ?auto_145925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145924 ?auto_145925 )
      ( !STACK ?auto_145924 ?auto_145923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145931 - BLOCK
      ?auto_145932 - BLOCK
      ?auto_145933 - BLOCK
      ?auto_145934 - BLOCK
      ?auto_145935 - BLOCK
    )
    :vars
    (
      ?auto_145936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145935 ?auto_145936 ) ( ON-TABLE ?auto_145931 ) ( ON ?auto_145932 ?auto_145931 ) ( ON ?auto_145933 ?auto_145932 ) ( not ( = ?auto_145931 ?auto_145932 ) ) ( not ( = ?auto_145931 ?auto_145933 ) ) ( not ( = ?auto_145931 ?auto_145934 ) ) ( not ( = ?auto_145931 ?auto_145935 ) ) ( not ( = ?auto_145931 ?auto_145936 ) ) ( not ( = ?auto_145932 ?auto_145933 ) ) ( not ( = ?auto_145932 ?auto_145934 ) ) ( not ( = ?auto_145932 ?auto_145935 ) ) ( not ( = ?auto_145932 ?auto_145936 ) ) ( not ( = ?auto_145933 ?auto_145934 ) ) ( not ( = ?auto_145933 ?auto_145935 ) ) ( not ( = ?auto_145933 ?auto_145936 ) ) ( not ( = ?auto_145934 ?auto_145935 ) ) ( not ( = ?auto_145934 ?auto_145936 ) ) ( not ( = ?auto_145935 ?auto_145936 ) ) ( CLEAR ?auto_145933 ) ( ON ?auto_145934 ?auto_145935 ) ( CLEAR ?auto_145934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145931 ?auto_145932 ?auto_145933 ?auto_145934 )
      ( MAKE-5PILE ?auto_145931 ?auto_145932 ?auto_145933 ?auto_145934 ?auto_145935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145942 - BLOCK
      ?auto_145943 - BLOCK
      ?auto_145944 - BLOCK
      ?auto_145945 - BLOCK
      ?auto_145946 - BLOCK
    )
    :vars
    (
      ?auto_145947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145946 ?auto_145947 ) ( ON-TABLE ?auto_145942 ) ( ON ?auto_145943 ?auto_145942 ) ( ON ?auto_145944 ?auto_145943 ) ( not ( = ?auto_145942 ?auto_145943 ) ) ( not ( = ?auto_145942 ?auto_145944 ) ) ( not ( = ?auto_145942 ?auto_145945 ) ) ( not ( = ?auto_145942 ?auto_145946 ) ) ( not ( = ?auto_145942 ?auto_145947 ) ) ( not ( = ?auto_145943 ?auto_145944 ) ) ( not ( = ?auto_145943 ?auto_145945 ) ) ( not ( = ?auto_145943 ?auto_145946 ) ) ( not ( = ?auto_145943 ?auto_145947 ) ) ( not ( = ?auto_145944 ?auto_145945 ) ) ( not ( = ?auto_145944 ?auto_145946 ) ) ( not ( = ?auto_145944 ?auto_145947 ) ) ( not ( = ?auto_145945 ?auto_145946 ) ) ( not ( = ?auto_145945 ?auto_145947 ) ) ( not ( = ?auto_145946 ?auto_145947 ) ) ( CLEAR ?auto_145944 ) ( ON ?auto_145945 ?auto_145946 ) ( CLEAR ?auto_145945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145942 ?auto_145943 ?auto_145944 ?auto_145945 )
      ( MAKE-5PILE ?auto_145942 ?auto_145943 ?auto_145944 ?auto_145945 ?auto_145946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145953 - BLOCK
      ?auto_145954 - BLOCK
      ?auto_145955 - BLOCK
      ?auto_145956 - BLOCK
      ?auto_145957 - BLOCK
    )
    :vars
    (
      ?auto_145958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145957 ?auto_145958 ) ( ON-TABLE ?auto_145953 ) ( ON ?auto_145954 ?auto_145953 ) ( not ( = ?auto_145953 ?auto_145954 ) ) ( not ( = ?auto_145953 ?auto_145955 ) ) ( not ( = ?auto_145953 ?auto_145956 ) ) ( not ( = ?auto_145953 ?auto_145957 ) ) ( not ( = ?auto_145953 ?auto_145958 ) ) ( not ( = ?auto_145954 ?auto_145955 ) ) ( not ( = ?auto_145954 ?auto_145956 ) ) ( not ( = ?auto_145954 ?auto_145957 ) ) ( not ( = ?auto_145954 ?auto_145958 ) ) ( not ( = ?auto_145955 ?auto_145956 ) ) ( not ( = ?auto_145955 ?auto_145957 ) ) ( not ( = ?auto_145955 ?auto_145958 ) ) ( not ( = ?auto_145956 ?auto_145957 ) ) ( not ( = ?auto_145956 ?auto_145958 ) ) ( not ( = ?auto_145957 ?auto_145958 ) ) ( ON ?auto_145956 ?auto_145957 ) ( CLEAR ?auto_145954 ) ( ON ?auto_145955 ?auto_145956 ) ( CLEAR ?auto_145955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145953 ?auto_145954 ?auto_145955 )
      ( MAKE-5PILE ?auto_145953 ?auto_145954 ?auto_145955 ?auto_145956 ?auto_145957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145964 - BLOCK
      ?auto_145965 - BLOCK
      ?auto_145966 - BLOCK
      ?auto_145967 - BLOCK
      ?auto_145968 - BLOCK
    )
    :vars
    (
      ?auto_145969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145968 ?auto_145969 ) ( ON-TABLE ?auto_145964 ) ( ON ?auto_145965 ?auto_145964 ) ( not ( = ?auto_145964 ?auto_145965 ) ) ( not ( = ?auto_145964 ?auto_145966 ) ) ( not ( = ?auto_145964 ?auto_145967 ) ) ( not ( = ?auto_145964 ?auto_145968 ) ) ( not ( = ?auto_145964 ?auto_145969 ) ) ( not ( = ?auto_145965 ?auto_145966 ) ) ( not ( = ?auto_145965 ?auto_145967 ) ) ( not ( = ?auto_145965 ?auto_145968 ) ) ( not ( = ?auto_145965 ?auto_145969 ) ) ( not ( = ?auto_145966 ?auto_145967 ) ) ( not ( = ?auto_145966 ?auto_145968 ) ) ( not ( = ?auto_145966 ?auto_145969 ) ) ( not ( = ?auto_145967 ?auto_145968 ) ) ( not ( = ?auto_145967 ?auto_145969 ) ) ( not ( = ?auto_145968 ?auto_145969 ) ) ( ON ?auto_145967 ?auto_145968 ) ( CLEAR ?auto_145965 ) ( ON ?auto_145966 ?auto_145967 ) ( CLEAR ?auto_145966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145964 ?auto_145965 ?auto_145966 )
      ( MAKE-5PILE ?auto_145964 ?auto_145965 ?auto_145966 ?auto_145967 ?auto_145968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145975 - BLOCK
      ?auto_145976 - BLOCK
      ?auto_145977 - BLOCK
      ?auto_145978 - BLOCK
      ?auto_145979 - BLOCK
    )
    :vars
    (
      ?auto_145980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145979 ?auto_145980 ) ( ON-TABLE ?auto_145975 ) ( not ( = ?auto_145975 ?auto_145976 ) ) ( not ( = ?auto_145975 ?auto_145977 ) ) ( not ( = ?auto_145975 ?auto_145978 ) ) ( not ( = ?auto_145975 ?auto_145979 ) ) ( not ( = ?auto_145975 ?auto_145980 ) ) ( not ( = ?auto_145976 ?auto_145977 ) ) ( not ( = ?auto_145976 ?auto_145978 ) ) ( not ( = ?auto_145976 ?auto_145979 ) ) ( not ( = ?auto_145976 ?auto_145980 ) ) ( not ( = ?auto_145977 ?auto_145978 ) ) ( not ( = ?auto_145977 ?auto_145979 ) ) ( not ( = ?auto_145977 ?auto_145980 ) ) ( not ( = ?auto_145978 ?auto_145979 ) ) ( not ( = ?auto_145978 ?auto_145980 ) ) ( not ( = ?auto_145979 ?auto_145980 ) ) ( ON ?auto_145978 ?auto_145979 ) ( ON ?auto_145977 ?auto_145978 ) ( CLEAR ?auto_145975 ) ( ON ?auto_145976 ?auto_145977 ) ( CLEAR ?auto_145976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145975 ?auto_145976 )
      ( MAKE-5PILE ?auto_145975 ?auto_145976 ?auto_145977 ?auto_145978 ?auto_145979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145986 - BLOCK
      ?auto_145987 - BLOCK
      ?auto_145988 - BLOCK
      ?auto_145989 - BLOCK
      ?auto_145990 - BLOCK
    )
    :vars
    (
      ?auto_145991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145990 ?auto_145991 ) ( ON-TABLE ?auto_145986 ) ( not ( = ?auto_145986 ?auto_145987 ) ) ( not ( = ?auto_145986 ?auto_145988 ) ) ( not ( = ?auto_145986 ?auto_145989 ) ) ( not ( = ?auto_145986 ?auto_145990 ) ) ( not ( = ?auto_145986 ?auto_145991 ) ) ( not ( = ?auto_145987 ?auto_145988 ) ) ( not ( = ?auto_145987 ?auto_145989 ) ) ( not ( = ?auto_145987 ?auto_145990 ) ) ( not ( = ?auto_145987 ?auto_145991 ) ) ( not ( = ?auto_145988 ?auto_145989 ) ) ( not ( = ?auto_145988 ?auto_145990 ) ) ( not ( = ?auto_145988 ?auto_145991 ) ) ( not ( = ?auto_145989 ?auto_145990 ) ) ( not ( = ?auto_145989 ?auto_145991 ) ) ( not ( = ?auto_145990 ?auto_145991 ) ) ( ON ?auto_145989 ?auto_145990 ) ( ON ?auto_145988 ?auto_145989 ) ( CLEAR ?auto_145986 ) ( ON ?auto_145987 ?auto_145988 ) ( CLEAR ?auto_145987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145986 ?auto_145987 )
      ( MAKE-5PILE ?auto_145986 ?auto_145987 ?auto_145988 ?auto_145989 ?auto_145990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145997 - BLOCK
      ?auto_145998 - BLOCK
      ?auto_145999 - BLOCK
      ?auto_146000 - BLOCK
      ?auto_146001 - BLOCK
    )
    :vars
    (
      ?auto_146002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146001 ?auto_146002 ) ( not ( = ?auto_145997 ?auto_145998 ) ) ( not ( = ?auto_145997 ?auto_145999 ) ) ( not ( = ?auto_145997 ?auto_146000 ) ) ( not ( = ?auto_145997 ?auto_146001 ) ) ( not ( = ?auto_145997 ?auto_146002 ) ) ( not ( = ?auto_145998 ?auto_145999 ) ) ( not ( = ?auto_145998 ?auto_146000 ) ) ( not ( = ?auto_145998 ?auto_146001 ) ) ( not ( = ?auto_145998 ?auto_146002 ) ) ( not ( = ?auto_145999 ?auto_146000 ) ) ( not ( = ?auto_145999 ?auto_146001 ) ) ( not ( = ?auto_145999 ?auto_146002 ) ) ( not ( = ?auto_146000 ?auto_146001 ) ) ( not ( = ?auto_146000 ?auto_146002 ) ) ( not ( = ?auto_146001 ?auto_146002 ) ) ( ON ?auto_146000 ?auto_146001 ) ( ON ?auto_145999 ?auto_146000 ) ( ON ?auto_145998 ?auto_145999 ) ( ON ?auto_145997 ?auto_145998 ) ( CLEAR ?auto_145997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145997 )
      ( MAKE-5PILE ?auto_145997 ?auto_145998 ?auto_145999 ?auto_146000 ?auto_146001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_146008 - BLOCK
      ?auto_146009 - BLOCK
      ?auto_146010 - BLOCK
      ?auto_146011 - BLOCK
      ?auto_146012 - BLOCK
    )
    :vars
    (
      ?auto_146013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146012 ?auto_146013 ) ( not ( = ?auto_146008 ?auto_146009 ) ) ( not ( = ?auto_146008 ?auto_146010 ) ) ( not ( = ?auto_146008 ?auto_146011 ) ) ( not ( = ?auto_146008 ?auto_146012 ) ) ( not ( = ?auto_146008 ?auto_146013 ) ) ( not ( = ?auto_146009 ?auto_146010 ) ) ( not ( = ?auto_146009 ?auto_146011 ) ) ( not ( = ?auto_146009 ?auto_146012 ) ) ( not ( = ?auto_146009 ?auto_146013 ) ) ( not ( = ?auto_146010 ?auto_146011 ) ) ( not ( = ?auto_146010 ?auto_146012 ) ) ( not ( = ?auto_146010 ?auto_146013 ) ) ( not ( = ?auto_146011 ?auto_146012 ) ) ( not ( = ?auto_146011 ?auto_146013 ) ) ( not ( = ?auto_146012 ?auto_146013 ) ) ( ON ?auto_146011 ?auto_146012 ) ( ON ?auto_146010 ?auto_146011 ) ( ON ?auto_146009 ?auto_146010 ) ( ON ?auto_146008 ?auto_146009 ) ( CLEAR ?auto_146008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146008 )
      ( MAKE-5PILE ?auto_146008 ?auto_146009 ?auto_146010 ?auto_146011 ?auto_146012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146020 - BLOCK
      ?auto_146021 - BLOCK
      ?auto_146022 - BLOCK
      ?auto_146023 - BLOCK
      ?auto_146024 - BLOCK
      ?auto_146025 - BLOCK
    )
    :vars
    (
      ?auto_146026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146024 ) ( ON ?auto_146025 ?auto_146026 ) ( CLEAR ?auto_146025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146020 ) ( ON ?auto_146021 ?auto_146020 ) ( ON ?auto_146022 ?auto_146021 ) ( ON ?auto_146023 ?auto_146022 ) ( ON ?auto_146024 ?auto_146023 ) ( not ( = ?auto_146020 ?auto_146021 ) ) ( not ( = ?auto_146020 ?auto_146022 ) ) ( not ( = ?auto_146020 ?auto_146023 ) ) ( not ( = ?auto_146020 ?auto_146024 ) ) ( not ( = ?auto_146020 ?auto_146025 ) ) ( not ( = ?auto_146020 ?auto_146026 ) ) ( not ( = ?auto_146021 ?auto_146022 ) ) ( not ( = ?auto_146021 ?auto_146023 ) ) ( not ( = ?auto_146021 ?auto_146024 ) ) ( not ( = ?auto_146021 ?auto_146025 ) ) ( not ( = ?auto_146021 ?auto_146026 ) ) ( not ( = ?auto_146022 ?auto_146023 ) ) ( not ( = ?auto_146022 ?auto_146024 ) ) ( not ( = ?auto_146022 ?auto_146025 ) ) ( not ( = ?auto_146022 ?auto_146026 ) ) ( not ( = ?auto_146023 ?auto_146024 ) ) ( not ( = ?auto_146023 ?auto_146025 ) ) ( not ( = ?auto_146023 ?auto_146026 ) ) ( not ( = ?auto_146024 ?auto_146025 ) ) ( not ( = ?auto_146024 ?auto_146026 ) ) ( not ( = ?auto_146025 ?auto_146026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146025 ?auto_146026 )
      ( !STACK ?auto_146025 ?auto_146024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146033 - BLOCK
      ?auto_146034 - BLOCK
      ?auto_146035 - BLOCK
      ?auto_146036 - BLOCK
      ?auto_146037 - BLOCK
      ?auto_146038 - BLOCK
    )
    :vars
    (
      ?auto_146039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146037 ) ( ON ?auto_146038 ?auto_146039 ) ( CLEAR ?auto_146038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146033 ) ( ON ?auto_146034 ?auto_146033 ) ( ON ?auto_146035 ?auto_146034 ) ( ON ?auto_146036 ?auto_146035 ) ( ON ?auto_146037 ?auto_146036 ) ( not ( = ?auto_146033 ?auto_146034 ) ) ( not ( = ?auto_146033 ?auto_146035 ) ) ( not ( = ?auto_146033 ?auto_146036 ) ) ( not ( = ?auto_146033 ?auto_146037 ) ) ( not ( = ?auto_146033 ?auto_146038 ) ) ( not ( = ?auto_146033 ?auto_146039 ) ) ( not ( = ?auto_146034 ?auto_146035 ) ) ( not ( = ?auto_146034 ?auto_146036 ) ) ( not ( = ?auto_146034 ?auto_146037 ) ) ( not ( = ?auto_146034 ?auto_146038 ) ) ( not ( = ?auto_146034 ?auto_146039 ) ) ( not ( = ?auto_146035 ?auto_146036 ) ) ( not ( = ?auto_146035 ?auto_146037 ) ) ( not ( = ?auto_146035 ?auto_146038 ) ) ( not ( = ?auto_146035 ?auto_146039 ) ) ( not ( = ?auto_146036 ?auto_146037 ) ) ( not ( = ?auto_146036 ?auto_146038 ) ) ( not ( = ?auto_146036 ?auto_146039 ) ) ( not ( = ?auto_146037 ?auto_146038 ) ) ( not ( = ?auto_146037 ?auto_146039 ) ) ( not ( = ?auto_146038 ?auto_146039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146038 ?auto_146039 )
      ( !STACK ?auto_146038 ?auto_146037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146046 - BLOCK
      ?auto_146047 - BLOCK
      ?auto_146048 - BLOCK
      ?auto_146049 - BLOCK
      ?auto_146050 - BLOCK
      ?auto_146051 - BLOCK
    )
    :vars
    (
      ?auto_146052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146051 ?auto_146052 ) ( ON-TABLE ?auto_146046 ) ( ON ?auto_146047 ?auto_146046 ) ( ON ?auto_146048 ?auto_146047 ) ( ON ?auto_146049 ?auto_146048 ) ( not ( = ?auto_146046 ?auto_146047 ) ) ( not ( = ?auto_146046 ?auto_146048 ) ) ( not ( = ?auto_146046 ?auto_146049 ) ) ( not ( = ?auto_146046 ?auto_146050 ) ) ( not ( = ?auto_146046 ?auto_146051 ) ) ( not ( = ?auto_146046 ?auto_146052 ) ) ( not ( = ?auto_146047 ?auto_146048 ) ) ( not ( = ?auto_146047 ?auto_146049 ) ) ( not ( = ?auto_146047 ?auto_146050 ) ) ( not ( = ?auto_146047 ?auto_146051 ) ) ( not ( = ?auto_146047 ?auto_146052 ) ) ( not ( = ?auto_146048 ?auto_146049 ) ) ( not ( = ?auto_146048 ?auto_146050 ) ) ( not ( = ?auto_146048 ?auto_146051 ) ) ( not ( = ?auto_146048 ?auto_146052 ) ) ( not ( = ?auto_146049 ?auto_146050 ) ) ( not ( = ?auto_146049 ?auto_146051 ) ) ( not ( = ?auto_146049 ?auto_146052 ) ) ( not ( = ?auto_146050 ?auto_146051 ) ) ( not ( = ?auto_146050 ?auto_146052 ) ) ( not ( = ?auto_146051 ?auto_146052 ) ) ( CLEAR ?auto_146049 ) ( ON ?auto_146050 ?auto_146051 ) ( CLEAR ?auto_146050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146046 ?auto_146047 ?auto_146048 ?auto_146049 ?auto_146050 )
      ( MAKE-6PILE ?auto_146046 ?auto_146047 ?auto_146048 ?auto_146049 ?auto_146050 ?auto_146051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146059 - BLOCK
      ?auto_146060 - BLOCK
      ?auto_146061 - BLOCK
      ?auto_146062 - BLOCK
      ?auto_146063 - BLOCK
      ?auto_146064 - BLOCK
    )
    :vars
    (
      ?auto_146065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146064 ?auto_146065 ) ( ON-TABLE ?auto_146059 ) ( ON ?auto_146060 ?auto_146059 ) ( ON ?auto_146061 ?auto_146060 ) ( ON ?auto_146062 ?auto_146061 ) ( not ( = ?auto_146059 ?auto_146060 ) ) ( not ( = ?auto_146059 ?auto_146061 ) ) ( not ( = ?auto_146059 ?auto_146062 ) ) ( not ( = ?auto_146059 ?auto_146063 ) ) ( not ( = ?auto_146059 ?auto_146064 ) ) ( not ( = ?auto_146059 ?auto_146065 ) ) ( not ( = ?auto_146060 ?auto_146061 ) ) ( not ( = ?auto_146060 ?auto_146062 ) ) ( not ( = ?auto_146060 ?auto_146063 ) ) ( not ( = ?auto_146060 ?auto_146064 ) ) ( not ( = ?auto_146060 ?auto_146065 ) ) ( not ( = ?auto_146061 ?auto_146062 ) ) ( not ( = ?auto_146061 ?auto_146063 ) ) ( not ( = ?auto_146061 ?auto_146064 ) ) ( not ( = ?auto_146061 ?auto_146065 ) ) ( not ( = ?auto_146062 ?auto_146063 ) ) ( not ( = ?auto_146062 ?auto_146064 ) ) ( not ( = ?auto_146062 ?auto_146065 ) ) ( not ( = ?auto_146063 ?auto_146064 ) ) ( not ( = ?auto_146063 ?auto_146065 ) ) ( not ( = ?auto_146064 ?auto_146065 ) ) ( CLEAR ?auto_146062 ) ( ON ?auto_146063 ?auto_146064 ) ( CLEAR ?auto_146063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146059 ?auto_146060 ?auto_146061 ?auto_146062 ?auto_146063 )
      ( MAKE-6PILE ?auto_146059 ?auto_146060 ?auto_146061 ?auto_146062 ?auto_146063 ?auto_146064 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146072 - BLOCK
      ?auto_146073 - BLOCK
      ?auto_146074 - BLOCK
      ?auto_146075 - BLOCK
      ?auto_146076 - BLOCK
      ?auto_146077 - BLOCK
    )
    :vars
    (
      ?auto_146078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146077 ?auto_146078 ) ( ON-TABLE ?auto_146072 ) ( ON ?auto_146073 ?auto_146072 ) ( ON ?auto_146074 ?auto_146073 ) ( not ( = ?auto_146072 ?auto_146073 ) ) ( not ( = ?auto_146072 ?auto_146074 ) ) ( not ( = ?auto_146072 ?auto_146075 ) ) ( not ( = ?auto_146072 ?auto_146076 ) ) ( not ( = ?auto_146072 ?auto_146077 ) ) ( not ( = ?auto_146072 ?auto_146078 ) ) ( not ( = ?auto_146073 ?auto_146074 ) ) ( not ( = ?auto_146073 ?auto_146075 ) ) ( not ( = ?auto_146073 ?auto_146076 ) ) ( not ( = ?auto_146073 ?auto_146077 ) ) ( not ( = ?auto_146073 ?auto_146078 ) ) ( not ( = ?auto_146074 ?auto_146075 ) ) ( not ( = ?auto_146074 ?auto_146076 ) ) ( not ( = ?auto_146074 ?auto_146077 ) ) ( not ( = ?auto_146074 ?auto_146078 ) ) ( not ( = ?auto_146075 ?auto_146076 ) ) ( not ( = ?auto_146075 ?auto_146077 ) ) ( not ( = ?auto_146075 ?auto_146078 ) ) ( not ( = ?auto_146076 ?auto_146077 ) ) ( not ( = ?auto_146076 ?auto_146078 ) ) ( not ( = ?auto_146077 ?auto_146078 ) ) ( ON ?auto_146076 ?auto_146077 ) ( CLEAR ?auto_146074 ) ( ON ?auto_146075 ?auto_146076 ) ( CLEAR ?auto_146075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146072 ?auto_146073 ?auto_146074 ?auto_146075 )
      ( MAKE-6PILE ?auto_146072 ?auto_146073 ?auto_146074 ?auto_146075 ?auto_146076 ?auto_146077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146085 - BLOCK
      ?auto_146086 - BLOCK
      ?auto_146087 - BLOCK
      ?auto_146088 - BLOCK
      ?auto_146089 - BLOCK
      ?auto_146090 - BLOCK
    )
    :vars
    (
      ?auto_146091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146090 ?auto_146091 ) ( ON-TABLE ?auto_146085 ) ( ON ?auto_146086 ?auto_146085 ) ( ON ?auto_146087 ?auto_146086 ) ( not ( = ?auto_146085 ?auto_146086 ) ) ( not ( = ?auto_146085 ?auto_146087 ) ) ( not ( = ?auto_146085 ?auto_146088 ) ) ( not ( = ?auto_146085 ?auto_146089 ) ) ( not ( = ?auto_146085 ?auto_146090 ) ) ( not ( = ?auto_146085 ?auto_146091 ) ) ( not ( = ?auto_146086 ?auto_146087 ) ) ( not ( = ?auto_146086 ?auto_146088 ) ) ( not ( = ?auto_146086 ?auto_146089 ) ) ( not ( = ?auto_146086 ?auto_146090 ) ) ( not ( = ?auto_146086 ?auto_146091 ) ) ( not ( = ?auto_146087 ?auto_146088 ) ) ( not ( = ?auto_146087 ?auto_146089 ) ) ( not ( = ?auto_146087 ?auto_146090 ) ) ( not ( = ?auto_146087 ?auto_146091 ) ) ( not ( = ?auto_146088 ?auto_146089 ) ) ( not ( = ?auto_146088 ?auto_146090 ) ) ( not ( = ?auto_146088 ?auto_146091 ) ) ( not ( = ?auto_146089 ?auto_146090 ) ) ( not ( = ?auto_146089 ?auto_146091 ) ) ( not ( = ?auto_146090 ?auto_146091 ) ) ( ON ?auto_146089 ?auto_146090 ) ( CLEAR ?auto_146087 ) ( ON ?auto_146088 ?auto_146089 ) ( CLEAR ?auto_146088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146085 ?auto_146086 ?auto_146087 ?auto_146088 )
      ( MAKE-6PILE ?auto_146085 ?auto_146086 ?auto_146087 ?auto_146088 ?auto_146089 ?auto_146090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146098 - BLOCK
      ?auto_146099 - BLOCK
      ?auto_146100 - BLOCK
      ?auto_146101 - BLOCK
      ?auto_146102 - BLOCK
      ?auto_146103 - BLOCK
    )
    :vars
    (
      ?auto_146104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146103 ?auto_146104 ) ( ON-TABLE ?auto_146098 ) ( ON ?auto_146099 ?auto_146098 ) ( not ( = ?auto_146098 ?auto_146099 ) ) ( not ( = ?auto_146098 ?auto_146100 ) ) ( not ( = ?auto_146098 ?auto_146101 ) ) ( not ( = ?auto_146098 ?auto_146102 ) ) ( not ( = ?auto_146098 ?auto_146103 ) ) ( not ( = ?auto_146098 ?auto_146104 ) ) ( not ( = ?auto_146099 ?auto_146100 ) ) ( not ( = ?auto_146099 ?auto_146101 ) ) ( not ( = ?auto_146099 ?auto_146102 ) ) ( not ( = ?auto_146099 ?auto_146103 ) ) ( not ( = ?auto_146099 ?auto_146104 ) ) ( not ( = ?auto_146100 ?auto_146101 ) ) ( not ( = ?auto_146100 ?auto_146102 ) ) ( not ( = ?auto_146100 ?auto_146103 ) ) ( not ( = ?auto_146100 ?auto_146104 ) ) ( not ( = ?auto_146101 ?auto_146102 ) ) ( not ( = ?auto_146101 ?auto_146103 ) ) ( not ( = ?auto_146101 ?auto_146104 ) ) ( not ( = ?auto_146102 ?auto_146103 ) ) ( not ( = ?auto_146102 ?auto_146104 ) ) ( not ( = ?auto_146103 ?auto_146104 ) ) ( ON ?auto_146102 ?auto_146103 ) ( ON ?auto_146101 ?auto_146102 ) ( CLEAR ?auto_146099 ) ( ON ?auto_146100 ?auto_146101 ) ( CLEAR ?auto_146100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146098 ?auto_146099 ?auto_146100 )
      ( MAKE-6PILE ?auto_146098 ?auto_146099 ?auto_146100 ?auto_146101 ?auto_146102 ?auto_146103 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146111 - BLOCK
      ?auto_146112 - BLOCK
      ?auto_146113 - BLOCK
      ?auto_146114 - BLOCK
      ?auto_146115 - BLOCK
      ?auto_146116 - BLOCK
    )
    :vars
    (
      ?auto_146117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146116 ?auto_146117 ) ( ON-TABLE ?auto_146111 ) ( ON ?auto_146112 ?auto_146111 ) ( not ( = ?auto_146111 ?auto_146112 ) ) ( not ( = ?auto_146111 ?auto_146113 ) ) ( not ( = ?auto_146111 ?auto_146114 ) ) ( not ( = ?auto_146111 ?auto_146115 ) ) ( not ( = ?auto_146111 ?auto_146116 ) ) ( not ( = ?auto_146111 ?auto_146117 ) ) ( not ( = ?auto_146112 ?auto_146113 ) ) ( not ( = ?auto_146112 ?auto_146114 ) ) ( not ( = ?auto_146112 ?auto_146115 ) ) ( not ( = ?auto_146112 ?auto_146116 ) ) ( not ( = ?auto_146112 ?auto_146117 ) ) ( not ( = ?auto_146113 ?auto_146114 ) ) ( not ( = ?auto_146113 ?auto_146115 ) ) ( not ( = ?auto_146113 ?auto_146116 ) ) ( not ( = ?auto_146113 ?auto_146117 ) ) ( not ( = ?auto_146114 ?auto_146115 ) ) ( not ( = ?auto_146114 ?auto_146116 ) ) ( not ( = ?auto_146114 ?auto_146117 ) ) ( not ( = ?auto_146115 ?auto_146116 ) ) ( not ( = ?auto_146115 ?auto_146117 ) ) ( not ( = ?auto_146116 ?auto_146117 ) ) ( ON ?auto_146115 ?auto_146116 ) ( ON ?auto_146114 ?auto_146115 ) ( CLEAR ?auto_146112 ) ( ON ?auto_146113 ?auto_146114 ) ( CLEAR ?auto_146113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146111 ?auto_146112 ?auto_146113 )
      ( MAKE-6PILE ?auto_146111 ?auto_146112 ?auto_146113 ?auto_146114 ?auto_146115 ?auto_146116 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146124 - BLOCK
      ?auto_146125 - BLOCK
      ?auto_146126 - BLOCK
      ?auto_146127 - BLOCK
      ?auto_146128 - BLOCK
      ?auto_146129 - BLOCK
    )
    :vars
    (
      ?auto_146130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146129 ?auto_146130 ) ( ON-TABLE ?auto_146124 ) ( not ( = ?auto_146124 ?auto_146125 ) ) ( not ( = ?auto_146124 ?auto_146126 ) ) ( not ( = ?auto_146124 ?auto_146127 ) ) ( not ( = ?auto_146124 ?auto_146128 ) ) ( not ( = ?auto_146124 ?auto_146129 ) ) ( not ( = ?auto_146124 ?auto_146130 ) ) ( not ( = ?auto_146125 ?auto_146126 ) ) ( not ( = ?auto_146125 ?auto_146127 ) ) ( not ( = ?auto_146125 ?auto_146128 ) ) ( not ( = ?auto_146125 ?auto_146129 ) ) ( not ( = ?auto_146125 ?auto_146130 ) ) ( not ( = ?auto_146126 ?auto_146127 ) ) ( not ( = ?auto_146126 ?auto_146128 ) ) ( not ( = ?auto_146126 ?auto_146129 ) ) ( not ( = ?auto_146126 ?auto_146130 ) ) ( not ( = ?auto_146127 ?auto_146128 ) ) ( not ( = ?auto_146127 ?auto_146129 ) ) ( not ( = ?auto_146127 ?auto_146130 ) ) ( not ( = ?auto_146128 ?auto_146129 ) ) ( not ( = ?auto_146128 ?auto_146130 ) ) ( not ( = ?auto_146129 ?auto_146130 ) ) ( ON ?auto_146128 ?auto_146129 ) ( ON ?auto_146127 ?auto_146128 ) ( ON ?auto_146126 ?auto_146127 ) ( CLEAR ?auto_146124 ) ( ON ?auto_146125 ?auto_146126 ) ( CLEAR ?auto_146125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146124 ?auto_146125 )
      ( MAKE-6PILE ?auto_146124 ?auto_146125 ?auto_146126 ?auto_146127 ?auto_146128 ?auto_146129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146137 - BLOCK
      ?auto_146138 - BLOCK
      ?auto_146139 - BLOCK
      ?auto_146140 - BLOCK
      ?auto_146141 - BLOCK
      ?auto_146142 - BLOCK
    )
    :vars
    (
      ?auto_146143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146142 ?auto_146143 ) ( ON-TABLE ?auto_146137 ) ( not ( = ?auto_146137 ?auto_146138 ) ) ( not ( = ?auto_146137 ?auto_146139 ) ) ( not ( = ?auto_146137 ?auto_146140 ) ) ( not ( = ?auto_146137 ?auto_146141 ) ) ( not ( = ?auto_146137 ?auto_146142 ) ) ( not ( = ?auto_146137 ?auto_146143 ) ) ( not ( = ?auto_146138 ?auto_146139 ) ) ( not ( = ?auto_146138 ?auto_146140 ) ) ( not ( = ?auto_146138 ?auto_146141 ) ) ( not ( = ?auto_146138 ?auto_146142 ) ) ( not ( = ?auto_146138 ?auto_146143 ) ) ( not ( = ?auto_146139 ?auto_146140 ) ) ( not ( = ?auto_146139 ?auto_146141 ) ) ( not ( = ?auto_146139 ?auto_146142 ) ) ( not ( = ?auto_146139 ?auto_146143 ) ) ( not ( = ?auto_146140 ?auto_146141 ) ) ( not ( = ?auto_146140 ?auto_146142 ) ) ( not ( = ?auto_146140 ?auto_146143 ) ) ( not ( = ?auto_146141 ?auto_146142 ) ) ( not ( = ?auto_146141 ?auto_146143 ) ) ( not ( = ?auto_146142 ?auto_146143 ) ) ( ON ?auto_146141 ?auto_146142 ) ( ON ?auto_146140 ?auto_146141 ) ( ON ?auto_146139 ?auto_146140 ) ( CLEAR ?auto_146137 ) ( ON ?auto_146138 ?auto_146139 ) ( CLEAR ?auto_146138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146137 ?auto_146138 )
      ( MAKE-6PILE ?auto_146137 ?auto_146138 ?auto_146139 ?auto_146140 ?auto_146141 ?auto_146142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146150 - BLOCK
      ?auto_146151 - BLOCK
      ?auto_146152 - BLOCK
      ?auto_146153 - BLOCK
      ?auto_146154 - BLOCK
      ?auto_146155 - BLOCK
    )
    :vars
    (
      ?auto_146156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146155 ?auto_146156 ) ( not ( = ?auto_146150 ?auto_146151 ) ) ( not ( = ?auto_146150 ?auto_146152 ) ) ( not ( = ?auto_146150 ?auto_146153 ) ) ( not ( = ?auto_146150 ?auto_146154 ) ) ( not ( = ?auto_146150 ?auto_146155 ) ) ( not ( = ?auto_146150 ?auto_146156 ) ) ( not ( = ?auto_146151 ?auto_146152 ) ) ( not ( = ?auto_146151 ?auto_146153 ) ) ( not ( = ?auto_146151 ?auto_146154 ) ) ( not ( = ?auto_146151 ?auto_146155 ) ) ( not ( = ?auto_146151 ?auto_146156 ) ) ( not ( = ?auto_146152 ?auto_146153 ) ) ( not ( = ?auto_146152 ?auto_146154 ) ) ( not ( = ?auto_146152 ?auto_146155 ) ) ( not ( = ?auto_146152 ?auto_146156 ) ) ( not ( = ?auto_146153 ?auto_146154 ) ) ( not ( = ?auto_146153 ?auto_146155 ) ) ( not ( = ?auto_146153 ?auto_146156 ) ) ( not ( = ?auto_146154 ?auto_146155 ) ) ( not ( = ?auto_146154 ?auto_146156 ) ) ( not ( = ?auto_146155 ?auto_146156 ) ) ( ON ?auto_146154 ?auto_146155 ) ( ON ?auto_146153 ?auto_146154 ) ( ON ?auto_146152 ?auto_146153 ) ( ON ?auto_146151 ?auto_146152 ) ( ON ?auto_146150 ?auto_146151 ) ( CLEAR ?auto_146150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146150 )
      ( MAKE-6PILE ?auto_146150 ?auto_146151 ?auto_146152 ?auto_146153 ?auto_146154 ?auto_146155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146163 - BLOCK
      ?auto_146164 - BLOCK
      ?auto_146165 - BLOCK
      ?auto_146166 - BLOCK
      ?auto_146167 - BLOCK
      ?auto_146168 - BLOCK
    )
    :vars
    (
      ?auto_146169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146168 ?auto_146169 ) ( not ( = ?auto_146163 ?auto_146164 ) ) ( not ( = ?auto_146163 ?auto_146165 ) ) ( not ( = ?auto_146163 ?auto_146166 ) ) ( not ( = ?auto_146163 ?auto_146167 ) ) ( not ( = ?auto_146163 ?auto_146168 ) ) ( not ( = ?auto_146163 ?auto_146169 ) ) ( not ( = ?auto_146164 ?auto_146165 ) ) ( not ( = ?auto_146164 ?auto_146166 ) ) ( not ( = ?auto_146164 ?auto_146167 ) ) ( not ( = ?auto_146164 ?auto_146168 ) ) ( not ( = ?auto_146164 ?auto_146169 ) ) ( not ( = ?auto_146165 ?auto_146166 ) ) ( not ( = ?auto_146165 ?auto_146167 ) ) ( not ( = ?auto_146165 ?auto_146168 ) ) ( not ( = ?auto_146165 ?auto_146169 ) ) ( not ( = ?auto_146166 ?auto_146167 ) ) ( not ( = ?auto_146166 ?auto_146168 ) ) ( not ( = ?auto_146166 ?auto_146169 ) ) ( not ( = ?auto_146167 ?auto_146168 ) ) ( not ( = ?auto_146167 ?auto_146169 ) ) ( not ( = ?auto_146168 ?auto_146169 ) ) ( ON ?auto_146167 ?auto_146168 ) ( ON ?auto_146166 ?auto_146167 ) ( ON ?auto_146165 ?auto_146166 ) ( ON ?auto_146164 ?auto_146165 ) ( ON ?auto_146163 ?auto_146164 ) ( CLEAR ?auto_146163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146163 )
      ( MAKE-6PILE ?auto_146163 ?auto_146164 ?auto_146165 ?auto_146166 ?auto_146167 ?auto_146168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146177 - BLOCK
      ?auto_146178 - BLOCK
      ?auto_146179 - BLOCK
      ?auto_146180 - BLOCK
      ?auto_146181 - BLOCK
      ?auto_146182 - BLOCK
      ?auto_146183 - BLOCK
    )
    :vars
    (
      ?auto_146184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146182 ) ( ON ?auto_146183 ?auto_146184 ) ( CLEAR ?auto_146183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146177 ) ( ON ?auto_146178 ?auto_146177 ) ( ON ?auto_146179 ?auto_146178 ) ( ON ?auto_146180 ?auto_146179 ) ( ON ?auto_146181 ?auto_146180 ) ( ON ?auto_146182 ?auto_146181 ) ( not ( = ?auto_146177 ?auto_146178 ) ) ( not ( = ?auto_146177 ?auto_146179 ) ) ( not ( = ?auto_146177 ?auto_146180 ) ) ( not ( = ?auto_146177 ?auto_146181 ) ) ( not ( = ?auto_146177 ?auto_146182 ) ) ( not ( = ?auto_146177 ?auto_146183 ) ) ( not ( = ?auto_146177 ?auto_146184 ) ) ( not ( = ?auto_146178 ?auto_146179 ) ) ( not ( = ?auto_146178 ?auto_146180 ) ) ( not ( = ?auto_146178 ?auto_146181 ) ) ( not ( = ?auto_146178 ?auto_146182 ) ) ( not ( = ?auto_146178 ?auto_146183 ) ) ( not ( = ?auto_146178 ?auto_146184 ) ) ( not ( = ?auto_146179 ?auto_146180 ) ) ( not ( = ?auto_146179 ?auto_146181 ) ) ( not ( = ?auto_146179 ?auto_146182 ) ) ( not ( = ?auto_146179 ?auto_146183 ) ) ( not ( = ?auto_146179 ?auto_146184 ) ) ( not ( = ?auto_146180 ?auto_146181 ) ) ( not ( = ?auto_146180 ?auto_146182 ) ) ( not ( = ?auto_146180 ?auto_146183 ) ) ( not ( = ?auto_146180 ?auto_146184 ) ) ( not ( = ?auto_146181 ?auto_146182 ) ) ( not ( = ?auto_146181 ?auto_146183 ) ) ( not ( = ?auto_146181 ?auto_146184 ) ) ( not ( = ?auto_146182 ?auto_146183 ) ) ( not ( = ?auto_146182 ?auto_146184 ) ) ( not ( = ?auto_146183 ?auto_146184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146183 ?auto_146184 )
      ( !STACK ?auto_146183 ?auto_146182 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146192 - BLOCK
      ?auto_146193 - BLOCK
      ?auto_146194 - BLOCK
      ?auto_146195 - BLOCK
      ?auto_146196 - BLOCK
      ?auto_146197 - BLOCK
      ?auto_146198 - BLOCK
    )
    :vars
    (
      ?auto_146199 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146197 ) ( ON ?auto_146198 ?auto_146199 ) ( CLEAR ?auto_146198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146192 ) ( ON ?auto_146193 ?auto_146192 ) ( ON ?auto_146194 ?auto_146193 ) ( ON ?auto_146195 ?auto_146194 ) ( ON ?auto_146196 ?auto_146195 ) ( ON ?auto_146197 ?auto_146196 ) ( not ( = ?auto_146192 ?auto_146193 ) ) ( not ( = ?auto_146192 ?auto_146194 ) ) ( not ( = ?auto_146192 ?auto_146195 ) ) ( not ( = ?auto_146192 ?auto_146196 ) ) ( not ( = ?auto_146192 ?auto_146197 ) ) ( not ( = ?auto_146192 ?auto_146198 ) ) ( not ( = ?auto_146192 ?auto_146199 ) ) ( not ( = ?auto_146193 ?auto_146194 ) ) ( not ( = ?auto_146193 ?auto_146195 ) ) ( not ( = ?auto_146193 ?auto_146196 ) ) ( not ( = ?auto_146193 ?auto_146197 ) ) ( not ( = ?auto_146193 ?auto_146198 ) ) ( not ( = ?auto_146193 ?auto_146199 ) ) ( not ( = ?auto_146194 ?auto_146195 ) ) ( not ( = ?auto_146194 ?auto_146196 ) ) ( not ( = ?auto_146194 ?auto_146197 ) ) ( not ( = ?auto_146194 ?auto_146198 ) ) ( not ( = ?auto_146194 ?auto_146199 ) ) ( not ( = ?auto_146195 ?auto_146196 ) ) ( not ( = ?auto_146195 ?auto_146197 ) ) ( not ( = ?auto_146195 ?auto_146198 ) ) ( not ( = ?auto_146195 ?auto_146199 ) ) ( not ( = ?auto_146196 ?auto_146197 ) ) ( not ( = ?auto_146196 ?auto_146198 ) ) ( not ( = ?auto_146196 ?auto_146199 ) ) ( not ( = ?auto_146197 ?auto_146198 ) ) ( not ( = ?auto_146197 ?auto_146199 ) ) ( not ( = ?auto_146198 ?auto_146199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146198 ?auto_146199 )
      ( !STACK ?auto_146198 ?auto_146197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146207 - BLOCK
      ?auto_146208 - BLOCK
      ?auto_146209 - BLOCK
      ?auto_146210 - BLOCK
      ?auto_146211 - BLOCK
      ?auto_146212 - BLOCK
      ?auto_146213 - BLOCK
    )
    :vars
    (
      ?auto_146214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146213 ?auto_146214 ) ( ON-TABLE ?auto_146207 ) ( ON ?auto_146208 ?auto_146207 ) ( ON ?auto_146209 ?auto_146208 ) ( ON ?auto_146210 ?auto_146209 ) ( ON ?auto_146211 ?auto_146210 ) ( not ( = ?auto_146207 ?auto_146208 ) ) ( not ( = ?auto_146207 ?auto_146209 ) ) ( not ( = ?auto_146207 ?auto_146210 ) ) ( not ( = ?auto_146207 ?auto_146211 ) ) ( not ( = ?auto_146207 ?auto_146212 ) ) ( not ( = ?auto_146207 ?auto_146213 ) ) ( not ( = ?auto_146207 ?auto_146214 ) ) ( not ( = ?auto_146208 ?auto_146209 ) ) ( not ( = ?auto_146208 ?auto_146210 ) ) ( not ( = ?auto_146208 ?auto_146211 ) ) ( not ( = ?auto_146208 ?auto_146212 ) ) ( not ( = ?auto_146208 ?auto_146213 ) ) ( not ( = ?auto_146208 ?auto_146214 ) ) ( not ( = ?auto_146209 ?auto_146210 ) ) ( not ( = ?auto_146209 ?auto_146211 ) ) ( not ( = ?auto_146209 ?auto_146212 ) ) ( not ( = ?auto_146209 ?auto_146213 ) ) ( not ( = ?auto_146209 ?auto_146214 ) ) ( not ( = ?auto_146210 ?auto_146211 ) ) ( not ( = ?auto_146210 ?auto_146212 ) ) ( not ( = ?auto_146210 ?auto_146213 ) ) ( not ( = ?auto_146210 ?auto_146214 ) ) ( not ( = ?auto_146211 ?auto_146212 ) ) ( not ( = ?auto_146211 ?auto_146213 ) ) ( not ( = ?auto_146211 ?auto_146214 ) ) ( not ( = ?auto_146212 ?auto_146213 ) ) ( not ( = ?auto_146212 ?auto_146214 ) ) ( not ( = ?auto_146213 ?auto_146214 ) ) ( CLEAR ?auto_146211 ) ( ON ?auto_146212 ?auto_146213 ) ( CLEAR ?auto_146212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146207 ?auto_146208 ?auto_146209 ?auto_146210 ?auto_146211 ?auto_146212 )
      ( MAKE-7PILE ?auto_146207 ?auto_146208 ?auto_146209 ?auto_146210 ?auto_146211 ?auto_146212 ?auto_146213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146222 - BLOCK
      ?auto_146223 - BLOCK
      ?auto_146224 - BLOCK
      ?auto_146225 - BLOCK
      ?auto_146226 - BLOCK
      ?auto_146227 - BLOCK
      ?auto_146228 - BLOCK
    )
    :vars
    (
      ?auto_146229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146228 ?auto_146229 ) ( ON-TABLE ?auto_146222 ) ( ON ?auto_146223 ?auto_146222 ) ( ON ?auto_146224 ?auto_146223 ) ( ON ?auto_146225 ?auto_146224 ) ( ON ?auto_146226 ?auto_146225 ) ( not ( = ?auto_146222 ?auto_146223 ) ) ( not ( = ?auto_146222 ?auto_146224 ) ) ( not ( = ?auto_146222 ?auto_146225 ) ) ( not ( = ?auto_146222 ?auto_146226 ) ) ( not ( = ?auto_146222 ?auto_146227 ) ) ( not ( = ?auto_146222 ?auto_146228 ) ) ( not ( = ?auto_146222 ?auto_146229 ) ) ( not ( = ?auto_146223 ?auto_146224 ) ) ( not ( = ?auto_146223 ?auto_146225 ) ) ( not ( = ?auto_146223 ?auto_146226 ) ) ( not ( = ?auto_146223 ?auto_146227 ) ) ( not ( = ?auto_146223 ?auto_146228 ) ) ( not ( = ?auto_146223 ?auto_146229 ) ) ( not ( = ?auto_146224 ?auto_146225 ) ) ( not ( = ?auto_146224 ?auto_146226 ) ) ( not ( = ?auto_146224 ?auto_146227 ) ) ( not ( = ?auto_146224 ?auto_146228 ) ) ( not ( = ?auto_146224 ?auto_146229 ) ) ( not ( = ?auto_146225 ?auto_146226 ) ) ( not ( = ?auto_146225 ?auto_146227 ) ) ( not ( = ?auto_146225 ?auto_146228 ) ) ( not ( = ?auto_146225 ?auto_146229 ) ) ( not ( = ?auto_146226 ?auto_146227 ) ) ( not ( = ?auto_146226 ?auto_146228 ) ) ( not ( = ?auto_146226 ?auto_146229 ) ) ( not ( = ?auto_146227 ?auto_146228 ) ) ( not ( = ?auto_146227 ?auto_146229 ) ) ( not ( = ?auto_146228 ?auto_146229 ) ) ( CLEAR ?auto_146226 ) ( ON ?auto_146227 ?auto_146228 ) ( CLEAR ?auto_146227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146222 ?auto_146223 ?auto_146224 ?auto_146225 ?auto_146226 ?auto_146227 )
      ( MAKE-7PILE ?auto_146222 ?auto_146223 ?auto_146224 ?auto_146225 ?auto_146226 ?auto_146227 ?auto_146228 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146237 - BLOCK
      ?auto_146238 - BLOCK
      ?auto_146239 - BLOCK
      ?auto_146240 - BLOCK
      ?auto_146241 - BLOCK
      ?auto_146242 - BLOCK
      ?auto_146243 - BLOCK
    )
    :vars
    (
      ?auto_146244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146243 ?auto_146244 ) ( ON-TABLE ?auto_146237 ) ( ON ?auto_146238 ?auto_146237 ) ( ON ?auto_146239 ?auto_146238 ) ( ON ?auto_146240 ?auto_146239 ) ( not ( = ?auto_146237 ?auto_146238 ) ) ( not ( = ?auto_146237 ?auto_146239 ) ) ( not ( = ?auto_146237 ?auto_146240 ) ) ( not ( = ?auto_146237 ?auto_146241 ) ) ( not ( = ?auto_146237 ?auto_146242 ) ) ( not ( = ?auto_146237 ?auto_146243 ) ) ( not ( = ?auto_146237 ?auto_146244 ) ) ( not ( = ?auto_146238 ?auto_146239 ) ) ( not ( = ?auto_146238 ?auto_146240 ) ) ( not ( = ?auto_146238 ?auto_146241 ) ) ( not ( = ?auto_146238 ?auto_146242 ) ) ( not ( = ?auto_146238 ?auto_146243 ) ) ( not ( = ?auto_146238 ?auto_146244 ) ) ( not ( = ?auto_146239 ?auto_146240 ) ) ( not ( = ?auto_146239 ?auto_146241 ) ) ( not ( = ?auto_146239 ?auto_146242 ) ) ( not ( = ?auto_146239 ?auto_146243 ) ) ( not ( = ?auto_146239 ?auto_146244 ) ) ( not ( = ?auto_146240 ?auto_146241 ) ) ( not ( = ?auto_146240 ?auto_146242 ) ) ( not ( = ?auto_146240 ?auto_146243 ) ) ( not ( = ?auto_146240 ?auto_146244 ) ) ( not ( = ?auto_146241 ?auto_146242 ) ) ( not ( = ?auto_146241 ?auto_146243 ) ) ( not ( = ?auto_146241 ?auto_146244 ) ) ( not ( = ?auto_146242 ?auto_146243 ) ) ( not ( = ?auto_146242 ?auto_146244 ) ) ( not ( = ?auto_146243 ?auto_146244 ) ) ( ON ?auto_146242 ?auto_146243 ) ( CLEAR ?auto_146240 ) ( ON ?auto_146241 ?auto_146242 ) ( CLEAR ?auto_146241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146237 ?auto_146238 ?auto_146239 ?auto_146240 ?auto_146241 )
      ( MAKE-7PILE ?auto_146237 ?auto_146238 ?auto_146239 ?auto_146240 ?auto_146241 ?auto_146242 ?auto_146243 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146252 - BLOCK
      ?auto_146253 - BLOCK
      ?auto_146254 - BLOCK
      ?auto_146255 - BLOCK
      ?auto_146256 - BLOCK
      ?auto_146257 - BLOCK
      ?auto_146258 - BLOCK
    )
    :vars
    (
      ?auto_146259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146258 ?auto_146259 ) ( ON-TABLE ?auto_146252 ) ( ON ?auto_146253 ?auto_146252 ) ( ON ?auto_146254 ?auto_146253 ) ( ON ?auto_146255 ?auto_146254 ) ( not ( = ?auto_146252 ?auto_146253 ) ) ( not ( = ?auto_146252 ?auto_146254 ) ) ( not ( = ?auto_146252 ?auto_146255 ) ) ( not ( = ?auto_146252 ?auto_146256 ) ) ( not ( = ?auto_146252 ?auto_146257 ) ) ( not ( = ?auto_146252 ?auto_146258 ) ) ( not ( = ?auto_146252 ?auto_146259 ) ) ( not ( = ?auto_146253 ?auto_146254 ) ) ( not ( = ?auto_146253 ?auto_146255 ) ) ( not ( = ?auto_146253 ?auto_146256 ) ) ( not ( = ?auto_146253 ?auto_146257 ) ) ( not ( = ?auto_146253 ?auto_146258 ) ) ( not ( = ?auto_146253 ?auto_146259 ) ) ( not ( = ?auto_146254 ?auto_146255 ) ) ( not ( = ?auto_146254 ?auto_146256 ) ) ( not ( = ?auto_146254 ?auto_146257 ) ) ( not ( = ?auto_146254 ?auto_146258 ) ) ( not ( = ?auto_146254 ?auto_146259 ) ) ( not ( = ?auto_146255 ?auto_146256 ) ) ( not ( = ?auto_146255 ?auto_146257 ) ) ( not ( = ?auto_146255 ?auto_146258 ) ) ( not ( = ?auto_146255 ?auto_146259 ) ) ( not ( = ?auto_146256 ?auto_146257 ) ) ( not ( = ?auto_146256 ?auto_146258 ) ) ( not ( = ?auto_146256 ?auto_146259 ) ) ( not ( = ?auto_146257 ?auto_146258 ) ) ( not ( = ?auto_146257 ?auto_146259 ) ) ( not ( = ?auto_146258 ?auto_146259 ) ) ( ON ?auto_146257 ?auto_146258 ) ( CLEAR ?auto_146255 ) ( ON ?auto_146256 ?auto_146257 ) ( CLEAR ?auto_146256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146252 ?auto_146253 ?auto_146254 ?auto_146255 ?auto_146256 )
      ( MAKE-7PILE ?auto_146252 ?auto_146253 ?auto_146254 ?auto_146255 ?auto_146256 ?auto_146257 ?auto_146258 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146267 - BLOCK
      ?auto_146268 - BLOCK
      ?auto_146269 - BLOCK
      ?auto_146270 - BLOCK
      ?auto_146271 - BLOCK
      ?auto_146272 - BLOCK
      ?auto_146273 - BLOCK
    )
    :vars
    (
      ?auto_146274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146273 ?auto_146274 ) ( ON-TABLE ?auto_146267 ) ( ON ?auto_146268 ?auto_146267 ) ( ON ?auto_146269 ?auto_146268 ) ( not ( = ?auto_146267 ?auto_146268 ) ) ( not ( = ?auto_146267 ?auto_146269 ) ) ( not ( = ?auto_146267 ?auto_146270 ) ) ( not ( = ?auto_146267 ?auto_146271 ) ) ( not ( = ?auto_146267 ?auto_146272 ) ) ( not ( = ?auto_146267 ?auto_146273 ) ) ( not ( = ?auto_146267 ?auto_146274 ) ) ( not ( = ?auto_146268 ?auto_146269 ) ) ( not ( = ?auto_146268 ?auto_146270 ) ) ( not ( = ?auto_146268 ?auto_146271 ) ) ( not ( = ?auto_146268 ?auto_146272 ) ) ( not ( = ?auto_146268 ?auto_146273 ) ) ( not ( = ?auto_146268 ?auto_146274 ) ) ( not ( = ?auto_146269 ?auto_146270 ) ) ( not ( = ?auto_146269 ?auto_146271 ) ) ( not ( = ?auto_146269 ?auto_146272 ) ) ( not ( = ?auto_146269 ?auto_146273 ) ) ( not ( = ?auto_146269 ?auto_146274 ) ) ( not ( = ?auto_146270 ?auto_146271 ) ) ( not ( = ?auto_146270 ?auto_146272 ) ) ( not ( = ?auto_146270 ?auto_146273 ) ) ( not ( = ?auto_146270 ?auto_146274 ) ) ( not ( = ?auto_146271 ?auto_146272 ) ) ( not ( = ?auto_146271 ?auto_146273 ) ) ( not ( = ?auto_146271 ?auto_146274 ) ) ( not ( = ?auto_146272 ?auto_146273 ) ) ( not ( = ?auto_146272 ?auto_146274 ) ) ( not ( = ?auto_146273 ?auto_146274 ) ) ( ON ?auto_146272 ?auto_146273 ) ( ON ?auto_146271 ?auto_146272 ) ( CLEAR ?auto_146269 ) ( ON ?auto_146270 ?auto_146271 ) ( CLEAR ?auto_146270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146267 ?auto_146268 ?auto_146269 ?auto_146270 )
      ( MAKE-7PILE ?auto_146267 ?auto_146268 ?auto_146269 ?auto_146270 ?auto_146271 ?auto_146272 ?auto_146273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146282 - BLOCK
      ?auto_146283 - BLOCK
      ?auto_146284 - BLOCK
      ?auto_146285 - BLOCK
      ?auto_146286 - BLOCK
      ?auto_146287 - BLOCK
      ?auto_146288 - BLOCK
    )
    :vars
    (
      ?auto_146289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146288 ?auto_146289 ) ( ON-TABLE ?auto_146282 ) ( ON ?auto_146283 ?auto_146282 ) ( ON ?auto_146284 ?auto_146283 ) ( not ( = ?auto_146282 ?auto_146283 ) ) ( not ( = ?auto_146282 ?auto_146284 ) ) ( not ( = ?auto_146282 ?auto_146285 ) ) ( not ( = ?auto_146282 ?auto_146286 ) ) ( not ( = ?auto_146282 ?auto_146287 ) ) ( not ( = ?auto_146282 ?auto_146288 ) ) ( not ( = ?auto_146282 ?auto_146289 ) ) ( not ( = ?auto_146283 ?auto_146284 ) ) ( not ( = ?auto_146283 ?auto_146285 ) ) ( not ( = ?auto_146283 ?auto_146286 ) ) ( not ( = ?auto_146283 ?auto_146287 ) ) ( not ( = ?auto_146283 ?auto_146288 ) ) ( not ( = ?auto_146283 ?auto_146289 ) ) ( not ( = ?auto_146284 ?auto_146285 ) ) ( not ( = ?auto_146284 ?auto_146286 ) ) ( not ( = ?auto_146284 ?auto_146287 ) ) ( not ( = ?auto_146284 ?auto_146288 ) ) ( not ( = ?auto_146284 ?auto_146289 ) ) ( not ( = ?auto_146285 ?auto_146286 ) ) ( not ( = ?auto_146285 ?auto_146287 ) ) ( not ( = ?auto_146285 ?auto_146288 ) ) ( not ( = ?auto_146285 ?auto_146289 ) ) ( not ( = ?auto_146286 ?auto_146287 ) ) ( not ( = ?auto_146286 ?auto_146288 ) ) ( not ( = ?auto_146286 ?auto_146289 ) ) ( not ( = ?auto_146287 ?auto_146288 ) ) ( not ( = ?auto_146287 ?auto_146289 ) ) ( not ( = ?auto_146288 ?auto_146289 ) ) ( ON ?auto_146287 ?auto_146288 ) ( ON ?auto_146286 ?auto_146287 ) ( CLEAR ?auto_146284 ) ( ON ?auto_146285 ?auto_146286 ) ( CLEAR ?auto_146285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146282 ?auto_146283 ?auto_146284 ?auto_146285 )
      ( MAKE-7PILE ?auto_146282 ?auto_146283 ?auto_146284 ?auto_146285 ?auto_146286 ?auto_146287 ?auto_146288 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146297 - BLOCK
      ?auto_146298 - BLOCK
      ?auto_146299 - BLOCK
      ?auto_146300 - BLOCK
      ?auto_146301 - BLOCK
      ?auto_146302 - BLOCK
      ?auto_146303 - BLOCK
    )
    :vars
    (
      ?auto_146304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146303 ?auto_146304 ) ( ON-TABLE ?auto_146297 ) ( ON ?auto_146298 ?auto_146297 ) ( not ( = ?auto_146297 ?auto_146298 ) ) ( not ( = ?auto_146297 ?auto_146299 ) ) ( not ( = ?auto_146297 ?auto_146300 ) ) ( not ( = ?auto_146297 ?auto_146301 ) ) ( not ( = ?auto_146297 ?auto_146302 ) ) ( not ( = ?auto_146297 ?auto_146303 ) ) ( not ( = ?auto_146297 ?auto_146304 ) ) ( not ( = ?auto_146298 ?auto_146299 ) ) ( not ( = ?auto_146298 ?auto_146300 ) ) ( not ( = ?auto_146298 ?auto_146301 ) ) ( not ( = ?auto_146298 ?auto_146302 ) ) ( not ( = ?auto_146298 ?auto_146303 ) ) ( not ( = ?auto_146298 ?auto_146304 ) ) ( not ( = ?auto_146299 ?auto_146300 ) ) ( not ( = ?auto_146299 ?auto_146301 ) ) ( not ( = ?auto_146299 ?auto_146302 ) ) ( not ( = ?auto_146299 ?auto_146303 ) ) ( not ( = ?auto_146299 ?auto_146304 ) ) ( not ( = ?auto_146300 ?auto_146301 ) ) ( not ( = ?auto_146300 ?auto_146302 ) ) ( not ( = ?auto_146300 ?auto_146303 ) ) ( not ( = ?auto_146300 ?auto_146304 ) ) ( not ( = ?auto_146301 ?auto_146302 ) ) ( not ( = ?auto_146301 ?auto_146303 ) ) ( not ( = ?auto_146301 ?auto_146304 ) ) ( not ( = ?auto_146302 ?auto_146303 ) ) ( not ( = ?auto_146302 ?auto_146304 ) ) ( not ( = ?auto_146303 ?auto_146304 ) ) ( ON ?auto_146302 ?auto_146303 ) ( ON ?auto_146301 ?auto_146302 ) ( ON ?auto_146300 ?auto_146301 ) ( CLEAR ?auto_146298 ) ( ON ?auto_146299 ?auto_146300 ) ( CLEAR ?auto_146299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146297 ?auto_146298 ?auto_146299 )
      ( MAKE-7PILE ?auto_146297 ?auto_146298 ?auto_146299 ?auto_146300 ?auto_146301 ?auto_146302 ?auto_146303 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146312 - BLOCK
      ?auto_146313 - BLOCK
      ?auto_146314 - BLOCK
      ?auto_146315 - BLOCK
      ?auto_146316 - BLOCK
      ?auto_146317 - BLOCK
      ?auto_146318 - BLOCK
    )
    :vars
    (
      ?auto_146319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146318 ?auto_146319 ) ( ON-TABLE ?auto_146312 ) ( ON ?auto_146313 ?auto_146312 ) ( not ( = ?auto_146312 ?auto_146313 ) ) ( not ( = ?auto_146312 ?auto_146314 ) ) ( not ( = ?auto_146312 ?auto_146315 ) ) ( not ( = ?auto_146312 ?auto_146316 ) ) ( not ( = ?auto_146312 ?auto_146317 ) ) ( not ( = ?auto_146312 ?auto_146318 ) ) ( not ( = ?auto_146312 ?auto_146319 ) ) ( not ( = ?auto_146313 ?auto_146314 ) ) ( not ( = ?auto_146313 ?auto_146315 ) ) ( not ( = ?auto_146313 ?auto_146316 ) ) ( not ( = ?auto_146313 ?auto_146317 ) ) ( not ( = ?auto_146313 ?auto_146318 ) ) ( not ( = ?auto_146313 ?auto_146319 ) ) ( not ( = ?auto_146314 ?auto_146315 ) ) ( not ( = ?auto_146314 ?auto_146316 ) ) ( not ( = ?auto_146314 ?auto_146317 ) ) ( not ( = ?auto_146314 ?auto_146318 ) ) ( not ( = ?auto_146314 ?auto_146319 ) ) ( not ( = ?auto_146315 ?auto_146316 ) ) ( not ( = ?auto_146315 ?auto_146317 ) ) ( not ( = ?auto_146315 ?auto_146318 ) ) ( not ( = ?auto_146315 ?auto_146319 ) ) ( not ( = ?auto_146316 ?auto_146317 ) ) ( not ( = ?auto_146316 ?auto_146318 ) ) ( not ( = ?auto_146316 ?auto_146319 ) ) ( not ( = ?auto_146317 ?auto_146318 ) ) ( not ( = ?auto_146317 ?auto_146319 ) ) ( not ( = ?auto_146318 ?auto_146319 ) ) ( ON ?auto_146317 ?auto_146318 ) ( ON ?auto_146316 ?auto_146317 ) ( ON ?auto_146315 ?auto_146316 ) ( CLEAR ?auto_146313 ) ( ON ?auto_146314 ?auto_146315 ) ( CLEAR ?auto_146314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146312 ?auto_146313 ?auto_146314 )
      ( MAKE-7PILE ?auto_146312 ?auto_146313 ?auto_146314 ?auto_146315 ?auto_146316 ?auto_146317 ?auto_146318 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146327 - BLOCK
      ?auto_146328 - BLOCK
      ?auto_146329 - BLOCK
      ?auto_146330 - BLOCK
      ?auto_146331 - BLOCK
      ?auto_146332 - BLOCK
      ?auto_146333 - BLOCK
    )
    :vars
    (
      ?auto_146334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146333 ?auto_146334 ) ( ON-TABLE ?auto_146327 ) ( not ( = ?auto_146327 ?auto_146328 ) ) ( not ( = ?auto_146327 ?auto_146329 ) ) ( not ( = ?auto_146327 ?auto_146330 ) ) ( not ( = ?auto_146327 ?auto_146331 ) ) ( not ( = ?auto_146327 ?auto_146332 ) ) ( not ( = ?auto_146327 ?auto_146333 ) ) ( not ( = ?auto_146327 ?auto_146334 ) ) ( not ( = ?auto_146328 ?auto_146329 ) ) ( not ( = ?auto_146328 ?auto_146330 ) ) ( not ( = ?auto_146328 ?auto_146331 ) ) ( not ( = ?auto_146328 ?auto_146332 ) ) ( not ( = ?auto_146328 ?auto_146333 ) ) ( not ( = ?auto_146328 ?auto_146334 ) ) ( not ( = ?auto_146329 ?auto_146330 ) ) ( not ( = ?auto_146329 ?auto_146331 ) ) ( not ( = ?auto_146329 ?auto_146332 ) ) ( not ( = ?auto_146329 ?auto_146333 ) ) ( not ( = ?auto_146329 ?auto_146334 ) ) ( not ( = ?auto_146330 ?auto_146331 ) ) ( not ( = ?auto_146330 ?auto_146332 ) ) ( not ( = ?auto_146330 ?auto_146333 ) ) ( not ( = ?auto_146330 ?auto_146334 ) ) ( not ( = ?auto_146331 ?auto_146332 ) ) ( not ( = ?auto_146331 ?auto_146333 ) ) ( not ( = ?auto_146331 ?auto_146334 ) ) ( not ( = ?auto_146332 ?auto_146333 ) ) ( not ( = ?auto_146332 ?auto_146334 ) ) ( not ( = ?auto_146333 ?auto_146334 ) ) ( ON ?auto_146332 ?auto_146333 ) ( ON ?auto_146331 ?auto_146332 ) ( ON ?auto_146330 ?auto_146331 ) ( ON ?auto_146329 ?auto_146330 ) ( CLEAR ?auto_146327 ) ( ON ?auto_146328 ?auto_146329 ) ( CLEAR ?auto_146328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146327 ?auto_146328 )
      ( MAKE-7PILE ?auto_146327 ?auto_146328 ?auto_146329 ?auto_146330 ?auto_146331 ?auto_146332 ?auto_146333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146342 - BLOCK
      ?auto_146343 - BLOCK
      ?auto_146344 - BLOCK
      ?auto_146345 - BLOCK
      ?auto_146346 - BLOCK
      ?auto_146347 - BLOCK
      ?auto_146348 - BLOCK
    )
    :vars
    (
      ?auto_146349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146348 ?auto_146349 ) ( ON-TABLE ?auto_146342 ) ( not ( = ?auto_146342 ?auto_146343 ) ) ( not ( = ?auto_146342 ?auto_146344 ) ) ( not ( = ?auto_146342 ?auto_146345 ) ) ( not ( = ?auto_146342 ?auto_146346 ) ) ( not ( = ?auto_146342 ?auto_146347 ) ) ( not ( = ?auto_146342 ?auto_146348 ) ) ( not ( = ?auto_146342 ?auto_146349 ) ) ( not ( = ?auto_146343 ?auto_146344 ) ) ( not ( = ?auto_146343 ?auto_146345 ) ) ( not ( = ?auto_146343 ?auto_146346 ) ) ( not ( = ?auto_146343 ?auto_146347 ) ) ( not ( = ?auto_146343 ?auto_146348 ) ) ( not ( = ?auto_146343 ?auto_146349 ) ) ( not ( = ?auto_146344 ?auto_146345 ) ) ( not ( = ?auto_146344 ?auto_146346 ) ) ( not ( = ?auto_146344 ?auto_146347 ) ) ( not ( = ?auto_146344 ?auto_146348 ) ) ( not ( = ?auto_146344 ?auto_146349 ) ) ( not ( = ?auto_146345 ?auto_146346 ) ) ( not ( = ?auto_146345 ?auto_146347 ) ) ( not ( = ?auto_146345 ?auto_146348 ) ) ( not ( = ?auto_146345 ?auto_146349 ) ) ( not ( = ?auto_146346 ?auto_146347 ) ) ( not ( = ?auto_146346 ?auto_146348 ) ) ( not ( = ?auto_146346 ?auto_146349 ) ) ( not ( = ?auto_146347 ?auto_146348 ) ) ( not ( = ?auto_146347 ?auto_146349 ) ) ( not ( = ?auto_146348 ?auto_146349 ) ) ( ON ?auto_146347 ?auto_146348 ) ( ON ?auto_146346 ?auto_146347 ) ( ON ?auto_146345 ?auto_146346 ) ( ON ?auto_146344 ?auto_146345 ) ( CLEAR ?auto_146342 ) ( ON ?auto_146343 ?auto_146344 ) ( CLEAR ?auto_146343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146342 ?auto_146343 )
      ( MAKE-7PILE ?auto_146342 ?auto_146343 ?auto_146344 ?auto_146345 ?auto_146346 ?auto_146347 ?auto_146348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146357 - BLOCK
      ?auto_146358 - BLOCK
      ?auto_146359 - BLOCK
      ?auto_146360 - BLOCK
      ?auto_146361 - BLOCK
      ?auto_146362 - BLOCK
      ?auto_146363 - BLOCK
    )
    :vars
    (
      ?auto_146364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146363 ?auto_146364 ) ( not ( = ?auto_146357 ?auto_146358 ) ) ( not ( = ?auto_146357 ?auto_146359 ) ) ( not ( = ?auto_146357 ?auto_146360 ) ) ( not ( = ?auto_146357 ?auto_146361 ) ) ( not ( = ?auto_146357 ?auto_146362 ) ) ( not ( = ?auto_146357 ?auto_146363 ) ) ( not ( = ?auto_146357 ?auto_146364 ) ) ( not ( = ?auto_146358 ?auto_146359 ) ) ( not ( = ?auto_146358 ?auto_146360 ) ) ( not ( = ?auto_146358 ?auto_146361 ) ) ( not ( = ?auto_146358 ?auto_146362 ) ) ( not ( = ?auto_146358 ?auto_146363 ) ) ( not ( = ?auto_146358 ?auto_146364 ) ) ( not ( = ?auto_146359 ?auto_146360 ) ) ( not ( = ?auto_146359 ?auto_146361 ) ) ( not ( = ?auto_146359 ?auto_146362 ) ) ( not ( = ?auto_146359 ?auto_146363 ) ) ( not ( = ?auto_146359 ?auto_146364 ) ) ( not ( = ?auto_146360 ?auto_146361 ) ) ( not ( = ?auto_146360 ?auto_146362 ) ) ( not ( = ?auto_146360 ?auto_146363 ) ) ( not ( = ?auto_146360 ?auto_146364 ) ) ( not ( = ?auto_146361 ?auto_146362 ) ) ( not ( = ?auto_146361 ?auto_146363 ) ) ( not ( = ?auto_146361 ?auto_146364 ) ) ( not ( = ?auto_146362 ?auto_146363 ) ) ( not ( = ?auto_146362 ?auto_146364 ) ) ( not ( = ?auto_146363 ?auto_146364 ) ) ( ON ?auto_146362 ?auto_146363 ) ( ON ?auto_146361 ?auto_146362 ) ( ON ?auto_146360 ?auto_146361 ) ( ON ?auto_146359 ?auto_146360 ) ( ON ?auto_146358 ?auto_146359 ) ( ON ?auto_146357 ?auto_146358 ) ( CLEAR ?auto_146357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146357 )
      ( MAKE-7PILE ?auto_146357 ?auto_146358 ?auto_146359 ?auto_146360 ?auto_146361 ?auto_146362 ?auto_146363 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146372 - BLOCK
      ?auto_146373 - BLOCK
      ?auto_146374 - BLOCK
      ?auto_146375 - BLOCK
      ?auto_146376 - BLOCK
      ?auto_146377 - BLOCK
      ?auto_146378 - BLOCK
    )
    :vars
    (
      ?auto_146379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146378 ?auto_146379 ) ( not ( = ?auto_146372 ?auto_146373 ) ) ( not ( = ?auto_146372 ?auto_146374 ) ) ( not ( = ?auto_146372 ?auto_146375 ) ) ( not ( = ?auto_146372 ?auto_146376 ) ) ( not ( = ?auto_146372 ?auto_146377 ) ) ( not ( = ?auto_146372 ?auto_146378 ) ) ( not ( = ?auto_146372 ?auto_146379 ) ) ( not ( = ?auto_146373 ?auto_146374 ) ) ( not ( = ?auto_146373 ?auto_146375 ) ) ( not ( = ?auto_146373 ?auto_146376 ) ) ( not ( = ?auto_146373 ?auto_146377 ) ) ( not ( = ?auto_146373 ?auto_146378 ) ) ( not ( = ?auto_146373 ?auto_146379 ) ) ( not ( = ?auto_146374 ?auto_146375 ) ) ( not ( = ?auto_146374 ?auto_146376 ) ) ( not ( = ?auto_146374 ?auto_146377 ) ) ( not ( = ?auto_146374 ?auto_146378 ) ) ( not ( = ?auto_146374 ?auto_146379 ) ) ( not ( = ?auto_146375 ?auto_146376 ) ) ( not ( = ?auto_146375 ?auto_146377 ) ) ( not ( = ?auto_146375 ?auto_146378 ) ) ( not ( = ?auto_146375 ?auto_146379 ) ) ( not ( = ?auto_146376 ?auto_146377 ) ) ( not ( = ?auto_146376 ?auto_146378 ) ) ( not ( = ?auto_146376 ?auto_146379 ) ) ( not ( = ?auto_146377 ?auto_146378 ) ) ( not ( = ?auto_146377 ?auto_146379 ) ) ( not ( = ?auto_146378 ?auto_146379 ) ) ( ON ?auto_146377 ?auto_146378 ) ( ON ?auto_146376 ?auto_146377 ) ( ON ?auto_146375 ?auto_146376 ) ( ON ?auto_146374 ?auto_146375 ) ( ON ?auto_146373 ?auto_146374 ) ( ON ?auto_146372 ?auto_146373 ) ( CLEAR ?auto_146372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146372 )
      ( MAKE-7PILE ?auto_146372 ?auto_146373 ?auto_146374 ?auto_146375 ?auto_146376 ?auto_146377 ?auto_146378 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146388 - BLOCK
      ?auto_146389 - BLOCK
      ?auto_146390 - BLOCK
      ?auto_146391 - BLOCK
      ?auto_146392 - BLOCK
      ?auto_146393 - BLOCK
      ?auto_146394 - BLOCK
      ?auto_146395 - BLOCK
    )
    :vars
    (
      ?auto_146396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146394 ) ( ON ?auto_146395 ?auto_146396 ) ( CLEAR ?auto_146395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146388 ) ( ON ?auto_146389 ?auto_146388 ) ( ON ?auto_146390 ?auto_146389 ) ( ON ?auto_146391 ?auto_146390 ) ( ON ?auto_146392 ?auto_146391 ) ( ON ?auto_146393 ?auto_146392 ) ( ON ?auto_146394 ?auto_146393 ) ( not ( = ?auto_146388 ?auto_146389 ) ) ( not ( = ?auto_146388 ?auto_146390 ) ) ( not ( = ?auto_146388 ?auto_146391 ) ) ( not ( = ?auto_146388 ?auto_146392 ) ) ( not ( = ?auto_146388 ?auto_146393 ) ) ( not ( = ?auto_146388 ?auto_146394 ) ) ( not ( = ?auto_146388 ?auto_146395 ) ) ( not ( = ?auto_146388 ?auto_146396 ) ) ( not ( = ?auto_146389 ?auto_146390 ) ) ( not ( = ?auto_146389 ?auto_146391 ) ) ( not ( = ?auto_146389 ?auto_146392 ) ) ( not ( = ?auto_146389 ?auto_146393 ) ) ( not ( = ?auto_146389 ?auto_146394 ) ) ( not ( = ?auto_146389 ?auto_146395 ) ) ( not ( = ?auto_146389 ?auto_146396 ) ) ( not ( = ?auto_146390 ?auto_146391 ) ) ( not ( = ?auto_146390 ?auto_146392 ) ) ( not ( = ?auto_146390 ?auto_146393 ) ) ( not ( = ?auto_146390 ?auto_146394 ) ) ( not ( = ?auto_146390 ?auto_146395 ) ) ( not ( = ?auto_146390 ?auto_146396 ) ) ( not ( = ?auto_146391 ?auto_146392 ) ) ( not ( = ?auto_146391 ?auto_146393 ) ) ( not ( = ?auto_146391 ?auto_146394 ) ) ( not ( = ?auto_146391 ?auto_146395 ) ) ( not ( = ?auto_146391 ?auto_146396 ) ) ( not ( = ?auto_146392 ?auto_146393 ) ) ( not ( = ?auto_146392 ?auto_146394 ) ) ( not ( = ?auto_146392 ?auto_146395 ) ) ( not ( = ?auto_146392 ?auto_146396 ) ) ( not ( = ?auto_146393 ?auto_146394 ) ) ( not ( = ?auto_146393 ?auto_146395 ) ) ( not ( = ?auto_146393 ?auto_146396 ) ) ( not ( = ?auto_146394 ?auto_146395 ) ) ( not ( = ?auto_146394 ?auto_146396 ) ) ( not ( = ?auto_146395 ?auto_146396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146395 ?auto_146396 )
      ( !STACK ?auto_146395 ?auto_146394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146405 - BLOCK
      ?auto_146406 - BLOCK
      ?auto_146407 - BLOCK
      ?auto_146408 - BLOCK
      ?auto_146409 - BLOCK
      ?auto_146410 - BLOCK
      ?auto_146411 - BLOCK
      ?auto_146412 - BLOCK
    )
    :vars
    (
      ?auto_146413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146411 ) ( ON ?auto_146412 ?auto_146413 ) ( CLEAR ?auto_146412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146405 ) ( ON ?auto_146406 ?auto_146405 ) ( ON ?auto_146407 ?auto_146406 ) ( ON ?auto_146408 ?auto_146407 ) ( ON ?auto_146409 ?auto_146408 ) ( ON ?auto_146410 ?auto_146409 ) ( ON ?auto_146411 ?auto_146410 ) ( not ( = ?auto_146405 ?auto_146406 ) ) ( not ( = ?auto_146405 ?auto_146407 ) ) ( not ( = ?auto_146405 ?auto_146408 ) ) ( not ( = ?auto_146405 ?auto_146409 ) ) ( not ( = ?auto_146405 ?auto_146410 ) ) ( not ( = ?auto_146405 ?auto_146411 ) ) ( not ( = ?auto_146405 ?auto_146412 ) ) ( not ( = ?auto_146405 ?auto_146413 ) ) ( not ( = ?auto_146406 ?auto_146407 ) ) ( not ( = ?auto_146406 ?auto_146408 ) ) ( not ( = ?auto_146406 ?auto_146409 ) ) ( not ( = ?auto_146406 ?auto_146410 ) ) ( not ( = ?auto_146406 ?auto_146411 ) ) ( not ( = ?auto_146406 ?auto_146412 ) ) ( not ( = ?auto_146406 ?auto_146413 ) ) ( not ( = ?auto_146407 ?auto_146408 ) ) ( not ( = ?auto_146407 ?auto_146409 ) ) ( not ( = ?auto_146407 ?auto_146410 ) ) ( not ( = ?auto_146407 ?auto_146411 ) ) ( not ( = ?auto_146407 ?auto_146412 ) ) ( not ( = ?auto_146407 ?auto_146413 ) ) ( not ( = ?auto_146408 ?auto_146409 ) ) ( not ( = ?auto_146408 ?auto_146410 ) ) ( not ( = ?auto_146408 ?auto_146411 ) ) ( not ( = ?auto_146408 ?auto_146412 ) ) ( not ( = ?auto_146408 ?auto_146413 ) ) ( not ( = ?auto_146409 ?auto_146410 ) ) ( not ( = ?auto_146409 ?auto_146411 ) ) ( not ( = ?auto_146409 ?auto_146412 ) ) ( not ( = ?auto_146409 ?auto_146413 ) ) ( not ( = ?auto_146410 ?auto_146411 ) ) ( not ( = ?auto_146410 ?auto_146412 ) ) ( not ( = ?auto_146410 ?auto_146413 ) ) ( not ( = ?auto_146411 ?auto_146412 ) ) ( not ( = ?auto_146411 ?auto_146413 ) ) ( not ( = ?auto_146412 ?auto_146413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146412 ?auto_146413 )
      ( !STACK ?auto_146412 ?auto_146411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146422 - BLOCK
      ?auto_146423 - BLOCK
      ?auto_146424 - BLOCK
      ?auto_146425 - BLOCK
      ?auto_146426 - BLOCK
      ?auto_146427 - BLOCK
      ?auto_146428 - BLOCK
      ?auto_146429 - BLOCK
    )
    :vars
    (
      ?auto_146430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146429 ?auto_146430 ) ( ON-TABLE ?auto_146422 ) ( ON ?auto_146423 ?auto_146422 ) ( ON ?auto_146424 ?auto_146423 ) ( ON ?auto_146425 ?auto_146424 ) ( ON ?auto_146426 ?auto_146425 ) ( ON ?auto_146427 ?auto_146426 ) ( not ( = ?auto_146422 ?auto_146423 ) ) ( not ( = ?auto_146422 ?auto_146424 ) ) ( not ( = ?auto_146422 ?auto_146425 ) ) ( not ( = ?auto_146422 ?auto_146426 ) ) ( not ( = ?auto_146422 ?auto_146427 ) ) ( not ( = ?auto_146422 ?auto_146428 ) ) ( not ( = ?auto_146422 ?auto_146429 ) ) ( not ( = ?auto_146422 ?auto_146430 ) ) ( not ( = ?auto_146423 ?auto_146424 ) ) ( not ( = ?auto_146423 ?auto_146425 ) ) ( not ( = ?auto_146423 ?auto_146426 ) ) ( not ( = ?auto_146423 ?auto_146427 ) ) ( not ( = ?auto_146423 ?auto_146428 ) ) ( not ( = ?auto_146423 ?auto_146429 ) ) ( not ( = ?auto_146423 ?auto_146430 ) ) ( not ( = ?auto_146424 ?auto_146425 ) ) ( not ( = ?auto_146424 ?auto_146426 ) ) ( not ( = ?auto_146424 ?auto_146427 ) ) ( not ( = ?auto_146424 ?auto_146428 ) ) ( not ( = ?auto_146424 ?auto_146429 ) ) ( not ( = ?auto_146424 ?auto_146430 ) ) ( not ( = ?auto_146425 ?auto_146426 ) ) ( not ( = ?auto_146425 ?auto_146427 ) ) ( not ( = ?auto_146425 ?auto_146428 ) ) ( not ( = ?auto_146425 ?auto_146429 ) ) ( not ( = ?auto_146425 ?auto_146430 ) ) ( not ( = ?auto_146426 ?auto_146427 ) ) ( not ( = ?auto_146426 ?auto_146428 ) ) ( not ( = ?auto_146426 ?auto_146429 ) ) ( not ( = ?auto_146426 ?auto_146430 ) ) ( not ( = ?auto_146427 ?auto_146428 ) ) ( not ( = ?auto_146427 ?auto_146429 ) ) ( not ( = ?auto_146427 ?auto_146430 ) ) ( not ( = ?auto_146428 ?auto_146429 ) ) ( not ( = ?auto_146428 ?auto_146430 ) ) ( not ( = ?auto_146429 ?auto_146430 ) ) ( CLEAR ?auto_146427 ) ( ON ?auto_146428 ?auto_146429 ) ( CLEAR ?auto_146428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146422 ?auto_146423 ?auto_146424 ?auto_146425 ?auto_146426 ?auto_146427 ?auto_146428 )
      ( MAKE-8PILE ?auto_146422 ?auto_146423 ?auto_146424 ?auto_146425 ?auto_146426 ?auto_146427 ?auto_146428 ?auto_146429 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146439 - BLOCK
      ?auto_146440 - BLOCK
      ?auto_146441 - BLOCK
      ?auto_146442 - BLOCK
      ?auto_146443 - BLOCK
      ?auto_146444 - BLOCK
      ?auto_146445 - BLOCK
      ?auto_146446 - BLOCK
    )
    :vars
    (
      ?auto_146447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146446 ?auto_146447 ) ( ON-TABLE ?auto_146439 ) ( ON ?auto_146440 ?auto_146439 ) ( ON ?auto_146441 ?auto_146440 ) ( ON ?auto_146442 ?auto_146441 ) ( ON ?auto_146443 ?auto_146442 ) ( ON ?auto_146444 ?auto_146443 ) ( not ( = ?auto_146439 ?auto_146440 ) ) ( not ( = ?auto_146439 ?auto_146441 ) ) ( not ( = ?auto_146439 ?auto_146442 ) ) ( not ( = ?auto_146439 ?auto_146443 ) ) ( not ( = ?auto_146439 ?auto_146444 ) ) ( not ( = ?auto_146439 ?auto_146445 ) ) ( not ( = ?auto_146439 ?auto_146446 ) ) ( not ( = ?auto_146439 ?auto_146447 ) ) ( not ( = ?auto_146440 ?auto_146441 ) ) ( not ( = ?auto_146440 ?auto_146442 ) ) ( not ( = ?auto_146440 ?auto_146443 ) ) ( not ( = ?auto_146440 ?auto_146444 ) ) ( not ( = ?auto_146440 ?auto_146445 ) ) ( not ( = ?auto_146440 ?auto_146446 ) ) ( not ( = ?auto_146440 ?auto_146447 ) ) ( not ( = ?auto_146441 ?auto_146442 ) ) ( not ( = ?auto_146441 ?auto_146443 ) ) ( not ( = ?auto_146441 ?auto_146444 ) ) ( not ( = ?auto_146441 ?auto_146445 ) ) ( not ( = ?auto_146441 ?auto_146446 ) ) ( not ( = ?auto_146441 ?auto_146447 ) ) ( not ( = ?auto_146442 ?auto_146443 ) ) ( not ( = ?auto_146442 ?auto_146444 ) ) ( not ( = ?auto_146442 ?auto_146445 ) ) ( not ( = ?auto_146442 ?auto_146446 ) ) ( not ( = ?auto_146442 ?auto_146447 ) ) ( not ( = ?auto_146443 ?auto_146444 ) ) ( not ( = ?auto_146443 ?auto_146445 ) ) ( not ( = ?auto_146443 ?auto_146446 ) ) ( not ( = ?auto_146443 ?auto_146447 ) ) ( not ( = ?auto_146444 ?auto_146445 ) ) ( not ( = ?auto_146444 ?auto_146446 ) ) ( not ( = ?auto_146444 ?auto_146447 ) ) ( not ( = ?auto_146445 ?auto_146446 ) ) ( not ( = ?auto_146445 ?auto_146447 ) ) ( not ( = ?auto_146446 ?auto_146447 ) ) ( CLEAR ?auto_146444 ) ( ON ?auto_146445 ?auto_146446 ) ( CLEAR ?auto_146445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146439 ?auto_146440 ?auto_146441 ?auto_146442 ?auto_146443 ?auto_146444 ?auto_146445 )
      ( MAKE-8PILE ?auto_146439 ?auto_146440 ?auto_146441 ?auto_146442 ?auto_146443 ?auto_146444 ?auto_146445 ?auto_146446 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146456 - BLOCK
      ?auto_146457 - BLOCK
      ?auto_146458 - BLOCK
      ?auto_146459 - BLOCK
      ?auto_146460 - BLOCK
      ?auto_146461 - BLOCK
      ?auto_146462 - BLOCK
      ?auto_146463 - BLOCK
    )
    :vars
    (
      ?auto_146464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146463 ?auto_146464 ) ( ON-TABLE ?auto_146456 ) ( ON ?auto_146457 ?auto_146456 ) ( ON ?auto_146458 ?auto_146457 ) ( ON ?auto_146459 ?auto_146458 ) ( ON ?auto_146460 ?auto_146459 ) ( not ( = ?auto_146456 ?auto_146457 ) ) ( not ( = ?auto_146456 ?auto_146458 ) ) ( not ( = ?auto_146456 ?auto_146459 ) ) ( not ( = ?auto_146456 ?auto_146460 ) ) ( not ( = ?auto_146456 ?auto_146461 ) ) ( not ( = ?auto_146456 ?auto_146462 ) ) ( not ( = ?auto_146456 ?auto_146463 ) ) ( not ( = ?auto_146456 ?auto_146464 ) ) ( not ( = ?auto_146457 ?auto_146458 ) ) ( not ( = ?auto_146457 ?auto_146459 ) ) ( not ( = ?auto_146457 ?auto_146460 ) ) ( not ( = ?auto_146457 ?auto_146461 ) ) ( not ( = ?auto_146457 ?auto_146462 ) ) ( not ( = ?auto_146457 ?auto_146463 ) ) ( not ( = ?auto_146457 ?auto_146464 ) ) ( not ( = ?auto_146458 ?auto_146459 ) ) ( not ( = ?auto_146458 ?auto_146460 ) ) ( not ( = ?auto_146458 ?auto_146461 ) ) ( not ( = ?auto_146458 ?auto_146462 ) ) ( not ( = ?auto_146458 ?auto_146463 ) ) ( not ( = ?auto_146458 ?auto_146464 ) ) ( not ( = ?auto_146459 ?auto_146460 ) ) ( not ( = ?auto_146459 ?auto_146461 ) ) ( not ( = ?auto_146459 ?auto_146462 ) ) ( not ( = ?auto_146459 ?auto_146463 ) ) ( not ( = ?auto_146459 ?auto_146464 ) ) ( not ( = ?auto_146460 ?auto_146461 ) ) ( not ( = ?auto_146460 ?auto_146462 ) ) ( not ( = ?auto_146460 ?auto_146463 ) ) ( not ( = ?auto_146460 ?auto_146464 ) ) ( not ( = ?auto_146461 ?auto_146462 ) ) ( not ( = ?auto_146461 ?auto_146463 ) ) ( not ( = ?auto_146461 ?auto_146464 ) ) ( not ( = ?auto_146462 ?auto_146463 ) ) ( not ( = ?auto_146462 ?auto_146464 ) ) ( not ( = ?auto_146463 ?auto_146464 ) ) ( ON ?auto_146462 ?auto_146463 ) ( CLEAR ?auto_146460 ) ( ON ?auto_146461 ?auto_146462 ) ( CLEAR ?auto_146461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146456 ?auto_146457 ?auto_146458 ?auto_146459 ?auto_146460 ?auto_146461 )
      ( MAKE-8PILE ?auto_146456 ?auto_146457 ?auto_146458 ?auto_146459 ?auto_146460 ?auto_146461 ?auto_146462 ?auto_146463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146473 - BLOCK
      ?auto_146474 - BLOCK
      ?auto_146475 - BLOCK
      ?auto_146476 - BLOCK
      ?auto_146477 - BLOCK
      ?auto_146478 - BLOCK
      ?auto_146479 - BLOCK
      ?auto_146480 - BLOCK
    )
    :vars
    (
      ?auto_146481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146480 ?auto_146481 ) ( ON-TABLE ?auto_146473 ) ( ON ?auto_146474 ?auto_146473 ) ( ON ?auto_146475 ?auto_146474 ) ( ON ?auto_146476 ?auto_146475 ) ( ON ?auto_146477 ?auto_146476 ) ( not ( = ?auto_146473 ?auto_146474 ) ) ( not ( = ?auto_146473 ?auto_146475 ) ) ( not ( = ?auto_146473 ?auto_146476 ) ) ( not ( = ?auto_146473 ?auto_146477 ) ) ( not ( = ?auto_146473 ?auto_146478 ) ) ( not ( = ?auto_146473 ?auto_146479 ) ) ( not ( = ?auto_146473 ?auto_146480 ) ) ( not ( = ?auto_146473 ?auto_146481 ) ) ( not ( = ?auto_146474 ?auto_146475 ) ) ( not ( = ?auto_146474 ?auto_146476 ) ) ( not ( = ?auto_146474 ?auto_146477 ) ) ( not ( = ?auto_146474 ?auto_146478 ) ) ( not ( = ?auto_146474 ?auto_146479 ) ) ( not ( = ?auto_146474 ?auto_146480 ) ) ( not ( = ?auto_146474 ?auto_146481 ) ) ( not ( = ?auto_146475 ?auto_146476 ) ) ( not ( = ?auto_146475 ?auto_146477 ) ) ( not ( = ?auto_146475 ?auto_146478 ) ) ( not ( = ?auto_146475 ?auto_146479 ) ) ( not ( = ?auto_146475 ?auto_146480 ) ) ( not ( = ?auto_146475 ?auto_146481 ) ) ( not ( = ?auto_146476 ?auto_146477 ) ) ( not ( = ?auto_146476 ?auto_146478 ) ) ( not ( = ?auto_146476 ?auto_146479 ) ) ( not ( = ?auto_146476 ?auto_146480 ) ) ( not ( = ?auto_146476 ?auto_146481 ) ) ( not ( = ?auto_146477 ?auto_146478 ) ) ( not ( = ?auto_146477 ?auto_146479 ) ) ( not ( = ?auto_146477 ?auto_146480 ) ) ( not ( = ?auto_146477 ?auto_146481 ) ) ( not ( = ?auto_146478 ?auto_146479 ) ) ( not ( = ?auto_146478 ?auto_146480 ) ) ( not ( = ?auto_146478 ?auto_146481 ) ) ( not ( = ?auto_146479 ?auto_146480 ) ) ( not ( = ?auto_146479 ?auto_146481 ) ) ( not ( = ?auto_146480 ?auto_146481 ) ) ( ON ?auto_146479 ?auto_146480 ) ( CLEAR ?auto_146477 ) ( ON ?auto_146478 ?auto_146479 ) ( CLEAR ?auto_146478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146473 ?auto_146474 ?auto_146475 ?auto_146476 ?auto_146477 ?auto_146478 )
      ( MAKE-8PILE ?auto_146473 ?auto_146474 ?auto_146475 ?auto_146476 ?auto_146477 ?auto_146478 ?auto_146479 ?auto_146480 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146490 - BLOCK
      ?auto_146491 - BLOCK
      ?auto_146492 - BLOCK
      ?auto_146493 - BLOCK
      ?auto_146494 - BLOCK
      ?auto_146495 - BLOCK
      ?auto_146496 - BLOCK
      ?auto_146497 - BLOCK
    )
    :vars
    (
      ?auto_146498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146497 ?auto_146498 ) ( ON-TABLE ?auto_146490 ) ( ON ?auto_146491 ?auto_146490 ) ( ON ?auto_146492 ?auto_146491 ) ( ON ?auto_146493 ?auto_146492 ) ( not ( = ?auto_146490 ?auto_146491 ) ) ( not ( = ?auto_146490 ?auto_146492 ) ) ( not ( = ?auto_146490 ?auto_146493 ) ) ( not ( = ?auto_146490 ?auto_146494 ) ) ( not ( = ?auto_146490 ?auto_146495 ) ) ( not ( = ?auto_146490 ?auto_146496 ) ) ( not ( = ?auto_146490 ?auto_146497 ) ) ( not ( = ?auto_146490 ?auto_146498 ) ) ( not ( = ?auto_146491 ?auto_146492 ) ) ( not ( = ?auto_146491 ?auto_146493 ) ) ( not ( = ?auto_146491 ?auto_146494 ) ) ( not ( = ?auto_146491 ?auto_146495 ) ) ( not ( = ?auto_146491 ?auto_146496 ) ) ( not ( = ?auto_146491 ?auto_146497 ) ) ( not ( = ?auto_146491 ?auto_146498 ) ) ( not ( = ?auto_146492 ?auto_146493 ) ) ( not ( = ?auto_146492 ?auto_146494 ) ) ( not ( = ?auto_146492 ?auto_146495 ) ) ( not ( = ?auto_146492 ?auto_146496 ) ) ( not ( = ?auto_146492 ?auto_146497 ) ) ( not ( = ?auto_146492 ?auto_146498 ) ) ( not ( = ?auto_146493 ?auto_146494 ) ) ( not ( = ?auto_146493 ?auto_146495 ) ) ( not ( = ?auto_146493 ?auto_146496 ) ) ( not ( = ?auto_146493 ?auto_146497 ) ) ( not ( = ?auto_146493 ?auto_146498 ) ) ( not ( = ?auto_146494 ?auto_146495 ) ) ( not ( = ?auto_146494 ?auto_146496 ) ) ( not ( = ?auto_146494 ?auto_146497 ) ) ( not ( = ?auto_146494 ?auto_146498 ) ) ( not ( = ?auto_146495 ?auto_146496 ) ) ( not ( = ?auto_146495 ?auto_146497 ) ) ( not ( = ?auto_146495 ?auto_146498 ) ) ( not ( = ?auto_146496 ?auto_146497 ) ) ( not ( = ?auto_146496 ?auto_146498 ) ) ( not ( = ?auto_146497 ?auto_146498 ) ) ( ON ?auto_146496 ?auto_146497 ) ( ON ?auto_146495 ?auto_146496 ) ( CLEAR ?auto_146493 ) ( ON ?auto_146494 ?auto_146495 ) ( CLEAR ?auto_146494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146490 ?auto_146491 ?auto_146492 ?auto_146493 ?auto_146494 )
      ( MAKE-8PILE ?auto_146490 ?auto_146491 ?auto_146492 ?auto_146493 ?auto_146494 ?auto_146495 ?auto_146496 ?auto_146497 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146507 - BLOCK
      ?auto_146508 - BLOCK
      ?auto_146509 - BLOCK
      ?auto_146510 - BLOCK
      ?auto_146511 - BLOCK
      ?auto_146512 - BLOCK
      ?auto_146513 - BLOCK
      ?auto_146514 - BLOCK
    )
    :vars
    (
      ?auto_146515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146514 ?auto_146515 ) ( ON-TABLE ?auto_146507 ) ( ON ?auto_146508 ?auto_146507 ) ( ON ?auto_146509 ?auto_146508 ) ( ON ?auto_146510 ?auto_146509 ) ( not ( = ?auto_146507 ?auto_146508 ) ) ( not ( = ?auto_146507 ?auto_146509 ) ) ( not ( = ?auto_146507 ?auto_146510 ) ) ( not ( = ?auto_146507 ?auto_146511 ) ) ( not ( = ?auto_146507 ?auto_146512 ) ) ( not ( = ?auto_146507 ?auto_146513 ) ) ( not ( = ?auto_146507 ?auto_146514 ) ) ( not ( = ?auto_146507 ?auto_146515 ) ) ( not ( = ?auto_146508 ?auto_146509 ) ) ( not ( = ?auto_146508 ?auto_146510 ) ) ( not ( = ?auto_146508 ?auto_146511 ) ) ( not ( = ?auto_146508 ?auto_146512 ) ) ( not ( = ?auto_146508 ?auto_146513 ) ) ( not ( = ?auto_146508 ?auto_146514 ) ) ( not ( = ?auto_146508 ?auto_146515 ) ) ( not ( = ?auto_146509 ?auto_146510 ) ) ( not ( = ?auto_146509 ?auto_146511 ) ) ( not ( = ?auto_146509 ?auto_146512 ) ) ( not ( = ?auto_146509 ?auto_146513 ) ) ( not ( = ?auto_146509 ?auto_146514 ) ) ( not ( = ?auto_146509 ?auto_146515 ) ) ( not ( = ?auto_146510 ?auto_146511 ) ) ( not ( = ?auto_146510 ?auto_146512 ) ) ( not ( = ?auto_146510 ?auto_146513 ) ) ( not ( = ?auto_146510 ?auto_146514 ) ) ( not ( = ?auto_146510 ?auto_146515 ) ) ( not ( = ?auto_146511 ?auto_146512 ) ) ( not ( = ?auto_146511 ?auto_146513 ) ) ( not ( = ?auto_146511 ?auto_146514 ) ) ( not ( = ?auto_146511 ?auto_146515 ) ) ( not ( = ?auto_146512 ?auto_146513 ) ) ( not ( = ?auto_146512 ?auto_146514 ) ) ( not ( = ?auto_146512 ?auto_146515 ) ) ( not ( = ?auto_146513 ?auto_146514 ) ) ( not ( = ?auto_146513 ?auto_146515 ) ) ( not ( = ?auto_146514 ?auto_146515 ) ) ( ON ?auto_146513 ?auto_146514 ) ( ON ?auto_146512 ?auto_146513 ) ( CLEAR ?auto_146510 ) ( ON ?auto_146511 ?auto_146512 ) ( CLEAR ?auto_146511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146507 ?auto_146508 ?auto_146509 ?auto_146510 ?auto_146511 )
      ( MAKE-8PILE ?auto_146507 ?auto_146508 ?auto_146509 ?auto_146510 ?auto_146511 ?auto_146512 ?auto_146513 ?auto_146514 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146524 - BLOCK
      ?auto_146525 - BLOCK
      ?auto_146526 - BLOCK
      ?auto_146527 - BLOCK
      ?auto_146528 - BLOCK
      ?auto_146529 - BLOCK
      ?auto_146530 - BLOCK
      ?auto_146531 - BLOCK
    )
    :vars
    (
      ?auto_146532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146531 ?auto_146532 ) ( ON-TABLE ?auto_146524 ) ( ON ?auto_146525 ?auto_146524 ) ( ON ?auto_146526 ?auto_146525 ) ( not ( = ?auto_146524 ?auto_146525 ) ) ( not ( = ?auto_146524 ?auto_146526 ) ) ( not ( = ?auto_146524 ?auto_146527 ) ) ( not ( = ?auto_146524 ?auto_146528 ) ) ( not ( = ?auto_146524 ?auto_146529 ) ) ( not ( = ?auto_146524 ?auto_146530 ) ) ( not ( = ?auto_146524 ?auto_146531 ) ) ( not ( = ?auto_146524 ?auto_146532 ) ) ( not ( = ?auto_146525 ?auto_146526 ) ) ( not ( = ?auto_146525 ?auto_146527 ) ) ( not ( = ?auto_146525 ?auto_146528 ) ) ( not ( = ?auto_146525 ?auto_146529 ) ) ( not ( = ?auto_146525 ?auto_146530 ) ) ( not ( = ?auto_146525 ?auto_146531 ) ) ( not ( = ?auto_146525 ?auto_146532 ) ) ( not ( = ?auto_146526 ?auto_146527 ) ) ( not ( = ?auto_146526 ?auto_146528 ) ) ( not ( = ?auto_146526 ?auto_146529 ) ) ( not ( = ?auto_146526 ?auto_146530 ) ) ( not ( = ?auto_146526 ?auto_146531 ) ) ( not ( = ?auto_146526 ?auto_146532 ) ) ( not ( = ?auto_146527 ?auto_146528 ) ) ( not ( = ?auto_146527 ?auto_146529 ) ) ( not ( = ?auto_146527 ?auto_146530 ) ) ( not ( = ?auto_146527 ?auto_146531 ) ) ( not ( = ?auto_146527 ?auto_146532 ) ) ( not ( = ?auto_146528 ?auto_146529 ) ) ( not ( = ?auto_146528 ?auto_146530 ) ) ( not ( = ?auto_146528 ?auto_146531 ) ) ( not ( = ?auto_146528 ?auto_146532 ) ) ( not ( = ?auto_146529 ?auto_146530 ) ) ( not ( = ?auto_146529 ?auto_146531 ) ) ( not ( = ?auto_146529 ?auto_146532 ) ) ( not ( = ?auto_146530 ?auto_146531 ) ) ( not ( = ?auto_146530 ?auto_146532 ) ) ( not ( = ?auto_146531 ?auto_146532 ) ) ( ON ?auto_146530 ?auto_146531 ) ( ON ?auto_146529 ?auto_146530 ) ( ON ?auto_146528 ?auto_146529 ) ( CLEAR ?auto_146526 ) ( ON ?auto_146527 ?auto_146528 ) ( CLEAR ?auto_146527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146524 ?auto_146525 ?auto_146526 ?auto_146527 )
      ( MAKE-8PILE ?auto_146524 ?auto_146525 ?auto_146526 ?auto_146527 ?auto_146528 ?auto_146529 ?auto_146530 ?auto_146531 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146541 - BLOCK
      ?auto_146542 - BLOCK
      ?auto_146543 - BLOCK
      ?auto_146544 - BLOCK
      ?auto_146545 - BLOCK
      ?auto_146546 - BLOCK
      ?auto_146547 - BLOCK
      ?auto_146548 - BLOCK
    )
    :vars
    (
      ?auto_146549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146548 ?auto_146549 ) ( ON-TABLE ?auto_146541 ) ( ON ?auto_146542 ?auto_146541 ) ( ON ?auto_146543 ?auto_146542 ) ( not ( = ?auto_146541 ?auto_146542 ) ) ( not ( = ?auto_146541 ?auto_146543 ) ) ( not ( = ?auto_146541 ?auto_146544 ) ) ( not ( = ?auto_146541 ?auto_146545 ) ) ( not ( = ?auto_146541 ?auto_146546 ) ) ( not ( = ?auto_146541 ?auto_146547 ) ) ( not ( = ?auto_146541 ?auto_146548 ) ) ( not ( = ?auto_146541 ?auto_146549 ) ) ( not ( = ?auto_146542 ?auto_146543 ) ) ( not ( = ?auto_146542 ?auto_146544 ) ) ( not ( = ?auto_146542 ?auto_146545 ) ) ( not ( = ?auto_146542 ?auto_146546 ) ) ( not ( = ?auto_146542 ?auto_146547 ) ) ( not ( = ?auto_146542 ?auto_146548 ) ) ( not ( = ?auto_146542 ?auto_146549 ) ) ( not ( = ?auto_146543 ?auto_146544 ) ) ( not ( = ?auto_146543 ?auto_146545 ) ) ( not ( = ?auto_146543 ?auto_146546 ) ) ( not ( = ?auto_146543 ?auto_146547 ) ) ( not ( = ?auto_146543 ?auto_146548 ) ) ( not ( = ?auto_146543 ?auto_146549 ) ) ( not ( = ?auto_146544 ?auto_146545 ) ) ( not ( = ?auto_146544 ?auto_146546 ) ) ( not ( = ?auto_146544 ?auto_146547 ) ) ( not ( = ?auto_146544 ?auto_146548 ) ) ( not ( = ?auto_146544 ?auto_146549 ) ) ( not ( = ?auto_146545 ?auto_146546 ) ) ( not ( = ?auto_146545 ?auto_146547 ) ) ( not ( = ?auto_146545 ?auto_146548 ) ) ( not ( = ?auto_146545 ?auto_146549 ) ) ( not ( = ?auto_146546 ?auto_146547 ) ) ( not ( = ?auto_146546 ?auto_146548 ) ) ( not ( = ?auto_146546 ?auto_146549 ) ) ( not ( = ?auto_146547 ?auto_146548 ) ) ( not ( = ?auto_146547 ?auto_146549 ) ) ( not ( = ?auto_146548 ?auto_146549 ) ) ( ON ?auto_146547 ?auto_146548 ) ( ON ?auto_146546 ?auto_146547 ) ( ON ?auto_146545 ?auto_146546 ) ( CLEAR ?auto_146543 ) ( ON ?auto_146544 ?auto_146545 ) ( CLEAR ?auto_146544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146541 ?auto_146542 ?auto_146543 ?auto_146544 )
      ( MAKE-8PILE ?auto_146541 ?auto_146542 ?auto_146543 ?auto_146544 ?auto_146545 ?auto_146546 ?auto_146547 ?auto_146548 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146558 - BLOCK
      ?auto_146559 - BLOCK
      ?auto_146560 - BLOCK
      ?auto_146561 - BLOCK
      ?auto_146562 - BLOCK
      ?auto_146563 - BLOCK
      ?auto_146564 - BLOCK
      ?auto_146565 - BLOCK
    )
    :vars
    (
      ?auto_146566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146565 ?auto_146566 ) ( ON-TABLE ?auto_146558 ) ( ON ?auto_146559 ?auto_146558 ) ( not ( = ?auto_146558 ?auto_146559 ) ) ( not ( = ?auto_146558 ?auto_146560 ) ) ( not ( = ?auto_146558 ?auto_146561 ) ) ( not ( = ?auto_146558 ?auto_146562 ) ) ( not ( = ?auto_146558 ?auto_146563 ) ) ( not ( = ?auto_146558 ?auto_146564 ) ) ( not ( = ?auto_146558 ?auto_146565 ) ) ( not ( = ?auto_146558 ?auto_146566 ) ) ( not ( = ?auto_146559 ?auto_146560 ) ) ( not ( = ?auto_146559 ?auto_146561 ) ) ( not ( = ?auto_146559 ?auto_146562 ) ) ( not ( = ?auto_146559 ?auto_146563 ) ) ( not ( = ?auto_146559 ?auto_146564 ) ) ( not ( = ?auto_146559 ?auto_146565 ) ) ( not ( = ?auto_146559 ?auto_146566 ) ) ( not ( = ?auto_146560 ?auto_146561 ) ) ( not ( = ?auto_146560 ?auto_146562 ) ) ( not ( = ?auto_146560 ?auto_146563 ) ) ( not ( = ?auto_146560 ?auto_146564 ) ) ( not ( = ?auto_146560 ?auto_146565 ) ) ( not ( = ?auto_146560 ?auto_146566 ) ) ( not ( = ?auto_146561 ?auto_146562 ) ) ( not ( = ?auto_146561 ?auto_146563 ) ) ( not ( = ?auto_146561 ?auto_146564 ) ) ( not ( = ?auto_146561 ?auto_146565 ) ) ( not ( = ?auto_146561 ?auto_146566 ) ) ( not ( = ?auto_146562 ?auto_146563 ) ) ( not ( = ?auto_146562 ?auto_146564 ) ) ( not ( = ?auto_146562 ?auto_146565 ) ) ( not ( = ?auto_146562 ?auto_146566 ) ) ( not ( = ?auto_146563 ?auto_146564 ) ) ( not ( = ?auto_146563 ?auto_146565 ) ) ( not ( = ?auto_146563 ?auto_146566 ) ) ( not ( = ?auto_146564 ?auto_146565 ) ) ( not ( = ?auto_146564 ?auto_146566 ) ) ( not ( = ?auto_146565 ?auto_146566 ) ) ( ON ?auto_146564 ?auto_146565 ) ( ON ?auto_146563 ?auto_146564 ) ( ON ?auto_146562 ?auto_146563 ) ( ON ?auto_146561 ?auto_146562 ) ( CLEAR ?auto_146559 ) ( ON ?auto_146560 ?auto_146561 ) ( CLEAR ?auto_146560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146558 ?auto_146559 ?auto_146560 )
      ( MAKE-8PILE ?auto_146558 ?auto_146559 ?auto_146560 ?auto_146561 ?auto_146562 ?auto_146563 ?auto_146564 ?auto_146565 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146575 - BLOCK
      ?auto_146576 - BLOCK
      ?auto_146577 - BLOCK
      ?auto_146578 - BLOCK
      ?auto_146579 - BLOCK
      ?auto_146580 - BLOCK
      ?auto_146581 - BLOCK
      ?auto_146582 - BLOCK
    )
    :vars
    (
      ?auto_146583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146582 ?auto_146583 ) ( ON-TABLE ?auto_146575 ) ( ON ?auto_146576 ?auto_146575 ) ( not ( = ?auto_146575 ?auto_146576 ) ) ( not ( = ?auto_146575 ?auto_146577 ) ) ( not ( = ?auto_146575 ?auto_146578 ) ) ( not ( = ?auto_146575 ?auto_146579 ) ) ( not ( = ?auto_146575 ?auto_146580 ) ) ( not ( = ?auto_146575 ?auto_146581 ) ) ( not ( = ?auto_146575 ?auto_146582 ) ) ( not ( = ?auto_146575 ?auto_146583 ) ) ( not ( = ?auto_146576 ?auto_146577 ) ) ( not ( = ?auto_146576 ?auto_146578 ) ) ( not ( = ?auto_146576 ?auto_146579 ) ) ( not ( = ?auto_146576 ?auto_146580 ) ) ( not ( = ?auto_146576 ?auto_146581 ) ) ( not ( = ?auto_146576 ?auto_146582 ) ) ( not ( = ?auto_146576 ?auto_146583 ) ) ( not ( = ?auto_146577 ?auto_146578 ) ) ( not ( = ?auto_146577 ?auto_146579 ) ) ( not ( = ?auto_146577 ?auto_146580 ) ) ( not ( = ?auto_146577 ?auto_146581 ) ) ( not ( = ?auto_146577 ?auto_146582 ) ) ( not ( = ?auto_146577 ?auto_146583 ) ) ( not ( = ?auto_146578 ?auto_146579 ) ) ( not ( = ?auto_146578 ?auto_146580 ) ) ( not ( = ?auto_146578 ?auto_146581 ) ) ( not ( = ?auto_146578 ?auto_146582 ) ) ( not ( = ?auto_146578 ?auto_146583 ) ) ( not ( = ?auto_146579 ?auto_146580 ) ) ( not ( = ?auto_146579 ?auto_146581 ) ) ( not ( = ?auto_146579 ?auto_146582 ) ) ( not ( = ?auto_146579 ?auto_146583 ) ) ( not ( = ?auto_146580 ?auto_146581 ) ) ( not ( = ?auto_146580 ?auto_146582 ) ) ( not ( = ?auto_146580 ?auto_146583 ) ) ( not ( = ?auto_146581 ?auto_146582 ) ) ( not ( = ?auto_146581 ?auto_146583 ) ) ( not ( = ?auto_146582 ?auto_146583 ) ) ( ON ?auto_146581 ?auto_146582 ) ( ON ?auto_146580 ?auto_146581 ) ( ON ?auto_146579 ?auto_146580 ) ( ON ?auto_146578 ?auto_146579 ) ( CLEAR ?auto_146576 ) ( ON ?auto_146577 ?auto_146578 ) ( CLEAR ?auto_146577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146575 ?auto_146576 ?auto_146577 )
      ( MAKE-8PILE ?auto_146575 ?auto_146576 ?auto_146577 ?auto_146578 ?auto_146579 ?auto_146580 ?auto_146581 ?auto_146582 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146592 - BLOCK
      ?auto_146593 - BLOCK
      ?auto_146594 - BLOCK
      ?auto_146595 - BLOCK
      ?auto_146596 - BLOCK
      ?auto_146597 - BLOCK
      ?auto_146598 - BLOCK
      ?auto_146599 - BLOCK
    )
    :vars
    (
      ?auto_146600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146599 ?auto_146600 ) ( ON-TABLE ?auto_146592 ) ( not ( = ?auto_146592 ?auto_146593 ) ) ( not ( = ?auto_146592 ?auto_146594 ) ) ( not ( = ?auto_146592 ?auto_146595 ) ) ( not ( = ?auto_146592 ?auto_146596 ) ) ( not ( = ?auto_146592 ?auto_146597 ) ) ( not ( = ?auto_146592 ?auto_146598 ) ) ( not ( = ?auto_146592 ?auto_146599 ) ) ( not ( = ?auto_146592 ?auto_146600 ) ) ( not ( = ?auto_146593 ?auto_146594 ) ) ( not ( = ?auto_146593 ?auto_146595 ) ) ( not ( = ?auto_146593 ?auto_146596 ) ) ( not ( = ?auto_146593 ?auto_146597 ) ) ( not ( = ?auto_146593 ?auto_146598 ) ) ( not ( = ?auto_146593 ?auto_146599 ) ) ( not ( = ?auto_146593 ?auto_146600 ) ) ( not ( = ?auto_146594 ?auto_146595 ) ) ( not ( = ?auto_146594 ?auto_146596 ) ) ( not ( = ?auto_146594 ?auto_146597 ) ) ( not ( = ?auto_146594 ?auto_146598 ) ) ( not ( = ?auto_146594 ?auto_146599 ) ) ( not ( = ?auto_146594 ?auto_146600 ) ) ( not ( = ?auto_146595 ?auto_146596 ) ) ( not ( = ?auto_146595 ?auto_146597 ) ) ( not ( = ?auto_146595 ?auto_146598 ) ) ( not ( = ?auto_146595 ?auto_146599 ) ) ( not ( = ?auto_146595 ?auto_146600 ) ) ( not ( = ?auto_146596 ?auto_146597 ) ) ( not ( = ?auto_146596 ?auto_146598 ) ) ( not ( = ?auto_146596 ?auto_146599 ) ) ( not ( = ?auto_146596 ?auto_146600 ) ) ( not ( = ?auto_146597 ?auto_146598 ) ) ( not ( = ?auto_146597 ?auto_146599 ) ) ( not ( = ?auto_146597 ?auto_146600 ) ) ( not ( = ?auto_146598 ?auto_146599 ) ) ( not ( = ?auto_146598 ?auto_146600 ) ) ( not ( = ?auto_146599 ?auto_146600 ) ) ( ON ?auto_146598 ?auto_146599 ) ( ON ?auto_146597 ?auto_146598 ) ( ON ?auto_146596 ?auto_146597 ) ( ON ?auto_146595 ?auto_146596 ) ( ON ?auto_146594 ?auto_146595 ) ( CLEAR ?auto_146592 ) ( ON ?auto_146593 ?auto_146594 ) ( CLEAR ?auto_146593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146592 ?auto_146593 )
      ( MAKE-8PILE ?auto_146592 ?auto_146593 ?auto_146594 ?auto_146595 ?auto_146596 ?auto_146597 ?auto_146598 ?auto_146599 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146609 - BLOCK
      ?auto_146610 - BLOCK
      ?auto_146611 - BLOCK
      ?auto_146612 - BLOCK
      ?auto_146613 - BLOCK
      ?auto_146614 - BLOCK
      ?auto_146615 - BLOCK
      ?auto_146616 - BLOCK
    )
    :vars
    (
      ?auto_146617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146616 ?auto_146617 ) ( ON-TABLE ?auto_146609 ) ( not ( = ?auto_146609 ?auto_146610 ) ) ( not ( = ?auto_146609 ?auto_146611 ) ) ( not ( = ?auto_146609 ?auto_146612 ) ) ( not ( = ?auto_146609 ?auto_146613 ) ) ( not ( = ?auto_146609 ?auto_146614 ) ) ( not ( = ?auto_146609 ?auto_146615 ) ) ( not ( = ?auto_146609 ?auto_146616 ) ) ( not ( = ?auto_146609 ?auto_146617 ) ) ( not ( = ?auto_146610 ?auto_146611 ) ) ( not ( = ?auto_146610 ?auto_146612 ) ) ( not ( = ?auto_146610 ?auto_146613 ) ) ( not ( = ?auto_146610 ?auto_146614 ) ) ( not ( = ?auto_146610 ?auto_146615 ) ) ( not ( = ?auto_146610 ?auto_146616 ) ) ( not ( = ?auto_146610 ?auto_146617 ) ) ( not ( = ?auto_146611 ?auto_146612 ) ) ( not ( = ?auto_146611 ?auto_146613 ) ) ( not ( = ?auto_146611 ?auto_146614 ) ) ( not ( = ?auto_146611 ?auto_146615 ) ) ( not ( = ?auto_146611 ?auto_146616 ) ) ( not ( = ?auto_146611 ?auto_146617 ) ) ( not ( = ?auto_146612 ?auto_146613 ) ) ( not ( = ?auto_146612 ?auto_146614 ) ) ( not ( = ?auto_146612 ?auto_146615 ) ) ( not ( = ?auto_146612 ?auto_146616 ) ) ( not ( = ?auto_146612 ?auto_146617 ) ) ( not ( = ?auto_146613 ?auto_146614 ) ) ( not ( = ?auto_146613 ?auto_146615 ) ) ( not ( = ?auto_146613 ?auto_146616 ) ) ( not ( = ?auto_146613 ?auto_146617 ) ) ( not ( = ?auto_146614 ?auto_146615 ) ) ( not ( = ?auto_146614 ?auto_146616 ) ) ( not ( = ?auto_146614 ?auto_146617 ) ) ( not ( = ?auto_146615 ?auto_146616 ) ) ( not ( = ?auto_146615 ?auto_146617 ) ) ( not ( = ?auto_146616 ?auto_146617 ) ) ( ON ?auto_146615 ?auto_146616 ) ( ON ?auto_146614 ?auto_146615 ) ( ON ?auto_146613 ?auto_146614 ) ( ON ?auto_146612 ?auto_146613 ) ( ON ?auto_146611 ?auto_146612 ) ( CLEAR ?auto_146609 ) ( ON ?auto_146610 ?auto_146611 ) ( CLEAR ?auto_146610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146609 ?auto_146610 )
      ( MAKE-8PILE ?auto_146609 ?auto_146610 ?auto_146611 ?auto_146612 ?auto_146613 ?auto_146614 ?auto_146615 ?auto_146616 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146626 - BLOCK
      ?auto_146627 - BLOCK
      ?auto_146628 - BLOCK
      ?auto_146629 - BLOCK
      ?auto_146630 - BLOCK
      ?auto_146631 - BLOCK
      ?auto_146632 - BLOCK
      ?auto_146633 - BLOCK
    )
    :vars
    (
      ?auto_146634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146633 ?auto_146634 ) ( not ( = ?auto_146626 ?auto_146627 ) ) ( not ( = ?auto_146626 ?auto_146628 ) ) ( not ( = ?auto_146626 ?auto_146629 ) ) ( not ( = ?auto_146626 ?auto_146630 ) ) ( not ( = ?auto_146626 ?auto_146631 ) ) ( not ( = ?auto_146626 ?auto_146632 ) ) ( not ( = ?auto_146626 ?auto_146633 ) ) ( not ( = ?auto_146626 ?auto_146634 ) ) ( not ( = ?auto_146627 ?auto_146628 ) ) ( not ( = ?auto_146627 ?auto_146629 ) ) ( not ( = ?auto_146627 ?auto_146630 ) ) ( not ( = ?auto_146627 ?auto_146631 ) ) ( not ( = ?auto_146627 ?auto_146632 ) ) ( not ( = ?auto_146627 ?auto_146633 ) ) ( not ( = ?auto_146627 ?auto_146634 ) ) ( not ( = ?auto_146628 ?auto_146629 ) ) ( not ( = ?auto_146628 ?auto_146630 ) ) ( not ( = ?auto_146628 ?auto_146631 ) ) ( not ( = ?auto_146628 ?auto_146632 ) ) ( not ( = ?auto_146628 ?auto_146633 ) ) ( not ( = ?auto_146628 ?auto_146634 ) ) ( not ( = ?auto_146629 ?auto_146630 ) ) ( not ( = ?auto_146629 ?auto_146631 ) ) ( not ( = ?auto_146629 ?auto_146632 ) ) ( not ( = ?auto_146629 ?auto_146633 ) ) ( not ( = ?auto_146629 ?auto_146634 ) ) ( not ( = ?auto_146630 ?auto_146631 ) ) ( not ( = ?auto_146630 ?auto_146632 ) ) ( not ( = ?auto_146630 ?auto_146633 ) ) ( not ( = ?auto_146630 ?auto_146634 ) ) ( not ( = ?auto_146631 ?auto_146632 ) ) ( not ( = ?auto_146631 ?auto_146633 ) ) ( not ( = ?auto_146631 ?auto_146634 ) ) ( not ( = ?auto_146632 ?auto_146633 ) ) ( not ( = ?auto_146632 ?auto_146634 ) ) ( not ( = ?auto_146633 ?auto_146634 ) ) ( ON ?auto_146632 ?auto_146633 ) ( ON ?auto_146631 ?auto_146632 ) ( ON ?auto_146630 ?auto_146631 ) ( ON ?auto_146629 ?auto_146630 ) ( ON ?auto_146628 ?auto_146629 ) ( ON ?auto_146627 ?auto_146628 ) ( ON ?auto_146626 ?auto_146627 ) ( CLEAR ?auto_146626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146626 )
      ( MAKE-8PILE ?auto_146626 ?auto_146627 ?auto_146628 ?auto_146629 ?auto_146630 ?auto_146631 ?auto_146632 ?auto_146633 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146643 - BLOCK
      ?auto_146644 - BLOCK
      ?auto_146645 - BLOCK
      ?auto_146646 - BLOCK
      ?auto_146647 - BLOCK
      ?auto_146648 - BLOCK
      ?auto_146649 - BLOCK
      ?auto_146650 - BLOCK
    )
    :vars
    (
      ?auto_146651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146650 ?auto_146651 ) ( not ( = ?auto_146643 ?auto_146644 ) ) ( not ( = ?auto_146643 ?auto_146645 ) ) ( not ( = ?auto_146643 ?auto_146646 ) ) ( not ( = ?auto_146643 ?auto_146647 ) ) ( not ( = ?auto_146643 ?auto_146648 ) ) ( not ( = ?auto_146643 ?auto_146649 ) ) ( not ( = ?auto_146643 ?auto_146650 ) ) ( not ( = ?auto_146643 ?auto_146651 ) ) ( not ( = ?auto_146644 ?auto_146645 ) ) ( not ( = ?auto_146644 ?auto_146646 ) ) ( not ( = ?auto_146644 ?auto_146647 ) ) ( not ( = ?auto_146644 ?auto_146648 ) ) ( not ( = ?auto_146644 ?auto_146649 ) ) ( not ( = ?auto_146644 ?auto_146650 ) ) ( not ( = ?auto_146644 ?auto_146651 ) ) ( not ( = ?auto_146645 ?auto_146646 ) ) ( not ( = ?auto_146645 ?auto_146647 ) ) ( not ( = ?auto_146645 ?auto_146648 ) ) ( not ( = ?auto_146645 ?auto_146649 ) ) ( not ( = ?auto_146645 ?auto_146650 ) ) ( not ( = ?auto_146645 ?auto_146651 ) ) ( not ( = ?auto_146646 ?auto_146647 ) ) ( not ( = ?auto_146646 ?auto_146648 ) ) ( not ( = ?auto_146646 ?auto_146649 ) ) ( not ( = ?auto_146646 ?auto_146650 ) ) ( not ( = ?auto_146646 ?auto_146651 ) ) ( not ( = ?auto_146647 ?auto_146648 ) ) ( not ( = ?auto_146647 ?auto_146649 ) ) ( not ( = ?auto_146647 ?auto_146650 ) ) ( not ( = ?auto_146647 ?auto_146651 ) ) ( not ( = ?auto_146648 ?auto_146649 ) ) ( not ( = ?auto_146648 ?auto_146650 ) ) ( not ( = ?auto_146648 ?auto_146651 ) ) ( not ( = ?auto_146649 ?auto_146650 ) ) ( not ( = ?auto_146649 ?auto_146651 ) ) ( not ( = ?auto_146650 ?auto_146651 ) ) ( ON ?auto_146649 ?auto_146650 ) ( ON ?auto_146648 ?auto_146649 ) ( ON ?auto_146647 ?auto_146648 ) ( ON ?auto_146646 ?auto_146647 ) ( ON ?auto_146645 ?auto_146646 ) ( ON ?auto_146644 ?auto_146645 ) ( ON ?auto_146643 ?auto_146644 ) ( CLEAR ?auto_146643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146643 )
      ( MAKE-8PILE ?auto_146643 ?auto_146644 ?auto_146645 ?auto_146646 ?auto_146647 ?auto_146648 ?auto_146649 ?auto_146650 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146661 - BLOCK
      ?auto_146662 - BLOCK
      ?auto_146663 - BLOCK
      ?auto_146664 - BLOCK
      ?auto_146665 - BLOCK
      ?auto_146666 - BLOCK
      ?auto_146667 - BLOCK
      ?auto_146668 - BLOCK
      ?auto_146669 - BLOCK
    )
    :vars
    (
      ?auto_146670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146668 ) ( ON ?auto_146669 ?auto_146670 ) ( CLEAR ?auto_146669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146661 ) ( ON ?auto_146662 ?auto_146661 ) ( ON ?auto_146663 ?auto_146662 ) ( ON ?auto_146664 ?auto_146663 ) ( ON ?auto_146665 ?auto_146664 ) ( ON ?auto_146666 ?auto_146665 ) ( ON ?auto_146667 ?auto_146666 ) ( ON ?auto_146668 ?auto_146667 ) ( not ( = ?auto_146661 ?auto_146662 ) ) ( not ( = ?auto_146661 ?auto_146663 ) ) ( not ( = ?auto_146661 ?auto_146664 ) ) ( not ( = ?auto_146661 ?auto_146665 ) ) ( not ( = ?auto_146661 ?auto_146666 ) ) ( not ( = ?auto_146661 ?auto_146667 ) ) ( not ( = ?auto_146661 ?auto_146668 ) ) ( not ( = ?auto_146661 ?auto_146669 ) ) ( not ( = ?auto_146661 ?auto_146670 ) ) ( not ( = ?auto_146662 ?auto_146663 ) ) ( not ( = ?auto_146662 ?auto_146664 ) ) ( not ( = ?auto_146662 ?auto_146665 ) ) ( not ( = ?auto_146662 ?auto_146666 ) ) ( not ( = ?auto_146662 ?auto_146667 ) ) ( not ( = ?auto_146662 ?auto_146668 ) ) ( not ( = ?auto_146662 ?auto_146669 ) ) ( not ( = ?auto_146662 ?auto_146670 ) ) ( not ( = ?auto_146663 ?auto_146664 ) ) ( not ( = ?auto_146663 ?auto_146665 ) ) ( not ( = ?auto_146663 ?auto_146666 ) ) ( not ( = ?auto_146663 ?auto_146667 ) ) ( not ( = ?auto_146663 ?auto_146668 ) ) ( not ( = ?auto_146663 ?auto_146669 ) ) ( not ( = ?auto_146663 ?auto_146670 ) ) ( not ( = ?auto_146664 ?auto_146665 ) ) ( not ( = ?auto_146664 ?auto_146666 ) ) ( not ( = ?auto_146664 ?auto_146667 ) ) ( not ( = ?auto_146664 ?auto_146668 ) ) ( not ( = ?auto_146664 ?auto_146669 ) ) ( not ( = ?auto_146664 ?auto_146670 ) ) ( not ( = ?auto_146665 ?auto_146666 ) ) ( not ( = ?auto_146665 ?auto_146667 ) ) ( not ( = ?auto_146665 ?auto_146668 ) ) ( not ( = ?auto_146665 ?auto_146669 ) ) ( not ( = ?auto_146665 ?auto_146670 ) ) ( not ( = ?auto_146666 ?auto_146667 ) ) ( not ( = ?auto_146666 ?auto_146668 ) ) ( not ( = ?auto_146666 ?auto_146669 ) ) ( not ( = ?auto_146666 ?auto_146670 ) ) ( not ( = ?auto_146667 ?auto_146668 ) ) ( not ( = ?auto_146667 ?auto_146669 ) ) ( not ( = ?auto_146667 ?auto_146670 ) ) ( not ( = ?auto_146668 ?auto_146669 ) ) ( not ( = ?auto_146668 ?auto_146670 ) ) ( not ( = ?auto_146669 ?auto_146670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146669 ?auto_146670 )
      ( !STACK ?auto_146669 ?auto_146668 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146680 - BLOCK
      ?auto_146681 - BLOCK
      ?auto_146682 - BLOCK
      ?auto_146683 - BLOCK
      ?auto_146684 - BLOCK
      ?auto_146685 - BLOCK
      ?auto_146686 - BLOCK
      ?auto_146687 - BLOCK
      ?auto_146688 - BLOCK
    )
    :vars
    (
      ?auto_146689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146687 ) ( ON ?auto_146688 ?auto_146689 ) ( CLEAR ?auto_146688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146680 ) ( ON ?auto_146681 ?auto_146680 ) ( ON ?auto_146682 ?auto_146681 ) ( ON ?auto_146683 ?auto_146682 ) ( ON ?auto_146684 ?auto_146683 ) ( ON ?auto_146685 ?auto_146684 ) ( ON ?auto_146686 ?auto_146685 ) ( ON ?auto_146687 ?auto_146686 ) ( not ( = ?auto_146680 ?auto_146681 ) ) ( not ( = ?auto_146680 ?auto_146682 ) ) ( not ( = ?auto_146680 ?auto_146683 ) ) ( not ( = ?auto_146680 ?auto_146684 ) ) ( not ( = ?auto_146680 ?auto_146685 ) ) ( not ( = ?auto_146680 ?auto_146686 ) ) ( not ( = ?auto_146680 ?auto_146687 ) ) ( not ( = ?auto_146680 ?auto_146688 ) ) ( not ( = ?auto_146680 ?auto_146689 ) ) ( not ( = ?auto_146681 ?auto_146682 ) ) ( not ( = ?auto_146681 ?auto_146683 ) ) ( not ( = ?auto_146681 ?auto_146684 ) ) ( not ( = ?auto_146681 ?auto_146685 ) ) ( not ( = ?auto_146681 ?auto_146686 ) ) ( not ( = ?auto_146681 ?auto_146687 ) ) ( not ( = ?auto_146681 ?auto_146688 ) ) ( not ( = ?auto_146681 ?auto_146689 ) ) ( not ( = ?auto_146682 ?auto_146683 ) ) ( not ( = ?auto_146682 ?auto_146684 ) ) ( not ( = ?auto_146682 ?auto_146685 ) ) ( not ( = ?auto_146682 ?auto_146686 ) ) ( not ( = ?auto_146682 ?auto_146687 ) ) ( not ( = ?auto_146682 ?auto_146688 ) ) ( not ( = ?auto_146682 ?auto_146689 ) ) ( not ( = ?auto_146683 ?auto_146684 ) ) ( not ( = ?auto_146683 ?auto_146685 ) ) ( not ( = ?auto_146683 ?auto_146686 ) ) ( not ( = ?auto_146683 ?auto_146687 ) ) ( not ( = ?auto_146683 ?auto_146688 ) ) ( not ( = ?auto_146683 ?auto_146689 ) ) ( not ( = ?auto_146684 ?auto_146685 ) ) ( not ( = ?auto_146684 ?auto_146686 ) ) ( not ( = ?auto_146684 ?auto_146687 ) ) ( not ( = ?auto_146684 ?auto_146688 ) ) ( not ( = ?auto_146684 ?auto_146689 ) ) ( not ( = ?auto_146685 ?auto_146686 ) ) ( not ( = ?auto_146685 ?auto_146687 ) ) ( not ( = ?auto_146685 ?auto_146688 ) ) ( not ( = ?auto_146685 ?auto_146689 ) ) ( not ( = ?auto_146686 ?auto_146687 ) ) ( not ( = ?auto_146686 ?auto_146688 ) ) ( not ( = ?auto_146686 ?auto_146689 ) ) ( not ( = ?auto_146687 ?auto_146688 ) ) ( not ( = ?auto_146687 ?auto_146689 ) ) ( not ( = ?auto_146688 ?auto_146689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146688 ?auto_146689 )
      ( !STACK ?auto_146688 ?auto_146687 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146699 - BLOCK
      ?auto_146700 - BLOCK
      ?auto_146701 - BLOCK
      ?auto_146702 - BLOCK
      ?auto_146703 - BLOCK
      ?auto_146704 - BLOCK
      ?auto_146705 - BLOCK
      ?auto_146706 - BLOCK
      ?auto_146707 - BLOCK
    )
    :vars
    (
      ?auto_146708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146707 ?auto_146708 ) ( ON-TABLE ?auto_146699 ) ( ON ?auto_146700 ?auto_146699 ) ( ON ?auto_146701 ?auto_146700 ) ( ON ?auto_146702 ?auto_146701 ) ( ON ?auto_146703 ?auto_146702 ) ( ON ?auto_146704 ?auto_146703 ) ( ON ?auto_146705 ?auto_146704 ) ( not ( = ?auto_146699 ?auto_146700 ) ) ( not ( = ?auto_146699 ?auto_146701 ) ) ( not ( = ?auto_146699 ?auto_146702 ) ) ( not ( = ?auto_146699 ?auto_146703 ) ) ( not ( = ?auto_146699 ?auto_146704 ) ) ( not ( = ?auto_146699 ?auto_146705 ) ) ( not ( = ?auto_146699 ?auto_146706 ) ) ( not ( = ?auto_146699 ?auto_146707 ) ) ( not ( = ?auto_146699 ?auto_146708 ) ) ( not ( = ?auto_146700 ?auto_146701 ) ) ( not ( = ?auto_146700 ?auto_146702 ) ) ( not ( = ?auto_146700 ?auto_146703 ) ) ( not ( = ?auto_146700 ?auto_146704 ) ) ( not ( = ?auto_146700 ?auto_146705 ) ) ( not ( = ?auto_146700 ?auto_146706 ) ) ( not ( = ?auto_146700 ?auto_146707 ) ) ( not ( = ?auto_146700 ?auto_146708 ) ) ( not ( = ?auto_146701 ?auto_146702 ) ) ( not ( = ?auto_146701 ?auto_146703 ) ) ( not ( = ?auto_146701 ?auto_146704 ) ) ( not ( = ?auto_146701 ?auto_146705 ) ) ( not ( = ?auto_146701 ?auto_146706 ) ) ( not ( = ?auto_146701 ?auto_146707 ) ) ( not ( = ?auto_146701 ?auto_146708 ) ) ( not ( = ?auto_146702 ?auto_146703 ) ) ( not ( = ?auto_146702 ?auto_146704 ) ) ( not ( = ?auto_146702 ?auto_146705 ) ) ( not ( = ?auto_146702 ?auto_146706 ) ) ( not ( = ?auto_146702 ?auto_146707 ) ) ( not ( = ?auto_146702 ?auto_146708 ) ) ( not ( = ?auto_146703 ?auto_146704 ) ) ( not ( = ?auto_146703 ?auto_146705 ) ) ( not ( = ?auto_146703 ?auto_146706 ) ) ( not ( = ?auto_146703 ?auto_146707 ) ) ( not ( = ?auto_146703 ?auto_146708 ) ) ( not ( = ?auto_146704 ?auto_146705 ) ) ( not ( = ?auto_146704 ?auto_146706 ) ) ( not ( = ?auto_146704 ?auto_146707 ) ) ( not ( = ?auto_146704 ?auto_146708 ) ) ( not ( = ?auto_146705 ?auto_146706 ) ) ( not ( = ?auto_146705 ?auto_146707 ) ) ( not ( = ?auto_146705 ?auto_146708 ) ) ( not ( = ?auto_146706 ?auto_146707 ) ) ( not ( = ?auto_146706 ?auto_146708 ) ) ( not ( = ?auto_146707 ?auto_146708 ) ) ( CLEAR ?auto_146705 ) ( ON ?auto_146706 ?auto_146707 ) ( CLEAR ?auto_146706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146699 ?auto_146700 ?auto_146701 ?auto_146702 ?auto_146703 ?auto_146704 ?auto_146705 ?auto_146706 )
      ( MAKE-9PILE ?auto_146699 ?auto_146700 ?auto_146701 ?auto_146702 ?auto_146703 ?auto_146704 ?auto_146705 ?auto_146706 ?auto_146707 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146718 - BLOCK
      ?auto_146719 - BLOCK
      ?auto_146720 - BLOCK
      ?auto_146721 - BLOCK
      ?auto_146722 - BLOCK
      ?auto_146723 - BLOCK
      ?auto_146724 - BLOCK
      ?auto_146725 - BLOCK
      ?auto_146726 - BLOCK
    )
    :vars
    (
      ?auto_146727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146726 ?auto_146727 ) ( ON-TABLE ?auto_146718 ) ( ON ?auto_146719 ?auto_146718 ) ( ON ?auto_146720 ?auto_146719 ) ( ON ?auto_146721 ?auto_146720 ) ( ON ?auto_146722 ?auto_146721 ) ( ON ?auto_146723 ?auto_146722 ) ( ON ?auto_146724 ?auto_146723 ) ( not ( = ?auto_146718 ?auto_146719 ) ) ( not ( = ?auto_146718 ?auto_146720 ) ) ( not ( = ?auto_146718 ?auto_146721 ) ) ( not ( = ?auto_146718 ?auto_146722 ) ) ( not ( = ?auto_146718 ?auto_146723 ) ) ( not ( = ?auto_146718 ?auto_146724 ) ) ( not ( = ?auto_146718 ?auto_146725 ) ) ( not ( = ?auto_146718 ?auto_146726 ) ) ( not ( = ?auto_146718 ?auto_146727 ) ) ( not ( = ?auto_146719 ?auto_146720 ) ) ( not ( = ?auto_146719 ?auto_146721 ) ) ( not ( = ?auto_146719 ?auto_146722 ) ) ( not ( = ?auto_146719 ?auto_146723 ) ) ( not ( = ?auto_146719 ?auto_146724 ) ) ( not ( = ?auto_146719 ?auto_146725 ) ) ( not ( = ?auto_146719 ?auto_146726 ) ) ( not ( = ?auto_146719 ?auto_146727 ) ) ( not ( = ?auto_146720 ?auto_146721 ) ) ( not ( = ?auto_146720 ?auto_146722 ) ) ( not ( = ?auto_146720 ?auto_146723 ) ) ( not ( = ?auto_146720 ?auto_146724 ) ) ( not ( = ?auto_146720 ?auto_146725 ) ) ( not ( = ?auto_146720 ?auto_146726 ) ) ( not ( = ?auto_146720 ?auto_146727 ) ) ( not ( = ?auto_146721 ?auto_146722 ) ) ( not ( = ?auto_146721 ?auto_146723 ) ) ( not ( = ?auto_146721 ?auto_146724 ) ) ( not ( = ?auto_146721 ?auto_146725 ) ) ( not ( = ?auto_146721 ?auto_146726 ) ) ( not ( = ?auto_146721 ?auto_146727 ) ) ( not ( = ?auto_146722 ?auto_146723 ) ) ( not ( = ?auto_146722 ?auto_146724 ) ) ( not ( = ?auto_146722 ?auto_146725 ) ) ( not ( = ?auto_146722 ?auto_146726 ) ) ( not ( = ?auto_146722 ?auto_146727 ) ) ( not ( = ?auto_146723 ?auto_146724 ) ) ( not ( = ?auto_146723 ?auto_146725 ) ) ( not ( = ?auto_146723 ?auto_146726 ) ) ( not ( = ?auto_146723 ?auto_146727 ) ) ( not ( = ?auto_146724 ?auto_146725 ) ) ( not ( = ?auto_146724 ?auto_146726 ) ) ( not ( = ?auto_146724 ?auto_146727 ) ) ( not ( = ?auto_146725 ?auto_146726 ) ) ( not ( = ?auto_146725 ?auto_146727 ) ) ( not ( = ?auto_146726 ?auto_146727 ) ) ( CLEAR ?auto_146724 ) ( ON ?auto_146725 ?auto_146726 ) ( CLEAR ?auto_146725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146718 ?auto_146719 ?auto_146720 ?auto_146721 ?auto_146722 ?auto_146723 ?auto_146724 ?auto_146725 )
      ( MAKE-9PILE ?auto_146718 ?auto_146719 ?auto_146720 ?auto_146721 ?auto_146722 ?auto_146723 ?auto_146724 ?auto_146725 ?auto_146726 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146737 - BLOCK
      ?auto_146738 - BLOCK
      ?auto_146739 - BLOCK
      ?auto_146740 - BLOCK
      ?auto_146741 - BLOCK
      ?auto_146742 - BLOCK
      ?auto_146743 - BLOCK
      ?auto_146744 - BLOCK
      ?auto_146745 - BLOCK
    )
    :vars
    (
      ?auto_146746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146745 ?auto_146746 ) ( ON-TABLE ?auto_146737 ) ( ON ?auto_146738 ?auto_146737 ) ( ON ?auto_146739 ?auto_146738 ) ( ON ?auto_146740 ?auto_146739 ) ( ON ?auto_146741 ?auto_146740 ) ( ON ?auto_146742 ?auto_146741 ) ( not ( = ?auto_146737 ?auto_146738 ) ) ( not ( = ?auto_146737 ?auto_146739 ) ) ( not ( = ?auto_146737 ?auto_146740 ) ) ( not ( = ?auto_146737 ?auto_146741 ) ) ( not ( = ?auto_146737 ?auto_146742 ) ) ( not ( = ?auto_146737 ?auto_146743 ) ) ( not ( = ?auto_146737 ?auto_146744 ) ) ( not ( = ?auto_146737 ?auto_146745 ) ) ( not ( = ?auto_146737 ?auto_146746 ) ) ( not ( = ?auto_146738 ?auto_146739 ) ) ( not ( = ?auto_146738 ?auto_146740 ) ) ( not ( = ?auto_146738 ?auto_146741 ) ) ( not ( = ?auto_146738 ?auto_146742 ) ) ( not ( = ?auto_146738 ?auto_146743 ) ) ( not ( = ?auto_146738 ?auto_146744 ) ) ( not ( = ?auto_146738 ?auto_146745 ) ) ( not ( = ?auto_146738 ?auto_146746 ) ) ( not ( = ?auto_146739 ?auto_146740 ) ) ( not ( = ?auto_146739 ?auto_146741 ) ) ( not ( = ?auto_146739 ?auto_146742 ) ) ( not ( = ?auto_146739 ?auto_146743 ) ) ( not ( = ?auto_146739 ?auto_146744 ) ) ( not ( = ?auto_146739 ?auto_146745 ) ) ( not ( = ?auto_146739 ?auto_146746 ) ) ( not ( = ?auto_146740 ?auto_146741 ) ) ( not ( = ?auto_146740 ?auto_146742 ) ) ( not ( = ?auto_146740 ?auto_146743 ) ) ( not ( = ?auto_146740 ?auto_146744 ) ) ( not ( = ?auto_146740 ?auto_146745 ) ) ( not ( = ?auto_146740 ?auto_146746 ) ) ( not ( = ?auto_146741 ?auto_146742 ) ) ( not ( = ?auto_146741 ?auto_146743 ) ) ( not ( = ?auto_146741 ?auto_146744 ) ) ( not ( = ?auto_146741 ?auto_146745 ) ) ( not ( = ?auto_146741 ?auto_146746 ) ) ( not ( = ?auto_146742 ?auto_146743 ) ) ( not ( = ?auto_146742 ?auto_146744 ) ) ( not ( = ?auto_146742 ?auto_146745 ) ) ( not ( = ?auto_146742 ?auto_146746 ) ) ( not ( = ?auto_146743 ?auto_146744 ) ) ( not ( = ?auto_146743 ?auto_146745 ) ) ( not ( = ?auto_146743 ?auto_146746 ) ) ( not ( = ?auto_146744 ?auto_146745 ) ) ( not ( = ?auto_146744 ?auto_146746 ) ) ( not ( = ?auto_146745 ?auto_146746 ) ) ( ON ?auto_146744 ?auto_146745 ) ( CLEAR ?auto_146742 ) ( ON ?auto_146743 ?auto_146744 ) ( CLEAR ?auto_146743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146737 ?auto_146738 ?auto_146739 ?auto_146740 ?auto_146741 ?auto_146742 ?auto_146743 )
      ( MAKE-9PILE ?auto_146737 ?auto_146738 ?auto_146739 ?auto_146740 ?auto_146741 ?auto_146742 ?auto_146743 ?auto_146744 ?auto_146745 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146756 - BLOCK
      ?auto_146757 - BLOCK
      ?auto_146758 - BLOCK
      ?auto_146759 - BLOCK
      ?auto_146760 - BLOCK
      ?auto_146761 - BLOCK
      ?auto_146762 - BLOCK
      ?auto_146763 - BLOCK
      ?auto_146764 - BLOCK
    )
    :vars
    (
      ?auto_146765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146764 ?auto_146765 ) ( ON-TABLE ?auto_146756 ) ( ON ?auto_146757 ?auto_146756 ) ( ON ?auto_146758 ?auto_146757 ) ( ON ?auto_146759 ?auto_146758 ) ( ON ?auto_146760 ?auto_146759 ) ( ON ?auto_146761 ?auto_146760 ) ( not ( = ?auto_146756 ?auto_146757 ) ) ( not ( = ?auto_146756 ?auto_146758 ) ) ( not ( = ?auto_146756 ?auto_146759 ) ) ( not ( = ?auto_146756 ?auto_146760 ) ) ( not ( = ?auto_146756 ?auto_146761 ) ) ( not ( = ?auto_146756 ?auto_146762 ) ) ( not ( = ?auto_146756 ?auto_146763 ) ) ( not ( = ?auto_146756 ?auto_146764 ) ) ( not ( = ?auto_146756 ?auto_146765 ) ) ( not ( = ?auto_146757 ?auto_146758 ) ) ( not ( = ?auto_146757 ?auto_146759 ) ) ( not ( = ?auto_146757 ?auto_146760 ) ) ( not ( = ?auto_146757 ?auto_146761 ) ) ( not ( = ?auto_146757 ?auto_146762 ) ) ( not ( = ?auto_146757 ?auto_146763 ) ) ( not ( = ?auto_146757 ?auto_146764 ) ) ( not ( = ?auto_146757 ?auto_146765 ) ) ( not ( = ?auto_146758 ?auto_146759 ) ) ( not ( = ?auto_146758 ?auto_146760 ) ) ( not ( = ?auto_146758 ?auto_146761 ) ) ( not ( = ?auto_146758 ?auto_146762 ) ) ( not ( = ?auto_146758 ?auto_146763 ) ) ( not ( = ?auto_146758 ?auto_146764 ) ) ( not ( = ?auto_146758 ?auto_146765 ) ) ( not ( = ?auto_146759 ?auto_146760 ) ) ( not ( = ?auto_146759 ?auto_146761 ) ) ( not ( = ?auto_146759 ?auto_146762 ) ) ( not ( = ?auto_146759 ?auto_146763 ) ) ( not ( = ?auto_146759 ?auto_146764 ) ) ( not ( = ?auto_146759 ?auto_146765 ) ) ( not ( = ?auto_146760 ?auto_146761 ) ) ( not ( = ?auto_146760 ?auto_146762 ) ) ( not ( = ?auto_146760 ?auto_146763 ) ) ( not ( = ?auto_146760 ?auto_146764 ) ) ( not ( = ?auto_146760 ?auto_146765 ) ) ( not ( = ?auto_146761 ?auto_146762 ) ) ( not ( = ?auto_146761 ?auto_146763 ) ) ( not ( = ?auto_146761 ?auto_146764 ) ) ( not ( = ?auto_146761 ?auto_146765 ) ) ( not ( = ?auto_146762 ?auto_146763 ) ) ( not ( = ?auto_146762 ?auto_146764 ) ) ( not ( = ?auto_146762 ?auto_146765 ) ) ( not ( = ?auto_146763 ?auto_146764 ) ) ( not ( = ?auto_146763 ?auto_146765 ) ) ( not ( = ?auto_146764 ?auto_146765 ) ) ( ON ?auto_146763 ?auto_146764 ) ( CLEAR ?auto_146761 ) ( ON ?auto_146762 ?auto_146763 ) ( CLEAR ?auto_146762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146756 ?auto_146757 ?auto_146758 ?auto_146759 ?auto_146760 ?auto_146761 ?auto_146762 )
      ( MAKE-9PILE ?auto_146756 ?auto_146757 ?auto_146758 ?auto_146759 ?auto_146760 ?auto_146761 ?auto_146762 ?auto_146763 ?auto_146764 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146775 - BLOCK
      ?auto_146776 - BLOCK
      ?auto_146777 - BLOCK
      ?auto_146778 - BLOCK
      ?auto_146779 - BLOCK
      ?auto_146780 - BLOCK
      ?auto_146781 - BLOCK
      ?auto_146782 - BLOCK
      ?auto_146783 - BLOCK
    )
    :vars
    (
      ?auto_146784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146783 ?auto_146784 ) ( ON-TABLE ?auto_146775 ) ( ON ?auto_146776 ?auto_146775 ) ( ON ?auto_146777 ?auto_146776 ) ( ON ?auto_146778 ?auto_146777 ) ( ON ?auto_146779 ?auto_146778 ) ( not ( = ?auto_146775 ?auto_146776 ) ) ( not ( = ?auto_146775 ?auto_146777 ) ) ( not ( = ?auto_146775 ?auto_146778 ) ) ( not ( = ?auto_146775 ?auto_146779 ) ) ( not ( = ?auto_146775 ?auto_146780 ) ) ( not ( = ?auto_146775 ?auto_146781 ) ) ( not ( = ?auto_146775 ?auto_146782 ) ) ( not ( = ?auto_146775 ?auto_146783 ) ) ( not ( = ?auto_146775 ?auto_146784 ) ) ( not ( = ?auto_146776 ?auto_146777 ) ) ( not ( = ?auto_146776 ?auto_146778 ) ) ( not ( = ?auto_146776 ?auto_146779 ) ) ( not ( = ?auto_146776 ?auto_146780 ) ) ( not ( = ?auto_146776 ?auto_146781 ) ) ( not ( = ?auto_146776 ?auto_146782 ) ) ( not ( = ?auto_146776 ?auto_146783 ) ) ( not ( = ?auto_146776 ?auto_146784 ) ) ( not ( = ?auto_146777 ?auto_146778 ) ) ( not ( = ?auto_146777 ?auto_146779 ) ) ( not ( = ?auto_146777 ?auto_146780 ) ) ( not ( = ?auto_146777 ?auto_146781 ) ) ( not ( = ?auto_146777 ?auto_146782 ) ) ( not ( = ?auto_146777 ?auto_146783 ) ) ( not ( = ?auto_146777 ?auto_146784 ) ) ( not ( = ?auto_146778 ?auto_146779 ) ) ( not ( = ?auto_146778 ?auto_146780 ) ) ( not ( = ?auto_146778 ?auto_146781 ) ) ( not ( = ?auto_146778 ?auto_146782 ) ) ( not ( = ?auto_146778 ?auto_146783 ) ) ( not ( = ?auto_146778 ?auto_146784 ) ) ( not ( = ?auto_146779 ?auto_146780 ) ) ( not ( = ?auto_146779 ?auto_146781 ) ) ( not ( = ?auto_146779 ?auto_146782 ) ) ( not ( = ?auto_146779 ?auto_146783 ) ) ( not ( = ?auto_146779 ?auto_146784 ) ) ( not ( = ?auto_146780 ?auto_146781 ) ) ( not ( = ?auto_146780 ?auto_146782 ) ) ( not ( = ?auto_146780 ?auto_146783 ) ) ( not ( = ?auto_146780 ?auto_146784 ) ) ( not ( = ?auto_146781 ?auto_146782 ) ) ( not ( = ?auto_146781 ?auto_146783 ) ) ( not ( = ?auto_146781 ?auto_146784 ) ) ( not ( = ?auto_146782 ?auto_146783 ) ) ( not ( = ?auto_146782 ?auto_146784 ) ) ( not ( = ?auto_146783 ?auto_146784 ) ) ( ON ?auto_146782 ?auto_146783 ) ( ON ?auto_146781 ?auto_146782 ) ( CLEAR ?auto_146779 ) ( ON ?auto_146780 ?auto_146781 ) ( CLEAR ?auto_146780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146775 ?auto_146776 ?auto_146777 ?auto_146778 ?auto_146779 ?auto_146780 )
      ( MAKE-9PILE ?auto_146775 ?auto_146776 ?auto_146777 ?auto_146778 ?auto_146779 ?auto_146780 ?auto_146781 ?auto_146782 ?auto_146783 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146794 - BLOCK
      ?auto_146795 - BLOCK
      ?auto_146796 - BLOCK
      ?auto_146797 - BLOCK
      ?auto_146798 - BLOCK
      ?auto_146799 - BLOCK
      ?auto_146800 - BLOCK
      ?auto_146801 - BLOCK
      ?auto_146802 - BLOCK
    )
    :vars
    (
      ?auto_146803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146802 ?auto_146803 ) ( ON-TABLE ?auto_146794 ) ( ON ?auto_146795 ?auto_146794 ) ( ON ?auto_146796 ?auto_146795 ) ( ON ?auto_146797 ?auto_146796 ) ( ON ?auto_146798 ?auto_146797 ) ( not ( = ?auto_146794 ?auto_146795 ) ) ( not ( = ?auto_146794 ?auto_146796 ) ) ( not ( = ?auto_146794 ?auto_146797 ) ) ( not ( = ?auto_146794 ?auto_146798 ) ) ( not ( = ?auto_146794 ?auto_146799 ) ) ( not ( = ?auto_146794 ?auto_146800 ) ) ( not ( = ?auto_146794 ?auto_146801 ) ) ( not ( = ?auto_146794 ?auto_146802 ) ) ( not ( = ?auto_146794 ?auto_146803 ) ) ( not ( = ?auto_146795 ?auto_146796 ) ) ( not ( = ?auto_146795 ?auto_146797 ) ) ( not ( = ?auto_146795 ?auto_146798 ) ) ( not ( = ?auto_146795 ?auto_146799 ) ) ( not ( = ?auto_146795 ?auto_146800 ) ) ( not ( = ?auto_146795 ?auto_146801 ) ) ( not ( = ?auto_146795 ?auto_146802 ) ) ( not ( = ?auto_146795 ?auto_146803 ) ) ( not ( = ?auto_146796 ?auto_146797 ) ) ( not ( = ?auto_146796 ?auto_146798 ) ) ( not ( = ?auto_146796 ?auto_146799 ) ) ( not ( = ?auto_146796 ?auto_146800 ) ) ( not ( = ?auto_146796 ?auto_146801 ) ) ( not ( = ?auto_146796 ?auto_146802 ) ) ( not ( = ?auto_146796 ?auto_146803 ) ) ( not ( = ?auto_146797 ?auto_146798 ) ) ( not ( = ?auto_146797 ?auto_146799 ) ) ( not ( = ?auto_146797 ?auto_146800 ) ) ( not ( = ?auto_146797 ?auto_146801 ) ) ( not ( = ?auto_146797 ?auto_146802 ) ) ( not ( = ?auto_146797 ?auto_146803 ) ) ( not ( = ?auto_146798 ?auto_146799 ) ) ( not ( = ?auto_146798 ?auto_146800 ) ) ( not ( = ?auto_146798 ?auto_146801 ) ) ( not ( = ?auto_146798 ?auto_146802 ) ) ( not ( = ?auto_146798 ?auto_146803 ) ) ( not ( = ?auto_146799 ?auto_146800 ) ) ( not ( = ?auto_146799 ?auto_146801 ) ) ( not ( = ?auto_146799 ?auto_146802 ) ) ( not ( = ?auto_146799 ?auto_146803 ) ) ( not ( = ?auto_146800 ?auto_146801 ) ) ( not ( = ?auto_146800 ?auto_146802 ) ) ( not ( = ?auto_146800 ?auto_146803 ) ) ( not ( = ?auto_146801 ?auto_146802 ) ) ( not ( = ?auto_146801 ?auto_146803 ) ) ( not ( = ?auto_146802 ?auto_146803 ) ) ( ON ?auto_146801 ?auto_146802 ) ( ON ?auto_146800 ?auto_146801 ) ( CLEAR ?auto_146798 ) ( ON ?auto_146799 ?auto_146800 ) ( CLEAR ?auto_146799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146794 ?auto_146795 ?auto_146796 ?auto_146797 ?auto_146798 ?auto_146799 )
      ( MAKE-9PILE ?auto_146794 ?auto_146795 ?auto_146796 ?auto_146797 ?auto_146798 ?auto_146799 ?auto_146800 ?auto_146801 ?auto_146802 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146813 - BLOCK
      ?auto_146814 - BLOCK
      ?auto_146815 - BLOCK
      ?auto_146816 - BLOCK
      ?auto_146817 - BLOCK
      ?auto_146818 - BLOCK
      ?auto_146819 - BLOCK
      ?auto_146820 - BLOCK
      ?auto_146821 - BLOCK
    )
    :vars
    (
      ?auto_146822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146821 ?auto_146822 ) ( ON-TABLE ?auto_146813 ) ( ON ?auto_146814 ?auto_146813 ) ( ON ?auto_146815 ?auto_146814 ) ( ON ?auto_146816 ?auto_146815 ) ( not ( = ?auto_146813 ?auto_146814 ) ) ( not ( = ?auto_146813 ?auto_146815 ) ) ( not ( = ?auto_146813 ?auto_146816 ) ) ( not ( = ?auto_146813 ?auto_146817 ) ) ( not ( = ?auto_146813 ?auto_146818 ) ) ( not ( = ?auto_146813 ?auto_146819 ) ) ( not ( = ?auto_146813 ?auto_146820 ) ) ( not ( = ?auto_146813 ?auto_146821 ) ) ( not ( = ?auto_146813 ?auto_146822 ) ) ( not ( = ?auto_146814 ?auto_146815 ) ) ( not ( = ?auto_146814 ?auto_146816 ) ) ( not ( = ?auto_146814 ?auto_146817 ) ) ( not ( = ?auto_146814 ?auto_146818 ) ) ( not ( = ?auto_146814 ?auto_146819 ) ) ( not ( = ?auto_146814 ?auto_146820 ) ) ( not ( = ?auto_146814 ?auto_146821 ) ) ( not ( = ?auto_146814 ?auto_146822 ) ) ( not ( = ?auto_146815 ?auto_146816 ) ) ( not ( = ?auto_146815 ?auto_146817 ) ) ( not ( = ?auto_146815 ?auto_146818 ) ) ( not ( = ?auto_146815 ?auto_146819 ) ) ( not ( = ?auto_146815 ?auto_146820 ) ) ( not ( = ?auto_146815 ?auto_146821 ) ) ( not ( = ?auto_146815 ?auto_146822 ) ) ( not ( = ?auto_146816 ?auto_146817 ) ) ( not ( = ?auto_146816 ?auto_146818 ) ) ( not ( = ?auto_146816 ?auto_146819 ) ) ( not ( = ?auto_146816 ?auto_146820 ) ) ( not ( = ?auto_146816 ?auto_146821 ) ) ( not ( = ?auto_146816 ?auto_146822 ) ) ( not ( = ?auto_146817 ?auto_146818 ) ) ( not ( = ?auto_146817 ?auto_146819 ) ) ( not ( = ?auto_146817 ?auto_146820 ) ) ( not ( = ?auto_146817 ?auto_146821 ) ) ( not ( = ?auto_146817 ?auto_146822 ) ) ( not ( = ?auto_146818 ?auto_146819 ) ) ( not ( = ?auto_146818 ?auto_146820 ) ) ( not ( = ?auto_146818 ?auto_146821 ) ) ( not ( = ?auto_146818 ?auto_146822 ) ) ( not ( = ?auto_146819 ?auto_146820 ) ) ( not ( = ?auto_146819 ?auto_146821 ) ) ( not ( = ?auto_146819 ?auto_146822 ) ) ( not ( = ?auto_146820 ?auto_146821 ) ) ( not ( = ?auto_146820 ?auto_146822 ) ) ( not ( = ?auto_146821 ?auto_146822 ) ) ( ON ?auto_146820 ?auto_146821 ) ( ON ?auto_146819 ?auto_146820 ) ( ON ?auto_146818 ?auto_146819 ) ( CLEAR ?auto_146816 ) ( ON ?auto_146817 ?auto_146818 ) ( CLEAR ?auto_146817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146813 ?auto_146814 ?auto_146815 ?auto_146816 ?auto_146817 )
      ( MAKE-9PILE ?auto_146813 ?auto_146814 ?auto_146815 ?auto_146816 ?auto_146817 ?auto_146818 ?auto_146819 ?auto_146820 ?auto_146821 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146832 - BLOCK
      ?auto_146833 - BLOCK
      ?auto_146834 - BLOCK
      ?auto_146835 - BLOCK
      ?auto_146836 - BLOCK
      ?auto_146837 - BLOCK
      ?auto_146838 - BLOCK
      ?auto_146839 - BLOCK
      ?auto_146840 - BLOCK
    )
    :vars
    (
      ?auto_146841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146840 ?auto_146841 ) ( ON-TABLE ?auto_146832 ) ( ON ?auto_146833 ?auto_146832 ) ( ON ?auto_146834 ?auto_146833 ) ( ON ?auto_146835 ?auto_146834 ) ( not ( = ?auto_146832 ?auto_146833 ) ) ( not ( = ?auto_146832 ?auto_146834 ) ) ( not ( = ?auto_146832 ?auto_146835 ) ) ( not ( = ?auto_146832 ?auto_146836 ) ) ( not ( = ?auto_146832 ?auto_146837 ) ) ( not ( = ?auto_146832 ?auto_146838 ) ) ( not ( = ?auto_146832 ?auto_146839 ) ) ( not ( = ?auto_146832 ?auto_146840 ) ) ( not ( = ?auto_146832 ?auto_146841 ) ) ( not ( = ?auto_146833 ?auto_146834 ) ) ( not ( = ?auto_146833 ?auto_146835 ) ) ( not ( = ?auto_146833 ?auto_146836 ) ) ( not ( = ?auto_146833 ?auto_146837 ) ) ( not ( = ?auto_146833 ?auto_146838 ) ) ( not ( = ?auto_146833 ?auto_146839 ) ) ( not ( = ?auto_146833 ?auto_146840 ) ) ( not ( = ?auto_146833 ?auto_146841 ) ) ( not ( = ?auto_146834 ?auto_146835 ) ) ( not ( = ?auto_146834 ?auto_146836 ) ) ( not ( = ?auto_146834 ?auto_146837 ) ) ( not ( = ?auto_146834 ?auto_146838 ) ) ( not ( = ?auto_146834 ?auto_146839 ) ) ( not ( = ?auto_146834 ?auto_146840 ) ) ( not ( = ?auto_146834 ?auto_146841 ) ) ( not ( = ?auto_146835 ?auto_146836 ) ) ( not ( = ?auto_146835 ?auto_146837 ) ) ( not ( = ?auto_146835 ?auto_146838 ) ) ( not ( = ?auto_146835 ?auto_146839 ) ) ( not ( = ?auto_146835 ?auto_146840 ) ) ( not ( = ?auto_146835 ?auto_146841 ) ) ( not ( = ?auto_146836 ?auto_146837 ) ) ( not ( = ?auto_146836 ?auto_146838 ) ) ( not ( = ?auto_146836 ?auto_146839 ) ) ( not ( = ?auto_146836 ?auto_146840 ) ) ( not ( = ?auto_146836 ?auto_146841 ) ) ( not ( = ?auto_146837 ?auto_146838 ) ) ( not ( = ?auto_146837 ?auto_146839 ) ) ( not ( = ?auto_146837 ?auto_146840 ) ) ( not ( = ?auto_146837 ?auto_146841 ) ) ( not ( = ?auto_146838 ?auto_146839 ) ) ( not ( = ?auto_146838 ?auto_146840 ) ) ( not ( = ?auto_146838 ?auto_146841 ) ) ( not ( = ?auto_146839 ?auto_146840 ) ) ( not ( = ?auto_146839 ?auto_146841 ) ) ( not ( = ?auto_146840 ?auto_146841 ) ) ( ON ?auto_146839 ?auto_146840 ) ( ON ?auto_146838 ?auto_146839 ) ( ON ?auto_146837 ?auto_146838 ) ( CLEAR ?auto_146835 ) ( ON ?auto_146836 ?auto_146837 ) ( CLEAR ?auto_146836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146832 ?auto_146833 ?auto_146834 ?auto_146835 ?auto_146836 )
      ( MAKE-9PILE ?auto_146832 ?auto_146833 ?auto_146834 ?auto_146835 ?auto_146836 ?auto_146837 ?auto_146838 ?auto_146839 ?auto_146840 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146851 - BLOCK
      ?auto_146852 - BLOCK
      ?auto_146853 - BLOCK
      ?auto_146854 - BLOCK
      ?auto_146855 - BLOCK
      ?auto_146856 - BLOCK
      ?auto_146857 - BLOCK
      ?auto_146858 - BLOCK
      ?auto_146859 - BLOCK
    )
    :vars
    (
      ?auto_146860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146859 ?auto_146860 ) ( ON-TABLE ?auto_146851 ) ( ON ?auto_146852 ?auto_146851 ) ( ON ?auto_146853 ?auto_146852 ) ( not ( = ?auto_146851 ?auto_146852 ) ) ( not ( = ?auto_146851 ?auto_146853 ) ) ( not ( = ?auto_146851 ?auto_146854 ) ) ( not ( = ?auto_146851 ?auto_146855 ) ) ( not ( = ?auto_146851 ?auto_146856 ) ) ( not ( = ?auto_146851 ?auto_146857 ) ) ( not ( = ?auto_146851 ?auto_146858 ) ) ( not ( = ?auto_146851 ?auto_146859 ) ) ( not ( = ?auto_146851 ?auto_146860 ) ) ( not ( = ?auto_146852 ?auto_146853 ) ) ( not ( = ?auto_146852 ?auto_146854 ) ) ( not ( = ?auto_146852 ?auto_146855 ) ) ( not ( = ?auto_146852 ?auto_146856 ) ) ( not ( = ?auto_146852 ?auto_146857 ) ) ( not ( = ?auto_146852 ?auto_146858 ) ) ( not ( = ?auto_146852 ?auto_146859 ) ) ( not ( = ?auto_146852 ?auto_146860 ) ) ( not ( = ?auto_146853 ?auto_146854 ) ) ( not ( = ?auto_146853 ?auto_146855 ) ) ( not ( = ?auto_146853 ?auto_146856 ) ) ( not ( = ?auto_146853 ?auto_146857 ) ) ( not ( = ?auto_146853 ?auto_146858 ) ) ( not ( = ?auto_146853 ?auto_146859 ) ) ( not ( = ?auto_146853 ?auto_146860 ) ) ( not ( = ?auto_146854 ?auto_146855 ) ) ( not ( = ?auto_146854 ?auto_146856 ) ) ( not ( = ?auto_146854 ?auto_146857 ) ) ( not ( = ?auto_146854 ?auto_146858 ) ) ( not ( = ?auto_146854 ?auto_146859 ) ) ( not ( = ?auto_146854 ?auto_146860 ) ) ( not ( = ?auto_146855 ?auto_146856 ) ) ( not ( = ?auto_146855 ?auto_146857 ) ) ( not ( = ?auto_146855 ?auto_146858 ) ) ( not ( = ?auto_146855 ?auto_146859 ) ) ( not ( = ?auto_146855 ?auto_146860 ) ) ( not ( = ?auto_146856 ?auto_146857 ) ) ( not ( = ?auto_146856 ?auto_146858 ) ) ( not ( = ?auto_146856 ?auto_146859 ) ) ( not ( = ?auto_146856 ?auto_146860 ) ) ( not ( = ?auto_146857 ?auto_146858 ) ) ( not ( = ?auto_146857 ?auto_146859 ) ) ( not ( = ?auto_146857 ?auto_146860 ) ) ( not ( = ?auto_146858 ?auto_146859 ) ) ( not ( = ?auto_146858 ?auto_146860 ) ) ( not ( = ?auto_146859 ?auto_146860 ) ) ( ON ?auto_146858 ?auto_146859 ) ( ON ?auto_146857 ?auto_146858 ) ( ON ?auto_146856 ?auto_146857 ) ( ON ?auto_146855 ?auto_146856 ) ( CLEAR ?auto_146853 ) ( ON ?auto_146854 ?auto_146855 ) ( CLEAR ?auto_146854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146851 ?auto_146852 ?auto_146853 ?auto_146854 )
      ( MAKE-9PILE ?auto_146851 ?auto_146852 ?auto_146853 ?auto_146854 ?auto_146855 ?auto_146856 ?auto_146857 ?auto_146858 ?auto_146859 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146870 - BLOCK
      ?auto_146871 - BLOCK
      ?auto_146872 - BLOCK
      ?auto_146873 - BLOCK
      ?auto_146874 - BLOCK
      ?auto_146875 - BLOCK
      ?auto_146876 - BLOCK
      ?auto_146877 - BLOCK
      ?auto_146878 - BLOCK
    )
    :vars
    (
      ?auto_146879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146878 ?auto_146879 ) ( ON-TABLE ?auto_146870 ) ( ON ?auto_146871 ?auto_146870 ) ( ON ?auto_146872 ?auto_146871 ) ( not ( = ?auto_146870 ?auto_146871 ) ) ( not ( = ?auto_146870 ?auto_146872 ) ) ( not ( = ?auto_146870 ?auto_146873 ) ) ( not ( = ?auto_146870 ?auto_146874 ) ) ( not ( = ?auto_146870 ?auto_146875 ) ) ( not ( = ?auto_146870 ?auto_146876 ) ) ( not ( = ?auto_146870 ?auto_146877 ) ) ( not ( = ?auto_146870 ?auto_146878 ) ) ( not ( = ?auto_146870 ?auto_146879 ) ) ( not ( = ?auto_146871 ?auto_146872 ) ) ( not ( = ?auto_146871 ?auto_146873 ) ) ( not ( = ?auto_146871 ?auto_146874 ) ) ( not ( = ?auto_146871 ?auto_146875 ) ) ( not ( = ?auto_146871 ?auto_146876 ) ) ( not ( = ?auto_146871 ?auto_146877 ) ) ( not ( = ?auto_146871 ?auto_146878 ) ) ( not ( = ?auto_146871 ?auto_146879 ) ) ( not ( = ?auto_146872 ?auto_146873 ) ) ( not ( = ?auto_146872 ?auto_146874 ) ) ( not ( = ?auto_146872 ?auto_146875 ) ) ( not ( = ?auto_146872 ?auto_146876 ) ) ( not ( = ?auto_146872 ?auto_146877 ) ) ( not ( = ?auto_146872 ?auto_146878 ) ) ( not ( = ?auto_146872 ?auto_146879 ) ) ( not ( = ?auto_146873 ?auto_146874 ) ) ( not ( = ?auto_146873 ?auto_146875 ) ) ( not ( = ?auto_146873 ?auto_146876 ) ) ( not ( = ?auto_146873 ?auto_146877 ) ) ( not ( = ?auto_146873 ?auto_146878 ) ) ( not ( = ?auto_146873 ?auto_146879 ) ) ( not ( = ?auto_146874 ?auto_146875 ) ) ( not ( = ?auto_146874 ?auto_146876 ) ) ( not ( = ?auto_146874 ?auto_146877 ) ) ( not ( = ?auto_146874 ?auto_146878 ) ) ( not ( = ?auto_146874 ?auto_146879 ) ) ( not ( = ?auto_146875 ?auto_146876 ) ) ( not ( = ?auto_146875 ?auto_146877 ) ) ( not ( = ?auto_146875 ?auto_146878 ) ) ( not ( = ?auto_146875 ?auto_146879 ) ) ( not ( = ?auto_146876 ?auto_146877 ) ) ( not ( = ?auto_146876 ?auto_146878 ) ) ( not ( = ?auto_146876 ?auto_146879 ) ) ( not ( = ?auto_146877 ?auto_146878 ) ) ( not ( = ?auto_146877 ?auto_146879 ) ) ( not ( = ?auto_146878 ?auto_146879 ) ) ( ON ?auto_146877 ?auto_146878 ) ( ON ?auto_146876 ?auto_146877 ) ( ON ?auto_146875 ?auto_146876 ) ( ON ?auto_146874 ?auto_146875 ) ( CLEAR ?auto_146872 ) ( ON ?auto_146873 ?auto_146874 ) ( CLEAR ?auto_146873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146870 ?auto_146871 ?auto_146872 ?auto_146873 )
      ( MAKE-9PILE ?auto_146870 ?auto_146871 ?auto_146872 ?auto_146873 ?auto_146874 ?auto_146875 ?auto_146876 ?auto_146877 ?auto_146878 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146889 - BLOCK
      ?auto_146890 - BLOCK
      ?auto_146891 - BLOCK
      ?auto_146892 - BLOCK
      ?auto_146893 - BLOCK
      ?auto_146894 - BLOCK
      ?auto_146895 - BLOCK
      ?auto_146896 - BLOCK
      ?auto_146897 - BLOCK
    )
    :vars
    (
      ?auto_146898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146897 ?auto_146898 ) ( ON-TABLE ?auto_146889 ) ( ON ?auto_146890 ?auto_146889 ) ( not ( = ?auto_146889 ?auto_146890 ) ) ( not ( = ?auto_146889 ?auto_146891 ) ) ( not ( = ?auto_146889 ?auto_146892 ) ) ( not ( = ?auto_146889 ?auto_146893 ) ) ( not ( = ?auto_146889 ?auto_146894 ) ) ( not ( = ?auto_146889 ?auto_146895 ) ) ( not ( = ?auto_146889 ?auto_146896 ) ) ( not ( = ?auto_146889 ?auto_146897 ) ) ( not ( = ?auto_146889 ?auto_146898 ) ) ( not ( = ?auto_146890 ?auto_146891 ) ) ( not ( = ?auto_146890 ?auto_146892 ) ) ( not ( = ?auto_146890 ?auto_146893 ) ) ( not ( = ?auto_146890 ?auto_146894 ) ) ( not ( = ?auto_146890 ?auto_146895 ) ) ( not ( = ?auto_146890 ?auto_146896 ) ) ( not ( = ?auto_146890 ?auto_146897 ) ) ( not ( = ?auto_146890 ?auto_146898 ) ) ( not ( = ?auto_146891 ?auto_146892 ) ) ( not ( = ?auto_146891 ?auto_146893 ) ) ( not ( = ?auto_146891 ?auto_146894 ) ) ( not ( = ?auto_146891 ?auto_146895 ) ) ( not ( = ?auto_146891 ?auto_146896 ) ) ( not ( = ?auto_146891 ?auto_146897 ) ) ( not ( = ?auto_146891 ?auto_146898 ) ) ( not ( = ?auto_146892 ?auto_146893 ) ) ( not ( = ?auto_146892 ?auto_146894 ) ) ( not ( = ?auto_146892 ?auto_146895 ) ) ( not ( = ?auto_146892 ?auto_146896 ) ) ( not ( = ?auto_146892 ?auto_146897 ) ) ( not ( = ?auto_146892 ?auto_146898 ) ) ( not ( = ?auto_146893 ?auto_146894 ) ) ( not ( = ?auto_146893 ?auto_146895 ) ) ( not ( = ?auto_146893 ?auto_146896 ) ) ( not ( = ?auto_146893 ?auto_146897 ) ) ( not ( = ?auto_146893 ?auto_146898 ) ) ( not ( = ?auto_146894 ?auto_146895 ) ) ( not ( = ?auto_146894 ?auto_146896 ) ) ( not ( = ?auto_146894 ?auto_146897 ) ) ( not ( = ?auto_146894 ?auto_146898 ) ) ( not ( = ?auto_146895 ?auto_146896 ) ) ( not ( = ?auto_146895 ?auto_146897 ) ) ( not ( = ?auto_146895 ?auto_146898 ) ) ( not ( = ?auto_146896 ?auto_146897 ) ) ( not ( = ?auto_146896 ?auto_146898 ) ) ( not ( = ?auto_146897 ?auto_146898 ) ) ( ON ?auto_146896 ?auto_146897 ) ( ON ?auto_146895 ?auto_146896 ) ( ON ?auto_146894 ?auto_146895 ) ( ON ?auto_146893 ?auto_146894 ) ( ON ?auto_146892 ?auto_146893 ) ( CLEAR ?auto_146890 ) ( ON ?auto_146891 ?auto_146892 ) ( CLEAR ?auto_146891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146889 ?auto_146890 ?auto_146891 )
      ( MAKE-9PILE ?auto_146889 ?auto_146890 ?auto_146891 ?auto_146892 ?auto_146893 ?auto_146894 ?auto_146895 ?auto_146896 ?auto_146897 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146908 - BLOCK
      ?auto_146909 - BLOCK
      ?auto_146910 - BLOCK
      ?auto_146911 - BLOCK
      ?auto_146912 - BLOCK
      ?auto_146913 - BLOCK
      ?auto_146914 - BLOCK
      ?auto_146915 - BLOCK
      ?auto_146916 - BLOCK
    )
    :vars
    (
      ?auto_146917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146916 ?auto_146917 ) ( ON-TABLE ?auto_146908 ) ( ON ?auto_146909 ?auto_146908 ) ( not ( = ?auto_146908 ?auto_146909 ) ) ( not ( = ?auto_146908 ?auto_146910 ) ) ( not ( = ?auto_146908 ?auto_146911 ) ) ( not ( = ?auto_146908 ?auto_146912 ) ) ( not ( = ?auto_146908 ?auto_146913 ) ) ( not ( = ?auto_146908 ?auto_146914 ) ) ( not ( = ?auto_146908 ?auto_146915 ) ) ( not ( = ?auto_146908 ?auto_146916 ) ) ( not ( = ?auto_146908 ?auto_146917 ) ) ( not ( = ?auto_146909 ?auto_146910 ) ) ( not ( = ?auto_146909 ?auto_146911 ) ) ( not ( = ?auto_146909 ?auto_146912 ) ) ( not ( = ?auto_146909 ?auto_146913 ) ) ( not ( = ?auto_146909 ?auto_146914 ) ) ( not ( = ?auto_146909 ?auto_146915 ) ) ( not ( = ?auto_146909 ?auto_146916 ) ) ( not ( = ?auto_146909 ?auto_146917 ) ) ( not ( = ?auto_146910 ?auto_146911 ) ) ( not ( = ?auto_146910 ?auto_146912 ) ) ( not ( = ?auto_146910 ?auto_146913 ) ) ( not ( = ?auto_146910 ?auto_146914 ) ) ( not ( = ?auto_146910 ?auto_146915 ) ) ( not ( = ?auto_146910 ?auto_146916 ) ) ( not ( = ?auto_146910 ?auto_146917 ) ) ( not ( = ?auto_146911 ?auto_146912 ) ) ( not ( = ?auto_146911 ?auto_146913 ) ) ( not ( = ?auto_146911 ?auto_146914 ) ) ( not ( = ?auto_146911 ?auto_146915 ) ) ( not ( = ?auto_146911 ?auto_146916 ) ) ( not ( = ?auto_146911 ?auto_146917 ) ) ( not ( = ?auto_146912 ?auto_146913 ) ) ( not ( = ?auto_146912 ?auto_146914 ) ) ( not ( = ?auto_146912 ?auto_146915 ) ) ( not ( = ?auto_146912 ?auto_146916 ) ) ( not ( = ?auto_146912 ?auto_146917 ) ) ( not ( = ?auto_146913 ?auto_146914 ) ) ( not ( = ?auto_146913 ?auto_146915 ) ) ( not ( = ?auto_146913 ?auto_146916 ) ) ( not ( = ?auto_146913 ?auto_146917 ) ) ( not ( = ?auto_146914 ?auto_146915 ) ) ( not ( = ?auto_146914 ?auto_146916 ) ) ( not ( = ?auto_146914 ?auto_146917 ) ) ( not ( = ?auto_146915 ?auto_146916 ) ) ( not ( = ?auto_146915 ?auto_146917 ) ) ( not ( = ?auto_146916 ?auto_146917 ) ) ( ON ?auto_146915 ?auto_146916 ) ( ON ?auto_146914 ?auto_146915 ) ( ON ?auto_146913 ?auto_146914 ) ( ON ?auto_146912 ?auto_146913 ) ( ON ?auto_146911 ?auto_146912 ) ( CLEAR ?auto_146909 ) ( ON ?auto_146910 ?auto_146911 ) ( CLEAR ?auto_146910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146908 ?auto_146909 ?auto_146910 )
      ( MAKE-9PILE ?auto_146908 ?auto_146909 ?auto_146910 ?auto_146911 ?auto_146912 ?auto_146913 ?auto_146914 ?auto_146915 ?auto_146916 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146927 - BLOCK
      ?auto_146928 - BLOCK
      ?auto_146929 - BLOCK
      ?auto_146930 - BLOCK
      ?auto_146931 - BLOCK
      ?auto_146932 - BLOCK
      ?auto_146933 - BLOCK
      ?auto_146934 - BLOCK
      ?auto_146935 - BLOCK
    )
    :vars
    (
      ?auto_146936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146935 ?auto_146936 ) ( ON-TABLE ?auto_146927 ) ( not ( = ?auto_146927 ?auto_146928 ) ) ( not ( = ?auto_146927 ?auto_146929 ) ) ( not ( = ?auto_146927 ?auto_146930 ) ) ( not ( = ?auto_146927 ?auto_146931 ) ) ( not ( = ?auto_146927 ?auto_146932 ) ) ( not ( = ?auto_146927 ?auto_146933 ) ) ( not ( = ?auto_146927 ?auto_146934 ) ) ( not ( = ?auto_146927 ?auto_146935 ) ) ( not ( = ?auto_146927 ?auto_146936 ) ) ( not ( = ?auto_146928 ?auto_146929 ) ) ( not ( = ?auto_146928 ?auto_146930 ) ) ( not ( = ?auto_146928 ?auto_146931 ) ) ( not ( = ?auto_146928 ?auto_146932 ) ) ( not ( = ?auto_146928 ?auto_146933 ) ) ( not ( = ?auto_146928 ?auto_146934 ) ) ( not ( = ?auto_146928 ?auto_146935 ) ) ( not ( = ?auto_146928 ?auto_146936 ) ) ( not ( = ?auto_146929 ?auto_146930 ) ) ( not ( = ?auto_146929 ?auto_146931 ) ) ( not ( = ?auto_146929 ?auto_146932 ) ) ( not ( = ?auto_146929 ?auto_146933 ) ) ( not ( = ?auto_146929 ?auto_146934 ) ) ( not ( = ?auto_146929 ?auto_146935 ) ) ( not ( = ?auto_146929 ?auto_146936 ) ) ( not ( = ?auto_146930 ?auto_146931 ) ) ( not ( = ?auto_146930 ?auto_146932 ) ) ( not ( = ?auto_146930 ?auto_146933 ) ) ( not ( = ?auto_146930 ?auto_146934 ) ) ( not ( = ?auto_146930 ?auto_146935 ) ) ( not ( = ?auto_146930 ?auto_146936 ) ) ( not ( = ?auto_146931 ?auto_146932 ) ) ( not ( = ?auto_146931 ?auto_146933 ) ) ( not ( = ?auto_146931 ?auto_146934 ) ) ( not ( = ?auto_146931 ?auto_146935 ) ) ( not ( = ?auto_146931 ?auto_146936 ) ) ( not ( = ?auto_146932 ?auto_146933 ) ) ( not ( = ?auto_146932 ?auto_146934 ) ) ( not ( = ?auto_146932 ?auto_146935 ) ) ( not ( = ?auto_146932 ?auto_146936 ) ) ( not ( = ?auto_146933 ?auto_146934 ) ) ( not ( = ?auto_146933 ?auto_146935 ) ) ( not ( = ?auto_146933 ?auto_146936 ) ) ( not ( = ?auto_146934 ?auto_146935 ) ) ( not ( = ?auto_146934 ?auto_146936 ) ) ( not ( = ?auto_146935 ?auto_146936 ) ) ( ON ?auto_146934 ?auto_146935 ) ( ON ?auto_146933 ?auto_146934 ) ( ON ?auto_146932 ?auto_146933 ) ( ON ?auto_146931 ?auto_146932 ) ( ON ?auto_146930 ?auto_146931 ) ( ON ?auto_146929 ?auto_146930 ) ( CLEAR ?auto_146927 ) ( ON ?auto_146928 ?auto_146929 ) ( CLEAR ?auto_146928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146927 ?auto_146928 )
      ( MAKE-9PILE ?auto_146927 ?auto_146928 ?auto_146929 ?auto_146930 ?auto_146931 ?auto_146932 ?auto_146933 ?auto_146934 ?auto_146935 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146946 - BLOCK
      ?auto_146947 - BLOCK
      ?auto_146948 - BLOCK
      ?auto_146949 - BLOCK
      ?auto_146950 - BLOCK
      ?auto_146951 - BLOCK
      ?auto_146952 - BLOCK
      ?auto_146953 - BLOCK
      ?auto_146954 - BLOCK
    )
    :vars
    (
      ?auto_146955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146954 ?auto_146955 ) ( ON-TABLE ?auto_146946 ) ( not ( = ?auto_146946 ?auto_146947 ) ) ( not ( = ?auto_146946 ?auto_146948 ) ) ( not ( = ?auto_146946 ?auto_146949 ) ) ( not ( = ?auto_146946 ?auto_146950 ) ) ( not ( = ?auto_146946 ?auto_146951 ) ) ( not ( = ?auto_146946 ?auto_146952 ) ) ( not ( = ?auto_146946 ?auto_146953 ) ) ( not ( = ?auto_146946 ?auto_146954 ) ) ( not ( = ?auto_146946 ?auto_146955 ) ) ( not ( = ?auto_146947 ?auto_146948 ) ) ( not ( = ?auto_146947 ?auto_146949 ) ) ( not ( = ?auto_146947 ?auto_146950 ) ) ( not ( = ?auto_146947 ?auto_146951 ) ) ( not ( = ?auto_146947 ?auto_146952 ) ) ( not ( = ?auto_146947 ?auto_146953 ) ) ( not ( = ?auto_146947 ?auto_146954 ) ) ( not ( = ?auto_146947 ?auto_146955 ) ) ( not ( = ?auto_146948 ?auto_146949 ) ) ( not ( = ?auto_146948 ?auto_146950 ) ) ( not ( = ?auto_146948 ?auto_146951 ) ) ( not ( = ?auto_146948 ?auto_146952 ) ) ( not ( = ?auto_146948 ?auto_146953 ) ) ( not ( = ?auto_146948 ?auto_146954 ) ) ( not ( = ?auto_146948 ?auto_146955 ) ) ( not ( = ?auto_146949 ?auto_146950 ) ) ( not ( = ?auto_146949 ?auto_146951 ) ) ( not ( = ?auto_146949 ?auto_146952 ) ) ( not ( = ?auto_146949 ?auto_146953 ) ) ( not ( = ?auto_146949 ?auto_146954 ) ) ( not ( = ?auto_146949 ?auto_146955 ) ) ( not ( = ?auto_146950 ?auto_146951 ) ) ( not ( = ?auto_146950 ?auto_146952 ) ) ( not ( = ?auto_146950 ?auto_146953 ) ) ( not ( = ?auto_146950 ?auto_146954 ) ) ( not ( = ?auto_146950 ?auto_146955 ) ) ( not ( = ?auto_146951 ?auto_146952 ) ) ( not ( = ?auto_146951 ?auto_146953 ) ) ( not ( = ?auto_146951 ?auto_146954 ) ) ( not ( = ?auto_146951 ?auto_146955 ) ) ( not ( = ?auto_146952 ?auto_146953 ) ) ( not ( = ?auto_146952 ?auto_146954 ) ) ( not ( = ?auto_146952 ?auto_146955 ) ) ( not ( = ?auto_146953 ?auto_146954 ) ) ( not ( = ?auto_146953 ?auto_146955 ) ) ( not ( = ?auto_146954 ?auto_146955 ) ) ( ON ?auto_146953 ?auto_146954 ) ( ON ?auto_146952 ?auto_146953 ) ( ON ?auto_146951 ?auto_146952 ) ( ON ?auto_146950 ?auto_146951 ) ( ON ?auto_146949 ?auto_146950 ) ( ON ?auto_146948 ?auto_146949 ) ( CLEAR ?auto_146946 ) ( ON ?auto_146947 ?auto_146948 ) ( CLEAR ?auto_146947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146946 ?auto_146947 )
      ( MAKE-9PILE ?auto_146946 ?auto_146947 ?auto_146948 ?auto_146949 ?auto_146950 ?auto_146951 ?auto_146952 ?auto_146953 ?auto_146954 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146965 - BLOCK
      ?auto_146966 - BLOCK
      ?auto_146967 - BLOCK
      ?auto_146968 - BLOCK
      ?auto_146969 - BLOCK
      ?auto_146970 - BLOCK
      ?auto_146971 - BLOCK
      ?auto_146972 - BLOCK
      ?auto_146973 - BLOCK
    )
    :vars
    (
      ?auto_146974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146973 ?auto_146974 ) ( not ( = ?auto_146965 ?auto_146966 ) ) ( not ( = ?auto_146965 ?auto_146967 ) ) ( not ( = ?auto_146965 ?auto_146968 ) ) ( not ( = ?auto_146965 ?auto_146969 ) ) ( not ( = ?auto_146965 ?auto_146970 ) ) ( not ( = ?auto_146965 ?auto_146971 ) ) ( not ( = ?auto_146965 ?auto_146972 ) ) ( not ( = ?auto_146965 ?auto_146973 ) ) ( not ( = ?auto_146965 ?auto_146974 ) ) ( not ( = ?auto_146966 ?auto_146967 ) ) ( not ( = ?auto_146966 ?auto_146968 ) ) ( not ( = ?auto_146966 ?auto_146969 ) ) ( not ( = ?auto_146966 ?auto_146970 ) ) ( not ( = ?auto_146966 ?auto_146971 ) ) ( not ( = ?auto_146966 ?auto_146972 ) ) ( not ( = ?auto_146966 ?auto_146973 ) ) ( not ( = ?auto_146966 ?auto_146974 ) ) ( not ( = ?auto_146967 ?auto_146968 ) ) ( not ( = ?auto_146967 ?auto_146969 ) ) ( not ( = ?auto_146967 ?auto_146970 ) ) ( not ( = ?auto_146967 ?auto_146971 ) ) ( not ( = ?auto_146967 ?auto_146972 ) ) ( not ( = ?auto_146967 ?auto_146973 ) ) ( not ( = ?auto_146967 ?auto_146974 ) ) ( not ( = ?auto_146968 ?auto_146969 ) ) ( not ( = ?auto_146968 ?auto_146970 ) ) ( not ( = ?auto_146968 ?auto_146971 ) ) ( not ( = ?auto_146968 ?auto_146972 ) ) ( not ( = ?auto_146968 ?auto_146973 ) ) ( not ( = ?auto_146968 ?auto_146974 ) ) ( not ( = ?auto_146969 ?auto_146970 ) ) ( not ( = ?auto_146969 ?auto_146971 ) ) ( not ( = ?auto_146969 ?auto_146972 ) ) ( not ( = ?auto_146969 ?auto_146973 ) ) ( not ( = ?auto_146969 ?auto_146974 ) ) ( not ( = ?auto_146970 ?auto_146971 ) ) ( not ( = ?auto_146970 ?auto_146972 ) ) ( not ( = ?auto_146970 ?auto_146973 ) ) ( not ( = ?auto_146970 ?auto_146974 ) ) ( not ( = ?auto_146971 ?auto_146972 ) ) ( not ( = ?auto_146971 ?auto_146973 ) ) ( not ( = ?auto_146971 ?auto_146974 ) ) ( not ( = ?auto_146972 ?auto_146973 ) ) ( not ( = ?auto_146972 ?auto_146974 ) ) ( not ( = ?auto_146973 ?auto_146974 ) ) ( ON ?auto_146972 ?auto_146973 ) ( ON ?auto_146971 ?auto_146972 ) ( ON ?auto_146970 ?auto_146971 ) ( ON ?auto_146969 ?auto_146970 ) ( ON ?auto_146968 ?auto_146969 ) ( ON ?auto_146967 ?auto_146968 ) ( ON ?auto_146966 ?auto_146967 ) ( ON ?auto_146965 ?auto_146966 ) ( CLEAR ?auto_146965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146965 )
      ( MAKE-9PILE ?auto_146965 ?auto_146966 ?auto_146967 ?auto_146968 ?auto_146969 ?auto_146970 ?auto_146971 ?auto_146972 ?auto_146973 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_146984 - BLOCK
      ?auto_146985 - BLOCK
      ?auto_146986 - BLOCK
      ?auto_146987 - BLOCK
      ?auto_146988 - BLOCK
      ?auto_146989 - BLOCK
      ?auto_146990 - BLOCK
      ?auto_146991 - BLOCK
      ?auto_146992 - BLOCK
    )
    :vars
    (
      ?auto_146993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146992 ?auto_146993 ) ( not ( = ?auto_146984 ?auto_146985 ) ) ( not ( = ?auto_146984 ?auto_146986 ) ) ( not ( = ?auto_146984 ?auto_146987 ) ) ( not ( = ?auto_146984 ?auto_146988 ) ) ( not ( = ?auto_146984 ?auto_146989 ) ) ( not ( = ?auto_146984 ?auto_146990 ) ) ( not ( = ?auto_146984 ?auto_146991 ) ) ( not ( = ?auto_146984 ?auto_146992 ) ) ( not ( = ?auto_146984 ?auto_146993 ) ) ( not ( = ?auto_146985 ?auto_146986 ) ) ( not ( = ?auto_146985 ?auto_146987 ) ) ( not ( = ?auto_146985 ?auto_146988 ) ) ( not ( = ?auto_146985 ?auto_146989 ) ) ( not ( = ?auto_146985 ?auto_146990 ) ) ( not ( = ?auto_146985 ?auto_146991 ) ) ( not ( = ?auto_146985 ?auto_146992 ) ) ( not ( = ?auto_146985 ?auto_146993 ) ) ( not ( = ?auto_146986 ?auto_146987 ) ) ( not ( = ?auto_146986 ?auto_146988 ) ) ( not ( = ?auto_146986 ?auto_146989 ) ) ( not ( = ?auto_146986 ?auto_146990 ) ) ( not ( = ?auto_146986 ?auto_146991 ) ) ( not ( = ?auto_146986 ?auto_146992 ) ) ( not ( = ?auto_146986 ?auto_146993 ) ) ( not ( = ?auto_146987 ?auto_146988 ) ) ( not ( = ?auto_146987 ?auto_146989 ) ) ( not ( = ?auto_146987 ?auto_146990 ) ) ( not ( = ?auto_146987 ?auto_146991 ) ) ( not ( = ?auto_146987 ?auto_146992 ) ) ( not ( = ?auto_146987 ?auto_146993 ) ) ( not ( = ?auto_146988 ?auto_146989 ) ) ( not ( = ?auto_146988 ?auto_146990 ) ) ( not ( = ?auto_146988 ?auto_146991 ) ) ( not ( = ?auto_146988 ?auto_146992 ) ) ( not ( = ?auto_146988 ?auto_146993 ) ) ( not ( = ?auto_146989 ?auto_146990 ) ) ( not ( = ?auto_146989 ?auto_146991 ) ) ( not ( = ?auto_146989 ?auto_146992 ) ) ( not ( = ?auto_146989 ?auto_146993 ) ) ( not ( = ?auto_146990 ?auto_146991 ) ) ( not ( = ?auto_146990 ?auto_146992 ) ) ( not ( = ?auto_146990 ?auto_146993 ) ) ( not ( = ?auto_146991 ?auto_146992 ) ) ( not ( = ?auto_146991 ?auto_146993 ) ) ( not ( = ?auto_146992 ?auto_146993 ) ) ( ON ?auto_146991 ?auto_146992 ) ( ON ?auto_146990 ?auto_146991 ) ( ON ?auto_146989 ?auto_146990 ) ( ON ?auto_146988 ?auto_146989 ) ( ON ?auto_146987 ?auto_146988 ) ( ON ?auto_146986 ?auto_146987 ) ( ON ?auto_146985 ?auto_146986 ) ( ON ?auto_146984 ?auto_146985 ) ( CLEAR ?auto_146984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146984 )
      ( MAKE-9PILE ?auto_146984 ?auto_146985 ?auto_146986 ?auto_146987 ?auto_146988 ?auto_146989 ?auto_146990 ?auto_146991 ?auto_146992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147004 - BLOCK
      ?auto_147005 - BLOCK
      ?auto_147006 - BLOCK
      ?auto_147007 - BLOCK
      ?auto_147008 - BLOCK
      ?auto_147009 - BLOCK
      ?auto_147010 - BLOCK
      ?auto_147011 - BLOCK
      ?auto_147012 - BLOCK
      ?auto_147013 - BLOCK
    )
    :vars
    (
      ?auto_147014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147012 ) ( ON ?auto_147013 ?auto_147014 ) ( CLEAR ?auto_147013 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147004 ) ( ON ?auto_147005 ?auto_147004 ) ( ON ?auto_147006 ?auto_147005 ) ( ON ?auto_147007 ?auto_147006 ) ( ON ?auto_147008 ?auto_147007 ) ( ON ?auto_147009 ?auto_147008 ) ( ON ?auto_147010 ?auto_147009 ) ( ON ?auto_147011 ?auto_147010 ) ( ON ?auto_147012 ?auto_147011 ) ( not ( = ?auto_147004 ?auto_147005 ) ) ( not ( = ?auto_147004 ?auto_147006 ) ) ( not ( = ?auto_147004 ?auto_147007 ) ) ( not ( = ?auto_147004 ?auto_147008 ) ) ( not ( = ?auto_147004 ?auto_147009 ) ) ( not ( = ?auto_147004 ?auto_147010 ) ) ( not ( = ?auto_147004 ?auto_147011 ) ) ( not ( = ?auto_147004 ?auto_147012 ) ) ( not ( = ?auto_147004 ?auto_147013 ) ) ( not ( = ?auto_147004 ?auto_147014 ) ) ( not ( = ?auto_147005 ?auto_147006 ) ) ( not ( = ?auto_147005 ?auto_147007 ) ) ( not ( = ?auto_147005 ?auto_147008 ) ) ( not ( = ?auto_147005 ?auto_147009 ) ) ( not ( = ?auto_147005 ?auto_147010 ) ) ( not ( = ?auto_147005 ?auto_147011 ) ) ( not ( = ?auto_147005 ?auto_147012 ) ) ( not ( = ?auto_147005 ?auto_147013 ) ) ( not ( = ?auto_147005 ?auto_147014 ) ) ( not ( = ?auto_147006 ?auto_147007 ) ) ( not ( = ?auto_147006 ?auto_147008 ) ) ( not ( = ?auto_147006 ?auto_147009 ) ) ( not ( = ?auto_147006 ?auto_147010 ) ) ( not ( = ?auto_147006 ?auto_147011 ) ) ( not ( = ?auto_147006 ?auto_147012 ) ) ( not ( = ?auto_147006 ?auto_147013 ) ) ( not ( = ?auto_147006 ?auto_147014 ) ) ( not ( = ?auto_147007 ?auto_147008 ) ) ( not ( = ?auto_147007 ?auto_147009 ) ) ( not ( = ?auto_147007 ?auto_147010 ) ) ( not ( = ?auto_147007 ?auto_147011 ) ) ( not ( = ?auto_147007 ?auto_147012 ) ) ( not ( = ?auto_147007 ?auto_147013 ) ) ( not ( = ?auto_147007 ?auto_147014 ) ) ( not ( = ?auto_147008 ?auto_147009 ) ) ( not ( = ?auto_147008 ?auto_147010 ) ) ( not ( = ?auto_147008 ?auto_147011 ) ) ( not ( = ?auto_147008 ?auto_147012 ) ) ( not ( = ?auto_147008 ?auto_147013 ) ) ( not ( = ?auto_147008 ?auto_147014 ) ) ( not ( = ?auto_147009 ?auto_147010 ) ) ( not ( = ?auto_147009 ?auto_147011 ) ) ( not ( = ?auto_147009 ?auto_147012 ) ) ( not ( = ?auto_147009 ?auto_147013 ) ) ( not ( = ?auto_147009 ?auto_147014 ) ) ( not ( = ?auto_147010 ?auto_147011 ) ) ( not ( = ?auto_147010 ?auto_147012 ) ) ( not ( = ?auto_147010 ?auto_147013 ) ) ( not ( = ?auto_147010 ?auto_147014 ) ) ( not ( = ?auto_147011 ?auto_147012 ) ) ( not ( = ?auto_147011 ?auto_147013 ) ) ( not ( = ?auto_147011 ?auto_147014 ) ) ( not ( = ?auto_147012 ?auto_147013 ) ) ( not ( = ?auto_147012 ?auto_147014 ) ) ( not ( = ?auto_147013 ?auto_147014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147013 ?auto_147014 )
      ( !STACK ?auto_147013 ?auto_147012 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147025 - BLOCK
      ?auto_147026 - BLOCK
      ?auto_147027 - BLOCK
      ?auto_147028 - BLOCK
      ?auto_147029 - BLOCK
      ?auto_147030 - BLOCK
      ?auto_147031 - BLOCK
      ?auto_147032 - BLOCK
      ?auto_147033 - BLOCK
      ?auto_147034 - BLOCK
    )
    :vars
    (
      ?auto_147035 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147033 ) ( ON ?auto_147034 ?auto_147035 ) ( CLEAR ?auto_147034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147025 ) ( ON ?auto_147026 ?auto_147025 ) ( ON ?auto_147027 ?auto_147026 ) ( ON ?auto_147028 ?auto_147027 ) ( ON ?auto_147029 ?auto_147028 ) ( ON ?auto_147030 ?auto_147029 ) ( ON ?auto_147031 ?auto_147030 ) ( ON ?auto_147032 ?auto_147031 ) ( ON ?auto_147033 ?auto_147032 ) ( not ( = ?auto_147025 ?auto_147026 ) ) ( not ( = ?auto_147025 ?auto_147027 ) ) ( not ( = ?auto_147025 ?auto_147028 ) ) ( not ( = ?auto_147025 ?auto_147029 ) ) ( not ( = ?auto_147025 ?auto_147030 ) ) ( not ( = ?auto_147025 ?auto_147031 ) ) ( not ( = ?auto_147025 ?auto_147032 ) ) ( not ( = ?auto_147025 ?auto_147033 ) ) ( not ( = ?auto_147025 ?auto_147034 ) ) ( not ( = ?auto_147025 ?auto_147035 ) ) ( not ( = ?auto_147026 ?auto_147027 ) ) ( not ( = ?auto_147026 ?auto_147028 ) ) ( not ( = ?auto_147026 ?auto_147029 ) ) ( not ( = ?auto_147026 ?auto_147030 ) ) ( not ( = ?auto_147026 ?auto_147031 ) ) ( not ( = ?auto_147026 ?auto_147032 ) ) ( not ( = ?auto_147026 ?auto_147033 ) ) ( not ( = ?auto_147026 ?auto_147034 ) ) ( not ( = ?auto_147026 ?auto_147035 ) ) ( not ( = ?auto_147027 ?auto_147028 ) ) ( not ( = ?auto_147027 ?auto_147029 ) ) ( not ( = ?auto_147027 ?auto_147030 ) ) ( not ( = ?auto_147027 ?auto_147031 ) ) ( not ( = ?auto_147027 ?auto_147032 ) ) ( not ( = ?auto_147027 ?auto_147033 ) ) ( not ( = ?auto_147027 ?auto_147034 ) ) ( not ( = ?auto_147027 ?auto_147035 ) ) ( not ( = ?auto_147028 ?auto_147029 ) ) ( not ( = ?auto_147028 ?auto_147030 ) ) ( not ( = ?auto_147028 ?auto_147031 ) ) ( not ( = ?auto_147028 ?auto_147032 ) ) ( not ( = ?auto_147028 ?auto_147033 ) ) ( not ( = ?auto_147028 ?auto_147034 ) ) ( not ( = ?auto_147028 ?auto_147035 ) ) ( not ( = ?auto_147029 ?auto_147030 ) ) ( not ( = ?auto_147029 ?auto_147031 ) ) ( not ( = ?auto_147029 ?auto_147032 ) ) ( not ( = ?auto_147029 ?auto_147033 ) ) ( not ( = ?auto_147029 ?auto_147034 ) ) ( not ( = ?auto_147029 ?auto_147035 ) ) ( not ( = ?auto_147030 ?auto_147031 ) ) ( not ( = ?auto_147030 ?auto_147032 ) ) ( not ( = ?auto_147030 ?auto_147033 ) ) ( not ( = ?auto_147030 ?auto_147034 ) ) ( not ( = ?auto_147030 ?auto_147035 ) ) ( not ( = ?auto_147031 ?auto_147032 ) ) ( not ( = ?auto_147031 ?auto_147033 ) ) ( not ( = ?auto_147031 ?auto_147034 ) ) ( not ( = ?auto_147031 ?auto_147035 ) ) ( not ( = ?auto_147032 ?auto_147033 ) ) ( not ( = ?auto_147032 ?auto_147034 ) ) ( not ( = ?auto_147032 ?auto_147035 ) ) ( not ( = ?auto_147033 ?auto_147034 ) ) ( not ( = ?auto_147033 ?auto_147035 ) ) ( not ( = ?auto_147034 ?auto_147035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147034 ?auto_147035 )
      ( !STACK ?auto_147034 ?auto_147033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147046 - BLOCK
      ?auto_147047 - BLOCK
      ?auto_147048 - BLOCK
      ?auto_147049 - BLOCK
      ?auto_147050 - BLOCK
      ?auto_147051 - BLOCK
      ?auto_147052 - BLOCK
      ?auto_147053 - BLOCK
      ?auto_147054 - BLOCK
      ?auto_147055 - BLOCK
    )
    :vars
    (
      ?auto_147056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147055 ?auto_147056 ) ( ON-TABLE ?auto_147046 ) ( ON ?auto_147047 ?auto_147046 ) ( ON ?auto_147048 ?auto_147047 ) ( ON ?auto_147049 ?auto_147048 ) ( ON ?auto_147050 ?auto_147049 ) ( ON ?auto_147051 ?auto_147050 ) ( ON ?auto_147052 ?auto_147051 ) ( ON ?auto_147053 ?auto_147052 ) ( not ( = ?auto_147046 ?auto_147047 ) ) ( not ( = ?auto_147046 ?auto_147048 ) ) ( not ( = ?auto_147046 ?auto_147049 ) ) ( not ( = ?auto_147046 ?auto_147050 ) ) ( not ( = ?auto_147046 ?auto_147051 ) ) ( not ( = ?auto_147046 ?auto_147052 ) ) ( not ( = ?auto_147046 ?auto_147053 ) ) ( not ( = ?auto_147046 ?auto_147054 ) ) ( not ( = ?auto_147046 ?auto_147055 ) ) ( not ( = ?auto_147046 ?auto_147056 ) ) ( not ( = ?auto_147047 ?auto_147048 ) ) ( not ( = ?auto_147047 ?auto_147049 ) ) ( not ( = ?auto_147047 ?auto_147050 ) ) ( not ( = ?auto_147047 ?auto_147051 ) ) ( not ( = ?auto_147047 ?auto_147052 ) ) ( not ( = ?auto_147047 ?auto_147053 ) ) ( not ( = ?auto_147047 ?auto_147054 ) ) ( not ( = ?auto_147047 ?auto_147055 ) ) ( not ( = ?auto_147047 ?auto_147056 ) ) ( not ( = ?auto_147048 ?auto_147049 ) ) ( not ( = ?auto_147048 ?auto_147050 ) ) ( not ( = ?auto_147048 ?auto_147051 ) ) ( not ( = ?auto_147048 ?auto_147052 ) ) ( not ( = ?auto_147048 ?auto_147053 ) ) ( not ( = ?auto_147048 ?auto_147054 ) ) ( not ( = ?auto_147048 ?auto_147055 ) ) ( not ( = ?auto_147048 ?auto_147056 ) ) ( not ( = ?auto_147049 ?auto_147050 ) ) ( not ( = ?auto_147049 ?auto_147051 ) ) ( not ( = ?auto_147049 ?auto_147052 ) ) ( not ( = ?auto_147049 ?auto_147053 ) ) ( not ( = ?auto_147049 ?auto_147054 ) ) ( not ( = ?auto_147049 ?auto_147055 ) ) ( not ( = ?auto_147049 ?auto_147056 ) ) ( not ( = ?auto_147050 ?auto_147051 ) ) ( not ( = ?auto_147050 ?auto_147052 ) ) ( not ( = ?auto_147050 ?auto_147053 ) ) ( not ( = ?auto_147050 ?auto_147054 ) ) ( not ( = ?auto_147050 ?auto_147055 ) ) ( not ( = ?auto_147050 ?auto_147056 ) ) ( not ( = ?auto_147051 ?auto_147052 ) ) ( not ( = ?auto_147051 ?auto_147053 ) ) ( not ( = ?auto_147051 ?auto_147054 ) ) ( not ( = ?auto_147051 ?auto_147055 ) ) ( not ( = ?auto_147051 ?auto_147056 ) ) ( not ( = ?auto_147052 ?auto_147053 ) ) ( not ( = ?auto_147052 ?auto_147054 ) ) ( not ( = ?auto_147052 ?auto_147055 ) ) ( not ( = ?auto_147052 ?auto_147056 ) ) ( not ( = ?auto_147053 ?auto_147054 ) ) ( not ( = ?auto_147053 ?auto_147055 ) ) ( not ( = ?auto_147053 ?auto_147056 ) ) ( not ( = ?auto_147054 ?auto_147055 ) ) ( not ( = ?auto_147054 ?auto_147056 ) ) ( not ( = ?auto_147055 ?auto_147056 ) ) ( CLEAR ?auto_147053 ) ( ON ?auto_147054 ?auto_147055 ) ( CLEAR ?auto_147054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_147046 ?auto_147047 ?auto_147048 ?auto_147049 ?auto_147050 ?auto_147051 ?auto_147052 ?auto_147053 ?auto_147054 )
      ( MAKE-10PILE ?auto_147046 ?auto_147047 ?auto_147048 ?auto_147049 ?auto_147050 ?auto_147051 ?auto_147052 ?auto_147053 ?auto_147054 ?auto_147055 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147067 - BLOCK
      ?auto_147068 - BLOCK
      ?auto_147069 - BLOCK
      ?auto_147070 - BLOCK
      ?auto_147071 - BLOCK
      ?auto_147072 - BLOCK
      ?auto_147073 - BLOCK
      ?auto_147074 - BLOCK
      ?auto_147075 - BLOCK
      ?auto_147076 - BLOCK
    )
    :vars
    (
      ?auto_147077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147076 ?auto_147077 ) ( ON-TABLE ?auto_147067 ) ( ON ?auto_147068 ?auto_147067 ) ( ON ?auto_147069 ?auto_147068 ) ( ON ?auto_147070 ?auto_147069 ) ( ON ?auto_147071 ?auto_147070 ) ( ON ?auto_147072 ?auto_147071 ) ( ON ?auto_147073 ?auto_147072 ) ( ON ?auto_147074 ?auto_147073 ) ( not ( = ?auto_147067 ?auto_147068 ) ) ( not ( = ?auto_147067 ?auto_147069 ) ) ( not ( = ?auto_147067 ?auto_147070 ) ) ( not ( = ?auto_147067 ?auto_147071 ) ) ( not ( = ?auto_147067 ?auto_147072 ) ) ( not ( = ?auto_147067 ?auto_147073 ) ) ( not ( = ?auto_147067 ?auto_147074 ) ) ( not ( = ?auto_147067 ?auto_147075 ) ) ( not ( = ?auto_147067 ?auto_147076 ) ) ( not ( = ?auto_147067 ?auto_147077 ) ) ( not ( = ?auto_147068 ?auto_147069 ) ) ( not ( = ?auto_147068 ?auto_147070 ) ) ( not ( = ?auto_147068 ?auto_147071 ) ) ( not ( = ?auto_147068 ?auto_147072 ) ) ( not ( = ?auto_147068 ?auto_147073 ) ) ( not ( = ?auto_147068 ?auto_147074 ) ) ( not ( = ?auto_147068 ?auto_147075 ) ) ( not ( = ?auto_147068 ?auto_147076 ) ) ( not ( = ?auto_147068 ?auto_147077 ) ) ( not ( = ?auto_147069 ?auto_147070 ) ) ( not ( = ?auto_147069 ?auto_147071 ) ) ( not ( = ?auto_147069 ?auto_147072 ) ) ( not ( = ?auto_147069 ?auto_147073 ) ) ( not ( = ?auto_147069 ?auto_147074 ) ) ( not ( = ?auto_147069 ?auto_147075 ) ) ( not ( = ?auto_147069 ?auto_147076 ) ) ( not ( = ?auto_147069 ?auto_147077 ) ) ( not ( = ?auto_147070 ?auto_147071 ) ) ( not ( = ?auto_147070 ?auto_147072 ) ) ( not ( = ?auto_147070 ?auto_147073 ) ) ( not ( = ?auto_147070 ?auto_147074 ) ) ( not ( = ?auto_147070 ?auto_147075 ) ) ( not ( = ?auto_147070 ?auto_147076 ) ) ( not ( = ?auto_147070 ?auto_147077 ) ) ( not ( = ?auto_147071 ?auto_147072 ) ) ( not ( = ?auto_147071 ?auto_147073 ) ) ( not ( = ?auto_147071 ?auto_147074 ) ) ( not ( = ?auto_147071 ?auto_147075 ) ) ( not ( = ?auto_147071 ?auto_147076 ) ) ( not ( = ?auto_147071 ?auto_147077 ) ) ( not ( = ?auto_147072 ?auto_147073 ) ) ( not ( = ?auto_147072 ?auto_147074 ) ) ( not ( = ?auto_147072 ?auto_147075 ) ) ( not ( = ?auto_147072 ?auto_147076 ) ) ( not ( = ?auto_147072 ?auto_147077 ) ) ( not ( = ?auto_147073 ?auto_147074 ) ) ( not ( = ?auto_147073 ?auto_147075 ) ) ( not ( = ?auto_147073 ?auto_147076 ) ) ( not ( = ?auto_147073 ?auto_147077 ) ) ( not ( = ?auto_147074 ?auto_147075 ) ) ( not ( = ?auto_147074 ?auto_147076 ) ) ( not ( = ?auto_147074 ?auto_147077 ) ) ( not ( = ?auto_147075 ?auto_147076 ) ) ( not ( = ?auto_147075 ?auto_147077 ) ) ( not ( = ?auto_147076 ?auto_147077 ) ) ( CLEAR ?auto_147074 ) ( ON ?auto_147075 ?auto_147076 ) ( CLEAR ?auto_147075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_147067 ?auto_147068 ?auto_147069 ?auto_147070 ?auto_147071 ?auto_147072 ?auto_147073 ?auto_147074 ?auto_147075 )
      ( MAKE-10PILE ?auto_147067 ?auto_147068 ?auto_147069 ?auto_147070 ?auto_147071 ?auto_147072 ?auto_147073 ?auto_147074 ?auto_147075 ?auto_147076 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147088 - BLOCK
      ?auto_147089 - BLOCK
      ?auto_147090 - BLOCK
      ?auto_147091 - BLOCK
      ?auto_147092 - BLOCK
      ?auto_147093 - BLOCK
      ?auto_147094 - BLOCK
      ?auto_147095 - BLOCK
      ?auto_147096 - BLOCK
      ?auto_147097 - BLOCK
    )
    :vars
    (
      ?auto_147098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147097 ?auto_147098 ) ( ON-TABLE ?auto_147088 ) ( ON ?auto_147089 ?auto_147088 ) ( ON ?auto_147090 ?auto_147089 ) ( ON ?auto_147091 ?auto_147090 ) ( ON ?auto_147092 ?auto_147091 ) ( ON ?auto_147093 ?auto_147092 ) ( ON ?auto_147094 ?auto_147093 ) ( not ( = ?auto_147088 ?auto_147089 ) ) ( not ( = ?auto_147088 ?auto_147090 ) ) ( not ( = ?auto_147088 ?auto_147091 ) ) ( not ( = ?auto_147088 ?auto_147092 ) ) ( not ( = ?auto_147088 ?auto_147093 ) ) ( not ( = ?auto_147088 ?auto_147094 ) ) ( not ( = ?auto_147088 ?auto_147095 ) ) ( not ( = ?auto_147088 ?auto_147096 ) ) ( not ( = ?auto_147088 ?auto_147097 ) ) ( not ( = ?auto_147088 ?auto_147098 ) ) ( not ( = ?auto_147089 ?auto_147090 ) ) ( not ( = ?auto_147089 ?auto_147091 ) ) ( not ( = ?auto_147089 ?auto_147092 ) ) ( not ( = ?auto_147089 ?auto_147093 ) ) ( not ( = ?auto_147089 ?auto_147094 ) ) ( not ( = ?auto_147089 ?auto_147095 ) ) ( not ( = ?auto_147089 ?auto_147096 ) ) ( not ( = ?auto_147089 ?auto_147097 ) ) ( not ( = ?auto_147089 ?auto_147098 ) ) ( not ( = ?auto_147090 ?auto_147091 ) ) ( not ( = ?auto_147090 ?auto_147092 ) ) ( not ( = ?auto_147090 ?auto_147093 ) ) ( not ( = ?auto_147090 ?auto_147094 ) ) ( not ( = ?auto_147090 ?auto_147095 ) ) ( not ( = ?auto_147090 ?auto_147096 ) ) ( not ( = ?auto_147090 ?auto_147097 ) ) ( not ( = ?auto_147090 ?auto_147098 ) ) ( not ( = ?auto_147091 ?auto_147092 ) ) ( not ( = ?auto_147091 ?auto_147093 ) ) ( not ( = ?auto_147091 ?auto_147094 ) ) ( not ( = ?auto_147091 ?auto_147095 ) ) ( not ( = ?auto_147091 ?auto_147096 ) ) ( not ( = ?auto_147091 ?auto_147097 ) ) ( not ( = ?auto_147091 ?auto_147098 ) ) ( not ( = ?auto_147092 ?auto_147093 ) ) ( not ( = ?auto_147092 ?auto_147094 ) ) ( not ( = ?auto_147092 ?auto_147095 ) ) ( not ( = ?auto_147092 ?auto_147096 ) ) ( not ( = ?auto_147092 ?auto_147097 ) ) ( not ( = ?auto_147092 ?auto_147098 ) ) ( not ( = ?auto_147093 ?auto_147094 ) ) ( not ( = ?auto_147093 ?auto_147095 ) ) ( not ( = ?auto_147093 ?auto_147096 ) ) ( not ( = ?auto_147093 ?auto_147097 ) ) ( not ( = ?auto_147093 ?auto_147098 ) ) ( not ( = ?auto_147094 ?auto_147095 ) ) ( not ( = ?auto_147094 ?auto_147096 ) ) ( not ( = ?auto_147094 ?auto_147097 ) ) ( not ( = ?auto_147094 ?auto_147098 ) ) ( not ( = ?auto_147095 ?auto_147096 ) ) ( not ( = ?auto_147095 ?auto_147097 ) ) ( not ( = ?auto_147095 ?auto_147098 ) ) ( not ( = ?auto_147096 ?auto_147097 ) ) ( not ( = ?auto_147096 ?auto_147098 ) ) ( not ( = ?auto_147097 ?auto_147098 ) ) ( ON ?auto_147096 ?auto_147097 ) ( CLEAR ?auto_147094 ) ( ON ?auto_147095 ?auto_147096 ) ( CLEAR ?auto_147095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147088 ?auto_147089 ?auto_147090 ?auto_147091 ?auto_147092 ?auto_147093 ?auto_147094 ?auto_147095 )
      ( MAKE-10PILE ?auto_147088 ?auto_147089 ?auto_147090 ?auto_147091 ?auto_147092 ?auto_147093 ?auto_147094 ?auto_147095 ?auto_147096 ?auto_147097 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147109 - BLOCK
      ?auto_147110 - BLOCK
      ?auto_147111 - BLOCK
      ?auto_147112 - BLOCK
      ?auto_147113 - BLOCK
      ?auto_147114 - BLOCK
      ?auto_147115 - BLOCK
      ?auto_147116 - BLOCK
      ?auto_147117 - BLOCK
      ?auto_147118 - BLOCK
    )
    :vars
    (
      ?auto_147119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147118 ?auto_147119 ) ( ON-TABLE ?auto_147109 ) ( ON ?auto_147110 ?auto_147109 ) ( ON ?auto_147111 ?auto_147110 ) ( ON ?auto_147112 ?auto_147111 ) ( ON ?auto_147113 ?auto_147112 ) ( ON ?auto_147114 ?auto_147113 ) ( ON ?auto_147115 ?auto_147114 ) ( not ( = ?auto_147109 ?auto_147110 ) ) ( not ( = ?auto_147109 ?auto_147111 ) ) ( not ( = ?auto_147109 ?auto_147112 ) ) ( not ( = ?auto_147109 ?auto_147113 ) ) ( not ( = ?auto_147109 ?auto_147114 ) ) ( not ( = ?auto_147109 ?auto_147115 ) ) ( not ( = ?auto_147109 ?auto_147116 ) ) ( not ( = ?auto_147109 ?auto_147117 ) ) ( not ( = ?auto_147109 ?auto_147118 ) ) ( not ( = ?auto_147109 ?auto_147119 ) ) ( not ( = ?auto_147110 ?auto_147111 ) ) ( not ( = ?auto_147110 ?auto_147112 ) ) ( not ( = ?auto_147110 ?auto_147113 ) ) ( not ( = ?auto_147110 ?auto_147114 ) ) ( not ( = ?auto_147110 ?auto_147115 ) ) ( not ( = ?auto_147110 ?auto_147116 ) ) ( not ( = ?auto_147110 ?auto_147117 ) ) ( not ( = ?auto_147110 ?auto_147118 ) ) ( not ( = ?auto_147110 ?auto_147119 ) ) ( not ( = ?auto_147111 ?auto_147112 ) ) ( not ( = ?auto_147111 ?auto_147113 ) ) ( not ( = ?auto_147111 ?auto_147114 ) ) ( not ( = ?auto_147111 ?auto_147115 ) ) ( not ( = ?auto_147111 ?auto_147116 ) ) ( not ( = ?auto_147111 ?auto_147117 ) ) ( not ( = ?auto_147111 ?auto_147118 ) ) ( not ( = ?auto_147111 ?auto_147119 ) ) ( not ( = ?auto_147112 ?auto_147113 ) ) ( not ( = ?auto_147112 ?auto_147114 ) ) ( not ( = ?auto_147112 ?auto_147115 ) ) ( not ( = ?auto_147112 ?auto_147116 ) ) ( not ( = ?auto_147112 ?auto_147117 ) ) ( not ( = ?auto_147112 ?auto_147118 ) ) ( not ( = ?auto_147112 ?auto_147119 ) ) ( not ( = ?auto_147113 ?auto_147114 ) ) ( not ( = ?auto_147113 ?auto_147115 ) ) ( not ( = ?auto_147113 ?auto_147116 ) ) ( not ( = ?auto_147113 ?auto_147117 ) ) ( not ( = ?auto_147113 ?auto_147118 ) ) ( not ( = ?auto_147113 ?auto_147119 ) ) ( not ( = ?auto_147114 ?auto_147115 ) ) ( not ( = ?auto_147114 ?auto_147116 ) ) ( not ( = ?auto_147114 ?auto_147117 ) ) ( not ( = ?auto_147114 ?auto_147118 ) ) ( not ( = ?auto_147114 ?auto_147119 ) ) ( not ( = ?auto_147115 ?auto_147116 ) ) ( not ( = ?auto_147115 ?auto_147117 ) ) ( not ( = ?auto_147115 ?auto_147118 ) ) ( not ( = ?auto_147115 ?auto_147119 ) ) ( not ( = ?auto_147116 ?auto_147117 ) ) ( not ( = ?auto_147116 ?auto_147118 ) ) ( not ( = ?auto_147116 ?auto_147119 ) ) ( not ( = ?auto_147117 ?auto_147118 ) ) ( not ( = ?auto_147117 ?auto_147119 ) ) ( not ( = ?auto_147118 ?auto_147119 ) ) ( ON ?auto_147117 ?auto_147118 ) ( CLEAR ?auto_147115 ) ( ON ?auto_147116 ?auto_147117 ) ( CLEAR ?auto_147116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147109 ?auto_147110 ?auto_147111 ?auto_147112 ?auto_147113 ?auto_147114 ?auto_147115 ?auto_147116 )
      ( MAKE-10PILE ?auto_147109 ?auto_147110 ?auto_147111 ?auto_147112 ?auto_147113 ?auto_147114 ?auto_147115 ?auto_147116 ?auto_147117 ?auto_147118 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147130 - BLOCK
      ?auto_147131 - BLOCK
      ?auto_147132 - BLOCK
      ?auto_147133 - BLOCK
      ?auto_147134 - BLOCK
      ?auto_147135 - BLOCK
      ?auto_147136 - BLOCK
      ?auto_147137 - BLOCK
      ?auto_147138 - BLOCK
      ?auto_147139 - BLOCK
    )
    :vars
    (
      ?auto_147140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147139 ?auto_147140 ) ( ON-TABLE ?auto_147130 ) ( ON ?auto_147131 ?auto_147130 ) ( ON ?auto_147132 ?auto_147131 ) ( ON ?auto_147133 ?auto_147132 ) ( ON ?auto_147134 ?auto_147133 ) ( ON ?auto_147135 ?auto_147134 ) ( not ( = ?auto_147130 ?auto_147131 ) ) ( not ( = ?auto_147130 ?auto_147132 ) ) ( not ( = ?auto_147130 ?auto_147133 ) ) ( not ( = ?auto_147130 ?auto_147134 ) ) ( not ( = ?auto_147130 ?auto_147135 ) ) ( not ( = ?auto_147130 ?auto_147136 ) ) ( not ( = ?auto_147130 ?auto_147137 ) ) ( not ( = ?auto_147130 ?auto_147138 ) ) ( not ( = ?auto_147130 ?auto_147139 ) ) ( not ( = ?auto_147130 ?auto_147140 ) ) ( not ( = ?auto_147131 ?auto_147132 ) ) ( not ( = ?auto_147131 ?auto_147133 ) ) ( not ( = ?auto_147131 ?auto_147134 ) ) ( not ( = ?auto_147131 ?auto_147135 ) ) ( not ( = ?auto_147131 ?auto_147136 ) ) ( not ( = ?auto_147131 ?auto_147137 ) ) ( not ( = ?auto_147131 ?auto_147138 ) ) ( not ( = ?auto_147131 ?auto_147139 ) ) ( not ( = ?auto_147131 ?auto_147140 ) ) ( not ( = ?auto_147132 ?auto_147133 ) ) ( not ( = ?auto_147132 ?auto_147134 ) ) ( not ( = ?auto_147132 ?auto_147135 ) ) ( not ( = ?auto_147132 ?auto_147136 ) ) ( not ( = ?auto_147132 ?auto_147137 ) ) ( not ( = ?auto_147132 ?auto_147138 ) ) ( not ( = ?auto_147132 ?auto_147139 ) ) ( not ( = ?auto_147132 ?auto_147140 ) ) ( not ( = ?auto_147133 ?auto_147134 ) ) ( not ( = ?auto_147133 ?auto_147135 ) ) ( not ( = ?auto_147133 ?auto_147136 ) ) ( not ( = ?auto_147133 ?auto_147137 ) ) ( not ( = ?auto_147133 ?auto_147138 ) ) ( not ( = ?auto_147133 ?auto_147139 ) ) ( not ( = ?auto_147133 ?auto_147140 ) ) ( not ( = ?auto_147134 ?auto_147135 ) ) ( not ( = ?auto_147134 ?auto_147136 ) ) ( not ( = ?auto_147134 ?auto_147137 ) ) ( not ( = ?auto_147134 ?auto_147138 ) ) ( not ( = ?auto_147134 ?auto_147139 ) ) ( not ( = ?auto_147134 ?auto_147140 ) ) ( not ( = ?auto_147135 ?auto_147136 ) ) ( not ( = ?auto_147135 ?auto_147137 ) ) ( not ( = ?auto_147135 ?auto_147138 ) ) ( not ( = ?auto_147135 ?auto_147139 ) ) ( not ( = ?auto_147135 ?auto_147140 ) ) ( not ( = ?auto_147136 ?auto_147137 ) ) ( not ( = ?auto_147136 ?auto_147138 ) ) ( not ( = ?auto_147136 ?auto_147139 ) ) ( not ( = ?auto_147136 ?auto_147140 ) ) ( not ( = ?auto_147137 ?auto_147138 ) ) ( not ( = ?auto_147137 ?auto_147139 ) ) ( not ( = ?auto_147137 ?auto_147140 ) ) ( not ( = ?auto_147138 ?auto_147139 ) ) ( not ( = ?auto_147138 ?auto_147140 ) ) ( not ( = ?auto_147139 ?auto_147140 ) ) ( ON ?auto_147138 ?auto_147139 ) ( ON ?auto_147137 ?auto_147138 ) ( CLEAR ?auto_147135 ) ( ON ?auto_147136 ?auto_147137 ) ( CLEAR ?auto_147136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147130 ?auto_147131 ?auto_147132 ?auto_147133 ?auto_147134 ?auto_147135 ?auto_147136 )
      ( MAKE-10PILE ?auto_147130 ?auto_147131 ?auto_147132 ?auto_147133 ?auto_147134 ?auto_147135 ?auto_147136 ?auto_147137 ?auto_147138 ?auto_147139 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147151 - BLOCK
      ?auto_147152 - BLOCK
      ?auto_147153 - BLOCK
      ?auto_147154 - BLOCK
      ?auto_147155 - BLOCK
      ?auto_147156 - BLOCK
      ?auto_147157 - BLOCK
      ?auto_147158 - BLOCK
      ?auto_147159 - BLOCK
      ?auto_147160 - BLOCK
    )
    :vars
    (
      ?auto_147161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147160 ?auto_147161 ) ( ON-TABLE ?auto_147151 ) ( ON ?auto_147152 ?auto_147151 ) ( ON ?auto_147153 ?auto_147152 ) ( ON ?auto_147154 ?auto_147153 ) ( ON ?auto_147155 ?auto_147154 ) ( ON ?auto_147156 ?auto_147155 ) ( not ( = ?auto_147151 ?auto_147152 ) ) ( not ( = ?auto_147151 ?auto_147153 ) ) ( not ( = ?auto_147151 ?auto_147154 ) ) ( not ( = ?auto_147151 ?auto_147155 ) ) ( not ( = ?auto_147151 ?auto_147156 ) ) ( not ( = ?auto_147151 ?auto_147157 ) ) ( not ( = ?auto_147151 ?auto_147158 ) ) ( not ( = ?auto_147151 ?auto_147159 ) ) ( not ( = ?auto_147151 ?auto_147160 ) ) ( not ( = ?auto_147151 ?auto_147161 ) ) ( not ( = ?auto_147152 ?auto_147153 ) ) ( not ( = ?auto_147152 ?auto_147154 ) ) ( not ( = ?auto_147152 ?auto_147155 ) ) ( not ( = ?auto_147152 ?auto_147156 ) ) ( not ( = ?auto_147152 ?auto_147157 ) ) ( not ( = ?auto_147152 ?auto_147158 ) ) ( not ( = ?auto_147152 ?auto_147159 ) ) ( not ( = ?auto_147152 ?auto_147160 ) ) ( not ( = ?auto_147152 ?auto_147161 ) ) ( not ( = ?auto_147153 ?auto_147154 ) ) ( not ( = ?auto_147153 ?auto_147155 ) ) ( not ( = ?auto_147153 ?auto_147156 ) ) ( not ( = ?auto_147153 ?auto_147157 ) ) ( not ( = ?auto_147153 ?auto_147158 ) ) ( not ( = ?auto_147153 ?auto_147159 ) ) ( not ( = ?auto_147153 ?auto_147160 ) ) ( not ( = ?auto_147153 ?auto_147161 ) ) ( not ( = ?auto_147154 ?auto_147155 ) ) ( not ( = ?auto_147154 ?auto_147156 ) ) ( not ( = ?auto_147154 ?auto_147157 ) ) ( not ( = ?auto_147154 ?auto_147158 ) ) ( not ( = ?auto_147154 ?auto_147159 ) ) ( not ( = ?auto_147154 ?auto_147160 ) ) ( not ( = ?auto_147154 ?auto_147161 ) ) ( not ( = ?auto_147155 ?auto_147156 ) ) ( not ( = ?auto_147155 ?auto_147157 ) ) ( not ( = ?auto_147155 ?auto_147158 ) ) ( not ( = ?auto_147155 ?auto_147159 ) ) ( not ( = ?auto_147155 ?auto_147160 ) ) ( not ( = ?auto_147155 ?auto_147161 ) ) ( not ( = ?auto_147156 ?auto_147157 ) ) ( not ( = ?auto_147156 ?auto_147158 ) ) ( not ( = ?auto_147156 ?auto_147159 ) ) ( not ( = ?auto_147156 ?auto_147160 ) ) ( not ( = ?auto_147156 ?auto_147161 ) ) ( not ( = ?auto_147157 ?auto_147158 ) ) ( not ( = ?auto_147157 ?auto_147159 ) ) ( not ( = ?auto_147157 ?auto_147160 ) ) ( not ( = ?auto_147157 ?auto_147161 ) ) ( not ( = ?auto_147158 ?auto_147159 ) ) ( not ( = ?auto_147158 ?auto_147160 ) ) ( not ( = ?auto_147158 ?auto_147161 ) ) ( not ( = ?auto_147159 ?auto_147160 ) ) ( not ( = ?auto_147159 ?auto_147161 ) ) ( not ( = ?auto_147160 ?auto_147161 ) ) ( ON ?auto_147159 ?auto_147160 ) ( ON ?auto_147158 ?auto_147159 ) ( CLEAR ?auto_147156 ) ( ON ?auto_147157 ?auto_147158 ) ( CLEAR ?auto_147157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147151 ?auto_147152 ?auto_147153 ?auto_147154 ?auto_147155 ?auto_147156 ?auto_147157 )
      ( MAKE-10PILE ?auto_147151 ?auto_147152 ?auto_147153 ?auto_147154 ?auto_147155 ?auto_147156 ?auto_147157 ?auto_147158 ?auto_147159 ?auto_147160 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147172 - BLOCK
      ?auto_147173 - BLOCK
      ?auto_147174 - BLOCK
      ?auto_147175 - BLOCK
      ?auto_147176 - BLOCK
      ?auto_147177 - BLOCK
      ?auto_147178 - BLOCK
      ?auto_147179 - BLOCK
      ?auto_147180 - BLOCK
      ?auto_147181 - BLOCK
    )
    :vars
    (
      ?auto_147182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147181 ?auto_147182 ) ( ON-TABLE ?auto_147172 ) ( ON ?auto_147173 ?auto_147172 ) ( ON ?auto_147174 ?auto_147173 ) ( ON ?auto_147175 ?auto_147174 ) ( ON ?auto_147176 ?auto_147175 ) ( not ( = ?auto_147172 ?auto_147173 ) ) ( not ( = ?auto_147172 ?auto_147174 ) ) ( not ( = ?auto_147172 ?auto_147175 ) ) ( not ( = ?auto_147172 ?auto_147176 ) ) ( not ( = ?auto_147172 ?auto_147177 ) ) ( not ( = ?auto_147172 ?auto_147178 ) ) ( not ( = ?auto_147172 ?auto_147179 ) ) ( not ( = ?auto_147172 ?auto_147180 ) ) ( not ( = ?auto_147172 ?auto_147181 ) ) ( not ( = ?auto_147172 ?auto_147182 ) ) ( not ( = ?auto_147173 ?auto_147174 ) ) ( not ( = ?auto_147173 ?auto_147175 ) ) ( not ( = ?auto_147173 ?auto_147176 ) ) ( not ( = ?auto_147173 ?auto_147177 ) ) ( not ( = ?auto_147173 ?auto_147178 ) ) ( not ( = ?auto_147173 ?auto_147179 ) ) ( not ( = ?auto_147173 ?auto_147180 ) ) ( not ( = ?auto_147173 ?auto_147181 ) ) ( not ( = ?auto_147173 ?auto_147182 ) ) ( not ( = ?auto_147174 ?auto_147175 ) ) ( not ( = ?auto_147174 ?auto_147176 ) ) ( not ( = ?auto_147174 ?auto_147177 ) ) ( not ( = ?auto_147174 ?auto_147178 ) ) ( not ( = ?auto_147174 ?auto_147179 ) ) ( not ( = ?auto_147174 ?auto_147180 ) ) ( not ( = ?auto_147174 ?auto_147181 ) ) ( not ( = ?auto_147174 ?auto_147182 ) ) ( not ( = ?auto_147175 ?auto_147176 ) ) ( not ( = ?auto_147175 ?auto_147177 ) ) ( not ( = ?auto_147175 ?auto_147178 ) ) ( not ( = ?auto_147175 ?auto_147179 ) ) ( not ( = ?auto_147175 ?auto_147180 ) ) ( not ( = ?auto_147175 ?auto_147181 ) ) ( not ( = ?auto_147175 ?auto_147182 ) ) ( not ( = ?auto_147176 ?auto_147177 ) ) ( not ( = ?auto_147176 ?auto_147178 ) ) ( not ( = ?auto_147176 ?auto_147179 ) ) ( not ( = ?auto_147176 ?auto_147180 ) ) ( not ( = ?auto_147176 ?auto_147181 ) ) ( not ( = ?auto_147176 ?auto_147182 ) ) ( not ( = ?auto_147177 ?auto_147178 ) ) ( not ( = ?auto_147177 ?auto_147179 ) ) ( not ( = ?auto_147177 ?auto_147180 ) ) ( not ( = ?auto_147177 ?auto_147181 ) ) ( not ( = ?auto_147177 ?auto_147182 ) ) ( not ( = ?auto_147178 ?auto_147179 ) ) ( not ( = ?auto_147178 ?auto_147180 ) ) ( not ( = ?auto_147178 ?auto_147181 ) ) ( not ( = ?auto_147178 ?auto_147182 ) ) ( not ( = ?auto_147179 ?auto_147180 ) ) ( not ( = ?auto_147179 ?auto_147181 ) ) ( not ( = ?auto_147179 ?auto_147182 ) ) ( not ( = ?auto_147180 ?auto_147181 ) ) ( not ( = ?auto_147180 ?auto_147182 ) ) ( not ( = ?auto_147181 ?auto_147182 ) ) ( ON ?auto_147180 ?auto_147181 ) ( ON ?auto_147179 ?auto_147180 ) ( ON ?auto_147178 ?auto_147179 ) ( CLEAR ?auto_147176 ) ( ON ?auto_147177 ?auto_147178 ) ( CLEAR ?auto_147177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147172 ?auto_147173 ?auto_147174 ?auto_147175 ?auto_147176 ?auto_147177 )
      ( MAKE-10PILE ?auto_147172 ?auto_147173 ?auto_147174 ?auto_147175 ?auto_147176 ?auto_147177 ?auto_147178 ?auto_147179 ?auto_147180 ?auto_147181 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147193 - BLOCK
      ?auto_147194 - BLOCK
      ?auto_147195 - BLOCK
      ?auto_147196 - BLOCK
      ?auto_147197 - BLOCK
      ?auto_147198 - BLOCK
      ?auto_147199 - BLOCK
      ?auto_147200 - BLOCK
      ?auto_147201 - BLOCK
      ?auto_147202 - BLOCK
    )
    :vars
    (
      ?auto_147203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147202 ?auto_147203 ) ( ON-TABLE ?auto_147193 ) ( ON ?auto_147194 ?auto_147193 ) ( ON ?auto_147195 ?auto_147194 ) ( ON ?auto_147196 ?auto_147195 ) ( ON ?auto_147197 ?auto_147196 ) ( not ( = ?auto_147193 ?auto_147194 ) ) ( not ( = ?auto_147193 ?auto_147195 ) ) ( not ( = ?auto_147193 ?auto_147196 ) ) ( not ( = ?auto_147193 ?auto_147197 ) ) ( not ( = ?auto_147193 ?auto_147198 ) ) ( not ( = ?auto_147193 ?auto_147199 ) ) ( not ( = ?auto_147193 ?auto_147200 ) ) ( not ( = ?auto_147193 ?auto_147201 ) ) ( not ( = ?auto_147193 ?auto_147202 ) ) ( not ( = ?auto_147193 ?auto_147203 ) ) ( not ( = ?auto_147194 ?auto_147195 ) ) ( not ( = ?auto_147194 ?auto_147196 ) ) ( not ( = ?auto_147194 ?auto_147197 ) ) ( not ( = ?auto_147194 ?auto_147198 ) ) ( not ( = ?auto_147194 ?auto_147199 ) ) ( not ( = ?auto_147194 ?auto_147200 ) ) ( not ( = ?auto_147194 ?auto_147201 ) ) ( not ( = ?auto_147194 ?auto_147202 ) ) ( not ( = ?auto_147194 ?auto_147203 ) ) ( not ( = ?auto_147195 ?auto_147196 ) ) ( not ( = ?auto_147195 ?auto_147197 ) ) ( not ( = ?auto_147195 ?auto_147198 ) ) ( not ( = ?auto_147195 ?auto_147199 ) ) ( not ( = ?auto_147195 ?auto_147200 ) ) ( not ( = ?auto_147195 ?auto_147201 ) ) ( not ( = ?auto_147195 ?auto_147202 ) ) ( not ( = ?auto_147195 ?auto_147203 ) ) ( not ( = ?auto_147196 ?auto_147197 ) ) ( not ( = ?auto_147196 ?auto_147198 ) ) ( not ( = ?auto_147196 ?auto_147199 ) ) ( not ( = ?auto_147196 ?auto_147200 ) ) ( not ( = ?auto_147196 ?auto_147201 ) ) ( not ( = ?auto_147196 ?auto_147202 ) ) ( not ( = ?auto_147196 ?auto_147203 ) ) ( not ( = ?auto_147197 ?auto_147198 ) ) ( not ( = ?auto_147197 ?auto_147199 ) ) ( not ( = ?auto_147197 ?auto_147200 ) ) ( not ( = ?auto_147197 ?auto_147201 ) ) ( not ( = ?auto_147197 ?auto_147202 ) ) ( not ( = ?auto_147197 ?auto_147203 ) ) ( not ( = ?auto_147198 ?auto_147199 ) ) ( not ( = ?auto_147198 ?auto_147200 ) ) ( not ( = ?auto_147198 ?auto_147201 ) ) ( not ( = ?auto_147198 ?auto_147202 ) ) ( not ( = ?auto_147198 ?auto_147203 ) ) ( not ( = ?auto_147199 ?auto_147200 ) ) ( not ( = ?auto_147199 ?auto_147201 ) ) ( not ( = ?auto_147199 ?auto_147202 ) ) ( not ( = ?auto_147199 ?auto_147203 ) ) ( not ( = ?auto_147200 ?auto_147201 ) ) ( not ( = ?auto_147200 ?auto_147202 ) ) ( not ( = ?auto_147200 ?auto_147203 ) ) ( not ( = ?auto_147201 ?auto_147202 ) ) ( not ( = ?auto_147201 ?auto_147203 ) ) ( not ( = ?auto_147202 ?auto_147203 ) ) ( ON ?auto_147201 ?auto_147202 ) ( ON ?auto_147200 ?auto_147201 ) ( ON ?auto_147199 ?auto_147200 ) ( CLEAR ?auto_147197 ) ( ON ?auto_147198 ?auto_147199 ) ( CLEAR ?auto_147198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147193 ?auto_147194 ?auto_147195 ?auto_147196 ?auto_147197 ?auto_147198 )
      ( MAKE-10PILE ?auto_147193 ?auto_147194 ?auto_147195 ?auto_147196 ?auto_147197 ?auto_147198 ?auto_147199 ?auto_147200 ?auto_147201 ?auto_147202 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147214 - BLOCK
      ?auto_147215 - BLOCK
      ?auto_147216 - BLOCK
      ?auto_147217 - BLOCK
      ?auto_147218 - BLOCK
      ?auto_147219 - BLOCK
      ?auto_147220 - BLOCK
      ?auto_147221 - BLOCK
      ?auto_147222 - BLOCK
      ?auto_147223 - BLOCK
    )
    :vars
    (
      ?auto_147224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147223 ?auto_147224 ) ( ON-TABLE ?auto_147214 ) ( ON ?auto_147215 ?auto_147214 ) ( ON ?auto_147216 ?auto_147215 ) ( ON ?auto_147217 ?auto_147216 ) ( not ( = ?auto_147214 ?auto_147215 ) ) ( not ( = ?auto_147214 ?auto_147216 ) ) ( not ( = ?auto_147214 ?auto_147217 ) ) ( not ( = ?auto_147214 ?auto_147218 ) ) ( not ( = ?auto_147214 ?auto_147219 ) ) ( not ( = ?auto_147214 ?auto_147220 ) ) ( not ( = ?auto_147214 ?auto_147221 ) ) ( not ( = ?auto_147214 ?auto_147222 ) ) ( not ( = ?auto_147214 ?auto_147223 ) ) ( not ( = ?auto_147214 ?auto_147224 ) ) ( not ( = ?auto_147215 ?auto_147216 ) ) ( not ( = ?auto_147215 ?auto_147217 ) ) ( not ( = ?auto_147215 ?auto_147218 ) ) ( not ( = ?auto_147215 ?auto_147219 ) ) ( not ( = ?auto_147215 ?auto_147220 ) ) ( not ( = ?auto_147215 ?auto_147221 ) ) ( not ( = ?auto_147215 ?auto_147222 ) ) ( not ( = ?auto_147215 ?auto_147223 ) ) ( not ( = ?auto_147215 ?auto_147224 ) ) ( not ( = ?auto_147216 ?auto_147217 ) ) ( not ( = ?auto_147216 ?auto_147218 ) ) ( not ( = ?auto_147216 ?auto_147219 ) ) ( not ( = ?auto_147216 ?auto_147220 ) ) ( not ( = ?auto_147216 ?auto_147221 ) ) ( not ( = ?auto_147216 ?auto_147222 ) ) ( not ( = ?auto_147216 ?auto_147223 ) ) ( not ( = ?auto_147216 ?auto_147224 ) ) ( not ( = ?auto_147217 ?auto_147218 ) ) ( not ( = ?auto_147217 ?auto_147219 ) ) ( not ( = ?auto_147217 ?auto_147220 ) ) ( not ( = ?auto_147217 ?auto_147221 ) ) ( not ( = ?auto_147217 ?auto_147222 ) ) ( not ( = ?auto_147217 ?auto_147223 ) ) ( not ( = ?auto_147217 ?auto_147224 ) ) ( not ( = ?auto_147218 ?auto_147219 ) ) ( not ( = ?auto_147218 ?auto_147220 ) ) ( not ( = ?auto_147218 ?auto_147221 ) ) ( not ( = ?auto_147218 ?auto_147222 ) ) ( not ( = ?auto_147218 ?auto_147223 ) ) ( not ( = ?auto_147218 ?auto_147224 ) ) ( not ( = ?auto_147219 ?auto_147220 ) ) ( not ( = ?auto_147219 ?auto_147221 ) ) ( not ( = ?auto_147219 ?auto_147222 ) ) ( not ( = ?auto_147219 ?auto_147223 ) ) ( not ( = ?auto_147219 ?auto_147224 ) ) ( not ( = ?auto_147220 ?auto_147221 ) ) ( not ( = ?auto_147220 ?auto_147222 ) ) ( not ( = ?auto_147220 ?auto_147223 ) ) ( not ( = ?auto_147220 ?auto_147224 ) ) ( not ( = ?auto_147221 ?auto_147222 ) ) ( not ( = ?auto_147221 ?auto_147223 ) ) ( not ( = ?auto_147221 ?auto_147224 ) ) ( not ( = ?auto_147222 ?auto_147223 ) ) ( not ( = ?auto_147222 ?auto_147224 ) ) ( not ( = ?auto_147223 ?auto_147224 ) ) ( ON ?auto_147222 ?auto_147223 ) ( ON ?auto_147221 ?auto_147222 ) ( ON ?auto_147220 ?auto_147221 ) ( ON ?auto_147219 ?auto_147220 ) ( CLEAR ?auto_147217 ) ( ON ?auto_147218 ?auto_147219 ) ( CLEAR ?auto_147218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147214 ?auto_147215 ?auto_147216 ?auto_147217 ?auto_147218 )
      ( MAKE-10PILE ?auto_147214 ?auto_147215 ?auto_147216 ?auto_147217 ?auto_147218 ?auto_147219 ?auto_147220 ?auto_147221 ?auto_147222 ?auto_147223 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147235 - BLOCK
      ?auto_147236 - BLOCK
      ?auto_147237 - BLOCK
      ?auto_147238 - BLOCK
      ?auto_147239 - BLOCK
      ?auto_147240 - BLOCK
      ?auto_147241 - BLOCK
      ?auto_147242 - BLOCK
      ?auto_147243 - BLOCK
      ?auto_147244 - BLOCK
    )
    :vars
    (
      ?auto_147245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147244 ?auto_147245 ) ( ON-TABLE ?auto_147235 ) ( ON ?auto_147236 ?auto_147235 ) ( ON ?auto_147237 ?auto_147236 ) ( ON ?auto_147238 ?auto_147237 ) ( not ( = ?auto_147235 ?auto_147236 ) ) ( not ( = ?auto_147235 ?auto_147237 ) ) ( not ( = ?auto_147235 ?auto_147238 ) ) ( not ( = ?auto_147235 ?auto_147239 ) ) ( not ( = ?auto_147235 ?auto_147240 ) ) ( not ( = ?auto_147235 ?auto_147241 ) ) ( not ( = ?auto_147235 ?auto_147242 ) ) ( not ( = ?auto_147235 ?auto_147243 ) ) ( not ( = ?auto_147235 ?auto_147244 ) ) ( not ( = ?auto_147235 ?auto_147245 ) ) ( not ( = ?auto_147236 ?auto_147237 ) ) ( not ( = ?auto_147236 ?auto_147238 ) ) ( not ( = ?auto_147236 ?auto_147239 ) ) ( not ( = ?auto_147236 ?auto_147240 ) ) ( not ( = ?auto_147236 ?auto_147241 ) ) ( not ( = ?auto_147236 ?auto_147242 ) ) ( not ( = ?auto_147236 ?auto_147243 ) ) ( not ( = ?auto_147236 ?auto_147244 ) ) ( not ( = ?auto_147236 ?auto_147245 ) ) ( not ( = ?auto_147237 ?auto_147238 ) ) ( not ( = ?auto_147237 ?auto_147239 ) ) ( not ( = ?auto_147237 ?auto_147240 ) ) ( not ( = ?auto_147237 ?auto_147241 ) ) ( not ( = ?auto_147237 ?auto_147242 ) ) ( not ( = ?auto_147237 ?auto_147243 ) ) ( not ( = ?auto_147237 ?auto_147244 ) ) ( not ( = ?auto_147237 ?auto_147245 ) ) ( not ( = ?auto_147238 ?auto_147239 ) ) ( not ( = ?auto_147238 ?auto_147240 ) ) ( not ( = ?auto_147238 ?auto_147241 ) ) ( not ( = ?auto_147238 ?auto_147242 ) ) ( not ( = ?auto_147238 ?auto_147243 ) ) ( not ( = ?auto_147238 ?auto_147244 ) ) ( not ( = ?auto_147238 ?auto_147245 ) ) ( not ( = ?auto_147239 ?auto_147240 ) ) ( not ( = ?auto_147239 ?auto_147241 ) ) ( not ( = ?auto_147239 ?auto_147242 ) ) ( not ( = ?auto_147239 ?auto_147243 ) ) ( not ( = ?auto_147239 ?auto_147244 ) ) ( not ( = ?auto_147239 ?auto_147245 ) ) ( not ( = ?auto_147240 ?auto_147241 ) ) ( not ( = ?auto_147240 ?auto_147242 ) ) ( not ( = ?auto_147240 ?auto_147243 ) ) ( not ( = ?auto_147240 ?auto_147244 ) ) ( not ( = ?auto_147240 ?auto_147245 ) ) ( not ( = ?auto_147241 ?auto_147242 ) ) ( not ( = ?auto_147241 ?auto_147243 ) ) ( not ( = ?auto_147241 ?auto_147244 ) ) ( not ( = ?auto_147241 ?auto_147245 ) ) ( not ( = ?auto_147242 ?auto_147243 ) ) ( not ( = ?auto_147242 ?auto_147244 ) ) ( not ( = ?auto_147242 ?auto_147245 ) ) ( not ( = ?auto_147243 ?auto_147244 ) ) ( not ( = ?auto_147243 ?auto_147245 ) ) ( not ( = ?auto_147244 ?auto_147245 ) ) ( ON ?auto_147243 ?auto_147244 ) ( ON ?auto_147242 ?auto_147243 ) ( ON ?auto_147241 ?auto_147242 ) ( ON ?auto_147240 ?auto_147241 ) ( CLEAR ?auto_147238 ) ( ON ?auto_147239 ?auto_147240 ) ( CLEAR ?auto_147239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147235 ?auto_147236 ?auto_147237 ?auto_147238 ?auto_147239 )
      ( MAKE-10PILE ?auto_147235 ?auto_147236 ?auto_147237 ?auto_147238 ?auto_147239 ?auto_147240 ?auto_147241 ?auto_147242 ?auto_147243 ?auto_147244 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147256 - BLOCK
      ?auto_147257 - BLOCK
      ?auto_147258 - BLOCK
      ?auto_147259 - BLOCK
      ?auto_147260 - BLOCK
      ?auto_147261 - BLOCK
      ?auto_147262 - BLOCK
      ?auto_147263 - BLOCK
      ?auto_147264 - BLOCK
      ?auto_147265 - BLOCK
    )
    :vars
    (
      ?auto_147266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147265 ?auto_147266 ) ( ON-TABLE ?auto_147256 ) ( ON ?auto_147257 ?auto_147256 ) ( ON ?auto_147258 ?auto_147257 ) ( not ( = ?auto_147256 ?auto_147257 ) ) ( not ( = ?auto_147256 ?auto_147258 ) ) ( not ( = ?auto_147256 ?auto_147259 ) ) ( not ( = ?auto_147256 ?auto_147260 ) ) ( not ( = ?auto_147256 ?auto_147261 ) ) ( not ( = ?auto_147256 ?auto_147262 ) ) ( not ( = ?auto_147256 ?auto_147263 ) ) ( not ( = ?auto_147256 ?auto_147264 ) ) ( not ( = ?auto_147256 ?auto_147265 ) ) ( not ( = ?auto_147256 ?auto_147266 ) ) ( not ( = ?auto_147257 ?auto_147258 ) ) ( not ( = ?auto_147257 ?auto_147259 ) ) ( not ( = ?auto_147257 ?auto_147260 ) ) ( not ( = ?auto_147257 ?auto_147261 ) ) ( not ( = ?auto_147257 ?auto_147262 ) ) ( not ( = ?auto_147257 ?auto_147263 ) ) ( not ( = ?auto_147257 ?auto_147264 ) ) ( not ( = ?auto_147257 ?auto_147265 ) ) ( not ( = ?auto_147257 ?auto_147266 ) ) ( not ( = ?auto_147258 ?auto_147259 ) ) ( not ( = ?auto_147258 ?auto_147260 ) ) ( not ( = ?auto_147258 ?auto_147261 ) ) ( not ( = ?auto_147258 ?auto_147262 ) ) ( not ( = ?auto_147258 ?auto_147263 ) ) ( not ( = ?auto_147258 ?auto_147264 ) ) ( not ( = ?auto_147258 ?auto_147265 ) ) ( not ( = ?auto_147258 ?auto_147266 ) ) ( not ( = ?auto_147259 ?auto_147260 ) ) ( not ( = ?auto_147259 ?auto_147261 ) ) ( not ( = ?auto_147259 ?auto_147262 ) ) ( not ( = ?auto_147259 ?auto_147263 ) ) ( not ( = ?auto_147259 ?auto_147264 ) ) ( not ( = ?auto_147259 ?auto_147265 ) ) ( not ( = ?auto_147259 ?auto_147266 ) ) ( not ( = ?auto_147260 ?auto_147261 ) ) ( not ( = ?auto_147260 ?auto_147262 ) ) ( not ( = ?auto_147260 ?auto_147263 ) ) ( not ( = ?auto_147260 ?auto_147264 ) ) ( not ( = ?auto_147260 ?auto_147265 ) ) ( not ( = ?auto_147260 ?auto_147266 ) ) ( not ( = ?auto_147261 ?auto_147262 ) ) ( not ( = ?auto_147261 ?auto_147263 ) ) ( not ( = ?auto_147261 ?auto_147264 ) ) ( not ( = ?auto_147261 ?auto_147265 ) ) ( not ( = ?auto_147261 ?auto_147266 ) ) ( not ( = ?auto_147262 ?auto_147263 ) ) ( not ( = ?auto_147262 ?auto_147264 ) ) ( not ( = ?auto_147262 ?auto_147265 ) ) ( not ( = ?auto_147262 ?auto_147266 ) ) ( not ( = ?auto_147263 ?auto_147264 ) ) ( not ( = ?auto_147263 ?auto_147265 ) ) ( not ( = ?auto_147263 ?auto_147266 ) ) ( not ( = ?auto_147264 ?auto_147265 ) ) ( not ( = ?auto_147264 ?auto_147266 ) ) ( not ( = ?auto_147265 ?auto_147266 ) ) ( ON ?auto_147264 ?auto_147265 ) ( ON ?auto_147263 ?auto_147264 ) ( ON ?auto_147262 ?auto_147263 ) ( ON ?auto_147261 ?auto_147262 ) ( ON ?auto_147260 ?auto_147261 ) ( CLEAR ?auto_147258 ) ( ON ?auto_147259 ?auto_147260 ) ( CLEAR ?auto_147259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147256 ?auto_147257 ?auto_147258 ?auto_147259 )
      ( MAKE-10PILE ?auto_147256 ?auto_147257 ?auto_147258 ?auto_147259 ?auto_147260 ?auto_147261 ?auto_147262 ?auto_147263 ?auto_147264 ?auto_147265 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147277 - BLOCK
      ?auto_147278 - BLOCK
      ?auto_147279 - BLOCK
      ?auto_147280 - BLOCK
      ?auto_147281 - BLOCK
      ?auto_147282 - BLOCK
      ?auto_147283 - BLOCK
      ?auto_147284 - BLOCK
      ?auto_147285 - BLOCK
      ?auto_147286 - BLOCK
    )
    :vars
    (
      ?auto_147287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147286 ?auto_147287 ) ( ON-TABLE ?auto_147277 ) ( ON ?auto_147278 ?auto_147277 ) ( ON ?auto_147279 ?auto_147278 ) ( not ( = ?auto_147277 ?auto_147278 ) ) ( not ( = ?auto_147277 ?auto_147279 ) ) ( not ( = ?auto_147277 ?auto_147280 ) ) ( not ( = ?auto_147277 ?auto_147281 ) ) ( not ( = ?auto_147277 ?auto_147282 ) ) ( not ( = ?auto_147277 ?auto_147283 ) ) ( not ( = ?auto_147277 ?auto_147284 ) ) ( not ( = ?auto_147277 ?auto_147285 ) ) ( not ( = ?auto_147277 ?auto_147286 ) ) ( not ( = ?auto_147277 ?auto_147287 ) ) ( not ( = ?auto_147278 ?auto_147279 ) ) ( not ( = ?auto_147278 ?auto_147280 ) ) ( not ( = ?auto_147278 ?auto_147281 ) ) ( not ( = ?auto_147278 ?auto_147282 ) ) ( not ( = ?auto_147278 ?auto_147283 ) ) ( not ( = ?auto_147278 ?auto_147284 ) ) ( not ( = ?auto_147278 ?auto_147285 ) ) ( not ( = ?auto_147278 ?auto_147286 ) ) ( not ( = ?auto_147278 ?auto_147287 ) ) ( not ( = ?auto_147279 ?auto_147280 ) ) ( not ( = ?auto_147279 ?auto_147281 ) ) ( not ( = ?auto_147279 ?auto_147282 ) ) ( not ( = ?auto_147279 ?auto_147283 ) ) ( not ( = ?auto_147279 ?auto_147284 ) ) ( not ( = ?auto_147279 ?auto_147285 ) ) ( not ( = ?auto_147279 ?auto_147286 ) ) ( not ( = ?auto_147279 ?auto_147287 ) ) ( not ( = ?auto_147280 ?auto_147281 ) ) ( not ( = ?auto_147280 ?auto_147282 ) ) ( not ( = ?auto_147280 ?auto_147283 ) ) ( not ( = ?auto_147280 ?auto_147284 ) ) ( not ( = ?auto_147280 ?auto_147285 ) ) ( not ( = ?auto_147280 ?auto_147286 ) ) ( not ( = ?auto_147280 ?auto_147287 ) ) ( not ( = ?auto_147281 ?auto_147282 ) ) ( not ( = ?auto_147281 ?auto_147283 ) ) ( not ( = ?auto_147281 ?auto_147284 ) ) ( not ( = ?auto_147281 ?auto_147285 ) ) ( not ( = ?auto_147281 ?auto_147286 ) ) ( not ( = ?auto_147281 ?auto_147287 ) ) ( not ( = ?auto_147282 ?auto_147283 ) ) ( not ( = ?auto_147282 ?auto_147284 ) ) ( not ( = ?auto_147282 ?auto_147285 ) ) ( not ( = ?auto_147282 ?auto_147286 ) ) ( not ( = ?auto_147282 ?auto_147287 ) ) ( not ( = ?auto_147283 ?auto_147284 ) ) ( not ( = ?auto_147283 ?auto_147285 ) ) ( not ( = ?auto_147283 ?auto_147286 ) ) ( not ( = ?auto_147283 ?auto_147287 ) ) ( not ( = ?auto_147284 ?auto_147285 ) ) ( not ( = ?auto_147284 ?auto_147286 ) ) ( not ( = ?auto_147284 ?auto_147287 ) ) ( not ( = ?auto_147285 ?auto_147286 ) ) ( not ( = ?auto_147285 ?auto_147287 ) ) ( not ( = ?auto_147286 ?auto_147287 ) ) ( ON ?auto_147285 ?auto_147286 ) ( ON ?auto_147284 ?auto_147285 ) ( ON ?auto_147283 ?auto_147284 ) ( ON ?auto_147282 ?auto_147283 ) ( ON ?auto_147281 ?auto_147282 ) ( CLEAR ?auto_147279 ) ( ON ?auto_147280 ?auto_147281 ) ( CLEAR ?auto_147280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147277 ?auto_147278 ?auto_147279 ?auto_147280 )
      ( MAKE-10PILE ?auto_147277 ?auto_147278 ?auto_147279 ?auto_147280 ?auto_147281 ?auto_147282 ?auto_147283 ?auto_147284 ?auto_147285 ?auto_147286 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147298 - BLOCK
      ?auto_147299 - BLOCK
      ?auto_147300 - BLOCK
      ?auto_147301 - BLOCK
      ?auto_147302 - BLOCK
      ?auto_147303 - BLOCK
      ?auto_147304 - BLOCK
      ?auto_147305 - BLOCK
      ?auto_147306 - BLOCK
      ?auto_147307 - BLOCK
    )
    :vars
    (
      ?auto_147308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147307 ?auto_147308 ) ( ON-TABLE ?auto_147298 ) ( ON ?auto_147299 ?auto_147298 ) ( not ( = ?auto_147298 ?auto_147299 ) ) ( not ( = ?auto_147298 ?auto_147300 ) ) ( not ( = ?auto_147298 ?auto_147301 ) ) ( not ( = ?auto_147298 ?auto_147302 ) ) ( not ( = ?auto_147298 ?auto_147303 ) ) ( not ( = ?auto_147298 ?auto_147304 ) ) ( not ( = ?auto_147298 ?auto_147305 ) ) ( not ( = ?auto_147298 ?auto_147306 ) ) ( not ( = ?auto_147298 ?auto_147307 ) ) ( not ( = ?auto_147298 ?auto_147308 ) ) ( not ( = ?auto_147299 ?auto_147300 ) ) ( not ( = ?auto_147299 ?auto_147301 ) ) ( not ( = ?auto_147299 ?auto_147302 ) ) ( not ( = ?auto_147299 ?auto_147303 ) ) ( not ( = ?auto_147299 ?auto_147304 ) ) ( not ( = ?auto_147299 ?auto_147305 ) ) ( not ( = ?auto_147299 ?auto_147306 ) ) ( not ( = ?auto_147299 ?auto_147307 ) ) ( not ( = ?auto_147299 ?auto_147308 ) ) ( not ( = ?auto_147300 ?auto_147301 ) ) ( not ( = ?auto_147300 ?auto_147302 ) ) ( not ( = ?auto_147300 ?auto_147303 ) ) ( not ( = ?auto_147300 ?auto_147304 ) ) ( not ( = ?auto_147300 ?auto_147305 ) ) ( not ( = ?auto_147300 ?auto_147306 ) ) ( not ( = ?auto_147300 ?auto_147307 ) ) ( not ( = ?auto_147300 ?auto_147308 ) ) ( not ( = ?auto_147301 ?auto_147302 ) ) ( not ( = ?auto_147301 ?auto_147303 ) ) ( not ( = ?auto_147301 ?auto_147304 ) ) ( not ( = ?auto_147301 ?auto_147305 ) ) ( not ( = ?auto_147301 ?auto_147306 ) ) ( not ( = ?auto_147301 ?auto_147307 ) ) ( not ( = ?auto_147301 ?auto_147308 ) ) ( not ( = ?auto_147302 ?auto_147303 ) ) ( not ( = ?auto_147302 ?auto_147304 ) ) ( not ( = ?auto_147302 ?auto_147305 ) ) ( not ( = ?auto_147302 ?auto_147306 ) ) ( not ( = ?auto_147302 ?auto_147307 ) ) ( not ( = ?auto_147302 ?auto_147308 ) ) ( not ( = ?auto_147303 ?auto_147304 ) ) ( not ( = ?auto_147303 ?auto_147305 ) ) ( not ( = ?auto_147303 ?auto_147306 ) ) ( not ( = ?auto_147303 ?auto_147307 ) ) ( not ( = ?auto_147303 ?auto_147308 ) ) ( not ( = ?auto_147304 ?auto_147305 ) ) ( not ( = ?auto_147304 ?auto_147306 ) ) ( not ( = ?auto_147304 ?auto_147307 ) ) ( not ( = ?auto_147304 ?auto_147308 ) ) ( not ( = ?auto_147305 ?auto_147306 ) ) ( not ( = ?auto_147305 ?auto_147307 ) ) ( not ( = ?auto_147305 ?auto_147308 ) ) ( not ( = ?auto_147306 ?auto_147307 ) ) ( not ( = ?auto_147306 ?auto_147308 ) ) ( not ( = ?auto_147307 ?auto_147308 ) ) ( ON ?auto_147306 ?auto_147307 ) ( ON ?auto_147305 ?auto_147306 ) ( ON ?auto_147304 ?auto_147305 ) ( ON ?auto_147303 ?auto_147304 ) ( ON ?auto_147302 ?auto_147303 ) ( ON ?auto_147301 ?auto_147302 ) ( CLEAR ?auto_147299 ) ( ON ?auto_147300 ?auto_147301 ) ( CLEAR ?auto_147300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147298 ?auto_147299 ?auto_147300 )
      ( MAKE-10PILE ?auto_147298 ?auto_147299 ?auto_147300 ?auto_147301 ?auto_147302 ?auto_147303 ?auto_147304 ?auto_147305 ?auto_147306 ?auto_147307 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147319 - BLOCK
      ?auto_147320 - BLOCK
      ?auto_147321 - BLOCK
      ?auto_147322 - BLOCK
      ?auto_147323 - BLOCK
      ?auto_147324 - BLOCK
      ?auto_147325 - BLOCK
      ?auto_147326 - BLOCK
      ?auto_147327 - BLOCK
      ?auto_147328 - BLOCK
    )
    :vars
    (
      ?auto_147329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147328 ?auto_147329 ) ( ON-TABLE ?auto_147319 ) ( ON ?auto_147320 ?auto_147319 ) ( not ( = ?auto_147319 ?auto_147320 ) ) ( not ( = ?auto_147319 ?auto_147321 ) ) ( not ( = ?auto_147319 ?auto_147322 ) ) ( not ( = ?auto_147319 ?auto_147323 ) ) ( not ( = ?auto_147319 ?auto_147324 ) ) ( not ( = ?auto_147319 ?auto_147325 ) ) ( not ( = ?auto_147319 ?auto_147326 ) ) ( not ( = ?auto_147319 ?auto_147327 ) ) ( not ( = ?auto_147319 ?auto_147328 ) ) ( not ( = ?auto_147319 ?auto_147329 ) ) ( not ( = ?auto_147320 ?auto_147321 ) ) ( not ( = ?auto_147320 ?auto_147322 ) ) ( not ( = ?auto_147320 ?auto_147323 ) ) ( not ( = ?auto_147320 ?auto_147324 ) ) ( not ( = ?auto_147320 ?auto_147325 ) ) ( not ( = ?auto_147320 ?auto_147326 ) ) ( not ( = ?auto_147320 ?auto_147327 ) ) ( not ( = ?auto_147320 ?auto_147328 ) ) ( not ( = ?auto_147320 ?auto_147329 ) ) ( not ( = ?auto_147321 ?auto_147322 ) ) ( not ( = ?auto_147321 ?auto_147323 ) ) ( not ( = ?auto_147321 ?auto_147324 ) ) ( not ( = ?auto_147321 ?auto_147325 ) ) ( not ( = ?auto_147321 ?auto_147326 ) ) ( not ( = ?auto_147321 ?auto_147327 ) ) ( not ( = ?auto_147321 ?auto_147328 ) ) ( not ( = ?auto_147321 ?auto_147329 ) ) ( not ( = ?auto_147322 ?auto_147323 ) ) ( not ( = ?auto_147322 ?auto_147324 ) ) ( not ( = ?auto_147322 ?auto_147325 ) ) ( not ( = ?auto_147322 ?auto_147326 ) ) ( not ( = ?auto_147322 ?auto_147327 ) ) ( not ( = ?auto_147322 ?auto_147328 ) ) ( not ( = ?auto_147322 ?auto_147329 ) ) ( not ( = ?auto_147323 ?auto_147324 ) ) ( not ( = ?auto_147323 ?auto_147325 ) ) ( not ( = ?auto_147323 ?auto_147326 ) ) ( not ( = ?auto_147323 ?auto_147327 ) ) ( not ( = ?auto_147323 ?auto_147328 ) ) ( not ( = ?auto_147323 ?auto_147329 ) ) ( not ( = ?auto_147324 ?auto_147325 ) ) ( not ( = ?auto_147324 ?auto_147326 ) ) ( not ( = ?auto_147324 ?auto_147327 ) ) ( not ( = ?auto_147324 ?auto_147328 ) ) ( not ( = ?auto_147324 ?auto_147329 ) ) ( not ( = ?auto_147325 ?auto_147326 ) ) ( not ( = ?auto_147325 ?auto_147327 ) ) ( not ( = ?auto_147325 ?auto_147328 ) ) ( not ( = ?auto_147325 ?auto_147329 ) ) ( not ( = ?auto_147326 ?auto_147327 ) ) ( not ( = ?auto_147326 ?auto_147328 ) ) ( not ( = ?auto_147326 ?auto_147329 ) ) ( not ( = ?auto_147327 ?auto_147328 ) ) ( not ( = ?auto_147327 ?auto_147329 ) ) ( not ( = ?auto_147328 ?auto_147329 ) ) ( ON ?auto_147327 ?auto_147328 ) ( ON ?auto_147326 ?auto_147327 ) ( ON ?auto_147325 ?auto_147326 ) ( ON ?auto_147324 ?auto_147325 ) ( ON ?auto_147323 ?auto_147324 ) ( ON ?auto_147322 ?auto_147323 ) ( CLEAR ?auto_147320 ) ( ON ?auto_147321 ?auto_147322 ) ( CLEAR ?auto_147321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147319 ?auto_147320 ?auto_147321 )
      ( MAKE-10PILE ?auto_147319 ?auto_147320 ?auto_147321 ?auto_147322 ?auto_147323 ?auto_147324 ?auto_147325 ?auto_147326 ?auto_147327 ?auto_147328 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147340 - BLOCK
      ?auto_147341 - BLOCK
      ?auto_147342 - BLOCK
      ?auto_147343 - BLOCK
      ?auto_147344 - BLOCK
      ?auto_147345 - BLOCK
      ?auto_147346 - BLOCK
      ?auto_147347 - BLOCK
      ?auto_147348 - BLOCK
      ?auto_147349 - BLOCK
    )
    :vars
    (
      ?auto_147350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147349 ?auto_147350 ) ( ON-TABLE ?auto_147340 ) ( not ( = ?auto_147340 ?auto_147341 ) ) ( not ( = ?auto_147340 ?auto_147342 ) ) ( not ( = ?auto_147340 ?auto_147343 ) ) ( not ( = ?auto_147340 ?auto_147344 ) ) ( not ( = ?auto_147340 ?auto_147345 ) ) ( not ( = ?auto_147340 ?auto_147346 ) ) ( not ( = ?auto_147340 ?auto_147347 ) ) ( not ( = ?auto_147340 ?auto_147348 ) ) ( not ( = ?auto_147340 ?auto_147349 ) ) ( not ( = ?auto_147340 ?auto_147350 ) ) ( not ( = ?auto_147341 ?auto_147342 ) ) ( not ( = ?auto_147341 ?auto_147343 ) ) ( not ( = ?auto_147341 ?auto_147344 ) ) ( not ( = ?auto_147341 ?auto_147345 ) ) ( not ( = ?auto_147341 ?auto_147346 ) ) ( not ( = ?auto_147341 ?auto_147347 ) ) ( not ( = ?auto_147341 ?auto_147348 ) ) ( not ( = ?auto_147341 ?auto_147349 ) ) ( not ( = ?auto_147341 ?auto_147350 ) ) ( not ( = ?auto_147342 ?auto_147343 ) ) ( not ( = ?auto_147342 ?auto_147344 ) ) ( not ( = ?auto_147342 ?auto_147345 ) ) ( not ( = ?auto_147342 ?auto_147346 ) ) ( not ( = ?auto_147342 ?auto_147347 ) ) ( not ( = ?auto_147342 ?auto_147348 ) ) ( not ( = ?auto_147342 ?auto_147349 ) ) ( not ( = ?auto_147342 ?auto_147350 ) ) ( not ( = ?auto_147343 ?auto_147344 ) ) ( not ( = ?auto_147343 ?auto_147345 ) ) ( not ( = ?auto_147343 ?auto_147346 ) ) ( not ( = ?auto_147343 ?auto_147347 ) ) ( not ( = ?auto_147343 ?auto_147348 ) ) ( not ( = ?auto_147343 ?auto_147349 ) ) ( not ( = ?auto_147343 ?auto_147350 ) ) ( not ( = ?auto_147344 ?auto_147345 ) ) ( not ( = ?auto_147344 ?auto_147346 ) ) ( not ( = ?auto_147344 ?auto_147347 ) ) ( not ( = ?auto_147344 ?auto_147348 ) ) ( not ( = ?auto_147344 ?auto_147349 ) ) ( not ( = ?auto_147344 ?auto_147350 ) ) ( not ( = ?auto_147345 ?auto_147346 ) ) ( not ( = ?auto_147345 ?auto_147347 ) ) ( not ( = ?auto_147345 ?auto_147348 ) ) ( not ( = ?auto_147345 ?auto_147349 ) ) ( not ( = ?auto_147345 ?auto_147350 ) ) ( not ( = ?auto_147346 ?auto_147347 ) ) ( not ( = ?auto_147346 ?auto_147348 ) ) ( not ( = ?auto_147346 ?auto_147349 ) ) ( not ( = ?auto_147346 ?auto_147350 ) ) ( not ( = ?auto_147347 ?auto_147348 ) ) ( not ( = ?auto_147347 ?auto_147349 ) ) ( not ( = ?auto_147347 ?auto_147350 ) ) ( not ( = ?auto_147348 ?auto_147349 ) ) ( not ( = ?auto_147348 ?auto_147350 ) ) ( not ( = ?auto_147349 ?auto_147350 ) ) ( ON ?auto_147348 ?auto_147349 ) ( ON ?auto_147347 ?auto_147348 ) ( ON ?auto_147346 ?auto_147347 ) ( ON ?auto_147345 ?auto_147346 ) ( ON ?auto_147344 ?auto_147345 ) ( ON ?auto_147343 ?auto_147344 ) ( ON ?auto_147342 ?auto_147343 ) ( CLEAR ?auto_147340 ) ( ON ?auto_147341 ?auto_147342 ) ( CLEAR ?auto_147341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147340 ?auto_147341 )
      ( MAKE-10PILE ?auto_147340 ?auto_147341 ?auto_147342 ?auto_147343 ?auto_147344 ?auto_147345 ?auto_147346 ?auto_147347 ?auto_147348 ?auto_147349 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147361 - BLOCK
      ?auto_147362 - BLOCK
      ?auto_147363 - BLOCK
      ?auto_147364 - BLOCK
      ?auto_147365 - BLOCK
      ?auto_147366 - BLOCK
      ?auto_147367 - BLOCK
      ?auto_147368 - BLOCK
      ?auto_147369 - BLOCK
      ?auto_147370 - BLOCK
    )
    :vars
    (
      ?auto_147371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147370 ?auto_147371 ) ( ON-TABLE ?auto_147361 ) ( not ( = ?auto_147361 ?auto_147362 ) ) ( not ( = ?auto_147361 ?auto_147363 ) ) ( not ( = ?auto_147361 ?auto_147364 ) ) ( not ( = ?auto_147361 ?auto_147365 ) ) ( not ( = ?auto_147361 ?auto_147366 ) ) ( not ( = ?auto_147361 ?auto_147367 ) ) ( not ( = ?auto_147361 ?auto_147368 ) ) ( not ( = ?auto_147361 ?auto_147369 ) ) ( not ( = ?auto_147361 ?auto_147370 ) ) ( not ( = ?auto_147361 ?auto_147371 ) ) ( not ( = ?auto_147362 ?auto_147363 ) ) ( not ( = ?auto_147362 ?auto_147364 ) ) ( not ( = ?auto_147362 ?auto_147365 ) ) ( not ( = ?auto_147362 ?auto_147366 ) ) ( not ( = ?auto_147362 ?auto_147367 ) ) ( not ( = ?auto_147362 ?auto_147368 ) ) ( not ( = ?auto_147362 ?auto_147369 ) ) ( not ( = ?auto_147362 ?auto_147370 ) ) ( not ( = ?auto_147362 ?auto_147371 ) ) ( not ( = ?auto_147363 ?auto_147364 ) ) ( not ( = ?auto_147363 ?auto_147365 ) ) ( not ( = ?auto_147363 ?auto_147366 ) ) ( not ( = ?auto_147363 ?auto_147367 ) ) ( not ( = ?auto_147363 ?auto_147368 ) ) ( not ( = ?auto_147363 ?auto_147369 ) ) ( not ( = ?auto_147363 ?auto_147370 ) ) ( not ( = ?auto_147363 ?auto_147371 ) ) ( not ( = ?auto_147364 ?auto_147365 ) ) ( not ( = ?auto_147364 ?auto_147366 ) ) ( not ( = ?auto_147364 ?auto_147367 ) ) ( not ( = ?auto_147364 ?auto_147368 ) ) ( not ( = ?auto_147364 ?auto_147369 ) ) ( not ( = ?auto_147364 ?auto_147370 ) ) ( not ( = ?auto_147364 ?auto_147371 ) ) ( not ( = ?auto_147365 ?auto_147366 ) ) ( not ( = ?auto_147365 ?auto_147367 ) ) ( not ( = ?auto_147365 ?auto_147368 ) ) ( not ( = ?auto_147365 ?auto_147369 ) ) ( not ( = ?auto_147365 ?auto_147370 ) ) ( not ( = ?auto_147365 ?auto_147371 ) ) ( not ( = ?auto_147366 ?auto_147367 ) ) ( not ( = ?auto_147366 ?auto_147368 ) ) ( not ( = ?auto_147366 ?auto_147369 ) ) ( not ( = ?auto_147366 ?auto_147370 ) ) ( not ( = ?auto_147366 ?auto_147371 ) ) ( not ( = ?auto_147367 ?auto_147368 ) ) ( not ( = ?auto_147367 ?auto_147369 ) ) ( not ( = ?auto_147367 ?auto_147370 ) ) ( not ( = ?auto_147367 ?auto_147371 ) ) ( not ( = ?auto_147368 ?auto_147369 ) ) ( not ( = ?auto_147368 ?auto_147370 ) ) ( not ( = ?auto_147368 ?auto_147371 ) ) ( not ( = ?auto_147369 ?auto_147370 ) ) ( not ( = ?auto_147369 ?auto_147371 ) ) ( not ( = ?auto_147370 ?auto_147371 ) ) ( ON ?auto_147369 ?auto_147370 ) ( ON ?auto_147368 ?auto_147369 ) ( ON ?auto_147367 ?auto_147368 ) ( ON ?auto_147366 ?auto_147367 ) ( ON ?auto_147365 ?auto_147366 ) ( ON ?auto_147364 ?auto_147365 ) ( ON ?auto_147363 ?auto_147364 ) ( CLEAR ?auto_147361 ) ( ON ?auto_147362 ?auto_147363 ) ( CLEAR ?auto_147362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147361 ?auto_147362 )
      ( MAKE-10PILE ?auto_147361 ?auto_147362 ?auto_147363 ?auto_147364 ?auto_147365 ?auto_147366 ?auto_147367 ?auto_147368 ?auto_147369 ?auto_147370 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147382 - BLOCK
      ?auto_147383 - BLOCK
      ?auto_147384 - BLOCK
      ?auto_147385 - BLOCK
      ?auto_147386 - BLOCK
      ?auto_147387 - BLOCK
      ?auto_147388 - BLOCK
      ?auto_147389 - BLOCK
      ?auto_147390 - BLOCK
      ?auto_147391 - BLOCK
    )
    :vars
    (
      ?auto_147392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147391 ?auto_147392 ) ( not ( = ?auto_147382 ?auto_147383 ) ) ( not ( = ?auto_147382 ?auto_147384 ) ) ( not ( = ?auto_147382 ?auto_147385 ) ) ( not ( = ?auto_147382 ?auto_147386 ) ) ( not ( = ?auto_147382 ?auto_147387 ) ) ( not ( = ?auto_147382 ?auto_147388 ) ) ( not ( = ?auto_147382 ?auto_147389 ) ) ( not ( = ?auto_147382 ?auto_147390 ) ) ( not ( = ?auto_147382 ?auto_147391 ) ) ( not ( = ?auto_147382 ?auto_147392 ) ) ( not ( = ?auto_147383 ?auto_147384 ) ) ( not ( = ?auto_147383 ?auto_147385 ) ) ( not ( = ?auto_147383 ?auto_147386 ) ) ( not ( = ?auto_147383 ?auto_147387 ) ) ( not ( = ?auto_147383 ?auto_147388 ) ) ( not ( = ?auto_147383 ?auto_147389 ) ) ( not ( = ?auto_147383 ?auto_147390 ) ) ( not ( = ?auto_147383 ?auto_147391 ) ) ( not ( = ?auto_147383 ?auto_147392 ) ) ( not ( = ?auto_147384 ?auto_147385 ) ) ( not ( = ?auto_147384 ?auto_147386 ) ) ( not ( = ?auto_147384 ?auto_147387 ) ) ( not ( = ?auto_147384 ?auto_147388 ) ) ( not ( = ?auto_147384 ?auto_147389 ) ) ( not ( = ?auto_147384 ?auto_147390 ) ) ( not ( = ?auto_147384 ?auto_147391 ) ) ( not ( = ?auto_147384 ?auto_147392 ) ) ( not ( = ?auto_147385 ?auto_147386 ) ) ( not ( = ?auto_147385 ?auto_147387 ) ) ( not ( = ?auto_147385 ?auto_147388 ) ) ( not ( = ?auto_147385 ?auto_147389 ) ) ( not ( = ?auto_147385 ?auto_147390 ) ) ( not ( = ?auto_147385 ?auto_147391 ) ) ( not ( = ?auto_147385 ?auto_147392 ) ) ( not ( = ?auto_147386 ?auto_147387 ) ) ( not ( = ?auto_147386 ?auto_147388 ) ) ( not ( = ?auto_147386 ?auto_147389 ) ) ( not ( = ?auto_147386 ?auto_147390 ) ) ( not ( = ?auto_147386 ?auto_147391 ) ) ( not ( = ?auto_147386 ?auto_147392 ) ) ( not ( = ?auto_147387 ?auto_147388 ) ) ( not ( = ?auto_147387 ?auto_147389 ) ) ( not ( = ?auto_147387 ?auto_147390 ) ) ( not ( = ?auto_147387 ?auto_147391 ) ) ( not ( = ?auto_147387 ?auto_147392 ) ) ( not ( = ?auto_147388 ?auto_147389 ) ) ( not ( = ?auto_147388 ?auto_147390 ) ) ( not ( = ?auto_147388 ?auto_147391 ) ) ( not ( = ?auto_147388 ?auto_147392 ) ) ( not ( = ?auto_147389 ?auto_147390 ) ) ( not ( = ?auto_147389 ?auto_147391 ) ) ( not ( = ?auto_147389 ?auto_147392 ) ) ( not ( = ?auto_147390 ?auto_147391 ) ) ( not ( = ?auto_147390 ?auto_147392 ) ) ( not ( = ?auto_147391 ?auto_147392 ) ) ( ON ?auto_147390 ?auto_147391 ) ( ON ?auto_147389 ?auto_147390 ) ( ON ?auto_147388 ?auto_147389 ) ( ON ?auto_147387 ?auto_147388 ) ( ON ?auto_147386 ?auto_147387 ) ( ON ?auto_147385 ?auto_147386 ) ( ON ?auto_147384 ?auto_147385 ) ( ON ?auto_147383 ?auto_147384 ) ( ON ?auto_147382 ?auto_147383 ) ( CLEAR ?auto_147382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147382 )
      ( MAKE-10PILE ?auto_147382 ?auto_147383 ?auto_147384 ?auto_147385 ?auto_147386 ?auto_147387 ?auto_147388 ?auto_147389 ?auto_147390 ?auto_147391 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_147403 - BLOCK
      ?auto_147404 - BLOCK
      ?auto_147405 - BLOCK
      ?auto_147406 - BLOCK
      ?auto_147407 - BLOCK
      ?auto_147408 - BLOCK
      ?auto_147409 - BLOCK
      ?auto_147410 - BLOCK
      ?auto_147411 - BLOCK
      ?auto_147412 - BLOCK
    )
    :vars
    (
      ?auto_147413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147412 ?auto_147413 ) ( not ( = ?auto_147403 ?auto_147404 ) ) ( not ( = ?auto_147403 ?auto_147405 ) ) ( not ( = ?auto_147403 ?auto_147406 ) ) ( not ( = ?auto_147403 ?auto_147407 ) ) ( not ( = ?auto_147403 ?auto_147408 ) ) ( not ( = ?auto_147403 ?auto_147409 ) ) ( not ( = ?auto_147403 ?auto_147410 ) ) ( not ( = ?auto_147403 ?auto_147411 ) ) ( not ( = ?auto_147403 ?auto_147412 ) ) ( not ( = ?auto_147403 ?auto_147413 ) ) ( not ( = ?auto_147404 ?auto_147405 ) ) ( not ( = ?auto_147404 ?auto_147406 ) ) ( not ( = ?auto_147404 ?auto_147407 ) ) ( not ( = ?auto_147404 ?auto_147408 ) ) ( not ( = ?auto_147404 ?auto_147409 ) ) ( not ( = ?auto_147404 ?auto_147410 ) ) ( not ( = ?auto_147404 ?auto_147411 ) ) ( not ( = ?auto_147404 ?auto_147412 ) ) ( not ( = ?auto_147404 ?auto_147413 ) ) ( not ( = ?auto_147405 ?auto_147406 ) ) ( not ( = ?auto_147405 ?auto_147407 ) ) ( not ( = ?auto_147405 ?auto_147408 ) ) ( not ( = ?auto_147405 ?auto_147409 ) ) ( not ( = ?auto_147405 ?auto_147410 ) ) ( not ( = ?auto_147405 ?auto_147411 ) ) ( not ( = ?auto_147405 ?auto_147412 ) ) ( not ( = ?auto_147405 ?auto_147413 ) ) ( not ( = ?auto_147406 ?auto_147407 ) ) ( not ( = ?auto_147406 ?auto_147408 ) ) ( not ( = ?auto_147406 ?auto_147409 ) ) ( not ( = ?auto_147406 ?auto_147410 ) ) ( not ( = ?auto_147406 ?auto_147411 ) ) ( not ( = ?auto_147406 ?auto_147412 ) ) ( not ( = ?auto_147406 ?auto_147413 ) ) ( not ( = ?auto_147407 ?auto_147408 ) ) ( not ( = ?auto_147407 ?auto_147409 ) ) ( not ( = ?auto_147407 ?auto_147410 ) ) ( not ( = ?auto_147407 ?auto_147411 ) ) ( not ( = ?auto_147407 ?auto_147412 ) ) ( not ( = ?auto_147407 ?auto_147413 ) ) ( not ( = ?auto_147408 ?auto_147409 ) ) ( not ( = ?auto_147408 ?auto_147410 ) ) ( not ( = ?auto_147408 ?auto_147411 ) ) ( not ( = ?auto_147408 ?auto_147412 ) ) ( not ( = ?auto_147408 ?auto_147413 ) ) ( not ( = ?auto_147409 ?auto_147410 ) ) ( not ( = ?auto_147409 ?auto_147411 ) ) ( not ( = ?auto_147409 ?auto_147412 ) ) ( not ( = ?auto_147409 ?auto_147413 ) ) ( not ( = ?auto_147410 ?auto_147411 ) ) ( not ( = ?auto_147410 ?auto_147412 ) ) ( not ( = ?auto_147410 ?auto_147413 ) ) ( not ( = ?auto_147411 ?auto_147412 ) ) ( not ( = ?auto_147411 ?auto_147413 ) ) ( not ( = ?auto_147412 ?auto_147413 ) ) ( ON ?auto_147411 ?auto_147412 ) ( ON ?auto_147410 ?auto_147411 ) ( ON ?auto_147409 ?auto_147410 ) ( ON ?auto_147408 ?auto_147409 ) ( ON ?auto_147407 ?auto_147408 ) ( ON ?auto_147406 ?auto_147407 ) ( ON ?auto_147405 ?auto_147406 ) ( ON ?auto_147404 ?auto_147405 ) ( ON ?auto_147403 ?auto_147404 ) ( CLEAR ?auto_147403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147403 )
      ( MAKE-10PILE ?auto_147403 ?auto_147404 ?auto_147405 ?auto_147406 ?auto_147407 ?auto_147408 ?auto_147409 ?auto_147410 ?auto_147411 ?auto_147412 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147425 - BLOCK
      ?auto_147426 - BLOCK
      ?auto_147427 - BLOCK
      ?auto_147428 - BLOCK
      ?auto_147429 - BLOCK
      ?auto_147430 - BLOCK
      ?auto_147431 - BLOCK
      ?auto_147432 - BLOCK
      ?auto_147433 - BLOCK
      ?auto_147434 - BLOCK
      ?auto_147435 - BLOCK
    )
    :vars
    (
      ?auto_147436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147434 ) ( ON ?auto_147435 ?auto_147436 ) ( CLEAR ?auto_147435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147425 ) ( ON ?auto_147426 ?auto_147425 ) ( ON ?auto_147427 ?auto_147426 ) ( ON ?auto_147428 ?auto_147427 ) ( ON ?auto_147429 ?auto_147428 ) ( ON ?auto_147430 ?auto_147429 ) ( ON ?auto_147431 ?auto_147430 ) ( ON ?auto_147432 ?auto_147431 ) ( ON ?auto_147433 ?auto_147432 ) ( ON ?auto_147434 ?auto_147433 ) ( not ( = ?auto_147425 ?auto_147426 ) ) ( not ( = ?auto_147425 ?auto_147427 ) ) ( not ( = ?auto_147425 ?auto_147428 ) ) ( not ( = ?auto_147425 ?auto_147429 ) ) ( not ( = ?auto_147425 ?auto_147430 ) ) ( not ( = ?auto_147425 ?auto_147431 ) ) ( not ( = ?auto_147425 ?auto_147432 ) ) ( not ( = ?auto_147425 ?auto_147433 ) ) ( not ( = ?auto_147425 ?auto_147434 ) ) ( not ( = ?auto_147425 ?auto_147435 ) ) ( not ( = ?auto_147425 ?auto_147436 ) ) ( not ( = ?auto_147426 ?auto_147427 ) ) ( not ( = ?auto_147426 ?auto_147428 ) ) ( not ( = ?auto_147426 ?auto_147429 ) ) ( not ( = ?auto_147426 ?auto_147430 ) ) ( not ( = ?auto_147426 ?auto_147431 ) ) ( not ( = ?auto_147426 ?auto_147432 ) ) ( not ( = ?auto_147426 ?auto_147433 ) ) ( not ( = ?auto_147426 ?auto_147434 ) ) ( not ( = ?auto_147426 ?auto_147435 ) ) ( not ( = ?auto_147426 ?auto_147436 ) ) ( not ( = ?auto_147427 ?auto_147428 ) ) ( not ( = ?auto_147427 ?auto_147429 ) ) ( not ( = ?auto_147427 ?auto_147430 ) ) ( not ( = ?auto_147427 ?auto_147431 ) ) ( not ( = ?auto_147427 ?auto_147432 ) ) ( not ( = ?auto_147427 ?auto_147433 ) ) ( not ( = ?auto_147427 ?auto_147434 ) ) ( not ( = ?auto_147427 ?auto_147435 ) ) ( not ( = ?auto_147427 ?auto_147436 ) ) ( not ( = ?auto_147428 ?auto_147429 ) ) ( not ( = ?auto_147428 ?auto_147430 ) ) ( not ( = ?auto_147428 ?auto_147431 ) ) ( not ( = ?auto_147428 ?auto_147432 ) ) ( not ( = ?auto_147428 ?auto_147433 ) ) ( not ( = ?auto_147428 ?auto_147434 ) ) ( not ( = ?auto_147428 ?auto_147435 ) ) ( not ( = ?auto_147428 ?auto_147436 ) ) ( not ( = ?auto_147429 ?auto_147430 ) ) ( not ( = ?auto_147429 ?auto_147431 ) ) ( not ( = ?auto_147429 ?auto_147432 ) ) ( not ( = ?auto_147429 ?auto_147433 ) ) ( not ( = ?auto_147429 ?auto_147434 ) ) ( not ( = ?auto_147429 ?auto_147435 ) ) ( not ( = ?auto_147429 ?auto_147436 ) ) ( not ( = ?auto_147430 ?auto_147431 ) ) ( not ( = ?auto_147430 ?auto_147432 ) ) ( not ( = ?auto_147430 ?auto_147433 ) ) ( not ( = ?auto_147430 ?auto_147434 ) ) ( not ( = ?auto_147430 ?auto_147435 ) ) ( not ( = ?auto_147430 ?auto_147436 ) ) ( not ( = ?auto_147431 ?auto_147432 ) ) ( not ( = ?auto_147431 ?auto_147433 ) ) ( not ( = ?auto_147431 ?auto_147434 ) ) ( not ( = ?auto_147431 ?auto_147435 ) ) ( not ( = ?auto_147431 ?auto_147436 ) ) ( not ( = ?auto_147432 ?auto_147433 ) ) ( not ( = ?auto_147432 ?auto_147434 ) ) ( not ( = ?auto_147432 ?auto_147435 ) ) ( not ( = ?auto_147432 ?auto_147436 ) ) ( not ( = ?auto_147433 ?auto_147434 ) ) ( not ( = ?auto_147433 ?auto_147435 ) ) ( not ( = ?auto_147433 ?auto_147436 ) ) ( not ( = ?auto_147434 ?auto_147435 ) ) ( not ( = ?auto_147434 ?auto_147436 ) ) ( not ( = ?auto_147435 ?auto_147436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147435 ?auto_147436 )
      ( !STACK ?auto_147435 ?auto_147434 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147448 - BLOCK
      ?auto_147449 - BLOCK
      ?auto_147450 - BLOCK
      ?auto_147451 - BLOCK
      ?auto_147452 - BLOCK
      ?auto_147453 - BLOCK
      ?auto_147454 - BLOCK
      ?auto_147455 - BLOCK
      ?auto_147456 - BLOCK
      ?auto_147457 - BLOCK
      ?auto_147458 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147457 ) ( ON-TABLE ?auto_147458 ) ( CLEAR ?auto_147458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147448 ) ( ON ?auto_147449 ?auto_147448 ) ( ON ?auto_147450 ?auto_147449 ) ( ON ?auto_147451 ?auto_147450 ) ( ON ?auto_147452 ?auto_147451 ) ( ON ?auto_147453 ?auto_147452 ) ( ON ?auto_147454 ?auto_147453 ) ( ON ?auto_147455 ?auto_147454 ) ( ON ?auto_147456 ?auto_147455 ) ( ON ?auto_147457 ?auto_147456 ) ( not ( = ?auto_147448 ?auto_147449 ) ) ( not ( = ?auto_147448 ?auto_147450 ) ) ( not ( = ?auto_147448 ?auto_147451 ) ) ( not ( = ?auto_147448 ?auto_147452 ) ) ( not ( = ?auto_147448 ?auto_147453 ) ) ( not ( = ?auto_147448 ?auto_147454 ) ) ( not ( = ?auto_147448 ?auto_147455 ) ) ( not ( = ?auto_147448 ?auto_147456 ) ) ( not ( = ?auto_147448 ?auto_147457 ) ) ( not ( = ?auto_147448 ?auto_147458 ) ) ( not ( = ?auto_147449 ?auto_147450 ) ) ( not ( = ?auto_147449 ?auto_147451 ) ) ( not ( = ?auto_147449 ?auto_147452 ) ) ( not ( = ?auto_147449 ?auto_147453 ) ) ( not ( = ?auto_147449 ?auto_147454 ) ) ( not ( = ?auto_147449 ?auto_147455 ) ) ( not ( = ?auto_147449 ?auto_147456 ) ) ( not ( = ?auto_147449 ?auto_147457 ) ) ( not ( = ?auto_147449 ?auto_147458 ) ) ( not ( = ?auto_147450 ?auto_147451 ) ) ( not ( = ?auto_147450 ?auto_147452 ) ) ( not ( = ?auto_147450 ?auto_147453 ) ) ( not ( = ?auto_147450 ?auto_147454 ) ) ( not ( = ?auto_147450 ?auto_147455 ) ) ( not ( = ?auto_147450 ?auto_147456 ) ) ( not ( = ?auto_147450 ?auto_147457 ) ) ( not ( = ?auto_147450 ?auto_147458 ) ) ( not ( = ?auto_147451 ?auto_147452 ) ) ( not ( = ?auto_147451 ?auto_147453 ) ) ( not ( = ?auto_147451 ?auto_147454 ) ) ( not ( = ?auto_147451 ?auto_147455 ) ) ( not ( = ?auto_147451 ?auto_147456 ) ) ( not ( = ?auto_147451 ?auto_147457 ) ) ( not ( = ?auto_147451 ?auto_147458 ) ) ( not ( = ?auto_147452 ?auto_147453 ) ) ( not ( = ?auto_147452 ?auto_147454 ) ) ( not ( = ?auto_147452 ?auto_147455 ) ) ( not ( = ?auto_147452 ?auto_147456 ) ) ( not ( = ?auto_147452 ?auto_147457 ) ) ( not ( = ?auto_147452 ?auto_147458 ) ) ( not ( = ?auto_147453 ?auto_147454 ) ) ( not ( = ?auto_147453 ?auto_147455 ) ) ( not ( = ?auto_147453 ?auto_147456 ) ) ( not ( = ?auto_147453 ?auto_147457 ) ) ( not ( = ?auto_147453 ?auto_147458 ) ) ( not ( = ?auto_147454 ?auto_147455 ) ) ( not ( = ?auto_147454 ?auto_147456 ) ) ( not ( = ?auto_147454 ?auto_147457 ) ) ( not ( = ?auto_147454 ?auto_147458 ) ) ( not ( = ?auto_147455 ?auto_147456 ) ) ( not ( = ?auto_147455 ?auto_147457 ) ) ( not ( = ?auto_147455 ?auto_147458 ) ) ( not ( = ?auto_147456 ?auto_147457 ) ) ( not ( = ?auto_147456 ?auto_147458 ) ) ( not ( = ?auto_147457 ?auto_147458 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_147458 )
      ( !STACK ?auto_147458 ?auto_147457 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147470 - BLOCK
      ?auto_147471 - BLOCK
      ?auto_147472 - BLOCK
      ?auto_147473 - BLOCK
      ?auto_147474 - BLOCK
      ?auto_147475 - BLOCK
      ?auto_147476 - BLOCK
      ?auto_147477 - BLOCK
      ?auto_147478 - BLOCK
      ?auto_147479 - BLOCK
      ?auto_147480 - BLOCK
    )
    :vars
    (
      ?auto_147481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147480 ?auto_147481 ) ( ON-TABLE ?auto_147470 ) ( ON ?auto_147471 ?auto_147470 ) ( ON ?auto_147472 ?auto_147471 ) ( ON ?auto_147473 ?auto_147472 ) ( ON ?auto_147474 ?auto_147473 ) ( ON ?auto_147475 ?auto_147474 ) ( ON ?auto_147476 ?auto_147475 ) ( ON ?auto_147477 ?auto_147476 ) ( ON ?auto_147478 ?auto_147477 ) ( not ( = ?auto_147470 ?auto_147471 ) ) ( not ( = ?auto_147470 ?auto_147472 ) ) ( not ( = ?auto_147470 ?auto_147473 ) ) ( not ( = ?auto_147470 ?auto_147474 ) ) ( not ( = ?auto_147470 ?auto_147475 ) ) ( not ( = ?auto_147470 ?auto_147476 ) ) ( not ( = ?auto_147470 ?auto_147477 ) ) ( not ( = ?auto_147470 ?auto_147478 ) ) ( not ( = ?auto_147470 ?auto_147479 ) ) ( not ( = ?auto_147470 ?auto_147480 ) ) ( not ( = ?auto_147470 ?auto_147481 ) ) ( not ( = ?auto_147471 ?auto_147472 ) ) ( not ( = ?auto_147471 ?auto_147473 ) ) ( not ( = ?auto_147471 ?auto_147474 ) ) ( not ( = ?auto_147471 ?auto_147475 ) ) ( not ( = ?auto_147471 ?auto_147476 ) ) ( not ( = ?auto_147471 ?auto_147477 ) ) ( not ( = ?auto_147471 ?auto_147478 ) ) ( not ( = ?auto_147471 ?auto_147479 ) ) ( not ( = ?auto_147471 ?auto_147480 ) ) ( not ( = ?auto_147471 ?auto_147481 ) ) ( not ( = ?auto_147472 ?auto_147473 ) ) ( not ( = ?auto_147472 ?auto_147474 ) ) ( not ( = ?auto_147472 ?auto_147475 ) ) ( not ( = ?auto_147472 ?auto_147476 ) ) ( not ( = ?auto_147472 ?auto_147477 ) ) ( not ( = ?auto_147472 ?auto_147478 ) ) ( not ( = ?auto_147472 ?auto_147479 ) ) ( not ( = ?auto_147472 ?auto_147480 ) ) ( not ( = ?auto_147472 ?auto_147481 ) ) ( not ( = ?auto_147473 ?auto_147474 ) ) ( not ( = ?auto_147473 ?auto_147475 ) ) ( not ( = ?auto_147473 ?auto_147476 ) ) ( not ( = ?auto_147473 ?auto_147477 ) ) ( not ( = ?auto_147473 ?auto_147478 ) ) ( not ( = ?auto_147473 ?auto_147479 ) ) ( not ( = ?auto_147473 ?auto_147480 ) ) ( not ( = ?auto_147473 ?auto_147481 ) ) ( not ( = ?auto_147474 ?auto_147475 ) ) ( not ( = ?auto_147474 ?auto_147476 ) ) ( not ( = ?auto_147474 ?auto_147477 ) ) ( not ( = ?auto_147474 ?auto_147478 ) ) ( not ( = ?auto_147474 ?auto_147479 ) ) ( not ( = ?auto_147474 ?auto_147480 ) ) ( not ( = ?auto_147474 ?auto_147481 ) ) ( not ( = ?auto_147475 ?auto_147476 ) ) ( not ( = ?auto_147475 ?auto_147477 ) ) ( not ( = ?auto_147475 ?auto_147478 ) ) ( not ( = ?auto_147475 ?auto_147479 ) ) ( not ( = ?auto_147475 ?auto_147480 ) ) ( not ( = ?auto_147475 ?auto_147481 ) ) ( not ( = ?auto_147476 ?auto_147477 ) ) ( not ( = ?auto_147476 ?auto_147478 ) ) ( not ( = ?auto_147476 ?auto_147479 ) ) ( not ( = ?auto_147476 ?auto_147480 ) ) ( not ( = ?auto_147476 ?auto_147481 ) ) ( not ( = ?auto_147477 ?auto_147478 ) ) ( not ( = ?auto_147477 ?auto_147479 ) ) ( not ( = ?auto_147477 ?auto_147480 ) ) ( not ( = ?auto_147477 ?auto_147481 ) ) ( not ( = ?auto_147478 ?auto_147479 ) ) ( not ( = ?auto_147478 ?auto_147480 ) ) ( not ( = ?auto_147478 ?auto_147481 ) ) ( not ( = ?auto_147479 ?auto_147480 ) ) ( not ( = ?auto_147479 ?auto_147481 ) ) ( not ( = ?auto_147480 ?auto_147481 ) ) ( CLEAR ?auto_147478 ) ( ON ?auto_147479 ?auto_147480 ) ( CLEAR ?auto_147479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_147470 ?auto_147471 ?auto_147472 ?auto_147473 ?auto_147474 ?auto_147475 ?auto_147476 ?auto_147477 ?auto_147478 ?auto_147479 )
      ( MAKE-11PILE ?auto_147470 ?auto_147471 ?auto_147472 ?auto_147473 ?auto_147474 ?auto_147475 ?auto_147476 ?auto_147477 ?auto_147478 ?auto_147479 ?auto_147480 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147493 - BLOCK
      ?auto_147494 - BLOCK
      ?auto_147495 - BLOCK
      ?auto_147496 - BLOCK
      ?auto_147497 - BLOCK
      ?auto_147498 - BLOCK
      ?auto_147499 - BLOCK
      ?auto_147500 - BLOCK
      ?auto_147501 - BLOCK
      ?auto_147502 - BLOCK
      ?auto_147503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147503 ) ( ON-TABLE ?auto_147493 ) ( ON ?auto_147494 ?auto_147493 ) ( ON ?auto_147495 ?auto_147494 ) ( ON ?auto_147496 ?auto_147495 ) ( ON ?auto_147497 ?auto_147496 ) ( ON ?auto_147498 ?auto_147497 ) ( ON ?auto_147499 ?auto_147498 ) ( ON ?auto_147500 ?auto_147499 ) ( ON ?auto_147501 ?auto_147500 ) ( not ( = ?auto_147493 ?auto_147494 ) ) ( not ( = ?auto_147493 ?auto_147495 ) ) ( not ( = ?auto_147493 ?auto_147496 ) ) ( not ( = ?auto_147493 ?auto_147497 ) ) ( not ( = ?auto_147493 ?auto_147498 ) ) ( not ( = ?auto_147493 ?auto_147499 ) ) ( not ( = ?auto_147493 ?auto_147500 ) ) ( not ( = ?auto_147493 ?auto_147501 ) ) ( not ( = ?auto_147493 ?auto_147502 ) ) ( not ( = ?auto_147493 ?auto_147503 ) ) ( not ( = ?auto_147494 ?auto_147495 ) ) ( not ( = ?auto_147494 ?auto_147496 ) ) ( not ( = ?auto_147494 ?auto_147497 ) ) ( not ( = ?auto_147494 ?auto_147498 ) ) ( not ( = ?auto_147494 ?auto_147499 ) ) ( not ( = ?auto_147494 ?auto_147500 ) ) ( not ( = ?auto_147494 ?auto_147501 ) ) ( not ( = ?auto_147494 ?auto_147502 ) ) ( not ( = ?auto_147494 ?auto_147503 ) ) ( not ( = ?auto_147495 ?auto_147496 ) ) ( not ( = ?auto_147495 ?auto_147497 ) ) ( not ( = ?auto_147495 ?auto_147498 ) ) ( not ( = ?auto_147495 ?auto_147499 ) ) ( not ( = ?auto_147495 ?auto_147500 ) ) ( not ( = ?auto_147495 ?auto_147501 ) ) ( not ( = ?auto_147495 ?auto_147502 ) ) ( not ( = ?auto_147495 ?auto_147503 ) ) ( not ( = ?auto_147496 ?auto_147497 ) ) ( not ( = ?auto_147496 ?auto_147498 ) ) ( not ( = ?auto_147496 ?auto_147499 ) ) ( not ( = ?auto_147496 ?auto_147500 ) ) ( not ( = ?auto_147496 ?auto_147501 ) ) ( not ( = ?auto_147496 ?auto_147502 ) ) ( not ( = ?auto_147496 ?auto_147503 ) ) ( not ( = ?auto_147497 ?auto_147498 ) ) ( not ( = ?auto_147497 ?auto_147499 ) ) ( not ( = ?auto_147497 ?auto_147500 ) ) ( not ( = ?auto_147497 ?auto_147501 ) ) ( not ( = ?auto_147497 ?auto_147502 ) ) ( not ( = ?auto_147497 ?auto_147503 ) ) ( not ( = ?auto_147498 ?auto_147499 ) ) ( not ( = ?auto_147498 ?auto_147500 ) ) ( not ( = ?auto_147498 ?auto_147501 ) ) ( not ( = ?auto_147498 ?auto_147502 ) ) ( not ( = ?auto_147498 ?auto_147503 ) ) ( not ( = ?auto_147499 ?auto_147500 ) ) ( not ( = ?auto_147499 ?auto_147501 ) ) ( not ( = ?auto_147499 ?auto_147502 ) ) ( not ( = ?auto_147499 ?auto_147503 ) ) ( not ( = ?auto_147500 ?auto_147501 ) ) ( not ( = ?auto_147500 ?auto_147502 ) ) ( not ( = ?auto_147500 ?auto_147503 ) ) ( not ( = ?auto_147501 ?auto_147502 ) ) ( not ( = ?auto_147501 ?auto_147503 ) ) ( not ( = ?auto_147502 ?auto_147503 ) ) ( CLEAR ?auto_147501 ) ( ON ?auto_147502 ?auto_147503 ) ( CLEAR ?auto_147502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_147493 ?auto_147494 ?auto_147495 ?auto_147496 ?auto_147497 ?auto_147498 ?auto_147499 ?auto_147500 ?auto_147501 ?auto_147502 )
      ( MAKE-11PILE ?auto_147493 ?auto_147494 ?auto_147495 ?auto_147496 ?auto_147497 ?auto_147498 ?auto_147499 ?auto_147500 ?auto_147501 ?auto_147502 ?auto_147503 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147515 - BLOCK
      ?auto_147516 - BLOCK
      ?auto_147517 - BLOCK
      ?auto_147518 - BLOCK
      ?auto_147519 - BLOCK
      ?auto_147520 - BLOCK
      ?auto_147521 - BLOCK
      ?auto_147522 - BLOCK
      ?auto_147523 - BLOCK
      ?auto_147524 - BLOCK
      ?auto_147525 - BLOCK
    )
    :vars
    (
      ?auto_147526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147525 ?auto_147526 ) ( ON-TABLE ?auto_147515 ) ( ON ?auto_147516 ?auto_147515 ) ( ON ?auto_147517 ?auto_147516 ) ( ON ?auto_147518 ?auto_147517 ) ( ON ?auto_147519 ?auto_147518 ) ( ON ?auto_147520 ?auto_147519 ) ( ON ?auto_147521 ?auto_147520 ) ( ON ?auto_147522 ?auto_147521 ) ( not ( = ?auto_147515 ?auto_147516 ) ) ( not ( = ?auto_147515 ?auto_147517 ) ) ( not ( = ?auto_147515 ?auto_147518 ) ) ( not ( = ?auto_147515 ?auto_147519 ) ) ( not ( = ?auto_147515 ?auto_147520 ) ) ( not ( = ?auto_147515 ?auto_147521 ) ) ( not ( = ?auto_147515 ?auto_147522 ) ) ( not ( = ?auto_147515 ?auto_147523 ) ) ( not ( = ?auto_147515 ?auto_147524 ) ) ( not ( = ?auto_147515 ?auto_147525 ) ) ( not ( = ?auto_147515 ?auto_147526 ) ) ( not ( = ?auto_147516 ?auto_147517 ) ) ( not ( = ?auto_147516 ?auto_147518 ) ) ( not ( = ?auto_147516 ?auto_147519 ) ) ( not ( = ?auto_147516 ?auto_147520 ) ) ( not ( = ?auto_147516 ?auto_147521 ) ) ( not ( = ?auto_147516 ?auto_147522 ) ) ( not ( = ?auto_147516 ?auto_147523 ) ) ( not ( = ?auto_147516 ?auto_147524 ) ) ( not ( = ?auto_147516 ?auto_147525 ) ) ( not ( = ?auto_147516 ?auto_147526 ) ) ( not ( = ?auto_147517 ?auto_147518 ) ) ( not ( = ?auto_147517 ?auto_147519 ) ) ( not ( = ?auto_147517 ?auto_147520 ) ) ( not ( = ?auto_147517 ?auto_147521 ) ) ( not ( = ?auto_147517 ?auto_147522 ) ) ( not ( = ?auto_147517 ?auto_147523 ) ) ( not ( = ?auto_147517 ?auto_147524 ) ) ( not ( = ?auto_147517 ?auto_147525 ) ) ( not ( = ?auto_147517 ?auto_147526 ) ) ( not ( = ?auto_147518 ?auto_147519 ) ) ( not ( = ?auto_147518 ?auto_147520 ) ) ( not ( = ?auto_147518 ?auto_147521 ) ) ( not ( = ?auto_147518 ?auto_147522 ) ) ( not ( = ?auto_147518 ?auto_147523 ) ) ( not ( = ?auto_147518 ?auto_147524 ) ) ( not ( = ?auto_147518 ?auto_147525 ) ) ( not ( = ?auto_147518 ?auto_147526 ) ) ( not ( = ?auto_147519 ?auto_147520 ) ) ( not ( = ?auto_147519 ?auto_147521 ) ) ( not ( = ?auto_147519 ?auto_147522 ) ) ( not ( = ?auto_147519 ?auto_147523 ) ) ( not ( = ?auto_147519 ?auto_147524 ) ) ( not ( = ?auto_147519 ?auto_147525 ) ) ( not ( = ?auto_147519 ?auto_147526 ) ) ( not ( = ?auto_147520 ?auto_147521 ) ) ( not ( = ?auto_147520 ?auto_147522 ) ) ( not ( = ?auto_147520 ?auto_147523 ) ) ( not ( = ?auto_147520 ?auto_147524 ) ) ( not ( = ?auto_147520 ?auto_147525 ) ) ( not ( = ?auto_147520 ?auto_147526 ) ) ( not ( = ?auto_147521 ?auto_147522 ) ) ( not ( = ?auto_147521 ?auto_147523 ) ) ( not ( = ?auto_147521 ?auto_147524 ) ) ( not ( = ?auto_147521 ?auto_147525 ) ) ( not ( = ?auto_147521 ?auto_147526 ) ) ( not ( = ?auto_147522 ?auto_147523 ) ) ( not ( = ?auto_147522 ?auto_147524 ) ) ( not ( = ?auto_147522 ?auto_147525 ) ) ( not ( = ?auto_147522 ?auto_147526 ) ) ( not ( = ?auto_147523 ?auto_147524 ) ) ( not ( = ?auto_147523 ?auto_147525 ) ) ( not ( = ?auto_147523 ?auto_147526 ) ) ( not ( = ?auto_147524 ?auto_147525 ) ) ( not ( = ?auto_147524 ?auto_147526 ) ) ( not ( = ?auto_147525 ?auto_147526 ) ) ( ON ?auto_147524 ?auto_147525 ) ( CLEAR ?auto_147522 ) ( ON ?auto_147523 ?auto_147524 ) ( CLEAR ?auto_147523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_147515 ?auto_147516 ?auto_147517 ?auto_147518 ?auto_147519 ?auto_147520 ?auto_147521 ?auto_147522 ?auto_147523 )
      ( MAKE-11PILE ?auto_147515 ?auto_147516 ?auto_147517 ?auto_147518 ?auto_147519 ?auto_147520 ?auto_147521 ?auto_147522 ?auto_147523 ?auto_147524 ?auto_147525 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147538 - BLOCK
      ?auto_147539 - BLOCK
      ?auto_147540 - BLOCK
      ?auto_147541 - BLOCK
      ?auto_147542 - BLOCK
      ?auto_147543 - BLOCK
      ?auto_147544 - BLOCK
      ?auto_147545 - BLOCK
      ?auto_147546 - BLOCK
      ?auto_147547 - BLOCK
      ?auto_147548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147548 ) ( ON-TABLE ?auto_147538 ) ( ON ?auto_147539 ?auto_147538 ) ( ON ?auto_147540 ?auto_147539 ) ( ON ?auto_147541 ?auto_147540 ) ( ON ?auto_147542 ?auto_147541 ) ( ON ?auto_147543 ?auto_147542 ) ( ON ?auto_147544 ?auto_147543 ) ( ON ?auto_147545 ?auto_147544 ) ( not ( = ?auto_147538 ?auto_147539 ) ) ( not ( = ?auto_147538 ?auto_147540 ) ) ( not ( = ?auto_147538 ?auto_147541 ) ) ( not ( = ?auto_147538 ?auto_147542 ) ) ( not ( = ?auto_147538 ?auto_147543 ) ) ( not ( = ?auto_147538 ?auto_147544 ) ) ( not ( = ?auto_147538 ?auto_147545 ) ) ( not ( = ?auto_147538 ?auto_147546 ) ) ( not ( = ?auto_147538 ?auto_147547 ) ) ( not ( = ?auto_147538 ?auto_147548 ) ) ( not ( = ?auto_147539 ?auto_147540 ) ) ( not ( = ?auto_147539 ?auto_147541 ) ) ( not ( = ?auto_147539 ?auto_147542 ) ) ( not ( = ?auto_147539 ?auto_147543 ) ) ( not ( = ?auto_147539 ?auto_147544 ) ) ( not ( = ?auto_147539 ?auto_147545 ) ) ( not ( = ?auto_147539 ?auto_147546 ) ) ( not ( = ?auto_147539 ?auto_147547 ) ) ( not ( = ?auto_147539 ?auto_147548 ) ) ( not ( = ?auto_147540 ?auto_147541 ) ) ( not ( = ?auto_147540 ?auto_147542 ) ) ( not ( = ?auto_147540 ?auto_147543 ) ) ( not ( = ?auto_147540 ?auto_147544 ) ) ( not ( = ?auto_147540 ?auto_147545 ) ) ( not ( = ?auto_147540 ?auto_147546 ) ) ( not ( = ?auto_147540 ?auto_147547 ) ) ( not ( = ?auto_147540 ?auto_147548 ) ) ( not ( = ?auto_147541 ?auto_147542 ) ) ( not ( = ?auto_147541 ?auto_147543 ) ) ( not ( = ?auto_147541 ?auto_147544 ) ) ( not ( = ?auto_147541 ?auto_147545 ) ) ( not ( = ?auto_147541 ?auto_147546 ) ) ( not ( = ?auto_147541 ?auto_147547 ) ) ( not ( = ?auto_147541 ?auto_147548 ) ) ( not ( = ?auto_147542 ?auto_147543 ) ) ( not ( = ?auto_147542 ?auto_147544 ) ) ( not ( = ?auto_147542 ?auto_147545 ) ) ( not ( = ?auto_147542 ?auto_147546 ) ) ( not ( = ?auto_147542 ?auto_147547 ) ) ( not ( = ?auto_147542 ?auto_147548 ) ) ( not ( = ?auto_147543 ?auto_147544 ) ) ( not ( = ?auto_147543 ?auto_147545 ) ) ( not ( = ?auto_147543 ?auto_147546 ) ) ( not ( = ?auto_147543 ?auto_147547 ) ) ( not ( = ?auto_147543 ?auto_147548 ) ) ( not ( = ?auto_147544 ?auto_147545 ) ) ( not ( = ?auto_147544 ?auto_147546 ) ) ( not ( = ?auto_147544 ?auto_147547 ) ) ( not ( = ?auto_147544 ?auto_147548 ) ) ( not ( = ?auto_147545 ?auto_147546 ) ) ( not ( = ?auto_147545 ?auto_147547 ) ) ( not ( = ?auto_147545 ?auto_147548 ) ) ( not ( = ?auto_147546 ?auto_147547 ) ) ( not ( = ?auto_147546 ?auto_147548 ) ) ( not ( = ?auto_147547 ?auto_147548 ) ) ( ON ?auto_147547 ?auto_147548 ) ( CLEAR ?auto_147545 ) ( ON ?auto_147546 ?auto_147547 ) ( CLEAR ?auto_147546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_147538 ?auto_147539 ?auto_147540 ?auto_147541 ?auto_147542 ?auto_147543 ?auto_147544 ?auto_147545 ?auto_147546 )
      ( MAKE-11PILE ?auto_147538 ?auto_147539 ?auto_147540 ?auto_147541 ?auto_147542 ?auto_147543 ?auto_147544 ?auto_147545 ?auto_147546 ?auto_147547 ?auto_147548 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147560 - BLOCK
      ?auto_147561 - BLOCK
      ?auto_147562 - BLOCK
      ?auto_147563 - BLOCK
      ?auto_147564 - BLOCK
      ?auto_147565 - BLOCK
      ?auto_147566 - BLOCK
      ?auto_147567 - BLOCK
      ?auto_147568 - BLOCK
      ?auto_147569 - BLOCK
      ?auto_147570 - BLOCK
    )
    :vars
    (
      ?auto_147571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147570 ?auto_147571 ) ( ON-TABLE ?auto_147560 ) ( ON ?auto_147561 ?auto_147560 ) ( ON ?auto_147562 ?auto_147561 ) ( ON ?auto_147563 ?auto_147562 ) ( ON ?auto_147564 ?auto_147563 ) ( ON ?auto_147565 ?auto_147564 ) ( ON ?auto_147566 ?auto_147565 ) ( not ( = ?auto_147560 ?auto_147561 ) ) ( not ( = ?auto_147560 ?auto_147562 ) ) ( not ( = ?auto_147560 ?auto_147563 ) ) ( not ( = ?auto_147560 ?auto_147564 ) ) ( not ( = ?auto_147560 ?auto_147565 ) ) ( not ( = ?auto_147560 ?auto_147566 ) ) ( not ( = ?auto_147560 ?auto_147567 ) ) ( not ( = ?auto_147560 ?auto_147568 ) ) ( not ( = ?auto_147560 ?auto_147569 ) ) ( not ( = ?auto_147560 ?auto_147570 ) ) ( not ( = ?auto_147560 ?auto_147571 ) ) ( not ( = ?auto_147561 ?auto_147562 ) ) ( not ( = ?auto_147561 ?auto_147563 ) ) ( not ( = ?auto_147561 ?auto_147564 ) ) ( not ( = ?auto_147561 ?auto_147565 ) ) ( not ( = ?auto_147561 ?auto_147566 ) ) ( not ( = ?auto_147561 ?auto_147567 ) ) ( not ( = ?auto_147561 ?auto_147568 ) ) ( not ( = ?auto_147561 ?auto_147569 ) ) ( not ( = ?auto_147561 ?auto_147570 ) ) ( not ( = ?auto_147561 ?auto_147571 ) ) ( not ( = ?auto_147562 ?auto_147563 ) ) ( not ( = ?auto_147562 ?auto_147564 ) ) ( not ( = ?auto_147562 ?auto_147565 ) ) ( not ( = ?auto_147562 ?auto_147566 ) ) ( not ( = ?auto_147562 ?auto_147567 ) ) ( not ( = ?auto_147562 ?auto_147568 ) ) ( not ( = ?auto_147562 ?auto_147569 ) ) ( not ( = ?auto_147562 ?auto_147570 ) ) ( not ( = ?auto_147562 ?auto_147571 ) ) ( not ( = ?auto_147563 ?auto_147564 ) ) ( not ( = ?auto_147563 ?auto_147565 ) ) ( not ( = ?auto_147563 ?auto_147566 ) ) ( not ( = ?auto_147563 ?auto_147567 ) ) ( not ( = ?auto_147563 ?auto_147568 ) ) ( not ( = ?auto_147563 ?auto_147569 ) ) ( not ( = ?auto_147563 ?auto_147570 ) ) ( not ( = ?auto_147563 ?auto_147571 ) ) ( not ( = ?auto_147564 ?auto_147565 ) ) ( not ( = ?auto_147564 ?auto_147566 ) ) ( not ( = ?auto_147564 ?auto_147567 ) ) ( not ( = ?auto_147564 ?auto_147568 ) ) ( not ( = ?auto_147564 ?auto_147569 ) ) ( not ( = ?auto_147564 ?auto_147570 ) ) ( not ( = ?auto_147564 ?auto_147571 ) ) ( not ( = ?auto_147565 ?auto_147566 ) ) ( not ( = ?auto_147565 ?auto_147567 ) ) ( not ( = ?auto_147565 ?auto_147568 ) ) ( not ( = ?auto_147565 ?auto_147569 ) ) ( not ( = ?auto_147565 ?auto_147570 ) ) ( not ( = ?auto_147565 ?auto_147571 ) ) ( not ( = ?auto_147566 ?auto_147567 ) ) ( not ( = ?auto_147566 ?auto_147568 ) ) ( not ( = ?auto_147566 ?auto_147569 ) ) ( not ( = ?auto_147566 ?auto_147570 ) ) ( not ( = ?auto_147566 ?auto_147571 ) ) ( not ( = ?auto_147567 ?auto_147568 ) ) ( not ( = ?auto_147567 ?auto_147569 ) ) ( not ( = ?auto_147567 ?auto_147570 ) ) ( not ( = ?auto_147567 ?auto_147571 ) ) ( not ( = ?auto_147568 ?auto_147569 ) ) ( not ( = ?auto_147568 ?auto_147570 ) ) ( not ( = ?auto_147568 ?auto_147571 ) ) ( not ( = ?auto_147569 ?auto_147570 ) ) ( not ( = ?auto_147569 ?auto_147571 ) ) ( not ( = ?auto_147570 ?auto_147571 ) ) ( ON ?auto_147569 ?auto_147570 ) ( ON ?auto_147568 ?auto_147569 ) ( CLEAR ?auto_147566 ) ( ON ?auto_147567 ?auto_147568 ) ( CLEAR ?auto_147567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147560 ?auto_147561 ?auto_147562 ?auto_147563 ?auto_147564 ?auto_147565 ?auto_147566 ?auto_147567 )
      ( MAKE-11PILE ?auto_147560 ?auto_147561 ?auto_147562 ?auto_147563 ?auto_147564 ?auto_147565 ?auto_147566 ?auto_147567 ?auto_147568 ?auto_147569 ?auto_147570 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147583 - BLOCK
      ?auto_147584 - BLOCK
      ?auto_147585 - BLOCK
      ?auto_147586 - BLOCK
      ?auto_147587 - BLOCK
      ?auto_147588 - BLOCK
      ?auto_147589 - BLOCK
      ?auto_147590 - BLOCK
      ?auto_147591 - BLOCK
      ?auto_147592 - BLOCK
      ?auto_147593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147593 ) ( ON-TABLE ?auto_147583 ) ( ON ?auto_147584 ?auto_147583 ) ( ON ?auto_147585 ?auto_147584 ) ( ON ?auto_147586 ?auto_147585 ) ( ON ?auto_147587 ?auto_147586 ) ( ON ?auto_147588 ?auto_147587 ) ( ON ?auto_147589 ?auto_147588 ) ( not ( = ?auto_147583 ?auto_147584 ) ) ( not ( = ?auto_147583 ?auto_147585 ) ) ( not ( = ?auto_147583 ?auto_147586 ) ) ( not ( = ?auto_147583 ?auto_147587 ) ) ( not ( = ?auto_147583 ?auto_147588 ) ) ( not ( = ?auto_147583 ?auto_147589 ) ) ( not ( = ?auto_147583 ?auto_147590 ) ) ( not ( = ?auto_147583 ?auto_147591 ) ) ( not ( = ?auto_147583 ?auto_147592 ) ) ( not ( = ?auto_147583 ?auto_147593 ) ) ( not ( = ?auto_147584 ?auto_147585 ) ) ( not ( = ?auto_147584 ?auto_147586 ) ) ( not ( = ?auto_147584 ?auto_147587 ) ) ( not ( = ?auto_147584 ?auto_147588 ) ) ( not ( = ?auto_147584 ?auto_147589 ) ) ( not ( = ?auto_147584 ?auto_147590 ) ) ( not ( = ?auto_147584 ?auto_147591 ) ) ( not ( = ?auto_147584 ?auto_147592 ) ) ( not ( = ?auto_147584 ?auto_147593 ) ) ( not ( = ?auto_147585 ?auto_147586 ) ) ( not ( = ?auto_147585 ?auto_147587 ) ) ( not ( = ?auto_147585 ?auto_147588 ) ) ( not ( = ?auto_147585 ?auto_147589 ) ) ( not ( = ?auto_147585 ?auto_147590 ) ) ( not ( = ?auto_147585 ?auto_147591 ) ) ( not ( = ?auto_147585 ?auto_147592 ) ) ( not ( = ?auto_147585 ?auto_147593 ) ) ( not ( = ?auto_147586 ?auto_147587 ) ) ( not ( = ?auto_147586 ?auto_147588 ) ) ( not ( = ?auto_147586 ?auto_147589 ) ) ( not ( = ?auto_147586 ?auto_147590 ) ) ( not ( = ?auto_147586 ?auto_147591 ) ) ( not ( = ?auto_147586 ?auto_147592 ) ) ( not ( = ?auto_147586 ?auto_147593 ) ) ( not ( = ?auto_147587 ?auto_147588 ) ) ( not ( = ?auto_147587 ?auto_147589 ) ) ( not ( = ?auto_147587 ?auto_147590 ) ) ( not ( = ?auto_147587 ?auto_147591 ) ) ( not ( = ?auto_147587 ?auto_147592 ) ) ( not ( = ?auto_147587 ?auto_147593 ) ) ( not ( = ?auto_147588 ?auto_147589 ) ) ( not ( = ?auto_147588 ?auto_147590 ) ) ( not ( = ?auto_147588 ?auto_147591 ) ) ( not ( = ?auto_147588 ?auto_147592 ) ) ( not ( = ?auto_147588 ?auto_147593 ) ) ( not ( = ?auto_147589 ?auto_147590 ) ) ( not ( = ?auto_147589 ?auto_147591 ) ) ( not ( = ?auto_147589 ?auto_147592 ) ) ( not ( = ?auto_147589 ?auto_147593 ) ) ( not ( = ?auto_147590 ?auto_147591 ) ) ( not ( = ?auto_147590 ?auto_147592 ) ) ( not ( = ?auto_147590 ?auto_147593 ) ) ( not ( = ?auto_147591 ?auto_147592 ) ) ( not ( = ?auto_147591 ?auto_147593 ) ) ( not ( = ?auto_147592 ?auto_147593 ) ) ( ON ?auto_147592 ?auto_147593 ) ( ON ?auto_147591 ?auto_147592 ) ( CLEAR ?auto_147589 ) ( ON ?auto_147590 ?auto_147591 ) ( CLEAR ?auto_147590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147583 ?auto_147584 ?auto_147585 ?auto_147586 ?auto_147587 ?auto_147588 ?auto_147589 ?auto_147590 )
      ( MAKE-11PILE ?auto_147583 ?auto_147584 ?auto_147585 ?auto_147586 ?auto_147587 ?auto_147588 ?auto_147589 ?auto_147590 ?auto_147591 ?auto_147592 ?auto_147593 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147605 - BLOCK
      ?auto_147606 - BLOCK
      ?auto_147607 - BLOCK
      ?auto_147608 - BLOCK
      ?auto_147609 - BLOCK
      ?auto_147610 - BLOCK
      ?auto_147611 - BLOCK
      ?auto_147612 - BLOCK
      ?auto_147613 - BLOCK
      ?auto_147614 - BLOCK
      ?auto_147615 - BLOCK
    )
    :vars
    (
      ?auto_147616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147615 ?auto_147616 ) ( ON-TABLE ?auto_147605 ) ( ON ?auto_147606 ?auto_147605 ) ( ON ?auto_147607 ?auto_147606 ) ( ON ?auto_147608 ?auto_147607 ) ( ON ?auto_147609 ?auto_147608 ) ( ON ?auto_147610 ?auto_147609 ) ( not ( = ?auto_147605 ?auto_147606 ) ) ( not ( = ?auto_147605 ?auto_147607 ) ) ( not ( = ?auto_147605 ?auto_147608 ) ) ( not ( = ?auto_147605 ?auto_147609 ) ) ( not ( = ?auto_147605 ?auto_147610 ) ) ( not ( = ?auto_147605 ?auto_147611 ) ) ( not ( = ?auto_147605 ?auto_147612 ) ) ( not ( = ?auto_147605 ?auto_147613 ) ) ( not ( = ?auto_147605 ?auto_147614 ) ) ( not ( = ?auto_147605 ?auto_147615 ) ) ( not ( = ?auto_147605 ?auto_147616 ) ) ( not ( = ?auto_147606 ?auto_147607 ) ) ( not ( = ?auto_147606 ?auto_147608 ) ) ( not ( = ?auto_147606 ?auto_147609 ) ) ( not ( = ?auto_147606 ?auto_147610 ) ) ( not ( = ?auto_147606 ?auto_147611 ) ) ( not ( = ?auto_147606 ?auto_147612 ) ) ( not ( = ?auto_147606 ?auto_147613 ) ) ( not ( = ?auto_147606 ?auto_147614 ) ) ( not ( = ?auto_147606 ?auto_147615 ) ) ( not ( = ?auto_147606 ?auto_147616 ) ) ( not ( = ?auto_147607 ?auto_147608 ) ) ( not ( = ?auto_147607 ?auto_147609 ) ) ( not ( = ?auto_147607 ?auto_147610 ) ) ( not ( = ?auto_147607 ?auto_147611 ) ) ( not ( = ?auto_147607 ?auto_147612 ) ) ( not ( = ?auto_147607 ?auto_147613 ) ) ( not ( = ?auto_147607 ?auto_147614 ) ) ( not ( = ?auto_147607 ?auto_147615 ) ) ( not ( = ?auto_147607 ?auto_147616 ) ) ( not ( = ?auto_147608 ?auto_147609 ) ) ( not ( = ?auto_147608 ?auto_147610 ) ) ( not ( = ?auto_147608 ?auto_147611 ) ) ( not ( = ?auto_147608 ?auto_147612 ) ) ( not ( = ?auto_147608 ?auto_147613 ) ) ( not ( = ?auto_147608 ?auto_147614 ) ) ( not ( = ?auto_147608 ?auto_147615 ) ) ( not ( = ?auto_147608 ?auto_147616 ) ) ( not ( = ?auto_147609 ?auto_147610 ) ) ( not ( = ?auto_147609 ?auto_147611 ) ) ( not ( = ?auto_147609 ?auto_147612 ) ) ( not ( = ?auto_147609 ?auto_147613 ) ) ( not ( = ?auto_147609 ?auto_147614 ) ) ( not ( = ?auto_147609 ?auto_147615 ) ) ( not ( = ?auto_147609 ?auto_147616 ) ) ( not ( = ?auto_147610 ?auto_147611 ) ) ( not ( = ?auto_147610 ?auto_147612 ) ) ( not ( = ?auto_147610 ?auto_147613 ) ) ( not ( = ?auto_147610 ?auto_147614 ) ) ( not ( = ?auto_147610 ?auto_147615 ) ) ( not ( = ?auto_147610 ?auto_147616 ) ) ( not ( = ?auto_147611 ?auto_147612 ) ) ( not ( = ?auto_147611 ?auto_147613 ) ) ( not ( = ?auto_147611 ?auto_147614 ) ) ( not ( = ?auto_147611 ?auto_147615 ) ) ( not ( = ?auto_147611 ?auto_147616 ) ) ( not ( = ?auto_147612 ?auto_147613 ) ) ( not ( = ?auto_147612 ?auto_147614 ) ) ( not ( = ?auto_147612 ?auto_147615 ) ) ( not ( = ?auto_147612 ?auto_147616 ) ) ( not ( = ?auto_147613 ?auto_147614 ) ) ( not ( = ?auto_147613 ?auto_147615 ) ) ( not ( = ?auto_147613 ?auto_147616 ) ) ( not ( = ?auto_147614 ?auto_147615 ) ) ( not ( = ?auto_147614 ?auto_147616 ) ) ( not ( = ?auto_147615 ?auto_147616 ) ) ( ON ?auto_147614 ?auto_147615 ) ( ON ?auto_147613 ?auto_147614 ) ( ON ?auto_147612 ?auto_147613 ) ( CLEAR ?auto_147610 ) ( ON ?auto_147611 ?auto_147612 ) ( CLEAR ?auto_147611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147605 ?auto_147606 ?auto_147607 ?auto_147608 ?auto_147609 ?auto_147610 ?auto_147611 )
      ( MAKE-11PILE ?auto_147605 ?auto_147606 ?auto_147607 ?auto_147608 ?auto_147609 ?auto_147610 ?auto_147611 ?auto_147612 ?auto_147613 ?auto_147614 ?auto_147615 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147628 - BLOCK
      ?auto_147629 - BLOCK
      ?auto_147630 - BLOCK
      ?auto_147631 - BLOCK
      ?auto_147632 - BLOCK
      ?auto_147633 - BLOCK
      ?auto_147634 - BLOCK
      ?auto_147635 - BLOCK
      ?auto_147636 - BLOCK
      ?auto_147637 - BLOCK
      ?auto_147638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147638 ) ( ON-TABLE ?auto_147628 ) ( ON ?auto_147629 ?auto_147628 ) ( ON ?auto_147630 ?auto_147629 ) ( ON ?auto_147631 ?auto_147630 ) ( ON ?auto_147632 ?auto_147631 ) ( ON ?auto_147633 ?auto_147632 ) ( not ( = ?auto_147628 ?auto_147629 ) ) ( not ( = ?auto_147628 ?auto_147630 ) ) ( not ( = ?auto_147628 ?auto_147631 ) ) ( not ( = ?auto_147628 ?auto_147632 ) ) ( not ( = ?auto_147628 ?auto_147633 ) ) ( not ( = ?auto_147628 ?auto_147634 ) ) ( not ( = ?auto_147628 ?auto_147635 ) ) ( not ( = ?auto_147628 ?auto_147636 ) ) ( not ( = ?auto_147628 ?auto_147637 ) ) ( not ( = ?auto_147628 ?auto_147638 ) ) ( not ( = ?auto_147629 ?auto_147630 ) ) ( not ( = ?auto_147629 ?auto_147631 ) ) ( not ( = ?auto_147629 ?auto_147632 ) ) ( not ( = ?auto_147629 ?auto_147633 ) ) ( not ( = ?auto_147629 ?auto_147634 ) ) ( not ( = ?auto_147629 ?auto_147635 ) ) ( not ( = ?auto_147629 ?auto_147636 ) ) ( not ( = ?auto_147629 ?auto_147637 ) ) ( not ( = ?auto_147629 ?auto_147638 ) ) ( not ( = ?auto_147630 ?auto_147631 ) ) ( not ( = ?auto_147630 ?auto_147632 ) ) ( not ( = ?auto_147630 ?auto_147633 ) ) ( not ( = ?auto_147630 ?auto_147634 ) ) ( not ( = ?auto_147630 ?auto_147635 ) ) ( not ( = ?auto_147630 ?auto_147636 ) ) ( not ( = ?auto_147630 ?auto_147637 ) ) ( not ( = ?auto_147630 ?auto_147638 ) ) ( not ( = ?auto_147631 ?auto_147632 ) ) ( not ( = ?auto_147631 ?auto_147633 ) ) ( not ( = ?auto_147631 ?auto_147634 ) ) ( not ( = ?auto_147631 ?auto_147635 ) ) ( not ( = ?auto_147631 ?auto_147636 ) ) ( not ( = ?auto_147631 ?auto_147637 ) ) ( not ( = ?auto_147631 ?auto_147638 ) ) ( not ( = ?auto_147632 ?auto_147633 ) ) ( not ( = ?auto_147632 ?auto_147634 ) ) ( not ( = ?auto_147632 ?auto_147635 ) ) ( not ( = ?auto_147632 ?auto_147636 ) ) ( not ( = ?auto_147632 ?auto_147637 ) ) ( not ( = ?auto_147632 ?auto_147638 ) ) ( not ( = ?auto_147633 ?auto_147634 ) ) ( not ( = ?auto_147633 ?auto_147635 ) ) ( not ( = ?auto_147633 ?auto_147636 ) ) ( not ( = ?auto_147633 ?auto_147637 ) ) ( not ( = ?auto_147633 ?auto_147638 ) ) ( not ( = ?auto_147634 ?auto_147635 ) ) ( not ( = ?auto_147634 ?auto_147636 ) ) ( not ( = ?auto_147634 ?auto_147637 ) ) ( not ( = ?auto_147634 ?auto_147638 ) ) ( not ( = ?auto_147635 ?auto_147636 ) ) ( not ( = ?auto_147635 ?auto_147637 ) ) ( not ( = ?auto_147635 ?auto_147638 ) ) ( not ( = ?auto_147636 ?auto_147637 ) ) ( not ( = ?auto_147636 ?auto_147638 ) ) ( not ( = ?auto_147637 ?auto_147638 ) ) ( ON ?auto_147637 ?auto_147638 ) ( ON ?auto_147636 ?auto_147637 ) ( ON ?auto_147635 ?auto_147636 ) ( CLEAR ?auto_147633 ) ( ON ?auto_147634 ?auto_147635 ) ( CLEAR ?auto_147634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147628 ?auto_147629 ?auto_147630 ?auto_147631 ?auto_147632 ?auto_147633 ?auto_147634 )
      ( MAKE-11PILE ?auto_147628 ?auto_147629 ?auto_147630 ?auto_147631 ?auto_147632 ?auto_147633 ?auto_147634 ?auto_147635 ?auto_147636 ?auto_147637 ?auto_147638 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147650 - BLOCK
      ?auto_147651 - BLOCK
      ?auto_147652 - BLOCK
      ?auto_147653 - BLOCK
      ?auto_147654 - BLOCK
      ?auto_147655 - BLOCK
      ?auto_147656 - BLOCK
      ?auto_147657 - BLOCK
      ?auto_147658 - BLOCK
      ?auto_147659 - BLOCK
      ?auto_147660 - BLOCK
    )
    :vars
    (
      ?auto_147661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147660 ?auto_147661 ) ( ON-TABLE ?auto_147650 ) ( ON ?auto_147651 ?auto_147650 ) ( ON ?auto_147652 ?auto_147651 ) ( ON ?auto_147653 ?auto_147652 ) ( ON ?auto_147654 ?auto_147653 ) ( not ( = ?auto_147650 ?auto_147651 ) ) ( not ( = ?auto_147650 ?auto_147652 ) ) ( not ( = ?auto_147650 ?auto_147653 ) ) ( not ( = ?auto_147650 ?auto_147654 ) ) ( not ( = ?auto_147650 ?auto_147655 ) ) ( not ( = ?auto_147650 ?auto_147656 ) ) ( not ( = ?auto_147650 ?auto_147657 ) ) ( not ( = ?auto_147650 ?auto_147658 ) ) ( not ( = ?auto_147650 ?auto_147659 ) ) ( not ( = ?auto_147650 ?auto_147660 ) ) ( not ( = ?auto_147650 ?auto_147661 ) ) ( not ( = ?auto_147651 ?auto_147652 ) ) ( not ( = ?auto_147651 ?auto_147653 ) ) ( not ( = ?auto_147651 ?auto_147654 ) ) ( not ( = ?auto_147651 ?auto_147655 ) ) ( not ( = ?auto_147651 ?auto_147656 ) ) ( not ( = ?auto_147651 ?auto_147657 ) ) ( not ( = ?auto_147651 ?auto_147658 ) ) ( not ( = ?auto_147651 ?auto_147659 ) ) ( not ( = ?auto_147651 ?auto_147660 ) ) ( not ( = ?auto_147651 ?auto_147661 ) ) ( not ( = ?auto_147652 ?auto_147653 ) ) ( not ( = ?auto_147652 ?auto_147654 ) ) ( not ( = ?auto_147652 ?auto_147655 ) ) ( not ( = ?auto_147652 ?auto_147656 ) ) ( not ( = ?auto_147652 ?auto_147657 ) ) ( not ( = ?auto_147652 ?auto_147658 ) ) ( not ( = ?auto_147652 ?auto_147659 ) ) ( not ( = ?auto_147652 ?auto_147660 ) ) ( not ( = ?auto_147652 ?auto_147661 ) ) ( not ( = ?auto_147653 ?auto_147654 ) ) ( not ( = ?auto_147653 ?auto_147655 ) ) ( not ( = ?auto_147653 ?auto_147656 ) ) ( not ( = ?auto_147653 ?auto_147657 ) ) ( not ( = ?auto_147653 ?auto_147658 ) ) ( not ( = ?auto_147653 ?auto_147659 ) ) ( not ( = ?auto_147653 ?auto_147660 ) ) ( not ( = ?auto_147653 ?auto_147661 ) ) ( not ( = ?auto_147654 ?auto_147655 ) ) ( not ( = ?auto_147654 ?auto_147656 ) ) ( not ( = ?auto_147654 ?auto_147657 ) ) ( not ( = ?auto_147654 ?auto_147658 ) ) ( not ( = ?auto_147654 ?auto_147659 ) ) ( not ( = ?auto_147654 ?auto_147660 ) ) ( not ( = ?auto_147654 ?auto_147661 ) ) ( not ( = ?auto_147655 ?auto_147656 ) ) ( not ( = ?auto_147655 ?auto_147657 ) ) ( not ( = ?auto_147655 ?auto_147658 ) ) ( not ( = ?auto_147655 ?auto_147659 ) ) ( not ( = ?auto_147655 ?auto_147660 ) ) ( not ( = ?auto_147655 ?auto_147661 ) ) ( not ( = ?auto_147656 ?auto_147657 ) ) ( not ( = ?auto_147656 ?auto_147658 ) ) ( not ( = ?auto_147656 ?auto_147659 ) ) ( not ( = ?auto_147656 ?auto_147660 ) ) ( not ( = ?auto_147656 ?auto_147661 ) ) ( not ( = ?auto_147657 ?auto_147658 ) ) ( not ( = ?auto_147657 ?auto_147659 ) ) ( not ( = ?auto_147657 ?auto_147660 ) ) ( not ( = ?auto_147657 ?auto_147661 ) ) ( not ( = ?auto_147658 ?auto_147659 ) ) ( not ( = ?auto_147658 ?auto_147660 ) ) ( not ( = ?auto_147658 ?auto_147661 ) ) ( not ( = ?auto_147659 ?auto_147660 ) ) ( not ( = ?auto_147659 ?auto_147661 ) ) ( not ( = ?auto_147660 ?auto_147661 ) ) ( ON ?auto_147659 ?auto_147660 ) ( ON ?auto_147658 ?auto_147659 ) ( ON ?auto_147657 ?auto_147658 ) ( ON ?auto_147656 ?auto_147657 ) ( CLEAR ?auto_147654 ) ( ON ?auto_147655 ?auto_147656 ) ( CLEAR ?auto_147655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147650 ?auto_147651 ?auto_147652 ?auto_147653 ?auto_147654 ?auto_147655 )
      ( MAKE-11PILE ?auto_147650 ?auto_147651 ?auto_147652 ?auto_147653 ?auto_147654 ?auto_147655 ?auto_147656 ?auto_147657 ?auto_147658 ?auto_147659 ?auto_147660 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147673 - BLOCK
      ?auto_147674 - BLOCK
      ?auto_147675 - BLOCK
      ?auto_147676 - BLOCK
      ?auto_147677 - BLOCK
      ?auto_147678 - BLOCK
      ?auto_147679 - BLOCK
      ?auto_147680 - BLOCK
      ?auto_147681 - BLOCK
      ?auto_147682 - BLOCK
      ?auto_147683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147683 ) ( ON-TABLE ?auto_147673 ) ( ON ?auto_147674 ?auto_147673 ) ( ON ?auto_147675 ?auto_147674 ) ( ON ?auto_147676 ?auto_147675 ) ( ON ?auto_147677 ?auto_147676 ) ( not ( = ?auto_147673 ?auto_147674 ) ) ( not ( = ?auto_147673 ?auto_147675 ) ) ( not ( = ?auto_147673 ?auto_147676 ) ) ( not ( = ?auto_147673 ?auto_147677 ) ) ( not ( = ?auto_147673 ?auto_147678 ) ) ( not ( = ?auto_147673 ?auto_147679 ) ) ( not ( = ?auto_147673 ?auto_147680 ) ) ( not ( = ?auto_147673 ?auto_147681 ) ) ( not ( = ?auto_147673 ?auto_147682 ) ) ( not ( = ?auto_147673 ?auto_147683 ) ) ( not ( = ?auto_147674 ?auto_147675 ) ) ( not ( = ?auto_147674 ?auto_147676 ) ) ( not ( = ?auto_147674 ?auto_147677 ) ) ( not ( = ?auto_147674 ?auto_147678 ) ) ( not ( = ?auto_147674 ?auto_147679 ) ) ( not ( = ?auto_147674 ?auto_147680 ) ) ( not ( = ?auto_147674 ?auto_147681 ) ) ( not ( = ?auto_147674 ?auto_147682 ) ) ( not ( = ?auto_147674 ?auto_147683 ) ) ( not ( = ?auto_147675 ?auto_147676 ) ) ( not ( = ?auto_147675 ?auto_147677 ) ) ( not ( = ?auto_147675 ?auto_147678 ) ) ( not ( = ?auto_147675 ?auto_147679 ) ) ( not ( = ?auto_147675 ?auto_147680 ) ) ( not ( = ?auto_147675 ?auto_147681 ) ) ( not ( = ?auto_147675 ?auto_147682 ) ) ( not ( = ?auto_147675 ?auto_147683 ) ) ( not ( = ?auto_147676 ?auto_147677 ) ) ( not ( = ?auto_147676 ?auto_147678 ) ) ( not ( = ?auto_147676 ?auto_147679 ) ) ( not ( = ?auto_147676 ?auto_147680 ) ) ( not ( = ?auto_147676 ?auto_147681 ) ) ( not ( = ?auto_147676 ?auto_147682 ) ) ( not ( = ?auto_147676 ?auto_147683 ) ) ( not ( = ?auto_147677 ?auto_147678 ) ) ( not ( = ?auto_147677 ?auto_147679 ) ) ( not ( = ?auto_147677 ?auto_147680 ) ) ( not ( = ?auto_147677 ?auto_147681 ) ) ( not ( = ?auto_147677 ?auto_147682 ) ) ( not ( = ?auto_147677 ?auto_147683 ) ) ( not ( = ?auto_147678 ?auto_147679 ) ) ( not ( = ?auto_147678 ?auto_147680 ) ) ( not ( = ?auto_147678 ?auto_147681 ) ) ( not ( = ?auto_147678 ?auto_147682 ) ) ( not ( = ?auto_147678 ?auto_147683 ) ) ( not ( = ?auto_147679 ?auto_147680 ) ) ( not ( = ?auto_147679 ?auto_147681 ) ) ( not ( = ?auto_147679 ?auto_147682 ) ) ( not ( = ?auto_147679 ?auto_147683 ) ) ( not ( = ?auto_147680 ?auto_147681 ) ) ( not ( = ?auto_147680 ?auto_147682 ) ) ( not ( = ?auto_147680 ?auto_147683 ) ) ( not ( = ?auto_147681 ?auto_147682 ) ) ( not ( = ?auto_147681 ?auto_147683 ) ) ( not ( = ?auto_147682 ?auto_147683 ) ) ( ON ?auto_147682 ?auto_147683 ) ( ON ?auto_147681 ?auto_147682 ) ( ON ?auto_147680 ?auto_147681 ) ( ON ?auto_147679 ?auto_147680 ) ( CLEAR ?auto_147677 ) ( ON ?auto_147678 ?auto_147679 ) ( CLEAR ?auto_147678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147673 ?auto_147674 ?auto_147675 ?auto_147676 ?auto_147677 ?auto_147678 )
      ( MAKE-11PILE ?auto_147673 ?auto_147674 ?auto_147675 ?auto_147676 ?auto_147677 ?auto_147678 ?auto_147679 ?auto_147680 ?auto_147681 ?auto_147682 ?auto_147683 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147695 - BLOCK
      ?auto_147696 - BLOCK
      ?auto_147697 - BLOCK
      ?auto_147698 - BLOCK
      ?auto_147699 - BLOCK
      ?auto_147700 - BLOCK
      ?auto_147701 - BLOCK
      ?auto_147702 - BLOCK
      ?auto_147703 - BLOCK
      ?auto_147704 - BLOCK
      ?auto_147705 - BLOCK
    )
    :vars
    (
      ?auto_147706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147705 ?auto_147706 ) ( ON-TABLE ?auto_147695 ) ( ON ?auto_147696 ?auto_147695 ) ( ON ?auto_147697 ?auto_147696 ) ( ON ?auto_147698 ?auto_147697 ) ( not ( = ?auto_147695 ?auto_147696 ) ) ( not ( = ?auto_147695 ?auto_147697 ) ) ( not ( = ?auto_147695 ?auto_147698 ) ) ( not ( = ?auto_147695 ?auto_147699 ) ) ( not ( = ?auto_147695 ?auto_147700 ) ) ( not ( = ?auto_147695 ?auto_147701 ) ) ( not ( = ?auto_147695 ?auto_147702 ) ) ( not ( = ?auto_147695 ?auto_147703 ) ) ( not ( = ?auto_147695 ?auto_147704 ) ) ( not ( = ?auto_147695 ?auto_147705 ) ) ( not ( = ?auto_147695 ?auto_147706 ) ) ( not ( = ?auto_147696 ?auto_147697 ) ) ( not ( = ?auto_147696 ?auto_147698 ) ) ( not ( = ?auto_147696 ?auto_147699 ) ) ( not ( = ?auto_147696 ?auto_147700 ) ) ( not ( = ?auto_147696 ?auto_147701 ) ) ( not ( = ?auto_147696 ?auto_147702 ) ) ( not ( = ?auto_147696 ?auto_147703 ) ) ( not ( = ?auto_147696 ?auto_147704 ) ) ( not ( = ?auto_147696 ?auto_147705 ) ) ( not ( = ?auto_147696 ?auto_147706 ) ) ( not ( = ?auto_147697 ?auto_147698 ) ) ( not ( = ?auto_147697 ?auto_147699 ) ) ( not ( = ?auto_147697 ?auto_147700 ) ) ( not ( = ?auto_147697 ?auto_147701 ) ) ( not ( = ?auto_147697 ?auto_147702 ) ) ( not ( = ?auto_147697 ?auto_147703 ) ) ( not ( = ?auto_147697 ?auto_147704 ) ) ( not ( = ?auto_147697 ?auto_147705 ) ) ( not ( = ?auto_147697 ?auto_147706 ) ) ( not ( = ?auto_147698 ?auto_147699 ) ) ( not ( = ?auto_147698 ?auto_147700 ) ) ( not ( = ?auto_147698 ?auto_147701 ) ) ( not ( = ?auto_147698 ?auto_147702 ) ) ( not ( = ?auto_147698 ?auto_147703 ) ) ( not ( = ?auto_147698 ?auto_147704 ) ) ( not ( = ?auto_147698 ?auto_147705 ) ) ( not ( = ?auto_147698 ?auto_147706 ) ) ( not ( = ?auto_147699 ?auto_147700 ) ) ( not ( = ?auto_147699 ?auto_147701 ) ) ( not ( = ?auto_147699 ?auto_147702 ) ) ( not ( = ?auto_147699 ?auto_147703 ) ) ( not ( = ?auto_147699 ?auto_147704 ) ) ( not ( = ?auto_147699 ?auto_147705 ) ) ( not ( = ?auto_147699 ?auto_147706 ) ) ( not ( = ?auto_147700 ?auto_147701 ) ) ( not ( = ?auto_147700 ?auto_147702 ) ) ( not ( = ?auto_147700 ?auto_147703 ) ) ( not ( = ?auto_147700 ?auto_147704 ) ) ( not ( = ?auto_147700 ?auto_147705 ) ) ( not ( = ?auto_147700 ?auto_147706 ) ) ( not ( = ?auto_147701 ?auto_147702 ) ) ( not ( = ?auto_147701 ?auto_147703 ) ) ( not ( = ?auto_147701 ?auto_147704 ) ) ( not ( = ?auto_147701 ?auto_147705 ) ) ( not ( = ?auto_147701 ?auto_147706 ) ) ( not ( = ?auto_147702 ?auto_147703 ) ) ( not ( = ?auto_147702 ?auto_147704 ) ) ( not ( = ?auto_147702 ?auto_147705 ) ) ( not ( = ?auto_147702 ?auto_147706 ) ) ( not ( = ?auto_147703 ?auto_147704 ) ) ( not ( = ?auto_147703 ?auto_147705 ) ) ( not ( = ?auto_147703 ?auto_147706 ) ) ( not ( = ?auto_147704 ?auto_147705 ) ) ( not ( = ?auto_147704 ?auto_147706 ) ) ( not ( = ?auto_147705 ?auto_147706 ) ) ( ON ?auto_147704 ?auto_147705 ) ( ON ?auto_147703 ?auto_147704 ) ( ON ?auto_147702 ?auto_147703 ) ( ON ?auto_147701 ?auto_147702 ) ( ON ?auto_147700 ?auto_147701 ) ( CLEAR ?auto_147698 ) ( ON ?auto_147699 ?auto_147700 ) ( CLEAR ?auto_147699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147695 ?auto_147696 ?auto_147697 ?auto_147698 ?auto_147699 )
      ( MAKE-11PILE ?auto_147695 ?auto_147696 ?auto_147697 ?auto_147698 ?auto_147699 ?auto_147700 ?auto_147701 ?auto_147702 ?auto_147703 ?auto_147704 ?auto_147705 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147718 - BLOCK
      ?auto_147719 - BLOCK
      ?auto_147720 - BLOCK
      ?auto_147721 - BLOCK
      ?auto_147722 - BLOCK
      ?auto_147723 - BLOCK
      ?auto_147724 - BLOCK
      ?auto_147725 - BLOCK
      ?auto_147726 - BLOCK
      ?auto_147727 - BLOCK
      ?auto_147728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147728 ) ( ON-TABLE ?auto_147718 ) ( ON ?auto_147719 ?auto_147718 ) ( ON ?auto_147720 ?auto_147719 ) ( ON ?auto_147721 ?auto_147720 ) ( not ( = ?auto_147718 ?auto_147719 ) ) ( not ( = ?auto_147718 ?auto_147720 ) ) ( not ( = ?auto_147718 ?auto_147721 ) ) ( not ( = ?auto_147718 ?auto_147722 ) ) ( not ( = ?auto_147718 ?auto_147723 ) ) ( not ( = ?auto_147718 ?auto_147724 ) ) ( not ( = ?auto_147718 ?auto_147725 ) ) ( not ( = ?auto_147718 ?auto_147726 ) ) ( not ( = ?auto_147718 ?auto_147727 ) ) ( not ( = ?auto_147718 ?auto_147728 ) ) ( not ( = ?auto_147719 ?auto_147720 ) ) ( not ( = ?auto_147719 ?auto_147721 ) ) ( not ( = ?auto_147719 ?auto_147722 ) ) ( not ( = ?auto_147719 ?auto_147723 ) ) ( not ( = ?auto_147719 ?auto_147724 ) ) ( not ( = ?auto_147719 ?auto_147725 ) ) ( not ( = ?auto_147719 ?auto_147726 ) ) ( not ( = ?auto_147719 ?auto_147727 ) ) ( not ( = ?auto_147719 ?auto_147728 ) ) ( not ( = ?auto_147720 ?auto_147721 ) ) ( not ( = ?auto_147720 ?auto_147722 ) ) ( not ( = ?auto_147720 ?auto_147723 ) ) ( not ( = ?auto_147720 ?auto_147724 ) ) ( not ( = ?auto_147720 ?auto_147725 ) ) ( not ( = ?auto_147720 ?auto_147726 ) ) ( not ( = ?auto_147720 ?auto_147727 ) ) ( not ( = ?auto_147720 ?auto_147728 ) ) ( not ( = ?auto_147721 ?auto_147722 ) ) ( not ( = ?auto_147721 ?auto_147723 ) ) ( not ( = ?auto_147721 ?auto_147724 ) ) ( not ( = ?auto_147721 ?auto_147725 ) ) ( not ( = ?auto_147721 ?auto_147726 ) ) ( not ( = ?auto_147721 ?auto_147727 ) ) ( not ( = ?auto_147721 ?auto_147728 ) ) ( not ( = ?auto_147722 ?auto_147723 ) ) ( not ( = ?auto_147722 ?auto_147724 ) ) ( not ( = ?auto_147722 ?auto_147725 ) ) ( not ( = ?auto_147722 ?auto_147726 ) ) ( not ( = ?auto_147722 ?auto_147727 ) ) ( not ( = ?auto_147722 ?auto_147728 ) ) ( not ( = ?auto_147723 ?auto_147724 ) ) ( not ( = ?auto_147723 ?auto_147725 ) ) ( not ( = ?auto_147723 ?auto_147726 ) ) ( not ( = ?auto_147723 ?auto_147727 ) ) ( not ( = ?auto_147723 ?auto_147728 ) ) ( not ( = ?auto_147724 ?auto_147725 ) ) ( not ( = ?auto_147724 ?auto_147726 ) ) ( not ( = ?auto_147724 ?auto_147727 ) ) ( not ( = ?auto_147724 ?auto_147728 ) ) ( not ( = ?auto_147725 ?auto_147726 ) ) ( not ( = ?auto_147725 ?auto_147727 ) ) ( not ( = ?auto_147725 ?auto_147728 ) ) ( not ( = ?auto_147726 ?auto_147727 ) ) ( not ( = ?auto_147726 ?auto_147728 ) ) ( not ( = ?auto_147727 ?auto_147728 ) ) ( ON ?auto_147727 ?auto_147728 ) ( ON ?auto_147726 ?auto_147727 ) ( ON ?auto_147725 ?auto_147726 ) ( ON ?auto_147724 ?auto_147725 ) ( ON ?auto_147723 ?auto_147724 ) ( CLEAR ?auto_147721 ) ( ON ?auto_147722 ?auto_147723 ) ( CLEAR ?auto_147722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147718 ?auto_147719 ?auto_147720 ?auto_147721 ?auto_147722 )
      ( MAKE-11PILE ?auto_147718 ?auto_147719 ?auto_147720 ?auto_147721 ?auto_147722 ?auto_147723 ?auto_147724 ?auto_147725 ?auto_147726 ?auto_147727 ?auto_147728 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147740 - BLOCK
      ?auto_147741 - BLOCK
      ?auto_147742 - BLOCK
      ?auto_147743 - BLOCK
      ?auto_147744 - BLOCK
      ?auto_147745 - BLOCK
      ?auto_147746 - BLOCK
      ?auto_147747 - BLOCK
      ?auto_147748 - BLOCK
      ?auto_147749 - BLOCK
      ?auto_147750 - BLOCK
    )
    :vars
    (
      ?auto_147751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147750 ?auto_147751 ) ( ON-TABLE ?auto_147740 ) ( ON ?auto_147741 ?auto_147740 ) ( ON ?auto_147742 ?auto_147741 ) ( not ( = ?auto_147740 ?auto_147741 ) ) ( not ( = ?auto_147740 ?auto_147742 ) ) ( not ( = ?auto_147740 ?auto_147743 ) ) ( not ( = ?auto_147740 ?auto_147744 ) ) ( not ( = ?auto_147740 ?auto_147745 ) ) ( not ( = ?auto_147740 ?auto_147746 ) ) ( not ( = ?auto_147740 ?auto_147747 ) ) ( not ( = ?auto_147740 ?auto_147748 ) ) ( not ( = ?auto_147740 ?auto_147749 ) ) ( not ( = ?auto_147740 ?auto_147750 ) ) ( not ( = ?auto_147740 ?auto_147751 ) ) ( not ( = ?auto_147741 ?auto_147742 ) ) ( not ( = ?auto_147741 ?auto_147743 ) ) ( not ( = ?auto_147741 ?auto_147744 ) ) ( not ( = ?auto_147741 ?auto_147745 ) ) ( not ( = ?auto_147741 ?auto_147746 ) ) ( not ( = ?auto_147741 ?auto_147747 ) ) ( not ( = ?auto_147741 ?auto_147748 ) ) ( not ( = ?auto_147741 ?auto_147749 ) ) ( not ( = ?auto_147741 ?auto_147750 ) ) ( not ( = ?auto_147741 ?auto_147751 ) ) ( not ( = ?auto_147742 ?auto_147743 ) ) ( not ( = ?auto_147742 ?auto_147744 ) ) ( not ( = ?auto_147742 ?auto_147745 ) ) ( not ( = ?auto_147742 ?auto_147746 ) ) ( not ( = ?auto_147742 ?auto_147747 ) ) ( not ( = ?auto_147742 ?auto_147748 ) ) ( not ( = ?auto_147742 ?auto_147749 ) ) ( not ( = ?auto_147742 ?auto_147750 ) ) ( not ( = ?auto_147742 ?auto_147751 ) ) ( not ( = ?auto_147743 ?auto_147744 ) ) ( not ( = ?auto_147743 ?auto_147745 ) ) ( not ( = ?auto_147743 ?auto_147746 ) ) ( not ( = ?auto_147743 ?auto_147747 ) ) ( not ( = ?auto_147743 ?auto_147748 ) ) ( not ( = ?auto_147743 ?auto_147749 ) ) ( not ( = ?auto_147743 ?auto_147750 ) ) ( not ( = ?auto_147743 ?auto_147751 ) ) ( not ( = ?auto_147744 ?auto_147745 ) ) ( not ( = ?auto_147744 ?auto_147746 ) ) ( not ( = ?auto_147744 ?auto_147747 ) ) ( not ( = ?auto_147744 ?auto_147748 ) ) ( not ( = ?auto_147744 ?auto_147749 ) ) ( not ( = ?auto_147744 ?auto_147750 ) ) ( not ( = ?auto_147744 ?auto_147751 ) ) ( not ( = ?auto_147745 ?auto_147746 ) ) ( not ( = ?auto_147745 ?auto_147747 ) ) ( not ( = ?auto_147745 ?auto_147748 ) ) ( not ( = ?auto_147745 ?auto_147749 ) ) ( not ( = ?auto_147745 ?auto_147750 ) ) ( not ( = ?auto_147745 ?auto_147751 ) ) ( not ( = ?auto_147746 ?auto_147747 ) ) ( not ( = ?auto_147746 ?auto_147748 ) ) ( not ( = ?auto_147746 ?auto_147749 ) ) ( not ( = ?auto_147746 ?auto_147750 ) ) ( not ( = ?auto_147746 ?auto_147751 ) ) ( not ( = ?auto_147747 ?auto_147748 ) ) ( not ( = ?auto_147747 ?auto_147749 ) ) ( not ( = ?auto_147747 ?auto_147750 ) ) ( not ( = ?auto_147747 ?auto_147751 ) ) ( not ( = ?auto_147748 ?auto_147749 ) ) ( not ( = ?auto_147748 ?auto_147750 ) ) ( not ( = ?auto_147748 ?auto_147751 ) ) ( not ( = ?auto_147749 ?auto_147750 ) ) ( not ( = ?auto_147749 ?auto_147751 ) ) ( not ( = ?auto_147750 ?auto_147751 ) ) ( ON ?auto_147749 ?auto_147750 ) ( ON ?auto_147748 ?auto_147749 ) ( ON ?auto_147747 ?auto_147748 ) ( ON ?auto_147746 ?auto_147747 ) ( ON ?auto_147745 ?auto_147746 ) ( ON ?auto_147744 ?auto_147745 ) ( CLEAR ?auto_147742 ) ( ON ?auto_147743 ?auto_147744 ) ( CLEAR ?auto_147743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147740 ?auto_147741 ?auto_147742 ?auto_147743 )
      ( MAKE-11PILE ?auto_147740 ?auto_147741 ?auto_147742 ?auto_147743 ?auto_147744 ?auto_147745 ?auto_147746 ?auto_147747 ?auto_147748 ?auto_147749 ?auto_147750 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147763 - BLOCK
      ?auto_147764 - BLOCK
      ?auto_147765 - BLOCK
      ?auto_147766 - BLOCK
      ?auto_147767 - BLOCK
      ?auto_147768 - BLOCK
      ?auto_147769 - BLOCK
      ?auto_147770 - BLOCK
      ?auto_147771 - BLOCK
      ?auto_147772 - BLOCK
      ?auto_147773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147773 ) ( ON-TABLE ?auto_147763 ) ( ON ?auto_147764 ?auto_147763 ) ( ON ?auto_147765 ?auto_147764 ) ( not ( = ?auto_147763 ?auto_147764 ) ) ( not ( = ?auto_147763 ?auto_147765 ) ) ( not ( = ?auto_147763 ?auto_147766 ) ) ( not ( = ?auto_147763 ?auto_147767 ) ) ( not ( = ?auto_147763 ?auto_147768 ) ) ( not ( = ?auto_147763 ?auto_147769 ) ) ( not ( = ?auto_147763 ?auto_147770 ) ) ( not ( = ?auto_147763 ?auto_147771 ) ) ( not ( = ?auto_147763 ?auto_147772 ) ) ( not ( = ?auto_147763 ?auto_147773 ) ) ( not ( = ?auto_147764 ?auto_147765 ) ) ( not ( = ?auto_147764 ?auto_147766 ) ) ( not ( = ?auto_147764 ?auto_147767 ) ) ( not ( = ?auto_147764 ?auto_147768 ) ) ( not ( = ?auto_147764 ?auto_147769 ) ) ( not ( = ?auto_147764 ?auto_147770 ) ) ( not ( = ?auto_147764 ?auto_147771 ) ) ( not ( = ?auto_147764 ?auto_147772 ) ) ( not ( = ?auto_147764 ?auto_147773 ) ) ( not ( = ?auto_147765 ?auto_147766 ) ) ( not ( = ?auto_147765 ?auto_147767 ) ) ( not ( = ?auto_147765 ?auto_147768 ) ) ( not ( = ?auto_147765 ?auto_147769 ) ) ( not ( = ?auto_147765 ?auto_147770 ) ) ( not ( = ?auto_147765 ?auto_147771 ) ) ( not ( = ?auto_147765 ?auto_147772 ) ) ( not ( = ?auto_147765 ?auto_147773 ) ) ( not ( = ?auto_147766 ?auto_147767 ) ) ( not ( = ?auto_147766 ?auto_147768 ) ) ( not ( = ?auto_147766 ?auto_147769 ) ) ( not ( = ?auto_147766 ?auto_147770 ) ) ( not ( = ?auto_147766 ?auto_147771 ) ) ( not ( = ?auto_147766 ?auto_147772 ) ) ( not ( = ?auto_147766 ?auto_147773 ) ) ( not ( = ?auto_147767 ?auto_147768 ) ) ( not ( = ?auto_147767 ?auto_147769 ) ) ( not ( = ?auto_147767 ?auto_147770 ) ) ( not ( = ?auto_147767 ?auto_147771 ) ) ( not ( = ?auto_147767 ?auto_147772 ) ) ( not ( = ?auto_147767 ?auto_147773 ) ) ( not ( = ?auto_147768 ?auto_147769 ) ) ( not ( = ?auto_147768 ?auto_147770 ) ) ( not ( = ?auto_147768 ?auto_147771 ) ) ( not ( = ?auto_147768 ?auto_147772 ) ) ( not ( = ?auto_147768 ?auto_147773 ) ) ( not ( = ?auto_147769 ?auto_147770 ) ) ( not ( = ?auto_147769 ?auto_147771 ) ) ( not ( = ?auto_147769 ?auto_147772 ) ) ( not ( = ?auto_147769 ?auto_147773 ) ) ( not ( = ?auto_147770 ?auto_147771 ) ) ( not ( = ?auto_147770 ?auto_147772 ) ) ( not ( = ?auto_147770 ?auto_147773 ) ) ( not ( = ?auto_147771 ?auto_147772 ) ) ( not ( = ?auto_147771 ?auto_147773 ) ) ( not ( = ?auto_147772 ?auto_147773 ) ) ( ON ?auto_147772 ?auto_147773 ) ( ON ?auto_147771 ?auto_147772 ) ( ON ?auto_147770 ?auto_147771 ) ( ON ?auto_147769 ?auto_147770 ) ( ON ?auto_147768 ?auto_147769 ) ( ON ?auto_147767 ?auto_147768 ) ( CLEAR ?auto_147765 ) ( ON ?auto_147766 ?auto_147767 ) ( CLEAR ?auto_147766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147763 ?auto_147764 ?auto_147765 ?auto_147766 )
      ( MAKE-11PILE ?auto_147763 ?auto_147764 ?auto_147765 ?auto_147766 ?auto_147767 ?auto_147768 ?auto_147769 ?auto_147770 ?auto_147771 ?auto_147772 ?auto_147773 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147785 - BLOCK
      ?auto_147786 - BLOCK
      ?auto_147787 - BLOCK
      ?auto_147788 - BLOCK
      ?auto_147789 - BLOCK
      ?auto_147790 - BLOCK
      ?auto_147791 - BLOCK
      ?auto_147792 - BLOCK
      ?auto_147793 - BLOCK
      ?auto_147794 - BLOCK
      ?auto_147795 - BLOCK
    )
    :vars
    (
      ?auto_147796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147795 ?auto_147796 ) ( ON-TABLE ?auto_147785 ) ( ON ?auto_147786 ?auto_147785 ) ( not ( = ?auto_147785 ?auto_147786 ) ) ( not ( = ?auto_147785 ?auto_147787 ) ) ( not ( = ?auto_147785 ?auto_147788 ) ) ( not ( = ?auto_147785 ?auto_147789 ) ) ( not ( = ?auto_147785 ?auto_147790 ) ) ( not ( = ?auto_147785 ?auto_147791 ) ) ( not ( = ?auto_147785 ?auto_147792 ) ) ( not ( = ?auto_147785 ?auto_147793 ) ) ( not ( = ?auto_147785 ?auto_147794 ) ) ( not ( = ?auto_147785 ?auto_147795 ) ) ( not ( = ?auto_147785 ?auto_147796 ) ) ( not ( = ?auto_147786 ?auto_147787 ) ) ( not ( = ?auto_147786 ?auto_147788 ) ) ( not ( = ?auto_147786 ?auto_147789 ) ) ( not ( = ?auto_147786 ?auto_147790 ) ) ( not ( = ?auto_147786 ?auto_147791 ) ) ( not ( = ?auto_147786 ?auto_147792 ) ) ( not ( = ?auto_147786 ?auto_147793 ) ) ( not ( = ?auto_147786 ?auto_147794 ) ) ( not ( = ?auto_147786 ?auto_147795 ) ) ( not ( = ?auto_147786 ?auto_147796 ) ) ( not ( = ?auto_147787 ?auto_147788 ) ) ( not ( = ?auto_147787 ?auto_147789 ) ) ( not ( = ?auto_147787 ?auto_147790 ) ) ( not ( = ?auto_147787 ?auto_147791 ) ) ( not ( = ?auto_147787 ?auto_147792 ) ) ( not ( = ?auto_147787 ?auto_147793 ) ) ( not ( = ?auto_147787 ?auto_147794 ) ) ( not ( = ?auto_147787 ?auto_147795 ) ) ( not ( = ?auto_147787 ?auto_147796 ) ) ( not ( = ?auto_147788 ?auto_147789 ) ) ( not ( = ?auto_147788 ?auto_147790 ) ) ( not ( = ?auto_147788 ?auto_147791 ) ) ( not ( = ?auto_147788 ?auto_147792 ) ) ( not ( = ?auto_147788 ?auto_147793 ) ) ( not ( = ?auto_147788 ?auto_147794 ) ) ( not ( = ?auto_147788 ?auto_147795 ) ) ( not ( = ?auto_147788 ?auto_147796 ) ) ( not ( = ?auto_147789 ?auto_147790 ) ) ( not ( = ?auto_147789 ?auto_147791 ) ) ( not ( = ?auto_147789 ?auto_147792 ) ) ( not ( = ?auto_147789 ?auto_147793 ) ) ( not ( = ?auto_147789 ?auto_147794 ) ) ( not ( = ?auto_147789 ?auto_147795 ) ) ( not ( = ?auto_147789 ?auto_147796 ) ) ( not ( = ?auto_147790 ?auto_147791 ) ) ( not ( = ?auto_147790 ?auto_147792 ) ) ( not ( = ?auto_147790 ?auto_147793 ) ) ( not ( = ?auto_147790 ?auto_147794 ) ) ( not ( = ?auto_147790 ?auto_147795 ) ) ( not ( = ?auto_147790 ?auto_147796 ) ) ( not ( = ?auto_147791 ?auto_147792 ) ) ( not ( = ?auto_147791 ?auto_147793 ) ) ( not ( = ?auto_147791 ?auto_147794 ) ) ( not ( = ?auto_147791 ?auto_147795 ) ) ( not ( = ?auto_147791 ?auto_147796 ) ) ( not ( = ?auto_147792 ?auto_147793 ) ) ( not ( = ?auto_147792 ?auto_147794 ) ) ( not ( = ?auto_147792 ?auto_147795 ) ) ( not ( = ?auto_147792 ?auto_147796 ) ) ( not ( = ?auto_147793 ?auto_147794 ) ) ( not ( = ?auto_147793 ?auto_147795 ) ) ( not ( = ?auto_147793 ?auto_147796 ) ) ( not ( = ?auto_147794 ?auto_147795 ) ) ( not ( = ?auto_147794 ?auto_147796 ) ) ( not ( = ?auto_147795 ?auto_147796 ) ) ( ON ?auto_147794 ?auto_147795 ) ( ON ?auto_147793 ?auto_147794 ) ( ON ?auto_147792 ?auto_147793 ) ( ON ?auto_147791 ?auto_147792 ) ( ON ?auto_147790 ?auto_147791 ) ( ON ?auto_147789 ?auto_147790 ) ( ON ?auto_147788 ?auto_147789 ) ( CLEAR ?auto_147786 ) ( ON ?auto_147787 ?auto_147788 ) ( CLEAR ?auto_147787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147785 ?auto_147786 ?auto_147787 )
      ( MAKE-11PILE ?auto_147785 ?auto_147786 ?auto_147787 ?auto_147788 ?auto_147789 ?auto_147790 ?auto_147791 ?auto_147792 ?auto_147793 ?auto_147794 ?auto_147795 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147808 - BLOCK
      ?auto_147809 - BLOCK
      ?auto_147810 - BLOCK
      ?auto_147811 - BLOCK
      ?auto_147812 - BLOCK
      ?auto_147813 - BLOCK
      ?auto_147814 - BLOCK
      ?auto_147815 - BLOCK
      ?auto_147816 - BLOCK
      ?auto_147817 - BLOCK
      ?auto_147818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147818 ) ( ON-TABLE ?auto_147808 ) ( ON ?auto_147809 ?auto_147808 ) ( not ( = ?auto_147808 ?auto_147809 ) ) ( not ( = ?auto_147808 ?auto_147810 ) ) ( not ( = ?auto_147808 ?auto_147811 ) ) ( not ( = ?auto_147808 ?auto_147812 ) ) ( not ( = ?auto_147808 ?auto_147813 ) ) ( not ( = ?auto_147808 ?auto_147814 ) ) ( not ( = ?auto_147808 ?auto_147815 ) ) ( not ( = ?auto_147808 ?auto_147816 ) ) ( not ( = ?auto_147808 ?auto_147817 ) ) ( not ( = ?auto_147808 ?auto_147818 ) ) ( not ( = ?auto_147809 ?auto_147810 ) ) ( not ( = ?auto_147809 ?auto_147811 ) ) ( not ( = ?auto_147809 ?auto_147812 ) ) ( not ( = ?auto_147809 ?auto_147813 ) ) ( not ( = ?auto_147809 ?auto_147814 ) ) ( not ( = ?auto_147809 ?auto_147815 ) ) ( not ( = ?auto_147809 ?auto_147816 ) ) ( not ( = ?auto_147809 ?auto_147817 ) ) ( not ( = ?auto_147809 ?auto_147818 ) ) ( not ( = ?auto_147810 ?auto_147811 ) ) ( not ( = ?auto_147810 ?auto_147812 ) ) ( not ( = ?auto_147810 ?auto_147813 ) ) ( not ( = ?auto_147810 ?auto_147814 ) ) ( not ( = ?auto_147810 ?auto_147815 ) ) ( not ( = ?auto_147810 ?auto_147816 ) ) ( not ( = ?auto_147810 ?auto_147817 ) ) ( not ( = ?auto_147810 ?auto_147818 ) ) ( not ( = ?auto_147811 ?auto_147812 ) ) ( not ( = ?auto_147811 ?auto_147813 ) ) ( not ( = ?auto_147811 ?auto_147814 ) ) ( not ( = ?auto_147811 ?auto_147815 ) ) ( not ( = ?auto_147811 ?auto_147816 ) ) ( not ( = ?auto_147811 ?auto_147817 ) ) ( not ( = ?auto_147811 ?auto_147818 ) ) ( not ( = ?auto_147812 ?auto_147813 ) ) ( not ( = ?auto_147812 ?auto_147814 ) ) ( not ( = ?auto_147812 ?auto_147815 ) ) ( not ( = ?auto_147812 ?auto_147816 ) ) ( not ( = ?auto_147812 ?auto_147817 ) ) ( not ( = ?auto_147812 ?auto_147818 ) ) ( not ( = ?auto_147813 ?auto_147814 ) ) ( not ( = ?auto_147813 ?auto_147815 ) ) ( not ( = ?auto_147813 ?auto_147816 ) ) ( not ( = ?auto_147813 ?auto_147817 ) ) ( not ( = ?auto_147813 ?auto_147818 ) ) ( not ( = ?auto_147814 ?auto_147815 ) ) ( not ( = ?auto_147814 ?auto_147816 ) ) ( not ( = ?auto_147814 ?auto_147817 ) ) ( not ( = ?auto_147814 ?auto_147818 ) ) ( not ( = ?auto_147815 ?auto_147816 ) ) ( not ( = ?auto_147815 ?auto_147817 ) ) ( not ( = ?auto_147815 ?auto_147818 ) ) ( not ( = ?auto_147816 ?auto_147817 ) ) ( not ( = ?auto_147816 ?auto_147818 ) ) ( not ( = ?auto_147817 ?auto_147818 ) ) ( ON ?auto_147817 ?auto_147818 ) ( ON ?auto_147816 ?auto_147817 ) ( ON ?auto_147815 ?auto_147816 ) ( ON ?auto_147814 ?auto_147815 ) ( ON ?auto_147813 ?auto_147814 ) ( ON ?auto_147812 ?auto_147813 ) ( ON ?auto_147811 ?auto_147812 ) ( CLEAR ?auto_147809 ) ( ON ?auto_147810 ?auto_147811 ) ( CLEAR ?auto_147810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147808 ?auto_147809 ?auto_147810 )
      ( MAKE-11PILE ?auto_147808 ?auto_147809 ?auto_147810 ?auto_147811 ?auto_147812 ?auto_147813 ?auto_147814 ?auto_147815 ?auto_147816 ?auto_147817 ?auto_147818 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147830 - BLOCK
      ?auto_147831 - BLOCK
      ?auto_147832 - BLOCK
      ?auto_147833 - BLOCK
      ?auto_147834 - BLOCK
      ?auto_147835 - BLOCK
      ?auto_147836 - BLOCK
      ?auto_147837 - BLOCK
      ?auto_147838 - BLOCK
      ?auto_147839 - BLOCK
      ?auto_147840 - BLOCK
    )
    :vars
    (
      ?auto_147841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147840 ?auto_147841 ) ( ON-TABLE ?auto_147830 ) ( not ( = ?auto_147830 ?auto_147831 ) ) ( not ( = ?auto_147830 ?auto_147832 ) ) ( not ( = ?auto_147830 ?auto_147833 ) ) ( not ( = ?auto_147830 ?auto_147834 ) ) ( not ( = ?auto_147830 ?auto_147835 ) ) ( not ( = ?auto_147830 ?auto_147836 ) ) ( not ( = ?auto_147830 ?auto_147837 ) ) ( not ( = ?auto_147830 ?auto_147838 ) ) ( not ( = ?auto_147830 ?auto_147839 ) ) ( not ( = ?auto_147830 ?auto_147840 ) ) ( not ( = ?auto_147830 ?auto_147841 ) ) ( not ( = ?auto_147831 ?auto_147832 ) ) ( not ( = ?auto_147831 ?auto_147833 ) ) ( not ( = ?auto_147831 ?auto_147834 ) ) ( not ( = ?auto_147831 ?auto_147835 ) ) ( not ( = ?auto_147831 ?auto_147836 ) ) ( not ( = ?auto_147831 ?auto_147837 ) ) ( not ( = ?auto_147831 ?auto_147838 ) ) ( not ( = ?auto_147831 ?auto_147839 ) ) ( not ( = ?auto_147831 ?auto_147840 ) ) ( not ( = ?auto_147831 ?auto_147841 ) ) ( not ( = ?auto_147832 ?auto_147833 ) ) ( not ( = ?auto_147832 ?auto_147834 ) ) ( not ( = ?auto_147832 ?auto_147835 ) ) ( not ( = ?auto_147832 ?auto_147836 ) ) ( not ( = ?auto_147832 ?auto_147837 ) ) ( not ( = ?auto_147832 ?auto_147838 ) ) ( not ( = ?auto_147832 ?auto_147839 ) ) ( not ( = ?auto_147832 ?auto_147840 ) ) ( not ( = ?auto_147832 ?auto_147841 ) ) ( not ( = ?auto_147833 ?auto_147834 ) ) ( not ( = ?auto_147833 ?auto_147835 ) ) ( not ( = ?auto_147833 ?auto_147836 ) ) ( not ( = ?auto_147833 ?auto_147837 ) ) ( not ( = ?auto_147833 ?auto_147838 ) ) ( not ( = ?auto_147833 ?auto_147839 ) ) ( not ( = ?auto_147833 ?auto_147840 ) ) ( not ( = ?auto_147833 ?auto_147841 ) ) ( not ( = ?auto_147834 ?auto_147835 ) ) ( not ( = ?auto_147834 ?auto_147836 ) ) ( not ( = ?auto_147834 ?auto_147837 ) ) ( not ( = ?auto_147834 ?auto_147838 ) ) ( not ( = ?auto_147834 ?auto_147839 ) ) ( not ( = ?auto_147834 ?auto_147840 ) ) ( not ( = ?auto_147834 ?auto_147841 ) ) ( not ( = ?auto_147835 ?auto_147836 ) ) ( not ( = ?auto_147835 ?auto_147837 ) ) ( not ( = ?auto_147835 ?auto_147838 ) ) ( not ( = ?auto_147835 ?auto_147839 ) ) ( not ( = ?auto_147835 ?auto_147840 ) ) ( not ( = ?auto_147835 ?auto_147841 ) ) ( not ( = ?auto_147836 ?auto_147837 ) ) ( not ( = ?auto_147836 ?auto_147838 ) ) ( not ( = ?auto_147836 ?auto_147839 ) ) ( not ( = ?auto_147836 ?auto_147840 ) ) ( not ( = ?auto_147836 ?auto_147841 ) ) ( not ( = ?auto_147837 ?auto_147838 ) ) ( not ( = ?auto_147837 ?auto_147839 ) ) ( not ( = ?auto_147837 ?auto_147840 ) ) ( not ( = ?auto_147837 ?auto_147841 ) ) ( not ( = ?auto_147838 ?auto_147839 ) ) ( not ( = ?auto_147838 ?auto_147840 ) ) ( not ( = ?auto_147838 ?auto_147841 ) ) ( not ( = ?auto_147839 ?auto_147840 ) ) ( not ( = ?auto_147839 ?auto_147841 ) ) ( not ( = ?auto_147840 ?auto_147841 ) ) ( ON ?auto_147839 ?auto_147840 ) ( ON ?auto_147838 ?auto_147839 ) ( ON ?auto_147837 ?auto_147838 ) ( ON ?auto_147836 ?auto_147837 ) ( ON ?auto_147835 ?auto_147836 ) ( ON ?auto_147834 ?auto_147835 ) ( ON ?auto_147833 ?auto_147834 ) ( ON ?auto_147832 ?auto_147833 ) ( CLEAR ?auto_147830 ) ( ON ?auto_147831 ?auto_147832 ) ( CLEAR ?auto_147831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147830 ?auto_147831 )
      ( MAKE-11PILE ?auto_147830 ?auto_147831 ?auto_147832 ?auto_147833 ?auto_147834 ?auto_147835 ?auto_147836 ?auto_147837 ?auto_147838 ?auto_147839 ?auto_147840 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147853 - BLOCK
      ?auto_147854 - BLOCK
      ?auto_147855 - BLOCK
      ?auto_147856 - BLOCK
      ?auto_147857 - BLOCK
      ?auto_147858 - BLOCK
      ?auto_147859 - BLOCK
      ?auto_147860 - BLOCK
      ?auto_147861 - BLOCK
      ?auto_147862 - BLOCK
      ?auto_147863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147863 ) ( ON-TABLE ?auto_147853 ) ( not ( = ?auto_147853 ?auto_147854 ) ) ( not ( = ?auto_147853 ?auto_147855 ) ) ( not ( = ?auto_147853 ?auto_147856 ) ) ( not ( = ?auto_147853 ?auto_147857 ) ) ( not ( = ?auto_147853 ?auto_147858 ) ) ( not ( = ?auto_147853 ?auto_147859 ) ) ( not ( = ?auto_147853 ?auto_147860 ) ) ( not ( = ?auto_147853 ?auto_147861 ) ) ( not ( = ?auto_147853 ?auto_147862 ) ) ( not ( = ?auto_147853 ?auto_147863 ) ) ( not ( = ?auto_147854 ?auto_147855 ) ) ( not ( = ?auto_147854 ?auto_147856 ) ) ( not ( = ?auto_147854 ?auto_147857 ) ) ( not ( = ?auto_147854 ?auto_147858 ) ) ( not ( = ?auto_147854 ?auto_147859 ) ) ( not ( = ?auto_147854 ?auto_147860 ) ) ( not ( = ?auto_147854 ?auto_147861 ) ) ( not ( = ?auto_147854 ?auto_147862 ) ) ( not ( = ?auto_147854 ?auto_147863 ) ) ( not ( = ?auto_147855 ?auto_147856 ) ) ( not ( = ?auto_147855 ?auto_147857 ) ) ( not ( = ?auto_147855 ?auto_147858 ) ) ( not ( = ?auto_147855 ?auto_147859 ) ) ( not ( = ?auto_147855 ?auto_147860 ) ) ( not ( = ?auto_147855 ?auto_147861 ) ) ( not ( = ?auto_147855 ?auto_147862 ) ) ( not ( = ?auto_147855 ?auto_147863 ) ) ( not ( = ?auto_147856 ?auto_147857 ) ) ( not ( = ?auto_147856 ?auto_147858 ) ) ( not ( = ?auto_147856 ?auto_147859 ) ) ( not ( = ?auto_147856 ?auto_147860 ) ) ( not ( = ?auto_147856 ?auto_147861 ) ) ( not ( = ?auto_147856 ?auto_147862 ) ) ( not ( = ?auto_147856 ?auto_147863 ) ) ( not ( = ?auto_147857 ?auto_147858 ) ) ( not ( = ?auto_147857 ?auto_147859 ) ) ( not ( = ?auto_147857 ?auto_147860 ) ) ( not ( = ?auto_147857 ?auto_147861 ) ) ( not ( = ?auto_147857 ?auto_147862 ) ) ( not ( = ?auto_147857 ?auto_147863 ) ) ( not ( = ?auto_147858 ?auto_147859 ) ) ( not ( = ?auto_147858 ?auto_147860 ) ) ( not ( = ?auto_147858 ?auto_147861 ) ) ( not ( = ?auto_147858 ?auto_147862 ) ) ( not ( = ?auto_147858 ?auto_147863 ) ) ( not ( = ?auto_147859 ?auto_147860 ) ) ( not ( = ?auto_147859 ?auto_147861 ) ) ( not ( = ?auto_147859 ?auto_147862 ) ) ( not ( = ?auto_147859 ?auto_147863 ) ) ( not ( = ?auto_147860 ?auto_147861 ) ) ( not ( = ?auto_147860 ?auto_147862 ) ) ( not ( = ?auto_147860 ?auto_147863 ) ) ( not ( = ?auto_147861 ?auto_147862 ) ) ( not ( = ?auto_147861 ?auto_147863 ) ) ( not ( = ?auto_147862 ?auto_147863 ) ) ( ON ?auto_147862 ?auto_147863 ) ( ON ?auto_147861 ?auto_147862 ) ( ON ?auto_147860 ?auto_147861 ) ( ON ?auto_147859 ?auto_147860 ) ( ON ?auto_147858 ?auto_147859 ) ( ON ?auto_147857 ?auto_147858 ) ( ON ?auto_147856 ?auto_147857 ) ( ON ?auto_147855 ?auto_147856 ) ( CLEAR ?auto_147853 ) ( ON ?auto_147854 ?auto_147855 ) ( CLEAR ?auto_147854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147853 ?auto_147854 )
      ( MAKE-11PILE ?auto_147853 ?auto_147854 ?auto_147855 ?auto_147856 ?auto_147857 ?auto_147858 ?auto_147859 ?auto_147860 ?auto_147861 ?auto_147862 ?auto_147863 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147875 - BLOCK
      ?auto_147876 - BLOCK
      ?auto_147877 - BLOCK
      ?auto_147878 - BLOCK
      ?auto_147879 - BLOCK
      ?auto_147880 - BLOCK
      ?auto_147881 - BLOCK
      ?auto_147882 - BLOCK
      ?auto_147883 - BLOCK
      ?auto_147884 - BLOCK
      ?auto_147885 - BLOCK
    )
    :vars
    (
      ?auto_147886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147885 ?auto_147886 ) ( not ( = ?auto_147875 ?auto_147876 ) ) ( not ( = ?auto_147875 ?auto_147877 ) ) ( not ( = ?auto_147875 ?auto_147878 ) ) ( not ( = ?auto_147875 ?auto_147879 ) ) ( not ( = ?auto_147875 ?auto_147880 ) ) ( not ( = ?auto_147875 ?auto_147881 ) ) ( not ( = ?auto_147875 ?auto_147882 ) ) ( not ( = ?auto_147875 ?auto_147883 ) ) ( not ( = ?auto_147875 ?auto_147884 ) ) ( not ( = ?auto_147875 ?auto_147885 ) ) ( not ( = ?auto_147875 ?auto_147886 ) ) ( not ( = ?auto_147876 ?auto_147877 ) ) ( not ( = ?auto_147876 ?auto_147878 ) ) ( not ( = ?auto_147876 ?auto_147879 ) ) ( not ( = ?auto_147876 ?auto_147880 ) ) ( not ( = ?auto_147876 ?auto_147881 ) ) ( not ( = ?auto_147876 ?auto_147882 ) ) ( not ( = ?auto_147876 ?auto_147883 ) ) ( not ( = ?auto_147876 ?auto_147884 ) ) ( not ( = ?auto_147876 ?auto_147885 ) ) ( not ( = ?auto_147876 ?auto_147886 ) ) ( not ( = ?auto_147877 ?auto_147878 ) ) ( not ( = ?auto_147877 ?auto_147879 ) ) ( not ( = ?auto_147877 ?auto_147880 ) ) ( not ( = ?auto_147877 ?auto_147881 ) ) ( not ( = ?auto_147877 ?auto_147882 ) ) ( not ( = ?auto_147877 ?auto_147883 ) ) ( not ( = ?auto_147877 ?auto_147884 ) ) ( not ( = ?auto_147877 ?auto_147885 ) ) ( not ( = ?auto_147877 ?auto_147886 ) ) ( not ( = ?auto_147878 ?auto_147879 ) ) ( not ( = ?auto_147878 ?auto_147880 ) ) ( not ( = ?auto_147878 ?auto_147881 ) ) ( not ( = ?auto_147878 ?auto_147882 ) ) ( not ( = ?auto_147878 ?auto_147883 ) ) ( not ( = ?auto_147878 ?auto_147884 ) ) ( not ( = ?auto_147878 ?auto_147885 ) ) ( not ( = ?auto_147878 ?auto_147886 ) ) ( not ( = ?auto_147879 ?auto_147880 ) ) ( not ( = ?auto_147879 ?auto_147881 ) ) ( not ( = ?auto_147879 ?auto_147882 ) ) ( not ( = ?auto_147879 ?auto_147883 ) ) ( not ( = ?auto_147879 ?auto_147884 ) ) ( not ( = ?auto_147879 ?auto_147885 ) ) ( not ( = ?auto_147879 ?auto_147886 ) ) ( not ( = ?auto_147880 ?auto_147881 ) ) ( not ( = ?auto_147880 ?auto_147882 ) ) ( not ( = ?auto_147880 ?auto_147883 ) ) ( not ( = ?auto_147880 ?auto_147884 ) ) ( not ( = ?auto_147880 ?auto_147885 ) ) ( not ( = ?auto_147880 ?auto_147886 ) ) ( not ( = ?auto_147881 ?auto_147882 ) ) ( not ( = ?auto_147881 ?auto_147883 ) ) ( not ( = ?auto_147881 ?auto_147884 ) ) ( not ( = ?auto_147881 ?auto_147885 ) ) ( not ( = ?auto_147881 ?auto_147886 ) ) ( not ( = ?auto_147882 ?auto_147883 ) ) ( not ( = ?auto_147882 ?auto_147884 ) ) ( not ( = ?auto_147882 ?auto_147885 ) ) ( not ( = ?auto_147882 ?auto_147886 ) ) ( not ( = ?auto_147883 ?auto_147884 ) ) ( not ( = ?auto_147883 ?auto_147885 ) ) ( not ( = ?auto_147883 ?auto_147886 ) ) ( not ( = ?auto_147884 ?auto_147885 ) ) ( not ( = ?auto_147884 ?auto_147886 ) ) ( not ( = ?auto_147885 ?auto_147886 ) ) ( ON ?auto_147884 ?auto_147885 ) ( ON ?auto_147883 ?auto_147884 ) ( ON ?auto_147882 ?auto_147883 ) ( ON ?auto_147881 ?auto_147882 ) ( ON ?auto_147880 ?auto_147881 ) ( ON ?auto_147879 ?auto_147880 ) ( ON ?auto_147878 ?auto_147879 ) ( ON ?auto_147877 ?auto_147878 ) ( ON ?auto_147876 ?auto_147877 ) ( ON ?auto_147875 ?auto_147876 ) ( CLEAR ?auto_147875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147875 )
      ( MAKE-11PILE ?auto_147875 ?auto_147876 ?auto_147877 ?auto_147878 ?auto_147879 ?auto_147880 ?auto_147881 ?auto_147882 ?auto_147883 ?auto_147884 ?auto_147885 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147898 - BLOCK
      ?auto_147899 - BLOCK
      ?auto_147900 - BLOCK
      ?auto_147901 - BLOCK
      ?auto_147902 - BLOCK
      ?auto_147903 - BLOCK
      ?auto_147904 - BLOCK
      ?auto_147905 - BLOCK
      ?auto_147906 - BLOCK
      ?auto_147907 - BLOCK
      ?auto_147908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147908 ) ( not ( = ?auto_147898 ?auto_147899 ) ) ( not ( = ?auto_147898 ?auto_147900 ) ) ( not ( = ?auto_147898 ?auto_147901 ) ) ( not ( = ?auto_147898 ?auto_147902 ) ) ( not ( = ?auto_147898 ?auto_147903 ) ) ( not ( = ?auto_147898 ?auto_147904 ) ) ( not ( = ?auto_147898 ?auto_147905 ) ) ( not ( = ?auto_147898 ?auto_147906 ) ) ( not ( = ?auto_147898 ?auto_147907 ) ) ( not ( = ?auto_147898 ?auto_147908 ) ) ( not ( = ?auto_147899 ?auto_147900 ) ) ( not ( = ?auto_147899 ?auto_147901 ) ) ( not ( = ?auto_147899 ?auto_147902 ) ) ( not ( = ?auto_147899 ?auto_147903 ) ) ( not ( = ?auto_147899 ?auto_147904 ) ) ( not ( = ?auto_147899 ?auto_147905 ) ) ( not ( = ?auto_147899 ?auto_147906 ) ) ( not ( = ?auto_147899 ?auto_147907 ) ) ( not ( = ?auto_147899 ?auto_147908 ) ) ( not ( = ?auto_147900 ?auto_147901 ) ) ( not ( = ?auto_147900 ?auto_147902 ) ) ( not ( = ?auto_147900 ?auto_147903 ) ) ( not ( = ?auto_147900 ?auto_147904 ) ) ( not ( = ?auto_147900 ?auto_147905 ) ) ( not ( = ?auto_147900 ?auto_147906 ) ) ( not ( = ?auto_147900 ?auto_147907 ) ) ( not ( = ?auto_147900 ?auto_147908 ) ) ( not ( = ?auto_147901 ?auto_147902 ) ) ( not ( = ?auto_147901 ?auto_147903 ) ) ( not ( = ?auto_147901 ?auto_147904 ) ) ( not ( = ?auto_147901 ?auto_147905 ) ) ( not ( = ?auto_147901 ?auto_147906 ) ) ( not ( = ?auto_147901 ?auto_147907 ) ) ( not ( = ?auto_147901 ?auto_147908 ) ) ( not ( = ?auto_147902 ?auto_147903 ) ) ( not ( = ?auto_147902 ?auto_147904 ) ) ( not ( = ?auto_147902 ?auto_147905 ) ) ( not ( = ?auto_147902 ?auto_147906 ) ) ( not ( = ?auto_147902 ?auto_147907 ) ) ( not ( = ?auto_147902 ?auto_147908 ) ) ( not ( = ?auto_147903 ?auto_147904 ) ) ( not ( = ?auto_147903 ?auto_147905 ) ) ( not ( = ?auto_147903 ?auto_147906 ) ) ( not ( = ?auto_147903 ?auto_147907 ) ) ( not ( = ?auto_147903 ?auto_147908 ) ) ( not ( = ?auto_147904 ?auto_147905 ) ) ( not ( = ?auto_147904 ?auto_147906 ) ) ( not ( = ?auto_147904 ?auto_147907 ) ) ( not ( = ?auto_147904 ?auto_147908 ) ) ( not ( = ?auto_147905 ?auto_147906 ) ) ( not ( = ?auto_147905 ?auto_147907 ) ) ( not ( = ?auto_147905 ?auto_147908 ) ) ( not ( = ?auto_147906 ?auto_147907 ) ) ( not ( = ?auto_147906 ?auto_147908 ) ) ( not ( = ?auto_147907 ?auto_147908 ) ) ( ON ?auto_147907 ?auto_147908 ) ( ON ?auto_147906 ?auto_147907 ) ( ON ?auto_147905 ?auto_147906 ) ( ON ?auto_147904 ?auto_147905 ) ( ON ?auto_147903 ?auto_147904 ) ( ON ?auto_147902 ?auto_147903 ) ( ON ?auto_147901 ?auto_147902 ) ( ON ?auto_147900 ?auto_147901 ) ( ON ?auto_147899 ?auto_147900 ) ( ON ?auto_147898 ?auto_147899 ) ( CLEAR ?auto_147898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147898 )
      ( MAKE-11PILE ?auto_147898 ?auto_147899 ?auto_147900 ?auto_147901 ?auto_147902 ?auto_147903 ?auto_147904 ?auto_147905 ?auto_147906 ?auto_147907 ?auto_147908 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_147920 - BLOCK
      ?auto_147921 - BLOCK
      ?auto_147922 - BLOCK
      ?auto_147923 - BLOCK
      ?auto_147924 - BLOCK
      ?auto_147925 - BLOCK
      ?auto_147926 - BLOCK
      ?auto_147927 - BLOCK
      ?auto_147928 - BLOCK
      ?auto_147929 - BLOCK
      ?auto_147930 - BLOCK
    )
    :vars
    (
      ?auto_147931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147920 ?auto_147921 ) ) ( not ( = ?auto_147920 ?auto_147922 ) ) ( not ( = ?auto_147920 ?auto_147923 ) ) ( not ( = ?auto_147920 ?auto_147924 ) ) ( not ( = ?auto_147920 ?auto_147925 ) ) ( not ( = ?auto_147920 ?auto_147926 ) ) ( not ( = ?auto_147920 ?auto_147927 ) ) ( not ( = ?auto_147920 ?auto_147928 ) ) ( not ( = ?auto_147920 ?auto_147929 ) ) ( not ( = ?auto_147920 ?auto_147930 ) ) ( not ( = ?auto_147921 ?auto_147922 ) ) ( not ( = ?auto_147921 ?auto_147923 ) ) ( not ( = ?auto_147921 ?auto_147924 ) ) ( not ( = ?auto_147921 ?auto_147925 ) ) ( not ( = ?auto_147921 ?auto_147926 ) ) ( not ( = ?auto_147921 ?auto_147927 ) ) ( not ( = ?auto_147921 ?auto_147928 ) ) ( not ( = ?auto_147921 ?auto_147929 ) ) ( not ( = ?auto_147921 ?auto_147930 ) ) ( not ( = ?auto_147922 ?auto_147923 ) ) ( not ( = ?auto_147922 ?auto_147924 ) ) ( not ( = ?auto_147922 ?auto_147925 ) ) ( not ( = ?auto_147922 ?auto_147926 ) ) ( not ( = ?auto_147922 ?auto_147927 ) ) ( not ( = ?auto_147922 ?auto_147928 ) ) ( not ( = ?auto_147922 ?auto_147929 ) ) ( not ( = ?auto_147922 ?auto_147930 ) ) ( not ( = ?auto_147923 ?auto_147924 ) ) ( not ( = ?auto_147923 ?auto_147925 ) ) ( not ( = ?auto_147923 ?auto_147926 ) ) ( not ( = ?auto_147923 ?auto_147927 ) ) ( not ( = ?auto_147923 ?auto_147928 ) ) ( not ( = ?auto_147923 ?auto_147929 ) ) ( not ( = ?auto_147923 ?auto_147930 ) ) ( not ( = ?auto_147924 ?auto_147925 ) ) ( not ( = ?auto_147924 ?auto_147926 ) ) ( not ( = ?auto_147924 ?auto_147927 ) ) ( not ( = ?auto_147924 ?auto_147928 ) ) ( not ( = ?auto_147924 ?auto_147929 ) ) ( not ( = ?auto_147924 ?auto_147930 ) ) ( not ( = ?auto_147925 ?auto_147926 ) ) ( not ( = ?auto_147925 ?auto_147927 ) ) ( not ( = ?auto_147925 ?auto_147928 ) ) ( not ( = ?auto_147925 ?auto_147929 ) ) ( not ( = ?auto_147925 ?auto_147930 ) ) ( not ( = ?auto_147926 ?auto_147927 ) ) ( not ( = ?auto_147926 ?auto_147928 ) ) ( not ( = ?auto_147926 ?auto_147929 ) ) ( not ( = ?auto_147926 ?auto_147930 ) ) ( not ( = ?auto_147927 ?auto_147928 ) ) ( not ( = ?auto_147927 ?auto_147929 ) ) ( not ( = ?auto_147927 ?auto_147930 ) ) ( not ( = ?auto_147928 ?auto_147929 ) ) ( not ( = ?auto_147928 ?auto_147930 ) ) ( not ( = ?auto_147929 ?auto_147930 ) ) ( ON ?auto_147920 ?auto_147931 ) ( not ( = ?auto_147930 ?auto_147931 ) ) ( not ( = ?auto_147929 ?auto_147931 ) ) ( not ( = ?auto_147928 ?auto_147931 ) ) ( not ( = ?auto_147927 ?auto_147931 ) ) ( not ( = ?auto_147926 ?auto_147931 ) ) ( not ( = ?auto_147925 ?auto_147931 ) ) ( not ( = ?auto_147924 ?auto_147931 ) ) ( not ( = ?auto_147923 ?auto_147931 ) ) ( not ( = ?auto_147922 ?auto_147931 ) ) ( not ( = ?auto_147921 ?auto_147931 ) ) ( not ( = ?auto_147920 ?auto_147931 ) ) ( ON ?auto_147921 ?auto_147920 ) ( ON ?auto_147922 ?auto_147921 ) ( ON ?auto_147923 ?auto_147922 ) ( ON ?auto_147924 ?auto_147923 ) ( ON ?auto_147925 ?auto_147924 ) ( ON ?auto_147926 ?auto_147925 ) ( ON ?auto_147927 ?auto_147926 ) ( ON ?auto_147928 ?auto_147927 ) ( ON ?auto_147929 ?auto_147928 ) ( ON ?auto_147930 ?auto_147929 ) ( CLEAR ?auto_147930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_147930 ?auto_147929 ?auto_147928 ?auto_147927 ?auto_147926 ?auto_147925 ?auto_147924 ?auto_147923 ?auto_147922 ?auto_147921 ?auto_147920 )
      ( MAKE-11PILE ?auto_147920 ?auto_147921 ?auto_147922 ?auto_147923 ?auto_147924 ?auto_147925 ?auto_147926 ?auto_147927 ?auto_147928 ?auto_147929 ?auto_147930 ) )
  )

)

