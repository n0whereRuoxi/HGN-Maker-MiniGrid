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
      ?auto_25789 - BLOCK
    )
    :vars
    (
      ?auto_25790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25789 ?auto_25790 ) ( CLEAR ?auto_25789 ) ( HAND-EMPTY ) ( not ( = ?auto_25789 ?auto_25790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25789 ?auto_25790 )
      ( !PUTDOWN ?auto_25789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_25792 - BLOCK
    )
    :vars
    (
      ?auto_25793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25792 ?auto_25793 ) ( CLEAR ?auto_25792 ) ( HAND-EMPTY ) ( not ( = ?auto_25792 ?auto_25793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25792 ?auto_25793 )
      ( !PUTDOWN ?auto_25792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25796 - BLOCK
      ?auto_25797 - BLOCK
    )
    :vars
    (
      ?auto_25798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25796 ) ( ON ?auto_25797 ?auto_25798 ) ( CLEAR ?auto_25797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25796 ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( not ( = ?auto_25796 ?auto_25798 ) ) ( not ( = ?auto_25797 ?auto_25798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25797 ?auto_25798 )
      ( !STACK ?auto_25797 ?auto_25796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25801 - BLOCK
      ?auto_25802 - BLOCK
    )
    :vars
    (
      ?auto_25803 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25801 ) ( ON ?auto_25802 ?auto_25803 ) ( CLEAR ?auto_25802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25801 ) ( not ( = ?auto_25801 ?auto_25802 ) ) ( not ( = ?auto_25801 ?auto_25803 ) ) ( not ( = ?auto_25802 ?auto_25803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25802 ?auto_25803 )
      ( !STACK ?auto_25802 ?auto_25801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25806 - BLOCK
      ?auto_25807 - BLOCK
    )
    :vars
    (
      ?auto_25808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25807 ?auto_25808 ) ( not ( = ?auto_25806 ?auto_25807 ) ) ( not ( = ?auto_25806 ?auto_25808 ) ) ( not ( = ?auto_25807 ?auto_25808 ) ) ( ON ?auto_25806 ?auto_25807 ) ( CLEAR ?auto_25806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25806 )
      ( MAKE-2PILE ?auto_25806 ?auto_25807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25811 - BLOCK
      ?auto_25812 - BLOCK
    )
    :vars
    (
      ?auto_25813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25812 ?auto_25813 ) ( not ( = ?auto_25811 ?auto_25812 ) ) ( not ( = ?auto_25811 ?auto_25813 ) ) ( not ( = ?auto_25812 ?auto_25813 ) ) ( ON ?auto_25811 ?auto_25812 ) ( CLEAR ?auto_25811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25811 )
      ( MAKE-2PILE ?auto_25811 ?auto_25812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25817 - BLOCK
      ?auto_25818 - BLOCK
      ?auto_25819 - BLOCK
    )
    :vars
    (
      ?auto_25820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25818 ) ( ON ?auto_25819 ?auto_25820 ) ( CLEAR ?auto_25819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25817 ) ( ON ?auto_25818 ?auto_25817 ) ( not ( = ?auto_25817 ?auto_25818 ) ) ( not ( = ?auto_25817 ?auto_25819 ) ) ( not ( = ?auto_25817 ?auto_25820 ) ) ( not ( = ?auto_25818 ?auto_25819 ) ) ( not ( = ?auto_25818 ?auto_25820 ) ) ( not ( = ?auto_25819 ?auto_25820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25819 ?auto_25820 )
      ( !STACK ?auto_25819 ?auto_25818 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25824 - BLOCK
      ?auto_25825 - BLOCK
      ?auto_25826 - BLOCK
    )
    :vars
    (
      ?auto_25827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25825 ) ( ON ?auto_25826 ?auto_25827 ) ( CLEAR ?auto_25826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25824 ) ( ON ?auto_25825 ?auto_25824 ) ( not ( = ?auto_25824 ?auto_25825 ) ) ( not ( = ?auto_25824 ?auto_25826 ) ) ( not ( = ?auto_25824 ?auto_25827 ) ) ( not ( = ?auto_25825 ?auto_25826 ) ) ( not ( = ?auto_25825 ?auto_25827 ) ) ( not ( = ?auto_25826 ?auto_25827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25826 ?auto_25827 )
      ( !STACK ?auto_25826 ?auto_25825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25831 - BLOCK
      ?auto_25832 - BLOCK
      ?auto_25833 - BLOCK
    )
    :vars
    (
      ?auto_25834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25833 ?auto_25834 ) ( ON-TABLE ?auto_25831 ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( not ( = ?auto_25831 ?auto_25833 ) ) ( not ( = ?auto_25831 ?auto_25834 ) ) ( not ( = ?auto_25832 ?auto_25833 ) ) ( not ( = ?auto_25832 ?auto_25834 ) ) ( not ( = ?auto_25833 ?auto_25834 ) ) ( CLEAR ?auto_25831 ) ( ON ?auto_25832 ?auto_25833 ) ( CLEAR ?auto_25832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25831 ?auto_25832 )
      ( MAKE-3PILE ?auto_25831 ?auto_25832 ?auto_25833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25838 - BLOCK
      ?auto_25839 - BLOCK
      ?auto_25840 - BLOCK
    )
    :vars
    (
      ?auto_25841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25840 ?auto_25841 ) ( ON-TABLE ?auto_25838 ) ( not ( = ?auto_25838 ?auto_25839 ) ) ( not ( = ?auto_25838 ?auto_25840 ) ) ( not ( = ?auto_25838 ?auto_25841 ) ) ( not ( = ?auto_25839 ?auto_25840 ) ) ( not ( = ?auto_25839 ?auto_25841 ) ) ( not ( = ?auto_25840 ?auto_25841 ) ) ( CLEAR ?auto_25838 ) ( ON ?auto_25839 ?auto_25840 ) ( CLEAR ?auto_25839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25838 ?auto_25839 )
      ( MAKE-3PILE ?auto_25838 ?auto_25839 ?auto_25840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25845 - BLOCK
      ?auto_25846 - BLOCK
      ?auto_25847 - BLOCK
    )
    :vars
    (
      ?auto_25848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25847 ?auto_25848 ) ( not ( = ?auto_25845 ?auto_25846 ) ) ( not ( = ?auto_25845 ?auto_25847 ) ) ( not ( = ?auto_25845 ?auto_25848 ) ) ( not ( = ?auto_25846 ?auto_25847 ) ) ( not ( = ?auto_25846 ?auto_25848 ) ) ( not ( = ?auto_25847 ?auto_25848 ) ) ( ON ?auto_25846 ?auto_25847 ) ( ON ?auto_25845 ?auto_25846 ) ( CLEAR ?auto_25845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25845 )
      ( MAKE-3PILE ?auto_25845 ?auto_25846 ?auto_25847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_25852 - BLOCK
      ?auto_25853 - BLOCK
      ?auto_25854 - BLOCK
    )
    :vars
    (
      ?auto_25855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25854 ?auto_25855 ) ( not ( = ?auto_25852 ?auto_25853 ) ) ( not ( = ?auto_25852 ?auto_25854 ) ) ( not ( = ?auto_25852 ?auto_25855 ) ) ( not ( = ?auto_25853 ?auto_25854 ) ) ( not ( = ?auto_25853 ?auto_25855 ) ) ( not ( = ?auto_25854 ?auto_25855 ) ) ( ON ?auto_25853 ?auto_25854 ) ( ON ?auto_25852 ?auto_25853 ) ( CLEAR ?auto_25852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25852 )
      ( MAKE-3PILE ?auto_25852 ?auto_25853 ?auto_25854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25860 - BLOCK
      ?auto_25861 - BLOCK
      ?auto_25862 - BLOCK
      ?auto_25863 - BLOCK
    )
    :vars
    (
      ?auto_25864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25862 ) ( ON ?auto_25863 ?auto_25864 ) ( CLEAR ?auto_25863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25860 ) ( ON ?auto_25861 ?auto_25860 ) ( ON ?auto_25862 ?auto_25861 ) ( not ( = ?auto_25860 ?auto_25861 ) ) ( not ( = ?auto_25860 ?auto_25862 ) ) ( not ( = ?auto_25860 ?auto_25863 ) ) ( not ( = ?auto_25860 ?auto_25864 ) ) ( not ( = ?auto_25861 ?auto_25862 ) ) ( not ( = ?auto_25861 ?auto_25863 ) ) ( not ( = ?auto_25861 ?auto_25864 ) ) ( not ( = ?auto_25862 ?auto_25863 ) ) ( not ( = ?auto_25862 ?auto_25864 ) ) ( not ( = ?auto_25863 ?auto_25864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25863 ?auto_25864 )
      ( !STACK ?auto_25863 ?auto_25862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25869 - BLOCK
      ?auto_25870 - BLOCK
      ?auto_25871 - BLOCK
      ?auto_25872 - BLOCK
    )
    :vars
    (
      ?auto_25873 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25871 ) ( ON ?auto_25872 ?auto_25873 ) ( CLEAR ?auto_25872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25869 ) ( ON ?auto_25870 ?auto_25869 ) ( ON ?auto_25871 ?auto_25870 ) ( not ( = ?auto_25869 ?auto_25870 ) ) ( not ( = ?auto_25869 ?auto_25871 ) ) ( not ( = ?auto_25869 ?auto_25872 ) ) ( not ( = ?auto_25869 ?auto_25873 ) ) ( not ( = ?auto_25870 ?auto_25871 ) ) ( not ( = ?auto_25870 ?auto_25872 ) ) ( not ( = ?auto_25870 ?auto_25873 ) ) ( not ( = ?auto_25871 ?auto_25872 ) ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25872 ?auto_25873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25872 ?auto_25873 )
      ( !STACK ?auto_25872 ?auto_25871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25878 - BLOCK
      ?auto_25879 - BLOCK
      ?auto_25880 - BLOCK
      ?auto_25881 - BLOCK
    )
    :vars
    (
      ?auto_25882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25881 ?auto_25882 ) ( ON-TABLE ?auto_25878 ) ( ON ?auto_25879 ?auto_25878 ) ( not ( = ?auto_25878 ?auto_25879 ) ) ( not ( = ?auto_25878 ?auto_25880 ) ) ( not ( = ?auto_25878 ?auto_25881 ) ) ( not ( = ?auto_25878 ?auto_25882 ) ) ( not ( = ?auto_25879 ?auto_25880 ) ) ( not ( = ?auto_25879 ?auto_25881 ) ) ( not ( = ?auto_25879 ?auto_25882 ) ) ( not ( = ?auto_25880 ?auto_25881 ) ) ( not ( = ?auto_25880 ?auto_25882 ) ) ( not ( = ?auto_25881 ?auto_25882 ) ) ( CLEAR ?auto_25879 ) ( ON ?auto_25880 ?auto_25881 ) ( CLEAR ?auto_25880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25878 ?auto_25879 ?auto_25880 )
      ( MAKE-4PILE ?auto_25878 ?auto_25879 ?auto_25880 ?auto_25881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25887 - BLOCK
      ?auto_25888 - BLOCK
      ?auto_25889 - BLOCK
      ?auto_25890 - BLOCK
    )
    :vars
    (
      ?auto_25891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25890 ?auto_25891 ) ( ON-TABLE ?auto_25887 ) ( ON ?auto_25888 ?auto_25887 ) ( not ( = ?auto_25887 ?auto_25888 ) ) ( not ( = ?auto_25887 ?auto_25889 ) ) ( not ( = ?auto_25887 ?auto_25890 ) ) ( not ( = ?auto_25887 ?auto_25891 ) ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25890 ) ) ( not ( = ?auto_25888 ?auto_25891 ) ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25889 ?auto_25891 ) ) ( not ( = ?auto_25890 ?auto_25891 ) ) ( CLEAR ?auto_25888 ) ( ON ?auto_25889 ?auto_25890 ) ( CLEAR ?auto_25889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25887 ?auto_25888 ?auto_25889 )
      ( MAKE-4PILE ?auto_25887 ?auto_25888 ?auto_25889 ?auto_25890 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25896 - BLOCK
      ?auto_25897 - BLOCK
      ?auto_25898 - BLOCK
      ?auto_25899 - BLOCK
    )
    :vars
    (
      ?auto_25900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25899 ?auto_25900 ) ( ON-TABLE ?auto_25896 ) ( not ( = ?auto_25896 ?auto_25897 ) ) ( not ( = ?auto_25896 ?auto_25898 ) ) ( not ( = ?auto_25896 ?auto_25899 ) ) ( not ( = ?auto_25896 ?auto_25900 ) ) ( not ( = ?auto_25897 ?auto_25898 ) ) ( not ( = ?auto_25897 ?auto_25899 ) ) ( not ( = ?auto_25897 ?auto_25900 ) ) ( not ( = ?auto_25898 ?auto_25899 ) ) ( not ( = ?auto_25898 ?auto_25900 ) ) ( not ( = ?auto_25899 ?auto_25900 ) ) ( ON ?auto_25898 ?auto_25899 ) ( CLEAR ?auto_25896 ) ( ON ?auto_25897 ?auto_25898 ) ( CLEAR ?auto_25897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25896 ?auto_25897 )
      ( MAKE-4PILE ?auto_25896 ?auto_25897 ?auto_25898 ?auto_25899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25905 - BLOCK
      ?auto_25906 - BLOCK
      ?auto_25907 - BLOCK
      ?auto_25908 - BLOCK
    )
    :vars
    (
      ?auto_25909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25908 ?auto_25909 ) ( ON-TABLE ?auto_25905 ) ( not ( = ?auto_25905 ?auto_25906 ) ) ( not ( = ?auto_25905 ?auto_25907 ) ) ( not ( = ?auto_25905 ?auto_25908 ) ) ( not ( = ?auto_25905 ?auto_25909 ) ) ( not ( = ?auto_25906 ?auto_25907 ) ) ( not ( = ?auto_25906 ?auto_25908 ) ) ( not ( = ?auto_25906 ?auto_25909 ) ) ( not ( = ?auto_25907 ?auto_25908 ) ) ( not ( = ?auto_25907 ?auto_25909 ) ) ( not ( = ?auto_25908 ?auto_25909 ) ) ( ON ?auto_25907 ?auto_25908 ) ( CLEAR ?auto_25905 ) ( ON ?auto_25906 ?auto_25907 ) ( CLEAR ?auto_25906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25905 ?auto_25906 )
      ( MAKE-4PILE ?auto_25905 ?auto_25906 ?auto_25907 ?auto_25908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25914 - BLOCK
      ?auto_25915 - BLOCK
      ?auto_25916 - BLOCK
      ?auto_25917 - BLOCK
    )
    :vars
    (
      ?auto_25918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25917 ?auto_25918 ) ( not ( = ?auto_25914 ?auto_25915 ) ) ( not ( = ?auto_25914 ?auto_25916 ) ) ( not ( = ?auto_25914 ?auto_25917 ) ) ( not ( = ?auto_25914 ?auto_25918 ) ) ( not ( = ?auto_25915 ?auto_25916 ) ) ( not ( = ?auto_25915 ?auto_25917 ) ) ( not ( = ?auto_25915 ?auto_25918 ) ) ( not ( = ?auto_25916 ?auto_25917 ) ) ( not ( = ?auto_25916 ?auto_25918 ) ) ( not ( = ?auto_25917 ?auto_25918 ) ) ( ON ?auto_25916 ?auto_25917 ) ( ON ?auto_25915 ?auto_25916 ) ( ON ?auto_25914 ?auto_25915 ) ( CLEAR ?auto_25914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25914 )
      ( MAKE-4PILE ?auto_25914 ?auto_25915 ?auto_25916 ?auto_25917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_25923 - BLOCK
      ?auto_25924 - BLOCK
      ?auto_25925 - BLOCK
      ?auto_25926 - BLOCK
    )
    :vars
    (
      ?auto_25927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25926 ?auto_25927 ) ( not ( = ?auto_25923 ?auto_25924 ) ) ( not ( = ?auto_25923 ?auto_25925 ) ) ( not ( = ?auto_25923 ?auto_25926 ) ) ( not ( = ?auto_25923 ?auto_25927 ) ) ( not ( = ?auto_25924 ?auto_25925 ) ) ( not ( = ?auto_25924 ?auto_25926 ) ) ( not ( = ?auto_25924 ?auto_25927 ) ) ( not ( = ?auto_25925 ?auto_25926 ) ) ( not ( = ?auto_25925 ?auto_25927 ) ) ( not ( = ?auto_25926 ?auto_25927 ) ) ( ON ?auto_25925 ?auto_25926 ) ( ON ?auto_25924 ?auto_25925 ) ( ON ?auto_25923 ?auto_25924 ) ( CLEAR ?auto_25923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25923 )
      ( MAKE-4PILE ?auto_25923 ?auto_25924 ?auto_25925 ?auto_25926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25933 - BLOCK
      ?auto_25934 - BLOCK
      ?auto_25935 - BLOCK
      ?auto_25936 - BLOCK
      ?auto_25937 - BLOCK
    )
    :vars
    (
      ?auto_25938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25936 ) ( ON ?auto_25937 ?auto_25938 ) ( CLEAR ?auto_25937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25933 ) ( ON ?auto_25934 ?auto_25933 ) ( ON ?auto_25935 ?auto_25934 ) ( ON ?auto_25936 ?auto_25935 ) ( not ( = ?auto_25933 ?auto_25934 ) ) ( not ( = ?auto_25933 ?auto_25935 ) ) ( not ( = ?auto_25933 ?auto_25936 ) ) ( not ( = ?auto_25933 ?auto_25937 ) ) ( not ( = ?auto_25933 ?auto_25938 ) ) ( not ( = ?auto_25934 ?auto_25935 ) ) ( not ( = ?auto_25934 ?auto_25936 ) ) ( not ( = ?auto_25934 ?auto_25937 ) ) ( not ( = ?auto_25934 ?auto_25938 ) ) ( not ( = ?auto_25935 ?auto_25936 ) ) ( not ( = ?auto_25935 ?auto_25937 ) ) ( not ( = ?auto_25935 ?auto_25938 ) ) ( not ( = ?auto_25936 ?auto_25937 ) ) ( not ( = ?auto_25936 ?auto_25938 ) ) ( not ( = ?auto_25937 ?auto_25938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25937 ?auto_25938 )
      ( !STACK ?auto_25937 ?auto_25936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25944 - BLOCK
      ?auto_25945 - BLOCK
      ?auto_25946 - BLOCK
      ?auto_25947 - BLOCK
      ?auto_25948 - BLOCK
    )
    :vars
    (
      ?auto_25949 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_25947 ) ( ON ?auto_25948 ?auto_25949 ) ( CLEAR ?auto_25948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_25944 ) ( ON ?auto_25945 ?auto_25944 ) ( ON ?auto_25946 ?auto_25945 ) ( ON ?auto_25947 ?auto_25946 ) ( not ( = ?auto_25944 ?auto_25945 ) ) ( not ( = ?auto_25944 ?auto_25946 ) ) ( not ( = ?auto_25944 ?auto_25947 ) ) ( not ( = ?auto_25944 ?auto_25948 ) ) ( not ( = ?auto_25944 ?auto_25949 ) ) ( not ( = ?auto_25945 ?auto_25946 ) ) ( not ( = ?auto_25945 ?auto_25947 ) ) ( not ( = ?auto_25945 ?auto_25948 ) ) ( not ( = ?auto_25945 ?auto_25949 ) ) ( not ( = ?auto_25946 ?auto_25947 ) ) ( not ( = ?auto_25946 ?auto_25948 ) ) ( not ( = ?auto_25946 ?auto_25949 ) ) ( not ( = ?auto_25947 ?auto_25948 ) ) ( not ( = ?auto_25947 ?auto_25949 ) ) ( not ( = ?auto_25948 ?auto_25949 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_25948 ?auto_25949 )
      ( !STACK ?auto_25948 ?auto_25947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25955 - BLOCK
      ?auto_25956 - BLOCK
      ?auto_25957 - BLOCK
      ?auto_25958 - BLOCK
      ?auto_25959 - BLOCK
    )
    :vars
    (
      ?auto_25960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25959 ?auto_25960 ) ( ON-TABLE ?auto_25955 ) ( ON ?auto_25956 ?auto_25955 ) ( ON ?auto_25957 ?auto_25956 ) ( not ( = ?auto_25955 ?auto_25956 ) ) ( not ( = ?auto_25955 ?auto_25957 ) ) ( not ( = ?auto_25955 ?auto_25958 ) ) ( not ( = ?auto_25955 ?auto_25959 ) ) ( not ( = ?auto_25955 ?auto_25960 ) ) ( not ( = ?auto_25956 ?auto_25957 ) ) ( not ( = ?auto_25956 ?auto_25958 ) ) ( not ( = ?auto_25956 ?auto_25959 ) ) ( not ( = ?auto_25956 ?auto_25960 ) ) ( not ( = ?auto_25957 ?auto_25958 ) ) ( not ( = ?auto_25957 ?auto_25959 ) ) ( not ( = ?auto_25957 ?auto_25960 ) ) ( not ( = ?auto_25958 ?auto_25959 ) ) ( not ( = ?auto_25958 ?auto_25960 ) ) ( not ( = ?auto_25959 ?auto_25960 ) ) ( CLEAR ?auto_25957 ) ( ON ?auto_25958 ?auto_25959 ) ( CLEAR ?auto_25958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25955 ?auto_25956 ?auto_25957 ?auto_25958 )
      ( MAKE-5PILE ?auto_25955 ?auto_25956 ?auto_25957 ?auto_25958 ?auto_25959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25966 - BLOCK
      ?auto_25967 - BLOCK
      ?auto_25968 - BLOCK
      ?auto_25969 - BLOCK
      ?auto_25970 - BLOCK
    )
    :vars
    (
      ?auto_25971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25970 ?auto_25971 ) ( ON-TABLE ?auto_25966 ) ( ON ?auto_25967 ?auto_25966 ) ( ON ?auto_25968 ?auto_25967 ) ( not ( = ?auto_25966 ?auto_25967 ) ) ( not ( = ?auto_25966 ?auto_25968 ) ) ( not ( = ?auto_25966 ?auto_25969 ) ) ( not ( = ?auto_25966 ?auto_25970 ) ) ( not ( = ?auto_25966 ?auto_25971 ) ) ( not ( = ?auto_25967 ?auto_25968 ) ) ( not ( = ?auto_25967 ?auto_25969 ) ) ( not ( = ?auto_25967 ?auto_25970 ) ) ( not ( = ?auto_25967 ?auto_25971 ) ) ( not ( = ?auto_25968 ?auto_25969 ) ) ( not ( = ?auto_25968 ?auto_25970 ) ) ( not ( = ?auto_25968 ?auto_25971 ) ) ( not ( = ?auto_25969 ?auto_25970 ) ) ( not ( = ?auto_25969 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25971 ) ) ( CLEAR ?auto_25968 ) ( ON ?auto_25969 ?auto_25970 ) ( CLEAR ?auto_25969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_25966 ?auto_25967 ?auto_25968 ?auto_25969 )
      ( MAKE-5PILE ?auto_25966 ?auto_25967 ?auto_25968 ?auto_25969 ?auto_25970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25977 - BLOCK
      ?auto_25978 - BLOCK
      ?auto_25979 - BLOCK
      ?auto_25980 - BLOCK
      ?auto_25981 - BLOCK
    )
    :vars
    (
      ?auto_25982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25981 ?auto_25982 ) ( ON-TABLE ?auto_25977 ) ( ON ?auto_25978 ?auto_25977 ) ( not ( = ?auto_25977 ?auto_25978 ) ) ( not ( = ?auto_25977 ?auto_25979 ) ) ( not ( = ?auto_25977 ?auto_25980 ) ) ( not ( = ?auto_25977 ?auto_25981 ) ) ( not ( = ?auto_25977 ?auto_25982 ) ) ( not ( = ?auto_25978 ?auto_25979 ) ) ( not ( = ?auto_25978 ?auto_25980 ) ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25978 ?auto_25982 ) ) ( not ( = ?auto_25979 ?auto_25980 ) ) ( not ( = ?auto_25979 ?auto_25981 ) ) ( not ( = ?auto_25979 ?auto_25982 ) ) ( not ( = ?auto_25980 ?auto_25981 ) ) ( not ( = ?auto_25980 ?auto_25982 ) ) ( not ( = ?auto_25981 ?auto_25982 ) ) ( ON ?auto_25980 ?auto_25981 ) ( CLEAR ?auto_25978 ) ( ON ?auto_25979 ?auto_25980 ) ( CLEAR ?auto_25979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25977 ?auto_25978 ?auto_25979 )
      ( MAKE-5PILE ?auto_25977 ?auto_25978 ?auto_25979 ?auto_25980 ?auto_25981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25988 - BLOCK
      ?auto_25989 - BLOCK
      ?auto_25990 - BLOCK
      ?auto_25991 - BLOCK
      ?auto_25992 - BLOCK
    )
    :vars
    (
      ?auto_25993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_25992 ?auto_25993 ) ( ON-TABLE ?auto_25988 ) ( ON ?auto_25989 ?auto_25988 ) ( not ( = ?auto_25988 ?auto_25989 ) ) ( not ( = ?auto_25988 ?auto_25990 ) ) ( not ( = ?auto_25988 ?auto_25991 ) ) ( not ( = ?auto_25988 ?auto_25992 ) ) ( not ( = ?auto_25988 ?auto_25993 ) ) ( not ( = ?auto_25989 ?auto_25990 ) ) ( not ( = ?auto_25989 ?auto_25991 ) ) ( not ( = ?auto_25989 ?auto_25992 ) ) ( not ( = ?auto_25989 ?auto_25993 ) ) ( not ( = ?auto_25990 ?auto_25991 ) ) ( not ( = ?auto_25990 ?auto_25992 ) ) ( not ( = ?auto_25990 ?auto_25993 ) ) ( not ( = ?auto_25991 ?auto_25992 ) ) ( not ( = ?auto_25991 ?auto_25993 ) ) ( not ( = ?auto_25992 ?auto_25993 ) ) ( ON ?auto_25991 ?auto_25992 ) ( CLEAR ?auto_25989 ) ( ON ?auto_25990 ?auto_25991 ) ( CLEAR ?auto_25990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_25988 ?auto_25989 ?auto_25990 )
      ( MAKE-5PILE ?auto_25988 ?auto_25989 ?auto_25990 ?auto_25991 ?auto_25992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_25999 - BLOCK
      ?auto_26000 - BLOCK
      ?auto_26001 - BLOCK
      ?auto_26002 - BLOCK
      ?auto_26003 - BLOCK
    )
    :vars
    (
      ?auto_26004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26003 ?auto_26004 ) ( ON-TABLE ?auto_25999 ) ( not ( = ?auto_25999 ?auto_26000 ) ) ( not ( = ?auto_25999 ?auto_26001 ) ) ( not ( = ?auto_25999 ?auto_26002 ) ) ( not ( = ?auto_25999 ?auto_26003 ) ) ( not ( = ?auto_25999 ?auto_26004 ) ) ( not ( = ?auto_26000 ?auto_26001 ) ) ( not ( = ?auto_26000 ?auto_26002 ) ) ( not ( = ?auto_26000 ?auto_26003 ) ) ( not ( = ?auto_26000 ?auto_26004 ) ) ( not ( = ?auto_26001 ?auto_26002 ) ) ( not ( = ?auto_26001 ?auto_26003 ) ) ( not ( = ?auto_26001 ?auto_26004 ) ) ( not ( = ?auto_26002 ?auto_26003 ) ) ( not ( = ?auto_26002 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( ON ?auto_26002 ?auto_26003 ) ( ON ?auto_26001 ?auto_26002 ) ( CLEAR ?auto_25999 ) ( ON ?auto_26000 ?auto_26001 ) ( CLEAR ?auto_26000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_25999 ?auto_26000 )
      ( MAKE-5PILE ?auto_25999 ?auto_26000 ?auto_26001 ?auto_26002 ?auto_26003 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26010 - BLOCK
      ?auto_26011 - BLOCK
      ?auto_26012 - BLOCK
      ?auto_26013 - BLOCK
      ?auto_26014 - BLOCK
    )
    :vars
    (
      ?auto_26015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26014 ?auto_26015 ) ( ON-TABLE ?auto_26010 ) ( not ( = ?auto_26010 ?auto_26011 ) ) ( not ( = ?auto_26010 ?auto_26012 ) ) ( not ( = ?auto_26010 ?auto_26013 ) ) ( not ( = ?auto_26010 ?auto_26014 ) ) ( not ( = ?auto_26010 ?auto_26015 ) ) ( not ( = ?auto_26011 ?auto_26012 ) ) ( not ( = ?auto_26011 ?auto_26013 ) ) ( not ( = ?auto_26011 ?auto_26014 ) ) ( not ( = ?auto_26011 ?auto_26015 ) ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( not ( = ?auto_26012 ?auto_26014 ) ) ( not ( = ?auto_26012 ?auto_26015 ) ) ( not ( = ?auto_26013 ?auto_26014 ) ) ( not ( = ?auto_26013 ?auto_26015 ) ) ( not ( = ?auto_26014 ?auto_26015 ) ) ( ON ?auto_26013 ?auto_26014 ) ( ON ?auto_26012 ?auto_26013 ) ( CLEAR ?auto_26010 ) ( ON ?auto_26011 ?auto_26012 ) ( CLEAR ?auto_26011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26010 ?auto_26011 )
      ( MAKE-5PILE ?auto_26010 ?auto_26011 ?auto_26012 ?auto_26013 ?auto_26014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26021 - BLOCK
      ?auto_26022 - BLOCK
      ?auto_26023 - BLOCK
      ?auto_26024 - BLOCK
      ?auto_26025 - BLOCK
    )
    :vars
    (
      ?auto_26026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26025 ?auto_26026 ) ( not ( = ?auto_26021 ?auto_26022 ) ) ( not ( = ?auto_26021 ?auto_26023 ) ) ( not ( = ?auto_26021 ?auto_26024 ) ) ( not ( = ?auto_26021 ?auto_26025 ) ) ( not ( = ?auto_26021 ?auto_26026 ) ) ( not ( = ?auto_26022 ?auto_26023 ) ) ( not ( = ?auto_26022 ?auto_26024 ) ) ( not ( = ?auto_26022 ?auto_26025 ) ) ( not ( = ?auto_26022 ?auto_26026 ) ) ( not ( = ?auto_26023 ?auto_26024 ) ) ( not ( = ?auto_26023 ?auto_26025 ) ) ( not ( = ?auto_26023 ?auto_26026 ) ) ( not ( = ?auto_26024 ?auto_26025 ) ) ( not ( = ?auto_26024 ?auto_26026 ) ) ( not ( = ?auto_26025 ?auto_26026 ) ) ( ON ?auto_26024 ?auto_26025 ) ( ON ?auto_26023 ?auto_26024 ) ( ON ?auto_26022 ?auto_26023 ) ( ON ?auto_26021 ?auto_26022 ) ( CLEAR ?auto_26021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26021 )
      ( MAKE-5PILE ?auto_26021 ?auto_26022 ?auto_26023 ?auto_26024 ?auto_26025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26032 - BLOCK
      ?auto_26033 - BLOCK
      ?auto_26034 - BLOCK
      ?auto_26035 - BLOCK
      ?auto_26036 - BLOCK
    )
    :vars
    (
      ?auto_26037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26036 ?auto_26037 ) ( not ( = ?auto_26032 ?auto_26033 ) ) ( not ( = ?auto_26032 ?auto_26034 ) ) ( not ( = ?auto_26032 ?auto_26035 ) ) ( not ( = ?auto_26032 ?auto_26036 ) ) ( not ( = ?auto_26032 ?auto_26037 ) ) ( not ( = ?auto_26033 ?auto_26034 ) ) ( not ( = ?auto_26033 ?auto_26035 ) ) ( not ( = ?auto_26033 ?auto_26036 ) ) ( not ( = ?auto_26033 ?auto_26037 ) ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26037 ) ) ( not ( = ?auto_26035 ?auto_26036 ) ) ( not ( = ?auto_26035 ?auto_26037 ) ) ( not ( = ?auto_26036 ?auto_26037 ) ) ( ON ?auto_26035 ?auto_26036 ) ( ON ?auto_26034 ?auto_26035 ) ( ON ?auto_26033 ?auto_26034 ) ( ON ?auto_26032 ?auto_26033 ) ( CLEAR ?auto_26032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26032 )
      ( MAKE-5PILE ?auto_26032 ?auto_26033 ?auto_26034 ?auto_26035 ?auto_26036 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26044 - BLOCK
      ?auto_26045 - BLOCK
      ?auto_26046 - BLOCK
      ?auto_26047 - BLOCK
      ?auto_26048 - BLOCK
      ?auto_26049 - BLOCK
    )
    :vars
    (
      ?auto_26050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26048 ) ( ON ?auto_26049 ?auto_26050 ) ( CLEAR ?auto_26049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26044 ) ( ON ?auto_26045 ?auto_26044 ) ( ON ?auto_26046 ?auto_26045 ) ( ON ?auto_26047 ?auto_26046 ) ( ON ?auto_26048 ?auto_26047 ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26044 ?auto_26048 ) ) ( not ( = ?auto_26044 ?auto_26049 ) ) ( not ( = ?auto_26044 ?auto_26050 ) ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26048 ) ) ( not ( = ?auto_26045 ?auto_26049 ) ) ( not ( = ?auto_26045 ?auto_26050 ) ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( not ( = ?auto_26046 ?auto_26049 ) ) ( not ( = ?auto_26046 ?auto_26050 ) ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( not ( = ?auto_26047 ?auto_26049 ) ) ( not ( = ?auto_26047 ?auto_26050 ) ) ( not ( = ?auto_26048 ?auto_26049 ) ) ( not ( = ?auto_26048 ?auto_26050 ) ) ( not ( = ?auto_26049 ?auto_26050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26049 ?auto_26050 )
      ( !STACK ?auto_26049 ?auto_26048 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26057 - BLOCK
      ?auto_26058 - BLOCK
      ?auto_26059 - BLOCK
      ?auto_26060 - BLOCK
      ?auto_26061 - BLOCK
      ?auto_26062 - BLOCK
    )
    :vars
    (
      ?auto_26063 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26061 ) ( ON ?auto_26062 ?auto_26063 ) ( CLEAR ?auto_26062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26057 ) ( ON ?auto_26058 ?auto_26057 ) ( ON ?auto_26059 ?auto_26058 ) ( ON ?auto_26060 ?auto_26059 ) ( ON ?auto_26061 ?auto_26060 ) ( not ( = ?auto_26057 ?auto_26058 ) ) ( not ( = ?auto_26057 ?auto_26059 ) ) ( not ( = ?auto_26057 ?auto_26060 ) ) ( not ( = ?auto_26057 ?auto_26061 ) ) ( not ( = ?auto_26057 ?auto_26062 ) ) ( not ( = ?auto_26057 ?auto_26063 ) ) ( not ( = ?auto_26058 ?auto_26059 ) ) ( not ( = ?auto_26058 ?auto_26060 ) ) ( not ( = ?auto_26058 ?auto_26061 ) ) ( not ( = ?auto_26058 ?auto_26062 ) ) ( not ( = ?auto_26058 ?auto_26063 ) ) ( not ( = ?auto_26059 ?auto_26060 ) ) ( not ( = ?auto_26059 ?auto_26061 ) ) ( not ( = ?auto_26059 ?auto_26062 ) ) ( not ( = ?auto_26059 ?auto_26063 ) ) ( not ( = ?auto_26060 ?auto_26061 ) ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( not ( = ?auto_26060 ?auto_26063 ) ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26063 ) ) ( not ( = ?auto_26062 ?auto_26063 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26062 ?auto_26063 )
      ( !STACK ?auto_26062 ?auto_26061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26070 - BLOCK
      ?auto_26071 - BLOCK
      ?auto_26072 - BLOCK
      ?auto_26073 - BLOCK
      ?auto_26074 - BLOCK
      ?auto_26075 - BLOCK
    )
    :vars
    (
      ?auto_26076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26075 ?auto_26076 ) ( ON-TABLE ?auto_26070 ) ( ON ?auto_26071 ?auto_26070 ) ( ON ?auto_26072 ?auto_26071 ) ( ON ?auto_26073 ?auto_26072 ) ( not ( = ?auto_26070 ?auto_26071 ) ) ( not ( = ?auto_26070 ?auto_26072 ) ) ( not ( = ?auto_26070 ?auto_26073 ) ) ( not ( = ?auto_26070 ?auto_26074 ) ) ( not ( = ?auto_26070 ?auto_26075 ) ) ( not ( = ?auto_26070 ?auto_26076 ) ) ( not ( = ?auto_26071 ?auto_26072 ) ) ( not ( = ?auto_26071 ?auto_26073 ) ) ( not ( = ?auto_26071 ?auto_26074 ) ) ( not ( = ?auto_26071 ?auto_26075 ) ) ( not ( = ?auto_26071 ?auto_26076 ) ) ( not ( = ?auto_26072 ?auto_26073 ) ) ( not ( = ?auto_26072 ?auto_26074 ) ) ( not ( = ?auto_26072 ?auto_26075 ) ) ( not ( = ?auto_26072 ?auto_26076 ) ) ( not ( = ?auto_26073 ?auto_26074 ) ) ( not ( = ?auto_26073 ?auto_26075 ) ) ( not ( = ?auto_26073 ?auto_26076 ) ) ( not ( = ?auto_26074 ?auto_26075 ) ) ( not ( = ?auto_26074 ?auto_26076 ) ) ( not ( = ?auto_26075 ?auto_26076 ) ) ( CLEAR ?auto_26073 ) ( ON ?auto_26074 ?auto_26075 ) ( CLEAR ?auto_26074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26070 ?auto_26071 ?auto_26072 ?auto_26073 ?auto_26074 )
      ( MAKE-6PILE ?auto_26070 ?auto_26071 ?auto_26072 ?auto_26073 ?auto_26074 ?auto_26075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26083 - BLOCK
      ?auto_26084 - BLOCK
      ?auto_26085 - BLOCK
      ?auto_26086 - BLOCK
      ?auto_26087 - BLOCK
      ?auto_26088 - BLOCK
    )
    :vars
    (
      ?auto_26089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26088 ?auto_26089 ) ( ON-TABLE ?auto_26083 ) ( ON ?auto_26084 ?auto_26083 ) ( ON ?auto_26085 ?auto_26084 ) ( ON ?auto_26086 ?auto_26085 ) ( not ( = ?auto_26083 ?auto_26084 ) ) ( not ( = ?auto_26083 ?auto_26085 ) ) ( not ( = ?auto_26083 ?auto_26086 ) ) ( not ( = ?auto_26083 ?auto_26087 ) ) ( not ( = ?auto_26083 ?auto_26088 ) ) ( not ( = ?auto_26083 ?auto_26089 ) ) ( not ( = ?auto_26084 ?auto_26085 ) ) ( not ( = ?auto_26084 ?auto_26086 ) ) ( not ( = ?auto_26084 ?auto_26087 ) ) ( not ( = ?auto_26084 ?auto_26088 ) ) ( not ( = ?auto_26084 ?auto_26089 ) ) ( not ( = ?auto_26085 ?auto_26086 ) ) ( not ( = ?auto_26085 ?auto_26087 ) ) ( not ( = ?auto_26085 ?auto_26088 ) ) ( not ( = ?auto_26085 ?auto_26089 ) ) ( not ( = ?auto_26086 ?auto_26087 ) ) ( not ( = ?auto_26086 ?auto_26088 ) ) ( not ( = ?auto_26086 ?auto_26089 ) ) ( not ( = ?auto_26087 ?auto_26088 ) ) ( not ( = ?auto_26087 ?auto_26089 ) ) ( not ( = ?auto_26088 ?auto_26089 ) ) ( CLEAR ?auto_26086 ) ( ON ?auto_26087 ?auto_26088 ) ( CLEAR ?auto_26087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26083 ?auto_26084 ?auto_26085 ?auto_26086 ?auto_26087 )
      ( MAKE-6PILE ?auto_26083 ?auto_26084 ?auto_26085 ?auto_26086 ?auto_26087 ?auto_26088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26096 - BLOCK
      ?auto_26097 - BLOCK
      ?auto_26098 - BLOCK
      ?auto_26099 - BLOCK
      ?auto_26100 - BLOCK
      ?auto_26101 - BLOCK
    )
    :vars
    (
      ?auto_26102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26101 ?auto_26102 ) ( ON-TABLE ?auto_26096 ) ( ON ?auto_26097 ?auto_26096 ) ( ON ?auto_26098 ?auto_26097 ) ( not ( = ?auto_26096 ?auto_26097 ) ) ( not ( = ?auto_26096 ?auto_26098 ) ) ( not ( = ?auto_26096 ?auto_26099 ) ) ( not ( = ?auto_26096 ?auto_26100 ) ) ( not ( = ?auto_26096 ?auto_26101 ) ) ( not ( = ?auto_26096 ?auto_26102 ) ) ( not ( = ?auto_26097 ?auto_26098 ) ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26097 ?auto_26100 ) ) ( not ( = ?auto_26097 ?auto_26101 ) ) ( not ( = ?auto_26097 ?auto_26102 ) ) ( not ( = ?auto_26098 ?auto_26099 ) ) ( not ( = ?auto_26098 ?auto_26100 ) ) ( not ( = ?auto_26098 ?auto_26101 ) ) ( not ( = ?auto_26098 ?auto_26102 ) ) ( not ( = ?auto_26099 ?auto_26100 ) ) ( not ( = ?auto_26099 ?auto_26101 ) ) ( not ( = ?auto_26099 ?auto_26102 ) ) ( not ( = ?auto_26100 ?auto_26101 ) ) ( not ( = ?auto_26100 ?auto_26102 ) ) ( not ( = ?auto_26101 ?auto_26102 ) ) ( ON ?auto_26100 ?auto_26101 ) ( CLEAR ?auto_26098 ) ( ON ?auto_26099 ?auto_26100 ) ( CLEAR ?auto_26099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26096 ?auto_26097 ?auto_26098 ?auto_26099 )
      ( MAKE-6PILE ?auto_26096 ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26100 ?auto_26101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26109 - BLOCK
      ?auto_26110 - BLOCK
      ?auto_26111 - BLOCK
      ?auto_26112 - BLOCK
      ?auto_26113 - BLOCK
      ?auto_26114 - BLOCK
    )
    :vars
    (
      ?auto_26115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26114 ?auto_26115 ) ( ON-TABLE ?auto_26109 ) ( ON ?auto_26110 ?auto_26109 ) ( ON ?auto_26111 ?auto_26110 ) ( not ( = ?auto_26109 ?auto_26110 ) ) ( not ( = ?auto_26109 ?auto_26111 ) ) ( not ( = ?auto_26109 ?auto_26112 ) ) ( not ( = ?auto_26109 ?auto_26113 ) ) ( not ( = ?auto_26109 ?auto_26114 ) ) ( not ( = ?auto_26109 ?auto_26115 ) ) ( not ( = ?auto_26110 ?auto_26111 ) ) ( not ( = ?auto_26110 ?auto_26112 ) ) ( not ( = ?auto_26110 ?auto_26113 ) ) ( not ( = ?auto_26110 ?auto_26114 ) ) ( not ( = ?auto_26110 ?auto_26115 ) ) ( not ( = ?auto_26111 ?auto_26112 ) ) ( not ( = ?auto_26111 ?auto_26113 ) ) ( not ( = ?auto_26111 ?auto_26114 ) ) ( not ( = ?auto_26111 ?auto_26115 ) ) ( not ( = ?auto_26112 ?auto_26113 ) ) ( not ( = ?auto_26112 ?auto_26114 ) ) ( not ( = ?auto_26112 ?auto_26115 ) ) ( not ( = ?auto_26113 ?auto_26114 ) ) ( not ( = ?auto_26113 ?auto_26115 ) ) ( not ( = ?auto_26114 ?auto_26115 ) ) ( ON ?auto_26113 ?auto_26114 ) ( CLEAR ?auto_26111 ) ( ON ?auto_26112 ?auto_26113 ) ( CLEAR ?auto_26112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26109 ?auto_26110 ?auto_26111 ?auto_26112 )
      ( MAKE-6PILE ?auto_26109 ?auto_26110 ?auto_26111 ?auto_26112 ?auto_26113 ?auto_26114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26122 - BLOCK
      ?auto_26123 - BLOCK
      ?auto_26124 - BLOCK
      ?auto_26125 - BLOCK
      ?auto_26126 - BLOCK
      ?auto_26127 - BLOCK
    )
    :vars
    (
      ?auto_26128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26127 ?auto_26128 ) ( ON-TABLE ?auto_26122 ) ( ON ?auto_26123 ?auto_26122 ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( not ( = ?auto_26122 ?auto_26124 ) ) ( not ( = ?auto_26122 ?auto_26125 ) ) ( not ( = ?auto_26122 ?auto_26126 ) ) ( not ( = ?auto_26122 ?auto_26127 ) ) ( not ( = ?auto_26122 ?auto_26128 ) ) ( not ( = ?auto_26123 ?auto_26124 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( not ( = ?auto_26123 ?auto_26126 ) ) ( not ( = ?auto_26123 ?auto_26127 ) ) ( not ( = ?auto_26123 ?auto_26128 ) ) ( not ( = ?auto_26124 ?auto_26125 ) ) ( not ( = ?auto_26124 ?auto_26126 ) ) ( not ( = ?auto_26124 ?auto_26127 ) ) ( not ( = ?auto_26124 ?auto_26128 ) ) ( not ( = ?auto_26125 ?auto_26126 ) ) ( not ( = ?auto_26125 ?auto_26127 ) ) ( not ( = ?auto_26125 ?auto_26128 ) ) ( not ( = ?auto_26126 ?auto_26127 ) ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( ON ?auto_26126 ?auto_26127 ) ( ON ?auto_26125 ?auto_26126 ) ( CLEAR ?auto_26123 ) ( ON ?auto_26124 ?auto_26125 ) ( CLEAR ?auto_26124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26122 ?auto_26123 ?auto_26124 )
      ( MAKE-6PILE ?auto_26122 ?auto_26123 ?auto_26124 ?auto_26125 ?auto_26126 ?auto_26127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26135 - BLOCK
      ?auto_26136 - BLOCK
      ?auto_26137 - BLOCK
      ?auto_26138 - BLOCK
      ?auto_26139 - BLOCK
      ?auto_26140 - BLOCK
    )
    :vars
    (
      ?auto_26141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26140 ?auto_26141 ) ( ON-TABLE ?auto_26135 ) ( ON ?auto_26136 ?auto_26135 ) ( not ( = ?auto_26135 ?auto_26136 ) ) ( not ( = ?auto_26135 ?auto_26137 ) ) ( not ( = ?auto_26135 ?auto_26138 ) ) ( not ( = ?auto_26135 ?auto_26139 ) ) ( not ( = ?auto_26135 ?auto_26140 ) ) ( not ( = ?auto_26135 ?auto_26141 ) ) ( not ( = ?auto_26136 ?auto_26137 ) ) ( not ( = ?auto_26136 ?auto_26138 ) ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( not ( = ?auto_26136 ?auto_26140 ) ) ( not ( = ?auto_26136 ?auto_26141 ) ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( not ( = ?auto_26137 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26140 ) ) ( not ( = ?auto_26137 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26138 ?auto_26140 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( ON ?auto_26139 ?auto_26140 ) ( ON ?auto_26138 ?auto_26139 ) ( CLEAR ?auto_26136 ) ( ON ?auto_26137 ?auto_26138 ) ( CLEAR ?auto_26137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26135 ?auto_26136 ?auto_26137 )
      ( MAKE-6PILE ?auto_26135 ?auto_26136 ?auto_26137 ?auto_26138 ?auto_26139 ?auto_26140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26148 - BLOCK
      ?auto_26149 - BLOCK
      ?auto_26150 - BLOCK
      ?auto_26151 - BLOCK
      ?auto_26152 - BLOCK
      ?auto_26153 - BLOCK
    )
    :vars
    (
      ?auto_26154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26153 ?auto_26154 ) ( ON-TABLE ?auto_26148 ) ( not ( = ?auto_26148 ?auto_26149 ) ) ( not ( = ?auto_26148 ?auto_26150 ) ) ( not ( = ?auto_26148 ?auto_26151 ) ) ( not ( = ?auto_26148 ?auto_26152 ) ) ( not ( = ?auto_26148 ?auto_26153 ) ) ( not ( = ?auto_26148 ?auto_26154 ) ) ( not ( = ?auto_26149 ?auto_26150 ) ) ( not ( = ?auto_26149 ?auto_26151 ) ) ( not ( = ?auto_26149 ?auto_26152 ) ) ( not ( = ?auto_26149 ?auto_26153 ) ) ( not ( = ?auto_26149 ?auto_26154 ) ) ( not ( = ?auto_26150 ?auto_26151 ) ) ( not ( = ?auto_26150 ?auto_26152 ) ) ( not ( = ?auto_26150 ?auto_26153 ) ) ( not ( = ?auto_26150 ?auto_26154 ) ) ( not ( = ?auto_26151 ?auto_26152 ) ) ( not ( = ?auto_26151 ?auto_26153 ) ) ( not ( = ?auto_26151 ?auto_26154 ) ) ( not ( = ?auto_26152 ?auto_26153 ) ) ( not ( = ?auto_26152 ?auto_26154 ) ) ( not ( = ?auto_26153 ?auto_26154 ) ) ( ON ?auto_26152 ?auto_26153 ) ( ON ?auto_26151 ?auto_26152 ) ( ON ?auto_26150 ?auto_26151 ) ( CLEAR ?auto_26148 ) ( ON ?auto_26149 ?auto_26150 ) ( CLEAR ?auto_26149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26148 ?auto_26149 )
      ( MAKE-6PILE ?auto_26148 ?auto_26149 ?auto_26150 ?auto_26151 ?auto_26152 ?auto_26153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26161 - BLOCK
      ?auto_26162 - BLOCK
      ?auto_26163 - BLOCK
      ?auto_26164 - BLOCK
      ?auto_26165 - BLOCK
      ?auto_26166 - BLOCK
    )
    :vars
    (
      ?auto_26167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26166 ?auto_26167 ) ( ON-TABLE ?auto_26161 ) ( not ( = ?auto_26161 ?auto_26162 ) ) ( not ( = ?auto_26161 ?auto_26163 ) ) ( not ( = ?auto_26161 ?auto_26164 ) ) ( not ( = ?auto_26161 ?auto_26165 ) ) ( not ( = ?auto_26161 ?auto_26166 ) ) ( not ( = ?auto_26161 ?auto_26167 ) ) ( not ( = ?auto_26162 ?auto_26163 ) ) ( not ( = ?auto_26162 ?auto_26164 ) ) ( not ( = ?auto_26162 ?auto_26165 ) ) ( not ( = ?auto_26162 ?auto_26166 ) ) ( not ( = ?auto_26162 ?auto_26167 ) ) ( not ( = ?auto_26163 ?auto_26164 ) ) ( not ( = ?auto_26163 ?auto_26165 ) ) ( not ( = ?auto_26163 ?auto_26166 ) ) ( not ( = ?auto_26163 ?auto_26167 ) ) ( not ( = ?auto_26164 ?auto_26165 ) ) ( not ( = ?auto_26164 ?auto_26166 ) ) ( not ( = ?auto_26164 ?auto_26167 ) ) ( not ( = ?auto_26165 ?auto_26166 ) ) ( not ( = ?auto_26165 ?auto_26167 ) ) ( not ( = ?auto_26166 ?auto_26167 ) ) ( ON ?auto_26165 ?auto_26166 ) ( ON ?auto_26164 ?auto_26165 ) ( ON ?auto_26163 ?auto_26164 ) ( CLEAR ?auto_26161 ) ( ON ?auto_26162 ?auto_26163 ) ( CLEAR ?auto_26162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26161 ?auto_26162 )
      ( MAKE-6PILE ?auto_26161 ?auto_26162 ?auto_26163 ?auto_26164 ?auto_26165 ?auto_26166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26174 - BLOCK
      ?auto_26175 - BLOCK
      ?auto_26176 - BLOCK
      ?auto_26177 - BLOCK
      ?auto_26178 - BLOCK
      ?auto_26179 - BLOCK
    )
    :vars
    (
      ?auto_26180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26179 ?auto_26180 ) ( not ( = ?auto_26174 ?auto_26175 ) ) ( not ( = ?auto_26174 ?auto_26176 ) ) ( not ( = ?auto_26174 ?auto_26177 ) ) ( not ( = ?auto_26174 ?auto_26178 ) ) ( not ( = ?auto_26174 ?auto_26179 ) ) ( not ( = ?auto_26174 ?auto_26180 ) ) ( not ( = ?auto_26175 ?auto_26176 ) ) ( not ( = ?auto_26175 ?auto_26177 ) ) ( not ( = ?auto_26175 ?auto_26178 ) ) ( not ( = ?auto_26175 ?auto_26179 ) ) ( not ( = ?auto_26175 ?auto_26180 ) ) ( not ( = ?auto_26176 ?auto_26177 ) ) ( not ( = ?auto_26176 ?auto_26178 ) ) ( not ( = ?auto_26176 ?auto_26179 ) ) ( not ( = ?auto_26176 ?auto_26180 ) ) ( not ( = ?auto_26177 ?auto_26178 ) ) ( not ( = ?auto_26177 ?auto_26179 ) ) ( not ( = ?auto_26177 ?auto_26180 ) ) ( not ( = ?auto_26178 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26180 ) ) ( not ( = ?auto_26179 ?auto_26180 ) ) ( ON ?auto_26178 ?auto_26179 ) ( ON ?auto_26177 ?auto_26178 ) ( ON ?auto_26176 ?auto_26177 ) ( ON ?auto_26175 ?auto_26176 ) ( ON ?auto_26174 ?auto_26175 ) ( CLEAR ?auto_26174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26174 )
      ( MAKE-6PILE ?auto_26174 ?auto_26175 ?auto_26176 ?auto_26177 ?auto_26178 ?auto_26179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_26187 - BLOCK
      ?auto_26188 - BLOCK
      ?auto_26189 - BLOCK
      ?auto_26190 - BLOCK
      ?auto_26191 - BLOCK
      ?auto_26192 - BLOCK
    )
    :vars
    (
      ?auto_26193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26192 ?auto_26193 ) ( not ( = ?auto_26187 ?auto_26188 ) ) ( not ( = ?auto_26187 ?auto_26189 ) ) ( not ( = ?auto_26187 ?auto_26190 ) ) ( not ( = ?auto_26187 ?auto_26191 ) ) ( not ( = ?auto_26187 ?auto_26192 ) ) ( not ( = ?auto_26187 ?auto_26193 ) ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( not ( = ?auto_26188 ?auto_26190 ) ) ( not ( = ?auto_26188 ?auto_26191 ) ) ( not ( = ?auto_26188 ?auto_26192 ) ) ( not ( = ?auto_26188 ?auto_26193 ) ) ( not ( = ?auto_26189 ?auto_26190 ) ) ( not ( = ?auto_26189 ?auto_26191 ) ) ( not ( = ?auto_26189 ?auto_26192 ) ) ( not ( = ?auto_26189 ?auto_26193 ) ) ( not ( = ?auto_26190 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26192 ) ) ( not ( = ?auto_26190 ?auto_26193 ) ) ( not ( = ?auto_26191 ?auto_26192 ) ) ( not ( = ?auto_26191 ?auto_26193 ) ) ( not ( = ?auto_26192 ?auto_26193 ) ) ( ON ?auto_26191 ?auto_26192 ) ( ON ?auto_26190 ?auto_26191 ) ( ON ?auto_26189 ?auto_26190 ) ( ON ?auto_26188 ?auto_26189 ) ( ON ?auto_26187 ?auto_26188 ) ( CLEAR ?auto_26187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26187 )
      ( MAKE-6PILE ?auto_26187 ?auto_26188 ?auto_26189 ?auto_26190 ?auto_26191 ?auto_26192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26201 - BLOCK
      ?auto_26202 - BLOCK
      ?auto_26203 - BLOCK
      ?auto_26204 - BLOCK
      ?auto_26205 - BLOCK
      ?auto_26206 - BLOCK
      ?auto_26207 - BLOCK
    )
    :vars
    (
      ?auto_26208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26206 ) ( ON ?auto_26207 ?auto_26208 ) ( CLEAR ?auto_26207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26201 ) ( ON ?auto_26202 ?auto_26201 ) ( ON ?auto_26203 ?auto_26202 ) ( ON ?auto_26204 ?auto_26203 ) ( ON ?auto_26205 ?auto_26204 ) ( ON ?auto_26206 ?auto_26205 ) ( not ( = ?auto_26201 ?auto_26202 ) ) ( not ( = ?auto_26201 ?auto_26203 ) ) ( not ( = ?auto_26201 ?auto_26204 ) ) ( not ( = ?auto_26201 ?auto_26205 ) ) ( not ( = ?auto_26201 ?auto_26206 ) ) ( not ( = ?auto_26201 ?auto_26207 ) ) ( not ( = ?auto_26201 ?auto_26208 ) ) ( not ( = ?auto_26202 ?auto_26203 ) ) ( not ( = ?auto_26202 ?auto_26204 ) ) ( not ( = ?auto_26202 ?auto_26205 ) ) ( not ( = ?auto_26202 ?auto_26206 ) ) ( not ( = ?auto_26202 ?auto_26207 ) ) ( not ( = ?auto_26202 ?auto_26208 ) ) ( not ( = ?auto_26203 ?auto_26204 ) ) ( not ( = ?auto_26203 ?auto_26205 ) ) ( not ( = ?auto_26203 ?auto_26206 ) ) ( not ( = ?auto_26203 ?auto_26207 ) ) ( not ( = ?auto_26203 ?auto_26208 ) ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( not ( = ?auto_26204 ?auto_26206 ) ) ( not ( = ?auto_26204 ?auto_26207 ) ) ( not ( = ?auto_26204 ?auto_26208 ) ) ( not ( = ?auto_26205 ?auto_26206 ) ) ( not ( = ?auto_26205 ?auto_26207 ) ) ( not ( = ?auto_26205 ?auto_26208 ) ) ( not ( = ?auto_26206 ?auto_26207 ) ) ( not ( = ?auto_26206 ?auto_26208 ) ) ( not ( = ?auto_26207 ?auto_26208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26207 ?auto_26208 )
      ( !STACK ?auto_26207 ?auto_26206 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26216 - BLOCK
      ?auto_26217 - BLOCK
      ?auto_26218 - BLOCK
      ?auto_26219 - BLOCK
      ?auto_26220 - BLOCK
      ?auto_26221 - BLOCK
      ?auto_26222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26221 ) ( ON-TABLE ?auto_26222 ) ( CLEAR ?auto_26222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26216 ) ( ON ?auto_26217 ?auto_26216 ) ( ON ?auto_26218 ?auto_26217 ) ( ON ?auto_26219 ?auto_26218 ) ( ON ?auto_26220 ?auto_26219 ) ( ON ?auto_26221 ?auto_26220 ) ( not ( = ?auto_26216 ?auto_26217 ) ) ( not ( = ?auto_26216 ?auto_26218 ) ) ( not ( = ?auto_26216 ?auto_26219 ) ) ( not ( = ?auto_26216 ?auto_26220 ) ) ( not ( = ?auto_26216 ?auto_26221 ) ) ( not ( = ?auto_26216 ?auto_26222 ) ) ( not ( = ?auto_26217 ?auto_26218 ) ) ( not ( = ?auto_26217 ?auto_26219 ) ) ( not ( = ?auto_26217 ?auto_26220 ) ) ( not ( = ?auto_26217 ?auto_26221 ) ) ( not ( = ?auto_26217 ?auto_26222 ) ) ( not ( = ?auto_26218 ?auto_26219 ) ) ( not ( = ?auto_26218 ?auto_26220 ) ) ( not ( = ?auto_26218 ?auto_26221 ) ) ( not ( = ?auto_26218 ?auto_26222 ) ) ( not ( = ?auto_26219 ?auto_26220 ) ) ( not ( = ?auto_26219 ?auto_26221 ) ) ( not ( = ?auto_26219 ?auto_26222 ) ) ( not ( = ?auto_26220 ?auto_26221 ) ) ( not ( = ?auto_26220 ?auto_26222 ) ) ( not ( = ?auto_26221 ?auto_26222 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_26222 )
      ( !STACK ?auto_26222 ?auto_26221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26230 - BLOCK
      ?auto_26231 - BLOCK
      ?auto_26232 - BLOCK
      ?auto_26233 - BLOCK
      ?auto_26234 - BLOCK
      ?auto_26235 - BLOCK
      ?auto_26236 - BLOCK
    )
    :vars
    (
      ?auto_26237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26236 ?auto_26237 ) ( ON-TABLE ?auto_26230 ) ( ON ?auto_26231 ?auto_26230 ) ( ON ?auto_26232 ?auto_26231 ) ( ON ?auto_26233 ?auto_26232 ) ( ON ?auto_26234 ?auto_26233 ) ( not ( = ?auto_26230 ?auto_26231 ) ) ( not ( = ?auto_26230 ?auto_26232 ) ) ( not ( = ?auto_26230 ?auto_26233 ) ) ( not ( = ?auto_26230 ?auto_26234 ) ) ( not ( = ?auto_26230 ?auto_26235 ) ) ( not ( = ?auto_26230 ?auto_26236 ) ) ( not ( = ?auto_26230 ?auto_26237 ) ) ( not ( = ?auto_26231 ?auto_26232 ) ) ( not ( = ?auto_26231 ?auto_26233 ) ) ( not ( = ?auto_26231 ?auto_26234 ) ) ( not ( = ?auto_26231 ?auto_26235 ) ) ( not ( = ?auto_26231 ?auto_26236 ) ) ( not ( = ?auto_26231 ?auto_26237 ) ) ( not ( = ?auto_26232 ?auto_26233 ) ) ( not ( = ?auto_26232 ?auto_26234 ) ) ( not ( = ?auto_26232 ?auto_26235 ) ) ( not ( = ?auto_26232 ?auto_26236 ) ) ( not ( = ?auto_26232 ?auto_26237 ) ) ( not ( = ?auto_26233 ?auto_26234 ) ) ( not ( = ?auto_26233 ?auto_26235 ) ) ( not ( = ?auto_26233 ?auto_26236 ) ) ( not ( = ?auto_26233 ?auto_26237 ) ) ( not ( = ?auto_26234 ?auto_26235 ) ) ( not ( = ?auto_26234 ?auto_26236 ) ) ( not ( = ?auto_26234 ?auto_26237 ) ) ( not ( = ?auto_26235 ?auto_26236 ) ) ( not ( = ?auto_26235 ?auto_26237 ) ) ( not ( = ?auto_26236 ?auto_26237 ) ) ( CLEAR ?auto_26234 ) ( ON ?auto_26235 ?auto_26236 ) ( CLEAR ?auto_26235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_26230 ?auto_26231 ?auto_26232 ?auto_26233 ?auto_26234 ?auto_26235 )
      ( MAKE-7PILE ?auto_26230 ?auto_26231 ?auto_26232 ?auto_26233 ?auto_26234 ?auto_26235 ?auto_26236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26245 - BLOCK
      ?auto_26246 - BLOCK
      ?auto_26247 - BLOCK
      ?auto_26248 - BLOCK
      ?auto_26249 - BLOCK
      ?auto_26250 - BLOCK
      ?auto_26251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26251 ) ( ON-TABLE ?auto_26245 ) ( ON ?auto_26246 ?auto_26245 ) ( ON ?auto_26247 ?auto_26246 ) ( ON ?auto_26248 ?auto_26247 ) ( ON ?auto_26249 ?auto_26248 ) ( not ( = ?auto_26245 ?auto_26246 ) ) ( not ( = ?auto_26245 ?auto_26247 ) ) ( not ( = ?auto_26245 ?auto_26248 ) ) ( not ( = ?auto_26245 ?auto_26249 ) ) ( not ( = ?auto_26245 ?auto_26250 ) ) ( not ( = ?auto_26245 ?auto_26251 ) ) ( not ( = ?auto_26246 ?auto_26247 ) ) ( not ( = ?auto_26246 ?auto_26248 ) ) ( not ( = ?auto_26246 ?auto_26249 ) ) ( not ( = ?auto_26246 ?auto_26250 ) ) ( not ( = ?auto_26246 ?auto_26251 ) ) ( not ( = ?auto_26247 ?auto_26248 ) ) ( not ( = ?auto_26247 ?auto_26249 ) ) ( not ( = ?auto_26247 ?auto_26250 ) ) ( not ( = ?auto_26247 ?auto_26251 ) ) ( not ( = ?auto_26248 ?auto_26249 ) ) ( not ( = ?auto_26248 ?auto_26250 ) ) ( not ( = ?auto_26248 ?auto_26251 ) ) ( not ( = ?auto_26249 ?auto_26250 ) ) ( not ( = ?auto_26249 ?auto_26251 ) ) ( not ( = ?auto_26250 ?auto_26251 ) ) ( CLEAR ?auto_26249 ) ( ON ?auto_26250 ?auto_26251 ) ( CLEAR ?auto_26250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_26245 ?auto_26246 ?auto_26247 ?auto_26248 ?auto_26249 ?auto_26250 )
      ( MAKE-7PILE ?auto_26245 ?auto_26246 ?auto_26247 ?auto_26248 ?auto_26249 ?auto_26250 ?auto_26251 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26259 - BLOCK
      ?auto_26260 - BLOCK
      ?auto_26261 - BLOCK
      ?auto_26262 - BLOCK
      ?auto_26263 - BLOCK
      ?auto_26264 - BLOCK
      ?auto_26265 - BLOCK
    )
    :vars
    (
      ?auto_26266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26265 ?auto_26266 ) ( ON-TABLE ?auto_26259 ) ( ON ?auto_26260 ?auto_26259 ) ( ON ?auto_26261 ?auto_26260 ) ( ON ?auto_26262 ?auto_26261 ) ( not ( = ?auto_26259 ?auto_26260 ) ) ( not ( = ?auto_26259 ?auto_26261 ) ) ( not ( = ?auto_26259 ?auto_26262 ) ) ( not ( = ?auto_26259 ?auto_26263 ) ) ( not ( = ?auto_26259 ?auto_26264 ) ) ( not ( = ?auto_26259 ?auto_26265 ) ) ( not ( = ?auto_26259 ?auto_26266 ) ) ( not ( = ?auto_26260 ?auto_26261 ) ) ( not ( = ?auto_26260 ?auto_26262 ) ) ( not ( = ?auto_26260 ?auto_26263 ) ) ( not ( = ?auto_26260 ?auto_26264 ) ) ( not ( = ?auto_26260 ?auto_26265 ) ) ( not ( = ?auto_26260 ?auto_26266 ) ) ( not ( = ?auto_26261 ?auto_26262 ) ) ( not ( = ?auto_26261 ?auto_26263 ) ) ( not ( = ?auto_26261 ?auto_26264 ) ) ( not ( = ?auto_26261 ?auto_26265 ) ) ( not ( = ?auto_26261 ?auto_26266 ) ) ( not ( = ?auto_26262 ?auto_26263 ) ) ( not ( = ?auto_26262 ?auto_26264 ) ) ( not ( = ?auto_26262 ?auto_26265 ) ) ( not ( = ?auto_26262 ?auto_26266 ) ) ( not ( = ?auto_26263 ?auto_26264 ) ) ( not ( = ?auto_26263 ?auto_26265 ) ) ( not ( = ?auto_26263 ?auto_26266 ) ) ( not ( = ?auto_26264 ?auto_26265 ) ) ( not ( = ?auto_26264 ?auto_26266 ) ) ( not ( = ?auto_26265 ?auto_26266 ) ) ( ON ?auto_26264 ?auto_26265 ) ( CLEAR ?auto_26262 ) ( ON ?auto_26263 ?auto_26264 ) ( CLEAR ?auto_26263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26259 ?auto_26260 ?auto_26261 ?auto_26262 ?auto_26263 )
      ( MAKE-7PILE ?auto_26259 ?auto_26260 ?auto_26261 ?auto_26262 ?auto_26263 ?auto_26264 ?auto_26265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26274 - BLOCK
      ?auto_26275 - BLOCK
      ?auto_26276 - BLOCK
      ?auto_26277 - BLOCK
      ?auto_26278 - BLOCK
      ?auto_26279 - BLOCK
      ?auto_26280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26280 ) ( ON-TABLE ?auto_26274 ) ( ON ?auto_26275 ?auto_26274 ) ( ON ?auto_26276 ?auto_26275 ) ( ON ?auto_26277 ?auto_26276 ) ( not ( = ?auto_26274 ?auto_26275 ) ) ( not ( = ?auto_26274 ?auto_26276 ) ) ( not ( = ?auto_26274 ?auto_26277 ) ) ( not ( = ?auto_26274 ?auto_26278 ) ) ( not ( = ?auto_26274 ?auto_26279 ) ) ( not ( = ?auto_26274 ?auto_26280 ) ) ( not ( = ?auto_26275 ?auto_26276 ) ) ( not ( = ?auto_26275 ?auto_26277 ) ) ( not ( = ?auto_26275 ?auto_26278 ) ) ( not ( = ?auto_26275 ?auto_26279 ) ) ( not ( = ?auto_26275 ?auto_26280 ) ) ( not ( = ?auto_26276 ?auto_26277 ) ) ( not ( = ?auto_26276 ?auto_26278 ) ) ( not ( = ?auto_26276 ?auto_26279 ) ) ( not ( = ?auto_26276 ?auto_26280 ) ) ( not ( = ?auto_26277 ?auto_26278 ) ) ( not ( = ?auto_26277 ?auto_26279 ) ) ( not ( = ?auto_26277 ?auto_26280 ) ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( not ( = ?auto_26278 ?auto_26280 ) ) ( not ( = ?auto_26279 ?auto_26280 ) ) ( ON ?auto_26279 ?auto_26280 ) ( CLEAR ?auto_26277 ) ( ON ?auto_26278 ?auto_26279 ) ( CLEAR ?auto_26278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26274 ?auto_26275 ?auto_26276 ?auto_26277 ?auto_26278 )
      ( MAKE-7PILE ?auto_26274 ?auto_26275 ?auto_26276 ?auto_26277 ?auto_26278 ?auto_26279 ?auto_26280 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26288 - BLOCK
      ?auto_26289 - BLOCK
      ?auto_26290 - BLOCK
      ?auto_26291 - BLOCK
      ?auto_26292 - BLOCK
      ?auto_26293 - BLOCK
      ?auto_26294 - BLOCK
    )
    :vars
    (
      ?auto_26295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26294 ?auto_26295 ) ( ON-TABLE ?auto_26288 ) ( ON ?auto_26289 ?auto_26288 ) ( ON ?auto_26290 ?auto_26289 ) ( not ( = ?auto_26288 ?auto_26289 ) ) ( not ( = ?auto_26288 ?auto_26290 ) ) ( not ( = ?auto_26288 ?auto_26291 ) ) ( not ( = ?auto_26288 ?auto_26292 ) ) ( not ( = ?auto_26288 ?auto_26293 ) ) ( not ( = ?auto_26288 ?auto_26294 ) ) ( not ( = ?auto_26288 ?auto_26295 ) ) ( not ( = ?auto_26289 ?auto_26290 ) ) ( not ( = ?auto_26289 ?auto_26291 ) ) ( not ( = ?auto_26289 ?auto_26292 ) ) ( not ( = ?auto_26289 ?auto_26293 ) ) ( not ( = ?auto_26289 ?auto_26294 ) ) ( not ( = ?auto_26289 ?auto_26295 ) ) ( not ( = ?auto_26290 ?auto_26291 ) ) ( not ( = ?auto_26290 ?auto_26292 ) ) ( not ( = ?auto_26290 ?auto_26293 ) ) ( not ( = ?auto_26290 ?auto_26294 ) ) ( not ( = ?auto_26290 ?auto_26295 ) ) ( not ( = ?auto_26291 ?auto_26292 ) ) ( not ( = ?auto_26291 ?auto_26293 ) ) ( not ( = ?auto_26291 ?auto_26294 ) ) ( not ( = ?auto_26291 ?auto_26295 ) ) ( not ( = ?auto_26292 ?auto_26293 ) ) ( not ( = ?auto_26292 ?auto_26294 ) ) ( not ( = ?auto_26292 ?auto_26295 ) ) ( not ( = ?auto_26293 ?auto_26294 ) ) ( not ( = ?auto_26293 ?auto_26295 ) ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( ON ?auto_26293 ?auto_26294 ) ( ON ?auto_26292 ?auto_26293 ) ( CLEAR ?auto_26290 ) ( ON ?auto_26291 ?auto_26292 ) ( CLEAR ?auto_26291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26288 ?auto_26289 ?auto_26290 ?auto_26291 )
      ( MAKE-7PILE ?auto_26288 ?auto_26289 ?auto_26290 ?auto_26291 ?auto_26292 ?auto_26293 ?auto_26294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26303 - BLOCK
      ?auto_26304 - BLOCK
      ?auto_26305 - BLOCK
      ?auto_26306 - BLOCK
      ?auto_26307 - BLOCK
      ?auto_26308 - BLOCK
      ?auto_26309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26309 ) ( ON-TABLE ?auto_26303 ) ( ON ?auto_26304 ?auto_26303 ) ( ON ?auto_26305 ?auto_26304 ) ( not ( = ?auto_26303 ?auto_26304 ) ) ( not ( = ?auto_26303 ?auto_26305 ) ) ( not ( = ?auto_26303 ?auto_26306 ) ) ( not ( = ?auto_26303 ?auto_26307 ) ) ( not ( = ?auto_26303 ?auto_26308 ) ) ( not ( = ?auto_26303 ?auto_26309 ) ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26304 ?auto_26307 ) ) ( not ( = ?auto_26304 ?auto_26308 ) ) ( not ( = ?auto_26304 ?auto_26309 ) ) ( not ( = ?auto_26305 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26308 ) ) ( not ( = ?auto_26305 ?auto_26309 ) ) ( not ( = ?auto_26306 ?auto_26307 ) ) ( not ( = ?auto_26306 ?auto_26308 ) ) ( not ( = ?auto_26306 ?auto_26309 ) ) ( not ( = ?auto_26307 ?auto_26308 ) ) ( not ( = ?auto_26307 ?auto_26309 ) ) ( not ( = ?auto_26308 ?auto_26309 ) ) ( ON ?auto_26308 ?auto_26309 ) ( ON ?auto_26307 ?auto_26308 ) ( CLEAR ?auto_26305 ) ( ON ?auto_26306 ?auto_26307 ) ( CLEAR ?auto_26306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26303 ?auto_26304 ?auto_26305 ?auto_26306 )
      ( MAKE-7PILE ?auto_26303 ?auto_26304 ?auto_26305 ?auto_26306 ?auto_26307 ?auto_26308 ?auto_26309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26317 - BLOCK
      ?auto_26318 - BLOCK
      ?auto_26319 - BLOCK
      ?auto_26320 - BLOCK
      ?auto_26321 - BLOCK
      ?auto_26322 - BLOCK
      ?auto_26323 - BLOCK
    )
    :vars
    (
      ?auto_26324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26323 ?auto_26324 ) ( ON-TABLE ?auto_26317 ) ( ON ?auto_26318 ?auto_26317 ) ( not ( = ?auto_26317 ?auto_26318 ) ) ( not ( = ?auto_26317 ?auto_26319 ) ) ( not ( = ?auto_26317 ?auto_26320 ) ) ( not ( = ?auto_26317 ?auto_26321 ) ) ( not ( = ?auto_26317 ?auto_26322 ) ) ( not ( = ?auto_26317 ?auto_26323 ) ) ( not ( = ?auto_26317 ?auto_26324 ) ) ( not ( = ?auto_26318 ?auto_26319 ) ) ( not ( = ?auto_26318 ?auto_26320 ) ) ( not ( = ?auto_26318 ?auto_26321 ) ) ( not ( = ?auto_26318 ?auto_26322 ) ) ( not ( = ?auto_26318 ?auto_26323 ) ) ( not ( = ?auto_26318 ?auto_26324 ) ) ( not ( = ?auto_26319 ?auto_26320 ) ) ( not ( = ?auto_26319 ?auto_26321 ) ) ( not ( = ?auto_26319 ?auto_26322 ) ) ( not ( = ?auto_26319 ?auto_26323 ) ) ( not ( = ?auto_26319 ?auto_26324 ) ) ( not ( = ?auto_26320 ?auto_26321 ) ) ( not ( = ?auto_26320 ?auto_26322 ) ) ( not ( = ?auto_26320 ?auto_26323 ) ) ( not ( = ?auto_26320 ?auto_26324 ) ) ( not ( = ?auto_26321 ?auto_26322 ) ) ( not ( = ?auto_26321 ?auto_26323 ) ) ( not ( = ?auto_26321 ?auto_26324 ) ) ( not ( = ?auto_26322 ?auto_26323 ) ) ( not ( = ?auto_26322 ?auto_26324 ) ) ( not ( = ?auto_26323 ?auto_26324 ) ) ( ON ?auto_26322 ?auto_26323 ) ( ON ?auto_26321 ?auto_26322 ) ( ON ?auto_26320 ?auto_26321 ) ( CLEAR ?auto_26318 ) ( ON ?auto_26319 ?auto_26320 ) ( CLEAR ?auto_26319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26317 ?auto_26318 ?auto_26319 )
      ( MAKE-7PILE ?auto_26317 ?auto_26318 ?auto_26319 ?auto_26320 ?auto_26321 ?auto_26322 ?auto_26323 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26332 - BLOCK
      ?auto_26333 - BLOCK
      ?auto_26334 - BLOCK
      ?auto_26335 - BLOCK
      ?auto_26336 - BLOCK
      ?auto_26337 - BLOCK
      ?auto_26338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26338 ) ( ON-TABLE ?auto_26332 ) ( ON ?auto_26333 ?auto_26332 ) ( not ( = ?auto_26332 ?auto_26333 ) ) ( not ( = ?auto_26332 ?auto_26334 ) ) ( not ( = ?auto_26332 ?auto_26335 ) ) ( not ( = ?auto_26332 ?auto_26336 ) ) ( not ( = ?auto_26332 ?auto_26337 ) ) ( not ( = ?auto_26332 ?auto_26338 ) ) ( not ( = ?auto_26333 ?auto_26334 ) ) ( not ( = ?auto_26333 ?auto_26335 ) ) ( not ( = ?auto_26333 ?auto_26336 ) ) ( not ( = ?auto_26333 ?auto_26337 ) ) ( not ( = ?auto_26333 ?auto_26338 ) ) ( not ( = ?auto_26334 ?auto_26335 ) ) ( not ( = ?auto_26334 ?auto_26336 ) ) ( not ( = ?auto_26334 ?auto_26337 ) ) ( not ( = ?auto_26334 ?auto_26338 ) ) ( not ( = ?auto_26335 ?auto_26336 ) ) ( not ( = ?auto_26335 ?auto_26337 ) ) ( not ( = ?auto_26335 ?auto_26338 ) ) ( not ( = ?auto_26336 ?auto_26337 ) ) ( not ( = ?auto_26336 ?auto_26338 ) ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( ON ?auto_26337 ?auto_26338 ) ( ON ?auto_26336 ?auto_26337 ) ( ON ?auto_26335 ?auto_26336 ) ( CLEAR ?auto_26333 ) ( ON ?auto_26334 ?auto_26335 ) ( CLEAR ?auto_26334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26332 ?auto_26333 ?auto_26334 )
      ( MAKE-7PILE ?auto_26332 ?auto_26333 ?auto_26334 ?auto_26335 ?auto_26336 ?auto_26337 ?auto_26338 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26346 - BLOCK
      ?auto_26347 - BLOCK
      ?auto_26348 - BLOCK
      ?auto_26349 - BLOCK
      ?auto_26350 - BLOCK
      ?auto_26351 - BLOCK
      ?auto_26352 - BLOCK
    )
    :vars
    (
      ?auto_26353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26352 ?auto_26353 ) ( ON-TABLE ?auto_26346 ) ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26346 ?auto_26350 ) ) ( not ( = ?auto_26346 ?auto_26351 ) ) ( not ( = ?auto_26346 ?auto_26352 ) ) ( not ( = ?auto_26346 ?auto_26353 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26347 ?auto_26351 ) ) ( not ( = ?auto_26347 ?auto_26352 ) ) ( not ( = ?auto_26347 ?auto_26353 ) ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26351 ) ) ( not ( = ?auto_26348 ?auto_26352 ) ) ( not ( = ?auto_26348 ?auto_26353 ) ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( not ( = ?auto_26349 ?auto_26351 ) ) ( not ( = ?auto_26349 ?auto_26352 ) ) ( not ( = ?auto_26349 ?auto_26353 ) ) ( not ( = ?auto_26350 ?auto_26351 ) ) ( not ( = ?auto_26350 ?auto_26352 ) ) ( not ( = ?auto_26350 ?auto_26353 ) ) ( not ( = ?auto_26351 ?auto_26352 ) ) ( not ( = ?auto_26351 ?auto_26353 ) ) ( not ( = ?auto_26352 ?auto_26353 ) ) ( ON ?auto_26351 ?auto_26352 ) ( ON ?auto_26350 ?auto_26351 ) ( ON ?auto_26349 ?auto_26350 ) ( ON ?auto_26348 ?auto_26349 ) ( CLEAR ?auto_26346 ) ( ON ?auto_26347 ?auto_26348 ) ( CLEAR ?auto_26347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26346 ?auto_26347 )
      ( MAKE-7PILE ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26350 ?auto_26351 ?auto_26352 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26361 - BLOCK
      ?auto_26362 - BLOCK
      ?auto_26363 - BLOCK
      ?auto_26364 - BLOCK
      ?auto_26365 - BLOCK
      ?auto_26366 - BLOCK
      ?auto_26367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26367 ) ( ON-TABLE ?auto_26361 ) ( not ( = ?auto_26361 ?auto_26362 ) ) ( not ( = ?auto_26361 ?auto_26363 ) ) ( not ( = ?auto_26361 ?auto_26364 ) ) ( not ( = ?auto_26361 ?auto_26365 ) ) ( not ( = ?auto_26361 ?auto_26366 ) ) ( not ( = ?auto_26361 ?auto_26367 ) ) ( not ( = ?auto_26362 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26364 ) ) ( not ( = ?auto_26362 ?auto_26365 ) ) ( not ( = ?auto_26362 ?auto_26366 ) ) ( not ( = ?auto_26362 ?auto_26367 ) ) ( not ( = ?auto_26363 ?auto_26364 ) ) ( not ( = ?auto_26363 ?auto_26365 ) ) ( not ( = ?auto_26363 ?auto_26366 ) ) ( not ( = ?auto_26363 ?auto_26367 ) ) ( not ( = ?auto_26364 ?auto_26365 ) ) ( not ( = ?auto_26364 ?auto_26366 ) ) ( not ( = ?auto_26364 ?auto_26367 ) ) ( not ( = ?auto_26365 ?auto_26366 ) ) ( not ( = ?auto_26365 ?auto_26367 ) ) ( not ( = ?auto_26366 ?auto_26367 ) ) ( ON ?auto_26366 ?auto_26367 ) ( ON ?auto_26365 ?auto_26366 ) ( ON ?auto_26364 ?auto_26365 ) ( ON ?auto_26363 ?auto_26364 ) ( CLEAR ?auto_26361 ) ( ON ?auto_26362 ?auto_26363 ) ( CLEAR ?auto_26362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26361 ?auto_26362 )
      ( MAKE-7PILE ?auto_26361 ?auto_26362 ?auto_26363 ?auto_26364 ?auto_26365 ?auto_26366 ?auto_26367 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26375 - BLOCK
      ?auto_26376 - BLOCK
      ?auto_26377 - BLOCK
      ?auto_26378 - BLOCK
      ?auto_26379 - BLOCK
      ?auto_26380 - BLOCK
      ?auto_26381 - BLOCK
    )
    :vars
    (
      ?auto_26382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26381 ?auto_26382 ) ( not ( = ?auto_26375 ?auto_26376 ) ) ( not ( = ?auto_26375 ?auto_26377 ) ) ( not ( = ?auto_26375 ?auto_26378 ) ) ( not ( = ?auto_26375 ?auto_26379 ) ) ( not ( = ?auto_26375 ?auto_26380 ) ) ( not ( = ?auto_26375 ?auto_26381 ) ) ( not ( = ?auto_26375 ?auto_26382 ) ) ( not ( = ?auto_26376 ?auto_26377 ) ) ( not ( = ?auto_26376 ?auto_26378 ) ) ( not ( = ?auto_26376 ?auto_26379 ) ) ( not ( = ?auto_26376 ?auto_26380 ) ) ( not ( = ?auto_26376 ?auto_26381 ) ) ( not ( = ?auto_26376 ?auto_26382 ) ) ( not ( = ?auto_26377 ?auto_26378 ) ) ( not ( = ?auto_26377 ?auto_26379 ) ) ( not ( = ?auto_26377 ?auto_26380 ) ) ( not ( = ?auto_26377 ?auto_26381 ) ) ( not ( = ?auto_26377 ?auto_26382 ) ) ( not ( = ?auto_26378 ?auto_26379 ) ) ( not ( = ?auto_26378 ?auto_26380 ) ) ( not ( = ?auto_26378 ?auto_26381 ) ) ( not ( = ?auto_26378 ?auto_26382 ) ) ( not ( = ?auto_26379 ?auto_26380 ) ) ( not ( = ?auto_26379 ?auto_26381 ) ) ( not ( = ?auto_26379 ?auto_26382 ) ) ( not ( = ?auto_26380 ?auto_26381 ) ) ( not ( = ?auto_26380 ?auto_26382 ) ) ( not ( = ?auto_26381 ?auto_26382 ) ) ( ON ?auto_26380 ?auto_26381 ) ( ON ?auto_26379 ?auto_26380 ) ( ON ?auto_26378 ?auto_26379 ) ( ON ?auto_26377 ?auto_26378 ) ( ON ?auto_26376 ?auto_26377 ) ( ON ?auto_26375 ?auto_26376 ) ( CLEAR ?auto_26375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26375 )
      ( MAKE-7PILE ?auto_26375 ?auto_26376 ?auto_26377 ?auto_26378 ?auto_26379 ?auto_26380 ?auto_26381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26390 - BLOCK
      ?auto_26391 - BLOCK
      ?auto_26392 - BLOCK
      ?auto_26393 - BLOCK
      ?auto_26394 - BLOCK
      ?auto_26395 - BLOCK
      ?auto_26396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26396 ) ( not ( = ?auto_26390 ?auto_26391 ) ) ( not ( = ?auto_26390 ?auto_26392 ) ) ( not ( = ?auto_26390 ?auto_26393 ) ) ( not ( = ?auto_26390 ?auto_26394 ) ) ( not ( = ?auto_26390 ?auto_26395 ) ) ( not ( = ?auto_26390 ?auto_26396 ) ) ( not ( = ?auto_26391 ?auto_26392 ) ) ( not ( = ?auto_26391 ?auto_26393 ) ) ( not ( = ?auto_26391 ?auto_26394 ) ) ( not ( = ?auto_26391 ?auto_26395 ) ) ( not ( = ?auto_26391 ?auto_26396 ) ) ( not ( = ?auto_26392 ?auto_26393 ) ) ( not ( = ?auto_26392 ?auto_26394 ) ) ( not ( = ?auto_26392 ?auto_26395 ) ) ( not ( = ?auto_26392 ?auto_26396 ) ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( not ( = ?auto_26393 ?auto_26395 ) ) ( not ( = ?auto_26393 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26395 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( ON ?auto_26395 ?auto_26396 ) ( ON ?auto_26394 ?auto_26395 ) ( ON ?auto_26393 ?auto_26394 ) ( ON ?auto_26392 ?auto_26393 ) ( ON ?auto_26391 ?auto_26392 ) ( ON ?auto_26390 ?auto_26391 ) ( CLEAR ?auto_26390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26390 )
      ( MAKE-7PILE ?auto_26390 ?auto_26391 ?auto_26392 ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26396 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_26404 - BLOCK
      ?auto_26405 - BLOCK
      ?auto_26406 - BLOCK
      ?auto_26407 - BLOCK
      ?auto_26408 - BLOCK
      ?auto_26409 - BLOCK
      ?auto_26410 - BLOCK
    )
    :vars
    (
      ?auto_26411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26404 ?auto_26405 ) ) ( not ( = ?auto_26404 ?auto_26406 ) ) ( not ( = ?auto_26404 ?auto_26407 ) ) ( not ( = ?auto_26404 ?auto_26408 ) ) ( not ( = ?auto_26404 ?auto_26409 ) ) ( not ( = ?auto_26404 ?auto_26410 ) ) ( not ( = ?auto_26405 ?auto_26406 ) ) ( not ( = ?auto_26405 ?auto_26407 ) ) ( not ( = ?auto_26405 ?auto_26408 ) ) ( not ( = ?auto_26405 ?auto_26409 ) ) ( not ( = ?auto_26405 ?auto_26410 ) ) ( not ( = ?auto_26406 ?auto_26407 ) ) ( not ( = ?auto_26406 ?auto_26408 ) ) ( not ( = ?auto_26406 ?auto_26409 ) ) ( not ( = ?auto_26406 ?auto_26410 ) ) ( not ( = ?auto_26407 ?auto_26408 ) ) ( not ( = ?auto_26407 ?auto_26409 ) ) ( not ( = ?auto_26407 ?auto_26410 ) ) ( not ( = ?auto_26408 ?auto_26409 ) ) ( not ( = ?auto_26408 ?auto_26410 ) ) ( not ( = ?auto_26409 ?auto_26410 ) ) ( ON ?auto_26404 ?auto_26411 ) ( not ( = ?auto_26410 ?auto_26411 ) ) ( not ( = ?auto_26409 ?auto_26411 ) ) ( not ( = ?auto_26408 ?auto_26411 ) ) ( not ( = ?auto_26407 ?auto_26411 ) ) ( not ( = ?auto_26406 ?auto_26411 ) ) ( not ( = ?auto_26405 ?auto_26411 ) ) ( not ( = ?auto_26404 ?auto_26411 ) ) ( ON ?auto_26405 ?auto_26404 ) ( ON ?auto_26406 ?auto_26405 ) ( ON ?auto_26407 ?auto_26406 ) ( ON ?auto_26408 ?auto_26407 ) ( ON ?auto_26409 ?auto_26408 ) ( ON ?auto_26410 ?auto_26409 ) ( CLEAR ?auto_26410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_26410 ?auto_26409 ?auto_26408 ?auto_26407 ?auto_26406 ?auto_26405 ?auto_26404 )
      ( MAKE-7PILE ?auto_26404 ?auto_26405 ?auto_26406 ?auto_26407 ?auto_26408 ?auto_26409 ?auto_26410 ) )
  )

)

