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
      ?auto_11693 - BLOCK
    )
    :vars
    (
      ?auto_11694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11693 ?auto_11694 ) ( CLEAR ?auto_11693 ) ( HAND-EMPTY ) ( not ( = ?auto_11693 ?auto_11694 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11693 ?auto_11694 )
      ( !PUTDOWN ?auto_11693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11700 - BLOCK
      ?auto_11701 - BLOCK
    )
    :vars
    (
      ?auto_11702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11700 ) ( ON ?auto_11701 ?auto_11702 ) ( CLEAR ?auto_11701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11700 ) ( not ( = ?auto_11700 ?auto_11701 ) ) ( not ( = ?auto_11700 ?auto_11702 ) ) ( not ( = ?auto_11701 ?auto_11702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11701 ?auto_11702 )
      ( !STACK ?auto_11701 ?auto_11700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11710 - BLOCK
      ?auto_11711 - BLOCK
    )
    :vars
    (
      ?auto_11712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11711 ?auto_11712 ) ( not ( = ?auto_11710 ?auto_11711 ) ) ( not ( = ?auto_11710 ?auto_11712 ) ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( ON ?auto_11710 ?auto_11711 ) ( CLEAR ?auto_11710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11710 )
      ( MAKE-2PILE ?auto_11710 ?auto_11711 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11721 - BLOCK
      ?auto_11722 - BLOCK
      ?auto_11723 - BLOCK
    )
    :vars
    (
      ?auto_11724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11722 ) ( ON ?auto_11723 ?auto_11724 ) ( CLEAR ?auto_11723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11721 ) ( ON ?auto_11722 ?auto_11721 ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11723 ) ) ( not ( = ?auto_11721 ?auto_11724 ) ) ( not ( = ?auto_11722 ?auto_11723 ) ) ( not ( = ?auto_11722 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11723 ?auto_11724 )
      ( !STACK ?auto_11723 ?auto_11722 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11735 - BLOCK
      ?auto_11736 - BLOCK
      ?auto_11737 - BLOCK
    )
    :vars
    (
      ?auto_11738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11737 ?auto_11738 ) ( ON-TABLE ?auto_11735 ) ( not ( = ?auto_11735 ?auto_11736 ) ) ( not ( = ?auto_11735 ?auto_11737 ) ) ( not ( = ?auto_11735 ?auto_11738 ) ) ( not ( = ?auto_11736 ?auto_11737 ) ) ( not ( = ?auto_11736 ?auto_11738 ) ) ( not ( = ?auto_11737 ?auto_11738 ) ) ( CLEAR ?auto_11735 ) ( ON ?auto_11736 ?auto_11737 ) ( CLEAR ?auto_11736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11735 ?auto_11736 )
      ( MAKE-3PILE ?auto_11735 ?auto_11736 ?auto_11737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11749 - BLOCK
      ?auto_11750 - BLOCK
      ?auto_11751 - BLOCK
    )
    :vars
    (
      ?auto_11752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11751 ?auto_11752 ) ( not ( = ?auto_11749 ?auto_11750 ) ) ( not ( = ?auto_11749 ?auto_11751 ) ) ( not ( = ?auto_11749 ?auto_11752 ) ) ( not ( = ?auto_11750 ?auto_11751 ) ) ( not ( = ?auto_11750 ?auto_11752 ) ) ( not ( = ?auto_11751 ?auto_11752 ) ) ( ON ?auto_11750 ?auto_11751 ) ( ON ?auto_11749 ?auto_11750 ) ( CLEAR ?auto_11749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11749 )
      ( MAKE-3PILE ?auto_11749 ?auto_11750 ?auto_11751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11764 - BLOCK
      ?auto_11765 - BLOCK
      ?auto_11766 - BLOCK
      ?auto_11767 - BLOCK
    )
    :vars
    (
      ?auto_11768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11766 ) ( ON ?auto_11767 ?auto_11768 ) ( CLEAR ?auto_11767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11764 ) ( ON ?auto_11765 ?auto_11764 ) ( ON ?auto_11766 ?auto_11765 ) ( not ( = ?auto_11764 ?auto_11765 ) ) ( not ( = ?auto_11764 ?auto_11766 ) ) ( not ( = ?auto_11764 ?auto_11767 ) ) ( not ( = ?auto_11764 ?auto_11768 ) ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11765 ?auto_11767 ) ) ( not ( = ?auto_11765 ?auto_11768 ) ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( not ( = ?auto_11767 ?auto_11768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11767 ?auto_11768 )
      ( !STACK ?auto_11767 ?auto_11766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11782 - BLOCK
      ?auto_11783 - BLOCK
      ?auto_11784 - BLOCK
      ?auto_11785 - BLOCK
    )
    :vars
    (
      ?auto_11786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11785 ?auto_11786 ) ( ON-TABLE ?auto_11782 ) ( ON ?auto_11783 ?auto_11782 ) ( not ( = ?auto_11782 ?auto_11783 ) ) ( not ( = ?auto_11782 ?auto_11784 ) ) ( not ( = ?auto_11782 ?auto_11785 ) ) ( not ( = ?auto_11782 ?auto_11786 ) ) ( not ( = ?auto_11783 ?auto_11784 ) ) ( not ( = ?auto_11783 ?auto_11785 ) ) ( not ( = ?auto_11783 ?auto_11786 ) ) ( not ( = ?auto_11784 ?auto_11785 ) ) ( not ( = ?auto_11784 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( CLEAR ?auto_11783 ) ( ON ?auto_11784 ?auto_11785 ) ( CLEAR ?auto_11784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11782 ?auto_11783 ?auto_11784 )
      ( MAKE-4PILE ?auto_11782 ?auto_11783 ?auto_11784 ?auto_11785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11800 - BLOCK
      ?auto_11801 - BLOCK
      ?auto_11802 - BLOCK
      ?auto_11803 - BLOCK
    )
    :vars
    (
      ?auto_11804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11803 ?auto_11804 ) ( ON-TABLE ?auto_11800 ) ( not ( = ?auto_11800 ?auto_11801 ) ) ( not ( = ?auto_11800 ?auto_11802 ) ) ( not ( = ?auto_11800 ?auto_11803 ) ) ( not ( = ?auto_11800 ?auto_11804 ) ) ( not ( = ?auto_11801 ?auto_11802 ) ) ( not ( = ?auto_11801 ?auto_11803 ) ) ( not ( = ?auto_11801 ?auto_11804 ) ) ( not ( = ?auto_11802 ?auto_11803 ) ) ( not ( = ?auto_11802 ?auto_11804 ) ) ( not ( = ?auto_11803 ?auto_11804 ) ) ( ON ?auto_11802 ?auto_11803 ) ( CLEAR ?auto_11800 ) ( ON ?auto_11801 ?auto_11802 ) ( CLEAR ?auto_11801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11800 ?auto_11801 )
      ( MAKE-4PILE ?auto_11800 ?auto_11801 ?auto_11802 ?auto_11803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11818 - BLOCK
      ?auto_11819 - BLOCK
      ?auto_11820 - BLOCK
      ?auto_11821 - BLOCK
    )
    :vars
    (
      ?auto_11822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11821 ?auto_11822 ) ( not ( = ?auto_11818 ?auto_11819 ) ) ( not ( = ?auto_11818 ?auto_11820 ) ) ( not ( = ?auto_11818 ?auto_11821 ) ) ( not ( = ?auto_11818 ?auto_11822 ) ) ( not ( = ?auto_11819 ?auto_11820 ) ) ( not ( = ?auto_11819 ?auto_11821 ) ) ( not ( = ?auto_11819 ?auto_11822 ) ) ( not ( = ?auto_11820 ?auto_11821 ) ) ( not ( = ?auto_11820 ?auto_11822 ) ) ( not ( = ?auto_11821 ?auto_11822 ) ) ( ON ?auto_11820 ?auto_11821 ) ( ON ?auto_11819 ?auto_11820 ) ( ON ?auto_11818 ?auto_11819 ) ( CLEAR ?auto_11818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11818 )
      ( MAKE-4PILE ?auto_11818 ?auto_11819 ?auto_11820 ?auto_11821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11837 - BLOCK
      ?auto_11838 - BLOCK
      ?auto_11839 - BLOCK
      ?auto_11840 - BLOCK
      ?auto_11841 - BLOCK
    )
    :vars
    (
      ?auto_11842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11840 ) ( ON ?auto_11841 ?auto_11842 ) ( CLEAR ?auto_11841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11837 ) ( ON ?auto_11838 ?auto_11837 ) ( ON ?auto_11839 ?auto_11838 ) ( ON ?auto_11840 ?auto_11839 ) ( not ( = ?auto_11837 ?auto_11838 ) ) ( not ( = ?auto_11837 ?auto_11839 ) ) ( not ( = ?auto_11837 ?auto_11840 ) ) ( not ( = ?auto_11837 ?auto_11841 ) ) ( not ( = ?auto_11837 ?auto_11842 ) ) ( not ( = ?auto_11838 ?auto_11839 ) ) ( not ( = ?auto_11838 ?auto_11840 ) ) ( not ( = ?auto_11838 ?auto_11841 ) ) ( not ( = ?auto_11838 ?auto_11842 ) ) ( not ( = ?auto_11839 ?auto_11840 ) ) ( not ( = ?auto_11839 ?auto_11841 ) ) ( not ( = ?auto_11839 ?auto_11842 ) ) ( not ( = ?auto_11840 ?auto_11841 ) ) ( not ( = ?auto_11840 ?auto_11842 ) ) ( not ( = ?auto_11841 ?auto_11842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11841 ?auto_11842 )
      ( !STACK ?auto_11841 ?auto_11840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11859 - BLOCK
      ?auto_11860 - BLOCK
      ?auto_11861 - BLOCK
      ?auto_11862 - BLOCK
      ?auto_11863 - BLOCK
    )
    :vars
    (
      ?auto_11864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11863 ?auto_11864 ) ( ON-TABLE ?auto_11859 ) ( ON ?auto_11860 ?auto_11859 ) ( ON ?auto_11861 ?auto_11860 ) ( not ( = ?auto_11859 ?auto_11860 ) ) ( not ( = ?auto_11859 ?auto_11861 ) ) ( not ( = ?auto_11859 ?auto_11862 ) ) ( not ( = ?auto_11859 ?auto_11863 ) ) ( not ( = ?auto_11859 ?auto_11864 ) ) ( not ( = ?auto_11860 ?auto_11861 ) ) ( not ( = ?auto_11860 ?auto_11862 ) ) ( not ( = ?auto_11860 ?auto_11863 ) ) ( not ( = ?auto_11860 ?auto_11864 ) ) ( not ( = ?auto_11861 ?auto_11862 ) ) ( not ( = ?auto_11861 ?auto_11863 ) ) ( not ( = ?auto_11861 ?auto_11864 ) ) ( not ( = ?auto_11862 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11864 ) ) ( not ( = ?auto_11863 ?auto_11864 ) ) ( CLEAR ?auto_11861 ) ( ON ?auto_11862 ?auto_11863 ) ( CLEAR ?auto_11862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11859 ?auto_11860 ?auto_11861 ?auto_11862 )
      ( MAKE-5PILE ?auto_11859 ?auto_11860 ?auto_11861 ?auto_11862 ?auto_11863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11881 - BLOCK
      ?auto_11882 - BLOCK
      ?auto_11883 - BLOCK
      ?auto_11884 - BLOCK
      ?auto_11885 - BLOCK
    )
    :vars
    (
      ?auto_11886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11885 ?auto_11886 ) ( ON-TABLE ?auto_11881 ) ( ON ?auto_11882 ?auto_11881 ) ( not ( = ?auto_11881 ?auto_11882 ) ) ( not ( = ?auto_11881 ?auto_11883 ) ) ( not ( = ?auto_11881 ?auto_11884 ) ) ( not ( = ?auto_11881 ?auto_11885 ) ) ( not ( = ?auto_11881 ?auto_11886 ) ) ( not ( = ?auto_11882 ?auto_11883 ) ) ( not ( = ?auto_11882 ?auto_11884 ) ) ( not ( = ?auto_11882 ?auto_11885 ) ) ( not ( = ?auto_11882 ?auto_11886 ) ) ( not ( = ?auto_11883 ?auto_11884 ) ) ( not ( = ?auto_11883 ?auto_11885 ) ) ( not ( = ?auto_11883 ?auto_11886 ) ) ( not ( = ?auto_11884 ?auto_11885 ) ) ( not ( = ?auto_11884 ?auto_11886 ) ) ( not ( = ?auto_11885 ?auto_11886 ) ) ( ON ?auto_11884 ?auto_11885 ) ( CLEAR ?auto_11882 ) ( ON ?auto_11883 ?auto_11884 ) ( CLEAR ?auto_11883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11881 ?auto_11882 ?auto_11883 )
      ( MAKE-5PILE ?auto_11881 ?auto_11882 ?auto_11883 ?auto_11884 ?auto_11885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11903 - BLOCK
      ?auto_11904 - BLOCK
      ?auto_11905 - BLOCK
      ?auto_11906 - BLOCK
      ?auto_11907 - BLOCK
    )
    :vars
    (
      ?auto_11908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11907 ?auto_11908 ) ( ON-TABLE ?auto_11903 ) ( not ( = ?auto_11903 ?auto_11904 ) ) ( not ( = ?auto_11903 ?auto_11905 ) ) ( not ( = ?auto_11903 ?auto_11906 ) ) ( not ( = ?auto_11903 ?auto_11907 ) ) ( not ( = ?auto_11903 ?auto_11908 ) ) ( not ( = ?auto_11904 ?auto_11905 ) ) ( not ( = ?auto_11904 ?auto_11906 ) ) ( not ( = ?auto_11904 ?auto_11907 ) ) ( not ( = ?auto_11904 ?auto_11908 ) ) ( not ( = ?auto_11905 ?auto_11906 ) ) ( not ( = ?auto_11905 ?auto_11907 ) ) ( not ( = ?auto_11905 ?auto_11908 ) ) ( not ( = ?auto_11906 ?auto_11907 ) ) ( not ( = ?auto_11906 ?auto_11908 ) ) ( not ( = ?auto_11907 ?auto_11908 ) ) ( ON ?auto_11906 ?auto_11907 ) ( ON ?auto_11905 ?auto_11906 ) ( CLEAR ?auto_11903 ) ( ON ?auto_11904 ?auto_11905 ) ( CLEAR ?auto_11904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11903 ?auto_11904 )
      ( MAKE-5PILE ?auto_11903 ?auto_11904 ?auto_11905 ?auto_11906 ?auto_11907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11925 - BLOCK
      ?auto_11926 - BLOCK
      ?auto_11927 - BLOCK
      ?auto_11928 - BLOCK
      ?auto_11929 - BLOCK
    )
    :vars
    (
      ?auto_11930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11929 ?auto_11930 ) ( not ( = ?auto_11925 ?auto_11926 ) ) ( not ( = ?auto_11925 ?auto_11927 ) ) ( not ( = ?auto_11925 ?auto_11928 ) ) ( not ( = ?auto_11925 ?auto_11929 ) ) ( not ( = ?auto_11925 ?auto_11930 ) ) ( not ( = ?auto_11926 ?auto_11927 ) ) ( not ( = ?auto_11926 ?auto_11928 ) ) ( not ( = ?auto_11926 ?auto_11929 ) ) ( not ( = ?auto_11926 ?auto_11930 ) ) ( not ( = ?auto_11927 ?auto_11928 ) ) ( not ( = ?auto_11927 ?auto_11929 ) ) ( not ( = ?auto_11927 ?auto_11930 ) ) ( not ( = ?auto_11928 ?auto_11929 ) ) ( not ( = ?auto_11928 ?auto_11930 ) ) ( not ( = ?auto_11929 ?auto_11930 ) ) ( ON ?auto_11928 ?auto_11929 ) ( ON ?auto_11927 ?auto_11928 ) ( ON ?auto_11926 ?auto_11927 ) ( ON ?auto_11925 ?auto_11926 ) ( CLEAR ?auto_11925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11925 )
      ( MAKE-5PILE ?auto_11925 ?auto_11926 ?auto_11927 ?auto_11928 ?auto_11929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11948 - BLOCK
      ?auto_11949 - BLOCK
      ?auto_11950 - BLOCK
      ?auto_11951 - BLOCK
      ?auto_11952 - BLOCK
      ?auto_11953 - BLOCK
    )
    :vars
    (
      ?auto_11954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11952 ) ( ON ?auto_11953 ?auto_11954 ) ( CLEAR ?auto_11953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11948 ) ( ON ?auto_11949 ?auto_11948 ) ( ON ?auto_11950 ?auto_11949 ) ( ON ?auto_11951 ?auto_11950 ) ( ON ?auto_11952 ?auto_11951 ) ( not ( = ?auto_11948 ?auto_11949 ) ) ( not ( = ?auto_11948 ?auto_11950 ) ) ( not ( = ?auto_11948 ?auto_11951 ) ) ( not ( = ?auto_11948 ?auto_11952 ) ) ( not ( = ?auto_11948 ?auto_11953 ) ) ( not ( = ?auto_11948 ?auto_11954 ) ) ( not ( = ?auto_11949 ?auto_11950 ) ) ( not ( = ?auto_11949 ?auto_11951 ) ) ( not ( = ?auto_11949 ?auto_11952 ) ) ( not ( = ?auto_11949 ?auto_11953 ) ) ( not ( = ?auto_11949 ?auto_11954 ) ) ( not ( = ?auto_11950 ?auto_11951 ) ) ( not ( = ?auto_11950 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11953 ) ) ( not ( = ?auto_11950 ?auto_11954 ) ) ( not ( = ?auto_11951 ?auto_11952 ) ) ( not ( = ?auto_11951 ?auto_11953 ) ) ( not ( = ?auto_11951 ?auto_11954 ) ) ( not ( = ?auto_11952 ?auto_11953 ) ) ( not ( = ?auto_11952 ?auto_11954 ) ) ( not ( = ?auto_11953 ?auto_11954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11953 ?auto_11954 )
      ( !STACK ?auto_11953 ?auto_11952 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11961 - BLOCK
      ?auto_11962 - BLOCK
      ?auto_11963 - BLOCK
      ?auto_11964 - BLOCK
      ?auto_11965 - BLOCK
      ?auto_11966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11965 ) ( ON-TABLE ?auto_11966 ) ( CLEAR ?auto_11966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11961 ) ( ON ?auto_11962 ?auto_11961 ) ( ON ?auto_11963 ?auto_11962 ) ( ON ?auto_11964 ?auto_11963 ) ( ON ?auto_11965 ?auto_11964 ) ( not ( = ?auto_11961 ?auto_11962 ) ) ( not ( = ?auto_11961 ?auto_11963 ) ) ( not ( = ?auto_11961 ?auto_11964 ) ) ( not ( = ?auto_11961 ?auto_11965 ) ) ( not ( = ?auto_11961 ?auto_11966 ) ) ( not ( = ?auto_11962 ?auto_11963 ) ) ( not ( = ?auto_11962 ?auto_11964 ) ) ( not ( = ?auto_11962 ?auto_11965 ) ) ( not ( = ?auto_11962 ?auto_11966 ) ) ( not ( = ?auto_11963 ?auto_11964 ) ) ( not ( = ?auto_11963 ?auto_11965 ) ) ( not ( = ?auto_11963 ?auto_11966 ) ) ( not ( = ?auto_11964 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11966 ) ) ( not ( = ?auto_11965 ?auto_11966 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_11966 )
      ( !STACK ?auto_11966 ?auto_11965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11973 - BLOCK
      ?auto_11974 - BLOCK
      ?auto_11975 - BLOCK
      ?auto_11976 - BLOCK
      ?auto_11977 - BLOCK
      ?auto_11978 - BLOCK
    )
    :vars
    (
      ?auto_11979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11978 ?auto_11979 ) ( ON-TABLE ?auto_11973 ) ( ON ?auto_11974 ?auto_11973 ) ( ON ?auto_11975 ?auto_11974 ) ( ON ?auto_11976 ?auto_11975 ) ( not ( = ?auto_11973 ?auto_11974 ) ) ( not ( = ?auto_11973 ?auto_11975 ) ) ( not ( = ?auto_11973 ?auto_11976 ) ) ( not ( = ?auto_11973 ?auto_11977 ) ) ( not ( = ?auto_11973 ?auto_11978 ) ) ( not ( = ?auto_11973 ?auto_11979 ) ) ( not ( = ?auto_11974 ?auto_11975 ) ) ( not ( = ?auto_11974 ?auto_11976 ) ) ( not ( = ?auto_11974 ?auto_11977 ) ) ( not ( = ?auto_11974 ?auto_11978 ) ) ( not ( = ?auto_11974 ?auto_11979 ) ) ( not ( = ?auto_11975 ?auto_11976 ) ) ( not ( = ?auto_11975 ?auto_11977 ) ) ( not ( = ?auto_11975 ?auto_11978 ) ) ( not ( = ?auto_11975 ?auto_11979 ) ) ( not ( = ?auto_11976 ?auto_11977 ) ) ( not ( = ?auto_11976 ?auto_11978 ) ) ( not ( = ?auto_11976 ?auto_11979 ) ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( not ( = ?auto_11977 ?auto_11979 ) ) ( not ( = ?auto_11978 ?auto_11979 ) ) ( CLEAR ?auto_11976 ) ( ON ?auto_11977 ?auto_11978 ) ( CLEAR ?auto_11977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_11973 ?auto_11974 ?auto_11975 ?auto_11976 ?auto_11977 )
      ( MAKE-6PILE ?auto_11973 ?auto_11974 ?auto_11975 ?auto_11976 ?auto_11977 ?auto_11978 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11986 - BLOCK
      ?auto_11987 - BLOCK
      ?auto_11988 - BLOCK
      ?auto_11989 - BLOCK
      ?auto_11990 - BLOCK
      ?auto_11991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11991 ) ( ON-TABLE ?auto_11986 ) ( ON ?auto_11987 ?auto_11986 ) ( ON ?auto_11988 ?auto_11987 ) ( ON ?auto_11989 ?auto_11988 ) ( not ( = ?auto_11986 ?auto_11987 ) ) ( not ( = ?auto_11986 ?auto_11988 ) ) ( not ( = ?auto_11986 ?auto_11989 ) ) ( not ( = ?auto_11986 ?auto_11990 ) ) ( not ( = ?auto_11986 ?auto_11991 ) ) ( not ( = ?auto_11987 ?auto_11988 ) ) ( not ( = ?auto_11987 ?auto_11989 ) ) ( not ( = ?auto_11987 ?auto_11990 ) ) ( not ( = ?auto_11987 ?auto_11991 ) ) ( not ( = ?auto_11988 ?auto_11989 ) ) ( not ( = ?auto_11988 ?auto_11990 ) ) ( not ( = ?auto_11988 ?auto_11991 ) ) ( not ( = ?auto_11989 ?auto_11990 ) ) ( not ( = ?auto_11989 ?auto_11991 ) ) ( not ( = ?auto_11990 ?auto_11991 ) ) ( CLEAR ?auto_11989 ) ( ON ?auto_11990 ?auto_11991 ) ( CLEAR ?auto_11990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_11986 ?auto_11987 ?auto_11988 ?auto_11989 ?auto_11990 )
      ( MAKE-6PILE ?auto_11986 ?auto_11987 ?auto_11988 ?auto_11989 ?auto_11990 ?auto_11991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11998 - BLOCK
      ?auto_11999 - BLOCK
      ?auto_12000 - BLOCK
      ?auto_12001 - BLOCK
      ?auto_12002 - BLOCK
      ?auto_12003 - BLOCK
    )
    :vars
    (
      ?auto_12004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12003 ?auto_12004 ) ( ON-TABLE ?auto_11998 ) ( ON ?auto_11999 ?auto_11998 ) ( ON ?auto_12000 ?auto_11999 ) ( not ( = ?auto_11998 ?auto_11999 ) ) ( not ( = ?auto_11998 ?auto_12000 ) ) ( not ( = ?auto_11998 ?auto_12001 ) ) ( not ( = ?auto_11998 ?auto_12002 ) ) ( not ( = ?auto_11998 ?auto_12003 ) ) ( not ( = ?auto_11998 ?auto_12004 ) ) ( not ( = ?auto_11999 ?auto_12000 ) ) ( not ( = ?auto_11999 ?auto_12001 ) ) ( not ( = ?auto_11999 ?auto_12002 ) ) ( not ( = ?auto_11999 ?auto_12003 ) ) ( not ( = ?auto_11999 ?auto_12004 ) ) ( not ( = ?auto_12000 ?auto_12001 ) ) ( not ( = ?auto_12000 ?auto_12002 ) ) ( not ( = ?auto_12000 ?auto_12003 ) ) ( not ( = ?auto_12000 ?auto_12004 ) ) ( not ( = ?auto_12001 ?auto_12002 ) ) ( not ( = ?auto_12001 ?auto_12003 ) ) ( not ( = ?auto_12001 ?auto_12004 ) ) ( not ( = ?auto_12002 ?auto_12003 ) ) ( not ( = ?auto_12002 ?auto_12004 ) ) ( not ( = ?auto_12003 ?auto_12004 ) ) ( ON ?auto_12002 ?auto_12003 ) ( CLEAR ?auto_12000 ) ( ON ?auto_12001 ?auto_12002 ) ( CLEAR ?auto_12001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11998 ?auto_11999 ?auto_12000 ?auto_12001 )
      ( MAKE-6PILE ?auto_11998 ?auto_11999 ?auto_12000 ?auto_12001 ?auto_12002 ?auto_12003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12011 - BLOCK
      ?auto_12012 - BLOCK
      ?auto_12013 - BLOCK
      ?auto_12014 - BLOCK
      ?auto_12015 - BLOCK
      ?auto_12016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12016 ) ( ON-TABLE ?auto_12011 ) ( ON ?auto_12012 ?auto_12011 ) ( ON ?auto_12013 ?auto_12012 ) ( not ( = ?auto_12011 ?auto_12012 ) ) ( not ( = ?auto_12011 ?auto_12013 ) ) ( not ( = ?auto_12011 ?auto_12014 ) ) ( not ( = ?auto_12011 ?auto_12015 ) ) ( not ( = ?auto_12011 ?auto_12016 ) ) ( not ( = ?auto_12012 ?auto_12013 ) ) ( not ( = ?auto_12012 ?auto_12014 ) ) ( not ( = ?auto_12012 ?auto_12015 ) ) ( not ( = ?auto_12012 ?auto_12016 ) ) ( not ( = ?auto_12013 ?auto_12014 ) ) ( not ( = ?auto_12013 ?auto_12015 ) ) ( not ( = ?auto_12013 ?auto_12016 ) ) ( not ( = ?auto_12014 ?auto_12015 ) ) ( not ( = ?auto_12014 ?auto_12016 ) ) ( not ( = ?auto_12015 ?auto_12016 ) ) ( ON ?auto_12015 ?auto_12016 ) ( CLEAR ?auto_12013 ) ( ON ?auto_12014 ?auto_12015 ) ( CLEAR ?auto_12014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12011 ?auto_12012 ?auto_12013 ?auto_12014 )
      ( MAKE-6PILE ?auto_12011 ?auto_12012 ?auto_12013 ?auto_12014 ?auto_12015 ?auto_12016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12023 - BLOCK
      ?auto_12024 - BLOCK
      ?auto_12025 - BLOCK
      ?auto_12026 - BLOCK
      ?auto_12027 - BLOCK
      ?auto_12028 - BLOCK
    )
    :vars
    (
      ?auto_12029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12028 ?auto_12029 ) ( ON-TABLE ?auto_12023 ) ( ON ?auto_12024 ?auto_12023 ) ( not ( = ?auto_12023 ?auto_12024 ) ) ( not ( = ?auto_12023 ?auto_12025 ) ) ( not ( = ?auto_12023 ?auto_12026 ) ) ( not ( = ?auto_12023 ?auto_12027 ) ) ( not ( = ?auto_12023 ?auto_12028 ) ) ( not ( = ?auto_12023 ?auto_12029 ) ) ( not ( = ?auto_12024 ?auto_12025 ) ) ( not ( = ?auto_12024 ?auto_12026 ) ) ( not ( = ?auto_12024 ?auto_12027 ) ) ( not ( = ?auto_12024 ?auto_12028 ) ) ( not ( = ?auto_12024 ?auto_12029 ) ) ( not ( = ?auto_12025 ?auto_12026 ) ) ( not ( = ?auto_12025 ?auto_12027 ) ) ( not ( = ?auto_12025 ?auto_12028 ) ) ( not ( = ?auto_12025 ?auto_12029 ) ) ( not ( = ?auto_12026 ?auto_12027 ) ) ( not ( = ?auto_12026 ?auto_12028 ) ) ( not ( = ?auto_12026 ?auto_12029 ) ) ( not ( = ?auto_12027 ?auto_12028 ) ) ( not ( = ?auto_12027 ?auto_12029 ) ) ( not ( = ?auto_12028 ?auto_12029 ) ) ( ON ?auto_12027 ?auto_12028 ) ( ON ?auto_12026 ?auto_12027 ) ( CLEAR ?auto_12024 ) ( ON ?auto_12025 ?auto_12026 ) ( CLEAR ?auto_12025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12023 ?auto_12024 ?auto_12025 )
      ( MAKE-6PILE ?auto_12023 ?auto_12024 ?auto_12025 ?auto_12026 ?auto_12027 ?auto_12028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12036 - BLOCK
      ?auto_12037 - BLOCK
      ?auto_12038 - BLOCK
      ?auto_12039 - BLOCK
      ?auto_12040 - BLOCK
      ?auto_12041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12041 ) ( ON-TABLE ?auto_12036 ) ( ON ?auto_12037 ?auto_12036 ) ( not ( = ?auto_12036 ?auto_12037 ) ) ( not ( = ?auto_12036 ?auto_12038 ) ) ( not ( = ?auto_12036 ?auto_12039 ) ) ( not ( = ?auto_12036 ?auto_12040 ) ) ( not ( = ?auto_12036 ?auto_12041 ) ) ( not ( = ?auto_12037 ?auto_12038 ) ) ( not ( = ?auto_12037 ?auto_12039 ) ) ( not ( = ?auto_12037 ?auto_12040 ) ) ( not ( = ?auto_12037 ?auto_12041 ) ) ( not ( = ?auto_12038 ?auto_12039 ) ) ( not ( = ?auto_12038 ?auto_12040 ) ) ( not ( = ?auto_12038 ?auto_12041 ) ) ( not ( = ?auto_12039 ?auto_12040 ) ) ( not ( = ?auto_12039 ?auto_12041 ) ) ( not ( = ?auto_12040 ?auto_12041 ) ) ( ON ?auto_12040 ?auto_12041 ) ( ON ?auto_12039 ?auto_12040 ) ( CLEAR ?auto_12037 ) ( ON ?auto_12038 ?auto_12039 ) ( CLEAR ?auto_12038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12036 ?auto_12037 ?auto_12038 )
      ( MAKE-6PILE ?auto_12036 ?auto_12037 ?auto_12038 ?auto_12039 ?auto_12040 ?auto_12041 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12048 - BLOCK
      ?auto_12049 - BLOCK
      ?auto_12050 - BLOCK
      ?auto_12051 - BLOCK
      ?auto_12052 - BLOCK
      ?auto_12053 - BLOCK
    )
    :vars
    (
      ?auto_12054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12053 ?auto_12054 ) ( ON-TABLE ?auto_12048 ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( not ( = ?auto_12048 ?auto_12050 ) ) ( not ( = ?auto_12048 ?auto_12051 ) ) ( not ( = ?auto_12048 ?auto_12052 ) ) ( not ( = ?auto_12048 ?auto_12053 ) ) ( not ( = ?auto_12048 ?auto_12054 ) ) ( not ( = ?auto_12049 ?auto_12050 ) ) ( not ( = ?auto_12049 ?auto_12051 ) ) ( not ( = ?auto_12049 ?auto_12052 ) ) ( not ( = ?auto_12049 ?auto_12053 ) ) ( not ( = ?auto_12049 ?auto_12054 ) ) ( not ( = ?auto_12050 ?auto_12051 ) ) ( not ( = ?auto_12050 ?auto_12052 ) ) ( not ( = ?auto_12050 ?auto_12053 ) ) ( not ( = ?auto_12050 ?auto_12054 ) ) ( not ( = ?auto_12051 ?auto_12052 ) ) ( not ( = ?auto_12051 ?auto_12053 ) ) ( not ( = ?auto_12051 ?auto_12054 ) ) ( not ( = ?auto_12052 ?auto_12053 ) ) ( not ( = ?auto_12052 ?auto_12054 ) ) ( not ( = ?auto_12053 ?auto_12054 ) ) ( ON ?auto_12052 ?auto_12053 ) ( ON ?auto_12051 ?auto_12052 ) ( ON ?auto_12050 ?auto_12051 ) ( CLEAR ?auto_12048 ) ( ON ?auto_12049 ?auto_12050 ) ( CLEAR ?auto_12049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12048 ?auto_12049 )
      ( MAKE-6PILE ?auto_12048 ?auto_12049 ?auto_12050 ?auto_12051 ?auto_12052 ?auto_12053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12061 - BLOCK
      ?auto_12062 - BLOCK
      ?auto_12063 - BLOCK
      ?auto_12064 - BLOCK
      ?auto_12065 - BLOCK
      ?auto_12066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12066 ) ( ON-TABLE ?auto_12061 ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( not ( = ?auto_12061 ?auto_12063 ) ) ( not ( = ?auto_12061 ?auto_12064 ) ) ( not ( = ?auto_12061 ?auto_12065 ) ) ( not ( = ?auto_12061 ?auto_12066 ) ) ( not ( = ?auto_12062 ?auto_12063 ) ) ( not ( = ?auto_12062 ?auto_12064 ) ) ( not ( = ?auto_12062 ?auto_12065 ) ) ( not ( = ?auto_12062 ?auto_12066 ) ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12066 ) ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( not ( = ?auto_12064 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12066 ) ) ( ON ?auto_12065 ?auto_12066 ) ( ON ?auto_12064 ?auto_12065 ) ( ON ?auto_12063 ?auto_12064 ) ( CLEAR ?auto_12061 ) ( ON ?auto_12062 ?auto_12063 ) ( CLEAR ?auto_12062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12061 ?auto_12062 )
      ( MAKE-6PILE ?auto_12061 ?auto_12062 ?auto_12063 ?auto_12064 ?auto_12065 ?auto_12066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12073 - BLOCK
      ?auto_12074 - BLOCK
      ?auto_12075 - BLOCK
      ?auto_12076 - BLOCK
      ?auto_12077 - BLOCK
      ?auto_12078 - BLOCK
    )
    :vars
    (
      ?auto_12079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12078 ?auto_12079 ) ( not ( = ?auto_12073 ?auto_12074 ) ) ( not ( = ?auto_12073 ?auto_12075 ) ) ( not ( = ?auto_12073 ?auto_12076 ) ) ( not ( = ?auto_12073 ?auto_12077 ) ) ( not ( = ?auto_12073 ?auto_12078 ) ) ( not ( = ?auto_12073 ?auto_12079 ) ) ( not ( = ?auto_12074 ?auto_12075 ) ) ( not ( = ?auto_12074 ?auto_12076 ) ) ( not ( = ?auto_12074 ?auto_12077 ) ) ( not ( = ?auto_12074 ?auto_12078 ) ) ( not ( = ?auto_12074 ?auto_12079 ) ) ( not ( = ?auto_12075 ?auto_12076 ) ) ( not ( = ?auto_12075 ?auto_12077 ) ) ( not ( = ?auto_12075 ?auto_12078 ) ) ( not ( = ?auto_12075 ?auto_12079 ) ) ( not ( = ?auto_12076 ?auto_12077 ) ) ( not ( = ?auto_12076 ?auto_12078 ) ) ( not ( = ?auto_12076 ?auto_12079 ) ) ( not ( = ?auto_12077 ?auto_12078 ) ) ( not ( = ?auto_12077 ?auto_12079 ) ) ( not ( = ?auto_12078 ?auto_12079 ) ) ( ON ?auto_12077 ?auto_12078 ) ( ON ?auto_12076 ?auto_12077 ) ( ON ?auto_12075 ?auto_12076 ) ( ON ?auto_12074 ?auto_12075 ) ( ON ?auto_12073 ?auto_12074 ) ( CLEAR ?auto_12073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12073 )
      ( MAKE-6PILE ?auto_12073 ?auto_12074 ?auto_12075 ?auto_12076 ?auto_12077 ?auto_12078 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12086 - BLOCK
      ?auto_12087 - BLOCK
      ?auto_12088 - BLOCK
      ?auto_12089 - BLOCK
      ?auto_12090 - BLOCK
      ?auto_12091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12091 ) ( not ( = ?auto_12086 ?auto_12087 ) ) ( not ( = ?auto_12086 ?auto_12088 ) ) ( not ( = ?auto_12086 ?auto_12089 ) ) ( not ( = ?auto_12086 ?auto_12090 ) ) ( not ( = ?auto_12086 ?auto_12091 ) ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12087 ?auto_12089 ) ) ( not ( = ?auto_12087 ?auto_12090 ) ) ( not ( = ?auto_12087 ?auto_12091 ) ) ( not ( = ?auto_12088 ?auto_12089 ) ) ( not ( = ?auto_12088 ?auto_12090 ) ) ( not ( = ?auto_12088 ?auto_12091 ) ) ( not ( = ?auto_12089 ?auto_12090 ) ) ( not ( = ?auto_12089 ?auto_12091 ) ) ( not ( = ?auto_12090 ?auto_12091 ) ) ( ON ?auto_12090 ?auto_12091 ) ( ON ?auto_12089 ?auto_12090 ) ( ON ?auto_12088 ?auto_12089 ) ( ON ?auto_12087 ?auto_12088 ) ( ON ?auto_12086 ?auto_12087 ) ( CLEAR ?auto_12086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12086 )
      ( MAKE-6PILE ?auto_12086 ?auto_12087 ?auto_12088 ?auto_12089 ?auto_12090 ?auto_12091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12098 - BLOCK
      ?auto_12099 - BLOCK
      ?auto_12100 - BLOCK
      ?auto_12101 - BLOCK
      ?auto_12102 - BLOCK
      ?auto_12103 - BLOCK
    )
    :vars
    (
      ?auto_12104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12098 ?auto_12099 ) ) ( not ( = ?auto_12098 ?auto_12100 ) ) ( not ( = ?auto_12098 ?auto_12101 ) ) ( not ( = ?auto_12098 ?auto_12102 ) ) ( not ( = ?auto_12098 ?auto_12103 ) ) ( not ( = ?auto_12099 ?auto_12100 ) ) ( not ( = ?auto_12099 ?auto_12101 ) ) ( not ( = ?auto_12099 ?auto_12102 ) ) ( not ( = ?auto_12099 ?auto_12103 ) ) ( not ( = ?auto_12100 ?auto_12101 ) ) ( not ( = ?auto_12100 ?auto_12102 ) ) ( not ( = ?auto_12100 ?auto_12103 ) ) ( not ( = ?auto_12101 ?auto_12102 ) ) ( not ( = ?auto_12101 ?auto_12103 ) ) ( not ( = ?auto_12102 ?auto_12103 ) ) ( ON ?auto_12098 ?auto_12104 ) ( not ( = ?auto_12103 ?auto_12104 ) ) ( not ( = ?auto_12102 ?auto_12104 ) ) ( not ( = ?auto_12101 ?auto_12104 ) ) ( not ( = ?auto_12100 ?auto_12104 ) ) ( not ( = ?auto_12099 ?auto_12104 ) ) ( not ( = ?auto_12098 ?auto_12104 ) ) ( ON ?auto_12099 ?auto_12098 ) ( ON ?auto_12100 ?auto_12099 ) ( ON ?auto_12101 ?auto_12100 ) ( ON ?auto_12102 ?auto_12101 ) ( ON ?auto_12103 ?auto_12102 ) ( CLEAR ?auto_12103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_12103 ?auto_12102 ?auto_12101 ?auto_12100 ?auto_12099 ?auto_12098 )
      ( MAKE-6PILE ?auto_12098 ?auto_12099 ?auto_12100 ?auto_12101 ?auto_12102 ?auto_12103 ) )
  )

)

