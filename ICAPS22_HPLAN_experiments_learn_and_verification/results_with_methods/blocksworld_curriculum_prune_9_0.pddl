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
      ?auto_48721 - BLOCK
    )
    :vars
    (
      ?auto_48722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48721 ?auto_48722 ) ( CLEAR ?auto_48721 ) ( HAND-EMPTY ) ( not ( = ?auto_48721 ?auto_48722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48721 ?auto_48722 )
      ( !PUTDOWN ?auto_48721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48728 - BLOCK
      ?auto_48729 - BLOCK
    )
    :vars
    (
      ?auto_48730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48728 ) ( ON ?auto_48729 ?auto_48730 ) ( CLEAR ?auto_48729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48728 ) ( not ( = ?auto_48728 ?auto_48729 ) ) ( not ( = ?auto_48728 ?auto_48730 ) ) ( not ( = ?auto_48729 ?auto_48730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48729 ?auto_48730 )
      ( !STACK ?auto_48729 ?auto_48728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48738 - BLOCK
      ?auto_48739 - BLOCK
    )
    :vars
    (
      ?auto_48740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48739 ?auto_48740 ) ( not ( = ?auto_48738 ?auto_48739 ) ) ( not ( = ?auto_48738 ?auto_48740 ) ) ( not ( = ?auto_48739 ?auto_48740 ) ) ( ON ?auto_48738 ?auto_48739 ) ( CLEAR ?auto_48738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48738 )
      ( MAKE-2PILE ?auto_48738 ?auto_48739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48749 - BLOCK
      ?auto_48750 - BLOCK
      ?auto_48751 - BLOCK
    )
    :vars
    (
      ?auto_48752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48750 ) ( ON ?auto_48751 ?auto_48752 ) ( CLEAR ?auto_48751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48749 ) ( ON ?auto_48750 ?auto_48749 ) ( not ( = ?auto_48749 ?auto_48750 ) ) ( not ( = ?auto_48749 ?auto_48751 ) ) ( not ( = ?auto_48749 ?auto_48752 ) ) ( not ( = ?auto_48750 ?auto_48751 ) ) ( not ( = ?auto_48750 ?auto_48752 ) ) ( not ( = ?auto_48751 ?auto_48752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48751 ?auto_48752 )
      ( !STACK ?auto_48751 ?auto_48750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48763 - BLOCK
      ?auto_48764 - BLOCK
      ?auto_48765 - BLOCK
    )
    :vars
    (
      ?auto_48766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48765 ?auto_48766 ) ( ON-TABLE ?auto_48763 ) ( not ( = ?auto_48763 ?auto_48764 ) ) ( not ( = ?auto_48763 ?auto_48765 ) ) ( not ( = ?auto_48763 ?auto_48766 ) ) ( not ( = ?auto_48764 ?auto_48765 ) ) ( not ( = ?auto_48764 ?auto_48766 ) ) ( not ( = ?auto_48765 ?auto_48766 ) ) ( CLEAR ?auto_48763 ) ( ON ?auto_48764 ?auto_48765 ) ( CLEAR ?auto_48764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48763 ?auto_48764 )
      ( MAKE-3PILE ?auto_48763 ?auto_48764 ?auto_48765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48777 - BLOCK
      ?auto_48778 - BLOCK
      ?auto_48779 - BLOCK
    )
    :vars
    (
      ?auto_48780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48779 ?auto_48780 ) ( not ( = ?auto_48777 ?auto_48778 ) ) ( not ( = ?auto_48777 ?auto_48779 ) ) ( not ( = ?auto_48777 ?auto_48780 ) ) ( not ( = ?auto_48778 ?auto_48779 ) ) ( not ( = ?auto_48778 ?auto_48780 ) ) ( not ( = ?auto_48779 ?auto_48780 ) ) ( ON ?auto_48778 ?auto_48779 ) ( ON ?auto_48777 ?auto_48778 ) ( CLEAR ?auto_48777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48777 )
      ( MAKE-3PILE ?auto_48777 ?auto_48778 ?auto_48779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48792 - BLOCK
      ?auto_48793 - BLOCK
      ?auto_48794 - BLOCK
      ?auto_48795 - BLOCK
    )
    :vars
    (
      ?auto_48796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48794 ) ( ON ?auto_48795 ?auto_48796 ) ( CLEAR ?auto_48795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48792 ) ( ON ?auto_48793 ?auto_48792 ) ( ON ?auto_48794 ?auto_48793 ) ( not ( = ?auto_48792 ?auto_48793 ) ) ( not ( = ?auto_48792 ?auto_48794 ) ) ( not ( = ?auto_48792 ?auto_48795 ) ) ( not ( = ?auto_48792 ?auto_48796 ) ) ( not ( = ?auto_48793 ?auto_48794 ) ) ( not ( = ?auto_48793 ?auto_48795 ) ) ( not ( = ?auto_48793 ?auto_48796 ) ) ( not ( = ?auto_48794 ?auto_48795 ) ) ( not ( = ?auto_48794 ?auto_48796 ) ) ( not ( = ?auto_48795 ?auto_48796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48795 ?auto_48796 )
      ( !STACK ?auto_48795 ?auto_48794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48810 - BLOCK
      ?auto_48811 - BLOCK
      ?auto_48812 - BLOCK
      ?auto_48813 - BLOCK
    )
    :vars
    (
      ?auto_48814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48813 ?auto_48814 ) ( ON-TABLE ?auto_48810 ) ( ON ?auto_48811 ?auto_48810 ) ( not ( = ?auto_48810 ?auto_48811 ) ) ( not ( = ?auto_48810 ?auto_48812 ) ) ( not ( = ?auto_48810 ?auto_48813 ) ) ( not ( = ?auto_48810 ?auto_48814 ) ) ( not ( = ?auto_48811 ?auto_48812 ) ) ( not ( = ?auto_48811 ?auto_48813 ) ) ( not ( = ?auto_48811 ?auto_48814 ) ) ( not ( = ?auto_48812 ?auto_48813 ) ) ( not ( = ?auto_48812 ?auto_48814 ) ) ( not ( = ?auto_48813 ?auto_48814 ) ) ( CLEAR ?auto_48811 ) ( ON ?auto_48812 ?auto_48813 ) ( CLEAR ?auto_48812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48810 ?auto_48811 ?auto_48812 )
      ( MAKE-4PILE ?auto_48810 ?auto_48811 ?auto_48812 ?auto_48813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48828 - BLOCK
      ?auto_48829 - BLOCK
      ?auto_48830 - BLOCK
      ?auto_48831 - BLOCK
    )
    :vars
    (
      ?auto_48832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48831 ?auto_48832 ) ( ON-TABLE ?auto_48828 ) ( not ( = ?auto_48828 ?auto_48829 ) ) ( not ( = ?auto_48828 ?auto_48830 ) ) ( not ( = ?auto_48828 ?auto_48831 ) ) ( not ( = ?auto_48828 ?auto_48832 ) ) ( not ( = ?auto_48829 ?auto_48830 ) ) ( not ( = ?auto_48829 ?auto_48831 ) ) ( not ( = ?auto_48829 ?auto_48832 ) ) ( not ( = ?auto_48830 ?auto_48831 ) ) ( not ( = ?auto_48830 ?auto_48832 ) ) ( not ( = ?auto_48831 ?auto_48832 ) ) ( ON ?auto_48830 ?auto_48831 ) ( CLEAR ?auto_48828 ) ( ON ?auto_48829 ?auto_48830 ) ( CLEAR ?auto_48829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48828 ?auto_48829 )
      ( MAKE-4PILE ?auto_48828 ?auto_48829 ?auto_48830 ?auto_48831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48846 - BLOCK
      ?auto_48847 - BLOCK
      ?auto_48848 - BLOCK
      ?auto_48849 - BLOCK
    )
    :vars
    (
      ?auto_48850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48849 ?auto_48850 ) ( not ( = ?auto_48846 ?auto_48847 ) ) ( not ( = ?auto_48846 ?auto_48848 ) ) ( not ( = ?auto_48846 ?auto_48849 ) ) ( not ( = ?auto_48846 ?auto_48850 ) ) ( not ( = ?auto_48847 ?auto_48848 ) ) ( not ( = ?auto_48847 ?auto_48849 ) ) ( not ( = ?auto_48847 ?auto_48850 ) ) ( not ( = ?auto_48848 ?auto_48849 ) ) ( not ( = ?auto_48848 ?auto_48850 ) ) ( not ( = ?auto_48849 ?auto_48850 ) ) ( ON ?auto_48848 ?auto_48849 ) ( ON ?auto_48847 ?auto_48848 ) ( ON ?auto_48846 ?auto_48847 ) ( CLEAR ?auto_48846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48846 )
      ( MAKE-4PILE ?auto_48846 ?auto_48847 ?auto_48848 ?auto_48849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48865 - BLOCK
      ?auto_48866 - BLOCK
      ?auto_48867 - BLOCK
      ?auto_48868 - BLOCK
      ?auto_48869 - BLOCK
    )
    :vars
    (
      ?auto_48870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48868 ) ( ON ?auto_48869 ?auto_48870 ) ( CLEAR ?auto_48869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48865 ) ( ON ?auto_48866 ?auto_48865 ) ( ON ?auto_48867 ?auto_48866 ) ( ON ?auto_48868 ?auto_48867 ) ( not ( = ?auto_48865 ?auto_48866 ) ) ( not ( = ?auto_48865 ?auto_48867 ) ) ( not ( = ?auto_48865 ?auto_48868 ) ) ( not ( = ?auto_48865 ?auto_48869 ) ) ( not ( = ?auto_48865 ?auto_48870 ) ) ( not ( = ?auto_48866 ?auto_48867 ) ) ( not ( = ?auto_48866 ?auto_48868 ) ) ( not ( = ?auto_48866 ?auto_48869 ) ) ( not ( = ?auto_48866 ?auto_48870 ) ) ( not ( = ?auto_48867 ?auto_48868 ) ) ( not ( = ?auto_48867 ?auto_48869 ) ) ( not ( = ?auto_48867 ?auto_48870 ) ) ( not ( = ?auto_48868 ?auto_48869 ) ) ( not ( = ?auto_48868 ?auto_48870 ) ) ( not ( = ?auto_48869 ?auto_48870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48869 ?auto_48870 )
      ( !STACK ?auto_48869 ?auto_48868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48887 - BLOCK
      ?auto_48888 - BLOCK
      ?auto_48889 - BLOCK
      ?auto_48890 - BLOCK
      ?auto_48891 - BLOCK
    )
    :vars
    (
      ?auto_48892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48891 ?auto_48892 ) ( ON-TABLE ?auto_48887 ) ( ON ?auto_48888 ?auto_48887 ) ( ON ?auto_48889 ?auto_48888 ) ( not ( = ?auto_48887 ?auto_48888 ) ) ( not ( = ?auto_48887 ?auto_48889 ) ) ( not ( = ?auto_48887 ?auto_48890 ) ) ( not ( = ?auto_48887 ?auto_48891 ) ) ( not ( = ?auto_48887 ?auto_48892 ) ) ( not ( = ?auto_48888 ?auto_48889 ) ) ( not ( = ?auto_48888 ?auto_48890 ) ) ( not ( = ?auto_48888 ?auto_48891 ) ) ( not ( = ?auto_48888 ?auto_48892 ) ) ( not ( = ?auto_48889 ?auto_48890 ) ) ( not ( = ?auto_48889 ?auto_48891 ) ) ( not ( = ?auto_48889 ?auto_48892 ) ) ( not ( = ?auto_48890 ?auto_48891 ) ) ( not ( = ?auto_48890 ?auto_48892 ) ) ( not ( = ?auto_48891 ?auto_48892 ) ) ( CLEAR ?auto_48889 ) ( ON ?auto_48890 ?auto_48891 ) ( CLEAR ?auto_48890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48887 ?auto_48888 ?auto_48889 ?auto_48890 )
      ( MAKE-5PILE ?auto_48887 ?auto_48888 ?auto_48889 ?auto_48890 ?auto_48891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48909 - BLOCK
      ?auto_48910 - BLOCK
      ?auto_48911 - BLOCK
      ?auto_48912 - BLOCK
      ?auto_48913 - BLOCK
    )
    :vars
    (
      ?auto_48914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48913 ?auto_48914 ) ( ON-TABLE ?auto_48909 ) ( ON ?auto_48910 ?auto_48909 ) ( not ( = ?auto_48909 ?auto_48910 ) ) ( not ( = ?auto_48909 ?auto_48911 ) ) ( not ( = ?auto_48909 ?auto_48912 ) ) ( not ( = ?auto_48909 ?auto_48913 ) ) ( not ( = ?auto_48909 ?auto_48914 ) ) ( not ( = ?auto_48910 ?auto_48911 ) ) ( not ( = ?auto_48910 ?auto_48912 ) ) ( not ( = ?auto_48910 ?auto_48913 ) ) ( not ( = ?auto_48910 ?auto_48914 ) ) ( not ( = ?auto_48911 ?auto_48912 ) ) ( not ( = ?auto_48911 ?auto_48913 ) ) ( not ( = ?auto_48911 ?auto_48914 ) ) ( not ( = ?auto_48912 ?auto_48913 ) ) ( not ( = ?auto_48912 ?auto_48914 ) ) ( not ( = ?auto_48913 ?auto_48914 ) ) ( ON ?auto_48912 ?auto_48913 ) ( CLEAR ?auto_48910 ) ( ON ?auto_48911 ?auto_48912 ) ( CLEAR ?auto_48911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48909 ?auto_48910 ?auto_48911 )
      ( MAKE-5PILE ?auto_48909 ?auto_48910 ?auto_48911 ?auto_48912 ?auto_48913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48931 - BLOCK
      ?auto_48932 - BLOCK
      ?auto_48933 - BLOCK
      ?auto_48934 - BLOCK
      ?auto_48935 - BLOCK
    )
    :vars
    (
      ?auto_48936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48935 ?auto_48936 ) ( ON-TABLE ?auto_48931 ) ( not ( = ?auto_48931 ?auto_48932 ) ) ( not ( = ?auto_48931 ?auto_48933 ) ) ( not ( = ?auto_48931 ?auto_48934 ) ) ( not ( = ?auto_48931 ?auto_48935 ) ) ( not ( = ?auto_48931 ?auto_48936 ) ) ( not ( = ?auto_48932 ?auto_48933 ) ) ( not ( = ?auto_48932 ?auto_48934 ) ) ( not ( = ?auto_48932 ?auto_48935 ) ) ( not ( = ?auto_48932 ?auto_48936 ) ) ( not ( = ?auto_48933 ?auto_48934 ) ) ( not ( = ?auto_48933 ?auto_48935 ) ) ( not ( = ?auto_48933 ?auto_48936 ) ) ( not ( = ?auto_48934 ?auto_48935 ) ) ( not ( = ?auto_48934 ?auto_48936 ) ) ( not ( = ?auto_48935 ?auto_48936 ) ) ( ON ?auto_48934 ?auto_48935 ) ( ON ?auto_48933 ?auto_48934 ) ( CLEAR ?auto_48931 ) ( ON ?auto_48932 ?auto_48933 ) ( CLEAR ?auto_48932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48931 ?auto_48932 )
      ( MAKE-5PILE ?auto_48931 ?auto_48932 ?auto_48933 ?auto_48934 ?auto_48935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48953 - BLOCK
      ?auto_48954 - BLOCK
      ?auto_48955 - BLOCK
      ?auto_48956 - BLOCK
      ?auto_48957 - BLOCK
    )
    :vars
    (
      ?auto_48958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48957 ?auto_48958 ) ( not ( = ?auto_48953 ?auto_48954 ) ) ( not ( = ?auto_48953 ?auto_48955 ) ) ( not ( = ?auto_48953 ?auto_48956 ) ) ( not ( = ?auto_48953 ?auto_48957 ) ) ( not ( = ?auto_48953 ?auto_48958 ) ) ( not ( = ?auto_48954 ?auto_48955 ) ) ( not ( = ?auto_48954 ?auto_48956 ) ) ( not ( = ?auto_48954 ?auto_48957 ) ) ( not ( = ?auto_48954 ?auto_48958 ) ) ( not ( = ?auto_48955 ?auto_48956 ) ) ( not ( = ?auto_48955 ?auto_48957 ) ) ( not ( = ?auto_48955 ?auto_48958 ) ) ( not ( = ?auto_48956 ?auto_48957 ) ) ( not ( = ?auto_48956 ?auto_48958 ) ) ( not ( = ?auto_48957 ?auto_48958 ) ) ( ON ?auto_48956 ?auto_48957 ) ( ON ?auto_48955 ?auto_48956 ) ( ON ?auto_48954 ?auto_48955 ) ( ON ?auto_48953 ?auto_48954 ) ( CLEAR ?auto_48953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48953 )
      ( MAKE-5PILE ?auto_48953 ?auto_48954 ?auto_48955 ?auto_48956 ?auto_48957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48976 - BLOCK
      ?auto_48977 - BLOCK
      ?auto_48978 - BLOCK
      ?auto_48979 - BLOCK
      ?auto_48980 - BLOCK
      ?auto_48981 - BLOCK
    )
    :vars
    (
      ?auto_48982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48980 ) ( ON ?auto_48981 ?auto_48982 ) ( CLEAR ?auto_48981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48976 ) ( ON ?auto_48977 ?auto_48976 ) ( ON ?auto_48978 ?auto_48977 ) ( ON ?auto_48979 ?auto_48978 ) ( ON ?auto_48980 ?auto_48979 ) ( not ( = ?auto_48976 ?auto_48977 ) ) ( not ( = ?auto_48976 ?auto_48978 ) ) ( not ( = ?auto_48976 ?auto_48979 ) ) ( not ( = ?auto_48976 ?auto_48980 ) ) ( not ( = ?auto_48976 ?auto_48981 ) ) ( not ( = ?auto_48976 ?auto_48982 ) ) ( not ( = ?auto_48977 ?auto_48978 ) ) ( not ( = ?auto_48977 ?auto_48979 ) ) ( not ( = ?auto_48977 ?auto_48980 ) ) ( not ( = ?auto_48977 ?auto_48981 ) ) ( not ( = ?auto_48977 ?auto_48982 ) ) ( not ( = ?auto_48978 ?auto_48979 ) ) ( not ( = ?auto_48978 ?auto_48980 ) ) ( not ( = ?auto_48978 ?auto_48981 ) ) ( not ( = ?auto_48978 ?auto_48982 ) ) ( not ( = ?auto_48979 ?auto_48980 ) ) ( not ( = ?auto_48979 ?auto_48981 ) ) ( not ( = ?auto_48979 ?auto_48982 ) ) ( not ( = ?auto_48980 ?auto_48981 ) ) ( not ( = ?auto_48980 ?auto_48982 ) ) ( not ( = ?auto_48981 ?auto_48982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48981 ?auto_48982 )
      ( !STACK ?auto_48981 ?auto_48980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49002 - BLOCK
      ?auto_49003 - BLOCK
      ?auto_49004 - BLOCK
      ?auto_49005 - BLOCK
      ?auto_49006 - BLOCK
      ?auto_49007 - BLOCK
    )
    :vars
    (
      ?auto_49008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49007 ?auto_49008 ) ( ON-TABLE ?auto_49002 ) ( ON ?auto_49003 ?auto_49002 ) ( ON ?auto_49004 ?auto_49003 ) ( ON ?auto_49005 ?auto_49004 ) ( not ( = ?auto_49002 ?auto_49003 ) ) ( not ( = ?auto_49002 ?auto_49004 ) ) ( not ( = ?auto_49002 ?auto_49005 ) ) ( not ( = ?auto_49002 ?auto_49006 ) ) ( not ( = ?auto_49002 ?auto_49007 ) ) ( not ( = ?auto_49002 ?auto_49008 ) ) ( not ( = ?auto_49003 ?auto_49004 ) ) ( not ( = ?auto_49003 ?auto_49005 ) ) ( not ( = ?auto_49003 ?auto_49006 ) ) ( not ( = ?auto_49003 ?auto_49007 ) ) ( not ( = ?auto_49003 ?auto_49008 ) ) ( not ( = ?auto_49004 ?auto_49005 ) ) ( not ( = ?auto_49004 ?auto_49006 ) ) ( not ( = ?auto_49004 ?auto_49007 ) ) ( not ( = ?auto_49004 ?auto_49008 ) ) ( not ( = ?auto_49005 ?auto_49006 ) ) ( not ( = ?auto_49005 ?auto_49007 ) ) ( not ( = ?auto_49005 ?auto_49008 ) ) ( not ( = ?auto_49006 ?auto_49007 ) ) ( not ( = ?auto_49006 ?auto_49008 ) ) ( not ( = ?auto_49007 ?auto_49008 ) ) ( CLEAR ?auto_49005 ) ( ON ?auto_49006 ?auto_49007 ) ( CLEAR ?auto_49006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49002 ?auto_49003 ?auto_49004 ?auto_49005 ?auto_49006 )
      ( MAKE-6PILE ?auto_49002 ?auto_49003 ?auto_49004 ?auto_49005 ?auto_49006 ?auto_49007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49028 - BLOCK
      ?auto_49029 - BLOCK
      ?auto_49030 - BLOCK
      ?auto_49031 - BLOCK
      ?auto_49032 - BLOCK
      ?auto_49033 - BLOCK
    )
    :vars
    (
      ?auto_49034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49033 ?auto_49034 ) ( ON-TABLE ?auto_49028 ) ( ON ?auto_49029 ?auto_49028 ) ( ON ?auto_49030 ?auto_49029 ) ( not ( = ?auto_49028 ?auto_49029 ) ) ( not ( = ?auto_49028 ?auto_49030 ) ) ( not ( = ?auto_49028 ?auto_49031 ) ) ( not ( = ?auto_49028 ?auto_49032 ) ) ( not ( = ?auto_49028 ?auto_49033 ) ) ( not ( = ?auto_49028 ?auto_49034 ) ) ( not ( = ?auto_49029 ?auto_49030 ) ) ( not ( = ?auto_49029 ?auto_49031 ) ) ( not ( = ?auto_49029 ?auto_49032 ) ) ( not ( = ?auto_49029 ?auto_49033 ) ) ( not ( = ?auto_49029 ?auto_49034 ) ) ( not ( = ?auto_49030 ?auto_49031 ) ) ( not ( = ?auto_49030 ?auto_49032 ) ) ( not ( = ?auto_49030 ?auto_49033 ) ) ( not ( = ?auto_49030 ?auto_49034 ) ) ( not ( = ?auto_49031 ?auto_49032 ) ) ( not ( = ?auto_49031 ?auto_49033 ) ) ( not ( = ?auto_49031 ?auto_49034 ) ) ( not ( = ?auto_49032 ?auto_49033 ) ) ( not ( = ?auto_49032 ?auto_49034 ) ) ( not ( = ?auto_49033 ?auto_49034 ) ) ( ON ?auto_49032 ?auto_49033 ) ( CLEAR ?auto_49030 ) ( ON ?auto_49031 ?auto_49032 ) ( CLEAR ?auto_49031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49028 ?auto_49029 ?auto_49030 ?auto_49031 )
      ( MAKE-6PILE ?auto_49028 ?auto_49029 ?auto_49030 ?auto_49031 ?auto_49032 ?auto_49033 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49054 - BLOCK
      ?auto_49055 - BLOCK
      ?auto_49056 - BLOCK
      ?auto_49057 - BLOCK
      ?auto_49058 - BLOCK
      ?auto_49059 - BLOCK
    )
    :vars
    (
      ?auto_49060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49059 ?auto_49060 ) ( ON-TABLE ?auto_49054 ) ( ON ?auto_49055 ?auto_49054 ) ( not ( = ?auto_49054 ?auto_49055 ) ) ( not ( = ?auto_49054 ?auto_49056 ) ) ( not ( = ?auto_49054 ?auto_49057 ) ) ( not ( = ?auto_49054 ?auto_49058 ) ) ( not ( = ?auto_49054 ?auto_49059 ) ) ( not ( = ?auto_49054 ?auto_49060 ) ) ( not ( = ?auto_49055 ?auto_49056 ) ) ( not ( = ?auto_49055 ?auto_49057 ) ) ( not ( = ?auto_49055 ?auto_49058 ) ) ( not ( = ?auto_49055 ?auto_49059 ) ) ( not ( = ?auto_49055 ?auto_49060 ) ) ( not ( = ?auto_49056 ?auto_49057 ) ) ( not ( = ?auto_49056 ?auto_49058 ) ) ( not ( = ?auto_49056 ?auto_49059 ) ) ( not ( = ?auto_49056 ?auto_49060 ) ) ( not ( = ?auto_49057 ?auto_49058 ) ) ( not ( = ?auto_49057 ?auto_49059 ) ) ( not ( = ?auto_49057 ?auto_49060 ) ) ( not ( = ?auto_49058 ?auto_49059 ) ) ( not ( = ?auto_49058 ?auto_49060 ) ) ( not ( = ?auto_49059 ?auto_49060 ) ) ( ON ?auto_49058 ?auto_49059 ) ( ON ?auto_49057 ?auto_49058 ) ( CLEAR ?auto_49055 ) ( ON ?auto_49056 ?auto_49057 ) ( CLEAR ?auto_49056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49054 ?auto_49055 ?auto_49056 )
      ( MAKE-6PILE ?auto_49054 ?auto_49055 ?auto_49056 ?auto_49057 ?auto_49058 ?auto_49059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49080 - BLOCK
      ?auto_49081 - BLOCK
      ?auto_49082 - BLOCK
      ?auto_49083 - BLOCK
      ?auto_49084 - BLOCK
      ?auto_49085 - BLOCK
    )
    :vars
    (
      ?auto_49086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49085 ?auto_49086 ) ( ON-TABLE ?auto_49080 ) ( not ( = ?auto_49080 ?auto_49081 ) ) ( not ( = ?auto_49080 ?auto_49082 ) ) ( not ( = ?auto_49080 ?auto_49083 ) ) ( not ( = ?auto_49080 ?auto_49084 ) ) ( not ( = ?auto_49080 ?auto_49085 ) ) ( not ( = ?auto_49080 ?auto_49086 ) ) ( not ( = ?auto_49081 ?auto_49082 ) ) ( not ( = ?auto_49081 ?auto_49083 ) ) ( not ( = ?auto_49081 ?auto_49084 ) ) ( not ( = ?auto_49081 ?auto_49085 ) ) ( not ( = ?auto_49081 ?auto_49086 ) ) ( not ( = ?auto_49082 ?auto_49083 ) ) ( not ( = ?auto_49082 ?auto_49084 ) ) ( not ( = ?auto_49082 ?auto_49085 ) ) ( not ( = ?auto_49082 ?auto_49086 ) ) ( not ( = ?auto_49083 ?auto_49084 ) ) ( not ( = ?auto_49083 ?auto_49085 ) ) ( not ( = ?auto_49083 ?auto_49086 ) ) ( not ( = ?auto_49084 ?auto_49085 ) ) ( not ( = ?auto_49084 ?auto_49086 ) ) ( not ( = ?auto_49085 ?auto_49086 ) ) ( ON ?auto_49084 ?auto_49085 ) ( ON ?auto_49083 ?auto_49084 ) ( ON ?auto_49082 ?auto_49083 ) ( CLEAR ?auto_49080 ) ( ON ?auto_49081 ?auto_49082 ) ( CLEAR ?auto_49081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49080 ?auto_49081 )
      ( MAKE-6PILE ?auto_49080 ?auto_49081 ?auto_49082 ?auto_49083 ?auto_49084 ?auto_49085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_49106 - BLOCK
      ?auto_49107 - BLOCK
      ?auto_49108 - BLOCK
      ?auto_49109 - BLOCK
      ?auto_49110 - BLOCK
      ?auto_49111 - BLOCK
    )
    :vars
    (
      ?auto_49112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49111 ?auto_49112 ) ( not ( = ?auto_49106 ?auto_49107 ) ) ( not ( = ?auto_49106 ?auto_49108 ) ) ( not ( = ?auto_49106 ?auto_49109 ) ) ( not ( = ?auto_49106 ?auto_49110 ) ) ( not ( = ?auto_49106 ?auto_49111 ) ) ( not ( = ?auto_49106 ?auto_49112 ) ) ( not ( = ?auto_49107 ?auto_49108 ) ) ( not ( = ?auto_49107 ?auto_49109 ) ) ( not ( = ?auto_49107 ?auto_49110 ) ) ( not ( = ?auto_49107 ?auto_49111 ) ) ( not ( = ?auto_49107 ?auto_49112 ) ) ( not ( = ?auto_49108 ?auto_49109 ) ) ( not ( = ?auto_49108 ?auto_49110 ) ) ( not ( = ?auto_49108 ?auto_49111 ) ) ( not ( = ?auto_49108 ?auto_49112 ) ) ( not ( = ?auto_49109 ?auto_49110 ) ) ( not ( = ?auto_49109 ?auto_49111 ) ) ( not ( = ?auto_49109 ?auto_49112 ) ) ( not ( = ?auto_49110 ?auto_49111 ) ) ( not ( = ?auto_49110 ?auto_49112 ) ) ( not ( = ?auto_49111 ?auto_49112 ) ) ( ON ?auto_49110 ?auto_49111 ) ( ON ?auto_49109 ?auto_49110 ) ( ON ?auto_49108 ?auto_49109 ) ( ON ?auto_49107 ?auto_49108 ) ( ON ?auto_49106 ?auto_49107 ) ( CLEAR ?auto_49106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49106 )
      ( MAKE-6PILE ?auto_49106 ?auto_49107 ?auto_49108 ?auto_49109 ?auto_49110 ?auto_49111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49133 - BLOCK
      ?auto_49134 - BLOCK
      ?auto_49135 - BLOCK
      ?auto_49136 - BLOCK
      ?auto_49137 - BLOCK
      ?auto_49138 - BLOCK
      ?auto_49139 - BLOCK
    )
    :vars
    (
      ?auto_49140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49138 ) ( ON ?auto_49139 ?auto_49140 ) ( CLEAR ?auto_49139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49133 ) ( ON ?auto_49134 ?auto_49133 ) ( ON ?auto_49135 ?auto_49134 ) ( ON ?auto_49136 ?auto_49135 ) ( ON ?auto_49137 ?auto_49136 ) ( ON ?auto_49138 ?auto_49137 ) ( not ( = ?auto_49133 ?auto_49134 ) ) ( not ( = ?auto_49133 ?auto_49135 ) ) ( not ( = ?auto_49133 ?auto_49136 ) ) ( not ( = ?auto_49133 ?auto_49137 ) ) ( not ( = ?auto_49133 ?auto_49138 ) ) ( not ( = ?auto_49133 ?auto_49139 ) ) ( not ( = ?auto_49133 ?auto_49140 ) ) ( not ( = ?auto_49134 ?auto_49135 ) ) ( not ( = ?auto_49134 ?auto_49136 ) ) ( not ( = ?auto_49134 ?auto_49137 ) ) ( not ( = ?auto_49134 ?auto_49138 ) ) ( not ( = ?auto_49134 ?auto_49139 ) ) ( not ( = ?auto_49134 ?auto_49140 ) ) ( not ( = ?auto_49135 ?auto_49136 ) ) ( not ( = ?auto_49135 ?auto_49137 ) ) ( not ( = ?auto_49135 ?auto_49138 ) ) ( not ( = ?auto_49135 ?auto_49139 ) ) ( not ( = ?auto_49135 ?auto_49140 ) ) ( not ( = ?auto_49136 ?auto_49137 ) ) ( not ( = ?auto_49136 ?auto_49138 ) ) ( not ( = ?auto_49136 ?auto_49139 ) ) ( not ( = ?auto_49136 ?auto_49140 ) ) ( not ( = ?auto_49137 ?auto_49138 ) ) ( not ( = ?auto_49137 ?auto_49139 ) ) ( not ( = ?auto_49137 ?auto_49140 ) ) ( not ( = ?auto_49138 ?auto_49139 ) ) ( not ( = ?auto_49138 ?auto_49140 ) ) ( not ( = ?auto_49139 ?auto_49140 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49139 ?auto_49140 )
      ( !STACK ?auto_49139 ?auto_49138 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49163 - BLOCK
      ?auto_49164 - BLOCK
      ?auto_49165 - BLOCK
      ?auto_49166 - BLOCK
      ?auto_49167 - BLOCK
      ?auto_49168 - BLOCK
      ?auto_49169 - BLOCK
    )
    :vars
    (
      ?auto_49170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49169 ?auto_49170 ) ( ON-TABLE ?auto_49163 ) ( ON ?auto_49164 ?auto_49163 ) ( ON ?auto_49165 ?auto_49164 ) ( ON ?auto_49166 ?auto_49165 ) ( ON ?auto_49167 ?auto_49166 ) ( not ( = ?auto_49163 ?auto_49164 ) ) ( not ( = ?auto_49163 ?auto_49165 ) ) ( not ( = ?auto_49163 ?auto_49166 ) ) ( not ( = ?auto_49163 ?auto_49167 ) ) ( not ( = ?auto_49163 ?auto_49168 ) ) ( not ( = ?auto_49163 ?auto_49169 ) ) ( not ( = ?auto_49163 ?auto_49170 ) ) ( not ( = ?auto_49164 ?auto_49165 ) ) ( not ( = ?auto_49164 ?auto_49166 ) ) ( not ( = ?auto_49164 ?auto_49167 ) ) ( not ( = ?auto_49164 ?auto_49168 ) ) ( not ( = ?auto_49164 ?auto_49169 ) ) ( not ( = ?auto_49164 ?auto_49170 ) ) ( not ( = ?auto_49165 ?auto_49166 ) ) ( not ( = ?auto_49165 ?auto_49167 ) ) ( not ( = ?auto_49165 ?auto_49168 ) ) ( not ( = ?auto_49165 ?auto_49169 ) ) ( not ( = ?auto_49165 ?auto_49170 ) ) ( not ( = ?auto_49166 ?auto_49167 ) ) ( not ( = ?auto_49166 ?auto_49168 ) ) ( not ( = ?auto_49166 ?auto_49169 ) ) ( not ( = ?auto_49166 ?auto_49170 ) ) ( not ( = ?auto_49167 ?auto_49168 ) ) ( not ( = ?auto_49167 ?auto_49169 ) ) ( not ( = ?auto_49167 ?auto_49170 ) ) ( not ( = ?auto_49168 ?auto_49169 ) ) ( not ( = ?auto_49168 ?auto_49170 ) ) ( not ( = ?auto_49169 ?auto_49170 ) ) ( CLEAR ?auto_49167 ) ( ON ?auto_49168 ?auto_49169 ) ( CLEAR ?auto_49168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49163 ?auto_49164 ?auto_49165 ?auto_49166 ?auto_49167 ?auto_49168 )
      ( MAKE-7PILE ?auto_49163 ?auto_49164 ?auto_49165 ?auto_49166 ?auto_49167 ?auto_49168 ?auto_49169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49193 - BLOCK
      ?auto_49194 - BLOCK
      ?auto_49195 - BLOCK
      ?auto_49196 - BLOCK
      ?auto_49197 - BLOCK
      ?auto_49198 - BLOCK
      ?auto_49199 - BLOCK
    )
    :vars
    (
      ?auto_49200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49199 ?auto_49200 ) ( ON-TABLE ?auto_49193 ) ( ON ?auto_49194 ?auto_49193 ) ( ON ?auto_49195 ?auto_49194 ) ( ON ?auto_49196 ?auto_49195 ) ( not ( = ?auto_49193 ?auto_49194 ) ) ( not ( = ?auto_49193 ?auto_49195 ) ) ( not ( = ?auto_49193 ?auto_49196 ) ) ( not ( = ?auto_49193 ?auto_49197 ) ) ( not ( = ?auto_49193 ?auto_49198 ) ) ( not ( = ?auto_49193 ?auto_49199 ) ) ( not ( = ?auto_49193 ?auto_49200 ) ) ( not ( = ?auto_49194 ?auto_49195 ) ) ( not ( = ?auto_49194 ?auto_49196 ) ) ( not ( = ?auto_49194 ?auto_49197 ) ) ( not ( = ?auto_49194 ?auto_49198 ) ) ( not ( = ?auto_49194 ?auto_49199 ) ) ( not ( = ?auto_49194 ?auto_49200 ) ) ( not ( = ?auto_49195 ?auto_49196 ) ) ( not ( = ?auto_49195 ?auto_49197 ) ) ( not ( = ?auto_49195 ?auto_49198 ) ) ( not ( = ?auto_49195 ?auto_49199 ) ) ( not ( = ?auto_49195 ?auto_49200 ) ) ( not ( = ?auto_49196 ?auto_49197 ) ) ( not ( = ?auto_49196 ?auto_49198 ) ) ( not ( = ?auto_49196 ?auto_49199 ) ) ( not ( = ?auto_49196 ?auto_49200 ) ) ( not ( = ?auto_49197 ?auto_49198 ) ) ( not ( = ?auto_49197 ?auto_49199 ) ) ( not ( = ?auto_49197 ?auto_49200 ) ) ( not ( = ?auto_49198 ?auto_49199 ) ) ( not ( = ?auto_49198 ?auto_49200 ) ) ( not ( = ?auto_49199 ?auto_49200 ) ) ( ON ?auto_49198 ?auto_49199 ) ( CLEAR ?auto_49196 ) ( ON ?auto_49197 ?auto_49198 ) ( CLEAR ?auto_49197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49193 ?auto_49194 ?auto_49195 ?auto_49196 ?auto_49197 )
      ( MAKE-7PILE ?auto_49193 ?auto_49194 ?auto_49195 ?auto_49196 ?auto_49197 ?auto_49198 ?auto_49199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49223 - BLOCK
      ?auto_49224 - BLOCK
      ?auto_49225 - BLOCK
      ?auto_49226 - BLOCK
      ?auto_49227 - BLOCK
      ?auto_49228 - BLOCK
      ?auto_49229 - BLOCK
    )
    :vars
    (
      ?auto_49230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49229 ?auto_49230 ) ( ON-TABLE ?auto_49223 ) ( ON ?auto_49224 ?auto_49223 ) ( ON ?auto_49225 ?auto_49224 ) ( not ( = ?auto_49223 ?auto_49224 ) ) ( not ( = ?auto_49223 ?auto_49225 ) ) ( not ( = ?auto_49223 ?auto_49226 ) ) ( not ( = ?auto_49223 ?auto_49227 ) ) ( not ( = ?auto_49223 ?auto_49228 ) ) ( not ( = ?auto_49223 ?auto_49229 ) ) ( not ( = ?auto_49223 ?auto_49230 ) ) ( not ( = ?auto_49224 ?auto_49225 ) ) ( not ( = ?auto_49224 ?auto_49226 ) ) ( not ( = ?auto_49224 ?auto_49227 ) ) ( not ( = ?auto_49224 ?auto_49228 ) ) ( not ( = ?auto_49224 ?auto_49229 ) ) ( not ( = ?auto_49224 ?auto_49230 ) ) ( not ( = ?auto_49225 ?auto_49226 ) ) ( not ( = ?auto_49225 ?auto_49227 ) ) ( not ( = ?auto_49225 ?auto_49228 ) ) ( not ( = ?auto_49225 ?auto_49229 ) ) ( not ( = ?auto_49225 ?auto_49230 ) ) ( not ( = ?auto_49226 ?auto_49227 ) ) ( not ( = ?auto_49226 ?auto_49228 ) ) ( not ( = ?auto_49226 ?auto_49229 ) ) ( not ( = ?auto_49226 ?auto_49230 ) ) ( not ( = ?auto_49227 ?auto_49228 ) ) ( not ( = ?auto_49227 ?auto_49229 ) ) ( not ( = ?auto_49227 ?auto_49230 ) ) ( not ( = ?auto_49228 ?auto_49229 ) ) ( not ( = ?auto_49228 ?auto_49230 ) ) ( not ( = ?auto_49229 ?auto_49230 ) ) ( ON ?auto_49228 ?auto_49229 ) ( ON ?auto_49227 ?auto_49228 ) ( CLEAR ?auto_49225 ) ( ON ?auto_49226 ?auto_49227 ) ( CLEAR ?auto_49226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49223 ?auto_49224 ?auto_49225 ?auto_49226 )
      ( MAKE-7PILE ?auto_49223 ?auto_49224 ?auto_49225 ?auto_49226 ?auto_49227 ?auto_49228 ?auto_49229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49253 - BLOCK
      ?auto_49254 - BLOCK
      ?auto_49255 - BLOCK
      ?auto_49256 - BLOCK
      ?auto_49257 - BLOCK
      ?auto_49258 - BLOCK
      ?auto_49259 - BLOCK
    )
    :vars
    (
      ?auto_49260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49259 ?auto_49260 ) ( ON-TABLE ?auto_49253 ) ( ON ?auto_49254 ?auto_49253 ) ( not ( = ?auto_49253 ?auto_49254 ) ) ( not ( = ?auto_49253 ?auto_49255 ) ) ( not ( = ?auto_49253 ?auto_49256 ) ) ( not ( = ?auto_49253 ?auto_49257 ) ) ( not ( = ?auto_49253 ?auto_49258 ) ) ( not ( = ?auto_49253 ?auto_49259 ) ) ( not ( = ?auto_49253 ?auto_49260 ) ) ( not ( = ?auto_49254 ?auto_49255 ) ) ( not ( = ?auto_49254 ?auto_49256 ) ) ( not ( = ?auto_49254 ?auto_49257 ) ) ( not ( = ?auto_49254 ?auto_49258 ) ) ( not ( = ?auto_49254 ?auto_49259 ) ) ( not ( = ?auto_49254 ?auto_49260 ) ) ( not ( = ?auto_49255 ?auto_49256 ) ) ( not ( = ?auto_49255 ?auto_49257 ) ) ( not ( = ?auto_49255 ?auto_49258 ) ) ( not ( = ?auto_49255 ?auto_49259 ) ) ( not ( = ?auto_49255 ?auto_49260 ) ) ( not ( = ?auto_49256 ?auto_49257 ) ) ( not ( = ?auto_49256 ?auto_49258 ) ) ( not ( = ?auto_49256 ?auto_49259 ) ) ( not ( = ?auto_49256 ?auto_49260 ) ) ( not ( = ?auto_49257 ?auto_49258 ) ) ( not ( = ?auto_49257 ?auto_49259 ) ) ( not ( = ?auto_49257 ?auto_49260 ) ) ( not ( = ?auto_49258 ?auto_49259 ) ) ( not ( = ?auto_49258 ?auto_49260 ) ) ( not ( = ?auto_49259 ?auto_49260 ) ) ( ON ?auto_49258 ?auto_49259 ) ( ON ?auto_49257 ?auto_49258 ) ( ON ?auto_49256 ?auto_49257 ) ( CLEAR ?auto_49254 ) ( ON ?auto_49255 ?auto_49256 ) ( CLEAR ?auto_49255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49253 ?auto_49254 ?auto_49255 )
      ( MAKE-7PILE ?auto_49253 ?auto_49254 ?auto_49255 ?auto_49256 ?auto_49257 ?auto_49258 ?auto_49259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49283 - BLOCK
      ?auto_49284 - BLOCK
      ?auto_49285 - BLOCK
      ?auto_49286 - BLOCK
      ?auto_49287 - BLOCK
      ?auto_49288 - BLOCK
      ?auto_49289 - BLOCK
    )
    :vars
    (
      ?auto_49290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49289 ?auto_49290 ) ( ON-TABLE ?auto_49283 ) ( not ( = ?auto_49283 ?auto_49284 ) ) ( not ( = ?auto_49283 ?auto_49285 ) ) ( not ( = ?auto_49283 ?auto_49286 ) ) ( not ( = ?auto_49283 ?auto_49287 ) ) ( not ( = ?auto_49283 ?auto_49288 ) ) ( not ( = ?auto_49283 ?auto_49289 ) ) ( not ( = ?auto_49283 ?auto_49290 ) ) ( not ( = ?auto_49284 ?auto_49285 ) ) ( not ( = ?auto_49284 ?auto_49286 ) ) ( not ( = ?auto_49284 ?auto_49287 ) ) ( not ( = ?auto_49284 ?auto_49288 ) ) ( not ( = ?auto_49284 ?auto_49289 ) ) ( not ( = ?auto_49284 ?auto_49290 ) ) ( not ( = ?auto_49285 ?auto_49286 ) ) ( not ( = ?auto_49285 ?auto_49287 ) ) ( not ( = ?auto_49285 ?auto_49288 ) ) ( not ( = ?auto_49285 ?auto_49289 ) ) ( not ( = ?auto_49285 ?auto_49290 ) ) ( not ( = ?auto_49286 ?auto_49287 ) ) ( not ( = ?auto_49286 ?auto_49288 ) ) ( not ( = ?auto_49286 ?auto_49289 ) ) ( not ( = ?auto_49286 ?auto_49290 ) ) ( not ( = ?auto_49287 ?auto_49288 ) ) ( not ( = ?auto_49287 ?auto_49289 ) ) ( not ( = ?auto_49287 ?auto_49290 ) ) ( not ( = ?auto_49288 ?auto_49289 ) ) ( not ( = ?auto_49288 ?auto_49290 ) ) ( not ( = ?auto_49289 ?auto_49290 ) ) ( ON ?auto_49288 ?auto_49289 ) ( ON ?auto_49287 ?auto_49288 ) ( ON ?auto_49286 ?auto_49287 ) ( ON ?auto_49285 ?auto_49286 ) ( CLEAR ?auto_49283 ) ( ON ?auto_49284 ?auto_49285 ) ( CLEAR ?auto_49284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49283 ?auto_49284 )
      ( MAKE-7PILE ?auto_49283 ?auto_49284 ?auto_49285 ?auto_49286 ?auto_49287 ?auto_49288 ?auto_49289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_49313 - BLOCK
      ?auto_49314 - BLOCK
      ?auto_49315 - BLOCK
      ?auto_49316 - BLOCK
      ?auto_49317 - BLOCK
      ?auto_49318 - BLOCK
      ?auto_49319 - BLOCK
    )
    :vars
    (
      ?auto_49320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49319 ?auto_49320 ) ( not ( = ?auto_49313 ?auto_49314 ) ) ( not ( = ?auto_49313 ?auto_49315 ) ) ( not ( = ?auto_49313 ?auto_49316 ) ) ( not ( = ?auto_49313 ?auto_49317 ) ) ( not ( = ?auto_49313 ?auto_49318 ) ) ( not ( = ?auto_49313 ?auto_49319 ) ) ( not ( = ?auto_49313 ?auto_49320 ) ) ( not ( = ?auto_49314 ?auto_49315 ) ) ( not ( = ?auto_49314 ?auto_49316 ) ) ( not ( = ?auto_49314 ?auto_49317 ) ) ( not ( = ?auto_49314 ?auto_49318 ) ) ( not ( = ?auto_49314 ?auto_49319 ) ) ( not ( = ?auto_49314 ?auto_49320 ) ) ( not ( = ?auto_49315 ?auto_49316 ) ) ( not ( = ?auto_49315 ?auto_49317 ) ) ( not ( = ?auto_49315 ?auto_49318 ) ) ( not ( = ?auto_49315 ?auto_49319 ) ) ( not ( = ?auto_49315 ?auto_49320 ) ) ( not ( = ?auto_49316 ?auto_49317 ) ) ( not ( = ?auto_49316 ?auto_49318 ) ) ( not ( = ?auto_49316 ?auto_49319 ) ) ( not ( = ?auto_49316 ?auto_49320 ) ) ( not ( = ?auto_49317 ?auto_49318 ) ) ( not ( = ?auto_49317 ?auto_49319 ) ) ( not ( = ?auto_49317 ?auto_49320 ) ) ( not ( = ?auto_49318 ?auto_49319 ) ) ( not ( = ?auto_49318 ?auto_49320 ) ) ( not ( = ?auto_49319 ?auto_49320 ) ) ( ON ?auto_49318 ?auto_49319 ) ( ON ?auto_49317 ?auto_49318 ) ( ON ?auto_49316 ?auto_49317 ) ( ON ?auto_49315 ?auto_49316 ) ( ON ?auto_49314 ?auto_49315 ) ( ON ?auto_49313 ?auto_49314 ) ( CLEAR ?auto_49313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49313 )
      ( MAKE-7PILE ?auto_49313 ?auto_49314 ?auto_49315 ?auto_49316 ?auto_49317 ?auto_49318 ?auto_49319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49344 - BLOCK
      ?auto_49345 - BLOCK
      ?auto_49346 - BLOCK
      ?auto_49347 - BLOCK
      ?auto_49348 - BLOCK
      ?auto_49349 - BLOCK
      ?auto_49350 - BLOCK
      ?auto_49351 - BLOCK
    )
    :vars
    (
      ?auto_49352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49350 ) ( ON ?auto_49351 ?auto_49352 ) ( CLEAR ?auto_49351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49344 ) ( ON ?auto_49345 ?auto_49344 ) ( ON ?auto_49346 ?auto_49345 ) ( ON ?auto_49347 ?auto_49346 ) ( ON ?auto_49348 ?auto_49347 ) ( ON ?auto_49349 ?auto_49348 ) ( ON ?auto_49350 ?auto_49349 ) ( not ( = ?auto_49344 ?auto_49345 ) ) ( not ( = ?auto_49344 ?auto_49346 ) ) ( not ( = ?auto_49344 ?auto_49347 ) ) ( not ( = ?auto_49344 ?auto_49348 ) ) ( not ( = ?auto_49344 ?auto_49349 ) ) ( not ( = ?auto_49344 ?auto_49350 ) ) ( not ( = ?auto_49344 ?auto_49351 ) ) ( not ( = ?auto_49344 ?auto_49352 ) ) ( not ( = ?auto_49345 ?auto_49346 ) ) ( not ( = ?auto_49345 ?auto_49347 ) ) ( not ( = ?auto_49345 ?auto_49348 ) ) ( not ( = ?auto_49345 ?auto_49349 ) ) ( not ( = ?auto_49345 ?auto_49350 ) ) ( not ( = ?auto_49345 ?auto_49351 ) ) ( not ( = ?auto_49345 ?auto_49352 ) ) ( not ( = ?auto_49346 ?auto_49347 ) ) ( not ( = ?auto_49346 ?auto_49348 ) ) ( not ( = ?auto_49346 ?auto_49349 ) ) ( not ( = ?auto_49346 ?auto_49350 ) ) ( not ( = ?auto_49346 ?auto_49351 ) ) ( not ( = ?auto_49346 ?auto_49352 ) ) ( not ( = ?auto_49347 ?auto_49348 ) ) ( not ( = ?auto_49347 ?auto_49349 ) ) ( not ( = ?auto_49347 ?auto_49350 ) ) ( not ( = ?auto_49347 ?auto_49351 ) ) ( not ( = ?auto_49347 ?auto_49352 ) ) ( not ( = ?auto_49348 ?auto_49349 ) ) ( not ( = ?auto_49348 ?auto_49350 ) ) ( not ( = ?auto_49348 ?auto_49351 ) ) ( not ( = ?auto_49348 ?auto_49352 ) ) ( not ( = ?auto_49349 ?auto_49350 ) ) ( not ( = ?auto_49349 ?auto_49351 ) ) ( not ( = ?auto_49349 ?auto_49352 ) ) ( not ( = ?auto_49350 ?auto_49351 ) ) ( not ( = ?auto_49350 ?auto_49352 ) ) ( not ( = ?auto_49351 ?auto_49352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49351 ?auto_49352 )
      ( !STACK ?auto_49351 ?auto_49350 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49378 - BLOCK
      ?auto_49379 - BLOCK
      ?auto_49380 - BLOCK
      ?auto_49381 - BLOCK
      ?auto_49382 - BLOCK
      ?auto_49383 - BLOCK
      ?auto_49384 - BLOCK
      ?auto_49385 - BLOCK
    )
    :vars
    (
      ?auto_49386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49385 ?auto_49386 ) ( ON-TABLE ?auto_49378 ) ( ON ?auto_49379 ?auto_49378 ) ( ON ?auto_49380 ?auto_49379 ) ( ON ?auto_49381 ?auto_49380 ) ( ON ?auto_49382 ?auto_49381 ) ( ON ?auto_49383 ?auto_49382 ) ( not ( = ?auto_49378 ?auto_49379 ) ) ( not ( = ?auto_49378 ?auto_49380 ) ) ( not ( = ?auto_49378 ?auto_49381 ) ) ( not ( = ?auto_49378 ?auto_49382 ) ) ( not ( = ?auto_49378 ?auto_49383 ) ) ( not ( = ?auto_49378 ?auto_49384 ) ) ( not ( = ?auto_49378 ?auto_49385 ) ) ( not ( = ?auto_49378 ?auto_49386 ) ) ( not ( = ?auto_49379 ?auto_49380 ) ) ( not ( = ?auto_49379 ?auto_49381 ) ) ( not ( = ?auto_49379 ?auto_49382 ) ) ( not ( = ?auto_49379 ?auto_49383 ) ) ( not ( = ?auto_49379 ?auto_49384 ) ) ( not ( = ?auto_49379 ?auto_49385 ) ) ( not ( = ?auto_49379 ?auto_49386 ) ) ( not ( = ?auto_49380 ?auto_49381 ) ) ( not ( = ?auto_49380 ?auto_49382 ) ) ( not ( = ?auto_49380 ?auto_49383 ) ) ( not ( = ?auto_49380 ?auto_49384 ) ) ( not ( = ?auto_49380 ?auto_49385 ) ) ( not ( = ?auto_49380 ?auto_49386 ) ) ( not ( = ?auto_49381 ?auto_49382 ) ) ( not ( = ?auto_49381 ?auto_49383 ) ) ( not ( = ?auto_49381 ?auto_49384 ) ) ( not ( = ?auto_49381 ?auto_49385 ) ) ( not ( = ?auto_49381 ?auto_49386 ) ) ( not ( = ?auto_49382 ?auto_49383 ) ) ( not ( = ?auto_49382 ?auto_49384 ) ) ( not ( = ?auto_49382 ?auto_49385 ) ) ( not ( = ?auto_49382 ?auto_49386 ) ) ( not ( = ?auto_49383 ?auto_49384 ) ) ( not ( = ?auto_49383 ?auto_49385 ) ) ( not ( = ?auto_49383 ?auto_49386 ) ) ( not ( = ?auto_49384 ?auto_49385 ) ) ( not ( = ?auto_49384 ?auto_49386 ) ) ( not ( = ?auto_49385 ?auto_49386 ) ) ( CLEAR ?auto_49383 ) ( ON ?auto_49384 ?auto_49385 ) ( CLEAR ?auto_49384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49378 ?auto_49379 ?auto_49380 ?auto_49381 ?auto_49382 ?auto_49383 ?auto_49384 )
      ( MAKE-8PILE ?auto_49378 ?auto_49379 ?auto_49380 ?auto_49381 ?auto_49382 ?auto_49383 ?auto_49384 ?auto_49385 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49412 - BLOCK
      ?auto_49413 - BLOCK
      ?auto_49414 - BLOCK
      ?auto_49415 - BLOCK
      ?auto_49416 - BLOCK
      ?auto_49417 - BLOCK
      ?auto_49418 - BLOCK
      ?auto_49419 - BLOCK
    )
    :vars
    (
      ?auto_49420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49419 ?auto_49420 ) ( ON-TABLE ?auto_49412 ) ( ON ?auto_49413 ?auto_49412 ) ( ON ?auto_49414 ?auto_49413 ) ( ON ?auto_49415 ?auto_49414 ) ( ON ?auto_49416 ?auto_49415 ) ( not ( = ?auto_49412 ?auto_49413 ) ) ( not ( = ?auto_49412 ?auto_49414 ) ) ( not ( = ?auto_49412 ?auto_49415 ) ) ( not ( = ?auto_49412 ?auto_49416 ) ) ( not ( = ?auto_49412 ?auto_49417 ) ) ( not ( = ?auto_49412 ?auto_49418 ) ) ( not ( = ?auto_49412 ?auto_49419 ) ) ( not ( = ?auto_49412 ?auto_49420 ) ) ( not ( = ?auto_49413 ?auto_49414 ) ) ( not ( = ?auto_49413 ?auto_49415 ) ) ( not ( = ?auto_49413 ?auto_49416 ) ) ( not ( = ?auto_49413 ?auto_49417 ) ) ( not ( = ?auto_49413 ?auto_49418 ) ) ( not ( = ?auto_49413 ?auto_49419 ) ) ( not ( = ?auto_49413 ?auto_49420 ) ) ( not ( = ?auto_49414 ?auto_49415 ) ) ( not ( = ?auto_49414 ?auto_49416 ) ) ( not ( = ?auto_49414 ?auto_49417 ) ) ( not ( = ?auto_49414 ?auto_49418 ) ) ( not ( = ?auto_49414 ?auto_49419 ) ) ( not ( = ?auto_49414 ?auto_49420 ) ) ( not ( = ?auto_49415 ?auto_49416 ) ) ( not ( = ?auto_49415 ?auto_49417 ) ) ( not ( = ?auto_49415 ?auto_49418 ) ) ( not ( = ?auto_49415 ?auto_49419 ) ) ( not ( = ?auto_49415 ?auto_49420 ) ) ( not ( = ?auto_49416 ?auto_49417 ) ) ( not ( = ?auto_49416 ?auto_49418 ) ) ( not ( = ?auto_49416 ?auto_49419 ) ) ( not ( = ?auto_49416 ?auto_49420 ) ) ( not ( = ?auto_49417 ?auto_49418 ) ) ( not ( = ?auto_49417 ?auto_49419 ) ) ( not ( = ?auto_49417 ?auto_49420 ) ) ( not ( = ?auto_49418 ?auto_49419 ) ) ( not ( = ?auto_49418 ?auto_49420 ) ) ( not ( = ?auto_49419 ?auto_49420 ) ) ( ON ?auto_49418 ?auto_49419 ) ( CLEAR ?auto_49416 ) ( ON ?auto_49417 ?auto_49418 ) ( CLEAR ?auto_49417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49412 ?auto_49413 ?auto_49414 ?auto_49415 ?auto_49416 ?auto_49417 )
      ( MAKE-8PILE ?auto_49412 ?auto_49413 ?auto_49414 ?auto_49415 ?auto_49416 ?auto_49417 ?auto_49418 ?auto_49419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49446 - BLOCK
      ?auto_49447 - BLOCK
      ?auto_49448 - BLOCK
      ?auto_49449 - BLOCK
      ?auto_49450 - BLOCK
      ?auto_49451 - BLOCK
      ?auto_49452 - BLOCK
      ?auto_49453 - BLOCK
    )
    :vars
    (
      ?auto_49454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49453 ?auto_49454 ) ( ON-TABLE ?auto_49446 ) ( ON ?auto_49447 ?auto_49446 ) ( ON ?auto_49448 ?auto_49447 ) ( ON ?auto_49449 ?auto_49448 ) ( not ( = ?auto_49446 ?auto_49447 ) ) ( not ( = ?auto_49446 ?auto_49448 ) ) ( not ( = ?auto_49446 ?auto_49449 ) ) ( not ( = ?auto_49446 ?auto_49450 ) ) ( not ( = ?auto_49446 ?auto_49451 ) ) ( not ( = ?auto_49446 ?auto_49452 ) ) ( not ( = ?auto_49446 ?auto_49453 ) ) ( not ( = ?auto_49446 ?auto_49454 ) ) ( not ( = ?auto_49447 ?auto_49448 ) ) ( not ( = ?auto_49447 ?auto_49449 ) ) ( not ( = ?auto_49447 ?auto_49450 ) ) ( not ( = ?auto_49447 ?auto_49451 ) ) ( not ( = ?auto_49447 ?auto_49452 ) ) ( not ( = ?auto_49447 ?auto_49453 ) ) ( not ( = ?auto_49447 ?auto_49454 ) ) ( not ( = ?auto_49448 ?auto_49449 ) ) ( not ( = ?auto_49448 ?auto_49450 ) ) ( not ( = ?auto_49448 ?auto_49451 ) ) ( not ( = ?auto_49448 ?auto_49452 ) ) ( not ( = ?auto_49448 ?auto_49453 ) ) ( not ( = ?auto_49448 ?auto_49454 ) ) ( not ( = ?auto_49449 ?auto_49450 ) ) ( not ( = ?auto_49449 ?auto_49451 ) ) ( not ( = ?auto_49449 ?auto_49452 ) ) ( not ( = ?auto_49449 ?auto_49453 ) ) ( not ( = ?auto_49449 ?auto_49454 ) ) ( not ( = ?auto_49450 ?auto_49451 ) ) ( not ( = ?auto_49450 ?auto_49452 ) ) ( not ( = ?auto_49450 ?auto_49453 ) ) ( not ( = ?auto_49450 ?auto_49454 ) ) ( not ( = ?auto_49451 ?auto_49452 ) ) ( not ( = ?auto_49451 ?auto_49453 ) ) ( not ( = ?auto_49451 ?auto_49454 ) ) ( not ( = ?auto_49452 ?auto_49453 ) ) ( not ( = ?auto_49452 ?auto_49454 ) ) ( not ( = ?auto_49453 ?auto_49454 ) ) ( ON ?auto_49452 ?auto_49453 ) ( ON ?auto_49451 ?auto_49452 ) ( CLEAR ?auto_49449 ) ( ON ?auto_49450 ?auto_49451 ) ( CLEAR ?auto_49450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49446 ?auto_49447 ?auto_49448 ?auto_49449 ?auto_49450 )
      ( MAKE-8PILE ?auto_49446 ?auto_49447 ?auto_49448 ?auto_49449 ?auto_49450 ?auto_49451 ?auto_49452 ?auto_49453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49480 - BLOCK
      ?auto_49481 - BLOCK
      ?auto_49482 - BLOCK
      ?auto_49483 - BLOCK
      ?auto_49484 - BLOCK
      ?auto_49485 - BLOCK
      ?auto_49486 - BLOCK
      ?auto_49487 - BLOCK
    )
    :vars
    (
      ?auto_49488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49487 ?auto_49488 ) ( ON-TABLE ?auto_49480 ) ( ON ?auto_49481 ?auto_49480 ) ( ON ?auto_49482 ?auto_49481 ) ( not ( = ?auto_49480 ?auto_49481 ) ) ( not ( = ?auto_49480 ?auto_49482 ) ) ( not ( = ?auto_49480 ?auto_49483 ) ) ( not ( = ?auto_49480 ?auto_49484 ) ) ( not ( = ?auto_49480 ?auto_49485 ) ) ( not ( = ?auto_49480 ?auto_49486 ) ) ( not ( = ?auto_49480 ?auto_49487 ) ) ( not ( = ?auto_49480 ?auto_49488 ) ) ( not ( = ?auto_49481 ?auto_49482 ) ) ( not ( = ?auto_49481 ?auto_49483 ) ) ( not ( = ?auto_49481 ?auto_49484 ) ) ( not ( = ?auto_49481 ?auto_49485 ) ) ( not ( = ?auto_49481 ?auto_49486 ) ) ( not ( = ?auto_49481 ?auto_49487 ) ) ( not ( = ?auto_49481 ?auto_49488 ) ) ( not ( = ?auto_49482 ?auto_49483 ) ) ( not ( = ?auto_49482 ?auto_49484 ) ) ( not ( = ?auto_49482 ?auto_49485 ) ) ( not ( = ?auto_49482 ?auto_49486 ) ) ( not ( = ?auto_49482 ?auto_49487 ) ) ( not ( = ?auto_49482 ?auto_49488 ) ) ( not ( = ?auto_49483 ?auto_49484 ) ) ( not ( = ?auto_49483 ?auto_49485 ) ) ( not ( = ?auto_49483 ?auto_49486 ) ) ( not ( = ?auto_49483 ?auto_49487 ) ) ( not ( = ?auto_49483 ?auto_49488 ) ) ( not ( = ?auto_49484 ?auto_49485 ) ) ( not ( = ?auto_49484 ?auto_49486 ) ) ( not ( = ?auto_49484 ?auto_49487 ) ) ( not ( = ?auto_49484 ?auto_49488 ) ) ( not ( = ?auto_49485 ?auto_49486 ) ) ( not ( = ?auto_49485 ?auto_49487 ) ) ( not ( = ?auto_49485 ?auto_49488 ) ) ( not ( = ?auto_49486 ?auto_49487 ) ) ( not ( = ?auto_49486 ?auto_49488 ) ) ( not ( = ?auto_49487 ?auto_49488 ) ) ( ON ?auto_49486 ?auto_49487 ) ( ON ?auto_49485 ?auto_49486 ) ( ON ?auto_49484 ?auto_49485 ) ( CLEAR ?auto_49482 ) ( ON ?auto_49483 ?auto_49484 ) ( CLEAR ?auto_49483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49480 ?auto_49481 ?auto_49482 ?auto_49483 )
      ( MAKE-8PILE ?auto_49480 ?auto_49481 ?auto_49482 ?auto_49483 ?auto_49484 ?auto_49485 ?auto_49486 ?auto_49487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49514 - BLOCK
      ?auto_49515 - BLOCK
      ?auto_49516 - BLOCK
      ?auto_49517 - BLOCK
      ?auto_49518 - BLOCK
      ?auto_49519 - BLOCK
      ?auto_49520 - BLOCK
      ?auto_49521 - BLOCK
    )
    :vars
    (
      ?auto_49522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49521 ?auto_49522 ) ( ON-TABLE ?auto_49514 ) ( ON ?auto_49515 ?auto_49514 ) ( not ( = ?auto_49514 ?auto_49515 ) ) ( not ( = ?auto_49514 ?auto_49516 ) ) ( not ( = ?auto_49514 ?auto_49517 ) ) ( not ( = ?auto_49514 ?auto_49518 ) ) ( not ( = ?auto_49514 ?auto_49519 ) ) ( not ( = ?auto_49514 ?auto_49520 ) ) ( not ( = ?auto_49514 ?auto_49521 ) ) ( not ( = ?auto_49514 ?auto_49522 ) ) ( not ( = ?auto_49515 ?auto_49516 ) ) ( not ( = ?auto_49515 ?auto_49517 ) ) ( not ( = ?auto_49515 ?auto_49518 ) ) ( not ( = ?auto_49515 ?auto_49519 ) ) ( not ( = ?auto_49515 ?auto_49520 ) ) ( not ( = ?auto_49515 ?auto_49521 ) ) ( not ( = ?auto_49515 ?auto_49522 ) ) ( not ( = ?auto_49516 ?auto_49517 ) ) ( not ( = ?auto_49516 ?auto_49518 ) ) ( not ( = ?auto_49516 ?auto_49519 ) ) ( not ( = ?auto_49516 ?auto_49520 ) ) ( not ( = ?auto_49516 ?auto_49521 ) ) ( not ( = ?auto_49516 ?auto_49522 ) ) ( not ( = ?auto_49517 ?auto_49518 ) ) ( not ( = ?auto_49517 ?auto_49519 ) ) ( not ( = ?auto_49517 ?auto_49520 ) ) ( not ( = ?auto_49517 ?auto_49521 ) ) ( not ( = ?auto_49517 ?auto_49522 ) ) ( not ( = ?auto_49518 ?auto_49519 ) ) ( not ( = ?auto_49518 ?auto_49520 ) ) ( not ( = ?auto_49518 ?auto_49521 ) ) ( not ( = ?auto_49518 ?auto_49522 ) ) ( not ( = ?auto_49519 ?auto_49520 ) ) ( not ( = ?auto_49519 ?auto_49521 ) ) ( not ( = ?auto_49519 ?auto_49522 ) ) ( not ( = ?auto_49520 ?auto_49521 ) ) ( not ( = ?auto_49520 ?auto_49522 ) ) ( not ( = ?auto_49521 ?auto_49522 ) ) ( ON ?auto_49520 ?auto_49521 ) ( ON ?auto_49519 ?auto_49520 ) ( ON ?auto_49518 ?auto_49519 ) ( ON ?auto_49517 ?auto_49518 ) ( CLEAR ?auto_49515 ) ( ON ?auto_49516 ?auto_49517 ) ( CLEAR ?auto_49516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49514 ?auto_49515 ?auto_49516 )
      ( MAKE-8PILE ?auto_49514 ?auto_49515 ?auto_49516 ?auto_49517 ?auto_49518 ?auto_49519 ?auto_49520 ?auto_49521 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49548 - BLOCK
      ?auto_49549 - BLOCK
      ?auto_49550 - BLOCK
      ?auto_49551 - BLOCK
      ?auto_49552 - BLOCK
      ?auto_49553 - BLOCK
      ?auto_49554 - BLOCK
      ?auto_49555 - BLOCK
    )
    :vars
    (
      ?auto_49556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49555 ?auto_49556 ) ( ON-TABLE ?auto_49548 ) ( not ( = ?auto_49548 ?auto_49549 ) ) ( not ( = ?auto_49548 ?auto_49550 ) ) ( not ( = ?auto_49548 ?auto_49551 ) ) ( not ( = ?auto_49548 ?auto_49552 ) ) ( not ( = ?auto_49548 ?auto_49553 ) ) ( not ( = ?auto_49548 ?auto_49554 ) ) ( not ( = ?auto_49548 ?auto_49555 ) ) ( not ( = ?auto_49548 ?auto_49556 ) ) ( not ( = ?auto_49549 ?auto_49550 ) ) ( not ( = ?auto_49549 ?auto_49551 ) ) ( not ( = ?auto_49549 ?auto_49552 ) ) ( not ( = ?auto_49549 ?auto_49553 ) ) ( not ( = ?auto_49549 ?auto_49554 ) ) ( not ( = ?auto_49549 ?auto_49555 ) ) ( not ( = ?auto_49549 ?auto_49556 ) ) ( not ( = ?auto_49550 ?auto_49551 ) ) ( not ( = ?auto_49550 ?auto_49552 ) ) ( not ( = ?auto_49550 ?auto_49553 ) ) ( not ( = ?auto_49550 ?auto_49554 ) ) ( not ( = ?auto_49550 ?auto_49555 ) ) ( not ( = ?auto_49550 ?auto_49556 ) ) ( not ( = ?auto_49551 ?auto_49552 ) ) ( not ( = ?auto_49551 ?auto_49553 ) ) ( not ( = ?auto_49551 ?auto_49554 ) ) ( not ( = ?auto_49551 ?auto_49555 ) ) ( not ( = ?auto_49551 ?auto_49556 ) ) ( not ( = ?auto_49552 ?auto_49553 ) ) ( not ( = ?auto_49552 ?auto_49554 ) ) ( not ( = ?auto_49552 ?auto_49555 ) ) ( not ( = ?auto_49552 ?auto_49556 ) ) ( not ( = ?auto_49553 ?auto_49554 ) ) ( not ( = ?auto_49553 ?auto_49555 ) ) ( not ( = ?auto_49553 ?auto_49556 ) ) ( not ( = ?auto_49554 ?auto_49555 ) ) ( not ( = ?auto_49554 ?auto_49556 ) ) ( not ( = ?auto_49555 ?auto_49556 ) ) ( ON ?auto_49554 ?auto_49555 ) ( ON ?auto_49553 ?auto_49554 ) ( ON ?auto_49552 ?auto_49553 ) ( ON ?auto_49551 ?auto_49552 ) ( ON ?auto_49550 ?auto_49551 ) ( CLEAR ?auto_49548 ) ( ON ?auto_49549 ?auto_49550 ) ( CLEAR ?auto_49549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49548 ?auto_49549 )
      ( MAKE-8PILE ?auto_49548 ?auto_49549 ?auto_49550 ?auto_49551 ?auto_49552 ?auto_49553 ?auto_49554 ?auto_49555 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_49582 - BLOCK
      ?auto_49583 - BLOCK
      ?auto_49584 - BLOCK
      ?auto_49585 - BLOCK
      ?auto_49586 - BLOCK
      ?auto_49587 - BLOCK
      ?auto_49588 - BLOCK
      ?auto_49589 - BLOCK
    )
    :vars
    (
      ?auto_49590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49589 ?auto_49590 ) ( not ( = ?auto_49582 ?auto_49583 ) ) ( not ( = ?auto_49582 ?auto_49584 ) ) ( not ( = ?auto_49582 ?auto_49585 ) ) ( not ( = ?auto_49582 ?auto_49586 ) ) ( not ( = ?auto_49582 ?auto_49587 ) ) ( not ( = ?auto_49582 ?auto_49588 ) ) ( not ( = ?auto_49582 ?auto_49589 ) ) ( not ( = ?auto_49582 ?auto_49590 ) ) ( not ( = ?auto_49583 ?auto_49584 ) ) ( not ( = ?auto_49583 ?auto_49585 ) ) ( not ( = ?auto_49583 ?auto_49586 ) ) ( not ( = ?auto_49583 ?auto_49587 ) ) ( not ( = ?auto_49583 ?auto_49588 ) ) ( not ( = ?auto_49583 ?auto_49589 ) ) ( not ( = ?auto_49583 ?auto_49590 ) ) ( not ( = ?auto_49584 ?auto_49585 ) ) ( not ( = ?auto_49584 ?auto_49586 ) ) ( not ( = ?auto_49584 ?auto_49587 ) ) ( not ( = ?auto_49584 ?auto_49588 ) ) ( not ( = ?auto_49584 ?auto_49589 ) ) ( not ( = ?auto_49584 ?auto_49590 ) ) ( not ( = ?auto_49585 ?auto_49586 ) ) ( not ( = ?auto_49585 ?auto_49587 ) ) ( not ( = ?auto_49585 ?auto_49588 ) ) ( not ( = ?auto_49585 ?auto_49589 ) ) ( not ( = ?auto_49585 ?auto_49590 ) ) ( not ( = ?auto_49586 ?auto_49587 ) ) ( not ( = ?auto_49586 ?auto_49588 ) ) ( not ( = ?auto_49586 ?auto_49589 ) ) ( not ( = ?auto_49586 ?auto_49590 ) ) ( not ( = ?auto_49587 ?auto_49588 ) ) ( not ( = ?auto_49587 ?auto_49589 ) ) ( not ( = ?auto_49587 ?auto_49590 ) ) ( not ( = ?auto_49588 ?auto_49589 ) ) ( not ( = ?auto_49588 ?auto_49590 ) ) ( not ( = ?auto_49589 ?auto_49590 ) ) ( ON ?auto_49588 ?auto_49589 ) ( ON ?auto_49587 ?auto_49588 ) ( ON ?auto_49586 ?auto_49587 ) ( ON ?auto_49585 ?auto_49586 ) ( ON ?auto_49584 ?auto_49585 ) ( ON ?auto_49583 ?auto_49584 ) ( ON ?auto_49582 ?auto_49583 ) ( CLEAR ?auto_49582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49582 )
      ( MAKE-8PILE ?auto_49582 ?auto_49583 ?auto_49584 ?auto_49585 ?auto_49586 ?auto_49587 ?auto_49588 ?auto_49589 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49617 - BLOCK
      ?auto_49618 - BLOCK
      ?auto_49619 - BLOCK
      ?auto_49620 - BLOCK
      ?auto_49621 - BLOCK
      ?auto_49622 - BLOCK
      ?auto_49623 - BLOCK
      ?auto_49624 - BLOCK
      ?auto_49625 - BLOCK
    )
    :vars
    (
      ?auto_49626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49624 ) ( ON ?auto_49625 ?auto_49626 ) ( CLEAR ?auto_49625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49617 ) ( ON ?auto_49618 ?auto_49617 ) ( ON ?auto_49619 ?auto_49618 ) ( ON ?auto_49620 ?auto_49619 ) ( ON ?auto_49621 ?auto_49620 ) ( ON ?auto_49622 ?auto_49621 ) ( ON ?auto_49623 ?auto_49622 ) ( ON ?auto_49624 ?auto_49623 ) ( not ( = ?auto_49617 ?auto_49618 ) ) ( not ( = ?auto_49617 ?auto_49619 ) ) ( not ( = ?auto_49617 ?auto_49620 ) ) ( not ( = ?auto_49617 ?auto_49621 ) ) ( not ( = ?auto_49617 ?auto_49622 ) ) ( not ( = ?auto_49617 ?auto_49623 ) ) ( not ( = ?auto_49617 ?auto_49624 ) ) ( not ( = ?auto_49617 ?auto_49625 ) ) ( not ( = ?auto_49617 ?auto_49626 ) ) ( not ( = ?auto_49618 ?auto_49619 ) ) ( not ( = ?auto_49618 ?auto_49620 ) ) ( not ( = ?auto_49618 ?auto_49621 ) ) ( not ( = ?auto_49618 ?auto_49622 ) ) ( not ( = ?auto_49618 ?auto_49623 ) ) ( not ( = ?auto_49618 ?auto_49624 ) ) ( not ( = ?auto_49618 ?auto_49625 ) ) ( not ( = ?auto_49618 ?auto_49626 ) ) ( not ( = ?auto_49619 ?auto_49620 ) ) ( not ( = ?auto_49619 ?auto_49621 ) ) ( not ( = ?auto_49619 ?auto_49622 ) ) ( not ( = ?auto_49619 ?auto_49623 ) ) ( not ( = ?auto_49619 ?auto_49624 ) ) ( not ( = ?auto_49619 ?auto_49625 ) ) ( not ( = ?auto_49619 ?auto_49626 ) ) ( not ( = ?auto_49620 ?auto_49621 ) ) ( not ( = ?auto_49620 ?auto_49622 ) ) ( not ( = ?auto_49620 ?auto_49623 ) ) ( not ( = ?auto_49620 ?auto_49624 ) ) ( not ( = ?auto_49620 ?auto_49625 ) ) ( not ( = ?auto_49620 ?auto_49626 ) ) ( not ( = ?auto_49621 ?auto_49622 ) ) ( not ( = ?auto_49621 ?auto_49623 ) ) ( not ( = ?auto_49621 ?auto_49624 ) ) ( not ( = ?auto_49621 ?auto_49625 ) ) ( not ( = ?auto_49621 ?auto_49626 ) ) ( not ( = ?auto_49622 ?auto_49623 ) ) ( not ( = ?auto_49622 ?auto_49624 ) ) ( not ( = ?auto_49622 ?auto_49625 ) ) ( not ( = ?auto_49622 ?auto_49626 ) ) ( not ( = ?auto_49623 ?auto_49624 ) ) ( not ( = ?auto_49623 ?auto_49625 ) ) ( not ( = ?auto_49623 ?auto_49626 ) ) ( not ( = ?auto_49624 ?auto_49625 ) ) ( not ( = ?auto_49624 ?auto_49626 ) ) ( not ( = ?auto_49625 ?auto_49626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49625 ?auto_49626 )
      ( !STACK ?auto_49625 ?auto_49624 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49636 - BLOCK
      ?auto_49637 - BLOCK
      ?auto_49638 - BLOCK
      ?auto_49639 - BLOCK
      ?auto_49640 - BLOCK
      ?auto_49641 - BLOCK
      ?auto_49642 - BLOCK
      ?auto_49643 - BLOCK
      ?auto_49644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49643 ) ( ON-TABLE ?auto_49644 ) ( CLEAR ?auto_49644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49636 ) ( ON ?auto_49637 ?auto_49636 ) ( ON ?auto_49638 ?auto_49637 ) ( ON ?auto_49639 ?auto_49638 ) ( ON ?auto_49640 ?auto_49639 ) ( ON ?auto_49641 ?auto_49640 ) ( ON ?auto_49642 ?auto_49641 ) ( ON ?auto_49643 ?auto_49642 ) ( not ( = ?auto_49636 ?auto_49637 ) ) ( not ( = ?auto_49636 ?auto_49638 ) ) ( not ( = ?auto_49636 ?auto_49639 ) ) ( not ( = ?auto_49636 ?auto_49640 ) ) ( not ( = ?auto_49636 ?auto_49641 ) ) ( not ( = ?auto_49636 ?auto_49642 ) ) ( not ( = ?auto_49636 ?auto_49643 ) ) ( not ( = ?auto_49636 ?auto_49644 ) ) ( not ( = ?auto_49637 ?auto_49638 ) ) ( not ( = ?auto_49637 ?auto_49639 ) ) ( not ( = ?auto_49637 ?auto_49640 ) ) ( not ( = ?auto_49637 ?auto_49641 ) ) ( not ( = ?auto_49637 ?auto_49642 ) ) ( not ( = ?auto_49637 ?auto_49643 ) ) ( not ( = ?auto_49637 ?auto_49644 ) ) ( not ( = ?auto_49638 ?auto_49639 ) ) ( not ( = ?auto_49638 ?auto_49640 ) ) ( not ( = ?auto_49638 ?auto_49641 ) ) ( not ( = ?auto_49638 ?auto_49642 ) ) ( not ( = ?auto_49638 ?auto_49643 ) ) ( not ( = ?auto_49638 ?auto_49644 ) ) ( not ( = ?auto_49639 ?auto_49640 ) ) ( not ( = ?auto_49639 ?auto_49641 ) ) ( not ( = ?auto_49639 ?auto_49642 ) ) ( not ( = ?auto_49639 ?auto_49643 ) ) ( not ( = ?auto_49639 ?auto_49644 ) ) ( not ( = ?auto_49640 ?auto_49641 ) ) ( not ( = ?auto_49640 ?auto_49642 ) ) ( not ( = ?auto_49640 ?auto_49643 ) ) ( not ( = ?auto_49640 ?auto_49644 ) ) ( not ( = ?auto_49641 ?auto_49642 ) ) ( not ( = ?auto_49641 ?auto_49643 ) ) ( not ( = ?auto_49641 ?auto_49644 ) ) ( not ( = ?auto_49642 ?auto_49643 ) ) ( not ( = ?auto_49642 ?auto_49644 ) ) ( not ( = ?auto_49643 ?auto_49644 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_49644 )
      ( !STACK ?auto_49644 ?auto_49643 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49654 - BLOCK
      ?auto_49655 - BLOCK
      ?auto_49656 - BLOCK
      ?auto_49657 - BLOCK
      ?auto_49658 - BLOCK
      ?auto_49659 - BLOCK
      ?auto_49660 - BLOCK
      ?auto_49661 - BLOCK
      ?auto_49662 - BLOCK
    )
    :vars
    (
      ?auto_49663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49662 ?auto_49663 ) ( ON-TABLE ?auto_49654 ) ( ON ?auto_49655 ?auto_49654 ) ( ON ?auto_49656 ?auto_49655 ) ( ON ?auto_49657 ?auto_49656 ) ( ON ?auto_49658 ?auto_49657 ) ( ON ?auto_49659 ?auto_49658 ) ( ON ?auto_49660 ?auto_49659 ) ( not ( = ?auto_49654 ?auto_49655 ) ) ( not ( = ?auto_49654 ?auto_49656 ) ) ( not ( = ?auto_49654 ?auto_49657 ) ) ( not ( = ?auto_49654 ?auto_49658 ) ) ( not ( = ?auto_49654 ?auto_49659 ) ) ( not ( = ?auto_49654 ?auto_49660 ) ) ( not ( = ?auto_49654 ?auto_49661 ) ) ( not ( = ?auto_49654 ?auto_49662 ) ) ( not ( = ?auto_49654 ?auto_49663 ) ) ( not ( = ?auto_49655 ?auto_49656 ) ) ( not ( = ?auto_49655 ?auto_49657 ) ) ( not ( = ?auto_49655 ?auto_49658 ) ) ( not ( = ?auto_49655 ?auto_49659 ) ) ( not ( = ?auto_49655 ?auto_49660 ) ) ( not ( = ?auto_49655 ?auto_49661 ) ) ( not ( = ?auto_49655 ?auto_49662 ) ) ( not ( = ?auto_49655 ?auto_49663 ) ) ( not ( = ?auto_49656 ?auto_49657 ) ) ( not ( = ?auto_49656 ?auto_49658 ) ) ( not ( = ?auto_49656 ?auto_49659 ) ) ( not ( = ?auto_49656 ?auto_49660 ) ) ( not ( = ?auto_49656 ?auto_49661 ) ) ( not ( = ?auto_49656 ?auto_49662 ) ) ( not ( = ?auto_49656 ?auto_49663 ) ) ( not ( = ?auto_49657 ?auto_49658 ) ) ( not ( = ?auto_49657 ?auto_49659 ) ) ( not ( = ?auto_49657 ?auto_49660 ) ) ( not ( = ?auto_49657 ?auto_49661 ) ) ( not ( = ?auto_49657 ?auto_49662 ) ) ( not ( = ?auto_49657 ?auto_49663 ) ) ( not ( = ?auto_49658 ?auto_49659 ) ) ( not ( = ?auto_49658 ?auto_49660 ) ) ( not ( = ?auto_49658 ?auto_49661 ) ) ( not ( = ?auto_49658 ?auto_49662 ) ) ( not ( = ?auto_49658 ?auto_49663 ) ) ( not ( = ?auto_49659 ?auto_49660 ) ) ( not ( = ?auto_49659 ?auto_49661 ) ) ( not ( = ?auto_49659 ?auto_49662 ) ) ( not ( = ?auto_49659 ?auto_49663 ) ) ( not ( = ?auto_49660 ?auto_49661 ) ) ( not ( = ?auto_49660 ?auto_49662 ) ) ( not ( = ?auto_49660 ?auto_49663 ) ) ( not ( = ?auto_49661 ?auto_49662 ) ) ( not ( = ?auto_49661 ?auto_49663 ) ) ( not ( = ?auto_49662 ?auto_49663 ) ) ( CLEAR ?auto_49660 ) ( ON ?auto_49661 ?auto_49662 ) ( CLEAR ?auto_49661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_49654 ?auto_49655 ?auto_49656 ?auto_49657 ?auto_49658 ?auto_49659 ?auto_49660 ?auto_49661 )
      ( MAKE-9PILE ?auto_49654 ?auto_49655 ?auto_49656 ?auto_49657 ?auto_49658 ?auto_49659 ?auto_49660 ?auto_49661 ?auto_49662 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49673 - BLOCK
      ?auto_49674 - BLOCK
      ?auto_49675 - BLOCK
      ?auto_49676 - BLOCK
      ?auto_49677 - BLOCK
      ?auto_49678 - BLOCK
      ?auto_49679 - BLOCK
      ?auto_49680 - BLOCK
      ?auto_49681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49681 ) ( ON-TABLE ?auto_49673 ) ( ON ?auto_49674 ?auto_49673 ) ( ON ?auto_49675 ?auto_49674 ) ( ON ?auto_49676 ?auto_49675 ) ( ON ?auto_49677 ?auto_49676 ) ( ON ?auto_49678 ?auto_49677 ) ( ON ?auto_49679 ?auto_49678 ) ( not ( = ?auto_49673 ?auto_49674 ) ) ( not ( = ?auto_49673 ?auto_49675 ) ) ( not ( = ?auto_49673 ?auto_49676 ) ) ( not ( = ?auto_49673 ?auto_49677 ) ) ( not ( = ?auto_49673 ?auto_49678 ) ) ( not ( = ?auto_49673 ?auto_49679 ) ) ( not ( = ?auto_49673 ?auto_49680 ) ) ( not ( = ?auto_49673 ?auto_49681 ) ) ( not ( = ?auto_49674 ?auto_49675 ) ) ( not ( = ?auto_49674 ?auto_49676 ) ) ( not ( = ?auto_49674 ?auto_49677 ) ) ( not ( = ?auto_49674 ?auto_49678 ) ) ( not ( = ?auto_49674 ?auto_49679 ) ) ( not ( = ?auto_49674 ?auto_49680 ) ) ( not ( = ?auto_49674 ?auto_49681 ) ) ( not ( = ?auto_49675 ?auto_49676 ) ) ( not ( = ?auto_49675 ?auto_49677 ) ) ( not ( = ?auto_49675 ?auto_49678 ) ) ( not ( = ?auto_49675 ?auto_49679 ) ) ( not ( = ?auto_49675 ?auto_49680 ) ) ( not ( = ?auto_49675 ?auto_49681 ) ) ( not ( = ?auto_49676 ?auto_49677 ) ) ( not ( = ?auto_49676 ?auto_49678 ) ) ( not ( = ?auto_49676 ?auto_49679 ) ) ( not ( = ?auto_49676 ?auto_49680 ) ) ( not ( = ?auto_49676 ?auto_49681 ) ) ( not ( = ?auto_49677 ?auto_49678 ) ) ( not ( = ?auto_49677 ?auto_49679 ) ) ( not ( = ?auto_49677 ?auto_49680 ) ) ( not ( = ?auto_49677 ?auto_49681 ) ) ( not ( = ?auto_49678 ?auto_49679 ) ) ( not ( = ?auto_49678 ?auto_49680 ) ) ( not ( = ?auto_49678 ?auto_49681 ) ) ( not ( = ?auto_49679 ?auto_49680 ) ) ( not ( = ?auto_49679 ?auto_49681 ) ) ( not ( = ?auto_49680 ?auto_49681 ) ) ( CLEAR ?auto_49679 ) ( ON ?auto_49680 ?auto_49681 ) ( CLEAR ?auto_49680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_49673 ?auto_49674 ?auto_49675 ?auto_49676 ?auto_49677 ?auto_49678 ?auto_49679 ?auto_49680 )
      ( MAKE-9PILE ?auto_49673 ?auto_49674 ?auto_49675 ?auto_49676 ?auto_49677 ?auto_49678 ?auto_49679 ?auto_49680 ?auto_49681 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49691 - BLOCK
      ?auto_49692 - BLOCK
      ?auto_49693 - BLOCK
      ?auto_49694 - BLOCK
      ?auto_49695 - BLOCK
      ?auto_49696 - BLOCK
      ?auto_49697 - BLOCK
      ?auto_49698 - BLOCK
      ?auto_49699 - BLOCK
    )
    :vars
    (
      ?auto_49700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49699 ?auto_49700 ) ( ON-TABLE ?auto_49691 ) ( ON ?auto_49692 ?auto_49691 ) ( ON ?auto_49693 ?auto_49692 ) ( ON ?auto_49694 ?auto_49693 ) ( ON ?auto_49695 ?auto_49694 ) ( ON ?auto_49696 ?auto_49695 ) ( not ( = ?auto_49691 ?auto_49692 ) ) ( not ( = ?auto_49691 ?auto_49693 ) ) ( not ( = ?auto_49691 ?auto_49694 ) ) ( not ( = ?auto_49691 ?auto_49695 ) ) ( not ( = ?auto_49691 ?auto_49696 ) ) ( not ( = ?auto_49691 ?auto_49697 ) ) ( not ( = ?auto_49691 ?auto_49698 ) ) ( not ( = ?auto_49691 ?auto_49699 ) ) ( not ( = ?auto_49691 ?auto_49700 ) ) ( not ( = ?auto_49692 ?auto_49693 ) ) ( not ( = ?auto_49692 ?auto_49694 ) ) ( not ( = ?auto_49692 ?auto_49695 ) ) ( not ( = ?auto_49692 ?auto_49696 ) ) ( not ( = ?auto_49692 ?auto_49697 ) ) ( not ( = ?auto_49692 ?auto_49698 ) ) ( not ( = ?auto_49692 ?auto_49699 ) ) ( not ( = ?auto_49692 ?auto_49700 ) ) ( not ( = ?auto_49693 ?auto_49694 ) ) ( not ( = ?auto_49693 ?auto_49695 ) ) ( not ( = ?auto_49693 ?auto_49696 ) ) ( not ( = ?auto_49693 ?auto_49697 ) ) ( not ( = ?auto_49693 ?auto_49698 ) ) ( not ( = ?auto_49693 ?auto_49699 ) ) ( not ( = ?auto_49693 ?auto_49700 ) ) ( not ( = ?auto_49694 ?auto_49695 ) ) ( not ( = ?auto_49694 ?auto_49696 ) ) ( not ( = ?auto_49694 ?auto_49697 ) ) ( not ( = ?auto_49694 ?auto_49698 ) ) ( not ( = ?auto_49694 ?auto_49699 ) ) ( not ( = ?auto_49694 ?auto_49700 ) ) ( not ( = ?auto_49695 ?auto_49696 ) ) ( not ( = ?auto_49695 ?auto_49697 ) ) ( not ( = ?auto_49695 ?auto_49698 ) ) ( not ( = ?auto_49695 ?auto_49699 ) ) ( not ( = ?auto_49695 ?auto_49700 ) ) ( not ( = ?auto_49696 ?auto_49697 ) ) ( not ( = ?auto_49696 ?auto_49698 ) ) ( not ( = ?auto_49696 ?auto_49699 ) ) ( not ( = ?auto_49696 ?auto_49700 ) ) ( not ( = ?auto_49697 ?auto_49698 ) ) ( not ( = ?auto_49697 ?auto_49699 ) ) ( not ( = ?auto_49697 ?auto_49700 ) ) ( not ( = ?auto_49698 ?auto_49699 ) ) ( not ( = ?auto_49698 ?auto_49700 ) ) ( not ( = ?auto_49699 ?auto_49700 ) ) ( ON ?auto_49698 ?auto_49699 ) ( CLEAR ?auto_49696 ) ( ON ?auto_49697 ?auto_49698 ) ( CLEAR ?auto_49697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49691 ?auto_49692 ?auto_49693 ?auto_49694 ?auto_49695 ?auto_49696 ?auto_49697 )
      ( MAKE-9PILE ?auto_49691 ?auto_49692 ?auto_49693 ?auto_49694 ?auto_49695 ?auto_49696 ?auto_49697 ?auto_49698 ?auto_49699 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49710 - BLOCK
      ?auto_49711 - BLOCK
      ?auto_49712 - BLOCK
      ?auto_49713 - BLOCK
      ?auto_49714 - BLOCK
      ?auto_49715 - BLOCK
      ?auto_49716 - BLOCK
      ?auto_49717 - BLOCK
      ?auto_49718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49718 ) ( ON-TABLE ?auto_49710 ) ( ON ?auto_49711 ?auto_49710 ) ( ON ?auto_49712 ?auto_49711 ) ( ON ?auto_49713 ?auto_49712 ) ( ON ?auto_49714 ?auto_49713 ) ( ON ?auto_49715 ?auto_49714 ) ( not ( = ?auto_49710 ?auto_49711 ) ) ( not ( = ?auto_49710 ?auto_49712 ) ) ( not ( = ?auto_49710 ?auto_49713 ) ) ( not ( = ?auto_49710 ?auto_49714 ) ) ( not ( = ?auto_49710 ?auto_49715 ) ) ( not ( = ?auto_49710 ?auto_49716 ) ) ( not ( = ?auto_49710 ?auto_49717 ) ) ( not ( = ?auto_49710 ?auto_49718 ) ) ( not ( = ?auto_49711 ?auto_49712 ) ) ( not ( = ?auto_49711 ?auto_49713 ) ) ( not ( = ?auto_49711 ?auto_49714 ) ) ( not ( = ?auto_49711 ?auto_49715 ) ) ( not ( = ?auto_49711 ?auto_49716 ) ) ( not ( = ?auto_49711 ?auto_49717 ) ) ( not ( = ?auto_49711 ?auto_49718 ) ) ( not ( = ?auto_49712 ?auto_49713 ) ) ( not ( = ?auto_49712 ?auto_49714 ) ) ( not ( = ?auto_49712 ?auto_49715 ) ) ( not ( = ?auto_49712 ?auto_49716 ) ) ( not ( = ?auto_49712 ?auto_49717 ) ) ( not ( = ?auto_49712 ?auto_49718 ) ) ( not ( = ?auto_49713 ?auto_49714 ) ) ( not ( = ?auto_49713 ?auto_49715 ) ) ( not ( = ?auto_49713 ?auto_49716 ) ) ( not ( = ?auto_49713 ?auto_49717 ) ) ( not ( = ?auto_49713 ?auto_49718 ) ) ( not ( = ?auto_49714 ?auto_49715 ) ) ( not ( = ?auto_49714 ?auto_49716 ) ) ( not ( = ?auto_49714 ?auto_49717 ) ) ( not ( = ?auto_49714 ?auto_49718 ) ) ( not ( = ?auto_49715 ?auto_49716 ) ) ( not ( = ?auto_49715 ?auto_49717 ) ) ( not ( = ?auto_49715 ?auto_49718 ) ) ( not ( = ?auto_49716 ?auto_49717 ) ) ( not ( = ?auto_49716 ?auto_49718 ) ) ( not ( = ?auto_49717 ?auto_49718 ) ) ( ON ?auto_49717 ?auto_49718 ) ( CLEAR ?auto_49715 ) ( ON ?auto_49716 ?auto_49717 ) ( CLEAR ?auto_49716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_49710 ?auto_49711 ?auto_49712 ?auto_49713 ?auto_49714 ?auto_49715 ?auto_49716 )
      ( MAKE-9PILE ?auto_49710 ?auto_49711 ?auto_49712 ?auto_49713 ?auto_49714 ?auto_49715 ?auto_49716 ?auto_49717 ?auto_49718 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49728 - BLOCK
      ?auto_49729 - BLOCK
      ?auto_49730 - BLOCK
      ?auto_49731 - BLOCK
      ?auto_49732 - BLOCK
      ?auto_49733 - BLOCK
      ?auto_49734 - BLOCK
      ?auto_49735 - BLOCK
      ?auto_49736 - BLOCK
    )
    :vars
    (
      ?auto_49737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49736 ?auto_49737 ) ( ON-TABLE ?auto_49728 ) ( ON ?auto_49729 ?auto_49728 ) ( ON ?auto_49730 ?auto_49729 ) ( ON ?auto_49731 ?auto_49730 ) ( ON ?auto_49732 ?auto_49731 ) ( not ( = ?auto_49728 ?auto_49729 ) ) ( not ( = ?auto_49728 ?auto_49730 ) ) ( not ( = ?auto_49728 ?auto_49731 ) ) ( not ( = ?auto_49728 ?auto_49732 ) ) ( not ( = ?auto_49728 ?auto_49733 ) ) ( not ( = ?auto_49728 ?auto_49734 ) ) ( not ( = ?auto_49728 ?auto_49735 ) ) ( not ( = ?auto_49728 ?auto_49736 ) ) ( not ( = ?auto_49728 ?auto_49737 ) ) ( not ( = ?auto_49729 ?auto_49730 ) ) ( not ( = ?auto_49729 ?auto_49731 ) ) ( not ( = ?auto_49729 ?auto_49732 ) ) ( not ( = ?auto_49729 ?auto_49733 ) ) ( not ( = ?auto_49729 ?auto_49734 ) ) ( not ( = ?auto_49729 ?auto_49735 ) ) ( not ( = ?auto_49729 ?auto_49736 ) ) ( not ( = ?auto_49729 ?auto_49737 ) ) ( not ( = ?auto_49730 ?auto_49731 ) ) ( not ( = ?auto_49730 ?auto_49732 ) ) ( not ( = ?auto_49730 ?auto_49733 ) ) ( not ( = ?auto_49730 ?auto_49734 ) ) ( not ( = ?auto_49730 ?auto_49735 ) ) ( not ( = ?auto_49730 ?auto_49736 ) ) ( not ( = ?auto_49730 ?auto_49737 ) ) ( not ( = ?auto_49731 ?auto_49732 ) ) ( not ( = ?auto_49731 ?auto_49733 ) ) ( not ( = ?auto_49731 ?auto_49734 ) ) ( not ( = ?auto_49731 ?auto_49735 ) ) ( not ( = ?auto_49731 ?auto_49736 ) ) ( not ( = ?auto_49731 ?auto_49737 ) ) ( not ( = ?auto_49732 ?auto_49733 ) ) ( not ( = ?auto_49732 ?auto_49734 ) ) ( not ( = ?auto_49732 ?auto_49735 ) ) ( not ( = ?auto_49732 ?auto_49736 ) ) ( not ( = ?auto_49732 ?auto_49737 ) ) ( not ( = ?auto_49733 ?auto_49734 ) ) ( not ( = ?auto_49733 ?auto_49735 ) ) ( not ( = ?auto_49733 ?auto_49736 ) ) ( not ( = ?auto_49733 ?auto_49737 ) ) ( not ( = ?auto_49734 ?auto_49735 ) ) ( not ( = ?auto_49734 ?auto_49736 ) ) ( not ( = ?auto_49734 ?auto_49737 ) ) ( not ( = ?auto_49735 ?auto_49736 ) ) ( not ( = ?auto_49735 ?auto_49737 ) ) ( not ( = ?auto_49736 ?auto_49737 ) ) ( ON ?auto_49735 ?auto_49736 ) ( ON ?auto_49734 ?auto_49735 ) ( CLEAR ?auto_49732 ) ( ON ?auto_49733 ?auto_49734 ) ( CLEAR ?auto_49733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49728 ?auto_49729 ?auto_49730 ?auto_49731 ?auto_49732 ?auto_49733 )
      ( MAKE-9PILE ?auto_49728 ?auto_49729 ?auto_49730 ?auto_49731 ?auto_49732 ?auto_49733 ?auto_49734 ?auto_49735 ?auto_49736 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49747 - BLOCK
      ?auto_49748 - BLOCK
      ?auto_49749 - BLOCK
      ?auto_49750 - BLOCK
      ?auto_49751 - BLOCK
      ?auto_49752 - BLOCK
      ?auto_49753 - BLOCK
      ?auto_49754 - BLOCK
      ?auto_49755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49755 ) ( ON-TABLE ?auto_49747 ) ( ON ?auto_49748 ?auto_49747 ) ( ON ?auto_49749 ?auto_49748 ) ( ON ?auto_49750 ?auto_49749 ) ( ON ?auto_49751 ?auto_49750 ) ( not ( = ?auto_49747 ?auto_49748 ) ) ( not ( = ?auto_49747 ?auto_49749 ) ) ( not ( = ?auto_49747 ?auto_49750 ) ) ( not ( = ?auto_49747 ?auto_49751 ) ) ( not ( = ?auto_49747 ?auto_49752 ) ) ( not ( = ?auto_49747 ?auto_49753 ) ) ( not ( = ?auto_49747 ?auto_49754 ) ) ( not ( = ?auto_49747 ?auto_49755 ) ) ( not ( = ?auto_49748 ?auto_49749 ) ) ( not ( = ?auto_49748 ?auto_49750 ) ) ( not ( = ?auto_49748 ?auto_49751 ) ) ( not ( = ?auto_49748 ?auto_49752 ) ) ( not ( = ?auto_49748 ?auto_49753 ) ) ( not ( = ?auto_49748 ?auto_49754 ) ) ( not ( = ?auto_49748 ?auto_49755 ) ) ( not ( = ?auto_49749 ?auto_49750 ) ) ( not ( = ?auto_49749 ?auto_49751 ) ) ( not ( = ?auto_49749 ?auto_49752 ) ) ( not ( = ?auto_49749 ?auto_49753 ) ) ( not ( = ?auto_49749 ?auto_49754 ) ) ( not ( = ?auto_49749 ?auto_49755 ) ) ( not ( = ?auto_49750 ?auto_49751 ) ) ( not ( = ?auto_49750 ?auto_49752 ) ) ( not ( = ?auto_49750 ?auto_49753 ) ) ( not ( = ?auto_49750 ?auto_49754 ) ) ( not ( = ?auto_49750 ?auto_49755 ) ) ( not ( = ?auto_49751 ?auto_49752 ) ) ( not ( = ?auto_49751 ?auto_49753 ) ) ( not ( = ?auto_49751 ?auto_49754 ) ) ( not ( = ?auto_49751 ?auto_49755 ) ) ( not ( = ?auto_49752 ?auto_49753 ) ) ( not ( = ?auto_49752 ?auto_49754 ) ) ( not ( = ?auto_49752 ?auto_49755 ) ) ( not ( = ?auto_49753 ?auto_49754 ) ) ( not ( = ?auto_49753 ?auto_49755 ) ) ( not ( = ?auto_49754 ?auto_49755 ) ) ( ON ?auto_49754 ?auto_49755 ) ( ON ?auto_49753 ?auto_49754 ) ( CLEAR ?auto_49751 ) ( ON ?auto_49752 ?auto_49753 ) ( CLEAR ?auto_49752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_49747 ?auto_49748 ?auto_49749 ?auto_49750 ?auto_49751 ?auto_49752 )
      ( MAKE-9PILE ?auto_49747 ?auto_49748 ?auto_49749 ?auto_49750 ?auto_49751 ?auto_49752 ?auto_49753 ?auto_49754 ?auto_49755 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49765 - BLOCK
      ?auto_49766 - BLOCK
      ?auto_49767 - BLOCK
      ?auto_49768 - BLOCK
      ?auto_49769 - BLOCK
      ?auto_49770 - BLOCK
      ?auto_49771 - BLOCK
      ?auto_49772 - BLOCK
      ?auto_49773 - BLOCK
    )
    :vars
    (
      ?auto_49774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49773 ?auto_49774 ) ( ON-TABLE ?auto_49765 ) ( ON ?auto_49766 ?auto_49765 ) ( ON ?auto_49767 ?auto_49766 ) ( ON ?auto_49768 ?auto_49767 ) ( not ( = ?auto_49765 ?auto_49766 ) ) ( not ( = ?auto_49765 ?auto_49767 ) ) ( not ( = ?auto_49765 ?auto_49768 ) ) ( not ( = ?auto_49765 ?auto_49769 ) ) ( not ( = ?auto_49765 ?auto_49770 ) ) ( not ( = ?auto_49765 ?auto_49771 ) ) ( not ( = ?auto_49765 ?auto_49772 ) ) ( not ( = ?auto_49765 ?auto_49773 ) ) ( not ( = ?auto_49765 ?auto_49774 ) ) ( not ( = ?auto_49766 ?auto_49767 ) ) ( not ( = ?auto_49766 ?auto_49768 ) ) ( not ( = ?auto_49766 ?auto_49769 ) ) ( not ( = ?auto_49766 ?auto_49770 ) ) ( not ( = ?auto_49766 ?auto_49771 ) ) ( not ( = ?auto_49766 ?auto_49772 ) ) ( not ( = ?auto_49766 ?auto_49773 ) ) ( not ( = ?auto_49766 ?auto_49774 ) ) ( not ( = ?auto_49767 ?auto_49768 ) ) ( not ( = ?auto_49767 ?auto_49769 ) ) ( not ( = ?auto_49767 ?auto_49770 ) ) ( not ( = ?auto_49767 ?auto_49771 ) ) ( not ( = ?auto_49767 ?auto_49772 ) ) ( not ( = ?auto_49767 ?auto_49773 ) ) ( not ( = ?auto_49767 ?auto_49774 ) ) ( not ( = ?auto_49768 ?auto_49769 ) ) ( not ( = ?auto_49768 ?auto_49770 ) ) ( not ( = ?auto_49768 ?auto_49771 ) ) ( not ( = ?auto_49768 ?auto_49772 ) ) ( not ( = ?auto_49768 ?auto_49773 ) ) ( not ( = ?auto_49768 ?auto_49774 ) ) ( not ( = ?auto_49769 ?auto_49770 ) ) ( not ( = ?auto_49769 ?auto_49771 ) ) ( not ( = ?auto_49769 ?auto_49772 ) ) ( not ( = ?auto_49769 ?auto_49773 ) ) ( not ( = ?auto_49769 ?auto_49774 ) ) ( not ( = ?auto_49770 ?auto_49771 ) ) ( not ( = ?auto_49770 ?auto_49772 ) ) ( not ( = ?auto_49770 ?auto_49773 ) ) ( not ( = ?auto_49770 ?auto_49774 ) ) ( not ( = ?auto_49771 ?auto_49772 ) ) ( not ( = ?auto_49771 ?auto_49773 ) ) ( not ( = ?auto_49771 ?auto_49774 ) ) ( not ( = ?auto_49772 ?auto_49773 ) ) ( not ( = ?auto_49772 ?auto_49774 ) ) ( not ( = ?auto_49773 ?auto_49774 ) ) ( ON ?auto_49772 ?auto_49773 ) ( ON ?auto_49771 ?auto_49772 ) ( ON ?auto_49770 ?auto_49771 ) ( CLEAR ?auto_49768 ) ( ON ?auto_49769 ?auto_49770 ) ( CLEAR ?auto_49769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49765 ?auto_49766 ?auto_49767 ?auto_49768 ?auto_49769 )
      ( MAKE-9PILE ?auto_49765 ?auto_49766 ?auto_49767 ?auto_49768 ?auto_49769 ?auto_49770 ?auto_49771 ?auto_49772 ?auto_49773 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49784 - BLOCK
      ?auto_49785 - BLOCK
      ?auto_49786 - BLOCK
      ?auto_49787 - BLOCK
      ?auto_49788 - BLOCK
      ?auto_49789 - BLOCK
      ?auto_49790 - BLOCK
      ?auto_49791 - BLOCK
      ?auto_49792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49792 ) ( ON-TABLE ?auto_49784 ) ( ON ?auto_49785 ?auto_49784 ) ( ON ?auto_49786 ?auto_49785 ) ( ON ?auto_49787 ?auto_49786 ) ( not ( = ?auto_49784 ?auto_49785 ) ) ( not ( = ?auto_49784 ?auto_49786 ) ) ( not ( = ?auto_49784 ?auto_49787 ) ) ( not ( = ?auto_49784 ?auto_49788 ) ) ( not ( = ?auto_49784 ?auto_49789 ) ) ( not ( = ?auto_49784 ?auto_49790 ) ) ( not ( = ?auto_49784 ?auto_49791 ) ) ( not ( = ?auto_49784 ?auto_49792 ) ) ( not ( = ?auto_49785 ?auto_49786 ) ) ( not ( = ?auto_49785 ?auto_49787 ) ) ( not ( = ?auto_49785 ?auto_49788 ) ) ( not ( = ?auto_49785 ?auto_49789 ) ) ( not ( = ?auto_49785 ?auto_49790 ) ) ( not ( = ?auto_49785 ?auto_49791 ) ) ( not ( = ?auto_49785 ?auto_49792 ) ) ( not ( = ?auto_49786 ?auto_49787 ) ) ( not ( = ?auto_49786 ?auto_49788 ) ) ( not ( = ?auto_49786 ?auto_49789 ) ) ( not ( = ?auto_49786 ?auto_49790 ) ) ( not ( = ?auto_49786 ?auto_49791 ) ) ( not ( = ?auto_49786 ?auto_49792 ) ) ( not ( = ?auto_49787 ?auto_49788 ) ) ( not ( = ?auto_49787 ?auto_49789 ) ) ( not ( = ?auto_49787 ?auto_49790 ) ) ( not ( = ?auto_49787 ?auto_49791 ) ) ( not ( = ?auto_49787 ?auto_49792 ) ) ( not ( = ?auto_49788 ?auto_49789 ) ) ( not ( = ?auto_49788 ?auto_49790 ) ) ( not ( = ?auto_49788 ?auto_49791 ) ) ( not ( = ?auto_49788 ?auto_49792 ) ) ( not ( = ?auto_49789 ?auto_49790 ) ) ( not ( = ?auto_49789 ?auto_49791 ) ) ( not ( = ?auto_49789 ?auto_49792 ) ) ( not ( = ?auto_49790 ?auto_49791 ) ) ( not ( = ?auto_49790 ?auto_49792 ) ) ( not ( = ?auto_49791 ?auto_49792 ) ) ( ON ?auto_49791 ?auto_49792 ) ( ON ?auto_49790 ?auto_49791 ) ( ON ?auto_49789 ?auto_49790 ) ( CLEAR ?auto_49787 ) ( ON ?auto_49788 ?auto_49789 ) ( CLEAR ?auto_49788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_49784 ?auto_49785 ?auto_49786 ?auto_49787 ?auto_49788 )
      ( MAKE-9PILE ?auto_49784 ?auto_49785 ?auto_49786 ?auto_49787 ?auto_49788 ?auto_49789 ?auto_49790 ?auto_49791 ?auto_49792 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49802 - BLOCK
      ?auto_49803 - BLOCK
      ?auto_49804 - BLOCK
      ?auto_49805 - BLOCK
      ?auto_49806 - BLOCK
      ?auto_49807 - BLOCK
      ?auto_49808 - BLOCK
      ?auto_49809 - BLOCK
      ?auto_49810 - BLOCK
    )
    :vars
    (
      ?auto_49811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49810 ?auto_49811 ) ( ON-TABLE ?auto_49802 ) ( ON ?auto_49803 ?auto_49802 ) ( ON ?auto_49804 ?auto_49803 ) ( not ( = ?auto_49802 ?auto_49803 ) ) ( not ( = ?auto_49802 ?auto_49804 ) ) ( not ( = ?auto_49802 ?auto_49805 ) ) ( not ( = ?auto_49802 ?auto_49806 ) ) ( not ( = ?auto_49802 ?auto_49807 ) ) ( not ( = ?auto_49802 ?auto_49808 ) ) ( not ( = ?auto_49802 ?auto_49809 ) ) ( not ( = ?auto_49802 ?auto_49810 ) ) ( not ( = ?auto_49802 ?auto_49811 ) ) ( not ( = ?auto_49803 ?auto_49804 ) ) ( not ( = ?auto_49803 ?auto_49805 ) ) ( not ( = ?auto_49803 ?auto_49806 ) ) ( not ( = ?auto_49803 ?auto_49807 ) ) ( not ( = ?auto_49803 ?auto_49808 ) ) ( not ( = ?auto_49803 ?auto_49809 ) ) ( not ( = ?auto_49803 ?auto_49810 ) ) ( not ( = ?auto_49803 ?auto_49811 ) ) ( not ( = ?auto_49804 ?auto_49805 ) ) ( not ( = ?auto_49804 ?auto_49806 ) ) ( not ( = ?auto_49804 ?auto_49807 ) ) ( not ( = ?auto_49804 ?auto_49808 ) ) ( not ( = ?auto_49804 ?auto_49809 ) ) ( not ( = ?auto_49804 ?auto_49810 ) ) ( not ( = ?auto_49804 ?auto_49811 ) ) ( not ( = ?auto_49805 ?auto_49806 ) ) ( not ( = ?auto_49805 ?auto_49807 ) ) ( not ( = ?auto_49805 ?auto_49808 ) ) ( not ( = ?auto_49805 ?auto_49809 ) ) ( not ( = ?auto_49805 ?auto_49810 ) ) ( not ( = ?auto_49805 ?auto_49811 ) ) ( not ( = ?auto_49806 ?auto_49807 ) ) ( not ( = ?auto_49806 ?auto_49808 ) ) ( not ( = ?auto_49806 ?auto_49809 ) ) ( not ( = ?auto_49806 ?auto_49810 ) ) ( not ( = ?auto_49806 ?auto_49811 ) ) ( not ( = ?auto_49807 ?auto_49808 ) ) ( not ( = ?auto_49807 ?auto_49809 ) ) ( not ( = ?auto_49807 ?auto_49810 ) ) ( not ( = ?auto_49807 ?auto_49811 ) ) ( not ( = ?auto_49808 ?auto_49809 ) ) ( not ( = ?auto_49808 ?auto_49810 ) ) ( not ( = ?auto_49808 ?auto_49811 ) ) ( not ( = ?auto_49809 ?auto_49810 ) ) ( not ( = ?auto_49809 ?auto_49811 ) ) ( not ( = ?auto_49810 ?auto_49811 ) ) ( ON ?auto_49809 ?auto_49810 ) ( ON ?auto_49808 ?auto_49809 ) ( ON ?auto_49807 ?auto_49808 ) ( ON ?auto_49806 ?auto_49807 ) ( CLEAR ?auto_49804 ) ( ON ?auto_49805 ?auto_49806 ) ( CLEAR ?auto_49805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49802 ?auto_49803 ?auto_49804 ?auto_49805 )
      ( MAKE-9PILE ?auto_49802 ?auto_49803 ?auto_49804 ?auto_49805 ?auto_49806 ?auto_49807 ?auto_49808 ?auto_49809 ?auto_49810 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49821 - BLOCK
      ?auto_49822 - BLOCK
      ?auto_49823 - BLOCK
      ?auto_49824 - BLOCK
      ?auto_49825 - BLOCK
      ?auto_49826 - BLOCK
      ?auto_49827 - BLOCK
      ?auto_49828 - BLOCK
      ?auto_49829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49829 ) ( ON-TABLE ?auto_49821 ) ( ON ?auto_49822 ?auto_49821 ) ( ON ?auto_49823 ?auto_49822 ) ( not ( = ?auto_49821 ?auto_49822 ) ) ( not ( = ?auto_49821 ?auto_49823 ) ) ( not ( = ?auto_49821 ?auto_49824 ) ) ( not ( = ?auto_49821 ?auto_49825 ) ) ( not ( = ?auto_49821 ?auto_49826 ) ) ( not ( = ?auto_49821 ?auto_49827 ) ) ( not ( = ?auto_49821 ?auto_49828 ) ) ( not ( = ?auto_49821 ?auto_49829 ) ) ( not ( = ?auto_49822 ?auto_49823 ) ) ( not ( = ?auto_49822 ?auto_49824 ) ) ( not ( = ?auto_49822 ?auto_49825 ) ) ( not ( = ?auto_49822 ?auto_49826 ) ) ( not ( = ?auto_49822 ?auto_49827 ) ) ( not ( = ?auto_49822 ?auto_49828 ) ) ( not ( = ?auto_49822 ?auto_49829 ) ) ( not ( = ?auto_49823 ?auto_49824 ) ) ( not ( = ?auto_49823 ?auto_49825 ) ) ( not ( = ?auto_49823 ?auto_49826 ) ) ( not ( = ?auto_49823 ?auto_49827 ) ) ( not ( = ?auto_49823 ?auto_49828 ) ) ( not ( = ?auto_49823 ?auto_49829 ) ) ( not ( = ?auto_49824 ?auto_49825 ) ) ( not ( = ?auto_49824 ?auto_49826 ) ) ( not ( = ?auto_49824 ?auto_49827 ) ) ( not ( = ?auto_49824 ?auto_49828 ) ) ( not ( = ?auto_49824 ?auto_49829 ) ) ( not ( = ?auto_49825 ?auto_49826 ) ) ( not ( = ?auto_49825 ?auto_49827 ) ) ( not ( = ?auto_49825 ?auto_49828 ) ) ( not ( = ?auto_49825 ?auto_49829 ) ) ( not ( = ?auto_49826 ?auto_49827 ) ) ( not ( = ?auto_49826 ?auto_49828 ) ) ( not ( = ?auto_49826 ?auto_49829 ) ) ( not ( = ?auto_49827 ?auto_49828 ) ) ( not ( = ?auto_49827 ?auto_49829 ) ) ( not ( = ?auto_49828 ?auto_49829 ) ) ( ON ?auto_49828 ?auto_49829 ) ( ON ?auto_49827 ?auto_49828 ) ( ON ?auto_49826 ?auto_49827 ) ( ON ?auto_49825 ?auto_49826 ) ( CLEAR ?auto_49823 ) ( ON ?auto_49824 ?auto_49825 ) ( CLEAR ?auto_49824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_49821 ?auto_49822 ?auto_49823 ?auto_49824 )
      ( MAKE-9PILE ?auto_49821 ?auto_49822 ?auto_49823 ?auto_49824 ?auto_49825 ?auto_49826 ?auto_49827 ?auto_49828 ?auto_49829 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49839 - BLOCK
      ?auto_49840 - BLOCK
      ?auto_49841 - BLOCK
      ?auto_49842 - BLOCK
      ?auto_49843 - BLOCK
      ?auto_49844 - BLOCK
      ?auto_49845 - BLOCK
      ?auto_49846 - BLOCK
      ?auto_49847 - BLOCK
    )
    :vars
    (
      ?auto_49848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49847 ?auto_49848 ) ( ON-TABLE ?auto_49839 ) ( ON ?auto_49840 ?auto_49839 ) ( not ( = ?auto_49839 ?auto_49840 ) ) ( not ( = ?auto_49839 ?auto_49841 ) ) ( not ( = ?auto_49839 ?auto_49842 ) ) ( not ( = ?auto_49839 ?auto_49843 ) ) ( not ( = ?auto_49839 ?auto_49844 ) ) ( not ( = ?auto_49839 ?auto_49845 ) ) ( not ( = ?auto_49839 ?auto_49846 ) ) ( not ( = ?auto_49839 ?auto_49847 ) ) ( not ( = ?auto_49839 ?auto_49848 ) ) ( not ( = ?auto_49840 ?auto_49841 ) ) ( not ( = ?auto_49840 ?auto_49842 ) ) ( not ( = ?auto_49840 ?auto_49843 ) ) ( not ( = ?auto_49840 ?auto_49844 ) ) ( not ( = ?auto_49840 ?auto_49845 ) ) ( not ( = ?auto_49840 ?auto_49846 ) ) ( not ( = ?auto_49840 ?auto_49847 ) ) ( not ( = ?auto_49840 ?auto_49848 ) ) ( not ( = ?auto_49841 ?auto_49842 ) ) ( not ( = ?auto_49841 ?auto_49843 ) ) ( not ( = ?auto_49841 ?auto_49844 ) ) ( not ( = ?auto_49841 ?auto_49845 ) ) ( not ( = ?auto_49841 ?auto_49846 ) ) ( not ( = ?auto_49841 ?auto_49847 ) ) ( not ( = ?auto_49841 ?auto_49848 ) ) ( not ( = ?auto_49842 ?auto_49843 ) ) ( not ( = ?auto_49842 ?auto_49844 ) ) ( not ( = ?auto_49842 ?auto_49845 ) ) ( not ( = ?auto_49842 ?auto_49846 ) ) ( not ( = ?auto_49842 ?auto_49847 ) ) ( not ( = ?auto_49842 ?auto_49848 ) ) ( not ( = ?auto_49843 ?auto_49844 ) ) ( not ( = ?auto_49843 ?auto_49845 ) ) ( not ( = ?auto_49843 ?auto_49846 ) ) ( not ( = ?auto_49843 ?auto_49847 ) ) ( not ( = ?auto_49843 ?auto_49848 ) ) ( not ( = ?auto_49844 ?auto_49845 ) ) ( not ( = ?auto_49844 ?auto_49846 ) ) ( not ( = ?auto_49844 ?auto_49847 ) ) ( not ( = ?auto_49844 ?auto_49848 ) ) ( not ( = ?auto_49845 ?auto_49846 ) ) ( not ( = ?auto_49845 ?auto_49847 ) ) ( not ( = ?auto_49845 ?auto_49848 ) ) ( not ( = ?auto_49846 ?auto_49847 ) ) ( not ( = ?auto_49846 ?auto_49848 ) ) ( not ( = ?auto_49847 ?auto_49848 ) ) ( ON ?auto_49846 ?auto_49847 ) ( ON ?auto_49845 ?auto_49846 ) ( ON ?auto_49844 ?auto_49845 ) ( ON ?auto_49843 ?auto_49844 ) ( ON ?auto_49842 ?auto_49843 ) ( CLEAR ?auto_49840 ) ( ON ?auto_49841 ?auto_49842 ) ( CLEAR ?auto_49841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49839 ?auto_49840 ?auto_49841 )
      ( MAKE-9PILE ?auto_49839 ?auto_49840 ?auto_49841 ?auto_49842 ?auto_49843 ?auto_49844 ?auto_49845 ?auto_49846 ?auto_49847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49858 - BLOCK
      ?auto_49859 - BLOCK
      ?auto_49860 - BLOCK
      ?auto_49861 - BLOCK
      ?auto_49862 - BLOCK
      ?auto_49863 - BLOCK
      ?auto_49864 - BLOCK
      ?auto_49865 - BLOCK
      ?auto_49866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49866 ) ( ON-TABLE ?auto_49858 ) ( ON ?auto_49859 ?auto_49858 ) ( not ( = ?auto_49858 ?auto_49859 ) ) ( not ( = ?auto_49858 ?auto_49860 ) ) ( not ( = ?auto_49858 ?auto_49861 ) ) ( not ( = ?auto_49858 ?auto_49862 ) ) ( not ( = ?auto_49858 ?auto_49863 ) ) ( not ( = ?auto_49858 ?auto_49864 ) ) ( not ( = ?auto_49858 ?auto_49865 ) ) ( not ( = ?auto_49858 ?auto_49866 ) ) ( not ( = ?auto_49859 ?auto_49860 ) ) ( not ( = ?auto_49859 ?auto_49861 ) ) ( not ( = ?auto_49859 ?auto_49862 ) ) ( not ( = ?auto_49859 ?auto_49863 ) ) ( not ( = ?auto_49859 ?auto_49864 ) ) ( not ( = ?auto_49859 ?auto_49865 ) ) ( not ( = ?auto_49859 ?auto_49866 ) ) ( not ( = ?auto_49860 ?auto_49861 ) ) ( not ( = ?auto_49860 ?auto_49862 ) ) ( not ( = ?auto_49860 ?auto_49863 ) ) ( not ( = ?auto_49860 ?auto_49864 ) ) ( not ( = ?auto_49860 ?auto_49865 ) ) ( not ( = ?auto_49860 ?auto_49866 ) ) ( not ( = ?auto_49861 ?auto_49862 ) ) ( not ( = ?auto_49861 ?auto_49863 ) ) ( not ( = ?auto_49861 ?auto_49864 ) ) ( not ( = ?auto_49861 ?auto_49865 ) ) ( not ( = ?auto_49861 ?auto_49866 ) ) ( not ( = ?auto_49862 ?auto_49863 ) ) ( not ( = ?auto_49862 ?auto_49864 ) ) ( not ( = ?auto_49862 ?auto_49865 ) ) ( not ( = ?auto_49862 ?auto_49866 ) ) ( not ( = ?auto_49863 ?auto_49864 ) ) ( not ( = ?auto_49863 ?auto_49865 ) ) ( not ( = ?auto_49863 ?auto_49866 ) ) ( not ( = ?auto_49864 ?auto_49865 ) ) ( not ( = ?auto_49864 ?auto_49866 ) ) ( not ( = ?auto_49865 ?auto_49866 ) ) ( ON ?auto_49865 ?auto_49866 ) ( ON ?auto_49864 ?auto_49865 ) ( ON ?auto_49863 ?auto_49864 ) ( ON ?auto_49862 ?auto_49863 ) ( ON ?auto_49861 ?auto_49862 ) ( CLEAR ?auto_49859 ) ( ON ?auto_49860 ?auto_49861 ) ( CLEAR ?auto_49860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_49858 ?auto_49859 ?auto_49860 )
      ( MAKE-9PILE ?auto_49858 ?auto_49859 ?auto_49860 ?auto_49861 ?auto_49862 ?auto_49863 ?auto_49864 ?auto_49865 ?auto_49866 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49876 - BLOCK
      ?auto_49877 - BLOCK
      ?auto_49878 - BLOCK
      ?auto_49879 - BLOCK
      ?auto_49880 - BLOCK
      ?auto_49881 - BLOCK
      ?auto_49882 - BLOCK
      ?auto_49883 - BLOCK
      ?auto_49884 - BLOCK
    )
    :vars
    (
      ?auto_49885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49884 ?auto_49885 ) ( ON-TABLE ?auto_49876 ) ( not ( = ?auto_49876 ?auto_49877 ) ) ( not ( = ?auto_49876 ?auto_49878 ) ) ( not ( = ?auto_49876 ?auto_49879 ) ) ( not ( = ?auto_49876 ?auto_49880 ) ) ( not ( = ?auto_49876 ?auto_49881 ) ) ( not ( = ?auto_49876 ?auto_49882 ) ) ( not ( = ?auto_49876 ?auto_49883 ) ) ( not ( = ?auto_49876 ?auto_49884 ) ) ( not ( = ?auto_49876 ?auto_49885 ) ) ( not ( = ?auto_49877 ?auto_49878 ) ) ( not ( = ?auto_49877 ?auto_49879 ) ) ( not ( = ?auto_49877 ?auto_49880 ) ) ( not ( = ?auto_49877 ?auto_49881 ) ) ( not ( = ?auto_49877 ?auto_49882 ) ) ( not ( = ?auto_49877 ?auto_49883 ) ) ( not ( = ?auto_49877 ?auto_49884 ) ) ( not ( = ?auto_49877 ?auto_49885 ) ) ( not ( = ?auto_49878 ?auto_49879 ) ) ( not ( = ?auto_49878 ?auto_49880 ) ) ( not ( = ?auto_49878 ?auto_49881 ) ) ( not ( = ?auto_49878 ?auto_49882 ) ) ( not ( = ?auto_49878 ?auto_49883 ) ) ( not ( = ?auto_49878 ?auto_49884 ) ) ( not ( = ?auto_49878 ?auto_49885 ) ) ( not ( = ?auto_49879 ?auto_49880 ) ) ( not ( = ?auto_49879 ?auto_49881 ) ) ( not ( = ?auto_49879 ?auto_49882 ) ) ( not ( = ?auto_49879 ?auto_49883 ) ) ( not ( = ?auto_49879 ?auto_49884 ) ) ( not ( = ?auto_49879 ?auto_49885 ) ) ( not ( = ?auto_49880 ?auto_49881 ) ) ( not ( = ?auto_49880 ?auto_49882 ) ) ( not ( = ?auto_49880 ?auto_49883 ) ) ( not ( = ?auto_49880 ?auto_49884 ) ) ( not ( = ?auto_49880 ?auto_49885 ) ) ( not ( = ?auto_49881 ?auto_49882 ) ) ( not ( = ?auto_49881 ?auto_49883 ) ) ( not ( = ?auto_49881 ?auto_49884 ) ) ( not ( = ?auto_49881 ?auto_49885 ) ) ( not ( = ?auto_49882 ?auto_49883 ) ) ( not ( = ?auto_49882 ?auto_49884 ) ) ( not ( = ?auto_49882 ?auto_49885 ) ) ( not ( = ?auto_49883 ?auto_49884 ) ) ( not ( = ?auto_49883 ?auto_49885 ) ) ( not ( = ?auto_49884 ?auto_49885 ) ) ( ON ?auto_49883 ?auto_49884 ) ( ON ?auto_49882 ?auto_49883 ) ( ON ?auto_49881 ?auto_49882 ) ( ON ?auto_49880 ?auto_49881 ) ( ON ?auto_49879 ?auto_49880 ) ( ON ?auto_49878 ?auto_49879 ) ( CLEAR ?auto_49876 ) ( ON ?auto_49877 ?auto_49878 ) ( CLEAR ?auto_49877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49876 ?auto_49877 )
      ( MAKE-9PILE ?auto_49876 ?auto_49877 ?auto_49878 ?auto_49879 ?auto_49880 ?auto_49881 ?auto_49882 ?auto_49883 ?auto_49884 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49895 - BLOCK
      ?auto_49896 - BLOCK
      ?auto_49897 - BLOCK
      ?auto_49898 - BLOCK
      ?auto_49899 - BLOCK
      ?auto_49900 - BLOCK
      ?auto_49901 - BLOCK
      ?auto_49902 - BLOCK
      ?auto_49903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49903 ) ( ON-TABLE ?auto_49895 ) ( not ( = ?auto_49895 ?auto_49896 ) ) ( not ( = ?auto_49895 ?auto_49897 ) ) ( not ( = ?auto_49895 ?auto_49898 ) ) ( not ( = ?auto_49895 ?auto_49899 ) ) ( not ( = ?auto_49895 ?auto_49900 ) ) ( not ( = ?auto_49895 ?auto_49901 ) ) ( not ( = ?auto_49895 ?auto_49902 ) ) ( not ( = ?auto_49895 ?auto_49903 ) ) ( not ( = ?auto_49896 ?auto_49897 ) ) ( not ( = ?auto_49896 ?auto_49898 ) ) ( not ( = ?auto_49896 ?auto_49899 ) ) ( not ( = ?auto_49896 ?auto_49900 ) ) ( not ( = ?auto_49896 ?auto_49901 ) ) ( not ( = ?auto_49896 ?auto_49902 ) ) ( not ( = ?auto_49896 ?auto_49903 ) ) ( not ( = ?auto_49897 ?auto_49898 ) ) ( not ( = ?auto_49897 ?auto_49899 ) ) ( not ( = ?auto_49897 ?auto_49900 ) ) ( not ( = ?auto_49897 ?auto_49901 ) ) ( not ( = ?auto_49897 ?auto_49902 ) ) ( not ( = ?auto_49897 ?auto_49903 ) ) ( not ( = ?auto_49898 ?auto_49899 ) ) ( not ( = ?auto_49898 ?auto_49900 ) ) ( not ( = ?auto_49898 ?auto_49901 ) ) ( not ( = ?auto_49898 ?auto_49902 ) ) ( not ( = ?auto_49898 ?auto_49903 ) ) ( not ( = ?auto_49899 ?auto_49900 ) ) ( not ( = ?auto_49899 ?auto_49901 ) ) ( not ( = ?auto_49899 ?auto_49902 ) ) ( not ( = ?auto_49899 ?auto_49903 ) ) ( not ( = ?auto_49900 ?auto_49901 ) ) ( not ( = ?auto_49900 ?auto_49902 ) ) ( not ( = ?auto_49900 ?auto_49903 ) ) ( not ( = ?auto_49901 ?auto_49902 ) ) ( not ( = ?auto_49901 ?auto_49903 ) ) ( not ( = ?auto_49902 ?auto_49903 ) ) ( ON ?auto_49902 ?auto_49903 ) ( ON ?auto_49901 ?auto_49902 ) ( ON ?auto_49900 ?auto_49901 ) ( ON ?auto_49899 ?auto_49900 ) ( ON ?auto_49898 ?auto_49899 ) ( ON ?auto_49897 ?auto_49898 ) ( CLEAR ?auto_49895 ) ( ON ?auto_49896 ?auto_49897 ) ( CLEAR ?auto_49896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_49895 ?auto_49896 )
      ( MAKE-9PILE ?auto_49895 ?auto_49896 ?auto_49897 ?auto_49898 ?auto_49899 ?auto_49900 ?auto_49901 ?auto_49902 ?auto_49903 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49913 - BLOCK
      ?auto_49914 - BLOCK
      ?auto_49915 - BLOCK
      ?auto_49916 - BLOCK
      ?auto_49917 - BLOCK
      ?auto_49918 - BLOCK
      ?auto_49919 - BLOCK
      ?auto_49920 - BLOCK
      ?auto_49921 - BLOCK
    )
    :vars
    (
      ?auto_49922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49921 ?auto_49922 ) ( not ( = ?auto_49913 ?auto_49914 ) ) ( not ( = ?auto_49913 ?auto_49915 ) ) ( not ( = ?auto_49913 ?auto_49916 ) ) ( not ( = ?auto_49913 ?auto_49917 ) ) ( not ( = ?auto_49913 ?auto_49918 ) ) ( not ( = ?auto_49913 ?auto_49919 ) ) ( not ( = ?auto_49913 ?auto_49920 ) ) ( not ( = ?auto_49913 ?auto_49921 ) ) ( not ( = ?auto_49913 ?auto_49922 ) ) ( not ( = ?auto_49914 ?auto_49915 ) ) ( not ( = ?auto_49914 ?auto_49916 ) ) ( not ( = ?auto_49914 ?auto_49917 ) ) ( not ( = ?auto_49914 ?auto_49918 ) ) ( not ( = ?auto_49914 ?auto_49919 ) ) ( not ( = ?auto_49914 ?auto_49920 ) ) ( not ( = ?auto_49914 ?auto_49921 ) ) ( not ( = ?auto_49914 ?auto_49922 ) ) ( not ( = ?auto_49915 ?auto_49916 ) ) ( not ( = ?auto_49915 ?auto_49917 ) ) ( not ( = ?auto_49915 ?auto_49918 ) ) ( not ( = ?auto_49915 ?auto_49919 ) ) ( not ( = ?auto_49915 ?auto_49920 ) ) ( not ( = ?auto_49915 ?auto_49921 ) ) ( not ( = ?auto_49915 ?auto_49922 ) ) ( not ( = ?auto_49916 ?auto_49917 ) ) ( not ( = ?auto_49916 ?auto_49918 ) ) ( not ( = ?auto_49916 ?auto_49919 ) ) ( not ( = ?auto_49916 ?auto_49920 ) ) ( not ( = ?auto_49916 ?auto_49921 ) ) ( not ( = ?auto_49916 ?auto_49922 ) ) ( not ( = ?auto_49917 ?auto_49918 ) ) ( not ( = ?auto_49917 ?auto_49919 ) ) ( not ( = ?auto_49917 ?auto_49920 ) ) ( not ( = ?auto_49917 ?auto_49921 ) ) ( not ( = ?auto_49917 ?auto_49922 ) ) ( not ( = ?auto_49918 ?auto_49919 ) ) ( not ( = ?auto_49918 ?auto_49920 ) ) ( not ( = ?auto_49918 ?auto_49921 ) ) ( not ( = ?auto_49918 ?auto_49922 ) ) ( not ( = ?auto_49919 ?auto_49920 ) ) ( not ( = ?auto_49919 ?auto_49921 ) ) ( not ( = ?auto_49919 ?auto_49922 ) ) ( not ( = ?auto_49920 ?auto_49921 ) ) ( not ( = ?auto_49920 ?auto_49922 ) ) ( not ( = ?auto_49921 ?auto_49922 ) ) ( ON ?auto_49920 ?auto_49921 ) ( ON ?auto_49919 ?auto_49920 ) ( ON ?auto_49918 ?auto_49919 ) ( ON ?auto_49917 ?auto_49918 ) ( ON ?auto_49916 ?auto_49917 ) ( ON ?auto_49915 ?auto_49916 ) ( ON ?auto_49914 ?auto_49915 ) ( ON ?auto_49913 ?auto_49914 ) ( CLEAR ?auto_49913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49913 )
      ( MAKE-9PILE ?auto_49913 ?auto_49914 ?auto_49915 ?auto_49916 ?auto_49917 ?auto_49918 ?auto_49919 ?auto_49920 ?auto_49921 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49932 - BLOCK
      ?auto_49933 - BLOCK
      ?auto_49934 - BLOCK
      ?auto_49935 - BLOCK
      ?auto_49936 - BLOCK
      ?auto_49937 - BLOCK
      ?auto_49938 - BLOCK
      ?auto_49939 - BLOCK
      ?auto_49940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_49940 ) ( not ( = ?auto_49932 ?auto_49933 ) ) ( not ( = ?auto_49932 ?auto_49934 ) ) ( not ( = ?auto_49932 ?auto_49935 ) ) ( not ( = ?auto_49932 ?auto_49936 ) ) ( not ( = ?auto_49932 ?auto_49937 ) ) ( not ( = ?auto_49932 ?auto_49938 ) ) ( not ( = ?auto_49932 ?auto_49939 ) ) ( not ( = ?auto_49932 ?auto_49940 ) ) ( not ( = ?auto_49933 ?auto_49934 ) ) ( not ( = ?auto_49933 ?auto_49935 ) ) ( not ( = ?auto_49933 ?auto_49936 ) ) ( not ( = ?auto_49933 ?auto_49937 ) ) ( not ( = ?auto_49933 ?auto_49938 ) ) ( not ( = ?auto_49933 ?auto_49939 ) ) ( not ( = ?auto_49933 ?auto_49940 ) ) ( not ( = ?auto_49934 ?auto_49935 ) ) ( not ( = ?auto_49934 ?auto_49936 ) ) ( not ( = ?auto_49934 ?auto_49937 ) ) ( not ( = ?auto_49934 ?auto_49938 ) ) ( not ( = ?auto_49934 ?auto_49939 ) ) ( not ( = ?auto_49934 ?auto_49940 ) ) ( not ( = ?auto_49935 ?auto_49936 ) ) ( not ( = ?auto_49935 ?auto_49937 ) ) ( not ( = ?auto_49935 ?auto_49938 ) ) ( not ( = ?auto_49935 ?auto_49939 ) ) ( not ( = ?auto_49935 ?auto_49940 ) ) ( not ( = ?auto_49936 ?auto_49937 ) ) ( not ( = ?auto_49936 ?auto_49938 ) ) ( not ( = ?auto_49936 ?auto_49939 ) ) ( not ( = ?auto_49936 ?auto_49940 ) ) ( not ( = ?auto_49937 ?auto_49938 ) ) ( not ( = ?auto_49937 ?auto_49939 ) ) ( not ( = ?auto_49937 ?auto_49940 ) ) ( not ( = ?auto_49938 ?auto_49939 ) ) ( not ( = ?auto_49938 ?auto_49940 ) ) ( not ( = ?auto_49939 ?auto_49940 ) ) ( ON ?auto_49939 ?auto_49940 ) ( ON ?auto_49938 ?auto_49939 ) ( ON ?auto_49937 ?auto_49938 ) ( ON ?auto_49936 ?auto_49937 ) ( ON ?auto_49935 ?auto_49936 ) ( ON ?auto_49934 ?auto_49935 ) ( ON ?auto_49933 ?auto_49934 ) ( ON ?auto_49932 ?auto_49933 ) ( CLEAR ?auto_49932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49932 )
      ( MAKE-9PILE ?auto_49932 ?auto_49933 ?auto_49934 ?auto_49935 ?auto_49936 ?auto_49937 ?auto_49938 ?auto_49939 ?auto_49940 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_49950 - BLOCK
      ?auto_49951 - BLOCK
      ?auto_49952 - BLOCK
      ?auto_49953 - BLOCK
      ?auto_49954 - BLOCK
      ?auto_49955 - BLOCK
      ?auto_49956 - BLOCK
      ?auto_49957 - BLOCK
      ?auto_49958 - BLOCK
    )
    :vars
    (
      ?auto_49959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49950 ?auto_49951 ) ) ( not ( = ?auto_49950 ?auto_49952 ) ) ( not ( = ?auto_49950 ?auto_49953 ) ) ( not ( = ?auto_49950 ?auto_49954 ) ) ( not ( = ?auto_49950 ?auto_49955 ) ) ( not ( = ?auto_49950 ?auto_49956 ) ) ( not ( = ?auto_49950 ?auto_49957 ) ) ( not ( = ?auto_49950 ?auto_49958 ) ) ( not ( = ?auto_49951 ?auto_49952 ) ) ( not ( = ?auto_49951 ?auto_49953 ) ) ( not ( = ?auto_49951 ?auto_49954 ) ) ( not ( = ?auto_49951 ?auto_49955 ) ) ( not ( = ?auto_49951 ?auto_49956 ) ) ( not ( = ?auto_49951 ?auto_49957 ) ) ( not ( = ?auto_49951 ?auto_49958 ) ) ( not ( = ?auto_49952 ?auto_49953 ) ) ( not ( = ?auto_49952 ?auto_49954 ) ) ( not ( = ?auto_49952 ?auto_49955 ) ) ( not ( = ?auto_49952 ?auto_49956 ) ) ( not ( = ?auto_49952 ?auto_49957 ) ) ( not ( = ?auto_49952 ?auto_49958 ) ) ( not ( = ?auto_49953 ?auto_49954 ) ) ( not ( = ?auto_49953 ?auto_49955 ) ) ( not ( = ?auto_49953 ?auto_49956 ) ) ( not ( = ?auto_49953 ?auto_49957 ) ) ( not ( = ?auto_49953 ?auto_49958 ) ) ( not ( = ?auto_49954 ?auto_49955 ) ) ( not ( = ?auto_49954 ?auto_49956 ) ) ( not ( = ?auto_49954 ?auto_49957 ) ) ( not ( = ?auto_49954 ?auto_49958 ) ) ( not ( = ?auto_49955 ?auto_49956 ) ) ( not ( = ?auto_49955 ?auto_49957 ) ) ( not ( = ?auto_49955 ?auto_49958 ) ) ( not ( = ?auto_49956 ?auto_49957 ) ) ( not ( = ?auto_49956 ?auto_49958 ) ) ( not ( = ?auto_49957 ?auto_49958 ) ) ( ON ?auto_49950 ?auto_49959 ) ( not ( = ?auto_49958 ?auto_49959 ) ) ( not ( = ?auto_49957 ?auto_49959 ) ) ( not ( = ?auto_49956 ?auto_49959 ) ) ( not ( = ?auto_49955 ?auto_49959 ) ) ( not ( = ?auto_49954 ?auto_49959 ) ) ( not ( = ?auto_49953 ?auto_49959 ) ) ( not ( = ?auto_49952 ?auto_49959 ) ) ( not ( = ?auto_49951 ?auto_49959 ) ) ( not ( = ?auto_49950 ?auto_49959 ) ) ( ON ?auto_49951 ?auto_49950 ) ( ON ?auto_49952 ?auto_49951 ) ( ON ?auto_49953 ?auto_49952 ) ( ON ?auto_49954 ?auto_49953 ) ( ON ?auto_49955 ?auto_49954 ) ( ON ?auto_49956 ?auto_49955 ) ( ON ?auto_49957 ?auto_49956 ) ( ON ?auto_49958 ?auto_49957 ) ( CLEAR ?auto_49958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_49958 ?auto_49957 ?auto_49956 ?auto_49955 ?auto_49954 ?auto_49953 ?auto_49952 ?auto_49951 ?auto_49950 )
      ( MAKE-9PILE ?auto_49950 ?auto_49951 ?auto_49952 ?auto_49953 ?auto_49954 ?auto_49955 ?auto_49956 ?auto_49957 ?auto_49958 ) )
  )

)

