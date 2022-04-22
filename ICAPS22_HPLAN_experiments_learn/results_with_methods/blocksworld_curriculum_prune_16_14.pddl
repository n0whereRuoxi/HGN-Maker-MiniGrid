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
      ?auto_552763 - BLOCK
    )
    :vars
    (
      ?auto_552764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552763 ?auto_552764 ) ( CLEAR ?auto_552763 ) ( HAND-EMPTY ) ( not ( = ?auto_552763 ?auto_552764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_552763 ?auto_552764 )
      ( !PUTDOWN ?auto_552763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_552770 - BLOCK
      ?auto_552771 - BLOCK
    )
    :vars
    (
      ?auto_552772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_552770 ) ( ON ?auto_552771 ?auto_552772 ) ( CLEAR ?auto_552771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_552770 ) ( not ( = ?auto_552770 ?auto_552771 ) ) ( not ( = ?auto_552770 ?auto_552772 ) ) ( not ( = ?auto_552771 ?auto_552772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_552771 ?auto_552772 )
      ( !STACK ?auto_552771 ?auto_552770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_552780 - BLOCK
      ?auto_552781 - BLOCK
    )
    :vars
    (
      ?auto_552782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552781 ?auto_552782 ) ( not ( = ?auto_552780 ?auto_552781 ) ) ( not ( = ?auto_552780 ?auto_552782 ) ) ( not ( = ?auto_552781 ?auto_552782 ) ) ( ON ?auto_552780 ?auto_552781 ) ( CLEAR ?auto_552780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552780 )
      ( MAKE-2PILE ?auto_552780 ?auto_552781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_552791 - BLOCK
      ?auto_552792 - BLOCK
      ?auto_552793 - BLOCK
    )
    :vars
    (
      ?auto_552794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_552792 ) ( ON ?auto_552793 ?auto_552794 ) ( CLEAR ?auto_552793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_552791 ) ( ON ?auto_552792 ?auto_552791 ) ( not ( = ?auto_552791 ?auto_552792 ) ) ( not ( = ?auto_552791 ?auto_552793 ) ) ( not ( = ?auto_552791 ?auto_552794 ) ) ( not ( = ?auto_552792 ?auto_552793 ) ) ( not ( = ?auto_552792 ?auto_552794 ) ) ( not ( = ?auto_552793 ?auto_552794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_552793 ?auto_552794 )
      ( !STACK ?auto_552793 ?auto_552792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_552805 - BLOCK
      ?auto_552806 - BLOCK
      ?auto_552807 - BLOCK
    )
    :vars
    (
      ?auto_552808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552807 ?auto_552808 ) ( ON-TABLE ?auto_552805 ) ( not ( = ?auto_552805 ?auto_552806 ) ) ( not ( = ?auto_552805 ?auto_552807 ) ) ( not ( = ?auto_552805 ?auto_552808 ) ) ( not ( = ?auto_552806 ?auto_552807 ) ) ( not ( = ?auto_552806 ?auto_552808 ) ) ( not ( = ?auto_552807 ?auto_552808 ) ) ( CLEAR ?auto_552805 ) ( ON ?auto_552806 ?auto_552807 ) ( CLEAR ?auto_552806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_552805 ?auto_552806 )
      ( MAKE-3PILE ?auto_552805 ?auto_552806 ?auto_552807 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_552819 - BLOCK
      ?auto_552820 - BLOCK
      ?auto_552821 - BLOCK
    )
    :vars
    (
      ?auto_552822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552821 ?auto_552822 ) ( not ( = ?auto_552819 ?auto_552820 ) ) ( not ( = ?auto_552819 ?auto_552821 ) ) ( not ( = ?auto_552819 ?auto_552822 ) ) ( not ( = ?auto_552820 ?auto_552821 ) ) ( not ( = ?auto_552820 ?auto_552822 ) ) ( not ( = ?auto_552821 ?auto_552822 ) ) ( ON ?auto_552820 ?auto_552821 ) ( ON ?auto_552819 ?auto_552820 ) ( CLEAR ?auto_552819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552819 )
      ( MAKE-3PILE ?auto_552819 ?auto_552820 ?auto_552821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_552834 - BLOCK
      ?auto_552835 - BLOCK
      ?auto_552836 - BLOCK
      ?auto_552837 - BLOCK
    )
    :vars
    (
      ?auto_552838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_552836 ) ( ON ?auto_552837 ?auto_552838 ) ( CLEAR ?auto_552837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_552834 ) ( ON ?auto_552835 ?auto_552834 ) ( ON ?auto_552836 ?auto_552835 ) ( not ( = ?auto_552834 ?auto_552835 ) ) ( not ( = ?auto_552834 ?auto_552836 ) ) ( not ( = ?auto_552834 ?auto_552837 ) ) ( not ( = ?auto_552834 ?auto_552838 ) ) ( not ( = ?auto_552835 ?auto_552836 ) ) ( not ( = ?auto_552835 ?auto_552837 ) ) ( not ( = ?auto_552835 ?auto_552838 ) ) ( not ( = ?auto_552836 ?auto_552837 ) ) ( not ( = ?auto_552836 ?auto_552838 ) ) ( not ( = ?auto_552837 ?auto_552838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_552837 ?auto_552838 )
      ( !STACK ?auto_552837 ?auto_552836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_552852 - BLOCK
      ?auto_552853 - BLOCK
      ?auto_552854 - BLOCK
      ?auto_552855 - BLOCK
    )
    :vars
    (
      ?auto_552856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552855 ?auto_552856 ) ( ON-TABLE ?auto_552852 ) ( ON ?auto_552853 ?auto_552852 ) ( not ( = ?auto_552852 ?auto_552853 ) ) ( not ( = ?auto_552852 ?auto_552854 ) ) ( not ( = ?auto_552852 ?auto_552855 ) ) ( not ( = ?auto_552852 ?auto_552856 ) ) ( not ( = ?auto_552853 ?auto_552854 ) ) ( not ( = ?auto_552853 ?auto_552855 ) ) ( not ( = ?auto_552853 ?auto_552856 ) ) ( not ( = ?auto_552854 ?auto_552855 ) ) ( not ( = ?auto_552854 ?auto_552856 ) ) ( not ( = ?auto_552855 ?auto_552856 ) ) ( CLEAR ?auto_552853 ) ( ON ?auto_552854 ?auto_552855 ) ( CLEAR ?auto_552854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_552852 ?auto_552853 ?auto_552854 )
      ( MAKE-4PILE ?auto_552852 ?auto_552853 ?auto_552854 ?auto_552855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_552870 - BLOCK
      ?auto_552871 - BLOCK
      ?auto_552872 - BLOCK
      ?auto_552873 - BLOCK
    )
    :vars
    (
      ?auto_552874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552873 ?auto_552874 ) ( ON-TABLE ?auto_552870 ) ( not ( = ?auto_552870 ?auto_552871 ) ) ( not ( = ?auto_552870 ?auto_552872 ) ) ( not ( = ?auto_552870 ?auto_552873 ) ) ( not ( = ?auto_552870 ?auto_552874 ) ) ( not ( = ?auto_552871 ?auto_552872 ) ) ( not ( = ?auto_552871 ?auto_552873 ) ) ( not ( = ?auto_552871 ?auto_552874 ) ) ( not ( = ?auto_552872 ?auto_552873 ) ) ( not ( = ?auto_552872 ?auto_552874 ) ) ( not ( = ?auto_552873 ?auto_552874 ) ) ( ON ?auto_552872 ?auto_552873 ) ( CLEAR ?auto_552870 ) ( ON ?auto_552871 ?auto_552872 ) ( CLEAR ?auto_552871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_552870 ?auto_552871 )
      ( MAKE-4PILE ?auto_552870 ?auto_552871 ?auto_552872 ?auto_552873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_552888 - BLOCK
      ?auto_552889 - BLOCK
      ?auto_552890 - BLOCK
      ?auto_552891 - BLOCK
    )
    :vars
    (
      ?auto_552892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552891 ?auto_552892 ) ( not ( = ?auto_552888 ?auto_552889 ) ) ( not ( = ?auto_552888 ?auto_552890 ) ) ( not ( = ?auto_552888 ?auto_552891 ) ) ( not ( = ?auto_552888 ?auto_552892 ) ) ( not ( = ?auto_552889 ?auto_552890 ) ) ( not ( = ?auto_552889 ?auto_552891 ) ) ( not ( = ?auto_552889 ?auto_552892 ) ) ( not ( = ?auto_552890 ?auto_552891 ) ) ( not ( = ?auto_552890 ?auto_552892 ) ) ( not ( = ?auto_552891 ?auto_552892 ) ) ( ON ?auto_552890 ?auto_552891 ) ( ON ?auto_552889 ?auto_552890 ) ( ON ?auto_552888 ?auto_552889 ) ( CLEAR ?auto_552888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552888 )
      ( MAKE-4PILE ?auto_552888 ?auto_552889 ?auto_552890 ?auto_552891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_552907 - BLOCK
      ?auto_552908 - BLOCK
      ?auto_552909 - BLOCK
      ?auto_552910 - BLOCK
      ?auto_552911 - BLOCK
    )
    :vars
    (
      ?auto_552912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_552910 ) ( ON ?auto_552911 ?auto_552912 ) ( CLEAR ?auto_552911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_552907 ) ( ON ?auto_552908 ?auto_552907 ) ( ON ?auto_552909 ?auto_552908 ) ( ON ?auto_552910 ?auto_552909 ) ( not ( = ?auto_552907 ?auto_552908 ) ) ( not ( = ?auto_552907 ?auto_552909 ) ) ( not ( = ?auto_552907 ?auto_552910 ) ) ( not ( = ?auto_552907 ?auto_552911 ) ) ( not ( = ?auto_552907 ?auto_552912 ) ) ( not ( = ?auto_552908 ?auto_552909 ) ) ( not ( = ?auto_552908 ?auto_552910 ) ) ( not ( = ?auto_552908 ?auto_552911 ) ) ( not ( = ?auto_552908 ?auto_552912 ) ) ( not ( = ?auto_552909 ?auto_552910 ) ) ( not ( = ?auto_552909 ?auto_552911 ) ) ( not ( = ?auto_552909 ?auto_552912 ) ) ( not ( = ?auto_552910 ?auto_552911 ) ) ( not ( = ?auto_552910 ?auto_552912 ) ) ( not ( = ?auto_552911 ?auto_552912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_552911 ?auto_552912 )
      ( !STACK ?auto_552911 ?auto_552910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_552929 - BLOCK
      ?auto_552930 - BLOCK
      ?auto_552931 - BLOCK
      ?auto_552932 - BLOCK
      ?auto_552933 - BLOCK
    )
    :vars
    (
      ?auto_552934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552933 ?auto_552934 ) ( ON-TABLE ?auto_552929 ) ( ON ?auto_552930 ?auto_552929 ) ( ON ?auto_552931 ?auto_552930 ) ( not ( = ?auto_552929 ?auto_552930 ) ) ( not ( = ?auto_552929 ?auto_552931 ) ) ( not ( = ?auto_552929 ?auto_552932 ) ) ( not ( = ?auto_552929 ?auto_552933 ) ) ( not ( = ?auto_552929 ?auto_552934 ) ) ( not ( = ?auto_552930 ?auto_552931 ) ) ( not ( = ?auto_552930 ?auto_552932 ) ) ( not ( = ?auto_552930 ?auto_552933 ) ) ( not ( = ?auto_552930 ?auto_552934 ) ) ( not ( = ?auto_552931 ?auto_552932 ) ) ( not ( = ?auto_552931 ?auto_552933 ) ) ( not ( = ?auto_552931 ?auto_552934 ) ) ( not ( = ?auto_552932 ?auto_552933 ) ) ( not ( = ?auto_552932 ?auto_552934 ) ) ( not ( = ?auto_552933 ?auto_552934 ) ) ( CLEAR ?auto_552931 ) ( ON ?auto_552932 ?auto_552933 ) ( CLEAR ?auto_552932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_552929 ?auto_552930 ?auto_552931 ?auto_552932 )
      ( MAKE-5PILE ?auto_552929 ?auto_552930 ?auto_552931 ?auto_552932 ?auto_552933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_552951 - BLOCK
      ?auto_552952 - BLOCK
      ?auto_552953 - BLOCK
      ?auto_552954 - BLOCK
      ?auto_552955 - BLOCK
    )
    :vars
    (
      ?auto_552956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552955 ?auto_552956 ) ( ON-TABLE ?auto_552951 ) ( ON ?auto_552952 ?auto_552951 ) ( not ( = ?auto_552951 ?auto_552952 ) ) ( not ( = ?auto_552951 ?auto_552953 ) ) ( not ( = ?auto_552951 ?auto_552954 ) ) ( not ( = ?auto_552951 ?auto_552955 ) ) ( not ( = ?auto_552951 ?auto_552956 ) ) ( not ( = ?auto_552952 ?auto_552953 ) ) ( not ( = ?auto_552952 ?auto_552954 ) ) ( not ( = ?auto_552952 ?auto_552955 ) ) ( not ( = ?auto_552952 ?auto_552956 ) ) ( not ( = ?auto_552953 ?auto_552954 ) ) ( not ( = ?auto_552953 ?auto_552955 ) ) ( not ( = ?auto_552953 ?auto_552956 ) ) ( not ( = ?auto_552954 ?auto_552955 ) ) ( not ( = ?auto_552954 ?auto_552956 ) ) ( not ( = ?auto_552955 ?auto_552956 ) ) ( ON ?auto_552954 ?auto_552955 ) ( CLEAR ?auto_552952 ) ( ON ?auto_552953 ?auto_552954 ) ( CLEAR ?auto_552953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_552951 ?auto_552952 ?auto_552953 )
      ( MAKE-5PILE ?auto_552951 ?auto_552952 ?auto_552953 ?auto_552954 ?auto_552955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_552973 - BLOCK
      ?auto_552974 - BLOCK
      ?auto_552975 - BLOCK
      ?auto_552976 - BLOCK
      ?auto_552977 - BLOCK
    )
    :vars
    (
      ?auto_552978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552977 ?auto_552978 ) ( ON-TABLE ?auto_552973 ) ( not ( = ?auto_552973 ?auto_552974 ) ) ( not ( = ?auto_552973 ?auto_552975 ) ) ( not ( = ?auto_552973 ?auto_552976 ) ) ( not ( = ?auto_552973 ?auto_552977 ) ) ( not ( = ?auto_552973 ?auto_552978 ) ) ( not ( = ?auto_552974 ?auto_552975 ) ) ( not ( = ?auto_552974 ?auto_552976 ) ) ( not ( = ?auto_552974 ?auto_552977 ) ) ( not ( = ?auto_552974 ?auto_552978 ) ) ( not ( = ?auto_552975 ?auto_552976 ) ) ( not ( = ?auto_552975 ?auto_552977 ) ) ( not ( = ?auto_552975 ?auto_552978 ) ) ( not ( = ?auto_552976 ?auto_552977 ) ) ( not ( = ?auto_552976 ?auto_552978 ) ) ( not ( = ?auto_552977 ?auto_552978 ) ) ( ON ?auto_552976 ?auto_552977 ) ( ON ?auto_552975 ?auto_552976 ) ( CLEAR ?auto_552973 ) ( ON ?auto_552974 ?auto_552975 ) ( CLEAR ?auto_552974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_552973 ?auto_552974 )
      ( MAKE-5PILE ?auto_552973 ?auto_552974 ?auto_552975 ?auto_552976 ?auto_552977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_552995 - BLOCK
      ?auto_552996 - BLOCK
      ?auto_552997 - BLOCK
      ?auto_552998 - BLOCK
      ?auto_552999 - BLOCK
    )
    :vars
    (
      ?auto_553000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_552999 ?auto_553000 ) ( not ( = ?auto_552995 ?auto_552996 ) ) ( not ( = ?auto_552995 ?auto_552997 ) ) ( not ( = ?auto_552995 ?auto_552998 ) ) ( not ( = ?auto_552995 ?auto_552999 ) ) ( not ( = ?auto_552995 ?auto_553000 ) ) ( not ( = ?auto_552996 ?auto_552997 ) ) ( not ( = ?auto_552996 ?auto_552998 ) ) ( not ( = ?auto_552996 ?auto_552999 ) ) ( not ( = ?auto_552996 ?auto_553000 ) ) ( not ( = ?auto_552997 ?auto_552998 ) ) ( not ( = ?auto_552997 ?auto_552999 ) ) ( not ( = ?auto_552997 ?auto_553000 ) ) ( not ( = ?auto_552998 ?auto_552999 ) ) ( not ( = ?auto_552998 ?auto_553000 ) ) ( not ( = ?auto_552999 ?auto_553000 ) ) ( ON ?auto_552998 ?auto_552999 ) ( ON ?auto_552997 ?auto_552998 ) ( ON ?auto_552996 ?auto_552997 ) ( ON ?auto_552995 ?auto_552996 ) ( CLEAR ?auto_552995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_552995 )
      ( MAKE-5PILE ?auto_552995 ?auto_552996 ?auto_552997 ?auto_552998 ?auto_552999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_553018 - BLOCK
      ?auto_553019 - BLOCK
      ?auto_553020 - BLOCK
      ?auto_553021 - BLOCK
      ?auto_553022 - BLOCK
      ?auto_553023 - BLOCK
    )
    :vars
    (
      ?auto_553024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_553022 ) ( ON ?auto_553023 ?auto_553024 ) ( CLEAR ?auto_553023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_553018 ) ( ON ?auto_553019 ?auto_553018 ) ( ON ?auto_553020 ?auto_553019 ) ( ON ?auto_553021 ?auto_553020 ) ( ON ?auto_553022 ?auto_553021 ) ( not ( = ?auto_553018 ?auto_553019 ) ) ( not ( = ?auto_553018 ?auto_553020 ) ) ( not ( = ?auto_553018 ?auto_553021 ) ) ( not ( = ?auto_553018 ?auto_553022 ) ) ( not ( = ?auto_553018 ?auto_553023 ) ) ( not ( = ?auto_553018 ?auto_553024 ) ) ( not ( = ?auto_553019 ?auto_553020 ) ) ( not ( = ?auto_553019 ?auto_553021 ) ) ( not ( = ?auto_553019 ?auto_553022 ) ) ( not ( = ?auto_553019 ?auto_553023 ) ) ( not ( = ?auto_553019 ?auto_553024 ) ) ( not ( = ?auto_553020 ?auto_553021 ) ) ( not ( = ?auto_553020 ?auto_553022 ) ) ( not ( = ?auto_553020 ?auto_553023 ) ) ( not ( = ?auto_553020 ?auto_553024 ) ) ( not ( = ?auto_553021 ?auto_553022 ) ) ( not ( = ?auto_553021 ?auto_553023 ) ) ( not ( = ?auto_553021 ?auto_553024 ) ) ( not ( = ?auto_553022 ?auto_553023 ) ) ( not ( = ?auto_553022 ?auto_553024 ) ) ( not ( = ?auto_553023 ?auto_553024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_553023 ?auto_553024 )
      ( !STACK ?auto_553023 ?auto_553022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_553044 - BLOCK
      ?auto_553045 - BLOCK
      ?auto_553046 - BLOCK
      ?auto_553047 - BLOCK
      ?auto_553048 - BLOCK
      ?auto_553049 - BLOCK
    )
    :vars
    (
      ?auto_553050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553049 ?auto_553050 ) ( ON-TABLE ?auto_553044 ) ( ON ?auto_553045 ?auto_553044 ) ( ON ?auto_553046 ?auto_553045 ) ( ON ?auto_553047 ?auto_553046 ) ( not ( = ?auto_553044 ?auto_553045 ) ) ( not ( = ?auto_553044 ?auto_553046 ) ) ( not ( = ?auto_553044 ?auto_553047 ) ) ( not ( = ?auto_553044 ?auto_553048 ) ) ( not ( = ?auto_553044 ?auto_553049 ) ) ( not ( = ?auto_553044 ?auto_553050 ) ) ( not ( = ?auto_553045 ?auto_553046 ) ) ( not ( = ?auto_553045 ?auto_553047 ) ) ( not ( = ?auto_553045 ?auto_553048 ) ) ( not ( = ?auto_553045 ?auto_553049 ) ) ( not ( = ?auto_553045 ?auto_553050 ) ) ( not ( = ?auto_553046 ?auto_553047 ) ) ( not ( = ?auto_553046 ?auto_553048 ) ) ( not ( = ?auto_553046 ?auto_553049 ) ) ( not ( = ?auto_553046 ?auto_553050 ) ) ( not ( = ?auto_553047 ?auto_553048 ) ) ( not ( = ?auto_553047 ?auto_553049 ) ) ( not ( = ?auto_553047 ?auto_553050 ) ) ( not ( = ?auto_553048 ?auto_553049 ) ) ( not ( = ?auto_553048 ?auto_553050 ) ) ( not ( = ?auto_553049 ?auto_553050 ) ) ( CLEAR ?auto_553047 ) ( ON ?auto_553048 ?auto_553049 ) ( CLEAR ?auto_553048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_553044 ?auto_553045 ?auto_553046 ?auto_553047 ?auto_553048 )
      ( MAKE-6PILE ?auto_553044 ?auto_553045 ?auto_553046 ?auto_553047 ?auto_553048 ?auto_553049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_553070 - BLOCK
      ?auto_553071 - BLOCK
      ?auto_553072 - BLOCK
      ?auto_553073 - BLOCK
      ?auto_553074 - BLOCK
      ?auto_553075 - BLOCK
    )
    :vars
    (
      ?auto_553076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553075 ?auto_553076 ) ( ON-TABLE ?auto_553070 ) ( ON ?auto_553071 ?auto_553070 ) ( ON ?auto_553072 ?auto_553071 ) ( not ( = ?auto_553070 ?auto_553071 ) ) ( not ( = ?auto_553070 ?auto_553072 ) ) ( not ( = ?auto_553070 ?auto_553073 ) ) ( not ( = ?auto_553070 ?auto_553074 ) ) ( not ( = ?auto_553070 ?auto_553075 ) ) ( not ( = ?auto_553070 ?auto_553076 ) ) ( not ( = ?auto_553071 ?auto_553072 ) ) ( not ( = ?auto_553071 ?auto_553073 ) ) ( not ( = ?auto_553071 ?auto_553074 ) ) ( not ( = ?auto_553071 ?auto_553075 ) ) ( not ( = ?auto_553071 ?auto_553076 ) ) ( not ( = ?auto_553072 ?auto_553073 ) ) ( not ( = ?auto_553072 ?auto_553074 ) ) ( not ( = ?auto_553072 ?auto_553075 ) ) ( not ( = ?auto_553072 ?auto_553076 ) ) ( not ( = ?auto_553073 ?auto_553074 ) ) ( not ( = ?auto_553073 ?auto_553075 ) ) ( not ( = ?auto_553073 ?auto_553076 ) ) ( not ( = ?auto_553074 ?auto_553075 ) ) ( not ( = ?auto_553074 ?auto_553076 ) ) ( not ( = ?auto_553075 ?auto_553076 ) ) ( ON ?auto_553074 ?auto_553075 ) ( CLEAR ?auto_553072 ) ( ON ?auto_553073 ?auto_553074 ) ( CLEAR ?auto_553073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_553070 ?auto_553071 ?auto_553072 ?auto_553073 )
      ( MAKE-6PILE ?auto_553070 ?auto_553071 ?auto_553072 ?auto_553073 ?auto_553074 ?auto_553075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_553096 - BLOCK
      ?auto_553097 - BLOCK
      ?auto_553098 - BLOCK
      ?auto_553099 - BLOCK
      ?auto_553100 - BLOCK
      ?auto_553101 - BLOCK
    )
    :vars
    (
      ?auto_553102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553101 ?auto_553102 ) ( ON-TABLE ?auto_553096 ) ( ON ?auto_553097 ?auto_553096 ) ( not ( = ?auto_553096 ?auto_553097 ) ) ( not ( = ?auto_553096 ?auto_553098 ) ) ( not ( = ?auto_553096 ?auto_553099 ) ) ( not ( = ?auto_553096 ?auto_553100 ) ) ( not ( = ?auto_553096 ?auto_553101 ) ) ( not ( = ?auto_553096 ?auto_553102 ) ) ( not ( = ?auto_553097 ?auto_553098 ) ) ( not ( = ?auto_553097 ?auto_553099 ) ) ( not ( = ?auto_553097 ?auto_553100 ) ) ( not ( = ?auto_553097 ?auto_553101 ) ) ( not ( = ?auto_553097 ?auto_553102 ) ) ( not ( = ?auto_553098 ?auto_553099 ) ) ( not ( = ?auto_553098 ?auto_553100 ) ) ( not ( = ?auto_553098 ?auto_553101 ) ) ( not ( = ?auto_553098 ?auto_553102 ) ) ( not ( = ?auto_553099 ?auto_553100 ) ) ( not ( = ?auto_553099 ?auto_553101 ) ) ( not ( = ?auto_553099 ?auto_553102 ) ) ( not ( = ?auto_553100 ?auto_553101 ) ) ( not ( = ?auto_553100 ?auto_553102 ) ) ( not ( = ?auto_553101 ?auto_553102 ) ) ( ON ?auto_553100 ?auto_553101 ) ( ON ?auto_553099 ?auto_553100 ) ( CLEAR ?auto_553097 ) ( ON ?auto_553098 ?auto_553099 ) ( CLEAR ?auto_553098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_553096 ?auto_553097 ?auto_553098 )
      ( MAKE-6PILE ?auto_553096 ?auto_553097 ?auto_553098 ?auto_553099 ?auto_553100 ?auto_553101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_553122 - BLOCK
      ?auto_553123 - BLOCK
      ?auto_553124 - BLOCK
      ?auto_553125 - BLOCK
      ?auto_553126 - BLOCK
      ?auto_553127 - BLOCK
    )
    :vars
    (
      ?auto_553128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553127 ?auto_553128 ) ( ON-TABLE ?auto_553122 ) ( not ( = ?auto_553122 ?auto_553123 ) ) ( not ( = ?auto_553122 ?auto_553124 ) ) ( not ( = ?auto_553122 ?auto_553125 ) ) ( not ( = ?auto_553122 ?auto_553126 ) ) ( not ( = ?auto_553122 ?auto_553127 ) ) ( not ( = ?auto_553122 ?auto_553128 ) ) ( not ( = ?auto_553123 ?auto_553124 ) ) ( not ( = ?auto_553123 ?auto_553125 ) ) ( not ( = ?auto_553123 ?auto_553126 ) ) ( not ( = ?auto_553123 ?auto_553127 ) ) ( not ( = ?auto_553123 ?auto_553128 ) ) ( not ( = ?auto_553124 ?auto_553125 ) ) ( not ( = ?auto_553124 ?auto_553126 ) ) ( not ( = ?auto_553124 ?auto_553127 ) ) ( not ( = ?auto_553124 ?auto_553128 ) ) ( not ( = ?auto_553125 ?auto_553126 ) ) ( not ( = ?auto_553125 ?auto_553127 ) ) ( not ( = ?auto_553125 ?auto_553128 ) ) ( not ( = ?auto_553126 ?auto_553127 ) ) ( not ( = ?auto_553126 ?auto_553128 ) ) ( not ( = ?auto_553127 ?auto_553128 ) ) ( ON ?auto_553126 ?auto_553127 ) ( ON ?auto_553125 ?auto_553126 ) ( ON ?auto_553124 ?auto_553125 ) ( CLEAR ?auto_553122 ) ( ON ?auto_553123 ?auto_553124 ) ( CLEAR ?auto_553123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_553122 ?auto_553123 )
      ( MAKE-6PILE ?auto_553122 ?auto_553123 ?auto_553124 ?auto_553125 ?auto_553126 ?auto_553127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_553148 - BLOCK
      ?auto_553149 - BLOCK
      ?auto_553150 - BLOCK
      ?auto_553151 - BLOCK
      ?auto_553152 - BLOCK
      ?auto_553153 - BLOCK
    )
    :vars
    (
      ?auto_553154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553153 ?auto_553154 ) ( not ( = ?auto_553148 ?auto_553149 ) ) ( not ( = ?auto_553148 ?auto_553150 ) ) ( not ( = ?auto_553148 ?auto_553151 ) ) ( not ( = ?auto_553148 ?auto_553152 ) ) ( not ( = ?auto_553148 ?auto_553153 ) ) ( not ( = ?auto_553148 ?auto_553154 ) ) ( not ( = ?auto_553149 ?auto_553150 ) ) ( not ( = ?auto_553149 ?auto_553151 ) ) ( not ( = ?auto_553149 ?auto_553152 ) ) ( not ( = ?auto_553149 ?auto_553153 ) ) ( not ( = ?auto_553149 ?auto_553154 ) ) ( not ( = ?auto_553150 ?auto_553151 ) ) ( not ( = ?auto_553150 ?auto_553152 ) ) ( not ( = ?auto_553150 ?auto_553153 ) ) ( not ( = ?auto_553150 ?auto_553154 ) ) ( not ( = ?auto_553151 ?auto_553152 ) ) ( not ( = ?auto_553151 ?auto_553153 ) ) ( not ( = ?auto_553151 ?auto_553154 ) ) ( not ( = ?auto_553152 ?auto_553153 ) ) ( not ( = ?auto_553152 ?auto_553154 ) ) ( not ( = ?auto_553153 ?auto_553154 ) ) ( ON ?auto_553152 ?auto_553153 ) ( ON ?auto_553151 ?auto_553152 ) ( ON ?auto_553150 ?auto_553151 ) ( ON ?auto_553149 ?auto_553150 ) ( ON ?auto_553148 ?auto_553149 ) ( CLEAR ?auto_553148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_553148 )
      ( MAKE-6PILE ?auto_553148 ?auto_553149 ?auto_553150 ?auto_553151 ?auto_553152 ?auto_553153 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553175 - BLOCK
      ?auto_553176 - BLOCK
      ?auto_553177 - BLOCK
      ?auto_553178 - BLOCK
      ?auto_553179 - BLOCK
      ?auto_553180 - BLOCK
      ?auto_553181 - BLOCK
    )
    :vars
    (
      ?auto_553182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_553180 ) ( ON ?auto_553181 ?auto_553182 ) ( CLEAR ?auto_553181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_553175 ) ( ON ?auto_553176 ?auto_553175 ) ( ON ?auto_553177 ?auto_553176 ) ( ON ?auto_553178 ?auto_553177 ) ( ON ?auto_553179 ?auto_553178 ) ( ON ?auto_553180 ?auto_553179 ) ( not ( = ?auto_553175 ?auto_553176 ) ) ( not ( = ?auto_553175 ?auto_553177 ) ) ( not ( = ?auto_553175 ?auto_553178 ) ) ( not ( = ?auto_553175 ?auto_553179 ) ) ( not ( = ?auto_553175 ?auto_553180 ) ) ( not ( = ?auto_553175 ?auto_553181 ) ) ( not ( = ?auto_553175 ?auto_553182 ) ) ( not ( = ?auto_553176 ?auto_553177 ) ) ( not ( = ?auto_553176 ?auto_553178 ) ) ( not ( = ?auto_553176 ?auto_553179 ) ) ( not ( = ?auto_553176 ?auto_553180 ) ) ( not ( = ?auto_553176 ?auto_553181 ) ) ( not ( = ?auto_553176 ?auto_553182 ) ) ( not ( = ?auto_553177 ?auto_553178 ) ) ( not ( = ?auto_553177 ?auto_553179 ) ) ( not ( = ?auto_553177 ?auto_553180 ) ) ( not ( = ?auto_553177 ?auto_553181 ) ) ( not ( = ?auto_553177 ?auto_553182 ) ) ( not ( = ?auto_553178 ?auto_553179 ) ) ( not ( = ?auto_553178 ?auto_553180 ) ) ( not ( = ?auto_553178 ?auto_553181 ) ) ( not ( = ?auto_553178 ?auto_553182 ) ) ( not ( = ?auto_553179 ?auto_553180 ) ) ( not ( = ?auto_553179 ?auto_553181 ) ) ( not ( = ?auto_553179 ?auto_553182 ) ) ( not ( = ?auto_553180 ?auto_553181 ) ) ( not ( = ?auto_553180 ?auto_553182 ) ) ( not ( = ?auto_553181 ?auto_553182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_553181 ?auto_553182 )
      ( !STACK ?auto_553181 ?auto_553180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553205 - BLOCK
      ?auto_553206 - BLOCK
      ?auto_553207 - BLOCK
      ?auto_553208 - BLOCK
      ?auto_553209 - BLOCK
      ?auto_553210 - BLOCK
      ?auto_553211 - BLOCK
    )
    :vars
    (
      ?auto_553212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553211 ?auto_553212 ) ( ON-TABLE ?auto_553205 ) ( ON ?auto_553206 ?auto_553205 ) ( ON ?auto_553207 ?auto_553206 ) ( ON ?auto_553208 ?auto_553207 ) ( ON ?auto_553209 ?auto_553208 ) ( not ( = ?auto_553205 ?auto_553206 ) ) ( not ( = ?auto_553205 ?auto_553207 ) ) ( not ( = ?auto_553205 ?auto_553208 ) ) ( not ( = ?auto_553205 ?auto_553209 ) ) ( not ( = ?auto_553205 ?auto_553210 ) ) ( not ( = ?auto_553205 ?auto_553211 ) ) ( not ( = ?auto_553205 ?auto_553212 ) ) ( not ( = ?auto_553206 ?auto_553207 ) ) ( not ( = ?auto_553206 ?auto_553208 ) ) ( not ( = ?auto_553206 ?auto_553209 ) ) ( not ( = ?auto_553206 ?auto_553210 ) ) ( not ( = ?auto_553206 ?auto_553211 ) ) ( not ( = ?auto_553206 ?auto_553212 ) ) ( not ( = ?auto_553207 ?auto_553208 ) ) ( not ( = ?auto_553207 ?auto_553209 ) ) ( not ( = ?auto_553207 ?auto_553210 ) ) ( not ( = ?auto_553207 ?auto_553211 ) ) ( not ( = ?auto_553207 ?auto_553212 ) ) ( not ( = ?auto_553208 ?auto_553209 ) ) ( not ( = ?auto_553208 ?auto_553210 ) ) ( not ( = ?auto_553208 ?auto_553211 ) ) ( not ( = ?auto_553208 ?auto_553212 ) ) ( not ( = ?auto_553209 ?auto_553210 ) ) ( not ( = ?auto_553209 ?auto_553211 ) ) ( not ( = ?auto_553209 ?auto_553212 ) ) ( not ( = ?auto_553210 ?auto_553211 ) ) ( not ( = ?auto_553210 ?auto_553212 ) ) ( not ( = ?auto_553211 ?auto_553212 ) ) ( CLEAR ?auto_553209 ) ( ON ?auto_553210 ?auto_553211 ) ( CLEAR ?auto_553210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_553205 ?auto_553206 ?auto_553207 ?auto_553208 ?auto_553209 ?auto_553210 )
      ( MAKE-7PILE ?auto_553205 ?auto_553206 ?auto_553207 ?auto_553208 ?auto_553209 ?auto_553210 ?auto_553211 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553235 - BLOCK
      ?auto_553236 - BLOCK
      ?auto_553237 - BLOCK
      ?auto_553238 - BLOCK
      ?auto_553239 - BLOCK
      ?auto_553240 - BLOCK
      ?auto_553241 - BLOCK
    )
    :vars
    (
      ?auto_553242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553241 ?auto_553242 ) ( ON-TABLE ?auto_553235 ) ( ON ?auto_553236 ?auto_553235 ) ( ON ?auto_553237 ?auto_553236 ) ( ON ?auto_553238 ?auto_553237 ) ( not ( = ?auto_553235 ?auto_553236 ) ) ( not ( = ?auto_553235 ?auto_553237 ) ) ( not ( = ?auto_553235 ?auto_553238 ) ) ( not ( = ?auto_553235 ?auto_553239 ) ) ( not ( = ?auto_553235 ?auto_553240 ) ) ( not ( = ?auto_553235 ?auto_553241 ) ) ( not ( = ?auto_553235 ?auto_553242 ) ) ( not ( = ?auto_553236 ?auto_553237 ) ) ( not ( = ?auto_553236 ?auto_553238 ) ) ( not ( = ?auto_553236 ?auto_553239 ) ) ( not ( = ?auto_553236 ?auto_553240 ) ) ( not ( = ?auto_553236 ?auto_553241 ) ) ( not ( = ?auto_553236 ?auto_553242 ) ) ( not ( = ?auto_553237 ?auto_553238 ) ) ( not ( = ?auto_553237 ?auto_553239 ) ) ( not ( = ?auto_553237 ?auto_553240 ) ) ( not ( = ?auto_553237 ?auto_553241 ) ) ( not ( = ?auto_553237 ?auto_553242 ) ) ( not ( = ?auto_553238 ?auto_553239 ) ) ( not ( = ?auto_553238 ?auto_553240 ) ) ( not ( = ?auto_553238 ?auto_553241 ) ) ( not ( = ?auto_553238 ?auto_553242 ) ) ( not ( = ?auto_553239 ?auto_553240 ) ) ( not ( = ?auto_553239 ?auto_553241 ) ) ( not ( = ?auto_553239 ?auto_553242 ) ) ( not ( = ?auto_553240 ?auto_553241 ) ) ( not ( = ?auto_553240 ?auto_553242 ) ) ( not ( = ?auto_553241 ?auto_553242 ) ) ( ON ?auto_553240 ?auto_553241 ) ( CLEAR ?auto_553238 ) ( ON ?auto_553239 ?auto_553240 ) ( CLEAR ?auto_553239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_553235 ?auto_553236 ?auto_553237 ?auto_553238 ?auto_553239 )
      ( MAKE-7PILE ?auto_553235 ?auto_553236 ?auto_553237 ?auto_553238 ?auto_553239 ?auto_553240 ?auto_553241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553265 - BLOCK
      ?auto_553266 - BLOCK
      ?auto_553267 - BLOCK
      ?auto_553268 - BLOCK
      ?auto_553269 - BLOCK
      ?auto_553270 - BLOCK
      ?auto_553271 - BLOCK
    )
    :vars
    (
      ?auto_553272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553271 ?auto_553272 ) ( ON-TABLE ?auto_553265 ) ( ON ?auto_553266 ?auto_553265 ) ( ON ?auto_553267 ?auto_553266 ) ( not ( = ?auto_553265 ?auto_553266 ) ) ( not ( = ?auto_553265 ?auto_553267 ) ) ( not ( = ?auto_553265 ?auto_553268 ) ) ( not ( = ?auto_553265 ?auto_553269 ) ) ( not ( = ?auto_553265 ?auto_553270 ) ) ( not ( = ?auto_553265 ?auto_553271 ) ) ( not ( = ?auto_553265 ?auto_553272 ) ) ( not ( = ?auto_553266 ?auto_553267 ) ) ( not ( = ?auto_553266 ?auto_553268 ) ) ( not ( = ?auto_553266 ?auto_553269 ) ) ( not ( = ?auto_553266 ?auto_553270 ) ) ( not ( = ?auto_553266 ?auto_553271 ) ) ( not ( = ?auto_553266 ?auto_553272 ) ) ( not ( = ?auto_553267 ?auto_553268 ) ) ( not ( = ?auto_553267 ?auto_553269 ) ) ( not ( = ?auto_553267 ?auto_553270 ) ) ( not ( = ?auto_553267 ?auto_553271 ) ) ( not ( = ?auto_553267 ?auto_553272 ) ) ( not ( = ?auto_553268 ?auto_553269 ) ) ( not ( = ?auto_553268 ?auto_553270 ) ) ( not ( = ?auto_553268 ?auto_553271 ) ) ( not ( = ?auto_553268 ?auto_553272 ) ) ( not ( = ?auto_553269 ?auto_553270 ) ) ( not ( = ?auto_553269 ?auto_553271 ) ) ( not ( = ?auto_553269 ?auto_553272 ) ) ( not ( = ?auto_553270 ?auto_553271 ) ) ( not ( = ?auto_553270 ?auto_553272 ) ) ( not ( = ?auto_553271 ?auto_553272 ) ) ( ON ?auto_553270 ?auto_553271 ) ( ON ?auto_553269 ?auto_553270 ) ( CLEAR ?auto_553267 ) ( ON ?auto_553268 ?auto_553269 ) ( CLEAR ?auto_553268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_553265 ?auto_553266 ?auto_553267 ?auto_553268 )
      ( MAKE-7PILE ?auto_553265 ?auto_553266 ?auto_553267 ?auto_553268 ?auto_553269 ?auto_553270 ?auto_553271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553295 - BLOCK
      ?auto_553296 - BLOCK
      ?auto_553297 - BLOCK
      ?auto_553298 - BLOCK
      ?auto_553299 - BLOCK
      ?auto_553300 - BLOCK
      ?auto_553301 - BLOCK
    )
    :vars
    (
      ?auto_553302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553301 ?auto_553302 ) ( ON-TABLE ?auto_553295 ) ( ON ?auto_553296 ?auto_553295 ) ( not ( = ?auto_553295 ?auto_553296 ) ) ( not ( = ?auto_553295 ?auto_553297 ) ) ( not ( = ?auto_553295 ?auto_553298 ) ) ( not ( = ?auto_553295 ?auto_553299 ) ) ( not ( = ?auto_553295 ?auto_553300 ) ) ( not ( = ?auto_553295 ?auto_553301 ) ) ( not ( = ?auto_553295 ?auto_553302 ) ) ( not ( = ?auto_553296 ?auto_553297 ) ) ( not ( = ?auto_553296 ?auto_553298 ) ) ( not ( = ?auto_553296 ?auto_553299 ) ) ( not ( = ?auto_553296 ?auto_553300 ) ) ( not ( = ?auto_553296 ?auto_553301 ) ) ( not ( = ?auto_553296 ?auto_553302 ) ) ( not ( = ?auto_553297 ?auto_553298 ) ) ( not ( = ?auto_553297 ?auto_553299 ) ) ( not ( = ?auto_553297 ?auto_553300 ) ) ( not ( = ?auto_553297 ?auto_553301 ) ) ( not ( = ?auto_553297 ?auto_553302 ) ) ( not ( = ?auto_553298 ?auto_553299 ) ) ( not ( = ?auto_553298 ?auto_553300 ) ) ( not ( = ?auto_553298 ?auto_553301 ) ) ( not ( = ?auto_553298 ?auto_553302 ) ) ( not ( = ?auto_553299 ?auto_553300 ) ) ( not ( = ?auto_553299 ?auto_553301 ) ) ( not ( = ?auto_553299 ?auto_553302 ) ) ( not ( = ?auto_553300 ?auto_553301 ) ) ( not ( = ?auto_553300 ?auto_553302 ) ) ( not ( = ?auto_553301 ?auto_553302 ) ) ( ON ?auto_553300 ?auto_553301 ) ( ON ?auto_553299 ?auto_553300 ) ( ON ?auto_553298 ?auto_553299 ) ( CLEAR ?auto_553296 ) ( ON ?auto_553297 ?auto_553298 ) ( CLEAR ?auto_553297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_553295 ?auto_553296 ?auto_553297 )
      ( MAKE-7PILE ?auto_553295 ?auto_553296 ?auto_553297 ?auto_553298 ?auto_553299 ?auto_553300 ?auto_553301 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553325 - BLOCK
      ?auto_553326 - BLOCK
      ?auto_553327 - BLOCK
      ?auto_553328 - BLOCK
      ?auto_553329 - BLOCK
      ?auto_553330 - BLOCK
      ?auto_553331 - BLOCK
    )
    :vars
    (
      ?auto_553332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553331 ?auto_553332 ) ( ON-TABLE ?auto_553325 ) ( not ( = ?auto_553325 ?auto_553326 ) ) ( not ( = ?auto_553325 ?auto_553327 ) ) ( not ( = ?auto_553325 ?auto_553328 ) ) ( not ( = ?auto_553325 ?auto_553329 ) ) ( not ( = ?auto_553325 ?auto_553330 ) ) ( not ( = ?auto_553325 ?auto_553331 ) ) ( not ( = ?auto_553325 ?auto_553332 ) ) ( not ( = ?auto_553326 ?auto_553327 ) ) ( not ( = ?auto_553326 ?auto_553328 ) ) ( not ( = ?auto_553326 ?auto_553329 ) ) ( not ( = ?auto_553326 ?auto_553330 ) ) ( not ( = ?auto_553326 ?auto_553331 ) ) ( not ( = ?auto_553326 ?auto_553332 ) ) ( not ( = ?auto_553327 ?auto_553328 ) ) ( not ( = ?auto_553327 ?auto_553329 ) ) ( not ( = ?auto_553327 ?auto_553330 ) ) ( not ( = ?auto_553327 ?auto_553331 ) ) ( not ( = ?auto_553327 ?auto_553332 ) ) ( not ( = ?auto_553328 ?auto_553329 ) ) ( not ( = ?auto_553328 ?auto_553330 ) ) ( not ( = ?auto_553328 ?auto_553331 ) ) ( not ( = ?auto_553328 ?auto_553332 ) ) ( not ( = ?auto_553329 ?auto_553330 ) ) ( not ( = ?auto_553329 ?auto_553331 ) ) ( not ( = ?auto_553329 ?auto_553332 ) ) ( not ( = ?auto_553330 ?auto_553331 ) ) ( not ( = ?auto_553330 ?auto_553332 ) ) ( not ( = ?auto_553331 ?auto_553332 ) ) ( ON ?auto_553330 ?auto_553331 ) ( ON ?auto_553329 ?auto_553330 ) ( ON ?auto_553328 ?auto_553329 ) ( ON ?auto_553327 ?auto_553328 ) ( CLEAR ?auto_553325 ) ( ON ?auto_553326 ?auto_553327 ) ( CLEAR ?auto_553326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_553325 ?auto_553326 )
      ( MAKE-7PILE ?auto_553325 ?auto_553326 ?auto_553327 ?auto_553328 ?auto_553329 ?auto_553330 ?auto_553331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_553355 - BLOCK
      ?auto_553356 - BLOCK
      ?auto_553357 - BLOCK
      ?auto_553358 - BLOCK
      ?auto_553359 - BLOCK
      ?auto_553360 - BLOCK
      ?auto_553361 - BLOCK
    )
    :vars
    (
      ?auto_553362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553361 ?auto_553362 ) ( not ( = ?auto_553355 ?auto_553356 ) ) ( not ( = ?auto_553355 ?auto_553357 ) ) ( not ( = ?auto_553355 ?auto_553358 ) ) ( not ( = ?auto_553355 ?auto_553359 ) ) ( not ( = ?auto_553355 ?auto_553360 ) ) ( not ( = ?auto_553355 ?auto_553361 ) ) ( not ( = ?auto_553355 ?auto_553362 ) ) ( not ( = ?auto_553356 ?auto_553357 ) ) ( not ( = ?auto_553356 ?auto_553358 ) ) ( not ( = ?auto_553356 ?auto_553359 ) ) ( not ( = ?auto_553356 ?auto_553360 ) ) ( not ( = ?auto_553356 ?auto_553361 ) ) ( not ( = ?auto_553356 ?auto_553362 ) ) ( not ( = ?auto_553357 ?auto_553358 ) ) ( not ( = ?auto_553357 ?auto_553359 ) ) ( not ( = ?auto_553357 ?auto_553360 ) ) ( not ( = ?auto_553357 ?auto_553361 ) ) ( not ( = ?auto_553357 ?auto_553362 ) ) ( not ( = ?auto_553358 ?auto_553359 ) ) ( not ( = ?auto_553358 ?auto_553360 ) ) ( not ( = ?auto_553358 ?auto_553361 ) ) ( not ( = ?auto_553358 ?auto_553362 ) ) ( not ( = ?auto_553359 ?auto_553360 ) ) ( not ( = ?auto_553359 ?auto_553361 ) ) ( not ( = ?auto_553359 ?auto_553362 ) ) ( not ( = ?auto_553360 ?auto_553361 ) ) ( not ( = ?auto_553360 ?auto_553362 ) ) ( not ( = ?auto_553361 ?auto_553362 ) ) ( ON ?auto_553360 ?auto_553361 ) ( ON ?auto_553359 ?auto_553360 ) ( ON ?auto_553358 ?auto_553359 ) ( ON ?auto_553357 ?auto_553358 ) ( ON ?auto_553356 ?auto_553357 ) ( ON ?auto_553355 ?auto_553356 ) ( CLEAR ?auto_553355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_553355 )
      ( MAKE-7PILE ?auto_553355 ?auto_553356 ?auto_553357 ?auto_553358 ?auto_553359 ?auto_553360 ?auto_553361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553386 - BLOCK
      ?auto_553387 - BLOCK
      ?auto_553388 - BLOCK
      ?auto_553389 - BLOCK
      ?auto_553390 - BLOCK
      ?auto_553391 - BLOCK
      ?auto_553392 - BLOCK
      ?auto_553393 - BLOCK
    )
    :vars
    (
      ?auto_553394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_553392 ) ( ON ?auto_553393 ?auto_553394 ) ( CLEAR ?auto_553393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_553386 ) ( ON ?auto_553387 ?auto_553386 ) ( ON ?auto_553388 ?auto_553387 ) ( ON ?auto_553389 ?auto_553388 ) ( ON ?auto_553390 ?auto_553389 ) ( ON ?auto_553391 ?auto_553390 ) ( ON ?auto_553392 ?auto_553391 ) ( not ( = ?auto_553386 ?auto_553387 ) ) ( not ( = ?auto_553386 ?auto_553388 ) ) ( not ( = ?auto_553386 ?auto_553389 ) ) ( not ( = ?auto_553386 ?auto_553390 ) ) ( not ( = ?auto_553386 ?auto_553391 ) ) ( not ( = ?auto_553386 ?auto_553392 ) ) ( not ( = ?auto_553386 ?auto_553393 ) ) ( not ( = ?auto_553386 ?auto_553394 ) ) ( not ( = ?auto_553387 ?auto_553388 ) ) ( not ( = ?auto_553387 ?auto_553389 ) ) ( not ( = ?auto_553387 ?auto_553390 ) ) ( not ( = ?auto_553387 ?auto_553391 ) ) ( not ( = ?auto_553387 ?auto_553392 ) ) ( not ( = ?auto_553387 ?auto_553393 ) ) ( not ( = ?auto_553387 ?auto_553394 ) ) ( not ( = ?auto_553388 ?auto_553389 ) ) ( not ( = ?auto_553388 ?auto_553390 ) ) ( not ( = ?auto_553388 ?auto_553391 ) ) ( not ( = ?auto_553388 ?auto_553392 ) ) ( not ( = ?auto_553388 ?auto_553393 ) ) ( not ( = ?auto_553388 ?auto_553394 ) ) ( not ( = ?auto_553389 ?auto_553390 ) ) ( not ( = ?auto_553389 ?auto_553391 ) ) ( not ( = ?auto_553389 ?auto_553392 ) ) ( not ( = ?auto_553389 ?auto_553393 ) ) ( not ( = ?auto_553389 ?auto_553394 ) ) ( not ( = ?auto_553390 ?auto_553391 ) ) ( not ( = ?auto_553390 ?auto_553392 ) ) ( not ( = ?auto_553390 ?auto_553393 ) ) ( not ( = ?auto_553390 ?auto_553394 ) ) ( not ( = ?auto_553391 ?auto_553392 ) ) ( not ( = ?auto_553391 ?auto_553393 ) ) ( not ( = ?auto_553391 ?auto_553394 ) ) ( not ( = ?auto_553392 ?auto_553393 ) ) ( not ( = ?auto_553392 ?auto_553394 ) ) ( not ( = ?auto_553393 ?auto_553394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_553393 ?auto_553394 )
      ( !STACK ?auto_553393 ?auto_553392 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553420 - BLOCK
      ?auto_553421 - BLOCK
      ?auto_553422 - BLOCK
      ?auto_553423 - BLOCK
      ?auto_553424 - BLOCK
      ?auto_553425 - BLOCK
      ?auto_553426 - BLOCK
      ?auto_553427 - BLOCK
    )
    :vars
    (
      ?auto_553428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553427 ?auto_553428 ) ( ON-TABLE ?auto_553420 ) ( ON ?auto_553421 ?auto_553420 ) ( ON ?auto_553422 ?auto_553421 ) ( ON ?auto_553423 ?auto_553422 ) ( ON ?auto_553424 ?auto_553423 ) ( ON ?auto_553425 ?auto_553424 ) ( not ( = ?auto_553420 ?auto_553421 ) ) ( not ( = ?auto_553420 ?auto_553422 ) ) ( not ( = ?auto_553420 ?auto_553423 ) ) ( not ( = ?auto_553420 ?auto_553424 ) ) ( not ( = ?auto_553420 ?auto_553425 ) ) ( not ( = ?auto_553420 ?auto_553426 ) ) ( not ( = ?auto_553420 ?auto_553427 ) ) ( not ( = ?auto_553420 ?auto_553428 ) ) ( not ( = ?auto_553421 ?auto_553422 ) ) ( not ( = ?auto_553421 ?auto_553423 ) ) ( not ( = ?auto_553421 ?auto_553424 ) ) ( not ( = ?auto_553421 ?auto_553425 ) ) ( not ( = ?auto_553421 ?auto_553426 ) ) ( not ( = ?auto_553421 ?auto_553427 ) ) ( not ( = ?auto_553421 ?auto_553428 ) ) ( not ( = ?auto_553422 ?auto_553423 ) ) ( not ( = ?auto_553422 ?auto_553424 ) ) ( not ( = ?auto_553422 ?auto_553425 ) ) ( not ( = ?auto_553422 ?auto_553426 ) ) ( not ( = ?auto_553422 ?auto_553427 ) ) ( not ( = ?auto_553422 ?auto_553428 ) ) ( not ( = ?auto_553423 ?auto_553424 ) ) ( not ( = ?auto_553423 ?auto_553425 ) ) ( not ( = ?auto_553423 ?auto_553426 ) ) ( not ( = ?auto_553423 ?auto_553427 ) ) ( not ( = ?auto_553423 ?auto_553428 ) ) ( not ( = ?auto_553424 ?auto_553425 ) ) ( not ( = ?auto_553424 ?auto_553426 ) ) ( not ( = ?auto_553424 ?auto_553427 ) ) ( not ( = ?auto_553424 ?auto_553428 ) ) ( not ( = ?auto_553425 ?auto_553426 ) ) ( not ( = ?auto_553425 ?auto_553427 ) ) ( not ( = ?auto_553425 ?auto_553428 ) ) ( not ( = ?auto_553426 ?auto_553427 ) ) ( not ( = ?auto_553426 ?auto_553428 ) ) ( not ( = ?auto_553427 ?auto_553428 ) ) ( CLEAR ?auto_553425 ) ( ON ?auto_553426 ?auto_553427 ) ( CLEAR ?auto_553426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_553420 ?auto_553421 ?auto_553422 ?auto_553423 ?auto_553424 ?auto_553425 ?auto_553426 )
      ( MAKE-8PILE ?auto_553420 ?auto_553421 ?auto_553422 ?auto_553423 ?auto_553424 ?auto_553425 ?auto_553426 ?auto_553427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553454 - BLOCK
      ?auto_553455 - BLOCK
      ?auto_553456 - BLOCK
      ?auto_553457 - BLOCK
      ?auto_553458 - BLOCK
      ?auto_553459 - BLOCK
      ?auto_553460 - BLOCK
      ?auto_553461 - BLOCK
    )
    :vars
    (
      ?auto_553462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553461 ?auto_553462 ) ( ON-TABLE ?auto_553454 ) ( ON ?auto_553455 ?auto_553454 ) ( ON ?auto_553456 ?auto_553455 ) ( ON ?auto_553457 ?auto_553456 ) ( ON ?auto_553458 ?auto_553457 ) ( not ( = ?auto_553454 ?auto_553455 ) ) ( not ( = ?auto_553454 ?auto_553456 ) ) ( not ( = ?auto_553454 ?auto_553457 ) ) ( not ( = ?auto_553454 ?auto_553458 ) ) ( not ( = ?auto_553454 ?auto_553459 ) ) ( not ( = ?auto_553454 ?auto_553460 ) ) ( not ( = ?auto_553454 ?auto_553461 ) ) ( not ( = ?auto_553454 ?auto_553462 ) ) ( not ( = ?auto_553455 ?auto_553456 ) ) ( not ( = ?auto_553455 ?auto_553457 ) ) ( not ( = ?auto_553455 ?auto_553458 ) ) ( not ( = ?auto_553455 ?auto_553459 ) ) ( not ( = ?auto_553455 ?auto_553460 ) ) ( not ( = ?auto_553455 ?auto_553461 ) ) ( not ( = ?auto_553455 ?auto_553462 ) ) ( not ( = ?auto_553456 ?auto_553457 ) ) ( not ( = ?auto_553456 ?auto_553458 ) ) ( not ( = ?auto_553456 ?auto_553459 ) ) ( not ( = ?auto_553456 ?auto_553460 ) ) ( not ( = ?auto_553456 ?auto_553461 ) ) ( not ( = ?auto_553456 ?auto_553462 ) ) ( not ( = ?auto_553457 ?auto_553458 ) ) ( not ( = ?auto_553457 ?auto_553459 ) ) ( not ( = ?auto_553457 ?auto_553460 ) ) ( not ( = ?auto_553457 ?auto_553461 ) ) ( not ( = ?auto_553457 ?auto_553462 ) ) ( not ( = ?auto_553458 ?auto_553459 ) ) ( not ( = ?auto_553458 ?auto_553460 ) ) ( not ( = ?auto_553458 ?auto_553461 ) ) ( not ( = ?auto_553458 ?auto_553462 ) ) ( not ( = ?auto_553459 ?auto_553460 ) ) ( not ( = ?auto_553459 ?auto_553461 ) ) ( not ( = ?auto_553459 ?auto_553462 ) ) ( not ( = ?auto_553460 ?auto_553461 ) ) ( not ( = ?auto_553460 ?auto_553462 ) ) ( not ( = ?auto_553461 ?auto_553462 ) ) ( ON ?auto_553460 ?auto_553461 ) ( CLEAR ?auto_553458 ) ( ON ?auto_553459 ?auto_553460 ) ( CLEAR ?auto_553459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_553454 ?auto_553455 ?auto_553456 ?auto_553457 ?auto_553458 ?auto_553459 )
      ( MAKE-8PILE ?auto_553454 ?auto_553455 ?auto_553456 ?auto_553457 ?auto_553458 ?auto_553459 ?auto_553460 ?auto_553461 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553488 - BLOCK
      ?auto_553489 - BLOCK
      ?auto_553490 - BLOCK
      ?auto_553491 - BLOCK
      ?auto_553492 - BLOCK
      ?auto_553493 - BLOCK
      ?auto_553494 - BLOCK
      ?auto_553495 - BLOCK
    )
    :vars
    (
      ?auto_553496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553495 ?auto_553496 ) ( ON-TABLE ?auto_553488 ) ( ON ?auto_553489 ?auto_553488 ) ( ON ?auto_553490 ?auto_553489 ) ( ON ?auto_553491 ?auto_553490 ) ( not ( = ?auto_553488 ?auto_553489 ) ) ( not ( = ?auto_553488 ?auto_553490 ) ) ( not ( = ?auto_553488 ?auto_553491 ) ) ( not ( = ?auto_553488 ?auto_553492 ) ) ( not ( = ?auto_553488 ?auto_553493 ) ) ( not ( = ?auto_553488 ?auto_553494 ) ) ( not ( = ?auto_553488 ?auto_553495 ) ) ( not ( = ?auto_553488 ?auto_553496 ) ) ( not ( = ?auto_553489 ?auto_553490 ) ) ( not ( = ?auto_553489 ?auto_553491 ) ) ( not ( = ?auto_553489 ?auto_553492 ) ) ( not ( = ?auto_553489 ?auto_553493 ) ) ( not ( = ?auto_553489 ?auto_553494 ) ) ( not ( = ?auto_553489 ?auto_553495 ) ) ( not ( = ?auto_553489 ?auto_553496 ) ) ( not ( = ?auto_553490 ?auto_553491 ) ) ( not ( = ?auto_553490 ?auto_553492 ) ) ( not ( = ?auto_553490 ?auto_553493 ) ) ( not ( = ?auto_553490 ?auto_553494 ) ) ( not ( = ?auto_553490 ?auto_553495 ) ) ( not ( = ?auto_553490 ?auto_553496 ) ) ( not ( = ?auto_553491 ?auto_553492 ) ) ( not ( = ?auto_553491 ?auto_553493 ) ) ( not ( = ?auto_553491 ?auto_553494 ) ) ( not ( = ?auto_553491 ?auto_553495 ) ) ( not ( = ?auto_553491 ?auto_553496 ) ) ( not ( = ?auto_553492 ?auto_553493 ) ) ( not ( = ?auto_553492 ?auto_553494 ) ) ( not ( = ?auto_553492 ?auto_553495 ) ) ( not ( = ?auto_553492 ?auto_553496 ) ) ( not ( = ?auto_553493 ?auto_553494 ) ) ( not ( = ?auto_553493 ?auto_553495 ) ) ( not ( = ?auto_553493 ?auto_553496 ) ) ( not ( = ?auto_553494 ?auto_553495 ) ) ( not ( = ?auto_553494 ?auto_553496 ) ) ( not ( = ?auto_553495 ?auto_553496 ) ) ( ON ?auto_553494 ?auto_553495 ) ( ON ?auto_553493 ?auto_553494 ) ( CLEAR ?auto_553491 ) ( ON ?auto_553492 ?auto_553493 ) ( CLEAR ?auto_553492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_553488 ?auto_553489 ?auto_553490 ?auto_553491 ?auto_553492 )
      ( MAKE-8PILE ?auto_553488 ?auto_553489 ?auto_553490 ?auto_553491 ?auto_553492 ?auto_553493 ?auto_553494 ?auto_553495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553522 - BLOCK
      ?auto_553523 - BLOCK
      ?auto_553524 - BLOCK
      ?auto_553525 - BLOCK
      ?auto_553526 - BLOCK
      ?auto_553527 - BLOCK
      ?auto_553528 - BLOCK
      ?auto_553529 - BLOCK
    )
    :vars
    (
      ?auto_553530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553529 ?auto_553530 ) ( ON-TABLE ?auto_553522 ) ( ON ?auto_553523 ?auto_553522 ) ( ON ?auto_553524 ?auto_553523 ) ( not ( = ?auto_553522 ?auto_553523 ) ) ( not ( = ?auto_553522 ?auto_553524 ) ) ( not ( = ?auto_553522 ?auto_553525 ) ) ( not ( = ?auto_553522 ?auto_553526 ) ) ( not ( = ?auto_553522 ?auto_553527 ) ) ( not ( = ?auto_553522 ?auto_553528 ) ) ( not ( = ?auto_553522 ?auto_553529 ) ) ( not ( = ?auto_553522 ?auto_553530 ) ) ( not ( = ?auto_553523 ?auto_553524 ) ) ( not ( = ?auto_553523 ?auto_553525 ) ) ( not ( = ?auto_553523 ?auto_553526 ) ) ( not ( = ?auto_553523 ?auto_553527 ) ) ( not ( = ?auto_553523 ?auto_553528 ) ) ( not ( = ?auto_553523 ?auto_553529 ) ) ( not ( = ?auto_553523 ?auto_553530 ) ) ( not ( = ?auto_553524 ?auto_553525 ) ) ( not ( = ?auto_553524 ?auto_553526 ) ) ( not ( = ?auto_553524 ?auto_553527 ) ) ( not ( = ?auto_553524 ?auto_553528 ) ) ( not ( = ?auto_553524 ?auto_553529 ) ) ( not ( = ?auto_553524 ?auto_553530 ) ) ( not ( = ?auto_553525 ?auto_553526 ) ) ( not ( = ?auto_553525 ?auto_553527 ) ) ( not ( = ?auto_553525 ?auto_553528 ) ) ( not ( = ?auto_553525 ?auto_553529 ) ) ( not ( = ?auto_553525 ?auto_553530 ) ) ( not ( = ?auto_553526 ?auto_553527 ) ) ( not ( = ?auto_553526 ?auto_553528 ) ) ( not ( = ?auto_553526 ?auto_553529 ) ) ( not ( = ?auto_553526 ?auto_553530 ) ) ( not ( = ?auto_553527 ?auto_553528 ) ) ( not ( = ?auto_553527 ?auto_553529 ) ) ( not ( = ?auto_553527 ?auto_553530 ) ) ( not ( = ?auto_553528 ?auto_553529 ) ) ( not ( = ?auto_553528 ?auto_553530 ) ) ( not ( = ?auto_553529 ?auto_553530 ) ) ( ON ?auto_553528 ?auto_553529 ) ( ON ?auto_553527 ?auto_553528 ) ( ON ?auto_553526 ?auto_553527 ) ( CLEAR ?auto_553524 ) ( ON ?auto_553525 ?auto_553526 ) ( CLEAR ?auto_553525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_553522 ?auto_553523 ?auto_553524 ?auto_553525 )
      ( MAKE-8PILE ?auto_553522 ?auto_553523 ?auto_553524 ?auto_553525 ?auto_553526 ?auto_553527 ?auto_553528 ?auto_553529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553556 - BLOCK
      ?auto_553557 - BLOCK
      ?auto_553558 - BLOCK
      ?auto_553559 - BLOCK
      ?auto_553560 - BLOCK
      ?auto_553561 - BLOCK
      ?auto_553562 - BLOCK
      ?auto_553563 - BLOCK
    )
    :vars
    (
      ?auto_553564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553563 ?auto_553564 ) ( ON-TABLE ?auto_553556 ) ( ON ?auto_553557 ?auto_553556 ) ( not ( = ?auto_553556 ?auto_553557 ) ) ( not ( = ?auto_553556 ?auto_553558 ) ) ( not ( = ?auto_553556 ?auto_553559 ) ) ( not ( = ?auto_553556 ?auto_553560 ) ) ( not ( = ?auto_553556 ?auto_553561 ) ) ( not ( = ?auto_553556 ?auto_553562 ) ) ( not ( = ?auto_553556 ?auto_553563 ) ) ( not ( = ?auto_553556 ?auto_553564 ) ) ( not ( = ?auto_553557 ?auto_553558 ) ) ( not ( = ?auto_553557 ?auto_553559 ) ) ( not ( = ?auto_553557 ?auto_553560 ) ) ( not ( = ?auto_553557 ?auto_553561 ) ) ( not ( = ?auto_553557 ?auto_553562 ) ) ( not ( = ?auto_553557 ?auto_553563 ) ) ( not ( = ?auto_553557 ?auto_553564 ) ) ( not ( = ?auto_553558 ?auto_553559 ) ) ( not ( = ?auto_553558 ?auto_553560 ) ) ( not ( = ?auto_553558 ?auto_553561 ) ) ( not ( = ?auto_553558 ?auto_553562 ) ) ( not ( = ?auto_553558 ?auto_553563 ) ) ( not ( = ?auto_553558 ?auto_553564 ) ) ( not ( = ?auto_553559 ?auto_553560 ) ) ( not ( = ?auto_553559 ?auto_553561 ) ) ( not ( = ?auto_553559 ?auto_553562 ) ) ( not ( = ?auto_553559 ?auto_553563 ) ) ( not ( = ?auto_553559 ?auto_553564 ) ) ( not ( = ?auto_553560 ?auto_553561 ) ) ( not ( = ?auto_553560 ?auto_553562 ) ) ( not ( = ?auto_553560 ?auto_553563 ) ) ( not ( = ?auto_553560 ?auto_553564 ) ) ( not ( = ?auto_553561 ?auto_553562 ) ) ( not ( = ?auto_553561 ?auto_553563 ) ) ( not ( = ?auto_553561 ?auto_553564 ) ) ( not ( = ?auto_553562 ?auto_553563 ) ) ( not ( = ?auto_553562 ?auto_553564 ) ) ( not ( = ?auto_553563 ?auto_553564 ) ) ( ON ?auto_553562 ?auto_553563 ) ( ON ?auto_553561 ?auto_553562 ) ( ON ?auto_553560 ?auto_553561 ) ( ON ?auto_553559 ?auto_553560 ) ( CLEAR ?auto_553557 ) ( ON ?auto_553558 ?auto_553559 ) ( CLEAR ?auto_553558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_553556 ?auto_553557 ?auto_553558 )
      ( MAKE-8PILE ?auto_553556 ?auto_553557 ?auto_553558 ?auto_553559 ?auto_553560 ?auto_553561 ?auto_553562 ?auto_553563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553590 - BLOCK
      ?auto_553591 - BLOCK
      ?auto_553592 - BLOCK
      ?auto_553593 - BLOCK
      ?auto_553594 - BLOCK
      ?auto_553595 - BLOCK
      ?auto_553596 - BLOCK
      ?auto_553597 - BLOCK
    )
    :vars
    (
      ?auto_553598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553597 ?auto_553598 ) ( ON-TABLE ?auto_553590 ) ( not ( = ?auto_553590 ?auto_553591 ) ) ( not ( = ?auto_553590 ?auto_553592 ) ) ( not ( = ?auto_553590 ?auto_553593 ) ) ( not ( = ?auto_553590 ?auto_553594 ) ) ( not ( = ?auto_553590 ?auto_553595 ) ) ( not ( = ?auto_553590 ?auto_553596 ) ) ( not ( = ?auto_553590 ?auto_553597 ) ) ( not ( = ?auto_553590 ?auto_553598 ) ) ( not ( = ?auto_553591 ?auto_553592 ) ) ( not ( = ?auto_553591 ?auto_553593 ) ) ( not ( = ?auto_553591 ?auto_553594 ) ) ( not ( = ?auto_553591 ?auto_553595 ) ) ( not ( = ?auto_553591 ?auto_553596 ) ) ( not ( = ?auto_553591 ?auto_553597 ) ) ( not ( = ?auto_553591 ?auto_553598 ) ) ( not ( = ?auto_553592 ?auto_553593 ) ) ( not ( = ?auto_553592 ?auto_553594 ) ) ( not ( = ?auto_553592 ?auto_553595 ) ) ( not ( = ?auto_553592 ?auto_553596 ) ) ( not ( = ?auto_553592 ?auto_553597 ) ) ( not ( = ?auto_553592 ?auto_553598 ) ) ( not ( = ?auto_553593 ?auto_553594 ) ) ( not ( = ?auto_553593 ?auto_553595 ) ) ( not ( = ?auto_553593 ?auto_553596 ) ) ( not ( = ?auto_553593 ?auto_553597 ) ) ( not ( = ?auto_553593 ?auto_553598 ) ) ( not ( = ?auto_553594 ?auto_553595 ) ) ( not ( = ?auto_553594 ?auto_553596 ) ) ( not ( = ?auto_553594 ?auto_553597 ) ) ( not ( = ?auto_553594 ?auto_553598 ) ) ( not ( = ?auto_553595 ?auto_553596 ) ) ( not ( = ?auto_553595 ?auto_553597 ) ) ( not ( = ?auto_553595 ?auto_553598 ) ) ( not ( = ?auto_553596 ?auto_553597 ) ) ( not ( = ?auto_553596 ?auto_553598 ) ) ( not ( = ?auto_553597 ?auto_553598 ) ) ( ON ?auto_553596 ?auto_553597 ) ( ON ?auto_553595 ?auto_553596 ) ( ON ?auto_553594 ?auto_553595 ) ( ON ?auto_553593 ?auto_553594 ) ( ON ?auto_553592 ?auto_553593 ) ( CLEAR ?auto_553590 ) ( ON ?auto_553591 ?auto_553592 ) ( CLEAR ?auto_553591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_553590 ?auto_553591 )
      ( MAKE-8PILE ?auto_553590 ?auto_553591 ?auto_553592 ?auto_553593 ?auto_553594 ?auto_553595 ?auto_553596 ?auto_553597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_553624 - BLOCK
      ?auto_553625 - BLOCK
      ?auto_553626 - BLOCK
      ?auto_553627 - BLOCK
      ?auto_553628 - BLOCK
      ?auto_553629 - BLOCK
      ?auto_553630 - BLOCK
      ?auto_553631 - BLOCK
    )
    :vars
    (
      ?auto_553632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553631 ?auto_553632 ) ( not ( = ?auto_553624 ?auto_553625 ) ) ( not ( = ?auto_553624 ?auto_553626 ) ) ( not ( = ?auto_553624 ?auto_553627 ) ) ( not ( = ?auto_553624 ?auto_553628 ) ) ( not ( = ?auto_553624 ?auto_553629 ) ) ( not ( = ?auto_553624 ?auto_553630 ) ) ( not ( = ?auto_553624 ?auto_553631 ) ) ( not ( = ?auto_553624 ?auto_553632 ) ) ( not ( = ?auto_553625 ?auto_553626 ) ) ( not ( = ?auto_553625 ?auto_553627 ) ) ( not ( = ?auto_553625 ?auto_553628 ) ) ( not ( = ?auto_553625 ?auto_553629 ) ) ( not ( = ?auto_553625 ?auto_553630 ) ) ( not ( = ?auto_553625 ?auto_553631 ) ) ( not ( = ?auto_553625 ?auto_553632 ) ) ( not ( = ?auto_553626 ?auto_553627 ) ) ( not ( = ?auto_553626 ?auto_553628 ) ) ( not ( = ?auto_553626 ?auto_553629 ) ) ( not ( = ?auto_553626 ?auto_553630 ) ) ( not ( = ?auto_553626 ?auto_553631 ) ) ( not ( = ?auto_553626 ?auto_553632 ) ) ( not ( = ?auto_553627 ?auto_553628 ) ) ( not ( = ?auto_553627 ?auto_553629 ) ) ( not ( = ?auto_553627 ?auto_553630 ) ) ( not ( = ?auto_553627 ?auto_553631 ) ) ( not ( = ?auto_553627 ?auto_553632 ) ) ( not ( = ?auto_553628 ?auto_553629 ) ) ( not ( = ?auto_553628 ?auto_553630 ) ) ( not ( = ?auto_553628 ?auto_553631 ) ) ( not ( = ?auto_553628 ?auto_553632 ) ) ( not ( = ?auto_553629 ?auto_553630 ) ) ( not ( = ?auto_553629 ?auto_553631 ) ) ( not ( = ?auto_553629 ?auto_553632 ) ) ( not ( = ?auto_553630 ?auto_553631 ) ) ( not ( = ?auto_553630 ?auto_553632 ) ) ( not ( = ?auto_553631 ?auto_553632 ) ) ( ON ?auto_553630 ?auto_553631 ) ( ON ?auto_553629 ?auto_553630 ) ( ON ?auto_553628 ?auto_553629 ) ( ON ?auto_553627 ?auto_553628 ) ( ON ?auto_553626 ?auto_553627 ) ( ON ?auto_553625 ?auto_553626 ) ( ON ?auto_553624 ?auto_553625 ) ( CLEAR ?auto_553624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_553624 )
      ( MAKE-8PILE ?auto_553624 ?auto_553625 ?auto_553626 ?auto_553627 ?auto_553628 ?auto_553629 ?auto_553630 ?auto_553631 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553659 - BLOCK
      ?auto_553660 - BLOCK
      ?auto_553661 - BLOCK
      ?auto_553662 - BLOCK
      ?auto_553663 - BLOCK
      ?auto_553664 - BLOCK
      ?auto_553665 - BLOCK
      ?auto_553666 - BLOCK
      ?auto_553667 - BLOCK
    )
    :vars
    (
      ?auto_553668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_553666 ) ( ON ?auto_553667 ?auto_553668 ) ( CLEAR ?auto_553667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_553659 ) ( ON ?auto_553660 ?auto_553659 ) ( ON ?auto_553661 ?auto_553660 ) ( ON ?auto_553662 ?auto_553661 ) ( ON ?auto_553663 ?auto_553662 ) ( ON ?auto_553664 ?auto_553663 ) ( ON ?auto_553665 ?auto_553664 ) ( ON ?auto_553666 ?auto_553665 ) ( not ( = ?auto_553659 ?auto_553660 ) ) ( not ( = ?auto_553659 ?auto_553661 ) ) ( not ( = ?auto_553659 ?auto_553662 ) ) ( not ( = ?auto_553659 ?auto_553663 ) ) ( not ( = ?auto_553659 ?auto_553664 ) ) ( not ( = ?auto_553659 ?auto_553665 ) ) ( not ( = ?auto_553659 ?auto_553666 ) ) ( not ( = ?auto_553659 ?auto_553667 ) ) ( not ( = ?auto_553659 ?auto_553668 ) ) ( not ( = ?auto_553660 ?auto_553661 ) ) ( not ( = ?auto_553660 ?auto_553662 ) ) ( not ( = ?auto_553660 ?auto_553663 ) ) ( not ( = ?auto_553660 ?auto_553664 ) ) ( not ( = ?auto_553660 ?auto_553665 ) ) ( not ( = ?auto_553660 ?auto_553666 ) ) ( not ( = ?auto_553660 ?auto_553667 ) ) ( not ( = ?auto_553660 ?auto_553668 ) ) ( not ( = ?auto_553661 ?auto_553662 ) ) ( not ( = ?auto_553661 ?auto_553663 ) ) ( not ( = ?auto_553661 ?auto_553664 ) ) ( not ( = ?auto_553661 ?auto_553665 ) ) ( not ( = ?auto_553661 ?auto_553666 ) ) ( not ( = ?auto_553661 ?auto_553667 ) ) ( not ( = ?auto_553661 ?auto_553668 ) ) ( not ( = ?auto_553662 ?auto_553663 ) ) ( not ( = ?auto_553662 ?auto_553664 ) ) ( not ( = ?auto_553662 ?auto_553665 ) ) ( not ( = ?auto_553662 ?auto_553666 ) ) ( not ( = ?auto_553662 ?auto_553667 ) ) ( not ( = ?auto_553662 ?auto_553668 ) ) ( not ( = ?auto_553663 ?auto_553664 ) ) ( not ( = ?auto_553663 ?auto_553665 ) ) ( not ( = ?auto_553663 ?auto_553666 ) ) ( not ( = ?auto_553663 ?auto_553667 ) ) ( not ( = ?auto_553663 ?auto_553668 ) ) ( not ( = ?auto_553664 ?auto_553665 ) ) ( not ( = ?auto_553664 ?auto_553666 ) ) ( not ( = ?auto_553664 ?auto_553667 ) ) ( not ( = ?auto_553664 ?auto_553668 ) ) ( not ( = ?auto_553665 ?auto_553666 ) ) ( not ( = ?auto_553665 ?auto_553667 ) ) ( not ( = ?auto_553665 ?auto_553668 ) ) ( not ( = ?auto_553666 ?auto_553667 ) ) ( not ( = ?auto_553666 ?auto_553668 ) ) ( not ( = ?auto_553667 ?auto_553668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_553667 ?auto_553668 )
      ( !STACK ?auto_553667 ?auto_553666 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553697 - BLOCK
      ?auto_553698 - BLOCK
      ?auto_553699 - BLOCK
      ?auto_553700 - BLOCK
      ?auto_553701 - BLOCK
      ?auto_553702 - BLOCK
      ?auto_553703 - BLOCK
      ?auto_553704 - BLOCK
      ?auto_553705 - BLOCK
    )
    :vars
    (
      ?auto_553706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553705 ?auto_553706 ) ( ON-TABLE ?auto_553697 ) ( ON ?auto_553698 ?auto_553697 ) ( ON ?auto_553699 ?auto_553698 ) ( ON ?auto_553700 ?auto_553699 ) ( ON ?auto_553701 ?auto_553700 ) ( ON ?auto_553702 ?auto_553701 ) ( ON ?auto_553703 ?auto_553702 ) ( not ( = ?auto_553697 ?auto_553698 ) ) ( not ( = ?auto_553697 ?auto_553699 ) ) ( not ( = ?auto_553697 ?auto_553700 ) ) ( not ( = ?auto_553697 ?auto_553701 ) ) ( not ( = ?auto_553697 ?auto_553702 ) ) ( not ( = ?auto_553697 ?auto_553703 ) ) ( not ( = ?auto_553697 ?auto_553704 ) ) ( not ( = ?auto_553697 ?auto_553705 ) ) ( not ( = ?auto_553697 ?auto_553706 ) ) ( not ( = ?auto_553698 ?auto_553699 ) ) ( not ( = ?auto_553698 ?auto_553700 ) ) ( not ( = ?auto_553698 ?auto_553701 ) ) ( not ( = ?auto_553698 ?auto_553702 ) ) ( not ( = ?auto_553698 ?auto_553703 ) ) ( not ( = ?auto_553698 ?auto_553704 ) ) ( not ( = ?auto_553698 ?auto_553705 ) ) ( not ( = ?auto_553698 ?auto_553706 ) ) ( not ( = ?auto_553699 ?auto_553700 ) ) ( not ( = ?auto_553699 ?auto_553701 ) ) ( not ( = ?auto_553699 ?auto_553702 ) ) ( not ( = ?auto_553699 ?auto_553703 ) ) ( not ( = ?auto_553699 ?auto_553704 ) ) ( not ( = ?auto_553699 ?auto_553705 ) ) ( not ( = ?auto_553699 ?auto_553706 ) ) ( not ( = ?auto_553700 ?auto_553701 ) ) ( not ( = ?auto_553700 ?auto_553702 ) ) ( not ( = ?auto_553700 ?auto_553703 ) ) ( not ( = ?auto_553700 ?auto_553704 ) ) ( not ( = ?auto_553700 ?auto_553705 ) ) ( not ( = ?auto_553700 ?auto_553706 ) ) ( not ( = ?auto_553701 ?auto_553702 ) ) ( not ( = ?auto_553701 ?auto_553703 ) ) ( not ( = ?auto_553701 ?auto_553704 ) ) ( not ( = ?auto_553701 ?auto_553705 ) ) ( not ( = ?auto_553701 ?auto_553706 ) ) ( not ( = ?auto_553702 ?auto_553703 ) ) ( not ( = ?auto_553702 ?auto_553704 ) ) ( not ( = ?auto_553702 ?auto_553705 ) ) ( not ( = ?auto_553702 ?auto_553706 ) ) ( not ( = ?auto_553703 ?auto_553704 ) ) ( not ( = ?auto_553703 ?auto_553705 ) ) ( not ( = ?auto_553703 ?auto_553706 ) ) ( not ( = ?auto_553704 ?auto_553705 ) ) ( not ( = ?auto_553704 ?auto_553706 ) ) ( not ( = ?auto_553705 ?auto_553706 ) ) ( CLEAR ?auto_553703 ) ( ON ?auto_553704 ?auto_553705 ) ( CLEAR ?auto_553704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_553697 ?auto_553698 ?auto_553699 ?auto_553700 ?auto_553701 ?auto_553702 ?auto_553703 ?auto_553704 )
      ( MAKE-9PILE ?auto_553697 ?auto_553698 ?auto_553699 ?auto_553700 ?auto_553701 ?auto_553702 ?auto_553703 ?auto_553704 ?auto_553705 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553735 - BLOCK
      ?auto_553736 - BLOCK
      ?auto_553737 - BLOCK
      ?auto_553738 - BLOCK
      ?auto_553739 - BLOCK
      ?auto_553740 - BLOCK
      ?auto_553741 - BLOCK
      ?auto_553742 - BLOCK
      ?auto_553743 - BLOCK
    )
    :vars
    (
      ?auto_553744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553743 ?auto_553744 ) ( ON-TABLE ?auto_553735 ) ( ON ?auto_553736 ?auto_553735 ) ( ON ?auto_553737 ?auto_553736 ) ( ON ?auto_553738 ?auto_553737 ) ( ON ?auto_553739 ?auto_553738 ) ( ON ?auto_553740 ?auto_553739 ) ( not ( = ?auto_553735 ?auto_553736 ) ) ( not ( = ?auto_553735 ?auto_553737 ) ) ( not ( = ?auto_553735 ?auto_553738 ) ) ( not ( = ?auto_553735 ?auto_553739 ) ) ( not ( = ?auto_553735 ?auto_553740 ) ) ( not ( = ?auto_553735 ?auto_553741 ) ) ( not ( = ?auto_553735 ?auto_553742 ) ) ( not ( = ?auto_553735 ?auto_553743 ) ) ( not ( = ?auto_553735 ?auto_553744 ) ) ( not ( = ?auto_553736 ?auto_553737 ) ) ( not ( = ?auto_553736 ?auto_553738 ) ) ( not ( = ?auto_553736 ?auto_553739 ) ) ( not ( = ?auto_553736 ?auto_553740 ) ) ( not ( = ?auto_553736 ?auto_553741 ) ) ( not ( = ?auto_553736 ?auto_553742 ) ) ( not ( = ?auto_553736 ?auto_553743 ) ) ( not ( = ?auto_553736 ?auto_553744 ) ) ( not ( = ?auto_553737 ?auto_553738 ) ) ( not ( = ?auto_553737 ?auto_553739 ) ) ( not ( = ?auto_553737 ?auto_553740 ) ) ( not ( = ?auto_553737 ?auto_553741 ) ) ( not ( = ?auto_553737 ?auto_553742 ) ) ( not ( = ?auto_553737 ?auto_553743 ) ) ( not ( = ?auto_553737 ?auto_553744 ) ) ( not ( = ?auto_553738 ?auto_553739 ) ) ( not ( = ?auto_553738 ?auto_553740 ) ) ( not ( = ?auto_553738 ?auto_553741 ) ) ( not ( = ?auto_553738 ?auto_553742 ) ) ( not ( = ?auto_553738 ?auto_553743 ) ) ( not ( = ?auto_553738 ?auto_553744 ) ) ( not ( = ?auto_553739 ?auto_553740 ) ) ( not ( = ?auto_553739 ?auto_553741 ) ) ( not ( = ?auto_553739 ?auto_553742 ) ) ( not ( = ?auto_553739 ?auto_553743 ) ) ( not ( = ?auto_553739 ?auto_553744 ) ) ( not ( = ?auto_553740 ?auto_553741 ) ) ( not ( = ?auto_553740 ?auto_553742 ) ) ( not ( = ?auto_553740 ?auto_553743 ) ) ( not ( = ?auto_553740 ?auto_553744 ) ) ( not ( = ?auto_553741 ?auto_553742 ) ) ( not ( = ?auto_553741 ?auto_553743 ) ) ( not ( = ?auto_553741 ?auto_553744 ) ) ( not ( = ?auto_553742 ?auto_553743 ) ) ( not ( = ?auto_553742 ?auto_553744 ) ) ( not ( = ?auto_553743 ?auto_553744 ) ) ( ON ?auto_553742 ?auto_553743 ) ( CLEAR ?auto_553740 ) ( ON ?auto_553741 ?auto_553742 ) ( CLEAR ?auto_553741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_553735 ?auto_553736 ?auto_553737 ?auto_553738 ?auto_553739 ?auto_553740 ?auto_553741 )
      ( MAKE-9PILE ?auto_553735 ?auto_553736 ?auto_553737 ?auto_553738 ?auto_553739 ?auto_553740 ?auto_553741 ?auto_553742 ?auto_553743 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553773 - BLOCK
      ?auto_553774 - BLOCK
      ?auto_553775 - BLOCK
      ?auto_553776 - BLOCK
      ?auto_553777 - BLOCK
      ?auto_553778 - BLOCK
      ?auto_553779 - BLOCK
      ?auto_553780 - BLOCK
      ?auto_553781 - BLOCK
    )
    :vars
    (
      ?auto_553782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553781 ?auto_553782 ) ( ON-TABLE ?auto_553773 ) ( ON ?auto_553774 ?auto_553773 ) ( ON ?auto_553775 ?auto_553774 ) ( ON ?auto_553776 ?auto_553775 ) ( ON ?auto_553777 ?auto_553776 ) ( not ( = ?auto_553773 ?auto_553774 ) ) ( not ( = ?auto_553773 ?auto_553775 ) ) ( not ( = ?auto_553773 ?auto_553776 ) ) ( not ( = ?auto_553773 ?auto_553777 ) ) ( not ( = ?auto_553773 ?auto_553778 ) ) ( not ( = ?auto_553773 ?auto_553779 ) ) ( not ( = ?auto_553773 ?auto_553780 ) ) ( not ( = ?auto_553773 ?auto_553781 ) ) ( not ( = ?auto_553773 ?auto_553782 ) ) ( not ( = ?auto_553774 ?auto_553775 ) ) ( not ( = ?auto_553774 ?auto_553776 ) ) ( not ( = ?auto_553774 ?auto_553777 ) ) ( not ( = ?auto_553774 ?auto_553778 ) ) ( not ( = ?auto_553774 ?auto_553779 ) ) ( not ( = ?auto_553774 ?auto_553780 ) ) ( not ( = ?auto_553774 ?auto_553781 ) ) ( not ( = ?auto_553774 ?auto_553782 ) ) ( not ( = ?auto_553775 ?auto_553776 ) ) ( not ( = ?auto_553775 ?auto_553777 ) ) ( not ( = ?auto_553775 ?auto_553778 ) ) ( not ( = ?auto_553775 ?auto_553779 ) ) ( not ( = ?auto_553775 ?auto_553780 ) ) ( not ( = ?auto_553775 ?auto_553781 ) ) ( not ( = ?auto_553775 ?auto_553782 ) ) ( not ( = ?auto_553776 ?auto_553777 ) ) ( not ( = ?auto_553776 ?auto_553778 ) ) ( not ( = ?auto_553776 ?auto_553779 ) ) ( not ( = ?auto_553776 ?auto_553780 ) ) ( not ( = ?auto_553776 ?auto_553781 ) ) ( not ( = ?auto_553776 ?auto_553782 ) ) ( not ( = ?auto_553777 ?auto_553778 ) ) ( not ( = ?auto_553777 ?auto_553779 ) ) ( not ( = ?auto_553777 ?auto_553780 ) ) ( not ( = ?auto_553777 ?auto_553781 ) ) ( not ( = ?auto_553777 ?auto_553782 ) ) ( not ( = ?auto_553778 ?auto_553779 ) ) ( not ( = ?auto_553778 ?auto_553780 ) ) ( not ( = ?auto_553778 ?auto_553781 ) ) ( not ( = ?auto_553778 ?auto_553782 ) ) ( not ( = ?auto_553779 ?auto_553780 ) ) ( not ( = ?auto_553779 ?auto_553781 ) ) ( not ( = ?auto_553779 ?auto_553782 ) ) ( not ( = ?auto_553780 ?auto_553781 ) ) ( not ( = ?auto_553780 ?auto_553782 ) ) ( not ( = ?auto_553781 ?auto_553782 ) ) ( ON ?auto_553780 ?auto_553781 ) ( ON ?auto_553779 ?auto_553780 ) ( CLEAR ?auto_553777 ) ( ON ?auto_553778 ?auto_553779 ) ( CLEAR ?auto_553778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_553773 ?auto_553774 ?auto_553775 ?auto_553776 ?auto_553777 ?auto_553778 )
      ( MAKE-9PILE ?auto_553773 ?auto_553774 ?auto_553775 ?auto_553776 ?auto_553777 ?auto_553778 ?auto_553779 ?auto_553780 ?auto_553781 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553811 - BLOCK
      ?auto_553812 - BLOCK
      ?auto_553813 - BLOCK
      ?auto_553814 - BLOCK
      ?auto_553815 - BLOCK
      ?auto_553816 - BLOCK
      ?auto_553817 - BLOCK
      ?auto_553818 - BLOCK
      ?auto_553819 - BLOCK
    )
    :vars
    (
      ?auto_553820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553819 ?auto_553820 ) ( ON-TABLE ?auto_553811 ) ( ON ?auto_553812 ?auto_553811 ) ( ON ?auto_553813 ?auto_553812 ) ( ON ?auto_553814 ?auto_553813 ) ( not ( = ?auto_553811 ?auto_553812 ) ) ( not ( = ?auto_553811 ?auto_553813 ) ) ( not ( = ?auto_553811 ?auto_553814 ) ) ( not ( = ?auto_553811 ?auto_553815 ) ) ( not ( = ?auto_553811 ?auto_553816 ) ) ( not ( = ?auto_553811 ?auto_553817 ) ) ( not ( = ?auto_553811 ?auto_553818 ) ) ( not ( = ?auto_553811 ?auto_553819 ) ) ( not ( = ?auto_553811 ?auto_553820 ) ) ( not ( = ?auto_553812 ?auto_553813 ) ) ( not ( = ?auto_553812 ?auto_553814 ) ) ( not ( = ?auto_553812 ?auto_553815 ) ) ( not ( = ?auto_553812 ?auto_553816 ) ) ( not ( = ?auto_553812 ?auto_553817 ) ) ( not ( = ?auto_553812 ?auto_553818 ) ) ( not ( = ?auto_553812 ?auto_553819 ) ) ( not ( = ?auto_553812 ?auto_553820 ) ) ( not ( = ?auto_553813 ?auto_553814 ) ) ( not ( = ?auto_553813 ?auto_553815 ) ) ( not ( = ?auto_553813 ?auto_553816 ) ) ( not ( = ?auto_553813 ?auto_553817 ) ) ( not ( = ?auto_553813 ?auto_553818 ) ) ( not ( = ?auto_553813 ?auto_553819 ) ) ( not ( = ?auto_553813 ?auto_553820 ) ) ( not ( = ?auto_553814 ?auto_553815 ) ) ( not ( = ?auto_553814 ?auto_553816 ) ) ( not ( = ?auto_553814 ?auto_553817 ) ) ( not ( = ?auto_553814 ?auto_553818 ) ) ( not ( = ?auto_553814 ?auto_553819 ) ) ( not ( = ?auto_553814 ?auto_553820 ) ) ( not ( = ?auto_553815 ?auto_553816 ) ) ( not ( = ?auto_553815 ?auto_553817 ) ) ( not ( = ?auto_553815 ?auto_553818 ) ) ( not ( = ?auto_553815 ?auto_553819 ) ) ( not ( = ?auto_553815 ?auto_553820 ) ) ( not ( = ?auto_553816 ?auto_553817 ) ) ( not ( = ?auto_553816 ?auto_553818 ) ) ( not ( = ?auto_553816 ?auto_553819 ) ) ( not ( = ?auto_553816 ?auto_553820 ) ) ( not ( = ?auto_553817 ?auto_553818 ) ) ( not ( = ?auto_553817 ?auto_553819 ) ) ( not ( = ?auto_553817 ?auto_553820 ) ) ( not ( = ?auto_553818 ?auto_553819 ) ) ( not ( = ?auto_553818 ?auto_553820 ) ) ( not ( = ?auto_553819 ?auto_553820 ) ) ( ON ?auto_553818 ?auto_553819 ) ( ON ?auto_553817 ?auto_553818 ) ( ON ?auto_553816 ?auto_553817 ) ( CLEAR ?auto_553814 ) ( ON ?auto_553815 ?auto_553816 ) ( CLEAR ?auto_553815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_553811 ?auto_553812 ?auto_553813 ?auto_553814 ?auto_553815 )
      ( MAKE-9PILE ?auto_553811 ?auto_553812 ?auto_553813 ?auto_553814 ?auto_553815 ?auto_553816 ?auto_553817 ?auto_553818 ?auto_553819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553849 - BLOCK
      ?auto_553850 - BLOCK
      ?auto_553851 - BLOCK
      ?auto_553852 - BLOCK
      ?auto_553853 - BLOCK
      ?auto_553854 - BLOCK
      ?auto_553855 - BLOCK
      ?auto_553856 - BLOCK
      ?auto_553857 - BLOCK
    )
    :vars
    (
      ?auto_553858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553857 ?auto_553858 ) ( ON-TABLE ?auto_553849 ) ( ON ?auto_553850 ?auto_553849 ) ( ON ?auto_553851 ?auto_553850 ) ( not ( = ?auto_553849 ?auto_553850 ) ) ( not ( = ?auto_553849 ?auto_553851 ) ) ( not ( = ?auto_553849 ?auto_553852 ) ) ( not ( = ?auto_553849 ?auto_553853 ) ) ( not ( = ?auto_553849 ?auto_553854 ) ) ( not ( = ?auto_553849 ?auto_553855 ) ) ( not ( = ?auto_553849 ?auto_553856 ) ) ( not ( = ?auto_553849 ?auto_553857 ) ) ( not ( = ?auto_553849 ?auto_553858 ) ) ( not ( = ?auto_553850 ?auto_553851 ) ) ( not ( = ?auto_553850 ?auto_553852 ) ) ( not ( = ?auto_553850 ?auto_553853 ) ) ( not ( = ?auto_553850 ?auto_553854 ) ) ( not ( = ?auto_553850 ?auto_553855 ) ) ( not ( = ?auto_553850 ?auto_553856 ) ) ( not ( = ?auto_553850 ?auto_553857 ) ) ( not ( = ?auto_553850 ?auto_553858 ) ) ( not ( = ?auto_553851 ?auto_553852 ) ) ( not ( = ?auto_553851 ?auto_553853 ) ) ( not ( = ?auto_553851 ?auto_553854 ) ) ( not ( = ?auto_553851 ?auto_553855 ) ) ( not ( = ?auto_553851 ?auto_553856 ) ) ( not ( = ?auto_553851 ?auto_553857 ) ) ( not ( = ?auto_553851 ?auto_553858 ) ) ( not ( = ?auto_553852 ?auto_553853 ) ) ( not ( = ?auto_553852 ?auto_553854 ) ) ( not ( = ?auto_553852 ?auto_553855 ) ) ( not ( = ?auto_553852 ?auto_553856 ) ) ( not ( = ?auto_553852 ?auto_553857 ) ) ( not ( = ?auto_553852 ?auto_553858 ) ) ( not ( = ?auto_553853 ?auto_553854 ) ) ( not ( = ?auto_553853 ?auto_553855 ) ) ( not ( = ?auto_553853 ?auto_553856 ) ) ( not ( = ?auto_553853 ?auto_553857 ) ) ( not ( = ?auto_553853 ?auto_553858 ) ) ( not ( = ?auto_553854 ?auto_553855 ) ) ( not ( = ?auto_553854 ?auto_553856 ) ) ( not ( = ?auto_553854 ?auto_553857 ) ) ( not ( = ?auto_553854 ?auto_553858 ) ) ( not ( = ?auto_553855 ?auto_553856 ) ) ( not ( = ?auto_553855 ?auto_553857 ) ) ( not ( = ?auto_553855 ?auto_553858 ) ) ( not ( = ?auto_553856 ?auto_553857 ) ) ( not ( = ?auto_553856 ?auto_553858 ) ) ( not ( = ?auto_553857 ?auto_553858 ) ) ( ON ?auto_553856 ?auto_553857 ) ( ON ?auto_553855 ?auto_553856 ) ( ON ?auto_553854 ?auto_553855 ) ( ON ?auto_553853 ?auto_553854 ) ( CLEAR ?auto_553851 ) ( ON ?auto_553852 ?auto_553853 ) ( CLEAR ?auto_553852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_553849 ?auto_553850 ?auto_553851 ?auto_553852 )
      ( MAKE-9PILE ?auto_553849 ?auto_553850 ?auto_553851 ?auto_553852 ?auto_553853 ?auto_553854 ?auto_553855 ?auto_553856 ?auto_553857 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553887 - BLOCK
      ?auto_553888 - BLOCK
      ?auto_553889 - BLOCK
      ?auto_553890 - BLOCK
      ?auto_553891 - BLOCK
      ?auto_553892 - BLOCK
      ?auto_553893 - BLOCK
      ?auto_553894 - BLOCK
      ?auto_553895 - BLOCK
    )
    :vars
    (
      ?auto_553896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553895 ?auto_553896 ) ( ON-TABLE ?auto_553887 ) ( ON ?auto_553888 ?auto_553887 ) ( not ( = ?auto_553887 ?auto_553888 ) ) ( not ( = ?auto_553887 ?auto_553889 ) ) ( not ( = ?auto_553887 ?auto_553890 ) ) ( not ( = ?auto_553887 ?auto_553891 ) ) ( not ( = ?auto_553887 ?auto_553892 ) ) ( not ( = ?auto_553887 ?auto_553893 ) ) ( not ( = ?auto_553887 ?auto_553894 ) ) ( not ( = ?auto_553887 ?auto_553895 ) ) ( not ( = ?auto_553887 ?auto_553896 ) ) ( not ( = ?auto_553888 ?auto_553889 ) ) ( not ( = ?auto_553888 ?auto_553890 ) ) ( not ( = ?auto_553888 ?auto_553891 ) ) ( not ( = ?auto_553888 ?auto_553892 ) ) ( not ( = ?auto_553888 ?auto_553893 ) ) ( not ( = ?auto_553888 ?auto_553894 ) ) ( not ( = ?auto_553888 ?auto_553895 ) ) ( not ( = ?auto_553888 ?auto_553896 ) ) ( not ( = ?auto_553889 ?auto_553890 ) ) ( not ( = ?auto_553889 ?auto_553891 ) ) ( not ( = ?auto_553889 ?auto_553892 ) ) ( not ( = ?auto_553889 ?auto_553893 ) ) ( not ( = ?auto_553889 ?auto_553894 ) ) ( not ( = ?auto_553889 ?auto_553895 ) ) ( not ( = ?auto_553889 ?auto_553896 ) ) ( not ( = ?auto_553890 ?auto_553891 ) ) ( not ( = ?auto_553890 ?auto_553892 ) ) ( not ( = ?auto_553890 ?auto_553893 ) ) ( not ( = ?auto_553890 ?auto_553894 ) ) ( not ( = ?auto_553890 ?auto_553895 ) ) ( not ( = ?auto_553890 ?auto_553896 ) ) ( not ( = ?auto_553891 ?auto_553892 ) ) ( not ( = ?auto_553891 ?auto_553893 ) ) ( not ( = ?auto_553891 ?auto_553894 ) ) ( not ( = ?auto_553891 ?auto_553895 ) ) ( not ( = ?auto_553891 ?auto_553896 ) ) ( not ( = ?auto_553892 ?auto_553893 ) ) ( not ( = ?auto_553892 ?auto_553894 ) ) ( not ( = ?auto_553892 ?auto_553895 ) ) ( not ( = ?auto_553892 ?auto_553896 ) ) ( not ( = ?auto_553893 ?auto_553894 ) ) ( not ( = ?auto_553893 ?auto_553895 ) ) ( not ( = ?auto_553893 ?auto_553896 ) ) ( not ( = ?auto_553894 ?auto_553895 ) ) ( not ( = ?auto_553894 ?auto_553896 ) ) ( not ( = ?auto_553895 ?auto_553896 ) ) ( ON ?auto_553894 ?auto_553895 ) ( ON ?auto_553893 ?auto_553894 ) ( ON ?auto_553892 ?auto_553893 ) ( ON ?auto_553891 ?auto_553892 ) ( ON ?auto_553890 ?auto_553891 ) ( CLEAR ?auto_553888 ) ( ON ?auto_553889 ?auto_553890 ) ( CLEAR ?auto_553889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_553887 ?auto_553888 ?auto_553889 )
      ( MAKE-9PILE ?auto_553887 ?auto_553888 ?auto_553889 ?auto_553890 ?auto_553891 ?auto_553892 ?auto_553893 ?auto_553894 ?auto_553895 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553925 - BLOCK
      ?auto_553926 - BLOCK
      ?auto_553927 - BLOCK
      ?auto_553928 - BLOCK
      ?auto_553929 - BLOCK
      ?auto_553930 - BLOCK
      ?auto_553931 - BLOCK
      ?auto_553932 - BLOCK
      ?auto_553933 - BLOCK
    )
    :vars
    (
      ?auto_553934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553933 ?auto_553934 ) ( ON-TABLE ?auto_553925 ) ( not ( = ?auto_553925 ?auto_553926 ) ) ( not ( = ?auto_553925 ?auto_553927 ) ) ( not ( = ?auto_553925 ?auto_553928 ) ) ( not ( = ?auto_553925 ?auto_553929 ) ) ( not ( = ?auto_553925 ?auto_553930 ) ) ( not ( = ?auto_553925 ?auto_553931 ) ) ( not ( = ?auto_553925 ?auto_553932 ) ) ( not ( = ?auto_553925 ?auto_553933 ) ) ( not ( = ?auto_553925 ?auto_553934 ) ) ( not ( = ?auto_553926 ?auto_553927 ) ) ( not ( = ?auto_553926 ?auto_553928 ) ) ( not ( = ?auto_553926 ?auto_553929 ) ) ( not ( = ?auto_553926 ?auto_553930 ) ) ( not ( = ?auto_553926 ?auto_553931 ) ) ( not ( = ?auto_553926 ?auto_553932 ) ) ( not ( = ?auto_553926 ?auto_553933 ) ) ( not ( = ?auto_553926 ?auto_553934 ) ) ( not ( = ?auto_553927 ?auto_553928 ) ) ( not ( = ?auto_553927 ?auto_553929 ) ) ( not ( = ?auto_553927 ?auto_553930 ) ) ( not ( = ?auto_553927 ?auto_553931 ) ) ( not ( = ?auto_553927 ?auto_553932 ) ) ( not ( = ?auto_553927 ?auto_553933 ) ) ( not ( = ?auto_553927 ?auto_553934 ) ) ( not ( = ?auto_553928 ?auto_553929 ) ) ( not ( = ?auto_553928 ?auto_553930 ) ) ( not ( = ?auto_553928 ?auto_553931 ) ) ( not ( = ?auto_553928 ?auto_553932 ) ) ( not ( = ?auto_553928 ?auto_553933 ) ) ( not ( = ?auto_553928 ?auto_553934 ) ) ( not ( = ?auto_553929 ?auto_553930 ) ) ( not ( = ?auto_553929 ?auto_553931 ) ) ( not ( = ?auto_553929 ?auto_553932 ) ) ( not ( = ?auto_553929 ?auto_553933 ) ) ( not ( = ?auto_553929 ?auto_553934 ) ) ( not ( = ?auto_553930 ?auto_553931 ) ) ( not ( = ?auto_553930 ?auto_553932 ) ) ( not ( = ?auto_553930 ?auto_553933 ) ) ( not ( = ?auto_553930 ?auto_553934 ) ) ( not ( = ?auto_553931 ?auto_553932 ) ) ( not ( = ?auto_553931 ?auto_553933 ) ) ( not ( = ?auto_553931 ?auto_553934 ) ) ( not ( = ?auto_553932 ?auto_553933 ) ) ( not ( = ?auto_553932 ?auto_553934 ) ) ( not ( = ?auto_553933 ?auto_553934 ) ) ( ON ?auto_553932 ?auto_553933 ) ( ON ?auto_553931 ?auto_553932 ) ( ON ?auto_553930 ?auto_553931 ) ( ON ?auto_553929 ?auto_553930 ) ( ON ?auto_553928 ?auto_553929 ) ( ON ?auto_553927 ?auto_553928 ) ( CLEAR ?auto_553925 ) ( ON ?auto_553926 ?auto_553927 ) ( CLEAR ?auto_553926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_553925 ?auto_553926 )
      ( MAKE-9PILE ?auto_553925 ?auto_553926 ?auto_553927 ?auto_553928 ?auto_553929 ?auto_553930 ?auto_553931 ?auto_553932 ?auto_553933 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_553963 - BLOCK
      ?auto_553964 - BLOCK
      ?auto_553965 - BLOCK
      ?auto_553966 - BLOCK
      ?auto_553967 - BLOCK
      ?auto_553968 - BLOCK
      ?auto_553969 - BLOCK
      ?auto_553970 - BLOCK
      ?auto_553971 - BLOCK
    )
    :vars
    (
      ?auto_553972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_553971 ?auto_553972 ) ( not ( = ?auto_553963 ?auto_553964 ) ) ( not ( = ?auto_553963 ?auto_553965 ) ) ( not ( = ?auto_553963 ?auto_553966 ) ) ( not ( = ?auto_553963 ?auto_553967 ) ) ( not ( = ?auto_553963 ?auto_553968 ) ) ( not ( = ?auto_553963 ?auto_553969 ) ) ( not ( = ?auto_553963 ?auto_553970 ) ) ( not ( = ?auto_553963 ?auto_553971 ) ) ( not ( = ?auto_553963 ?auto_553972 ) ) ( not ( = ?auto_553964 ?auto_553965 ) ) ( not ( = ?auto_553964 ?auto_553966 ) ) ( not ( = ?auto_553964 ?auto_553967 ) ) ( not ( = ?auto_553964 ?auto_553968 ) ) ( not ( = ?auto_553964 ?auto_553969 ) ) ( not ( = ?auto_553964 ?auto_553970 ) ) ( not ( = ?auto_553964 ?auto_553971 ) ) ( not ( = ?auto_553964 ?auto_553972 ) ) ( not ( = ?auto_553965 ?auto_553966 ) ) ( not ( = ?auto_553965 ?auto_553967 ) ) ( not ( = ?auto_553965 ?auto_553968 ) ) ( not ( = ?auto_553965 ?auto_553969 ) ) ( not ( = ?auto_553965 ?auto_553970 ) ) ( not ( = ?auto_553965 ?auto_553971 ) ) ( not ( = ?auto_553965 ?auto_553972 ) ) ( not ( = ?auto_553966 ?auto_553967 ) ) ( not ( = ?auto_553966 ?auto_553968 ) ) ( not ( = ?auto_553966 ?auto_553969 ) ) ( not ( = ?auto_553966 ?auto_553970 ) ) ( not ( = ?auto_553966 ?auto_553971 ) ) ( not ( = ?auto_553966 ?auto_553972 ) ) ( not ( = ?auto_553967 ?auto_553968 ) ) ( not ( = ?auto_553967 ?auto_553969 ) ) ( not ( = ?auto_553967 ?auto_553970 ) ) ( not ( = ?auto_553967 ?auto_553971 ) ) ( not ( = ?auto_553967 ?auto_553972 ) ) ( not ( = ?auto_553968 ?auto_553969 ) ) ( not ( = ?auto_553968 ?auto_553970 ) ) ( not ( = ?auto_553968 ?auto_553971 ) ) ( not ( = ?auto_553968 ?auto_553972 ) ) ( not ( = ?auto_553969 ?auto_553970 ) ) ( not ( = ?auto_553969 ?auto_553971 ) ) ( not ( = ?auto_553969 ?auto_553972 ) ) ( not ( = ?auto_553970 ?auto_553971 ) ) ( not ( = ?auto_553970 ?auto_553972 ) ) ( not ( = ?auto_553971 ?auto_553972 ) ) ( ON ?auto_553970 ?auto_553971 ) ( ON ?auto_553969 ?auto_553970 ) ( ON ?auto_553968 ?auto_553969 ) ( ON ?auto_553967 ?auto_553968 ) ( ON ?auto_553966 ?auto_553967 ) ( ON ?auto_553965 ?auto_553966 ) ( ON ?auto_553964 ?auto_553965 ) ( ON ?auto_553963 ?auto_553964 ) ( CLEAR ?auto_553963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_553963 )
      ( MAKE-9PILE ?auto_553963 ?auto_553964 ?auto_553965 ?auto_553966 ?auto_553967 ?auto_553968 ?auto_553969 ?auto_553970 ?auto_553971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554002 - BLOCK
      ?auto_554003 - BLOCK
      ?auto_554004 - BLOCK
      ?auto_554005 - BLOCK
      ?auto_554006 - BLOCK
      ?auto_554007 - BLOCK
      ?auto_554008 - BLOCK
      ?auto_554009 - BLOCK
      ?auto_554010 - BLOCK
      ?auto_554011 - BLOCK
    )
    :vars
    (
      ?auto_554012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_554010 ) ( ON ?auto_554011 ?auto_554012 ) ( CLEAR ?auto_554011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_554002 ) ( ON ?auto_554003 ?auto_554002 ) ( ON ?auto_554004 ?auto_554003 ) ( ON ?auto_554005 ?auto_554004 ) ( ON ?auto_554006 ?auto_554005 ) ( ON ?auto_554007 ?auto_554006 ) ( ON ?auto_554008 ?auto_554007 ) ( ON ?auto_554009 ?auto_554008 ) ( ON ?auto_554010 ?auto_554009 ) ( not ( = ?auto_554002 ?auto_554003 ) ) ( not ( = ?auto_554002 ?auto_554004 ) ) ( not ( = ?auto_554002 ?auto_554005 ) ) ( not ( = ?auto_554002 ?auto_554006 ) ) ( not ( = ?auto_554002 ?auto_554007 ) ) ( not ( = ?auto_554002 ?auto_554008 ) ) ( not ( = ?auto_554002 ?auto_554009 ) ) ( not ( = ?auto_554002 ?auto_554010 ) ) ( not ( = ?auto_554002 ?auto_554011 ) ) ( not ( = ?auto_554002 ?auto_554012 ) ) ( not ( = ?auto_554003 ?auto_554004 ) ) ( not ( = ?auto_554003 ?auto_554005 ) ) ( not ( = ?auto_554003 ?auto_554006 ) ) ( not ( = ?auto_554003 ?auto_554007 ) ) ( not ( = ?auto_554003 ?auto_554008 ) ) ( not ( = ?auto_554003 ?auto_554009 ) ) ( not ( = ?auto_554003 ?auto_554010 ) ) ( not ( = ?auto_554003 ?auto_554011 ) ) ( not ( = ?auto_554003 ?auto_554012 ) ) ( not ( = ?auto_554004 ?auto_554005 ) ) ( not ( = ?auto_554004 ?auto_554006 ) ) ( not ( = ?auto_554004 ?auto_554007 ) ) ( not ( = ?auto_554004 ?auto_554008 ) ) ( not ( = ?auto_554004 ?auto_554009 ) ) ( not ( = ?auto_554004 ?auto_554010 ) ) ( not ( = ?auto_554004 ?auto_554011 ) ) ( not ( = ?auto_554004 ?auto_554012 ) ) ( not ( = ?auto_554005 ?auto_554006 ) ) ( not ( = ?auto_554005 ?auto_554007 ) ) ( not ( = ?auto_554005 ?auto_554008 ) ) ( not ( = ?auto_554005 ?auto_554009 ) ) ( not ( = ?auto_554005 ?auto_554010 ) ) ( not ( = ?auto_554005 ?auto_554011 ) ) ( not ( = ?auto_554005 ?auto_554012 ) ) ( not ( = ?auto_554006 ?auto_554007 ) ) ( not ( = ?auto_554006 ?auto_554008 ) ) ( not ( = ?auto_554006 ?auto_554009 ) ) ( not ( = ?auto_554006 ?auto_554010 ) ) ( not ( = ?auto_554006 ?auto_554011 ) ) ( not ( = ?auto_554006 ?auto_554012 ) ) ( not ( = ?auto_554007 ?auto_554008 ) ) ( not ( = ?auto_554007 ?auto_554009 ) ) ( not ( = ?auto_554007 ?auto_554010 ) ) ( not ( = ?auto_554007 ?auto_554011 ) ) ( not ( = ?auto_554007 ?auto_554012 ) ) ( not ( = ?auto_554008 ?auto_554009 ) ) ( not ( = ?auto_554008 ?auto_554010 ) ) ( not ( = ?auto_554008 ?auto_554011 ) ) ( not ( = ?auto_554008 ?auto_554012 ) ) ( not ( = ?auto_554009 ?auto_554010 ) ) ( not ( = ?auto_554009 ?auto_554011 ) ) ( not ( = ?auto_554009 ?auto_554012 ) ) ( not ( = ?auto_554010 ?auto_554011 ) ) ( not ( = ?auto_554010 ?auto_554012 ) ) ( not ( = ?auto_554011 ?auto_554012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_554011 ?auto_554012 )
      ( !STACK ?auto_554011 ?auto_554010 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554044 - BLOCK
      ?auto_554045 - BLOCK
      ?auto_554046 - BLOCK
      ?auto_554047 - BLOCK
      ?auto_554048 - BLOCK
      ?auto_554049 - BLOCK
      ?auto_554050 - BLOCK
      ?auto_554051 - BLOCK
      ?auto_554052 - BLOCK
      ?auto_554053 - BLOCK
    )
    :vars
    (
      ?auto_554054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554053 ?auto_554054 ) ( ON-TABLE ?auto_554044 ) ( ON ?auto_554045 ?auto_554044 ) ( ON ?auto_554046 ?auto_554045 ) ( ON ?auto_554047 ?auto_554046 ) ( ON ?auto_554048 ?auto_554047 ) ( ON ?auto_554049 ?auto_554048 ) ( ON ?auto_554050 ?auto_554049 ) ( ON ?auto_554051 ?auto_554050 ) ( not ( = ?auto_554044 ?auto_554045 ) ) ( not ( = ?auto_554044 ?auto_554046 ) ) ( not ( = ?auto_554044 ?auto_554047 ) ) ( not ( = ?auto_554044 ?auto_554048 ) ) ( not ( = ?auto_554044 ?auto_554049 ) ) ( not ( = ?auto_554044 ?auto_554050 ) ) ( not ( = ?auto_554044 ?auto_554051 ) ) ( not ( = ?auto_554044 ?auto_554052 ) ) ( not ( = ?auto_554044 ?auto_554053 ) ) ( not ( = ?auto_554044 ?auto_554054 ) ) ( not ( = ?auto_554045 ?auto_554046 ) ) ( not ( = ?auto_554045 ?auto_554047 ) ) ( not ( = ?auto_554045 ?auto_554048 ) ) ( not ( = ?auto_554045 ?auto_554049 ) ) ( not ( = ?auto_554045 ?auto_554050 ) ) ( not ( = ?auto_554045 ?auto_554051 ) ) ( not ( = ?auto_554045 ?auto_554052 ) ) ( not ( = ?auto_554045 ?auto_554053 ) ) ( not ( = ?auto_554045 ?auto_554054 ) ) ( not ( = ?auto_554046 ?auto_554047 ) ) ( not ( = ?auto_554046 ?auto_554048 ) ) ( not ( = ?auto_554046 ?auto_554049 ) ) ( not ( = ?auto_554046 ?auto_554050 ) ) ( not ( = ?auto_554046 ?auto_554051 ) ) ( not ( = ?auto_554046 ?auto_554052 ) ) ( not ( = ?auto_554046 ?auto_554053 ) ) ( not ( = ?auto_554046 ?auto_554054 ) ) ( not ( = ?auto_554047 ?auto_554048 ) ) ( not ( = ?auto_554047 ?auto_554049 ) ) ( not ( = ?auto_554047 ?auto_554050 ) ) ( not ( = ?auto_554047 ?auto_554051 ) ) ( not ( = ?auto_554047 ?auto_554052 ) ) ( not ( = ?auto_554047 ?auto_554053 ) ) ( not ( = ?auto_554047 ?auto_554054 ) ) ( not ( = ?auto_554048 ?auto_554049 ) ) ( not ( = ?auto_554048 ?auto_554050 ) ) ( not ( = ?auto_554048 ?auto_554051 ) ) ( not ( = ?auto_554048 ?auto_554052 ) ) ( not ( = ?auto_554048 ?auto_554053 ) ) ( not ( = ?auto_554048 ?auto_554054 ) ) ( not ( = ?auto_554049 ?auto_554050 ) ) ( not ( = ?auto_554049 ?auto_554051 ) ) ( not ( = ?auto_554049 ?auto_554052 ) ) ( not ( = ?auto_554049 ?auto_554053 ) ) ( not ( = ?auto_554049 ?auto_554054 ) ) ( not ( = ?auto_554050 ?auto_554051 ) ) ( not ( = ?auto_554050 ?auto_554052 ) ) ( not ( = ?auto_554050 ?auto_554053 ) ) ( not ( = ?auto_554050 ?auto_554054 ) ) ( not ( = ?auto_554051 ?auto_554052 ) ) ( not ( = ?auto_554051 ?auto_554053 ) ) ( not ( = ?auto_554051 ?auto_554054 ) ) ( not ( = ?auto_554052 ?auto_554053 ) ) ( not ( = ?auto_554052 ?auto_554054 ) ) ( not ( = ?auto_554053 ?auto_554054 ) ) ( CLEAR ?auto_554051 ) ( ON ?auto_554052 ?auto_554053 ) ( CLEAR ?auto_554052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_554044 ?auto_554045 ?auto_554046 ?auto_554047 ?auto_554048 ?auto_554049 ?auto_554050 ?auto_554051 ?auto_554052 )
      ( MAKE-10PILE ?auto_554044 ?auto_554045 ?auto_554046 ?auto_554047 ?auto_554048 ?auto_554049 ?auto_554050 ?auto_554051 ?auto_554052 ?auto_554053 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554086 - BLOCK
      ?auto_554087 - BLOCK
      ?auto_554088 - BLOCK
      ?auto_554089 - BLOCK
      ?auto_554090 - BLOCK
      ?auto_554091 - BLOCK
      ?auto_554092 - BLOCK
      ?auto_554093 - BLOCK
      ?auto_554094 - BLOCK
      ?auto_554095 - BLOCK
    )
    :vars
    (
      ?auto_554096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554095 ?auto_554096 ) ( ON-TABLE ?auto_554086 ) ( ON ?auto_554087 ?auto_554086 ) ( ON ?auto_554088 ?auto_554087 ) ( ON ?auto_554089 ?auto_554088 ) ( ON ?auto_554090 ?auto_554089 ) ( ON ?auto_554091 ?auto_554090 ) ( ON ?auto_554092 ?auto_554091 ) ( not ( = ?auto_554086 ?auto_554087 ) ) ( not ( = ?auto_554086 ?auto_554088 ) ) ( not ( = ?auto_554086 ?auto_554089 ) ) ( not ( = ?auto_554086 ?auto_554090 ) ) ( not ( = ?auto_554086 ?auto_554091 ) ) ( not ( = ?auto_554086 ?auto_554092 ) ) ( not ( = ?auto_554086 ?auto_554093 ) ) ( not ( = ?auto_554086 ?auto_554094 ) ) ( not ( = ?auto_554086 ?auto_554095 ) ) ( not ( = ?auto_554086 ?auto_554096 ) ) ( not ( = ?auto_554087 ?auto_554088 ) ) ( not ( = ?auto_554087 ?auto_554089 ) ) ( not ( = ?auto_554087 ?auto_554090 ) ) ( not ( = ?auto_554087 ?auto_554091 ) ) ( not ( = ?auto_554087 ?auto_554092 ) ) ( not ( = ?auto_554087 ?auto_554093 ) ) ( not ( = ?auto_554087 ?auto_554094 ) ) ( not ( = ?auto_554087 ?auto_554095 ) ) ( not ( = ?auto_554087 ?auto_554096 ) ) ( not ( = ?auto_554088 ?auto_554089 ) ) ( not ( = ?auto_554088 ?auto_554090 ) ) ( not ( = ?auto_554088 ?auto_554091 ) ) ( not ( = ?auto_554088 ?auto_554092 ) ) ( not ( = ?auto_554088 ?auto_554093 ) ) ( not ( = ?auto_554088 ?auto_554094 ) ) ( not ( = ?auto_554088 ?auto_554095 ) ) ( not ( = ?auto_554088 ?auto_554096 ) ) ( not ( = ?auto_554089 ?auto_554090 ) ) ( not ( = ?auto_554089 ?auto_554091 ) ) ( not ( = ?auto_554089 ?auto_554092 ) ) ( not ( = ?auto_554089 ?auto_554093 ) ) ( not ( = ?auto_554089 ?auto_554094 ) ) ( not ( = ?auto_554089 ?auto_554095 ) ) ( not ( = ?auto_554089 ?auto_554096 ) ) ( not ( = ?auto_554090 ?auto_554091 ) ) ( not ( = ?auto_554090 ?auto_554092 ) ) ( not ( = ?auto_554090 ?auto_554093 ) ) ( not ( = ?auto_554090 ?auto_554094 ) ) ( not ( = ?auto_554090 ?auto_554095 ) ) ( not ( = ?auto_554090 ?auto_554096 ) ) ( not ( = ?auto_554091 ?auto_554092 ) ) ( not ( = ?auto_554091 ?auto_554093 ) ) ( not ( = ?auto_554091 ?auto_554094 ) ) ( not ( = ?auto_554091 ?auto_554095 ) ) ( not ( = ?auto_554091 ?auto_554096 ) ) ( not ( = ?auto_554092 ?auto_554093 ) ) ( not ( = ?auto_554092 ?auto_554094 ) ) ( not ( = ?auto_554092 ?auto_554095 ) ) ( not ( = ?auto_554092 ?auto_554096 ) ) ( not ( = ?auto_554093 ?auto_554094 ) ) ( not ( = ?auto_554093 ?auto_554095 ) ) ( not ( = ?auto_554093 ?auto_554096 ) ) ( not ( = ?auto_554094 ?auto_554095 ) ) ( not ( = ?auto_554094 ?auto_554096 ) ) ( not ( = ?auto_554095 ?auto_554096 ) ) ( ON ?auto_554094 ?auto_554095 ) ( CLEAR ?auto_554092 ) ( ON ?auto_554093 ?auto_554094 ) ( CLEAR ?auto_554093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_554086 ?auto_554087 ?auto_554088 ?auto_554089 ?auto_554090 ?auto_554091 ?auto_554092 ?auto_554093 )
      ( MAKE-10PILE ?auto_554086 ?auto_554087 ?auto_554088 ?auto_554089 ?auto_554090 ?auto_554091 ?auto_554092 ?auto_554093 ?auto_554094 ?auto_554095 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554128 - BLOCK
      ?auto_554129 - BLOCK
      ?auto_554130 - BLOCK
      ?auto_554131 - BLOCK
      ?auto_554132 - BLOCK
      ?auto_554133 - BLOCK
      ?auto_554134 - BLOCK
      ?auto_554135 - BLOCK
      ?auto_554136 - BLOCK
      ?auto_554137 - BLOCK
    )
    :vars
    (
      ?auto_554138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554137 ?auto_554138 ) ( ON-TABLE ?auto_554128 ) ( ON ?auto_554129 ?auto_554128 ) ( ON ?auto_554130 ?auto_554129 ) ( ON ?auto_554131 ?auto_554130 ) ( ON ?auto_554132 ?auto_554131 ) ( ON ?auto_554133 ?auto_554132 ) ( not ( = ?auto_554128 ?auto_554129 ) ) ( not ( = ?auto_554128 ?auto_554130 ) ) ( not ( = ?auto_554128 ?auto_554131 ) ) ( not ( = ?auto_554128 ?auto_554132 ) ) ( not ( = ?auto_554128 ?auto_554133 ) ) ( not ( = ?auto_554128 ?auto_554134 ) ) ( not ( = ?auto_554128 ?auto_554135 ) ) ( not ( = ?auto_554128 ?auto_554136 ) ) ( not ( = ?auto_554128 ?auto_554137 ) ) ( not ( = ?auto_554128 ?auto_554138 ) ) ( not ( = ?auto_554129 ?auto_554130 ) ) ( not ( = ?auto_554129 ?auto_554131 ) ) ( not ( = ?auto_554129 ?auto_554132 ) ) ( not ( = ?auto_554129 ?auto_554133 ) ) ( not ( = ?auto_554129 ?auto_554134 ) ) ( not ( = ?auto_554129 ?auto_554135 ) ) ( not ( = ?auto_554129 ?auto_554136 ) ) ( not ( = ?auto_554129 ?auto_554137 ) ) ( not ( = ?auto_554129 ?auto_554138 ) ) ( not ( = ?auto_554130 ?auto_554131 ) ) ( not ( = ?auto_554130 ?auto_554132 ) ) ( not ( = ?auto_554130 ?auto_554133 ) ) ( not ( = ?auto_554130 ?auto_554134 ) ) ( not ( = ?auto_554130 ?auto_554135 ) ) ( not ( = ?auto_554130 ?auto_554136 ) ) ( not ( = ?auto_554130 ?auto_554137 ) ) ( not ( = ?auto_554130 ?auto_554138 ) ) ( not ( = ?auto_554131 ?auto_554132 ) ) ( not ( = ?auto_554131 ?auto_554133 ) ) ( not ( = ?auto_554131 ?auto_554134 ) ) ( not ( = ?auto_554131 ?auto_554135 ) ) ( not ( = ?auto_554131 ?auto_554136 ) ) ( not ( = ?auto_554131 ?auto_554137 ) ) ( not ( = ?auto_554131 ?auto_554138 ) ) ( not ( = ?auto_554132 ?auto_554133 ) ) ( not ( = ?auto_554132 ?auto_554134 ) ) ( not ( = ?auto_554132 ?auto_554135 ) ) ( not ( = ?auto_554132 ?auto_554136 ) ) ( not ( = ?auto_554132 ?auto_554137 ) ) ( not ( = ?auto_554132 ?auto_554138 ) ) ( not ( = ?auto_554133 ?auto_554134 ) ) ( not ( = ?auto_554133 ?auto_554135 ) ) ( not ( = ?auto_554133 ?auto_554136 ) ) ( not ( = ?auto_554133 ?auto_554137 ) ) ( not ( = ?auto_554133 ?auto_554138 ) ) ( not ( = ?auto_554134 ?auto_554135 ) ) ( not ( = ?auto_554134 ?auto_554136 ) ) ( not ( = ?auto_554134 ?auto_554137 ) ) ( not ( = ?auto_554134 ?auto_554138 ) ) ( not ( = ?auto_554135 ?auto_554136 ) ) ( not ( = ?auto_554135 ?auto_554137 ) ) ( not ( = ?auto_554135 ?auto_554138 ) ) ( not ( = ?auto_554136 ?auto_554137 ) ) ( not ( = ?auto_554136 ?auto_554138 ) ) ( not ( = ?auto_554137 ?auto_554138 ) ) ( ON ?auto_554136 ?auto_554137 ) ( ON ?auto_554135 ?auto_554136 ) ( CLEAR ?auto_554133 ) ( ON ?auto_554134 ?auto_554135 ) ( CLEAR ?auto_554134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_554128 ?auto_554129 ?auto_554130 ?auto_554131 ?auto_554132 ?auto_554133 ?auto_554134 )
      ( MAKE-10PILE ?auto_554128 ?auto_554129 ?auto_554130 ?auto_554131 ?auto_554132 ?auto_554133 ?auto_554134 ?auto_554135 ?auto_554136 ?auto_554137 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554170 - BLOCK
      ?auto_554171 - BLOCK
      ?auto_554172 - BLOCK
      ?auto_554173 - BLOCK
      ?auto_554174 - BLOCK
      ?auto_554175 - BLOCK
      ?auto_554176 - BLOCK
      ?auto_554177 - BLOCK
      ?auto_554178 - BLOCK
      ?auto_554179 - BLOCK
    )
    :vars
    (
      ?auto_554180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554179 ?auto_554180 ) ( ON-TABLE ?auto_554170 ) ( ON ?auto_554171 ?auto_554170 ) ( ON ?auto_554172 ?auto_554171 ) ( ON ?auto_554173 ?auto_554172 ) ( ON ?auto_554174 ?auto_554173 ) ( not ( = ?auto_554170 ?auto_554171 ) ) ( not ( = ?auto_554170 ?auto_554172 ) ) ( not ( = ?auto_554170 ?auto_554173 ) ) ( not ( = ?auto_554170 ?auto_554174 ) ) ( not ( = ?auto_554170 ?auto_554175 ) ) ( not ( = ?auto_554170 ?auto_554176 ) ) ( not ( = ?auto_554170 ?auto_554177 ) ) ( not ( = ?auto_554170 ?auto_554178 ) ) ( not ( = ?auto_554170 ?auto_554179 ) ) ( not ( = ?auto_554170 ?auto_554180 ) ) ( not ( = ?auto_554171 ?auto_554172 ) ) ( not ( = ?auto_554171 ?auto_554173 ) ) ( not ( = ?auto_554171 ?auto_554174 ) ) ( not ( = ?auto_554171 ?auto_554175 ) ) ( not ( = ?auto_554171 ?auto_554176 ) ) ( not ( = ?auto_554171 ?auto_554177 ) ) ( not ( = ?auto_554171 ?auto_554178 ) ) ( not ( = ?auto_554171 ?auto_554179 ) ) ( not ( = ?auto_554171 ?auto_554180 ) ) ( not ( = ?auto_554172 ?auto_554173 ) ) ( not ( = ?auto_554172 ?auto_554174 ) ) ( not ( = ?auto_554172 ?auto_554175 ) ) ( not ( = ?auto_554172 ?auto_554176 ) ) ( not ( = ?auto_554172 ?auto_554177 ) ) ( not ( = ?auto_554172 ?auto_554178 ) ) ( not ( = ?auto_554172 ?auto_554179 ) ) ( not ( = ?auto_554172 ?auto_554180 ) ) ( not ( = ?auto_554173 ?auto_554174 ) ) ( not ( = ?auto_554173 ?auto_554175 ) ) ( not ( = ?auto_554173 ?auto_554176 ) ) ( not ( = ?auto_554173 ?auto_554177 ) ) ( not ( = ?auto_554173 ?auto_554178 ) ) ( not ( = ?auto_554173 ?auto_554179 ) ) ( not ( = ?auto_554173 ?auto_554180 ) ) ( not ( = ?auto_554174 ?auto_554175 ) ) ( not ( = ?auto_554174 ?auto_554176 ) ) ( not ( = ?auto_554174 ?auto_554177 ) ) ( not ( = ?auto_554174 ?auto_554178 ) ) ( not ( = ?auto_554174 ?auto_554179 ) ) ( not ( = ?auto_554174 ?auto_554180 ) ) ( not ( = ?auto_554175 ?auto_554176 ) ) ( not ( = ?auto_554175 ?auto_554177 ) ) ( not ( = ?auto_554175 ?auto_554178 ) ) ( not ( = ?auto_554175 ?auto_554179 ) ) ( not ( = ?auto_554175 ?auto_554180 ) ) ( not ( = ?auto_554176 ?auto_554177 ) ) ( not ( = ?auto_554176 ?auto_554178 ) ) ( not ( = ?auto_554176 ?auto_554179 ) ) ( not ( = ?auto_554176 ?auto_554180 ) ) ( not ( = ?auto_554177 ?auto_554178 ) ) ( not ( = ?auto_554177 ?auto_554179 ) ) ( not ( = ?auto_554177 ?auto_554180 ) ) ( not ( = ?auto_554178 ?auto_554179 ) ) ( not ( = ?auto_554178 ?auto_554180 ) ) ( not ( = ?auto_554179 ?auto_554180 ) ) ( ON ?auto_554178 ?auto_554179 ) ( ON ?auto_554177 ?auto_554178 ) ( ON ?auto_554176 ?auto_554177 ) ( CLEAR ?auto_554174 ) ( ON ?auto_554175 ?auto_554176 ) ( CLEAR ?auto_554175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_554170 ?auto_554171 ?auto_554172 ?auto_554173 ?auto_554174 ?auto_554175 )
      ( MAKE-10PILE ?auto_554170 ?auto_554171 ?auto_554172 ?auto_554173 ?auto_554174 ?auto_554175 ?auto_554176 ?auto_554177 ?auto_554178 ?auto_554179 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554212 - BLOCK
      ?auto_554213 - BLOCK
      ?auto_554214 - BLOCK
      ?auto_554215 - BLOCK
      ?auto_554216 - BLOCK
      ?auto_554217 - BLOCK
      ?auto_554218 - BLOCK
      ?auto_554219 - BLOCK
      ?auto_554220 - BLOCK
      ?auto_554221 - BLOCK
    )
    :vars
    (
      ?auto_554222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554221 ?auto_554222 ) ( ON-TABLE ?auto_554212 ) ( ON ?auto_554213 ?auto_554212 ) ( ON ?auto_554214 ?auto_554213 ) ( ON ?auto_554215 ?auto_554214 ) ( not ( = ?auto_554212 ?auto_554213 ) ) ( not ( = ?auto_554212 ?auto_554214 ) ) ( not ( = ?auto_554212 ?auto_554215 ) ) ( not ( = ?auto_554212 ?auto_554216 ) ) ( not ( = ?auto_554212 ?auto_554217 ) ) ( not ( = ?auto_554212 ?auto_554218 ) ) ( not ( = ?auto_554212 ?auto_554219 ) ) ( not ( = ?auto_554212 ?auto_554220 ) ) ( not ( = ?auto_554212 ?auto_554221 ) ) ( not ( = ?auto_554212 ?auto_554222 ) ) ( not ( = ?auto_554213 ?auto_554214 ) ) ( not ( = ?auto_554213 ?auto_554215 ) ) ( not ( = ?auto_554213 ?auto_554216 ) ) ( not ( = ?auto_554213 ?auto_554217 ) ) ( not ( = ?auto_554213 ?auto_554218 ) ) ( not ( = ?auto_554213 ?auto_554219 ) ) ( not ( = ?auto_554213 ?auto_554220 ) ) ( not ( = ?auto_554213 ?auto_554221 ) ) ( not ( = ?auto_554213 ?auto_554222 ) ) ( not ( = ?auto_554214 ?auto_554215 ) ) ( not ( = ?auto_554214 ?auto_554216 ) ) ( not ( = ?auto_554214 ?auto_554217 ) ) ( not ( = ?auto_554214 ?auto_554218 ) ) ( not ( = ?auto_554214 ?auto_554219 ) ) ( not ( = ?auto_554214 ?auto_554220 ) ) ( not ( = ?auto_554214 ?auto_554221 ) ) ( not ( = ?auto_554214 ?auto_554222 ) ) ( not ( = ?auto_554215 ?auto_554216 ) ) ( not ( = ?auto_554215 ?auto_554217 ) ) ( not ( = ?auto_554215 ?auto_554218 ) ) ( not ( = ?auto_554215 ?auto_554219 ) ) ( not ( = ?auto_554215 ?auto_554220 ) ) ( not ( = ?auto_554215 ?auto_554221 ) ) ( not ( = ?auto_554215 ?auto_554222 ) ) ( not ( = ?auto_554216 ?auto_554217 ) ) ( not ( = ?auto_554216 ?auto_554218 ) ) ( not ( = ?auto_554216 ?auto_554219 ) ) ( not ( = ?auto_554216 ?auto_554220 ) ) ( not ( = ?auto_554216 ?auto_554221 ) ) ( not ( = ?auto_554216 ?auto_554222 ) ) ( not ( = ?auto_554217 ?auto_554218 ) ) ( not ( = ?auto_554217 ?auto_554219 ) ) ( not ( = ?auto_554217 ?auto_554220 ) ) ( not ( = ?auto_554217 ?auto_554221 ) ) ( not ( = ?auto_554217 ?auto_554222 ) ) ( not ( = ?auto_554218 ?auto_554219 ) ) ( not ( = ?auto_554218 ?auto_554220 ) ) ( not ( = ?auto_554218 ?auto_554221 ) ) ( not ( = ?auto_554218 ?auto_554222 ) ) ( not ( = ?auto_554219 ?auto_554220 ) ) ( not ( = ?auto_554219 ?auto_554221 ) ) ( not ( = ?auto_554219 ?auto_554222 ) ) ( not ( = ?auto_554220 ?auto_554221 ) ) ( not ( = ?auto_554220 ?auto_554222 ) ) ( not ( = ?auto_554221 ?auto_554222 ) ) ( ON ?auto_554220 ?auto_554221 ) ( ON ?auto_554219 ?auto_554220 ) ( ON ?auto_554218 ?auto_554219 ) ( ON ?auto_554217 ?auto_554218 ) ( CLEAR ?auto_554215 ) ( ON ?auto_554216 ?auto_554217 ) ( CLEAR ?auto_554216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_554212 ?auto_554213 ?auto_554214 ?auto_554215 ?auto_554216 )
      ( MAKE-10PILE ?auto_554212 ?auto_554213 ?auto_554214 ?auto_554215 ?auto_554216 ?auto_554217 ?auto_554218 ?auto_554219 ?auto_554220 ?auto_554221 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554254 - BLOCK
      ?auto_554255 - BLOCK
      ?auto_554256 - BLOCK
      ?auto_554257 - BLOCK
      ?auto_554258 - BLOCK
      ?auto_554259 - BLOCK
      ?auto_554260 - BLOCK
      ?auto_554261 - BLOCK
      ?auto_554262 - BLOCK
      ?auto_554263 - BLOCK
    )
    :vars
    (
      ?auto_554264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554263 ?auto_554264 ) ( ON-TABLE ?auto_554254 ) ( ON ?auto_554255 ?auto_554254 ) ( ON ?auto_554256 ?auto_554255 ) ( not ( = ?auto_554254 ?auto_554255 ) ) ( not ( = ?auto_554254 ?auto_554256 ) ) ( not ( = ?auto_554254 ?auto_554257 ) ) ( not ( = ?auto_554254 ?auto_554258 ) ) ( not ( = ?auto_554254 ?auto_554259 ) ) ( not ( = ?auto_554254 ?auto_554260 ) ) ( not ( = ?auto_554254 ?auto_554261 ) ) ( not ( = ?auto_554254 ?auto_554262 ) ) ( not ( = ?auto_554254 ?auto_554263 ) ) ( not ( = ?auto_554254 ?auto_554264 ) ) ( not ( = ?auto_554255 ?auto_554256 ) ) ( not ( = ?auto_554255 ?auto_554257 ) ) ( not ( = ?auto_554255 ?auto_554258 ) ) ( not ( = ?auto_554255 ?auto_554259 ) ) ( not ( = ?auto_554255 ?auto_554260 ) ) ( not ( = ?auto_554255 ?auto_554261 ) ) ( not ( = ?auto_554255 ?auto_554262 ) ) ( not ( = ?auto_554255 ?auto_554263 ) ) ( not ( = ?auto_554255 ?auto_554264 ) ) ( not ( = ?auto_554256 ?auto_554257 ) ) ( not ( = ?auto_554256 ?auto_554258 ) ) ( not ( = ?auto_554256 ?auto_554259 ) ) ( not ( = ?auto_554256 ?auto_554260 ) ) ( not ( = ?auto_554256 ?auto_554261 ) ) ( not ( = ?auto_554256 ?auto_554262 ) ) ( not ( = ?auto_554256 ?auto_554263 ) ) ( not ( = ?auto_554256 ?auto_554264 ) ) ( not ( = ?auto_554257 ?auto_554258 ) ) ( not ( = ?auto_554257 ?auto_554259 ) ) ( not ( = ?auto_554257 ?auto_554260 ) ) ( not ( = ?auto_554257 ?auto_554261 ) ) ( not ( = ?auto_554257 ?auto_554262 ) ) ( not ( = ?auto_554257 ?auto_554263 ) ) ( not ( = ?auto_554257 ?auto_554264 ) ) ( not ( = ?auto_554258 ?auto_554259 ) ) ( not ( = ?auto_554258 ?auto_554260 ) ) ( not ( = ?auto_554258 ?auto_554261 ) ) ( not ( = ?auto_554258 ?auto_554262 ) ) ( not ( = ?auto_554258 ?auto_554263 ) ) ( not ( = ?auto_554258 ?auto_554264 ) ) ( not ( = ?auto_554259 ?auto_554260 ) ) ( not ( = ?auto_554259 ?auto_554261 ) ) ( not ( = ?auto_554259 ?auto_554262 ) ) ( not ( = ?auto_554259 ?auto_554263 ) ) ( not ( = ?auto_554259 ?auto_554264 ) ) ( not ( = ?auto_554260 ?auto_554261 ) ) ( not ( = ?auto_554260 ?auto_554262 ) ) ( not ( = ?auto_554260 ?auto_554263 ) ) ( not ( = ?auto_554260 ?auto_554264 ) ) ( not ( = ?auto_554261 ?auto_554262 ) ) ( not ( = ?auto_554261 ?auto_554263 ) ) ( not ( = ?auto_554261 ?auto_554264 ) ) ( not ( = ?auto_554262 ?auto_554263 ) ) ( not ( = ?auto_554262 ?auto_554264 ) ) ( not ( = ?auto_554263 ?auto_554264 ) ) ( ON ?auto_554262 ?auto_554263 ) ( ON ?auto_554261 ?auto_554262 ) ( ON ?auto_554260 ?auto_554261 ) ( ON ?auto_554259 ?auto_554260 ) ( ON ?auto_554258 ?auto_554259 ) ( CLEAR ?auto_554256 ) ( ON ?auto_554257 ?auto_554258 ) ( CLEAR ?auto_554257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_554254 ?auto_554255 ?auto_554256 ?auto_554257 )
      ( MAKE-10PILE ?auto_554254 ?auto_554255 ?auto_554256 ?auto_554257 ?auto_554258 ?auto_554259 ?auto_554260 ?auto_554261 ?auto_554262 ?auto_554263 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554296 - BLOCK
      ?auto_554297 - BLOCK
      ?auto_554298 - BLOCK
      ?auto_554299 - BLOCK
      ?auto_554300 - BLOCK
      ?auto_554301 - BLOCK
      ?auto_554302 - BLOCK
      ?auto_554303 - BLOCK
      ?auto_554304 - BLOCK
      ?auto_554305 - BLOCK
    )
    :vars
    (
      ?auto_554306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554305 ?auto_554306 ) ( ON-TABLE ?auto_554296 ) ( ON ?auto_554297 ?auto_554296 ) ( not ( = ?auto_554296 ?auto_554297 ) ) ( not ( = ?auto_554296 ?auto_554298 ) ) ( not ( = ?auto_554296 ?auto_554299 ) ) ( not ( = ?auto_554296 ?auto_554300 ) ) ( not ( = ?auto_554296 ?auto_554301 ) ) ( not ( = ?auto_554296 ?auto_554302 ) ) ( not ( = ?auto_554296 ?auto_554303 ) ) ( not ( = ?auto_554296 ?auto_554304 ) ) ( not ( = ?auto_554296 ?auto_554305 ) ) ( not ( = ?auto_554296 ?auto_554306 ) ) ( not ( = ?auto_554297 ?auto_554298 ) ) ( not ( = ?auto_554297 ?auto_554299 ) ) ( not ( = ?auto_554297 ?auto_554300 ) ) ( not ( = ?auto_554297 ?auto_554301 ) ) ( not ( = ?auto_554297 ?auto_554302 ) ) ( not ( = ?auto_554297 ?auto_554303 ) ) ( not ( = ?auto_554297 ?auto_554304 ) ) ( not ( = ?auto_554297 ?auto_554305 ) ) ( not ( = ?auto_554297 ?auto_554306 ) ) ( not ( = ?auto_554298 ?auto_554299 ) ) ( not ( = ?auto_554298 ?auto_554300 ) ) ( not ( = ?auto_554298 ?auto_554301 ) ) ( not ( = ?auto_554298 ?auto_554302 ) ) ( not ( = ?auto_554298 ?auto_554303 ) ) ( not ( = ?auto_554298 ?auto_554304 ) ) ( not ( = ?auto_554298 ?auto_554305 ) ) ( not ( = ?auto_554298 ?auto_554306 ) ) ( not ( = ?auto_554299 ?auto_554300 ) ) ( not ( = ?auto_554299 ?auto_554301 ) ) ( not ( = ?auto_554299 ?auto_554302 ) ) ( not ( = ?auto_554299 ?auto_554303 ) ) ( not ( = ?auto_554299 ?auto_554304 ) ) ( not ( = ?auto_554299 ?auto_554305 ) ) ( not ( = ?auto_554299 ?auto_554306 ) ) ( not ( = ?auto_554300 ?auto_554301 ) ) ( not ( = ?auto_554300 ?auto_554302 ) ) ( not ( = ?auto_554300 ?auto_554303 ) ) ( not ( = ?auto_554300 ?auto_554304 ) ) ( not ( = ?auto_554300 ?auto_554305 ) ) ( not ( = ?auto_554300 ?auto_554306 ) ) ( not ( = ?auto_554301 ?auto_554302 ) ) ( not ( = ?auto_554301 ?auto_554303 ) ) ( not ( = ?auto_554301 ?auto_554304 ) ) ( not ( = ?auto_554301 ?auto_554305 ) ) ( not ( = ?auto_554301 ?auto_554306 ) ) ( not ( = ?auto_554302 ?auto_554303 ) ) ( not ( = ?auto_554302 ?auto_554304 ) ) ( not ( = ?auto_554302 ?auto_554305 ) ) ( not ( = ?auto_554302 ?auto_554306 ) ) ( not ( = ?auto_554303 ?auto_554304 ) ) ( not ( = ?auto_554303 ?auto_554305 ) ) ( not ( = ?auto_554303 ?auto_554306 ) ) ( not ( = ?auto_554304 ?auto_554305 ) ) ( not ( = ?auto_554304 ?auto_554306 ) ) ( not ( = ?auto_554305 ?auto_554306 ) ) ( ON ?auto_554304 ?auto_554305 ) ( ON ?auto_554303 ?auto_554304 ) ( ON ?auto_554302 ?auto_554303 ) ( ON ?auto_554301 ?auto_554302 ) ( ON ?auto_554300 ?auto_554301 ) ( ON ?auto_554299 ?auto_554300 ) ( CLEAR ?auto_554297 ) ( ON ?auto_554298 ?auto_554299 ) ( CLEAR ?auto_554298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_554296 ?auto_554297 ?auto_554298 )
      ( MAKE-10PILE ?auto_554296 ?auto_554297 ?auto_554298 ?auto_554299 ?auto_554300 ?auto_554301 ?auto_554302 ?auto_554303 ?auto_554304 ?auto_554305 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554338 - BLOCK
      ?auto_554339 - BLOCK
      ?auto_554340 - BLOCK
      ?auto_554341 - BLOCK
      ?auto_554342 - BLOCK
      ?auto_554343 - BLOCK
      ?auto_554344 - BLOCK
      ?auto_554345 - BLOCK
      ?auto_554346 - BLOCK
      ?auto_554347 - BLOCK
    )
    :vars
    (
      ?auto_554348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554347 ?auto_554348 ) ( ON-TABLE ?auto_554338 ) ( not ( = ?auto_554338 ?auto_554339 ) ) ( not ( = ?auto_554338 ?auto_554340 ) ) ( not ( = ?auto_554338 ?auto_554341 ) ) ( not ( = ?auto_554338 ?auto_554342 ) ) ( not ( = ?auto_554338 ?auto_554343 ) ) ( not ( = ?auto_554338 ?auto_554344 ) ) ( not ( = ?auto_554338 ?auto_554345 ) ) ( not ( = ?auto_554338 ?auto_554346 ) ) ( not ( = ?auto_554338 ?auto_554347 ) ) ( not ( = ?auto_554338 ?auto_554348 ) ) ( not ( = ?auto_554339 ?auto_554340 ) ) ( not ( = ?auto_554339 ?auto_554341 ) ) ( not ( = ?auto_554339 ?auto_554342 ) ) ( not ( = ?auto_554339 ?auto_554343 ) ) ( not ( = ?auto_554339 ?auto_554344 ) ) ( not ( = ?auto_554339 ?auto_554345 ) ) ( not ( = ?auto_554339 ?auto_554346 ) ) ( not ( = ?auto_554339 ?auto_554347 ) ) ( not ( = ?auto_554339 ?auto_554348 ) ) ( not ( = ?auto_554340 ?auto_554341 ) ) ( not ( = ?auto_554340 ?auto_554342 ) ) ( not ( = ?auto_554340 ?auto_554343 ) ) ( not ( = ?auto_554340 ?auto_554344 ) ) ( not ( = ?auto_554340 ?auto_554345 ) ) ( not ( = ?auto_554340 ?auto_554346 ) ) ( not ( = ?auto_554340 ?auto_554347 ) ) ( not ( = ?auto_554340 ?auto_554348 ) ) ( not ( = ?auto_554341 ?auto_554342 ) ) ( not ( = ?auto_554341 ?auto_554343 ) ) ( not ( = ?auto_554341 ?auto_554344 ) ) ( not ( = ?auto_554341 ?auto_554345 ) ) ( not ( = ?auto_554341 ?auto_554346 ) ) ( not ( = ?auto_554341 ?auto_554347 ) ) ( not ( = ?auto_554341 ?auto_554348 ) ) ( not ( = ?auto_554342 ?auto_554343 ) ) ( not ( = ?auto_554342 ?auto_554344 ) ) ( not ( = ?auto_554342 ?auto_554345 ) ) ( not ( = ?auto_554342 ?auto_554346 ) ) ( not ( = ?auto_554342 ?auto_554347 ) ) ( not ( = ?auto_554342 ?auto_554348 ) ) ( not ( = ?auto_554343 ?auto_554344 ) ) ( not ( = ?auto_554343 ?auto_554345 ) ) ( not ( = ?auto_554343 ?auto_554346 ) ) ( not ( = ?auto_554343 ?auto_554347 ) ) ( not ( = ?auto_554343 ?auto_554348 ) ) ( not ( = ?auto_554344 ?auto_554345 ) ) ( not ( = ?auto_554344 ?auto_554346 ) ) ( not ( = ?auto_554344 ?auto_554347 ) ) ( not ( = ?auto_554344 ?auto_554348 ) ) ( not ( = ?auto_554345 ?auto_554346 ) ) ( not ( = ?auto_554345 ?auto_554347 ) ) ( not ( = ?auto_554345 ?auto_554348 ) ) ( not ( = ?auto_554346 ?auto_554347 ) ) ( not ( = ?auto_554346 ?auto_554348 ) ) ( not ( = ?auto_554347 ?auto_554348 ) ) ( ON ?auto_554346 ?auto_554347 ) ( ON ?auto_554345 ?auto_554346 ) ( ON ?auto_554344 ?auto_554345 ) ( ON ?auto_554343 ?auto_554344 ) ( ON ?auto_554342 ?auto_554343 ) ( ON ?auto_554341 ?auto_554342 ) ( ON ?auto_554340 ?auto_554341 ) ( CLEAR ?auto_554338 ) ( ON ?auto_554339 ?auto_554340 ) ( CLEAR ?auto_554339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_554338 ?auto_554339 )
      ( MAKE-10PILE ?auto_554338 ?auto_554339 ?auto_554340 ?auto_554341 ?auto_554342 ?auto_554343 ?auto_554344 ?auto_554345 ?auto_554346 ?auto_554347 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_554380 - BLOCK
      ?auto_554381 - BLOCK
      ?auto_554382 - BLOCK
      ?auto_554383 - BLOCK
      ?auto_554384 - BLOCK
      ?auto_554385 - BLOCK
      ?auto_554386 - BLOCK
      ?auto_554387 - BLOCK
      ?auto_554388 - BLOCK
      ?auto_554389 - BLOCK
    )
    :vars
    (
      ?auto_554390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554389 ?auto_554390 ) ( not ( = ?auto_554380 ?auto_554381 ) ) ( not ( = ?auto_554380 ?auto_554382 ) ) ( not ( = ?auto_554380 ?auto_554383 ) ) ( not ( = ?auto_554380 ?auto_554384 ) ) ( not ( = ?auto_554380 ?auto_554385 ) ) ( not ( = ?auto_554380 ?auto_554386 ) ) ( not ( = ?auto_554380 ?auto_554387 ) ) ( not ( = ?auto_554380 ?auto_554388 ) ) ( not ( = ?auto_554380 ?auto_554389 ) ) ( not ( = ?auto_554380 ?auto_554390 ) ) ( not ( = ?auto_554381 ?auto_554382 ) ) ( not ( = ?auto_554381 ?auto_554383 ) ) ( not ( = ?auto_554381 ?auto_554384 ) ) ( not ( = ?auto_554381 ?auto_554385 ) ) ( not ( = ?auto_554381 ?auto_554386 ) ) ( not ( = ?auto_554381 ?auto_554387 ) ) ( not ( = ?auto_554381 ?auto_554388 ) ) ( not ( = ?auto_554381 ?auto_554389 ) ) ( not ( = ?auto_554381 ?auto_554390 ) ) ( not ( = ?auto_554382 ?auto_554383 ) ) ( not ( = ?auto_554382 ?auto_554384 ) ) ( not ( = ?auto_554382 ?auto_554385 ) ) ( not ( = ?auto_554382 ?auto_554386 ) ) ( not ( = ?auto_554382 ?auto_554387 ) ) ( not ( = ?auto_554382 ?auto_554388 ) ) ( not ( = ?auto_554382 ?auto_554389 ) ) ( not ( = ?auto_554382 ?auto_554390 ) ) ( not ( = ?auto_554383 ?auto_554384 ) ) ( not ( = ?auto_554383 ?auto_554385 ) ) ( not ( = ?auto_554383 ?auto_554386 ) ) ( not ( = ?auto_554383 ?auto_554387 ) ) ( not ( = ?auto_554383 ?auto_554388 ) ) ( not ( = ?auto_554383 ?auto_554389 ) ) ( not ( = ?auto_554383 ?auto_554390 ) ) ( not ( = ?auto_554384 ?auto_554385 ) ) ( not ( = ?auto_554384 ?auto_554386 ) ) ( not ( = ?auto_554384 ?auto_554387 ) ) ( not ( = ?auto_554384 ?auto_554388 ) ) ( not ( = ?auto_554384 ?auto_554389 ) ) ( not ( = ?auto_554384 ?auto_554390 ) ) ( not ( = ?auto_554385 ?auto_554386 ) ) ( not ( = ?auto_554385 ?auto_554387 ) ) ( not ( = ?auto_554385 ?auto_554388 ) ) ( not ( = ?auto_554385 ?auto_554389 ) ) ( not ( = ?auto_554385 ?auto_554390 ) ) ( not ( = ?auto_554386 ?auto_554387 ) ) ( not ( = ?auto_554386 ?auto_554388 ) ) ( not ( = ?auto_554386 ?auto_554389 ) ) ( not ( = ?auto_554386 ?auto_554390 ) ) ( not ( = ?auto_554387 ?auto_554388 ) ) ( not ( = ?auto_554387 ?auto_554389 ) ) ( not ( = ?auto_554387 ?auto_554390 ) ) ( not ( = ?auto_554388 ?auto_554389 ) ) ( not ( = ?auto_554388 ?auto_554390 ) ) ( not ( = ?auto_554389 ?auto_554390 ) ) ( ON ?auto_554388 ?auto_554389 ) ( ON ?auto_554387 ?auto_554388 ) ( ON ?auto_554386 ?auto_554387 ) ( ON ?auto_554385 ?auto_554386 ) ( ON ?auto_554384 ?auto_554385 ) ( ON ?auto_554383 ?auto_554384 ) ( ON ?auto_554382 ?auto_554383 ) ( ON ?auto_554381 ?auto_554382 ) ( ON ?auto_554380 ?auto_554381 ) ( CLEAR ?auto_554380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_554380 )
      ( MAKE-10PILE ?auto_554380 ?auto_554381 ?auto_554382 ?auto_554383 ?auto_554384 ?auto_554385 ?auto_554386 ?auto_554387 ?auto_554388 ?auto_554389 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554423 - BLOCK
      ?auto_554424 - BLOCK
      ?auto_554425 - BLOCK
      ?auto_554426 - BLOCK
      ?auto_554427 - BLOCK
      ?auto_554428 - BLOCK
      ?auto_554429 - BLOCK
      ?auto_554430 - BLOCK
      ?auto_554431 - BLOCK
      ?auto_554432 - BLOCK
      ?auto_554433 - BLOCK
    )
    :vars
    (
      ?auto_554434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_554432 ) ( ON ?auto_554433 ?auto_554434 ) ( CLEAR ?auto_554433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_554423 ) ( ON ?auto_554424 ?auto_554423 ) ( ON ?auto_554425 ?auto_554424 ) ( ON ?auto_554426 ?auto_554425 ) ( ON ?auto_554427 ?auto_554426 ) ( ON ?auto_554428 ?auto_554427 ) ( ON ?auto_554429 ?auto_554428 ) ( ON ?auto_554430 ?auto_554429 ) ( ON ?auto_554431 ?auto_554430 ) ( ON ?auto_554432 ?auto_554431 ) ( not ( = ?auto_554423 ?auto_554424 ) ) ( not ( = ?auto_554423 ?auto_554425 ) ) ( not ( = ?auto_554423 ?auto_554426 ) ) ( not ( = ?auto_554423 ?auto_554427 ) ) ( not ( = ?auto_554423 ?auto_554428 ) ) ( not ( = ?auto_554423 ?auto_554429 ) ) ( not ( = ?auto_554423 ?auto_554430 ) ) ( not ( = ?auto_554423 ?auto_554431 ) ) ( not ( = ?auto_554423 ?auto_554432 ) ) ( not ( = ?auto_554423 ?auto_554433 ) ) ( not ( = ?auto_554423 ?auto_554434 ) ) ( not ( = ?auto_554424 ?auto_554425 ) ) ( not ( = ?auto_554424 ?auto_554426 ) ) ( not ( = ?auto_554424 ?auto_554427 ) ) ( not ( = ?auto_554424 ?auto_554428 ) ) ( not ( = ?auto_554424 ?auto_554429 ) ) ( not ( = ?auto_554424 ?auto_554430 ) ) ( not ( = ?auto_554424 ?auto_554431 ) ) ( not ( = ?auto_554424 ?auto_554432 ) ) ( not ( = ?auto_554424 ?auto_554433 ) ) ( not ( = ?auto_554424 ?auto_554434 ) ) ( not ( = ?auto_554425 ?auto_554426 ) ) ( not ( = ?auto_554425 ?auto_554427 ) ) ( not ( = ?auto_554425 ?auto_554428 ) ) ( not ( = ?auto_554425 ?auto_554429 ) ) ( not ( = ?auto_554425 ?auto_554430 ) ) ( not ( = ?auto_554425 ?auto_554431 ) ) ( not ( = ?auto_554425 ?auto_554432 ) ) ( not ( = ?auto_554425 ?auto_554433 ) ) ( not ( = ?auto_554425 ?auto_554434 ) ) ( not ( = ?auto_554426 ?auto_554427 ) ) ( not ( = ?auto_554426 ?auto_554428 ) ) ( not ( = ?auto_554426 ?auto_554429 ) ) ( not ( = ?auto_554426 ?auto_554430 ) ) ( not ( = ?auto_554426 ?auto_554431 ) ) ( not ( = ?auto_554426 ?auto_554432 ) ) ( not ( = ?auto_554426 ?auto_554433 ) ) ( not ( = ?auto_554426 ?auto_554434 ) ) ( not ( = ?auto_554427 ?auto_554428 ) ) ( not ( = ?auto_554427 ?auto_554429 ) ) ( not ( = ?auto_554427 ?auto_554430 ) ) ( not ( = ?auto_554427 ?auto_554431 ) ) ( not ( = ?auto_554427 ?auto_554432 ) ) ( not ( = ?auto_554427 ?auto_554433 ) ) ( not ( = ?auto_554427 ?auto_554434 ) ) ( not ( = ?auto_554428 ?auto_554429 ) ) ( not ( = ?auto_554428 ?auto_554430 ) ) ( not ( = ?auto_554428 ?auto_554431 ) ) ( not ( = ?auto_554428 ?auto_554432 ) ) ( not ( = ?auto_554428 ?auto_554433 ) ) ( not ( = ?auto_554428 ?auto_554434 ) ) ( not ( = ?auto_554429 ?auto_554430 ) ) ( not ( = ?auto_554429 ?auto_554431 ) ) ( not ( = ?auto_554429 ?auto_554432 ) ) ( not ( = ?auto_554429 ?auto_554433 ) ) ( not ( = ?auto_554429 ?auto_554434 ) ) ( not ( = ?auto_554430 ?auto_554431 ) ) ( not ( = ?auto_554430 ?auto_554432 ) ) ( not ( = ?auto_554430 ?auto_554433 ) ) ( not ( = ?auto_554430 ?auto_554434 ) ) ( not ( = ?auto_554431 ?auto_554432 ) ) ( not ( = ?auto_554431 ?auto_554433 ) ) ( not ( = ?auto_554431 ?auto_554434 ) ) ( not ( = ?auto_554432 ?auto_554433 ) ) ( not ( = ?auto_554432 ?auto_554434 ) ) ( not ( = ?auto_554433 ?auto_554434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_554433 ?auto_554434 )
      ( !STACK ?auto_554433 ?auto_554432 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554469 - BLOCK
      ?auto_554470 - BLOCK
      ?auto_554471 - BLOCK
      ?auto_554472 - BLOCK
      ?auto_554473 - BLOCK
      ?auto_554474 - BLOCK
      ?auto_554475 - BLOCK
      ?auto_554476 - BLOCK
      ?auto_554477 - BLOCK
      ?auto_554478 - BLOCK
      ?auto_554479 - BLOCK
    )
    :vars
    (
      ?auto_554480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554479 ?auto_554480 ) ( ON-TABLE ?auto_554469 ) ( ON ?auto_554470 ?auto_554469 ) ( ON ?auto_554471 ?auto_554470 ) ( ON ?auto_554472 ?auto_554471 ) ( ON ?auto_554473 ?auto_554472 ) ( ON ?auto_554474 ?auto_554473 ) ( ON ?auto_554475 ?auto_554474 ) ( ON ?auto_554476 ?auto_554475 ) ( ON ?auto_554477 ?auto_554476 ) ( not ( = ?auto_554469 ?auto_554470 ) ) ( not ( = ?auto_554469 ?auto_554471 ) ) ( not ( = ?auto_554469 ?auto_554472 ) ) ( not ( = ?auto_554469 ?auto_554473 ) ) ( not ( = ?auto_554469 ?auto_554474 ) ) ( not ( = ?auto_554469 ?auto_554475 ) ) ( not ( = ?auto_554469 ?auto_554476 ) ) ( not ( = ?auto_554469 ?auto_554477 ) ) ( not ( = ?auto_554469 ?auto_554478 ) ) ( not ( = ?auto_554469 ?auto_554479 ) ) ( not ( = ?auto_554469 ?auto_554480 ) ) ( not ( = ?auto_554470 ?auto_554471 ) ) ( not ( = ?auto_554470 ?auto_554472 ) ) ( not ( = ?auto_554470 ?auto_554473 ) ) ( not ( = ?auto_554470 ?auto_554474 ) ) ( not ( = ?auto_554470 ?auto_554475 ) ) ( not ( = ?auto_554470 ?auto_554476 ) ) ( not ( = ?auto_554470 ?auto_554477 ) ) ( not ( = ?auto_554470 ?auto_554478 ) ) ( not ( = ?auto_554470 ?auto_554479 ) ) ( not ( = ?auto_554470 ?auto_554480 ) ) ( not ( = ?auto_554471 ?auto_554472 ) ) ( not ( = ?auto_554471 ?auto_554473 ) ) ( not ( = ?auto_554471 ?auto_554474 ) ) ( not ( = ?auto_554471 ?auto_554475 ) ) ( not ( = ?auto_554471 ?auto_554476 ) ) ( not ( = ?auto_554471 ?auto_554477 ) ) ( not ( = ?auto_554471 ?auto_554478 ) ) ( not ( = ?auto_554471 ?auto_554479 ) ) ( not ( = ?auto_554471 ?auto_554480 ) ) ( not ( = ?auto_554472 ?auto_554473 ) ) ( not ( = ?auto_554472 ?auto_554474 ) ) ( not ( = ?auto_554472 ?auto_554475 ) ) ( not ( = ?auto_554472 ?auto_554476 ) ) ( not ( = ?auto_554472 ?auto_554477 ) ) ( not ( = ?auto_554472 ?auto_554478 ) ) ( not ( = ?auto_554472 ?auto_554479 ) ) ( not ( = ?auto_554472 ?auto_554480 ) ) ( not ( = ?auto_554473 ?auto_554474 ) ) ( not ( = ?auto_554473 ?auto_554475 ) ) ( not ( = ?auto_554473 ?auto_554476 ) ) ( not ( = ?auto_554473 ?auto_554477 ) ) ( not ( = ?auto_554473 ?auto_554478 ) ) ( not ( = ?auto_554473 ?auto_554479 ) ) ( not ( = ?auto_554473 ?auto_554480 ) ) ( not ( = ?auto_554474 ?auto_554475 ) ) ( not ( = ?auto_554474 ?auto_554476 ) ) ( not ( = ?auto_554474 ?auto_554477 ) ) ( not ( = ?auto_554474 ?auto_554478 ) ) ( not ( = ?auto_554474 ?auto_554479 ) ) ( not ( = ?auto_554474 ?auto_554480 ) ) ( not ( = ?auto_554475 ?auto_554476 ) ) ( not ( = ?auto_554475 ?auto_554477 ) ) ( not ( = ?auto_554475 ?auto_554478 ) ) ( not ( = ?auto_554475 ?auto_554479 ) ) ( not ( = ?auto_554475 ?auto_554480 ) ) ( not ( = ?auto_554476 ?auto_554477 ) ) ( not ( = ?auto_554476 ?auto_554478 ) ) ( not ( = ?auto_554476 ?auto_554479 ) ) ( not ( = ?auto_554476 ?auto_554480 ) ) ( not ( = ?auto_554477 ?auto_554478 ) ) ( not ( = ?auto_554477 ?auto_554479 ) ) ( not ( = ?auto_554477 ?auto_554480 ) ) ( not ( = ?auto_554478 ?auto_554479 ) ) ( not ( = ?auto_554478 ?auto_554480 ) ) ( not ( = ?auto_554479 ?auto_554480 ) ) ( CLEAR ?auto_554477 ) ( ON ?auto_554478 ?auto_554479 ) ( CLEAR ?auto_554478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_554469 ?auto_554470 ?auto_554471 ?auto_554472 ?auto_554473 ?auto_554474 ?auto_554475 ?auto_554476 ?auto_554477 ?auto_554478 )
      ( MAKE-11PILE ?auto_554469 ?auto_554470 ?auto_554471 ?auto_554472 ?auto_554473 ?auto_554474 ?auto_554475 ?auto_554476 ?auto_554477 ?auto_554478 ?auto_554479 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554515 - BLOCK
      ?auto_554516 - BLOCK
      ?auto_554517 - BLOCK
      ?auto_554518 - BLOCK
      ?auto_554519 - BLOCK
      ?auto_554520 - BLOCK
      ?auto_554521 - BLOCK
      ?auto_554522 - BLOCK
      ?auto_554523 - BLOCK
      ?auto_554524 - BLOCK
      ?auto_554525 - BLOCK
    )
    :vars
    (
      ?auto_554526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554525 ?auto_554526 ) ( ON-TABLE ?auto_554515 ) ( ON ?auto_554516 ?auto_554515 ) ( ON ?auto_554517 ?auto_554516 ) ( ON ?auto_554518 ?auto_554517 ) ( ON ?auto_554519 ?auto_554518 ) ( ON ?auto_554520 ?auto_554519 ) ( ON ?auto_554521 ?auto_554520 ) ( ON ?auto_554522 ?auto_554521 ) ( not ( = ?auto_554515 ?auto_554516 ) ) ( not ( = ?auto_554515 ?auto_554517 ) ) ( not ( = ?auto_554515 ?auto_554518 ) ) ( not ( = ?auto_554515 ?auto_554519 ) ) ( not ( = ?auto_554515 ?auto_554520 ) ) ( not ( = ?auto_554515 ?auto_554521 ) ) ( not ( = ?auto_554515 ?auto_554522 ) ) ( not ( = ?auto_554515 ?auto_554523 ) ) ( not ( = ?auto_554515 ?auto_554524 ) ) ( not ( = ?auto_554515 ?auto_554525 ) ) ( not ( = ?auto_554515 ?auto_554526 ) ) ( not ( = ?auto_554516 ?auto_554517 ) ) ( not ( = ?auto_554516 ?auto_554518 ) ) ( not ( = ?auto_554516 ?auto_554519 ) ) ( not ( = ?auto_554516 ?auto_554520 ) ) ( not ( = ?auto_554516 ?auto_554521 ) ) ( not ( = ?auto_554516 ?auto_554522 ) ) ( not ( = ?auto_554516 ?auto_554523 ) ) ( not ( = ?auto_554516 ?auto_554524 ) ) ( not ( = ?auto_554516 ?auto_554525 ) ) ( not ( = ?auto_554516 ?auto_554526 ) ) ( not ( = ?auto_554517 ?auto_554518 ) ) ( not ( = ?auto_554517 ?auto_554519 ) ) ( not ( = ?auto_554517 ?auto_554520 ) ) ( not ( = ?auto_554517 ?auto_554521 ) ) ( not ( = ?auto_554517 ?auto_554522 ) ) ( not ( = ?auto_554517 ?auto_554523 ) ) ( not ( = ?auto_554517 ?auto_554524 ) ) ( not ( = ?auto_554517 ?auto_554525 ) ) ( not ( = ?auto_554517 ?auto_554526 ) ) ( not ( = ?auto_554518 ?auto_554519 ) ) ( not ( = ?auto_554518 ?auto_554520 ) ) ( not ( = ?auto_554518 ?auto_554521 ) ) ( not ( = ?auto_554518 ?auto_554522 ) ) ( not ( = ?auto_554518 ?auto_554523 ) ) ( not ( = ?auto_554518 ?auto_554524 ) ) ( not ( = ?auto_554518 ?auto_554525 ) ) ( not ( = ?auto_554518 ?auto_554526 ) ) ( not ( = ?auto_554519 ?auto_554520 ) ) ( not ( = ?auto_554519 ?auto_554521 ) ) ( not ( = ?auto_554519 ?auto_554522 ) ) ( not ( = ?auto_554519 ?auto_554523 ) ) ( not ( = ?auto_554519 ?auto_554524 ) ) ( not ( = ?auto_554519 ?auto_554525 ) ) ( not ( = ?auto_554519 ?auto_554526 ) ) ( not ( = ?auto_554520 ?auto_554521 ) ) ( not ( = ?auto_554520 ?auto_554522 ) ) ( not ( = ?auto_554520 ?auto_554523 ) ) ( not ( = ?auto_554520 ?auto_554524 ) ) ( not ( = ?auto_554520 ?auto_554525 ) ) ( not ( = ?auto_554520 ?auto_554526 ) ) ( not ( = ?auto_554521 ?auto_554522 ) ) ( not ( = ?auto_554521 ?auto_554523 ) ) ( not ( = ?auto_554521 ?auto_554524 ) ) ( not ( = ?auto_554521 ?auto_554525 ) ) ( not ( = ?auto_554521 ?auto_554526 ) ) ( not ( = ?auto_554522 ?auto_554523 ) ) ( not ( = ?auto_554522 ?auto_554524 ) ) ( not ( = ?auto_554522 ?auto_554525 ) ) ( not ( = ?auto_554522 ?auto_554526 ) ) ( not ( = ?auto_554523 ?auto_554524 ) ) ( not ( = ?auto_554523 ?auto_554525 ) ) ( not ( = ?auto_554523 ?auto_554526 ) ) ( not ( = ?auto_554524 ?auto_554525 ) ) ( not ( = ?auto_554524 ?auto_554526 ) ) ( not ( = ?auto_554525 ?auto_554526 ) ) ( ON ?auto_554524 ?auto_554525 ) ( CLEAR ?auto_554522 ) ( ON ?auto_554523 ?auto_554524 ) ( CLEAR ?auto_554523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_554515 ?auto_554516 ?auto_554517 ?auto_554518 ?auto_554519 ?auto_554520 ?auto_554521 ?auto_554522 ?auto_554523 )
      ( MAKE-11PILE ?auto_554515 ?auto_554516 ?auto_554517 ?auto_554518 ?auto_554519 ?auto_554520 ?auto_554521 ?auto_554522 ?auto_554523 ?auto_554524 ?auto_554525 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554561 - BLOCK
      ?auto_554562 - BLOCK
      ?auto_554563 - BLOCK
      ?auto_554564 - BLOCK
      ?auto_554565 - BLOCK
      ?auto_554566 - BLOCK
      ?auto_554567 - BLOCK
      ?auto_554568 - BLOCK
      ?auto_554569 - BLOCK
      ?auto_554570 - BLOCK
      ?auto_554571 - BLOCK
    )
    :vars
    (
      ?auto_554572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554571 ?auto_554572 ) ( ON-TABLE ?auto_554561 ) ( ON ?auto_554562 ?auto_554561 ) ( ON ?auto_554563 ?auto_554562 ) ( ON ?auto_554564 ?auto_554563 ) ( ON ?auto_554565 ?auto_554564 ) ( ON ?auto_554566 ?auto_554565 ) ( ON ?auto_554567 ?auto_554566 ) ( not ( = ?auto_554561 ?auto_554562 ) ) ( not ( = ?auto_554561 ?auto_554563 ) ) ( not ( = ?auto_554561 ?auto_554564 ) ) ( not ( = ?auto_554561 ?auto_554565 ) ) ( not ( = ?auto_554561 ?auto_554566 ) ) ( not ( = ?auto_554561 ?auto_554567 ) ) ( not ( = ?auto_554561 ?auto_554568 ) ) ( not ( = ?auto_554561 ?auto_554569 ) ) ( not ( = ?auto_554561 ?auto_554570 ) ) ( not ( = ?auto_554561 ?auto_554571 ) ) ( not ( = ?auto_554561 ?auto_554572 ) ) ( not ( = ?auto_554562 ?auto_554563 ) ) ( not ( = ?auto_554562 ?auto_554564 ) ) ( not ( = ?auto_554562 ?auto_554565 ) ) ( not ( = ?auto_554562 ?auto_554566 ) ) ( not ( = ?auto_554562 ?auto_554567 ) ) ( not ( = ?auto_554562 ?auto_554568 ) ) ( not ( = ?auto_554562 ?auto_554569 ) ) ( not ( = ?auto_554562 ?auto_554570 ) ) ( not ( = ?auto_554562 ?auto_554571 ) ) ( not ( = ?auto_554562 ?auto_554572 ) ) ( not ( = ?auto_554563 ?auto_554564 ) ) ( not ( = ?auto_554563 ?auto_554565 ) ) ( not ( = ?auto_554563 ?auto_554566 ) ) ( not ( = ?auto_554563 ?auto_554567 ) ) ( not ( = ?auto_554563 ?auto_554568 ) ) ( not ( = ?auto_554563 ?auto_554569 ) ) ( not ( = ?auto_554563 ?auto_554570 ) ) ( not ( = ?auto_554563 ?auto_554571 ) ) ( not ( = ?auto_554563 ?auto_554572 ) ) ( not ( = ?auto_554564 ?auto_554565 ) ) ( not ( = ?auto_554564 ?auto_554566 ) ) ( not ( = ?auto_554564 ?auto_554567 ) ) ( not ( = ?auto_554564 ?auto_554568 ) ) ( not ( = ?auto_554564 ?auto_554569 ) ) ( not ( = ?auto_554564 ?auto_554570 ) ) ( not ( = ?auto_554564 ?auto_554571 ) ) ( not ( = ?auto_554564 ?auto_554572 ) ) ( not ( = ?auto_554565 ?auto_554566 ) ) ( not ( = ?auto_554565 ?auto_554567 ) ) ( not ( = ?auto_554565 ?auto_554568 ) ) ( not ( = ?auto_554565 ?auto_554569 ) ) ( not ( = ?auto_554565 ?auto_554570 ) ) ( not ( = ?auto_554565 ?auto_554571 ) ) ( not ( = ?auto_554565 ?auto_554572 ) ) ( not ( = ?auto_554566 ?auto_554567 ) ) ( not ( = ?auto_554566 ?auto_554568 ) ) ( not ( = ?auto_554566 ?auto_554569 ) ) ( not ( = ?auto_554566 ?auto_554570 ) ) ( not ( = ?auto_554566 ?auto_554571 ) ) ( not ( = ?auto_554566 ?auto_554572 ) ) ( not ( = ?auto_554567 ?auto_554568 ) ) ( not ( = ?auto_554567 ?auto_554569 ) ) ( not ( = ?auto_554567 ?auto_554570 ) ) ( not ( = ?auto_554567 ?auto_554571 ) ) ( not ( = ?auto_554567 ?auto_554572 ) ) ( not ( = ?auto_554568 ?auto_554569 ) ) ( not ( = ?auto_554568 ?auto_554570 ) ) ( not ( = ?auto_554568 ?auto_554571 ) ) ( not ( = ?auto_554568 ?auto_554572 ) ) ( not ( = ?auto_554569 ?auto_554570 ) ) ( not ( = ?auto_554569 ?auto_554571 ) ) ( not ( = ?auto_554569 ?auto_554572 ) ) ( not ( = ?auto_554570 ?auto_554571 ) ) ( not ( = ?auto_554570 ?auto_554572 ) ) ( not ( = ?auto_554571 ?auto_554572 ) ) ( ON ?auto_554570 ?auto_554571 ) ( ON ?auto_554569 ?auto_554570 ) ( CLEAR ?auto_554567 ) ( ON ?auto_554568 ?auto_554569 ) ( CLEAR ?auto_554568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_554561 ?auto_554562 ?auto_554563 ?auto_554564 ?auto_554565 ?auto_554566 ?auto_554567 ?auto_554568 )
      ( MAKE-11PILE ?auto_554561 ?auto_554562 ?auto_554563 ?auto_554564 ?auto_554565 ?auto_554566 ?auto_554567 ?auto_554568 ?auto_554569 ?auto_554570 ?auto_554571 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554607 - BLOCK
      ?auto_554608 - BLOCK
      ?auto_554609 - BLOCK
      ?auto_554610 - BLOCK
      ?auto_554611 - BLOCK
      ?auto_554612 - BLOCK
      ?auto_554613 - BLOCK
      ?auto_554614 - BLOCK
      ?auto_554615 - BLOCK
      ?auto_554616 - BLOCK
      ?auto_554617 - BLOCK
    )
    :vars
    (
      ?auto_554618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554617 ?auto_554618 ) ( ON-TABLE ?auto_554607 ) ( ON ?auto_554608 ?auto_554607 ) ( ON ?auto_554609 ?auto_554608 ) ( ON ?auto_554610 ?auto_554609 ) ( ON ?auto_554611 ?auto_554610 ) ( ON ?auto_554612 ?auto_554611 ) ( not ( = ?auto_554607 ?auto_554608 ) ) ( not ( = ?auto_554607 ?auto_554609 ) ) ( not ( = ?auto_554607 ?auto_554610 ) ) ( not ( = ?auto_554607 ?auto_554611 ) ) ( not ( = ?auto_554607 ?auto_554612 ) ) ( not ( = ?auto_554607 ?auto_554613 ) ) ( not ( = ?auto_554607 ?auto_554614 ) ) ( not ( = ?auto_554607 ?auto_554615 ) ) ( not ( = ?auto_554607 ?auto_554616 ) ) ( not ( = ?auto_554607 ?auto_554617 ) ) ( not ( = ?auto_554607 ?auto_554618 ) ) ( not ( = ?auto_554608 ?auto_554609 ) ) ( not ( = ?auto_554608 ?auto_554610 ) ) ( not ( = ?auto_554608 ?auto_554611 ) ) ( not ( = ?auto_554608 ?auto_554612 ) ) ( not ( = ?auto_554608 ?auto_554613 ) ) ( not ( = ?auto_554608 ?auto_554614 ) ) ( not ( = ?auto_554608 ?auto_554615 ) ) ( not ( = ?auto_554608 ?auto_554616 ) ) ( not ( = ?auto_554608 ?auto_554617 ) ) ( not ( = ?auto_554608 ?auto_554618 ) ) ( not ( = ?auto_554609 ?auto_554610 ) ) ( not ( = ?auto_554609 ?auto_554611 ) ) ( not ( = ?auto_554609 ?auto_554612 ) ) ( not ( = ?auto_554609 ?auto_554613 ) ) ( not ( = ?auto_554609 ?auto_554614 ) ) ( not ( = ?auto_554609 ?auto_554615 ) ) ( not ( = ?auto_554609 ?auto_554616 ) ) ( not ( = ?auto_554609 ?auto_554617 ) ) ( not ( = ?auto_554609 ?auto_554618 ) ) ( not ( = ?auto_554610 ?auto_554611 ) ) ( not ( = ?auto_554610 ?auto_554612 ) ) ( not ( = ?auto_554610 ?auto_554613 ) ) ( not ( = ?auto_554610 ?auto_554614 ) ) ( not ( = ?auto_554610 ?auto_554615 ) ) ( not ( = ?auto_554610 ?auto_554616 ) ) ( not ( = ?auto_554610 ?auto_554617 ) ) ( not ( = ?auto_554610 ?auto_554618 ) ) ( not ( = ?auto_554611 ?auto_554612 ) ) ( not ( = ?auto_554611 ?auto_554613 ) ) ( not ( = ?auto_554611 ?auto_554614 ) ) ( not ( = ?auto_554611 ?auto_554615 ) ) ( not ( = ?auto_554611 ?auto_554616 ) ) ( not ( = ?auto_554611 ?auto_554617 ) ) ( not ( = ?auto_554611 ?auto_554618 ) ) ( not ( = ?auto_554612 ?auto_554613 ) ) ( not ( = ?auto_554612 ?auto_554614 ) ) ( not ( = ?auto_554612 ?auto_554615 ) ) ( not ( = ?auto_554612 ?auto_554616 ) ) ( not ( = ?auto_554612 ?auto_554617 ) ) ( not ( = ?auto_554612 ?auto_554618 ) ) ( not ( = ?auto_554613 ?auto_554614 ) ) ( not ( = ?auto_554613 ?auto_554615 ) ) ( not ( = ?auto_554613 ?auto_554616 ) ) ( not ( = ?auto_554613 ?auto_554617 ) ) ( not ( = ?auto_554613 ?auto_554618 ) ) ( not ( = ?auto_554614 ?auto_554615 ) ) ( not ( = ?auto_554614 ?auto_554616 ) ) ( not ( = ?auto_554614 ?auto_554617 ) ) ( not ( = ?auto_554614 ?auto_554618 ) ) ( not ( = ?auto_554615 ?auto_554616 ) ) ( not ( = ?auto_554615 ?auto_554617 ) ) ( not ( = ?auto_554615 ?auto_554618 ) ) ( not ( = ?auto_554616 ?auto_554617 ) ) ( not ( = ?auto_554616 ?auto_554618 ) ) ( not ( = ?auto_554617 ?auto_554618 ) ) ( ON ?auto_554616 ?auto_554617 ) ( ON ?auto_554615 ?auto_554616 ) ( ON ?auto_554614 ?auto_554615 ) ( CLEAR ?auto_554612 ) ( ON ?auto_554613 ?auto_554614 ) ( CLEAR ?auto_554613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_554607 ?auto_554608 ?auto_554609 ?auto_554610 ?auto_554611 ?auto_554612 ?auto_554613 )
      ( MAKE-11PILE ?auto_554607 ?auto_554608 ?auto_554609 ?auto_554610 ?auto_554611 ?auto_554612 ?auto_554613 ?auto_554614 ?auto_554615 ?auto_554616 ?auto_554617 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554653 - BLOCK
      ?auto_554654 - BLOCK
      ?auto_554655 - BLOCK
      ?auto_554656 - BLOCK
      ?auto_554657 - BLOCK
      ?auto_554658 - BLOCK
      ?auto_554659 - BLOCK
      ?auto_554660 - BLOCK
      ?auto_554661 - BLOCK
      ?auto_554662 - BLOCK
      ?auto_554663 - BLOCK
    )
    :vars
    (
      ?auto_554664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554663 ?auto_554664 ) ( ON-TABLE ?auto_554653 ) ( ON ?auto_554654 ?auto_554653 ) ( ON ?auto_554655 ?auto_554654 ) ( ON ?auto_554656 ?auto_554655 ) ( ON ?auto_554657 ?auto_554656 ) ( not ( = ?auto_554653 ?auto_554654 ) ) ( not ( = ?auto_554653 ?auto_554655 ) ) ( not ( = ?auto_554653 ?auto_554656 ) ) ( not ( = ?auto_554653 ?auto_554657 ) ) ( not ( = ?auto_554653 ?auto_554658 ) ) ( not ( = ?auto_554653 ?auto_554659 ) ) ( not ( = ?auto_554653 ?auto_554660 ) ) ( not ( = ?auto_554653 ?auto_554661 ) ) ( not ( = ?auto_554653 ?auto_554662 ) ) ( not ( = ?auto_554653 ?auto_554663 ) ) ( not ( = ?auto_554653 ?auto_554664 ) ) ( not ( = ?auto_554654 ?auto_554655 ) ) ( not ( = ?auto_554654 ?auto_554656 ) ) ( not ( = ?auto_554654 ?auto_554657 ) ) ( not ( = ?auto_554654 ?auto_554658 ) ) ( not ( = ?auto_554654 ?auto_554659 ) ) ( not ( = ?auto_554654 ?auto_554660 ) ) ( not ( = ?auto_554654 ?auto_554661 ) ) ( not ( = ?auto_554654 ?auto_554662 ) ) ( not ( = ?auto_554654 ?auto_554663 ) ) ( not ( = ?auto_554654 ?auto_554664 ) ) ( not ( = ?auto_554655 ?auto_554656 ) ) ( not ( = ?auto_554655 ?auto_554657 ) ) ( not ( = ?auto_554655 ?auto_554658 ) ) ( not ( = ?auto_554655 ?auto_554659 ) ) ( not ( = ?auto_554655 ?auto_554660 ) ) ( not ( = ?auto_554655 ?auto_554661 ) ) ( not ( = ?auto_554655 ?auto_554662 ) ) ( not ( = ?auto_554655 ?auto_554663 ) ) ( not ( = ?auto_554655 ?auto_554664 ) ) ( not ( = ?auto_554656 ?auto_554657 ) ) ( not ( = ?auto_554656 ?auto_554658 ) ) ( not ( = ?auto_554656 ?auto_554659 ) ) ( not ( = ?auto_554656 ?auto_554660 ) ) ( not ( = ?auto_554656 ?auto_554661 ) ) ( not ( = ?auto_554656 ?auto_554662 ) ) ( not ( = ?auto_554656 ?auto_554663 ) ) ( not ( = ?auto_554656 ?auto_554664 ) ) ( not ( = ?auto_554657 ?auto_554658 ) ) ( not ( = ?auto_554657 ?auto_554659 ) ) ( not ( = ?auto_554657 ?auto_554660 ) ) ( not ( = ?auto_554657 ?auto_554661 ) ) ( not ( = ?auto_554657 ?auto_554662 ) ) ( not ( = ?auto_554657 ?auto_554663 ) ) ( not ( = ?auto_554657 ?auto_554664 ) ) ( not ( = ?auto_554658 ?auto_554659 ) ) ( not ( = ?auto_554658 ?auto_554660 ) ) ( not ( = ?auto_554658 ?auto_554661 ) ) ( not ( = ?auto_554658 ?auto_554662 ) ) ( not ( = ?auto_554658 ?auto_554663 ) ) ( not ( = ?auto_554658 ?auto_554664 ) ) ( not ( = ?auto_554659 ?auto_554660 ) ) ( not ( = ?auto_554659 ?auto_554661 ) ) ( not ( = ?auto_554659 ?auto_554662 ) ) ( not ( = ?auto_554659 ?auto_554663 ) ) ( not ( = ?auto_554659 ?auto_554664 ) ) ( not ( = ?auto_554660 ?auto_554661 ) ) ( not ( = ?auto_554660 ?auto_554662 ) ) ( not ( = ?auto_554660 ?auto_554663 ) ) ( not ( = ?auto_554660 ?auto_554664 ) ) ( not ( = ?auto_554661 ?auto_554662 ) ) ( not ( = ?auto_554661 ?auto_554663 ) ) ( not ( = ?auto_554661 ?auto_554664 ) ) ( not ( = ?auto_554662 ?auto_554663 ) ) ( not ( = ?auto_554662 ?auto_554664 ) ) ( not ( = ?auto_554663 ?auto_554664 ) ) ( ON ?auto_554662 ?auto_554663 ) ( ON ?auto_554661 ?auto_554662 ) ( ON ?auto_554660 ?auto_554661 ) ( ON ?auto_554659 ?auto_554660 ) ( CLEAR ?auto_554657 ) ( ON ?auto_554658 ?auto_554659 ) ( CLEAR ?auto_554658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_554653 ?auto_554654 ?auto_554655 ?auto_554656 ?auto_554657 ?auto_554658 )
      ( MAKE-11PILE ?auto_554653 ?auto_554654 ?auto_554655 ?auto_554656 ?auto_554657 ?auto_554658 ?auto_554659 ?auto_554660 ?auto_554661 ?auto_554662 ?auto_554663 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554699 - BLOCK
      ?auto_554700 - BLOCK
      ?auto_554701 - BLOCK
      ?auto_554702 - BLOCK
      ?auto_554703 - BLOCK
      ?auto_554704 - BLOCK
      ?auto_554705 - BLOCK
      ?auto_554706 - BLOCK
      ?auto_554707 - BLOCK
      ?auto_554708 - BLOCK
      ?auto_554709 - BLOCK
    )
    :vars
    (
      ?auto_554710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554709 ?auto_554710 ) ( ON-TABLE ?auto_554699 ) ( ON ?auto_554700 ?auto_554699 ) ( ON ?auto_554701 ?auto_554700 ) ( ON ?auto_554702 ?auto_554701 ) ( not ( = ?auto_554699 ?auto_554700 ) ) ( not ( = ?auto_554699 ?auto_554701 ) ) ( not ( = ?auto_554699 ?auto_554702 ) ) ( not ( = ?auto_554699 ?auto_554703 ) ) ( not ( = ?auto_554699 ?auto_554704 ) ) ( not ( = ?auto_554699 ?auto_554705 ) ) ( not ( = ?auto_554699 ?auto_554706 ) ) ( not ( = ?auto_554699 ?auto_554707 ) ) ( not ( = ?auto_554699 ?auto_554708 ) ) ( not ( = ?auto_554699 ?auto_554709 ) ) ( not ( = ?auto_554699 ?auto_554710 ) ) ( not ( = ?auto_554700 ?auto_554701 ) ) ( not ( = ?auto_554700 ?auto_554702 ) ) ( not ( = ?auto_554700 ?auto_554703 ) ) ( not ( = ?auto_554700 ?auto_554704 ) ) ( not ( = ?auto_554700 ?auto_554705 ) ) ( not ( = ?auto_554700 ?auto_554706 ) ) ( not ( = ?auto_554700 ?auto_554707 ) ) ( not ( = ?auto_554700 ?auto_554708 ) ) ( not ( = ?auto_554700 ?auto_554709 ) ) ( not ( = ?auto_554700 ?auto_554710 ) ) ( not ( = ?auto_554701 ?auto_554702 ) ) ( not ( = ?auto_554701 ?auto_554703 ) ) ( not ( = ?auto_554701 ?auto_554704 ) ) ( not ( = ?auto_554701 ?auto_554705 ) ) ( not ( = ?auto_554701 ?auto_554706 ) ) ( not ( = ?auto_554701 ?auto_554707 ) ) ( not ( = ?auto_554701 ?auto_554708 ) ) ( not ( = ?auto_554701 ?auto_554709 ) ) ( not ( = ?auto_554701 ?auto_554710 ) ) ( not ( = ?auto_554702 ?auto_554703 ) ) ( not ( = ?auto_554702 ?auto_554704 ) ) ( not ( = ?auto_554702 ?auto_554705 ) ) ( not ( = ?auto_554702 ?auto_554706 ) ) ( not ( = ?auto_554702 ?auto_554707 ) ) ( not ( = ?auto_554702 ?auto_554708 ) ) ( not ( = ?auto_554702 ?auto_554709 ) ) ( not ( = ?auto_554702 ?auto_554710 ) ) ( not ( = ?auto_554703 ?auto_554704 ) ) ( not ( = ?auto_554703 ?auto_554705 ) ) ( not ( = ?auto_554703 ?auto_554706 ) ) ( not ( = ?auto_554703 ?auto_554707 ) ) ( not ( = ?auto_554703 ?auto_554708 ) ) ( not ( = ?auto_554703 ?auto_554709 ) ) ( not ( = ?auto_554703 ?auto_554710 ) ) ( not ( = ?auto_554704 ?auto_554705 ) ) ( not ( = ?auto_554704 ?auto_554706 ) ) ( not ( = ?auto_554704 ?auto_554707 ) ) ( not ( = ?auto_554704 ?auto_554708 ) ) ( not ( = ?auto_554704 ?auto_554709 ) ) ( not ( = ?auto_554704 ?auto_554710 ) ) ( not ( = ?auto_554705 ?auto_554706 ) ) ( not ( = ?auto_554705 ?auto_554707 ) ) ( not ( = ?auto_554705 ?auto_554708 ) ) ( not ( = ?auto_554705 ?auto_554709 ) ) ( not ( = ?auto_554705 ?auto_554710 ) ) ( not ( = ?auto_554706 ?auto_554707 ) ) ( not ( = ?auto_554706 ?auto_554708 ) ) ( not ( = ?auto_554706 ?auto_554709 ) ) ( not ( = ?auto_554706 ?auto_554710 ) ) ( not ( = ?auto_554707 ?auto_554708 ) ) ( not ( = ?auto_554707 ?auto_554709 ) ) ( not ( = ?auto_554707 ?auto_554710 ) ) ( not ( = ?auto_554708 ?auto_554709 ) ) ( not ( = ?auto_554708 ?auto_554710 ) ) ( not ( = ?auto_554709 ?auto_554710 ) ) ( ON ?auto_554708 ?auto_554709 ) ( ON ?auto_554707 ?auto_554708 ) ( ON ?auto_554706 ?auto_554707 ) ( ON ?auto_554705 ?auto_554706 ) ( ON ?auto_554704 ?auto_554705 ) ( CLEAR ?auto_554702 ) ( ON ?auto_554703 ?auto_554704 ) ( CLEAR ?auto_554703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_554699 ?auto_554700 ?auto_554701 ?auto_554702 ?auto_554703 )
      ( MAKE-11PILE ?auto_554699 ?auto_554700 ?auto_554701 ?auto_554702 ?auto_554703 ?auto_554704 ?auto_554705 ?auto_554706 ?auto_554707 ?auto_554708 ?auto_554709 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554745 - BLOCK
      ?auto_554746 - BLOCK
      ?auto_554747 - BLOCK
      ?auto_554748 - BLOCK
      ?auto_554749 - BLOCK
      ?auto_554750 - BLOCK
      ?auto_554751 - BLOCK
      ?auto_554752 - BLOCK
      ?auto_554753 - BLOCK
      ?auto_554754 - BLOCK
      ?auto_554755 - BLOCK
    )
    :vars
    (
      ?auto_554756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554755 ?auto_554756 ) ( ON-TABLE ?auto_554745 ) ( ON ?auto_554746 ?auto_554745 ) ( ON ?auto_554747 ?auto_554746 ) ( not ( = ?auto_554745 ?auto_554746 ) ) ( not ( = ?auto_554745 ?auto_554747 ) ) ( not ( = ?auto_554745 ?auto_554748 ) ) ( not ( = ?auto_554745 ?auto_554749 ) ) ( not ( = ?auto_554745 ?auto_554750 ) ) ( not ( = ?auto_554745 ?auto_554751 ) ) ( not ( = ?auto_554745 ?auto_554752 ) ) ( not ( = ?auto_554745 ?auto_554753 ) ) ( not ( = ?auto_554745 ?auto_554754 ) ) ( not ( = ?auto_554745 ?auto_554755 ) ) ( not ( = ?auto_554745 ?auto_554756 ) ) ( not ( = ?auto_554746 ?auto_554747 ) ) ( not ( = ?auto_554746 ?auto_554748 ) ) ( not ( = ?auto_554746 ?auto_554749 ) ) ( not ( = ?auto_554746 ?auto_554750 ) ) ( not ( = ?auto_554746 ?auto_554751 ) ) ( not ( = ?auto_554746 ?auto_554752 ) ) ( not ( = ?auto_554746 ?auto_554753 ) ) ( not ( = ?auto_554746 ?auto_554754 ) ) ( not ( = ?auto_554746 ?auto_554755 ) ) ( not ( = ?auto_554746 ?auto_554756 ) ) ( not ( = ?auto_554747 ?auto_554748 ) ) ( not ( = ?auto_554747 ?auto_554749 ) ) ( not ( = ?auto_554747 ?auto_554750 ) ) ( not ( = ?auto_554747 ?auto_554751 ) ) ( not ( = ?auto_554747 ?auto_554752 ) ) ( not ( = ?auto_554747 ?auto_554753 ) ) ( not ( = ?auto_554747 ?auto_554754 ) ) ( not ( = ?auto_554747 ?auto_554755 ) ) ( not ( = ?auto_554747 ?auto_554756 ) ) ( not ( = ?auto_554748 ?auto_554749 ) ) ( not ( = ?auto_554748 ?auto_554750 ) ) ( not ( = ?auto_554748 ?auto_554751 ) ) ( not ( = ?auto_554748 ?auto_554752 ) ) ( not ( = ?auto_554748 ?auto_554753 ) ) ( not ( = ?auto_554748 ?auto_554754 ) ) ( not ( = ?auto_554748 ?auto_554755 ) ) ( not ( = ?auto_554748 ?auto_554756 ) ) ( not ( = ?auto_554749 ?auto_554750 ) ) ( not ( = ?auto_554749 ?auto_554751 ) ) ( not ( = ?auto_554749 ?auto_554752 ) ) ( not ( = ?auto_554749 ?auto_554753 ) ) ( not ( = ?auto_554749 ?auto_554754 ) ) ( not ( = ?auto_554749 ?auto_554755 ) ) ( not ( = ?auto_554749 ?auto_554756 ) ) ( not ( = ?auto_554750 ?auto_554751 ) ) ( not ( = ?auto_554750 ?auto_554752 ) ) ( not ( = ?auto_554750 ?auto_554753 ) ) ( not ( = ?auto_554750 ?auto_554754 ) ) ( not ( = ?auto_554750 ?auto_554755 ) ) ( not ( = ?auto_554750 ?auto_554756 ) ) ( not ( = ?auto_554751 ?auto_554752 ) ) ( not ( = ?auto_554751 ?auto_554753 ) ) ( not ( = ?auto_554751 ?auto_554754 ) ) ( not ( = ?auto_554751 ?auto_554755 ) ) ( not ( = ?auto_554751 ?auto_554756 ) ) ( not ( = ?auto_554752 ?auto_554753 ) ) ( not ( = ?auto_554752 ?auto_554754 ) ) ( not ( = ?auto_554752 ?auto_554755 ) ) ( not ( = ?auto_554752 ?auto_554756 ) ) ( not ( = ?auto_554753 ?auto_554754 ) ) ( not ( = ?auto_554753 ?auto_554755 ) ) ( not ( = ?auto_554753 ?auto_554756 ) ) ( not ( = ?auto_554754 ?auto_554755 ) ) ( not ( = ?auto_554754 ?auto_554756 ) ) ( not ( = ?auto_554755 ?auto_554756 ) ) ( ON ?auto_554754 ?auto_554755 ) ( ON ?auto_554753 ?auto_554754 ) ( ON ?auto_554752 ?auto_554753 ) ( ON ?auto_554751 ?auto_554752 ) ( ON ?auto_554750 ?auto_554751 ) ( ON ?auto_554749 ?auto_554750 ) ( CLEAR ?auto_554747 ) ( ON ?auto_554748 ?auto_554749 ) ( CLEAR ?auto_554748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_554745 ?auto_554746 ?auto_554747 ?auto_554748 )
      ( MAKE-11PILE ?auto_554745 ?auto_554746 ?auto_554747 ?auto_554748 ?auto_554749 ?auto_554750 ?auto_554751 ?auto_554752 ?auto_554753 ?auto_554754 ?auto_554755 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554791 - BLOCK
      ?auto_554792 - BLOCK
      ?auto_554793 - BLOCK
      ?auto_554794 - BLOCK
      ?auto_554795 - BLOCK
      ?auto_554796 - BLOCK
      ?auto_554797 - BLOCK
      ?auto_554798 - BLOCK
      ?auto_554799 - BLOCK
      ?auto_554800 - BLOCK
      ?auto_554801 - BLOCK
    )
    :vars
    (
      ?auto_554802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554801 ?auto_554802 ) ( ON-TABLE ?auto_554791 ) ( ON ?auto_554792 ?auto_554791 ) ( not ( = ?auto_554791 ?auto_554792 ) ) ( not ( = ?auto_554791 ?auto_554793 ) ) ( not ( = ?auto_554791 ?auto_554794 ) ) ( not ( = ?auto_554791 ?auto_554795 ) ) ( not ( = ?auto_554791 ?auto_554796 ) ) ( not ( = ?auto_554791 ?auto_554797 ) ) ( not ( = ?auto_554791 ?auto_554798 ) ) ( not ( = ?auto_554791 ?auto_554799 ) ) ( not ( = ?auto_554791 ?auto_554800 ) ) ( not ( = ?auto_554791 ?auto_554801 ) ) ( not ( = ?auto_554791 ?auto_554802 ) ) ( not ( = ?auto_554792 ?auto_554793 ) ) ( not ( = ?auto_554792 ?auto_554794 ) ) ( not ( = ?auto_554792 ?auto_554795 ) ) ( not ( = ?auto_554792 ?auto_554796 ) ) ( not ( = ?auto_554792 ?auto_554797 ) ) ( not ( = ?auto_554792 ?auto_554798 ) ) ( not ( = ?auto_554792 ?auto_554799 ) ) ( not ( = ?auto_554792 ?auto_554800 ) ) ( not ( = ?auto_554792 ?auto_554801 ) ) ( not ( = ?auto_554792 ?auto_554802 ) ) ( not ( = ?auto_554793 ?auto_554794 ) ) ( not ( = ?auto_554793 ?auto_554795 ) ) ( not ( = ?auto_554793 ?auto_554796 ) ) ( not ( = ?auto_554793 ?auto_554797 ) ) ( not ( = ?auto_554793 ?auto_554798 ) ) ( not ( = ?auto_554793 ?auto_554799 ) ) ( not ( = ?auto_554793 ?auto_554800 ) ) ( not ( = ?auto_554793 ?auto_554801 ) ) ( not ( = ?auto_554793 ?auto_554802 ) ) ( not ( = ?auto_554794 ?auto_554795 ) ) ( not ( = ?auto_554794 ?auto_554796 ) ) ( not ( = ?auto_554794 ?auto_554797 ) ) ( not ( = ?auto_554794 ?auto_554798 ) ) ( not ( = ?auto_554794 ?auto_554799 ) ) ( not ( = ?auto_554794 ?auto_554800 ) ) ( not ( = ?auto_554794 ?auto_554801 ) ) ( not ( = ?auto_554794 ?auto_554802 ) ) ( not ( = ?auto_554795 ?auto_554796 ) ) ( not ( = ?auto_554795 ?auto_554797 ) ) ( not ( = ?auto_554795 ?auto_554798 ) ) ( not ( = ?auto_554795 ?auto_554799 ) ) ( not ( = ?auto_554795 ?auto_554800 ) ) ( not ( = ?auto_554795 ?auto_554801 ) ) ( not ( = ?auto_554795 ?auto_554802 ) ) ( not ( = ?auto_554796 ?auto_554797 ) ) ( not ( = ?auto_554796 ?auto_554798 ) ) ( not ( = ?auto_554796 ?auto_554799 ) ) ( not ( = ?auto_554796 ?auto_554800 ) ) ( not ( = ?auto_554796 ?auto_554801 ) ) ( not ( = ?auto_554796 ?auto_554802 ) ) ( not ( = ?auto_554797 ?auto_554798 ) ) ( not ( = ?auto_554797 ?auto_554799 ) ) ( not ( = ?auto_554797 ?auto_554800 ) ) ( not ( = ?auto_554797 ?auto_554801 ) ) ( not ( = ?auto_554797 ?auto_554802 ) ) ( not ( = ?auto_554798 ?auto_554799 ) ) ( not ( = ?auto_554798 ?auto_554800 ) ) ( not ( = ?auto_554798 ?auto_554801 ) ) ( not ( = ?auto_554798 ?auto_554802 ) ) ( not ( = ?auto_554799 ?auto_554800 ) ) ( not ( = ?auto_554799 ?auto_554801 ) ) ( not ( = ?auto_554799 ?auto_554802 ) ) ( not ( = ?auto_554800 ?auto_554801 ) ) ( not ( = ?auto_554800 ?auto_554802 ) ) ( not ( = ?auto_554801 ?auto_554802 ) ) ( ON ?auto_554800 ?auto_554801 ) ( ON ?auto_554799 ?auto_554800 ) ( ON ?auto_554798 ?auto_554799 ) ( ON ?auto_554797 ?auto_554798 ) ( ON ?auto_554796 ?auto_554797 ) ( ON ?auto_554795 ?auto_554796 ) ( ON ?auto_554794 ?auto_554795 ) ( CLEAR ?auto_554792 ) ( ON ?auto_554793 ?auto_554794 ) ( CLEAR ?auto_554793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_554791 ?auto_554792 ?auto_554793 )
      ( MAKE-11PILE ?auto_554791 ?auto_554792 ?auto_554793 ?auto_554794 ?auto_554795 ?auto_554796 ?auto_554797 ?auto_554798 ?auto_554799 ?auto_554800 ?auto_554801 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554837 - BLOCK
      ?auto_554838 - BLOCK
      ?auto_554839 - BLOCK
      ?auto_554840 - BLOCK
      ?auto_554841 - BLOCK
      ?auto_554842 - BLOCK
      ?auto_554843 - BLOCK
      ?auto_554844 - BLOCK
      ?auto_554845 - BLOCK
      ?auto_554846 - BLOCK
      ?auto_554847 - BLOCK
    )
    :vars
    (
      ?auto_554848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554847 ?auto_554848 ) ( ON-TABLE ?auto_554837 ) ( not ( = ?auto_554837 ?auto_554838 ) ) ( not ( = ?auto_554837 ?auto_554839 ) ) ( not ( = ?auto_554837 ?auto_554840 ) ) ( not ( = ?auto_554837 ?auto_554841 ) ) ( not ( = ?auto_554837 ?auto_554842 ) ) ( not ( = ?auto_554837 ?auto_554843 ) ) ( not ( = ?auto_554837 ?auto_554844 ) ) ( not ( = ?auto_554837 ?auto_554845 ) ) ( not ( = ?auto_554837 ?auto_554846 ) ) ( not ( = ?auto_554837 ?auto_554847 ) ) ( not ( = ?auto_554837 ?auto_554848 ) ) ( not ( = ?auto_554838 ?auto_554839 ) ) ( not ( = ?auto_554838 ?auto_554840 ) ) ( not ( = ?auto_554838 ?auto_554841 ) ) ( not ( = ?auto_554838 ?auto_554842 ) ) ( not ( = ?auto_554838 ?auto_554843 ) ) ( not ( = ?auto_554838 ?auto_554844 ) ) ( not ( = ?auto_554838 ?auto_554845 ) ) ( not ( = ?auto_554838 ?auto_554846 ) ) ( not ( = ?auto_554838 ?auto_554847 ) ) ( not ( = ?auto_554838 ?auto_554848 ) ) ( not ( = ?auto_554839 ?auto_554840 ) ) ( not ( = ?auto_554839 ?auto_554841 ) ) ( not ( = ?auto_554839 ?auto_554842 ) ) ( not ( = ?auto_554839 ?auto_554843 ) ) ( not ( = ?auto_554839 ?auto_554844 ) ) ( not ( = ?auto_554839 ?auto_554845 ) ) ( not ( = ?auto_554839 ?auto_554846 ) ) ( not ( = ?auto_554839 ?auto_554847 ) ) ( not ( = ?auto_554839 ?auto_554848 ) ) ( not ( = ?auto_554840 ?auto_554841 ) ) ( not ( = ?auto_554840 ?auto_554842 ) ) ( not ( = ?auto_554840 ?auto_554843 ) ) ( not ( = ?auto_554840 ?auto_554844 ) ) ( not ( = ?auto_554840 ?auto_554845 ) ) ( not ( = ?auto_554840 ?auto_554846 ) ) ( not ( = ?auto_554840 ?auto_554847 ) ) ( not ( = ?auto_554840 ?auto_554848 ) ) ( not ( = ?auto_554841 ?auto_554842 ) ) ( not ( = ?auto_554841 ?auto_554843 ) ) ( not ( = ?auto_554841 ?auto_554844 ) ) ( not ( = ?auto_554841 ?auto_554845 ) ) ( not ( = ?auto_554841 ?auto_554846 ) ) ( not ( = ?auto_554841 ?auto_554847 ) ) ( not ( = ?auto_554841 ?auto_554848 ) ) ( not ( = ?auto_554842 ?auto_554843 ) ) ( not ( = ?auto_554842 ?auto_554844 ) ) ( not ( = ?auto_554842 ?auto_554845 ) ) ( not ( = ?auto_554842 ?auto_554846 ) ) ( not ( = ?auto_554842 ?auto_554847 ) ) ( not ( = ?auto_554842 ?auto_554848 ) ) ( not ( = ?auto_554843 ?auto_554844 ) ) ( not ( = ?auto_554843 ?auto_554845 ) ) ( not ( = ?auto_554843 ?auto_554846 ) ) ( not ( = ?auto_554843 ?auto_554847 ) ) ( not ( = ?auto_554843 ?auto_554848 ) ) ( not ( = ?auto_554844 ?auto_554845 ) ) ( not ( = ?auto_554844 ?auto_554846 ) ) ( not ( = ?auto_554844 ?auto_554847 ) ) ( not ( = ?auto_554844 ?auto_554848 ) ) ( not ( = ?auto_554845 ?auto_554846 ) ) ( not ( = ?auto_554845 ?auto_554847 ) ) ( not ( = ?auto_554845 ?auto_554848 ) ) ( not ( = ?auto_554846 ?auto_554847 ) ) ( not ( = ?auto_554846 ?auto_554848 ) ) ( not ( = ?auto_554847 ?auto_554848 ) ) ( ON ?auto_554846 ?auto_554847 ) ( ON ?auto_554845 ?auto_554846 ) ( ON ?auto_554844 ?auto_554845 ) ( ON ?auto_554843 ?auto_554844 ) ( ON ?auto_554842 ?auto_554843 ) ( ON ?auto_554841 ?auto_554842 ) ( ON ?auto_554840 ?auto_554841 ) ( ON ?auto_554839 ?auto_554840 ) ( CLEAR ?auto_554837 ) ( ON ?auto_554838 ?auto_554839 ) ( CLEAR ?auto_554838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_554837 ?auto_554838 )
      ( MAKE-11PILE ?auto_554837 ?auto_554838 ?auto_554839 ?auto_554840 ?auto_554841 ?auto_554842 ?auto_554843 ?auto_554844 ?auto_554845 ?auto_554846 ?auto_554847 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_554883 - BLOCK
      ?auto_554884 - BLOCK
      ?auto_554885 - BLOCK
      ?auto_554886 - BLOCK
      ?auto_554887 - BLOCK
      ?auto_554888 - BLOCK
      ?auto_554889 - BLOCK
      ?auto_554890 - BLOCK
      ?auto_554891 - BLOCK
      ?auto_554892 - BLOCK
      ?auto_554893 - BLOCK
    )
    :vars
    (
      ?auto_554894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554893 ?auto_554894 ) ( not ( = ?auto_554883 ?auto_554884 ) ) ( not ( = ?auto_554883 ?auto_554885 ) ) ( not ( = ?auto_554883 ?auto_554886 ) ) ( not ( = ?auto_554883 ?auto_554887 ) ) ( not ( = ?auto_554883 ?auto_554888 ) ) ( not ( = ?auto_554883 ?auto_554889 ) ) ( not ( = ?auto_554883 ?auto_554890 ) ) ( not ( = ?auto_554883 ?auto_554891 ) ) ( not ( = ?auto_554883 ?auto_554892 ) ) ( not ( = ?auto_554883 ?auto_554893 ) ) ( not ( = ?auto_554883 ?auto_554894 ) ) ( not ( = ?auto_554884 ?auto_554885 ) ) ( not ( = ?auto_554884 ?auto_554886 ) ) ( not ( = ?auto_554884 ?auto_554887 ) ) ( not ( = ?auto_554884 ?auto_554888 ) ) ( not ( = ?auto_554884 ?auto_554889 ) ) ( not ( = ?auto_554884 ?auto_554890 ) ) ( not ( = ?auto_554884 ?auto_554891 ) ) ( not ( = ?auto_554884 ?auto_554892 ) ) ( not ( = ?auto_554884 ?auto_554893 ) ) ( not ( = ?auto_554884 ?auto_554894 ) ) ( not ( = ?auto_554885 ?auto_554886 ) ) ( not ( = ?auto_554885 ?auto_554887 ) ) ( not ( = ?auto_554885 ?auto_554888 ) ) ( not ( = ?auto_554885 ?auto_554889 ) ) ( not ( = ?auto_554885 ?auto_554890 ) ) ( not ( = ?auto_554885 ?auto_554891 ) ) ( not ( = ?auto_554885 ?auto_554892 ) ) ( not ( = ?auto_554885 ?auto_554893 ) ) ( not ( = ?auto_554885 ?auto_554894 ) ) ( not ( = ?auto_554886 ?auto_554887 ) ) ( not ( = ?auto_554886 ?auto_554888 ) ) ( not ( = ?auto_554886 ?auto_554889 ) ) ( not ( = ?auto_554886 ?auto_554890 ) ) ( not ( = ?auto_554886 ?auto_554891 ) ) ( not ( = ?auto_554886 ?auto_554892 ) ) ( not ( = ?auto_554886 ?auto_554893 ) ) ( not ( = ?auto_554886 ?auto_554894 ) ) ( not ( = ?auto_554887 ?auto_554888 ) ) ( not ( = ?auto_554887 ?auto_554889 ) ) ( not ( = ?auto_554887 ?auto_554890 ) ) ( not ( = ?auto_554887 ?auto_554891 ) ) ( not ( = ?auto_554887 ?auto_554892 ) ) ( not ( = ?auto_554887 ?auto_554893 ) ) ( not ( = ?auto_554887 ?auto_554894 ) ) ( not ( = ?auto_554888 ?auto_554889 ) ) ( not ( = ?auto_554888 ?auto_554890 ) ) ( not ( = ?auto_554888 ?auto_554891 ) ) ( not ( = ?auto_554888 ?auto_554892 ) ) ( not ( = ?auto_554888 ?auto_554893 ) ) ( not ( = ?auto_554888 ?auto_554894 ) ) ( not ( = ?auto_554889 ?auto_554890 ) ) ( not ( = ?auto_554889 ?auto_554891 ) ) ( not ( = ?auto_554889 ?auto_554892 ) ) ( not ( = ?auto_554889 ?auto_554893 ) ) ( not ( = ?auto_554889 ?auto_554894 ) ) ( not ( = ?auto_554890 ?auto_554891 ) ) ( not ( = ?auto_554890 ?auto_554892 ) ) ( not ( = ?auto_554890 ?auto_554893 ) ) ( not ( = ?auto_554890 ?auto_554894 ) ) ( not ( = ?auto_554891 ?auto_554892 ) ) ( not ( = ?auto_554891 ?auto_554893 ) ) ( not ( = ?auto_554891 ?auto_554894 ) ) ( not ( = ?auto_554892 ?auto_554893 ) ) ( not ( = ?auto_554892 ?auto_554894 ) ) ( not ( = ?auto_554893 ?auto_554894 ) ) ( ON ?auto_554892 ?auto_554893 ) ( ON ?auto_554891 ?auto_554892 ) ( ON ?auto_554890 ?auto_554891 ) ( ON ?auto_554889 ?auto_554890 ) ( ON ?auto_554888 ?auto_554889 ) ( ON ?auto_554887 ?auto_554888 ) ( ON ?auto_554886 ?auto_554887 ) ( ON ?auto_554885 ?auto_554886 ) ( ON ?auto_554884 ?auto_554885 ) ( ON ?auto_554883 ?auto_554884 ) ( CLEAR ?auto_554883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_554883 )
      ( MAKE-11PILE ?auto_554883 ?auto_554884 ?auto_554885 ?auto_554886 ?auto_554887 ?auto_554888 ?auto_554889 ?auto_554890 ?auto_554891 ?auto_554892 ?auto_554893 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_554930 - BLOCK
      ?auto_554931 - BLOCK
      ?auto_554932 - BLOCK
      ?auto_554933 - BLOCK
      ?auto_554934 - BLOCK
      ?auto_554935 - BLOCK
      ?auto_554936 - BLOCK
      ?auto_554937 - BLOCK
      ?auto_554938 - BLOCK
      ?auto_554939 - BLOCK
      ?auto_554940 - BLOCK
      ?auto_554941 - BLOCK
    )
    :vars
    (
      ?auto_554942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_554940 ) ( ON ?auto_554941 ?auto_554942 ) ( CLEAR ?auto_554941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_554930 ) ( ON ?auto_554931 ?auto_554930 ) ( ON ?auto_554932 ?auto_554931 ) ( ON ?auto_554933 ?auto_554932 ) ( ON ?auto_554934 ?auto_554933 ) ( ON ?auto_554935 ?auto_554934 ) ( ON ?auto_554936 ?auto_554935 ) ( ON ?auto_554937 ?auto_554936 ) ( ON ?auto_554938 ?auto_554937 ) ( ON ?auto_554939 ?auto_554938 ) ( ON ?auto_554940 ?auto_554939 ) ( not ( = ?auto_554930 ?auto_554931 ) ) ( not ( = ?auto_554930 ?auto_554932 ) ) ( not ( = ?auto_554930 ?auto_554933 ) ) ( not ( = ?auto_554930 ?auto_554934 ) ) ( not ( = ?auto_554930 ?auto_554935 ) ) ( not ( = ?auto_554930 ?auto_554936 ) ) ( not ( = ?auto_554930 ?auto_554937 ) ) ( not ( = ?auto_554930 ?auto_554938 ) ) ( not ( = ?auto_554930 ?auto_554939 ) ) ( not ( = ?auto_554930 ?auto_554940 ) ) ( not ( = ?auto_554930 ?auto_554941 ) ) ( not ( = ?auto_554930 ?auto_554942 ) ) ( not ( = ?auto_554931 ?auto_554932 ) ) ( not ( = ?auto_554931 ?auto_554933 ) ) ( not ( = ?auto_554931 ?auto_554934 ) ) ( not ( = ?auto_554931 ?auto_554935 ) ) ( not ( = ?auto_554931 ?auto_554936 ) ) ( not ( = ?auto_554931 ?auto_554937 ) ) ( not ( = ?auto_554931 ?auto_554938 ) ) ( not ( = ?auto_554931 ?auto_554939 ) ) ( not ( = ?auto_554931 ?auto_554940 ) ) ( not ( = ?auto_554931 ?auto_554941 ) ) ( not ( = ?auto_554931 ?auto_554942 ) ) ( not ( = ?auto_554932 ?auto_554933 ) ) ( not ( = ?auto_554932 ?auto_554934 ) ) ( not ( = ?auto_554932 ?auto_554935 ) ) ( not ( = ?auto_554932 ?auto_554936 ) ) ( not ( = ?auto_554932 ?auto_554937 ) ) ( not ( = ?auto_554932 ?auto_554938 ) ) ( not ( = ?auto_554932 ?auto_554939 ) ) ( not ( = ?auto_554932 ?auto_554940 ) ) ( not ( = ?auto_554932 ?auto_554941 ) ) ( not ( = ?auto_554932 ?auto_554942 ) ) ( not ( = ?auto_554933 ?auto_554934 ) ) ( not ( = ?auto_554933 ?auto_554935 ) ) ( not ( = ?auto_554933 ?auto_554936 ) ) ( not ( = ?auto_554933 ?auto_554937 ) ) ( not ( = ?auto_554933 ?auto_554938 ) ) ( not ( = ?auto_554933 ?auto_554939 ) ) ( not ( = ?auto_554933 ?auto_554940 ) ) ( not ( = ?auto_554933 ?auto_554941 ) ) ( not ( = ?auto_554933 ?auto_554942 ) ) ( not ( = ?auto_554934 ?auto_554935 ) ) ( not ( = ?auto_554934 ?auto_554936 ) ) ( not ( = ?auto_554934 ?auto_554937 ) ) ( not ( = ?auto_554934 ?auto_554938 ) ) ( not ( = ?auto_554934 ?auto_554939 ) ) ( not ( = ?auto_554934 ?auto_554940 ) ) ( not ( = ?auto_554934 ?auto_554941 ) ) ( not ( = ?auto_554934 ?auto_554942 ) ) ( not ( = ?auto_554935 ?auto_554936 ) ) ( not ( = ?auto_554935 ?auto_554937 ) ) ( not ( = ?auto_554935 ?auto_554938 ) ) ( not ( = ?auto_554935 ?auto_554939 ) ) ( not ( = ?auto_554935 ?auto_554940 ) ) ( not ( = ?auto_554935 ?auto_554941 ) ) ( not ( = ?auto_554935 ?auto_554942 ) ) ( not ( = ?auto_554936 ?auto_554937 ) ) ( not ( = ?auto_554936 ?auto_554938 ) ) ( not ( = ?auto_554936 ?auto_554939 ) ) ( not ( = ?auto_554936 ?auto_554940 ) ) ( not ( = ?auto_554936 ?auto_554941 ) ) ( not ( = ?auto_554936 ?auto_554942 ) ) ( not ( = ?auto_554937 ?auto_554938 ) ) ( not ( = ?auto_554937 ?auto_554939 ) ) ( not ( = ?auto_554937 ?auto_554940 ) ) ( not ( = ?auto_554937 ?auto_554941 ) ) ( not ( = ?auto_554937 ?auto_554942 ) ) ( not ( = ?auto_554938 ?auto_554939 ) ) ( not ( = ?auto_554938 ?auto_554940 ) ) ( not ( = ?auto_554938 ?auto_554941 ) ) ( not ( = ?auto_554938 ?auto_554942 ) ) ( not ( = ?auto_554939 ?auto_554940 ) ) ( not ( = ?auto_554939 ?auto_554941 ) ) ( not ( = ?auto_554939 ?auto_554942 ) ) ( not ( = ?auto_554940 ?auto_554941 ) ) ( not ( = ?auto_554940 ?auto_554942 ) ) ( not ( = ?auto_554941 ?auto_554942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_554941 ?auto_554942 )
      ( !STACK ?auto_554941 ?auto_554940 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_554980 - BLOCK
      ?auto_554981 - BLOCK
      ?auto_554982 - BLOCK
      ?auto_554983 - BLOCK
      ?auto_554984 - BLOCK
      ?auto_554985 - BLOCK
      ?auto_554986 - BLOCK
      ?auto_554987 - BLOCK
      ?auto_554988 - BLOCK
      ?auto_554989 - BLOCK
      ?auto_554990 - BLOCK
      ?auto_554991 - BLOCK
    )
    :vars
    (
      ?auto_554992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_554991 ?auto_554992 ) ( ON-TABLE ?auto_554980 ) ( ON ?auto_554981 ?auto_554980 ) ( ON ?auto_554982 ?auto_554981 ) ( ON ?auto_554983 ?auto_554982 ) ( ON ?auto_554984 ?auto_554983 ) ( ON ?auto_554985 ?auto_554984 ) ( ON ?auto_554986 ?auto_554985 ) ( ON ?auto_554987 ?auto_554986 ) ( ON ?auto_554988 ?auto_554987 ) ( ON ?auto_554989 ?auto_554988 ) ( not ( = ?auto_554980 ?auto_554981 ) ) ( not ( = ?auto_554980 ?auto_554982 ) ) ( not ( = ?auto_554980 ?auto_554983 ) ) ( not ( = ?auto_554980 ?auto_554984 ) ) ( not ( = ?auto_554980 ?auto_554985 ) ) ( not ( = ?auto_554980 ?auto_554986 ) ) ( not ( = ?auto_554980 ?auto_554987 ) ) ( not ( = ?auto_554980 ?auto_554988 ) ) ( not ( = ?auto_554980 ?auto_554989 ) ) ( not ( = ?auto_554980 ?auto_554990 ) ) ( not ( = ?auto_554980 ?auto_554991 ) ) ( not ( = ?auto_554980 ?auto_554992 ) ) ( not ( = ?auto_554981 ?auto_554982 ) ) ( not ( = ?auto_554981 ?auto_554983 ) ) ( not ( = ?auto_554981 ?auto_554984 ) ) ( not ( = ?auto_554981 ?auto_554985 ) ) ( not ( = ?auto_554981 ?auto_554986 ) ) ( not ( = ?auto_554981 ?auto_554987 ) ) ( not ( = ?auto_554981 ?auto_554988 ) ) ( not ( = ?auto_554981 ?auto_554989 ) ) ( not ( = ?auto_554981 ?auto_554990 ) ) ( not ( = ?auto_554981 ?auto_554991 ) ) ( not ( = ?auto_554981 ?auto_554992 ) ) ( not ( = ?auto_554982 ?auto_554983 ) ) ( not ( = ?auto_554982 ?auto_554984 ) ) ( not ( = ?auto_554982 ?auto_554985 ) ) ( not ( = ?auto_554982 ?auto_554986 ) ) ( not ( = ?auto_554982 ?auto_554987 ) ) ( not ( = ?auto_554982 ?auto_554988 ) ) ( not ( = ?auto_554982 ?auto_554989 ) ) ( not ( = ?auto_554982 ?auto_554990 ) ) ( not ( = ?auto_554982 ?auto_554991 ) ) ( not ( = ?auto_554982 ?auto_554992 ) ) ( not ( = ?auto_554983 ?auto_554984 ) ) ( not ( = ?auto_554983 ?auto_554985 ) ) ( not ( = ?auto_554983 ?auto_554986 ) ) ( not ( = ?auto_554983 ?auto_554987 ) ) ( not ( = ?auto_554983 ?auto_554988 ) ) ( not ( = ?auto_554983 ?auto_554989 ) ) ( not ( = ?auto_554983 ?auto_554990 ) ) ( not ( = ?auto_554983 ?auto_554991 ) ) ( not ( = ?auto_554983 ?auto_554992 ) ) ( not ( = ?auto_554984 ?auto_554985 ) ) ( not ( = ?auto_554984 ?auto_554986 ) ) ( not ( = ?auto_554984 ?auto_554987 ) ) ( not ( = ?auto_554984 ?auto_554988 ) ) ( not ( = ?auto_554984 ?auto_554989 ) ) ( not ( = ?auto_554984 ?auto_554990 ) ) ( not ( = ?auto_554984 ?auto_554991 ) ) ( not ( = ?auto_554984 ?auto_554992 ) ) ( not ( = ?auto_554985 ?auto_554986 ) ) ( not ( = ?auto_554985 ?auto_554987 ) ) ( not ( = ?auto_554985 ?auto_554988 ) ) ( not ( = ?auto_554985 ?auto_554989 ) ) ( not ( = ?auto_554985 ?auto_554990 ) ) ( not ( = ?auto_554985 ?auto_554991 ) ) ( not ( = ?auto_554985 ?auto_554992 ) ) ( not ( = ?auto_554986 ?auto_554987 ) ) ( not ( = ?auto_554986 ?auto_554988 ) ) ( not ( = ?auto_554986 ?auto_554989 ) ) ( not ( = ?auto_554986 ?auto_554990 ) ) ( not ( = ?auto_554986 ?auto_554991 ) ) ( not ( = ?auto_554986 ?auto_554992 ) ) ( not ( = ?auto_554987 ?auto_554988 ) ) ( not ( = ?auto_554987 ?auto_554989 ) ) ( not ( = ?auto_554987 ?auto_554990 ) ) ( not ( = ?auto_554987 ?auto_554991 ) ) ( not ( = ?auto_554987 ?auto_554992 ) ) ( not ( = ?auto_554988 ?auto_554989 ) ) ( not ( = ?auto_554988 ?auto_554990 ) ) ( not ( = ?auto_554988 ?auto_554991 ) ) ( not ( = ?auto_554988 ?auto_554992 ) ) ( not ( = ?auto_554989 ?auto_554990 ) ) ( not ( = ?auto_554989 ?auto_554991 ) ) ( not ( = ?auto_554989 ?auto_554992 ) ) ( not ( = ?auto_554990 ?auto_554991 ) ) ( not ( = ?auto_554990 ?auto_554992 ) ) ( not ( = ?auto_554991 ?auto_554992 ) ) ( CLEAR ?auto_554989 ) ( ON ?auto_554990 ?auto_554991 ) ( CLEAR ?auto_554990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_554980 ?auto_554981 ?auto_554982 ?auto_554983 ?auto_554984 ?auto_554985 ?auto_554986 ?auto_554987 ?auto_554988 ?auto_554989 ?auto_554990 )
      ( MAKE-12PILE ?auto_554980 ?auto_554981 ?auto_554982 ?auto_554983 ?auto_554984 ?auto_554985 ?auto_554986 ?auto_554987 ?auto_554988 ?auto_554989 ?auto_554990 ?auto_554991 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555030 - BLOCK
      ?auto_555031 - BLOCK
      ?auto_555032 - BLOCK
      ?auto_555033 - BLOCK
      ?auto_555034 - BLOCK
      ?auto_555035 - BLOCK
      ?auto_555036 - BLOCK
      ?auto_555037 - BLOCK
      ?auto_555038 - BLOCK
      ?auto_555039 - BLOCK
      ?auto_555040 - BLOCK
      ?auto_555041 - BLOCK
    )
    :vars
    (
      ?auto_555042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555041 ?auto_555042 ) ( ON-TABLE ?auto_555030 ) ( ON ?auto_555031 ?auto_555030 ) ( ON ?auto_555032 ?auto_555031 ) ( ON ?auto_555033 ?auto_555032 ) ( ON ?auto_555034 ?auto_555033 ) ( ON ?auto_555035 ?auto_555034 ) ( ON ?auto_555036 ?auto_555035 ) ( ON ?auto_555037 ?auto_555036 ) ( ON ?auto_555038 ?auto_555037 ) ( not ( = ?auto_555030 ?auto_555031 ) ) ( not ( = ?auto_555030 ?auto_555032 ) ) ( not ( = ?auto_555030 ?auto_555033 ) ) ( not ( = ?auto_555030 ?auto_555034 ) ) ( not ( = ?auto_555030 ?auto_555035 ) ) ( not ( = ?auto_555030 ?auto_555036 ) ) ( not ( = ?auto_555030 ?auto_555037 ) ) ( not ( = ?auto_555030 ?auto_555038 ) ) ( not ( = ?auto_555030 ?auto_555039 ) ) ( not ( = ?auto_555030 ?auto_555040 ) ) ( not ( = ?auto_555030 ?auto_555041 ) ) ( not ( = ?auto_555030 ?auto_555042 ) ) ( not ( = ?auto_555031 ?auto_555032 ) ) ( not ( = ?auto_555031 ?auto_555033 ) ) ( not ( = ?auto_555031 ?auto_555034 ) ) ( not ( = ?auto_555031 ?auto_555035 ) ) ( not ( = ?auto_555031 ?auto_555036 ) ) ( not ( = ?auto_555031 ?auto_555037 ) ) ( not ( = ?auto_555031 ?auto_555038 ) ) ( not ( = ?auto_555031 ?auto_555039 ) ) ( not ( = ?auto_555031 ?auto_555040 ) ) ( not ( = ?auto_555031 ?auto_555041 ) ) ( not ( = ?auto_555031 ?auto_555042 ) ) ( not ( = ?auto_555032 ?auto_555033 ) ) ( not ( = ?auto_555032 ?auto_555034 ) ) ( not ( = ?auto_555032 ?auto_555035 ) ) ( not ( = ?auto_555032 ?auto_555036 ) ) ( not ( = ?auto_555032 ?auto_555037 ) ) ( not ( = ?auto_555032 ?auto_555038 ) ) ( not ( = ?auto_555032 ?auto_555039 ) ) ( not ( = ?auto_555032 ?auto_555040 ) ) ( not ( = ?auto_555032 ?auto_555041 ) ) ( not ( = ?auto_555032 ?auto_555042 ) ) ( not ( = ?auto_555033 ?auto_555034 ) ) ( not ( = ?auto_555033 ?auto_555035 ) ) ( not ( = ?auto_555033 ?auto_555036 ) ) ( not ( = ?auto_555033 ?auto_555037 ) ) ( not ( = ?auto_555033 ?auto_555038 ) ) ( not ( = ?auto_555033 ?auto_555039 ) ) ( not ( = ?auto_555033 ?auto_555040 ) ) ( not ( = ?auto_555033 ?auto_555041 ) ) ( not ( = ?auto_555033 ?auto_555042 ) ) ( not ( = ?auto_555034 ?auto_555035 ) ) ( not ( = ?auto_555034 ?auto_555036 ) ) ( not ( = ?auto_555034 ?auto_555037 ) ) ( not ( = ?auto_555034 ?auto_555038 ) ) ( not ( = ?auto_555034 ?auto_555039 ) ) ( not ( = ?auto_555034 ?auto_555040 ) ) ( not ( = ?auto_555034 ?auto_555041 ) ) ( not ( = ?auto_555034 ?auto_555042 ) ) ( not ( = ?auto_555035 ?auto_555036 ) ) ( not ( = ?auto_555035 ?auto_555037 ) ) ( not ( = ?auto_555035 ?auto_555038 ) ) ( not ( = ?auto_555035 ?auto_555039 ) ) ( not ( = ?auto_555035 ?auto_555040 ) ) ( not ( = ?auto_555035 ?auto_555041 ) ) ( not ( = ?auto_555035 ?auto_555042 ) ) ( not ( = ?auto_555036 ?auto_555037 ) ) ( not ( = ?auto_555036 ?auto_555038 ) ) ( not ( = ?auto_555036 ?auto_555039 ) ) ( not ( = ?auto_555036 ?auto_555040 ) ) ( not ( = ?auto_555036 ?auto_555041 ) ) ( not ( = ?auto_555036 ?auto_555042 ) ) ( not ( = ?auto_555037 ?auto_555038 ) ) ( not ( = ?auto_555037 ?auto_555039 ) ) ( not ( = ?auto_555037 ?auto_555040 ) ) ( not ( = ?auto_555037 ?auto_555041 ) ) ( not ( = ?auto_555037 ?auto_555042 ) ) ( not ( = ?auto_555038 ?auto_555039 ) ) ( not ( = ?auto_555038 ?auto_555040 ) ) ( not ( = ?auto_555038 ?auto_555041 ) ) ( not ( = ?auto_555038 ?auto_555042 ) ) ( not ( = ?auto_555039 ?auto_555040 ) ) ( not ( = ?auto_555039 ?auto_555041 ) ) ( not ( = ?auto_555039 ?auto_555042 ) ) ( not ( = ?auto_555040 ?auto_555041 ) ) ( not ( = ?auto_555040 ?auto_555042 ) ) ( not ( = ?auto_555041 ?auto_555042 ) ) ( ON ?auto_555040 ?auto_555041 ) ( CLEAR ?auto_555038 ) ( ON ?auto_555039 ?auto_555040 ) ( CLEAR ?auto_555039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_555030 ?auto_555031 ?auto_555032 ?auto_555033 ?auto_555034 ?auto_555035 ?auto_555036 ?auto_555037 ?auto_555038 ?auto_555039 )
      ( MAKE-12PILE ?auto_555030 ?auto_555031 ?auto_555032 ?auto_555033 ?auto_555034 ?auto_555035 ?auto_555036 ?auto_555037 ?auto_555038 ?auto_555039 ?auto_555040 ?auto_555041 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555080 - BLOCK
      ?auto_555081 - BLOCK
      ?auto_555082 - BLOCK
      ?auto_555083 - BLOCK
      ?auto_555084 - BLOCK
      ?auto_555085 - BLOCK
      ?auto_555086 - BLOCK
      ?auto_555087 - BLOCK
      ?auto_555088 - BLOCK
      ?auto_555089 - BLOCK
      ?auto_555090 - BLOCK
      ?auto_555091 - BLOCK
    )
    :vars
    (
      ?auto_555092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555091 ?auto_555092 ) ( ON-TABLE ?auto_555080 ) ( ON ?auto_555081 ?auto_555080 ) ( ON ?auto_555082 ?auto_555081 ) ( ON ?auto_555083 ?auto_555082 ) ( ON ?auto_555084 ?auto_555083 ) ( ON ?auto_555085 ?auto_555084 ) ( ON ?auto_555086 ?auto_555085 ) ( ON ?auto_555087 ?auto_555086 ) ( not ( = ?auto_555080 ?auto_555081 ) ) ( not ( = ?auto_555080 ?auto_555082 ) ) ( not ( = ?auto_555080 ?auto_555083 ) ) ( not ( = ?auto_555080 ?auto_555084 ) ) ( not ( = ?auto_555080 ?auto_555085 ) ) ( not ( = ?auto_555080 ?auto_555086 ) ) ( not ( = ?auto_555080 ?auto_555087 ) ) ( not ( = ?auto_555080 ?auto_555088 ) ) ( not ( = ?auto_555080 ?auto_555089 ) ) ( not ( = ?auto_555080 ?auto_555090 ) ) ( not ( = ?auto_555080 ?auto_555091 ) ) ( not ( = ?auto_555080 ?auto_555092 ) ) ( not ( = ?auto_555081 ?auto_555082 ) ) ( not ( = ?auto_555081 ?auto_555083 ) ) ( not ( = ?auto_555081 ?auto_555084 ) ) ( not ( = ?auto_555081 ?auto_555085 ) ) ( not ( = ?auto_555081 ?auto_555086 ) ) ( not ( = ?auto_555081 ?auto_555087 ) ) ( not ( = ?auto_555081 ?auto_555088 ) ) ( not ( = ?auto_555081 ?auto_555089 ) ) ( not ( = ?auto_555081 ?auto_555090 ) ) ( not ( = ?auto_555081 ?auto_555091 ) ) ( not ( = ?auto_555081 ?auto_555092 ) ) ( not ( = ?auto_555082 ?auto_555083 ) ) ( not ( = ?auto_555082 ?auto_555084 ) ) ( not ( = ?auto_555082 ?auto_555085 ) ) ( not ( = ?auto_555082 ?auto_555086 ) ) ( not ( = ?auto_555082 ?auto_555087 ) ) ( not ( = ?auto_555082 ?auto_555088 ) ) ( not ( = ?auto_555082 ?auto_555089 ) ) ( not ( = ?auto_555082 ?auto_555090 ) ) ( not ( = ?auto_555082 ?auto_555091 ) ) ( not ( = ?auto_555082 ?auto_555092 ) ) ( not ( = ?auto_555083 ?auto_555084 ) ) ( not ( = ?auto_555083 ?auto_555085 ) ) ( not ( = ?auto_555083 ?auto_555086 ) ) ( not ( = ?auto_555083 ?auto_555087 ) ) ( not ( = ?auto_555083 ?auto_555088 ) ) ( not ( = ?auto_555083 ?auto_555089 ) ) ( not ( = ?auto_555083 ?auto_555090 ) ) ( not ( = ?auto_555083 ?auto_555091 ) ) ( not ( = ?auto_555083 ?auto_555092 ) ) ( not ( = ?auto_555084 ?auto_555085 ) ) ( not ( = ?auto_555084 ?auto_555086 ) ) ( not ( = ?auto_555084 ?auto_555087 ) ) ( not ( = ?auto_555084 ?auto_555088 ) ) ( not ( = ?auto_555084 ?auto_555089 ) ) ( not ( = ?auto_555084 ?auto_555090 ) ) ( not ( = ?auto_555084 ?auto_555091 ) ) ( not ( = ?auto_555084 ?auto_555092 ) ) ( not ( = ?auto_555085 ?auto_555086 ) ) ( not ( = ?auto_555085 ?auto_555087 ) ) ( not ( = ?auto_555085 ?auto_555088 ) ) ( not ( = ?auto_555085 ?auto_555089 ) ) ( not ( = ?auto_555085 ?auto_555090 ) ) ( not ( = ?auto_555085 ?auto_555091 ) ) ( not ( = ?auto_555085 ?auto_555092 ) ) ( not ( = ?auto_555086 ?auto_555087 ) ) ( not ( = ?auto_555086 ?auto_555088 ) ) ( not ( = ?auto_555086 ?auto_555089 ) ) ( not ( = ?auto_555086 ?auto_555090 ) ) ( not ( = ?auto_555086 ?auto_555091 ) ) ( not ( = ?auto_555086 ?auto_555092 ) ) ( not ( = ?auto_555087 ?auto_555088 ) ) ( not ( = ?auto_555087 ?auto_555089 ) ) ( not ( = ?auto_555087 ?auto_555090 ) ) ( not ( = ?auto_555087 ?auto_555091 ) ) ( not ( = ?auto_555087 ?auto_555092 ) ) ( not ( = ?auto_555088 ?auto_555089 ) ) ( not ( = ?auto_555088 ?auto_555090 ) ) ( not ( = ?auto_555088 ?auto_555091 ) ) ( not ( = ?auto_555088 ?auto_555092 ) ) ( not ( = ?auto_555089 ?auto_555090 ) ) ( not ( = ?auto_555089 ?auto_555091 ) ) ( not ( = ?auto_555089 ?auto_555092 ) ) ( not ( = ?auto_555090 ?auto_555091 ) ) ( not ( = ?auto_555090 ?auto_555092 ) ) ( not ( = ?auto_555091 ?auto_555092 ) ) ( ON ?auto_555090 ?auto_555091 ) ( ON ?auto_555089 ?auto_555090 ) ( CLEAR ?auto_555087 ) ( ON ?auto_555088 ?auto_555089 ) ( CLEAR ?auto_555088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_555080 ?auto_555081 ?auto_555082 ?auto_555083 ?auto_555084 ?auto_555085 ?auto_555086 ?auto_555087 ?auto_555088 )
      ( MAKE-12PILE ?auto_555080 ?auto_555081 ?auto_555082 ?auto_555083 ?auto_555084 ?auto_555085 ?auto_555086 ?auto_555087 ?auto_555088 ?auto_555089 ?auto_555090 ?auto_555091 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555130 - BLOCK
      ?auto_555131 - BLOCK
      ?auto_555132 - BLOCK
      ?auto_555133 - BLOCK
      ?auto_555134 - BLOCK
      ?auto_555135 - BLOCK
      ?auto_555136 - BLOCK
      ?auto_555137 - BLOCK
      ?auto_555138 - BLOCK
      ?auto_555139 - BLOCK
      ?auto_555140 - BLOCK
      ?auto_555141 - BLOCK
    )
    :vars
    (
      ?auto_555142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555141 ?auto_555142 ) ( ON-TABLE ?auto_555130 ) ( ON ?auto_555131 ?auto_555130 ) ( ON ?auto_555132 ?auto_555131 ) ( ON ?auto_555133 ?auto_555132 ) ( ON ?auto_555134 ?auto_555133 ) ( ON ?auto_555135 ?auto_555134 ) ( ON ?auto_555136 ?auto_555135 ) ( not ( = ?auto_555130 ?auto_555131 ) ) ( not ( = ?auto_555130 ?auto_555132 ) ) ( not ( = ?auto_555130 ?auto_555133 ) ) ( not ( = ?auto_555130 ?auto_555134 ) ) ( not ( = ?auto_555130 ?auto_555135 ) ) ( not ( = ?auto_555130 ?auto_555136 ) ) ( not ( = ?auto_555130 ?auto_555137 ) ) ( not ( = ?auto_555130 ?auto_555138 ) ) ( not ( = ?auto_555130 ?auto_555139 ) ) ( not ( = ?auto_555130 ?auto_555140 ) ) ( not ( = ?auto_555130 ?auto_555141 ) ) ( not ( = ?auto_555130 ?auto_555142 ) ) ( not ( = ?auto_555131 ?auto_555132 ) ) ( not ( = ?auto_555131 ?auto_555133 ) ) ( not ( = ?auto_555131 ?auto_555134 ) ) ( not ( = ?auto_555131 ?auto_555135 ) ) ( not ( = ?auto_555131 ?auto_555136 ) ) ( not ( = ?auto_555131 ?auto_555137 ) ) ( not ( = ?auto_555131 ?auto_555138 ) ) ( not ( = ?auto_555131 ?auto_555139 ) ) ( not ( = ?auto_555131 ?auto_555140 ) ) ( not ( = ?auto_555131 ?auto_555141 ) ) ( not ( = ?auto_555131 ?auto_555142 ) ) ( not ( = ?auto_555132 ?auto_555133 ) ) ( not ( = ?auto_555132 ?auto_555134 ) ) ( not ( = ?auto_555132 ?auto_555135 ) ) ( not ( = ?auto_555132 ?auto_555136 ) ) ( not ( = ?auto_555132 ?auto_555137 ) ) ( not ( = ?auto_555132 ?auto_555138 ) ) ( not ( = ?auto_555132 ?auto_555139 ) ) ( not ( = ?auto_555132 ?auto_555140 ) ) ( not ( = ?auto_555132 ?auto_555141 ) ) ( not ( = ?auto_555132 ?auto_555142 ) ) ( not ( = ?auto_555133 ?auto_555134 ) ) ( not ( = ?auto_555133 ?auto_555135 ) ) ( not ( = ?auto_555133 ?auto_555136 ) ) ( not ( = ?auto_555133 ?auto_555137 ) ) ( not ( = ?auto_555133 ?auto_555138 ) ) ( not ( = ?auto_555133 ?auto_555139 ) ) ( not ( = ?auto_555133 ?auto_555140 ) ) ( not ( = ?auto_555133 ?auto_555141 ) ) ( not ( = ?auto_555133 ?auto_555142 ) ) ( not ( = ?auto_555134 ?auto_555135 ) ) ( not ( = ?auto_555134 ?auto_555136 ) ) ( not ( = ?auto_555134 ?auto_555137 ) ) ( not ( = ?auto_555134 ?auto_555138 ) ) ( not ( = ?auto_555134 ?auto_555139 ) ) ( not ( = ?auto_555134 ?auto_555140 ) ) ( not ( = ?auto_555134 ?auto_555141 ) ) ( not ( = ?auto_555134 ?auto_555142 ) ) ( not ( = ?auto_555135 ?auto_555136 ) ) ( not ( = ?auto_555135 ?auto_555137 ) ) ( not ( = ?auto_555135 ?auto_555138 ) ) ( not ( = ?auto_555135 ?auto_555139 ) ) ( not ( = ?auto_555135 ?auto_555140 ) ) ( not ( = ?auto_555135 ?auto_555141 ) ) ( not ( = ?auto_555135 ?auto_555142 ) ) ( not ( = ?auto_555136 ?auto_555137 ) ) ( not ( = ?auto_555136 ?auto_555138 ) ) ( not ( = ?auto_555136 ?auto_555139 ) ) ( not ( = ?auto_555136 ?auto_555140 ) ) ( not ( = ?auto_555136 ?auto_555141 ) ) ( not ( = ?auto_555136 ?auto_555142 ) ) ( not ( = ?auto_555137 ?auto_555138 ) ) ( not ( = ?auto_555137 ?auto_555139 ) ) ( not ( = ?auto_555137 ?auto_555140 ) ) ( not ( = ?auto_555137 ?auto_555141 ) ) ( not ( = ?auto_555137 ?auto_555142 ) ) ( not ( = ?auto_555138 ?auto_555139 ) ) ( not ( = ?auto_555138 ?auto_555140 ) ) ( not ( = ?auto_555138 ?auto_555141 ) ) ( not ( = ?auto_555138 ?auto_555142 ) ) ( not ( = ?auto_555139 ?auto_555140 ) ) ( not ( = ?auto_555139 ?auto_555141 ) ) ( not ( = ?auto_555139 ?auto_555142 ) ) ( not ( = ?auto_555140 ?auto_555141 ) ) ( not ( = ?auto_555140 ?auto_555142 ) ) ( not ( = ?auto_555141 ?auto_555142 ) ) ( ON ?auto_555140 ?auto_555141 ) ( ON ?auto_555139 ?auto_555140 ) ( ON ?auto_555138 ?auto_555139 ) ( CLEAR ?auto_555136 ) ( ON ?auto_555137 ?auto_555138 ) ( CLEAR ?auto_555137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_555130 ?auto_555131 ?auto_555132 ?auto_555133 ?auto_555134 ?auto_555135 ?auto_555136 ?auto_555137 )
      ( MAKE-12PILE ?auto_555130 ?auto_555131 ?auto_555132 ?auto_555133 ?auto_555134 ?auto_555135 ?auto_555136 ?auto_555137 ?auto_555138 ?auto_555139 ?auto_555140 ?auto_555141 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555180 - BLOCK
      ?auto_555181 - BLOCK
      ?auto_555182 - BLOCK
      ?auto_555183 - BLOCK
      ?auto_555184 - BLOCK
      ?auto_555185 - BLOCK
      ?auto_555186 - BLOCK
      ?auto_555187 - BLOCK
      ?auto_555188 - BLOCK
      ?auto_555189 - BLOCK
      ?auto_555190 - BLOCK
      ?auto_555191 - BLOCK
    )
    :vars
    (
      ?auto_555192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555191 ?auto_555192 ) ( ON-TABLE ?auto_555180 ) ( ON ?auto_555181 ?auto_555180 ) ( ON ?auto_555182 ?auto_555181 ) ( ON ?auto_555183 ?auto_555182 ) ( ON ?auto_555184 ?auto_555183 ) ( ON ?auto_555185 ?auto_555184 ) ( not ( = ?auto_555180 ?auto_555181 ) ) ( not ( = ?auto_555180 ?auto_555182 ) ) ( not ( = ?auto_555180 ?auto_555183 ) ) ( not ( = ?auto_555180 ?auto_555184 ) ) ( not ( = ?auto_555180 ?auto_555185 ) ) ( not ( = ?auto_555180 ?auto_555186 ) ) ( not ( = ?auto_555180 ?auto_555187 ) ) ( not ( = ?auto_555180 ?auto_555188 ) ) ( not ( = ?auto_555180 ?auto_555189 ) ) ( not ( = ?auto_555180 ?auto_555190 ) ) ( not ( = ?auto_555180 ?auto_555191 ) ) ( not ( = ?auto_555180 ?auto_555192 ) ) ( not ( = ?auto_555181 ?auto_555182 ) ) ( not ( = ?auto_555181 ?auto_555183 ) ) ( not ( = ?auto_555181 ?auto_555184 ) ) ( not ( = ?auto_555181 ?auto_555185 ) ) ( not ( = ?auto_555181 ?auto_555186 ) ) ( not ( = ?auto_555181 ?auto_555187 ) ) ( not ( = ?auto_555181 ?auto_555188 ) ) ( not ( = ?auto_555181 ?auto_555189 ) ) ( not ( = ?auto_555181 ?auto_555190 ) ) ( not ( = ?auto_555181 ?auto_555191 ) ) ( not ( = ?auto_555181 ?auto_555192 ) ) ( not ( = ?auto_555182 ?auto_555183 ) ) ( not ( = ?auto_555182 ?auto_555184 ) ) ( not ( = ?auto_555182 ?auto_555185 ) ) ( not ( = ?auto_555182 ?auto_555186 ) ) ( not ( = ?auto_555182 ?auto_555187 ) ) ( not ( = ?auto_555182 ?auto_555188 ) ) ( not ( = ?auto_555182 ?auto_555189 ) ) ( not ( = ?auto_555182 ?auto_555190 ) ) ( not ( = ?auto_555182 ?auto_555191 ) ) ( not ( = ?auto_555182 ?auto_555192 ) ) ( not ( = ?auto_555183 ?auto_555184 ) ) ( not ( = ?auto_555183 ?auto_555185 ) ) ( not ( = ?auto_555183 ?auto_555186 ) ) ( not ( = ?auto_555183 ?auto_555187 ) ) ( not ( = ?auto_555183 ?auto_555188 ) ) ( not ( = ?auto_555183 ?auto_555189 ) ) ( not ( = ?auto_555183 ?auto_555190 ) ) ( not ( = ?auto_555183 ?auto_555191 ) ) ( not ( = ?auto_555183 ?auto_555192 ) ) ( not ( = ?auto_555184 ?auto_555185 ) ) ( not ( = ?auto_555184 ?auto_555186 ) ) ( not ( = ?auto_555184 ?auto_555187 ) ) ( not ( = ?auto_555184 ?auto_555188 ) ) ( not ( = ?auto_555184 ?auto_555189 ) ) ( not ( = ?auto_555184 ?auto_555190 ) ) ( not ( = ?auto_555184 ?auto_555191 ) ) ( not ( = ?auto_555184 ?auto_555192 ) ) ( not ( = ?auto_555185 ?auto_555186 ) ) ( not ( = ?auto_555185 ?auto_555187 ) ) ( not ( = ?auto_555185 ?auto_555188 ) ) ( not ( = ?auto_555185 ?auto_555189 ) ) ( not ( = ?auto_555185 ?auto_555190 ) ) ( not ( = ?auto_555185 ?auto_555191 ) ) ( not ( = ?auto_555185 ?auto_555192 ) ) ( not ( = ?auto_555186 ?auto_555187 ) ) ( not ( = ?auto_555186 ?auto_555188 ) ) ( not ( = ?auto_555186 ?auto_555189 ) ) ( not ( = ?auto_555186 ?auto_555190 ) ) ( not ( = ?auto_555186 ?auto_555191 ) ) ( not ( = ?auto_555186 ?auto_555192 ) ) ( not ( = ?auto_555187 ?auto_555188 ) ) ( not ( = ?auto_555187 ?auto_555189 ) ) ( not ( = ?auto_555187 ?auto_555190 ) ) ( not ( = ?auto_555187 ?auto_555191 ) ) ( not ( = ?auto_555187 ?auto_555192 ) ) ( not ( = ?auto_555188 ?auto_555189 ) ) ( not ( = ?auto_555188 ?auto_555190 ) ) ( not ( = ?auto_555188 ?auto_555191 ) ) ( not ( = ?auto_555188 ?auto_555192 ) ) ( not ( = ?auto_555189 ?auto_555190 ) ) ( not ( = ?auto_555189 ?auto_555191 ) ) ( not ( = ?auto_555189 ?auto_555192 ) ) ( not ( = ?auto_555190 ?auto_555191 ) ) ( not ( = ?auto_555190 ?auto_555192 ) ) ( not ( = ?auto_555191 ?auto_555192 ) ) ( ON ?auto_555190 ?auto_555191 ) ( ON ?auto_555189 ?auto_555190 ) ( ON ?auto_555188 ?auto_555189 ) ( ON ?auto_555187 ?auto_555188 ) ( CLEAR ?auto_555185 ) ( ON ?auto_555186 ?auto_555187 ) ( CLEAR ?auto_555186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_555180 ?auto_555181 ?auto_555182 ?auto_555183 ?auto_555184 ?auto_555185 ?auto_555186 )
      ( MAKE-12PILE ?auto_555180 ?auto_555181 ?auto_555182 ?auto_555183 ?auto_555184 ?auto_555185 ?auto_555186 ?auto_555187 ?auto_555188 ?auto_555189 ?auto_555190 ?auto_555191 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555230 - BLOCK
      ?auto_555231 - BLOCK
      ?auto_555232 - BLOCK
      ?auto_555233 - BLOCK
      ?auto_555234 - BLOCK
      ?auto_555235 - BLOCK
      ?auto_555236 - BLOCK
      ?auto_555237 - BLOCK
      ?auto_555238 - BLOCK
      ?auto_555239 - BLOCK
      ?auto_555240 - BLOCK
      ?auto_555241 - BLOCK
    )
    :vars
    (
      ?auto_555242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555241 ?auto_555242 ) ( ON-TABLE ?auto_555230 ) ( ON ?auto_555231 ?auto_555230 ) ( ON ?auto_555232 ?auto_555231 ) ( ON ?auto_555233 ?auto_555232 ) ( ON ?auto_555234 ?auto_555233 ) ( not ( = ?auto_555230 ?auto_555231 ) ) ( not ( = ?auto_555230 ?auto_555232 ) ) ( not ( = ?auto_555230 ?auto_555233 ) ) ( not ( = ?auto_555230 ?auto_555234 ) ) ( not ( = ?auto_555230 ?auto_555235 ) ) ( not ( = ?auto_555230 ?auto_555236 ) ) ( not ( = ?auto_555230 ?auto_555237 ) ) ( not ( = ?auto_555230 ?auto_555238 ) ) ( not ( = ?auto_555230 ?auto_555239 ) ) ( not ( = ?auto_555230 ?auto_555240 ) ) ( not ( = ?auto_555230 ?auto_555241 ) ) ( not ( = ?auto_555230 ?auto_555242 ) ) ( not ( = ?auto_555231 ?auto_555232 ) ) ( not ( = ?auto_555231 ?auto_555233 ) ) ( not ( = ?auto_555231 ?auto_555234 ) ) ( not ( = ?auto_555231 ?auto_555235 ) ) ( not ( = ?auto_555231 ?auto_555236 ) ) ( not ( = ?auto_555231 ?auto_555237 ) ) ( not ( = ?auto_555231 ?auto_555238 ) ) ( not ( = ?auto_555231 ?auto_555239 ) ) ( not ( = ?auto_555231 ?auto_555240 ) ) ( not ( = ?auto_555231 ?auto_555241 ) ) ( not ( = ?auto_555231 ?auto_555242 ) ) ( not ( = ?auto_555232 ?auto_555233 ) ) ( not ( = ?auto_555232 ?auto_555234 ) ) ( not ( = ?auto_555232 ?auto_555235 ) ) ( not ( = ?auto_555232 ?auto_555236 ) ) ( not ( = ?auto_555232 ?auto_555237 ) ) ( not ( = ?auto_555232 ?auto_555238 ) ) ( not ( = ?auto_555232 ?auto_555239 ) ) ( not ( = ?auto_555232 ?auto_555240 ) ) ( not ( = ?auto_555232 ?auto_555241 ) ) ( not ( = ?auto_555232 ?auto_555242 ) ) ( not ( = ?auto_555233 ?auto_555234 ) ) ( not ( = ?auto_555233 ?auto_555235 ) ) ( not ( = ?auto_555233 ?auto_555236 ) ) ( not ( = ?auto_555233 ?auto_555237 ) ) ( not ( = ?auto_555233 ?auto_555238 ) ) ( not ( = ?auto_555233 ?auto_555239 ) ) ( not ( = ?auto_555233 ?auto_555240 ) ) ( not ( = ?auto_555233 ?auto_555241 ) ) ( not ( = ?auto_555233 ?auto_555242 ) ) ( not ( = ?auto_555234 ?auto_555235 ) ) ( not ( = ?auto_555234 ?auto_555236 ) ) ( not ( = ?auto_555234 ?auto_555237 ) ) ( not ( = ?auto_555234 ?auto_555238 ) ) ( not ( = ?auto_555234 ?auto_555239 ) ) ( not ( = ?auto_555234 ?auto_555240 ) ) ( not ( = ?auto_555234 ?auto_555241 ) ) ( not ( = ?auto_555234 ?auto_555242 ) ) ( not ( = ?auto_555235 ?auto_555236 ) ) ( not ( = ?auto_555235 ?auto_555237 ) ) ( not ( = ?auto_555235 ?auto_555238 ) ) ( not ( = ?auto_555235 ?auto_555239 ) ) ( not ( = ?auto_555235 ?auto_555240 ) ) ( not ( = ?auto_555235 ?auto_555241 ) ) ( not ( = ?auto_555235 ?auto_555242 ) ) ( not ( = ?auto_555236 ?auto_555237 ) ) ( not ( = ?auto_555236 ?auto_555238 ) ) ( not ( = ?auto_555236 ?auto_555239 ) ) ( not ( = ?auto_555236 ?auto_555240 ) ) ( not ( = ?auto_555236 ?auto_555241 ) ) ( not ( = ?auto_555236 ?auto_555242 ) ) ( not ( = ?auto_555237 ?auto_555238 ) ) ( not ( = ?auto_555237 ?auto_555239 ) ) ( not ( = ?auto_555237 ?auto_555240 ) ) ( not ( = ?auto_555237 ?auto_555241 ) ) ( not ( = ?auto_555237 ?auto_555242 ) ) ( not ( = ?auto_555238 ?auto_555239 ) ) ( not ( = ?auto_555238 ?auto_555240 ) ) ( not ( = ?auto_555238 ?auto_555241 ) ) ( not ( = ?auto_555238 ?auto_555242 ) ) ( not ( = ?auto_555239 ?auto_555240 ) ) ( not ( = ?auto_555239 ?auto_555241 ) ) ( not ( = ?auto_555239 ?auto_555242 ) ) ( not ( = ?auto_555240 ?auto_555241 ) ) ( not ( = ?auto_555240 ?auto_555242 ) ) ( not ( = ?auto_555241 ?auto_555242 ) ) ( ON ?auto_555240 ?auto_555241 ) ( ON ?auto_555239 ?auto_555240 ) ( ON ?auto_555238 ?auto_555239 ) ( ON ?auto_555237 ?auto_555238 ) ( ON ?auto_555236 ?auto_555237 ) ( CLEAR ?auto_555234 ) ( ON ?auto_555235 ?auto_555236 ) ( CLEAR ?auto_555235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_555230 ?auto_555231 ?auto_555232 ?auto_555233 ?auto_555234 ?auto_555235 )
      ( MAKE-12PILE ?auto_555230 ?auto_555231 ?auto_555232 ?auto_555233 ?auto_555234 ?auto_555235 ?auto_555236 ?auto_555237 ?auto_555238 ?auto_555239 ?auto_555240 ?auto_555241 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555280 - BLOCK
      ?auto_555281 - BLOCK
      ?auto_555282 - BLOCK
      ?auto_555283 - BLOCK
      ?auto_555284 - BLOCK
      ?auto_555285 - BLOCK
      ?auto_555286 - BLOCK
      ?auto_555287 - BLOCK
      ?auto_555288 - BLOCK
      ?auto_555289 - BLOCK
      ?auto_555290 - BLOCK
      ?auto_555291 - BLOCK
    )
    :vars
    (
      ?auto_555292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555291 ?auto_555292 ) ( ON-TABLE ?auto_555280 ) ( ON ?auto_555281 ?auto_555280 ) ( ON ?auto_555282 ?auto_555281 ) ( ON ?auto_555283 ?auto_555282 ) ( not ( = ?auto_555280 ?auto_555281 ) ) ( not ( = ?auto_555280 ?auto_555282 ) ) ( not ( = ?auto_555280 ?auto_555283 ) ) ( not ( = ?auto_555280 ?auto_555284 ) ) ( not ( = ?auto_555280 ?auto_555285 ) ) ( not ( = ?auto_555280 ?auto_555286 ) ) ( not ( = ?auto_555280 ?auto_555287 ) ) ( not ( = ?auto_555280 ?auto_555288 ) ) ( not ( = ?auto_555280 ?auto_555289 ) ) ( not ( = ?auto_555280 ?auto_555290 ) ) ( not ( = ?auto_555280 ?auto_555291 ) ) ( not ( = ?auto_555280 ?auto_555292 ) ) ( not ( = ?auto_555281 ?auto_555282 ) ) ( not ( = ?auto_555281 ?auto_555283 ) ) ( not ( = ?auto_555281 ?auto_555284 ) ) ( not ( = ?auto_555281 ?auto_555285 ) ) ( not ( = ?auto_555281 ?auto_555286 ) ) ( not ( = ?auto_555281 ?auto_555287 ) ) ( not ( = ?auto_555281 ?auto_555288 ) ) ( not ( = ?auto_555281 ?auto_555289 ) ) ( not ( = ?auto_555281 ?auto_555290 ) ) ( not ( = ?auto_555281 ?auto_555291 ) ) ( not ( = ?auto_555281 ?auto_555292 ) ) ( not ( = ?auto_555282 ?auto_555283 ) ) ( not ( = ?auto_555282 ?auto_555284 ) ) ( not ( = ?auto_555282 ?auto_555285 ) ) ( not ( = ?auto_555282 ?auto_555286 ) ) ( not ( = ?auto_555282 ?auto_555287 ) ) ( not ( = ?auto_555282 ?auto_555288 ) ) ( not ( = ?auto_555282 ?auto_555289 ) ) ( not ( = ?auto_555282 ?auto_555290 ) ) ( not ( = ?auto_555282 ?auto_555291 ) ) ( not ( = ?auto_555282 ?auto_555292 ) ) ( not ( = ?auto_555283 ?auto_555284 ) ) ( not ( = ?auto_555283 ?auto_555285 ) ) ( not ( = ?auto_555283 ?auto_555286 ) ) ( not ( = ?auto_555283 ?auto_555287 ) ) ( not ( = ?auto_555283 ?auto_555288 ) ) ( not ( = ?auto_555283 ?auto_555289 ) ) ( not ( = ?auto_555283 ?auto_555290 ) ) ( not ( = ?auto_555283 ?auto_555291 ) ) ( not ( = ?auto_555283 ?auto_555292 ) ) ( not ( = ?auto_555284 ?auto_555285 ) ) ( not ( = ?auto_555284 ?auto_555286 ) ) ( not ( = ?auto_555284 ?auto_555287 ) ) ( not ( = ?auto_555284 ?auto_555288 ) ) ( not ( = ?auto_555284 ?auto_555289 ) ) ( not ( = ?auto_555284 ?auto_555290 ) ) ( not ( = ?auto_555284 ?auto_555291 ) ) ( not ( = ?auto_555284 ?auto_555292 ) ) ( not ( = ?auto_555285 ?auto_555286 ) ) ( not ( = ?auto_555285 ?auto_555287 ) ) ( not ( = ?auto_555285 ?auto_555288 ) ) ( not ( = ?auto_555285 ?auto_555289 ) ) ( not ( = ?auto_555285 ?auto_555290 ) ) ( not ( = ?auto_555285 ?auto_555291 ) ) ( not ( = ?auto_555285 ?auto_555292 ) ) ( not ( = ?auto_555286 ?auto_555287 ) ) ( not ( = ?auto_555286 ?auto_555288 ) ) ( not ( = ?auto_555286 ?auto_555289 ) ) ( not ( = ?auto_555286 ?auto_555290 ) ) ( not ( = ?auto_555286 ?auto_555291 ) ) ( not ( = ?auto_555286 ?auto_555292 ) ) ( not ( = ?auto_555287 ?auto_555288 ) ) ( not ( = ?auto_555287 ?auto_555289 ) ) ( not ( = ?auto_555287 ?auto_555290 ) ) ( not ( = ?auto_555287 ?auto_555291 ) ) ( not ( = ?auto_555287 ?auto_555292 ) ) ( not ( = ?auto_555288 ?auto_555289 ) ) ( not ( = ?auto_555288 ?auto_555290 ) ) ( not ( = ?auto_555288 ?auto_555291 ) ) ( not ( = ?auto_555288 ?auto_555292 ) ) ( not ( = ?auto_555289 ?auto_555290 ) ) ( not ( = ?auto_555289 ?auto_555291 ) ) ( not ( = ?auto_555289 ?auto_555292 ) ) ( not ( = ?auto_555290 ?auto_555291 ) ) ( not ( = ?auto_555290 ?auto_555292 ) ) ( not ( = ?auto_555291 ?auto_555292 ) ) ( ON ?auto_555290 ?auto_555291 ) ( ON ?auto_555289 ?auto_555290 ) ( ON ?auto_555288 ?auto_555289 ) ( ON ?auto_555287 ?auto_555288 ) ( ON ?auto_555286 ?auto_555287 ) ( ON ?auto_555285 ?auto_555286 ) ( CLEAR ?auto_555283 ) ( ON ?auto_555284 ?auto_555285 ) ( CLEAR ?auto_555284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_555280 ?auto_555281 ?auto_555282 ?auto_555283 ?auto_555284 )
      ( MAKE-12PILE ?auto_555280 ?auto_555281 ?auto_555282 ?auto_555283 ?auto_555284 ?auto_555285 ?auto_555286 ?auto_555287 ?auto_555288 ?auto_555289 ?auto_555290 ?auto_555291 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555330 - BLOCK
      ?auto_555331 - BLOCK
      ?auto_555332 - BLOCK
      ?auto_555333 - BLOCK
      ?auto_555334 - BLOCK
      ?auto_555335 - BLOCK
      ?auto_555336 - BLOCK
      ?auto_555337 - BLOCK
      ?auto_555338 - BLOCK
      ?auto_555339 - BLOCK
      ?auto_555340 - BLOCK
      ?auto_555341 - BLOCK
    )
    :vars
    (
      ?auto_555342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555341 ?auto_555342 ) ( ON-TABLE ?auto_555330 ) ( ON ?auto_555331 ?auto_555330 ) ( ON ?auto_555332 ?auto_555331 ) ( not ( = ?auto_555330 ?auto_555331 ) ) ( not ( = ?auto_555330 ?auto_555332 ) ) ( not ( = ?auto_555330 ?auto_555333 ) ) ( not ( = ?auto_555330 ?auto_555334 ) ) ( not ( = ?auto_555330 ?auto_555335 ) ) ( not ( = ?auto_555330 ?auto_555336 ) ) ( not ( = ?auto_555330 ?auto_555337 ) ) ( not ( = ?auto_555330 ?auto_555338 ) ) ( not ( = ?auto_555330 ?auto_555339 ) ) ( not ( = ?auto_555330 ?auto_555340 ) ) ( not ( = ?auto_555330 ?auto_555341 ) ) ( not ( = ?auto_555330 ?auto_555342 ) ) ( not ( = ?auto_555331 ?auto_555332 ) ) ( not ( = ?auto_555331 ?auto_555333 ) ) ( not ( = ?auto_555331 ?auto_555334 ) ) ( not ( = ?auto_555331 ?auto_555335 ) ) ( not ( = ?auto_555331 ?auto_555336 ) ) ( not ( = ?auto_555331 ?auto_555337 ) ) ( not ( = ?auto_555331 ?auto_555338 ) ) ( not ( = ?auto_555331 ?auto_555339 ) ) ( not ( = ?auto_555331 ?auto_555340 ) ) ( not ( = ?auto_555331 ?auto_555341 ) ) ( not ( = ?auto_555331 ?auto_555342 ) ) ( not ( = ?auto_555332 ?auto_555333 ) ) ( not ( = ?auto_555332 ?auto_555334 ) ) ( not ( = ?auto_555332 ?auto_555335 ) ) ( not ( = ?auto_555332 ?auto_555336 ) ) ( not ( = ?auto_555332 ?auto_555337 ) ) ( not ( = ?auto_555332 ?auto_555338 ) ) ( not ( = ?auto_555332 ?auto_555339 ) ) ( not ( = ?auto_555332 ?auto_555340 ) ) ( not ( = ?auto_555332 ?auto_555341 ) ) ( not ( = ?auto_555332 ?auto_555342 ) ) ( not ( = ?auto_555333 ?auto_555334 ) ) ( not ( = ?auto_555333 ?auto_555335 ) ) ( not ( = ?auto_555333 ?auto_555336 ) ) ( not ( = ?auto_555333 ?auto_555337 ) ) ( not ( = ?auto_555333 ?auto_555338 ) ) ( not ( = ?auto_555333 ?auto_555339 ) ) ( not ( = ?auto_555333 ?auto_555340 ) ) ( not ( = ?auto_555333 ?auto_555341 ) ) ( not ( = ?auto_555333 ?auto_555342 ) ) ( not ( = ?auto_555334 ?auto_555335 ) ) ( not ( = ?auto_555334 ?auto_555336 ) ) ( not ( = ?auto_555334 ?auto_555337 ) ) ( not ( = ?auto_555334 ?auto_555338 ) ) ( not ( = ?auto_555334 ?auto_555339 ) ) ( not ( = ?auto_555334 ?auto_555340 ) ) ( not ( = ?auto_555334 ?auto_555341 ) ) ( not ( = ?auto_555334 ?auto_555342 ) ) ( not ( = ?auto_555335 ?auto_555336 ) ) ( not ( = ?auto_555335 ?auto_555337 ) ) ( not ( = ?auto_555335 ?auto_555338 ) ) ( not ( = ?auto_555335 ?auto_555339 ) ) ( not ( = ?auto_555335 ?auto_555340 ) ) ( not ( = ?auto_555335 ?auto_555341 ) ) ( not ( = ?auto_555335 ?auto_555342 ) ) ( not ( = ?auto_555336 ?auto_555337 ) ) ( not ( = ?auto_555336 ?auto_555338 ) ) ( not ( = ?auto_555336 ?auto_555339 ) ) ( not ( = ?auto_555336 ?auto_555340 ) ) ( not ( = ?auto_555336 ?auto_555341 ) ) ( not ( = ?auto_555336 ?auto_555342 ) ) ( not ( = ?auto_555337 ?auto_555338 ) ) ( not ( = ?auto_555337 ?auto_555339 ) ) ( not ( = ?auto_555337 ?auto_555340 ) ) ( not ( = ?auto_555337 ?auto_555341 ) ) ( not ( = ?auto_555337 ?auto_555342 ) ) ( not ( = ?auto_555338 ?auto_555339 ) ) ( not ( = ?auto_555338 ?auto_555340 ) ) ( not ( = ?auto_555338 ?auto_555341 ) ) ( not ( = ?auto_555338 ?auto_555342 ) ) ( not ( = ?auto_555339 ?auto_555340 ) ) ( not ( = ?auto_555339 ?auto_555341 ) ) ( not ( = ?auto_555339 ?auto_555342 ) ) ( not ( = ?auto_555340 ?auto_555341 ) ) ( not ( = ?auto_555340 ?auto_555342 ) ) ( not ( = ?auto_555341 ?auto_555342 ) ) ( ON ?auto_555340 ?auto_555341 ) ( ON ?auto_555339 ?auto_555340 ) ( ON ?auto_555338 ?auto_555339 ) ( ON ?auto_555337 ?auto_555338 ) ( ON ?auto_555336 ?auto_555337 ) ( ON ?auto_555335 ?auto_555336 ) ( ON ?auto_555334 ?auto_555335 ) ( CLEAR ?auto_555332 ) ( ON ?auto_555333 ?auto_555334 ) ( CLEAR ?auto_555333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_555330 ?auto_555331 ?auto_555332 ?auto_555333 )
      ( MAKE-12PILE ?auto_555330 ?auto_555331 ?auto_555332 ?auto_555333 ?auto_555334 ?auto_555335 ?auto_555336 ?auto_555337 ?auto_555338 ?auto_555339 ?auto_555340 ?auto_555341 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555380 - BLOCK
      ?auto_555381 - BLOCK
      ?auto_555382 - BLOCK
      ?auto_555383 - BLOCK
      ?auto_555384 - BLOCK
      ?auto_555385 - BLOCK
      ?auto_555386 - BLOCK
      ?auto_555387 - BLOCK
      ?auto_555388 - BLOCK
      ?auto_555389 - BLOCK
      ?auto_555390 - BLOCK
      ?auto_555391 - BLOCK
    )
    :vars
    (
      ?auto_555392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555391 ?auto_555392 ) ( ON-TABLE ?auto_555380 ) ( ON ?auto_555381 ?auto_555380 ) ( not ( = ?auto_555380 ?auto_555381 ) ) ( not ( = ?auto_555380 ?auto_555382 ) ) ( not ( = ?auto_555380 ?auto_555383 ) ) ( not ( = ?auto_555380 ?auto_555384 ) ) ( not ( = ?auto_555380 ?auto_555385 ) ) ( not ( = ?auto_555380 ?auto_555386 ) ) ( not ( = ?auto_555380 ?auto_555387 ) ) ( not ( = ?auto_555380 ?auto_555388 ) ) ( not ( = ?auto_555380 ?auto_555389 ) ) ( not ( = ?auto_555380 ?auto_555390 ) ) ( not ( = ?auto_555380 ?auto_555391 ) ) ( not ( = ?auto_555380 ?auto_555392 ) ) ( not ( = ?auto_555381 ?auto_555382 ) ) ( not ( = ?auto_555381 ?auto_555383 ) ) ( not ( = ?auto_555381 ?auto_555384 ) ) ( not ( = ?auto_555381 ?auto_555385 ) ) ( not ( = ?auto_555381 ?auto_555386 ) ) ( not ( = ?auto_555381 ?auto_555387 ) ) ( not ( = ?auto_555381 ?auto_555388 ) ) ( not ( = ?auto_555381 ?auto_555389 ) ) ( not ( = ?auto_555381 ?auto_555390 ) ) ( not ( = ?auto_555381 ?auto_555391 ) ) ( not ( = ?auto_555381 ?auto_555392 ) ) ( not ( = ?auto_555382 ?auto_555383 ) ) ( not ( = ?auto_555382 ?auto_555384 ) ) ( not ( = ?auto_555382 ?auto_555385 ) ) ( not ( = ?auto_555382 ?auto_555386 ) ) ( not ( = ?auto_555382 ?auto_555387 ) ) ( not ( = ?auto_555382 ?auto_555388 ) ) ( not ( = ?auto_555382 ?auto_555389 ) ) ( not ( = ?auto_555382 ?auto_555390 ) ) ( not ( = ?auto_555382 ?auto_555391 ) ) ( not ( = ?auto_555382 ?auto_555392 ) ) ( not ( = ?auto_555383 ?auto_555384 ) ) ( not ( = ?auto_555383 ?auto_555385 ) ) ( not ( = ?auto_555383 ?auto_555386 ) ) ( not ( = ?auto_555383 ?auto_555387 ) ) ( not ( = ?auto_555383 ?auto_555388 ) ) ( not ( = ?auto_555383 ?auto_555389 ) ) ( not ( = ?auto_555383 ?auto_555390 ) ) ( not ( = ?auto_555383 ?auto_555391 ) ) ( not ( = ?auto_555383 ?auto_555392 ) ) ( not ( = ?auto_555384 ?auto_555385 ) ) ( not ( = ?auto_555384 ?auto_555386 ) ) ( not ( = ?auto_555384 ?auto_555387 ) ) ( not ( = ?auto_555384 ?auto_555388 ) ) ( not ( = ?auto_555384 ?auto_555389 ) ) ( not ( = ?auto_555384 ?auto_555390 ) ) ( not ( = ?auto_555384 ?auto_555391 ) ) ( not ( = ?auto_555384 ?auto_555392 ) ) ( not ( = ?auto_555385 ?auto_555386 ) ) ( not ( = ?auto_555385 ?auto_555387 ) ) ( not ( = ?auto_555385 ?auto_555388 ) ) ( not ( = ?auto_555385 ?auto_555389 ) ) ( not ( = ?auto_555385 ?auto_555390 ) ) ( not ( = ?auto_555385 ?auto_555391 ) ) ( not ( = ?auto_555385 ?auto_555392 ) ) ( not ( = ?auto_555386 ?auto_555387 ) ) ( not ( = ?auto_555386 ?auto_555388 ) ) ( not ( = ?auto_555386 ?auto_555389 ) ) ( not ( = ?auto_555386 ?auto_555390 ) ) ( not ( = ?auto_555386 ?auto_555391 ) ) ( not ( = ?auto_555386 ?auto_555392 ) ) ( not ( = ?auto_555387 ?auto_555388 ) ) ( not ( = ?auto_555387 ?auto_555389 ) ) ( not ( = ?auto_555387 ?auto_555390 ) ) ( not ( = ?auto_555387 ?auto_555391 ) ) ( not ( = ?auto_555387 ?auto_555392 ) ) ( not ( = ?auto_555388 ?auto_555389 ) ) ( not ( = ?auto_555388 ?auto_555390 ) ) ( not ( = ?auto_555388 ?auto_555391 ) ) ( not ( = ?auto_555388 ?auto_555392 ) ) ( not ( = ?auto_555389 ?auto_555390 ) ) ( not ( = ?auto_555389 ?auto_555391 ) ) ( not ( = ?auto_555389 ?auto_555392 ) ) ( not ( = ?auto_555390 ?auto_555391 ) ) ( not ( = ?auto_555390 ?auto_555392 ) ) ( not ( = ?auto_555391 ?auto_555392 ) ) ( ON ?auto_555390 ?auto_555391 ) ( ON ?auto_555389 ?auto_555390 ) ( ON ?auto_555388 ?auto_555389 ) ( ON ?auto_555387 ?auto_555388 ) ( ON ?auto_555386 ?auto_555387 ) ( ON ?auto_555385 ?auto_555386 ) ( ON ?auto_555384 ?auto_555385 ) ( ON ?auto_555383 ?auto_555384 ) ( CLEAR ?auto_555381 ) ( ON ?auto_555382 ?auto_555383 ) ( CLEAR ?auto_555382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_555380 ?auto_555381 ?auto_555382 )
      ( MAKE-12PILE ?auto_555380 ?auto_555381 ?auto_555382 ?auto_555383 ?auto_555384 ?auto_555385 ?auto_555386 ?auto_555387 ?auto_555388 ?auto_555389 ?auto_555390 ?auto_555391 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555430 - BLOCK
      ?auto_555431 - BLOCK
      ?auto_555432 - BLOCK
      ?auto_555433 - BLOCK
      ?auto_555434 - BLOCK
      ?auto_555435 - BLOCK
      ?auto_555436 - BLOCK
      ?auto_555437 - BLOCK
      ?auto_555438 - BLOCK
      ?auto_555439 - BLOCK
      ?auto_555440 - BLOCK
      ?auto_555441 - BLOCK
    )
    :vars
    (
      ?auto_555442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555441 ?auto_555442 ) ( ON-TABLE ?auto_555430 ) ( not ( = ?auto_555430 ?auto_555431 ) ) ( not ( = ?auto_555430 ?auto_555432 ) ) ( not ( = ?auto_555430 ?auto_555433 ) ) ( not ( = ?auto_555430 ?auto_555434 ) ) ( not ( = ?auto_555430 ?auto_555435 ) ) ( not ( = ?auto_555430 ?auto_555436 ) ) ( not ( = ?auto_555430 ?auto_555437 ) ) ( not ( = ?auto_555430 ?auto_555438 ) ) ( not ( = ?auto_555430 ?auto_555439 ) ) ( not ( = ?auto_555430 ?auto_555440 ) ) ( not ( = ?auto_555430 ?auto_555441 ) ) ( not ( = ?auto_555430 ?auto_555442 ) ) ( not ( = ?auto_555431 ?auto_555432 ) ) ( not ( = ?auto_555431 ?auto_555433 ) ) ( not ( = ?auto_555431 ?auto_555434 ) ) ( not ( = ?auto_555431 ?auto_555435 ) ) ( not ( = ?auto_555431 ?auto_555436 ) ) ( not ( = ?auto_555431 ?auto_555437 ) ) ( not ( = ?auto_555431 ?auto_555438 ) ) ( not ( = ?auto_555431 ?auto_555439 ) ) ( not ( = ?auto_555431 ?auto_555440 ) ) ( not ( = ?auto_555431 ?auto_555441 ) ) ( not ( = ?auto_555431 ?auto_555442 ) ) ( not ( = ?auto_555432 ?auto_555433 ) ) ( not ( = ?auto_555432 ?auto_555434 ) ) ( not ( = ?auto_555432 ?auto_555435 ) ) ( not ( = ?auto_555432 ?auto_555436 ) ) ( not ( = ?auto_555432 ?auto_555437 ) ) ( not ( = ?auto_555432 ?auto_555438 ) ) ( not ( = ?auto_555432 ?auto_555439 ) ) ( not ( = ?auto_555432 ?auto_555440 ) ) ( not ( = ?auto_555432 ?auto_555441 ) ) ( not ( = ?auto_555432 ?auto_555442 ) ) ( not ( = ?auto_555433 ?auto_555434 ) ) ( not ( = ?auto_555433 ?auto_555435 ) ) ( not ( = ?auto_555433 ?auto_555436 ) ) ( not ( = ?auto_555433 ?auto_555437 ) ) ( not ( = ?auto_555433 ?auto_555438 ) ) ( not ( = ?auto_555433 ?auto_555439 ) ) ( not ( = ?auto_555433 ?auto_555440 ) ) ( not ( = ?auto_555433 ?auto_555441 ) ) ( not ( = ?auto_555433 ?auto_555442 ) ) ( not ( = ?auto_555434 ?auto_555435 ) ) ( not ( = ?auto_555434 ?auto_555436 ) ) ( not ( = ?auto_555434 ?auto_555437 ) ) ( not ( = ?auto_555434 ?auto_555438 ) ) ( not ( = ?auto_555434 ?auto_555439 ) ) ( not ( = ?auto_555434 ?auto_555440 ) ) ( not ( = ?auto_555434 ?auto_555441 ) ) ( not ( = ?auto_555434 ?auto_555442 ) ) ( not ( = ?auto_555435 ?auto_555436 ) ) ( not ( = ?auto_555435 ?auto_555437 ) ) ( not ( = ?auto_555435 ?auto_555438 ) ) ( not ( = ?auto_555435 ?auto_555439 ) ) ( not ( = ?auto_555435 ?auto_555440 ) ) ( not ( = ?auto_555435 ?auto_555441 ) ) ( not ( = ?auto_555435 ?auto_555442 ) ) ( not ( = ?auto_555436 ?auto_555437 ) ) ( not ( = ?auto_555436 ?auto_555438 ) ) ( not ( = ?auto_555436 ?auto_555439 ) ) ( not ( = ?auto_555436 ?auto_555440 ) ) ( not ( = ?auto_555436 ?auto_555441 ) ) ( not ( = ?auto_555436 ?auto_555442 ) ) ( not ( = ?auto_555437 ?auto_555438 ) ) ( not ( = ?auto_555437 ?auto_555439 ) ) ( not ( = ?auto_555437 ?auto_555440 ) ) ( not ( = ?auto_555437 ?auto_555441 ) ) ( not ( = ?auto_555437 ?auto_555442 ) ) ( not ( = ?auto_555438 ?auto_555439 ) ) ( not ( = ?auto_555438 ?auto_555440 ) ) ( not ( = ?auto_555438 ?auto_555441 ) ) ( not ( = ?auto_555438 ?auto_555442 ) ) ( not ( = ?auto_555439 ?auto_555440 ) ) ( not ( = ?auto_555439 ?auto_555441 ) ) ( not ( = ?auto_555439 ?auto_555442 ) ) ( not ( = ?auto_555440 ?auto_555441 ) ) ( not ( = ?auto_555440 ?auto_555442 ) ) ( not ( = ?auto_555441 ?auto_555442 ) ) ( ON ?auto_555440 ?auto_555441 ) ( ON ?auto_555439 ?auto_555440 ) ( ON ?auto_555438 ?auto_555439 ) ( ON ?auto_555437 ?auto_555438 ) ( ON ?auto_555436 ?auto_555437 ) ( ON ?auto_555435 ?auto_555436 ) ( ON ?auto_555434 ?auto_555435 ) ( ON ?auto_555433 ?auto_555434 ) ( ON ?auto_555432 ?auto_555433 ) ( CLEAR ?auto_555430 ) ( ON ?auto_555431 ?auto_555432 ) ( CLEAR ?auto_555431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_555430 ?auto_555431 )
      ( MAKE-12PILE ?auto_555430 ?auto_555431 ?auto_555432 ?auto_555433 ?auto_555434 ?auto_555435 ?auto_555436 ?auto_555437 ?auto_555438 ?auto_555439 ?auto_555440 ?auto_555441 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_555480 - BLOCK
      ?auto_555481 - BLOCK
      ?auto_555482 - BLOCK
      ?auto_555483 - BLOCK
      ?auto_555484 - BLOCK
      ?auto_555485 - BLOCK
      ?auto_555486 - BLOCK
      ?auto_555487 - BLOCK
      ?auto_555488 - BLOCK
      ?auto_555489 - BLOCK
      ?auto_555490 - BLOCK
      ?auto_555491 - BLOCK
    )
    :vars
    (
      ?auto_555492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555491 ?auto_555492 ) ( not ( = ?auto_555480 ?auto_555481 ) ) ( not ( = ?auto_555480 ?auto_555482 ) ) ( not ( = ?auto_555480 ?auto_555483 ) ) ( not ( = ?auto_555480 ?auto_555484 ) ) ( not ( = ?auto_555480 ?auto_555485 ) ) ( not ( = ?auto_555480 ?auto_555486 ) ) ( not ( = ?auto_555480 ?auto_555487 ) ) ( not ( = ?auto_555480 ?auto_555488 ) ) ( not ( = ?auto_555480 ?auto_555489 ) ) ( not ( = ?auto_555480 ?auto_555490 ) ) ( not ( = ?auto_555480 ?auto_555491 ) ) ( not ( = ?auto_555480 ?auto_555492 ) ) ( not ( = ?auto_555481 ?auto_555482 ) ) ( not ( = ?auto_555481 ?auto_555483 ) ) ( not ( = ?auto_555481 ?auto_555484 ) ) ( not ( = ?auto_555481 ?auto_555485 ) ) ( not ( = ?auto_555481 ?auto_555486 ) ) ( not ( = ?auto_555481 ?auto_555487 ) ) ( not ( = ?auto_555481 ?auto_555488 ) ) ( not ( = ?auto_555481 ?auto_555489 ) ) ( not ( = ?auto_555481 ?auto_555490 ) ) ( not ( = ?auto_555481 ?auto_555491 ) ) ( not ( = ?auto_555481 ?auto_555492 ) ) ( not ( = ?auto_555482 ?auto_555483 ) ) ( not ( = ?auto_555482 ?auto_555484 ) ) ( not ( = ?auto_555482 ?auto_555485 ) ) ( not ( = ?auto_555482 ?auto_555486 ) ) ( not ( = ?auto_555482 ?auto_555487 ) ) ( not ( = ?auto_555482 ?auto_555488 ) ) ( not ( = ?auto_555482 ?auto_555489 ) ) ( not ( = ?auto_555482 ?auto_555490 ) ) ( not ( = ?auto_555482 ?auto_555491 ) ) ( not ( = ?auto_555482 ?auto_555492 ) ) ( not ( = ?auto_555483 ?auto_555484 ) ) ( not ( = ?auto_555483 ?auto_555485 ) ) ( not ( = ?auto_555483 ?auto_555486 ) ) ( not ( = ?auto_555483 ?auto_555487 ) ) ( not ( = ?auto_555483 ?auto_555488 ) ) ( not ( = ?auto_555483 ?auto_555489 ) ) ( not ( = ?auto_555483 ?auto_555490 ) ) ( not ( = ?auto_555483 ?auto_555491 ) ) ( not ( = ?auto_555483 ?auto_555492 ) ) ( not ( = ?auto_555484 ?auto_555485 ) ) ( not ( = ?auto_555484 ?auto_555486 ) ) ( not ( = ?auto_555484 ?auto_555487 ) ) ( not ( = ?auto_555484 ?auto_555488 ) ) ( not ( = ?auto_555484 ?auto_555489 ) ) ( not ( = ?auto_555484 ?auto_555490 ) ) ( not ( = ?auto_555484 ?auto_555491 ) ) ( not ( = ?auto_555484 ?auto_555492 ) ) ( not ( = ?auto_555485 ?auto_555486 ) ) ( not ( = ?auto_555485 ?auto_555487 ) ) ( not ( = ?auto_555485 ?auto_555488 ) ) ( not ( = ?auto_555485 ?auto_555489 ) ) ( not ( = ?auto_555485 ?auto_555490 ) ) ( not ( = ?auto_555485 ?auto_555491 ) ) ( not ( = ?auto_555485 ?auto_555492 ) ) ( not ( = ?auto_555486 ?auto_555487 ) ) ( not ( = ?auto_555486 ?auto_555488 ) ) ( not ( = ?auto_555486 ?auto_555489 ) ) ( not ( = ?auto_555486 ?auto_555490 ) ) ( not ( = ?auto_555486 ?auto_555491 ) ) ( not ( = ?auto_555486 ?auto_555492 ) ) ( not ( = ?auto_555487 ?auto_555488 ) ) ( not ( = ?auto_555487 ?auto_555489 ) ) ( not ( = ?auto_555487 ?auto_555490 ) ) ( not ( = ?auto_555487 ?auto_555491 ) ) ( not ( = ?auto_555487 ?auto_555492 ) ) ( not ( = ?auto_555488 ?auto_555489 ) ) ( not ( = ?auto_555488 ?auto_555490 ) ) ( not ( = ?auto_555488 ?auto_555491 ) ) ( not ( = ?auto_555488 ?auto_555492 ) ) ( not ( = ?auto_555489 ?auto_555490 ) ) ( not ( = ?auto_555489 ?auto_555491 ) ) ( not ( = ?auto_555489 ?auto_555492 ) ) ( not ( = ?auto_555490 ?auto_555491 ) ) ( not ( = ?auto_555490 ?auto_555492 ) ) ( not ( = ?auto_555491 ?auto_555492 ) ) ( ON ?auto_555490 ?auto_555491 ) ( ON ?auto_555489 ?auto_555490 ) ( ON ?auto_555488 ?auto_555489 ) ( ON ?auto_555487 ?auto_555488 ) ( ON ?auto_555486 ?auto_555487 ) ( ON ?auto_555485 ?auto_555486 ) ( ON ?auto_555484 ?auto_555485 ) ( ON ?auto_555483 ?auto_555484 ) ( ON ?auto_555482 ?auto_555483 ) ( ON ?auto_555481 ?auto_555482 ) ( ON ?auto_555480 ?auto_555481 ) ( CLEAR ?auto_555480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_555480 )
      ( MAKE-12PILE ?auto_555480 ?auto_555481 ?auto_555482 ?auto_555483 ?auto_555484 ?auto_555485 ?auto_555486 ?auto_555487 ?auto_555488 ?auto_555489 ?auto_555490 ?auto_555491 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555531 - BLOCK
      ?auto_555532 - BLOCK
      ?auto_555533 - BLOCK
      ?auto_555534 - BLOCK
      ?auto_555535 - BLOCK
      ?auto_555536 - BLOCK
      ?auto_555537 - BLOCK
      ?auto_555538 - BLOCK
      ?auto_555539 - BLOCK
      ?auto_555540 - BLOCK
      ?auto_555541 - BLOCK
      ?auto_555542 - BLOCK
      ?auto_555543 - BLOCK
    )
    :vars
    (
      ?auto_555544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_555542 ) ( ON ?auto_555543 ?auto_555544 ) ( CLEAR ?auto_555543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_555531 ) ( ON ?auto_555532 ?auto_555531 ) ( ON ?auto_555533 ?auto_555532 ) ( ON ?auto_555534 ?auto_555533 ) ( ON ?auto_555535 ?auto_555534 ) ( ON ?auto_555536 ?auto_555535 ) ( ON ?auto_555537 ?auto_555536 ) ( ON ?auto_555538 ?auto_555537 ) ( ON ?auto_555539 ?auto_555538 ) ( ON ?auto_555540 ?auto_555539 ) ( ON ?auto_555541 ?auto_555540 ) ( ON ?auto_555542 ?auto_555541 ) ( not ( = ?auto_555531 ?auto_555532 ) ) ( not ( = ?auto_555531 ?auto_555533 ) ) ( not ( = ?auto_555531 ?auto_555534 ) ) ( not ( = ?auto_555531 ?auto_555535 ) ) ( not ( = ?auto_555531 ?auto_555536 ) ) ( not ( = ?auto_555531 ?auto_555537 ) ) ( not ( = ?auto_555531 ?auto_555538 ) ) ( not ( = ?auto_555531 ?auto_555539 ) ) ( not ( = ?auto_555531 ?auto_555540 ) ) ( not ( = ?auto_555531 ?auto_555541 ) ) ( not ( = ?auto_555531 ?auto_555542 ) ) ( not ( = ?auto_555531 ?auto_555543 ) ) ( not ( = ?auto_555531 ?auto_555544 ) ) ( not ( = ?auto_555532 ?auto_555533 ) ) ( not ( = ?auto_555532 ?auto_555534 ) ) ( not ( = ?auto_555532 ?auto_555535 ) ) ( not ( = ?auto_555532 ?auto_555536 ) ) ( not ( = ?auto_555532 ?auto_555537 ) ) ( not ( = ?auto_555532 ?auto_555538 ) ) ( not ( = ?auto_555532 ?auto_555539 ) ) ( not ( = ?auto_555532 ?auto_555540 ) ) ( not ( = ?auto_555532 ?auto_555541 ) ) ( not ( = ?auto_555532 ?auto_555542 ) ) ( not ( = ?auto_555532 ?auto_555543 ) ) ( not ( = ?auto_555532 ?auto_555544 ) ) ( not ( = ?auto_555533 ?auto_555534 ) ) ( not ( = ?auto_555533 ?auto_555535 ) ) ( not ( = ?auto_555533 ?auto_555536 ) ) ( not ( = ?auto_555533 ?auto_555537 ) ) ( not ( = ?auto_555533 ?auto_555538 ) ) ( not ( = ?auto_555533 ?auto_555539 ) ) ( not ( = ?auto_555533 ?auto_555540 ) ) ( not ( = ?auto_555533 ?auto_555541 ) ) ( not ( = ?auto_555533 ?auto_555542 ) ) ( not ( = ?auto_555533 ?auto_555543 ) ) ( not ( = ?auto_555533 ?auto_555544 ) ) ( not ( = ?auto_555534 ?auto_555535 ) ) ( not ( = ?auto_555534 ?auto_555536 ) ) ( not ( = ?auto_555534 ?auto_555537 ) ) ( not ( = ?auto_555534 ?auto_555538 ) ) ( not ( = ?auto_555534 ?auto_555539 ) ) ( not ( = ?auto_555534 ?auto_555540 ) ) ( not ( = ?auto_555534 ?auto_555541 ) ) ( not ( = ?auto_555534 ?auto_555542 ) ) ( not ( = ?auto_555534 ?auto_555543 ) ) ( not ( = ?auto_555534 ?auto_555544 ) ) ( not ( = ?auto_555535 ?auto_555536 ) ) ( not ( = ?auto_555535 ?auto_555537 ) ) ( not ( = ?auto_555535 ?auto_555538 ) ) ( not ( = ?auto_555535 ?auto_555539 ) ) ( not ( = ?auto_555535 ?auto_555540 ) ) ( not ( = ?auto_555535 ?auto_555541 ) ) ( not ( = ?auto_555535 ?auto_555542 ) ) ( not ( = ?auto_555535 ?auto_555543 ) ) ( not ( = ?auto_555535 ?auto_555544 ) ) ( not ( = ?auto_555536 ?auto_555537 ) ) ( not ( = ?auto_555536 ?auto_555538 ) ) ( not ( = ?auto_555536 ?auto_555539 ) ) ( not ( = ?auto_555536 ?auto_555540 ) ) ( not ( = ?auto_555536 ?auto_555541 ) ) ( not ( = ?auto_555536 ?auto_555542 ) ) ( not ( = ?auto_555536 ?auto_555543 ) ) ( not ( = ?auto_555536 ?auto_555544 ) ) ( not ( = ?auto_555537 ?auto_555538 ) ) ( not ( = ?auto_555537 ?auto_555539 ) ) ( not ( = ?auto_555537 ?auto_555540 ) ) ( not ( = ?auto_555537 ?auto_555541 ) ) ( not ( = ?auto_555537 ?auto_555542 ) ) ( not ( = ?auto_555537 ?auto_555543 ) ) ( not ( = ?auto_555537 ?auto_555544 ) ) ( not ( = ?auto_555538 ?auto_555539 ) ) ( not ( = ?auto_555538 ?auto_555540 ) ) ( not ( = ?auto_555538 ?auto_555541 ) ) ( not ( = ?auto_555538 ?auto_555542 ) ) ( not ( = ?auto_555538 ?auto_555543 ) ) ( not ( = ?auto_555538 ?auto_555544 ) ) ( not ( = ?auto_555539 ?auto_555540 ) ) ( not ( = ?auto_555539 ?auto_555541 ) ) ( not ( = ?auto_555539 ?auto_555542 ) ) ( not ( = ?auto_555539 ?auto_555543 ) ) ( not ( = ?auto_555539 ?auto_555544 ) ) ( not ( = ?auto_555540 ?auto_555541 ) ) ( not ( = ?auto_555540 ?auto_555542 ) ) ( not ( = ?auto_555540 ?auto_555543 ) ) ( not ( = ?auto_555540 ?auto_555544 ) ) ( not ( = ?auto_555541 ?auto_555542 ) ) ( not ( = ?auto_555541 ?auto_555543 ) ) ( not ( = ?auto_555541 ?auto_555544 ) ) ( not ( = ?auto_555542 ?auto_555543 ) ) ( not ( = ?auto_555542 ?auto_555544 ) ) ( not ( = ?auto_555543 ?auto_555544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_555543 ?auto_555544 )
      ( !STACK ?auto_555543 ?auto_555542 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555585 - BLOCK
      ?auto_555586 - BLOCK
      ?auto_555587 - BLOCK
      ?auto_555588 - BLOCK
      ?auto_555589 - BLOCK
      ?auto_555590 - BLOCK
      ?auto_555591 - BLOCK
      ?auto_555592 - BLOCK
      ?auto_555593 - BLOCK
      ?auto_555594 - BLOCK
      ?auto_555595 - BLOCK
      ?auto_555596 - BLOCK
      ?auto_555597 - BLOCK
    )
    :vars
    (
      ?auto_555598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555597 ?auto_555598 ) ( ON-TABLE ?auto_555585 ) ( ON ?auto_555586 ?auto_555585 ) ( ON ?auto_555587 ?auto_555586 ) ( ON ?auto_555588 ?auto_555587 ) ( ON ?auto_555589 ?auto_555588 ) ( ON ?auto_555590 ?auto_555589 ) ( ON ?auto_555591 ?auto_555590 ) ( ON ?auto_555592 ?auto_555591 ) ( ON ?auto_555593 ?auto_555592 ) ( ON ?auto_555594 ?auto_555593 ) ( ON ?auto_555595 ?auto_555594 ) ( not ( = ?auto_555585 ?auto_555586 ) ) ( not ( = ?auto_555585 ?auto_555587 ) ) ( not ( = ?auto_555585 ?auto_555588 ) ) ( not ( = ?auto_555585 ?auto_555589 ) ) ( not ( = ?auto_555585 ?auto_555590 ) ) ( not ( = ?auto_555585 ?auto_555591 ) ) ( not ( = ?auto_555585 ?auto_555592 ) ) ( not ( = ?auto_555585 ?auto_555593 ) ) ( not ( = ?auto_555585 ?auto_555594 ) ) ( not ( = ?auto_555585 ?auto_555595 ) ) ( not ( = ?auto_555585 ?auto_555596 ) ) ( not ( = ?auto_555585 ?auto_555597 ) ) ( not ( = ?auto_555585 ?auto_555598 ) ) ( not ( = ?auto_555586 ?auto_555587 ) ) ( not ( = ?auto_555586 ?auto_555588 ) ) ( not ( = ?auto_555586 ?auto_555589 ) ) ( not ( = ?auto_555586 ?auto_555590 ) ) ( not ( = ?auto_555586 ?auto_555591 ) ) ( not ( = ?auto_555586 ?auto_555592 ) ) ( not ( = ?auto_555586 ?auto_555593 ) ) ( not ( = ?auto_555586 ?auto_555594 ) ) ( not ( = ?auto_555586 ?auto_555595 ) ) ( not ( = ?auto_555586 ?auto_555596 ) ) ( not ( = ?auto_555586 ?auto_555597 ) ) ( not ( = ?auto_555586 ?auto_555598 ) ) ( not ( = ?auto_555587 ?auto_555588 ) ) ( not ( = ?auto_555587 ?auto_555589 ) ) ( not ( = ?auto_555587 ?auto_555590 ) ) ( not ( = ?auto_555587 ?auto_555591 ) ) ( not ( = ?auto_555587 ?auto_555592 ) ) ( not ( = ?auto_555587 ?auto_555593 ) ) ( not ( = ?auto_555587 ?auto_555594 ) ) ( not ( = ?auto_555587 ?auto_555595 ) ) ( not ( = ?auto_555587 ?auto_555596 ) ) ( not ( = ?auto_555587 ?auto_555597 ) ) ( not ( = ?auto_555587 ?auto_555598 ) ) ( not ( = ?auto_555588 ?auto_555589 ) ) ( not ( = ?auto_555588 ?auto_555590 ) ) ( not ( = ?auto_555588 ?auto_555591 ) ) ( not ( = ?auto_555588 ?auto_555592 ) ) ( not ( = ?auto_555588 ?auto_555593 ) ) ( not ( = ?auto_555588 ?auto_555594 ) ) ( not ( = ?auto_555588 ?auto_555595 ) ) ( not ( = ?auto_555588 ?auto_555596 ) ) ( not ( = ?auto_555588 ?auto_555597 ) ) ( not ( = ?auto_555588 ?auto_555598 ) ) ( not ( = ?auto_555589 ?auto_555590 ) ) ( not ( = ?auto_555589 ?auto_555591 ) ) ( not ( = ?auto_555589 ?auto_555592 ) ) ( not ( = ?auto_555589 ?auto_555593 ) ) ( not ( = ?auto_555589 ?auto_555594 ) ) ( not ( = ?auto_555589 ?auto_555595 ) ) ( not ( = ?auto_555589 ?auto_555596 ) ) ( not ( = ?auto_555589 ?auto_555597 ) ) ( not ( = ?auto_555589 ?auto_555598 ) ) ( not ( = ?auto_555590 ?auto_555591 ) ) ( not ( = ?auto_555590 ?auto_555592 ) ) ( not ( = ?auto_555590 ?auto_555593 ) ) ( not ( = ?auto_555590 ?auto_555594 ) ) ( not ( = ?auto_555590 ?auto_555595 ) ) ( not ( = ?auto_555590 ?auto_555596 ) ) ( not ( = ?auto_555590 ?auto_555597 ) ) ( not ( = ?auto_555590 ?auto_555598 ) ) ( not ( = ?auto_555591 ?auto_555592 ) ) ( not ( = ?auto_555591 ?auto_555593 ) ) ( not ( = ?auto_555591 ?auto_555594 ) ) ( not ( = ?auto_555591 ?auto_555595 ) ) ( not ( = ?auto_555591 ?auto_555596 ) ) ( not ( = ?auto_555591 ?auto_555597 ) ) ( not ( = ?auto_555591 ?auto_555598 ) ) ( not ( = ?auto_555592 ?auto_555593 ) ) ( not ( = ?auto_555592 ?auto_555594 ) ) ( not ( = ?auto_555592 ?auto_555595 ) ) ( not ( = ?auto_555592 ?auto_555596 ) ) ( not ( = ?auto_555592 ?auto_555597 ) ) ( not ( = ?auto_555592 ?auto_555598 ) ) ( not ( = ?auto_555593 ?auto_555594 ) ) ( not ( = ?auto_555593 ?auto_555595 ) ) ( not ( = ?auto_555593 ?auto_555596 ) ) ( not ( = ?auto_555593 ?auto_555597 ) ) ( not ( = ?auto_555593 ?auto_555598 ) ) ( not ( = ?auto_555594 ?auto_555595 ) ) ( not ( = ?auto_555594 ?auto_555596 ) ) ( not ( = ?auto_555594 ?auto_555597 ) ) ( not ( = ?auto_555594 ?auto_555598 ) ) ( not ( = ?auto_555595 ?auto_555596 ) ) ( not ( = ?auto_555595 ?auto_555597 ) ) ( not ( = ?auto_555595 ?auto_555598 ) ) ( not ( = ?auto_555596 ?auto_555597 ) ) ( not ( = ?auto_555596 ?auto_555598 ) ) ( not ( = ?auto_555597 ?auto_555598 ) ) ( CLEAR ?auto_555595 ) ( ON ?auto_555596 ?auto_555597 ) ( CLEAR ?auto_555596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_555585 ?auto_555586 ?auto_555587 ?auto_555588 ?auto_555589 ?auto_555590 ?auto_555591 ?auto_555592 ?auto_555593 ?auto_555594 ?auto_555595 ?auto_555596 )
      ( MAKE-13PILE ?auto_555585 ?auto_555586 ?auto_555587 ?auto_555588 ?auto_555589 ?auto_555590 ?auto_555591 ?auto_555592 ?auto_555593 ?auto_555594 ?auto_555595 ?auto_555596 ?auto_555597 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555639 - BLOCK
      ?auto_555640 - BLOCK
      ?auto_555641 - BLOCK
      ?auto_555642 - BLOCK
      ?auto_555643 - BLOCK
      ?auto_555644 - BLOCK
      ?auto_555645 - BLOCK
      ?auto_555646 - BLOCK
      ?auto_555647 - BLOCK
      ?auto_555648 - BLOCK
      ?auto_555649 - BLOCK
      ?auto_555650 - BLOCK
      ?auto_555651 - BLOCK
    )
    :vars
    (
      ?auto_555652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555651 ?auto_555652 ) ( ON-TABLE ?auto_555639 ) ( ON ?auto_555640 ?auto_555639 ) ( ON ?auto_555641 ?auto_555640 ) ( ON ?auto_555642 ?auto_555641 ) ( ON ?auto_555643 ?auto_555642 ) ( ON ?auto_555644 ?auto_555643 ) ( ON ?auto_555645 ?auto_555644 ) ( ON ?auto_555646 ?auto_555645 ) ( ON ?auto_555647 ?auto_555646 ) ( ON ?auto_555648 ?auto_555647 ) ( not ( = ?auto_555639 ?auto_555640 ) ) ( not ( = ?auto_555639 ?auto_555641 ) ) ( not ( = ?auto_555639 ?auto_555642 ) ) ( not ( = ?auto_555639 ?auto_555643 ) ) ( not ( = ?auto_555639 ?auto_555644 ) ) ( not ( = ?auto_555639 ?auto_555645 ) ) ( not ( = ?auto_555639 ?auto_555646 ) ) ( not ( = ?auto_555639 ?auto_555647 ) ) ( not ( = ?auto_555639 ?auto_555648 ) ) ( not ( = ?auto_555639 ?auto_555649 ) ) ( not ( = ?auto_555639 ?auto_555650 ) ) ( not ( = ?auto_555639 ?auto_555651 ) ) ( not ( = ?auto_555639 ?auto_555652 ) ) ( not ( = ?auto_555640 ?auto_555641 ) ) ( not ( = ?auto_555640 ?auto_555642 ) ) ( not ( = ?auto_555640 ?auto_555643 ) ) ( not ( = ?auto_555640 ?auto_555644 ) ) ( not ( = ?auto_555640 ?auto_555645 ) ) ( not ( = ?auto_555640 ?auto_555646 ) ) ( not ( = ?auto_555640 ?auto_555647 ) ) ( not ( = ?auto_555640 ?auto_555648 ) ) ( not ( = ?auto_555640 ?auto_555649 ) ) ( not ( = ?auto_555640 ?auto_555650 ) ) ( not ( = ?auto_555640 ?auto_555651 ) ) ( not ( = ?auto_555640 ?auto_555652 ) ) ( not ( = ?auto_555641 ?auto_555642 ) ) ( not ( = ?auto_555641 ?auto_555643 ) ) ( not ( = ?auto_555641 ?auto_555644 ) ) ( not ( = ?auto_555641 ?auto_555645 ) ) ( not ( = ?auto_555641 ?auto_555646 ) ) ( not ( = ?auto_555641 ?auto_555647 ) ) ( not ( = ?auto_555641 ?auto_555648 ) ) ( not ( = ?auto_555641 ?auto_555649 ) ) ( not ( = ?auto_555641 ?auto_555650 ) ) ( not ( = ?auto_555641 ?auto_555651 ) ) ( not ( = ?auto_555641 ?auto_555652 ) ) ( not ( = ?auto_555642 ?auto_555643 ) ) ( not ( = ?auto_555642 ?auto_555644 ) ) ( not ( = ?auto_555642 ?auto_555645 ) ) ( not ( = ?auto_555642 ?auto_555646 ) ) ( not ( = ?auto_555642 ?auto_555647 ) ) ( not ( = ?auto_555642 ?auto_555648 ) ) ( not ( = ?auto_555642 ?auto_555649 ) ) ( not ( = ?auto_555642 ?auto_555650 ) ) ( not ( = ?auto_555642 ?auto_555651 ) ) ( not ( = ?auto_555642 ?auto_555652 ) ) ( not ( = ?auto_555643 ?auto_555644 ) ) ( not ( = ?auto_555643 ?auto_555645 ) ) ( not ( = ?auto_555643 ?auto_555646 ) ) ( not ( = ?auto_555643 ?auto_555647 ) ) ( not ( = ?auto_555643 ?auto_555648 ) ) ( not ( = ?auto_555643 ?auto_555649 ) ) ( not ( = ?auto_555643 ?auto_555650 ) ) ( not ( = ?auto_555643 ?auto_555651 ) ) ( not ( = ?auto_555643 ?auto_555652 ) ) ( not ( = ?auto_555644 ?auto_555645 ) ) ( not ( = ?auto_555644 ?auto_555646 ) ) ( not ( = ?auto_555644 ?auto_555647 ) ) ( not ( = ?auto_555644 ?auto_555648 ) ) ( not ( = ?auto_555644 ?auto_555649 ) ) ( not ( = ?auto_555644 ?auto_555650 ) ) ( not ( = ?auto_555644 ?auto_555651 ) ) ( not ( = ?auto_555644 ?auto_555652 ) ) ( not ( = ?auto_555645 ?auto_555646 ) ) ( not ( = ?auto_555645 ?auto_555647 ) ) ( not ( = ?auto_555645 ?auto_555648 ) ) ( not ( = ?auto_555645 ?auto_555649 ) ) ( not ( = ?auto_555645 ?auto_555650 ) ) ( not ( = ?auto_555645 ?auto_555651 ) ) ( not ( = ?auto_555645 ?auto_555652 ) ) ( not ( = ?auto_555646 ?auto_555647 ) ) ( not ( = ?auto_555646 ?auto_555648 ) ) ( not ( = ?auto_555646 ?auto_555649 ) ) ( not ( = ?auto_555646 ?auto_555650 ) ) ( not ( = ?auto_555646 ?auto_555651 ) ) ( not ( = ?auto_555646 ?auto_555652 ) ) ( not ( = ?auto_555647 ?auto_555648 ) ) ( not ( = ?auto_555647 ?auto_555649 ) ) ( not ( = ?auto_555647 ?auto_555650 ) ) ( not ( = ?auto_555647 ?auto_555651 ) ) ( not ( = ?auto_555647 ?auto_555652 ) ) ( not ( = ?auto_555648 ?auto_555649 ) ) ( not ( = ?auto_555648 ?auto_555650 ) ) ( not ( = ?auto_555648 ?auto_555651 ) ) ( not ( = ?auto_555648 ?auto_555652 ) ) ( not ( = ?auto_555649 ?auto_555650 ) ) ( not ( = ?auto_555649 ?auto_555651 ) ) ( not ( = ?auto_555649 ?auto_555652 ) ) ( not ( = ?auto_555650 ?auto_555651 ) ) ( not ( = ?auto_555650 ?auto_555652 ) ) ( not ( = ?auto_555651 ?auto_555652 ) ) ( ON ?auto_555650 ?auto_555651 ) ( CLEAR ?auto_555648 ) ( ON ?auto_555649 ?auto_555650 ) ( CLEAR ?auto_555649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_555639 ?auto_555640 ?auto_555641 ?auto_555642 ?auto_555643 ?auto_555644 ?auto_555645 ?auto_555646 ?auto_555647 ?auto_555648 ?auto_555649 )
      ( MAKE-13PILE ?auto_555639 ?auto_555640 ?auto_555641 ?auto_555642 ?auto_555643 ?auto_555644 ?auto_555645 ?auto_555646 ?auto_555647 ?auto_555648 ?auto_555649 ?auto_555650 ?auto_555651 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555693 - BLOCK
      ?auto_555694 - BLOCK
      ?auto_555695 - BLOCK
      ?auto_555696 - BLOCK
      ?auto_555697 - BLOCK
      ?auto_555698 - BLOCK
      ?auto_555699 - BLOCK
      ?auto_555700 - BLOCK
      ?auto_555701 - BLOCK
      ?auto_555702 - BLOCK
      ?auto_555703 - BLOCK
      ?auto_555704 - BLOCK
      ?auto_555705 - BLOCK
    )
    :vars
    (
      ?auto_555706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555705 ?auto_555706 ) ( ON-TABLE ?auto_555693 ) ( ON ?auto_555694 ?auto_555693 ) ( ON ?auto_555695 ?auto_555694 ) ( ON ?auto_555696 ?auto_555695 ) ( ON ?auto_555697 ?auto_555696 ) ( ON ?auto_555698 ?auto_555697 ) ( ON ?auto_555699 ?auto_555698 ) ( ON ?auto_555700 ?auto_555699 ) ( ON ?auto_555701 ?auto_555700 ) ( not ( = ?auto_555693 ?auto_555694 ) ) ( not ( = ?auto_555693 ?auto_555695 ) ) ( not ( = ?auto_555693 ?auto_555696 ) ) ( not ( = ?auto_555693 ?auto_555697 ) ) ( not ( = ?auto_555693 ?auto_555698 ) ) ( not ( = ?auto_555693 ?auto_555699 ) ) ( not ( = ?auto_555693 ?auto_555700 ) ) ( not ( = ?auto_555693 ?auto_555701 ) ) ( not ( = ?auto_555693 ?auto_555702 ) ) ( not ( = ?auto_555693 ?auto_555703 ) ) ( not ( = ?auto_555693 ?auto_555704 ) ) ( not ( = ?auto_555693 ?auto_555705 ) ) ( not ( = ?auto_555693 ?auto_555706 ) ) ( not ( = ?auto_555694 ?auto_555695 ) ) ( not ( = ?auto_555694 ?auto_555696 ) ) ( not ( = ?auto_555694 ?auto_555697 ) ) ( not ( = ?auto_555694 ?auto_555698 ) ) ( not ( = ?auto_555694 ?auto_555699 ) ) ( not ( = ?auto_555694 ?auto_555700 ) ) ( not ( = ?auto_555694 ?auto_555701 ) ) ( not ( = ?auto_555694 ?auto_555702 ) ) ( not ( = ?auto_555694 ?auto_555703 ) ) ( not ( = ?auto_555694 ?auto_555704 ) ) ( not ( = ?auto_555694 ?auto_555705 ) ) ( not ( = ?auto_555694 ?auto_555706 ) ) ( not ( = ?auto_555695 ?auto_555696 ) ) ( not ( = ?auto_555695 ?auto_555697 ) ) ( not ( = ?auto_555695 ?auto_555698 ) ) ( not ( = ?auto_555695 ?auto_555699 ) ) ( not ( = ?auto_555695 ?auto_555700 ) ) ( not ( = ?auto_555695 ?auto_555701 ) ) ( not ( = ?auto_555695 ?auto_555702 ) ) ( not ( = ?auto_555695 ?auto_555703 ) ) ( not ( = ?auto_555695 ?auto_555704 ) ) ( not ( = ?auto_555695 ?auto_555705 ) ) ( not ( = ?auto_555695 ?auto_555706 ) ) ( not ( = ?auto_555696 ?auto_555697 ) ) ( not ( = ?auto_555696 ?auto_555698 ) ) ( not ( = ?auto_555696 ?auto_555699 ) ) ( not ( = ?auto_555696 ?auto_555700 ) ) ( not ( = ?auto_555696 ?auto_555701 ) ) ( not ( = ?auto_555696 ?auto_555702 ) ) ( not ( = ?auto_555696 ?auto_555703 ) ) ( not ( = ?auto_555696 ?auto_555704 ) ) ( not ( = ?auto_555696 ?auto_555705 ) ) ( not ( = ?auto_555696 ?auto_555706 ) ) ( not ( = ?auto_555697 ?auto_555698 ) ) ( not ( = ?auto_555697 ?auto_555699 ) ) ( not ( = ?auto_555697 ?auto_555700 ) ) ( not ( = ?auto_555697 ?auto_555701 ) ) ( not ( = ?auto_555697 ?auto_555702 ) ) ( not ( = ?auto_555697 ?auto_555703 ) ) ( not ( = ?auto_555697 ?auto_555704 ) ) ( not ( = ?auto_555697 ?auto_555705 ) ) ( not ( = ?auto_555697 ?auto_555706 ) ) ( not ( = ?auto_555698 ?auto_555699 ) ) ( not ( = ?auto_555698 ?auto_555700 ) ) ( not ( = ?auto_555698 ?auto_555701 ) ) ( not ( = ?auto_555698 ?auto_555702 ) ) ( not ( = ?auto_555698 ?auto_555703 ) ) ( not ( = ?auto_555698 ?auto_555704 ) ) ( not ( = ?auto_555698 ?auto_555705 ) ) ( not ( = ?auto_555698 ?auto_555706 ) ) ( not ( = ?auto_555699 ?auto_555700 ) ) ( not ( = ?auto_555699 ?auto_555701 ) ) ( not ( = ?auto_555699 ?auto_555702 ) ) ( not ( = ?auto_555699 ?auto_555703 ) ) ( not ( = ?auto_555699 ?auto_555704 ) ) ( not ( = ?auto_555699 ?auto_555705 ) ) ( not ( = ?auto_555699 ?auto_555706 ) ) ( not ( = ?auto_555700 ?auto_555701 ) ) ( not ( = ?auto_555700 ?auto_555702 ) ) ( not ( = ?auto_555700 ?auto_555703 ) ) ( not ( = ?auto_555700 ?auto_555704 ) ) ( not ( = ?auto_555700 ?auto_555705 ) ) ( not ( = ?auto_555700 ?auto_555706 ) ) ( not ( = ?auto_555701 ?auto_555702 ) ) ( not ( = ?auto_555701 ?auto_555703 ) ) ( not ( = ?auto_555701 ?auto_555704 ) ) ( not ( = ?auto_555701 ?auto_555705 ) ) ( not ( = ?auto_555701 ?auto_555706 ) ) ( not ( = ?auto_555702 ?auto_555703 ) ) ( not ( = ?auto_555702 ?auto_555704 ) ) ( not ( = ?auto_555702 ?auto_555705 ) ) ( not ( = ?auto_555702 ?auto_555706 ) ) ( not ( = ?auto_555703 ?auto_555704 ) ) ( not ( = ?auto_555703 ?auto_555705 ) ) ( not ( = ?auto_555703 ?auto_555706 ) ) ( not ( = ?auto_555704 ?auto_555705 ) ) ( not ( = ?auto_555704 ?auto_555706 ) ) ( not ( = ?auto_555705 ?auto_555706 ) ) ( ON ?auto_555704 ?auto_555705 ) ( ON ?auto_555703 ?auto_555704 ) ( CLEAR ?auto_555701 ) ( ON ?auto_555702 ?auto_555703 ) ( CLEAR ?auto_555702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_555693 ?auto_555694 ?auto_555695 ?auto_555696 ?auto_555697 ?auto_555698 ?auto_555699 ?auto_555700 ?auto_555701 ?auto_555702 )
      ( MAKE-13PILE ?auto_555693 ?auto_555694 ?auto_555695 ?auto_555696 ?auto_555697 ?auto_555698 ?auto_555699 ?auto_555700 ?auto_555701 ?auto_555702 ?auto_555703 ?auto_555704 ?auto_555705 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555747 - BLOCK
      ?auto_555748 - BLOCK
      ?auto_555749 - BLOCK
      ?auto_555750 - BLOCK
      ?auto_555751 - BLOCK
      ?auto_555752 - BLOCK
      ?auto_555753 - BLOCK
      ?auto_555754 - BLOCK
      ?auto_555755 - BLOCK
      ?auto_555756 - BLOCK
      ?auto_555757 - BLOCK
      ?auto_555758 - BLOCK
      ?auto_555759 - BLOCK
    )
    :vars
    (
      ?auto_555760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555759 ?auto_555760 ) ( ON-TABLE ?auto_555747 ) ( ON ?auto_555748 ?auto_555747 ) ( ON ?auto_555749 ?auto_555748 ) ( ON ?auto_555750 ?auto_555749 ) ( ON ?auto_555751 ?auto_555750 ) ( ON ?auto_555752 ?auto_555751 ) ( ON ?auto_555753 ?auto_555752 ) ( ON ?auto_555754 ?auto_555753 ) ( not ( = ?auto_555747 ?auto_555748 ) ) ( not ( = ?auto_555747 ?auto_555749 ) ) ( not ( = ?auto_555747 ?auto_555750 ) ) ( not ( = ?auto_555747 ?auto_555751 ) ) ( not ( = ?auto_555747 ?auto_555752 ) ) ( not ( = ?auto_555747 ?auto_555753 ) ) ( not ( = ?auto_555747 ?auto_555754 ) ) ( not ( = ?auto_555747 ?auto_555755 ) ) ( not ( = ?auto_555747 ?auto_555756 ) ) ( not ( = ?auto_555747 ?auto_555757 ) ) ( not ( = ?auto_555747 ?auto_555758 ) ) ( not ( = ?auto_555747 ?auto_555759 ) ) ( not ( = ?auto_555747 ?auto_555760 ) ) ( not ( = ?auto_555748 ?auto_555749 ) ) ( not ( = ?auto_555748 ?auto_555750 ) ) ( not ( = ?auto_555748 ?auto_555751 ) ) ( not ( = ?auto_555748 ?auto_555752 ) ) ( not ( = ?auto_555748 ?auto_555753 ) ) ( not ( = ?auto_555748 ?auto_555754 ) ) ( not ( = ?auto_555748 ?auto_555755 ) ) ( not ( = ?auto_555748 ?auto_555756 ) ) ( not ( = ?auto_555748 ?auto_555757 ) ) ( not ( = ?auto_555748 ?auto_555758 ) ) ( not ( = ?auto_555748 ?auto_555759 ) ) ( not ( = ?auto_555748 ?auto_555760 ) ) ( not ( = ?auto_555749 ?auto_555750 ) ) ( not ( = ?auto_555749 ?auto_555751 ) ) ( not ( = ?auto_555749 ?auto_555752 ) ) ( not ( = ?auto_555749 ?auto_555753 ) ) ( not ( = ?auto_555749 ?auto_555754 ) ) ( not ( = ?auto_555749 ?auto_555755 ) ) ( not ( = ?auto_555749 ?auto_555756 ) ) ( not ( = ?auto_555749 ?auto_555757 ) ) ( not ( = ?auto_555749 ?auto_555758 ) ) ( not ( = ?auto_555749 ?auto_555759 ) ) ( not ( = ?auto_555749 ?auto_555760 ) ) ( not ( = ?auto_555750 ?auto_555751 ) ) ( not ( = ?auto_555750 ?auto_555752 ) ) ( not ( = ?auto_555750 ?auto_555753 ) ) ( not ( = ?auto_555750 ?auto_555754 ) ) ( not ( = ?auto_555750 ?auto_555755 ) ) ( not ( = ?auto_555750 ?auto_555756 ) ) ( not ( = ?auto_555750 ?auto_555757 ) ) ( not ( = ?auto_555750 ?auto_555758 ) ) ( not ( = ?auto_555750 ?auto_555759 ) ) ( not ( = ?auto_555750 ?auto_555760 ) ) ( not ( = ?auto_555751 ?auto_555752 ) ) ( not ( = ?auto_555751 ?auto_555753 ) ) ( not ( = ?auto_555751 ?auto_555754 ) ) ( not ( = ?auto_555751 ?auto_555755 ) ) ( not ( = ?auto_555751 ?auto_555756 ) ) ( not ( = ?auto_555751 ?auto_555757 ) ) ( not ( = ?auto_555751 ?auto_555758 ) ) ( not ( = ?auto_555751 ?auto_555759 ) ) ( not ( = ?auto_555751 ?auto_555760 ) ) ( not ( = ?auto_555752 ?auto_555753 ) ) ( not ( = ?auto_555752 ?auto_555754 ) ) ( not ( = ?auto_555752 ?auto_555755 ) ) ( not ( = ?auto_555752 ?auto_555756 ) ) ( not ( = ?auto_555752 ?auto_555757 ) ) ( not ( = ?auto_555752 ?auto_555758 ) ) ( not ( = ?auto_555752 ?auto_555759 ) ) ( not ( = ?auto_555752 ?auto_555760 ) ) ( not ( = ?auto_555753 ?auto_555754 ) ) ( not ( = ?auto_555753 ?auto_555755 ) ) ( not ( = ?auto_555753 ?auto_555756 ) ) ( not ( = ?auto_555753 ?auto_555757 ) ) ( not ( = ?auto_555753 ?auto_555758 ) ) ( not ( = ?auto_555753 ?auto_555759 ) ) ( not ( = ?auto_555753 ?auto_555760 ) ) ( not ( = ?auto_555754 ?auto_555755 ) ) ( not ( = ?auto_555754 ?auto_555756 ) ) ( not ( = ?auto_555754 ?auto_555757 ) ) ( not ( = ?auto_555754 ?auto_555758 ) ) ( not ( = ?auto_555754 ?auto_555759 ) ) ( not ( = ?auto_555754 ?auto_555760 ) ) ( not ( = ?auto_555755 ?auto_555756 ) ) ( not ( = ?auto_555755 ?auto_555757 ) ) ( not ( = ?auto_555755 ?auto_555758 ) ) ( not ( = ?auto_555755 ?auto_555759 ) ) ( not ( = ?auto_555755 ?auto_555760 ) ) ( not ( = ?auto_555756 ?auto_555757 ) ) ( not ( = ?auto_555756 ?auto_555758 ) ) ( not ( = ?auto_555756 ?auto_555759 ) ) ( not ( = ?auto_555756 ?auto_555760 ) ) ( not ( = ?auto_555757 ?auto_555758 ) ) ( not ( = ?auto_555757 ?auto_555759 ) ) ( not ( = ?auto_555757 ?auto_555760 ) ) ( not ( = ?auto_555758 ?auto_555759 ) ) ( not ( = ?auto_555758 ?auto_555760 ) ) ( not ( = ?auto_555759 ?auto_555760 ) ) ( ON ?auto_555758 ?auto_555759 ) ( ON ?auto_555757 ?auto_555758 ) ( ON ?auto_555756 ?auto_555757 ) ( CLEAR ?auto_555754 ) ( ON ?auto_555755 ?auto_555756 ) ( CLEAR ?auto_555755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_555747 ?auto_555748 ?auto_555749 ?auto_555750 ?auto_555751 ?auto_555752 ?auto_555753 ?auto_555754 ?auto_555755 )
      ( MAKE-13PILE ?auto_555747 ?auto_555748 ?auto_555749 ?auto_555750 ?auto_555751 ?auto_555752 ?auto_555753 ?auto_555754 ?auto_555755 ?auto_555756 ?auto_555757 ?auto_555758 ?auto_555759 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555801 - BLOCK
      ?auto_555802 - BLOCK
      ?auto_555803 - BLOCK
      ?auto_555804 - BLOCK
      ?auto_555805 - BLOCK
      ?auto_555806 - BLOCK
      ?auto_555807 - BLOCK
      ?auto_555808 - BLOCK
      ?auto_555809 - BLOCK
      ?auto_555810 - BLOCK
      ?auto_555811 - BLOCK
      ?auto_555812 - BLOCK
      ?auto_555813 - BLOCK
    )
    :vars
    (
      ?auto_555814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555813 ?auto_555814 ) ( ON-TABLE ?auto_555801 ) ( ON ?auto_555802 ?auto_555801 ) ( ON ?auto_555803 ?auto_555802 ) ( ON ?auto_555804 ?auto_555803 ) ( ON ?auto_555805 ?auto_555804 ) ( ON ?auto_555806 ?auto_555805 ) ( ON ?auto_555807 ?auto_555806 ) ( not ( = ?auto_555801 ?auto_555802 ) ) ( not ( = ?auto_555801 ?auto_555803 ) ) ( not ( = ?auto_555801 ?auto_555804 ) ) ( not ( = ?auto_555801 ?auto_555805 ) ) ( not ( = ?auto_555801 ?auto_555806 ) ) ( not ( = ?auto_555801 ?auto_555807 ) ) ( not ( = ?auto_555801 ?auto_555808 ) ) ( not ( = ?auto_555801 ?auto_555809 ) ) ( not ( = ?auto_555801 ?auto_555810 ) ) ( not ( = ?auto_555801 ?auto_555811 ) ) ( not ( = ?auto_555801 ?auto_555812 ) ) ( not ( = ?auto_555801 ?auto_555813 ) ) ( not ( = ?auto_555801 ?auto_555814 ) ) ( not ( = ?auto_555802 ?auto_555803 ) ) ( not ( = ?auto_555802 ?auto_555804 ) ) ( not ( = ?auto_555802 ?auto_555805 ) ) ( not ( = ?auto_555802 ?auto_555806 ) ) ( not ( = ?auto_555802 ?auto_555807 ) ) ( not ( = ?auto_555802 ?auto_555808 ) ) ( not ( = ?auto_555802 ?auto_555809 ) ) ( not ( = ?auto_555802 ?auto_555810 ) ) ( not ( = ?auto_555802 ?auto_555811 ) ) ( not ( = ?auto_555802 ?auto_555812 ) ) ( not ( = ?auto_555802 ?auto_555813 ) ) ( not ( = ?auto_555802 ?auto_555814 ) ) ( not ( = ?auto_555803 ?auto_555804 ) ) ( not ( = ?auto_555803 ?auto_555805 ) ) ( not ( = ?auto_555803 ?auto_555806 ) ) ( not ( = ?auto_555803 ?auto_555807 ) ) ( not ( = ?auto_555803 ?auto_555808 ) ) ( not ( = ?auto_555803 ?auto_555809 ) ) ( not ( = ?auto_555803 ?auto_555810 ) ) ( not ( = ?auto_555803 ?auto_555811 ) ) ( not ( = ?auto_555803 ?auto_555812 ) ) ( not ( = ?auto_555803 ?auto_555813 ) ) ( not ( = ?auto_555803 ?auto_555814 ) ) ( not ( = ?auto_555804 ?auto_555805 ) ) ( not ( = ?auto_555804 ?auto_555806 ) ) ( not ( = ?auto_555804 ?auto_555807 ) ) ( not ( = ?auto_555804 ?auto_555808 ) ) ( not ( = ?auto_555804 ?auto_555809 ) ) ( not ( = ?auto_555804 ?auto_555810 ) ) ( not ( = ?auto_555804 ?auto_555811 ) ) ( not ( = ?auto_555804 ?auto_555812 ) ) ( not ( = ?auto_555804 ?auto_555813 ) ) ( not ( = ?auto_555804 ?auto_555814 ) ) ( not ( = ?auto_555805 ?auto_555806 ) ) ( not ( = ?auto_555805 ?auto_555807 ) ) ( not ( = ?auto_555805 ?auto_555808 ) ) ( not ( = ?auto_555805 ?auto_555809 ) ) ( not ( = ?auto_555805 ?auto_555810 ) ) ( not ( = ?auto_555805 ?auto_555811 ) ) ( not ( = ?auto_555805 ?auto_555812 ) ) ( not ( = ?auto_555805 ?auto_555813 ) ) ( not ( = ?auto_555805 ?auto_555814 ) ) ( not ( = ?auto_555806 ?auto_555807 ) ) ( not ( = ?auto_555806 ?auto_555808 ) ) ( not ( = ?auto_555806 ?auto_555809 ) ) ( not ( = ?auto_555806 ?auto_555810 ) ) ( not ( = ?auto_555806 ?auto_555811 ) ) ( not ( = ?auto_555806 ?auto_555812 ) ) ( not ( = ?auto_555806 ?auto_555813 ) ) ( not ( = ?auto_555806 ?auto_555814 ) ) ( not ( = ?auto_555807 ?auto_555808 ) ) ( not ( = ?auto_555807 ?auto_555809 ) ) ( not ( = ?auto_555807 ?auto_555810 ) ) ( not ( = ?auto_555807 ?auto_555811 ) ) ( not ( = ?auto_555807 ?auto_555812 ) ) ( not ( = ?auto_555807 ?auto_555813 ) ) ( not ( = ?auto_555807 ?auto_555814 ) ) ( not ( = ?auto_555808 ?auto_555809 ) ) ( not ( = ?auto_555808 ?auto_555810 ) ) ( not ( = ?auto_555808 ?auto_555811 ) ) ( not ( = ?auto_555808 ?auto_555812 ) ) ( not ( = ?auto_555808 ?auto_555813 ) ) ( not ( = ?auto_555808 ?auto_555814 ) ) ( not ( = ?auto_555809 ?auto_555810 ) ) ( not ( = ?auto_555809 ?auto_555811 ) ) ( not ( = ?auto_555809 ?auto_555812 ) ) ( not ( = ?auto_555809 ?auto_555813 ) ) ( not ( = ?auto_555809 ?auto_555814 ) ) ( not ( = ?auto_555810 ?auto_555811 ) ) ( not ( = ?auto_555810 ?auto_555812 ) ) ( not ( = ?auto_555810 ?auto_555813 ) ) ( not ( = ?auto_555810 ?auto_555814 ) ) ( not ( = ?auto_555811 ?auto_555812 ) ) ( not ( = ?auto_555811 ?auto_555813 ) ) ( not ( = ?auto_555811 ?auto_555814 ) ) ( not ( = ?auto_555812 ?auto_555813 ) ) ( not ( = ?auto_555812 ?auto_555814 ) ) ( not ( = ?auto_555813 ?auto_555814 ) ) ( ON ?auto_555812 ?auto_555813 ) ( ON ?auto_555811 ?auto_555812 ) ( ON ?auto_555810 ?auto_555811 ) ( ON ?auto_555809 ?auto_555810 ) ( CLEAR ?auto_555807 ) ( ON ?auto_555808 ?auto_555809 ) ( CLEAR ?auto_555808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_555801 ?auto_555802 ?auto_555803 ?auto_555804 ?auto_555805 ?auto_555806 ?auto_555807 ?auto_555808 )
      ( MAKE-13PILE ?auto_555801 ?auto_555802 ?auto_555803 ?auto_555804 ?auto_555805 ?auto_555806 ?auto_555807 ?auto_555808 ?auto_555809 ?auto_555810 ?auto_555811 ?auto_555812 ?auto_555813 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555855 - BLOCK
      ?auto_555856 - BLOCK
      ?auto_555857 - BLOCK
      ?auto_555858 - BLOCK
      ?auto_555859 - BLOCK
      ?auto_555860 - BLOCK
      ?auto_555861 - BLOCK
      ?auto_555862 - BLOCK
      ?auto_555863 - BLOCK
      ?auto_555864 - BLOCK
      ?auto_555865 - BLOCK
      ?auto_555866 - BLOCK
      ?auto_555867 - BLOCK
    )
    :vars
    (
      ?auto_555868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555867 ?auto_555868 ) ( ON-TABLE ?auto_555855 ) ( ON ?auto_555856 ?auto_555855 ) ( ON ?auto_555857 ?auto_555856 ) ( ON ?auto_555858 ?auto_555857 ) ( ON ?auto_555859 ?auto_555858 ) ( ON ?auto_555860 ?auto_555859 ) ( not ( = ?auto_555855 ?auto_555856 ) ) ( not ( = ?auto_555855 ?auto_555857 ) ) ( not ( = ?auto_555855 ?auto_555858 ) ) ( not ( = ?auto_555855 ?auto_555859 ) ) ( not ( = ?auto_555855 ?auto_555860 ) ) ( not ( = ?auto_555855 ?auto_555861 ) ) ( not ( = ?auto_555855 ?auto_555862 ) ) ( not ( = ?auto_555855 ?auto_555863 ) ) ( not ( = ?auto_555855 ?auto_555864 ) ) ( not ( = ?auto_555855 ?auto_555865 ) ) ( not ( = ?auto_555855 ?auto_555866 ) ) ( not ( = ?auto_555855 ?auto_555867 ) ) ( not ( = ?auto_555855 ?auto_555868 ) ) ( not ( = ?auto_555856 ?auto_555857 ) ) ( not ( = ?auto_555856 ?auto_555858 ) ) ( not ( = ?auto_555856 ?auto_555859 ) ) ( not ( = ?auto_555856 ?auto_555860 ) ) ( not ( = ?auto_555856 ?auto_555861 ) ) ( not ( = ?auto_555856 ?auto_555862 ) ) ( not ( = ?auto_555856 ?auto_555863 ) ) ( not ( = ?auto_555856 ?auto_555864 ) ) ( not ( = ?auto_555856 ?auto_555865 ) ) ( not ( = ?auto_555856 ?auto_555866 ) ) ( not ( = ?auto_555856 ?auto_555867 ) ) ( not ( = ?auto_555856 ?auto_555868 ) ) ( not ( = ?auto_555857 ?auto_555858 ) ) ( not ( = ?auto_555857 ?auto_555859 ) ) ( not ( = ?auto_555857 ?auto_555860 ) ) ( not ( = ?auto_555857 ?auto_555861 ) ) ( not ( = ?auto_555857 ?auto_555862 ) ) ( not ( = ?auto_555857 ?auto_555863 ) ) ( not ( = ?auto_555857 ?auto_555864 ) ) ( not ( = ?auto_555857 ?auto_555865 ) ) ( not ( = ?auto_555857 ?auto_555866 ) ) ( not ( = ?auto_555857 ?auto_555867 ) ) ( not ( = ?auto_555857 ?auto_555868 ) ) ( not ( = ?auto_555858 ?auto_555859 ) ) ( not ( = ?auto_555858 ?auto_555860 ) ) ( not ( = ?auto_555858 ?auto_555861 ) ) ( not ( = ?auto_555858 ?auto_555862 ) ) ( not ( = ?auto_555858 ?auto_555863 ) ) ( not ( = ?auto_555858 ?auto_555864 ) ) ( not ( = ?auto_555858 ?auto_555865 ) ) ( not ( = ?auto_555858 ?auto_555866 ) ) ( not ( = ?auto_555858 ?auto_555867 ) ) ( not ( = ?auto_555858 ?auto_555868 ) ) ( not ( = ?auto_555859 ?auto_555860 ) ) ( not ( = ?auto_555859 ?auto_555861 ) ) ( not ( = ?auto_555859 ?auto_555862 ) ) ( not ( = ?auto_555859 ?auto_555863 ) ) ( not ( = ?auto_555859 ?auto_555864 ) ) ( not ( = ?auto_555859 ?auto_555865 ) ) ( not ( = ?auto_555859 ?auto_555866 ) ) ( not ( = ?auto_555859 ?auto_555867 ) ) ( not ( = ?auto_555859 ?auto_555868 ) ) ( not ( = ?auto_555860 ?auto_555861 ) ) ( not ( = ?auto_555860 ?auto_555862 ) ) ( not ( = ?auto_555860 ?auto_555863 ) ) ( not ( = ?auto_555860 ?auto_555864 ) ) ( not ( = ?auto_555860 ?auto_555865 ) ) ( not ( = ?auto_555860 ?auto_555866 ) ) ( not ( = ?auto_555860 ?auto_555867 ) ) ( not ( = ?auto_555860 ?auto_555868 ) ) ( not ( = ?auto_555861 ?auto_555862 ) ) ( not ( = ?auto_555861 ?auto_555863 ) ) ( not ( = ?auto_555861 ?auto_555864 ) ) ( not ( = ?auto_555861 ?auto_555865 ) ) ( not ( = ?auto_555861 ?auto_555866 ) ) ( not ( = ?auto_555861 ?auto_555867 ) ) ( not ( = ?auto_555861 ?auto_555868 ) ) ( not ( = ?auto_555862 ?auto_555863 ) ) ( not ( = ?auto_555862 ?auto_555864 ) ) ( not ( = ?auto_555862 ?auto_555865 ) ) ( not ( = ?auto_555862 ?auto_555866 ) ) ( not ( = ?auto_555862 ?auto_555867 ) ) ( not ( = ?auto_555862 ?auto_555868 ) ) ( not ( = ?auto_555863 ?auto_555864 ) ) ( not ( = ?auto_555863 ?auto_555865 ) ) ( not ( = ?auto_555863 ?auto_555866 ) ) ( not ( = ?auto_555863 ?auto_555867 ) ) ( not ( = ?auto_555863 ?auto_555868 ) ) ( not ( = ?auto_555864 ?auto_555865 ) ) ( not ( = ?auto_555864 ?auto_555866 ) ) ( not ( = ?auto_555864 ?auto_555867 ) ) ( not ( = ?auto_555864 ?auto_555868 ) ) ( not ( = ?auto_555865 ?auto_555866 ) ) ( not ( = ?auto_555865 ?auto_555867 ) ) ( not ( = ?auto_555865 ?auto_555868 ) ) ( not ( = ?auto_555866 ?auto_555867 ) ) ( not ( = ?auto_555866 ?auto_555868 ) ) ( not ( = ?auto_555867 ?auto_555868 ) ) ( ON ?auto_555866 ?auto_555867 ) ( ON ?auto_555865 ?auto_555866 ) ( ON ?auto_555864 ?auto_555865 ) ( ON ?auto_555863 ?auto_555864 ) ( ON ?auto_555862 ?auto_555863 ) ( CLEAR ?auto_555860 ) ( ON ?auto_555861 ?auto_555862 ) ( CLEAR ?auto_555861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_555855 ?auto_555856 ?auto_555857 ?auto_555858 ?auto_555859 ?auto_555860 ?auto_555861 )
      ( MAKE-13PILE ?auto_555855 ?auto_555856 ?auto_555857 ?auto_555858 ?auto_555859 ?auto_555860 ?auto_555861 ?auto_555862 ?auto_555863 ?auto_555864 ?auto_555865 ?auto_555866 ?auto_555867 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555909 - BLOCK
      ?auto_555910 - BLOCK
      ?auto_555911 - BLOCK
      ?auto_555912 - BLOCK
      ?auto_555913 - BLOCK
      ?auto_555914 - BLOCK
      ?auto_555915 - BLOCK
      ?auto_555916 - BLOCK
      ?auto_555917 - BLOCK
      ?auto_555918 - BLOCK
      ?auto_555919 - BLOCK
      ?auto_555920 - BLOCK
      ?auto_555921 - BLOCK
    )
    :vars
    (
      ?auto_555922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555921 ?auto_555922 ) ( ON-TABLE ?auto_555909 ) ( ON ?auto_555910 ?auto_555909 ) ( ON ?auto_555911 ?auto_555910 ) ( ON ?auto_555912 ?auto_555911 ) ( ON ?auto_555913 ?auto_555912 ) ( not ( = ?auto_555909 ?auto_555910 ) ) ( not ( = ?auto_555909 ?auto_555911 ) ) ( not ( = ?auto_555909 ?auto_555912 ) ) ( not ( = ?auto_555909 ?auto_555913 ) ) ( not ( = ?auto_555909 ?auto_555914 ) ) ( not ( = ?auto_555909 ?auto_555915 ) ) ( not ( = ?auto_555909 ?auto_555916 ) ) ( not ( = ?auto_555909 ?auto_555917 ) ) ( not ( = ?auto_555909 ?auto_555918 ) ) ( not ( = ?auto_555909 ?auto_555919 ) ) ( not ( = ?auto_555909 ?auto_555920 ) ) ( not ( = ?auto_555909 ?auto_555921 ) ) ( not ( = ?auto_555909 ?auto_555922 ) ) ( not ( = ?auto_555910 ?auto_555911 ) ) ( not ( = ?auto_555910 ?auto_555912 ) ) ( not ( = ?auto_555910 ?auto_555913 ) ) ( not ( = ?auto_555910 ?auto_555914 ) ) ( not ( = ?auto_555910 ?auto_555915 ) ) ( not ( = ?auto_555910 ?auto_555916 ) ) ( not ( = ?auto_555910 ?auto_555917 ) ) ( not ( = ?auto_555910 ?auto_555918 ) ) ( not ( = ?auto_555910 ?auto_555919 ) ) ( not ( = ?auto_555910 ?auto_555920 ) ) ( not ( = ?auto_555910 ?auto_555921 ) ) ( not ( = ?auto_555910 ?auto_555922 ) ) ( not ( = ?auto_555911 ?auto_555912 ) ) ( not ( = ?auto_555911 ?auto_555913 ) ) ( not ( = ?auto_555911 ?auto_555914 ) ) ( not ( = ?auto_555911 ?auto_555915 ) ) ( not ( = ?auto_555911 ?auto_555916 ) ) ( not ( = ?auto_555911 ?auto_555917 ) ) ( not ( = ?auto_555911 ?auto_555918 ) ) ( not ( = ?auto_555911 ?auto_555919 ) ) ( not ( = ?auto_555911 ?auto_555920 ) ) ( not ( = ?auto_555911 ?auto_555921 ) ) ( not ( = ?auto_555911 ?auto_555922 ) ) ( not ( = ?auto_555912 ?auto_555913 ) ) ( not ( = ?auto_555912 ?auto_555914 ) ) ( not ( = ?auto_555912 ?auto_555915 ) ) ( not ( = ?auto_555912 ?auto_555916 ) ) ( not ( = ?auto_555912 ?auto_555917 ) ) ( not ( = ?auto_555912 ?auto_555918 ) ) ( not ( = ?auto_555912 ?auto_555919 ) ) ( not ( = ?auto_555912 ?auto_555920 ) ) ( not ( = ?auto_555912 ?auto_555921 ) ) ( not ( = ?auto_555912 ?auto_555922 ) ) ( not ( = ?auto_555913 ?auto_555914 ) ) ( not ( = ?auto_555913 ?auto_555915 ) ) ( not ( = ?auto_555913 ?auto_555916 ) ) ( not ( = ?auto_555913 ?auto_555917 ) ) ( not ( = ?auto_555913 ?auto_555918 ) ) ( not ( = ?auto_555913 ?auto_555919 ) ) ( not ( = ?auto_555913 ?auto_555920 ) ) ( not ( = ?auto_555913 ?auto_555921 ) ) ( not ( = ?auto_555913 ?auto_555922 ) ) ( not ( = ?auto_555914 ?auto_555915 ) ) ( not ( = ?auto_555914 ?auto_555916 ) ) ( not ( = ?auto_555914 ?auto_555917 ) ) ( not ( = ?auto_555914 ?auto_555918 ) ) ( not ( = ?auto_555914 ?auto_555919 ) ) ( not ( = ?auto_555914 ?auto_555920 ) ) ( not ( = ?auto_555914 ?auto_555921 ) ) ( not ( = ?auto_555914 ?auto_555922 ) ) ( not ( = ?auto_555915 ?auto_555916 ) ) ( not ( = ?auto_555915 ?auto_555917 ) ) ( not ( = ?auto_555915 ?auto_555918 ) ) ( not ( = ?auto_555915 ?auto_555919 ) ) ( not ( = ?auto_555915 ?auto_555920 ) ) ( not ( = ?auto_555915 ?auto_555921 ) ) ( not ( = ?auto_555915 ?auto_555922 ) ) ( not ( = ?auto_555916 ?auto_555917 ) ) ( not ( = ?auto_555916 ?auto_555918 ) ) ( not ( = ?auto_555916 ?auto_555919 ) ) ( not ( = ?auto_555916 ?auto_555920 ) ) ( not ( = ?auto_555916 ?auto_555921 ) ) ( not ( = ?auto_555916 ?auto_555922 ) ) ( not ( = ?auto_555917 ?auto_555918 ) ) ( not ( = ?auto_555917 ?auto_555919 ) ) ( not ( = ?auto_555917 ?auto_555920 ) ) ( not ( = ?auto_555917 ?auto_555921 ) ) ( not ( = ?auto_555917 ?auto_555922 ) ) ( not ( = ?auto_555918 ?auto_555919 ) ) ( not ( = ?auto_555918 ?auto_555920 ) ) ( not ( = ?auto_555918 ?auto_555921 ) ) ( not ( = ?auto_555918 ?auto_555922 ) ) ( not ( = ?auto_555919 ?auto_555920 ) ) ( not ( = ?auto_555919 ?auto_555921 ) ) ( not ( = ?auto_555919 ?auto_555922 ) ) ( not ( = ?auto_555920 ?auto_555921 ) ) ( not ( = ?auto_555920 ?auto_555922 ) ) ( not ( = ?auto_555921 ?auto_555922 ) ) ( ON ?auto_555920 ?auto_555921 ) ( ON ?auto_555919 ?auto_555920 ) ( ON ?auto_555918 ?auto_555919 ) ( ON ?auto_555917 ?auto_555918 ) ( ON ?auto_555916 ?auto_555917 ) ( ON ?auto_555915 ?auto_555916 ) ( CLEAR ?auto_555913 ) ( ON ?auto_555914 ?auto_555915 ) ( CLEAR ?auto_555914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_555909 ?auto_555910 ?auto_555911 ?auto_555912 ?auto_555913 ?auto_555914 )
      ( MAKE-13PILE ?auto_555909 ?auto_555910 ?auto_555911 ?auto_555912 ?auto_555913 ?auto_555914 ?auto_555915 ?auto_555916 ?auto_555917 ?auto_555918 ?auto_555919 ?auto_555920 ?auto_555921 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_555963 - BLOCK
      ?auto_555964 - BLOCK
      ?auto_555965 - BLOCK
      ?auto_555966 - BLOCK
      ?auto_555967 - BLOCK
      ?auto_555968 - BLOCK
      ?auto_555969 - BLOCK
      ?auto_555970 - BLOCK
      ?auto_555971 - BLOCK
      ?auto_555972 - BLOCK
      ?auto_555973 - BLOCK
      ?auto_555974 - BLOCK
      ?auto_555975 - BLOCK
    )
    :vars
    (
      ?auto_555976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_555975 ?auto_555976 ) ( ON-TABLE ?auto_555963 ) ( ON ?auto_555964 ?auto_555963 ) ( ON ?auto_555965 ?auto_555964 ) ( ON ?auto_555966 ?auto_555965 ) ( not ( = ?auto_555963 ?auto_555964 ) ) ( not ( = ?auto_555963 ?auto_555965 ) ) ( not ( = ?auto_555963 ?auto_555966 ) ) ( not ( = ?auto_555963 ?auto_555967 ) ) ( not ( = ?auto_555963 ?auto_555968 ) ) ( not ( = ?auto_555963 ?auto_555969 ) ) ( not ( = ?auto_555963 ?auto_555970 ) ) ( not ( = ?auto_555963 ?auto_555971 ) ) ( not ( = ?auto_555963 ?auto_555972 ) ) ( not ( = ?auto_555963 ?auto_555973 ) ) ( not ( = ?auto_555963 ?auto_555974 ) ) ( not ( = ?auto_555963 ?auto_555975 ) ) ( not ( = ?auto_555963 ?auto_555976 ) ) ( not ( = ?auto_555964 ?auto_555965 ) ) ( not ( = ?auto_555964 ?auto_555966 ) ) ( not ( = ?auto_555964 ?auto_555967 ) ) ( not ( = ?auto_555964 ?auto_555968 ) ) ( not ( = ?auto_555964 ?auto_555969 ) ) ( not ( = ?auto_555964 ?auto_555970 ) ) ( not ( = ?auto_555964 ?auto_555971 ) ) ( not ( = ?auto_555964 ?auto_555972 ) ) ( not ( = ?auto_555964 ?auto_555973 ) ) ( not ( = ?auto_555964 ?auto_555974 ) ) ( not ( = ?auto_555964 ?auto_555975 ) ) ( not ( = ?auto_555964 ?auto_555976 ) ) ( not ( = ?auto_555965 ?auto_555966 ) ) ( not ( = ?auto_555965 ?auto_555967 ) ) ( not ( = ?auto_555965 ?auto_555968 ) ) ( not ( = ?auto_555965 ?auto_555969 ) ) ( not ( = ?auto_555965 ?auto_555970 ) ) ( not ( = ?auto_555965 ?auto_555971 ) ) ( not ( = ?auto_555965 ?auto_555972 ) ) ( not ( = ?auto_555965 ?auto_555973 ) ) ( not ( = ?auto_555965 ?auto_555974 ) ) ( not ( = ?auto_555965 ?auto_555975 ) ) ( not ( = ?auto_555965 ?auto_555976 ) ) ( not ( = ?auto_555966 ?auto_555967 ) ) ( not ( = ?auto_555966 ?auto_555968 ) ) ( not ( = ?auto_555966 ?auto_555969 ) ) ( not ( = ?auto_555966 ?auto_555970 ) ) ( not ( = ?auto_555966 ?auto_555971 ) ) ( not ( = ?auto_555966 ?auto_555972 ) ) ( not ( = ?auto_555966 ?auto_555973 ) ) ( not ( = ?auto_555966 ?auto_555974 ) ) ( not ( = ?auto_555966 ?auto_555975 ) ) ( not ( = ?auto_555966 ?auto_555976 ) ) ( not ( = ?auto_555967 ?auto_555968 ) ) ( not ( = ?auto_555967 ?auto_555969 ) ) ( not ( = ?auto_555967 ?auto_555970 ) ) ( not ( = ?auto_555967 ?auto_555971 ) ) ( not ( = ?auto_555967 ?auto_555972 ) ) ( not ( = ?auto_555967 ?auto_555973 ) ) ( not ( = ?auto_555967 ?auto_555974 ) ) ( not ( = ?auto_555967 ?auto_555975 ) ) ( not ( = ?auto_555967 ?auto_555976 ) ) ( not ( = ?auto_555968 ?auto_555969 ) ) ( not ( = ?auto_555968 ?auto_555970 ) ) ( not ( = ?auto_555968 ?auto_555971 ) ) ( not ( = ?auto_555968 ?auto_555972 ) ) ( not ( = ?auto_555968 ?auto_555973 ) ) ( not ( = ?auto_555968 ?auto_555974 ) ) ( not ( = ?auto_555968 ?auto_555975 ) ) ( not ( = ?auto_555968 ?auto_555976 ) ) ( not ( = ?auto_555969 ?auto_555970 ) ) ( not ( = ?auto_555969 ?auto_555971 ) ) ( not ( = ?auto_555969 ?auto_555972 ) ) ( not ( = ?auto_555969 ?auto_555973 ) ) ( not ( = ?auto_555969 ?auto_555974 ) ) ( not ( = ?auto_555969 ?auto_555975 ) ) ( not ( = ?auto_555969 ?auto_555976 ) ) ( not ( = ?auto_555970 ?auto_555971 ) ) ( not ( = ?auto_555970 ?auto_555972 ) ) ( not ( = ?auto_555970 ?auto_555973 ) ) ( not ( = ?auto_555970 ?auto_555974 ) ) ( not ( = ?auto_555970 ?auto_555975 ) ) ( not ( = ?auto_555970 ?auto_555976 ) ) ( not ( = ?auto_555971 ?auto_555972 ) ) ( not ( = ?auto_555971 ?auto_555973 ) ) ( not ( = ?auto_555971 ?auto_555974 ) ) ( not ( = ?auto_555971 ?auto_555975 ) ) ( not ( = ?auto_555971 ?auto_555976 ) ) ( not ( = ?auto_555972 ?auto_555973 ) ) ( not ( = ?auto_555972 ?auto_555974 ) ) ( not ( = ?auto_555972 ?auto_555975 ) ) ( not ( = ?auto_555972 ?auto_555976 ) ) ( not ( = ?auto_555973 ?auto_555974 ) ) ( not ( = ?auto_555973 ?auto_555975 ) ) ( not ( = ?auto_555973 ?auto_555976 ) ) ( not ( = ?auto_555974 ?auto_555975 ) ) ( not ( = ?auto_555974 ?auto_555976 ) ) ( not ( = ?auto_555975 ?auto_555976 ) ) ( ON ?auto_555974 ?auto_555975 ) ( ON ?auto_555973 ?auto_555974 ) ( ON ?auto_555972 ?auto_555973 ) ( ON ?auto_555971 ?auto_555972 ) ( ON ?auto_555970 ?auto_555971 ) ( ON ?auto_555969 ?auto_555970 ) ( ON ?auto_555968 ?auto_555969 ) ( CLEAR ?auto_555966 ) ( ON ?auto_555967 ?auto_555968 ) ( CLEAR ?auto_555967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_555963 ?auto_555964 ?auto_555965 ?auto_555966 ?auto_555967 )
      ( MAKE-13PILE ?auto_555963 ?auto_555964 ?auto_555965 ?auto_555966 ?auto_555967 ?auto_555968 ?auto_555969 ?auto_555970 ?auto_555971 ?auto_555972 ?auto_555973 ?auto_555974 ?auto_555975 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_556017 - BLOCK
      ?auto_556018 - BLOCK
      ?auto_556019 - BLOCK
      ?auto_556020 - BLOCK
      ?auto_556021 - BLOCK
      ?auto_556022 - BLOCK
      ?auto_556023 - BLOCK
      ?auto_556024 - BLOCK
      ?auto_556025 - BLOCK
      ?auto_556026 - BLOCK
      ?auto_556027 - BLOCK
      ?auto_556028 - BLOCK
      ?auto_556029 - BLOCK
    )
    :vars
    (
      ?auto_556030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556029 ?auto_556030 ) ( ON-TABLE ?auto_556017 ) ( ON ?auto_556018 ?auto_556017 ) ( ON ?auto_556019 ?auto_556018 ) ( not ( = ?auto_556017 ?auto_556018 ) ) ( not ( = ?auto_556017 ?auto_556019 ) ) ( not ( = ?auto_556017 ?auto_556020 ) ) ( not ( = ?auto_556017 ?auto_556021 ) ) ( not ( = ?auto_556017 ?auto_556022 ) ) ( not ( = ?auto_556017 ?auto_556023 ) ) ( not ( = ?auto_556017 ?auto_556024 ) ) ( not ( = ?auto_556017 ?auto_556025 ) ) ( not ( = ?auto_556017 ?auto_556026 ) ) ( not ( = ?auto_556017 ?auto_556027 ) ) ( not ( = ?auto_556017 ?auto_556028 ) ) ( not ( = ?auto_556017 ?auto_556029 ) ) ( not ( = ?auto_556017 ?auto_556030 ) ) ( not ( = ?auto_556018 ?auto_556019 ) ) ( not ( = ?auto_556018 ?auto_556020 ) ) ( not ( = ?auto_556018 ?auto_556021 ) ) ( not ( = ?auto_556018 ?auto_556022 ) ) ( not ( = ?auto_556018 ?auto_556023 ) ) ( not ( = ?auto_556018 ?auto_556024 ) ) ( not ( = ?auto_556018 ?auto_556025 ) ) ( not ( = ?auto_556018 ?auto_556026 ) ) ( not ( = ?auto_556018 ?auto_556027 ) ) ( not ( = ?auto_556018 ?auto_556028 ) ) ( not ( = ?auto_556018 ?auto_556029 ) ) ( not ( = ?auto_556018 ?auto_556030 ) ) ( not ( = ?auto_556019 ?auto_556020 ) ) ( not ( = ?auto_556019 ?auto_556021 ) ) ( not ( = ?auto_556019 ?auto_556022 ) ) ( not ( = ?auto_556019 ?auto_556023 ) ) ( not ( = ?auto_556019 ?auto_556024 ) ) ( not ( = ?auto_556019 ?auto_556025 ) ) ( not ( = ?auto_556019 ?auto_556026 ) ) ( not ( = ?auto_556019 ?auto_556027 ) ) ( not ( = ?auto_556019 ?auto_556028 ) ) ( not ( = ?auto_556019 ?auto_556029 ) ) ( not ( = ?auto_556019 ?auto_556030 ) ) ( not ( = ?auto_556020 ?auto_556021 ) ) ( not ( = ?auto_556020 ?auto_556022 ) ) ( not ( = ?auto_556020 ?auto_556023 ) ) ( not ( = ?auto_556020 ?auto_556024 ) ) ( not ( = ?auto_556020 ?auto_556025 ) ) ( not ( = ?auto_556020 ?auto_556026 ) ) ( not ( = ?auto_556020 ?auto_556027 ) ) ( not ( = ?auto_556020 ?auto_556028 ) ) ( not ( = ?auto_556020 ?auto_556029 ) ) ( not ( = ?auto_556020 ?auto_556030 ) ) ( not ( = ?auto_556021 ?auto_556022 ) ) ( not ( = ?auto_556021 ?auto_556023 ) ) ( not ( = ?auto_556021 ?auto_556024 ) ) ( not ( = ?auto_556021 ?auto_556025 ) ) ( not ( = ?auto_556021 ?auto_556026 ) ) ( not ( = ?auto_556021 ?auto_556027 ) ) ( not ( = ?auto_556021 ?auto_556028 ) ) ( not ( = ?auto_556021 ?auto_556029 ) ) ( not ( = ?auto_556021 ?auto_556030 ) ) ( not ( = ?auto_556022 ?auto_556023 ) ) ( not ( = ?auto_556022 ?auto_556024 ) ) ( not ( = ?auto_556022 ?auto_556025 ) ) ( not ( = ?auto_556022 ?auto_556026 ) ) ( not ( = ?auto_556022 ?auto_556027 ) ) ( not ( = ?auto_556022 ?auto_556028 ) ) ( not ( = ?auto_556022 ?auto_556029 ) ) ( not ( = ?auto_556022 ?auto_556030 ) ) ( not ( = ?auto_556023 ?auto_556024 ) ) ( not ( = ?auto_556023 ?auto_556025 ) ) ( not ( = ?auto_556023 ?auto_556026 ) ) ( not ( = ?auto_556023 ?auto_556027 ) ) ( not ( = ?auto_556023 ?auto_556028 ) ) ( not ( = ?auto_556023 ?auto_556029 ) ) ( not ( = ?auto_556023 ?auto_556030 ) ) ( not ( = ?auto_556024 ?auto_556025 ) ) ( not ( = ?auto_556024 ?auto_556026 ) ) ( not ( = ?auto_556024 ?auto_556027 ) ) ( not ( = ?auto_556024 ?auto_556028 ) ) ( not ( = ?auto_556024 ?auto_556029 ) ) ( not ( = ?auto_556024 ?auto_556030 ) ) ( not ( = ?auto_556025 ?auto_556026 ) ) ( not ( = ?auto_556025 ?auto_556027 ) ) ( not ( = ?auto_556025 ?auto_556028 ) ) ( not ( = ?auto_556025 ?auto_556029 ) ) ( not ( = ?auto_556025 ?auto_556030 ) ) ( not ( = ?auto_556026 ?auto_556027 ) ) ( not ( = ?auto_556026 ?auto_556028 ) ) ( not ( = ?auto_556026 ?auto_556029 ) ) ( not ( = ?auto_556026 ?auto_556030 ) ) ( not ( = ?auto_556027 ?auto_556028 ) ) ( not ( = ?auto_556027 ?auto_556029 ) ) ( not ( = ?auto_556027 ?auto_556030 ) ) ( not ( = ?auto_556028 ?auto_556029 ) ) ( not ( = ?auto_556028 ?auto_556030 ) ) ( not ( = ?auto_556029 ?auto_556030 ) ) ( ON ?auto_556028 ?auto_556029 ) ( ON ?auto_556027 ?auto_556028 ) ( ON ?auto_556026 ?auto_556027 ) ( ON ?auto_556025 ?auto_556026 ) ( ON ?auto_556024 ?auto_556025 ) ( ON ?auto_556023 ?auto_556024 ) ( ON ?auto_556022 ?auto_556023 ) ( ON ?auto_556021 ?auto_556022 ) ( CLEAR ?auto_556019 ) ( ON ?auto_556020 ?auto_556021 ) ( CLEAR ?auto_556020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_556017 ?auto_556018 ?auto_556019 ?auto_556020 )
      ( MAKE-13PILE ?auto_556017 ?auto_556018 ?auto_556019 ?auto_556020 ?auto_556021 ?auto_556022 ?auto_556023 ?auto_556024 ?auto_556025 ?auto_556026 ?auto_556027 ?auto_556028 ?auto_556029 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_556071 - BLOCK
      ?auto_556072 - BLOCK
      ?auto_556073 - BLOCK
      ?auto_556074 - BLOCK
      ?auto_556075 - BLOCK
      ?auto_556076 - BLOCK
      ?auto_556077 - BLOCK
      ?auto_556078 - BLOCK
      ?auto_556079 - BLOCK
      ?auto_556080 - BLOCK
      ?auto_556081 - BLOCK
      ?auto_556082 - BLOCK
      ?auto_556083 - BLOCK
    )
    :vars
    (
      ?auto_556084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556083 ?auto_556084 ) ( ON-TABLE ?auto_556071 ) ( ON ?auto_556072 ?auto_556071 ) ( not ( = ?auto_556071 ?auto_556072 ) ) ( not ( = ?auto_556071 ?auto_556073 ) ) ( not ( = ?auto_556071 ?auto_556074 ) ) ( not ( = ?auto_556071 ?auto_556075 ) ) ( not ( = ?auto_556071 ?auto_556076 ) ) ( not ( = ?auto_556071 ?auto_556077 ) ) ( not ( = ?auto_556071 ?auto_556078 ) ) ( not ( = ?auto_556071 ?auto_556079 ) ) ( not ( = ?auto_556071 ?auto_556080 ) ) ( not ( = ?auto_556071 ?auto_556081 ) ) ( not ( = ?auto_556071 ?auto_556082 ) ) ( not ( = ?auto_556071 ?auto_556083 ) ) ( not ( = ?auto_556071 ?auto_556084 ) ) ( not ( = ?auto_556072 ?auto_556073 ) ) ( not ( = ?auto_556072 ?auto_556074 ) ) ( not ( = ?auto_556072 ?auto_556075 ) ) ( not ( = ?auto_556072 ?auto_556076 ) ) ( not ( = ?auto_556072 ?auto_556077 ) ) ( not ( = ?auto_556072 ?auto_556078 ) ) ( not ( = ?auto_556072 ?auto_556079 ) ) ( not ( = ?auto_556072 ?auto_556080 ) ) ( not ( = ?auto_556072 ?auto_556081 ) ) ( not ( = ?auto_556072 ?auto_556082 ) ) ( not ( = ?auto_556072 ?auto_556083 ) ) ( not ( = ?auto_556072 ?auto_556084 ) ) ( not ( = ?auto_556073 ?auto_556074 ) ) ( not ( = ?auto_556073 ?auto_556075 ) ) ( not ( = ?auto_556073 ?auto_556076 ) ) ( not ( = ?auto_556073 ?auto_556077 ) ) ( not ( = ?auto_556073 ?auto_556078 ) ) ( not ( = ?auto_556073 ?auto_556079 ) ) ( not ( = ?auto_556073 ?auto_556080 ) ) ( not ( = ?auto_556073 ?auto_556081 ) ) ( not ( = ?auto_556073 ?auto_556082 ) ) ( not ( = ?auto_556073 ?auto_556083 ) ) ( not ( = ?auto_556073 ?auto_556084 ) ) ( not ( = ?auto_556074 ?auto_556075 ) ) ( not ( = ?auto_556074 ?auto_556076 ) ) ( not ( = ?auto_556074 ?auto_556077 ) ) ( not ( = ?auto_556074 ?auto_556078 ) ) ( not ( = ?auto_556074 ?auto_556079 ) ) ( not ( = ?auto_556074 ?auto_556080 ) ) ( not ( = ?auto_556074 ?auto_556081 ) ) ( not ( = ?auto_556074 ?auto_556082 ) ) ( not ( = ?auto_556074 ?auto_556083 ) ) ( not ( = ?auto_556074 ?auto_556084 ) ) ( not ( = ?auto_556075 ?auto_556076 ) ) ( not ( = ?auto_556075 ?auto_556077 ) ) ( not ( = ?auto_556075 ?auto_556078 ) ) ( not ( = ?auto_556075 ?auto_556079 ) ) ( not ( = ?auto_556075 ?auto_556080 ) ) ( not ( = ?auto_556075 ?auto_556081 ) ) ( not ( = ?auto_556075 ?auto_556082 ) ) ( not ( = ?auto_556075 ?auto_556083 ) ) ( not ( = ?auto_556075 ?auto_556084 ) ) ( not ( = ?auto_556076 ?auto_556077 ) ) ( not ( = ?auto_556076 ?auto_556078 ) ) ( not ( = ?auto_556076 ?auto_556079 ) ) ( not ( = ?auto_556076 ?auto_556080 ) ) ( not ( = ?auto_556076 ?auto_556081 ) ) ( not ( = ?auto_556076 ?auto_556082 ) ) ( not ( = ?auto_556076 ?auto_556083 ) ) ( not ( = ?auto_556076 ?auto_556084 ) ) ( not ( = ?auto_556077 ?auto_556078 ) ) ( not ( = ?auto_556077 ?auto_556079 ) ) ( not ( = ?auto_556077 ?auto_556080 ) ) ( not ( = ?auto_556077 ?auto_556081 ) ) ( not ( = ?auto_556077 ?auto_556082 ) ) ( not ( = ?auto_556077 ?auto_556083 ) ) ( not ( = ?auto_556077 ?auto_556084 ) ) ( not ( = ?auto_556078 ?auto_556079 ) ) ( not ( = ?auto_556078 ?auto_556080 ) ) ( not ( = ?auto_556078 ?auto_556081 ) ) ( not ( = ?auto_556078 ?auto_556082 ) ) ( not ( = ?auto_556078 ?auto_556083 ) ) ( not ( = ?auto_556078 ?auto_556084 ) ) ( not ( = ?auto_556079 ?auto_556080 ) ) ( not ( = ?auto_556079 ?auto_556081 ) ) ( not ( = ?auto_556079 ?auto_556082 ) ) ( not ( = ?auto_556079 ?auto_556083 ) ) ( not ( = ?auto_556079 ?auto_556084 ) ) ( not ( = ?auto_556080 ?auto_556081 ) ) ( not ( = ?auto_556080 ?auto_556082 ) ) ( not ( = ?auto_556080 ?auto_556083 ) ) ( not ( = ?auto_556080 ?auto_556084 ) ) ( not ( = ?auto_556081 ?auto_556082 ) ) ( not ( = ?auto_556081 ?auto_556083 ) ) ( not ( = ?auto_556081 ?auto_556084 ) ) ( not ( = ?auto_556082 ?auto_556083 ) ) ( not ( = ?auto_556082 ?auto_556084 ) ) ( not ( = ?auto_556083 ?auto_556084 ) ) ( ON ?auto_556082 ?auto_556083 ) ( ON ?auto_556081 ?auto_556082 ) ( ON ?auto_556080 ?auto_556081 ) ( ON ?auto_556079 ?auto_556080 ) ( ON ?auto_556078 ?auto_556079 ) ( ON ?auto_556077 ?auto_556078 ) ( ON ?auto_556076 ?auto_556077 ) ( ON ?auto_556075 ?auto_556076 ) ( ON ?auto_556074 ?auto_556075 ) ( CLEAR ?auto_556072 ) ( ON ?auto_556073 ?auto_556074 ) ( CLEAR ?auto_556073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_556071 ?auto_556072 ?auto_556073 )
      ( MAKE-13PILE ?auto_556071 ?auto_556072 ?auto_556073 ?auto_556074 ?auto_556075 ?auto_556076 ?auto_556077 ?auto_556078 ?auto_556079 ?auto_556080 ?auto_556081 ?auto_556082 ?auto_556083 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_556125 - BLOCK
      ?auto_556126 - BLOCK
      ?auto_556127 - BLOCK
      ?auto_556128 - BLOCK
      ?auto_556129 - BLOCK
      ?auto_556130 - BLOCK
      ?auto_556131 - BLOCK
      ?auto_556132 - BLOCK
      ?auto_556133 - BLOCK
      ?auto_556134 - BLOCK
      ?auto_556135 - BLOCK
      ?auto_556136 - BLOCK
      ?auto_556137 - BLOCK
    )
    :vars
    (
      ?auto_556138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556137 ?auto_556138 ) ( ON-TABLE ?auto_556125 ) ( not ( = ?auto_556125 ?auto_556126 ) ) ( not ( = ?auto_556125 ?auto_556127 ) ) ( not ( = ?auto_556125 ?auto_556128 ) ) ( not ( = ?auto_556125 ?auto_556129 ) ) ( not ( = ?auto_556125 ?auto_556130 ) ) ( not ( = ?auto_556125 ?auto_556131 ) ) ( not ( = ?auto_556125 ?auto_556132 ) ) ( not ( = ?auto_556125 ?auto_556133 ) ) ( not ( = ?auto_556125 ?auto_556134 ) ) ( not ( = ?auto_556125 ?auto_556135 ) ) ( not ( = ?auto_556125 ?auto_556136 ) ) ( not ( = ?auto_556125 ?auto_556137 ) ) ( not ( = ?auto_556125 ?auto_556138 ) ) ( not ( = ?auto_556126 ?auto_556127 ) ) ( not ( = ?auto_556126 ?auto_556128 ) ) ( not ( = ?auto_556126 ?auto_556129 ) ) ( not ( = ?auto_556126 ?auto_556130 ) ) ( not ( = ?auto_556126 ?auto_556131 ) ) ( not ( = ?auto_556126 ?auto_556132 ) ) ( not ( = ?auto_556126 ?auto_556133 ) ) ( not ( = ?auto_556126 ?auto_556134 ) ) ( not ( = ?auto_556126 ?auto_556135 ) ) ( not ( = ?auto_556126 ?auto_556136 ) ) ( not ( = ?auto_556126 ?auto_556137 ) ) ( not ( = ?auto_556126 ?auto_556138 ) ) ( not ( = ?auto_556127 ?auto_556128 ) ) ( not ( = ?auto_556127 ?auto_556129 ) ) ( not ( = ?auto_556127 ?auto_556130 ) ) ( not ( = ?auto_556127 ?auto_556131 ) ) ( not ( = ?auto_556127 ?auto_556132 ) ) ( not ( = ?auto_556127 ?auto_556133 ) ) ( not ( = ?auto_556127 ?auto_556134 ) ) ( not ( = ?auto_556127 ?auto_556135 ) ) ( not ( = ?auto_556127 ?auto_556136 ) ) ( not ( = ?auto_556127 ?auto_556137 ) ) ( not ( = ?auto_556127 ?auto_556138 ) ) ( not ( = ?auto_556128 ?auto_556129 ) ) ( not ( = ?auto_556128 ?auto_556130 ) ) ( not ( = ?auto_556128 ?auto_556131 ) ) ( not ( = ?auto_556128 ?auto_556132 ) ) ( not ( = ?auto_556128 ?auto_556133 ) ) ( not ( = ?auto_556128 ?auto_556134 ) ) ( not ( = ?auto_556128 ?auto_556135 ) ) ( not ( = ?auto_556128 ?auto_556136 ) ) ( not ( = ?auto_556128 ?auto_556137 ) ) ( not ( = ?auto_556128 ?auto_556138 ) ) ( not ( = ?auto_556129 ?auto_556130 ) ) ( not ( = ?auto_556129 ?auto_556131 ) ) ( not ( = ?auto_556129 ?auto_556132 ) ) ( not ( = ?auto_556129 ?auto_556133 ) ) ( not ( = ?auto_556129 ?auto_556134 ) ) ( not ( = ?auto_556129 ?auto_556135 ) ) ( not ( = ?auto_556129 ?auto_556136 ) ) ( not ( = ?auto_556129 ?auto_556137 ) ) ( not ( = ?auto_556129 ?auto_556138 ) ) ( not ( = ?auto_556130 ?auto_556131 ) ) ( not ( = ?auto_556130 ?auto_556132 ) ) ( not ( = ?auto_556130 ?auto_556133 ) ) ( not ( = ?auto_556130 ?auto_556134 ) ) ( not ( = ?auto_556130 ?auto_556135 ) ) ( not ( = ?auto_556130 ?auto_556136 ) ) ( not ( = ?auto_556130 ?auto_556137 ) ) ( not ( = ?auto_556130 ?auto_556138 ) ) ( not ( = ?auto_556131 ?auto_556132 ) ) ( not ( = ?auto_556131 ?auto_556133 ) ) ( not ( = ?auto_556131 ?auto_556134 ) ) ( not ( = ?auto_556131 ?auto_556135 ) ) ( not ( = ?auto_556131 ?auto_556136 ) ) ( not ( = ?auto_556131 ?auto_556137 ) ) ( not ( = ?auto_556131 ?auto_556138 ) ) ( not ( = ?auto_556132 ?auto_556133 ) ) ( not ( = ?auto_556132 ?auto_556134 ) ) ( not ( = ?auto_556132 ?auto_556135 ) ) ( not ( = ?auto_556132 ?auto_556136 ) ) ( not ( = ?auto_556132 ?auto_556137 ) ) ( not ( = ?auto_556132 ?auto_556138 ) ) ( not ( = ?auto_556133 ?auto_556134 ) ) ( not ( = ?auto_556133 ?auto_556135 ) ) ( not ( = ?auto_556133 ?auto_556136 ) ) ( not ( = ?auto_556133 ?auto_556137 ) ) ( not ( = ?auto_556133 ?auto_556138 ) ) ( not ( = ?auto_556134 ?auto_556135 ) ) ( not ( = ?auto_556134 ?auto_556136 ) ) ( not ( = ?auto_556134 ?auto_556137 ) ) ( not ( = ?auto_556134 ?auto_556138 ) ) ( not ( = ?auto_556135 ?auto_556136 ) ) ( not ( = ?auto_556135 ?auto_556137 ) ) ( not ( = ?auto_556135 ?auto_556138 ) ) ( not ( = ?auto_556136 ?auto_556137 ) ) ( not ( = ?auto_556136 ?auto_556138 ) ) ( not ( = ?auto_556137 ?auto_556138 ) ) ( ON ?auto_556136 ?auto_556137 ) ( ON ?auto_556135 ?auto_556136 ) ( ON ?auto_556134 ?auto_556135 ) ( ON ?auto_556133 ?auto_556134 ) ( ON ?auto_556132 ?auto_556133 ) ( ON ?auto_556131 ?auto_556132 ) ( ON ?auto_556130 ?auto_556131 ) ( ON ?auto_556129 ?auto_556130 ) ( ON ?auto_556128 ?auto_556129 ) ( ON ?auto_556127 ?auto_556128 ) ( CLEAR ?auto_556125 ) ( ON ?auto_556126 ?auto_556127 ) ( CLEAR ?auto_556126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_556125 ?auto_556126 )
      ( MAKE-13PILE ?auto_556125 ?auto_556126 ?auto_556127 ?auto_556128 ?auto_556129 ?auto_556130 ?auto_556131 ?auto_556132 ?auto_556133 ?auto_556134 ?auto_556135 ?auto_556136 ?auto_556137 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_556179 - BLOCK
      ?auto_556180 - BLOCK
      ?auto_556181 - BLOCK
      ?auto_556182 - BLOCK
      ?auto_556183 - BLOCK
      ?auto_556184 - BLOCK
      ?auto_556185 - BLOCK
      ?auto_556186 - BLOCK
      ?auto_556187 - BLOCK
      ?auto_556188 - BLOCK
      ?auto_556189 - BLOCK
      ?auto_556190 - BLOCK
      ?auto_556191 - BLOCK
    )
    :vars
    (
      ?auto_556192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556191 ?auto_556192 ) ( not ( = ?auto_556179 ?auto_556180 ) ) ( not ( = ?auto_556179 ?auto_556181 ) ) ( not ( = ?auto_556179 ?auto_556182 ) ) ( not ( = ?auto_556179 ?auto_556183 ) ) ( not ( = ?auto_556179 ?auto_556184 ) ) ( not ( = ?auto_556179 ?auto_556185 ) ) ( not ( = ?auto_556179 ?auto_556186 ) ) ( not ( = ?auto_556179 ?auto_556187 ) ) ( not ( = ?auto_556179 ?auto_556188 ) ) ( not ( = ?auto_556179 ?auto_556189 ) ) ( not ( = ?auto_556179 ?auto_556190 ) ) ( not ( = ?auto_556179 ?auto_556191 ) ) ( not ( = ?auto_556179 ?auto_556192 ) ) ( not ( = ?auto_556180 ?auto_556181 ) ) ( not ( = ?auto_556180 ?auto_556182 ) ) ( not ( = ?auto_556180 ?auto_556183 ) ) ( not ( = ?auto_556180 ?auto_556184 ) ) ( not ( = ?auto_556180 ?auto_556185 ) ) ( not ( = ?auto_556180 ?auto_556186 ) ) ( not ( = ?auto_556180 ?auto_556187 ) ) ( not ( = ?auto_556180 ?auto_556188 ) ) ( not ( = ?auto_556180 ?auto_556189 ) ) ( not ( = ?auto_556180 ?auto_556190 ) ) ( not ( = ?auto_556180 ?auto_556191 ) ) ( not ( = ?auto_556180 ?auto_556192 ) ) ( not ( = ?auto_556181 ?auto_556182 ) ) ( not ( = ?auto_556181 ?auto_556183 ) ) ( not ( = ?auto_556181 ?auto_556184 ) ) ( not ( = ?auto_556181 ?auto_556185 ) ) ( not ( = ?auto_556181 ?auto_556186 ) ) ( not ( = ?auto_556181 ?auto_556187 ) ) ( not ( = ?auto_556181 ?auto_556188 ) ) ( not ( = ?auto_556181 ?auto_556189 ) ) ( not ( = ?auto_556181 ?auto_556190 ) ) ( not ( = ?auto_556181 ?auto_556191 ) ) ( not ( = ?auto_556181 ?auto_556192 ) ) ( not ( = ?auto_556182 ?auto_556183 ) ) ( not ( = ?auto_556182 ?auto_556184 ) ) ( not ( = ?auto_556182 ?auto_556185 ) ) ( not ( = ?auto_556182 ?auto_556186 ) ) ( not ( = ?auto_556182 ?auto_556187 ) ) ( not ( = ?auto_556182 ?auto_556188 ) ) ( not ( = ?auto_556182 ?auto_556189 ) ) ( not ( = ?auto_556182 ?auto_556190 ) ) ( not ( = ?auto_556182 ?auto_556191 ) ) ( not ( = ?auto_556182 ?auto_556192 ) ) ( not ( = ?auto_556183 ?auto_556184 ) ) ( not ( = ?auto_556183 ?auto_556185 ) ) ( not ( = ?auto_556183 ?auto_556186 ) ) ( not ( = ?auto_556183 ?auto_556187 ) ) ( not ( = ?auto_556183 ?auto_556188 ) ) ( not ( = ?auto_556183 ?auto_556189 ) ) ( not ( = ?auto_556183 ?auto_556190 ) ) ( not ( = ?auto_556183 ?auto_556191 ) ) ( not ( = ?auto_556183 ?auto_556192 ) ) ( not ( = ?auto_556184 ?auto_556185 ) ) ( not ( = ?auto_556184 ?auto_556186 ) ) ( not ( = ?auto_556184 ?auto_556187 ) ) ( not ( = ?auto_556184 ?auto_556188 ) ) ( not ( = ?auto_556184 ?auto_556189 ) ) ( not ( = ?auto_556184 ?auto_556190 ) ) ( not ( = ?auto_556184 ?auto_556191 ) ) ( not ( = ?auto_556184 ?auto_556192 ) ) ( not ( = ?auto_556185 ?auto_556186 ) ) ( not ( = ?auto_556185 ?auto_556187 ) ) ( not ( = ?auto_556185 ?auto_556188 ) ) ( not ( = ?auto_556185 ?auto_556189 ) ) ( not ( = ?auto_556185 ?auto_556190 ) ) ( not ( = ?auto_556185 ?auto_556191 ) ) ( not ( = ?auto_556185 ?auto_556192 ) ) ( not ( = ?auto_556186 ?auto_556187 ) ) ( not ( = ?auto_556186 ?auto_556188 ) ) ( not ( = ?auto_556186 ?auto_556189 ) ) ( not ( = ?auto_556186 ?auto_556190 ) ) ( not ( = ?auto_556186 ?auto_556191 ) ) ( not ( = ?auto_556186 ?auto_556192 ) ) ( not ( = ?auto_556187 ?auto_556188 ) ) ( not ( = ?auto_556187 ?auto_556189 ) ) ( not ( = ?auto_556187 ?auto_556190 ) ) ( not ( = ?auto_556187 ?auto_556191 ) ) ( not ( = ?auto_556187 ?auto_556192 ) ) ( not ( = ?auto_556188 ?auto_556189 ) ) ( not ( = ?auto_556188 ?auto_556190 ) ) ( not ( = ?auto_556188 ?auto_556191 ) ) ( not ( = ?auto_556188 ?auto_556192 ) ) ( not ( = ?auto_556189 ?auto_556190 ) ) ( not ( = ?auto_556189 ?auto_556191 ) ) ( not ( = ?auto_556189 ?auto_556192 ) ) ( not ( = ?auto_556190 ?auto_556191 ) ) ( not ( = ?auto_556190 ?auto_556192 ) ) ( not ( = ?auto_556191 ?auto_556192 ) ) ( ON ?auto_556190 ?auto_556191 ) ( ON ?auto_556189 ?auto_556190 ) ( ON ?auto_556188 ?auto_556189 ) ( ON ?auto_556187 ?auto_556188 ) ( ON ?auto_556186 ?auto_556187 ) ( ON ?auto_556185 ?auto_556186 ) ( ON ?auto_556184 ?auto_556185 ) ( ON ?auto_556183 ?auto_556184 ) ( ON ?auto_556182 ?auto_556183 ) ( ON ?auto_556181 ?auto_556182 ) ( ON ?auto_556180 ?auto_556181 ) ( ON ?auto_556179 ?auto_556180 ) ( CLEAR ?auto_556179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_556179 )
      ( MAKE-13PILE ?auto_556179 ?auto_556180 ?auto_556181 ?auto_556182 ?auto_556183 ?auto_556184 ?auto_556185 ?auto_556186 ?auto_556187 ?auto_556188 ?auto_556189 ?auto_556190 ?auto_556191 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556234 - BLOCK
      ?auto_556235 - BLOCK
      ?auto_556236 - BLOCK
      ?auto_556237 - BLOCK
      ?auto_556238 - BLOCK
      ?auto_556239 - BLOCK
      ?auto_556240 - BLOCK
      ?auto_556241 - BLOCK
      ?auto_556242 - BLOCK
      ?auto_556243 - BLOCK
      ?auto_556244 - BLOCK
      ?auto_556245 - BLOCK
      ?auto_556246 - BLOCK
      ?auto_556247 - BLOCK
    )
    :vars
    (
      ?auto_556248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_556246 ) ( ON ?auto_556247 ?auto_556248 ) ( CLEAR ?auto_556247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_556234 ) ( ON ?auto_556235 ?auto_556234 ) ( ON ?auto_556236 ?auto_556235 ) ( ON ?auto_556237 ?auto_556236 ) ( ON ?auto_556238 ?auto_556237 ) ( ON ?auto_556239 ?auto_556238 ) ( ON ?auto_556240 ?auto_556239 ) ( ON ?auto_556241 ?auto_556240 ) ( ON ?auto_556242 ?auto_556241 ) ( ON ?auto_556243 ?auto_556242 ) ( ON ?auto_556244 ?auto_556243 ) ( ON ?auto_556245 ?auto_556244 ) ( ON ?auto_556246 ?auto_556245 ) ( not ( = ?auto_556234 ?auto_556235 ) ) ( not ( = ?auto_556234 ?auto_556236 ) ) ( not ( = ?auto_556234 ?auto_556237 ) ) ( not ( = ?auto_556234 ?auto_556238 ) ) ( not ( = ?auto_556234 ?auto_556239 ) ) ( not ( = ?auto_556234 ?auto_556240 ) ) ( not ( = ?auto_556234 ?auto_556241 ) ) ( not ( = ?auto_556234 ?auto_556242 ) ) ( not ( = ?auto_556234 ?auto_556243 ) ) ( not ( = ?auto_556234 ?auto_556244 ) ) ( not ( = ?auto_556234 ?auto_556245 ) ) ( not ( = ?auto_556234 ?auto_556246 ) ) ( not ( = ?auto_556234 ?auto_556247 ) ) ( not ( = ?auto_556234 ?auto_556248 ) ) ( not ( = ?auto_556235 ?auto_556236 ) ) ( not ( = ?auto_556235 ?auto_556237 ) ) ( not ( = ?auto_556235 ?auto_556238 ) ) ( not ( = ?auto_556235 ?auto_556239 ) ) ( not ( = ?auto_556235 ?auto_556240 ) ) ( not ( = ?auto_556235 ?auto_556241 ) ) ( not ( = ?auto_556235 ?auto_556242 ) ) ( not ( = ?auto_556235 ?auto_556243 ) ) ( not ( = ?auto_556235 ?auto_556244 ) ) ( not ( = ?auto_556235 ?auto_556245 ) ) ( not ( = ?auto_556235 ?auto_556246 ) ) ( not ( = ?auto_556235 ?auto_556247 ) ) ( not ( = ?auto_556235 ?auto_556248 ) ) ( not ( = ?auto_556236 ?auto_556237 ) ) ( not ( = ?auto_556236 ?auto_556238 ) ) ( not ( = ?auto_556236 ?auto_556239 ) ) ( not ( = ?auto_556236 ?auto_556240 ) ) ( not ( = ?auto_556236 ?auto_556241 ) ) ( not ( = ?auto_556236 ?auto_556242 ) ) ( not ( = ?auto_556236 ?auto_556243 ) ) ( not ( = ?auto_556236 ?auto_556244 ) ) ( not ( = ?auto_556236 ?auto_556245 ) ) ( not ( = ?auto_556236 ?auto_556246 ) ) ( not ( = ?auto_556236 ?auto_556247 ) ) ( not ( = ?auto_556236 ?auto_556248 ) ) ( not ( = ?auto_556237 ?auto_556238 ) ) ( not ( = ?auto_556237 ?auto_556239 ) ) ( not ( = ?auto_556237 ?auto_556240 ) ) ( not ( = ?auto_556237 ?auto_556241 ) ) ( not ( = ?auto_556237 ?auto_556242 ) ) ( not ( = ?auto_556237 ?auto_556243 ) ) ( not ( = ?auto_556237 ?auto_556244 ) ) ( not ( = ?auto_556237 ?auto_556245 ) ) ( not ( = ?auto_556237 ?auto_556246 ) ) ( not ( = ?auto_556237 ?auto_556247 ) ) ( not ( = ?auto_556237 ?auto_556248 ) ) ( not ( = ?auto_556238 ?auto_556239 ) ) ( not ( = ?auto_556238 ?auto_556240 ) ) ( not ( = ?auto_556238 ?auto_556241 ) ) ( not ( = ?auto_556238 ?auto_556242 ) ) ( not ( = ?auto_556238 ?auto_556243 ) ) ( not ( = ?auto_556238 ?auto_556244 ) ) ( not ( = ?auto_556238 ?auto_556245 ) ) ( not ( = ?auto_556238 ?auto_556246 ) ) ( not ( = ?auto_556238 ?auto_556247 ) ) ( not ( = ?auto_556238 ?auto_556248 ) ) ( not ( = ?auto_556239 ?auto_556240 ) ) ( not ( = ?auto_556239 ?auto_556241 ) ) ( not ( = ?auto_556239 ?auto_556242 ) ) ( not ( = ?auto_556239 ?auto_556243 ) ) ( not ( = ?auto_556239 ?auto_556244 ) ) ( not ( = ?auto_556239 ?auto_556245 ) ) ( not ( = ?auto_556239 ?auto_556246 ) ) ( not ( = ?auto_556239 ?auto_556247 ) ) ( not ( = ?auto_556239 ?auto_556248 ) ) ( not ( = ?auto_556240 ?auto_556241 ) ) ( not ( = ?auto_556240 ?auto_556242 ) ) ( not ( = ?auto_556240 ?auto_556243 ) ) ( not ( = ?auto_556240 ?auto_556244 ) ) ( not ( = ?auto_556240 ?auto_556245 ) ) ( not ( = ?auto_556240 ?auto_556246 ) ) ( not ( = ?auto_556240 ?auto_556247 ) ) ( not ( = ?auto_556240 ?auto_556248 ) ) ( not ( = ?auto_556241 ?auto_556242 ) ) ( not ( = ?auto_556241 ?auto_556243 ) ) ( not ( = ?auto_556241 ?auto_556244 ) ) ( not ( = ?auto_556241 ?auto_556245 ) ) ( not ( = ?auto_556241 ?auto_556246 ) ) ( not ( = ?auto_556241 ?auto_556247 ) ) ( not ( = ?auto_556241 ?auto_556248 ) ) ( not ( = ?auto_556242 ?auto_556243 ) ) ( not ( = ?auto_556242 ?auto_556244 ) ) ( not ( = ?auto_556242 ?auto_556245 ) ) ( not ( = ?auto_556242 ?auto_556246 ) ) ( not ( = ?auto_556242 ?auto_556247 ) ) ( not ( = ?auto_556242 ?auto_556248 ) ) ( not ( = ?auto_556243 ?auto_556244 ) ) ( not ( = ?auto_556243 ?auto_556245 ) ) ( not ( = ?auto_556243 ?auto_556246 ) ) ( not ( = ?auto_556243 ?auto_556247 ) ) ( not ( = ?auto_556243 ?auto_556248 ) ) ( not ( = ?auto_556244 ?auto_556245 ) ) ( not ( = ?auto_556244 ?auto_556246 ) ) ( not ( = ?auto_556244 ?auto_556247 ) ) ( not ( = ?auto_556244 ?auto_556248 ) ) ( not ( = ?auto_556245 ?auto_556246 ) ) ( not ( = ?auto_556245 ?auto_556247 ) ) ( not ( = ?auto_556245 ?auto_556248 ) ) ( not ( = ?auto_556246 ?auto_556247 ) ) ( not ( = ?auto_556246 ?auto_556248 ) ) ( not ( = ?auto_556247 ?auto_556248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_556247 ?auto_556248 )
      ( !STACK ?auto_556247 ?auto_556246 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556292 - BLOCK
      ?auto_556293 - BLOCK
      ?auto_556294 - BLOCK
      ?auto_556295 - BLOCK
      ?auto_556296 - BLOCK
      ?auto_556297 - BLOCK
      ?auto_556298 - BLOCK
      ?auto_556299 - BLOCK
      ?auto_556300 - BLOCK
      ?auto_556301 - BLOCK
      ?auto_556302 - BLOCK
      ?auto_556303 - BLOCK
      ?auto_556304 - BLOCK
      ?auto_556305 - BLOCK
    )
    :vars
    (
      ?auto_556306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556305 ?auto_556306 ) ( ON-TABLE ?auto_556292 ) ( ON ?auto_556293 ?auto_556292 ) ( ON ?auto_556294 ?auto_556293 ) ( ON ?auto_556295 ?auto_556294 ) ( ON ?auto_556296 ?auto_556295 ) ( ON ?auto_556297 ?auto_556296 ) ( ON ?auto_556298 ?auto_556297 ) ( ON ?auto_556299 ?auto_556298 ) ( ON ?auto_556300 ?auto_556299 ) ( ON ?auto_556301 ?auto_556300 ) ( ON ?auto_556302 ?auto_556301 ) ( ON ?auto_556303 ?auto_556302 ) ( not ( = ?auto_556292 ?auto_556293 ) ) ( not ( = ?auto_556292 ?auto_556294 ) ) ( not ( = ?auto_556292 ?auto_556295 ) ) ( not ( = ?auto_556292 ?auto_556296 ) ) ( not ( = ?auto_556292 ?auto_556297 ) ) ( not ( = ?auto_556292 ?auto_556298 ) ) ( not ( = ?auto_556292 ?auto_556299 ) ) ( not ( = ?auto_556292 ?auto_556300 ) ) ( not ( = ?auto_556292 ?auto_556301 ) ) ( not ( = ?auto_556292 ?auto_556302 ) ) ( not ( = ?auto_556292 ?auto_556303 ) ) ( not ( = ?auto_556292 ?auto_556304 ) ) ( not ( = ?auto_556292 ?auto_556305 ) ) ( not ( = ?auto_556292 ?auto_556306 ) ) ( not ( = ?auto_556293 ?auto_556294 ) ) ( not ( = ?auto_556293 ?auto_556295 ) ) ( not ( = ?auto_556293 ?auto_556296 ) ) ( not ( = ?auto_556293 ?auto_556297 ) ) ( not ( = ?auto_556293 ?auto_556298 ) ) ( not ( = ?auto_556293 ?auto_556299 ) ) ( not ( = ?auto_556293 ?auto_556300 ) ) ( not ( = ?auto_556293 ?auto_556301 ) ) ( not ( = ?auto_556293 ?auto_556302 ) ) ( not ( = ?auto_556293 ?auto_556303 ) ) ( not ( = ?auto_556293 ?auto_556304 ) ) ( not ( = ?auto_556293 ?auto_556305 ) ) ( not ( = ?auto_556293 ?auto_556306 ) ) ( not ( = ?auto_556294 ?auto_556295 ) ) ( not ( = ?auto_556294 ?auto_556296 ) ) ( not ( = ?auto_556294 ?auto_556297 ) ) ( not ( = ?auto_556294 ?auto_556298 ) ) ( not ( = ?auto_556294 ?auto_556299 ) ) ( not ( = ?auto_556294 ?auto_556300 ) ) ( not ( = ?auto_556294 ?auto_556301 ) ) ( not ( = ?auto_556294 ?auto_556302 ) ) ( not ( = ?auto_556294 ?auto_556303 ) ) ( not ( = ?auto_556294 ?auto_556304 ) ) ( not ( = ?auto_556294 ?auto_556305 ) ) ( not ( = ?auto_556294 ?auto_556306 ) ) ( not ( = ?auto_556295 ?auto_556296 ) ) ( not ( = ?auto_556295 ?auto_556297 ) ) ( not ( = ?auto_556295 ?auto_556298 ) ) ( not ( = ?auto_556295 ?auto_556299 ) ) ( not ( = ?auto_556295 ?auto_556300 ) ) ( not ( = ?auto_556295 ?auto_556301 ) ) ( not ( = ?auto_556295 ?auto_556302 ) ) ( not ( = ?auto_556295 ?auto_556303 ) ) ( not ( = ?auto_556295 ?auto_556304 ) ) ( not ( = ?auto_556295 ?auto_556305 ) ) ( not ( = ?auto_556295 ?auto_556306 ) ) ( not ( = ?auto_556296 ?auto_556297 ) ) ( not ( = ?auto_556296 ?auto_556298 ) ) ( not ( = ?auto_556296 ?auto_556299 ) ) ( not ( = ?auto_556296 ?auto_556300 ) ) ( not ( = ?auto_556296 ?auto_556301 ) ) ( not ( = ?auto_556296 ?auto_556302 ) ) ( not ( = ?auto_556296 ?auto_556303 ) ) ( not ( = ?auto_556296 ?auto_556304 ) ) ( not ( = ?auto_556296 ?auto_556305 ) ) ( not ( = ?auto_556296 ?auto_556306 ) ) ( not ( = ?auto_556297 ?auto_556298 ) ) ( not ( = ?auto_556297 ?auto_556299 ) ) ( not ( = ?auto_556297 ?auto_556300 ) ) ( not ( = ?auto_556297 ?auto_556301 ) ) ( not ( = ?auto_556297 ?auto_556302 ) ) ( not ( = ?auto_556297 ?auto_556303 ) ) ( not ( = ?auto_556297 ?auto_556304 ) ) ( not ( = ?auto_556297 ?auto_556305 ) ) ( not ( = ?auto_556297 ?auto_556306 ) ) ( not ( = ?auto_556298 ?auto_556299 ) ) ( not ( = ?auto_556298 ?auto_556300 ) ) ( not ( = ?auto_556298 ?auto_556301 ) ) ( not ( = ?auto_556298 ?auto_556302 ) ) ( not ( = ?auto_556298 ?auto_556303 ) ) ( not ( = ?auto_556298 ?auto_556304 ) ) ( not ( = ?auto_556298 ?auto_556305 ) ) ( not ( = ?auto_556298 ?auto_556306 ) ) ( not ( = ?auto_556299 ?auto_556300 ) ) ( not ( = ?auto_556299 ?auto_556301 ) ) ( not ( = ?auto_556299 ?auto_556302 ) ) ( not ( = ?auto_556299 ?auto_556303 ) ) ( not ( = ?auto_556299 ?auto_556304 ) ) ( not ( = ?auto_556299 ?auto_556305 ) ) ( not ( = ?auto_556299 ?auto_556306 ) ) ( not ( = ?auto_556300 ?auto_556301 ) ) ( not ( = ?auto_556300 ?auto_556302 ) ) ( not ( = ?auto_556300 ?auto_556303 ) ) ( not ( = ?auto_556300 ?auto_556304 ) ) ( not ( = ?auto_556300 ?auto_556305 ) ) ( not ( = ?auto_556300 ?auto_556306 ) ) ( not ( = ?auto_556301 ?auto_556302 ) ) ( not ( = ?auto_556301 ?auto_556303 ) ) ( not ( = ?auto_556301 ?auto_556304 ) ) ( not ( = ?auto_556301 ?auto_556305 ) ) ( not ( = ?auto_556301 ?auto_556306 ) ) ( not ( = ?auto_556302 ?auto_556303 ) ) ( not ( = ?auto_556302 ?auto_556304 ) ) ( not ( = ?auto_556302 ?auto_556305 ) ) ( not ( = ?auto_556302 ?auto_556306 ) ) ( not ( = ?auto_556303 ?auto_556304 ) ) ( not ( = ?auto_556303 ?auto_556305 ) ) ( not ( = ?auto_556303 ?auto_556306 ) ) ( not ( = ?auto_556304 ?auto_556305 ) ) ( not ( = ?auto_556304 ?auto_556306 ) ) ( not ( = ?auto_556305 ?auto_556306 ) ) ( CLEAR ?auto_556303 ) ( ON ?auto_556304 ?auto_556305 ) ( CLEAR ?auto_556304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_556292 ?auto_556293 ?auto_556294 ?auto_556295 ?auto_556296 ?auto_556297 ?auto_556298 ?auto_556299 ?auto_556300 ?auto_556301 ?auto_556302 ?auto_556303 ?auto_556304 )
      ( MAKE-14PILE ?auto_556292 ?auto_556293 ?auto_556294 ?auto_556295 ?auto_556296 ?auto_556297 ?auto_556298 ?auto_556299 ?auto_556300 ?auto_556301 ?auto_556302 ?auto_556303 ?auto_556304 ?auto_556305 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556350 - BLOCK
      ?auto_556351 - BLOCK
      ?auto_556352 - BLOCK
      ?auto_556353 - BLOCK
      ?auto_556354 - BLOCK
      ?auto_556355 - BLOCK
      ?auto_556356 - BLOCK
      ?auto_556357 - BLOCK
      ?auto_556358 - BLOCK
      ?auto_556359 - BLOCK
      ?auto_556360 - BLOCK
      ?auto_556361 - BLOCK
      ?auto_556362 - BLOCK
      ?auto_556363 - BLOCK
    )
    :vars
    (
      ?auto_556364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556363 ?auto_556364 ) ( ON-TABLE ?auto_556350 ) ( ON ?auto_556351 ?auto_556350 ) ( ON ?auto_556352 ?auto_556351 ) ( ON ?auto_556353 ?auto_556352 ) ( ON ?auto_556354 ?auto_556353 ) ( ON ?auto_556355 ?auto_556354 ) ( ON ?auto_556356 ?auto_556355 ) ( ON ?auto_556357 ?auto_556356 ) ( ON ?auto_556358 ?auto_556357 ) ( ON ?auto_556359 ?auto_556358 ) ( ON ?auto_556360 ?auto_556359 ) ( not ( = ?auto_556350 ?auto_556351 ) ) ( not ( = ?auto_556350 ?auto_556352 ) ) ( not ( = ?auto_556350 ?auto_556353 ) ) ( not ( = ?auto_556350 ?auto_556354 ) ) ( not ( = ?auto_556350 ?auto_556355 ) ) ( not ( = ?auto_556350 ?auto_556356 ) ) ( not ( = ?auto_556350 ?auto_556357 ) ) ( not ( = ?auto_556350 ?auto_556358 ) ) ( not ( = ?auto_556350 ?auto_556359 ) ) ( not ( = ?auto_556350 ?auto_556360 ) ) ( not ( = ?auto_556350 ?auto_556361 ) ) ( not ( = ?auto_556350 ?auto_556362 ) ) ( not ( = ?auto_556350 ?auto_556363 ) ) ( not ( = ?auto_556350 ?auto_556364 ) ) ( not ( = ?auto_556351 ?auto_556352 ) ) ( not ( = ?auto_556351 ?auto_556353 ) ) ( not ( = ?auto_556351 ?auto_556354 ) ) ( not ( = ?auto_556351 ?auto_556355 ) ) ( not ( = ?auto_556351 ?auto_556356 ) ) ( not ( = ?auto_556351 ?auto_556357 ) ) ( not ( = ?auto_556351 ?auto_556358 ) ) ( not ( = ?auto_556351 ?auto_556359 ) ) ( not ( = ?auto_556351 ?auto_556360 ) ) ( not ( = ?auto_556351 ?auto_556361 ) ) ( not ( = ?auto_556351 ?auto_556362 ) ) ( not ( = ?auto_556351 ?auto_556363 ) ) ( not ( = ?auto_556351 ?auto_556364 ) ) ( not ( = ?auto_556352 ?auto_556353 ) ) ( not ( = ?auto_556352 ?auto_556354 ) ) ( not ( = ?auto_556352 ?auto_556355 ) ) ( not ( = ?auto_556352 ?auto_556356 ) ) ( not ( = ?auto_556352 ?auto_556357 ) ) ( not ( = ?auto_556352 ?auto_556358 ) ) ( not ( = ?auto_556352 ?auto_556359 ) ) ( not ( = ?auto_556352 ?auto_556360 ) ) ( not ( = ?auto_556352 ?auto_556361 ) ) ( not ( = ?auto_556352 ?auto_556362 ) ) ( not ( = ?auto_556352 ?auto_556363 ) ) ( not ( = ?auto_556352 ?auto_556364 ) ) ( not ( = ?auto_556353 ?auto_556354 ) ) ( not ( = ?auto_556353 ?auto_556355 ) ) ( not ( = ?auto_556353 ?auto_556356 ) ) ( not ( = ?auto_556353 ?auto_556357 ) ) ( not ( = ?auto_556353 ?auto_556358 ) ) ( not ( = ?auto_556353 ?auto_556359 ) ) ( not ( = ?auto_556353 ?auto_556360 ) ) ( not ( = ?auto_556353 ?auto_556361 ) ) ( not ( = ?auto_556353 ?auto_556362 ) ) ( not ( = ?auto_556353 ?auto_556363 ) ) ( not ( = ?auto_556353 ?auto_556364 ) ) ( not ( = ?auto_556354 ?auto_556355 ) ) ( not ( = ?auto_556354 ?auto_556356 ) ) ( not ( = ?auto_556354 ?auto_556357 ) ) ( not ( = ?auto_556354 ?auto_556358 ) ) ( not ( = ?auto_556354 ?auto_556359 ) ) ( not ( = ?auto_556354 ?auto_556360 ) ) ( not ( = ?auto_556354 ?auto_556361 ) ) ( not ( = ?auto_556354 ?auto_556362 ) ) ( not ( = ?auto_556354 ?auto_556363 ) ) ( not ( = ?auto_556354 ?auto_556364 ) ) ( not ( = ?auto_556355 ?auto_556356 ) ) ( not ( = ?auto_556355 ?auto_556357 ) ) ( not ( = ?auto_556355 ?auto_556358 ) ) ( not ( = ?auto_556355 ?auto_556359 ) ) ( not ( = ?auto_556355 ?auto_556360 ) ) ( not ( = ?auto_556355 ?auto_556361 ) ) ( not ( = ?auto_556355 ?auto_556362 ) ) ( not ( = ?auto_556355 ?auto_556363 ) ) ( not ( = ?auto_556355 ?auto_556364 ) ) ( not ( = ?auto_556356 ?auto_556357 ) ) ( not ( = ?auto_556356 ?auto_556358 ) ) ( not ( = ?auto_556356 ?auto_556359 ) ) ( not ( = ?auto_556356 ?auto_556360 ) ) ( not ( = ?auto_556356 ?auto_556361 ) ) ( not ( = ?auto_556356 ?auto_556362 ) ) ( not ( = ?auto_556356 ?auto_556363 ) ) ( not ( = ?auto_556356 ?auto_556364 ) ) ( not ( = ?auto_556357 ?auto_556358 ) ) ( not ( = ?auto_556357 ?auto_556359 ) ) ( not ( = ?auto_556357 ?auto_556360 ) ) ( not ( = ?auto_556357 ?auto_556361 ) ) ( not ( = ?auto_556357 ?auto_556362 ) ) ( not ( = ?auto_556357 ?auto_556363 ) ) ( not ( = ?auto_556357 ?auto_556364 ) ) ( not ( = ?auto_556358 ?auto_556359 ) ) ( not ( = ?auto_556358 ?auto_556360 ) ) ( not ( = ?auto_556358 ?auto_556361 ) ) ( not ( = ?auto_556358 ?auto_556362 ) ) ( not ( = ?auto_556358 ?auto_556363 ) ) ( not ( = ?auto_556358 ?auto_556364 ) ) ( not ( = ?auto_556359 ?auto_556360 ) ) ( not ( = ?auto_556359 ?auto_556361 ) ) ( not ( = ?auto_556359 ?auto_556362 ) ) ( not ( = ?auto_556359 ?auto_556363 ) ) ( not ( = ?auto_556359 ?auto_556364 ) ) ( not ( = ?auto_556360 ?auto_556361 ) ) ( not ( = ?auto_556360 ?auto_556362 ) ) ( not ( = ?auto_556360 ?auto_556363 ) ) ( not ( = ?auto_556360 ?auto_556364 ) ) ( not ( = ?auto_556361 ?auto_556362 ) ) ( not ( = ?auto_556361 ?auto_556363 ) ) ( not ( = ?auto_556361 ?auto_556364 ) ) ( not ( = ?auto_556362 ?auto_556363 ) ) ( not ( = ?auto_556362 ?auto_556364 ) ) ( not ( = ?auto_556363 ?auto_556364 ) ) ( ON ?auto_556362 ?auto_556363 ) ( CLEAR ?auto_556360 ) ( ON ?auto_556361 ?auto_556362 ) ( CLEAR ?auto_556361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_556350 ?auto_556351 ?auto_556352 ?auto_556353 ?auto_556354 ?auto_556355 ?auto_556356 ?auto_556357 ?auto_556358 ?auto_556359 ?auto_556360 ?auto_556361 )
      ( MAKE-14PILE ?auto_556350 ?auto_556351 ?auto_556352 ?auto_556353 ?auto_556354 ?auto_556355 ?auto_556356 ?auto_556357 ?auto_556358 ?auto_556359 ?auto_556360 ?auto_556361 ?auto_556362 ?auto_556363 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556408 - BLOCK
      ?auto_556409 - BLOCK
      ?auto_556410 - BLOCK
      ?auto_556411 - BLOCK
      ?auto_556412 - BLOCK
      ?auto_556413 - BLOCK
      ?auto_556414 - BLOCK
      ?auto_556415 - BLOCK
      ?auto_556416 - BLOCK
      ?auto_556417 - BLOCK
      ?auto_556418 - BLOCK
      ?auto_556419 - BLOCK
      ?auto_556420 - BLOCK
      ?auto_556421 - BLOCK
    )
    :vars
    (
      ?auto_556422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556421 ?auto_556422 ) ( ON-TABLE ?auto_556408 ) ( ON ?auto_556409 ?auto_556408 ) ( ON ?auto_556410 ?auto_556409 ) ( ON ?auto_556411 ?auto_556410 ) ( ON ?auto_556412 ?auto_556411 ) ( ON ?auto_556413 ?auto_556412 ) ( ON ?auto_556414 ?auto_556413 ) ( ON ?auto_556415 ?auto_556414 ) ( ON ?auto_556416 ?auto_556415 ) ( ON ?auto_556417 ?auto_556416 ) ( not ( = ?auto_556408 ?auto_556409 ) ) ( not ( = ?auto_556408 ?auto_556410 ) ) ( not ( = ?auto_556408 ?auto_556411 ) ) ( not ( = ?auto_556408 ?auto_556412 ) ) ( not ( = ?auto_556408 ?auto_556413 ) ) ( not ( = ?auto_556408 ?auto_556414 ) ) ( not ( = ?auto_556408 ?auto_556415 ) ) ( not ( = ?auto_556408 ?auto_556416 ) ) ( not ( = ?auto_556408 ?auto_556417 ) ) ( not ( = ?auto_556408 ?auto_556418 ) ) ( not ( = ?auto_556408 ?auto_556419 ) ) ( not ( = ?auto_556408 ?auto_556420 ) ) ( not ( = ?auto_556408 ?auto_556421 ) ) ( not ( = ?auto_556408 ?auto_556422 ) ) ( not ( = ?auto_556409 ?auto_556410 ) ) ( not ( = ?auto_556409 ?auto_556411 ) ) ( not ( = ?auto_556409 ?auto_556412 ) ) ( not ( = ?auto_556409 ?auto_556413 ) ) ( not ( = ?auto_556409 ?auto_556414 ) ) ( not ( = ?auto_556409 ?auto_556415 ) ) ( not ( = ?auto_556409 ?auto_556416 ) ) ( not ( = ?auto_556409 ?auto_556417 ) ) ( not ( = ?auto_556409 ?auto_556418 ) ) ( not ( = ?auto_556409 ?auto_556419 ) ) ( not ( = ?auto_556409 ?auto_556420 ) ) ( not ( = ?auto_556409 ?auto_556421 ) ) ( not ( = ?auto_556409 ?auto_556422 ) ) ( not ( = ?auto_556410 ?auto_556411 ) ) ( not ( = ?auto_556410 ?auto_556412 ) ) ( not ( = ?auto_556410 ?auto_556413 ) ) ( not ( = ?auto_556410 ?auto_556414 ) ) ( not ( = ?auto_556410 ?auto_556415 ) ) ( not ( = ?auto_556410 ?auto_556416 ) ) ( not ( = ?auto_556410 ?auto_556417 ) ) ( not ( = ?auto_556410 ?auto_556418 ) ) ( not ( = ?auto_556410 ?auto_556419 ) ) ( not ( = ?auto_556410 ?auto_556420 ) ) ( not ( = ?auto_556410 ?auto_556421 ) ) ( not ( = ?auto_556410 ?auto_556422 ) ) ( not ( = ?auto_556411 ?auto_556412 ) ) ( not ( = ?auto_556411 ?auto_556413 ) ) ( not ( = ?auto_556411 ?auto_556414 ) ) ( not ( = ?auto_556411 ?auto_556415 ) ) ( not ( = ?auto_556411 ?auto_556416 ) ) ( not ( = ?auto_556411 ?auto_556417 ) ) ( not ( = ?auto_556411 ?auto_556418 ) ) ( not ( = ?auto_556411 ?auto_556419 ) ) ( not ( = ?auto_556411 ?auto_556420 ) ) ( not ( = ?auto_556411 ?auto_556421 ) ) ( not ( = ?auto_556411 ?auto_556422 ) ) ( not ( = ?auto_556412 ?auto_556413 ) ) ( not ( = ?auto_556412 ?auto_556414 ) ) ( not ( = ?auto_556412 ?auto_556415 ) ) ( not ( = ?auto_556412 ?auto_556416 ) ) ( not ( = ?auto_556412 ?auto_556417 ) ) ( not ( = ?auto_556412 ?auto_556418 ) ) ( not ( = ?auto_556412 ?auto_556419 ) ) ( not ( = ?auto_556412 ?auto_556420 ) ) ( not ( = ?auto_556412 ?auto_556421 ) ) ( not ( = ?auto_556412 ?auto_556422 ) ) ( not ( = ?auto_556413 ?auto_556414 ) ) ( not ( = ?auto_556413 ?auto_556415 ) ) ( not ( = ?auto_556413 ?auto_556416 ) ) ( not ( = ?auto_556413 ?auto_556417 ) ) ( not ( = ?auto_556413 ?auto_556418 ) ) ( not ( = ?auto_556413 ?auto_556419 ) ) ( not ( = ?auto_556413 ?auto_556420 ) ) ( not ( = ?auto_556413 ?auto_556421 ) ) ( not ( = ?auto_556413 ?auto_556422 ) ) ( not ( = ?auto_556414 ?auto_556415 ) ) ( not ( = ?auto_556414 ?auto_556416 ) ) ( not ( = ?auto_556414 ?auto_556417 ) ) ( not ( = ?auto_556414 ?auto_556418 ) ) ( not ( = ?auto_556414 ?auto_556419 ) ) ( not ( = ?auto_556414 ?auto_556420 ) ) ( not ( = ?auto_556414 ?auto_556421 ) ) ( not ( = ?auto_556414 ?auto_556422 ) ) ( not ( = ?auto_556415 ?auto_556416 ) ) ( not ( = ?auto_556415 ?auto_556417 ) ) ( not ( = ?auto_556415 ?auto_556418 ) ) ( not ( = ?auto_556415 ?auto_556419 ) ) ( not ( = ?auto_556415 ?auto_556420 ) ) ( not ( = ?auto_556415 ?auto_556421 ) ) ( not ( = ?auto_556415 ?auto_556422 ) ) ( not ( = ?auto_556416 ?auto_556417 ) ) ( not ( = ?auto_556416 ?auto_556418 ) ) ( not ( = ?auto_556416 ?auto_556419 ) ) ( not ( = ?auto_556416 ?auto_556420 ) ) ( not ( = ?auto_556416 ?auto_556421 ) ) ( not ( = ?auto_556416 ?auto_556422 ) ) ( not ( = ?auto_556417 ?auto_556418 ) ) ( not ( = ?auto_556417 ?auto_556419 ) ) ( not ( = ?auto_556417 ?auto_556420 ) ) ( not ( = ?auto_556417 ?auto_556421 ) ) ( not ( = ?auto_556417 ?auto_556422 ) ) ( not ( = ?auto_556418 ?auto_556419 ) ) ( not ( = ?auto_556418 ?auto_556420 ) ) ( not ( = ?auto_556418 ?auto_556421 ) ) ( not ( = ?auto_556418 ?auto_556422 ) ) ( not ( = ?auto_556419 ?auto_556420 ) ) ( not ( = ?auto_556419 ?auto_556421 ) ) ( not ( = ?auto_556419 ?auto_556422 ) ) ( not ( = ?auto_556420 ?auto_556421 ) ) ( not ( = ?auto_556420 ?auto_556422 ) ) ( not ( = ?auto_556421 ?auto_556422 ) ) ( ON ?auto_556420 ?auto_556421 ) ( ON ?auto_556419 ?auto_556420 ) ( CLEAR ?auto_556417 ) ( ON ?auto_556418 ?auto_556419 ) ( CLEAR ?auto_556418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_556408 ?auto_556409 ?auto_556410 ?auto_556411 ?auto_556412 ?auto_556413 ?auto_556414 ?auto_556415 ?auto_556416 ?auto_556417 ?auto_556418 )
      ( MAKE-14PILE ?auto_556408 ?auto_556409 ?auto_556410 ?auto_556411 ?auto_556412 ?auto_556413 ?auto_556414 ?auto_556415 ?auto_556416 ?auto_556417 ?auto_556418 ?auto_556419 ?auto_556420 ?auto_556421 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556466 - BLOCK
      ?auto_556467 - BLOCK
      ?auto_556468 - BLOCK
      ?auto_556469 - BLOCK
      ?auto_556470 - BLOCK
      ?auto_556471 - BLOCK
      ?auto_556472 - BLOCK
      ?auto_556473 - BLOCK
      ?auto_556474 - BLOCK
      ?auto_556475 - BLOCK
      ?auto_556476 - BLOCK
      ?auto_556477 - BLOCK
      ?auto_556478 - BLOCK
      ?auto_556479 - BLOCK
    )
    :vars
    (
      ?auto_556480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556479 ?auto_556480 ) ( ON-TABLE ?auto_556466 ) ( ON ?auto_556467 ?auto_556466 ) ( ON ?auto_556468 ?auto_556467 ) ( ON ?auto_556469 ?auto_556468 ) ( ON ?auto_556470 ?auto_556469 ) ( ON ?auto_556471 ?auto_556470 ) ( ON ?auto_556472 ?auto_556471 ) ( ON ?auto_556473 ?auto_556472 ) ( ON ?auto_556474 ?auto_556473 ) ( not ( = ?auto_556466 ?auto_556467 ) ) ( not ( = ?auto_556466 ?auto_556468 ) ) ( not ( = ?auto_556466 ?auto_556469 ) ) ( not ( = ?auto_556466 ?auto_556470 ) ) ( not ( = ?auto_556466 ?auto_556471 ) ) ( not ( = ?auto_556466 ?auto_556472 ) ) ( not ( = ?auto_556466 ?auto_556473 ) ) ( not ( = ?auto_556466 ?auto_556474 ) ) ( not ( = ?auto_556466 ?auto_556475 ) ) ( not ( = ?auto_556466 ?auto_556476 ) ) ( not ( = ?auto_556466 ?auto_556477 ) ) ( not ( = ?auto_556466 ?auto_556478 ) ) ( not ( = ?auto_556466 ?auto_556479 ) ) ( not ( = ?auto_556466 ?auto_556480 ) ) ( not ( = ?auto_556467 ?auto_556468 ) ) ( not ( = ?auto_556467 ?auto_556469 ) ) ( not ( = ?auto_556467 ?auto_556470 ) ) ( not ( = ?auto_556467 ?auto_556471 ) ) ( not ( = ?auto_556467 ?auto_556472 ) ) ( not ( = ?auto_556467 ?auto_556473 ) ) ( not ( = ?auto_556467 ?auto_556474 ) ) ( not ( = ?auto_556467 ?auto_556475 ) ) ( not ( = ?auto_556467 ?auto_556476 ) ) ( not ( = ?auto_556467 ?auto_556477 ) ) ( not ( = ?auto_556467 ?auto_556478 ) ) ( not ( = ?auto_556467 ?auto_556479 ) ) ( not ( = ?auto_556467 ?auto_556480 ) ) ( not ( = ?auto_556468 ?auto_556469 ) ) ( not ( = ?auto_556468 ?auto_556470 ) ) ( not ( = ?auto_556468 ?auto_556471 ) ) ( not ( = ?auto_556468 ?auto_556472 ) ) ( not ( = ?auto_556468 ?auto_556473 ) ) ( not ( = ?auto_556468 ?auto_556474 ) ) ( not ( = ?auto_556468 ?auto_556475 ) ) ( not ( = ?auto_556468 ?auto_556476 ) ) ( not ( = ?auto_556468 ?auto_556477 ) ) ( not ( = ?auto_556468 ?auto_556478 ) ) ( not ( = ?auto_556468 ?auto_556479 ) ) ( not ( = ?auto_556468 ?auto_556480 ) ) ( not ( = ?auto_556469 ?auto_556470 ) ) ( not ( = ?auto_556469 ?auto_556471 ) ) ( not ( = ?auto_556469 ?auto_556472 ) ) ( not ( = ?auto_556469 ?auto_556473 ) ) ( not ( = ?auto_556469 ?auto_556474 ) ) ( not ( = ?auto_556469 ?auto_556475 ) ) ( not ( = ?auto_556469 ?auto_556476 ) ) ( not ( = ?auto_556469 ?auto_556477 ) ) ( not ( = ?auto_556469 ?auto_556478 ) ) ( not ( = ?auto_556469 ?auto_556479 ) ) ( not ( = ?auto_556469 ?auto_556480 ) ) ( not ( = ?auto_556470 ?auto_556471 ) ) ( not ( = ?auto_556470 ?auto_556472 ) ) ( not ( = ?auto_556470 ?auto_556473 ) ) ( not ( = ?auto_556470 ?auto_556474 ) ) ( not ( = ?auto_556470 ?auto_556475 ) ) ( not ( = ?auto_556470 ?auto_556476 ) ) ( not ( = ?auto_556470 ?auto_556477 ) ) ( not ( = ?auto_556470 ?auto_556478 ) ) ( not ( = ?auto_556470 ?auto_556479 ) ) ( not ( = ?auto_556470 ?auto_556480 ) ) ( not ( = ?auto_556471 ?auto_556472 ) ) ( not ( = ?auto_556471 ?auto_556473 ) ) ( not ( = ?auto_556471 ?auto_556474 ) ) ( not ( = ?auto_556471 ?auto_556475 ) ) ( not ( = ?auto_556471 ?auto_556476 ) ) ( not ( = ?auto_556471 ?auto_556477 ) ) ( not ( = ?auto_556471 ?auto_556478 ) ) ( not ( = ?auto_556471 ?auto_556479 ) ) ( not ( = ?auto_556471 ?auto_556480 ) ) ( not ( = ?auto_556472 ?auto_556473 ) ) ( not ( = ?auto_556472 ?auto_556474 ) ) ( not ( = ?auto_556472 ?auto_556475 ) ) ( not ( = ?auto_556472 ?auto_556476 ) ) ( not ( = ?auto_556472 ?auto_556477 ) ) ( not ( = ?auto_556472 ?auto_556478 ) ) ( not ( = ?auto_556472 ?auto_556479 ) ) ( not ( = ?auto_556472 ?auto_556480 ) ) ( not ( = ?auto_556473 ?auto_556474 ) ) ( not ( = ?auto_556473 ?auto_556475 ) ) ( not ( = ?auto_556473 ?auto_556476 ) ) ( not ( = ?auto_556473 ?auto_556477 ) ) ( not ( = ?auto_556473 ?auto_556478 ) ) ( not ( = ?auto_556473 ?auto_556479 ) ) ( not ( = ?auto_556473 ?auto_556480 ) ) ( not ( = ?auto_556474 ?auto_556475 ) ) ( not ( = ?auto_556474 ?auto_556476 ) ) ( not ( = ?auto_556474 ?auto_556477 ) ) ( not ( = ?auto_556474 ?auto_556478 ) ) ( not ( = ?auto_556474 ?auto_556479 ) ) ( not ( = ?auto_556474 ?auto_556480 ) ) ( not ( = ?auto_556475 ?auto_556476 ) ) ( not ( = ?auto_556475 ?auto_556477 ) ) ( not ( = ?auto_556475 ?auto_556478 ) ) ( not ( = ?auto_556475 ?auto_556479 ) ) ( not ( = ?auto_556475 ?auto_556480 ) ) ( not ( = ?auto_556476 ?auto_556477 ) ) ( not ( = ?auto_556476 ?auto_556478 ) ) ( not ( = ?auto_556476 ?auto_556479 ) ) ( not ( = ?auto_556476 ?auto_556480 ) ) ( not ( = ?auto_556477 ?auto_556478 ) ) ( not ( = ?auto_556477 ?auto_556479 ) ) ( not ( = ?auto_556477 ?auto_556480 ) ) ( not ( = ?auto_556478 ?auto_556479 ) ) ( not ( = ?auto_556478 ?auto_556480 ) ) ( not ( = ?auto_556479 ?auto_556480 ) ) ( ON ?auto_556478 ?auto_556479 ) ( ON ?auto_556477 ?auto_556478 ) ( ON ?auto_556476 ?auto_556477 ) ( CLEAR ?auto_556474 ) ( ON ?auto_556475 ?auto_556476 ) ( CLEAR ?auto_556475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_556466 ?auto_556467 ?auto_556468 ?auto_556469 ?auto_556470 ?auto_556471 ?auto_556472 ?auto_556473 ?auto_556474 ?auto_556475 )
      ( MAKE-14PILE ?auto_556466 ?auto_556467 ?auto_556468 ?auto_556469 ?auto_556470 ?auto_556471 ?auto_556472 ?auto_556473 ?auto_556474 ?auto_556475 ?auto_556476 ?auto_556477 ?auto_556478 ?auto_556479 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556524 - BLOCK
      ?auto_556525 - BLOCK
      ?auto_556526 - BLOCK
      ?auto_556527 - BLOCK
      ?auto_556528 - BLOCK
      ?auto_556529 - BLOCK
      ?auto_556530 - BLOCK
      ?auto_556531 - BLOCK
      ?auto_556532 - BLOCK
      ?auto_556533 - BLOCK
      ?auto_556534 - BLOCK
      ?auto_556535 - BLOCK
      ?auto_556536 - BLOCK
      ?auto_556537 - BLOCK
    )
    :vars
    (
      ?auto_556538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556537 ?auto_556538 ) ( ON-TABLE ?auto_556524 ) ( ON ?auto_556525 ?auto_556524 ) ( ON ?auto_556526 ?auto_556525 ) ( ON ?auto_556527 ?auto_556526 ) ( ON ?auto_556528 ?auto_556527 ) ( ON ?auto_556529 ?auto_556528 ) ( ON ?auto_556530 ?auto_556529 ) ( ON ?auto_556531 ?auto_556530 ) ( not ( = ?auto_556524 ?auto_556525 ) ) ( not ( = ?auto_556524 ?auto_556526 ) ) ( not ( = ?auto_556524 ?auto_556527 ) ) ( not ( = ?auto_556524 ?auto_556528 ) ) ( not ( = ?auto_556524 ?auto_556529 ) ) ( not ( = ?auto_556524 ?auto_556530 ) ) ( not ( = ?auto_556524 ?auto_556531 ) ) ( not ( = ?auto_556524 ?auto_556532 ) ) ( not ( = ?auto_556524 ?auto_556533 ) ) ( not ( = ?auto_556524 ?auto_556534 ) ) ( not ( = ?auto_556524 ?auto_556535 ) ) ( not ( = ?auto_556524 ?auto_556536 ) ) ( not ( = ?auto_556524 ?auto_556537 ) ) ( not ( = ?auto_556524 ?auto_556538 ) ) ( not ( = ?auto_556525 ?auto_556526 ) ) ( not ( = ?auto_556525 ?auto_556527 ) ) ( not ( = ?auto_556525 ?auto_556528 ) ) ( not ( = ?auto_556525 ?auto_556529 ) ) ( not ( = ?auto_556525 ?auto_556530 ) ) ( not ( = ?auto_556525 ?auto_556531 ) ) ( not ( = ?auto_556525 ?auto_556532 ) ) ( not ( = ?auto_556525 ?auto_556533 ) ) ( not ( = ?auto_556525 ?auto_556534 ) ) ( not ( = ?auto_556525 ?auto_556535 ) ) ( not ( = ?auto_556525 ?auto_556536 ) ) ( not ( = ?auto_556525 ?auto_556537 ) ) ( not ( = ?auto_556525 ?auto_556538 ) ) ( not ( = ?auto_556526 ?auto_556527 ) ) ( not ( = ?auto_556526 ?auto_556528 ) ) ( not ( = ?auto_556526 ?auto_556529 ) ) ( not ( = ?auto_556526 ?auto_556530 ) ) ( not ( = ?auto_556526 ?auto_556531 ) ) ( not ( = ?auto_556526 ?auto_556532 ) ) ( not ( = ?auto_556526 ?auto_556533 ) ) ( not ( = ?auto_556526 ?auto_556534 ) ) ( not ( = ?auto_556526 ?auto_556535 ) ) ( not ( = ?auto_556526 ?auto_556536 ) ) ( not ( = ?auto_556526 ?auto_556537 ) ) ( not ( = ?auto_556526 ?auto_556538 ) ) ( not ( = ?auto_556527 ?auto_556528 ) ) ( not ( = ?auto_556527 ?auto_556529 ) ) ( not ( = ?auto_556527 ?auto_556530 ) ) ( not ( = ?auto_556527 ?auto_556531 ) ) ( not ( = ?auto_556527 ?auto_556532 ) ) ( not ( = ?auto_556527 ?auto_556533 ) ) ( not ( = ?auto_556527 ?auto_556534 ) ) ( not ( = ?auto_556527 ?auto_556535 ) ) ( not ( = ?auto_556527 ?auto_556536 ) ) ( not ( = ?auto_556527 ?auto_556537 ) ) ( not ( = ?auto_556527 ?auto_556538 ) ) ( not ( = ?auto_556528 ?auto_556529 ) ) ( not ( = ?auto_556528 ?auto_556530 ) ) ( not ( = ?auto_556528 ?auto_556531 ) ) ( not ( = ?auto_556528 ?auto_556532 ) ) ( not ( = ?auto_556528 ?auto_556533 ) ) ( not ( = ?auto_556528 ?auto_556534 ) ) ( not ( = ?auto_556528 ?auto_556535 ) ) ( not ( = ?auto_556528 ?auto_556536 ) ) ( not ( = ?auto_556528 ?auto_556537 ) ) ( not ( = ?auto_556528 ?auto_556538 ) ) ( not ( = ?auto_556529 ?auto_556530 ) ) ( not ( = ?auto_556529 ?auto_556531 ) ) ( not ( = ?auto_556529 ?auto_556532 ) ) ( not ( = ?auto_556529 ?auto_556533 ) ) ( not ( = ?auto_556529 ?auto_556534 ) ) ( not ( = ?auto_556529 ?auto_556535 ) ) ( not ( = ?auto_556529 ?auto_556536 ) ) ( not ( = ?auto_556529 ?auto_556537 ) ) ( not ( = ?auto_556529 ?auto_556538 ) ) ( not ( = ?auto_556530 ?auto_556531 ) ) ( not ( = ?auto_556530 ?auto_556532 ) ) ( not ( = ?auto_556530 ?auto_556533 ) ) ( not ( = ?auto_556530 ?auto_556534 ) ) ( not ( = ?auto_556530 ?auto_556535 ) ) ( not ( = ?auto_556530 ?auto_556536 ) ) ( not ( = ?auto_556530 ?auto_556537 ) ) ( not ( = ?auto_556530 ?auto_556538 ) ) ( not ( = ?auto_556531 ?auto_556532 ) ) ( not ( = ?auto_556531 ?auto_556533 ) ) ( not ( = ?auto_556531 ?auto_556534 ) ) ( not ( = ?auto_556531 ?auto_556535 ) ) ( not ( = ?auto_556531 ?auto_556536 ) ) ( not ( = ?auto_556531 ?auto_556537 ) ) ( not ( = ?auto_556531 ?auto_556538 ) ) ( not ( = ?auto_556532 ?auto_556533 ) ) ( not ( = ?auto_556532 ?auto_556534 ) ) ( not ( = ?auto_556532 ?auto_556535 ) ) ( not ( = ?auto_556532 ?auto_556536 ) ) ( not ( = ?auto_556532 ?auto_556537 ) ) ( not ( = ?auto_556532 ?auto_556538 ) ) ( not ( = ?auto_556533 ?auto_556534 ) ) ( not ( = ?auto_556533 ?auto_556535 ) ) ( not ( = ?auto_556533 ?auto_556536 ) ) ( not ( = ?auto_556533 ?auto_556537 ) ) ( not ( = ?auto_556533 ?auto_556538 ) ) ( not ( = ?auto_556534 ?auto_556535 ) ) ( not ( = ?auto_556534 ?auto_556536 ) ) ( not ( = ?auto_556534 ?auto_556537 ) ) ( not ( = ?auto_556534 ?auto_556538 ) ) ( not ( = ?auto_556535 ?auto_556536 ) ) ( not ( = ?auto_556535 ?auto_556537 ) ) ( not ( = ?auto_556535 ?auto_556538 ) ) ( not ( = ?auto_556536 ?auto_556537 ) ) ( not ( = ?auto_556536 ?auto_556538 ) ) ( not ( = ?auto_556537 ?auto_556538 ) ) ( ON ?auto_556536 ?auto_556537 ) ( ON ?auto_556535 ?auto_556536 ) ( ON ?auto_556534 ?auto_556535 ) ( ON ?auto_556533 ?auto_556534 ) ( CLEAR ?auto_556531 ) ( ON ?auto_556532 ?auto_556533 ) ( CLEAR ?auto_556532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_556524 ?auto_556525 ?auto_556526 ?auto_556527 ?auto_556528 ?auto_556529 ?auto_556530 ?auto_556531 ?auto_556532 )
      ( MAKE-14PILE ?auto_556524 ?auto_556525 ?auto_556526 ?auto_556527 ?auto_556528 ?auto_556529 ?auto_556530 ?auto_556531 ?auto_556532 ?auto_556533 ?auto_556534 ?auto_556535 ?auto_556536 ?auto_556537 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556582 - BLOCK
      ?auto_556583 - BLOCK
      ?auto_556584 - BLOCK
      ?auto_556585 - BLOCK
      ?auto_556586 - BLOCK
      ?auto_556587 - BLOCK
      ?auto_556588 - BLOCK
      ?auto_556589 - BLOCK
      ?auto_556590 - BLOCK
      ?auto_556591 - BLOCK
      ?auto_556592 - BLOCK
      ?auto_556593 - BLOCK
      ?auto_556594 - BLOCK
      ?auto_556595 - BLOCK
    )
    :vars
    (
      ?auto_556596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556595 ?auto_556596 ) ( ON-TABLE ?auto_556582 ) ( ON ?auto_556583 ?auto_556582 ) ( ON ?auto_556584 ?auto_556583 ) ( ON ?auto_556585 ?auto_556584 ) ( ON ?auto_556586 ?auto_556585 ) ( ON ?auto_556587 ?auto_556586 ) ( ON ?auto_556588 ?auto_556587 ) ( not ( = ?auto_556582 ?auto_556583 ) ) ( not ( = ?auto_556582 ?auto_556584 ) ) ( not ( = ?auto_556582 ?auto_556585 ) ) ( not ( = ?auto_556582 ?auto_556586 ) ) ( not ( = ?auto_556582 ?auto_556587 ) ) ( not ( = ?auto_556582 ?auto_556588 ) ) ( not ( = ?auto_556582 ?auto_556589 ) ) ( not ( = ?auto_556582 ?auto_556590 ) ) ( not ( = ?auto_556582 ?auto_556591 ) ) ( not ( = ?auto_556582 ?auto_556592 ) ) ( not ( = ?auto_556582 ?auto_556593 ) ) ( not ( = ?auto_556582 ?auto_556594 ) ) ( not ( = ?auto_556582 ?auto_556595 ) ) ( not ( = ?auto_556582 ?auto_556596 ) ) ( not ( = ?auto_556583 ?auto_556584 ) ) ( not ( = ?auto_556583 ?auto_556585 ) ) ( not ( = ?auto_556583 ?auto_556586 ) ) ( not ( = ?auto_556583 ?auto_556587 ) ) ( not ( = ?auto_556583 ?auto_556588 ) ) ( not ( = ?auto_556583 ?auto_556589 ) ) ( not ( = ?auto_556583 ?auto_556590 ) ) ( not ( = ?auto_556583 ?auto_556591 ) ) ( not ( = ?auto_556583 ?auto_556592 ) ) ( not ( = ?auto_556583 ?auto_556593 ) ) ( not ( = ?auto_556583 ?auto_556594 ) ) ( not ( = ?auto_556583 ?auto_556595 ) ) ( not ( = ?auto_556583 ?auto_556596 ) ) ( not ( = ?auto_556584 ?auto_556585 ) ) ( not ( = ?auto_556584 ?auto_556586 ) ) ( not ( = ?auto_556584 ?auto_556587 ) ) ( not ( = ?auto_556584 ?auto_556588 ) ) ( not ( = ?auto_556584 ?auto_556589 ) ) ( not ( = ?auto_556584 ?auto_556590 ) ) ( not ( = ?auto_556584 ?auto_556591 ) ) ( not ( = ?auto_556584 ?auto_556592 ) ) ( not ( = ?auto_556584 ?auto_556593 ) ) ( not ( = ?auto_556584 ?auto_556594 ) ) ( not ( = ?auto_556584 ?auto_556595 ) ) ( not ( = ?auto_556584 ?auto_556596 ) ) ( not ( = ?auto_556585 ?auto_556586 ) ) ( not ( = ?auto_556585 ?auto_556587 ) ) ( not ( = ?auto_556585 ?auto_556588 ) ) ( not ( = ?auto_556585 ?auto_556589 ) ) ( not ( = ?auto_556585 ?auto_556590 ) ) ( not ( = ?auto_556585 ?auto_556591 ) ) ( not ( = ?auto_556585 ?auto_556592 ) ) ( not ( = ?auto_556585 ?auto_556593 ) ) ( not ( = ?auto_556585 ?auto_556594 ) ) ( not ( = ?auto_556585 ?auto_556595 ) ) ( not ( = ?auto_556585 ?auto_556596 ) ) ( not ( = ?auto_556586 ?auto_556587 ) ) ( not ( = ?auto_556586 ?auto_556588 ) ) ( not ( = ?auto_556586 ?auto_556589 ) ) ( not ( = ?auto_556586 ?auto_556590 ) ) ( not ( = ?auto_556586 ?auto_556591 ) ) ( not ( = ?auto_556586 ?auto_556592 ) ) ( not ( = ?auto_556586 ?auto_556593 ) ) ( not ( = ?auto_556586 ?auto_556594 ) ) ( not ( = ?auto_556586 ?auto_556595 ) ) ( not ( = ?auto_556586 ?auto_556596 ) ) ( not ( = ?auto_556587 ?auto_556588 ) ) ( not ( = ?auto_556587 ?auto_556589 ) ) ( not ( = ?auto_556587 ?auto_556590 ) ) ( not ( = ?auto_556587 ?auto_556591 ) ) ( not ( = ?auto_556587 ?auto_556592 ) ) ( not ( = ?auto_556587 ?auto_556593 ) ) ( not ( = ?auto_556587 ?auto_556594 ) ) ( not ( = ?auto_556587 ?auto_556595 ) ) ( not ( = ?auto_556587 ?auto_556596 ) ) ( not ( = ?auto_556588 ?auto_556589 ) ) ( not ( = ?auto_556588 ?auto_556590 ) ) ( not ( = ?auto_556588 ?auto_556591 ) ) ( not ( = ?auto_556588 ?auto_556592 ) ) ( not ( = ?auto_556588 ?auto_556593 ) ) ( not ( = ?auto_556588 ?auto_556594 ) ) ( not ( = ?auto_556588 ?auto_556595 ) ) ( not ( = ?auto_556588 ?auto_556596 ) ) ( not ( = ?auto_556589 ?auto_556590 ) ) ( not ( = ?auto_556589 ?auto_556591 ) ) ( not ( = ?auto_556589 ?auto_556592 ) ) ( not ( = ?auto_556589 ?auto_556593 ) ) ( not ( = ?auto_556589 ?auto_556594 ) ) ( not ( = ?auto_556589 ?auto_556595 ) ) ( not ( = ?auto_556589 ?auto_556596 ) ) ( not ( = ?auto_556590 ?auto_556591 ) ) ( not ( = ?auto_556590 ?auto_556592 ) ) ( not ( = ?auto_556590 ?auto_556593 ) ) ( not ( = ?auto_556590 ?auto_556594 ) ) ( not ( = ?auto_556590 ?auto_556595 ) ) ( not ( = ?auto_556590 ?auto_556596 ) ) ( not ( = ?auto_556591 ?auto_556592 ) ) ( not ( = ?auto_556591 ?auto_556593 ) ) ( not ( = ?auto_556591 ?auto_556594 ) ) ( not ( = ?auto_556591 ?auto_556595 ) ) ( not ( = ?auto_556591 ?auto_556596 ) ) ( not ( = ?auto_556592 ?auto_556593 ) ) ( not ( = ?auto_556592 ?auto_556594 ) ) ( not ( = ?auto_556592 ?auto_556595 ) ) ( not ( = ?auto_556592 ?auto_556596 ) ) ( not ( = ?auto_556593 ?auto_556594 ) ) ( not ( = ?auto_556593 ?auto_556595 ) ) ( not ( = ?auto_556593 ?auto_556596 ) ) ( not ( = ?auto_556594 ?auto_556595 ) ) ( not ( = ?auto_556594 ?auto_556596 ) ) ( not ( = ?auto_556595 ?auto_556596 ) ) ( ON ?auto_556594 ?auto_556595 ) ( ON ?auto_556593 ?auto_556594 ) ( ON ?auto_556592 ?auto_556593 ) ( ON ?auto_556591 ?auto_556592 ) ( ON ?auto_556590 ?auto_556591 ) ( CLEAR ?auto_556588 ) ( ON ?auto_556589 ?auto_556590 ) ( CLEAR ?auto_556589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_556582 ?auto_556583 ?auto_556584 ?auto_556585 ?auto_556586 ?auto_556587 ?auto_556588 ?auto_556589 )
      ( MAKE-14PILE ?auto_556582 ?auto_556583 ?auto_556584 ?auto_556585 ?auto_556586 ?auto_556587 ?auto_556588 ?auto_556589 ?auto_556590 ?auto_556591 ?auto_556592 ?auto_556593 ?auto_556594 ?auto_556595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556640 - BLOCK
      ?auto_556641 - BLOCK
      ?auto_556642 - BLOCK
      ?auto_556643 - BLOCK
      ?auto_556644 - BLOCK
      ?auto_556645 - BLOCK
      ?auto_556646 - BLOCK
      ?auto_556647 - BLOCK
      ?auto_556648 - BLOCK
      ?auto_556649 - BLOCK
      ?auto_556650 - BLOCK
      ?auto_556651 - BLOCK
      ?auto_556652 - BLOCK
      ?auto_556653 - BLOCK
    )
    :vars
    (
      ?auto_556654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556653 ?auto_556654 ) ( ON-TABLE ?auto_556640 ) ( ON ?auto_556641 ?auto_556640 ) ( ON ?auto_556642 ?auto_556641 ) ( ON ?auto_556643 ?auto_556642 ) ( ON ?auto_556644 ?auto_556643 ) ( ON ?auto_556645 ?auto_556644 ) ( not ( = ?auto_556640 ?auto_556641 ) ) ( not ( = ?auto_556640 ?auto_556642 ) ) ( not ( = ?auto_556640 ?auto_556643 ) ) ( not ( = ?auto_556640 ?auto_556644 ) ) ( not ( = ?auto_556640 ?auto_556645 ) ) ( not ( = ?auto_556640 ?auto_556646 ) ) ( not ( = ?auto_556640 ?auto_556647 ) ) ( not ( = ?auto_556640 ?auto_556648 ) ) ( not ( = ?auto_556640 ?auto_556649 ) ) ( not ( = ?auto_556640 ?auto_556650 ) ) ( not ( = ?auto_556640 ?auto_556651 ) ) ( not ( = ?auto_556640 ?auto_556652 ) ) ( not ( = ?auto_556640 ?auto_556653 ) ) ( not ( = ?auto_556640 ?auto_556654 ) ) ( not ( = ?auto_556641 ?auto_556642 ) ) ( not ( = ?auto_556641 ?auto_556643 ) ) ( not ( = ?auto_556641 ?auto_556644 ) ) ( not ( = ?auto_556641 ?auto_556645 ) ) ( not ( = ?auto_556641 ?auto_556646 ) ) ( not ( = ?auto_556641 ?auto_556647 ) ) ( not ( = ?auto_556641 ?auto_556648 ) ) ( not ( = ?auto_556641 ?auto_556649 ) ) ( not ( = ?auto_556641 ?auto_556650 ) ) ( not ( = ?auto_556641 ?auto_556651 ) ) ( not ( = ?auto_556641 ?auto_556652 ) ) ( not ( = ?auto_556641 ?auto_556653 ) ) ( not ( = ?auto_556641 ?auto_556654 ) ) ( not ( = ?auto_556642 ?auto_556643 ) ) ( not ( = ?auto_556642 ?auto_556644 ) ) ( not ( = ?auto_556642 ?auto_556645 ) ) ( not ( = ?auto_556642 ?auto_556646 ) ) ( not ( = ?auto_556642 ?auto_556647 ) ) ( not ( = ?auto_556642 ?auto_556648 ) ) ( not ( = ?auto_556642 ?auto_556649 ) ) ( not ( = ?auto_556642 ?auto_556650 ) ) ( not ( = ?auto_556642 ?auto_556651 ) ) ( not ( = ?auto_556642 ?auto_556652 ) ) ( not ( = ?auto_556642 ?auto_556653 ) ) ( not ( = ?auto_556642 ?auto_556654 ) ) ( not ( = ?auto_556643 ?auto_556644 ) ) ( not ( = ?auto_556643 ?auto_556645 ) ) ( not ( = ?auto_556643 ?auto_556646 ) ) ( not ( = ?auto_556643 ?auto_556647 ) ) ( not ( = ?auto_556643 ?auto_556648 ) ) ( not ( = ?auto_556643 ?auto_556649 ) ) ( not ( = ?auto_556643 ?auto_556650 ) ) ( not ( = ?auto_556643 ?auto_556651 ) ) ( not ( = ?auto_556643 ?auto_556652 ) ) ( not ( = ?auto_556643 ?auto_556653 ) ) ( not ( = ?auto_556643 ?auto_556654 ) ) ( not ( = ?auto_556644 ?auto_556645 ) ) ( not ( = ?auto_556644 ?auto_556646 ) ) ( not ( = ?auto_556644 ?auto_556647 ) ) ( not ( = ?auto_556644 ?auto_556648 ) ) ( not ( = ?auto_556644 ?auto_556649 ) ) ( not ( = ?auto_556644 ?auto_556650 ) ) ( not ( = ?auto_556644 ?auto_556651 ) ) ( not ( = ?auto_556644 ?auto_556652 ) ) ( not ( = ?auto_556644 ?auto_556653 ) ) ( not ( = ?auto_556644 ?auto_556654 ) ) ( not ( = ?auto_556645 ?auto_556646 ) ) ( not ( = ?auto_556645 ?auto_556647 ) ) ( not ( = ?auto_556645 ?auto_556648 ) ) ( not ( = ?auto_556645 ?auto_556649 ) ) ( not ( = ?auto_556645 ?auto_556650 ) ) ( not ( = ?auto_556645 ?auto_556651 ) ) ( not ( = ?auto_556645 ?auto_556652 ) ) ( not ( = ?auto_556645 ?auto_556653 ) ) ( not ( = ?auto_556645 ?auto_556654 ) ) ( not ( = ?auto_556646 ?auto_556647 ) ) ( not ( = ?auto_556646 ?auto_556648 ) ) ( not ( = ?auto_556646 ?auto_556649 ) ) ( not ( = ?auto_556646 ?auto_556650 ) ) ( not ( = ?auto_556646 ?auto_556651 ) ) ( not ( = ?auto_556646 ?auto_556652 ) ) ( not ( = ?auto_556646 ?auto_556653 ) ) ( not ( = ?auto_556646 ?auto_556654 ) ) ( not ( = ?auto_556647 ?auto_556648 ) ) ( not ( = ?auto_556647 ?auto_556649 ) ) ( not ( = ?auto_556647 ?auto_556650 ) ) ( not ( = ?auto_556647 ?auto_556651 ) ) ( not ( = ?auto_556647 ?auto_556652 ) ) ( not ( = ?auto_556647 ?auto_556653 ) ) ( not ( = ?auto_556647 ?auto_556654 ) ) ( not ( = ?auto_556648 ?auto_556649 ) ) ( not ( = ?auto_556648 ?auto_556650 ) ) ( not ( = ?auto_556648 ?auto_556651 ) ) ( not ( = ?auto_556648 ?auto_556652 ) ) ( not ( = ?auto_556648 ?auto_556653 ) ) ( not ( = ?auto_556648 ?auto_556654 ) ) ( not ( = ?auto_556649 ?auto_556650 ) ) ( not ( = ?auto_556649 ?auto_556651 ) ) ( not ( = ?auto_556649 ?auto_556652 ) ) ( not ( = ?auto_556649 ?auto_556653 ) ) ( not ( = ?auto_556649 ?auto_556654 ) ) ( not ( = ?auto_556650 ?auto_556651 ) ) ( not ( = ?auto_556650 ?auto_556652 ) ) ( not ( = ?auto_556650 ?auto_556653 ) ) ( not ( = ?auto_556650 ?auto_556654 ) ) ( not ( = ?auto_556651 ?auto_556652 ) ) ( not ( = ?auto_556651 ?auto_556653 ) ) ( not ( = ?auto_556651 ?auto_556654 ) ) ( not ( = ?auto_556652 ?auto_556653 ) ) ( not ( = ?auto_556652 ?auto_556654 ) ) ( not ( = ?auto_556653 ?auto_556654 ) ) ( ON ?auto_556652 ?auto_556653 ) ( ON ?auto_556651 ?auto_556652 ) ( ON ?auto_556650 ?auto_556651 ) ( ON ?auto_556649 ?auto_556650 ) ( ON ?auto_556648 ?auto_556649 ) ( ON ?auto_556647 ?auto_556648 ) ( CLEAR ?auto_556645 ) ( ON ?auto_556646 ?auto_556647 ) ( CLEAR ?auto_556646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_556640 ?auto_556641 ?auto_556642 ?auto_556643 ?auto_556644 ?auto_556645 ?auto_556646 )
      ( MAKE-14PILE ?auto_556640 ?auto_556641 ?auto_556642 ?auto_556643 ?auto_556644 ?auto_556645 ?auto_556646 ?auto_556647 ?auto_556648 ?auto_556649 ?auto_556650 ?auto_556651 ?auto_556652 ?auto_556653 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556698 - BLOCK
      ?auto_556699 - BLOCK
      ?auto_556700 - BLOCK
      ?auto_556701 - BLOCK
      ?auto_556702 - BLOCK
      ?auto_556703 - BLOCK
      ?auto_556704 - BLOCK
      ?auto_556705 - BLOCK
      ?auto_556706 - BLOCK
      ?auto_556707 - BLOCK
      ?auto_556708 - BLOCK
      ?auto_556709 - BLOCK
      ?auto_556710 - BLOCK
      ?auto_556711 - BLOCK
    )
    :vars
    (
      ?auto_556712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556711 ?auto_556712 ) ( ON-TABLE ?auto_556698 ) ( ON ?auto_556699 ?auto_556698 ) ( ON ?auto_556700 ?auto_556699 ) ( ON ?auto_556701 ?auto_556700 ) ( ON ?auto_556702 ?auto_556701 ) ( not ( = ?auto_556698 ?auto_556699 ) ) ( not ( = ?auto_556698 ?auto_556700 ) ) ( not ( = ?auto_556698 ?auto_556701 ) ) ( not ( = ?auto_556698 ?auto_556702 ) ) ( not ( = ?auto_556698 ?auto_556703 ) ) ( not ( = ?auto_556698 ?auto_556704 ) ) ( not ( = ?auto_556698 ?auto_556705 ) ) ( not ( = ?auto_556698 ?auto_556706 ) ) ( not ( = ?auto_556698 ?auto_556707 ) ) ( not ( = ?auto_556698 ?auto_556708 ) ) ( not ( = ?auto_556698 ?auto_556709 ) ) ( not ( = ?auto_556698 ?auto_556710 ) ) ( not ( = ?auto_556698 ?auto_556711 ) ) ( not ( = ?auto_556698 ?auto_556712 ) ) ( not ( = ?auto_556699 ?auto_556700 ) ) ( not ( = ?auto_556699 ?auto_556701 ) ) ( not ( = ?auto_556699 ?auto_556702 ) ) ( not ( = ?auto_556699 ?auto_556703 ) ) ( not ( = ?auto_556699 ?auto_556704 ) ) ( not ( = ?auto_556699 ?auto_556705 ) ) ( not ( = ?auto_556699 ?auto_556706 ) ) ( not ( = ?auto_556699 ?auto_556707 ) ) ( not ( = ?auto_556699 ?auto_556708 ) ) ( not ( = ?auto_556699 ?auto_556709 ) ) ( not ( = ?auto_556699 ?auto_556710 ) ) ( not ( = ?auto_556699 ?auto_556711 ) ) ( not ( = ?auto_556699 ?auto_556712 ) ) ( not ( = ?auto_556700 ?auto_556701 ) ) ( not ( = ?auto_556700 ?auto_556702 ) ) ( not ( = ?auto_556700 ?auto_556703 ) ) ( not ( = ?auto_556700 ?auto_556704 ) ) ( not ( = ?auto_556700 ?auto_556705 ) ) ( not ( = ?auto_556700 ?auto_556706 ) ) ( not ( = ?auto_556700 ?auto_556707 ) ) ( not ( = ?auto_556700 ?auto_556708 ) ) ( not ( = ?auto_556700 ?auto_556709 ) ) ( not ( = ?auto_556700 ?auto_556710 ) ) ( not ( = ?auto_556700 ?auto_556711 ) ) ( not ( = ?auto_556700 ?auto_556712 ) ) ( not ( = ?auto_556701 ?auto_556702 ) ) ( not ( = ?auto_556701 ?auto_556703 ) ) ( not ( = ?auto_556701 ?auto_556704 ) ) ( not ( = ?auto_556701 ?auto_556705 ) ) ( not ( = ?auto_556701 ?auto_556706 ) ) ( not ( = ?auto_556701 ?auto_556707 ) ) ( not ( = ?auto_556701 ?auto_556708 ) ) ( not ( = ?auto_556701 ?auto_556709 ) ) ( not ( = ?auto_556701 ?auto_556710 ) ) ( not ( = ?auto_556701 ?auto_556711 ) ) ( not ( = ?auto_556701 ?auto_556712 ) ) ( not ( = ?auto_556702 ?auto_556703 ) ) ( not ( = ?auto_556702 ?auto_556704 ) ) ( not ( = ?auto_556702 ?auto_556705 ) ) ( not ( = ?auto_556702 ?auto_556706 ) ) ( not ( = ?auto_556702 ?auto_556707 ) ) ( not ( = ?auto_556702 ?auto_556708 ) ) ( not ( = ?auto_556702 ?auto_556709 ) ) ( not ( = ?auto_556702 ?auto_556710 ) ) ( not ( = ?auto_556702 ?auto_556711 ) ) ( not ( = ?auto_556702 ?auto_556712 ) ) ( not ( = ?auto_556703 ?auto_556704 ) ) ( not ( = ?auto_556703 ?auto_556705 ) ) ( not ( = ?auto_556703 ?auto_556706 ) ) ( not ( = ?auto_556703 ?auto_556707 ) ) ( not ( = ?auto_556703 ?auto_556708 ) ) ( not ( = ?auto_556703 ?auto_556709 ) ) ( not ( = ?auto_556703 ?auto_556710 ) ) ( not ( = ?auto_556703 ?auto_556711 ) ) ( not ( = ?auto_556703 ?auto_556712 ) ) ( not ( = ?auto_556704 ?auto_556705 ) ) ( not ( = ?auto_556704 ?auto_556706 ) ) ( not ( = ?auto_556704 ?auto_556707 ) ) ( not ( = ?auto_556704 ?auto_556708 ) ) ( not ( = ?auto_556704 ?auto_556709 ) ) ( not ( = ?auto_556704 ?auto_556710 ) ) ( not ( = ?auto_556704 ?auto_556711 ) ) ( not ( = ?auto_556704 ?auto_556712 ) ) ( not ( = ?auto_556705 ?auto_556706 ) ) ( not ( = ?auto_556705 ?auto_556707 ) ) ( not ( = ?auto_556705 ?auto_556708 ) ) ( not ( = ?auto_556705 ?auto_556709 ) ) ( not ( = ?auto_556705 ?auto_556710 ) ) ( not ( = ?auto_556705 ?auto_556711 ) ) ( not ( = ?auto_556705 ?auto_556712 ) ) ( not ( = ?auto_556706 ?auto_556707 ) ) ( not ( = ?auto_556706 ?auto_556708 ) ) ( not ( = ?auto_556706 ?auto_556709 ) ) ( not ( = ?auto_556706 ?auto_556710 ) ) ( not ( = ?auto_556706 ?auto_556711 ) ) ( not ( = ?auto_556706 ?auto_556712 ) ) ( not ( = ?auto_556707 ?auto_556708 ) ) ( not ( = ?auto_556707 ?auto_556709 ) ) ( not ( = ?auto_556707 ?auto_556710 ) ) ( not ( = ?auto_556707 ?auto_556711 ) ) ( not ( = ?auto_556707 ?auto_556712 ) ) ( not ( = ?auto_556708 ?auto_556709 ) ) ( not ( = ?auto_556708 ?auto_556710 ) ) ( not ( = ?auto_556708 ?auto_556711 ) ) ( not ( = ?auto_556708 ?auto_556712 ) ) ( not ( = ?auto_556709 ?auto_556710 ) ) ( not ( = ?auto_556709 ?auto_556711 ) ) ( not ( = ?auto_556709 ?auto_556712 ) ) ( not ( = ?auto_556710 ?auto_556711 ) ) ( not ( = ?auto_556710 ?auto_556712 ) ) ( not ( = ?auto_556711 ?auto_556712 ) ) ( ON ?auto_556710 ?auto_556711 ) ( ON ?auto_556709 ?auto_556710 ) ( ON ?auto_556708 ?auto_556709 ) ( ON ?auto_556707 ?auto_556708 ) ( ON ?auto_556706 ?auto_556707 ) ( ON ?auto_556705 ?auto_556706 ) ( ON ?auto_556704 ?auto_556705 ) ( CLEAR ?auto_556702 ) ( ON ?auto_556703 ?auto_556704 ) ( CLEAR ?auto_556703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_556698 ?auto_556699 ?auto_556700 ?auto_556701 ?auto_556702 ?auto_556703 )
      ( MAKE-14PILE ?auto_556698 ?auto_556699 ?auto_556700 ?auto_556701 ?auto_556702 ?auto_556703 ?auto_556704 ?auto_556705 ?auto_556706 ?auto_556707 ?auto_556708 ?auto_556709 ?auto_556710 ?auto_556711 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556756 - BLOCK
      ?auto_556757 - BLOCK
      ?auto_556758 - BLOCK
      ?auto_556759 - BLOCK
      ?auto_556760 - BLOCK
      ?auto_556761 - BLOCK
      ?auto_556762 - BLOCK
      ?auto_556763 - BLOCK
      ?auto_556764 - BLOCK
      ?auto_556765 - BLOCK
      ?auto_556766 - BLOCK
      ?auto_556767 - BLOCK
      ?auto_556768 - BLOCK
      ?auto_556769 - BLOCK
    )
    :vars
    (
      ?auto_556770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556769 ?auto_556770 ) ( ON-TABLE ?auto_556756 ) ( ON ?auto_556757 ?auto_556756 ) ( ON ?auto_556758 ?auto_556757 ) ( ON ?auto_556759 ?auto_556758 ) ( not ( = ?auto_556756 ?auto_556757 ) ) ( not ( = ?auto_556756 ?auto_556758 ) ) ( not ( = ?auto_556756 ?auto_556759 ) ) ( not ( = ?auto_556756 ?auto_556760 ) ) ( not ( = ?auto_556756 ?auto_556761 ) ) ( not ( = ?auto_556756 ?auto_556762 ) ) ( not ( = ?auto_556756 ?auto_556763 ) ) ( not ( = ?auto_556756 ?auto_556764 ) ) ( not ( = ?auto_556756 ?auto_556765 ) ) ( not ( = ?auto_556756 ?auto_556766 ) ) ( not ( = ?auto_556756 ?auto_556767 ) ) ( not ( = ?auto_556756 ?auto_556768 ) ) ( not ( = ?auto_556756 ?auto_556769 ) ) ( not ( = ?auto_556756 ?auto_556770 ) ) ( not ( = ?auto_556757 ?auto_556758 ) ) ( not ( = ?auto_556757 ?auto_556759 ) ) ( not ( = ?auto_556757 ?auto_556760 ) ) ( not ( = ?auto_556757 ?auto_556761 ) ) ( not ( = ?auto_556757 ?auto_556762 ) ) ( not ( = ?auto_556757 ?auto_556763 ) ) ( not ( = ?auto_556757 ?auto_556764 ) ) ( not ( = ?auto_556757 ?auto_556765 ) ) ( not ( = ?auto_556757 ?auto_556766 ) ) ( not ( = ?auto_556757 ?auto_556767 ) ) ( not ( = ?auto_556757 ?auto_556768 ) ) ( not ( = ?auto_556757 ?auto_556769 ) ) ( not ( = ?auto_556757 ?auto_556770 ) ) ( not ( = ?auto_556758 ?auto_556759 ) ) ( not ( = ?auto_556758 ?auto_556760 ) ) ( not ( = ?auto_556758 ?auto_556761 ) ) ( not ( = ?auto_556758 ?auto_556762 ) ) ( not ( = ?auto_556758 ?auto_556763 ) ) ( not ( = ?auto_556758 ?auto_556764 ) ) ( not ( = ?auto_556758 ?auto_556765 ) ) ( not ( = ?auto_556758 ?auto_556766 ) ) ( not ( = ?auto_556758 ?auto_556767 ) ) ( not ( = ?auto_556758 ?auto_556768 ) ) ( not ( = ?auto_556758 ?auto_556769 ) ) ( not ( = ?auto_556758 ?auto_556770 ) ) ( not ( = ?auto_556759 ?auto_556760 ) ) ( not ( = ?auto_556759 ?auto_556761 ) ) ( not ( = ?auto_556759 ?auto_556762 ) ) ( not ( = ?auto_556759 ?auto_556763 ) ) ( not ( = ?auto_556759 ?auto_556764 ) ) ( not ( = ?auto_556759 ?auto_556765 ) ) ( not ( = ?auto_556759 ?auto_556766 ) ) ( not ( = ?auto_556759 ?auto_556767 ) ) ( not ( = ?auto_556759 ?auto_556768 ) ) ( not ( = ?auto_556759 ?auto_556769 ) ) ( not ( = ?auto_556759 ?auto_556770 ) ) ( not ( = ?auto_556760 ?auto_556761 ) ) ( not ( = ?auto_556760 ?auto_556762 ) ) ( not ( = ?auto_556760 ?auto_556763 ) ) ( not ( = ?auto_556760 ?auto_556764 ) ) ( not ( = ?auto_556760 ?auto_556765 ) ) ( not ( = ?auto_556760 ?auto_556766 ) ) ( not ( = ?auto_556760 ?auto_556767 ) ) ( not ( = ?auto_556760 ?auto_556768 ) ) ( not ( = ?auto_556760 ?auto_556769 ) ) ( not ( = ?auto_556760 ?auto_556770 ) ) ( not ( = ?auto_556761 ?auto_556762 ) ) ( not ( = ?auto_556761 ?auto_556763 ) ) ( not ( = ?auto_556761 ?auto_556764 ) ) ( not ( = ?auto_556761 ?auto_556765 ) ) ( not ( = ?auto_556761 ?auto_556766 ) ) ( not ( = ?auto_556761 ?auto_556767 ) ) ( not ( = ?auto_556761 ?auto_556768 ) ) ( not ( = ?auto_556761 ?auto_556769 ) ) ( not ( = ?auto_556761 ?auto_556770 ) ) ( not ( = ?auto_556762 ?auto_556763 ) ) ( not ( = ?auto_556762 ?auto_556764 ) ) ( not ( = ?auto_556762 ?auto_556765 ) ) ( not ( = ?auto_556762 ?auto_556766 ) ) ( not ( = ?auto_556762 ?auto_556767 ) ) ( not ( = ?auto_556762 ?auto_556768 ) ) ( not ( = ?auto_556762 ?auto_556769 ) ) ( not ( = ?auto_556762 ?auto_556770 ) ) ( not ( = ?auto_556763 ?auto_556764 ) ) ( not ( = ?auto_556763 ?auto_556765 ) ) ( not ( = ?auto_556763 ?auto_556766 ) ) ( not ( = ?auto_556763 ?auto_556767 ) ) ( not ( = ?auto_556763 ?auto_556768 ) ) ( not ( = ?auto_556763 ?auto_556769 ) ) ( not ( = ?auto_556763 ?auto_556770 ) ) ( not ( = ?auto_556764 ?auto_556765 ) ) ( not ( = ?auto_556764 ?auto_556766 ) ) ( not ( = ?auto_556764 ?auto_556767 ) ) ( not ( = ?auto_556764 ?auto_556768 ) ) ( not ( = ?auto_556764 ?auto_556769 ) ) ( not ( = ?auto_556764 ?auto_556770 ) ) ( not ( = ?auto_556765 ?auto_556766 ) ) ( not ( = ?auto_556765 ?auto_556767 ) ) ( not ( = ?auto_556765 ?auto_556768 ) ) ( not ( = ?auto_556765 ?auto_556769 ) ) ( not ( = ?auto_556765 ?auto_556770 ) ) ( not ( = ?auto_556766 ?auto_556767 ) ) ( not ( = ?auto_556766 ?auto_556768 ) ) ( not ( = ?auto_556766 ?auto_556769 ) ) ( not ( = ?auto_556766 ?auto_556770 ) ) ( not ( = ?auto_556767 ?auto_556768 ) ) ( not ( = ?auto_556767 ?auto_556769 ) ) ( not ( = ?auto_556767 ?auto_556770 ) ) ( not ( = ?auto_556768 ?auto_556769 ) ) ( not ( = ?auto_556768 ?auto_556770 ) ) ( not ( = ?auto_556769 ?auto_556770 ) ) ( ON ?auto_556768 ?auto_556769 ) ( ON ?auto_556767 ?auto_556768 ) ( ON ?auto_556766 ?auto_556767 ) ( ON ?auto_556765 ?auto_556766 ) ( ON ?auto_556764 ?auto_556765 ) ( ON ?auto_556763 ?auto_556764 ) ( ON ?auto_556762 ?auto_556763 ) ( ON ?auto_556761 ?auto_556762 ) ( CLEAR ?auto_556759 ) ( ON ?auto_556760 ?auto_556761 ) ( CLEAR ?auto_556760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_556756 ?auto_556757 ?auto_556758 ?auto_556759 ?auto_556760 )
      ( MAKE-14PILE ?auto_556756 ?auto_556757 ?auto_556758 ?auto_556759 ?auto_556760 ?auto_556761 ?auto_556762 ?auto_556763 ?auto_556764 ?auto_556765 ?auto_556766 ?auto_556767 ?auto_556768 ?auto_556769 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556814 - BLOCK
      ?auto_556815 - BLOCK
      ?auto_556816 - BLOCK
      ?auto_556817 - BLOCK
      ?auto_556818 - BLOCK
      ?auto_556819 - BLOCK
      ?auto_556820 - BLOCK
      ?auto_556821 - BLOCK
      ?auto_556822 - BLOCK
      ?auto_556823 - BLOCK
      ?auto_556824 - BLOCK
      ?auto_556825 - BLOCK
      ?auto_556826 - BLOCK
      ?auto_556827 - BLOCK
    )
    :vars
    (
      ?auto_556828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556827 ?auto_556828 ) ( ON-TABLE ?auto_556814 ) ( ON ?auto_556815 ?auto_556814 ) ( ON ?auto_556816 ?auto_556815 ) ( not ( = ?auto_556814 ?auto_556815 ) ) ( not ( = ?auto_556814 ?auto_556816 ) ) ( not ( = ?auto_556814 ?auto_556817 ) ) ( not ( = ?auto_556814 ?auto_556818 ) ) ( not ( = ?auto_556814 ?auto_556819 ) ) ( not ( = ?auto_556814 ?auto_556820 ) ) ( not ( = ?auto_556814 ?auto_556821 ) ) ( not ( = ?auto_556814 ?auto_556822 ) ) ( not ( = ?auto_556814 ?auto_556823 ) ) ( not ( = ?auto_556814 ?auto_556824 ) ) ( not ( = ?auto_556814 ?auto_556825 ) ) ( not ( = ?auto_556814 ?auto_556826 ) ) ( not ( = ?auto_556814 ?auto_556827 ) ) ( not ( = ?auto_556814 ?auto_556828 ) ) ( not ( = ?auto_556815 ?auto_556816 ) ) ( not ( = ?auto_556815 ?auto_556817 ) ) ( not ( = ?auto_556815 ?auto_556818 ) ) ( not ( = ?auto_556815 ?auto_556819 ) ) ( not ( = ?auto_556815 ?auto_556820 ) ) ( not ( = ?auto_556815 ?auto_556821 ) ) ( not ( = ?auto_556815 ?auto_556822 ) ) ( not ( = ?auto_556815 ?auto_556823 ) ) ( not ( = ?auto_556815 ?auto_556824 ) ) ( not ( = ?auto_556815 ?auto_556825 ) ) ( not ( = ?auto_556815 ?auto_556826 ) ) ( not ( = ?auto_556815 ?auto_556827 ) ) ( not ( = ?auto_556815 ?auto_556828 ) ) ( not ( = ?auto_556816 ?auto_556817 ) ) ( not ( = ?auto_556816 ?auto_556818 ) ) ( not ( = ?auto_556816 ?auto_556819 ) ) ( not ( = ?auto_556816 ?auto_556820 ) ) ( not ( = ?auto_556816 ?auto_556821 ) ) ( not ( = ?auto_556816 ?auto_556822 ) ) ( not ( = ?auto_556816 ?auto_556823 ) ) ( not ( = ?auto_556816 ?auto_556824 ) ) ( not ( = ?auto_556816 ?auto_556825 ) ) ( not ( = ?auto_556816 ?auto_556826 ) ) ( not ( = ?auto_556816 ?auto_556827 ) ) ( not ( = ?auto_556816 ?auto_556828 ) ) ( not ( = ?auto_556817 ?auto_556818 ) ) ( not ( = ?auto_556817 ?auto_556819 ) ) ( not ( = ?auto_556817 ?auto_556820 ) ) ( not ( = ?auto_556817 ?auto_556821 ) ) ( not ( = ?auto_556817 ?auto_556822 ) ) ( not ( = ?auto_556817 ?auto_556823 ) ) ( not ( = ?auto_556817 ?auto_556824 ) ) ( not ( = ?auto_556817 ?auto_556825 ) ) ( not ( = ?auto_556817 ?auto_556826 ) ) ( not ( = ?auto_556817 ?auto_556827 ) ) ( not ( = ?auto_556817 ?auto_556828 ) ) ( not ( = ?auto_556818 ?auto_556819 ) ) ( not ( = ?auto_556818 ?auto_556820 ) ) ( not ( = ?auto_556818 ?auto_556821 ) ) ( not ( = ?auto_556818 ?auto_556822 ) ) ( not ( = ?auto_556818 ?auto_556823 ) ) ( not ( = ?auto_556818 ?auto_556824 ) ) ( not ( = ?auto_556818 ?auto_556825 ) ) ( not ( = ?auto_556818 ?auto_556826 ) ) ( not ( = ?auto_556818 ?auto_556827 ) ) ( not ( = ?auto_556818 ?auto_556828 ) ) ( not ( = ?auto_556819 ?auto_556820 ) ) ( not ( = ?auto_556819 ?auto_556821 ) ) ( not ( = ?auto_556819 ?auto_556822 ) ) ( not ( = ?auto_556819 ?auto_556823 ) ) ( not ( = ?auto_556819 ?auto_556824 ) ) ( not ( = ?auto_556819 ?auto_556825 ) ) ( not ( = ?auto_556819 ?auto_556826 ) ) ( not ( = ?auto_556819 ?auto_556827 ) ) ( not ( = ?auto_556819 ?auto_556828 ) ) ( not ( = ?auto_556820 ?auto_556821 ) ) ( not ( = ?auto_556820 ?auto_556822 ) ) ( not ( = ?auto_556820 ?auto_556823 ) ) ( not ( = ?auto_556820 ?auto_556824 ) ) ( not ( = ?auto_556820 ?auto_556825 ) ) ( not ( = ?auto_556820 ?auto_556826 ) ) ( not ( = ?auto_556820 ?auto_556827 ) ) ( not ( = ?auto_556820 ?auto_556828 ) ) ( not ( = ?auto_556821 ?auto_556822 ) ) ( not ( = ?auto_556821 ?auto_556823 ) ) ( not ( = ?auto_556821 ?auto_556824 ) ) ( not ( = ?auto_556821 ?auto_556825 ) ) ( not ( = ?auto_556821 ?auto_556826 ) ) ( not ( = ?auto_556821 ?auto_556827 ) ) ( not ( = ?auto_556821 ?auto_556828 ) ) ( not ( = ?auto_556822 ?auto_556823 ) ) ( not ( = ?auto_556822 ?auto_556824 ) ) ( not ( = ?auto_556822 ?auto_556825 ) ) ( not ( = ?auto_556822 ?auto_556826 ) ) ( not ( = ?auto_556822 ?auto_556827 ) ) ( not ( = ?auto_556822 ?auto_556828 ) ) ( not ( = ?auto_556823 ?auto_556824 ) ) ( not ( = ?auto_556823 ?auto_556825 ) ) ( not ( = ?auto_556823 ?auto_556826 ) ) ( not ( = ?auto_556823 ?auto_556827 ) ) ( not ( = ?auto_556823 ?auto_556828 ) ) ( not ( = ?auto_556824 ?auto_556825 ) ) ( not ( = ?auto_556824 ?auto_556826 ) ) ( not ( = ?auto_556824 ?auto_556827 ) ) ( not ( = ?auto_556824 ?auto_556828 ) ) ( not ( = ?auto_556825 ?auto_556826 ) ) ( not ( = ?auto_556825 ?auto_556827 ) ) ( not ( = ?auto_556825 ?auto_556828 ) ) ( not ( = ?auto_556826 ?auto_556827 ) ) ( not ( = ?auto_556826 ?auto_556828 ) ) ( not ( = ?auto_556827 ?auto_556828 ) ) ( ON ?auto_556826 ?auto_556827 ) ( ON ?auto_556825 ?auto_556826 ) ( ON ?auto_556824 ?auto_556825 ) ( ON ?auto_556823 ?auto_556824 ) ( ON ?auto_556822 ?auto_556823 ) ( ON ?auto_556821 ?auto_556822 ) ( ON ?auto_556820 ?auto_556821 ) ( ON ?auto_556819 ?auto_556820 ) ( ON ?auto_556818 ?auto_556819 ) ( CLEAR ?auto_556816 ) ( ON ?auto_556817 ?auto_556818 ) ( CLEAR ?auto_556817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_556814 ?auto_556815 ?auto_556816 ?auto_556817 )
      ( MAKE-14PILE ?auto_556814 ?auto_556815 ?auto_556816 ?auto_556817 ?auto_556818 ?auto_556819 ?auto_556820 ?auto_556821 ?auto_556822 ?auto_556823 ?auto_556824 ?auto_556825 ?auto_556826 ?auto_556827 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556872 - BLOCK
      ?auto_556873 - BLOCK
      ?auto_556874 - BLOCK
      ?auto_556875 - BLOCK
      ?auto_556876 - BLOCK
      ?auto_556877 - BLOCK
      ?auto_556878 - BLOCK
      ?auto_556879 - BLOCK
      ?auto_556880 - BLOCK
      ?auto_556881 - BLOCK
      ?auto_556882 - BLOCK
      ?auto_556883 - BLOCK
      ?auto_556884 - BLOCK
      ?auto_556885 - BLOCK
    )
    :vars
    (
      ?auto_556886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556885 ?auto_556886 ) ( ON-TABLE ?auto_556872 ) ( ON ?auto_556873 ?auto_556872 ) ( not ( = ?auto_556872 ?auto_556873 ) ) ( not ( = ?auto_556872 ?auto_556874 ) ) ( not ( = ?auto_556872 ?auto_556875 ) ) ( not ( = ?auto_556872 ?auto_556876 ) ) ( not ( = ?auto_556872 ?auto_556877 ) ) ( not ( = ?auto_556872 ?auto_556878 ) ) ( not ( = ?auto_556872 ?auto_556879 ) ) ( not ( = ?auto_556872 ?auto_556880 ) ) ( not ( = ?auto_556872 ?auto_556881 ) ) ( not ( = ?auto_556872 ?auto_556882 ) ) ( not ( = ?auto_556872 ?auto_556883 ) ) ( not ( = ?auto_556872 ?auto_556884 ) ) ( not ( = ?auto_556872 ?auto_556885 ) ) ( not ( = ?auto_556872 ?auto_556886 ) ) ( not ( = ?auto_556873 ?auto_556874 ) ) ( not ( = ?auto_556873 ?auto_556875 ) ) ( not ( = ?auto_556873 ?auto_556876 ) ) ( not ( = ?auto_556873 ?auto_556877 ) ) ( not ( = ?auto_556873 ?auto_556878 ) ) ( not ( = ?auto_556873 ?auto_556879 ) ) ( not ( = ?auto_556873 ?auto_556880 ) ) ( not ( = ?auto_556873 ?auto_556881 ) ) ( not ( = ?auto_556873 ?auto_556882 ) ) ( not ( = ?auto_556873 ?auto_556883 ) ) ( not ( = ?auto_556873 ?auto_556884 ) ) ( not ( = ?auto_556873 ?auto_556885 ) ) ( not ( = ?auto_556873 ?auto_556886 ) ) ( not ( = ?auto_556874 ?auto_556875 ) ) ( not ( = ?auto_556874 ?auto_556876 ) ) ( not ( = ?auto_556874 ?auto_556877 ) ) ( not ( = ?auto_556874 ?auto_556878 ) ) ( not ( = ?auto_556874 ?auto_556879 ) ) ( not ( = ?auto_556874 ?auto_556880 ) ) ( not ( = ?auto_556874 ?auto_556881 ) ) ( not ( = ?auto_556874 ?auto_556882 ) ) ( not ( = ?auto_556874 ?auto_556883 ) ) ( not ( = ?auto_556874 ?auto_556884 ) ) ( not ( = ?auto_556874 ?auto_556885 ) ) ( not ( = ?auto_556874 ?auto_556886 ) ) ( not ( = ?auto_556875 ?auto_556876 ) ) ( not ( = ?auto_556875 ?auto_556877 ) ) ( not ( = ?auto_556875 ?auto_556878 ) ) ( not ( = ?auto_556875 ?auto_556879 ) ) ( not ( = ?auto_556875 ?auto_556880 ) ) ( not ( = ?auto_556875 ?auto_556881 ) ) ( not ( = ?auto_556875 ?auto_556882 ) ) ( not ( = ?auto_556875 ?auto_556883 ) ) ( not ( = ?auto_556875 ?auto_556884 ) ) ( not ( = ?auto_556875 ?auto_556885 ) ) ( not ( = ?auto_556875 ?auto_556886 ) ) ( not ( = ?auto_556876 ?auto_556877 ) ) ( not ( = ?auto_556876 ?auto_556878 ) ) ( not ( = ?auto_556876 ?auto_556879 ) ) ( not ( = ?auto_556876 ?auto_556880 ) ) ( not ( = ?auto_556876 ?auto_556881 ) ) ( not ( = ?auto_556876 ?auto_556882 ) ) ( not ( = ?auto_556876 ?auto_556883 ) ) ( not ( = ?auto_556876 ?auto_556884 ) ) ( not ( = ?auto_556876 ?auto_556885 ) ) ( not ( = ?auto_556876 ?auto_556886 ) ) ( not ( = ?auto_556877 ?auto_556878 ) ) ( not ( = ?auto_556877 ?auto_556879 ) ) ( not ( = ?auto_556877 ?auto_556880 ) ) ( not ( = ?auto_556877 ?auto_556881 ) ) ( not ( = ?auto_556877 ?auto_556882 ) ) ( not ( = ?auto_556877 ?auto_556883 ) ) ( not ( = ?auto_556877 ?auto_556884 ) ) ( not ( = ?auto_556877 ?auto_556885 ) ) ( not ( = ?auto_556877 ?auto_556886 ) ) ( not ( = ?auto_556878 ?auto_556879 ) ) ( not ( = ?auto_556878 ?auto_556880 ) ) ( not ( = ?auto_556878 ?auto_556881 ) ) ( not ( = ?auto_556878 ?auto_556882 ) ) ( not ( = ?auto_556878 ?auto_556883 ) ) ( not ( = ?auto_556878 ?auto_556884 ) ) ( not ( = ?auto_556878 ?auto_556885 ) ) ( not ( = ?auto_556878 ?auto_556886 ) ) ( not ( = ?auto_556879 ?auto_556880 ) ) ( not ( = ?auto_556879 ?auto_556881 ) ) ( not ( = ?auto_556879 ?auto_556882 ) ) ( not ( = ?auto_556879 ?auto_556883 ) ) ( not ( = ?auto_556879 ?auto_556884 ) ) ( not ( = ?auto_556879 ?auto_556885 ) ) ( not ( = ?auto_556879 ?auto_556886 ) ) ( not ( = ?auto_556880 ?auto_556881 ) ) ( not ( = ?auto_556880 ?auto_556882 ) ) ( not ( = ?auto_556880 ?auto_556883 ) ) ( not ( = ?auto_556880 ?auto_556884 ) ) ( not ( = ?auto_556880 ?auto_556885 ) ) ( not ( = ?auto_556880 ?auto_556886 ) ) ( not ( = ?auto_556881 ?auto_556882 ) ) ( not ( = ?auto_556881 ?auto_556883 ) ) ( not ( = ?auto_556881 ?auto_556884 ) ) ( not ( = ?auto_556881 ?auto_556885 ) ) ( not ( = ?auto_556881 ?auto_556886 ) ) ( not ( = ?auto_556882 ?auto_556883 ) ) ( not ( = ?auto_556882 ?auto_556884 ) ) ( not ( = ?auto_556882 ?auto_556885 ) ) ( not ( = ?auto_556882 ?auto_556886 ) ) ( not ( = ?auto_556883 ?auto_556884 ) ) ( not ( = ?auto_556883 ?auto_556885 ) ) ( not ( = ?auto_556883 ?auto_556886 ) ) ( not ( = ?auto_556884 ?auto_556885 ) ) ( not ( = ?auto_556884 ?auto_556886 ) ) ( not ( = ?auto_556885 ?auto_556886 ) ) ( ON ?auto_556884 ?auto_556885 ) ( ON ?auto_556883 ?auto_556884 ) ( ON ?auto_556882 ?auto_556883 ) ( ON ?auto_556881 ?auto_556882 ) ( ON ?auto_556880 ?auto_556881 ) ( ON ?auto_556879 ?auto_556880 ) ( ON ?auto_556878 ?auto_556879 ) ( ON ?auto_556877 ?auto_556878 ) ( ON ?auto_556876 ?auto_556877 ) ( ON ?auto_556875 ?auto_556876 ) ( CLEAR ?auto_556873 ) ( ON ?auto_556874 ?auto_556875 ) ( CLEAR ?auto_556874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_556872 ?auto_556873 ?auto_556874 )
      ( MAKE-14PILE ?auto_556872 ?auto_556873 ?auto_556874 ?auto_556875 ?auto_556876 ?auto_556877 ?auto_556878 ?auto_556879 ?auto_556880 ?auto_556881 ?auto_556882 ?auto_556883 ?auto_556884 ?auto_556885 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556930 - BLOCK
      ?auto_556931 - BLOCK
      ?auto_556932 - BLOCK
      ?auto_556933 - BLOCK
      ?auto_556934 - BLOCK
      ?auto_556935 - BLOCK
      ?auto_556936 - BLOCK
      ?auto_556937 - BLOCK
      ?auto_556938 - BLOCK
      ?auto_556939 - BLOCK
      ?auto_556940 - BLOCK
      ?auto_556941 - BLOCK
      ?auto_556942 - BLOCK
      ?auto_556943 - BLOCK
    )
    :vars
    (
      ?auto_556944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_556943 ?auto_556944 ) ( ON-TABLE ?auto_556930 ) ( not ( = ?auto_556930 ?auto_556931 ) ) ( not ( = ?auto_556930 ?auto_556932 ) ) ( not ( = ?auto_556930 ?auto_556933 ) ) ( not ( = ?auto_556930 ?auto_556934 ) ) ( not ( = ?auto_556930 ?auto_556935 ) ) ( not ( = ?auto_556930 ?auto_556936 ) ) ( not ( = ?auto_556930 ?auto_556937 ) ) ( not ( = ?auto_556930 ?auto_556938 ) ) ( not ( = ?auto_556930 ?auto_556939 ) ) ( not ( = ?auto_556930 ?auto_556940 ) ) ( not ( = ?auto_556930 ?auto_556941 ) ) ( not ( = ?auto_556930 ?auto_556942 ) ) ( not ( = ?auto_556930 ?auto_556943 ) ) ( not ( = ?auto_556930 ?auto_556944 ) ) ( not ( = ?auto_556931 ?auto_556932 ) ) ( not ( = ?auto_556931 ?auto_556933 ) ) ( not ( = ?auto_556931 ?auto_556934 ) ) ( not ( = ?auto_556931 ?auto_556935 ) ) ( not ( = ?auto_556931 ?auto_556936 ) ) ( not ( = ?auto_556931 ?auto_556937 ) ) ( not ( = ?auto_556931 ?auto_556938 ) ) ( not ( = ?auto_556931 ?auto_556939 ) ) ( not ( = ?auto_556931 ?auto_556940 ) ) ( not ( = ?auto_556931 ?auto_556941 ) ) ( not ( = ?auto_556931 ?auto_556942 ) ) ( not ( = ?auto_556931 ?auto_556943 ) ) ( not ( = ?auto_556931 ?auto_556944 ) ) ( not ( = ?auto_556932 ?auto_556933 ) ) ( not ( = ?auto_556932 ?auto_556934 ) ) ( not ( = ?auto_556932 ?auto_556935 ) ) ( not ( = ?auto_556932 ?auto_556936 ) ) ( not ( = ?auto_556932 ?auto_556937 ) ) ( not ( = ?auto_556932 ?auto_556938 ) ) ( not ( = ?auto_556932 ?auto_556939 ) ) ( not ( = ?auto_556932 ?auto_556940 ) ) ( not ( = ?auto_556932 ?auto_556941 ) ) ( not ( = ?auto_556932 ?auto_556942 ) ) ( not ( = ?auto_556932 ?auto_556943 ) ) ( not ( = ?auto_556932 ?auto_556944 ) ) ( not ( = ?auto_556933 ?auto_556934 ) ) ( not ( = ?auto_556933 ?auto_556935 ) ) ( not ( = ?auto_556933 ?auto_556936 ) ) ( not ( = ?auto_556933 ?auto_556937 ) ) ( not ( = ?auto_556933 ?auto_556938 ) ) ( not ( = ?auto_556933 ?auto_556939 ) ) ( not ( = ?auto_556933 ?auto_556940 ) ) ( not ( = ?auto_556933 ?auto_556941 ) ) ( not ( = ?auto_556933 ?auto_556942 ) ) ( not ( = ?auto_556933 ?auto_556943 ) ) ( not ( = ?auto_556933 ?auto_556944 ) ) ( not ( = ?auto_556934 ?auto_556935 ) ) ( not ( = ?auto_556934 ?auto_556936 ) ) ( not ( = ?auto_556934 ?auto_556937 ) ) ( not ( = ?auto_556934 ?auto_556938 ) ) ( not ( = ?auto_556934 ?auto_556939 ) ) ( not ( = ?auto_556934 ?auto_556940 ) ) ( not ( = ?auto_556934 ?auto_556941 ) ) ( not ( = ?auto_556934 ?auto_556942 ) ) ( not ( = ?auto_556934 ?auto_556943 ) ) ( not ( = ?auto_556934 ?auto_556944 ) ) ( not ( = ?auto_556935 ?auto_556936 ) ) ( not ( = ?auto_556935 ?auto_556937 ) ) ( not ( = ?auto_556935 ?auto_556938 ) ) ( not ( = ?auto_556935 ?auto_556939 ) ) ( not ( = ?auto_556935 ?auto_556940 ) ) ( not ( = ?auto_556935 ?auto_556941 ) ) ( not ( = ?auto_556935 ?auto_556942 ) ) ( not ( = ?auto_556935 ?auto_556943 ) ) ( not ( = ?auto_556935 ?auto_556944 ) ) ( not ( = ?auto_556936 ?auto_556937 ) ) ( not ( = ?auto_556936 ?auto_556938 ) ) ( not ( = ?auto_556936 ?auto_556939 ) ) ( not ( = ?auto_556936 ?auto_556940 ) ) ( not ( = ?auto_556936 ?auto_556941 ) ) ( not ( = ?auto_556936 ?auto_556942 ) ) ( not ( = ?auto_556936 ?auto_556943 ) ) ( not ( = ?auto_556936 ?auto_556944 ) ) ( not ( = ?auto_556937 ?auto_556938 ) ) ( not ( = ?auto_556937 ?auto_556939 ) ) ( not ( = ?auto_556937 ?auto_556940 ) ) ( not ( = ?auto_556937 ?auto_556941 ) ) ( not ( = ?auto_556937 ?auto_556942 ) ) ( not ( = ?auto_556937 ?auto_556943 ) ) ( not ( = ?auto_556937 ?auto_556944 ) ) ( not ( = ?auto_556938 ?auto_556939 ) ) ( not ( = ?auto_556938 ?auto_556940 ) ) ( not ( = ?auto_556938 ?auto_556941 ) ) ( not ( = ?auto_556938 ?auto_556942 ) ) ( not ( = ?auto_556938 ?auto_556943 ) ) ( not ( = ?auto_556938 ?auto_556944 ) ) ( not ( = ?auto_556939 ?auto_556940 ) ) ( not ( = ?auto_556939 ?auto_556941 ) ) ( not ( = ?auto_556939 ?auto_556942 ) ) ( not ( = ?auto_556939 ?auto_556943 ) ) ( not ( = ?auto_556939 ?auto_556944 ) ) ( not ( = ?auto_556940 ?auto_556941 ) ) ( not ( = ?auto_556940 ?auto_556942 ) ) ( not ( = ?auto_556940 ?auto_556943 ) ) ( not ( = ?auto_556940 ?auto_556944 ) ) ( not ( = ?auto_556941 ?auto_556942 ) ) ( not ( = ?auto_556941 ?auto_556943 ) ) ( not ( = ?auto_556941 ?auto_556944 ) ) ( not ( = ?auto_556942 ?auto_556943 ) ) ( not ( = ?auto_556942 ?auto_556944 ) ) ( not ( = ?auto_556943 ?auto_556944 ) ) ( ON ?auto_556942 ?auto_556943 ) ( ON ?auto_556941 ?auto_556942 ) ( ON ?auto_556940 ?auto_556941 ) ( ON ?auto_556939 ?auto_556940 ) ( ON ?auto_556938 ?auto_556939 ) ( ON ?auto_556937 ?auto_556938 ) ( ON ?auto_556936 ?auto_556937 ) ( ON ?auto_556935 ?auto_556936 ) ( ON ?auto_556934 ?auto_556935 ) ( ON ?auto_556933 ?auto_556934 ) ( ON ?auto_556932 ?auto_556933 ) ( CLEAR ?auto_556930 ) ( ON ?auto_556931 ?auto_556932 ) ( CLEAR ?auto_556931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_556930 ?auto_556931 )
      ( MAKE-14PILE ?auto_556930 ?auto_556931 ?auto_556932 ?auto_556933 ?auto_556934 ?auto_556935 ?auto_556936 ?auto_556937 ?auto_556938 ?auto_556939 ?auto_556940 ?auto_556941 ?auto_556942 ?auto_556943 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_556988 - BLOCK
      ?auto_556989 - BLOCK
      ?auto_556990 - BLOCK
      ?auto_556991 - BLOCK
      ?auto_556992 - BLOCK
      ?auto_556993 - BLOCK
      ?auto_556994 - BLOCK
      ?auto_556995 - BLOCK
      ?auto_556996 - BLOCK
      ?auto_556997 - BLOCK
      ?auto_556998 - BLOCK
      ?auto_556999 - BLOCK
      ?auto_557000 - BLOCK
      ?auto_557001 - BLOCK
    )
    :vars
    (
      ?auto_557002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557001 ?auto_557002 ) ( not ( = ?auto_556988 ?auto_556989 ) ) ( not ( = ?auto_556988 ?auto_556990 ) ) ( not ( = ?auto_556988 ?auto_556991 ) ) ( not ( = ?auto_556988 ?auto_556992 ) ) ( not ( = ?auto_556988 ?auto_556993 ) ) ( not ( = ?auto_556988 ?auto_556994 ) ) ( not ( = ?auto_556988 ?auto_556995 ) ) ( not ( = ?auto_556988 ?auto_556996 ) ) ( not ( = ?auto_556988 ?auto_556997 ) ) ( not ( = ?auto_556988 ?auto_556998 ) ) ( not ( = ?auto_556988 ?auto_556999 ) ) ( not ( = ?auto_556988 ?auto_557000 ) ) ( not ( = ?auto_556988 ?auto_557001 ) ) ( not ( = ?auto_556988 ?auto_557002 ) ) ( not ( = ?auto_556989 ?auto_556990 ) ) ( not ( = ?auto_556989 ?auto_556991 ) ) ( not ( = ?auto_556989 ?auto_556992 ) ) ( not ( = ?auto_556989 ?auto_556993 ) ) ( not ( = ?auto_556989 ?auto_556994 ) ) ( not ( = ?auto_556989 ?auto_556995 ) ) ( not ( = ?auto_556989 ?auto_556996 ) ) ( not ( = ?auto_556989 ?auto_556997 ) ) ( not ( = ?auto_556989 ?auto_556998 ) ) ( not ( = ?auto_556989 ?auto_556999 ) ) ( not ( = ?auto_556989 ?auto_557000 ) ) ( not ( = ?auto_556989 ?auto_557001 ) ) ( not ( = ?auto_556989 ?auto_557002 ) ) ( not ( = ?auto_556990 ?auto_556991 ) ) ( not ( = ?auto_556990 ?auto_556992 ) ) ( not ( = ?auto_556990 ?auto_556993 ) ) ( not ( = ?auto_556990 ?auto_556994 ) ) ( not ( = ?auto_556990 ?auto_556995 ) ) ( not ( = ?auto_556990 ?auto_556996 ) ) ( not ( = ?auto_556990 ?auto_556997 ) ) ( not ( = ?auto_556990 ?auto_556998 ) ) ( not ( = ?auto_556990 ?auto_556999 ) ) ( not ( = ?auto_556990 ?auto_557000 ) ) ( not ( = ?auto_556990 ?auto_557001 ) ) ( not ( = ?auto_556990 ?auto_557002 ) ) ( not ( = ?auto_556991 ?auto_556992 ) ) ( not ( = ?auto_556991 ?auto_556993 ) ) ( not ( = ?auto_556991 ?auto_556994 ) ) ( not ( = ?auto_556991 ?auto_556995 ) ) ( not ( = ?auto_556991 ?auto_556996 ) ) ( not ( = ?auto_556991 ?auto_556997 ) ) ( not ( = ?auto_556991 ?auto_556998 ) ) ( not ( = ?auto_556991 ?auto_556999 ) ) ( not ( = ?auto_556991 ?auto_557000 ) ) ( not ( = ?auto_556991 ?auto_557001 ) ) ( not ( = ?auto_556991 ?auto_557002 ) ) ( not ( = ?auto_556992 ?auto_556993 ) ) ( not ( = ?auto_556992 ?auto_556994 ) ) ( not ( = ?auto_556992 ?auto_556995 ) ) ( not ( = ?auto_556992 ?auto_556996 ) ) ( not ( = ?auto_556992 ?auto_556997 ) ) ( not ( = ?auto_556992 ?auto_556998 ) ) ( not ( = ?auto_556992 ?auto_556999 ) ) ( not ( = ?auto_556992 ?auto_557000 ) ) ( not ( = ?auto_556992 ?auto_557001 ) ) ( not ( = ?auto_556992 ?auto_557002 ) ) ( not ( = ?auto_556993 ?auto_556994 ) ) ( not ( = ?auto_556993 ?auto_556995 ) ) ( not ( = ?auto_556993 ?auto_556996 ) ) ( not ( = ?auto_556993 ?auto_556997 ) ) ( not ( = ?auto_556993 ?auto_556998 ) ) ( not ( = ?auto_556993 ?auto_556999 ) ) ( not ( = ?auto_556993 ?auto_557000 ) ) ( not ( = ?auto_556993 ?auto_557001 ) ) ( not ( = ?auto_556993 ?auto_557002 ) ) ( not ( = ?auto_556994 ?auto_556995 ) ) ( not ( = ?auto_556994 ?auto_556996 ) ) ( not ( = ?auto_556994 ?auto_556997 ) ) ( not ( = ?auto_556994 ?auto_556998 ) ) ( not ( = ?auto_556994 ?auto_556999 ) ) ( not ( = ?auto_556994 ?auto_557000 ) ) ( not ( = ?auto_556994 ?auto_557001 ) ) ( not ( = ?auto_556994 ?auto_557002 ) ) ( not ( = ?auto_556995 ?auto_556996 ) ) ( not ( = ?auto_556995 ?auto_556997 ) ) ( not ( = ?auto_556995 ?auto_556998 ) ) ( not ( = ?auto_556995 ?auto_556999 ) ) ( not ( = ?auto_556995 ?auto_557000 ) ) ( not ( = ?auto_556995 ?auto_557001 ) ) ( not ( = ?auto_556995 ?auto_557002 ) ) ( not ( = ?auto_556996 ?auto_556997 ) ) ( not ( = ?auto_556996 ?auto_556998 ) ) ( not ( = ?auto_556996 ?auto_556999 ) ) ( not ( = ?auto_556996 ?auto_557000 ) ) ( not ( = ?auto_556996 ?auto_557001 ) ) ( not ( = ?auto_556996 ?auto_557002 ) ) ( not ( = ?auto_556997 ?auto_556998 ) ) ( not ( = ?auto_556997 ?auto_556999 ) ) ( not ( = ?auto_556997 ?auto_557000 ) ) ( not ( = ?auto_556997 ?auto_557001 ) ) ( not ( = ?auto_556997 ?auto_557002 ) ) ( not ( = ?auto_556998 ?auto_556999 ) ) ( not ( = ?auto_556998 ?auto_557000 ) ) ( not ( = ?auto_556998 ?auto_557001 ) ) ( not ( = ?auto_556998 ?auto_557002 ) ) ( not ( = ?auto_556999 ?auto_557000 ) ) ( not ( = ?auto_556999 ?auto_557001 ) ) ( not ( = ?auto_556999 ?auto_557002 ) ) ( not ( = ?auto_557000 ?auto_557001 ) ) ( not ( = ?auto_557000 ?auto_557002 ) ) ( not ( = ?auto_557001 ?auto_557002 ) ) ( ON ?auto_557000 ?auto_557001 ) ( ON ?auto_556999 ?auto_557000 ) ( ON ?auto_556998 ?auto_556999 ) ( ON ?auto_556997 ?auto_556998 ) ( ON ?auto_556996 ?auto_556997 ) ( ON ?auto_556995 ?auto_556996 ) ( ON ?auto_556994 ?auto_556995 ) ( ON ?auto_556993 ?auto_556994 ) ( ON ?auto_556992 ?auto_556993 ) ( ON ?auto_556991 ?auto_556992 ) ( ON ?auto_556990 ?auto_556991 ) ( ON ?auto_556989 ?auto_556990 ) ( ON ?auto_556988 ?auto_556989 ) ( CLEAR ?auto_556988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_556988 )
      ( MAKE-14PILE ?auto_556988 ?auto_556989 ?auto_556990 ?auto_556991 ?auto_556992 ?auto_556993 ?auto_556994 ?auto_556995 ?auto_556996 ?auto_556997 ?auto_556998 ?auto_556999 ?auto_557000 ?auto_557001 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557047 - BLOCK
      ?auto_557048 - BLOCK
      ?auto_557049 - BLOCK
      ?auto_557050 - BLOCK
      ?auto_557051 - BLOCK
      ?auto_557052 - BLOCK
      ?auto_557053 - BLOCK
      ?auto_557054 - BLOCK
      ?auto_557055 - BLOCK
      ?auto_557056 - BLOCK
      ?auto_557057 - BLOCK
      ?auto_557058 - BLOCK
      ?auto_557059 - BLOCK
      ?auto_557060 - BLOCK
      ?auto_557061 - BLOCK
    )
    :vars
    (
      ?auto_557062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_557060 ) ( ON ?auto_557061 ?auto_557062 ) ( CLEAR ?auto_557061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_557047 ) ( ON ?auto_557048 ?auto_557047 ) ( ON ?auto_557049 ?auto_557048 ) ( ON ?auto_557050 ?auto_557049 ) ( ON ?auto_557051 ?auto_557050 ) ( ON ?auto_557052 ?auto_557051 ) ( ON ?auto_557053 ?auto_557052 ) ( ON ?auto_557054 ?auto_557053 ) ( ON ?auto_557055 ?auto_557054 ) ( ON ?auto_557056 ?auto_557055 ) ( ON ?auto_557057 ?auto_557056 ) ( ON ?auto_557058 ?auto_557057 ) ( ON ?auto_557059 ?auto_557058 ) ( ON ?auto_557060 ?auto_557059 ) ( not ( = ?auto_557047 ?auto_557048 ) ) ( not ( = ?auto_557047 ?auto_557049 ) ) ( not ( = ?auto_557047 ?auto_557050 ) ) ( not ( = ?auto_557047 ?auto_557051 ) ) ( not ( = ?auto_557047 ?auto_557052 ) ) ( not ( = ?auto_557047 ?auto_557053 ) ) ( not ( = ?auto_557047 ?auto_557054 ) ) ( not ( = ?auto_557047 ?auto_557055 ) ) ( not ( = ?auto_557047 ?auto_557056 ) ) ( not ( = ?auto_557047 ?auto_557057 ) ) ( not ( = ?auto_557047 ?auto_557058 ) ) ( not ( = ?auto_557047 ?auto_557059 ) ) ( not ( = ?auto_557047 ?auto_557060 ) ) ( not ( = ?auto_557047 ?auto_557061 ) ) ( not ( = ?auto_557047 ?auto_557062 ) ) ( not ( = ?auto_557048 ?auto_557049 ) ) ( not ( = ?auto_557048 ?auto_557050 ) ) ( not ( = ?auto_557048 ?auto_557051 ) ) ( not ( = ?auto_557048 ?auto_557052 ) ) ( not ( = ?auto_557048 ?auto_557053 ) ) ( not ( = ?auto_557048 ?auto_557054 ) ) ( not ( = ?auto_557048 ?auto_557055 ) ) ( not ( = ?auto_557048 ?auto_557056 ) ) ( not ( = ?auto_557048 ?auto_557057 ) ) ( not ( = ?auto_557048 ?auto_557058 ) ) ( not ( = ?auto_557048 ?auto_557059 ) ) ( not ( = ?auto_557048 ?auto_557060 ) ) ( not ( = ?auto_557048 ?auto_557061 ) ) ( not ( = ?auto_557048 ?auto_557062 ) ) ( not ( = ?auto_557049 ?auto_557050 ) ) ( not ( = ?auto_557049 ?auto_557051 ) ) ( not ( = ?auto_557049 ?auto_557052 ) ) ( not ( = ?auto_557049 ?auto_557053 ) ) ( not ( = ?auto_557049 ?auto_557054 ) ) ( not ( = ?auto_557049 ?auto_557055 ) ) ( not ( = ?auto_557049 ?auto_557056 ) ) ( not ( = ?auto_557049 ?auto_557057 ) ) ( not ( = ?auto_557049 ?auto_557058 ) ) ( not ( = ?auto_557049 ?auto_557059 ) ) ( not ( = ?auto_557049 ?auto_557060 ) ) ( not ( = ?auto_557049 ?auto_557061 ) ) ( not ( = ?auto_557049 ?auto_557062 ) ) ( not ( = ?auto_557050 ?auto_557051 ) ) ( not ( = ?auto_557050 ?auto_557052 ) ) ( not ( = ?auto_557050 ?auto_557053 ) ) ( not ( = ?auto_557050 ?auto_557054 ) ) ( not ( = ?auto_557050 ?auto_557055 ) ) ( not ( = ?auto_557050 ?auto_557056 ) ) ( not ( = ?auto_557050 ?auto_557057 ) ) ( not ( = ?auto_557050 ?auto_557058 ) ) ( not ( = ?auto_557050 ?auto_557059 ) ) ( not ( = ?auto_557050 ?auto_557060 ) ) ( not ( = ?auto_557050 ?auto_557061 ) ) ( not ( = ?auto_557050 ?auto_557062 ) ) ( not ( = ?auto_557051 ?auto_557052 ) ) ( not ( = ?auto_557051 ?auto_557053 ) ) ( not ( = ?auto_557051 ?auto_557054 ) ) ( not ( = ?auto_557051 ?auto_557055 ) ) ( not ( = ?auto_557051 ?auto_557056 ) ) ( not ( = ?auto_557051 ?auto_557057 ) ) ( not ( = ?auto_557051 ?auto_557058 ) ) ( not ( = ?auto_557051 ?auto_557059 ) ) ( not ( = ?auto_557051 ?auto_557060 ) ) ( not ( = ?auto_557051 ?auto_557061 ) ) ( not ( = ?auto_557051 ?auto_557062 ) ) ( not ( = ?auto_557052 ?auto_557053 ) ) ( not ( = ?auto_557052 ?auto_557054 ) ) ( not ( = ?auto_557052 ?auto_557055 ) ) ( not ( = ?auto_557052 ?auto_557056 ) ) ( not ( = ?auto_557052 ?auto_557057 ) ) ( not ( = ?auto_557052 ?auto_557058 ) ) ( not ( = ?auto_557052 ?auto_557059 ) ) ( not ( = ?auto_557052 ?auto_557060 ) ) ( not ( = ?auto_557052 ?auto_557061 ) ) ( not ( = ?auto_557052 ?auto_557062 ) ) ( not ( = ?auto_557053 ?auto_557054 ) ) ( not ( = ?auto_557053 ?auto_557055 ) ) ( not ( = ?auto_557053 ?auto_557056 ) ) ( not ( = ?auto_557053 ?auto_557057 ) ) ( not ( = ?auto_557053 ?auto_557058 ) ) ( not ( = ?auto_557053 ?auto_557059 ) ) ( not ( = ?auto_557053 ?auto_557060 ) ) ( not ( = ?auto_557053 ?auto_557061 ) ) ( not ( = ?auto_557053 ?auto_557062 ) ) ( not ( = ?auto_557054 ?auto_557055 ) ) ( not ( = ?auto_557054 ?auto_557056 ) ) ( not ( = ?auto_557054 ?auto_557057 ) ) ( not ( = ?auto_557054 ?auto_557058 ) ) ( not ( = ?auto_557054 ?auto_557059 ) ) ( not ( = ?auto_557054 ?auto_557060 ) ) ( not ( = ?auto_557054 ?auto_557061 ) ) ( not ( = ?auto_557054 ?auto_557062 ) ) ( not ( = ?auto_557055 ?auto_557056 ) ) ( not ( = ?auto_557055 ?auto_557057 ) ) ( not ( = ?auto_557055 ?auto_557058 ) ) ( not ( = ?auto_557055 ?auto_557059 ) ) ( not ( = ?auto_557055 ?auto_557060 ) ) ( not ( = ?auto_557055 ?auto_557061 ) ) ( not ( = ?auto_557055 ?auto_557062 ) ) ( not ( = ?auto_557056 ?auto_557057 ) ) ( not ( = ?auto_557056 ?auto_557058 ) ) ( not ( = ?auto_557056 ?auto_557059 ) ) ( not ( = ?auto_557056 ?auto_557060 ) ) ( not ( = ?auto_557056 ?auto_557061 ) ) ( not ( = ?auto_557056 ?auto_557062 ) ) ( not ( = ?auto_557057 ?auto_557058 ) ) ( not ( = ?auto_557057 ?auto_557059 ) ) ( not ( = ?auto_557057 ?auto_557060 ) ) ( not ( = ?auto_557057 ?auto_557061 ) ) ( not ( = ?auto_557057 ?auto_557062 ) ) ( not ( = ?auto_557058 ?auto_557059 ) ) ( not ( = ?auto_557058 ?auto_557060 ) ) ( not ( = ?auto_557058 ?auto_557061 ) ) ( not ( = ?auto_557058 ?auto_557062 ) ) ( not ( = ?auto_557059 ?auto_557060 ) ) ( not ( = ?auto_557059 ?auto_557061 ) ) ( not ( = ?auto_557059 ?auto_557062 ) ) ( not ( = ?auto_557060 ?auto_557061 ) ) ( not ( = ?auto_557060 ?auto_557062 ) ) ( not ( = ?auto_557061 ?auto_557062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_557061 ?auto_557062 )
      ( !STACK ?auto_557061 ?auto_557060 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557109 - BLOCK
      ?auto_557110 - BLOCK
      ?auto_557111 - BLOCK
      ?auto_557112 - BLOCK
      ?auto_557113 - BLOCK
      ?auto_557114 - BLOCK
      ?auto_557115 - BLOCK
      ?auto_557116 - BLOCK
      ?auto_557117 - BLOCK
      ?auto_557118 - BLOCK
      ?auto_557119 - BLOCK
      ?auto_557120 - BLOCK
      ?auto_557121 - BLOCK
      ?auto_557122 - BLOCK
      ?auto_557123 - BLOCK
    )
    :vars
    (
      ?auto_557124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557123 ?auto_557124 ) ( ON-TABLE ?auto_557109 ) ( ON ?auto_557110 ?auto_557109 ) ( ON ?auto_557111 ?auto_557110 ) ( ON ?auto_557112 ?auto_557111 ) ( ON ?auto_557113 ?auto_557112 ) ( ON ?auto_557114 ?auto_557113 ) ( ON ?auto_557115 ?auto_557114 ) ( ON ?auto_557116 ?auto_557115 ) ( ON ?auto_557117 ?auto_557116 ) ( ON ?auto_557118 ?auto_557117 ) ( ON ?auto_557119 ?auto_557118 ) ( ON ?auto_557120 ?auto_557119 ) ( ON ?auto_557121 ?auto_557120 ) ( not ( = ?auto_557109 ?auto_557110 ) ) ( not ( = ?auto_557109 ?auto_557111 ) ) ( not ( = ?auto_557109 ?auto_557112 ) ) ( not ( = ?auto_557109 ?auto_557113 ) ) ( not ( = ?auto_557109 ?auto_557114 ) ) ( not ( = ?auto_557109 ?auto_557115 ) ) ( not ( = ?auto_557109 ?auto_557116 ) ) ( not ( = ?auto_557109 ?auto_557117 ) ) ( not ( = ?auto_557109 ?auto_557118 ) ) ( not ( = ?auto_557109 ?auto_557119 ) ) ( not ( = ?auto_557109 ?auto_557120 ) ) ( not ( = ?auto_557109 ?auto_557121 ) ) ( not ( = ?auto_557109 ?auto_557122 ) ) ( not ( = ?auto_557109 ?auto_557123 ) ) ( not ( = ?auto_557109 ?auto_557124 ) ) ( not ( = ?auto_557110 ?auto_557111 ) ) ( not ( = ?auto_557110 ?auto_557112 ) ) ( not ( = ?auto_557110 ?auto_557113 ) ) ( not ( = ?auto_557110 ?auto_557114 ) ) ( not ( = ?auto_557110 ?auto_557115 ) ) ( not ( = ?auto_557110 ?auto_557116 ) ) ( not ( = ?auto_557110 ?auto_557117 ) ) ( not ( = ?auto_557110 ?auto_557118 ) ) ( not ( = ?auto_557110 ?auto_557119 ) ) ( not ( = ?auto_557110 ?auto_557120 ) ) ( not ( = ?auto_557110 ?auto_557121 ) ) ( not ( = ?auto_557110 ?auto_557122 ) ) ( not ( = ?auto_557110 ?auto_557123 ) ) ( not ( = ?auto_557110 ?auto_557124 ) ) ( not ( = ?auto_557111 ?auto_557112 ) ) ( not ( = ?auto_557111 ?auto_557113 ) ) ( not ( = ?auto_557111 ?auto_557114 ) ) ( not ( = ?auto_557111 ?auto_557115 ) ) ( not ( = ?auto_557111 ?auto_557116 ) ) ( not ( = ?auto_557111 ?auto_557117 ) ) ( not ( = ?auto_557111 ?auto_557118 ) ) ( not ( = ?auto_557111 ?auto_557119 ) ) ( not ( = ?auto_557111 ?auto_557120 ) ) ( not ( = ?auto_557111 ?auto_557121 ) ) ( not ( = ?auto_557111 ?auto_557122 ) ) ( not ( = ?auto_557111 ?auto_557123 ) ) ( not ( = ?auto_557111 ?auto_557124 ) ) ( not ( = ?auto_557112 ?auto_557113 ) ) ( not ( = ?auto_557112 ?auto_557114 ) ) ( not ( = ?auto_557112 ?auto_557115 ) ) ( not ( = ?auto_557112 ?auto_557116 ) ) ( not ( = ?auto_557112 ?auto_557117 ) ) ( not ( = ?auto_557112 ?auto_557118 ) ) ( not ( = ?auto_557112 ?auto_557119 ) ) ( not ( = ?auto_557112 ?auto_557120 ) ) ( not ( = ?auto_557112 ?auto_557121 ) ) ( not ( = ?auto_557112 ?auto_557122 ) ) ( not ( = ?auto_557112 ?auto_557123 ) ) ( not ( = ?auto_557112 ?auto_557124 ) ) ( not ( = ?auto_557113 ?auto_557114 ) ) ( not ( = ?auto_557113 ?auto_557115 ) ) ( not ( = ?auto_557113 ?auto_557116 ) ) ( not ( = ?auto_557113 ?auto_557117 ) ) ( not ( = ?auto_557113 ?auto_557118 ) ) ( not ( = ?auto_557113 ?auto_557119 ) ) ( not ( = ?auto_557113 ?auto_557120 ) ) ( not ( = ?auto_557113 ?auto_557121 ) ) ( not ( = ?auto_557113 ?auto_557122 ) ) ( not ( = ?auto_557113 ?auto_557123 ) ) ( not ( = ?auto_557113 ?auto_557124 ) ) ( not ( = ?auto_557114 ?auto_557115 ) ) ( not ( = ?auto_557114 ?auto_557116 ) ) ( not ( = ?auto_557114 ?auto_557117 ) ) ( not ( = ?auto_557114 ?auto_557118 ) ) ( not ( = ?auto_557114 ?auto_557119 ) ) ( not ( = ?auto_557114 ?auto_557120 ) ) ( not ( = ?auto_557114 ?auto_557121 ) ) ( not ( = ?auto_557114 ?auto_557122 ) ) ( not ( = ?auto_557114 ?auto_557123 ) ) ( not ( = ?auto_557114 ?auto_557124 ) ) ( not ( = ?auto_557115 ?auto_557116 ) ) ( not ( = ?auto_557115 ?auto_557117 ) ) ( not ( = ?auto_557115 ?auto_557118 ) ) ( not ( = ?auto_557115 ?auto_557119 ) ) ( not ( = ?auto_557115 ?auto_557120 ) ) ( not ( = ?auto_557115 ?auto_557121 ) ) ( not ( = ?auto_557115 ?auto_557122 ) ) ( not ( = ?auto_557115 ?auto_557123 ) ) ( not ( = ?auto_557115 ?auto_557124 ) ) ( not ( = ?auto_557116 ?auto_557117 ) ) ( not ( = ?auto_557116 ?auto_557118 ) ) ( not ( = ?auto_557116 ?auto_557119 ) ) ( not ( = ?auto_557116 ?auto_557120 ) ) ( not ( = ?auto_557116 ?auto_557121 ) ) ( not ( = ?auto_557116 ?auto_557122 ) ) ( not ( = ?auto_557116 ?auto_557123 ) ) ( not ( = ?auto_557116 ?auto_557124 ) ) ( not ( = ?auto_557117 ?auto_557118 ) ) ( not ( = ?auto_557117 ?auto_557119 ) ) ( not ( = ?auto_557117 ?auto_557120 ) ) ( not ( = ?auto_557117 ?auto_557121 ) ) ( not ( = ?auto_557117 ?auto_557122 ) ) ( not ( = ?auto_557117 ?auto_557123 ) ) ( not ( = ?auto_557117 ?auto_557124 ) ) ( not ( = ?auto_557118 ?auto_557119 ) ) ( not ( = ?auto_557118 ?auto_557120 ) ) ( not ( = ?auto_557118 ?auto_557121 ) ) ( not ( = ?auto_557118 ?auto_557122 ) ) ( not ( = ?auto_557118 ?auto_557123 ) ) ( not ( = ?auto_557118 ?auto_557124 ) ) ( not ( = ?auto_557119 ?auto_557120 ) ) ( not ( = ?auto_557119 ?auto_557121 ) ) ( not ( = ?auto_557119 ?auto_557122 ) ) ( not ( = ?auto_557119 ?auto_557123 ) ) ( not ( = ?auto_557119 ?auto_557124 ) ) ( not ( = ?auto_557120 ?auto_557121 ) ) ( not ( = ?auto_557120 ?auto_557122 ) ) ( not ( = ?auto_557120 ?auto_557123 ) ) ( not ( = ?auto_557120 ?auto_557124 ) ) ( not ( = ?auto_557121 ?auto_557122 ) ) ( not ( = ?auto_557121 ?auto_557123 ) ) ( not ( = ?auto_557121 ?auto_557124 ) ) ( not ( = ?auto_557122 ?auto_557123 ) ) ( not ( = ?auto_557122 ?auto_557124 ) ) ( not ( = ?auto_557123 ?auto_557124 ) ) ( CLEAR ?auto_557121 ) ( ON ?auto_557122 ?auto_557123 ) ( CLEAR ?auto_557122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_557109 ?auto_557110 ?auto_557111 ?auto_557112 ?auto_557113 ?auto_557114 ?auto_557115 ?auto_557116 ?auto_557117 ?auto_557118 ?auto_557119 ?auto_557120 ?auto_557121 ?auto_557122 )
      ( MAKE-15PILE ?auto_557109 ?auto_557110 ?auto_557111 ?auto_557112 ?auto_557113 ?auto_557114 ?auto_557115 ?auto_557116 ?auto_557117 ?auto_557118 ?auto_557119 ?auto_557120 ?auto_557121 ?auto_557122 ?auto_557123 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557171 - BLOCK
      ?auto_557172 - BLOCK
      ?auto_557173 - BLOCK
      ?auto_557174 - BLOCK
      ?auto_557175 - BLOCK
      ?auto_557176 - BLOCK
      ?auto_557177 - BLOCK
      ?auto_557178 - BLOCK
      ?auto_557179 - BLOCK
      ?auto_557180 - BLOCK
      ?auto_557181 - BLOCK
      ?auto_557182 - BLOCK
      ?auto_557183 - BLOCK
      ?auto_557184 - BLOCK
      ?auto_557185 - BLOCK
    )
    :vars
    (
      ?auto_557186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557185 ?auto_557186 ) ( ON-TABLE ?auto_557171 ) ( ON ?auto_557172 ?auto_557171 ) ( ON ?auto_557173 ?auto_557172 ) ( ON ?auto_557174 ?auto_557173 ) ( ON ?auto_557175 ?auto_557174 ) ( ON ?auto_557176 ?auto_557175 ) ( ON ?auto_557177 ?auto_557176 ) ( ON ?auto_557178 ?auto_557177 ) ( ON ?auto_557179 ?auto_557178 ) ( ON ?auto_557180 ?auto_557179 ) ( ON ?auto_557181 ?auto_557180 ) ( ON ?auto_557182 ?auto_557181 ) ( not ( = ?auto_557171 ?auto_557172 ) ) ( not ( = ?auto_557171 ?auto_557173 ) ) ( not ( = ?auto_557171 ?auto_557174 ) ) ( not ( = ?auto_557171 ?auto_557175 ) ) ( not ( = ?auto_557171 ?auto_557176 ) ) ( not ( = ?auto_557171 ?auto_557177 ) ) ( not ( = ?auto_557171 ?auto_557178 ) ) ( not ( = ?auto_557171 ?auto_557179 ) ) ( not ( = ?auto_557171 ?auto_557180 ) ) ( not ( = ?auto_557171 ?auto_557181 ) ) ( not ( = ?auto_557171 ?auto_557182 ) ) ( not ( = ?auto_557171 ?auto_557183 ) ) ( not ( = ?auto_557171 ?auto_557184 ) ) ( not ( = ?auto_557171 ?auto_557185 ) ) ( not ( = ?auto_557171 ?auto_557186 ) ) ( not ( = ?auto_557172 ?auto_557173 ) ) ( not ( = ?auto_557172 ?auto_557174 ) ) ( not ( = ?auto_557172 ?auto_557175 ) ) ( not ( = ?auto_557172 ?auto_557176 ) ) ( not ( = ?auto_557172 ?auto_557177 ) ) ( not ( = ?auto_557172 ?auto_557178 ) ) ( not ( = ?auto_557172 ?auto_557179 ) ) ( not ( = ?auto_557172 ?auto_557180 ) ) ( not ( = ?auto_557172 ?auto_557181 ) ) ( not ( = ?auto_557172 ?auto_557182 ) ) ( not ( = ?auto_557172 ?auto_557183 ) ) ( not ( = ?auto_557172 ?auto_557184 ) ) ( not ( = ?auto_557172 ?auto_557185 ) ) ( not ( = ?auto_557172 ?auto_557186 ) ) ( not ( = ?auto_557173 ?auto_557174 ) ) ( not ( = ?auto_557173 ?auto_557175 ) ) ( not ( = ?auto_557173 ?auto_557176 ) ) ( not ( = ?auto_557173 ?auto_557177 ) ) ( not ( = ?auto_557173 ?auto_557178 ) ) ( not ( = ?auto_557173 ?auto_557179 ) ) ( not ( = ?auto_557173 ?auto_557180 ) ) ( not ( = ?auto_557173 ?auto_557181 ) ) ( not ( = ?auto_557173 ?auto_557182 ) ) ( not ( = ?auto_557173 ?auto_557183 ) ) ( not ( = ?auto_557173 ?auto_557184 ) ) ( not ( = ?auto_557173 ?auto_557185 ) ) ( not ( = ?auto_557173 ?auto_557186 ) ) ( not ( = ?auto_557174 ?auto_557175 ) ) ( not ( = ?auto_557174 ?auto_557176 ) ) ( not ( = ?auto_557174 ?auto_557177 ) ) ( not ( = ?auto_557174 ?auto_557178 ) ) ( not ( = ?auto_557174 ?auto_557179 ) ) ( not ( = ?auto_557174 ?auto_557180 ) ) ( not ( = ?auto_557174 ?auto_557181 ) ) ( not ( = ?auto_557174 ?auto_557182 ) ) ( not ( = ?auto_557174 ?auto_557183 ) ) ( not ( = ?auto_557174 ?auto_557184 ) ) ( not ( = ?auto_557174 ?auto_557185 ) ) ( not ( = ?auto_557174 ?auto_557186 ) ) ( not ( = ?auto_557175 ?auto_557176 ) ) ( not ( = ?auto_557175 ?auto_557177 ) ) ( not ( = ?auto_557175 ?auto_557178 ) ) ( not ( = ?auto_557175 ?auto_557179 ) ) ( not ( = ?auto_557175 ?auto_557180 ) ) ( not ( = ?auto_557175 ?auto_557181 ) ) ( not ( = ?auto_557175 ?auto_557182 ) ) ( not ( = ?auto_557175 ?auto_557183 ) ) ( not ( = ?auto_557175 ?auto_557184 ) ) ( not ( = ?auto_557175 ?auto_557185 ) ) ( not ( = ?auto_557175 ?auto_557186 ) ) ( not ( = ?auto_557176 ?auto_557177 ) ) ( not ( = ?auto_557176 ?auto_557178 ) ) ( not ( = ?auto_557176 ?auto_557179 ) ) ( not ( = ?auto_557176 ?auto_557180 ) ) ( not ( = ?auto_557176 ?auto_557181 ) ) ( not ( = ?auto_557176 ?auto_557182 ) ) ( not ( = ?auto_557176 ?auto_557183 ) ) ( not ( = ?auto_557176 ?auto_557184 ) ) ( not ( = ?auto_557176 ?auto_557185 ) ) ( not ( = ?auto_557176 ?auto_557186 ) ) ( not ( = ?auto_557177 ?auto_557178 ) ) ( not ( = ?auto_557177 ?auto_557179 ) ) ( not ( = ?auto_557177 ?auto_557180 ) ) ( not ( = ?auto_557177 ?auto_557181 ) ) ( not ( = ?auto_557177 ?auto_557182 ) ) ( not ( = ?auto_557177 ?auto_557183 ) ) ( not ( = ?auto_557177 ?auto_557184 ) ) ( not ( = ?auto_557177 ?auto_557185 ) ) ( not ( = ?auto_557177 ?auto_557186 ) ) ( not ( = ?auto_557178 ?auto_557179 ) ) ( not ( = ?auto_557178 ?auto_557180 ) ) ( not ( = ?auto_557178 ?auto_557181 ) ) ( not ( = ?auto_557178 ?auto_557182 ) ) ( not ( = ?auto_557178 ?auto_557183 ) ) ( not ( = ?auto_557178 ?auto_557184 ) ) ( not ( = ?auto_557178 ?auto_557185 ) ) ( not ( = ?auto_557178 ?auto_557186 ) ) ( not ( = ?auto_557179 ?auto_557180 ) ) ( not ( = ?auto_557179 ?auto_557181 ) ) ( not ( = ?auto_557179 ?auto_557182 ) ) ( not ( = ?auto_557179 ?auto_557183 ) ) ( not ( = ?auto_557179 ?auto_557184 ) ) ( not ( = ?auto_557179 ?auto_557185 ) ) ( not ( = ?auto_557179 ?auto_557186 ) ) ( not ( = ?auto_557180 ?auto_557181 ) ) ( not ( = ?auto_557180 ?auto_557182 ) ) ( not ( = ?auto_557180 ?auto_557183 ) ) ( not ( = ?auto_557180 ?auto_557184 ) ) ( not ( = ?auto_557180 ?auto_557185 ) ) ( not ( = ?auto_557180 ?auto_557186 ) ) ( not ( = ?auto_557181 ?auto_557182 ) ) ( not ( = ?auto_557181 ?auto_557183 ) ) ( not ( = ?auto_557181 ?auto_557184 ) ) ( not ( = ?auto_557181 ?auto_557185 ) ) ( not ( = ?auto_557181 ?auto_557186 ) ) ( not ( = ?auto_557182 ?auto_557183 ) ) ( not ( = ?auto_557182 ?auto_557184 ) ) ( not ( = ?auto_557182 ?auto_557185 ) ) ( not ( = ?auto_557182 ?auto_557186 ) ) ( not ( = ?auto_557183 ?auto_557184 ) ) ( not ( = ?auto_557183 ?auto_557185 ) ) ( not ( = ?auto_557183 ?auto_557186 ) ) ( not ( = ?auto_557184 ?auto_557185 ) ) ( not ( = ?auto_557184 ?auto_557186 ) ) ( not ( = ?auto_557185 ?auto_557186 ) ) ( ON ?auto_557184 ?auto_557185 ) ( CLEAR ?auto_557182 ) ( ON ?auto_557183 ?auto_557184 ) ( CLEAR ?auto_557183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_557171 ?auto_557172 ?auto_557173 ?auto_557174 ?auto_557175 ?auto_557176 ?auto_557177 ?auto_557178 ?auto_557179 ?auto_557180 ?auto_557181 ?auto_557182 ?auto_557183 )
      ( MAKE-15PILE ?auto_557171 ?auto_557172 ?auto_557173 ?auto_557174 ?auto_557175 ?auto_557176 ?auto_557177 ?auto_557178 ?auto_557179 ?auto_557180 ?auto_557181 ?auto_557182 ?auto_557183 ?auto_557184 ?auto_557185 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557233 - BLOCK
      ?auto_557234 - BLOCK
      ?auto_557235 - BLOCK
      ?auto_557236 - BLOCK
      ?auto_557237 - BLOCK
      ?auto_557238 - BLOCK
      ?auto_557239 - BLOCK
      ?auto_557240 - BLOCK
      ?auto_557241 - BLOCK
      ?auto_557242 - BLOCK
      ?auto_557243 - BLOCK
      ?auto_557244 - BLOCK
      ?auto_557245 - BLOCK
      ?auto_557246 - BLOCK
      ?auto_557247 - BLOCK
    )
    :vars
    (
      ?auto_557248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557247 ?auto_557248 ) ( ON-TABLE ?auto_557233 ) ( ON ?auto_557234 ?auto_557233 ) ( ON ?auto_557235 ?auto_557234 ) ( ON ?auto_557236 ?auto_557235 ) ( ON ?auto_557237 ?auto_557236 ) ( ON ?auto_557238 ?auto_557237 ) ( ON ?auto_557239 ?auto_557238 ) ( ON ?auto_557240 ?auto_557239 ) ( ON ?auto_557241 ?auto_557240 ) ( ON ?auto_557242 ?auto_557241 ) ( ON ?auto_557243 ?auto_557242 ) ( not ( = ?auto_557233 ?auto_557234 ) ) ( not ( = ?auto_557233 ?auto_557235 ) ) ( not ( = ?auto_557233 ?auto_557236 ) ) ( not ( = ?auto_557233 ?auto_557237 ) ) ( not ( = ?auto_557233 ?auto_557238 ) ) ( not ( = ?auto_557233 ?auto_557239 ) ) ( not ( = ?auto_557233 ?auto_557240 ) ) ( not ( = ?auto_557233 ?auto_557241 ) ) ( not ( = ?auto_557233 ?auto_557242 ) ) ( not ( = ?auto_557233 ?auto_557243 ) ) ( not ( = ?auto_557233 ?auto_557244 ) ) ( not ( = ?auto_557233 ?auto_557245 ) ) ( not ( = ?auto_557233 ?auto_557246 ) ) ( not ( = ?auto_557233 ?auto_557247 ) ) ( not ( = ?auto_557233 ?auto_557248 ) ) ( not ( = ?auto_557234 ?auto_557235 ) ) ( not ( = ?auto_557234 ?auto_557236 ) ) ( not ( = ?auto_557234 ?auto_557237 ) ) ( not ( = ?auto_557234 ?auto_557238 ) ) ( not ( = ?auto_557234 ?auto_557239 ) ) ( not ( = ?auto_557234 ?auto_557240 ) ) ( not ( = ?auto_557234 ?auto_557241 ) ) ( not ( = ?auto_557234 ?auto_557242 ) ) ( not ( = ?auto_557234 ?auto_557243 ) ) ( not ( = ?auto_557234 ?auto_557244 ) ) ( not ( = ?auto_557234 ?auto_557245 ) ) ( not ( = ?auto_557234 ?auto_557246 ) ) ( not ( = ?auto_557234 ?auto_557247 ) ) ( not ( = ?auto_557234 ?auto_557248 ) ) ( not ( = ?auto_557235 ?auto_557236 ) ) ( not ( = ?auto_557235 ?auto_557237 ) ) ( not ( = ?auto_557235 ?auto_557238 ) ) ( not ( = ?auto_557235 ?auto_557239 ) ) ( not ( = ?auto_557235 ?auto_557240 ) ) ( not ( = ?auto_557235 ?auto_557241 ) ) ( not ( = ?auto_557235 ?auto_557242 ) ) ( not ( = ?auto_557235 ?auto_557243 ) ) ( not ( = ?auto_557235 ?auto_557244 ) ) ( not ( = ?auto_557235 ?auto_557245 ) ) ( not ( = ?auto_557235 ?auto_557246 ) ) ( not ( = ?auto_557235 ?auto_557247 ) ) ( not ( = ?auto_557235 ?auto_557248 ) ) ( not ( = ?auto_557236 ?auto_557237 ) ) ( not ( = ?auto_557236 ?auto_557238 ) ) ( not ( = ?auto_557236 ?auto_557239 ) ) ( not ( = ?auto_557236 ?auto_557240 ) ) ( not ( = ?auto_557236 ?auto_557241 ) ) ( not ( = ?auto_557236 ?auto_557242 ) ) ( not ( = ?auto_557236 ?auto_557243 ) ) ( not ( = ?auto_557236 ?auto_557244 ) ) ( not ( = ?auto_557236 ?auto_557245 ) ) ( not ( = ?auto_557236 ?auto_557246 ) ) ( not ( = ?auto_557236 ?auto_557247 ) ) ( not ( = ?auto_557236 ?auto_557248 ) ) ( not ( = ?auto_557237 ?auto_557238 ) ) ( not ( = ?auto_557237 ?auto_557239 ) ) ( not ( = ?auto_557237 ?auto_557240 ) ) ( not ( = ?auto_557237 ?auto_557241 ) ) ( not ( = ?auto_557237 ?auto_557242 ) ) ( not ( = ?auto_557237 ?auto_557243 ) ) ( not ( = ?auto_557237 ?auto_557244 ) ) ( not ( = ?auto_557237 ?auto_557245 ) ) ( not ( = ?auto_557237 ?auto_557246 ) ) ( not ( = ?auto_557237 ?auto_557247 ) ) ( not ( = ?auto_557237 ?auto_557248 ) ) ( not ( = ?auto_557238 ?auto_557239 ) ) ( not ( = ?auto_557238 ?auto_557240 ) ) ( not ( = ?auto_557238 ?auto_557241 ) ) ( not ( = ?auto_557238 ?auto_557242 ) ) ( not ( = ?auto_557238 ?auto_557243 ) ) ( not ( = ?auto_557238 ?auto_557244 ) ) ( not ( = ?auto_557238 ?auto_557245 ) ) ( not ( = ?auto_557238 ?auto_557246 ) ) ( not ( = ?auto_557238 ?auto_557247 ) ) ( not ( = ?auto_557238 ?auto_557248 ) ) ( not ( = ?auto_557239 ?auto_557240 ) ) ( not ( = ?auto_557239 ?auto_557241 ) ) ( not ( = ?auto_557239 ?auto_557242 ) ) ( not ( = ?auto_557239 ?auto_557243 ) ) ( not ( = ?auto_557239 ?auto_557244 ) ) ( not ( = ?auto_557239 ?auto_557245 ) ) ( not ( = ?auto_557239 ?auto_557246 ) ) ( not ( = ?auto_557239 ?auto_557247 ) ) ( not ( = ?auto_557239 ?auto_557248 ) ) ( not ( = ?auto_557240 ?auto_557241 ) ) ( not ( = ?auto_557240 ?auto_557242 ) ) ( not ( = ?auto_557240 ?auto_557243 ) ) ( not ( = ?auto_557240 ?auto_557244 ) ) ( not ( = ?auto_557240 ?auto_557245 ) ) ( not ( = ?auto_557240 ?auto_557246 ) ) ( not ( = ?auto_557240 ?auto_557247 ) ) ( not ( = ?auto_557240 ?auto_557248 ) ) ( not ( = ?auto_557241 ?auto_557242 ) ) ( not ( = ?auto_557241 ?auto_557243 ) ) ( not ( = ?auto_557241 ?auto_557244 ) ) ( not ( = ?auto_557241 ?auto_557245 ) ) ( not ( = ?auto_557241 ?auto_557246 ) ) ( not ( = ?auto_557241 ?auto_557247 ) ) ( not ( = ?auto_557241 ?auto_557248 ) ) ( not ( = ?auto_557242 ?auto_557243 ) ) ( not ( = ?auto_557242 ?auto_557244 ) ) ( not ( = ?auto_557242 ?auto_557245 ) ) ( not ( = ?auto_557242 ?auto_557246 ) ) ( not ( = ?auto_557242 ?auto_557247 ) ) ( not ( = ?auto_557242 ?auto_557248 ) ) ( not ( = ?auto_557243 ?auto_557244 ) ) ( not ( = ?auto_557243 ?auto_557245 ) ) ( not ( = ?auto_557243 ?auto_557246 ) ) ( not ( = ?auto_557243 ?auto_557247 ) ) ( not ( = ?auto_557243 ?auto_557248 ) ) ( not ( = ?auto_557244 ?auto_557245 ) ) ( not ( = ?auto_557244 ?auto_557246 ) ) ( not ( = ?auto_557244 ?auto_557247 ) ) ( not ( = ?auto_557244 ?auto_557248 ) ) ( not ( = ?auto_557245 ?auto_557246 ) ) ( not ( = ?auto_557245 ?auto_557247 ) ) ( not ( = ?auto_557245 ?auto_557248 ) ) ( not ( = ?auto_557246 ?auto_557247 ) ) ( not ( = ?auto_557246 ?auto_557248 ) ) ( not ( = ?auto_557247 ?auto_557248 ) ) ( ON ?auto_557246 ?auto_557247 ) ( ON ?auto_557245 ?auto_557246 ) ( CLEAR ?auto_557243 ) ( ON ?auto_557244 ?auto_557245 ) ( CLEAR ?auto_557244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_557233 ?auto_557234 ?auto_557235 ?auto_557236 ?auto_557237 ?auto_557238 ?auto_557239 ?auto_557240 ?auto_557241 ?auto_557242 ?auto_557243 ?auto_557244 )
      ( MAKE-15PILE ?auto_557233 ?auto_557234 ?auto_557235 ?auto_557236 ?auto_557237 ?auto_557238 ?auto_557239 ?auto_557240 ?auto_557241 ?auto_557242 ?auto_557243 ?auto_557244 ?auto_557245 ?auto_557246 ?auto_557247 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557295 - BLOCK
      ?auto_557296 - BLOCK
      ?auto_557297 - BLOCK
      ?auto_557298 - BLOCK
      ?auto_557299 - BLOCK
      ?auto_557300 - BLOCK
      ?auto_557301 - BLOCK
      ?auto_557302 - BLOCK
      ?auto_557303 - BLOCK
      ?auto_557304 - BLOCK
      ?auto_557305 - BLOCK
      ?auto_557306 - BLOCK
      ?auto_557307 - BLOCK
      ?auto_557308 - BLOCK
      ?auto_557309 - BLOCK
    )
    :vars
    (
      ?auto_557310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557309 ?auto_557310 ) ( ON-TABLE ?auto_557295 ) ( ON ?auto_557296 ?auto_557295 ) ( ON ?auto_557297 ?auto_557296 ) ( ON ?auto_557298 ?auto_557297 ) ( ON ?auto_557299 ?auto_557298 ) ( ON ?auto_557300 ?auto_557299 ) ( ON ?auto_557301 ?auto_557300 ) ( ON ?auto_557302 ?auto_557301 ) ( ON ?auto_557303 ?auto_557302 ) ( ON ?auto_557304 ?auto_557303 ) ( not ( = ?auto_557295 ?auto_557296 ) ) ( not ( = ?auto_557295 ?auto_557297 ) ) ( not ( = ?auto_557295 ?auto_557298 ) ) ( not ( = ?auto_557295 ?auto_557299 ) ) ( not ( = ?auto_557295 ?auto_557300 ) ) ( not ( = ?auto_557295 ?auto_557301 ) ) ( not ( = ?auto_557295 ?auto_557302 ) ) ( not ( = ?auto_557295 ?auto_557303 ) ) ( not ( = ?auto_557295 ?auto_557304 ) ) ( not ( = ?auto_557295 ?auto_557305 ) ) ( not ( = ?auto_557295 ?auto_557306 ) ) ( not ( = ?auto_557295 ?auto_557307 ) ) ( not ( = ?auto_557295 ?auto_557308 ) ) ( not ( = ?auto_557295 ?auto_557309 ) ) ( not ( = ?auto_557295 ?auto_557310 ) ) ( not ( = ?auto_557296 ?auto_557297 ) ) ( not ( = ?auto_557296 ?auto_557298 ) ) ( not ( = ?auto_557296 ?auto_557299 ) ) ( not ( = ?auto_557296 ?auto_557300 ) ) ( not ( = ?auto_557296 ?auto_557301 ) ) ( not ( = ?auto_557296 ?auto_557302 ) ) ( not ( = ?auto_557296 ?auto_557303 ) ) ( not ( = ?auto_557296 ?auto_557304 ) ) ( not ( = ?auto_557296 ?auto_557305 ) ) ( not ( = ?auto_557296 ?auto_557306 ) ) ( not ( = ?auto_557296 ?auto_557307 ) ) ( not ( = ?auto_557296 ?auto_557308 ) ) ( not ( = ?auto_557296 ?auto_557309 ) ) ( not ( = ?auto_557296 ?auto_557310 ) ) ( not ( = ?auto_557297 ?auto_557298 ) ) ( not ( = ?auto_557297 ?auto_557299 ) ) ( not ( = ?auto_557297 ?auto_557300 ) ) ( not ( = ?auto_557297 ?auto_557301 ) ) ( not ( = ?auto_557297 ?auto_557302 ) ) ( not ( = ?auto_557297 ?auto_557303 ) ) ( not ( = ?auto_557297 ?auto_557304 ) ) ( not ( = ?auto_557297 ?auto_557305 ) ) ( not ( = ?auto_557297 ?auto_557306 ) ) ( not ( = ?auto_557297 ?auto_557307 ) ) ( not ( = ?auto_557297 ?auto_557308 ) ) ( not ( = ?auto_557297 ?auto_557309 ) ) ( not ( = ?auto_557297 ?auto_557310 ) ) ( not ( = ?auto_557298 ?auto_557299 ) ) ( not ( = ?auto_557298 ?auto_557300 ) ) ( not ( = ?auto_557298 ?auto_557301 ) ) ( not ( = ?auto_557298 ?auto_557302 ) ) ( not ( = ?auto_557298 ?auto_557303 ) ) ( not ( = ?auto_557298 ?auto_557304 ) ) ( not ( = ?auto_557298 ?auto_557305 ) ) ( not ( = ?auto_557298 ?auto_557306 ) ) ( not ( = ?auto_557298 ?auto_557307 ) ) ( not ( = ?auto_557298 ?auto_557308 ) ) ( not ( = ?auto_557298 ?auto_557309 ) ) ( not ( = ?auto_557298 ?auto_557310 ) ) ( not ( = ?auto_557299 ?auto_557300 ) ) ( not ( = ?auto_557299 ?auto_557301 ) ) ( not ( = ?auto_557299 ?auto_557302 ) ) ( not ( = ?auto_557299 ?auto_557303 ) ) ( not ( = ?auto_557299 ?auto_557304 ) ) ( not ( = ?auto_557299 ?auto_557305 ) ) ( not ( = ?auto_557299 ?auto_557306 ) ) ( not ( = ?auto_557299 ?auto_557307 ) ) ( not ( = ?auto_557299 ?auto_557308 ) ) ( not ( = ?auto_557299 ?auto_557309 ) ) ( not ( = ?auto_557299 ?auto_557310 ) ) ( not ( = ?auto_557300 ?auto_557301 ) ) ( not ( = ?auto_557300 ?auto_557302 ) ) ( not ( = ?auto_557300 ?auto_557303 ) ) ( not ( = ?auto_557300 ?auto_557304 ) ) ( not ( = ?auto_557300 ?auto_557305 ) ) ( not ( = ?auto_557300 ?auto_557306 ) ) ( not ( = ?auto_557300 ?auto_557307 ) ) ( not ( = ?auto_557300 ?auto_557308 ) ) ( not ( = ?auto_557300 ?auto_557309 ) ) ( not ( = ?auto_557300 ?auto_557310 ) ) ( not ( = ?auto_557301 ?auto_557302 ) ) ( not ( = ?auto_557301 ?auto_557303 ) ) ( not ( = ?auto_557301 ?auto_557304 ) ) ( not ( = ?auto_557301 ?auto_557305 ) ) ( not ( = ?auto_557301 ?auto_557306 ) ) ( not ( = ?auto_557301 ?auto_557307 ) ) ( not ( = ?auto_557301 ?auto_557308 ) ) ( not ( = ?auto_557301 ?auto_557309 ) ) ( not ( = ?auto_557301 ?auto_557310 ) ) ( not ( = ?auto_557302 ?auto_557303 ) ) ( not ( = ?auto_557302 ?auto_557304 ) ) ( not ( = ?auto_557302 ?auto_557305 ) ) ( not ( = ?auto_557302 ?auto_557306 ) ) ( not ( = ?auto_557302 ?auto_557307 ) ) ( not ( = ?auto_557302 ?auto_557308 ) ) ( not ( = ?auto_557302 ?auto_557309 ) ) ( not ( = ?auto_557302 ?auto_557310 ) ) ( not ( = ?auto_557303 ?auto_557304 ) ) ( not ( = ?auto_557303 ?auto_557305 ) ) ( not ( = ?auto_557303 ?auto_557306 ) ) ( not ( = ?auto_557303 ?auto_557307 ) ) ( not ( = ?auto_557303 ?auto_557308 ) ) ( not ( = ?auto_557303 ?auto_557309 ) ) ( not ( = ?auto_557303 ?auto_557310 ) ) ( not ( = ?auto_557304 ?auto_557305 ) ) ( not ( = ?auto_557304 ?auto_557306 ) ) ( not ( = ?auto_557304 ?auto_557307 ) ) ( not ( = ?auto_557304 ?auto_557308 ) ) ( not ( = ?auto_557304 ?auto_557309 ) ) ( not ( = ?auto_557304 ?auto_557310 ) ) ( not ( = ?auto_557305 ?auto_557306 ) ) ( not ( = ?auto_557305 ?auto_557307 ) ) ( not ( = ?auto_557305 ?auto_557308 ) ) ( not ( = ?auto_557305 ?auto_557309 ) ) ( not ( = ?auto_557305 ?auto_557310 ) ) ( not ( = ?auto_557306 ?auto_557307 ) ) ( not ( = ?auto_557306 ?auto_557308 ) ) ( not ( = ?auto_557306 ?auto_557309 ) ) ( not ( = ?auto_557306 ?auto_557310 ) ) ( not ( = ?auto_557307 ?auto_557308 ) ) ( not ( = ?auto_557307 ?auto_557309 ) ) ( not ( = ?auto_557307 ?auto_557310 ) ) ( not ( = ?auto_557308 ?auto_557309 ) ) ( not ( = ?auto_557308 ?auto_557310 ) ) ( not ( = ?auto_557309 ?auto_557310 ) ) ( ON ?auto_557308 ?auto_557309 ) ( ON ?auto_557307 ?auto_557308 ) ( ON ?auto_557306 ?auto_557307 ) ( CLEAR ?auto_557304 ) ( ON ?auto_557305 ?auto_557306 ) ( CLEAR ?auto_557305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_557295 ?auto_557296 ?auto_557297 ?auto_557298 ?auto_557299 ?auto_557300 ?auto_557301 ?auto_557302 ?auto_557303 ?auto_557304 ?auto_557305 )
      ( MAKE-15PILE ?auto_557295 ?auto_557296 ?auto_557297 ?auto_557298 ?auto_557299 ?auto_557300 ?auto_557301 ?auto_557302 ?auto_557303 ?auto_557304 ?auto_557305 ?auto_557306 ?auto_557307 ?auto_557308 ?auto_557309 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557357 - BLOCK
      ?auto_557358 - BLOCK
      ?auto_557359 - BLOCK
      ?auto_557360 - BLOCK
      ?auto_557361 - BLOCK
      ?auto_557362 - BLOCK
      ?auto_557363 - BLOCK
      ?auto_557364 - BLOCK
      ?auto_557365 - BLOCK
      ?auto_557366 - BLOCK
      ?auto_557367 - BLOCK
      ?auto_557368 - BLOCK
      ?auto_557369 - BLOCK
      ?auto_557370 - BLOCK
      ?auto_557371 - BLOCK
    )
    :vars
    (
      ?auto_557372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557371 ?auto_557372 ) ( ON-TABLE ?auto_557357 ) ( ON ?auto_557358 ?auto_557357 ) ( ON ?auto_557359 ?auto_557358 ) ( ON ?auto_557360 ?auto_557359 ) ( ON ?auto_557361 ?auto_557360 ) ( ON ?auto_557362 ?auto_557361 ) ( ON ?auto_557363 ?auto_557362 ) ( ON ?auto_557364 ?auto_557363 ) ( ON ?auto_557365 ?auto_557364 ) ( not ( = ?auto_557357 ?auto_557358 ) ) ( not ( = ?auto_557357 ?auto_557359 ) ) ( not ( = ?auto_557357 ?auto_557360 ) ) ( not ( = ?auto_557357 ?auto_557361 ) ) ( not ( = ?auto_557357 ?auto_557362 ) ) ( not ( = ?auto_557357 ?auto_557363 ) ) ( not ( = ?auto_557357 ?auto_557364 ) ) ( not ( = ?auto_557357 ?auto_557365 ) ) ( not ( = ?auto_557357 ?auto_557366 ) ) ( not ( = ?auto_557357 ?auto_557367 ) ) ( not ( = ?auto_557357 ?auto_557368 ) ) ( not ( = ?auto_557357 ?auto_557369 ) ) ( not ( = ?auto_557357 ?auto_557370 ) ) ( not ( = ?auto_557357 ?auto_557371 ) ) ( not ( = ?auto_557357 ?auto_557372 ) ) ( not ( = ?auto_557358 ?auto_557359 ) ) ( not ( = ?auto_557358 ?auto_557360 ) ) ( not ( = ?auto_557358 ?auto_557361 ) ) ( not ( = ?auto_557358 ?auto_557362 ) ) ( not ( = ?auto_557358 ?auto_557363 ) ) ( not ( = ?auto_557358 ?auto_557364 ) ) ( not ( = ?auto_557358 ?auto_557365 ) ) ( not ( = ?auto_557358 ?auto_557366 ) ) ( not ( = ?auto_557358 ?auto_557367 ) ) ( not ( = ?auto_557358 ?auto_557368 ) ) ( not ( = ?auto_557358 ?auto_557369 ) ) ( not ( = ?auto_557358 ?auto_557370 ) ) ( not ( = ?auto_557358 ?auto_557371 ) ) ( not ( = ?auto_557358 ?auto_557372 ) ) ( not ( = ?auto_557359 ?auto_557360 ) ) ( not ( = ?auto_557359 ?auto_557361 ) ) ( not ( = ?auto_557359 ?auto_557362 ) ) ( not ( = ?auto_557359 ?auto_557363 ) ) ( not ( = ?auto_557359 ?auto_557364 ) ) ( not ( = ?auto_557359 ?auto_557365 ) ) ( not ( = ?auto_557359 ?auto_557366 ) ) ( not ( = ?auto_557359 ?auto_557367 ) ) ( not ( = ?auto_557359 ?auto_557368 ) ) ( not ( = ?auto_557359 ?auto_557369 ) ) ( not ( = ?auto_557359 ?auto_557370 ) ) ( not ( = ?auto_557359 ?auto_557371 ) ) ( not ( = ?auto_557359 ?auto_557372 ) ) ( not ( = ?auto_557360 ?auto_557361 ) ) ( not ( = ?auto_557360 ?auto_557362 ) ) ( not ( = ?auto_557360 ?auto_557363 ) ) ( not ( = ?auto_557360 ?auto_557364 ) ) ( not ( = ?auto_557360 ?auto_557365 ) ) ( not ( = ?auto_557360 ?auto_557366 ) ) ( not ( = ?auto_557360 ?auto_557367 ) ) ( not ( = ?auto_557360 ?auto_557368 ) ) ( not ( = ?auto_557360 ?auto_557369 ) ) ( not ( = ?auto_557360 ?auto_557370 ) ) ( not ( = ?auto_557360 ?auto_557371 ) ) ( not ( = ?auto_557360 ?auto_557372 ) ) ( not ( = ?auto_557361 ?auto_557362 ) ) ( not ( = ?auto_557361 ?auto_557363 ) ) ( not ( = ?auto_557361 ?auto_557364 ) ) ( not ( = ?auto_557361 ?auto_557365 ) ) ( not ( = ?auto_557361 ?auto_557366 ) ) ( not ( = ?auto_557361 ?auto_557367 ) ) ( not ( = ?auto_557361 ?auto_557368 ) ) ( not ( = ?auto_557361 ?auto_557369 ) ) ( not ( = ?auto_557361 ?auto_557370 ) ) ( not ( = ?auto_557361 ?auto_557371 ) ) ( not ( = ?auto_557361 ?auto_557372 ) ) ( not ( = ?auto_557362 ?auto_557363 ) ) ( not ( = ?auto_557362 ?auto_557364 ) ) ( not ( = ?auto_557362 ?auto_557365 ) ) ( not ( = ?auto_557362 ?auto_557366 ) ) ( not ( = ?auto_557362 ?auto_557367 ) ) ( not ( = ?auto_557362 ?auto_557368 ) ) ( not ( = ?auto_557362 ?auto_557369 ) ) ( not ( = ?auto_557362 ?auto_557370 ) ) ( not ( = ?auto_557362 ?auto_557371 ) ) ( not ( = ?auto_557362 ?auto_557372 ) ) ( not ( = ?auto_557363 ?auto_557364 ) ) ( not ( = ?auto_557363 ?auto_557365 ) ) ( not ( = ?auto_557363 ?auto_557366 ) ) ( not ( = ?auto_557363 ?auto_557367 ) ) ( not ( = ?auto_557363 ?auto_557368 ) ) ( not ( = ?auto_557363 ?auto_557369 ) ) ( not ( = ?auto_557363 ?auto_557370 ) ) ( not ( = ?auto_557363 ?auto_557371 ) ) ( not ( = ?auto_557363 ?auto_557372 ) ) ( not ( = ?auto_557364 ?auto_557365 ) ) ( not ( = ?auto_557364 ?auto_557366 ) ) ( not ( = ?auto_557364 ?auto_557367 ) ) ( not ( = ?auto_557364 ?auto_557368 ) ) ( not ( = ?auto_557364 ?auto_557369 ) ) ( not ( = ?auto_557364 ?auto_557370 ) ) ( not ( = ?auto_557364 ?auto_557371 ) ) ( not ( = ?auto_557364 ?auto_557372 ) ) ( not ( = ?auto_557365 ?auto_557366 ) ) ( not ( = ?auto_557365 ?auto_557367 ) ) ( not ( = ?auto_557365 ?auto_557368 ) ) ( not ( = ?auto_557365 ?auto_557369 ) ) ( not ( = ?auto_557365 ?auto_557370 ) ) ( not ( = ?auto_557365 ?auto_557371 ) ) ( not ( = ?auto_557365 ?auto_557372 ) ) ( not ( = ?auto_557366 ?auto_557367 ) ) ( not ( = ?auto_557366 ?auto_557368 ) ) ( not ( = ?auto_557366 ?auto_557369 ) ) ( not ( = ?auto_557366 ?auto_557370 ) ) ( not ( = ?auto_557366 ?auto_557371 ) ) ( not ( = ?auto_557366 ?auto_557372 ) ) ( not ( = ?auto_557367 ?auto_557368 ) ) ( not ( = ?auto_557367 ?auto_557369 ) ) ( not ( = ?auto_557367 ?auto_557370 ) ) ( not ( = ?auto_557367 ?auto_557371 ) ) ( not ( = ?auto_557367 ?auto_557372 ) ) ( not ( = ?auto_557368 ?auto_557369 ) ) ( not ( = ?auto_557368 ?auto_557370 ) ) ( not ( = ?auto_557368 ?auto_557371 ) ) ( not ( = ?auto_557368 ?auto_557372 ) ) ( not ( = ?auto_557369 ?auto_557370 ) ) ( not ( = ?auto_557369 ?auto_557371 ) ) ( not ( = ?auto_557369 ?auto_557372 ) ) ( not ( = ?auto_557370 ?auto_557371 ) ) ( not ( = ?auto_557370 ?auto_557372 ) ) ( not ( = ?auto_557371 ?auto_557372 ) ) ( ON ?auto_557370 ?auto_557371 ) ( ON ?auto_557369 ?auto_557370 ) ( ON ?auto_557368 ?auto_557369 ) ( ON ?auto_557367 ?auto_557368 ) ( CLEAR ?auto_557365 ) ( ON ?auto_557366 ?auto_557367 ) ( CLEAR ?auto_557366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_557357 ?auto_557358 ?auto_557359 ?auto_557360 ?auto_557361 ?auto_557362 ?auto_557363 ?auto_557364 ?auto_557365 ?auto_557366 )
      ( MAKE-15PILE ?auto_557357 ?auto_557358 ?auto_557359 ?auto_557360 ?auto_557361 ?auto_557362 ?auto_557363 ?auto_557364 ?auto_557365 ?auto_557366 ?auto_557367 ?auto_557368 ?auto_557369 ?auto_557370 ?auto_557371 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557419 - BLOCK
      ?auto_557420 - BLOCK
      ?auto_557421 - BLOCK
      ?auto_557422 - BLOCK
      ?auto_557423 - BLOCK
      ?auto_557424 - BLOCK
      ?auto_557425 - BLOCK
      ?auto_557426 - BLOCK
      ?auto_557427 - BLOCK
      ?auto_557428 - BLOCK
      ?auto_557429 - BLOCK
      ?auto_557430 - BLOCK
      ?auto_557431 - BLOCK
      ?auto_557432 - BLOCK
      ?auto_557433 - BLOCK
    )
    :vars
    (
      ?auto_557434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557433 ?auto_557434 ) ( ON-TABLE ?auto_557419 ) ( ON ?auto_557420 ?auto_557419 ) ( ON ?auto_557421 ?auto_557420 ) ( ON ?auto_557422 ?auto_557421 ) ( ON ?auto_557423 ?auto_557422 ) ( ON ?auto_557424 ?auto_557423 ) ( ON ?auto_557425 ?auto_557424 ) ( ON ?auto_557426 ?auto_557425 ) ( not ( = ?auto_557419 ?auto_557420 ) ) ( not ( = ?auto_557419 ?auto_557421 ) ) ( not ( = ?auto_557419 ?auto_557422 ) ) ( not ( = ?auto_557419 ?auto_557423 ) ) ( not ( = ?auto_557419 ?auto_557424 ) ) ( not ( = ?auto_557419 ?auto_557425 ) ) ( not ( = ?auto_557419 ?auto_557426 ) ) ( not ( = ?auto_557419 ?auto_557427 ) ) ( not ( = ?auto_557419 ?auto_557428 ) ) ( not ( = ?auto_557419 ?auto_557429 ) ) ( not ( = ?auto_557419 ?auto_557430 ) ) ( not ( = ?auto_557419 ?auto_557431 ) ) ( not ( = ?auto_557419 ?auto_557432 ) ) ( not ( = ?auto_557419 ?auto_557433 ) ) ( not ( = ?auto_557419 ?auto_557434 ) ) ( not ( = ?auto_557420 ?auto_557421 ) ) ( not ( = ?auto_557420 ?auto_557422 ) ) ( not ( = ?auto_557420 ?auto_557423 ) ) ( not ( = ?auto_557420 ?auto_557424 ) ) ( not ( = ?auto_557420 ?auto_557425 ) ) ( not ( = ?auto_557420 ?auto_557426 ) ) ( not ( = ?auto_557420 ?auto_557427 ) ) ( not ( = ?auto_557420 ?auto_557428 ) ) ( not ( = ?auto_557420 ?auto_557429 ) ) ( not ( = ?auto_557420 ?auto_557430 ) ) ( not ( = ?auto_557420 ?auto_557431 ) ) ( not ( = ?auto_557420 ?auto_557432 ) ) ( not ( = ?auto_557420 ?auto_557433 ) ) ( not ( = ?auto_557420 ?auto_557434 ) ) ( not ( = ?auto_557421 ?auto_557422 ) ) ( not ( = ?auto_557421 ?auto_557423 ) ) ( not ( = ?auto_557421 ?auto_557424 ) ) ( not ( = ?auto_557421 ?auto_557425 ) ) ( not ( = ?auto_557421 ?auto_557426 ) ) ( not ( = ?auto_557421 ?auto_557427 ) ) ( not ( = ?auto_557421 ?auto_557428 ) ) ( not ( = ?auto_557421 ?auto_557429 ) ) ( not ( = ?auto_557421 ?auto_557430 ) ) ( not ( = ?auto_557421 ?auto_557431 ) ) ( not ( = ?auto_557421 ?auto_557432 ) ) ( not ( = ?auto_557421 ?auto_557433 ) ) ( not ( = ?auto_557421 ?auto_557434 ) ) ( not ( = ?auto_557422 ?auto_557423 ) ) ( not ( = ?auto_557422 ?auto_557424 ) ) ( not ( = ?auto_557422 ?auto_557425 ) ) ( not ( = ?auto_557422 ?auto_557426 ) ) ( not ( = ?auto_557422 ?auto_557427 ) ) ( not ( = ?auto_557422 ?auto_557428 ) ) ( not ( = ?auto_557422 ?auto_557429 ) ) ( not ( = ?auto_557422 ?auto_557430 ) ) ( not ( = ?auto_557422 ?auto_557431 ) ) ( not ( = ?auto_557422 ?auto_557432 ) ) ( not ( = ?auto_557422 ?auto_557433 ) ) ( not ( = ?auto_557422 ?auto_557434 ) ) ( not ( = ?auto_557423 ?auto_557424 ) ) ( not ( = ?auto_557423 ?auto_557425 ) ) ( not ( = ?auto_557423 ?auto_557426 ) ) ( not ( = ?auto_557423 ?auto_557427 ) ) ( not ( = ?auto_557423 ?auto_557428 ) ) ( not ( = ?auto_557423 ?auto_557429 ) ) ( not ( = ?auto_557423 ?auto_557430 ) ) ( not ( = ?auto_557423 ?auto_557431 ) ) ( not ( = ?auto_557423 ?auto_557432 ) ) ( not ( = ?auto_557423 ?auto_557433 ) ) ( not ( = ?auto_557423 ?auto_557434 ) ) ( not ( = ?auto_557424 ?auto_557425 ) ) ( not ( = ?auto_557424 ?auto_557426 ) ) ( not ( = ?auto_557424 ?auto_557427 ) ) ( not ( = ?auto_557424 ?auto_557428 ) ) ( not ( = ?auto_557424 ?auto_557429 ) ) ( not ( = ?auto_557424 ?auto_557430 ) ) ( not ( = ?auto_557424 ?auto_557431 ) ) ( not ( = ?auto_557424 ?auto_557432 ) ) ( not ( = ?auto_557424 ?auto_557433 ) ) ( not ( = ?auto_557424 ?auto_557434 ) ) ( not ( = ?auto_557425 ?auto_557426 ) ) ( not ( = ?auto_557425 ?auto_557427 ) ) ( not ( = ?auto_557425 ?auto_557428 ) ) ( not ( = ?auto_557425 ?auto_557429 ) ) ( not ( = ?auto_557425 ?auto_557430 ) ) ( not ( = ?auto_557425 ?auto_557431 ) ) ( not ( = ?auto_557425 ?auto_557432 ) ) ( not ( = ?auto_557425 ?auto_557433 ) ) ( not ( = ?auto_557425 ?auto_557434 ) ) ( not ( = ?auto_557426 ?auto_557427 ) ) ( not ( = ?auto_557426 ?auto_557428 ) ) ( not ( = ?auto_557426 ?auto_557429 ) ) ( not ( = ?auto_557426 ?auto_557430 ) ) ( not ( = ?auto_557426 ?auto_557431 ) ) ( not ( = ?auto_557426 ?auto_557432 ) ) ( not ( = ?auto_557426 ?auto_557433 ) ) ( not ( = ?auto_557426 ?auto_557434 ) ) ( not ( = ?auto_557427 ?auto_557428 ) ) ( not ( = ?auto_557427 ?auto_557429 ) ) ( not ( = ?auto_557427 ?auto_557430 ) ) ( not ( = ?auto_557427 ?auto_557431 ) ) ( not ( = ?auto_557427 ?auto_557432 ) ) ( not ( = ?auto_557427 ?auto_557433 ) ) ( not ( = ?auto_557427 ?auto_557434 ) ) ( not ( = ?auto_557428 ?auto_557429 ) ) ( not ( = ?auto_557428 ?auto_557430 ) ) ( not ( = ?auto_557428 ?auto_557431 ) ) ( not ( = ?auto_557428 ?auto_557432 ) ) ( not ( = ?auto_557428 ?auto_557433 ) ) ( not ( = ?auto_557428 ?auto_557434 ) ) ( not ( = ?auto_557429 ?auto_557430 ) ) ( not ( = ?auto_557429 ?auto_557431 ) ) ( not ( = ?auto_557429 ?auto_557432 ) ) ( not ( = ?auto_557429 ?auto_557433 ) ) ( not ( = ?auto_557429 ?auto_557434 ) ) ( not ( = ?auto_557430 ?auto_557431 ) ) ( not ( = ?auto_557430 ?auto_557432 ) ) ( not ( = ?auto_557430 ?auto_557433 ) ) ( not ( = ?auto_557430 ?auto_557434 ) ) ( not ( = ?auto_557431 ?auto_557432 ) ) ( not ( = ?auto_557431 ?auto_557433 ) ) ( not ( = ?auto_557431 ?auto_557434 ) ) ( not ( = ?auto_557432 ?auto_557433 ) ) ( not ( = ?auto_557432 ?auto_557434 ) ) ( not ( = ?auto_557433 ?auto_557434 ) ) ( ON ?auto_557432 ?auto_557433 ) ( ON ?auto_557431 ?auto_557432 ) ( ON ?auto_557430 ?auto_557431 ) ( ON ?auto_557429 ?auto_557430 ) ( ON ?auto_557428 ?auto_557429 ) ( CLEAR ?auto_557426 ) ( ON ?auto_557427 ?auto_557428 ) ( CLEAR ?auto_557427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_557419 ?auto_557420 ?auto_557421 ?auto_557422 ?auto_557423 ?auto_557424 ?auto_557425 ?auto_557426 ?auto_557427 )
      ( MAKE-15PILE ?auto_557419 ?auto_557420 ?auto_557421 ?auto_557422 ?auto_557423 ?auto_557424 ?auto_557425 ?auto_557426 ?auto_557427 ?auto_557428 ?auto_557429 ?auto_557430 ?auto_557431 ?auto_557432 ?auto_557433 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557481 - BLOCK
      ?auto_557482 - BLOCK
      ?auto_557483 - BLOCK
      ?auto_557484 - BLOCK
      ?auto_557485 - BLOCK
      ?auto_557486 - BLOCK
      ?auto_557487 - BLOCK
      ?auto_557488 - BLOCK
      ?auto_557489 - BLOCK
      ?auto_557490 - BLOCK
      ?auto_557491 - BLOCK
      ?auto_557492 - BLOCK
      ?auto_557493 - BLOCK
      ?auto_557494 - BLOCK
      ?auto_557495 - BLOCK
    )
    :vars
    (
      ?auto_557496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557495 ?auto_557496 ) ( ON-TABLE ?auto_557481 ) ( ON ?auto_557482 ?auto_557481 ) ( ON ?auto_557483 ?auto_557482 ) ( ON ?auto_557484 ?auto_557483 ) ( ON ?auto_557485 ?auto_557484 ) ( ON ?auto_557486 ?auto_557485 ) ( ON ?auto_557487 ?auto_557486 ) ( not ( = ?auto_557481 ?auto_557482 ) ) ( not ( = ?auto_557481 ?auto_557483 ) ) ( not ( = ?auto_557481 ?auto_557484 ) ) ( not ( = ?auto_557481 ?auto_557485 ) ) ( not ( = ?auto_557481 ?auto_557486 ) ) ( not ( = ?auto_557481 ?auto_557487 ) ) ( not ( = ?auto_557481 ?auto_557488 ) ) ( not ( = ?auto_557481 ?auto_557489 ) ) ( not ( = ?auto_557481 ?auto_557490 ) ) ( not ( = ?auto_557481 ?auto_557491 ) ) ( not ( = ?auto_557481 ?auto_557492 ) ) ( not ( = ?auto_557481 ?auto_557493 ) ) ( not ( = ?auto_557481 ?auto_557494 ) ) ( not ( = ?auto_557481 ?auto_557495 ) ) ( not ( = ?auto_557481 ?auto_557496 ) ) ( not ( = ?auto_557482 ?auto_557483 ) ) ( not ( = ?auto_557482 ?auto_557484 ) ) ( not ( = ?auto_557482 ?auto_557485 ) ) ( not ( = ?auto_557482 ?auto_557486 ) ) ( not ( = ?auto_557482 ?auto_557487 ) ) ( not ( = ?auto_557482 ?auto_557488 ) ) ( not ( = ?auto_557482 ?auto_557489 ) ) ( not ( = ?auto_557482 ?auto_557490 ) ) ( not ( = ?auto_557482 ?auto_557491 ) ) ( not ( = ?auto_557482 ?auto_557492 ) ) ( not ( = ?auto_557482 ?auto_557493 ) ) ( not ( = ?auto_557482 ?auto_557494 ) ) ( not ( = ?auto_557482 ?auto_557495 ) ) ( not ( = ?auto_557482 ?auto_557496 ) ) ( not ( = ?auto_557483 ?auto_557484 ) ) ( not ( = ?auto_557483 ?auto_557485 ) ) ( not ( = ?auto_557483 ?auto_557486 ) ) ( not ( = ?auto_557483 ?auto_557487 ) ) ( not ( = ?auto_557483 ?auto_557488 ) ) ( not ( = ?auto_557483 ?auto_557489 ) ) ( not ( = ?auto_557483 ?auto_557490 ) ) ( not ( = ?auto_557483 ?auto_557491 ) ) ( not ( = ?auto_557483 ?auto_557492 ) ) ( not ( = ?auto_557483 ?auto_557493 ) ) ( not ( = ?auto_557483 ?auto_557494 ) ) ( not ( = ?auto_557483 ?auto_557495 ) ) ( not ( = ?auto_557483 ?auto_557496 ) ) ( not ( = ?auto_557484 ?auto_557485 ) ) ( not ( = ?auto_557484 ?auto_557486 ) ) ( not ( = ?auto_557484 ?auto_557487 ) ) ( not ( = ?auto_557484 ?auto_557488 ) ) ( not ( = ?auto_557484 ?auto_557489 ) ) ( not ( = ?auto_557484 ?auto_557490 ) ) ( not ( = ?auto_557484 ?auto_557491 ) ) ( not ( = ?auto_557484 ?auto_557492 ) ) ( not ( = ?auto_557484 ?auto_557493 ) ) ( not ( = ?auto_557484 ?auto_557494 ) ) ( not ( = ?auto_557484 ?auto_557495 ) ) ( not ( = ?auto_557484 ?auto_557496 ) ) ( not ( = ?auto_557485 ?auto_557486 ) ) ( not ( = ?auto_557485 ?auto_557487 ) ) ( not ( = ?auto_557485 ?auto_557488 ) ) ( not ( = ?auto_557485 ?auto_557489 ) ) ( not ( = ?auto_557485 ?auto_557490 ) ) ( not ( = ?auto_557485 ?auto_557491 ) ) ( not ( = ?auto_557485 ?auto_557492 ) ) ( not ( = ?auto_557485 ?auto_557493 ) ) ( not ( = ?auto_557485 ?auto_557494 ) ) ( not ( = ?auto_557485 ?auto_557495 ) ) ( not ( = ?auto_557485 ?auto_557496 ) ) ( not ( = ?auto_557486 ?auto_557487 ) ) ( not ( = ?auto_557486 ?auto_557488 ) ) ( not ( = ?auto_557486 ?auto_557489 ) ) ( not ( = ?auto_557486 ?auto_557490 ) ) ( not ( = ?auto_557486 ?auto_557491 ) ) ( not ( = ?auto_557486 ?auto_557492 ) ) ( not ( = ?auto_557486 ?auto_557493 ) ) ( not ( = ?auto_557486 ?auto_557494 ) ) ( not ( = ?auto_557486 ?auto_557495 ) ) ( not ( = ?auto_557486 ?auto_557496 ) ) ( not ( = ?auto_557487 ?auto_557488 ) ) ( not ( = ?auto_557487 ?auto_557489 ) ) ( not ( = ?auto_557487 ?auto_557490 ) ) ( not ( = ?auto_557487 ?auto_557491 ) ) ( not ( = ?auto_557487 ?auto_557492 ) ) ( not ( = ?auto_557487 ?auto_557493 ) ) ( not ( = ?auto_557487 ?auto_557494 ) ) ( not ( = ?auto_557487 ?auto_557495 ) ) ( not ( = ?auto_557487 ?auto_557496 ) ) ( not ( = ?auto_557488 ?auto_557489 ) ) ( not ( = ?auto_557488 ?auto_557490 ) ) ( not ( = ?auto_557488 ?auto_557491 ) ) ( not ( = ?auto_557488 ?auto_557492 ) ) ( not ( = ?auto_557488 ?auto_557493 ) ) ( not ( = ?auto_557488 ?auto_557494 ) ) ( not ( = ?auto_557488 ?auto_557495 ) ) ( not ( = ?auto_557488 ?auto_557496 ) ) ( not ( = ?auto_557489 ?auto_557490 ) ) ( not ( = ?auto_557489 ?auto_557491 ) ) ( not ( = ?auto_557489 ?auto_557492 ) ) ( not ( = ?auto_557489 ?auto_557493 ) ) ( not ( = ?auto_557489 ?auto_557494 ) ) ( not ( = ?auto_557489 ?auto_557495 ) ) ( not ( = ?auto_557489 ?auto_557496 ) ) ( not ( = ?auto_557490 ?auto_557491 ) ) ( not ( = ?auto_557490 ?auto_557492 ) ) ( not ( = ?auto_557490 ?auto_557493 ) ) ( not ( = ?auto_557490 ?auto_557494 ) ) ( not ( = ?auto_557490 ?auto_557495 ) ) ( not ( = ?auto_557490 ?auto_557496 ) ) ( not ( = ?auto_557491 ?auto_557492 ) ) ( not ( = ?auto_557491 ?auto_557493 ) ) ( not ( = ?auto_557491 ?auto_557494 ) ) ( not ( = ?auto_557491 ?auto_557495 ) ) ( not ( = ?auto_557491 ?auto_557496 ) ) ( not ( = ?auto_557492 ?auto_557493 ) ) ( not ( = ?auto_557492 ?auto_557494 ) ) ( not ( = ?auto_557492 ?auto_557495 ) ) ( not ( = ?auto_557492 ?auto_557496 ) ) ( not ( = ?auto_557493 ?auto_557494 ) ) ( not ( = ?auto_557493 ?auto_557495 ) ) ( not ( = ?auto_557493 ?auto_557496 ) ) ( not ( = ?auto_557494 ?auto_557495 ) ) ( not ( = ?auto_557494 ?auto_557496 ) ) ( not ( = ?auto_557495 ?auto_557496 ) ) ( ON ?auto_557494 ?auto_557495 ) ( ON ?auto_557493 ?auto_557494 ) ( ON ?auto_557492 ?auto_557493 ) ( ON ?auto_557491 ?auto_557492 ) ( ON ?auto_557490 ?auto_557491 ) ( ON ?auto_557489 ?auto_557490 ) ( CLEAR ?auto_557487 ) ( ON ?auto_557488 ?auto_557489 ) ( CLEAR ?auto_557488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_557481 ?auto_557482 ?auto_557483 ?auto_557484 ?auto_557485 ?auto_557486 ?auto_557487 ?auto_557488 )
      ( MAKE-15PILE ?auto_557481 ?auto_557482 ?auto_557483 ?auto_557484 ?auto_557485 ?auto_557486 ?auto_557487 ?auto_557488 ?auto_557489 ?auto_557490 ?auto_557491 ?auto_557492 ?auto_557493 ?auto_557494 ?auto_557495 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557543 - BLOCK
      ?auto_557544 - BLOCK
      ?auto_557545 - BLOCK
      ?auto_557546 - BLOCK
      ?auto_557547 - BLOCK
      ?auto_557548 - BLOCK
      ?auto_557549 - BLOCK
      ?auto_557550 - BLOCK
      ?auto_557551 - BLOCK
      ?auto_557552 - BLOCK
      ?auto_557553 - BLOCK
      ?auto_557554 - BLOCK
      ?auto_557555 - BLOCK
      ?auto_557556 - BLOCK
      ?auto_557557 - BLOCK
    )
    :vars
    (
      ?auto_557558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557557 ?auto_557558 ) ( ON-TABLE ?auto_557543 ) ( ON ?auto_557544 ?auto_557543 ) ( ON ?auto_557545 ?auto_557544 ) ( ON ?auto_557546 ?auto_557545 ) ( ON ?auto_557547 ?auto_557546 ) ( ON ?auto_557548 ?auto_557547 ) ( not ( = ?auto_557543 ?auto_557544 ) ) ( not ( = ?auto_557543 ?auto_557545 ) ) ( not ( = ?auto_557543 ?auto_557546 ) ) ( not ( = ?auto_557543 ?auto_557547 ) ) ( not ( = ?auto_557543 ?auto_557548 ) ) ( not ( = ?auto_557543 ?auto_557549 ) ) ( not ( = ?auto_557543 ?auto_557550 ) ) ( not ( = ?auto_557543 ?auto_557551 ) ) ( not ( = ?auto_557543 ?auto_557552 ) ) ( not ( = ?auto_557543 ?auto_557553 ) ) ( not ( = ?auto_557543 ?auto_557554 ) ) ( not ( = ?auto_557543 ?auto_557555 ) ) ( not ( = ?auto_557543 ?auto_557556 ) ) ( not ( = ?auto_557543 ?auto_557557 ) ) ( not ( = ?auto_557543 ?auto_557558 ) ) ( not ( = ?auto_557544 ?auto_557545 ) ) ( not ( = ?auto_557544 ?auto_557546 ) ) ( not ( = ?auto_557544 ?auto_557547 ) ) ( not ( = ?auto_557544 ?auto_557548 ) ) ( not ( = ?auto_557544 ?auto_557549 ) ) ( not ( = ?auto_557544 ?auto_557550 ) ) ( not ( = ?auto_557544 ?auto_557551 ) ) ( not ( = ?auto_557544 ?auto_557552 ) ) ( not ( = ?auto_557544 ?auto_557553 ) ) ( not ( = ?auto_557544 ?auto_557554 ) ) ( not ( = ?auto_557544 ?auto_557555 ) ) ( not ( = ?auto_557544 ?auto_557556 ) ) ( not ( = ?auto_557544 ?auto_557557 ) ) ( not ( = ?auto_557544 ?auto_557558 ) ) ( not ( = ?auto_557545 ?auto_557546 ) ) ( not ( = ?auto_557545 ?auto_557547 ) ) ( not ( = ?auto_557545 ?auto_557548 ) ) ( not ( = ?auto_557545 ?auto_557549 ) ) ( not ( = ?auto_557545 ?auto_557550 ) ) ( not ( = ?auto_557545 ?auto_557551 ) ) ( not ( = ?auto_557545 ?auto_557552 ) ) ( not ( = ?auto_557545 ?auto_557553 ) ) ( not ( = ?auto_557545 ?auto_557554 ) ) ( not ( = ?auto_557545 ?auto_557555 ) ) ( not ( = ?auto_557545 ?auto_557556 ) ) ( not ( = ?auto_557545 ?auto_557557 ) ) ( not ( = ?auto_557545 ?auto_557558 ) ) ( not ( = ?auto_557546 ?auto_557547 ) ) ( not ( = ?auto_557546 ?auto_557548 ) ) ( not ( = ?auto_557546 ?auto_557549 ) ) ( not ( = ?auto_557546 ?auto_557550 ) ) ( not ( = ?auto_557546 ?auto_557551 ) ) ( not ( = ?auto_557546 ?auto_557552 ) ) ( not ( = ?auto_557546 ?auto_557553 ) ) ( not ( = ?auto_557546 ?auto_557554 ) ) ( not ( = ?auto_557546 ?auto_557555 ) ) ( not ( = ?auto_557546 ?auto_557556 ) ) ( not ( = ?auto_557546 ?auto_557557 ) ) ( not ( = ?auto_557546 ?auto_557558 ) ) ( not ( = ?auto_557547 ?auto_557548 ) ) ( not ( = ?auto_557547 ?auto_557549 ) ) ( not ( = ?auto_557547 ?auto_557550 ) ) ( not ( = ?auto_557547 ?auto_557551 ) ) ( not ( = ?auto_557547 ?auto_557552 ) ) ( not ( = ?auto_557547 ?auto_557553 ) ) ( not ( = ?auto_557547 ?auto_557554 ) ) ( not ( = ?auto_557547 ?auto_557555 ) ) ( not ( = ?auto_557547 ?auto_557556 ) ) ( not ( = ?auto_557547 ?auto_557557 ) ) ( not ( = ?auto_557547 ?auto_557558 ) ) ( not ( = ?auto_557548 ?auto_557549 ) ) ( not ( = ?auto_557548 ?auto_557550 ) ) ( not ( = ?auto_557548 ?auto_557551 ) ) ( not ( = ?auto_557548 ?auto_557552 ) ) ( not ( = ?auto_557548 ?auto_557553 ) ) ( not ( = ?auto_557548 ?auto_557554 ) ) ( not ( = ?auto_557548 ?auto_557555 ) ) ( not ( = ?auto_557548 ?auto_557556 ) ) ( not ( = ?auto_557548 ?auto_557557 ) ) ( not ( = ?auto_557548 ?auto_557558 ) ) ( not ( = ?auto_557549 ?auto_557550 ) ) ( not ( = ?auto_557549 ?auto_557551 ) ) ( not ( = ?auto_557549 ?auto_557552 ) ) ( not ( = ?auto_557549 ?auto_557553 ) ) ( not ( = ?auto_557549 ?auto_557554 ) ) ( not ( = ?auto_557549 ?auto_557555 ) ) ( not ( = ?auto_557549 ?auto_557556 ) ) ( not ( = ?auto_557549 ?auto_557557 ) ) ( not ( = ?auto_557549 ?auto_557558 ) ) ( not ( = ?auto_557550 ?auto_557551 ) ) ( not ( = ?auto_557550 ?auto_557552 ) ) ( not ( = ?auto_557550 ?auto_557553 ) ) ( not ( = ?auto_557550 ?auto_557554 ) ) ( not ( = ?auto_557550 ?auto_557555 ) ) ( not ( = ?auto_557550 ?auto_557556 ) ) ( not ( = ?auto_557550 ?auto_557557 ) ) ( not ( = ?auto_557550 ?auto_557558 ) ) ( not ( = ?auto_557551 ?auto_557552 ) ) ( not ( = ?auto_557551 ?auto_557553 ) ) ( not ( = ?auto_557551 ?auto_557554 ) ) ( not ( = ?auto_557551 ?auto_557555 ) ) ( not ( = ?auto_557551 ?auto_557556 ) ) ( not ( = ?auto_557551 ?auto_557557 ) ) ( not ( = ?auto_557551 ?auto_557558 ) ) ( not ( = ?auto_557552 ?auto_557553 ) ) ( not ( = ?auto_557552 ?auto_557554 ) ) ( not ( = ?auto_557552 ?auto_557555 ) ) ( not ( = ?auto_557552 ?auto_557556 ) ) ( not ( = ?auto_557552 ?auto_557557 ) ) ( not ( = ?auto_557552 ?auto_557558 ) ) ( not ( = ?auto_557553 ?auto_557554 ) ) ( not ( = ?auto_557553 ?auto_557555 ) ) ( not ( = ?auto_557553 ?auto_557556 ) ) ( not ( = ?auto_557553 ?auto_557557 ) ) ( not ( = ?auto_557553 ?auto_557558 ) ) ( not ( = ?auto_557554 ?auto_557555 ) ) ( not ( = ?auto_557554 ?auto_557556 ) ) ( not ( = ?auto_557554 ?auto_557557 ) ) ( not ( = ?auto_557554 ?auto_557558 ) ) ( not ( = ?auto_557555 ?auto_557556 ) ) ( not ( = ?auto_557555 ?auto_557557 ) ) ( not ( = ?auto_557555 ?auto_557558 ) ) ( not ( = ?auto_557556 ?auto_557557 ) ) ( not ( = ?auto_557556 ?auto_557558 ) ) ( not ( = ?auto_557557 ?auto_557558 ) ) ( ON ?auto_557556 ?auto_557557 ) ( ON ?auto_557555 ?auto_557556 ) ( ON ?auto_557554 ?auto_557555 ) ( ON ?auto_557553 ?auto_557554 ) ( ON ?auto_557552 ?auto_557553 ) ( ON ?auto_557551 ?auto_557552 ) ( ON ?auto_557550 ?auto_557551 ) ( CLEAR ?auto_557548 ) ( ON ?auto_557549 ?auto_557550 ) ( CLEAR ?auto_557549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_557543 ?auto_557544 ?auto_557545 ?auto_557546 ?auto_557547 ?auto_557548 ?auto_557549 )
      ( MAKE-15PILE ?auto_557543 ?auto_557544 ?auto_557545 ?auto_557546 ?auto_557547 ?auto_557548 ?auto_557549 ?auto_557550 ?auto_557551 ?auto_557552 ?auto_557553 ?auto_557554 ?auto_557555 ?auto_557556 ?auto_557557 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557605 - BLOCK
      ?auto_557606 - BLOCK
      ?auto_557607 - BLOCK
      ?auto_557608 - BLOCK
      ?auto_557609 - BLOCK
      ?auto_557610 - BLOCK
      ?auto_557611 - BLOCK
      ?auto_557612 - BLOCK
      ?auto_557613 - BLOCK
      ?auto_557614 - BLOCK
      ?auto_557615 - BLOCK
      ?auto_557616 - BLOCK
      ?auto_557617 - BLOCK
      ?auto_557618 - BLOCK
      ?auto_557619 - BLOCK
    )
    :vars
    (
      ?auto_557620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557619 ?auto_557620 ) ( ON-TABLE ?auto_557605 ) ( ON ?auto_557606 ?auto_557605 ) ( ON ?auto_557607 ?auto_557606 ) ( ON ?auto_557608 ?auto_557607 ) ( ON ?auto_557609 ?auto_557608 ) ( not ( = ?auto_557605 ?auto_557606 ) ) ( not ( = ?auto_557605 ?auto_557607 ) ) ( not ( = ?auto_557605 ?auto_557608 ) ) ( not ( = ?auto_557605 ?auto_557609 ) ) ( not ( = ?auto_557605 ?auto_557610 ) ) ( not ( = ?auto_557605 ?auto_557611 ) ) ( not ( = ?auto_557605 ?auto_557612 ) ) ( not ( = ?auto_557605 ?auto_557613 ) ) ( not ( = ?auto_557605 ?auto_557614 ) ) ( not ( = ?auto_557605 ?auto_557615 ) ) ( not ( = ?auto_557605 ?auto_557616 ) ) ( not ( = ?auto_557605 ?auto_557617 ) ) ( not ( = ?auto_557605 ?auto_557618 ) ) ( not ( = ?auto_557605 ?auto_557619 ) ) ( not ( = ?auto_557605 ?auto_557620 ) ) ( not ( = ?auto_557606 ?auto_557607 ) ) ( not ( = ?auto_557606 ?auto_557608 ) ) ( not ( = ?auto_557606 ?auto_557609 ) ) ( not ( = ?auto_557606 ?auto_557610 ) ) ( not ( = ?auto_557606 ?auto_557611 ) ) ( not ( = ?auto_557606 ?auto_557612 ) ) ( not ( = ?auto_557606 ?auto_557613 ) ) ( not ( = ?auto_557606 ?auto_557614 ) ) ( not ( = ?auto_557606 ?auto_557615 ) ) ( not ( = ?auto_557606 ?auto_557616 ) ) ( not ( = ?auto_557606 ?auto_557617 ) ) ( not ( = ?auto_557606 ?auto_557618 ) ) ( not ( = ?auto_557606 ?auto_557619 ) ) ( not ( = ?auto_557606 ?auto_557620 ) ) ( not ( = ?auto_557607 ?auto_557608 ) ) ( not ( = ?auto_557607 ?auto_557609 ) ) ( not ( = ?auto_557607 ?auto_557610 ) ) ( not ( = ?auto_557607 ?auto_557611 ) ) ( not ( = ?auto_557607 ?auto_557612 ) ) ( not ( = ?auto_557607 ?auto_557613 ) ) ( not ( = ?auto_557607 ?auto_557614 ) ) ( not ( = ?auto_557607 ?auto_557615 ) ) ( not ( = ?auto_557607 ?auto_557616 ) ) ( not ( = ?auto_557607 ?auto_557617 ) ) ( not ( = ?auto_557607 ?auto_557618 ) ) ( not ( = ?auto_557607 ?auto_557619 ) ) ( not ( = ?auto_557607 ?auto_557620 ) ) ( not ( = ?auto_557608 ?auto_557609 ) ) ( not ( = ?auto_557608 ?auto_557610 ) ) ( not ( = ?auto_557608 ?auto_557611 ) ) ( not ( = ?auto_557608 ?auto_557612 ) ) ( not ( = ?auto_557608 ?auto_557613 ) ) ( not ( = ?auto_557608 ?auto_557614 ) ) ( not ( = ?auto_557608 ?auto_557615 ) ) ( not ( = ?auto_557608 ?auto_557616 ) ) ( not ( = ?auto_557608 ?auto_557617 ) ) ( not ( = ?auto_557608 ?auto_557618 ) ) ( not ( = ?auto_557608 ?auto_557619 ) ) ( not ( = ?auto_557608 ?auto_557620 ) ) ( not ( = ?auto_557609 ?auto_557610 ) ) ( not ( = ?auto_557609 ?auto_557611 ) ) ( not ( = ?auto_557609 ?auto_557612 ) ) ( not ( = ?auto_557609 ?auto_557613 ) ) ( not ( = ?auto_557609 ?auto_557614 ) ) ( not ( = ?auto_557609 ?auto_557615 ) ) ( not ( = ?auto_557609 ?auto_557616 ) ) ( not ( = ?auto_557609 ?auto_557617 ) ) ( not ( = ?auto_557609 ?auto_557618 ) ) ( not ( = ?auto_557609 ?auto_557619 ) ) ( not ( = ?auto_557609 ?auto_557620 ) ) ( not ( = ?auto_557610 ?auto_557611 ) ) ( not ( = ?auto_557610 ?auto_557612 ) ) ( not ( = ?auto_557610 ?auto_557613 ) ) ( not ( = ?auto_557610 ?auto_557614 ) ) ( not ( = ?auto_557610 ?auto_557615 ) ) ( not ( = ?auto_557610 ?auto_557616 ) ) ( not ( = ?auto_557610 ?auto_557617 ) ) ( not ( = ?auto_557610 ?auto_557618 ) ) ( not ( = ?auto_557610 ?auto_557619 ) ) ( not ( = ?auto_557610 ?auto_557620 ) ) ( not ( = ?auto_557611 ?auto_557612 ) ) ( not ( = ?auto_557611 ?auto_557613 ) ) ( not ( = ?auto_557611 ?auto_557614 ) ) ( not ( = ?auto_557611 ?auto_557615 ) ) ( not ( = ?auto_557611 ?auto_557616 ) ) ( not ( = ?auto_557611 ?auto_557617 ) ) ( not ( = ?auto_557611 ?auto_557618 ) ) ( not ( = ?auto_557611 ?auto_557619 ) ) ( not ( = ?auto_557611 ?auto_557620 ) ) ( not ( = ?auto_557612 ?auto_557613 ) ) ( not ( = ?auto_557612 ?auto_557614 ) ) ( not ( = ?auto_557612 ?auto_557615 ) ) ( not ( = ?auto_557612 ?auto_557616 ) ) ( not ( = ?auto_557612 ?auto_557617 ) ) ( not ( = ?auto_557612 ?auto_557618 ) ) ( not ( = ?auto_557612 ?auto_557619 ) ) ( not ( = ?auto_557612 ?auto_557620 ) ) ( not ( = ?auto_557613 ?auto_557614 ) ) ( not ( = ?auto_557613 ?auto_557615 ) ) ( not ( = ?auto_557613 ?auto_557616 ) ) ( not ( = ?auto_557613 ?auto_557617 ) ) ( not ( = ?auto_557613 ?auto_557618 ) ) ( not ( = ?auto_557613 ?auto_557619 ) ) ( not ( = ?auto_557613 ?auto_557620 ) ) ( not ( = ?auto_557614 ?auto_557615 ) ) ( not ( = ?auto_557614 ?auto_557616 ) ) ( not ( = ?auto_557614 ?auto_557617 ) ) ( not ( = ?auto_557614 ?auto_557618 ) ) ( not ( = ?auto_557614 ?auto_557619 ) ) ( not ( = ?auto_557614 ?auto_557620 ) ) ( not ( = ?auto_557615 ?auto_557616 ) ) ( not ( = ?auto_557615 ?auto_557617 ) ) ( not ( = ?auto_557615 ?auto_557618 ) ) ( not ( = ?auto_557615 ?auto_557619 ) ) ( not ( = ?auto_557615 ?auto_557620 ) ) ( not ( = ?auto_557616 ?auto_557617 ) ) ( not ( = ?auto_557616 ?auto_557618 ) ) ( not ( = ?auto_557616 ?auto_557619 ) ) ( not ( = ?auto_557616 ?auto_557620 ) ) ( not ( = ?auto_557617 ?auto_557618 ) ) ( not ( = ?auto_557617 ?auto_557619 ) ) ( not ( = ?auto_557617 ?auto_557620 ) ) ( not ( = ?auto_557618 ?auto_557619 ) ) ( not ( = ?auto_557618 ?auto_557620 ) ) ( not ( = ?auto_557619 ?auto_557620 ) ) ( ON ?auto_557618 ?auto_557619 ) ( ON ?auto_557617 ?auto_557618 ) ( ON ?auto_557616 ?auto_557617 ) ( ON ?auto_557615 ?auto_557616 ) ( ON ?auto_557614 ?auto_557615 ) ( ON ?auto_557613 ?auto_557614 ) ( ON ?auto_557612 ?auto_557613 ) ( ON ?auto_557611 ?auto_557612 ) ( CLEAR ?auto_557609 ) ( ON ?auto_557610 ?auto_557611 ) ( CLEAR ?auto_557610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_557605 ?auto_557606 ?auto_557607 ?auto_557608 ?auto_557609 ?auto_557610 )
      ( MAKE-15PILE ?auto_557605 ?auto_557606 ?auto_557607 ?auto_557608 ?auto_557609 ?auto_557610 ?auto_557611 ?auto_557612 ?auto_557613 ?auto_557614 ?auto_557615 ?auto_557616 ?auto_557617 ?auto_557618 ?auto_557619 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557667 - BLOCK
      ?auto_557668 - BLOCK
      ?auto_557669 - BLOCK
      ?auto_557670 - BLOCK
      ?auto_557671 - BLOCK
      ?auto_557672 - BLOCK
      ?auto_557673 - BLOCK
      ?auto_557674 - BLOCK
      ?auto_557675 - BLOCK
      ?auto_557676 - BLOCK
      ?auto_557677 - BLOCK
      ?auto_557678 - BLOCK
      ?auto_557679 - BLOCK
      ?auto_557680 - BLOCK
      ?auto_557681 - BLOCK
    )
    :vars
    (
      ?auto_557682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557681 ?auto_557682 ) ( ON-TABLE ?auto_557667 ) ( ON ?auto_557668 ?auto_557667 ) ( ON ?auto_557669 ?auto_557668 ) ( ON ?auto_557670 ?auto_557669 ) ( not ( = ?auto_557667 ?auto_557668 ) ) ( not ( = ?auto_557667 ?auto_557669 ) ) ( not ( = ?auto_557667 ?auto_557670 ) ) ( not ( = ?auto_557667 ?auto_557671 ) ) ( not ( = ?auto_557667 ?auto_557672 ) ) ( not ( = ?auto_557667 ?auto_557673 ) ) ( not ( = ?auto_557667 ?auto_557674 ) ) ( not ( = ?auto_557667 ?auto_557675 ) ) ( not ( = ?auto_557667 ?auto_557676 ) ) ( not ( = ?auto_557667 ?auto_557677 ) ) ( not ( = ?auto_557667 ?auto_557678 ) ) ( not ( = ?auto_557667 ?auto_557679 ) ) ( not ( = ?auto_557667 ?auto_557680 ) ) ( not ( = ?auto_557667 ?auto_557681 ) ) ( not ( = ?auto_557667 ?auto_557682 ) ) ( not ( = ?auto_557668 ?auto_557669 ) ) ( not ( = ?auto_557668 ?auto_557670 ) ) ( not ( = ?auto_557668 ?auto_557671 ) ) ( not ( = ?auto_557668 ?auto_557672 ) ) ( not ( = ?auto_557668 ?auto_557673 ) ) ( not ( = ?auto_557668 ?auto_557674 ) ) ( not ( = ?auto_557668 ?auto_557675 ) ) ( not ( = ?auto_557668 ?auto_557676 ) ) ( not ( = ?auto_557668 ?auto_557677 ) ) ( not ( = ?auto_557668 ?auto_557678 ) ) ( not ( = ?auto_557668 ?auto_557679 ) ) ( not ( = ?auto_557668 ?auto_557680 ) ) ( not ( = ?auto_557668 ?auto_557681 ) ) ( not ( = ?auto_557668 ?auto_557682 ) ) ( not ( = ?auto_557669 ?auto_557670 ) ) ( not ( = ?auto_557669 ?auto_557671 ) ) ( not ( = ?auto_557669 ?auto_557672 ) ) ( not ( = ?auto_557669 ?auto_557673 ) ) ( not ( = ?auto_557669 ?auto_557674 ) ) ( not ( = ?auto_557669 ?auto_557675 ) ) ( not ( = ?auto_557669 ?auto_557676 ) ) ( not ( = ?auto_557669 ?auto_557677 ) ) ( not ( = ?auto_557669 ?auto_557678 ) ) ( not ( = ?auto_557669 ?auto_557679 ) ) ( not ( = ?auto_557669 ?auto_557680 ) ) ( not ( = ?auto_557669 ?auto_557681 ) ) ( not ( = ?auto_557669 ?auto_557682 ) ) ( not ( = ?auto_557670 ?auto_557671 ) ) ( not ( = ?auto_557670 ?auto_557672 ) ) ( not ( = ?auto_557670 ?auto_557673 ) ) ( not ( = ?auto_557670 ?auto_557674 ) ) ( not ( = ?auto_557670 ?auto_557675 ) ) ( not ( = ?auto_557670 ?auto_557676 ) ) ( not ( = ?auto_557670 ?auto_557677 ) ) ( not ( = ?auto_557670 ?auto_557678 ) ) ( not ( = ?auto_557670 ?auto_557679 ) ) ( not ( = ?auto_557670 ?auto_557680 ) ) ( not ( = ?auto_557670 ?auto_557681 ) ) ( not ( = ?auto_557670 ?auto_557682 ) ) ( not ( = ?auto_557671 ?auto_557672 ) ) ( not ( = ?auto_557671 ?auto_557673 ) ) ( not ( = ?auto_557671 ?auto_557674 ) ) ( not ( = ?auto_557671 ?auto_557675 ) ) ( not ( = ?auto_557671 ?auto_557676 ) ) ( not ( = ?auto_557671 ?auto_557677 ) ) ( not ( = ?auto_557671 ?auto_557678 ) ) ( not ( = ?auto_557671 ?auto_557679 ) ) ( not ( = ?auto_557671 ?auto_557680 ) ) ( not ( = ?auto_557671 ?auto_557681 ) ) ( not ( = ?auto_557671 ?auto_557682 ) ) ( not ( = ?auto_557672 ?auto_557673 ) ) ( not ( = ?auto_557672 ?auto_557674 ) ) ( not ( = ?auto_557672 ?auto_557675 ) ) ( not ( = ?auto_557672 ?auto_557676 ) ) ( not ( = ?auto_557672 ?auto_557677 ) ) ( not ( = ?auto_557672 ?auto_557678 ) ) ( not ( = ?auto_557672 ?auto_557679 ) ) ( not ( = ?auto_557672 ?auto_557680 ) ) ( not ( = ?auto_557672 ?auto_557681 ) ) ( not ( = ?auto_557672 ?auto_557682 ) ) ( not ( = ?auto_557673 ?auto_557674 ) ) ( not ( = ?auto_557673 ?auto_557675 ) ) ( not ( = ?auto_557673 ?auto_557676 ) ) ( not ( = ?auto_557673 ?auto_557677 ) ) ( not ( = ?auto_557673 ?auto_557678 ) ) ( not ( = ?auto_557673 ?auto_557679 ) ) ( not ( = ?auto_557673 ?auto_557680 ) ) ( not ( = ?auto_557673 ?auto_557681 ) ) ( not ( = ?auto_557673 ?auto_557682 ) ) ( not ( = ?auto_557674 ?auto_557675 ) ) ( not ( = ?auto_557674 ?auto_557676 ) ) ( not ( = ?auto_557674 ?auto_557677 ) ) ( not ( = ?auto_557674 ?auto_557678 ) ) ( not ( = ?auto_557674 ?auto_557679 ) ) ( not ( = ?auto_557674 ?auto_557680 ) ) ( not ( = ?auto_557674 ?auto_557681 ) ) ( not ( = ?auto_557674 ?auto_557682 ) ) ( not ( = ?auto_557675 ?auto_557676 ) ) ( not ( = ?auto_557675 ?auto_557677 ) ) ( not ( = ?auto_557675 ?auto_557678 ) ) ( not ( = ?auto_557675 ?auto_557679 ) ) ( not ( = ?auto_557675 ?auto_557680 ) ) ( not ( = ?auto_557675 ?auto_557681 ) ) ( not ( = ?auto_557675 ?auto_557682 ) ) ( not ( = ?auto_557676 ?auto_557677 ) ) ( not ( = ?auto_557676 ?auto_557678 ) ) ( not ( = ?auto_557676 ?auto_557679 ) ) ( not ( = ?auto_557676 ?auto_557680 ) ) ( not ( = ?auto_557676 ?auto_557681 ) ) ( not ( = ?auto_557676 ?auto_557682 ) ) ( not ( = ?auto_557677 ?auto_557678 ) ) ( not ( = ?auto_557677 ?auto_557679 ) ) ( not ( = ?auto_557677 ?auto_557680 ) ) ( not ( = ?auto_557677 ?auto_557681 ) ) ( not ( = ?auto_557677 ?auto_557682 ) ) ( not ( = ?auto_557678 ?auto_557679 ) ) ( not ( = ?auto_557678 ?auto_557680 ) ) ( not ( = ?auto_557678 ?auto_557681 ) ) ( not ( = ?auto_557678 ?auto_557682 ) ) ( not ( = ?auto_557679 ?auto_557680 ) ) ( not ( = ?auto_557679 ?auto_557681 ) ) ( not ( = ?auto_557679 ?auto_557682 ) ) ( not ( = ?auto_557680 ?auto_557681 ) ) ( not ( = ?auto_557680 ?auto_557682 ) ) ( not ( = ?auto_557681 ?auto_557682 ) ) ( ON ?auto_557680 ?auto_557681 ) ( ON ?auto_557679 ?auto_557680 ) ( ON ?auto_557678 ?auto_557679 ) ( ON ?auto_557677 ?auto_557678 ) ( ON ?auto_557676 ?auto_557677 ) ( ON ?auto_557675 ?auto_557676 ) ( ON ?auto_557674 ?auto_557675 ) ( ON ?auto_557673 ?auto_557674 ) ( ON ?auto_557672 ?auto_557673 ) ( CLEAR ?auto_557670 ) ( ON ?auto_557671 ?auto_557672 ) ( CLEAR ?auto_557671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_557667 ?auto_557668 ?auto_557669 ?auto_557670 ?auto_557671 )
      ( MAKE-15PILE ?auto_557667 ?auto_557668 ?auto_557669 ?auto_557670 ?auto_557671 ?auto_557672 ?auto_557673 ?auto_557674 ?auto_557675 ?auto_557676 ?auto_557677 ?auto_557678 ?auto_557679 ?auto_557680 ?auto_557681 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557729 - BLOCK
      ?auto_557730 - BLOCK
      ?auto_557731 - BLOCK
      ?auto_557732 - BLOCK
      ?auto_557733 - BLOCK
      ?auto_557734 - BLOCK
      ?auto_557735 - BLOCK
      ?auto_557736 - BLOCK
      ?auto_557737 - BLOCK
      ?auto_557738 - BLOCK
      ?auto_557739 - BLOCK
      ?auto_557740 - BLOCK
      ?auto_557741 - BLOCK
      ?auto_557742 - BLOCK
      ?auto_557743 - BLOCK
    )
    :vars
    (
      ?auto_557744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557743 ?auto_557744 ) ( ON-TABLE ?auto_557729 ) ( ON ?auto_557730 ?auto_557729 ) ( ON ?auto_557731 ?auto_557730 ) ( not ( = ?auto_557729 ?auto_557730 ) ) ( not ( = ?auto_557729 ?auto_557731 ) ) ( not ( = ?auto_557729 ?auto_557732 ) ) ( not ( = ?auto_557729 ?auto_557733 ) ) ( not ( = ?auto_557729 ?auto_557734 ) ) ( not ( = ?auto_557729 ?auto_557735 ) ) ( not ( = ?auto_557729 ?auto_557736 ) ) ( not ( = ?auto_557729 ?auto_557737 ) ) ( not ( = ?auto_557729 ?auto_557738 ) ) ( not ( = ?auto_557729 ?auto_557739 ) ) ( not ( = ?auto_557729 ?auto_557740 ) ) ( not ( = ?auto_557729 ?auto_557741 ) ) ( not ( = ?auto_557729 ?auto_557742 ) ) ( not ( = ?auto_557729 ?auto_557743 ) ) ( not ( = ?auto_557729 ?auto_557744 ) ) ( not ( = ?auto_557730 ?auto_557731 ) ) ( not ( = ?auto_557730 ?auto_557732 ) ) ( not ( = ?auto_557730 ?auto_557733 ) ) ( not ( = ?auto_557730 ?auto_557734 ) ) ( not ( = ?auto_557730 ?auto_557735 ) ) ( not ( = ?auto_557730 ?auto_557736 ) ) ( not ( = ?auto_557730 ?auto_557737 ) ) ( not ( = ?auto_557730 ?auto_557738 ) ) ( not ( = ?auto_557730 ?auto_557739 ) ) ( not ( = ?auto_557730 ?auto_557740 ) ) ( not ( = ?auto_557730 ?auto_557741 ) ) ( not ( = ?auto_557730 ?auto_557742 ) ) ( not ( = ?auto_557730 ?auto_557743 ) ) ( not ( = ?auto_557730 ?auto_557744 ) ) ( not ( = ?auto_557731 ?auto_557732 ) ) ( not ( = ?auto_557731 ?auto_557733 ) ) ( not ( = ?auto_557731 ?auto_557734 ) ) ( not ( = ?auto_557731 ?auto_557735 ) ) ( not ( = ?auto_557731 ?auto_557736 ) ) ( not ( = ?auto_557731 ?auto_557737 ) ) ( not ( = ?auto_557731 ?auto_557738 ) ) ( not ( = ?auto_557731 ?auto_557739 ) ) ( not ( = ?auto_557731 ?auto_557740 ) ) ( not ( = ?auto_557731 ?auto_557741 ) ) ( not ( = ?auto_557731 ?auto_557742 ) ) ( not ( = ?auto_557731 ?auto_557743 ) ) ( not ( = ?auto_557731 ?auto_557744 ) ) ( not ( = ?auto_557732 ?auto_557733 ) ) ( not ( = ?auto_557732 ?auto_557734 ) ) ( not ( = ?auto_557732 ?auto_557735 ) ) ( not ( = ?auto_557732 ?auto_557736 ) ) ( not ( = ?auto_557732 ?auto_557737 ) ) ( not ( = ?auto_557732 ?auto_557738 ) ) ( not ( = ?auto_557732 ?auto_557739 ) ) ( not ( = ?auto_557732 ?auto_557740 ) ) ( not ( = ?auto_557732 ?auto_557741 ) ) ( not ( = ?auto_557732 ?auto_557742 ) ) ( not ( = ?auto_557732 ?auto_557743 ) ) ( not ( = ?auto_557732 ?auto_557744 ) ) ( not ( = ?auto_557733 ?auto_557734 ) ) ( not ( = ?auto_557733 ?auto_557735 ) ) ( not ( = ?auto_557733 ?auto_557736 ) ) ( not ( = ?auto_557733 ?auto_557737 ) ) ( not ( = ?auto_557733 ?auto_557738 ) ) ( not ( = ?auto_557733 ?auto_557739 ) ) ( not ( = ?auto_557733 ?auto_557740 ) ) ( not ( = ?auto_557733 ?auto_557741 ) ) ( not ( = ?auto_557733 ?auto_557742 ) ) ( not ( = ?auto_557733 ?auto_557743 ) ) ( not ( = ?auto_557733 ?auto_557744 ) ) ( not ( = ?auto_557734 ?auto_557735 ) ) ( not ( = ?auto_557734 ?auto_557736 ) ) ( not ( = ?auto_557734 ?auto_557737 ) ) ( not ( = ?auto_557734 ?auto_557738 ) ) ( not ( = ?auto_557734 ?auto_557739 ) ) ( not ( = ?auto_557734 ?auto_557740 ) ) ( not ( = ?auto_557734 ?auto_557741 ) ) ( not ( = ?auto_557734 ?auto_557742 ) ) ( not ( = ?auto_557734 ?auto_557743 ) ) ( not ( = ?auto_557734 ?auto_557744 ) ) ( not ( = ?auto_557735 ?auto_557736 ) ) ( not ( = ?auto_557735 ?auto_557737 ) ) ( not ( = ?auto_557735 ?auto_557738 ) ) ( not ( = ?auto_557735 ?auto_557739 ) ) ( not ( = ?auto_557735 ?auto_557740 ) ) ( not ( = ?auto_557735 ?auto_557741 ) ) ( not ( = ?auto_557735 ?auto_557742 ) ) ( not ( = ?auto_557735 ?auto_557743 ) ) ( not ( = ?auto_557735 ?auto_557744 ) ) ( not ( = ?auto_557736 ?auto_557737 ) ) ( not ( = ?auto_557736 ?auto_557738 ) ) ( not ( = ?auto_557736 ?auto_557739 ) ) ( not ( = ?auto_557736 ?auto_557740 ) ) ( not ( = ?auto_557736 ?auto_557741 ) ) ( not ( = ?auto_557736 ?auto_557742 ) ) ( not ( = ?auto_557736 ?auto_557743 ) ) ( not ( = ?auto_557736 ?auto_557744 ) ) ( not ( = ?auto_557737 ?auto_557738 ) ) ( not ( = ?auto_557737 ?auto_557739 ) ) ( not ( = ?auto_557737 ?auto_557740 ) ) ( not ( = ?auto_557737 ?auto_557741 ) ) ( not ( = ?auto_557737 ?auto_557742 ) ) ( not ( = ?auto_557737 ?auto_557743 ) ) ( not ( = ?auto_557737 ?auto_557744 ) ) ( not ( = ?auto_557738 ?auto_557739 ) ) ( not ( = ?auto_557738 ?auto_557740 ) ) ( not ( = ?auto_557738 ?auto_557741 ) ) ( not ( = ?auto_557738 ?auto_557742 ) ) ( not ( = ?auto_557738 ?auto_557743 ) ) ( not ( = ?auto_557738 ?auto_557744 ) ) ( not ( = ?auto_557739 ?auto_557740 ) ) ( not ( = ?auto_557739 ?auto_557741 ) ) ( not ( = ?auto_557739 ?auto_557742 ) ) ( not ( = ?auto_557739 ?auto_557743 ) ) ( not ( = ?auto_557739 ?auto_557744 ) ) ( not ( = ?auto_557740 ?auto_557741 ) ) ( not ( = ?auto_557740 ?auto_557742 ) ) ( not ( = ?auto_557740 ?auto_557743 ) ) ( not ( = ?auto_557740 ?auto_557744 ) ) ( not ( = ?auto_557741 ?auto_557742 ) ) ( not ( = ?auto_557741 ?auto_557743 ) ) ( not ( = ?auto_557741 ?auto_557744 ) ) ( not ( = ?auto_557742 ?auto_557743 ) ) ( not ( = ?auto_557742 ?auto_557744 ) ) ( not ( = ?auto_557743 ?auto_557744 ) ) ( ON ?auto_557742 ?auto_557743 ) ( ON ?auto_557741 ?auto_557742 ) ( ON ?auto_557740 ?auto_557741 ) ( ON ?auto_557739 ?auto_557740 ) ( ON ?auto_557738 ?auto_557739 ) ( ON ?auto_557737 ?auto_557738 ) ( ON ?auto_557736 ?auto_557737 ) ( ON ?auto_557735 ?auto_557736 ) ( ON ?auto_557734 ?auto_557735 ) ( ON ?auto_557733 ?auto_557734 ) ( CLEAR ?auto_557731 ) ( ON ?auto_557732 ?auto_557733 ) ( CLEAR ?auto_557732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_557729 ?auto_557730 ?auto_557731 ?auto_557732 )
      ( MAKE-15PILE ?auto_557729 ?auto_557730 ?auto_557731 ?auto_557732 ?auto_557733 ?auto_557734 ?auto_557735 ?auto_557736 ?auto_557737 ?auto_557738 ?auto_557739 ?auto_557740 ?auto_557741 ?auto_557742 ?auto_557743 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557791 - BLOCK
      ?auto_557792 - BLOCK
      ?auto_557793 - BLOCK
      ?auto_557794 - BLOCK
      ?auto_557795 - BLOCK
      ?auto_557796 - BLOCK
      ?auto_557797 - BLOCK
      ?auto_557798 - BLOCK
      ?auto_557799 - BLOCK
      ?auto_557800 - BLOCK
      ?auto_557801 - BLOCK
      ?auto_557802 - BLOCK
      ?auto_557803 - BLOCK
      ?auto_557804 - BLOCK
      ?auto_557805 - BLOCK
    )
    :vars
    (
      ?auto_557806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557805 ?auto_557806 ) ( ON-TABLE ?auto_557791 ) ( ON ?auto_557792 ?auto_557791 ) ( not ( = ?auto_557791 ?auto_557792 ) ) ( not ( = ?auto_557791 ?auto_557793 ) ) ( not ( = ?auto_557791 ?auto_557794 ) ) ( not ( = ?auto_557791 ?auto_557795 ) ) ( not ( = ?auto_557791 ?auto_557796 ) ) ( not ( = ?auto_557791 ?auto_557797 ) ) ( not ( = ?auto_557791 ?auto_557798 ) ) ( not ( = ?auto_557791 ?auto_557799 ) ) ( not ( = ?auto_557791 ?auto_557800 ) ) ( not ( = ?auto_557791 ?auto_557801 ) ) ( not ( = ?auto_557791 ?auto_557802 ) ) ( not ( = ?auto_557791 ?auto_557803 ) ) ( not ( = ?auto_557791 ?auto_557804 ) ) ( not ( = ?auto_557791 ?auto_557805 ) ) ( not ( = ?auto_557791 ?auto_557806 ) ) ( not ( = ?auto_557792 ?auto_557793 ) ) ( not ( = ?auto_557792 ?auto_557794 ) ) ( not ( = ?auto_557792 ?auto_557795 ) ) ( not ( = ?auto_557792 ?auto_557796 ) ) ( not ( = ?auto_557792 ?auto_557797 ) ) ( not ( = ?auto_557792 ?auto_557798 ) ) ( not ( = ?auto_557792 ?auto_557799 ) ) ( not ( = ?auto_557792 ?auto_557800 ) ) ( not ( = ?auto_557792 ?auto_557801 ) ) ( not ( = ?auto_557792 ?auto_557802 ) ) ( not ( = ?auto_557792 ?auto_557803 ) ) ( not ( = ?auto_557792 ?auto_557804 ) ) ( not ( = ?auto_557792 ?auto_557805 ) ) ( not ( = ?auto_557792 ?auto_557806 ) ) ( not ( = ?auto_557793 ?auto_557794 ) ) ( not ( = ?auto_557793 ?auto_557795 ) ) ( not ( = ?auto_557793 ?auto_557796 ) ) ( not ( = ?auto_557793 ?auto_557797 ) ) ( not ( = ?auto_557793 ?auto_557798 ) ) ( not ( = ?auto_557793 ?auto_557799 ) ) ( not ( = ?auto_557793 ?auto_557800 ) ) ( not ( = ?auto_557793 ?auto_557801 ) ) ( not ( = ?auto_557793 ?auto_557802 ) ) ( not ( = ?auto_557793 ?auto_557803 ) ) ( not ( = ?auto_557793 ?auto_557804 ) ) ( not ( = ?auto_557793 ?auto_557805 ) ) ( not ( = ?auto_557793 ?auto_557806 ) ) ( not ( = ?auto_557794 ?auto_557795 ) ) ( not ( = ?auto_557794 ?auto_557796 ) ) ( not ( = ?auto_557794 ?auto_557797 ) ) ( not ( = ?auto_557794 ?auto_557798 ) ) ( not ( = ?auto_557794 ?auto_557799 ) ) ( not ( = ?auto_557794 ?auto_557800 ) ) ( not ( = ?auto_557794 ?auto_557801 ) ) ( not ( = ?auto_557794 ?auto_557802 ) ) ( not ( = ?auto_557794 ?auto_557803 ) ) ( not ( = ?auto_557794 ?auto_557804 ) ) ( not ( = ?auto_557794 ?auto_557805 ) ) ( not ( = ?auto_557794 ?auto_557806 ) ) ( not ( = ?auto_557795 ?auto_557796 ) ) ( not ( = ?auto_557795 ?auto_557797 ) ) ( not ( = ?auto_557795 ?auto_557798 ) ) ( not ( = ?auto_557795 ?auto_557799 ) ) ( not ( = ?auto_557795 ?auto_557800 ) ) ( not ( = ?auto_557795 ?auto_557801 ) ) ( not ( = ?auto_557795 ?auto_557802 ) ) ( not ( = ?auto_557795 ?auto_557803 ) ) ( not ( = ?auto_557795 ?auto_557804 ) ) ( not ( = ?auto_557795 ?auto_557805 ) ) ( not ( = ?auto_557795 ?auto_557806 ) ) ( not ( = ?auto_557796 ?auto_557797 ) ) ( not ( = ?auto_557796 ?auto_557798 ) ) ( not ( = ?auto_557796 ?auto_557799 ) ) ( not ( = ?auto_557796 ?auto_557800 ) ) ( not ( = ?auto_557796 ?auto_557801 ) ) ( not ( = ?auto_557796 ?auto_557802 ) ) ( not ( = ?auto_557796 ?auto_557803 ) ) ( not ( = ?auto_557796 ?auto_557804 ) ) ( not ( = ?auto_557796 ?auto_557805 ) ) ( not ( = ?auto_557796 ?auto_557806 ) ) ( not ( = ?auto_557797 ?auto_557798 ) ) ( not ( = ?auto_557797 ?auto_557799 ) ) ( not ( = ?auto_557797 ?auto_557800 ) ) ( not ( = ?auto_557797 ?auto_557801 ) ) ( not ( = ?auto_557797 ?auto_557802 ) ) ( not ( = ?auto_557797 ?auto_557803 ) ) ( not ( = ?auto_557797 ?auto_557804 ) ) ( not ( = ?auto_557797 ?auto_557805 ) ) ( not ( = ?auto_557797 ?auto_557806 ) ) ( not ( = ?auto_557798 ?auto_557799 ) ) ( not ( = ?auto_557798 ?auto_557800 ) ) ( not ( = ?auto_557798 ?auto_557801 ) ) ( not ( = ?auto_557798 ?auto_557802 ) ) ( not ( = ?auto_557798 ?auto_557803 ) ) ( not ( = ?auto_557798 ?auto_557804 ) ) ( not ( = ?auto_557798 ?auto_557805 ) ) ( not ( = ?auto_557798 ?auto_557806 ) ) ( not ( = ?auto_557799 ?auto_557800 ) ) ( not ( = ?auto_557799 ?auto_557801 ) ) ( not ( = ?auto_557799 ?auto_557802 ) ) ( not ( = ?auto_557799 ?auto_557803 ) ) ( not ( = ?auto_557799 ?auto_557804 ) ) ( not ( = ?auto_557799 ?auto_557805 ) ) ( not ( = ?auto_557799 ?auto_557806 ) ) ( not ( = ?auto_557800 ?auto_557801 ) ) ( not ( = ?auto_557800 ?auto_557802 ) ) ( not ( = ?auto_557800 ?auto_557803 ) ) ( not ( = ?auto_557800 ?auto_557804 ) ) ( not ( = ?auto_557800 ?auto_557805 ) ) ( not ( = ?auto_557800 ?auto_557806 ) ) ( not ( = ?auto_557801 ?auto_557802 ) ) ( not ( = ?auto_557801 ?auto_557803 ) ) ( not ( = ?auto_557801 ?auto_557804 ) ) ( not ( = ?auto_557801 ?auto_557805 ) ) ( not ( = ?auto_557801 ?auto_557806 ) ) ( not ( = ?auto_557802 ?auto_557803 ) ) ( not ( = ?auto_557802 ?auto_557804 ) ) ( not ( = ?auto_557802 ?auto_557805 ) ) ( not ( = ?auto_557802 ?auto_557806 ) ) ( not ( = ?auto_557803 ?auto_557804 ) ) ( not ( = ?auto_557803 ?auto_557805 ) ) ( not ( = ?auto_557803 ?auto_557806 ) ) ( not ( = ?auto_557804 ?auto_557805 ) ) ( not ( = ?auto_557804 ?auto_557806 ) ) ( not ( = ?auto_557805 ?auto_557806 ) ) ( ON ?auto_557804 ?auto_557805 ) ( ON ?auto_557803 ?auto_557804 ) ( ON ?auto_557802 ?auto_557803 ) ( ON ?auto_557801 ?auto_557802 ) ( ON ?auto_557800 ?auto_557801 ) ( ON ?auto_557799 ?auto_557800 ) ( ON ?auto_557798 ?auto_557799 ) ( ON ?auto_557797 ?auto_557798 ) ( ON ?auto_557796 ?auto_557797 ) ( ON ?auto_557795 ?auto_557796 ) ( ON ?auto_557794 ?auto_557795 ) ( CLEAR ?auto_557792 ) ( ON ?auto_557793 ?auto_557794 ) ( CLEAR ?auto_557793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_557791 ?auto_557792 ?auto_557793 )
      ( MAKE-15PILE ?auto_557791 ?auto_557792 ?auto_557793 ?auto_557794 ?auto_557795 ?auto_557796 ?auto_557797 ?auto_557798 ?auto_557799 ?auto_557800 ?auto_557801 ?auto_557802 ?auto_557803 ?auto_557804 ?auto_557805 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557853 - BLOCK
      ?auto_557854 - BLOCK
      ?auto_557855 - BLOCK
      ?auto_557856 - BLOCK
      ?auto_557857 - BLOCK
      ?auto_557858 - BLOCK
      ?auto_557859 - BLOCK
      ?auto_557860 - BLOCK
      ?auto_557861 - BLOCK
      ?auto_557862 - BLOCK
      ?auto_557863 - BLOCK
      ?auto_557864 - BLOCK
      ?auto_557865 - BLOCK
      ?auto_557866 - BLOCK
      ?auto_557867 - BLOCK
    )
    :vars
    (
      ?auto_557868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557867 ?auto_557868 ) ( ON-TABLE ?auto_557853 ) ( not ( = ?auto_557853 ?auto_557854 ) ) ( not ( = ?auto_557853 ?auto_557855 ) ) ( not ( = ?auto_557853 ?auto_557856 ) ) ( not ( = ?auto_557853 ?auto_557857 ) ) ( not ( = ?auto_557853 ?auto_557858 ) ) ( not ( = ?auto_557853 ?auto_557859 ) ) ( not ( = ?auto_557853 ?auto_557860 ) ) ( not ( = ?auto_557853 ?auto_557861 ) ) ( not ( = ?auto_557853 ?auto_557862 ) ) ( not ( = ?auto_557853 ?auto_557863 ) ) ( not ( = ?auto_557853 ?auto_557864 ) ) ( not ( = ?auto_557853 ?auto_557865 ) ) ( not ( = ?auto_557853 ?auto_557866 ) ) ( not ( = ?auto_557853 ?auto_557867 ) ) ( not ( = ?auto_557853 ?auto_557868 ) ) ( not ( = ?auto_557854 ?auto_557855 ) ) ( not ( = ?auto_557854 ?auto_557856 ) ) ( not ( = ?auto_557854 ?auto_557857 ) ) ( not ( = ?auto_557854 ?auto_557858 ) ) ( not ( = ?auto_557854 ?auto_557859 ) ) ( not ( = ?auto_557854 ?auto_557860 ) ) ( not ( = ?auto_557854 ?auto_557861 ) ) ( not ( = ?auto_557854 ?auto_557862 ) ) ( not ( = ?auto_557854 ?auto_557863 ) ) ( not ( = ?auto_557854 ?auto_557864 ) ) ( not ( = ?auto_557854 ?auto_557865 ) ) ( not ( = ?auto_557854 ?auto_557866 ) ) ( not ( = ?auto_557854 ?auto_557867 ) ) ( not ( = ?auto_557854 ?auto_557868 ) ) ( not ( = ?auto_557855 ?auto_557856 ) ) ( not ( = ?auto_557855 ?auto_557857 ) ) ( not ( = ?auto_557855 ?auto_557858 ) ) ( not ( = ?auto_557855 ?auto_557859 ) ) ( not ( = ?auto_557855 ?auto_557860 ) ) ( not ( = ?auto_557855 ?auto_557861 ) ) ( not ( = ?auto_557855 ?auto_557862 ) ) ( not ( = ?auto_557855 ?auto_557863 ) ) ( not ( = ?auto_557855 ?auto_557864 ) ) ( not ( = ?auto_557855 ?auto_557865 ) ) ( not ( = ?auto_557855 ?auto_557866 ) ) ( not ( = ?auto_557855 ?auto_557867 ) ) ( not ( = ?auto_557855 ?auto_557868 ) ) ( not ( = ?auto_557856 ?auto_557857 ) ) ( not ( = ?auto_557856 ?auto_557858 ) ) ( not ( = ?auto_557856 ?auto_557859 ) ) ( not ( = ?auto_557856 ?auto_557860 ) ) ( not ( = ?auto_557856 ?auto_557861 ) ) ( not ( = ?auto_557856 ?auto_557862 ) ) ( not ( = ?auto_557856 ?auto_557863 ) ) ( not ( = ?auto_557856 ?auto_557864 ) ) ( not ( = ?auto_557856 ?auto_557865 ) ) ( not ( = ?auto_557856 ?auto_557866 ) ) ( not ( = ?auto_557856 ?auto_557867 ) ) ( not ( = ?auto_557856 ?auto_557868 ) ) ( not ( = ?auto_557857 ?auto_557858 ) ) ( not ( = ?auto_557857 ?auto_557859 ) ) ( not ( = ?auto_557857 ?auto_557860 ) ) ( not ( = ?auto_557857 ?auto_557861 ) ) ( not ( = ?auto_557857 ?auto_557862 ) ) ( not ( = ?auto_557857 ?auto_557863 ) ) ( not ( = ?auto_557857 ?auto_557864 ) ) ( not ( = ?auto_557857 ?auto_557865 ) ) ( not ( = ?auto_557857 ?auto_557866 ) ) ( not ( = ?auto_557857 ?auto_557867 ) ) ( not ( = ?auto_557857 ?auto_557868 ) ) ( not ( = ?auto_557858 ?auto_557859 ) ) ( not ( = ?auto_557858 ?auto_557860 ) ) ( not ( = ?auto_557858 ?auto_557861 ) ) ( not ( = ?auto_557858 ?auto_557862 ) ) ( not ( = ?auto_557858 ?auto_557863 ) ) ( not ( = ?auto_557858 ?auto_557864 ) ) ( not ( = ?auto_557858 ?auto_557865 ) ) ( not ( = ?auto_557858 ?auto_557866 ) ) ( not ( = ?auto_557858 ?auto_557867 ) ) ( not ( = ?auto_557858 ?auto_557868 ) ) ( not ( = ?auto_557859 ?auto_557860 ) ) ( not ( = ?auto_557859 ?auto_557861 ) ) ( not ( = ?auto_557859 ?auto_557862 ) ) ( not ( = ?auto_557859 ?auto_557863 ) ) ( not ( = ?auto_557859 ?auto_557864 ) ) ( not ( = ?auto_557859 ?auto_557865 ) ) ( not ( = ?auto_557859 ?auto_557866 ) ) ( not ( = ?auto_557859 ?auto_557867 ) ) ( not ( = ?auto_557859 ?auto_557868 ) ) ( not ( = ?auto_557860 ?auto_557861 ) ) ( not ( = ?auto_557860 ?auto_557862 ) ) ( not ( = ?auto_557860 ?auto_557863 ) ) ( not ( = ?auto_557860 ?auto_557864 ) ) ( not ( = ?auto_557860 ?auto_557865 ) ) ( not ( = ?auto_557860 ?auto_557866 ) ) ( not ( = ?auto_557860 ?auto_557867 ) ) ( not ( = ?auto_557860 ?auto_557868 ) ) ( not ( = ?auto_557861 ?auto_557862 ) ) ( not ( = ?auto_557861 ?auto_557863 ) ) ( not ( = ?auto_557861 ?auto_557864 ) ) ( not ( = ?auto_557861 ?auto_557865 ) ) ( not ( = ?auto_557861 ?auto_557866 ) ) ( not ( = ?auto_557861 ?auto_557867 ) ) ( not ( = ?auto_557861 ?auto_557868 ) ) ( not ( = ?auto_557862 ?auto_557863 ) ) ( not ( = ?auto_557862 ?auto_557864 ) ) ( not ( = ?auto_557862 ?auto_557865 ) ) ( not ( = ?auto_557862 ?auto_557866 ) ) ( not ( = ?auto_557862 ?auto_557867 ) ) ( not ( = ?auto_557862 ?auto_557868 ) ) ( not ( = ?auto_557863 ?auto_557864 ) ) ( not ( = ?auto_557863 ?auto_557865 ) ) ( not ( = ?auto_557863 ?auto_557866 ) ) ( not ( = ?auto_557863 ?auto_557867 ) ) ( not ( = ?auto_557863 ?auto_557868 ) ) ( not ( = ?auto_557864 ?auto_557865 ) ) ( not ( = ?auto_557864 ?auto_557866 ) ) ( not ( = ?auto_557864 ?auto_557867 ) ) ( not ( = ?auto_557864 ?auto_557868 ) ) ( not ( = ?auto_557865 ?auto_557866 ) ) ( not ( = ?auto_557865 ?auto_557867 ) ) ( not ( = ?auto_557865 ?auto_557868 ) ) ( not ( = ?auto_557866 ?auto_557867 ) ) ( not ( = ?auto_557866 ?auto_557868 ) ) ( not ( = ?auto_557867 ?auto_557868 ) ) ( ON ?auto_557866 ?auto_557867 ) ( ON ?auto_557865 ?auto_557866 ) ( ON ?auto_557864 ?auto_557865 ) ( ON ?auto_557863 ?auto_557864 ) ( ON ?auto_557862 ?auto_557863 ) ( ON ?auto_557861 ?auto_557862 ) ( ON ?auto_557860 ?auto_557861 ) ( ON ?auto_557859 ?auto_557860 ) ( ON ?auto_557858 ?auto_557859 ) ( ON ?auto_557857 ?auto_557858 ) ( ON ?auto_557856 ?auto_557857 ) ( ON ?auto_557855 ?auto_557856 ) ( CLEAR ?auto_557853 ) ( ON ?auto_557854 ?auto_557855 ) ( CLEAR ?auto_557854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_557853 ?auto_557854 )
      ( MAKE-15PILE ?auto_557853 ?auto_557854 ?auto_557855 ?auto_557856 ?auto_557857 ?auto_557858 ?auto_557859 ?auto_557860 ?auto_557861 ?auto_557862 ?auto_557863 ?auto_557864 ?auto_557865 ?auto_557866 ?auto_557867 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_557915 - BLOCK
      ?auto_557916 - BLOCK
      ?auto_557917 - BLOCK
      ?auto_557918 - BLOCK
      ?auto_557919 - BLOCK
      ?auto_557920 - BLOCK
      ?auto_557921 - BLOCK
      ?auto_557922 - BLOCK
      ?auto_557923 - BLOCK
      ?auto_557924 - BLOCK
      ?auto_557925 - BLOCK
      ?auto_557926 - BLOCK
      ?auto_557927 - BLOCK
      ?auto_557928 - BLOCK
      ?auto_557929 - BLOCK
    )
    :vars
    (
      ?auto_557930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_557929 ?auto_557930 ) ( not ( = ?auto_557915 ?auto_557916 ) ) ( not ( = ?auto_557915 ?auto_557917 ) ) ( not ( = ?auto_557915 ?auto_557918 ) ) ( not ( = ?auto_557915 ?auto_557919 ) ) ( not ( = ?auto_557915 ?auto_557920 ) ) ( not ( = ?auto_557915 ?auto_557921 ) ) ( not ( = ?auto_557915 ?auto_557922 ) ) ( not ( = ?auto_557915 ?auto_557923 ) ) ( not ( = ?auto_557915 ?auto_557924 ) ) ( not ( = ?auto_557915 ?auto_557925 ) ) ( not ( = ?auto_557915 ?auto_557926 ) ) ( not ( = ?auto_557915 ?auto_557927 ) ) ( not ( = ?auto_557915 ?auto_557928 ) ) ( not ( = ?auto_557915 ?auto_557929 ) ) ( not ( = ?auto_557915 ?auto_557930 ) ) ( not ( = ?auto_557916 ?auto_557917 ) ) ( not ( = ?auto_557916 ?auto_557918 ) ) ( not ( = ?auto_557916 ?auto_557919 ) ) ( not ( = ?auto_557916 ?auto_557920 ) ) ( not ( = ?auto_557916 ?auto_557921 ) ) ( not ( = ?auto_557916 ?auto_557922 ) ) ( not ( = ?auto_557916 ?auto_557923 ) ) ( not ( = ?auto_557916 ?auto_557924 ) ) ( not ( = ?auto_557916 ?auto_557925 ) ) ( not ( = ?auto_557916 ?auto_557926 ) ) ( not ( = ?auto_557916 ?auto_557927 ) ) ( not ( = ?auto_557916 ?auto_557928 ) ) ( not ( = ?auto_557916 ?auto_557929 ) ) ( not ( = ?auto_557916 ?auto_557930 ) ) ( not ( = ?auto_557917 ?auto_557918 ) ) ( not ( = ?auto_557917 ?auto_557919 ) ) ( not ( = ?auto_557917 ?auto_557920 ) ) ( not ( = ?auto_557917 ?auto_557921 ) ) ( not ( = ?auto_557917 ?auto_557922 ) ) ( not ( = ?auto_557917 ?auto_557923 ) ) ( not ( = ?auto_557917 ?auto_557924 ) ) ( not ( = ?auto_557917 ?auto_557925 ) ) ( not ( = ?auto_557917 ?auto_557926 ) ) ( not ( = ?auto_557917 ?auto_557927 ) ) ( not ( = ?auto_557917 ?auto_557928 ) ) ( not ( = ?auto_557917 ?auto_557929 ) ) ( not ( = ?auto_557917 ?auto_557930 ) ) ( not ( = ?auto_557918 ?auto_557919 ) ) ( not ( = ?auto_557918 ?auto_557920 ) ) ( not ( = ?auto_557918 ?auto_557921 ) ) ( not ( = ?auto_557918 ?auto_557922 ) ) ( not ( = ?auto_557918 ?auto_557923 ) ) ( not ( = ?auto_557918 ?auto_557924 ) ) ( not ( = ?auto_557918 ?auto_557925 ) ) ( not ( = ?auto_557918 ?auto_557926 ) ) ( not ( = ?auto_557918 ?auto_557927 ) ) ( not ( = ?auto_557918 ?auto_557928 ) ) ( not ( = ?auto_557918 ?auto_557929 ) ) ( not ( = ?auto_557918 ?auto_557930 ) ) ( not ( = ?auto_557919 ?auto_557920 ) ) ( not ( = ?auto_557919 ?auto_557921 ) ) ( not ( = ?auto_557919 ?auto_557922 ) ) ( not ( = ?auto_557919 ?auto_557923 ) ) ( not ( = ?auto_557919 ?auto_557924 ) ) ( not ( = ?auto_557919 ?auto_557925 ) ) ( not ( = ?auto_557919 ?auto_557926 ) ) ( not ( = ?auto_557919 ?auto_557927 ) ) ( not ( = ?auto_557919 ?auto_557928 ) ) ( not ( = ?auto_557919 ?auto_557929 ) ) ( not ( = ?auto_557919 ?auto_557930 ) ) ( not ( = ?auto_557920 ?auto_557921 ) ) ( not ( = ?auto_557920 ?auto_557922 ) ) ( not ( = ?auto_557920 ?auto_557923 ) ) ( not ( = ?auto_557920 ?auto_557924 ) ) ( not ( = ?auto_557920 ?auto_557925 ) ) ( not ( = ?auto_557920 ?auto_557926 ) ) ( not ( = ?auto_557920 ?auto_557927 ) ) ( not ( = ?auto_557920 ?auto_557928 ) ) ( not ( = ?auto_557920 ?auto_557929 ) ) ( not ( = ?auto_557920 ?auto_557930 ) ) ( not ( = ?auto_557921 ?auto_557922 ) ) ( not ( = ?auto_557921 ?auto_557923 ) ) ( not ( = ?auto_557921 ?auto_557924 ) ) ( not ( = ?auto_557921 ?auto_557925 ) ) ( not ( = ?auto_557921 ?auto_557926 ) ) ( not ( = ?auto_557921 ?auto_557927 ) ) ( not ( = ?auto_557921 ?auto_557928 ) ) ( not ( = ?auto_557921 ?auto_557929 ) ) ( not ( = ?auto_557921 ?auto_557930 ) ) ( not ( = ?auto_557922 ?auto_557923 ) ) ( not ( = ?auto_557922 ?auto_557924 ) ) ( not ( = ?auto_557922 ?auto_557925 ) ) ( not ( = ?auto_557922 ?auto_557926 ) ) ( not ( = ?auto_557922 ?auto_557927 ) ) ( not ( = ?auto_557922 ?auto_557928 ) ) ( not ( = ?auto_557922 ?auto_557929 ) ) ( not ( = ?auto_557922 ?auto_557930 ) ) ( not ( = ?auto_557923 ?auto_557924 ) ) ( not ( = ?auto_557923 ?auto_557925 ) ) ( not ( = ?auto_557923 ?auto_557926 ) ) ( not ( = ?auto_557923 ?auto_557927 ) ) ( not ( = ?auto_557923 ?auto_557928 ) ) ( not ( = ?auto_557923 ?auto_557929 ) ) ( not ( = ?auto_557923 ?auto_557930 ) ) ( not ( = ?auto_557924 ?auto_557925 ) ) ( not ( = ?auto_557924 ?auto_557926 ) ) ( not ( = ?auto_557924 ?auto_557927 ) ) ( not ( = ?auto_557924 ?auto_557928 ) ) ( not ( = ?auto_557924 ?auto_557929 ) ) ( not ( = ?auto_557924 ?auto_557930 ) ) ( not ( = ?auto_557925 ?auto_557926 ) ) ( not ( = ?auto_557925 ?auto_557927 ) ) ( not ( = ?auto_557925 ?auto_557928 ) ) ( not ( = ?auto_557925 ?auto_557929 ) ) ( not ( = ?auto_557925 ?auto_557930 ) ) ( not ( = ?auto_557926 ?auto_557927 ) ) ( not ( = ?auto_557926 ?auto_557928 ) ) ( not ( = ?auto_557926 ?auto_557929 ) ) ( not ( = ?auto_557926 ?auto_557930 ) ) ( not ( = ?auto_557927 ?auto_557928 ) ) ( not ( = ?auto_557927 ?auto_557929 ) ) ( not ( = ?auto_557927 ?auto_557930 ) ) ( not ( = ?auto_557928 ?auto_557929 ) ) ( not ( = ?auto_557928 ?auto_557930 ) ) ( not ( = ?auto_557929 ?auto_557930 ) ) ( ON ?auto_557928 ?auto_557929 ) ( ON ?auto_557927 ?auto_557928 ) ( ON ?auto_557926 ?auto_557927 ) ( ON ?auto_557925 ?auto_557926 ) ( ON ?auto_557924 ?auto_557925 ) ( ON ?auto_557923 ?auto_557924 ) ( ON ?auto_557922 ?auto_557923 ) ( ON ?auto_557921 ?auto_557922 ) ( ON ?auto_557920 ?auto_557921 ) ( ON ?auto_557919 ?auto_557920 ) ( ON ?auto_557918 ?auto_557919 ) ( ON ?auto_557917 ?auto_557918 ) ( ON ?auto_557916 ?auto_557917 ) ( ON ?auto_557915 ?auto_557916 ) ( CLEAR ?auto_557915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_557915 )
      ( MAKE-15PILE ?auto_557915 ?auto_557916 ?auto_557917 ?auto_557918 ?auto_557919 ?auto_557920 ?auto_557921 ?auto_557922 ?auto_557923 ?auto_557924 ?auto_557925 ?auto_557926 ?auto_557927 ?auto_557928 ?auto_557929 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_557978 - BLOCK
      ?auto_557979 - BLOCK
      ?auto_557980 - BLOCK
      ?auto_557981 - BLOCK
      ?auto_557982 - BLOCK
      ?auto_557983 - BLOCK
      ?auto_557984 - BLOCK
      ?auto_557985 - BLOCK
      ?auto_557986 - BLOCK
      ?auto_557987 - BLOCK
      ?auto_557988 - BLOCK
      ?auto_557989 - BLOCK
      ?auto_557990 - BLOCK
      ?auto_557991 - BLOCK
      ?auto_557992 - BLOCK
      ?auto_557993 - BLOCK
    )
    :vars
    (
      ?auto_557994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_557992 ) ( ON ?auto_557993 ?auto_557994 ) ( CLEAR ?auto_557993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_557978 ) ( ON ?auto_557979 ?auto_557978 ) ( ON ?auto_557980 ?auto_557979 ) ( ON ?auto_557981 ?auto_557980 ) ( ON ?auto_557982 ?auto_557981 ) ( ON ?auto_557983 ?auto_557982 ) ( ON ?auto_557984 ?auto_557983 ) ( ON ?auto_557985 ?auto_557984 ) ( ON ?auto_557986 ?auto_557985 ) ( ON ?auto_557987 ?auto_557986 ) ( ON ?auto_557988 ?auto_557987 ) ( ON ?auto_557989 ?auto_557988 ) ( ON ?auto_557990 ?auto_557989 ) ( ON ?auto_557991 ?auto_557990 ) ( ON ?auto_557992 ?auto_557991 ) ( not ( = ?auto_557978 ?auto_557979 ) ) ( not ( = ?auto_557978 ?auto_557980 ) ) ( not ( = ?auto_557978 ?auto_557981 ) ) ( not ( = ?auto_557978 ?auto_557982 ) ) ( not ( = ?auto_557978 ?auto_557983 ) ) ( not ( = ?auto_557978 ?auto_557984 ) ) ( not ( = ?auto_557978 ?auto_557985 ) ) ( not ( = ?auto_557978 ?auto_557986 ) ) ( not ( = ?auto_557978 ?auto_557987 ) ) ( not ( = ?auto_557978 ?auto_557988 ) ) ( not ( = ?auto_557978 ?auto_557989 ) ) ( not ( = ?auto_557978 ?auto_557990 ) ) ( not ( = ?auto_557978 ?auto_557991 ) ) ( not ( = ?auto_557978 ?auto_557992 ) ) ( not ( = ?auto_557978 ?auto_557993 ) ) ( not ( = ?auto_557978 ?auto_557994 ) ) ( not ( = ?auto_557979 ?auto_557980 ) ) ( not ( = ?auto_557979 ?auto_557981 ) ) ( not ( = ?auto_557979 ?auto_557982 ) ) ( not ( = ?auto_557979 ?auto_557983 ) ) ( not ( = ?auto_557979 ?auto_557984 ) ) ( not ( = ?auto_557979 ?auto_557985 ) ) ( not ( = ?auto_557979 ?auto_557986 ) ) ( not ( = ?auto_557979 ?auto_557987 ) ) ( not ( = ?auto_557979 ?auto_557988 ) ) ( not ( = ?auto_557979 ?auto_557989 ) ) ( not ( = ?auto_557979 ?auto_557990 ) ) ( not ( = ?auto_557979 ?auto_557991 ) ) ( not ( = ?auto_557979 ?auto_557992 ) ) ( not ( = ?auto_557979 ?auto_557993 ) ) ( not ( = ?auto_557979 ?auto_557994 ) ) ( not ( = ?auto_557980 ?auto_557981 ) ) ( not ( = ?auto_557980 ?auto_557982 ) ) ( not ( = ?auto_557980 ?auto_557983 ) ) ( not ( = ?auto_557980 ?auto_557984 ) ) ( not ( = ?auto_557980 ?auto_557985 ) ) ( not ( = ?auto_557980 ?auto_557986 ) ) ( not ( = ?auto_557980 ?auto_557987 ) ) ( not ( = ?auto_557980 ?auto_557988 ) ) ( not ( = ?auto_557980 ?auto_557989 ) ) ( not ( = ?auto_557980 ?auto_557990 ) ) ( not ( = ?auto_557980 ?auto_557991 ) ) ( not ( = ?auto_557980 ?auto_557992 ) ) ( not ( = ?auto_557980 ?auto_557993 ) ) ( not ( = ?auto_557980 ?auto_557994 ) ) ( not ( = ?auto_557981 ?auto_557982 ) ) ( not ( = ?auto_557981 ?auto_557983 ) ) ( not ( = ?auto_557981 ?auto_557984 ) ) ( not ( = ?auto_557981 ?auto_557985 ) ) ( not ( = ?auto_557981 ?auto_557986 ) ) ( not ( = ?auto_557981 ?auto_557987 ) ) ( not ( = ?auto_557981 ?auto_557988 ) ) ( not ( = ?auto_557981 ?auto_557989 ) ) ( not ( = ?auto_557981 ?auto_557990 ) ) ( not ( = ?auto_557981 ?auto_557991 ) ) ( not ( = ?auto_557981 ?auto_557992 ) ) ( not ( = ?auto_557981 ?auto_557993 ) ) ( not ( = ?auto_557981 ?auto_557994 ) ) ( not ( = ?auto_557982 ?auto_557983 ) ) ( not ( = ?auto_557982 ?auto_557984 ) ) ( not ( = ?auto_557982 ?auto_557985 ) ) ( not ( = ?auto_557982 ?auto_557986 ) ) ( not ( = ?auto_557982 ?auto_557987 ) ) ( not ( = ?auto_557982 ?auto_557988 ) ) ( not ( = ?auto_557982 ?auto_557989 ) ) ( not ( = ?auto_557982 ?auto_557990 ) ) ( not ( = ?auto_557982 ?auto_557991 ) ) ( not ( = ?auto_557982 ?auto_557992 ) ) ( not ( = ?auto_557982 ?auto_557993 ) ) ( not ( = ?auto_557982 ?auto_557994 ) ) ( not ( = ?auto_557983 ?auto_557984 ) ) ( not ( = ?auto_557983 ?auto_557985 ) ) ( not ( = ?auto_557983 ?auto_557986 ) ) ( not ( = ?auto_557983 ?auto_557987 ) ) ( not ( = ?auto_557983 ?auto_557988 ) ) ( not ( = ?auto_557983 ?auto_557989 ) ) ( not ( = ?auto_557983 ?auto_557990 ) ) ( not ( = ?auto_557983 ?auto_557991 ) ) ( not ( = ?auto_557983 ?auto_557992 ) ) ( not ( = ?auto_557983 ?auto_557993 ) ) ( not ( = ?auto_557983 ?auto_557994 ) ) ( not ( = ?auto_557984 ?auto_557985 ) ) ( not ( = ?auto_557984 ?auto_557986 ) ) ( not ( = ?auto_557984 ?auto_557987 ) ) ( not ( = ?auto_557984 ?auto_557988 ) ) ( not ( = ?auto_557984 ?auto_557989 ) ) ( not ( = ?auto_557984 ?auto_557990 ) ) ( not ( = ?auto_557984 ?auto_557991 ) ) ( not ( = ?auto_557984 ?auto_557992 ) ) ( not ( = ?auto_557984 ?auto_557993 ) ) ( not ( = ?auto_557984 ?auto_557994 ) ) ( not ( = ?auto_557985 ?auto_557986 ) ) ( not ( = ?auto_557985 ?auto_557987 ) ) ( not ( = ?auto_557985 ?auto_557988 ) ) ( not ( = ?auto_557985 ?auto_557989 ) ) ( not ( = ?auto_557985 ?auto_557990 ) ) ( not ( = ?auto_557985 ?auto_557991 ) ) ( not ( = ?auto_557985 ?auto_557992 ) ) ( not ( = ?auto_557985 ?auto_557993 ) ) ( not ( = ?auto_557985 ?auto_557994 ) ) ( not ( = ?auto_557986 ?auto_557987 ) ) ( not ( = ?auto_557986 ?auto_557988 ) ) ( not ( = ?auto_557986 ?auto_557989 ) ) ( not ( = ?auto_557986 ?auto_557990 ) ) ( not ( = ?auto_557986 ?auto_557991 ) ) ( not ( = ?auto_557986 ?auto_557992 ) ) ( not ( = ?auto_557986 ?auto_557993 ) ) ( not ( = ?auto_557986 ?auto_557994 ) ) ( not ( = ?auto_557987 ?auto_557988 ) ) ( not ( = ?auto_557987 ?auto_557989 ) ) ( not ( = ?auto_557987 ?auto_557990 ) ) ( not ( = ?auto_557987 ?auto_557991 ) ) ( not ( = ?auto_557987 ?auto_557992 ) ) ( not ( = ?auto_557987 ?auto_557993 ) ) ( not ( = ?auto_557987 ?auto_557994 ) ) ( not ( = ?auto_557988 ?auto_557989 ) ) ( not ( = ?auto_557988 ?auto_557990 ) ) ( not ( = ?auto_557988 ?auto_557991 ) ) ( not ( = ?auto_557988 ?auto_557992 ) ) ( not ( = ?auto_557988 ?auto_557993 ) ) ( not ( = ?auto_557988 ?auto_557994 ) ) ( not ( = ?auto_557989 ?auto_557990 ) ) ( not ( = ?auto_557989 ?auto_557991 ) ) ( not ( = ?auto_557989 ?auto_557992 ) ) ( not ( = ?auto_557989 ?auto_557993 ) ) ( not ( = ?auto_557989 ?auto_557994 ) ) ( not ( = ?auto_557990 ?auto_557991 ) ) ( not ( = ?auto_557990 ?auto_557992 ) ) ( not ( = ?auto_557990 ?auto_557993 ) ) ( not ( = ?auto_557990 ?auto_557994 ) ) ( not ( = ?auto_557991 ?auto_557992 ) ) ( not ( = ?auto_557991 ?auto_557993 ) ) ( not ( = ?auto_557991 ?auto_557994 ) ) ( not ( = ?auto_557992 ?auto_557993 ) ) ( not ( = ?auto_557992 ?auto_557994 ) ) ( not ( = ?auto_557993 ?auto_557994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_557993 ?auto_557994 )
      ( !STACK ?auto_557993 ?auto_557992 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558011 - BLOCK
      ?auto_558012 - BLOCK
      ?auto_558013 - BLOCK
      ?auto_558014 - BLOCK
      ?auto_558015 - BLOCK
      ?auto_558016 - BLOCK
      ?auto_558017 - BLOCK
      ?auto_558018 - BLOCK
      ?auto_558019 - BLOCK
      ?auto_558020 - BLOCK
      ?auto_558021 - BLOCK
      ?auto_558022 - BLOCK
      ?auto_558023 - BLOCK
      ?auto_558024 - BLOCK
      ?auto_558025 - BLOCK
      ?auto_558026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_558025 ) ( ON-TABLE ?auto_558026 ) ( CLEAR ?auto_558026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_558011 ) ( ON ?auto_558012 ?auto_558011 ) ( ON ?auto_558013 ?auto_558012 ) ( ON ?auto_558014 ?auto_558013 ) ( ON ?auto_558015 ?auto_558014 ) ( ON ?auto_558016 ?auto_558015 ) ( ON ?auto_558017 ?auto_558016 ) ( ON ?auto_558018 ?auto_558017 ) ( ON ?auto_558019 ?auto_558018 ) ( ON ?auto_558020 ?auto_558019 ) ( ON ?auto_558021 ?auto_558020 ) ( ON ?auto_558022 ?auto_558021 ) ( ON ?auto_558023 ?auto_558022 ) ( ON ?auto_558024 ?auto_558023 ) ( ON ?auto_558025 ?auto_558024 ) ( not ( = ?auto_558011 ?auto_558012 ) ) ( not ( = ?auto_558011 ?auto_558013 ) ) ( not ( = ?auto_558011 ?auto_558014 ) ) ( not ( = ?auto_558011 ?auto_558015 ) ) ( not ( = ?auto_558011 ?auto_558016 ) ) ( not ( = ?auto_558011 ?auto_558017 ) ) ( not ( = ?auto_558011 ?auto_558018 ) ) ( not ( = ?auto_558011 ?auto_558019 ) ) ( not ( = ?auto_558011 ?auto_558020 ) ) ( not ( = ?auto_558011 ?auto_558021 ) ) ( not ( = ?auto_558011 ?auto_558022 ) ) ( not ( = ?auto_558011 ?auto_558023 ) ) ( not ( = ?auto_558011 ?auto_558024 ) ) ( not ( = ?auto_558011 ?auto_558025 ) ) ( not ( = ?auto_558011 ?auto_558026 ) ) ( not ( = ?auto_558012 ?auto_558013 ) ) ( not ( = ?auto_558012 ?auto_558014 ) ) ( not ( = ?auto_558012 ?auto_558015 ) ) ( not ( = ?auto_558012 ?auto_558016 ) ) ( not ( = ?auto_558012 ?auto_558017 ) ) ( not ( = ?auto_558012 ?auto_558018 ) ) ( not ( = ?auto_558012 ?auto_558019 ) ) ( not ( = ?auto_558012 ?auto_558020 ) ) ( not ( = ?auto_558012 ?auto_558021 ) ) ( not ( = ?auto_558012 ?auto_558022 ) ) ( not ( = ?auto_558012 ?auto_558023 ) ) ( not ( = ?auto_558012 ?auto_558024 ) ) ( not ( = ?auto_558012 ?auto_558025 ) ) ( not ( = ?auto_558012 ?auto_558026 ) ) ( not ( = ?auto_558013 ?auto_558014 ) ) ( not ( = ?auto_558013 ?auto_558015 ) ) ( not ( = ?auto_558013 ?auto_558016 ) ) ( not ( = ?auto_558013 ?auto_558017 ) ) ( not ( = ?auto_558013 ?auto_558018 ) ) ( not ( = ?auto_558013 ?auto_558019 ) ) ( not ( = ?auto_558013 ?auto_558020 ) ) ( not ( = ?auto_558013 ?auto_558021 ) ) ( not ( = ?auto_558013 ?auto_558022 ) ) ( not ( = ?auto_558013 ?auto_558023 ) ) ( not ( = ?auto_558013 ?auto_558024 ) ) ( not ( = ?auto_558013 ?auto_558025 ) ) ( not ( = ?auto_558013 ?auto_558026 ) ) ( not ( = ?auto_558014 ?auto_558015 ) ) ( not ( = ?auto_558014 ?auto_558016 ) ) ( not ( = ?auto_558014 ?auto_558017 ) ) ( not ( = ?auto_558014 ?auto_558018 ) ) ( not ( = ?auto_558014 ?auto_558019 ) ) ( not ( = ?auto_558014 ?auto_558020 ) ) ( not ( = ?auto_558014 ?auto_558021 ) ) ( not ( = ?auto_558014 ?auto_558022 ) ) ( not ( = ?auto_558014 ?auto_558023 ) ) ( not ( = ?auto_558014 ?auto_558024 ) ) ( not ( = ?auto_558014 ?auto_558025 ) ) ( not ( = ?auto_558014 ?auto_558026 ) ) ( not ( = ?auto_558015 ?auto_558016 ) ) ( not ( = ?auto_558015 ?auto_558017 ) ) ( not ( = ?auto_558015 ?auto_558018 ) ) ( not ( = ?auto_558015 ?auto_558019 ) ) ( not ( = ?auto_558015 ?auto_558020 ) ) ( not ( = ?auto_558015 ?auto_558021 ) ) ( not ( = ?auto_558015 ?auto_558022 ) ) ( not ( = ?auto_558015 ?auto_558023 ) ) ( not ( = ?auto_558015 ?auto_558024 ) ) ( not ( = ?auto_558015 ?auto_558025 ) ) ( not ( = ?auto_558015 ?auto_558026 ) ) ( not ( = ?auto_558016 ?auto_558017 ) ) ( not ( = ?auto_558016 ?auto_558018 ) ) ( not ( = ?auto_558016 ?auto_558019 ) ) ( not ( = ?auto_558016 ?auto_558020 ) ) ( not ( = ?auto_558016 ?auto_558021 ) ) ( not ( = ?auto_558016 ?auto_558022 ) ) ( not ( = ?auto_558016 ?auto_558023 ) ) ( not ( = ?auto_558016 ?auto_558024 ) ) ( not ( = ?auto_558016 ?auto_558025 ) ) ( not ( = ?auto_558016 ?auto_558026 ) ) ( not ( = ?auto_558017 ?auto_558018 ) ) ( not ( = ?auto_558017 ?auto_558019 ) ) ( not ( = ?auto_558017 ?auto_558020 ) ) ( not ( = ?auto_558017 ?auto_558021 ) ) ( not ( = ?auto_558017 ?auto_558022 ) ) ( not ( = ?auto_558017 ?auto_558023 ) ) ( not ( = ?auto_558017 ?auto_558024 ) ) ( not ( = ?auto_558017 ?auto_558025 ) ) ( not ( = ?auto_558017 ?auto_558026 ) ) ( not ( = ?auto_558018 ?auto_558019 ) ) ( not ( = ?auto_558018 ?auto_558020 ) ) ( not ( = ?auto_558018 ?auto_558021 ) ) ( not ( = ?auto_558018 ?auto_558022 ) ) ( not ( = ?auto_558018 ?auto_558023 ) ) ( not ( = ?auto_558018 ?auto_558024 ) ) ( not ( = ?auto_558018 ?auto_558025 ) ) ( not ( = ?auto_558018 ?auto_558026 ) ) ( not ( = ?auto_558019 ?auto_558020 ) ) ( not ( = ?auto_558019 ?auto_558021 ) ) ( not ( = ?auto_558019 ?auto_558022 ) ) ( not ( = ?auto_558019 ?auto_558023 ) ) ( not ( = ?auto_558019 ?auto_558024 ) ) ( not ( = ?auto_558019 ?auto_558025 ) ) ( not ( = ?auto_558019 ?auto_558026 ) ) ( not ( = ?auto_558020 ?auto_558021 ) ) ( not ( = ?auto_558020 ?auto_558022 ) ) ( not ( = ?auto_558020 ?auto_558023 ) ) ( not ( = ?auto_558020 ?auto_558024 ) ) ( not ( = ?auto_558020 ?auto_558025 ) ) ( not ( = ?auto_558020 ?auto_558026 ) ) ( not ( = ?auto_558021 ?auto_558022 ) ) ( not ( = ?auto_558021 ?auto_558023 ) ) ( not ( = ?auto_558021 ?auto_558024 ) ) ( not ( = ?auto_558021 ?auto_558025 ) ) ( not ( = ?auto_558021 ?auto_558026 ) ) ( not ( = ?auto_558022 ?auto_558023 ) ) ( not ( = ?auto_558022 ?auto_558024 ) ) ( not ( = ?auto_558022 ?auto_558025 ) ) ( not ( = ?auto_558022 ?auto_558026 ) ) ( not ( = ?auto_558023 ?auto_558024 ) ) ( not ( = ?auto_558023 ?auto_558025 ) ) ( not ( = ?auto_558023 ?auto_558026 ) ) ( not ( = ?auto_558024 ?auto_558025 ) ) ( not ( = ?auto_558024 ?auto_558026 ) ) ( not ( = ?auto_558025 ?auto_558026 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_558026 )
      ( !STACK ?auto_558026 ?auto_558025 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558043 - BLOCK
      ?auto_558044 - BLOCK
      ?auto_558045 - BLOCK
      ?auto_558046 - BLOCK
      ?auto_558047 - BLOCK
      ?auto_558048 - BLOCK
      ?auto_558049 - BLOCK
      ?auto_558050 - BLOCK
      ?auto_558051 - BLOCK
      ?auto_558052 - BLOCK
      ?auto_558053 - BLOCK
      ?auto_558054 - BLOCK
      ?auto_558055 - BLOCK
      ?auto_558056 - BLOCK
      ?auto_558057 - BLOCK
      ?auto_558058 - BLOCK
    )
    :vars
    (
      ?auto_558059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558058 ?auto_558059 ) ( ON-TABLE ?auto_558043 ) ( ON ?auto_558044 ?auto_558043 ) ( ON ?auto_558045 ?auto_558044 ) ( ON ?auto_558046 ?auto_558045 ) ( ON ?auto_558047 ?auto_558046 ) ( ON ?auto_558048 ?auto_558047 ) ( ON ?auto_558049 ?auto_558048 ) ( ON ?auto_558050 ?auto_558049 ) ( ON ?auto_558051 ?auto_558050 ) ( ON ?auto_558052 ?auto_558051 ) ( ON ?auto_558053 ?auto_558052 ) ( ON ?auto_558054 ?auto_558053 ) ( ON ?auto_558055 ?auto_558054 ) ( ON ?auto_558056 ?auto_558055 ) ( not ( = ?auto_558043 ?auto_558044 ) ) ( not ( = ?auto_558043 ?auto_558045 ) ) ( not ( = ?auto_558043 ?auto_558046 ) ) ( not ( = ?auto_558043 ?auto_558047 ) ) ( not ( = ?auto_558043 ?auto_558048 ) ) ( not ( = ?auto_558043 ?auto_558049 ) ) ( not ( = ?auto_558043 ?auto_558050 ) ) ( not ( = ?auto_558043 ?auto_558051 ) ) ( not ( = ?auto_558043 ?auto_558052 ) ) ( not ( = ?auto_558043 ?auto_558053 ) ) ( not ( = ?auto_558043 ?auto_558054 ) ) ( not ( = ?auto_558043 ?auto_558055 ) ) ( not ( = ?auto_558043 ?auto_558056 ) ) ( not ( = ?auto_558043 ?auto_558057 ) ) ( not ( = ?auto_558043 ?auto_558058 ) ) ( not ( = ?auto_558043 ?auto_558059 ) ) ( not ( = ?auto_558044 ?auto_558045 ) ) ( not ( = ?auto_558044 ?auto_558046 ) ) ( not ( = ?auto_558044 ?auto_558047 ) ) ( not ( = ?auto_558044 ?auto_558048 ) ) ( not ( = ?auto_558044 ?auto_558049 ) ) ( not ( = ?auto_558044 ?auto_558050 ) ) ( not ( = ?auto_558044 ?auto_558051 ) ) ( not ( = ?auto_558044 ?auto_558052 ) ) ( not ( = ?auto_558044 ?auto_558053 ) ) ( not ( = ?auto_558044 ?auto_558054 ) ) ( not ( = ?auto_558044 ?auto_558055 ) ) ( not ( = ?auto_558044 ?auto_558056 ) ) ( not ( = ?auto_558044 ?auto_558057 ) ) ( not ( = ?auto_558044 ?auto_558058 ) ) ( not ( = ?auto_558044 ?auto_558059 ) ) ( not ( = ?auto_558045 ?auto_558046 ) ) ( not ( = ?auto_558045 ?auto_558047 ) ) ( not ( = ?auto_558045 ?auto_558048 ) ) ( not ( = ?auto_558045 ?auto_558049 ) ) ( not ( = ?auto_558045 ?auto_558050 ) ) ( not ( = ?auto_558045 ?auto_558051 ) ) ( not ( = ?auto_558045 ?auto_558052 ) ) ( not ( = ?auto_558045 ?auto_558053 ) ) ( not ( = ?auto_558045 ?auto_558054 ) ) ( not ( = ?auto_558045 ?auto_558055 ) ) ( not ( = ?auto_558045 ?auto_558056 ) ) ( not ( = ?auto_558045 ?auto_558057 ) ) ( not ( = ?auto_558045 ?auto_558058 ) ) ( not ( = ?auto_558045 ?auto_558059 ) ) ( not ( = ?auto_558046 ?auto_558047 ) ) ( not ( = ?auto_558046 ?auto_558048 ) ) ( not ( = ?auto_558046 ?auto_558049 ) ) ( not ( = ?auto_558046 ?auto_558050 ) ) ( not ( = ?auto_558046 ?auto_558051 ) ) ( not ( = ?auto_558046 ?auto_558052 ) ) ( not ( = ?auto_558046 ?auto_558053 ) ) ( not ( = ?auto_558046 ?auto_558054 ) ) ( not ( = ?auto_558046 ?auto_558055 ) ) ( not ( = ?auto_558046 ?auto_558056 ) ) ( not ( = ?auto_558046 ?auto_558057 ) ) ( not ( = ?auto_558046 ?auto_558058 ) ) ( not ( = ?auto_558046 ?auto_558059 ) ) ( not ( = ?auto_558047 ?auto_558048 ) ) ( not ( = ?auto_558047 ?auto_558049 ) ) ( not ( = ?auto_558047 ?auto_558050 ) ) ( not ( = ?auto_558047 ?auto_558051 ) ) ( not ( = ?auto_558047 ?auto_558052 ) ) ( not ( = ?auto_558047 ?auto_558053 ) ) ( not ( = ?auto_558047 ?auto_558054 ) ) ( not ( = ?auto_558047 ?auto_558055 ) ) ( not ( = ?auto_558047 ?auto_558056 ) ) ( not ( = ?auto_558047 ?auto_558057 ) ) ( not ( = ?auto_558047 ?auto_558058 ) ) ( not ( = ?auto_558047 ?auto_558059 ) ) ( not ( = ?auto_558048 ?auto_558049 ) ) ( not ( = ?auto_558048 ?auto_558050 ) ) ( not ( = ?auto_558048 ?auto_558051 ) ) ( not ( = ?auto_558048 ?auto_558052 ) ) ( not ( = ?auto_558048 ?auto_558053 ) ) ( not ( = ?auto_558048 ?auto_558054 ) ) ( not ( = ?auto_558048 ?auto_558055 ) ) ( not ( = ?auto_558048 ?auto_558056 ) ) ( not ( = ?auto_558048 ?auto_558057 ) ) ( not ( = ?auto_558048 ?auto_558058 ) ) ( not ( = ?auto_558048 ?auto_558059 ) ) ( not ( = ?auto_558049 ?auto_558050 ) ) ( not ( = ?auto_558049 ?auto_558051 ) ) ( not ( = ?auto_558049 ?auto_558052 ) ) ( not ( = ?auto_558049 ?auto_558053 ) ) ( not ( = ?auto_558049 ?auto_558054 ) ) ( not ( = ?auto_558049 ?auto_558055 ) ) ( not ( = ?auto_558049 ?auto_558056 ) ) ( not ( = ?auto_558049 ?auto_558057 ) ) ( not ( = ?auto_558049 ?auto_558058 ) ) ( not ( = ?auto_558049 ?auto_558059 ) ) ( not ( = ?auto_558050 ?auto_558051 ) ) ( not ( = ?auto_558050 ?auto_558052 ) ) ( not ( = ?auto_558050 ?auto_558053 ) ) ( not ( = ?auto_558050 ?auto_558054 ) ) ( not ( = ?auto_558050 ?auto_558055 ) ) ( not ( = ?auto_558050 ?auto_558056 ) ) ( not ( = ?auto_558050 ?auto_558057 ) ) ( not ( = ?auto_558050 ?auto_558058 ) ) ( not ( = ?auto_558050 ?auto_558059 ) ) ( not ( = ?auto_558051 ?auto_558052 ) ) ( not ( = ?auto_558051 ?auto_558053 ) ) ( not ( = ?auto_558051 ?auto_558054 ) ) ( not ( = ?auto_558051 ?auto_558055 ) ) ( not ( = ?auto_558051 ?auto_558056 ) ) ( not ( = ?auto_558051 ?auto_558057 ) ) ( not ( = ?auto_558051 ?auto_558058 ) ) ( not ( = ?auto_558051 ?auto_558059 ) ) ( not ( = ?auto_558052 ?auto_558053 ) ) ( not ( = ?auto_558052 ?auto_558054 ) ) ( not ( = ?auto_558052 ?auto_558055 ) ) ( not ( = ?auto_558052 ?auto_558056 ) ) ( not ( = ?auto_558052 ?auto_558057 ) ) ( not ( = ?auto_558052 ?auto_558058 ) ) ( not ( = ?auto_558052 ?auto_558059 ) ) ( not ( = ?auto_558053 ?auto_558054 ) ) ( not ( = ?auto_558053 ?auto_558055 ) ) ( not ( = ?auto_558053 ?auto_558056 ) ) ( not ( = ?auto_558053 ?auto_558057 ) ) ( not ( = ?auto_558053 ?auto_558058 ) ) ( not ( = ?auto_558053 ?auto_558059 ) ) ( not ( = ?auto_558054 ?auto_558055 ) ) ( not ( = ?auto_558054 ?auto_558056 ) ) ( not ( = ?auto_558054 ?auto_558057 ) ) ( not ( = ?auto_558054 ?auto_558058 ) ) ( not ( = ?auto_558054 ?auto_558059 ) ) ( not ( = ?auto_558055 ?auto_558056 ) ) ( not ( = ?auto_558055 ?auto_558057 ) ) ( not ( = ?auto_558055 ?auto_558058 ) ) ( not ( = ?auto_558055 ?auto_558059 ) ) ( not ( = ?auto_558056 ?auto_558057 ) ) ( not ( = ?auto_558056 ?auto_558058 ) ) ( not ( = ?auto_558056 ?auto_558059 ) ) ( not ( = ?auto_558057 ?auto_558058 ) ) ( not ( = ?auto_558057 ?auto_558059 ) ) ( not ( = ?auto_558058 ?auto_558059 ) ) ( CLEAR ?auto_558056 ) ( ON ?auto_558057 ?auto_558058 ) ( CLEAR ?auto_558057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_558043 ?auto_558044 ?auto_558045 ?auto_558046 ?auto_558047 ?auto_558048 ?auto_558049 ?auto_558050 ?auto_558051 ?auto_558052 ?auto_558053 ?auto_558054 ?auto_558055 ?auto_558056 ?auto_558057 )
      ( MAKE-16PILE ?auto_558043 ?auto_558044 ?auto_558045 ?auto_558046 ?auto_558047 ?auto_558048 ?auto_558049 ?auto_558050 ?auto_558051 ?auto_558052 ?auto_558053 ?auto_558054 ?auto_558055 ?auto_558056 ?auto_558057 ?auto_558058 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558076 - BLOCK
      ?auto_558077 - BLOCK
      ?auto_558078 - BLOCK
      ?auto_558079 - BLOCK
      ?auto_558080 - BLOCK
      ?auto_558081 - BLOCK
      ?auto_558082 - BLOCK
      ?auto_558083 - BLOCK
      ?auto_558084 - BLOCK
      ?auto_558085 - BLOCK
      ?auto_558086 - BLOCK
      ?auto_558087 - BLOCK
      ?auto_558088 - BLOCK
      ?auto_558089 - BLOCK
      ?auto_558090 - BLOCK
      ?auto_558091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558091 ) ( ON-TABLE ?auto_558076 ) ( ON ?auto_558077 ?auto_558076 ) ( ON ?auto_558078 ?auto_558077 ) ( ON ?auto_558079 ?auto_558078 ) ( ON ?auto_558080 ?auto_558079 ) ( ON ?auto_558081 ?auto_558080 ) ( ON ?auto_558082 ?auto_558081 ) ( ON ?auto_558083 ?auto_558082 ) ( ON ?auto_558084 ?auto_558083 ) ( ON ?auto_558085 ?auto_558084 ) ( ON ?auto_558086 ?auto_558085 ) ( ON ?auto_558087 ?auto_558086 ) ( ON ?auto_558088 ?auto_558087 ) ( ON ?auto_558089 ?auto_558088 ) ( not ( = ?auto_558076 ?auto_558077 ) ) ( not ( = ?auto_558076 ?auto_558078 ) ) ( not ( = ?auto_558076 ?auto_558079 ) ) ( not ( = ?auto_558076 ?auto_558080 ) ) ( not ( = ?auto_558076 ?auto_558081 ) ) ( not ( = ?auto_558076 ?auto_558082 ) ) ( not ( = ?auto_558076 ?auto_558083 ) ) ( not ( = ?auto_558076 ?auto_558084 ) ) ( not ( = ?auto_558076 ?auto_558085 ) ) ( not ( = ?auto_558076 ?auto_558086 ) ) ( not ( = ?auto_558076 ?auto_558087 ) ) ( not ( = ?auto_558076 ?auto_558088 ) ) ( not ( = ?auto_558076 ?auto_558089 ) ) ( not ( = ?auto_558076 ?auto_558090 ) ) ( not ( = ?auto_558076 ?auto_558091 ) ) ( not ( = ?auto_558077 ?auto_558078 ) ) ( not ( = ?auto_558077 ?auto_558079 ) ) ( not ( = ?auto_558077 ?auto_558080 ) ) ( not ( = ?auto_558077 ?auto_558081 ) ) ( not ( = ?auto_558077 ?auto_558082 ) ) ( not ( = ?auto_558077 ?auto_558083 ) ) ( not ( = ?auto_558077 ?auto_558084 ) ) ( not ( = ?auto_558077 ?auto_558085 ) ) ( not ( = ?auto_558077 ?auto_558086 ) ) ( not ( = ?auto_558077 ?auto_558087 ) ) ( not ( = ?auto_558077 ?auto_558088 ) ) ( not ( = ?auto_558077 ?auto_558089 ) ) ( not ( = ?auto_558077 ?auto_558090 ) ) ( not ( = ?auto_558077 ?auto_558091 ) ) ( not ( = ?auto_558078 ?auto_558079 ) ) ( not ( = ?auto_558078 ?auto_558080 ) ) ( not ( = ?auto_558078 ?auto_558081 ) ) ( not ( = ?auto_558078 ?auto_558082 ) ) ( not ( = ?auto_558078 ?auto_558083 ) ) ( not ( = ?auto_558078 ?auto_558084 ) ) ( not ( = ?auto_558078 ?auto_558085 ) ) ( not ( = ?auto_558078 ?auto_558086 ) ) ( not ( = ?auto_558078 ?auto_558087 ) ) ( not ( = ?auto_558078 ?auto_558088 ) ) ( not ( = ?auto_558078 ?auto_558089 ) ) ( not ( = ?auto_558078 ?auto_558090 ) ) ( not ( = ?auto_558078 ?auto_558091 ) ) ( not ( = ?auto_558079 ?auto_558080 ) ) ( not ( = ?auto_558079 ?auto_558081 ) ) ( not ( = ?auto_558079 ?auto_558082 ) ) ( not ( = ?auto_558079 ?auto_558083 ) ) ( not ( = ?auto_558079 ?auto_558084 ) ) ( not ( = ?auto_558079 ?auto_558085 ) ) ( not ( = ?auto_558079 ?auto_558086 ) ) ( not ( = ?auto_558079 ?auto_558087 ) ) ( not ( = ?auto_558079 ?auto_558088 ) ) ( not ( = ?auto_558079 ?auto_558089 ) ) ( not ( = ?auto_558079 ?auto_558090 ) ) ( not ( = ?auto_558079 ?auto_558091 ) ) ( not ( = ?auto_558080 ?auto_558081 ) ) ( not ( = ?auto_558080 ?auto_558082 ) ) ( not ( = ?auto_558080 ?auto_558083 ) ) ( not ( = ?auto_558080 ?auto_558084 ) ) ( not ( = ?auto_558080 ?auto_558085 ) ) ( not ( = ?auto_558080 ?auto_558086 ) ) ( not ( = ?auto_558080 ?auto_558087 ) ) ( not ( = ?auto_558080 ?auto_558088 ) ) ( not ( = ?auto_558080 ?auto_558089 ) ) ( not ( = ?auto_558080 ?auto_558090 ) ) ( not ( = ?auto_558080 ?auto_558091 ) ) ( not ( = ?auto_558081 ?auto_558082 ) ) ( not ( = ?auto_558081 ?auto_558083 ) ) ( not ( = ?auto_558081 ?auto_558084 ) ) ( not ( = ?auto_558081 ?auto_558085 ) ) ( not ( = ?auto_558081 ?auto_558086 ) ) ( not ( = ?auto_558081 ?auto_558087 ) ) ( not ( = ?auto_558081 ?auto_558088 ) ) ( not ( = ?auto_558081 ?auto_558089 ) ) ( not ( = ?auto_558081 ?auto_558090 ) ) ( not ( = ?auto_558081 ?auto_558091 ) ) ( not ( = ?auto_558082 ?auto_558083 ) ) ( not ( = ?auto_558082 ?auto_558084 ) ) ( not ( = ?auto_558082 ?auto_558085 ) ) ( not ( = ?auto_558082 ?auto_558086 ) ) ( not ( = ?auto_558082 ?auto_558087 ) ) ( not ( = ?auto_558082 ?auto_558088 ) ) ( not ( = ?auto_558082 ?auto_558089 ) ) ( not ( = ?auto_558082 ?auto_558090 ) ) ( not ( = ?auto_558082 ?auto_558091 ) ) ( not ( = ?auto_558083 ?auto_558084 ) ) ( not ( = ?auto_558083 ?auto_558085 ) ) ( not ( = ?auto_558083 ?auto_558086 ) ) ( not ( = ?auto_558083 ?auto_558087 ) ) ( not ( = ?auto_558083 ?auto_558088 ) ) ( not ( = ?auto_558083 ?auto_558089 ) ) ( not ( = ?auto_558083 ?auto_558090 ) ) ( not ( = ?auto_558083 ?auto_558091 ) ) ( not ( = ?auto_558084 ?auto_558085 ) ) ( not ( = ?auto_558084 ?auto_558086 ) ) ( not ( = ?auto_558084 ?auto_558087 ) ) ( not ( = ?auto_558084 ?auto_558088 ) ) ( not ( = ?auto_558084 ?auto_558089 ) ) ( not ( = ?auto_558084 ?auto_558090 ) ) ( not ( = ?auto_558084 ?auto_558091 ) ) ( not ( = ?auto_558085 ?auto_558086 ) ) ( not ( = ?auto_558085 ?auto_558087 ) ) ( not ( = ?auto_558085 ?auto_558088 ) ) ( not ( = ?auto_558085 ?auto_558089 ) ) ( not ( = ?auto_558085 ?auto_558090 ) ) ( not ( = ?auto_558085 ?auto_558091 ) ) ( not ( = ?auto_558086 ?auto_558087 ) ) ( not ( = ?auto_558086 ?auto_558088 ) ) ( not ( = ?auto_558086 ?auto_558089 ) ) ( not ( = ?auto_558086 ?auto_558090 ) ) ( not ( = ?auto_558086 ?auto_558091 ) ) ( not ( = ?auto_558087 ?auto_558088 ) ) ( not ( = ?auto_558087 ?auto_558089 ) ) ( not ( = ?auto_558087 ?auto_558090 ) ) ( not ( = ?auto_558087 ?auto_558091 ) ) ( not ( = ?auto_558088 ?auto_558089 ) ) ( not ( = ?auto_558088 ?auto_558090 ) ) ( not ( = ?auto_558088 ?auto_558091 ) ) ( not ( = ?auto_558089 ?auto_558090 ) ) ( not ( = ?auto_558089 ?auto_558091 ) ) ( not ( = ?auto_558090 ?auto_558091 ) ) ( CLEAR ?auto_558089 ) ( ON ?auto_558090 ?auto_558091 ) ( CLEAR ?auto_558090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_558076 ?auto_558077 ?auto_558078 ?auto_558079 ?auto_558080 ?auto_558081 ?auto_558082 ?auto_558083 ?auto_558084 ?auto_558085 ?auto_558086 ?auto_558087 ?auto_558088 ?auto_558089 ?auto_558090 )
      ( MAKE-16PILE ?auto_558076 ?auto_558077 ?auto_558078 ?auto_558079 ?auto_558080 ?auto_558081 ?auto_558082 ?auto_558083 ?auto_558084 ?auto_558085 ?auto_558086 ?auto_558087 ?auto_558088 ?auto_558089 ?auto_558090 ?auto_558091 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558108 - BLOCK
      ?auto_558109 - BLOCK
      ?auto_558110 - BLOCK
      ?auto_558111 - BLOCK
      ?auto_558112 - BLOCK
      ?auto_558113 - BLOCK
      ?auto_558114 - BLOCK
      ?auto_558115 - BLOCK
      ?auto_558116 - BLOCK
      ?auto_558117 - BLOCK
      ?auto_558118 - BLOCK
      ?auto_558119 - BLOCK
      ?auto_558120 - BLOCK
      ?auto_558121 - BLOCK
      ?auto_558122 - BLOCK
      ?auto_558123 - BLOCK
    )
    :vars
    (
      ?auto_558124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558123 ?auto_558124 ) ( ON-TABLE ?auto_558108 ) ( ON ?auto_558109 ?auto_558108 ) ( ON ?auto_558110 ?auto_558109 ) ( ON ?auto_558111 ?auto_558110 ) ( ON ?auto_558112 ?auto_558111 ) ( ON ?auto_558113 ?auto_558112 ) ( ON ?auto_558114 ?auto_558113 ) ( ON ?auto_558115 ?auto_558114 ) ( ON ?auto_558116 ?auto_558115 ) ( ON ?auto_558117 ?auto_558116 ) ( ON ?auto_558118 ?auto_558117 ) ( ON ?auto_558119 ?auto_558118 ) ( ON ?auto_558120 ?auto_558119 ) ( not ( = ?auto_558108 ?auto_558109 ) ) ( not ( = ?auto_558108 ?auto_558110 ) ) ( not ( = ?auto_558108 ?auto_558111 ) ) ( not ( = ?auto_558108 ?auto_558112 ) ) ( not ( = ?auto_558108 ?auto_558113 ) ) ( not ( = ?auto_558108 ?auto_558114 ) ) ( not ( = ?auto_558108 ?auto_558115 ) ) ( not ( = ?auto_558108 ?auto_558116 ) ) ( not ( = ?auto_558108 ?auto_558117 ) ) ( not ( = ?auto_558108 ?auto_558118 ) ) ( not ( = ?auto_558108 ?auto_558119 ) ) ( not ( = ?auto_558108 ?auto_558120 ) ) ( not ( = ?auto_558108 ?auto_558121 ) ) ( not ( = ?auto_558108 ?auto_558122 ) ) ( not ( = ?auto_558108 ?auto_558123 ) ) ( not ( = ?auto_558108 ?auto_558124 ) ) ( not ( = ?auto_558109 ?auto_558110 ) ) ( not ( = ?auto_558109 ?auto_558111 ) ) ( not ( = ?auto_558109 ?auto_558112 ) ) ( not ( = ?auto_558109 ?auto_558113 ) ) ( not ( = ?auto_558109 ?auto_558114 ) ) ( not ( = ?auto_558109 ?auto_558115 ) ) ( not ( = ?auto_558109 ?auto_558116 ) ) ( not ( = ?auto_558109 ?auto_558117 ) ) ( not ( = ?auto_558109 ?auto_558118 ) ) ( not ( = ?auto_558109 ?auto_558119 ) ) ( not ( = ?auto_558109 ?auto_558120 ) ) ( not ( = ?auto_558109 ?auto_558121 ) ) ( not ( = ?auto_558109 ?auto_558122 ) ) ( not ( = ?auto_558109 ?auto_558123 ) ) ( not ( = ?auto_558109 ?auto_558124 ) ) ( not ( = ?auto_558110 ?auto_558111 ) ) ( not ( = ?auto_558110 ?auto_558112 ) ) ( not ( = ?auto_558110 ?auto_558113 ) ) ( not ( = ?auto_558110 ?auto_558114 ) ) ( not ( = ?auto_558110 ?auto_558115 ) ) ( not ( = ?auto_558110 ?auto_558116 ) ) ( not ( = ?auto_558110 ?auto_558117 ) ) ( not ( = ?auto_558110 ?auto_558118 ) ) ( not ( = ?auto_558110 ?auto_558119 ) ) ( not ( = ?auto_558110 ?auto_558120 ) ) ( not ( = ?auto_558110 ?auto_558121 ) ) ( not ( = ?auto_558110 ?auto_558122 ) ) ( not ( = ?auto_558110 ?auto_558123 ) ) ( not ( = ?auto_558110 ?auto_558124 ) ) ( not ( = ?auto_558111 ?auto_558112 ) ) ( not ( = ?auto_558111 ?auto_558113 ) ) ( not ( = ?auto_558111 ?auto_558114 ) ) ( not ( = ?auto_558111 ?auto_558115 ) ) ( not ( = ?auto_558111 ?auto_558116 ) ) ( not ( = ?auto_558111 ?auto_558117 ) ) ( not ( = ?auto_558111 ?auto_558118 ) ) ( not ( = ?auto_558111 ?auto_558119 ) ) ( not ( = ?auto_558111 ?auto_558120 ) ) ( not ( = ?auto_558111 ?auto_558121 ) ) ( not ( = ?auto_558111 ?auto_558122 ) ) ( not ( = ?auto_558111 ?auto_558123 ) ) ( not ( = ?auto_558111 ?auto_558124 ) ) ( not ( = ?auto_558112 ?auto_558113 ) ) ( not ( = ?auto_558112 ?auto_558114 ) ) ( not ( = ?auto_558112 ?auto_558115 ) ) ( not ( = ?auto_558112 ?auto_558116 ) ) ( not ( = ?auto_558112 ?auto_558117 ) ) ( not ( = ?auto_558112 ?auto_558118 ) ) ( not ( = ?auto_558112 ?auto_558119 ) ) ( not ( = ?auto_558112 ?auto_558120 ) ) ( not ( = ?auto_558112 ?auto_558121 ) ) ( not ( = ?auto_558112 ?auto_558122 ) ) ( not ( = ?auto_558112 ?auto_558123 ) ) ( not ( = ?auto_558112 ?auto_558124 ) ) ( not ( = ?auto_558113 ?auto_558114 ) ) ( not ( = ?auto_558113 ?auto_558115 ) ) ( not ( = ?auto_558113 ?auto_558116 ) ) ( not ( = ?auto_558113 ?auto_558117 ) ) ( not ( = ?auto_558113 ?auto_558118 ) ) ( not ( = ?auto_558113 ?auto_558119 ) ) ( not ( = ?auto_558113 ?auto_558120 ) ) ( not ( = ?auto_558113 ?auto_558121 ) ) ( not ( = ?auto_558113 ?auto_558122 ) ) ( not ( = ?auto_558113 ?auto_558123 ) ) ( not ( = ?auto_558113 ?auto_558124 ) ) ( not ( = ?auto_558114 ?auto_558115 ) ) ( not ( = ?auto_558114 ?auto_558116 ) ) ( not ( = ?auto_558114 ?auto_558117 ) ) ( not ( = ?auto_558114 ?auto_558118 ) ) ( not ( = ?auto_558114 ?auto_558119 ) ) ( not ( = ?auto_558114 ?auto_558120 ) ) ( not ( = ?auto_558114 ?auto_558121 ) ) ( not ( = ?auto_558114 ?auto_558122 ) ) ( not ( = ?auto_558114 ?auto_558123 ) ) ( not ( = ?auto_558114 ?auto_558124 ) ) ( not ( = ?auto_558115 ?auto_558116 ) ) ( not ( = ?auto_558115 ?auto_558117 ) ) ( not ( = ?auto_558115 ?auto_558118 ) ) ( not ( = ?auto_558115 ?auto_558119 ) ) ( not ( = ?auto_558115 ?auto_558120 ) ) ( not ( = ?auto_558115 ?auto_558121 ) ) ( not ( = ?auto_558115 ?auto_558122 ) ) ( not ( = ?auto_558115 ?auto_558123 ) ) ( not ( = ?auto_558115 ?auto_558124 ) ) ( not ( = ?auto_558116 ?auto_558117 ) ) ( not ( = ?auto_558116 ?auto_558118 ) ) ( not ( = ?auto_558116 ?auto_558119 ) ) ( not ( = ?auto_558116 ?auto_558120 ) ) ( not ( = ?auto_558116 ?auto_558121 ) ) ( not ( = ?auto_558116 ?auto_558122 ) ) ( not ( = ?auto_558116 ?auto_558123 ) ) ( not ( = ?auto_558116 ?auto_558124 ) ) ( not ( = ?auto_558117 ?auto_558118 ) ) ( not ( = ?auto_558117 ?auto_558119 ) ) ( not ( = ?auto_558117 ?auto_558120 ) ) ( not ( = ?auto_558117 ?auto_558121 ) ) ( not ( = ?auto_558117 ?auto_558122 ) ) ( not ( = ?auto_558117 ?auto_558123 ) ) ( not ( = ?auto_558117 ?auto_558124 ) ) ( not ( = ?auto_558118 ?auto_558119 ) ) ( not ( = ?auto_558118 ?auto_558120 ) ) ( not ( = ?auto_558118 ?auto_558121 ) ) ( not ( = ?auto_558118 ?auto_558122 ) ) ( not ( = ?auto_558118 ?auto_558123 ) ) ( not ( = ?auto_558118 ?auto_558124 ) ) ( not ( = ?auto_558119 ?auto_558120 ) ) ( not ( = ?auto_558119 ?auto_558121 ) ) ( not ( = ?auto_558119 ?auto_558122 ) ) ( not ( = ?auto_558119 ?auto_558123 ) ) ( not ( = ?auto_558119 ?auto_558124 ) ) ( not ( = ?auto_558120 ?auto_558121 ) ) ( not ( = ?auto_558120 ?auto_558122 ) ) ( not ( = ?auto_558120 ?auto_558123 ) ) ( not ( = ?auto_558120 ?auto_558124 ) ) ( not ( = ?auto_558121 ?auto_558122 ) ) ( not ( = ?auto_558121 ?auto_558123 ) ) ( not ( = ?auto_558121 ?auto_558124 ) ) ( not ( = ?auto_558122 ?auto_558123 ) ) ( not ( = ?auto_558122 ?auto_558124 ) ) ( not ( = ?auto_558123 ?auto_558124 ) ) ( ON ?auto_558122 ?auto_558123 ) ( CLEAR ?auto_558120 ) ( ON ?auto_558121 ?auto_558122 ) ( CLEAR ?auto_558121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_558108 ?auto_558109 ?auto_558110 ?auto_558111 ?auto_558112 ?auto_558113 ?auto_558114 ?auto_558115 ?auto_558116 ?auto_558117 ?auto_558118 ?auto_558119 ?auto_558120 ?auto_558121 )
      ( MAKE-16PILE ?auto_558108 ?auto_558109 ?auto_558110 ?auto_558111 ?auto_558112 ?auto_558113 ?auto_558114 ?auto_558115 ?auto_558116 ?auto_558117 ?auto_558118 ?auto_558119 ?auto_558120 ?auto_558121 ?auto_558122 ?auto_558123 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558141 - BLOCK
      ?auto_558142 - BLOCK
      ?auto_558143 - BLOCK
      ?auto_558144 - BLOCK
      ?auto_558145 - BLOCK
      ?auto_558146 - BLOCK
      ?auto_558147 - BLOCK
      ?auto_558148 - BLOCK
      ?auto_558149 - BLOCK
      ?auto_558150 - BLOCK
      ?auto_558151 - BLOCK
      ?auto_558152 - BLOCK
      ?auto_558153 - BLOCK
      ?auto_558154 - BLOCK
      ?auto_558155 - BLOCK
      ?auto_558156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558156 ) ( ON-TABLE ?auto_558141 ) ( ON ?auto_558142 ?auto_558141 ) ( ON ?auto_558143 ?auto_558142 ) ( ON ?auto_558144 ?auto_558143 ) ( ON ?auto_558145 ?auto_558144 ) ( ON ?auto_558146 ?auto_558145 ) ( ON ?auto_558147 ?auto_558146 ) ( ON ?auto_558148 ?auto_558147 ) ( ON ?auto_558149 ?auto_558148 ) ( ON ?auto_558150 ?auto_558149 ) ( ON ?auto_558151 ?auto_558150 ) ( ON ?auto_558152 ?auto_558151 ) ( ON ?auto_558153 ?auto_558152 ) ( not ( = ?auto_558141 ?auto_558142 ) ) ( not ( = ?auto_558141 ?auto_558143 ) ) ( not ( = ?auto_558141 ?auto_558144 ) ) ( not ( = ?auto_558141 ?auto_558145 ) ) ( not ( = ?auto_558141 ?auto_558146 ) ) ( not ( = ?auto_558141 ?auto_558147 ) ) ( not ( = ?auto_558141 ?auto_558148 ) ) ( not ( = ?auto_558141 ?auto_558149 ) ) ( not ( = ?auto_558141 ?auto_558150 ) ) ( not ( = ?auto_558141 ?auto_558151 ) ) ( not ( = ?auto_558141 ?auto_558152 ) ) ( not ( = ?auto_558141 ?auto_558153 ) ) ( not ( = ?auto_558141 ?auto_558154 ) ) ( not ( = ?auto_558141 ?auto_558155 ) ) ( not ( = ?auto_558141 ?auto_558156 ) ) ( not ( = ?auto_558142 ?auto_558143 ) ) ( not ( = ?auto_558142 ?auto_558144 ) ) ( not ( = ?auto_558142 ?auto_558145 ) ) ( not ( = ?auto_558142 ?auto_558146 ) ) ( not ( = ?auto_558142 ?auto_558147 ) ) ( not ( = ?auto_558142 ?auto_558148 ) ) ( not ( = ?auto_558142 ?auto_558149 ) ) ( not ( = ?auto_558142 ?auto_558150 ) ) ( not ( = ?auto_558142 ?auto_558151 ) ) ( not ( = ?auto_558142 ?auto_558152 ) ) ( not ( = ?auto_558142 ?auto_558153 ) ) ( not ( = ?auto_558142 ?auto_558154 ) ) ( not ( = ?auto_558142 ?auto_558155 ) ) ( not ( = ?auto_558142 ?auto_558156 ) ) ( not ( = ?auto_558143 ?auto_558144 ) ) ( not ( = ?auto_558143 ?auto_558145 ) ) ( not ( = ?auto_558143 ?auto_558146 ) ) ( not ( = ?auto_558143 ?auto_558147 ) ) ( not ( = ?auto_558143 ?auto_558148 ) ) ( not ( = ?auto_558143 ?auto_558149 ) ) ( not ( = ?auto_558143 ?auto_558150 ) ) ( not ( = ?auto_558143 ?auto_558151 ) ) ( not ( = ?auto_558143 ?auto_558152 ) ) ( not ( = ?auto_558143 ?auto_558153 ) ) ( not ( = ?auto_558143 ?auto_558154 ) ) ( not ( = ?auto_558143 ?auto_558155 ) ) ( not ( = ?auto_558143 ?auto_558156 ) ) ( not ( = ?auto_558144 ?auto_558145 ) ) ( not ( = ?auto_558144 ?auto_558146 ) ) ( not ( = ?auto_558144 ?auto_558147 ) ) ( not ( = ?auto_558144 ?auto_558148 ) ) ( not ( = ?auto_558144 ?auto_558149 ) ) ( not ( = ?auto_558144 ?auto_558150 ) ) ( not ( = ?auto_558144 ?auto_558151 ) ) ( not ( = ?auto_558144 ?auto_558152 ) ) ( not ( = ?auto_558144 ?auto_558153 ) ) ( not ( = ?auto_558144 ?auto_558154 ) ) ( not ( = ?auto_558144 ?auto_558155 ) ) ( not ( = ?auto_558144 ?auto_558156 ) ) ( not ( = ?auto_558145 ?auto_558146 ) ) ( not ( = ?auto_558145 ?auto_558147 ) ) ( not ( = ?auto_558145 ?auto_558148 ) ) ( not ( = ?auto_558145 ?auto_558149 ) ) ( not ( = ?auto_558145 ?auto_558150 ) ) ( not ( = ?auto_558145 ?auto_558151 ) ) ( not ( = ?auto_558145 ?auto_558152 ) ) ( not ( = ?auto_558145 ?auto_558153 ) ) ( not ( = ?auto_558145 ?auto_558154 ) ) ( not ( = ?auto_558145 ?auto_558155 ) ) ( not ( = ?auto_558145 ?auto_558156 ) ) ( not ( = ?auto_558146 ?auto_558147 ) ) ( not ( = ?auto_558146 ?auto_558148 ) ) ( not ( = ?auto_558146 ?auto_558149 ) ) ( not ( = ?auto_558146 ?auto_558150 ) ) ( not ( = ?auto_558146 ?auto_558151 ) ) ( not ( = ?auto_558146 ?auto_558152 ) ) ( not ( = ?auto_558146 ?auto_558153 ) ) ( not ( = ?auto_558146 ?auto_558154 ) ) ( not ( = ?auto_558146 ?auto_558155 ) ) ( not ( = ?auto_558146 ?auto_558156 ) ) ( not ( = ?auto_558147 ?auto_558148 ) ) ( not ( = ?auto_558147 ?auto_558149 ) ) ( not ( = ?auto_558147 ?auto_558150 ) ) ( not ( = ?auto_558147 ?auto_558151 ) ) ( not ( = ?auto_558147 ?auto_558152 ) ) ( not ( = ?auto_558147 ?auto_558153 ) ) ( not ( = ?auto_558147 ?auto_558154 ) ) ( not ( = ?auto_558147 ?auto_558155 ) ) ( not ( = ?auto_558147 ?auto_558156 ) ) ( not ( = ?auto_558148 ?auto_558149 ) ) ( not ( = ?auto_558148 ?auto_558150 ) ) ( not ( = ?auto_558148 ?auto_558151 ) ) ( not ( = ?auto_558148 ?auto_558152 ) ) ( not ( = ?auto_558148 ?auto_558153 ) ) ( not ( = ?auto_558148 ?auto_558154 ) ) ( not ( = ?auto_558148 ?auto_558155 ) ) ( not ( = ?auto_558148 ?auto_558156 ) ) ( not ( = ?auto_558149 ?auto_558150 ) ) ( not ( = ?auto_558149 ?auto_558151 ) ) ( not ( = ?auto_558149 ?auto_558152 ) ) ( not ( = ?auto_558149 ?auto_558153 ) ) ( not ( = ?auto_558149 ?auto_558154 ) ) ( not ( = ?auto_558149 ?auto_558155 ) ) ( not ( = ?auto_558149 ?auto_558156 ) ) ( not ( = ?auto_558150 ?auto_558151 ) ) ( not ( = ?auto_558150 ?auto_558152 ) ) ( not ( = ?auto_558150 ?auto_558153 ) ) ( not ( = ?auto_558150 ?auto_558154 ) ) ( not ( = ?auto_558150 ?auto_558155 ) ) ( not ( = ?auto_558150 ?auto_558156 ) ) ( not ( = ?auto_558151 ?auto_558152 ) ) ( not ( = ?auto_558151 ?auto_558153 ) ) ( not ( = ?auto_558151 ?auto_558154 ) ) ( not ( = ?auto_558151 ?auto_558155 ) ) ( not ( = ?auto_558151 ?auto_558156 ) ) ( not ( = ?auto_558152 ?auto_558153 ) ) ( not ( = ?auto_558152 ?auto_558154 ) ) ( not ( = ?auto_558152 ?auto_558155 ) ) ( not ( = ?auto_558152 ?auto_558156 ) ) ( not ( = ?auto_558153 ?auto_558154 ) ) ( not ( = ?auto_558153 ?auto_558155 ) ) ( not ( = ?auto_558153 ?auto_558156 ) ) ( not ( = ?auto_558154 ?auto_558155 ) ) ( not ( = ?auto_558154 ?auto_558156 ) ) ( not ( = ?auto_558155 ?auto_558156 ) ) ( ON ?auto_558155 ?auto_558156 ) ( CLEAR ?auto_558153 ) ( ON ?auto_558154 ?auto_558155 ) ( CLEAR ?auto_558154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_558141 ?auto_558142 ?auto_558143 ?auto_558144 ?auto_558145 ?auto_558146 ?auto_558147 ?auto_558148 ?auto_558149 ?auto_558150 ?auto_558151 ?auto_558152 ?auto_558153 ?auto_558154 )
      ( MAKE-16PILE ?auto_558141 ?auto_558142 ?auto_558143 ?auto_558144 ?auto_558145 ?auto_558146 ?auto_558147 ?auto_558148 ?auto_558149 ?auto_558150 ?auto_558151 ?auto_558152 ?auto_558153 ?auto_558154 ?auto_558155 ?auto_558156 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558173 - BLOCK
      ?auto_558174 - BLOCK
      ?auto_558175 - BLOCK
      ?auto_558176 - BLOCK
      ?auto_558177 - BLOCK
      ?auto_558178 - BLOCK
      ?auto_558179 - BLOCK
      ?auto_558180 - BLOCK
      ?auto_558181 - BLOCK
      ?auto_558182 - BLOCK
      ?auto_558183 - BLOCK
      ?auto_558184 - BLOCK
      ?auto_558185 - BLOCK
      ?auto_558186 - BLOCK
      ?auto_558187 - BLOCK
      ?auto_558188 - BLOCK
    )
    :vars
    (
      ?auto_558189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558188 ?auto_558189 ) ( ON-TABLE ?auto_558173 ) ( ON ?auto_558174 ?auto_558173 ) ( ON ?auto_558175 ?auto_558174 ) ( ON ?auto_558176 ?auto_558175 ) ( ON ?auto_558177 ?auto_558176 ) ( ON ?auto_558178 ?auto_558177 ) ( ON ?auto_558179 ?auto_558178 ) ( ON ?auto_558180 ?auto_558179 ) ( ON ?auto_558181 ?auto_558180 ) ( ON ?auto_558182 ?auto_558181 ) ( ON ?auto_558183 ?auto_558182 ) ( ON ?auto_558184 ?auto_558183 ) ( not ( = ?auto_558173 ?auto_558174 ) ) ( not ( = ?auto_558173 ?auto_558175 ) ) ( not ( = ?auto_558173 ?auto_558176 ) ) ( not ( = ?auto_558173 ?auto_558177 ) ) ( not ( = ?auto_558173 ?auto_558178 ) ) ( not ( = ?auto_558173 ?auto_558179 ) ) ( not ( = ?auto_558173 ?auto_558180 ) ) ( not ( = ?auto_558173 ?auto_558181 ) ) ( not ( = ?auto_558173 ?auto_558182 ) ) ( not ( = ?auto_558173 ?auto_558183 ) ) ( not ( = ?auto_558173 ?auto_558184 ) ) ( not ( = ?auto_558173 ?auto_558185 ) ) ( not ( = ?auto_558173 ?auto_558186 ) ) ( not ( = ?auto_558173 ?auto_558187 ) ) ( not ( = ?auto_558173 ?auto_558188 ) ) ( not ( = ?auto_558173 ?auto_558189 ) ) ( not ( = ?auto_558174 ?auto_558175 ) ) ( not ( = ?auto_558174 ?auto_558176 ) ) ( not ( = ?auto_558174 ?auto_558177 ) ) ( not ( = ?auto_558174 ?auto_558178 ) ) ( not ( = ?auto_558174 ?auto_558179 ) ) ( not ( = ?auto_558174 ?auto_558180 ) ) ( not ( = ?auto_558174 ?auto_558181 ) ) ( not ( = ?auto_558174 ?auto_558182 ) ) ( not ( = ?auto_558174 ?auto_558183 ) ) ( not ( = ?auto_558174 ?auto_558184 ) ) ( not ( = ?auto_558174 ?auto_558185 ) ) ( not ( = ?auto_558174 ?auto_558186 ) ) ( not ( = ?auto_558174 ?auto_558187 ) ) ( not ( = ?auto_558174 ?auto_558188 ) ) ( not ( = ?auto_558174 ?auto_558189 ) ) ( not ( = ?auto_558175 ?auto_558176 ) ) ( not ( = ?auto_558175 ?auto_558177 ) ) ( not ( = ?auto_558175 ?auto_558178 ) ) ( not ( = ?auto_558175 ?auto_558179 ) ) ( not ( = ?auto_558175 ?auto_558180 ) ) ( not ( = ?auto_558175 ?auto_558181 ) ) ( not ( = ?auto_558175 ?auto_558182 ) ) ( not ( = ?auto_558175 ?auto_558183 ) ) ( not ( = ?auto_558175 ?auto_558184 ) ) ( not ( = ?auto_558175 ?auto_558185 ) ) ( not ( = ?auto_558175 ?auto_558186 ) ) ( not ( = ?auto_558175 ?auto_558187 ) ) ( not ( = ?auto_558175 ?auto_558188 ) ) ( not ( = ?auto_558175 ?auto_558189 ) ) ( not ( = ?auto_558176 ?auto_558177 ) ) ( not ( = ?auto_558176 ?auto_558178 ) ) ( not ( = ?auto_558176 ?auto_558179 ) ) ( not ( = ?auto_558176 ?auto_558180 ) ) ( not ( = ?auto_558176 ?auto_558181 ) ) ( not ( = ?auto_558176 ?auto_558182 ) ) ( not ( = ?auto_558176 ?auto_558183 ) ) ( not ( = ?auto_558176 ?auto_558184 ) ) ( not ( = ?auto_558176 ?auto_558185 ) ) ( not ( = ?auto_558176 ?auto_558186 ) ) ( not ( = ?auto_558176 ?auto_558187 ) ) ( not ( = ?auto_558176 ?auto_558188 ) ) ( not ( = ?auto_558176 ?auto_558189 ) ) ( not ( = ?auto_558177 ?auto_558178 ) ) ( not ( = ?auto_558177 ?auto_558179 ) ) ( not ( = ?auto_558177 ?auto_558180 ) ) ( not ( = ?auto_558177 ?auto_558181 ) ) ( not ( = ?auto_558177 ?auto_558182 ) ) ( not ( = ?auto_558177 ?auto_558183 ) ) ( not ( = ?auto_558177 ?auto_558184 ) ) ( not ( = ?auto_558177 ?auto_558185 ) ) ( not ( = ?auto_558177 ?auto_558186 ) ) ( not ( = ?auto_558177 ?auto_558187 ) ) ( not ( = ?auto_558177 ?auto_558188 ) ) ( not ( = ?auto_558177 ?auto_558189 ) ) ( not ( = ?auto_558178 ?auto_558179 ) ) ( not ( = ?auto_558178 ?auto_558180 ) ) ( not ( = ?auto_558178 ?auto_558181 ) ) ( not ( = ?auto_558178 ?auto_558182 ) ) ( not ( = ?auto_558178 ?auto_558183 ) ) ( not ( = ?auto_558178 ?auto_558184 ) ) ( not ( = ?auto_558178 ?auto_558185 ) ) ( not ( = ?auto_558178 ?auto_558186 ) ) ( not ( = ?auto_558178 ?auto_558187 ) ) ( not ( = ?auto_558178 ?auto_558188 ) ) ( not ( = ?auto_558178 ?auto_558189 ) ) ( not ( = ?auto_558179 ?auto_558180 ) ) ( not ( = ?auto_558179 ?auto_558181 ) ) ( not ( = ?auto_558179 ?auto_558182 ) ) ( not ( = ?auto_558179 ?auto_558183 ) ) ( not ( = ?auto_558179 ?auto_558184 ) ) ( not ( = ?auto_558179 ?auto_558185 ) ) ( not ( = ?auto_558179 ?auto_558186 ) ) ( not ( = ?auto_558179 ?auto_558187 ) ) ( not ( = ?auto_558179 ?auto_558188 ) ) ( not ( = ?auto_558179 ?auto_558189 ) ) ( not ( = ?auto_558180 ?auto_558181 ) ) ( not ( = ?auto_558180 ?auto_558182 ) ) ( not ( = ?auto_558180 ?auto_558183 ) ) ( not ( = ?auto_558180 ?auto_558184 ) ) ( not ( = ?auto_558180 ?auto_558185 ) ) ( not ( = ?auto_558180 ?auto_558186 ) ) ( not ( = ?auto_558180 ?auto_558187 ) ) ( not ( = ?auto_558180 ?auto_558188 ) ) ( not ( = ?auto_558180 ?auto_558189 ) ) ( not ( = ?auto_558181 ?auto_558182 ) ) ( not ( = ?auto_558181 ?auto_558183 ) ) ( not ( = ?auto_558181 ?auto_558184 ) ) ( not ( = ?auto_558181 ?auto_558185 ) ) ( not ( = ?auto_558181 ?auto_558186 ) ) ( not ( = ?auto_558181 ?auto_558187 ) ) ( not ( = ?auto_558181 ?auto_558188 ) ) ( not ( = ?auto_558181 ?auto_558189 ) ) ( not ( = ?auto_558182 ?auto_558183 ) ) ( not ( = ?auto_558182 ?auto_558184 ) ) ( not ( = ?auto_558182 ?auto_558185 ) ) ( not ( = ?auto_558182 ?auto_558186 ) ) ( not ( = ?auto_558182 ?auto_558187 ) ) ( not ( = ?auto_558182 ?auto_558188 ) ) ( not ( = ?auto_558182 ?auto_558189 ) ) ( not ( = ?auto_558183 ?auto_558184 ) ) ( not ( = ?auto_558183 ?auto_558185 ) ) ( not ( = ?auto_558183 ?auto_558186 ) ) ( not ( = ?auto_558183 ?auto_558187 ) ) ( not ( = ?auto_558183 ?auto_558188 ) ) ( not ( = ?auto_558183 ?auto_558189 ) ) ( not ( = ?auto_558184 ?auto_558185 ) ) ( not ( = ?auto_558184 ?auto_558186 ) ) ( not ( = ?auto_558184 ?auto_558187 ) ) ( not ( = ?auto_558184 ?auto_558188 ) ) ( not ( = ?auto_558184 ?auto_558189 ) ) ( not ( = ?auto_558185 ?auto_558186 ) ) ( not ( = ?auto_558185 ?auto_558187 ) ) ( not ( = ?auto_558185 ?auto_558188 ) ) ( not ( = ?auto_558185 ?auto_558189 ) ) ( not ( = ?auto_558186 ?auto_558187 ) ) ( not ( = ?auto_558186 ?auto_558188 ) ) ( not ( = ?auto_558186 ?auto_558189 ) ) ( not ( = ?auto_558187 ?auto_558188 ) ) ( not ( = ?auto_558187 ?auto_558189 ) ) ( not ( = ?auto_558188 ?auto_558189 ) ) ( ON ?auto_558187 ?auto_558188 ) ( ON ?auto_558186 ?auto_558187 ) ( CLEAR ?auto_558184 ) ( ON ?auto_558185 ?auto_558186 ) ( CLEAR ?auto_558185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_558173 ?auto_558174 ?auto_558175 ?auto_558176 ?auto_558177 ?auto_558178 ?auto_558179 ?auto_558180 ?auto_558181 ?auto_558182 ?auto_558183 ?auto_558184 ?auto_558185 )
      ( MAKE-16PILE ?auto_558173 ?auto_558174 ?auto_558175 ?auto_558176 ?auto_558177 ?auto_558178 ?auto_558179 ?auto_558180 ?auto_558181 ?auto_558182 ?auto_558183 ?auto_558184 ?auto_558185 ?auto_558186 ?auto_558187 ?auto_558188 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558206 - BLOCK
      ?auto_558207 - BLOCK
      ?auto_558208 - BLOCK
      ?auto_558209 - BLOCK
      ?auto_558210 - BLOCK
      ?auto_558211 - BLOCK
      ?auto_558212 - BLOCK
      ?auto_558213 - BLOCK
      ?auto_558214 - BLOCK
      ?auto_558215 - BLOCK
      ?auto_558216 - BLOCK
      ?auto_558217 - BLOCK
      ?auto_558218 - BLOCK
      ?auto_558219 - BLOCK
      ?auto_558220 - BLOCK
      ?auto_558221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558221 ) ( ON-TABLE ?auto_558206 ) ( ON ?auto_558207 ?auto_558206 ) ( ON ?auto_558208 ?auto_558207 ) ( ON ?auto_558209 ?auto_558208 ) ( ON ?auto_558210 ?auto_558209 ) ( ON ?auto_558211 ?auto_558210 ) ( ON ?auto_558212 ?auto_558211 ) ( ON ?auto_558213 ?auto_558212 ) ( ON ?auto_558214 ?auto_558213 ) ( ON ?auto_558215 ?auto_558214 ) ( ON ?auto_558216 ?auto_558215 ) ( ON ?auto_558217 ?auto_558216 ) ( not ( = ?auto_558206 ?auto_558207 ) ) ( not ( = ?auto_558206 ?auto_558208 ) ) ( not ( = ?auto_558206 ?auto_558209 ) ) ( not ( = ?auto_558206 ?auto_558210 ) ) ( not ( = ?auto_558206 ?auto_558211 ) ) ( not ( = ?auto_558206 ?auto_558212 ) ) ( not ( = ?auto_558206 ?auto_558213 ) ) ( not ( = ?auto_558206 ?auto_558214 ) ) ( not ( = ?auto_558206 ?auto_558215 ) ) ( not ( = ?auto_558206 ?auto_558216 ) ) ( not ( = ?auto_558206 ?auto_558217 ) ) ( not ( = ?auto_558206 ?auto_558218 ) ) ( not ( = ?auto_558206 ?auto_558219 ) ) ( not ( = ?auto_558206 ?auto_558220 ) ) ( not ( = ?auto_558206 ?auto_558221 ) ) ( not ( = ?auto_558207 ?auto_558208 ) ) ( not ( = ?auto_558207 ?auto_558209 ) ) ( not ( = ?auto_558207 ?auto_558210 ) ) ( not ( = ?auto_558207 ?auto_558211 ) ) ( not ( = ?auto_558207 ?auto_558212 ) ) ( not ( = ?auto_558207 ?auto_558213 ) ) ( not ( = ?auto_558207 ?auto_558214 ) ) ( not ( = ?auto_558207 ?auto_558215 ) ) ( not ( = ?auto_558207 ?auto_558216 ) ) ( not ( = ?auto_558207 ?auto_558217 ) ) ( not ( = ?auto_558207 ?auto_558218 ) ) ( not ( = ?auto_558207 ?auto_558219 ) ) ( not ( = ?auto_558207 ?auto_558220 ) ) ( not ( = ?auto_558207 ?auto_558221 ) ) ( not ( = ?auto_558208 ?auto_558209 ) ) ( not ( = ?auto_558208 ?auto_558210 ) ) ( not ( = ?auto_558208 ?auto_558211 ) ) ( not ( = ?auto_558208 ?auto_558212 ) ) ( not ( = ?auto_558208 ?auto_558213 ) ) ( not ( = ?auto_558208 ?auto_558214 ) ) ( not ( = ?auto_558208 ?auto_558215 ) ) ( not ( = ?auto_558208 ?auto_558216 ) ) ( not ( = ?auto_558208 ?auto_558217 ) ) ( not ( = ?auto_558208 ?auto_558218 ) ) ( not ( = ?auto_558208 ?auto_558219 ) ) ( not ( = ?auto_558208 ?auto_558220 ) ) ( not ( = ?auto_558208 ?auto_558221 ) ) ( not ( = ?auto_558209 ?auto_558210 ) ) ( not ( = ?auto_558209 ?auto_558211 ) ) ( not ( = ?auto_558209 ?auto_558212 ) ) ( not ( = ?auto_558209 ?auto_558213 ) ) ( not ( = ?auto_558209 ?auto_558214 ) ) ( not ( = ?auto_558209 ?auto_558215 ) ) ( not ( = ?auto_558209 ?auto_558216 ) ) ( not ( = ?auto_558209 ?auto_558217 ) ) ( not ( = ?auto_558209 ?auto_558218 ) ) ( not ( = ?auto_558209 ?auto_558219 ) ) ( not ( = ?auto_558209 ?auto_558220 ) ) ( not ( = ?auto_558209 ?auto_558221 ) ) ( not ( = ?auto_558210 ?auto_558211 ) ) ( not ( = ?auto_558210 ?auto_558212 ) ) ( not ( = ?auto_558210 ?auto_558213 ) ) ( not ( = ?auto_558210 ?auto_558214 ) ) ( not ( = ?auto_558210 ?auto_558215 ) ) ( not ( = ?auto_558210 ?auto_558216 ) ) ( not ( = ?auto_558210 ?auto_558217 ) ) ( not ( = ?auto_558210 ?auto_558218 ) ) ( not ( = ?auto_558210 ?auto_558219 ) ) ( not ( = ?auto_558210 ?auto_558220 ) ) ( not ( = ?auto_558210 ?auto_558221 ) ) ( not ( = ?auto_558211 ?auto_558212 ) ) ( not ( = ?auto_558211 ?auto_558213 ) ) ( not ( = ?auto_558211 ?auto_558214 ) ) ( not ( = ?auto_558211 ?auto_558215 ) ) ( not ( = ?auto_558211 ?auto_558216 ) ) ( not ( = ?auto_558211 ?auto_558217 ) ) ( not ( = ?auto_558211 ?auto_558218 ) ) ( not ( = ?auto_558211 ?auto_558219 ) ) ( not ( = ?auto_558211 ?auto_558220 ) ) ( not ( = ?auto_558211 ?auto_558221 ) ) ( not ( = ?auto_558212 ?auto_558213 ) ) ( not ( = ?auto_558212 ?auto_558214 ) ) ( not ( = ?auto_558212 ?auto_558215 ) ) ( not ( = ?auto_558212 ?auto_558216 ) ) ( not ( = ?auto_558212 ?auto_558217 ) ) ( not ( = ?auto_558212 ?auto_558218 ) ) ( not ( = ?auto_558212 ?auto_558219 ) ) ( not ( = ?auto_558212 ?auto_558220 ) ) ( not ( = ?auto_558212 ?auto_558221 ) ) ( not ( = ?auto_558213 ?auto_558214 ) ) ( not ( = ?auto_558213 ?auto_558215 ) ) ( not ( = ?auto_558213 ?auto_558216 ) ) ( not ( = ?auto_558213 ?auto_558217 ) ) ( not ( = ?auto_558213 ?auto_558218 ) ) ( not ( = ?auto_558213 ?auto_558219 ) ) ( not ( = ?auto_558213 ?auto_558220 ) ) ( not ( = ?auto_558213 ?auto_558221 ) ) ( not ( = ?auto_558214 ?auto_558215 ) ) ( not ( = ?auto_558214 ?auto_558216 ) ) ( not ( = ?auto_558214 ?auto_558217 ) ) ( not ( = ?auto_558214 ?auto_558218 ) ) ( not ( = ?auto_558214 ?auto_558219 ) ) ( not ( = ?auto_558214 ?auto_558220 ) ) ( not ( = ?auto_558214 ?auto_558221 ) ) ( not ( = ?auto_558215 ?auto_558216 ) ) ( not ( = ?auto_558215 ?auto_558217 ) ) ( not ( = ?auto_558215 ?auto_558218 ) ) ( not ( = ?auto_558215 ?auto_558219 ) ) ( not ( = ?auto_558215 ?auto_558220 ) ) ( not ( = ?auto_558215 ?auto_558221 ) ) ( not ( = ?auto_558216 ?auto_558217 ) ) ( not ( = ?auto_558216 ?auto_558218 ) ) ( not ( = ?auto_558216 ?auto_558219 ) ) ( not ( = ?auto_558216 ?auto_558220 ) ) ( not ( = ?auto_558216 ?auto_558221 ) ) ( not ( = ?auto_558217 ?auto_558218 ) ) ( not ( = ?auto_558217 ?auto_558219 ) ) ( not ( = ?auto_558217 ?auto_558220 ) ) ( not ( = ?auto_558217 ?auto_558221 ) ) ( not ( = ?auto_558218 ?auto_558219 ) ) ( not ( = ?auto_558218 ?auto_558220 ) ) ( not ( = ?auto_558218 ?auto_558221 ) ) ( not ( = ?auto_558219 ?auto_558220 ) ) ( not ( = ?auto_558219 ?auto_558221 ) ) ( not ( = ?auto_558220 ?auto_558221 ) ) ( ON ?auto_558220 ?auto_558221 ) ( ON ?auto_558219 ?auto_558220 ) ( CLEAR ?auto_558217 ) ( ON ?auto_558218 ?auto_558219 ) ( CLEAR ?auto_558218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_558206 ?auto_558207 ?auto_558208 ?auto_558209 ?auto_558210 ?auto_558211 ?auto_558212 ?auto_558213 ?auto_558214 ?auto_558215 ?auto_558216 ?auto_558217 ?auto_558218 )
      ( MAKE-16PILE ?auto_558206 ?auto_558207 ?auto_558208 ?auto_558209 ?auto_558210 ?auto_558211 ?auto_558212 ?auto_558213 ?auto_558214 ?auto_558215 ?auto_558216 ?auto_558217 ?auto_558218 ?auto_558219 ?auto_558220 ?auto_558221 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558238 - BLOCK
      ?auto_558239 - BLOCK
      ?auto_558240 - BLOCK
      ?auto_558241 - BLOCK
      ?auto_558242 - BLOCK
      ?auto_558243 - BLOCK
      ?auto_558244 - BLOCK
      ?auto_558245 - BLOCK
      ?auto_558246 - BLOCK
      ?auto_558247 - BLOCK
      ?auto_558248 - BLOCK
      ?auto_558249 - BLOCK
      ?auto_558250 - BLOCK
      ?auto_558251 - BLOCK
      ?auto_558252 - BLOCK
      ?auto_558253 - BLOCK
    )
    :vars
    (
      ?auto_558254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558253 ?auto_558254 ) ( ON-TABLE ?auto_558238 ) ( ON ?auto_558239 ?auto_558238 ) ( ON ?auto_558240 ?auto_558239 ) ( ON ?auto_558241 ?auto_558240 ) ( ON ?auto_558242 ?auto_558241 ) ( ON ?auto_558243 ?auto_558242 ) ( ON ?auto_558244 ?auto_558243 ) ( ON ?auto_558245 ?auto_558244 ) ( ON ?auto_558246 ?auto_558245 ) ( ON ?auto_558247 ?auto_558246 ) ( ON ?auto_558248 ?auto_558247 ) ( not ( = ?auto_558238 ?auto_558239 ) ) ( not ( = ?auto_558238 ?auto_558240 ) ) ( not ( = ?auto_558238 ?auto_558241 ) ) ( not ( = ?auto_558238 ?auto_558242 ) ) ( not ( = ?auto_558238 ?auto_558243 ) ) ( not ( = ?auto_558238 ?auto_558244 ) ) ( not ( = ?auto_558238 ?auto_558245 ) ) ( not ( = ?auto_558238 ?auto_558246 ) ) ( not ( = ?auto_558238 ?auto_558247 ) ) ( not ( = ?auto_558238 ?auto_558248 ) ) ( not ( = ?auto_558238 ?auto_558249 ) ) ( not ( = ?auto_558238 ?auto_558250 ) ) ( not ( = ?auto_558238 ?auto_558251 ) ) ( not ( = ?auto_558238 ?auto_558252 ) ) ( not ( = ?auto_558238 ?auto_558253 ) ) ( not ( = ?auto_558238 ?auto_558254 ) ) ( not ( = ?auto_558239 ?auto_558240 ) ) ( not ( = ?auto_558239 ?auto_558241 ) ) ( not ( = ?auto_558239 ?auto_558242 ) ) ( not ( = ?auto_558239 ?auto_558243 ) ) ( not ( = ?auto_558239 ?auto_558244 ) ) ( not ( = ?auto_558239 ?auto_558245 ) ) ( not ( = ?auto_558239 ?auto_558246 ) ) ( not ( = ?auto_558239 ?auto_558247 ) ) ( not ( = ?auto_558239 ?auto_558248 ) ) ( not ( = ?auto_558239 ?auto_558249 ) ) ( not ( = ?auto_558239 ?auto_558250 ) ) ( not ( = ?auto_558239 ?auto_558251 ) ) ( not ( = ?auto_558239 ?auto_558252 ) ) ( not ( = ?auto_558239 ?auto_558253 ) ) ( not ( = ?auto_558239 ?auto_558254 ) ) ( not ( = ?auto_558240 ?auto_558241 ) ) ( not ( = ?auto_558240 ?auto_558242 ) ) ( not ( = ?auto_558240 ?auto_558243 ) ) ( not ( = ?auto_558240 ?auto_558244 ) ) ( not ( = ?auto_558240 ?auto_558245 ) ) ( not ( = ?auto_558240 ?auto_558246 ) ) ( not ( = ?auto_558240 ?auto_558247 ) ) ( not ( = ?auto_558240 ?auto_558248 ) ) ( not ( = ?auto_558240 ?auto_558249 ) ) ( not ( = ?auto_558240 ?auto_558250 ) ) ( not ( = ?auto_558240 ?auto_558251 ) ) ( not ( = ?auto_558240 ?auto_558252 ) ) ( not ( = ?auto_558240 ?auto_558253 ) ) ( not ( = ?auto_558240 ?auto_558254 ) ) ( not ( = ?auto_558241 ?auto_558242 ) ) ( not ( = ?auto_558241 ?auto_558243 ) ) ( not ( = ?auto_558241 ?auto_558244 ) ) ( not ( = ?auto_558241 ?auto_558245 ) ) ( not ( = ?auto_558241 ?auto_558246 ) ) ( not ( = ?auto_558241 ?auto_558247 ) ) ( not ( = ?auto_558241 ?auto_558248 ) ) ( not ( = ?auto_558241 ?auto_558249 ) ) ( not ( = ?auto_558241 ?auto_558250 ) ) ( not ( = ?auto_558241 ?auto_558251 ) ) ( not ( = ?auto_558241 ?auto_558252 ) ) ( not ( = ?auto_558241 ?auto_558253 ) ) ( not ( = ?auto_558241 ?auto_558254 ) ) ( not ( = ?auto_558242 ?auto_558243 ) ) ( not ( = ?auto_558242 ?auto_558244 ) ) ( not ( = ?auto_558242 ?auto_558245 ) ) ( not ( = ?auto_558242 ?auto_558246 ) ) ( not ( = ?auto_558242 ?auto_558247 ) ) ( not ( = ?auto_558242 ?auto_558248 ) ) ( not ( = ?auto_558242 ?auto_558249 ) ) ( not ( = ?auto_558242 ?auto_558250 ) ) ( not ( = ?auto_558242 ?auto_558251 ) ) ( not ( = ?auto_558242 ?auto_558252 ) ) ( not ( = ?auto_558242 ?auto_558253 ) ) ( not ( = ?auto_558242 ?auto_558254 ) ) ( not ( = ?auto_558243 ?auto_558244 ) ) ( not ( = ?auto_558243 ?auto_558245 ) ) ( not ( = ?auto_558243 ?auto_558246 ) ) ( not ( = ?auto_558243 ?auto_558247 ) ) ( not ( = ?auto_558243 ?auto_558248 ) ) ( not ( = ?auto_558243 ?auto_558249 ) ) ( not ( = ?auto_558243 ?auto_558250 ) ) ( not ( = ?auto_558243 ?auto_558251 ) ) ( not ( = ?auto_558243 ?auto_558252 ) ) ( not ( = ?auto_558243 ?auto_558253 ) ) ( not ( = ?auto_558243 ?auto_558254 ) ) ( not ( = ?auto_558244 ?auto_558245 ) ) ( not ( = ?auto_558244 ?auto_558246 ) ) ( not ( = ?auto_558244 ?auto_558247 ) ) ( not ( = ?auto_558244 ?auto_558248 ) ) ( not ( = ?auto_558244 ?auto_558249 ) ) ( not ( = ?auto_558244 ?auto_558250 ) ) ( not ( = ?auto_558244 ?auto_558251 ) ) ( not ( = ?auto_558244 ?auto_558252 ) ) ( not ( = ?auto_558244 ?auto_558253 ) ) ( not ( = ?auto_558244 ?auto_558254 ) ) ( not ( = ?auto_558245 ?auto_558246 ) ) ( not ( = ?auto_558245 ?auto_558247 ) ) ( not ( = ?auto_558245 ?auto_558248 ) ) ( not ( = ?auto_558245 ?auto_558249 ) ) ( not ( = ?auto_558245 ?auto_558250 ) ) ( not ( = ?auto_558245 ?auto_558251 ) ) ( not ( = ?auto_558245 ?auto_558252 ) ) ( not ( = ?auto_558245 ?auto_558253 ) ) ( not ( = ?auto_558245 ?auto_558254 ) ) ( not ( = ?auto_558246 ?auto_558247 ) ) ( not ( = ?auto_558246 ?auto_558248 ) ) ( not ( = ?auto_558246 ?auto_558249 ) ) ( not ( = ?auto_558246 ?auto_558250 ) ) ( not ( = ?auto_558246 ?auto_558251 ) ) ( not ( = ?auto_558246 ?auto_558252 ) ) ( not ( = ?auto_558246 ?auto_558253 ) ) ( not ( = ?auto_558246 ?auto_558254 ) ) ( not ( = ?auto_558247 ?auto_558248 ) ) ( not ( = ?auto_558247 ?auto_558249 ) ) ( not ( = ?auto_558247 ?auto_558250 ) ) ( not ( = ?auto_558247 ?auto_558251 ) ) ( not ( = ?auto_558247 ?auto_558252 ) ) ( not ( = ?auto_558247 ?auto_558253 ) ) ( not ( = ?auto_558247 ?auto_558254 ) ) ( not ( = ?auto_558248 ?auto_558249 ) ) ( not ( = ?auto_558248 ?auto_558250 ) ) ( not ( = ?auto_558248 ?auto_558251 ) ) ( not ( = ?auto_558248 ?auto_558252 ) ) ( not ( = ?auto_558248 ?auto_558253 ) ) ( not ( = ?auto_558248 ?auto_558254 ) ) ( not ( = ?auto_558249 ?auto_558250 ) ) ( not ( = ?auto_558249 ?auto_558251 ) ) ( not ( = ?auto_558249 ?auto_558252 ) ) ( not ( = ?auto_558249 ?auto_558253 ) ) ( not ( = ?auto_558249 ?auto_558254 ) ) ( not ( = ?auto_558250 ?auto_558251 ) ) ( not ( = ?auto_558250 ?auto_558252 ) ) ( not ( = ?auto_558250 ?auto_558253 ) ) ( not ( = ?auto_558250 ?auto_558254 ) ) ( not ( = ?auto_558251 ?auto_558252 ) ) ( not ( = ?auto_558251 ?auto_558253 ) ) ( not ( = ?auto_558251 ?auto_558254 ) ) ( not ( = ?auto_558252 ?auto_558253 ) ) ( not ( = ?auto_558252 ?auto_558254 ) ) ( not ( = ?auto_558253 ?auto_558254 ) ) ( ON ?auto_558252 ?auto_558253 ) ( ON ?auto_558251 ?auto_558252 ) ( ON ?auto_558250 ?auto_558251 ) ( CLEAR ?auto_558248 ) ( ON ?auto_558249 ?auto_558250 ) ( CLEAR ?auto_558249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_558238 ?auto_558239 ?auto_558240 ?auto_558241 ?auto_558242 ?auto_558243 ?auto_558244 ?auto_558245 ?auto_558246 ?auto_558247 ?auto_558248 ?auto_558249 )
      ( MAKE-16PILE ?auto_558238 ?auto_558239 ?auto_558240 ?auto_558241 ?auto_558242 ?auto_558243 ?auto_558244 ?auto_558245 ?auto_558246 ?auto_558247 ?auto_558248 ?auto_558249 ?auto_558250 ?auto_558251 ?auto_558252 ?auto_558253 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558271 - BLOCK
      ?auto_558272 - BLOCK
      ?auto_558273 - BLOCK
      ?auto_558274 - BLOCK
      ?auto_558275 - BLOCK
      ?auto_558276 - BLOCK
      ?auto_558277 - BLOCK
      ?auto_558278 - BLOCK
      ?auto_558279 - BLOCK
      ?auto_558280 - BLOCK
      ?auto_558281 - BLOCK
      ?auto_558282 - BLOCK
      ?auto_558283 - BLOCK
      ?auto_558284 - BLOCK
      ?auto_558285 - BLOCK
      ?auto_558286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558286 ) ( ON-TABLE ?auto_558271 ) ( ON ?auto_558272 ?auto_558271 ) ( ON ?auto_558273 ?auto_558272 ) ( ON ?auto_558274 ?auto_558273 ) ( ON ?auto_558275 ?auto_558274 ) ( ON ?auto_558276 ?auto_558275 ) ( ON ?auto_558277 ?auto_558276 ) ( ON ?auto_558278 ?auto_558277 ) ( ON ?auto_558279 ?auto_558278 ) ( ON ?auto_558280 ?auto_558279 ) ( ON ?auto_558281 ?auto_558280 ) ( not ( = ?auto_558271 ?auto_558272 ) ) ( not ( = ?auto_558271 ?auto_558273 ) ) ( not ( = ?auto_558271 ?auto_558274 ) ) ( not ( = ?auto_558271 ?auto_558275 ) ) ( not ( = ?auto_558271 ?auto_558276 ) ) ( not ( = ?auto_558271 ?auto_558277 ) ) ( not ( = ?auto_558271 ?auto_558278 ) ) ( not ( = ?auto_558271 ?auto_558279 ) ) ( not ( = ?auto_558271 ?auto_558280 ) ) ( not ( = ?auto_558271 ?auto_558281 ) ) ( not ( = ?auto_558271 ?auto_558282 ) ) ( not ( = ?auto_558271 ?auto_558283 ) ) ( not ( = ?auto_558271 ?auto_558284 ) ) ( not ( = ?auto_558271 ?auto_558285 ) ) ( not ( = ?auto_558271 ?auto_558286 ) ) ( not ( = ?auto_558272 ?auto_558273 ) ) ( not ( = ?auto_558272 ?auto_558274 ) ) ( not ( = ?auto_558272 ?auto_558275 ) ) ( not ( = ?auto_558272 ?auto_558276 ) ) ( not ( = ?auto_558272 ?auto_558277 ) ) ( not ( = ?auto_558272 ?auto_558278 ) ) ( not ( = ?auto_558272 ?auto_558279 ) ) ( not ( = ?auto_558272 ?auto_558280 ) ) ( not ( = ?auto_558272 ?auto_558281 ) ) ( not ( = ?auto_558272 ?auto_558282 ) ) ( not ( = ?auto_558272 ?auto_558283 ) ) ( not ( = ?auto_558272 ?auto_558284 ) ) ( not ( = ?auto_558272 ?auto_558285 ) ) ( not ( = ?auto_558272 ?auto_558286 ) ) ( not ( = ?auto_558273 ?auto_558274 ) ) ( not ( = ?auto_558273 ?auto_558275 ) ) ( not ( = ?auto_558273 ?auto_558276 ) ) ( not ( = ?auto_558273 ?auto_558277 ) ) ( not ( = ?auto_558273 ?auto_558278 ) ) ( not ( = ?auto_558273 ?auto_558279 ) ) ( not ( = ?auto_558273 ?auto_558280 ) ) ( not ( = ?auto_558273 ?auto_558281 ) ) ( not ( = ?auto_558273 ?auto_558282 ) ) ( not ( = ?auto_558273 ?auto_558283 ) ) ( not ( = ?auto_558273 ?auto_558284 ) ) ( not ( = ?auto_558273 ?auto_558285 ) ) ( not ( = ?auto_558273 ?auto_558286 ) ) ( not ( = ?auto_558274 ?auto_558275 ) ) ( not ( = ?auto_558274 ?auto_558276 ) ) ( not ( = ?auto_558274 ?auto_558277 ) ) ( not ( = ?auto_558274 ?auto_558278 ) ) ( not ( = ?auto_558274 ?auto_558279 ) ) ( not ( = ?auto_558274 ?auto_558280 ) ) ( not ( = ?auto_558274 ?auto_558281 ) ) ( not ( = ?auto_558274 ?auto_558282 ) ) ( not ( = ?auto_558274 ?auto_558283 ) ) ( not ( = ?auto_558274 ?auto_558284 ) ) ( not ( = ?auto_558274 ?auto_558285 ) ) ( not ( = ?auto_558274 ?auto_558286 ) ) ( not ( = ?auto_558275 ?auto_558276 ) ) ( not ( = ?auto_558275 ?auto_558277 ) ) ( not ( = ?auto_558275 ?auto_558278 ) ) ( not ( = ?auto_558275 ?auto_558279 ) ) ( not ( = ?auto_558275 ?auto_558280 ) ) ( not ( = ?auto_558275 ?auto_558281 ) ) ( not ( = ?auto_558275 ?auto_558282 ) ) ( not ( = ?auto_558275 ?auto_558283 ) ) ( not ( = ?auto_558275 ?auto_558284 ) ) ( not ( = ?auto_558275 ?auto_558285 ) ) ( not ( = ?auto_558275 ?auto_558286 ) ) ( not ( = ?auto_558276 ?auto_558277 ) ) ( not ( = ?auto_558276 ?auto_558278 ) ) ( not ( = ?auto_558276 ?auto_558279 ) ) ( not ( = ?auto_558276 ?auto_558280 ) ) ( not ( = ?auto_558276 ?auto_558281 ) ) ( not ( = ?auto_558276 ?auto_558282 ) ) ( not ( = ?auto_558276 ?auto_558283 ) ) ( not ( = ?auto_558276 ?auto_558284 ) ) ( not ( = ?auto_558276 ?auto_558285 ) ) ( not ( = ?auto_558276 ?auto_558286 ) ) ( not ( = ?auto_558277 ?auto_558278 ) ) ( not ( = ?auto_558277 ?auto_558279 ) ) ( not ( = ?auto_558277 ?auto_558280 ) ) ( not ( = ?auto_558277 ?auto_558281 ) ) ( not ( = ?auto_558277 ?auto_558282 ) ) ( not ( = ?auto_558277 ?auto_558283 ) ) ( not ( = ?auto_558277 ?auto_558284 ) ) ( not ( = ?auto_558277 ?auto_558285 ) ) ( not ( = ?auto_558277 ?auto_558286 ) ) ( not ( = ?auto_558278 ?auto_558279 ) ) ( not ( = ?auto_558278 ?auto_558280 ) ) ( not ( = ?auto_558278 ?auto_558281 ) ) ( not ( = ?auto_558278 ?auto_558282 ) ) ( not ( = ?auto_558278 ?auto_558283 ) ) ( not ( = ?auto_558278 ?auto_558284 ) ) ( not ( = ?auto_558278 ?auto_558285 ) ) ( not ( = ?auto_558278 ?auto_558286 ) ) ( not ( = ?auto_558279 ?auto_558280 ) ) ( not ( = ?auto_558279 ?auto_558281 ) ) ( not ( = ?auto_558279 ?auto_558282 ) ) ( not ( = ?auto_558279 ?auto_558283 ) ) ( not ( = ?auto_558279 ?auto_558284 ) ) ( not ( = ?auto_558279 ?auto_558285 ) ) ( not ( = ?auto_558279 ?auto_558286 ) ) ( not ( = ?auto_558280 ?auto_558281 ) ) ( not ( = ?auto_558280 ?auto_558282 ) ) ( not ( = ?auto_558280 ?auto_558283 ) ) ( not ( = ?auto_558280 ?auto_558284 ) ) ( not ( = ?auto_558280 ?auto_558285 ) ) ( not ( = ?auto_558280 ?auto_558286 ) ) ( not ( = ?auto_558281 ?auto_558282 ) ) ( not ( = ?auto_558281 ?auto_558283 ) ) ( not ( = ?auto_558281 ?auto_558284 ) ) ( not ( = ?auto_558281 ?auto_558285 ) ) ( not ( = ?auto_558281 ?auto_558286 ) ) ( not ( = ?auto_558282 ?auto_558283 ) ) ( not ( = ?auto_558282 ?auto_558284 ) ) ( not ( = ?auto_558282 ?auto_558285 ) ) ( not ( = ?auto_558282 ?auto_558286 ) ) ( not ( = ?auto_558283 ?auto_558284 ) ) ( not ( = ?auto_558283 ?auto_558285 ) ) ( not ( = ?auto_558283 ?auto_558286 ) ) ( not ( = ?auto_558284 ?auto_558285 ) ) ( not ( = ?auto_558284 ?auto_558286 ) ) ( not ( = ?auto_558285 ?auto_558286 ) ) ( ON ?auto_558285 ?auto_558286 ) ( ON ?auto_558284 ?auto_558285 ) ( ON ?auto_558283 ?auto_558284 ) ( CLEAR ?auto_558281 ) ( ON ?auto_558282 ?auto_558283 ) ( CLEAR ?auto_558282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_558271 ?auto_558272 ?auto_558273 ?auto_558274 ?auto_558275 ?auto_558276 ?auto_558277 ?auto_558278 ?auto_558279 ?auto_558280 ?auto_558281 ?auto_558282 )
      ( MAKE-16PILE ?auto_558271 ?auto_558272 ?auto_558273 ?auto_558274 ?auto_558275 ?auto_558276 ?auto_558277 ?auto_558278 ?auto_558279 ?auto_558280 ?auto_558281 ?auto_558282 ?auto_558283 ?auto_558284 ?auto_558285 ?auto_558286 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558303 - BLOCK
      ?auto_558304 - BLOCK
      ?auto_558305 - BLOCK
      ?auto_558306 - BLOCK
      ?auto_558307 - BLOCK
      ?auto_558308 - BLOCK
      ?auto_558309 - BLOCK
      ?auto_558310 - BLOCK
      ?auto_558311 - BLOCK
      ?auto_558312 - BLOCK
      ?auto_558313 - BLOCK
      ?auto_558314 - BLOCK
      ?auto_558315 - BLOCK
      ?auto_558316 - BLOCK
      ?auto_558317 - BLOCK
      ?auto_558318 - BLOCK
    )
    :vars
    (
      ?auto_558319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558318 ?auto_558319 ) ( ON-TABLE ?auto_558303 ) ( ON ?auto_558304 ?auto_558303 ) ( ON ?auto_558305 ?auto_558304 ) ( ON ?auto_558306 ?auto_558305 ) ( ON ?auto_558307 ?auto_558306 ) ( ON ?auto_558308 ?auto_558307 ) ( ON ?auto_558309 ?auto_558308 ) ( ON ?auto_558310 ?auto_558309 ) ( ON ?auto_558311 ?auto_558310 ) ( ON ?auto_558312 ?auto_558311 ) ( not ( = ?auto_558303 ?auto_558304 ) ) ( not ( = ?auto_558303 ?auto_558305 ) ) ( not ( = ?auto_558303 ?auto_558306 ) ) ( not ( = ?auto_558303 ?auto_558307 ) ) ( not ( = ?auto_558303 ?auto_558308 ) ) ( not ( = ?auto_558303 ?auto_558309 ) ) ( not ( = ?auto_558303 ?auto_558310 ) ) ( not ( = ?auto_558303 ?auto_558311 ) ) ( not ( = ?auto_558303 ?auto_558312 ) ) ( not ( = ?auto_558303 ?auto_558313 ) ) ( not ( = ?auto_558303 ?auto_558314 ) ) ( not ( = ?auto_558303 ?auto_558315 ) ) ( not ( = ?auto_558303 ?auto_558316 ) ) ( not ( = ?auto_558303 ?auto_558317 ) ) ( not ( = ?auto_558303 ?auto_558318 ) ) ( not ( = ?auto_558303 ?auto_558319 ) ) ( not ( = ?auto_558304 ?auto_558305 ) ) ( not ( = ?auto_558304 ?auto_558306 ) ) ( not ( = ?auto_558304 ?auto_558307 ) ) ( not ( = ?auto_558304 ?auto_558308 ) ) ( not ( = ?auto_558304 ?auto_558309 ) ) ( not ( = ?auto_558304 ?auto_558310 ) ) ( not ( = ?auto_558304 ?auto_558311 ) ) ( not ( = ?auto_558304 ?auto_558312 ) ) ( not ( = ?auto_558304 ?auto_558313 ) ) ( not ( = ?auto_558304 ?auto_558314 ) ) ( not ( = ?auto_558304 ?auto_558315 ) ) ( not ( = ?auto_558304 ?auto_558316 ) ) ( not ( = ?auto_558304 ?auto_558317 ) ) ( not ( = ?auto_558304 ?auto_558318 ) ) ( not ( = ?auto_558304 ?auto_558319 ) ) ( not ( = ?auto_558305 ?auto_558306 ) ) ( not ( = ?auto_558305 ?auto_558307 ) ) ( not ( = ?auto_558305 ?auto_558308 ) ) ( not ( = ?auto_558305 ?auto_558309 ) ) ( not ( = ?auto_558305 ?auto_558310 ) ) ( not ( = ?auto_558305 ?auto_558311 ) ) ( not ( = ?auto_558305 ?auto_558312 ) ) ( not ( = ?auto_558305 ?auto_558313 ) ) ( not ( = ?auto_558305 ?auto_558314 ) ) ( not ( = ?auto_558305 ?auto_558315 ) ) ( not ( = ?auto_558305 ?auto_558316 ) ) ( not ( = ?auto_558305 ?auto_558317 ) ) ( not ( = ?auto_558305 ?auto_558318 ) ) ( not ( = ?auto_558305 ?auto_558319 ) ) ( not ( = ?auto_558306 ?auto_558307 ) ) ( not ( = ?auto_558306 ?auto_558308 ) ) ( not ( = ?auto_558306 ?auto_558309 ) ) ( not ( = ?auto_558306 ?auto_558310 ) ) ( not ( = ?auto_558306 ?auto_558311 ) ) ( not ( = ?auto_558306 ?auto_558312 ) ) ( not ( = ?auto_558306 ?auto_558313 ) ) ( not ( = ?auto_558306 ?auto_558314 ) ) ( not ( = ?auto_558306 ?auto_558315 ) ) ( not ( = ?auto_558306 ?auto_558316 ) ) ( not ( = ?auto_558306 ?auto_558317 ) ) ( not ( = ?auto_558306 ?auto_558318 ) ) ( not ( = ?auto_558306 ?auto_558319 ) ) ( not ( = ?auto_558307 ?auto_558308 ) ) ( not ( = ?auto_558307 ?auto_558309 ) ) ( not ( = ?auto_558307 ?auto_558310 ) ) ( not ( = ?auto_558307 ?auto_558311 ) ) ( not ( = ?auto_558307 ?auto_558312 ) ) ( not ( = ?auto_558307 ?auto_558313 ) ) ( not ( = ?auto_558307 ?auto_558314 ) ) ( not ( = ?auto_558307 ?auto_558315 ) ) ( not ( = ?auto_558307 ?auto_558316 ) ) ( not ( = ?auto_558307 ?auto_558317 ) ) ( not ( = ?auto_558307 ?auto_558318 ) ) ( not ( = ?auto_558307 ?auto_558319 ) ) ( not ( = ?auto_558308 ?auto_558309 ) ) ( not ( = ?auto_558308 ?auto_558310 ) ) ( not ( = ?auto_558308 ?auto_558311 ) ) ( not ( = ?auto_558308 ?auto_558312 ) ) ( not ( = ?auto_558308 ?auto_558313 ) ) ( not ( = ?auto_558308 ?auto_558314 ) ) ( not ( = ?auto_558308 ?auto_558315 ) ) ( not ( = ?auto_558308 ?auto_558316 ) ) ( not ( = ?auto_558308 ?auto_558317 ) ) ( not ( = ?auto_558308 ?auto_558318 ) ) ( not ( = ?auto_558308 ?auto_558319 ) ) ( not ( = ?auto_558309 ?auto_558310 ) ) ( not ( = ?auto_558309 ?auto_558311 ) ) ( not ( = ?auto_558309 ?auto_558312 ) ) ( not ( = ?auto_558309 ?auto_558313 ) ) ( not ( = ?auto_558309 ?auto_558314 ) ) ( not ( = ?auto_558309 ?auto_558315 ) ) ( not ( = ?auto_558309 ?auto_558316 ) ) ( not ( = ?auto_558309 ?auto_558317 ) ) ( not ( = ?auto_558309 ?auto_558318 ) ) ( not ( = ?auto_558309 ?auto_558319 ) ) ( not ( = ?auto_558310 ?auto_558311 ) ) ( not ( = ?auto_558310 ?auto_558312 ) ) ( not ( = ?auto_558310 ?auto_558313 ) ) ( not ( = ?auto_558310 ?auto_558314 ) ) ( not ( = ?auto_558310 ?auto_558315 ) ) ( not ( = ?auto_558310 ?auto_558316 ) ) ( not ( = ?auto_558310 ?auto_558317 ) ) ( not ( = ?auto_558310 ?auto_558318 ) ) ( not ( = ?auto_558310 ?auto_558319 ) ) ( not ( = ?auto_558311 ?auto_558312 ) ) ( not ( = ?auto_558311 ?auto_558313 ) ) ( not ( = ?auto_558311 ?auto_558314 ) ) ( not ( = ?auto_558311 ?auto_558315 ) ) ( not ( = ?auto_558311 ?auto_558316 ) ) ( not ( = ?auto_558311 ?auto_558317 ) ) ( not ( = ?auto_558311 ?auto_558318 ) ) ( not ( = ?auto_558311 ?auto_558319 ) ) ( not ( = ?auto_558312 ?auto_558313 ) ) ( not ( = ?auto_558312 ?auto_558314 ) ) ( not ( = ?auto_558312 ?auto_558315 ) ) ( not ( = ?auto_558312 ?auto_558316 ) ) ( not ( = ?auto_558312 ?auto_558317 ) ) ( not ( = ?auto_558312 ?auto_558318 ) ) ( not ( = ?auto_558312 ?auto_558319 ) ) ( not ( = ?auto_558313 ?auto_558314 ) ) ( not ( = ?auto_558313 ?auto_558315 ) ) ( not ( = ?auto_558313 ?auto_558316 ) ) ( not ( = ?auto_558313 ?auto_558317 ) ) ( not ( = ?auto_558313 ?auto_558318 ) ) ( not ( = ?auto_558313 ?auto_558319 ) ) ( not ( = ?auto_558314 ?auto_558315 ) ) ( not ( = ?auto_558314 ?auto_558316 ) ) ( not ( = ?auto_558314 ?auto_558317 ) ) ( not ( = ?auto_558314 ?auto_558318 ) ) ( not ( = ?auto_558314 ?auto_558319 ) ) ( not ( = ?auto_558315 ?auto_558316 ) ) ( not ( = ?auto_558315 ?auto_558317 ) ) ( not ( = ?auto_558315 ?auto_558318 ) ) ( not ( = ?auto_558315 ?auto_558319 ) ) ( not ( = ?auto_558316 ?auto_558317 ) ) ( not ( = ?auto_558316 ?auto_558318 ) ) ( not ( = ?auto_558316 ?auto_558319 ) ) ( not ( = ?auto_558317 ?auto_558318 ) ) ( not ( = ?auto_558317 ?auto_558319 ) ) ( not ( = ?auto_558318 ?auto_558319 ) ) ( ON ?auto_558317 ?auto_558318 ) ( ON ?auto_558316 ?auto_558317 ) ( ON ?auto_558315 ?auto_558316 ) ( ON ?auto_558314 ?auto_558315 ) ( CLEAR ?auto_558312 ) ( ON ?auto_558313 ?auto_558314 ) ( CLEAR ?auto_558313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_558303 ?auto_558304 ?auto_558305 ?auto_558306 ?auto_558307 ?auto_558308 ?auto_558309 ?auto_558310 ?auto_558311 ?auto_558312 ?auto_558313 )
      ( MAKE-16PILE ?auto_558303 ?auto_558304 ?auto_558305 ?auto_558306 ?auto_558307 ?auto_558308 ?auto_558309 ?auto_558310 ?auto_558311 ?auto_558312 ?auto_558313 ?auto_558314 ?auto_558315 ?auto_558316 ?auto_558317 ?auto_558318 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558336 - BLOCK
      ?auto_558337 - BLOCK
      ?auto_558338 - BLOCK
      ?auto_558339 - BLOCK
      ?auto_558340 - BLOCK
      ?auto_558341 - BLOCK
      ?auto_558342 - BLOCK
      ?auto_558343 - BLOCK
      ?auto_558344 - BLOCK
      ?auto_558345 - BLOCK
      ?auto_558346 - BLOCK
      ?auto_558347 - BLOCK
      ?auto_558348 - BLOCK
      ?auto_558349 - BLOCK
      ?auto_558350 - BLOCK
      ?auto_558351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558351 ) ( ON-TABLE ?auto_558336 ) ( ON ?auto_558337 ?auto_558336 ) ( ON ?auto_558338 ?auto_558337 ) ( ON ?auto_558339 ?auto_558338 ) ( ON ?auto_558340 ?auto_558339 ) ( ON ?auto_558341 ?auto_558340 ) ( ON ?auto_558342 ?auto_558341 ) ( ON ?auto_558343 ?auto_558342 ) ( ON ?auto_558344 ?auto_558343 ) ( ON ?auto_558345 ?auto_558344 ) ( not ( = ?auto_558336 ?auto_558337 ) ) ( not ( = ?auto_558336 ?auto_558338 ) ) ( not ( = ?auto_558336 ?auto_558339 ) ) ( not ( = ?auto_558336 ?auto_558340 ) ) ( not ( = ?auto_558336 ?auto_558341 ) ) ( not ( = ?auto_558336 ?auto_558342 ) ) ( not ( = ?auto_558336 ?auto_558343 ) ) ( not ( = ?auto_558336 ?auto_558344 ) ) ( not ( = ?auto_558336 ?auto_558345 ) ) ( not ( = ?auto_558336 ?auto_558346 ) ) ( not ( = ?auto_558336 ?auto_558347 ) ) ( not ( = ?auto_558336 ?auto_558348 ) ) ( not ( = ?auto_558336 ?auto_558349 ) ) ( not ( = ?auto_558336 ?auto_558350 ) ) ( not ( = ?auto_558336 ?auto_558351 ) ) ( not ( = ?auto_558337 ?auto_558338 ) ) ( not ( = ?auto_558337 ?auto_558339 ) ) ( not ( = ?auto_558337 ?auto_558340 ) ) ( not ( = ?auto_558337 ?auto_558341 ) ) ( not ( = ?auto_558337 ?auto_558342 ) ) ( not ( = ?auto_558337 ?auto_558343 ) ) ( not ( = ?auto_558337 ?auto_558344 ) ) ( not ( = ?auto_558337 ?auto_558345 ) ) ( not ( = ?auto_558337 ?auto_558346 ) ) ( not ( = ?auto_558337 ?auto_558347 ) ) ( not ( = ?auto_558337 ?auto_558348 ) ) ( not ( = ?auto_558337 ?auto_558349 ) ) ( not ( = ?auto_558337 ?auto_558350 ) ) ( not ( = ?auto_558337 ?auto_558351 ) ) ( not ( = ?auto_558338 ?auto_558339 ) ) ( not ( = ?auto_558338 ?auto_558340 ) ) ( not ( = ?auto_558338 ?auto_558341 ) ) ( not ( = ?auto_558338 ?auto_558342 ) ) ( not ( = ?auto_558338 ?auto_558343 ) ) ( not ( = ?auto_558338 ?auto_558344 ) ) ( not ( = ?auto_558338 ?auto_558345 ) ) ( not ( = ?auto_558338 ?auto_558346 ) ) ( not ( = ?auto_558338 ?auto_558347 ) ) ( not ( = ?auto_558338 ?auto_558348 ) ) ( not ( = ?auto_558338 ?auto_558349 ) ) ( not ( = ?auto_558338 ?auto_558350 ) ) ( not ( = ?auto_558338 ?auto_558351 ) ) ( not ( = ?auto_558339 ?auto_558340 ) ) ( not ( = ?auto_558339 ?auto_558341 ) ) ( not ( = ?auto_558339 ?auto_558342 ) ) ( not ( = ?auto_558339 ?auto_558343 ) ) ( not ( = ?auto_558339 ?auto_558344 ) ) ( not ( = ?auto_558339 ?auto_558345 ) ) ( not ( = ?auto_558339 ?auto_558346 ) ) ( not ( = ?auto_558339 ?auto_558347 ) ) ( not ( = ?auto_558339 ?auto_558348 ) ) ( not ( = ?auto_558339 ?auto_558349 ) ) ( not ( = ?auto_558339 ?auto_558350 ) ) ( not ( = ?auto_558339 ?auto_558351 ) ) ( not ( = ?auto_558340 ?auto_558341 ) ) ( not ( = ?auto_558340 ?auto_558342 ) ) ( not ( = ?auto_558340 ?auto_558343 ) ) ( not ( = ?auto_558340 ?auto_558344 ) ) ( not ( = ?auto_558340 ?auto_558345 ) ) ( not ( = ?auto_558340 ?auto_558346 ) ) ( not ( = ?auto_558340 ?auto_558347 ) ) ( not ( = ?auto_558340 ?auto_558348 ) ) ( not ( = ?auto_558340 ?auto_558349 ) ) ( not ( = ?auto_558340 ?auto_558350 ) ) ( not ( = ?auto_558340 ?auto_558351 ) ) ( not ( = ?auto_558341 ?auto_558342 ) ) ( not ( = ?auto_558341 ?auto_558343 ) ) ( not ( = ?auto_558341 ?auto_558344 ) ) ( not ( = ?auto_558341 ?auto_558345 ) ) ( not ( = ?auto_558341 ?auto_558346 ) ) ( not ( = ?auto_558341 ?auto_558347 ) ) ( not ( = ?auto_558341 ?auto_558348 ) ) ( not ( = ?auto_558341 ?auto_558349 ) ) ( not ( = ?auto_558341 ?auto_558350 ) ) ( not ( = ?auto_558341 ?auto_558351 ) ) ( not ( = ?auto_558342 ?auto_558343 ) ) ( not ( = ?auto_558342 ?auto_558344 ) ) ( not ( = ?auto_558342 ?auto_558345 ) ) ( not ( = ?auto_558342 ?auto_558346 ) ) ( not ( = ?auto_558342 ?auto_558347 ) ) ( not ( = ?auto_558342 ?auto_558348 ) ) ( not ( = ?auto_558342 ?auto_558349 ) ) ( not ( = ?auto_558342 ?auto_558350 ) ) ( not ( = ?auto_558342 ?auto_558351 ) ) ( not ( = ?auto_558343 ?auto_558344 ) ) ( not ( = ?auto_558343 ?auto_558345 ) ) ( not ( = ?auto_558343 ?auto_558346 ) ) ( not ( = ?auto_558343 ?auto_558347 ) ) ( not ( = ?auto_558343 ?auto_558348 ) ) ( not ( = ?auto_558343 ?auto_558349 ) ) ( not ( = ?auto_558343 ?auto_558350 ) ) ( not ( = ?auto_558343 ?auto_558351 ) ) ( not ( = ?auto_558344 ?auto_558345 ) ) ( not ( = ?auto_558344 ?auto_558346 ) ) ( not ( = ?auto_558344 ?auto_558347 ) ) ( not ( = ?auto_558344 ?auto_558348 ) ) ( not ( = ?auto_558344 ?auto_558349 ) ) ( not ( = ?auto_558344 ?auto_558350 ) ) ( not ( = ?auto_558344 ?auto_558351 ) ) ( not ( = ?auto_558345 ?auto_558346 ) ) ( not ( = ?auto_558345 ?auto_558347 ) ) ( not ( = ?auto_558345 ?auto_558348 ) ) ( not ( = ?auto_558345 ?auto_558349 ) ) ( not ( = ?auto_558345 ?auto_558350 ) ) ( not ( = ?auto_558345 ?auto_558351 ) ) ( not ( = ?auto_558346 ?auto_558347 ) ) ( not ( = ?auto_558346 ?auto_558348 ) ) ( not ( = ?auto_558346 ?auto_558349 ) ) ( not ( = ?auto_558346 ?auto_558350 ) ) ( not ( = ?auto_558346 ?auto_558351 ) ) ( not ( = ?auto_558347 ?auto_558348 ) ) ( not ( = ?auto_558347 ?auto_558349 ) ) ( not ( = ?auto_558347 ?auto_558350 ) ) ( not ( = ?auto_558347 ?auto_558351 ) ) ( not ( = ?auto_558348 ?auto_558349 ) ) ( not ( = ?auto_558348 ?auto_558350 ) ) ( not ( = ?auto_558348 ?auto_558351 ) ) ( not ( = ?auto_558349 ?auto_558350 ) ) ( not ( = ?auto_558349 ?auto_558351 ) ) ( not ( = ?auto_558350 ?auto_558351 ) ) ( ON ?auto_558350 ?auto_558351 ) ( ON ?auto_558349 ?auto_558350 ) ( ON ?auto_558348 ?auto_558349 ) ( ON ?auto_558347 ?auto_558348 ) ( CLEAR ?auto_558345 ) ( ON ?auto_558346 ?auto_558347 ) ( CLEAR ?auto_558346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_558336 ?auto_558337 ?auto_558338 ?auto_558339 ?auto_558340 ?auto_558341 ?auto_558342 ?auto_558343 ?auto_558344 ?auto_558345 ?auto_558346 )
      ( MAKE-16PILE ?auto_558336 ?auto_558337 ?auto_558338 ?auto_558339 ?auto_558340 ?auto_558341 ?auto_558342 ?auto_558343 ?auto_558344 ?auto_558345 ?auto_558346 ?auto_558347 ?auto_558348 ?auto_558349 ?auto_558350 ?auto_558351 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558368 - BLOCK
      ?auto_558369 - BLOCK
      ?auto_558370 - BLOCK
      ?auto_558371 - BLOCK
      ?auto_558372 - BLOCK
      ?auto_558373 - BLOCK
      ?auto_558374 - BLOCK
      ?auto_558375 - BLOCK
      ?auto_558376 - BLOCK
      ?auto_558377 - BLOCK
      ?auto_558378 - BLOCK
      ?auto_558379 - BLOCK
      ?auto_558380 - BLOCK
      ?auto_558381 - BLOCK
      ?auto_558382 - BLOCK
      ?auto_558383 - BLOCK
    )
    :vars
    (
      ?auto_558384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558383 ?auto_558384 ) ( ON-TABLE ?auto_558368 ) ( ON ?auto_558369 ?auto_558368 ) ( ON ?auto_558370 ?auto_558369 ) ( ON ?auto_558371 ?auto_558370 ) ( ON ?auto_558372 ?auto_558371 ) ( ON ?auto_558373 ?auto_558372 ) ( ON ?auto_558374 ?auto_558373 ) ( ON ?auto_558375 ?auto_558374 ) ( ON ?auto_558376 ?auto_558375 ) ( not ( = ?auto_558368 ?auto_558369 ) ) ( not ( = ?auto_558368 ?auto_558370 ) ) ( not ( = ?auto_558368 ?auto_558371 ) ) ( not ( = ?auto_558368 ?auto_558372 ) ) ( not ( = ?auto_558368 ?auto_558373 ) ) ( not ( = ?auto_558368 ?auto_558374 ) ) ( not ( = ?auto_558368 ?auto_558375 ) ) ( not ( = ?auto_558368 ?auto_558376 ) ) ( not ( = ?auto_558368 ?auto_558377 ) ) ( not ( = ?auto_558368 ?auto_558378 ) ) ( not ( = ?auto_558368 ?auto_558379 ) ) ( not ( = ?auto_558368 ?auto_558380 ) ) ( not ( = ?auto_558368 ?auto_558381 ) ) ( not ( = ?auto_558368 ?auto_558382 ) ) ( not ( = ?auto_558368 ?auto_558383 ) ) ( not ( = ?auto_558368 ?auto_558384 ) ) ( not ( = ?auto_558369 ?auto_558370 ) ) ( not ( = ?auto_558369 ?auto_558371 ) ) ( not ( = ?auto_558369 ?auto_558372 ) ) ( not ( = ?auto_558369 ?auto_558373 ) ) ( not ( = ?auto_558369 ?auto_558374 ) ) ( not ( = ?auto_558369 ?auto_558375 ) ) ( not ( = ?auto_558369 ?auto_558376 ) ) ( not ( = ?auto_558369 ?auto_558377 ) ) ( not ( = ?auto_558369 ?auto_558378 ) ) ( not ( = ?auto_558369 ?auto_558379 ) ) ( not ( = ?auto_558369 ?auto_558380 ) ) ( not ( = ?auto_558369 ?auto_558381 ) ) ( not ( = ?auto_558369 ?auto_558382 ) ) ( not ( = ?auto_558369 ?auto_558383 ) ) ( not ( = ?auto_558369 ?auto_558384 ) ) ( not ( = ?auto_558370 ?auto_558371 ) ) ( not ( = ?auto_558370 ?auto_558372 ) ) ( not ( = ?auto_558370 ?auto_558373 ) ) ( not ( = ?auto_558370 ?auto_558374 ) ) ( not ( = ?auto_558370 ?auto_558375 ) ) ( not ( = ?auto_558370 ?auto_558376 ) ) ( not ( = ?auto_558370 ?auto_558377 ) ) ( not ( = ?auto_558370 ?auto_558378 ) ) ( not ( = ?auto_558370 ?auto_558379 ) ) ( not ( = ?auto_558370 ?auto_558380 ) ) ( not ( = ?auto_558370 ?auto_558381 ) ) ( not ( = ?auto_558370 ?auto_558382 ) ) ( not ( = ?auto_558370 ?auto_558383 ) ) ( not ( = ?auto_558370 ?auto_558384 ) ) ( not ( = ?auto_558371 ?auto_558372 ) ) ( not ( = ?auto_558371 ?auto_558373 ) ) ( not ( = ?auto_558371 ?auto_558374 ) ) ( not ( = ?auto_558371 ?auto_558375 ) ) ( not ( = ?auto_558371 ?auto_558376 ) ) ( not ( = ?auto_558371 ?auto_558377 ) ) ( not ( = ?auto_558371 ?auto_558378 ) ) ( not ( = ?auto_558371 ?auto_558379 ) ) ( not ( = ?auto_558371 ?auto_558380 ) ) ( not ( = ?auto_558371 ?auto_558381 ) ) ( not ( = ?auto_558371 ?auto_558382 ) ) ( not ( = ?auto_558371 ?auto_558383 ) ) ( not ( = ?auto_558371 ?auto_558384 ) ) ( not ( = ?auto_558372 ?auto_558373 ) ) ( not ( = ?auto_558372 ?auto_558374 ) ) ( not ( = ?auto_558372 ?auto_558375 ) ) ( not ( = ?auto_558372 ?auto_558376 ) ) ( not ( = ?auto_558372 ?auto_558377 ) ) ( not ( = ?auto_558372 ?auto_558378 ) ) ( not ( = ?auto_558372 ?auto_558379 ) ) ( not ( = ?auto_558372 ?auto_558380 ) ) ( not ( = ?auto_558372 ?auto_558381 ) ) ( not ( = ?auto_558372 ?auto_558382 ) ) ( not ( = ?auto_558372 ?auto_558383 ) ) ( not ( = ?auto_558372 ?auto_558384 ) ) ( not ( = ?auto_558373 ?auto_558374 ) ) ( not ( = ?auto_558373 ?auto_558375 ) ) ( not ( = ?auto_558373 ?auto_558376 ) ) ( not ( = ?auto_558373 ?auto_558377 ) ) ( not ( = ?auto_558373 ?auto_558378 ) ) ( not ( = ?auto_558373 ?auto_558379 ) ) ( not ( = ?auto_558373 ?auto_558380 ) ) ( not ( = ?auto_558373 ?auto_558381 ) ) ( not ( = ?auto_558373 ?auto_558382 ) ) ( not ( = ?auto_558373 ?auto_558383 ) ) ( not ( = ?auto_558373 ?auto_558384 ) ) ( not ( = ?auto_558374 ?auto_558375 ) ) ( not ( = ?auto_558374 ?auto_558376 ) ) ( not ( = ?auto_558374 ?auto_558377 ) ) ( not ( = ?auto_558374 ?auto_558378 ) ) ( not ( = ?auto_558374 ?auto_558379 ) ) ( not ( = ?auto_558374 ?auto_558380 ) ) ( not ( = ?auto_558374 ?auto_558381 ) ) ( not ( = ?auto_558374 ?auto_558382 ) ) ( not ( = ?auto_558374 ?auto_558383 ) ) ( not ( = ?auto_558374 ?auto_558384 ) ) ( not ( = ?auto_558375 ?auto_558376 ) ) ( not ( = ?auto_558375 ?auto_558377 ) ) ( not ( = ?auto_558375 ?auto_558378 ) ) ( not ( = ?auto_558375 ?auto_558379 ) ) ( not ( = ?auto_558375 ?auto_558380 ) ) ( not ( = ?auto_558375 ?auto_558381 ) ) ( not ( = ?auto_558375 ?auto_558382 ) ) ( not ( = ?auto_558375 ?auto_558383 ) ) ( not ( = ?auto_558375 ?auto_558384 ) ) ( not ( = ?auto_558376 ?auto_558377 ) ) ( not ( = ?auto_558376 ?auto_558378 ) ) ( not ( = ?auto_558376 ?auto_558379 ) ) ( not ( = ?auto_558376 ?auto_558380 ) ) ( not ( = ?auto_558376 ?auto_558381 ) ) ( not ( = ?auto_558376 ?auto_558382 ) ) ( not ( = ?auto_558376 ?auto_558383 ) ) ( not ( = ?auto_558376 ?auto_558384 ) ) ( not ( = ?auto_558377 ?auto_558378 ) ) ( not ( = ?auto_558377 ?auto_558379 ) ) ( not ( = ?auto_558377 ?auto_558380 ) ) ( not ( = ?auto_558377 ?auto_558381 ) ) ( not ( = ?auto_558377 ?auto_558382 ) ) ( not ( = ?auto_558377 ?auto_558383 ) ) ( not ( = ?auto_558377 ?auto_558384 ) ) ( not ( = ?auto_558378 ?auto_558379 ) ) ( not ( = ?auto_558378 ?auto_558380 ) ) ( not ( = ?auto_558378 ?auto_558381 ) ) ( not ( = ?auto_558378 ?auto_558382 ) ) ( not ( = ?auto_558378 ?auto_558383 ) ) ( not ( = ?auto_558378 ?auto_558384 ) ) ( not ( = ?auto_558379 ?auto_558380 ) ) ( not ( = ?auto_558379 ?auto_558381 ) ) ( not ( = ?auto_558379 ?auto_558382 ) ) ( not ( = ?auto_558379 ?auto_558383 ) ) ( not ( = ?auto_558379 ?auto_558384 ) ) ( not ( = ?auto_558380 ?auto_558381 ) ) ( not ( = ?auto_558380 ?auto_558382 ) ) ( not ( = ?auto_558380 ?auto_558383 ) ) ( not ( = ?auto_558380 ?auto_558384 ) ) ( not ( = ?auto_558381 ?auto_558382 ) ) ( not ( = ?auto_558381 ?auto_558383 ) ) ( not ( = ?auto_558381 ?auto_558384 ) ) ( not ( = ?auto_558382 ?auto_558383 ) ) ( not ( = ?auto_558382 ?auto_558384 ) ) ( not ( = ?auto_558383 ?auto_558384 ) ) ( ON ?auto_558382 ?auto_558383 ) ( ON ?auto_558381 ?auto_558382 ) ( ON ?auto_558380 ?auto_558381 ) ( ON ?auto_558379 ?auto_558380 ) ( ON ?auto_558378 ?auto_558379 ) ( CLEAR ?auto_558376 ) ( ON ?auto_558377 ?auto_558378 ) ( CLEAR ?auto_558377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_558368 ?auto_558369 ?auto_558370 ?auto_558371 ?auto_558372 ?auto_558373 ?auto_558374 ?auto_558375 ?auto_558376 ?auto_558377 )
      ( MAKE-16PILE ?auto_558368 ?auto_558369 ?auto_558370 ?auto_558371 ?auto_558372 ?auto_558373 ?auto_558374 ?auto_558375 ?auto_558376 ?auto_558377 ?auto_558378 ?auto_558379 ?auto_558380 ?auto_558381 ?auto_558382 ?auto_558383 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558401 - BLOCK
      ?auto_558402 - BLOCK
      ?auto_558403 - BLOCK
      ?auto_558404 - BLOCK
      ?auto_558405 - BLOCK
      ?auto_558406 - BLOCK
      ?auto_558407 - BLOCK
      ?auto_558408 - BLOCK
      ?auto_558409 - BLOCK
      ?auto_558410 - BLOCK
      ?auto_558411 - BLOCK
      ?auto_558412 - BLOCK
      ?auto_558413 - BLOCK
      ?auto_558414 - BLOCK
      ?auto_558415 - BLOCK
      ?auto_558416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558416 ) ( ON-TABLE ?auto_558401 ) ( ON ?auto_558402 ?auto_558401 ) ( ON ?auto_558403 ?auto_558402 ) ( ON ?auto_558404 ?auto_558403 ) ( ON ?auto_558405 ?auto_558404 ) ( ON ?auto_558406 ?auto_558405 ) ( ON ?auto_558407 ?auto_558406 ) ( ON ?auto_558408 ?auto_558407 ) ( ON ?auto_558409 ?auto_558408 ) ( not ( = ?auto_558401 ?auto_558402 ) ) ( not ( = ?auto_558401 ?auto_558403 ) ) ( not ( = ?auto_558401 ?auto_558404 ) ) ( not ( = ?auto_558401 ?auto_558405 ) ) ( not ( = ?auto_558401 ?auto_558406 ) ) ( not ( = ?auto_558401 ?auto_558407 ) ) ( not ( = ?auto_558401 ?auto_558408 ) ) ( not ( = ?auto_558401 ?auto_558409 ) ) ( not ( = ?auto_558401 ?auto_558410 ) ) ( not ( = ?auto_558401 ?auto_558411 ) ) ( not ( = ?auto_558401 ?auto_558412 ) ) ( not ( = ?auto_558401 ?auto_558413 ) ) ( not ( = ?auto_558401 ?auto_558414 ) ) ( not ( = ?auto_558401 ?auto_558415 ) ) ( not ( = ?auto_558401 ?auto_558416 ) ) ( not ( = ?auto_558402 ?auto_558403 ) ) ( not ( = ?auto_558402 ?auto_558404 ) ) ( not ( = ?auto_558402 ?auto_558405 ) ) ( not ( = ?auto_558402 ?auto_558406 ) ) ( not ( = ?auto_558402 ?auto_558407 ) ) ( not ( = ?auto_558402 ?auto_558408 ) ) ( not ( = ?auto_558402 ?auto_558409 ) ) ( not ( = ?auto_558402 ?auto_558410 ) ) ( not ( = ?auto_558402 ?auto_558411 ) ) ( not ( = ?auto_558402 ?auto_558412 ) ) ( not ( = ?auto_558402 ?auto_558413 ) ) ( not ( = ?auto_558402 ?auto_558414 ) ) ( not ( = ?auto_558402 ?auto_558415 ) ) ( not ( = ?auto_558402 ?auto_558416 ) ) ( not ( = ?auto_558403 ?auto_558404 ) ) ( not ( = ?auto_558403 ?auto_558405 ) ) ( not ( = ?auto_558403 ?auto_558406 ) ) ( not ( = ?auto_558403 ?auto_558407 ) ) ( not ( = ?auto_558403 ?auto_558408 ) ) ( not ( = ?auto_558403 ?auto_558409 ) ) ( not ( = ?auto_558403 ?auto_558410 ) ) ( not ( = ?auto_558403 ?auto_558411 ) ) ( not ( = ?auto_558403 ?auto_558412 ) ) ( not ( = ?auto_558403 ?auto_558413 ) ) ( not ( = ?auto_558403 ?auto_558414 ) ) ( not ( = ?auto_558403 ?auto_558415 ) ) ( not ( = ?auto_558403 ?auto_558416 ) ) ( not ( = ?auto_558404 ?auto_558405 ) ) ( not ( = ?auto_558404 ?auto_558406 ) ) ( not ( = ?auto_558404 ?auto_558407 ) ) ( not ( = ?auto_558404 ?auto_558408 ) ) ( not ( = ?auto_558404 ?auto_558409 ) ) ( not ( = ?auto_558404 ?auto_558410 ) ) ( not ( = ?auto_558404 ?auto_558411 ) ) ( not ( = ?auto_558404 ?auto_558412 ) ) ( not ( = ?auto_558404 ?auto_558413 ) ) ( not ( = ?auto_558404 ?auto_558414 ) ) ( not ( = ?auto_558404 ?auto_558415 ) ) ( not ( = ?auto_558404 ?auto_558416 ) ) ( not ( = ?auto_558405 ?auto_558406 ) ) ( not ( = ?auto_558405 ?auto_558407 ) ) ( not ( = ?auto_558405 ?auto_558408 ) ) ( not ( = ?auto_558405 ?auto_558409 ) ) ( not ( = ?auto_558405 ?auto_558410 ) ) ( not ( = ?auto_558405 ?auto_558411 ) ) ( not ( = ?auto_558405 ?auto_558412 ) ) ( not ( = ?auto_558405 ?auto_558413 ) ) ( not ( = ?auto_558405 ?auto_558414 ) ) ( not ( = ?auto_558405 ?auto_558415 ) ) ( not ( = ?auto_558405 ?auto_558416 ) ) ( not ( = ?auto_558406 ?auto_558407 ) ) ( not ( = ?auto_558406 ?auto_558408 ) ) ( not ( = ?auto_558406 ?auto_558409 ) ) ( not ( = ?auto_558406 ?auto_558410 ) ) ( not ( = ?auto_558406 ?auto_558411 ) ) ( not ( = ?auto_558406 ?auto_558412 ) ) ( not ( = ?auto_558406 ?auto_558413 ) ) ( not ( = ?auto_558406 ?auto_558414 ) ) ( not ( = ?auto_558406 ?auto_558415 ) ) ( not ( = ?auto_558406 ?auto_558416 ) ) ( not ( = ?auto_558407 ?auto_558408 ) ) ( not ( = ?auto_558407 ?auto_558409 ) ) ( not ( = ?auto_558407 ?auto_558410 ) ) ( not ( = ?auto_558407 ?auto_558411 ) ) ( not ( = ?auto_558407 ?auto_558412 ) ) ( not ( = ?auto_558407 ?auto_558413 ) ) ( not ( = ?auto_558407 ?auto_558414 ) ) ( not ( = ?auto_558407 ?auto_558415 ) ) ( not ( = ?auto_558407 ?auto_558416 ) ) ( not ( = ?auto_558408 ?auto_558409 ) ) ( not ( = ?auto_558408 ?auto_558410 ) ) ( not ( = ?auto_558408 ?auto_558411 ) ) ( not ( = ?auto_558408 ?auto_558412 ) ) ( not ( = ?auto_558408 ?auto_558413 ) ) ( not ( = ?auto_558408 ?auto_558414 ) ) ( not ( = ?auto_558408 ?auto_558415 ) ) ( not ( = ?auto_558408 ?auto_558416 ) ) ( not ( = ?auto_558409 ?auto_558410 ) ) ( not ( = ?auto_558409 ?auto_558411 ) ) ( not ( = ?auto_558409 ?auto_558412 ) ) ( not ( = ?auto_558409 ?auto_558413 ) ) ( not ( = ?auto_558409 ?auto_558414 ) ) ( not ( = ?auto_558409 ?auto_558415 ) ) ( not ( = ?auto_558409 ?auto_558416 ) ) ( not ( = ?auto_558410 ?auto_558411 ) ) ( not ( = ?auto_558410 ?auto_558412 ) ) ( not ( = ?auto_558410 ?auto_558413 ) ) ( not ( = ?auto_558410 ?auto_558414 ) ) ( not ( = ?auto_558410 ?auto_558415 ) ) ( not ( = ?auto_558410 ?auto_558416 ) ) ( not ( = ?auto_558411 ?auto_558412 ) ) ( not ( = ?auto_558411 ?auto_558413 ) ) ( not ( = ?auto_558411 ?auto_558414 ) ) ( not ( = ?auto_558411 ?auto_558415 ) ) ( not ( = ?auto_558411 ?auto_558416 ) ) ( not ( = ?auto_558412 ?auto_558413 ) ) ( not ( = ?auto_558412 ?auto_558414 ) ) ( not ( = ?auto_558412 ?auto_558415 ) ) ( not ( = ?auto_558412 ?auto_558416 ) ) ( not ( = ?auto_558413 ?auto_558414 ) ) ( not ( = ?auto_558413 ?auto_558415 ) ) ( not ( = ?auto_558413 ?auto_558416 ) ) ( not ( = ?auto_558414 ?auto_558415 ) ) ( not ( = ?auto_558414 ?auto_558416 ) ) ( not ( = ?auto_558415 ?auto_558416 ) ) ( ON ?auto_558415 ?auto_558416 ) ( ON ?auto_558414 ?auto_558415 ) ( ON ?auto_558413 ?auto_558414 ) ( ON ?auto_558412 ?auto_558413 ) ( ON ?auto_558411 ?auto_558412 ) ( CLEAR ?auto_558409 ) ( ON ?auto_558410 ?auto_558411 ) ( CLEAR ?auto_558410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_558401 ?auto_558402 ?auto_558403 ?auto_558404 ?auto_558405 ?auto_558406 ?auto_558407 ?auto_558408 ?auto_558409 ?auto_558410 )
      ( MAKE-16PILE ?auto_558401 ?auto_558402 ?auto_558403 ?auto_558404 ?auto_558405 ?auto_558406 ?auto_558407 ?auto_558408 ?auto_558409 ?auto_558410 ?auto_558411 ?auto_558412 ?auto_558413 ?auto_558414 ?auto_558415 ?auto_558416 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558433 - BLOCK
      ?auto_558434 - BLOCK
      ?auto_558435 - BLOCK
      ?auto_558436 - BLOCK
      ?auto_558437 - BLOCK
      ?auto_558438 - BLOCK
      ?auto_558439 - BLOCK
      ?auto_558440 - BLOCK
      ?auto_558441 - BLOCK
      ?auto_558442 - BLOCK
      ?auto_558443 - BLOCK
      ?auto_558444 - BLOCK
      ?auto_558445 - BLOCK
      ?auto_558446 - BLOCK
      ?auto_558447 - BLOCK
      ?auto_558448 - BLOCK
    )
    :vars
    (
      ?auto_558449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558448 ?auto_558449 ) ( ON-TABLE ?auto_558433 ) ( ON ?auto_558434 ?auto_558433 ) ( ON ?auto_558435 ?auto_558434 ) ( ON ?auto_558436 ?auto_558435 ) ( ON ?auto_558437 ?auto_558436 ) ( ON ?auto_558438 ?auto_558437 ) ( ON ?auto_558439 ?auto_558438 ) ( ON ?auto_558440 ?auto_558439 ) ( not ( = ?auto_558433 ?auto_558434 ) ) ( not ( = ?auto_558433 ?auto_558435 ) ) ( not ( = ?auto_558433 ?auto_558436 ) ) ( not ( = ?auto_558433 ?auto_558437 ) ) ( not ( = ?auto_558433 ?auto_558438 ) ) ( not ( = ?auto_558433 ?auto_558439 ) ) ( not ( = ?auto_558433 ?auto_558440 ) ) ( not ( = ?auto_558433 ?auto_558441 ) ) ( not ( = ?auto_558433 ?auto_558442 ) ) ( not ( = ?auto_558433 ?auto_558443 ) ) ( not ( = ?auto_558433 ?auto_558444 ) ) ( not ( = ?auto_558433 ?auto_558445 ) ) ( not ( = ?auto_558433 ?auto_558446 ) ) ( not ( = ?auto_558433 ?auto_558447 ) ) ( not ( = ?auto_558433 ?auto_558448 ) ) ( not ( = ?auto_558433 ?auto_558449 ) ) ( not ( = ?auto_558434 ?auto_558435 ) ) ( not ( = ?auto_558434 ?auto_558436 ) ) ( not ( = ?auto_558434 ?auto_558437 ) ) ( not ( = ?auto_558434 ?auto_558438 ) ) ( not ( = ?auto_558434 ?auto_558439 ) ) ( not ( = ?auto_558434 ?auto_558440 ) ) ( not ( = ?auto_558434 ?auto_558441 ) ) ( not ( = ?auto_558434 ?auto_558442 ) ) ( not ( = ?auto_558434 ?auto_558443 ) ) ( not ( = ?auto_558434 ?auto_558444 ) ) ( not ( = ?auto_558434 ?auto_558445 ) ) ( not ( = ?auto_558434 ?auto_558446 ) ) ( not ( = ?auto_558434 ?auto_558447 ) ) ( not ( = ?auto_558434 ?auto_558448 ) ) ( not ( = ?auto_558434 ?auto_558449 ) ) ( not ( = ?auto_558435 ?auto_558436 ) ) ( not ( = ?auto_558435 ?auto_558437 ) ) ( not ( = ?auto_558435 ?auto_558438 ) ) ( not ( = ?auto_558435 ?auto_558439 ) ) ( not ( = ?auto_558435 ?auto_558440 ) ) ( not ( = ?auto_558435 ?auto_558441 ) ) ( not ( = ?auto_558435 ?auto_558442 ) ) ( not ( = ?auto_558435 ?auto_558443 ) ) ( not ( = ?auto_558435 ?auto_558444 ) ) ( not ( = ?auto_558435 ?auto_558445 ) ) ( not ( = ?auto_558435 ?auto_558446 ) ) ( not ( = ?auto_558435 ?auto_558447 ) ) ( not ( = ?auto_558435 ?auto_558448 ) ) ( not ( = ?auto_558435 ?auto_558449 ) ) ( not ( = ?auto_558436 ?auto_558437 ) ) ( not ( = ?auto_558436 ?auto_558438 ) ) ( not ( = ?auto_558436 ?auto_558439 ) ) ( not ( = ?auto_558436 ?auto_558440 ) ) ( not ( = ?auto_558436 ?auto_558441 ) ) ( not ( = ?auto_558436 ?auto_558442 ) ) ( not ( = ?auto_558436 ?auto_558443 ) ) ( not ( = ?auto_558436 ?auto_558444 ) ) ( not ( = ?auto_558436 ?auto_558445 ) ) ( not ( = ?auto_558436 ?auto_558446 ) ) ( not ( = ?auto_558436 ?auto_558447 ) ) ( not ( = ?auto_558436 ?auto_558448 ) ) ( not ( = ?auto_558436 ?auto_558449 ) ) ( not ( = ?auto_558437 ?auto_558438 ) ) ( not ( = ?auto_558437 ?auto_558439 ) ) ( not ( = ?auto_558437 ?auto_558440 ) ) ( not ( = ?auto_558437 ?auto_558441 ) ) ( not ( = ?auto_558437 ?auto_558442 ) ) ( not ( = ?auto_558437 ?auto_558443 ) ) ( not ( = ?auto_558437 ?auto_558444 ) ) ( not ( = ?auto_558437 ?auto_558445 ) ) ( not ( = ?auto_558437 ?auto_558446 ) ) ( not ( = ?auto_558437 ?auto_558447 ) ) ( not ( = ?auto_558437 ?auto_558448 ) ) ( not ( = ?auto_558437 ?auto_558449 ) ) ( not ( = ?auto_558438 ?auto_558439 ) ) ( not ( = ?auto_558438 ?auto_558440 ) ) ( not ( = ?auto_558438 ?auto_558441 ) ) ( not ( = ?auto_558438 ?auto_558442 ) ) ( not ( = ?auto_558438 ?auto_558443 ) ) ( not ( = ?auto_558438 ?auto_558444 ) ) ( not ( = ?auto_558438 ?auto_558445 ) ) ( not ( = ?auto_558438 ?auto_558446 ) ) ( not ( = ?auto_558438 ?auto_558447 ) ) ( not ( = ?auto_558438 ?auto_558448 ) ) ( not ( = ?auto_558438 ?auto_558449 ) ) ( not ( = ?auto_558439 ?auto_558440 ) ) ( not ( = ?auto_558439 ?auto_558441 ) ) ( not ( = ?auto_558439 ?auto_558442 ) ) ( not ( = ?auto_558439 ?auto_558443 ) ) ( not ( = ?auto_558439 ?auto_558444 ) ) ( not ( = ?auto_558439 ?auto_558445 ) ) ( not ( = ?auto_558439 ?auto_558446 ) ) ( not ( = ?auto_558439 ?auto_558447 ) ) ( not ( = ?auto_558439 ?auto_558448 ) ) ( not ( = ?auto_558439 ?auto_558449 ) ) ( not ( = ?auto_558440 ?auto_558441 ) ) ( not ( = ?auto_558440 ?auto_558442 ) ) ( not ( = ?auto_558440 ?auto_558443 ) ) ( not ( = ?auto_558440 ?auto_558444 ) ) ( not ( = ?auto_558440 ?auto_558445 ) ) ( not ( = ?auto_558440 ?auto_558446 ) ) ( not ( = ?auto_558440 ?auto_558447 ) ) ( not ( = ?auto_558440 ?auto_558448 ) ) ( not ( = ?auto_558440 ?auto_558449 ) ) ( not ( = ?auto_558441 ?auto_558442 ) ) ( not ( = ?auto_558441 ?auto_558443 ) ) ( not ( = ?auto_558441 ?auto_558444 ) ) ( not ( = ?auto_558441 ?auto_558445 ) ) ( not ( = ?auto_558441 ?auto_558446 ) ) ( not ( = ?auto_558441 ?auto_558447 ) ) ( not ( = ?auto_558441 ?auto_558448 ) ) ( not ( = ?auto_558441 ?auto_558449 ) ) ( not ( = ?auto_558442 ?auto_558443 ) ) ( not ( = ?auto_558442 ?auto_558444 ) ) ( not ( = ?auto_558442 ?auto_558445 ) ) ( not ( = ?auto_558442 ?auto_558446 ) ) ( not ( = ?auto_558442 ?auto_558447 ) ) ( not ( = ?auto_558442 ?auto_558448 ) ) ( not ( = ?auto_558442 ?auto_558449 ) ) ( not ( = ?auto_558443 ?auto_558444 ) ) ( not ( = ?auto_558443 ?auto_558445 ) ) ( not ( = ?auto_558443 ?auto_558446 ) ) ( not ( = ?auto_558443 ?auto_558447 ) ) ( not ( = ?auto_558443 ?auto_558448 ) ) ( not ( = ?auto_558443 ?auto_558449 ) ) ( not ( = ?auto_558444 ?auto_558445 ) ) ( not ( = ?auto_558444 ?auto_558446 ) ) ( not ( = ?auto_558444 ?auto_558447 ) ) ( not ( = ?auto_558444 ?auto_558448 ) ) ( not ( = ?auto_558444 ?auto_558449 ) ) ( not ( = ?auto_558445 ?auto_558446 ) ) ( not ( = ?auto_558445 ?auto_558447 ) ) ( not ( = ?auto_558445 ?auto_558448 ) ) ( not ( = ?auto_558445 ?auto_558449 ) ) ( not ( = ?auto_558446 ?auto_558447 ) ) ( not ( = ?auto_558446 ?auto_558448 ) ) ( not ( = ?auto_558446 ?auto_558449 ) ) ( not ( = ?auto_558447 ?auto_558448 ) ) ( not ( = ?auto_558447 ?auto_558449 ) ) ( not ( = ?auto_558448 ?auto_558449 ) ) ( ON ?auto_558447 ?auto_558448 ) ( ON ?auto_558446 ?auto_558447 ) ( ON ?auto_558445 ?auto_558446 ) ( ON ?auto_558444 ?auto_558445 ) ( ON ?auto_558443 ?auto_558444 ) ( ON ?auto_558442 ?auto_558443 ) ( CLEAR ?auto_558440 ) ( ON ?auto_558441 ?auto_558442 ) ( CLEAR ?auto_558441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_558433 ?auto_558434 ?auto_558435 ?auto_558436 ?auto_558437 ?auto_558438 ?auto_558439 ?auto_558440 ?auto_558441 )
      ( MAKE-16PILE ?auto_558433 ?auto_558434 ?auto_558435 ?auto_558436 ?auto_558437 ?auto_558438 ?auto_558439 ?auto_558440 ?auto_558441 ?auto_558442 ?auto_558443 ?auto_558444 ?auto_558445 ?auto_558446 ?auto_558447 ?auto_558448 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558466 - BLOCK
      ?auto_558467 - BLOCK
      ?auto_558468 - BLOCK
      ?auto_558469 - BLOCK
      ?auto_558470 - BLOCK
      ?auto_558471 - BLOCK
      ?auto_558472 - BLOCK
      ?auto_558473 - BLOCK
      ?auto_558474 - BLOCK
      ?auto_558475 - BLOCK
      ?auto_558476 - BLOCK
      ?auto_558477 - BLOCK
      ?auto_558478 - BLOCK
      ?auto_558479 - BLOCK
      ?auto_558480 - BLOCK
      ?auto_558481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558481 ) ( ON-TABLE ?auto_558466 ) ( ON ?auto_558467 ?auto_558466 ) ( ON ?auto_558468 ?auto_558467 ) ( ON ?auto_558469 ?auto_558468 ) ( ON ?auto_558470 ?auto_558469 ) ( ON ?auto_558471 ?auto_558470 ) ( ON ?auto_558472 ?auto_558471 ) ( ON ?auto_558473 ?auto_558472 ) ( not ( = ?auto_558466 ?auto_558467 ) ) ( not ( = ?auto_558466 ?auto_558468 ) ) ( not ( = ?auto_558466 ?auto_558469 ) ) ( not ( = ?auto_558466 ?auto_558470 ) ) ( not ( = ?auto_558466 ?auto_558471 ) ) ( not ( = ?auto_558466 ?auto_558472 ) ) ( not ( = ?auto_558466 ?auto_558473 ) ) ( not ( = ?auto_558466 ?auto_558474 ) ) ( not ( = ?auto_558466 ?auto_558475 ) ) ( not ( = ?auto_558466 ?auto_558476 ) ) ( not ( = ?auto_558466 ?auto_558477 ) ) ( not ( = ?auto_558466 ?auto_558478 ) ) ( not ( = ?auto_558466 ?auto_558479 ) ) ( not ( = ?auto_558466 ?auto_558480 ) ) ( not ( = ?auto_558466 ?auto_558481 ) ) ( not ( = ?auto_558467 ?auto_558468 ) ) ( not ( = ?auto_558467 ?auto_558469 ) ) ( not ( = ?auto_558467 ?auto_558470 ) ) ( not ( = ?auto_558467 ?auto_558471 ) ) ( not ( = ?auto_558467 ?auto_558472 ) ) ( not ( = ?auto_558467 ?auto_558473 ) ) ( not ( = ?auto_558467 ?auto_558474 ) ) ( not ( = ?auto_558467 ?auto_558475 ) ) ( not ( = ?auto_558467 ?auto_558476 ) ) ( not ( = ?auto_558467 ?auto_558477 ) ) ( not ( = ?auto_558467 ?auto_558478 ) ) ( not ( = ?auto_558467 ?auto_558479 ) ) ( not ( = ?auto_558467 ?auto_558480 ) ) ( not ( = ?auto_558467 ?auto_558481 ) ) ( not ( = ?auto_558468 ?auto_558469 ) ) ( not ( = ?auto_558468 ?auto_558470 ) ) ( not ( = ?auto_558468 ?auto_558471 ) ) ( not ( = ?auto_558468 ?auto_558472 ) ) ( not ( = ?auto_558468 ?auto_558473 ) ) ( not ( = ?auto_558468 ?auto_558474 ) ) ( not ( = ?auto_558468 ?auto_558475 ) ) ( not ( = ?auto_558468 ?auto_558476 ) ) ( not ( = ?auto_558468 ?auto_558477 ) ) ( not ( = ?auto_558468 ?auto_558478 ) ) ( not ( = ?auto_558468 ?auto_558479 ) ) ( not ( = ?auto_558468 ?auto_558480 ) ) ( not ( = ?auto_558468 ?auto_558481 ) ) ( not ( = ?auto_558469 ?auto_558470 ) ) ( not ( = ?auto_558469 ?auto_558471 ) ) ( not ( = ?auto_558469 ?auto_558472 ) ) ( not ( = ?auto_558469 ?auto_558473 ) ) ( not ( = ?auto_558469 ?auto_558474 ) ) ( not ( = ?auto_558469 ?auto_558475 ) ) ( not ( = ?auto_558469 ?auto_558476 ) ) ( not ( = ?auto_558469 ?auto_558477 ) ) ( not ( = ?auto_558469 ?auto_558478 ) ) ( not ( = ?auto_558469 ?auto_558479 ) ) ( not ( = ?auto_558469 ?auto_558480 ) ) ( not ( = ?auto_558469 ?auto_558481 ) ) ( not ( = ?auto_558470 ?auto_558471 ) ) ( not ( = ?auto_558470 ?auto_558472 ) ) ( not ( = ?auto_558470 ?auto_558473 ) ) ( not ( = ?auto_558470 ?auto_558474 ) ) ( not ( = ?auto_558470 ?auto_558475 ) ) ( not ( = ?auto_558470 ?auto_558476 ) ) ( not ( = ?auto_558470 ?auto_558477 ) ) ( not ( = ?auto_558470 ?auto_558478 ) ) ( not ( = ?auto_558470 ?auto_558479 ) ) ( not ( = ?auto_558470 ?auto_558480 ) ) ( not ( = ?auto_558470 ?auto_558481 ) ) ( not ( = ?auto_558471 ?auto_558472 ) ) ( not ( = ?auto_558471 ?auto_558473 ) ) ( not ( = ?auto_558471 ?auto_558474 ) ) ( not ( = ?auto_558471 ?auto_558475 ) ) ( not ( = ?auto_558471 ?auto_558476 ) ) ( not ( = ?auto_558471 ?auto_558477 ) ) ( not ( = ?auto_558471 ?auto_558478 ) ) ( not ( = ?auto_558471 ?auto_558479 ) ) ( not ( = ?auto_558471 ?auto_558480 ) ) ( not ( = ?auto_558471 ?auto_558481 ) ) ( not ( = ?auto_558472 ?auto_558473 ) ) ( not ( = ?auto_558472 ?auto_558474 ) ) ( not ( = ?auto_558472 ?auto_558475 ) ) ( not ( = ?auto_558472 ?auto_558476 ) ) ( not ( = ?auto_558472 ?auto_558477 ) ) ( not ( = ?auto_558472 ?auto_558478 ) ) ( not ( = ?auto_558472 ?auto_558479 ) ) ( not ( = ?auto_558472 ?auto_558480 ) ) ( not ( = ?auto_558472 ?auto_558481 ) ) ( not ( = ?auto_558473 ?auto_558474 ) ) ( not ( = ?auto_558473 ?auto_558475 ) ) ( not ( = ?auto_558473 ?auto_558476 ) ) ( not ( = ?auto_558473 ?auto_558477 ) ) ( not ( = ?auto_558473 ?auto_558478 ) ) ( not ( = ?auto_558473 ?auto_558479 ) ) ( not ( = ?auto_558473 ?auto_558480 ) ) ( not ( = ?auto_558473 ?auto_558481 ) ) ( not ( = ?auto_558474 ?auto_558475 ) ) ( not ( = ?auto_558474 ?auto_558476 ) ) ( not ( = ?auto_558474 ?auto_558477 ) ) ( not ( = ?auto_558474 ?auto_558478 ) ) ( not ( = ?auto_558474 ?auto_558479 ) ) ( not ( = ?auto_558474 ?auto_558480 ) ) ( not ( = ?auto_558474 ?auto_558481 ) ) ( not ( = ?auto_558475 ?auto_558476 ) ) ( not ( = ?auto_558475 ?auto_558477 ) ) ( not ( = ?auto_558475 ?auto_558478 ) ) ( not ( = ?auto_558475 ?auto_558479 ) ) ( not ( = ?auto_558475 ?auto_558480 ) ) ( not ( = ?auto_558475 ?auto_558481 ) ) ( not ( = ?auto_558476 ?auto_558477 ) ) ( not ( = ?auto_558476 ?auto_558478 ) ) ( not ( = ?auto_558476 ?auto_558479 ) ) ( not ( = ?auto_558476 ?auto_558480 ) ) ( not ( = ?auto_558476 ?auto_558481 ) ) ( not ( = ?auto_558477 ?auto_558478 ) ) ( not ( = ?auto_558477 ?auto_558479 ) ) ( not ( = ?auto_558477 ?auto_558480 ) ) ( not ( = ?auto_558477 ?auto_558481 ) ) ( not ( = ?auto_558478 ?auto_558479 ) ) ( not ( = ?auto_558478 ?auto_558480 ) ) ( not ( = ?auto_558478 ?auto_558481 ) ) ( not ( = ?auto_558479 ?auto_558480 ) ) ( not ( = ?auto_558479 ?auto_558481 ) ) ( not ( = ?auto_558480 ?auto_558481 ) ) ( ON ?auto_558480 ?auto_558481 ) ( ON ?auto_558479 ?auto_558480 ) ( ON ?auto_558478 ?auto_558479 ) ( ON ?auto_558477 ?auto_558478 ) ( ON ?auto_558476 ?auto_558477 ) ( ON ?auto_558475 ?auto_558476 ) ( CLEAR ?auto_558473 ) ( ON ?auto_558474 ?auto_558475 ) ( CLEAR ?auto_558474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_558466 ?auto_558467 ?auto_558468 ?auto_558469 ?auto_558470 ?auto_558471 ?auto_558472 ?auto_558473 ?auto_558474 )
      ( MAKE-16PILE ?auto_558466 ?auto_558467 ?auto_558468 ?auto_558469 ?auto_558470 ?auto_558471 ?auto_558472 ?auto_558473 ?auto_558474 ?auto_558475 ?auto_558476 ?auto_558477 ?auto_558478 ?auto_558479 ?auto_558480 ?auto_558481 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558498 - BLOCK
      ?auto_558499 - BLOCK
      ?auto_558500 - BLOCK
      ?auto_558501 - BLOCK
      ?auto_558502 - BLOCK
      ?auto_558503 - BLOCK
      ?auto_558504 - BLOCK
      ?auto_558505 - BLOCK
      ?auto_558506 - BLOCK
      ?auto_558507 - BLOCK
      ?auto_558508 - BLOCK
      ?auto_558509 - BLOCK
      ?auto_558510 - BLOCK
      ?auto_558511 - BLOCK
      ?auto_558512 - BLOCK
      ?auto_558513 - BLOCK
    )
    :vars
    (
      ?auto_558514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558513 ?auto_558514 ) ( ON-TABLE ?auto_558498 ) ( ON ?auto_558499 ?auto_558498 ) ( ON ?auto_558500 ?auto_558499 ) ( ON ?auto_558501 ?auto_558500 ) ( ON ?auto_558502 ?auto_558501 ) ( ON ?auto_558503 ?auto_558502 ) ( ON ?auto_558504 ?auto_558503 ) ( not ( = ?auto_558498 ?auto_558499 ) ) ( not ( = ?auto_558498 ?auto_558500 ) ) ( not ( = ?auto_558498 ?auto_558501 ) ) ( not ( = ?auto_558498 ?auto_558502 ) ) ( not ( = ?auto_558498 ?auto_558503 ) ) ( not ( = ?auto_558498 ?auto_558504 ) ) ( not ( = ?auto_558498 ?auto_558505 ) ) ( not ( = ?auto_558498 ?auto_558506 ) ) ( not ( = ?auto_558498 ?auto_558507 ) ) ( not ( = ?auto_558498 ?auto_558508 ) ) ( not ( = ?auto_558498 ?auto_558509 ) ) ( not ( = ?auto_558498 ?auto_558510 ) ) ( not ( = ?auto_558498 ?auto_558511 ) ) ( not ( = ?auto_558498 ?auto_558512 ) ) ( not ( = ?auto_558498 ?auto_558513 ) ) ( not ( = ?auto_558498 ?auto_558514 ) ) ( not ( = ?auto_558499 ?auto_558500 ) ) ( not ( = ?auto_558499 ?auto_558501 ) ) ( not ( = ?auto_558499 ?auto_558502 ) ) ( not ( = ?auto_558499 ?auto_558503 ) ) ( not ( = ?auto_558499 ?auto_558504 ) ) ( not ( = ?auto_558499 ?auto_558505 ) ) ( not ( = ?auto_558499 ?auto_558506 ) ) ( not ( = ?auto_558499 ?auto_558507 ) ) ( not ( = ?auto_558499 ?auto_558508 ) ) ( not ( = ?auto_558499 ?auto_558509 ) ) ( not ( = ?auto_558499 ?auto_558510 ) ) ( not ( = ?auto_558499 ?auto_558511 ) ) ( not ( = ?auto_558499 ?auto_558512 ) ) ( not ( = ?auto_558499 ?auto_558513 ) ) ( not ( = ?auto_558499 ?auto_558514 ) ) ( not ( = ?auto_558500 ?auto_558501 ) ) ( not ( = ?auto_558500 ?auto_558502 ) ) ( not ( = ?auto_558500 ?auto_558503 ) ) ( not ( = ?auto_558500 ?auto_558504 ) ) ( not ( = ?auto_558500 ?auto_558505 ) ) ( not ( = ?auto_558500 ?auto_558506 ) ) ( not ( = ?auto_558500 ?auto_558507 ) ) ( not ( = ?auto_558500 ?auto_558508 ) ) ( not ( = ?auto_558500 ?auto_558509 ) ) ( not ( = ?auto_558500 ?auto_558510 ) ) ( not ( = ?auto_558500 ?auto_558511 ) ) ( not ( = ?auto_558500 ?auto_558512 ) ) ( not ( = ?auto_558500 ?auto_558513 ) ) ( not ( = ?auto_558500 ?auto_558514 ) ) ( not ( = ?auto_558501 ?auto_558502 ) ) ( not ( = ?auto_558501 ?auto_558503 ) ) ( not ( = ?auto_558501 ?auto_558504 ) ) ( not ( = ?auto_558501 ?auto_558505 ) ) ( not ( = ?auto_558501 ?auto_558506 ) ) ( not ( = ?auto_558501 ?auto_558507 ) ) ( not ( = ?auto_558501 ?auto_558508 ) ) ( not ( = ?auto_558501 ?auto_558509 ) ) ( not ( = ?auto_558501 ?auto_558510 ) ) ( not ( = ?auto_558501 ?auto_558511 ) ) ( not ( = ?auto_558501 ?auto_558512 ) ) ( not ( = ?auto_558501 ?auto_558513 ) ) ( not ( = ?auto_558501 ?auto_558514 ) ) ( not ( = ?auto_558502 ?auto_558503 ) ) ( not ( = ?auto_558502 ?auto_558504 ) ) ( not ( = ?auto_558502 ?auto_558505 ) ) ( not ( = ?auto_558502 ?auto_558506 ) ) ( not ( = ?auto_558502 ?auto_558507 ) ) ( not ( = ?auto_558502 ?auto_558508 ) ) ( not ( = ?auto_558502 ?auto_558509 ) ) ( not ( = ?auto_558502 ?auto_558510 ) ) ( not ( = ?auto_558502 ?auto_558511 ) ) ( not ( = ?auto_558502 ?auto_558512 ) ) ( not ( = ?auto_558502 ?auto_558513 ) ) ( not ( = ?auto_558502 ?auto_558514 ) ) ( not ( = ?auto_558503 ?auto_558504 ) ) ( not ( = ?auto_558503 ?auto_558505 ) ) ( not ( = ?auto_558503 ?auto_558506 ) ) ( not ( = ?auto_558503 ?auto_558507 ) ) ( not ( = ?auto_558503 ?auto_558508 ) ) ( not ( = ?auto_558503 ?auto_558509 ) ) ( not ( = ?auto_558503 ?auto_558510 ) ) ( not ( = ?auto_558503 ?auto_558511 ) ) ( not ( = ?auto_558503 ?auto_558512 ) ) ( not ( = ?auto_558503 ?auto_558513 ) ) ( not ( = ?auto_558503 ?auto_558514 ) ) ( not ( = ?auto_558504 ?auto_558505 ) ) ( not ( = ?auto_558504 ?auto_558506 ) ) ( not ( = ?auto_558504 ?auto_558507 ) ) ( not ( = ?auto_558504 ?auto_558508 ) ) ( not ( = ?auto_558504 ?auto_558509 ) ) ( not ( = ?auto_558504 ?auto_558510 ) ) ( not ( = ?auto_558504 ?auto_558511 ) ) ( not ( = ?auto_558504 ?auto_558512 ) ) ( not ( = ?auto_558504 ?auto_558513 ) ) ( not ( = ?auto_558504 ?auto_558514 ) ) ( not ( = ?auto_558505 ?auto_558506 ) ) ( not ( = ?auto_558505 ?auto_558507 ) ) ( not ( = ?auto_558505 ?auto_558508 ) ) ( not ( = ?auto_558505 ?auto_558509 ) ) ( not ( = ?auto_558505 ?auto_558510 ) ) ( not ( = ?auto_558505 ?auto_558511 ) ) ( not ( = ?auto_558505 ?auto_558512 ) ) ( not ( = ?auto_558505 ?auto_558513 ) ) ( not ( = ?auto_558505 ?auto_558514 ) ) ( not ( = ?auto_558506 ?auto_558507 ) ) ( not ( = ?auto_558506 ?auto_558508 ) ) ( not ( = ?auto_558506 ?auto_558509 ) ) ( not ( = ?auto_558506 ?auto_558510 ) ) ( not ( = ?auto_558506 ?auto_558511 ) ) ( not ( = ?auto_558506 ?auto_558512 ) ) ( not ( = ?auto_558506 ?auto_558513 ) ) ( not ( = ?auto_558506 ?auto_558514 ) ) ( not ( = ?auto_558507 ?auto_558508 ) ) ( not ( = ?auto_558507 ?auto_558509 ) ) ( not ( = ?auto_558507 ?auto_558510 ) ) ( not ( = ?auto_558507 ?auto_558511 ) ) ( not ( = ?auto_558507 ?auto_558512 ) ) ( not ( = ?auto_558507 ?auto_558513 ) ) ( not ( = ?auto_558507 ?auto_558514 ) ) ( not ( = ?auto_558508 ?auto_558509 ) ) ( not ( = ?auto_558508 ?auto_558510 ) ) ( not ( = ?auto_558508 ?auto_558511 ) ) ( not ( = ?auto_558508 ?auto_558512 ) ) ( not ( = ?auto_558508 ?auto_558513 ) ) ( not ( = ?auto_558508 ?auto_558514 ) ) ( not ( = ?auto_558509 ?auto_558510 ) ) ( not ( = ?auto_558509 ?auto_558511 ) ) ( not ( = ?auto_558509 ?auto_558512 ) ) ( not ( = ?auto_558509 ?auto_558513 ) ) ( not ( = ?auto_558509 ?auto_558514 ) ) ( not ( = ?auto_558510 ?auto_558511 ) ) ( not ( = ?auto_558510 ?auto_558512 ) ) ( not ( = ?auto_558510 ?auto_558513 ) ) ( not ( = ?auto_558510 ?auto_558514 ) ) ( not ( = ?auto_558511 ?auto_558512 ) ) ( not ( = ?auto_558511 ?auto_558513 ) ) ( not ( = ?auto_558511 ?auto_558514 ) ) ( not ( = ?auto_558512 ?auto_558513 ) ) ( not ( = ?auto_558512 ?auto_558514 ) ) ( not ( = ?auto_558513 ?auto_558514 ) ) ( ON ?auto_558512 ?auto_558513 ) ( ON ?auto_558511 ?auto_558512 ) ( ON ?auto_558510 ?auto_558511 ) ( ON ?auto_558509 ?auto_558510 ) ( ON ?auto_558508 ?auto_558509 ) ( ON ?auto_558507 ?auto_558508 ) ( ON ?auto_558506 ?auto_558507 ) ( CLEAR ?auto_558504 ) ( ON ?auto_558505 ?auto_558506 ) ( CLEAR ?auto_558505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_558498 ?auto_558499 ?auto_558500 ?auto_558501 ?auto_558502 ?auto_558503 ?auto_558504 ?auto_558505 )
      ( MAKE-16PILE ?auto_558498 ?auto_558499 ?auto_558500 ?auto_558501 ?auto_558502 ?auto_558503 ?auto_558504 ?auto_558505 ?auto_558506 ?auto_558507 ?auto_558508 ?auto_558509 ?auto_558510 ?auto_558511 ?auto_558512 ?auto_558513 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558531 - BLOCK
      ?auto_558532 - BLOCK
      ?auto_558533 - BLOCK
      ?auto_558534 - BLOCK
      ?auto_558535 - BLOCK
      ?auto_558536 - BLOCK
      ?auto_558537 - BLOCK
      ?auto_558538 - BLOCK
      ?auto_558539 - BLOCK
      ?auto_558540 - BLOCK
      ?auto_558541 - BLOCK
      ?auto_558542 - BLOCK
      ?auto_558543 - BLOCK
      ?auto_558544 - BLOCK
      ?auto_558545 - BLOCK
      ?auto_558546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558546 ) ( ON-TABLE ?auto_558531 ) ( ON ?auto_558532 ?auto_558531 ) ( ON ?auto_558533 ?auto_558532 ) ( ON ?auto_558534 ?auto_558533 ) ( ON ?auto_558535 ?auto_558534 ) ( ON ?auto_558536 ?auto_558535 ) ( ON ?auto_558537 ?auto_558536 ) ( not ( = ?auto_558531 ?auto_558532 ) ) ( not ( = ?auto_558531 ?auto_558533 ) ) ( not ( = ?auto_558531 ?auto_558534 ) ) ( not ( = ?auto_558531 ?auto_558535 ) ) ( not ( = ?auto_558531 ?auto_558536 ) ) ( not ( = ?auto_558531 ?auto_558537 ) ) ( not ( = ?auto_558531 ?auto_558538 ) ) ( not ( = ?auto_558531 ?auto_558539 ) ) ( not ( = ?auto_558531 ?auto_558540 ) ) ( not ( = ?auto_558531 ?auto_558541 ) ) ( not ( = ?auto_558531 ?auto_558542 ) ) ( not ( = ?auto_558531 ?auto_558543 ) ) ( not ( = ?auto_558531 ?auto_558544 ) ) ( not ( = ?auto_558531 ?auto_558545 ) ) ( not ( = ?auto_558531 ?auto_558546 ) ) ( not ( = ?auto_558532 ?auto_558533 ) ) ( not ( = ?auto_558532 ?auto_558534 ) ) ( not ( = ?auto_558532 ?auto_558535 ) ) ( not ( = ?auto_558532 ?auto_558536 ) ) ( not ( = ?auto_558532 ?auto_558537 ) ) ( not ( = ?auto_558532 ?auto_558538 ) ) ( not ( = ?auto_558532 ?auto_558539 ) ) ( not ( = ?auto_558532 ?auto_558540 ) ) ( not ( = ?auto_558532 ?auto_558541 ) ) ( not ( = ?auto_558532 ?auto_558542 ) ) ( not ( = ?auto_558532 ?auto_558543 ) ) ( not ( = ?auto_558532 ?auto_558544 ) ) ( not ( = ?auto_558532 ?auto_558545 ) ) ( not ( = ?auto_558532 ?auto_558546 ) ) ( not ( = ?auto_558533 ?auto_558534 ) ) ( not ( = ?auto_558533 ?auto_558535 ) ) ( not ( = ?auto_558533 ?auto_558536 ) ) ( not ( = ?auto_558533 ?auto_558537 ) ) ( not ( = ?auto_558533 ?auto_558538 ) ) ( not ( = ?auto_558533 ?auto_558539 ) ) ( not ( = ?auto_558533 ?auto_558540 ) ) ( not ( = ?auto_558533 ?auto_558541 ) ) ( not ( = ?auto_558533 ?auto_558542 ) ) ( not ( = ?auto_558533 ?auto_558543 ) ) ( not ( = ?auto_558533 ?auto_558544 ) ) ( not ( = ?auto_558533 ?auto_558545 ) ) ( not ( = ?auto_558533 ?auto_558546 ) ) ( not ( = ?auto_558534 ?auto_558535 ) ) ( not ( = ?auto_558534 ?auto_558536 ) ) ( not ( = ?auto_558534 ?auto_558537 ) ) ( not ( = ?auto_558534 ?auto_558538 ) ) ( not ( = ?auto_558534 ?auto_558539 ) ) ( not ( = ?auto_558534 ?auto_558540 ) ) ( not ( = ?auto_558534 ?auto_558541 ) ) ( not ( = ?auto_558534 ?auto_558542 ) ) ( not ( = ?auto_558534 ?auto_558543 ) ) ( not ( = ?auto_558534 ?auto_558544 ) ) ( not ( = ?auto_558534 ?auto_558545 ) ) ( not ( = ?auto_558534 ?auto_558546 ) ) ( not ( = ?auto_558535 ?auto_558536 ) ) ( not ( = ?auto_558535 ?auto_558537 ) ) ( not ( = ?auto_558535 ?auto_558538 ) ) ( not ( = ?auto_558535 ?auto_558539 ) ) ( not ( = ?auto_558535 ?auto_558540 ) ) ( not ( = ?auto_558535 ?auto_558541 ) ) ( not ( = ?auto_558535 ?auto_558542 ) ) ( not ( = ?auto_558535 ?auto_558543 ) ) ( not ( = ?auto_558535 ?auto_558544 ) ) ( not ( = ?auto_558535 ?auto_558545 ) ) ( not ( = ?auto_558535 ?auto_558546 ) ) ( not ( = ?auto_558536 ?auto_558537 ) ) ( not ( = ?auto_558536 ?auto_558538 ) ) ( not ( = ?auto_558536 ?auto_558539 ) ) ( not ( = ?auto_558536 ?auto_558540 ) ) ( not ( = ?auto_558536 ?auto_558541 ) ) ( not ( = ?auto_558536 ?auto_558542 ) ) ( not ( = ?auto_558536 ?auto_558543 ) ) ( not ( = ?auto_558536 ?auto_558544 ) ) ( not ( = ?auto_558536 ?auto_558545 ) ) ( not ( = ?auto_558536 ?auto_558546 ) ) ( not ( = ?auto_558537 ?auto_558538 ) ) ( not ( = ?auto_558537 ?auto_558539 ) ) ( not ( = ?auto_558537 ?auto_558540 ) ) ( not ( = ?auto_558537 ?auto_558541 ) ) ( not ( = ?auto_558537 ?auto_558542 ) ) ( not ( = ?auto_558537 ?auto_558543 ) ) ( not ( = ?auto_558537 ?auto_558544 ) ) ( not ( = ?auto_558537 ?auto_558545 ) ) ( not ( = ?auto_558537 ?auto_558546 ) ) ( not ( = ?auto_558538 ?auto_558539 ) ) ( not ( = ?auto_558538 ?auto_558540 ) ) ( not ( = ?auto_558538 ?auto_558541 ) ) ( not ( = ?auto_558538 ?auto_558542 ) ) ( not ( = ?auto_558538 ?auto_558543 ) ) ( not ( = ?auto_558538 ?auto_558544 ) ) ( not ( = ?auto_558538 ?auto_558545 ) ) ( not ( = ?auto_558538 ?auto_558546 ) ) ( not ( = ?auto_558539 ?auto_558540 ) ) ( not ( = ?auto_558539 ?auto_558541 ) ) ( not ( = ?auto_558539 ?auto_558542 ) ) ( not ( = ?auto_558539 ?auto_558543 ) ) ( not ( = ?auto_558539 ?auto_558544 ) ) ( not ( = ?auto_558539 ?auto_558545 ) ) ( not ( = ?auto_558539 ?auto_558546 ) ) ( not ( = ?auto_558540 ?auto_558541 ) ) ( not ( = ?auto_558540 ?auto_558542 ) ) ( not ( = ?auto_558540 ?auto_558543 ) ) ( not ( = ?auto_558540 ?auto_558544 ) ) ( not ( = ?auto_558540 ?auto_558545 ) ) ( not ( = ?auto_558540 ?auto_558546 ) ) ( not ( = ?auto_558541 ?auto_558542 ) ) ( not ( = ?auto_558541 ?auto_558543 ) ) ( not ( = ?auto_558541 ?auto_558544 ) ) ( not ( = ?auto_558541 ?auto_558545 ) ) ( not ( = ?auto_558541 ?auto_558546 ) ) ( not ( = ?auto_558542 ?auto_558543 ) ) ( not ( = ?auto_558542 ?auto_558544 ) ) ( not ( = ?auto_558542 ?auto_558545 ) ) ( not ( = ?auto_558542 ?auto_558546 ) ) ( not ( = ?auto_558543 ?auto_558544 ) ) ( not ( = ?auto_558543 ?auto_558545 ) ) ( not ( = ?auto_558543 ?auto_558546 ) ) ( not ( = ?auto_558544 ?auto_558545 ) ) ( not ( = ?auto_558544 ?auto_558546 ) ) ( not ( = ?auto_558545 ?auto_558546 ) ) ( ON ?auto_558545 ?auto_558546 ) ( ON ?auto_558544 ?auto_558545 ) ( ON ?auto_558543 ?auto_558544 ) ( ON ?auto_558542 ?auto_558543 ) ( ON ?auto_558541 ?auto_558542 ) ( ON ?auto_558540 ?auto_558541 ) ( ON ?auto_558539 ?auto_558540 ) ( CLEAR ?auto_558537 ) ( ON ?auto_558538 ?auto_558539 ) ( CLEAR ?auto_558538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_558531 ?auto_558532 ?auto_558533 ?auto_558534 ?auto_558535 ?auto_558536 ?auto_558537 ?auto_558538 )
      ( MAKE-16PILE ?auto_558531 ?auto_558532 ?auto_558533 ?auto_558534 ?auto_558535 ?auto_558536 ?auto_558537 ?auto_558538 ?auto_558539 ?auto_558540 ?auto_558541 ?auto_558542 ?auto_558543 ?auto_558544 ?auto_558545 ?auto_558546 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558563 - BLOCK
      ?auto_558564 - BLOCK
      ?auto_558565 - BLOCK
      ?auto_558566 - BLOCK
      ?auto_558567 - BLOCK
      ?auto_558568 - BLOCK
      ?auto_558569 - BLOCK
      ?auto_558570 - BLOCK
      ?auto_558571 - BLOCK
      ?auto_558572 - BLOCK
      ?auto_558573 - BLOCK
      ?auto_558574 - BLOCK
      ?auto_558575 - BLOCK
      ?auto_558576 - BLOCK
      ?auto_558577 - BLOCK
      ?auto_558578 - BLOCK
    )
    :vars
    (
      ?auto_558579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558578 ?auto_558579 ) ( ON-TABLE ?auto_558563 ) ( ON ?auto_558564 ?auto_558563 ) ( ON ?auto_558565 ?auto_558564 ) ( ON ?auto_558566 ?auto_558565 ) ( ON ?auto_558567 ?auto_558566 ) ( ON ?auto_558568 ?auto_558567 ) ( not ( = ?auto_558563 ?auto_558564 ) ) ( not ( = ?auto_558563 ?auto_558565 ) ) ( not ( = ?auto_558563 ?auto_558566 ) ) ( not ( = ?auto_558563 ?auto_558567 ) ) ( not ( = ?auto_558563 ?auto_558568 ) ) ( not ( = ?auto_558563 ?auto_558569 ) ) ( not ( = ?auto_558563 ?auto_558570 ) ) ( not ( = ?auto_558563 ?auto_558571 ) ) ( not ( = ?auto_558563 ?auto_558572 ) ) ( not ( = ?auto_558563 ?auto_558573 ) ) ( not ( = ?auto_558563 ?auto_558574 ) ) ( not ( = ?auto_558563 ?auto_558575 ) ) ( not ( = ?auto_558563 ?auto_558576 ) ) ( not ( = ?auto_558563 ?auto_558577 ) ) ( not ( = ?auto_558563 ?auto_558578 ) ) ( not ( = ?auto_558563 ?auto_558579 ) ) ( not ( = ?auto_558564 ?auto_558565 ) ) ( not ( = ?auto_558564 ?auto_558566 ) ) ( not ( = ?auto_558564 ?auto_558567 ) ) ( not ( = ?auto_558564 ?auto_558568 ) ) ( not ( = ?auto_558564 ?auto_558569 ) ) ( not ( = ?auto_558564 ?auto_558570 ) ) ( not ( = ?auto_558564 ?auto_558571 ) ) ( not ( = ?auto_558564 ?auto_558572 ) ) ( not ( = ?auto_558564 ?auto_558573 ) ) ( not ( = ?auto_558564 ?auto_558574 ) ) ( not ( = ?auto_558564 ?auto_558575 ) ) ( not ( = ?auto_558564 ?auto_558576 ) ) ( not ( = ?auto_558564 ?auto_558577 ) ) ( not ( = ?auto_558564 ?auto_558578 ) ) ( not ( = ?auto_558564 ?auto_558579 ) ) ( not ( = ?auto_558565 ?auto_558566 ) ) ( not ( = ?auto_558565 ?auto_558567 ) ) ( not ( = ?auto_558565 ?auto_558568 ) ) ( not ( = ?auto_558565 ?auto_558569 ) ) ( not ( = ?auto_558565 ?auto_558570 ) ) ( not ( = ?auto_558565 ?auto_558571 ) ) ( not ( = ?auto_558565 ?auto_558572 ) ) ( not ( = ?auto_558565 ?auto_558573 ) ) ( not ( = ?auto_558565 ?auto_558574 ) ) ( not ( = ?auto_558565 ?auto_558575 ) ) ( not ( = ?auto_558565 ?auto_558576 ) ) ( not ( = ?auto_558565 ?auto_558577 ) ) ( not ( = ?auto_558565 ?auto_558578 ) ) ( not ( = ?auto_558565 ?auto_558579 ) ) ( not ( = ?auto_558566 ?auto_558567 ) ) ( not ( = ?auto_558566 ?auto_558568 ) ) ( not ( = ?auto_558566 ?auto_558569 ) ) ( not ( = ?auto_558566 ?auto_558570 ) ) ( not ( = ?auto_558566 ?auto_558571 ) ) ( not ( = ?auto_558566 ?auto_558572 ) ) ( not ( = ?auto_558566 ?auto_558573 ) ) ( not ( = ?auto_558566 ?auto_558574 ) ) ( not ( = ?auto_558566 ?auto_558575 ) ) ( not ( = ?auto_558566 ?auto_558576 ) ) ( not ( = ?auto_558566 ?auto_558577 ) ) ( not ( = ?auto_558566 ?auto_558578 ) ) ( not ( = ?auto_558566 ?auto_558579 ) ) ( not ( = ?auto_558567 ?auto_558568 ) ) ( not ( = ?auto_558567 ?auto_558569 ) ) ( not ( = ?auto_558567 ?auto_558570 ) ) ( not ( = ?auto_558567 ?auto_558571 ) ) ( not ( = ?auto_558567 ?auto_558572 ) ) ( not ( = ?auto_558567 ?auto_558573 ) ) ( not ( = ?auto_558567 ?auto_558574 ) ) ( not ( = ?auto_558567 ?auto_558575 ) ) ( not ( = ?auto_558567 ?auto_558576 ) ) ( not ( = ?auto_558567 ?auto_558577 ) ) ( not ( = ?auto_558567 ?auto_558578 ) ) ( not ( = ?auto_558567 ?auto_558579 ) ) ( not ( = ?auto_558568 ?auto_558569 ) ) ( not ( = ?auto_558568 ?auto_558570 ) ) ( not ( = ?auto_558568 ?auto_558571 ) ) ( not ( = ?auto_558568 ?auto_558572 ) ) ( not ( = ?auto_558568 ?auto_558573 ) ) ( not ( = ?auto_558568 ?auto_558574 ) ) ( not ( = ?auto_558568 ?auto_558575 ) ) ( not ( = ?auto_558568 ?auto_558576 ) ) ( not ( = ?auto_558568 ?auto_558577 ) ) ( not ( = ?auto_558568 ?auto_558578 ) ) ( not ( = ?auto_558568 ?auto_558579 ) ) ( not ( = ?auto_558569 ?auto_558570 ) ) ( not ( = ?auto_558569 ?auto_558571 ) ) ( not ( = ?auto_558569 ?auto_558572 ) ) ( not ( = ?auto_558569 ?auto_558573 ) ) ( not ( = ?auto_558569 ?auto_558574 ) ) ( not ( = ?auto_558569 ?auto_558575 ) ) ( not ( = ?auto_558569 ?auto_558576 ) ) ( not ( = ?auto_558569 ?auto_558577 ) ) ( not ( = ?auto_558569 ?auto_558578 ) ) ( not ( = ?auto_558569 ?auto_558579 ) ) ( not ( = ?auto_558570 ?auto_558571 ) ) ( not ( = ?auto_558570 ?auto_558572 ) ) ( not ( = ?auto_558570 ?auto_558573 ) ) ( not ( = ?auto_558570 ?auto_558574 ) ) ( not ( = ?auto_558570 ?auto_558575 ) ) ( not ( = ?auto_558570 ?auto_558576 ) ) ( not ( = ?auto_558570 ?auto_558577 ) ) ( not ( = ?auto_558570 ?auto_558578 ) ) ( not ( = ?auto_558570 ?auto_558579 ) ) ( not ( = ?auto_558571 ?auto_558572 ) ) ( not ( = ?auto_558571 ?auto_558573 ) ) ( not ( = ?auto_558571 ?auto_558574 ) ) ( not ( = ?auto_558571 ?auto_558575 ) ) ( not ( = ?auto_558571 ?auto_558576 ) ) ( not ( = ?auto_558571 ?auto_558577 ) ) ( not ( = ?auto_558571 ?auto_558578 ) ) ( not ( = ?auto_558571 ?auto_558579 ) ) ( not ( = ?auto_558572 ?auto_558573 ) ) ( not ( = ?auto_558572 ?auto_558574 ) ) ( not ( = ?auto_558572 ?auto_558575 ) ) ( not ( = ?auto_558572 ?auto_558576 ) ) ( not ( = ?auto_558572 ?auto_558577 ) ) ( not ( = ?auto_558572 ?auto_558578 ) ) ( not ( = ?auto_558572 ?auto_558579 ) ) ( not ( = ?auto_558573 ?auto_558574 ) ) ( not ( = ?auto_558573 ?auto_558575 ) ) ( not ( = ?auto_558573 ?auto_558576 ) ) ( not ( = ?auto_558573 ?auto_558577 ) ) ( not ( = ?auto_558573 ?auto_558578 ) ) ( not ( = ?auto_558573 ?auto_558579 ) ) ( not ( = ?auto_558574 ?auto_558575 ) ) ( not ( = ?auto_558574 ?auto_558576 ) ) ( not ( = ?auto_558574 ?auto_558577 ) ) ( not ( = ?auto_558574 ?auto_558578 ) ) ( not ( = ?auto_558574 ?auto_558579 ) ) ( not ( = ?auto_558575 ?auto_558576 ) ) ( not ( = ?auto_558575 ?auto_558577 ) ) ( not ( = ?auto_558575 ?auto_558578 ) ) ( not ( = ?auto_558575 ?auto_558579 ) ) ( not ( = ?auto_558576 ?auto_558577 ) ) ( not ( = ?auto_558576 ?auto_558578 ) ) ( not ( = ?auto_558576 ?auto_558579 ) ) ( not ( = ?auto_558577 ?auto_558578 ) ) ( not ( = ?auto_558577 ?auto_558579 ) ) ( not ( = ?auto_558578 ?auto_558579 ) ) ( ON ?auto_558577 ?auto_558578 ) ( ON ?auto_558576 ?auto_558577 ) ( ON ?auto_558575 ?auto_558576 ) ( ON ?auto_558574 ?auto_558575 ) ( ON ?auto_558573 ?auto_558574 ) ( ON ?auto_558572 ?auto_558573 ) ( ON ?auto_558571 ?auto_558572 ) ( ON ?auto_558570 ?auto_558571 ) ( CLEAR ?auto_558568 ) ( ON ?auto_558569 ?auto_558570 ) ( CLEAR ?auto_558569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_558563 ?auto_558564 ?auto_558565 ?auto_558566 ?auto_558567 ?auto_558568 ?auto_558569 )
      ( MAKE-16PILE ?auto_558563 ?auto_558564 ?auto_558565 ?auto_558566 ?auto_558567 ?auto_558568 ?auto_558569 ?auto_558570 ?auto_558571 ?auto_558572 ?auto_558573 ?auto_558574 ?auto_558575 ?auto_558576 ?auto_558577 ?auto_558578 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558596 - BLOCK
      ?auto_558597 - BLOCK
      ?auto_558598 - BLOCK
      ?auto_558599 - BLOCK
      ?auto_558600 - BLOCK
      ?auto_558601 - BLOCK
      ?auto_558602 - BLOCK
      ?auto_558603 - BLOCK
      ?auto_558604 - BLOCK
      ?auto_558605 - BLOCK
      ?auto_558606 - BLOCK
      ?auto_558607 - BLOCK
      ?auto_558608 - BLOCK
      ?auto_558609 - BLOCK
      ?auto_558610 - BLOCK
      ?auto_558611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558611 ) ( ON-TABLE ?auto_558596 ) ( ON ?auto_558597 ?auto_558596 ) ( ON ?auto_558598 ?auto_558597 ) ( ON ?auto_558599 ?auto_558598 ) ( ON ?auto_558600 ?auto_558599 ) ( ON ?auto_558601 ?auto_558600 ) ( not ( = ?auto_558596 ?auto_558597 ) ) ( not ( = ?auto_558596 ?auto_558598 ) ) ( not ( = ?auto_558596 ?auto_558599 ) ) ( not ( = ?auto_558596 ?auto_558600 ) ) ( not ( = ?auto_558596 ?auto_558601 ) ) ( not ( = ?auto_558596 ?auto_558602 ) ) ( not ( = ?auto_558596 ?auto_558603 ) ) ( not ( = ?auto_558596 ?auto_558604 ) ) ( not ( = ?auto_558596 ?auto_558605 ) ) ( not ( = ?auto_558596 ?auto_558606 ) ) ( not ( = ?auto_558596 ?auto_558607 ) ) ( not ( = ?auto_558596 ?auto_558608 ) ) ( not ( = ?auto_558596 ?auto_558609 ) ) ( not ( = ?auto_558596 ?auto_558610 ) ) ( not ( = ?auto_558596 ?auto_558611 ) ) ( not ( = ?auto_558597 ?auto_558598 ) ) ( not ( = ?auto_558597 ?auto_558599 ) ) ( not ( = ?auto_558597 ?auto_558600 ) ) ( not ( = ?auto_558597 ?auto_558601 ) ) ( not ( = ?auto_558597 ?auto_558602 ) ) ( not ( = ?auto_558597 ?auto_558603 ) ) ( not ( = ?auto_558597 ?auto_558604 ) ) ( not ( = ?auto_558597 ?auto_558605 ) ) ( not ( = ?auto_558597 ?auto_558606 ) ) ( not ( = ?auto_558597 ?auto_558607 ) ) ( not ( = ?auto_558597 ?auto_558608 ) ) ( not ( = ?auto_558597 ?auto_558609 ) ) ( not ( = ?auto_558597 ?auto_558610 ) ) ( not ( = ?auto_558597 ?auto_558611 ) ) ( not ( = ?auto_558598 ?auto_558599 ) ) ( not ( = ?auto_558598 ?auto_558600 ) ) ( not ( = ?auto_558598 ?auto_558601 ) ) ( not ( = ?auto_558598 ?auto_558602 ) ) ( not ( = ?auto_558598 ?auto_558603 ) ) ( not ( = ?auto_558598 ?auto_558604 ) ) ( not ( = ?auto_558598 ?auto_558605 ) ) ( not ( = ?auto_558598 ?auto_558606 ) ) ( not ( = ?auto_558598 ?auto_558607 ) ) ( not ( = ?auto_558598 ?auto_558608 ) ) ( not ( = ?auto_558598 ?auto_558609 ) ) ( not ( = ?auto_558598 ?auto_558610 ) ) ( not ( = ?auto_558598 ?auto_558611 ) ) ( not ( = ?auto_558599 ?auto_558600 ) ) ( not ( = ?auto_558599 ?auto_558601 ) ) ( not ( = ?auto_558599 ?auto_558602 ) ) ( not ( = ?auto_558599 ?auto_558603 ) ) ( not ( = ?auto_558599 ?auto_558604 ) ) ( not ( = ?auto_558599 ?auto_558605 ) ) ( not ( = ?auto_558599 ?auto_558606 ) ) ( not ( = ?auto_558599 ?auto_558607 ) ) ( not ( = ?auto_558599 ?auto_558608 ) ) ( not ( = ?auto_558599 ?auto_558609 ) ) ( not ( = ?auto_558599 ?auto_558610 ) ) ( not ( = ?auto_558599 ?auto_558611 ) ) ( not ( = ?auto_558600 ?auto_558601 ) ) ( not ( = ?auto_558600 ?auto_558602 ) ) ( not ( = ?auto_558600 ?auto_558603 ) ) ( not ( = ?auto_558600 ?auto_558604 ) ) ( not ( = ?auto_558600 ?auto_558605 ) ) ( not ( = ?auto_558600 ?auto_558606 ) ) ( not ( = ?auto_558600 ?auto_558607 ) ) ( not ( = ?auto_558600 ?auto_558608 ) ) ( not ( = ?auto_558600 ?auto_558609 ) ) ( not ( = ?auto_558600 ?auto_558610 ) ) ( not ( = ?auto_558600 ?auto_558611 ) ) ( not ( = ?auto_558601 ?auto_558602 ) ) ( not ( = ?auto_558601 ?auto_558603 ) ) ( not ( = ?auto_558601 ?auto_558604 ) ) ( not ( = ?auto_558601 ?auto_558605 ) ) ( not ( = ?auto_558601 ?auto_558606 ) ) ( not ( = ?auto_558601 ?auto_558607 ) ) ( not ( = ?auto_558601 ?auto_558608 ) ) ( not ( = ?auto_558601 ?auto_558609 ) ) ( not ( = ?auto_558601 ?auto_558610 ) ) ( not ( = ?auto_558601 ?auto_558611 ) ) ( not ( = ?auto_558602 ?auto_558603 ) ) ( not ( = ?auto_558602 ?auto_558604 ) ) ( not ( = ?auto_558602 ?auto_558605 ) ) ( not ( = ?auto_558602 ?auto_558606 ) ) ( not ( = ?auto_558602 ?auto_558607 ) ) ( not ( = ?auto_558602 ?auto_558608 ) ) ( not ( = ?auto_558602 ?auto_558609 ) ) ( not ( = ?auto_558602 ?auto_558610 ) ) ( not ( = ?auto_558602 ?auto_558611 ) ) ( not ( = ?auto_558603 ?auto_558604 ) ) ( not ( = ?auto_558603 ?auto_558605 ) ) ( not ( = ?auto_558603 ?auto_558606 ) ) ( not ( = ?auto_558603 ?auto_558607 ) ) ( not ( = ?auto_558603 ?auto_558608 ) ) ( not ( = ?auto_558603 ?auto_558609 ) ) ( not ( = ?auto_558603 ?auto_558610 ) ) ( not ( = ?auto_558603 ?auto_558611 ) ) ( not ( = ?auto_558604 ?auto_558605 ) ) ( not ( = ?auto_558604 ?auto_558606 ) ) ( not ( = ?auto_558604 ?auto_558607 ) ) ( not ( = ?auto_558604 ?auto_558608 ) ) ( not ( = ?auto_558604 ?auto_558609 ) ) ( not ( = ?auto_558604 ?auto_558610 ) ) ( not ( = ?auto_558604 ?auto_558611 ) ) ( not ( = ?auto_558605 ?auto_558606 ) ) ( not ( = ?auto_558605 ?auto_558607 ) ) ( not ( = ?auto_558605 ?auto_558608 ) ) ( not ( = ?auto_558605 ?auto_558609 ) ) ( not ( = ?auto_558605 ?auto_558610 ) ) ( not ( = ?auto_558605 ?auto_558611 ) ) ( not ( = ?auto_558606 ?auto_558607 ) ) ( not ( = ?auto_558606 ?auto_558608 ) ) ( not ( = ?auto_558606 ?auto_558609 ) ) ( not ( = ?auto_558606 ?auto_558610 ) ) ( not ( = ?auto_558606 ?auto_558611 ) ) ( not ( = ?auto_558607 ?auto_558608 ) ) ( not ( = ?auto_558607 ?auto_558609 ) ) ( not ( = ?auto_558607 ?auto_558610 ) ) ( not ( = ?auto_558607 ?auto_558611 ) ) ( not ( = ?auto_558608 ?auto_558609 ) ) ( not ( = ?auto_558608 ?auto_558610 ) ) ( not ( = ?auto_558608 ?auto_558611 ) ) ( not ( = ?auto_558609 ?auto_558610 ) ) ( not ( = ?auto_558609 ?auto_558611 ) ) ( not ( = ?auto_558610 ?auto_558611 ) ) ( ON ?auto_558610 ?auto_558611 ) ( ON ?auto_558609 ?auto_558610 ) ( ON ?auto_558608 ?auto_558609 ) ( ON ?auto_558607 ?auto_558608 ) ( ON ?auto_558606 ?auto_558607 ) ( ON ?auto_558605 ?auto_558606 ) ( ON ?auto_558604 ?auto_558605 ) ( ON ?auto_558603 ?auto_558604 ) ( CLEAR ?auto_558601 ) ( ON ?auto_558602 ?auto_558603 ) ( CLEAR ?auto_558602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_558596 ?auto_558597 ?auto_558598 ?auto_558599 ?auto_558600 ?auto_558601 ?auto_558602 )
      ( MAKE-16PILE ?auto_558596 ?auto_558597 ?auto_558598 ?auto_558599 ?auto_558600 ?auto_558601 ?auto_558602 ?auto_558603 ?auto_558604 ?auto_558605 ?auto_558606 ?auto_558607 ?auto_558608 ?auto_558609 ?auto_558610 ?auto_558611 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558628 - BLOCK
      ?auto_558629 - BLOCK
      ?auto_558630 - BLOCK
      ?auto_558631 - BLOCK
      ?auto_558632 - BLOCK
      ?auto_558633 - BLOCK
      ?auto_558634 - BLOCK
      ?auto_558635 - BLOCK
      ?auto_558636 - BLOCK
      ?auto_558637 - BLOCK
      ?auto_558638 - BLOCK
      ?auto_558639 - BLOCK
      ?auto_558640 - BLOCK
      ?auto_558641 - BLOCK
      ?auto_558642 - BLOCK
      ?auto_558643 - BLOCK
    )
    :vars
    (
      ?auto_558644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558643 ?auto_558644 ) ( ON-TABLE ?auto_558628 ) ( ON ?auto_558629 ?auto_558628 ) ( ON ?auto_558630 ?auto_558629 ) ( ON ?auto_558631 ?auto_558630 ) ( ON ?auto_558632 ?auto_558631 ) ( not ( = ?auto_558628 ?auto_558629 ) ) ( not ( = ?auto_558628 ?auto_558630 ) ) ( not ( = ?auto_558628 ?auto_558631 ) ) ( not ( = ?auto_558628 ?auto_558632 ) ) ( not ( = ?auto_558628 ?auto_558633 ) ) ( not ( = ?auto_558628 ?auto_558634 ) ) ( not ( = ?auto_558628 ?auto_558635 ) ) ( not ( = ?auto_558628 ?auto_558636 ) ) ( not ( = ?auto_558628 ?auto_558637 ) ) ( not ( = ?auto_558628 ?auto_558638 ) ) ( not ( = ?auto_558628 ?auto_558639 ) ) ( not ( = ?auto_558628 ?auto_558640 ) ) ( not ( = ?auto_558628 ?auto_558641 ) ) ( not ( = ?auto_558628 ?auto_558642 ) ) ( not ( = ?auto_558628 ?auto_558643 ) ) ( not ( = ?auto_558628 ?auto_558644 ) ) ( not ( = ?auto_558629 ?auto_558630 ) ) ( not ( = ?auto_558629 ?auto_558631 ) ) ( not ( = ?auto_558629 ?auto_558632 ) ) ( not ( = ?auto_558629 ?auto_558633 ) ) ( not ( = ?auto_558629 ?auto_558634 ) ) ( not ( = ?auto_558629 ?auto_558635 ) ) ( not ( = ?auto_558629 ?auto_558636 ) ) ( not ( = ?auto_558629 ?auto_558637 ) ) ( not ( = ?auto_558629 ?auto_558638 ) ) ( not ( = ?auto_558629 ?auto_558639 ) ) ( not ( = ?auto_558629 ?auto_558640 ) ) ( not ( = ?auto_558629 ?auto_558641 ) ) ( not ( = ?auto_558629 ?auto_558642 ) ) ( not ( = ?auto_558629 ?auto_558643 ) ) ( not ( = ?auto_558629 ?auto_558644 ) ) ( not ( = ?auto_558630 ?auto_558631 ) ) ( not ( = ?auto_558630 ?auto_558632 ) ) ( not ( = ?auto_558630 ?auto_558633 ) ) ( not ( = ?auto_558630 ?auto_558634 ) ) ( not ( = ?auto_558630 ?auto_558635 ) ) ( not ( = ?auto_558630 ?auto_558636 ) ) ( not ( = ?auto_558630 ?auto_558637 ) ) ( not ( = ?auto_558630 ?auto_558638 ) ) ( not ( = ?auto_558630 ?auto_558639 ) ) ( not ( = ?auto_558630 ?auto_558640 ) ) ( not ( = ?auto_558630 ?auto_558641 ) ) ( not ( = ?auto_558630 ?auto_558642 ) ) ( not ( = ?auto_558630 ?auto_558643 ) ) ( not ( = ?auto_558630 ?auto_558644 ) ) ( not ( = ?auto_558631 ?auto_558632 ) ) ( not ( = ?auto_558631 ?auto_558633 ) ) ( not ( = ?auto_558631 ?auto_558634 ) ) ( not ( = ?auto_558631 ?auto_558635 ) ) ( not ( = ?auto_558631 ?auto_558636 ) ) ( not ( = ?auto_558631 ?auto_558637 ) ) ( not ( = ?auto_558631 ?auto_558638 ) ) ( not ( = ?auto_558631 ?auto_558639 ) ) ( not ( = ?auto_558631 ?auto_558640 ) ) ( not ( = ?auto_558631 ?auto_558641 ) ) ( not ( = ?auto_558631 ?auto_558642 ) ) ( not ( = ?auto_558631 ?auto_558643 ) ) ( not ( = ?auto_558631 ?auto_558644 ) ) ( not ( = ?auto_558632 ?auto_558633 ) ) ( not ( = ?auto_558632 ?auto_558634 ) ) ( not ( = ?auto_558632 ?auto_558635 ) ) ( not ( = ?auto_558632 ?auto_558636 ) ) ( not ( = ?auto_558632 ?auto_558637 ) ) ( not ( = ?auto_558632 ?auto_558638 ) ) ( not ( = ?auto_558632 ?auto_558639 ) ) ( not ( = ?auto_558632 ?auto_558640 ) ) ( not ( = ?auto_558632 ?auto_558641 ) ) ( not ( = ?auto_558632 ?auto_558642 ) ) ( not ( = ?auto_558632 ?auto_558643 ) ) ( not ( = ?auto_558632 ?auto_558644 ) ) ( not ( = ?auto_558633 ?auto_558634 ) ) ( not ( = ?auto_558633 ?auto_558635 ) ) ( not ( = ?auto_558633 ?auto_558636 ) ) ( not ( = ?auto_558633 ?auto_558637 ) ) ( not ( = ?auto_558633 ?auto_558638 ) ) ( not ( = ?auto_558633 ?auto_558639 ) ) ( not ( = ?auto_558633 ?auto_558640 ) ) ( not ( = ?auto_558633 ?auto_558641 ) ) ( not ( = ?auto_558633 ?auto_558642 ) ) ( not ( = ?auto_558633 ?auto_558643 ) ) ( not ( = ?auto_558633 ?auto_558644 ) ) ( not ( = ?auto_558634 ?auto_558635 ) ) ( not ( = ?auto_558634 ?auto_558636 ) ) ( not ( = ?auto_558634 ?auto_558637 ) ) ( not ( = ?auto_558634 ?auto_558638 ) ) ( not ( = ?auto_558634 ?auto_558639 ) ) ( not ( = ?auto_558634 ?auto_558640 ) ) ( not ( = ?auto_558634 ?auto_558641 ) ) ( not ( = ?auto_558634 ?auto_558642 ) ) ( not ( = ?auto_558634 ?auto_558643 ) ) ( not ( = ?auto_558634 ?auto_558644 ) ) ( not ( = ?auto_558635 ?auto_558636 ) ) ( not ( = ?auto_558635 ?auto_558637 ) ) ( not ( = ?auto_558635 ?auto_558638 ) ) ( not ( = ?auto_558635 ?auto_558639 ) ) ( not ( = ?auto_558635 ?auto_558640 ) ) ( not ( = ?auto_558635 ?auto_558641 ) ) ( not ( = ?auto_558635 ?auto_558642 ) ) ( not ( = ?auto_558635 ?auto_558643 ) ) ( not ( = ?auto_558635 ?auto_558644 ) ) ( not ( = ?auto_558636 ?auto_558637 ) ) ( not ( = ?auto_558636 ?auto_558638 ) ) ( not ( = ?auto_558636 ?auto_558639 ) ) ( not ( = ?auto_558636 ?auto_558640 ) ) ( not ( = ?auto_558636 ?auto_558641 ) ) ( not ( = ?auto_558636 ?auto_558642 ) ) ( not ( = ?auto_558636 ?auto_558643 ) ) ( not ( = ?auto_558636 ?auto_558644 ) ) ( not ( = ?auto_558637 ?auto_558638 ) ) ( not ( = ?auto_558637 ?auto_558639 ) ) ( not ( = ?auto_558637 ?auto_558640 ) ) ( not ( = ?auto_558637 ?auto_558641 ) ) ( not ( = ?auto_558637 ?auto_558642 ) ) ( not ( = ?auto_558637 ?auto_558643 ) ) ( not ( = ?auto_558637 ?auto_558644 ) ) ( not ( = ?auto_558638 ?auto_558639 ) ) ( not ( = ?auto_558638 ?auto_558640 ) ) ( not ( = ?auto_558638 ?auto_558641 ) ) ( not ( = ?auto_558638 ?auto_558642 ) ) ( not ( = ?auto_558638 ?auto_558643 ) ) ( not ( = ?auto_558638 ?auto_558644 ) ) ( not ( = ?auto_558639 ?auto_558640 ) ) ( not ( = ?auto_558639 ?auto_558641 ) ) ( not ( = ?auto_558639 ?auto_558642 ) ) ( not ( = ?auto_558639 ?auto_558643 ) ) ( not ( = ?auto_558639 ?auto_558644 ) ) ( not ( = ?auto_558640 ?auto_558641 ) ) ( not ( = ?auto_558640 ?auto_558642 ) ) ( not ( = ?auto_558640 ?auto_558643 ) ) ( not ( = ?auto_558640 ?auto_558644 ) ) ( not ( = ?auto_558641 ?auto_558642 ) ) ( not ( = ?auto_558641 ?auto_558643 ) ) ( not ( = ?auto_558641 ?auto_558644 ) ) ( not ( = ?auto_558642 ?auto_558643 ) ) ( not ( = ?auto_558642 ?auto_558644 ) ) ( not ( = ?auto_558643 ?auto_558644 ) ) ( ON ?auto_558642 ?auto_558643 ) ( ON ?auto_558641 ?auto_558642 ) ( ON ?auto_558640 ?auto_558641 ) ( ON ?auto_558639 ?auto_558640 ) ( ON ?auto_558638 ?auto_558639 ) ( ON ?auto_558637 ?auto_558638 ) ( ON ?auto_558636 ?auto_558637 ) ( ON ?auto_558635 ?auto_558636 ) ( ON ?auto_558634 ?auto_558635 ) ( CLEAR ?auto_558632 ) ( ON ?auto_558633 ?auto_558634 ) ( CLEAR ?auto_558633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_558628 ?auto_558629 ?auto_558630 ?auto_558631 ?auto_558632 ?auto_558633 )
      ( MAKE-16PILE ?auto_558628 ?auto_558629 ?auto_558630 ?auto_558631 ?auto_558632 ?auto_558633 ?auto_558634 ?auto_558635 ?auto_558636 ?auto_558637 ?auto_558638 ?auto_558639 ?auto_558640 ?auto_558641 ?auto_558642 ?auto_558643 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558661 - BLOCK
      ?auto_558662 - BLOCK
      ?auto_558663 - BLOCK
      ?auto_558664 - BLOCK
      ?auto_558665 - BLOCK
      ?auto_558666 - BLOCK
      ?auto_558667 - BLOCK
      ?auto_558668 - BLOCK
      ?auto_558669 - BLOCK
      ?auto_558670 - BLOCK
      ?auto_558671 - BLOCK
      ?auto_558672 - BLOCK
      ?auto_558673 - BLOCK
      ?auto_558674 - BLOCK
      ?auto_558675 - BLOCK
      ?auto_558676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558676 ) ( ON-TABLE ?auto_558661 ) ( ON ?auto_558662 ?auto_558661 ) ( ON ?auto_558663 ?auto_558662 ) ( ON ?auto_558664 ?auto_558663 ) ( ON ?auto_558665 ?auto_558664 ) ( not ( = ?auto_558661 ?auto_558662 ) ) ( not ( = ?auto_558661 ?auto_558663 ) ) ( not ( = ?auto_558661 ?auto_558664 ) ) ( not ( = ?auto_558661 ?auto_558665 ) ) ( not ( = ?auto_558661 ?auto_558666 ) ) ( not ( = ?auto_558661 ?auto_558667 ) ) ( not ( = ?auto_558661 ?auto_558668 ) ) ( not ( = ?auto_558661 ?auto_558669 ) ) ( not ( = ?auto_558661 ?auto_558670 ) ) ( not ( = ?auto_558661 ?auto_558671 ) ) ( not ( = ?auto_558661 ?auto_558672 ) ) ( not ( = ?auto_558661 ?auto_558673 ) ) ( not ( = ?auto_558661 ?auto_558674 ) ) ( not ( = ?auto_558661 ?auto_558675 ) ) ( not ( = ?auto_558661 ?auto_558676 ) ) ( not ( = ?auto_558662 ?auto_558663 ) ) ( not ( = ?auto_558662 ?auto_558664 ) ) ( not ( = ?auto_558662 ?auto_558665 ) ) ( not ( = ?auto_558662 ?auto_558666 ) ) ( not ( = ?auto_558662 ?auto_558667 ) ) ( not ( = ?auto_558662 ?auto_558668 ) ) ( not ( = ?auto_558662 ?auto_558669 ) ) ( not ( = ?auto_558662 ?auto_558670 ) ) ( not ( = ?auto_558662 ?auto_558671 ) ) ( not ( = ?auto_558662 ?auto_558672 ) ) ( not ( = ?auto_558662 ?auto_558673 ) ) ( not ( = ?auto_558662 ?auto_558674 ) ) ( not ( = ?auto_558662 ?auto_558675 ) ) ( not ( = ?auto_558662 ?auto_558676 ) ) ( not ( = ?auto_558663 ?auto_558664 ) ) ( not ( = ?auto_558663 ?auto_558665 ) ) ( not ( = ?auto_558663 ?auto_558666 ) ) ( not ( = ?auto_558663 ?auto_558667 ) ) ( not ( = ?auto_558663 ?auto_558668 ) ) ( not ( = ?auto_558663 ?auto_558669 ) ) ( not ( = ?auto_558663 ?auto_558670 ) ) ( not ( = ?auto_558663 ?auto_558671 ) ) ( not ( = ?auto_558663 ?auto_558672 ) ) ( not ( = ?auto_558663 ?auto_558673 ) ) ( not ( = ?auto_558663 ?auto_558674 ) ) ( not ( = ?auto_558663 ?auto_558675 ) ) ( not ( = ?auto_558663 ?auto_558676 ) ) ( not ( = ?auto_558664 ?auto_558665 ) ) ( not ( = ?auto_558664 ?auto_558666 ) ) ( not ( = ?auto_558664 ?auto_558667 ) ) ( not ( = ?auto_558664 ?auto_558668 ) ) ( not ( = ?auto_558664 ?auto_558669 ) ) ( not ( = ?auto_558664 ?auto_558670 ) ) ( not ( = ?auto_558664 ?auto_558671 ) ) ( not ( = ?auto_558664 ?auto_558672 ) ) ( not ( = ?auto_558664 ?auto_558673 ) ) ( not ( = ?auto_558664 ?auto_558674 ) ) ( not ( = ?auto_558664 ?auto_558675 ) ) ( not ( = ?auto_558664 ?auto_558676 ) ) ( not ( = ?auto_558665 ?auto_558666 ) ) ( not ( = ?auto_558665 ?auto_558667 ) ) ( not ( = ?auto_558665 ?auto_558668 ) ) ( not ( = ?auto_558665 ?auto_558669 ) ) ( not ( = ?auto_558665 ?auto_558670 ) ) ( not ( = ?auto_558665 ?auto_558671 ) ) ( not ( = ?auto_558665 ?auto_558672 ) ) ( not ( = ?auto_558665 ?auto_558673 ) ) ( not ( = ?auto_558665 ?auto_558674 ) ) ( not ( = ?auto_558665 ?auto_558675 ) ) ( not ( = ?auto_558665 ?auto_558676 ) ) ( not ( = ?auto_558666 ?auto_558667 ) ) ( not ( = ?auto_558666 ?auto_558668 ) ) ( not ( = ?auto_558666 ?auto_558669 ) ) ( not ( = ?auto_558666 ?auto_558670 ) ) ( not ( = ?auto_558666 ?auto_558671 ) ) ( not ( = ?auto_558666 ?auto_558672 ) ) ( not ( = ?auto_558666 ?auto_558673 ) ) ( not ( = ?auto_558666 ?auto_558674 ) ) ( not ( = ?auto_558666 ?auto_558675 ) ) ( not ( = ?auto_558666 ?auto_558676 ) ) ( not ( = ?auto_558667 ?auto_558668 ) ) ( not ( = ?auto_558667 ?auto_558669 ) ) ( not ( = ?auto_558667 ?auto_558670 ) ) ( not ( = ?auto_558667 ?auto_558671 ) ) ( not ( = ?auto_558667 ?auto_558672 ) ) ( not ( = ?auto_558667 ?auto_558673 ) ) ( not ( = ?auto_558667 ?auto_558674 ) ) ( not ( = ?auto_558667 ?auto_558675 ) ) ( not ( = ?auto_558667 ?auto_558676 ) ) ( not ( = ?auto_558668 ?auto_558669 ) ) ( not ( = ?auto_558668 ?auto_558670 ) ) ( not ( = ?auto_558668 ?auto_558671 ) ) ( not ( = ?auto_558668 ?auto_558672 ) ) ( not ( = ?auto_558668 ?auto_558673 ) ) ( not ( = ?auto_558668 ?auto_558674 ) ) ( not ( = ?auto_558668 ?auto_558675 ) ) ( not ( = ?auto_558668 ?auto_558676 ) ) ( not ( = ?auto_558669 ?auto_558670 ) ) ( not ( = ?auto_558669 ?auto_558671 ) ) ( not ( = ?auto_558669 ?auto_558672 ) ) ( not ( = ?auto_558669 ?auto_558673 ) ) ( not ( = ?auto_558669 ?auto_558674 ) ) ( not ( = ?auto_558669 ?auto_558675 ) ) ( not ( = ?auto_558669 ?auto_558676 ) ) ( not ( = ?auto_558670 ?auto_558671 ) ) ( not ( = ?auto_558670 ?auto_558672 ) ) ( not ( = ?auto_558670 ?auto_558673 ) ) ( not ( = ?auto_558670 ?auto_558674 ) ) ( not ( = ?auto_558670 ?auto_558675 ) ) ( not ( = ?auto_558670 ?auto_558676 ) ) ( not ( = ?auto_558671 ?auto_558672 ) ) ( not ( = ?auto_558671 ?auto_558673 ) ) ( not ( = ?auto_558671 ?auto_558674 ) ) ( not ( = ?auto_558671 ?auto_558675 ) ) ( not ( = ?auto_558671 ?auto_558676 ) ) ( not ( = ?auto_558672 ?auto_558673 ) ) ( not ( = ?auto_558672 ?auto_558674 ) ) ( not ( = ?auto_558672 ?auto_558675 ) ) ( not ( = ?auto_558672 ?auto_558676 ) ) ( not ( = ?auto_558673 ?auto_558674 ) ) ( not ( = ?auto_558673 ?auto_558675 ) ) ( not ( = ?auto_558673 ?auto_558676 ) ) ( not ( = ?auto_558674 ?auto_558675 ) ) ( not ( = ?auto_558674 ?auto_558676 ) ) ( not ( = ?auto_558675 ?auto_558676 ) ) ( ON ?auto_558675 ?auto_558676 ) ( ON ?auto_558674 ?auto_558675 ) ( ON ?auto_558673 ?auto_558674 ) ( ON ?auto_558672 ?auto_558673 ) ( ON ?auto_558671 ?auto_558672 ) ( ON ?auto_558670 ?auto_558671 ) ( ON ?auto_558669 ?auto_558670 ) ( ON ?auto_558668 ?auto_558669 ) ( ON ?auto_558667 ?auto_558668 ) ( CLEAR ?auto_558665 ) ( ON ?auto_558666 ?auto_558667 ) ( CLEAR ?auto_558666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_558661 ?auto_558662 ?auto_558663 ?auto_558664 ?auto_558665 ?auto_558666 )
      ( MAKE-16PILE ?auto_558661 ?auto_558662 ?auto_558663 ?auto_558664 ?auto_558665 ?auto_558666 ?auto_558667 ?auto_558668 ?auto_558669 ?auto_558670 ?auto_558671 ?auto_558672 ?auto_558673 ?auto_558674 ?auto_558675 ?auto_558676 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558693 - BLOCK
      ?auto_558694 - BLOCK
      ?auto_558695 - BLOCK
      ?auto_558696 - BLOCK
      ?auto_558697 - BLOCK
      ?auto_558698 - BLOCK
      ?auto_558699 - BLOCK
      ?auto_558700 - BLOCK
      ?auto_558701 - BLOCK
      ?auto_558702 - BLOCK
      ?auto_558703 - BLOCK
      ?auto_558704 - BLOCK
      ?auto_558705 - BLOCK
      ?auto_558706 - BLOCK
      ?auto_558707 - BLOCK
      ?auto_558708 - BLOCK
    )
    :vars
    (
      ?auto_558709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558708 ?auto_558709 ) ( ON-TABLE ?auto_558693 ) ( ON ?auto_558694 ?auto_558693 ) ( ON ?auto_558695 ?auto_558694 ) ( ON ?auto_558696 ?auto_558695 ) ( not ( = ?auto_558693 ?auto_558694 ) ) ( not ( = ?auto_558693 ?auto_558695 ) ) ( not ( = ?auto_558693 ?auto_558696 ) ) ( not ( = ?auto_558693 ?auto_558697 ) ) ( not ( = ?auto_558693 ?auto_558698 ) ) ( not ( = ?auto_558693 ?auto_558699 ) ) ( not ( = ?auto_558693 ?auto_558700 ) ) ( not ( = ?auto_558693 ?auto_558701 ) ) ( not ( = ?auto_558693 ?auto_558702 ) ) ( not ( = ?auto_558693 ?auto_558703 ) ) ( not ( = ?auto_558693 ?auto_558704 ) ) ( not ( = ?auto_558693 ?auto_558705 ) ) ( not ( = ?auto_558693 ?auto_558706 ) ) ( not ( = ?auto_558693 ?auto_558707 ) ) ( not ( = ?auto_558693 ?auto_558708 ) ) ( not ( = ?auto_558693 ?auto_558709 ) ) ( not ( = ?auto_558694 ?auto_558695 ) ) ( not ( = ?auto_558694 ?auto_558696 ) ) ( not ( = ?auto_558694 ?auto_558697 ) ) ( not ( = ?auto_558694 ?auto_558698 ) ) ( not ( = ?auto_558694 ?auto_558699 ) ) ( not ( = ?auto_558694 ?auto_558700 ) ) ( not ( = ?auto_558694 ?auto_558701 ) ) ( not ( = ?auto_558694 ?auto_558702 ) ) ( not ( = ?auto_558694 ?auto_558703 ) ) ( not ( = ?auto_558694 ?auto_558704 ) ) ( not ( = ?auto_558694 ?auto_558705 ) ) ( not ( = ?auto_558694 ?auto_558706 ) ) ( not ( = ?auto_558694 ?auto_558707 ) ) ( not ( = ?auto_558694 ?auto_558708 ) ) ( not ( = ?auto_558694 ?auto_558709 ) ) ( not ( = ?auto_558695 ?auto_558696 ) ) ( not ( = ?auto_558695 ?auto_558697 ) ) ( not ( = ?auto_558695 ?auto_558698 ) ) ( not ( = ?auto_558695 ?auto_558699 ) ) ( not ( = ?auto_558695 ?auto_558700 ) ) ( not ( = ?auto_558695 ?auto_558701 ) ) ( not ( = ?auto_558695 ?auto_558702 ) ) ( not ( = ?auto_558695 ?auto_558703 ) ) ( not ( = ?auto_558695 ?auto_558704 ) ) ( not ( = ?auto_558695 ?auto_558705 ) ) ( not ( = ?auto_558695 ?auto_558706 ) ) ( not ( = ?auto_558695 ?auto_558707 ) ) ( not ( = ?auto_558695 ?auto_558708 ) ) ( not ( = ?auto_558695 ?auto_558709 ) ) ( not ( = ?auto_558696 ?auto_558697 ) ) ( not ( = ?auto_558696 ?auto_558698 ) ) ( not ( = ?auto_558696 ?auto_558699 ) ) ( not ( = ?auto_558696 ?auto_558700 ) ) ( not ( = ?auto_558696 ?auto_558701 ) ) ( not ( = ?auto_558696 ?auto_558702 ) ) ( not ( = ?auto_558696 ?auto_558703 ) ) ( not ( = ?auto_558696 ?auto_558704 ) ) ( not ( = ?auto_558696 ?auto_558705 ) ) ( not ( = ?auto_558696 ?auto_558706 ) ) ( not ( = ?auto_558696 ?auto_558707 ) ) ( not ( = ?auto_558696 ?auto_558708 ) ) ( not ( = ?auto_558696 ?auto_558709 ) ) ( not ( = ?auto_558697 ?auto_558698 ) ) ( not ( = ?auto_558697 ?auto_558699 ) ) ( not ( = ?auto_558697 ?auto_558700 ) ) ( not ( = ?auto_558697 ?auto_558701 ) ) ( not ( = ?auto_558697 ?auto_558702 ) ) ( not ( = ?auto_558697 ?auto_558703 ) ) ( not ( = ?auto_558697 ?auto_558704 ) ) ( not ( = ?auto_558697 ?auto_558705 ) ) ( not ( = ?auto_558697 ?auto_558706 ) ) ( not ( = ?auto_558697 ?auto_558707 ) ) ( not ( = ?auto_558697 ?auto_558708 ) ) ( not ( = ?auto_558697 ?auto_558709 ) ) ( not ( = ?auto_558698 ?auto_558699 ) ) ( not ( = ?auto_558698 ?auto_558700 ) ) ( not ( = ?auto_558698 ?auto_558701 ) ) ( not ( = ?auto_558698 ?auto_558702 ) ) ( not ( = ?auto_558698 ?auto_558703 ) ) ( not ( = ?auto_558698 ?auto_558704 ) ) ( not ( = ?auto_558698 ?auto_558705 ) ) ( not ( = ?auto_558698 ?auto_558706 ) ) ( not ( = ?auto_558698 ?auto_558707 ) ) ( not ( = ?auto_558698 ?auto_558708 ) ) ( not ( = ?auto_558698 ?auto_558709 ) ) ( not ( = ?auto_558699 ?auto_558700 ) ) ( not ( = ?auto_558699 ?auto_558701 ) ) ( not ( = ?auto_558699 ?auto_558702 ) ) ( not ( = ?auto_558699 ?auto_558703 ) ) ( not ( = ?auto_558699 ?auto_558704 ) ) ( not ( = ?auto_558699 ?auto_558705 ) ) ( not ( = ?auto_558699 ?auto_558706 ) ) ( not ( = ?auto_558699 ?auto_558707 ) ) ( not ( = ?auto_558699 ?auto_558708 ) ) ( not ( = ?auto_558699 ?auto_558709 ) ) ( not ( = ?auto_558700 ?auto_558701 ) ) ( not ( = ?auto_558700 ?auto_558702 ) ) ( not ( = ?auto_558700 ?auto_558703 ) ) ( not ( = ?auto_558700 ?auto_558704 ) ) ( not ( = ?auto_558700 ?auto_558705 ) ) ( not ( = ?auto_558700 ?auto_558706 ) ) ( not ( = ?auto_558700 ?auto_558707 ) ) ( not ( = ?auto_558700 ?auto_558708 ) ) ( not ( = ?auto_558700 ?auto_558709 ) ) ( not ( = ?auto_558701 ?auto_558702 ) ) ( not ( = ?auto_558701 ?auto_558703 ) ) ( not ( = ?auto_558701 ?auto_558704 ) ) ( not ( = ?auto_558701 ?auto_558705 ) ) ( not ( = ?auto_558701 ?auto_558706 ) ) ( not ( = ?auto_558701 ?auto_558707 ) ) ( not ( = ?auto_558701 ?auto_558708 ) ) ( not ( = ?auto_558701 ?auto_558709 ) ) ( not ( = ?auto_558702 ?auto_558703 ) ) ( not ( = ?auto_558702 ?auto_558704 ) ) ( not ( = ?auto_558702 ?auto_558705 ) ) ( not ( = ?auto_558702 ?auto_558706 ) ) ( not ( = ?auto_558702 ?auto_558707 ) ) ( not ( = ?auto_558702 ?auto_558708 ) ) ( not ( = ?auto_558702 ?auto_558709 ) ) ( not ( = ?auto_558703 ?auto_558704 ) ) ( not ( = ?auto_558703 ?auto_558705 ) ) ( not ( = ?auto_558703 ?auto_558706 ) ) ( not ( = ?auto_558703 ?auto_558707 ) ) ( not ( = ?auto_558703 ?auto_558708 ) ) ( not ( = ?auto_558703 ?auto_558709 ) ) ( not ( = ?auto_558704 ?auto_558705 ) ) ( not ( = ?auto_558704 ?auto_558706 ) ) ( not ( = ?auto_558704 ?auto_558707 ) ) ( not ( = ?auto_558704 ?auto_558708 ) ) ( not ( = ?auto_558704 ?auto_558709 ) ) ( not ( = ?auto_558705 ?auto_558706 ) ) ( not ( = ?auto_558705 ?auto_558707 ) ) ( not ( = ?auto_558705 ?auto_558708 ) ) ( not ( = ?auto_558705 ?auto_558709 ) ) ( not ( = ?auto_558706 ?auto_558707 ) ) ( not ( = ?auto_558706 ?auto_558708 ) ) ( not ( = ?auto_558706 ?auto_558709 ) ) ( not ( = ?auto_558707 ?auto_558708 ) ) ( not ( = ?auto_558707 ?auto_558709 ) ) ( not ( = ?auto_558708 ?auto_558709 ) ) ( ON ?auto_558707 ?auto_558708 ) ( ON ?auto_558706 ?auto_558707 ) ( ON ?auto_558705 ?auto_558706 ) ( ON ?auto_558704 ?auto_558705 ) ( ON ?auto_558703 ?auto_558704 ) ( ON ?auto_558702 ?auto_558703 ) ( ON ?auto_558701 ?auto_558702 ) ( ON ?auto_558700 ?auto_558701 ) ( ON ?auto_558699 ?auto_558700 ) ( ON ?auto_558698 ?auto_558699 ) ( CLEAR ?auto_558696 ) ( ON ?auto_558697 ?auto_558698 ) ( CLEAR ?auto_558697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_558693 ?auto_558694 ?auto_558695 ?auto_558696 ?auto_558697 )
      ( MAKE-16PILE ?auto_558693 ?auto_558694 ?auto_558695 ?auto_558696 ?auto_558697 ?auto_558698 ?auto_558699 ?auto_558700 ?auto_558701 ?auto_558702 ?auto_558703 ?auto_558704 ?auto_558705 ?auto_558706 ?auto_558707 ?auto_558708 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558726 - BLOCK
      ?auto_558727 - BLOCK
      ?auto_558728 - BLOCK
      ?auto_558729 - BLOCK
      ?auto_558730 - BLOCK
      ?auto_558731 - BLOCK
      ?auto_558732 - BLOCK
      ?auto_558733 - BLOCK
      ?auto_558734 - BLOCK
      ?auto_558735 - BLOCK
      ?auto_558736 - BLOCK
      ?auto_558737 - BLOCK
      ?auto_558738 - BLOCK
      ?auto_558739 - BLOCK
      ?auto_558740 - BLOCK
      ?auto_558741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558741 ) ( ON-TABLE ?auto_558726 ) ( ON ?auto_558727 ?auto_558726 ) ( ON ?auto_558728 ?auto_558727 ) ( ON ?auto_558729 ?auto_558728 ) ( not ( = ?auto_558726 ?auto_558727 ) ) ( not ( = ?auto_558726 ?auto_558728 ) ) ( not ( = ?auto_558726 ?auto_558729 ) ) ( not ( = ?auto_558726 ?auto_558730 ) ) ( not ( = ?auto_558726 ?auto_558731 ) ) ( not ( = ?auto_558726 ?auto_558732 ) ) ( not ( = ?auto_558726 ?auto_558733 ) ) ( not ( = ?auto_558726 ?auto_558734 ) ) ( not ( = ?auto_558726 ?auto_558735 ) ) ( not ( = ?auto_558726 ?auto_558736 ) ) ( not ( = ?auto_558726 ?auto_558737 ) ) ( not ( = ?auto_558726 ?auto_558738 ) ) ( not ( = ?auto_558726 ?auto_558739 ) ) ( not ( = ?auto_558726 ?auto_558740 ) ) ( not ( = ?auto_558726 ?auto_558741 ) ) ( not ( = ?auto_558727 ?auto_558728 ) ) ( not ( = ?auto_558727 ?auto_558729 ) ) ( not ( = ?auto_558727 ?auto_558730 ) ) ( not ( = ?auto_558727 ?auto_558731 ) ) ( not ( = ?auto_558727 ?auto_558732 ) ) ( not ( = ?auto_558727 ?auto_558733 ) ) ( not ( = ?auto_558727 ?auto_558734 ) ) ( not ( = ?auto_558727 ?auto_558735 ) ) ( not ( = ?auto_558727 ?auto_558736 ) ) ( not ( = ?auto_558727 ?auto_558737 ) ) ( not ( = ?auto_558727 ?auto_558738 ) ) ( not ( = ?auto_558727 ?auto_558739 ) ) ( not ( = ?auto_558727 ?auto_558740 ) ) ( not ( = ?auto_558727 ?auto_558741 ) ) ( not ( = ?auto_558728 ?auto_558729 ) ) ( not ( = ?auto_558728 ?auto_558730 ) ) ( not ( = ?auto_558728 ?auto_558731 ) ) ( not ( = ?auto_558728 ?auto_558732 ) ) ( not ( = ?auto_558728 ?auto_558733 ) ) ( not ( = ?auto_558728 ?auto_558734 ) ) ( not ( = ?auto_558728 ?auto_558735 ) ) ( not ( = ?auto_558728 ?auto_558736 ) ) ( not ( = ?auto_558728 ?auto_558737 ) ) ( not ( = ?auto_558728 ?auto_558738 ) ) ( not ( = ?auto_558728 ?auto_558739 ) ) ( not ( = ?auto_558728 ?auto_558740 ) ) ( not ( = ?auto_558728 ?auto_558741 ) ) ( not ( = ?auto_558729 ?auto_558730 ) ) ( not ( = ?auto_558729 ?auto_558731 ) ) ( not ( = ?auto_558729 ?auto_558732 ) ) ( not ( = ?auto_558729 ?auto_558733 ) ) ( not ( = ?auto_558729 ?auto_558734 ) ) ( not ( = ?auto_558729 ?auto_558735 ) ) ( not ( = ?auto_558729 ?auto_558736 ) ) ( not ( = ?auto_558729 ?auto_558737 ) ) ( not ( = ?auto_558729 ?auto_558738 ) ) ( not ( = ?auto_558729 ?auto_558739 ) ) ( not ( = ?auto_558729 ?auto_558740 ) ) ( not ( = ?auto_558729 ?auto_558741 ) ) ( not ( = ?auto_558730 ?auto_558731 ) ) ( not ( = ?auto_558730 ?auto_558732 ) ) ( not ( = ?auto_558730 ?auto_558733 ) ) ( not ( = ?auto_558730 ?auto_558734 ) ) ( not ( = ?auto_558730 ?auto_558735 ) ) ( not ( = ?auto_558730 ?auto_558736 ) ) ( not ( = ?auto_558730 ?auto_558737 ) ) ( not ( = ?auto_558730 ?auto_558738 ) ) ( not ( = ?auto_558730 ?auto_558739 ) ) ( not ( = ?auto_558730 ?auto_558740 ) ) ( not ( = ?auto_558730 ?auto_558741 ) ) ( not ( = ?auto_558731 ?auto_558732 ) ) ( not ( = ?auto_558731 ?auto_558733 ) ) ( not ( = ?auto_558731 ?auto_558734 ) ) ( not ( = ?auto_558731 ?auto_558735 ) ) ( not ( = ?auto_558731 ?auto_558736 ) ) ( not ( = ?auto_558731 ?auto_558737 ) ) ( not ( = ?auto_558731 ?auto_558738 ) ) ( not ( = ?auto_558731 ?auto_558739 ) ) ( not ( = ?auto_558731 ?auto_558740 ) ) ( not ( = ?auto_558731 ?auto_558741 ) ) ( not ( = ?auto_558732 ?auto_558733 ) ) ( not ( = ?auto_558732 ?auto_558734 ) ) ( not ( = ?auto_558732 ?auto_558735 ) ) ( not ( = ?auto_558732 ?auto_558736 ) ) ( not ( = ?auto_558732 ?auto_558737 ) ) ( not ( = ?auto_558732 ?auto_558738 ) ) ( not ( = ?auto_558732 ?auto_558739 ) ) ( not ( = ?auto_558732 ?auto_558740 ) ) ( not ( = ?auto_558732 ?auto_558741 ) ) ( not ( = ?auto_558733 ?auto_558734 ) ) ( not ( = ?auto_558733 ?auto_558735 ) ) ( not ( = ?auto_558733 ?auto_558736 ) ) ( not ( = ?auto_558733 ?auto_558737 ) ) ( not ( = ?auto_558733 ?auto_558738 ) ) ( not ( = ?auto_558733 ?auto_558739 ) ) ( not ( = ?auto_558733 ?auto_558740 ) ) ( not ( = ?auto_558733 ?auto_558741 ) ) ( not ( = ?auto_558734 ?auto_558735 ) ) ( not ( = ?auto_558734 ?auto_558736 ) ) ( not ( = ?auto_558734 ?auto_558737 ) ) ( not ( = ?auto_558734 ?auto_558738 ) ) ( not ( = ?auto_558734 ?auto_558739 ) ) ( not ( = ?auto_558734 ?auto_558740 ) ) ( not ( = ?auto_558734 ?auto_558741 ) ) ( not ( = ?auto_558735 ?auto_558736 ) ) ( not ( = ?auto_558735 ?auto_558737 ) ) ( not ( = ?auto_558735 ?auto_558738 ) ) ( not ( = ?auto_558735 ?auto_558739 ) ) ( not ( = ?auto_558735 ?auto_558740 ) ) ( not ( = ?auto_558735 ?auto_558741 ) ) ( not ( = ?auto_558736 ?auto_558737 ) ) ( not ( = ?auto_558736 ?auto_558738 ) ) ( not ( = ?auto_558736 ?auto_558739 ) ) ( not ( = ?auto_558736 ?auto_558740 ) ) ( not ( = ?auto_558736 ?auto_558741 ) ) ( not ( = ?auto_558737 ?auto_558738 ) ) ( not ( = ?auto_558737 ?auto_558739 ) ) ( not ( = ?auto_558737 ?auto_558740 ) ) ( not ( = ?auto_558737 ?auto_558741 ) ) ( not ( = ?auto_558738 ?auto_558739 ) ) ( not ( = ?auto_558738 ?auto_558740 ) ) ( not ( = ?auto_558738 ?auto_558741 ) ) ( not ( = ?auto_558739 ?auto_558740 ) ) ( not ( = ?auto_558739 ?auto_558741 ) ) ( not ( = ?auto_558740 ?auto_558741 ) ) ( ON ?auto_558740 ?auto_558741 ) ( ON ?auto_558739 ?auto_558740 ) ( ON ?auto_558738 ?auto_558739 ) ( ON ?auto_558737 ?auto_558738 ) ( ON ?auto_558736 ?auto_558737 ) ( ON ?auto_558735 ?auto_558736 ) ( ON ?auto_558734 ?auto_558735 ) ( ON ?auto_558733 ?auto_558734 ) ( ON ?auto_558732 ?auto_558733 ) ( ON ?auto_558731 ?auto_558732 ) ( CLEAR ?auto_558729 ) ( ON ?auto_558730 ?auto_558731 ) ( CLEAR ?auto_558730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_558726 ?auto_558727 ?auto_558728 ?auto_558729 ?auto_558730 )
      ( MAKE-16PILE ?auto_558726 ?auto_558727 ?auto_558728 ?auto_558729 ?auto_558730 ?auto_558731 ?auto_558732 ?auto_558733 ?auto_558734 ?auto_558735 ?auto_558736 ?auto_558737 ?auto_558738 ?auto_558739 ?auto_558740 ?auto_558741 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558758 - BLOCK
      ?auto_558759 - BLOCK
      ?auto_558760 - BLOCK
      ?auto_558761 - BLOCK
      ?auto_558762 - BLOCK
      ?auto_558763 - BLOCK
      ?auto_558764 - BLOCK
      ?auto_558765 - BLOCK
      ?auto_558766 - BLOCK
      ?auto_558767 - BLOCK
      ?auto_558768 - BLOCK
      ?auto_558769 - BLOCK
      ?auto_558770 - BLOCK
      ?auto_558771 - BLOCK
      ?auto_558772 - BLOCK
      ?auto_558773 - BLOCK
    )
    :vars
    (
      ?auto_558774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558773 ?auto_558774 ) ( ON-TABLE ?auto_558758 ) ( ON ?auto_558759 ?auto_558758 ) ( ON ?auto_558760 ?auto_558759 ) ( not ( = ?auto_558758 ?auto_558759 ) ) ( not ( = ?auto_558758 ?auto_558760 ) ) ( not ( = ?auto_558758 ?auto_558761 ) ) ( not ( = ?auto_558758 ?auto_558762 ) ) ( not ( = ?auto_558758 ?auto_558763 ) ) ( not ( = ?auto_558758 ?auto_558764 ) ) ( not ( = ?auto_558758 ?auto_558765 ) ) ( not ( = ?auto_558758 ?auto_558766 ) ) ( not ( = ?auto_558758 ?auto_558767 ) ) ( not ( = ?auto_558758 ?auto_558768 ) ) ( not ( = ?auto_558758 ?auto_558769 ) ) ( not ( = ?auto_558758 ?auto_558770 ) ) ( not ( = ?auto_558758 ?auto_558771 ) ) ( not ( = ?auto_558758 ?auto_558772 ) ) ( not ( = ?auto_558758 ?auto_558773 ) ) ( not ( = ?auto_558758 ?auto_558774 ) ) ( not ( = ?auto_558759 ?auto_558760 ) ) ( not ( = ?auto_558759 ?auto_558761 ) ) ( not ( = ?auto_558759 ?auto_558762 ) ) ( not ( = ?auto_558759 ?auto_558763 ) ) ( not ( = ?auto_558759 ?auto_558764 ) ) ( not ( = ?auto_558759 ?auto_558765 ) ) ( not ( = ?auto_558759 ?auto_558766 ) ) ( not ( = ?auto_558759 ?auto_558767 ) ) ( not ( = ?auto_558759 ?auto_558768 ) ) ( not ( = ?auto_558759 ?auto_558769 ) ) ( not ( = ?auto_558759 ?auto_558770 ) ) ( not ( = ?auto_558759 ?auto_558771 ) ) ( not ( = ?auto_558759 ?auto_558772 ) ) ( not ( = ?auto_558759 ?auto_558773 ) ) ( not ( = ?auto_558759 ?auto_558774 ) ) ( not ( = ?auto_558760 ?auto_558761 ) ) ( not ( = ?auto_558760 ?auto_558762 ) ) ( not ( = ?auto_558760 ?auto_558763 ) ) ( not ( = ?auto_558760 ?auto_558764 ) ) ( not ( = ?auto_558760 ?auto_558765 ) ) ( not ( = ?auto_558760 ?auto_558766 ) ) ( not ( = ?auto_558760 ?auto_558767 ) ) ( not ( = ?auto_558760 ?auto_558768 ) ) ( not ( = ?auto_558760 ?auto_558769 ) ) ( not ( = ?auto_558760 ?auto_558770 ) ) ( not ( = ?auto_558760 ?auto_558771 ) ) ( not ( = ?auto_558760 ?auto_558772 ) ) ( not ( = ?auto_558760 ?auto_558773 ) ) ( not ( = ?auto_558760 ?auto_558774 ) ) ( not ( = ?auto_558761 ?auto_558762 ) ) ( not ( = ?auto_558761 ?auto_558763 ) ) ( not ( = ?auto_558761 ?auto_558764 ) ) ( not ( = ?auto_558761 ?auto_558765 ) ) ( not ( = ?auto_558761 ?auto_558766 ) ) ( not ( = ?auto_558761 ?auto_558767 ) ) ( not ( = ?auto_558761 ?auto_558768 ) ) ( not ( = ?auto_558761 ?auto_558769 ) ) ( not ( = ?auto_558761 ?auto_558770 ) ) ( not ( = ?auto_558761 ?auto_558771 ) ) ( not ( = ?auto_558761 ?auto_558772 ) ) ( not ( = ?auto_558761 ?auto_558773 ) ) ( not ( = ?auto_558761 ?auto_558774 ) ) ( not ( = ?auto_558762 ?auto_558763 ) ) ( not ( = ?auto_558762 ?auto_558764 ) ) ( not ( = ?auto_558762 ?auto_558765 ) ) ( not ( = ?auto_558762 ?auto_558766 ) ) ( not ( = ?auto_558762 ?auto_558767 ) ) ( not ( = ?auto_558762 ?auto_558768 ) ) ( not ( = ?auto_558762 ?auto_558769 ) ) ( not ( = ?auto_558762 ?auto_558770 ) ) ( not ( = ?auto_558762 ?auto_558771 ) ) ( not ( = ?auto_558762 ?auto_558772 ) ) ( not ( = ?auto_558762 ?auto_558773 ) ) ( not ( = ?auto_558762 ?auto_558774 ) ) ( not ( = ?auto_558763 ?auto_558764 ) ) ( not ( = ?auto_558763 ?auto_558765 ) ) ( not ( = ?auto_558763 ?auto_558766 ) ) ( not ( = ?auto_558763 ?auto_558767 ) ) ( not ( = ?auto_558763 ?auto_558768 ) ) ( not ( = ?auto_558763 ?auto_558769 ) ) ( not ( = ?auto_558763 ?auto_558770 ) ) ( not ( = ?auto_558763 ?auto_558771 ) ) ( not ( = ?auto_558763 ?auto_558772 ) ) ( not ( = ?auto_558763 ?auto_558773 ) ) ( not ( = ?auto_558763 ?auto_558774 ) ) ( not ( = ?auto_558764 ?auto_558765 ) ) ( not ( = ?auto_558764 ?auto_558766 ) ) ( not ( = ?auto_558764 ?auto_558767 ) ) ( not ( = ?auto_558764 ?auto_558768 ) ) ( not ( = ?auto_558764 ?auto_558769 ) ) ( not ( = ?auto_558764 ?auto_558770 ) ) ( not ( = ?auto_558764 ?auto_558771 ) ) ( not ( = ?auto_558764 ?auto_558772 ) ) ( not ( = ?auto_558764 ?auto_558773 ) ) ( not ( = ?auto_558764 ?auto_558774 ) ) ( not ( = ?auto_558765 ?auto_558766 ) ) ( not ( = ?auto_558765 ?auto_558767 ) ) ( not ( = ?auto_558765 ?auto_558768 ) ) ( not ( = ?auto_558765 ?auto_558769 ) ) ( not ( = ?auto_558765 ?auto_558770 ) ) ( not ( = ?auto_558765 ?auto_558771 ) ) ( not ( = ?auto_558765 ?auto_558772 ) ) ( not ( = ?auto_558765 ?auto_558773 ) ) ( not ( = ?auto_558765 ?auto_558774 ) ) ( not ( = ?auto_558766 ?auto_558767 ) ) ( not ( = ?auto_558766 ?auto_558768 ) ) ( not ( = ?auto_558766 ?auto_558769 ) ) ( not ( = ?auto_558766 ?auto_558770 ) ) ( not ( = ?auto_558766 ?auto_558771 ) ) ( not ( = ?auto_558766 ?auto_558772 ) ) ( not ( = ?auto_558766 ?auto_558773 ) ) ( not ( = ?auto_558766 ?auto_558774 ) ) ( not ( = ?auto_558767 ?auto_558768 ) ) ( not ( = ?auto_558767 ?auto_558769 ) ) ( not ( = ?auto_558767 ?auto_558770 ) ) ( not ( = ?auto_558767 ?auto_558771 ) ) ( not ( = ?auto_558767 ?auto_558772 ) ) ( not ( = ?auto_558767 ?auto_558773 ) ) ( not ( = ?auto_558767 ?auto_558774 ) ) ( not ( = ?auto_558768 ?auto_558769 ) ) ( not ( = ?auto_558768 ?auto_558770 ) ) ( not ( = ?auto_558768 ?auto_558771 ) ) ( not ( = ?auto_558768 ?auto_558772 ) ) ( not ( = ?auto_558768 ?auto_558773 ) ) ( not ( = ?auto_558768 ?auto_558774 ) ) ( not ( = ?auto_558769 ?auto_558770 ) ) ( not ( = ?auto_558769 ?auto_558771 ) ) ( not ( = ?auto_558769 ?auto_558772 ) ) ( not ( = ?auto_558769 ?auto_558773 ) ) ( not ( = ?auto_558769 ?auto_558774 ) ) ( not ( = ?auto_558770 ?auto_558771 ) ) ( not ( = ?auto_558770 ?auto_558772 ) ) ( not ( = ?auto_558770 ?auto_558773 ) ) ( not ( = ?auto_558770 ?auto_558774 ) ) ( not ( = ?auto_558771 ?auto_558772 ) ) ( not ( = ?auto_558771 ?auto_558773 ) ) ( not ( = ?auto_558771 ?auto_558774 ) ) ( not ( = ?auto_558772 ?auto_558773 ) ) ( not ( = ?auto_558772 ?auto_558774 ) ) ( not ( = ?auto_558773 ?auto_558774 ) ) ( ON ?auto_558772 ?auto_558773 ) ( ON ?auto_558771 ?auto_558772 ) ( ON ?auto_558770 ?auto_558771 ) ( ON ?auto_558769 ?auto_558770 ) ( ON ?auto_558768 ?auto_558769 ) ( ON ?auto_558767 ?auto_558768 ) ( ON ?auto_558766 ?auto_558767 ) ( ON ?auto_558765 ?auto_558766 ) ( ON ?auto_558764 ?auto_558765 ) ( ON ?auto_558763 ?auto_558764 ) ( ON ?auto_558762 ?auto_558763 ) ( CLEAR ?auto_558760 ) ( ON ?auto_558761 ?auto_558762 ) ( CLEAR ?auto_558761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_558758 ?auto_558759 ?auto_558760 ?auto_558761 )
      ( MAKE-16PILE ?auto_558758 ?auto_558759 ?auto_558760 ?auto_558761 ?auto_558762 ?auto_558763 ?auto_558764 ?auto_558765 ?auto_558766 ?auto_558767 ?auto_558768 ?auto_558769 ?auto_558770 ?auto_558771 ?auto_558772 ?auto_558773 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558791 - BLOCK
      ?auto_558792 - BLOCK
      ?auto_558793 - BLOCK
      ?auto_558794 - BLOCK
      ?auto_558795 - BLOCK
      ?auto_558796 - BLOCK
      ?auto_558797 - BLOCK
      ?auto_558798 - BLOCK
      ?auto_558799 - BLOCK
      ?auto_558800 - BLOCK
      ?auto_558801 - BLOCK
      ?auto_558802 - BLOCK
      ?auto_558803 - BLOCK
      ?auto_558804 - BLOCK
      ?auto_558805 - BLOCK
      ?auto_558806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558806 ) ( ON-TABLE ?auto_558791 ) ( ON ?auto_558792 ?auto_558791 ) ( ON ?auto_558793 ?auto_558792 ) ( not ( = ?auto_558791 ?auto_558792 ) ) ( not ( = ?auto_558791 ?auto_558793 ) ) ( not ( = ?auto_558791 ?auto_558794 ) ) ( not ( = ?auto_558791 ?auto_558795 ) ) ( not ( = ?auto_558791 ?auto_558796 ) ) ( not ( = ?auto_558791 ?auto_558797 ) ) ( not ( = ?auto_558791 ?auto_558798 ) ) ( not ( = ?auto_558791 ?auto_558799 ) ) ( not ( = ?auto_558791 ?auto_558800 ) ) ( not ( = ?auto_558791 ?auto_558801 ) ) ( not ( = ?auto_558791 ?auto_558802 ) ) ( not ( = ?auto_558791 ?auto_558803 ) ) ( not ( = ?auto_558791 ?auto_558804 ) ) ( not ( = ?auto_558791 ?auto_558805 ) ) ( not ( = ?auto_558791 ?auto_558806 ) ) ( not ( = ?auto_558792 ?auto_558793 ) ) ( not ( = ?auto_558792 ?auto_558794 ) ) ( not ( = ?auto_558792 ?auto_558795 ) ) ( not ( = ?auto_558792 ?auto_558796 ) ) ( not ( = ?auto_558792 ?auto_558797 ) ) ( not ( = ?auto_558792 ?auto_558798 ) ) ( not ( = ?auto_558792 ?auto_558799 ) ) ( not ( = ?auto_558792 ?auto_558800 ) ) ( not ( = ?auto_558792 ?auto_558801 ) ) ( not ( = ?auto_558792 ?auto_558802 ) ) ( not ( = ?auto_558792 ?auto_558803 ) ) ( not ( = ?auto_558792 ?auto_558804 ) ) ( not ( = ?auto_558792 ?auto_558805 ) ) ( not ( = ?auto_558792 ?auto_558806 ) ) ( not ( = ?auto_558793 ?auto_558794 ) ) ( not ( = ?auto_558793 ?auto_558795 ) ) ( not ( = ?auto_558793 ?auto_558796 ) ) ( not ( = ?auto_558793 ?auto_558797 ) ) ( not ( = ?auto_558793 ?auto_558798 ) ) ( not ( = ?auto_558793 ?auto_558799 ) ) ( not ( = ?auto_558793 ?auto_558800 ) ) ( not ( = ?auto_558793 ?auto_558801 ) ) ( not ( = ?auto_558793 ?auto_558802 ) ) ( not ( = ?auto_558793 ?auto_558803 ) ) ( not ( = ?auto_558793 ?auto_558804 ) ) ( not ( = ?auto_558793 ?auto_558805 ) ) ( not ( = ?auto_558793 ?auto_558806 ) ) ( not ( = ?auto_558794 ?auto_558795 ) ) ( not ( = ?auto_558794 ?auto_558796 ) ) ( not ( = ?auto_558794 ?auto_558797 ) ) ( not ( = ?auto_558794 ?auto_558798 ) ) ( not ( = ?auto_558794 ?auto_558799 ) ) ( not ( = ?auto_558794 ?auto_558800 ) ) ( not ( = ?auto_558794 ?auto_558801 ) ) ( not ( = ?auto_558794 ?auto_558802 ) ) ( not ( = ?auto_558794 ?auto_558803 ) ) ( not ( = ?auto_558794 ?auto_558804 ) ) ( not ( = ?auto_558794 ?auto_558805 ) ) ( not ( = ?auto_558794 ?auto_558806 ) ) ( not ( = ?auto_558795 ?auto_558796 ) ) ( not ( = ?auto_558795 ?auto_558797 ) ) ( not ( = ?auto_558795 ?auto_558798 ) ) ( not ( = ?auto_558795 ?auto_558799 ) ) ( not ( = ?auto_558795 ?auto_558800 ) ) ( not ( = ?auto_558795 ?auto_558801 ) ) ( not ( = ?auto_558795 ?auto_558802 ) ) ( not ( = ?auto_558795 ?auto_558803 ) ) ( not ( = ?auto_558795 ?auto_558804 ) ) ( not ( = ?auto_558795 ?auto_558805 ) ) ( not ( = ?auto_558795 ?auto_558806 ) ) ( not ( = ?auto_558796 ?auto_558797 ) ) ( not ( = ?auto_558796 ?auto_558798 ) ) ( not ( = ?auto_558796 ?auto_558799 ) ) ( not ( = ?auto_558796 ?auto_558800 ) ) ( not ( = ?auto_558796 ?auto_558801 ) ) ( not ( = ?auto_558796 ?auto_558802 ) ) ( not ( = ?auto_558796 ?auto_558803 ) ) ( not ( = ?auto_558796 ?auto_558804 ) ) ( not ( = ?auto_558796 ?auto_558805 ) ) ( not ( = ?auto_558796 ?auto_558806 ) ) ( not ( = ?auto_558797 ?auto_558798 ) ) ( not ( = ?auto_558797 ?auto_558799 ) ) ( not ( = ?auto_558797 ?auto_558800 ) ) ( not ( = ?auto_558797 ?auto_558801 ) ) ( not ( = ?auto_558797 ?auto_558802 ) ) ( not ( = ?auto_558797 ?auto_558803 ) ) ( not ( = ?auto_558797 ?auto_558804 ) ) ( not ( = ?auto_558797 ?auto_558805 ) ) ( not ( = ?auto_558797 ?auto_558806 ) ) ( not ( = ?auto_558798 ?auto_558799 ) ) ( not ( = ?auto_558798 ?auto_558800 ) ) ( not ( = ?auto_558798 ?auto_558801 ) ) ( not ( = ?auto_558798 ?auto_558802 ) ) ( not ( = ?auto_558798 ?auto_558803 ) ) ( not ( = ?auto_558798 ?auto_558804 ) ) ( not ( = ?auto_558798 ?auto_558805 ) ) ( not ( = ?auto_558798 ?auto_558806 ) ) ( not ( = ?auto_558799 ?auto_558800 ) ) ( not ( = ?auto_558799 ?auto_558801 ) ) ( not ( = ?auto_558799 ?auto_558802 ) ) ( not ( = ?auto_558799 ?auto_558803 ) ) ( not ( = ?auto_558799 ?auto_558804 ) ) ( not ( = ?auto_558799 ?auto_558805 ) ) ( not ( = ?auto_558799 ?auto_558806 ) ) ( not ( = ?auto_558800 ?auto_558801 ) ) ( not ( = ?auto_558800 ?auto_558802 ) ) ( not ( = ?auto_558800 ?auto_558803 ) ) ( not ( = ?auto_558800 ?auto_558804 ) ) ( not ( = ?auto_558800 ?auto_558805 ) ) ( not ( = ?auto_558800 ?auto_558806 ) ) ( not ( = ?auto_558801 ?auto_558802 ) ) ( not ( = ?auto_558801 ?auto_558803 ) ) ( not ( = ?auto_558801 ?auto_558804 ) ) ( not ( = ?auto_558801 ?auto_558805 ) ) ( not ( = ?auto_558801 ?auto_558806 ) ) ( not ( = ?auto_558802 ?auto_558803 ) ) ( not ( = ?auto_558802 ?auto_558804 ) ) ( not ( = ?auto_558802 ?auto_558805 ) ) ( not ( = ?auto_558802 ?auto_558806 ) ) ( not ( = ?auto_558803 ?auto_558804 ) ) ( not ( = ?auto_558803 ?auto_558805 ) ) ( not ( = ?auto_558803 ?auto_558806 ) ) ( not ( = ?auto_558804 ?auto_558805 ) ) ( not ( = ?auto_558804 ?auto_558806 ) ) ( not ( = ?auto_558805 ?auto_558806 ) ) ( ON ?auto_558805 ?auto_558806 ) ( ON ?auto_558804 ?auto_558805 ) ( ON ?auto_558803 ?auto_558804 ) ( ON ?auto_558802 ?auto_558803 ) ( ON ?auto_558801 ?auto_558802 ) ( ON ?auto_558800 ?auto_558801 ) ( ON ?auto_558799 ?auto_558800 ) ( ON ?auto_558798 ?auto_558799 ) ( ON ?auto_558797 ?auto_558798 ) ( ON ?auto_558796 ?auto_558797 ) ( ON ?auto_558795 ?auto_558796 ) ( CLEAR ?auto_558793 ) ( ON ?auto_558794 ?auto_558795 ) ( CLEAR ?auto_558794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_558791 ?auto_558792 ?auto_558793 ?auto_558794 )
      ( MAKE-16PILE ?auto_558791 ?auto_558792 ?auto_558793 ?auto_558794 ?auto_558795 ?auto_558796 ?auto_558797 ?auto_558798 ?auto_558799 ?auto_558800 ?auto_558801 ?auto_558802 ?auto_558803 ?auto_558804 ?auto_558805 ?auto_558806 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558823 - BLOCK
      ?auto_558824 - BLOCK
      ?auto_558825 - BLOCK
      ?auto_558826 - BLOCK
      ?auto_558827 - BLOCK
      ?auto_558828 - BLOCK
      ?auto_558829 - BLOCK
      ?auto_558830 - BLOCK
      ?auto_558831 - BLOCK
      ?auto_558832 - BLOCK
      ?auto_558833 - BLOCK
      ?auto_558834 - BLOCK
      ?auto_558835 - BLOCK
      ?auto_558836 - BLOCK
      ?auto_558837 - BLOCK
      ?auto_558838 - BLOCK
    )
    :vars
    (
      ?auto_558839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558838 ?auto_558839 ) ( ON-TABLE ?auto_558823 ) ( ON ?auto_558824 ?auto_558823 ) ( not ( = ?auto_558823 ?auto_558824 ) ) ( not ( = ?auto_558823 ?auto_558825 ) ) ( not ( = ?auto_558823 ?auto_558826 ) ) ( not ( = ?auto_558823 ?auto_558827 ) ) ( not ( = ?auto_558823 ?auto_558828 ) ) ( not ( = ?auto_558823 ?auto_558829 ) ) ( not ( = ?auto_558823 ?auto_558830 ) ) ( not ( = ?auto_558823 ?auto_558831 ) ) ( not ( = ?auto_558823 ?auto_558832 ) ) ( not ( = ?auto_558823 ?auto_558833 ) ) ( not ( = ?auto_558823 ?auto_558834 ) ) ( not ( = ?auto_558823 ?auto_558835 ) ) ( not ( = ?auto_558823 ?auto_558836 ) ) ( not ( = ?auto_558823 ?auto_558837 ) ) ( not ( = ?auto_558823 ?auto_558838 ) ) ( not ( = ?auto_558823 ?auto_558839 ) ) ( not ( = ?auto_558824 ?auto_558825 ) ) ( not ( = ?auto_558824 ?auto_558826 ) ) ( not ( = ?auto_558824 ?auto_558827 ) ) ( not ( = ?auto_558824 ?auto_558828 ) ) ( not ( = ?auto_558824 ?auto_558829 ) ) ( not ( = ?auto_558824 ?auto_558830 ) ) ( not ( = ?auto_558824 ?auto_558831 ) ) ( not ( = ?auto_558824 ?auto_558832 ) ) ( not ( = ?auto_558824 ?auto_558833 ) ) ( not ( = ?auto_558824 ?auto_558834 ) ) ( not ( = ?auto_558824 ?auto_558835 ) ) ( not ( = ?auto_558824 ?auto_558836 ) ) ( not ( = ?auto_558824 ?auto_558837 ) ) ( not ( = ?auto_558824 ?auto_558838 ) ) ( not ( = ?auto_558824 ?auto_558839 ) ) ( not ( = ?auto_558825 ?auto_558826 ) ) ( not ( = ?auto_558825 ?auto_558827 ) ) ( not ( = ?auto_558825 ?auto_558828 ) ) ( not ( = ?auto_558825 ?auto_558829 ) ) ( not ( = ?auto_558825 ?auto_558830 ) ) ( not ( = ?auto_558825 ?auto_558831 ) ) ( not ( = ?auto_558825 ?auto_558832 ) ) ( not ( = ?auto_558825 ?auto_558833 ) ) ( not ( = ?auto_558825 ?auto_558834 ) ) ( not ( = ?auto_558825 ?auto_558835 ) ) ( not ( = ?auto_558825 ?auto_558836 ) ) ( not ( = ?auto_558825 ?auto_558837 ) ) ( not ( = ?auto_558825 ?auto_558838 ) ) ( not ( = ?auto_558825 ?auto_558839 ) ) ( not ( = ?auto_558826 ?auto_558827 ) ) ( not ( = ?auto_558826 ?auto_558828 ) ) ( not ( = ?auto_558826 ?auto_558829 ) ) ( not ( = ?auto_558826 ?auto_558830 ) ) ( not ( = ?auto_558826 ?auto_558831 ) ) ( not ( = ?auto_558826 ?auto_558832 ) ) ( not ( = ?auto_558826 ?auto_558833 ) ) ( not ( = ?auto_558826 ?auto_558834 ) ) ( not ( = ?auto_558826 ?auto_558835 ) ) ( not ( = ?auto_558826 ?auto_558836 ) ) ( not ( = ?auto_558826 ?auto_558837 ) ) ( not ( = ?auto_558826 ?auto_558838 ) ) ( not ( = ?auto_558826 ?auto_558839 ) ) ( not ( = ?auto_558827 ?auto_558828 ) ) ( not ( = ?auto_558827 ?auto_558829 ) ) ( not ( = ?auto_558827 ?auto_558830 ) ) ( not ( = ?auto_558827 ?auto_558831 ) ) ( not ( = ?auto_558827 ?auto_558832 ) ) ( not ( = ?auto_558827 ?auto_558833 ) ) ( not ( = ?auto_558827 ?auto_558834 ) ) ( not ( = ?auto_558827 ?auto_558835 ) ) ( not ( = ?auto_558827 ?auto_558836 ) ) ( not ( = ?auto_558827 ?auto_558837 ) ) ( not ( = ?auto_558827 ?auto_558838 ) ) ( not ( = ?auto_558827 ?auto_558839 ) ) ( not ( = ?auto_558828 ?auto_558829 ) ) ( not ( = ?auto_558828 ?auto_558830 ) ) ( not ( = ?auto_558828 ?auto_558831 ) ) ( not ( = ?auto_558828 ?auto_558832 ) ) ( not ( = ?auto_558828 ?auto_558833 ) ) ( not ( = ?auto_558828 ?auto_558834 ) ) ( not ( = ?auto_558828 ?auto_558835 ) ) ( not ( = ?auto_558828 ?auto_558836 ) ) ( not ( = ?auto_558828 ?auto_558837 ) ) ( not ( = ?auto_558828 ?auto_558838 ) ) ( not ( = ?auto_558828 ?auto_558839 ) ) ( not ( = ?auto_558829 ?auto_558830 ) ) ( not ( = ?auto_558829 ?auto_558831 ) ) ( not ( = ?auto_558829 ?auto_558832 ) ) ( not ( = ?auto_558829 ?auto_558833 ) ) ( not ( = ?auto_558829 ?auto_558834 ) ) ( not ( = ?auto_558829 ?auto_558835 ) ) ( not ( = ?auto_558829 ?auto_558836 ) ) ( not ( = ?auto_558829 ?auto_558837 ) ) ( not ( = ?auto_558829 ?auto_558838 ) ) ( not ( = ?auto_558829 ?auto_558839 ) ) ( not ( = ?auto_558830 ?auto_558831 ) ) ( not ( = ?auto_558830 ?auto_558832 ) ) ( not ( = ?auto_558830 ?auto_558833 ) ) ( not ( = ?auto_558830 ?auto_558834 ) ) ( not ( = ?auto_558830 ?auto_558835 ) ) ( not ( = ?auto_558830 ?auto_558836 ) ) ( not ( = ?auto_558830 ?auto_558837 ) ) ( not ( = ?auto_558830 ?auto_558838 ) ) ( not ( = ?auto_558830 ?auto_558839 ) ) ( not ( = ?auto_558831 ?auto_558832 ) ) ( not ( = ?auto_558831 ?auto_558833 ) ) ( not ( = ?auto_558831 ?auto_558834 ) ) ( not ( = ?auto_558831 ?auto_558835 ) ) ( not ( = ?auto_558831 ?auto_558836 ) ) ( not ( = ?auto_558831 ?auto_558837 ) ) ( not ( = ?auto_558831 ?auto_558838 ) ) ( not ( = ?auto_558831 ?auto_558839 ) ) ( not ( = ?auto_558832 ?auto_558833 ) ) ( not ( = ?auto_558832 ?auto_558834 ) ) ( not ( = ?auto_558832 ?auto_558835 ) ) ( not ( = ?auto_558832 ?auto_558836 ) ) ( not ( = ?auto_558832 ?auto_558837 ) ) ( not ( = ?auto_558832 ?auto_558838 ) ) ( not ( = ?auto_558832 ?auto_558839 ) ) ( not ( = ?auto_558833 ?auto_558834 ) ) ( not ( = ?auto_558833 ?auto_558835 ) ) ( not ( = ?auto_558833 ?auto_558836 ) ) ( not ( = ?auto_558833 ?auto_558837 ) ) ( not ( = ?auto_558833 ?auto_558838 ) ) ( not ( = ?auto_558833 ?auto_558839 ) ) ( not ( = ?auto_558834 ?auto_558835 ) ) ( not ( = ?auto_558834 ?auto_558836 ) ) ( not ( = ?auto_558834 ?auto_558837 ) ) ( not ( = ?auto_558834 ?auto_558838 ) ) ( not ( = ?auto_558834 ?auto_558839 ) ) ( not ( = ?auto_558835 ?auto_558836 ) ) ( not ( = ?auto_558835 ?auto_558837 ) ) ( not ( = ?auto_558835 ?auto_558838 ) ) ( not ( = ?auto_558835 ?auto_558839 ) ) ( not ( = ?auto_558836 ?auto_558837 ) ) ( not ( = ?auto_558836 ?auto_558838 ) ) ( not ( = ?auto_558836 ?auto_558839 ) ) ( not ( = ?auto_558837 ?auto_558838 ) ) ( not ( = ?auto_558837 ?auto_558839 ) ) ( not ( = ?auto_558838 ?auto_558839 ) ) ( ON ?auto_558837 ?auto_558838 ) ( ON ?auto_558836 ?auto_558837 ) ( ON ?auto_558835 ?auto_558836 ) ( ON ?auto_558834 ?auto_558835 ) ( ON ?auto_558833 ?auto_558834 ) ( ON ?auto_558832 ?auto_558833 ) ( ON ?auto_558831 ?auto_558832 ) ( ON ?auto_558830 ?auto_558831 ) ( ON ?auto_558829 ?auto_558830 ) ( ON ?auto_558828 ?auto_558829 ) ( ON ?auto_558827 ?auto_558828 ) ( ON ?auto_558826 ?auto_558827 ) ( CLEAR ?auto_558824 ) ( ON ?auto_558825 ?auto_558826 ) ( CLEAR ?auto_558825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_558823 ?auto_558824 ?auto_558825 )
      ( MAKE-16PILE ?auto_558823 ?auto_558824 ?auto_558825 ?auto_558826 ?auto_558827 ?auto_558828 ?auto_558829 ?auto_558830 ?auto_558831 ?auto_558832 ?auto_558833 ?auto_558834 ?auto_558835 ?auto_558836 ?auto_558837 ?auto_558838 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558856 - BLOCK
      ?auto_558857 - BLOCK
      ?auto_558858 - BLOCK
      ?auto_558859 - BLOCK
      ?auto_558860 - BLOCK
      ?auto_558861 - BLOCK
      ?auto_558862 - BLOCK
      ?auto_558863 - BLOCK
      ?auto_558864 - BLOCK
      ?auto_558865 - BLOCK
      ?auto_558866 - BLOCK
      ?auto_558867 - BLOCK
      ?auto_558868 - BLOCK
      ?auto_558869 - BLOCK
      ?auto_558870 - BLOCK
      ?auto_558871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558871 ) ( ON-TABLE ?auto_558856 ) ( ON ?auto_558857 ?auto_558856 ) ( not ( = ?auto_558856 ?auto_558857 ) ) ( not ( = ?auto_558856 ?auto_558858 ) ) ( not ( = ?auto_558856 ?auto_558859 ) ) ( not ( = ?auto_558856 ?auto_558860 ) ) ( not ( = ?auto_558856 ?auto_558861 ) ) ( not ( = ?auto_558856 ?auto_558862 ) ) ( not ( = ?auto_558856 ?auto_558863 ) ) ( not ( = ?auto_558856 ?auto_558864 ) ) ( not ( = ?auto_558856 ?auto_558865 ) ) ( not ( = ?auto_558856 ?auto_558866 ) ) ( not ( = ?auto_558856 ?auto_558867 ) ) ( not ( = ?auto_558856 ?auto_558868 ) ) ( not ( = ?auto_558856 ?auto_558869 ) ) ( not ( = ?auto_558856 ?auto_558870 ) ) ( not ( = ?auto_558856 ?auto_558871 ) ) ( not ( = ?auto_558857 ?auto_558858 ) ) ( not ( = ?auto_558857 ?auto_558859 ) ) ( not ( = ?auto_558857 ?auto_558860 ) ) ( not ( = ?auto_558857 ?auto_558861 ) ) ( not ( = ?auto_558857 ?auto_558862 ) ) ( not ( = ?auto_558857 ?auto_558863 ) ) ( not ( = ?auto_558857 ?auto_558864 ) ) ( not ( = ?auto_558857 ?auto_558865 ) ) ( not ( = ?auto_558857 ?auto_558866 ) ) ( not ( = ?auto_558857 ?auto_558867 ) ) ( not ( = ?auto_558857 ?auto_558868 ) ) ( not ( = ?auto_558857 ?auto_558869 ) ) ( not ( = ?auto_558857 ?auto_558870 ) ) ( not ( = ?auto_558857 ?auto_558871 ) ) ( not ( = ?auto_558858 ?auto_558859 ) ) ( not ( = ?auto_558858 ?auto_558860 ) ) ( not ( = ?auto_558858 ?auto_558861 ) ) ( not ( = ?auto_558858 ?auto_558862 ) ) ( not ( = ?auto_558858 ?auto_558863 ) ) ( not ( = ?auto_558858 ?auto_558864 ) ) ( not ( = ?auto_558858 ?auto_558865 ) ) ( not ( = ?auto_558858 ?auto_558866 ) ) ( not ( = ?auto_558858 ?auto_558867 ) ) ( not ( = ?auto_558858 ?auto_558868 ) ) ( not ( = ?auto_558858 ?auto_558869 ) ) ( not ( = ?auto_558858 ?auto_558870 ) ) ( not ( = ?auto_558858 ?auto_558871 ) ) ( not ( = ?auto_558859 ?auto_558860 ) ) ( not ( = ?auto_558859 ?auto_558861 ) ) ( not ( = ?auto_558859 ?auto_558862 ) ) ( not ( = ?auto_558859 ?auto_558863 ) ) ( not ( = ?auto_558859 ?auto_558864 ) ) ( not ( = ?auto_558859 ?auto_558865 ) ) ( not ( = ?auto_558859 ?auto_558866 ) ) ( not ( = ?auto_558859 ?auto_558867 ) ) ( not ( = ?auto_558859 ?auto_558868 ) ) ( not ( = ?auto_558859 ?auto_558869 ) ) ( not ( = ?auto_558859 ?auto_558870 ) ) ( not ( = ?auto_558859 ?auto_558871 ) ) ( not ( = ?auto_558860 ?auto_558861 ) ) ( not ( = ?auto_558860 ?auto_558862 ) ) ( not ( = ?auto_558860 ?auto_558863 ) ) ( not ( = ?auto_558860 ?auto_558864 ) ) ( not ( = ?auto_558860 ?auto_558865 ) ) ( not ( = ?auto_558860 ?auto_558866 ) ) ( not ( = ?auto_558860 ?auto_558867 ) ) ( not ( = ?auto_558860 ?auto_558868 ) ) ( not ( = ?auto_558860 ?auto_558869 ) ) ( not ( = ?auto_558860 ?auto_558870 ) ) ( not ( = ?auto_558860 ?auto_558871 ) ) ( not ( = ?auto_558861 ?auto_558862 ) ) ( not ( = ?auto_558861 ?auto_558863 ) ) ( not ( = ?auto_558861 ?auto_558864 ) ) ( not ( = ?auto_558861 ?auto_558865 ) ) ( not ( = ?auto_558861 ?auto_558866 ) ) ( not ( = ?auto_558861 ?auto_558867 ) ) ( not ( = ?auto_558861 ?auto_558868 ) ) ( not ( = ?auto_558861 ?auto_558869 ) ) ( not ( = ?auto_558861 ?auto_558870 ) ) ( not ( = ?auto_558861 ?auto_558871 ) ) ( not ( = ?auto_558862 ?auto_558863 ) ) ( not ( = ?auto_558862 ?auto_558864 ) ) ( not ( = ?auto_558862 ?auto_558865 ) ) ( not ( = ?auto_558862 ?auto_558866 ) ) ( not ( = ?auto_558862 ?auto_558867 ) ) ( not ( = ?auto_558862 ?auto_558868 ) ) ( not ( = ?auto_558862 ?auto_558869 ) ) ( not ( = ?auto_558862 ?auto_558870 ) ) ( not ( = ?auto_558862 ?auto_558871 ) ) ( not ( = ?auto_558863 ?auto_558864 ) ) ( not ( = ?auto_558863 ?auto_558865 ) ) ( not ( = ?auto_558863 ?auto_558866 ) ) ( not ( = ?auto_558863 ?auto_558867 ) ) ( not ( = ?auto_558863 ?auto_558868 ) ) ( not ( = ?auto_558863 ?auto_558869 ) ) ( not ( = ?auto_558863 ?auto_558870 ) ) ( not ( = ?auto_558863 ?auto_558871 ) ) ( not ( = ?auto_558864 ?auto_558865 ) ) ( not ( = ?auto_558864 ?auto_558866 ) ) ( not ( = ?auto_558864 ?auto_558867 ) ) ( not ( = ?auto_558864 ?auto_558868 ) ) ( not ( = ?auto_558864 ?auto_558869 ) ) ( not ( = ?auto_558864 ?auto_558870 ) ) ( not ( = ?auto_558864 ?auto_558871 ) ) ( not ( = ?auto_558865 ?auto_558866 ) ) ( not ( = ?auto_558865 ?auto_558867 ) ) ( not ( = ?auto_558865 ?auto_558868 ) ) ( not ( = ?auto_558865 ?auto_558869 ) ) ( not ( = ?auto_558865 ?auto_558870 ) ) ( not ( = ?auto_558865 ?auto_558871 ) ) ( not ( = ?auto_558866 ?auto_558867 ) ) ( not ( = ?auto_558866 ?auto_558868 ) ) ( not ( = ?auto_558866 ?auto_558869 ) ) ( not ( = ?auto_558866 ?auto_558870 ) ) ( not ( = ?auto_558866 ?auto_558871 ) ) ( not ( = ?auto_558867 ?auto_558868 ) ) ( not ( = ?auto_558867 ?auto_558869 ) ) ( not ( = ?auto_558867 ?auto_558870 ) ) ( not ( = ?auto_558867 ?auto_558871 ) ) ( not ( = ?auto_558868 ?auto_558869 ) ) ( not ( = ?auto_558868 ?auto_558870 ) ) ( not ( = ?auto_558868 ?auto_558871 ) ) ( not ( = ?auto_558869 ?auto_558870 ) ) ( not ( = ?auto_558869 ?auto_558871 ) ) ( not ( = ?auto_558870 ?auto_558871 ) ) ( ON ?auto_558870 ?auto_558871 ) ( ON ?auto_558869 ?auto_558870 ) ( ON ?auto_558868 ?auto_558869 ) ( ON ?auto_558867 ?auto_558868 ) ( ON ?auto_558866 ?auto_558867 ) ( ON ?auto_558865 ?auto_558866 ) ( ON ?auto_558864 ?auto_558865 ) ( ON ?auto_558863 ?auto_558864 ) ( ON ?auto_558862 ?auto_558863 ) ( ON ?auto_558861 ?auto_558862 ) ( ON ?auto_558860 ?auto_558861 ) ( ON ?auto_558859 ?auto_558860 ) ( CLEAR ?auto_558857 ) ( ON ?auto_558858 ?auto_558859 ) ( CLEAR ?auto_558858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_558856 ?auto_558857 ?auto_558858 )
      ( MAKE-16PILE ?auto_558856 ?auto_558857 ?auto_558858 ?auto_558859 ?auto_558860 ?auto_558861 ?auto_558862 ?auto_558863 ?auto_558864 ?auto_558865 ?auto_558866 ?auto_558867 ?auto_558868 ?auto_558869 ?auto_558870 ?auto_558871 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558888 - BLOCK
      ?auto_558889 - BLOCK
      ?auto_558890 - BLOCK
      ?auto_558891 - BLOCK
      ?auto_558892 - BLOCK
      ?auto_558893 - BLOCK
      ?auto_558894 - BLOCK
      ?auto_558895 - BLOCK
      ?auto_558896 - BLOCK
      ?auto_558897 - BLOCK
      ?auto_558898 - BLOCK
      ?auto_558899 - BLOCK
      ?auto_558900 - BLOCK
      ?auto_558901 - BLOCK
      ?auto_558902 - BLOCK
      ?auto_558903 - BLOCK
    )
    :vars
    (
      ?auto_558904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558903 ?auto_558904 ) ( ON-TABLE ?auto_558888 ) ( not ( = ?auto_558888 ?auto_558889 ) ) ( not ( = ?auto_558888 ?auto_558890 ) ) ( not ( = ?auto_558888 ?auto_558891 ) ) ( not ( = ?auto_558888 ?auto_558892 ) ) ( not ( = ?auto_558888 ?auto_558893 ) ) ( not ( = ?auto_558888 ?auto_558894 ) ) ( not ( = ?auto_558888 ?auto_558895 ) ) ( not ( = ?auto_558888 ?auto_558896 ) ) ( not ( = ?auto_558888 ?auto_558897 ) ) ( not ( = ?auto_558888 ?auto_558898 ) ) ( not ( = ?auto_558888 ?auto_558899 ) ) ( not ( = ?auto_558888 ?auto_558900 ) ) ( not ( = ?auto_558888 ?auto_558901 ) ) ( not ( = ?auto_558888 ?auto_558902 ) ) ( not ( = ?auto_558888 ?auto_558903 ) ) ( not ( = ?auto_558888 ?auto_558904 ) ) ( not ( = ?auto_558889 ?auto_558890 ) ) ( not ( = ?auto_558889 ?auto_558891 ) ) ( not ( = ?auto_558889 ?auto_558892 ) ) ( not ( = ?auto_558889 ?auto_558893 ) ) ( not ( = ?auto_558889 ?auto_558894 ) ) ( not ( = ?auto_558889 ?auto_558895 ) ) ( not ( = ?auto_558889 ?auto_558896 ) ) ( not ( = ?auto_558889 ?auto_558897 ) ) ( not ( = ?auto_558889 ?auto_558898 ) ) ( not ( = ?auto_558889 ?auto_558899 ) ) ( not ( = ?auto_558889 ?auto_558900 ) ) ( not ( = ?auto_558889 ?auto_558901 ) ) ( not ( = ?auto_558889 ?auto_558902 ) ) ( not ( = ?auto_558889 ?auto_558903 ) ) ( not ( = ?auto_558889 ?auto_558904 ) ) ( not ( = ?auto_558890 ?auto_558891 ) ) ( not ( = ?auto_558890 ?auto_558892 ) ) ( not ( = ?auto_558890 ?auto_558893 ) ) ( not ( = ?auto_558890 ?auto_558894 ) ) ( not ( = ?auto_558890 ?auto_558895 ) ) ( not ( = ?auto_558890 ?auto_558896 ) ) ( not ( = ?auto_558890 ?auto_558897 ) ) ( not ( = ?auto_558890 ?auto_558898 ) ) ( not ( = ?auto_558890 ?auto_558899 ) ) ( not ( = ?auto_558890 ?auto_558900 ) ) ( not ( = ?auto_558890 ?auto_558901 ) ) ( not ( = ?auto_558890 ?auto_558902 ) ) ( not ( = ?auto_558890 ?auto_558903 ) ) ( not ( = ?auto_558890 ?auto_558904 ) ) ( not ( = ?auto_558891 ?auto_558892 ) ) ( not ( = ?auto_558891 ?auto_558893 ) ) ( not ( = ?auto_558891 ?auto_558894 ) ) ( not ( = ?auto_558891 ?auto_558895 ) ) ( not ( = ?auto_558891 ?auto_558896 ) ) ( not ( = ?auto_558891 ?auto_558897 ) ) ( not ( = ?auto_558891 ?auto_558898 ) ) ( not ( = ?auto_558891 ?auto_558899 ) ) ( not ( = ?auto_558891 ?auto_558900 ) ) ( not ( = ?auto_558891 ?auto_558901 ) ) ( not ( = ?auto_558891 ?auto_558902 ) ) ( not ( = ?auto_558891 ?auto_558903 ) ) ( not ( = ?auto_558891 ?auto_558904 ) ) ( not ( = ?auto_558892 ?auto_558893 ) ) ( not ( = ?auto_558892 ?auto_558894 ) ) ( not ( = ?auto_558892 ?auto_558895 ) ) ( not ( = ?auto_558892 ?auto_558896 ) ) ( not ( = ?auto_558892 ?auto_558897 ) ) ( not ( = ?auto_558892 ?auto_558898 ) ) ( not ( = ?auto_558892 ?auto_558899 ) ) ( not ( = ?auto_558892 ?auto_558900 ) ) ( not ( = ?auto_558892 ?auto_558901 ) ) ( not ( = ?auto_558892 ?auto_558902 ) ) ( not ( = ?auto_558892 ?auto_558903 ) ) ( not ( = ?auto_558892 ?auto_558904 ) ) ( not ( = ?auto_558893 ?auto_558894 ) ) ( not ( = ?auto_558893 ?auto_558895 ) ) ( not ( = ?auto_558893 ?auto_558896 ) ) ( not ( = ?auto_558893 ?auto_558897 ) ) ( not ( = ?auto_558893 ?auto_558898 ) ) ( not ( = ?auto_558893 ?auto_558899 ) ) ( not ( = ?auto_558893 ?auto_558900 ) ) ( not ( = ?auto_558893 ?auto_558901 ) ) ( not ( = ?auto_558893 ?auto_558902 ) ) ( not ( = ?auto_558893 ?auto_558903 ) ) ( not ( = ?auto_558893 ?auto_558904 ) ) ( not ( = ?auto_558894 ?auto_558895 ) ) ( not ( = ?auto_558894 ?auto_558896 ) ) ( not ( = ?auto_558894 ?auto_558897 ) ) ( not ( = ?auto_558894 ?auto_558898 ) ) ( not ( = ?auto_558894 ?auto_558899 ) ) ( not ( = ?auto_558894 ?auto_558900 ) ) ( not ( = ?auto_558894 ?auto_558901 ) ) ( not ( = ?auto_558894 ?auto_558902 ) ) ( not ( = ?auto_558894 ?auto_558903 ) ) ( not ( = ?auto_558894 ?auto_558904 ) ) ( not ( = ?auto_558895 ?auto_558896 ) ) ( not ( = ?auto_558895 ?auto_558897 ) ) ( not ( = ?auto_558895 ?auto_558898 ) ) ( not ( = ?auto_558895 ?auto_558899 ) ) ( not ( = ?auto_558895 ?auto_558900 ) ) ( not ( = ?auto_558895 ?auto_558901 ) ) ( not ( = ?auto_558895 ?auto_558902 ) ) ( not ( = ?auto_558895 ?auto_558903 ) ) ( not ( = ?auto_558895 ?auto_558904 ) ) ( not ( = ?auto_558896 ?auto_558897 ) ) ( not ( = ?auto_558896 ?auto_558898 ) ) ( not ( = ?auto_558896 ?auto_558899 ) ) ( not ( = ?auto_558896 ?auto_558900 ) ) ( not ( = ?auto_558896 ?auto_558901 ) ) ( not ( = ?auto_558896 ?auto_558902 ) ) ( not ( = ?auto_558896 ?auto_558903 ) ) ( not ( = ?auto_558896 ?auto_558904 ) ) ( not ( = ?auto_558897 ?auto_558898 ) ) ( not ( = ?auto_558897 ?auto_558899 ) ) ( not ( = ?auto_558897 ?auto_558900 ) ) ( not ( = ?auto_558897 ?auto_558901 ) ) ( not ( = ?auto_558897 ?auto_558902 ) ) ( not ( = ?auto_558897 ?auto_558903 ) ) ( not ( = ?auto_558897 ?auto_558904 ) ) ( not ( = ?auto_558898 ?auto_558899 ) ) ( not ( = ?auto_558898 ?auto_558900 ) ) ( not ( = ?auto_558898 ?auto_558901 ) ) ( not ( = ?auto_558898 ?auto_558902 ) ) ( not ( = ?auto_558898 ?auto_558903 ) ) ( not ( = ?auto_558898 ?auto_558904 ) ) ( not ( = ?auto_558899 ?auto_558900 ) ) ( not ( = ?auto_558899 ?auto_558901 ) ) ( not ( = ?auto_558899 ?auto_558902 ) ) ( not ( = ?auto_558899 ?auto_558903 ) ) ( not ( = ?auto_558899 ?auto_558904 ) ) ( not ( = ?auto_558900 ?auto_558901 ) ) ( not ( = ?auto_558900 ?auto_558902 ) ) ( not ( = ?auto_558900 ?auto_558903 ) ) ( not ( = ?auto_558900 ?auto_558904 ) ) ( not ( = ?auto_558901 ?auto_558902 ) ) ( not ( = ?auto_558901 ?auto_558903 ) ) ( not ( = ?auto_558901 ?auto_558904 ) ) ( not ( = ?auto_558902 ?auto_558903 ) ) ( not ( = ?auto_558902 ?auto_558904 ) ) ( not ( = ?auto_558903 ?auto_558904 ) ) ( ON ?auto_558902 ?auto_558903 ) ( ON ?auto_558901 ?auto_558902 ) ( ON ?auto_558900 ?auto_558901 ) ( ON ?auto_558899 ?auto_558900 ) ( ON ?auto_558898 ?auto_558899 ) ( ON ?auto_558897 ?auto_558898 ) ( ON ?auto_558896 ?auto_558897 ) ( ON ?auto_558895 ?auto_558896 ) ( ON ?auto_558894 ?auto_558895 ) ( ON ?auto_558893 ?auto_558894 ) ( ON ?auto_558892 ?auto_558893 ) ( ON ?auto_558891 ?auto_558892 ) ( ON ?auto_558890 ?auto_558891 ) ( CLEAR ?auto_558888 ) ( ON ?auto_558889 ?auto_558890 ) ( CLEAR ?auto_558889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_558888 ?auto_558889 )
      ( MAKE-16PILE ?auto_558888 ?auto_558889 ?auto_558890 ?auto_558891 ?auto_558892 ?auto_558893 ?auto_558894 ?auto_558895 ?auto_558896 ?auto_558897 ?auto_558898 ?auto_558899 ?auto_558900 ?auto_558901 ?auto_558902 ?auto_558903 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558921 - BLOCK
      ?auto_558922 - BLOCK
      ?auto_558923 - BLOCK
      ?auto_558924 - BLOCK
      ?auto_558925 - BLOCK
      ?auto_558926 - BLOCK
      ?auto_558927 - BLOCK
      ?auto_558928 - BLOCK
      ?auto_558929 - BLOCK
      ?auto_558930 - BLOCK
      ?auto_558931 - BLOCK
      ?auto_558932 - BLOCK
      ?auto_558933 - BLOCK
      ?auto_558934 - BLOCK
      ?auto_558935 - BLOCK
      ?auto_558936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_558936 ) ( ON-TABLE ?auto_558921 ) ( not ( = ?auto_558921 ?auto_558922 ) ) ( not ( = ?auto_558921 ?auto_558923 ) ) ( not ( = ?auto_558921 ?auto_558924 ) ) ( not ( = ?auto_558921 ?auto_558925 ) ) ( not ( = ?auto_558921 ?auto_558926 ) ) ( not ( = ?auto_558921 ?auto_558927 ) ) ( not ( = ?auto_558921 ?auto_558928 ) ) ( not ( = ?auto_558921 ?auto_558929 ) ) ( not ( = ?auto_558921 ?auto_558930 ) ) ( not ( = ?auto_558921 ?auto_558931 ) ) ( not ( = ?auto_558921 ?auto_558932 ) ) ( not ( = ?auto_558921 ?auto_558933 ) ) ( not ( = ?auto_558921 ?auto_558934 ) ) ( not ( = ?auto_558921 ?auto_558935 ) ) ( not ( = ?auto_558921 ?auto_558936 ) ) ( not ( = ?auto_558922 ?auto_558923 ) ) ( not ( = ?auto_558922 ?auto_558924 ) ) ( not ( = ?auto_558922 ?auto_558925 ) ) ( not ( = ?auto_558922 ?auto_558926 ) ) ( not ( = ?auto_558922 ?auto_558927 ) ) ( not ( = ?auto_558922 ?auto_558928 ) ) ( not ( = ?auto_558922 ?auto_558929 ) ) ( not ( = ?auto_558922 ?auto_558930 ) ) ( not ( = ?auto_558922 ?auto_558931 ) ) ( not ( = ?auto_558922 ?auto_558932 ) ) ( not ( = ?auto_558922 ?auto_558933 ) ) ( not ( = ?auto_558922 ?auto_558934 ) ) ( not ( = ?auto_558922 ?auto_558935 ) ) ( not ( = ?auto_558922 ?auto_558936 ) ) ( not ( = ?auto_558923 ?auto_558924 ) ) ( not ( = ?auto_558923 ?auto_558925 ) ) ( not ( = ?auto_558923 ?auto_558926 ) ) ( not ( = ?auto_558923 ?auto_558927 ) ) ( not ( = ?auto_558923 ?auto_558928 ) ) ( not ( = ?auto_558923 ?auto_558929 ) ) ( not ( = ?auto_558923 ?auto_558930 ) ) ( not ( = ?auto_558923 ?auto_558931 ) ) ( not ( = ?auto_558923 ?auto_558932 ) ) ( not ( = ?auto_558923 ?auto_558933 ) ) ( not ( = ?auto_558923 ?auto_558934 ) ) ( not ( = ?auto_558923 ?auto_558935 ) ) ( not ( = ?auto_558923 ?auto_558936 ) ) ( not ( = ?auto_558924 ?auto_558925 ) ) ( not ( = ?auto_558924 ?auto_558926 ) ) ( not ( = ?auto_558924 ?auto_558927 ) ) ( not ( = ?auto_558924 ?auto_558928 ) ) ( not ( = ?auto_558924 ?auto_558929 ) ) ( not ( = ?auto_558924 ?auto_558930 ) ) ( not ( = ?auto_558924 ?auto_558931 ) ) ( not ( = ?auto_558924 ?auto_558932 ) ) ( not ( = ?auto_558924 ?auto_558933 ) ) ( not ( = ?auto_558924 ?auto_558934 ) ) ( not ( = ?auto_558924 ?auto_558935 ) ) ( not ( = ?auto_558924 ?auto_558936 ) ) ( not ( = ?auto_558925 ?auto_558926 ) ) ( not ( = ?auto_558925 ?auto_558927 ) ) ( not ( = ?auto_558925 ?auto_558928 ) ) ( not ( = ?auto_558925 ?auto_558929 ) ) ( not ( = ?auto_558925 ?auto_558930 ) ) ( not ( = ?auto_558925 ?auto_558931 ) ) ( not ( = ?auto_558925 ?auto_558932 ) ) ( not ( = ?auto_558925 ?auto_558933 ) ) ( not ( = ?auto_558925 ?auto_558934 ) ) ( not ( = ?auto_558925 ?auto_558935 ) ) ( not ( = ?auto_558925 ?auto_558936 ) ) ( not ( = ?auto_558926 ?auto_558927 ) ) ( not ( = ?auto_558926 ?auto_558928 ) ) ( not ( = ?auto_558926 ?auto_558929 ) ) ( not ( = ?auto_558926 ?auto_558930 ) ) ( not ( = ?auto_558926 ?auto_558931 ) ) ( not ( = ?auto_558926 ?auto_558932 ) ) ( not ( = ?auto_558926 ?auto_558933 ) ) ( not ( = ?auto_558926 ?auto_558934 ) ) ( not ( = ?auto_558926 ?auto_558935 ) ) ( not ( = ?auto_558926 ?auto_558936 ) ) ( not ( = ?auto_558927 ?auto_558928 ) ) ( not ( = ?auto_558927 ?auto_558929 ) ) ( not ( = ?auto_558927 ?auto_558930 ) ) ( not ( = ?auto_558927 ?auto_558931 ) ) ( not ( = ?auto_558927 ?auto_558932 ) ) ( not ( = ?auto_558927 ?auto_558933 ) ) ( not ( = ?auto_558927 ?auto_558934 ) ) ( not ( = ?auto_558927 ?auto_558935 ) ) ( not ( = ?auto_558927 ?auto_558936 ) ) ( not ( = ?auto_558928 ?auto_558929 ) ) ( not ( = ?auto_558928 ?auto_558930 ) ) ( not ( = ?auto_558928 ?auto_558931 ) ) ( not ( = ?auto_558928 ?auto_558932 ) ) ( not ( = ?auto_558928 ?auto_558933 ) ) ( not ( = ?auto_558928 ?auto_558934 ) ) ( not ( = ?auto_558928 ?auto_558935 ) ) ( not ( = ?auto_558928 ?auto_558936 ) ) ( not ( = ?auto_558929 ?auto_558930 ) ) ( not ( = ?auto_558929 ?auto_558931 ) ) ( not ( = ?auto_558929 ?auto_558932 ) ) ( not ( = ?auto_558929 ?auto_558933 ) ) ( not ( = ?auto_558929 ?auto_558934 ) ) ( not ( = ?auto_558929 ?auto_558935 ) ) ( not ( = ?auto_558929 ?auto_558936 ) ) ( not ( = ?auto_558930 ?auto_558931 ) ) ( not ( = ?auto_558930 ?auto_558932 ) ) ( not ( = ?auto_558930 ?auto_558933 ) ) ( not ( = ?auto_558930 ?auto_558934 ) ) ( not ( = ?auto_558930 ?auto_558935 ) ) ( not ( = ?auto_558930 ?auto_558936 ) ) ( not ( = ?auto_558931 ?auto_558932 ) ) ( not ( = ?auto_558931 ?auto_558933 ) ) ( not ( = ?auto_558931 ?auto_558934 ) ) ( not ( = ?auto_558931 ?auto_558935 ) ) ( not ( = ?auto_558931 ?auto_558936 ) ) ( not ( = ?auto_558932 ?auto_558933 ) ) ( not ( = ?auto_558932 ?auto_558934 ) ) ( not ( = ?auto_558932 ?auto_558935 ) ) ( not ( = ?auto_558932 ?auto_558936 ) ) ( not ( = ?auto_558933 ?auto_558934 ) ) ( not ( = ?auto_558933 ?auto_558935 ) ) ( not ( = ?auto_558933 ?auto_558936 ) ) ( not ( = ?auto_558934 ?auto_558935 ) ) ( not ( = ?auto_558934 ?auto_558936 ) ) ( not ( = ?auto_558935 ?auto_558936 ) ) ( ON ?auto_558935 ?auto_558936 ) ( ON ?auto_558934 ?auto_558935 ) ( ON ?auto_558933 ?auto_558934 ) ( ON ?auto_558932 ?auto_558933 ) ( ON ?auto_558931 ?auto_558932 ) ( ON ?auto_558930 ?auto_558931 ) ( ON ?auto_558929 ?auto_558930 ) ( ON ?auto_558928 ?auto_558929 ) ( ON ?auto_558927 ?auto_558928 ) ( ON ?auto_558926 ?auto_558927 ) ( ON ?auto_558925 ?auto_558926 ) ( ON ?auto_558924 ?auto_558925 ) ( ON ?auto_558923 ?auto_558924 ) ( CLEAR ?auto_558921 ) ( ON ?auto_558922 ?auto_558923 ) ( CLEAR ?auto_558922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_558921 ?auto_558922 )
      ( MAKE-16PILE ?auto_558921 ?auto_558922 ?auto_558923 ?auto_558924 ?auto_558925 ?auto_558926 ?auto_558927 ?auto_558928 ?auto_558929 ?auto_558930 ?auto_558931 ?auto_558932 ?auto_558933 ?auto_558934 ?auto_558935 ?auto_558936 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558953 - BLOCK
      ?auto_558954 - BLOCK
      ?auto_558955 - BLOCK
      ?auto_558956 - BLOCK
      ?auto_558957 - BLOCK
      ?auto_558958 - BLOCK
      ?auto_558959 - BLOCK
      ?auto_558960 - BLOCK
      ?auto_558961 - BLOCK
      ?auto_558962 - BLOCK
      ?auto_558963 - BLOCK
      ?auto_558964 - BLOCK
      ?auto_558965 - BLOCK
      ?auto_558966 - BLOCK
      ?auto_558967 - BLOCK
      ?auto_558968 - BLOCK
    )
    :vars
    (
      ?auto_558969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_558968 ?auto_558969 ) ( not ( = ?auto_558953 ?auto_558954 ) ) ( not ( = ?auto_558953 ?auto_558955 ) ) ( not ( = ?auto_558953 ?auto_558956 ) ) ( not ( = ?auto_558953 ?auto_558957 ) ) ( not ( = ?auto_558953 ?auto_558958 ) ) ( not ( = ?auto_558953 ?auto_558959 ) ) ( not ( = ?auto_558953 ?auto_558960 ) ) ( not ( = ?auto_558953 ?auto_558961 ) ) ( not ( = ?auto_558953 ?auto_558962 ) ) ( not ( = ?auto_558953 ?auto_558963 ) ) ( not ( = ?auto_558953 ?auto_558964 ) ) ( not ( = ?auto_558953 ?auto_558965 ) ) ( not ( = ?auto_558953 ?auto_558966 ) ) ( not ( = ?auto_558953 ?auto_558967 ) ) ( not ( = ?auto_558953 ?auto_558968 ) ) ( not ( = ?auto_558953 ?auto_558969 ) ) ( not ( = ?auto_558954 ?auto_558955 ) ) ( not ( = ?auto_558954 ?auto_558956 ) ) ( not ( = ?auto_558954 ?auto_558957 ) ) ( not ( = ?auto_558954 ?auto_558958 ) ) ( not ( = ?auto_558954 ?auto_558959 ) ) ( not ( = ?auto_558954 ?auto_558960 ) ) ( not ( = ?auto_558954 ?auto_558961 ) ) ( not ( = ?auto_558954 ?auto_558962 ) ) ( not ( = ?auto_558954 ?auto_558963 ) ) ( not ( = ?auto_558954 ?auto_558964 ) ) ( not ( = ?auto_558954 ?auto_558965 ) ) ( not ( = ?auto_558954 ?auto_558966 ) ) ( not ( = ?auto_558954 ?auto_558967 ) ) ( not ( = ?auto_558954 ?auto_558968 ) ) ( not ( = ?auto_558954 ?auto_558969 ) ) ( not ( = ?auto_558955 ?auto_558956 ) ) ( not ( = ?auto_558955 ?auto_558957 ) ) ( not ( = ?auto_558955 ?auto_558958 ) ) ( not ( = ?auto_558955 ?auto_558959 ) ) ( not ( = ?auto_558955 ?auto_558960 ) ) ( not ( = ?auto_558955 ?auto_558961 ) ) ( not ( = ?auto_558955 ?auto_558962 ) ) ( not ( = ?auto_558955 ?auto_558963 ) ) ( not ( = ?auto_558955 ?auto_558964 ) ) ( not ( = ?auto_558955 ?auto_558965 ) ) ( not ( = ?auto_558955 ?auto_558966 ) ) ( not ( = ?auto_558955 ?auto_558967 ) ) ( not ( = ?auto_558955 ?auto_558968 ) ) ( not ( = ?auto_558955 ?auto_558969 ) ) ( not ( = ?auto_558956 ?auto_558957 ) ) ( not ( = ?auto_558956 ?auto_558958 ) ) ( not ( = ?auto_558956 ?auto_558959 ) ) ( not ( = ?auto_558956 ?auto_558960 ) ) ( not ( = ?auto_558956 ?auto_558961 ) ) ( not ( = ?auto_558956 ?auto_558962 ) ) ( not ( = ?auto_558956 ?auto_558963 ) ) ( not ( = ?auto_558956 ?auto_558964 ) ) ( not ( = ?auto_558956 ?auto_558965 ) ) ( not ( = ?auto_558956 ?auto_558966 ) ) ( not ( = ?auto_558956 ?auto_558967 ) ) ( not ( = ?auto_558956 ?auto_558968 ) ) ( not ( = ?auto_558956 ?auto_558969 ) ) ( not ( = ?auto_558957 ?auto_558958 ) ) ( not ( = ?auto_558957 ?auto_558959 ) ) ( not ( = ?auto_558957 ?auto_558960 ) ) ( not ( = ?auto_558957 ?auto_558961 ) ) ( not ( = ?auto_558957 ?auto_558962 ) ) ( not ( = ?auto_558957 ?auto_558963 ) ) ( not ( = ?auto_558957 ?auto_558964 ) ) ( not ( = ?auto_558957 ?auto_558965 ) ) ( not ( = ?auto_558957 ?auto_558966 ) ) ( not ( = ?auto_558957 ?auto_558967 ) ) ( not ( = ?auto_558957 ?auto_558968 ) ) ( not ( = ?auto_558957 ?auto_558969 ) ) ( not ( = ?auto_558958 ?auto_558959 ) ) ( not ( = ?auto_558958 ?auto_558960 ) ) ( not ( = ?auto_558958 ?auto_558961 ) ) ( not ( = ?auto_558958 ?auto_558962 ) ) ( not ( = ?auto_558958 ?auto_558963 ) ) ( not ( = ?auto_558958 ?auto_558964 ) ) ( not ( = ?auto_558958 ?auto_558965 ) ) ( not ( = ?auto_558958 ?auto_558966 ) ) ( not ( = ?auto_558958 ?auto_558967 ) ) ( not ( = ?auto_558958 ?auto_558968 ) ) ( not ( = ?auto_558958 ?auto_558969 ) ) ( not ( = ?auto_558959 ?auto_558960 ) ) ( not ( = ?auto_558959 ?auto_558961 ) ) ( not ( = ?auto_558959 ?auto_558962 ) ) ( not ( = ?auto_558959 ?auto_558963 ) ) ( not ( = ?auto_558959 ?auto_558964 ) ) ( not ( = ?auto_558959 ?auto_558965 ) ) ( not ( = ?auto_558959 ?auto_558966 ) ) ( not ( = ?auto_558959 ?auto_558967 ) ) ( not ( = ?auto_558959 ?auto_558968 ) ) ( not ( = ?auto_558959 ?auto_558969 ) ) ( not ( = ?auto_558960 ?auto_558961 ) ) ( not ( = ?auto_558960 ?auto_558962 ) ) ( not ( = ?auto_558960 ?auto_558963 ) ) ( not ( = ?auto_558960 ?auto_558964 ) ) ( not ( = ?auto_558960 ?auto_558965 ) ) ( not ( = ?auto_558960 ?auto_558966 ) ) ( not ( = ?auto_558960 ?auto_558967 ) ) ( not ( = ?auto_558960 ?auto_558968 ) ) ( not ( = ?auto_558960 ?auto_558969 ) ) ( not ( = ?auto_558961 ?auto_558962 ) ) ( not ( = ?auto_558961 ?auto_558963 ) ) ( not ( = ?auto_558961 ?auto_558964 ) ) ( not ( = ?auto_558961 ?auto_558965 ) ) ( not ( = ?auto_558961 ?auto_558966 ) ) ( not ( = ?auto_558961 ?auto_558967 ) ) ( not ( = ?auto_558961 ?auto_558968 ) ) ( not ( = ?auto_558961 ?auto_558969 ) ) ( not ( = ?auto_558962 ?auto_558963 ) ) ( not ( = ?auto_558962 ?auto_558964 ) ) ( not ( = ?auto_558962 ?auto_558965 ) ) ( not ( = ?auto_558962 ?auto_558966 ) ) ( not ( = ?auto_558962 ?auto_558967 ) ) ( not ( = ?auto_558962 ?auto_558968 ) ) ( not ( = ?auto_558962 ?auto_558969 ) ) ( not ( = ?auto_558963 ?auto_558964 ) ) ( not ( = ?auto_558963 ?auto_558965 ) ) ( not ( = ?auto_558963 ?auto_558966 ) ) ( not ( = ?auto_558963 ?auto_558967 ) ) ( not ( = ?auto_558963 ?auto_558968 ) ) ( not ( = ?auto_558963 ?auto_558969 ) ) ( not ( = ?auto_558964 ?auto_558965 ) ) ( not ( = ?auto_558964 ?auto_558966 ) ) ( not ( = ?auto_558964 ?auto_558967 ) ) ( not ( = ?auto_558964 ?auto_558968 ) ) ( not ( = ?auto_558964 ?auto_558969 ) ) ( not ( = ?auto_558965 ?auto_558966 ) ) ( not ( = ?auto_558965 ?auto_558967 ) ) ( not ( = ?auto_558965 ?auto_558968 ) ) ( not ( = ?auto_558965 ?auto_558969 ) ) ( not ( = ?auto_558966 ?auto_558967 ) ) ( not ( = ?auto_558966 ?auto_558968 ) ) ( not ( = ?auto_558966 ?auto_558969 ) ) ( not ( = ?auto_558967 ?auto_558968 ) ) ( not ( = ?auto_558967 ?auto_558969 ) ) ( not ( = ?auto_558968 ?auto_558969 ) ) ( ON ?auto_558967 ?auto_558968 ) ( ON ?auto_558966 ?auto_558967 ) ( ON ?auto_558965 ?auto_558966 ) ( ON ?auto_558964 ?auto_558965 ) ( ON ?auto_558963 ?auto_558964 ) ( ON ?auto_558962 ?auto_558963 ) ( ON ?auto_558961 ?auto_558962 ) ( ON ?auto_558960 ?auto_558961 ) ( ON ?auto_558959 ?auto_558960 ) ( ON ?auto_558958 ?auto_558959 ) ( ON ?auto_558957 ?auto_558958 ) ( ON ?auto_558956 ?auto_558957 ) ( ON ?auto_558955 ?auto_558956 ) ( ON ?auto_558954 ?auto_558955 ) ( ON ?auto_558953 ?auto_558954 ) ( CLEAR ?auto_558953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_558953 )
      ( MAKE-16PILE ?auto_558953 ?auto_558954 ?auto_558955 ?auto_558956 ?auto_558957 ?auto_558958 ?auto_558959 ?auto_558960 ?auto_558961 ?auto_558962 ?auto_558963 ?auto_558964 ?auto_558965 ?auto_558966 ?auto_558967 ?auto_558968 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_558986 - BLOCK
      ?auto_558987 - BLOCK
      ?auto_558988 - BLOCK
      ?auto_558989 - BLOCK
      ?auto_558990 - BLOCK
      ?auto_558991 - BLOCK
      ?auto_558992 - BLOCK
      ?auto_558993 - BLOCK
      ?auto_558994 - BLOCK
      ?auto_558995 - BLOCK
      ?auto_558996 - BLOCK
      ?auto_558997 - BLOCK
      ?auto_558998 - BLOCK
      ?auto_558999 - BLOCK
      ?auto_559000 - BLOCK
      ?auto_559001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_559001 ) ( not ( = ?auto_558986 ?auto_558987 ) ) ( not ( = ?auto_558986 ?auto_558988 ) ) ( not ( = ?auto_558986 ?auto_558989 ) ) ( not ( = ?auto_558986 ?auto_558990 ) ) ( not ( = ?auto_558986 ?auto_558991 ) ) ( not ( = ?auto_558986 ?auto_558992 ) ) ( not ( = ?auto_558986 ?auto_558993 ) ) ( not ( = ?auto_558986 ?auto_558994 ) ) ( not ( = ?auto_558986 ?auto_558995 ) ) ( not ( = ?auto_558986 ?auto_558996 ) ) ( not ( = ?auto_558986 ?auto_558997 ) ) ( not ( = ?auto_558986 ?auto_558998 ) ) ( not ( = ?auto_558986 ?auto_558999 ) ) ( not ( = ?auto_558986 ?auto_559000 ) ) ( not ( = ?auto_558986 ?auto_559001 ) ) ( not ( = ?auto_558987 ?auto_558988 ) ) ( not ( = ?auto_558987 ?auto_558989 ) ) ( not ( = ?auto_558987 ?auto_558990 ) ) ( not ( = ?auto_558987 ?auto_558991 ) ) ( not ( = ?auto_558987 ?auto_558992 ) ) ( not ( = ?auto_558987 ?auto_558993 ) ) ( not ( = ?auto_558987 ?auto_558994 ) ) ( not ( = ?auto_558987 ?auto_558995 ) ) ( not ( = ?auto_558987 ?auto_558996 ) ) ( not ( = ?auto_558987 ?auto_558997 ) ) ( not ( = ?auto_558987 ?auto_558998 ) ) ( not ( = ?auto_558987 ?auto_558999 ) ) ( not ( = ?auto_558987 ?auto_559000 ) ) ( not ( = ?auto_558987 ?auto_559001 ) ) ( not ( = ?auto_558988 ?auto_558989 ) ) ( not ( = ?auto_558988 ?auto_558990 ) ) ( not ( = ?auto_558988 ?auto_558991 ) ) ( not ( = ?auto_558988 ?auto_558992 ) ) ( not ( = ?auto_558988 ?auto_558993 ) ) ( not ( = ?auto_558988 ?auto_558994 ) ) ( not ( = ?auto_558988 ?auto_558995 ) ) ( not ( = ?auto_558988 ?auto_558996 ) ) ( not ( = ?auto_558988 ?auto_558997 ) ) ( not ( = ?auto_558988 ?auto_558998 ) ) ( not ( = ?auto_558988 ?auto_558999 ) ) ( not ( = ?auto_558988 ?auto_559000 ) ) ( not ( = ?auto_558988 ?auto_559001 ) ) ( not ( = ?auto_558989 ?auto_558990 ) ) ( not ( = ?auto_558989 ?auto_558991 ) ) ( not ( = ?auto_558989 ?auto_558992 ) ) ( not ( = ?auto_558989 ?auto_558993 ) ) ( not ( = ?auto_558989 ?auto_558994 ) ) ( not ( = ?auto_558989 ?auto_558995 ) ) ( not ( = ?auto_558989 ?auto_558996 ) ) ( not ( = ?auto_558989 ?auto_558997 ) ) ( not ( = ?auto_558989 ?auto_558998 ) ) ( not ( = ?auto_558989 ?auto_558999 ) ) ( not ( = ?auto_558989 ?auto_559000 ) ) ( not ( = ?auto_558989 ?auto_559001 ) ) ( not ( = ?auto_558990 ?auto_558991 ) ) ( not ( = ?auto_558990 ?auto_558992 ) ) ( not ( = ?auto_558990 ?auto_558993 ) ) ( not ( = ?auto_558990 ?auto_558994 ) ) ( not ( = ?auto_558990 ?auto_558995 ) ) ( not ( = ?auto_558990 ?auto_558996 ) ) ( not ( = ?auto_558990 ?auto_558997 ) ) ( not ( = ?auto_558990 ?auto_558998 ) ) ( not ( = ?auto_558990 ?auto_558999 ) ) ( not ( = ?auto_558990 ?auto_559000 ) ) ( not ( = ?auto_558990 ?auto_559001 ) ) ( not ( = ?auto_558991 ?auto_558992 ) ) ( not ( = ?auto_558991 ?auto_558993 ) ) ( not ( = ?auto_558991 ?auto_558994 ) ) ( not ( = ?auto_558991 ?auto_558995 ) ) ( not ( = ?auto_558991 ?auto_558996 ) ) ( not ( = ?auto_558991 ?auto_558997 ) ) ( not ( = ?auto_558991 ?auto_558998 ) ) ( not ( = ?auto_558991 ?auto_558999 ) ) ( not ( = ?auto_558991 ?auto_559000 ) ) ( not ( = ?auto_558991 ?auto_559001 ) ) ( not ( = ?auto_558992 ?auto_558993 ) ) ( not ( = ?auto_558992 ?auto_558994 ) ) ( not ( = ?auto_558992 ?auto_558995 ) ) ( not ( = ?auto_558992 ?auto_558996 ) ) ( not ( = ?auto_558992 ?auto_558997 ) ) ( not ( = ?auto_558992 ?auto_558998 ) ) ( not ( = ?auto_558992 ?auto_558999 ) ) ( not ( = ?auto_558992 ?auto_559000 ) ) ( not ( = ?auto_558992 ?auto_559001 ) ) ( not ( = ?auto_558993 ?auto_558994 ) ) ( not ( = ?auto_558993 ?auto_558995 ) ) ( not ( = ?auto_558993 ?auto_558996 ) ) ( not ( = ?auto_558993 ?auto_558997 ) ) ( not ( = ?auto_558993 ?auto_558998 ) ) ( not ( = ?auto_558993 ?auto_558999 ) ) ( not ( = ?auto_558993 ?auto_559000 ) ) ( not ( = ?auto_558993 ?auto_559001 ) ) ( not ( = ?auto_558994 ?auto_558995 ) ) ( not ( = ?auto_558994 ?auto_558996 ) ) ( not ( = ?auto_558994 ?auto_558997 ) ) ( not ( = ?auto_558994 ?auto_558998 ) ) ( not ( = ?auto_558994 ?auto_558999 ) ) ( not ( = ?auto_558994 ?auto_559000 ) ) ( not ( = ?auto_558994 ?auto_559001 ) ) ( not ( = ?auto_558995 ?auto_558996 ) ) ( not ( = ?auto_558995 ?auto_558997 ) ) ( not ( = ?auto_558995 ?auto_558998 ) ) ( not ( = ?auto_558995 ?auto_558999 ) ) ( not ( = ?auto_558995 ?auto_559000 ) ) ( not ( = ?auto_558995 ?auto_559001 ) ) ( not ( = ?auto_558996 ?auto_558997 ) ) ( not ( = ?auto_558996 ?auto_558998 ) ) ( not ( = ?auto_558996 ?auto_558999 ) ) ( not ( = ?auto_558996 ?auto_559000 ) ) ( not ( = ?auto_558996 ?auto_559001 ) ) ( not ( = ?auto_558997 ?auto_558998 ) ) ( not ( = ?auto_558997 ?auto_558999 ) ) ( not ( = ?auto_558997 ?auto_559000 ) ) ( not ( = ?auto_558997 ?auto_559001 ) ) ( not ( = ?auto_558998 ?auto_558999 ) ) ( not ( = ?auto_558998 ?auto_559000 ) ) ( not ( = ?auto_558998 ?auto_559001 ) ) ( not ( = ?auto_558999 ?auto_559000 ) ) ( not ( = ?auto_558999 ?auto_559001 ) ) ( not ( = ?auto_559000 ?auto_559001 ) ) ( ON ?auto_559000 ?auto_559001 ) ( ON ?auto_558999 ?auto_559000 ) ( ON ?auto_558998 ?auto_558999 ) ( ON ?auto_558997 ?auto_558998 ) ( ON ?auto_558996 ?auto_558997 ) ( ON ?auto_558995 ?auto_558996 ) ( ON ?auto_558994 ?auto_558995 ) ( ON ?auto_558993 ?auto_558994 ) ( ON ?auto_558992 ?auto_558993 ) ( ON ?auto_558991 ?auto_558992 ) ( ON ?auto_558990 ?auto_558991 ) ( ON ?auto_558989 ?auto_558990 ) ( ON ?auto_558988 ?auto_558989 ) ( ON ?auto_558987 ?auto_558988 ) ( ON ?auto_558986 ?auto_558987 ) ( CLEAR ?auto_558986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_558986 )
      ( MAKE-16PILE ?auto_558986 ?auto_558987 ?auto_558988 ?auto_558989 ?auto_558990 ?auto_558991 ?auto_558992 ?auto_558993 ?auto_558994 ?auto_558995 ?auto_558996 ?auto_558997 ?auto_558998 ?auto_558999 ?auto_559000 ?auto_559001 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_559018 - BLOCK
      ?auto_559019 - BLOCK
      ?auto_559020 - BLOCK
      ?auto_559021 - BLOCK
      ?auto_559022 - BLOCK
      ?auto_559023 - BLOCK
      ?auto_559024 - BLOCK
      ?auto_559025 - BLOCK
      ?auto_559026 - BLOCK
      ?auto_559027 - BLOCK
      ?auto_559028 - BLOCK
      ?auto_559029 - BLOCK
      ?auto_559030 - BLOCK
      ?auto_559031 - BLOCK
      ?auto_559032 - BLOCK
      ?auto_559033 - BLOCK
    )
    :vars
    (
      ?auto_559034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_559018 ?auto_559019 ) ) ( not ( = ?auto_559018 ?auto_559020 ) ) ( not ( = ?auto_559018 ?auto_559021 ) ) ( not ( = ?auto_559018 ?auto_559022 ) ) ( not ( = ?auto_559018 ?auto_559023 ) ) ( not ( = ?auto_559018 ?auto_559024 ) ) ( not ( = ?auto_559018 ?auto_559025 ) ) ( not ( = ?auto_559018 ?auto_559026 ) ) ( not ( = ?auto_559018 ?auto_559027 ) ) ( not ( = ?auto_559018 ?auto_559028 ) ) ( not ( = ?auto_559018 ?auto_559029 ) ) ( not ( = ?auto_559018 ?auto_559030 ) ) ( not ( = ?auto_559018 ?auto_559031 ) ) ( not ( = ?auto_559018 ?auto_559032 ) ) ( not ( = ?auto_559018 ?auto_559033 ) ) ( not ( = ?auto_559019 ?auto_559020 ) ) ( not ( = ?auto_559019 ?auto_559021 ) ) ( not ( = ?auto_559019 ?auto_559022 ) ) ( not ( = ?auto_559019 ?auto_559023 ) ) ( not ( = ?auto_559019 ?auto_559024 ) ) ( not ( = ?auto_559019 ?auto_559025 ) ) ( not ( = ?auto_559019 ?auto_559026 ) ) ( not ( = ?auto_559019 ?auto_559027 ) ) ( not ( = ?auto_559019 ?auto_559028 ) ) ( not ( = ?auto_559019 ?auto_559029 ) ) ( not ( = ?auto_559019 ?auto_559030 ) ) ( not ( = ?auto_559019 ?auto_559031 ) ) ( not ( = ?auto_559019 ?auto_559032 ) ) ( not ( = ?auto_559019 ?auto_559033 ) ) ( not ( = ?auto_559020 ?auto_559021 ) ) ( not ( = ?auto_559020 ?auto_559022 ) ) ( not ( = ?auto_559020 ?auto_559023 ) ) ( not ( = ?auto_559020 ?auto_559024 ) ) ( not ( = ?auto_559020 ?auto_559025 ) ) ( not ( = ?auto_559020 ?auto_559026 ) ) ( not ( = ?auto_559020 ?auto_559027 ) ) ( not ( = ?auto_559020 ?auto_559028 ) ) ( not ( = ?auto_559020 ?auto_559029 ) ) ( not ( = ?auto_559020 ?auto_559030 ) ) ( not ( = ?auto_559020 ?auto_559031 ) ) ( not ( = ?auto_559020 ?auto_559032 ) ) ( not ( = ?auto_559020 ?auto_559033 ) ) ( not ( = ?auto_559021 ?auto_559022 ) ) ( not ( = ?auto_559021 ?auto_559023 ) ) ( not ( = ?auto_559021 ?auto_559024 ) ) ( not ( = ?auto_559021 ?auto_559025 ) ) ( not ( = ?auto_559021 ?auto_559026 ) ) ( not ( = ?auto_559021 ?auto_559027 ) ) ( not ( = ?auto_559021 ?auto_559028 ) ) ( not ( = ?auto_559021 ?auto_559029 ) ) ( not ( = ?auto_559021 ?auto_559030 ) ) ( not ( = ?auto_559021 ?auto_559031 ) ) ( not ( = ?auto_559021 ?auto_559032 ) ) ( not ( = ?auto_559021 ?auto_559033 ) ) ( not ( = ?auto_559022 ?auto_559023 ) ) ( not ( = ?auto_559022 ?auto_559024 ) ) ( not ( = ?auto_559022 ?auto_559025 ) ) ( not ( = ?auto_559022 ?auto_559026 ) ) ( not ( = ?auto_559022 ?auto_559027 ) ) ( not ( = ?auto_559022 ?auto_559028 ) ) ( not ( = ?auto_559022 ?auto_559029 ) ) ( not ( = ?auto_559022 ?auto_559030 ) ) ( not ( = ?auto_559022 ?auto_559031 ) ) ( not ( = ?auto_559022 ?auto_559032 ) ) ( not ( = ?auto_559022 ?auto_559033 ) ) ( not ( = ?auto_559023 ?auto_559024 ) ) ( not ( = ?auto_559023 ?auto_559025 ) ) ( not ( = ?auto_559023 ?auto_559026 ) ) ( not ( = ?auto_559023 ?auto_559027 ) ) ( not ( = ?auto_559023 ?auto_559028 ) ) ( not ( = ?auto_559023 ?auto_559029 ) ) ( not ( = ?auto_559023 ?auto_559030 ) ) ( not ( = ?auto_559023 ?auto_559031 ) ) ( not ( = ?auto_559023 ?auto_559032 ) ) ( not ( = ?auto_559023 ?auto_559033 ) ) ( not ( = ?auto_559024 ?auto_559025 ) ) ( not ( = ?auto_559024 ?auto_559026 ) ) ( not ( = ?auto_559024 ?auto_559027 ) ) ( not ( = ?auto_559024 ?auto_559028 ) ) ( not ( = ?auto_559024 ?auto_559029 ) ) ( not ( = ?auto_559024 ?auto_559030 ) ) ( not ( = ?auto_559024 ?auto_559031 ) ) ( not ( = ?auto_559024 ?auto_559032 ) ) ( not ( = ?auto_559024 ?auto_559033 ) ) ( not ( = ?auto_559025 ?auto_559026 ) ) ( not ( = ?auto_559025 ?auto_559027 ) ) ( not ( = ?auto_559025 ?auto_559028 ) ) ( not ( = ?auto_559025 ?auto_559029 ) ) ( not ( = ?auto_559025 ?auto_559030 ) ) ( not ( = ?auto_559025 ?auto_559031 ) ) ( not ( = ?auto_559025 ?auto_559032 ) ) ( not ( = ?auto_559025 ?auto_559033 ) ) ( not ( = ?auto_559026 ?auto_559027 ) ) ( not ( = ?auto_559026 ?auto_559028 ) ) ( not ( = ?auto_559026 ?auto_559029 ) ) ( not ( = ?auto_559026 ?auto_559030 ) ) ( not ( = ?auto_559026 ?auto_559031 ) ) ( not ( = ?auto_559026 ?auto_559032 ) ) ( not ( = ?auto_559026 ?auto_559033 ) ) ( not ( = ?auto_559027 ?auto_559028 ) ) ( not ( = ?auto_559027 ?auto_559029 ) ) ( not ( = ?auto_559027 ?auto_559030 ) ) ( not ( = ?auto_559027 ?auto_559031 ) ) ( not ( = ?auto_559027 ?auto_559032 ) ) ( not ( = ?auto_559027 ?auto_559033 ) ) ( not ( = ?auto_559028 ?auto_559029 ) ) ( not ( = ?auto_559028 ?auto_559030 ) ) ( not ( = ?auto_559028 ?auto_559031 ) ) ( not ( = ?auto_559028 ?auto_559032 ) ) ( not ( = ?auto_559028 ?auto_559033 ) ) ( not ( = ?auto_559029 ?auto_559030 ) ) ( not ( = ?auto_559029 ?auto_559031 ) ) ( not ( = ?auto_559029 ?auto_559032 ) ) ( not ( = ?auto_559029 ?auto_559033 ) ) ( not ( = ?auto_559030 ?auto_559031 ) ) ( not ( = ?auto_559030 ?auto_559032 ) ) ( not ( = ?auto_559030 ?auto_559033 ) ) ( not ( = ?auto_559031 ?auto_559032 ) ) ( not ( = ?auto_559031 ?auto_559033 ) ) ( not ( = ?auto_559032 ?auto_559033 ) ) ( ON ?auto_559018 ?auto_559034 ) ( not ( = ?auto_559033 ?auto_559034 ) ) ( not ( = ?auto_559032 ?auto_559034 ) ) ( not ( = ?auto_559031 ?auto_559034 ) ) ( not ( = ?auto_559030 ?auto_559034 ) ) ( not ( = ?auto_559029 ?auto_559034 ) ) ( not ( = ?auto_559028 ?auto_559034 ) ) ( not ( = ?auto_559027 ?auto_559034 ) ) ( not ( = ?auto_559026 ?auto_559034 ) ) ( not ( = ?auto_559025 ?auto_559034 ) ) ( not ( = ?auto_559024 ?auto_559034 ) ) ( not ( = ?auto_559023 ?auto_559034 ) ) ( not ( = ?auto_559022 ?auto_559034 ) ) ( not ( = ?auto_559021 ?auto_559034 ) ) ( not ( = ?auto_559020 ?auto_559034 ) ) ( not ( = ?auto_559019 ?auto_559034 ) ) ( not ( = ?auto_559018 ?auto_559034 ) ) ( ON ?auto_559019 ?auto_559018 ) ( ON ?auto_559020 ?auto_559019 ) ( ON ?auto_559021 ?auto_559020 ) ( ON ?auto_559022 ?auto_559021 ) ( ON ?auto_559023 ?auto_559022 ) ( ON ?auto_559024 ?auto_559023 ) ( ON ?auto_559025 ?auto_559024 ) ( ON ?auto_559026 ?auto_559025 ) ( ON ?auto_559027 ?auto_559026 ) ( ON ?auto_559028 ?auto_559027 ) ( ON ?auto_559029 ?auto_559028 ) ( ON ?auto_559030 ?auto_559029 ) ( ON ?auto_559031 ?auto_559030 ) ( ON ?auto_559032 ?auto_559031 ) ( ON ?auto_559033 ?auto_559032 ) ( CLEAR ?auto_559033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_559033 ?auto_559032 ?auto_559031 ?auto_559030 ?auto_559029 ?auto_559028 ?auto_559027 ?auto_559026 ?auto_559025 ?auto_559024 ?auto_559023 ?auto_559022 ?auto_559021 ?auto_559020 ?auto_559019 ?auto_559018 )
      ( MAKE-16PILE ?auto_559018 ?auto_559019 ?auto_559020 ?auto_559021 ?auto_559022 ?auto_559023 ?auto_559024 ?auto_559025 ?auto_559026 ?auto_559027 ?auto_559028 ?auto_559029 ?auto_559030 ?auto_559031 ?auto_559032 ?auto_559033 ) )
  )

)

