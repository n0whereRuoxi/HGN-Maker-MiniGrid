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
      ?auto_508852 - BLOCK
    )
    :vars
    (
      ?auto_508853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508852 ?auto_508853 ) ( CLEAR ?auto_508852 ) ( HAND-EMPTY ) ( not ( = ?auto_508852 ?auto_508853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_508852 ?auto_508853 )
      ( !PUTDOWN ?auto_508852 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_508859 - BLOCK
      ?auto_508860 - BLOCK
    )
    :vars
    (
      ?auto_508861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_508859 ) ( ON ?auto_508860 ?auto_508861 ) ( CLEAR ?auto_508860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_508859 ) ( not ( = ?auto_508859 ?auto_508860 ) ) ( not ( = ?auto_508859 ?auto_508861 ) ) ( not ( = ?auto_508860 ?auto_508861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_508860 ?auto_508861 )
      ( !STACK ?auto_508860 ?auto_508859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_508869 - BLOCK
      ?auto_508870 - BLOCK
    )
    :vars
    (
      ?auto_508871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508870 ?auto_508871 ) ( not ( = ?auto_508869 ?auto_508870 ) ) ( not ( = ?auto_508869 ?auto_508871 ) ) ( not ( = ?auto_508870 ?auto_508871 ) ) ( ON ?auto_508869 ?auto_508870 ) ( CLEAR ?auto_508869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_508869 )
      ( MAKE-2PILE ?auto_508869 ?auto_508870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_508880 - BLOCK
      ?auto_508881 - BLOCK
      ?auto_508882 - BLOCK
    )
    :vars
    (
      ?auto_508883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_508881 ) ( ON ?auto_508882 ?auto_508883 ) ( CLEAR ?auto_508882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_508880 ) ( ON ?auto_508881 ?auto_508880 ) ( not ( = ?auto_508880 ?auto_508881 ) ) ( not ( = ?auto_508880 ?auto_508882 ) ) ( not ( = ?auto_508880 ?auto_508883 ) ) ( not ( = ?auto_508881 ?auto_508882 ) ) ( not ( = ?auto_508881 ?auto_508883 ) ) ( not ( = ?auto_508882 ?auto_508883 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_508882 ?auto_508883 )
      ( !STACK ?auto_508882 ?auto_508881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_508894 - BLOCK
      ?auto_508895 - BLOCK
      ?auto_508896 - BLOCK
    )
    :vars
    (
      ?auto_508897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508896 ?auto_508897 ) ( ON-TABLE ?auto_508894 ) ( not ( = ?auto_508894 ?auto_508895 ) ) ( not ( = ?auto_508894 ?auto_508896 ) ) ( not ( = ?auto_508894 ?auto_508897 ) ) ( not ( = ?auto_508895 ?auto_508896 ) ) ( not ( = ?auto_508895 ?auto_508897 ) ) ( not ( = ?auto_508896 ?auto_508897 ) ) ( CLEAR ?auto_508894 ) ( ON ?auto_508895 ?auto_508896 ) ( CLEAR ?auto_508895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_508894 ?auto_508895 )
      ( MAKE-3PILE ?auto_508894 ?auto_508895 ?auto_508896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_508908 - BLOCK
      ?auto_508909 - BLOCK
      ?auto_508910 - BLOCK
    )
    :vars
    (
      ?auto_508911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508910 ?auto_508911 ) ( not ( = ?auto_508908 ?auto_508909 ) ) ( not ( = ?auto_508908 ?auto_508910 ) ) ( not ( = ?auto_508908 ?auto_508911 ) ) ( not ( = ?auto_508909 ?auto_508910 ) ) ( not ( = ?auto_508909 ?auto_508911 ) ) ( not ( = ?auto_508910 ?auto_508911 ) ) ( ON ?auto_508909 ?auto_508910 ) ( ON ?auto_508908 ?auto_508909 ) ( CLEAR ?auto_508908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_508908 )
      ( MAKE-3PILE ?auto_508908 ?auto_508909 ?auto_508910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_508923 - BLOCK
      ?auto_508924 - BLOCK
      ?auto_508925 - BLOCK
      ?auto_508926 - BLOCK
    )
    :vars
    (
      ?auto_508927 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_508925 ) ( ON ?auto_508926 ?auto_508927 ) ( CLEAR ?auto_508926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_508923 ) ( ON ?auto_508924 ?auto_508923 ) ( ON ?auto_508925 ?auto_508924 ) ( not ( = ?auto_508923 ?auto_508924 ) ) ( not ( = ?auto_508923 ?auto_508925 ) ) ( not ( = ?auto_508923 ?auto_508926 ) ) ( not ( = ?auto_508923 ?auto_508927 ) ) ( not ( = ?auto_508924 ?auto_508925 ) ) ( not ( = ?auto_508924 ?auto_508926 ) ) ( not ( = ?auto_508924 ?auto_508927 ) ) ( not ( = ?auto_508925 ?auto_508926 ) ) ( not ( = ?auto_508925 ?auto_508927 ) ) ( not ( = ?auto_508926 ?auto_508927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_508926 ?auto_508927 )
      ( !STACK ?auto_508926 ?auto_508925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_508941 - BLOCK
      ?auto_508942 - BLOCK
      ?auto_508943 - BLOCK
      ?auto_508944 - BLOCK
    )
    :vars
    (
      ?auto_508945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508944 ?auto_508945 ) ( ON-TABLE ?auto_508941 ) ( ON ?auto_508942 ?auto_508941 ) ( not ( = ?auto_508941 ?auto_508942 ) ) ( not ( = ?auto_508941 ?auto_508943 ) ) ( not ( = ?auto_508941 ?auto_508944 ) ) ( not ( = ?auto_508941 ?auto_508945 ) ) ( not ( = ?auto_508942 ?auto_508943 ) ) ( not ( = ?auto_508942 ?auto_508944 ) ) ( not ( = ?auto_508942 ?auto_508945 ) ) ( not ( = ?auto_508943 ?auto_508944 ) ) ( not ( = ?auto_508943 ?auto_508945 ) ) ( not ( = ?auto_508944 ?auto_508945 ) ) ( CLEAR ?auto_508942 ) ( ON ?auto_508943 ?auto_508944 ) ( CLEAR ?auto_508943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_508941 ?auto_508942 ?auto_508943 )
      ( MAKE-4PILE ?auto_508941 ?auto_508942 ?auto_508943 ?auto_508944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_508959 - BLOCK
      ?auto_508960 - BLOCK
      ?auto_508961 - BLOCK
      ?auto_508962 - BLOCK
    )
    :vars
    (
      ?auto_508963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508962 ?auto_508963 ) ( ON-TABLE ?auto_508959 ) ( not ( = ?auto_508959 ?auto_508960 ) ) ( not ( = ?auto_508959 ?auto_508961 ) ) ( not ( = ?auto_508959 ?auto_508962 ) ) ( not ( = ?auto_508959 ?auto_508963 ) ) ( not ( = ?auto_508960 ?auto_508961 ) ) ( not ( = ?auto_508960 ?auto_508962 ) ) ( not ( = ?auto_508960 ?auto_508963 ) ) ( not ( = ?auto_508961 ?auto_508962 ) ) ( not ( = ?auto_508961 ?auto_508963 ) ) ( not ( = ?auto_508962 ?auto_508963 ) ) ( ON ?auto_508961 ?auto_508962 ) ( CLEAR ?auto_508959 ) ( ON ?auto_508960 ?auto_508961 ) ( CLEAR ?auto_508960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_508959 ?auto_508960 )
      ( MAKE-4PILE ?auto_508959 ?auto_508960 ?auto_508961 ?auto_508962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_508977 - BLOCK
      ?auto_508978 - BLOCK
      ?auto_508979 - BLOCK
      ?auto_508980 - BLOCK
    )
    :vars
    (
      ?auto_508981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508980 ?auto_508981 ) ( not ( = ?auto_508977 ?auto_508978 ) ) ( not ( = ?auto_508977 ?auto_508979 ) ) ( not ( = ?auto_508977 ?auto_508980 ) ) ( not ( = ?auto_508977 ?auto_508981 ) ) ( not ( = ?auto_508978 ?auto_508979 ) ) ( not ( = ?auto_508978 ?auto_508980 ) ) ( not ( = ?auto_508978 ?auto_508981 ) ) ( not ( = ?auto_508979 ?auto_508980 ) ) ( not ( = ?auto_508979 ?auto_508981 ) ) ( not ( = ?auto_508980 ?auto_508981 ) ) ( ON ?auto_508979 ?auto_508980 ) ( ON ?auto_508978 ?auto_508979 ) ( ON ?auto_508977 ?auto_508978 ) ( CLEAR ?auto_508977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_508977 )
      ( MAKE-4PILE ?auto_508977 ?auto_508978 ?auto_508979 ?auto_508980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_508996 - BLOCK
      ?auto_508997 - BLOCK
      ?auto_508998 - BLOCK
      ?auto_508999 - BLOCK
      ?auto_509000 - BLOCK
    )
    :vars
    (
      ?auto_509001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_508999 ) ( ON ?auto_509000 ?auto_509001 ) ( CLEAR ?auto_509000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_508996 ) ( ON ?auto_508997 ?auto_508996 ) ( ON ?auto_508998 ?auto_508997 ) ( ON ?auto_508999 ?auto_508998 ) ( not ( = ?auto_508996 ?auto_508997 ) ) ( not ( = ?auto_508996 ?auto_508998 ) ) ( not ( = ?auto_508996 ?auto_508999 ) ) ( not ( = ?auto_508996 ?auto_509000 ) ) ( not ( = ?auto_508996 ?auto_509001 ) ) ( not ( = ?auto_508997 ?auto_508998 ) ) ( not ( = ?auto_508997 ?auto_508999 ) ) ( not ( = ?auto_508997 ?auto_509000 ) ) ( not ( = ?auto_508997 ?auto_509001 ) ) ( not ( = ?auto_508998 ?auto_508999 ) ) ( not ( = ?auto_508998 ?auto_509000 ) ) ( not ( = ?auto_508998 ?auto_509001 ) ) ( not ( = ?auto_508999 ?auto_509000 ) ) ( not ( = ?auto_508999 ?auto_509001 ) ) ( not ( = ?auto_509000 ?auto_509001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509000 ?auto_509001 )
      ( !STACK ?auto_509000 ?auto_508999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_509018 - BLOCK
      ?auto_509019 - BLOCK
      ?auto_509020 - BLOCK
      ?auto_509021 - BLOCK
      ?auto_509022 - BLOCK
    )
    :vars
    (
      ?auto_509023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509022 ?auto_509023 ) ( ON-TABLE ?auto_509018 ) ( ON ?auto_509019 ?auto_509018 ) ( ON ?auto_509020 ?auto_509019 ) ( not ( = ?auto_509018 ?auto_509019 ) ) ( not ( = ?auto_509018 ?auto_509020 ) ) ( not ( = ?auto_509018 ?auto_509021 ) ) ( not ( = ?auto_509018 ?auto_509022 ) ) ( not ( = ?auto_509018 ?auto_509023 ) ) ( not ( = ?auto_509019 ?auto_509020 ) ) ( not ( = ?auto_509019 ?auto_509021 ) ) ( not ( = ?auto_509019 ?auto_509022 ) ) ( not ( = ?auto_509019 ?auto_509023 ) ) ( not ( = ?auto_509020 ?auto_509021 ) ) ( not ( = ?auto_509020 ?auto_509022 ) ) ( not ( = ?auto_509020 ?auto_509023 ) ) ( not ( = ?auto_509021 ?auto_509022 ) ) ( not ( = ?auto_509021 ?auto_509023 ) ) ( not ( = ?auto_509022 ?auto_509023 ) ) ( CLEAR ?auto_509020 ) ( ON ?auto_509021 ?auto_509022 ) ( CLEAR ?auto_509021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_509018 ?auto_509019 ?auto_509020 ?auto_509021 )
      ( MAKE-5PILE ?auto_509018 ?auto_509019 ?auto_509020 ?auto_509021 ?auto_509022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_509040 - BLOCK
      ?auto_509041 - BLOCK
      ?auto_509042 - BLOCK
      ?auto_509043 - BLOCK
      ?auto_509044 - BLOCK
    )
    :vars
    (
      ?auto_509045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509044 ?auto_509045 ) ( ON-TABLE ?auto_509040 ) ( ON ?auto_509041 ?auto_509040 ) ( not ( = ?auto_509040 ?auto_509041 ) ) ( not ( = ?auto_509040 ?auto_509042 ) ) ( not ( = ?auto_509040 ?auto_509043 ) ) ( not ( = ?auto_509040 ?auto_509044 ) ) ( not ( = ?auto_509040 ?auto_509045 ) ) ( not ( = ?auto_509041 ?auto_509042 ) ) ( not ( = ?auto_509041 ?auto_509043 ) ) ( not ( = ?auto_509041 ?auto_509044 ) ) ( not ( = ?auto_509041 ?auto_509045 ) ) ( not ( = ?auto_509042 ?auto_509043 ) ) ( not ( = ?auto_509042 ?auto_509044 ) ) ( not ( = ?auto_509042 ?auto_509045 ) ) ( not ( = ?auto_509043 ?auto_509044 ) ) ( not ( = ?auto_509043 ?auto_509045 ) ) ( not ( = ?auto_509044 ?auto_509045 ) ) ( ON ?auto_509043 ?auto_509044 ) ( CLEAR ?auto_509041 ) ( ON ?auto_509042 ?auto_509043 ) ( CLEAR ?auto_509042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_509040 ?auto_509041 ?auto_509042 )
      ( MAKE-5PILE ?auto_509040 ?auto_509041 ?auto_509042 ?auto_509043 ?auto_509044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_509062 - BLOCK
      ?auto_509063 - BLOCK
      ?auto_509064 - BLOCK
      ?auto_509065 - BLOCK
      ?auto_509066 - BLOCK
    )
    :vars
    (
      ?auto_509067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509066 ?auto_509067 ) ( ON-TABLE ?auto_509062 ) ( not ( = ?auto_509062 ?auto_509063 ) ) ( not ( = ?auto_509062 ?auto_509064 ) ) ( not ( = ?auto_509062 ?auto_509065 ) ) ( not ( = ?auto_509062 ?auto_509066 ) ) ( not ( = ?auto_509062 ?auto_509067 ) ) ( not ( = ?auto_509063 ?auto_509064 ) ) ( not ( = ?auto_509063 ?auto_509065 ) ) ( not ( = ?auto_509063 ?auto_509066 ) ) ( not ( = ?auto_509063 ?auto_509067 ) ) ( not ( = ?auto_509064 ?auto_509065 ) ) ( not ( = ?auto_509064 ?auto_509066 ) ) ( not ( = ?auto_509064 ?auto_509067 ) ) ( not ( = ?auto_509065 ?auto_509066 ) ) ( not ( = ?auto_509065 ?auto_509067 ) ) ( not ( = ?auto_509066 ?auto_509067 ) ) ( ON ?auto_509065 ?auto_509066 ) ( ON ?auto_509064 ?auto_509065 ) ( CLEAR ?auto_509062 ) ( ON ?auto_509063 ?auto_509064 ) ( CLEAR ?auto_509063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_509062 ?auto_509063 )
      ( MAKE-5PILE ?auto_509062 ?auto_509063 ?auto_509064 ?auto_509065 ?auto_509066 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_509084 - BLOCK
      ?auto_509085 - BLOCK
      ?auto_509086 - BLOCK
      ?auto_509087 - BLOCK
      ?auto_509088 - BLOCK
    )
    :vars
    (
      ?auto_509089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509088 ?auto_509089 ) ( not ( = ?auto_509084 ?auto_509085 ) ) ( not ( = ?auto_509084 ?auto_509086 ) ) ( not ( = ?auto_509084 ?auto_509087 ) ) ( not ( = ?auto_509084 ?auto_509088 ) ) ( not ( = ?auto_509084 ?auto_509089 ) ) ( not ( = ?auto_509085 ?auto_509086 ) ) ( not ( = ?auto_509085 ?auto_509087 ) ) ( not ( = ?auto_509085 ?auto_509088 ) ) ( not ( = ?auto_509085 ?auto_509089 ) ) ( not ( = ?auto_509086 ?auto_509087 ) ) ( not ( = ?auto_509086 ?auto_509088 ) ) ( not ( = ?auto_509086 ?auto_509089 ) ) ( not ( = ?auto_509087 ?auto_509088 ) ) ( not ( = ?auto_509087 ?auto_509089 ) ) ( not ( = ?auto_509088 ?auto_509089 ) ) ( ON ?auto_509087 ?auto_509088 ) ( ON ?auto_509086 ?auto_509087 ) ( ON ?auto_509085 ?auto_509086 ) ( ON ?auto_509084 ?auto_509085 ) ( CLEAR ?auto_509084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_509084 )
      ( MAKE-5PILE ?auto_509084 ?auto_509085 ?auto_509086 ?auto_509087 ?auto_509088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_509107 - BLOCK
      ?auto_509108 - BLOCK
      ?auto_509109 - BLOCK
      ?auto_509110 - BLOCK
      ?auto_509111 - BLOCK
      ?auto_509112 - BLOCK
    )
    :vars
    (
      ?auto_509113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_509111 ) ( ON ?auto_509112 ?auto_509113 ) ( CLEAR ?auto_509112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_509107 ) ( ON ?auto_509108 ?auto_509107 ) ( ON ?auto_509109 ?auto_509108 ) ( ON ?auto_509110 ?auto_509109 ) ( ON ?auto_509111 ?auto_509110 ) ( not ( = ?auto_509107 ?auto_509108 ) ) ( not ( = ?auto_509107 ?auto_509109 ) ) ( not ( = ?auto_509107 ?auto_509110 ) ) ( not ( = ?auto_509107 ?auto_509111 ) ) ( not ( = ?auto_509107 ?auto_509112 ) ) ( not ( = ?auto_509107 ?auto_509113 ) ) ( not ( = ?auto_509108 ?auto_509109 ) ) ( not ( = ?auto_509108 ?auto_509110 ) ) ( not ( = ?auto_509108 ?auto_509111 ) ) ( not ( = ?auto_509108 ?auto_509112 ) ) ( not ( = ?auto_509108 ?auto_509113 ) ) ( not ( = ?auto_509109 ?auto_509110 ) ) ( not ( = ?auto_509109 ?auto_509111 ) ) ( not ( = ?auto_509109 ?auto_509112 ) ) ( not ( = ?auto_509109 ?auto_509113 ) ) ( not ( = ?auto_509110 ?auto_509111 ) ) ( not ( = ?auto_509110 ?auto_509112 ) ) ( not ( = ?auto_509110 ?auto_509113 ) ) ( not ( = ?auto_509111 ?auto_509112 ) ) ( not ( = ?auto_509111 ?auto_509113 ) ) ( not ( = ?auto_509112 ?auto_509113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509112 ?auto_509113 )
      ( !STACK ?auto_509112 ?auto_509111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_509133 - BLOCK
      ?auto_509134 - BLOCK
      ?auto_509135 - BLOCK
      ?auto_509136 - BLOCK
      ?auto_509137 - BLOCK
      ?auto_509138 - BLOCK
    )
    :vars
    (
      ?auto_509139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509138 ?auto_509139 ) ( ON-TABLE ?auto_509133 ) ( ON ?auto_509134 ?auto_509133 ) ( ON ?auto_509135 ?auto_509134 ) ( ON ?auto_509136 ?auto_509135 ) ( not ( = ?auto_509133 ?auto_509134 ) ) ( not ( = ?auto_509133 ?auto_509135 ) ) ( not ( = ?auto_509133 ?auto_509136 ) ) ( not ( = ?auto_509133 ?auto_509137 ) ) ( not ( = ?auto_509133 ?auto_509138 ) ) ( not ( = ?auto_509133 ?auto_509139 ) ) ( not ( = ?auto_509134 ?auto_509135 ) ) ( not ( = ?auto_509134 ?auto_509136 ) ) ( not ( = ?auto_509134 ?auto_509137 ) ) ( not ( = ?auto_509134 ?auto_509138 ) ) ( not ( = ?auto_509134 ?auto_509139 ) ) ( not ( = ?auto_509135 ?auto_509136 ) ) ( not ( = ?auto_509135 ?auto_509137 ) ) ( not ( = ?auto_509135 ?auto_509138 ) ) ( not ( = ?auto_509135 ?auto_509139 ) ) ( not ( = ?auto_509136 ?auto_509137 ) ) ( not ( = ?auto_509136 ?auto_509138 ) ) ( not ( = ?auto_509136 ?auto_509139 ) ) ( not ( = ?auto_509137 ?auto_509138 ) ) ( not ( = ?auto_509137 ?auto_509139 ) ) ( not ( = ?auto_509138 ?auto_509139 ) ) ( CLEAR ?auto_509136 ) ( ON ?auto_509137 ?auto_509138 ) ( CLEAR ?auto_509137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_509133 ?auto_509134 ?auto_509135 ?auto_509136 ?auto_509137 )
      ( MAKE-6PILE ?auto_509133 ?auto_509134 ?auto_509135 ?auto_509136 ?auto_509137 ?auto_509138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_509159 - BLOCK
      ?auto_509160 - BLOCK
      ?auto_509161 - BLOCK
      ?auto_509162 - BLOCK
      ?auto_509163 - BLOCK
      ?auto_509164 - BLOCK
    )
    :vars
    (
      ?auto_509165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509164 ?auto_509165 ) ( ON-TABLE ?auto_509159 ) ( ON ?auto_509160 ?auto_509159 ) ( ON ?auto_509161 ?auto_509160 ) ( not ( = ?auto_509159 ?auto_509160 ) ) ( not ( = ?auto_509159 ?auto_509161 ) ) ( not ( = ?auto_509159 ?auto_509162 ) ) ( not ( = ?auto_509159 ?auto_509163 ) ) ( not ( = ?auto_509159 ?auto_509164 ) ) ( not ( = ?auto_509159 ?auto_509165 ) ) ( not ( = ?auto_509160 ?auto_509161 ) ) ( not ( = ?auto_509160 ?auto_509162 ) ) ( not ( = ?auto_509160 ?auto_509163 ) ) ( not ( = ?auto_509160 ?auto_509164 ) ) ( not ( = ?auto_509160 ?auto_509165 ) ) ( not ( = ?auto_509161 ?auto_509162 ) ) ( not ( = ?auto_509161 ?auto_509163 ) ) ( not ( = ?auto_509161 ?auto_509164 ) ) ( not ( = ?auto_509161 ?auto_509165 ) ) ( not ( = ?auto_509162 ?auto_509163 ) ) ( not ( = ?auto_509162 ?auto_509164 ) ) ( not ( = ?auto_509162 ?auto_509165 ) ) ( not ( = ?auto_509163 ?auto_509164 ) ) ( not ( = ?auto_509163 ?auto_509165 ) ) ( not ( = ?auto_509164 ?auto_509165 ) ) ( ON ?auto_509163 ?auto_509164 ) ( CLEAR ?auto_509161 ) ( ON ?auto_509162 ?auto_509163 ) ( CLEAR ?auto_509162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_509159 ?auto_509160 ?auto_509161 ?auto_509162 )
      ( MAKE-6PILE ?auto_509159 ?auto_509160 ?auto_509161 ?auto_509162 ?auto_509163 ?auto_509164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_509185 - BLOCK
      ?auto_509186 - BLOCK
      ?auto_509187 - BLOCK
      ?auto_509188 - BLOCK
      ?auto_509189 - BLOCK
      ?auto_509190 - BLOCK
    )
    :vars
    (
      ?auto_509191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509190 ?auto_509191 ) ( ON-TABLE ?auto_509185 ) ( ON ?auto_509186 ?auto_509185 ) ( not ( = ?auto_509185 ?auto_509186 ) ) ( not ( = ?auto_509185 ?auto_509187 ) ) ( not ( = ?auto_509185 ?auto_509188 ) ) ( not ( = ?auto_509185 ?auto_509189 ) ) ( not ( = ?auto_509185 ?auto_509190 ) ) ( not ( = ?auto_509185 ?auto_509191 ) ) ( not ( = ?auto_509186 ?auto_509187 ) ) ( not ( = ?auto_509186 ?auto_509188 ) ) ( not ( = ?auto_509186 ?auto_509189 ) ) ( not ( = ?auto_509186 ?auto_509190 ) ) ( not ( = ?auto_509186 ?auto_509191 ) ) ( not ( = ?auto_509187 ?auto_509188 ) ) ( not ( = ?auto_509187 ?auto_509189 ) ) ( not ( = ?auto_509187 ?auto_509190 ) ) ( not ( = ?auto_509187 ?auto_509191 ) ) ( not ( = ?auto_509188 ?auto_509189 ) ) ( not ( = ?auto_509188 ?auto_509190 ) ) ( not ( = ?auto_509188 ?auto_509191 ) ) ( not ( = ?auto_509189 ?auto_509190 ) ) ( not ( = ?auto_509189 ?auto_509191 ) ) ( not ( = ?auto_509190 ?auto_509191 ) ) ( ON ?auto_509189 ?auto_509190 ) ( ON ?auto_509188 ?auto_509189 ) ( CLEAR ?auto_509186 ) ( ON ?auto_509187 ?auto_509188 ) ( CLEAR ?auto_509187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_509185 ?auto_509186 ?auto_509187 )
      ( MAKE-6PILE ?auto_509185 ?auto_509186 ?auto_509187 ?auto_509188 ?auto_509189 ?auto_509190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_509211 - BLOCK
      ?auto_509212 - BLOCK
      ?auto_509213 - BLOCK
      ?auto_509214 - BLOCK
      ?auto_509215 - BLOCK
      ?auto_509216 - BLOCK
    )
    :vars
    (
      ?auto_509217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509216 ?auto_509217 ) ( ON-TABLE ?auto_509211 ) ( not ( = ?auto_509211 ?auto_509212 ) ) ( not ( = ?auto_509211 ?auto_509213 ) ) ( not ( = ?auto_509211 ?auto_509214 ) ) ( not ( = ?auto_509211 ?auto_509215 ) ) ( not ( = ?auto_509211 ?auto_509216 ) ) ( not ( = ?auto_509211 ?auto_509217 ) ) ( not ( = ?auto_509212 ?auto_509213 ) ) ( not ( = ?auto_509212 ?auto_509214 ) ) ( not ( = ?auto_509212 ?auto_509215 ) ) ( not ( = ?auto_509212 ?auto_509216 ) ) ( not ( = ?auto_509212 ?auto_509217 ) ) ( not ( = ?auto_509213 ?auto_509214 ) ) ( not ( = ?auto_509213 ?auto_509215 ) ) ( not ( = ?auto_509213 ?auto_509216 ) ) ( not ( = ?auto_509213 ?auto_509217 ) ) ( not ( = ?auto_509214 ?auto_509215 ) ) ( not ( = ?auto_509214 ?auto_509216 ) ) ( not ( = ?auto_509214 ?auto_509217 ) ) ( not ( = ?auto_509215 ?auto_509216 ) ) ( not ( = ?auto_509215 ?auto_509217 ) ) ( not ( = ?auto_509216 ?auto_509217 ) ) ( ON ?auto_509215 ?auto_509216 ) ( ON ?auto_509214 ?auto_509215 ) ( ON ?auto_509213 ?auto_509214 ) ( CLEAR ?auto_509211 ) ( ON ?auto_509212 ?auto_509213 ) ( CLEAR ?auto_509212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_509211 ?auto_509212 )
      ( MAKE-6PILE ?auto_509211 ?auto_509212 ?auto_509213 ?auto_509214 ?auto_509215 ?auto_509216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_509237 - BLOCK
      ?auto_509238 - BLOCK
      ?auto_509239 - BLOCK
      ?auto_509240 - BLOCK
      ?auto_509241 - BLOCK
      ?auto_509242 - BLOCK
    )
    :vars
    (
      ?auto_509243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509242 ?auto_509243 ) ( not ( = ?auto_509237 ?auto_509238 ) ) ( not ( = ?auto_509237 ?auto_509239 ) ) ( not ( = ?auto_509237 ?auto_509240 ) ) ( not ( = ?auto_509237 ?auto_509241 ) ) ( not ( = ?auto_509237 ?auto_509242 ) ) ( not ( = ?auto_509237 ?auto_509243 ) ) ( not ( = ?auto_509238 ?auto_509239 ) ) ( not ( = ?auto_509238 ?auto_509240 ) ) ( not ( = ?auto_509238 ?auto_509241 ) ) ( not ( = ?auto_509238 ?auto_509242 ) ) ( not ( = ?auto_509238 ?auto_509243 ) ) ( not ( = ?auto_509239 ?auto_509240 ) ) ( not ( = ?auto_509239 ?auto_509241 ) ) ( not ( = ?auto_509239 ?auto_509242 ) ) ( not ( = ?auto_509239 ?auto_509243 ) ) ( not ( = ?auto_509240 ?auto_509241 ) ) ( not ( = ?auto_509240 ?auto_509242 ) ) ( not ( = ?auto_509240 ?auto_509243 ) ) ( not ( = ?auto_509241 ?auto_509242 ) ) ( not ( = ?auto_509241 ?auto_509243 ) ) ( not ( = ?auto_509242 ?auto_509243 ) ) ( ON ?auto_509241 ?auto_509242 ) ( ON ?auto_509240 ?auto_509241 ) ( ON ?auto_509239 ?auto_509240 ) ( ON ?auto_509238 ?auto_509239 ) ( ON ?auto_509237 ?auto_509238 ) ( CLEAR ?auto_509237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_509237 )
      ( MAKE-6PILE ?auto_509237 ?auto_509238 ?auto_509239 ?auto_509240 ?auto_509241 ?auto_509242 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509264 - BLOCK
      ?auto_509265 - BLOCK
      ?auto_509266 - BLOCK
      ?auto_509267 - BLOCK
      ?auto_509268 - BLOCK
      ?auto_509269 - BLOCK
      ?auto_509270 - BLOCK
    )
    :vars
    (
      ?auto_509271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_509269 ) ( ON ?auto_509270 ?auto_509271 ) ( CLEAR ?auto_509270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_509264 ) ( ON ?auto_509265 ?auto_509264 ) ( ON ?auto_509266 ?auto_509265 ) ( ON ?auto_509267 ?auto_509266 ) ( ON ?auto_509268 ?auto_509267 ) ( ON ?auto_509269 ?auto_509268 ) ( not ( = ?auto_509264 ?auto_509265 ) ) ( not ( = ?auto_509264 ?auto_509266 ) ) ( not ( = ?auto_509264 ?auto_509267 ) ) ( not ( = ?auto_509264 ?auto_509268 ) ) ( not ( = ?auto_509264 ?auto_509269 ) ) ( not ( = ?auto_509264 ?auto_509270 ) ) ( not ( = ?auto_509264 ?auto_509271 ) ) ( not ( = ?auto_509265 ?auto_509266 ) ) ( not ( = ?auto_509265 ?auto_509267 ) ) ( not ( = ?auto_509265 ?auto_509268 ) ) ( not ( = ?auto_509265 ?auto_509269 ) ) ( not ( = ?auto_509265 ?auto_509270 ) ) ( not ( = ?auto_509265 ?auto_509271 ) ) ( not ( = ?auto_509266 ?auto_509267 ) ) ( not ( = ?auto_509266 ?auto_509268 ) ) ( not ( = ?auto_509266 ?auto_509269 ) ) ( not ( = ?auto_509266 ?auto_509270 ) ) ( not ( = ?auto_509266 ?auto_509271 ) ) ( not ( = ?auto_509267 ?auto_509268 ) ) ( not ( = ?auto_509267 ?auto_509269 ) ) ( not ( = ?auto_509267 ?auto_509270 ) ) ( not ( = ?auto_509267 ?auto_509271 ) ) ( not ( = ?auto_509268 ?auto_509269 ) ) ( not ( = ?auto_509268 ?auto_509270 ) ) ( not ( = ?auto_509268 ?auto_509271 ) ) ( not ( = ?auto_509269 ?auto_509270 ) ) ( not ( = ?auto_509269 ?auto_509271 ) ) ( not ( = ?auto_509270 ?auto_509271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509270 ?auto_509271 )
      ( !STACK ?auto_509270 ?auto_509269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509294 - BLOCK
      ?auto_509295 - BLOCK
      ?auto_509296 - BLOCK
      ?auto_509297 - BLOCK
      ?auto_509298 - BLOCK
      ?auto_509299 - BLOCK
      ?auto_509300 - BLOCK
    )
    :vars
    (
      ?auto_509301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509300 ?auto_509301 ) ( ON-TABLE ?auto_509294 ) ( ON ?auto_509295 ?auto_509294 ) ( ON ?auto_509296 ?auto_509295 ) ( ON ?auto_509297 ?auto_509296 ) ( ON ?auto_509298 ?auto_509297 ) ( not ( = ?auto_509294 ?auto_509295 ) ) ( not ( = ?auto_509294 ?auto_509296 ) ) ( not ( = ?auto_509294 ?auto_509297 ) ) ( not ( = ?auto_509294 ?auto_509298 ) ) ( not ( = ?auto_509294 ?auto_509299 ) ) ( not ( = ?auto_509294 ?auto_509300 ) ) ( not ( = ?auto_509294 ?auto_509301 ) ) ( not ( = ?auto_509295 ?auto_509296 ) ) ( not ( = ?auto_509295 ?auto_509297 ) ) ( not ( = ?auto_509295 ?auto_509298 ) ) ( not ( = ?auto_509295 ?auto_509299 ) ) ( not ( = ?auto_509295 ?auto_509300 ) ) ( not ( = ?auto_509295 ?auto_509301 ) ) ( not ( = ?auto_509296 ?auto_509297 ) ) ( not ( = ?auto_509296 ?auto_509298 ) ) ( not ( = ?auto_509296 ?auto_509299 ) ) ( not ( = ?auto_509296 ?auto_509300 ) ) ( not ( = ?auto_509296 ?auto_509301 ) ) ( not ( = ?auto_509297 ?auto_509298 ) ) ( not ( = ?auto_509297 ?auto_509299 ) ) ( not ( = ?auto_509297 ?auto_509300 ) ) ( not ( = ?auto_509297 ?auto_509301 ) ) ( not ( = ?auto_509298 ?auto_509299 ) ) ( not ( = ?auto_509298 ?auto_509300 ) ) ( not ( = ?auto_509298 ?auto_509301 ) ) ( not ( = ?auto_509299 ?auto_509300 ) ) ( not ( = ?auto_509299 ?auto_509301 ) ) ( not ( = ?auto_509300 ?auto_509301 ) ) ( CLEAR ?auto_509298 ) ( ON ?auto_509299 ?auto_509300 ) ( CLEAR ?auto_509299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_509294 ?auto_509295 ?auto_509296 ?auto_509297 ?auto_509298 ?auto_509299 )
      ( MAKE-7PILE ?auto_509294 ?auto_509295 ?auto_509296 ?auto_509297 ?auto_509298 ?auto_509299 ?auto_509300 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509324 - BLOCK
      ?auto_509325 - BLOCK
      ?auto_509326 - BLOCK
      ?auto_509327 - BLOCK
      ?auto_509328 - BLOCK
      ?auto_509329 - BLOCK
      ?auto_509330 - BLOCK
    )
    :vars
    (
      ?auto_509331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509330 ?auto_509331 ) ( ON-TABLE ?auto_509324 ) ( ON ?auto_509325 ?auto_509324 ) ( ON ?auto_509326 ?auto_509325 ) ( ON ?auto_509327 ?auto_509326 ) ( not ( = ?auto_509324 ?auto_509325 ) ) ( not ( = ?auto_509324 ?auto_509326 ) ) ( not ( = ?auto_509324 ?auto_509327 ) ) ( not ( = ?auto_509324 ?auto_509328 ) ) ( not ( = ?auto_509324 ?auto_509329 ) ) ( not ( = ?auto_509324 ?auto_509330 ) ) ( not ( = ?auto_509324 ?auto_509331 ) ) ( not ( = ?auto_509325 ?auto_509326 ) ) ( not ( = ?auto_509325 ?auto_509327 ) ) ( not ( = ?auto_509325 ?auto_509328 ) ) ( not ( = ?auto_509325 ?auto_509329 ) ) ( not ( = ?auto_509325 ?auto_509330 ) ) ( not ( = ?auto_509325 ?auto_509331 ) ) ( not ( = ?auto_509326 ?auto_509327 ) ) ( not ( = ?auto_509326 ?auto_509328 ) ) ( not ( = ?auto_509326 ?auto_509329 ) ) ( not ( = ?auto_509326 ?auto_509330 ) ) ( not ( = ?auto_509326 ?auto_509331 ) ) ( not ( = ?auto_509327 ?auto_509328 ) ) ( not ( = ?auto_509327 ?auto_509329 ) ) ( not ( = ?auto_509327 ?auto_509330 ) ) ( not ( = ?auto_509327 ?auto_509331 ) ) ( not ( = ?auto_509328 ?auto_509329 ) ) ( not ( = ?auto_509328 ?auto_509330 ) ) ( not ( = ?auto_509328 ?auto_509331 ) ) ( not ( = ?auto_509329 ?auto_509330 ) ) ( not ( = ?auto_509329 ?auto_509331 ) ) ( not ( = ?auto_509330 ?auto_509331 ) ) ( ON ?auto_509329 ?auto_509330 ) ( CLEAR ?auto_509327 ) ( ON ?auto_509328 ?auto_509329 ) ( CLEAR ?auto_509328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_509324 ?auto_509325 ?auto_509326 ?auto_509327 ?auto_509328 )
      ( MAKE-7PILE ?auto_509324 ?auto_509325 ?auto_509326 ?auto_509327 ?auto_509328 ?auto_509329 ?auto_509330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509354 - BLOCK
      ?auto_509355 - BLOCK
      ?auto_509356 - BLOCK
      ?auto_509357 - BLOCK
      ?auto_509358 - BLOCK
      ?auto_509359 - BLOCK
      ?auto_509360 - BLOCK
    )
    :vars
    (
      ?auto_509361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509360 ?auto_509361 ) ( ON-TABLE ?auto_509354 ) ( ON ?auto_509355 ?auto_509354 ) ( ON ?auto_509356 ?auto_509355 ) ( not ( = ?auto_509354 ?auto_509355 ) ) ( not ( = ?auto_509354 ?auto_509356 ) ) ( not ( = ?auto_509354 ?auto_509357 ) ) ( not ( = ?auto_509354 ?auto_509358 ) ) ( not ( = ?auto_509354 ?auto_509359 ) ) ( not ( = ?auto_509354 ?auto_509360 ) ) ( not ( = ?auto_509354 ?auto_509361 ) ) ( not ( = ?auto_509355 ?auto_509356 ) ) ( not ( = ?auto_509355 ?auto_509357 ) ) ( not ( = ?auto_509355 ?auto_509358 ) ) ( not ( = ?auto_509355 ?auto_509359 ) ) ( not ( = ?auto_509355 ?auto_509360 ) ) ( not ( = ?auto_509355 ?auto_509361 ) ) ( not ( = ?auto_509356 ?auto_509357 ) ) ( not ( = ?auto_509356 ?auto_509358 ) ) ( not ( = ?auto_509356 ?auto_509359 ) ) ( not ( = ?auto_509356 ?auto_509360 ) ) ( not ( = ?auto_509356 ?auto_509361 ) ) ( not ( = ?auto_509357 ?auto_509358 ) ) ( not ( = ?auto_509357 ?auto_509359 ) ) ( not ( = ?auto_509357 ?auto_509360 ) ) ( not ( = ?auto_509357 ?auto_509361 ) ) ( not ( = ?auto_509358 ?auto_509359 ) ) ( not ( = ?auto_509358 ?auto_509360 ) ) ( not ( = ?auto_509358 ?auto_509361 ) ) ( not ( = ?auto_509359 ?auto_509360 ) ) ( not ( = ?auto_509359 ?auto_509361 ) ) ( not ( = ?auto_509360 ?auto_509361 ) ) ( ON ?auto_509359 ?auto_509360 ) ( ON ?auto_509358 ?auto_509359 ) ( CLEAR ?auto_509356 ) ( ON ?auto_509357 ?auto_509358 ) ( CLEAR ?auto_509357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_509354 ?auto_509355 ?auto_509356 ?auto_509357 )
      ( MAKE-7PILE ?auto_509354 ?auto_509355 ?auto_509356 ?auto_509357 ?auto_509358 ?auto_509359 ?auto_509360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509384 - BLOCK
      ?auto_509385 - BLOCK
      ?auto_509386 - BLOCK
      ?auto_509387 - BLOCK
      ?auto_509388 - BLOCK
      ?auto_509389 - BLOCK
      ?auto_509390 - BLOCK
    )
    :vars
    (
      ?auto_509391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509390 ?auto_509391 ) ( ON-TABLE ?auto_509384 ) ( ON ?auto_509385 ?auto_509384 ) ( not ( = ?auto_509384 ?auto_509385 ) ) ( not ( = ?auto_509384 ?auto_509386 ) ) ( not ( = ?auto_509384 ?auto_509387 ) ) ( not ( = ?auto_509384 ?auto_509388 ) ) ( not ( = ?auto_509384 ?auto_509389 ) ) ( not ( = ?auto_509384 ?auto_509390 ) ) ( not ( = ?auto_509384 ?auto_509391 ) ) ( not ( = ?auto_509385 ?auto_509386 ) ) ( not ( = ?auto_509385 ?auto_509387 ) ) ( not ( = ?auto_509385 ?auto_509388 ) ) ( not ( = ?auto_509385 ?auto_509389 ) ) ( not ( = ?auto_509385 ?auto_509390 ) ) ( not ( = ?auto_509385 ?auto_509391 ) ) ( not ( = ?auto_509386 ?auto_509387 ) ) ( not ( = ?auto_509386 ?auto_509388 ) ) ( not ( = ?auto_509386 ?auto_509389 ) ) ( not ( = ?auto_509386 ?auto_509390 ) ) ( not ( = ?auto_509386 ?auto_509391 ) ) ( not ( = ?auto_509387 ?auto_509388 ) ) ( not ( = ?auto_509387 ?auto_509389 ) ) ( not ( = ?auto_509387 ?auto_509390 ) ) ( not ( = ?auto_509387 ?auto_509391 ) ) ( not ( = ?auto_509388 ?auto_509389 ) ) ( not ( = ?auto_509388 ?auto_509390 ) ) ( not ( = ?auto_509388 ?auto_509391 ) ) ( not ( = ?auto_509389 ?auto_509390 ) ) ( not ( = ?auto_509389 ?auto_509391 ) ) ( not ( = ?auto_509390 ?auto_509391 ) ) ( ON ?auto_509389 ?auto_509390 ) ( ON ?auto_509388 ?auto_509389 ) ( ON ?auto_509387 ?auto_509388 ) ( CLEAR ?auto_509385 ) ( ON ?auto_509386 ?auto_509387 ) ( CLEAR ?auto_509386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_509384 ?auto_509385 ?auto_509386 )
      ( MAKE-7PILE ?auto_509384 ?auto_509385 ?auto_509386 ?auto_509387 ?auto_509388 ?auto_509389 ?auto_509390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509414 - BLOCK
      ?auto_509415 - BLOCK
      ?auto_509416 - BLOCK
      ?auto_509417 - BLOCK
      ?auto_509418 - BLOCK
      ?auto_509419 - BLOCK
      ?auto_509420 - BLOCK
    )
    :vars
    (
      ?auto_509421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509420 ?auto_509421 ) ( ON-TABLE ?auto_509414 ) ( not ( = ?auto_509414 ?auto_509415 ) ) ( not ( = ?auto_509414 ?auto_509416 ) ) ( not ( = ?auto_509414 ?auto_509417 ) ) ( not ( = ?auto_509414 ?auto_509418 ) ) ( not ( = ?auto_509414 ?auto_509419 ) ) ( not ( = ?auto_509414 ?auto_509420 ) ) ( not ( = ?auto_509414 ?auto_509421 ) ) ( not ( = ?auto_509415 ?auto_509416 ) ) ( not ( = ?auto_509415 ?auto_509417 ) ) ( not ( = ?auto_509415 ?auto_509418 ) ) ( not ( = ?auto_509415 ?auto_509419 ) ) ( not ( = ?auto_509415 ?auto_509420 ) ) ( not ( = ?auto_509415 ?auto_509421 ) ) ( not ( = ?auto_509416 ?auto_509417 ) ) ( not ( = ?auto_509416 ?auto_509418 ) ) ( not ( = ?auto_509416 ?auto_509419 ) ) ( not ( = ?auto_509416 ?auto_509420 ) ) ( not ( = ?auto_509416 ?auto_509421 ) ) ( not ( = ?auto_509417 ?auto_509418 ) ) ( not ( = ?auto_509417 ?auto_509419 ) ) ( not ( = ?auto_509417 ?auto_509420 ) ) ( not ( = ?auto_509417 ?auto_509421 ) ) ( not ( = ?auto_509418 ?auto_509419 ) ) ( not ( = ?auto_509418 ?auto_509420 ) ) ( not ( = ?auto_509418 ?auto_509421 ) ) ( not ( = ?auto_509419 ?auto_509420 ) ) ( not ( = ?auto_509419 ?auto_509421 ) ) ( not ( = ?auto_509420 ?auto_509421 ) ) ( ON ?auto_509419 ?auto_509420 ) ( ON ?auto_509418 ?auto_509419 ) ( ON ?auto_509417 ?auto_509418 ) ( ON ?auto_509416 ?auto_509417 ) ( CLEAR ?auto_509414 ) ( ON ?auto_509415 ?auto_509416 ) ( CLEAR ?auto_509415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_509414 ?auto_509415 )
      ( MAKE-7PILE ?auto_509414 ?auto_509415 ?auto_509416 ?auto_509417 ?auto_509418 ?auto_509419 ?auto_509420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_509444 - BLOCK
      ?auto_509445 - BLOCK
      ?auto_509446 - BLOCK
      ?auto_509447 - BLOCK
      ?auto_509448 - BLOCK
      ?auto_509449 - BLOCK
      ?auto_509450 - BLOCK
    )
    :vars
    (
      ?auto_509451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509450 ?auto_509451 ) ( not ( = ?auto_509444 ?auto_509445 ) ) ( not ( = ?auto_509444 ?auto_509446 ) ) ( not ( = ?auto_509444 ?auto_509447 ) ) ( not ( = ?auto_509444 ?auto_509448 ) ) ( not ( = ?auto_509444 ?auto_509449 ) ) ( not ( = ?auto_509444 ?auto_509450 ) ) ( not ( = ?auto_509444 ?auto_509451 ) ) ( not ( = ?auto_509445 ?auto_509446 ) ) ( not ( = ?auto_509445 ?auto_509447 ) ) ( not ( = ?auto_509445 ?auto_509448 ) ) ( not ( = ?auto_509445 ?auto_509449 ) ) ( not ( = ?auto_509445 ?auto_509450 ) ) ( not ( = ?auto_509445 ?auto_509451 ) ) ( not ( = ?auto_509446 ?auto_509447 ) ) ( not ( = ?auto_509446 ?auto_509448 ) ) ( not ( = ?auto_509446 ?auto_509449 ) ) ( not ( = ?auto_509446 ?auto_509450 ) ) ( not ( = ?auto_509446 ?auto_509451 ) ) ( not ( = ?auto_509447 ?auto_509448 ) ) ( not ( = ?auto_509447 ?auto_509449 ) ) ( not ( = ?auto_509447 ?auto_509450 ) ) ( not ( = ?auto_509447 ?auto_509451 ) ) ( not ( = ?auto_509448 ?auto_509449 ) ) ( not ( = ?auto_509448 ?auto_509450 ) ) ( not ( = ?auto_509448 ?auto_509451 ) ) ( not ( = ?auto_509449 ?auto_509450 ) ) ( not ( = ?auto_509449 ?auto_509451 ) ) ( not ( = ?auto_509450 ?auto_509451 ) ) ( ON ?auto_509449 ?auto_509450 ) ( ON ?auto_509448 ?auto_509449 ) ( ON ?auto_509447 ?auto_509448 ) ( ON ?auto_509446 ?auto_509447 ) ( ON ?auto_509445 ?auto_509446 ) ( ON ?auto_509444 ?auto_509445 ) ( CLEAR ?auto_509444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_509444 )
      ( MAKE-7PILE ?auto_509444 ?auto_509445 ?auto_509446 ?auto_509447 ?auto_509448 ?auto_509449 ?auto_509450 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509475 - BLOCK
      ?auto_509476 - BLOCK
      ?auto_509477 - BLOCK
      ?auto_509478 - BLOCK
      ?auto_509479 - BLOCK
      ?auto_509480 - BLOCK
      ?auto_509481 - BLOCK
      ?auto_509482 - BLOCK
    )
    :vars
    (
      ?auto_509483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_509481 ) ( ON ?auto_509482 ?auto_509483 ) ( CLEAR ?auto_509482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_509475 ) ( ON ?auto_509476 ?auto_509475 ) ( ON ?auto_509477 ?auto_509476 ) ( ON ?auto_509478 ?auto_509477 ) ( ON ?auto_509479 ?auto_509478 ) ( ON ?auto_509480 ?auto_509479 ) ( ON ?auto_509481 ?auto_509480 ) ( not ( = ?auto_509475 ?auto_509476 ) ) ( not ( = ?auto_509475 ?auto_509477 ) ) ( not ( = ?auto_509475 ?auto_509478 ) ) ( not ( = ?auto_509475 ?auto_509479 ) ) ( not ( = ?auto_509475 ?auto_509480 ) ) ( not ( = ?auto_509475 ?auto_509481 ) ) ( not ( = ?auto_509475 ?auto_509482 ) ) ( not ( = ?auto_509475 ?auto_509483 ) ) ( not ( = ?auto_509476 ?auto_509477 ) ) ( not ( = ?auto_509476 ?auto_509478 ) ) ( not ( = ?auto_509476 ?auto_509479 ) ) ( not ( = ?auto_509476 ?auto_509480 ) ) ( not ( = ?auto_509476 ?auto_509481 ) ) ( not ( = ?auto_509476 ?auto_509482 ) ) ( not ( = ?auto_509476 ?auto_509483 ) ) ( not ( = ?auto_509477 ?auto_509478 ) ) ( not ( = ?auto_509477 ?auto_509479 ) ) ( not ( = ?auto_509477 ?auto_509480 ) ) ( not ( = ?auto_509477 ?auto_509481 ) ) ( not ( = ?auto_509477 ?auto_509482 ) ) ( not ( = ?auto_509477 ?auto_509483 ) ) ( not ( = ?auto_509478 ?auto_509479 ) ) ( not ( = ?auto_509478 ?auto_509480 ) ) ( not ( = ?auto_509478 ?auto_509481 ) ) ( not ( = ?auto_509478 ?auto_509482 ) ) ( not ( = ?auto_509478 ?auto_509483 ) ) ( not ( = ?auto_509479 ?auto_509480 ) ) ( not ( = ?auto_509479 ?auto_509481 ) ) ( not ( = ?auto_509479 ?auto_509482 ) ) ( not ( = ?auto_509479 ?auto_509483 ) ) ( not ( = ?auto_509480 ?auto_509481 ) ) ( not ( = ?auto_509480 ?auto_509482 ) ) ( not ( = ?auto_509480 ?auto_509483 ) ) ( not ( = ?auto_509481 ?auto_509482 ) ) ( not ( = ?auto_509481 ?auto_509483 ) ) ( not ( = ?auto_509482 ?auto_509483 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509482 ?auto_509483 )
      ( !STACK ?auto_509482 ?auto_509481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509509 - BLOCK
      ?auto_509510 - BLOCK
      ?auto_509511 - BLOCK
      ?auto_509512 - BLOCK
      ?auto_509513 - BLOCK
      ?auto_509514 - BLOCK
      ?auto_509515 - BLOCK
      ?auto_509516 - BLOCK
    )
    :vars
    (
      ?auto_509517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509516 ?auto_509517 ) ( ON-TABLE ?auto_509509 ) ( ON ?auto_509510 ?auto_509509 ) ( ON ?auto_509511 ?auto_509510 ) ( ON ?auto_509512 ?auto_509511 ) ( ON ?auto_509513 ?auto_509512 ) ( ON ?auto_509514 ?auto_509513 ) ( not ( = ?auto_509509 ?auto_509510 ) ) ( not ( = ?auto_509509 ?auto_509511 ) ) ( not ( = ?auto_509509 ?auto_509512 ) ) ( not ( = ?auto_509509 ?auto_509513 ) ) ( not ( = ?auto_509509 ?auto_509514 ) ) ( not ( = ?auto_509509 ?auto_509515 ) ) ( not ( = ?auto_509509 ?auto_509516 ) ) ( not ( = ?auto_509509 ?auto_509517 ) ) ( not ( = ?auto_509510 ?auto_509511 ) ) ( not ( = ?auto_509510 ?auto_509512 ) ) ( not ( = ?auto_509510 ?auto_509513 ) ) ( not ( = ?auto_509510 ?auto_509514 ) ) ( not ( = ?auto_509510 ?auto_509515 ) ) ( not ( = ?auto_509510 ?auto_509516 ) ) ( not ( = ?auto_509510 ?auto_509517 ) ) ( not ( = ?auto_509511 ?auto_509512 ) ) ( not ( = ?auto_509511 ?auto_509513 ) ) ( not ( = ?auto_509511 ?auto_509514 ) ) ( not ( = ?auto_509511 ?auto_509515 ) ) ( not ( = ?auto_509511 ?auto_509516 ) ) ( not ( = ?auto_509511 ?auto_509517 ) ) ( not ( = ?auto_509512 ?auto_509513 ) ) ( not ( = ?auto_509512 ?auto_509514 ) ) ( not ( = ?auto_509512 ?auto_509515 ) ) ( not ( = ?auto_509512 ?auto_509516 ) ) ( not ( = ?auto_509512 ?auto_509517 ) ) ( not ( = ?auto_509513 ?auto_509514 ) ) ( not ( = ?auto_509513 ?auto_509515 ) ) ( not ( = ?auto_509513 ?auto_509516 ) ) ( not ( = ?auto_509513 ?auto_509517 ) ) ( not ( = ?auto_509514 ?auto_509515 ) ) ( not ( = ?auto_509514 ?auto_509516 ) ) ( not ( = ?auto_509514 ?auto_509517 ) ) ( not ( = ?auto_509515 ?auto_509516 ) ) ( not ( = ?auto_509515 ?auto_509517 ) ) ( not ( = ?auto_509516 ?auto_509517 ) ) ( CLEAR ?auto_509514 ) ( ON ?auto_509515 ?auto_509516 ) ( CLEAR ?auto_509515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_509509 ?auto_509510 ?auto_509511 ?auto_509512 ?auto_509513 ?auto_509514 ?auto_509515 )
      ( MAKE-8PILE ?auto_509509 ?auto_509510 ?auto_509511 ?auto_509512 ?auto_509513 ?auto_509514 ?auto_509515 ?auto_509516 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509543 - BLOCK
      ?auto_509544 - BLOCK
      ?auto_509545 - BLOCK
      ?auto_509546 - BLOCK
      ?auto_509547 - BLOCK
      ?auto_509548 - BLOCK
      ?auto_509549 - BLOCK
      ?auto_509550 - BLOCK
    )
    :vars
    (
      ?auto_509551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509550 ?auto_509551 ) ( ON-TABLE ?auto_509543 ) ( ON ?auto_509544 ?auto_509543 ) ( ON ?auto_509545 ?auto_509544 ) ( ON ?auto_509546 ?auto_509545 ) ( ON ?auto_509547 ?auto_509546 ) ( not ( = ?auto_509543 ?auto_509544 ) ) ( not ( = ?auto_509543 ?auto_509545 ) ) ( not ( = ?auto_509543 ?auto_509546 ) ) ( not ( = ?auto_509543 ?auto_509547 ) ) ( not ( = ?auto_509543 ?auto_509548 ) ) ( not ( = ?auto_509543 ?auto_509549 ) ) ( not ( = ?auto_509543 ?auto_509550 ) ) ( not ( = ?auto_509543 ?auto_509551 ) ) ( not ( = ?auto_509544 ?auto_509545 ) ) ( not ( = ?auto_509544 ?auto_509546 ) ) ( not ( = ?auto_509544 ?auto_509547 ) ) ( not ( = ?auto_509544 ?auto_509548 ) ) ( not ( = ?auto_509544 ?auto_509549 ) ) ( not ( = ?auto_509544 ?auto_509550 ) ) ( not ( = ?auto_509544 ?auto_509551 ) ) ( not ( = ?auto_509545 ?auto_509546 ) ) ( not ( = ?auto_509545 ?auto_509547 ) ) ( not ( = ?auto_509545 ?auto_509548 ) ) ( not ( = ?auto_509545 ?auto_509549 ) ) ( not ( = ?auto_509545 ?auto_509550 ) ) ( not ( = ?auto_509545 ?auto_509551 ) ) ( not ( = ?auto_509546 ?auto_509547 ) ) ( not ( = ?auto_509546 ?auto_509548 ) ) ( not ( = ?auto_509546 ?auto_509549 ) ) ( not ( = ?auto_509546 ?auto_509550 ) ) ( not ( = ?auto_509546 ?auto_509551 ) ) ( not ( = ?auto_509547 ?auto_509548 ) ) ( not ( = ?auto_509547 ?auto_509549 ) ) ( not ( = ?auto_509547 ?auto_509550 ) ) ( not ( = ?auto_509547 ?auto_509551 ) ) ( not ( = ?auto_509548 ?auto_509549 ) ) ( not ( = ?auto_509548 ?auto_509550 ) ) ( not ( = ?auto_509548 ?auto_509551 ) ) ( not ( = ?auto_509549 ?auto_509550 ) ) ( not ( = ?auto_509549 ?auto_509551 ) ) ( not ( = ?auto_509550 ?auto_509551 ) ) ( ON ?auto_509549 ?auto_509550 ) ( CLEAR ?auto_509547 ) ( ON ?auto_509548 ?auto_509549 ) ( CLEAR ?auto_509548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_509543 ?auto_509544 ?auto_509545 ?auto_509546 ?auto_509547 ?auto_509548 )
      ( MAKE-8PILE ?auto_509543 ?auto_509544 ?auto_509545 ?auto_509546 ?auto_509547 ?auto_509548 ?auto_509549 ?auto_509550 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509577 - BLOCK
      ?auto_509578 - BLOCK
      ?auto_509579 - BLOCK
      ?auto_509580 - BLOCK
      ?auto_509581 - BLOCK
      ?auto_509582 - BLOCK
      ?auto_509583 - BLOCK
      ?auto_509584 - BLOCK
    )
    :vars
    (
      ?auto_509585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509584 ?auto_509585 ) ( ON-TABLE ?auto_509577 ) ( ON ?auto_509578 ?auto_509577 ) ( ON ?auto_509579 ?auto_509578 ) ( ON ?auto_509580 ?auto_509579 ) ( not ( = ?auto_509577 ?auto_509578 ) ) ( not ( = ?auto_509577 ?auto_509579 ) ) ( not ( = ?auto_509577 ?auto_509580 ) ) ( not ( = ?auto_509577 ?auto_509581 ) ) ( not ( = ?auto_509577 ?auto_509582 ) ) ( not ( = ?auto_509577 ?auto_509583 ) ) ( not ( = ?auto_509577 ?auto_509584 ) ) ( not ( = ?auto_509577 ?auto_509585 ) ) ( not ( = ?auto_509578 ?auto_509579 ) ) ( not ( = ?auto_509578 ?auto_509580 ) ) ( not ( = ?auto_509578 ?auto_509581 ) ) ( not ( = ?auto_509578 ?auto_509582 ) ) ( not ( = ?auto_509578 ?auto_509583 ) ) ( not ( = ?auto_509578 ?auto_509584 ) ) ( not ( = ?auto_509578 ?auto_509585 ) ) ( not ( = ?auto_509579 ?auto_509580 ) ) ( not ( = ?auto_509579 ?auto_509581 ) ) ( not ( = ?auto_509579 ?auto_509582 ) ) ( not ( = ?auto_509579 ?auto_509583 ) ) ( not ( = ?auto_509579 ?auto_509584 ) ) ( not ( = ?auto_509579 ?auto_509585 ) ) ( not ( = ?auto_509580 ?auto_509581 ) ) ( not ( = ?auto_509580 ?auto_509582 ) ) ( not ( = ?auto_509580 ?auto_509583 ) ) ( not ( = ?auto_509580 ?auto_509584 ) ) ( not ( = ?auto_509580 ?auto_509585 ) ) ( not ( = ?auto_509581 ?auto_509582 ) ) ( not ( = ?auto_509581 ?auto_509583 ) ) ( not ( = ?auto_509581 ?auto_509584 ) ) ( not ( = ?auto_509581 ?auto_509585 ) ) ( not ( = ?auto_509582 ?auto_509583 ) ) ( not ( = ?auto_509582 ?auto_509584 ) ) ( not ( = ?auto_509582 ?auto_509585 ) ) ( not ( = ?auto_509583 ?auto_509584 ) ) ( not ( = ?auto_509583 ?auto_509585 ) ) ( not ( = ?auto_509584 ?auto_509585 ) ) ( ON ?auto_509583 ?auto_509584 ) ( ON ?auto_509582 ?auto_509583 ) ( CLEAR ?auto_509580 ) ( ON ?auto_509581 ?auto_509582 ) ( CLEAR ?auto_509581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_509577 ?auto_509578 ?auto_509579 ?auto_509580 ?auto_509581 )
      ( MAKE-8PILE ?auto_509577 ?auto_509578 ?auto_509579 ?auto_509580 ?auto_509581 ?auto_509582 ?auto_509583 ?auto_509584 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509611 - BLOCK
      ?auto_509612 - BLOCK
      ?auto_509613 - BLOCK
      ?auto_509614 - BLOCK
      ?auto_509615 - BLOCK
      ?auto_509616 - BLOCK
      ?auto_509617 - BLOCK
      ?auto_509618 - BLOCK
    )
    :vars
    (
      ?auto_509619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509618 ?auto_509619 ) ( ON-TABLE ?auto_509611 ) ( ON ?auto_509612 ?auto_509611 ) ( ON ?auto_509613 ?auto_509612 ) ( not ( = ?auto_509611 ?auto_509612 ) ) ( not ( = ?auto_509611 ?auto_509613 ) ) ( not ( = ?auto_509611 ?auto_509614 ) ) ( not ( = ?auto_509611 ?auto_509615 ) ) ( not ( = ?auto_509611 ?auto_509616 ) ) ( not ( = ?auto_509611 ?auto_509617 ) ) ( not ( = ?auto_509611 ?auto_509618 ) ) ( not ( = ?auto_509611 ?auto_509619 ) ) ( not ( = ?auto_509612 ?auto_509613 ) ) ( not ( = ?auto_509612 ?auto_509614 ) ) ( not ( = ?auto_509612 ?auto_509615 ) ) ( not ( = ?auto_509612 ?auto_509616 ) ) ( not ( = ?auto_509612 ?auto_509617 ) ) ( not ( = ?auto_509612 ?auto_509618 ) ) ( not ( = ?auto_509612 ?auto_509619 ) ) ( not ( = ?auto_509613 ?auto_509614 ) ) ( not ( = ?auto_509613 ?auto_509615 ) ) ( not ( = ?auto_509613 ?auto_509616 ) ) ( not ( = ?auto_509613 ?auto_509617 ) ) ( not ( = ?auto_509613 ?auto_509618 ) ) ( not ( = ?auto_509613 ?auto_509619 ) ) ( not ( = ?auto_509614 ?auto_509615 ) ) ( not ( = ?auto_509614 ?auto_509616 ) ) ( not ( = ?auto_509614 ?auto_509617 ) ) ( not ( = ?auto_509614 ?auto_509618 ) ) ( not ( = ?auto_509614 ?auto_509619 ) ) ( not ( = ?auto_509615 ?auto_509616 ) ) ( not ( = ?auto_509615 ?auto_509617 ) ) ( not ( = ?auto_509615 ?auto_509618 ) ) ( not ( = ?auto_509615 ?auto_509619 ) ) ( not ( = ?auto_509616 ?auto_509617 ) ) ( not ( = ?auto_509616 ?auto_509618 ) ) ( not ( = ?auto_509616 ?auto_509619 ) ) ( not ( = ?auto_509617 ?auto_509618 ) ) ( not ( = ?auto_509617 ?auto_509619 ) ) ( not ( = ?auto_509618 ?auto_509619 ) ) ( ON ?auto_509617 ?auto_509618 ) ( ON ?auto_509616 ?auto_509617 ) ( ON ?auto_509615 ?auto_509616 ) ( CLEAR ?auto_509613 ) ( ON ?auto_509614 ?auto_509615 ) ( CLEAR ?auto_509614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_509611 ?auto_509612 ?auto_509613 ?auto_509614 )
      ( MAKE-8PILE ?auto_509611 ?auto_509612 ?auto_509613 ?auto_509614 ?auto_509615 ?auto_509616 ?auto_509617 ?auto_509618 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509645 - BLOCK
      ?auto_509646 - BLOCK
      ?auto_509647 - BLOCK
      ?auto_509648 - BLOCK
      ?auto_509649 - BLOCK
      ?auto_509650 - BLOCK
      ?auto_509651 - BLOCK
      ?auto_509652 - BLOCK
    )
    :vars
    (
      ?auto_509653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509652 ?auto_509653 ) ( ON-TABLE ?auto_509645 ) ( ON ?auto_509646 ?auto_509645 ) ( not ( = ?auto_509645 ?auto_509646 ) ) ( not ( = ?auto_509645 ?auto_509647 ) ) ( not ( = ?auto_509645 ?auto_509648 ) ) ( not ( = ?auto_509645 ?auto_509649 ) ) ( not ( = ?auto_509645 ?auto_509650 ) ) ( not ( = ?auto_509645 ?auto_509651 ) ) ( not ( = ?auto_509645 ?auto_509652 ) ) ( not ( = ?auto_509645 ?auto_509653 ) ) ( not ( = ?auto_509646 ?auto_509647 ) ) ( not ( = ?auto_509646 ?auto_509648 ) ) ( not ( = ?auto_509646 ?auto_509649 ) ) ( not ( = ?auto_509646 ?auto_509650 ) ) ( not ( = ?auto_509646 ?auto_509651 ) ) ( not ( = ?auto_509646 ?auto_509652 ) ) ( not ( = ?auto_509646 ?auto_509653 ) ) ( not ( = ?auto_509647 ?auto_509648 ) ) ( not ( = ?auto_509647 ?auto_509649 ) ) ( not ( = ?auto_509647 ?auto_509650 ) ) ( not ( = ?auto_509647 ?auto_509651 ) ) ( not ( = ?auto_509647 ?auto_509652 ) ) ( not ( = ?auto_509647 ?auto_509653 ) ) ( not ( = ?auto_509648 ?auto_509649 ) ) ( not ( = ?auto_509648 ?auto_509650 ) ) ( not ( = ?auto_509648 ?auto_509651 ) ) ( not ( = ?auto_509648 ?auto_509652 ) ) ( not ( = ?auto_509648 ?auto_509653 ) ) ( not ( = ?auto_509649 ?auto_509650 ) ) ( not ( = ?auto_509649 ?auto_509651 ) ) ( not ( = ?auto_509649 ?auto_509652 ) ) ( not ( = ?auto_509649 ?auto_509653 ) ) ( not ( = ?auto_509650 ?auto_509651 ) ) ( not ( = ?auto_509650 ?auto_509652 ) ) ( not ( = ?auto_509650 ?auto_509653 ) ) ( not ( = ?auto_509651 ?auto_509652 ) ) ( not ( = ?auto_509651 ?auto_509653 ) ) ( not ( = ?auto_509652 ?auto_509653 ) ) ( ON ?auto_509651 ?auto_509652 ) ( ON ?auto_509650 ?auto_509651 ) ( ON ?auto_509649 ?auto_509650 ) ( ON ?auto_509648 ?auto_509649 ) ( CLEAR ?auto_509646 ) ( ON ?auto_509647 ?auto_509648 ) ( CLEAR ?auto_509647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_509645 ?auto_509646 ?auto_509647 )
      ( MAKE-8PILE ?auto_509645 ?auto_509646 ?auto_509647 ?auto_509648 ?auto_509649 ?auto_509650 ?auto_509651 ?auto_509652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509679 - BLOCK
      ?auto_509680 - BLOCK
      ?auto_509681 - BLOCK
      ?auto_509682 - BLOCK
      ?auto_509683 - BLOCK
      ?auto_509684 - BLOCK
      ?auto_509685 - BLOCK
      ?auto_509686 - BLOCK
    )
    :vars
    (
      ?auto_509687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509686 ?auto_509687 ) ( ON-TABLE ?auto_509679 ) ( not ( = ?auto_509679 ?auto_509680 ) ) ( not ( = ?auto_509679 ?auto_509681 ) ) ( not ( = ?auto_509679 ?auto_509682 ) ) ( not ( = ?auto_509679 ?auto_509683 ) ) ( not ( = ?auto_509679 ?auto_509684 ) ) ( not ( = ?auto_509679 ?auto_509685 ) ) ( not ( = ?auto_509679 ?auto_509686 ) ) ( not ( = ?auto_509679 ?auto_509687 ) ) ( not ( = ?auto_509680 ?auto_509681 ) ) ( not ( = ?auto_509680 ?auto_509682 ) ) ( not ( = ?auto_509680 ?auto_509683 ) ) ( not ( = ?auto_509680 ?auto_509684 ) ) ( not ( = ?auto_509680 ?auto_509685 ) ) ( not ( = ?auto_509680 ?auto_509686 ) ) ( not ( = ?auto_509680 ?auto_509687 ) ) ( not ( = ?auto_509681 ?auto_509682 ) ) ( not ( = ?auto_509681 ?auto_509683 ) ) ( not ( = ?auto_509681 ?auto_509684 ) ) ( not ( = ?auto_509681 ?auto_509685 ) ) ( not ( = ?auto_509681 ?auto_509686 ) ) ( not ( = ?auto_509681 ?auto_509687 ) ) ( not ( = ?auto_509682 ?auto_509683 ) ) ( not ( = ?auto_509682 ?auto_509684 ) ) ( not ( = ?auto_509682 ?auto_509685 ) ) ( not ( = ?auto_509682 ?auto_509686 ) ) ( not ( = ?auto_509682 ?auto_509687 ) ) ( not ( = ?auto_509683 ?auto_509684 ) ) ( not ( = ?auto_509683 ?auto_509685 ) ) ( not ( = ?auto_509683 ?auto_509686 ) ) ( not ( = ?auto_509683 ?auto_509687 ) ) ( not ( = ?auto_509684 ?auto_509685 ) ) ( not ( = ?auto_509684 ?auto_509686 ) ) ( not ( = ?auto_509684 ?auto_509687 ) ) ( not ( = ?auto_509685 ?auto_509686 ) ) ( not ( = ?auto_509685 ?auto_509687 ) ) ( not ( = ?auto_509686 ?auto_509687 ) ) ( ON ?auto_509685 ?auto_509686 ) ( ON ?auto_509684 ?auto_509685 ) ( ON ?auto_509683 ?auto_509684 ) ( ON ?auto_509682 ?auto_509683 ) ( ON ?auto_509681 ?auto_509682 ) ( CLEAR ?auto_509679 ) ( ON ?auto_509680 ?auto_509681 ) ( CLEAR ?auto_509680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_509679 ?auto_509680 )
      ( MAKE-8PILE ?auto_509679 ?auto_509680 ?auto_509681 ?auto_509682 ?auto_509683 ?auto_509684 ?auto_509685 ?auto_509686 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_509713 - BLOCK
      ?auto_509714 - BLOCK
      ?auto_509715 - BLOCK
      ?auto_509716 - BLOCK
      ?auto_509717 - BLOCK
      ?auto_509718 - BLOCK
      ?auto_509719 - BLOCK
      ?auto_509720 - BLOCK
    )
    :vars
    (
      ?auto_509721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509720 ?auto_509721 ) ( not ( = ?auto_509713 ?auto_509714 ) ) ( not ( = ?auto_509713 ?auto_509715 ) ) ( not ( = ?auto_509713 ?auto_509716 ) ) ( not ( = ?auto_509713 ?auto_509717 ) ) ( not ( = ?auto_509713 ?auto_509718 ) ) ( not ( = ?auto_509713 ?auto_509719 ) ) ( not ( = ?auto_509713 ?auto_509720 ) ) ( not ( = ?auto_509713 ?auto_509721 ) ) ( not ( = ?auto_509714 ?auto_509715 ) ) ( not ( = ?auto_509714 ?auto_509716 ) ) ( not ( = ?auto_509714 ?auto_509717 ) ) ( not ( = ?auto_509714 ?auto_509718 ) ) ( not ( = ?auto_509714 ?auto_509719 ) ) ( not ( = ?auto_509714 ?auto_509720 ) ) ( not ( = ?auto_509714 ?auto_509721 ) ) ( not ( = ?auto_509715 ?auto_509716 ) ) ( not ( = ?auto_509715 ?auto_509717 ) ) ( not ( = ?auto_509715 ?auto_509718 ) ) ( not ( = ?auto_509715 ?auto_509719 ) ) ( not ( = ?auto_509715 ?auto_509720 ) ) ( not ( = ?auto_509715 ?auto_509721 ) ) ( not ( = ?auto_509716 ?auto_509717 ) ) ( not ( = ?auto_509716 ?auto_509718 ) ) ( not ( = ?auto_509716 ?auto_509719 ) ) ( not ( = ?auto_509716 ?auto_509720 ) ) ( not ( = ?auto_509716 ?auto_509721 ) ) ( not ( = ?auto_509717 ?auto_509718 ) ) ( not ( = ?auto_509717 ?auto_509719 ) ) ( not ( = ?auto_509717 ?auto_509720 ) ) ( not ( = ?auto_509717 ?auto_509721 ) ) ( not ( = ?auto_509718 ?auto_509719 ) ) ( not ( = ?auto_509718 ?auto_509720 ) ) ( not ( = ?auto_509718 ?auto_509721 ) ) ( not ( = ?auto_509719 ?auto_509720 ) ) ( not ( = ?auto_509719 ?auto_509721 ) ) ( not ( = ?auto_509720 ?auto_509721 ) ) ( ON ?auto_509719 ?auto_509720 ) ( ON ?auto_509718 ?auto_509719 ) ( ON ?auto_509717 ?auto_509718 ) ( ON ?auto_509716 ?auto_509717 ) ( ON ?auto_509715 ?auto_509716 ) ( ON ?auto_509714 ?auto_509715 ) ( ON ?auto_509713 ?auto_509714 ) ( CLEAR ?auto_509713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_509713 )
      ( MAKE-8PILE ?auto_509713 ?auto_509714 ?auto_509715 ?auto_509716 ?auto_509717 ?auto_509718 ?auto_509719 ?auto_509720 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509748 - BLOCK
      ?auto_509749 - BLOCK
      ?auto_509750 - BLOCK
      ?auto_509751 - BLOCK
      ?auto_509752 - BLOCK
      ?auto_509753 - BLOCK
      ?auto_509754 - BLOCK
      ?auto_509755 - BLOCK
      ?auto_509756 - BLOCK
    )
    :vars
    (
      ?auto_509757 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_509755 ) ( ON ?auto_509756 ?auto_509757 ) ( CLEAR ?auto_509756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_509748 ) ( ON ?auto_509749 ?auto_509748 ) ( ON ?auto_509750 ?auto_509749 ) ( ON ?auto_509751 ?auto_509750 ) ( ON ?auto_509752 ?auto_509751 ) ( ON ?auto_509753 ?auto_509752 ) ( ON ?auto_509754 ?auto_509753 ) ( ON ?auto_509755 ?auto_509754 ) ( not ( = ?auto_509748 ?auto_509749 ) ) ( not ( = ?auto_509748 ?auto_509750 ) ) ( not ( = ?auto_509748 ?auto_509751 ) ) ( not ( = ?auto_509748 ?auto_509752 ) ) ( not ( = ?auto_509748 ?auto_509753 ) ) ( not ( = ?auto_509748 ?auto_509754 ) ) ( not ( = ?auto_509748 ?auto_509755 ) ) ( not ( = ?auto_509748 ?auto_509756 ) ) ( not ( = ?auto_509748 ?auto_509757 ) ) ( not ( = ?auto_509749 ?auto_509750 ) ) ( not ( = ?auto_509749 ?auto_509751 ) ) ( not ( = ?auto_509749 ?auto_509752 ) ) ( not ( = ?auto_509749 ?auto_509753 ) ) ( not ( = ?auto_509749 ?auto_509754 ) ) ( not ( = ?auto_509749 ?auto_509755 ) ) ( not ( = ?auto_509749 ?auto_509756 ) ) ( not ( = ?auto_509749 ?auto_509757 ) ) ( not ( = ?auto_509750 ?auto_509751 ) ) ( not ( = ?auto_509750 ?auto_509752 ) ) ( not ( = ?auto_509750 ?auto_509753 ) ) ( not ( = ?auto_509750 ?auto_509754 ) ) ( not ( = ?auto_509750 ?auto_509755 ) ) ( not ( = ?auto_509750 ?auto_509756 ) ) ( not ( = ?auto_509750 ?auto_509757 ) ) ( not ( = ?auto_509751 ?auto_509752 ) ) ( not ( = ?auto_509751 ?auto_509753 ) ) ( not ( = ?auto_509751 ?auto_509754 ) ) ( not ( = ?auto_509751 ?auto_509755 ) ) ( not ( = ?auto_509751 ?auto_509756 ) ) ( not ( = ?auto_509751 ?auto_509757 ) ) ( not ( = ?auto_509752 ?auto_509753 ) ) ( not ( = ?auto_509752 ?auto_509754 ) ) ( not ( = ?auto_509752 ?auto_509755 ) ) ( not ( = ?auto_509752 ?auto_509756 ) ) ( not ( = ?auto_509752 ?auto_509757 ) ) ( not ( = ?auto_509753 ?auto_509754 ) ) ( not ( = ?auto_509753 ?auto_509755 ) ) ( not ( = ?auto_509753 ?auto_509756 ) ) ( not ( = ?auto_509753 ?auto_509757 ) ) ( not ( = ?auto_509754 ?auto_509755 ) ) ( not ( = ?auto_509754 ?auto_509756 ) ) ( not ( = ?auto_509754 ?auto_509757 ) ) ( not ( = ?auto_509755 ?auto_509756 ) ) ( not ( = ?auto_509755 ?auto_509757 ) ) ( not ( = ?auto_509756 ?auto_509757 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_509756 ?auto_509757 )
      ( !STACK ?auto_509756 ?auto_509755 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509786 - BLOCK
      ?auto_509787 - BLOCK
      ?auto_509788 - BLOCK
      ?auto_509789 - BLOCK
      ?auto_509790 - BLOCK
      ?auto_509791 - BLOCK
      ?auto_509792 - BLOCK
      ?auto_509793 - BLOCK
      ?auto_509794 - BLOCK
    )
    :vars
    (
      ?auto_509795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509794 ?auto_509795 ) ( ON-TABLE ?auto_509786 ) ( ON ?auto_509787 ?auto_509786 ) ( ON ?auto_509788 ?auto_509787 ) ( ON ?auto_509789 ?auto_509788 ) ( ON ?auto_509790 ?auto_509789 ) ( ON ?auto_509791 ?auto_509790 ) ( ON ?auto_509792 ?auto_509791 ) ( not ( = ?auto_509786 ?auto_509787 ) ) ( not ( = ?auto_509786 ?auto_509788 ) ) ( not ( = ?auto_509786 ?auto_509789 ) ) ( not ( = ?auto_509786 ?auto_509790 ) ) ( not ( = ?auto_509786 ?auto_509791 ) ) ( not ( = ?auto_509786 ?auto_509792 ) ) ( not ( = ?auto_509786 ?auto_509793 ) ) ( not ( = ?auto_509786 ?auto_509794 ) ) ( not ( = ?auto_509786 ?auto_509795 ) ) ( not ( = ?auto_509787 ?auto_509788 ) ) ( not ( = ?auto_509787 ?auto_509789 ) ) ( not ( = ?auto_509787 ?auto_509790 ) ) ( not ( = ?auto_509787 ?auto_509791 ) ) ( not ( = ?auto_509787 ?auto_509792 ) ) ( not ( = ?auto_509787 ?auto_509793 ) ) ( not ( = ?auto_509787 ?auto_509794 ) ) ( not ( = ?auto_509787 ?auto_509795 ) ) ( not ( = ?auto_509788 ?auto_509789 ) ) ( not ( = ?auto_509788 ?auto_509790 ) ) ( not ( = ?auto_509788 ?auto_509791 ) ) ( not ( = ?auto_509788 ?auto_509792 ) ) ( not ( = ?auto_509788 ?auto_509793 ) ) ( not ( = ?auto_509788 ?auto_509794 ) ) ( not ( = ?auto_509788 ?auto_509795 ) ) ( not ( = ?auto_509789 ?auto_509790 ) ) ( not ( = ?auto_509789 ?auto_509791 ) ) ( not ( = ?auto_509789 ?auto_509792 ) ) ( not ( = ?auto_509789 ?auto_509793 ) ) ( not ( = ?auto_509789 ?auto_509794 ) ) ( not ( = ?auto_509789 ?auto_509795 ) ) ( not ( = ?auto_509790 ?auto_509791 ) ) ( not ( = ?auto_509790 ?auto_509792 ) ) ( not ( = ?auto_509790 ?auto_509793 ) ) ( not ( = ?auto_509790 ?auto_509794 ) ) ( not ( = ?auto_509790 ?auto_509795 ) ) ( not ( = ?auto_509791 ?auto_509792 ) ) ( not ( = ?auto_509791 ?auto_509793 ) ) ( not ( = ?auto_509791 ?auto_509794 ) ) ( not ( = ?auto_509791 ?auto_509795 ) ) ( not ( = ?auto_509792 ?auto_509793 ) ) ( not ( = ?auto_509792 ?auto_509794 ) ) ( not ( = ?auto_509792 ?auto_509795 ) ) ( not ( = ?auto_509793 ?auto_509794 ) ) ( not ( = ?auto_509793 ?auto_509795 ) ) ( not ( = ?auto_509794 ?auto_509795 ) ) ( CLEAR ?auto_509792 ) ( ON ?auto_509793 ?auto_509794 ) ( CLEAR ?auto_509793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_509786 ?auto_509787 ?auto_509788 ?auto_509789 ?auto_509790 ?auto_509791 ?auto_509792 ?auto_509793 )
      ( MAKE-9PILE ?auto_509786 ?auto_509787 ?auto_509788 ?auto_509789 ?auto_509790 ?auto_509791 ?auto_509792 ?auto_509793 ?auto_509794 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509824 - BLOCK
      ?auto_509825 - BLOCK
      ?auto_509826 - BLOCK
      ?auto_509827 - BLOCK
      ?auto_509828 - BLOCK
      ?auto_509829 - BLOCK
      ?auto_509830 - BLOCK
      ?auto_509831 - BLOCK
      ?auto_509832 - BLOCK
    )
    :vars
    (
      ?auto_509833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509832 ?auto_509833 ) ( ON-TABLE ?auto_509824 ) ( ON ?auto_509825 ?auto_509824 ) ( ON ?auto_509826 ?auto_509825 ) ( ON ?auto_509827 ?auto_509826 ) ( ON ?auto_509828 ?auto_509827 ) ( ON ?auto_509829 ?auto_509828 ) ( not ( = ?auto_509824 ?auto_509825 ) ) ( not ( = ?auto_509824 ?auto_509826 ) ) ( not ( = ?auto_509824 ?auto_509827 ) ) ( not ( = ?auto_509824 ?auto_509828 ) ) ( not ( = ?auto_509824 ?auto_509829 ) ) ( not ( = ?auto_509824 ?auto_509830 ) ) ( not ( = ?auto_509824 ?auto_509831 ) ) ( not ( = ?auto_509824 ?auto_509832 ) ) ( not ( = ?auto_509824 ?auto_509833 ) ) ( not ( = ?auto_509825 ?auto_509826 ) ) ( not ( = ?auto_509825 ?auto_509827 ) ) ( not ( = ?auto_509825 ?auto_509828 ) ) ( not ( = ?auto_509825 ?auto_509829 ) ) ( not ( = ?auto_509825 ?auto_509830 ) ) ( not ( = ?auto_509825 ?auto_509831 ) ) ( not ( = ?auto_509825 ?auto_509832 ) ) ( not ( = ?auto_509825 ?auto_509833 ) ) ( not ( = ?auto_509826 ?auto_509827 ) ) ( not ( = ?auto_509826 ?auto_509828 ) ) ( not ( = ?auto_509826 ?auto_509829 ) ) ( not ( = ?auto_509826 ?auto_509830 ) ) ( not ( = ?auto_509826 ?auto_509831 ) ) ( not ( = ?auto_509826 ?auto_509832 ) ) ( not ( = ?auto_509826 ?auto_509833 ) ) ( not ( = ?auto_509827 ?auto_509828 ) ) ( not ( = ?auto_509827 ?auto_509829 ) ) ( not ( = ?auto_509827 ?auto_509830 ) ) ( not ( = ?auto_509827 ?auto_509831 ) ) ( not ( = ?auto_509827 ?auto_509832 ) ) ( not ( = ?auto_509827 ?auto_509833 ) ) ( not ( = ?auto_509828 ?auto_509829 ) ) ( not ( = ?auto_509828 ?auto_509830 ) ) ( not ( = ?auto_509828 ?auto_509831 ) ) ( not ( = ?auto_509828 ?auto_509832 ) ) ( not ( = ?auto_509828 ?auto_509833 ) ) ( not ( = ?auto_509829 ?auto_509830 ) ) ( not ( = ?auto_509829 ?auto_509831 ) ) ( not ( = ?auto_509829 ?auto_509832 ) ) ( not ( = ?auto_509829 ?auto_509833 ) ) ( not ( = ?auto_509830 ?auto_509831 ) ) ( not ( = ?auto_509830 ?auto_509832 ) ) ( not ( = ?auto_509830 ?auto_509833 ) ) ( not ( = ?auto_509831 ?auto_509832 ) ) ( not ( = ?auto_509831 ?auto_509833 ) ) ( not ( = ?auto_509832 ?auto_509833 ) ) ( ON ?auto_509831 ?auto_509832 ) ( CLEAR ?auto_509829 ) ( ON ?auto_509830 ?auto_509831 ) ( CLEAR ?auto_509830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_509824 ?auto_509825 ?auto_509826 ?auto_509827 ?auto_509828 ?auto_509829 ?auto_509830 )
      ( MAKE-9PILE ?auto_509824 ?auto_509825 ?auto_509826 ?auto_509827 ?auto_509828 ?auto_509829 ?auto_509830 ?auto_509831 ?auto_509832 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509862 - BLOCK
      ?auto_509863 - BLOCK
      ?auto_509864 - BLOCK
      ?auto_509865 - BLOCK
      ?auto_509866 - BLOCK
      ?auto_509867 - BLOCK
      ?auto_509868 - BLOCK
      ?auto_509869 - BLOCK
      ?auto_509870 - BLOCK
    )
    :vars
    (
      ?auto_509871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509870 ?auto_509871 ) ( ON-TABLE ?auto_509862 ) ( ON ?auto_509863 ?auto_509862 ) ( ON ?auto_509864 ?auto_509863 ) ( ON ?auto_509865 ?auto_509864 ) ( ON ?auto_509866 ?auto_509865 ) ( not ( = ?auto_509862 ?auto_509863 ) ) ( not ( = ?auto_509862 ?auto_509864 ) ) ( not ( = ?auto_509862 ?auto_509865 ) ) ( not ( = ?auto_509862 ?auto_509866 ) ) ( not ( = ?auto_509862 ?auto_509867 ) ) ( not ( = ?auto_509862 ?auto_509868 ) ) ( not ( = ?auto_509862 ?auto_509869 ) ) ( not ( = ?auto_509862 ?auto_509870 ) ) ( not ( = ?auto_509862 ?auto_509871 ) ) ( not ( = ?auto_509863 ?auto_509864 ) ) ( not ( = ?auto_509863 ?auto_509865 ) ) ( not ( = ?auto_509863 ?auto_509866 ) ) ( not ( = ?auto_509863 ?auto_509867 ) ) ( not ( = ?auto_509863 ?auto_509868 ) ) ( not ( = ?auto_509863 ?auto_509869 ) ) ( not ( = ?auto_509863 ?auto_509870 ) ) ( not ( = ?auto_509863 ?auto_509871 ) ) ( not ( = ?auto_509864 ?auto_509865 ) ) ( not ( = ?auto_509864 ?auto_509866 ) ) ( not ( = ?auto_509864 ?auto_509867 ) ) ( not ( = ?auto_509864 ?auto_509868 ) ) ( not ( = ?auto_509864 ?auto_509869 ) ) ( not ( = ?auto_509864 ?auto_509870 ) ) ( not ( = ?auto_509864 ?auto_509871 ) ) ( not ( = ?auto_509865 ?auto_509866 ) ) ( not ( = ?auto_509865 ?auto_509867 ) ) ( not ( = ?auto_509865 ?auto_509868 ) ) ( not ( = ?auto_509865 ?auto_509869 ) ) ( not ( = ?auto_509865 ?auto_509870 ) ) ( not ( = ?auto_509865 ?auto_509871 ) ) ( not ( = ?auto_509866 ?auto_509867 ) ) ( not ( = ?auto_509866 ?auto_509868 ) ) ( not ( = ?auto_509866 ?auto_509869 ) ) ( not ( = ?auto_509866 ?auto_509870 ) ) ( not ( = ?auto_509866 ?auto_509871 ) ) ( not ( = ?auto_509867 ?auto_509868 ) ) ( not ( = ?auto_509867 ?auto_509869 ) ) ( not ( = ?auto_509867 ?auto_509870 ) ) ( not ( = ?auto_509867 ?auto_509871 ) ) ( not ( = ?auto_509868 ?auto_509869 ) ) ( not ( = ?auto_509868 ?auto_509870 ) ) ( not ( = ?auto_509868 ?auto_509871 ) ) ( not ( = ?auto_509869 ?auto_509870 ) ) ( not ( = ?auto_509869 ?auto_509871 ) ) ( not ( = ?auto_509870 ?auto_509871 ) ) ( ON ?auto_509869 ?auto_509870 ) ( ON ?auto_509868 ?auto_509869 ) ( CLEAR ?auto_509866 ) ( ON ?auto_509867 ?auto_509868 ) ( CLEAR ?auto_509867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_509862 ?auto_509863 ?auto_509864 ?auto_509865 ?auto_509866 ?auto_509867 )
      ( MAKE-9PILE ?auto_509862 ?auto_509863 ?auto_509864 ?auto_509865 ?auto_509866 ?auto_509867 ?auto_509868 ?auto_509869 ?auto_509870 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509900 - BLOCK
      ?auto_509901 - BLOCK
      ?auto_509902 - BLOCK
      ?auto_509903 - BLOCK
      ?auto_509904 - BLOCK
      ?auto_509905 - BLOCK
      ?auto_509906 - BLOCK
      ?auto_509907 - BLOCK
      ?auto_509908 - BLOCK
    )
    :vars
    (
      ?auto_509909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509908 ?auto_509909 ) ( ON-TABLE ?auto_509900 ) ( ON ?auto_509901 ?auto_509900 ) ( ON ?auto_509902 ?auto_509901 ) ( ON ?auto_509903 ?auto_509902 ) ( not ( = ?auto_509900 ?auto_509901 ) ) ( not ( = ?auto_509900 ?auto_509902 ) ) ( not ( = ?auto_509900 ?auto_509903 ) ) ( not ( = ?auto_509900 ?auto_509904 ) ) ( not ( = ?auto_509900 ?auto_509905 ) ) ( not ( = ?auto_509900 ?auto_509906 ) ) ( not ( = ?auto_509900 ?auto_509907 ) ) ( not ( = ?auto_509900 ?auto_509908 ) ) ( not ( = ?auto_509900 ?auto_509909 ) ) ( not ( = ?auto_509901 ?auto_509902 ) ) ( not ( = ?auto_509901 ?auto_509903 ) ) ( not ( = ?auto_509901 ?auto_509904 ) ) ( not ( = ?auto_509901 ?auto_509905 ) ) ( not ( = ?auto_509901 ?auto_509906 ) ) ( not ( = ?auto_509901 ?auto_509907 ) ) ( not ( = ?auto_509901 ?auto_509908 ) ) ( not ( = ?auto_509901 ?auto_509909 ) ) ( not ( = ?auto_509902 ?auto_509903 ) ) ( not ( = ?auto_509902 ?auto_509904 ) ) ( not ( = ?auto_509902 ?auto_509905 ) ) ( not ( = ?auto_509902 ?auto_509906 ) ) ( not ( = ?auto_509902 ?auto_509907 ) ) ( not ( = ?auto_509902 ?auto_509908 ) ) ( not ( = ?auto_509902 ?auto_509909 ) ) ( not ( = ?auto_509903 ?auto_509904 ) ) ( not ( = ?auto_509903 ?auto_509905 ) ) ( not ( = ?auto_509903 ?auto_509906 ) ) ( not ( = ?auto_509903 ?auto_509907 ) ) ( not ( = ?auto_509903 ?auto_509908 ) ) ( not ( = ?auto_509903 ?auto_509909 ) ) ( not ( = ?auto_509904 ?auto_509905 ) ) ( not ( = ?auto_509904 ?auto_509906 ) ) ( not ( = ?auto_509904 ?auto_509907 ) ) ( not ( = ?auto_509904 ?auto_509908 ) ) ( not ( = ?auto_509904 ?auto_509909 ) ) ( not ( = ?auto_509905 ?auto_509906 ) ) ( not ( = ?auto_509905 ?auto_509907 ) ) ( not ( = ?auto_509905 ?auto_509908 ) ) ( not ( = ?auto_509905 ?auto_509909 ) ) ( not ( = ?auto_509906 ?auto_509907 ) ) ( not ( = ?auto_509906 ?auto_509908 ) ) ( not ( = ?auto_509906 ?auto_509909 ) ) ( not ( = ?auto_509907 ?auto_509908 ) ) ( not ( = ?auto_509907 ?auto_509909 ) ) ( not ( = ?auto_509908 ?auto_509909 ) ) ( ON ?auto_509907 ?auto_509908 ) ( ON ?auto_509906 ?auto_509907 ) ( ON ?auto_509905 ?auto_509906 ) ( CLEAR ?auto_509903 ) ( ON ?auto_509904 ?auto_509905 ) ( CLEAR ?auto_509904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_509900 ?auto_509901 ?auto_509902 ?auto_509903 ?auto_509904 )
      ( MAKE-9PILE ?auto_509900 ?auto_509901 ?auto_509902 ?auto_509903 ?auto_509904 ?auto_509905 ?auto_509906 ?auto_509907 ?auto_509908 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509938 - BLOCK
      ?auto_509939 - BLOCK
      ?auto_509940 - BLOCK
      ?auto_509941 - BLOCK
      ?auto_509942 - BLOCK
      ?auto_509943 - BLOCK
      ?auto_509944 - BLOCK
      ?auto_509945 - BLOCK
      ?auto_509946 - BLOCK
    )
    :vars
    (
      ?auto_509947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509946 ?auto_509947 ) ( ON-TABLE ?auto_509938 ) ( ON ?auto_509939 ?auto_509938 ) ( ON ?auto_509940 ?auto_509939 ) ( not ( = ?auto_509938 ?auto_509939 ) ) ( not ( = ?auto_509938 ?auto_509940 ) ) ( not ( = ?auto_509938 ?auto_509941 ) ) ( not ( = ?auto_509938 ?auto_509942 ) ) ( not ( = ?auto_509938 ?auto_509943 ) ) ( not ( = ?auto_509938 ?auto_509944 ) ) ( not ( = ?auto_509938 ?auto_509945 ) ) ( not ( = ?auto_509938 ?auto_509946 ) ) ( not ( = ?auto_509938 ?auto_509947 ) ) ( not ( = ?auto_509939 ?auto_509940 ) ) ( not ( = ?auto_509939 ?auto_509941 ) ) ( not ( = ?auto_509939 ?auto_509942 ) ) ( not ( = ?auto_509939 ?auto_509943 ) ) ( not ( = ?auto_509939 ?auto_509944 ) ) ( not ( = ?auto_509939 ?auto_509945 ) ) ( not ( = ?auto_509939 ?auto_509946 ) ) ( not ( = ?auto_509939 ?auto_509947 ) ) ( not ( = ?auto_509940 ?auto_509941 ) ) ( not ( = ?auto_509940 ?auto_509942 ) ) ( not ( = ?auto_509940 ?auto_509943 ) ) ( not ( = ?auto_509940 ?auto_509944 ) ) ( not ( = ?auto_509940 ?auto_509945 ) ) ( not ( = ?auto_509940 ?auto_509946 ) ) ( not ( = ?auto_509940 ?auto_509947 ) ) ( not ( = ?auto_509941 ?auto_509942 ) ) ( not ( = ?auto_509941 ?auto_509943 ) ) ( not ( = ?auto_509941 ?auto_509944 ) ) ( not ( = ?auto_509941 ?auto_509945 ) ) ( not ( = ?auto_509941 ?auto_509946 ) ) ( not ( = ?auto_509941 ?auto_509947 ) ) ( not ( = ?auto_509942 ?auto_509943 ) ) ( not ( = ?auto_509942 ?auto_509944 ) ) ( not ( = ?auto_509942 ?auto_509945 ) ) ( not ( = ?auto_509942 ?auto_509946 ) ) ( not ( = ?auto_509942 ?auto_509947 ) ) ( not ( = ?auto_509943 ?auto_509944 ) ) ( not ( = ?auto_509943 ?auto_509945 ) ) ( not ( = ?auto_509943 ?auto_509946 ) ) ( not ( = ?auto_509943 ?auto_509947 ) ) ( not ( = ?auto_509944 ?auto_509945 ) ) ( not ( = ?auto_509944 ?auto_509946 ) ) ( not ( = ?auto_509944 ?auto_509947 ) ) ( not ( = ?auto_509945 ?auto_509946 ) ) ( not ( = ?auto_509945 ?auto_509947 ) ) ( not ( = ?auto_509946 ?auto_509947 ) ) ( ON ?auto_509945 ?auto_509946 ) ( ON ?auto_509944 ?auto_509945 ) ( ON ?auto_509943 ?auto_509944 ) ( ON ?auto_509942 ?auto_509943 ) ( CLEAR ?auto_509940 ) ( ON ?auto_509941 ?auto_509942 ) ( CLEAR ?auto_509941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_509938 ?auto_509939 ?auto_509940 ?auto_509941 )
      ( MAKE-9PILE ?auto_509938 ?auto_509939 ?auto_509940 ?auto_509941 ?auto_509942 ?auto_509943 ?auto_509944 ?auto_509945 ?auto_509946 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_509976 - BLOCK
      ?auto_509977 - BLOCK
      ?auto_509978 - BLOCK
      ?auto_509979 - BLOCK
      ?auto_509980 - BLOCK
      ?auto_509981 - BLOCK
      ?auto_509982 - BLOCK
      ?auto_509983 - BLOCK
      ?auto_509984 - BLOCK
    )
    :vars
    (
      ?auto_509985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_509984 ?auto_509985 ) ( ON-TABLE ?auto_509976 ) ( ON ?auto_509977 ?auto_509976 ) ( not ( = ?auto_509976 ?auto_509977 ) ) ( not ( = ?auto_509976 ?auto_509978 ) ) ( not ( = ?auto_509976 ?auto_509979 ) ) ( not ( = ?auto_509976 ?auto_509980 ) ) ( not ( = ?auto_509976 ?auto_509981 ) ) ( not ( = ?auto_509976 ?auto_509982 ) ) ( not ( = ?auto_509976 ?auto_509983 ) ) ( not ( = ?auto_509976 ?auto_509984 ) ) ( not ( = ?auto_509976 ?auto_509985 ) ) ( not ( = ?auto_509977 ?auto_509978 ) ) ( not ( = ?auto_509977 ?auto_509979 ) ) ( not ( = ?auto_509977 ?auto_509980 ) ) ( not ( = ?auto_509977 ?auto_509981 ) ) ( not ( = ?auto_509977 ?auto_509982 ) ) ( not ( = ?auto_509977 ?auto_509983 ) ) ( not ( = ?auto_509977 ?auto_509984 ) ) ( not ( = ?auto_509977 ?auto_509985 ) ) ( not ( = ?auto_509978 ?auto_509979 ) ) ( not ( = ?auto_509978 ?auto_509980 ) ) ( not ( = ?auto_509978 ?auto_509981 ) ) ( not ( = ?auto_509978 ?auto_509982 ) ) ( not ( = ?auto_509978 ?auto_509983 ) ) ( not ( = ?auto_509978 ?auto_509984 ) ) ( not ( = ?auto_509978 ?auto_509985 ) ) ( not ( = ?auto_509979 ?auto_509980 ) ) ( not ( = ?auto_509979 ?auto_509981 ) ) ( not ( = ?auto_509979 ?auto_509982 ) ) ( not ( = ?auto_509979 ?auto_509983 ) ) ( not ( = ?auto_509979 ?auto_509984 ) ) ( not ( = ?auto_509979 ?auto_509985 ) ) ( not ( = ?auto_509980 ?auto_509981 ) ) ( not ( = ?auto_509980 ?auto_509982 ) ) ( not ( = ?auto_509980 ?auto_509983 ) ) ( not ( = ?auto_509980 ?auto_509984 ) ) ( not ( = ?auto_509980 ?auto_509985 ) ) ( not ( = ?auto_509981 ?auto_509982 ) ) ( not ( = ?auto_509981 ?auto_509983 ) ) ( not ( = ?auto_509981 ?auto_509984 ) ) ( not ( = ?auto_509981 ?auto_509985 ) ) ( not ( = ?auto_509982 ?auto_509983 ) ) ( not ( = ?auto_509982 ?auto_509984 ) ) ( not ( = ?auto_509982 ?auto_509985 ) ) ( not ( = ?auto_509983 ?auto_509984 ) ) ( not ( = ?auto_509983 ?auto_509985 ) ) ( not ( = ?auto_509984 ?auto_509985 ) ) ( ON ?auto_509983 ?auto_509984 ) ( ON ?auto_509982 ?auto_509983 ) ( ON ?auto_509981 ?auto_509982 ) ( ON ?auto_509980 ?auto_509981 ) ( ON ?auto_509979 ?auto_509980 ) ( CLEAR ?auto_509977 ) ( ON ?auto_509978 ?auto_509979 ) ( CLEAR ?auto_509978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_509976 ?auto_509977 ?auto_509978 )
      ( MAKE-9PILE ?auto_509976 ?auto_509977 ?auto_509978 ?auto_509979 ?auto_509980 ?auto_509981 ?auto_509982 ?auto_509983 ?auto_509984 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_510014 - BLOCK
      ?auto_510015 - BLOCK
      ?auto_510016 - BLOCK
      ?auto_510017 - BLOCK
      ?auto_510018 - BLOCK
      ?auto_510019 - BLOCK
      ?auto_510020 - BLOCK
      ?auto_510021 - BLOCK
      ?auto_510022 - BLOCK
    )
    :vars
    (
      ?auto_510023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510022 ?auto_510023 ) ( ON-TABLE ?auto_510014 ) ( not ( = ?auto_510014 ?auto_510015 ) ) ( not ( = ?auto_510014 ?auto_510016 ) ) ( not ( = ?auto_510014 ?auto_510017 ) ) ( not ( = ?auto_510014 ?auto_510018 ) ) ( not ( = ?auto_510014 ?auto_510019 ) ) ( not ( = ?auto_510014 ?auto_510020 ) ) ( not ( = ?auto_510014 ?auto_510021 ) ) ( not ( = ?auto_510014 ?auto_510022 ) ) ( not ( = ?auto_510014 ?auto_510023 ) ) ( not ( = ?auto_510015 ?auto_510016 ) ) ( not ( = ?auto_510015 ?auto_510017 ) ) ( not ( = ?auto_510015 ?auto_510018 ) ) ( not ( = ?auto_510015 ?auto_510019 ) ) ( not ( = ?auto_510015 ?auto_510020 ) ) ( not ( = ?auto_510015 ?auto_510021 ) ) ( not ( = ?auto_510015 ?auto_510022 ) ) ( not ( = ?auto_510015 ?auto_510023 ) ) ( not ( = ?auto_510016 ?auto_510017 ) ) ( not ( = ?auto_510016 ?auto_510018 ) ) ( not ( = ?auto_510016 ?auto_510019 ) ) ( not ( = ?auto_510016 ?auto_510020 ) ) ( not ( = ?auto_510016 ?auto_510021 ) ) ( not ( = ?auto_510016 ?auto_510022 ) ) ( not ( = ?auto_510016 ?auto_510023 ) ) ( not ( = ?auto_510017 ?auto_510018 ) ) ( not ( = ?auto_510017 ?auto_510019 ) ) ( not ( = ?auto_510017 ?auto_510020 ) ) ( not ( = ?auto_510017 ?auto_510021 ) ) ( not ( = ?auto_510017 ?auto_510022 ) ) ( not ( = ?auto_510017 ?auto_510023 ) ) ( not ( = ?auto_510018 ?auto_510019 ) ) ( not ( = ?auto_510018 ?auto_510020 ) ) ( not ( = ?auto_510018 ?auto_510021 ) ) ( not ( = ?auto_510018 ?auto_510022 ) ) ( not ( = ?auto_510018 ?auto_510023 ) ) ( not ( = ?auto_510019 ?auto_510020 ) ) ( not ( = ?auto_510019 ?auto_510021 ) ) ( not ( = ?auto_510019 ?auto_510022 ) ) ( not ( = ?auto_510019 ?auto_510023 ) ) ( not ( = ?auto_510020 ?auto_510021 ) ) ( not ( = ?auto_510020 ?auto_510022 ) ) ( not ( = ?auto_510020 ?auto_510023 ) ) ( not ( = ?auto_510021 ?auto_510022 ) ) ( not ( = ?auto_510021 ?auto_510023 ) ) ( not ( = ?auto_510022 ?auto_510023 ) ) ( ON ?auto_510021 ?auto_510022 ) ( ON ?auto_510020 ?auto_510021 ) ( ON ?auto_510019 ?auto_510020 ) ( ON ?auto_510018 ?auto_510019 ) ( ON ?auto_510017 ?auto_510018 ) ( ON ?auto_510016 ?auto_510017 ) ( CLEAR ?auto_510014 ) ( ON ?auto_510015 ?auto_510016 ) ( CLEAR ?auto_510015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_510014 ?auto_510015 )
      ( MAKE-9PILE ?auto_510014 ?auto_510015 ?auto_510016 ?auto_510017 ?auto_510018 ?auto_510019 ?auto_510020 ?auto_510021 ?auto_510022 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_510052 - BLOCK
      ?auto_510053 - BLOCK
      ?auto_510054 - BLOCK
      ?auto_510055 - BLOCK
      ?auto_510056 - BLOCK
      ?auto_510057 - BLOCK
      ?auto_510058 - BLOCK
      ?auto_510059 - BLOCK
      ?auto_510060 - BLOCK
    )
    :vars
    (
      ?auto_510061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510060 ?auto_510061 ) ( not ( = ?auto_510052 ?auto_510053 ) ) ( not ( = ?auto_510052 ?auto_510054 ) ) ( not ( = ?auto_510052 ?auto_510055 ) ) ( not ( = ?auto_510052 ?auto_510056 ) ) ( not ( = ?auto_510052 ?auto_510057 ) ) ( not ( = ?auto_510052 ?auto_510058 ) ) ( not ( = ?auto_510052 ?auto_510059 ) ) ( not ( = ?auto_510052 ?auto_510060 ) ) ( not ( = ?auto_510052 ?auto_510061 ) ) ( not ( = ?auto_510053 ?auto_510054 ) ) ( not ( = ?auto_510053 ?auto_510055 ) ) ( not ( = ?auto_510053 ?auto_510056 ) ) ( not ( = ?auto_510053 ?auto_510057 ) ) ( not ( = ?auto_510053 ?auto_510058 ) ) ( not ( = ?auto_510053 ?auto_510059 ) ) ( not ( = ?auto_510053 ?auto_510060 ) ) ( not ( = ?auto_510053 ?auto_510061 ) ) ( not ( = ?auto_510054 ?auto_510055 ) ) ( not ( = ?auto_510054 ?auto_510056 ) ) ( not ( = ?auto_510054 ?auto_510057 ) ) ( not ( = ?auto_510054 ?auto_510058 ) ) ( not ( = ?auto_510054 ?auto_510059 ) ) ( not ( = ?auto_510054 ?auto_510060 ) ) ( not ( = ?auto_510054 ?auto_510061 ) ) ( not ( = ?auto_510055 ?auto_510056 ) ) ( not ( = ?auto_510055 ?auto_510057 ) ) ( not ( = ?auto_510055 ?auto_510058 ) ) ( not ( = ?auto_510055 ?auto_510059 ) ) ( not ( = ?auto_510055 ?auto_510060 ) ) ( not ( = ?auto_510055 ?auto_510061 ) ) ( not ( = ?auto_510056 ?auto_510057 ) ) ( not ( = ?auto_510056 ?auto_510058 ) ) ( not ( = ?auto_510056 ?auto_510059 ) ) ( not ( = ?auto_510056 ?auto_510060 ) ) ( not ( = ?auto_510056 ?auto_510061 ) ) ( not ( = ?auto_510057 ?auto_510058 ) ) ( not ( = ?auto_510057 ?auto_510059 ) ) ( not ( = ?auto_510057 ?auto_510060 ) ) ( not ( = ?auto_510057 ?auto_510061 ) ) ( not ( = ?auto_510058 ?auto_510059 ) ) ( not ( = ?auto_510058 ?auto_510060 ) ) ( not ( = ?auto_510058 ?auto_510061 ) ) ( not ( = ?auto_510059 ?auto_510060 ) ) ( not ( = ?auto_510059 ?auto_510061 ) ) ( not ( = ?auto_510060 ?auto_510061 ) ) ( ON ?auto_510059 ?auto_510060 ) ( ON ?auto_510058 ?auto_510059 ) ( ON ?auto_510057 ?auto_510058 ) ( ON ?auto_510056 ?auto_510057 ) ( ON ?auto_510055 ?auto_510056 ) ( ON ?auto_510054 ?auto_510055 ) ( ON ?auto_510053 ?auto_510054 ) ( ON ?auto_510052 ?auto_510053 ) ( CLEAR ?auto_510052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_510052 )
      ( MAKE-9PILE ?auto_510052 ?auto_510053 ?auto_510054 ?auto_510055 ?auto_510056 ?auto_510057 ?auto_510058 ?auto_510059 ?auto_510060 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510091 - BLOCK
      ?auto_510092 - BLOCK
      ?auto_510093 - BLOCK
      ?auto_510094 - BLOCK
      ?auto_510095 - BLOCK
      ?auto_510096 - BLOCK
      ?auto_510097 - BLOCK
      ?auto_510098 - BLOCK
      ?auto_510099 - BLOCK
      ?auto_510100 - BLOCK
    )
    :vars
    (
      ?auto_510101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_510099 ) ( ON ?auto_510100 ?auto_510101 ) ( CLEAR ?auto_510100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_510091 ) ( ON ?auto_510092 ?auto_510091 ) ( ON ?auto_510093 ?auto_510092 ) ( ON ?auto_510094 ?auto_510093 ) ( ON ?auto_510095 ?auto_510094 ) ( ON ?auto_510096 ?auto_510095 ) ( ON ?auto_510097 ?auto_510096 ) ( ON ?auto_510098 ?auto_510097 ) ( ON ?auto_510099 ?auto_510098 ) ( not ( = ?auto_510091 ?auto_510092 ) ) ( not ( = ?auto_510091 ?auto_510093 ) ) ( not ( = ?auto_510091 ?auto_510094 ) ) ( not ( = ?auto_510091 ?auto_510095 ) ) ( not ( = ?auto_510091 ?auto_510096 ) ) ( not ( = ?auto_510091 ?auto_510097 ) ) ( not ( = ?auto_510091 ?auto_510098 ) ) ( not ( = ?auto_510091 ?auto_510099 ) ) ( not ( = ?auto_510091 ?auto_510100 ) ) ( not ( = ?auto_510091 ?auto_510101 ) ) ( not ( = ?auto_510092 ?auto_510093 ) ) ( not ( = ?auto_510092 ?auto_510094 ) ) ( not ( = ?auto_510092 ?auto_510095 ) ) ( not ( = ?auto_510092 ?auto_510096 ) ) ( not ( = ?auto_510092 ?auto_510097 ) ) ( not ( = ?auto_510092 ?auto_510098 ) ) ( not ( = ?auto_510092 ?auto_510099 ) ) ( not ( = ?auto_510092 ?auto_510100 ) ) ( not ( = ?auto_510092 ?auto_510101 ) ) ( not ( = ?auto_510093 ?auto_510094 ) ) ( not ( = ?auto_510093 ?auto_510095 ) ) ( not ( = ?auto_510093 ?auto_510096 ) ) ( not ( = ?auto_510093 ?auto_510097 ) ) ( not ( = ?auto_510093 ?auto_510098 ) ) ( not ( = ?auto_510093 ?auto_510099 ) ) ( not ( = ?auto_510093 ?auto_510100 ) ) ( not ( = ?auto_510093 ?auto_510101 ) ) ( not ( = ?auto_510094 ?auto_510095 ) ) ( not ( = ?auto_510094 ?auto_510096 ) ) ( not ( = ?auto_510094 ?auto_510097 ) ) ( not ( = ?auto_510094 ?auto_510098 ) ) ( not ( = ?auto_510094 ?auto_510099 ) ) ( not ( = ?auto_510094 ?auto_510100 ) ) ( not ( = ?auto_510094 ?auto_510101 ) ) ( not ( = ?auto_510095 ?auto_510096 ) ) ( not ( = ?auto_510095 ?auto_510097 ) ) ( not ( = ?auto_510095 ?auto_510098 ) ) ( not ( = ?auto_510095 ?auto_510099 ) ) ( not ( = ?auto_510095 ?auto_510100 ) ) ( not ( = ?auto_510095 ?auto_510101 ) ) ( not ( = ?auto_510096 ?auto_510097 ) ) ( not ( = ?auto_510096 ?auto_510098 ) ) ( not ( = ?auto_510096 ?auto_510099 ) ) ( not ( = ?auto_510096 ?auto_510100 ) ) ( not ( = ?auto_510096 ?auto_510101 ) ) ( not ( = ?auto_510097 ?auto_510098 ) ) ( not ( = ?auto_510097 ?auto_510099 ) ) ( not ( = ?auto_510097 ?auto_510100 ) ) ( not ( = ?auto_510097 ?auto_510101 ) ) ( not ( = ?auto_510098 ?auto_510099 ) ) ( not ( = ?auto_510098 ?auto_510100 ) ) ( not ( = ?auto_510098 ?auto_510101 ) ) ( not ( = ?auto_510099 ?auto_510100 ) ) ( not ( = ?auto_510099 ?auto_510101 ) ) ( not ( = ?auto_510100 ?auto_510101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_510100 ?auto_510101 )
      ( !STACK ?auto_510100 ?auto_510099 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510133 - BLOCK
      ?auto_510134 - BLOCK
      ?auto_510135 - BLOCK
      ?auto_510136 - BLOCK
      ?auto_510137 - BLOCK
      ?auto_510138 - BLOCK
      ?auto_510139 - BLOCK
      ?auto_510140 - BLOCK
      ?auto_510141 - BLOCK
      ?auto_510142 - BLOCK
    )
    :vars
    (
      ?auto_510143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510142 ?auto_510143 ) ( ON-TABLE ?auto_510133 ) ( ON ?auto_510134 ?auto_510133 ) ( ON ?auto_510135 ?auto_510134 ) ( ON ?auto_510136 ?auto_510135 ) ( ON ?auto_510137 ?auto_510136 ) ( ON ?auto_510138 ?auto_510137 ) ( ON ?auto_510139 ?auto_510138 ) ( ON ?auto_510140 ?auto_510139 ) ( not ( = ?auto_510133 ?auto_510134 ) ) ( not ( = ?auto_510133 ?auto_510135 ) ) ( not ( = ?auto_510133 ?auto_510136 ) ) ( not ( = ?auto_510133 ?auto_510137 ) ) ( not ( = ?auto_510133 ?auto_510138 ) ) ( not ( = ?auto_510133 ?auto_510139 ) ) ( not ( = ?auto_510133 ?auto_510140 ) ) ( not ( = ?auto_510133 ?auto_510141 ) ) ( not ( = ?auto_510133 ?auto_510142 ) ) ( not ( = ?auto_510133 ?auto_510143 ) ) ( not ( = ?auto_510134 ?auto_510135 ) ) ( not ( = ?auto_510134 ?auto_510136 ) ) ( not ( = ?auto_510134 ?auto_510137 ) ) ( not ( = ?auto_510134 ?auto_510138 ) ) ( not ( = ?auto_510134 ?auto_510139 ) ) ( not ( = ?auto_510134 ?auto_510140 ) ) ( not ( = ?auto_510134 ?auto_510141 ) ) ( not ( = ?auto_510134 ?auto_510142 ) ) ( not ( = ?auto_510134 ?auto_510143 ) ) ( not ( = ?auto_510135 ?auto_510136 ) ) ( not ( = ?auto_510135 ?auto_510137 ) ) ( not ( = ?auto_510135 ?auto_510138 ) ) ( not ( = ?auto_510135 ?auto_510139 ) ) ( not ( = ?auto_510135 ?auto_510140 ) ) ( not ( = ?auto_510135 ?auto_510141 ) ) ( not ( = ?auto_510135 ?auto_510142 ) ) ( not ( = ?auto_510135 ?auto_510143 ) ) ( not ( = ?auto_510136 ?auto_510137 ) ) ( not ( = ?auto_510136 ?auto_510138 ) ) ( not ( = ?auto_510136 ?auto_510139 ) ) ( not ( = ?auto_510136 ?auto_510140 ) ) ( not ( = ?auto_510136 ?auto_510141 ) ) ( not ( = ?auto_510136 ?auto_510142 ) ) ( not ( = ?auto_510136 ?auto_510143 ) ) ( not ( = ?auto_510137 ?auto_510138 ) ) ( not ( = ?auto_510137 ?auto_510139 ) ) ( not ( = ?auto_510137 ?auto_510140 ) ) ( not ( = ?auto_510137 ?auto_510141 ) ) ( not ( = ?auto_510137 ?auto_510142 ) ) ( not ( = ?auto_510137 ?auto_510143 ) ) ( not ( = ?auto_510138 ?auto_510139 ) ) ( not ( = ?auto_510138 ?auto_510140 ) ) ( not ( = ?auto_510138 ?auto_510141 ) ) ( not ( = ?auto_510138 ?auto_510142 ) ) ( not ( = ?auto_510138 ?auto_510143 ) ) ( not ( = ?auto_510139 ?auto_510140 ) ) ( not ( = ?auto_510139 ?auto_510141 ) ) ( not ( = ?auto_510139 ?auto_510142 ) ) ( not ( = ?auto_510139 ?auto_510143 ) ) ( not ( = ?auto_510140 ?auto_510141 ) ) ( not ( = ?auto_510140 ?auto_510142 ) ) ( not ( = ?auto_510140 ?auto_510143 ) ) ( not ( = ?auto_510141 ?auto_510142 ) ) ( not ( = ?auto_510141 ?auto_510143 ) ) ( not ( = ?auto_510142 ?auto_510143 ) ) ( CLEAR ?auto_510140 ) ( ON ?auto_510141 ?auto_510142 ) ( CLEAR ?auto_510141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_510133 ?auto_510134 ?auto_510135 ?auto_510136 ?auto_510137 ?auto_510138 ?auto_510139 ?auto_510140 ?auto_510141 )
      ( MAKE-10PILE ?auto_510133 ?auto_510134 ?auto_510135 ?auto_510136 ?auto_510137 ?auto_510138 ?auto_510139 ?auto_510140 ?auto_510141 ?auto_510142 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510175 - BLOCK
      ?auto_510176 - BLOCK
      ?auto_510177 - BLOCK
      ?auto_510178 - BLOCK
      ?auto_510179 - BLOCK
      ?auto_510180 - BLOCK
      ?auto_510181 - BLOCK
      ?auto_510182 - BLOCK
      ?auto_510183 - BLOCK
      ?auto_510184 - BLOCK
    )
    :vars
    (
      ?auto_510185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510184 ?auto_510185 ) ( ON-TABLE ?auto_510175 ) ( ON ?auto_510176 ?auto_510175 ) ( ON ?auto_510177 ?auto_510176 ) ( ON ?auto_510178 ?auto_510177 ) ( ON ?auto_510179 ?auto_510178 ) ( ON ?auto_510180 ?auto_510179 ) ( ON ?auto_510181 ?auto_510180 ) ( not ( = ?auto_510175 ?auto_510176 ) ) ( not ( = ?auto_510175 ?auto_510177 ) ) ( not ( = ?auto_510175 ?auto_510178 ) ) ( not ( = ?auto_510175 ?auto_510179 ) ) ( not ( = ?auto_510175 ?auto_510180 ) ) ( not ( = ?auto_510175 ?auto_510181 ) ) ( not ( = ?auto_510175 ?auto_510182 ) ) ( not ( = ?auto_510175 ?auto_510183 ) ) ( not ( = ?auto_510175 ?auto_510184 ) ) ( not ( = ?auto_510175 ?auto_510185 ) ) ( not ( = ?auto_510176 ?auto_510177 ) ) ( not ( = ?auto_510176 ?auto_510178 ) ) ( not ( = ?auto_510176 ?auto_510179 ) ) ( not ( = ?auto_510176 ?auto_510180 ) ) ( not ( = ?auto_510176 ?auto_510181 ) ) ( not ( = ?auto_510176 ?auto_510182 ) ) ( not ( = ?auto_510176 ?auto_510183 ) ) ( not ( = ?auto_510176 ?auto_510184 ) ) ( not ( = ?auto_510176 ?auto_510185 ) ) ( not ( = ?auto_510177 ?auto_510178 ) ) ( not ( = ?auto_510177 ?auto_510179 ) ) ( not ( = ?auto_510177 ?auto_510180 ) ) ( not ( = ?auto_510177 ?auto_510181 ) ) ( not ( = ?auto_510177 ?auto_510182 ) ) ( not ( = ?auto_510177 ?auto_510183 ) ) ( not ( = ?auto_510177 ?auto_510184 ) ) ( not ( = ?auto_510177 ?auto_510185 ) ) ( not ( = ?auto_510178 ?auto_510179 ) ) ( not ( = ?auto_510178 ?auto_510180 ) ) ( not ( = ?auto_510178 ?auto_510181 ) ) ( not ( = ?auto_510178 ?auto_510182 ) ) ( not ( = ?auto_510178 ?auto_510183 ) ) ( not ( = ?auto_510178 ?auto_510184 ) ) ( not ( = ?auto_510178 ?auto_510185 ) ) ( not ( = ?auto_510179 ?auto_510180 ) ) ( not ( = ?auto_510179 ?auto_510181 ) ) ( not ( = ?auto_510179 ?auto_510182 ) ) ( not ( = ?auto_510179 ?auto_510183 ) ) ( not ( = ?auto_510179 ?auto_510184 ) ) ( not ( = ?auto_510179 ?auto_510185 ) ) ( not ( = ?auto_510180 ?auto_510181 ) ) ( not ( = ?auto_510180 ?auto_510182 ) ) ( not ( = ?auto_510180 ?auto_510183 ) ) ( not ( = ?auto_510180 ?auto_510184 ) ) ( not ( = ?auto_510180 ?auto_510185 ) ) ( not ( = ?auto_510181 ?auto_510182 ) ) ( not ( = ?auto_510181 ?auto_510183 ) ) ( not ( = ?auto_510181 ?auto_510184 ) ) ( not ( = ?auto_510181 ?auto_510185 ) ) ( not ( = ?auto_510182 ?auto_510183 ) ) ( not ( = ?auto_510182 ?auto_510184 ) ) ( not ( = ?auto_510182 ?auto_510185 ) ) ( not ( = ?auto_510183 ?auto_510184 ) ) ( not ( = ?auto_510183 ?auto_510185 ) ) ( not ( = ?auto_510184 ?auto_510185 ) ) ( ON ?auto_510183 ?auto_510184 ) ( CLEAR ?auto_510181 ) ( ON ?auto_510182 ?auto_510183 ) ( CLEAR ?auto_510182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_510175 ?auto_510176 ?auto_510177 ?auto_510178 ?auto_510179 ?auto_510180 ?auto_510181 ?auto_510182 )
      ( MAKE-10PILE ?auto_510175 ?auto_510176 ?auto_510177 ?auto_510178 ?auto_510179 ?auto_510180 ?auto_510181 ?auto_510182 ?auto_510183 ?auto_510184 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510217 - BLOCK
      ?auto_510218 - BLOCK
      ?auto_510219 - BLOCK
      ?auto_510220 - BLOCK
      ?auto_510221 - BLOCK
      ?auto_510222 - BLOCK
      ?auto_510223 - BLOCK
      ?auto_510224 - BLOCK
      ?auto_510225 - BLOCK
      ?auto_510226 - BLOCK
    )
    :vars
    (
      ?auto_510227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510226 ?auto_510227 ) ( ON-TABLE ?auto_510217 ) ( ON ?auto_510218 ?auto_510217 ) ( ON ?auto_510219 ?auto_510218 ) ( ON ?auto_510220 ?auto_510219 ) ( ON ?auto_510221 ?auto_510220 ) ( ON ?auto_510222 ?auto_510221 ) ( not ( = ?auto_510217 ?auto_510218 ) ) ( not ( = ?auto_510217 ?auto_510219 ) ) ( not ( = ?auto_510217 ?auto_510220 ) ) ( not ( = ?auto_510217 ?auto_510221 ) ) ( not ( = ?auto_510217 ?auto_510222 ) ) ( not ( = ?auto_510217 ?auto_510223 ) ) ( not ( = ?auto_510217 ?auto_510224 ) ) ( not ( = ?auto_510217 ?auto_510225 ) ) ( not ( = ?auto_510217 ?auto_510226 ) ) ( not ( = ?auto_510217 ?auto_510227 ) ) ( not ( = ?auto_510218 ?auto_510219 ) ) ( not ( = ?auto_510218 ?auto_510220 ) ) ( not ( = ?auto_510218 ?auto_510221 ) ) ( not ( = ?auto_510218 ?auto_510222 ) ) ( not ( = ?auto_510218 ?auto_510223 ) ) ( not ( = ?auto_510218 ?auto_510224 ) ) ( not ( = ?auto_510218 ?auto_510225 ) ) ( not ( = ?auto_510218 ?auto_510226 ) ) ( not ( = ?auto_510218 ?auto_510227 ) ) ( not ( = ?auto_510219 ?auto_510220 ) ) ( not ( = ?auto_510219 ?auto_510221 ) ) ( not ( = ?auto_510219 ?auto_510222 ) ) ( not ( = ?auto_510219 ?auto_510223 ) ) ( not ( = ?auto_510219 ?auto_510224 ) ) ( not ( = ?auto_510219 ?auto_510225 ) ) ( not ( = ?auto_510219 ?auto_510226 ) ) ( not ( = ?auto_510219 ?auto_510227 ) ) ( not ( = ?auto_510220 ?auto_510221 ) ) ( not ( = ?auto_510220 ?auto_510222 ) ) ( not ( = ?auto_510220 ?auto_510223 ) ) ( not ( = ?auto_510220 ?auto_510224 ) ) ( not ( = ?auto_510220 ?auto_510225 ) ) ( not ( = ?auto_510220 ?auto_510226 ) ) ( not ( = ?auto_510220 ?auto_510227 ) ) ( not ( = ?auto_510221 ?auto_510222 ) ) ( not ( = ?auto_510221 ?auto_510223 ) ) ( not ( = ?auto_510221 ?auto_510224 ) ) ( not ( = ?auto_510221 ?auto_510225 ) ) ( not ( = ?auto_510221 ?auto_510226 ) ) ( not ( = ?auto_510221 ?auto_510227 ) ) ( not ( = ?auto_510222 ?auto_510223 ) ) ( not ( = ?auto_510222 ?auto_510224 ) ) ( not ( = ?auto_510222 ?auto_510225 ) ) ( not ( = ?auto_510222 ?auto_510226 ) ) ( not ( = ?auto_510222 ?auto_510227 ) ) ( not ( = ?auto_510223 ?auto_510224 ) ) ( not ( = ?auto_510223 ?auto_510225 ) ) ( not ( = ?auto_510223 ?auto_510226 ) ) ( not ( = ?auto_510223 ?auto_510227 ) ) ( not ( = ?auto_510224 ?auto_510225 ) ) ( not ( = ?auto_510224 ?auto_510226 ) ) ( not ( = ?auto_510224 ?auto_510227 ) ) ( not ( = ?auto_510225 ?auto_510226 ) ) ( not ( = ?auto_510225 ?auto_510227 ) ) ( not ( = ?auto_510226 ?auto_510227 ) ) ( ON ?auto_510225 ?auto_510226 ) ( ON ?auto_510224 ?auto_510225 ) ( CLEAR ?auto_510222 ) ( ON ?auto_510223 ?auto_510224 ) ( CLEAR ?auto_510223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_510217 ?auto_510218 ?auto_510219 ?auto_510220 ?auto_510221 ?auto_510222 ?auto_510223 )
      ( MAKE-10PILE ?auto_510217 ?auto_510218 ?auto_510219 ?auto_510220 ?auto_510221 ?auto_510222 ?auto_510223 ?auto_510224 ?auto_510225 ?auto_510226 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510259 - BLOCK
      ?auto_510260 - BLOCK
      ?auto_510261 - BLOCK
      ?auto_510262 - BLOCK
      ?auto_510263 - BLOCK
      ?auto_510264 - BLOCK
      ?auto_510265 - BLOCK
      ?auto_510266 - BLOCK
      ?auto_510267 - BLOCK
      ?auto_510268 - BLOCK
    )
    :vars
    (
      ?auto_510269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510268 ?auto_510269 ) ( ON-TABLE ?auto_510259 ) ( ON ?auto_510260 ?auto_510259 ) ( ON ?auto_510261 ?auto_510260 ) ( ON ?auto_510262 ?auto_510261 ) ( ON ?auto_510263 ?auto_510262 ) ( not ( = ?auto_510259 ?auto_510260 ) ) ( not ( = ?auto_510259 ?auto_510261 ) ) ( not ( = ?auto_510259 ?auto_510262 ) ) ( not ( = ?auto_510259 ?auto_510263 ) ) ( not ( = ?auto_510259 ?auto_510264 ) ) ( not ( = ?auto_510259 ?auto_510265 ) ) ( not ( = ?auto_510259 ?auto_510266 ) ) ( not ( = ?auto_510259 ?auto_510267 ) ) ( not ( = ?auto_510259 ?auto_510268 ) ) ( not ( = ?auto_510259 ?auto_510269 ) ) ( not ( = ?auto_510260 ?auto_510261 ) ) ( not ( = ?auto_510260 ?auto_510262 ) ) ( not ( = ?auto_510260 ?auto_510263 ) ) ( not ( = ?auto_510260 ?auto_510264 ) ) ( not ( = ?auto_510260 ?auto_510265 ) ) ( not ( = ?auto_510260 ?auto_510266 ) ) ( not ( = ?auto_510260 ?auto_510267 ) ) ( not ( = ?auto_510260 ?auto_510268 ) ) ( not ( = ?auto_510260 ?auto_510269 ) ) ( not ( = ?auto_510261 ?auto_510262 ) ) ( not ( = ?auto_510261 ?auto_510263 ) ) ( not ( = ?auto_510261 ?auto_510264 ) ) ( not ( = ?auto_510261 ?auto_510265 ) ) ( not ( = ?auto_510261 ?auto_510266 ) ) ( not ( = ?auto_510261 ?auto_510267 ) ) ( not ( = ?auto_510261 ?auto_510268 ) ) ( not ( = ?auto_510261 ?auto_510269 ) ) ( not ( = ?auto_510262 ?auto_510263 ) ) ( not ( = ?auto_510262 ?auto_510264 ) ) ( not ( = ?auto_510262 ?auto_510265 ) ) ( not ( = ?auto_510262 ?auto_510266 ) ) ( not ( = ?auto_510262 ?auto_510267 ) ) ( not ( = ?auto_510262 ?auto_510268 ) ) ( not ( = ?auto_510262 ?auto_510269 ) ) ( not ( = ?auto_510263 ?auto_510264 ) ) ( not ( = ?auto_510263 ?auto_510265 ) ) ( not ( = ?auto_510263 ?auto_510266 ) ) ( not ( = ?auto_510263 ?auto_510267 ) ) ( not ( = ?auto_510263 ?auto_510268 ) ) ( not ( = ?auto_510263 ?auto_510269 ) ) ( not ( = ?auto_510264 ?auto_510265 ) ) ( not ( = ?auto_510264 ?auto_510266 ) ) ( not ( = ?auto_510264 ?auto_510267 ) ) ( not ( = ?auto_510264 ?auto_510268 ) ) ( not ( = ?auto_510264 ?auto_510269 ) ) ( not ( = ?auto_510265 ?auto_510266 ) ) ( not ( = ?auto_510265 ?auto_510267 ) ) ( not ( = ?auto_510265 ?auto_510268 ) ) ( not ( = ?auto_510265 ?auto_510269 ) ) ( not ( = ?auto_510266 ?auto_510267 ) ) ( not ( = ?auto_510266 ?auto_510268 ) ) ( not ( = ?auto_510266 ?auto_510269 ) ) ( not ( = ?auto_510267 ?auto_510268 ) ) ( not ( = ?auto_510267 ?auto_510269 ) ) ( not ( = ?auto_510268 ?auto_510269 ) ) ( ON ?auto_510267 ?auto_510268 ) ( ON ?auto_510266 ?auto_510267 ) ( ON ?auto_510265 ?auto_510266 ) ( CLEAR ?auto_510263 ) ( ON ?auto_510264 ?auto_510265 ) ( CLEAR ?auto_510264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_510259 ?auto_510260 ?auto_510261 ?auto_510262 ?auto_510263 ?auto_510264 )
      ( MAKE-10PILE ?auto_510259 ?auto_510260 ?auto_510261 ?auto_510262 ?auto_510263 ?auto_510264 ?auto_510265 ?auto_510266 ?auto_510267 ?auto_510268 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510301 - BLOCK
      ?auto_510302 - BLOCK
      ?auto_510303 - BLOCK
      ?auto_510304 - BLOCK
      ?auto_510305 - BLOCK
      ?auto_510306 - BLOCK
      ?auto_510307 - BLOCK
      ?auto_510308 - BLOCK
      ?auto_510309 - BLOCK
      ?auto_510310 - BLOCK
    )
    :vars
    (
      ?auto_510311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510310 ?auto_510311 ) ( ON-TABLE ?auto_510301 ) ( ON ?auto_510302 ?auto_510301 ) ( ON ?auto_510303 ?auto_510302 ) ( ON ?auto_510304 ?auto_510303 ) ( not ( = ?auto_510301 ?auto_510302 ) ) ( not ( = ?auto_510301 ?auto_510303 ) ) ( not ( = ?auto_510301 ?auto_510304 ) ) ( not ( = ?auto_510301 ?auto_510305 ) ) ( not ( = ?auto_510301 ?auto_510306 ) ) ( not ( = ?auto_510301 ?auto_510307 ) ) ( not ( = ?auto_510301 ?auto_510308 ) ) ( not ( = ?auto_510301 ?auto_510309 ) ) ( not ( = ?auto_510301 ?auto_510310 ) ) ( not ( = ?auto_510301 ?auto_510311 ) ) ( not ( = ?auto_510302 ?auto_510303 ) ) ( not ( = ?auto_510302 ?auto_510304 ) ) ( not ( = ?auto_510302 ?auto_510305 ) ) ( not ( = ?auto_510302 ?auto_510306 ) ) ( not ( = ?auto_510302 ?auto_510307 ) ) ( not ( = ?auto_510302 ?auto_510308 ) ) ( not ( = ?auto_510302 ?auto_510309 ) ) ( not ( = ?auto_510302 ?auto_510310 ) ) ( not ( = ?auto_510302 ?auto_510311 ) ) ( not ( = ?auto_510303 ?auto_510304 ) ) ( not ( = ?auto_510303 ?auto_510305 ) ) ( not ( = ?auto_510303 ?auto_510306 ) ) ( not ( = ?auto_510303 ?auto_510307 ) ) ( not ( = ?auto_510303 ?auto_510308 ) ) ( not ( = ?auto_510303 ?auto_510309 ) ) ( not ( = ?auto_510303 ?auto_510310 ) ) ( not ( = ?auto_510303 ?auto_510311 ) ) ( not ( = ?auto_510304 ?auto_510305 ) ) ( not ( = ?auto_510304 ?auto_510306 ) ) ( not ( = ?auto_510304 ?auto_510307 ) ) ( not ( = ?auto_510304 ?auto_510308 ) ) ( not ( = ?auto_510304 ?auto_510309 ) ) ( not ( = ?auto_510304 ?auto_510310 ) ) ( not ( = ?auto_510304 ?auto_510311 ) ) ( not ( = ?auto_510305 ?auto_510306 ) ) ( not ( = ?auto_510305 ?auto_510307 ) ) ( not ( = ?auto_510305 ?auto_510308 ) ) ( not ( = ?auto_510305 ?auto_510309 ) ) ( not ( = ?auto_510305 ?auto_510310 ) ) ( not ( = ?auto_510305 ?auto_510311 ) ) ( not ( = ?auto_510306 ?auto_510307 ) ) ( not ( = ?auto_510306 ?auto_510308 ) ) ( not ( = ?auto_510306 ?auto_510309 ) ) ( not ( = ?auto_510306 ?auto_510310 ) ) ( not ( = ?auto_510306 ?auto_510311 ) ) ( not ( = ?auto_510307 ?auto_510308 ) ) ( not ( = ?auto_510307 ?auto_510309 ) ) ( not ( = ?auto_510307 ?auto_510310 ) ) ( not ( = ?auto_510307 ?auto_510311 ) ) ( not ( = ?auto_510308 ?auto_510309 ) ) ( not ( = ?auto_510308 ?auto_510310 ) ) ( not ( = ?auto_510308 ?auto_510311 ) ) ( not ( = ?auto_510309 ?auto_510310 ) ) ( not ( = ?auto_510309 ?auto_510311 ) ) ( not ( = ?auto_510310 ?auto_510311 ) ) ( ON ?auto_510309 ?auto_510310 ) ( ON ?auto_510308 ?auto_510309 ) ( ON ?auto_510307 ?auto_510308 ) ( ON ?auto_510306 ?auto_510307 ) ( CLEAR ?auto_510304 ) ( ON ?auto_510305 ?auto_510306 ) ( CLEAR ?auto_510305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_510301 ?auto_510302 ?auto_510303 ?auto_510304 ?auto_510305 )
      ( MAKE-10PILE ?auto_510301 ?auto_510302 ?auto_510303 ?auto_510304 ?auto_510305 ?auto_510306 ?auto_510307 ?auto_510308 ?auto_510309 ?auto_510310 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510343 - BLOCK
      ?auto_510344 - BLOCK
      ?auto_510345 - BLOCK
      ?auto_510346 - BLOCK
      ?auto_510347 - BLOCK
      ?auto_510348 - BLOCK
      ?auto_510349 - BLOCK
      ?auto_510350 - BLOCK
      ?auto_510351 - BLOCK
      ?auto_510352 - BLOCK
    )
    :vars
    (
      ?auto_510353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510352 ?auto_510353 ) ( ON-TABLE ?auto_510343 ) ( ON ?auto_510344 ?auto_510343 ) ( ON ?auto_510345 ?auto_510344 ) ( not ( = ?auto_510343 ?auto_510344 ) ) ( not ( = ?auto_510343 ?auto_510345 ) ) ( not ( = ?auto_510343 ?auto_510346 ) ) ( not ( = ?auto_510343 ?auto_510347 ) ) ( not ( = ?auto_510343 ?auto_510348 ) ) ( not ( = ?auto_510343 ?auto_510349 ) ) ( not ( = ?auto_510343 ?auto_510350 ) ) ( not ( = ?auto_510343 ?auto_510351 ) ) ( not ( = ?auto_510343 ?auto_510352 ) ) ( not ( = ?auto_510343 ?auto_510353 ) ) ( not ( = ?auto_510344 ?auto_510345 ) ) ( not ( = ?auto_510344 ?auto_510346 ) ) ( not ( = ?auto_510344 ?auto_510347 ) ) ( not ( = ?auto_510344 ?auto_510348 ) ) ( not ( = ?auto_510344 ?auto_510349 ) ) ( not ( = ?auto_510344 ?auto_510350 ) ) ( not ( = ?auto_510344 ?auto_510351 ) ) ( not ( = ?auto_510344 ?auto_510352 ) ) ( not ( = ?auto_510344 ?auto_510353 ) ) ( not ( = ?auto_510345 ?auto_510346 ) ) ( not ( = ?auto_510345 ?auto_510347 ) ) ( not ( = ?auto_510345 ?auto_510348 ) ) ( not ( = ?auto_510345 ?auto_510349 ) ) ( not ( = ?auto_510345 ?auto_510350 ) ) ( not ( = ?auto_510345 ?auto_510351 ) ) ( not ( = ?auto_510345 ?auto_510352 ) ) ( not ( = ?auto_510345 ?auto_510353 ) ) ( not ( = ?auto_510346 ?auto_510347 ) ) ( not ( = ?auto_510346 ?auto_510348 ) ) ( not ( = ?auto_510346 ?auto_510349 ) ) ( not ( = ?auto_510346 ?auto_510350 ) ) ( not ( = ?auto_510346 ?auto_510351 ) ) ( not ( = ?auto_510346 ?auto_510352 ) ) ( not ( = ?auto_510346 ?auto_510353 ) ) ( not ( = ?auto_510347 ?auto_510348 ) ) ( not ( = ?auto_510347 ?auto_510349 ) ) ( not ( = ?auto_510347 ?auto_510350 ) ) ( not ( = ?auto_510347 ?auto_510351 ) ) ( not ( = ?auto_510347 ?auto_510352 ) ) ( not ( = ?auto_510347 ?auto_510353 ) ) ( not ( = ?auto_510348 ?auto_510349 ) ) ( not ( = ?auto_510348 ?auto_510350 ) ) ( not ( = ?auto_510348 ?auto_510351 ) ) ( not ( = ?auto_510348 ?auto_510352 ) ) ( not ( = ?auto_510348 ?auto_510353 ) ) ( not ( = ?auto_510349 ?auto_510350 ) ) ( not ( = ?auto_510349 ?auto_510351 ) ) ( not ( = ?auto_510349 ?auto_510352 ) ) ( not ( = ?auto_510349 ?auto_510353 ) ) ( not ( = ?auto_510350 ?auto_510351 ) ) ( not ( = ?auto_510350 ?auto_510352 ) ) ( not ( = ?auto_510350 ?auto_510353 ) ) ( not ( = ?auto_510351 ?auto_510352 ) ) ( not ( = ?auto_510351 ?auto_510353 ) ) ( not ( = ?auto_510352 ?auto_510353 ) ) ( ON ?auto_510351 ?auto_510352 ) ( ON ?auto_510350 ?auto_510351 ) ( ON ?auto_510349 ?auto_510350 ) ( ON ?auto_510348 ?auto_510349 ) ( ON ?auto_510347 ?auto_510348 ) ( CLEAR ?auto_510345 ) ( ON ?auto_510346 ?auto_510347 ) ( CLEAR ?auto_510346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_510343 ?auto_510344 ?auto_510345 ?auto_510346 )
      ( MAKE-10PILE ?auto_510343 ?auto_510344 ?auto_510345 ?auto_510346 ?auto_510347 ?auto_510348 ?auto_510349 ?auto_510350 ?auto_510351 ?auto_510352 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510385 - BLOCK
      ?auto_510386 - BLOCK
      ?auto_510387 - BLOCK
      ?auto_510388 - BLOCK
      ?auto_510389 - BLOCK
      ?auto_510390 - BLOCK
      ?auto_510391 - BLOCK
      ?auto_510392 - BLOCK
      ?auto_510393 - BLOCK
      ?auto_510394 - BLOCK
    )
    :vars
    (
      ?auto_510395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510394 ?auto_510395 ) ( ON-TABLE ?auto_510385 ) ( ON ?auto_510386 ?auto_510385 ) ( not ( = ?auto_510385 ?auto_510386 ) ) ( not ( = ?auto_510385 ?auto_510387 ) ) ( not ( = ?auto_510385 ?auto_510388 ) ) ( not ( = ?auto_510385 ?auto_510389 ) ) ( not ( = ?auto_510385 ?auto_510390 ) ) ( not ( = ?auto_510385 ?auto_510391 ) ) ( not ( = ?auto_510385 ?auto_510392 ) ) ( not ( = ?auto_510385 ?auto_510393 ) ) ( not ( = ?auto_510385 ?auto_510394 ) ) ( not ( = ?auto_510385 ?auto_510395 ) ) ( not ( = ?auto_510386 ?auto_510387 ) ) ( not ( = ?auto_510386 ?auto_510388 ) ) ( not ( = ?auto_510386 ?auto_510389 ) ) ( not ( = ?auto_510386 ?auto_510390 ) ) ( not ( = ?auto_510386 ?auto_510391 ) ) ( not ( = ?auto_510386 ?auto_510392 ) ) ( not ( = ?auto_510386 ?auto_510393 ) ) ( not ( = ?auto_510386 ?auto_510394 ) ) ( not ( = ?auto_510386 ?auto_510395 ) ) ( not ( = ?auto_510387 ?auto_510388 ) ) ( not ( = ?auto_510387 ?auto_510389 ) ) ( not ( = ?auto_510387 ?auto_510390 ) ) ( not ( = ?auto_510387 ?auto_510391 ) ) ( not ( = ?auto_510387 ?auto_510392 ) ) ( not ( = ?auto_510387 ?auto_510393 ) ) ( not ( = ?auto_510387 ?auto_510394 ) ) ( not ( = ?auto_510387 ?auto_510395 ) ) ( not ( = ?auto_510388 ?auto_510389 ) ) ( not ( = ?auto_510388 ?auto_510390 ) ) ( not ( = ?auto_510388 ?auto_510391 ) ) ( not ( = ?auto_510388 ?auto_510392 ) ) ( not ( = ?auto_510388 ?auto_510393 ) ) ( not ( = ?auto_510388 ?auto_510394 ) ) ( not ( = ?auto_510388 ?auto_510395 ) ) ( not ( = ?auto_510389 ?auto_510390 ) ) ( not ( = ?auto_510389 ?auto_510391 ) ) ( not ( = ?auto_510389 ?auto_510392 ) ) ( not ( = ?auto_510389 ?auto_510393 ) ) ( not ( = ?auto_510389 ?auto_510394 ) ) ( not ( = ?auto_510389 ?auto_510395 ) ) ( not ( = ?auto_510390 ?auto_510391 ) ) ( not ( = ?auto_510390 ?auto_510392 ) ) ( not ( = ?auto_510390 ?auto_510393 ) ) ( not ( = ?auto_510390 ?auto_510394 ) ) ( not ( = ?auto_510390 ?auto_510395 ) ) ( not ( = ?auto_510391 ?auto_510392 ) ) ( not ( = ?auto_510391 ?auto_510393 ) ) ( not ( = ?auto_510391 ?auto_510394 ) ) ( not ( = ?auto_510391 ?auto_510395 ) ) ( not ( = ?auto_510392 ?auto_510393 ) ) ( not ( = ?auto_510392 ?auto_510394 ) ) ( not ( = ?auto_510392 ?auto_510395 ) ) ( not ( = ?auto_510393 ?auto_510394 ) ) ( not ( = ?auto_510393 ?auto_510395 ) ) ( not ( = ?auto_510394 ?auto_510395 ) ) ( ON ?auto_510393 ?auto_510394 ) ( ON ?auto_510392 ?auto_510393 ) ( ON ?auto_510391 ?auto_510392 ) ( ON ?auto_510390 ?auto_510391 ) ( ON ?auto_510389 ?auto_510390 ) ( ON ?auto_510388 ?auto_510389 ) ( CLEAR ?auto_510386 ) ( ON ?auto_510387 ?auto_510388 ) ( CLEAR ?auto_510387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_510385 ?auto_510386 ?auto_510387 )
      ( MAKE-10PILE ?auto_510385 ?auto_510386 ?auto_510387 ?auto_510388 ?auto_510389 ?auto_510390 ?auto_510391 ?auto_510392 ?auto_510393 ?auto_510394 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510427 - BLOCK
      ?auto_510428 - BLOCK
      ?auto_510429 - BLOCK
      ?auto_510430 - BLOCK
      ?auto_510431 - BLOCK
      ?auto_510432 - BLOCK
      ?auto_510433 - BLOCK
      ?auto_510434 - BLOCK
      ?auto_510435 - BLOCK
      ?auto_510436 - BLOCK
    )
    :vars
    (
      ?auto_510437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510436 ?auto_510437 ) ( ON-TABLE ?auto_510427 ) ( not ( = ?auto_510427 ?auto_510428 ) ) ( not ( = ?auto_510427 ?auto_510429 ) ) ( not ( = ?auto_510427 ?auto_510430 ) ) ( not ( = ?auto_510427 ?auto_510431 ) ) ( not ( = ?auto_510427 ?auto_510432 ) ) ( not ( = ?auto_510427 ?auto_510433 ) ) ( not ( = ?auto_510427 ?auto_510434 ) ) ( not ( = ?auto_510427 ?auto_510435 ) ) ( not ( = ?auto_510427 ?auto_510436 ) ) ( not ( = ?auto_510427 ?auto_510437 ) ) ( not ( = ?auto_510428 ?auto_510429 ) ) ( not ( = ?auto_510428 ?auto_510430 ) ) ( not ( = ?auto_510428 ?auto_510431 ) ) ( not ( = ?auto_510428 ?auto_510432 ) ) ( not ( = ?auto_510428 ?auto_510433 ) ) ( not ( = ?auto_510428 ?auto_510434 ) ) ( not ( = ?auto_510428 ?auto_510435 ) ) ( not ( = ?auto_510428 ?auto_510436 ) ) ( not ( = ?auto_510428 ?auto_510437 ) ) ( not ( = ?auto_510429 ?auto_510430 ) ) ( not ( = ?auto_510429 ?auto_510431 ) ) ( not ( = ?auto_510429 ?auto_510432 ) ) ( not ( = ?auto_510429 ?auto_510433 ) ) ( not ( = ?auto_510429 ?auto_510434 ) ) ( not ( = ?auto_510429 ?auto_510435 ) ) ( not ( = ?auto_510429 ?auto_510436 ) ) ( not ( = ?auto_510429 ?auto_510437 ) ) ( not ( = ?auto_510430 ?auto_510431 ) ) ( not ( = ?auto_510430 ?auto_510432 ) ) ( not ( = ?auto_510430 ?auto_510433 ) ) ( not ( = ?auto_510430 ?auto_510434 ) ) ( not ( = ?auto_510430 ?auto_510435 ) ) ( not ( = ?auto_510430 ?auto_510436 ) ) ( not ( = ?auto_510430 ?auto_510437 ) ) ( not ( = ?auto_510431 ?auto_510432 ) ) ( not ( = ?auto_510431 ?auto_510433 ) ) ( not ( = ?auto_510431 ?auto_510434 ) ) ( not ( = ?auto_510431 ?auto_510435 ) ) ( not ( = ?auto_510431 ?auto_510436 ) ) ( not ( = ?auto_510431 ?auto_510437 ) ) ( not ( = ?auto_510432 ?auto_510433 ) ) ( not ( = ?auto_510432 ?auto_510434 ) ) ( not ( = ?auto_510432 ?auto_510435 ) ) ( not ( = ?auto_510432 ?auto_510436 ) ) ( not ( = ?auto_510432 ?auto_510437 ) ) ( not ( = ?auto_510433 ?auto_510434 ) ) ( not ( = ?auto_510433 ?auto_510435 ) ) ( not ( = ?auto_510433 ?auto_510436 ) ) ( not ( = ?auto_510433 ?auto_510437 ) ) ( not ( = ?auto_510434 ?auto_510435 ) ) ( not ( = ?auto_510434 ?auto_510436 ) ) ( not ( = ?auto_510434 ?auto_510437 ) ) ( not ( = ?auto_510435 ?auto_510436 ) ) ( not ( = ?auto_510435 ?auto_510437 ) ) ( not ( = ?auto_510436 ?auto_510437 ) ) ( ON ?auto_510435 ?auto_510436 ) ( ON ?auto_510434 ?auto_510435 ) ( ON ?auto_510433 ?auto_510434 ) ( ON ?auto_510432 ?auto_510433 ) ( ON ?auto_510431 ?auto_510432 ) ( ON ?auto_510430 ?auto_510431 ) ( ON ?auto_510429 ?auto_510430 ) ( CLEAR ?auto_510427 ) ( ON ?auto_510428 ?auto_510429 ) ( CLEAR ?auto_510428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_510427 ?auto_510428 )
      ( MAKE-10PILE ?auto_510427 ?auto_510428 ?auto_510429 ?auto_510430 ?auto_510431 ?auto_510432 ?auto_510433 ?auto_510434 ?auto_510435 ?auto_510436 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_510469 - BLOCK
      ?auto_510470 - BLOCK
      ?auto_510471 - BLOCK
      ?auto_510472 - BLOCK
      ?auto_510473 - BLOCK
      ?auto_510474 - BLOCK
      ?auto_510475 - BLOCK
      ?auto_510476 - BLOCK
      ?auto_510477 - BLOCK
      ?auto_510478 - BLOCK
    )
    :vars
    (
      ?auto_510479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510478 ?auto_510479 ) ( not ( = ?auto_510469 ?auto_510470 ) ) ( not ( = ?auto_510469 ?auto_510471 ) ) ( not ( = ?auto_510469 ?auto_510472 ) ) ( not ( = ?auto_510469 ?auto_510473 ) ) ( not ( = ?auto_510469 ?auto_510474 ) ) ( not ( = ?auto_510469 ?auto_510475 ) ) ( not ( = ?auto_510469 ?auto_510476 ) ) ( not ( = ?auto_510469 ?auto_510477 ) ) ( not ( = ?auto_510469 ?auto_510478 ) ) ( not ( = ?auto_510469 ?auto_510479 ) ) ( not ( = ?auto_510470 ?auto_510471 ) ) ( not ( = ?auto_510470 ?auto_510472 ) ) ( not ( = ?auto_510470 ?auto_510473 ) ) ( not ( = ?auto_510470 ?auto_510474 ) ) ( not ( = ?auto_510470 ?auto_510475 ) ) ( not ( = ?auto_510470 ?auto_510476 ) ) ( not ( = ?auto_510470 ?auto_510477 ) ) ( not ( = ?auto_510470 ?auto_510478 ) ) ( not ( = ?auto_510470 ?auto_510479 ) ) ( not ( = ?auto_510471 ?auto_510472 ) ) ( not ( = ?auto_510471 ?auto_510473 ) ) ( not ( = ?auto_510471 ?auto_510474 ) ) ( not ( = ?auto_510471 ?auto_510475 ) ) ( not ( = ?auto_510471 ?auto_510476 ) ) ( not ( = ?auto_510471 ?auto_510477 ) ) ( not ( = ?auto_510471 ?auto_510478 ) ) ( not ( = ?auto_510471 ?auto_510479 ) ) ( not ( = ?auto_510472 ?auto_510473 ) ) ( not ( = ?auto_510472 ?auto_510474 ) ) ( not ( = ?auto_510472 ?auto_510475 ) ) ( not ( = ?auto_510472 ?auto_510476 ) ) ( not ( = ?auto_510472 ?auto_510477 ) ) ( not ( = ?auto_510472 ?auto_510478 ) ) ( not ( = ?auto_510472 ?auto_510479 ) ) ( not ( = ?auto_510473 ?auto_510474 ) ) ( not ( = ?auto_510473 ?auto_510475 ) ) ( not ( = ?auto_510473 ?auto_510476 ) ) ( not ( = ?auto_510473 ?auto_510477 ) ) ( not ( = ?auto_510473 ?auto_510478 ) ) ( not ( = ?auto_510473 ?auto_510479 ) ) ( not ( = ?auto_510474 ?auto_510475 ) ) ( not ( = ?auto_510474 ?auto_510476 ) ) ( not ( = ?auto_510474 ?auto_510477 ) ) ( not ( = ?auto_510474 ?auto_510478 ) ) ( not ( = ?auto_510474 ?auto_510479 ) ) ( not ( = ?auto_510475 ?auto_510476 ) ) ( not ( = ?auto_510475 ?auto_510477 ) ) ( not ( = ?auto_510475 ?auto_510478 ) ) ( not ( = ?auto_510475 ?auto_510479 ) ) ( not ( = ?auto_510476 ?auto_510477 ) ) ( not ( = ?auto_510476 ?auto_510478 ) ) ( not ( = ?auto_510476 ?auto_510479 ) ) ( not ( = ?auto_510477 ?auto_510478 ) ) ( not ( = ?auto_510477 ?auto_510479 ) ) ( not ( = ?auto_510478 ?auto_510479 ) ) ( ON ?auto_510477 ?auto_510478 ) ( ON ?auto_510476 ?auto_510477 ) ( ON ?auto_510475 ?auto_510476 ) ( ON ?auto_510474 ?auto_510475 ) ( ON ?auto_510473 ?auto_510474 ) ( ON ?auto_510472 ?auto_510473 ) ( ON ?auto_510471 ?auto_510472 ) ( ON ?auto_510470 ?auto_510471 ) ( ON ?auto_510469 ?auto_510470 ) ( CLEAR ?auto_510469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_510469 )
      ( MAKE-10PILE ?auto_510469 ?auto_510470 ?auto_510471 ?auto_510472 ?auto_510473 ?auto_510474 ?auto_510475 ?auto_510476 ?auto_510477 ?auto_510478 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510512 - BLOCK
      ?auto_510513 - BLOCK
      ?auto_510514 - BLOCK
      ?auto_510515 - BLOCK
      ?auto_510516 - BLOCK
      ?auto_510517 - BLOCK
      ?auto_510518 - BLOCK
      ?auto_510519 - BLOCK
      ?auto_510520 - BLOCK
      ?auto_510521 - BLOCK
      ?auto_510522 - BLOCK
    )
    :vars
    (
      ?auto_510523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_510521 ) ( ON ?auto_510522 ?auto_510523 ) ( CLEAR ?auto_510522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_510512 ) ( ON ?auto_510513 ?auto_510512 ) ( ON ?auto_510514 ?auto_510513 ) ( ON ?auto_510515 ?auto_510514 ) ( ON ?auto_510516 ?auto_510515 ) ( ON ?auto_510517 ?auto_510516 ) ( ON ?auto_510518 ?auto_510517 ) ( ON ?auto_510519 ?auto_510518 ) ( ON ?auto_510520 ?auto_510519 ) ( ON ?auto_510521 ?auto_510520 ) ( not ( = ?auto_510512 ?auto_510513 ) ) ( not ( = ?auto_510512 ?auto_510514 ) ) ( not ( = ?auto_510512 ?auto_510515 ) ) ( not ( = ?auto_510512 ?auto_510516 ) ) ( not ( = ?auto_510512 ?auto_510517 ) ) ( not ( = ?auto_510512 ?auto_510518 ) ) ( not ( = ?auto_510512 ?auto_510519 ) ) ( not ( = ?auto_510512 ?auto_510520 ) ) ( not ( = ?auto_510512 ?auto_510521 ) ) ( not ( = ?auto_510512 ?auto_510522 ) ) ( not ( = ?auto_510512 ?auto_510523 ) ) ( not ( = ?auto_510513 ?auto_510514 ) ) ( not ( = ?auto_510513 ?auto_510515 ) ) ( not ( = ?auto_510513 ?auto_510516 ) ) ( not ( = ?auto_510513 ?auto_510517 ) ) ( not ( = ?auto_510513 ?auto_510518 ) ) ( not ( = ?auto_510513 ?auto_510519 ) ) ( not ( = ?auto_510513 ?auto_510520 ) ) ( not ( = ?auto_510513 ?auto_510521 ) ) ( not ( = ?auto_510513 ?auto_510522 ) ) ( not ( = ?auto_510513 ?auto_510523 ) ) ( not ( = ?auto_510514 ?auto_510515 ) ) ( not ( = ?auto_510514 ?auto_510516 ) ) ( not ( = ?auto_510514 ?auto_510517 ) ) ( not ( = ?auto_510514 ?auto_510518 ) ) ( not ( = ?auto_510514 ?auto_510519 ) ) ( not ( = ?auto_510514 ?auto_510520 ) ) ( not ( = ?auto_510514 ?auto_510521 ) ) ( not ( = ?auto_510514 ?auto_510522 ) ) ( not ( = ?auto_510514 ?auto_510523 ) ) ( not ( = ?auto_510515 ?auto_510516 ) ) ( not ( = ?auto_510515 ?auto_510517 ) ) ( not ( = ?auto_510515 ?auto_510518 ) ) ( not ( = ?auto_510515 ?auto_510519 ) ) ( not ( = ?auto_510515 ?auto_510520 ) ) ( not ( = ?auto_510515 ?auto_510521 ) ) ( not ( = ?auto_510515 ?auto_510522 ) ) ( not ( = ?auto_510515 ?auto_510523 ) ) ( not ( = ?auto_510516 ?auto_510517 ) ) ( not ( = ?auto_510516 ?auto_510518 ) ) ( not ( = ?auto_510516 ?auto_510519 ) ) ( not ( = ?auto_510516 ?auto_510520 ) ) ( not ( = ?auto_510516 ?auto_510521 ) ) ( not ( = ?auto_510516 ?auto_510522 ) ) ( not ( = ?auto_510516 ?auto_510523 ) ) ( not ( = ?auto_510517 ?auto_510518 ) ) ( not ( = ?auto_510517 ?auto_510519 ) ) ( not ( = ?auto_510517 ?auto_510520 ) ) ( not ( = ?auto_510517 ?auto_510521 ) ) ( not ( = ?auto_510517 ?auto_510522 ) ) ( not ( = ?auto_510517 ?auto_510523 ) ) ( not ( = ?auto_510518 ?auto_510519 ) ) ( not ( = ?auto_510518 ?auto_510520 ) ) ( not ( = ?auto_510518 ?auto_510521 ) ) ( not ( = ?auto_510518 ?auto_510522 ) ) ( not ( = ?auto_510518 ?auto_510523 ) ) ( not ( = ?auto_510519 ?auto_510520 ) ) ( not ( = ?auto_510519 ?auto_510521 ) ) ( not ( = ?auto_510519 ?auto_510522 ) ) ( not ( = ?auto_510519 ?auto_510523 ) ) ( not ( = ?auto_510520 ?auto_510521 ) ) ( not ( = ?auto_510520 ?auto_510522 ) ) ( not ( = ?auto_510520 ?auto_510523 ) ) ( not ( = ?auto_510521 ?auto_510522 ) ) ( not ( = ?auto_510521 ?auto_510523 ) ) ( not ( = ?auto_510522 ?auto_510523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_510522 ?auto_510523 )
      ( !STACK ?auto_510522 ?auto_510521 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510558 - BLOCK
      ?auto_510559 - BLOCK
      ?auto_510560 - BLOCK
      ?auto_510561 - BLOCK
      ?auto_510562 - BLOCK
      ?auto_510563 - BLOCK
      ?auto_510564 - BLOCK
      ?auto_510565 - BLOCK
      ?auto_510566 - BLOCK
      ?auto_510567 - BLOCK
      ?auto_510568 - BLOCK
    )
    :vars
    (
      ?auto_510569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510568 ?auto_510569 ) ( ON-TABLE ?auto_510558 ) ( ON ?auto_510559 ?auto_510558 ) ( ON ?auto_510560 ?auto_510559 ) ( ON ?auto_510561 ?auto_510560 ) ( ON ?auto_510562 ?auto_510561 ) ( ON ?auto_510563 ?auto_510562 ) ( ON ?auto_510564 ?auto_510563 ) ( ON ?auto_510565 ?auto_510564 ) ( ON ?auto_510566 ?auto_510565 ) ( not ( = ?auto_510558 ?auto_510559 ) ) ( not ( = ?auto_510558 ?auto_510560 ) ) ( not ( = ?auto_510558 ?auto_510561 ) ) ( not ( = ?auto_510558 ?auto_510562 ) ) ( not ( = ?auto_510558 ?auto_510563 ) ) ( not ( = ?auto_510558 ?auto_510564 ) ) ( not ( = ?auto_510558 ?auto_510565 ) ) ( not ( = ?auto_510558 ?auto_510566 ) ) ( not ( = ?auto_510558 ?auto_510567 ) ) ( not ( = ?auto_510558 ?auto_510568 ) ) ( not ( = ?auto_510558 ?auto_510569 ) ) ( not ( = ?auto_510559 ?auto_510560 ) ) ( not ( = ?auto_510559 ?auto_510561 ) ) ( not ( = ?auto_510559 ?auto_510562 ) ) ( not ( = ?auto_510559 ?auto_510563 ) ) ( not ( = ?auto_510559 ?auto_510564 ) ) ( not ( = ?auto_510559 ?auto_510565 ) ) ( not ( = ?auto_510559 ?auto_510566 ) ) ( not ( = ?auto_510559 ?auto_510567 ) ) ( not ( = ?auto_510559 ?auto_510568 ) ) ( not ( = ?auto_510559 ?auto_510569 ) ) ( not ( = ?auto_510560 ?auto_510561 ) ) ( not ( = ?auto_510560 ?auto_510562 ) ) ( not ( = ?auto_510560 ?auto_510563 ) ) ( not ( = ?auto_510560 ?auto_510564 ) ) ( not ( = ?auto_510560 ?auto_510565 ) ) ( not ( = ?auto_510560 ?auto_510566 ) ) ( not ( = ?auto_510560 ?auto_510567 ) ) ( not ( = ?auto_510560 ?auto_510568 ) ) ( not ( = ?auto_510560 ?auto_510569 ) ) ( not ( = ?auto_510561 ?auto_510562 ) ) ( not ( = ?auto_510561 ?auto_510563 ) ) ( not ( = ?auto_510561 ?auto_510564 ) ) ( not ( = ?auto_510561 ?auto_510565 ) ) ( not ( = ?auto_510561 ?auto_510566 ) ) ( not ( = ?auto_510561 ?auto_510567 ) ) ( not ( = ?auto_510561 ?auto_510568 ) ) ( not ( = ?auto_510561 ?auto_510569 ) ) ( not ( = ?auto_510562 ?auto_510563 ) ) ( not ( = ?auto_510562 ?auto_510564 ) ) ( not ( = ?auto_510562 ?auto_510565 ) ) ( not ( = ?auto_510562 ?auto_510566 ) ) ( not ( = ?auto_510562 ?auto_510567 ) ) ( not ( = ?auto_510562 ?auto_510568 ) ) ( not ( = ?auto_510562 ?auto_510569 ) ) ( not ( = ?auto_510563 ?auto_510564 ) ) ( not ( = ?auto_510563 ?auto_510565 ) ) ( not ( = ?auto_510563 ?auto_510566 ) ) ( not ( = ?auto_510563 ?auto_510567 ) ) ( not ( = ?auto_510563 ?auto_510568 ) ) ( not ( = ?auto_510563 ?auto_510569 ) ) ( not ( = ?auto_510564 ?auto_510565 ) ) ( not ( = ?auto_510564 ?auto_510566 ) ) ( not ( = ?auto_510564 ?auto_510567 ) ) ( not ( = ?auto_510564 ?auto_510568 ) ) ( not ( = ?auto_510564 ?auto_510569 ) ) ( not ( = ?auto_510565 ?auto_510566 ) ) ( not ( = ?auto_510565 ?auto_510567 ) ) ( not ( = ?auto_510565 ?auto_510568 ) ) ( not ( = ?auto_510565 ?auto_510569 ) ) ( not ( = ?auto_510566 ?auto_510567 ) ) ( not ( = ?auto_510566 ?auto_510568 ) ) ( not ( = ?auto_510566 ?auto_510569 ) ) ( not ( = ?auto_510567 ?auto_510568 ) ) ( not ( = ?auto_510567 ?auto_510569 ) ) ( not ( = ?auto_510568 ?auto_510569 ) ) ( CLEAR ?auto_510566 ) ( ON ?auto_510567 ?auto_510568 ) ( CLEAR ?auto_510567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_510558 ?auto_510559 ?auto_510560 ?auto_510561 ?auto_510562 ?auto_510563 ?auto_510564 ?auto_510565 ?auto_510566 ?auto_510567 )
      ( MAKE-11PILE ?auto_510558 ?auto_510559 ?auto_510560 ?auto_510561 ?auto_510562 ?auto_510563 ?auto_510564 ?auto_510565 ?auto_510566 ?auto_510567 ?auto_510568 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510604 - BLOCK
      ?auto_510605 - BLOCK
      ?auto_510606 - BLOCK
      ?auto_510607 - BLOCK
      ?auto_510608 - BLOCK
      ?auto_510609 - BLOCK
      ?auto_510610 - BLOCK
      ?auto_510611 - BLOCK
      ?auto_510612 - BLOCK
      ?auto_510613 - BLOCK
      ?auto_510614 - BLOCK
    )
    :vars
    (
      ?auto_510615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510614 ?auto_510615 ) ( ON-TABLE ?auto_510604 ) ( ON ?auto_510605 ?auto_510604 ) ( ON ?auto_510606 ?auto_510605 ) ( ON ?auto_510607 ?auto_510606 ) ( ON ?auto_510608 ?auto_510607 ) ( ON ?auto_510609 ?auto_510608 ) ( ON ?auto_510610 ?auto_510609 ) ( ON ?auto_510611 ?auto_510610 ) ( not ( = ?auto_510604 ?auto_510605 ) ) ( not ( = ?auto_510604 ?auto_510606 ) ) ( not ( = ?auto_510604 ?auto_510607 ) ) ( not ( = ?auto_510604 ?auto_510608 ) ) ( not ( = ?auto_510604 ?auto_510609 ) ) ( not ( = ?auto_510604 ?auto_510610 ) ) ( not ( = ?auto_510604 ?auto_510611 ) ) ( not ( = ?auto_510604 ?auto_510612 ) ) ( not ( = ?auto_510604 ?auto_510613 ) ) ( not ( = ?auto_510604 ?auto_510614 ) ) ( not ( = ?auto_510604 ?auto_510615 ) ) ( not ( = ?auto_510605 ?auto_510606 ) ) ( not ( = ?auto_510605 ?auto_510607 ) ) ( not ( = ?auto_510605 ?auto_510608 ) ) ( not ( = ?auto_510605 ?auto_510609 ) ) ( not ( = ?auto_510605 ?auto_510610 ) ) ( not ( = ?auto_510605 ?auto_510611 ) ) ( not ( = ?auto_510605 ?auto_510612 ) ) ( not ( = ?auto_510605 ?auto_510613 ) ) ( not ( = ?auto_510605 ?auto_510614 ) ) ( not ( = ?auto_510605 ?auto_510615 ) ) ( not ( = ?auto_510606 ?auto_510607 ) ) ( not ( = ?auto_510606 ?auto_510608 ) ) ( not ( = ?auto_510606 ?auto_510609 ) ) ( not ( = ?auto_510606 ?auto_510610 ) ) ( not ( = ?auto_510606 ?auto_510611 ) ) ( not ( = ?auto_510606 ?auto_510612 ) ) ( not ( = ?auto_510606 ?auto_510613 ) ) ( not ( = ?auto_510606 ?auto_510614 ) ) ( not ( = ?auto_510606 ?auto_510615 ) ) ( not ( = ?auto_510607 ?auto_510608 ) ) ( not ( = ?auto_510607 ?auto_510609 ) ) ( not ( = ?auto_510607 ?auto_510610 ) ) ( not ( = ?auto_510607 ?auto_510611 ) ) ( not ( = ?auto_510607 ?auto_510612 ) ) ( not ( = ?auto_510607 ?auto_510613 ) ) ( not ( = ?auto_510607 ?auto_510614 ) ) ( not ( = ?auto_510607 ?auto_510615 ) ) ( not ( = ?auto_510608 ?auto_510609 ) ) ( not ( = ?auto_510608 ?auto_510610 ) ) ( not ( = ?auto_510608 ?auto_510611 ) ) ( not ( = ?auto_510608 ?auto_510612 ) ) ( not ( = ?auto_510608 ?auto_510613 ) ) ( not ( = ?auto_510608 ?auto_510614 ) ) ( not ( = ?auto_510608 ?auto_510615 ) ) ( not ( = ?auto_510609 ?auto_510610 ) ) ( not ( = ?auto_510609 ?auto_510611 ) ) ( not ( = ?auto_510609 ?auto_510612 ) ) ( not ( = ?auto_510609 ?auto_510613 ) ) ( not ( = ?auto_510609 ?auto_510614 ) ) ( not ( = ?auto_510609 ?auto_510615 ) ) ( not ( = ?auto_510610 ?auto_510611 ) ) ( not ( = ?auto_510610 ?auto_510612 ) ) ( not ( = ?auto_510610 ?auto_510613 ) ) ( not ( = ?auto_510610 ?auto_510614 ) ) ( not ( = ?auto_510610 ?auto_510615 ) ) ( not ( = ?auto_510611 ?auto_510612 ) ) ( not ( = ?auto_510611 ?auto_510613 ) ) ( not ( = ?auto_510611 ?auto_510614 ) ) ( not ( = ?auto_510611 ?auto_510615 ) ) ( not ( = ?auto_510612 ?auto_510613 ) ) ( not ( = ?auto_510612 ?auto_510614 ) ) ( not ( = ?auto_510612 ?auto_510615 ) ) ( not ( = ?auto_510613 ?auto_510614 ) ) ( not ( = ?auto_510613 ?auto_510615 ) ) ( not ( = ?auto_510614 ?auto_510615 ) ) ( ON ?auto_510613 ?auto_510614 ) ( CLEAR ?auto_510611 ) ( ON ?auto_510612 ?auto_510613 ) ( CLEAR ?auto_510612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_510604 ?auto_510605 ?auto_510606 ?auto_510607 ?auto_510608 ?auto_510609 ?auto_510610 ?auto_510611 ?auto_510612 )
      ( MAKE-11PILE ?auto_510604 ?auto_510605 ?auto_510606 ?auto_510607 ?auto_510608 ?auto_510609 ?auto_510610 ?auto_510611 ?auto_510612 ?auto_510613 ?auto_510614 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510650 - BLOCK
      ?auto_510651 - BLOCK
      ?auto_510652 - BLOCK
      ?auto_510653 - BLOCK
      ?auto_510654 - BLOCK
      ?auto_510655 - BLOCK
      ?auto_510656 - BLOCK
      ?auto_510657 - BLOCK
      ?auto_510658 - BLOCK
      ?auto_510659 - BLOCK
      ?auto_510660 - BLOCK
    )
    :vars
    (
      ?auto_510661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510660 ?auto_510661 ) ( ON-TABLE ?auto_510650 ) ( ON ?auto_510651 ?auto_510650 ) ( ON ?auto_510652 ?auto_510651 ) ( ON ?auto_510653 ?auto_510652 ) ( ON ?auto_510654 ?auto_510653 ) ( ON ?auto_510655 ?auto_510654 ) ( ON ?auto_510656 ?auto_510655 ) ( not ( = ?auto_510650 ?auto_510651 ) ) ( not ( = ?auto_510650 ?auto_510652 ) ) ( not ( = ?auto_510650 ?auto_510653 ) ) ( not ( = ?auto_510650 ?auto_510654 ) ) ( not ( = ?auto_510650 ?auto_510655 ) ) ( not ( = ?auto_510650 ?auto_510656 ) ) ( not ( = ?auto_510650 ?auto_510657 ) ) ( not ( = ?auto_510650 ?auto_510658 ) ) ( not ( = ?auto_510650 ?auto_510659 ) ) ( not ( = ?auto_510650 ?auto_510660 ) ) ( not ( = ?auto_510650 ?auto_510661 ) ) ( not ( = ?auto_510651 ?auto_510652 ) ) ( not ( = ?auto_510651 ?auto_510653 ) ) ( not ( = ?auto_510651 ?auto_510654 ) ) ( not ( = ?auto_510651 ?auto_510655 ) ) ( not ( = ?auto_510651 ?auto_510656 ) ) ( not ( = ?auto_510651 ?auto_510657 ) ) ( not ( = ?auto_510651 ?auto_510658 ) ) ( not ( = ?auto_510651 ?auto_510659 ) ) ( not ( = ?auto_510651 ?auto_510660 ) ) ( not ( = ?auto_510651 ?auto_510661 ) ) ( not ( = ?auto_510652 ?auto_510653 ) ) ( not ( = ?auto_510652 ?auto_510654 ) ) ( not ( = ?auto_510652 ?auto_510655 ) ) ( not ( = ?auto_510652 ?auto_510656 ) ) ( not ( = ?auto_510652 ?auto_510657 ) ) ( not ( = ?auto_510652 ?auto_510658 ) ) ( not ( = ?auto_510652 ?auto_510659 ) ) ( not ( = ?auto_510652 ?auto_510660 ) ) ( not ( = ?auto_510652 ?auto_510661 ) ) ( not ( = ?auto_510653 ?auto_510654 ) ) ( not ( = ?auto_510653 ?auto_510655 ) ) ( not ( = ?auto_510653 ?auto_510656 ) ) ( not ( = ?auto_510653 ?auto_510657 ) ) ( not ( = ?auto_510653 ?auto_510658 ) ) ( not ( = ?auto_510653 ?auto_510659 ) ) ( not ( = ?auto_510653 ?auto_510660 ) ) ( not ( = ?auto_510653 ?auto_510661 ) ) ( not ( = ?auto_510654 ?auto_510655 ) ) ( not ( = ?auto_510654 ?auto_510656 ) ) ( not ( = ?auto_510654 ?auto_510657 ) ) ( not ( = ?auto_510654 ?auto_510658 ) ) ( not ( = ?auto_510654 ?auto_510659 ) ) ( not ( = ?auto_510654 ?auto_510660 ) ) ( not ( = ?auto_510654 ?auto_510661 ) ) ( not ( = ?auto_510655 ?auto_510656 ) ) ( not ( = ?auto_510655 ?auto_510657 ) ) ( not ( = ?auto_510655 ?auto_510658 ) ) ( not ( = ?auto_510655 ?auto_510659 ) ) ( not ( = ?auto_510655 ?auto_510660 ) ) ( not ( = ?auto_510655 ?auto_510661 ) ) ( not ( = ?auto_510656 ?auto_510657 ) ) ( not ( = ?auto_510656 ?auto_510658 ) ) ( not ( = ?auto_510656 ?auto_510659 ) ) ( not ( = ?auto_510656 ?auto_510660 ) ) ( not ( = ?auto_510656 ?auto_510661 ) ) ( not ( = ?auto_510657 ?auto_510658 ) ) ( not ( = ?auto_510657 ?auto_510659 ) ) ( not ( = ?auto_510657 ?auto_510660 ) ) ( not ( = ?auto_510657 ?auto_510661 ) ) ( not ( = ?auto_510658 ?auto_510659 ) ) ( not ( = ?auto_510658 ?auto_510660 ) ) ( not ( = ?auto_510658 ?auto_510661 ) ) ( not ( = ?auto_510659 ?auto_510660 ) ) ( not ( = ?auto_510659 ?auto_510661 ) ) ( not ( = ?auto_510660 ?auto_510661 ) ) ( ON ?auto_510659 ?auto_510660 ) ( ON ?auto_510658 ?auto_510659 ) ( CLEAR ?auto_510656 ) ( ON ?auto_510657 ?auto_510658 ) ( CLEAR ?auto_510657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_510650 ?auto_510651 ?auto_510652 ?auto_510653 ?auto_510654 ?auto_510655 ?auto_510656 ?auto_510657 )
      ( MAKE-11PILE ?auto_510650 ?auto_510651 ?auto_510652 ?auto_510653 ?auto_510654 ?auto_510655 ?auto_510656 ?auto_510657 ?auto_510658 ?auto_510659 ?auto_510660 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510696 - BLOCK
      ?auto_510697 - BLOCK
      ?auto_510698 - BLOCK
      ?auto_510699 - BLOCK
      ?auto_510700 - BLOCK
      ?auto_510701 - BLOCK
      ?auto_510702 - BLOCK
      ?auto_510703 - BLOCK
      ?auto_510704 - BLOCK
      ?auto_510705 - BLOCK
      ?auto_510706 - BLOCK
    )
    :vars
    (
      ?auto_510707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510706 ?auto_510707 ) ( ON-TABLE ?auto_510696 ) ( ON ?auto_510697 ?auto_510696 ) ( ON ?auto_510698 ?auto_510697 ) ( ON ?auto_510699 ?auto_510698 ) ( ON ?auto_510700 ?auto_510699 ) ( ON ?auto_510701 ?auto_510700 ) ( not ( = ?auto_510696 ?auto_510697 ) ) ( not ( = ?auto_510696 ?auto_510698 ) ) ( not ( = ?auto_510696 ?auto_510699 ) ) ( not ( = ?auto_510696 ?auto_510700 ) ) ( not ( = ?auto_510696 ?auto_510701 ) ) ( not ( = ?auto_510696 ?auto_510702 ) ) ( not ( = ?auto_510696 ?auto_510703 ) ) ( not ( = ?auto_510696 ?auto_510704 ) ) ( not ( = ?auto_510696 ?auto_510705 ) ) ( not ( = ?auto_510696 ?auto_510706 ) ) ( not ( = ?auto_510696 ?auto_510707 ) ) ( not ( = ?auto_510697 ?auto_510698 ) ) ( not ( = ?auto_510697 ?auto_510699 ) ) ( not ( = ?auto_510697 ?auto_510700 ) ) ( not ( = ?auto_510697 ?auto_510701 ) ) ( not ( = ?auto_510697 ?auto_510702 ) ) ( not ( = ?auto_510697 ?auto_510703 ) ) ( not ( = ?auto_510697 ?auto_510704 ) ) ( not ( = ?auto_510697 ?auto_510705 ) ) ( not ( = ?auto_510697 ?auto_510706 ) ) ( not ( = ?auto_510697 ?auto_510707 ) ) ( not ( = ?auto_510698 ?auto_510699 ) ) ( not ( = ?auto_510698 ?auto_510700 ) ) ( not ( = ?auto_510698 ?auto_510701 ) ) ( not ( = ?auto_510698 ?auto_510702 ) ) ( not ( = ?auto_510698 ?auto_510703 ) ) ( not ( = ?auto_510698 ?auto_510704 ) ) ( not ( = ?auto_510698 ?auto_510705 ) ) ( not ( = ?auto_510698 ?auto_510706 ) ) ( not ( = ?auto_510698 ?auto_510707 ) ) ( not ( = ?auto_510699 ?auto_510700 ) ) ( not ( = ?auto_510699 ?auto_510701 ) ) ( not ( = ?auto_510699 ?auto_510702 ) ) ( not ( = ?auto_510699 ?auto_510703 ) ) ( not ( = ?auto_510699 ?auto_510704 ) ) ( not ( = ?auto_510699 ?auto_510705 ) ) ( not ( = ?auto_510699 ?auto_510706 ) ) ( not ( = ?auto_510699 ?auto_510707 ) ) ( not ( = ?auto_510700 ?auto_510701 ) ) ( not ( = ?auto_510700 ?auto_510702 ) ) ( not ( = ?auto_510700 ?auto_510703 ) ) ( not ( = ?auto_510700 ?auto_510704 ) ) ( not ( = ?auto_510700 ?auto_510705 ) ) ( not ( = ?auto_510700 ?auto_510706 ) ) ( not ( = ?auto_510700 ?auto_510707 ) ) ( not ( = ?auto_510701 ?auto_510702 ) ) ( not ( = ?auto_510701 ?auto_510703 ) ) ( not ( = ?auto_510701 ?auto_510704 ) ) ( not ( = ?auto_510701 ?auto_510705 ) ) ( not ( = ?auto_510701 ?auto_510706 ) ) ( not ( = ?auto_510701 ?auto_510707 ) ) ( not ( = ?auto_510702 ?auto_510703 ) ) ( not ( = ?auto_510702 ?auto_510704 ) ) ( not ( = ?auto_510702 ?auto_510705 ) ) ( not ( = ?auto_510702 ?auto_510706 ) ) ( not ( = ?auto_510702 ?auto_510707 ) ) ( not ( = ?auto_510703 ?auto_510704 ) ) ( not ( = ?auto_510703 ?auto_510705 ) ) ( not ( = ?auto_510703 ?auto_510706 ) ) ( not ( = ?auto_510703 ?auto_510707 ) ) ( not ( = ?auto_510704 ?auto_510705 ) ) ( not ( = ?auto_510704 ?auto_510706 ) ) ( not ( = ?auto_510704 ?auto_510707 ) ) ( not ( = ?auto_510705 ?auto_510706 ) ) ( not ( = ?auto_510705 ?auto_510707 ) ) ( not ( = ?auto_510706 ?auto_510707 ) ) ( ON ?auto_510705 ?auto_510706 ) ( ON ?auto_510704 ?auto_510705 ) ( ON ?auto_510703 ?auto_510704 ) ( CLEAR ?auto_510701 ) ( ON ?auto_510702 ?auto_510703 ) ( CLEAR ?auto_510702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_510696 ?auto_510697 ?auto_510698 ?auto_510699 ?auto_510700 ?auto_510701 ?auto_510702 )
      ( MAKE-11PILE ?auto_510696 ?auto_510697 ?auto_510698 ?auto_510699 ?auto_510700 ?auto_510701 ?auto_510702 ?auto_510703 ?auto_510704 ?auto_510705 ?auto_510706 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510742 - BLOCK
      ?auto_510743 - BLOCK
      ?auto_510744 - BLOCK
      ?auto_510745 - BLOCK
      ?auto_510746 - BLOCK
      ?auto_510747 - BLOCK
      ?auto_510748 - BLOCK
      ?auto_510749 - BLOCK
      ?auto_510750 - BLOCK
      ?auto_510751 - BLOCK
      ?auto_510752 - BLOCK
    )
    :vars
    (
      ?auto_510753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510752 ?auto_510753 ) ( ON-TABLE ?auto_510742 ) ( ON ?auto_510743 ?auto_510742 ) ( ON ?auto_510744 ?auto_510743 ) ( ON ?auto_510745 ?auto_510744 ) ( ON ?auto_510746 ?auto_510745 ) ( not ( = ?auto_510742 ?auto_510743 ) ) ( not ( = ?auto_510742 ?auto_510744 ) ) ( not ( = ?auto_510742 ?auto_510745 ) ) ( not ( = ?auto_510742 ?auto_510746 ) ) ( not ( = ?auto_510742 ?auto_510747 ) ) ( not ( = ?auto_510742 ?auto_510748 ) ) ( not ( = ?auto_510742 ?auto_510749 ) ) ( not ( = ?auto_510742 ?auto_510750 ) ) ( not ( = ?auto_510742 ?auto_510751 ) ) ( not ( = ?auto_510742 ?auto_510752 ) ) ( not ( = ?auto_510742 ?auto_510753 ) ) ( not ( = ?auto_510743 ?auto_510744 ) ) ( not ( = ?auto_510743 ?auto_510745 ) ) ( not ( = ?auto_510743 ?auto_510746 ) ) ( not ( = ?auto_510743 ?auto_510747 ) ) ( not ( = ?auto_510743 ?auto_510748 ) ) ( not ( = ?auto_510743 ?auto_510749 ) ) ( not ( = ?auto_510743 ?auto_510750 ) ) ( not ( = ?auto_510743 ?auto_510751 ) ) ( not ( = ?auto_510743 ?auto_510752 ) ) ( not ( = ?auto_510743 ?auto_510753 ) ) ( not ( = ?auto_510744 ?auto_510745 ) ) ( not ( = ?auto_510744 ?auto_510746 ) ) ( not ( = ?auto_510744 ?auto_510747 ) ) ( not ( = ?auto_510744 ?auto_510748 ) ) ( not ( = ?auto_510744 ?auto_510749 ) ) ( not ( = ?auto_510744 ?auto_510750 ) ) ( not ( = ?auto_510744 ?auto_510751 ) ) ( not ( = ?auto_510744 ?auto_510752 ) ) ( not ( = ?auto_510744 ?auto_510753 ) ) ( not ( = ?auto_510745 ?auto_510746 ) ) ( not ( = ?auto_510745 ?auto_510747 ) ) ( not ( = ?auto_510745 ?auto_510748 ) ) ( not ( = ?auto_510745 ?auto_510749 ) ) ( not ( = ?auto_510745 ?auto_510750 ) ) ( not ( = ?auto_510745 ?auto_510751 ) ) ( not ( = ?auto_510745 ?auto_510752 ) ) ( not ( = ?auto_510745 ?auto_510753 ) ) ( not ( = ?auto_510746 ?auto_510747 ) ) ( not ( = ?auto_510746 ?auto_510748 ) ) ( not ( = ?auto_510746 ?auto_510749 ) ) ( not ( = ?auto_510746 ?auto_510750 ) ) ( not ( = ?auto_510746 ?auto_510751 ) ) ( not ( = ?auto_510746 ?auto_510752 ) ) ( not ( = ?auto_510746 ?auto_510753 ) ) ( not ( = ?auto_510747 ?auto_510748 ) ) ( not ( = ?auto_510747 ?auto_510749 ) ) ( not ( = ?auto_510747 ?auto_510750 ) ) ( not ( = ?auto_510747 ?auto_510751 ) ) ( not ( = ?auto_510747 ?auto_510752 ) ) ( not ( = ?auto_510747 ?auto_510753 ) ) ( not ( = ?auto_510748 ?auto_510749 ) ) ( not ( = ?auto_510748 ?auto_510750 ) ) ( not ( = ?auto_510748 ?auto_510751 ) ) ( not ( = ?auto_510748 ?auto_510752 ) ) ( not ( = ?auto_510748 ?auto_510753 ) ) ( not ( = ?auto_510749 ?auto_510750 ) ) ( not ( = ?auto_510749 ?auto_510751 ) ) ( not ( = ?auto_510749 ?auto_510752 ) ) ( not ( = ?auto_510749 ?auto_510753 ) ) ( not ( = ?auto_510750 ?auto_510751 ) ) ( not ( = ?auto_510750 ?auto_510752 ) ) ( not ( = ?auto_510750 ?auto_510753 ) ) ( not ( = ?auto_510751 ?auto_510752 ) ) ( not ( = ?auto_510751 ?auto_510753 ) ) ( not ( = ?auto_510752 ?auto_510753 ) ) ( ON ?auto_510751 ?auto_510752 ) ( ON ?auto_510750 ?auto_510751 ) ( ON ?auto_510749 ?auto_510750 ) ( ON ?auto_510748 ?auto_510749 ) ( CLEAR ?auto_510746 ) ( ON ?auto_510747 ?auto_510748 ) ( CLEAR ?auto_510747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_510742 ?auto_510743 ?auto_510744 ?auto_510745 ?auto_510746 ?auto_510747 )
      ( MAKE-11PILE ?auto_510742 ?auto_510743 ?auto_510744 ?auto_510745 ?auto_510746 ?auto_510747 ?auto_510748 ?auto_510749 ?auto_510750 ?auto_510751 ?auto_510752 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510788 - BLOCK
      ?auto_510789 - BLOCK
      ?auto_510790 - BLOCK
      ?auto_510791 - BLOCK
      ?auto_510792 - BLOCK
      ?auto_510793 - BLOCK
      ?auto_510794 - BLOCK
      ?auto_510795 - BLOCK
      ?auto_510796 - BLOCK
      ?auto_510797 - BLOCK
      ?auto_510798 - BLOCK
    )
    :vars
    (
      ?auto_510799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510798 ?auto_510799 ) ( ON-TABLE ?auto_510788 ) ( ON ?auto_510789 ?auto_510788 ) ( ON ?auto_510790 ?auto_510789 ) ( ON ?auto_510791 ?auto_510790 ) ( not ( = ?auto_510788 ?auto_510789 ) ) ( not ( = ?auto_510788 ?auto_510790 ) ) ( not ( = ?auto_510788 ?auto_510791 ) ) ( not ( = ?auto_510788 ?auto_510792 ) ) ( not ( = ?auto_510788 ?auto_510793 ) ) ( not ( = ?auto_510788 ?auto_510794 ) ) ( not ( = ?auto_510788 ?auto_510795 ) ) ( not ( = ?auto_510788 ?auto_510796 ) ) ( not ( = ?auto_510788 ?auto_510797 ) ) ( not ( = ?auto_510788 ?auto_510798 ) ) ( not ( = ?auto_510788 ?auto_510799 ) ) ( not ( = ?auto_510789 ?auto_510790 ) ) ( not ( = ?auto_510789 ?auto_510791 ) ) ( not ( = ?auto_510789 ?auto_510792 ) ) ( not ( = ?auto_510789 ?auto_510793 ) ) ( not ( = ?auto_510789 ?auto_510794 ) ) ( not ( = ?auto_510789 ?auto_510795 ) ) ( not ( = ?auto_510789 ?auto_510796 ) ) ( not ( = ?auto_510789 ?auto_510797 ) ) ( not ( = ?auto_510789 ?auto_510798 ) ) ( not ( = ?auto_510789 ?auto_510799 ) ) ( not ( = ?auto_510790 ?auto_510791 ) ) ( not ( = ?auto_510790 ?auto_510792 ) ) ( not ( = ?auto_510790 ?auto_510793 ) ) ( not ( = ?auto_510790 ?auto_510794 ) ) ( not ( = ?auto_510790 ?auto_510795 ) ) ( not ( = ?auto_510790 ?auto_510796 ) ) ( not ( = ?auto_510790 ?auto_510797 ) ) ( not ( = ?auto_510790 ?auto_510798 ) ) ( not ( = ?auto_510790 ?auto_510799 ) ) ( not ( = ?auto_510791 ?auto_510792 ) ) ( not ( = ?auto_510791 ?auto_510793 ) ) ( not ( = ?auto_510791 ?auto_510794 ) ) ( not ( = ?auto_510791 ?auto_510795 ) ) ( not ( = ?auto_510791 ?auto_510796 ) ) ( not ( = ?auto_510791 ?auto_510797 ) ) ( not ( = ?auto_510791 ?auto_510798 ) ) ( not ( = ?auto_510791 ?auto_510799 ) ) ( not ( = ?auto_510792 ?auto_510793 ) ) ( not ( = ?auto_510792 ?auto_510794 ) ) ( not ( = ?auto_510792 ?auto_510795 ) ) ( not ( = ?auto_510792 ?auto_510796 ) ) ( not ( = ?auto_510792 ?auto_510797 ) ) ( not ( = ?auto_510792 ?auto_510798 ) ) ( not ( = ?auto_510792 ?auto_510799 ) ) ( not ( = ?auto_510793 ?auto_510794 ) ) ( not ( = ?auto_510793 ?auto_510795 ) ) ( not ( = ?auto_510793 ?auto_510796 ) ) ( not ( = ?auto_510793 ?auto_510797 ) ) ( not ( = ?auto_510793 ?auto_510798 ) ) ( not ( = ?auto_510793 ?auto_510799 ) ) ( not ( = ?auto_510794 ?auto_510795 ) ) ( not ( = ?auto_510794 ?auto_510796 ) ) ( not ( = ?auto_510794 ?auto_510797 ) ) ( not ( = ?auto_510794 ?auto_510798 ) ) ( not ( = ?auto_510794 ?auto_510799 ) ) ( not ( = ?auto_510795 ?auto_510796 ) ) ( not ( = ?auto_510795 ?auto_510797 ) ) ( not ( = ?auto_510795 ?auto_510798 ) ) ( not ( = ?auto_510795 ?auto_510799 ) ) ( not ( = ?auto_510796 ?auto_510797 ) ) ( not ( = ?auto_510796 ?auto_510798 ) ) ( not ( = ?auto_510796 ?auto_510799 ) ) ( not ( = ?auto_510797 ?auto_510798 ) ) ( not ( = ?auto_510797 ?auto_510799 ) ) ( not ( = ?auto_510798 ?auto_510799 ) ) ( ON ?auto_510797 ?auto_510798 ) ( ON ?auto_510796 ?auto_510797 ) ( ON ?auto_510795 ?auto_510796 ) ( ON ?auto_510794 ?auto_510795 ) ( ON ?auto_510793 ?auto_510794 ) ( CLEAR ?auto_510791 ) ( ON ?auto_510792 ?auto_510793 ) ( CLEAR ?auto_510792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_510788 ?auto_510789 ?auto_510790 ?auto_510791 ?auto_510792 )
      ( MAKE-11PILE ?auto_510788 ?auto_510789 ?auto_510790 ?auto_510791 ?auto_510792 ?auto_510793 ?auto_510794 ?auto_510795 ?auto_510796 ?auto_510797 ?auto_510798 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510834 - BLOCK
      ?auto_510835 - BLOCK
      ?auto_510836 - BLOCK
      ?auto_510837 - BLOCK
      ?auto_510838 - BLOCK
      ?auto_510839 - BLOCK
      ?auto_510840 - BLOCK
      ?auto_510841 - BLOCK
      ?auto_510842 - BLOCK
      ?auto_510843 - BLOCK
      ?auto_510844 - BLOCK
    )
    :vars
    (
      ?auto_510845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510844 ?auto_510845 ) ( ON-TABLE ?auto_510834 ) ( ON ?auto_510835 ?auto_510834 ) ( ON ?auto_510836 ?auto_510835 ) ( not ( = ?auto_510834 ?auto_510835 ) ) ( not ( = ?auto_510834 ?auto_510836 ) ) ( not ( = ?auto_510834 ?auto_510837 ) ) ( not ( = ?auto_510834 ?auto_510838 ) ) ( not ( = ?auto_510834 ?auto_510839 ) ) ( not ( = ?auto_510834 ?auto_510840 ) ) ( not ( = ?auto_510834 ?auto_510841 ) ) ( not ( = ?auto_510834 ?auto_510842 ) ) ( not ( = ?auto_510834 ?auto_510843 ) ) ( not ( = ?auto_510834 ?auto_510844 ) ) ( not ( = ?auto_510834 ?auto_510845 ) ) ( not ( = ?auto_510835 ?auto_510836 ) ) ( not ( = ?auto_510835 ?auto_510837 ) ) ( not ( = ?auto_510835 ?auto_510838 ) ) ( not ( = ?auto_510835 ?auto_510839 ) ) ( not ( = ?auto_510835 ?auto_510840 ) ) ( not ( = ?auto_510835 ?auto_510841 ) ) ( not ( = ?auto_510835 ?auto_510842 ) ) ( not ( = ?auto_510835 ?auto_510843 ) ) ( not ( = ?auto_510835 ?auto_510844 ) ) ( not ( = ?auto_510835 ?auto_510845 ) ) ( not ( = ?auto_510836 ?auto_510837 ) ) ( not ( = ?auto_510836 ?auto_510838 ) ) ( not ( = ?auto_510836 ?auto_510839 ) ) ( not ( = ?auto_510836 ?auto_510840 ) ) ( not ( = ?auto_510836 ?auto_510841 ) ) ( not ( = ?auto_510836 ?auto_510842 ) ) ( not ( = ?auto_510836 ?auto_510843 ) ) ( not ( = ?auto_510836 ?auto_510844 ) ) ( not ( = ?auto_510836 ?auto_510845 ) ) ( not ( = ?auto_510837 ?auto_510838 ) ) ( not ( = ?auto_510837 ?auto_510839 ) ) ( not ( = ?auto_510837 ?auto_510840 ) ) ( not ( = ?auto_510837 ?auto_510841 ) ) ( not ( = ?auto_510837 ?auto_510842 ) ) ( not ( = ?auto_510837 ?auto_510843 ) ) ( not ( = ?auto_510837 ?auto_510844 ) ) ( not ( = ?auto_510837 ?auto_510845 ) ) ( not ( = ?auto_510838 ?auto_510839 ) ) ( not ( = ?auto_510838 ?auto_510840 ) ) ( not ( = ?auto_510838 ?auto_510841 ) ) ( not ( = ?auto_510838 ?auto_510842 ) ) ( not ( = ?auto_510838 ?auto_510843 ) ) ( not ( = ?auto_510838 ?auto_510844 ) ) ( not ( = ?auto_510838 ?auto_510845 ) ) ( not ( = ?auto_510839 ?auto_510840 ) ) ( not ( = ?auto_510839 ?auto_510841 ) ) ( not ( = ?auto_510839 ?auto_510842 ) ) ( not ( = ?auto_510839 ?auto_510843 ) ) ( not ( = ?auto_510839 ?auto_510844 ) ) ( not ( = ?auto_510839 ?auto_510845 ) ) ( not ( = ?auto_510840 ?auto_510841 ) ) ( not ( = ?auto_510840 ?auto_510842 ) ) ( not ( = ?auto_510840 ?auto_510843 ) ) ( not ( = ?auto_510840 ?auto_510844 ) ) ( not ( = ?auto_510840 ?auto_510845 ) ) ( not ( = ?auto_510841 ?auto_510842 ) ) ( not ( = ?auto_510841 ?auto_510843 ) ) ( not ( = ?auto_510841 ?auto_510844 ) ) ( not ( = ?auto_510841 ?auto_510845 ) ) ( not ( = ?auto_510842 ?auto_510843 ) ) ( not ( = ?auto_510842 ?auto_510844 ) ) ( not ( = ?auto_510842 ?auto_510845 ) ) ( not ( = ?auto_510843 ?auto_510844 ) ) ( not ( = ?auto_510843 ?auto_510845 ) ) ( not ( = ?auto_510844 ?auto_510845 ) ) ( ON ?auto_510843 ?auto_510844 ) ( ON ?auto_510842 ?auto_510843 ) ( ON ?auto_510841 ?auto_510842 ) ( ON ?auto_510840 ?auto_510841 ) ( ON ?auto_510839 ?auto_510840 ) ( ON ?auto_510838 ?auto_510839 ) ( CLEAR ?auto_510836 ) ( ON ?auto_510837 ?auto_510838 ) ( CLEAR ?auto_510837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_510834 ?auto_510835 ?auto_510836 ?auto_510837 )
      ( MAKE-11PILE ?auto_510834 ?auto_510835 ?auto_510836 ?auto_510837 ?auto_510838 ?auto_510839 ?auto_510840 ?auto_510841 ?auto_510842 ?auto_510843 ?auto_510844 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510880 - BLOCK
      ?auto_510881 - BLOCK
      ?auto_510882 - BLOCK
      ?auto_510883 - BLOCK
      ?auto_510884 - BLOCK
      ?auto_510885 - BLOCK
      ?auto_510886 - BLOCK
      ?auto_510887 - BLOCK
      ?auto_510888 - BLOCK
      ?auto_510889 - BLOCK
      ?auto_510890 - BLOCK
    )
    :vars
    (
      ?auto_510891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510890 ?auto_510891 ) ( ON-TABLE ?auto_510880 ) ( ON ?auto_510881 ?auto_510880 ) ( not ( = ?auto_510880 ?auto_510881 ) ) ( not ( = ?auto_510880 ?auto_510882 ) ) ( not ( = ?auto_510880 ?auto_510883 ) ) ( not ( = ?auto_510880 ?auto_510884 ) ) ( not ( = ?auto_510880 ?auto_510885 ) ) ( not ( = ?auto_510880 ?auto_510886 ) ) ( not ( = ?auto_510880 ?auto_510887 ) ) ( not ( = ?auto_510880 ?auto_510888 ) ) ( not ( = ?auto_510880 ?auto_510889 ) ) ( not ( = ?auto_510880 ?auto_510890 ) ) ( not ( = ?auto_510880 ?auto_510891 ) ) ( not ( = ?auto_510881 ?auto_510882 ) ) ( not ( = ?auto_510881 ?auto_510883 ) ) ( not ( = ?auto_510881 ?auto_510884 ) ) ( not ( = ?auto_510881 ?auto_510885 ) ) ( not ( = ?auto_510881 ?auto_510886 ) ) ( not ( = ?auto_510881 ?auto_510887 ) ) ( not ( = ?auto_510881 ?auto_510888 ) ) ( not ( = ?auto_510881 ?auto_510889 ) ) ( not ( = ?auto_510881 ?auto_510890 ) ) ( not ( = ?auto_510881 ?auto_510891 ) ) ( not ( = ?auto_510882 ?auto_510883 ) ) ( not ( = ?auto_510882 ?auto_510884 ) ) ( not ( = ?auto_510882 ?auto_510885 ) ) ( not ( = ?auto_510882 ?auto_510886 ) ) ( not ( = ?auto_510882 ?auto_510887 ) ) ( not ( = ?auto_510882 ?auto_510888 ) ) ( not ( = ?auto_510882 ?auto_510889 ) ) ( not ( = ?auto_510882 ?auto_510890 ) ) ( not ( = ?auto_510882 ?auto_510891 ) ) ( not ( = ?auto_510883 ?auto_510884 ) ) ( not ( = ?auto_510883 ?auto_510885 ) ) ( not ( = ?auto_510883 ?auto_510886 ) ) ( not ( = ?auto_510883 ?auto_510887 ) ) ( not ( = ?auto_510883 ?auto_510888 ) ) ( not ( = ?auto_510883 ?auto_510889 ) ) ( not ( = ?auto_510883 ?auto_510890 ) ) ( not ( = ?auto_510883 ?auto_510891 ) ) ( not ( = ?auto_510884 ?auto_510885 ) ) ( not ( = ?auto_510884 ?auto_510886 ) ) ( not ( = ?auto_510884 ?auto_510887 ) ) ( not ( = ?auto_510884 ?auto_510888 ) ) ( not ( = ?auto_510884 ?auto_510889 ) ) ( not ( = ?auto_510884 ?auto_510890 ) ) ( not ( = ?auto_510884 ?auto_510891 ) ) ( not ( = ?auto_510885 ?auto_510886 ) ) ( not ( = ?auto_510885 ?auto_510887 ) ) ( not ( = ?auto_510885 ?auto_510888 ) ) ( not ( = ?auto_510885 ?auto_510889 ) ) ( not ( = ?auto_510885 ?auto_510890 ) ) ( not ( = ?auto_510885 ?auto_510891 ) ) ( not ( = ?auto_510886 ?auto_510887 ) ) ( not ( = ?auto_510886 ?auto_510888 ) ) ( not ( = ?auto_510886 ?auto_510889 ) ) ( not ( = ?auto_510886 ?auto_510890 ) ) ( not ( = ?auto_510886 ?auto_510891 ) ) ( not ( = ?auto_510887 ?auto_510888 ) ) ( not ( = ?auto_510887 ?auto_510889 ) ) ( not ( = ?auto_510887 ?auto_510890 ) ) ( not ( = ?auto_510887 ?auto_510891 ) ) ( not ( = ?auto_510888 ?auto_510889 ) ) ( not ( = ?auto_510888 ?auto_510890 ) ) ( not ( = ?auto_510888 ?auto_510891 ) ) ( not ( = ?auto_510889 ?auto_510890 ) ) ( not ( = ?auto_510889 ?auto_510891 ) ) ( not ( = ?auto_510890 ?auto_510891 ) ) ( ON ?auto_510889 ?auto_510890 ) ( ON ?auto_510888 ?auto_510889 ) ( ON ?auto_510887 ?auto_510888 ) ( ON ?auto_510886 ?auto_510887 ) ( ON ?auto_510885 ?auto_510886 ) ( ON ?auto_510884 ?auto_510885 ) ( ON ?auto_510883 ?auto_510884 ) ( CLEAR ?auto_510881 ) ( ON ?auto_510882 ?auto_510883 ) ( CLEAR ?auto_510882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_510880 ?auto_510881 ?auto_510882 )
      ( MAKE-11PILE ?auto_510880 ?auto_510881 ?auto_510882 ?auto_510883 ?auto_510884 ?auto_510885 ?auto_510886 ?auto_510887 ?auto_510888 ?auto_510889 ?auto_510890 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510926 - BLOCK
      ?auto_510927 - BLOCK
      ?auto_510928 - BLOCK
      ?auto_510929 - BLOCK
      ?auto_510930 - BLOCK
      ?auto_510931 - BLOCK
      ?auto_510932 - BLOCK
      ?auto_510933 - BLOCK
      ?auto_510934 - BLOCK
      ?auto_510935 - BLOCK
      ?auto_510936 - BLOCK
    )
    :vars
    (
      ?auto_510937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510936 ?auto_510937 ) ( ON-TABLE ?auto_510926 ) ( not ( = ?auto_510926 ?auto_510927 ) ) ( not ( = ?auto_510926 ?auto_510928 ) ) ( not ( = ?auto_510926 ?auto_510929 ) ) ( not ( = ?auto_510926 ?auto_510930 ) ) ( not ( = ?auto_510926 ?auto_510931 ) ) ( not ( = ?auto_510926 ?auto_510932 ) ) ( not ( = ?auto_510926 ?auto_510933 ) ) ( not ( = ?auto_510926 ?auto_510934 ) ) ( not ( = ?auto_510926 ?auto_510935 ) ) ( not ( = ?auto_510926 ?auto_510936 ) ) ( not ( = ?auto_510926 ?auto_510937 ) ) ( not ( = ?auto_510927 ?auto_510928 ) ) ( not ( = ?auto_510927 ?auto_510929 ) ) ( not ( = ?auto_510927 ?auto_510930 ) ) ( not ( = ?auto_510927 ?auto_510931 ) ) ( not ( = ?auto_510927 ?auto_510932 ) ) ( not ( = ?auto_510927 ?auto_510933 ) ) ( not ( = ?auto_510927 ?auto_510934 ) ) ( not ( = ?auto_510927 ?auto_510935 ) ) ( not ( = ?auto_510927 ?auto_510936 ) ) ( not ( = ?auto_510927 ?auto_510937 ) ) ( not ( = ?auto_510928 ?auto_510929 ) ) ( not ( = ?auto_510928 ?auto_510930 ) ) ( not ( = ?auto_510928 ?auto_510931 ) ) ( not ( = ?auto_510928 ?auto_510932 ) ) ( not ( = ?auto_510928 ?auto_510933 ) ) ( not ( = ?auto_510928 ?auto_510934 ) ) ( not ( = ?auto_510928 ?auto_510935 ) ) ( not ( = ?auto_510928 ?auto_510936 ) ) ( not ( = ?auto_510928 ?auto_510937 ) ) ( not ( = ?auto_510929 ?auto_510930 ) ) ( not ( = ?auto_510929 ?auto_510931 ) ) ( not ( = ?auto_510929 ?auto_510932 ) ) ( not ( = ?auto_510929 ?auto_510933 ) ) ( not ( = ?auto_510929 ?auto_510934 ) ) ( not ( = ?auto_510929 ?auto_510935 ) ) ( not ( = ?auto_510929 ?auto_510936 ) ) ( not ( = ?auto_510929 ?auto_510937 ) ) ( not ( = ?auto_510930 ?auto_510931 ) ) ( not ( = ?auto_510930 ?auto_510932 ) ) ( not ( = ?auto_510930 ?auto_510933 ) ) ( not ( = ?auto_510930 ?auto_510934 ) ) ( not ( = ?auto_510930 ?auto_510935 ) ) ( not ( = ?auto_510930 ?auto_510936 ) ) ( not ( = ?auto_510930 ?auto_510937 ) ) ( not ( = ?auto_510931 ?auto_510932 ) ) ( not ( = ?auto_510931 ?auto_510933 ) ) ( not ( = ?auto_510931 ?auto_510934 ) ) ( not ( = ?auto_510931 ?auto_510935 ) ) ( not ( = ?auto_510931 ?auto_510936 ) ) ( not ( = ?auto_510931 ?auto_510937 ) ) ( not ( = ?auto_510932 ?auto_510933 ) ) ( not ( = ?auto_510932 ?auto_510934 ) ) ( not ( = ?auto_510932 ?auto_510935 ) ) ( not ( = ?auto_510932 ?auto_510936 ) ) ( not ( = ?auto_510932 ?auto_510937 ) ) ( not ( = ?auto_510933 ?auto_510934 ) ) ( not ( = ?auto_510933 ?auto_510935 ) ) ( not ( = ?auto_510933 ?auto_510936 ) ) ( not ( = ?auto_510933 ?auto_510937 ) ) ( not ( = ?auto_510934 ?auto_510935 ) ) ( not ( = ?auto_510934 ?auto_510936 ) ) ( not ( = ?auto_510934 ?auto_510937 ) ) ( not ( = ?auto_510935 ?auto_510936 ) ) ( not ( = ?auto_510935 ?auto_510937 ) ) ( not ( = ?auto_510936 ?auto_510937 ) ) ( ON ?auto_510935 ?auto_510936 ) ( ON ?auto_510934 ?auto_510935 ) ( ON ?auto_510933 ?auto_510934 ) ( ON ?auto_510932 ?auto_510933 ) ( ON ?auto_510931 ?auto_510932 ) ( ON ?auto_510930 ?auto_510931 ) ( ON ?auto_510929 ?auto_510930 ) ( ON ?auto_510928 ?auto_510929 ) ( CLEAR ?auto_510926 ) ( ON ?auto_510927 ?auto_510928 ) ( CLEAR ?auto_510927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_510926 ?auto_510927 )
      ( MAKE-11PILE ?auto_510926 ?auto_510927 ?auto_510928 ?auto_510929 ?auto_510930 ?auto_510931 ?auto_510932 ?auto_510933 ?auto_510934 ?auto_510935 ?auto_510936 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_510972 - BLOCK
      ?auto_510973 - BLOCK
      ?auto_510974 - BLOCK
      ?auto_510975 - BLOCK
      ?auto_510976 - BLOCK
      ?auto_510977 - BLOCK
      ?auto_510978 - BLOCK
      ?auto_510979 - BLOCK
      ?auto_510980 - BLOCK
      ?auto_510981 - BLOCK
      ?auto_510982 - BLOCK
    )
    :vars
    (
      ?auto_510983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_510982 ?auto_510983 ) ( not ( = ?auto_510972 ?auto_510973 ) ) ( not ( = ?auto_510972 ?auto_510974 ) ) ( not ( = ?auto_510972 ?auto_510975 ) ) ( not ( = ?auto_510972 ?auto_510976 ) ) ( not ( = ?auto_510972 ?auto_510977 ) ) ( not ( = ?auto_510972 ?auto_510978 ) ) ( not ( = ?auto_510972 ?auto_510979 ) ) ( not ( = ?auto_510972 ?auto_510980 ) ) ( not ( = ?auto_510972 ?auto_510981 ) ) ( not ( = ?auto_510972 ?auto_510982 ) ) ( not ( = ?auto_510972 ?auto_510983 ) ) ( not ( = ?auto_510973 ?auto_510974 ) ) ( not ( = ?auto_510973 ?auto_510975 ) ) ( not ( = ?auto_510973 ?auto_510976 ) ) ( not ( = ?auto_510973 ?auto_510977 ) ) ( not ( = ?auto_510973 ?auto_510978 ) ) ( not ( = ?auto_510973 ?auto_510979 ) ) ( not ( = ?auto_510973 ?auto_510980 ) ) ( not ( = ?auto_510973 ?auto_510981 ) ) ( not ( = ?auto_510973 ?auto_510982 ) ) ( not ( = ?auto_510973 ?auto_510983 ) ) ( not ( = ?auto_510974 ?auto_510975 ) ) ( not ( = ?auto_510974 ?auto_510976 ) ) ( not ( = ?auto_510974 ?auto_510977 ) ) ( not ( = ?auto_510974 ?auto_510978 ) ) ( not ( = ?auto_510974 ?auto_510979 ) ) ( not ( = ?auto_510974 ?auto_510980 ) ) ( not ( = ?auto_510974 ?auto_510981 ) ) ( not ( = ?auto_510974 ?auto_510982 ) ) ( not ( = ?auto_510974 ?auto_510983 ) ) ( not ( = ?auto_510975 ?auto_510976 ) ) ( not ( = ?auto_510975 ?auto_510977 ) ) ( not ( = ?auto_510975 ?auto_510978 ) ) ( not ( = ?auto_510975 ?auto_510979 ) ) ( not ( = ?auto_510975 ?auto_510980 ) ) ( not ( = ?auto_510975 ?auto_510981 ) ) ( not ( = ?auto_510975 ?auto_510982 ) ) ( not ( = ?auto_510975 ?auto_510983 ) ) ( not ( = ?auto_510976 ?auto_510977 ) ) ( not ( = ?auto_510976 ?auto_510978 ) ) ( not ( = ?auto_510976 ?auto_510979 ) ) ( not ( = ?auto_510976 ?auto_510980 ) ) ( not ( = ?auto_510976 ?auto_510981 ) ) ( not ( = ?auto_510976 ?auto_510982 ) ) ( not ( = ?auto_510976 ?auto_510983 ) ) ( not ( = ?auto_510977 ?auto_510978 ) ) ( not ( = ?auto_510977 ?auto_510979 ) ) ( not ( = ?auto_510977 ?auto_510980 ) ) ( not ( = ?auto_510977 ?auto_510981 ) ) ( not ( = ?auto_510977 ?auto_510982 ) ) ( not ( = ?auto_510977 ?auto_510983 ) ) ( not ( = ?auto_510978 ?auto_510979 ) ) ( not ( = ?auto_510978 ?auto_510980 ) ) ( not ( = ?auto_510978 ?auto_510981 ) ) ( not ( = ?auto_510978 ?auto_510982 ) ) ( not ( = ?auto_510978 ?auto_510983 ) ) ( not ( = ?auto_510979 ?auto_510980 ) ) ( not ( = ?auto_510979 ?auto_510981 ) ) ( not ( = ?auto_510979 ?auto_510982 ) ) ( not ( = ?auto_510979 ?auto_510983 ) ) ( not ( = ?auto_510980 ?auto_510981 ) ) ( not ( = ?auto_510980 ?auto_510982 ) ) ( not ( = ?auto_510980 ?auto_510983 ) ) ( not ( = ?auto_510981 ?auto_510982 ) ) ( not ( = ?auto_510981 ?auto_510983 ) ) ( not ( = ?auto_510982 ?auto_510983 ) ) ( ON ?auto_510981 ?auto_510982 ) ( ON ?auto_510980 ?auto_510981 ) ( ON ?auto_510979 ?auto_510980 ) ( ON ?auto_510978 ?auto_510979 ) ( ON ?auto_510977 ?auto_510978 ) ( ON ?auto_510976 ?auto_510977 ) ( ON ?auto_510975 ?auto_510976 ) ( ON ?auto_510974 ?auto_510975 ) ( ON ?auto_510973 ?auto_510974 ) ( ON ?auto_510972 ?auto_510973 ) ( CLEAR ?auto_510972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_510972 )
      ( MAKE-11PILE ?auto_510972 ?auto_510973 ?auto_510974 ?auto_510975 ?auto_510976 ?auto_510977 ?auto_510978 ?auto_510979 ?auto_510980 ?auto_510981 ?auto_510982 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511019 - BLOCK
      ?auto_511020 - BLOCK
      ?auto_511021 - BLOCK
      ?auto_511022 - BLOCK
      ?auto_511023 - BLOCK
      ?auto_511024 - BLOCK
      ?auto_511025 - BLOCK
      ?auto_511026 - BLOCK
      ?auto_511027 - BLOCK
      ?auto_511028 - BLOCK
      ?auto_511029 - BLOCK
      ?auto_511030 - BLOCK
    )
    :vars
    (
      ?auto_511031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_511029 ) ( ON ?auto_511030 ?auto_511031 ) ( CLEAR ?auto_511030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_511019 ) ( ON ?auto_511020 ?auto_511019 ) ( ON ?auto_511021 ?auto_511020 ) ( ON ?auto_511022 ?auto_511021 ) ( ON ?auto_511023 ?auto_511022 ) ( ON ?auto_511024 ?auto_511023 ) ( ON ?auto_511025 ?auto_511024 ) ( ON ?auto_511026 ?auto_511025 ) ( ON ?auto_511027 ?auto_511026 ) ( ON ?auto_511028 ?auto_511027 ) ( ON ?auto_511029 ?auto_511028 ) ( not ( = ?auto_511019 ?auto_511020 ) ) ( not ( = ?auto_511019 ?auto_511021 ) ) ( not ( = ?auto_511019 ?auto_511022 ) ) ( not ( = ?auto_511019 ?auto_511023 ) ) ( not ( = ?auto_511019 ?auto_511024 ) ) ( not ( = ?auto_511019 ?auto_511025 ) ) ( not ( = ?auto_511019 ?auto_511026 ) ) ( not ( = ?auto_511019 ?auto_511027 ) ) ( not ( = ?auto_511019 ?auto_511028 ) ) ( not ( = ?auto_511019 ?auto_511029 ) ) ( not ( = ?auto_511019 ?auto_511030 ) ) ( not ( = ?auto_511019 ?auto_511031 ) ) ( not ( = ?auto_511020 ?auto_511021 ) ) ( not ( = ?auto_511020 ?auto_511022 ) ) ( not ( = ?auto_511020 ?auto_511023 ) ) ( not ( = ?auto_511020 ?auto_511024 ) ) ( not ( = ?auto_511020 ?auto_511025 ) ) ( not ( = ?auto_511020 ?auto_511026 ) ) ( not ( = ?auto_511020 ?auto_511027 ) ) ( not ( = ?auto_511020 ?auto_511028 ) ) ( not ( = ?auto_511020 ?auto_511029 ) ) ( not ( = ?auto_511020 ?auto_511030 ) ) ( not ( = ?auto_511020 ?auto_511031 ) ) ( not ( = ?auto_511021 ?auto_511022 ) ) ( not ( = ?auto_511021 ?auto_511023 ) ) ( not ( = ?auto_511021 ?auto_511024 ) ) ( not ( = ?auto_511021 ?auto_511025 ) ) ( not ( = ?auto_511021 ?auto_511026 ) ) ( not ( = ?auto_511021 ?auto_511027 ) ) ( not ( = ?auto_511021 ?auto_511028 ) ) ( not ( = ?auto_511021 ?auto_511029 ) ) ( not ( = ?auto_511021 ?auto_511030 ) ) ( not ( = ?auto_511021 ?auto_511031 ) ) ( not ( = ?auto_511022 ?auto_511023 ) ) ( not ( = ?auto_511022 ?auto_511024 ) ) ( not ( = ?auto_511022 ?auto_511025 ) ) ( not ( = ?auto_511022 ?auto_511026 ) ) ( not ( = ?auto_511022 ?auto_511027 ) ) ( not ( = ?auto_511022 ?auto_511028 ) ) ( not ( = ?auto_511022 ?auto_511029 ) ) ( not ( = ?auto_511022 ?auto_511030 ) ) ( not ( = ?auto_511022 ?auto_511031 ) ) ( not ( = ?auto_511023 ?auto_511024 ) ) ( not ( = ?auto_511023 ?auto_511025 ) ) ( not ( = ?auto_511023 ?auto_511026 ) ) ( not ( = ?auto_511023 ?auto_511027 ) ) ( not ( = ?auto_511023 ?auto_511028 ) ) ( not ( = ?auto_511023 ?auto_511029 ) ) ( not ( = ?auto_511023 ?auto_511030 ) ) ( not ( = ?auto_511023 ?auto_511031 ) ) ( not ( = ?auto_511024 ?auto_511025 ) ) ( not ( = ?auto_511024 ?auto_511026 ) ) ( not ( = ?auto_511024 ?auto_511027 ) ) ( not ( = ?auto_511024 ?auto_511028 ) ) ( not ( = ?auto_511024 ?auto_511029 ) ) ( not ( = ?auto_511024 ?auto_511030 ) ) ( not ( = ?auto_511024 ?auto_511031 ) ) ( not ( = ?auto_511025 ?auto_511026 ) ) ( not ( = ?auto_511025 ?auto_511027 ) ) ( not ( = ?auto_511025 ?auto_511028 ) ) ( not ( = ?auto_511025 ?auto_511029 ) ) ( not ( = ?auto_511025 ?auto_511030 ) ) ( not ( = ?auto_511025 ?auto_511031 ) ) ( not ( = ?auto_511026 ?auto_511027 ) ) ( not ( = ?auto_511026 ?auto_511028 ) ) ( not ( = ?auto_511026 ?auto_511029 ) ) ( not ( = ?auto_511026 ?auto_511030 ) ) ( not ( = ?auto_511026 ?auto_511031 ) ) ( not ( = ?auto_511027 ?auto_511028 ) ) ( not ( = ?auto_511027 ?auto_511029 ) ) ( not ( = ?auto_511027 ?auto_511030 ) ) ( not ( = ?auto_511027 ?auto_511031 ) ) ( not ( = ?auto_511028 ?auto_511029 ) ) ( not ( = ?auto_511028 ?auto_511030 ) ) ( not ( = ?auto_511028 ?auto_511031 ) ) ( not ( = ?auto_511029 ?auto_511030 ) ) ( not ( = ?auto_511029 ?auto_511031 ) ) ( not ( = ?auto_511030 ?auto_511031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_511030 ?auto_511031 )
      ( !STACK ?auto_511030 ?auto_511029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511069 - BLOCK
      ?auto_511070 - BLOCK
      ?auto_511071 - BLOCK
      ?auto_511072 - BLOCK
      ?auto_511073 - BLOCK
      ?auto_511074 - BLOCK
      ?auto_511075 - BLOCK
      ?auto_511076 - BLOCK
      ?auto_511077 - BLOCK
      ?auto_511078 - BLOCK
      ?auto_511079 - BLOCK
      ?auto_511080 - BLOCK
    )
    :vars
    (
      ?auto_511081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511080 ?auto_511081 ) ( ON-TABLE ?auto_511069 ) ( ON ?auto_511070 ?auto_511069 ) ( ON ?auto_511071 ?auto_511070 ) ( ON ?auto_511072 ?auto_511071 ) ( ON ?auto_511073 ?auto_511072 ) ( ON ?auto_511074 ?auto_511073 ) ( ON ?auto_511075 ?auto_511074 ) ( ON ?auto_511076 ?auto_511075 ) ( ON ?auto_511077 ?auto_511076 ) ( ON ?auto_511078 ?auto_511077 ) ( not ( = ?auto_511069 ?auto_511070 ) ) ( not ( = ?auto_511069 ?auto_511071 ) ) ( not ( = ?auto_511069 ?auto_511072 ) ) ( not ( = ?auto_511069 ?auto_511073 ) ) ( not ( = ?auto_511069 ?auto_511074 ) ) ( not ( = ?auto_511069 ?auto_511075 ) ) ( not ( = ?auto_511069 ?auto_511076 ) ) ( not ( = ?auto_511069 ?auto_511077 ) ) ( not ( = ?auto_511069 ?auto_511078 ) ) ( not ( = ?auto_511069 ?auto_511079 ) ) ( not ( = ?auto_511069 ?auto_511080 ) ) ( not ( = ?auto_511069 ?auto_511081 ) ) ( not ( = ?auto_511070 ?auto_511071 ) ) ( not ( = ?auto_511070 ?auto_511072 ) ) ( not ( = ?auto_511070 ?auto_511073 ) ) ( not ( = ?auto_511070 ?auto_511074 ) ) ( not ( = ?auto_511070 ?auto_511075 ) ) ( not ( = ?auto_511070 ?auto_511076 ) ) ( not ( = ?auto_511070 ?auto_511077 ) ) ( not ( = ?auto_511070 ?auto_511078 ) ) ( not ( = ?auto_511070 ?auto_511079 ) ) ( not ( = ?auto_511070 ?auto_511080 ) ) ( not ( = ?auto_511070 ?auto_511081 ) ) ( not ( = ?auto_511071 ?auto_511072 ) ) ( not ( = ?auto_511071 ?auto_511073 ) ) ( not ( = ?auto_511071 ?auto_511074 ) ) ( not ( = ?auto_511071 ?auto_511075 ) ) ( not ( = ?auto_511071 ?auto_511076 ) ) ( not ( = ?auto_511071 ?auto_511077 ) ) ( not ( = ?auto_511071 ?auto_511078 ) ) ( not ( = ?auto_511071 ?auto_511079 ) ) ( not ( = ?auto_511071 ?auto_511080 ) ) ( not ( = ?auto_511071 ?auto_511081 ) ) ( not ( = ?auto_511072 ?auto_511073 ) ) ( not ( = ?auto_511072 ?auto_511074 ) ) ( not ( = ?auto_511072 ?auto_511075 ) ) ( not ( = ?auto_511072 ?auto_511076 ) ) ( not ( = ?auto_511072 ?auto_511077 ) ) ( not ( = ?auto_511072 ?auto_511078 ) ) ( not ( = ?auto_511072 ?auto_511079 ) ) ( not ( = ?auto_511072 ?auto_511080 ) ) ( not ( = ?auto_511072 ?auto_511081 ) ) ( not ( = ?auto_511073 ?auto_511074 ) ) ( not ( = ?auto_511073 ?auto_511075 ) ) ( not ( = ?auto_511073 ?auto_511076 ) ) ( not ( = ?auto_511073 ?auto_511077 ) ) ( not ( = ?auto_511073 ?auto_511078 ) ) ( not ( = ?auto_511073 ?auto_511079 ) ) ( not ( = ?auto_511073 ?auto_511080 ) ) ( not ( = ?auto_511073 ?auto_511081 ) ) ( not ( = ?auto_511074 ?auto_511075 ) ) ( not ( = ?auto_511074 ?auto_511076 ) ) ( not ( = ?auto_511074 ?auto_511077 ) ) ( not ( = ?auto_511074 ?auto_511078 ) ) ( not ( = ?auto_511074 ?auto_511079 ) ) ( not ( = ?auto_511074 ?auto_511080 ) ) ( not ( = ?auto_511074 ?auto_511081 ) ) ( not ( = ?auto_511075 ?auto_511076 ) ) ( not ( = ?auto_511075 ?auto_511077 ) ) ( not ( = ?auto_511075 ?auto_511078 ) ) ( not ( = ?auto_511075 ?auto_511079 ) ) ( not ( = ?auto_511075 ?auto_511080 ) ) ( not ( = ?auto_511075 ?auto_511081 ) ) ( not ( = ?auto_511076 ?auto_511077 ) ) ( not ( = ?auto_511076 ?auto_511078 ) ) ( not ( = ?auto_511076 ?auto_511079 ) ) ( not ( = ?auto_511076 ?auto_511080 ) ) ( not ( = ?auto_511076 ?auto_511081 ) ) ( not ( = ?auto_511077 ?auto_511078 ) ) ( not ( = ?auto_511077 ?auto_511079 ) ) ( not ( = ?auto_511077 ?auto_511080 ) ) ( not ( = ?auto_511077 ?auto_511081 ) ) ( not ( = ?auto_511078 ?auto_511079 ) ) ( not ( = ?auto_511078 ?auto_511080 ) ) ( not ( = ?auto_511078 ?auto_511081 ) ) ( not ( = ?auto_511079 ?auto_511080 ) ) ( not ( = ?auto_511079 ?auto_511081 ) ) ( not ( = ?auto_511080 ?auto_511081 ) ) ( CLEAR ?auto_511078 ) ( ON ?auto_511079 ?auto_511080 ) ( CLEAR ?auto_511079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_511069 ?auto_511070 ?auto_511071 ?auto_511072 ?auto_511073 ?auto_511074 ?auto_511075 ?auto_511076 ?auto_511077 ?auto_511078 ?auto_511079 )
      ( MAKE-12PILE ?auto_511069 ?auto_511070 ?auto_511071 ?auto_511072 ?auto_511073 ?auto_511074 ?auto_511075 ?auto_511076 ?auto_511077 ?auto_511078 ?auto_511079 ?auto_511080 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511119 - BLOCK
      ?auto_511120 - BLOCK
      ?auto_511121 - BLOCK
      ?auto_511122 - BLOCK
      ?auto_511123 - BLOCK
      ?auto_511124 - BLOCK
      ?auto_511125 - BLOCK
      ?auto_511126 - BLOCK
      ?auto_511127 - BLOCK
      ?auto_511128 - BLOCK
      ?auto_511129 - BLOCK
      ?auto_511130 - BLOCK
    )
    :vars
    (
      ?auto_511131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511130 ?auto_511131 ) ( ON-TABLE ?auto_511119 ) ( ON ?auto_511120 ?auto_511119 ) ( ON ?auto_511121 ?auto_511120 ) ( ON ?auto_511122 ?auto_511121 ) ( ON ?auto_511123 ?auto_511122 ) ( ON ?auto_511124 ?auto_511123 ) ( ON ?auto_511125 ?auto_511124 ) ( ON ?auto_511126 ?auto_511125 ) ( ON ?auto_511127 ?auto_511126 ) ( not ( = ?auto_511119 ?auto_511120 ) ) ( not ( = ?auto_511119 ?auto_511121 ) ) ( not ( = ?auto_511119 ?auto_511122 ) ) ( not ( = ?auto_511119 ?auto_511123 ) ) ( not ( = ?auto_511119 ?auto_511124 ) ) ( not ( = ?auto_511119 ?auto_511125 ) ) ( not ( = ?auto_511119 ?auto_511126 ) ) ( not ( = ?auto_511119 ?auto_511127 ) ) ( not ( = ?auto_511119 ?auto_511128 ) ) ( not ( = ?auto_511119 ?auto_511129 ) ) ( not ( = ?auto_511119 ?auto_511130 ) ) ( not ( = ?auto_511119 ?auto_511131 ) ) ( not ( = ?auto_511120 ?auto_511121 ) ) ( not ( = ?auto_511120 ?auto_511122 ) ) ( not ( = ?auto_511120 ?auto_511123 ) ) ( not ( = ?auto_511120 ?auto_511124 ) ) ( not ( = ?auto_511120 ?auto_511125 ) ) ( not ( = ?auto_511120 ?auto_511126 ) ) ( not ( = ?auto_511120 ?auto_511127 ) ) ( not ( = ?auto_511120 ?auto_511128 ) ) ( not ( = ?auto_511120 ?auto_511129 ) ) ( not ( = ?auto_511120 ?auto_511130 ) ) ( not ( = ?auto_511120 ?auto_511131 ) ) ( not ( = ?auto_511121 ?auto_511122 ) ) ( not ( = ?auto_511121 ?auto_511123 ) ) ( not ( = ?auto_511121 ?auto_511124 ) ) ( not ( = ?auto_511121 ?auto_511125 ) ) ( not ( = ?auto_511121 ?auto_511126 ) ) ( not ( = ?auto_511121 ?auto_511127 ) ) ( not ( = ?auto_511121 ?auto_511128 ) ) ( not ( = ?auto_511121 ?auto_511129 ) ) ( not ( = ?auto_511121 ?auto_511130 ) ) ( not ( = ?auto_511121 ?auto_511131 ) ) ( not ( = ?auto_511122 ?auto_511123 ) ) ( not ( = ?auto_511122 ?auto_511124 ) ) ( not ( = ?auto_511122 ?auto_511125 ) ) ( not ( = ?auto_511122 ?auto_511126 ) ) ( not ( = ?auto_511122 ?auto_511127 ) ) ( not ( = ?auto_511122 ?auto_511128 ) ) ( not ( = ?auto_511122 ?auto_511129 ) ) ( not ( = ?auto_511122 ?auto_511130 ) ) ( not ( = ?auto_511122 ?auto_511131 ) ) ( not ( = ?auto_511123 ?auto_511124 ) ) ( not ( = ?auto_511123 ?auto_511125 ) ) ( not ( = ?auto_511123 ?auto_511126 ) ) ( not ( = ?auto_511123 ?auto_511127 ) ) ( not ( = ?auto_511123 ?auto_511128 ) ) ( not ( = ?auto_511123 ?auto_511129 ) ) ( not ( = ?auto_511123 ?auto_511130 ) ) ( not ( = ?auto_511123 ?auto_511131 ) ) ( not ( = ?auto_511124 ?auto_511125 ) ) ( not ( = ?auto_511124 ?auto_511126 ) ) ( not ( = ?auto_511124 ?auto_511127 ) ) ( not ( = ?auto_511124 ?auto_511128 ) ) ( not ( = ?auto_511124 ?auto_511129 ) ) ( not ( = ?auto_511124 ?auto_511130 ) ) ( not ( = ?auto_511124 ?auto_511131 ) ) ( not ( = ?auto_511125 ?auto_511126 ) ) ( not ( = ?auto_511125 ?auto_511127 ) ) ( not ( = ?auto_511125 ?auto_511128 ) ) ( not ( = ?auto_511125 ?auto_511129 ) ) ( not ( = ?auto_511125 ?auto_511130 ) ) ( not ( = ?auto_511125 ?auto_511131 ) ) ( not ( = ?auto_511126 ?auto_511127 ) ) ( not ( = ?auto_511126 ?auto_511128 ) ) ( not ( = ?auto_511126 ?auto_511129 ) ) ( not ( = ?auto_511126 ?auto_511130 ) ) ( not ( = ?auto_511126 ?auto_511131 ) ) ( not ( = ?auto_511127 ?auto_511128 ) ) ( not ( = ?auto_511127 ?auto_511129 ) ) ( not ( = ?auto_511127 ?auto_511130 ) ) ( not ( = ?auto_511127 ?auto_511131 ) ) ( not ( = ?auto_511128 ?auto_511129 ) ) ( not ( = ?auto_511128 ?auto_511130 ) ) ( not ( = ?auto_511128 ?auto_511131 ) ) ( not ( = ?auto_511129 ?auto_511130 ) ) ( not ( = ?auto_511129 ?auto_511131 ) ) ( not ( = ?auto_511130 ?auto_511131 ) ) ( ON ?auto_511129 ?auto_511130 ) ( CLEAR ?auto_511127 ) ( ON ?auto_511128 ?auto_511129 ) ( CLEAR ?auto_511128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_511119 ?auto_511120 ?auto_511121 ?auto_511122 ?auto_511123 ?auto_511124 ?auto_511125 ?auto_511126 ?auto_511127 ?auto_511128 )
      ( MAKE-12PILE ?auto_511119 ?auto_511120 ?auto_511121 ?auto_511122 ?auto_511123 ?auto_511124 ?auto_511125 ?auto_511126 ?auto_511127 ?auto_511128 ?auto_511129 ?auto_511130 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511169 - BLOCK
      ?auto_511170 - BLOCK
      ?auto_511171 - BLOCK
      ?auto_511172 - BLOCK
      ?auto_511173 - BLOCK
      ?auto_511174 - BLOCK
      ?auto_511175 - BLOCK
      ?auto_511176 - BLOCK
      ?auto_511177 - BLOCK
      ?auto_511178 - BLOCK
      ?auto_511179 - BLOCK
      ?auto_511180 - BLOCK
    )
    :vars
    (
      ?auto_511181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511180 ?auto_511181 ) ( ON-TABLE ?auto_511169 ) ( ON ?auto_511170 ?auto_511169 ) ( ON ?auto_511171 ?auto_511170 ) ( ON ?auto_511172 ?auto_511171 ) ( ON ?auto_511173 ?auto_511172 ) ( ON ?auto_511174 ?auto_511173 ) ( ON ?auto_511175 ?auto_511174 ) ( ON ?auto_511176 ?auto_511175 ) ( not ( = ?auto_511169 ?auto_511170 ) ) ( not ( = ?auto_511169 ?auto_511171 ) ) ( not ( = ?auto_511169 ?auto_511172 ) ) ( not ( = ?auto_511169 ?auto_511173 ) ) ( not ( = ?auto_511169 ?auto_511174 ) ) ( not ( = ?auto_511169 ?auto_511175 ) ) ( not ( = ?auto_511169 ?auto_511176 ) ) ( not ( = ?auto_511169 ?auto_511177 ) ) ( not ( = ?auto_511169 ?auto_511178 ) ) ( not ( = ?auto_511169 ?auto_511179 ) ) ( not ( = ?auto_511169 ?auto_511180 ) ) ( not ( = ?auto_511169 ?auto_511181 ) ) ( not ( = ?auto_511170 ?auto_511171 ) ) ( not ( = ?auto_511170 ?auto_511172 ) ) ( not ( = ?auto_511170 ?auto_511173 ) ) ( not ( = ?auto_511170 ?auto_511174 ) ) ( not ( = ?auto_511170 ?auto_511175 ) ) ( not ( = ?auto_511170 ?auto_511176 ) ) ( not ( = ?auto_511170 ?auto_511177 ) ) ( not ( = ?auto_511170 ?auto_511178 ) ) ( not ( = ?auto_511170 ?auto_511179 ) ) ( not ( = ?auto_511170 ?auto_511180 ) ) ( not ( = ?auto_511170 ?auto_511181 ) ) ( not ( = ?auto_511171 ?auto_511172 ) ) ( not ( = ?auto_511171 ?auto_511173 ) ) ( not ( = ?auto_511171 ?auto_511174 ) ) ( not ( = ?auto_511171 ?auto_511175 ) ) ( not ( = ?auto_511171 ?auto_511176 ) ) ( not ( = ?auto_511171 ?auto_511177 ) ) ( not ( = ?auto_511171 ?auto_511178 ) ) ( not ( = ?auto_511171 ?auto_511179 ) ) ( not ( = ?auto_511171 ?auto_511180 ) ) ( not ( = ?auto_511171 ?auto_511181 ) ) ( not ( = ?auto_511172 ?auto_511173 ) ) ( not ( = ?auto_511172 ?auto_511174 ) ) ( not ( = ?auto_511172 ?auto_511175 ) ) ( not ( = ?auto_511172 ?auto_511176 ) ) ( not ( = ?auto_511172 ?auto_511177 ) ) ( not ( = ?auto_511172 ?auto_511178 ) ) ( not ( = ?auto_511172 ?auto_511179 ) ) ( not ( = ?auto_511172 ?auto_511180 ) ) ( not ( = ?auto_511172 ?auto_511181 ) ) ( not ( = ?auto_511173 ?auto_511174 ) ) ( not ( = ?auto_511173 ?auto_511175 ) ) ( not ( = ?auto_511173 ?auto_511176 ) ) ( not ( = ?auto_511173 ?auto_511177 ) ) ( not ( = ?auto_511173 ?auto_511178 ) ) ( not ( = ?auto_511173 ?auto_511179 ) ) ( not ( = ?auto_511173 ?auto_511180 ) ) ( not ( = ?auto_511173 ?auto_511181 ) ) ( not ( = ?auto_511174 ?auto_511175 ) ) ( not ( = ?auto_511174 ?auto_511176 ) ) ( not ( = ?auto_511174 ?auto_511177 ) ) ( not ( = ?auto_511174 ?auto_511178 ) ) ( not ( = ?auto_511174 ?auto_511179 ) ) ( not ( = ?auto_511174 ?auto_511180 ) ) ( not ( = ?auto_511174 ?auto_511181 ) ) ( not ( = ?auto_511175 ?auto_511176 ) ) ( not ( = ?auto_511175 ?auto_511177 ) ) ( not ( = ?auto_511175 ?auto_511178 ) ) ( not ( = ?auto_511175 ?auto_511179 ) ) ( not ( = ?auto_511175 ?auto_511180 ) ) ( not ( = ?auto_511175 ?auto_511181 ) ) ( not ( = ?auto_511176 ?auto_511177 ) ) ( not ( = ?auto_511176 ?auto_511178 ) ) ( not ( = ?auto_511176 ?auto_511179 ) ) ( not ( = ?auto_511176 ?auto_511180 ) ) ( not ( = ?auto_511176 ?auto_511181 ) ) ( not ( = ?auto_511177 ?auto_511178 ) ) ( not ( = ?auto_511177 ?auto_511179 ) ) ( not ( = ?auto_511177 ?auto_511180 ) ) ( not ( = ?auto_511177 ?auto_511181 ) ) ( not ( = ?auto_511178 ?auto_511179 ) ) ( not ( = ?auto_511178 ?auto_511180 ) ) ( not ( = ?auto_511178 ?auto_511181 ) ) ( not ( = ?auto_511179 ?auto_511180 ) ) ( not ( = ?auto_511179 ?auto_511181 ) ) ( not ( = ?auto_511180 ?auto_511181 ) ) ( ON ?auto_511179 ?auto_511180 ) ( ON ?auto_511178 ?auto_511179 ) ( CLEAR ?auto_511176 ) ( ON ?auto_511177 ?auto_511178 ) ( CLEAR ?auto_511177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_511169 ?auto_511170 ?auto_511171 ?auto_511172 ?auto_511173 ?auto_511174 ?auto_511175 ?auto_511176 ?auto_511177 )
      ( MAKE-12PILE ?auto_511169 ?auto_511170 ?auto_511171 ?auto_511172 ?auto_511173 ?auto_511174 ?auto_511175 ?auto_511176 ?auto_511177 ?auto_511178 ?auto_511179 ?auto_511180 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511219 - BLOCK
      ?auto_511220 - BLOCK
      ?auto_511221 - BLOCK
      ?auto_511222 - BLOCK
      ?auto_511223 - BLOCK
      ?auto_511224 - BLOCK
      ?auto_511225 - BLOCK
      ?auto_511226 - BLOCK
      ?auto_511227 - BLOCK
      ?auto_511228 - BLOCK
      ?auto_511229 - BLOCK
      ?auto_511230 - BLOCK
    )
    :vars
    (
      ?auto_511231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511230 ?auto_511231 ) ( ON-TABLE ?auto_511219 ) ( ON ?auto_511220 ?auto_511219 ) ( ON ?auto_511221 ?auto_511220 ) ( ON ?auto_511222 ?auto_511221 ) ( ON ?auto_511223 ?auto_511222 ) ( ON ?auto_511224 ?auto_511223 ) ( ON ?auto_511225 ?auto_511224 ) ( not ( = ?auto_511219 ?auto_511220 ) ) ( not ( = ?auto_511219 ?auto_511221 ) ) ( not ( = ?auto_511219 ?auto_511222 ) ) ( not ( = ?auto_511219 ?auto_511223 ) ) ( not ( = ?auto_511219 ?auto_511224 ) ) ( not ( = ?auto_511219 ?auto_511225 ) ) ( not ( = ?auto_511219 ?auto_511226 ) ) ( not ( = ?auto_511219 ?auto_511227 ) ) ( not ( = ?auto_511219 ?auto_511228 ) ) ( not ( = ?auto_511219 ?auto_511229 ) ) ( not ( = ?auto_511219 ?auto_511230 ) ) ( not ( = ?auto_511219 ?auto_511231 ) ) ( not ( = ?auto_511220 ?auto_511221 ) ) ( not ( = ?auto_511220 ?auto_511222 ) ) ( not ( = ?auto_511220 ?auto_511223 ) ) ( not ( = ?auto_511220 ?auto_511224 ) ) ( not ( = ?auto_511220 ?auto_511225 ) ) ( not ( = ?auto_511220 ?auto_511226 ) ) ( not ( = ?auto_511220 ?auto_511227 ) ) ( not ( = ?auto_511220 ?auto_511228 ) ) ( not ( = ?auto_511220 ?auto_511229 ) ) ( not ( = ?auto_511220 ?auto_511230 ) ) ( not ( = ?auto_511220 ?auto_511231 ) ) ( not ( = ?auto_511221 ?auto_511222 ) ) ( not ( = ?auto_511221 ?auto_511223 ) ) ( not ( = ?auto_511221 ?auto_511224 ) ) ( not ( = ?auto_511221 ?auto_511225 ) ) ( not ( = ?auto_511221 ?auto_511226 ) ) ( not ( = ?auto_511221 ?auto_511227 ) ) ( not ( = ?auto_511221 ?auto_511228 ) ) ( not ( = ?auto_511221 ?auto_511229 ) ) ( not ( = ?auto_511221 ?auto_511230 ) ) ( not ( = ?auto_511221 ?auto_511231 ) ) ( not ( = ?auto_511222 ?auto_511223 ) ) ( not ( = ?auto_511222 ?auto_511224 ) ) ( not ( = ?auto_511222 ?auto_511225 ) ) ( not ( = ?auto_511222 ?auto_511226 ) ) ( not ( = ?auto_511222 ?auto_511227 ) ) ( not ( = ?auto_511222 ?auto_511228 ) ) ( not ( = ?auto_511222 ?auto_511229 ) ) ( not ( = ?auto_511222 ?auto_511230 ) ) ( not ( = ?auto_511222 ?auto_511231 ) ) ( not ( = ?auto_511223 ?auto_511224 ) ) ( not ( = ?auto_511223 ?auto_511225 ) ) ( not ( = ?auto_511223 ?auto_511226 ) ) ( not ( = ?auto_511223 ?auto_511227 ) ) ( not ( = ?auto_511223 ?auto_511228 ) ) ( not ( = ?auto_511223 ?auto_511229 ) ) ( not ( = ?auto_511223 ?auto_511230 ) ) ( not ( = ?auto_511223 ?auto_511231 ) ) ( not ( = ?auto_511224 ?auto_511225 ) ) ( not ( = ?auto_511224 ?auto_511226 ) ) ( not ( = ?auto_511224 ?auto_511227 ) ) ( not ( = ?auto_511224 ?auto_511228 ) ) ( not ( = ?auto_511224 ?auto_511229 ) ) ( not ( = ?auto_511224 ?auto_511230 ) ) ( not ( = ?auto_511224 ?auto_511231 ) ) ( not ( = ?auto_511225 ?auto_511226 ) ) ( not ( = ?auto_511225 ?auto_511227 ) ) ( not ( = ?auto_511225 ?auto_511228 ) ) ( not ( = ?auto_511225 ?auto_511229 ) ) ( not ( = ?auto_511225 ?auto_511230 ) ) ( not ( = ?auto_511225 ?auto_511231 ) ) ( not ( = ?auto_511226 ?auto_511227 ) ) ( not ( = ?auto_511226 ?auto_511228 ) ) ( not ( = ?auto_511226 ?auto_511229 ) ) ( not ( = ?auto_511226 ?auto_511230 ) ) ( not ( = ?auto_511226 ?auto_511231 ) ) ( not ( = ?auto_511227 ?auto_511228 ) ) ( not ( = ?auto_511227 ?auto_511229 ) ) ( not ( = ?auto_511227 ?auto_511230 ) ) ( not ( = ?auto_511227 ?auto_511231 ) ) ( not ( = ?auto_511228 ?auto_511229 ) ) ( not ( = ?auto_511228 ?auto_511230 ) ) ( not ( = ?auto_511228 ?auto_511231 ) ) ( not ( = ?auto_511229 ?auto_511230 ) ) ( not ( = ?auto_511229 ?auto_511231 ) ) ( not ( = ?auto_511230 ?auto_511231 ) ) ( ON ?auto_511229 ?auto_511230 ) ( ON ?auto_511228 ?auto_511229 ) ( ON ?auto_511227 ?auto_511228 ) ( CLEAR ?auto_511225 ) ( ON ?auto_511226 ?auto_511227 ) ( CLEAR ?auto_511226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_511219 ?auto_511220 ?auto_511221 ?auto_511222 ?auto_511223 ?auto_511224 ?auto_511225 ?auto_511226 )
      ( MAKE-12PILE ?auto_511219 ?auto_511220 ?auto_511221 ?auto_511222 ?auto_511223 ?auto_511224 ?auto_511225 ?auto_511226 ?auto_511227 ?auto_511228 ?auto_511229 ?auto_511230 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511269 - BLOCK
      ?auto_511270 - BLOCK
      ?auto_511271 - BLOCK
      ?auto_511272 - BLOCK
      ?auto_511273 - BLOCK
      ?auto_511274 - BLOCK
      ?auto_511275 - BLOCK
      ?auto_511276 - BLOCK
      ?auto_511277 - BLOCK
      ?auto_511278 - BLOCK
      ?auto_511279 - BLOCK
      ?auto_511280 - BLOCK
    )
    :vars
    (
      ?auto_511281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511280 ?auto_511281 ) ( ON-TABLE ?auto_511269 ) ( ON ?auto_511270 ?auto_511269 ) ( ON ?auto_511271 ?auto_511270 ) ( ON ?auto_511272 ?auto_511271 ) ( ON ?auto_511273 ?auto_511272 ) ( ON ?auto_511274 ?auto_511273 ) ( not ( = ?auto_511269 ?auto_511270 ) ) ( not ( = ?auto_511269 ?auto_511271 ) ) ( not ( = ?auto_511269 ?auto_511272 ) ) ( not ( = ?auto_511269 ?auto_511273 ) ) ( not ( = ?auto_511269 ?auto_511274 ) ) ( not ( = ?auto_511269 ?auto_511275 ) ) ( not ( = ?auto_511269 ?auto_511276 ) ) ( not ( = ?auto_511269 ?auto_511277 ) ) ( not ( = ?auto_511269 ?auto_511278 ) ) ( not ( = ?auto_511269 ?auto_511279 ) ) ( not ( = ?auto_511269 ?auto_511280 ) ) ( not ( = ?auto_511269 ?auto_511281 ) ) ( not ( = ?auto_511270 ?auto_511271 ) ) ( not ( = ?auto_511270 ?auto_511272 ) ) ( not ( = ?auto_511270 ?auto_511273 ) ) ( not ( = ?auto_511270 ?auto_511274 ) ) ( not ( = ?auto_511270 ?auto_511275 ) ) ( not ( = ?auto_511270 ?auto_511276 ) ) ( not ( = ?auto_511270 ?auto_511277 ) ) ( not ( = ?auto_511270 ?auto_511278 ) ) ( not ( = ?auto_511270 ?auto_511279 ) ) ( not ( = ?auto_511270 ?auto_511280 ) ) ( not ( = ?auto_511270 ?auto_511281 ) ) ( not ( = ?auto_511271 ?auto_511272 ) ) ( not ( = ?auto_511271 ?auto_511273 ) ) ( not ( = ?auto_511271 ?auto_511274 ) ) ( not ( = ?auto_511271 ?auto_511275 ) ) ( not ( = ?auto_511271 ?auto_511276 ) ) ( not ( = ?auto_511271 ?auto_511277 ) ) ( not ( = ?auto_511271 ?auto_511278 ) ) ( not ( = ?auto_511271 ?auto_511279 ) ) ( not ( = ?auto_511271 ?auto_511280 ) ) ( not ( = ?auto_511271 ?auto_511281 ) ) ( not ( = ?auto_511272 ?auto_511273 ) ) ( not ( = ?auto_511272 ?auto_511274 ) ) ( not ( = ?auto_511272 ?auto_511275 ) ) ( not ( = ?auto_511272 ?auto_511276 ) ) ( not ( = ?auto_511272 ?auto_511277 ) ) ( not ( = ?auto_511272 ?auto_511278 ) ) ( not ( = ?auto_511272 ?auto_511279 ) ) ( not ( = ?auto_511272 ?auto_511280 ) ) ( not ( = ?auto_511272 ?auto_511281 ) ) ( not ( = ?auto_511273 ?auto_511274 ) ) ( not ( = ?auto_511273 ?auto_511275 ) ) ( not ( = ?auto_511273 ?auto_511276 ) ) ( not ( = ?auto_511273 ?auto_511277 ) ) ( not ( = ?auto_511273 ?auto_511278 ) ) ( not ( = ?auto_511273 ?auto_511279 ) ) ( not ( = ?auto_511273 ?auto_511280 ) ) ( not ( = ?auto_511273 ?auto_511281 ) ) ( not ( = ?auto_511274 ?auto_511275 ) ) ( not ( = ?auto_511274 ?auto_511276 ) ) ( not ( = ?auto_511274 ?auto_511277 ) ) ( not ( = ?auto_511274 ?auto_511278 ) ) ( not ( = ?auto_511274 ?auto_511279 ) ) ( not ( = ?auto_511274 ?auto_511280 ) ) ( not ( = ?auto_511274 ?auto_511281 ) ) ( not ( = ?auto_511275 ?auto_511276 ) ) ( not ( = ?auto_511275 ?auto_511277 ) ) ( not ( = ?auto_511275 ?auto_511278 ) ) ( not ( = ?auto_511275 ?auto_511279 ) ) ( not ( = ?auto_511275 ?auto_511280 ) ) ( not ( = ?auto_511275 ?auto_511281 ) ) ( not ( = ?auto_511276 ?auto_511277 ) ) ( not ( = ?auto_511276 ?auto_511278 ) ) ( not ( = ?auto_511276 ?auto_511279 ) ) ( not ( = ?auto_511276 ?auto_511280 ) ) ( not ( = ?auto_511276 ?auto_511281 ) ) ( not ( = ?auto_511277 ?auto_511278 ) ) ( not ( = ?auto_511277 ?auto_511279 ) ) ( not ( = ?auto_511277 ?auto_511280 ) ) ( not ( = ?auto_511277 ?auto_511281 ) ) ( not ( = ?auto_511278 ?auto_511279 ) ) ( not ( = ?auto_511278 ?auto_511280 ) ) ( not ( = ?auto_511278 ?auto_511281 ) ) ( not ( = ?auto_511279 ?auto_511280 ) ) ( not ( = ?auto_511279 ?auto_511281 ) ) ( not ( = ?auto_511280 ?auto_511281 ) ) ( ON ?auto_511279 ?auto_511280 ) ( ON ?auto_511278 ?auto_511279 ) ( ON ?auto_511277 ?auto_511278 ) ( ON ?auto_511276 ?auto_511277 ) ( CLEAR ?auto_511274 ) ( ON ?auto_511275 ?auto_511276 ) ( CLEAR ?auto_511275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_511269 ?auto_511270 ?auto_511271 ?auto_511272 ?auto_511273 ?auto_511274 ?auto_511275 )
      ( MAKE-12PILE ?auto_511269 ?auto_511270 ?auto_511271 ?auto_511272 ?auto_511273 ?auto_511274 ?auto_511275 ?auto_511276 ?auto_511277 ?auto_511278 ?auto_511279 ?auto_511280 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511319 - BLOCK
      ?auto_511320 - BLOCK
      ?auto_511321 - BLOCK
      ?auto_511322 - BLOCK
      ?auto_511323 - BLOCK
      ?auto_511324 - BLOCK
      ?auto_511325 - BLOCK
      ?auto_511326 - BLOCK
      ?auto_511327 - BLOCK
      ?auto_511328 - BLOCK
      ?auto_511329 - BLOCK
      ?auto_511330 - BLOCK
    )
    :vars
    (
      ?auto_511331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511330 ?auto_511331 ) ( ON-TABLE ?auto_511319 ) ( ON ?auto_511320 ?auto_511319 ) ( ON ?auto_511321 ?auto_511320 ) ( ON ?auto_511322 ?auto_511321 ) ( ON ?auto_511323 ?auto_511322 ) ( not ( = ?auto_511319 ?auto_511320 ) ) ( not ( = ?auto_511319 ?auto_511321 ) ) ( not ( = ?auto_511319 ?auto_511322 ) ) ( not ( = ?auto_511319 ?auto_511323 ) ) ( not ( = ?auto_511319 ?auto_511324 ) ) ( not ( = ?auto_511319 ?auto_511325 ) ) ( not ( = ?auto_511319 ?auto_511326 ) ) ( not ( = ?auto_511319 ?auto_511327 ) ) ( not ( = ?auto_511319 ?auto_511328 ) ) ( not ( = ?auto_511319 ?auto_511329 ) ) ( not ( = ?auto_511319 ?auto_511330 ) ) ( not ( = ?auto_511319 ?auto_511331 ) ) ( not ( = ?auto_511320 ?auto_511321 ) ) ( not ( = ?auto_511320 ?auto_511322 ) ) ( not ( = ?auto_511320 ?auto_511323 ) ) ( not ( = ?auto_511320 ?auto_511324 ) ) ( not ( = ?auto_511320 ?auto_511325 ) ) ( not ( = ?auto_511320 ?auto_511326 ) ) ( not ( = ?auto_511320 ?auto_511327 ) ) ( not ( = ?auto_511320 ?auto_511328 ) ) ( not ( = ?auto_511320 ?auto_511329 ) ) ( not ( = ?auto_511320 ?auto_511330 ) ) ( not ( = ?auto_511320 ?auto_511331 ) ) ( not ( = ?auto_511321 ?auto_511322 ) ) ( not ( = ?auto_511321 ?auto_511323 ) ) ( not ( = ?auto_511321 ?auto_511324 ) ) ( not ( = ?auto_511321 ?auto_511325 ) ) ( not ( = ?auto_511321 ?auto_511326 ) ) ( not ( = ?auto_511321 ?auto_511327 ) ) ( not ( = ?auto_511321 ?auto_511328 ) ) ( not ( = ?auto_511321 ?auto_511329 ) ) ( not ( = ?auto_511321 ?auto_511330 ) ) ( not ( = ?auto_511321 ?auto_511331 ) ) ( not ( = ?auto_511322 ?auto_511323 ) ) ( not ( = ?auto_511322 ?auto_511324 ) ) ( not ( = ?auto_511322 ?auto_511325 ) ) ( not ( = ?auto_511322 ?auto_511326 ) ) ( not ( = ?auto_511322 ?auto_511327 ) ) ( not ( = ?auto_511322 ?auto_511328 ) ) ( not ( = ?auto_511322 ?auto_511329 ) ) ( not ( = ?auto_511322 ?auto_511330 ) ) ( not ( = ?auto_511322 ?auto_511331 ) ) ( not ( = ?auto_511323 ?auto_511324 ) ) ( not ( = ?auto_511323 ?auto_511325 ) ) ( not ( = ?auto_511323 ?auto_511326 ) ) ( not ( = ?auto_511323 ?auto_511327 ) ) ( not ( = ?auto_511323 ?auto_511328 ) ) ( not ( = ?auto_511323 ?auto_511329 ) ) ( not ( = ?auto_511323 ?auto_511330 ) ) ( not ( = ?auto_511323 ?auto_511331 ) ) ( not ( = ?auto_511324 ?auto_511325 ) ) ( not ( = ?auto_511324 ?auto_511326 ) ) ( not ( = ?auto_511324 ?auto_511327 ) ) ( not ( = ?auto_511324 ?auto_511328 ) ) ( not ( = ?auto_511324 ?auto_511329 ) ) ( not ( = ?auto_511324 ?auto_511330 ) ) ( not ( = ?auto_511324 ?auto_511331 ) ) ( not ( = ?auto_511325 ?auto_511326 ) ) ( not ( = ?auto_511325 ?auto_511327 ) ) ( not ( = ?auto_511325 ?auto_511328 ) ) ( not ( = ?auto_511325 ?auto_511329 ) ) ( not ( = ?auto_511325 ?auto_511330 ) ) ( not ( = ?auto_511325 ?auto_511331 ) ) ( not ( = ?auto_511326 ?auto_511327 ) ) ( not ( = ?auto_511326 ?auto_511328 ) ) ( not ( = ?auto_511326 ?auto_511329 ) ) ( not ( = ?auto_511326 ?auto_511330 ) ) ( not ( = ?auto_511326 ?auto_511331 ) ) ( not ( = ?auto_511327 ?auto_511328 ) ) ( not ( = ?auto_511327 ?auto_511329 ) ) ( not ( = ?auto_511327 ?auto_511330 ) ) ( not ( = ?auto_511327 ?auto_511331 ) ) ( not ( = ?auto_511328 ?auto_511329 ) ) ( not ( = ?auto_511328 ?auto_511330 ) ) ( not ( = ?auto_511328 ?auto_511331 ) ) ( not ( = ?auto_511329 ?auto_511330 ) ) ( not ( = ?auto_511329 ?auto_511331 ) ) ( not ( = ?auto_511330 ?auto_511331 ) ) ( ON ?auto_511329 ?auto_511330 ) ( ON ?auto_511328 ?auto_511329 ) ( ON ?auto_511327 ?auto_511328 ) ( ON ?auto_511326 ?auto_511327 ) ( ON ?auto_511325 ?auto_511326 ) ( CLEAR ?auto_511323 ) ( ON ?auto_511324 ?auto_511325 ) ( CLEAR ?auto_511324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_511319 ?auto_511320 ?auto_511321 ?auto_511322 ?auto_511323 ?auto_511324 )
      ( MAKE-12PILE ?auto_511319 ?auto_511320 ?auto_511321 ?auto_511322 ?auto_511323 ?auto_511324 ?auto_511325 ?auto_511326 ?auto_511327 ?auto_511328 ?auto_511329 ?auto_511330 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511369 - BLOCK
      ?auto_511370 - BLOCK
      ?auto_511371 - BLOCK
      ?auto_511372 - BLOCK
      ?auto_511373 - BLOCK
      ?auto_511374 - BLOCK
      ?auto_511375 - BLOCK
      ?auto_511376 - BLOCK
      ?auto_511377 - BLOCK
      ?auto_511378 - BLOCK
      ?auto_511379 - BLOCK
      ?auto_511380 - BLOCK
    )
    :vars
    (
      ?auto_511381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511380 ?auto_511381 ) ( ON-TABLE ?auto_511369 ) ( ON ?auto_511370 ?auto_511369 ) ( ON ?auto_511371 ?auto_511370 ) ( ON ?auto_511372 ?auto_511371 ) ( not ( = ?auto_511369 ?auto_511370 ) ) ( not ( = ?auto_511369 ?auto_511371 ) ) ( not ( = ?auto_511369 ?auto_511372 ) ) ( not ( = ?auto_511369 ?auto_511373 ) ) ( not ( = ?auto_511369 ?auto_511374 ) ) ( not ( = ?auto_511369 ?auto_511375 ) ) ( not ( = ?auto_511369 ?auto_511376 ) ) ( not ( = ?auto_511369 ?auto_511377 ) ) ( not ( = ?auto_511369 ?auto_511378 ) ) ( not ( = ?auto_511369 ?auto_511379 ) ) ( not ( = ?auto_511369 ?auto_511380 ) ) ( not ( = ?auto_511369 ?auto_511381 ) ) ( not ( = ?auto_511370 ?auto_511371 ) ) ( not ( = ?auto_511370 ?auto_511372 ) ) ( not ( = ?auto_511370 ?auto_511373 ) ) ( not ( = ?auto_511370 ?auto_511374 ) ) ( not ( = ?auto_511370 ?auto_511375 ) ) ( not ( = ?auto_511370 ?auto_511376 ) ) ( not ( = ?auto_511370 ?auto_511377 ) ) ( not ( = ?auto_511370 ?auto_511378 ) ) ( not ( = ?auto_511370 ?auto_511379 ) ) ( not ( = ?auto_511370 ?auto_511380 ) ) ( not ( = ?auto_511370 ?auto_511381 ) ) ( not ( = ?auto_511371 ?auto_511372 ) ) ( not ( = ?auto_511371 ?auto_511373 ) ) ( not ( = ?auto_511371 ?auto_511374 ) ) ( not ( = ?auto_511371 ?auto_511375 ) ) ( not ( = ?auto_511371 ?auto_511376 ) ) ( not ( = ?auto_511371 ?auto_511377 ) ) ( not ( = ?auto_511371 ?auto_511378 ) ) ( not ( = ?auto_511371 ?auto_511379 ) ) ( not ( = ?auto_511371 ?auto_511380 ) ) ( not ( = ?auto_511371 ?auto_511381 ) ) ( not ( = ?auto_511372 ?auto_511373 ) ) ( not ( = ?auto_511372 ?auto_511374 ) ) ( not ( = ?auto_511372 ?auto_511375 ) ) ( not ( = ?auto_511372 ?auto_511376 ) ) ( not ( = ?auto_511372 ?auto_511377 ) ) ( not ( = ?auto_511372 ?auto_511378 ) ) ( not ( = ?auto_511372 ?auto_511379 ) ) ( not ( = ?auto_511372 ?auto_511380 ) ) ( not ( = ?auto_511372 ?auto_511381 ) ) ( not ( = ?auto_511373 ?auto_511374 ) ) ( not ( = ?auto_511373 ?auto_511375 ) ) ( not ( = ?auto_511373 ?auto_511376 ) ) ( not ( = ?auto_511373 ?auto_511377 ) ) ( not ( = ?auto_511373 ?auto_511378 ) ) ( not ( = ?auto_511373 ?auto_511379 ) ) ( not ( = ?auto_511373 ?auto_511380 ) ) ( not ( = ?auto_511373 ?auto_511381 ) ) ( not ( = ?auto_511374 ?auto_511375 ) ) ( not ( = ?auto_511374 ?auto_511376 ) ) ( not ( = ?auto_511374 ?auto_511377 ) ) ( not ( = ?auto_511374 ?auto_511378 ) ) ( not ( = ?auto_511374 ?auto_511379 ) ) ( not ( = ?auto_511374 ?auto_511380 ) ) ( not ( = ?auto_511374 ?auto_511381 ) ) ( not ( = ?auto_511375 ?auto_511376 ) ) ( not ( = ?auto_511375 ?auto_511377 ) ) ( not ( = ?auto_511375 ?auto_511378 ) ) ( not ( = ?auto_511375 ?auto_511379 ) ) ( not ( = ?auto_511375 ?auto_511380 ) ) ( not ( = ?auto_511375 ?auto_511381 ) ) ( not ( = ?auto_511376 ?auto_511377 ) ) ( not ( = ?auto_511376 ?auto_511378 ) ) ( not ( = ?auto_511376 ?auto_511379 ) ) ( not ( = ?auto_511376 ?auto_511380 ) ) ( not ( = ?auto_511376 ?auto_511381 ) ) ( not ( = ?auto_511377 ?auto_511378 ) ) ( not ( = ?auto_511377 ?auto_511379 ) ) ( not ( = ?auto_511377 ?auto_511380 ) ) ( not ( = ?auto_511377 ?auto_511381 ) ) ( not ( = ?auto_511378 ?auto_511379 ) ) ( not ( = ?auto_511378 ?auto_511380 ) ) ( not ( = ?auto_511378 ?auto_511381 ) ) ( not ( = ?auto_511379 ?auto_511380 ) ) ( not ( = ?auto_511379 ?auto_511381 ) ) ( not ( = ?auto_511380 ?auto_511381 ) ) ( ON ?auto_511379 ?auto_511380 ) ( ON ?auto_511378 ?auto_511379 ) ( ON ?auto_511377 ?auto_511378 ) ( ON ?auto_511376 ?auto_511377 ) ( ON ?auto_511375 ?auto_511376 ) ( ON ?auto_511374 ?auto_511375 ) ( CLEAR ?auto_511372 ) ( ON ?auto_511373 ?auto_511374 ) ( CLEAR ?auto_511373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_511369 ?auto_511370 ?auto_511371 ?auto_511372 ?auto_511373 )
      ( MAKE-12PILE ?auto_511369 ?auto_511370 ?auto_511371 ?auto_511372 ?auto_511373 ?auto_511374 ?auto_511375 ?auto_511376 ?auto_511377 ?auto_511378 ?auto_511379 ?auto_511380 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511419 - BLOCK
      ?auto_511420 - BLOCK
      ?auto_511421 - BLOCK
      ?auto_511422 - BLOCK
      ?auto_511423 - BLOCK
      ?auto_511424 - BLOCK
      ?auto_511425 - BLOCK
      ?auto_511426 - BLOCK
      ?auto_511427 - BLOCK
      ?auto_511428 - BLOCK
      ?auto_511429 - BLOCK
      ?auto_511430 - BLOCK
    )
    :vars
    (
      ?auto_511431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511430 ?auto_511431 ) ( ON-TABLE ?auto_511419 ) ( ON ?auto_511420 ?auto_511419 ) ( ON ?auto_511421 ?auto_511420 ) ( not ( = ?auto_511419 ?auto_511420 ) ) ( not ( = ?auto_511419 ?auto_511421 ) ) ( not ( = ?auto_511419 ?auto_511422 ) ) ( not ( = ?auto_511419 ?auto_511423 ) ) ( not ( = ?auto_511419 ?auto_511424 ) ) ( not ( = ?auto_511419 ?auto_511425 ) ) ( not ( = ?auto_511419 ?auto_511426 ) ) ( not ( = ?auto_511419 ?auto_511427 ) ) ( not ( = ?auto_511419 ?auto_511428 ) ) ( not ( = ?auto_511419 ?auto_511429 ) ) ( not ( = ?auto_511419 ?auto_511430 ) ) ( not ( = ?auto_511419 ?auto_511431 ) ) ( not ( = ?auto_511420 ?auto_511421 ) ) ( not ( = ?auto_511420 ?auto_511422 ) ) ( not ( = ?auto_511420 ?auto_511423 ) ) ( not ( = ?auto_511420 ?auto_511424 ) ) ( not ( = ?auto_511420 ?auto_511425 ) ) ( not ( = ?auto_511420 ?auto_511426 ) ) ( not ( = ?auto_511420 ?auto_511427 ) ) ( not ( = ?auto_511420 ?auto_511428 ) ) ( not ( = ?auto_511420 ?auto_511429 ) ) ( not ( = ?auto_511420 ?auto_511430 ) ) ( not ( = ?auto_511420 ?auto_511431 ) ) ( not ( = ?auto_511421 ?auto_511422 ) ) ( not ( = ?auto_511421 ?auto_511423 ) ) ( not ( = ?auto_511421 ?auto_511424 ) ) ( not ( = ?auto_511421 ?auto_511425 ) ) ( not ( = ?auto_511421 ?auto_511426 ) ) ( not ( = ?auto_511421 ?auto_511427 ) ) ( not ( = ?auto_511421 ?auto_511428 ) ) ( not ( = ?auto_511421 ?auto_511429 ) ) ( not ( = ?auto_511421 ?auto_511430 ) ) ( not ( = ?auto_511421 ?auto_511431 ) ) ( not ( = ?auto_511422 ?auto_511423 ) ) ( not ( = ?auto_511422 ?auto_511424 ) ) ( not ( = ?auto_511422 ?auto_511425 ) ) ( not ( = ?auto_511422 ?auto_511426 ) ) ( not ( = ?auto_511422 ?auto_511427 ) ) ( not ( = ?auto_511422 ?auto_511428 ) ) ( not ( = ?auto_511422 ?auto_511429 ) ) ( not ( = ?auto_511422 ?auto_511430 ) ) ( not ( = ?auto_511422 ?auto_511431 ) ) ( not ( = ?auto_511423 ?auto_511424 ) ) ( not ( = ?auto_511423 ?auto_511425 ) ) ( not ( = ?auto_511423 ?auto_511426 ) ) ( not ( = ?auto_511423 ?auto_511427 ) ) ( not ( = ?auto_511423 ?auto_511428 ) ) ( not ( = ?auto_511423 ?auto_511429 ) ) ( not ( = ?auto_511423 ?auto_511430 ) ) ( not ( = ?auto_511423 ?auto_511431 ) ) ( not ( = ?auto_511424 ?auto_511425 ) ) ( not ( = ?auto_511424 ?auto_511426 ) ) ( not ( = ?auto_511424 ?auto_511427 ) ) ( not ( = ?auto_511424 ?auto_511428 ) ) ( not ( = ?auto_511424 ?auto_511429 ) ) ( not ( = ?auto_511424 ?auto_511430 ) ) ( not ( = ?auto_511424 ?auto_511431 ) ) ( not ( = ?auto_511425 ?auto_511426 ) ) ( not ( = ?auto_511425 ?auto_511427 ) ) ( not ( = ?auto_511425 ?auto_511428 ) ) ( not ( = ?auto_511425 ?auto_511429 ) ) ( not ( = ?auto_511425 ?auto_511430 ) ) ( not ( = ?auto_511425 ?auto_511431 ) ) ( not ( = ?auto_511426 ?auto_511427 ) ) ( not ( = ?auto_511426 ?auto_511428 ) ) ( not ( = ?auto_511426 ?auto_511429 ) ) ( not ( = ?auto_511426 ?auto_511430 ) ) ( not ( = ?auto_511426 ?auto_511431 ) ) ( not ( = ?auto_511427 ?auto_511428 ) ) ( not ( = ?auto_511427 ?auto_511429 ) ) ( not ( = ?auto_511427 ?auto_511430 ) ) ( not ( = ?auto_511427 ?auto_511431 ) ) ( not ( = ?auto_511428 ?auto_511429 ) ) ( not ( = ?auto_511428 ?auto_511430 ) ) ( not ( = ?auto_511428 ?auto_511431 ) ) ( not ( = ?auto_511429 ?auto_511430 ) ) ( not ( = ?auto_511429 ?auto_511431 ) ) ( not ( = ?auto_511430 ?auto_511431 ) ) ( ON ?auto_511429 ?auto_511430 ) ( ON ?auto_511428 ?auto_511429 ) ( ON ?auto_511427 ?auto_511428 ) ( ON ?auto_511426 ?auto_511427 ) ( ON ?auto_511425 ?auto_511426 ) ( ON ?auto_511424 ?auto_511425 ) ( ON ?auto_511423 ?auto_511424 ) ( CLEAR ?auto_511421 ) ( ON ?auto_511422 ?auto_511423 ) ( CLEAR ?auto_511422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_511419 ?auto_511420 ?auto_511421 ?auto_511422 )
      ( MAKE-12PILE ?auto_511419 ?auto_511420 ?auto_511421 ?auto_511422 ?auto_511423 ?auto_511424 ?auto_511425 ?auto_511426 ?auto_511427 ?auto_511428 ?auto_511429 ?auto_511430 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511469 - BLOCK
      ?auto_511470 - BLOCK
      ?auto_511471 - BLOCK
      ?auto_511472 - BLOCK
      ?auto_511473 - BLOCK
      ?auto_511474 - BLOCK
      ?auto_511475 - BLOCK
      ?auto_511476 - BLOCK
      ?auto_511477 - BLOCK
      ?auto_511478 - BLOCK
      ?auto_511479 - BLOCK
      ?auto_511480 - BLOCK
    )
    :vars
    (
      ?auto_511481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511480 ?auto_511481 ) ( ON-TABLE ?auto_511469 ) ( ON ?auto_511470 ?auto_511469 ) ( not ( = ?auto_511469 ?auto_511470 ) ) ( not ( = ?auto_511469 ?auto_511471 ) ) ( not ( = ?auto_511469 ?auto_511472 ) ) ( not ( = ?auto_511469 ?auto_511473 ) ) ( not ( = ?auto_511469 ?auto_511474 ) ) ( not ( = ?auto_511469 ?auto_511475 ) ) ( not ( = ?auto_511469 ?auto_511476 ) ) ( not ( = ?auto_511469 ?auto_511477 ) ) ( not ( = ?auto_511469 ?auto_511478 ) ) ( not ( = ?auto_511469 ?auto_511479 ) ) ( not ( = ?auto_511469 ?auto_511480 ) ) ( not ( = ?auto_511469 ?auto_511481 ) ) ( not ( = ?auto_511470 ?auto_511471 ) ) ( not ( = ?auto_511470 ?auto_511472 ) ) ( not ( = ?auto_511470 ?auto_511473 ) ) ( not ( = ?auto_511470 ?auto_511474 ) ) ( not ( = ?auto_511470 ?auto_511475 ) ) ( not ( = ?auto_511470 ?auto_511476 ) ) ( not ( = ?auto_511470 ?auto_511477 ) ) ( not ( = ?auto_511470 ?auto_511478 ) ) ( not ( = ?auto_511470 ?auto_511479 ) ) ( not ( = ?auto_511470 ?auto_511480 ) ) ( not ( = ?auto_511470 ?auto_511481 ) ) ( not ( = ?auto_511471 ?auto_511472 ) ) ( not ( = ?auto_511471 ?auto_511473 ) ) ( not ( = ?auto_511471 ?auto_511474 ) ) ( not ( = ?auto_511471 ?auto_511475 ) ) ( not ( = ?auto_511471 ?auto_511476 ) ) ( not ( = ?auto_511471 ?auto_511477 ) ) ( not ( = ?auto_511471 ?auto_511478 ) ) ( not ( = ?auto_511471 ?auto_511479 ) ) ( not ( = ?auto_511471 ?auto_511480 ) ) ( not ( = ?auto_511471 ?auto_511481 ) ) ( not ( = ?auto_511472 ?auto_511473 ) ) ( not ( = ?auto_511472 ?auto_511474 ) ) ( not ( = ?auto_511472 ?auto_511475 ) ) ( not ( = ?auto_511472 ?auto_511476 ) ) ( not ( = ?auto_511472 ?auto_511477 ) ) ( not ( = ?auto_511472 ?auto_511478 ) ) ( not ( = ?auto_511472 ?auto_511479 ) ) ( not ( = ?auto_511472 ?auto_511480 ) ) ( not ( = ?auto_511472 ?auto_511481 ) ) ( not ( = ?auto_511473 ?auto_511474 ) ) ( not ( = ?auto_511473 ?auto_511475 ) ) ( not ( = ?auto_511473 ?auto_511476 ) ) ( not ( = ?auto_511473 ?auto_511477 ) ) ( not ( = ?auto_511473 ?auto_511478 ) ) ( not ( = ?auto_511473 ?auto_511479 ) ) ( not ( = ?auto_511473 ?auto_511480 ) ) ( not ( = ?auto_511473 ?auto_511481 ) ) ( not ( = ?auto_511474 ?auto_511475 ) ) ( not ( = ?auto_511474 ?auto_511476 ) ) ( not ( = ?auto_511474 ?auto_511477 ) ) ( not ( = ?auto_511474 ?auto_511478 ) ) ( not ( = ?auto_511474 ?auto_511479 ) ) ( not ( = ?auto_511474 ?auto_511480 ) ) ( not ( = ?auto_511474 ?auto_511481 ) ) ( not ( = ?auto_511475 ?auto_511476 ) ) ( not ( = ?auto_511475 ?auto_511477 ) ) ( not ( = ?auto_511475 ?auto_511478 ) ) ( not ( = ?auto_511475 ?auto_511479 ) ) ( not ( = ?auto_511475 ?auto_511480 ) ) ( not ( = ?auto_511475 ?auto_511481 ) ) ( not ( = ?auto_511476 ?auto_511477 ) ) ( not ( = ?auto_511476 ?auto_511478 ) ) ( not ( = ?auto_511476 ?auto_511479 ) ) ( not ( = ?auto_511476 ?auto_511480 ) ) ( not ( = ?auto_511476 ?auto_511481 ) ) ( not ( = ?auto_511477 ?auto_511478 ) ) ( not ( = ?auto_511477 ?auto_511479 ) ) ( not ( = ?auto_511477 ?auto_511480 ) ) ( not ( = ?auto_511477 ?auto_511481 ) ) ( not ( = ?auto_511478 ?auto_511479 ) ) ( not ( = ?auto_511478 ?auto_511480 ) ) ( not ( = ?auto_511478 ?auto_511481 ) ) ( not ( = ?auto_511479 ?auto_511480 ) ) ( not ( = ?auto_511479 ?auto_511481 ) ) ( not ( = ?auto_511480 ?auto_511481 ) ) ( ON ?auto_511479 ?auto_511480 ) ( ON ?auto_511478 ?auto_511479 ) ( ON ?auto_511477 ?auto_511478 ) ( ON ?auto_511476 ?auto_511477 ) ( ON ?auto_511475 ?auto_511476 ) ( ON ?auto_511474 ?auto_511475 ) ( ON ?auto_511473 ?auto_511474 ) ( ON ?auto_511472 ?auto_511473 ) ( CLEAR ?auto_511470 ) ( ON ?auto_511471 ?auto_511472 ) ( CLEAR ?auto_511471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_511469 ?auto_511470 ?auto_511471 )
      ( MAKE-12PILE ?auto_511469 ?auto_511470 ?auto_511471 ?auto_511472 ?auto_511473 ?auto_511474 ?auto_511475 ?auto_511476 ?auto_511477 ?auto_511478 ?auto_511479 ?auto_511480 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511519 - BLOCK
      ?auto_511520 - BLOCK
      ?auto_511521 - BLOCK
      ?auto_511522 - BLOCK
      ?auto_511523 - BLOCK
      ?auto_511524 - BLOCK
      ?auto_511525 - BLOCK
      ?auto_511526 - BLOCK
      ?auto_511527 - BLOCK
      ?auto_511528 - BLOCK
      ?auto_511529 - BLOCK
      ?auto_511530 - BLOCK
    )
    :vars
    (
      ?auto_511531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511530 ?auto_511531 ) ( ON-TABLE ?auto_511519 ) ( not ( = ?auto_511519 ?auto_511520 ) ) ( not ( = ?auto_511519 ?auto_511521 ) ) ( not ( = ?auto_511519 ?auto_511522 ) ) ( not ( = ?auto_511519 ?auto_511523 ) ) ( not ( = ?auto_511519 ?auto_511524 ) ) ( not ( = ?auto_511519 ?auto_511525 ) ) ( not ( = ?auto_511519 ?auto_511526 ) ) ( not ( = ?auto_511519 ?auto_511527 ) ) ( not ( = ?auto_511519 ?auto_511528 ) ) ( not ( = ?auto_511519 ?auto_511529 ) ) ( not ( = ?auto_511519 ?auto_511530 ) ) ( not ( = ?auto_511519 ?auto_511531 ) ) ( not ( = ?auto_511520 ?auto_511521 ) ) ( not ( = ?auto_511520 ?auto_511522 ) ) ( not ( = ?auto_511520 ?auto_511523 ) ) ( not ( = ?auto_511520 ?auto_511524 ) ) ( not ( = ?auto_511520 ?auto_511525 ) ) ( not ( = ?auto_511520 ?auto_511526 ) ) ( not ( = ?auto_511520 ?auto_511527 ) ) ( not ( = ?auto_511520 ?auto_511528 ) ) ( not ( = ?auto_511520 ?auto_511529 ) ) ( not ( = ?auto_511520 ?auto_511530 ) ) ( not ( = ?auto_511520 ?auto_511531 ) ) ( not ( = ?auto_511521 ?auto_511522 ) ) ( not ( = ?auto_511521 ?auto_511523 ) ) ( not ( = ?auto_511521 ?auto_511524 ) ) ( not ( = ?auto_511521 ?auto_511525 ) ) ( not ( = ?auto_511521 ?auto_511526 ) ) ( not ( = ?auto_511521 ?auto_511527 ) ) ( not ( = ?auto_511521 ?auto_511528 ) ) ( not ( = ?auto_511521 ?auto_511529 ) ) ( not ( = ?auto_511521 ?auto_511530 ) ) ( not ( = ?auto_511521 ?auto_511531 ) ) ( not ( = ?auto_511522 ?auto_511523 ) ) ( not ( = ?auto_511522 ?auto_511524 ) ) ( not ( = ?auto_511522 ?auto_511525 ) ) ( not ( = ?auto_511522 ?auto_511526 ) ) ( not ( = ?auto_511522 ?auto_511527 ) ) ( not ( = ?auto_511522 ?auto_511528 ) ) ( not ( = ?auto_511522 ?auto_511529 ) ) ( not ( = ?auto_511522 ?auto_511530 ) ) ( not ( = ?auto_511522 ?auto_511531 ) ) ( not ( = ?auto_511523 ?auto_511524 ) ) ( not ( = ?auto_511523 ?auto_511525 ) ) ( not ( = ?auto_511523 ?auto_511526 ) ) ( not ( = ?auto_511523 ?auto_511527 ) ) ( not ( = ?auto_511523 ?auto_511528 ) ) ( not ( = ?auto_511523 ?auto_511529 ) ) ( not ( = ?auto_511523 ?auto_511530 ) ) ( not ( = ?auto_511523 ?auto_511531 ) ) ( not ( = ?auto_511524 ?auto_511525 ) ) ( not ( = ?auto_511524 ?auto_511526 ) ) ( not ( = ?auto_511524 ?auto_511527 ) ) ( not ( = ?auto_511524 ?auto_511528 ) ) ( not ( = ?auto_511524 ?auto_511529 ) ) ( not ( = ?auto_511524 ?auto_511530 ) ) ( not ( = ?auto_511524 ?auto_511531 ) ) ( not ( = ?auto_511525 ?auto_511526 ) ) ( not ( = ?auto_511525 ?auto_511527 ) ) ( not ( = ?auto_511525 ?auto_511528 ) ) ( not ( = ?auto_511525 ?auto_511529 ) ) ( not ( = ?auto_511525 ?auto_511530 ) ) ( not ( = ?auto_511525 ?auto_511531 ) ) ( not ( = ?auto_511526 ?auto_511527 ) ) ( not ( = ?auto_511526 ?auto_511528 ) ) ( not ( = ?auto_511526 ?auto_511529 ) ) ( not ( = ?auto_511526 ?auto_511530 ) ) ( not ( = ?auto_511526 ?auto_511531 ) ) ( not ( = ?auto_511527 ?auto_511528 ) ) ( not ( = ?auto_511527 ?auto_511529 ) ) ( not ( = ?auto_511527 ?auto_511530 ) ) ( not ( = ?auto_511527 ?auto_511531 ) ) ( not ( = ?auto_511528 ?auto_511529 ) ) ( not ( = ?auto_511528 ?auto_511530 ) ) ( not ( = ?auto_511528 ?auto_511531 ) ) ( not ( = ?auto_511529 ?auto_511530 ) ) ( not ( = ?auto_511529 ?auto_511531 ) ) ( not ( = ?auto_511530 ?auto_511531 ) ) ( ON ?auto_511529 ?auto_511530 ) ( ON ?auto_511528 ?auto_511529 ) ( ON ?auto_511527 ?auto_511528 ) ( ON ?auto_511526 ?auto_511527 ) ( ON ?auto_511525 ?auto_511526 ) ( ON ?auto_511524 ?auto_511525 ) ( ON ?auto_511523 ?auto_511524 ) ( ON ?auto_511522 ?auto_511523 ) ( ON ?auto_511521 ?auto_511522 ) ( CLEAR ?auto_511519 ) ( ON ?auto_511520 ?auto_511521 ) ( CLEAR ?auto_511520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_511519 ?auto_511520 )
      ( MAKE-12PILE ?auto_511519 ?auto_511520 ?auto_511521 ?auto_511522 ?auto_511523 ?auto_511524 ?auto_511525 ?auto_511526 ?auto_511527 ?auto_511528 ?auto_511529 ?auto_511530 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_511569 - BLOCK
      ?auto_511570 - BLOCK
      ?auto_511571 - BLOCK
      ?auto_511572 - BLOCK
      ?auto_511573 - BLOCK
      ?auto_511574 - BLOCK
      ?auto_511575 - BLOCK
      ?auto_511576 - BLOCK
      ?auto_511577 - BLOCK
      ?auto_511578 - BLOCK
      ?auto_511579 - BLOCK
      ?auto_511580 - BLOCK
    )
    :vars
    (
      ?auto_511581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511580 ?auto_511581 ) ( not ( = ?auto_511569 ?auto_511570 ) ) ( not ( = ?auto_511569 ?auto_511571 ) ) ( not ( = ?auto_511569 ?auto_511572 ) ) ( not ( = ?auto_511569 ?auto_511573 ) ) ( not ( = ?auto_511569 ?auto_511574 ) ) ( not ( = ?auto_511569 ?auto_511575 ) ) ( not ( = ?auto_511569 ?auto_511576 ) ) ( not ( = ?auto_511569 ?auto_511577 ) ) ( not ( = ?auto_511569 ?auto_511578 ) ) ( not ( = ?auto_511569 ?auto_511579 ) ) ( not ( = ?auto_511569 ?auto_511580 ) ) ( not ( = ?auto_511569 ?auto_511581 ) ) ( not ( = ?auto_511570 ?auto_511571 ) ) ( not ( = ?auto_511570 ?auto_511572 ) ) ( not ( = ?auto_511570 ?auto_511573 ) ) ( not ( = ?auto_511570 ?auto_511574 ) ) ( not ( = ?auto_511570 ?auto_511575 ) ) ( not ( = ?auto_511570 ?auto_511576 ) ) ( not ( = ?auto_511570 ?auto_511577 ) ) ( not ( = ?auto_511570 ?auto_511578 ) ) ( not ( = ?auto_511570 ?auto_511579 ) ) ( not ( = ?auto_511570 ?auto_511580 ) ) ( not ( = ?auto_511570 ?auto_511581 ) ) ( not ( = ?auto_511571 ?auto_511572 ) ) ( not ( = ?auto_511571 ?auto_511573 ) ) ( not ( = ?auto_511571 ?auto_511574 ) ) ( not ( = ?auto_511571 ?auto_511575 ) ) ( not ( = ?auto_511571 ?auto_511576 ) ) ( not ( = ?auto_511571 ?auto_511577 ) ) ( not ( = ?auto_511571 ?auto_511578 ) ) ( not ( = ?auto_511571 ?auto_511579 ) ) ( not ( = ?auto_511571 ?auto_511580 ) ) ( not ( = ?auto_511571 ?auto_511581 ) ) ( not ( = ?auto_511572 ?auto_511573 ) ) ( not ( = ?auto_511572 ?auto_511574 ) ) ( not ( = ?auto_511572 ?auto_511575 ) ) ( not ( = ?auto_511572 ?auto_511576 ) ) ( not ( = ?auto_511572 ?auto_511577 ) ) ( not ( = ?auto_511572 ?auto_511578 ) ) ( not ( = ?auto_511572 ?auto_511579 ) ) ( not ( = ?auto_511572 ?auto_511580 ) ) ( not ( = ?auto_511572 ?auto_511581 ) ) ( not ( = ?auto_511573 ?auto_511574 ) ) ( not ( = ?auto_511573 ?auto_511575 ) ) ( not ( = ?auto_511573 ?auto_511576 ) ) ( not ( = ?auto_511573 ?auto_511577 ) ) ( not ( = ?auto_511573 ?auto_511578 ) ) ( not ( = ?auto_511573 ?auto_511579 ) ) ( not ( = ?auto_511573 ?auto_511580 ) ) ( not ( = ?auto_511573 ?auto_511581 ) ) ( not ( = ?auto_511574 ?auto_511575 ) ) ( not ( = ?auto_511574 ?auto_511576 ) ) ( not ( = ?auto_511574 ?auto_511577 ) ) ( not ( = ?auto_511574 ?auto_511578 ) ) ( not ( = ?auto_511574 ?auto_511579 ) ) ( not ( = ?auto_511574 ?auto_511580 ) ) ( not ( = ?auto_511574 ?auto_511581 ) ) ( not ( = ?auto_511575 ?auto_511576 ) ) ( not ( = ?auto_511575 ?auto_511577 ) ) ( not ( = ?auto_511575 ?auto_511578 ) ) ( not ( = ?auto_511575 ?auto_511579 ) ) ( not ( = ?auto_511575 ?auto_511580 ) ) ( not ( = ?auto_511575 ?auto_511581 ) ) ( not ( = ?auto_511576 ?auto_511577 ) ) ( not ( = ?auto_511576 ?auto_511578 ) ) ( not ( = ?auto_511576 ?auto_511579 ) ) ( not ( = ?auto_511576 ?auto_511580 ) ) ( not ( = ?auto_511576 ?auto_511581 ) ) ( not ( = ?auto_511577 ?auto_511578 ) ) ( not ( = ?auto_511577 ?auto_511579 ) ) ( not ( = ?auto_511577 ?auto_511580 ) ) ( not ( = ?auto_511577 ?auto_511581 ) ) ( not ( = ?auto_511578 ?auto_511579 ) ) ( not ( = ?auto_511578 ?auto_511580 ) ) ( not ( = ?auto_511578 ?auto_511581 ) ) ( not ( = ?auto_511579 ?auto_511580 ) ) ( not ( = ?auto_511579 ?auto_511581 ) ) ( not ( = ?auto_511580 ?auto_511581 ) ) ( ON ?auto_511579 ?auto_511580 ) ( ON ?auto_511578 ?auto_511579 ) ( ON ?auto_511577 ?auto_511578 ) ( ON ?auto_511576 ?auto_511577 ) ( ON ?auto_511575 ?auto_511576 ) ( ON ?auto_511574 ?auto_511575 ) ( ON ?auto_511573 ?auto_511574 ) ( ON ?auto_511572 ?auto_511573 ) ( ON ?auto_511571 ?auto_511572 ) ( ON ?auto_511570 ?auto_511571 ) ( ON ?auto_511569 ?auto_511570 ) ( CLEAR ?auto_511569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_511569 )
      ( MAKE-12PILE ?auto_511569 ?auto_511570 ?auto_511571 ?auto_511572 ?auto_511573 ?auto_511574 ?auto_511575 ?auto_511576 ?auto_511577 ?auto_511578 ?auto_511579 ?auto_511580 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511620 - BLOCK
      ?auto_511621 - BLOCK
      ?auto_511622 - BLOCK
      ?auto_511623 - BLOCK
      ?auto_511624 - BLOCK
      ?auto_511625 - BLOCK
      ?auto_511626 - BLOCK
      ?auto_511627 - BLOCK
      ?auto_511628 - BLOCK
      ?auto_511629 - BLOCK
      ?auto_511630 - BLOCK
      ?auto_511631 - BLOCK
      ?auto_511632 - BLOCK
    )
    :vars
    (
      ?auto_511633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_511631 ) ( ON ?auto_511632 ?auto_511633 ) ( CLEAR ?auto_511632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_511620 ) ( ON ?auto_511621 ?auto_511620 ) ( ON ?auto_511622 ?auto_511621 ) ( ON ?auto_511623 ?auto_511622 ) ( ON ?auto_511624 ?auto_511623 ) ( ON ?auto_511625 ?auto_511624 ) ( ON ?auto_511626 ?auto_511625 ) ( ON ?auto_511627 ?auto_511626 ) ( ON ?auto_511628 ?auto_511627 ) ( ON ?auto_511629 ?auto_511628 ) ( ON ?auto_511630 ?auto_511629 ) ( ON ?auto_511631 ?auto_511630 ) ( not ( = ?auto_511620 ?auto_511621 ) ) ( not ( = ?auto_511620 ?auto_511622 ) ) ( not ( = ?auto_511620 ?auto_511623 ) ) ( not ( = ?auto_511620 ?auto_511624 ) ) ( not ( = ?auto_511620 ?auto_511625 ) ) ( not ( = ?auto_511620 ?auto_511626 ) ) ( not ( = ?auto_511620 ?auto_511627 ) ) ( not ( = ?auto_511620 ?auto_511628 ) ) ( not ( = ?auto_511620 ?auto_511629 ) ) ( not ( = ?auto_511620 ?auto_511630 ) ) ( not ( = ?auto_511620 ?auto_511631 ) ) ( not ( = ?auto_511620 ?auto_511632 ) ) ( not ( = ?auto_511620 ?auto_511633 ) ) ( not ( = ?auto_511621 ?auto_511622 ) ) ( not ( = ?auto_511621 ?auto_511623 ) ) ( not ( = ?auto_511621 ?auto_511624 ) ) ( not ( = ?auto_511621 ?auto_511625 ) ) ( not ( = ?auto_511621 ?auto_511626 ) ) ( not ( = ?auto_511621 ?auto_511627 ) ) ( not ( = ?auto_511621 ?auto_511628 ) ) ( not ( = ?auto_511621 ?auto_511629 ) ) ( not ( = ?auto_511621 ?auto_511630 ) ) ( not ( = ?auto_511621 ?auto_511631 ) ) ( not ( = ?auto_511621 ?auto_511632 ) ) ( not ( = ?auto_511621 ?auto_511633 ) ) ( not ( = ?auto_511622 ?auto_511623 ) ) ( not ( = ?auto_511622 ?auto_511624 ) ) ( not ( = ?auto_511622 ?auto_511625 ) ) ( not ( = ?auto_511622 ?auto_511626 ) ) ( not ( = ?auto_511622 ?auto_511627 ) ) ( not ( = ?auto_511622 ?auto_511628 ) ) ( not ( = ?auto_511622 ?auto_511629 ) ) ( not ( = ?auto_511622 ?auto_511630 ) ) ( not ( = ?auto_511622 ?auto_511631 ) ) ( not ( = ?auto_511622 ?auto_511632 ) ) ( not ( = ?auto_511622 ?auto_511633 ) ) ( not ( = ?auto_511623 ?auto_511624 ) ) ( not ( = ?auto_511623 ?auto_511625 ) ) ( not ( = ?auto_511623 ?auto_511626 ) ) ( not ( = ?auto_511623 ?auto_511627 ) ) ( not ( = ?auto_511623 ?auto_511628 ) ) ( not ( = ?auto_511623 ?auto_511629 ) ) ( not ( = ?auto_511623 ?auto_511630 ) ) ( not ( = ?auto_511623 ?auto_511631 ) ) ( not ( = ?auto_511623 ?auto_511632 ) ) ( not ( = ?auto_511623 ?auto_511633 ) ) ( not ( = ?auto_511624 ?auto_511625 ) ) ( not ( = ?auto_511624 ?auto_511626 ) ) ( not ( = ?auto_511624 ?auto_511627 ) ) ( not ( = ?auto_511624 ?auto_511628 ) ) ( not ( = ?auto_511624 ?auto_511629 ) ) ( not ( = ?auto_511624 ?auto_511630 ) ) ( not ( = ?auto_511624 ?auto_511631 ) ) ( not ( = ?auto_511624 ?auto_511632 ) ) ( not ( = ?auto_511624 ?auto_511633 ) ) ( not ( = ?auto_511625 ?auto_511626 ) ) ( not ( = ?auto_511625 ?auto_511627 ) ) ( not ( = ?auto_511625 ?auto_511628 ) ) ( not ( = ?auto_511625 ?auto_511629 ) ) ( not ( = ?auto_511625 ?auto_511630 ) ) ( not ( = ?auto_511625 ?auto_511631 ) ) ( not ( = ?auto_511625 ?auto_511632 ) ) ( not ( = ?auto_511625 ?auto_511633 ) ) ( not ( = ?auto_511626 ?auto_511627 ) ) ( not ( = ?auto_511626 ?auto_511628 ) ) ( not ( = ?auto_511626 ?auto_511629 ) ) ( not ( = ?auto_511626 ?auto_511630 ) ) ( not ( = ?auto_511626 ?auto_511631 ) ) ( not ( = ?auto_511626 ?auto_511632 ) ) ( not ( = ?auto_511626 ?auto_511633 ) ) ( not ( = ?auto_511627 ?auto_511628 ) ) ( not ( = ?auto_511627 ?auto_511629 ) ) ( not ( = ?auto_511627 ?auto_511630 ) ) ( not ( = ?auto_511627 ?auto_511631 ) ) ( not ( = ?auto_511627 ?auto_511632 ) ) ( not ( = ?auto_511627 ?auto_511633 ) ) ( not ( = ?auto_511628 ?auto_511629 ) ) ( not ( = ?auto_511628 ?auto_511630 ) ) ( not ( = ?auto_511628 ?auto_511631 ) ) ( not ( = ?auto_511628 ?auto_511632 ) ) ( not ( = ?auto_511628 ?auto_511633 ) ) ( not ( = ?auto_511629 ?auto_511630 ) ) ( not ( = ?auto_511629 ?auto_511631 ) ) ( not ( = ?auto_511629 ?auto_511632 ) ) ( not ( = ?auto_511629 ?auto_511633 ) ) ( not ( = ?auto_511630 ?auto_511631 ) ) ( not ( = ?auto_511630 ?auto_511632 ) ) ( not ( = ?auto_511630 ?auto_511633 ) ) ( not ( = ?auto_511631 ?auto_511632 ) ) ( not ( = ?auto_511631 ?auto_511633 ) ) ( not ( = ?auto_511632 ?auto_511633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_511632 ?auto_511633 )
      ( !STACK ?auto_511632 ?auto_511631 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511674 - BLOCK
      ?auto_511675 - BLOCK
      ?auto_511676 - BLOCK
      ?auto_511677 - BLOCK
      ?auto_511678 - BLOCK
      ?auto_511679 - BLOCK
      ?auto_511680 - BLOCK
      ?auto_511681 - BLOCK
      ?auto_511682 - BLOCK
      ?auto_511683 - BLOCK
      ?auto_511684 - BLOCK
      ?auto_511685 - BLOCK
      ?auto_511686 - BLOCK
    )
    :vars
    (
      ?auto_511687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511686 ?auto_511687 ) ( ON-TABLE ?auto_511674 ) ( ON ?auto_511675 ?auto_511674 ) ( ON ?auto_511676 ?auto_511675 ) ( ON ?auto_511677 ?auto_511676 ) ( ON ?auto_511678 ?auto_511677 ) ( ON ?auto_511679 ?auto_511678 ) ( ON ?auto_511680 ?auto_511679 ) ( ON ?auto_511681 ?auto_511680 ) ( ON ?auto_511682 ?auto_511681 ) ( ON ?auto_511683 ?auto_511682 ) ( ON ?auto_511684 ?auto_511683 ) ( not ( = ?auto_511674 ?auto_511675 ) ) ( not ( = ?auto_511674 ?auto_511676 ) ) ( not ( = ?auto_511674 ?auto_511677 ) ) ( not ( = ?auto_511674 ?auto_511678 ) ) ( not ( = ?auto_511674 ?auto_511679 ) ) ( not ( = ?auto_511674 ?auto_511680 ) ) ( not ( = ?auto_511674 ?auto_511681 ) ) ( not ( = ?auto_511674 ?auto_511682 ) ) ( not ( = ?auto_511674 ?auto_511683 ) ) ( not ( = ?auto_511674 ?auto_511684 ) ) ( not ( = ?auto_511674 ?auto_511685 ) ) ( not ( = ?auto_511674 ?auto_511686 ) ) ( not ( = ?auto_511674 ?auto_511687 ) ) ( not ( = ?auto_511675 ?auto_511676 ) ) ( not ( = ?auto_511675 ?auto_511677 ) ) ( not ( = ?auto_511675 ?auto_511678 ) ) ( not ( = ?auto_511675 ?auto_511679 ) ) ( not ( = ?auto_511675 ?auto_511680 ) ) ( not ( = ?auto_511675 ?auto_511681 ) ) ( not ( = ?auto_511675 ?auto_511682 ) ) ( not ( = ?auto_511675 ?auto_511683 ) ) ( not ( = ?auto_511675 ?auto_511684 ) ) ( not ( = ?auto_511675 ?auto_511685 ) ) ( not ( = ?auto_511675 ?auto_511686 ) ) ( not ( = ?auto_511675 ?auto_511687 ) ) ( not ( = ?auto_511676 ?auto_511677 ) ) ( not ( = ?auto_511676 ?auto_511678 ) ) ( not ( = ?auto_511676 ?auto_511679 ) ) ( not ( = ?auto_511676 ?auto_511680 ) ) ( not ( = ?auto_511676 ?auto_511681 ) ) ( not ( = ?auto_511676 ?auto_511682 ) ) ( not ( = ?auto_511676 ?auto_511683 ) ) ( not ( = ?auto_511676 ?auto_511684 ) ) ( not ( = ?auto_511676 ?auto_511685 ) ) ( not ( = ?auto_511676 ?auto_511686 ) ) ( not ( = ?auto_511676 ?auto_511687 ) ) ( not ( = ?auto_511677 ?auto_511678 ) ) ( not ( = ?auto_511677 ?auto_511679 ) ) ( not ( = ?auto_511677 ?auto_511680 ) ) ( not ( = ?auto_511677 ?auto_511681 ) ) ( not ( = ?auto_511677 ?auto_511682 ) ) ( not ( = ?auto_511677 ?auto_511683 ) ) ( not ( = ?auto_511677 ?auto_511684 ) ) ( not ( = ?auto_511677 ?auto_511685 ) ) ( not ( = ?auto_511677 ?auto_511686 ) ) ( not ( = ?auto_511677 ?auto_511687 ) ) ( not ( = ?auto_511678 ?auto_511679 ) ) ( not ( = ?auto_511678 ?auto_511680 ) ) ( not ( = ?auto_511678 ?auto_511681 ) ) ( not ( = ?auto_511678 ?auto_511682 ) ) ( not ( = ?auto_511678 ?auto_511683 ) ) ( not ( = ?auto_511678 ?auto_511684 ) ) ( not ( = ?auto_511678 ?auto_511685 ) ) ( not ( = ?auto_511678 ?auto_511686 ) ) ( not ( = ?auto_511678 ?auto_511687 ) ) ( not ( = ?auto_511679 ?auto_511680 ) ) ( not ( = ?auto_511679 ?auto_511681 ) ) ( not ( = ?auto_511679 ?auto_511682 ) ) ( not ( = ?auto_511679 ?auto_511683 ) ) ( not ( = ?auto_511679 ?auto_511684 ) ) ( not ( = ?auto_511679 ?auto_511685 ) ) ( not ( = ?auto_511679 ?auto_511686 ) ) ( not ( = ?auto_511679 ?auto_511687 ) ) ( not ( = ?auto_511680 ?auto_511681 ) ) ( not ( = ?auto_511680 ?auto_511682 ) ) ( not ( = ?auto_511680 ?auto_511683 ) ) ( not ( = ?auto_511680 ?auto_511684 ) ) ( not ( = ?auto_511680 ?auto_511685 ) ) ( not ( = ?auto_511680 ?auto_511686 ) ) ( not ( = ?auto_511680 ?auto_511687 ) ) ( not ( = ?auto_511681 ?auto_511682 ) ) ( not ( = ?auto_511681 ?auto_511683 ) ) ( not ( = ?auto_511681 ?auto_511684 ) ) ( not ( = ?auto_511681 ?auto_511685 ) ) ( not ( = ?auto_511681 ?auto_511686 ) ) ( not ( = ?auto_511681 ?auto_511687 ) ) ( not ( = ?auto_511682 ?auto_511683 ) ) ( not ( = ?auto_511682 ?auto_511684 ) ) ( not ( = ?auto_511682 ?auto_511685 ) ) ( not ( = ?auto_511682 ?auto_511686 ) ) ( not ( = ?auto_511682 ?auto_511687 ) ) ( not ( = ?auto_511683 ?auto_511684 ) ) ( not ( = ?auto_511683 ?auto_511685 ) ) ( not ( = ?auto_511683 ?auto_511686 ) ) ( not ( = ?auto_511683 ?auto_511687 ) ) ( not ( = ?auto_511684 ?auto_511685 ) ) ( not ( = ?auto_511684 ?auto_511686 ) ) ( not ( = ?auto_511684 ?auto_511687 ) ) ( not ( = ?auto_511685 ?auto_511686 ) ) ( not ( = ?auto_511685 ?auto_511687 ) ) ( not ( = ?auto_511686 ?auto_511687 ) ) ( CLEAR ?auto_511684 ) ( ON ?auto_511685 ?auto_511686 ) ( CLEAR ?auto_511685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_511674 ?auto_511675 ?auto_511676 ?auto_511677 ?auto_511678 ?auto_511679 ?auto_511680 ?auto_511681 ?auto_511682 ?auto_511683 ?auto_511684 ?auto_511685 )
      ( MAKE-13PILE ?auto_511674 ?auto_511675 ?auto_511676 ?auto_511677 ?auto_511678 ?auto_511679 ?auto_511680 ?auto_511681 ?auto_511682 ?auto_511683 ?auto_511684 ?auto_511685 ?auto_511686 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511728 - BLOCK
      ?auto_511729 - BLOCK
      ?auto_511730 - BLOCK
      ?auto_511731 - BLOCK
      ?auto_511732 - BLOCK
      ?auto_511733 - BLOCK
      ?auto_511734 - BLOCK
      ?auto_511735 - BLOCK
      ?auto_511736 - BLOCK
      ?auto_511737 - BLOCK
      ?auto_511738 - BLOCK
      ?auto_511739 - BLOCK
      ?auto_511740 - BLOCK
    )
    :vars
    (
      ?auto_511741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511740 ?auto_511741 ) ( ON-TABLE ?auto_511728 ) ( ON ?auto_511729 ?auto_511728 ) ( ON ?auto_511730 ?auto_511729 ) ( ON ?auto_511731 ?auto_511730 ) ( ON ?auto_511732 ?auto_511731 ) ( ON ?auto_511733 ?auto_511732 ) ( ON ?auto_511734 ?auto_511733 ) ( ON ?auto_511735 ?auto_511734 ) ( ON ?auto_511736 ?auto_511735 ) ( ON ?auto_511737 ?auto_511736 ) ( not ( = ?auto_511728 ?auto_511729 ) ) ( not ( = ?auto_511728 ?auto_511730 ) ) ( not ( = ?auto_511728 ?auto_511731 ) ) ( not ( = ?auto_511728 ?auto_511732 ) ) ( not ( = ?auto_511728 ?auto_511733 ) ) ( not ( = ?auto_511728 ?auto_511734 ) ) ( not ( = ?auto_511728 ?auto_511735 ) ) ( not ( = ?auto_511728 ?auto_511736 ) ) ( not ( = ?auto_511728 ?auto_511737 ) ) ( not ( = ?auto_511728 ?auto_511738 ) ) ( not ( = ?auto_511728 ?auto_511739 ) ) ( not ( = ?auto_511728 ?auto_511740 ) ) ( not ( = ?auto_511728 ?auto_511741 ) ) ( not ( = ?auto_511729 ?auto_511730 ) ) ( not ( = ?auto_511729 ?auto_511731 ) ) ( not ( = ?auto_511729 ?auto_511732 ) ) ( not ( = ?auto_511729 ?auto_511733 ) ) ( not ( = ?auto_511729 ?auto_511734 ) ) ( not ( = ?auto_511729 ?auto_511735 ) ) ( not ( = ?auto_511729 ?auto_511736 ) ) ( not ( = ?auto_511729 ?auto_511737 ) ) ( not ( = ?auto_511729 ?auto_511738 ) ) ( not ( = ?auto_511729 ?auto_511739 ) ) ( not ( = ?auto_511729 ?auto_511740 ) ) ( not ( = ?auto_511729 ?auto_511741 ) ) ( not ( = ?auto_511730 ?auto_511731 ) ) ( not ( = ?auto_511730 ?auto_511732 ) ) ( not ( = ?auto_511730 ?auto_511733 ) ) ( not ( = ?auto_511730 ?auto_511734 ) ) ( not ( = ?auto_511730 ?auto_511735 ) ) ( not ( = ?auto_511730 ?auto_511736 ) ) ( not ( = ?auto_511730 ?auto_511737 ) ) ( not ( = ?auto_511730 ?auto_511738 ) ) ( not ( = ?auto_511730 ?auto_511739 ) ) ( not ( = ?auto_511730 ?auto_511740 ) ) ( not ( = ?auto_511730 ?auto_511741 ) ) ( not ( = ?auto_511731 ?auto_511732 ) ) ( not ( = ?auto_511731 ?auto_511733 ) ) ( not ( = ?auto_511731 ?auto_511734 ) ) ( not ( = ?auto_511731 ?auto_511735 ) ) ( not ( = ?auto_511731 ?auto_511736 ) ) ( not ( = ?auto_511731 ?auto_511737 ) ) ( not ( = ?auto_511731 ?auto_511738 ) ) ( not ( = ?auto_511731 ?auto_511739 ) ) ( not ( = ?auto_511731 ?auto_511740 ) ) ( not ( = ?auto_511731 ?auto_511741 ) ) ( not ( = ?auto_511732 ?auto_511733 ) ) ( not ( = ?auto_511732 ?auto_511734 ) ) ( not ( = ?auto_511732 ?auto_511735 ) ) ( not ( = ?auto_511732 ?auto_511736 ) ) ( not ( = ?auto_511732 ?auto_511737 ) ) ( not ( = ?auto_511732 ?auto_511738 ) ) ( not ( = ?auto_511732 ?auto_511739 ) ) ( not ( = ?auto_511732 ?auto_511740 ) ) ( not ( = ?auto_511732 ?auto_511741 ) ) ( not ( = ?auto_511733 ?auto_511734 ) ) ( not ( = ?auto_511733 ?auto_511735 ) ) ( not ( = ?auto_511733 ?auto_511736 ) ) ( not ( = ?auto_511733 ?auto_511737 ) ) ( not ( = ?auto_511733 ?auto_511738 ) ) ( not ( = ?auto_511733 ?auto_511739 ) ) ( not ( = ?auto_511733 ?auto_511740 ) ) ( not ( = ?auto_511733 ?auto_511741 ) ) ( not ( = ?auto_511734 ?auto_511735 ) ) ( not ( = ?auto_511734 ?auto_511736 ) ) ( not ( = ?auto_511734 ?auto_511737 ) ) ( not ( = ?auto_511734 ?auto_511738 ) ) ( not ( = ?auto_511734 ?auto_511739 ) ) ( not ( = ?auto_511734 ?auto_511740 ) ) ( not ( = ?auto_511734 ?auto_511741 ) ) ( not ( = ?auto_511735 ?auto_511736 ) ) ( not ( = ?auto_511735 ?auto_511737 ) ) ( not ( = ?auto_511735 ?auto_511738 ) ) ( not ( = ?auto_511735 ?auto_511739 ) ) ( not ( = ?auto_511735 ?auto_511740 ) ) ( not ( = ?auto_511735 ?auto_511741 ) ) ( not ( = ?auto_511736 ?auto_511737 ) ) ( not ( = ?auto_511736 ?auto_511738 ) ) ( not ( = ?auto_511736 ?auto_511739 ) ) ( not ( = ?auto_511736 ?auto_511740 ) ) ( not ( = ?auto_511736 ?auto_511741 ) ) ( not ( = ?auto_511737 ?auto_511738 ) ) ( not ( = ?auto_511737 ?auto_511739 ) ) ( not ( = ?auto_511737 ?auto_511740 ) ) ( not ( = ?auto_511737 ?auto_511741 ) ) ( not ( = ?auto_511738 ?auto_511739 ) ) ( not ( = ?auto_511738 ?auto_511740 ) ) ( not ( = ?auto_511738 ?auto_511741 ) ) ( not ( = ?auto_511739 ?auto_511740 ) ) ( not ( = ?auto_511739 ?auto_511741 ) ) ( not ( = ?auto_511740 ?auto_511741 ) ) ( ON ?auto_511739 ?auto_511740 ) ( CLEAR ?auto_511737 ) ( ON ?auto_511738 ?auto_511739 ) ( CLEAR ?auto_511738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_511728 ?auto_511729 ?auto_511730 ?auto_511731 ?auto_511732 ?auto_511733 ?auto_511734 ?auto_511735 ?auto_511736 ?auto_511737 ?auto_511738 )
      ( MAKE-13PILE ?auto_511728 ?auto_511729 ?auto_511730 ?auto_511731 ?auto_511732 ?auto_511733 ?auto_511734 ?auto_511735 ?auto_511736 ?auto_511737 ?auto_511738 ?auto_511739 ?auto_511740 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511782 - BLOCK
      ?auto_511783 - BLOCK
      ?auto_511784 - BLOCK
      ?auto_511785 - BLOCK
      ?auto_511786 - BLOCK
      ?auto_511787 - BLOCK
      ?auto_511788 - BLOCK
      ?auto_511789 - BLOCK
      ?auto_511790 - BLOCK
      ?auto_511791 - BLOCK
      ?auto_511792 - BLOCK
      ?auto_511793 - BLOCK
      ?auto_511794 - BLOCK
    )
    :vars
    (
      ?auto_511795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511794 ?auto_511795 ) ( ON-TABLE ?auto_511782 ) ( ON ?auto_511783 ?auto_511782 ) ( ON ?auto_511784 ?auto_511783 ) ( ON ?auto_511785 ?auto_511784 ) ( ON ?auto_511786 ?auto_511785 ) ( ON ?auto_511787 ?auto_511786 ) ( ON ?auto_511788 ?auto_511787 ) ( ON ?auto_511789 ?auto_511788 ) ( ON ?auto_511790 ?auto_511789 ) ( not ( = ?auto_511782 ?auto_511783 ) ) ( not ( = ?auto_511782 ?auto_511784 ) ) ( not ( = ?auto_511782 ?auto_511785 ) ) ( not ( = ?auto_511782 ?auto_511786 ) ) ( not ( = ?auto_511782 ?auto_511787 ) ) ( not ( = ?auto_511782 ?auto_511788 ) ) ( not ( = ?auto_511782 ?auto_511789 ) ) ( not ( = ?auto_511782 ?auto_511790 ) ) ( not ( = ?auto_511782 ?auto_511791 ) ) ( not ( = ?auto_511782 ?auto_511792 ) ) ( not ( = ?auto_511782 ?auto_511793 ) ) ( not ( = ?auto_511782 ?auto_511794 ) ) ( not ( = ?auto_511782 ?auto_511795 ) ) ( not ( = ?auto_511783 ?auto_511784 ) ) ( not ( = ?auto_511783 ?auto_511785 ) ) ( not ( = ?auto_511783 ?auto_511786 ) ) ( not ( = ?auto_511783 ?auto_511787 ) ) ( not ( = ?auto_511783 ?auto_511788 ) ) ( not ( = ?auto_511783 ?auto_511789 ) ) ( not ( = ?auto_511783 ?auto_511790 ) ) ( not ( = ?auto_511783 ?auto_511791 ) ) ( not ( = ?auto_511783 ?auto_511792 ) ) ( not ( = ?auto_511783 ?auto_511793 ) ) ( not ( = ?auto_511783 ?auto_511794 ) ) ( not ( = ?auto_511783 ?auto_511795 ) ) ( not ( = ?auto_511784 ?auto_511785 ) ) ( not ( = ?auto_511784 ?auto_511786 ) ) ( not ( = ?auto_511784 ?auto_511787 ) ) ( not ( = ?auto_511784 ?auto_511788 ) ) ( not ( = ?auto_511784 ?auto_511789 ) ) ( not ( = ?auto_511784 ?auto_511790 ) ) ( not ( = ?auto_511784 ?auto_511791 ) ) ( not ( = ?auto_511784 ?auto_511792 ) ) ( not ( = ?auto_511784 ?auto_511793 ) ) ( not ( = ?auto_511784 ?auto_511794 ) ) ( not ( = ?auto_511784 ?auto_511795 ) ) ( not ( = ?auto_511785 ?auto_511786 ) ) ( not ( = ?auto_511785 ?auto_511787 ) ) ( not ( = ?auto_511785 ?auto_511788 ) ) ( not ( = ?auto_511785 ?auto_511789 ) ) ( not ( = ?auto_511785 ?auto_511790 ) ) ( not ( = ?auto_511785 ?auto_511791 ) ) ( not ( = ?auto_511785 ?auto_511792 ) ) ( not ( = ?auto_511785 ?auto_511793 ) ) ( not ( = ?auto_511785 ?auto_511794 ) ) ( not ( = ?auto_511785 ?auto_511795 ) ) ( not ( = ?auto_511786 ?auto_511787 ) ) ( not ( = ?auto_511786 ?auto_511788 ) ) ( not ( = ?auto_511786 ?auto_511789 ) ) ( not ( = ?auto_511786 ?auto_511790 ) ) ( not ( = ?auto_511786 ?auto_511791 ) ) ( not ( = ?auto_511786 ?auto_511792 ) ) ( not ( = ?auto_511786 ?auto_511793 ) ) ( not ( = ?auto_511786 ?auto_511794 ) ) ( not ( = ?auto_511786 ?auto_511795 ) ) ( not ( = ?auto_511787 ?auto_511788 ) ) ( not ( = ?auto_511787 ?auto_511789 ) ) ( not ( = ?auto_511787 ?auto_511790 ) ) ( not ( = ?auto_511787 ?auto_511791 ) ) ( not ( = ?auto_511787 ?auto_511792 ) ) ( not ( = ?auto_511787 ?auto_511793 ) ) ( not ( = ?auto_511787 ?auto_511794 ) ) ( not ( = ?auto_511787 ?auto_511795 ) ) ( not ( = ?auto_511788 ?auto_511789 ) ) ( not ( = ?auto_511788 ?auto_511790 ) ) ( not ( = ?auto_511788 ?auto_511791 ) ) ( not ( = ?auto_511788 ?auto_511792 ) ) ( not ( = ?auto_511788 ?auto_511793 ) ) ( not ( = ?auto_511788 ?auto_511794 ) ) ( not ( = ?auto_511788 ?auto_511795 ) ) ( not ( = ?auto_511789 ?auto_511790 ) ) ( not ( = ?auto_511789 ?auto_511791 ) ) ( not ( = ?auto_511789 ?auto_511792 ) ) ( not ( = ?auto_511789 ?auto_511793 ) ) ( not ( = ?auto_511789 ?auto_511794 ) ) ( not ( = ?auto_511789 ?auto_511795 ) ) ( not ( = ?auto_511790 ?auto_511791 ) ) ( not ( = ?auto_511790 ?auto_511792 ) ) ( not ( = ?auto_511790 ?auto_511793 ) ) ( not ( = ?auto_511790 ?auto_511794 ) ) ( not ( = ?auto_511790 ?auto_511795 ) ) ( not ( = ?auto_511791 ?auto_511792 ) ) ( not ( = ?auto_511791 ?auto_511793 ) ) ( not ( = ?auto_511791 ?auto_511794 ) ) ( not ( = ?auto_511791 ?auto_511795 ) ) ( not ( = ?auto_511792 ?auto_511793 ) ) ( not ( = ?auto_511792 ?auto_511794 ) ) ( not ( = ?auto_511792 ?auto_511795 ) ) ( not ( = ?auto_511793 ?auto_511794 ) ) ( not ( = ?auto_511793 ?auto_511795 ) ) ( not ( = ?auto_511794 ?auto_511795 ) ) ( ON ?auto_511793 ?auto_511794 ) ( ON ?auto_511792 ?auto_511793 ) ( CLEAR ?auto_511790 ) ( ON ?auto_511791 ?auto_511792 ) ( CLEAR ?auto_511791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_511782 ?auto_511783 ?auto_511784 ?auto_511785 ?auto_511786 ?auto_511787 ?auto_511788 ?auto_511789 ?auto_511790 ?auto_511791 )
      ( MAKE-13PILE ?auto_511782 ?auto_511783 ?auto_511784 ?auto_511785 ?auto_511786 ?auto_511787 ?auto_511788 ?auto_511789 ?auto_511790 ?auto_511791 ?auto_511792 ?auto_511793 ?auto_511794 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511836 - BLOCK
      ?auto_511837 - BLOCK
      ?auto_511838 - BLOCK
      ?auto_511839 - BLOCK
      ?auto_511840 - BLOCK
      ?auto_511841 - BLOCK
      ?auto_511842 - BLOCK
      ?auto_511843 - BLOCK
      ?auto_511844 - BLOCK
      ?auto_511845 - BLOCK
      ?auto_511846 - BLOCK
      ?auto_511847 - BLOCK
      ?auto_511848 - BLOCK
    )
    :vars
    (
      ?auto_511849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511848 ?auto_511849 ) ( ON-TABLE ?auto_511836 ) ( ON ?auto_511837 ?auto_511836 ) ( ON ?auto_511838 ?auto_511837 ) ( ON ?auto_511839 ?auto_511838 ) ( ON ?auto_511840 ?auto_511839 ) ( ON ?auto_511841 ?auto_511840 ) ( ON ?auto_511842 ?auto_511841 ) ( ON ?auto_511843 ?auto_511842 ) ( not ( = ?auto_511836 ?auto_511837 ) ) ( not ( = ?auto_511836 ?auto_511838 ) ) ( not ( = ?auto_511836 ?auto_511839 ) ) ( not ( = ?auto_511836 ?auto_511840 ) ) ( not ( = ?auto_511836 ?auto_511841 ) ) ( not ( = ?auto_511836 ?auto_511842 ) ) ( not ( = ?auto_511836 ?auto_511843 ) ) ( not ( = ?auto_511836 ?auto_511844 ) ) ( not ( = ?auto_511836 ?auto_511845 ) ) ( not ( = ?auto_511836 ?auto_511846 ) ) ( not ( = ?auto_511836 ?auto_511847 ) ) ( not ( = ?auto_511836 ?auto_511848 ) ) ( not ( = ?auto_511836 ?auto_511849 ) ) ( not ( = ?auto_511837 ?auto_511838 ) ) ( not ( = ?auto_511837 ?auto_511839 ) ) ( not ( = ?auto_511837 ?auto_511840 ) ) ( not ( = ?auto_511837 ?auto_511841 ) ) ( not ( = ?auto_511837 ?auto_511842 ) ) ( not ( = ?auto_511837 ?auto_511843 ) ) ( not ( = ?auto_511837 ?auto_511844 ) ) ( not ( = ?auto_511837 ?auto_511845 ) ) ( not ( = ?auto_511837 ?auto_511846 ) ) ( not ( = ?auto_511837 ?auto_511847 ) ) ( not ( = ?auto_511837 ?auto_511848 ) ) ( not ( = ?auto_511837 ?auto_511849 ) ) ( not ( = ?auto_511838 ?auto_511839 ) ) ( not ( = ?auto_511838 ?auto_511840 ) ) ( not ( = ?auto_511838 ?auto_511841 ) ) ( not ( = ?auto_511838 ?auto_511842 ) ) ( not ( = ?auto_511838 ?auto_511843 ) ) ( not ( = ?auto_511838 ?auto_511844 ) ) ( not ( = ?auto_511838 ?auto_511845 ) ) ( not ( = ?auto_511838 ?auto_511846 ) ) ( not ( = ?auto_511838 ?auto_511847 ) ) ( not ( = ?auto_511838 ?auto_511848 ) ) ( not ( = ?auto_511838 ?auto_511849 ) ) ( not ( = ?auto_511839 ?auto_511840 ) ) ( not ( = ?auto_511839 ?auto_511841 ) ) ( not ( = ?auto_511839 ?auto_511842 ) ) ( not ( = ?auto_511839 ?auto_511843 ) ) ( not ( = ?auto_511839 ?auto_511844 ) ) ( not ( = ?auto_511839 ?auto_511845 ) ) ( not ( = ?auto_511839 ?auto_511846 ) ) ( not ( = ?auto_511839 ?auto_511847 ) ) ( not ( = ?auto_511839 ?auto_511848 ) ) ( not ( = ?auto_511839 ?auto_511849 ) ) ( not ( = ?auto_511840 ?auto_511841 ) ) ( not ( = ?auto_511840 ?auto_511842 ) ) ( not ( = ?auto_511840 ?auto_511843 ) ) ( not ( = ?auto_511840 ?auto_511844 ) ) ( not ( = ?auto_511840 ?auto_511845 ) ) ( not ( = ?auto_511840 ?auto_511846 ) ) ( not ( = ?auto_511840 ?auto_511847 ) ) ( not ( = ?auto_511840 ?auto_511848 ) ) ( not ( = ?auto_511840 ?auto_511849 ) ) ( not ( = ?auto_511841 ?auto_511842 ) ) ( not ( = ?auto_511841 ?auto_511843 ) ) ( not ( = ?auto_511841 ?auto_511844 ) ) ( not ( = ?auto_511841 ?auto_511845 ) ) ( not ( = ?auto_511841 ?auto_511846 ) ) ( not ( = ?auto_511841 ?auto_511847 ) ) ( not ( = ?auto_511841 ?auto_511848 ) ) ( not ( = ?auto_511841 ?auto_511849 ) ) ( not ( = ?auto_511842 ?auto_511843 ) ) ( not ( = ?auto_511842 ?auto_511844 ) ) ( not ( = ?auto_511842 ?auto_511845 ) ) ( not ( = ?auto_511842 ?auto_511846 ) ) ( not ( = ?auto_511842 ?auto_511847 ) ) ( not ( = ?auto_511842 ?auto_511848 ) ) ( not ( = ?auto_511842 ?auto_511849 ) ) ( not ( = ?auto_511843 ?auto_511844 ) ) ( not ( = ?auto_511843 ?auto_511845 ) ) ( not ( = ?auto_511843 ?auto_511846 ) ) ( not ( = ?auto_511843 ?auto_511847 ) ) ( not ( = ?auto_511843 ?auto_511848 ) ) ( not ( = ?auto_511843 ?auto_511849 ) ) ( not ( = ?auto_511844 ?auto_511845 ) ) ( not ( = ?auto_511844 ?auto_511846 ) ) ( not ( = ?auto_511844 ?auto_511847 ) ) ( not ( = ?auto_511844 ?auto_511848 ) ) ( not ( = ?auto_511844 ?auto_511849 ) ) ( not ( = ?auto_511845 ?auto_511846 ) ) ( not ( = ?auto_511845 ?auto_511847 ) ) ( not ( = ?auto_511845 ?auto_511848 ) ) ( not ( = ?auto_511845 ?auto_511849 ) ) ( not ( = ?auto_511846 ?auto_511847 ) ) ( not ( = ?auto_511846 ?auto_511848 ) ) ( not ( = ?auto_511846 ?auto_511849 ) ) ( not ( = ?auto_511847 ?auto_511848 ) ) ( not ( = ?auto_511847 ?auto_511849 ) ) ( not ( = ?auto_511848 ?auto_511849 ) ) ( ON ?auto_511847 ?auto_511848 ) ( ON ?auto_511846 ?auto_511847 ) ( ON ?auto_511845 ?auto_511846 ) ( CLEAR ?auto_511843 ) ( ON ?auto_511844 ?auto_511845 ) ( CLEAR ?auto_511844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_511836 ?auto_511837 ?auto_511838 ?auto_511839 ?auto_511840 ?auto_511841 ?auto_511842 ?auto_511843 ?auto_511844 )
      ( MAKE-13PILE ?auto_511836 ?auto_511837 ?auto_511838 ?auto_511839 ?auto_511840 ?auto_511841 ?auto_511842 ?auto_511843 ?auto_511844 ?auto_511845 ?auto_511846 ?auto_511847 ?auto_511848 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511890 - BLOCK
      ?auto_511891 - BLOCK
      ?auto_511892 - BLOCK
      ?auto_511893 - BLOCK
      ?auto_511894 - BLOCK
      ?auto_511895 - BLOCK
      ?auto_511896 - BLOCK
      ?auto_511897 - BLOCK
      ?auto_511898 - BLOCK
      ?auto_511899 - BLOCK
      ?auto_511900 - BLOCK
      ?auto_511901 - BLOCK
      ?auto_511902 - BLOCK
    )
    :vars
    (
      ?auto_511903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511902 ?auto_511903 ) ( ON-TABLE ?auto_511890 ) ( ON ?auto_511891 ?auto_511890 ) ( ON ?auto_511892 ?auto_511891 ) ( ON ?auto_511893 ?auto_511892 ) ( ON ?auto_511894 ?auto_511893 ) ( ON ?auto_511895 ?auto_511894 ) ( ON ?auto_511896 ?auto_511895 ) ( not ( = ?auto_511890 ?auto_511891 ) ) ( not ( = ?auto_511890 ?auto_511892 ) ) ( not ( = ?auto_511890 ?auto_511893 ) ) ( not ( = ?auto_511890 ?auto_511894 ) ) ( not ( = ?auto_511890 ?auto_511895 ) ) ( not ( = ?auto_511890 ?auto_511896 ) ) ( not ( = ?auto_511890 ?auto_511897 ) ) ( not ( = ?auto_511890 ?auto_511898 ) ) ( not ( = ?auto_511890 ?auto_511899 ) ) ( not ( = ?auto_511890 ?auto_511900 ) ) ( not ( = ?auto_511890 ?auto_511901 ) ) ( not ( = ?auto_511890 ?auto_511902 ) ) ( not ( = ?auto_511890 ?auto_511903 ) ) ( not ( = ?auto_511891 ?auto_511892 ) ) ( not ( = ?auto_511891 ?auto_511893 ) ) ( not ( = ?auto_511891 ?auto_511894 ) ) ( not ( = ?auto_511891 ?auto_511895 ) ) ( not ( = ?auto_511891 ?auto_511896 ) ) ( not ( = ?auto_511891 ?auto_511897 ) ) ( not ( = ?auto_511891 ?auto_511898 ) ) ( not ( = ?auto_511891 ?auto_511899 ) ) ( not ( = ?auto_511891 ?auto_511900 ) ) ( not ( = ?auto_511891 ?auto_511901 ) ) ( not ( = ?auto_511891 ?auto_511902 ) ) ( not ( = ?auto_511891 ?auto_511903 ) ) ( not ( = ?auto_511892 ?auto_511893 ) ) ( not ( = ?auto_511892 ?auto_511894 ) ) ( not ( = ?auto_511892 ?auto_511895 ) ) ( not ( = ?auto_511892 ?auto_511896 ) ) ( not ( = ?auto_511892 ?auto_511897 ) ) ( not ( = ?auto_511892 ?auto_511898 ) ) ( not ( = ?auto_511892 ?auto_511899 ) ) ( not ( = ?auto_511892 ?auto_511900 ) ) ( not ( = ?auto_511892 ?auto_511901 ) ) ( not ( = ?auto_511892 ?auto_511902 ) ) ( not ( = ?auto_511892 ?auto_511903 ) ) ( not ( = ?auto_511893 ?auto_511894 ) ) ( not ( = ?auto_511893 ?auto_511895 ) ) ( not ( = ?auto_511893 ?auto_511896 ) ) ( not ( = ?auto_511893 ?auto_511897 ) ) ( not ( = ?auto_511893 ?auto_511898 ) ) ( not ( = ?auto_511893 ?auto_511899 ) ) ( not ( = ?auto_511893 ?auto_511900 ) ) ( not ( = ?auto_511893 ?auto_511901 ) ) ( not ( = ?auto_511893 ?auto_511902 ) ) ( not ( = ?auto_511893 ?auto_511903 ) ) ( not ( = ?auto_511894 ?auto_511895 ) ) ( not ( = ?auto_511894 ?auto_511896 ) ) ( not ( = ?auto_511894 ?auto_511897 ) ) ( not ( = ?auto_511894 ?auto_511898 ) ) ( not ( = ?auto_511894 ?auto_511899 ) ) ( not ( = ?auto_511894 ?auto_511900 ) ) ( not ( = ?auto_511894 ?auto_511901 ) ) ( not ( = ?auto_511894 ?auto_511902 ) ) ( not ( = ?auto_511894 ?auto_511903 ) ) ( not ( = ?auto_511895 ?auto_511896 ) ) ( not ( = ?auto_511895 ?auto_511897 ) ) ( not ( = ?auto_511895 ?auto_511898 ) ) ( not ( = ?auto_511895 ?auto_511899 ) ) ( not ( = ?auto_511895 ?auto_511900 ) ) ( not ( = ?auto_511895 ?auto_511901 ) ) ( not ( = ?auto_511895 ?auto_511902 ) ) ( not ( = ?auto_511895 ?auto_511903 ) ) ( not ( = ?auto_511896 ?auto_511897 ) ) ( not ( = ?auto_511896 ?auto_511898 ) ) ( not ( = ?auto_511896 ?auto_511899 ) ) ( not ( = ?auto_511896 ?auto_511900 ) ) ( not ( = ?auto_511896 ?auto_511901 ) ) ( not ( = ?auto_511896 ?auto_511902 ) ) ( not ( = ?auto_511896 ?auto_511903 ) ) ( not ( = ?auto_511897 ?auto_511898 ) ) ( not ( = ?auto_511897 ?auto_511899 ) ) ( not ( = ?auto_511897 ?auto_511900 ) ) ( not ( = ?auto_511897 ?auto_511901 ) ) ( not ( = ?auto_511897 ?auto_511902 ) ) ( not ( = ?auto_511897 ?auto_511903 ) ) ( not ( = ?auto_511898 ?auto_511899 ) ) ( not ( = ?auto_511898 ?auto_511900 ) ) ( not ( = ?auto_511898 ?auto_511901 ) ) ( not ( = ?auto_511898 ?auto_511902 ) ) ( not ( = ?auto_511898 ?auto_511903 ) ) ( not ( = ?auto_511899 ?auto_511900 ) ) ( not ( = ?auto_511899 ?auto_511901 ) ) ( not ( = ?auto_511899 ?auto_511902 ) ) ( not ( = ?auto_511899 ?auto_511903 ) ) ( not ( = ?auto_511900 ?auto_511901 ) ) ( not ( = ?auto_511900 ?auto_511902 ) ) ( not ( = ?auto_511900 ?auto_511903 ) ) ( not ( = ?auto_511901 ?auto_511902 ) ) ( not ( = ?auto_511901 ?auto_511903 ) ) ( not ( = ?auto_511902 ?auto_511903 ) ) ( ON ?auto_511901 ?auto_511902 ) ( ON ?auto_511900 ?auto_511901 ) ( ON ?auto_511899 ?auto_511900 ) ( ON ?auto_511898 ?auto_511899 ) ( CLEAR ?auto_511896 ) ( ON ?auto_511897 ?auto_511898 ) ( CLEAR ?auto_511897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_511890 ?auto_511891 ?auto_511892 ?auto_511893 ?auto_511894 ?auto_511895 ?auto_511896 ?auto_511897 )
      ( MAKE-13PILE ?auto_511890 ?auto_511891 ?auto_511892 ?auto_511893 ?auto_511894 ?auto_511895 ?auto_511896 ?auto_511897 ?auto_511898 ?auto_511899 ?auto_511900 ?auto_511901 ?auto_511902 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511944 - BLOCK
      ?auto_511945 - BLOCK
      ?auto_511946 - BLOCK
      ?auto_511947 - BLOCK
      ?auto_511948 - BLOCK
      ?auto_511949 - BLOCK
      ?auto_511950 - BLOCK
      ?auto_511951 - BLOCK
      ?auto_511952 - BLOCK
      ?auto_511953 - BLOCK
      ?auto_511954 - BLOCK
      ?auto_511955 - BLOCK
      ?auto_511956 - BLOCK
    )
    :vars
    (
      ?auto_511957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_511956 ?auto_511957 ) ( ON-TABLE ?auto_511944 ) ( ON ?auto_511945 ?auto_511944 ) ( ON ?auto_511946 ?auto_511945 ) ( ON ?auto_511947 ?auto_511946 ) ( ON ?auto_511948 ?auto_511947 ) ( ON ?auto_511949 ?auto_511948 ) ( not ( = ?auto_511944 ?auto_511945 ) ) ( not ( = ?auto_511944 ?auto_511946 ) ) ( not ( = ?auto_511944 ?auto_511947 ) ) ( not ( = ?auto_511944 ?auto_511948 ) ) ( not ( = ?auto_511944 ?auto_511949 ) ) ( not ( = ?auto_511944 ?auto_511950 ) ) ( not ( = ?auto_511944 ?auto_511951 ) ) ( not ( = ?auto_511944 ?auto_511952 ) ) ( not ( = ?auto_511944 ?auto_511953 ) ) ( not ( = ?auto_511944 ?auto_511954 ) ) ( not ( = ?auto_511944 ?auto_511955 ) ) ( not ( = ?auto_511944 ?auto_511956 ) ) ( not ( = ?auto_511944 ?auto_511957 ) ) ( not ( = ?auto_511945 ?auto_511946 ) ) ( not ( = ?auto_511945 ?auto_511947 ) ) ( not ( = ?auto_511945 ?auto_511948 ) ) ( not ( = ?auto_511945 ?auto_511949 ) ) ( not ( = ?auto_511945 ?auto_511950 ) ) ( not ( = ?auto_511945 ?auto_511951 ) ) ( not ( = ?auto_511945 ?auto_511952 ) ) ( not ( = ?auto_511945 ?auto_511953 ) ) ( not ( = ?auto_511945 ?auto_511954 ) ) ( not ( = ?auto_511945 ?auto_511955 ) ) ( not ( = ?auto_511945 ?auto_511956 ) ) ( not ( = ?auto_511945 ?auto_511957 ) ) ( not ( = ?auto_511946 ?auto_511947 ) ) ( not ( = ?auto_511946 ?auto_511948 ) ) ( not ( = ?auto_511946 ?auto_511949 ) ) ( not ( = ?auto_511946 ?auto_511950 ) ) ( not ( = ?auto_511946 ?auto_511951 ) ) ( not ( = ?auto_511946 ?auto_511952 ) ) ( not ( = ?auto_511946 ?auto_511953 ) ) ( not ( = ?auto_511946 ?auto_511954 ) ) ( not ( = ?auto_511946 ?auto_511955 ) ) ( not ( = ?auto_511946 ?auto_511956 ) ) ( not ( = ?auto_511946 ?auto_511957 ) ) ( not ( = ?auto_511947 ?auto_511948 ) ) ( not ( = ?auto_511947 ?auto_511949 ) ) ( not ( = ?auto_511947 ?auto_511950 ) ) ( not ( = ?auto_511947 ?auto_511951 ) ) ( not ( = ?auto_511947 ?auto_511952 ) ) ( not ( = ?auto_511947 ?auto_511953 ) ) ( not ( = ?auto_511947 ?auto_511954 ) ) ( not ( = ?auto_511947 ?auto_511955 ) ) ( not ( = ?auto_511947 ?auto_511956 ) ) ( not ( = ?auto_511947 ?auto_511957 ) ) ( not ( = ?auto_511948 ?auto_511949 ) ) ( not ( = ?auto_511948 ?auto_511950 ) ) ( not ( = ?auto_511948 ?auto_511951 ) ) ( not ( = ?auto_511948 ?auto_511952 ) ) ( not ( = ?auto_511948 ?auto_511953 ) ) ( not ( = ?auto_511948 ?auto_511954 ) ) ( not ( = ?auto_511948 ?auto_511955 ) ) ( not ( = ?auto_511948 ?auto_511956 ) ) ( not ( = ?auto_511948 ?auto_511957 ) ) ( not ( = ?auto_511949 ?auto_511950 ) ) ( not ( = ?auto_511949 ?auto_511951 ) ) ( not ( = ?auto_511949 ?auto_511952 ) ) ( not ( = ?auto_511949 ?auto_511953 ) ) ( not ( = ?auto_511949 ?auto_511954 ) ) ( not ( = ?auto_511949 ?auto_511955 ) ) ( not ( = ?auto_511949 ?auto_511956 ) ) ( not ( = ?auto_511949 ?auto_511957 ) ) ( not ( = ?auto_511950 ?auto_511951 ) ) ( not ( = ?auto_511950 ?auto_511952 ) ) ( not ( = ?auto_511950 ?auto_511953 ) ) ( not ( = ?auto_511950 ?auto_511954 ) ) ( not ( = ?auto_511950 ?auto_511955 ) ) ( not ( = ?auto_511950 ?auto_511956 ) ) ( not ( = ?auto_511950 ?auto_511957 ) ) ( not ( = ?auto_511951 ?auto_511952 ) ) ( not ( = ?auto_511951 ?auto_511953 ) ) ( not ( = ?auto_511951 ?auto_511954 ) ) ( not ( = ?auto_511951 ?auto_511955 ) ) ( not ( = ?auto_511951 ?auto_511956 ) ) ( not ( = ?auto_511951 ?auto_511957 ) ) ( not ( = ?auto_511952 ?auto_511953 ) ) ( not ( = ?auto_511952 ?auto_511954 ) ) ( not ( = ?auto_511952 ?auto_511955 ) ) ( not ( = ?auto_511952 ?auto_511956 ) ) ( not ( = ?auto_511952 ?auto_511957 ) ) ( not ( = ?auto_511953 ?auto_511954 ) ) ( not ( = ?auto_511953 ?auto_511955 ) ) ( not ( = ?auto_511953 ?auto_511956 ) ) ( not ( = ?auto_511953 ?auto_511957 ) ) ( not ( = ?auto_511954 ?auto_511955 ) ) ( not ( = ?auto_511954 ?auto_511956 ) ) ( not ( = ?auto_511954 ?auto_511957 ) ) ( not ( = ?auto_511955 ?auto_511956 ) ) ( not ( = ?auto_511955 ?auto_511957 ) ) ( not ( = ?auto_511956 ?auto_511957 ) ) ( ON ?auto_511955 ?auto_511956 ) ( ON ?auto_511954 ?auto_511955 ) ( ON ?auto_511953 ?auto_511954 ) ( ON ?auto_511952 ?auto_511953 ) ( ON ?auto_511951 ?auto_511952 ) ( CLEAR ?auto_511949 ) ( ON ?auto_511950 ?auto_511951 ) ( CLEAR ?auto_511950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_511944 ?auto_511945 ?auto_511946 ?auto_511947 ?auto_511948 ?auto_511949 ?auto_511950 )
      ( MAKE-13PILE ?auto_511944 ?auto_511945 ?auto_511946 ?auto_511947 ?auto_511948 ?auto_511949 ?auto_511950 ?auto_511951 ?auto_511952 ?auto_511953 ?auto_511954 ?auto_511955 ?auto_511956 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_511998 - BLOCK
      ?auto_511999 - BLOCK
      ?auto_512000 - BLOCK
      ?auto_512001 - BLOCK
      ?auto_512002 - BLOCK
      ?auto_512003 - BLOCK
      ?auto_512004 - BLOCK
      ?auto_512005 - BLOCK
      ?auto_512006 - BLOCK
      ?auto_512007 - BLOCK
      ?auto_512008 - BLOCK
      ?auto_512009 - BLOCK
      ?auto_512010 - BLOCK
    )
    :vars
    (
      ?auto_512011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512010 ?auto_512011 ) ( ON-TABLE ?auto_511998 ) ( ON ?auto_511999 ?auto_511998 ) ( ON ?auto_512000 ?auto_511999 ) ( ON ?auto_512001 ?auto_512000 ) ( ON ?auto_512002 ?auto_512001 ) ( not ( = ?auto_511998 ?auto_511999 ) ) ( not ( = ?auto_511998 ?auto_512000 ) ) ( not ( = ?auto_511998 ?auto_512001 ) ) ( not ( = ?auto_511998 ?auto_512002 ) ) ( not ( = ?auto_511998 ?auto_512003 ) ) ( not ( = ?auto_511998 ?auto_512004 ) ) ( not ( = ?auto_511998 ?auto_512005 ) ) ( not ( = ?auto_511998 ?auto_512006 ) ) ( not ( = ?auto_511998 ?auto_512007 ) ) ( not ( = ?auto_511998 ?auto_512008 ) ) ( not ( = ?auto_511998 ?auto_512009 ) ) ( not ( = ?auto_511998 ?auto_512010 ) ) ( not ( = ?auto_511998 ?auto_512011 ) ) ( not ( = ?auto_511999 ?auto_512000 ) ) ( not ( = ?auto_511999 ?auto_512001 ) ) ( not ( = ?auto_511999 ?auto_512002 ) ) ( not ( = ?auto_511999 ?auto_512003 ) ) ( not ( = ?auto_511999 ?auto_512004 ) ) ( not ( = ?auto_511999 ?auto_512005 ) ) ( not ( = ?auto_511999 ?auto_512006 ) ) ( not ( = ?auto_511999 ?auto_512007 ) ) ( not ( = ?auto_511999 ?auto_512008 ) ) ( not ( = ?auto_511999 ?auto_512009 ) ) ( not ( = ?auto_511999 ?auto_512010 ) ) ( not ( = ?auto_511999 ?auto_512011 ) ) ( not ( = ?auto_512000 ?auto_512001 ) ) ( not ( = ?auto_512000 ?auto_512002 ) ) ( not ( = ?auto_512000 ?auto_512003 ) ) ( not ( = ?auto_512000 ?auto_512004 ) ) ( not ( = ?auto_512000 ?auto_512005 ) ) ( not ( = ?auto_512000 ?auto_512006 ) ) ( not ( = ?auto_512000 ?auto_512007 ) ) ( not ( = ?auto_512000 ?auto_512008 ) ) ( not ( = ?auto_512000 ?auto_512009 ) ) ( not ( = ?auto_512000 ?auto_512010 ) ) ( not ( = ?auto_512000 ?auto_512011 ) ) ( not ( = ?auto_512001 ?auto_512002 ) ) ( not ( = ?auto_512001 ?auto_512003 ) ) ( not ( = ?auto_512001 ?auto_512004 ) ) ( not ( = ?auto_512001 ?auto_512005 ) ) ( not ( = ?auto_512001 ?auto_512006 ) ) ( not ( = ?auto_512001 ?auto_512007 ) ) ( not ( = ?auto_512001 ?auto_512008 ) ) ( not ( = ?auto_512001 ?auto_512009 ) ) ( not ( = ?auto_512001 ?auto_512010 ) ) ( not ( = ?auto_512001 ?auto_512011 ) ) ( not ( = ?auto_512002 ?auto_512003 ) ) ( not ( = ?auto_512002 ?auto_512004 ) ) ( not ( = ?auto_512002 ?auto_512005 ) ) ( not ( = ?auto_512002 ?auto_512006 ) ) ( not ( = ?auto_512002 ?auto_512007 ) ) ( not ( = ?auto_512002 ?auto_512008 ) ) ( not ( = ?auto_512002 ?auto_512009 ) ) ( not ( = ?auto_512002 ?auto_512010 ) ) ( not ( = ?auto_512002 ?auto_512011 ) ) ( not ( = ?auto_512003 ?auto_512004 ) ) ( not ( = ?auto_512003 ?auto_512005 ) ) ( not ( = ?auto_512003 ?auto_512006 ) ) ( not ( = ?auto_512003 ?auto_512007 ) ) ( not ( = ?auto_512003 ?auto_512008 ) ) ( not ( = ?auto_512003 ?auto_512009 ) ) ( not ( = ?auto_512003 ?auto_512010 ) ) ( not ( = ?auto_512003 ?auto_512011 ) ) ( not ( = ?auto_512004 ?auto_512005 ) ) ( not ( = ?auto_512004 ?auto_512006 ) ) ( not ( = ?auto_512004 ?auto_512007 ) ) ( not ( = ?auto_512004 ?auto_512008 ) ) ( not ( = ?auto_512004 ?auto_512009 ) ) ( not ( = ?auto_512004 ?auto_512010 ) ) ( not ( = ?auto_512004 ?auto_512011 ) ) ( not ( = ?auto_512005 ?auto_512006 ) ) ( not ( = ?auto_512005 ?auto_512007 ) ) ( not ( = ?auto_512005 ?auto_512008 ) ) ( not ( = ?auto_512005 ?auto_512009 ) ) ( not ( = ?auto_512005 ?auto_512010 ) ) ( not ( = ?auto_512005 ?auto_512011 ) ) ( not ( = ?auto_512006 ?auto_512007 ) ) ( not ( = ?auto_512006 ?auto_512008 ) ) ( not ( = ?auto_512006 ?auto_512009 ) ) ( not ( = ?auto_512006 ?auto_512010 ) ) ( not ( = ?auto_512006 ?auto_512011 ) ) ( not ( = ?auto_512007 ?auto_512008 ) ) ( not ( = ?auto_512007 ?auto_512009 ) ) ( not ( = ?auto_512007 ?auto_512010 ) ) ( not ( = ?auto_512007 ?auto_512011 ) ) ( not ( = ?auto_512008 ?auto_512009 ) ) ( not ( = ?auto_512008 ?auto_512010 ) ) ( not ( = ?auto_512008 ?auto_512011 ) ) ( not ( = ?auto_512009 ?auto_512010 ) ) ( not ( = ?auto_512009 ?auto_512011 ) ) ( not ( = ?auto_512010 ?auto_512011 ) ) ( ON ?auto_512009 ?auto_512010 ) ( ON ?auto_512008 ?auto_512009 ) ( ON ?auto_512007 ?auto_512008 ) ( ON ?auto_512006 ?auto_512007 ) ( ON ?auto_512005 ?auto_512006 ) ( ON ?auto_512004 ?auto_512005 ) ( CLEAR ?auto_512002 ) ( ON ?auto_512003 ?auto_512004 ) ( CLEAR ?auto_512003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_511998 ?auto_511999 ?auto_512000 ?auto_512001 ?auto_512002 ?auto_512003 )
      ( MAKE-13PILE ?auto_511998 ?auto_511999 ?auto_512000 ?auto_512001 ?auto_512002 ?auto_512003 ?auto_512004 ?auto_512005 ?auto_512006 ?auto_512007 ?auto_512008 ?auto_512009 ?auto_512010 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_512052 - BLOCK
      ?auto_512053 - BLOCK
      ?auto_512054 - BLOCK
      ?auto_512055 - BLOCK
      ?auto_512056 - BLOCK
      ?auto_512057 - BLOCK
      ?auto_512058 - BLOCK
      ?auto_512059 - BLOCK
      ?auto_512060 - BLOCK
      ?auto_512061 - BLOCK
      ?auto_512062 - BLOCK
      ?auto_512063 - BLOCK
      ?auto_512064 - BLOCK
    )
    :vars
    (
      ?auto_512065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512064 ?auto_512065 ) ( ON-TABLE ?auto_512052 ) ( ON ?auto_512053 ?auto_512052 ) ( ON ?auto_512054 ?auto_512053 ) ( ON ?auto_512055 ?auto_512054 ) ( not ( = ?auto_512052 ?auto_512053 ) ) ( not ( = ?auto_512052 ?auto_512054 ) ) ( not ( = ?auto_512052 ?auto_512055 ) ) ( not ( = ?auto_512052 ?auto_512056 ) ) ( not ( = ?auto_512052 ?auto_512057 ) ) ( not ( = ?auto_512052 ?auto_512058 ) ) ( not ( = ?auto_512052 ?auto_512059 ) ) ( not ( = ?auto_512052 ?auto_512060 ) ) ( not ( = ?auto_512052 ?auto_512061 ) ) ( not ( = ?auto_512052 ?auto_512062 ) ) ( not ( = ?auto_512052 ?auto_512063 ) ) ( not ( = ?auto_512052 ?auto_512064 ) ) ( not ( = ?auto_512052 ?auto_512065 ) ) ( not ( = ?auto_512053 ?auto_512054 ) ) ( not ( = ?auto_512053 ?auto_512055 ) ) ( not ( = ?auto_512053 ?auto_512056 ) ) ( not ( = ?auto_512053 ?auto_512057 ) ) ( not ( = ?auto_512053 ?auto_512058 ) ) ( not ( = ?auto_512053 ?auto_512059 ) ) ( not ( = ?auto_512053 ?auto_512060 ) ) ( not ( = ?auto_512053 ?auto_512061 ) ) ( not ( = ?auto_512053 ?auto_512062 ) ) ( not ( = ?auto_512053 ?auto_512063 ) ) ( not ( = ?auto_512053 ?auto_512064 ) ) ( not ( = ?auto_512053 ?auto_512065 ) ) ( not ( = ?auto_512054 ?auto_512055 ) ) ( not ( = ?auto_512054 ?auto_512056 ) ) ( not ( = ?auto_512054 ?auto_512057 ) ) ( not ( = ?auto_512054 ?auto_512058 ) ) ( not ( = ?auto_512054 ?auto_512059 ) ) ( not ( = ?auto_512054 ?auto_512060 ) ) ( not ( = ?auto_512054 ?auto_512061 ) ) ( not ( = ?auto_512054 ?auto_512062 ) ) ( not ( = ?auto_512054 ?auto_512063 ) ) ( not ( = ?auto_512054 ?auto_512064 ) ) ( not ( = ?auto_512054 ?auto_512065 ) ) ( not ( = ?auto_512055 ?auto_512056 ) ) ( not ( = ?auto_512055 ?auto_512057 ) ) ( not ( = ?auto_512055 ?auto_512058 ) ) ( not ( = ?auto_512055 ?auto_512059 ) ) ( not ( = ?auto_512055 ?auto_512060 ) ) ( not ( = ?auto_512055 ?auto_512061 ) ) ( not ( = ?auto_512055 ?auto_512062 ) ) ( not ( = ?auto_512055 ?auto_512063 ) ) ( not ( = ?auto_512055 ?auto_512064 ) ) ( not ( = ?auto_512055 ?auto_512065 ) ) ( not ( = ?auto_512056 ?auto_512057 ) ) ( not ( = ?auto_512056 ?auto_512058 ) ) ( not ( = ?auto_512056 ?auto_512059 ) ) ( not ( = ?auto_512056 ?auto_512060 ) ) ( not ( = ?auto_512056 ?auto_512061 ) ) ( not ( = ?auto_512056 ?auto_512062 ) ) ( not ( = ?auto_512056 ?auto_512063 ) ) ( not ( = ?auto_512056 ?auto_512064 ) ) ( not ( = ?auto_512056 ?auto_512065 ) ) ( not ( = ?auto_512057 ?auto_512058 ) ) ( not ( = ?auto_512057 ?auto_512059 ) ) ( not ( = ?auto_512057 ?auto_512060 ) ) ( not ( = ?auto_512057 ?auto_512061 ) ) ( not ( = ?auto_512057 ?auto_512062 ) ) ( not ( = ?auto_512057 ?auto_512063 ) ) ( not ( = ?auto_512057 ?auto_512064 ) ) ( not ( = ?auto_512057 ?auto_512065 ) ) ( not ( = ?auto_512058 ?auto_512059 ) ) ( not ( = ?auto_512058 ?auto_512060 ) ) ( not ( = ?auto_512058 ?auto_512061 ) ) ( not ( = ?auto_512058 ?auto_512062 ) ) ( not ( = ?auto_512058 ?auto_512063 ) ) ( not ( = ?auto_512058 ?auto_512064 ) ) ( not ( = ?auto_512058 ?auto_512065 ) ) ( not ( = ?auto_512059 ?auto_512060 ) ) ( not ( = ?auto_512059 ?auto_512061 ) ) ( not ( = ?auto_512059 ?auto_512062 ) ) ( not ( = ?auto_512059 ?auto_512063 ) ) ( not ( = ?auto_512059 ?auto_512064 ) ) ( not ( = ?auto_512059 ?auto_512065 ) ) ( not ( = ?auto_512060 ?auto_512061 ) ) ( not ( = ?auto_512060 ?auto_512062 ) ) ( not ( = ?auto_512060 ?auto_512063 ) ) ( not ( = ?auto_512060 ?auto_512064 ) ) ( not ( = ?auto_512060 ?auto_512065 ) ) ( not ( = ?auto_512061 ?auto_512062 ) ) ( not ( = ?auto_512061 ?auto_512063 ) ) ( not ( = ?auto_512061 ?auto_512064 ) ) ( not ( = ?auto_512061 ?auto_512065 ) ) ( not ( = ?auto_512062 ?auto_512063 ) ) ( not ( = ?auto_512062 ?auto_512064 ) ) ( not ( = ?auto_512062 ?auto_512065 ) ) ( not ( = ?auto_512063 ?auto_512064 ) ) ( not ( = ?auto_512063 ?auto_512065 ) ) ( not ( = ?auto_512064 ?auto_512065 ) ) ( ON ?auto_512063 ?auto_512064 ) ( ON ?auto_512062 ?auto_512063 ) ( ON ?auto_512061 ?auto_512062 ) ( ON ?auto_512060 ?auto_512061 ) ( ON ?auto_512059 ?auto_512060 ) ( ON ?auto_512058 ?auto_512059 ) ( ON ?auto_512057 ?auto_512058 ) ( CLEAR ?auto_512055 ) ( ON ?auto_512056 ?auto_512057 ) ( CLEAR ?auto_512056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_512052 ?auto_512053 ?auto_512054 ?auto_512055 ?auto_512056 )
      ( MAKE-13PILE ?auto_512052 ?auto_512053 ?auto_512054 ?auto_512055 ?auto_512056 ?auto_512057 ?auto_512058 ?auto_512059 ?auto_512060 ?auto_512061 ?auto_512062 ?auto_512063 ?auto_512064 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_512106 - BLOCK
      ?auto_512107 - BLOCK
      ?auto_512108 - BLOCK
      ?auto_512109 - BLOCK
      ?auto_512110 - BLOCK
      ?auto_512111 - BLOCK
      ?auto_512112 - BLOCK
      ?auto_512113 - BLOCK
      ?auto_512114 - BLOCK
      ?auto_512115 - BLOCK
      ?auto_512116 - BLOCK
      ?auto_512117 - BLOCK
      ?auto_512118 - BLOCK
    )
    :vars
    (
      ?auto_512119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512118 ?auto_512119 ) ( ON-TABLE ?auto_512106 ) ( ON ?auto_512107 ?auto_512106 ) ( ON ?auto_512108 ?auto_512107 ) ( not ( = ?auto_512106 ?auto_512107 ) ) ( not ( = ?auto_512106 ?auto_512108 ) ) ( not ( = ?auto_512106 ?auto_512109 ) ) ( not ( = ?auto_512106 ?auto_512110 ) ) ( not ( = ?auto_512106 ?auto_512111 ) ) ( not ( = ?auto_512106 ?auto_512112 ) ) ( not ( = ?auto_512106 ?auto_512113 ) ) ( not ( = ?auto_512106 ?auto_512114 ) ) ( not ( = ?auto_512106 ?auto_512115 ) ) ( not ( = ?auto_512106 ?auto_512116 ) ) ( not ( = ?auto_512106 ?auto_512117 ) ) ( not ( = ?auto_512106 ?auto_512118 ) ) ( not ( = ?auto_512106 ?auto_512119 ) ) ( not ( = ?auto_512107 ?auto_512108 ) ) ( not ( = ?auto_512107 ?auto_512109 ) ) ( not ( = ?auto_512107 ?auto_512110 ) ) ( not ( = ?auto_512107 ?auto_512111 ) ) ( not ( = ?auto_512107 ?auto_512112 ) ) ( not ( = ?auto_512107 ?auto_512113 ) ) ( not ( = ?auto_512107 ?auto_512114 ) ) ( not ( = ?auto_512107 ?auto_512115 ) ) ( not ( = ?auto_512107 ?auto_512116 ) ) ( not ( = ?auto_512107 ?auto_512117 ) ) ( not ( = ?auto_512107 ?auto_512118 ) ) ( not ( = ?auto_512107 ?auto_512119 ) ) ( not ( = ?auto_512108 ?auto_512109 ) ) ( not ( = ?auto_512108 ?auto_512110 ) ) ( not ( = ?auto_512108 ?auto_512111 ) ) ( not ( = ?auto_512108 ?auto_512112 ) ) ( not ( = ?auto_512108 ?auto_512113 ) ) ( not ( = ?auto_512108 ?auto_512114 ) ) ( not ( = ?auto_512108 ?auto_512115 ) ) ( not ( = ?auto_512108 ?auto_512116 ) ) ( not ( = ?auto_512108 ?auto_512117 ) ) ( not ( = ?auto_512108 ?auto_512118 ) ) ( not ( = ?auto_512108 ?auto_512119 ) ) ( not ( = ?auto_512109 ?auto_512110 ) ) ( not ( = ?auto_512109 ?auto_512111 ) ) ( not ( = ?auto_512109 ?auto_512112 ) ) ( not ( = ?auto_512109 ?auto_512113 ) ) ( not ( = ?auto_512109 ?auto_512114 ) ) ( not ( = ?auto_512109 ?auto_512115 ) ) ( not ( = ?auto_512109 ?auto_512116 ) ) ( not ( = ?auto_512109 ?auto_512117 ) ) ( not ( = ?auto_512109 ?auto_512118 ) ) ( not ( = ?auto_512109 ?auto_512119 ) ) ( not ( = ?auto_512110 ?auto_512111 ) ) ( not ( = ?auto_512110 ?auto_512112 ) ) ( not ( = ?auto_512110 ?auto_512113 ) ) ( not ( = ?auto_512110 ?auto_512114 ) ) ( not ( = ?auto_512110 ?auto_512115 ) ) ( not ( = ?auto_512110 ?auto_512116 ) ) ( not ( = ?auto_512110 ?auto_512117 ) ) ( not ( = ?auto_512110 ?auto_512118 ) ) ( not ( = ?auto_512110 ?auto_512119 ) ) ( not ( = ?auto_512111 ?auto_512112 ) ) ( not ( = ?auto_512111 ?auto_512113 ) ) ( not ( = ?auto_512111 ?auto_512114 ) ) ( not ( = ?auto_512111 ?auto_512115 ) ) ( not ( = ?auto_512111 ?auto_512116 ) ) ( not ( = ?auto_512111 ?auto_512117 ) ) ( not ( = ?auto_512111 ?auto_512118 ) ) ( not ( = ?auto_512111 ?auto_512119 ) ) ( not ( = ?auto_512112 ?auto_512113 ) ) ( not ( = ?auto_512112 ?auto_512114 ) ) ( not ( = ?auto_512112 ?auto_512115 ) ) ( not ( = ?auto_512112 ?auto_512116 ) ) ( not ( = ?auto_512112 ?auto_512117 ) ) ( not ( = ?auto_512112 ?auto_512118 ) ) ( not ( = ?auto_512112 ?auto_512119 ) ) ( not ( = ?auto_512113 ?auto_512114 ) ) ( not ( = ?auto_512113 ?auto_512115 ) ) ( not ( = ?auto_512113 ?auto_512116 ) ) ( not ( = ?auto_512113 ?auto_512117 ) ) ( not ( = ?auto_512113 ?auto_512118 ) ) ( not ( = ?auto_512113 ?auto_512119 ) ) ( not ( = ?auto_512114 ?auto_512115 ) ) ( not ( = ?auto_512114 ?auto_512116 ) ) ( not ( = ?auto_512114 ?auto_512117 ) ) ( not ( = ?auto_512114 ?auto_512118 ) ) ( not ( = ?auto_512114 ?auto_512119 ) ) ( not ( = ?auto_512115 ?auto_512116 ) ) ( not ( = ?auto_512115 ?auto_512117 ) ) ( not ( = ?auto_512115 ?auto_512118 ) ) ( not ( = ?auto_512115 ?auto_512119 ) ) ( not ( = ?auto_512116 ?auto_512117 ) ) ( not ( = ?auto_512116 ?auto_512118 ) ) ( not ( = ?auto_512116 ?auto_512119 ) ) ( not ( = ?auto_512117 ?auto_512118 ) ) ( not ( = ?auto_512117 ?auto_512119 ) ) ( not ( = ?auto_512118 ?auto_512119 ) ) ( ON ?auto_512117 ?auto_512118 ) ( ON ?auto_512116 ?auto_512117 ) ( ON ?auto_512115 ?auto_512116 ) ( ON ?auto_512114 ?auto_512115 ) ( ON ?auto_512113 ?auto_512114 ) ( ON ?auto_512112 ?auto_512113 ) ( ON ?auto_512111 ?auto_512112 ) ( ON ?auto_512110 ?auto_512111 ) ( CLEAR ?auto_512108 ) ( ON ?auto_512109 ?auto_512110 ) ( CLEAR ?auto_512109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_512106 ?auto_512107 ?auto_512108 ?auto_512109 )
      ( MAKE-13PILE ?auto_512106 ?auto_512107 ?auto_512108 ?auto_512109 ?auto_512110 ?auto_512111 ?auto_512112 ?auto_512113 ?auto_512114 ?auto_512115 ?auto_512116 ?auto_512117 ?auto_512118 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_512160 - BLOCK
      ?auto_512161 - BLOCK
      ?auto_512162 - BLOCK
      ?auto_512163 - BLOCK
      ?auto_512164 - BLOCK
      ?auto_512165 - BLOCK
      ?auto_512166 - BLOCK
      ?auto_512167 - BLOCK
      ?auto_512168 - BLOCK
      ?auto_512169 - BLOCK
      ?auto_512170 - BLOCK
      ?auto_512171 - BLOCK
      ?auto_512172 - BLOCK
    )
    :vars
    (
      ?auto_512173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512172 ?auto_512173 ) ( ON-TABLE ?auto_512160 ) ( ON ?auto_512161 ?auto_512160 ) ( not ( = ?auto_512160 ?auto_512161 ) ) ( not ( = ?auto_512160 ?auto_512162 ) ) ( not ( = ?auto_512160 ?auto_512163 ) ) ( not ( = ?auto_512160 ?auto_512164 ) ) ( not ( = ?auto_512160 ?auto_512165 ) ) ( not ( = ?auto_512160 ?auto_512166 ) ) ( not ( = ?auto_512160 ?auto_512167 ) ) ( not ( = ?auto_512160 ?auto_512168 ) ) ( not ( = ?auto_512160 ?auto_512169 ) ) ( not ( = ?auto_512160 ?auto_512170 ) ) ( not ( = ?auto_512160 ?auto_512171 ) ) ( not ( = ?auto_512160 ?auto_512172 ) ) ( not ( = ?auto_512160 ?auto_512173 ) ) ( not ( = ?auto_512161 ?auto_512162 ) ) ( not ( = ?auto_512161 ?auto_512163 ) ) ( not ( = ?auto_512161 ?auto_512164 ) ) ( not ( = ?auto_512161 ?auto_512165 ) ) ( not ( = ?auto_512161 ?auto_512166 ) ) ( not ( = ?auto_512161 ?auto_512167 ) ) ( not ( = ?auto_512161 ?auto_512168 ) ) ( not ( = ?auto_512161 ?auto_512169 ) ) ( not ( = ?auto_512161 ?auto_512170 ) ) ( not ( = ?auto_512161 ?auto_512171 ) ) ( not ( = ?auto_512161 ?auto_512172 ) ) ( not ( = ?auto_512161 ?auto_512173 ) ) ( not ( = ?auto_512162 ?auto_512163 ) ) ( not ( = ?auto_512162 ?auto_512164 ) ) ( not ( = ?auto_512162 ?auto_512165 ) ) ( not ( = ?auto_512162 ?auto_512166 ) ) ( not ( = ?auto_512162 ?auto_512167 ) ) ( not ( = ?auto_512162 ?auto_512168 ) ) ( not ( = ?auto_512162 ?auto_512169 ) ) ( not ( = ?auto_512162 ?auto_512170 ) ) ( not ( = ?auto_512162 ?auto_512171 ) ) ( not ( = ?auto_512162 ?auto_512172 ) ) ( not ( = ?auto_512162 ?auto_512173 ) ) ( not ( = ?auto_512163 ?auto_512164 ) ) ( not ( = ?auto_512163 ?auto_512165 ) ) ( not ( = ?auto_512163 ?auto_512166 ) ) ( not ( = ?auto_512163 ?auto_512167 ) ) ( not ( = ?auto_512163 ?auto_512168 ) ) ( not ( = ?auto_512163 ?auto_512169 ) ) ( not ( = ?auto_512163 ?auto_512170 ) ) ( not ( = ?auto_512163 ?auto_512171 ) ) ( not ( = ?auto_512163 ?auto_512172 ) ) ( not ( = ?auto_512163 ?auto_512173 ) ) ( not ( = ?auto_512164 ?auto_512165 ) ) ( not ( = ?auto_512164 ?auto_512166 ) ) ( not ( = ?auto_512164 ?auto_512167 ) ) ( not ( = ?auto_512164 ?auto_512168 ) ) ( not ( = ?auto_512164 ?auto_512169 ) ) ( not ( = ?auto_512164 ?auto_512170 ) ) ( not ( = ?auto_512164 ?auto_512171 ) ) ( not ( = ?auto_512164 ?auto_512172 ) ) ( not ( = ?auto_512164 ?auto_512173 ) ) ( not ( = ?auto_512165 ?auto_512166 ) ) ( not ( = ?auto_512165 ?auto_512167 ) ) ( not ( = ?auto_512165 ?auto_512168 ) ) ( not ( = ?auto_512165 ?auto_512169 ) ) ( not ( = ?auto_512165 ?auto_512170 ) ) ( not ( = ?auto_512165 ?auto_512171 ) ) ( not ( = ?auto_512165 ?auto_512172 ) ) ( not ( = ?auto_512165 ?auto_512173 ) ) ( not ( = ?auto_512166 ?auto_512167 ) ) ( not ( = ?auto_512166 ?auto_512168 ) ) ( not ( = ?auto_512166 ?auto_512169 ) ) ( not ( = ?auto_512166 ?auto_512170 ) ) ( not ( = ?auto_512166 ?auto_512171 ) ) ( not ( = ?auto_512166 ?auto_512172 ) ) ( not ( = ?auto_512166 ?auto_512173 ) ) ( not ( = ?auto_512167 ?auto_512168 ) ) ( not ( = ?auto_512167 ?auto_512169 ) ) ( not ( = ?auto_512167 ?auto_512170 ) ) ( not ( = ?auto_512167 ?auto_512171 ) ) ( not ( = ?auto_512167 ?auto_512172 ) ) ( not ( = ?auto_512167 ?auto_512173 ) ) ( not ( = ?auto_512168 ?auto_512169 ) ) ( not ( = ?auto_512168 ?auto_512170 ) ) ( not ( = ?auto_512168 ?auto_512171 ) ) ( not ( = ?auto_512168 ?auto_512172 ) ) ( not ( = ?auto_512168 ?auto_512173 ) ) ( not ( = ?auto_512169 ?auto_512170 ) ) ( not ( = ?auto_512169 ?auto_512171 ) ) ( not ( = ?auto_512169 ?auto_512172 ) ) ( not ( = ?auto_512169 ?auto_512173 ) ) ( not ( = ?auto_512170 ?auto_512171 ) ) ( not ( = ?auto_512170 ?auto_512172 ) ) ( not ( = ?auto_512170 ?auto_512173 ) ) ( not ( = ?auto_512171 ?auto_512172 ) ) ( not ( = ?auto_512171 ?auto_512173 ) ) ( not ( = ?auto_512172 ?auto_512173 ) ) ( ON ?auto_512171 ?auto_512172 ) ( ON ?auto_512170 ?auto_512171 ) ( ON ?auto_512169 ?auto_512170 ) ( ON ?auto_512168 ?auto_512169 ) ( ON ?auto_512167 ?auto_512168 ) ( ON ?auto_512166 ?auto_512167 ) ( ON ?auto_512165 ?auto_512166 ) ( ON ?auto_512164 ?auto_512165 ) ( ON ?auto_512163 ?auto_512164 ) ( CLEAR ?auto_512161 ) ( ON ?auto_512162 ?auto_512163 ) ( CLEAR ?auto_512162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_512160 ?auto_512161 ?auto_512162 )
      ( MAKE-13PILE ?auto_512160 ?auto_512161 ?auto_512162 ?auto_512163 ?auto_512164 ?auto_512165 ?auto_512166 ?auto_512167 ?auto_512168 ?auto_512169 ?auto_512170 ?auto_512171 ?auto_512172 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_512214 - BLOCK
      ?auto_512215 - BLOCK
      ?auto_512216 - BLOCK
      ?auto_512217 - BLOCK
      ?auto_512218 - BLOCK
      ?auto_512219 - BLOCK
      ?auto_512220 - BLOCK
      ?auto_512221 - BLOCK
      ?auto_512222 - BLOCK
      ?auto_512223 - BLOCK
      ?auto_512224 - BLOCK
      ?auto_512225 - BLOCK
      ?auto_512226 - BLOCK
    )
    :vars
    (
      ?auto_512227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512226 ?auto_512227 ) ( ON-TABLE ?auto_512214 ) ( not ( = ?auto_512214 ?auto_512215 ) ) ( not ( = ?auto_512214 ?auto_512216 ) ) ( not ( = ?auto_512214 ?auto_512217 ) ) ( not ( = ?auto_512214 ?auto_512218 ) ) ( not ( = ?auto_512214 ?auto_512219 ) ) ( not ( = ?auto_512214 ?auto_512220 ) ) ( not ( = ?auto_512214 ?auto_512221 ) ) ( not ( = ?auto_512214 ?auto_512222 ) ) ( not ( = ?auto_512214 ?auto_512223 ) ) ( not ( = ?auto_512214 ?auto_512224 ) ) ( not ( = ?auto_512214 ?auto_512225 ) ) ( not ( = ?auto_512214 ?auto_512226 ) ) ( not ( = ?auto_512214 ?auto_512227 ) ) ( not ( = ?auto_512215 ?auto_512216 ) ) ( not ( = ?auto_512215 ?auto_512217 ) ) ( not ( = ?auto_512215 ?auto_512218 ) ) ( not ( = ?auto_512215 ?auto_512219 ) ) ( not ( = ?auto_512215 ?auto_512220 ) ) ( not ( = ?auto_512215 ?auto_512221 ) ) ( not ( = ?auto_512215 ?auto_512222 ) ) ( not ( = ?auto_512215 ?auto_512223 ) ) ( not ( = ?auto_512215 ?auto_512224 ) ) ( not ( = ?auto_512215 ?auto_512225 ) ) ( not ( = ?auto_512215 ?auto_512226 ) ) ( not ( = ?auto_512215 ?auto_512227 ) ) ( not ( = ?auto_512216 ?auto_512217 ) ) ( not ( = ?auto_512216 ?auto_512218 ) ) ( not ( = ?auto_512216 ?auto_512219 ) ) ( not ( = ?auto_512216 ?auto_512220 ) ) ( not ( = ?auto_512216 ?auto_512221 ) ) ( not ( = ?auto_512216 ?auto_512222 ) ) ( not ( = ?auto_512216 ?auto_512223 ) ) ( not ( = ?auto_512216 ?auto_512224 ) ) ( not ( = ?auto_512216 ?auto_512225 ) ) ( not ( = ?auto_512216 ?auto_512226 ) ) ( not ( = ?auto_512216 ?auto_512227 ) ) ( not ( = ?auto_512217 ?auto_512218 ) ) ( not ( = ?auto_512217 ?auto_512219 ) ) ( not ( = ?auto_512217 ?auto_512220 ) ) ( not ( = ?auto_512217 ?auto_512221 ) ) ( not ( = ?auto_512217 ?auto_512222 ) ) ( not ( = ?auto_512217 ?auto_512223 ) ) ( not ( = ?auto_512217 ?auto_512224 ) ) ( not ( = ?auto_512217 ?auto_512225 ) ) ( not ( = ?auto_512217 ?auto_512226 ) ) ( not ( = ?auto_512217 ?auto_512227 ) ) ( not ( = ?auto_512218 ?auto_512219 ) ) ( not ( = ?auto_512218 ?auto_512220 ) ) ( not ( = ?auto_512218 ?auto_512221 ) ) ( not ( = ?auto_512218 ?auto_512222 ) ) ( not ( = ?auto_512218 ?auto_512223 ) ) ( not ( = ?auto_512218 ?auto_512224 ) ) ( not ( = ?auto_512218 ?auto_512225 ) ) ( not ( = ?auto_512218 ?auto_512226 ) ) ( not ( = ?auto_512218 ?auto_512227 ) ) ( not ( = ?auto_512219 ?auto_512220 ) ) ( not ( = ?auto_512219 ?auto_512221 ) ) ( not ( = ?auto_512219 ?auto_512222 ) ) ( not ( = ?auto_512219 ?auto_512223 ) ) ( not ( = ?auto_512219 ?auto_512224 ) ) ( not ( = ?auto_512219 ?auto_512225 ) ) ( not ( = ?auto_512219 ?auto_512226 ) ) ( not ( = ?auto_512219 ?auto_512227 ) ) ( not ( = ?auto_512220 ?auto_512221 ) ) ( not ( = ?auto_512220 ?auto_512222 ) ) ( not ( = ?auto_512220 ?auto_512223 ) ) ( not ( = ?auto_512220 ?auto_512224 ) ) ( not ( = ?auto_512220 ?auto_512225 ) ) ( not ( = ?auto_512220 ?auto_512226 ) ) ( not ( = ?auto_512220 ?auto_512227 ) ) ( not ( = ?auto_512221 ?auto_512222 ) ) ( not ( = ?auto_512221 ?auto_512223 ) ) ( not ( = ?auto_512221 ?auto_512224 ) ) ( not ( = ?auto_512221 ?auto_512225 ) ) ( not ( = ?auto_512221 ?auto_512226 ) ) ( not ( = ?auto_512221 ?auto_512227 ) ) ( not ( = ?auto_512222 ?auto_512223 ) ) ( not ( = ?auto_512222 ?auto_512224 ) ) ( not ( = ?auto_512222 ?auto_512225 ) ) ( not ( = ?auto_512222 ?auto_512226 ) ) ( not ( = ?auto_512222 ?auto_512227 ) ) ( not ( = ?auto_512223 ?auto_512224 ) ) ( not ( = ?auto_512223 ?auto_512225 ) ) ( not ( = ?auto_512223 ?auto_512226 ) ) ( not ( = ?auto_512223 ?auto_512227 ) ) ( not ( = ?auto_512224 ?auto_512225 ) ) ( not ( = ?auto_512224 ?auto_512226 ) ) ( not ( = ?auto_512224 ?auto_512227 ) ) ( not ( = ?auto_512225 ?auto_512226 ) ) ( not ( = ?auto_512225 ?auto_512227 ) ) ( not ( = ?auto_512226 ?auto_512227 ) ) ( ON ?auto_512225 ?auto_512226 ) ( ON ?auto_512224 ?auto_512225 ) ( ON ?auto_512223 ?auto_512224 ) ( ON ?auto_512222 ?auto_512223 ) ( ON ?auto_512221 ?auto_512222 ) ( ON ?auto_512220 ?auto_512221 ) ( ON ?auto_512219 ?auto_512220 ) ( ON ?auto_512218 ?auto_512219 ) ( ON ?auto_512217 ?auto_512218 ) ( ON ?auto_512216 ?auto_512217 ) ( CLEAR ?auto_512214 ) ( ON ?auto_512215 ?auto_512216 ) ( CLEAR ?auto_512215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_512214 ?auto_512215 )
      ( MAKE-13PILE ?auto_512214 ?auto_512215 ?auto_512216 ?auto_512217 ?auto_512218 ?auto_512219 ?auto_512220 ?auto_512221 ?auto_512222 ?auto_512223 ?auto_512224 ?auto_512225 ?auto_512226 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_512268 - BLOCK
      ?auto_512269 - BLOCK
      ?auto_512270 - BLOCK
      ?auto_512271 - BLOCK
      ?auto_512272 - BLOCK
      ?auto_512273 - BLOCK
      ?auto_512274 - BLOCK
      ?auto_512275 - BLOCK
      ?auto_512276 - BLOCK
      ?auto_512277 - BLOCK
      ?auto_512278 - BLOCK
      ?auto_512279 - BLOCK
      ?auto_512280 - BLOCK
    )
    :vars
    (
      ?auto_512281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512280 ?auto_512281 ) ( not ( = ?auto_512268 ?auto_512269 ) ) ( not ( = ?auto_512268 ?auto_512270 ) ) ( not ( = ?auto_512268 ?auto_512271 ) ) ( not ( = ?auto_512268 ?auto_512272 ) ) ( not ( = ?auto_512268 ?auto_512273 ) ) ( not ( = ?auto_512268 ?auto_512274 ) ) ( not ( = ?auto_512268 ?auto_512275 ) ) ( not ( = ?auto_512268 ?auto_512276 ) ) ( not ( = ?auto_512268 ?auto_512277 ) ) ( not ( = ?auto_512268 ?auto_512278 ) ) ( not ( = ?auto_512268 ?auto_512279 ) ) ( not ( = ?auto_512268 ?auto_512280 ) ) ( not ( = ?auto_512268 ?auto_512281 ) ) ( not ( = ?auto_512269 ?auto_512270 ) ) ( not ( = ?auto_512269 ?auto_512271 ) ) ( not ( = ?auto_512269 ?auto_512272 ) ) ( not ( = ?auto_512269 ?auto_512273 ) ) ( not ( = ?auto_512269 ?auto_512274 ) ) ( not ( = ?auto_512269 ?auto_512275 ) ) ( not ( = ?auto_512269 ?auto_512276 ) ) ( not ( = ?auto_512269 ?auto_512277 ) ) ( not ( = ?auto_512269 ?auto_512278 ) ) ( not ( = ?auto_512269 ?auto_512279 ) ) ( not ( = ?auto_512269 ?auto_512280 ) ) ( not ( = ?auto_512269 ?auto_512281 ) ) ( not ( = ?auto_512270 ?auto_512271 ) ) ( not ( = ?auto_512270 ?auto_512272 ) ) ( not ( = ?auto_512270 ?auto_512273 ) ) ( not ( = ?auto_512270 ?auto_512274 ) ) ( not ( = ?auto_512270 ?auto_512275 ) ) ( not ( = ?auto_512270 ?auto_512276 ) ) ( not ( = ?auto_512270 ?auto_512277 ) ) ( not ( = ?auto_512270 ?auto_512278 ) ) ( not ( = ?auto_512270 ?auto_512279 ) ) ( not ( = ?auto_512270 ?auto_512280 ) ) ( not ( = ?auto_512270 ?auto_512281 ) ) ( not ( = ?auto_512271 ?auto_512272 ) ) ( not ( = ?auto_512271 ?auto_512273 ) ) ( not ( = ?auto_512271 ?auto_512274 ) ) ( not ( = ?auto_512271 ?auto_512275 ) ) ( not ( = ?auto_512271 ?auto_512276 ) ) ( not ( = ?auto_512271 ?auto_512277 ) ) ( not ( = ?auto_512271 ?auto_512278 ) ) ( not ( = ?auto_512271 ?auto_512279 ) ) ( not ( = ?auto_512271 ?auto_512280 ) ) ( not ( = ?auto_512271 ?auto_512281 ) ) ( not ( = ?auto_512272 ?auto_512273 ) ) ( not ( = ?auto_512272 ?auto_512274 ) ) ( not ( = ?auto_512272 ?auto_512275 ) ) ( not ( = ?auto_512272 ?auto_512276 ) ) ( not ( = ?auto_512272 ?auto_512277 ) ) ( not ( = ?auto_512272 ?auto_512278 ) ) ( not ( = ?auto_512272 ?auto_512279 ) ) ( not ( = ?auto_512272 ?auto_512280 ) ) ( not ( = ?auto_512272 ?auto_512281 ) ) ( not ( = ?auto_512273 ?auto_512274 ) ) ( not ( = ?auto_512273 ?auto_512275 ) ) ( not ( = ?auto_512273 ?auto_512276 ) ) ( not ( = ?auto_512273 ?auto_512277 ) ) ( not ( = ?auto_512273 ?auto_512278 ) ) ( not ( = ?auto_512273 ?auto_512279 ) ) ( not ( = ?auto_512273 ?auto_512280 ) ) ( not ( = ?auto_512273 ?auto_512281 ) ) ( not ( = ?auto_512274 ?auto_512275 ) ) ( not ( = ?auto_512274 ?auto_512276 ) ) ( not ( = ?auto_512274 ?auto_512277 ) ) ( not ( = ?auto_512274 ?auto_512278 ) ) ( not ( = ?auto_512274 ?auto_512279 ) ) ( not ( = ?auto_512274 ?auto_512280 ) ) ( not ( = ?auto_512274 ?auto_512281 ) ) ( not ( = ?auto_512275 ?auto_512276 ) ) ( not ( = ?auto_512275 ?auto_512277 ) ) ( not ( = ?auto_512275 ?auto_512278 ) ) ( not ( = ?auto_512275 ?auto_512279 ) ) ( not ( = ?auto_512275 ?auto_512280 ) ) ( not ( = ?auto_512275 ?auto_512281 ) ) ( not ( = ?auto_512276 ?auto_512277 ) ) ( not ( = ?auto_512276 ?auto_512278 ) ) ( not ( = ?auto_512276 ?auto_512279 ) ) ( not ( = ?auto_512276 ?auto_512280 ) ) ( not ( = ?auto_512276 ?auto_512281 ) ) ( not ( = ?auto_512277 ?auto_512278 ) ) ( not ( = ?auto_512277 ?auto_512279 ) ) ( not ( = ?auto_512277 ?auto_512280 ) ) ( not ( = ?auto_512277 ?auto_512281 ) ) ( not ( = ?auto_512278 ?auto_512279 ) ) ( not ( = ?auto_512278 ?auto_512280 ) ) ( not ( = ?auto_512278 ?auto_512281 ) ) ( not ( = ?auto_512279 ?auto_512280 ) ) ( not ( = ?auto_512279 ?auto_512281 ) ) ( not ( = ?auto_512280 ?auto_512281 ) ) ( ON ?auto_512279 ?auto_512280 ) ( ON ?auto_512278 ?auto_512279 ) ( ON ?auto_512277 ?auto_512278 ) ( ON ?auto_512276 ?auto_512277 ) ( ON ?auto_512275 ?auto_512276 ) ( ON ?auto_512274 ?auto_512275 ) ( ON ?auto_512273 ?auto_512274 ) ( ON ?auto_512272 ?auto_512273 ) ( ON ?auto_512271 ?auto_512272 ) ( ON ?auto_512270 ?auto_512271 ) ( ON ?auto_512269 ?auto_512270 ) ( ON ?auto_512268 ?auto_512269 ) ( CLEAR ?auto_512268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_512268 )
      ( MAKE-13PILE ?auto_512268 ?auto_512269 ?auto_512270 ?auto_512271 ?auto_512272 ?auto_512273 ?auto_512274 ?auto_512275 ?auto_512276 ?auto_512277 ?auto_512278 ?auto_512279 ?auto_512280 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512323 - BLOCK
      ?auto_512324 - BLOCK
      ?auto_512325 - BLOCK
      ?auto_512326 - BLOCK
      ?auto_512327 - BLOCK
      ?auto_512328 - BLOCK
      ?auto_512329 - BLOCK
      ?auto_512330 - BLOCK
      ?auto_512331 - BLOCK
      ?auto_512332 - BLOCK
      ?auto_512333 - BLOCK
      ?auto_512334 - BLOCK
      ?auto_512335 - BLOCK
      ?auto_512336 - BLOCK
    )
    :vars
    (
      ?auto_512337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_512335 ) ( ON ?auto_512336 ?auto_512337 ) ( CLEAR ?auto_512336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_512323 ) ( ON ?auto_512324 ?auto_512323 ) ( ON ?auto_512325 ?auto_512324 ) ( ON ?auto_512326 ?auto_512325 ) ( ON ?auto_512327 ?auto_512326 ) ( ON ?auto_512328 ?auto_512327 ) ( ON ?auto_512329 ?auto_512328 ) ( ON ?auto_512330 ?auto_512329 ) ( ON ?auto_512331 ?auto_512330 ) ( ON ?auto_512332 ?auto_512331 ) ( ON ?auto_512333 ?auto_512332 ) ( ON ?auto_512334 ?auto_512333 ) ( ON ?auto_512335 ?auto_512334 ) ( not ( = ?auto_512323 ?auto_512324 ) ) ( not ( = ?auto_512323 ?auto_512325 ) ) ( not ( = ?auto_512323 ?auto_512326 ) ) ( not ( = ?auto_512323 ?auto_512327 ) ) ( not ( = ?auto_512323 ?auto_512328 ) ) ( not ( = ?auto_512323 ?auto_512329 ) ) ( not ( = ?auto_512323 ?auto_512330 ) ) ( not ( = ?auto_512323 ?auto_512331 ) ) ( not ( = ?auto_512323 ?auto_512332 ) ) ( not ( = ?auto_512323 ?auto_512333 ) ) ( not ( = ?auto_512323 ?auto_512334 ) ) ( not ( = ?auto_512323 ?auto_512335 ) ) ( not ( = ?auto_512323 ?auto_512336 ) ) ( not ( = ?auto_512323 ?auto_512337 ) ) ( not ( = ?auto_512324 ?auto_512325 ) ) ( not ( = ?auto_512324 ?auto_512326 ) ) ( not ( = ?auto_512324 ?auto_512327 ) ) ( not ( = ?auto_512324 ?auto_512328 ) ) ( not ( = ?auto_512324 ?auto_512329 ) ) ( not ( = ?auto_512324 ?auto_512330 ) ) ( not ( = ?auto_512324 ?auto_512331 ) ) ( not ( = ?auto_512324 ?auto_512332 ) ) ( not ( = ?auto_512324 ?auto_512333 ) ) ( not ( = ?auto_512324 ?auto_512334 ) ) ( not ( = ?auto_512324 ?auto_512335 ) ) ( not ( = ?auto_512324 ?auto_512336 ) ) ( not ( = ?auto_512324 ?auto_512337 ) ) ( not ( = ?auto_512325 ?auto_512326 ) ) ( not ( = ?auto_512325 ?auto_512327 ) ) ( not ( = ?auto_512325 ?auto_512328 ) ) ( not ( = ?auto_512325 ?auto_512329 ) ) ( not ( = ?auto_512325 ?auto_512330 ) ) ( not ( = ?auto_512325 ?auto_512331 ) ) ( not ( = ?auto_512325 ?auto_512332 ) ) ( not ( = ?auto_512325 ?auto_512333 ) ) ( not ( = ?auto_512325 ?auto_512334 ) ) ( not ( = ?auto_512325 ?auto_512335 ) ) ( not ( = ?auto_512325 ?auto_512336 ) ) ( not ( = ?auto_512325 ?auto_512337 ) ) ( not ( = ?auto_512326 ?auto_512327 ) ) ( not ( = ?auto_512326 ?auto_512328 ) ) ( not ( = ?auto_512326 ?auto_512329 ) ) ( not ( = ?auto_512326 ?auto_512330 ) ) ( not ( = ?auto_512326 ?auto_512331 ) ) ( not ( = ?auto_512326 ?auto_512332 ) ) ( not ( = ?auto_512326 ?auto_512333 ) ) ( not ( = ?auto_512326 ?auto_512334 ) ) ( not ( = ?auto_512326 ?auto_512335 ) ) ( not ( = ?auto_512326 ?auto_512336 ) ) ( not ( = ?auto_512326 ?auto_512337 ) ) ( not ( = ?auto_512327 ?auto_512328 ) ) ( not ( = ?auto_512327 ?auto_512329 ) ) ( not ( = ?auto_512327 ?auto_512330 ) ) ( not ( = ?auto_512327 ?auto_512331 ) ) ( not ( = ?auto_512327 ?auto_512332 ) ) ( not ( = ?auto_512327 ?auto_512333 ) ) ( not ( = ?auto_512327 ?auto_512334 ) ) ( not ( = ?auto_512327 ?auto_512335 ) ) ( not ( = ?auto_512327 ?auto_512336 ) ) ( not ( = ?auto_512327 ?auto_512337 ) ) ( not ( = ?auto_512328 ?auto_512329 ) ) ( not ( = ?auto_512328 ?auto_512330 ) ) ( not ( = ?auto_512328 ?auto_512331 ) ) ( not ( = ?auto_512328 ?auto_512332 ) ) ( not ( = ?auto_512328 ?auto_512333 ) ) ( not ( = ?auto_512328 ?auto_512334 ) ) ( not ( = ?auto_512328 ?auto_512335 ) ) ( not ( = ?auto_512328 ?auto_512336 ) ) ( not ( = ?auto_512328 ?auto_512337 ) ) ( not ( = ?auto_512329 ?auto_512330 ) ) ( not ( = ?auto_512329 ?auto_512331 ) ) ( not ( = ?auto_512329 ?auto_512332 ) ) ( not ( = ?auto_512329 ?auto_512333 ) ) ( not ( = ?auto_512329 ?auto_512334 ) ) ( not ( = ?auto_512329 ?auto_512335 ) ) ( not ( = ?auto_512329 ?auto_512336 ) ) ( not ( = ?auto_512329 ?auto_512337 ) ) ( not ( = ?auto_512330 ?auto_512331 ) ) ( not ( = ?auto_512330 ?auto_512332 ) ) ( not ( = ?auto_512330 ?auto_512333 ) ) ( not ( = ?auto_512330 ?auto_512334 ) ) ( not ( = ?auto_512330 ?auto_512335 ) ) ( not ( = ?auto_512330 ?auto_512336 ) ) ( not ( = ?auto_512330 ?auto_512337 ) ) ( not ( = ?auto_512331 ?auto_512332 ) ) ( not ( = ?auto_512331 ?auto_512333 ) ) ( not ( = ?auto_512331 ?auto_512334 ) ) ( not ( = ?auto_512331 ?auto_512335 ) ) ( not ( = ?auto_512331 ?auto_512336 ) ) ( not ( = ?auto_512331 ?auto_512337 ) ) ( not ( = ?auto_512332 ?auto_512333 ) ) ( not ( = ?auto_512332 ?auto_512334 ) ) ( not ( = ?auto_512332 ?auto_512335 ) ) ( not ( = ?auto_512332 ?auto_512336 ) ) ( not ( = ?auto_512332 ?auto_512337 ) ) ( not ( = ?auto_512333 ?auto_512334 ) ) ( not ( = ?auto_512333 ?auto_512335 ) ) ( not ( = ?auto_512333 ?auto_512336 ) ) ( not ( = ?auto_512333 ?auto_512337 ) ) ( not ( = ?auto_512334 ?auto_512335 ) ) ( not ( = ?auto_512334 ?auto_512336 ) ) ( not ( = ?auto_512334 ?auto_512337 ) ) ( not ( = ?auto_512335 ?auto_512336 ) ) ( not ( = ?auto_512335 ?auto_512337 ) ) ( not ( = ?auto_512336 ?auto_512337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_512336 ?auto_512337 )
      ( !STACK ?auto_512336 ?auto_512335 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512381 - BLOCK
      ?auto_512382 - BLOCK
      ?auto_512383 - BLOCK
      ?auto_512384 - BLOCK
      ?auto_512385 - BLOCK
      ?auto_512386 - BLOCK
      ?auto_512387 - BLOCK
      ?auto_512388 - BLOCK
      ?auto_512389 - BLOCK
      ?auto_512390 - BLOCK
      ?auto_512391 - BLOCK
      ?auto_512392 - BLOCK
      ?auto_512393 - BLOCK
      ?auto_512394 - BLOCK
    )
    :vars
    (
      ?auto_512395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512394 ?auto_512395 ) ( ON-TABLE ?auto_512381 ) ( ON ?auto_512382 ?auto_512381 ) ( ON ?auto_512383 ?auto_512382 ) ( ON ?auto_512384 ?auto_512383 ) ( ON ?auto_512385 ?auto_512384 ) ( ON ?auto_512386 ?auto_512385 ) ( ON ?auto_512387 ?auto_512386 ) ( ON ?auto_512388 ?auto_512387 ) ( ON ?auto_512389 ?auto_512388 ) ( ON ?auto_512390 ?auto_512389 ) ( ON ?auto_512391 ?auto_512390 ) ( ON ?auto_512392 ?auto_512391 ) ( not ( = ?auto_512381 ?auto_512382 ) ) ( not ( = ?auto_512381 ?auto_512383 ) ) ( not ( = ?auto_512381 ?auto_512384 ) ) ( not ( = ?auto_512381 ?auto_512385 ) ) ( not ( = ?auto_512381 ?auto_512386 ) ) ( not ( = ?auto_512381 ?auto_512387 ) ) ( not ( = ?auto_512381 ?auto_512388 ) ) ( not ( = ?auto_512381 ?auto_512389 ) ) ( not ( = ?auto_512381 ?auto_512390 ) ) ( not ( = ?auto_512381 ?auto_512391 ) ) ( not ( = ?auto_512381 ?auto_512392 ) ) ( not ( = ?auto_512381 ?auto_512393 ) ) ( not ( = ?auto_512381 ?auto_512394 ) ) ( not ( = ?auto_512381 ?auto_512395 ) ) ( not ( = ?auto_512382 ?auto_512383 ) ) ( not ( = ?auto_512382 ?auto_512384 ) ) ( not ( = ?auto_512382 ?auto_512385 ) ) ( not ( = ?auto_512382 ?auto_512386 ) ) ( not ( = ?auto_512382 ?auto_512387 ) ) ( not ( = ?auto_512382 ?auto_512388 ) ) ( not ( = ?auto_512382 ?auto_512389 ) ) ( not ( = ?auto_512382 ?auto_512390 ) ) ( not ( = ?auto_512382 ?auto_512391 ) ) ( not ( = ?auto_512382 ?auto_512392 ) ) ( not ( = ?auto_512382 ?auto_512393 ) ) ( not ( = ?auto_512382 ?auto_512394 ) ) ( not ( = ?auto_512382 ?auto_512395 ) ) ( not ( = ?auto_512383 ?auto_512384 ) ) ( not ( = ?auto_512383 ?auto_512385 ) ) ( not ( = ?auto_512383 ?auto_512386 ) ) ( not ( = ?auto_512383 ?auto_512387 ) ) ( not ( = ?auto_512383 ?auto_512388 ) ) ( not ( = ?auto_512383 ?auto_512389 ) ) ( not ( = ?auto_512383 ?auto_512390 ) ) ( not ( = ?auto_512383 ?auto_512391 ) ) ( not ( = ?auto_512383 ?auto_512392 ) ) ( not ( = ?auto_512383 ?auto_512393 ) ) ( not ( = ?auto_512383 ?auto_512394 ) ) ( not ( = ?auto_512383 ?auto_512395 ) ) ( not ( = ?auto_512384 ?auto_512385 ) ) ( not ( = ?auto_512384 ?auto_512386 ) ) ( not ( = ?auto_512384 ?auto_512387 ) ) ( not ( = ?auto_512384 ?auto_512388 ) ) ( not ( = ?auto_512384 ?auto_512389 ) ) ( not ( = ?auto_512384 ?auto_512390 ) ) ( not ( = ?auto_512384 ?auto_512391 ) ) ( not ( = ?auto_512384 ?auto_512392 ) ) ( not ( = ?auto_512384 ?auto_512393 ) ) ( not ( = ?auto_512384 ?auto_512394 ) ) ( not ( = ?auto_512384 ?auto_512395 ) ) ( not ( = ?auto_512385 ?auto_512386 ) ) ( not ( = ?auto_512385 ?auto_512387 ) ) ( not ( = ?auto_512385 ?auto_512388 ) ) ( not ( = ?auto_512385 ?auto_512389 ) ) ( not ( = ?auto_512385 ?auto_512390 ) ) ( not ( = ?auto_512385 ?auto_512391 ) ) ( not ( = ?auto_512385 ?auto_512392 ) ) ( not ( = ?auto_512385 ?auto_512393 ) ) ( not ( = ?auto_512385 ?auto_512394 ) ) ( not ( = ?auto_512385 ?auto_512395 ) ) ( not ( = ?auto_512386 ?auto_512387 ) ) ( not ( = ?auto_512386 ?auto_512388 ) ) ( not ( = ?auto_512386 ?auto_512389 ) ) ( not ( = ?auto_512386 ?auto_512390 ) ) ( not ( = ?auto_512386 ?auto_512391 ) ) ( not ( = ?auto_512386 ?auto_512392 ) ) ( not ( = ?auto_512386 ?auto_512393 ) ) ( not ( = ?auto_512386 ?auto_512394 ) ) ( not ( = ?auto_512386 ?auto_512395 ) ) ( not ( = ?auto_512387 ?auto_512388 ) ) ( not ( = ?auto_512387 ?auto_512389 ) ) ( not ( = ?auto_512387 ?auto_512390 ) ) ( not ( = ?auto_512387 ?auto_512391 ) ) ( not ( = ?auto_512387 ?auto_512392 ) ) ( not ( = ?auto_512387 ?auto_512393 ) ) ( not ( = ?auto_512387 ?auto_512394 ) ) ( not ( = ?auto_512387 ?auto_512395 ) ) ( not ( = ?auto_512388 ?auto_512389 ) ) ( not ( = ?auto_512388 ?auto_512390 ) ) ( not ( = ?auto_512388 ?auto_512391 ) ) ( not ( = ?auto_512388 ?auto_512392 ) ) ( not ( = ?auto_512388 ?auto_512393 ) ) ( not ( = ?auto_512388 ?auto_512394 ) ) ( not ( = ?auto_512388 ?auto_512395 ) ) ( not ( = ?auto_512389 ?auto_512390 ) ) ( not ( = ?auto_512389 ?auto_512391 ) ) ( not ( = ?auto_512389 ?auto_512392 ) ) ( not ( = ?auto_512389 ?auto_512393 ) ) ( not ( = ?auto_512389 ?auto_512394 ) ) ( not ( = ?auto_512389 ?auto_512395 ) ) ( not ( = ?auto_512390 ?auto_512391 ) ) ( not ( = ?auto_512390 ?auto_512392 ) ) ( not ( = ?auto_512390 ?auto_512393 ) ) ( not ( = ?auto_512390 ?auto_512394 ) ) ( not ( = ?auto_512390 ?auto_512395 ) ) ( not ( = ?auto_512391 ?auto_512392 ) ) ( not ( = ?auto_512391 ?auto_512393 ) ) ( not ( = ?auto_512391 ?auto_512394 ) ) ( not ( = ?auto_512391 ?auto_512395 ) ) ( not ( = ?auto_512392 ?auto_512393 ) ) ( not ( = ?auto_512392 ?auto_512394 ) ) ( not ( = ?auto_512392 ?auto_512395 ) ) ( not ( = ?auto_512393 ?auto_512394 ) ) ( not ( = ?auto_512393 ?auto_512395 ) ) ( not ( = ?auto_512394 ?auto_512395 ) ) ( CLEAR ?auto_512392 ) ( ON ?auto_512393 ?auto_512394 ) ( CLEAR ?auto_512393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_512381 ?auto_512382 ?auto_512383 ?auto_512384 ?auto_512385 ?auto_512386 ?auto_512387 ?auto_512388 ?auto_512389 ?auto_512390 ?auto_512391 ?auto_512392 ?auto_512393 )
      ( MAKE-14PILE ?auto_512381 ?auto_512382 ?auto_512383 ?auto_512384 ?auto_512385 ?auto_512386 ?auto_512387 ?auto_512388 ?auto_512389 ?auto_512390 ?auto_512391 ?auto_512392 ?auto_512393 ?auto_512394 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512439 - BLOCK
      ?auto_512440 - BLOCK
      ?auto_512441 - BLOCK
      ?auto_512442 - BLOCK
      ?auto_512443 - BLOCK
      ?auto_512444 - BLOCK
      ?auto_512445 - BLOCK
      ?auto_512446 - BLOCK
      ?auto_512447 - BLOCK
      ?auto_512448 - BLOCK
      ?auto_512449 - BLOCK
      ?auto_512450 - BLOCK
      ?auto_512451 - BLOCK
      ?auto_512452 - BLOCK
    )
    :vars
    (
      ?auto_512453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512452 ?auto_512453 ) ( ON-TABLE ?auto_512439 ) ( ON ?auto_512440 ?auto_512439 ) ( ON ?auto_512441 ?auto_512440 ) ( ON ?auto_512442 ?auto_512441 ) ( ON ?auto_512443 ?auto_512442 ) ( ON ?auto_512444 ?auto_512443 ) ( ON ?auto_512445 ?auto_512444 ) ( ON ?auto_512446 ?auto_512445 ) ( ON ?auto_512447 ?auto_512446 ) ( ON ?auto_512448 ?auto_512447 ) ( ON ?auto_512449 ?auto_512448 ) ( not ( = ?auto_512439 ?auto_512440 ) ) ( not ( = ?auto_512439 ?auto_512441 ) ) ( not ( = ?auto_512439 ?auto_512442 ) ) ( not ( = ?auto_512439 ?auto_512443 ) ) ( not ( = ?auto_512439 ?auto_512444 ) ) ( not ( = ?auto_512439 ?auto_512445 ) ) ( not ( = ?auto_512439 ?auto_512446 ) ) ( not ( = ?auto_512439 ?auto_512447 ) ) ( not ( = ?auto_512439 ?auto_512448 ) ) ( not ( = ?auto_512439 ?auto_512449 ) ) ( not ( = ?auto_512439 ?auto_512450 ) ) ( not ( = ?auto_512439 ?auto_512451 ) ) ( not ( = ?auto_512439 ?auto_512452 ) ) ( not ( = ?auto_512439 ?auto_512453 ) ) ( not ( = ?auto_512440 ?auto_512441 ) ) ( not ( = ?auto_512440 ?auto_512442 ) ) ( not ( = ?auto_512440 ?auto_512443 ) ) ( not ( = ?auto_512440 ?auto_512444 ) ) ( not ( = ?auto_512440 ?auto_512445 ) ) ( not ( = ?auto_512440 ?auto_512446 ) ) ( not ( = ?auto_512440 ?auto_512447 ) ) ( not ( = ?auto_512440 ?auto_512448 ) ) ( not ( = ?auto_512440 ?auto_512449 ) ) ( not ( = ?auto_512440 ?auto_512450 ) ) ( not ( = ?auto_512440 ?auto_512451 ) ) ( not ( = ?auto_512440 ?auto_512452 ) ) ( not ( = ?auto_512440 ?auto_512453 ) ) ( not ( = ?auto_512441 ?auto_512442 ) ) ( not ( = ?auto_512441 ?auto_512443 ) ) ( not ( = ?auto_512441 ?auto_512444 ) ) ( not ( = ?auto_512441 ?auto_512445 ) ) ( not ( = ?auto_512441 ?auto_512446 ) ) ( not ( = ?auto_512441 ?auto_512447 ) ) ( not ( = ?auto_512441 ?auto_512448 ) ) ( not ( = ?auto_512441 ?auto_512449 ) ) ( not ( = ?auto_512441 ?auto_512450 ) ) ( not ( = ?auto_512441 ?auto_512451 ) ) ( not ( = ?auto_512441 ?auto_512452 ) ) ( not ( = ?auto_512441 ?auto_512453 ) ) ( not ( = ?auto_512442 ?auto_512443 ) ) ( not ( = ?auto_512442 ?auto_512444 ) ) ( not ( = ?auto_512442 ?auto_512445 ) ) ( not ( = ?auto_512442 ?auto_512446 ) ) ( not ( = ?auto_512442 ?auto_512447 ) ) ( not ( = ?auto_512442 ?auto_512448 ) ) ( not ( = ?auto_512442 ?auto_512449 ) ) ( not ( = ?auto_512442 ?auto_512450 ) ) ( not ( = ?auto_512442 ?auto_512451 ) ) ( not ( = ?auto_512442 ?auto_512452 ) ) ( not ( = ?auto_512442 ?auto_512453 ) ) ( not ( = ?auto_512443 ?auto_512444 ) ) ( not ( = ?auto_512443 ?auto_512445 ) ) ( not ( = ?auto_512443 ?auto_512446 ) ) ( not ( = ?auto_512443 ?auto_512447 ) ) ( not ( = ?auto_512443 ?auto_512448 ) ) ( not ( = ?auto_512443 ?auto_512449 ) ) ( not ( = ?auto_512443 ?auto_512450 ) ) ( not ( = ?auto_512443 ?auto_512451 ) ) ( not ( = ?auto_512443 ?auto_512452 ) ) ( not ( = ?auto_512443 ?auto_512453 ) ) ( not ( = ?auto_512444 ?auto_512445 ) ) ( not ( = ?auto_512444 ?auto_512446 ) ) ( not ( = ?auto_512444 ?auto_512447 ) ) ( not ( = ?auto_512444 ?auto_512448 ) ) ( not ( = ?auto_512444 ?auto_512449 ) ) ( not ( = ?auto_512444 ?auto_512450 ) ) ( not ( = ?auto_512444 ?auto_512451 ) ) ( not ( = ?auto_512444 ?auto_512452 ) ) ( not ( = ?auto_512444 ?auto_512453 ) ) ( not ( = ?auto_512445 ?auto_512446 ) ) ( not ( = ?auto_512445 ?auto_512447 ) ) ( not ( = ?auto_512445 ?auto_512448 ) ) ( not ( = ?auto_512445 ?auto_512449 ) ) ( not ( = ?auto_512445 ?auto_512450 ) ) ( not ( = ?auto_512445 ?auto_512451 ) ) ( not ( = ?auto_512445 ?auto_512452 ) ) ( not ( = ?auto_512445 ?auto_512453 ) ) ( not ( = ?auto_512446 ?auto_512447 ) ) ( not ( = ?auto_512446 ?auto_512448 ) ) ( not ( = ?auto_512446 ?auto_512449 ) ) ( not ( = ?auto_512446 ?auto_512450 ) ) ( not ( = ?auto_512446 ?auto_512451 ) ) ( not ( = ?auto_512446 ?auto_512452 ) ) ( not ( = ?auto_512446 ?auto_512453 ) ) ( not ( = ?auto_512447 ?auto_512448 ) ) ( not ( = ?auto_512447 ?auto_512449 ) ) ( not ( = ?auto_512447 ?auto_512450 ) ) ( not ( = ?auto_512447 ?auto_512451 ) ) ( not ( = ?auto_512447 ?auto_512452 ) ) ( not ( = ?auto_512447 ?auto_512453 ) ) ( not ( = ?auto_512448 ?auto_512449 ) ) ( not ( = ?auto_512448 ?auto_512450 ) ) ( not ( = ?auto_512448 ?auto_512451 ) ) ( not ( = ?auto_512448 ?auto_512452 ) ) ( not ( = ?auto_512448 ?auto_512453 ) ) ( not ( = ?auto_512449 ?auto_512450 ) ) ( not ( = ?auto_512449 ?auto_512451 ) ) ( not ( = ?auto_512449 ?auto_512452 ) ) ( not ( = ?auto_512449 ?auto_512453 ) ) ( not ( = ?auto_512450 ?auto_512451 ) ) ( not ( = ?auto_512450 ?auto_512452 ) ) ( not ( = ?auto_512450 ?auto_512453 ) ) ( not ( = ?auto_512451 ?auto_512452 ) ) ( not ( = ?auto_512451 ?auto_512453 ) ) ( not ( = ?auto_512452 ?auto_512453 ) ) ( ON ?auto_512451 ?auto_512452 ) ( CLEAR ?auto_512449 ) ( ON ?auto_512450 ?auto_512451 ) ( CLEAR ?auto_512450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_512439 ?auto_512440 ?auto_512441 ?auto_512442 ?auto_512443 ?auto_512444 ?auto_512445 ?auto_512446 ?auto_512447 ?auto_512448 ?auto_512449 ?auto_512450 )
      ( MAKE-14PILE ?auto_512439 ?auto_512440 ?auto_512441 ?auto_512442 ?auto_512443 ?auto_512444 ?auto_512445 ?auto_512446 ?auto_512447 ?auto_512448 ?auto_512449 ?auto_512450 ?auto_512451 ?auto_512452 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512497 - BLOCK
      ?auto_512498 - BLOCK
      ?auto_512499 - BLOCK
      ?auto_512500 - BLOCK
      ?auto_512501 - BLOCK
      ?auto_512502 - BLOCK
      ?auto_512503 - BLOCK
      ?auto_512504 - BLOCK
      ?auto_512505 - BLOCK
      ?auto_512506 - BLOCK
      ?auto_512507 - BLOCK
      ?auto_512508 - BLOCK
      ?auto_512509 - BLOCK
      ?auto_512510 - BLOCK
    )
    :vars
    (
      ?auto_512511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512510 ?auto_512511 ) ( ON-TABLE ?auto_512497 ) ( ON ?auto_512498 ?auto_512497 ) ( ON ?auto_512499 ?auto_512498 ) ( ON ?auto_512500 ?auto_512499 ) ( ON ?auto_512501 ?auto_512500 ) ( ON ?auto_512502 ?auto_512501 ) ( ON ?auto_512503 ?auto_512502 ) ( ON ?auto_512504 ?auto_512503 ) ( ON ?auto_512505 ?auto_512504 ) ( ON ?auto_512506 ?auto_512505 ) ( not ( = ?auto_512497 ?auto_512498 ) ) ( not ( = ?auto_512497 ?auto_512499 ) ) ( not ( = ?auto_512497 ?auto_512500 ) ) ( not ( = ?auto_512497 ?auto_512501 ) ) ( not ( = ?auto_512497 ?auto_512502 ) ) ( not ( = ?auto_512497 ?auto_512503 ) ) ( not ( = ?auto_512497 ?auto_512504 ) ) ( not ( = ?auto_512497 ?auto_512505 ) ) ( not ( = ?auto_512497 ?auto_512506 ) ) ( not ( = ?auto_512497 ?auto_512507 ) ) ( not ( = ?auto_512497 ?auto_512508 ) ) ( not ( = ?auto_512497 ?auto_512509 ) ) ( not ( = ?auto_512497 ?auto_512510 ) ) ( not ( = ?auto_512497 ?auto_512511 ) ) ( not ( = ?auto_512498 ?auto_512499 ) ) ( not ( = ?auto_512498 ?auto_512500 ) ) ( not ( = ?auto_512498 ?auto_512501 ) ) ( not ( = ?auto_512498 ?auto_512502 ) ) ( not ( = ?auto_512498 ?auto_512503 ) ) ( not ( = ?auto_512498 ?auto_512504 ) ) ( not ( = ?auto_512498 ?auto_512505 ) ) ( not ( = ?auto_512498 ?auto_512506 ) ) ( not ( = ?auto_512498 ?auto_512507 ) ) ( not ( = ?auto_512498 ?auto_512508 ) ) ( not ( = ?auto_512498 ?auto_512509 ) ) ( not ( = ?auto_512498 ?auto_512510 ) ) ( not ( = ?auto_512498 ?auto_512511 ) ) ( not ( = ?auto_512499 ?auto_512500 ) ) ( not ( = ?auto_512499 ?auto_512501 ) ) ( not ( = ?auto_512499 ?auto_512502 ) ) ( not ( = ?auto_512499 ?auto_512503 ) ) ( not ( = ?auto_512499 ?auto_512504 ) ) ( not ( = ?auto_512499 ?auto_512505 ) ) ( not ( = ?auto_512499 ?auto_512506 ) ) ( not ( = ?auto_512499 ?auto_512507 ) ) ( not ( = ?auto_512499 ?auto_512508 ) ) ( not ( = ?auto_512499 ?auto_512509 ) ) ( not ( = ?auto_512499 ?auto_512510 ) ) ( not ( = ?auto_512499 ?auto_512511 ) ) ( not ( = ?auto_512500 ?auto_512501 ) ) ( not ( = ?auto_512500 ?auto_512502 ) ) ( not ( = ?auto_512500 ?auto_512503 ) ) ( not ( = ?auto_512500 ?auto_512504 ) ) ( not ( = ?auto_512500 ?auto_512505 ) ) ( not ( = ?auto_512500 ?auto_512506 ) ) ( not ( = ?auto_512500 ?auto_512507 ) ) ( not ( = ?auto_512500 ?auto_512508 ) ) ( not ( = ?auto_512500 ?auto_512509 ) ) ( not ( = ?auto_512500 ?auto_512510 ) ) ( not ( = ?auto_512500 ?auto_512511 ) ) ( not ( = ?auto_512501 ?auto_512502 ) ) ( not ( = ?auto_512501 ?auto_512503 ) ) ( not ( = ?auto_512501 ?auto_512504 ) ) ( not ( = ?auto_512501 ?auto_512505 ) ) ( not ( = ?auto_512501 ?auto_512506 ) ) ( not ( = ?auto_512501 ?auto_512507 ) ) ( not ( = ?auto_512501 ?auto_512508 ) ) ( not ( = ?auto_512501 ?auto_512509 ) ) ( not ( = ?auto_512501 ?auto_512510 ) ) ( not ( = ?auto_512501 ?auto_512511 ) ) ( not ( = ?auto_512502 ?auto_512503 ) ) ( not ( = ?auto_512502 ?auto_512504 ) ) ( not ( = ?auto_512502 ?auto_512505 ) ) ( not ( = ?auto_512502 ?auto_512506 ) ) ( not ( = ?auto_512502 ?auto_512507 ) ) ( not ( = ?auto_512502 ?auto_512508 ) ) ( not ( = ?auto_512502 ?auto_512509 ) ) ( not ( = ?auto_512502 ?auto_512510 ) ) ( not ( = ?auto_512502 ?auto_512511 ) ) ( not ( = ?auto_512503 ?auto_512504 ) ) ( not ( = ?auto_512503 ?auto_512505 ) ) ( not ( = ?auto_512503 ?auto_512506 ) ) ( not ( = ?auto_512503 ?auto_512507 ) ) ( not ( = ?auto_512503 ?auto_512508 ) ) ( not ( = ?auto_512503 ?auto_512509 ) ) ( not ( = ?auto_512503 ?auto_512510 ) ) ( not ( = ?auto_512503 ?auto_512511 ) ) ( not ( = ?auto_512504 ?auto_512505 ) ) ( not ( = ?auto_512504 ?auto_512506 ) ) ( not ( = ?auto_512504 ?auto_512507 ) ) ( not ( = ?auto_512504 ?auto_512508 ) ) ( not ( = ?auto_512504 ?auto_512509 ) ) ( not ( = ?auto_512504 ?auto_512510 ) ) ( not ( = ?auto_512504 ?auto_512511 ) ) ( not ( = ?auto_512505 ?auto_512506 ) ) ( not ( = ?auto_512505 ?auto_512507 ) ) ( not ( = ?auto_512505 ?auto_512508 ) ) ( not ( = ?auto_512505 ?auto_512509 ) ) ( not ( = ?auto_512505 ?auto_512510 ) ) ( not ( = ?auto_512505 ?auto_512511 ) ) ( not ( = ?auto_512506 ?auto_512507 ) ) ( not ( = ?auto_512506 ?auto_512508 ) ) ( not ( = ?auto_512506 ?auto_512509 ) ) ( not ( = ?auto_512506 ?auto_512510 ) ) ( not ( = ?auto_512506 ?auto_512511 ) ) ( not ( = ?auto_512507 ?auto_512508 ) ) ( not ( = ?auto_512507 ?auto_512509 ) ) ( not ( = ?auto_512507 ?auto_512510 ) ) ( not ( = ?auto_512507 ?auto_512511 ) ) ( not ( = ?auto_512508 ?auto_512509 ) ) ( not ( = ?auto_512508 ?auto_512510 ) ) ( not ( = ?auto_512508 ?auto_512511 ) ) ( not ( = ?auto_512509 ?auto_512510 ) ) ( not ( = ?auto_512509 ?auto_512511 ) ) ( not ( = ?auto_512510 ?auto_512511 ) ) ( ON ?auto_512509 ?auto_512510 ) ( ON ?auto_512508 ?auto_512509 ) ( CLEAR ?auto_512506 ) ( ON ?auto_512507 ?auto_512508 ) ( CLEAR ?auto_512507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_512497 ?auto_512498 ?auto_512499 ?auto_512500 ?auto_512501 ?auto_512502 ?auto_512503 ?auto_512504 ?auto_512505 ?auto_512506 ?auto_512507 )
      ( MAKE-14PILE ?auto_512497 ?auto_512498 ?auto_512499 ?auto_512500 ?auto_512501 ?auto_512502 ?auto_512503 ?auto_512504 ?auto_512505 ?auto_512506 ?auto_512507 ?auto_512508 ?auto_512509 ?auto_512510 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512555 - BLOCK
      ?auto_512556 - BLOCK
      ?auto_512557 - BLOCK
      ?auto_512558 - BLOCK
      ?auto_512559 - BLOCK
      ?auto_512560 - BLOCK
      ?auto_512561 - BLOCK
      ?auto_512562 - BLOCK
      ?auto_512563 - BLOCK
      ?auto_512564 - BLOCK
      ?auto_512565 - BLOCK
      ?auto_512566 - BLOCK
      ?auto_512567 - BLOCK
      ?auto_512568 - BLOCK
    )
    :vars
    (
      ?auto_512569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512568 ?auto_512569 ) ( ON-TABLE ?auto_512555 ) ( ON ?auto_512556 ?auto_512555 ) ( ON ?auto_512557 ?auto_512556 ) ( ON ?auto_512558 ?auto_512557 ) ( ON ?auto_512559 ?auto_512558 ) ( ON ?auto_512560 ?auto_512559 ) ( ON ?auto_512561 ?auto_512560 ) ( ON ?auto_512562 ?auto_512561 ) ( ON ?auto_512563 ?auto_512562 ) ( not ( = ?auto_512555 ?auto_512556 ) ) ( not ( = ?auto_512555 ?auto_512557 ) ) ( not ( = ?auto_512555 ?auto_512558 ) ) ( not ( = ?auto_512555 ?auto_512559 ) ) ( not ( = ?auto_512555 ?auto_512560 ) ) ( not ( = ?auto_512555 ?auto_512561 ) ) ( not ( = ?auto_512555 ?auto_512562 ) ) ( not ( = ?auto_512555 ?auto_512563 ) ) ( not ( = ?auto_512555 ?auto_512564 ) ) ( not ( = ?auto_512555 ?auto_512565 ) ) ( not ( = ?auto_512555 ?auto_512566 ) ) ( not ( = ?auto_512555 ?auto_512567 ) ) ( not ( = ?auto_512555 ?auto_512568 ) ) ( not ( = ?auto_512555 ?auto_512569 ) ) ( not ( = ?auto_512556 ?auto_512557 ) ) ( not ( = ?auto_512556 ?auto_512558 ) ) ( not ( = ?auto_512556 ?auto_512559 ) ) ( not ( = ?auto_512556 ?auto_512560 ) ) ( not ( = ?auto_512556 ?auto_512561 ) ) ( not ( = ?auto_512556 ?auto_512562 ) ) ( not ( = ?auto_512556 ?auto_512563 ) ) ( not ( = ?auto_512556 ?auto_512564 ) ) ( not ( = ?auto_512556 ?auto_512565 ) ) ( not ( = ?auto_512556 ?auto_512566 ) ) ( not ( = ?auto_512556 ?auto_512567 ) ) ( not ( = ?auto_512556 ?auto_512568 ) ) ( not ( = ?auto_512556 ?auto_512569 ) ) ( not ( = ?auto_512557 ?auto_512558 ) ) ( not ( = ?auto_512557 ?auto_512559 ) ) ( not ( = ?auto_512557 ?auto_512560 ) ) ( not ( = ?auto_512557 ?auto_512561 ) ) ( not ( = ?auto_512557 ?auto_512562 ) ) ( not ( = ?auto_512557 ?auto_512563 ) ) ( not ( = ?auto_512557 ?auto_512564 ) ) ( not ( = ?auto_512557 ?auto_512565 ) ) ( not ( = ?auto_512557 ?auto_512566 ) ) ( not ( = ?auto_512557 ?auto_512567 ) ) ( not ( = ?auto_512557 ?auto_512568 ) ) ( not ( = ?auto_512557 ?auto_512569 ) ) ( not ( = ?auto_512558 ?auto_512559 ) ) ( not ( = ?auto_512558 ?auto_512560 ) ) ( not ( = ?auto_512558 ?auto_512561 ) ) ( not ( = ?auto_512558 ?auto_512562 ) ) ( not ( = ?auto_512558 ?auto_512563 ) ) ( not ( = ?auto_512558 ?auto_512564 ) ) ( not ( = ?auto_512558 ?auto_512565 ) ) ( not ( = ?auto_512558 ?auto_512566 ) ) ( not ( = ?auto_512558 ?auto_512567 ) ) ( not ( = ?auto_512558 ?auto_512568 ) ) ( not ( = ?auto_512558 ?auto_512569 ) ) ( not ( = ?auto_512559 ?auto_512560 ) ) ( not ( = ?auto_512559 ?auto_512561 ) ) ( not ( = ?auto_512559 ?auto_512562 ) ) ( not ( = ?auto_512559 ?auto_512563 ) ) ( not ( = ?auto_512559 ?auto_512564 ) ) ( not ( = ?auto_512559 ?auto_512565 ) ) ( not ( = ?auto_512559 ?auto_512566 ) ) ( not ( = ?auto_512559 ?auto_512567 ) ) ( not ( = ?auto_512559 ?auto_512568 ) ) ( not ( = ?auto_512559 ?auto_512569 ) ) ( not ( = ?auto_512560 ?auto_512561 ) ) ( not ( = ?auto_512560 ?auto_512562 ) ) ( not ( = ?auto_512560 ?auto_512563 ) ) ( not ( = ?auto_512560 ?auto_512564 ) ) ( not ( = ?auto_512560 ?auto_512565 ) ) ( not ( = ?auto_512560 ?auto_512566 ) ) ( not ( = ?auto_512560 ?auto_512567 ) ) ( not ( = ?auto_512560 ?auto_512568 ) ) ( not ( = ?auto_512560 ?auto_512569 ) ) ( not ( = ?auto_512561 ?auto_512562 ) ) ( not ( = ?auto_512561 ?auto_512563 ) ) ( not ( = ?auto_512561 ?auto_512564 ) ) ( not ( = ?auto_512561 ?auto_512565 ) ) ( not ( = ?auto_512561 ?auto_512566 ) ) ( not ( = ?auto_512561 ?auto_512567 ) ) ( not ( = ?auto_512561 ?auto_512568 ) ) ( not ( = ?auto_512561 ?auto_512569 ) ) ( not ( = ?auto_512562 ?auto_512563 ) ) ( not ( = ?auto_512562 ?auto_512564 ) ) ( not ( = ?auto_512562 ?auto_512565 ) ) ( not ( = ?auto_512562 ?auto_512566 ) ) ( not ( = ?auto_512562 ?auto_512567 ) ) ( not ( = ?auto_512562 ?auto_512568 ) ) ( not ( = ?auto_512562 ?auto_512569 ) ) ( not ( = ?auto_512563 ?auto_512564 ) ) ( not ( = ?auto_512563 ?auto_512565 ) ) ( not ( = ?auto_512563 ?auto_512566 ) ) ( not ( = ?auto_512563 ?auto_512567 ) ) ( not ( = ?auto_512563 ?auto_512568 ) ) ( not ( = ?auto_512563 ?auto_512569 ) ) ( not ( = ?auto_512564 ?auto_512565 ) ) ( not ( = ?auto_512564 ?auto_512566 ) ) ( not ( = ?auto_512564 ?auto_512567 ) ) ( not ( = ?auto_512564 ?auto_512568 ) ) ( not ( = ?auto_512564 ?auto_512569 ) ) ( not ( = ?auto_512565 ?auto_512566 ) ) ( not ( = ?auto_512565 ?auto_512567 ) ) ( not ( = ?auto_512565 ?auto_512568 ) ) ( not ( = ?auto_512565 ?auto_512569 ) ) ( not ( = ?auto_512566 ?auto_512567 ) ) ( not ( = ?auto_512566 ?auto_512568 ) ) ( not ( = ?auto_512566 ?auto_512569 ) ) ( not ( = ?auto_512567 ?auto_512568 ) ) ( not ( = ?auto_512567 ?auto_512569 ) ) ( not ( = ?auto_512568 ?auto_512569 ) ) ( ON ?auto_512567 ?auto_512568 ) ( ON ?auto_512566 ?auto_512567 ) ( ON ?auto_512565 ?auto_512566 ) ( CLEAR ?auto_512563 ) ( ON ?auto_512564 ?auto_512565 ) ( CLEAR ?auto_512564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_512555 ?auto_512556 ?auto_512557 ?auto_512558 ?auto_512559 ?auto_512560 ?auto_512561 ?auto_512562 ?auto_512563 ?auto_512564 )
      ( MAKE-14PILE ?auto_512555 ?auto_512556 ?auto_512557 ?auto_512558 ?auto_512559 ?auto_512560 ?auto_512561 ?auto_512562 ?auto_512563 ?auto_512564 ?auto_512565 ?auto_512566 ?auto_512567 ?auto_512568 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512613 - BLOCK
      ?auto_512614 - BLOCK
      ?auto_512615 - BLOCK
      ?auto_512616 - BLOCK
      ?auto_512617 - BLOCK
      ?auto_512618 - BLOCK
      ?auto_512619 - BLOCK
      ?auto_512620 - BLOCK
      ?auto_512621 - BLOCK
      ?auto_512622 - BLOCK
      ?auto_512623 - BLOCK
      ?auto_512624 - BLOCK
      ?auto_512625 - BLOCK
      ?auto_512626 - BLOCK
    )
    :vars
    (
      ?auto_512627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512626 ?auto_512627 ) ( ON-TABLE ?auto_512613 ) ( ON ?auto_512614 ?auto_512613 ) ( ON ?auto_512615 ?auto_512614 ) ( ON ?auto_512616 ?auto_512615 ) ( ON ?auto_512617 ?auto_512616 ) ( ON ?auto_512618 ?auto_512617 ) ( ON ?auto_512619 ?auto_512618 ) ( ON ?auto_512620 ?auto_512619 ) ( not ( = ?auto_512613 ?auto_512614 ) ) ( not ( = ?auto_512613 ?auto_512615 ) ) ( not ( = ?auto_512613 ?auto_512616 ) ) ( not ( = ?auto_512613 ?auto_512617 ) ) ( not ( = ?auto_512613 ?auto_512618 ) ) ( not ( = ?auto_512613 ?auto_512619 ) ) ( not ( = ?auto_512613 ?auto_512620 ) ) ( not ( = ?auto_512613 ?auto_512621 ) ) ( not ( = ?auto_512613 ?auto_512622 ) ) ( not ( = ?auto_512613 ?auto_512623 ) ) ( not ( = ?auto_512613 ?auto_512624 ) ) ( not ( = ?auto_512613 ?auto_512625 ) ) ( not ( = ?auto_512613 ?auto_512626 ) ) ( not ( = ?auto_512613 ?auto_512627 ) ) ( not ( = ?auto_512614 ?auto_512615 ) ) ( not ( = ?auto_512614 ?auto_512616 ) ) ( not ( = ?auto_512614 ?auto_512617 ) ) ( not ( = ?auto_512614 ?auto_512618 ) ) ( not ( = ?auto_512614 ?auto_512619 ) ) ( not ( = ?auto_512614 ?auto_512620 ) ) ( not ( = ?auto_512614 ?auto_512621 ) ) ( not ( = ?auto_512614 ?auto_512622 ) ) ( not ( = ?auto_512614 ?auto_512623 ) ) ( not ( = ?auto_512614 ?auto_512624 ) ) ( not ( = ?auto_512614 ?auto_512625 ) ) ( not ( = ?auto_512614 ?auto_512626 ) ) ( not ( = ?auto_512614 ?auto_512627 ) ) ( not ( = ?auto_512615 ?auto_512616 ) ) ( not ( = ?auto_512615 ?auto_512617 ) ) ( not ( = ?auto_512615 ?auto_512618 ) ) ( not ( = ?auto_512615 ?auto_512619 ) ) ( not ( = ?auto_512615 ?auto_512620 ) ) ( not ( = ?auto_512615 ?auto_512621 ) ) ( not ( = ?auto_512615 ?auto_512622 ) ) ( not ( = ?auto_512615 ?auto_512623 ) ) ( not ( = ?auto_512615 ?auto_512624 ) ) ( not ( = ?auto_512615 ?auto_512625 ) ) ( not ( = ?auto_512615 ?auto_512626 ) ) ( not ( = ?auto_512615 ?auto_512627 ) ) ( not ( = ?auto_512616 ?auto_512617 ) ) ( not ( = ?auto_512616 ?auto_512618 ) ) ( not ( = ?auto_512616 ?auto_512619 ) ) ( not ( = ?auto_512616 ?auto_512620 ) ) ( not ( = ?auto_512616 ?auto_512621 ) ) ( not ( = ?auto_512616 ?auto_512622 ) ) ( not ( = ?auto_512616 ?auto_512623 ) ) ( not ( = ?auto_512616 ?auto_512624 ) ) ( not ( = ?auto_512616 ?auto_512625 ) ) ( not ( = ?auto_512616 ?auto_512626 ) ) ( not ( = ?auto_512616 ?auto_512627 ) ) ( not ( = ?auto_512617 ?auto_512618 ) ) ( not ( = ?auto_512617 ?auto_512619 ) ) ( not ( = ?auto_512617 ?auto_512620 ) ) ( not ( = ?auto_512617 ?auto_512621 ) ) ( not ( = ?auto_512617 ?auto_512622 ) ) ( not ( = ?auto_512617 ?auto_512623 ) ) ( not ( = ?auto_512617 ?auto_512624 ) ) ( not ( = ?auto_512617 ?auto_512625 ) ) ( not ( = ?auto_512617 ?auto_512626 ) ) ( not ( = ?auto_512617 ?auto_512627 ) ) ( not ( = ?auto_512618 ?auto_512619 ) ) ( not ( = ?auto_512618 ?auto_512620 ) ) ( not ( = ?auto_512618 ?auto_512621 ) ) ( not ( = ?auto_512618 ?auto_512622 ) ) ( not ( = ?auto_512618 ?auto_512623 ) ) ( not ( = ?auto_512618 ?auto_512624 ) ) ( not ( = ?auto_512618 ?auto_512625 ) ) ( not ( = ?auto_512618 ?auto_512626 ) ) ( not ( = ?auto_512618 ?auto_512627 ) ) ( not ( = ?auto_512619 ?auto_512620 ) ) ( not ( = ?auto_512619 ?auto_512621 ) ) ( not ( = ?auto_512619 ?auto_512622 ) ) ( not ( = ?auto_512619 ?auto_512623 ) ) ( not ( = ?auto_512619 ?auto_512624 ) ) ( not ( = ?auto_512619 ?auto_512625 ) ) ( not ( = ?auto_512619 ?auto_512626 ) ) ( not ( = ?auto_512619 ?auto_512627 ) ) ( not ( = ?auto_512620 ?auto_512621 ) ) ( not ( = ?auto_512620 ?auto_512622 ) ) ( not ( = ?auto_512620 ?auto_512623 ) ) ( not ( = ?auto_512620 ?auto_512624 ) ) ( not ( = ?auto_512620 ?auto_512625 ) ) ( not ( = ?auto_512620 ?auto_512626 ) ) ( not ( = ?auto_512620 ?auto_512627 ) ) ( not ( = ?auto_512621 ?auto_512622 ) ) ( not ( = ?auto_512621 ?auto_512623 ) ) ( not ( = ?auto_512621 ?auto_512624 ) ) ( not ( = ?auto_512621 ?auto_512625 ) ) ( not ( = ?auto_512621 ?auto_512626 ) ) ( not ( = ?auto_512621 ?auto_512627 ) ) ( not ( = ?auto_512622 ?auto_512623 ) ) ( not ( = ?auto_512622 ?auto_512624 ) ) ( not ( = ?auto_512622 ?auto_512625 ) ) ( not ( = ?auto_512622 ?auto_512626 ) ) ( not ( = ?auto_512622 ?auto_512627 ) ) ( not ( = ?auto_512623 ?auto_512624 ) ) ( not ( = ?auto_512623 ?auto_512625 ) ) ( not ( = ?auto_512623 ?auto_512626 ) ) ( not ( = ?auto_512623 ?auto_512627 ) ) ( not ( = ?auto_512624 ?auto_512625 ) ) ( not ( = ?auto_512624 ?auto_512626 ) ) ( not ( = ?auto_512624 ?auto_512627 ) ) ( not ( = ?auto_512625 ?auto_512626 ) ) ( not ( = ?auto_512625 ?auto_512627 ) ) ( not ( = ?auto_512626 ?auto_512627 ) ) ( ON ?auto_512625 ?auto_512626 ) ( ON ?auto_512624 ?auto_512625 ) ( ON ?auto_512623 ?auto_512624 ) ( ON ?auto_512622 ?auto_512623 ) ( CLEAR ?auto_512620 ) ( ON ?auto_512621 ?auto_512622 ) ( CLEAR ?auto_512621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_512613 ?auto_512614 ?auto_512615 ?auto_512616 ?auto_512617 ?auto_512618 ?auto_512619 ?auto_512620 ?auto_512621 )
      ( MAKE-14PILE ?auto_512613 ?auto_512614 ?auto_512615 ?auto_512616 ?auto_512617 ?auto_512618 ?auto_512619 ?auto_512620 ?auto_512621 ?auto_512622 ?auto_512623 ?auto_512624 ?auto_512625 ?auto_512626 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512671 - BLOCK
      ?auto_512672 - BLOCK
      ?auto_512673 - BLOCK
      ?auto_512674 - BLOCK
      ?auto_512675 - BLOCK
      ?auto_512676 - BLOCK
      ?auto_512677 - BLOCK
      ?auto_512678 - BLOCK
      ?auto_512679 - BLOCK
      ?auto_512680 - BLOCK
      ?auto_512681 - BLOCK
      ?auto_512682 - BLOCK
      ?auto_512683 - BLOCK
      ?auto_512684 - BLOCK
    )
    :vars
    (
      ?auto_512685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512684 ?auto_512685 ) ( ON-TABLE ?auto_512671 ) ( ON ?auto_512672 ?auto_512671 ) ( ON ?auto_512673 ?auto_512672 ) ( ON ?auto_512674 ?auto_512673 ) ( ON ?auto_512675 ?auto_512674 ) ( ON ?auto_512676 ?auto_512675 ) ( ON ?auto_512677 ?auto_512676 ) ( not ( = ?auto_512671 ?auto_512672 ) ) ( not ( = ?auto_512671 ?auto_512673 ) ) ( not ( = ?auto_512671 ?auto_512674 ) ) ( not ( = ?auto_512671 ?auto_512675 ) ) ( not ( = ?auto_512671 ?auto_512676 ) ) ( not ( = ?auto_512671 ?auto_512677 ) ) ( not ( = ?auto_512671 ?auto_512678 ) ) ( not ( = ?auto_512671 ?auto_512679 ) ) ( not ( = ?auto_512671 ?auto_512680 ) ) ( not ( = ?auto_512671 ?auto_512681 ) ) ( not ( = ?auto_512671 ?auto_512682 ) ) ( not ( = ?auto_512671 ?auto_512683 ) ) ( not ( = ?auto_512671 ?auto_512684 ) ) ( not ( = ?auto_512671 ?auto_512685 ) ) ( not ( = ?auto_512672 ?auto_512673 ) ) ( not ( = ?auto_512672 ?auto_512674 ) ) ( not ( = ?auto_512672 ?auto_512675 ) ) ( not ( = ?auto_512672 ?auto_512676 ) ) ( not ( = ?auto_512672 ?auto_512677 ) ) ( not ( = ?auto_512672 ?auto_512678 ) ) ( not ( = ?auto_512672 ?auto_512679 ) ) ( not ( = ?auto_512672 ?auto_512680 ) ) ( not ( = ?auto_512672 ?auto_512681 ) ) ( not ( = ?auto_512672 ?auto_512682 ) ) ( not ( = ?auto_512672 ?auto_512683 ) ) ( not ( = ?auto_512672 ?auto_512684 ) ) ( not ( = ?auto_512672 ?auto_512685 ) ) ( not ( = ?auto_512673 ?auto_512674 ) ) ( not ( = ?auto_512673 ?auto_512675 ) ) ( not ( = ?auto_512673 ?auto_512676 ) ) ( not ( = ?auto_512673 ?auto_512677 ) ) ( not ( = ?auto_512673 ?auto_512678 ) ) ( not ( = ?auto_512673 ?auto_512679 ) ) ( not ( = ?auto_512673 ?auto_512680 ) ) ( not ( = ?auto_512673 ?auto_512681 ) ) ( not ( = ?auto_512673 ?auto_512682 ) ) ( not ( = ?auto_512673 ?auto_512683 ) ) ( not ( = ?auto_512673 ?auto_512684 ) ) ( not ( = ?auto_512673 ?auto_512685 ) ) ( not ( = ?auto_512674 ?auto_512675 ) ) ( not ( = ?auto_512674 ?auto_512676 ) ) ( not ( = ?auto_512674 ?auto_512677 ) ) ( not ( = ?auto_512674 ?auto_512678 ) ) ( not ( = ?auto_512674 ?auto_512679 ) ) ( not ( = ?auto_512674 ?auto_512680 ) ) ( not ( = ?auto_512674 ?auto_512681 ) ) ( not ( = ?auto_512674 ?auto_512682 ) ) ( not ( = ?auto_512674 ?auto_512683 ) ) ( not ( = ?auto_512674 ?auto_512684 ) ) ( not ( = ?auto_512674 ?auto_512685 ) ) ( not ( = ?auto_512675 ?auto_512676 ) ) ( not ( = ?auto_512675 ?auto_512677 ) ) ( not ( = ?auto_512675 ?auto_512678 ) ) ( not ( = ?auto_512675 ?auto_512679 ) ) ( not ( = ?auto_512675 ?auto_512680 ) ) ( not ( = ?auto_512675 ?auto_512681 ) ) ( not ( = ?auto_512675 ?auto_512682 ) ) ( not ( = ?auto_512675 ?auto_512683 ) ) ( not ( = ?auto_512675 ?auto_512684 ) ) ( not ( = ?auto_512675 ?auto_512685 ) ) ( not ( = ?auto_512676 ?auto_512677 ) ) ( not ( = ?auto_512676 ?auto_512678 ) ) ( not ( = ?auto_512676 ?auto_512679 ) ) ( not ( = ?auto_512676 ?auto_512680 ) ) ( not ( = ?auto_512676 ?auto_512681 ) ) ( not ( = ?auto_512676 ?auto_512682 ) ) ( not ( = ?auto_512676 ?auto_512683 ) ) ( not ( = ?auto_512676 ?auto_512684 ) ) ( not ( = ?auto_512676 ?auto_512685 ) ) ( not ( = ?auto_512677 ?auto_512678 ) ) ( not ( = ?auto_512677 ?auto_512679 ) ) ( not ( = ?auto_512677 ?auto_512680 ) ) ( not ( = ?auto_512677 ?auto_512681 ) ) ( not ( = ?auto_512677 ?auto_512682 ) ) ( not ( = ?auto_512677 ?auto_512683 ) ) ( not ( = ?auto_512677 ?auto_512684 ) ) ( not ( = ?auto_512677 ?auto_512685 ) ) ( not ( = ?auto_512678 ?auto_512679 ) ) ( not ( = ?auto_512678 ?auto_512680 ) ) ( not ( = ?auto_512678 ?auto_512681 ) ) ( not ( = ?auto_512678 ?auto_512682 ) ) ( not ( = ?auto_512678 ?auto_512683 ) ) ( not ( = ?auto_512678 ?auto_512684 ) ) ( not ( = ?auto_512678 ?auto_512685 ) ) ( not ( = ?auto_512679 ?auto_512680 ) ) ( not ( = ?auto_512679 ?auto_512681 ) ) ( not ( = ?auto_512679 ?auto_512682 ) ) ( not ( = ?auto_512679 ?auto_512683 ) ) ( not ( = ?auto_512679 ?auto_512684 ) ) ( not ( = ?auto_512679 ?auto_512685 ) ) ( not ( = ?auto_512680 ?auto_512681 ) ) ( not ( = ?auto_512680 ?auto_512682 ) ) ( not ( = ?auto_512680 ?auto_512683 ) ) ( not ( = ?auto_512680 ?auto_512684 ) ) ( not ( = ?auto_512680 ?auto_512685 ) ) ( not ( = ?auto_512681 ?auto_512682 ) ) ( not ( = ?auto_512681 ?auto_512683 ) ) ( not ( = ?auto_512681 ?auto_512684 ) ) ( not ( = ?auto_512681 ?auto_512685 ) ) ( not ( = ?auto_512682 ?auto_512683 ) ) ( not ( = ?auto_512682 ?auto_512684 ) ) ( not ( = ?auto_512682 ?auto_512685 ) ) ( not ( = ?auto_512683 ?auto_512684 ) ) ( not ( = ?auto_512683 ?auto_512685 ) ) ( not ( = ?auto_512684 ?auto_512685 ) ) ( ON ?auto_512683 ?auto_512684 ) ( ON ?auto_512682 ?auto_512683 ) ( ON ?auto_512681 ?auto_512682 ) ( ON ?auto_512680 ?auto_512681 ) ( ON ?auto_512679 ?auto_512680 ) ( CLEAR ?auto_512677 ) ( ON ?auto_512678 ?auto_512679 ) ( CLEAR ?auto_512678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_512671 ?auto_512672 ?auto_512673 ?auto_512674 ?auto_512675 ?auto_512676 ?auto_512677 ?auto_512678 )
      ( MAKE-14PILE ?auto_512671 ?auto_512672 ?auto_512673 ?auto_512674 ?auto_512675 ?auto_512676 ?auto_512677 ?auto_512678 ?auto_512679 ?auto_512680 ?auto_512681 ?auto_512682 ?auto_512683 ?auto_512684 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512729 - BLOCK
      ?auto_512730 - BLOCK
      ?auto_512731 - BLOCK
      ?auto_512732 - BLOCK
      ?auto_512733 - BLOCK
      ?auto_512734 - BLOCK
      ?auto_512735 - BLOCK
      ?auto_512736 - BLOCK
      ?auto_512737 - BLOCK
      ?auto_512738 - BLOCK
      ?auto_512739 - BLOCK
      ?auto_512740 - BLOCK
      ?auto_512741 - BLOCK
      ?auto_512742 - BLOCK
    )
    :vars
    (
      ?auto_512743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512742 ?auto_512743 ) ( ON-TABLE ?auto_512729 ) ( ON ?auto_512730 ?auto_512729 ) ( ON ?auto_512731 ?auto_512730 ) ( ON ?auto_512732 ?auto_512731 ) ( ON ?auto_512733 ?auto_512732 ) ( ON ?auto_512734 ?auto_512733 ) ( not ( = ?auto_512729 ?auto_512730 ) ) ( not ( = ?auto_512729 ?auto_512731 ) ) ( not ( = ?auto_512729 ?auto_512732 ) ) ( not ( = ?auto_512729 ?auto_512733 ) ) ( not ( = ?auto_512729 ?auto_512734 ) ) ( not ( = ?auto_512729 ?auto_512735 ) ) ( not ( = ?auto_512729 ?auto_512736 ) ) ( not ( = ?auto_512729 ?auto_512737 ) ) ( not ( = ?auto_512729 ?auto_512738 ) ) ( not ( = ?auto_512729 ?auto_512739 ) ) ( not ( = ?auto_512729 ?auto_512740 ) ) ( not ( = ?auto_512729 ?auto_512741 ) ) ( not ( = ?auto_512729 ?auto_512742 ) ) ( not ( = ?auto_512729 ?auto_512743 ) ) ( not ( = ?auto_512730 ?auto_512731 ) ) ( not ( = ?auto_512730 ?auto_512732 ) ) ( not ( = ?auto_512730 ?auto_512733 ) ) ( not ( = ?auto_512730 ?auto_512734 ) ) ( not ( = ?auto_512730 ?auto_512735 ) ) ( not ( = ?auto_512730 ?auto_512736 ) ) ( not ( = ?auto_512730 ?auto_512737 ) ) ( not ( = ?auto_512730 ?auto_512738 ) ) ( not ( = ?auto_512730 ?auto_512739 ) ) ( not ( = ?auto_512730 ?auto_512740 ) ) ( not ( = ?auto_512730 ?auto_512741 ) ) ( not ( = ?auto_512730 ?auto_512742 ) ) ( not ( = ?auto_512730 ?auto_512743 ) ) ( not ( = ?auto_512731 ?auto_512732 ) ) ( not ( = ?auto_512731 ?auto_512733 ) ) ( not ( = ?auto_512731 ?auto_512734 ) ) ( not ( = ?auto_512731 ?auto_512735 ) ) ( not ( = ?auto_512731 ?auto_512736 ) ) ( not ( = ?auto_512731 ?auto_512737 ) ) ( not ( = ?auto_512731 ?auto_512738 ) ) ( not ( = ?auto_512731 ?auto_512739 ) ) ( not ( = ?auto_512731 ?auto_512740 ) ) ( not ( = ?auto_512731 ?auto_512741 ) ) ( not ( = ?auto_512731 ?auto_512742 ) ) ( not ( = ?auto_512731 ?auto_512743 ) ) ( not ( = ?auto_512732 ?auto_512733 ) ) ( not ( = ?auto_512732 ?auto_512734 ) ) ( not ( = ?auto_512732 ?auto_512735 ) ) ( not ( = ?auto_512732 ?auto_512736 ) ) ( not ( = ?auto_512732 ?auto_512737 ) ) ( not ( = ?auto_512732 ?auto_512738 ) ) ( not ( = ?auto_512732 ?auto_512739 ) ) ( not ( = ?auto_512732 ?auto_512740 ) ) ( not ( = ?auto_512732 ?auto_512741 ) ) ( not ( = ?auto_512732 ?auto_512742 ) ) ( not ( = ?auto_512732 ?auto_512743 ) ) ( not ( = ?auto_512733 ?auto_512734 ) ) ( not ( = ?auto_512733 ?auto_512735 ) ) ( not ( = ?auto_512733 ?auto_512736 ) ) ( not ( = ?auto_512733 ?auto_512737 ) ) ( not ( = ?auto_512733 ?auto_512738 ) ) ( not ( = ?auto_512733 ?auto_512739 ) ) ( not ( = ?auto_512733 ?auto_512740 ) ) ( not ( = ?auto_512733 ?auto_512741 ) ) ( not ( = ?auto_512733 ?auto_512742 ) ) ( not ( = ?auto_512733 ?auto_512743 ) ) ( not ( = ?auto_512734 ?auto_512735 ) ) ( not ( = ?auto_512734 ?auto_512736 ) ) ( not ( = ?auto_512734 ?auto_512737 ) ) ( not ( = ?auto_512734 ?auto_512738 ) ) ( not ( = ?auto_512734 ?auto_512739 ) ) ( not ( = ?auto_512734 ?auto_512740 ) ) ( not ( = ?auto_512734 ?auto_512741 ) ) ( not ( = ?auto_512734 ?auto_512742 ) ) ( not ( = ?auto_512734 ?auto_512743 ) ) ( not ( = ?auto_512735 ?auto_512736 ) ) ( not ( = ?auto_512735 ?auto_512737 ) ) ( not ( = ?auto_512735 ?auto_512738 ) ) ( not ( = ?auto_512735 ?auto_512739 ) ) ( not ( = ?auto_512735 ?auto_512740 ) ) ( not ( = ?auto_512735 ?auto_512741 ) ) ( not ( = ?auto_512735 ?auto_512742 ) ) ( not ( = ?auto_512735 ?auto_512743 ) ) ( not ( = ?auto_512736 ?auto_512737 ) ) ( not ( = ?auto_512736 ?auto_512738 ) ) ( not ( = ?auto_512736 ?auto_512739 ) ) ( not ( = ?auto_512736 ?auto_512740 ) ) ( not ( = ?auto_512736 ?auto_512741 ) ) ( not ( = ?auto_512736 ?auto_512742 ) ) ( not ( = ?auto_512736 ?auto_512743 ) ) ( not ( = ?auto_512737 ?auto_512738 ) ) ( not ( = ?auto_512737 ?auto_512739 ) ) ( not ( = ?auto_512737 ?auto_512740 ) ) ( not ( = ?auto_512737 ?auto_512741 ) ) ( not ( = ?auto_512737 ?auto_512742 ) ) ( not ( = ?auto_512737 ?auto_512743 ) ) ( not ( = ?auto_512738 ?auto_512739 ) ) ( not ( = ?auto_512738 ?auto_512740 ) ) ( not ( = ?auto_512738 ?auto_512741 ) ) ( not ( = ?auto_512738 ?auto_512742 ) ) ( not ( = ?auto_512738 ?auto_512743 ) ) ( not ( = ?auto_512739 ?auto_512740 ) ) ( not ( = ?auto_512739 ?auto_512741 ) ) ( not ( = ?auto_512739 ?auto_512742 ) ) ( not ( = ?auto_512739 ?auto_512743 ) ) ( not ( = ?auto_512740 ?auto_512741 ) ) ( not ( = ?auto_512740 ?auto_512742 ) ) ( not ( = ?auto_512740 ?auto_512743 ) ) ( not ( = ?auto_512741 ?auto_512742 ) ) ( not ( = ?auto_512741 ?auto_512743 ) ) ( not ( = ?auto_512742 ?auto_512743 ) ) ( ON ?auto_512741 ?auto_512742 ) ( ON ?auto_512740 ?auto_512741 ) ( ON ?auto_512739 ?auto_512740 ) ( ON ?auto_512738 ?auto_512739 ) ( ON ?auto_512737 ?auto_512738 ) ( ON ?auto_512736 ?auto_512737 ) ( CLEAR ?auto_512734 ) ( ON ?auto_512735 ?auto_512736 ) ( CLEAR ?auto_512735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_512729 ?auto_512730 ?auto_512731 ?auto_512732 ?auto_512733 ?auto_512734 ?auto_512735 )
      ( MAKE-14PILE ?auto_512729 ?auto_512730 ?auto_512731 ?auto_512732 ?auto_512733 ?auto_512734 ?auto_512735 ?auto_512736 ?auto_512737 ?auto_512738 ?auto_512739 ?auto_512740 ?auto_512741 ?auto_512742 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512787 - BLOCK
      ?auto_512788 - BLOCK
      ?auto_512789 - BLOCK
      ?auto_512790 - BLOCK
      ?auto_512791 - BLOCK
      ?auto_512792 - BLOCK
      ?auto_512793 - BLOCK
      ?auto_512794 - BLOCK
      ?auto_512795 - BLOCK
      ?auto_512796 - BLOCK
      ?auto_512797 - BLOCK
      ?auto_512798 - BLOCK
      ?auto_512799 - BLOCK
      ?auto_512800 - BLOCK
    )
    :vars
    (
      ?auto_512801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512800 ?auto_512801 ) ( ON-TABLE ?auto_512787 ) ( ON ?auto_512788 ?auto_512787 ) ( ON ?auto_512789 ?auto_512788 ) ( ON ?auto_512790 ?auto_512789 ) ( ON ?auto_512791 ?auto_512790 ) ( not ( = ?auto_512787 ?auto_512788 ) ) ( not ( = ?auto_512787 ?auto_512789 ) ) ( not ( = ?auto_512787 ?auto_512790 ) ) ( not ( = ?auto_512787 ?auto_512791 ) ) ( not ( = ?auto_512787 ?auto_512792 ) ) ( not ( = ?auto_512787 ?auto_512793 ) ) ( not ( = ?auto_512787 ?auto_512794 ) ) ( not ( = ?auto_512787 ?auto_512795 ) ) ( not ( = ?auto_512787 ?auto_512796 ) ) ( not ( = ?auto_512787 ?auto_512797 ) ) ( not ( = ?auto_512787 ?auto_512798 ) ) ( not ( = ?auto_512787 ?auto_512799 ) ) ( not ( = ?auto_512787 ?auto_512800 ) ) ( not ( = ?auto_512787 ?auto_512801 ) ) ( not ( = ?auto_512788 ?auto_512789 ) ) ( not ( = ?auto_512788 ?auto_512790 ) ) ( not ( = ?auto_512788 ?auto_512791 ) ) ( not ( = ?auto_512788 ?auto_512792 ) ) ( not ( = ?auto_512788 ?auto_512793 ) ) ( not ( = ?auto_512788 ?auto_512794 ) ) ( not ( = ?auto_512788 ?auto_512795 ) ) ( not ( = ?auto_512788 ?auto_512796 ) ) ( not ( = ?auto_512788 ?auto_512797 ) ) ( not ( = ?auto_512788 ?auto_512798 ) ) ( not ( = ?auto_512788 ?auto_512799 ) ) ( not ( = ?auto_512788 ?auto_512800 ) ) ( not ( = ?auto_512788 ?auto_512801 ) ) ( not ( = ?auto_512789 ?auto_512790 ) ) ( not ( = ?auto_512789 ?auto_512791 ) ) ( not ( = ?auto_512789 ?auto_512792 ) ) ( not ( = ?auto_512789 ?auto_512793 ) ) ( not ( = ?auto_512789 ?auto_512794 ) ) ( not ( = ?auto_512789 ?auto_512795 ) ) ( not ( = ?auto_512789 ?auto_512796 ) ) ( not ( = ?auto_512789 ?auto_512797 ) ) ( not ( = ?auto_512789 ?auto_512798 ) ) ( not ( = ?auto_512789 ?auto_512799 ) ) ( not ( = ?auto_512789 ?auto_512800 ) ) ( not ( = ?auto_512789 ?auto_512801 ) ) ( not ( = ?auto_512790 ?auto_512791 ) ) ( not ( = ?auto_512790 ?auto_512792 ) ) ( not ( = ?auto_512790 ?auto_512793 ) ) ( not ( = ?auto_512790 ?auto_512794 ) ) ( not ( = ?auto_512790 ?auto_512795 ) ) ( not ( = ?auto_512790 ?auto_512796 ) ) ( not ( = ?auto_512790 ?auto_512797 ) ) ( not ( = ?auto_512790 ?auto_512798 ) ) ( not ( = ?auto_512790 ?auto_512799 ) ) ( not ( = ?auto_512790 ?auto_512800 ) ) ( not ( = ?auto_512790 ?auto_512801 ) ) ( not ( = ?auto_512791 ?auto_512792 ) ) ( not ( = ?auto_512791 ?auto_512793 ) ) ( not ( = ?auto_512791 ?auto_512794 ) ) ( not ( = ?auto_512791 ?auto_512795 ) ) ( not ( = ?auto_512791 ?auto_512796 ) ) ( not ( = ?auto_512791 ?auto_512797 ) ) ( not ( = ?auto_512791 ?auto_512798 ) ) ( not ( = ?auto_512791 ?auto_512799 ) ) ( not ( = ?auto_512791 ?auto_512800 ) ) ( not ( = ?auto_512791 ?auto_512801 ) ) ( not ( = ?auto_512792 ?auto_512793 ) ) ( not ( = ?auto_512792 ?auto_512794 ) ) ( not ( = ?auto_512792 ?auto_512795 ) ) ( not ( = ?auto_512792 ?auto_512796 ) ) ( not ( = ?auto_512792 ?auto_512797 ) ) ( not ( = ?auto_512792 ?auto_512798 ) ) ( not ( = ?auto_512792 ?auto_512799 ) ) ( not ( = ?auto_512792 ?auto_512800 ) ) ( not ( = ?auto_512792 ?auto_512801 ) ) ( not ( = ?auto_512793 ?auto_512794 ) ) ( not ( = ?auto_512793 ?auto_512795 ) ) ( not ( = ?auto_512793 ?auto_512796 ) ) ( not ( = ?auto_512793 ?auto_512797 ) ) ( not ( = ?auto_512793 ?auto_512798 ) ) ( not ( = ?auto_512793 ?auto_512799 ) ) ( not ( = ?auto_512793 ?auto_512800 ) ) ( not ( = ?auto_512793 ?auto_512801 ) ) ( not ( = ?auto_512794 ?auto_512795 ) ) ( not ( = ?auto_512794 ?auto_512796 ) ) ( not ( = ?auto_512794 ?auto_512797 ) ) ( not ( = ?auto_512794 ?auto_512798 ) ) ( not ( = ?auto_512794 ?auto_512799 ) ) ( not ( = ?auto_512794 ?auto_512800 ) ) ( not ( = ?auto_512794 ?auto_512801 ) ) ( not ( = ?auto_512795 ?auto_512796 ) ) ( not ( = ?auto_512795 ?auto_512797 ) ) ( not ( = ?auto_512795 ?auto_512798 ) ) ( not ( = ?auto_512795 ?auto_512799 ) ) ( not ( = ?auto_512795 ?auto_512800 ) ) ( not ( = ?auto_512795 ?auto_512801 ) ) ( not ( = ?auto_512796 ?auto_512797 ) ) ( not ( = ?auto_512796 ?auto_512798 ) ) ( not ( = ?auto_512796 ?auto_512799 ) ) ( not ( = ?auto_512796 ?auto_512800 ) ) ( not ( = ?auto_512796 ?auto_512801 ) ) ( not ( = ?auto_512797 ?auto_512798 ) ) ( not ( = ?auto_512797 ?auto_512799 ) ) ( not ( = ?auto_512797 ?auto_512800 ) ) ( not ( = ?auto_512797 ?auto_512801 ) ) ( not ( = ?auto_512798 ?auto_512799 ) ) ( not ( = ?auto_512798 ?auto_512800 ) ) ( not ( = ?auto_512798 ?auto_512801 ) ) ( not ( = ?auto_512799 ?auto_512800 ) ) ( not ( = ?auto_512799 ?auto_512801 ) ) ( not ( = ?auto_512800 ?auto_512801 ) ) ( ON ?auto_512799 ?auto_512800 ) ( ON ?auto_512798 ?auto_512799 ) ( ON ?auto_512797 ?auto_512798 ) ( ON ?auto_512796 ?auto_512797 ) ( ON ?auto_512795 ?auto_512796 ) ( ON ?auto_512794 ?auto_512795 ) ( ON ?auto_512793 ?auto_512794 ) ( CLEAR ?auto_512791 ) ( ON ?auto_512792 ?auto_512793 ) ( CLEAR ?auto_512792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_512787 ?auto_512788 ?auto_512789 ?auto_512790 ?auto_512791 ?auto_512792 )
      ( MAKE-14PILE ?auto_512787 ?auto_512788 ?auto_512789 ?auto_512790 ?auto_512791 ?auto_512792 ?auto_512793 ?auto_512794 ?auto_512795 ?auto_512796 ?auto_512797 ?auto_512798 ?auto_512799 ?auto_512800 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512845 - BLOCK
      ?auto_512846 - BLOCK
      ?auto_512847 - BLOCK
      ?auto_512848 - BLOCK
      ?auto_512849 - BLOCK
      ?auto_512850 - BLOCK
      ?auto_512851 - BLOCK
      ?auto_512852 - BLOCK
      ?auto_512853 - BLOCK
      ?auto_512854 - BLOCK
      ?auto_512855 - BLOCK
      ?auto_512856 - BLOCK
      ?auto_512857 - BLOCK
      ?auto_512858 - BLOCK
    )
    :vars
    (
      ?auto_512859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512858 ?auto_512859 ) ( ON-TABLE ?auto_512845 ) ( ON ?auto_512846 ?auto_512845 ) ( ON ?auto_512847 ?auto_512846 ) ( ON ?auto_512848 ?auto_512847 ) ( not ( = ?auto_512845 ?auto_512846 ) ) ( not ( = ?auto_512845 ?auto_512847 ) ) ( not ( = ?auto_512845 ?auto_512848 ) ) ( not ( = ?auto_512845 ?auto_512849 ) ) ( not ( = ?auto_512845 ?auto_512850 ) ) ( not ( = ?auto_512845 ?auto_512851 ) ) ( not ( = ?auto_512845 ?auto_512852 ) ) ( not ( = ?auto_512845 ?auto_512853 ) ) ( not ( = ?auto_512845 ?auto_512854 ) ) ( not ( = ?auto_512845 ?auto_512855 ) ) ( not ( = ?auto_512845 ?auto_512856 ) ) ( not ( = ?auto_512845 ?auto_512857 ) ) ( not ( = ?auto_512845 ?auto_512858 ) ) ( not ( = ?auto_512845 ?auto_512859 ) ) ( not ( = ?auto_512846 ?auto_512847 ) ) ( not ( = ?auto_512846 ?auto_512848 ) ) ( not ( = ?auto_512846 ?auto_512849 ) ) ( not ( = ?auto_512846 ?auto_512850 ) ) ( not ( = ?auto_512846 ?auto_512851 ) ) ( not ( = ?auto_512846 ?auto_512852 ) ) ( not ( = ?auto_512846 ?auto_512853 ) ) ( not ( = ?auto_512846 ?auto_512854 ) ) ( not ( = ?auto_512846 ?auto_512855 ) ) ( not ( = ?auto_512846 ?auto_512856 ) ) ( not ( = ?auto_512846 ?auto_512857 ) ) ( not ( = ?auto_512846 ?auto_512858 ) ) ( not ( = ?auto_512846 ?auto_512859 ) ) ( not ( = ?auto_512847 ?auto_512848 ) ) ( not ( = ?auto_512847 ?auto_512849 ) ) ( not ( = ?auto_512847 ?auto_512850 ) ) ( not ( = ?auto_512847 ?auto_512851 ) ) ( not ( = ?auto_512847 ?auto_512852 ) ) ( not ( = ?auto_512847 ?auto_512853 ) ) ( not ( = ?auto_512847 ?auto_512854 ) ) ( not ( = ?auto_512847 ?auto_512855 ) ) ( not ( = ?auto_512847 ?auto_512856 ) ) ( not ( = ?auto_512847 ?auto_512857 ) ) ( not ( = ?auto_512847 ?auto_512858 ) ) ( not ( = ?auto_512847 ?auto_512859 ) ) ( not ( = ?auto_512848 ?auto_512849 ) ) ( not ( = ?auto_512848 ?auto_512850 ) ) ( not ( = ?auto_512848 ?auto_512851 ) ) ( not ( = ?auto_512848 ?auto_512852 ) ) ( not ( = ?auto_512848 ?auto_512853 ) ) ( not ( = ?auto_512848 ?auto_512854 ) ) ( not ( = ?auto_512848 ?auto_512855 ) ) ( not ( = ?auto_512848 ?auto_512856 ) ) ( not ( = ?auto_512848 ?auto_512857 ) ) ( not ( = ?auto_512848 ?auto_512858 ) ) ( not ( = ?auto_512848 ?auto_512859 ) ) ( not ( = ?auto_512849 ?auto_512850 ) ) ( not ( = ?auto_512849 ?auto_512851 ) ) ( not ( = ?auto_512849 ?auto_512852 ) ) ( not ( = ?auto_512849 ?auto_512853 ) ) ( not ( = ?auto_512849 ?auto_512854 ) ) ( not ( = ?auto_512849 ?auto_512855 ) ) ( not ( = ?auto_512849 ?auto_512856 ) ) ( not ( = ?auto_512849 ?auto_512857 ) ) ( not ( = ?auto_512849 ?auto_512858 ) ) ( not ( = ?auto_512849 ?auto_512859 ) ) ( not ( = ?auto_512850 ?auto_512851 ) ) ( not ( = ?auto_512850 ?auto_512852 ) ) ( not ( = ?auto_512850 ?auto_512853 ) ) ( not ( = ?auto_512850 ?auto_512854 ) ) ( not ( = ?auto_512850 ?auto_512855 ) ) ( not ( = ?auto_512850 ?auto_512856 ) ) ( not ( = ?auto_512850 ?auto_512857 ) ) ( not ( = ?auto_512850 ?auto_512858 ) ) ( not ( = ?auto_512850 ?auto_512859 ) ) ( not ( = ?auto_512851 ?auto_512852 ) ) ( not ( = ?auto_512851 ?auto_512853 ) ) ( not ( = ?auto_512851 ?auto_512854 ) ) ( not ( = ?auto_512851 ?auto_512855 ) ) ( not ( = ?auto_512851 ?auto_512856 ) ) ( not ( = ?auto_512851 ?auto_512857 ) ) ( not ( = ?auto_512851 ?auto_512858 ) ) ( not ( = ?auto_512851 ?auto_512859 ) ) ( not ( = ?auto_512852 ?auto_512853 ) ) ( not ( = ?auto_512852 ?auto_512854 ) ) ( not ( = ?auto_512852 ?auto_512855 ) ) ( not ( = ?auto_512852 ?auto_512856 ) ) ( not ( = ?auto_512852 ?auto_512857 ) ) ( not ( = ?auto_512852 ?auto_512858 ) ) ( not ( = ?auto_512852 ?auto_512859 ) ) ( not ( = ?auto_512853 ?auto_512854 ) ) ( not ( = ?auto_512853 ?auto_512855 ) ) ( not ( = ?auto_512853 ?auto_512856 ) ) ( not ( = ?auto_512853 ?auto_512857 ) ) ( not ( = ?auto_512853 ?auto_512858 ) ) ( not ( = ?auto_512853 ?auto_512859 ) ) ( not ( = ?auto_512854 ?auto_512855 ) ) ( not ( = ?auto_512854 ?auto_512856 ) ) ( not ( = ?auto_512854 ?auto_512857 ) ) ( not ( = ?auto_512854 ?auto_512858 ) ) ( not ( = ?auto_512854 ?auto_512859 ) ) ( not ( = ?auto_512855 ?auto_512856 ) ) ( not ( = ?auto_512855 ?auto_512857 ) ) ( not ( = ?auto_512855 ?auto_512858 ) ) ( not ( = ?auto_512855 ?auto_512859 ) ) ( not ( = ?auto_512856 ?auto_512857 ) ) ( not ( = ?auto_512856 ?auto_512858 ) ) ( not ( = ?auto_512856 ?auto_512859 ) ) ( not ( = ?auto_512857 ?auto_512858 ) ) ( not ( = ?auto_512857 ?auto_512859 ) ) ( not ( = ?auto_512858 ?auto_512859 ) ) ( ON ?auto_512857 ?auto_512858 ) ( ON ?auto_512856 ?auto_512857 ) ( ON ?auto_512855 ?auto_512856 ) ( ON ?auto_512854 ?auto_512855 ) ( ON ?auto_512853 ?auto_512854 ) ( ON ?auto_512852 ?auto_512853 ) ( ON ?auto_512851 ?auto_512852 ) ( ON ?auto_512850 ?auto_512851 ) ( CLEAR ?auto_512848 ) ( ON ?auto_512849 ?auto_512850 ) ( CLEAR ?auto_512849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_512845 ?auto_512846 ?auto_512847 ?auto_512848 ?auto_512849 )
      ( MAKE-14PILE ?auto_512845 ?auto_512846 ?auto_512847 ?auto_512848 ?auto_512849 ?auto_512850 ?auto_512851 ?auto_512852 ?auto_512853 ?auto_512854 ?auto_512855 ?auto_512856 ?auto_512857 ?auto_512858 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512903 - BLOCK
      ?auto_512904 - BLOCK
      ?auto_512905 - BLOCK
      ?auto_512906 - BLOCK
      ?auto_512907 - BLOCK
      ?auto_512908 - BLOCK
      ?auto_512909 - BLOCK
      ?auto_512910 - BLOCK
      ?auto_512911 - BLOCK
      ?auto_512912 - BLOCK
      ?auto_512913 - BLOCK
      ?auto_512914 - BLOCK
      ?auto_512915 - BLOCK
      ?auto_512916 - BLOCK
    )
    :vars
    (
      ?auto_512917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512916 ?auto_512917 ) ( ON-TABLE ?auto_512903 ) ( ON ?auto_512904 ?auto_512903 ) ( ON ?auto_512905 ?auto_512904 ) ( not ( = ?auto_512903 ?auto_512904 ) ) ( not ( = ?auto_512903 ?auto_512905 ) ) ( not ( = ?auto_512903 ?auto_512906 ) ) ( not ( = ?auto_512903 ?auto_512907 ) ) ( not ( = ?auto_512903 ?auto_512908 ) ) ( not ( = ?auto_512903 ?auto_512909 ) ) ( not ( = ?auto_512903 ?auto_512910 ) ) ( not ( = ?auto_512903 ?auto_512911 ) ) ( not ( = ?auto_512903 ?auto_512912 ) ) ( not ( = ?auto_512903 ?auto_512913 ) ) ( not ( = ?auto_512903 ?auto_512914 ) ) ( not ( = ?auto_512903 ?auto_512915 ) ) ( not ( = ?auto_512903 ?auto_512916 ) ) ( not ( = ?auto_512903 ?auto_512917 ) ) ( not ( = ?auto_512904 ?auto_512905 ) ) ( not ( = ?auto_512904 ?auto_512906 ) ) ( not ( = ?auto_512904 ?auto_512907 ) ) ( not ( = ?auto_512904 ?auto_512908 ) ) ( not ( = ?auto_512904 ?auto_512909 ) ) ( not ( = ?auto_512904 ?auto_512910 ) ) ( not ( = ?auto_512904 ?auto_512911 ) ) ( not ( = ?auto_512904 ?auto_512912 ) ) ( not ( = ?auto_512904 ?auto_512913 ) ) ( not ( = ?auto_512904 ?auto_512914 ) ) ( not ( = ?auto_512904 ?auto_512915 ) ) ( not ( = ?auto_512904 ?auto_512916 ) ) ( not ( = ?auto_512904 ?auto_512917 ) ) ( not ( = ?auto_512905 ?auto_512906 ) ) ( not ( = ?auto_512905 ?auto_512907 ) ) ( not ( = ?auto_512905 ?auto_512908 ) ) ( not ( = ?auto_512905 ?auto_512909 ) ) ( not ( = ?auto_512905 ?auto_512910 ) ) ( not ( = ?auto_512905 ?auto_512911 ) ) ( not ( = ?auto_512905 ?auto_512912 ) ) ( not ( = ?auto_512905 ?auto_512913 ) ) ( not ( = ?auto_512905 ?auto_512914 ) ) ( not ( = ?auto_512905 ?auto_512915 ) ) ( not ( = ?auto_512905 ?auto_512916 ) ) ( not ( = ?auto_512905 ?auto_512917 ) ) ( not ( = ?auto_512906 ?auto_512907 ) ) ( not ( = ?auto_512906 ?auto_512908 ) ) ( not ( = ?auto_512906 ?auto_512909 ) ) ( not ( = ?auto_512906 ?auto_512910 ) ) ( not ( = ?auto_512906 ?auto_512911 ) ) ( not ( = ?auto_512906 ?auto_512912 ) ) ( not ( = ?auto_512906 ?auto_512913 ) ) ( not ( = ?auto_512906 ?auto_512914 ) ) ( not ( = ?auto_512906 ?auto_512915 ) ) ( not ( = ?auto_512906 ?auto_512916 ) ) ( not ( = ?auto_512906 ?auto_512917 ) ) ( not ( = ?auto_512907 ?auto_512908 ) ) ( not ( = ?auto_512907 ?auto_512909 ) ) ( not ( = ?auto_512907 ?auto_512910 ) ) ( not ( = ?auto_512907 ?auto_512911 ) ) ( not ( = ?auto_512907 ?auto_512912 ) ) ( not ( = ?auto_512907 ?auto_512913 ) ) ( not ( = ?auto_512907 ?auto_512914 ) ) ( not ( = ?auto_512907 ?auto_512915 ) ) ( not ( = ?auto_512907 ?auto_512916 ) ) ( not ( = ?auto_512907 ?auto_512917 ) ) ( not ( = ?auto_512908 ?auto_512909 ) ) ( not ( = ?auto_512908 ?auto_512910 ) ) ( not ( = ?auto_512908 ?auto_512911 ) ) ( not ( = ?auto_512908 ?auto_512912 ) ) ( not ( = ?auto_512908 ?auto_512913 ) ) ( not ( = ?auto_512908 ?auto_512914 ) ) ( not ( = ?auto_512908 ?auto_512915 ) ) ( not ( = ?auto_512908 ?auto_512916 ) ) ( not ( = ?auto_512908 ?auto_512917 ) ) ( not ( = ?auto_512909 ?auto_512910 ) ) ( not ( = ?auto_512909 ?auto_512911 ) ) ( not ( = ?auto_512909 ?auto_512912 ) ) ( not ( = ?auto_512909 ?auto_512913 ) ) ( not ( = ?auto_512909 ?auto_512914 ) ) ( not ( = ?auto_512909 ?auto_512915 ) ) ( not ( = ?auto_512909 ?auto_512916 ) ) ( not ( = ?auto_512909 ?auto_512917 ) ) ( not ( = ?auto_512910 ?auto_512911 ) ) ( not ( = ?auto_512910 ?auto_512912 ) ) ( not ( = ?auto_512910 ?auto_512913 ) ) ( not ( = ?auto_512910 ?auto_512914 ) ) ( not ( = ?auto_512910 ?auto_512915 ) ) ( not ( = ?auto_512910 ?auto_512916 ) ) ( not ( = ?auto_512910 ?auto_512917 ) ) ( not ( = ?auto_512911 ?auto_512912 ) ) ( not ( = ?auto_512911 ?auto_512913 ) ) ( not ( = ?auto_512911 ?auto_512914 ) ) ( not ( = ?auto_512911 ?auto_512915 ) ) ( not ( = ?auto_512911 ?auto_512916 ) ) ( not ( = ?auto_512911 ?auto_512917 ) ) ( not ( = ?auto_512912 ?auto_512913 ) ) ( not ( = ?auto_512912 ?auto_512914 ) ) ( not ( = ?auto_512912 ?auto_512915 ) ) ( not ( = ?auto_512912 ?auto_512916 ) ) ( not ( = ?auto_512912 ?auto_512917 ) ) ( not ( = ?auto_512913 ?auto_512914 ) ) ( not ( = ?auto_512913 ?auto_512915 ) ) ( not ( = ?auto_512913 ?auto_512916 ) ) ( not ( = ?auto_512913 ?auto_512917 ) ) ( not ( = ?auto_512914 ?auto_512915 ) ) ( not ( = ?auto_512914 ?auto_512916 ) ) ( not ( = ?auto_512914 ?auto_512917 ) ) ( not ( = ?auto_512915 ?auto_512916 ) ) ( not ( = ?auto_512915 ?auto_512917 ) ) ( not ( = ?auto_512916 ?auto_512917 ) ) ( ON ?auto_512915 ?auto_512916 ) ( ON ?auto_512914 ?auto_512915 ) ( ON ?auto_512913 ?auto_512914 ) ( ON ?auto_512912 ?auto_512913 ) ( ON ?auto_512911 ?auto_512912 ) ( ON ?auto_512910 ?auto_512911 ) ( ON ?auto_512909 ?auto_512910 ) ( ON ?auto_512908 ?auto_512909 ) ( ON ?auto_512907 ?auto_512908 ) ( CLEAR ?auto_512905 ) ( ON ?auto_512906 ?auto_512907 ) ( CLEAR ?auto_512906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_512903 ?auto_512904 ?auto_512905 ?auto_512906 )
      ( MAKE-14PILE ?auto_512903 ?auto_512904 ?auto_512905 ?auto_512906 ?auto_512907 ?auto_512908 ?auto_512909 ?auto_512910 ?auto_512911 ?auto_512912 ?auto_512913 ?auto_512914 ?auto_512915 ?auto_512916 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_512961 - BLOCK
      ?auto_512962 - BLOCK
      ?auto_512963 - BLOCK
      ?auto_512964 - BLOCK
      ?auto_512965 - BLOCK
      ?auto_512966 - BLOCK
      ?auto_512967 - BLOCK
      ?auto_512968 - BLOCK
      ?auto_512969 - BLOCK
      ?auto_512970 - BLOCK
      ?auto_512971 - BLOCK
      ?auto_512972 - BLOCK
      ?auto_512973 - BLOCK
      ?auto_512974 - BLOCK
    )
    :vars
    (
      ?auto_512975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_512974 ?auto_512975 ) ( ON-TABLE ?auto_512961 ) ( ON ?auto_512962 ?auto_512961 ) ( not ( = ?auto_512961 ?auto_512962 ) ) ( not ( = ?auto_512961 ?auto_512963 ) ) ( not ( = ?auto_512961 ?auto_512964 ) ) ( not ( = ?auto_512961 ?auto_512965 ) ) ( not ( = ?auto_512961 ?auto_512966 ) ) ( not ( = ?auto_512961 ?auto_512967 ) ) ( not ( = ?auto_512961 ?auto_512968 ) ) ( not ( = ?auto_512961 ?auto_512969 ) ) ( not ( = ?auto_512961 ?auto_512970 ) ) ( not ( = ?auto_512961 ?auto_512971 ) ) ( not ( = ?auto_512961 ?auto_512972 ) ) ( not ( = ?auto_512961 ?auto_512973 ) ) ( not ( = ?auto_512961 ?auto_512974 ) ) ( not ( = ?auto_512961 ?auto_512975 ) ) ( not ( = ?auto_512962 ?auto_512963 ) ) ( not ( = ?auto_512962 ?auto_512964 ) ) ( not ( = ?auto_512962 ?auto_512965 ) ) ( not ( = ?auto_512962 ?auto_512966 ) ) ( not ( = ?auto_512962 ?auto_512967 ) ) ( not ( = ?auto_512962 ?auto_512968 ) ) ( not ( = ?auto_512962 ?auto_512969 ) ) ( not ( = ?auto_512962 ?auto_512970 ) ) ( not ( = ?auto_512962 ?auto_512971 ) ) ( not ( = ?auto_512962 ?auto_512972 ) ) ( not ( = ?auto_512962 ?auto_512973 ) ) ( not ( = ?auto_512962 ?auto_512974 ) ) ( not ( = ?auto_512962 ?auto_512975 ) ) ( not ( = ?auto_512963 ?auto_512964 ) ) ( not ( = ?auto_512963 ?auto_512965 ) ) ( not ( = ?auto_512963 ?auto_512966 ) ) ( not ( = ?auto_512963 ?auto_512967 ) ) ( not ( = ?auto_512963 ?auto_512968 ) ) ( not ( = ?auto_512963 ?auto_512969 ) ) ( not ( = ?auto_512963 ?auto_512970 ) ) ( not ( = ?auto_512963 ?auto_512971 ) ) ( not ( = ?auto_512963 ?auto_512972 ) ) ( not ( = ?auto_512963 ?auto_512973 ) ) ( not ( = ?auto_512963 ?auto_512974 ) ) ( not ( = ?auto_512963 ?auto_512975 ) ) ( not ( = ?auto_512964 ?auto_512965 ) ) ( not ( = ?auto_512964 ?auto_512966 ) ) ( not ( = ?auto_512964 ?auto_512967 ) ) ( not ( = ?auto_512964 ?auto_512968 ) ) ( not ( = ?auto_512964 ?auto_512969 ) ) ( not ( = ?auto_512964 ?auto_512970 ) ) ( not ( = ?auto_512964 ?auto_512971 ) ) ( not ( = ?auto_512964 ?auto_512972 ) ) ( not ( = ?auto_512964 ?auto_512973 ) ) ( not ( = ?auto_512964 ?auto_512974 ) ) ( not ( = ?auto_512964 ?auto_512975 ) ) ( not ( = ?auto_512965 ?auto_512966 ) ) ( not ( = ?auto_512965 ?auto_512967 ) ) ( not ( = ?auto_512965 ?auto_512968 ) ) ( not ( = ?auto_512965 ?auto_512969 ) ) ( not ( = ?auto_512965 ?auto_512970 ) ) ( not ( = ?auto_512965 ?auto_512971 ) ) ( not ( = ?auto_512965 ?auto_512972 ) ) ( not ( = ?auto_512965 ?auto_512973 ) ) ( not ( = ?auto_512965 ?auto_512974 ) ) ( not ( = ?auto_512965 ?auto_512975 ) ) ( not ( = ?auto_512966 ?auto_512967 ) ) ( not ( = ?auto_512966 ?auto_512968 ) ) ( not ( = ?auto_512966 ?auto_512969 ) ) ( not ( = ?auto_512966 ?auto_512970 ) ) ( not ( = ?auto_512966 ?auto_512971 ) ) ( not ( = ?auto_512966 ?auto_512972 ) ) ( not ( = ?auto_512966 ?auto_512973 ) ) ( not ( = ?auto_512966 ?auto_512974 ) ) ( not ( = ?auto_512966 ?auto_512975 ) ) ( not ( = ?auto_512967 ?auto_512968 ) ) ( not ( = ?auto_512967 ?auto_512969 ) ) ( not ( = ?auto_512967 ?auto_512970 ) ) ( not ( = ?auto_512967 ?auto_512971 ) ) ( not ( = ?auto_512967 ?auto_512972 ) ) ( not ( = ?auto_512967 ?auto_512973 ) ) ( not ( = ?auto_512967 ?auto_512974 ) ) ( not ( = ?auto_512967 ?auto_512975 ) ) ( not ( = ?auto_512968 ?auto_512969 ) ) ( not ( = ?auto_512968 ?auto_512970 ) ) ( not ( = ?auto_512968 ?auto_512971 ) ) ( not ( = ?auto_512968 ?auto_512972 ) ) ( not ( = ?auto_512968 ?auto_512973 ) ) ( not ( = ?auto_512968 ?auto_512974 ) ) ( not ( = ?auto_512968 ?auto_512975 ) ) ( not ( = ?auto_512969 ?auto_512970 ) ) ( not ( = ?auto_512969 ?auto_512971 ) ) ( not ( = ?auto_512969 ?auto_512972 ) ) ( not ( = ?auto_512969 ?auto_512973 ) ) ( not ( = ?auto_512969 ?auto_512974 ) ) ( not ( = ?auto_512969 ?auto_512975 ) ) ( not ( = ?auto_512970 ?auto_512971 ) ) ( not ( = ?auto_512970 ?auto_512972 ) ) ( not ( = ?auto_512970 ?auto_512973 ) ) ( not ( = ?auto_512970 ?auto_512974 ) ) ( not ( = ?auto_512970 ?auto_512975 ) ) ( not ( = ?auto_512971 ?auto_512972 ) ) ( not ( = ?auto_512971 ?auto_512973 ) ) ( not ( = ?auto_512971 ?auto_512974 ) ) ( not ( = ?auto_512971 ?auto_512975 ) ) ( not ( = ?auto_512972 ?auto_512973 ) ) ( not ( = ?auto_512972 ?auto_512974 ) ) ( not ( = ?auto_512972 ?auto_512975 ) ) ( not ( = ?auto_512973 ?auto_512974 ) ) ( not ( = ?auto_512973 ?auto_512975 ) ) ( not ( = ?auto_512974 ?auto_512975 ) ) ( ON ?auto_512973 ?auto_512974 ) ( ON ?auto_512972 ?auto_512973 ) ( ON ?auto_512971 ?auto_512972 ) ( ON ?auto_512970 ?auto_512971 ) ( ON ?auto_512969 ?auto_512970 ) ( ON ?auto_512968 ?auto_512969 ) ( ON ?auto_512967 ?auto_512968 ) ( ON ?auto_512966 ?auto_512967 ) ( ON ?auto_512965 ?auto_512966 ) ( ON ?auto_512964 ?auto_512965 ) ( CLEAR ?auto_512962 ) ( ON ?auto_512963 ?auto_512964 ) ( CLEAR ?auto_512963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_512961 ?auto_512962 ?auto_512963 )
      ( MAKE-14PILE ?auto_512961 ?auto_512962 ?auto_512963 ?auto_512964 ?auto_512965 ?auto_512966 ?auto_512967 ?auto_512968 ?auto_512969 ?auto_512970 ?auto_512971 ?auto_512972 ?auto_512973 ?auto_512974 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_513019 - BLOCK
      ?auto_513020 - BLOCK
      ?auto_513021 - BLOCK
      ?auto_513022 - BLOCK
      ?auto_513023 - BLOCK
      ?auto_513024 - BLOCK
      ?auto_513025 - BLOCK
      ?auto_513026 - BLOCK
      ?auto_513027 - BLOCK
      ?auto_513028 - BLOCK
      ?auto_513029 - BLOCK
      ?auto_513030 - BLOCK
      ?auto_513031 - BLOCK
      ?auto_513032 - BLOCK
    )
    :vars
    (
      ?auto_513033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513032 ?auto_513033 ) ( ON-TABLE ?auto_513019 ) ( not ( = ?auto_513019 ?auto_513020 ) ) ( not ( = ?auto_513019 ?auto_513021 ) ) ( not ( = ?auto_513019 ?auto_513022 ) ) ( not ( = ?auto_513019 ?auto_513023 ) ) ( not ( = ?auto_513019 ?auto_513024 ) ) ( not ( = ?auto_513019 ?auto_513025 ) ) ( not ( = ?auto_513019 ?auto_513026 ) ) ( not ( = ?auto_513019 ?auto_513027 ) ) ( not ( = ?auto_513019 ?auto_513028 ) ) ( not ( = ?auto_513019 ?auto_513029 ) ) ( not ( = ?auto_513019 ?auto_513030 ) ) ( not ( = ?auto_513019 ?auto_513031 ) ) ( not ( = ?auto_513019 ?auto_513032 ) ) ( not ( = ?auto_513019 ?auto_513033 ) ) ( not ( = ?auto_513020 ?auto_513021 ) ) ( not ( = ?auto_513020 ?auto_513022 ) ) ( not ( = ?auto_513020 ?auto_513023 ) ) ( not ( = ?auto_513020 ?auto_513024 ) ) ( not ( = ?auto_513020 ?auto_513025 ) ) ( not ( = ?auto_513020 ?auto_513026 ) ) ( not ( = ?auto_513020 ?auto_513027 ) ) ( not ( = ?auto_513020 ?auto_513028 ) ) ( not ( = ?auto_513020 ?auto_513029 ) ) ( not ( = ?auto_513020 ?auto_513030 ) ) ( not ( = ?auto_513020 ?auto_513031 ) ) ( not ( = ?auto_513020 ?auto_513032 ) ) ( not ( = ?auto_513020 ?auto_513033 ) ) ( not ( = ?auto_513021 ?auto_513022 ) ) ( not ( = ?auto_513021 ?auto_513023 ) ) ( not ( = ?auto_513021 ?auto_513024 ) ) ( not ( = ?auto_513021 ?auto_513025 ) ) ( not ( = ?auto_513021 ?auto_513026 ) ) ( not ( = ?auto_513021 ?auto_513027 ) ) ( not ( = ?auto_513021 ?auto_513028 ) ) ( not ( = ?auto_513021 ?auto_513029 ) ) ( not ( = ?auto_513021 ?auto_513030 ) ) ( not ( = ?auto_513021 ?auto_513031 ) ) ( not ( = ?auto_513021 ?auto_513032 ) ) ( not ( = ?auto_513021 ?auto_513033 ) ) ( not ( = ?auto_513022 ?auto_513023 ) ) ( not ( = ?auto_513022 ?auto_513024 ) ) ( not ( = ?auto_513022 ?auto_513025 ) ) ( not ( = ?auto_513022 ?auto_513026 ) ) ( not ( = ?auto_513022 ?auto_513027 ) ) ( not ( = ?auto_513022 ?auto_513028 ) ) ( not ( = ?auto_513022 ?auto_513029 ) ) ( not ( = ?auto_513022 ?auto_513030 ) ) ( not ( = ?auto_513022 ?auto_513031 ) ) ( not ( = ?auto_513022 ?auto_513032 ) ) ( not ( = ?auto_513022 ?auto_513033 ) ) ( not ( = ?auto_513023 ?auto_513024 ) ) ( not ( = ?auto_513023 ?auto_513025 ) ) ( not ( = ?auto_513023 ?auto_513026 ) ) ( not ( = ?auto_513023 ?auto_513027 ) ) ( not ( = ?auto_513023 ?auto_513028 ) ) ( not ( = ?auto_513023 ?auto_513029 ) ) ( not ( = ?auto_513023 ?auto_513030 ) ) ( not ( = ?auto_513023 ?auto_513031 ) ) ( not ( = ?auto_513023 ?auto_513032 ) ) ( not ( = ?auto_513023 ?auto_513033 ) ) ( not ( = ?auto_513024 ?auto_513025 ) ) ( not ( = ?auto_513024 ?auto_513026 ) ) ( not ( = ?auto_513024 ?auto_513027 ) ) ( not ( = ?auto_513024 ?auto_513028 ) ) ( not ( = ?auto_513024 ?auto_513029 ) ) ( not ( = ?auto_513024 ?auto_513030 ) ) ( not ( = ?auto_513024 ?auto_513031 ) ) ( not ( = ?auto_513024 ?auto_513032 ) ) ( not ( = ?auto_513024 ?auto_513033 ) ) ( not ( = ?auto_513025 ?auto_513026 ) ) ( not ( = ?auto_513025 ?auto_513027 ) ) ( not ( = ?auto_513025 ?auto_513028 ) ) ( not ( = ?auto_513025 ?auto_513029 ) ) ( not ( = ?auto_513025 ?auto_513030 ) ) ( not ( = ?auto_513025 ?auto_513031 ) ) ( not ( = ?auto_513025 ?auto_513032 ) ) ( not ( = ?auto_513025 ?auto_513033 ) ) ( not ( = ?auto_513026 ?auto_513027 ) ) ( not ( = ?auto_513026 ?auto_513028 ) ) ( not ( = ?auto_513026 ?auto_513029 ) ) ( not ( = ?auto_513026 ?auto_513030 ) ) ( not ( = ?auto_513026 ?auto_513031 ) ) ( not ( = ?auto_513026 ?auto_513032 ) ) ( not ( = ?auto_513026 ?auto_513033 ) ) ( not ( = ?auto_513027 ?auto_513028 ) ) ( not ( = ?auto_513027 ?auto_513029 ) ) ( not ( = ?auto_513027 ?auto_513030 ) ) ( not ( = ?auto_513027 ?auto_513031 ) ) ( not ( = ?auto_513027 ?auto_513032 ) ) ( not ( = ?auto_513027 ?auto_513033 ) ) ( not ( = ?auto_513028 ?auto_513029 ) ) ( not ( = ?auto_513028 ?auto_513030 ) ) ( not ( = ?auto_513028 ?auto_513031 ) ) ( not ( = ?auto_513028 ?auto_513032 ) ) ( not ( = ?auto_513028 ?auto_513033 ) ) ( not ( = ?auto_513029 ?auto_513030 ) ) ( not ( = ?auto_513029 ?auto_513031 ) ) ( not ( = ?auto_513029 ?auto_513032 ) ) ( not ( = ?auto_513029 ?auto_513033 ) ) ( not ( = ?auto_513030 ?auto_513031 ) ) ( not ( = ?auto_513030 ?auto_513032 ) ) ( not ( = ?auto_513030 ?auto_513033 ) ) ( not ( = ?auto_513031 ?auto_513032 ) ) ( not ( = ?auto_513031 ?auto_513033 ) ) ( not ( = ?auto_513032 ?auto_513033 ) ) ( ON ?auto_513031 ?auto_513032 ) ( ON ?auto_513030 ?auto_513031 ) ( ON ?auto_513029 ?auto_513030 ) ( ON ?auto_513028 ?auto_513029 ) ( ON ?auto_513027 ?auto_513028 ) ( ON ?auto_513026 ?auto_513027 ) ( ON ?auto_513025 ?auto_513026 ) ( ON ?auto_513024 ?auto_513025 ) ( ON ?auto_513023 ?auto_513024 ) ( ON ?auto_513022 ?auto_513023 ) ( ON ?auto_513021 ?auto_513022 ) ( CLEAR ?auto_513019 ) ( ON ?auto_513020 ?auto_513021 ) ( CLEAR ?auto_513020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_513019 ?auto_513020 )
      ( MAKE-14PILE ?auto_513019 ?auto_513020 ?auto_513021 ?auto_513022 ?auto_513023 ?auto_513024 ?auto_513025 ?auto_513026 ?auto_513027 ?auto_513028 ?auto_513029 ?auto_513030 ?auto_513031 ?auto_513032 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_513077 - BLOCK
      ?auto_513078 - BLOCK
      ?auto_513079 - BLOCK
      ?auto_513080 - BLOCK
      ?auto_513081 - BLOCK
      ?auto_513082 - BLOCK
      ?auto_513083 - BLOCK
      ?auto_513084 - BLOCK
      ?auto_513085 - BLOCK
      ?auto_513086 - BLOCK
      ?auto_513087 - BLOCK
      ?auto_513088 - BLOCK
      ?auto_513089 - BLOCK
      ?auto_513090 - BLOCK
    )
    :vars
    (
      ?auto_513091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513090 ?auto_513091 ) ( not ( = ?auto_513077 ?auto_513078 ) ) ( not ( = ?auto_513077 ?auto_513079 ) ) ( not ( = ?auto_513077 ?auto_513080 ) ) ( not ( = ?auto_513077 ?auto_513081 ) ) ( not ( = ?auto_513077 ?auto_513082 ) ) ( not ( = ?auto_513077 ?auto_513083 ) ) ( not ( = ?auto_513077 ?auto_513084 ) ) ( not ( = ?auto_513077 ?auto_513085 ) ) ( not ( = ?auto_513077 ?auto_513086 ) ) ( not ( = ?auto_513077 ?auto_513087 ) ) ( not ( = ?auto_513077 ?auto_513088 ) ) ( not ( = ?auto_513077 ?auto_513089 ) ) ( not ( = ?auto_513077 ?auto_513090 ) ) ( not ( = ?auto_513077 ?auto_513091 ) ) ( not ( = ?auto_513078 ?auto_513079 ) ) ( not ( = ?auto_513078 ?auto_513080 ) ) ( not ( = ?auto_513078 ?auto_513081 ) ) ( not ( = ?auto_513078 ?auto_513082 ) ) ( not ( = ?auto_513078 ?auto_513083 ) ) ( not ( = ?auto_513078 ?auto_513084 ) ) ( not ( = ?auto_513078 ?auto_513085 ) ) ( not ( = ?auto_513078 ?auto_513086 ) ) ( not ( = ?auto_513078 ?auto_513087 ) ) ( not ( = ?auto_513078 ?auto_513088 ) ) ( not ( = ?auto_513078 ?auto_513089 ) ) ( not ( = ?auto_513078 ?auto_513090 ) ) ( not ( = ?auto_513078 ?auto_513091 ) ) ( not ( = ?auto_513079 ?auto_513080 ) ) ( not ( = ?auto_513079 ?auto_513081 ) ) ( not ( = ?auto_513079 ?auto_513082 ) ) ( not ( = ?auto_513079 ?auto_513083 ) ) ( not ( = ?auto_513079 ?auto_513084 ) ) ( not ( = ?auto_513079 ?auto_513085 ) ) ( not ( = ?auto_513079 ?auto_513086 ) ) ( not ( = ?auto_513079 ?auto_513087 ) ) ( not ( = ?auto_513079 ?auto_513088 ) ) ( not ( = ?auto_513079 ?auto_513089 ) ) ( not ( = ?auto_513079 ?auto_513090 ) ) ( not ( = ?auto_513079 ?auto_513091 ) ) ( not ( = ?auto_513080 ?auto_513081 ) ) ( not ( = ?auto_513080 ?auto_513082 ) ) ( not ( = ?auto_513080 ?auto_513083 ) ) ( not ( = ?auto_513080 ?auto_513084 ) ) ( not ( = ?auto_513080 ?auto_513085 ) ) ( not ( = ?auto_513080 ?auto_513086 ) ) ( not ( = ?auto_513080 ?auto_513087 ) ) ( not ( = ?auto_513080 ?auto_513088 ) ) ( not ( = ?auto_513080 ?auto_513089 ) ) ( not ( = ?auto_513080 ?auto_513090 ) ) ( not ( = ?auto_513080 ?auto_513091 ) ) ( not ( = ?auto_513081 ?auto_513082 ) ) ( not ( = ?auto_513081 ?auto_513083 ) ) ( not ( = ?auto_513081 ?auto_513084 ) ) ( not ( = ?auto_513081 ?auto_513085 ) ) ( not ( = ?auto_513081 ?auto_513086 ) ) ( not ( = ?auto_513081 ?auto_513087 ) ) ( not ( = ?auto_513081 ?auto_513088 ) ) ( not ( = ?auto_513081 ?auto_513089 ) ) ( not ( = ?auto_513081 ?auto_513090 ) ) ( not ( = ?auto_513081 ?auto_513091 ) ) ( not ( = ?auto_513082 ?auto_513083 ) ) ( not ( = ?auto_513082 ?auto_513084 ) ) ( not ( = ?auto_513082 ?auto_513085 ) ) ( not ( = ?auto_513082 ?auto_513086 ) ) ( not ( = ?auto_513082 ?auto_513087 ) ) ( not ( = ?auto_513082 ?auto_513088 ) ) ( not ( = ?auto_513082 ?auto_513089 ) ) ( not ( = ?auto_513082 ?auto_513090 ) ) ( not ( = ?auto_513082 ?auto_513091 ) ) ( not ( = ?auto_513083 ?auto_513084 ) ) ( not ( = ?auto_513083 ?auto_513085 ) ) ( not ( = ?auto_513083 ?auto_513086 ) ) ( not ( = ?auto_513083 ?auto_513087 ) ) ( not ( = ?auto_513083 ?auto_513088 ) ) ( not ( = ?auto_513083 ?auto_513089 ) ) ( not ( = ?auto_513083 ?auto_513090 ) ) ( not ( = ?auto_513083 ?auto_513091 ) ) ( not ( = ?auto_513084 ?auto_513085 ) ) ( not ( = ?auto_513084 ?auto_513086 ) ) ( not ( = ?auto_513084 ?auto_513087 ) ) ( not ( = ?auto_513084 ?auto_513088 ) ) ( not ( = ?auto_513084 ?auto_513089 ) ) ( not ( = ?auto_513084 ?auto_513090 ) ) ( not ( = ?auto_513084 ?auto_513091 ) ) ( not ( = ?auto_513085 ?auto_513086 ) ) ( not ( = ?auto_513085 ?auto_513087 ) ) ( not ( = ?auto_513085 ?auto_513088 ) ) ( not ( = ?auto_513085 ?auto_513089 ) ) ( not ( = ?auto_513085 ?auto_513090 ) ) ( not ( = ?auto_513085 ?auto_513091 ) ) ( not ( = ?auto_513086 ?auto_513087 ) ) ( not ( = ?auto_513086 ?auto_513088 ) ) ( not ( = ?auto_513086 ?auto_513089 ) ) ( not ( = ?auto_513086 ?auto_513090 ) ) ( not ( = ?auto_513086 ?auto_513091 ) ) ( not ( = ?auto_513087 ?auto_513088 ) ) ( not ( = ?auto_513087 ?auto_513089 ) ) ( not ( = ?auto_513087 ?auto_513090 ) ) ( not ( = ?auto_513087 ?auto_513091 ) ) ( not ( = ?auto_513088 ?auto_513089 ) ) ( not ( = ?auto_513088 ?auto_513090 ) ) ( not ( = ?auto_513088 ?auto_513091 ) ) ( not ( = ?auto_513089 ?auto_513090 ) ) ( not ( = ?auto_513089 ?auto_513091 ) ) ( not ( = ?auto_513090 ?auto_513091 ) ) ( ON ?auto_513089 ?auto_513090 ) ( ON ?auto_513088 ?auto_513089 ) ( ON ?auto_513087 ?auto_513088 ) ( ON ?auto_513086 ?auto_513087 ) ( ON ?auto_513085 ?auto_513086 ) ( ON ?auto_513084 ?auto_513085 ) ( ON ?auto_513083 ?auto_513084 ) ( ON ?auto_513082 ?auto_513083 ) ( ON ?auto_513081 ?auto_513082 ) ( ON ?auto_513080 ?auto_513081 ) ( ON ?auto_513079 ?auto_513080 ) ( ON ?auto_513078 ?auto_513079 ) ( ON ?auto_513077 ?auto_513078 ) ( CLEAR ?auto_513077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_513077 )
      ( MAKE-14PILE ?auto_513077 ?auto_513078 ?auto_513079 ?auto_513080 ?auto_513081 ?auto_513082 ?auto_513083 ?auto_513084 ?auto_513085 ?auto_513086 ?auto_513087 ?auto_513088 ?auto_513089 ?auto_513090 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513136 - BLOCK
      ?auto_513137 - BLOCK
      ?auto_513138 - BLOCK
      ?auto_513139 - BLOCK
      ?auto_513140 - BLOCK
      ?auto_513141 - BLOCK
      ?auto_513142 - BLOCK
      ?auto_513143 - BLOCK
      ?auto_513144 - BLOCK
      ?auto_513145 - BLOCK
      ?auto_513146 - BLOCK
      ?auto_513147 - BLOCK
      ?auto_513148 - BLOCK
      ?auto_513149 - BLOCK
      ?auto_513150 - BLOCK
    )
    :vars
    (
      ?auto_513151 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_513149 ) ( ON ?auto_513150 ?auto_513151 ) ( CLEAR ?auto_513150 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_513136 ) ( ON ?auto_513137 ?auto_513136 ) ( ON ?auto_513138 ?auto_513137 ) ( ON ?auto_513139 ?auto_513138 ) ( ON ?auto_513140 ?auto_513139 ) ( ON ?auto_513141 ?auto_513140 ) ( ON ?auto_513142 ?auto_513141 ) ( ON ?auto_513143 ?auto_513142 ) ( ON ?auto_513144 ?auto_513143 ) ( ON ?auto_513145 ?auto_513144 ) ( ON ?auto_513146 ?auto_513145 ) ( ON ?auto_513147 ?auto_513146 ) ( ON ?auto_513148 ?auto_513147 ) ( ON ?auto_513149 ?auto_513148 ) ( not ( = ?auto_513136 ?auto_513137 ) ) ( not ( = ?auto_513136 ?auto_513138 ) ) ( not ( = ?auto_513136 ?auto_513139 ) ) ( not ( = ?auto_513136 ?auto_513140 ) ) ( not ( = ?auto_513136 ?auto_513141 ) ) ( not ( = ?auto_513136 ?auto_513142 ) ) ( not ( = ?auto_513136 ?auto_513143 ) ) ( not ( = ?auto_513136 ?auto_513144 ) ) ( not ( = ?auto_513136 ?auto_513145 ) ) ( not ( = ?auto_513136 ?auto_513146 ) ) ( not ( = ?auto_513136 ?auto_513147 ) ) ( not ( = ?auto_513136 ?auto_513148 ) ) ( not ( = ?auto_513136 ?auto_513149 ) ) ( not ( = ?auto_513136 ?auto_513150 ) ) ( not ( = ?auto_513136 ?auto_513151 ) ) ( not ( = ?auto_513137 ?auto_513138 ) ) ( not ( = ?auto_513137 ?auto_513139 ) ) ( not ( = ?auto_513137 ?auto_513140 ) ) ( not ( = ?auto_513137 ?auto_513141 ) ) ( not ( = ?auto_513137 ?auto_513142 ) ) ( not ( = ?auto_513137 ?auto_513143 ) ) ( not ( = ?auto_513137 ?auto_513144 ) ) ( not ( = ?auto_513137 ?auto_513145 ) ) ( not ( = ?auto_513137 ?auto_513146 ) ) ( not ( = ?auto_513137 ?auto_513147 ) ) ( not ( = ?auto_513137 ?auto_513148 ) ) ( not ( = ?auto_513137 ?auto_513149 ) ) ( not ( = ?auto_513137 ?auto_513150 ) ) ( not ( = ?auto_513137 ?auto_513151 ) ) ( not ( = ?auto_513138 ?auto_513139 ) ) ( not ( = ?auto_513138 ?auto_513140 ) ) ( not ( = ?auto_513138 ?auto_513141 ) ) ( not ( = ?auto_513138 ?auto_513142 ) ) ( not ( = ?auto_513138 ?auto_513143 ) ) ( not ( = ?auto_513138 ?auto_513144 ) ) ( not ( = ?auto_513138 ?auto_513145 ) ) ( not ( = ?auto_513138 ?auto_513146 ) ) ( not ( = ?auto_513138 ?auto_513147 ) ) ( not ( = ?auto_513138 ?auto_513148 ) ) ( not ( = ?auto_513138 ?auto_513149 ) ) ( not ( = ?auto_513138 ?auto_513150 ) ) ( not ( = ?auto_513138 ?auto_513151 ) ) ( not ( = ?auto_513139 ?auto_513140 ) ) ( not ( = ?auto_513139 ?auto_513141 ) ) ( not ( = ?auto_513139 ?auto_513142 ) ) ( not ( = ?auto_513139 ?auto_513143 ) ) ( not ( = ?auto_513139 ?auto_513144 ) ) ( not ( = ?auto_513139 ?auto_513145 ) ) ( not ( = ?auto_513139 ?auto_513146 ) ) ( not ( = ?auto_513139 ?auto_513147 ) ) ( not ( = ?auto_513139 ?auto_513148 ) ) ( not ( = ?auto_513139 ?auto_513149 ) ) ( not ( = ?auto_513139 ?auto_513150 ) ) ( not ( = ?auto_513139 ?auto_513151 ) ) ( not ( = ?auto_513140 ?auto_513141 ) ) ( not ( = ?auto_513140 ?auto_513142 ) ) ( not ( = ?auto_513140 ?auto_513143 ) ) ( not ( = ?auto_513140 ?auto_513144 ) ) ( not ( = ?auto_513140 ?auto_513145 ) ) ( not ( = ?auto_513140 ?auto_513146 ) ) ( not ( = ?auto_513140 ?auto_513147 ) ) ( not ( = ?auto_513140 ?auto_513148 ) ) ( not ( = ?auto_513140 ?auto_513149 ) ) ( not ( = ?auto_513140 ?auto_513150 ) ) ( not ( = ?auto_513140 ?auto_513151 ) ) ( not ( = ?auto_513141 ?auto_513142 ) ) ( not ( = ?auto_513141 ?auto_513143 ) ) ( not ( = ?auto_513141 ?auto_513144 ) ) ( not ( = ?auto_513141 ?auto_513145 ) ) ( not ( = ?auto_513141 ?auto_513146 ) ) ( not ( = ?auto_513141 ?auto_513147 ) ) ( not ( = ?auto_513141 ?auto_513148 ) ) ( not ( = ?auto_513141 ?auto_513149 ) ) ( not ( = ?auto_513141 ?auto_513150 ) ) ( not ( = ?auto_513141 ?auto_513151 ) ) ( not ( = ?auto_513142 ?auto_513143 ) ) ( not ( = ?auto_513142 ?auto_513144 ) ) ( not ( = ?auto_513142 ?auto_513145 ) ) ( not ( = ?auto_513142 ?auto_513146 ) ) ( not ( = ?auto_513142 ?auto_513147 ) ) ( not ( = ?auto_513142 ?auto_513148 ) ) ( not ( = ?auto_513142 ?auto_513149 ) ) ( not ( = ?auto_513142 ?auto_513150 ) ) ( not ( = ?auto_513142 ?auto_513151 ) ) ( not ( = ?auto_513143 ?auto_513144 ) ) ( not ( = ?auto_513143 ?auto_513145 ) ) ( not ( = ?auto_513143 ?auto_513146 ) ) ( not ( = ?auto_513143 ?auto_513147 ) ) ( not ( = ?auto_513143 ?auto_513148 ) ) ( not ( = ?auto_513143 ?auto_513149 ) ) ( not ( = ?auto_513143 ?auto_513150 ) ) ( not ( = ?auto_513143 ?auto_513151 ) ) ( not ( = ?auto_513144 ?auto_513145 ) ) ( not ( = ?auto_513144 ?auto_513146 ) ) ( not ( = ?auto_513144 ?auto_513147 ) ) ( not ( = ?auto_513144 ?auto_513148 ) ) ( not ( = ?auto_513144 ?auto_513149 ) ) ( not ( = ?auto_513144 ?auto_513150 ) ) ( not ( = ?auto_513144 ?auto_513151 ) ) ( not ( = ?auto_513145 ?auto_513146 ) ) ( not ( = ?auto_513145 ?auto_513147 ) ) ( not ( = ?auto_513145 ?auto_513148 ) ) ( not ( = ?auto_513145 ?auto_513149 ) ) ( not ( = ?auto_513145 ?auto_513150 ) ) ( not ( = ?auto_513145 ?auto_513151 ) ) ( not ( = ?auto_513146 ?auto_513147 ) ) ( not ( = ?auto_513146 ?auto_513148 ) ) ( not ( = ?auto_513146 ?auto_513149 ) ) ( not ( = ?auto_513146 ?auto_513150 ) ) ( not ( = ?auto_513146 ?auto_513151 ) ) ( not ( = ?auto_513147 ?auto_513148 ) ) ( not ( = ?auto_513147 ?auto_513149 ) ) ( not ( = ?auto_513147 ?auto_513150 ) ) ( not ( = ?auto_513147 ?auto_513151 ) ) ( not ( = ?auto_513148 ?auto_513149 ) ) ( not ( = ?auto_513148 ?auto_513150 ) ) ( not ( = ?auto_513148 ?auto_513151 ) ) ( not ( = ?auto_513149 ?auto_513150 ) ) ( not ( = ?auto_513149 ?auto_513151 ) ) ( not ( = ?auto_513150 ?auto_513151 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_513150 ?auto_513151 )
      ( !STACK ?auto_513150 ?auto_513149 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513198 - BLOCK
      ?auto_513199 - BLOCK
      ?auto_513200 - BLOCK
      ?auto_513201 - BLOCK
      ?auto_513202 - BLOCK
      ?auto_513203 - BLOCK
      ?auto_513204 - BLOCK
      ?auto_513205 - BLOCK
      ?auto_513206 - BLOCK
      ?auto_513207 - BLOCK
      ?auto_513208 - BLOCK
      ?auto_513209 - BLOCK
      ?auto_513210 - BLOCK
      ?auto_513211 - BLOCK
      ?auto_513212 - BLOCK
    )
    :vars
    (
      ?auto_513213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513212 ?auto_513213 ) ( ON-TABLE ?auto_513198 ) ( ON ?auto_513199 ?auto_513198 ) ( ON ?auto_513200 ?auto_513199 ) ( ON ?auto_513201 ?auto_513200 ) ( ON ?auto_513202 ?auto_513201 ) ( ON ?auto_513203 ?auto_513202 ) ( ON ?auto_513204 ?auto_513203 ) ( ON ?auto_513205 ?auto_513204 ) ( ON ?auto_513206 ?auto_513205 ) ( ON ?auto_513207 ?auto_513206 ) ( ON ?auto_513208 ?auto_513207 ) ( ON ?auto_513209 ?auto_513208 ) ( ON ?auto_513210 ?auto_513209 ) ( not ( = ?auto_513198 ?auto_513199 ) ) ( not ( = ?auto_513198 ?auto_513200 ) ) ( not ( = ?auto_513198 ?auto_513201 ) ) ( not ( = ?auto_513198 ?auto_513202 ) ) ( not ( = ?auto_513198 ?auto_513203 ) ) ( not ( = ?auto_513198 ?auto_513204 ) ) ( not ( = ?auto_513198 ?auto_513205 ) ) ( not ( = ?auto_513198 ?auto_513206 ) ) ( not ( = ?auto_513198 ?auto_513207 ) ) ( not ( = ?auto_513198 ?auto_513208 ) ) ( not ( = ?auto_513198 ?auto_513209 ) ) ( not ( = ?auto_513198 ?auto_513210 ) ) ( not ( = ?auto_513198 ?auto_513211 ) ) ( not ( = ?auto_513198 ?auto_513212 ) ) ( not ( = ?auto_513198 ?auto_513213 ) ) ( not ( = ?auto_513199 ?auto_513200 ) ) ( not ( = ?auto_513199 ?auto_513201 ) ) ( not ( = ?auto_513199 ?auto_513202 ) ) ( not ( = ?auto_513199 ?auto_513203 ) ) ( not ( = ?auto_513199 ?auto_513204 ) ) ( not ( = ?auto_513199 ?auto_513205 ) ) ( not ( = ?auto_513199 ?auto_513206 ) ) ( not ( = ?auto_513199 ?auto_513207 ) ) ( not ( = ?auto_513199 ?auto_513208 ) ) ( not ( = ?auto_513199 ?auto_513209 ) ) ( not ( = ?auto_513199 ?auto_513210 ) ) ( not ( = ?auto_513199 ?auto_513211 ) ) ( not ( = ?auto_513199 ?auto_513212 ) ) ( not ( = ?auto_513199 ?auto_513213 ) ) ( not ( = ?auto_513200 ?auto_513201 ) ) ( not ( = ?auto_513200 ?auto_513202 ) ) ( not ( = ?auto_513200 ?auto_513203 ) ) ( not ( = ?auto_513200 ?auto_513204 ) ) ( not ( = ?auto_513200 ?auto_513205 ) ) ( not ( = ?auto_513200 ?auto_513206 ) ) ( not ( = ?auto_513200 ?auto_513207 ) ) ( not ( = ?auto_513200 ?auto_513208 ) ) ( not ( = ?auto_513200 ?auto_513209 ) ) ( not ( = ?auto_513200 ?auto_513210 ) ) ( not ( = ?auto_513200 ?auto_513211 ) ) ( not ( = ?auto_513200 ?auto_513212 ) ) ( not ( = ?auto_513200 ?auto_513213 ) ) ( not ( = ?auto_513201 ?auto_513202 ) ) ( not ( = ?auto_513201 ?auto_513203 ) ) ( not ( = ?auto_513201 ?auto_513204 ) ) ( not ( = ?auto_513201 ?auto_513205 ) ) ( not ( = ?auto_513201 ?auto_513206 ) ) ( not ( = ?auto_513201 ?auto_513207 ) ) ( not ( = ?auto_513201 ?auto_513208 ) ) ( not ( = ?auto_513201 ?auto_513209 ) ) ( not ( = ?auto_513201 ?auto_513210 ) ) ( not ( = ?auto_513201 ?auto_513211 ) ) ( not ( = ?auto_513201 ?auto_513212 ) ) ( not ( = ?auto_513201 ?auto_513213 ) ) ( not ( = ?auto_513202 ?auto_513203 ) ) ( not ( = ?auto_513202 ?auto_513204 ) ) ( not ( = ?auto_513202 ?auto_513205 ) ) ( not ( = ?auto_513202 ?auto_513206 ) ) ( not ( = ?auto_513202 ?auto_513207 ) ) ( not ( = ?auto_513202 ?auto_513208 ) ) ( not ( = ?auto_513202 ?auto_513209 ) ) ( not ( = ?auto_513202 ?auto_513210 ) ) ( not ( = ?auto_513202 ?auto_513211 ) ) ( not ( = ?auto_513202 ?auto_513212 ) ) ( not ( = ?auto_513202 ?auto_513213 ) ) ( not ( = ?auto_513203 ?auto_513204 ) ) ( not ( = ?auto_513203 ?auto_513205 ) ) ( not ( = ?auto_513203 ?auto_513206 ) ) ( not ( = ?auto_513203 ?auto_513207 ) ) ( not ( = ?auto_513203 ?auto_513208 ) ) ( not ( = ?auto_513203 ?auto_513209 ) ) ( not ( = ?auto_513203 ?auto_513210 ) ) ( not ( = ?auto_513203 ?auto_513211 ) ) ( not ( = ?auto_513203 ?auto_513212 ) ) ( not ( = ?auto_513203 ?auto_513213 ) ) ( not ( = ?auto_513204 ?auto_513205 ) ) ( not ( = ?auto_513204 ?auto_513206 ) ) ( not ( = ?auto_513204 ?auto_513207 ) ) ( not ( = ?auto_513204 ?auto_513208 ) ) ( not ( = ?auto_513204 ?auto_513209 ) ) ( not ( = ?auto_513204 ?auto_513210 ) ) ( not ( = ?auto_513204 ?auto_513211 ) ) ( not ( = ?auto_513204 ?auto_513212 ) ) ( not ( = ?auto_513204 ?auto_513213 ) ) ( not ( = ?auto_513205 ?auto_513206 ) ) ( not ( = ?auto_513205 ?auto_513207 ) ) ( not ( = ?auto_513205 ?auto_513208 ) ) ( not ( = ?auto_513205 ?auto_513209 ) ) ( not ( = ?auto_513205 ?auto_513210 ) ) ( not ( = ?auto_513205 ?auto_513211 ) ) ( not ( = ?auto_513205 ?auto_513212 ) ) ( not ( = ?auto_513205 ?auto_513213 ) ) ( not ( = ?auto_513206 ?auto_513207 ) ) ( not ( = ?auto_513206 ?auto_513208 ) ) ( not ( = ?auto_513206 ?auto_513209 ) ) ( not ( = ?auto_513206 ?auto_513210 ) ) ( not ( = ?auto_513206 ?auto_513211 ) ) ( not ( = ?auto_513206 ?auto_513212 ) ) ( not ( = ?auto_513206 ?auto_513213 ) ) ( not ( = ?auto_513207 ?auto_513208 ) ) ( not ( = ?auto_513207 ?auto_513209 ) ) ( not ( = ?auto_513207 ?auto_513210 ) ) ( not ( = ?auto_513207 ?auto_513211 ) ) ( not ( = ?auto_513207 ?auto_513212 ) ) ( not ( = ?auto_513207 ?auto_513213 ) ) ( not ( = ?auto_513208 ?auto_513209 ) ) ( not ( = ?auto_513208 ?auto_513210 ) ) ( not ( = ?auto_513208 ?auto_513211 ) ) ( not ( = ?auto_513208 ?auto_513212 ) ) ( not ( = ?auto_513208 ?auto_513213 ) ) ( not ( = ?auto_513209 ?auto_513210 ) ) ( not ( = ?auto_513209 ?auto_513211 ) ) ( not ( = ?auto_513209 ?auto_513212 ) ) ( not ( = ?auto_513209 ?auto_513213 ) ) ( not ( = ?auto_513210 ?auto_513211 ) ) ( not ( = ?auto_513210 ?auto_513212 ) ) ( not ( = ?auto_513210 ?auto_513213 ) ) ( not ( = ?auto_513211 ?auto_513212 ) ) ( not ( = ?auto_513211 ?auto_513213 ) ) ( not ( = ?auto_513212 ?auto_513213 ) ) ( CLEAR ?auto_513210 ) ( ON ?auto_513211 ?auto_513212 ) ( CLEAR ?auto_513211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_513198 ?auto_513199 ?auto_513200 ?auto_513201 ?auto_513202 ?auto_513203 ?auto_513204 ?auto_513205 ?auto_513206 ?auto_513207 ?auto_513208 ?auto_513209 ?auto_513210 ?auto_513211 )
      ( MAKE-15PILE ?auto_513198 ?auto_513199 ?auto_513200 ?auto_513201 ?auto_513202 ?auto_513203 ?auto_513204 ?auto_513205 ?auto_513206 ?auto_513207 ?auto_513208 ?auto_513209 ?auto_513210 ?auto_513211 ?auto_513212 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513260 - BLOCK
      ?auto_513261 - BLOCK
      ?auto_513262 - BLOCK
      ?auto_513263 - BLOCK
      ?auto_513264 - BLOCK
      ?auto_513265 - BLOCK
      ?auto_513266 - BLOCK
      ?auto_513267 - BLOCK
      ?auto_513268 - BLOCK
      ?auto_513269 - BLOCK
      ?auto_513270 - BLOCK
      ?auto_513271 - BLOCK
      ?auto_513272 - BLOCK
      ?auto_513273 - BLOCK
      ?auto_513274 - BLOCK
    )
    :vars
    (
      ?auto_513275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513274 ?auto_513275 ) ( ON-TABLE ?auto_513260 ) ( ON ?auto_513261 ?auto_513260 ) ( ON ?auto_513262 ?auto_513261 ) ( ON ?auto_513263 ?auto_513262 ) ( ON ?auto_513264 ?auto_513263 ) ( ON ?auto_513265 ?auto_513264 ) ( ON ?auto_513266 ?auto_513265 ) ( ON ?auto_513267 ?auto_513266 ) ( ON ?auto_513268 ?auto_513267 ) ( ON ?auto_513269 ?auto_513268 ) ( ON ?auto_513270 ?auto_513269 ) ( ON ?auto_513271 ?auto_513270 ) ( not ( = ?auto_513260 ?auto_513261 ) ) ( not ( = ?auto_513260 ?auto_513262 ) ) ( not ( = ?auto_513260 ?auto_513263 ) ) ( not ( = ?auto_513260 ?auto_513264 ) ) ( not ( = ?auto_513260 ?auto_513265 ) ) ( not ( = ?auto_513260 ?auto_513266 ) ) ( not ( = ?auto_513260 ?auto_513267 ) ) ( not ( = ?auto_513260 ?auto_513268 ) ) ( not ( = ?auto_513260 ?auto_513269 ) ) ( not ( = ?auto_513260 ?auto_513270 ) ) ( not ( = ?auto_513260 ?auto_513271 ) ) ( not ( = ?auto_513260 ?auto_513272 ) ) ( not ( = ?auto_513260 ?auto_513273 ) ) ( not ( = ?auto_513260 ?auto_513274 ) ) ( not ( = ?auto_513260 ?auto_513275 ) ) ( not ( = ?auto_513261 ?auto_513262 ) ) ( not ( = ?auto_513261 ?auto_513263 ) ) ( not ( = ?auto_513261 ?auto_513264 ) ) ( not ( = ?auto_513261 ?auto_513265 ) ) ( not ( = ?auto_513261 ?auto_513266 ) ) ( not ( = ?auto_513261 ?auto_513267 ) ) ( not ( = ?auto_513261 ?auto_513268 ) ) ( not ( = ?auto_513261 ?auto_513269 ) ) ( not ( = ?auto_513261 ?auto_513270 ) ) ( not ( = ?auto_513261 ?auto_513271 ) ) ( not ( = ?auto_513261 ?auto_513272 ) ) ( not ( = ?auto_513261 ?auto_513273 ) ) ( not ( = ?auto_513261 ?auto_513274 ) ) ( not ( = ?auto_513261 ?auto_513275 ) ) ( not ( = ?auto_513262 ?auto_513263 ) ) ( not ( = ?auto_513262 ?auto_513264 ) ) ( not ( = ?auto_513262 ?auto_513265 ) ) ( not ( = ?auto_513262 ?auto_513266 ) ) ( not ( = ?auto_513262 ?auto_513267 ) ) ( not ( = ?auto_513262 ?auto_513268 ) ) ( not ( = ?auto_513262 ?auto_513269 ) ) ( not ( = ?auto_513262 ?auto_513270 ) ) ( not ( = ?auto_513262 ?auto_513271 ) ) ( not ( = ?auto_513262 ?auto_513272 ) ) ( not ( = ?auto_513262 ?auto_513273 ) ) ( not ( = ?auto_513262 ?auto_513274 ) ) ( not ( = ?auto_513262 ?auto_513275 ) ) ( not ( = ?auto_513263 ?auto_513264 ) ) ( not ( = ?auto_513263 ?auto_513265 ) ) ( not ( = ?auto_513263 ?auto_513266 ) ) ( not ( = ?auto_513263 ?auto_513267 ) ) ( not ( = ?auto_513263 ?auto_513268 ) ) ( not ( = ?auto_513263 ?auto_513269 ) ) ( not ( = ?auto_513263 ?auto_513270 ) ) ( not ( = ?auto_513263 ?auto_513271 ) ) ( not ( = ?auto_513263 ?auto_513272 ) ) ( not ( = ?auto_513263 ?auto_513273 ) ) ( not ( = ?auto_513263 ?auto_513274 ) ) ( not ( = ?auto_513263 ?auto_513275 ) ) ( not ( = ?auto_513264 ?auto_513265 ) ) ( not ( = ?auto_513264 ?auto_513266 ) ) ( not ( = ?auto_513264 ?auto_513267 ) ) ( not ( = ?auto_513264 ?auto_513268 ) ) ( not ( = ?auto_513264 ?auto_513269 ) ) ( not ( = ?auto_513264 ?auto_513270 ) ) ( not ( = ?auto_513264 ?auto_513271 ) ) ( not ( = ?auto_513264 ?auto_513272 ) ) ( not ( = ?auto_513264 ?auto_513273 ) ) ( not ( = ?auto_513264 ?auto_513274 ) ) ( not ( = ?auto_513264 ?auto_513275 ) ) ( not ( = ?auto_513265 ?auto_513266 ) ) ( not ( = ?auto_513265 ?auto_513267 ) ) ( not ( = ?auto_513265 ?auto_513268 ) ) ( not ( = ?auto_513265 ?auto_513269 ) ) ( not ( = ?auto_513265 ?auto_513270 ) ) ( not ( = ?auto_513265 ?auto_513271 ) ) ( not ( = ?auto_513265 ?auto_513272 ) ) ( not ( = ?auto_513265 ?auto_513273 ) ) ( not ( = ?auto_513265 ?auto_513274 ) ) ( not ( = ?auto_513265 ?auto_513275 ) ) ( not ( = ?auto_513266 ?auto_513267 ) ) ( not ( = ?auto_513266 ?auto_513268 ) ) ( not ( = ?auto_513266 ?auto_513269 ) ) ( not ( = ?auto_513266 ?auto_513270 ) ) ( not ( = ?auto_513266 ?auto_513271 ) ) ( not ( = ?auto_513266 ?auto_513272 ) ) ( not ( = ?auto_513266 ?auto_513273 ) ) ( not ( = ?auto_513266 ?auto_513274 ) ) ( not ( = ?auto_513266 ?auto_513275 ) ) ( not ( = ?auto_513267 ?auto_513268 ) ) ( not ( = ?auto_513267 ?auto_513269 ) ) ( not ( = ?auto_513267 ?auto_513270 ) ) ( not ( = ?auto_513267 ?auto_513271 ) ) ( not ( = ?auto_513267 ?auto_513272 ) ) ( not ( = ?auto_513267 ?auto_513273 ) ) ( not ( = ?auto_513267 ?auto_513274 ) ) ( not ( = ?auto_513267 ?auto_513275 ) ) ( not ( = ?auto_513268 ?auto_513269 ) ) ( not ( = ?auto_513268 ?auto_513270 ) ) ( not ( = ?auto_513268 ?auto_513271 ) ) ( not ( = ?auto_513268 ?auto_513272 ) ) ( not ( = ?auto_513268 ?auto_513273 ) ) ( not ( = ?auto_513268 ?auto_513274 ) ) ( not ( = ?auto_513268 ?auto_513275 ) ) ( not ( = ?auto_513269 ?auto_513270 ) ) ( not ( = ?auto_513269 ?auto_513271 ) ) ( not ( = ?auto_513269 ?auto_513272 ) ) ( not ( = ?auto_513269 ?auto_513273 ) ) ( not ( = ?auto_513269 ?auto_513274 ) ) ( not ( = ?auto_513269 ?auto_513275 ) ) ( not ( = ?auto_513270 ?auto_513271 ) ) ( not ( = ?auto_513270 ?auto_513272 ) ) ( not ( = ?auto_513270 ?auto_513273 ) ) ( not ( = ?auto_513270 ?auto_513274 ) ) ( not ( = ?auto_513270 ?auto_513275 ) ) ( not ( = ?auto_513271 ?auto_513272 ) ) ( not ( = ?auto_513271 ?auto_513273 ) ) ( not ( = ?auto_513271 ?auto_513274 ) ) ( not ( = ?auto_513271 ?auto_513275 ) ) ( not ( = ?auto_513272 ?auto_513273 ) ) ( not ( = ?auto_513272 ?auto_513274 ) ) ( not ( = ?auto_513272 ?auto_513275 ) ) ( not ( = ?auto_513273 ?auto_513274 ) ) ( not ( = ?auto_513273 ?auto_513275 ) ) ( not ( = ?auto_513274 ?auto_513275 ) ) ( ON ?auto_513273 ?auto_513274 ) ( CLEAR ?auto_513271 ) ( ON ?auto_513272 ?auto_513273 ) ( CLEAR ?auto_513272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_513260 ?auto_513261 ?auto_513262 ?auto_513263 ?auto_513264 ?auto_513265 ?auto_513266 ?auto_513267 ?auto_513268 ?auto_513269 ?auto_513270 ?auto_513271 ?auto_513272 )
      ( MAKE-15PILE ?auto_513260 ?auto_513261 ?auto_513262 ?auto_513263 ?auto_513264 ?auto_513265 ?auto_513266 ?auto_513267 ?auto_513268 ?auto_513269 ?auto_513270 ?auto_513271 ?auto_513272 ?auto_513273 ?auto_513274 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513322 - BLOCK
      ?auto_513323 - BLOCK
      ?auto_513324 - BLOCK
      ?auto_513325 - BLOCK
      ?auto_513326 - BLOCK
      ?auto_513327 - BLOCK
      ?auto_513328 - BLOCK
      ?auto_513329 - BLOCK
      ?auto_513330 - BLOCK
      ?auto_513331 - BLOCK
      ?auto_513332 - BLOCK
      ?auto_513333 - BLOCK
      ?auto_513334 - BLOCK
      ?auto_513335 - BLOCK
      ?auto_513336 - BLOCK
    )
    :vars
    (
      ?auto_513337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513336 ?auto_513337 ) ( ON-TABLE ?auto_513322 ) ( ON ?auto_513323 ?auto_513322 ) ( ON ?auto_513324 ?auto_513323 ) ( ON ?auto_513325 ?auto_513324 ) ( ON ?auto_513326 ?auto_513325 ) ( ON ?auto_513327 ?auto_513326 ) ( ON ?auto_513328 ?auto_513327 ) ( ON ?auto_513329 ?auto_513328 ) ( ON ?auto_513330 ?auto_513329 ) ( ON ?auto_513331 ?auto_513330 ) ( ON ?auto_513332 ?auto_513331 ) ( not ( = ?auto_513322 ?auto_513323 ) ) ( not ( = ?auto_513322 ?auto_513324 ) ) ( not ( = ?auto_513322 ?auto_513325 ) ) ( not ( = ?auto_513322 ?auto_513326 ) ) ( not ( = ?auto_513322 ?auto_513327 ) ) ( not ( = ?auto_513322 ?auto_513328 ) ) ( not ( = ?auto_513322 ?auto_513329 ) ) ( not ( = ?auto_513322 ?auto_513330 ) ) ( not ( = ?auto_513322 ?auto_513331 ) ) ( not ( = ?auto_513322 ?auto_513332 ) ) ( not ( = ?auto_513322 ?auto_513333 ) ) ( not ( = ?auto_513322 ?auto_513334 ) ) ( not ( = ?auto_513322 ?auto_513335 ) ) ( not ( = ?auto_513322 ?auto_513336 ) ) ( not ( = ?auto_513322 ?auto_513337 ) ) ( not ( = ?auto_513323 ?auto_513324 ) ) ( not ( = ?auto_513323 ?auto_513325 ) ) ( not ( = ?auto_513323 ?auto_513326 ) ) ( not ( = ?auto_513323 ?auto_513327 ) ) ( not ( = ?auto_513323 ?auto_513328 ) ) ( not ( = ?auto_513323 ?auto_513329 ) ) ( not ( = ?auto_513323 ?auto_513330 ) ) ( not ( = ?auto_513323 ?auto_513331 ) ) ( not ( = ?auto_513323 ?auto_513332 ) ) ( not ( = ?auto_513323 ?auto_513333 ) ) ( not ( = ?auto_513323 ?auto_513334 ) ) ( not ( = ?auto_513323 ?auto_513335 ) ) ( not ( = ?auto_513323 ?auto_513336 ) ) ( not ( = ?auto_513323 ?auto_513337 ) ) ( not ( = ?auto_513324 ?auto_513325 ) ) ( not ( = ?auto_513324 ?auto_513326 ) ) ( not ( = ?auto_513324 ?auto_513327 ) ) ( not ( = ?auto_513324 ?auto_513328 ) ) ( not ( = ?auto_513324 ?auto_513329 ) ) ( not ( = ?auto_513324 ?auto_513330 ) ) ( not ( = ?auto_513324 ?auto_513331 ) ) ( not ( = ?auto_513324 ?auto_513332 ) ) ( not ( = ?auto_513324 ?auto_513333 ) ) ( not ( = ?auto_513324 ?auto_513334 ) ) ( not ( = ?auto_513324 ?auto_513335 ) ) ( not ( = ?auto_513324 ?auto_513336 ) ) ( not ( = ?auto_513324 ?auto_513337 ) ) ( not ( = ?auto_513325 ?auto_513326 ) ) ( not ( = ?auto_513325 ?auto_513327 ) ) ( not ( = ?auto_513325 ?auto_513328 ) ) ( not ( = ?auto_513325 ?auto_513329 ) ) ( not ( = ?auto_513325 ?auto_513330 ) ) ( not ( = ?auto_513325 ?auto_513331 ) ) ( not ( = ?auto_513325 ?auto_513332 ) ) ( not ( = ?auto_513325 ?auto_513333 ) ) ( not ( = ?auto_513325 ?auto_513334 ) ) ( not ( = ?auto_513325 ?auto_513335 ) ) ( not ( = ?auto_513325 ?auto_513336 ) ) ( not ( = ?auto_513325 ?auto_513337 ) ) ( not ( = ?auto_513326 ?auto_513327 ) ) ( not ( = ?auto_513326 ?auto_513328 ) ) ( not ( = ?auto_513326 ?auto_513329 ) ) ( not ( = ?auto_513326 ?auto_513330 ) ) ( not ( = ?auto_513326 ?auto_513331 ) ) ( not ( = ?auto_513326 ?auto_513332 ) ) ( not ( = ?auto_513326 ?auto_513333 ) ) ( not ( = ?auto_513326 ?auto_513334 ) ) ( not ( = ?auto_513326 ?auto_513335 ) ) ( not ( = ?auto_513326 ?auto_513336 ) ) ( not ( = ?auto_513326 ?auto_513337 ) ) ( not ( = ?auto_513327 ?auto_513328 ) ) ( not ( = ?auto_513327 ?auto_513329 ) ) ( not ( = ?auto_513327 ?auto_513330 ) ) ( not ( = ?auto_513327 ?auto_513331 ) ) ( not ( = ?auto_513327 ?auto_513332 ) ) ( not ( = ?auto_513327 ?auto_513333 ) ) ( not ( = ?auto_513327 ?auto_513334 ) ) ( not ( = ?auto_513327 ?auto_513335 ) ) ( not ( = ?auto_513327 ?auto_513336 ) ) ( not ( = ?auto_513327 ?auto_513337 ) ) ( not ( = ?auto_513328 ?auto_513329 ) ) ( not ( = ?auto_513328 ?auto_513330 ) ) ( not ( = ?auto_513328 ?auto_513331 ) ) ( not ( = ?auto_513328 ?auto_513332 ) ) ( not ( = ?auto_513328 ?auto_513333 ) ) ( not ( = ?auto_513328 ?auto_513334 ) ) ( not ( = ?auto_513328 ?auto_513335 ) ) ( not ( = ?auto_513328 ?auto_513336 ) ) ( not ( = ?auto_513328 ?auto_513337 ) ) ( not ( = ?auto_513329 ?auto_513330 ) ) ( not ( = ?auto_513329 ?auto_513331 ) ) ( not ( = ?auto_513329 ?auto_513332 ) ) ( not ( = ?auto_513329 ?auto_513333 ) ) ( not ( = ?auto_513329 ?auto_513334 ) ) ( not ( = ?auto_513329 ?auto_513335 ) ) ( not ( = ?auto_513329 ?auto_513336 ) ) ( not ( = ?auto_513329 ?auto_513337 ) ) ( not ( = ?auto_513330 ?auto_513331 ) ) ( not ( = ?auto_513330 ?auto_513332 ) ) ( not ( = ?auto_513330 ?auto_513333 ) ) ( not ( = ?auto_513330 ?auto_513334 ) ) ( not ( = ?auto_513330 ?auto_513335 ) ) ( not ( = ?auto_513330 ?auto_513336 ) ) ( not ( = ?auto_513330 ?auto_513337 ) ) ( not ( = ?auto_513331 ?auto_513332 ) ) ( not ( = ?auto_513331 ?auto_513333 ) ) ( not ( = ?auto_513331 ?auto_513334 ) ) ( not ( = ?auto_513331 ?auto_513335 ) ) ( not ( = ?auto_513331 ?auto_513336 ) ) ( not ( = ?auto_513331 ?auto_513337 ) ) ( not ( = ?auto_513332 ?auto_513333 ) ) ( not ( = ?auto_513332 ?auto_513334 ) ) ( not ( = ?auto_513332 ?auto_513335 ) ) ( not ( = ?auto_513332 ?auto_513336 ) ) ( not ( = ?auto_513332 ?auto_513337 ) ) ( not ( = ?auto_513333 ?auto_513334 ) ) ( not ( = ?auto_513333 ?auto_513335 ) ) ( not ( = ?auto_513333 ?auto_513336 ) ) ( not ( = ?auto_513333 ?auto_513337 ) ) ( not ( = ?auto_513334 ?auto_513335 ) ) ( not ( = ?auto_513334 ?auto_513336 ) ) ( not ( = ?auto_513334 ?auto_513337 ) ) ( not ( = ?auto_513335 ?auto_513336 ) ) ( not ( = ?auto_513335 ?auto_513337 ) ) ( not ( = ?auto_513336 ?auto_513337 ) ) ( ON ?auto_513335 ?auto_513336 ) ( ON ?auto_513334 ?auto_513335 ) ( CLEAR ?auto_513332 ) ( ON ?auto_513333 ?auto_513334 ) ( CLEAR ?auto_513333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_513322 ?auto_513323 ?auto_513324 ?auto_513325 ?auto_513326 ?auto_513327 ?auto_513328 ?auto_513329 ?auto_513330 ?auto_513331 ?auto_513332 ?auto_513333 )
      ( MAKE-15PILE ?auto_513322 ?auto_513323 ?auto_513324 ?auto_513325 ?auto_513326 ?auto_513327 ?auto_513328 ?auto_513329 ?auto_513330 ?auto_513331 ?auto_513332 ?auto_513333 ?auto_513334 ?auto_513335 ?auto_513336 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513384 - BLOCK
      ?auto_513385 - BLOCK
      ?auto_513386 - BLOCK
      ?auto_513387 - BLOCK
      ?auto_513388 - BLOCK
      ?auto_513389 - BLOCK
      ?auto_513390 - BLOCK
      ?auto_513391 - BLOCK
      ?auto_513392 - BLOCK
      ?auto_513393 - BLOCK
      ?auto_513394 - BLOCK
      ?auto_513395 - BLOCK
      ?auto_513396 - BLOCK
      ?auto_513397 - BLOCK
      ?auto_513398 - BLOCK
    )
    :vars
    (
      ?auto_513399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513398 ?auto_513399 ) ( ON-TABLE ?auto_513384 ) ( ON ?auto_513385 ?auto_513384 ) ( ON ?auto_513386 ?auto_513385 ) ( ON ?auto_513387 ?auto_513386 ) ( ON ?auto_513388 ?auto_513387 ) ( ON ?auto_513389 ?auto_513388 ) ( ON ?auto_513390 ?auto_513389 ) ( ON ?auto_513391 ?auto_513390 ) ( ON ?auto_513392 ?auto_513391 ) ( ON ?auto_513393 ?auto_513392 ) ( not ( = ?auto_513384 ?auto_513385 ) ) ( not ( = ?auto_513384 ?auto_513386 ) ) ( not ( = ?auto_513384 ?auto_513387 ) ) ( not ( = ?auto_513384 ?auto_513388 ) ) ( not ( = ?auto_513384 ?auto_513389 ) ) ( not ( = ?auto_513384 ?auto_513390 ) ) ( not ( = ?auto_513384 ?auto_513391 ) ) ( not ( = ?auto_513384 ?auto_513392 ) ) ( not ( = ?auto_513384 ?auto_513393 ) ) ( not ( = ?auto_513384 ?auto_513394 ) ) ( not ( = ?auto_513384 ?auto_513395 ) ) ( not ( = ?auto_513384 ?auto_513396 ) ) ( not ( = ?auto_513384 ?auto_513397 ) ) ( not ( = ?auto_513384 ?auto_513398 ) ) ( not ( = ?auto_513384 ?auto_513399 ) ) ( not ( = ?auto_513385 ?auto_513386 ) ) ( not ( = ?auto_513385 ?auto_513387 ) ) ( not ( = ?auto_513385 ?auto_513388 ) ) ( not ( = ?auto_513385 ?auto_513389 ) ) ( not ( = ?auto_513385 ?auto_513390 ) ) ( not ( = ?auto_513385 ?auto_513391 ) ) ( not ( = ?auto_513385 ?auto_513392 ) ) ( not ( = ?auto_513385 ?auto_513393 ) ) ( not ( = ?auto_513385 ?auto_513394 ) ) ( not ( = ?auto_513385 ?auto_513395 ) ) ( not ( = ?auto_513385 ?auto_513396 ) ) ( not ( = ?auto_513385 ?auto_513397 ) ) ( not ( = ?auto_513385 ?auto_513398 ) ) ( not ( = ?auto_513385 ?auto_513399 ) ) ( not ( = ?auto_513386 ?auto_513387 ) ) ( not ( = ?auto_513386 ?auto_513388 ) ) ( not ( = ?auto_513386 ?auto_513389 ) ) ( not ( = ?auto_513386 ?auto_513390 ) ) ( not ( = ?auto_513386 ?auto_513391 ) ) ( not ( = ?auto_513386 ?auto_513392 ) ) ( not ( = ?auto_513386 ?auto_513393 ) ) ( not ( = ?auto_513386 ?auto_513394 ) ) ( not ( = ?auto_513386 ?auto_513395 ) ) ( not ( = ?auto_513386 ?auto_513396 ) ) ( not ( = ?auto_513386 ?auto_513397 ) ) ( not ( = ?auto_513386 ?auto_513398 ) ) ( not ( = ?auto_513386 ?auto_513399 ) ) ( not ( = ?auto_513387 ?auto_513388 ) ) ( not ( = ?auto_513387 ?auto_513389 ) ) ( not ( = ?auto_513387 ?auto_513390 ) ) ( not ( = ?auto_513387 ?auto_513391 ) ) ( not ( = ?auto_513387 ?auto_513392 ) ) ( not ( = ?auto_513387 ?auto_513393 ) ) ( not ( = ?auto_513387 ?auto_513394 ) ) ( not ( = ?auto_513387 ?auto_513395 ) ) ( not ( = ?auto_513387 ?auto_513396 ) ) ( not ( = ?auto_513387 ?auto_513397 ) ) ( not ( = ?auto_513387 ?auto_513398 ) ) ( not ( = ?auto_513387 ?auto_513399 ) ) ( not ( = ?auto_513388 ?auto_513389 ) ) ( not ( = ?auto_513388 ?auto_513390 ) ) ( not ( = ?auto_513388 ?auto_513391 ) ) ( not ( = ?auto_513388 ?auto_513392 ) ) ( not ( = ?auto_513388 ?auto_513393 ) ) ( not ( = ?auto_513388 ?auto_513394 ) ) ( not ( = ?auto_513388 ?auto_513395 ) ) ( not ( = ?auto_513388 ?auto_513396 ) ) ( not ( = ?auto_513388 ?auto_513397 ) ) ( not ( = ?auto_513388 ?auto_513398 ) ) ( not ( = ?auto_513388 ?auto_513399 ) ) ( not ( = ?auto_513389 ?auto_513390 ) ) ( not ( = ?auto_513389 ?auto_513391 ) ) ( not ( = ?auto_513389 ?auto_513392 ) ) ( not ( = ?auto_513389 ?auto_513393 ) ) ( not ( = ?auto_513389 ?auto_513394 ) ) ( not ( = ?auto_513389 ?auto_513395 ) ) ( not ( = ?auto_513389 ?auto_513396 ) ) ( not ( = ?auto_513389 ?auto_513397 ) ) ( not ( = ?auto_513389 ?auto_513398 ) ) ( not ( = ?auto_513389 ?auto_513399 ) ) ( not ( = ?auto_513390 ?auto_513391 ) ) ( not ( = ?auto_513390 ?auto_513392 ) ) ( not ( = ?auto_513390 ?auto_513393 ) ) ( not ( = ?auto_513390 ?auto_513394 ) ) ( not ( = ?auto_513390 ?auto_513395 ) ) ( not ( = ?auto_513390 ?auto_513396 ) ) ( not ( = ?auto_513390 ?auto_513397 ) ) ( not ( = ?auto_513390 ?auto_513398 ) ) ( not ( = ?auto_513390 ?auto_513399 ) ) ( not ( = ?auto_513391 ?auto_513392 ) ) ( not ( = ?auto_513391 ?auto_513393 ) ) ( not ( = ?auto_513391 ?auto_513394 ) ) ( not ( = ?auto_513391 ?auto_513395 ) ) ( not ( = ?auto_513391 ?auto_513396 ) ) ( not ( = ?auto_513391 ?auto_513397 ) ) ( not ( = ?auto_513391 ?auto_513398 ) ) ( not ( = ?auto_513391 ?auto_513399 ) ) ( not ( = ?auto_513392 ?auto_513393 ) ) ( not ( = ?auto_513392 ?auto_513394 ) ) ( not ( = ?auto_513392 ?auto_513395 ) ) ( not ( = ?auto_513392 ?auto_513396 ) ) ( not ( = ?auto_513392 ?auto_513397 ) ) ( not ( = ?auto_513392 ?auto_513398 ) ) ( not ( = ?auto_513392 ?auto_513399 ) ) ( not ( = ?auto_513393 ?auto_513394 ) ) ( not ( = ?auto_513393 ?auto_513395 ) ) ( not ( = ?auto_513393 ?auto_513396 ) ) ( not ( = ?auto_513393 ?auto_513397 ) ) ( not ( = ?auto_513393 ?auto_513398 ) ) ( not ( = ?auto_513393 ?auto_513399 ) ) ( not ( = ?auto_513394 ?auto_513395 ) ) ( not ( = ?auto_513394 ?auto_513396 ) ) ( not ( = ?auto_513394 ?auto_513397 ) ) ( not ( = ?auto_513394 ?auto_513398 ) ) ( not ( = ?auto_513394 ?auto_513399 ) ) ( not ( = ?auto_513395 ?auto_513396 ) ) ( not ( = ?auto_513395 ?auto_513397 ) ) ( not ( = ?auto_513395 ?auto_513398 ) ) ( not ( = ?auto_513395 ?auto_513399 ) ) ( not ( = ?auto_513396 ?auto_513397 ) ) ( not ( = ?auto_513396 ?auto_513398 ) ) ( not ( = ?auto_513396 ?auto_513399 ) ) ( not ( = ?auto_513397 ?auto_513398 ) ) ( not ( = ?auto_513397 ?auto_513399 ) ) ( not ( = ?auto_513398 ?auto_513399 ) ) ( ON ?auto_513397 ?auto_513398 ) ( ON ?auto_513396 ?auto_513397 ) ( ON ?auto_513395 ?auto_513396 ) ( CLEAR ?auto_513393 ) ( ON ?auto_513394 ?auto_513395 ) ( CLEAR ?auto_513394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_513384 ?auto_513385 ?auto_513386 ?auto_513387 ?auto_513388 ?auto_513389 ?auto_513390 ?auto_513391 ?auto_513392 ?auto_513393 ?auto_513394 )
      ( MAKE-15PILE ?auto_513384 ?auto_513385 ?auto_513386 ?auto_513387 ?auto_513388 ?auto_513389 ?auto_513390 ?auto_513391 ?auto_513392 ?auto_513393 ?auto_513394 ?auto_513395 ?auto_513396 ?auto_513397 ?auto_513398 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513446 - BLOCK
      ?auto_513447 - BLOCK
      ?auto_513448 - BLOCK
      ?auto_513449 - BLOCK
      ?auto_513450 - BLOCK
      ?auto_513451 - BLOCK
      ?auto_513452 - BLOCK
      ?auto_513453 - BLOCK
      ?auto_513454 - BLOCK
      ?auto_513455 - BLOCK
      ?auto_513456 - BLOCK
      ?auto_513457 - BLOCK
      ?auto_513458 - BLOCK
      ?auto_513459 - BLOCK
      ?auto_513460 - BLOCK
    )
    :vars
    (
      ?auto_513461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513460 ?auto_513461 ) ( ON-TABLE ?auto_513446 ) ( ON ?auto_513447 ?auto_513446 ) ( ON ?auto_513448 ?auto_513447 ) ( ON ?auto_513449 ?auto_513448 ) ( ON ?auto_513450 ?auto_513449 ) ( ON ?auto_513451 ?auto_513450 ) ( ON ?auto_513452 ?auto_513451 ) ( ON ?auto_513453 ?auto_513452 ) ( ON ?auto_513454 ?auto_513453 ) ( not ( = ?auto_513446 ?auto_513447 ) ) ( not ( = ?auto_513446 ?auto_513448 ) ) ( not ( = ?auto_513446 ?auto_513449 ) ) ( not ( = ?auto_513446 ?auto_513450 ) ) ( not ( = ?auto_513446 ?auto_513451 ) ) ( not ( = ?auto_513446 ?auto_513452 ) ) ( not ( = ?auto_513446 ?auto_513453 ) ) ( not ( = ?auto_513446 ?auto_513454 ) ) ( not ( = ?auto_513446 ?auto_513455 ) ) ( not ( = ?auto_513446 ?auto_513456 ) ) ( not ( = ?auto_513446 ?auto_513457 ) ) ( not ( = ?auto_513446 ?auto_513458 ) ) ( not ( = ?auto_513446 ?auto_513459 ) ) ( not ( = ?auto_513446 ?auto_513460 ) ) ( not ( = ?auto_513446 ?auto_513461 ) ) ( not ( = ?auto_513447 ?auto_513448 ) ) ( not ( = ?auto_513447 ?auto_513449 ) ) ( not ( = ?auto_513447 ?auto_513450 ) ) ( not ( = ?auto_513447 ?auto_513451 ) ) ( not ( = ?auto_513447 ?auto_513452 ) ) ( not ( = ?auto_513447 ?auto_513453 ) ) ( not ( = ?auto_513447 ?auto_513454 ) ) ( not ( = ?auto_513447 ?auto_513455 ) ) ( not ( = ?auto_513447 ?auto_513456 ) ) ( not ( = ?auto_513447 ?auto_513457 ) ) ( not ( = ?auto_513447 ?auto_513458 ) ) ( not ( = ?auto_513447 ?auto_513459 ) ) ( not ( = ?auto_513447 ?auto_513460 ) ) ( not ( = ?auto_513447 ?auto_513461 ) ) ( not ( = ?auto_513448 ?auto_513449 ) ) ( not ( = ?auto_513448 ?auto_513450 ) ) ( not ( = ?auto_513448 ?auto_513451 ) ) ( not ( = ?auto_513448 ?auto_513452 ) ) ( not ( = ?auto_513448 ?auto_513453 ) ) ( not ( = ?auto_513448 ?auto_513454 ) ) ( not ( = ?auto_513448 ?auto_513455 ) ) ( not ( = ?auto_513448 ?auto_513456 ) ) ( not ( = ?auto_513448 ?auto_513457 ) ) ( not ( = ?auto_513448 ?auto_513458 ) ) ( not ( = ?auto_513448 ?auto_513459 ) ) ( not ( = ?auto_513448 ?auto_513460 ) ) ( not ( = ?auto_513448 ?auto_513461 ) ) ( not ( = ?auto_513449 ?auto_513450 ) ) ( not ( = ?auto_513449 ?auto_513451 ) ) ( not ( = ?auto_513449 ?auto_513452 ) ) ( not ( = ?auto_513449 ?auto_513453 ) ) ( not ( = ?auto_513449 ?auto_513454 ) ) ( not ( = ?auto_513449 ?auto_513455 ) ) ( not ( = ?auto_513449 ?auto_513456 ) ) ( not ( = ?auto_513449 ?auto_513457 ) ) ( not ( = ?auto_513449 ?auto_513458 ) ) ( not ( = ?auto_513449 ?auto_513459 ) ) ( not ( = ?auto_513449 ?auto_513460 ) ) ( not ( = ?auto_513449 ?auto_513461 ) ) ( not ( = ?auto_513450 ?auto_513451 ) ) ( not ( = ?auto_513450 ?auto_513452 ) ) ( not ( = ?auto_513450 ?auto_513453 ) ) ( not ( = ?auto_513450 ?auto_513454 ) ) ( not ( = ?auto_513450 ?auto_513455 ) ) ( not ( = ?auto_513450 ?auto_513456 ) ) ( not ( = ?auto_513450 ?auto_513457 ) ) ( not ( = ?auto_513450 ?auto_513458 ) ) ( not ( = ?auto_513450 ?auto_513459 ) ) ( not ( = ?auto_513450 ?auto_513460 ) ) ( not ( = ?auto_513450 ?auto_513461 ) ) ( not ( = ?auto_513451 ?auto_513452 ) ) ( not ( = ?auto_513451 ?auto_513453 ) ) ( not ( = ?auto_513451 ?auto_513454 ) ) ( not ( = ?auto_513451 ?auto_513455 ) ) ( not ( = ?auto_513451 ?auto_513456 ) ) ( not ( = ?auto_513451 ?auto_513457 ) ) ( not ( = ?auto_513451 ?auto_513458 ) ) ( not ( = ?auto_513451 ?auto_513459 ) ) ( not ( = ?auto_513451 ?auto_513460 ) ) ( not ( = ?auto_513451 ?auto_513461 ) ) ( not ( = ?auto_513452 ?auto_513453 ) ) ( not ( = ?auto_513452 ?auto_513454 ) ) ( not ( = ?auto_513452 ?auto_513455 ) ) ( not ( = ?auto_513452 ?auto_513456 ) ) ( not ( = ?auto_513452 ?auto_513457 ) ) ( not ( = ?auto_513452 ?auto_513458 ) ) ( not ( = ?auto_513452 ?auto_513459 ) ) ( not ( = ?auto_513452 ?auto_513460 ) ) ( not ( = ?auto_513452 ?auto_513461 ) ) ( not ( = ?auto_513453 ?auto_513454 ) ) ( not ( = ?auto_513453 ?auto_513455 ) ) ( not ( = ?auto_513453 ?auto_513456 ) ) ( not ( = ?auto_513453 ?auto_513457 ) ) ( not ( = ?auto_513453 ?auto_513458 ) ) ( not ( = ?auto_513453 ?auto_513459 ) ) ( not ( = ?auto_513453 ?auto_513460 ) ) ( not ( = ?auto_513453 ?auto_513461 ) ) ( not ( = ?auto_513454 ?auto_513455 ) ) ( not ( = ?auto_513454 ?auto_513456 ) ) ( not ( = ?auto_513454 ?auto_513457 ) ) ( not ( = ?auto_513454 ?auto_513458 ) ) ( not ( = ?auto_513454 ?auto_513459 ) ) ( not ( = ?auto_513454 ?auto_513460 ) ) ( not ( = ?auto_513454 ?auto_513461 ) ) ( not ( = ?auto_513455 ?auto_513456 ) ) ( not ( = ?auto_513455 ?auto_513457 ) ) ( not ( = ?auto_513455 ?auto_513458 ) ) ( not ( = ?auto_513455 ?auto_513459 ) ) ( not ( = ?auto_513455 ?auto_513460 ) ) ( not ( = ?auto_513455 ?auto_513461 ) ) ( not ( = ?auto_513456 ?auto_513457 ) ) ( not ( = ?auto_513456 ?auto_513458 ) ) ( not ( = ?auto_513456 ?auto_513459 ) ) ( not ( = ?auto_513456 ?auto_513460 ) ) ( not ( = ?auto_513456 ?auto_513461 ) ) ( not ( = ?auto_513457 ?auto_513458 ) ) ( not ( = ?auto_513457 ?auto_513459 ) ) ( not ( = ?auto_513457 ?auto_513460 ) ) ( not ( = ?auto_513457 ?auto_513461 ) ) ( not ( = ?auto_513458 ?auto_513459 ) ) ( not ( = ?auto_513458 ?auto_513460 ) ) ( not ( = ?auto_513458 ?auto_513461 ) ) ( not ( = ?auto_513459 ?auto_513460 ) ) ( not ( = ?auto_513459 ?auto_513461 ) ) ( not ( = ?auto_513460 ?auto_513461 ) ) ( ON ?auto_513459 ?auto_513460 ) ( ON ?auto_513458 ?auto_513459 ) ( ON ?auto_513457 ?auto_513458 ) ( ON ?auto_513456 ?auto_513457 ) ( CLEAR ?auto_513454 ) ( ON ?auto_513455 ?auto_513456 ) ( CLEAR ?auto_513455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_513446 ?auto_513447 ?auto_513448 ?auto_513449 ?auto_513450 ?auto_513451 ?auto_513452 ?auto_513453 ?auto_513454 ?auto_513455 )
      ( MAKE-15PILE ?auto_513446 ?auto_513447 ?auto_513448 ?auto_513449 ?auto_513450 ?auto_513451 ?auto_513452 ?auto_513453 ?auto_513454 ?auto_513455 ?auto_513456 ?auto_513457 ?auto_513458 ?auto_513459 ?auto_513460 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513508 - BLOCK
      ?auto_513509 - BLOCK
      ?auto_513510 - BLOCK
      ?auto_513511 - BLOCK
      ?auto_513512 - BLOCK
      ?auto_513513 - BLOCK
      ?auto_513514 - BLOCK
      ?auto_513515 - BLOCK
      ?auto_513516 - BLOCK
      ?auto_513517 - BLOCK
      ?auto_513518 - BLOCK
      ?auto_513519 - BLOCK
      ?auto_513520 - BLOCK
      ?auto_513521 - BLOCK
      ?auto_513522 - BLOCK
    )
    :vars
    (
      ?auto_513523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513522 ?auto_513523 ) ( ON-TABLE ?auto_513508 ) ( ON ?auto_513509 ?auto_513508 ) ( ON ?auto_513510 ?auto_513509 ) ( ON ?auto_513511 ?auto_513510 ) ( ON ?auto_513512 ?auto_513511 ) ( ON ?auto_513513 ?auto_513512 ) ( ON ?auto_513514 ?auto_513513 ) ( ON ?auto_513515 ?auto_513514 ) ( not ( = ?auto_513508 ?auto_513509 ) ) ( not ( = ?auto_513508 ?auto_513510 ) ) ( not ( = ?auto_513508 ?auto_513511 ) ) ( not ( = ?auto_513508 ?auto_513512 ) ) ( not ( = ?auto_513508 ?auto_513513 ) ) ( not ( = ?auto_513508 ?auto_513514 ) ) ( not ( = ?auto_513508 ?auto_513515 ) ) ( not ( = ?auto_513508 ?auto_513516 ) ) ( not ( = ?auto_513508 ?auto_513517 ) ) ( not ( = ?auto_513508 ?auto_513518 ) ) ( not ( = ?auto_513508 ?auto_513519 ) ) ( not ( = ?auto_513508 ?auto_513520 ) ) ( not ( = ?auto_513508 ?auto_513521 ) ) ( not ( = ?auto_513508 ?auto_513522 ) ) ( not ( = ?auto_513508 ?auto_513523 ) ) ( not ( = ?auto_513509 ?auto_513510 ) ) ( not ( = ?auto_513509 ?auto_513511 ) ) ( not ( = ?auto_513509 ?auto_513512 ) ) ( not ( = ?auto_513509 ?auto_513513 ) ) ( not ( = ?auto_513509 ?auto_513514 ) ) ( not ( = ?auto_513509 ?auto_513515 ) ) ( not ( = ?auto_513509 ?auto_513516 ) ) ( not ( = ?auto_513509 ?auto_513517 ) ) ( not ( = ?auto_513509 ?auto_513518 ) ) ( not ( = ?auto_513509 ?auto_513519 ) ) ( not ( = ?auto_513509 ?auto_513520 ) ) ( not ( = ?auto_513509 ?auto_513521 ) ) ( not ( = ?auto_513509 ?auto_513522 ) ) ( not ( = ?auto_513509 ?auto_513523 ) ) ( not ( = ?auto_513510 ?auto_513511 ) ) ( not ( = ?auto_513510 ?auto_513512 ) ) ( not ( = ?auto_513510 ?auto_513513 ) ) ( not ( = ?auto_513510 ?auto_513514 ) ) ( not ( = ?auto_513510 ?auto_513515 ) ) ( not ( = ?auto_513510 ?auto_513516 ) ) ( not ( = ?auto_513510 ?auto_513517 ) ) ( not ( = ?auto_513510 ?auto_513518 ) ) ( not ( = ?auto_513510 ?auto_513519 ) ) ( not ( = ?auto_513510 ?auto_513520 ) ) ( not ( = ?auto_513510 ?auto_513521 ) ) ( not ( = ?auto_513510 ?auto_513522 ) ) ( not ( = ?auto_513510 ?auto_513523 ) ) ( not ( = ?auto_513511 ?auto_513512 ) ) ( not ( = ?auto_513511 ?auto_513513 ) ) ( not ( = ?auto_513511 ?auto_513514 ) ) ( not ( = ?auto_513511 ?auto_513515 ) ) ( not ( = ?auto_513511 ?auto_513516 ) ) ( not ( = ?auto_513511 ?auto_513517 ) ) ( not ( = ?auto_513511 ?auto_513518 ) ) ( not ( = ?auto_513511 ?auto_513519 ) ) ( not ( = ?auto_513511 ?auto_513520 ) ) ( not ( = ?auto_513511 ?auto_513521 ) ) ( not ( = ?auto_513511 ?auto_513522 ) ) ( not ( = ?auto_513511 ?auto_513523 ) ) ( not ( = ?auto_513512 ?auto_513513 ) ) ( not ( = ?auto_513512 ?auto_513514 ) ) ( not ( = ?auto_513512 ?auto_513515 ) ) ( not ( = ?auto_513512 ?auto_513516 ) ) ( not ( = ?auto_513512 ?auto_513517 ) ) ( not ( = ?auto_513512 ?auto_513518 ) ) ( not ( = ?auto_513512 ?auto_513519 ) ) ( not ( = ?auto_513512 ?auto_513520 ) ) ( not ( = ?auto_513512 ?auto_513521 ) ) ( not ( = ?auto_513512 ?auto_513522 ) ) ( not ( = ?auto_513512 ?auto_513523 ) ) ( not ( = ?auto_513513 ?auto_513514 ) ) ( not ( = ?auto_513513 ?auto_513515 ) ) ( not ( = ?auto_513513 ?auto_513516 ) ) ( not ( = ?auto_513513 ?auto_513517 ) ) ( not ( = ?auto_513513 ?auto_513518 ) ) ( not ( = ?auto_513513 ?auto_513519 ) ) ( not ( = ?auto_513513 ?auto_513520 ) ) ( not ( = ?auto_513513 ?auto_513521 ) ) ( not ( = ?auto_513513 ?auto_513522 ) ) ( not ( = ?auto_513513 ?auto_513523 ) ) ( not ( = ?auto_513514 ?auto_513515 ) ) ( not ( = ?auto_513514 ?auto_513516 ) ) ( not ( = ?auto_513514 ?auto_513517 ) ) ( not ( = ?auto_513514 ?auto_513518 ) ) ( not ( = ?auto_513514 ?auto_513519 ) ) ( not ( = ?auto_513514 ?auto_513520 ) ) ( not ( = ?auto_513514 ?auto_513521 ) ) ( not ( = ?auto_513514 ?auto_513522 ) ) ( not ( = ?auto_513514 ?auto_513523 ) ) ( not ( = ?auto_513515 ?auto_513516 ) ) ( not ( = ?auto_513515 ?auto_513517 ) ) ( not ( = ?auto_513515 ?auto_513518 ) ) ( not ( = ?auto_513515 ?auto_513519 ) ) ( not ( = ?auto_513515 ?auto_513520 ) ) ( not ( = ?auto_513515 ?auto_513521 ) ) ( not ( = ?auto_513515 ?auto_513522 ) ) ( not ( = ?auto_513515 ?auto_513523 ) ) ( not ( = ?auto_513516 ?auto_513517 ) ) ( not ( = ?auto_513516 ?auto_513518 ) ) ( not ( = ?auto_513516 ?auto_513519 ) ) ( not ( = ?auto_513516 ?auto_513520 ) ) ( not ( = ?auto_513516 ?auto_513521 ) ) ( not ( = ?auto_513516 ?auto_513522 ) ) ( not ( = ?auto_513516 ?auto_513523 ) ) ( not ( = ?auto_513517 ?auto_513518 ) ) ( not ( = ?auto_513517 ?auto_513519 ) ) ( not ( = ?auto_513517 ?auto_513520 ) ) ( not ( = ?auto_513517 ?auto_513521 ) ) ( not ( = ?auto_513517 ?auto_513522 ) ) ( not ( = ?auto_513517 ?auto_513523 ) ) ( not ( = ?auto_513518 ?auto_513519 ) ) ( not ( = ?auto_513518 ?auto_513520 ) ) ( not ( = ?auto_513518 ?auto_513521 ) ) ( not ( = ?auto_513518 ?auto_513522 ) ) ( not ( = ?auto_513518 ?auto_513523 ) ) ( not ( = ?auto_513519 ?auto_513520 ) ) ( not ( = ?auto_513519 ?auto_513521 ) ) ( not ( = ?auto_513519 ?auto_513522 ) ) ( not ( = ?auto_513519 ?auto_513523 ) ) ( not ( = ?auto_513520 ?auto_513521 ) ) ( not ( = ?auto_513520 ?auto_513522 ) ) ( not ( = ?auto_513520 ?auto_513523 ) ) ( not ( = ?auto_513521 ?auto_513522 ) ) ( not ( = ?auto_513521 ?auto_513523 ) ) ( not ( = ?auto_513522 ?auto_513523 ) ) ( ON ?auto_513521 ?auto_513522 ) ( ON ?auto_513520 ?auto_513521 ) ( ON ?auto_513519 ?auto_513520 ) ( ON ?auto_513518 ?auto_513519 ) ( ON ?auto_513517 ?auto_513518 ) ( CLEAR ?auto_513515 ) ( ON ?auto_513516 ?auto_513517 ) ( CLEAR ?auto_513516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_513508 ?auto_513509 ?auto_513510 ?auto_513511 ?auto_513512 ?auto_513513 ?auto_513514 ?auto_513515 ?auto_513516 )
      ( MAKE-15PILE ?auto_513508 ?auto_513509 ?auto_513510 ?auto_513511 ?auto_513512 ?auto_513513 ?auto_513514 ?auto_513515 ?auto_513516 ?auto_513517 ?auto_513518 ?auto_513519 ?auto_513520 ?auto_513521 ?auto_513522 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513570 - BLOCK
      ?auto_513571 - BLOCK
      ?auto_513572 - BLOCK
      ?auto_513573 - BLOCK
      ?auto_513574 - BLOCK
      ?auto_513575 - BLOCK
      ?auto_513576 - BLOCK
      ?auto_513577 - BLOCK
      ?auto_513578 - BLOCK
      ?auto_513579 - BLOCK
      ?auto_513580 - BLOCK
      ?auto_513581 - BLOCK
      ?auto_513582 - BLOCK
      ?auto_513583 - BLOCK
      ?auto_513584 - BLOCK
    )
    :vars
    (
      ?auto_513585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513584 ?auto_513585 ) ( ON-TABLE ?auto_513570 ) ( ON ?auto_513571 ?auto_513570 ) ( ON ?auto_513572 ?auto_513571 ) ( ON ?auto_513573 ?auto_513572 ) ( ON ?auto_513574 ?auto_513573 ) ( ON ?auto_513575 ?auto_513574 ) ( ON ?auto_513576 ?auto_513575 ) ( not ( = ?auto_513570 ?auto_513571 ) ) ( not ( = ?auto_513570 ?auto_513572 ) ) ( not ( = ?auto_513570 ?auto_513573 ) ) ( not ( = ?auto_513570 ?auto_513574 ) ) ( not ( = ?auto_513570 ?auto_513575 ) ) ( not ( = ?auto_513570 ?auto_513576 ) ) ( not ( = ?auto_513570 ?auto_513577 ) ) ( not ( = ?auto_513570 ?auto_513578 ) ) ( not ( = ?auto_513570 ?auto_513579 ) ) ( not ( = ?auto_513570 ?auto_513580 ) ) ( not ( = ?auto_513570 ?auto_513581 ) ) ( not ( = ?auto_513570 ?auto_513582 ) ) ( not ( = ?auto_513570 ?auto_513583 ) ) ( not ( = ?auto_513570 ?auto_513584 ) ) ( not ( = ?auto_513570 ?auto_513585 ) ) ( not ( = ?auto_513571 ?auto_513572 ) ) ( not ( = ?auto_513571 ?auto_513573 ) ) ( not ( = ?auto_513571 ?auto_513574 ) ) ( not ( = ?auto_513571 ?auto_513575 ) ) ( not ( = ?auto_513571 ?auto_513576 ) ) ( not ( = ?auto_513571 ?auto_513577 ) ) ( not ( = ?auto_513571 ?auto_513578 ) ) ( not ( = ?auto_513571 ?auto_513579 ) ) ( not ( = ?auto_513571 ?auto_513580 ) ) ( not ( = ?auto_513571 ?auto_513581 ) ) ( not ( = ?auto_513571 ?auto_513582 ) ) ( not ( = ?auto_513571 ?auto_513583 ) ) ( not ( = ?auto_513571 ?auto_513584 ) ) ( not ( = ?auto_513571 ?auto_513585 ) ) ( not ( = ?auto_513572 ?auto_513573 ) ) ( not ( = ?auto_513572 ?auto_513574 ) ) ( not ( = ?auto_513572 ?auto_513575 ) ) ( not ( = ?auto_513572 ?auto_513576 ) ) ( not ( = ?auto_513572 ?auto_513577 ) ) ( not ( = ?auto_513572 ?auto_513578 ) ) ( not ( = ?auto_513572 ?auto_513579 ) ) ( not ( = ?auto_513572 ?auto_513580 ) ) ( not ( = ?auto_513572 ?auto_513581 ) ) ( not ( = ?auto_513572 ?auto_513582 ) ) ( not ( = ?auto_513572 ?auto_513583 ) ) ( not ( = ?auto_513572 ?auto_513584 ) ) ( not ( = ?auto_513572 ?auto_513585 ) ) ( not ( = ?auto_513573 ?auto_513574 ) ) ( not ( = ?auto_513573 ?auto_513575 ) ) ( not ( = ?auto_513573 ?auto_513576 ) ) ( not ( = ?auto_513573 ?auto_513577 ) ) ( not ( = ?auto_513573 ?auto_513578 ) ) ( not ( = ?auto_513573 ?auto_513579 ) ) ( not ( = ?auto_513573 ?auto_513580 ) ) ( not ( = ?auto_513573 ?auto_513581 ) ) ( not ( = ?auto_513573 ?auto_513582 ) ) ( not ( = ?auto_513573 ?auto_513583 ) ) ( not ( = ?auto_513573 ?auto_513584 ) ) ( not ( = ?auto_513573 ?auto_513585 ) ) ( not ( = ?auto_513574 ?auto_513575 ) ) ( not ( = ?auto_513574 ?auto_513576 ) ) ( not ( = ?auto_513574 ?auto_513577 ) ) ( not ( = ?auto_513574 ?auto_513578 ) ) ( not ( = ?auto_513574 ?auto_513579 ) ) ( not ( = ?auto_513574 ?auto_513580 ) ) ( not ( = ?auto_513574 ?auto_513581 ) ) ( not ( = ?auto_513574 ?auto_513582 ) ) ( not ( = ?auto_513574 ?auto_513583 ) ) ( not ( = ?auto_513574 ?auto_513584 ) ) ( not ( = ?auto_513574 ?auto_513585 ) ) ( not ( = ?auto_513575 ?auto_513576 ) ) ( not ( = ?auto_513575 ?auto_513577 ) ) ( not ( = ?auto_513575 ?auto_513578 ) ) ( not ( = ?auto_513575 ?auto_513579 ) ) ( not ( = ?auto_513575 ?auto_513580 ) ) ( not ( = ?auto_513575 ?auto_513581 ) ) ( not ( = ?auto_513575 ?auto_513582 ) ) ( not ( = ?auto_513575 ?auto_513583 ) ) ( not ( = ?auto_513575 ?auto_513584 ) ) ( not ( = ?auto_513575 ?auto_513585 ) ) ( not ( = ?auto_513576 ?auto_513577 ) ) ( not ( = ?auto_513576 ?auto_513578 ) ) ( not ( = ?auto_513576 ?auto_513579 ) ) ( not ( = ?auto_513576 ?auto_513580 ) ) ( not ( = ?auto_513576 ?auto_513581 ) ) ( not ( = ?auto_513576 ?auto_513582 ) ) ( not ( = ?auto_513576 ?auto_513583 ) ) ( not ( = ?auto_513576 ?auto_513584 ) ) ( not ( = ?auto_513576 ?auto_513585 ) ) ( not ( = ?auto_513577 ?auto_513578 ) ) ( not ( = ?auto_513577 ?auto_513579 ) ) ( not ( = ?auto_513577 ?auto_513580 ) ) ( not ( = ?auto_513577 ?auto_513581 ) ) ( not ( = ?auto_513577 ?auto_513582 ) ) ( not ( = ?auto_513577 ?auto_513583 ) ) ( not ( = ?auto_513577 ?auto_513584 ) ) ( not ( = ?auto_513577 ?auto_513585 ) ) ( not ( = ?auto_513578 ?auto_513579 ) ) ( not ( = ?auto_513578 ?auto_513580 ) ) ( not ( = ?auto_513578 ?auto_513581 ) ) ( not ( = ?auto_513578 ?auto_513582 ) ) ( not ( = ?auto_513578 ?auto_513583 ) ) ( not ( = ?auto_513578 ?auto_513584 ) ) ( not ( = ?auto_513578 ?auto_513585 ) ) ( not ( = ?auto_513579 ?auto_513580 ) ) ( not ( = ?auto_513579 ?auto_513581 ) ) ( not ( = ?auto_513579 ?auto_513582 ) ) ( not ( = ?auto_513579 ?auto_513583 ) ) ( not ( = ?auto_513579 ?auto_513584 ) ) ( not ( = ?auto_513579 ?auto_513585 ) ) ( not ( = ?auto_513580 ?auto_513581 ) ) ( not ( = ?auto_513580 ?auto_513582 ) ) ( not ( = ?auto_513580 ?auto_513583 ) ) ( not ( = ?auto_513580 ?auto_513584 ) ) ( not ( = ?auto_513580 ?auto_513585 ) ) ( not ( = ?auto_513581 ?auto_513582 ) ) ( not ( = ?auto_513581 ?auto_513583 ) ) ( not ( = ?auto_513581 ?auto_513584 ) ) ( not ( = ?auto_513581 ?auto_513585 ) ) ( not ( = ?auto_513582 ?auto_513583 ) ) ( not ( = ?auto_513582 ?auto_513584 ) ) ( not ( = ?auto_513582 ?auto_513585 ) ) ( not ( = ?auto_513583 ?auto_513584 ) ) ( not ( = ?auto_513583 ?auto_513585 ) ) ( not ( = ?auto_513584 ?auto_513585 ) ) ( ON ?auto_513583 ?auto_513584 ) ( ON ?auto_513582 ?auto_513583 ) ( ON ?auto_513581 ?auto_513582 ) ( ON ?auto_513580 ?auto_513581 ) ( ON ?auto_513579 ?auto_513580 ) ( ON ?auto_513578 ?auto_513579 ) ( CLEAR ?auto_513576 ) ( ON ?auto_513577 ?auto_513578 ) ( CLEAR ?auto_513577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_513570 ?auto_513571 ?auto_513572 ?auto_513573 ?auto_513574 ?auto_513575 ?auto_513576 ?auto_513577 )
      ( MAKE-15PILE ?auto_513570 ?auto_513571 ?auto_513572 ?auto_513573 ?auto_513574 ?auto_513575 ?auto_513576 ?auto_513577 ?auto_513578 ?auto_513579 ?auto_513580 ?auto_513581 ?auto_513582 ?auto_513583 ?auto_513584 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513632 - BLOCK
      ?auto_513633 - BLOCK
      ?auto_513634 - BLOCK
      ?auto_513635 - BLOCK
      ?auto_513636 - BLOCK
      ?auto_513637 - BLOCK
      ?auto_513638 - BLOCK
      ?auto_513639 - BLOCK
      ?auto_513640 - BLOCK
      ?auto_513641 - BLOCK
      ?auto_513642 - BLOCK
      ?auto_513643 - BLOCK
      ?auto_513644 - BLOCK
      ?auto_513645 - BLOCK
      ?auto_513646 - BLOCK
    )
    :vars
    (
      ?auto_513647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513646 ?auto_513647 ) ( ON-TABLE ?auto_513632 ) ( ON ?auto_513633 ?auto_513632 ) ( ON ?auto_513634 ?auto_513633 ) ( ON ?auto_513635 ?auto_513634 ) ( ON ?auto_513636 ?auto_513635 ) ( ON ?auto_513637 ?auto_513636 ) ( not ( = ?auto_513632 ?auto_513633 ) ) ( not ( = ?auto_513632 ?auto_513634 ) ) ( not ( = ?auto_513632 ?auto_513635 ) ) ( not ( = ?auto_513632 ?auto_513636 ) ) ( not ( = ?auto_513632 ?auto_513637 ) ) ( not ( = ?auto_513632 ?auto_513638 ) ) ( not ( = ?auto_513632 ?auto_513639 ) ) ( not ( = ?auto_513632 ?auto_513640 ) ) ( not ( = ?auto_513632 ?auto_513641 ) ) ( not ( = ?auto_513632 ?auto_513642 ) ) ( not ( = ?auto_513632 ?auto_513643 ) ) ( not ( = ?auto_513632 ?auto_513644 ) ) ( not ( = ?auto_513632 ?auto_513645 ) ) ( not ( = ?auto_513632 ?auto_513646 ) ) ( not ( = ?auto_513632 ?auto_513647 ) ) ( not ( = ?auto_513633 ?auto_513634 ) ) ( not ( = ?auto_513633 ?auto_513635 ) ) ( not ( = ?auto_513633 ?auto_513636 ) ) ( not ( = ?auto_513633 ?auto_513637 ) ) ( not ( = ?auto_513633 ?auto_513638 ) ) ( not ( = ?auto_513633 ?auto_513639 ) ) ( not ( = ?auto_513633 ?auto_513640 ) ) ( not ( = ?auto_513633 ?auto_513641 ) ) ( not ( = ?auto_513633 ?auto_513642 ) ) ( not ( = ?auto_513633 ?auto_513643 ) ) ( not ( = ?auto_513633 ?auto_513644 ) ) ( not ( = ?auto_513633 ?auto_513645 ) ) ( not ( = ?auto_513633 ?auto_513646 ) ) ( not ( = ?auto_513633 ?auto_513647 ) ) ( not ( = ?auto_513634 ?auto_513635 ) ) ( not ( = ?auto_513634 ?auto_513636 ) ) ( not ( = ?auto_513634 ?auto_513637 ) ) ( not ( = ?auto_513634 ?auto_513638 ) ) ( not ( = ?auto_513634 ?auto_513639 ) ) ( not ( = ?auto_513634 ?auto_513640 ) ) ( not ( = ?auto_513634 ?auto_513641 ) ) ( not ( = ?auto_513634 ?auto_513642 ) ) ( not ( = ?auto_513634 ?auto_513643 ) ) ( not ( = ?auto_513634 ?auto_513644 ) ) ( not ( = ?auto_513634 ?auto_513645 ) ) ( not ( = ?auto_513634 ?auto_513646 ) ) ( not ( = ?auto_513634 ?auto_513647 ) ) ( not ( = ?auto_513635 ?auto_513636 ) ) ( not ( = ?auto_513635 ?auto_513637 ) ) ( not ( = ?auto_513635 ?auto_513638 ) ) ( not ( = ?auto_513635 ?auto_513639 ) ) ( not ( = ?auto_513635 ?auto_513640 ) ) ( not ( = ?auto_513635 ?auto_513641 ) ) ( not ( = ?auto_513635 ?auto_513642 ) ) ( not ( = ?auto_513635 ?auto_513643 ) ) ( not ( = ?auto_513635 ?auto_513644 ) ) ( not ( = ?auto_513635 ?auto_513645 ) ) ( not ( = ?auto_513635 ?auto_513646 ) ) ( not ( = ?auto_513635 ?auto_513647 ) ) ( not ( = ?auto_513636 ?auto_513637 ) ) ( not ( = ?auto_513636 ?auto_513638 ) ) ( not ( = ?auto_513636 ?auto_513639 ) ) ( not ( = ?auto_513636 ?auto_513640 ) ) ( not ( = ?auto_513636 ?auto_513641 ) ) ( not ( = ?auto_513636 ?auto_513642 ) ) ( not ( = ?auto_513636 ?auto_513643 ) ) ( not ( = ?auto_513636 ?auto_513644 ) ) ( not ( = ?auto_513636 ?auto_513645 ) ) ( not ( = ?auto_513636 ?auto_513646 ) ) ( not ( = ?auto_513636 ?auto_513647 ) ) ( not ( = ?auto_513637 ?auto_513638 ) ) ( not ( = ?auto_513637 ?auto_513639 ) ) ( not ( = ?auto_513637 ?auto_513640 ) ) ( not ( = ?auto_513637 ?auto_513641 ) ) ( not ( = ?auto_513637 ?auto_513642 ) ) ( not ( = ?auto_513637 ?auto_513643 ) ) ( not ( = ?auto_513637 ?auto_513644 ) ) ( not ( = ?auto_513637 ?auto_513645 ) ) ( not ( = ?auto_513637 ?auto_513646 ) ) ( not ( = ?auto_513637 ?auto_513647 ) ) ( not ( = ?auto_513638 ?auto_513639 ) ) ( not ( = ?auto_513638 ?auto_513640 ) ) ( not ( = ?auto_513638 ?auto_513641 ) ) ( not ( = ?auto_513638 ?auto_513642 ) ) ( not ( = ?auto_513638 ?auto_513643 ) ) ( not ( = ?auto_513638 ?auto_513644 ) ) ( not ( = ?auto_513638 ?auto_513645 ) ) ( not ( = ?auto_513638 ?auto_513646 ) ) ( not ( = ?auto_513638 ?auto_513647 ) ) ( not ( = ?auto_513639 ?auto_513640 ) ) ( not ( = ?auto_513639 ?auto_513641 ) ) ( not ( = ?auto_513639 ?auto_513642 ) ) ( not ( = ?auto_513639 ?auto_513643 ) ) ( not ( = ?auto_513639 ?auto_513644 ) ) ( not ( = ?auto_513639 ?auto_513645 ) ) ( not ( = ?auto_513639 ?auto_513646 ) ) ( not ( = ?auto_513639 ?auto_513647 ) ) ( not ( = ?auto_513640 ?auto_513641 ) ) ( not ( = ?auto_513640 ?auto_513642 ) ) ( not ( = ?auto_513640 ?auto_513643 ) ) ( not ( = ?auto_513640 ?auto_513644 ) ) ( not ( = ?auto_513640 ?auto_513645 ) ) ( not ( = ?auto_513640 ?auto_513646 ) ) ( not ( = ?auto_513640 ?auto_513647 ) ) ( not ( = ?auto_513641 ?auto_513642 ) ) ( not ( = ?auto_513641 ?auto_513643 ) ) ( not ( = ?auto_513641 ?auto_513644 ) ) ( not ( = ?auto_513641 ?auto_513645 ) ) ( not ( = ?auto_513641 ?auto_513646 ) ) ( not ( = ?auto_513641 ?auto_513647 ) ) ( not ( = ?auto_513642 ?auto_513643 ) ) ( not ( = ?auto_513642 ?auto_513644 ) ) ( not ( = ?auto_513642 ?auto_513645 ) ) ( not ( = ?auto_513642 ?auto_513646 ) ) ( not ( = ?auto_513642 ?auto_513647 ) ) ( not ( = ?auto_513643 ?auto_513644 ) ) ( not ( = ?auto_513643 ?auto_513645 ) ) ( not ( = ?auto_513643 ?auto_513646 ) ) ( not ( = ?auto_513643 ?auto_513647 ) ) ( not ( = ?auto_513644 ?auto_513645 ) ) ( not ( = ?auto_513644 ?auto_513646 ) ) ( not ( = ?auto_513644 ?auto_513647 ) ) ( not ( = ?auto_513645 ?auto_513646 ) ) ( not ( = ?auto_513645 ?auto_513647 ) ) ( not ( = ?auto_513646 ?auto_513647 ) ) ( ON ?auto_513645 ?auto_513646 ) ( ON ?auto_513644 ?auto_513645 ) ( ON ?auto_513643 ?auto_513644 ) ( ON ?auto_513642 ?auto_513643 ) ( ON ?auto_513641 ?auto_513642 ) ( ON ?auto_513640 ?auto_513641 ) ( ON ?auto_513639 ?auto_513640 ) ( CLEAR ?auto_513637 ) ( ON ?auto_513638 ?auto_513639 ) ( CLEAR ?auto_513638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_513632 ?auto_513633 ?auto_513634 ?auto_513635 ?auto_513636 ?auto_513637 ?auto_513638 )
      ( MAKE-15PILE ?auto_513632 ?auto_513633 ?auto_513634 ?auto_513635 ?auto_513636 ?auto_513637 ?auto_513638 ?auto_513639 ?auto_513640 ?auto_513641 ?auto_513642 ?auto_513643 ?auto_513644 ?auto_513645 ?auto_513646 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513694 - BLOCK
      ?auto_513695 - BLOCK
      ?auto_513696 - BLOCK
      ?auto_513697 - BLOCK
      ?auto_513698 - BLOCK
      ?auto_513699 - BLOCK
      ?auto_513700 - BLOCK
      ?auto_513701 - BLOCK
      ?auto_513702 - BLOCK
      ?auto_513703 - BLOCK
      ?auto_513704 - BLOCK
      ?auto_513705 - BLOCK
      ?auto_513706 - BLOCK
      ?auto_513707 - BLOCK
      ?auto_513708 - BLOCK
    )
    :vars
    (
      ?auto_513709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513708 ?auto_513709 ) ( ON-TABLE ?auto_513694 ) ( ON ?auto_513695 ?auto_513694 ) ( ON ?auto_513696 ?auto_513695 ) ( ON ?auto_513697 ?auto_513696 ) ( ON ?auto_513698 ?auto_513697 ) ( not ( = ?auto_513694 ?auto_513695 ) ) ( not ( = ?auto_513694 ?auto_513696 ) ) ( not ( = ?auto_513694 ?auto_513697 ) ) ( not ( = ?auto_513694 ?auto_513698 ) ) ( not ( = ?auto_513694 ?auto_513699 ) ) ( not ( = ?auto_513694 ?auto_513700 ) ) ( not ( = ?auto_513694 ?auto_513701 ) ) ( not ( = ?auto_513694 ?auto_513702 ) ) ( not ( = ?auto_513694 ?auto_513703 ) ) ( not ( = ?auto_513694 ?auto_513704 ) ) ( not ( = ?auto_513694 ?auto_513705 ) ) ( not ( = ?auto_513694 ?auto_513706 ) ) ( not ( = ?auto_513694 ?auto_513707 ) ) ( not ( = ?auto_513694 ?auto_513708 ) ) ( not ( = ?auto_513694 ?auto_513709 ) ) ( not ( = ?auto_513695 ?auto_513696 ) ) ( not ( = ?auto_513695 ?auto_513697 ) ) ( not ( = ?auto_513695 ?auto_513698 ) ) ( not ( = ?auto_513695 ?auto_513699 ) ) ( not ( = ?auto_513695 ?auto_513700 ) ) ( not ( = ?auto_513695 ?auto_513701 ) ) ( not ( = ?auto_513695 ?auto_513702 ) ) ( not ( = ?auto_513695 ?auto_513703 ) ) ( not ( = ?auto_513695 ?auto_513704 ) ) ( not ( = ?auto_513695 ?auto_513705 ) ) ( not ( = ?auto_513695 ?auto_513706 ) ) ( not ( = ?auto_513695 ?auto_513707 ) ) ( not ( = ?auto_513695 ?auto_513708 ) ) ( not ( = ?auto_513695 ?auto_513709 ) ) ( not ( = ?auto_513696 ?auto_513697 ) ) ( not ( = ?auto_513696 ?auto_513698 ) ) ( not ( = ?auto_513696 ?auto_513699 ) ) ( not ( = ?auto_513696 ?auto_513700 ) ) ( not ( = ?auto_513696 ?auto_513701 ) ) ( not ( = ?auto_513696 ?auto_513702 ) ) ( not ( = ?auto_513696 ?auto_513703 ) ) ( not ( = ?auto_513696 ?auto_513704 ) ) ( not ( = ?auto_513696 ?auto_513705 ) ) ( not ( = ?auto_513696 ?auto_513706 ) ) ( not ( = ?auto_513696 ?auto_513707 ) ) ( not ( = ?auto_513696 ?auto_513708 ) ) ( not ( = ?auto_513696 ?auto_513709 ) ) ( not ( = ?auto_513697 ?auto_513698 ) ) ( not ( = ?auto_513697 ?auto_513699 ) ) ( not ( = ?auto_513697 ?auto_513700 ) ) ( not ( = ?auto_513697 ?auto_513701 ) ) ( not ( = ?auto_513697 ?auto_513702 ) ) ( not ( = ?auto_513697 ?auto_513703 ) ) ( not ( = ?auto_513697 ?auto_513704 ) ) ( not ( = ?auto_513697 ?auto_513705 ) ) ( not ( = ?auto_513697 ?auto_513706 ) ) ( not ( = ?auto_513697 ?auto_513707 ) ) ( not ( = ?auto_513697 ?auto_513708 ) ) ( not ( = ?auto_513697 ?auto_513709 ) ) ( not ( = ?auto_513698 ?auto_513699 ) ) ( not ( = ?auto_513698 ?auto_513700 ) ) ( not ( = ?auto_513698 ?auto_513701 ) ) ( not ( = ?auto_513698 ?auto_513702 ) ) ( not ( = ?auto_513698 ?auto_513703 ) ) ( not ( = ?auto_513698 ?auto_513704 ) ) ( not ( = ?auto_513698 ?auto_513705 ) ) ( not ( = ?auto_513698 ?auto_513706 ) ) ( not ( = ?auto_513698 ?auto_513707 ) ) ( not ( = ?auto_513698 ?auto_513708 ) ) ( not ( = ?auto_513698 ?auto_513709 ) ) ( not ( = ?auto_513699 ?auto_513700 ) ) ( not ( = ?auto_513699 ?auto_513701 ) ) ( not ( = ?auto_513699 ?auto_513702 ) ) ( not ( = ?auto_513699 ?auto_513703 ) ) ( not ( = ?auto_513699 ?auto_513704 ) ) ( not ( = ?auto_513699 ?auto_513705 ) ) ( not ( = ?auto_513699 ?auto_513706 ) ) ( not ( = ?auto_513699 ?auto_513707 ) ) ( not ( = ?auto_513699 ?auto_513708 ) ) ( not ( = ?auto_513699 ?auto_513709 ) ) ( not ( = ?auto_513700 ?auto_513701 ) ) ( not ( = ?auto_513700 ?auto_513702 ) ) ( not ( = ?auto_513700 ?auto_513703 ) ) ( not ( = ?auto_513700 ?auto_513704 ) ) ( not ( = ?auto_513700 ?auto_513705 ) ) ( not ( = ?auto_513700 ?auto_513706 ) ) ( not ( = ?auto_513700 ?auto_513707 ) ) ( not ( = ?auto_513700 ?auto_513708 ) ) ( not ( = ?auto_513700 ?auto_513709 ) ) ( not ( = ?auto_513701 ?auto_513702 ) ) ( not ( = ?auto_513701 ?auto_513703 ) ) ( not ( = ?auto_513701 ?auto_513704 ) ) ( not ( = ?auto_513701 ?auto_513705 ) ) ( not ( = ?auto_513701 ?auto_513706 ) ) ( not ( = ?auto_513701 ?auto_513707 ) ) ( not ( = ?auto_513701 ?auto_513708 ) ) ( not ( = ?auto_513701 ?auto_513709 ) ) ( not ( = ?auto_513702 ?auto_513703 ) ) ( not ( = ?auto_513702 ?auto_513704 ) ) ( not ( = ?auto_513702 ?auto_513705 ) ) ( not ( = ?auto_513702 ?auto_513706 ) ) ( not ( = ?auto_513702 ?auto_513707 ) ) ( not ( = ?auto_513702 ?auto_513708 ) ) ( not ( = ?auto_513702 ?auto_513709 ) ) ( not ( = ?auto_513703 ?auto_513704 ) ) ( not ( = ?auto_513703 ?auto_513705 ) ) ( not ( = ?auto_513703 ?auto_513706 ) ) ( not ( = ?auto_513703 ?auto_513707 ) ) ( not ( = ?auto_513703 ?auto_513708 ) ) ( not ( = ?auto_513703 ?auto_513709 ) ) ( not ( = ?auto_513704 ?auto_513705 ) ) ( not ( = ?auto_513704 ?auto_513706 ) ) ( not ( = ?auto_513704 ?auto_513707 ) ) ( not ( = ?auto_513704 ?auto_513708 ) ) ( not ( = ?auto_513704 ?auto_513709 ) ) ( not ( = ?auto_513705 ?auto_513706 ) ) ( not ( = ?auto_513705 ?auto_513707 ) ) ( not ( = ?auto_513705 ?auto_513708 ) ) ( not ( = ?auto_513705 ?auto_513709 ) ) ( not ( = ?auto_513706 ?auto_513707 ) ) ( not ( = ?auto_513706 ?auto_513708 ) ) ( not ( = ?auto_513706 ?auto_513709 ) ) ( not ( = ?auto_513707 ?auto_513708 ) ) ( not ( = ?auto_513707 ?auto_513709 ) ) ( not ( = ?auto_513708 ?auto_513709 ) ) ( ON ?auto_513707 ?auto_513708 ) ( ON ?auto_513706 ?auto_513707 ) ( ON ?auto_513705 ?auto_513706 ) ( ON ?auto_513704 ?auto_513705 ) ( ON ?auto_513703 ?auto_513704 ) ( ON ?auto_513702 ?auto_513703 ) ( ON ?auto_513701 ?auto_513702 ) ( ON ?auto_513700 ?auto_513701 ) ( CLEAR ?auto_513698 ) ( ON ?auto_513699 ?auto_513700 ) ( CLEAR ?auto_513699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_513694 ?auto_513695 ?auto_513696 ?auto_513697 ?auto_513698 ?auto_513699 )
      ( MAKE-15PILE ?auto_513694 ?auto_513695 ?auto_513696 ?auto_513697 ?auto_513698 ?auto_513699 ?auto_513700 ?auto_513701 ?auto_513702 ?auto_513703 ?auto_513704 ?auto_513705 ?auto_513706 ?auto_513707 ?auto_513708 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513756 - BLOCK
      ?auto_513757 - BLOCK
      ?auto_513758 - BLOCK
      ?auto_513759 - BLOCK
      ?auto_513760 - BLOCK
      ?auto_513761 - BLOCK
      ?auto_513762 - BLOCK
      ?auto_513763 - BLOCK
      ?auto_513764 - BLOCK
      ?auto_513765 - BLOCK
      ?auto_513766 - BLOCK
      ?auto_513767 - BLOCK
      ?auto_513768 - BLOCK
      ?auto_513769 - BLOCK
      ?auto_513770 - BLOCK
    )
    :vars
    (
      ?auto_513771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513770 ?auto_513771 ) ( ON-TABLE ?auto_513756 ) ( ON ?auto_513757 ?auto_513756 ) ( ON ?auto_513758 ?auto_513757 ) ( ON ?auto_513759 ?auto_513758 ) ( not ( = ?auto_513756 ?auto_513757 ) ) ( not ( = ?auto_513756 ?auto_513758 ) ) ( not ( = ?auto_513756 ?auto_513759 ) ) ( not ( = ?auto_513756 ?auto_513760 ) ) ( not ( = ?auto_513756 ?auto_513761 ) ) ( not ( = ?auto_513756 ?auto_513762 ) ) ( not ( = ?auto_513756 ?auto_513763 ) ) ( not ( = ?auto_513756 ?auto_513764 ) ) ( not ( = ?auto_513756 ?auto_513765 ) ) ( not ( = ?auto_513756 ?auto_513766 ) ) ( not ( = ?auto_513756 ?auto_513767 ) ) ( not ( = ?auto_513756 ?auto_513768 ) ) ( not ( = ?auto_513756 ?auto_513769 ) ) ( not ( = ?auto_513756 ?auto_513770 ) ) ( not ( = ?auto_513756 ?auto_513771 ) ) ( not ( = ?auto_513757 ?auto_513758 ) ) ( not ( = ?auto_513757 ?auto_513759 ) ) ( not ( = ?auto_513757 ?auto_513760 ) ) ( not ( = ?auto_513757 ?auto_513761 ) ) ( not ( = ?auto_513757 ?auto_513762 ) ) ( not ( = ?auto_513757 ?auto_513763 ) ) ( not ( = ?auto_513757 ?auto_513764 ) ) ( not ( = ?auto_513757 ?auto_513765 ) ) ( not ( = ?auto_513757 ?auto_513766 ) ) ( not ( = ?auto_513757 ?auto_513767 ) ) ( not ( = ?auto_513757 ?auto_513768 ) ) ( not ( = ?auto_513757 ?auto_513769 ) ) ( not ( = ?auto_513757 ?auto_513770 ) ) ( not ( = ?auto_513757 ?auto_513771 ) ) ( not ( = ?auto_513758 ?auto_513759 ) ) ( not ( = ?auto_513758 ?auto_513760 ) ) ( not ( = ?auto_513758 ?auto_513761 ) ) ( not ( = ?auto_513758 ?auto_513762 ) ) ( not ( = ?auto_513758 ?auto_513763 ) ) ( not ( = ?auto_513758 ?auto_513764 ) ) ( not ( = ?auto_513758 ?auto_513765 ) ) ( not ( = ?auto_513758 ?auto_513766 ) ) ( not ( = ?auto_513758 ?auto_513767 ) ) ( not ( = ?auto_513758 ?auto_513768 ) ) ( not ( = ?auto_513758 ?auto_513769 ) ) ( not ( = ?auto_513758 ?auto_513770 ) ) ( not ( = ?auto_513758 ?auto_513771 ) ) ( not ( = ?auto_513759 ?auto_513760 ) ) ( not ( = ?auto_513759 ?auto_513761 ) ) ( not ( = ?auto_513759 ?auto_513762 ) ) ( not ( = ?auto_513759 ?auto_513763 ) ) ( not ( = ?auto_513759 ?auto_513764 ) ) ( not ( = ?auto_513759 ?auto_513765 ) ) ( not ( = ?auto_513759 ?auto_513766 ) ) ( not ( = ?auto_513759 ?auto_513767 ) ) ( not ( = ?auto_513759 ?auto_513768 ) ) ( not ( = ?auto_513759 ?auto_513769 ) ) ( not ( = ?auto_513759 ?auto_513770 ) ) ( not ( = ?auto_513759 ?auto_513771 ) ) ( not ( = ?auto_513760 ?auto_513761 ) ) ( not ( = ?auto_513760 ?auto_513762 ) ) ( not ( = ?auto_513760 ?auto_513763 ) ) ( not ( = ?auto_513760 ?auto_513764 ) ) ( not ( = ?auto_513760 ?auto_513765 ) ) ( not ( = ?auto_513760 ?auto_513766 ) ) ( not ( = ?auto_513760 ?auto_513767 ) ) ( not ( = ?auto_513760 ?auto_513768 ) ) ( not ( = ?auto_513760 ?auto_513769 ) ) ( not ( = ?auto_513760 ?auto_513770 ) ) ( not ( = ?auto_513760 ?auto_513771 ) ) ( not ( = ?auto_513761 ?auto_513762 ) ) ( not ( = ?auto_513761 ?auto_513763 ) ) ( not ( = ?auto_513761 ?auto_513764 ) ) ( not ( = ?auto_513761 ?auto_513765 ) ) ( not ( = ?auto_513761 ?auto_513766 ) ) ( not ( = ?auto_513761 ?auto_513767 ) ) ( not ( = ?auto_513761 ?auto_513768 ) ) ( not ( = ?auto_513761 ?auto_513769 ) ) ( not ( = ?auto_513761 ?auto_513770 ) ) ( not ( = ?auto_513761 ?auto_513771 ) ) ( not ( = ?auto_513762 ?auto_513763 ) ) ( not ( = ?auto_513762 ?auto_513764 ) ) ( not ( = ?auto_513762 ?auto_513765 ) ) ( not ( = ?auto_513762 ?auto_513766 ) ) ( not ( = ?auto_513762 ?auto_513767 ) ) ( not ( = ?auto_513762 ?auto_513768 ) ) ( not ( = ?auto_513762 ?auto_513769 ) ) ( not ( = ?auto_513762 ?auto_513770 ) ) ( not ( = ?auto_513762 ?auto_513771 ) ) ( not ( = ?auto_513763 ?auto_513764 ) ) ( not ( = ?auto_513763 ?auto_513765 ) ) ( not ( = ?auto_513763 ?auto_513766 ) ) ( not ( = ?auto_513763 ?auto_513767 ) ) ( not ( = ?auto_513763 ?auto_513768 ) ) ( not ( = ?auto_513763 ?auto_513769 ) ) ( not ( = ?auto_513763 ?auto_513770 ) ) ( not ( = ?auto_513763 ?auto_513771 ) ) ( not ( = ?auto_513764 ?auto_513765 ) ) ( not ( = ?auto_513764 ?auto_513766 ) ) ( not ( = ?auto_513764 ?auto_513767 ) ) ( not ( = ?auto_513764 ?auto_513768 ) ) ( not ( = ?auto_513764 ?auto_513769 ) ) ( not ( = ?auto_513764 ?auto_513770 ) ) ( not ( = ?auto_513764 ?auto_513771 ) ) ( not ( = ?auto_513765 ?auto_513766 ) ) ( not ( = ?auto_513765 ?auto_513767 ) ) ( not ( = ?auto_513765 ?auto_513768 ) ) ( not ( = ?auto_513765 ?auto_513769 ) ) ( not ( = ?auto_513765 ?auto_513770 ) ) ( not ( = ?auto_513765 ?auto_513771 ) ) ( not ( = ?auto_513766 ?auto_513767 ) ) ( not ( = ?auto_513766 ?auto_513768 ) ) ( not ( = ?auto_513766 ?auto_513769 ) ) ( not ( = ?auto_513766 ?auto_513770 ) ) ( not ( = ?auto_513766 ?auto_513771 ) ) ( not ( = ?auto_513767 ?auto_513768 ) ) ( not ( = ?auto_513767 ?auto_513769 ) ) ( not ( = ?auto_513767 ?auto_513770 ) ) ( not ( = ?auto_513767 ?auto_513771 ) ) ( not ( = ?auto_513768 ?auto_513769 ) ) ( not ( = ?auto_513768 ?auto_513770 ) ) ( not ( = ?auto_513768 ?auto_513771 ) ) ( not ( = ?auto_513769 ?auto_513770 ) ) ( not ( = ?auto_513769 ?auto_513771 ) ) ( not ( = ?auto_513770 ?auto_513771 ) ) ( ON ?auto_513769 ?auto_513770 ) ( ON ?auto_513768 ?auto_513769 ) ( ON ?auto_513767 ?auto_513768 ) ( ON ?auto_513766 ?auto_513767 ) ( ON ?auto_513765 ?auto_513766 ) ( ON ?auto_513764 ?auto_513765 ) ( ON ?auto_513763 ?auto_513764 ) ( ON ?auto_513762 ?auto_513763 ) ( ON ?auto_513761 ?auto_513762 ) ( CLEAR ?auto_513759 ) ( ON ?auto_513760 ?auto_513761 ) ( CLEAR ?auto_513760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_513756 ?auto_513757 ?auto_513758 ?auto_513759 ?auto_513760 )
      ( MAKE-15PILE ?auto_513756 ?auto_513757 ?auto_513758 ?auto_513759 ?auto_513760 ?auto_513761 ?auto_513762 ?auto_513763 ?auto_513764 ?auto_513765 ?auto_513766 ?auto_513767 ?auto_513768 ?auto_513769 ?auto_513770 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513818 - BLOCK
      ?auto_513819 - BLOCK
      ?auto_513820 - BLOCK
      ?auto_513821 - BLOCK
      ?auto_513822 - BLOCK
      ?auto_513823 - BLOCK
      ?auto_513824 - BLOCK
      ?auto_513825 - BLOCK
      ?auto_513826 - BLOCK
      ?auto_513827 - BLOCK
      ?auto_513828 - BLOCK
      ?auto_513829 - BLOCK
      ?auto_513830 - BLOCK
      ?auto_513831 - BLOCK
      ?auto_513832 - BLOCK
    )
    :vars
    (
      ?auto_513833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513832 ?auto_513833 ) ( ON-TABLE ?auto_513818 ) ( ON ?auto_513819 ?auto_513818 ) ( ON ?auto_513820 ?auto_513819 ) ( not ( = ?auto_513818 ?auto_513819 ) ) ( not ( = ?auto_513818 ?auto_513820 ) ) ( not ( = ?auto_513818 ?auto_513821 ) ) ( not ( = ?auto_513818 ?auto_513822 ) ) ( not ( = ?auto_513818 ?auto_513823 ) ) ( not ( = ?auto_513818 ?auto_513824 ) ) ( not ( = ?auto_513818 ?auto_513825 ) ) ( not ( = ?auto_513818 ?auto_513826 ) ) ( not ( = ?auto_513818 ?auto_513827 ) ) ( not ( = ?auto_513818 ?auto_513828 ) ) ( not ( = ?auto_513818 ?auto_513829 ) ) ( not ( = ?auto_513818 ?auto_513830 ) ) ( not ( = ?auto_513818 ?auto_513831 ) ) ( not ( = ?auto_513818 ?auto_513832 ) ) ( not ( = ?auto_513818 ?auto_513833 ) ) ( not ( = ?auto_513819 ?auto_513820 ) ) ( not ( = ?auto_513819 ?auto_513821 ) ) ( not ( = ?auto_513819 ?auto_513822 ) ) ( not ( = ?auto_513819 ?auto_513823 ) ) ( not ( = ?auto_513819 ?auto_513824 ) ) ( not ( = ?auto_513819 ?auto_513825 ) ) ( not ( = ?auto_513819 ?auto_513826 ) ) ( not ( = ?auto_513819 ?auto_513827 ) ) ( not ( = ?auto_513819 ?auto_513828 ) ) ( not ( = ?auto_513819 ?auto_513829 ) ) ( not ( = ?auto_513819 ?auto_513830 ) ) ( not ( = ?auto_513819 ?auto_513831 ) ) ( not ( = ?auto_513819 ?auto_513832 ) ) ( not ( = ?auto_513819 ?auto_513833 ) ) ( not ( = ?auto_513820 ?auto_513821 ) ) ( not ( = ?auto_513820 ?auto_513822 ) ) ( not ( = ?auto_513820 ?auto_513823 ) ) ( not ( = ?auto_513820 ?auto_513824 ) ) ( not ( = ?auto_513820 ?auto_513825 ) ) ( not ( = ?auto_513820 ?auto_513826 ) ) ( not ( = ?auto_513820 ?auto_513827 ) ) ( not ( = ?auto_513820 ?auto_513828 ) ) ( not ( = ?auto_513820 ?auto_513829 ) ) ( not ( = ?auto_513820 ?auto_513830 ) ) ( not ( = ?auto_513820 ?auto_513831 ) ) ( not ( = ?auto_513820 ?auto_513832 ) ) ( not ( = ?auto_513820 ?auto_513833 ) ) ( not ( = ?auto_513821 ?auto_513822 ) ) ( not ( = ?auto_513821 ?auto_513823 ) ) ( not ( = ?auto_513821 ?auto_513824 ) ) ( not ( = ?auto_513821 ?auto_513825 ) ) ( not ( = ?auto_513821 ?auto_513826 ) ) ( not ( = ?auto_513821 ?auto_513827 ) ) ( not ( = ?auto_513821 ?auto_513828 ) ) ( not ( = ?auto_513821 ?auto_513829 ) ) ( not ( = ?auto_513821 ?auto_513830 ) ) ( not ( = ?auto_513821 ?auto_513831 ) ) ( not ( = ?auto_513821 ?auto_513832 ) ) ( not ( = ?auto_513821 ?auto_513833 ) ) ( not ( = ?auto_513822 ?auto_513823 ) ) ( not ( = ?auto_513822 ?auto_513824 ) ) ( not ( = ?auto_513822 ?auto_513825 ) ) ( not ( = ?auto_513822 ?auto_513826 ) ) ( not ( = ?auto_513822 ?auto_513827 ) ) ( not ( = ?auto_513822 ?auto_513828 ) ) ( not ( = ?auto_513822 ?auto_513829 ) ) ( not ( = ?auto_513822 ?auto_513830 ) ) ( not ( = ?auto_513822 ?auto_513831 ) ) ( not ( = ?auto_513822 ?auto_513832 ) ) ( not ( = ?auto_513822 ?auto_513833 ) ) ( not ( = ?auto_513823 ?auto_513824 ) ) ( not ( = ?auto_513823 ?auto_513825 ) ) ( not ( = ?auto_513823 ?auto_513826 ) ) ( not ( = ?auto_513823 ?auto_513827 ) ) ( not ( = ?auto_513823 ?auto_513828 ) ) ( not ( = ?auto_513823 ?auto_513829 ) ) ( not ( = ?auto_513823 ?auto_513830 ) ) ( not ( = ?auto_513823 ?auto_513831 ) ) ( not ( = ?auto_513823 ?auto_513832 ) ) ( not ( = ?auto_513823 ?auto_513833 ) ) ( not ( = ?auto_513824 ?auto_513825 ) ) ( not ( = ?auto_513824 ?auto_513826 ) ) ( not ( = ?auto_513824 ?auto_513827 ) ) ( not ( = ?auto_513824 ?auto_513828 ) ) ( not ( = ?auto_513824 ?auto_513829 ) ) ( not ( = ?auto_513824 ?auto_513830 ) ) ( not ( = ?auto_513824 ?auto_513831 ) ) ( not ( = ?auto_513824 ?auto_513832 ) ) ( not ( = ?auto_513824 ?auto_513833 ) ) ( not ( = ?auto_513825 ?auto_513826 ) ) ( not ( = ?auto_513825 ?auto_513827 ) ) ( not ( = ?auto_513825 ?auto_513828 ) ) ( not ( = ?auto_513825 ?auto_513829 ) ) ( not ( = ?auto_513825 ?auto_513830 ) ) ( not ( = ?auto_513825 ?auto_513831 ) ) ( not ( = ?auto_513825 ?auto_513832 ) ) ( not ( = ?auto_513825 ?auto_513833 ) ) ( not ( = ?auto_513826 ?auto_513827 ) ) ( not ( = ?auto_513826 ?auto_513828 ) ) ( not ( = ?auto_513826 ?auto_513829 ) ) ( not ( = ?auto_513826 ?auto_513830 ) ) ( not ( = ?auto_513826 ?auto_513831 ) ) ( not ( = ?auto_513826 ?auto_513832 ) ) ( not ( = ?auto_513826 ?auto_513833 ) ) ( not ( = ?auto_513827 ?auto_513828 ) ) ( not ( = ?auto_513827 ?auto_513829 ) ) ( not ( = ?auto_513827 ?auto_513830 ) ) ( not ( = ?auto_513827 ?auto_513831 ) ) ( not ( = ?auto_513827 ?auto_513832 ) ) ( not ( = ?auto_513827 ?auto_513833 ) ) ( not ( = ?auto_513828 ?auto_513829 ) ) ( not ( = ?auto_513828 ?auto_513830 ) ) ( not ( = ?auto_513828 ?auto_513831 ) ) ( not ( = ?auto_513828 ?auto_513832 ) ) ( not ( = ?auto_513828 ?auto_513833 ) ) ( not ( = ?auto_513829 ?auto_513830 ) ) ( not ( = ?auto_513829 ?auto_513831 ) ) ( not ( = ?auto_513829 ?auto_513832 ) ) ( not ( = ?auto_513829 ?auto_513833 ) ) ( not ( = ?auto_513830 ?auto_513831 ) ) ( not ( = ?auto_513830 ?auto_513832 ) ) ( not ( = ?auto_513830 ?auto_513833 ) ) ( not ( = ?auto_513831 ?auto_513832 ) ) ( not ( = ?auto_513831 ?auto_513833 ) ) ( not ( = ?auto_513832 ?auto_513833 ) ) ( ON ?auto_513831 ?auto_513832 ) ( ON ?auto_513830 ?auto_513831 ) ( ON ?auto_513829 ?auto_513830 ) ( ON ?auto_513828 ?auto_513829 ) ( ON ?auto_513827 ?auto_513828 ) ( ON ?auto_513826 ?auto_513827 ) ( ON ?auto_513825 ?auto_513826 ) ( ON ?auto_513824 ?auto_513825 ) ( ON ?auto_513823 ?auto_513824 ) ( ON ?auto_513822 ?auto_513823 ) ( CLEAR ?auto_513820 ) ( ON ?auto_513821 ?auto_513822 ) ( CLEAR ?auto_513821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_513818 ?auto_513819 ?auto_513820 ?auto_513821 )
      ( MAKE-15PILE ?auto_513818 ?auto_513819 ?auto_513820 ?auto_513821 ?auto_513822 ?auto_513823 ?auto_513824 ?auto_513825 ?auto_513826 ?auto_513827 ?auto_513828 ?auto_513829 ?auto_513830 ?auto_513831 ?auto_513832 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513880 - BLOCK
      ?auto_513881 - BLOCK
      ?auto_513882 - BLOCK
      ?auto_513883 - BLOCK
      ?auto_513884 - BLOCK
      ?auto_513885 - BLOCK
      ?auto_513886 - BLOCK
      ?auto_513887 - BLOCK
      ?auto_513888 - BLOCK
      ?auto_513889 - BLOCK
      ?auto_513890 - BLOCK
      ?auto_513891 - BLOCK
      ?auto_513892 - BLOCK
      ?auto_513893 - BLOCK
      ?auto_513894 - BLOCK
    )
    :vars
    (
      ?auto_513895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513894 ?auto_513895 ) ( ON-TABLE ?auto_513880 ) ( ON ?auto_513881 ?auto_513880 ) ( not ( = ?auto_513880 ?auto_513881 ) ) ( not ( = ?auto_513880 ?auto_513882 ) ) ( not ( = ?auto_513880 ?auto_513883 ) ) ( not ( = ?auto_513880 ?auto_513884 ) ) ( not ( = ?auto_513880 ?auto_513885 ) ) ( not ( = ?auto_513880 ?auto_513886 ) ) ( not ( = ?auto_513880 ?auto_513887 ) ) ( not ( = ?auto_513880 ?auto_513888 ) ) ( not ( = ?auto_513880 ?auto_513889 ) ) ( not ( = ?auto_513880 ?auto_513890 ) ) ( not ( = ?auto_513880 ?auto_513891 ) ) ( not ( = ?auto_513880 ?auto_513892 ) ) ( not ( = ?auto_513880 ?auto_513893 ) ) ( not ( = ?auto_513880 ?auto_513894 ) ) ( not ( = ?auto_513880 ?auto_513895 ) ) ( not ( = ?auto_513881 ?auto_513882 ) ) ( not ( = ?auto_513881 ?auto_513883 ) ) ( not ( = ?auto_513881 ?auto_513884 ) ) ( not ( = ?auto_513881 ?auto_513885 ) ) ( not ( = ?auto_513881 ?auto_513886 ) ) ( not ( = ?auto_513881 ?auto_513887 ) ) ( not ( = ?auto_513881 ?auto_513888 ) ) ( not ( = ?auto_513881 ?auto_513889 ) ) ( not ( = ?auto_513881 ?auto_513890 ) ) ( not ( = ?auto_513881 ?auto_513891 ) ) ( not ( = ?auto_513881 ?auto_513892 ) ) ( not ( = ?auto_513881 ?auto_513893 ) ) ( not ( = ?auto_513881 ?auto_513894 ) ) ( not ( = ?auto_513881 ?auto_513895 ) ) ( not ( = ?auto_513882 ?auto_513883 ) ) ( not ( = ?auto_513882 ?auto_513884 ) ) ( not ( = ?auto_513882 ?auto_513885 ) ) ( not ( = ?auto_513882 ?auto_513886 ) ) ( not ( = ?auto_513882 ?auto_513887 ) ) ( not ( = ?auto_513882 ?auto_513888 ) ) ( not ( = ?auto_513882 ?auto_513889 ) ) ( not ( = ?auto_513882 ?auto_513890 ) ) ( not ( = ?auto_513882 ?auto_513891 ) ) ( not ( = ?auto_513882 ?auto_513892 ) ) ( not ( = ?auto_513882 ?auto_513893 ) ) ( not ( = ?auto_513882 ?auto_513894 ) ) ( not ( = ?auto_513882 ?auto_513895 ) ) ( not ( = ?auto_513883 ?auto_513884 ) ) ( not ( = ?auto_513883 ?auto_513885 ) ) ( not ( = ?auto_513883 ?auto_513886 ) ) ( not ( = ?auto_513883 ?auto_513887 ) ) ( not ( = ?auto_513883 ?auto_513888 ) ) ( not ( = ?auto_513883 ?auto_513889 ) ) ( not ( = ?auto_513883 ?auto_513890 ) ) ( not ( = ?auto_513883 ?auto_513891 ) ) ( not ( = ?auto_513883 ?auto_513892 ) ) ( not ( = ?auto_513883 ?auto_513893 ) ) ( not ( = ?auto_513883 ?auto_513894 ) ) ( not ( = ?auto_513883 ?auto_513895 ) ) ( not ( = ?auto_513884 ?auto_513885 ) ) ( not ( = ?auto_513884 ?auto_513886 ) ) ( not ( = ?auto_513884 ?auto_513887 ) ) ( not ( = ?auto_513884 ?auto_513888 ) ) ( not ( = ?auto_513884 ?auto_513889 ) ) ( not ( = ?auto_513884 ?auto_513890 ) ) ( not ( = ?auto_513884 ?auto_513891 ) ) ( not ( = ?auto_513884 ?auto_513892 ) ) ( not ( = ?auto_513884 ?auto_513893 ) ) ( not ( = ?auto_513884 ?auto_513894 ) ) ( not ( = ?auto_513884 ?auto_513895 ) ) ( not ( = ?auto_513885 ?auto_513886 ) ) ( not ( = ?auto_513885 ?auto_513887 ) ) ( not ( = ?auto_513885 ?auto_513888 ) ) ( not ( = ?auto_513885 ?auto_513889 ) ) ( not ( = ?auto_513885 ?auto_513890 ) ) ( not ( = ?auto_513885 ?auto_513891 ) ) ( not ( = ?auto_513885 ?auto_513892 ) ) ( not ( = ?auto_513885 ?auto_513893 ) ) ( not ( = ?auto_513885 ?auto_513894 ) ) ( not ( = ?auto_513885 ?auto_513895 ) ) ( not ( = ?auto_513886 ?auto_513887 ) ) ( not ( = ?auto_513886 ?auto_513888 ) ) ( not ( = ?auto_513886 ?auto_513889 ) ) ( not ( = ?auto_513886 ?auto_513890 ) ) ( not ( = ?auto_513886 ?auto_513891 ) ) ( not ( = ?auto_513886 ?auto_513892 ) ) ( not ( = ?auto_513886 ?auto_513893 ) ) ( not ( = ?auto_513886 ?auto_513894 ) ) ( not ( = ?auto_513886 ?auto_513895 ) ) ( not ( = ?auto_513887 ?auto_513888 ) ) ( not ( = ?auto_513887 ?auto_513889 ) ) ( not ( = ?auto_513887 ?auto_513890 ) ) ( not ( = ?auto_513887 ?auto_513891 ) ) ( not ( = ?auto_513887 ?auto_513892 ) ) ( not ( = ?auto_513887 ?auto_513893 ) ) ( not ( = ?auto_513887 ?auto_513894 ) ) ( not ( = ?auto_513887 ?auto_513895 ) ) ( not ( = ?auto_513888 ?auto_513889 ) ) ( not ( = ?auto_513888 ?auto_513890 ) ) ( not ( = ?auto_513888 ?auto_513891 ) ) ( not ( = ?auto_513888 ?auto_513892 ) ) ( not ( = ?auto_513888 ?auto_513893 ) ) ( not ( = ?auto_513888 ?auto_513894 ) ) ( not ( = ?auto_513888 ?auto_513895 ) ) ( not ( = ?auto_513889 ?auto_513890 ) ) ( not ( = ?auto_513889 ?auto_513891 ) ) ( not ( = ?auto_513889 ?auto_513892 ) ) ( not ( = ?auto_513889 ?auto_513893 ) ) ( not ( = ?auto_513889 ?auto_513894 ) ) ( not ( = ?auto_513889 ?auto_513895 ) ) ( not ( = ?auto_513890 ?auto_513891 ) ) ( not ( = ?auto_513890 ?auto_513892 ) ) ( not ( = ?auto_513890 ?auto_513893 ) ) ( not ( = ?auto_513890 ?auto_513894 ) ) ( not ( = ?auto_513890 ?auto_513895 ) ) ( not ( = ?auto_513891 ?auto_513892 ) ) ( not ( = ?auto_513891 ?auto_513893 ) ) ( not ( = ?auto_513891 ?auto_513894 ) ) ( not ( = ?auto_513891 ?auto_513895 ) ) ( not ( = ?auto_513892 ?auto_513893 ) ) ( not ( = ?auto_513892 ?auto_513894 ) ) ( not ( = ?auto_513892 ?auto_513895 ) ) ( not ( = ?auto_513893 ?auto_513894 ) ) ( not ( = ?auto_513893 ?auto_513895 ) ) ( not ( = ?auto_513894 ?auto_513895 ) ) ( ON ?auto_513893 ?auto_513894 ) ( ON ?auto_513892 ?auto_513893 ) ( ON ?auto_513891 ?auto_513892 ) ( ON ?auto_513890 ?auto_513891 ) ( ON ?auto_513889 ?auto_513890 ) ( ON ?auto_513888 ?auto_513889 ) ( ON ?auto_513887 ?auto_513888 ) ( ON ?auto_513886 ?auto_513887 ) ( ON ?auto_513885 ?auto_513886 ) ( ON ?auto_513884 ?auto_513885 ) ( ON ?auto_513883 ?auto_513884 ) ( CLEAR ?auto_513881 ) ( ON ?auto_513882 ?auto_513883 ) ( CLEAR ?auto_513882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_513880 ?auto_513881 ?auto_513882 )
      ( MAKE-15PILE ?auto_513880 ?auto_513881 ?auto_513882 ?auto_513883 ?auto_513884 ?auto_513885 ?auto_513886 ?auto_513887 ?auto_513888 ?auto_513889 ?auto_513890 ?auto_513891 ?auto_513892 ?auto_513893 ?auto_513894 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_513942 - BLOCK
      ?auto_513943 - BLOCK
      ?auto_513944 - BLOCK
      ?auto_513945 - BLOCK
      ?auto_513946 - BLOCK
      ?auto_513947 - BLOCK
      ?auto_513948 - BLOCK
      ?auto_513949 - BLOCK
      ?auto_513950 - BLOCK
      ?auto_513951 - BLOCK
      ?auto_513952 - BLOCK
      ?auto_513953 - BLOCK
      ?auto_513954 - BLOCK
      ?auto_513955 - BLOCK
      ?auto_513956 - BLOCK
    )
    :vars
    (
      ?auto_513957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_513956 ?auto_513957 ) ( ON-TABLE ?auto_513942 ) ( not ( = ?auto_513942 ?auto_513943 ) ) ( not ( = ?auto_513942 ?auto_513944 ) ) ( not ( = ?auto_513942 ?auto_513945 ) ) ( not ( = ?auto_513942 ?auto_513946 ) ) ( not ( = ?auto_513942 ?auto_513947 ) ) ( not ( = ?auto_513942 ?auto_513948 ) ) ( not ( = ?auto_513942 ?auto_513949 ) ) ( not ( = ?auto_513942 ?auto_513950 ) ) ( not ( = ?auto_513942 ?auto_513951 ) ) ( not ( = ?auto_513942 ?auto_513952 ) ) ( not ( = ?auto_513942 ?auto_513953 ) ) ( not ( = ?auto_513942 ?auto_513954 ) ) ( not ( = ?auto_513942 ?auto_513955 ) ) ( not ( = ?auto_513942 ?auto_513956 ) ) ( not ( = ?auto_513942 ?auto_513957 ) ) ( not ( = ?auto_513943 ?auto_513944 ) ) ( not ( = ?auto_513943 ?auto_513945 ) ) ( not ( = ?auto_513943 ?auto_513946 ) ) ( not ( = ?auto_513943 ?auto_513947 ) ) ( not ( = ?auto_513943 ?auto_513948 ) ) ( not ( = ?auto_513943 ?auto_513949 ) ) ( not ( = ?auto_513943 ?auto_513950 ) ) ( not ( = ?auto_513943 ?auto_513951 ) ) ( not ( = ?auto_513943 ?auto_513952 ) ) ( not ( = ?auto_513943 ?auto_513953 ) ) ( not ( = ?auto_513943 ?auto_513954 ) ) ( not ( = ?auto_513943 ?auto_513955 ) ) ( not ( = ?auto_513943 ?auto_513956 ) ) ( not ( = ?auto_513943 ?auto_513957 ) ) ( not ( = ?auto_513944 ?auto_513945 ) ) ( not ( = ?auto_513944 ?auto_513946 ) ) ( not ( = ?auto_513944 ?auto_513947 ) ) ( not ( = ?auto_513944 ?auto_513948 ) ) ( not ( = ?auto_513944 ?auto_513949 ) ) ( not ( = ?auto_513944 ?auto_513950 ) ) ( not ( = ?auto_513944 ?auto_513951 ) ) ( not ( = ?auto_513944 ?auto_513952 ) ) ( not ( = ?auto_513944 ?auto_513953 ) ) ( not ( = ?auto_513944 ?auto_513954 ) ) ( not ( = ?auto_513944 ?auto_513955 ) ) ( not ( = ?auto_513944 ?auto_513956 ) ) ( not ( = ?auto_513944 ?auto_513957 ) ) ( not ( = ?auto_513945 ?auto_513946 ) ) ( not ( = ?auto_513945 ?auto_513947 ) ) ( not ( = ?auto_513945 ?auto_513948 ) ) ( not ( = ?auto_513945 ?auto_513949 ) ) ( not ( = ?auto_513945 ?auto_513950 ) ) ( not ( = ?auto_513945 ?auto_513951 ) ) ( not ( = ?auto_513945 ?auto_513952 ) ) ( not ( = ?auto_513945 ?auto_513953 ) ) ( not ( = ?auto_513945 ?auto_513954 ) ) ( not ( = ?auto_513945 ?auto_513955 ) ) ( not ( = ?auto_513945 ?auto_513956 ) ) ( not ( = ?auto_513945 ?auto_513957 ) ) ( not ( = ?auto_513946 ?auto_513947 ) ) ( not ( = ?auto_513946 ?auto_513948 ) ) ( not ( = ?auto_513946 ?auto_513949 ) ) ( not ( = ?auto_513946 ?auto_513950 ) ) ( not ( = ?auto_513946 ?auto_513951 ) ) ( not ( = ?auto_513946 ?auto_513952 ) ) ( not ( = ?auto_513946 ?auto_513953 ) ) ( not ( = ?auto_513946 ?auto_513954 ) ) ( not ( = ?auto_513946 ?auto_513955 ) ) ( not ( = ?auto_513946 ?auto_513956 ) ) ( not ( = ?auto_513946 ?auto_513957 ) ) ( not ( = ?auto_513947 ?auto_513948 ) ) ( not ( = ?auto_513947 ?auto_513949 ) ) ( not ( = ?auto_513947 ?auto_513950 ) ) ( not ( = ?auto_513947 ?auto_513951 ) ) ( not ( = ?auto_513947 ?auto_513952 ) ) ( not ( = ?auto_513947 ?auto_513953 ) ) ( not ( = ?auto_513947 ?auto_513954 ) ) ( not ( = ?auto_513947 ?auto_513955 ) ) ( not ( = ?auto_513947 ?auto_513956 ) ) ( not ( = ?auto_513947 ?auto_513957 ) ) ( not ( = ?auto_513948 ?auto_513949 ) ) ( not ( = ?auto_513948 ?auto_513950 ) ) ( not ( = ?auto_513948 ?auto_513951 ) ) ( not ( = ?auto_513948 ?auto_513952 ) ) ( not ( = ?auto_513948 ?auto_513953 ) ) ( not ( = ?auto_513948 ?auto_513954 ) ) ( not ( = ?auto_513948 ?auto_513955 ) ) ( not ( = ?auto_513948 ?auto_513956 ) ) ( not ( = ?auto_513948 ?auto_513957 ) ) ( not ( = ?auto_513949 ?auto_513950 ) ) ( not ( = ?auto_513949 ?auto_513951 ) ) ( not ( = ?auto_513949 ?auto_513952 ) ) ( not ( = ?auto_513949 ?auto_513953 ) ) ( not ( = ?auto_513949 ?auto_513954 ) ) ( not ( = ?auto_513949 ?auto_513955 ) ) ( not ( = ?auto_513949 ?auto_513956 ) ) ( not ( = ?auto_513949 ?auto_513957 ) ) ( not ( = ?auto_513950 ?auto_513951 ) ) ( not ( = ?auto_513950 ?auto_513952 ) ) ( not ( = ?auto_513950 ?auto_513953 ) ) ( not ( = ?auto_513950 ?auto_513954 ) ) ( not ( = ?auto_513950 ?auto_513955 ) ) ( not ( = ?auto_513950 ?auto_513956 ) ) ( not ( = ?auto_513950 ?auto_513957 ) ) ( not ( = ?auto_513951 ?auto_513952 ) ) ( not ( = ?auto_513951 ?auto_513953 ) ) ( not ( = ?auto_513951 ?auto_513954 ) ) ( not ( = ?auto_513951 ?auto_513955 ) ) ( not ( = ?auto_513951 ?auto_513956 ) ) ( not ( = ?auto_513951 ?auto_513957 ) ) ( not ( = ?auto_513952 ?auto_513953 ) ) ( not ( = ?auto_513952 ?auto_513954 ) ) ( not ( = ?auto_513952 ?auto_513955 ) ) ( not ( = ?auto_513952 ?auto_513956 ) ) ( not ( = ?auto_513952 ?auto_513957 ) ) ( not ( = ?auto_513953 ?auto_513954 ) ) ( not ( = ?auto_513953 ?auto_513955 ) ) ( not ( = ?auto_513953 ?auto_513956 ) ) ( not ( = ?auto_513953 ?auto_513957 ) ) ( not ( = ?auto_513954 ?auto_513955 ) ) ( not ( = ?auto_513954 ?auto_513956 ) ) ( not ( = ?auto_513954 ?auto_513957 ) ) ( not ( = ?auto_513955 ?auto_513956 ) ) ( not ( = ?auto_513955 ?auto_513957 ) ) ( not ( = ?auto_513956 ?auto_513957 ) ) ( ON ?auto_513955 ?auto_513956 ) ( ON ?auto_513954 ?auto_513955 ) ( ON ?auto_513953 ?auto_513954 ) ( ON ?auto_513952 ?auto_513953 ) ( ON ?auto_513951 ?auto_513952 ) ( ON ?auto_513950 ?auto_513951 ) ( ON ?auto_513949 ?auto_513950 ) ( ON ?auto_513948 ?auto_513949 ) ( ON ?auto_513947 ?auto_513948 ) ( ON ?auto_513946 ?auto_513947 ) ( ON ?auto_513945 ?auto_513946 ) ( ON ?auto_513944 ?auto_513945 ) ( CLEAR ?auto_513942 ) ( ON ?auto_513943 ?auto_513944 ) ( CLEAR ?auto_513943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_513942 ?auto_513943 )
      ( MAKE-15PILE ?auto_513942 ?auto_513943 ?auto_513944 ?auto_513945 ?auto_513946 ?auto_513947 ?auto_513948 ?auto_513949 ?auto_513950 ?auto_513951 ?auto_513952 ?auto_513953 ?auto_513954 ?auto_513955 ?auto_513956 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_514004 - BLOCK
      ?auto_514005 - BLOCK
      ?auto_514006 - BLOCK
      ?auto_514007 - BLOCK
      ?auto_514008 - BLOCK
      ?auto_514009 - BLOCK
      ?auto_514010 - BLOCK
      ?auto_514011 - BLOCK
      ?auto_514012 - BLOCK
      ?auto_514013 - BLOCK
      ?auto_514014 - BLOCK
      ?auto_514015 - BLOCK
      ?auto_514016 - BLOCK
      ?auto_514017 - BLOCK
      ?auto_514018 - BLOCK
    )
    :vars
    (
      ?auto_514019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514018 ?auto_514019 ) ( not ( = ?auto_514004 ?auto_514005 ) ) ( not ( = ?auto_514004 ?auto_514006 ) ) ( not ( = ?auto_514004 ?auto_514007 ) ) ( not ( = ?auto_514004 ?auto_514008 ) ) ( not ( = ?auto_514004 ?auto_514009 ) ) ( not ( = ?auto_514004 ?auto_514010 ) ) ( not ( = ?auto_514004 ?auto_514011 ) ) ( not ( = ?auto_514004 ?auto_514012 ) ) ( not ( = ?auto_514004 ?auto_514013 ) ) ( not ( = ?auto_514004 ?auto_514014 ) ) ( not ( = ?auto_514004 ?auto_514015 ) ) ( not ( = ?auto_514004 ?auto_514016 ) ) ( not ( = ?auto_514004 ?auto_514017 ) ) ( not ( = ?auto_514004 ?auto_514018 ) ) ( not ( = ?auto_514004 ?auto_514019 ) ) ( not ( = ?auto_514005 ?auto_514006 ) ) ( not ( = ?auto_514005 ?auto_514007 ) ) ( not ( = ?auto_514005 ?auto_514008 ) ) ( not ( = ?auto_514005 ?auto_514009 ) ) ( not ( = ?auto_514005 ?auto_514010 ) ) ( not ( = ?auto_514005 ?auto_514011 ) ) ( not ( = ?auto_514005 ?auto_514012 ) ) ( not ( = ?auto_514005 ?auto_514013 ) ) ( not ( = ?auto_514005 ?auto_514014 ) ) ( not ( = ?auto_514005 ?auto_514015 ) ) ( not ( = ?auto_514005 ?auto_514016 ) ) ( not ( = ?auto_514005 ?auto_514017 ) ) ( not ( = ?auto_514005 ?auto_514018 ) ) ( not ( = ?auto_514005 ?auto_514019 ) ) ( not ( = ?auto_514006 ?auto_514007 ) ) ( not ( = ?auto_514006 ?auto_514008 ) ) ( not ( = ?auto_514006 ?auto_514009 ) ) ( not ( = ?auto_514006 ?auto_514010 ) ) ( not ( = ?auto_514006 ?auto_514011 ) ) ( not ( = ?auto_514006 ?auto_514012 ) ) ( not ( = ?auto_514006 ?auto_514013 ) ) ( not ( = ?auto_514006 ?auto_514014 ) ) ( not ( = ?auto_514006 ?auto_514015 ) ) ( not ( = ?auto_514006 ?auto_514016 ) ) ( not ( = ?auto_514006 ?auto_514017 ) ) ( not ( = ?auto_514006 ?auto_514018 ) ) ( not ( = ?auto_514006 ?auto_514019 ) ) ( not ( = ?auto_514007 ?auto_514008 ) ) ( not ( = ?auto_514007 ?auto_514009 ) ) ( not ( = ?auto_514007 ?auto_514010 ) ) ( not ( = ?auto_514007 ?auto_514011 ) ) ( not ( = ?auto_514007 ?auto_514012 ) ) ( not ( = ?auto_514007 ?auto_514013 ) ) ( not ( = ?auto_514007 ?auto_514014 ) ) ( not ( = ?auto_514007 ?auto_514015 ) ) ( not ( = ?auto_514007 ?auto_514016 ) ) ( not ( = ?auto_514007 ?auto_514017 ) ) ( not ( = ?auto_514007 ?auto_514018 ) ) ( not ( = ?auto_514007 ?auto_514019 ) ) ( not ( = ?auto_514008 ?auto_514009 ) ) ( not ( = ?auto_514008 ?auto_514010 ) ) ( not ( = ?auto_514008 ?auto_514011 ) ) ( not ( = ?auto_514008 ?auto_514012 ) ) ( not ( = ?auto_514008 ?auto_514013 ) ) ( not ( = ?auto_514008 ?auto_514014 ) ) ( not ( = ?auto_514008 ?auto_514015 ) ) ( not ( = ?auto_514008 ?auto_514016 ) ) ( not ( = ?auto_514008 ?auto_514017 ) ) ( not ( = ?auto_514008 ?auto_514018 ) ) ( not ( = ?auto_514008 ?auto_514019 ) ) ( not ( = ?auto_514009 ?auto_514010 ) ) ( not ( = ?auto_514009 ?auto_514011 ) ) ( not ( = ?auto_514009 ?auto_514012 ) ) ( not ( = ?auto_514009 ?auto_514013 ) ) ( not ( = ?auto_514009 ?auto_514014 ) ) ( not ( = ?auto_514009 ?auto_514015 ) ) ( not ( = ?auto_514009 ?auto_514016 ) ) ( not ( = ?auto_514009 ?auto_514017 ) ) ( not ( = ?auto_514009 ?auto_514018 ) ) ( not ( = ?auto_514009 ?auto_514019 ) ) ( not ( = ?auto_514010 ?auto_514011 ) ) ( not ( = ?auto_514010 ?auto_514012 ) ) ( not ( = ?auto_514010 ?auto_514013 ) ) ( not ( = ?auto_514010 ?auto_514014 ) ) ( not ( = ?auto_514010 ?auto_514015 ) ) ( not ( = ?auto_514010 ?auto_514016 ) ) ( not ( = ?auto_514010 ?auto_514017 ) ) ( not ( = ?auto_514010 ?auto_514018 ) ) ( not ( = ?auto_514010 ?auto_514019 ) ) ( not ( = ?auto_514011 ?auto_514012 ) ) ( not ( = ?auto_514011 ?auto_514013 ) ) ( not ( = ?auto_514011 ?auto_514014 ) ) ( not ( = ?auto_514011 ?auto_514015 ) ) ( not ( = ?auto_514011 ?auto_514016 ) ) ( not ( = ?auto_514011 ?auto_514017 ) ) ( not ( = ?auto_514011 ?auto_514018 ) ) ( not ( = ?auto_514011 ?auto_514019 ) ) ( not ( = ?auto_514012 ?auto_514013 ) ) ( not ( = ?auto_514012 ?auto_514014 ) ) ( not ( = ?auto_514012 ?auto_514015 ) ) ( not ( = ?auto_514012 ?auto_514016 ) ) ( not ( = ?auto_514012 ?auto_514017 ) ) ( not ( = ?auto_514012 ?auto_514018 ) ) ( not ( = ?auto_514012 ?auto_514019 ) ) ( not ( = ?auto_514013 ?auto_514014 ) ) ( not ( = ?auto_514013 ?auto_514015 ) ) ( not ( = ?auto_514013 ?auto_514016 ) ) ( not ( = ?auto_514013 ?auto_514017 ) ) ( not ( = ?auto_514013 ?auto_514018 ) ) ( not ( = ?auto_514013 ?auto_514019 ) ) ( not ( = ?auto_514014 ?auto_514015 ) ) ( not ( = ?auto_514014 ?auto_514016 ) ) ( not ( = ?auto_514014 ?auto_514017 ) ) ( not ( = ?auto_514014 ?auto_514018 ) ) ( not ( = ?auto_514014 ?auto_514019 ) ) ( not ( = ?auto_514015 ?auto_514016 ) ) ( not ( = ?auto_514015 ?auto_514017 ) ) ( not ( = ?auto_514015 ?auto_514018 ) ) ( not ( = ?auto_514015 ?auto_514019 ) ) ( not ( = ?auto_514016 ?auto_514017 ) ) ( not ( = ?auto_514016 ?auto_514018 ) ) ( not ( = ?auto_514016 ?auto_514019 ) ) ( not ( = ?auto_514017 ?auto_514018 ) ) ( not ( = ?auto_514017 ?auto_514019 ) ) ( not ( = ?auto_514018 ?auto_514019 ) ) ( ON ?auto_514017 ?auto_514018 ) ( ON ?auto_514016 ?auto_514017 ) ( ON ?auto_514015 ?auto_514016 ) ( ON ?auto_514014 ?auto_514015 ) ( ON ?auto_514013 ?auto_514014 ) ( ON ?auto_514012 ?auto_514013 ) ( ON ?auto_514011 ?auto_514012 ) ( ON ?auto_514010 ?auto_514011 ) ( ON ?auto_514009 ?auto_514010 ) ( ON ?auto_514008 ?auto_514009 ) ( ON ?auto_514007 ?auto_514008 ) ( ON ?auto_514006 ?auto_514007 ) ( ON ?auto_514005 ?auto_514006 ) ( ON ?auto_514004 ?auto_514005 ) ( CLEAR ?auto_514004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_514004 )
      ( MAKE-15PILE ?auto_514004 ?auto_514005 ?auto_514006 ?auto_514007 ?auto_514008 ?auto_514009 ?auto_514010 ?auto_514011 ?auto_514012 ?auto_514013 ?auto_514014 ?auto_514015 ?auto_514016 ?auto_514017 ?auto_514018 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514067 - BLOCK
      ?auto_514068 - BLOCK
      ?auto_514069 - BLOCK
      ?auto_514070 - BLOCK
      ?auto_514071 - BLOCK
      ?auto_514072 - BLOCK
      ?auto_514073 - BLOCK
      ?auto_514074 - BLOCK
      ?auto_514075 - BLOCK
      ?auto_514076 - BLOCK
      ?auto_514077 - BLOCK
      ?auto_514078 - BLOCK
      ?auto_514079 - BLOCK
      ?auto_514080 - BLOCK
      ?auto_514081 - BLOCK
      ?auto_514082 - BLOCK
    )
    :vars
    (
      ?auto_514083 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_514081 ) ( ON ?auto_514082 ?auto_514083 ) ( CLEAR ?auto_514082 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_514067 ) ( ON ?auto_514068 ?auto_514067 ) ( ON ?auto_514069 ?auto_514068 ) ( ON ?auto_514070 ?auto_514069 ) ( ON ?auto_514071 ?auto_514070 ) ( ON ?auto_514072 ?auto_514071 ) ( ON ?auto_514073 ?auto_514072 ) ( ON ?auto_514074 ?auto_514073 ) ( ON ?auto_514075 ?auto_514074 ) ( ON ?auto_514076 ?auto_514075 ) ( ON ?auto_514077 ?auto_514076 ) ( ON ?auto_514078 ?auto_514077 ) ( ON ?auto_514079 ?auto_514078 ) ( ON ?auto_514080 ?auto_514079 ) ( ON ?auto_514081 ?auto_514080 ) ( not ( = ?auto_514067 ?auto_514068 ) ) ( not ( = ?auto_514067 ?auto_514069 ) ) ( not ( = ?auto_514067 ?auto_514070 ) ) ( not ( = ?auto_514067 ?auto_514071 ) ) ( not ( = ?auto_514067 ?auto_514072 ) ) ( not ( = ?auto_514067 ?auto_514073 ) ) ( not ( = ?auto_514067 ?auto_514074 ) ) ( not ( = ?auto_514067 ?auto_514075 ) ) ( not ( = ?auto_514067 ?auto_514076 ) ) ( not ( = ?auto_514067 ?auto_514077 ) ) ( not ( = ?auto_514067 ?auto_514078 ) ) ( not ( = ?auto_514067 ?auto_514079 ) ) ( not ( = ?auto_514067 ?auto_514080 ) ) ( not ( = ?auto_514067 ?auto_514081 ) ) ( not ( = ?auto_514067 ?auto_514082 ) ) ( not ( = ?auto_514067 ?auto_514083 ) ) ( not ( = ?auto_514068 ?auto_514069 ) ) ( not ( = ?auto_514068 ?auto_514070 ) ) ( not ( = ?auto_514068 ?auto_514071 ) ) ( not ( = ?auto_514068 ?auto_514072 ) ) ( not ( = ?auto_514068 ?auto_514073 ) ) ( not ( = ?auto_514068 ?auto_514074 ) ) ( not ( = ?auto_514068 ?auto_514075 ) ) ( not ( = ?auto_514068 ?auto_514076 ) ) ( not ( = ?auto_514068 ?auto_514077 ) ) ( not ( = ?auto_514068 ?auto_514078 ) ) ( not ( = ?auto_514068 ?auto_514079 ) ) ( not ( = ?auto_514068 ?auto_514080 ) ) ( not ( = ?auto_514068 ?auto_514081 ) ) ( not ( = ?auto_514068 ?auto_514082 ) ) ( not ( = ?auto_514068 ?auto_514083 ) ) ( not ( = ?auto_514069 ?auto_514070 ) ) ( not ( = ?auto_514069 ?auto_514071 ) ) ( not ( = ?auto_514069 ?auto_514072 ) ) ( not ( = ?auto_514069 ?auto_514073 ) ) ( not ( = ?auto_514069 ?auto_514074 ) ) ( not ( = ?auto_514069 ?auto_514075 ) ) ( not ( = ?auto_514069 ?auto_514076 ) ) ( not ( = ?auto_514069 ?auto_514077 ) ) ( not ( = ?auto_514069 ?auto_514078 ) ) ( not ( = ?auto_514069 ?auto_514079 ) ) ( not ( = ?auto_514069 ?auto_514080 ) ) ( not ( = ?auto_514069 ?auto_514081 ) ) ( not ( = ?auto_514069 ?auto_514082 ) ) ( not ( = ?auto_514069 ?auto_514083 ) ) ( not ( = ?auto_514070 ?auto_514071 ) ) ( not ( = ?auto_514070 ?auto_514072 ) ) ( not ( = ?auto_514070 ?auto_514073 ) ) ( not ( = ?auto_514070 ?auto_514074 ) ) ( not ( = ?auto_514070 ?auto_514075 ) ) ( not ( = ?auto_514070 ?auto_514076 ) ) ( not ( = ?auto_514070 ?auto_514077 ) ) ( not ( = ?auto_514070 ?auto_514078 ) ) ( not ( = ?auto_514070 ?auto_514079 ) ) ( not ( = ?auto_514070 ?auto_514080 ) ) ( not ( = ?auto_514070 ?auto_514081 ) ) ( not ( = ?auto_514070 ?auto_514082 ) ) ( not ( = ?auto_514070 ?auto_514083 ) ) ( not ( = ?auto_514071 ?auto_514072 ) ) ( not ( = ?auto_514071 ?auto_514073 ) ) ( not ( = ?auto_514071 ?auto_514074 ) ) ( not ( = ?auto_514071 ?auto_514075 ) ) ( not ( = ?auto_514071 ?auto_514076 ) ) ( not ( = ?auto_514071 ?auto_514077 ) ) ( not ( = ?auto_514071 ?auto_514078 ) ) ( not ( = ?auto_514071 ?auto_514079 ) ) ( not ( = ?auto_514071 ?auto_514080 ) ) ( not ( = ?auto_514071 ?auto_514081 ) ) ( not ( = ?auto_514071 ?auto_514082 ) ) ( not ( = ?auto_514071 ?auto_514083 ) ) ( not ( = ?auto_514072 ?auto_514073 ) ) ( not ( = ?auto_514072 ?auto_514074 ) ) ( not ( = ?auto_514072 ?auto_514075 ) ) ( not ( = ?auto_514072 ?auto_514076 ) ) ( not ( = ?auto_514072 ?auto_514077 ) ) ( not ( = ?auto_514072 ?auto_514078 ) ) ( not ( = ?auto_514072 ?auto_514079 ) ) ( not ( = ?auto_514072 ?auto_514080 ) ) ( not ( = ?auto_514072 ?auto_514081 ) ) ( not ( = ?auto_514072 ?auto_514082 ) ) ( not ( = ?auto_514072 ?auto_514083 ) ) ( not ( = ?auto_514073 ?auto_514074 ) ) ( not ( = ?auto_514073 ?auto_514075 ) ) ( not ( = ?auto_514073 ?auto_514076 ) ) ( not ( = ?auto_514073 ?auto_514077 ) ) ( not ( = ?auto_514073 ?auto_514078 ) ) ( not ( = ?auto_514073 ?auto_514079 ) ) ( not ( = ?auto_514073 ?auto_514080 ) ) ( not ( = ?auto_514073 ?auto_514081 ) ) ( not ( = ?auto_514073 ?auto_514082 ) ) ( not ( = ?auto_514073 ?auto_514083 ) ) ( not ( = ?auto_514074 ?auto_514075 ) ) ( not ( = ?auto_514074 ?auto_514076 ) ) ( not ( = ?auto_514074 ?auto_514077 ) ) ( not ( = ?auto_514074 ?auto_514078 ) ) ( not ( = ?auto_514074 ?auto_514079 ) ) ( not ( = ?auto_514074 ?auto_514080 ) ) ( not ( = ?auto_514074 ?auto_514081 ) ) ( not ( = ?auto_514074 ?auto_514082 ) ) ( not ( = ?auto_514074 ?auto_514083 ) ) ( not ( = ?auto_514075 ?auto_514076 ) ) ( not ( = ?auto_514075 ?auto_514077 ) ) ( not ( = ?auto_514075 ?auto_514078 ) ) ( not ( = ?auto_514075 ?auto_514079 ) ) ( not ( = ?auto_514075 ?auto_514080 ) ) ( not ( = ?auto_514075 ?auto_514081 ) ) ( not ( = ?auto_514075 ?auto_514082 ) ) ( not ( = ?auto_514075 ?auto_514083 ) ) ( not ( = ?auto_514076 ?auto_514077 ) ) ( not ( = ?auto_514076 ?auto_514078 ) ) ( not ( = ?auto_514076 ?auto_514079 ) ) ( not ( = ?auto_514076 ?auto_514080 ) ) ( not ( = ?auto_514076 ?auto_514081 ) ) ( not ( = ?auto_514076 ?auto_514082 ) ) ( not ( = ?auto_514076 ?auto_514083 ) ) ( not ( = ?auto_514077 ?auto_514078 ) ) ( not ( = ?auto_514077 ?auto_514079 ) ) ( not ( = ?auto_514077 ?auto_514080 ) ) ( not ( = ?auto_514077 ?auto_514081 ) ) ( not ( = ?auto_514077 ?auto_514082 ) ) ( not ( = ?auto_514077 ?auto_514083 ) ) ( not ( = ?auto_514078 ?auto_514079 ) ) ( not ( = ?auto_514078 ?auto_514080 ) ) ( not ( = ?auto_514078 ?auto_514081 ) ) ( not ( = ?auto_514078 ?auto_514082 ) ) ( not ( = ?auto_514078 ?auto_514083 ) ) ( not ( = ?auto_514079 ?auto_514080 ) ) ( not ( = ?auto_514079 ?auto_514081 ) ) ( not ( = ?auto_514079 ?auto_514082 ) ) ( not ( = ?auto_514079 ?auto_514083 ) ) ( not ( = ?auto_514080 ?auto_514081 ) ) ( not ( = ?auto_514080 ?auto_514082 ) ) ( not ( = ?auto_514080 ?auto_514083 ) ) ( not ( = ?auto_514081 ?auto_514082 ) ) ( not ( = ?auto_514081 ?auto_514083 ) ) ( not ( = ?auto_514082 ?auto_514083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_514082 ?auto_514083 )
      ( !STACK ?auto_514082 ?auto_514081 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514100 - BLOCK
      ?auto_514101 - BLOCK
      ?auto_514102 - BLOCK
      ?auto_514103 - BLOCK
      ?auto_514104 - BLOCK
      ?auto_514105 - BLOCK
      ?auto_514106 - BLOCK
      ?auto_514107 - BLOCK
      ?auto_514108 - BLOCK
      ?auto_514109 - BLOCK
      ?auto_514110 - BLOCK
      ?auto_514111 - BLOCK
      ?auto_514112 - BLOCK
      ?auto_514113 - BLOCK
      ?auto_514114 - BLOCK
      ?auto_514115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_514114 ) ( ON-TABLE ?auto_514115 ) ( CLEAR ?auto_514115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_514100 ) ( ON ?auto_514101 ?auto_514100 ) ( ON ?auto_514102 ?auto_514101 ) ( ON ?auto_514103 ?auto_514102 ) ( ON ?auto_514104 ?auto_514103 ) ( ON ?auto_514105 ?auto_514104 ) ( ON ?auto_514106 ?auto_514105 ) ( ON ?auto_514107 ?auto_514106 ) ( ON ?auto_514108 ?auto_514107 ) ( ON ?auto_514109 ?auto_514108 ) ( ON ?auto_514110 ?auto_514109 ) ( ON ?auto_514111 ?auto_514110 ) ( ON ?auto_514112 ?auto_514111 ) ( ON ?auto_514113 ?auto_514112 ) ( ON ?auto_514114 ?auto_514113 ) ( not ( = ?auto_514100 ?auto_514101 ) ) ( not ( = ?auto_514100 ?auto_514102 ) ) ( not ( = ?auto_514100 ?auto_514103 ) ) ( not ( = ?auto_514100 ?auto_514104 ) ) ( not ( = ?auto_514100 ?auto_514105 ) ) ( not ( = ?auto_514100 ?auto_514106 ) ) ( not ( = ?auto_514100 ?auto_514107 ) ) ( not ( = ?auto_514100 ?auto_514108 ) ) ( not ( = ?auto_514100 ?auto_514109 ) ) ( not ( = ?auto_514100 ?auto_514110 ) ) ( not ( = ?auto_514100 ?auto_514111 ) ) ( not ( = ?auto_514100 ?auto_514112 ) ) ( not ( = ?auto_514100 ?auto_514113 ) ) ( not ( = ?auto_514100 ?auto_514114 ) ) ( not ( = ?auto_514100 ?auto_514115 ) ) ( not ( = ?auto_514101 ?auto_514102 ) ) ( not ( = ?auto_514101 ?auto_514103 ) ) ( not ( = ?auto_514101 ?auto_514104 ) ) ( not ( = ?auto_514101 ?auto_514105 ) ) ( not ( = ?auto_514101 ?auto_514106 ) ) ( not ( = ?auto_514101 ?auto_514107 ) ) ( not ( = ?auto_514101 ?auto_514108 ) ) ( not ( = ?auto_514101 ?auto_514109 ) ) ( not ( = ?auto_514101 ?auto_514110 ) ) ( not ( = ?auto_514101 ?auto_514111 ) ) ( not ( = ?auto_514101 ?auto_514112 ) ) ( not ( = ?auto_514101 ?auto_514113 ) ) ( not ( = ?auto_514101 ?auto_514114 ) ) ( not ( = ?auto_514101 ?auto_514115 ) ) ( not ( = ?auto_514102 ?auto_514103 ) ) ( not ( = ?auto_514102 ?auto_514104 ) ) ( not ( = ?auto_514102 ?auto_514105 ) ) ( not ( = ?auto_514102 ?auto_514106 ) ) ( not ( = ?auto_514102 ?auto_514107 ) ) ( not ( = ?auto_514102 ?auto_514108 ) ) ( not ( = ?auto_514102 ?auto_514109 ) ) ( not ( = ?auto_514102 ?auto_514110 ) ) ( not ( = ?auto_514102 ?auto_514111 ) ) ( not ( = ?auto_514102 ?auto_514112 ) ) ( not ( = ?auto_514102 ?auto_514113 ) ) ( not ( = ?auto_514102 ?auto_514114 ) ) ( not ( = ?auto_514102 ?auto_514115 ) ) ( not ( = ?auto_514103 ?auto_514104 ) ) ( not ( = ?auto_514103 ?auto_514105 ) ) ( not ( = ?auto_514103 ?auto_514106 ) ) ( not ( = ?auto_514103 ?auto_514107 ) ) ( not ( = ?auto_514103 ?auto_514108 ) ) ( not ( = ?auto_514103 ?auto_514109 ) ) ( not ( = ?auto_514103 ?auto_514110 ) ) ( not ( = ?auto_514103 ?auto_514111 ) ) ( not ( = ?auto_514103 ?auto_514112 ) ) ( not ( = ?auto_514103 ?auto_514113 ) ) ( not ( = ?auto_514103 ?auto_514114 ) ) ( not ( = ?auto_514103 ?auto_514115 ) ) ( not ( = ?auto_514104 ?auto_514105 ) ) ( not ( = ?auto_514104 ?auto_514106 ) ) ( not ( = ?auto_514104 ?auto_514107 ) ) ( not ( = ?auto_514104 ?auto_514108 ) ) ( not ( = ?auto_514104 ?auto_514109 ) ) ( not ( = ?auto_514104 ?auto_514110 ) ) ( not ( = ?auto_514104 ?auto_514111 ) ) ( not ( = ?auto_514104 ?auto_514112 ) ) ( not ( = ?auto_514104 ?auto_514113 ) ) ( not ( = ?auto_514104 ?auto_514114 ) ) ( not ( = ?auto_514104 ?auto_514115 ) ) ( not ( = ?auto_514105 ?auto_514106 ) ) ( not ( = ?auto_514105 ?auto_514107 ) ) ( not ( = ?auto_514105 ?auto_514108 ) ) ( not ( = ?auto_514105 ?auto_514109 ) ) ( not ( = ?auto_514105 ?auto_514110 ) ) ( not ( = ?auto_514105 ?auto_514111 ) ) ( not ( = ?auto_514105 ?auto_514112 ) ) ( not ( = ?auto_514105 ?auto_514113 ) ) ( not ( = ?auto_514105 ?auto_514114 ) ) ( not ( = ?auto_514105 ?auto_514115 ) ) ( not ( = ?auto_514106 ?auto_514107 ) ) ( not ( = ?auto_514106 ?auto_514108 ) ) ( not ( = ?auto_514106 ?auto_514109 ) ) ( not ( = ?auto_514106 ?auto_514110 ) ) ( not ( = ?auto_514106 ?auto_514111 ) ) ( not ( = ?auto_514106 ?auto_514112 ) ) ( not ( = ?auto_514106 ?auto_514113 ) ) ( not ( = ?auto_514106 ?auto_514114 ) ) ( not ( = ?auto_514106 ?auto_514115 ) ) ( not ( = ?auto_514107 ?auto_514108 ) ) ( not ( = ?auto_514107 ?auto_514109 ) ) ( not ( = ?auto_514107 ?auto_514110 ) ) ( not ( = ?auto_514107 ?auto_514111 ) ) ( not ( = ?auto_514107 ?auto_514112 ) ) ( not ( = ?auto_514107 ?auto_514113 ) ) ( not ( = ?auto_514107 ?auto_514114 ) ) ( not ( = ?auto_514107 ?auto_514115 ) ) ( not ( = ?auto_514108 ?auto_514109 ) ) ( not ( = ?auto_514108 ?auto_514110 ) ) ( not ( = ?auto_514108 ?auto_514111 ) ) ( not ( = ?auto_514108 ?auto_514112 ) ) ( not ( = ?auto_514108 ?auto_514113 ) ) ( not ( = ?auto_514108 ?auto_514114 ) ) ( not ( = ?auto_514108 ?auto_514115 ) ) ( not ( = ?auto_514109 ?auto_514110 ) ) ( not ( = ?auto_514109 ?auto_514111 ) ) ( not ( = ?auto_514109 ?auto_514112 ) ) ( not ( = ?auto_514109 ?auto_514113 ) ) ( not ( = ?auto_514109 ?auto_514114 ) ) ( not ( = ?auto_514109 ?auto_514115 ) ) ( not ( = ?auto_514110 ?auto_514111 ) ) ( not ( = ?auto_514110 ?auto_514112 ) ) ( not ( = ?auto_514110 ?auto_514113 ) ) ( not ( = ?auto_514110 ?auto_514114 ) ) ( not ( = ?auto_514110 ?auto_514115 ) ) ( not ( = ?auto_514111 ?auto_514112 ) ) ( not ( = ?auto_514111 ?auto_514113 ) ) ( not ( = ?auto_514111 ?auto_514114 ) ) ( not ( = ?auto_514111 ?auto_514115 ) ) ( not ( = ?auto_514112 ?auto_514113 ) ) ( not ( = ?auto_514112 ?auto_514114 ) ) ( not ( = ?auto_514112 ?auto_514115 ) ) ( not ( = ?auto_514113 ?auto_514114 ) ) ( not ( = ?auto_514113 ?auto_514115 ) ) ( not ( = ?auto_514114 ?auto_514115 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_514115 )
      ( !STACK ?auto_514115 ?auto_514114 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514132 - BLOCK
      ?auto_514133 - BLOCK
      ?auto_514134 - BLOCK
      ?auto_514135 - BLOCK
      ?auto_514136 - BLOCK
      ?auto_514137 - BLOCK
      ?auto_514138 - BLOCK
      ?auto_514139 - BLOCK
      ?auto_514140 - BLOCK
      ?auto_514141 - BLOCK
      ?auto_514142 - BLOCK
      ?auto_514143 - BLOCK
      ?auto_514144 - BLOCK
      ?auto_514145 - BLOCK
      ?auto_514146 - BLOCK
      ?auto_514147 - BLOCK
    )
    :vars
    (
      ?auto_514148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514147 ?auto_514148 ) ( ON-TABLE ?auto_514132 ) ( ON ?auto_514133 ?auto_514132 ) ( ON ?auto_514134 ?auto_514133 ) ( ON ?auto_514135 ?auto_514134 ) ( ON ?auto_514136 ?auto_514135 ) ( ON ?auto_514137 ?auto_514136 ) ( ON ?auto_514138 ?auto_514137 ) ( ON ?auto_514139 ?auto_514138 ) ( ON ?auto_514140 ?auto_514139 ) ( ON ?auto_514141 ?auto_514140 ) ( ON ?auto_514142 ?auto_514141 ) ( ON ?auto_514143 ?auto_514142 ) ( ON ?auto_514144 ?auto_514143 ) ( ON ?auto_514145 ?auto_514144 ) ( not ( = ?auto_514132 ?auto_514133 ) ) ( not ( = ?auto_514132 ?auto_514134 ) ) ( not ( = ?auto_514132 ?auto_514135 ) ) ( not ( = ?auto_514132 ?auto_514136 ) ) ( not ( = ?auto_514132 ?auto_514137 ) ) ( not ( = ?auto_514132 ?auto_514138 ) ) ( not ( = ?auto_514132 ?auto_514139 ) ) ( not ( = ?auto_514132 ?auto_514140 ) ) ( not ( = ?auto_514132 ?auto_514141 ) ) ( not ( = ?auto_514132 ?auto_514142 ) ) ( not ( = ?auto_514132 ?auto_514143 ) ) ( not ( = ?auto_514132 ?auto_514144 ) ) ( not ( = ?auto_514132 ?auto_514145 ) ) ( not ( = ?auto_514132 ?auto_514146 ) ) ( not ( = ?auto_514132 ?auto_514147 ) ) ( not ( = ?auto_514132 ?auto_514148 ) ) ( not ( = ?auto_514133 ?auto_514134 ) ) ( not ( = ?auto_514133 ?auto_514135 ) ) ( not ( = ?auto_514133 ?auto_514136 ) ) ( not ( = ?auto_514133 ?auto_514137 ) ) ( not ( = ?auto_514133 ?auto_514138 ) ) ( not ( = ?auto_514133 ?auto_514139 ) ) ( not ( = ?auto_514133 ?auto_514140 ) ) ( not ( = ?auto_514133 ?auto_514141 ) ) ( not ( = ?auto_514133 ?auto_514142 ) ) ( not ( = ?auto_514133 ?auto_514143 ) ) ( not ( = ?auto_514133 ?auto_514144 ) ) ( not ( = ?auto_514133 ?auto_514145 ) ) ( not ( = ?auto_514133 ?auto_514146 ) ) ( not ( = ?auto_514133 ?auto_514147 ) ) ( not ( = ?auto_514133 ?auto_514148 ) ) ( not ( = ?auto_514134 ?auto_514135 ) ) ( not ( = ?auto_514134 ?auto_514136 ) ) ( not ( = ?auto_514134 ?auto_514137 ) ) ( not ( = ?auto_514134 ?auto_514138 ) ) ( not ( = ?auto_514134 ?auto_514139 ) ) ( not ( = ?auto_514134 ?auto_514140 ) ) ( not ( = ?auto_514134 ?auto_514141 ) ) ( not ( = ?auto_514134 ?auto_514142 ) ) ( not ( = ?auto_514134 ?auto_514143 ) ) ( not ( = ?auto_514134 ?auto_514144 ) ) ( not ( = ?auto_514134 ?auto_514145 ) ) ( not ( = ?auto_514134 ?auto_514146 ) ) ( not ( = ?auto_514134 ?auto_514147 ) ) ( not ( = ?auto_514134 ?auto_514148 ) ) ( not ( = ?auto_514135 ?auto_514136 ) ) ( not ( = ?auto_514135 ?auto_514137 ) ) ( not ( = ?auto_514135 ?auto_514138 ) ) ( not ( = ?auto_514135 ?auto_514139 ) ) ( not ( = ?auto_514135 ?auto_514140 ) ) ( not ( = ?auto_514135 ?auto_514141 ) ) ( not ( = ?auto_514135 ?auto_514142 ) ) ( not ( = ?auto_514135 ?auto_514143 ) ) ( not ( = ?auto_514135 ?auto_514144 ) ) ( not ( = ?auto_514135 ?auto_514145 ) ) ( not ( = ?auto_514135 ?auto_514146 ) ) ( not ( = ?auto_514135 ?auto_514147 ) ) ( not ( = ?auto_514135 ?auto_514148 ) ) ( not ( = ?auto_514136 ?auto_514137 ) ) ( not ( = ?auto_514136 ?auto_514138 ) ) ( not ( = ?auto_514136 ?auto_514139 ) ) ( not ( = ?auto_514136 ?auto_514140 ) ) ( not ( = ?auto_514136 ?auto_514141 ) ) ( not ( = ?auto_514136 ?auto_514142 ) ) ( not ( = ?auto_514136 ?auto_514143 ) ) ( not ( = ?auto_514136 ?auto_514144 ) ) ( not ( = ?auto_514136 ?auto_514145 ) ) ( not ( = ?auto_514136 ?auto_514146 ) ) ( not ( = ?auto_514136 ?auto_514147 ) ) ( not ( = ?auto_514136 ?auto_514148 ) ) ( not ( = ?auto_514137 ?auto_514138 ) ) ( not ( = ?auto_514137 ?auto_514139 ) ) ( not ( = ?auto_514137 ?auto_514140 ) ) ( not ( = ?auto_514137 ?auto_514141 ) ) ( not ( = ?auto_514137 ?auto_514142 ) ) ( not ( = ?auto_514137 ?auto_514143 ) ) ( not ( = ?auto_514137 ?auto_514144 ) ) ( not ( = ?auto_514137 ?auto_514145 ) ) ( not ( = ?auto_514137 ?auto_514146 ) ) ( not ( = ?auto_514137 ?auto_514147 ) ) ( not ( = ?auto_514137 ?auto_514148 ) ) ( not ( = ?auto_514138 ?auto_514139 ) ) ( not ( = ?auto_514138 ?auto_514140 ) ) ( not ( = ?auto_514138 ?auto_514141 ) ) ( not ( = ?auto_514138 ?auto_514142 ) ) ( not ( = ?auto_514138 ?auto_514143 ) ) ( not ( = ?auto_514138 ?auto_514144 ) ) ( not ( = ?auto_514138 ?auto_514145 ) ) ( not ( = ?auto_514138 ?auto_514146 ) ) ( not ( = ?auto_514138 ?auto_514147 ) ) ( not ( = ?auto_514138 ?auto_514148 ) ) ( not ( = ?auto_514139 ?auto_514140 ) ) ( not ( = ?auto_514139 ?auto_514141 ) ) ( not ( = ?auto_514139 ?auto_514142 ) ) ( not ( = ?auto_514139 ?auto_514143 ) ) ( not ( = ?auto_514139 ?auto_514144 ) ) ( not ( = ?auto_514139 ?auto_514145 ) ) ( not ( = ?auto_514139 ?auto_514146 ) ) ( not ( = ?auto_514139 ?auto_514147 ) ) ( not ( = ?auto_514139 ?auto_514148 ) ) ( not ( = ?auto_514140 ?auto_514141 ) ) ( not ( = ?auto_514140 ?auto_514142 ) ) ( not ( = ?auto_514140 ?auto_514143 ) ) ( not ( = ?auto_514140 ?auto_514144 ) ) ( not ( = ?auto_514140 ?auto_514145 ) ) ( not ( = ?auto_514140 ?auto_514146 ) ) ( not ( = ?auto_514140 ?auto_514147 ) ) ( not ( = ?auto_514140 ?auto_514148 ) ) ( not ( = ?auto_514141 ?auto_514142 ) ) ( not ( = ?auto_514141 ?auto_514143 ) ) ( not ( = ?auto_514141 ?auto_514144 ) ) ( not ( = ?auto_514141 ?auto_514145 ) ) ( not ( = ?auto_514141 ?auto_514146 ) ) ( not ( = ?auto_514141 ?auto_514147 ) ) ( not ( = ?auto_514141 ?auto_514148 ) ) ( not ( = ?auto_514142 ?auto_514143 ) ) ( not ( = ?auto_514142 ?auto_514144 ) ) ( not ( = ?auto_514142 ?auto_514145 ) ) ( not ( = ?auto_514142 ?auto_514146 ) ) ( not ( = ?auto_514142 ?auto_514147 ) ) ( not ( = ?auto_514142 ?auto_514148 ) ) ( not ( = ?auto_514143 ?auto_514144 ) ) ( not ( = ?auto_514143 ?auto_514145 ) ) ( not ( = ?auto_514143 ?auto_514146 ) ) ( not ( = ?auto_514143 ?auto_514147 ) ) ( not ( = ?auto_514143 ?auto_514148 ) ) ( not ( = ?auto_514144 ?auto_514145 ) ) ( not ( = ?auto_514144 ?auto_514146 ) ) ( not ( = ?auto_514144 ?auto_514147 ) ) ( not ( = ?auto_514144 ?auto_514148 ) ) ( not ( = ?auto_514145 ?auto_514146 ) ) ( not ( = ?auto_514145 ?auto_514147 ) ) ( not ( = ?auto_514145 ?auto_514148 ) ) ( not ( = ?auto_514146 ?auto_514147 ) ) ( not ( = ?auto_514146 ?auto_514148 ) ) ( not ( = ?auto_514147 ?auto_514148 ) ) ( CLEAR ?auto_514145 ) ( ON ?auto_514146 ?auto_514147 ) ( CLEAR ?auto_514146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_514132 ?auto_514133 ?auto_514134 ?auto_514135 ?auto_514136 ?auto_514137 ?auto_514138 ?auto_514139 ?auto_514140 ?auto_514141 ?auto_514142 ?auto_514143 ?auto_514144 ?auto_514145 ?auto_514146 )
      ( MAKE-16PILE ?auto_514132 ?auto_514133 ?auto_514134 ?auto_514135 ?auto_514136 ?auto_514137 ?auto_514138 ?auto_514139 ?auto_514140 ?auto_514141 ?auto_514142 ?auto_514143 ?auto_514144 ?auto_514145 ?auto_514146 ?auto_514147 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514165 - BLOCK
      ?auto_514166 - BLOCK
      ?auto_514167 - BLOCK
      ?auto_514168 - BLOCK
      ?auto_514169 - BLOCK
      ?auto_514170 - BLOCK
      ?auto_514171 - BLOCK
      ?auto_514172 - BLOCK
      ?auto_514173 - BLOCK
      ?auto_514174 - BLOCK
      ?auto_514175 - BLOCK
      ?auto_514176 - BLOCK
      ?auto_514177 - BLOCK
      ?auto_514178 - BLOCK
      ?auto_514179 - BLOCK
      ?auto_514180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514180 ) ( ON-TABLE ?auto_514165 ) ( ON ?auto_514166 ?auto_514165 ) ( ON ?auto_514167 ?auto_514166 ) ( ON ?auto_514168 ?auto_514167 ) ( ON ?auto_514169 ?auto_514168 ) ( ON ?auto_514170 ?auto_514169 ) ( ON ?auto_514171 ?auto_514170 ) ( ON ?auto_514172 ?auto_514171 ) ( ON ?auto_514173 ?auto_514172 ) ( ON ?auto_514174 ?auto_514173 ) ( ON ?auto_514175 ?auto_514174 ) ( ON ?auto_514176 ?auto_514175 ) ( ON ?auto_514177 ?auto_514176 ) ( ON ?auto_514178 ?auto_514177 ) ( not ( = ?auto_514165 ?auto_514166 ) ) ( not ( = ?auto_514165 ?auto_514167 ) ) ( not ( = ?auto_514165 ?auto_514168 ) ) ( not ( = ?auto_514165 ?auto_514169 ) ) ( not ( = ?auto_514165 ?auto_514170 ) ) ( not ( = ?auto_514165 ?auto_514171 ) ) ( not ( = ?auto_514165 ?auto_514172 ) ) ( not ( = ?auto_514165 ?auto_514173 ) ) ( not ( = ?auto_514165 ?auto_514174 ) ) ( not ( = ?auto_514165 ?auto_514175 ) ) ( not ( = ?auto_514165 ?auto_514176 ) ) ( not ( = ?auto_514165 ?auto_514177 ) ) ( not ( = ?auto_514165 ?auto_514178 ) ) ( not ( = ?auto_514165 ?auto_514179 ) ) ( not ( = ?auto_514165 ?auto_514180 ) ) ( not ( = ?auto_514166 ?auto_514167 ) ) ( not ( = ?auto_514166 ?auto_514168 ) ) ( not ( = ?auto_514166 ?auto_514169 ) ) ( not ( = ?auto_514166 ?auto_514170 ) ) ( not ( = ?auto_514166 ?auto_514171 ) ) ( not ( = ?auto_514166 ?auto_514172 ) ) ( not ( = ?auto_514166 ?auto_514173 ) ) ( not ( = ?auto_514166 ?auto_514174 ) ) ( not ( = ?auto_514166 ?auto_514175 ) ) ( not ( = ?auto_514166 ?auto_514176 ) ) ( not ( = ?auto_514166 ?auto_514177 ) ) ( not ( = ?auto_514166 ?auto_514178 ) ) ( not ( = ?auto_514166 ?auto_514179 ) ) ( not ( = ?auto_514166 ?auto_514180 ) ) ( not ( = ?auto_514167 ?auto_514168 ) ) ( not ( = ?auto_514167 ?auto_514169 ) ) ( not ( = ?auto_514167 ?auto_514170 ) ) ( not ( = ?auto_514167 ?auto_514171 ) ) ( not ( = ?auto_514167 ?auto_514172 ) ) ( not ( = ?auto_514167 ?auto_514173 ) ) ( not ( = ?auto_514167 ?auto_514174 ) ) ( not ( = ?auto_514167 ?auto_514175 ) ) ( not ( = ?auto_514167 ?auto_514176 ) ) ( not ( = ?auto_514167 ?auto_514177 ) ) ( not ( = ?auto_514167 ?auto_514178 ) ) ( not ( = ?auto_514167 ?auto_514179 ) ) ( not ( = ?auto_514167 ?auto_514180 ) ) ( not ( = ?auto_514168 ?auto_514169 ) ) ( not ( = ?auto_514168 ?auto_514170 ) ) ( not ( = ?auto_514168 ?auto_514171 ) ) ( not ( = ?auto_514168 ?auto_514172 ) ) ( not ( = ?auto_514168 ?auto_514173 ) ) ( not ( = ?auto_514168 ?auto_514174 ) ) ( not ( = ?auto_514168 ?auto_514175 ) ) ( not ( = ?auto_514168 ?auto_514176 ) ) ( not ( = ?auto_514168 ?auto_514177 ) ) ( not ( = ?auto_514168 ?auto_514178 ) ) ( not ( = ?auto_514168 ?auto_514179 ) ) ( not ( = ?auto_514168 ?auto_514180 ) ) ( not ( = ?auto_514169 ?auto_514170 ) ) ( not ( = ?auto_514169 ?auto_514171 ) ) ( not ( = ?auto_514169 ?auto_514172 ) ) ( not ( = ?auto_514169 ?auto_514173 ) ) ( not ( = ?auto_514169 ?auto_514174 ) ) ( not ( = ?auto_514169 ?auto_514175 ) ) ( not ( = ?auto_514169 ?auto_514176 ) ) ( not ( = ?auto_514169 ?auto_514177 ) ) ( not ( = ?auto_514169 ?auto_514178 ) ) ( not ( = ?auto_514169 ?auto_514179 ) ) ( not ( = ?auto_514169 ?auto_514180 ) ) ( not ( = ?auto_514170 ?auto_514171 ) ) ( not ( = ?auto_514170 ?auto_514172 ) ) ( not ( = ?auto_514170 ?auto_514173 ) ) ( not ( = ?auto_514170 ?auto_514174 ) ) ( not ( = ?auto_514170 ?auto_514175 ) ) ( not ( = ?auto_514170 ?auto_514176 ) ) ( not ( = ?auto_514170 ?auto_514177 ) ) ( not ( = ?auto_514170 ?auto_514178 ) ) ( not ( = ?auto_514170 ?auto_514179 ) ) ( not ( = ?auto_514170 ?auto_514180 ) ) ( not ( = ?auto_514171 ?auto_514172 ) ) ( not ( = ?auto_514171 ?auto_514173 ) ) ( not ( = ?auto_514171 ?auto_514174 ) ) ( not ( = ?auto_514171 ?auto_514175 ) ) ( not ( = ?auto_514171 ?auto_514176 ) ) ( not ( = ?auto_514171 ?auto_514177 ) ) ( not ( = ?auto_514171 ?auto_514178 ) ) ( not ( = ?auto_514171 ?auto_514179 ) ) ( not ( = ?auto_514171 ?auto_514180 ) ) ( not ( = ?auto_514172 ?auto_514173 ) ) ( not ( = ?auto_514172 ?auto_514174 ) ) ( not ( = ?auto_514172 ?auto_514175 ) ) ( not ( = ?auto_514172 ?auto_514176 ) ) ( not ( = ?auto_514172 ?auto_514177 ) ) ( not ( = ?auto_514172 ?auto_514178 ) ) ( not ( = ?auto_514172 ?auto_514179 ) ) ( not ( = ?auto_514172 ?auto_514180 ) ) ( not ( = ?auto_514173 ?auto_514174 ) ) ( not ( = ?auto_514173 ?auto_514175 ) ) ( not ( = ?auto_514173 ?auto_514176 ) ) ( not ( = ?auto_514173 ?auto_514177 ) ) ( not ( = ?auto_514173 ?auto_514178 ) ) ( not ( = ?auto_514173 ?auto_514179 ) ) ( not ( = ?auto_514173 ?auto_514180 ) ) ( not ( = ?auto_514174 ?auto_514175 ) ) ( not ( = ?auto_514174 ?auto_514176 ) ) ( not ( = ?auto_514174 ?auto_514177 ) ) ( not ( = ?auto_514174 ?auto_514178 ) ) ( not ( = ?auto_514174 ?auto_514179 ) ) ( not ( = ?auto_514174 ?auto_514180 ) ) ( not ( = ?auto_514175 ?auto_514176 ) ) ( not ( = ?auto_514175 ?auto_514177 ) ) ( not ( = ?auto_514175 ?auto_514178 ) ) ( not ( = ?auto_514175 ?auto_514179 ) ) ( not ( = ?auto_514175 ?auto_514180 ) ) ( not ( = ?auto_514176 ?auto_514177 ) ) ( not ( = ?auto_514176 ?auto_514178 ) ) ( not ( = ?auto_514176 ?auto_514179 ) ) ( not ( = ?auto_514176 ?auto_514180 ) ) ( not ( = ?auto_514177 ?auto_514178 ) ) ( not ( = ?auto_514177 ?auto_514179 ) ) ( not ( = ?auto_514177 ?auto_514180 ) ) ( not ( = ?auto_514178 ?auto_514179 ) ) ( not ( = ?auto_514178 ?auto_514180 ) ) ( not ( = ?auto_514179 ?auto_514180 ) ) ( CLEAR ?auto_514178 ) ( ON ?auto_514179 ?auto_514180 ) ( CLEAR ?auto_514179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_514165 ?auto_514166 ?auto_514167 ?auto_514168 ?auto_514169 ?auto_514170 ?auto_514171 ?auto_514172 ?auto_514173 ?auto_514174 ?auto_514175 ?auto_514176 ?auto_514177 ?auto_514178 ?auto_514179 )
      ( MAKE-16PILE ?auto_514165 ?auto_514166 ?auto_514167 ?auto_514168 ?auto_514169 ?auto_514170 ?auto_514171 ?auto_514172 ?auto_514173 ?auto_514174 ?auto_514175 ?auto_514176 ?auto_514177 ?auto_514178 ?auto_514179 ?auto_514180 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514197 - BLOCK
      ?auto_514198 - BLOCK
      ?auto_514199 - BLOCK
      ?auto_514200 - BLOCK
      ?auto_514201 - BLOCK
      ?auto_514202 - BLOCK
      ?auto_514203 - BLOCK
      ?auto_514204 - BLOCK
      ?auto_514205 - BLOCK
      ?auto_514206 - BLOCK
      ?auto_514207 - BLOCK
      ?auto_514208 - BLOCK
      ?auto_514209 - BLOCK
      ?auto_514210 - BLOCK
      ?auto_514211 - BLOCK
      ?auto_514212 - BLOCK
    )
    :vars
    (
      ?auto_514213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514212 ?auto_514213 ) ( ON-TABLE ?auto_514197 ) ( ON ?auto_514198 ?auto_514197 ) ( ON ?auto_514199 ?auto_514198 ) ( ON ?auto_514200 ?auto_514199 ) ( ON ?auto_514201 ?auto_514200 ) ( ON ?auto_514202 ?auto_514201 ) ( ON ?auto_514203 ?auto_514202 ) ( ON ?auto_514204 ?auto_514203 ) ( ON ?auto_514205 ?auto_514204 ) ( ON ?auto_514206 ?auto_514205 ) ( ON ?auto_514207 ?auto_514206 ) ( ON ?auto_514208 ?auto_514207 ) ( ON ?auto_514209 ?auto_514208 ) ( not ( = ?auto_514197 ?auto_514198 ) ) ( not ( = ?auto_514197 ?auto_514199 ) ) ( not ( = ?auto_514197 ?auto_514200 ) ) ( not ( = ?auto_514197 ?auto_514201 ) ) ( not ( = ?auto_514197 ?auto_514202 ) ) ( not ( = ?auto_514197 ?auto_514203 ) ) ( not ( = ?auto_514197 ?auto_514204 ) ) ( not ( = ?auto_514197 ?auto_514205 ) ) ( not ( = ?auto_514197 ?auto_514206 ) ) ( not ( = ?auto_514197 ?auto_514207 ) ) ( not ( = ?auto_514197 ?auto_514208 ) ) ( not ( = ?auto_514197 ?auto_514209 ) ) ( not ( = ?auto_514197 ?auto_514210 ) ) ( not ( = ?auto_514197 ?auto_514211 ) ) ( not ( = ?auto_514197 ?auto_514212 ) ) ( not ( = ?auto_514197 ?auto_514213 ) ) ( not ( = ?auto_514198 ?auto_514199 ) ) ( not ( = ?auto_514198 ?auto_514200 ) ) ( not ( = ?auto_514198 ?auto_514201 ) ) ( not ( = ?auto_514198 ?auto_514202 ) ) ( not ( = ?auto_514198 ?auto_514203 ) ) ( not ( = ?auto_514198 ?auto_514204 ) ) ( not ( = ?auto_514198 ?auto_514205 ) ) ( not ( = ?auto_514198 ?auto_514206 ) ) ( not ( = ?auto_514198 ?auto_514207 ) ) ( not ( = ?auto_514198 ?auto_514208 ) ) ( not ( = ?auto_514198 ?auto_514209 ) ) ( not ( = ?auto_514198 ?auto_514210 ) ) ( not ( = ?auto_514198 ?auto_514211 ) ) ( not ( = ?auto_514198 ?auto_514212 ) ) ( not ( = ?auto_514198 ?auto_514213 ) ) ( not ( = ?auto_514199 ?auto_514200 ) ) ( not ( = ?auto_514199 ?auto_514201 ) ) ( not ( = ?auto_514199 ?auto_514202 ) ) ( not ( = ?auto_514199 ?auto_514203 ) ) ( not ( = ?auto_514199 ?auto_514204 ) ) ( not ( = ?auto_514199 ?auto_514205 ) ) ( not ( = ?auto_514199 ?auto_514206 ) ) ( not ( = ?auto_514199 ?auto_514207 ) ) ( not ( = ?auto_514199 ?auto_514208 ) ) ( not ( = ?auto_514199 ?auto_514209 ) ) ( not ( = ?auto_514199 ?auto_514210 ) ) ( not ( = ?auto_514199 ?auto_514211 ) ) ( not ( = ?auto_514199 ?auto_514212 ) ) ( not ( = ?auto_514199 ?auto_514213 ) ) ( not ( = ?auto_514200 ?auto_514201 ) ) ( not ( = ?auto_514200 ?auto_514202 ) ) ( not ( = ?auto_514200 ?auto_514203 ) ) ( not ( = ?auto_514200 ?auto_514204 ) ) ( not ( = ?auto_514200 ?auto_514205 ) ) ( not ( = ?auto_514200 ?auto_514206 ) ) ( not ( = ?auto_514200 ?auto_514207 ) ) ( not ( = ?auto_514200 ?auto_514208 ) ) ( not ( = ?auto_514200 ?auto_514209 ) ) ( not ( = ?auto_514200 ?auto_514210 ) ) ( not ( = ?auto_514200 ?auto_514211 ) ) ( not ( = ?auto_514200 ?auto_514212 ) ) ( not ( = ?auto_514200 ?auto_514213 ) ) ( not ( = ?auto_514201 ?auto_514202 ) ) ( not ( = ?auto_514201 ?auto_514203 ) ) ( not ( = ?auto_514201 ?auto_514204 ) ) ( not ( = ?auto_514201 ?auto_514205 ) ) ( not ( = ?auto_514201 ?auto_514206 ) ) ( not ( = ?auto_514201 ?auto_514207 ) ) ( not ( = ?auto_514201 ?auto_514208 ) ) ( not ( = ?auto_514201 ?auto_514209 ) ) ( not ( = ?auto_514201 ?auto_514210 ) ) ( not ( = ?auto_514201 ?auto_514211 ) ) ( not ( = ?auto_514201 ?auto_514212 ) ) ( not ( = ?auto_514201 ?auto_514213 ) ) ( not ( = ?auto_514202 ?auto_514203 ) ) ( not ( = ?auto_514202 ?auto_514204 ) ) ( not ( = ?auto_514202 ?auto_514205 ) ) ( not ( = ?auto_514202 ?auto_514206 ) ) ( not ( = ?auto_514202 ?auto_514207 ) ) ( not ( = ?auto_514202 ?auto_514208 ) ) ( not ( = ?auto_514202 ?auto_514209 ) ) ( not ( = ?auto_514202 ?auto_514210 ) ) ( not ( = ?auto_514202 ?auto_514211 ) ) ( not ( = ?auto_514202 ?auto_514212 ) ) ( not ( = ?auto_514202 ?auto_514213 ) ) ( not ( = ?auto_514203 ?auto_514204 ) ) ( not ( = ?auto_514203 ?auto_514205 ) ) ( not ( = ?auto_514203 ?auto_514206 ) ) ( not ( = ?auto_514203 ?auto_514207 ) ) ( not ( = ?auto_514203 ?auto_514208 ) ) ( not ( = ?auto_514203 ?auto_514209 ) ) ( not ( = ?auto_514203 ?auto_514210 ) ) ( not ( = ?auto_514203 ?auto_514211 ) ) ( not ( = ?auto_514203 ?auto_514212 ) ) ( not ( = ?auto_514203 ?auto_514213 ) ) ( not ( = ?auto_514204 ?auto_514205 ) ) ( not ( = ?auto_514204 ?auto_514206 ) ) ( not ( = ?auto_514204 ?auto_514207 ) ) ( not ( = ?auto_514204 ?auto_514208 ) ) ( not ( = ?auto_514204 ?auto_514209 ) ) ( not ( = ?auto_514204 ?auto_514210 ) ) ( not ( = ?auto_514204 ?auto_514211 ) ) ( not ( = ?auto_514204 ?auto_514212 ) ) ( not ( = ?auto_514204 ?auto_514213 ) ) ( not ( = ?auto_514205 ?auto_514206 ) ) ( not ( = ?auto_514205 ?auto_514207 ) ) ( not ( = ?auto_514205 ?auto_514208 ) ) ( not ( = ?auto_514205 ?auto_514209 ) ) ( not ( = ?auto_514205 ?auto_514210 ) ) ( not ( = ?auto_514205 ?auto_514211 ) ) ( not ( = ?auto_514205 ?auto_514212 ) ) ( not ( = ?auto_514205 ?auto_514213 ) ) ( not ( = ?auto_514206 ?auto_514207 ) ) ( not ( = ?auto_514206 ?auto_514208 ) ) ( not ( = ?auto_514206 ?auto_514209 ) ) ( not ( = ?auto_514206 ?auto_514210 ) ) ( not ( = ?auto_514206 ?auto_514211 ) ) ( not ( = ?auto_514206 ?auto_514212 ) ) ( not ( = ?auto_514206 ?auto_514213 ) ) ( not ( = ?auto_514207 ?auto_514208 ) ) ( not ( = ?auto_514207 ?auto_514209 ) ) ( not ( = ?auto_514207 ?auto_514210 ) ) ( not ( = ?auto_514207 ?auto_514211 ) ) ( not ( = ?auto_514207 ?auto_514212 ) ) ( not ( = ?auto_514207 ?auto_514213 ) ) ( not ( = ?auto_514208 ?auto_514209 ) ) ( not ( = ?auto_514208 ?auto_514210 ) ) ( not ( = ?auto_514208 ?auto_514211 ) ) ( not ( = ?auto_514208 ?auto_514212 ) ) ( not ( = ?auto_514208 ?auto_514213 ) ) ( not ( = ?auto_514209 ?auto_514210 ) ) ( not ( = ?auto_514209 ?auto_514211 ) ) ( not ( = ?auto_514209 ?auto_514212 ) ) ( not ( = ?auto_514209 ?auto_514213 ) ) ( not ( = ?auto_514210 ?auto_514211 ) ) ( not ( = ?auto_514210 ?auto_514212 ) ) ( not ( = ?auto_514210 ?auto_514213 ) ) ( not ( = ?auto_514211 ?auto_514212 ) ) ( not ( = ?auto_514211 ?auto_514213 ) ) ( not ( = ?auto_514212 ?auto_514213 ) ) ( ON ?auto_514211 ?auto_514212 ) ( CLEAR ?auto_514209 ) ( ON ?auto_514210 ?auto_514211 ) ( CLEAR ?auto_514210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_514197 ?auto_514198 ?auto_514199 ?auto_514200 ?auto_514201 ?auto_514202 ?auto_514203 ?auto_514204 ?auto_514205 ?auto_514206 ?auto_514207 ?auto_514208 ?auto_514209 ?auto_514210 )
      ( MAKE-16PILE ?auto_514197 ?auto_514198 ?auto_514199 ?auto_514200 ?auto_514201 ?auto_514202 ?auto_514203 ?auto_514204 ?auto_514205 ?auto_514206 ?auto_514207 ?auto_514208 ?auto_514209 ?auto_514210 ?auto_514211 ?auto_514212 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514230 - BLOCK
      ?auto_514231 - BLOCK
      ?auto_514232 - BLOCK
      ?auto_514233 - BLOCK
      ?auto_514234 - BLOCK
      ?auto_514235 - BLOCK
      ?auto_514236 - BLOCK
      ?auto_514237 - BLOCK
      ?auto_514238 - BLOCK
      ?auto_514239 - BLOCK
      ?auto_514240 - BLOCK
      ?auto_514241 - BLOCK
      ?auto_514242 - BLOCK
      ?auto_514243 - BLOCK
      ?auto_514244 - BLOCK
      ?auto_514245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514245 ) ( ON-TABLE ?auto_514230 ) ( ON ?auto_514231 ?auto_514230 ) ( ON ?auto_514232 ?auto_514231 ) ( ON ?auto_514233 ?auto_514232 ) ( ON ?auto_514234 ?auto_514233 ) ( ON ?auto_514235 ?auto_514234 ) ( ON ?auto_514236 ?auto_514235 ) ( ON ?auto_514237 ?auto_514236 ) ( ON ?auto_514238 ?auto_514237 ) ( ON ?auto_514239 ?auto_514238 ) ( ON ?auto_514240 ?auto_514239 ) ( ON ?auto_514241 ?auto_514240 ) ( ON ?auto_514242 ?auto_514241 ) ( not ( = ?auto_514230 ?auto_514231 ) ) ( not ( = ?auto_514230 ?auto_514232 ) ) ( not ( = ?auto_514230 ?auto_514233 ) ) ( not ( = ?auto_514230 ?auto_514234 ) ) ( not ( = ?auto_514230 ?auto_514235 ) ) ( not ( = ?auto_514230 ?auto_514236 ) ) ( not ( = ?auto_514230 ?auto_514237 ) ) ( not ( = ?auto_514230 ?auto_514238 ) ) ( not ( = ?auto_514230 ?auto_514239 ) ) ( not ( = ?auto_514230 ?auto_514240 ) ) ( not ( = ?auto_514230 ?auto_514241 ) ) ( not ( = ?auto_514230 ?auto_514242 ) ) ( not ( = ?auto_514230 ?auto_514243 ) ) ( not ( = ?auto_514230 ?auto_514244 ) ) ( not ( = ?auto_514230 ?auto_514245 ) ) ( not ( = ?auto_514231 ?auto_514232 ) ) ( not ( = ?auto_514231 ?auto_514233 ) ) ( not ( = ?auto_514231 ?auto_514234 ) ) ( not ( = ?auto_514231 ?auto_514235 ) ) ( not ( = ?auto_514231 ?auto_514236 ) ) ( not ( = ?auto_514231 ?auto_514237 ) ) ( not ( = ?auto_514231 ?auto_514238 ) ) ( not ( = ?auto_514231 ?auto_514239 ) ) ( not ( = ?auto_514231 ?auto_514240 ) ) ( not ( = ?auto_514231 ?auto_514241 ) ) ( not ( = ?auto_514231 ?auto_514242 ) ) ( not ( = ?auto_514231 ?auto_514243 ) ) ( not ( = ?auto_514231 ?auto_514244 ) ) ( not ( = ?auto_514231 ?auto_514245 ) ) ( not ( = ?auto_514232 ?auto_514233 ) ) ( not ( = ?auto_514232 ?auto_514234 ) ) ( not ( = ?auto_514232 ?auto_514235 ) ) ( not ( = ?auto_514232 ?auto_514236 ) ) ( not ( = ?auto_514232 ?auto_514237 ) ) ( not ( = ?auto_514232 ?auto_514238 ) ) ( not ( = ?auto_514232 ?auto_514239 ) ) ( not ( = ?auto_514232 ?auto_514240 ) ) ( not ( = ?auto_514232 ?auto_514241 ) ) ( not ( = ?auto_514232 ?auto_514242 ) ) ( not ( = ?auto_514232 ?auto_514243 ) ) ( not ( = ?auto_514232 ?auto_514244 ) ) ( not ( = ?auto_514232 ?auto_514245 ) ) ( not ( = ?auto_514233 ?auto_514234 ) ) ( not ( = ?auto_514233 ?auto_514235 ) ) ( not ( = ?auto_514233 ?auto_514236 ) ) ( not ( = ?auto_514233 ?auto_514237 ) ) ( not ( = ?auto_514233 ?auto_514238 ) ) ( not ( = ?auto_514233 ?auto_514239 ) ) ( not ( = ?auto_514233 ?auto_514240 ) ) ( not ( = ?auto_514233 ?auto_514241 ) ) ( not ( = ?auto_514233 ?auto_514242 ) ) ( not ( = ?auto_514233 ?auto_514243 ) ) ( not ( = ?auto_514233 ?auto_514244 ) ) ( not ( = ?auto_514233 ?auto_514245 ) ) ( not ( = ?auto_514234 ?auto_514235 ) ) ( not ( = ?auto_514234 ?auto_514236 ) ) ( not ( = ?auto_514234 ?auto_514237 ) ) ( not ( = ?auto_514234 ?auto_514238 ) ) ( not ( = ?auto_514234 ?auto_514239 ) ) ( not ( = ?auto_514234 ?auto_514240 ) ) ( not ( = ?auto_514234 ?auto_514241 ) ) ( not ( = ?auto_514234 ?auto_514242 ) ) ( not ( = ?auto_514234 ?auto_514243 ) ) ( not ( = ?auto_514234 ?auto_514244 ) ) ( not ( = ?auto_514234 ?auto_514245 ) ) ( not ( = ?auto_514235 ?auto_514236 ) ) ( not ( = ?auto_514235 ?auto_514237 ) ) ( not ( = ?auto_514235 ?auto_514238 ) ) ( not ( = ?auto_514235 ?auto_514239 ) ) ( not ( = ?auto_514235 ?auto_514240 ) ) ( not ( = ?auto_514235 ?auto_514241 ) ) ( not ( = ?auto_514235 ?auto_514242 ) ) ( not ( = ?auto_514235 ?auto_514243 ) ) ( not ( = ?auto_514235 ?auto_514244 ) ) ( not ( = ?auto_514235 ?auto_514245 ) ) ( not ( = ?auto_514236 ?auto_514237 ) ) ( not ( = ?auto_514236 ?auto_514238 ) ) ( not ( = ?auto_514236 ?auto_514239 ) ) ( not ( = ?auto_514236 ?auto_514240 ) ) ( not ( = ?auto_514236 ?auto_514241 ) ) ( not ( = ?auto_514236 ?auto_514242 ) ) ( not ( = ?auto_514236 ?auto_514243 ) ) ( not ( = ?auto_514236 ?auto_514244 ) ) ( not ( = ?auto_514236 ?auto_514245 ) ) ( not ( = ?auto_514237 ?auto_514238 ) ) ( not ( = ?auto_514237 ?auto_514239 ) ) ( not ( = ?auto_514237 ?auto_514240 ) ) ( not ( = ?auto_514237 ?auto_514241 ) ) ( not ( = ?auto_514237 ?auto_514242 ) ) ( not ( = ?auto_514237 ?auto_514243 ) ) ( not ( = ?auto_514237 ?auto_514244 ) ) ( not ( = ?auto_514237 ?auto_514245 ) ) ( not ( = ?auto_514238 ?auto_514239 ) ) ( not ( = ?auto_514238 ?auto_514240 ) ) ( not ( = ?auto_514238 ?auto_514241 ) ) ( not ( = ?auto_514238 ?auto_514242 ) ) ( not ( = ?auto_514238 ?auto_514243 ) ) ( not ( = ?auto_514238 ?auto_514244 ) ) ( not ( = ?auto_514238 ?auto_514245 ) ) ( not ( = ?auto_514239 ?auto_514240 ) ) ( not ( = ?auto_514239 ?auto_514241 ) ) ( not ( = ?auto_514239 ?auto_514242 ) ) ( not ( = ?auto_514239 ?auto_514243 ) ) ( not ( = ?auto_514239 ?auto_514244 ) ) ( not ( = ?auto_514239 ?auto_514245 ) ) ( not ( = ?auto_514240 ?auto_514241 ) ) ( not ( = ?auto_514240 ?auto_514242 ) ) ( not ( = ?auto_514240 ?auto_514243 ) ) ( not ( = ?auto_514240 ?auto_514244 ) ) ( not ( = ?auto_514240 ?auto_514245 ) ) ( not ( = ?auto_514241 ?auto_514242 ) ) ( not ( = ?auto_514241 ?auto_514243 ) ) ( not ( = ?auto_514241 ?auto_514244 ) ) ( not ( = ?auto_514241 ?auto_514245 ) ) ( not ( = ?auto_514242 ?auto_514243 ) ) ( not ( = ?auto_514242 ?auto_514244 ) ) ( not ( = ?auto_514242 ?auto_514245 ) ) ( not ( = ?auto_514243 ?auto_514244 ) ) ( not ( = ?auto_514243 ?auto_514245 ) ) ( not ( = ?auto_514244 ?auto_514245 ) ) ( ON ?auto_514244 ?auto_514245 ) ( CLEAR ?auto_514242 ) ( ON ?auto_514243 ?auto_514244 ) ( CLEAR ?auto_514243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_514230 ?auto_514231 ?auto_514232 ?auto_514233 ?auto_514234 ?auto_514235 ?auto_514236 ?auto_514237 ?auto_514238 ?auto_514239 ?auto_514240 ?auto_514241 ?auto_514242 ?auto_514243 )
      ( MAKE-16PILE ?auto_514230 ?auto_514231 ?auto_514232 ?auto_514233 ?auto_514234 ?auto_514235 ?auto_514236 ?auto_514237 ?auto_514238 ?auto_514239 ?auto_514240 ?auto_514241 ?auto_514242 ?auto_514243 ?auto_514244 ?auto_514245 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514262 - BLOCK
      ?auto_514263 - BLOCK
      ?auto_514264 - BLOCK
      ?auto_514265 - BLOCK
      ?auto_514266 - BLOCK
      ?auto_514267 - BLOCK
      ?auto_514268 - BLOCK
      ?auto_514269 - BLOCK
      ?auto_514270 - BLOCK
      ?auto_514271 - BLOCK
      ?auto_514272 - BLOCK
      ?auto_514273 - BLOCK
      ?auto_514274 - BLOCK
      ?auto_514275 - BLOCK
      ?auto_514276 - BLOCK
      ?auto_514277 - BLOCK
    )
    :vars
    (
      ?auto_514278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514277 ?auto_514278 ) ( ON-TABLE ?auto_514262 ) ( ON ?auto_514263 ?auto_514262 ) ( ON ?auto_514264 ?auto_514263 ) ( ON ?auto_514265 ?auto_514264 ) ( ON ?auto_514266 ?auto_514265 ) ( ON ?auto_514267 ?auto_514266 ) ( ON ?auto_514268 ?auto_514267 ) ( ON ?auto_514269 ?auto_514268 ) ( ON ?auto_514270 ?auto_514269 ) ( ON ?auto_514271 ?auto_514270 ) ( ON ?auto_514272 ?auto_514271 ) ( ON ?auto_514273 ?auto_514272 ) ( not ( = ?auto_514262 ?auto_514263 ) ) ( not ( = ?auto_514262 ?auto_514264 ) ) ( not ( = ?auto_514262 ?auto_514265 ) ) ( not ( = ?auto_514262 ?auto_514266 ) ) ( not ( = ?auto_514262 ?auto_514267 ) ) ( not ( = ?auto_514262 ?auto_514268 ) ) ( not ( = ?auto_514262 ?auto_514269 ) ) ( not ( = ?auto_514262 ?auto_514270 ) ) ( not ( = ?auto_514262 ?auto_514271 ) ) ( not ( = ?auto_514262 ?auto_514272 ) ) ( not ( = ?auto_514262 ?auto_514273 ) ) ( not ( = ?auto_514262 ?auto_514274 ) ) ( not ( = ?auto_514262 ?auto_514275 ) ) ( not ( = ?auto_514262 ?auto_514276 ) ) ( not ( = ?auto_514262 ?auto_514277 ) ) ( not ( = ?auto_514262 ?auto_514278 ) ) ( not ( = ?auto_514263 ?auto_514264 ) ) ( not ( = ?auto_514263 ?auto_514265 ) ) ( not ( = ?auto_514263 ?auto_514266 ) ) ( not ( = ?auto_514263 ?auto_514267 ) ) ( not ( = ?auto_514263 ?auto_514268 ) ) ( not ( = ?auto_514263 ?auto_514269 ) ) ( not ( = ?auto_514263 ?auto_514270 ) ) ( not ( = ?auto_514263 ?auto_514271 ) ) ( not ( = ?auto_514263 ?auto_514272 ) ) ( not ( = ?auto_514263 ?auto_514273 ) ) ( not ( = ?auto_514263 ?auto_514274 ) ) ( not ( = ?auto_514263 ?auto_514275 ) ) ( not ( = ?auto_514263 ?auto_514276 ) ) ( not ( = ?auto_514263 ?auto_514277 ) ) ( not ( = ?auto_514263 ?auto_514278 ) ) ( not ( = ?auto_514264 ?auto_514265 ) ) ( not ( = ?auto_514264 ?auto_514266 ) ) ( not ( = ?auto_514264 ?auto_514267 ) ) ( not ( = ?auto_514264 ?auto_514268 ) ) ( not ( = ?auto_514264 ?auto_514269 ) ) ( not ( = ?auto_514264 ?auto_514270 ) ) ( not ( = ?auto_514264 ?auto_514271 ) ) ( not ( = ?auto_514264 ?auto_514272 ) ) ( not ( = ?auto_514264 ?auto_514273 ) ) ( not ( = ?auto_514264 ?auto_514274 ) ) ( not ( = ?auto_514264 ?auto_514275 ) ) ( not ( = ?auto_514264 ?auto_514276 ) ) ( not ( = ?auto_514264 ?auto_514277 ) ) ( not ( = ?auto_514264 ?auto_514278 ) ) ( not ( = ?auto_514265 ?auto_514266 ) ) ( not ( = ?auto_514265 ?auto_514267 ) ) ( not ( = ?auto_514265 ?auto_514268 ) ) ( not ( = ?auto_514265 ?auto_514269 ) ) ( not ( = ?auto_514265 ?auto_514270 ) ) ( not ( = ?auto_514265 ?auto_514271 ) ) ( not ( = ?auto_514265 ?auto_514272 ) ) ( not ( = ?auto_514265 ?auto_514273 ) ) ( not ( = ?auto_514265 ?auto_514274 ) ) ( not ( = ?auto_514265 ?auto_514275 ) ) ( not ( = ?auto_514265 ?auto_514276 ) ) ( not ( = ?auto_514265 ?auto_514277 ) ) ( not ( = ?auto_514265 ?auto_514278 ) ) ( not ( = ?auto_514266 ?auto_514267 ) ) ( not ( = ?auto_514266 ?auto_514268 ) ) ( not ( = ?auto_514266 ?auto_514269 ) ) ( not ( = ?auto_514266 ?auto_514270 ) ) ( not ( = ?auto_514266 ?auto_514271 ) ) ( not ( = ?auto_514266 ?auto_514272 ) ) ( not ( = ?auto_514266 ?auto_514273 ) ) ( not ( = ?auto_514266 ?auto_514274 ) ) ( not ( = ?auto_514266 ?auto_514275 ) ) ( not ( = ?auto_514266 ?auto_514276 ) ) ( not ( = ?auto_514266 ?auto_514277 ) ) ( not ( = ?auto_514266 ?auto_514278 ) ) ( not ( = ?auto_514267 ?auto_514268 ) ) ( not ( = ?auto_514267 ?auto_514269 ) ) ( not ( = ?auto_514267 ?auto_514270 ) ) ( not ( = ?auto_514267 ?auto_514271 ) ) ( not ( = ?auto_514267 ?auto_514272 ) ) ( not ( = ?auto_514267 ?auto_514273 ) ) ( not ( = ?auto_514267 ?auto_514274 ) ) ( not ( = ?auto_514267 ?auto_514275 ) ) ( not ( = ?auto_514267 ?auto_514276 ) ) ( not ( = ?auto_514267 ?auto_514277 ) ) ( not ( = ?auto_514267 ?auto_514278 ) ) ( not ( = ?auto_514268 ?auto_514269 ) ) ( not ( = ?auto_514268 ?auto_514270 ) ) ( not ( = ?auto_514268 ?auto_514271 ) ) ( not ( = ?auto_514268 ?auto_514272 ) ) ( not ( = ?auto_514268 ?auto_514273 ) ) ( not ( = ?auto_514268 ?auto_514274 ) ) ( not ( = ?auto_514268 ?auto_514275 ) ) ( not ( = ?auto_514268 ?auto_514276 ) ) ( not ( = ?auto_514268 ?auto_514277 ) ) ( not ( = ?auto_514268 ?auto_514278 ) ) ( not ( = ?auto_514269 ?auto_514270 ) ) ( not ( = ?auto_514269 ?auto_514271 ) ) ( not ( = ?auto_514269 ?auto_514272 ) ) ( not ( = ?auto_514269 ?auto_514273 ) ) ( not ( = ?auto_514269 ?auto_514274 ) ) ( not ( = ?auto_514269 ?auto_514275 ) ) ( not ( = ?auto_514269 ?auto_514276 ) ) ( not ( = ?auto_514269 ?auto_514277 ) ) ( not ( = ?auto_514269 ?auto_514278 ) ) ( not ( = ?auto_514270 ?auto_514271 ) ) ( not ( = ?auto_514270 ?auto_514272 ) ) ( not ( = ?auto_514270 ?auto_514273 ) ) ( not ( = ?auto_514270 ?auto_514274 ) ) ( not ( = ?auto_514270 ?auto_514275 ) ) ( not ( = ?auto_514270 ?auto_514276 ) ) ( not ( = ?auto_514270 ?auto_514277 ) ) ( not ( = ?auto_514270 ?auto_514278 ) ) ( not ( = ?auto_514271 ?auto_514272 ) ) ( not ( = ?auto_514271 ?auto_514273 ) ) ( not ( = ?auto_514271 ?auto_514274 ) ) ( not ( = ?auto_514271 ?auto_514275 ) ) ( not ( = ?auto_514271 ?auto_514276 ) ) ( not ( = ?auto_514271 ?auto_514277 ) ) ( not ( = ?auto_514271 ?auto_514278 ) ) ( not ( = ?auto_514272 ?auto_514273 ) ) ( not ( = ?auto_514272 ?auto_514274 ) ) ( not ( = ?auto_514272 ?auto_514275 ) ) ( not ( = ?auto_514272 ?auto_514276 ) ) ( not ( = ?auto_514272 ?auto_514277 ) ) ( not ( = ?auto_514272 ?auto_514278 ) ) ( not ( = ?auto_514273 ?auto_514274 ) ) ( not ( = ?auto_514273 ?auto_514275 ) ) ( not ( = ?auto_514273 ?auto_514276 ) ) ( not ( = ?auto_514273 ?auto_514277 ) ) ( not ( = ?auto_514273 ?auto_514278 ) ) ( not ( = ?auto_514274 ?auto_514275 ) ) ( not ( = ?auto_514274 ?auto_514276 ) ) ( not ( = ?auto_514274 ?auto_514277 ) ) ( not ( = ?auto_514274 ?auto_514278 ) ) ( not ( = ?auto_514275 ?auto_514276 ) ) ( not ( = ?auto_514275 ?auto_514277 ) ) ( not ( = ?auto_514275 ?auto_514278 ) ) ( not ( = ?auto_514276 ?auto_514277 ) ) ( not ( = ?auto_514276 ?auto_514278 ) ) ( not ( = ?auto_514277 ?auto_514278 ) ) ( ON ?auto_514276 ?auto_514277 ) ( ON ?auto_514275 ?auto_514276 ) ( CLEAR ?auto_514273 ) ( ON ?auto_514274 ?auto_514275 ) ( CLEAR ?auto_514274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_514262 ?auto_514263 ?auto_514264 ?auto_514265 ?auto_514266 ?auto_514267 ?auto_514268 ?auto_514269 ?auto_514270 ?auto_514271 ?auto_514272 ?auto_514273 ?auto_514274 )
      ( MAKE-16PILE ?auto_514262 ?auto_514263 ?auto_514264 ?auto_514265 ?auto_514266 ?auto_514267 ?auto_514268 ?auto_514269 ?auto_514270 ?auto_514271 ?auto_514272 ?auto_514273 ?auto_514274 ?auto_514275 ?auto_514276 ?auto_514277 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514295 - BLOCK
      ?auto_514296 - BLOCK
      ?auto_514297 - BLOCK
      ?auto_514298 - BLOCK
      ?auto_514299 - BLOCK
      ?auto_514300 - BLOCK
      ?auto_514301 - BLOCK
      ?auto_514302 - BLOCK
      ?auto_514303 - BLOCK
      ?auto_514304 - BLOCK
      ?auto_514305 - BLOCK
      ?auto_514306 - BLOCK
      ?auto_514307 - BLOCK
      ?auto_514308 - BLOCK
      ?auto_514309 - BLOCK
      ?auto_514310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514310 ) ( ON-TABLE ?auto_514295 ) ( ON ?auto_514296 ?auto_514295 ) ( ON ?auto_514297 ?auto_514296 ) ( ON ?auto_514298 ?auto_514297 ) ( ON ?auto_514299 ?auto_514298 ) ( ON ?auto_514300 ?auto_514299 ) ( ON ?auto_514301 ?auto_514300 ) ( ON ?auto_514302 ?auto_514301 ) ( ON ?auto_514303 ?auto_514302 ) ( ON ?auto_514304 ?auto_514303 ) ( ON ?auto_514305 ?auto_514304 ) ( ON ?auto_514306 ?auto_514305 ) ( not ( = ?auto_514295 ?auto_514296 ) ) ( not ( = ?auto_514295 ?auto_514297 ) ) ( not ( = ?auto_514295 ?auto_514298 ) ) ( not ( = ?auto_514295 ?auto_514299 ) ) ( not ( = ?auto_514295 ?auto_514300 ) ) ( not ( = ?auto_514295 ?auto_514301 ) ) ( not ( = ?auto_514295 ?auto_514302 ) ) ( not ( = ?auto_514295 ?auto_514303 ) ) ( not ( = ?auto_514295 ?auto_514304 ) ) ( not ( = ?auto_514295 ?auto_514305 ) ) ( not ( = ?auto_514295 ?auto_514306 ) ) ( not ( = ?auto_514295 ?auto_514307 ) ) ( not ( = ?auto_514295 ?auto_514308 ) ) ( not ( = ?auto_514295 ?auto_514309 ) ) ( not ( = ?auto_514295 ?auto_514310 ) ) ( not ( = ?auto_514296 ?auto_514297 ) ) ( not ( = ?auto_514296 ?auto_514298 ) ) ( not ( = ?auto_514296 ?auto_514299 ) ) ( not ( = ?auto_514296 ?auto_514300 ) ) ( not ( = ?auto_514296 ?auto_514301 ) ) ( not ( = ?auto_514296 ?auto_514302 ) ) ( not ( = ?auto_514296 ?auto_514303 ) ) ( not ( = ?auto_514296 ?auto_514304 ) ) ( not ( = ?auto_514296 ?auto_514305 ) ) ( not ( = ?auto_514296 ?auto_514306 ) ) ( not ( = ?auto_514296 ?auto_514307 ) ) ( not ( = ?auto_514296 ?auto_514308 ) ) ( not ( = ?auto_514296 ?auto_514309 ) ) ( not ( = ?auto_514296 ?auto_514310 ) ) ( not ( = ?auto_514297 ?auto_514298 ) ) ( not ( = ?auto_514297 ?auto_514299 ) ) ( not ( = ?auto_514297 ?auto_514300 ) ) ( not ( = ?auto_514297 ?auto_514301 ) ) ( not ( = ?auto_514297 ?auto_514302 ) ) ( not ( = ?auto_514297 ?auto_514303 ) ) ( not ( = ?auto_514297 ?auto_514304 ) ) ( not ( = ?auto_514297 ?auto_514305 ) ) ( not ( = ?auto_514297 ?auto_514306 ) ) ( not ( = ?auto_514297 ?auto_514307 ) ) ( not ( = ?auto_514297 ?auto_514308 ) ) ( not ( = ?auto_514297 ?auto_514309 ) ) ( not ( = ?auto_514297 ?auto_514310 ) ) ( not ( = ?auto_514298 ?auto_514299 ) ) ( not ( = ?auto_514298 ?auto_514300 ) ) ( not ( = ?auto_514298 ?auto_514301 ) ) ( not ( = ?auto_514298 ?auto_514302 ) ) ( not ( = ?auto_514298 ?auto_514303 ) ) ( not ( = ?auto_514298 ?auto_514304 ) ) ( not ( = ?auto_514298 ?auto_514305 ) ) ( not ( = ?auto_514298 ?auto_514306 ) ) ( not ( = ?auto_514298 ?auto_514307 ) ) ( not ( = ?auto_514298 ?auto_514308 ) ) ( not ( = ?auto_514298 ?auto_514309 ) ) ( not ( = ?auto_514298 ?auto_514310 ) ) ( not ( = ?auto_514299 ?auto_514300 ) ) ( not ( = ?auto_514299 ?auto_514301 ) ) ( not ( = ?auto_514299 ?auto_514302 ) ) ( not ( = ?auto_514299 ?auto_514303 ) ) ( not ( = ?auto_514299 ?auto_514304 ) ) ( not ( = ?auto_514299 ?auto_514305 ) ) ( not ( = ?auto_514299 ?auto_514306 ) ) ( not ( = ?auto_514299 ?auto_514307 ) ) ( not ( = ?auto_514299 ?auto_514308 ) ) ( not ( = ?auto_514299 ?auto_514309 ) ) ( not ( = ?auto_514299 ?auto_514310 ) ) ( not ( = ?auto_514300 ?auto_514301 ) ) ( not ( = ?auto_514300 ?auto_514302 ) ) ( not ( = ?auto_514300 ?auto_514303 ) ) ( not ( = ?auto_514300 ?auto_514304 ) ) ( not ( = ?auto_514300 ?auto_514305 ) ) ( not ( = ?auto_514300 ?auto_514306 ) ) ( not ( = ?auto_514300 ?auto_514307 ) ) ( not ( = ?auto_514300 ?auto_514308 ) ) ( not ( = ?auto_514300 ?auto_514309 ) ) ( not ( = ?auto_514300 ?auto_514310 ) ) ( not ( = ?auto_514301 ?auto_514302 ) ) ( not ( = ?auto_514301 ?auto_514303 ) ) ( not ( = ?auto_514301 ?auto_514304 ) ) ( not ( = ?auto_514301 ?auto_514305 ) ) ( not ( = ?auto_514301 ?auto_514306 ) ) ( not ( = ?auto_514301 ?auto_514307 ) ) ( not ( = ?auto_514301 ?auto_514308 ) ) ( not ( = ?auto_514301 ?auto_514309 ) ) ( not ( = ?auto_514301 ?auto_514310 ) ) ( not ( = ?auto_514302 ?auto_514303 ) ) ( not ( = ?auto_514302 ?auto_514304 ) ) ( not ( = ?auto_514302 ?auto_514305 ) ) ( not ( = ?auto_514302 ?auto_514306 ) ) ( not ( = ?auto_514302 ?auto_514307 ) ) ( not ( = ?auto_514302 ?auto_514308 ) ) ( not ( = ?auto_514302 ?auto_514309 ) ) ( not ( = ?auto_514302 ?auto_514310 ) ) ( not ( = ?auto_514303 ?auto_514304 ) ) ( not ( = ?auto_514303 ?auto_514305 ) ) ( not ( = ?auto_514303 ?auto_514306 ) ) ( not ( = ?auto_514303 ?auto_514307 ) ) ( not ( = ?auto_514303 ?auto_514308 ) ) ( not ( = ?auto_514303 ?auto_514309 ) ) ( not ( = ?auto_514303 ?auto_514310 ) ) ( not ( = ?auto_514304 ?auto_514305 ) ) ( not ( = ?auto_514304 ?auto_514306 ) ) ( not ( = ?auto_514304 ?auto_514307 ) ) ( not ( = ?auto_514304 ?auto_514308 ) ) ( not ( = ?auto_514304 ?auto_514309 ) ) ( not ( = ?auto_514304 ?auto_514310 ) ) ( not ( = ?auto_514305 ?auto_514306 ) ) ( not ( = ?auto_514305 ?auto_514307 ) ) ( not ( = ?auto_514305 ?auto_514308 ) ) ( not ( = ?auto_514305 ?auto_514309 ) ) ( not ( = ?auto_514305 ?auto_514310 ) ) ( not ( = ?auto_514306 ?auto_514307 ) ) ( not ( = ?auto_514306 ?auto_514308 ) ) ( not ( = ?auto_514306 ?auto_514309 ) ) ( not ( = ?auto_514306 ?auto_514310 ) ) ( not ( = ?auto_514307 ?auto_514308 ) ) ( not ( = ?auto_514307 ?auto_514309 ) ) ( not ( = ?auto_514307 ?auto_514310 ) ) ( not ( = ?auto_514308 ?auto_514309 ) ) ( not ( = ?auto_514308 ?auto_514310 ) ) ( not ( = ?auto_514309 ?auto_514310 ) ) ( ON ?auto_514309 ?auto_514310 ) ( ON ?auto_514308 ?auto_514309 ) ( CLEAR ?auto_514306 ) ( ON ?auto_514307 ?auto_514308 ) ( CLEAR ?auto_514307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_514295 ?auto_514296 ?auto_514297 ?auto_514298 ?auto_514299 ?auto_514300 ?auto_514301 ?auto_514302 ?auto_514303 ?auto_514304 ?auto_514305 ?auto_514306 ?auto_514307 )
      ( MAKE-16PILE ?auto_514295 ?auto_514296 ?auto_514297 ?auto_514298 ?auto_514299 ?auto_514300 ?auto_514301 ?auto_514302 ?auto_514303 ?auto_514304 ?auto_514305 ?auto_514306 ?auto_514307 ?auto_514308 ?auto_514309 ?auto_514310 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514327 - BLOCK
      ?auto_514328 - BLOCK
      ?auto_514329 - BLOCK
      ?auto_514330 - BLOCK
      ?auto_514331 - BLOCK
      ?auto_514332 - BLOCK
      ?auto_514333 - BLOCK
      ?auto_514334 - BLOCK
      ?auto_514335 - BLOCK
      ?auto_514336 - BLOCK
      ?auto_514337 - BLOCK
      ?auto_514338 - BLOCK
      ?auto_514339 - BLOCK
      ?auto_514340 - BLOCK
      ?auto_514341 - BLOCK
      ?auto_514342 - BLOCK
    )
    :vars
    (
      ?auto_514343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514342 ?auto_514343 ) ( ON-TABLE ?auto_514327 ) ( ON ?auto_514328 ?auto_514327 ) ( ON ?auto_514329 ?auto_514328 ) ( ON ?auto_514330 ?auto_514329 ) ( ON ?auto_514331 ?auto_514330 ) ( ON ?auto_514332 ?auto_514331 ) ( ON ?auto_514333 ?auto_514332 ) ( ON ?auto_514334 ?auto_514333 ) ( ON ?auto_514335 ?auto_514334 ) ( ON ?auto_514336 ?auto_514335 ) ( ON ?auto_514337 ?auto_514336 ) ( not ( = ?auto_514327 ?auto_514328 ) ) ( not ( = ?auto_514327 ?auto_514329 ) ) ( not ( = ?auto_514327 ?auto_514330 ) ) ( not ( = ?auto_514327 ?auto_514331 ) ) ( not ( = ?auto_514327 ?auto_514332 ) ) ( not ( = ?auto_514327 ?auto_514333 ) ) ( not ( = ?auto_514327 ?auto_514334 ) ) ( not ( = ?auto_514327 ?auto_514335 ) ) ( not ( = ?auto_514327 ?auto_514336 ) ) ( not ( = ?auto_514327 ?auto_514337 ) ) ( not ( = ?auto_514327 ?auto_514338 ) ) ( not ( = ?auto_514327 ?auto_514339 ) ) ( not ( = ?auto_514327 ?auto_514340 ) ) ( not ( = ?auto_514327 ?auto_514341 ) ) ( not ( = ?auto_514327 ?auto_514342 ) ) ( not ( = ?auto_514327 ?auto_514343 ) ) ( not ( = ?auto_514328 ?auto_514329 ) ) ( not ( = ?auto_514328 ?auto_514330 ) ) ( not ( = ?auto_514328 ?auto_514331 ) ) ( not ( = ?auto_514328 ?auto_514332 ) ) ( not ( = ?auto_514328 ?auto_514333 ) ) ( not ( = ?auto_514328 ?auto_514334 ) ) ( not ( = ?auto_514328 ?auto_514335 ) ) ( not ( = ?auto_514328 ?auto_514336 ) ) ( not ( = ?auto_514328 ?auto_514337 ) ) ( not ( = ?auto_514328 ?auto_514338 ) ) ( not ( = ?auto_514328 ?auto_514339 ) ) ( not ( = ?auto_514328 ?auto_514340 ) ) ( not ( = ?auto_514328 ?auto_514341 ) ) ( not ( = ?auto_514328 ?auto_514342 ) ) ( not ( = ?auto_514328 ?auto_514343 ) ) ( not ( = ?auto_514329 ?auto_514330 ) ) ( not ( = ?auto_514329 ?auto_514331 ) ) ( not ( = ?auto_514329 ?auto_514332 ) ) ( not ( = ?auto_514329 ?auto_514333 ) ) ( not ( = ?auto_514329 ?auto_514334 ) ) ( not ( = ?auto_514329 ?auto_514335 ) ) ( not ( = ?auto_514329 ?auto_514336 ) ) ( not ( = ?auto_514329 ?auto_514337 ) ) ( not ( = ?auto_514329 ?auto_514338 ) ) ( not ( = ?auto_514329 ?auto_514339 ) ) ( not ( = ?auto_514329 ?auto_514340 ) ) ( not ( = ?auto_514329 ?auto_514341 ) ) ( not ( = ?auto_514329 ?auto_514342 ) ) ( not ( = ?auto_514329 ?auto_514343 ) ) ( not ( = ?auto_514330 ?auto_514331 ) ) ( not ( = ?auto_514330 ?auto_514332 ) ) ( not ( = ?auto_514330 ?auto_514333 ) ) ( not ( = ?auto_514330 ?auto_514334 ) ) ( not ( = ?auto_514330 ?auto_514335 ) ) ( not ( = ?auto_514330 ?auto_514336 ) ) ( not ( = ?auto_514330 ?auto_514337 ) ) ( not ( = ?auto_514330 ?auto_514338 ) ) ( not ( = ?auto_514330 ?auto_514339 ) ) ( not ( = ?auto_514330 ?auto_514340 ) ) ( not ( = ?auto_514330 ?auto_514341 ) ) ( not ( = ?auto_514330 ?auto_514342 ) ) ( not ( = ?auto_514330 ?auto_514343 ) ) ( not ( = ?auto_514331 ?auto_514332 ) ) ( not ( = ?auto_514331 ?auto_514333 ) ) ( not ( = ?auto_514331 ?auto_514334 ) ) ( not ( = ?auto_514331 ?auto_514335 ) ) ( not ( = ?auto_514331 ?auto_514336 ) ) ( not ( = ?auto_514331 ?auto_514337 ) ) ( not ( = ?auto_514331 ?auto_514338 ) ) ( not ( = ?auto_514331 ?auto_514339 ) ) ( not ( = ?auto_514331 ?auto_514340 ) ) ( not ( = ?auto_514331 ?auto_514341 ) ) ( not ( = ?auto_514331 ?auto_514342 ) ) ( not ( = ?auto_514331 ?auto_514343 ) ) ( not ( = ?auto_514332 ?auto_514333 ) ) ( not ( = ?auto_514332 ?auto_514334 ) ) ( not ( = ?auto_514332 ?auto_514335 ) ) ( not ( = ?auto_514332 ?auto_514336 ) ) ( not ( = ?auto_514332 ?auto_514337 ) ) ( not ( = ?auto_514332 ?auto_514338 ) ) ( not ( = ?auto_514332 ?auto_514339 ) ) ( not ( = ?auto_514332 ?auto_514340 ) ) ( not ( = ?auto_514332 ?auto_514341 ) ) ( not ( = ?auto_514332 ?auto_514342 ) ) ( not ( = ?auto_514332 ?auto_514343 ) ) ( not ( = ?auto_514333 ?auto_514334 ) ) ( not ( = ?auto_514333 ?auto_514335 ) ) ( not ( = ?auto_514333 ?auto_514336 ) ) ( not ( = ?auto_514333 ?auto_514337 ) ) ( not ( = ?auto_514333 ?auto_514338 ) ) ( not ( = ?auto_514333 ?auto_514339 ) ) ( not ( = ?auto_514333 ?auto_514340 ) ) ( not ( = ?auto_514333 ?auto_514341 ) ) ( not ( = ?auto_514333 ?auto_514342 ) ) ( not ( = ?auto_514333 ?auto_514343 ) ) ( not ( = ?auto_514334 ?auto_514335 ) ) ( not ( = ?auto_514334 ?auto_514336 ) ) ( not ( = ?auto_514334 ?auto_514337 ) ) ( not ( = ?auto_514334 ?auto_514338 ) ) ( not ( = ?auto_514334 ?auto_514339 ) ) ( not ( = ?auto_514334 ?auto_514340 ) ) ( not ( = ?auto_514334 ?auto_514341 ) ) ( not ( = ?auto_514334 ?auto_514342 ) ) ( not ( = ?auto_514334 ?auto_514343 ) ) ( not ( = ?auto_514335 ?auto_514336 ) ) ( not ( = ?auto_514335 ?auto_514337 ) ) ( not ( = ?auto_514335 ?auto_514338 ) ) ( not ( = ?auto_514335 ?auto_514339 ) ) ( not ( = ?auto_514335 ?auto_514340 ) ) ( not ( = ?auto_514335 ?auto_514341 ) ) ( not ( = ?auto_514335 ?auto_514342 ) ) ( not ( = ?auto_514335 ?auto_514343 ) ) ( not ( = ?auto_514336 ?auto_514337 ) ) ( not ( = ?auto_514336 ?auto_514338 ) ) ( not ( = ?auto_514336 ?auto_514339 ) ) ( not ( = ?auto_514336 ?auto_514340 ) ) ( not ( = ?auto_514336 ?auto_514341 ) ) ( not ( = ?auto_514336 ?auto_514342 ) ) ( not ( = ?auto_514336 ?auto_514343 ) ) ( not ( = ?auto_514337 ?auto_514338 ) ) ( not ( = ?auto_514337 ?auto_514339 ) ) ( not ( = ?auto_514337 ?auto_514340 ) ) ( not ( = ?auto_514337 ?auto_514341 ) ) ( not ( = ?auto_514337 ?auto_514342 ) ) ( not ( = ?auto_514337 ?auto_514343 ) ) ( not ( = ?auto_514338 ?auto_514339 ) ) ( not ( = ?auto_514338 ?auto_514340 ) ) ( not ( = ?auto_514338 ?auto_514341 ) ) ( not ( = ?auto_514338 ?auto_514342 ) ) ( not ( = ?auto_514338 ?auto_514343 ) ) ( not ( = ?auto_514339 ?auto_514340 ) ) ( not ( = ?auto_514339 ?auto_514341 ) ) ( not ( = ?auto_514339 ?auto_514342 ) ) ( not ( = ?auto_514339 ?auto_514343 ) ) ( not ( = ?auto_514340 ?auto_514341 ) ) ( not ( = ?auto_514340 ?auto_514342 ) ) ( not ( = ?auto_514340 ?auto_514343 ) ) ( not ( = ?auto_514341 ?auto_514342 ) ) ( not ( = ?auto_514341 ?auto_514343 ) ) ( not ( = ?auto_514342 ?auto_514343 ) ) ( ON ?auto_514341 ?auto_514342 ) ( ON ?auto_514340 ?auto_514341 ) ( ON ?auto_514339 ?auto_514340 ) ( CLEAR ?auto_514337 ) ( ON ?auto_514338 ?auto_514339 ) ( CLEAR ?auto_514338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_514327 ?auto_514328 ?auto_514329 ?auto_514330 ?auto_514331 ?auto_514332 ?auto_514333 ?auto_514334 ?auto_514335 ?auto_514336 ?auto_514337 ?auto_514338 )
      ( MAKE-16PILE ?auto_514327 ?auto_514328 ?auto_514329 ?auto_514330 ?auto_514331 ?auto_514332 ?auto_514333 ?auto_514334 ?auto_514335 ?auto_514336 ?auto_514337 ?auto_514338 ?auto_514339 ?auto_514340 ?auto_514341 ?auto_514342 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514360 - BLOCK
      ?auto_514361 - BLOCK
      ?auto_514362 - BLOCK
      ?auto_514363 - BLOCK
      ?auto_514364 - BLOCK
      ?auto_514365 - BLOCK
      ?auto_514366 - BLOCK
      ?auto_514367 - BLOCK
      ?auto_514368 - BLOCK
      ?auto_514369 - BLOCK
      ?auto_514370 - BLOCK
      ?auto_514371 - BLOCK
      ?auto_514372 - BLOCK
      ?auto_514373 - BLOCK
      ?auto_514374 - BLOCK
      ?auto_514375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514375 ) ( ON-TABLE ?auto_514360 ) ( ON ?auto_514361 ?auto_514360 ) ( ON ?auto_514362 ?auto_514361 ) ( ON ?auto_514363 ?auto_514362 ) ( ON ?auto_514364 ?auto_514363 ) ( ON ?auto_514365 ?auto_514364 ) ( ON ?auto_514366 ?auto_514365 ) ( ON ?auto_514367 ?auto_514366 ) ( ON ?auto_514368 ?auto_514367 ) ( ON ?auto_514369 ?auto_514368 ) ( ON ?auto_514370 ?auto_514369 ) ( not ( = ?auto_514360 ?auto_514361 ) ) ( not ( = ?auto_514360 ?auto_514362 ) ) ( not ( = ?auto_514360 ?auto_514363 ) ) ( not ( = ?auto_514360 ?auto_514364 ) ) ( not ( = ?auto_514360 ?auto_514365 ) ) ( not ( = ?auto_514360 ?auto_514366 ) ) ( not ( = ?auto_514360 ?auto_514367 ) ) ( not ( = ?auto_514360 ?auto_514368 ) ) ( not ( = ?auto_514360 ?auto_514369 ) ) ( not ( = ?auto_514360 ?auto_514370 ) ) ( not ( = ?auto_514360 ?auto_514371 ) ) ( not ( = ?auto_514360 ?auto_514372 ) ) ( not ( = ?auto_514360 ?auto_514373 ) ) ( not ( = ?auto_514360 ?auto_514374 ) ) ( not ( = ?auto_514360 ?auto_514375 ) ) ( not ( = ?auto_514361 ?auto_514362 ) ) ( not ( = ?auto_514361 ?auto_514363 ) ) ( not ( = ?auto_514361 ?auto_514364 ) ) ( not ( = ?auto_514361 ?auto_514365 ) ) ( not ( = ?auto_514361 ?auto_514366 ) ) ( not ( = ?auto_514361 ?auto_514367 ) ) ( not ( = ?auto_514361 ?auto_514368 ) ) ( not ( = ?auto_514361 ?auto_514369 ) ) ( not ( = ?auto_514361 ?auto_514370 ) ) ( not ( = ?auto_514361 ?auto_514371 ) ) ( not ( = ?auto_514361 ?auto_514372 ) ) ( not ( = ?auto_514361 ?auto_514373 ) ) ( not ( = ?auto_514361 ?auto_514374 ) ) ( not ( = ?auto_514361 ?auto_514375 ) ) ( not ( = ?auto_514362 ?auto_514363 ) ) ( not ( = ?auto_514362 ?auto_514364 ) ) ( not ( = ?auto_514362 ?auto_514365 ) ) ( not ( = ?auto_514362 ?auto_514366 ) ) ( not ( = ?auto_514362 ?auto_514367 ) ) ( not ( = ?auto_514362 ?auto_514368 ) ) ( not ( = ?auto_514362 ?auto_514369 ) ) ( not ( = ?auto_514362 ?auto_514370 ) ) ( not ( = ?auto_514362 ?auto_514371 ) ) ( not ( = ?auto_514362 ?auto_514372 ) ) ( not ( = ?auto_514362 ?auto_514373 ) ) ( not ( = ?auto_514362 ?auto_514374 ) ) ( not ( = ?auto_514362 ?auto_514375 ) ) ( not ( = ?auto_514363 ?auto_514364 ) ) ( not ( = ?auto_514363 ?auto_514365 ) ) ( not ( = ?auto_514363 ?auto_514366 ) ) ( not ( = ?auto_514363 ?auto_514367 ) ) ( not ( = ?auto_514363 ?auto_514368 ) ) ( not ( = ?auto_514363 ?auto_514369 ) ) ( not ( = ?auto_514363 ?auto_514370 ) ) ( not ( = ?auto_514363 ?auto_514371 ) ) ( not ( = ?auto_514363 ?auto_514372 ) ) ( not ( = ?auto_514363 ?auto_514373 ) ) ( not ( = ?auto_514363 ?auto_514374 ) ) ( not ( = ?auto_514363 ?auto_514375 ) ) ( not ( = ?auto_514364 ?auto_514365 ) ) ( not ( = ?auto_514364 ?auto_514366 ) ) ( not ( = ?auto_514364 ?auto_514367 ) ) ( not ( = ?auto_514364 ?auto_514368 ) ) ( not ( = ?auto_514364 ?auto_514369 ) ) ( not ( = ?auto_514364 ?auto_514370 ) ) ( not ( = ?auto_514364 ?auto_514371 ) ) ( not ( = ?auto_514364 ?auto_514372 ) ) ( not ( = ?auto_514364 ?auto_514373 ) ) ( not ( = ?auto_514364 ?auto_514374 ) ) ( not ( = ?auto_514364 ?auto_514375 ) ) ( not ( = ?auto_514365 ?auto_514366 ) ) ( not ( = ?auto_514365 ?auto_514367 ) ) ( not ( = ?auto_514365 ?auto_514368 ) ) ( not ( = ?auto_514365 ?auto_514369 ) ) ( not ( = ?auto_514365 ?auto_514370 ) ) ( not ( = ?auto_514365 ?auto_514371 ) ) ( not ( = ?auto_514365 ?auto_514372 ) ) ( not ( = ?auto_514365 ?auto_514373 ) ) ( not ( = ?auto_514365 ?auto_514374 ) ) ( not ( = ?auto_514365 ?auto_514375 ) ) ( not ( = ?auto_514366 ?auto_514367 ) ) ( not ( = ?auto_514366 ?auto_514368 ) ) ( not ( = ?auto_514366 ?auto_514369 ) ) ( not ( = ?auto_514366 ?auto_514370 ) ) ( not ( = ?auto_514366 ?auto_514371 ) ) ( not ( = ?auto_514366 ?auto_514372 ) ) ( not ( = ?auto_514366 ?auto_514373 ) ) ( not ( = ?auto_514366 ?auto_514374 ) ) ( not ( = ?auto_514366 ?auto_514375 ) ) ( not ( = ?auto_514367 ?auto_514368 ) ) ( not ( = ?auto_514367 ?auto_514369 ) ) ( not ( = ?auto_514367 ?auto_514370 ) ) ( not ( = ?auto_514367 ?auto_514371 ) ) ( not ( = ?auto_514367 ?auto_514372 ) ) ( not ( = ?auto_514367 ?auto_514373 ) ) ( not ( = ?auto_514367 ?auto_514374 ) ) ( not ( = ?auto_514367 ?auto_514375 ) ) ( not ( = ?auto_514368 ?auto_514369 ) ) ( not ( = ?auto_514368 ?auto_514370 ) ) ( not ( = ?auto_514368 ?auto_514371 ) ) ( not ( = ?auto_514368 ?auto_514372 ) ) ( not ( = ?auto_514368 ?auto_514373 ) ) ( not ( = ?auto_514368 ?auto_514374 ) ) ( not ( = ?auto_514368 ?auto_514375 ) ) ( not ( = ?auto_514369 ?auto_514370 ) ) ( not ( = ?auto_514369 ?auto_514371 ) ) ( not ( = ?auto_514369 ?auto_514372 ) ) ( not ( = ?auto_514369 ?auto_514373 ) ) ( not ( = ?auto_514369 ?auto_514374 ) ) ( not ( = ?auto_514369 ?auto_514375 ) ) ( not ( = ?auto_514370 ?auto_514371 ) ) ( not ( = ?auto_514370 ?auto_514372 ) ) ( not ( = ?auto_514370 ?auto_514373 ) ) ( not ( = ?auto_514370 ?auto_514374 ) ) ( not ( = ?auto_514370 ?auto_514375 ) ) ( not ( = ?auto_514371 ?auto_514372 ) ) ( not ( = ?auto_514371 ?auto_514373 ) ) ( not ( = ?auto_514371 ?auto_514374 ) ) ( not ( = ?auto_514371 ?auto_514375 ) ) ( not ( = ?auto_514372 ?auto_514373 ) ) ( not ( = ?auto_514372 ?auto_514374 ) ) ( not ( = ?auto_514372 ?auto_514375 ) ) ( not ( = ?auto_514373 ?auto_514374 ) ) ( not ( = ?auto_514373 ?auto_514375 ) ) ( not ( = ?auto_514374 ?auto_514375 ) ) ( ON ?auto_514374 ?auto_514375 ) ( ON ?auto_514373 ?auto_514374 ) ( ON ?auto_514372 ?auto_514373 ) ( CLEAR ?auto_514370 ) ( ON ?auto_514371 ?auto_514372 ) ( CLEAR ?auto_514371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_514360 ?auto_514361 ?auto_514362 ?auto_514363 ?auto_514364 ?auto_514365 ?auto_514366 ?auto_514367 ?auto_514368 ?auto_514369 ?auto_514370 ?auto_514371 )
      ( MAKE-16PILE ?auto_514360 ?auto_514361 ?auto_514362 ?auto_514363 ?auto_514364 ?auto_514365 ?auto_514366 ?auto_514367 ?auto_514368 ?auto_514369 ?auto_514370 ?auto_514371 ?auto_514372 ?auto_514373 ?auto_514374 ?auto_514375 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514392 - BLOCK
      ?auto_514393 - BLOCK
      ?auto_514394 - BLOCK
      ?auto_514395 - BLOCK
      ?auto_514396 - BLOCK
      ?auto_514397 - BLOCK
      ?auto_514398 - BLOCK
      ?auto_514399 - BLOCK
      ?auto_514400 - BLOCK
      ?auto_514401 - BLOCK
      ?auto_514402 - BLOCK
      ?auto_514403 - BLOCK
      ?auto_514404 - BLOCK
      ?auto_514405 - BLOCK
      ?auto_514406 - BLOCK
      ?auto_514407 - BLOCK
    )
    :vars
    (
      ?auto_514408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514407 ?auto_514408 ) ( ON-TABLE ?auto_514392 ) ( ON ?auto_514393 ?auto_514392 ) ( ON ?auto_514394 ?auto_514393 ) ( ON ?auto_514395 ?auto_514394 ) ( ON ?auto_514396 ?auto_514395 ) ( ON ?auto_514397 ?auto_514396 ) ( ON ?auto_514398 ?auto_514397 ) ( ON ?auto_514399 ?auto_514398 ) ( ON ?auto_514400 ?auto_514399 ) ( ON ?auto_514401 ?auto_514400 ) ( not ( = ?auto_514392 ?auto_514393 ) ) ( not ( = ?auto_514392 ?auto_514394 ) ) ( not ( = ?auto_514392 ?auto_514395 ) ) ( not ( = ?auto_514392 ?auto_514396 ) ) ( not ( = ?auto_514392 ?auto_514397 ) ) ( not ( = ?auto_514392 ?auto_514398 ) ) ( not ( = ?auto_514392 ?auto_514399 ) ) ( not ( = ?auto_514392 ?auto_514400 ) ) ( not ( = ?auto_514392 ?auto_514401 ) ) ( not ( = ?auto_514392 ?auto_514402 ) ) ( not ( = ?auto_514392 ?auto_514403 ) ) ( not ( = ?auto_514392 ?auto_514404 ) ) ( not ( = ?auto_514392 ?auto_514405 ) ) ( not ( = ?auto_514392 ?auto_514406 ) ) ( not ( = ?auto_514392 ?auto_514407 ) ) ( not ( = ?auto_514392 ?auto_514408 ) ) ( not ( = ?auto_514393 ?auto_514394 ) ) ( not ( = ?auto_514393 ?auto_514395 ) ) ( not ( = ?auto_514393 ?auto_514396 ) ) ( not ( = ?auto_514393 ?auto_514397 ) ) ( not ( = ?auto_514393 ?auto_514398 ) ) ( not ( = ?auto_514393 ?auto_514399 ) ) ( not ( = ?auto_514393 ?auto_514400 ) ) ( not ( = ?auto_514393 ?auto_514401 ) ) ( not ( = ?auto_514393 ?auto_514402 ) ) ( not ( = ?auto_514393 ?auto_514403 ) ) ( not ( = ?auto_514393 ?auto_514404 ) ) ( not ( = ?auto_514393 ?auto_514405 ) ) ( not ( = ?auto_514393 ?auto_514406 ) ) ( not ( = ?auto_514393 ?auto_514407 ) ) ( not ( = ?auto_514393 ?auto_514408 ) ) ( not ( = ?auto_514394 ?auto_514395 ) ) ( not ( = ?auto_514394 ?auto_514396 ) ) ( not ( = ?auto_514394 ?auto_514397 ) ) ( not ( = ?auto_514394 ?auto_514398 ) ) ( not ( = ?auto_514394 ?auto_514399 ) ) ( not ( = ?auto_514394 ?auto_514400 ) ) ( not ( = ?auto_514394 ?auto_514401 ) ) ( not ( = ?auto_514394 ?auto_514402 ) ) ( not ( = ?auto_514394 ?auto_514403 ) ) ( not ( = ?auto_514394 ?auto_514404 ) ) ( not ( = ?auto_514394 ?auto_514405 ) ) ( not ( = ?auto_514394 ?auto_514406 ) ) ( not ( = ?auto_514394 ?auto_514407 ) ) ( not ( = ?auto_514394 ?auto_514408 ) ) ( not ( = ?auto_514395 ?auto_514396 ) ) ( not ( = ?auto_514395 ?auto_514397 ) ) ( not ( = ?auto_514395 ?auto_514398 ) ) ( not ( = ?auto_514395 ?auto_514399 ) ) ( not ( = ?auto_514395 ?auto_514400 ) ) ( not ( = ?auto_514395 ?auto_514401 ) ) ( not ( = ?auto_514395 ?auto_514402 ) ) ( not ( = ?auto_514395 ?auto_514403 ) ) ( not ( = ?auto_514395 ?auto_514404 ) ) ( not ( = ?auto_514395 ?auto_514405 ) ) ( not ( = ?auto_514395 ?auto_514406 ) ) ( not ( = ?auto_514395 ?auto_514407 ) ) ( not ( = ?auto_514395 ?auto_514408 ) ) ( not ( = ?auto_514396 ?auto_514397 ) ) ( not ( = ?auto_514396 ?auto_514398 ) ) ( not ( = ?auto_514396 ?auto_514399 ) ) ( not ( = ?auto_514396 ?auto_514400 ) ) ( not ( = ?auto_514396 ?auto_514401 ) ) ( not ( = ?auto_514396 ?auto_514402 ) ) ( not ( = ?auto_514396 ?auto_514403 ) ) ( not ( = ?auto_514396 ?auto_514404 ) ) ( not ( = ?auto_514396 ?auto_514405 ) ) ( not ( = ?auto_514396 ?auto_514406 ) ) ( not ( = ?auto_514396 ?auto_514407 ) ) ( not ( = ?auto_514396 ?auto_514408 ) ) ( not ( = ?auto_514397 ?auto_514398 ) ) ( not ( = ?auto_514397 ?auto_514399 ) ) ( not ( = ?auto_514397 ?auto_514400 ) ) ( not ( = ?auto_514397 ?auto_514401 ) ) ( not ( = ?auto_514397 ?auto_514402 ) ) ( not ( = ?auto_514397 ?auto_514403 ) ) ( not ( = ?auto_514397 ?auto_514404 ) ) ( not ( = ?auto_514397 ?auto_514405 ) ) ( not ( = ?auto_514397 ?auto_514406 ) ) ( not ( = ?auto_514397 ?auto_514407 ) ) ( not ( = ?auto_514397 ?auto_514408 ) ) ( not ( = ?auto_514398 ?auto_514399 ) ) ( not ( = ?auto_514398 ?auto_514400 ) ) ( not ( = ?auto_514398 ?auto_514401 ) ) ( not ( = ?auto_514398 ?auto_514402 ) ) ( not ( = ?auto_514398 ?auto_514403 ) ) ( not ( = ?auto_514398 ?auto_514404 ) ) ( not ( = ?auto_514398 ?auto_514405 ) ) ( not ( = ?auto_514398 ?auto_514406 ) ) ( not ( = ?auto_514398 ?auto_514407 ) ) ( not ( = ?auto_514398 ?auto_514408 ) ) ( not ( = ?auto_514399 ?auto_514400 ) ) ( not ( = ?auto_514399 ?auto_514401 ) ) ( not ( = ?auto_514399 ?auto_514402 ) ) ( not ( = ?auto_514399 ?auto_514403 ) ) ( not ( = ?auto_514399 ?auto_514404 ) ) ( not ( = ?auto_514399 ?auto_514405 ) ) ( not ( = ?auto_514399 ?auto_514406 ) ) ( not ( = ?auto_514399 ?auto_514407 ) ) ( not ( = ?auto_514399 ?auto_514408 ) ) ( not ( = ?auto_514400 ?auto_514401 ) ) ( not ( = ?auto_514400 ?auto_514402 ) ) ( not ( = ?auto_514400 ?auto_514403 ) ) ( not ( = ?auto_514400 ?auto_514404 ) ) ( not ( = ?auto_514400 ?auto_514405 ) ) ( not ( = ?auto_514400 ?auto_514406 ) ) ( not ( = ?auto_514400 ?auto_514407 ) ) ( not ( = ?auto_514400 ?auto_514408 ) ) ( not ( = ?auto_514401 ?auto_514402 ) ) ( not ( = ?auto_514401 ?auto_514403 ) ) ( not ( = ?auto_514401 ?auto_514404 ) ) ( not ( = ?auto_514401 ?auto_514405 ) ) ( not ( = ?auto_514401 ?auto_514406 ) ) ( not ( = ?auto_514401 ?auto_514407 ) ) ( not ( = ?auto_514401 ?auto_514408 ) ) ( not ( = ?auto_514402 ?auto_514403 ) ) ( not ( = ?auto_514402 ?auto_514404 ) ) ( not ( = ?auto_514402 ?auto_514405 ) ) ( not ( = ?auto_514402 ?auto_514406 ) ) ( not ( = ?auto_514402 ?auto_514407 ) ) ( not ( = ?auto_514402 ?auto_514408 ) ) ( not ( = ?auto_514403 ?auto_514404 ) ) ( not ( = ?auto_514403 ?auto_514405 ) ) ( not ( = ?auto_514403 ?auto_514406 ) ) ( not ( = ?auto_514403 ?auto_514407 ) ) ( not ( = ?auto_514403 ?auto_514408 ) ) ( not ( = ?auto_514404 ?auto_514405 ) ) ( not ( = ?auto_514404 ?auto_514406 ) ) ( not ( = ?auto_514404 ?auto_514407 ) ) ( not ( = ?auto_514404 ?auto_514408 ) ) ( not ( = ?auto_514405 ?auto_514406 ) ) ( not ( = ?auto_514405 ?auto_514407 ) ) ( not ( = ?auto_514405 ?auto_514408 ) ) ( not ( = ?auto_514406 ?auto_514407 ) ) ( not ( = ?auto_514406 ?auto_514408 ) ) ( not ( = ?auto_514407 ?auto_514408 ) ) ( ON ?auto_514406 ?auto_514407 ) ( ON ?auto_514405 ?auto_514406 ) ( ON ?auto_514404 ?auto_514405 ) ( ON ?auto_514403 ?auto_514404 ) ( CLEAR ?auto_514401 ) ( ON ?auto_514402 ?auto_514403 ) ( CLEAR ?auto_514402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_514392 ?auto_514393 ?auto_514394 ?auto_514395 ?auto_514396 ?auto_514397 ?auto_514398 ?auto_514399 ?auto_514400 ?auto_514401 ?auto_514402 )
      ( MAKE-16PILE ?auto_514392 ?auto_514393 ?auto_514394 ?auto_514395 ?auto_514396 ?auto_514397 ?auto_514398 ?auto_514399 ?auto_514400 ?auto_514401 ?auto_514402 ?auto_514403 ?auto_514404 ?auto_514405 ?auto_514406 ?auto_514407 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514425 - BLOCK
      ?auto_514426 - BLOCK
      ?auto_514427 - BLOCK
      ?auto_514428 - BLOCK
      ?auto_514429 - BLOCK
      ?auto_514430 - BLOCK
      ?auto_514431 - BLOCK
      ?auto_514432 - BLOCK
      ?auto_514433 - BLOCK
      ?auto_514434 - BLOCK
      ?auto_514435 - BLOCK
      ?auto_514436 - BLOCK
      ?auto_514437 - BLOCK
      ?auto_514438 - BLOCK
      ?auto_514439 - BLOCK
      ?auto_514440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514440 ) ( ON-TABLE ?auto_514425 ) ( ON ?auto_514426 ?auto_514425 ) ( ON ?auto_514427 ?auto_514426 ) ( ON ?auto_514428 ?auto_514427 ) ( ON ?auto_514429 ?auto_514428 ) ( ON ?auto_514430 ?auto_514429 ) ( ON ?auto_514431 ?auto_514430 ) ( ON ?auto_514432 ?auto_514431 ) ( ON ?auto_514433 ?auto_514432 ) ( ON ?auto_514434 ?auto_514433 ) ( not ( = ?auto_514425 ?auto_514426 ) ) ( not ( = ?auto_514425 ?auto_514427 ) ) ( not ( = ?auto_514425 ?auto_514428 ) ) ( not ( = ?auto_514425 ?auto_514429 ) ) ( not ( = ?auto_514425 ?auto_514430 ) ) ( not ( = ?auto_514425 ?auto_514431 ) ) ( not ( = ?auto_514425 ?auto_514432 ) ) ( not ( = ?auto_514425 ?auto_514433 ) ) ( not ( = ?auto_514425 ?auto_514434 ) ) ( not ( = ?auto_514425 ?auto_514435 ) ) ( not ( = ?auto_514425 ?auto_514436 ) ) ( not ( = ?auto_514425 ?auto_514437 ) ) ( not ( = ?auto_514425 ?auto_514438 ) ) ( not ( = ?auto_514425 ?auto_514439 ) ) ( not ( = ?auto_514425 ?auto_514440 ) ) ( not ( = ?auto_514426 ?auto_514427 ) ) ( not ( = ?auto_514426 ?auto_514428 ) ) ( not ( = ?auto_514426 ?auto_514429 ) ) ( not ( = ?auto_514426 ?auto_514430 ) ) ( not ( = ?auto_514426 ?auto_514431 ) ) ( not ( = ?auto_514426 ?auto_514432 ) ) ( not ( = ?auto_514426 ?auto_514433 ) ) ( not ( = ?auto_514426 ?auto_514434 ) ) ( not ( = ?auto_514426 ?auto_514435 ) ) ( not ( = ?auto_514426 ?auto_514436 ) ) ( not ( = ?auto_514426 ?auto_514437 ) ) ( not ( = ?auto_514426 ?auto_514438 ) ) ( not ( = ?auto_514426 ?auto_514439 ) ) ( not ( = ?auto_514426 ?auto_514440 ) ) ( not ( = ?auto_514427 ?auto_514428 ) ) ( not ( = ?auto_514427 ?auto_514429 ) ) ( not ( = ?auto_514427 ?auto_514430 ) ) ( not ( = ?auto_514427 ?auto_514431 ) ) ( not ( = ?auto_514427 ?auto_514432 ) ) ( not ( = ?auto_514427 ?auto_514433 ) ) ( not ( = ?auto_514427 ?auto_514434 ) ) ( not ( = ?auto_514427 ?auto_514435 ) ) ( not ( = ?auto_514427 ?auto_514436 ) ) ( not ( = ?auto_514427 ?auto_514437 ) ) ( not ( = ?auto_514427 ?auto_514438 ) ) ( not ( = ?auto_514427 ?auto_514439 ) ) ( not ( = ?auto_514427 ?auto_514440 ) ) ( not ( = ?auto_514428 ?auto_514429 ) ) ( not ( = ?auto_514428 ?auto_514430 ) ) ( not ( = ?auto_514428 ?auto_514431 ) ) ( not ( = ?auto_514428 ?auto_514432 ) ) ( not ( = ?auto_514428 ?auto_514433 ) ) ( not ( = ?auto_514428 ?auto_514434 ) ) ( not ( = ?auto_514428 ?auto_514435 ) ) ( not ( = ?auto_514428 ?auto_514436 ) ) ( not ( = ?auto_514428 ?auto_514437 ) ) ( not ( = ?auto_514428 ?auto_514438 ) ) ( not ( = ?auto_514428 ?auto_514439 ) ) ( not ( = ?auto_514428 ?auto_514440 ) ) ( not ( = ?auto_514429 ?auto_514430 ) ) ( not ( = ?auto_514429 ?auto_514431 ) ) ( not ( = ?auto_514429 ?auto_514432 ) ) ( not ( = ?auto_514429 ?auto_514433 ) ) ( not ( = ?auto_514429 ?auto_514434 ) ) ( not ( = ?auto_514429 ?auto_514435 ) ) ( not ( = ?auto_514429 ?auto_514436 ) ) ( not ( = ?auto_514429 ?auto_514437 ) ) ( not ( = ?auto_514429 ?auto_514438 ) ) ( not ( = ?auto_514429 ?auto_514439 ) ) ( not ( = ?auto_514429 ?auto_514440 ) ) ( not ( = ?auto_514430 ?auto_514431 ) ) ( not ( = ?auto_514430 ?auto_514432 ) ) ( not ( = ?auto_514430 ?auto_514433 ) ) ( not ( = ?auto_514430 ?auto_514434 ) ) ( not ( = ?auto_514430 ?auto_514435 ) ) ( not ( = ?auto_514430 ?auto_514436 ) ) ( not ( = ?auto_514430 ?auto_514437 ) ) ( not ( = ?auto_514430 ?auto_514438 ) ) ( not ( = ?auto_514430 ?auto_514439 ) ) ( not ( = ?auto_514430 ?auto_514440 ) ) ( not ( = ?auto_514431 ?auto_514432 ) ) ( not ( = ?auto_514431 ?auto_514433 ) ) ( not ( = ?auto_514431 ?auto_514434 ) ) ( not ( = ?auto_514431 ?auto_514435 ) ) ( not ( = ?auto_514431 ?auto_514436 ) ) ( not ( = ?auto_514431 ?auto_514437 ) ) ( not ( = ?auto_514431 ?auto_514438 ) ) ( not ( = ?auto_514431 ?auto_514439 ) ) ( not ( = ?auto_514431 ?auto_514440 ) ) ( not ( = ?auto_514432 ?auto_514433 ) ) ( not ( = ?auto_514432 ?auto_514434 ) ) ( not ( = ?auto_514432 ?auto_514435 ) ) ( not ( = ?auto_514432 ?auto_514436 ) ) ( not ( = ?auto_514432 ?auto_514437 ) ) ( not ( = ?auto_514432 ?auto_514438 ) ) ( not ( = ?auto_514432 ?auto_514439 ) ) ( not ( = ?auto_514432 ?auto_514440 ) ) ( not ( = ?auto_514433 ?auto_514434 ) ) ( not ( = ?auto_514433 ?auto_514435 ) ) ( not ( = ?auto_514433 ?auto_514436 ) ) ( not ( = ?auto_514433 ?auto_514437 ) ) ( not ( = ?auto_514433 ?auto_514438 ) ) ( not ( = ?auto_514433 ?auto_514439 ) ) ( not ( = ?auto_514433 ?auto_514440 ) ) ( not ( = ?auto_514434 ?auto_514435 ) ) ( not ( = ?auto_514434 ?auto_514436 ) ) ( not ( = ?auto_514434 ?auto_514437 ) ) ( not ( = ?auto_514434 ?auto_514438 ) ) ( not ( = ?auto_514434 ?auto_514439 ) ) ( not ( = ?auto_514434 ?auto_514440 ) ) ( not ( = ?auto_514435 ?auto_514436 ) ) ( not ( = ?auto_514435 ?auto_514437 ) ) ( not ( = ?auto_514435 ?auto_514438 ) ) ( not ( = ?auto_514435 ?auto_514439 ) ) ( not ( = ?auto_514435 ?auto_514440 ) ) ( not ( = ?auto_514436 ?auto_514437 ) ) ( not ( = ?auto_514436 ?auto_514438 ) ) ( not ( = ?auto_514436 ?auto_514439 ) ) ( not ( = ?auto_514436 ?auto_514440 ) ) ( not ( = ?auto_514437 ?auto_514438 ) ) ( not ( = ?auto_514437 ?auto_514439 ) ) ( not ( = ?auto_514437 ?auto_514440 ) ) ( not ( = ?auto_514438 ?auto_514439 ) ) ( not ( = ?auto_514438 ?auto_514440 ) ) ( not ( = ?auto_514439 ?auto_514440 ) ) ( ON ?auto_514439 ?auto_514440 ) ( ON ?auto_514438 ?auto_514439 ) ( ON ?auto_514437 ?auto_514438 ) ( ON ?auto_514436 ?auto_514437 ) ( CLEAR ?auto_514434 ) ( ON ?auto_514435 ?auto_514436 ) ( CLEAR ?auto_514435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_514425 ?auto_514426 ?auto_514427 ?auto_514428 ?auto_514429 ?auto_514430 ?auto_514431 ?auto_514432 ?auto_514433 ?auto_514434 ?auto_514435 )
      ( MAKE-16PILE ?auto_514425 ?auto_514426 ?auto_514427 ?auto_514428 ?auto_514429 ?auto_514430 ?auto_514431 ?auto_514432 ?auto_514433 ?auto_514434 ?auto_514435 ?auto_514436 ?auto_514437 ?auto_514438 ?auto_514439 ?auto_514440 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514457 - BLOCK
      ?auto_514458 - BLOCK
      ?auto_514459 - BLOCK
      ?auto_514460 - BLOCK
      ?auto_514461 - BLOCK
      ?auto_514462 - BLOCK
      ?auto_514463 - BLOCK
      ?auto_514464 - BLOCK
      ?auto_514465 - BLOCK
      ?auto_514466 - BLOCK
      ?auto_514467 - BLOCK
      ?auto_514468 - BLOCK
      ?auto_514469 - BLOCK
      ?auto_514470 - BLOCK
      ?auto_514471 - BLOCK
      ?auto_514472 - BLOCK
    )
    :vars
    (
      ?auto_514473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514472 ?auto_514473 ) ( ON-TABLE ?auto_514457 ) ( ON ?auto_514458 ?auto_514457 ) ( ON ?auto_514459 ?auto_514458 ) ( ON ?auto_514460 ?auto_514459 ) ( ON ?auto_514461 ?auto_514460 ) ( ON ?auto_514462 ?auto_514461 ) ( ON ?auto_514463 ?auto_514462 ) ( ON ?auto_514464 ?auto_514463 ) ( ON ?auto_514465 ?auto_514464 ) ( not ( = ?auto_514457 ?auto_514458 ) ) ( not ( = ?auto_514457 ?auto_514459 ) ) ( not ( = ?auto_514457 ?auto_514460 ) ) ( not ( = ?auto_514457 ?auto_514461 ) ) ( not ( = ?auto_514457 ?auto_514462 ) ) ( not ( = ?auto_514457 ?auto_514463 ) ) ( not ( = ?auto_514457 ?auto_514464 ) ) ( not ( = ?auto_514457 ?auto_514465 ) ) ( not ( = ?auto_514457 ?auto_514466 ) ) ( not ( = ?auto_514457 ?auto_514467 ) ) ( not ( = ?auto_514457 ?auto_514468 ) ) ( not ( = ?auto_514457 ?auto_514469 ) ) ( not ( = ?auto_514457 ?auto_514470 ) ) ( not ( = ?auto_514457 ?auto_514471 ) ) ( not ( = ?auto_514457 ?auto_514472 ) ) ( not ( = ?auto_514457 ?auto_514473 ) ) ( not ( = ?auto_514458 ?auto_514459 ) ) ( not ( = ?auto_514458 ?auto_514460 ) ) ( not ( = ?auto_514458 ?auto_514461 ) ) ( not ( = ?auto_514458 ?auto_514462 ) ) ( not ( = ?auto_514458 ?auto_514463 ) ) ( not ( = ?auto_514458 ?auto_514464 ) ) ( not ( = ?auto_514458 ?auto_514465 ) ) ( not ( = ?auto_514458 ?auto_514466 ) ) ( not ( = ?auto_514458 ?auto_514467 ) ) ( not ( = ?auto_514458 ?auto_514468 ) ) ( not ( = ?auto_514458 ?auto_514469 ) ) ( not ( = ?auto_514458 ?auto_514470 ) ) ( not ( = ?auto_514458 ?auto_514471 ) ) ( not ( = ?auto_514458 ?auto_514472 ) ) ( not ( = ?auto_514458 ?auto_514473 ) ) ( not ( = ?auto_514459 ?auto_514460 ) ) ( not ( = ?auto_514459 ?auto_514461 ) ) ( not ( = ?auto_514459 ?auto_514462 ) ) ( not ( = ?auto_514459 ?auto_514463 ) ) ( not ( = ?auto_514459 ?auto_514464 ) ) ( not ( = ?auto_514459 ?auto_514465 ) ) ( not ( = ?auto_514459 ?auto_514466 ) ) ( not ( = ?auto_514459 ?auto_514467 ) ) ( not ( = ?auto_514459 ?auto_514468 ) ) ( not ( = ?auto_514459 ?auto_514469 ) ) ( not ( = ?auto_514459 ?auto_514470 ) ) ( not ( = ?auto_514459 ?auto_514471 ) ) ( not ( = ?auto_514459 ?auto_514472 ) ) ( not ( = ?auto_514459 ?auto_514473 ) ) ( not ( = ?auto_514460 ?auto_514461 ) ) ( not ( = ?auto_514460 ?auto_514462 ) ) ( not ( = ?auto_514460 ?auto_514463 ) ) ( not ( = ?auto_514460 ?auto_514464 ) ) ( not ( = ?auto_514460 ?auto_514465 ) ) ( not ( = ?auto_514460 ?auto_514466 ) ) ( not ( = ?auto_514460 ?auto_514467 ) ) ( not ( = ?auto_514460 ?auto_514468 ) ) ( not ( = ?auto_514460 ?auto_514469 ) ) ( not ( = ?auto_514460 ?auto_514470 ) ) ( not ( = ?auto_514460 ?auto_514471 ) ) ( not ( = ?auto_514460 ?auto_514472 ) ) ( not ( = ?auto_514460 ?auto_514473 ) ) ( not ( = ?auto_514461 ?auto_514462 ) ) ( not ( = ?auto_514461 ?auto_514463 ) ) ( not ( = ?auto_514461 ?auto_514464 ) ) ( not ( = ?auto_514461 ?auto_514465 ) ) ( not ( = ?auto_514461 ?auto_514466 ) ) ( not ( = ?auto_514461 ?auto_514467 ) ) ( not ( = ?auto_514461 ?auto_514468 ) ) ( not ( = ?auto_514461 ?auto_514469 ) ) ( not ( = ?auto_514461 ?auto_514470 ) ) ( not ( = ?auto_514461 ?auto_514471 ) ) ( not ( = ?auto_514461 ?auto_514472 ) ) ( not ( = ?auto_514461 ?auto_514473 ) ) ( not ( = ?auto_514462 ?auto_514463 ) ) ( not ( = ?auto_514462 ?auto_514464 ) ) ( not ( = ?auto_514462 ?auto_514465 ) ) ( not ( = ?auto_514462 ?auto_514466 ) ) ( not ( = ?auto_514462 ?auto_514467 ) ) ( not ( = ?auto_514462 ?auto_514468 ) ) ( not ( = ?auto_514462 ?auto_514469 ) ) ( not ( = ?auto_514462 ?auto_514470 ) ) ( not ( = ?auto_514462 ?auto_514471 ) ) ( not ( = ?auto_514462 ?auto_514472 ) ) ( not ( = ?auto_514462 ?auto_514473 ) ) ( not ( = ?auto_514463 ?auto_514464 ) ) ( not ( = ?auto_514463 ?auto_514465 ) ) ( not ( = ?auto_514463 ?auto_514466 ) ) ( not ( = ?auto_514463 ?auto_514467 ) ) ( not ( = ?auto_514463 ?auto_514468 ) ) ( not ( = ?auto_514463 ?auto_514469 ) ) ( not ( = ?auto_514463 ?auto_514470 ) ) ( not ( = ?auto_514463 ?auto_514471 ) ) ( not ( = ?auto_514463 ?auto_514472 ) ) ( not ( = ?auto_514463 ?auto_514473 ) ) ( not ( = ?auto_514464 ?auto_514465 ) ) ( not ( = ?auto_514464 ?auto_514466 ) ) ( not ( = ?auto_514464 ?auto_514467 ) ) ( not ( = ?auto_514464 ?auto_514468 ) ) ( not ( = ?auto_514464 ?auto_514469 ) ) ( not ( = ?auto_514464 ?auto_514470 ) ) ( not ( = ?auto_514464 ?auto_514471 ) ) ( not ( = ?auto_514464 ?auto_514472 ) ) ( not ( = ?auto_514464 ?auto_514473 ) ) ( not ( = ?auto_514465 ?auto_514466 ) ) ( not ( = ?auto_514465 ?auto_514467 ) ) ( not ( = ?auto_514465 ?auto_514468 ) ) ( not ( = ?auto_514465 ?auto_514469 ) ) ( not ( = ?auto_514465 ?auto_514470 ) ) ( not ( = ?auto_514465 ?auto_514471 ) ) ( not ( = ?auto_514465 ?auto_514472 ) ) ( not ( = ?auto_514465 ?auto_514473 ) ) ( not ( = ?auto_514466 ?auto_514467 ) ) ( not ( = ?auto_514466 ?auto_514468 ) ) ( not ( = ?auto_514466 ?auto_514469 ) ) ( not ( = ?auto_514466 ?auto_514470 ) ) ( not ( = ?auto_514466 ?auto_514471 ) ) ( not ( = ?auto_514466 ?auto_514472 ) ) ( not ( = ?auto_514466 ?auto_514473 ) ) ( not ( = ?auto_514467 ?auto_514468 ) ) ( not ( = ?auto_514467 ?auto_514469 ) ) ( not ( = ?auto_514467 ?auto_514470 ) ) ( not ( = ?auto_514467 ?auto_514471 ) ) ( not ( = ?auto_514467 ?auto_514472 ) ) ( not ( = ?auto_514467 ?auto_514473 ) ) ( not ( = ?auto_514468 ?auto_514469 ) ) ( not ( = ?auto_514468 ?auto_514470 ) ) ( not ( = ?auto_514468 ?auto_514471 ) ) ( not ( = ?auto_514468 ?auto_514472 ) ) ( not ( = ?auto_514468 ?auto_514473 ) ) ( not ( = ?auto_514469 ?auto_514470 ) ) ( not ( = ?auto_514469 ?auto_514471 ) ) ( not ( = ?auto_514469 ?auto_514472 ) ) ( not ( = ?auto_514469 ?auto_514473 ) ) ( not ( = ?auto_514470 ?auto_514471 ) ) ( not ( = ?auto_514470 ?auto_514472 ) ) ( not ( = ?auto_514470 ?auto_514473 ) ) ( not ( = ?auto_514471 ?auto_514472 ) ) ( not ( = ?auto_514471 ?auto_514473 ) ) ( not ( = ?auto_514472 ?auto_514473 ) ) ( ON ?auto_514471 ?auto_514472 ) ( ON ?auto_514470 ?auto_514471 ) ( ON ?auto_514469 ?auto_514470 ) ( ON ?auto_514468 ?auto_514469 ) ( ON ?auto_514467 ?auto_514468 ) ( CLEAR ?auto_514465 ) ( ON ?auto_514466 ?auto_514467 ) ( CLEAR ?auto_514466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_514457 ?auto_514458 ?auto_514459 ?auto_514460 ?auto_514461 ?auto_514462 ?auto_514463 ?auto_514464 ?auto_514465 ?auto_514466 )
      ( MAKE-16PILE ?auto_514457 ?auto_514458 ?auto_514459 ?auto_514460 ?auto_514461 ?auto_514462 ?auto_514463 ?auto_514464 ?auto_514465 ?auto_514466 ?auto_514467 ?auto_514468 ?auto_514469 ?auto_514470 ?auto_514471 ?auto_514472 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514490 - BLOCK
      ?auto_514491 - BLOCK
      ?auto_514492 - BLOCK
      ?auto_514493 - BLOCK
      ?auto_514494 - BLOCK
      ?auto_514495 - BLOCK
      ?auto_514496 - BLOCK
      ?auto_514497 - BLOCK
      ?auto_514498 - BLOCK
      ?auto_514499 - BLOCK
      ?auto_514500 - BLOCK
      ?auto_514501 - BLOCK
      ?auto_514502 - BLOCK
      ?auto_514503 - BLOCK
      ?auto_514504 - BLOCK
      ?auto_514505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514505 ) ( ON-TABLE ?auto_514490 ) ( ON ?auto_514491 ?auto_514490 ) ( ON ?auto_514492 ?auto_514491 ) ( ON ?auto_514493 ?auto_514492 ) ( ON ?auto_514494 ?auto_514493 ) ( ON ?auto_514495 ?auto_514494 ) ( ON ?auto_514496 ?auto_514495 ) ( ON ?auto_514497 ?auto_514496 ) ( ON ?auto_514498 ?auto_514497 ) ( not ( = ?auto_514490 ?auto_514491 ) ) ( not ( = ?auto_514490 ?auto_514492 ) ) ( not ( = ?auto_514490 ?auto_514493 ) ) ( not ( = ?auto_514490 ?auto_514494 ) ) ( not ( = ?auto_514490 ?auto_514495 ) ) ( not ( = ?auto_514490 ?auto_514496 ) ) ( not ( = ?auto_514490 ?auto_514497 ) ) ( not ( = ?auto_514490 ?auto_514498 ) ) ( not ( = ?auto_514490 ?auto_514499 ) ) ( not ( = ?auto_514490 ?auto_514500 ) ) ( not ( = ?auto_514490 ?auto_514501 ) ) ( not ( = ?auto_514490 ?auto_514502 ) ) ( not ( = ?auto_514490 ?auto_514503 ) ) ( not ( = ?auto_514490 ?auto_514504 ) ) ( not ( = ?auto_514490 ?auto_514505 ) ) ( not ( = ?auto_514491 ?auto_514492 ) ) ( not ( = ?auto_514491 ?auto_514493 ) ) ( not ( = ?auto_514491 ?auto_514494 ) ) ( not ( = ?auto_514491 ?auto_514495 ) ) ( not ( = ?auto_514491 ?auto_514496 ) ) ( not ( = ?auto_514491 ?auto_514497 ) ) ( not ( = ?auto_514491 ?auto_514498 ) ) ( not ( = ?auto_514491 ?auto_514499 ) ) ( not ( = ?auto_514491 ?auto_514500 ) ) ( not ( = ?auto_514491 ?auto_514501 ) ) ( not ( = ?auto_514491 ?auto_514502 ) ) ( not ( = ?auto_514491 ?auto_514503 ) ) ( not ( = ?auto_514491 ?auto_514504 ) ) ( not ( = ?auto_514491 ?auto_514505 ) ) ( not ( = ?auto_514492 ?auto_514493 ) ) ( not ( = ?auto_514492 ?auto_514494 ) ) ( not ( = ?auto_514492 ?auto_514495 ) ) ( not ( = ?auto_514492 ?auto_514496 ) ) ( not ( = ?auto_514492 ?auto_514497 ) ) ( not ( = ?auto_514492 ?auto_514498 ) ) ( not ( = ?auto_514492 ?auto_514499 ) ) ( not ( = ?auto_514492 ?auto_514500 ) ) ( not ( = ?auto_514492 ?auto_514501 ) ) ( not ( = ?auto_514492 ?auto_514502 ) ) ( not ( = ?auto_514492 ?auto_514503 ) ) ( not ( = ?auto_514492 ?auto_514504 ) ) ( not ( = ?auto_514492 ?auto_514505 ) ) ( not ( = ?auto_514493 ?auto_514494 ) ) ( not ( = ?auto_514493 ?auto_514495 ) ) ( not ( = ?auto_514493 ?auto_514496 ) ) ( not ( = ?auto_514493 ?auto_514497 ) ) ( not ( = ?auto_514493 ?auto_514498 ) ) ( not ( = ?auto_514493 ?auto_514499 ) ) ( not ( = ?auto_514493 ?auto_514500 ) ) ( not ( = ?auto_514493 ?auto_514501 ) ) ( not ( = ?auto_514493 ?auto_514502 ) ) ( not ( = ?auto_514493 ?auto_514503 ) ) ( not ( = ?auto_514493 ?auto_514504 ) ) ( not ( = ?auto_514493 ?auto_514505 ) ) ( not ( = ?auto_514494 ?auto_514495 ) ) ( not ( = ?auto_514494 ?auto_514496 ) ) ( not ( = ?auto_514494 ?auto_514497 ) ) ( not ( = ?auto_514494 ?auto_514498 ) ) ( not ( = ?auto_514494 ?auto_514499 ) ) ( not ( = ?auto_514494 ?auto_514500 ) ) ( not ( = ?auto_514494 ?auto_514501 ) ) ( not ( = ?auto_514494 ?auto_514502 ) ) ( not ( = ?auto_514494 ?auto_514503 ) ) ( not ( = ?auto_514494 ?auto_514504 ) ) ( not ( = ?auto_514494 ?auto_514505 ) ) ( not ( = ?auto_514495 ?auto_514496 ) ) ( not ( = ?auto_514495 ?auto_514497 ) ) ( not ( = ?auto_514495 ?auto_514498 ) ) ( not ( = ?auto_514495 ?auto_514499 ) ) ( not ( = ?auto_514495 ?auto_514500 ) ) ( not ( = ?auto_514495 ?auto_514501 ) ) ( not ( = ?auto_514495 ?auto_514502 ) ) ( not ( = ?auto_514495 ?auto_514503 ) ) ( not ( = ?auto_514495 ?auto_514504 ) ) ( not ( = ?auto_514495 ?auto_514505 ) ) ( not ( = ?auto_514496 ?auto_514497 ) ) ( not ( = ?auto_514496 ?auto_514498 ) ) ( not ( = ?auto_514496 ?auto_514499 ) ) ( not ( = ?auto_514496 ?auto_514500 ) ) ( not ( = ?auto_514496 ?auto_514501 ) ) ( not ( = ?auto_514496 ?auto_514502 ) ) ( not ( = ?auto_514496 ?auto_514503 ) ) ( not ( = ?auto_514496 ?auto_514504 ) ) ( not ( = ?auto_514496 ?auto_514505 ) ) ( not ( = ?auto_514497 ?auto_514498 ) ) ( not ( = ?auto_514497 ?auto_514499 ) ) ( not ( = ?auto_514497 ?auto_514500 ) ) ( not ( = ?auto_514497 ?auto_514501 ) ) ( not ( = ?auto_514497 ?auto_514502 ) ) ( not ( = ?auto_514497 ?auto_514503 ) ) ( not ( = ?auto_514497 ?auto_514504 ) ) ( not ( = ?auto_514497 ?auto_514505 ) ) ( not ( = ?auto_514498 ?auto_514499 ) ) ( not ( = ?auto_514498 ?auto_514500 ) ) ( not ( = ?auto_514498 ?auto_514501 ) ) ( not ( = ?auto_514498 ?auto_514502 ) ) ( not ( = ?auto_514498 ?auto_514503 ) ) ( not ( = ?auto_514498 ?auto_514504 ) ) ( not ( = ?auto_514498 ?auto_514505 ) ) ( not ( = ?auto_514499 ?auto_514500 ) ) ( not ( = ?auto_514499 ?auto_514501 ) ) ( not ( = ?auto_514499 ?auto_514502 ) ) ( not ( = ?auto_514499 ?auto_514503 ) ) ( not ( = ?auto_514499 ?auto_514504 ) ) ( not ( = ?auto_514499 ?auto_514505 ) ) ( not ( = ?auto_514500 ?auto_514501 ) ) ( not ( = ?auto_514500 ?auto_514502 ) ) ( not ( = ?auto_514500 ?auto_514503 ) ) ( not ( = ?auto_514500 ?auto_514504 ) ) ( not ( = ?auto_514500 ?auto_514505 ) ) ( not ( = ?auto_514501 ?auto_514502 ) ) ( not ( = ?auto_514501 ?auto_514503 ) ) ( not ( = ?auto_514501 ?auto_514504 ) ) ( not ( = ?auto_514501 ?auto_514505 ) ) ( not ( = ?auto_514502 ?auto_514503 ) ) ( not ( = ?auto_514502 ?auto_514504 ) ) ( not ( = ?auto_514502 ?auto_514505 ) ) ( not ( = ?auto_514503 ?auto_514504 ) ) ( not ( = ?auto_514503 ?auto_514505 ) ) ( not ( = ?auto_514504 ?auto_514505 ) ) ( ON ?auto_514504 ?auto_514505 ) ( ON ?auto_514503 ?auto_514504 ) ( ON ?auto_514502 ?auto_514503 ) ( ON ?auto_514501 ?auto_514502 ) ( ON ?auto_514500 ?auto_514501 ) ( CLEAR ?auto_514498 ) ( ON ?auto_514499 ?auto_514500 ) ( CLEAR ?auto_514499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_514490 ?auto_514491 ?auto_514492 ?auto_514493 ?auto_514494 ?auto_514495 ?auto_514496 ?auto_514497 ?auto_514498 ?auto_514499 )
      ( MAKE-16PILE ?auto_514490 ?auto_514491 ?auto_514492 ?auto_514493 ?auto_514494 ?auto_514495 ?auto_514496 ?auto_514497 ?auto_514498 ?auto_514499 ?auto_514500 ?auto_514501 ?auto_514502 ?auto_514503 ?auto_514504 ?auto_514505 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514522 - BLOCK
      ?auto_514523 - BLOCK
      ?auto_514524 - BLOCK
      ?auto_514525 - BLOCK
      ?auto_514526 - BLOCK
      ?auto_514527 - BLOCK
      ?auto_514528 - BLOCK
      ?auto_514529 - BLOCK
      ?auto_514530 - BLOCK
      ?auto_514531 - BLOCK
      ?auto_514532 - BLOCK
      ?auto_514533 - BLOCK
      ?auto_514534 - BLOCK
      ?auto_514535 - BLOCK
      ?auto_514536 - BLOCK
      ?auto_514537 - BLOCK
    )
    :vars
    (
      ?auto_514538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514537 ?auto_514538 ) ( ON-TABLE ?auto_514522 ) ( ON ?auto_514523 ?auto_514522 ) ( ON ?auto_514524 ?auto_514523 ) ( ON ?auto_514525 ?auto_514524 ) ( ON ?auto_514526 ?auto_514525 ) ( ON ?auto_514527 ?auto_514526 ) ( ON ?auto_514528 ?auto_514527 ) ( ON ?auto_514529 ?auto_514528 ) ( not ( = ?auto_514522 ?auto_514523 ) ) ( not ( = ?auto_514522 ?auto_514524 ) ) ( not ( = ?auto_514522 ?auto_514525 ) ) ( not ( = ?auto_514522 ?auto_514526 ) ) ( not ( = ?auto_514522 ?auto_514527 ) ) ( not ( = ?auto_514522 ?auto_514528 ) ) ( not ( = ?auto_514522 ?auto_514529 ) ) ( not ( = ?auto_514522 ?auto_514530 ) ) ( not ( = ?auto_514522 ?auto_514531 ) ) ( not ( = ?auto_514522 ?auto_514532 ) ) ( not ( = ?auto_514522 ?auto_514533 ) ) ( not ( = ?auto_514522 ?auto_514534 ) ) ( not ( = ?auto_514522 ?auto_514535 ) ) ( not ( = ?auto_514522 ?auto_514536 ) ) ( not ( = ?auto_514522 ?auto_514537 ) ) ( not ( = ?auto_514522 ?auto_514538 ) ) ( not ( = ?auto_514523 ?auto_514524 ) ) ( not ( = ?auto_514523 ?auto_514525 ) ) ( not ( = ?auto_514523 ?auto_514526 ) ) ( not ( = ?auto_514523 ?auto_514527 ) ) ( not ( = ?auto_514523 ?auto_514528 ) ) ( not ( = ?auto_514523 ?auto_514529 ) ) ( not ( = ?auto_514523 ?auto_514530 ) ) ( not ( = ?auto_514523 ?auto_514531 ) ) ( not ( = ?auto_514523 ?auto_514532 ) ) ( not ( = ?auto_514523 ?auto_514533 ) ) ( not ( = ?auto_514523 ?auto_514534 ) ) ( not ( = ?auto_514523 ?auto_514535 ) ) ( not ( = ?auto_514523 ?auto_514536 ) ) ( not ( = ?auto_514523 ?auto_514537 ) ) ( not ( = ?auto_514523 ?auto_514538 ) ) ( not ( = ?auto_514524 ?auto_514525 ) ) ( not ( = ?auto_514524 ?auto_514526 ) ) ( not ( = ?auto_514524 ?auto_514527 ) ) ( not ( = ?auto_514524 ?auto_514528 ) ) ( not ( = ?auto_514524 ?auto_514529 ) ) ( not ( = ?auto_514524 ?auto_514530 ) ) ( not ( = ?auto_514524 ?auto_514531 ) ) ( not ( = ?auto_514524 ?auto_514532 ) ) ( not ( = ?auto_514524 ?auto_514533 ) ) ( not ( = ?auto_514524 ?auto_514534 ) ) ( not ( = ?auto_514524 ?auto_514535 ) ) ( not ( = ?auto_514524 ?auto_514536 ) ) ( not ( = ?auto_514524 ?auto_514537 ) ) ( not ( = ?auto_514524 ?auto_514538 ) ) ( not ( = ?auto_514525 ?auto_514526 ) ) ( not ( = ?auto_514525 ?auto_514527 ) ) ( not ( = ?auto_514525 ?auto_514528 ) ) ( not ( = ?auto_514525 ?auto_514529 ) ) ( not ( = ?auto_514525 ?auto_514530 ) ) ( not ( = ?auto_514525 ?auto_514531 ) ) ( not ( = ?auto_514525 ?auto_514532 ) ) ( not ( = ?auto_514525 ?auto_514533 ) ) ( not ( = ?auto_514525 ?auto_514534 ) ) ( not ( = ?auto_514525 ?auto_514535 ) ) ( not ( = ?auto_514525 ?auto_514536 ) ) ( not ( = ?auto_514525 ?auto_514537 ) ) ( not ( = ?auto_514525 ?auto_514538 ) ) ( not ( = ?auto_514526 ?auto_514527 ) ) ( not ( = ?auto_514526 ?auto_514528 ) ) ( not ( = ?auto_514526 ?auto_514529 ) ) ( not ( = ?auto_514526 ?auto_514530 ) ) ( not ( = ?auto_514526 ?auto_514531 ) ) ( not ( = ?auto_514526 ?auto_514532 ) ) ( not ( = ?auto_514526 ?auto_514533 ) ) ( not ( = ?auto_514526 ?auto_514534 ) ) ( not ( = ?auto_514526 ?auto_514535 ) ) ( not ( = ?auto_514526 ?auto_514536 ) ) ( not ( = ?auto_514526 ?auto_514537 ) ) ( not ( = ?auto_514526 ?auto_514538 ) ) ( not ( = ?auto_514527 ?auto_514528 ) ) ( not ( = ?auto_514527 ?auto_514529 ) ) ( not ( = ?auto_514527 ?auto_514530 ) ) ( not ( = ?auto_514527 ?auto_514531 ) ) ( not ( = ?auto_514527 ?auto_514532 ) ) ( not ( = ?auto_514527 ?auto_514533 ) ) ( not ( = ?auto_514527 ?auto_514534 ) ) ( not ( = ?auto_514527 ?auto_514535 ) ) ( not ( = ?auto_514527 ?auto_514536 ) ) ( not ( = ?auto_514527 ?auto_514537 ) ) ( not ( = ?auto_514527 ?auto_514538 ) ) ( not ( = ?auto_514528 ?auto_514529 ) ) ( not ( = ?auto_514528 ?auto_514530 ) ) ( not ( = ?auto_514528 ?auto_514531 ) ) ( not ( = ?auto_514528 ?auto_514532 ) ) ( not ( = ?auto_514528 ?auto_514533 ) ) ( not ( = ?auto_514528 ?auto_514534 ) ) ( not ( = ?auto_514528 ?auto_514535 ) ) ( not ( = ?auto_514528 ?auto_514536 ) ) ( not ( = ?auto_514528 ?auto_514537 ) ) ( not ( = ?auto_514528 ?auto_514538 ) ) ( not ( = ?auto_514529 ?auto_514530 ) ) ( not ( = ?auto_514529 ?auto_514531 ) ) ( not ( = ?auto_514529 ?auto_514532 ) ) ( not ( = ?auto_514529 ?auto_514533 ) ) ( not ( = ?auto_514529 ?auto_514534 ) ) ( not ( = ?auto_514529 ?auto_514535 ) ) ( not ( = ?auto_514529 ?auto_514536 ) ) ( not ( = ?auto_514529 ?auto_514537 ) ) ( not ( = ?auto_514529 ?auto_514538 ) ) ( not ( = ?auto_514530 ?auto_514531 ) ) ( not ( = ?auto_514530 ?auto_514532 ) ) ( not ( = ?auto_514530 ?auto_514533 ) ) ( not ( = ?auto_514530 ?auto_514534 ) ) ( not ( = ?auto_514530 ?auto_514535 ) ) ( not ( = ?auto_514530 ?auto_514536 ) ) ( not ( = ?auto_514530 ?auto_514537 ) ) ( not ( = ?auto_514530 ?auto_514538 ) ) ( not ( = ?auto_514531 ?auto_514532 ) ) ( not ( = ?auto_514531 ?auto_514533 ) ) ( not ( = ?auto_514531 ?auto_514534 ) ) ( not ( = ?auto_514531 ?auto_514535 ) ) ( not ( = ?auto_514531 ?auto_514536 ) ) ( not ( = ?auto_514531 ?auto_514537 ) ) ( not ( = ?auto_514531 ?auto_514538 ) ) ( not ( = ?auto_514532 ?auto_514533 ) ) ( not ( = ?auto_514532 ?auto_514534 ) ) ( not ( = ?auto_514532 ?auto_514535 ) ) ( not ( = ?auto_514532 ?auto_514536 ) ) ( not ( = ?auto_514532 ?auto_514537 ) ) ( not ( = ?auto_514532 ?auto_514538 ) ) ( not ( = ?auto_514533 ?auto_514534 ) ) ( not ( = ?auto_514533 ?auto_514535 ) ) ( not ( = ?auto_514533 ?auto_514536 ) ) ( not ( = ?auto_514533 ?auto_514537 ) ) ( not ( = ?auto_514533 ?auto_514538 ) ) ( not ( = ?auto_514534 ?auto_514535 ) ) ( not ( = ?auto_514534 ?auto_514536 ) ) ( not ( = ?auto_514534 ?auto_514537 ) ) ( not ( = ?auto_514534 ?auto_514538 ) ) ( not ( = ?auto_514535 ?auto_514536 ) ) ( not ( = ?auto_514535 ?auto_514537 ) ) ( not ( = ?auto_514535 ?auto_514538 ) ) ( not ( = ?auto_514536 ?auto_514537 ) ) ( not ( = ?auto_514536 ?auto_514538 ) ) ( not ( = ?auto_514537 ?auto_514538 ) ) ( ON ?auto_514536 ?auto_514537 ) ( ON ?auto_514535 ?auto_514536 ) ( ON ?auto_514534 ?auto_514535 ) ( ON ?auto_514533 ?auto_514534 ) ( ON ?auto_514532 ?auto_514533 ) ( ON ?auto_514531 ?auto_514532 ) ( CLEAR ?auto_514529 ) ( ON ?auto_514530 ?auto_514531 ) ( CLEAR ?auto_514530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_514522 ?auto_514523 ?auto_514524 ?auto_514525 ?auto_514526 ?auto_514527 ?auto_514528 ?auto_514529 ?auto_514530 )
      ( MAKE-16PILE ?auto_514522 ?auto_514523 ?auto_514524 ?auto_514525 ?auto_514526 ?auto_514527 ?auto_514528 ?auto_514529 ?auto_514530 ?auto_514531 ?auto_514532 ?auto_514533 ?auto_514534 ?auto_514535 ?auto_514536 ?auto_514537 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514555 - BLOCK
      ?auto_514556 - BLOCK
      ?auto_514557 - BLOCK
      ?auto_514558 - BLOCK
      ?auto_514559 - BLOCK
      ?auto_514560 - BLOCK
      ?auto_514561 - BLOCK
      ?auto_514562 - BLOCK
      ?auto_514563 - BLOCK
      ?auto_514564 - BLOCK
      ?auto_514565 - BLOCK
      ?auto_514566 - BLOCK
      ?auto_514567 - BLOCK
      ?auto_514568 - BLOCK
      ?auto_514569 - BLOCK
      ?auto_514570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514570 ) ( ON-TABLE ?auto_514555 ) ( ON ?auto_514556 ?auto_514555 ) ( ON ?auto_514557 ?auto_514556 ) ( ON ?auto_514558 ?auto_514557 ) ( ON ?auto_514559 ?auto_514558 ) ( ON ?auto_514560 ?auto_514559 ) ( ON ?auto_514561 ?auto_514560 ) ( ON ?auto_514562 ?auto_514561 ) ( not ( = ?auto_514555 ?auto_514556 ) ) ( not ( = ?auto_514555 ?auto_514557 ) ) ( not ( = ?auto_514555 ?auto_514558 ) ) ( not ( = ?auto_514555 ?auto_514559 ) ) ( not ( = ?auto_514555 ?auto_514560 ) ) ( not ( = ?auto_514555 ?auto_514561 ) ) ( not ( = ?auto_514555 ?auto_514562 ) ) ( not ( = ?auto_514555 ?auto_514563 ) ) ( not ( = ?auto_514555 ?auto_514564 ) ) ( not ( = ?auto_514555 ?auto_514565 ) ) ( not ( = ?auto_514555 ?auto_514566 ) ) ( not ( = ?auto_514555 ?auto_514567 ) ) ( not ( = ?auto_514555 ?auto_514568 ) ) ( not ( = ?auto_514555 ?auto_514569 ) ) ( not ( = ?auto_514555 ?auto_514570 ) ) ( not ( = ?auto_514556 ?auto_514557 ) ) ( not ( = ?auto_514556 ?auto_514558 ) ) ( not ( = ?auto_514556 ?auto_514559 ) ) ( not ( = ?auto_514556 ?auto_514560 ) ) ( not ( = ?auto_514556 ?auto_514561 ) ) ( not ( = ?auto_514556 ?auto_514562 ) ) ( not ( = ?auto_514556 ?auto_514563 ) ) ( not ( = ?auto_514556 ?auto_514564 ) ) ( not ( = ?auto_514556 ?auto_514565 ) ) ( not ( = ?auto_514556 ?auto_514566 ) ) ( not ( = ?auto_514556 ?auto_514567 ) ) ( not ( = ?auto_514556 ?auto_514568 ) ) ( not ( = ?auto_514556 ?auto_514569 ) ) ( not ( = ?auto_514556 ?auto_514570 ) ) ( not ( = ?auto_514557 ?auto_514558 ) ) ( not ( = ?auto_514557 ?auto_514559 ) ) ( not ( = ?auto_514557 ?auto_514560 ) ) ( not ( = ?auto_514557 ?auto_514561 ) ) ( not ( = ?auto_514557 ?auto_514562 ) ) ( not ( = ?auto_514557 ?auto_514563 ) ) ( not ( = ?auto_514557 ?auto_514564 ) ) ( not ( = ?auto_514557 ?auto_514565 ) ) ( not ( = ?auto_514557 ?auto_514566 ) ) ( not ( = ?auto_514557 ?auto_514567 ) ) ( not ( = ?auto_514557 ?auto_514568 ) ) ( not ( = ?auto_514557 ?auto_514569 ) ) ( not ( = ?auto_514557 ?auto_514570 ) ) ( not ( = ?auto_514558 ?auto_514559 ) ) ( not ( = ?auto_514558 ?auto_514560 ) ) ( not ( = ?auto_514558 ?auto_514561 ) ) ( not ( = ?auto_514558 ?auto_514562 ) ) ( not ( = ?auto_514558 ?auto_514563 ) ) ( not ( = ?auto_514558 ?auto_514564 ) ) ( not ( = ?auto_514558 ?auto_514565 ) ) ( not ( = ?auto_514558 ?auto_514566 ) ) ( not ( = ?auto_514558 ?auto_514567 ) ) ( not ( = ?auto_514558 ?auto_514568 ) ) ( not ( = ?auto_514558 ?auto_514569 ) ) ( not ( = ?auto_514558 ?auto_514570 ) ) ( not ( = ?auto_514559 ?auto_514560 ) ) ( not ( = ?auto_514559 ?auto_514561 ) ) ( not ( = ?auto_514559 ?auto_514562 ) ) ( not ( = ?auto_514559 ?auto_514563 ) ) ( not ( = ?auto_514559 ?auto_514564 ) ) ( not ( = ?auto_514559 ?auto_514565 ) ) ( not ( = ?auto_514559 ?auto_514566 ) ) ( not ( = ?auto_514559 ?auto_514567 ) ) ( not ( = ?auto_514559 ?auto_514568 ) ) ( not ( = ?auto_514559 ?auto_514569 ) ) ( not ( = ?auto_514559 ?auto_514570 ) ) ( not ( = ?auto_514560 ?auto_514561 ) ) ( not ( = ?auto_514560 ?auto_514562 ) ) ( not ( = ?auto_514560 ?auto_514563 ) ) ( not ( = ?auto_514560 ?auto_514564 ) ) ( not ( = ?auto_514560 ?auto_514565 ) ) ( not ( = ?auto_514560 ?auto_514566 ) ) ( not ( = ?auto_514560 ?auto_514567 ) ) ( not ( = ?auto_514560 ?auto_514568 ) ) ( not ( = ?auto_514560 ?auto_514569 ) ) ( not ( = ?auto_514560 ?auto_514570 ) ) ( not ( = ?auto_514561 ?auto_514562 ) ) ( not ( = ?auto_514561 ?auto_514563 ) ) ( not ( = ?auto_514561 ?auto_514564 ) ) ( not ( = ?auto_514561 ?auto_514565 ) ) ( not ( = ?auto_514561 ?auto_514566 ) ) ( not ( = ?auto_514561 ?auto_514567 ) ) ( not ( = ?auto_514561 ?auto_514568 ) ) ( not ( = ?auto_514561 ?auto_514569 ) ) ( not ( = ?auto_514561 ?auto_514570 ) ) ( not ( = ?auto_514562 ?auto_514563 ) ) ( not ( = ?auto_514562 ?auto_514564 ) ) ( not ( = ?auto_514562 ?auto_514565 ) ) ( not ( = ?auto_514562 ?auto_514566 ) ) ( not ( = ?auto_514562 ?auto_514567 ) ) ( not ( = ?auto_514562 ?auto_514568 ) ) ( not ( = ?auto_514562 ?auto_514569 ) ) ( not ( = ?auto_514562 ?auto_514570 ) ) ( not ( = ?auto_514563 ?auto_514564 ) ) ( not ( = ?auto_514563 ?auto_514565 ) ) ( not ( = ?auto_514563 ?auto_514566 ) ) ( not ( = ?auto_514563 ?auto_514567 ) ) ( not ( = ?auto_514563 ?auto_514568 ) ) ( not ( = ?auto_514563 ?auto_514569 ) ) ( not ( = ?auto_514563 ?auto_514570 ) ) ( not ( = ?auto_514564 ?auto_514565 ) ) ( not ( = ?auto_514564 ?auto_514566 ) ) ( not ( = ?auto_514564 ?auto_514567 ) ) ( not ( = ?auto_514564 ?auto_514568 ) ) ( not ( = ?auto_514564 ?auto_514569 ) ) ( not ( = ?auto_514564 ?auto_514570 ) ) ( not ( = ?auto_514565 ?auto_514566 ) ) ( not ( = ?auto_514565 ?auto_514567 ) ) ( not ( = ?auto_514565 ?auto_514568 ) ) ( not ( = ?auto_514565 ?auto_514569 ) ) ( not ( = ?auto_514565 ?auto_514570 ) ) ( not ( = ?auto_514566 ?auto_514567 ) ) ( not ( = ?auto_514566 ?auto_514568 ) ) ( not ( = ?auto_514566 ?auto_514569 ) ) ( not ( = ?auto_514566 ?auto_514570 ) ) ( not ( = ?auto_514567 ?auto_514568 ) ) ( not ( = ?auto_514567 ?auto_514569 ) ) ( not ( = ?auto_514567 ?auto_514570 ) ) ( not ( = ?auto_514568 ?auto_514569 ) ) ( not ( = ?auto_514568 ?auto_514570 ) ) ( not ( = ?auto_514569 ?auto_514570 ) ) ( ON ?auto_514569 ?auto_514570 ) ( ON ?auto_514568 ?auto_514569 ) ( ON ?auto_514567 ?auto_514568 ) ( ON ?auto_514566 ?auto_514567 ) ( ON ?auto_514565 ?auto_514566 ) ( ON ?auto_514564 ?auto_514565 ) ( CLEAR ?auto_514562 ) ( ON ?auto_514563 ?auto_514564 ) ( CLEAR ?auto_514563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_514555 ?auto_514556 ?auto_514557 ?auto_514558 ?auto_514559 ?auto_514560 ?auto_514561 ?auto_514562 ?auto_514563 )
      ( MAKE-16PILE ?auto_514555 ?auto_514556 ?auto_514557 ?auto_514558 ?auto_514559 ?auto_514560 ?auto_514561 ?auto_514562 ?auto_514563 ?auto_514564 ?auto_514565 ?auto_514566 ?auto_514567 ?auto_514568 ?auto_514569 ?auto_514570 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514587 - BLOCK
      ?auto_514588 - BLOCK
      ?auto_514589 - BLOCK
      ?auto_514590 - BLOCK
      ?auto_514591 - BLOCK
      ?auto_514592 - BLOCK
      ?auto_514593 - BLOCK
      ?auto_514594 - BLOCK
      ?auto_514595 - BLOCK
      ?auto_514596 - BLOCK
      ?auto_514597 - BLOCK
      ?auto_514598 - BLOCK
      ?auto_514599 - BLOCK
      ?auto_514600 - BLOCK
      ?auto_514601 - BLOCK
      ?auto_514602 - BLOCK
    )
    :vars
    (
      ?auto_514603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514602 ?auto_514603 ) ( ON-TABLE ?auto_514587 ) ( ON ?auto_514588 ?auto_514587 ) ( ON ?auto_514589 ?auto_514588 ) ( ON ?auto_514590 ?auto_514589 ) ( ON ?auto_514591 ?auto_514590 ) ( ON ?auto_514592 ?auto_514591 ) ( ON ?auto_514593 ?auto_514592 ) ( not ( = ?auto_514587 ?auto_514588 ) ) ( not ( = ?auto_514587 ?auto_514589 ) ) ( not ( = ?auto_514587 ?auto_514590 ) ) ( not ( = ?auto_514587 ?auto_514591 ) ) ( not ( = ?auto_514587 ?auto_514592 ) ) ( not ( = ?auto_514587 ?auto_514593 ) ) ( not ( = ?auto_514587 ?auto_514594 ) ) ( not ( = ?auto_514587 ?auto_514595 ) ) ( not ( = ?auto_514587 ?auto_514596 ) ) ( not ( = ?auto_514587 ?auto_514597 ) ) ( not ( = ?auto_514587 ?auto_514598 ) ) ( not ( = ?auto_514587 ?auto_514599 ) ) ( not ( = ?auto_514587 ?auto_514600 ) ) ( not ( = ?auto_514587 ?auto_514601 ) ) ( not ( = ?auto_514587 ?auto_514602 ) ) ( not ( = ?auto_514587 ?auto_514603 ) ) ( not ( = ?auto_514588 ?auto_514589 ) ) ( not ( = ?auto_514588 ?auto_514590 ) ) ( not ( = ?auto_514588 ?auto_514591 ) ) ( not ( = ?auto_514588 ?auto_514592 ) ) ( not ( = ?auto_514588 ?auto_514593 ) ) ( not ( = ?auto_514588 ?auto_514594 ) ) ( not ( = ?auto_514588 ?auto_514595 ) ) ( not ( = ?auto_514588 ?auto_514596 ) ) ( not ( = ?auto_514588 ?auto_514597 ) ) ( not ( = ?auto_514588 ?auto_514598 ) ) ( not ( = ?auto_514588 ?auto_514599 ) ) ( not ( = ?auto_514588 ?auto_514600 ) ) ( not ( = ?auto_514588 ?auto_514601 ) ) ( not ( = ?auto_514588 ?auto_514602 ) ) ( not ( = ?auto_514588 ?auto_514603 ) ) ( not ( = ?auto_514589 ?auto_514590 ) ) ( not ( = ?auto_514589 ?auto_514591 ) ) ( not ( = ?auto_514589 ?auto_514592 ) ) ( not ( = ?auto_514589 ?auto_514593 ) ) ( not ( = ?auto_514589 ?auto_514594 ) ) ( not ( = ?auto_514589 ?auto_514595 ) ) ( not ( = ?auto_514589 ?auto_514596 ) ) ( not ( = ?auto_514589 ?auto_514597 ) ) ( not ( = ?auto_514589 ?auto_514598 ) ) ( not ( = ?auto_514589 ?auto_514599 ) ) ( not ( = ?auto_514589 ?auto_514600 ) ) ( not ( = ?auto_514589 ?auto_514601 ) ) ( not ( = ?auto_514589 ?auto_514602 ) ) ( not ( = ?auto_514589 ?auto_514603 ) ) ( not ( = ?auto_514590 ?auto_514591 ) ) ( not ( = ?auto_514590 ?auto_514592 ) ) ( not ( = ?auto_514590 ?auto_514593 ) ) ( not ( = ?auto_514590 ?auto_514594 ) ) ( not ( = ?auto_514590 ?auto_514595 ) ) ( not ( = ?auto_514590 ?auto_514596 ) ) ( not ( = ?auto_514590 ?auto_514597 ) ) ( not ( = ?auto_514590 ?auto_514598 ) ) ( not ( = ?auto_514590 ?auto_514599 ) ) ( not ( = ?auto_514590 ?auto_514600 ) ) ( not ( = ?auto_514590 ?auto_514601 ) ) ( not ( = ?auto_514590 ?auto_514602 ) ) ( not ( = ?auto_514590 ?auto_514603 ) ) ( not ( = ?auto_514591 ?auto_514592 ) ) ( not ( = ?auto_514591 ?auto_514593 ) ) ( not ( = ?auto_514591 ?auto_514594 ) ) ( not ( = ?auto_514591 ?auto_514595 ) ) ( not ( = ?auto_514591 ?auto_514596 ) ) ( not ( = ?auto_514591 ?auto_514597 ) ) ( not ( = ?auto_514591 ?auto_514598 ) ) ( not ( = ?auto_514591 ?auto_514599 ) ) ( not ( = ?auto_514591 ?auto_514600 ) ) ( not ( = ?auto_514591 ?auto_514601 ) ) ( not ( = ?auto_514591 ?auto_514602 ) ) ( not ( = ?auto_514591 ?auto_514603 ) ) ( not ( = ?auto_514592 ?auto_514593 ) ) ( not ( = ?auto_514592 ?auto_514594 ) ) ( not ( = ?auto_514592 ?auto_514595 ) ) ( not ( = ?auto_514592 ?auto_514596 ) ) ( not ( = ?auto_514592 ?auto_514597 ) ) ( not ( = ?auto_514592 ?auto_514598 ) ) ( not ( = ?auto_514592 ?auto_514599 ) ) ( not ( = ?auto_514592 ?auto_514600 ) ) ( not ( = ?auto_514592 ?auto_514601 ) ) ( not ( = ?auto_514592 ?auto_514602 ) ) ( not ( = ?auto_514592 ?auto_514603 ) ) ( not ( = ?auto_514593 ?auto_514594 ) ) ( not ( = ?auto_514593 ?auto_514595 ) ) ( not ( = ?auto_514593 ?auto_514596 ) ) ( not ( = ?auto_514593 ?auto_514597 ) ) ( not ( = ?auto_514593 ?auto_514598 ) ) ( not ( = ?auto_514593 ?auto_514599 ) ) ( not ( = ?auto_514593 ?auto_514600 ) ) ( not ( = ?auto_514593 ?auto_514601 ) ) ( not ( = ?auto_514593 ?auto_514602 ) ) ( not ( = ?auto_514593 ?auto_514603 ) ) ( not ( = ?auto_514594 ?auto_514595 ) ) ( not ( = ?auto_514594 ?auto_514596 ) ) ( not ( = ?auto_514594 ?auto_514597 ) ) ( not ( = ?auto_514594 ?auto_514598 ) ) ( not ( = ?auto_514594 ?auto_514599 ) ) ( not ( = ?auto_514594 ?auto_514600 ) ) ( not ( = ?auto_514594 ?auto_514601 ) ) ( not ( = ?auto_514594 ?auto_514602 ) ) ( not ( = ?auto_514594 ?auto_514603 ) ) ( not ( = ?auto_514595 ?auto_514596 ) ) ( not ( = ?auto_514595 ?auto_514597 ) ) ( not ( = ?auto_514595 ?auto_514598 ) ) ( not ( = ?auto_514595 ?auto_514599 ) ) ( not ( = ?auto_514595 ?auto_514600 ) ) ( not ( = ?auto_514595 ?auto_514601 ) ) ( not ( = ?auto_514595 ?auto_514602 ) ) ( not ( = ?auto_514595 ?auto_514603 ) ) ( not ( = ?auto_514596 ?auto_514597 ) ) ( not ( = ?auto_514596 ?auto_514598 ) ) ( not ( = ?auto_514596 ?auto_514599 ) ) ( not ( = ?auto_514596 ?auto_514600 ) ) ( not ( = ?auto_514596 ?auto_514601 ) ) ( not ( = ?auto_514596 ?auto_514602 ) ) ( not ( = ?auto_514596 ?auto_514603 ) ) ( not ( = ?auto_514597 ?auto_514598 ) ) ( not ( = ?auto_514597 ?auto_514599 ) ) ( not ( = ?auto_514597 ?auto_514600 ) ) ( not ( = ?auto_514597 ?auto_514601 ) ) ( not ( = ?auto_514597 ?auto_514602 ) ) ( not ( = ?auto_514597 ?auto_514603 ) ) ( not ( = ?auto_514598 ?auto_514599 ) ) ( not ( = ?auto_514598 ?auto_514600 ) ) ( not ( = ?auto_514598 ?auto_514601 ) ) ( not ( = ?auto_514598 ?auto_514602 ) ) ( not ( = ?auto_514598 ?auto_514603 ) ) ( not ( = ?auto_514599 ?auto_514600 ) ) ( not ( = ?auto_514599 ?auto_514601 ) ) ( not ( = ?auto_514599 ?auto_514602 ) ) ( not ( = ?auto_514599 ?auto_514603 ) ) ( not ( = ?auto_514600 ?auto_514601 ) ) ( not ( = ?auto_514600 ?auto_514602 ) ) ( not ( = ?auto_514600 ?auto_514603 ) ) ( not ( = ?auto_514601 ?auto_514602 ) ) ( not ( = ?auto_514601 ?auto_514603 ) ) ( not ( = ?auto_514602 ?auto_514603 ) ) ( ON ?auto_514601 ?auto_514602 ) ( ON ?auto_514600 ?auto_514601 ) ( ON ?auto_514599 ?auto_514600 ) ( ON ?auto_514598 ?auto_514599 ) ( ON ?auto_514597 ?auto_514598 ) ( ON ?auto_514596 ?auto_514597 ) ( ON ?auto_514595 ?auto_514596 ) ( CLEAR ?auto_514593 ) ( ON ?auto_514594 ?auto_514595 ) ( CLEAR ?auto_514594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_514587 ?auto_514588 ?auto_514589 ?auto_514590 ?auto_514591 ?auto_514592 ?auto_514593 ?auto_514594 )
      ( MAKE-16PILE ?auto_514587 ?auto_514588 ?auto_514589 ?auto_514590 ?auto_514591 ?auto_514592 ?auto_514593 ?auto_514594 ?auto_514595 ?auto_514596 ?auto_514597 ?auto_514598 ?auto_514599 ?auto_514600 ?auto_514601 ?auto_514602 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514620 - BLOCK
      ?auto_514621 - BLOCK
      ?auto_514622 - BLOCK
      ?auto_514623 - BLOCK
      ?auto_514624 - BLOCK
      ?auto_514625 - BLOCK
      ?auto_514626 - BLOCK
      ?auto_514627 - BLOCK
      ?auto_514628 - BLOCK
      ?auto_514629 - BLOCK
      ?auto_514630 - BLOCK
      ?auto_514631 - BLOCK
      ?auto_514632 - BLOCK
      ?auto_514633 - BLOCK
      ?auto_514634 - BLOCK
      ?auto_514635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514635 ) ( ON-TABLE ?auto_514620 ) ( ON ?auto_514621 ?auto_514620 ) ( ON ?auto_514622 ?auto_514621 ) ( ON ?auto_514623 ?auto_514622 ) ( ON ?auto_514624 ?auto_514623 ) ( ON ?auto_514625 ?auto_514624 ) ( ON ?auto_514626 ?auto_514625 ) ( not ( = ?auto_514620 ?auto_514621 ) ) ( not ( = ?auto_514620 ?auto_514622 ) ) ( not ( = ?auto_514620 ?auto_514623 ) ) ( not ( = ?auto_514620 ?auto_514624 ) ) ( not ( = ?auto_514620 ?auto_514625 ) ) ( not ( = ?auto_514620 ?auto_514626 ) ) ( not ( = ?auto_514620 ?auto_514627 ) ) ( not ( = ?auto_514620 ?auto_514628 ) ) ( not ( = ?auto_514620 ?auto_514629 ) ) ( not ( = ?auto_514620 ?auto_514630 ) ) ( not ( = ?auto_514620 ?auto_514631 ) ) ( not ( = ?auto_514620 ?auto_514632 ) ) ( not ( = ?auto_514620 ?auto_514633 ) ) ( not ( = ?auto_514620 ?auto_514634 ) ) ( not ( = ?auto_514620 ?auto_514635 ) ) ( not ( = ?auto_514621 ?auto_514622 ) ) ( not ( = ?auto_514621 ?auto_514623 ) ) ( not ( = ?auto_514621 ?auto_514624 ) ) ( not ( = ?auto_514621 ?auto_514625 ) ) ( not ( = ?auto_514621 ?auto_514626 ) ) ( not ( = ?auto_514621 ?auto_514627 ) ) ( not ( = ?auto_514621 ?auto_514628 ) ) ( not ( = ?auto_514621 ?auto_514629 ) ) ( not ( = ?auto_514621 ?auto_514630 ) ) ( not ( = ?auto_514621 ?auto_514631 ) ) ( not ( = ?auto_514621 ?auto_514632 ) ) ( not ( = ?auto_514621 ?auto_514633 ) ) ( not ( = ?auto_514621 ?auto_514634 ) ) ( not ( = ?auto_514621 ?auto_514635 ) ) ( not ( = ?auto_514622 ?auto_514623 ) ) ( not ( = ?auto_514622 ?auto_514624 ) ) ( not ( = ?auto_514622 ?auto_514625 ) ) ( not ( = ?auto_514622 ?auto_514626 ) ) ( not ( = ?auto_514622 ?auto_514627 ) ) ( not ( = ?auto_514622 ?auto_514628 ) ) ( not ( = ?auto_514622 ?auto_514629 ) ) ( not ( = ?auto_514622 ?auto_514630 ) ) ( not ( = ?auto_514622 ?auto_514631 ) ) ( not ( = ?auto_514622 ?auto_514632 ) ) ( not ( = ?auto_514622 ?auto_514633 ) ) ( not ( = ?auto_514622 ?auto_514634 ) ) ( not ( = ?auto_514622 ?auto_514635 ) ) ( not ( = ?auto_514623 ?auto_514624 ) ) ( not ( = ?auto_514623 ?auto_514625 ) ) ( not ( = ?auto_514623 ?auto_514626 ) ) ( not ( = ?auto_514623 ?auto_514627 ) ) ( not ( = ?auto_514623 ?auto_514628 ) ) ( not ( = ?auto_514623 ?auto_514629 ) ) ( not ( = ?auto_514623 ?auto_514630 ) ) ( not ( = ?auto_514623 ?auto_514631 ) ) ( not ( = ?auto_514623 ?auto_514632 ) ) ( not ( = ?auto_514623 ?auto_514633 ) ) ( not ( = ?auto_514623 ?auto_514634 ) ) ( not ( = ?auto_514623 ?auto_514635 ) ) ( not ( = ?auto_514624 ?auto_514625 ) ) ( not ( = ?auto_514624 ?auto_514626 ) ) ( not ( = ?auto_514624 ?auto_514627 ) ) ( not ( = ?auto_514624 ?auto_514628 ) ) ( not ( = ?auto_514624 ?auto_514629 ) ) ( not ( = ?auto_514624 ?auto_514630 ) ) ( not ( = ?auto_514624 ?auto_514631 ) ) ( not ( = ?auto_514624 ?auto_514632 ) ) ( not ( = ?auto_514624 ?auto_514633 ) ) ( not ( = ?auto_514624 ?auto_514634 ) ) ( not ( = ?auto_514624 ?auto_514635 ) ) ( not ( = ?auto_514625 ?auto_514626 ) ) ( not ( = ?auto_514625 ?auto_514627 ) ) ( not ( = ?auto_514625 ?auto_514628 ) ) ( not ( = ?auto_514625 ?auto_514629 ) ) ( not ( = ?auto_514625 ?auto_514630 ) ) ( not ( = ?auto_514625 ?auto_514631 ) ) ( not ( = ?auto_514625 ?auto_514632 ) ) ( not ( = ?auto_514625 ?auto_514633 ) ) ( not ( = ?auto_514625 ?auto_514634 ) ) ( not ( = ?auto_514625 ?auto_514635 ) ) ( not ( = ?auto_514626 ?auto_514627 ) ) ( not ( = ?auto_514626 ?auto_514628 ) ) ( not ( = ?auto_514626 ?auto_514629 ) ) ( not ( = ?auto_514626 ?auto_514630 ) ) ( not ( = ?auto_514626 ?auto_514631 ) ) ( not ( = ?auto_514626 ?auto_514632 ) ) ( not ( = ?auto_514626 ?auto_514633 ) ) ( not ( = ?auto_514626 ?auto_514634 ) ) ( not ( = ?auto_514626 ?auto_514635 ) ) ( not ( = ?auto_514627 ?auto_514628 ) ) ( not ( = ?auto_514627 ?auto_514629 ) ) ( not ( = ?auto_514627 ?auto_514630 ) ) ( not ( = ?auto_514627 ?auto_514631 ) ) ( not ( = ?auto_514627 ?auto_514632 ) ) ( not ( = ?auto_514627 ?auto_514633 ) ) ( not ( = ?auto_514627 ?auto_514634 ) ) ( not ( = ?auto_514627 ?auto_514635 ) ) ( not ( = ?auto_514628 ?auto_514629 ) ) ( not ( = ?auto_514628 ?auto_514630 ) ) ( not ( = ?auto_514628 ?auto_514631 ) ) ( not ( = ?auto_514628 ?auto_514632 ) ) ( not ( = ?auto_514628 ?auto_514633 ) ) ( not ( = ?auto_514628 ?auto_514634 ) ) ( not ( = ?auto_514628 ?auto_514635 ) ) ( not ( = ?auto_514629 ?auto_514630 ) ) ( not ( = ?auto_514629 ?auto_514631 ) ) ( not ( = ?auto_514629 ?auto_514632 ) ) ( not ( = ?auto_514629 ?auto_514633 ) ) ( not ( = ?auto_514629 ?auto_514634 ) ) ( not ( = ?auto_514629 ?auto_514635 ) ) ( not ( = ?auto_514630 ?auto_514631 ) ) ( not ( = ?auto_514630 ?auto_514632 ) ) ( not ( = ?auto_514630 ?auto_514633 ) ) ( not ( = ?auto_514630 ?auto_514634 ) ) ( not ( = ?auto_514630 ?auto_514635 ) ) ( not ( = ?auto_514631 ?auto_514632 ) ) ( not ( = ?auto_514631 ?auto_514633 ) ) ( not ( = ?auto_514631 ?auto_514634 ) ) ( not ( = ?auto_514631 ?auto_514635 ) ) ( not ( = ?auto_514632 ?auto_514633 ) ) ( not ( = ?auto_514632 ?auto_514634 ) ) ( not ( = ?auto_514632 ?auto_514635 ) ) ( not ( = ?auto_514633 ?auto_514634 ) ) ( not ( = ?auto_514633 ?auto_514635 ) ) ( not ( = ?auto_514634 ?auto_514635 ) ) ( ON ?auto_514634 ?auto_514635 ) ( ON ?auto_514633 ?auto_514634 ) ( ON ?auto_514632 ?auto_514633 ) ( ON ?auto_514631 ?auto_514632 ) ( ON ?auto_514630 ?auto_514631 ) ( ON ?auto_514629 ?auto_514630 ) ( ON ?auto_514628 ?auto_514629 ) ( CLEAR ?auto_514626 ) ( ON ?auto_514627 ?auto_514628 ) ( CLEAR ?auto_514627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_514620 ?auto_514621 ?auto_514622 ?auto_514623 ?auto_514624 ?auto_514625 ?auto_514626 ?auto_514627 )
      ( MAKE-16PILE ?auto_514620 ?auto_514621 ?auto_514622 ?auto_514623 ?auto_514624 ?auto_514625 ?auto_514626 ?auto_514627 ?auto_514628 ?auto_514629 ?auto_514630 ?auto_514631 ?auto_514632 ?auto_514633 ?auto_514634 ?auto_514635 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514652 - BLOCK
      ?auto_514653 - BLOCK
      ?auto_514654 - BLOCK
      ?auto_514655 - BLOCK
      ?auto_514656 - BLOCK
      ?auto_514657 - BLOCK
      ?auto_514658 - BLOCK
      ?auto_514659 - BLOCK
      ?auto_514660 - BLOCK
      ?auto_514661 - BLOCK
      ?auto_514662 - BLOCK
      ?auto_514663 - BLOCK
      ?auto_514664 - BLOCK
      ?auto_514665 - BLOCK
      ?auto_514666 - BLOCK
      ?auto_514667 - BLOCK
    )
    :vars
    (
      ?auto_514668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514667 ?auto_514668 ) ( ON-TABLE ?auto_514652 ) ( ON ?auto_514653 ?auto_514652 ) ( ON ?auto_514654 ?auto_514653 ) ( ON ?auto_514655 ?auto_514654 ) ( ON ?auto_514656 ?auto_514655 ) ( ON ?auto_514657 ?auto_514656 ) ( not ( = ?auto_514652 ?auto_514653 ) ) ( not ( = ?auto_514652 ?auto_514654 ) ) ( not ( = ?auto_514652 ?auto_514655 ) ) ( not ( = ?auto_514652 ?auto_514656 ) ) ( not ( = ?auto_514652 ?auto_514657 ) ) ( not ( = ?auto_514652 ?auto_514658 ) ) ( not ( = ?auto_514652 ?auto_514659 ) ) ( not ( = ?auto_514652 ?auto_514660 ) ) ( not ( = ?auto_514652 ?auto_514661 ) ) ( not ( = ?auto_514652 ?auto_514662 ) ) ( not ( = ?auto_514652 ?auto_514663 ) ) ( not ( = ?auto_514652 ?auto_514664 ) ) ( not ( = ?auto_514652 ?auto_514665 ) ) ( not ( = ?auto_514652 ?auto_514666 ) ) ( not ( = ?auto_514652 ?auto_514667 ) ) ( not ( = ?auto_514652 ?auto_514668 ) ) ( not ( = ?auto_514653 ?auto_514654 ) ) ( not ( = ?auto_514653 ?auto_514655 ) ) ( not ( = ?auto_514653 ?auto_514656 ) ) ( not ( = ?auto_514653 ?auto_514657 ) ) ( not ( = ?auto_514653 ?auto_514658 ) ) ( not ( = ?auto_514653 ?auto_514659 ) ) ( not ( = ?auto_514653 ?auto_514660 ) ) ( not ( = ?auto_514653 ?auto_514661 ) ) ( not ( = ?auto_514653 ?auto_514662 ) ) ( not ( = ?auto_514653 ?auto_514663 ) ) ( not ( = ?auto_514653 ?auto_514664 ) ) ( not ( = ?auto_514653 ?auto_514665 ) ) ( not ( = ?auto_514653 ?auto_514666 ) ) ( not ( = ?auto_514653 ?auto_514667 ) ) ( not ( = ?auto_514653 ?auto_514668 ) ) ( not ( = ?auto_514654 ?auto_514655 ) ) ( not ( = ?auto_514654 ?auto_514656 ) ) ( not ( = ?auto_514654 ?auto_514657 ) ) ( not ( = ?auto_514654 ?auto_514658 ) ) ( not ( = ?auto_514654 ?auto_514659 ) ) ( not ( = ?auto_514654 ?auto_514660 ) ) ( not ( = ?auto_514654 ?auto_514661 ) ) ( not ( = ?auto_514654 ?auto_514662 ) ) ( not ( = ?auto_514654 ?auto_514663 ) ) ( not ( = ?auto_514654 ?auto_514664 ) ) ( not ( = ?auto_514654 ?auto_514665 ) ) ( not ( = ?auto_514654 ?auto_514666 ) ) ( not ( = ?auto_514654 ?auto_514667 ) ) ( not ( = ?auto_514654 ?auto_514668 ) ) ( not ( = ?auto_514655 ?auto_514656 ) ) ( not ( = ?auto_514655 ?auto_514657 ) ) ( not ( = ?auto_514655 ?auto_514658 ) ) ( not ( = ?auto_514655 ?auto_514659 ) ) ( not ( = ?auto_514655 ?auto_514660 ) ) ( not ( = ?auto_514655 ?auto_514661 ) ) ( not ( = ?auto_514655 ?auto_514662 ) ) ( not ( = ?auto_514655 ?auto_514663 ) ) ( not ( = ?auto_514655 ?auto_514664 ) ) ( not ( = ?auto_514655 ?auto_514665 ) ) ( not ( = ?auto_514655 ?auto_514666 ) ) ( not ( = ?auto_514655 ?auto_514667 ) ) ( not ( = ?auto_514655 ?auto_514668 ) ) ( not ( = ?auto_514656 ?auto_514657 ) ) ( not ( = ?auto_514656 ?auto_514658 ) ) ( not ( = ?auto_514656 ?auto_514659 ) ) ( not ( = ?auto_514656 ?auto_514660 ) ) ( not ( = ?auto_514656 ?auto_514661 ) ) ( not ( = ?auto_514656 ?auto_514662 ) ) ( not ( = ?auto_514656 ?auto_514663 ) ) ( not ( = ?auto_514656 ?auto_514664 ) ) ( not ( = ?auto_514656 ?auto_514665 ) ) ( not ( = ?auto_514656 ?auto_514666 ) ) ( not ( = ?auto_514656 ?auto_514667 ) ) ( not ( = ?auto_514656 ?auto_514668 ) ) ( not ( = ?auto_514657 ?auto_514658 ) ) ( not ( = ?auto_514657 ?auto_514659 ) ) ( not ( = ?auto_514657 ?auto_514660 ) ) ( not ( = ?auto_514657 ?auto_514661 ) ) ( not ( = ?auto_514657 ?auto_514662 ) ) ( not ( = ?auto_514657 ?auto_514663 ) ) ( not ( = ?auto_514657 ?auto_514664 ) ) ( not ( = ?auto_514657 ?auto_514665 ) ) ( not ( = ?auto_514657 ?auto_514666 ) ) ( not ( = ?auto_514657 ?auto_514667 ) ) ( not ( = ?auto_514657 ?auto_514668 ) ) ( not ( = ?auto_514658 ?auto_514659 ) ) ( not ( = ?auto_514658 ?auto_514660 ) ) ( not ( = ?auto_514658 ?auto_514661 ) ) ( not ( = ?auto_514658 ?auto_514662 ) ) ( not ( = ?auto_514658 ?auto_514663 ) ) ( not ( = ?auto_514658 ?auto_514664 ) ) ( not ( = ?auto_514658 ?auto_514665 ) ) ( not ( = ?auto_514658 ?auto_514666 ) ) ( not ( = ?auto_514658 ?auto_514667 ) ) ( not ( = ?auto_514658 ?auto_514668 ) ) ( not ( = ?auto_514659 ?auto_514660 ) ) ( not ( = ?auto_514659 ?auto_514661 ) ) ( not ( = ?auto_514659 ?auto_514662 ) ) ( not ( = ?auto_514659 ?auto_514663 ) ) ( not ( = ?auto_514659 ?auto_514664 ) ) ( not ( = ?auto_514659 ?auto_514665 ) ) ( not ( = ?auto_514659 ?auto_514666 ) ) ( not ( = ?auto_514659 ?auto_514667 ) ) ( not ( = ?auto_514659 ?auto_514668 ) ) ( not ( = ?auto_514660 ?auto_514661 ) ) ( not ( = ?auto_514660 ?auto_514662 ) ) ( not ( = ?auto_514660 ?auto_514663 ) ) ( not ( = ?auto_514660 ?auto_514664 ) ) ( not ( = ?auto_514660 ?auto_514665 ) ) ( not ( = ?auto_514660 ?auto_514666 ) ) ( not ( = ?auto_514660 ?auto_514667 ) ) ( not ( = ?auto_514660 ?auto_514668 ) ) ( not ( = ?auto_514661 ?auto_514662 ) ) ( not ( = ?auto_514661 ?auto_514663 ) ) ( not ( = ?auto_514661 ?auto_514664 ) ) ( not ( = ?auto_514661 ?auto_514665 ) ) ( not ( = ?auto_514661 ?auto_514666 ) ) ( not ( = ?auto_514661 ?auto_514667 ) ) ( not ( = ?auto_514661 ?auto_514668 ) ) ( not ( = ?auto_514662 ?auto_514663 ) ) ( not ( = ?auto_514662 ?auto_514664 ) ) ( not ( = ?auto_514662 ?auto_514665 ) ) ( not ( = ?auto_514662 ?auto_514666 ) ) ( not ( = ?auto_514662 ?auto_514667 ) ) ( not ( = ?auto_514662 ?auto_514668 ) ) ( not ( = ?auto_514663 ?auto_514664 ) ) ( not ( = ?auto_514663 ?auto_514665 ) ) ( not ( = ?auto_514663 ?auto_514666 ) ) ( not ( = ?auto_514663 ?auto_514667 ) ) ( not ( = ?auto_514663 ?auto_514668 ) ) ( not ( = ?auto_514664 ?auto_514665 ) ) ( not ( = ?auto_514664 ?auto_514666 ) ) ( not ( = ?auto_514664 ?auto_514667 ) ) ( not ( = ?auto_514664 ?auto_514668 ) ) ( not ( = ?auto_514665 ?auto_514666 ) ) ( not ( = ?auto_514665 ?auto_514667 ) ) ( not ( = ?auto_514665 ?auto_514668 ) ) ( not ( = ?auto_514666 ?auto_514667 ) ) ( not ( = ?auto_514666 ?auto_514668 ) ) ( not ( = ?auto_514667 ?auto_514668 ) ) ( ON ?auto_514666 ?auto_514667 ) ( ON ?auto_514665 ?auto_514666 ) ( ON ?auto_514664 ?auto_514665 ) ( ON ?auto_514663 ?auto_514664 ) ( ON ?auto_514662 ?auto_514663 ) ( ON ?auto_514661 ?auto_514662 ) ( ON ?auto_514660 ?auto_514661 ) ( ON ?auto_514659 ?auto_514660 ) ( CLEAR ?auto_514657 ) ( ON ?auto_514658 ?auto_514659 ) ( CLEAR ?auto_514658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_514652 ?auto_514653 ?auto_514654 ?auto_514655 ?auto_514656 ?auto_514657 ?auto_514658 )
      ( MAKE-16PILE ?auto_514652 ?auto_514653 ?auto_514654 ?auto_514655 ?auto_514656 ?auto_514657 ?auto_514658 ?auto_514659 ?auto_514660 ?auto_514661 ?auto_514662 ?auto_514663 ?auto_514664 ?auto_514665 ?auto_514666 ?auto_514667 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514685 - BLOCK
      ?auto_514686 - BLOCK
      ?auto_514687 - BLOCK
      ?auto_514688 - BLOCK
      ?auto_514689 - BLOCK
      ?auto_514690 - BLOCK
      ?auto_514691 - BLOCK
      ?auto_514692 - BLOCK
      ?auto_514693 - BLOCK
      ?auto_514694 - BLOCK
      ?auto_514695 - BLOCK
      ?auto_514696 - BLOCK
      ?auto_514697 - BLOCK
      ?auto_514698 - BLOCK
      ?auto_514699 - BLOCK
      ?auto_514700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514700 ) ( ON-TABLE ?auto_514685 ) ( ON ?auto_514686 ?auto_514685 ) ( ON ?auto_514687 ?auto_514686 ) ( ON ?auto_514688 ?auto_514687 ) ( ON ?auto_514689 ?auto_514688 ) ( ON ?auto_514690 ?auto_514689 ) ( not ( = ?auto_514685 ?auto_514686 ) ) ( not ( = ?auto_514685 ?auto_514687 ) ) ( not ( = ?auto_514685 ?auto_514688 ) ) ( not ( = ?auto_514685 ?auto_514689 ) ) ( not ( = ?auto_514685 ?auto_514690 ) ) ( not ( = ?auto_514685 ?auto_514691 ) ) ( not ( = ?auto_514685 ?auto_514692 ) ) ( not ( = ?auto_514685 ?auto_514693 ) ) ( not ( = ?auto_514685 ?auto_514694 ) ) ( not ( = ?auto_514685 ?auto_514695 ) ) ( not ( = ?auto_514685 ?auto_514696 ) ) ( not ( = ?auto_514685 ?auto_514697 ) ) ( not ( = ?auto_514685 ?auto_514698 ) ) ( not ( = ?auto_514685 ?auto_514699 ) ) ( not ( = ?auto_514685 ?auto_514700 ) ) ( not ( = ?auto_514686 ?auto_514687 ) ) ( not ( = ?auto_514686 ?auto_514688 ) ) ( not ( = ?auto_514686 ?auto_514689 ) ) ( not ( = ?auto_514686 ?auto_514690 ) ) ( not ( = ?auto_514686 ?auto_514691 ) ) ( not ( = ?auto_514686 ?auto_514692 ) ) ( not ( = ?auto_514686 ?auto_514693 ) ) ( not ( = ?auto_514686 ?auto_514694 ) ) ( not ( = ?auto_514686 ?auto_514695 ) ) ( not ( = ?auto_514686 ?auto_514696 ) ) ( not ( = ?auto_514686 ?auto_514697 ) ) ( not ( = ?auto_514686 ?auto_514698 ) ) ( not ( = ?auto_514686 ?auto_514699 ) ) ( not ( = ?auto_514686 ?auto_514700 ) ) ( not ( = ?auto_514687 ?auto_514688 ) ) ( not ( = ?auto_514687 ?auto_514689 ) ) ( not ( = ?auto_514687 ?auto_514690 ) ) ( not ( = ?auto_514687 ?auto_514691 ) ) ( not ( = ?auto_514687 ?auto_514692 ) ) ( not ( = ?auto_514687 ?auto_514693 ) ) ( not ( = ?auto_514687 ?auto_514694 ) ) ( not ( = ?auto_514687 ?auto_514695 ) ) ( not ( = ?auto_514687 ?auto_514696 ) ) ( not ( = ?auto_514687 ?auto_514697 ) ) ( not ( = ?auto_514687 ?auto_514698 ) ) ( not ( = ?auto_514687 ?auto_514699 ) ) ( not ( = ?auto_514687 ?auto_514700 ) ) ( not ( = ?auto_514688 ?auto_514689 ) ) ( not ( = ?auto_514688 ?auto_514690 ) ) ( not ( = ?auto_514688 ?auto_514691 ) ) ( not ( = ?auto_514688 ?auto_514692 ) ) ( not ( = ?auto_514688 ?auto_514693 ) ) ( not ( = ?auto_514688 ?auto_514694 ) ) ( not ( = ?auto_514688 ?auto_514695 ) ) ( not ( = ?auto_514688 ?auto_514696 ) ) ( not ( = ?auto_514688 ?auto_514697 ) ) ( not ( = ?auto_514688 ?auto_514698 ) ) ( not ( = ?auto_514688 ?auto_514699 ) ) ( not ( = ?auto_514688 ?auto_514700 ) ) ( not ( = ?auto_514689 ?auto_514690 ) ) ( not ( = ?auto_514689 ?auto_514691 ) ) ( not ( = ?auto_514689 ?auto_514692 ) ) ( not ( = ?auto_514689 ?auto_514693 ) ) ( not ( = ?auto_514689 ?auto_514694 ) ) ( not ( = ?auto_514689 ?auto_514695 ) ) ( not ( = ?auto_514689 ?auto_514696 ) ) ( not ( = ?auto_514689 ?auto_514697 ) ) ( not ( = ?auto_514689 ?auto_514698 ) ) ( not ( = ?auto_514689 ?auto_514699 ) ) ( not ( = ?auto_514689 ?auto_514700 ) ) ( not ( = ?auto_514690 ?auto_514691 ) ) ( not ( = ?auto_514690 ?auto_514692 ) ) ( not ( = ?auto_514690 ?auto_514693 ) ) ( not ( = ?auto_514690 ?auto_514694 ) ) ( not ( = ?auto_514690 ?auto_514695 ) ) ( not ( = ?auto_514690 ?auto_514696 ) ) ( not ( = ?auto_514690 ?auto_514697 ) ) ( not ( = ?auto_514690 ?auto_514698 ) ) ( not ( = ?auto_514690 ?auto_514699 ) ) ( not ( = ?auto_514690 ?auto_514700 ) ) ( not ( = ?auto_514691 ?auto_514692 ) ) ( not ( = ?auto_514691 ?auto_514693 ) ) ( not ( = ?auto_514691 ?auto_514694 ) ) ( not ( = ?auto_514691 ?auto_514695 ) ) ( not ( = ?auto_514691 ?auto_514696 ) ) ( not ( = ?auto_514691 ?auto_514697 ) ) ( not ( = ?auto_514691 ?auto_514698 ) ) ( not ( = ?auto_514691 ?auto_514699 ) ) ( not ( = ?auto_514691 ?auto_514700 ) ) ( not ( = ?auto_514692 ?auto_514693 ) ) ( not ( = ?auto_514692 ?auto_514694 ) ) ( not ( = ?auto_514692 ?auto_514695 ) ) ( not ( = ?auto_514692 ?auto_514696 ) ) ( not ( = ?auto_514692 ?auto_514697 ) ) ( not ( = ?auto_514692 ?auto_514698 ) ) ( not ( = ?auto_514692 ?auto_514699 ) ) ( not ( = ?auto_514692 ?auto_514700 ) ) ( not ( = ?auto_514693 ?auto_514694 ) ) ( not ( = ?auto_514693 ?auto_514695 ) ) ( not ( = ?auto_514693 ?auto_514696 ) ) ( not ( = ?auto_514693 ?auto_514697 ) ) ( not ( = ?auto_514693 ?auto_514698 ) ) ( not ( = ?auto_514693 ?auto_514699 ) ) ( not ( = ?auto_514693 ?auto_514700 ) ) ( not ( = ?auto_514694 ?auto_514695 ) ) ( not ( = ?auto_514694 ?auto_514696 ) ) ( not ( = ?auto_514694 ?auto_514697 ) ) ( not ( = ?auto_514694 ?auto_514698 ) ) ( not ( = ?auto_514694 ?auto_514699 ) ) ( not ( = ?auto_514694 ?auto_514700 ) ) ( not ( = ?auto_514695 ?auto_514696 ) ) ( not ( = ?auto_514695 ?auto_514697 ) ) ( not ( = ?auto_514695 ?auto_514698 ) ) ( not ( = ?auto_514695 ?auto_514699 ) ) ( not ( = ?auto_514695 ?auto_514700 ) ) ( not ( = ?auto_514696 ?auto_514697 ) ) ( not ( = ?auto_514696 ?auto_514698 ) ) ( not ( = ?auto_514696 ?auto_514699 ) ) ( not ( = ?auto_514696 ?auto_514700 ) ) ( not ( = ?auto_514697 ?auto_514698 ) ) ( not ( = ?auto_514697 ?auto_514699 ) ) ( not ( = ?auto_514697 ?auto_514700 ) ) ( not ( = ?auto_514698 ?auto_514699 ) ) ( not ( = ?auto_514698 ?auto_514700 ) ) ( not ( = ?auto_514699 ?auto_514700 ) ) ( ON ?auto_514699 ?auto_514700 ) ( ON ?auto_514698 ?auto_514699 ) ( ON ?auto_514697 ?auto_514698 ) ( ON ?auto_514696 ?auto_514697 ) ( ON ?auto_514695 ?auto_514696 ) ( ON ?auto_514694 ?auto_514695 ) ( ON ?auto_514693 ?auto_514694 ) ( ON ?auto_514692 ?auto_514693 ) ( CLEAR ?auto_514690 ) ( ON ?auto_514691 ?auto_514692 ) ( CLEAR ?auto_514691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_514685 ?auto_514686 ?auto_514687 ?auto_514688 ?auto_514689 ?auto_514690 ?auto_514691 )
      ( MAKE-16PILE ?auto_514685 ?auto_514686 ?auto_514687 ?auto_514688 ?auto_514689 ?auto_514690 ?auto_514691 ?auto_514692 ?auto_514693 ?auto_514694 ?auto_514695 ?auto_514696 ?auto_514697 ?auto_514698 ?auto_514699 ?auto_514700 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514717 - BLOCK
      ?auto_514718 - BLOCK
      ?auto_514719 - BLOCK
      ?auto_514720 - BLOCK
      ?auto_514721 - BLOCK
      ?auto_514722 - BLOCK
      ?auto_514723 - BLOCK
      ?auto_514724 - BLOCK
      ?auto_514725 - BLOCK
      ?auto_514726 - BLOCK
      ?auto_514727 - BLOCK
      ?auto_514728 - BLOCK
      ?auto_514729 - BLOCK
      ?auto_514730 - BLOCK
      ?auto_514731 - BLOCK
      ?auto_514732 - BLOCK
    )
    :vars
    (
      ?auto_514733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514732 ?auto_514733 ) ( ON-TABLE ?auto_514717 ) ( ON ?auto_514718 ?auto_514717 ) ( ON ?auto_514719 ?auto_514718 ) ( ON ?auto_514720 ?auto_514719 ) ( ON ?auto_514721 ?auto_514720 ) ( not ( = ?auto_514717 ?auto_514718 ) ) ( not ( = ?auto_514717 ?auto_514719 ) ) ( not ( = ?auto_514717 ?auto_514720 ) ) ( not ( = ?auto_514717 ?auto_514721 ) ) ( not ( = ?auto_514717 ?auto_514722 ) ) ( not ( = ?auto_514717 ?auto_514723 ) ) ( not ( = ?auto_514717 ?auto_514724 ) ) ( not ( = ?auto_514717 ?auto_514725 ) ) ( not ( = ?auto_514717 ?auto_514726 ) ) ( not ( = ?auto_514717 ?auto_514727 ) ) ( not ( = ?auto_514717 ?auto_514728 ) ) ( not ( = ?auto_514717 ?auto_514729 ) ) ( not ( = ?auto_514717 ?auto_514730 ) ) ( not ( = ?auto_514717 ?auto_514731 ) ) ( not ( = ?auto_514717 ?auto_514732 ) ) ( not ( = ?auto_514717 ?auto_514733 ) ) ( not ( = ?auto_514718 ?auto_514719 ) ) ( not ( = ?auto_514718 ?auto_514720 ) ) ( not ( = ?auto_514718 ?auto_514721 ) ) ( not ( = ?auto_514718 ?auto_514722 ) ) ( not ( = ?auto_514718 ?auto_514723 ) ) ( not ( = ?auto_514718 ?auto_514724 ) ) ( not ( = ?auto_514718 ?auto_514725 ) ) ( not ( = ?auto_514718 ?auto_514726 ) ) ( not ( = ?auto_514718 ?auto_514727 ) ) ( not ( = ?auto_514718 ?auto_514728 ) ) ( not ( = ?auto_514718 ?auto_514729 ) ) ( not ( = ?auto_514718 ?auto_514730 ) ) ( not ( = ?auto_514718 ?auto_514731 ) ) ( not ( = ?auto_514718 ?auto_514732 ) ) ( not ( = ?auto_514718 ?auto_514733 ) ) ( not ( = ?auto_514719 ?auto_514720 ) ) ( not ( = ?auto_514719 ?auto_514721 ) ) ( not ( = ?auto_514719 ?auto_514722 ) ) ( not ( = ?auto_514719 ?auto_514723 ) ) ( not ( = ?auto_514719 ?auto_514724 ) ) ( not ( = ?auto_514719 ?auto_514725 ) ) ( not ( = ?auto_514719 ?auto_514726 ) ) ( not ( = ?auto_514719 ?auto_514727 ) ) ( not ( = ?auto_514719 ?auto_514728 ) ) ( not ( = ?auto_514719 ?auto_514729 ) ) ( not ( = ?auto_514719 ?auto_514730 ) ) ( not ( = ?auto_514719 ?auto_514731 ) ) ( not ( = ?auto_514719 ?auto_514732 ) ) ( not ( = ?auto_514719 ?auto_514733 ) ) ( not ( = ?auto_514720 ?auto_514721 ) ) ( not ( = ?auto_514720 ?auto_514722 ) ) ( not ( = ?auto_514720 ?auto_514723 ) ) ( not ( = ?auto_514720 ?auto_514724 ) ) ( not ( = ?auto_514720 ?auto_514725 ) ) ( not ( = ?auto_514720 ?auto_514726 ) ) ( not ( = ?auto_514720 ?auto_514727 ) ) ( not ( = ?auto_514720 ?auto_514728 ) ) ( not ( = ?auto_514720 ?auto_514729 ) ) ( not ( = ?auto_514720 ?auto_514730 ) ) ( not ( = ?auto_514720 ?auto_514731 ) ) ( not ( = ?auto_514720 ?auto_514732 ) ) ( not ( = ?auto_514720 ?auto_514733 ) ) ( not ( = ?auto_514721 ?auto_514722 ) ) ( not ( = ?auto_514721 ?auto_514723 ) ) ( not ( = ?auto_514721 ?auto_514724 ) ) ( not ( = ?auto_514721 ?auto_514725 ) ) ( not ( = ?auto_514721 ?auto_514726 ) ) ( not ( = ?auto_514721 ?auto_514727 ) ) ( not ( = ?auto_514721 ?auto_514728 ) ) ( not ( = ?auto_514721 ?auto_514729 ) ) ( not ( = ?auto_514721 ?auto_514730 ) ) ( not ( = ?auto_514721 ?auto_514731 ) ) ( not ( = ?auto_514721 ?auto_514732 ) ) ( not ( = ?auto_514721 ?auto_514733 ) ) ( not ( = ?auto_514722 ?auto_514723 ) ) ( not ( = ?auto_514722 ?auto_514724 ) ) ( not ( = ?auto_514722 ?auto_514725 ) ) ( not ( = ?auto_514722 ?auto_514726 ) ) ( not ( = ?auto_514722 ?auto_514727 ) ) ( not ( = ?auto_514722 ?auto_514728 ) ) ( not ( = ?auto_514722 ?auto_514729 ) ) ( not ( = ?auto_514722 ?auto_514730 ) ) ( not ( = ?auto_514722 ?auto_514731 ) ) ( not ( = ?auto_514722 ?auto_514732 ) ) ( not ( = ?auto_514722 ?auto_514733 ) ) ( not ( = ?auto_514723 ?auto_514724 ) ) ( not ( = ?auto_514723 ?auto_514725 ) ) ( not ( = ?auto_514723 ?auto_514726 ) ) ( not ( = ?auto_514723 ?auto_514727 ) ) ( not ( = ?auto_514723 ?auto_514728 ) ) ( not ( = ?auto_514723 ?auto_514729 ) ) ( not ( = ?auto_514723 ?auto_514730 ) ) ( not ( = ?auto_514723 ?auto_514731 ) ) ( not ( = ?auto_514723 ?auto_514732 ) ) ( not ( = ?auto_514723 ?auto_514733 ) ) ( not ( = ?auto_514724 ?auto_514725 ) ) ( not ( = ?auto_514724 ?auto_514726 ) ) ( not ( = ?auto_514724 ?auto_514727 ) ) ( not ( = ?auto_514724 ?auto_514728 ) ) ( not ( = ?auto_514724 ?auto_514729 ) ) ( not ( = ?auto_514724 ?auto_514730 ) ) ( not ( = ?auto_514724 ?auto_514731 ) ) ( not ( = ?auto_514724 ?auto_514732 ) ) ( not ( = ?auto_514724 ?auto_514733 ) ) ( not ( = ?auto_514725 ?auto_514726 ) ) ( not ( = ?auto_514725 ?auto_514727 ) ) ( not ( = ?auto_514725 ?auto_514728 ) ) ( not ( = ?auto_514725 ?auto_514729 ) ) ( not ( = ?auto_514725 ?auto_514730 ) ) ( not ( = ?auto_514725 ?auto_514731 ) ) ( not ( = ?auto_514725 ?auto_514732 ) ) ( not ( = ?auto_514725 ?auto_514733 ) ) ( not ( = ?auto_514726 ?auto_514727 ) ) ( not ( = ?auto_514726 ?auto_514728 ) ) ( not ( = ?auto_514726 ?auto_514729 ) ) ( not ( = ?auto_514726 ?auto_514730 ) ) ( not ( = ?auto_514726 ?auto_514731 ) ) ( not ( = ?auto_514726 ?auto_514732 ) ) ( not ( = ?auto_514726 ?auto_514733 ) ) ( not ( = ?auto_514727 ?auto_514728 ) ) ( not ( = ?auto_514727 ?auto_514729 ) ) ( not ( = ?auto_514727 ?auto_514730 ) ) ( not ( = ?auto_514727 ?auto_514731 ) ) ( not ( = ?auto_514727 ?auto_514732 ) ) ( not ( = ?auto_514727 ?auto_514733 ) ) ( not ( = ?auto_514728 ?auto_514729 ) ) ( not ( = ?auto_514728 ?auto_514730 ) ) ( not ( = ?auto_514728 ?auto_514731 ) ) ( not ( = ?auto_514728 ?auto_514732 ) ) ( not ( = ?auto_514728 ?auto_514733 ) ) ( not ( = ?auto_514729 ?auto_514730 ) ) ( not ( = ?auto_514729 ?auto_514731 ) ) ( not ( = ?auto_514729 ?auto_514732 ) ) ( not ( = ?auto_514729 ?auto_514733 ) ) ( not ( = ?auto_514730 ?auto_514731 ) ) ( not ( = ?auto_514730 ?auto_514732 ) ) ( not ( = ?auto_514730 ?auto_514733 ) ) ( not ( = ?auto_514731 ?auto_514732 ) ) ( not ( = ?auto_514731 ?auto_514733 ) ) ( not ( = ?auto_514732 ?auto_514733 ) ) ( ON ?auto_514731 ?auto_514732 ) ( ON ?auto_514730 ?auto_514731 ) ( ON ?auto_514729 ?auto_514730 ) ( ON ?auto_514728 ?auto_514729 ) ( ON ?auto_514727 ?auto_514728 ) ( ON ?auto_514726 ?auto_514727 ) ( ON ?auto_514725 ?auto_514726 ) ( ON ?auto_514724 ?auto_514725 ) ( ON ?auto_514723 ?auto_514724 ) ( CLEAR ?auto_514721 ) ( ON ?auto_514722 ?auto_514723 ) ( CLEAR ?auto_514722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_514717 ?auto_514718 ?auto_514719 ?auto_514720 ?auto_514721 ?auto_514722 )
      ( MAKE-16PILE ?auto_514717 ?auto_514718 ?auto_514719 ?auto_514720 ?auto_514721 ?auto_514722 ?auto_514723 ?auto_514724 ?auto_514725 ?auto_514726 ?auto_514727 ?auto_514728 ?auto_514729 ?auto_514730 ?auto_514731 ?auto_514732 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514750 - BLOCK
      ?auto_514751 - BLOCK
      ?auto_514752 - BLOCK
      ?auto_514753 - BLOCK
      ?auto_514754 - BLOCK
      ?auto_514755 - BLOCK
      ?auto_514756 - BLOCK
      ?auto_514757 - BLOCK
      ?auto_514758 - BLOCK
      ?auto_514759 - BLOCK
      ?auto_514760 - BLOCK
      ?auto_514761 - BLOCK
      ?auto_514762 - BLOCK
      ?auto_514763 - BLOCK
      ?auto_514764 - BLOCK
      ?auto_514765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514765 ) ( ON-TABLE ?auto_514750 ) ( ON ?auto_514751 ?auto_514750 ) ( ON ?auto_514752 ?auto_514751 ) ( ON ?auto_514753 ?auto_514752 ) ( ON ?auto_514754 ?auto_514753 ) ( not ( = ?auto_514750 ?auto_514751 ) ) ( not ( = ?auto_514750 ?auto_514752 ) ) ( not ( = ?auto_514750 ?auto_514753 ) ) ( not ( = ?auto_514750 ?auto_514754 ) ) ( not ( = ?auto_514750 ?auto_514755 ) ) ( not ( = ?auto_514750 ?auto_514756 ) ) ( not ( = ?auto_514750 ?auto_514757 ) ) ( not ( = ?auto_514750 ?auto_514758 ) ) ( not ( = ?auto_514750 ?auto_514759 ) ) ( not ( = ?auto_514750 ?auto_514760 ) ) ( not ( = ?auto_514750 ?auto_514761 ) ) ( not ( = ?auto_514750 ?auto_514762 ) ) ( not ( = ?auto_514750 ?auto_514763 ) ) ( not ( = ?auto_514750 ?auto_514764 ) ) ( not ( = ?auto_514750 ?auto_514765 ) ) ( not ( = ?auto_514751 ?auto_514752 ) ) ( not ( = ?auto_514751 ?auto_514753 ) ) ( not ( = ?auto_514751 ?auto_514754 ) ) ( not ( = ?auto_514751 ?auto_514755 ) ) ( not ( = ?auto_514751 ?auto_514756 ) ) ( not ( = ?auto_514751 ?auto_514757 ) ) ( not ( = ?auto_514751 ?auto_514758 ) ) ( not ( = ?auto_514751 ?auto_514759 ) ) ( not ( = ?auto_514751 ?auto_514760 ) ) ( not ( = ?auto_514751 ?auto_514761 ) ) ( not ( = ?auto_514751 ?auto_514762 ) ) ( not ( = ?auto_514751 ?auto_514763 ) ) ( not ( = ?auto_514751 ?auto_514764 ) ) ( not ( = ?auto_514751 ?auto_514765 ) ) ( not ( = ?auto_514752 ?auto_514753 ) ) ( not ( = ?auto_514752 ?auto_514754 ) ) ( not ( = ?auto_514752 ?auto_514755 ) ) ( not ( = ?auto_514752 ?auto_514756 ) ) ( not ( = ?auto_514752 ?auto_514757 ) ) ( not ( = ?auto_514752 ?auto_514758 ) ) ( not ( = ?auto_514752 ?auto_514759 ) ) ( not ( = ?auto_514752 ?auto_514760 ) ) ( not ( = ?auto_514752 ?auto_514761 ) ) ( not ( = ?auto_514752 ?auto_514762 ) ) ( not ( = ?auto_514752 ?auto_514763 ) ) ( not ( = ?auto_514752 ?auto_514764 ) ) ( not ( = ?auto_514752 ?auto_514765 ) ) ( not ( = ?auto_514753 ?auto_514754 ) ) ( not ( = ?auto_514753 ?auto_514755 ) ) ( not ( = ?auto_514753 ?auto_514756 ) ) ( not ( = ?auto_514753 ?auto_514757 ) ) ( not ( = ?auto_514753 ?auto_514758 ) ) ( not ( = ?auto_514753 ?auto_514759 ) ) ( not ( = ?auto_514753 ?auto_514760 ) ) ( not ( = ?auto_514753 ?auto_514761 ) ) ( not ( = ?auto_514753 ?auto_514762 ) ) ( not ( = ?auto_514753 ?auto_514763 ) ) ( not ( = ?auto_514753 ?auto_514764 ) ) ( not ( = ?auto_514753 ?auto_514765 ) ) ( not ( = ?auto_514754 ?auto_514755 ) ) ( not ( = ?auto_514754 ?auto_514756 ) ) ( not ( = ?auto_514754 ?auto_514757 ) ) ( not ( = ?auto_514754 ?auto_514758 ) ) ( not ( = ?auto_514754 ?auto_514759 ) ) ( not ( = ?auto_514754 ?auto_514760 ) ) ( not ( = ?auto_514754 ?auto_514761 ) ) ( not ( = ?auto_514754 ?auto_514762 ) ) ( not ( = ?auto_514754 ?auto_514763 ) ) ( not ( = ?auto_514754 ?auto_514764 ) ) ( not ( = ?auto_514754 ?auto_514765 ) ) ( not ( = ?auto_514755 ?auto_514756 ) ) ( not ( = ?auto_514755 ?auto_514757 ) ) ( not ( = ?auto_514755 ?auto_514758 ) ) ( not ( = ?auto_514755 ?auto_514759 ) ) ( not ( = ?auto_514755 ?auto_514760 ) ) ( not ( = ?auto_514755 ?auto_514761 ) ) ( not ( = ?auto_514755 ?auto_514762 ) ) ( not ( = ?auto_514755 ?auto_514763 ) ) ( not ( = ?auto_514755 ?auto_514764 ) ) ( not ( = ?auto_514755 ?auto_514765 ) ) ( not ( = ?auto_514756 ?auto_514757 ) ) ( not ( = ?auto_514756 ?auto_514758 ) ) ( not ( = ?auto_514756 ?auto_514759 ) ) ( not ( = ?auto_514756 ?auto_514760 ) ) ( not ( = ?auto_514756 ?auto_514761 ) ) ( not ( = ?auto_514756 ?auto_514762 ) ) ( not ( = ?auto_514756 ?auto_514763 ) ) ( not ( = ?auto_514756 ?auto_514764 ) ) ( not ( = ?auto_514756 ?auto_514765 ) ) ( not ( = ?auto_514757 ?auto_514758 ) ) ( not ( = ?auto_514757 ?auto_514759 ) ) ( not ( = ?auto_514757 ?auto_514760 ) ) ( not ( = ?auto_514757 ?auto_514761 ) ) ( not ( = ?auto_514757 ?auto_514762 ) ) ( not ( = ?auto_514757 ?auto_514763 ) ) ( not ( = ?auto_514757 ?auto_514764 ) ) ( not ( = ?auto_514757 ?auto_514765 ) ) ( not ( = ?auto_514758 ?auto_514759 ) ) ( not ( = ?auto_514758 ?auto_514760 ) ) ( not ( = ?auto_514758 ?auto_514761 ) ) ( not ( = ?auto_514758 ?auto_514762 ) ) ( not ( = ?auto_514758 ?auto_514763 ) ) ( not ( = ?auto_514758 ?auto_514764 ) ) ( not ( = ?auto_514758 ?auto_514765 ) ) ( not ( = ?auto_514759 ?auto_514760 ) ) ( not ( = ?auto_514759 ?auto_514761 ) ) ( not ( = ?auto_514759 ?auto_514762 ) ) ( not ( = ?auto_514759 ?auto_514763 ) ) ( not ( = ?auto_514759 ?auto_514764 ) ) ( not ( = ?auto_514759 ?auto_514765 ) ) ( not ( = ?auto_514760 ?auto_514761 ) ) ( not ( = ?auto_514760 ?auto_514762 ) ) ( not ( = ?auto_514760 ?auto_514763 ) ) ( not ( = ?auto_514760 ?auto_514764 ) ) ( not ( = ?auto_514760 ?auto_514765 ) ) ( not ( = ?auto_514761 ?auto_514762 ) ) ( not ( = ?auto_514761 ?auto_514763 ) ) ( not ( = ?auto_514761 ?auto_514764 ) ) ( not ( = ?auto_514761 ?auto_514765 ) ) ( not ( = ?auto_514762 ?auto_514763 ) ) ( not ( = ?auto_514762 ?auto_514764 ) ) ( not ( = ?auto_514762 ?auto_514765 ) ) ( not ( = ?auto_514763 ?auto_514764 ) ) ( not ( = ?auto_514763 ?auto_514765 ) ) ( not ( = ?auto_514764 ?auto_514765 ) ) ( ON ?auto_514764 ?auto_514765 ) ( ON ?auto_514763 ?auto_514764 ) ( ON ?auto_514762 ?auto_514763 ) ( ON ?auto_514761 ?auto_514762 ) ( ON ?auto_514760 ?auto_514761 ) ( ON ?auto_514759 ?auto_514760 ) ( ON ?auto_514758 ?auto_514759 ) ( ON ?auto_514757 ?auto_514758 ) ( ON ?auto_514756 ?auto_514757 ) ( CLEAR ?auto_514754 ) ( ON ?auto_514755 ?auto_514756 ) ( CLEAR ?auto_514755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_514750 ?auto_514751 ?auto_514752 ?auto_514753 ?auto_514754 ?auto_514755 )
      ( MAKE-16PILE ?auto_514750 ?auto_514751 ?auto_514752 ?auto_514753 ?auto_514754 ?auto_514755 ?auto_514756 ?auto_514757 ?auto_514758 ?auto_514759 ?auto_514760 ?auto_514761 ?auto_514762 ?auto_514763 ?auto_514764 ?auto_514765 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514782 - BLOCK
      ?auto_514783 - BLOCK
      ?auto_514784 - BLOCK
      ?auto_514785 - BLOCK
      ?auto_514786 - BLOCK
      ?auto_514787 - BLOCK
      ?auto_514788 - BLOCK
      ?auto_514789 - BLOCK
      ?auto_514790 - BLOCK
      ?auto_514791 - BLOCK
      ?auto_514792 - BLOCK
      ?auto_514793 - BLOCK
      ?auto_514794 - BLOCK
      ?auto_514795 - BLOCK
      ?auto_514796 - BLOCK
      ?auto_514797 - BLOCK
    )
    :vars
    (
      ?auto_514798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514797 ?auto_514798 ) ( ON-TABLE ?auto_514782 ) ( ON ?auto_514783 ?auto_514782 ) ( ON ?auto_514784 ?auto_514783 ) ( ON ?auto_514785 ?auto_514784 ) ( not ( = ?auto_514782 ?auto_514783 ) ) ( not ( = ?auto_514782 ?auto_514784 ) ) ( not ( = ?auto_514782 ?auto_514785 ) ) ( not ( = ?auto_514782 ?auto_514786 ) ) ( not ( = ?auto_514782 ?auto_514787 ) ) ( not ( = ?auto_514782 ?auto_514788 ) ) ( not ( = ?auto_514782 ?auto_514789 ) ) ( not ( = ?auto_514782 ?auto_514790 ) ) ( not ( = ?auto_514782 ?auto_514791 ) ) ( not ( = ?auto_514782 ?auto_514792 ) ) ( not ( = ?auto_514782 ?auto_514793 ) ) ( not ( = ?auto_514782 ?auto_514794 ) ) ( not ( = ?auto_514782 ?auto_514795 ) ) ( not ( = ?auto_514782 ?auto_514796 ) ) ( not ( = ?auto_514782 ?auto_514797 ) ) ( not ( = ?auto_514782 ?auto_514798 ) ) ( not ( = ?auto_514783 ?auto_514784 ) ) ( not ( = ?auto_514783 ?auto_514785 ) ) ( not ( = ?auto_514783 ?auto_514786 ) ) ( not ( = ?auto_514783 ?auto_514787 ) ) ( not ( = ?auto_514783 ?auto_514788 ) ) ( not ( = ?auto_514783 ?auto_514789 ) ) ( not ( = ?auto_514783 ?auto_514790 ) ) ( not ( = ?auto_514783 ?auto_514791 ) ) ( not ( = ?auto_514783 ?auto_514792 ) ) ( not ( = ?auto_514783 ?auto_514793 ) ) ( not ( = ?auto_514783 ?auto_514794 ) ) ( not ( = ?auto_514783 ?auto_514795 ) ) ( not ( = ?auto_514783 ?auto_514796 ) ) ( not ( = ?auto_514783 ?auto_514797 ) ) ( not ( = ?auto_514783 ?auto_514798 ) ) ( not ( = ?auto_514784 ?auto_514785 ) ) ( not ( = ?auto_514784 ?auto_514786 ) ) ( not ( = ?auto_514784 ?auto_514787 ) ) ( not ( = ?auto_514784 ?auto_514788 ) ) ( not ( = ?auto_514784 ?auto_514789 ) ) ( not ( = ?auto_514784 ?auto_514790 ) ) ( not ( = ?auto_514784 ?auto_514791 ) ) ( not ( = ?auto_514784 ?auto_514792 ) ) ( not ( = ?auto_514784 ?auto_514793 ) ) ( not ( = ?auto_514784 ?auto_514794 ) ) ( not ( = ?auto_514784 ?auto_514795 ) ) ( not ( = ?auto_514784 ?auto_514796 ) ) ( not ( = ?auto_514784 ?auto_514797 ) ) ( not ( = ?auto_514784 ?auto_514798 ) ) ( not ( = ?auto_514785 ?auto_514786 ) ) ( not ( = ?auto_514785 ?auto_514787 ) ) ( not ( = ?auto_514785 ?auto_514788 ) ) ( not ( = ?auto_514785 ?auto_514789 ) ) ( not ( = ?auto_514785 ?auto_514790 ) ) ( not ( = ?auto_514785 ?auto_514791 ) ) ( not ( = ?auto_514785 ?auto_514792 ) ) ( not ( = ?auto_514785 ?auto_514793 ) ) ( not ( = ?auto_514785 ?auto_514794 ) ) ( not ( = ?auto_514785 ?auto_514795 ) ) ( not ( = ?auto_514785 ?auto_514796 ) ) ( not ( = ?auto_514785 ?auto_514797 ) ) ( not ( = ?auto_514785 ?auto_514798 ) ) ( not ( = ?auto_514786 ?auto_514787 ) ) ( not ( = ?auto_514786 ?auto_514788 ) ) ( not ( = ?auto_514786 ?auto_514789 ) ) ( not ( = ?auto_514786 ?auto_514790 ) ) ( not ( = ?auto_514786 ?auto_514791 ) ) ( not ( = ?auto_514786 ?auto_514792 ) ) ( not ( = ?auto_514786 ?auto_514793 ) ) ( not ( = ?auto_514786 ?auto_514794 ) ) ( not ( = ?auto_514786 ?auto_514795 ) ) ( not ( = ?auto_514786 ?auto_514796 ) ) ( not ( = ?auto_514786 ?auto_514797 ) ) ( not ( = ?auto_514786 ?auto_514798 ) ) ( not ( = ?auto_514787 ?auto_514788 ) ) ( not ( = ?auto_514787 ?auto_514789 ) ) ( not ( = ?auto_514787 ?auto_514790 ) ) ( not ( = ?auto_514787 ?auto_514791 ) ) ( not ( = ?auto_514787 ?auto_514792 ) ) ( not ( = ?auto_514787 ?auto_514793 ) ) ( not ( = ?auto_514787 ?auto_514794 ) ) ( not ( = ?auto_514787 ?auto_514795 ) ) ( not ( = ?auto_514787 ?auto_514796 ) ) ( not ( = ?auto_514787 ?auto_514797 ) ) ( not ( = ?auto_514787 ?auto_514798 ) ) ( not ( = ?auto_514788 ?auto_514789 ) ) ( not ( = ?auto_514788 ?auto_514790 ) ) ( not ( = ?auto_514788 ?auto_514791 ) ) ( not ( = ?auto_514788 ?auto_514792 ) ) ( not ( = ?auto_514788 ?auto_514793 ) ) ( not ( = ?auto_514788 ?auto_514794 ) ) ( not ( = ?auto_514788 ?auto_514795 ) ) ( not ( = ?auto_514788 ?auto_514796 ) ) ( not ( = ?auto_514788 ?auto_514797 ) ) ( not ( = ?auto_514788 ?auto_514798 ) ) ( not ( = ?auto_514789 ?auto_514790 ) ) ( not ( = ?auto_514789 ?auto_514791 ) ) ( not ( = ?auto_514789 ?auto_514792 ) ) ( not ( = ?auto_514789 ?auto_514793 ) ) ( not ( = ?auto_514789 ?auto_514794 ) ) ( not ( = ?auto_514789 ?auto_514795 ) ) ( not ( = ?auto_514789 ?auto_514796 ) ) ( not ( = ?auto_514789 ?auto_514797 ) ) ( not ( = ?auto_514789 ?auto_514798 ) ) ( not ( = ?auto_514790 ?auto_514791 ) ) ( not ( = ?auto_514790 ?auto_514792 ) ) ( not ( = ?auto_514790 ?auto_514793 ) ) ( not ( = ?auto_514790 ?auto_514794 ) ) ( not ( = ?auto_514790 ?auto_514795 ) ) ( not ( = ?auto_514790 ?auto_514796 ) ) ( not ( = ?auto_514790 ?auto_514797 ) ) ( not ( = ?auto_514790 ?auto_514798 ) ) ( not ( = ?auto_514791 ?auto_514792 ) ) ( not ( = ?auto_514791 ?auto_514793 ) ) ( not ( = ?auto_514791 ?auto_514794 ) ) ( not ( = ?auto_514791 ?auto_514795 ) ) ( not ( = ?auto_514791 ?auto_514796 ) ) ( not ( = ?auto_514791 ?auto_514797 ) ) ( not ( = ?auto_514791 ?auto_514798 ) ) ( not ( = ?auto_514792 ?auto_514793 ) ) ( not ( = ?auto_514792 ?auto_514794 ) ) ( not ( = ?auto_514792 ?auto_514795 ) ) ( not ( = ?auto_514792 ?auto_514796 ) ) ( not ( = ?auto_514792 ?auto_514797 ) ) ( not ( = ?auto_514792 ?auto_514798 ) ) ( not ( = ?auto_514793 ?auto_514794 ) ) ( not ( = ?auto_514793 ?auto_514795 ) ) ( not ( = ?auto_514793 ?auto_514796 ) ) ( not ( = ?auto_514793 ?auto_514797 ) ) ( not ( = ?auto_514793 ?auto_514798 ) ) ( not ( = ?auto_514794 ?auto_514795 ) ) ( not ( = ?auto_514794 ?auto_514796 ) ) ( not ( = ?auto_514794 ?auto_514797 ) ) ( not ( = ?auto_514794 ?auto_514798 ) ) ( not ( = ?auto_514795 ?auto_514796 ) ) ( not ( = ?auto_514795 ?auto_514797 ) ) ( not ( = ?auto_514795 ?auto_514798 ) ) ( not ( = ?auto_514796 ?auto_514797 ) ) ( not ( = ?auto_514796 ?auto_514798 ) ) ( not ( = ?auto_514797 ?auto_514798 ) ) ( ON ?auto_514796 ?auto_514797 ) ( ON ?auto_514795 ?auto_514796 ) ( ON ?auto_514794 ?auto_514795 ) ( ON ?auto_514793 ?auto_514794 ) ( ON ?auto_514792 ?auto_514793 ) ( ON ?auto_514791 ?auto_514792 ) ( ON ?auto_514790 ?auto_514791 ) ( ON ?auto_514789 ?auto_514790 ) ( ON ?auto_514788 ?auto_514789 ) ( ON ?auto_514787 ?auto_514788 ) ( CLEAR ?auto_514785 ) ( ON ?auto_514786 ?auto_514787 ) ( CLEAR ?auto_514786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_514782 ?auto_514783 ?auto_514784 ?auto_514785 ?auto_514786 )
      ( MAKE-16PILE ?auto_514782 ?auto_514783 ?auto_514784 ?auto_514785 ?auto_514786 ?auto_514787 ?auto_514788 ?auto_514789 ?auto_514790 ?auto_514791 ?auto_514792 ?auto_514793 ?auto_514794 ?auto_514795 ?auto_514796 ?auto_514797 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514815 - BLOCK
      ?auto_514816 - BLOCK
      ?auto_514817 - BLOCK
      ?auto_514818 - BLOCK
      ?auto_514819 - BLOCK
      ?auto_514820 - BLOCK
      ?auto_514821 - BLOCK
      ?auto_514822 - BLOCK
      ?auto_514823 - BLOCK
      ?auto_514824 - BLOCK
      ?auto_514825 - BLOCK
      ?auto_514826 - BLOCK
      ?auto_514827 - BLOCK
      ?auto_514828 - BLOCK
      ?auto_514829 - BLOCK
      ?auto_514830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514830 ) ( ON-TABLE ?auto_514815 ) ( ON ?auto_514816 ?auto_514815 ) ( ON ?auto_514817 ?auto_514816 ) ( ON ?auto_514818 ?auto_514817 ) ( not ( = ?auto_514815 ?auto_514816 ) ) ( not ( = ?auto_514815 ?auto_514817 ) ) ( not ( = ?auto_514815 ?auto_514818 ) ) ( not ( = ?auto_514815 ?auto_514819 ) ) ( not ( = ?auto_514815 ?auto_514820 ) ) ( not ( = ?auto_514815 ?auto_514821 ) ) ( not ( = ?auto_514815 ?auto_514822 ) ) ( not ( = ?auto_514815 ?auto_514823 ) ) ( not ( = ?auto_514815 ?auto_514824 ) ) ( not ( = ?auto_514815 ?auto_514825 ) ) ( not ( = ?auto_514815 ?auto_514826 ) ) ( not ( = ?auto_514815 ?auto_514827 ) ) ( not ( = ?auto_514815 ?auto_514828 ) ) ( not ( = ?auto_514815 ?auto_514829 ) ) ( not ( = ?auto_514815 ?auto_514830 ) ) ( not ( = ?auto_514816 ?auto_514817 ) ) ( not ( = ?auto_514816 ?auto_514818 ) ) ( not ( = ?auto_514816 ?auto_514819 ) ) ( not ( = ?auto_514816 ?auto_514820 ) ) ( not ( = ?auto_514816 ?auto_514821 ) ) ( not ( = ?auto_514816 ?auto_514822 ) ) ( not ( = ?auto_514816 ?auto_514823 ) ) ( not ( = ?auto_514816 ?auto_514824 ) ) ( not ( = ?auto_514816 ?auto_514825 ) ) ( not ( = ?auto_514816 ?auto_514826 ) ) ( not ( = ?auto_514816 ?auto_514827 ) ) ( not ( = ?auto_514816 ?auto_514828 ) ) ( not ( = ?auto_514816 ?auto_514829 ) ) ( not ( = ?auto_514816 ?auto_514830 ) ) ( not ( = ?auto_514817 ?auto_514818 ) ) ( not ( = ?auto_514817 ?auto_514819 ) ) ( not ( = ?auto_514817 ?auto_514820 ) ) ( not ( = ?auto_514817 ?auto_514821 ) ) ( not ( = ?auto_514817 ?auto_514822 ) ) ( not ( = ?auto_514817 ?auto_514823 ) ) ( not ( = ?auto_514817 ?auto_514824 ) ) ( not ( = ?auto_514817 ?auto_514825 ) ) ( not ( = ?auto_514817 ?auto_514826 ) ) ( not ( = ?auto_514817 ?auto_514827 ) ) ( not ( = ?auto_514817 ?auto_514828 ) ) ( not ( = ?auto_514817 ?auto_514829 ) ) ( not ( = ?auto_514817 ?auto_514830 ) ) ( not ( = ?auto_514818 ?auto_514819 ) ) ( not ( = ?auto_514818 ?auto_514820 ) ) ( not ( = ?auto_514818 ?auto_514821 ) ) ( not ( = ?auto_514818 ?auto_514822 ) ) ( not ( = ?auto_514818 ?auto_514823 ) ) ( not ( = ?auto_514818 ?auto_514824 ) ) ( not ( = ?auto_514818 ?auto_514825 ) ) ( not ( = ?auto_514818 ?auto_514826 ) ) ( not ( = ?auto_514818 ?auto_514827 ) ) ( not ( = ?auto_514818 ?auto_514828 ) ) ( not ( = ?auto_514818 ?auto_514829 ) ) ( not ( = ?auto_514818 ?auto_514830 ) ) ( not ( = ?auto_514819 ?auto_514820 ) ) ( not ( = ?auto_514819 ?auto_514821 ) ) ( not ( = ?auto_514819 ?auto_514822 ) ) ( not ( = ?auto_514819 ?auto_514823 ) ) ( not ( = ?auto_514819 ?auto_514824 ) ) ( not ( = ?auto_514819 ?auto_514825 ) ) ( not ( = ?auto_514819 ?auto_514826 ) ) ( not ( = ?auto_514819 ?auto_514827 ) ) ( not ( = ?auto_514819 ?auto_514828 ) ) ( not ( = ?auto_514819 ?auto_514829 ) ) ( not ( = ?auto_514819 ?auto_514830 ) ) ( not ( = ?auto_514820 ?auto_514821 ) ) ( not ( = ?auto_514820 ?auto_514822 ) ) ( not ( = ?auto_514820 ?auto_514823 ) ) ( not ( = ?auto_514820 ?auto_514824 ) ) ( not ( = ?auto_514820 ?auto_514825 ) ) ( not ( = ?auto_514820 ?auto_514826 ) ) ( not ( = ?auto_514820 ?auto_514827 ) ) ( not ( = ?auto_514820 ?auto_514828 ) ) ( not ( = ?auto_514820 ?auto_514829 ) ) ( not ( = ?auto_514820 ?auto_514830 ) ) ( not ( = ?auto_514821 ?auto_514822 ) ) ( not ( = ?auto_514821 ?auto_514823 ) ) ( not ( = ?auto_514821 ?auto_514824 ) ) ( not ( = ?auto_514821 ?auto_514825 ) ) ( not ( = ?auto_514821 ?auto_514826 ) ) ( not ( = ?auto_514821 ?auto_514827 ) ) ( not ( = ?auto_514821 ?auto_514828 ) ) ( not ( = ?auto_514821 ?auto_514829 ) ) ( not ( = ?auto_514821 ?auto_514830 ) ) ( not ( = ?auto_514822 ?auto_514823 ) ) ( not ( = ?auto_514822 ?auto_514824 ) ) ( not ( = ?auto_514822 ?auto_514825 ) ) ( not ( = ?auto_514822 ?auto_514826 ) ) ( not ( = ?auto_514822 ?auto_514827 ) ) ( not ( = ?auto_514822 ?auto_514828 ) ) ( not ( = ?auto_514822 ?auto_514829 ) ) ( not ( = ?auto_514822 ?auto_514830 ) ) ( not ( = ?auto_514823 ?auto_514824 ) ) ( not ( = ?auto_514823 ?auto_514825 ) ) ( not ( = ?auto_514823 ?auto_514826 ) ) ( not ( = ?auto_514823 ?auto_514827 ) ) ( not ( = ?auto_514823 ?auto_514828 ) ) ( not ( = ?auto_514823 ?auto_514829 ) ) ( not ( = ?auto_514823 ?auto_514830 ) ) ( not ( = ?auto_514824 ?auto_514825 ) ) ( not ( = ?auto_514824 ?auto_514826 ) ) ( not ( = ?auto_514824 ?auto_514827 ) ) ( not ( = ?auto_514824 ?auto_514828 ) ) ( not ( = ?auto_514824 ?auto_514829 ) ) ( not ( = ?auto_514824 ?auto_514830 ) ) ( not ( = ?auto_514825 ?auto_514826 ) ) ( not ( = ?auto_514825 ?auto_514827 ) ) ( not ( = ?auto_514825 ?auto_514828 ) ) ( not ( = ?auto_514825 ?auto_514829 ) ) ( not ( = ?auto_514825 ?auto_514830 ) ) ( not ( = ?auto_514826 ?auto_514827 ) ) ( not ( = ?auto_514826 ?auto_514828 ) ) ( not ( = ?auto_514826 ?auto_514829 ) ) ( not ( = ?auto_514826 ?auto_514830 ) ) ( not ( = ?auto_514827 ?auto_514828 ) ) ( not ( = ?auto_514827 ?auto_514829 ) ) ( not ( = ?auto_514827 ?auto_514830 ) ) ( not ( = ?auto_514828 ?auto_514829 ) ) ( not ( = ?auto_514828 ?auto_514830 ) ) ( not ( = ?auto_514829 ?auto_514830 ) ) ( ON ?auto_514829 ?auto_514830 ) ( ON ?auto_514828 ?auto_514829 ) ( ON ?auto_514827 ?auto_514828 ) ( ON ?auto_514826 ?auto_514827 ) ( ON ?auto_514825 ?auto_514826 ) ( ON ?auto_514824 ?auto_514825 ) ( ON ?auto_514823 ?auto_514824 ) ( ON ?auto_514822 ?auto_514823 ) ( ON ?auto_514821 ?auto_514822 ) ( ON ?auto_514820 ?auto_514821 ) ( CLEAR ?auto_514818 ) ( ON ?auto_514819 ?auto_514820 ) ( CLEAR ?auto_514819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_514815 ?auto_514816 ?auto_514817 ?auto_514818 ?auto_514819 )
      ( MAKE-16PILE ?auto_514815 ?auto_514816 ?auto_514817 ?auto_514818 ?auto_514819 ?auto_514820 ?auto_514821 ?auto_514822 ?auto_514823 ?auto_514824 ?auto_514825 ?auto_514826 ?auto_514827 ?auto_514828 ?auto_514829 ?auto_514830 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514847 - BLOCK
      ?auto_514848 - BLOCK
      ?auto_514849 - BLOCK
      ?auto_514850 - BLOCK
      ?auto_514851 - BLOCK
      ?auto_514852 - BLOCK
      ?auto_514853 - BLOCK
      ?auto_514854 - BLOCK
      ?auto_514855 - BLOCK
      ?auto_514856 - BLOCK
      ?auto_514857 - BLOCK
      ?auto_514858 - BLOCK
      ?auto_514859 - BLOCK
      ?auto_514860 - BLOCK
      ?auto_514861 - BLOCK
      ?auto_514862 - BLOCK
    )
    :vars
    (
      ?auto_514863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514862 ?auto_514863 ) ( ON-TABLE ?auto_514847 ) ( ON ?auto_514848 ?auto_514847 ) ( ON ?auto_514849 ?auto_514848 ) ( not ( = ?auto_514847 ?auto_514848 ) ) ( not ( = ?auto_514847 ?auto_514849 ) ) ( not ( = ?auto_514847 ?auto_514850 ) ) ( not ( = ?auto_514847 ?auto_514851 ) ) ( not ( = ?auto_514847 ?auto_514852 ) ) ( not ( = ?auto_514847 ?auto_514853 ) ) ( not ( = ?auto_514847 ?auto_514854 ) ) ( not ( = ?auto_514847 ?auto_514855 ) ) ( not ( = ?auto_514847 ?auto_514856 ) ) ( not ( = ?auto_514847 ?auto_514857 ) ) ( not ( = ?auto_514847 ?auto_514858 ) ) ( not ( = ?auto_514847 ?auto_514859 ) ) ( not ( = ?auto_514847 ?auto_514860 ) ) ( not ( = ?auto_514847 ?auto_514861 ) ) ( not ( = ?auto_514847 ?auto_514862 ) ) ( not ( = ?auto_514847 ?auto_514863 ) ) ( not ( = ?auto_514848 ?auto_514849 ) ) ( not ( = ?auto_514848 ?auto_514850 ) ) ( not ( = ?auto_514848 ?auto_514851 ) ) ( not ( = ?auto_514848 ?auto_514852 ) ) ( not ( = ?auto_514848 ?auto_514853 ) ) ( not ( = ?auto_514848 ?auto_514854 ) ) ( not ( = ?auto_514848 ?auto_514855 ) ) ( not ( = ?auto_514848 ?auto_514856 ) ) ( not ( = ?auto_514848 ?auto_514857 ) ) ( not ( = ?auto_514848 ?auto_514858 ) ) ( not ( = ?auto_514848 ?auto_514859 ) ) ( not ( = ?auto_514848 ?auto_514860 ) ) ( not ( = ?auto_514848 ?auto_514861 ) ) ( not ( = ?auto_514848 ?auto_514862 ) ) ( not ( = ?auto_514848 ?auto_514863 ) ) ( not ( = ?auto_514849 ?auto_514850 ) ) ( not ( = ?auto_514849 ?auto_514851 ) ) ( not ( = ?auto_514849 ?auto_514852 ) ) ( not ( = ?auto_514849 ?auto_514853 ) ) ( not ( = ?auto_514849 ?auto_514854 ) ) ( not ( = ?auto_514849 ?auto_514855 ) ) ( not ( = ?auto_514849 ?auto_514856 ) ) ( not ( = ?auto_514849 ?auto_514857 ) ) ( not ( = ?auto_514849 ?auto_514858 ) ) ( not ( = ?auto_514849 ?auto_514859 ) ) ( not ( = ?auto_514849 ?auto_514860 ) ) ( not ( = ?auto_514849 ?auto_514861 ) ) ( not ( = ?auto_514849 ?auto_514862 ) ) ( not ( = ?auto_514849 ?auto_514863 ) ) ( not ( = ?auto_514850 ?auto_514851 ) ) ( not ( = ?auto_514850 ?auto_514852 ) ) ( not ( = ?auto_514850 ?auto_514853 ) ) ( not ( = ?auto_514850 ?auto_514854 ) ) ( not ( = ?auto_514850 ?auto_514855 ) ) ( not ( = ?auto_514850 ?auto_514856 ) ) ( not ( = ?auto_514850 ?auto_514857 ) ) ( not ( = ?auto_514850 ?auto_514858 ) ) ( not ( = ?auto_514850 ?auto_514859 ) ) ( not ( = ?auto_514850 ?auto_514860 ) ) ( not ( = ?auto_514850 ?auto_514861 ) ) ( not ( = ?auto_514850 ?auto_514862 ) ) ( not ( = ?auto_514850 ?auto_514863 ) ) ( not ( = ?auto_514851 ?auto_514852 ) ) ( not ( = ?auto_514851 ?auto_514853 ) ) ( not ( = ?auto_514851 ?auto_514854 ) ) ( not ( = ?auto_514851 ?auto_514855 ) ) ( not ( = ?auto_514851 ?auto_514856 ) ) ( not ( = ?auto_514851 ?auto_514857 ) ) ( not ( = ?auto_514851 ?auto_514858 ) ) ( not ( = ?auto_514851 ?auto_514859 ) ) ( not ( = ?auto_514851 ?auto_514860 ) ) ( not ( = ?auto_514851 ?auto_514861 ) ) ( not ( = ?auto_514851 ?auto_514862 ) ) ( not ( = ?auto_514851 ?auto_514863 ) ) ( not ( = ?auto_514852 ?auto_514853 ) ) ( not ( = ?auto_514852 ?auto_514854 ) ) ( not ( = ?auto_514852 ?auto_514855 ) ) ( not ( = ?auto_514852 ?auto_514856 ) ) ( not ( = ?auto_514852 ?auto_514857 ) ) ( not ( = ?auto_514852 ?auto_514858 ) ) ( not ( = ?auto_514852 ?auto_514859 ) ) ( not ( = ?auto_514852 ?auto_514860 ) ) ( not ( = ?auto_514852 ?auto_514861 ) ) ( not ( = ?auto_514852 ?auto_514862 ) ) ( not ( = ?auto_514852 ?auto_514863 ) ) ( not ( = ?auto_514853 ?auto_514854 ) ) ( not ( = ?auto_514853 ?auto_514855 ) ) ( not ( = ?auto_514853 ?auto_514856 ) ) ( not ( = ?auto_514853 ?auto_514857 ) ) ( not ( = ?auto_514853 ?auto_514858 ) ) ( not ( = ?auto_514853 ?auto_514859 ) ) ( not ( = ?auto_514853 ?auto_514860 ) ) ( not ( = ?auto_514853 ?auto_514861 ) ) ( not ( = ?auto_514853 ?auto_514862 ) ) ( not ( = ?auto_514853 ?auto_514863 ) ) ( not ( = ?auto_514854 ?auto_514855 ) ) ( not ( = ?auto_514854 ?auto_514856 ) ) ( not ( = ?auto_514854 ?auto_514857 ) ) ( not ( = ?auto_514854 ?auto_514858 ) ) ( not ( = ?auto_514854 ?auto_514859 ) ) ( not ( = ?auto_514854 ?auto_514860 ) ) ( not ( = ?auto_514854 ?auto_514861 ) ) ( not ( = ?auto_514854 ?auto_514862 ) ) ( not ( = ?auto_514854 ?auto_514863 ) ) ( not ( = ?auto_514855 ?auto_514856 ) ) ( not ( = ?auto_514855 ?auto_514857 ) ) ( not ( = ?auto_514855 ?auto_514858 ) ) ( not ( = ?auto_514855 ?auto_514859 ) ) ( not ( = ?auto_514855 ?auto_514860 ) ) ( not ( = ?auto_514855 ?auto_514861 ) ) ( not ( = ?auto_514855 ?auto_514862 ) ) ( not ( = ?auto_514855 ?auto_514863 ) ) ( not ( = ?auto_514856 ?auto_514857 ) ) ( not ( = ?auto_514856 ?auto_514858 ) ) ( not ( = ?auto_514856 ?auto_514859 ) ) ( not ( = ?auto_514856 ?auto_514860 ) ) ( not ( = ?auto_514856 ?auto_514861 ) ) ( not ( = ?auto_514856 ?auto_514862 ) ) ( not ( = ?auto_514856 ?auto_514863 ) ) ( not ( = ?auto_514857 ?auto_514858 ) ) ( not ( = ?auto_514857 ?auto_514859 ) ) ( not ( = ?auto_514857 ?auto_514860 ) ) ( not ( = ?auto_514857 ?auto_514861 ) ) ( not ( = ?auto_514857 ?auto_514862 ) ) ( not ( = ?auto_514857 ?auto_514863 ) ) ( not ( = ?auto_514858 ?auto_514859 ) ) ( not ( = ?auto_514858 ?auto_514860 ) ) ( not ( = ?auto_514858 ?auto_514861 ) ) ( not ( = ?auto_514858 ?auto_514862 ) ) ( not ( = ?auto_514858 ?auto_514863 ) ) ( not ( = ?auto_514859 ?auto_514860 ) ) ( not ( = ?auto_514859 ?auto_514861 ) ) ( not ( = ?auto_514859 ?auto_514862 ) ) ( not ( = ?auto_514859 ?auto_514863 ) ) ( not ( = ?auto_514860 ?auto_514861 ) ) ( not ( = ?auto_514860 ?auto_514862 ) ) ( not ( = ?auto_514860 ?auto_514863 ) ) ( not ( = ?auto_514861 ?auto_514862 ) ) ( not ( = ?auto_514861 ?auto_514863 ) ) ( not ( = ?auto_514862 ?auto_514863 ) ) ( ON ?auto_514861 ?auto_514862 ) ( ON ?auto_514860 ?auto_514861 ) ( ON ?auto_514859 ?auto_514860 ) ( ON ?auto_514858 ?auto_514859 ) ( ON ?auto_514857 ?auto_514858 ) ( ON ?auto_514856 ?auto_514857 ) ( ON ?auto_514855 ?auto_514856 ) ( ON ?auto_514854 ?auto_514855 ) ( ON ?auto_514853 ?auto_514854 ) ( ON ?auto_514852 ?auto_514853 ) ( ON ?auto_514851 ?auto_514852 ) ( CLEAR ?auto_514849 ) ( ON ?auto_514850 ?auto_514851 ) ( CLEAR ?auto_514850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_514847 ?auto_514848 ?auto_514849 ?auto_514850 )
      ( MAKE-16PILE ?auto_514847 ?auto_514848 ?auto_514849 ?auto_514850 ?auto_514851 ?auto_514852 ?auto_514853 ?auto_514854 ?auto_514855 ?auto_514856 ?auto_514857 ?auto_514858 ?auto_514859 ?auto_514860 ?auto_514861 ?auto_514862 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514880 - BLOCK
      ?auto_514881 - BLOCK
      ?auto_514882 - BLOCK
      ?auto_514883 - BLOCK
      ?auto_514884 - BLOCK
      ?auto_514885 - BLOCK
      ?auto_514886 - BLOCK
      ?auto_514887 - BLOCK
      ?auto_514888 - BLOCK
      ?auto_514889 - BLOCK
      ?auto_514890 - BLOCK
      ?auto_514891 - BLOCK
      ?auto_514892 - BLOCK
      ?auto_514893 - BLOCK
      ?auto_514894 - BLOCK
      ?auto_514895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514895 ) ( ON-TABLE ?auto_514880 ) ( ON ?auto_514881 ?auto_514880 ) ( ON ?auto_514882 ?auto_514881 ) ( not ( = ?auto_514880 ?auto_514881 ) ) ( not ( = ?auto_514880 ?auto_514882 ) ) ( not ( = ?auto_514880 ?auto_514883 ) ) ( not ( = ?auto_514880 ?auto_514884 ) ) ( not ( = ?auto_514880 ?auto_514885 ) ) ( not ( = ?auto_514880 ?auto_514886 ) ) ( not ( = ?auto_514880 ?auto_514887 ) ) ( not ( = ?auto_514880 ?auto_514888 ) ) ( not ( = ?auto_514880 ?auto_514889 ) ) ( not ( = ?auto_514880 ?auto_514890 ) ) ( not ( = ?auto_514880 ?auto_514891 ) ) ( not ( = ?auto_514880 ?auto_514892 ) ) ( not ( = ?auto_514880 ?auto_514893 ) ) ( not ( = ?auto_514880 ?auto_514894 ) ) ( not ( = ?auto_514880 ?auto_514895 ) ) ( not ( = ?auto_514881 ?auto_514882 ) ) ( not ( = ?auto_514881 ?auto_514883 ) ) ( not ( = ?auto_514881 ?auto_514884 ) ) ( not ( = ?auto_514881 ?auto_514885 ) ) ( not ( = ?auto_514881 ?auto_514886 ) ) ( not ( = ?auto_514881 ?auto_514887 ) ) ( not ( = ?auto_514881 ?auto_514888 ) ) ( not ( = ?auto_514881 ?auto_514889 ) ) ( not ( = ?auto_514881 ?auto_514890 ) ) ( not ( = ?auto_514881 ?auto_514891 ) ) ( not ( = ?auto_514881 ?auto_514892 ) ) ( not ( = ?auto_514881 ?auto_514893 ) ) ( not ( = ?auto_514881 ?auto_514894 ) ) ( not ( = ?auto_514881 ?auto_514895 ) ) ( not ( = ?auto_514882 ?auto_514883 ) ) ( not ( = ?auto_514882 ?auto_514884 ) ) ( not ( = ?auto_514882 ?auto_514885 ) ) ( not ( = ?auto_514882 ?auto_514886 ) ) ( not ( = ?auto_514882 ?auto_514887 ) ) ( not ( = ?auto_514882 ?auto_514888 ) ) ( not ( = ?auto_514882 ?auto_514889 ) ) ( not ( = ?auto_514882 ?auto_514890 ) ) ( not ( = ?auto_514882 ?auto_514891 ) ) ( not ( = ?auto_514882 ?auto_514892 ) ) ( not ( = ?auto_514882 ?auto_514893 ) ) ( not ( = ?auto_514882 ?auto_514894 ) ) ( not ( = ?auto_514882 ?auto_514895 ) ) ( not ( = ?auto_514883 ?auto_514884 ) ) ( not ( = ?auto_514883 ?auto_514885 ) ) ( not ( = ?auto_514883 ?auto_514886 ) ) ( not ( = ?auto_514883 ?auto_514887 ) ) ( not ( = ?auto_514883 ?auto_514888 ) ) ( not ( = ?auto_514883 ?auto_514889 ) ) ( not ( = ?auto_514883 ?auto_514890 ) ) ( not ( = ?auto_514883 ?auto_514891 ) ) ( not ( = ?auto_514883 ?auto_514892 ) ) ( not ( = ?auto_514883 ?auto_514893 ) ) ( not ( = ?auto_514883 ?auto_514894 ) ) ( not ( = ?auto_514883 ?auto_514895 ) ) ( not ( = ?auto_514884 ?auto_514885 ) ) ( not ( = ?auto_514884 ?auto_514886 ) ) ( not ( = ?auto_514884 ?auto_514887 ) ) ( not ( = ?auto_514884 ?auto_514888 ) ) ( not ( = ?auto_514884 ?auto_514889 ) ) ( not ( = ?auto_514884 ?auto_514890 ) ) ( not ( = ?auto_514884 ?auto_514891 ) ) ( not ( = ?auto_514884 ?auto_514892 ) ) ( not ( = ?auto_514884 ?auto_514893 ) ) ( not ( = ?auto_514884 ?auto_514894 ) ) ( not ( = ?auto_514884 ?auto_514895 ) ) ( not ( = ?auto_514885 ?auto_514886 ) ) ( not ( = ?auto_514885 ?auto_514887 ) ) ( not ( = ?auto_514885 ?auto_514888 ) ) ( not ( = ?auto_514885 ?auto_514889 ) ) ( not ( = ?auto_514885 ?auto_514890 ) ) ( not ( = ?auto_514885 ?auto_514891 ) ) ( not ( = ?auto_514885 ?auto_514892 ) ) ( not ( = ?auto_514885 ?auto_514893 ) ) ( not ( = ?auto_514885 ?auto_514894 ) ) ( not ( = ?auto_514885 ?auto_514895 ) ) ( not ( = ?auto_514886 ?auto_514887 ) ) ( not ( = ?auto_514886 ?auto_514888 ) ) ( not ( = ?auto_514886 ?auto_514889 ) ) ( not ( = ?auto_514886 ?auto_514890 ) ) ( not ( = ?auto_514886 ?auto_514891 ) ) ( not ( = ?auto_514886 ?auto_514892 ) ) ( not ( = ?auto_514886 ?auto_514893 ) ) ( not ( = ?auto_514886 ?auto_514894 ) ) ( not ( = ?auto_514886 ?auto_514895 ) ) ( not ( = ?auto_514887 ?auto_514888 ) ) ( not ( = ?auto_514887 ?auto_514889 ) ) ( not ( = ?auto_514887 ?auto_514890 ) ) ( not ( = ?auto_514887 ?auto_514891 ) ) ( not ( = ?auto_514887 ?auto_514892 ) ) ( not ( = ?auto_514887 ?auto_514893 ) ) ( not ( = ?auto_514887 ?auto_514894 ) ) ( not ( = ?auto_514887 ?auto_514895 ) ) ( not ( = ?auto_514888 ?auto_514889 ) ) ( not ( = ?auto_514888 ?auto_514890 ) ) ( not ( = ?auto_514888 ?auto_514891 ) ) ( not ( = ?auto_514888 ?auto_514892 ) ) ( not ( = ?auto_514888 ?auto_514893 ) ) ( not ( = ?auto_514888 ?auto_514894 ) ) ( not ( = ?auto_514888 ?auto_514895 ) ) ( not ( = ?auto_514889 ?auto_514890 ) ) ( not ( = ?auto_514889 ?auto_514891 ) ) ( not ( = ?auto_514889 ?auto_514892 ) ) ( not ( = ?auto_514889 ?auto_514893 ) ) ( not ( = ?auto_514889 ?auto_514894 ) ) ( not ( = ?auto_514889 ?auto_514895 ) ) ( not ( = ?auto_514890 ?auto_514891 ) ) ( not ( = ?auto_514890 ?auto_514892 ) ) ( not ( = ?auto_514890 ?auto_514893 ) ) ( not ( = ?auto_514890 ?auto_514894 ) ) ( not ( = ?auto_514890 ?auto_514895 ) ) ( not ( = ?auto_514891 ?auto_514892 ) ) ( not ( = ?auto_514891 ?auto_514893 ) ) ( not ( = ?auto_514891 ?auto_514894 ) ) ( not ( = ?auto_514891 ?auto_514895 ) ) ( not ( = ?auto_514892 ?auto_514893 ) ) ( not ( = ?auto_514892 ?auto_514894 ) ) ( not ( = ?auto_514892 ?auto_514895 ) ) ( not ( = ?auto_514893 ?auto_514894 ) ) ( not ( = ?auto_514893 ?auto_514895 ) ) ( not ( = ?auto_514894 ?auto_514895 ) ) ( ON ?auto_514894 ?auto_514895 ) ( ON ?auto_514893 ?auto_514894 ) ( ON ?auto_514892 ?auto_514893 ) ( ON ?auto_514891 ?auto_514892 ) ( ON ?auto_514890 ?auto_514891 ) ( ON ?auto_514889 ?auto_514890 ) ( ON ?auto_514888 ?auto_514889 ) ( ON ?auto_514887 ?auto_514888 ) ( ON ?auto_514886 ?auto_514887 ) ( ON ?auto_514885 ?auto_514886 ) ( ON ?auto_514884 ?auto_514885 ) ( CLEAR ?auto_514882 ) ( ON ?auto_514883 ?auto_514884 ) ( CLEAR ?auto_514883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_514880 ?auto_514881 ?auto_514882 ?auto_514883 )
      ( MAKE-16PILE ?auto_514880 ?auto_514881 ?auto_514882 ?auto_514883 ?auto_514884 ?auto_514885 ?auto_514886 ?auto_514887 ?auto_514888 ?auto_514889 ?auto_514890 ?auto_514891 ?auto_514892 ?auto_514893 ?auto_514894 ?auto_514895 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514912 - BLOCK
      ?auto_514913 - BLOCK
      ?auto_514914 - BLOCK
      ?auto_514915 - BLOCK
      ?auto_514916 - BLOCK
      ?auto_514917 - BLOCK
      ?auto_514918 - BLOCK
      ?auto_514919 - BLOCK
      ?auto_514920 - BLOCK
      ?auto_514921 - BLOCK
      ?auto_514922 - BLOCK
      ?auto_514923 - BLOCK
      ?auto_514924 - BLOCK
      ?auto_514925 - BLOCK
      ?auto_514926 - BLOCK
      ?auto_514927 - BLOCK
    )
    :vars
    (
      ?auto_514928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514927 ?auto_514928 ) ( ON-TABLE ?auto_514912 ) ( ON ?auto_514913 ?auto_514912 ) ( not ( = ?auto_514912 ?auto_514913 ) ) ( not ( = ?auto_514912 ?auto_514914 ) ) ( not ( = ?auto_514912 ?auto_514915 ) ) ( not ( = ?auto_514912 ?auto_514916 ) ) ( not ( = ?auto_514912 ?auto_514917 ) ) ( not ( = ?auto_514912 ?auto_514918 ) ) ( not ( = ?auto_514912 ?auto_514919 ) ) ( not ( = ?auto_514912 ?auto_514920 ) ) ( not ( = ?auto_514912 ?auto_514921 ) ) ( not ( = ?auto_514912 ?auto_514922 ) ) ( not ( = ?auto_514912 ?auto_514923 ) ) ( not ( = ?auto_514912 ?auto_514924 ) ) ( not ( = ?auto_514912 ?auto_514925 ) ) ( not ( = ?auto_514912 ?auto_514926 ) ) ( not ( = ?auto_514912 ?auto_514927 ) ) ( not ( = ?auto_514912 ?auto_514928 ) ) ( not ( = ?auto_514913 ?auto_514914 ) ) ( not ( = ?auto_514913 ?auto_514915 ) ) ( not ( = ?auto_514913 ?auto_514916 ) ) ( not ( = ?auto_514913 ?auto_514917 ) ) ( not ( = ?auto_514913 ?auto_514918 ) ) ( not ( = ?auto_514913 ?auto_514919 ) ) ( not ( = ?auto_514913 ?auto_514920 ) ) ( not ( = ?auto_514913 ?auto_514921 ) ) ( not ( = ?auto_514913 ?auto_514922 ) ) ( not ( = ?auto_514913 ?auto_514923 ) ) ( not ( = ?auto_514913 ?auto_514924 ) ) ( not ( = ?auto_514913 ?auto_514925 ) ) ( not ( = ?auto_514913 ?auto_514926 ) ) ( not ( = ?auto_514913 ?auto_514927 ) ) ( not ( = ?auto_514913 ?auto_514928 ) ) ( not ( = ?auto_514914 ?auto_514915 ) ) ( not ( = ?auto_514914 ?auto_514916 ) ) ( not ( = ?auto_514914 ?auto_514917 ) ) ( not ( = ?auto_514914 ?auto_514918 ) ) ( not ( = ?auto_514914 ?auto_514919 ) ) ( not ( = ?auto_514914 ?auto_514920 ) ) ( not ( = ?auto_514914 ?auto_514921 ) ) ( not ( = ?auto_514914 ?auto_514922 ) ) ( not ( = ?auto_514914 ?auto_514923 ) ) ( not ( = ?auto_514914 ?auto_514924 ) ) ( not ( = ?auto_514914 ?auto_514925 ) ) ( not ( = ?auto_514914 ?auto_514926 ) ) ( not ( = ?auto_514914 ?auto_514927 ) ) ( not ( = ?auto_514914 ?auto_514928 ) ) ( not ( = ?auto_514915 ?auto_514916 ) ) ( not ( = ?auto_514915 ?auto_514917 ) ) ( not ( = ?auto_514915 ?auto_514918 ) ) ( not ( = ?auto_514915 ?auto_514919 ) ) ( not ( = ?auto_514915 ?auto_514920 ) ) ( not ( = ?auto_514915 ?auto_514921 ) ) ( not ( = ?auto_514915 ?auto_514922 ) ) ( not ( = ?auto_514915 ?auto_514923 ) ) ( not ( = ?auto_514915 ?auto_514924 ) ) ( not ( = ?auto_514915 ?auto_514925 ) ) ( not ( = ?auto_514915 ?auto_514926 ) ) ( not ( = ?auto_514915 ?auto_514927 ) ) ( not ( = ?auto_514915 ?auto_514928 ) ) ( not ( = ?auto_514916 ?auto_514917 ) ) ( not ( = ?auto_514916 ?auto_514918 ) ) ( not ( = ?auto_514916 ?auto_514919 ) ) ( not ( = ?auto_514916 ?auto_514920 ) ) ( not ( = ?auto_514916 ?auto_514921 ) ) ( not ( = ?auto_514916 ?auto_514922 ) ) ( not ( = ?auto_514916 ?auto_514923 ) ) ( not ( = ?auto_514916 ?auto_514924 ) ) ( not ( = ?auto_514916 ?auto_514925 ) ) ( not ( = ?auto_514916 ?auto_514926 ) ) ( not ( = ?auto_514916 ?auto_514927 ) ) ( not ( = ?auto_514916 ?auto_514928 ) ) ( not ( = ?auto_514917 ?auto_514918 ) ) ( not ( = ?auto_514917 ?auto_514919 ) ) ( not ( = ?auto_514917 ?auto_514920 ) ) ( not ( = ?auto_514917 ?auto_514921 ) ) ( not ( = ?auto_514917 ?auto_514922 ) ) ( not ( = ?auto_514917 ?auto_514923 ) ) ( not ( = ?auto_514917 ?auto_514924 ) ) ( not ( = ?auto_514917 ?auto_514925 ) ) ( not ( = ?auto_514917 ?auto_514926 ) ) ( not ( = ?auto_514917 ?auto_514927 ) ) ( not ( = ?auto_514917 ?auto_514928 ) ) ( not ( = ?auto_514918 ?auto_514919 ) ) ( not ( = ?auto_514918 ?auto_514920 ) ) ( not ( = ?auto_514918 ?auto_514921 ) ) ( not ( = ?auto_514918 ?auto_514922 ) ) ( not ( = ?auto_514918 ?auto_514923 ) ) ( not ( = ?auto_514918 ?auto_514924 ) ) ( not ( = ?auto_514918 ?auto_514925 ) ) ( not ( = ?auto_514918 ?auto_514926 ) ) ( not ( = ?auto_514918 ?auto_514927 ) ) ( not ( = ?auto_514918 ?auto_514928 ) ) ( not ( = ?auto_514919 ?auto_514920 ) ) ( not ( = ?auto_514919 ?auto_514921 ) ) ( not ( = ?auto_514919 ?auto_514922 ) ) ( not ( = ?auto_514919 ?auto_514923 ) ) ( not ( = ?auto_514919 ?auto_514924 ) ) ( not ( = ?auto_514919 ?auto_514925 ) ) ( not ( = ?auto_514919 ?auto_514926 ) ) ( not ( = ?auto_514919 ?auto_514927 ) ) ( not ( = ?auto_514919 ?auto_514928 ) ) ( not ( = ?auto_514920 ?auto_514921 ) ) ( not ( = ?auto_514920 ?auto_514922 ) ) ( not ( = ?auto_514920 ?auto_514923 ) ) ( not ( = ?auto_514920 ?auto_514924 ) ) ( not ( = ?auto_514920 ?auto_514925 ) ) ( not ( = ?auto_514920 ?auto_514926 ) ) ( not ( = ?auto_514920 ?auto_514927 ) ) ( not ( = ?auto_514920 ?auto_514928 ) ) ( not ( = ?auto_514921 ?auto_514922 ) ) ( not ( = ?auto_514921 ?auto_514923 ) ) ( not ( = ?auto_514921 ?auto_514924 ) ) ( not ( = ?auto_514921 ?auto_514925 ) ) ( not ( = ?auto_514921 ?auto_514926 ) ) ( not ( = ?auto_514921 ?auto_514927 ) ) ( not ( = ?auto_514921 ?auto_514928 ) ) ( not ( = ?auto_514922 ?auto_514923 ) ) ( not ( = ?auto_514922 ?auto_514924 ) ) ( not ( = ?auto_514922 ?auto_514925 ) ) ( not ( = ?auto_514922 ?auto_514926 ) ) ( not ( = ?auto_514922 ?auto_514927 ) ) ( not ( = ?auto_514922 ?auto_514928 ) ) ( not ( = ?auto_514923 ?auto_514924 ) ) ( not ( = ?auto_514923 ?auto_514925 ) ) ( not ( = ?auto_514923 ?auto_514926 ) ) ( not ( = ?auto_514923 ?auto_514927 ) ) ( not ( = ?auto_514923 ?auto_514928 ) ) ( not ( = ?auto_514924 ?auto_514925 ) ) ( not ( = ?auto_514924 ?auto_514926 ) ) ( not ( = ?auto_514924 ?auto_514927 ) ) ( not ( = ?auto_514924 ?auto_514928 ) ) ( not ( = ?auto_514925 ?auto_514926 ) ) ( not ( = ?auto_514925 ?auto_514927 ) ) ( not ( = ?auto_514925 ?auto_514928 ) ) ( not ( = ?auto_514926 ?auto_514927 ) ) ( not ( = ?auto_514926 ?auto_514928 ) ) ( not ( = ?auto_514927 ?auto_514928 ) ) ( ON ?auto_514926 ?auto_514927 ) ( ON ?auto_514925 ?auto_514926 ) ( ON ?auto_514924 ?auto_514925 ) ( ON ?auto_514923 ?auto_514924 ) ( ON ?auto_514922 ?auto_514923 ) ( ON ?auto_514921 ?auto_514922 ) ( ON ?auto_514920 ?auto_514921 ) ( ON ?auto_514919 ?auto_514920 ) ( ON ?auto_514918 ?auto_514919 ) ( ON ?auto_514917 ?auto_514918 ) ( ON ?auto_514916 ?auto_514917 ) ( ON ?auto_514915 ?auto_514916 ) ( CLEAR ?auto_514913 ) ( ON ?auto_514914 ?auto_514915 ) ( CLEAR ?auto_514914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_514912 ?auto_514913 ?auto_514914 )
      ( MAKE-16PILE ?auto_514912 ?auto_514913 ?auto_514914 ?auto_514915 ?auto_514916 ?auto_514917 ?auto_514918 ?auto_514919 ?auto_514920 ?auto_514921 ?auto_514922 ?auto_514923 ?auto_514924 ?auto_514925 ?auto_514926 ?auto_514927 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514945 - BLOCK
      ?auto_514946 - BLOCK
      ?auto_514947 - BLOCK
      ?auto_514948 - BLOCK
      ?auto_514949 - BLOCK
      ?auto_514950 - BLOCK
      ?auto_514951 - BLOCK
      ?auto_514952 - BLOCK
      ?auto_514953 - BLOCK
      ?auto_514954 - BLOCK
      ?auto_514955 - BLOCK
      ?auto_514956 - BLOCK
      ?auto_514957 - BLOCK
      ?auto_514958 - BLOCK
      ?auto_514959 - BLOCK
      ?auto_514960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_514960 ) ( ON-TABLE ?auto_514945 ) ( ON ?auto_514946 ?auto_514945 ) ( not ( = ?auto_514945 ?auto_514946 ) ) ( not ( = ?auto_514945 ?auto_514947 ) ) ( not ( = ?auto_514945 ?auto_514948 ) ) ( not ( = ?auto_514945 ?auto_514949 ) ) ( not ( = ?auto_514945 ?auto_514950 ) ) ( not ( = ?auto_514945 ?auto_514951 ) ) ( not ( = ?auto_514945 ?auto_514952 ) ) ( not ( = ?auto_514945 ?auto_514953 ) ) ( not ( = ?auto_514945 ?auto_514954 ) ) ( not ( = ?auto_514945 ?auto_514955 ) ) ( not ( = ?auto_514945 ?auto_514956 ) ) ( not ( = ?auto_514945 ?auto_514957 ) ) ( not ( = ?auto_514945 ?auto_514958 ) ) ( not ( = ?auto_514945 ?auto_514959 ) ) ( not ( = ?auto_514945 ?auto_514960 ) ) ( not ( = ?auto_514946 ?auto_514947 ) ) ( not ( = ?auto_514946 ?auto_514948 ) ) ( not ( = ?auto_514946 ?auto_514949 ) ) ( not ( = ?auto_514946 ?auto_514950 ) ) ( not ( = ?auto_514946 ?auto_514951 ) ) ( not ( = ?auto_514946 ?auto_514952 ) ) ( not ( = ?auto_514946 ?auto_514953 ) ) ( not ( = ?auto_514946 ?auto_514954 ) ) ( not ( = ?auto_514946 ?auto_514955 ) ) ( not ( = ?auto_514946 ?auto_514956 ) ) ( not ( = ?auto_514946 ?auto_514957 ) ) ( not ( = ?auto_514946 ?auto_514958 ) ) ( not ( = ?auto_514946 ?auto_514959 ) ) ( not ( = ?auto_514946 ?auto_514960 ) ) ( not ( = ?auto_514947 ?auto_514948 ) ) ( not ( = ?auto_514947 ?auto_514949 ) ) ( not ( = ?auto_514947 ?auto_514950 ) ) ( not ( = ?auto_514947 ?auto_514951 ) ) ( not ( = ?auto_514947 ?auto_514952 ) ) ( not ( = ?auto_514947 ?auto_514953 ) ) ( not ( = ?auto_514947 ?auto_514954 ) ) ( not ( = ?auto_514947 ?auto_514955 ) ) ( not ( = ?auto_514947 ?auto_514956 ) ) ( not ( = ?auto_514947 ?auto_514957 ) ) ( not ( = ?auto_514947 ?auto_514958 ) ) ( not ( = ?auto_514947 ?auto_514959 ) ) ( not ( = ?auto_514947 ?auto_514960 ) ) ( not ( = ?auto_514948 ?auto_514949 ) ) ( not ( = ?auto_514948 ?auto_514950 ) ) ( not ( = ?auto_514948 ?auto_514951 ) ) ( not ( = ?auto_514948 ?auto_514952 ) ) ( not ( = ?auto_514948 ?auto_514953 ) ) ( not ( = ?auto_514948 ?auto_514954 ) ) ( not ( = ?auto_514948 ?auto_514955 ) ) ( not ( = ?auto_514948 ?auto_514956 ) ) ( not ( = ?auto_514948 ?auto_514957 ) ) ( not ( = ?auto_514948 ?auto_514958 ) ) ( not ( = ?auto_514948 ?auto_514959 ) ) ( not ( = ?auto_514948 ?auto_514960 ) ) ( not ( = ?auto_514949 ?auto_514950 ) ) ( not ( = ?auto_514949 ?auto_514951 ) ) ( not ( = ?auto_514949 ?auto_514952 ) ) ( not ( = ?auto_514949 ?auto_514953 ) ) ( not ( = ?auto_514949 ?auto_514954 ) ) ( not ( = ?auto_514949 ?auto_514955 ) ) ( not ( = ?auto_514949 ?auto_514956 ) ) ( not ( = ?auto_514949 ?auto_514957 ) ) ( not ( = ?auto_514949 ?auto_514958 ) ) ( not ( = ?auto_514949 ?auto_514959 ) ) ( not ( = ?auto_514949 ?auto_514960 ) ) ( not ( = ?auto_514950 ?auto_514951 ) ) ( not ( = ?auto_514950 ?auto_514952 ) ) ( not ( = ?auto_514950 ?auto_514953 ) ) ( not ( = ?auto_514950 ?auto_514954 ) ) ( not ( = ?auto_514950 ?auto_514955 ) ) ( not ( = ?auto_514950 ?auto_514956 ) ) ( not ( = ?auto_514950 ?auto_514957 ) ) ( not ( = ?auto_514950 ?auto_514958 ) ) ( not ( = ?auto_514950 ?auto_514959 ) ) ( not ( = ?auto_514950 ?auto_514960 ) ) ( not ( = ?auto_514951 ?auto_514952 ) ) ( not ( = ?auto_514951 ?auto_514953 ) ) ( not ( = ?auto_514951 ?auto_514954 ) ) ( not ( = ?auto_514951 ?auto_514955 ) ) ( not ( = ?auto_514951 ?auto_514956 ) ) ( not ( = ?auto_514951 ?auto_514957 ) ) ( not ( = ?auto_514951 ?auto_514958 ) ) ( not ( = ?auto_514951 ?auto_514959 ) ) ( not ( = ?auto_514951 ?auto_514960 ) ) ( not ( = ?auto_514952 ?auto_514953 ) ) ( not ( = ?auto_514952 ?auto_514954 ) ) ( not ( = ?auto_514952 ?auto_514955 ) ) ( not ( = ?auto_514952 ?auto_514956 ) ) ( not ( = ?auto_514952 ?auto_514957 ) ) ( not ( = ?auto_514952 ?auto_514958 ) ) ( not ( = ?auto_514952 ?auto_514959 ) ) ( not ( = ?auto_514952 ?auto_514960 ) ) ( not ( = ?auto_514953 ?auto_514954 ) ) ( not ( = ?auto_514953 ?auto_514955 ) ) ( not ( = ?auto_514953 ?auto_514956 ) ) ( not ( = ?auto_514953 ?auto_514957 ) ) ( not ( = ?auto_514953 ?auto_514958 ) ) ( not ( = ?auto_514953 ?auto_514959 ) ) ( not ( = ?auto_514953 ?auto_514960 ) ) ( not ( = ?auto_514954 ?auto_514955 ) ) ( not ( = ?auto_514954 ?auto_514956 ) ) ( not ( = ?auto_514954 ?auto_514957 ) ) ( not ( = ?auto_514954 ?auto_514958 ) ) ( not ( = ?auto_514954 ?auto_514959 ) ) ( not ( = ?auto_514954 ?auto_514960 ) ) ( not ( = ?auto_514955 ?auto_514956 ) ) ( not ( = ?auto_514955 ?auto_514957 ) ) ( not ( = ?auto_514955 ?auto_514958 ) ) ( not ( = ?auto_514955 ?auto_514959 ) ) ( not ( = ?auto_514955 ?auto_514960 ) ) ( not ( = ?auto_514956 ?auto_514957 ) ) ( not ( = ?auto_514956 ?auto_514958 ) ) ( not ( = ?auto_514956 ?auto_514959 ) ) ( not ( = ?auto_514956 ?auto_514960 ) ) ( not ( = ?auto_514957 ?auto_514958 ) ) ( not ( = ?auto_514957 ?auto_514959 ) ) ( not ( = ?auto_514957 ?auto_514960 ) ) ( not ( = ?auto_514958 ?auto_514959 ) ) ( not ( = ?auto_514958 ?auto_514960 ) ) ( not ( = ?auto_514959 ?auto_514960 ) ) ( ON ?auto_514959 ?auto_514960 ) ( ON ?auto_514958 ?auto_514959 ) ( ON ?auto_514957 ?auto_514958 ) ( ON ?auto_514956 ?auto_514957 ) ( ON ?auto_514955 ?auto_514956 ) ( ON ?auto_514954 ?auto_514955 ) ( ON ?auto_514953 ?auto_514954 ) ( ON ?auto_514952 ?auto_514953 ) ( ON ?auto_514951 ?auto_514952 ) ( ON ?auto_514950 ?auto_514951 ) ( ON ?auto_514949 ?auto_514950 ) ( ON ?auto_514948 ?auto_514949 ) ( CLEAR ?auto_514946 ) ( ON ?auto_514947 ?auto_514948 ) ( CLEAR ?auto_514947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_514945 ?auto_514946 ?auto_514947 )
      ( MAKE-16PILE ?auto_514945 ?auto_514946 ?auto_514947 ?auto_514948 ?auto_514949 ?auto_514950 ?auto_514951 ?auto_514952 ?auto_514953 ?auto_514954 ?auto_514955 ?auto_514956 ?auto_514957 ?auto_514958 ?auto_514959 ?auto_514960 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_514977 - BLOCK
      ?auto_514978 - BLOCK
      ?auto_514979 - BLOCK
      ?auto_514980 - BLOCK
      ?auto_514981 - BLOCK
      ?auto_514982 - BLOCK
      ?auto_514983 - BLOCK
      ?auto_514984 - BLOCK
      ?auto_514985 - BLOCK
      ?auto_514986 - BLOCK
      ?auto_514987 - BLOCK
      ?auto_514988 - BLOCK
      ?auto_514989 - BLOCK
      ?auto_514990 - BLOCK
      ?auto_514991 - BLOCK
      ?auto_514992 - BLOCK
    )
    :vars
    (
      ?auto_514993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_514992 ?auto_514993 ) ( ON-TABLE ?auto_514977 ) ( not ( = ?auto_514977 ?auto_514978 ) ) ( not ( = ?auto_514977 ?auto_514979 ) ) ( not ( = ?auto_514977 ?auto_514980 ) ) ( not ( = ?auto_514977 ?auto_514981 ) ) ( not ( = ?auto_514977 ?auto_514982 ) ) ( not ( = ?auto_514977 ?auto_514983 ) ) ( not ( = ?auto_514977 ?auto_514984 ) ) ( not ( = ?auto_514977 ?auto_514985 ) ) ( not ( = ?auto_514977 ?auto_514986 ) ) ( not ( = ?auto_514977 ?auto_514987 ) ) ( not ( = ?auto_514977 ?auto_514988 ) ) ( not ( = ?auto_514977 ?auto_514989 ) ) ( not ( = ?auto_514977 ?auto_514990 ) ) ( not ( = ?auto_514977 ?auto_514991 ) ) ( not ( = ?auto_514977 ?auto_514992 ) ) ( not ( = ?auto_514977 ?auto_514993 ) ) ( not ( = ?auto_514978 ?auto_514979 ) ) ( not ( = ?auto_514978 ?auto_514980 ) ) ( not ( = ?auto_514978 ?auto_514981 ) ) ( not ( = ?auto_514978 ?auto_514982 ) ) ( not ( = ?auto_514978 ?auto_514983 ) ) ( not ( = ?auto_514978 ?auto_514984 ) ) ( not ( = ?auto_514978 ?auto_514985 ) ) ( not ( = ?auto_514978 ?auto_514986 ) ) ( not ( = ?auto_514978 ?auto_514987 ) ) ( not ( = ?auto_514978 ?auto_514988 ) ) ( not ( = ?auto_514978 ?auto_514989 ) ) ( not ( = ?auto_514978 ?auto_514990 ) ) ( not ( = ?auto_514978 ?auto_514991 ) ) ( not ( = ?auto_514978 ?auto_514992 ) ) ( not ( = ?auto_514978 ?auto_514993 ) ) ( not ( = ?auto_514979 ?auto_514980 ) ) ( not ( = ?auto_514979 ?auto_514981 ) ) ( not ( = ?auto_514979 ?auto_514982 ) ) ( not ( = ?auto_514979 ?auto_514983 ) ) ( not ( = ?auto_514979 ?auto_514984 ) ) ( not ( = ?auto_514979 ?auto_514985 ) ) ( not ( = ?auto_514979 ?auto_514986 ) ) ( not ( = ?auto_514979 ?auto_514987 ) ) ( not ( = ?auto_514979 ?auto_514988 ) ) ( not ( = ?auto_514979 ?auto_514989 ) ) ( not ( = ?auto_514979 ?auto_514990 ) ) ( not ( = ?auto_514979 ?auto_514991 ) ) ( not ( = ?auto_514979 ?auto_514992 ) ) ( not ( = ?auto_514979 ?auto_514993 ) ) ( not ( = ?auto_514980 ?auto_514981 ) ) ( not ( = ?auto_514980 ?auto_514982 ) ) ( not ( = ?auto_514980 ?auto_514983 ) ) ( not ( = ?auto_514980 ?auto_514984 ) ) ( not ( = ?auto_514980 ?auto_514985 ) ) ( not ( = ?auto_514980 ?auto_514986 ) ) ( not ( = ?auto_514980 ?auto_514987 ) ) ( not ( = ?auto_514980 ?auto_514988 ) ) ( not ( = ?auto_514980 ?auto_514989 ) ) ( not ( = ?auto_514980 ?auto_514990 ) ) ( not ( = ?auto_514980 ?auto_514991 ) ) ( not ( = ?auto_514980 ?auto_514992 ) ) ( not ( = ?auto_514980 ?auto_514993 ) ) ( not ( = ?auto_514981 ?auto_514982 ) ) ( not ( = ?auto_514981 ?auto_514983 ) ) ( not ( = ?auto_514981 ?auto_514984 ) ) ( not ( = ?auto_514981 ?auto_514985 ) ) ( not ( = ?auto_514981 ?auto_514986 ) ) ( not ( = ?auto_514981 ?auto_514987 ) ) ( not ( = ?auto_514981 ?auto_514988 ) ) ( not ( = ?auto_514981 ?auto_514989 ) ) ( not ( = ?auto_514981 ?auto_514990 ) ) ( not ( = ?auto_514981 ?auto_514991 ) ) ( not ( = ?auto_514981 ?auto_514992 ) ) ( not ( = ?auto_514981 ?auto_514993 ) ) ( not ( = ?auto_514982 ?auto_514983 ) ) ( not ( = ?auto_514982 ?auto_514984 ) ) ( not ( = ?auto_514982 ?auto_514985 ) ) ( not ( = ?auto_514982 ?auto_514986 ) ) ( not ( = ?auto_514982 ?auto_514987 ) ) ( not ( = ?auto_514982 ?auto_514988 ) ) ( not ( = ?auto_514982 ?auto_514989 ) ) ( not ( = ?auto_514982 ?auto_514990 ) ) ( not ( = ?auto_514982 ?auto_514991 ) ) ( not ( = ?auto_514982 ?auto_514992 ) ) ( not ( = ?auto_514982 ?auto_514993 ) ) ( not ( = ?auto_514983 ?auto_514984 ) ) ( not ( = ?auto_514983 ?auto_514985 ) ) ( not ( = ?auto_514983 ?auto_514986 ) ) ( not ( = ?auto_514983 ?auto_514987 ) ) ( not ( = ?auto_514983 ?auto_514988 ) ) ( not ( = ?auto_514983 ?auto_514989 ) ) ( not ( = ?auto_514983 ?auto_514990 ) ) ( not ( = ?auto_514983 ?auto_514991 ) ) ( not ( = ?auto_514983 ?auto_514992 ) ) ( not ( = ?auto_514983 ?auto_514993 ) ) ( not ( = ?auto_514984 ?auto_514985 ) ) ( not ( = ?auto_514984 ?auto_514986 ) ) ( not ( = ?auto_514984 ?auto_514987 ) ) ( not ( = ?auto_514984 ?auto_514988 ) ) ( not ( = ?auto_514984 ?auto_514989 ) ) ( not ( = ?auto_514984 ?auto_514990 ) ) ( not ( = ?auto_514984 ?auto_514991 ) ) ( not ( = ?auto_514984 ?auto_514992 ) ) ( not ( = ?auto_514984 ?auto_514993 ) ) ( not ( = ?auto_514985 ?auto_514986 ) ) ( not ( = ?auto_514985 ?auto_514987 ) ) ( not ( = ?auto_514985 ?auto_514988 ) ) ( not ( = ?auto_514985 ?auto_514989 ) ) ( not ( = ?auto_514985 ?auto_514990 ) ) ( not ( = ?auto_514985 ?auto_514991 ) ) ( not ( = ?auto_514985 ?auto_514992 ) ) ( not ( = ?auto_514985 ?auto_514993 ) ) ( not ( = ?auto_514986 ?auto_514987 ) ) ( not ( = ?auto_514986 ?auto_514988 ) ) ( not ( = ?auto_514986 ?auto_514989 ) ) ( not ( = ?auto_514986 ?auto_514990 ) ) ( not ( = ?auto_514986 ?auto_514991 ) ) ( not ( = ?auto_514986 ?auto_514992 ) ) ( not ( = ?auto_514986 ?auto_514993 ) ) ( not ( = ?auto_514987 ?auto_514988 ) ) ( not ( = ?auto_514987 ?auto_514989 ) ) ( not ( = ?auto_514987 ?auto_514990 ) ) ( not ( = ?auto_514987 ?auto_514991 ) ) ( not ( = ?auto_514987 ?auto_514992 ) ) ( not ( = ?auto_514987 ?auto_514993 ) ) ( not ( = ?auto_514988 ?auto_514989 ) ) ( not ( = ?auto_514988 ?auto_514990 ) ) ( not ( = ?auto_514988 ?auto_514991 ) ) ( not ( = ?auto_514988 ?auto_514992 ) ) ( not ( = ?auto_514988 ?auto_514993 ) ) ( not ( = ?auto_514989 ?auto_514990 ) ) ( not ( = ?auto_514989 ?auto_514991 ) ) ( not ( = ?auto_514989 ?auto_514992 ) ) ( not ( = ?auto_514989 ?auto_514993 ) ) ( not ( = ?auto_514990 ?auto_514991 ) ) ( not ( = ?auto_514990 ?auto_514992 ) ) ( not ( = ?auto_514990 ?auto_514993 ) ) ( not ( = ?auto_514991 ?auto_514992 ) ) ( not ( = ?auto_514991 ?auto_514993 ) ) ( not ( = ?auto_514992 ?auto_514993 ) ) ( ON ?auto_514991 ?auto_514992 ) ( ON ?auto_514990 ?auto_514991 ) ( ON ?auto_514989 ?auto_514990 ) ( ON ?auto_514988 ?auto_514989 ) ( ON ?auto_514987 ?auto_514988 ) ( ON ?auto_514986 ?auto_514987 ) ( ON ?auto_514985 ?auto_514986 ) ( ON ?auto_514984 ?auto_514985 ) ( ON ?auto_514983 ?auto_514984 ) ( ON ?auto_514982 ?auto_514983 ) ( ON ?auto_514981 ?auto_514982 ) ( ON ?auto_514980 ?auto_514981 ) ( ON ?auto_514979 ?auto_514980 ) ( CLEAR ?auto_514977 ) ( ON ?auto_514978 ?auto_514979 ) ( CLEAR ?auto_514978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_514977 ?auto_514978 )
      ( MAKE-16PILE ?auto_514977 ?auto_514978 ?auto_514979 ?auto_514980 ?auto_514981 ?auto_514982 ?auto_514983 ?auto_514984 ?auto_514985 ?auto_514986 ?auto_514987 ?auto_514988 ?auto_514989 ?auto_514990 ?auto_514991 ?auto_514992 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_515010 - BLOCK
      ?auto_515011 - BLOCK
      ?auto_515012 - BLOCK
      ?auto_515013 - BLOCK
      ?auto_515014 - BLOCK
      ?auto_515015 - BLOCK
      ?auto_515016 - BLOCK
      ?auto_515017 - BLOCK
      ?auto_515018 - BLOCK
      ?auto_515019 - BLOCK
      ?auto_515020 - BLOCK
      ?auto_515021 - BLOCK
      ?auto_515022 - BLOCK
      ?auto_515023 - BLOCK
      ?auto_515024 - BLOCK
      ?auto_515025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_515025 ) ( ON-TABLE ?auto_515010 ) ( not ( = ?auto_515010 ?auto_515011 ) ) ( not ( = ?auto_515010 ?auto_515012 ) ) ( not ( = ?auto_515010 ?auto_515013 ) ) ( not ( = ?auto_515010 ?auto_515014 ) ) ( not ( = ?auto_515010 ?auto_515015 ) ) ( not ( = ?auto_515010 ?auto_515016 ) ) ( not ( = ?auto_515010 ?auto_515017 ) ) ( not ( = ?auto_515010 ?auto_515018 ) ) ( not ( = ?auto_515010 ?auto_515019 ) ) ( not ( = ?auto_515010 ?auto_515020 ) ) ( not ( = ?auto_515010 ?auto_515021 ) ) ( not ( = ?auto_515010 ?auto_515022 ) ) ( not ( = ?auto_515010 ?auto_515023 ) ) ( not ( = ?auto_515010 ?auto_515024 ) ) ( not ( = ?auto_515010 ?auto_515025 ) ) ( not ( = ?auto_515011 ?auto_515012 ) ) ( not ( = ?auto_515011 ?auto_515013 ) ) ( not ( = ?auto_515011 ?auto_515014 ) ) ( not ( = ?auto_515011 ?auto_515015 ) ) ( not ( = ?auto_515011 ?auto_515016 ) ) ( not ( = ?auto_515011 ?auto_515017 ) ) ( not ( = ?auto_515011 ?auto_515018 ) ) ( not ( = ?auto_515011 ?auto_515019 ) ) ( not ( = ?auto_515011 ?auto_515020 ) ) ( not ( = ?auto_515011 ?auto_515021 ) ) ( not ( = ?auto_515011 ?auto_515022 ) ) ( not ( = ?auto_515011 ?auto_515023 ) ) ( not ( = ?auto_515011 ?auto_515024 ) ) ( not ( = ?auto_515011 ?auto_515025 ) ) ( not ( = ?auto_515012 ?auto_515013 ) ) ( not ( = ?auto_515012 ?auto_515014 ) ) ( not ( = ?auto_515012 ?auto_515015 ) ) ( not ( = ?auto_515012 ?auto_515016 ) ) ( not ( = ?auto_515012 ?auto_515017 ) ) ( not ( = ?auto_515012 ?auto_515018 ) ) ( not ( = ?auto_515012 ?auto_515019 ) ) ( not ( = ?auto_515012 ?auto_515020 ) ) ( not ( = ?auto_515012 ?auto_515021 ) ) ( not ( = ?auto_515012 ?auto_515022 ) ) ( not ( = ?auto_515012 ?auto_515023 ) ) ( not ( = ?auto_515012 ?auto_515024 ) ) ( not ( = ?auto_515012 ?auto_515025 ) ) ( not ( = ?auto_515013 ?auto_515014 ) ) ( not ( = ?auto_515013 ?auto_515015 ) ) ( not ( = ?auto_515013 ?auto_515016 ) ) ( not ( = ?auto_515013 ?auto_515017 ) ) ( not ( = ?auto_515013 ?auto_515018 ) ) ( not ( = ?auto_515013 ?auto_515019 ) ) ( not ( = ?auto_515013 ?auto_515020 ) ) ( not ( = ?auto_515013 ?auto_515021 ) ) ( not ( = ?auto_515013 ?auto_515022 ) ) ( not ( = ?auto_515013 ?auto_515023 ) ) ( not ( = ?auto_515013 ?auto_515024 ) ) ( not ( = ?auto_515013 ?auto_515025 ) ) ( not ( = ?auto_515014 ?auto_515015 ) ) ( not ( = ?auto_515014 ?auto_515016 ) ) ( not ( = ?auto_515014 ?auto_515017 ) ) ( not ( = ?auto_515014 ?auto_515018 ) ) ( not ( = ?auto_515014 ?auto_515019 ) ) ( not ( = ?auto_515014 ?auto_515020 ) ) ( not ( = ?auto_515014 ?auto_515021 ) ) ( not ( = ?auto_515014 ?auto_515022 ) ) ( not ( = ?auto_515014 ?auto_515023 ) ) ( not ( = ?auto_515014 ?auto_515024 ) ) ( not ( = ?auto_515014 ?auto_515025 ) ) ( not ( = ?auto_515015 ?auto_515016 ) ) ( not ( = ?auto_515015 ?auto_515017 ) ) ( not ( = ?auto_515015 ?auto_515018 ) ) ( not ( = ?auto_515015 ?auto_515019 ) ) ( not ( = ?auto_515015 ?auto_515020 ) ) ( not ( = ?auto_515015 ?auto_515021 ) ) ( not ( = ?auto_515015 ?auto_515022 ) ) ( not ( = ?auto_515015 ?auto_515023 ) ) ( not ( = ?auto_515015 ?auto_515024 ) ) ( not ( = ?auto_515015 ?auto_515025 ) ) ( not ( = ?auto_515016 ?auto_515017 ) ) ( not ( = ?auto_515016 ?auto_515018 ) ) ( not ( = ?auto_515016 ?auto_515019 ) ) ( not ( = ?auto_515016 ?auto_515020 ) ) ( not ( = ?auto_515016 ?auto_515021 ) ) ( not ( = ?auto_515016 ?auto_515022 ) ) ( not ( = ?auto_515016 ?auto_515023 ) ) ( not ( = ?auto_515016 ?auto_515024 ) ) ( not ( = ?auto_515016 ?auto_515025 ) ) ( not ( = ?auto_515017 ?auto_515018 ) ) ( not ( = ?auto_515017 ?auto_515019 ) ) ( not ( = ?auto_515017 ?auto_515020 ) ) ( not ( = ?auto_515017 ?auto_515021 ) ) ( not ( = ?auto_515017 ?auto_515022 ) ) ( not ( = ?auto_515017 ?auto_515023 ) ) ( not ( = ?auto_515017 ?auto_515024 ) ) ( not ( = ?auto_515017 ?auto_515025 ) ) ( not ( = ?auto_515018 ?auto_515019 ) ) ( not ( = ?auto_515018 ?auto_515020 ) ) ( not ( = ?auto_515018 ?auto_515021 ) ) ( not ( = ?auto_515018 ?auto_515022 ) ) ( not ( = ?auto_515018 ?auto_515023 ) ) ( not ( = ?auto_515018 ?auto_515024 ) ) ( not ( = ?auto_515018 ?auto_515025 ) ) ( not ( = ?auto_515019 ?auto_515020 ) ) ( not ( = ?auto_515019 ?auto_515021 ) ) ( not ( = ?auto_515019 ?auto_515022 ) ) ( not ( = ?auto_515019 ?auto_515023 ) ) ( not ( = ?auto_515019 ?auto_515024 ) ) ( not ( = ?auto_515019 ?auto_515025 ) ) ( not ( = ?auto_515020 ?auto_515021 ) ) ( not ( = ?auto_515020 ?auto_515022 ) ) ( not ( = ?auto_515020 ?auto_515023 ) ) ( not ( = ?auto_515020 ?auto_515024 ) ) ( not ( = ?auto_515020 ?auto_515025 ) ) ( not ( = ?auto_515021 ?auto_515022 ) ) ( not ( = ?auto_515021 ?auto_515023 ) ) ( not ( = ?auto_515021 ?auto_515024 ) ) ( not ( = ?auto_515021 ?auto_515025 ) ) ( not ( = ?auto_515022 ?auto_515023 ) ) ( not ( = ?auto_515022 ?auto_515024 ) ) ( not ( = ?auto_515022 ?auto_515025 ) ) ( not ( = ?auto_515023 ?auto_515024 ) ) ( not ( = ?auto_515023 ?auto_515025 ) ) ( not ( = ?auto_515024 ?auto_515025 ) ) ( ON ?auto_515024 ?auto_515025 ) ( ON ?auto_515023 ?auto_515024 ) ( ON ?auto_515022 ?auto_515023 ) ( ON ?auto_515021 ?auto_515022 ) ( ON ?auto_515020 ?auto_515021 ) ( ON ?auto_515019 ?auto_515020 ) ( ON ?auto_515018 ?auto_515019 ) ( ON ?auto_515017 ?auto_515018 ) ( ON ?auto_515016 ?auto_515017 ) ( ON ?auto_515015 ?auto_515016 ) ( ON ?auto_515014 ?auto_515015 ) ( ON ?auto_515013 ?auto_515014 ) ( ON ?auto_515012 ?auto_515013 ) ( CLEAR ?auto_515010 ) ( ON ?auto_515011 ?auto_515012 ) ( CLEAR ?auto_515011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515010 ?auto_515011 )
      ( MAKE-16PILE ?auto_515010 ?auto_515011 ?auto_515012 ?auto_515013 ?auto_515014 ?auto_515015 ?auto_515016 ?auto_515017 ?auto_515018 ?auto_515019 ?auto_515020 ?auto_515021 ?auto_515022 ?auto_515023 ?auto_515024 ?auto_515025 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_515042 - BLOCK
      ?auto_515043 - BLOCK
      ?auto_515044 - BLOCK
      ?auto_515045 - BLOCK
      ?auto_515046 - BLOCK
      ?auto_515047 - BLOCK
      ?auto_515048 - BLOCK
      ?auto_515049 - BLOCK
      ?auto_515050 - BLOCK
      ?auto_515051 - BLOCK
      ?auto_515052 - BLOCK
      ?auto_515053 - BLOCK
      ?auto_515054 - BLOCK
      ?auto_515055 - BLOCK
      ?auto_515056 - BLOCK
      ?auto_515057 - BLOCK
    )
    :vars
    (
      ?auto_515058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515057 ?auto_515058 ) ( not ( = ?auto_515042 ?auto_515043 ) ) ( not ( = ?auto_515042 ?auto_515044 ) ) ( not ( = ?auto_515042 ?auto_515045 ) ) ( not ( = ?auto_515042 ?auto_515046 ) ) ( not ( = ?auto_515042 ?auto_515047 ) ) ( not ( = ?auto_515042 ?auto_515048 ) ) ( not ( = ?auto_515042 ?auto_515049 ) ) ( not ( = ?auto_515042 ?auto_515050 ) ) ( not ( = ?auto_515042 ?auto_515051 ) ) ( not ( = ?auto_515042 ?auto_515052 ) ) ( not ( = ?auto_515042 ?auto_515053 ) ) ( not ( = ?auto_515042 ?auto_515054 ) ) ( not ( = ?auto_515042 ?auto_515055 ) ) ( not ( = ?auto_515042 ?auto_515056 ) ) ( not ( = ?auto_515042 ?auto_515057 ) ) ( not ( = ?auto_515042 ?auto_515058 ) ) ( not ( = ?auto_515043 ?auto_515044 ) ) ( not ( = ?auto_515043 ?auto_515045 ) ) ( not ( = ?auto_515043 ?auto_515046 ) ) ( not ( = ?auto_515043 ?auto_515047 ) ) ( not ( = ?auto_515043 ?auto_515048 ) ) ( not ( = ?auto_515043 ?auto_515049 ) ) ( not ( = ?auto_515043 ?auto_515050 ) ) ( not ( = ?auto_515043 ?auto_515051 ) ) ( not ( = ?auto_515043 ?auto_515052 ) ) ( not ( = ?auto_515043 ?auto_515053 ) ) ( not ( = ?auto_515043 ?auto_515054 ) ) ( not ( = ?auto_515043 ?auto_515055 ) ) ( not ( = ?auto_515043 ?auto_515056 ) ) ( not ( = ?auto_515043 ?auto_515057 ) ) ( not ( = ?auto_515043 ?auto_515058 ) ) ( not ( = ?auto_515044 ?auto_515045 ) ) ( not ( = ?auto_515044 ?auto_515046 ) ) ( not ( = ?auto_515044 ?auto_515047 ) ) ( not ( = ?auto_515044 ?auto_515048 ) ) ( not ( = ?auto_515044 ?auto_515049 ) ) ( not ( = ?auto_515044 ?auto_515050 ) ) ( not ( = ?auto_515044 ?auto_515051 ) ) ( not ( = ?auto_515044 ?auto_515052 ) ) ( not ( = ?auto_515044 ?auto_515053 ) ) ( not ( = ?auto_515044 ?auto_515054 ) ) ( not ( = ?auto_515044 ?auto_515055 ) ) ( not ( = ?auto_515044 ?auto_515056 ) ) ( not ( = ?auto_515044 ?auto_515057 ) ) ( not ( = ?auto_515044 ?auto_515058 ) ) ( not ( = ?auto_515045 ?auto_515046 ) ) ( not ( = ?auto_515045 ?auto_515047 ) ) ( not ( = ?auto_515045 ?auto_515048 ) ) ( not ( = ?auto_515045 ?auto_515049 ) ) ( not ( = ?auto_515045 ?auto_515050 ) ) ( not ( = ?auto_515045 ?auto_515051 ) ) ( not ( = ?auto_515045 ?auto_515052 ) ) ( not ( = ?auto_515045 ?auto_515053 ) ) ( not ( = ?auto_515045 ?auto_515054 ) ) ( not ( = ?auto_515045 ?auto_515055 ) ) ( not ( = ?auto_515045 ?auto_515056 ) ) ( not ( = ?auto_515045 ?auto_515057 ) ) ( not ( = ?auto_515045 ?auto_515058 ) ) ( not ( = ?auto_515046 ?auto_515047 ) ) ( not ( = ?auto_515046 ?auto_515048 ) ) ( not ( = ?auto_515046 ?auto_515049 ) ) ( not ( = ?auto_515046 ?auto_515050 ) ) ( not ( = ?auto_515046 ?auto_515051 ) ) ( not ( = ?auto_515046 ?auto_515052 ) ) ( not ( = ?auto_515046 ?auto_515053 ) ) ( not ( = ?auto_515046 ?auto_515054 ) ) ( not ( = ?auto_515046 ?auto_515055 ) ) ( not ( = ?auto_515046 ?auto_515056 ) ) ( not ( = ?auto_515046 ?auto_515057 ) ) ( not ( = ?auto_515046 ?auto_515058 ) ) ( not ( = ?auto_515047 ?auto_515048 ) ) ( not ( = ?auto_515047 ?auto_515049 ) ) ( not ( = ?auto_515047 ?auto_515050 ) ) ( not ( = ?auto_515047 ?auto_515051 ) ) ( not ( = ?auto_515047 ?auto_515052 ) ) ( not ( = ?auto_515047 ?auto_515053 ) ) ( not ( = ?auto_515047 ?auto_515054 ) ) ( not ( = ?auto_515047 ?auto_515055 ) ) ( not ( = ?auto_515047 ?auto_515056 ) ) ( not ( = ?auto_515047 ?auto_515057 ) ) ( not ( = ?auto_515047 ?auto_515058 ) ) ( not ( = ?auto_515048 ?auto_515049 ) ) ( not ( = ?auto_515048 ?auto_515050 ) ) ( not ( = ?auto_515048 ?auto_515051 ) ) ( not ( = ?auto_515048 ?auto_515052 ) ) ( not ( = ?auto_515048 ?auto_515053 ) ) ( not ( = ?auto_515048 ?auto_515054 ) ) ( not ( = ?auto_515048 ?auto_515055 ) ) ( not ( = ?auto_515048 ?auto_515056 ) ) ( not ( = ?auto_515048 ?auto_515057 ) ) ( not ( = ?auto_515048 ?auto_515058 ) ) ( not ( = ?auto_515049 ?auto_515050 ) ) ( not ( = ?auto_515049 ?auto_515051 ) ) ( not ( = ?auto_515049 ?auto_515052 ) ) ( not ( = ?auto_515049 ?auto_515053 ) ) ( not ( = ?auto_515049 ?auto_515054 ) ) ( not ( = ?auto_515049 ?auto_515055 ) ) ( not ( = ?auto_515049 ?auto_515056 ) ) ( not ( = ?auto_515049 ?auto_515057 ) ) ( not ( = ?auto_515049 ?auto_515058 ) ) ( not ( = ?auto_515050 ?auto_515051 ) ) ( not ( = ?auto_515050 ?auto_515052 ) ) ( not ( = ?auto_515050 ?auto_515053 ) ) ( not ( = ?auto_515050 ?auto_515054 ) ) ( not ( = ?auto_515050 ?auto_515055 ) ) ( not ( = ?auto_515050 ?auto_515056 ) ) ( not ( = ?auto_515050 ?auto_515057 ) ) ( not ( = ?auto_515050 ?auto_515058 ) ) ( not ( = ?auto_515051 ?auto_515052 ) ) ( not ( = ?auto_515051 ?auto_515053 ) ) ( not ( = ?auto_515051 ?auto_515054 ) ) ( not ( = ?auto_515051 ?auto_515055 ) ) ( not ( = ?auto_515051 ?auto_515056 ) ) ( not ( = ?auto_515051 ?auto_515057 ) ) ( not ( = ?auto_515051 ?auto_515058 ) ) ( not ( = ?auto_515052 ?auto_515053 ) ) ( not ( = ?auto_515052 ?auto_515054 ) ) ( not ( = ?auto_515052 ?auto_515055 ) ) ( not ( = ?auto_515052 ?auto_515056 ) ) ( not ( = ?auto_515052 ?auto_515057 ) ) ( not ( = ?auto_515052 ?auto_515058 ) ) ( not ( = ?auto_515053 ?auto_515054 ) ) ( not ( = ?auto_515053 ?auto_515055 ) ) ( not ( = ?auto_515053 ?auto_515056 ) ) ( not ( = ?auto_515053 ?auto_515057 ) ) ( not ( = ?auto_515053 ?auto_515058 ) ) ( not ( = ?auto_515054 ?auto_515055 ) ) ( not ( = ?auto_515054 ?auto_515056 ) ) ( not ( = ?auto_515054 ?auto_515057 ) ) ( not ( = ?auto_515054 ?auto_515058 ) ) ( not ( = ?auto_515055 ?auto_515056 ) ) ( not ( = ?auto_515055 ?auto_515057 ) ) ( not ( = ?auto_515055 ?auto_515058 ) ) ( not ( = ?auto_515056 ?auto_515057 ) ) ( not ( = ?auto_515056 ?auto_515058 ) ) ( not ( = ?auto_515057 ?auto_515058 ) ) ( ON ?auto_515056 ?auto_515057 ) ( ON ?auto_515055 ?auto_515056 ) ( ON ?auto_515054 ?auto_515055 ) ( ON ?auto_515053 ?auto_515054 ) ( ON ?auto_515052 ?auto_515053 ) ( ON ?auto_515051 ?auto_515052 ) ( ON ?auto_515050 ?auto_515051 ) ( ON ?auto_515049 ?auto_515050 ) ( ON ?auto_515048 ?auto_515049 ) ( ON ?auto_515047 ?auto_515048 ) ( ON ?auto_515046 ?auto_515047 ) ( ON ?auto_515045 ?auto_515046 ) ( ON ?auto_515044 ?auto_515045 ) ( ON ?auto_515043 ?auto_515044 ) ( ON ?auto_515042 ?auto_515043 ) ( CLEAR ?auto_515042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515042 )
      ( MAKE-16PILE ?auto_515042 ?auto_515043 ?auto_515044 ?auto_515045 ?auto_515046 ?auto_515047 ?auto_515048 ?auto_515049 ?auto_515050 ?auto_515051 ?auto_515052 ?auto_515053 ?auto_515054 ?auto_515055 ?auto_515056 ?auto_515057 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_515075 - BLOCK
      ?auto_515076 - BLOCK
      ?auto_515077 - BLOCK
      ?auto_515078 - BLOCK
      ?auto_515079 - BLOCK
      ?auto_515080 - BLOCK
      ?auto_515081 - BLOCK
      ?auto_515082 - BLOCK
      ?auto_515083 - BLOCK
      ?auto_515084 - BLOCK
      ?auto_515085 - BLOCK
      ?auto_515086 - BLOCK
      ?auto_515087 - BLOCK
      ?auto_515088 - BLOCK
      ?auto_515089 - BLOCK
      ?auto_515090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_515090 ) ( not ( = ?auto_515075 ?auto_515076 ) ) ( not ( = ?auto_515075 ?auto_515077 ) ) ( not ( = ?auto_515075 ?auto_515078 ) ) ( not ( = ?auto_515075 ?auto_515079 ) ) ( not ( = ?auto_515075 ?auto_515080 ) ) ( not ( = ?auto_515075 ?auto_515081 ) ) ( not ( = ?auto_515075 ?auto_515082 ) ) ( not ( = ?auto_515075 ?auto_515083 ) ) ( not ( = ?auto_515075 ?auto_515084 ) ) ( not ( = ?auto_515075 ?auto_515085 ) ) ( not ( = ?auto_515075 ?auto_515086 ) ) ( not ( = ?auto_515075 ?auto_515087 ) ) ( not ( = ?auto_515075 ?auto_515088 ) ) ( not ( = ?auto_515075 ?auto_515089 ) ) ( not ( = ?auto_515075 ?auto_515090 ) ) ( not ( = ?auto_515076 ?auto_515077 ) ) ( not ( = ?auto_515076 ?auto_515078 ) ) ( not ( = ?auto_515076 ?auto_515079 ) ) ( not ( = ?auto_515076 ?auto_515080 ) ) ( not ( = ?auto_515076 ?auto_515081 ) ) ( not ( = ?auto_515076 ?auto_515082 ) ) ( not ( = ?auto_515076 ?auto_515083 ) ) ( not ( = ?auto_515076 ?auto_515084 ) ) ( not ( = ?auto_515076 ?auto_515085 ) ) ( not ( = ?auto_515076 ?auto_515086 ) ) ( not ( = ?auto_515076 ?auto_515087 ) ) ( not ( = ?auto_515076 ?auto_515088 ) ) ( not ( = ?auto_515076 ?auto_515089 ) ) ( not ( = ?auto_515076 ?auto_515090 ) ) ( not ( = ?auto_515077 ?auto_515078 ) ) ( not ( = ?auto_515077 ?auto_515079 ) ) ( not ( = ?auto_515077 ?auto_515080 ) ) ( not ( = ?auto_515077 ?auto_515081 ) ) ( not ( = ?auto_515077 ?auto_515082 ) ) ( not ( = ?auto_515077 ?auto_515083 ) ) ( not ( = ?auto_515077 ?auto_515084 ) ) ( not ( = ?auto_515077 ?auto_515085 ) ) ( not ( = ?auto_515077 ?auto_515086 ) ) ( not ( = ?auto_515077 ?auto_515087 ) ) ( not ( = ?auto_515077 ?auto_515088 ) ) ( not ( = ?auto_515077 ?auto_515089 ) ) ( not ( = ?auto_515077 ?auto_515090 ) ) ( not ( = ?auto_515078 ?auto_515079 ) ) ( not ( = ?auto_515078 ?auto_515080 ) ) ( not ( = ?auto_515078 ?auto_515081 ) ) ( not ( = ?auto_515078 ?auto_515082 ) ) ( not ( = ?auto_515078 ?auto_515083 ) ) ( not ( = ?auto_515078 ?auto_515084 ) ) ( not ( = ?auto_515078 ?auto_515085 ) ) ( not ( = ?auto_515078 ?auto_515086 ) ) ( not ( = ?auto_515078 ?auto_515087 ) ) ( not ( = ?auto_515078 ?auto_515088 ) ) ( not ( = ?auto_515078 ?auto_515089 ) ) ( not ( = ?auto_515078 ?auto_515090 ) ) ( not ( = ?auto_515079 ?auto_515080 ) ) ( not ( = ?auto_515079 ?auto_515081 ) ) ( not ( = ?auto_515079 ?auto_515082 ) ) ( not ( = ?auto_515079 ?auto_515083 ) ) ( not ( = ?auto_515079 ?auto_515084 ) ) ( not ( = ?auto_515079 ?auto_515085 ) ) ( not ( = ?auto_515079 ?auto_515086 ) ) ( not ( = ?auto_515079 ?auto_515087 ) ) ( not ( = ?auto_515079 ?auto_515088 ) ) ( not ( = ?auto_515079 ?auto_515089 ) ) ( not ( = ?auto_515079 ?auto_515090 ) ) ( not ( = ?auto_515080 ?auto_515081 ) ) ( not ( = ?auto_515080 ?auto_515082 ) ) ( not ( = ?auto_515080 ?auto_515083 ) ) ( not ( = ?auto_515080 ?auto_515084 ) ) ( not ( = ?auto_515080 ?auto_515085 ) ) ( not ( = ?auto_515080 ?auto_515086 ) ) ( not ( = ?auto_515080 ?auto_515087 ) ) ( not ( = ?auto_515080 ?auto_515088 ) ) ( not ( = ?auto_515080 ?auto_515089 ) ) ( not ( = ?auto_515080 ?auto_515090 ) ) ( not ( = ?auto_515081 ?auto_515082 ) ) ( not ( = ?auto_515081 ?auto_515083 ) ) ( not ( = ?auto_515081 ?auto_515084 ) ) ( not ( = ?auto_515081 ?auto_515085 ) ) ( not ( = ?auto_515081 ?auto_515086 ) ) ( not ( = ?auto_515081 ?auto_515087 ) ) ( not ( = ?auto_515081 ?auto_515088 ) ) ( not ( = ?auto_515081 ?auto_515089 ) ) ( not ( = ?auto_515081 ?auto_515090 ) ) ( not ( = ?auto_515082 ?auto_515083 ) ) ( not ( = ?auto_515082 ?auto_515084 ) ) ( not ( = ?auto_515082 ?auto_515085 ) ) ( not ( = ?auto_515082 ?auto_515086 ) ) ( not ( = ?auto_515082 ?auto_515087 ) ) ( not ( = ?auto_515082 ?auto_515088 ) ) ( not ( = ?auto_515082 ?auto_515089 ) ) ( not ( = ?auto_515082 ?auto_515090 ) ) ( not ( = ?auto_515083 ?auto_515084 ) ) ( not ( = ?auto_515083 ?auto_515085 ) ) ( not ( = ?auto_515083 ?auto_515086 ) ) ( not ( = ?auto_515083 ?auto_515087 ) ) ( not ( = ?auto_515083 ?auto_515088 ) ) ( not ( = ?auto_515083 ?auto_515089 ) ) ( not ( = ?auto_515083 ?auto_515090 ) ) ( not ( = ?auto_515084 ?auto_515085 ) ) ( not ( = ?auto_515084 ?auto_515086 ) ) ( not ( = ?auto_515084 ?auto_515087 ) ) ( not ( = ?auto_515084 ?auto_515088 ) ) ( not ( = ?auto_515084 ?auto_515089 ) ) ( not ( = ?auto_515084 ?auto_515090 ) ) ( not ( = ?auto_515085 ?auto_515086 ) ) ( not ( = ?auto_515085 ?auto_515087 ) ) ( not ( = ?auto_515085 ?auto_515088 ) ) ( not ( = ?auto_515085 ?auto_515089 ) ) ( not ( = ?auto_515085 ?auto_515090 ) ) ( not ( = ?auto_515086 ?auto_515087 ) ) ( not ( = ?auto_515086 ?auto_515088 ) ) ( not ( = ?auto_515086 ?auto_515089 ) ) ( not ( = ?auto_515086 ?auto_515090 ) ) ( not ( = ?auto_515087 ?auto_515088 ) ) ( not ( = ?auto_515087 ?auto_515089 ) ) ( not ( = ?auto_515087 ?auto_515090 ) ) ( not ( = ?auto_515088 ?auto_515089 ) ) ( not ( = ?auto_515088 ?auto_515090 ) ) ( not ( = ?auto_515089 ?auto_515090 ) ) ( ON ?auto_515089 ?auto_515090 ) ( ON ?auto_515088 ?auto_515089 ) ( ON ?auto_515087 ?auto_515088 ) ( ON ?auto_515086 ?auto_515087 ) ( ON ?auto_515085 ?auto_515086 ) ( ON ?auto_515084 ?auto_515085 ) ( ON ?auto_515083 ?auto_515084 ) ( ON ?auto_515082 ?auto_515083 ) ( ON ?auto_515081 ?auto_515082 ) ( ON ?auto_515080 ?auto_515081 ) ( ON ?auto_515079 ?auto_515080 ) ( ON ?auto_515078 ?auto_515079 ) ( ON ?auto_515077 ?auto_515078 ) ( ON ?auto_515076 ?auto_515077 ) ( ON ?auto_515075 ?auto_515076 ) ( CLEAR ?auto_515075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515075 )
      ( MAKE-16PILE ?auto_515075 ?auto_515076 ?auto_515077 ?auto_515078 ?auto_515079 ?auto_515080 ?auto_515081 ?auto_515082 ?auto_515083 ?auto_515084 ?auto_515085 ?auto_515086 ?auto_515087 ?auto_515088 ?auto_515089 ?auto_515090 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_515107 - BLOCK
      ?auto_515108 - BLOCK
      ?auto_515109 - BLOCK
      ?auto_515110 - BLOCK
      ?auto_515111 - BLOCK
      ?auto_515112 - BLOCK
      ?auto_515113 - BLOCK
      ?auto_515114 - BLOCK
      ?auto_515115 - BLOCK
      ?auto_515116 - BLOCK
      ?auto_515117 - BLOCK
      ?auto_515118 - BLOCK
      ?auto_515119 - BLOCK
      ?auto_515120 - BLOCK
      ?auto_515121 - BLOCK
      ?auto_515122 - BLOCK
    )
    :vars
    (
      ?auto_515123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_515107 ?auto_515108 ) ) ( not ( = ?auto_515107 ?auto_515109 ) ) ( not ( = ?auto_515107 ?auto_515110 ) ) ( not ( = ?auto_515107 ?auto_515111 ) ) ( not ( = ?auto_515107 ?auto_515112 ) ) ( not ( = ?auto_515107 ?auto_515113 ) ) ( not ( = ?auto_515107 ?auto_515114 ) ) ( not ( = ?auto_515107 ?auto_515115 ) ) ( not ( = ?auto_515107 ?auto_515116 ) ) ( not ( = ?auto_515107 ?auto_515117 ) ) ( not ( = ?auto_515107 ?auto_515118 ) ) ( not ( = ?auto_515107 ?auto_515119 ) ) ( not ( = ?auto_515107 ?auto_515120 ) ) ( not ( = ?auto_515107 ?auto_515121 ) ) ( not ( = ?auto_515107 ?auto_515122 ) ) ( not ( = ?auto_515108 ?auto_515109 ) ) ( not ( = ?auto_515108 ?auto_515110 ) ) ( not ( = ?auto_515108 ?auto_515111 ) ) ( not ( = ?auto_515108 ?auto_515112 ) ) ( not ( = ?auto_515108 ?auto_515113 ) ) ( not ( = ?auto_515108 ?auto_515114 ) ) ( not ( = ?auto_515108 ?auto_515115 ) ) ( not ( = ?auto_515108 ?auto_515116 ) ) ( not ( = ?auto_515108 ?auto_515117 ) ) ( not ( = ?auto_515108 ?auto_515118 ) ) ( not ( = ?auto_515108 ?auto_515119 ) ) ( not ( = ?auto_515108 ?auto_515120 ) ) ( not ( = ?auto_515108 ?auto_515121 ) ) ( not ( = ?auto_515108 ?auto_515122 ) ) ( not ( = ?auto_515109 ?auto_515110 ) ) ( not ( = ?auto_515109 ?auto_515111 ) ) ( not ( = ?auto_515109 ?auto_515112 ) ) ( not ( = ?auto_515109 ?auto_515113 ) ) ( not ( = ?auto_515109 ?auto_515114 ) ) ( not ( = ?auto_515109 ?auto_515115 ) ) ( not ( = ?auto_515109 ?auto_515116 ) ) ( not ( = ?auto_515109 ?auto_515117 ) ) ( not ( = ?auto_515109 ?auto_515118 ) ) ( not ( = ?auto_515109 ?auto_515119 ) ) ( not ( = ?auto_515109 ?auto_515120 ) ) ( not ( = ?auto_515109 ?auto_515121 ) ) ( not ( = ?auto_515109 ?auto_515122 ) ) ( not ( = ?auto_515110 ?auto_515111 ) ) ( not ( = ?auto_515110 ?auto_515112 ) ) ( not ( = ?auto_515110 ?auto_515113 ) ) ( not ( = ?auto_515110 ?auto_515114 ) ) ( not ( = ?auto_515110 ?auto_515115 ) ) ( not ( = ?auto_515110 ?auto_515116 ) ) ( not ( = ?auto_515110 ?auto_515117 ) ) ( not ( = ?auto_515110 ?auto_515118 ) ) ( not ( = ?auto_515110 ?auto_515119 ) ) ( not ( = ?auto_515110 ?auto_515120 ) ) ( not ( = ?auto_515110 ?auto_515121 ) ) ( not ( = ?auto_515110 ?auto_515122 ) ) ( not ( = ?auto_515111 ?auto_515112 ) ) ( not ( = ?auto_515111 ?auto_515113 ) ) ( not ( = ?auto_515111 ?auto_515114 ) ) ( not ( = ?auto_515111 ?auto_515115 ) ) ( not ( = ?auto_515111 ?auto_515116 ) ) ( not ( = ?auto_515111 ?auto_515117 ) ) ( not ( = ?auto_515111 ?auto_515118 ) ) ( not ( = ?auto_515111 ?auto_515119 ) ) ( not ( = ?auto_515111 ?auto_515120 ) ) ( not ( = ?auto_515111 ?auto_515121 ) ) ( not ( = ?auto_515111 ?auto_515122 ) ) ( not ( = ?auto_515112 ?auto_515113 ) ) ( not ( = ?auto_515112 ?auto_515114 ) ) ( not ( = ?auto_515112 ?auto_515115 ) ) ( not ( = ?auto_515112 ?auto_515116 ) ) ( not ( = ?auto_515112 ?auto_515117 ) ) ( not ( = ?auto_515112 ?auto_515118 ) ) ( not ( = ?auto_515112 ?auto_515119 ) ) ( not ( = ?auto_515112 ?auto_515120 ) ) ( not ( = ?auto_515112 ?auto_515121 ) ) ( not ( = ?auto_515112 ?auto_515122 ) ) ( not ( = ?auto_515113 ?auto_515114 ) ) ( not ( = ?auto_515113 ?auto_515115 ) ) ( not ( = ?auto_515113 ?auto_515116 ) ) ( not ( = ?auto_515113 ?auto_515117 ) ) ( not ( = ?auto_515113 ?auto_515118 ) ) ( not ( = ?auto_515113 ?auto_515119 ) ) ( not ( = ?auto_515113 ?auto_515120 ) ) ( not ( = ?auto_515113 ?auto_515121 ) ) ( not ( = ?auto_515113 ?auto_515122 ) ) ( not ( = ?auto_515114 ?auto_515115 ) ) ( not ( = ?auto_515114 ?auto_515116 ) ) ( not ( = ?auto_515114 ?auto_515117 ) ) ( not ( = ?auto_515114 ?auto_515118 ) ) ( not ( = ?auto_515114 ?auto_515119 ) ) ( not ( = ?auto_515114 ?auto_515120 ) ) ( not ( = ?auto_515114 ?auto_515121 ) ) ( not ( = ?auto_515114 ?auto_515122 ) ) ( not ( = ?auto_515115 ?auto_515116 ) ) ( not ( = ?auto_515115 ?auto_515117 ) ) ( not ( = ?auto_515115 ?auto_515118 ) ) ( not ( = ?auto_515115 ?auto_515119 ) ) ( not ( = ?auto_515115 ?auto_515120 ) ) ( not ( = ?auto_515115 ?auto_515121 ) ) ( not ( = ?auto_515115 ?auto_515122 ) ) ( not ( = ?auto_515116 ?auto_515117 ) ) ( not ( = ?auto_515116 ?auto_515118 ) ) ( not ( = ?auto_515116 ?auto_515119 ) ) ( not ( = ?auto_515116 ?auto_515120 ) ) ( not ( = ?auto_515116 ?auto_515121 ) ) ( not ( = ?auto_515116 ?auto_515122 ) ) ( not ( = ?auto_515117 ?auto_515118 ) ) ( not ( = ?auto_515117 ?auto_515119 ) ) ( not ( = ?auto_515117 ?auto_515120 ) ) ( not ( = ?auto_515117 ?auto_515121 ) ) ( not ( = ?auto_515117 ?auto_515122 ) ) ( not ( = ?auto_515118 ?auto_515119 ) ) ( not ( = ?auto_515118 ?auto_515120 ) ) ( not ( = ?auto_515118 ?auto_515121 ) ) ( not ( = ?auto_515118 ?auto_515122 ) ) ( not ( = ?auto_515119 ?auto_515120 ) ) ( not ( = ?auto_515119 ?auto_515121 ) ) ( not ( = ?auto_515119 ?auto_515122 ) ) ( not ( = ?auto_515120 ?auto_515121 ) ) ( not ( = ?auto_515120 ?auto_515122 ) ) ( not ( = ?auto_515121 ?auto_515122 ) ) ( ON ?auto_515107 ?auto_515123 ) ( not ( = ?auto_515122 ?auto_515123 ) ) ( not ( = ?auto_515121 ?auto_515123 ) ) ( not ( = ?auto_515120 ?auto_515123 ) ) ( not ( = ?auto_515119 ?auto_515123 ) ) ( not ( = ?auto_515118 ?auto_515123 ) ) ( not ( = ?auto_515117 ?auto_515123 ) ) ( not ( = ?auto_515116 ?auto_515123 ) ) ( not ( = ?auto_515115 ?auto_515123 ) ) ( not ( = ?auto_515114 ?auto_515123 ) ) ( not ( = ?auto_515113 ?auto_515123 ) ) ( not ( = ?auto_515112 ?auto_515123 ) ) ( not ( = ?auto_515111 ?auto_515123 ) ) ( not ( = ?auto_515110 ?auto_515123 ) ) ( not ( = ?auto_515109 ?auto_515123 ) ) ( not ( = ?auto_515108 ?auto_515123 ) ) ( not ( = ?auto_515107 ?auto_515123 ) ) ( ON ?auto_515108 ?auto_515107 ) ( ON ?auto_515109 ?auto_515108 ) ( ON ?auto_515110 ?auto_515109 ) ( ON ?auto_515111 ?auto_515110 ) ( ON ?auto_515112 ?auto_515111 ) ( ON ?auto_515113 ?auto_515112 ) ( ON ?auto_515114 ?auto_515113 ) ( ON ?auto_515115 ?auto_515114 ) ( ON ?auto_515116 ?auto_515115 ) ( ON ?auto_515117 ?auto_515116 ) ( ON ?auto_515118 ?auto_515117 ) ( ON ?auto_515119 ?auto_515118 ) ( ON ?auto_515120 ?auto_515119 ) ( ON ?auto_515121 ?auto_515120 ) ( ON ?auto_515122 ?auto_515121 ) ( CLEAR ?auto_515122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_515122 ?auto_515121 ?auto_515120 ?auto_515119 ?auto_515118 ?auto_515117 ?auto_515116 ?auto_515115 ?auto_515114 ?auto_515113 ?auto_515112 ?auto_515111 ?auto_515110 ?auto_515109 ?auto_515108 ?auto_515107 )
      ( MAKE-16PILE ?auto_515107 ?auto_515108 ?auto_515109 ?auto_515110 ?auto_515111 ?auto_515112 ?auto_515113 ?auto_515114 ?auto_515115 ?auto_515116 ?auto_515117 ?auto_515118 ?auto_515119 ?auto_515120 ?auto_515121 ?auto_515122 ) )
  )

)

